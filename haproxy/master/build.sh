#!/bin/bash

docker build --no-cache -t haproxy-rabbitmq-master:latest .
docker tag haproxy-rabbitmq-master jpbjesus/haproxy-rabbitmq-master:latest
docker push jpbjesus/haproxy-rabbitmq-master:latest