#!/usr/bin/env bash

titans_version=0.0.1
cep_jar_version=0.1
root_path=$(pwd)/titans-bin-${titans_version}

rm -rf ${root_path}
mkdir ${root_path}
cd ${root_path}
mkdir jars
mkdir depends
mkdir bin

#wget -O depends/kafka.tgz http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/1.1.0/kafka_2.11-1.1.0.tgz
cp /tmp/kafka_2.11-1.1.0.tgz depends/kafka.tgz
#wget -O depends/flink.tgz http://mirrors.tuna.tsinghua.edu.cn/apache/flink/flink-1.4.2/flink-1.4.2-bin-hadoop28-scala_2.11.tgz
cp /tmp/flink-1.4.2-bin-hadoop28-scala_2.11.tgz depends/flink.tgz
wget -O depends/titans.tgz https://github.com/DefenseTeam/titans/archive/${titans_version}.tar.gz
wget -O jars/TsapCepEngine.jar https://github.com/DefenseTeam/titans/releases/download/${titans_version}/TsapCEPEngine-assembly-${cep_jar_version}.jar

cd ${root_path}/depends
tar -xvf kafka.tgz && rm -f kafka.tgz && mv kafka_2.11-1.1.0 kafka
tar -xvf flink.tgz && rm -f flink.tgz && mv flink-1.4.2 flink
tar -xvf titans.tgz && rm -f titans.tgz && mv titans-${titans_version} titans

cd ${root_path}/bin
wget https://raw.githubusercontent.com/DefenseTeam/titans/master/deployment/standalone/start-local.sh
wget https://raw.githubusercontent.com/DefenseTeam/titans/master/deployment/standalone/stop-local.sh

cd ${root_path}
tar cfz titans-bin-${titans_version}.tgz *
mv titans-bin-${titans_version}.tgz ../
cd ..
rm -rf ${root_path}




