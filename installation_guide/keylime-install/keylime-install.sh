#!/bin/bash

cwd=$(pwd)
cd

git clone https://github.com/mit-ll/python-keylime.git


cp $cwd/setup.py ~/python-keylime/setup.py 


cd ~/python-keylime/

# install opetion for keylime on virtual machine
sudo ./installer.sh -s

cd ~/python-keylime/test/
sudo ./run_tests.sh
