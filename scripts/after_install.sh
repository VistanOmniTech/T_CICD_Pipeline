#!/bin/bash
set -e

cd /home/ubuntu/T_CICD_Project

sudo -u ubuntu bash <<EOF
source venv/bin/activate
python manage.py collectstatic --noinput
python manage.py migrate
EOF
