#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y --allow-unauthenticated make grep sed sudo dpkg git wget zip build-essential python python-dev python-pip \
bzip2 mercurial openssh-server locales ca-certificates subversion vim gdebi-core bash-completion apt-utils software-properties-common \
python-software-properties libgtk-3-bin libgtk-3-dev
apt-get clean -y
