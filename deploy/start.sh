#!/bin/bash

# Activate virtualenv
source /var/www/django_app/CICD-PipeLine_env/bin/activate

# Navigate to project
cd /var/www/django_app

# Pull latest code
git pull origin main

# Install dependencies
pip install -r requirements.txt

# Django migrations and static files
python manage.py migrate
python manage.py collectstatic --noinput

# Restart Gunicorn and Nginx
sudo systemctl daemon-reload
sudo systemctl restart gunicorn
sudo systemctl restart nginx
