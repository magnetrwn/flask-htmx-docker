#!/usr/bin/sh

python3 -m venv appenv
source appenv/bin/activate

pip3 install -r requirements.txt
