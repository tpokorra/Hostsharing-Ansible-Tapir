#!/bin/bash

export PID=$HOME/var/run/celery-beat.pid

cd $HOME/tapir
poetry run celery -A tapir beat -l info --schedule $HOME/var/tmp/celerybeat-schedule >>$HOME/var/log/celery-beat.log 2>&1 &
echo $! > $PID