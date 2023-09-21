#!/usr/bin/sh

# Debug only, local run
export SQLITE_DBFILE=/$(pwd)/db/sqlite.db
export SQLITE_LOGFILE=log/sqlite/info.log
export GUNICORN_ACCESS_LOGFILE=log/gunicorn/access.log
export GUNICORN_DEBUG_LOGFILE=log/gunicorn/debug.log
export GUNICORN_WORKERS=2
export GUNICORN_WORKER_CONNECTIONS=300
export GUNICORN_PORT=8080

. appenv/bin/activate

rm -f $GUNICORN_ACCESS_LOGFILE
rm -f $GUNICORN_DEBUG_LOGFILE
touch $GUNICORN_ACCESS_LOGFILE
touch $GUNICORN_DEBUG_LOGFILE

gunicorn --workers $GUNICORN_WORKERS \
         --worker-connections $GUNICORN_WORKER_CONNECTIONS \
         --bind 0.0.0.0:$GUNICORN_PORT \
         --log-level debug \
         --access-logfile $GUNICORN_ACCESS_LOGFILE \
         --error-logfile $GUNICORN_DEBUG_LOGFILE \
         --capture-output \
         'app:app'
