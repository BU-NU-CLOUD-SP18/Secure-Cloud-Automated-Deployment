FROM centos:7

MAINTAINER Jalon Zou

RUN adduser zjn && \
    yum install -y sudo && \
    echo "zjn ALL=(root) NOPASSWD:ALL" | tee -a /etc/sudoers.d/zjn && \
    chmod 777 /

#USER zjn

WORKDIR /home/zjn

ADD . /home/zjn

RUN yum groupinstall -y "development tools"

RUN cat pyreqs.txt | xargs yum -y install

RUN tar xf Python-2.7.14.tar.xz \
&& cd Python-2.7.14 \
&& ./configure --prefix=/usr/local --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" \
&& make \
&& make altinstall

#RUN mv /usr/bin/python /usr/bin/python2
#RUN ln -s /usr/local/bin/python2 /usr/bin/python
#RUN sed -i 's@/usr/bin/python@/usr/bin/python2@g' /usr/bin/yum

RUN python2.7 --version

RUN cat depreqs.txt | xargs yum -y install
#RUN yum -y install wget

ENV HIL_ENDPOINT http://127.0.0.1:5000

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" \
&& python2.7 get-pip.py \
&& pip install setuptools --upgrade \
&& easy_install -U  setuptools\
&& yum install -y python34-setuptools \
&& easy_install-3.4 pip \
&& pip3 install --upgrade setuptools \
&& export HIL_ENDPOINT=http://127.0.0.1:5000 \
&& cd hil \
&& pip install -e . \
&& cp examples/hil.cfg.dev-no-hardware hil.cfg

User zjn

ENV HIL_ENDPOINT http://127.0.0.1:5000

WORKDIR /home/zjn/hil

EXPOSE 5000

CMD ["hil-admin","db","create","&&","hil"," serve"," 5000"]
