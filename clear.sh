#!/bin/bash

docker stack rm rmq
docker stack rm rmq-perftests
# docker system prune -a