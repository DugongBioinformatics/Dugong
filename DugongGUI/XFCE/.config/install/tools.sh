#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
wget --quiet https://github.com/krallin/tini/releases/download/v0.10.0/tini && \
echo "1361527f39190a7338a0b434bd8c88ff7233ce7b9a4876f3315c22fce7eca1b0 *tini" | sha256sum -c - && \
mv tini /usr/local/bin/tini && chmod +x /usr/local/bin/tini && \
wget https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megasync-xUbuntu_16.04_amd64.deb && \
wget https://mega.nz/linux/MEGAsync/xUbuntu_16.04/amd64/megacmd-xUbuntu_16.04_amd64.deb && \
gdebi -n megasync-xUbuntu_16.04_amd64.deb && \
gdebi -n megacmd-xUbuntu_16.04_amd64.deb && \
rm megasync-xUbuntu_16.04_amd64.deb megacmd-xUbuntu_16.04_amd64.deb
