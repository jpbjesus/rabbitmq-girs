#!/bin/bash

docker build --no-cache -t haproxy:latest .
docker tag haproxy jpbjesus/haproxy:latest
docker push jpbjesus/haproxy:latest