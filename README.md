# Flask + HTMx + Docker

### A little base project to get up to speed with web development and deployment using Flask, HTMx and shell

Run with: `docker-compose build && docker-compose up`.

You can also run locally by using the scripts in `scripts/`. Use `scripts/run-app-gunicorn.sh debug` to run a local Gunicorn instance, but make sure you have run `scripts/setup-python-env.sh` at least once.

I wanted to expand a Flask/HTMx project I had found [here](https://codecapsules.io/docs/tutorials/build-flask-htmx-app/#building-the-htmx-frontend), so I separated views, models and templates further, added db and log folders, and setup Docker for deployment.

**Now, this structure can be repurposed for other simple Flask/HTMx web applications!**

The `db/`, `log/` and `appenv/` folders are persistent, and are represented as volumes `/db`, `/log` and `/flask-htmx/appenv` in deployment.
