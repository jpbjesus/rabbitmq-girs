#!/bin/bash

script=$0

docker network create -d overlay cluster-network
docker stack deploy --compose-file docker-compose.yml rmq

sleep 3

docker stack deploy --compose-file docker-monitoring.yml rmq-monitoring

status.sh
