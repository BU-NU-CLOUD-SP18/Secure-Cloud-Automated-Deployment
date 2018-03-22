FROM centos:centos7

MAINTAINER Jalon Zou

WORKDIR /home/zjn

ADD . /home/zjn

RUN yum -y install wget

RUN cd python-keylime && \
./installer.sh -s

WORKDIR /home/zjn/python-keylime/test

CMD ["./run_tests.sh"]

EXPOSE 4000
