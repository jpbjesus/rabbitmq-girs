#!/bin/bash
# Documentation here: https://rabbitmq.github.io/rabbitmq-perf-test/stable/htmlsingle/
# -x (publishers) -y (consumers)

# The command above makes the publisher publish a message every 5 seconds. To simulate a group of consumers, use the --queue-pattern flag to simulate many consumers across many queues:
# To prevent publishers from publishing at roughly the same time and distribute the rate more evenly, 
# use the --producer-random-start-delay option to add an random delay before the first published message:

rabbitmq-perf-test-2.11.0/bin/runjava com.rabbitmq.perf.PerfTest --queue-pattern 'perf-test-%d' \
  --queue-pattern-from 1 --queue-pattern-to 1000 \
  --producers 1000 --consumers 1000 \
  --heartbeat-sender-threads 10 \
  --publishing-interval 5 \
  -h amqp://user:password@localhost:5672 --producer-random-start-delay 120

# PerfTest can use durable queues and persistent messages: -f persistent