#!/bin/bash
set -e

echo "  ----- clone application repository -----  "
git clone https://github.com/GearHiram1397/nexus-app.git

echo "  ----- install dependent gems -----  "
cd ./nexus-app
bundle install

echo "  ----- start the application -----  "
sudo systemctl start nexus
sudo systemctl enable nexus
