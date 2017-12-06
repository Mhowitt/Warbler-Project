# Warbler

A Twitter clone with a Rithm spin.

### Installation

```sh
# make a virtual environment
mkvirtualenv warbler
# install python requirements
pip install -r requirements.txt

# set up database
dropdb warbler-db
createdb warbler-db
python manage.py db upgrade

# The database must be freshly created before doing this command
# If you have already added data, make sure to follow the steps above
# to reset the database.
psql warbler-db < data.sql

# start the server!
python app.py
```

### Assignment

Try to understand the code.  Look through and see what each route is doing.  Take a look at the models.  See what data you have in your database after running `psql warbler-db < data.sql`. 

When you're ready, address the following user stories:

1. As a user, I want to see my name, location, bio, and my header image on my profile page.
1. As a user, I want to see the last 100 tweets **only from the users that I am following** rather than tweets from _all_ users.
1. As a user, I want to be able to "like" a warble.
1. As a user, I want to be able to see how many warbles I "liked" on my profile page.
1. (_Technical_) - The application has an [n + 1 query](https://www.rithmschool.com/courses/flask-fundamentals/database-performance) issue.  Set `app.config['SQLALCHEMY_ECHO'] = True` and try to fix the issue.

&nbsp;

### Bonus

1. (_Technical_) - Add tests. Test features such as login, making sure you cannot edit someone else profile, etc.  There is a sample test file [below](#appendix-test-example).  You can also check out the [testing notes](https://github.com/rithmschool/python_curriculum/blob/master/Unit-02/08-testing_continued.md) in the python curriculum.  To run the tests, `pip install green` then run `green` from the root of your project.
1. As a user, I should not have to refresh the page when I like a warble.
1. As a user, I should not have to refresh the page when I change my bio or name in my profile.

&nbsp;

### Appendix: Test Example

Here is an example of a test file.  The file will be placed in a `projects/tests` folder.  The name of the file in this case is `test_persons.py`.  Generally, you should prefix your tests with `test`.

&nbsp;

```python
from flask_testing import TestCase
import unittest
from datetime import datetime
from project.models import Person, User, Tag, Taggable
from project import app, db, bcrypt
from flask import json


class BaseTestCase(TestCase):
    def _login_user(self, email, password, follow_redirects=False):
        return self.client.post('/users/login',
                                data=dict(email=email,
                                          password=password), follow_redirects=follow_redirects)

    def create_app(self):
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///testing.db'
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False
        return app

    def setUp(self):
        db.create_all()
        user1 = User('aricliesenfelt@gmail.com', 'Aric Liesenfelt', 'password1', '9515706209', True, False)
        user2 = User('tommyhopkins@gmail.com', 'Tommy Hopkins', 'password2', '1111111111', True, True)
        db.session.add_all([user1, user2])
        db.session.commit()

    def tearDown(self):
        db.session.remove()
        db.drop_all()

    # Test creating a new person that passes all validators
    def testNewPerson(self):
        self._login_user('tommyhopkins@gmail.com', 'password2')
        response = self.client.post('/persons/',
                                    data=dict(email='aaron.m.manley@gmail.com',
                                              phone="4087261650",
                                              name='Aaron',
                                              title='Awesome',
                                              description='I am an awesome person'
                                              ), follow_redirects=True
                                    )
        self.assertEqual(response.status_code, 200)
        self.assert_template_used('persons/index.html')
        self.assertEqual(
            Person.query.filter_by(phone="4087261650").first().name,
            'Aaron')
        self.assertFalse(Person.query.filter_by(phone="4087261650").first().slow_lp,
                         False)
        self.assertEqual(
            Person.query.filter_by(phone="4087261650").first().email,
            'aaron.m.manley@gmail.com')
        self.assertEqual(
            Person.query.filter_by(phone="4087261650").first().description,
            "I am an awesome person")

    # Test new person that fails form validation, should render persons/new
    def testNewPersonFailValidation(self):
        self._login_user('tommyhopkins@gmail.com', 'password2')
        response = self.client.post('/persons/',
                                    data=dict(email='aaron.m.manley@gmail.com',
                                              phone="",
                                              name='',
                                              title='Awesome',
                                              description='I am an awesome person'
                                              )
                                    )

        self.assertEqual(response.status_code, 200)
        self.assert_template_used('persons/new.html')

    def testEditUser(self):

        self._login_user('tommyhopkins@gmail.com', 'password2')
        # create new user to test editing on
        self.client.post('/persons/',
                         data=dict(email='aaron.m.manley@gmail.com',
                                   phone="4087261650",
                                   name='Aaron',
                                   title='Awesome',
                                   description='I am an awesome person'
                                   ))

        response = self.client.post('/persons/1?_method=PATCH',
                                    data=dict(email='notaaron@rithmschool.com',
                                              phone="9992223333",
                                              title='Murky',
                                              name='Aaron',
                                              description='I am a Frog'), follow_redirects=True
                                    )

        self.assertEqual(len(Person.query.all()), 1)
        self.assertEqual(response.status_code, 200)
        self.assert_template_used('persons/show.html')
        self.assertEqual(
            Person.query.filter_by(phone="9992223333").first().id,
            1)
        self.assertEqual(
            Person.query.filter_by(phone="9992223333").first().name,
            'Aaron')
        self.assertFalse(Person.query.filter_by(phone="9992223333").first().slow_lp,
                         False)
        self.assertEqual(
            Person.query.filter_by(phone="9992223333").first().email,
            'notaaron@rithmschool.com')
        self.assertEqual(
            Person.query.filter_by(phone="9992223333").first().description,
            'I am a Frog')

    def testAddTag(self):
        # Adding a new tag
        self._login_user('tommyhopkins@gmail.com', 'password2')
        new_person = Person('Mark Zuckerberg')
        db.session.add(new_person)
        db.session.commit()
        response = self.client.post('/persons/1/tags',
                                    data=dict(tag='newtag'), follow_redirects=True)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(Tag.query.count(), 1)
        self.assertEqual(Taggable.query.count(), 1)
        self.assert_template_used('persons/show.html')
        # Re-adding the same tag shouldn't allow you
        response = self.client.post('/persons/1/tags',
                                    data=dict(tag='newtag'))
        self.assertEqual(response.status_code, 302)
        self.assertEqual(Tag.query.count(), 1)
        self.assertEqual(Taggable.query.count(), 1)

    def testArchive(self):
        self._login_user('tommyhopkins@gmail.com', 'password2')
        person1 = Person('Mark Zuckerberg')
        person2 = Person('Lars Zuc')
        db.session.add_all([person1, person2])
        db.session.commit()
        person_1 = Person.query.get(1)
        person_2 = Person.query.get(2)
        person_2.archived = True
        response1 = self.client.get('/persons/1/archive')
        response2 = self.client.get('/persons/2/archive')
        self.assertEqual(response1.status_code, 302)
        self.assertEqual(response2.status_code, 302)
        self.assertEqual(person_1.archived, True)
        self.assertEqual(person_2.archived, False)


if __name__ == '__main__':
    unittest.main()
```
