from flask import redirect, render_template, request, url_for, Blueprint 
from project.messages.models import Message

messages_blueprint = Blueprint(
  'messages',
  __name__,
  template_folder='templates'
)