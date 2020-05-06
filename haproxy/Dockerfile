FROM haproxy:1.7-alpine

COPY start.sh /

ENV HAPROXY_USER haproxy

RUN addgroup --system ${HAPROXY_USER} && \
    adduser --system -g ${HAPROXY_USER} ${HAPROXY_USER} && \
    mkdir --parents /var/lib/${HAPROXY_USER} && \
    chown -R ${HAPROXY_USER}:${HAPROXY_USER} /var/lib/${HAPROXY_USER}

STOPSIGNAL SIGTERM 

ENTRYPOINT []

CMD ["/start.sh"]