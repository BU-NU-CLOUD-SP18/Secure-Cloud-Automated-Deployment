#!/bin/bash

cd

mkdir tpm
mkdir keylime

cd tpm
git clone https://github.com/mit-ll/tpm4720-keylime.git
cd ../keylime
git clone https://github.com/mit-ll/python-keylime.git

cd
sudo yum update
sudo yum install -y openssl-devel libtool gcc automake

cd tpm/tpm4720/libtpm
./comp-chardev.sh
sudo make install

cd ../scripts
chmod +x install-centos.sh
./install-centos.sh

/usr/local/bin/init_tpm_server
/usr/local/bin/tpm_serverd

cd ~/keylime/python-keylime/
yum install -y python-devel python-setuptools python-tornado python-m2crypto python-zmq

## most of the python path is python2.7
sudo python2.7 setup.py install
