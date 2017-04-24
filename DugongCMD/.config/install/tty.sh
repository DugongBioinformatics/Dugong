#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install tty.js"
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs
apt-get clean
npm install tty.js
