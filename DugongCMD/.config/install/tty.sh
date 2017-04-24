#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install tty.js"
curl -sL https://deb.nodesource.com/setup_7.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get update 
apt-get install -y --allow-unauthenticated nodejs
apt-get clean -y


