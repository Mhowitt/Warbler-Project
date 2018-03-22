from project import app, db
from project.users.models import User
from flask_testing import TestCase
import unittest


class BaseTestCase(TestCase):
    def create_app(self):
        app.config['WTF_CSRF_ENABLED'] = False
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///testing.db'
        return app
