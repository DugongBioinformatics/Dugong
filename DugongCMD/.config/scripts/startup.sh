#!/bin/bash

/usr/sbin/sshd

cd /tty.js && node ./tty-me.js --daemonize

while [ 1 ]; do
    /bin/bash
done
