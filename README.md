# Flask + HTMx + Docker

### A little project to get up to speed with web development and deployment

I wanted to expand a Flask/HTMx project I had found [here](https://codecapsules.io/docs/tutorials/build-flask-htmx-app/#building-the-htmx-frontend), so I separated views, models and templates further, added db and log folders, and setup Docker for deployment.

This web application can be run both as a Docker deployment or directly using the `run-app-gunicorn.sh`. Make sure you have installed all required packages from `requirements.txt`. If you would rather have a virtual Python environment, just run `setup-python-env.sh` first, which will create the *venv* and also install necessary packages.

When running from `docker-compose`, the logs are stored in a *tmpfs* `/log` partition, which is configured in `compose.yaml`. Otherwise, it will use the local project's `log/` folder by default.

The `db/` folder is persistent, and is represented as volume `/db` in the deployment (that is why the SQLite database is being tracked by Git).
