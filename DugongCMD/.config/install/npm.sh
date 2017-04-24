#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install npm"
apt-get update 
apt-get install -y npm
apt-get clean -y
