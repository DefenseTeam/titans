FROM flink:1.4
MAINTAINER xiao_xing <xingxiao@htsc.com>
RUN sed -i "83ajobmanager.web.upload.dir: /opt/flink/tsap/" /opt/flink/conf/flink-conf.yaml
ADD xxx.jar /opt/fink/tsap/xxx.jar
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 6123 8081
CMD ["help"]