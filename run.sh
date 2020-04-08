#!/bin/bash

docker network create -d overlay cluster-network || true
docker stack deploy --compose-file docker-compose.yml rabbitmq 