from flask import redirect, render_template, request, url_for, Blueprint 
from project.messages.models import Message
from project.users.models import User 
from project.messages.forms import MessageForm
from project import db

messages_blueprint = Blueprint(
  'messages',
  __name__,
  template_folder='templates'
)

@messages_blueprint.route('/', methods=["GET", "POST"])
def index(id):
  if request.method == "POST":
    form = MessageForm()
    if form.validate():
      new_message = Message(
        text=form.text.data,
        user_id=id
      )
      db.session.add(new_message)
      db.session.commit()
      return redirect(url_for('messages.index', id=id))
    return render_template('messages/new.html', form=form)
  user = User.query.get(id)
  return render_template('messages/index.html', messages=user.messages, user=user)

@messages_blueprint.route('/new')
def new(id):
  return render_template('messages/new.html', form=MessageForm(), user_id=id)

@messages_blueprint.route('/<int:message_id>', methods =["GET", "DELETE"])
def show(id, message_id):
  found_message = Message.query.get(message_id)
  if request.method == b"DELETE":
    db.session.delete(found_message)
    db.session.commit()
    return redirect(url_for('messages.index', id=id))
  return render_template('messages/show.html', message=found_message)