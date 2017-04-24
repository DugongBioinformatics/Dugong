#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Miniconda 2"

wget --quiet https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda2-latest-Linux-x86_64.sh -b -p ~/.conda2 && \
    rm Miniconda2-latest-Linux-x86_64.sh
