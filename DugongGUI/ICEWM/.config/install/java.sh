#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Java 8 and Icedtea Plugin 8"
apt-get update 
apt-get install -y openjdk-8-jre icedtea-8-plugin
apt-get clean -y
