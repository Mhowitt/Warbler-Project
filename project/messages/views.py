from flask import redirect, render_template, request, url_for, Blueprint, jsonify
from project.messages.models import Message
from project.users.models import User
from project.users.views import ensure_correct_user
from project.messages.forms import MessageForm
from flask_login import current_user, login_required
from project import db

messages_blueprint = Blueprint(
    'messages', __name__, template_folder='templates')


@messages_blueprint.route('/', methods=["POST"])
@login_required
def index(id):
    if current_user.get_id() == str(id):
        form = MessageForm()
        if form.validate():
            new_message = Message(text=form.text.data, user_id=id)
            db.session.add(new_message)
            db.session.commit()
            return redirect(url_for('users.show', id=id))
    return render_template('messages/new.html', form=form)


@messages_blueprint.route('/new')
@login_required
@ensure_correct_user
def new(id):
    return render_template('messages/new.html', form=MessageForm())


@messages_blueprint.route('/<int:message_id>', methods=["GET", "DELETE"])
@login_required
def show(id, message_id):
    found_message = Message.query.get_or_404(message_id)
    user = User.query.get_or_404(current_user.id)
    if request.method == b"DELETE" and current_user.id == id:
        db.session.delete(found_message)
        db.session.commit()
        return redirect(url_for('users.show', id=id))
    return render_template(
        'messages/show.html', message=found_message, user=user)


@messages_blueprint.route('/<int:message_id>/like', methods=['POST', 'DELETE'])
@login_required
def liking(id, message_id):
    message = Message.query.get_or_404(message_id)
    user = User.query.get(current_user.id)
    if request.method == 'POST':
        user.likes_messages.append(message)
    else:
        user.likes_messages.remove(message)
    db.session.add(current_user)
    db.session.commit()
    return jsonify({'message': 'Like or Delike Completed'}, 200)
