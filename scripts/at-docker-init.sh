#!/usr/bin/sh

echo 'Running at-docker-init.sh'

echo 'Setting permissions for scripts'
chmod +x scripts/*.sh

echo 'Clearing previous log files (SQLite)'
rm -f $SQLITE_LOGFILE

# Check if appenv is empty
if [ -z "$(ls -A /flask-htmx/appenv)" ]
then
    /flask-htmx/scripts/setup-python-env.sh
else
    . /flask-htmx/appenv/bin/activate
fi

echo 'Current environment variables:'
echo 'SQLITE_DBFILE: ' $SQLITE_DBFILE
echo 'SQLITE_LOGFILE: ' $SQLITE_LOGFILE
echo 'GUNICORN_ACCESS_LOGFILE: ' $GUNICORN_ACCESS_LOGFILE
echo 'GUNICORN_DEBUG_LOGFILE: ' $GUNICORN_DEBUG_LOGFILE
echo 'GUNICORN_WORKERS: ' $GUNICORN_WORKERS
echo 'GUNICORN_WORKER_CONNECTIONS: ' $GUNICORN_WORKER_CONNECTIONS
echo 'GUNICORN_PORT: ' $GUNICORN_PORT
echo
echo 'Listing project directory:'
echo "$(ls -alR /flask-htmx/db)"
echo

/flask-htmx/scripts/run-app-gunicorn.sh
