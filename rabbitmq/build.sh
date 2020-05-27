#!/bin/bash

docker build --no-cache -t rabbitmq:latest .
docker tag rabbitmq jpbjesus/rabbitmq:latest
docker push jpbjesus/rabbitmq:latest