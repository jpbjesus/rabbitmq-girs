#!/bin/bash

docker build --no-cache -t haproxy-rsyslog:latest .
docker tag haproxy-rsyslog jpbjesus/haproxy-rsyslog:latest
docker push jpbjesus/haproxy-rsyslog:latest