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
```

#### Testing

To run tests, `pip install green` then run `green` from the root of your project.

### Requirements

We've addressed the following user stories:

1.  As a user, I want to see a custom 404 page when I try to go to an invalid URL.
1.  As a user, I want to see my name, location, bio, and my header image on my profile page.
1.  As a user, I want to be able to edit my name, location, bio, and my header image on my profile edit page.
1.  As a user, I want to see the last 100 warbles **only from the users that I am following, and myself** rather than warbles from _all_ users.
1.  As a user, I want to be able to "like" a warble.
1.  As a user, I want to be able to see how many warbles I "liked" on my profile page.
1.  As a user, I should not have to refresh the page when I like a warble.
1.  (_Technical_) - Add tests.

### Bonus

1.  As a user, I should not have to refresh the page when I change my bio or name in my profile.
1.  As a user, I should not have to go to a new page to compose a warble (think modals and AJAX here!)
1.  (_Technical_) - Look for opportunities to refactor! In the templates especially, there are opportunities to DRY up the code.

### Super Bonus

1.  As a user, I should be able to send a direct message to another user which is only visible to the two of us.
1.  As a user, I should be able to respond to a direct message sent to me.
1.  As a user, I should be able to block another user, so that they are no longer visible to me and they cannot send me direct messages.
1.  As a user, I should be able to see a list of all of the users I've blocked.
1.  As a user, I should be able to unblock a user I've previously blocked.
1.  As an admin user, I should be able to delete anyone's messages.
1.  As an admin user, I should be able to delete users from the platform.
1.  As an admin user, I should be able to add or revoke admin privileges for any other user.
