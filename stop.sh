#!/bin/bash

docker stack rm rmq
docker stack rm rmq-perftests
docker stack rm rmq-monitoring
# docker system prune -a