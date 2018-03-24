from project import app, db
from project.users.models import User
from project.messages.models import Message
from flask_testing import TestCase
# from sqlalchemy.exc import IntegrityError
import unittest


class BaseTestCase(TestCase):
    def create_app(self):
        app.config['WTF_CSRF_ENABLED'] = False
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
        app.config['PRESERVE_CONTEXT_ON_EXCEPTION'] = False
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

        db.session.add_all([user1, user2])
        db.session.commit()

        message1 = Message(text="Our first message", user_id=2)
        message2 = Message(text="Our second message", user_id=2)

        user1.likes_messages.append(message1)
        db.session.add_all([message1, message2])
        db.session.commit()

    def tearDown(self):
        db.drop_all()

    def login(self, username, password):
        return self.client.post(
            '/users/login',
            data=dict(username=username, password=password),
            follow_redirects=True)

    def logout(self):
        return self.client.get('/users/logout', follow_redirects=True)

    def test_create_message(self):
        self.login('mirhow', 'passwords')
        response = self.client.post(
            '/users/1/messages/',
            data=dict(text="cat in the hat", user_id=1),
            follow_redirects=True)
        self.assertIn(b"cat in the hat", response.data)
        self.assertEqual(self.user1.messages.first().text, "cat in the hat")

    def test_new_page(self):
        self.login('mirhow', 'passwords')
        response = self.client.get('/users/1/messages/new')

        self.assertIn(b'Add my message!', response.data)

    def test_new_page_unauth(self):
        self.login('mirhow', 'passwords')
        response = self.client.get('/users/2/messages/new')
        self.assertNotIn(b'Add my message!', response.data)

    def test_message_show(self):
        self.login('mirhow', 'passwords')
        response = self.client.get('/users/2/messages/1')

        self.assertIn(b'Our first message', response.data)

    def test_message_delete(self):
        self.login('PG', 'passwords2')
        response = self.client.post(
            'users/2/messages/1?_method=DELETE', follow_redirects=True)
        self.assertNotIn(b'Our first message', response.data)

    def test_message_delete_unauth(self):
        self.login('mirhow', 'passwords')
        self.client.post(
            'users/2/messages/1?_method=DELETE', follow_redirects=True)
        response = self.client.get('users/2/messages/1')
        self.assertIn(b'Our first message', response.data)

    def test_likes(self):
        self.login('mirhow', 'passwords')
        response = self.client.get('users/1/messages/like')
        self.assertIn(b'PG', response.data)
        self.assertIn(b'Our first message', response.data)

    def test_liking(self):
        self.login('mirhow', 'passwords')
        self.client.post('/users/1/messages/1/like?_method=DELETE')
        self.client.post('/users/1/messages/2/like')

        self.assertEqual(self.user1.likes_messages.first().text,
                         "Our second message")


if __name__ == '__main__':
    unittest.main()
