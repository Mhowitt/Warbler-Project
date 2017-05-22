# Warbler

A Twitter clone with a Rithm spin.

### Installation

```sh
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

1. Try to understand the code.  Look through and see what each route is doing.  Take a look at the models.  See what data you have in your database after running `psql warbler-db < data.sql`
2. You should already have user data for `location`, `bio`, `name`, and `header_image_url`.  Modify the UI to display those fields on the user's profile.
3. Currently on the homepage, you are seeing the last 100 tweets from all users.  Modify the code so that you only see at most the last 100 tweets from users that the logged in user is following!
4. Add the ability to like a warble.  Once you get likes to work correctly, fix the UI on the user profile to show how many warbles that user has liked.
5. The application has an N+1 query issue.  Set `app.config['SQLALCHEMY_ECHO'] = True` and try to fix the issue.