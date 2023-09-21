#!/usr/bin/sh

python3 -m venv appenv
. appenv/bin/activate

pip3 install -r requirements.txt
