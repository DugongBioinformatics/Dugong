#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Linuxbrew"
git clone https://github.com/Linuxbrew/linuxbrew.git ~/.linuxbrew
echo "export BREWPATH="~/.linuxbrew/bin:$BREWPATH"" >> ~/.bashrc
echo "export MANPATH="~/.linuxbrew/share/man:$MANPATH"" >> ~/.bashrc
echo "export INFOPATH="~/.linuxbrew/share/info:$INFOPATH"" >> ~/.bashrc
echo "export BREWPATH="/root/.linuxbrew/bin:$BREWPATH"" >> /home/dugong/.bashrc
echo "export MANPATH="/root/.linuxbrew/share/man:$MANPATH"" >> /home/dugong/.bashrc
echo "export INFOPATH="/root/.linuxbrew/share/info:$INFOPATH"" >> /home/dugong/.bashrc
chown -R dugong:dugong /root/.linuxbrew
