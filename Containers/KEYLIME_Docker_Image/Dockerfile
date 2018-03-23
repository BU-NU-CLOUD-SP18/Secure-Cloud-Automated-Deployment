FROM centos:centos7

MAINTAINER Jalon Zou

WORKDIR /root

ADD . /root

RUN yum -y install wget openssl

RUN cd python-keylime && \
./installer.sh

WORKDIR /root/python-keylime/test

CMD ["./run_tests.sh"]

EXPOSE 8992
