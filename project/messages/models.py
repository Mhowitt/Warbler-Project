from project import db
from datetime import datetime


class Message(db.Model):

    __tablename__ = 'messages'

    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.String(140))
    timestamp = db.Column(db.DateTime)
    user_id = db.Column(db.Integer,
                        db.ForeignKey('users.id', ondelete='CASCADE'))

    def __init__(self, text, user_id, timestamp=datetime.utcnow()):
        self.text = text
        self.user_id = user_id
        self.timestamp = timestamp
