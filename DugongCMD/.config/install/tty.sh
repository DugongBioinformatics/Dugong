#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install tty.js"
conda install nodejs npm
npm install tty.js
