#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Mega Sync e MegaCMD"
wget https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megasync-xUbuntu_16.04_amd64.deb
wget https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megacmd-xUbuntu_16.04_amd64.deb
gdebi -n megasync-xUbuntu_16.04_amd64.deb
gdebi -n megacmd-xUbuntu_16.04_amd64.deb
rm megasync-xUbuntu_16.04_amd64.deb megacmd-xUbuntu_16.04_amd64.deb
