#!/bin/bash
set -e

APP_DIR="/home/ubuntu/T_CICD_Project"

apt-get update -y
apt-get install -y python3-venv python3-pip

# Stop old gunicorn
pkill gunicorn || true

# Remove old venv to avoid conflicts
rm -rf $APP_DIR/venv
