#!/bin/sh

## Install the geWorkbench
echo "Downloading geWorkbench"
wget https://cbiit-download.nci.nih.gov/geworkbench/releases/2.6.0/geWorkbench_v2.6.0_Linux_JRE7_x64.bin

## Building and adding the Scripts keystrokes and the config.defaults
touch /tmp/test/installZimbra-keystrokes
cat <<EOF >/tmp/test/keystrokes
y
y
