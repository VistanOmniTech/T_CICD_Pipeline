#!/bin/bash
set -e

APP_DIR="/home/ubuntu/T_CICD_Project"
VENV_DIR="$APP_DIR/venv"

sudo -u ubuntu bash <<EOF
cd $APP_DIR
source $VENV_DIR/bin/activate

pkill gunicorn || true

$VENV_DIR/bin/gunicorn T_CICD_Project.wsgi:application \
  --bind 0.0.0.0:8000 \
  --workers 3 \
  --daemon
EOF
