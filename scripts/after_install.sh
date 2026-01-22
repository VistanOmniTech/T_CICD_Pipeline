#!/bin/bash
set -e

APP_DIR="/home/ubuntu/T_CICD_Project"
PYTHON="/usr/bin/python3"

sudo -u ubuntu bash <<EOF
cd $APP_DIR

$PYTHON -m venv venv

./venv/bin/pip install --upgrade pip
./venv/bin/pip install -r requirements.txt

./venv/bin/python manage.py collectstatic --noinput
./venv/bin/python manage.py migrate
EOF
