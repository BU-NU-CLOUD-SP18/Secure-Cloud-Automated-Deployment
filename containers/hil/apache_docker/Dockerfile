FROM httpd:latest

MAINTAINER Pei Jia(leojia@bu.edu)

# This dockerfile is for installing hil verison 0.2 apache server and network server

# Install dependencies for hil insatllation

USER root
RUN yum install epel-release bridge-utils  gcc  httpd  ipmitool libvirt \
libxml2-devel  libxslt-devel  mod_wsgi net-tools python-pip python-psycopg2 \
python-virtinst python-virtualenv qemu-kvm telnet vconfig virt-install git -y

RUN yum install python-pip -y
RUN pip install --upgrade pip
# RUN pip install setuptools
RUN pip install --upgrade setuptools

# export environment variable
RUN export HIL_USER=hil \
    export HIL_ADMIN_USER=hil \
    export HIL_ADMIN_PASSWORD=secret \
    export HIL_HOME_DIR=/var/lib/hil

# create a hil system hil
RUN useradd --system hil -d /var/lib/hil -m -r

# Install HIL from hil repo
WORKDIR /root
RUN git clone https://github.com/CCI-MOC/hil && \
    cd /root/hil && \
    git checkout 1248996

WORKDIR /root/hil
RUN python setup.py install

# change hil configuration file from bolted repo
WORKDIR /root
RUN ls
RUN git clone https://github.com/BU-NU-CLOUD-SP18/Secure-Cloud-Automated-Deployment.git
RUN cp /root/Secure-Cloud-Automated-Deployment/containers/hil/hil.cfg /etc/hil.cfg
# RUN sed -i 's@uri = postgresql://hil:12345@172.18.0.20:5432/hil@uri = postgresql://hil:12345@172.17.0.2:5432/hil@' /etc/hil.cfg
RUN chown hil:hil /etc/hil.cfg
RUN chmod 400 /etc/hil.cfg

# setup hil apache server and network server
RUN cp /root/Secure-Cloud-Automated-Deployment/containers/hil/wsgi.conf /etc/httpd/conf.d/wsgi.conf
RUN mkdir /var/www/hil
RUN cp /root/hil/hil.wsgi /var/www/hil/hil.wsgi
RUN echo "($ cd /var/lib/hil && su hil -c 'hil serve-networks') &" >> /etc/rc.local

# create admin user of hil
USER hil
WORKDIR /var/lib/hil
RUN ln -s /etc/hil.cfg .
RUN export HIL_ENDPOINT=http://127.0.0.1:80 && \
    hil-admin db create && \
    hil create_admin_user hil 11111

RUN echo "export HIL_ENDPOINT=http://127.0.0.1:80" >> env_hil
RUN echo "export HIL_USERNAME=hil" >> env_hil
RUN echo "export HIL_PASSWORD=11111" >> env_hil

USER root
WORKDIR /

CMD ["/run-httpd.sh"]

EXPOSE 80
