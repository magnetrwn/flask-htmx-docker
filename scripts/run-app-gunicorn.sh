#!/usr/bin/sh

cd ..

source appenv/bin/activate

touch $GUNICORN_ACCESS_LOGFILE
touch $GUNICORN_DEBUG_LOGFILE

gunicorn --workers 2 \
         --worker-connections 160 \
         --bind localhost:8080 \
         --log-level debug \
         --access-logfile $GUNICORN_ACCESS_LOGFILE \
         --error-logfile $GUNICORN_DEBUG_LOGFILE \
         --capture-output \
         'app:app'
