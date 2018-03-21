from flask import redirect, flash, url_for, session
import functools


def prevent_login_signup(fn):
    @functools.wraps(fn)
    def wrapped(*args, **kwargs):
        if session.get('user_id'):
            flash('You are already logged in!')
            return redirect(url_for('users.index'))
        return fn(*args, **kwargs)

    return wrapped
