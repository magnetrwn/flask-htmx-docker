# Flask + HTMx + Docker

### A little project to get up to speed with web development and deployment

**Warning: dropped combined support of both bare run and Docker run.**

Run with: `docker-compose build && docker-compose up`.

You can also run manually and locally by using the scripts in `scripts/`. Use `scripts/run-app-gunicorn.sh debug` to run a local Gunicorn instance.

I wanted to expand a Flask/HTMx project I had found [here](https://codecapsules.io/docs/tutorials/build-flask-htmx-app/#building-the-htmx-frontend), so I separated views, models and templates further, added db and log folders, and setup Docker for deployment.

The `db/` and `log/` folders are persistent, and is represented as volume `/db` and `/log` in the deployment (that is why the SQLite database is being tracked by Git).
