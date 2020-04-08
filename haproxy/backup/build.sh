#!/bin/bash

docker build --no-cache -t haproxy-rabbitmq-backup:latest .
docker tag haproxy-rabbitmq-backup jpbjesus/haproxy-rabbitmq-backup:latest
docker push jpbjesus/haproxy-rabbitmq-backup:latest