FROM leonjia0112/hil_apache:latest

MAINTAINER Pei Jia(leojia@bu.edu)

ARG DATABASE_IP
# ARG ADMIN_USERNAME
# ARG ADMIN_PASSWORD

USER root
WORKDIR /

RUN cat /etc/hil.cfg
RUN ls
ADD set_database_ip.sh /var/lib/hil
RUN /bin/bash /var/lib/hil/set_database_ip.sh $DATABASE_IP
RUN cat /etc/hil.cfg

# USER hil
# WORKDIR /var/lib/hil

# RUN export HIL_ENDPOINT=http://127.0.0.1:80 && \
#    hil-admin db create && \
#    hil create_admin_user $ADMIN_USERNAME $ADMIN_PASSWORD

# RUN echo "export HIL_ENDPOINT=http://127.0.0.1:80" >> env_hil && \
#     echo "export HIL_USERNAME=$ADMIN_USERNAME" >> env_hil && \
#    echo "export HIL_PASSWORD=$ADMIN_PASSWORD" >> env_hil && \
#     source env_hil

# USER root
# WORKDIR /

CMD ["/run-httpd.sh"]

EXPOSE 80

