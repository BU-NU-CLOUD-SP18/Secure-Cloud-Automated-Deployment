

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

All HIL commands in these instructions should be run in this directory:
```
cd /var/lib/hil
```

#### For systems that do not support systemd:
Some systems like the LTS version of Ubuntu, Ubuntu 14.04 does not come with systemd pre-installed. It uses “Upstart” an equivalent of systemd to manage its daemons/processes.

For such systems, the networking server may be started as the HIL user by running:

```
$ hil-admin serve-networks &
```
To make this happen on boot, add the following to /etc/rc.local:

```
($ cd /var/lib/hil && su hil -c 'hil-admin serve-networks') &
```
