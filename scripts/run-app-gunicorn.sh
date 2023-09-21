#!/usr/bin/sh

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
         'app:__init__'
