#!bin/bash


# install all the the dependencies
yum install epel-release bridge-utils  gcc  httpd  ipmitool libvirt \
libxml2-devel  libxslt-devel  mod_wsgi net-tools python-pip python-psycopg2 \
python-virtinst python-virtualenv qemu-kvm telnet vconfig virt-install

export HIL_ENDPOINT=http://127.0.0.1:5000

cd hil

virtualenv .venv
source .venv/bin/activate
easy_install -U setuptools
pip install --upgrade setuptools
pip install -e .

