#!/usr/bin/sh

# Defaults here are only set if the environment variables are unset:
# - When run without Docker, the logs are stored in the log/ directory.
# - Otherwise, the logs are stored in the tmpfs /log partition.
SQLITE_LOGFILE=${SQLITE_LOGFILE:="$(pwd)/log/sqlite/sqlite.log"}
GUNICORN_ACCESS_LOGFILE=${GUNICORN_ACCESS_LOGFILE:="$(pwd)/log/gunicorn/access.log"}
GUNICORN_DEBUG_LOGFILE=${GUNICORN_DEBUG_LOGFILE:="$(pwd)/log/gunicorn/debug.log"}

source appenv/bin/activate

mkdir -p db
mkdir -p log

rm -rf log/gunicorn
rm -rf log/sqlite
mkdir log/gunicorn
mkdir log/sqlite

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
