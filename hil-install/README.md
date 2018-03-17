Installation procedure for HIL:

Prerequisites: Github account and forked the HIL repository:
Install the dependencies:
```
yum install epel-release bridge-utils  gcc  httpd  ipmitool libvirt \
libxml2-devel  libxslt-devel  mod_wsgi net-tools python-pip python-psycopg2 \
python-virtinst python-virtualenv qemu-kvm telnet vconfig virt-install
```

Clone repo:
```
git clone https://github.com/**username**/hil.git
cd hil
```

( Go to the repository and the fork place, the in the clone or download part- if we click, a link will come, copy paste that link.. it ends with a hil.git)
Creating a virtual environment for Python:
```
virtualenv .venv
source .venv/bin/activate
easy_install -U setuptools
pip3 install --upgrade setuptools
pip install -e .[tests]
```

Configure HIL:
```
cp examples/hil.cfg.dev-no-hardware hil.cfg
```

Initialize database:
```
hil-admin db create
```

Start server:
```
hil serve 5000
```
( this a is used for running the server in the background)

From a separate terminal window: (Can do it in the same terminal itself)
```
cd ~/hil/
virtualenv .venv
source .venv/bin/activate
pip install -e .
```

Make sure the server is running in the background by using this method:

Testing the setup:
```
hil list_nodes all
```

If the above command reports an empty list. HIL is successfully installed and ready for hacking.



