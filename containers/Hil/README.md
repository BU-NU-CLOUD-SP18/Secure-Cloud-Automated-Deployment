# Hil Image
HiL contains two images to perform the hil service. The first image is an Apache image that has Hil server install, the other image is a PostgreSQL image that has PostgreSQL server as hil database. 

# Manual create image
This tutorial walk through the procedure create container image for both hil images. The frist tutorial shows the procedure of creating PostgreSQL database for hil, the second tutorial shows the procedure of creating hil Apache server and network server.

## PostgreSQL image
Download the PostgreSQL image from docker hub
```
$ docker pull postgres:latest
```
Then run the PostgreSQL image, this container automated expose port ```5432``` for public access
```
$ docker run -itd --name hil_postgres postgres:latest
```
Once the container is running, open a shell for the container to do further modification.
```
$ docker exec -it hil_postgres bash
```
Modify the ```/var/lib/postgresql/data/pg_hba.conf``` file from ```trust``` to ```md5```
```
$ sed -i 's@host    all             all             127.0.0.1/32            trust@host    all             all             127.0.0.1/32            md5@' /var/lib/postgresql/data/pg_hba.conf
$ sed -i 's@host    all             all             ::1/128                 trust@host    all             all             ::1/128                 md5@' /var/lib/postgresql/data/pg_hba.conf
```
Create a system user called ```hil``` with home directory at ```/var/lib/hil```
```
$ useradd hil --system -d /var/lib/hil -m -r
```
Switch to ```postgres``` user before create a role
```
$ su - postgres
```
Create a database role named hil with privileges (-r create roles -d create databases and -P will prompt for the password of the new user)
```
$ createuser -r -d -P hil
```
Confirm that the role with requisite privileges is created as postgres user:
```
$ psql -c '\dg'
                             List of roles
 Role name |                   Attributes                   | Member of
-----------+------------------------------------------------+-----------
 hil       | Create role, Create DB                         | {}
 postgres  | Superuser, Create role, Create DB, Replication | {}

```
Exit and change to ```hil``` user before create a database for hil
```
$ su - hil
$ createdb hil
```
confirm it created a database named hil and it is owned by hil:
```
$ psql -c '\l'
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
-----------+----------+----------+-------------+-------------+-----------------------
  hil      | hil      | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
```
Put following string in ```hil.cfg``` under section ```[database]```.It follows the format: ```postgresql://<user>:<password>@<address>/<dbname>``` where ```<user>``` is the name of the postgres user you created, ```<password>``` is its password, ```<dbname>``` is the name of the database you created, and ```<address>``` is the address which hil should use to connect to postgres (In a typical default postgres setup, the right value is localhost).. Make sure all the angle brackets are substitute before put into ```hil.cfg``` file.
```
uri = postgresql://<usern>:<password>@<address>:5432/<dbname>
```

## Hil image
HIL requires a number of packages, install Dependencies for hil:
```
$ yum install epel-release bridge-utils  gcc  httpd  ipmitool libvirt \
libxml2-devel  libxslt-devel  mod_wsgi net-tools python-pip python-psycopg2 \
python-virtinst python-virtualenv qemu-kvm telnet vconfig virt-install git -y
```
Environment Variable 
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
