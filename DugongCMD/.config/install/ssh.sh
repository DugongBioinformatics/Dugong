#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install SSH"
apt-get update 
apt-get install -y openssh-server
apt-get clean -y
mkdir /var/run/sshd
