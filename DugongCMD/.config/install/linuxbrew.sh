#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Linuxbrew"
git clone https://github.com/Linuxbrew/linuxbrew.git ~/.linuxbrew
