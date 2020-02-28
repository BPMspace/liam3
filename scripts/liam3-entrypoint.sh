#!/bin/sh
set -e

/usr/local/bin/production_server_master.sh
#/usr/local/bin/liam3-import_sql_all.sh

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
        set -- apache2-foreground "$@"
fi

exec "$@"