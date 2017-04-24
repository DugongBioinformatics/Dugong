#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Java 8 and Icedtea Plugin 8"
apt-get update 
apt-get install -y --allow-unauthenticated openjdk-8-jre
apt-get clean -y
