#!/bin/bash

docker build --no-cache -t grafana:latest .
docker tag grafana jpbjesus/grafana:latest
docker push jpbjesus/grafana:latest