#!/bin/bash

export HOME=/home/pacs/{{pac}}/users/{{user}}
export PID=$HOME/var/run/slapd.pid

/usr/sbin/slapd -h "ldap://127.0.0.1:{{ldap_port}}/" -F "$HOME/slapd2/etc" -d 0  >$HOME/var/log/slapd.log 2>&1 &
echo $! > $PID
