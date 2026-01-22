#!/bin/bash

cd /home/ubuntu/T_CICD_Project

python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip
pip install -r requirements.txt

python manage.py migrate
python manage.py collectstatic --noinput
