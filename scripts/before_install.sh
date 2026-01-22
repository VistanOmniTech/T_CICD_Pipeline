#!/bin/bash
set -e

APP_DIR="/home/ubuntu/T_CICD_Project"
PYTHON="/usr/bin/python3"

# Install required system packages
apt-get update -y
apt-get install -y python3-venv python3-pip

# Create venv if it does not exist
if [ ! -d "$APP_DIR/venv" ]; then
  sudo -u ubuntu $PYTHON -m venv $APP_DIR/venv
fi
