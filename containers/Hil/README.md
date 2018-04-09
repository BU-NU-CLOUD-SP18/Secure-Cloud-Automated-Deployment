

```
yum install epel-release bridge-utils  gcc  httpd  ipmitool libvirt \
libxml2-devel  libxslt-devel  mod_wsgi net-tools python-pip python-psycopg2 \
python-virtinst python-virtualenv qemu-kvm telnet vconfig virt-install -y
```

```
yum install git -y
```

Add the following to ```/etc/bashrc```

```
export HIL_USER=hil
export HIL_ADMIN=hil
export HIL_ADMIN_PASSWORD=secret
export HIL_HOME_DIR=/var/lib/hil
```

```
useradd --system ${HIL_USER} -d /var/lib/hil -m -r
```

```
cd /root
git clone https://github.com/CCI-MOC/hil
cd hil
python setup.py install
```


under ```/root/hil``` directory
```
cp examples/hil.cfg /etc/hil.cfg
chown ${HIL_USER}:${HIL_USER} /etc/hil.cfg
chmod 400 /etc/hil.cfg
```
(run following command as ${HIL_USER} from ${HIL_HOME_DIR}
``` 
su ${HIL_USER}
ln -s /etc/hil.cfg .
```

copy this link to ```hil.cfg``` file, comment out the sqlite uri.

```
uri = postgresql://hil:12345@172.18.0.20:5432/hil
```

Switch to hil user
```
hil-admin db create
```

```
hil-admin create-admin-user ${HIL_ADMIN_USER} ${HIL_ADMIN_PASSWORD}
```

