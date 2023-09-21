#!/usr/bin/sh

source appenv/bin/activate

mkdir -p db
mkdir -p log

rm -rf log/gunicorn
rm -rf log/sqlite
mkdir log/gunicorn
mkdir log/sqlite

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
