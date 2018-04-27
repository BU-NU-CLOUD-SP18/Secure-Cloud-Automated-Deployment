#!/bin/bash

#set -e
#service tgtd start
#service tgtd status
echo "Starting Einstein server"
einstein_server &
echo "Starting Picasso server"
picasso_server &

/usr/sbin/init

#Extra line added in the script to run all command line arguments
exec "$@";
