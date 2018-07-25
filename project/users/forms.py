from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, widgets
from wtforms.validators import DataRequired, Email, Length


class UserForm(FlaskForm):
    first_name = StringField('First Name')
    last_name = StringField('Last Name')
    email = StringField('Email', validators=[DataRequired(), Email()])
    username = StringField('Username', validators=[DataRequired()])
    location = StringField('Location')
    bio = StringField(
        'Bio', validators=[Length(max=100)], widget=widgets.TextArea())
    image_url = StringField('Profile Picture')
    header_image_url = StringField('Header Image')
    password = PasswordField('password', validators=[Length(min=6)])


class LoginForm(FlaskForm):
    username = StringField('username', validators=[DataRequired()])
    password = PasswordField('password', validators=[Length(min=6)])
