#!/usr/bin/env bash

titans_version=0.0.1
cep_jar_version=0.1

wget -O kafka.tgz http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/1.1.0/kafka_2.11-1.1.0.tgz
wget -O flink.tgz http://mirrors.tuna.tsinghua.edu.cn/apache/flink/flink-1.4.2/flink-1.4.2-bin-hadoop28-scala_2.11.tgz
wget -O titans.tgz https://github.com/DefenseTeam/titans/archive/${titans_version}.tar.gz
wget -O TsapCepEngine.jar https://github.com/DefenseTeam/titans/releases/download/${titans_version}/TsapCEPEngine-assembly-${cep_jar_version}.jar

tar -xvf kafka.tgz && mv kafka_2.11-1.1.0 kafka
tar -xvf flink.tgz && mv flink-1.4.2 flink
tar -xvf titans.tgz && mv titans-${titans_version} titans
