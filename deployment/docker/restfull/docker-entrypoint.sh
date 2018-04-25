#!/bin/sh
FLINK_SERVER=http://jobmanager:8081/
JAR_PATH=/run/jars/

sleep 30

curl -XPOST ${FLINK_SERVER}jars/upload -H "Expect:" -F "jarfile=@${JAR_PATH}TsapCEPEngine-assembly-0.1.jar" > ${JAR_PATH}jar.id
tail -f ${JAR_PATH}jar.id
# python3 run.py

