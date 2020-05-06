#!/bin/bash
docker network create -d overlay cluster-network
docker stack deploy --compose-file docker-compose.yml rmq