# BMI


## Installation

This document describes how to setup BMI. We officially support RHEL and CentOS 7, but it may also work on ubuntu (Debian) like OSes. 

### Prerequisite Softwares

BMI requires the following non python dependencies. 

#### Python-pip package manager
Before installation make sure you have pip installed.
To install pip:
```
yum install python-pip
```

#### Ceph Client
Ceph is a distributed object store and file system designed for performance and scalibility. 
For more information, visit the [official website](http://docs.ceph.com/docs/master/start/)

To install ceph client:
```
yum install ceph-common
```

#### iSCSI Server
We recommend using the TGT iSCSI variant as its BMI driver is more stable.   
You can install it on CentOS with the following set of commands:  

```
sudo yum install -y epel-release
sudo yum install -y scsi-target-utils
sudo yum -y install firewalld
sudo systemctl enable firewalld
sudo systemctl restart firewalld

```
Configure firewall to enable network connections for ISCSI service. (Available on CentOS 7)
```
sudo firewall-cmd --add-service=iscsi-target --permanent
sudo firewall-cmd --reload
sudo systemctl enable tgtd
sudo systemctl restart tgtd
```
Check if tgtd service is running successfully.
```
chkconfig tgtd on
systemctl status tgtd
```
Your should see a line stating "active(running)" marked with green.
For more information visit their [website](http://stgt.sourceforge.net/) and the [Quick Start Guide](https://fedoraproject.org/wiki/Scsi-target-utils_Quickstart_Guide)

#### DHCP server
We support `dnsmasq` for this. 

`$ yum install dnsmasq`

For more information about dnsmasq, you can look at the [wiki](https://wiki.debian.org/HowTo/dnsmasq)

#### Hardware Isolation Layer (HIL)
If you have already installed HIL, skip this step.
To setup HIL, you can read the [HIL documentation](http://hil.readthedocs.io/en/latest/)

### Installling
* Clone this repository to your home folder "/home/username/"
```
$ git clone https://github.com/CCI-MOC/ims
```
* Navigate to directory "ims" and run setup.py to install BMI, then install python-cephlibs
```
$ sudo python setup.py install
$ sudo pip install python-cephlibs
```
* Make sure you are under directory "ims", backup the customized config file and rename the config file for testing as the current config file.
```
mv bmi_config.cfg bmi_config.cfg.orig
mv bmi_config.cfg.test bmi_config.cfg
```
* Make directory "/bmi" under "/etc" and copy the config file there. Note that "_" must be removed from the file name.
* Then make directory "/home/bmi" and copy the config file to "/home/bmi".
```
mkdir /etc/bmi
cp /home/username/ims/bmi_config.cfg /etc/bmi/bmiconfig.cfg
mkdir /home/bmi
cp /home/username/ims/bmi_config.cfg /home/bmi
```

That's it. Installation is done!
***

## Configuration

The template for the config is [here](https://github.com/CCI-MOC/ims/blob/dev/bmi_config.cfg)
It describes the purpose and how to fill each section in it. 

## Running BMI

### Screen
Before running BMI, you are recommended to install screen to monitor mutiple servers' running status.
```
yum install screen
```

### Einstein  

Einstein is the backend that does the operations. 

First export the path of BMI config file to environment variable (BMI_CONFIG). You are recommended to modified the bashrc file.

```
vim ~/.bashrc
# Add the following line into bashrc file
$ export BMI_CONFIG=/home/bmi/bmi_config.cfg
# Make sure the modification takes effect
source ~/.bashrc
```

Then open a screen (Open a fresh screen always) and start einstein
```
$ screen
$ einstein_server (In screen)
```

Should see some lines stating einstein is running then hit Ctrl+A+D.  

Einstein is running!

### Picasso

Picasso is the frontend that handles the API calls. 

Should export like einstein. Then open screen (Open a fresh screen always) and start picasso
```
$ screen
$ picasso_server (In screen)
```

Should see one line stating that Picasso is running  

Picasso is running!!

### Bootstrapping the Database

Since we dont have installation script or command that will create the admin user, it must be done manually.

Do
```
sqlite3 <db>
insert into project values(1,'bmi_infra','provision');
.quit
```

The above command will insert the admin user that is bmi_infra
