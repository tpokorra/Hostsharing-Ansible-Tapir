#!/bin/bash

export PID=$HOME/var/run/celery-worker.pid

cd $HOME/tapir
poetry run celery -A tapir worker -l info >>$HOME/var/log/celery-worker.log 2>&1 &
echo $! > $PID