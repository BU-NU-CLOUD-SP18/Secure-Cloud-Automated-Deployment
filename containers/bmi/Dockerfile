FROM centos/systemd

MAINTAINER Jiangnan_Zou

# Create user and remove password for root
RUN useradd -ms /bin/bash bmi
RUN passwd -d bmi
RUN passwd -d root
RUN usermod -aG wheel bmi


WORKDIR /home/bmi


# install pip
RUN yum -y install python-setuptools python-setuptools-devel
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" \
&& python get-pip.py


# install tgtd service and other dependencies
RUN yum -y install ceph-common
RUN yum -y install epel-release && \
yum -y install scsi-target-utils && \
systemctl enable tgtd


# install DNS service
RUN yum -y install dnsmasq


# install BMI
RUN yum -y install git && \
git clone https://github.com/CCI-MOC/ims


WORKDIR /home/bmi/ims

RUN python setup.py install && \
pip install python-cephlibs && \
rm bmi_config.cfg


# Add bmi configuration file into container
ADD bmi_ip_gen.sh bmi_ip_gen.sh
RUN chmod +x bmi_ip_gen.sh
ADD bmi_config.cfg bmi_config.cfg
RUN ./bmi_ip_gen.sh


# Add the BMI execute script
ADD runbmi.sh /home/bmi
RUN chmod a+x /home/bmi/runbmi.sh


# Set Environment variables
ENV HIL_USERNAME admin
ENV HIL_PASSWORD admin


# Create required folders
RUN mkdir /etc/bmi/
RUN mkdir /var/log/bmi/
RUN mkdir /var/lib/tftpboot/
RUN mkdir /var/lib/tftpboot/pxelinux.cfg/
RUN mkdir /var/lib/bmi/


# Configure BMI
RUN cp bmi_config.cfg /etc/bmi/bmiconfig.cfg && \
cp bmi_config.cfg /home/bmi


# Set Permissions
RUN chown bmi:bmi /etc/tgt/conf.d/
RUN chown bmi:bmi /var/log/bmi/
RUN chown bmi:bmi /var/lib/tftpboot/
RUN chown bmi:bmi /var/lib/tftpboot/pxelinux.cfg/
RUN chown bmi:bmi /var/lib/bmi/


# Create local database
WORKDIR /etc/bmi
RUN bmi project create project auto-net
RUN sqlite3 bmi.db && sqlite3 bmi.db "insert into project values(1,'bmi_infra','provision');"

RUN pip install dumb-init

# Switch user
USER bmi


WORKDIR /home/bmi
ENV BMI_CONFIG /etc/bmi/bmiconfig.cfg


# Set Entrypoint in the container
ENTRYPOINT ["/home/bmi/runbmi.sh"]


# Start dependencies when container starts
# CMD dumb-init /home/bmi/runbmi.sh


# Expose ports to outside
EXPOSE 3260 7000 9000 9893


# Expose as volume to get keyring and ceph config
VOLUME /etc/ceph
