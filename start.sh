#!/bin/bash

docker network create -d overlay cluster-network

docker stack deploy --compose-file docker-compose.yml rmq
docker stack deploy --compose-file docker-monitoring.yml rmq-monitoring

sleep 3

sh ./status.sh
