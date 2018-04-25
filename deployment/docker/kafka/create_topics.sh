#!/bin/bash
sleep 5
if [ -z $(/kafka_2.11-1.0.0/bin/kafka-topics.sh --list --zookeeper zookeeper:2181 | grep tsap -w) ]; then 
	/kafka_2.11-1.0.0/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic tsap
else 
	echo "tsap topic exists"
fi

if [ -z $(/kafka_2.11-1.0.0/bin/kafka-topics.sh --list --zookeeper zookeeper:2181 | grep ti -w) ]; then 
	/kafka_2.11-1.0.0/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic ti
else 
	echo "ti topic exists"
fi

if [ -z $(/kafka_2.11-1.0.0/bin/kafka-topics.sh --list --zookeeper zookeeper:2181 | grep alarm -w) ]; then 
	/kafka_2.11-1.0.0/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic alarm
else 
	echo "alarm topic exists"
fi