FROM bitnami/rabbitmq:latest

USER root

# COPY rabbitmq.config /opt/bitnami/rabbitmq/etc/rabbitmq/rabbitmq.config

RUN rabbitmq-plugins enable rabbitmq_prometheus \
    && rm /opt/bitnami/rabbitmq/.rabbitmq/.erlang.cookie

USER 1001