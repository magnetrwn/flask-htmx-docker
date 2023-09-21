#!/usr/bin/sh

source appenv/bin/activate

rm -rf log/gunicorn
mkdir log/gunicorn
touch log/gunicorn/debug.log
touch log/gunicorn/access.log
touch log/gunicorn/error.log

gunicorn --workers 2 \
         --worker-connections 160 \
         --bind localhost:8080 \
         --log-level debug \
         --log-file log/gunicorn/debug.log \
         --access-logfile log/gunicorn/access.log \
         --error-logfile log/gunicorn/error.log \
         --capture-output \
         'app:app'
