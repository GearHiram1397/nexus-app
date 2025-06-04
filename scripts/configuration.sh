#!/bin/bash
set -e

echo "  ----- install ruby and bundler -----  "
apt-get update
apt-get install -y ruby-full build-essential
gem install bundler

echo "  ----- install mongodb -----  "
apt-key adv --fetch-keys https://pgp.mongodb.com/server-6.0.asc
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-6.0.list
apt-get update
apt-get install -y mongodb-org

echo "  ----- start mongodb -----  "
systemctl start mongod
systemctl enable mongod

echo "  ----- copy unit file for application -----  "
wget https://gist.githubusercontent.com/Artemmkin/ce82397cfc69d912df9cd648a8d69bec/raw/7193a36c9661c6b90e7e482d256865f085a853f2/nexus.service
mv nexus.service /etc/systemd/system/nexus.service
