#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "Install some common tools for further installation"
apt-get update && apt-get install -y --allow-unauthenticated make grep sed sudo dpkg git wget zip build-essential python \
python-dev python-pip bzip2 mercurial locales ca-certificates subversion vim gdebi-core bash-completion apt-utils openjdk-8-jre \
openssh-server unzip curl ruby net-tools libglib2.0-0 libxext6 libsm6 libxrender1 aptitude icedtea-8-plugin synaptic zlib1g-dev \
pkg-config libncurses5-dev libbz2-dev lzma libcurl4-openssl-dev libxml2-dev libssl-dev libgtextutils-dev libcairo2-dev pandoc \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
