#!/usr/bin/sh

source appenv/bin/activate

rm -rf log/gunicorn
mkdir log/gunicorn
touch log/gunicorn/access.log
touch log/gunicorn/debug.log

gunicorn --workers 2 \
         --worker-connections 160 \
         --bind localhost:8080 \
         --log-level debug \
         --access-logfile log/gunicorn/access.log \
         --error-logfile log/gunicorn/debug.log \
         --capture-output \
         'app:app'
