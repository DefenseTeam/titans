#!/usr/bin/env bash

yum update
yum install -y wget curl vim java-1.8.0-openjdk* gcc make bzip2-devel ncurses-devel sqlite-devel gdbm-devel xz-devel tk-devel readline-devel libaio
yum install -y libcurl-devel openssl-devel
wget -O python3.tar.xz https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz
xz -d python3.tar.xz
tar -xvf python3.tar
cd Python-3.6.4/
./configure --with-ssl --prefix=/usr/local/python3.6
make
make install
ln -s /usr/local/python3.6/bin/python3 /usr/bin/titans-python
ln -s /usr/local/python3.6/bin/pip3 /usr/bin/titans-pip
titans-pip install titans-restful

# get packages
mkdir /opt/tsap/
cd /opt/tsap
wget -O kafka.tgz http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/1.1.0/kafka_2.11-1.1.0.tgz
wget -O flink.tgz http://mirrors.tuna.tsinghua.edu.cn/apache/flink/flink-1.4.2/flink-1.4.2-bin-hadoop28-scala_2.11.tgz
wget -O tsap.tgz https://github.com/DefenseTeam/titans/archive/0.0.1.tar.gz

# run kafka
tar -xvf kafka.tgz
kafka_path=/opt/tsap/kafka_2.11-1.1.0/

${kafka_path}bin/zookeeper-server-start.sh ${kafka_path}config/zookeeper.properties > /dev/null 2>&1 &
${kafka_path}bin/kafka-server-start.sh ${kafka_path}config/server.properties > /dev/null 2>&1 &
${kafka_path}bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic tsap > /dev/null 2>&1 &
${kafka_path}bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic alarm > /dev/null 2>&1 &
${kafka_path}bin/kafka-topics.sh --zookeeper localhost:2181 --list

# run flink
tar -xvf flink.tgz
flink_path=/opt/tsap/flink-1.4.2/

${flink_path}bin/start-cluster.sh
for i in {0..1}; do ${flink_path}bin/taskmanager.sh start; done


