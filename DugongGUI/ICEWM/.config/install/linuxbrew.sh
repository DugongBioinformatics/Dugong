#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Linuxbrew"
git clone https://github.com/Linuxbrew/linuxbrew.git ~/.linuxbrew
echo "export BREWPATH="~/.linuxbrew/bin:$BREWPATH"" >> ~/.bashrc
echo "export MANPATH="~/.linuxbrew/share/man:$MANPATH"" >> ~/.bashrc
echo "export INFOPATH="~/.linuxbrew/share/info:$INFOPATH"" >> ~/.bashrc
