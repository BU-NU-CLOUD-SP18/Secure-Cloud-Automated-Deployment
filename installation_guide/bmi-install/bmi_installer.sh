#!/bin/bash

mkdir ~/pkgs
cd ~/pkgs
# install python-pip
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py

# install Ceph Client
sudo yum install -y ceph-common

# install and configure iSCSI Server
sudo yum install -y epel-release
sudo yum install -y scsi-target-utils
sudo yum -y install firewalld
sudo systemctl enable firewalld
sudo systemctl restart firewalld

sudo firewall-cmd --add-service=iscsi-target --permanent
sudo firewall-cmd --reload
sudo systemctl enable tgtd
sudo systemctl restart tgtd

# install DHCP Server
sudo yum -y install dnsmasq

# install and configure BMI
cd ~/
git clone https://github.com/CCI-MOC/ims
cd ims
sudo python setup.py install
sudo pip install python-cephlibs
sudo mv bmi_config.cfg bmi_config.cfg.orig
sudo mv bmi_config.cfg.test bmi_config.cfg
sudo mkdir /etc/bmi
sudo cp bmi_config.cfg /etc/bmi/bmiconfig.cfg
sudo mkdir /home/bmi
sudo cp bmi_config.cfg /home/bmi
