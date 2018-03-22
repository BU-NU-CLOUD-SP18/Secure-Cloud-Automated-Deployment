# HIL

## Manual installation procedure for HIL:

Prerequisites: Github account and forked the HIL repository:
Install the dependencies:
```
yum install epel-release bridge-utils  gcc  httpd  ipmitool libvirt \
libxml2-devel  libxslt-devel  mod_wsgi net-tools python-pip python-psycopg2 \
python-virtinst python-virtualenv qemu-kvm telnet vconfig virt-install
```

Fork reposity to you local github from https://github.com/CCI-MOC/hil, then clone you own repository
```
git clone https://github.com/**username**/hil.git
cd hil
```

set hil end point to public port 5000
```
export HIL_ENDPOINT=http://127.0.0.1:5000
```

Configure HIL:
```
cp examples/hil.cfg.dev-no-hardware hil.cfg
```

Creating a virtual environment for Python:
```
virtualenv .venv
source .venv/bin/activate
easy_install -U setuptools
pip install --upgrade setuptools
pip install -e .
```

Initialize database:
```
hil-admin db create
```

Start server:
```
hil serve 5000
```

Make sure the server is running in the background by using this method:

Testing the setup:
```
hil list_nodes all
```

If the above command reports an empty list. HIL is successfully installed and ready for hacking.



