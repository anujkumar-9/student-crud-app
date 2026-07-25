#!/bin/bash

# Update system
apt-get update -y

# Install Python and pip
apt-get install -y python3 python3-pip python3-venv git

# Create application directory
mkdir -p /opt/backend

# Install Flask and Gunicorn
pip3 install flask gunicorn pymongo
