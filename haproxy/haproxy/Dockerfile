FROM haproxy:1.7-alpine

# ARG KEEPALIVED_VERSION=2.0.20

COPY start.sh /

ENV HAPROXY_USER haproxy

RUN addgroup --system ${HAPROXY_USER} && \
    adduser --system -g ${HAPROXY_USER} ${HAPROXY_USER} && \
    mkdir --parents /var/lib/${HAPROXY_USER} && \
    chown -R ${HAPROXY_USER}:${HAPROXY_USER} /var/lib/${HAPROXY_USER}

# RUN apk add wget gcc libc-dev libnl-dev openssl openssl-dev libnfnetlink-dev make linux-headers rsyslog \
#     && wget -O /tmp/keepalived.tar.gz "http://www.keepalived.org/software/keepalived-${KEEPALIVED_VERSION}.tar.gz" \
#     && mkdir -p /tmp/keepalived && tar -xf /tmp/keepalived.tar.gz -C /tmp/keepalived --strip-components 1 \
#     && cd /tmp/keepalived && ./configure && make && make install \
#     && mkdir -p /etc/rsyslog.d && touch /var/log/haproxy.log \
#     && cd /tmp && rm -rf /tmp/*

RUN apk add wget gcc libc-dev libnl-dev openssl openssl-dev libnfnetlink-dev make linux-headers rsyslog \
    && mkdir -p /etc/rsyslog.d && touch /var/log/haproxy.log

COPY rsyslog.conf /etc/rsyslog.d/
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
# COPY keepalived.conf /etc/keepalived/keepalived.conf

# RUN chmod 644 /etc/keepalived/keepalived.conf

STOPSIGNAL SIGTERM 

ENTRYPOINT []

CMD ["/start.sh"]