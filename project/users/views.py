from flask import redirect, render_template, request, url_for, Blueprint 
from project.users.models import User

users_blueprint = Blueprint(
  'users',
  __name__,
  template_folder='templates'
)

@users_blueprint.route('/', methods=["GET", "POST"])
def index():
  return render_template('users/index.html', users=User.query.all())