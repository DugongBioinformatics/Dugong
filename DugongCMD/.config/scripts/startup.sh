#!/bin/bash

mkdir /var/run/sshd

sh tty.js --port 3000

while [ 1 ]; do
    /bin/bash
done
