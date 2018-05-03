#!/usr/bin/env bash
localpath=$(dirname $0)
rootpath=${localpath}/..

###### start kafka ######
echo "###### starting kafka ######"
${rootpath}/depends/kafka/bin/zookeeper-server-start.sh ${rootpath}/depends/kafka/config/zookeeper.properties > /dev/null 2>&1 &
sleep 5
if [ -z $(${rootpath}/depends/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181 | grep tsap -w) ]; then 
	${rootpath}/depends/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic tsap
else 
	echo "tsap topic exists"
fi
if [ -z $(${rootpath}/depends/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181 | grep ti -w) ]; then 
	${rootpath}/depends/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic ti
else 
	echo "ti topic exists"
fi
if [ -z $(${rootpath}/depends/kafka/bin/kafka-topics.sh --list --zookeeper localhost:2181 | grep alarm -w) ]; then 
	${rootpath}/depends/kafka/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic alarm
else 
	echo "alarm topic exists"
fi
#${rootpath}/depends/kafka/bin/kafka-topics.sh --zookeeper localhost:2181 --list
sleep 5
${rootpath}/depends/kafka/bin/kafka-server-start.sh ${rootpath}/depends/kafka/config/server.properties > /dev/null 2>&1 &
echo "###### kafka launched success ######"

###### start flink ######
echo "###### starting flink ######"
${rootpath}/depends/flink/bin/start-cluster.sh
for i in {2..3}; do ${rootpath}/depends/flink/bin/taskmanager.sh start; done
sleep 30
curl -XPOST http://localhost:8081/upload -H "Expect:" -F "jarfile=@${rootpath}/jars/TsapCEPEngine.jar" > ${rootpath}/jars/jar.id
echo "###### flink launched success ######"

###### start restfull api ######
echo "###### starting flink ######"
cd ${rootpath}/depends/restfull/
python3 run.py



