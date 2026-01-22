#!/bin/bash
set -e

APP_DIR="/home/ubuntu/T_CICD_Project"
PYTHON="/usr/bin/python3"

sudo -u ubuntu bash <<EOF
cd $APP_DIR

$PYTHON -m venv venv
source venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate
EOF
