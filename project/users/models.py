from project import db 

class User(db.Model):

  __tablename__ = 'users'

  id = db.Column(db.Integer, primary_key=True)
  email = db.Column(db.Text)
  username = db.Column(db.Text)
  image_url = db.Column(db.Text, default='https://pbs.twimg.com/profile_images/524943875543420928/-0QwXz_i.jpeg')
  messages = db.relationship('Message', backref='user', lazy='dynamic')

  def __init__(self, email, username, image_url):
    self.email = email
    self.username = username
    self.image_url = image_url