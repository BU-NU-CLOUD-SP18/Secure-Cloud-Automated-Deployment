#!/bin/bash

# clone two repo
git clone https://github.com/mit-ll/python-keylime.git
git clone https://github.com/BU-NU-CLOUD-SP18/Secure-Cloud-Automated-Deployment.git

# update setup.py in keylime
cp Secure-Cloud-Automated-Deployment/keylime-install/setup.py python-keylime/setup.py 

cd python-keylime

# install opetion for keylime on virtual machine
sudo installer.sh -s

