#!/bin/bash

docker network create -d overlay cluster-network
# docker network create --driver=overlay --subnet=10.10.0.0/16 cluster-network

docker stack deploy --compose-file docker-compose.yml rmq

sleep 3

sh ./status.sh
