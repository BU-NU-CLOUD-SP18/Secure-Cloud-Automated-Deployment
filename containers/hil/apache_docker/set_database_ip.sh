#!/bin/bash

if [ -z "$1" ]
then
      echo "please input ip address of keylime verifier and regisrar as arguemnet"
else
      sudo sed -i 's|uri = postgresql://hil:12345@172.18.0.20:5432/hil|uri = postgresql://hil:12345@'$1'/hil|' /etc/hil.cfg
fi
