#!/bin/bash

### every exit != 0 fails the script
set -e

# should also source $STARTUPDIR/generate_container_user
source $HOME/.bashrc

cd /tty.js && nodejs ./tty-me.js --daemonize
/usr/local/bin/start-notebook.sh

while [ 1 ]; do
    /bin/bash
done
