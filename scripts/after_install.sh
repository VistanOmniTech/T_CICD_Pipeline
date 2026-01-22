#!/bin/bash
set -e

APP_DIR="/home/ubuntu/T_CICD_Project"
VENV_DIR="$APP_DIR/venv"

sudo -u ubuntu bash <<EOF
cd $APP_DIR
source $VENV_DIR/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate
EOF
