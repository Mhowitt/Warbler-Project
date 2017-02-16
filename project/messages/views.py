from flask import Blueprint 
from project.messages.models import Message

messages_blueprint = Blueprint(
  'messages',
  __name__,
  template_folder='templates'
)