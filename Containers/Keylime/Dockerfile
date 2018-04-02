
FROM ubuntu:xenial

MAINTAINER MassOpenCloud

WORKDIR /root

RUN apt-get update
RUN apt-get install -y git wget

RUN git clone https://github.com/mit-ll/python-keylime.git keylime

RUN cd keylime && \
./installer.sh -s

RUN sed -i 's/REQUIRE_ROOT=True/REQUIRE_ROOT=False/' keylime/keylime/common.py

# RUN adduser keylime
# USER keylime
WORKDIR /root/keylime/test
# RUN init_tpm_server
# RUN tpm_serverd

ADD run.sh .
ADD keylime.conf /etc
ADD keylime.conf /root/keylime

CMD ["./run_tests.sh"]

EXPOSE 8992
