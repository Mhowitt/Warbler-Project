from flask import redirect, render_template, request, url_for, Blueprint, flash
from project.users.models import User
from project.users.forms import UserForm, LoginForm
from project import db, bcrypt
from sqlalchemy.exc import IntegrityError
from flask_login import login_user, logout_user, current_user, login_required
from functools import wraps

users_blueprint = Blueprint(
  'users',
  __name__,
  template_folder='templates'
)

def ensure_correct_user(fn):
    @wraps(fn)
    def wrapper(*args, **kwargs):
        if kwargs.get('id') != current_user.id:
            flash({'text': "Not Authorized", 'status': 'danger'})
            return redirect(url_for('root'))
        return fn(*args, **kwargs)
    return wrapper

@users_blueprint.route('/', methods=["GET"])
def index():
  search = request.args.get('q')
  users = None
  if search is None or search == '':
    users = User.query.all()
  else:
    users = User.query.filter(User.username.like("%%%s%%" % search)).all()
  return render_template('users/index.html', users=users )

@users_blueprint.route('/signup', methods=["GET", "POST"])
def signup():
  form = UserForm()
  if request.method == "POST":
    if form.validate():
      try:
        new_user = User(
          username=form.username.data,
          email=form.email.data,
          password=form.password.data
        )
        if form.image_url.data:
          new_user.image_url = form.image_url.data
        db.session.add(new_user)
        db.session.commit()
        login_user(new_user)
      except IntegrityError as e:
        flash({'text': "Username already taken", 'status': 'danger'})
        return render_template('users/signup.html', form=form)
      return redirect(url_for('root'))
  return render_template('users/signup.html', form=form)

@users_blueprint.route('/login', methods=["GET", "POST"])
def login():
  form = LoginForm()
  if request.method == "POST":
    if form.validate():
      found_user = User.query.filter_by(username = form.username.data).first()
      if found_user:
        is_authenticated = bcrypt.check_password_hash(found_user.password, form.password.data)
        if is_authenticated:
          login_user(found_user)
          flash({'text': "Hello, {}!".format(found_user.username), 'status': 'success'})
          return redirect(url_for('root'))
      flash({'text': "Invalid credentials.", 'status': 'danger'})
      return render_template('users/login.html', form=form)
  return render_template('users/login.html', form=form)

@users_blueprint.route('/logout')
@login_required
def logout():
  logout_user()
  flash({ 'text': "You have successfully logged out.", 'status': 'success' })
  return redirect(url_for('users.login'))

@users_blueprint.route('/<int:id>/edit')
@login_required
@ensure_correct_user
def edit(id):
  return render_template('users/edit.html', form=UserForm(), user=User.query.get(id))

@users_blueprint.route('/<int:follower_id>/follower', methods=['POST', 'DELETE'])
@login_required
def follower(follower_id):
  followed = User.query.get(follower_id)
  if request.method == 'POST':
    current_user.following.append(followed)
  else:
    current_user.following.remove(followed)
  db.session.add(current_user)
  db.session.commit()
  return redirect(url_for('users.following'))

@users_blueprint.route('/following', methods=['GET'])
@login_required
def following():
  following = current_user.following
  return render_template('users/following.html', following=following)

@users_blueprint.route('/<int:id>', methods =["GET", "PATCH", "DELETE"])
def show(id):
  found_user = User.query.get(id)
  if request.method == 'GET' or current_user.is_anonymous or current_user.get_id() != str(id):
    return render_template('users/show.html', user=found_user)
  if request.method == b"PATCH":
    form = UserForm(request.form)
    if form.validate():
      if bcrypt.check_password_hash(found_user.password, form.password.data):
        found_user.username = form.username.data
        found_user.email = form.email.data
        found_user.image_url = form.image_url.data or None
        db.session.add(found_user)
        db.session.commit()
        return redirect(url_for('users.show', id=id))
      flash({ 'text': "Wrong password, please try again.", 'status': 'danger'})
    return render_template('users/edit.html', form=form, user=found_user)
  if request.method == b"DELETE":
    db.session.delete(found_user)
    db.session.commit()
    return redirect(url_for('users.signup'))
  