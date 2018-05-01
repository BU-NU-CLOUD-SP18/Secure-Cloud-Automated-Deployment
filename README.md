# Bolted System
Bolted system is designed to carve an enclave cloud network through public cloud. By integrating this system, Bolted system is able to provide customers with a secure, elastic, scalable, flexible and user-friendly enclave cloud network. Security assurance is applied not just to the firmware of the physical machine, but also to the operating system, application and generally any software that runs on the machine. 

Bolted System container the following componoents:
* Hil (Hardware isolation layer)
* BMI (Bare Metal Imaging)
* Keylime (node security monitoring)
* Orchestration Engine (node deployment engine)

Here are the link to view full detail of each component: [HIL](https://github.com/CCI-MOC/hil), [BMI](https://github.com/CCI-MOC/ims), [Keylime](https://github.com/mit-ll/python-keylime)

To view the documentation of the system, checkout [Bolted Summery](docs)

## Documentation
For this repo, user can use the following item of bolted:
* Installation guide of each system componet and its reference. ([HIL Install](installation_guide/hil-install), [BMI Install](installation_guide/bmi-install), [Keylime Install](installation_guide/keylime-install))
* Docker container image building Dockerfile and instruction. ([HIL Image](containers/hil), [BMI Image](containers/bmi), [Keylime Image](containers/keylime))
* Ansible playbook deployment script. ([Ansible](ansible))
* Automated installation program.

## Installation Guide (current release 0.1)
To install bolted system on a cloud platform, first the cloud needs to meet the system requirement. Once the system requirement is met, go through the following steps to configure installation.
1. Configure the `bolted.cfg` configuration file based on the system based on user cloud platform. 
2. Obtain your Ceph configuration files (Usually under the path `/etc/ceph` on your Ceph server) and place them in the folder "ceph_keyring". An example already exists in this folder for your reference. Make sure you replace them with your own files.
3. Run `setup.py` to install all the component automatically.

#### System Requirement
The current release require the system meet those requirements:
* All the nodes are virtual machine running centos7
* All the nodes are under the same subnet that can communicate with each other
* All the nodes should include the admin machine public key for `ssh` accessing


#### Configuration File
Here is a sample of configuration file `bolted.cfg`, user should change the item inside the configuration file to install the component based on the item detail.
```
# ip address of where the server is located
[serverip]
hil=10.0.0.10
bmi=10.0.0.14
keylime-server=10.0.0.9

# for testing purpose, keylime client is integrated with all other servers to be deployed together
keylime-client=10.0.0.13

# bmi configuration parameter
[bmi]
uid = bmi-sec        
service = true           

[fs]
id = admin       
pool = bmi                   
conf_file = ceph.conf           
keyring = ceph.client.admin.keyring
```

#### Installation Program
Once the configuration file has been setup based on user's environment, user is not able to install the Bolted System by running the installation program. First add the public key (if used password) to bash, which can avoid type password during the installation process.
```
$ ssh-agent bash
$ ssh-add ~/.ssh/id_rsa
```
Once the user has the input, the public key password, user is not able to run the installation program to install the system.
```
$ python setup.py install
```

## Release
#### release v0.1 (4/30/2018 current release)
This release contains the following feature items:
* Containerize all the system components using docker
* Deploy all the services inside containers on seperate machines
* Auto deploy all the components on virtual machine platform for user
* Customizable configuration setup file for easy install
* Ansible playbook script for reliable component deployment manegement
* Automated install program
* Auto configure the user virtual machine envrionment to meet system dependencies

## Mass Open Cloud
This project is part of the larger [Mass Open Cloud](https://massopen.cloud/).
For a description of the team and other information, see
https://github.com/CCI-MOC/moc-public/blob/master/README.md





