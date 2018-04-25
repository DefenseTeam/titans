Installation and Deployment
===========================

blablabla...

Standalone
----------

单机版部署模式

Yarn
----------

Yarn部署模式

Docker
----------

`Docker <https://www.docker.com/>`_ is a popular container runtime, and `Docker Compose <https://docs.docker.com/compose/>`_ is a convenient way to run titan containers locally.

Docker Images
^^^^^^^^^^^^^^^^^^

Titans is composed of many services, each service started in one container. In titans we use some offical images(eg. zookeeper, redis, flink, elk), rebuild some service images(eg. kafka, restfull-api) hosted on `Aliyun Container Registry <https://dev.aliyun.com/>`_.

The folling shows the images used in titans:

	* *zookeeper: zookeeper:3.4*
	* *kafka: registry.cn-hangzhou.aliyuncs.com/htsec/titan_kafka:latest*
	* *redis: redis:latest*
	* *flink: flink:1.4*
	* *restfull: registry.cn-hangzhou.aliyuncs.com/htsec/titan_restfull:latest*
	* *elasticsearch: ...*
	* *logstash: ...*

Docker Compose
^^^^^^^^^^^^^^^^^^

You can use docker compose to run titans easily. Titans required docker engine version 1.13.0 or later.

Starting titans by docker compose as following steps.

1. Download ``docker-compose.yml``

.. code-block:: bash

	>> wget https://raw.githubusercontent.com/DefenseTeam/titans/master/deployment/docker/docker-compose.yml

2. Launch titans in the foreground

.. code-block:: bash

	>> docker-compose up

or in the backgroud

.. code-block:: bash

	>> docker-compose up -d

3. scale flink task slots

.. code-block:: bash

	>> docker-compose scale taskmanager=<N>

4. submit and start your cep rule.

.. code-block:: bash

	>> curl -XPUT http://<your server>:9527/tasks/upload/ -F file=@<rule name>.yml
	>> curl -XPOST http://your server>:9527/tasks/run/<rule name>



Kubernetes
----------
k8s部署模式

AWS
----------
AWS部署模式

