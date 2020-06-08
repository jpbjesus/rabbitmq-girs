#!/bin/bash

sh ./create-network.sh

sleep 1

sh ./start-monitoring.sh

sleep 1

sh ./start-logging.sh

sh ./status.sh