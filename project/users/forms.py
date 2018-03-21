from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, widgets
from wtforms.validators import DataRequired, Email, Length


class UserForm(FlaskForm):
    first_name = StringField('first_name')
    last_name = StringField('last_name')
    email = StringField('email', validators=[DataRequired(), Email()])
    username = StringField('username', validators=[DataRequired()])
    location = StringField('last_name')
    bio = StringField(
        'bio', validators=[Length(max=100)], widget=widgets.TextArea())
    image_url = StringField('image_url')
    header_image_url = StringField('header_image_url')
    password = PasswordField('password', validators=[Length(min=6)])


class LoginForm(FlaskForm):
    username = StringField('username', validators=[DataRequired()])
    password = PasswordField('password', validators=[Length(min=6)])
