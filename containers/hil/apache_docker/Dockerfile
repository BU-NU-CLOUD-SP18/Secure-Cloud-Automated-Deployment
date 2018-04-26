FROM leonjia0112/centos_httpd:latest

MAINTAINER Pei Jia(leojia@bu.edu)

RUN yum install epel-release bridge-utils  gcc  httpd  ipmitool libvirt \
libxml2-devel  libxslt-devel  mod_wsgi net-tools python-pip python-psycopg2 \
python-virtinst python-virtualenv qemu-kvm telnet vconfig virt-install git -y

RUN yum install python-pip -y
RUN pip install --upgrade pip
# RUN pip install setuptools
RUN pip install --upgrade setuptools

RUN export HIL_USER=hil \
    export HIL_ADMIN_USER=hil \
    export HIL_ADMIN_PASSWORD=secret \
    export HIL_HOME_DIR=/var/lib/hil

RUN useradd --system ${HIL_USER} -d ${HIL_HOME_DIR} -m -r

WORKDIR	/root

RUN git	clone https://github.com/CCI-MOC/hil

WORKDIR	/root/hil

RUN python setup.py install

WORKDIR	/root

RUN git	clone https://github.com/BU-NU-CLOUD-SP18/Secure-Cloud-Automated-Deployment.git
RUN cp /root/Secure-Cloud-Automated-Deployment/container/hil/hil.cfg /etc/hil.cfg   
RUN chown ${HIL_USER}:${HIL_USER} /etc/hil.cfg
RUN chmod 400 /etc/hil.cfg


