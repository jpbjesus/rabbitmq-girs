#!/bin/bash

docker build -t haproxy-rabbitmq:latest .
docker tag haproxy-rabbitmq jpbjesus/haproxy-rabbitmq:latest
docker push jpbjesus/haproxy-rabbitmq:latest