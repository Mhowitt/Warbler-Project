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
