from project import app, db
from project.users.models import User
from project.messages.models import Message
from flask_testing import TestCase
from sqlalchemy.exc import IntegrityError
import unittest


class BaseTestCase(TestCase):
    def create_app(self):
        app.config['WTF_CSRF_ENABLED'] = False
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
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

        message1 = Message(text="Our first message", user_id=1)
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

    def test_root_anonymous(self):
        response = self.client.get('/')
        self.assertEquals(response.status_code, 200)
        self.assertIn(b'New to Warbler?', response.data)

    def test_root_authenticated(self):
        response = self.login('mirhow', 'passwords')
        self.assertEquals(response.status_code, 200)
        self.assertIn(b'@mirhow', response.data)

    def test_signup_get(self):
        response = self.client.get('/users/signup')
        self.assertEquals(response.status_code, 200)
        self.assertIn(b'Sign me up!', response.data)

    def test_signup_post(self):
        response = self.client.post(
            '/users/signup',
            data=dict(
                username='testuser',
                email='test@example.com',
                password='password'),
            follow_redirects=True)
        self.assertEquals(response.status_code, 200)
        self.assertIn(b'@testuser', response.data)

        self.client.post(
            '/users/signup',
            data=dict(
                username='testuser',
                email='test@example.com',
                password='password'))
        self.assertRaises(IntegrityError)

    def test_signup_prevent_login_decorator(self):
        self.login('mirhow', 'passwords')
        response = self.client.get('/users/signup')
        self.assertNotIn(b'Log in', response.data)

    def test_login_get(self):
        response = self.client.get('/users/login')
        self.assertIn(b'Log in', response.data)

    def test_login_post(self):
        response = self.login('mirhow', 'passwords')
        self.assertIn(b'@mirhow', response.data)

    def test_login_invalid(self):
        response = self.login('mirhow', 'notpassword')
        self.assertIn(b'Invalid', response.data)

    def test_logout(self):
        response = self.logout()
        self.assertIn(b'Welcome back.', response.data)

    def test_edit_page_authenticated_authorized(self):
        self.login('mirhow', 'passwords')
        response = self.client.get('/users/1/edit')
        self.assertIn(b'Edit Your Profile.', response.data)

    def test_edit_page_not_authenticated(self):
        response = self.client.get('/users/1/edit', follow_redirects=True)
        self.assertIn(b'Welcome back.', response.data)

    def test_edit_page_not_authorized(self):
        self.login('mirhow', 'passwords')
        response = self.client.get('/users/2/edit', follow_redirects=True)
        self.assertNotIn(b'Edit Your Profile.', response.data)

    def test_followers(self):
        self.login('mirhow', 'passwords')
        self.client.post('users/2/follower', follow_redirects=True)
        self.assertTrue(self.user1.is_following(self.user2))

        response = self.client.get('users/2/followers')
        self.assertIn(b'@mirhow', response.data)

    def test_following(self):
        self.login('mirhow', 'passwords')
        self.client.post('users/2/follower', follow_redirects=True)

        response = self.client.get('users/1/following')
        self.assertIn(b'@PG', response.data)

    def test_unfollow(self):
        self.login('mirhow', 'passwords')
        self.client.post('users/2/follower', follow_redirects=True)
        self.client.delete('users/2/follower', follow_redirects=True)
        self.assertFalse(self.user1.is_following(self.user2))

        response = self.client.get('users/1/following')
        self.assertNotIn(b'@PG', response.data)

    def test_show(self):
        self.login('mirhow', 'passwords')
        response = self.client.get('users/1', follow_redirects=True)
        self.assertIn(b'@mirhow', response.data)
        self.assertIn(b'SUPES COOL', response.data)

    def test_edit(self):
        self.login('mirhow', 'passwords')
        response = self.client.post(
            'users/1?_method=PATCH',
            data=dict(
                first_name="mircat",
                last_name="Howitt",
                email="mhowitt@gmail.com",
                username="mirhow",
                bio="SUPES COOL",
                location="SF",
                password="passwords"),
            follow_redirects=True)

        self.assertIn(b'mircat', response.data)

    def test_edit_bad_password(self):
        self.login('mirhow', 'passwords')
        response = self.client.post(
            'users/1?_method=PATCH',
            data=dict(
                first_name="mircat",
                last_name="Howitt",
                email="mhowitt@gmail.com",
                username="mirhow",
                bio="SUPES COOL",
                location="SF",
                password="passwor"))

        self.assertIn(b'Edit Your Profile', response.data)

    def test_delete(self):
        self.login('mirhow', 'passwords')
        response = self.client.post(
            'users/1?_method=DELETE', follow_redirects=True)

        self.assertIn(b'Sign me up!', response.data)

    def test_delete_not_authorized(self):
        self.login('mirhow', 'passwords')
        response = self.client.post(
            'users/2?_method=DELETE', follow_redirects=True)

        self.assertNotIn(b'Sign me up!', response.data)

    if __name__ == '__main__':
        unittest.main()
