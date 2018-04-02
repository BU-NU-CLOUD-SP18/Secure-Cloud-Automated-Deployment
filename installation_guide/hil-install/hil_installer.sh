#!/bin/bash


# install all the the dependencies
sudo yum install epel-release bridge-utils  gcc  httpd  ipmitool libvirt \
libxml2-devel  libxslt-devel  mod_wsgi net-tools python-pip python-psycopg2 \
python-virtinst python-virtualenv qemu-kvm telnet vconfig virt-install

cd ~/hil

cp examples/hil.cfg.dev-no-hardware hil.cfg
export HIL_ENDPOINT=http://127.0.0.1:5000

virtualenv .venv
source .venv/bin/activate
easy_install -U setuptools
cd ~/hil
pip install --upgrade setuptools
pip install -e .

