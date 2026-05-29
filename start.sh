#!/bin/bash

set -e

echo "Lets get u settled first"
sudo apt update
sudo apt install python3 python3-pip python3-venv -y

echo "Updating pip"
python3 -m pip install --upgrade pip

echo "Creating environment"
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

echo "Activating environment"
source venv/bin/activate

echo "Installing dependencies needed for server"
pip install \
    fastapi \
    uvicorn \
    jinja2 \
    python-multipart \
    bcrypt \
    pyotp \
    qrcode \
    python-dotenv

echo "Starting FastAPI server"

uvicorn app.main:app \
    --host 0.0.0.0 \
    --port 8000 \
    --reload
