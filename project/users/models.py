from project import db, bcrypt
from flask_login import UserMixin

class User(db.Model, UserMixin):

  __tablename__ = 'users'

  id = db.Column(db.Integer, primary_key=True)
  email = db.Column(db.Text, unique=True)
  username = db.Column(db.Text, unique=True)
  image_url = db.Column(db.Text)
  password = db.Column(db.Text)
  messages = db.relationship('Message', backref='user', lazy='dynamic')

  def __init__(self, email, username, password, image_url='https://pbs.twimg.com/profile_images/524943875543420928/-0QwXz_i.jpeg'):
    self.email = email
    self.username = username
    self.image_url = image_url
    self.password = bcrypt.generate_password_hash(password).decode('UTF-8')