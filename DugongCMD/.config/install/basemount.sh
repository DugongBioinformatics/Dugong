#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install BaseMount, a FUSE driver that allows a BaseSpace user access to their data"
bash -c "$(curl -L https://basemount.basespace.illumina.com/install)"
