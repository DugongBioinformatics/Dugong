#!/bin/bash

mkdir /var/run/sshd

# create an ubuntu user
PASS=avida
echo "User: avida Pass: $PASS"
useradd --create-home --shell /bin/bash --user-group --groups adm,sudo avida
echo "avida:$PASS" | chpasswd

mv /root/avida-evo/* /home/avida/
chown -R avida:avida /home/avida/
chmod -R 755 /home/avida/
rm -rf /root/avida-evo/
rm /root/avida-evo.tar.gz

/usr/sbin/sshd

cd /tty.js && nodejs ./tty-me.js --daemonize

while [ 1 ]; do
    /bin/bash
done
