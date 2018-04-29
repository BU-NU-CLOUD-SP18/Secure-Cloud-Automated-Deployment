#!/bin/bash

# Get the ip addr of current container
local_ip=$(awk 'END{print $1}' /etc/hosts)
file_name=$1
#local_ip=172.0.0.14

# Configure iscsi server
sed -i -e "0,/<ip of iscsi server>/{s/<ip of iscsi server>/$local_ip:3260/g}" $file_name
sed -i -e "0,/<sudo password for iscsi_update script>/{s/<sudo password for iscsi_update script>/password/g}" $file_name

# Configure nameserver
sed -i -e "0,/<ip of nameserver>/{s/<ip of nameserver>/$local_ip/g}" $file_name
sed -i -e "0,/<port of nameserver>/{s/<port of nameserver>/9893/g}" $file_name

# Configure rpc server
sed -i -e "0,/<ip of rpc server>/{s/<ip of rpc server>/$local_ip/g}" $file_name
sed -i -e "0,/<port of rpc server>/{s/<port of rpc server>/10002/g}" $file_name

# Configure rest API server
sed -i -e "0,/<ip to bind to>/{s/<ip to bind to>/$local_ip/g}" $file_name
sed -i -e "0,/<port to bind to>/{s/<port to bind to>/1513/g}" $file_name
