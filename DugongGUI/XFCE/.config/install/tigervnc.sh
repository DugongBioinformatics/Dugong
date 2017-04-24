#!/usr/bin/env bash

echo "Install TigerVNC server"
wget -qO- https://dl.bintray.com/tigervnc/stable/tigervnc-1.7.0.x86_64.tar.gz | tar zxvf --strip 1 -C /
