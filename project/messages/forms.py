from flask_wtf import FlaskForm
from wtforms import StringField
from wtforms.widgets import TextArea
from wtforms.validators import DataRequired


class MessageForm(FlaskForm):
    text = StringField('text', validators=[DataRequired()], widget=TextArea())
