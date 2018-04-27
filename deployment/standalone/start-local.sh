#!/usr/bin/env bash

$(dirname $0)/../depends/kafka/bin/zookeeper-server-start.sh (dirname $0)/../depends/kafka/config/zookeeper.properties > /dev/null 2>&1 &
$(dirname $0)/../depends/kafka/bin/kafka-server-start.sh (dirname $0)/../depends/kafka/config/server.properties > /dev/null 2>&1 &
sleep 5
if [ -z $($(dirname $0)/../depends/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181 | grep tsap -w) ]; then 
	$(dirname $0)/../depends/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic tsap
else 
	echo "tsap topic exists"
fi

if [ -z $($(dirname $0)/../depends/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181 | grep ti -w) ]; then 
	$(dirname $0)/../depends/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic ti
else 
	echo "ti topic exists"
fi

if [ -z $($(dirname $0)/../depends/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181 | grep alarm -w) ]; then 
	$(dirname $0)/../depends/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic alarm
else 
	echo "alarm topic exists"
fi
$(dirname $0)/../depends/kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --list
