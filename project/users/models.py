from project import db, bcrypt
from flask_login import UserMixin


FollowersFollowee = db.Table('follows',
                              db.Column('id',
                                        db.Integer,
                                        primary_key=True),
                              db.Column('followee_id',
                                        db.Integer,
                                        db.ForeignKey('users.id', ondelete="cascade")),
                              db.Column('follower_id',
                                        db.Integer,
                                        db.ForeignKey('users.id', ondelete="cascade")),
                              db.CheckConstraint('follower_id != followee_id', name="no_self_follow"))

class User(db.Model, UserMixin):

  __tablename__ = 'users'

  id = db.Column(db.Integer, primary_key=True)
  email = db.Column(db.Text, unique=True)
  username = db.Column(db.Text, unique=True)
  image_url = db.Column(db.Text)
  password = db.Column(db.Text)
  messages = db.relationship('Message', backref='user', lazy='dynamic')
  followers = db.relationship("User",
                              secondary=FollowersFollowee,
                              primaryjoin=(FollowersFollowee.c.follower_id == id),
                              secondaryjoin=(FollowersFollowee.c.followee_id == id),
                              backref=db.backref('followed', lazy='dynamic'),
                              lazy='dynamic')

  def __init__(self, email, username, password, image_url='https://pbs.twimg.com/profile_images/524943875543420928/-0QwXz_i.jpeg'):
    self.email = email
    self.username = username
    self.image_url = image_url
    self.password = bcrypt.generate_password_hash(password).decode('UTF-8')