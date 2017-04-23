#!/bin/bash

# create an ubuntu user
PASS=dugong
USER=dugong
HOME=/headless
echo "User: $USER Pass: $PASS"
useradd -d $HOME --shell /bin/bash --user-group --groups adm,sudo $USER
echo "$USER:$PASS" | chpasswd
chown -R $USER:$USER $HOME
