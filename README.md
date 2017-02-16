# Warbler

A Twitter clone with a Rithm spin.

### Installation

```sh
# install python requirements
pip install -r requirements.txt

# set up database
createdb warbler-db
python manage.py db init
python manage.py db migrate
python manage.py db upgrade

# start the server!
python app.py
```