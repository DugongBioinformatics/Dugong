#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install -y --allow-unauthenticated vim wget unzip curl git gdebi-core bash-completion build-essential ruby make net-tools \
ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 mercurial subversion synaptic sudo apt-utils
apt-get clean -y
