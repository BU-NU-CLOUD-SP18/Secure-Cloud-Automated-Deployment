#!/bin/bash

if [ -z "$1" ]
then
      echo "please input ip address of keylime verifier and regisrar as arguemnet"
else
      sed -i 's/registrar_ip = 172.18.0.10/registrar_ip = '$1'/' ./keylime.conf
      sed -i 's/provider_registrar_ip = 171.18.0.10/registrar = '$1'/' ./keylime.conf
      sed -i 's/cloudverifier_ip = 172.18.0.10/registrar = '$1'/' ./keylime.conf
fi
