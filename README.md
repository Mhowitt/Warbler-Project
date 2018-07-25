# Warbler

## Overview

A Twitter clone with a spin coded by [Paula Goyanes](https://github.com/goyanespaula) & [Miranda Howitt](https://github.com/Mhowitt)

## Live URL

[Live site](https://warbler-project.herokuapp.com/)

### Installation

```sh
# make a virtual environment
mkvirtualenv warbler
# install python requirements
pip install -r requirements.txt

# set up database
dropdb warbler-db
createdb warbler-db
flask db upgrade

# The database must be freshly created before doing this command
# If you have already added data, make sure to follow the steps above
# to reset the database.
psql warbler-db < data.sql

# start the server!
flask run

visit localhost:5000to view app
```

### Testing

To run tests, `pip install green` then run `green` from the root of your project.

### Features

The features below are listed as Agile/Scrum requirements that you might see on a software engineering kanban board or task list. The tasks are phrased as "User Stories", which means they are written from the perspective of a user/customer.

- As a user, I want to see a custom 404 page when I try to go to an invalid URL.
- As a user, I want to see my name, location, bio, and my header image on my profile page.
- As a user, I want to be able to edit my name, location, bio, and my header image on my profile edit page.
- As a user, I want to see the last 0* warbles **only from the users that I am following, and myself** rather than warbles from *all\* users.
- As a user, I should not have to refresh the page when I like a warble.
- As a user, I want to be able to "like" a warble.
  _ As a user, I want to be able to see how many warbles I "liked" on my profile page.
  _ (_Technical_) - Add tests.
