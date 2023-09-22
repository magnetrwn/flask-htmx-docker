#!/usr/bin/sh

echo 'Running run-app-gunicorn.sh'

if [ "$1" = "debug" ]
then
    echo 'Running in debug mode'
    export SQLITE_DBFILE=/$(pwd)/db/sqlite.db
    export SQLITE_LOGFILE=log/sqlite/info.log
    export GUNICORN_ACCESS_LOGFILE=log/gunicorn/access.log
    export GUNICORN_DEBUG_LOGFILE=log/gunicorn/debug.log
    export GUNICORN_WORKERS=2
    export GUNICORN_WORKER_CONNECTIONS=300
    export GUNICORN_PORT=8080
    mkdir -p log/sqlite
    mkdir -p log/gunicorn
fi

echo 'Activating virtual environment'
. /flask-htmx/appenv/bin/activate

echo 'Clearing previous log files (Gunicorn)'
rm -f $GUNICORN_ACCESS_LOGFILE
rm -f $GUNICORN_DEBUG_LOGFILE
touch $GUNICORN_ACCESS_LOGFILE
touch $GUNICORN_DEBUG_LOGFILE

echo 'Running Gunicorn'
gunicorn --workers $GUNICORN_WORKERS \
         --worker-connections $GUNICORN_WORKER_CONNECTIONS \
         --bind 0.0.0.0:$GUNICORN_PORT \
         --log-level debug \
         --access-logfile $GUNICORN_ACCESS_LOGFILE \
         --error-logfile $GUNICORN_DEBUG_LOGFILE \
         --capture-output \
         'app:app'
