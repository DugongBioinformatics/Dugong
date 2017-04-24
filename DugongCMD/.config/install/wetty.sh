#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install jotty.js"
git clone https://github.com/krishnasrinivas/wetty
cd wetty
npm install
