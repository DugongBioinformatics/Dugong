#!/bin/bash

# create an ubuntu user
PASS=dugong
USER=dugong
HOME=/headless
echo "User: $USER Pass: $PASS"
useradd -d $HOME --shell /bin/bash --user-group --groups adm,sudo $USER
echo "$USER:$PASS" | chpasswd
echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
chown -R $USER:$USER $HOME
