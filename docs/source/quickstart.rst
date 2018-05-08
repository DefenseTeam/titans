QuickStart
============

Setup a Titans in box instance and run an example in few simple steps.


Setup standalone Titans
--------------------------------------

Please head to the `standalone <http://titans.readthedocs.io/en/latest/deployment.html#standalone>`_ page to setup titans on a static cluster.


Or on CentOS7 with Internet connected, Titans can be launced for testing with the followed commond very quickly and simply.

.. code-block:: bash

	wget -O - https://raw.githubusercontent.com/DefenseTeam/titans/master/deployment/standalone/setup-centos-7.sh | bash

If titans started, use ``jps`` command you will see the following java process ::

	Kafka
	QuorumPeerMain
	JobManager
	TaskManager
	TaskManager
	TaskManager


Write a Titans Rule
--------------------------

Let's write a Titans rule as followed named `bro_http_hack_tools_detect <http://titans.readthedocs.io/en/latest/deployment.html>`_ , it filter each **bro_http** log entry and find **user_agent** part contains characterss of some popular scan tools.

.. code-block:: yaml
	:linenos:

	title: bro_http_hack_tools_detect
	level: medium
	stage: exploit
	category: web
	tag: hack_tools
	status: experimental
	description: hack tools scan detection from user_agent
	reference: None
	author: Defense Team
	rules:
	  - query:
	      from: bro-http
	      where:
	          or:
	              - user_agent CONTAINS sqlmap
	              - user_agent CONTAINS nessus
	              - user_agent CONTAINS BBScan
	              - user_agent CONTAINS Havij
	              - user_agent CONTAINS Netsparker
	              - user_agent CONTAINS acunetix
	              - user_agent CONTAINS masscan
	              - user_agent CONTAINS nmap
	              - user_agent CONTAINS nikto
	              - user_agent CONTAINS scan
	      fields:
	          - '*'
	      as: ALARM

Save the file as ``bro_http_hack_tools_detect.yml``.


Submit Rule
--------------------------

Using Titans RESTful API to submit your titans rule.

.. code-block:: bash

	curl -XPUT http://127.0.0.1:9527/tasks/upload/ -F file=@bro_http_hack_tools_detect.yml

and respose ::

	{
	  "success": "rule <bro_http_hack_tools_detect> upload success"
	}

Then start the rule.

.. code-block:: bash

	curl -XPOST http://127.0.0.1:9527/tasks/run/bro_http_hack_tools_detect

	{
	  "success": "rule <bro_http_hack_tools_detect> started"
	}


Check the rule running status

.. code-block:: bash

	curl -XGET http://127.0.0.1:9527/tasks/status/bro_http_hack_tools_detect
	
	{
	  "name": "bro_http_hack_tools_detect",
	  "status": "running",
	  "start_time": "2018-05-06, 15:15:17",
	  "duration": "3d 0h",
	  "job_id":"xxx"
	}

you can also checkout the running rules by http://127.0.0.1:8081/#/running-jobs.

Data input
-----------------

.. role:: raw-html(raw)
   :format: html
.. default-role:: raw-html

`<S>` collect data and send to kafka `</S>`

Alarm generation
----------------------

alarm








