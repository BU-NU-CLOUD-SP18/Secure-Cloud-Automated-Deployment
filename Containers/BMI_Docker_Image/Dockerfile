FROM centos:centos7

MAINTAINER Jalon Zou

ENV container docker

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

WORKDIR /home/zjn

ADD . /home/zjn

RUN yum -y install python-setuptools python-setuptools-devel
#RUN yum groupinstall -y "development tools"

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" \
&& python get-pip.py

RUN yum -y install ceph-common

RUN yum -y install epel-release && \
yum -y install scsi-target-utils

#RUN yum -y install firewalld && \
#systemctl start firewalld && \
#systemctl enable firewalld

#RUN firewall-cmd --add-service=iscsi-target --permanent && \
#firewall-cmd --reload && \
#systemctl enable tgtd && \
#systemctl restart tgtd

RUN yum -y install dnsmasq

RUN cd ims && \
python setup.py install && \
pip install python-cephlibs && \
mv bmi_config.cfg bmi_config.cfg.orig && \
mv bmi_config.cfg.test bmi_config.cfg

RUN mkdir /etc/bmi && \
cp /home/zjn/ims/bmi_config.cfg /etc/bmi/bmiconfig.cfg && \
mkdir /home/bmi && \
cp /home/zjn/ims/bmi_config.cfg /home/bmi

CMD ["einstein_server","&&","picasso_server"]

EXPOSE 3260
