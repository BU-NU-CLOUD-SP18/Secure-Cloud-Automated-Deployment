#!/bin/bash

# Set up IP address for all services
ims/bmi_ip_gen.sh /home/bmi/ims/bmi_config.cfg
ims/bmi_ip_gen.sh /etc/bmi/bmiconfig.cfg
ims/bmi_ip_gen.sh /home/bmi/bmi_config.cfg

# Create local sqlite3 database
bmi project create project auto-net
sqlite3 /etc/bmi/bmi.db "insert into project values(1,'bmi_infra','provision');"

# Start Einsterin server
echo "Starting Einstein server"
einstein_server &

# Start Picasso server
echo "Starting Picasso server"
picasso_server &

/usr/sbin/init

# Extra line added in the script to run all command line arguments
exec "$@";
/bin/bash
