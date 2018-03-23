from project import app, db
from project.users.models import User
from project.messages.models import Message, Like
from flask_testing import TestCase
import unittest


class BaseTestCase(TestCase):
    def create_app(self):
        app.config['WTF_CSRF_ENABLED'] = False
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///testing.db'
        return app

    def setUp(self):
        db.create_all()
        self.user1 = user1 = User(
            first_name="Miranda",
            last_name="Howitt",
            email="mhowitt@gmail.com",
            username="mirhow",
            bio="SUPES COOL",
            location="SF",
            password="passwords",
        )
        self.user2 = user2 = User(
            first_name="Paula",
            last_name="Goyanes",
            email="paulyg@gmail.com",
            username="PG",
            bio="SUPES COOLER",
            location="San Frisco",
            password="passwords2",
        )

        # user1.following.append(user2)
        user2.following.append(user1)
        db.session.add_all([user1, user2])
        db.session.commit()

        self.message1 = message1 = Message(text="Our first message", user_id=1)
        self.message2 = message2 = Message(
            text="Our second message", user_id=2)

        user1.likes_messages.append(message1)
        # user1.likes_messages.append(message2)
        db.session.add_all([message1, message2])
        db.session.commit()

    def tearDown(self):
        db.drop_all()

    def test_user_model_attributes(self):
        self.assertEqual(self.user1.first_name, "Miranda")
        self.assertEqual(self.user1.last_name, "Howitt")
        self.assertEqual(self.user1.email, "mhowitt@gmail.com")
        self.assertEqual(self.user1.username, "mirhow")
        self.assertEqual(self.user1.bio, "SUPES COOL")
        self.assertNotEqual(self.user1.location, "Miranda")

    def test_message_model_attributes(self):
        self.assertEqual(self.message1.text, "Our first message")
        self.assertEqual(self.message1.user_id, 1)

    def test_following_relationship(self):
        self.assertEqual(self.user2.following.first(), self.user1)
        self.assertEqual(self.user1.followers.first(), self.user2)

    def test_like_relationship(self):
        self.assertEqual(self.message1.likes_users.first(), self.user1)
        self.assertEqual(self.user1.likes_messages.first(), self.message1)

    def test_follow_methods(self):
        self.assertTrue(self.user1.is_followed_by(self.user2))
        self.assertFalse(self.user1.is_following(self.user2))

    def test_has_liked_method(self):
        self.assertTrue(self.user1.has_liked(1))
        self.assertFalse(self.user1.has_liked(2))

    def test_class_meth_auth(self):
        self.assertEqual(
            self.user1.authenticate("mirhow", "passwords"), self.user1)
        self.assertFalse(self.user1.authenticate("mirhow", "passwo"))

    if __name__ == '__main__':
        unittest.main()
