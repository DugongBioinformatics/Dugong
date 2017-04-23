#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Linuxbrew"
git clone https://github.com/Linuxbrew/linuxbrew.git ~/.linuxbrew
echo "PATH=$HOME/.linuxbrew/bin:$PATH" >> ~/.bashrc
echo "export MANPATH=$HOME/.linuxbrew/share/man:$MANPATH" >> ~/.bashrc
echo "export INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH" >> ~/.bashrc
echo "PATH=$HOME/.linuxbrew/bin:$PATH" >> ~/.bash_profile
echo "export MANPATH=$HOME/.linuxbrew/share/man:$MANPATH" >> ~/.bash_profile
echo "export INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH" >> ~/.bash_profile
