#!/usr/bin/sh

rm -f $SQLITE_LOGFILE
scripts/setup-python-env.sh
scripts/run-app-gunicorn.sh
