#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install tty.js"
apt-get update 
apt-get install -y --allow-unauthenticated nodejs
apt-get clean -y
npm install -g tty.js
