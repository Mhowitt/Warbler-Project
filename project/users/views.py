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
            flash("Not Authorized")
            return redirect(url_for('root'))
        return fn(*args, **kwargs)
    return wrapper

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
        flash("Username already taken")
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
          flash("Hello, {}!".format(found_user.username))
          return redirect(url_for('root'))
      flash("Invalid credentials.")
      return render_template('users/login.html', form=form)
  return render_template('users/login.html', form=form)

@users_blueprint.route('/logout')
@login_required
def logout():
  logout_user()
  flash("See you next time! You have successfully logged out.")
  return redirect(url_for('users.login'))

@users_blueprint.route('/<int:id>/edit')
@login_required
@ensure_correct_user
def edit(id):
  return render_template('users/edit.html', form=UserForm(), user=User.query.get(id))

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
      flash("Wrong password, please try again.")
    return render_template('users/edit.html', form=form, user=found_user)
  if request.method == b"DELETE":
    db.session.delete(found_user)
    db.session.commit()
    return redirect(url_for('users.signup'))
  