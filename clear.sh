#!/bin/bash

docker stack rm rmq
docker stack rm perftest
# docker system prune -a