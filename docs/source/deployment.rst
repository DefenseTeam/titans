Configuration and Deployment
====================================

Titans can be run on YARN, Docker, Kubernetes, AWS or a simple standalone deploy mode.

Standalone
----------

Titans run on GNU/Linux, recommended **CentOS 7**, **Ubuntu 16.04** or **Debian stretch**. On a single CentOS 7 machine with Internet conncted, titans can setup by a script simply.

.. code-block:: bash

	wget -O - https://raw.githubusercontent.com/DefenseTeam/titans/master/deployment/standalone/setup-centos-7.sh | bash

Or you can launch a standalone cluster manually.

Requirements
^^^^^^^^^^^^^^^^

Requirements for Titans include:

 * **Java 1.8.x** or higher must be installed
 * **Python3.6.4** must be installed and python package **titans-restful** must be installed (titans-restful can be installed by ``pip install titians-restful`` from pypi)
 * **ssh** must be installed and sshd must be running

Download
^^^^^^^^^^^^^^^^

Download a recent stable release like **titans-bin-x.y.z.tgz** from `Titans Downloads page <https://github.com/DefenseTeam/titans/releases>`_

Setup
^^^^^^^^^^^^^^^^

Setup Titans standalone with following steps:

1. Unpack the download Titans distribution

.. code-block:: bash

	tar xzf titans-bin-x.y.z.tgz
	cd titans-bin-x.y.x.tgz

2. start titans, to stop Titans, there is also a ``stop-local.sh`` script

.. code-block:: bash

	bin/start-local.sh


3. submit and start your cep rule.

.. code-block:: bash

	curl -XPUT http://<your server>:9527/tasks/upload/ -F file=@<rule name>.yml
	curl -XPOST http://<your server>:9527/tasks/run/<rule name>


Yarn
----------

.. role:: raw-html(raw)
   :format: html
.. default-role:: raw-html

`<S>` deploy titans on Yarn `</S>`


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

Starting titans by docker compose with following steps.

1. Download ``docker-compose.yml``

.. code-block:: bash

	wget https://raw.githubusercontent.com/DefenseTeam/titans/master/deployment/docker/docker-compose.yml

2. Launch titans in the foreground

.. code-block:: bash

	docker-compose up

or in the backgroud

.. code-block:: bash

	docker-compose up -d

3. scale flink task managers

.. code-block:: bash

	docker-compose scale taskmanager=<N>

4. submit and start your cep rule.

.. code-block:: sh

	curl -XPUT http://<your server>:9527/tasks/upload/ -F file=@<rule name>.yml
	curl -XPOST http://<your server>:9527/tasks/run/<rule name>



Kubernetes
----------
.. role:: raw-html(raw)
   :format: html
.. default-role:: raw-html

`<S>` deploy titans on K8S `</S>`

AWS
----------
.. role:: raw-html(raw)
   :format: html
.. default-role:: raw-html

`<S>` deploy titans on AWS `</S>`

