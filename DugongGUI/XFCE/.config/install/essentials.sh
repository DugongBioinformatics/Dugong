#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "Install some common tools for further installation"
apt-get update && apt-get install -y --allow-unauthenticated make grep sed sudo dpkg git wget zip build-essential python \
python-dev bzip2 locales ca-certificates vim gdebi-core bash-completion apt-utils openjdk-8-jre \
openssh-server unzip curl ruby net-tools icedtea-8-plugin zlib1g-dev libqt4-dbus libqt4-network \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
