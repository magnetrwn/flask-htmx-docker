#!/usr/bin/sh

echo 'Running at-docker-init.sh'

echo 'Clearing previous log files (SQLite)'
rm -f $SQLITE_LOGFILE

# Check if appenv is empty
if [ -z "$(ls -A /flask-htmx/appenv)" ]
then
    scripts/setup-python-env.sh
else
    . /flask-htmx/appenv/bin/activate
fi

scripts/run-app-gunicorn.sh
