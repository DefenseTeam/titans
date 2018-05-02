#!/usr/bin/env bash

kill -9 $(jps | grep QuorumPeerMain -w | awk '{print $1}')
kill -9 $(jps | grep Kafka -w | awk '{print $1}')
kill -9 $(jps | grep TaskManager -w | awk '{print $1}')
kill -9 $(jps | grep JobManager -w | awk '{print $1}')