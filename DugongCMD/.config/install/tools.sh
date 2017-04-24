#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y --allow-unauthenticated autotools-dev automake cmake curl make grep sed sudo dpkg fuse git wget zip \
openjdk-8-jre build-essential pkg-config python python-dev python-pip bzip2 git libglib2.0-0 libxext6 libsm6 libxrender1 \ 
mercurial zlib1g-dev openssh-server locales ca-certificates subversion vim 
apt-get clean -y
