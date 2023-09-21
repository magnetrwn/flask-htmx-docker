#!/usr/bin/sh

echo 'Running setup-python-env.sh'

echo 'Creating virtual environment'
python3 -m venv /flask-htmx/appenv

echo 'Activating virtual environment'
. /flask-htmx/appenv/bin/activate

echo 'Running pip3'
pip3 install -r requirements.txt
