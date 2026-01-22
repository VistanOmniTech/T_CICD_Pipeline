#!/bin/bash

cd /home/ubuntu/T_CICD_Project
source venv/bin/activate

pkill gunicorn || true

gunicorn T_CICD_Project.wsgi:application \
  --bind 0.0.0.0:8000 \
  --daemon
