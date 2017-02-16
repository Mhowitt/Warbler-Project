from flask import redirect, render_template, request, url_for, Blueprint 
from project.users.models import User
from project.users.forms import UserForm
from project import db

users_blueprint = Blueprint(
  'users',
  __name__,
  template_folder='templates'
)

@users_blueprint.route('/', methods=["GET", "POST"])
def index():
  if request.method == "POST":
    form = UserForm()
    if form.validate():
      new_user = User(
        username=form.username.data,
        email=form.email.data,
        image_url=form.image_url.data
      )
      db.session.add(new_user)
      db.session.commit()
      return redirect(url_for('users.index'))
    return render_template('users/new.html', form=form)
  return render_template('users/index.html', users=User.query.all())

@users_blueprint.route('/new')
def new():
  return render_template('users/new.html', form=UserForm())