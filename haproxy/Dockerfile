FROM haproxy:1.7-alpine

COPY entrypoint.sh /

ENV HAPROXY_USER haproxy

RUN addgroup --system ${HAPROXY_USER} && \
    adduser --system -g ${HAPROXY_USER} ${HAPROXY_USER} && \
    mkdir --parents /var/lib/${HAPROXY_USER} && \
    chown -R ${HAPROXY_USER}:${HAPROXY_USER} /var/lib/${HAPROXY_USER}

RUN apk add rsyslog \
    && mkdir -p /etc/rsyslog.d && touch /var/log/haproxy.log 

COPY rsyslog.conf /etc/rsyslog.d/

STOPSIGNAL SIGTERM 

ENTRYPOINT []

CMD ["/entrypoint.sh"]