FROM python:3.6.5-alpine3.7
MAINTAINER xiao_xing <xingxiao@htsc.com>
RUN apk update
RUN apk add wget curl gcc curl-dev musl-dev python3-dev openssl-dev
ADD requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
ADD src /run/restfull/
RUN mkdir /run/jars/ && wget -P /run/jars/ https://github.com/xing-xiao/Titans/releases/download/0.1/TsapCEPEngine-assembly-0.1.jar
WORKDIR /run/restfull/
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
EXPOSE 9527
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["python3", "run.py"]

