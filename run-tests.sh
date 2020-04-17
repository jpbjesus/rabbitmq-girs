#!/bin/bash
# Documentation here: https://rabbitmq.github.io/rabbitmq-perf-test/stable/htmlsingle/
# -x (publishers) -y (consumers)

export uri=amqp://user:password@localhost:5672

# The command above makes the publisher publish a message every 5 seconds. To simulate a group of consumers, use the --queue-pattern flag to simulate many consumers across many queues:
# To prevent publishers from publishing at roughly the same time and distribute the rate more evenly, 
# use the --producer-random-start-delay option to add an random delay before the first published message:

# PerfTest can use durable queues and persistent messages: -f persistent
# --producer-random-start-delay 120

rabbitmq-perf-test-2.11.0/bin/runjava com.rabbitmq.perf.PerfTest -f persistent -h $uri \
  --queue-pattern 'queue-test-%d' \
  --queue-pattern-from 1 --queue-pattern-to 5 \
  --json-body --size 10000 \
  --producers 1 --consumers 250 \
  --producer-random-start-delay 120 \
  --publishing-interval 5