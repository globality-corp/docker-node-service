#!/bin/bash -e

# Container entrypoint to simplify running the production and dev servers.

if [ "$1" = "pm2" ]; then
    mkdir -p /var/log/$NAME
    exec pm2 start $NAME-pm2.json --no-daemon
elif [ "$1" = "dev" ]; then
    exec gulp serve
elif [ "$1" = "test" ]; then
    exec gulp test
else
    exec $@
fi
