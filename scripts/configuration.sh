#!/bin/bash
set -e

echo "  ----- install ruby and bundler -----  "
apt-get update
apt-get install -y ruby-full build-essential
gem install bundler

echo "  ----- install mongodb -----  "
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb

echo "  ----- start mongodb -----  "
systemctl start mongodb
systemctl enable mongodb

echo "  ----- copy unit file for application -----  "
wget https://gist.githubusercontent.com/Artemmkin/ce82397cfc69d912df9cd648a8d69bec/raw/7193a36c9661c6b90e7e482d256865f085a853f2/nexus.service
mv nexus.service /etc/systemd/system/nexus.service
