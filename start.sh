#!/bin/bash

docker network create -d overlay cluster-network

docker stack deploy --compose-file docker-compose.yml rmq

sleep 3

sh ./status.sh
