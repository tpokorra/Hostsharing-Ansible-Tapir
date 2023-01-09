#!/bin/bash

export HOME=/home/pacs/{{pac}}/users/{{user}}
export PID=$HOME/var/run/celery-beat.pid

if [ -f $PID ] ; then 
    kill $( cat $PID );
    sleep 20 ;
    kill -2 $( cat $PID ) >/dev/null 2>&1 ;
    rm $PID ;
fi
