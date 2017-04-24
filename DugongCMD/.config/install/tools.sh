#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y --allow-unauthenticated make grep sed sudo dpkg git wget zip build-essential python python-dev python-pip \
bzip2 mercurial openssh-server locales ca-certificates subversion vim
apt-get clean -y
