#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install MegaCMD"
wget https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megacmd-xUbuntu_16.04_amd64.deb
gdebi -n megacmd-xUbuntu_16.04_amd64.deb
rm megacmd-xUbuntu_16.04_amd64.deb
