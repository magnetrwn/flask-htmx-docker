# Flask + HTMx + Docker

**A little base project to get up to speed with web development and deployment using Flask, HTMx and shell, with a simple model, view/blueprint, and template available.**

## Quick Start

You can:
+ Clone this template repo: `git clone https://github.com/magnetrwn/flask-htmx-docker`.
+ Run the clone with: `docker-compose build && docker-compose up`.
+ Or just get the image with: `docker pull ghcr.io/magnetrwn/flask-htmx-docker:nightly`

You can also run the clone locally by using the scripts in `scripts/`. Use `scripts/run-app-gunicorn.sh debug` to run a local Gunicorn instance, but make sure you have run `scripts/setup-python-env.sh` at least once.

## What is this?

I wanted to expand a Flask/HTMx project I had found [here](https://codecapsules.io/docs/tutorials/build-flask-htmx-app/#building-the-htmx-frontend), so I separated views, models and templates further, added db and log folders, and setup Docker for deployment.

Now, this structure can be repurposed for other simple Flask/HTMx web applications!

## Requirements

Currently, as you can see in `requirements.txt`, the image installs the following using pip3 in a persistent virtual environment `appenv`:
```
flask
flask-sqlalchemy
gunicorn
```

## Project & Image Setup

The `db/`, `log/` and `appenv/` folders are persistent, and are represented as volumes `/db`, `/log` and `/flask-htmx/appenv` in deployment.

**Note:** When using the Docker image, make sure to replace the default contents of the following directories:

```sh
# Replace these with your own:
/flask-htmx/app/models/
/flask-htmx/app/templates/
/flask-htmx/app/views/

# Include your new models and views here:
/flask-htmx/app/__init__.py
```

You can use the defaults to debug the image before starting Flask development.

To replace the contents of the image, you should use this Dockerfile syntax:

```dockerfile
FROM ghcr.io/magnetrwn/flask-htmx-docker:nightly

# Replace the template app entirely
COPY my-app /flask-htmx/app
# Make sure to have variable 'app' available with Flask in 'app/__init__.py',
# as well as importing all models and views (check the file for clarity).
# Why? check note below.
```

**Note:** When starting Gunicorn, it searches for variable `app` inside of module `app`: you can find it in `app/__init__.py`. This is why it also contains the blueprint registration logic, although this approach is only appropriate for compact web designs, so you should further separate `__init__.py` moving on.

The default database used by this template is SQLite, and it is embedded for lightweight database usage, but you should integrate with larger database systems for heavier applications, since SQLite is not good for parallel performance: it will **mutex one client at a time** on the whole database file!

## License & Contrib

Licensed under MIT. Feel free to contribute if you want to!
