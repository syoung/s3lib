rabbit



<entry [Sun 2015:08:30 18:15:21 EST] RABBITMQ COSTING>

How to Estimate RabbitMQ part 1
How do you estimate the infrastructure needed for a RabbitMQ installation?

It's a serious problem, you want to use or are already using RabbitMQ but you have no idea what the infrastructure should be for each node, and the cluster as a whole.  Over the past 3 years I have been building a method for answering these questions for RabbitMQ, but it could be useful for any distributed cluster product. 


How many messages per day do you have going through your current system?
How much message growth in % are you expecting year over year?
Do you have peak hours where messaging is on the average sustainted higher than normal (peak hours)?  If so what are the hours?
What are the non-peak hours where there a fewer messages on average?
How many messages/second do you have/plan on having for peak and non-peak?
What is the planned life-span of a message (on average, or give detailed percentages) if it is not ingested by a consumer?
What is the size of your messages?  Can you break down into small/medium/large and give percentages?
What percentage of your messages need to be recoverable if the broker fails?
What percentage of your messages and queues need to be available in real-time if a broker fails?
Are you planning on sharing data across two data Centers separated by a WAN?
Are you planning on having an active-active configration for Disaster Recovery?
If you are planning on using RabbitMQ in multiple Data Centers, what percentage of the messages do you estimate will be shared?
What is the expected amount of time (in seconds) that you need to have messages saved in the queues for the worst case scenario?
How many messages are transformed by some intermediate system?

*** Do you need to have confirmation that a message has been placed onto a queue?

Do you need confirmation that the message has been processed by a consumer?
Do you have any clients that are expecting JTA transactions?
Do you have any clients that are expecting XA transactions?
What is your existing infrastructure plan?  How did you reach this plan?
What is the expected uptime of the hardware infrastructure? i.e. 99.9% or 99.99%
What is the expected RabbitMQ server uptime? i.e. 99.9% or 99.99%
Is there a hardware load balancer?  If not, are you using a software load balancer?
What is the monitoring plan, if any for RabbitMQ?  If there is none, what is the preferred tool in the organization?
Explain the scenario of working with RabbitMQ outages, is it a shared services team or a dedicated team?
Are the machines that RabbitMQ deployed on VM's or physical hardware?  If VM, are you using SAN for disk?
Is the link between the two WAN's encrypted or does RabbitMQ need to encrypt traffic between the nodes?
What is the corporate standard for authentication of applications access to resources such as a Messaging system?
Is LDAP authentication required?
Is LDAP authorization required?
If LDAP is not required: Do you plan on having users have only the ability to access their own queues/exchanges?
If LDAP is not requireed: Does each application accessing RabbitMQ need a username/password, is does every User who uses the application need a username/password?


    
</entry>
<entry [Sun 2015:08:30 08:57:46 EST] DEBUG QUEUES WITH rabbitmqadmin>

**** USERS ****

CREATE administrator ACCOUNT
(AVOID ERROR Not found: /api/exchanges/test)

rabbitmqctl add_user administrator runrabit%
rabbitmqctl set_user_tags administrator administrator
rabbitmqctl set_permissions -p / administrator ".*" ".*" ".*"
rabbitmqctl add_vhost rabbitvhost
rabbitmqctl set_permissions -p rabbitvhost administrator ".*" ".*" ".*"


ADD USER

#### CREATE RABBITMQ ACCOUNT
sudo rabbitmqctl add_user rabbituser runrabit%2
sudo rabbitmqctl add_vhost rabbitvhost
sudo rabbitmqctl set_permissions -p rabbitvhost rabbituser ".*" ".*" ".*"

DELETE USER

rabbitmqctl delete_user rabbituser


**** EXCHANGES ****

DECLARE EXCHANGE

rabbitmqadmin -u administrator -p runrabit% declare exchange --vhost=rabbitvhost name=exchangeNew type=direct

rabbitmqadmin declare exchange --vhost=rabbitvhost name=exchangeNew type=direct -u administrator -p runrabit%


LIST EXCHANGES

rabbitmqadmin -V test list exchanges --vhost rabbitvhost -u administrator -p runrabit%
+-------------+--------------------+---------+-------------+---------+----------+
|    vhost    |        name        |  type   | auto_delete | durable | internal |
+-------------+--------------------+---------+-------------+---------+----------+
| rabbitvhost |                    | direct  | False       | True    | False    |
| rabbitvhost | amq.direct         | direct  | False       | True    | False    |
| rabbitvhost | amq.fanout         | fanout  | False       | True    | False    |
| rabbitvhost | amq.headers        | headers | False       | True    | False    |
| rabbitvhost | amq.match          | headers | False       | True    | False    |
| rabbitvhost | amq.rabbitmq.trace | topic   | False       | True    | False    |
| rabbitvhost | amq.topic          | topic   | False       | True    | False    |
| rabbitvhost | exchangeNew        | direct  | False       | True    | False    |
+-------------+--------------------+---------+-------------+---------+----------+


**** MESSAGES ****

PUBLISH MESSAGE


rabbitmqadmin publish exchange=exchangeNew routing_key= payload="TEST"

rabbitmqadmin publish exchange=chat routing_key= payload="TEST"

GET MESSAGE

rabbitmqadmin get queue=chat requeue=false




--vhost rabbitvhost -u administrator -p runrabit%

    
</entry>


    
</entry>
<entry [Tue 2015:08:11 05:34:10 EST] FIXED Bad frame read>

PROBLEM

DAEMON FAILS WITH ERROR 'Bad frame read':

/a/bin/daemon# ./agua --log 4

2015-08-11 05:42:39    [DEBUG]   	Agua::Common::Base::getData	119	DOING self->notifyStatus(data)
2015-08-11 05:42:39    [DEBUG]   	Exchange::notifyStatus	35	status: undef
2015-08-11 05:42:39    [DEBUG]   	Exchange::sendFanout	72	connection: bless( do{\(my $o = 172171040)}, "Net::RabbitMQ" )
2015-08-11 05:42:39    [DEBUG]   	(eval)	86	BEFORE connection->connect()
2015-08-11 05:42:39    [DEBUG]   	(eval)	88	AFTER connection->connect()
2015-08-11 05:42:39    [DEBUG]   	(eval)	97	DOING connection->queue_declare(1, chat, declare_opts: {"auto_delete":0,"durable":1}
Bad frame read. at /a/lib/Queue/Daemon.pm line 177.
Expected fram body, got 1! at /a/lib/Queue/Daemon.pm line 177.
 [x] Sent fanout on host localhost, exchange chat: {"database":"agua","token":"C2P7dsHmw43eEkS1","sendtype":"resp

THEN AGAIN AFTER MESSAGE BODY:
 
"0","items":[],"path":"Workflow1","name":"Workflow1"}}},"views":[],"stages":[],"viewfeatures":[],"sharedviews":[]},"sourceid":"plugins_data_Controller_0","database":"agua","username":"guest","callback":"loadData"}
2015-08-11 05:28:06    [DEBUG]   	(eval)	322	AFTER object->getData
2015-08-11 05:28:06    [DEBUG]   	Queue::Daemon::handleFanout	328	CHILD 13339 AFTER try
2015-08-11 05:28:06    [DEBUG]   	Queue::Daemon::handleFanout	331	END

/a/bin/daemon# Bad frame read. at /a/lib/Queue/Daemon.pm line 177.






SOLUTION

CURRENT VERSION: 3.2.4

LATEST VERSION: 3.5.4





</entry>
<entry [Sun 2015:03:15 13:07:28 EST] EFFECT OF ADDING/REMOVING agua INSTANCE AND localhost:8080 BROWSER CONNECTION>


1. KILL localhost:8080

Queues			DELETED
Bindings		DELETED TWICE
Consumers		DELETED

rabbitmqctl report


Queues on /:
pid	name	durable	auto_delete	arguments	owner_pid	policy	exclusive_consumer_pid	exclusive_consumer_tag	messages_ready	messages_unacknowledged	messages	consumers	memory
rabbit@comp3.1.810.0	chat	true	false	[]					0	0	0	3	35400
rabbit@comp3.1.1791.0	amq.gen-bOTH0AnbMNjUIhNEuSNxag	false	true	[]	rabbit@comp3.1.296.0				0	0	0	1	14488
XXXX DELETED XXXX
rabbit@comp3.1.1840.0	amq.gen-e4566OMPV21ROzOzQO0jQg	false	true	[]	rabbit@comp3.1.296.0				0	0	0	1	14488

Bindings on /:
source_name	source_kind	destination_name	destination_kind	routing_key	arguments
	exchange	amq.gen-bOTH0AnbMNjUIhNEuSNxag	queue	amq.gen-bOTH0AnbMNjUIhNEuSNxag	[]
xxxx DELETED XXXX
	exchange	amq.gen-e4566OMPV21ROzOzQO0jQg	queue	amq.gen-e4566OMPV21ROzOzQO0jQg	[]
	exchange	chat	queue	chat	[]
chat	exchange	amq.gen-bOTH0AnbMNjUIhNEuSNxag	queue		[]
xxxx DELETED XXXX
chat	exchange	amq.gen-e4566OMPV21ROzOzQO0jQg	queue		[]
chat	exchange	chat	queue		[]


Consumers on /:
queue_name	channel_pid	consumer_tag	ack_required	arguments
amq.gen-bOTH0AnbMNjUIhNEuSNxag	rabbit@comp3.1.1786.0	node-amqp-641-0.8360558906570077	false	[]
XXXX DELETED XXXX
amq.gen-e4566OMPV21ROzOzQO0jQg	rabbit@comp3.1.1835.0	node-amqp-641-0.7187799762468785	false	[]



2. ADD agua INSTANCE

Connections		ADDED
Channels		ADDED
Queues			MEMORY INCREASED
Exchanges		NO CHANGE
Bindings		NO CHANGE
Consumers		ADDED


<!--
Connections:
pid	name	port	peer_port	host	peer_host	ssl	peer_cert_subject	peer_cert_issuer	peer_cert_validity	auth_mechanism	ssl_protocol	ssl_key_exchange	ssl_cipher	ssl_hash	protocol	user	vhost	timeout	frame_max	client_properties	recv_oct	recv_cnt	send_oct	send_cnt	send_pend	state	last_blocked_by	last_blocked_age	channels
<rabbit@comp3.1.296.0>	127.0.0.1:36343 -> 127.0.0.1:5672	5672	36343	127.0.0.1	127.0.0.1	false				AMQPLAIN					{0,9,1}	guest	/	0	10000000	[{"version","0.0.1"},{"platform","node-v0.10.25"},{"product","node-amqp"}]	1867	50	3609	43	0	running	none	infinity	6
<rabbit@comp3.1.1811.0>	127.0.0.1:38309 -> 127.0.0.1:5672	5672	38309	127.0.0.1	127.0.0.1	false				PLAIN					{0,8,0}	guest	/	0	131072	[]	207	9	1314	16	0	running	none	infinity	1
<rabbit@comp3.1.2036.0>	127.0.0.1:38470 -> 127.0.0.1:5672	5672	38470	127.0.0.1	127.0.0.1	false				PLAIN					{0,8,0}	guest	/	0	131072	[]	207	9	388	8	0	running	none	infinity	1
<rabbit@comp3.1.2148.0>	127.0.0.1:38604 -> 127.0.0.1:5672	5672	38604	127.0.0.1	127.0.0.1	false				PLAIN					{0,8,0}	guest	/	0	131072	[]	207	9	388	8	0	running	none	infinity	1

Channels:
pid	name	connection	number	user	vhost	transactional	confirm	consumer_count	messages_unacknowledged	messages_unconfirmed	messages_uncommitted	acks_uncommitted	prefetch_count	client_flow_blocked
<rabbit@comp3.1.1786.0>	127.0.0.1:36343 -> 127.0.0.1:5672 (1)	<rabbit@comp3.1.296.0>	1	guest	/	false	false	1	0	0	0	0	0	false
<rabbit@comp3.1.1790.0>	127.0.0.1:36343 -> 127.0.0.1:5672 (2)	<rabbit@comp3.1.296.0>	2	guest	/	false	false	0	0	0	0	0	0	false
<rabbit@comp3.1.1795.0>	127.0.0.1:36343 -> 127.0.0.1:5672 (3)	<rabbit@comp3.1.296.0>	3	guest	/	false	false	0	0	0	0	0	0	false
<rabbit@comp3.1.1817.0>	127.0.0.1:38309 -> 127.0.0.1:5672 (1)	<rabbit@comp3.1.1811.0>	1	guest	/	false	false	1	0	0	0	0	0	false
<rabbit@comp3.1.1835.0>	127.0.0.1:36343 -> 127.0.0.1:5672 (4)	<rabbit@comp3.1.296.0>	4	guest	/	false	false	1	0	0	0	0	0	false
<rabbit@comp3.1.1839.0>	127.0.0.1:36343 -> 127.0.0.1:5672 (5)	<rabbit@comp3.1.296.0>	5	guest	/	false	false	0	0	0	0	0	0	false
<rabbit@comp3.1.1844.0>	127.0.0.1:36343 -> 127.0.0.1:5672 (6)	<rabbit@comp3.1.296.0>	6	guest	/	false	false	0	0	0	0	0	0	false
<rabbit@comp3.1.2042.0>	127.0.0.1:38470 -> 127.0.0.1:5672 (1)	<rabbit@comp3.1.2036.0>	1	guest	/	false	false	1	0	0	0	0	0	false
<rabbit@comp3.1.2154.0>	127.0.0.1:38604 -> 127.0.0.1:5672 (1)	<rabbit@comp3.1.2148.0>	1	guest	/	false	false	1	0	0	0	0	0	false

Queues on /:
pid	name	durable	auto_delete	arguments	owner_pid	policy	exclusive_consumer_pid	exclusive_consumer_tag	messages_ready	messages_unacknowledged	messages	consumers	memory	slave_pids	synchronised_slave_pids	backing_queue_status	status
<rabbit@comp3.1.810.0>	chat	true	false	[]					0	0	0	3	35400			[{q1,0}, {q2,0}, {delta,{delta,undefined,0,undefined}}, {q3,0}, {q4,0}, {len,0}, {pending_acks,0}, {target_ram_count,infinity}, {ram_msg_count,0}, {ram_ack_count,0}, {next_seq_id,0}, {persistent_count,0}, {avg_ingress_rate,0.0}, {avg_egress_rate,0.0}, {avg_ack_ingress_rate,0.0}, {avg_ack_egress_rate,0.0}]	running
<rabbit@comp3.1.1791.0>	amq.gen-bOTH0AnbMNjUIhNEuSNxag	false	true	[]	<rabbit@comp3.1.296.0>				0	0	0	1	14488			[{q1,0}, {q2,0}, {delta,{delta,undefined,0,undefined}}, {q3,0}, {q4,0}, {len,0}, {pending_acks,0}, {target_ram_count,infinity}, {ram_msg_count,0}, {ram_ack_count,0}, {next_seq_id,0}, {persistent_count,0}, {avg_ingress_rate,0.0}, {avg_egress_rate,0.0}, {avg_ack_ingress_rate,0.0}, {avg_ack_egress_rate,0.0}]	running
<rabbit@comp3.1.1840.0>	amq.gen-e4566OMPV21ROzOzQO0jQg	false	true	[]	<rabbit@comp3.1.296.0>				0	0	0	1	14488			[{q1,0}, {q2,0}, {delta,{delta,undefined,0,undefined}}, {q3,0}, {q4,0}, {len,0}, {pending_acks,0}, {target_ram_count,infinity}, {ram_msg_count,0}, {ram_ack_count,0}, {next_seq_id,0}, {persistent_count,0}, {avg_ingress_rate,0.0}, {avg_egress_rate,0.0}, {avg_ack_ingress_rate,0.0}, {avg_ack_egress_rate,0.0}]	running

Exchanges on /:
name	type	durable	auto_delete	internal	arguments	policy
	direct	true	false	false	[]	
amq.direct	direct	true	false	false	[]	
amq.fanout	fanout	true	false	false	[]	
amq.headers	headers	true	false	false	[]	
amq.match	headers	true	false	false	[]	
amq.rabbitmq.log	topic	true	false	false	[]	
amq.rabbitmq.trace	topic	true	false	false	[]	
amq.topic	topic	true	false	false	[]	
chat	fanout	false	false	false	[]	

Bindings on /:
source_name	source_kind	destination_name	destination_kind	routing_key	arguments
	exchange	amq.gen-bOTH0AnbMNjUIhNEuSNxag	queue	amq.gen-bOTH0AnbMNjUIhNEuSNxag	[]
	exchange	amq.gen-e4566OMPV21ROzOzQO0jQg	queue	amq.gen-e4566OMPV21ROzOzQO0jQg	[]
	exchange	chat	queue	chat	[]
chat	exchange	amq.gen-bOTH0AnbMNjUIhNEuSNxag	queue		[]
chat	exchange	amq.gen-e4566OMPV21ROzOzQO0jQg	queue		[]
chat	exchange	chat	queue		[]

Consumers on /:
queue_name	channel_pid	consumer_tag	ack_required	arguments
amq.gen-bOTH0AnbMNjUIhNEuSNxag	<rabbit@comp3.1.1786.0>	node-amqp-641-0.8360558906570077	false	[]
amq.gen-e4566OMPV21ROzOzQO0jQg	<rabbit@comp3.1.1835.0>	node-amqp-641-0.7187799762468785	false	[]
chat	<rabbit@comp3.1.1817.0>	amq.ctag-HyD3xo9OYKfino5Oc28ECA	false	[]
chat	<rabbit@comp3.1.2042.0>	amq.ctag-qpOmFcw3HIfn5qIetFDWMA	false	[]
chat	<rabbit@comp3.1.2154.0>	amq.ctag-i79LKsdLdsx8pAa8af6MoQ	false	[]

Permissions on /:
user	configure	write	read
guest	.*	.*	.*

Policies on /:

Parameters on /:

...done.

-->
	
</entry>
<entry [Tue 2015:03:10 01:09:39 EST] rabbitmqctl SUBCOMMAND OUTPUT FORMATS>

http://www.rabbitmq.com/man/rabbitmqctl.1.man.html

list_consumers
--------------

rabbitmqctl list_consumers [-p vhostpath]

List consumers, i.e. subscriptions to a queue's message stream.

OUTPUT:

- name of the queue subscribed to
- id of the channel process via which the subscription was created and is managed
- consumer tag which uniquely identifies the subscription within a channel
- boolean indicating whether acknowledgements are expected for messages delivered to this consumer
- integer indicating the prefetch limit (with 0 meaning 'none')
- any arguments for this consumer

queue_name	channel_ID	consumer_tag	ack_expected	prefetch_limit	options

	Listing consumers ...
	chat	< rabbit@comp3.1.809.0 >	amq.ctag-Odj9qgpjzbNjaGcaEJ4I1g	false	[]
	...done.


list_bindings
-------------

rabbitmqctl list_bindings destination_name    destination_kind    routing_key 
	Listing bindings ...
		amq.gen-jvIGFO6Fvu1uh8hXNw6Kow	queue	amq.gen-jvIGFO6Fvu1uh8hXNw6Kow
		chat	queue	chat

rabbitmqctl list_bindings source_name    source_kind    destination_name    destination_kind    routing_key
	Listing bindings ...
		exchange	amq.gen-jvIGFO6Fvu1uh8hXNw6Kow	queue	amq.gen-jvIGFO6Fvu1uh8hXNw6Kow
		exchange	chat	queue	chat

The column order in the results will match the order of the parameters. bindinginfoitem can take any value from the list that follows:
source_name
The name of the source of messages to which the binding is attached. With non-ASCII characters escaped as in C.
source_kind
The kind of the source of messages to which the binding is attached. Currently always exchange. With non-ASCII characters escaped as in C.
destination_name
The name of the destination of messages to which the binding is attached. With non-ASCII characters escaped as in C.
destination_kind
The kind of the destination of messages to which the binding is attached. With non-ASCII characters escaped as in C.
routing_key
The binding's routing key, with non-ASCII characters escaped as in C.
arguments
The binding's arguments.

	
</entry>
<entry [Tue 2015:03:10 00:23:49 EST] rabbitmqctl COMMANDS>

LIST

rabbitmqctl list_exchanges
rabbitmqctl list_exchanges
rabbitmqctl list_exchanges
service rabbitmq-server restart
service rabbitmq-server restart
rabbitmqctl list_exchanges
rabbitmqctl list_exchanges

DECLARE

rabbitmqadmin declare exchange "name=chat" type="fanout"

DELETE

rabbitmqadmin delete exchange name=chat

LOG

tail /var/log/rabbitmq/rabbit@comp3.log


VERIFY

rabbitmqctl list_exchanges
rabbitmqctl list_connections
rabbitmqctl list_channels
rabbitmqctl list_consumers
rabbitmqctl list_queues
rabbitmqctl list_exchanges

rabbitmqctl list_bindings
	
	Listing bindings ...
		exchange	chat	queue	chat	[]
	chat	exchange	chat	queue		[]

</entry>
<entry [Mon 2014:11:10 20:44:34 EST] PUBLISH AND GET MESSAGE WITH rabbitmqadmin>

1. PUBLISH MESSAGE
Publish a message

rabbitmqadmin publish exchange=chat routing_key= payload="TEST"

	Message published


2. GET MESSAGE

rabbitmqadmin get queue=chat requeue=false


	
</entry>
<entry [Mon 2014:11:10 20:44:27 EST] CREATE QUEUE WITH rabbitmqadmin>
	
	
</entry>
<entry [Mon 2014:11:10 17:00:33 EST] SUCCESSFULLY INSTALLED rabbitmqadmin>


https://www.rabbitmq.com/management.html


1. INSTALL MANAGEMENT PLUGIN

rabbitmq-plugins enable rabbitmq_management

	The following plugins have been enabled:
	  mochiweb
	  webmachine
	  rabbitmq_web_dispatch
	  amqp_client
	  rabbitmq_management_agent
	  rabbitmq_management
	Plugin configuration has changed. Restart RabbitMQ for changes to take effect.


2. RESTART RABBITMQ

service rabbitmq-server restart


3. DOWNLOAD

http://localhost:15672/cli/

	rabbitmqadmin
	
	Download it from here (Right click, Save as), make executable, and drop it in your path. Note that many browsers will rename the file rabbitmqadmin.txt. You will need Python 2.x, 2.6 or later (i.e. not Python 3).
	
	See the rabbitmqadmin page on the website for more information on its use, or invoke rabbitmqadmin --help for usage instructions. Windows users will need to ensure Python is on their path, and invoke rabbitmqadmin as python.exe rabbitmqadmin.


SAVED TO

/home/syoung/notes/agua/private/bin/test/rabbitmq/rabbitmqadmin.txt


4. COPY TO /usr/bin


cp /home/syoung/notes/agua/private/bin/test/rabbitmq/rabbitmqadmin.txt /usr/bin/rabbitmqadmin
chmod 755 /usr/bin/rabbitmqadmin


5. RUN

rabbitmqadmin --help

	Usage
	=====
	  rabbitmqadmin [options] subcommand
	
	Options
	=======
	--help, -h              show this help message and exit
	--config=CONFIG, -c CONFIG
							configuration file [default: ~/.rabbitmqadmin.conf]
	--node=NODE, -N NODE    node described in the configuration file [default:
							'default' only if configuration file is specified]
	--host=HOST, -H HOST    connect to host HOST [default: localhost]
	--port=PORT, -P PORT    connect to port PORT [default: 15672]
	--vhost=VHOST, -V VHOST
							connect to vhost VHOST [default: all vhosts for list,
							'/' for declare]
	--username=USERNAME, -u USERNAME
							connect using username USERNAME [default: guest]
	--password=PASSWORD, -p PASSWORD
							connect using password PASSWORD [default: guest]
	--quiet, -q             suppress status messages [default: True]
	--ssl, -s               connect with ssl [default: False]
	--ssl-key-file=SSL_KEY_FILE
							PEM format key file for SSL
	--ssl-cert-file=SSL_CERT_FILE
							PEM format certificate file for SSL
	--format=FORMAT, -f FORMAT
							format for listing commands - one of [raw_json, long,
							pretty_json, kvp, tsv, table, bash] [default: table]
	--sort=SORT, -S SORT    sort key for listing queries
	--sort-reverse, -R      reverse the sort order
	--depth=DEPTH, -d DEPTH
							maximum depth to recurse for listing tables [default: 1]
	--bash-completion       Print bash completion script [default: False]
	--version               Display version and exit
	
	More Help
	=========
	
	For more help use the help subcommand:
	
	  rabbitmqadmin help subcommands  # For a list of available subcommands
	  rabbitmqadmin help config       # For help with the configuration file

rabbitmqadmin help subcommands

	Usage
	=====
	  rabbitmqadmin [options] subcommand
	
	  where subcommand is one of:
	
	Display
	=======
	
	  list users [< column >...]
	  list vhosts [< column >...]
	  list connections [< column >...]
	  list exchanges [< column >...]
	  list bindings [< column >...]
	  list permissions [< column >...]
	  list channels [< column >...]
	  list parameters [< column >...]
	  list queues [< column >...]
	  list policies [< column >...]
	  list nodes [< column >...]
	  show overview [< column >...]
	
	Object Manipulation
	===================
	
	  declare queue name=... [node=... auto_delete=... durable=... arguments=...]
	  declare vhost name=... [tracing=...]
	  declare user name=... password=... tags=...
	  declare exchange name=... type=... [auto_delete=... internal=... durable=... arguments=...]
	  declare policy name=... pattern=... definition=... [priority=... apply-to=...]
	  declare parameter component=... name=... value=...
	  declare permission vhost=... user=... configure=... write=... read=...
	  declare binding source=... destination=... [arguments=... routing_key=... destination_type=...]
	  delete queue name=...
	  delete vhost name=...
	  delete user name=...
	  delete exchange name=...
	  delete policy name=...
	  delete parameter component=... name=...
	  delete permission vhost=... user=...
	  delete binding source=... destination_type=... destination=... properties_key=...
	  close connection name=...
	  purge queue name=...
	
	Broker Definitions
	==================
	
	  export < file >
	  import < file >
	
	Publishing and Consuming
	========================
	
	  publish routing_key=... [payload=... payload_encoding=... exchange=...]
	  get queue=... [count=... requeue=... payload_file=... encoding=...]
	
	  * If payload is not specified on publish, standard input is used
	
	  * If payload_file is not specified on get, the payload will be shown on
		standard output along with the message metadata
	
	  * If payload_file is specified on get, count must not be set

  
3. ENABLE BASH COMPLETION

PRINT BASE COMPLETION SCRIPT:

rabbitmqadmin --bash-completion > /etc/bash_completion.d/rabbitmqadmin

	
</entry>
<entry [Mon 2014:11:10 16:51:49 EST] FIXED ERROR: {amqp_error,not_found,"no exchange 'chat' in vhost '/'",'queue.bind'}>

**** SUMMARY: RUN emit_log.pl TO CREATE EXCHANGE 'chat'

/home/syoung/notes/agua/private/bin/test/perl/NetRabbitFoot/emit_log.pl

/agua --log 4     

	2015-03-11 02:32:29    [DEBUG]   	Queue::Daemon::receiveFanout	116	
	2015-03-11 02:32:29    [DEBUG]   	Queue::Daemon::receiveFanout	121	host: localhost
	2015-03-11 02:32:29    [DEBUG]   	Queue::Daemon::receiveFanout	128	HERE 1
	2015-03-11 02:32:29    [DEBUG]   	Queue::Daemon::receiveFanout	137	HERE 2
	2015-03-11 02:32:29    [DEBUG]   	Queue::Daemon::receiveFanout	151	DOING queue_bind
	2015-03-11 02:32:29    [DEBUG]   	Queue::Daemon::receiveFanout	159	connection: bless( do{\(my $o = 65448400)}, "Net::RabbitMQ" )


**** NB: THIS DOESN'T WORK

rabbitmqadmin declare exchange "name=chat" type="fanout"

/a/bin/daemon/agua --log 4

	... Can't find 'chat' exchange...
	2015-03-11 02:31:30    [DEBUG]   	Queue::Daemon::receiveFanout	151	DOING queue_bind
	Binding queue: server channel error 404, message: NOT_FOUND - no exchange 'chat' in vhost '/' at /a/lib/Queue/Daemon.pm line 152.



NB: SEE [Mon 2014:11:10 17:00:33 EST] INSTALL MANAGEMENT PLUGIN


PROBLEM

STARTED UP comp3 AND agua DAEMON WON'T RUN. GIVES ERROR


AND /var/log/rabbitmq/rabbit@comp3.log

	=ERROR REPORT==== 10-Nov-2014::16:49:51 ===
	connection < 0.909.0 >, channel 1 - soft error:
	{amqp_error,not_found,"no exchange 'chat' in vhost '/'",'queue.bind'}

	
SOLUTION

1. DELETE EXCHANGE

rabbitmqadmin delete exchange name=chat

2. RESTART rabbitmq SERVER

service rabbitmq-server restart



3. RESTART rabbit.js

service rabbitjs restart




NOTES

NB: THIS CREATED AN EXCHANGE WITH THE WRONG COMBINATION OF OPTIONS ***
CREATE EXCHANGE chat USING rabbitmqadmin

rabbitmqadmin declare exchange "name=chat" type="fanout"


tail -f /var/log/upstart/rabbitjs.log

	events.js:72
			throw er; // Unhandled 'error' event
				  ^
	Error: PRECONDITION_FAILED - cannot redeclare exchange 'chat' in vhost '/' with different type, durable, internal or autodelete value
		at Exchange._onMethod (/mnt/repos/private/syoung/aguadev/html/exchange/rabbitjs/node_modules/amqp/amqp.js:2130:15)



</entry>
<entry [Thu 2014:10:16 02:10:39 EST] rabbitmqctl COMMANDS>

rabbitmqctl list_bindings
rabbitmqctl list_channels
rabbitmqctl list_connections

rabbitmqctl list_exchanges name type durable auto_delete internal arguments policy

Listing exchanges ...
	direct	true	false	false	[]	
amq.direct	direct	true	false	false	[]	
amq.fanout	fanout	true	false	false	[]	
amq.headers	headers	true	false	false	[]	
amq.match	headers	true	false	false	[]	
amq.rabbitmq.log	topic	true	false	false	[]	
amq.rabbitmq.trace	topic	true	false	false	[]	
amq.topic	topic	true	false	false	[]	
chat	fanout	false	false	false	[]	
...done.


rabbitmqctl list_queues \
name durable auto_delete pid  messages_ready messages consumers memory status


<!--

chat	true	true	<rabbit@comp3.3.13538.0>	0	0	1	34744	running
gravity.checks	true	true	<rabbit@comp3.3.12626.0>	0	8	8	57824	running

-->

rabbitmqctl list_queues name durable auto_delete arguments policy pid exclusive_consumer_pid exclusive_consumer_tag messages_ready messages consumers  memory slave_pids synchronised_slave_pids status

<!--

chat	true	true	[]		<rabbit@comp3.3.13538.0>	<rabbit@comp3.3.13537.0>	worker_3856	001	14056			running

gravity.checks	true	true	[]		<rabbit@comp3.3.12626.0>			0	8	8	24344			running

-->

	

	
</entry>
<entry [Wed 2014:10:15 17:47:42 EST] IMPLEMENTED chat WITH Net::RabbitMQ>

http://syslog.me/2013/01/27/redoing-rabbitmqs-tutorial-part-2/

1. ADAPTED worker.pl AND tasker.pl TO USE rabbitjs FANOUT QUEUE

tasker.pl
==========
#!/usr/bin/perl

use strict ;
use warnings ;

use Net::RabbitMQ ;

{
    # closure to return a new channel ID every time we call nextchan
    my $nextchan = 1 ;
    sub nextchan { return $nextchan++ } ;
}

### BEGIN CONFIGURABLE PARAMETERS ######################################
my $host    = q{localhost} ;
my $qname   = q{chat} ;
my $count   = $ARGV[0] ;
#print "count: $count\n";
### NO CONFIGURABLE PARAMETERS BELOW THIS LINE #########################

my $mq      = Net::RabbitMQ->new() ;
my $chanID  = nextchan() ;

my %qparms = (
    user => "guest",
    password => "guest",
    host    =>  $host,
    vhost   =>  "/",
    port    =>  5672
);
$mq->connect($host, \%qparms) ;

$mq->channel_open($chanID) ;

my %declare_opts = (
    durable => 1,
    auto_delete => 0
);
$mq->queue_declare($chanID, $qname, \%declare_opts,) ;

print "Sending tasks:\n";
for (my $i = 1 ; $i <= $count ; $i++) {
    my $sec     = 1+int(rand(10)) ;
    my $message = qq{This task will last for $sec seconds} ;

    $mq->publish($chanID, $qname, $message,{
        exchange => "chat",
        routing_key =>  ""
    },) ;

    print STDERR qq{\tMessage "$message" sent to queue $qname\n} ;
}

$mq->disconnect ;



worker.pl
=========
#!/usr/bin/perl

use strict ;
use warnings ;

use Net::RabbitMQ ;

{
    # closure to return a new channel ID every time we call nextchan
    my $nextchan = 1 ;
    sub nextchan { return $nextchan++ } ;
}

### BEGIN CONFIGURABLE PARAMETERS ######################################
my $host    = q{localhost} ;
my $qname   = q{chat} ;

### NO CONFIGURABLE PARAMETERS BELOW THIS LINE #########################
my $mq      = Net::RabbitMQ->new() ;
my $chanID  = nextchan() ;

#$mq->connect($host, { user => "guest", password => "guest" });
my %qparms = (
    user => "guest",
    password => "guest",
    host    =>  $host,
    vhost   =>  "/",
    port    =>  5672
);
$mq->connect($host, \%qparms);

$mq->channel_open($chanID);

$mq->basic_qos($chanID,{ prefetch_count => 1 });

my %declare_opts = (
    durable => 1,
    auto_delete => 0
) ;

$mq->queue_declare($chanID, $qname, \%declare_opts) ;

#### IMPORTANT: REQUIRED TO CONNECT TO chat FANOUT
$mq->queue_bind($chanID, $qname, "chat", "",);

my %consume_opts = (
    exchange => "chat",
    routing_key =>  ""
);
$mq->consume($chanID, $qname, \%consume_opts);

# NOTE THAT recv() is BLOCKING!!! get wasn't!
while ( my $payload = $mq->recv() ) {
    print "payload\n";
    last if not defined $payload ;
    my $body  = $payload->{body} ;
    my $dtag  = $payload->{delivery_tag} ;
    
    #print "Message received (dtag: $dtag): $body\n";
    my ($sec) = ( $body =~ /(\d+)/ );
    print STDERR qq{Worker $$: Received from queue $qname: $body\n} ;
    print STDERR qq{Worker $$: sleeping $sec seconds\n} ;
    
    sleep $sec ;

    $mq->ack($chanID,$dtag,) ;
    print STDERR qq{Worker $$: Completed\n} ;
}



2. START BROWSER

https://localhost:8080

	This task will last for 7 seconds
	This task will last for 5 seconds
	TEST22

3. RUN receiveFanout

/a/bin/exchange/receiveFanout --log 4 --exchange chat

	[*] Waiting for fanout on host localhost, exchange 'chat'
	[x] Received fanout on host  routing key '' This task will last for 7 seconds
	[x] Received fanout on host  routing key '' This task will last for 5 seconds
	[x] Received fanout on host  routing key '' TEST22

	
4. RUN worker.pl

/mnt/repos/private/syoung/notes/agua/private/bin/test/perl/NetRabbitMQ/worker.pl 

	Worker 30674: Received from queue chat: This task will last for 7 seconds
	Worker 30674: sleeping 7 seconds
	Worker 30674: Completed
	payload
	Worker 30674: Received from queue chat: This task will last for 5 seconds
	Worker 30674: sleeping 5 seconds
	Worker 30674: Completed




5. SEND FANOUT USING tasker.pl

/mnt/repos/private/syoung/notes/agua/private/bin/test/perl/NetRabbitMQ/tasker.pl 2

Sending tasks:
	Message "This task will last for 7 seconds" sent to queue chat
	Message "This task will last for 5 seconds" sent to queue chat




6. SEND FANOUT USING sendFanout ONLY REACHES receiveFanout AND BROWSER

/a/bin/exchange/sendFanout  --log 4 --message TEST22

	[x] Sent fanout on host localhost, exchange chat: TEST22



NB: IT APPEARS THAT receiveFanout IS BLOCKING worker.pl FROM RECEIVING MESSAGES FROM sendFanout


NOTES
=====

sendFanout IMPLEMENTED USING Net::Rabbit

	#my $connection = Net::RabbitFoot->new()->load_xml_spec()->connect(
	#	host 	=> $host,
	#	port 	=> $port,
	#	user 	=> $user,
	#	pass 	=> $pass,
	#	vhost 	=> $vhost
	#	#,
	#	#timeout => 0,
	#);
	#
	#my $channel = $connection->open_channel();
	#
	#$channel->declare_exchange(
	#	exchange => $exchange,
	#	type => 'fanout',
	#);
	#
	#my $result	=	$channel->declare_queue(
	#	#### NOT NECCESSARY
	#	#passive	=>	0,
	#	#exclusive => 0,
	#	#durable	=>	1,
	#	#auto_delete	=>	1
	#
	#	#### FANOUT SETTINGS
	#	durable => 1,
	#	auto_delete	=>	1
	#);
	#$self->logDebug("result", $result);
	#my $queue_name = $result->{method_frame}->{queue};
	#print "queuename: $queue_name\n";
	#
	#$channel->publish(
	#	exchange => $exchange,
	#	routing_key => '',
	#	body => $message,
	#);
	#
	#print " [x] Sent fanout on host $host, exchange $exchange: $message\n";
	#
	#$connection->close();	


receiveFanout IMPLEMENTED USING Net::Rabbit

	#my $conn = Net::RabbitFoot->new()->load_xml_spec()->connect(
	#	host => $host,
	#	port => 5672,
	#	user => $user,
	#	pass => $pass,
	#	vhost => $vhost,
	#);
	#
	#my $channel = $conn->open_channel();
	#$channel->qos(prefetch_count => 1);
	#$channel->declare_exchange(
	#	#exchange => 'logs',
	#	exchange 	=> $exchange,
	#	type 		=> 'fanout'
	#	
	#	#passive	=>	0,
	#	#exclusive => 0,
	#	#durable	=>	1,
	#	#auto_delete	=>	1
	#	#,
	#	#durable		=>	1
	#);
	#
	#my $result = $channel->declare_queue(
	#	passive	=>	0,
	#	exclusive => 0,
	#	durable	=>	1,
	#	auto_delete	=>	1
	#);
	##$self->logDebug("result", $result);	
	#my $queue_name = $result->{method_frame}->{queue};
	#print "queuename: $queue_name\n";
	#
	#$channel->bind_queue(
	#	exchange => $exchange,
	#	queue => $queue_name,
	#);
	#
	#print " [*] Waiting for fanout on host $host, exchange '$exchange'\n";
	#
	#no warnings;
	#sub callback {
	#	my $var = shift;
	#	my $body = $var->{body}->{payload};
	#
	#	print " [x] Received fanout on host $host routing key '$exchange' $body\n";
	#}
	#use warnings;
	#	
	#$channel->consume(
	#	on_consume => \&callback,
	#	queue => $queue_name,
	#	no_ack => 1,
	#);
	#
	#AnyEvent->condvar->recv;


</entry>
<entry [Wed 2014:10:15 14:52:08 EST] FIXED Net::RabbitFoot MESSAGE CACHING PROBLEM>

TESTED Net::RabbitMQ

cat /home/syoung/.cpanm/work/1413399112.30015/Net--RabbitMQ-0.2.7/t/008_queue_declare.t 

	use Test::More tests => 8;
	use strict;
	
	my $host = $ENV{'MQHOST'} || "dev.rabbitmq.com";
	
	use_ok('Net::RabbitMQ');
	
	my $mq = Net::RabbitMQ->new();
	ok($mq);
	
	eval { $mq->connect($host, { user => "guest", password => "guest" }); };
	is($@, '', "connect");
	eval { $mq->channel_open(1); };
	is($@, '', "channel_open");
	my $queuename = undef;
	my $message_count = 0;
	my $consumer_count = 0;
	my $expect_qn = 'test.net.rabbitmq.perl';
	eval { ($queuename, $message_count, $consumer_count) =
			 $mq->queue_declare(1, $expect_qn, { passive => 0, durable => 1, exclusive => 0, auto_delete => 1 }); };
	is($@, '', "queue_declare");
	is($queuename, $expect_qn, "queue_declare -> $queuename = $expect_qn");
	is($message_count, 0, "got message count back");
	is($consumer_count, 0, "got consumer count back");
	1;

perl 008_queue_declare.t 
1..8
ok 1 - use Net::RabbitMQ;
ok 2
ok 3 - connect
ok 4 - channel_open
ok 5 - queue_declare
ok 6 - queue_declare -> test.net.rabbitmq.perl = test.net.rabbitmq.perl
ok 7 - got message count back
ok 8 - got consumer count back


PROBLEM

worker.pl STARTS OKAY

tail -f /var/log/rabbitmq/rabbit@comp3.log

<!--	=INFO REPORT==== 15-Oct-2014::15:40:28 ===
	accepting AMQP connection <0.13018.0> (127.0.0.1:49034 -> 127.0.0.1:5672)
-->

BUT tasker.pl GIVES ERROR:

	Opening socket: No such file or directory

SOLUTION

SET host TO localhost (NOT gravity AS USED IN EXAMPLE SCRIPT)






</entry>
<entry [Sun 2014:10:05 11:43:43 EST] RABBITMQ-MANAGER >

https://www.npmjs.org/package/rabbitmq-manager

sudo npm install -g rabbitmq-manager


    
</entry>
<entry [Sun 2014:10:05 11:25:16 EST] RETRY INSTALL rabbitmqadmin>

1. INSTALL PLUGIN rabbitmq_management


rabbitmq-plugins enable rabbitmq_management

    The following plugins have been enabled:
      mochiweb
      webmachine
      rabbitmq_web_dispatch
      amqp_client
      rabbitmq_management_agent
      rabbitmq_management
    Plugin configuration has changed. Restart RabbitMQ for changes to take effect.

2. 


    
</entry>
<entry [Fri 2014:08:08 05:34:06 EST] RABBITMQ MONITORING>


Check out trixx and alice&wonderland. There are also Munin plugins 
available for displaying rabbitmqctl output graphically. 

+1 for Alice, very nice app for monitoring.  Provides all of the 
output of rabbitmqctl in JSON format via HTTP. 
	
</entry>
<entry [Fri 2014:08:08 04:38:14 EST] VIEW QUEUE MESSAGES WITH rabbitmqadmin>

1. GET RABBITMQ PORT

netstat -ntulp 
	tcp        0      0 0.0.0.0:25672           0.0.0.0:*               LISTEN      1059/beam.smp   


2. LIST QUEUES

rabbitmqadmin list queues vhost name node messages message_stats_publish_details_rate
	ERROR:
	httplib.BadStatusLine: ''

rabbitmqadmin --ssl -V rabbitvhost -P 25672 list queues vhost name node messages message_stats_publish_details_rate
	ERROR:
	*** Could not connect: [Errno 8] _ssl.c:504: EOF occurred in violation of protocol


2. LIST QUEUE DETAILS

rabbitmqadmin  -P 25672 -f long -d 3 list queues



Traceback (most recent call last):
  File "/usr/bin/rabbitmqadmin", line 943, in < module>
    main()
  File "/usr/bin/rabbitmqadmin", line 384, in main
    method()
  File "/usr/bin/rabbitmqadmin", line 526, in invoke_list
    format_list(self.get(uri), cols, obj_info, self.options)
  File "/usr/bin/rabbitmqadmin", line 407, in get
    return self.http("GET", "/api%s" % path, "")
  File "/usr/bin/rabbitmqadmin", line 436, in http
    resp = conn.getresponse()
  File "/usr/lib/python2.7/httplib.py", line 1030, in getresponse
    response.begin()
  File "/usr/lib/python2.7/httplib.py", line 407, in begin
    version, status, reason = self._read_status()
  File "/usr/lib/python2.7/httplib.py", line 371, in _read_status
    raise BadStatusLine(line)
httplib.BadStatusLine: ''


NOTES
=====


rabbitmqadmin --help for usage instructions. You can:

	list exchanges, queues, bindings, vhosts, users, permissions, connections and channels.
	show overview information.
	declare and delete exchanges, queues, bindings, vhosts, users and permissions.
	publish and get messages.
	close connections and purge queues.
	import and export configuration.

Examples

Get a list of exchanges

rabbitmqadmin -V rabbitvhost list exchanges
+-------------+---------+-------+---------+-------------+
|    name     | durable | vhost |  type   | auto_delete |
+-------------+---------+-------+---------+-------------+
|             | True    | test  | direct  | False       |
| amq.direct  | True    | test  | direct  | False       |
| amq.fanout  | True    | test  | fanout  | False       |
| amq.headers | True    | test  | headers | False       |
| amq.match   | True    | test  | headers | False       |
| amq.topic   | True    | test  | topic   | False       |
+-------------+---------+-------+---------+-------------+

Get a list of queues, with some columns specified
$ rabbitmqadmin list queues vhost name node messages message_stats.publish_details.rate
+-------+----------------------------------+-------------------+----------+------------------------------------+
| vhost |               name               |       node        | messages | message_stats.publish_details.rate |
+-------+----------------------------------+-------------------+----------+------------------------------------+
| /     | amq.gen-UELtxwb8OGJ9XHlHJq0Jug== | rabbit@smacmullen | 0        | 100.985821591                      |
| /     | test                             | rabbit@misstiny   | 5052     | 100.985821591                      |
+-------+----------------------------------+-------------------+----------+------------------------------------+

Get a list of queues, with all the detail we can take
rabbitmqadmin -f long -d 3 list queues

--------------------------------------------------------------------------------

                                       vhost: /
                                        name: amq.gen-UELtxwb8OGJ9XHlHJq0Jug==
                                 auto_delete: False
    backing_queue_status.avg_ack_egress_rate: 100.944672225
   backing_queue_status.avg_ack_ingress_rate: 100.944672225
and so on, and on...

Connect to another host as another user
$ rabbitmqadmin -H myserver -u simon -p simon list vhosts
+------+
| name |
+------+
| /    |
+------+

Declare an exchange
$ rabbitmqadmin declare exchange name=my-new-exchange type=fanout
exchange declared

Declare a queue, with optional parameters
$ rabbitmqadmin declare queue name=my-new-queue durable=false
queue declared

Publish a message
$ rabbitmqadmin publish exchange=amq.default routing_key=test payload="hello, world"
Message published
And get it back
$ rabbitmqadmin get queue=test requeue=false
+-------------+----------+---------------+--------------+------------------+-------------+
| routing_key | exchange | message_count |   payload    | payload_encoding | redelivered |
+-------------+----------+---------------+--------------+------------------+-------------+
| test        |          | 0             | hello, world | string           | False       |
+-------------+----------+---------------+--------------+------------------+-------------+


Export configuration
$ rabbitmqadmin export rabbit.config

	Exported configuration for localhost to "rabbit.config"

Import configuration, quietly
$ rabbitmqadmin -q import rabbit.config
Close all connections
$ rabbitmqadmin -f tsv -q list connections name | while read conn ; do rabbitmqadmin -q close connection name=${conn} ; done
	
</entry>
<entry [Fri 2014:08:08 04:03:20 EST] INSTALL rabbitmqadmin>

REQUIRES Python 2.x, 2.6 or later (not Python 3).

1. ENABLE MANAGEMENT PLUGIN

rabbitmq-plugins enable rabbitmq_management

	The following plugins have been enabled:
	  mochiweb
	  webmachine
	  rabbitmq_web_dispatch
	  amqp_client
	  rabbitmq_management_agent
	  rabbitmq_management
	Plugin configuration has changed. Restart RabbitMQ for changes to take effect.

RESTART RABBITMQ

rabbitmqctl stop_app
rabbitmqctl start_app


2. DOWNLOAD

GET rabbitmqadmin FOR management plugin version 3.3.4

wget http://hg.rabbitmq.com/rabbitmq-management/raw-file/rabbitmq_v3_3_4/bin/rabbitmqadmin

GET VERSION 2.8.1

http://hg.rabbitmq.com/rabbitmq-management/raw-file/rabbitmq_v2_8_1/bin/rabbitmqadmin



COPY TO /usr/bin

cp rabbitmqadmin /usr/bin
chmod 755 /usr/bin/rabbitmqadmin 


3. ENABLE BASH COMPLETION

rabbitmqadmin supports tab completion in bash. To print a bash completion script, invoke

rabbitmqadmin --bash-completion > /etc/bash_completion.d/rabbitmqadmin


	
</entry>
<entry [Wed 2014:06:25 16:34:07 EST] LIST QUEUES>

rbt list_users

rbt -p rabbitvhost list_queues name messages_ready messages_unacknowledged

rbt -p rabbitvhost list_queues name messages_ready messages_unacknowledged

	Listing queues ...
	amq.gen-0YRw-veGs8qXRp9nsF0PKA	0	0
	amq.gen-5tiosHNDLoAjTa2W1tTg9w	0	0
	amq.gen-6d_YsPmGaUCAUmWH_eNIGw	0	0
	amq.gen-8GS8NWu28IKsG8O5PrSj7A	0	0
	amq.gen-B2X_x5zclHOWCrC57SBEag	0	0
	amq.gen-ClsMqAd9blSSGYIao1x3VA	0	0
	amq.gen-D1WmZZsM7wGfnOGGwmXrbA	0	0
	amq.gen-FdjIK9h8SNUSAkTIAFYSGA	0	0
	amq.gen-KF8c381HQ-nPHCjpMWaVGA	0	0
	amq.gen-M5rGJec_7OaTe0Anv37NBA	0	0
	amq.gen-M9jfqjcASRq-Gg7vZ4s4dg	0	0
	amq.gen-MfiP3X76cgWBeI-V8ac5HA	0	0
	amq.gen-QDFoSN-_Mho4YetozUUZEg	0	0
	amq.gen-RU3WYk-rWY6SZmwhmRCiuw	0	0
	amq.gen-SFVwzz7Xgn55TBWIMstceA	0	0
	amq.gen-_0nyRfpibGrZ4MwRKwQ__Q	0	0
	amq.gen-_fJ5jaNDNbNgFGY93oze_Q	0	0
	amq.gen-hEok9oK4EAef5Hm0DZxqAQ	0	0
	amq.gen-k5NtLSr3CHRJOg9h5OoG4g	0	0
	amq.gen-nE85Ox2ffKpSWg4yZ9diIQ	0	0
	amq.gen-pa3_URnRI11Gl1g3iwHRDA	0	0
	amq.gen-s2tlRKZxBUREzSfn2NGSUw	0	0
	amq.gen-uSbe9SXEca3wzxZXZXTJFA	0	0
	amq.gen-ulRQd0EO7i44508bYZFa1A	0	0
	amq.gen-xF4v7_TwIBpj-uYlezyCwg	0	0
	amq.gen-xgRe3WikSuVQK9_9gh5Qtw	0	0
	syoung.CU.Download	13	2
	syoung.PanCancer.Align	0	0
	test.worker.queue	1	0
	...done.

	
</entry>
<entry [Tue 2014:05:20 14:17:41 EST] INSTALLED LATEST VERSION OF rabbit.js>


1. INSTALL node-amqp (A CLIENT FOR RABBITMQ)

cd /agua/apps
git clone https://github.com/squaremo/node-amqp.git


<!--cd /agua/apps/node-amqp

npm install amqp

    npm WARN engine amqp@0.1.6: wanted: {"node":"0.4 || 0.5 || 0.6 || 0.8"} (current: {"node":"v0.10.3","npm":"1.2.17"})
    amqp@0.1.6 /usr/local/lib/node_modules/amqp
-->


2. INSTALL rabbit.js

cd /agua/apps/node-amqp
npm install rabbit.js

	rabbit.js@0.4.1 node_modules/rabbit.js
	├── node-uuid@1.4.1
	├── readable-stream@1.0.27-1 (isarray@0.0.1, inherits@2.0.1, string_decoder@0.10.25-1, core-util-is@1.0.1)
	└── amqplib@0.1.3 (buffer-more-ints@0.0.2, bitsyntax@0.0.3, when@2.1.1, readable-stream@1.1.13-1)


npm ls

	amqp@0.1.2 /mnt/repos/private/syoung/aguadev/apps/node-amqp
	└─┬ rabbit.js@0.4.1 extraneous
	  ├─┬ amqplib@0.1.3
	  │ ├── bitsyntax@0.0.3
	  │ ├── buffer-more-ints@0.0.2
	  │ ├─┬ readable-stream@1.1.13-1
	  │ │ ├── core-util-is@1.0.1
	  │ │ ├── inherits@2.0.1
	  │ │ ├── isarray@0.0.1
	  │ │ └── string_decoder@0.10.25-1
	  │ └── when@2.1.1
	  ├── node-uuid@1.4.1
	  └─┬ readable-stream@1.0.27-1
		├── core-util-is@1.0.1
		├── inherits@2.0.1
		├── isarray@0.0.1
		└── string_decoder@0.10.25-1


<!--INSTALLED GLOBALLY:

npm install rabbit.js -g
    npm WARN engine amqp@0.1.6: wanted: {"node":"0.4 || 0.5 || 0.6 || 0.8"} (current: {"node":"v0.10.3","npm":"1.2.17"})
    rabbit.js@0.2.0 /usr/local/lib/node_modules/rabbit.js
    └── amqp@0.1.6
-->


3. INSTALL SOCKET.IO
  
cd /agua/apps/node-amqp
npm install socket.io

	> ws@0.4.31 install /mnt/repos/private/syoung/aguadev/apps/node-amqp/node_modules/socket.io/node_modules/socket.io-client/node_modules/ws
	> (node-gyp rebuild 2> builderror.log) || (exit 0)
	
	socket.io@0.9.16 node_modules/socket.io
	├── base64id@0.1.0
	├── policyfile@0.0.4
	├── redis@0.7.3
	└── socket.io-client@0.9.16 (xmlhttprequest@1.4.2, uglify-js@1.2.5, active-x-obfuscator@0.0.1, ws@0.4.31)


4. CONFIRM INSTALLED NODE.JS PACKAGES

npm ls

    OK

		├─┬ rabbit.js@0.4.1 extraneous
	│ ├─┬ amqplib@0.1.3
	│ │ ├── bitsyntax@0.0.3
	│ │ ├── buffer-more-ints@0.0.2
	│ │ ├─┬ readable-stream@1.1.13-1
	│ │ │ ├── core-util-is@1.0.1
	│ │ │ ├── inherits@2.0.1
	│ │ │ ├── isarray@0.0.1
	│ │ │ └── string_decoder@0.10.25-1
	│ │ └── when@2.1.1
	│ ├── node-uuid@1.4.1
	│ └─┬ readable-stream@1.0.27-1
	│   ├── core-util-is@1.0.1
	│   ├── inherits@2.0.1
	│   ├── isarray@0.0.1
	│   └── string_decoder@0.10.25-1
	└─┬ socket.io@0.9.16 extraneous
	  ├── base64id@0.1.0
	  ├── policyfile@0.0.4
	  ├── redis@0.7.3
	  └─┬ socket.io-client@0.9.16
		├─┬ active-x-obfuscator@0.0.1
		│ └── zeparser@0.0.5
		├── uglify-js@1.2.5
		├─┬ ws@0.4.31
		│ ├── commander@0.6.1
		│ ├── nan@0.3.2
		│ ├── options@0.0.5
		│ └── tinycolor@0.0.1
		└── xmlhttprequest@1.4.2
	
	npm ERR! extraneous: rabbit.js@0.4.1 /mnt/repos/private/syoung/aguadev/apps/node-amqp/node_modules/rabbit.js
	npm ERR! extraneous: socket.io@0.9.16 /mnt/repos/private/syoung/aguadev/apps/node-amqp/node_modules/socket.io
	npm ERR! not ok code 0


5. COPY AND START https.js RABBITJS SERVER

cp /agua/apps/node-amqp.bkp/node_modules/rabbit.js/example/socketio/https.js \
/agua/apps/node-amqp/node_modules/rabbit.js/example/socketio

cd /agua/apps/node-amqp/node_modules/rabbit.js/example/socketio

node https.js

	OK

   
6. OPEN BROWSER

	https://localhost:8080

USE MULTIPLE WINDOWS TO SEND CHAT
    
    OK!!

	SINGLE MESSAGES AND LOADS getData FOR Agua


	
</entry>
<entry [Sun 2014:05:11 20:49:23 EST] FIXED ERROR: 'Channel closed' / 'operation not permitted on the default exchange'>

PROBLEM

DOING receive WITH CORRECT USER AUTHENTICATION BUT GET ERROR:

receive --host 172.17.42.1 --user rabbituser --pass runrabit%2 --vhost rabbitvhost

	Channel closed at /usr/local/share/perl/5.14.2/Net/RabbitFoot/Channel.pm line 32.

DIAGNOSIS

LOG FILE SHOWS "operation not permitted on the default exchange":

tail -f /var/log/rabbitmq/rabbit\@comp2.log

<!--
	accepting AMQP connection <0.1496.0> (172.17.42.1:37564 -> 172.17.42.1:5672)
	
	=ERROR REPORT==== 11-May-2014::20:47:27 ===
	connection <0.1496.0>, channel 1 - soft error:
	{amqp_error,access_refused,"operation not permitted on the default exchange",
				'exchange.declare'}
-->


	
	
</entry>
<entry [Tue 2014:04:29 14:19:21 EST] RABBITMQ COMMANDS - FLUSH QUEUES, ADD/REMOVE USERS>

DELETE THE USER

rabbitmqctl delete_user myuser


CHECK THE CREDENTIALS

curl -i -u guest:guest http://10.2.24.177:15672/api/whoami

http://132.249.227.110:15672/api/whoami


DELETE A QUEUE

python rabbitmqadmin --vhost=rabbitvhost --username=rabbituser --password=runrabit%2 delete queue name=syoung.0987654321.Align


DELETE ALL QUEUES + ALL USERS

rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app

THEN RESET USERS

sudo rabbitmqctl add_user rabbituser runrabit%2
sudo rabbitmqctl add_vhost rabbitvhost
sudo rabbitmqctl set_permissions -p rabbitvhost rabbituser ".*" ".*" ".*"


reset:

Removes the node from any cluster it belongs to, removes all data from the management database, such as configured users and vhosts, and deletes all persistent messages.

ALSO:

	python tmp/rabbitmqadmin --vhost=... --username=... --password=... list queues > tmp/q
	
	vi tmp/q # remove all queues which you want to keep
	
	cut -d' ' -f4 tmp/q| while read q; 
		do python tmp/rabbitmqadmin --vhost=... --username=... --password=... delete queue name=", $self->q; 
	done


GET LIST OF QUEUES WITH NUMBER OF MESSAGES

rabbitmqctl list_queues -p rabbitvhost name messages messages_ready memory

rabbitmqctl list_queues messages_ready


this will display the queues along with the count of messages pending to those queues similarly you can also say

rabbitmqctl list_channels
rabbitmqctl list_connections


EXTRACT REMAINING MESSAGES FROM QUEUE

rabbitmqadmin get queue=test requeue=false


	
</entry>
<entry [Tue 2014:04:29 02:04:53 EST] WATCH FOR ACK ISSUES>

Forgotten acknowledgment

It's a common mistake to miss the basic_ack. It's an easy error, but the consequences are serious. Messages will be redelivered when your client quits (which may look like random redelivery), but RabbitMQ will eat more and more memory as it won't be able to release any unacked messages.

In order to debug this kind of mistake you can use rabbitmqctl to print the messages_unacknowledged field:

sudo rabbitmqctl list_queues name messages_ready messages_unacknowledged

	Listing queues ...
	hello    0       0
	...done.
	
</entry>
<entry [Tue 2014:04:29 01:22:48 EST] RABBITMQ'S FIVE QUEUES: fanout, work, publish, routing AND topics>

THERE ARE FOUR EXCHANGE TYPES: direct, topic, headers AND fanout

fanout: broadcasts all the messages it receives to all the queues it knows

direct: routing using binding keys (fanout ignores them) allows the queue to subscribe to a subset of the messages on an exchange

publish: data from exchange 'myExchange' goes to queues with server-assigned 'routing_key' names. Uses the 'fanout' exchange type. We need to supply a routing_key when sending, but its value is ignored for fanout exchanges. 

topic: no arbitrary routing_key - it must be a list of words, delimited by dots, which specify features connected to the message (e.g.,"stock.usd.nyse", "nyse.vmw", "quick.orange.rabbit") up to the limit of 255 bytes.

The logic behind the topic exchange is similar to a direct one - a message sent with a particular routing key will be delivered to all the queues that are bound with a matching binding key. However there are two important special cases for binding keys:

* (star) can substitute for exactly one word.
# (hash) can substitute for zero or more words


Topic exchange is powerful and can behave like other exchanges.

When a queue is bound with "#" (hash) binding key - it will receive all the messages, regardless of the routing key - like in fanout exchange.

When special characters "*" (star) and "#" (hash) aren't used in bindings, the topic exchange will behave just like a direct one.


LIST EXCHANGES

sudo rabbitmqctl list_exchanges

	Listing exchanges ...
		direct
	amq.direct	direct
	amq.fanout	fanout
	amq.headers	headers
	amq.match	headers
	amq.rabbitmq.log	topic
	amq.rabbitmq.trace	topic
	amq.topic	topic
	chat	fanout
	...done.


LIST QUEUE BINDINGS

verify that your code actually creates bindings and queues:

sudo rabbitmqctl list_bindings

	Listing bindings ...
		exchange	hello	queue	hello	[]
		exchange	task_queue	queue	task_queue	[]
	...done.


LIST QUEUES

sudo rabbitmqctl list_queues


[Tutorial one: "Hello World!"](http://www.rabbitmq.com/tutorial-one-python.html):

    perl send.pl
    perl receive.pl


[Tutorial two: Work Queues](http://www.rabbitmq.com/tutorial-two-python.html):

    perl new_task.pl "A very hard task which takes two seconds.."
    perl worker.pl


[Tutorial three: Publish/Subscribe](http://www.rabbitmq.com/tutorial-three-python.html):

    perl receive_logs.pl
    perl emit_log.pl "info: This is the log message"


[Tutorial four: Routing](http://www.rabbitmq.com/tutorial-four-python.html):

    perl receive_logs_direct.pl info
    perl emit_log_direct.pl info "The message"


[Tutorial five: Topics](http://www.rabbitmq.com/tutorial-five-python.html):

    perl receive_logs_topic.pl "*.rabbit"
    perl emit_log_topic.pl red.rabbit Hello


[Tutorial six: RPC](http://www.rabbitmq.com/tutorial-six-python.html):

    perl rpc_server.pl
    perl rpc_client.pl

	
</entry>
<entry [Mon 2014:04:28 23:23:18 EST] VAGRANT TEST FANOUT BETWEEN host, ubuntu AND ubuntu2>

SUMMARY

channel.basic_publish(exchange='',
                      routing_key='hello',
                      body=message)

The exchange parameter is the the name of the exchange. The empty string denotes the default or nameless exchange: messages are routed to the queue with the name specified by routing_key, if it exists.



1. VERIFY USERS ON VMs

rabbitmqctl list_users

	root@ubuntu:/home/vagrant# rabbitmqctl list_users
	Listing users ...
	guest	[administrator]
	...done.

	root@ubuntu2:/home/vagrant# rabbitmqctl list_users
	Listing users ...
	guest	[administrator]
	rabbituser	[]
	...done.
	
2. VERIFY USERS ON HOST

root@comp2:/home/syoung# rabbitmqctl list_users

	Listing users ...
	guest	[administrator]
	myuser	[]
	...done.


3. SET UP EMITTER ON HOST AND CLIENT

#### RABBITMQ
sudo rabbitmqctl add_user rabbituser runrabit%2
sudo rabbitmqctl add_vhost rabbitvhost
sudo rabbitmqctl set_permissions -p rabbitvhost rabbituser ".*" ".*" ".*"


4. TEST SEND AND RECEIVE

ON ALIEN

/agua/bin/queue/receive.pl (), "\
--user rabbituser \
--pass runrabit%2 \
--vhost rabbitvhost \
--host localhost


ON VMs:

/agua/bin/queue/emit.pl \
--user rabbituser \
--pass runrabit%2 \
--vhost rabbitvhost \
--host 172.17.42.1 \
--message "TEST MESSAGE"

	OK


	
</entry>
<entry [Sun 2014:04:27 23:25:32 EST] FIXED ERROR: 'unable to connect to epmd (port 4369) on align: address (cannot connect to host/port)'>

PROBLEM

TRYING TO SET PERMISSIONS FOR USER ON HOST

sudo rabbitmqctl add_user rabbituser runrabit%2

	Creating user "rabbituser" ...
	Error: unable to connect to node rabbit@download: nodedown
	
	DIAGNOSTICS
	===========
	
	attempted to contact: [rabbit@download]
	
	rabbit@download:
	  * unable to connect to epmd (port 4369) on download: address (cannot connect to host/port)
	
	current node details:
	- node name: rabbitmqctl2863@download
	- home dir: /var/lib/rabbitmq
	- cookie hash: wQFLkGAxWqFfGFmFsk3i9A==
	

DIAGNOSIS

The epmd process is started automatically when Erlang is run and by default listens on port 4369.

CHECK epmd PORT:

telnet 10.2.24.177 4369

	ok
	

THEN FOUND THAT /etc/hosts CONTAINED INCORRECT DATA AND BAD SYNTAX

	127.0.0.1 worker127.0.0.0 split
	127.0.0.0 align		<====== NOTE: WRONG IP, SHOULD BE 127.0.0.1



SOLUTION

CHANGED /etc/hosts TO

	127.0.0.1 align

RESTARTED RABBITMQ

service rabbitmq-server restart

	OK



NB: EARLIER I MESSED AROUND WITH KILLING ERLANG THEN GOT THIS ERROR ON START RABBITMQ:

tail /var/log/rabbitmq/startup_log 
	ERROR: distribution port 25672 in use on align (by non-Erlang process?)

netstat -ntulp | grep 25672
	tcp        0      0 0.0.0.0:25672           0.0.0.0:*               LISTEN      1043/beam       

KILLED THE PROCESS ON PORT 25672:

kill -9 1043
netstat -ntulp | grep 25672
	NOTHING


	
</entry>
<entry [Fri 2014:04:25 23:36:27 EST] FIXED agua STARTUP >

PROBLEM

dmn --showlog 4

	2014-04-26 06:27:50    [DEBUG]   	Agua::Common::Exchange::newConnection	191	host: localhost
	2014-04-26 06:27:50    [DEBUG]   	Agua::Common::Exchange::newConnection	192	user: myuser
	2014-04-26 06:27:50    [DEBUG]   	Agua::Common::Exchange::newConnection	194	vhost: myvhost
	
	AnyEvent::Handle::destroyed=HASH(0x320dd18)1Connection reset by peer at /agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/Net/RabbitFoot.pm line 64.
	root@host-10-2-24-177:/home/ubuntu# rabbitmqctl list_permissions
	Listing permissions in vhost "/" ...
	Error: unable to connect to node 'rabbit@host-10-2-24-177': nodedown
	
	DIAGNOSTICS
	===========
	
	attempted to contact: ['rabbit@host-10-2-24-177']
	
	rabbit@host-10-2-24-177:
	  * found rabbit (port 25672)
	  * TCP connection succeeded
	  * suggestion: hostname mismatch?
	  * suggestion: is the cookie set correctly?
	
	current node details:
	- node name: 'rabbitmqctl23512@host-10-2-24-177'
	- home dir: /var/lib/rabbitmq
	- cookie hash: 4TjTZdMjT0z8/fR9JjcsPA==


DIAGNOSIS

1. WRONG SETTINGS FOR rabbitmq IN THE CONF FILE

2. HOST NAME IS WRONG


SOLUTION

1. EDIT SETTINGS IN config.yaml

2. CHANGED HOST hostname AND /etc/hostname FILE

hostname master
echo "master" > /etc/hostname


2014-04-26 09:29:58    [DEBUG]   	Agua::Common::Exchange::newConnection	192	user: rabbituser
2014-04-26 09:29:58    [DEBUG]   	Agua::Common::Exchange::newConnection	194	vhost: rabbitvhost
 [*] amq.gen-hNG9ya50hZWuRGgJboFsaA. Waiting for logs. To exit press CTRL-C





2014-04-26 07:22:56    [DEBUG]   	Agua::Common::Exchange::newConnection	192	user: rabbituser
2014-04-26 07:22:56    [DEBUG]   	Agua::Common::Exchange::newConnection	194	vhost: rabbitvhost
Error connecting to AMQP Server host-10.2.24.177:5672: No such device or address at /agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/Net/RabbitFoot.pm line 64.


CHANGED HOST TO 10.2.24.177

2014-04-26 07:25:10    [DEBUG]   	Agua::Common::Exchange::newConnection	194	vhost: rabbitvhost
AnyEvent::Handle::destroyed=HASH(0x5121650)1Connection reset by peer at /agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/Net/RabbitFoot.pm line 64.


</entry>
<entry [Mon 2014:04:21 21:17:32 EST] FIXED ERROR CAN'T telnet TO ALIEN ON 5672>

FROM BCF master
root@master:/agua/bin/openstack# telnet 172.17.42.1 5672
Trying 172.17.42.1...
telnet: Unable to connect to remote host: Connection refused

root@master:/agua/bin/openstack# telnet 172.16.230.1 5672
Trying 172.16.230.1...
telnet: Unable to connect to remote host: Connection refused
root@master:/agua/bin/openstack# 


HAVE OPENED 5672 INGRESS AND EGRESS ON BCF

	
</entry>
<entry [Mon 2014:04:21 21:14:49 EST] TROUBLESHOOTING AND DEBUGGING AMQP APPLICATIONS>

http://rubydoc.info/github/ruby-amqp/amqp/master/file/docs/Troubleshooting.textile


This guide describes tools and strategies that help in troubleshooting and debugging applications that use AMQP in general and Ruby AMQP gem in particular.

Covered versions

This guide covers Ruby amqp gem v0.8.0 and later.

First steps

Whenever something doesn’t work, check the following things before asking on the mailing list:

AMQP broker log.
List of users in a particular vhost you are trying to connect.
Network connectivity. We know, it’s obvious, yet even experienced developers and devops engineers struggle with network access misconfigurations every once in a while.
If EventMachine is started in a separate thread, make sure that isn’t dead. If it is, this usually means there was an exception that caused it to terminate, or environment it is running in mixes threads and fork(2) system call.
Inspecting AMQP broker log file

In this section we will cover typical problems that can be tracked down by reading AMQP broker log. We will use RabbitMQ as an example, however, different AMQP brokers often log most of the same issues.

RabbitMQ logs abrupt TCP connection failures, timeouts, protocol version mismatches and so on. If you are running RabbitMQ, log locations for various operating systems and distributions is documented in the RabbitMQ installation guide

On Mac OS X, RabbitMQ installed via Homebrew logs to ", $self->HOMEBREW_HOME/var/log/rabbitmq/rabbit@$HOSTNAME.log. For example, if you have Homebrew installed at /usr/local and your hostname is giove, log will be at /usr/local/var/log/rabbitmq/rabbit@giove.log.

Here is what authentication failure looks like in RabbitMQ log:


=ERROR REPORT==== 17-May-2011::17:37:58 ===
exception on TCP connection < 0.4770.0> from 127.0.0.1:46551
{channel0_error,starting,
                {amqp_error,access_refused,
                            "AMQPLAIN login refused: user 'pipeline_agent' - invalid credentials",
                            'connection.start_ok'}}
This means that connection attempt with username pipeline_agent failed because credentials were invalid. If you are seeing this message, make sure username, password and vhost are correct.

The following entry:


=ERROR REPORT==== 17-May-2011::17:26:28 ===
exception on TCP connection < 0.4201.62> from 10.8.0.30:57990
{bad_header,< < 65,77,81,80,0,0,9,1>>}
Means that client supports AMQP 0.9.1 but broker doesn’t (RabbitMQ versions pre-2.0 only support AMQP 0.8, for example). If you are using amqp gem 0.8 or later and seeing this entry in your broker log, you are connecting to AMQP broker that is too old to support this AMQP version. In case of RabbitMQ, make sure you run version 2.0 or later.

TBD

Handling channel-level exceptions

A broad range of problems result in AMQP channel exceptions: an indication by the broker that there was an issue application needs to be aware of. Channel-level exceptions are typically not fatal and can be recovered from. Some examples are:

Exchange is re-declared with attributes different from the original declaration. For example, a non-durable exchange is being re-declared as durable.
Queue is re-declared with attributes different from the original declaration. For example, an autodeletable queue is being re-declared as non-autodeletable.
Queue is bound to an exchange that does not exist.
and so on. When troubleshooting AMQP applications, it is recommended that you detect and handle channel-level exceptions on all channels your application may use. For that, use AMQP::Channel#on_error method as demonstrated below:


events_channel.on_error do |ch, channel_close|
  puts "Channel-level exception on the events channel: #{channel_close.reply_text}"
end

commands_channel.on_error do |ch, channel_close|
  puts "Channel-level exception on the commands channel: #{channel_close.reply_text}"
end
Defining channel-level exception handlers will reveal many issues that it might take more time to detect using other troubleshooting techniques.

Testing network connection with AMQP broker using Telnet

One simple way to check network connection between a particular network node and a node running AMQP broker is to use `telnet`:


telnet [host or ip] 5672
then enter any random string of text and hit Enter. AMQP broker should immediately close down the connection. Here is an example session:


telnet localhost 5672
Connected to localhost.
Escape character is '^]'.
adjasd
AMQP    Connection closed by foreign host.
If instead Telnet exits after printing


telnet: connect to address [host or ip]: Connection refused
telnet: Unable to connect to remote host
then connection from the machine you are running Telnet tests on and AMQP broker fails. This can be due to many different reasons, but it is a good idea to check these two things first:

Firewall configuration for port 5672
DNS setup (if hostname is used)
Broker Startup Issues

Missing erlang-os-mon on Debian and Ubuntu

The following error on RabbitMQ startup on Debian or Ubuntu


ERROR: failed to load application os_mon: {"no such file or directory","os_mon.app"}
suggests that erlang-os-mon package is not installed.

Authors
	
</entry>
<entry [Mon 2014:04:21 21:11:06 EST] FIXED ERROR: 'connection reset by peer'>

https://www.rabbitmq.com/configure.html


PROBLEM

CAN ONLY USE RABBITMQ ON localhost ON BCF master

aperl ./config.pl --mode setKey --section "queue:masterip" --value 10.2.24.177
dmn --showlog 4

	Warning: program compiled against libxml 209 using older 207
	Warning: XML::LibXML compiled against libxml2 20900, but runtime libxml2 is older 20708
	object: Agua::Workflow=HASH(0x4787a48)
	2014-04-22 04:06:58    [DEBUG]   	Queue::Daemon::setListener	102	host: 10.2.24.177
	AnyEvent::Handle::destroyed=HASH(0x407d078)1Connection reset by peer at /agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/Net/RabbitFoot.pm line 6


DIAGNOSIS

root@master:/agua/bin/openstack# service rabbitmq-server restart
 * Restarting message broker rabbitmq-server

CHECKED LOG 
 
/var/log/rabbitmq/rabbit@master.log



	=INFO REPORT==== 22-Apr-2014::04:25:55 ===
	accepting AMQP connection < 0.230.0> (10.2.24.177:49075 -> 10.2.24.177:5672)
	
	=ERROR REPORT==== 22-Apr-2014::04:25:58 ===
	closing AMQP connection < 0.230.0> (10.2.24.177:49075 -> 10.2.24.177:5672):
	{handshake_error,starting,0,
					 {amqp_error,access_refused,
								 "AMQPLAIN login refused: user 'guest' can only connect via localhost",
								 'connection.start_ok'}}

GET PERMISSIONS FOR guest

rabbitmqctl list_permissions
	Listing permissions in vhost "/" ...
	guest	.*	.*	.*
	...done.

	
	http://www.rabbitmq.com/access-control.html
	"guest" user can only connect via localhost
	

# set vars 
rabbitmqctl add_user celeryuser celery 
rabbitmqctl add_vhost celeryvhost 
rabbitmqctl set_permissions -p celeryvhost celeryuser ".*" ".*" ".*"

	Setting permissions for user "celeryuser" in vhost "celeryvhost" ... ...done.

# list vars 
rabbitmqctl list_users
	Listing users ...
		celeryuser	[] guest	[administrator] 
rabbitmqctl list_vhosts
	Listing vhosts ...
		/ celeryvhost ...done. 
rabbitmqctl list_permissions

	Listing permissions in vhost "/" ...
	guest	.*	.*	.*
	...done.
	
SOLUTION

1. ADD NEW USER

sudo rabbitmqctl add_user myuser mypassword
sudo rabbitmqctl add_vhost myvhost
sudo rabbitmqctl set_permissions -p myvhost myuser ".*" ".*" ".*"

2. SET USERNAME, PASSWORD, ETC. IN CONNECTION

emacs -nw /agua/t/unit/bin/Agua/Common/Exchange/inputs/receive_logs.pl

	use AnyEvent;
	use Net::RabbitFoot;
	
	my $conn = Net::RabbitFoot->new()->load_xml_spec()->connect(
		host => '132.249.227.110',
		port => 5672,
		user => 'myuser',
		pass => 'mypassword',
		vhost => 'myvhost',
	};

3. CONNECT FROM 3 HOSTS: ALIEN, MASTER AND SPLIT


	ALL RECEIVED MESSAGE FROM emit_log.pl ON master

	OK



*** NB: THIS SOLUTION DID NOT WORK:

1. EDIT rabbitmq.config TO EXCLUDE guest FROM loopback_users GROUP

emacs -nw /etc/rabbitmq/rabbitmq.config

ADD


[
	{mnesia, [{dump_log_write_threshold, 1000}]},
	{rabbit, [{frame_max, 10000000}]},
	{rabbit, [{loopback_users, []}]}
].





	
</entry>
<entry [Mon 2014:04:21 21:08:58 EST] INTERCEPT rabbitmq MESSAGES IN OPENSTACK>

http://prosuncsedu.wordpress.com/2013/11/09/intercept-rabbitmq-messages-in-openstack-nova/
	
</entry>
<entry [Mon 2014:04:21 14:52:50 EST] RABBIT MQ CONFIGURATION>
	
http://www.rabbitmq.com/configure.html


The rabbitmq.config File
The configuration file rabbitmq.config allows the RabbitMQ core application, Erlang services and RabbitMQ plugins to be configured. It is a standard Erlang configuration file, documented on the Erlang Config Man Page.

An example configuration file follows:

  [
    {mnesia, [{dump_log_write_threshold, 1000}]},
    {rabbit, [{tcp_listeners, [5673]}]}
  ].
This example will alter the dump_log_write_threshold for mnesia (increasing from the default of 100), and alter the port RabbitMQ listens on from 5672 to 5673.

This configuration file is not the same as rabbitmq-env.conf, which can be used to set environment variables on non-windows systems.

Location of rabbitmq.config and rabbitmq-env.conf
The location of these files is distribution-specific. By default, they are not created, but expect to be located in the following places on each platform:

Generic UNIX - ", $self->RABBITMQ_HOME/etc/rabbitmq/
Debian - /etc/rabbitmq/
RPM - /etc/rabbitmq/
Mac OS X (Macports) - ${install_prefix}/etc/rabbitmq/, the Macports prefix is usually /opt/local
Windows - %APPDATA%(), "(), "(), "(), "\RabbitMQ\
If rabbitmq-env.conf doesn't exist, it can be created manually in the default location only. It is not used on Windows systems.

If rabbitmq.config doesn't exist, it can be created manually. Set the RABBITMQ_CONFIG_FILE environment variable if you change the location. The Erlang runtime automatically appends the .config extension to the value of this variable.

Restart the server after changes. Windows service users will need to re-install the service after adding or removing a configuration file.

	
</entry>
<entry [Mon 2014:04:21 14:51:20 EST] INCREASE LOG LEVEL IN RABBITMQ>


1. EDIT CONFIG FILE

emacs -nw /etc/rabbitmq/rabbitmq.config

	log_level


2. RESTART RABBITMQ



	
</entry>
<entry [Mon 2014:04:21 11:41:58 EST] FIXED aguad DAEMON ERROR: RABBITMQ SEND MESSAGE FAILS ABOVE MAX SIZE (frame_max)>


PROBLEM

RABBITMQ SEND MESSAGE FAILS OVER A CERTAIN MESSAGE SIZE ()

cd /agua/t/unit/bin/Agua/Common/Exchange/inputs
source /agua/apps/pancancer/envars.sh
agperl ./emit_log.pl '{"mode": "getData","module": "Agua::Workflow","sessionid": "9999999999.9999.999","token": "T61P7mI0pJORJC51","username": "admin","SHOWLOG":4}'

OK
[x] Sent message length: 127168
[x] Sent message length: 130895
[x] Sent message length: 130925

NOK
[x] Sent message length: 131550
[x] Sent message length: 135097



DIAGNOSIS

THE DEFAULT MAX FRAME (MESSAGE) SIZE IS 131072

(ABOVE THAT SIZE THE MESSAGE SHOULD GET SPLIT INTO SEVERAL FRAMES BUT IT DOESN'T - NOT SURE WHY)


SOLUTION

1. ADD frame_max TO FILE rabbitmq.config

emacs -nw /etc/rabbitmq/rabbitmq.config

SET MAX SIZE TO 10 MILLION CHARACTERS:

cat /etc/rabbitmq/rabbitmq.config.old 

	[
		{mnesia, [{dump_log_write_threshold, 1000}]},
		{rabbit, [{frame_max, 10000000}]}
	].

NB: THE FINAL '.' MUST BE THERE (IT'S ERLANG)


2. RESTART SERVER

service rabbitmq-server restart


NB: WILL SEND OUT IF PENDING:

	2014-04-21 14:57:20    [DEBUG]   	Agua::Common::Exchange::sendData	164	 [x] Sent message length: 137617
		(in cleanup) close already in progress at /agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/AnyEvent/RabbitMQ.pm line 612.


NOTES
------

CURRENT RUNNING RABBITMQ PROCESS

rabbitmq  1842  1.0  0.1 2268288 47404 ?       Sl   11:18   2:16 /usr/lib/erlang/erts-5.9.1/bin/beam.smp -W w -K true -A30 -P 1048576 -- -root /usr/lib/erlang -progname erl -- -home /var/lib/rabbitmq -- -pa /usr/lib/rabbitmq/lib/rabbitmq_server-3.2.2/sbin/../ebin -noshell -noinput -s rabbit boot -sname rabbit@comp2 -boot start_sasl -kernel inet_default_connect_options [{nodelay,true}] -sasl errlog_type error -sasl sasl_error_logger false -rabbit error_logger {file,"/var/log/rabbitmq/rabbit@comp2.log"} -rabbit sasl_error_logger {file,"/var/log/rabbitmq/rabbit@comp2-sasl.log"} -rabbit enabled_plugins_file "/etc/rabbitmq/enabled_plugins" -rabbit plugins_dir "/usr/lib/rabbitmq/lib/rabbitmq_server-3.2.2/sbin/../plugins" -rabbit plugins_expand_dir "/var/lib/rabbitmq/mnesia/rabbit@comp2-plugins-expand" -os_mon start_cpu_sup false -os_mon start_disksup false -os_mon start_memsup false -mnesia dir "/var/lib/rabbitmq/mnesia/rabbit@comp2"



</entry>

<entry [Wed 2014:04:02 07:25:12 EST] GET QUEUE SIZE AND UNACKED MESSAGES>

http://www.rabbitmq.com/tutorials/tutorial-two-python.html

Forgotten acknowledgment

It's a common mistake to miss the basic_ack. It's an easy error, but the consequences are serious. Messages will be redelivered when your client quits (which may look like random redelivery), but RabbitMQ will eat more and more memory as it won't be able to release any unacked messages.

In order to debug this kind of mistake you can use rabbitmqctl to print the messages_unacknowledged field:

$ sudo rabbitmqctl list_queues name messages_ready messages_unacknowledged
Listing queues ...
hello    0       0
...done.

	
</entry>
<entry [Wed 2013:12:18 22:30:43 EST] FIXED rabbit.js ERROR: 'possible EventEmitter memory leak detected. 11 listeners added'>

PROBLEM

WHEN RUN server.js GET THIS ERROR:

/aguadev/apps/node-amqp/node_modules/rabbit.js/example/socketio# node server.js
   info  - socket.io started
	(node) warning: possible EventEmitter memory leak detected. 11 listeners added. Use emitter.setMaxListeners() to increase limit.

	
DIAGNOSIS

rabbitmq NOT INSTALLED

OR

PORT ALREADY BEING USED

OR

CHANGED P0RT BUT DID NOT RESTART RABBITMQ

	
SOLUTION

RESTART RABBITMQ 

What I ended up doing was restarting the rabbitmq service. I had changed the port that it was running on and I think that threw it out of wack. It did make me notice a typo that was not setting something that should be set but that was a queue miss-configuration. –  RachelD Sep 13 at 18:05


	
</entry>
<entry [Mon 2013:05:13 10:25:14 EST] INSTALLED VERSION 2.8.4 ON services-dev>


1. GET CURRENT RABBITMQ VERSION ON services-dev

sudo rabbitmqctl status

    Status of node 'rabbit@services-dev' ...
    [{pid,1272},
     {running_applications,[{rabbit,"RabbitMQ","3.1.0"},
                            {os_mon,"CPO  CXC 138 46","2.2.9"},
                            {xmerl,"XML parser","1.3.1"},
                            {mnesia,"MNESIA  CXC 138 12","4.7"},
                            {sasl,"SASL  CXC 138 11","2.2.1"},
                            {stdlib,"ERTS  CXC 138 10","1.18.1"},
                            {kernel,"ERTS  CXC 138 10","2.15.1"}]},
     {os,{unix,linux}},
     {erlang_version,"Erlang R15B01 (erts-5.9.1) [source] [64-bit] [smp:2:2] [async-threads:30] [kernel-poll:true](), "(), "(), "\n"},
     {memory,[{total,28995776},
              {connection_procs,2704},
              {queue_procs,5408},
              {plugins,0},
              {other_proc,9081410},
              {mnesia,60376},
              {mgmt_db,0},
              {msg_index,34280},
              {other_ets,782816},
              {binary,179872},
              {code,15187178},
              {atom,561761},
              {other_system,3099971}]},
     {vm_memory_high_watermark,0.4},
     {vm_memory_limit,2391885414},
     {disk_free_limit,1000000000},
     {disk_free,16331567104},
     {file_descriptors,[{total_limit,924},
                        {total_used,3},
                        {sockets_limit,829},
                        {sockets_used,1}]},
     {processes,[{limit,1048576},{used,123}]},
     {run_queue,0},
     {uptime,18433}]
    ...done.


2. COMPARE TO VERSION ON syoung-dev

sudo rabbitmqctl status

    Status of node 'rabbit@syoung-dev' ...
    [{pid,1678},
     {running_applications,[{rabbit,"RabbitMQ","2.8.4"},
                            {os_mon,"CPO  CXC 138 46","2.2.9"},
                            {sasl,"SASL  CXC 138 11","2.2.1"},
                            {mnesia,"MNESIA  CXC 138 12","4.7"},
                            {stdlib,"ERTS  CXC 138 10","1.18.1"},
                            {kernel,"ERTS  CXC 138 10","2.15.1"}]},
     {os,{unix,linux}},
     {erlang_version,"Erlang R15B01 (erts-5.9.1) [source] [64-bit] [smp:2:2] [async-threads:30] [kernel-poll:true]\n"},
     {memory,[{total,26994864},
              {processes,10412758},
              {processes_used,10412730},
              {system,16582106},
              {atom,504409},
              {atom_used,476768},
              {binary,438304},
              {code,12050643},
              {ets,780432}]},
     {vm_memory_high_watermark,0.39999999988163254},
     {vm_memory_limit,2027583897},
     {disk_free_limit,1000000000},
     {disk_free,18962620416},
     {file_descriptors,[{total_limit,924},
                        {total_used,5},
                        {sockets_limit,829},
                        {sockets_used,2}]},
     {processes,[{limit,1048576},{used,129}]},
     {run_queue,0},
     {uptime,18483}]
    ...done.



3. UNINSTALL RABBITMQ ON services-dev

sudo apt-get --purge remove rabbitmq-server


4. INSTALL RABBITMQ VERSION 2.8.4

NB: TRIED WITH APT-GET
sudo apt-get install rabbitmq-server=2.8.4
    E: Version '2.8.4' for 'rabbitmq-server' was not found

    
DO MANUAL DOWNLOAD FROM OLDER RELEASES
http://www.rabbitmq.com/releases/rabbitmq-server/

mkdir -p /home/syoung1/software/rabbitmq
cd /home/syoung1/software/rabbitmq
wget http://www.rabbitmq.com/releases/rabbitmq-server/v2.8.4/rabbitmq-server_2.8.4-1_all.deb
sudo dpkg -i rabbitmq-server_2.8.4-1_all.deb
 

5. CONFIRM CURRENT VERSION IS 2.8.4
 
sudo rabbitmqctl status

    Status of node 'rabbit@services-dev' ...
    [{pid,9652},
     {running_applications,[{rabbit,"RabbitMQ","2.8.4"},
                            {mnesia,"MNESIA  CXC 138 12","4.7"},
                            {os_mon,"CPO  CXC 138 46","2.2.9"},
                            {sasl,"SASL  CXC 138 11","2.2.1"},
                            {stdlib,"ERTS  CXC 138 10","1.18.1"},
                            {kernel,"ERTS  CXC 138 10","2.15.1"}]},
     {os,{unix,linux}},
     {erlang_version,"Erlang R15B01 (erts-5.9.1) [source] [64-bit] [smp:2:2] [async-threads:30] [kernel-poll:true]\n"},
     {memory,[{total,26261240},
              {processes,10187230},
              {processes_used,10187216},
              {system,16074010},
              {atom,504409},
              {atom_used,473935},
              {binary,99040},
              {code,11908445},
              {ets,765616}]},
     {vm_memory_high_watermark,0.39999999993310714},
     {vm_memory_limit,2391885414},
     {disk_free_limit,1000000000},
     {disk_free,16333701120},
     {file_descriptors,[{total_limit,924},
                        {total_used,3},
                        {sockets_limit,829},
                        {sockets_used,1}]},
     {processes,[{limit,1048576},{used,118}]},
     {run_queue,0},
     {uptime,7}]
    ...done.
    


    
</entry>
<entry [Mon 2013:05:13 04:46:16 EST] RABBITMQ TROUBLESHOOTING>

http://www.rabbitmq.com/troubleshooting.html


Troubleshooting

Checking Broker Status
You can use rabbitmqctl status to verify whether a broker is running.
Normal output from a running broker without plugins follows this pattern:
  Status of node 'rabbit@xxx' ...
  [{pid,...},
   {running_applications,[{rabbit,"RabbitMQ","3.1.0"},
                          {os_mon,"..."},
                          {sasl,"..."},
                          {mnesia,"..."},
                          {stdlib,"..."},
                          {kernel,"..."},
  {os,"..."},
  {erlang_version,"..."},
  {memory,"..."}}]
This example indicates that no broker is running:
  Status of node 'rabbit@xxx' ...
  Error: unable to connect to node 'rabbit@xxx': nodedown
  diagnostics:
  - nodes and their ports on xxx: [{rabbitmqctl,...}]
  - current node: 'rabbitmqctlxxx@xxx'
  - current node home dir: [...]
  - current node cookie hash: [...]
If the diagnostic line looks like this:
  - nodes and their ports on xxx: [{rabbit,...},{rabbitmqctl,...}]
and the broker log file contains entries similar to
  Connection attempt from disallowed node...
then you should make sure the erlang cookies are the same, e.g. by checking that the cookie hash displayed in the diagnostics is the same as that shown by the broker when it starts up.
A common reason for cookie mismatches when invoking rabbitmqctl against a broker on the same host is that broker and rabbitmqctl were run as different user. Evidence of this comes in the form of a mismatch in the node home dir shown by the broker on startup vs what is displayed in the rabbitmqctl diagnostics.
In the absence of the "Connection attempt from disallowed node..." log entry, check that the Erlang distribution port on which the broker is listening is not blocked by a firewall. The port is shown in the {rabbit,...} part of the "nodes and their ports..." diagnostics line. Try connecting to it with e.g. telnet.
If the "nodes and their ports..." line contains no entry for rabbit then the broker probably isn't running. Check the broker logs for errors.
Server Fails to Start
When the server fails to start, usually a crash dump file erl_crash.dump is created in the directory where the server was started. This can provide very detailed information on the causes of a start up failure, but its analysis requires Erlang expertise.
If you attempt to start another server while a broker is already running, then you will receive an error report. You can confirm whether the broker is already running by checking the status.
If the server fails to start, examine the console output and the log files in the RABBITMQ_LOG_BASE directory. Configuration and permission errors are frequently the cause, e.g. the Mnesia directory cannot be created.
Windows Service fails to Install
If the service fails to install, check the service account has full access permission for RABBITMQ_BASE, RABBITMQ_MNESIA_BASE and RABBITMQ_LOG_BASE directories [XP, Vista].
Windows Service fails to Start
If the service fails to start, make sure the service has been installed.
On starting the service, if the service output reads "The process terminated unexpectedly" instead, then the service did not start correctly. Check that the environment variables are set correctly. The logfiles in RABBITMQ_BASE may also contain useful diagnostic information.
You receive an error message reading "The handle is invalid" after upgrading the Windows Service
The solution is to uninstall RabbitMQ and Erlang. Then remove all registry keys under HKLM/SOFTWARE/Ericsson/Erlang/ErlSrv, and then install Erlang and RabbitMQ (in that order).
Plugin fails to activate
If a plugin fails to activate, check the output of rabbitmq-plugins list.
Problems with SSL
See SSL troubleshooting.
If the server is not behaving as expected during operation, examine the log files and use the rabbitmqctl commands from the admin guide to obtain further information on the server status.

For problems encountered in the handling of AMQP traffic, the AMQP capture and analysis tool may help in the analysis.

Failing that, it's possible that we've solved the problem for someone else. Try using the search box at the top of our web pages to find site, mailing list and blog information. You might also check our mailing list archives.

If you still can't find a solution to your problem then please post a new message to rabbitmq-discuss@lists.rabbitmq.com (you may have to join the mailing list first). Let us know what you were trying to do, the error you received and relevant entries from the logfile and one of our engineers will help you get it fixed.

If all of the above fails, please tell us about the problem, including the log files under RABBITMQ_LOG_BASE in your report.
    



RHEL: Start and Stop the RabbitMQ Server
    
http://pubs.vmware.com/vfabric51/index.jsp?topic=/com.vmware.vfabric.rabbitmq.2.8/getstart/install-start-server-rhel.html
    

You must first start the RabbitMQ server to use it. The default configuration for the server is usually adequate to start it.

Prerequisites

Install vFabric RabbitMQ Server.

Procedure

Log in as the root user and open a terminal window.

Start the RabbitMQ server using the /sbin/service rabbitmq-server command, passing it the stop option. For example:

prompt# /sbin/service rabbitmq-server start
The RabbitMQ server process runs as the rabbitmq user, which is non-interactive.

To stop the server:

prompt# /sbin/service rabbitmq-server stop
To get status about the server (only partial output shown):

prompt# /sbin/service rabbitmq-server status
Status of node rabbit@localhost ...
[{pid,6156},
 {running_applications,[{rabbit,"RabbitMQ","2.8.1"},
                        {mnesia,"MNESIA  CXC 138 12","4.4.19"},
                        {os_mon,"CPO  CXC 138 46","2.2.6"},
                        {sasl,"SASL  CXC 138 11","2.1.9.4"},
                        {stdlib,"ERTS  CXC 138 10","1.17.4"},
                        {kernel,"ERTS  CXC 138 10","2.14.4"}]},
 {os,{unix,linux}},
 {erlang_version,"Erlang R14B03 (erts-5.8.4) [source] [64-bit] [rq:1] [async-threads:30] [kernel-poll:true]\n"},
...
What to do next

The RabbitMQ server does not start as a daemon by default when your system starts. If, however, you want it to start by default, then run the following command as the root user or a user with sudo privileges:

prompt# chkconfig rabbitmq-server on
You can also use the rabbitmqctl command to stop and start the RabbitMQ server, as well as perform a number of other tasks, such as get the status of the server, rotate the logs, and so on. The rabbitmqctl command is located in the /usr/lib/rabbitmq/bin directory. Run the command as the root user or as a user with sudo privileges. For example, to get the status of the RabbitMQ server (full output removed for simplicity):

prompt# cd /usr/lib/rabbitmq/bin
prompt# ./rabbitmqctl status
   Status of node 'rabbit@rhel-5-64-svr' ...
See the rabbitmqctl manual page for complete information about this command.
    
</entry>
<entry [Sun 2013:05:12 23:57:22 EST] ADDED RABBITJS TO INFUSIONDEV>


SUMMARY: FIRST, INSTALL RABBITMQ AND START rabbit@myservername. THEN, INSTALL RABBIT.JS AND START server.js


INSTALL RABBITMQ
-----------------

1. UPDATE sources.list

em /etc/apt/sources.list

ADD:

deb http://www.rabbitmq.com/debian/ testing main


cd /home/syoung/software/rabbitmq
wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo apt-key add rabbitmq-signing-key-public.asc


3. UPDATE APT-GET

apt-get update


4. INSTALL RABBITMQ

#sudo apt-get install rabbitmq-server

sudo apt-get --purge remove rabbitmq-server
mkdir -p /home/syoung1/software/rabbitmq
cd /home/syoung1/software/rabbitmq
wget http://www.rabbitmq.com/releases/rabbitmq-server/v2.8.4/rabbitmq-server_2.8.4-1_all.deb
sudo dpkg -i rabbitmq-server_2.8.4-1_all.deb


5. SET MAX OPEN FILE HANDLES TO 1024 IN CONFIG FILE

/etc/default/rabbitmq-server

Invoke ulimit when the service is started to set the maximum number of file open handles for the service process to 1024 (the default):

# ulimit -n 1024


6. START THE RABBITMQ SERVER

rabbitmqctl stop        # stop the server
rabbitmqctl status      # check whether it is running


rabbitmqctl start_app -n rabbit@services-dev &


INSTALL RABBIT.JS
-----------------


1. INSTALL node-amqp CLIENT FOR RABBITMQ:

npm install amqp

2. INSTALL rabbit.js

npm install rabbit.js

3. INSTALL SOCKET.IO
  
npm install socket.io@0.6.17

    socket.io@0.6.17 socket.io

4. START RABBIT.JS SERVER

cd /mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js/example/socketio

node server.js



cd /infusiondev/apps/node-amqp/node_modules/rabbit.js/example/socketio

node server.js


    
</entry>
<entry [Fri 2013:05:10 02:35:30 EST] FIXED ERROR rabbit.js DIES WITH ERROR: 'Error: NOT_FOUND - no queue'>

PROBLEM

ON SEND MESSAGE RABBIT.JS DIES WITH ERROR:

events.js:72
        throw er; // Unhandled 'error' event
              ^
Error: NOT_FOUND - no queue 'amq.gen-ANGNgSqrG32IhZHIgi6ZFB' in vhost '/'



SOLUTION


START RABBITMQ SERVER

    
</entry>
<entry [Mon 2013:05:06 20:19:14 EST] SOLVED DUPLICATE MESSAGES IN server.js>

SUMMARY: FIXED BY MOVING pub AND sub OUT OF SCOPE OF socketioserver.sockets.on

cd /mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js/example/socketio
node server.js


    var http = require('http');
    var url = require('url');
    var fs = require('fs');
    var io = require('socket.io');
    var context = require('../../index').createContext();
    
    var httpserver = http.createServer(handler);
    var socketioserver = io.listen(httpserver);
    
    var pub = context.socket('PUB');
    var sub = context.socket('SUB');
    
    socketioserver.sockets.on('connection', function(connection) {
        connection.on('disconnect', function() {
            pub.destroy();
            sub.destroy();
        });
    
        // NB we have to adapt between the APIs
        sub.setEncoding('utf8');
        connection.on('message', function(msg) {
            pub.write(msg);
        });
        sub.on('data', function(msg) {
            connection.send(msg);
        });
        sub.connect('chat');
        pub.connect('chat');
    });
    
    
    httpserver.listen(8080, '0.0.0.0');
    
    // ==== boring detail
    
    function handler(req, res) {
      var path = url.parse(req.url).pathname;
      switch (path){
      case '/':
        path = '/index.html';
      case '/index.html':
        fs.readFile(__dirname + '/index.html', function(err, data){
          if (err) return send404(res);
          res.writeHead(200, {'Content-Type': 'text/html'});
          res.write(data, 'utf8');
          res.end();
        });
        break;
      default: send404(res);
      }
    }
    
    function send404(res){
      res.writeHead(404);
      res.write('404');
      res.end();
    }



NOTES
-----

DUPLICATE WRITES
http://stackoverflow.com/questions/12392316/node-js-socket-io-duplicate-websocket-writes

WEBSOCKET FILTER IN CHROME DEVTOOLS
http://blog.kaazing.com/2012/05/09/inspecting-websocket-traffic-with-chrome-developer-tools/





    
</entry>
<entry [Sun 2013:05:05 22:47:57 EST] FIXED Queue ERROR: "Uncaught TypeError: Object" "has no method 'connect'">
    
PROBLEM

WHEN SET 'io' AS ARGUMENT FOR DEPENDENCY plugins/queue/Queue

plugins/queue/Queue -> io

... GET THIS ERROR:

io: Object
EventEmitter: function EventEmitter() {}
JSON: Object
Socket: function Socket(options) {
SocketNamespace: function SocketNamespace(socket, name) {
Transport: function Transport(socket, sessid) {
parser: Object
transports: Array[4]
util: Object

Uncaught TypeError: Object #< Object> has no method 'connect' 


SOLUTION

1. SET 'IO' AS ARGUMENT

2. USE setTimeout (500) TO RUN this.loadSocketIO TO CALL io.connect(host, details)
    
    
</entry>
<entry [Sun 2013:05:05 22:46:29 EST] FIXED Queue ERROR: "Cannot call method 'parseUri' of undefined">

http://localhost/aguadev/tests/rabbitmq/socket6.html


SUMMARY: io.connect (v 0.9.11) HAS THIS SIGNATURE: host, details

PROBLEM

plugins/queue/Queue -> IO

SOCKET.IO.JS socketio.js:1
socketio    io: [object Object] socketio.js:3341
Object
io: Object
EventEmitter: function EventEmitter() {}
JSON: Object
Socket: function Socket(options) {
SocketNamespace: function SocketNamespace(socket, name) {
Transport: function Transport(socket, sessid) {
parser: Object
transports: Array[4]
util: Object


io: Object
connect: function (host, details) {
j: Array[0]
protocol: 1
sockets: Object
transports: Array[0]
version: "0.9.11"

socketio.connect    host: undefined socketio.js:73
socketio.connect    details: undefined socketio.js:74

Uncaught TypeError: Cannot call method 'parseUri' of undefined


SOLUTION

1. SET 'IO' AS ARGUMENT

2. USE setTimeout (500) TO RUN this.loadSocketIO TO CALL io.connect(host, details)


    
</entry>
<entry [Fri 2013:05:03 15:49:40 EST] RABBITMQ ROUTING QUEUES>

http://www.rabbitmq.com/tutorials/tutorial-four-python.html


    
</entry>
<entry [Fri 2013:05:03 09:32:08 EST] MIRRORING AND FAILOVER (USE durable)>

http://www.rabbitmq.com/ha.html


Some examples

Policy where queues whose names begin with "ha." are mirrored to all nodes in the cluster:

rabbitmqctl	
rabbitmqctl set_policy ha-all "^ha\." '{"ha-mode":"all"}'
rabbitmqctl (Windows)	
rabbitmqctl set_policy ha-all "^ha\." "{""ha-mode"":""all""}"

HTTP API	

PUT /api/policies/%2f/ha-all {"pattern":"^ha\.", "definition":{"ha-mode":"all"}}

Web UI	

Navigate to Admin > Policies > Add / update a policy.
Enter "ha-all" next to Name, "^ha\." next to Pattern, and "ha-mode" = "all" in the first line next to Policy.
Click Add policy.

Policy where queues whose names begin with "two." are mirrored to any two nodes in the cluster, with automatic synchronisation:

rabbitmqctl	
rabbitmqctl set_policy ha-two "^two\." \
   '{"ha-mode":"exactly","ha-params":2,"ha-sync-mode":"automatic"}'
rabbitmqctl (Windows)	
rabbitmqctl set_policy ha-two "^two\." ^
   "{""ha-mode"":""exactly"",""ha-params"":2,"ha-sync-mode":"automatic"}"

HTTP API	

PUT /api/policies/%2f/ha-two
{"pattern":"^two\.", "definition":{"ha-mode":"exactly", "ha-params":2,"ha-sync-mode":"automatic"}}

Web UI	

Navigate to Admin > Policies > Add / update a policy.
Enter "ha-two" next to Name and "^two\." next to Pattern.
Enter "ha-mode" = "exactly" in the first line next to Policy, then "ha-params" = 2 in the second line, then "ha-sync-mode" = "automatic" in the third, and set the type on the second line to "Number".
Click Add policy.

MIRRORED QUEUE

one master and several slaves, each on a different node.
slaves apply the operations that occur to the master in exactly the same order as the master and thus maintain the same state
clients consuming from a mirrored queue consume from the master.

Should a slave fail, there is little to be done other than some bookkeeping: the master remains the master and no client need take any action or be informed of the failure.

IF THE MASTER FAILS

    The eldest slave is promoted to become the new master.
    No messages that are published to the mirrored-queue during this time will be lost: messages published to a mirrored-queue are always published directly to the master and all slaves. Thus should the master fail, the messages continue to be sent to the slaves and will be added to the queue once the promotion of a slave to the master completes.
    If there is no slave that is synchronised with the master, messages that only the master held will be lost
    The slave requeues all messages that have been delivered to clients but are pending acknowledgement (it considers all previous consumers to have been abruptly disconnected).
    This can include messages for which a client has issued acknowledgements: either the acknowledgement was lost on the wire before reaching the master, or it was lost during broadcast from the master to the slaves. In either case, the new master has no choice but to requeue all messages it thinks have not been acknowledged.    
    The slave sends a CONSUMER CANCELLATION NOTIFICATION - Clients that were consuming from the mirrored-queue receive a notification that their subscription to the mirrored-queue has been abruptly cancelled (if they support the Consumer Cancellation Notifications extension)
        Clients should re-consume from the queue, which will pick up the new master (to avoid the possibility that a client continues to issue acknowledgements for messages they were sent by the old, failed master, and does not expect that it might be about to see the same messages again, this time sent by the new master).
        Clients that re-consume from the queue must be aware that they are likely to subsequently receive messages that they have seen previously
        Similarly, messages published by clients using publisher confirms will still be confirmed correctly even if the master (or any slaves) fail between the message being published and the message being able to be confirmed to the publisher.
        Thus from the point of view of the publisher, publishing to a mirrored-queue is no different from publishing to any other sort of queue. It is only consumers that need to be aware of the possibility of needing to re-consume from a mirrored-queue upon receipt of a Consumer Cancellation Notification.


USE noAck=false TO AVOID MESSAGE LOSS

If you are consuming from a mirrored-queue with noAck=true (i.e. the client is not sending message acknowledgements) then messages can be lost. This is no different from the norm of course: the broker considers a message acknowledged as soon as it has been sent to a noAck=true consumer, and should the client disconnect abruptly, the message may never be received.

In the case of a mirrored-queue, should the master die, messages that are in-flight on their way to noAck=true consumers may never be received by those clients, and will not be requeued by the new master. Because of the possibility that the consuming client is connected to a node that survives, the Consumer Cancellation Notification is useful in identifying when such events may have occurred. Of course, in practise, if you care about not losing messages then you are advised to consume with noAck=false.


MIRRORED QUEUES SUPPORT PUBLISHER confirms AND transactions

transaction:
    A tx.commit-ok will only be returned to a client when the transaction has been applied across all mirrors of the queue.
    
Publisher confirms:
A message will only be confirmed to the publisher when it has been accepted by all of the mirrors.

It is correct to think of the semantics as being the same as a message being routed to multiple normal queues, and of a transaction with publications within that similarly are routed to multiple queues.

SYNCHRONISATION OF NEW SLAVES

Slave will receive new messages published to the queue

Over time will accurately represent the tail of the mirrored-queue

As messages are drained from the mirrored-queue, the size of the head of the queue for which the new slave is missing messages, will shrink until eventually the slave's contents precisely match the master's contents. At this point, the slave can be considered fully synchronised

Important to note that this has occured because of actions of clients in terms of draining the pre-existing head of the queue.


NEW SLAVES DROP ANY EXISTING MESSAGES

Thus a newly added slave provides no additional form of redundancy or availability of the queue's contents until the contents of the queue that existed before the slave was added have been removed or the queue has been explicitly synchronised (see below)

    The queue becomes unresponsive while synchronisation is occurring
    Best to allow active queues from which messages are being drained to synchronise naturally
    Only explicitly synchronise inactive queues.

Explicit synchronisation can be triggered in two ways: manually or automatically. If a queue is set to automatically synchronise it will synchronise whenever a new slave joins - becoming unresponsive until it has done so.

STARTING AND STOPPING NODES

If you stop a RabbitMQ node which contains the master of a mirrored-queue, some slave on some other node will be promoted to the master (assuming there is one). If you continue to stop nodes then you will reach a point where a mirrored-queue has no more slaves: it exists only on one node, which is now its master. If the mirrored-queue was declared durable then, if its last remaining node is shutdown, durable messages in the queue will survive the restart of that node. In general, as you restart other nodes, if they were previously part of a mirrored-queue then they will rejoin the mirrored queue.

However, there is currently no way for a slave to know whether or not its queue contents have diverged from the master to which it is rejoining (this could happen during a network partition, for example). As such, when a slave rejoins a mirrored-queue, it throws away any durable local contents it already has and starts empty. Its behaviour is at this point the same as if it were a new node joining the cluster.


HOW TO CONFIGURE MIRRORING

Queues have mirroring enabled via policy.

You can change the policy of a non-mirrored queue to make it mirrored (and vice versa)

A non-mirrored queue does not have any slaves and the extra mirroring infrastructure and will run faster.

CONFIGURE COMMAND

To cause queues to become mirrored:

1. Create a policy which matches them

2. Set policy keys ha-mode and (optionally) ha-params. The following table explains the options for these keys:

    ha-mode	ha-params	Result
    
        all	(absent)
        Queue is mirrored across all nodes in the cluster. When a new node is added to the cluster, the queue will be mirrored to that node.
        
        exactly	count
        Queue is mirrored to count nodes in the cluster. If there are less than count nodes in the cluster, the queue is mirrored to all nodes. If there are more than count nodes in the cluster, and a node containing a mirror goes down, then a new mirror will not be created on another node. (This is to prevent queues migrating across a cluster as it is brought down.)
        
        nodes	node names
        Queue is mirrored to the nodes listed in node names. If any of those node names are not a part of the cluster, this does not constitute an error. If none of the nodes in the list are online at the time when the queue is declared then the queue will be created on the node that the declaring client is connected to.



Whenever the HA policy for a queue changes it will endeavour to keep its existing mirrors as far as this fits with the new policy.


NODE MASTERS ARE RESILIENT

Setting or modifying a "nodes" policy will never cause an existing master to go away, even if you ask it to.

For example, if a queue is on [A], and you give it a nodes policy telling it to be on [B C], it will end up on [A B C]

If node A then fails or is shut down, the mirror on that node will not come back and the queue will stay on [B C].


HOW TO SYNCHRONISE QUEUES

START AUTOMATIC SYNCHRONISATION

Set ha-sync-mode policy key to automatic.

ha-sync-mode can also be set to manual (DEFAULT)


LIST SYNCHRONISED SLAVES

rabbitmqctl list_queues name slave_pids synchronised_slave_pids


SYNCHRONISE QUEUE:

rabbitmqctl sync_queue name


CANCEL SYNCHRONISATION:

rabbitmqctl cancel_sync_queue name

These features are also available through the management plugin.


    
</entry>
<entry [Mon 2013:04:22 03:21:22 EST] CLEANED UP SOCKET.IO SUBDIRS IN /aguadev/html>

1. REMOVED OLD VERSION (v0.6) OF socket.io.js IN /aguadev/html/socket.io

/aguadev/html/socket.io/support/socket.io-client/socket.io.js


2. REMOVED WRONG FILE IN /aguadev/html/socketio


3. KEPT NEW VERSION (v0.9.11) OF socket.io.js IN /aguadev/html/rabbit.js

/aguadev/html/rabbit.js/example/socketio/node_modules/socket.io/lib/socket.io.js


WHERE rabbit.js WAS COPIED FROM:

/mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js/example/socketio/node_modules/lib/socket.io.js


    
</entry>
<entry [Mon 2013:04:22 02:04:44 EST] COPIED RABBIT.JS TO /aguadev/html/socketio2>

1. COPY socketio DIRECTORY

cp -r /mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js /aguadev/html

2. START SERVER

cd /aguadev/html/socketio2
node example/socketio/server.js

    
</entry>
<entry [Mon 2013:04:22 01:44:37 EST] SOCKET.IO MIGRATION GUIDE (0.6 TO 0.7)>

https://github.com/LearnBoost/Socket.IO/wiki/Migrating-0.6-to-0.7+

Migrating 0.6 to 0.7+

This document is a starter guide for migrating Socket.IO v0.6.x applications to Socket.IO v0.7.x.

Client
Connecting to Socket.IO

In v0.6.x you would instantiate a socket and connect to it with something like:

var socket = new io.Socket(host, options);
socket.connect();

In v0.7.x you should use io.connect, without new.

var socket = io.connect(uri, options);
In addition, you no longer need to pass port, host, secure. You simply pass a URL:

// connect at the same host / port as your website
var socket = io.connect();

// different port or host
var socket = io.connect('http://url.com');

// secure
var socket = io.connect('https://localhost');
    
</entry>
<entry [Mon 2013:04:22 01:03:49 EST] RAN rabbit.js CHAT IN TEST socket6.html>

1. KILL GALAXY AND RUN RABBIT.JS WITH SOCKET.IO:

cd /mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js/example/socketio
npm install && npm start



USING WEBSOCKETS DEMO - socket7.html

/aguadev/html/tests/rabbitmq/socket7.html


    warn  - unknown transport: "undefined"
    info  - unhandled socket.io url


  if (!~this.get('transports').indexOf(data.transport)) {
    this.log.warn('unknown transport: "' + data.transport + '"');
    req.connection.end();
    return;
  }



/aguadev/hmtl/tests/rabbitmq/socket6.html

    OK

   info  - socket.io started
   


    socketioserver: [object Object]
    { socketioserver: 
       { server: 
          { domain: null,
            _events: [Object],
            _maxListeners: 10,
            _connections: 0,
            connections: [Getter/Setter],
            _handle: null,
            _usingSlaves: false,
            _slaves: [],
            allowHalfOpen: true,
            httpAllowHalfOpen: false,
            timeout: 120000 },
         namespaces: { '': [Object] },
         sockets: 
          { manager: [Circular],
            name: '',
            sockets: {},
            auth: false,
            flags: [Object],
            _events: [Object] },
         _events: 
          { 'set:transports': [Object],
            'set:store': [Function],
            'set:origins': [Function],
            'set:flash policy port': [Function],
            'set:flash policy server': [Function] },
         settings: 
          { origins: '*:*',
            log: true,
            store: [Object],
            logger: [Object],
            static: [Object],
            heartbeats: true,
            resource: '/socket.io',
            transports: [Object],
            authorization: false,
            blacklist: [Object],
            'log level': 3,
            'log colors': true,
            'close timeout': 60,
            'heartbeat interval': 25,
            'heartbeat timeout': 60,
            'polling duration': 20,
            'flash policy server': true,
            'flash policy port': 10843,
            'destroy upgrade': true,
            'destroy buffer size': 100000000,
            'browser client': true,
            'browser client cache': true,
            'browser client minification': false,
            'browser client etag': false,
            'browser client expires': 315360000,
            'browser client gzip': false,
            'browser client handler': false,
            'client store expiration': 15,
            'match origin protocol': false },
         handshaken: {},
         connected: {},
         open: {},
         closed: {},
         rooms: {},
         roomClients: {},
         oldListeners: [ [Function: handler] ],
         sequenceNumber: 726383938 } }

    OK
    


SERVER OUTPUT WHEN CONNECT WITH socket3.html:

   debug - destroying non-socket.io upgrade


WHERE THE HTML HEADER IS:

    Request URL:ws://localhost:8080/
    Request Headersview source
    Cache-Control:no-cache
    Connection:Upgrade
    Cookie:galaxysession=c6ca0ddb55be603a58aaa9bb9c142efee2178a85cc4257a10764b1f5dbaba3ae7dd01ec214f8d464
    Host:localhost:8080
    Origin:http://localhost
    Pragma:no-cache
    Sec-WebSocket-Extensions:x-webkit-deflate-frame
    Sec-WebSocket-Key:sE2+IirOq5yyVLjIM/OLVg==
    Sec-WebSocket-Version:13
    Upgrade:websocket


ERROR EMANATES FROM 

/mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js/example/socketio/node_modules/socket.io/lib/manager.js

@@ -608,7 +608,7 @@

   if (!data) {
     if (this.enabled('destroy upgrade')) {
       socket.end();
-      this.log.debug('destroying non-socket.io upgrade');
+      this.log.debug('');
     }
 
    
</entry>
<entry [Sun 2013:04:21 18:24:00 EST] CLONED SOCKET.IO TO html>

cd /aguadev/html
git clone https://github.com/LearnBoost/socket.io.git

mv socket.io socketio

ADD TO HTML FILE:

<!---->
<!--<script src="socketio/lib/socket.io.js"></script>-->
<!---->

    
</entry>
<entry [Sat 2013:04:20 23:28:52 EST] HOW TO INSTALL RABBITMQ MANAGEMENT>

Nice management addins to install are the RabbitMQ Management plugins.
Download these addins from here:
 - http://www.rabbitmq.com/plugins.html

rabbitmq_management

- mochiweb
- webmachine
- rabbitmq_mochiweb
- amqp_client
- rabbitmq_management_agent
- rabbitmq_management

rabbitmq_visualiser

- rabbitmq_management_visualiser

To install the plugins, you need to stop the server. In the terminal:
 - Execute in the terminal: rabbitmqctl stop

Copy all of the .ez files in /home/[username]/Downloads to the RabbitMQ plugin directory

 - Execute in the terminal: sudo mv ~/Downloads/*.ez /usr/lib/rabbitmq/lib/rabbitmq_server-2.6.1/plugins


Restart RabbitMQ with the following:
 - Execute in the terminal: sudo rabbitmq-server

In firefox, navigate to http://localhost:55672 and login as guest / guest
 - Hopefully, you should see the management console and the visualizer (pretty cool!)


</entry>
<entry [Sat 2013:04:20 23:28:15 EST] TROUBLESHOOTING START RABBIT.JS WITH SOCKET.IO>

PROBLEM

npm WARN prefer global amqp@0.1.6 should be installed with -g
amqp@0.1.6 ../node_modules/amqp

SOLUTION

USE -g FLAG: npm install amqp -g




PROBLEM
npm install && npm start
    ...
    warn  - error raised: Error: listen EADDRINUSE

    
DIAGNOSIS

GALAXY IS RUNNING ON PORT 8080.


SOLUTION

KILL GALAXY AND RUN:

cd /mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js/example/socketio
npm install && npm start

    OK


    
</entry>
<entry [Sat 2013:04:20 23:28:10 EST] INSTALLED AND STARTED RABBIT.JS SERVER>

*** ORIGINAL PAGE ON RABBIT.JS ***

http://www.rabbitmq.com/blog/2010/11/12/rabbitmq-nodejs-rabbitjs/


**** SUCCESS: RABBIT.JS SERVER PROVIDES CHAT VIA SOCKET.IO AND RABBITMQ CAN INJECT MESSAGES!!  ****


1. INSTALL node-amqp (A CLIENT FOR RABBITMQ)

#mkdir -p /home/syoung/software/rabbitjs
#cd /home/syoung/software/rabbitjs
#git clone https://github.com/squaremo/node-amqp.git


npm install amqp

    npm WARN engine amqp@0.1.6: wanted: {"node":"0.4 || 0.5 || 0.6 || 0.8"} (current: {"node":"v0.10.3","npm":"1.2.17"})
    amqp@0.1.6 /usr/local/lib/node_modules/amqp


2. INSTALL rabbit.js

npm install rabbit.js

    rabbit.js@0.2.0 node_modules/rabbit.js

npm ls
    rabbit.js@0.2.0 /mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js
    └── amqp@0.1.6

INSTALLED GLOBALLY:

npm install rabbit.js -g
    npm WARN engine amqp@0.1.6: wanted: {"node":"0.4 || 0.5 || 0.6 || 0.8"} (current: {"node":"v0.10.3","npm":"1.2.17"})
    rabbit.js@0.2.0 /usr/local/lib/node_modules/rabbit.js
    └── amqp@0.1.6


3. INSTALL SOCKET.IO
  
npm install socket.io@0.6.17

    socket.io@0.6.17 socket.io


4. CONFIRM INSTALLED NODE.JS PACKAGES

npm ls

    OK


5. START RABBIT.JS SERVER

cd /mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js/examples/socketio

node server.js

# OR

npm install && npm start
     OK
    info  - socket.io started

   
6. OPEN BROWSER

	http://localhost:8080

USE MULTIPLE WINDOWS TO SEND CHAT
    
    OK!!


7. SENT MESSAGE BY RABBITMQ TO 'chat' QUEUE

cd /aguadev/private/bin/test/perl/NetRabbitFoot

RUN emit_log.pl WITH EXCHANGE logs CHANGED TO chat:


    #!/usr/bin/perl
    
    use strict;
    use warnings;
    
    $|++;
    use Net::RabbitFoot;
    
    my $conn = Net::RabbitFoot->new()->load_xml_spec()->connect(
        host => 'localhost',
        port => 5672,
        user => 'guest',
        pass => 'guest',
        vhost => '/',
    );
    
    my $channel = $conn->open_channel();
    
    $channel->declare_exchange(
        exchange => 'chat',
        type => 'fanout',
    );
    
    my $msg = join(' ', @ARGV) || "info: Hello World!";
    
    $channel->publish(
        exchange => 'chat',
        routing_key => '',
        body => $msg,
    );
    
    print " [x] Sent $msg(), "(), "(), "\n";
    
    $conn->close();


OK!!!!




NOTES
-----

DOCUMENTATION ERRORS OR OUT-OF-DATE


# node socketio/server.js COMMAND FAILS TO START SERVER

    20 Apr 23:20:43 - socket.io ready - accepting connections

    /mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js/example/socketio/server.js:11

    socketioserver.sockets.on('connection', function(connection) {
                           ^
    TypeError: Cannot call method 'on' of undefined
        at Object.< anonymous> (/mnt/home/syoung/software/rabbitjs/node-amqp/node_modules/rabbit.js/example/socketio/server.js:11:24)
        at Module._compile (module.js:456:26)
        at Object.Module._extensions..js (module.js:474:10)
        at Module.load (module.js:356:32)
        at Function.Module._load (module.js:312:12)
        at Function.Module.runMain (module.js:497:10)
        at startup (node.js:119:16)
        at node.js:901:3


# THIS ALSO DOESN'T WORK

cd /home/[username]/local/node/lib/node_modules/rabbit.js
node example/socketio.js


</entry>
<entry [Sat 2013:04:20 21:21:59 EST] BLUEPRINT: RABBITMQ FOR MESSAGING, NODEJS + SOCKET.IO FOR PUSH>

REQUIREMENTS

1. SERVER PUSH (NODE.JS + SOCKET.IO)

2. WORKFLOW MESSAGING ACCESSIBLE VIA PERL (RABBITMQ) 


ARCHITECTURE:

LINK RABBITMQ WITH SOCKET.IO VIA NODE.JS

node.js for fun network server programming
Socket.IO for magical browser sockets
RabbitMQ for the no-tears messaging.

SECURITY:

SSL: HTTPS


AUTHENTICATION (HANDLED IN PERL MODULE):

    -   USERNAME + SESSIONID


MESSAGING LAYERS:

    ROUTING (UNIQUE CLIENT-TO-SERVER COMMUNICATION):
    
        -   UPLOAD
        
        -   ADMIN-LEVEL INFORMATION/TASKS
        
        -   UNIQUE USER INFORMATION (UPDATE PROFILE, ETC.)
        

    PUBLISH (TO ALL CLIENTS):
    
        -   DATA CHANGES TO A PARTICULAR PLUGIN/MODULE (INFUSION: project, sample, flowcell, lane CHANGES)
        
        -   DATA CHANGES TO ALL MODULES (AGUA'S PUBLISH/SUBSCRIBE: PROJECT, WORKFLOW, ETC. CHANGES)

        -   ALL USERS (E.G., SYSTEM MAINTENANCE/SHUTDOWN MESSAGES)
        
        
    WORKFLOW QUEUE (ALL CLIENTS __or__ UNIQUE CLIENT-T0-SERVER COMMUNICATION):
    
        -   PROJECT-SPECIFIC QUEUE
        
        -   FAILED QUEUE FOR OFF-LINE DIAGNOSIS

        -   STATUS REQUEST QUEUE - SERVER REQUESTS STATUS FROM WORKERS

        -   STATUS QUEUE - WORKERS SEND TASKS STATUS TO SERVER


QUEUE NAMING FORMAT:

TYPE-USERNAME-MODE-MESSAGEID




LATER
-----

TASK LIST

    REPRESENTATION OF TASKS/JOBS IN QUEUE:
    
        JOBS COMMANDED BY CLIENT, RUNNING ON SERVER
        
        JOB STATUS: WAITING, RUNNING, ERROR, COMPLETE
        
        ASYNCHRONOUS: MULTIPLE TASKS CAN BE IN PROGRESS AT THE SAME TIME
        
    
    INTERACTION:

        PAUSE TASK
        
        DELETE TASK
        
        PURGE ALL TASKS
        
        REORDER/PRIORITISE TASKS ??
        
        TASK NESTING ??

RabbitMQ

    PROVIDES reliable, persistent queues if desired
    BRIDGES to other protocols (notably AMQP and STOMP);
    HAS A web management app (monitoring and transparency)

    MONITORING OF NODES (command-line tools/management plugin):
    How many messages there are stored for a particular feed?
    What's the current throughput?


    
NOTES:


COLORADO - INTELLIGENT TRANSPORTATION SYSTEMS
---------------------------------------------

SCHEDULER/DELEGATE LAYER
http://www.cotrip.org/its/ctms_doc/requirements/iteration_1/technical_requirements.pdf

The Delegate layer handles all the requests from the Client to server and from the comm. server to application server. 
Delegate layers hide the complexity of remote communication with business service components. This layer is going to forward the request from clients to the appropriate layers in the app server. 

    1. Unnecessary invocation of remote services must be avoided. 
    2. Service Creation, reconfiguration and invocation details must be configurable. 
    3. Delegate Layers must implement container security.


SERVICE LAYER
The Services Layer is hosted in the J2EE Server and is implemented with Enterprise JavaBeans (EJBs). It provides business logic to serve system requests from querying the database, reporting, validation logic, application flow/delegation, alarm generation, logging, and persistence. This layer sits in-between the Client and Scheduler layers and the Communications layers intercepting requests, forwarding the requests on via the Messaging layer and/or servicing the requests immediately in a synchronous mode.

    1. Services must be configurable without downtime whenever possible. 
    2. The container must do the persistence, connection and instance pooling. 
    3. All the calls with in the container must be local calls and not remote calls. 
    4. System clock must be synchronized for the scheduler service to run effectively in the clustered environment. 
    5. System logs must be stored in the flat files. 
    6. A user can belong to several security groups but can have only one role within each security group. Within each group user can have only one role. A device belongs to only one group. 
    7. User permissions will not be refreshed until the user is logged-out. 
    8. The only way to disable a user account is to set it to 'disabled'. There will be no temporary effective / transfer date functionality. 
    9. CRUDN will be used for permission types to grant access to a principal (to a protected resource). 
    10. A few simple combinations such as for a protected resource can never have N with other permissions (for a given principal) will be validated with a data script. 
    11. Services must scale horizontally and vertically.
    12. Services must be reliable and secure.

    
COMMUNICATIONS LAYER
The Communications Layer is responsible for the communications to devices and is implemented by a 
“Communication Server”. It knows how to connect to devices in a scalable manner (reusing connections across 
multiple requests to the same device, pooling connections, etc.) and it also knows how to transform an instruction 
from an object format to a device-specific protocol and vice versa. The Communications Layer does not perform 
business or validation logic and acts simply as a worker, communicating to devices that it has been told to interact 
with. The Services Layer is the brains behind which instructions to execute and when to run them, for instance, 
now or in the future via the Scheduler. The Communications Layer cannot be run in the EJB Container. It requires 
threading, asynchronous protocol event handling. Throughout the comm. server specs the terms jobs, instructions, 
tasks, messages and request/reply have been used interchangeably. 


USER INTERFACE
The CTMS UI will span into 2 screens. The main screen will display maps and the various layers to provide the visual representation of the devices and highways of the state of Colorado. And the second screen is the user information screen that will provide the various panes displaying the various activities of the CTMS subsystem. The technical requirements for the UI are: 
1. Static Layers must not be continually downloaded to the client. 
2. Layers must be loaded and configured thru the one Arc XML source common to all clients. 
3. UI must use Map Objects 2.0 Java and ArcSDE to display maps and layers. 
4. UI must support multiple screen and able to adjust itself with different resolutions. The minimum screen resolution 
for the CTMS app should 1280x1024.
5. UI must be able to seamlessly handle the server crashes or failures. 
6. UI must be supported on Windows 2000, Windows XP. 
7. UI must support asynchronous communication thru JMS. It must handle messages from more than one queue/topic. 
8. UI must have the minimum VIDEO RAM of 256 MB to rerender the MAPS when the spatial information of the 
layers is changed or background image is selected or deselected. 
9. Map’s background image must be less than 12 MB as recommended by MAP OBJECTS to load the image faster. 
10. UI must be run with atleast heap option settings -Xms64m -Xmx512m 
11. Maps/Layers must not use highly compressed image formats. This will lead to a performance hit when 
decompressing such images. 
12. UI must connect to delegate layer to do the synchronous communication with the application server. 
13. Background images must be loaded from Arc SDE when technology is available.


MESSAGING LAYER
The messaging layer is implemented as an active/active clustered JMS (Java Messaging Service) Server acting as a message bus to decouple the layers (client, communications, and application server) and allow the application to broadcast events anonymously or focused on a particular handler via Message Selectors (filters). 
1. JMS server and MDBs or message driven beans must be clustered to provide failover and load balancing features. 
JMS Server must provide fail-over capabilities in the event of a JMS Server failure. 
a. By storing messages in a JMS Store. Messages are delivered using JMS’s persistent delivery mode. 
b. By providing automatic failover of JMS listeners to secondary JMS Server 
2. Conection Factories, destinations and queues must be configurable. 
3. Message Queues used by the JMS Server must be kept free of dead messages. 
4. All the administered Objects must be retrievable via a JNDI lookup. 
5. Messages must be reliable and secure. 
6. Messaging Layer must scale horizontally and vertically.
        
        

SOCKET.IO WITH RABBITMQ

Friday, November 12th, 2010
http://www.rabbitmq.com/blog/tag/socketio/

Since node.js has an AMQP client, we can easily hook it up with RabbitMQ; not only to bridge to other protocols and back-end systems, but also to provide messaging between browsers, and between application servers, and so on.



http://lists.rabbitmq.com/pipermail/rabbitmq-discuss/2012-February/018408.html

On Thu, Feb 23, 2012 at 16:54, tsuraan < tsuraan at gmail.com> wrote:
> We have a comet-like server that has four basic tiers of messages:
> page-level, user-level, topic, and global.  When a page is rendered
> that hooks into the comet system, it initially subscribes to the comet
> server using a POST with the tiers that it wants, and then it uses GET
> to wait on new messages using long-polling.  To support this, I've
> made a somewhat overly-complicated server that does a lot of internal
> queueing, but is ultimately backed by Rabbit.
>
> I've been looking at simplifying this, but first I thought I'd run it
> past you guys, since I think my idea may have some components that
> rabbit would hate.  Basically, what I want to do is make a short-lived
> (and non-durable) queue per page (where a single page is dynamic, so
> it tends to live for a while), and then have that queue be subscribed
> to a "global" exchange, a "user" exchange, and a "topics" exchange.

Does it mean that every page is user specific? Or is "user" exchange
not for per-user messages but rather global ones?

> I see that Rabbit now has a queue-expiry extension, so unused queues
> could be automatically garbage collected (I was thinking of basically
> having a 10s idle timeout on my temp queues).

I'm not sure what your scale is, but this setup has a good property -
it should be relatively easy to shard it. So it's generally reasonable.

> My concern is whether
> rabbit likes having thousands or tens of thousands of queues created
> and torn down every few minutes.  I seem to recall that it didn't like
> that at all in the past, but Rabbit's been progressing like mad
> lately, so I figured I'd ask if that's a sane thing to do these days.

Like always - you need to prototype and benchmark it :)

But generally, I would probably go for a different setup.

I think we can assume with reasonable confidence that number
of concurrent users on your site is constant. (as opposed to
dynamic pages AFAIU)

So why not create queue-per-user? (for users actively browsing).

When user enters a page - you can subscribe the queue to a per-page
exchange. When user navigates away - you unsubscribe.

Of course, this has some limitations - you may want to buffer
data per-page, and this setup can't do that easily (you would
need to use redis or something for that).

Hope that helps,
  Marek



http://lists.rabbitmq.com/pipermail/rabbitmq-discuss/2012-February/018412.html


Design for Comet

Marek Majkowski majek04 at gmail.com 
Fri Feb 24 16:57:53 GMT 2012
Previous message: [rabbitmq-discuss] Design for Comet
Next message: [rabbitmq-discuss] Filter by presence in a header Exchange
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
On Fri, Feb 24, 2012 at 16:13, tsuraan < tsuraan at gmail.com> wrote:
>> Does it mean that every page is user specific? Or is "user" exchange
>> not for per-user messages but rather global ones?
>
> The user exchange is for messages that are addressed to specific
> users, so every web page that a given user has open (on all their
> different browsers, etc) would get all messages addressed to that
> user.  Global messages get sent to all pages that are opened in all
> browsers, topic messages get sent to all subscribers to a topic, and
> there are "page" messages that are targeted towards a specific
> instance of a page (i.e. a specific tab that's opened on one of our
> pages).
>
>> Like always - you need to prototype and benchmark it :)
>
> Yeah, I'm really wondering about hidden things, like "that will work
> for a week, but then mnesia will start on fire" or something to that
> effect :)
>
>> But generally, I would probably go for a different setup.
>>
>> I think we can assume with reasonable confidence that number
>> of concurrent users on your site is constant. (as opposed to
>> dynamic pages AFAIU)
>>
>> So why not create queue-per-user? (for users actively browsing).
>>
>> When user enters a page - you can subscribe the queue to a per-page
>> exchange. When user navigates away - you unsubscribe.
>
> Ok, I think I'm missing something.  Are you saying to create per-page
> exchanges rather than per-page queues, and then subscribe the
> exchanges to queues?  Is it cheaper to create exchanges than to create
> queues?

Yes, exchanges have no state, while queues actually store data.
Exchanges - light, Queues - heavy.

> Also, binding a queue to an exchange isn't something I was
> aware could be done; does it just use the normal queue.bind command,
> but putting the exchange name where the queue name normally goes, and
> vice versa?

I said:
>> When user enters a page - you can subscribe the queue to a per-page
>> exchange. When user navigates away - you unsubscribe.

So, I suggest to bind the per-user-queue to an per-page-exchange.
(or, bind per-user-queue to a all-pages-exchange but with a binding
key that will catch only messages flying to the particular page
on which the user is right now)

Marek


</entry>
<entry [Sat 2013:04:20 18:46:53 EST] DOJO WITH socket.io>

1. DOWNLOAD SOCKET.IO

cd /aguadev/html
https://github.com/LearnBoost/socket.io.git


    
</entry>
<entry [Fri 2013:04:19 16:20:14 EST] Net::RabbitFoot WORKING>

**** NOTE: CONNECTS BUT DOES NOT SEND TO THE SAME QUEUE WHEN RUN AS ROOT ****

# Perl code for RabbitMQ tutorials

Here you can find Perl code examples from [RabbitMQ
tutorials](http://www.rabbitmq.com/getstarted.html).

To successfully use the examples you will need a running RabbitMQ server.

## Requirements

To run this code you need to install Net::RabbitFoot.

    cpan -i Net::RabbitFoot


For tutorial six UUID::Tiny needs to be installed.

    cpan -i UUID::Tiny

On Ubuntu:
    
    sudo apt-get install make libclass-data-inheritable-perl libtest-deep-perl libmoosex-app-cmd-perl libcoro-perl libjson-xs-perl libxml-libxml-perl libconfig-any-perl libmoosex-attributehelpers-perl libmoosex-configfromfile-perl libtest-exception-perl libfile-sharedir-perl libreadonly-xs-perl libuuid-tiny-perl
    sudo cpan -i Net::RabbitFoot

## Code

[Tutorial one: "Hello World!"](http://www.rabbitmq.com/tutorial-one-python.html):

    perl send.pl
    perl receive.pl


[Tutorial two: Work Queues](http://www.rabbitmq.com/tutorial-two-python.html):

    perl new_task.pl "A very hard task which takes two seconds.."
    perl worker.plm


[Tutorial three: Publish/Subscribe](http://www.rabbitmq.com/tutorial-three-python.html):

    perl receive_logs.pl
    perl emit_log.pl "info: This is the log message"


[Tutorial four: Routing](http://www.rabbitmq.com/tutorial-four-python.html):

    perl receive_logs_direct.pl info
    perl emit_log_direct.pl info "The message"


[Tutorial five: Topics](http://www.rabbitmq.com/tutorial-five-python.html):

    perl receive_logs_topic.pl "*.rabbit"
    perl emit_log_topic.pl red.rabbit Hello


[Tutorial six: RPC](http://www.rabbitmq.com/tutorial-six-python.html):

    perl rpc_server.pl
    perl rpc_client.pl

    
TUTORIAL 1: Hello World
-----------------------

    perl send.pl
    perl receive.pl

./receive.pl 
    [*] Waiting for messages. To exit press CTRL-C
    [x] Received Hello World!

./send.pl


rabbitmqctl list_queues

    Listing queues ...
    hello	0
    amq.gen-wi6sL8D0waBqwa4mXVxwhJ	0
    ...done.

ERROR LOG:

    <!--
    =INFO REPORT==== 19-Apr-2013::16:37:15 ===
    accepting AMQP connection <0.1517.0> (127.0.0.1:36552 -> 127.0.0.1:5672)
    
    =INFO REPORT==== 19-Apr-2013::16:37:15 ===
    closing AMQP connection <0.1517.0> (127.0.0.1:36552 -> 127.0.0.1:5672)
    
    =INFO REPORT==== 19-Apr-2013::16:39:13 ===
    accepting AMQP connection <0.1540.0> (127.0.0.1:36553 -> 127.0.0.1:5672)
    
    =INFO REPORT==== 19-Apr-2013::16:39:13 ===
    closing AMQP connection <0.1540.0> (127.0.0.1:36553 -> 127.0.0.1:5672)
    -->    


TUTORIAL 2: WORK QUEUES
-----------------------

    perl new_task.pl "A very hard task which takes two seconds.."
    perl worker.pl

./worker.pl 
 
    [*] Waiting for messages. To exit press CTRL-C
    [x] Received A very hard task which takes two seconds..
    [x] Done
    [x] Received A second task
    [x] Done
    [x] Received DO IT
    [x] Done

perl new_task.pl "A very hard task which takes two seconds.."
 
    [x] Sent 'A very hard task which takes two seconds..'
./new_task.pl "A second task"
    [x] Sent 'A second task'
./new_task.pl "DO IT"
    [x] Sent 'DO IT'

 
TUTORIAL 3: PUBLISH / SUBSCRIBE
-------------------------------

    perl receive_logs.pl
    perl emit_log.pl "info: This is the log message"

RAN receive_logs.pl THEN emitlog.pl

./receive_logs.pl 
    [*] Waiting for logs. To exit press CTRL-C
    [x] info: Hello World!

 
./emitlog.pl 
    [x] Sent info: Hello World!


TUTORIAL 4: ROUTING
-------------------

    perl receive_logs_direct.pl info
    perl emit_log_direct.pl info "The message"


perl receive_logs_direct.pl info
 [*] Waiting for logs. To exit press CTRL-C
 [x] info: The message

perl emit_log_direct.pl info "The message"
 [x] Send info: The message

    
TUTORIAL 5: TOPICS
------------------

    perl receive_logs_topic.pl "*.rabbit"
    perl emit_log_topic.pl red.rabbit Hello

perl receive_logs_topic.pl "*.rabbit"
 [*] Waiting for logs. To exit press CTRL-C
 [x] red.rabbit:Hello

perl emit_log_topic.pl red.rabbit Hello
 [x] Sent red.rabbit:Hello
 
 
TUTORIAL 6: RPC
---------------


    perl rpc_server.pl
    perl rpc_client.pl
    
    
    

</entry>
<entry [Fri 2013:04:19 16:04:29 EST] TESTED pika FOR PYTHON AND RABBITMQ>

1. INSTALLED setutools AND THEN pika

DOWNLOAD SETUPTOOLS
https://pypi.python.org/pypi/setuptools#files
tar xvfz *
cd set*
python setup.py install

USE SETUPTOOLS TO INSTALL pika
easy_install pika


2. CREATE emit_log.py

/aguadev/private/bin/test/python/RabbitMQ/emit_log.py


3. RAN emit_log.py

./emit_log.py 

    [x] Sent 'info: Hello World!'
   No handlers could be found for logger "pika.connection"


ERROR LOG:
<!--
    =INFO REPORT==== 19-Apr-2013::16:10:48 ===
    accepting AMQP connection <0.1263.0> (127.0.0.1:36490 -> 127.0.0.1:5672)
    
    =WARNING REPORT==== 19-Apr-2013::16:10:48 ===
    closing AMQP connection <0.1263.0> (127.0.0.1:36490 -> 127.0.0.1:5672):
    connection_closed_abruptly

-->
    
</entry>
<entry [Fri 2013:04:19 11:50:42 EST] CHANGES TO Net::RabbitMQ::Channel>

new METHOD:

FROM:

sub new {
	my $class  = shift;
	my $number = shift;
	my $config = {@_};

TO:

sub new {
	my $class  = shift;
	my $number = shift;
	my $config = shift;


    
</entry>
<entry [Fri 2013:04:19 02:24:55 EST] Net::AMQP::Simple - RABBITMQ FOR PERLMONGERS ON SLIDESHARE>

http://www.slideshare.net/norbu09/rabbitmq-for-perlmongers
 
 
    
</entry>
<entry [Fri 2013:04:19 02:03:31 EST] TESTED Net::RabbitMQ>

1. INSTALL Net::RabbitMQ

cpanm install Net::RabbitMQ
    ... LONG TIME TESTING ... OK

    
2. TEST SCRIPT

em /aguadev/private/bin/test/perl/testNetRabbit.pl

    #!/usr/bin/perl -w
    
    use Net::RabbitMQ;
    
    my $mq = Net::RabbitMQ->new();
    $mq->connect("localhost", { user => "guest", password => "guest" });
    $mq->channel_open(1);
    $mq->publish(1, "queuename", "Hi there!");
    $mq->disconnect();


cd /aguadev/private/bin/test/perl
./testNetRabbit.pl

    OK

GIVES THIS RESULT IN LOGFILE:

<!--
=INFO REPORT==== 19-Apr-2013::03:21:43 ===
accepting AMQP connection <0.987.0> (127.0.0.1:58586 -> 127.0.0.1:5672)

=INFO REPORT==== 19-Apr-2013::03:21:43 ===
closing AMQP connection <0.987.0> (127.0.0.1:58586 -> 127.0.0.1:5672)

-->
</entry>
<entry [Thu 2013:04:18 15:41:13 EST] RABBITMQ AND NODE.JS>

https://github.com/beckje01/node-rabbitmq-examples

NodeJS RabbitMQ Example
Overview
An all node.js example of using RabbitMQ as a publish and subscribe.

Why
I found the documentation for consuming messages with node to be good, I found the producing side of things a bit tricky most examples used another backend to produce such as groovy or rails. So I wanted to have a simple node only example. I haven't done anything interesting on the consumer side but you could hook these items up with socketio or many other options.

Producer
A simple webserver that will push any items from the request url to a message queue set up for fanout.

Consumer
A consumer that will simply report to the console log when a message is received and the text of the message. You can add many consumers for the 1 producer.


PRODUCER
https://github.com/beckje01/node-rabbitmq-examples/blob/master/generator.js

var http = require('http'),
	url = require('url'),
	amqp = require('amqp');

var exchange;

function sendMsg(msg)
{
    console.log(msg)
    if(exchange)
    {      
        exchange.publish('key.a',msg)
    }
    else
    {
        console.log("exchange not around now...")
    }
}

var server = http.createServer(function(req, res){ 
	// your normal server code 
  	var path = url.parse(req.url).pathname;
  
	sendMsg(path);
	res.writeHead(200, {'Content-Type':'text/html'})
	res.write('OK', 'utf8');
	res.end();
});


var rabbitMQ = amqp.createConnection({ host: '127.0.0.1' });

rabbitMQ.addListener('ready', function(){
  
  // create the exchange if it doesnt exist
  exchange = rabbitMQ.exchange('rabbitExchange',{'type':'fanout'})

});

server.listen(8081);


CONSUMER
https://github.com/beckje01/node-rabbitmq-examples/blob/master/consumer.js

var http = require('http'),
  url = require('url'),
  amqp = require('amqp');


var rabbitMQ = amqp.createConnection({ host: '127.0.0.1' });

rabbitMQ.addListener('ready', function(){
  var queue = rabbitMQ.queue('',{'exclusive':true}, function(q){

      //get all messages for the rabbitExchange
      q.bind('rabbitExchange','#');
      console.log("inqueue")
      // Receive messages
      q.subscribe(function (message) {
        // Print messages to stdout
        console.log("received message");
        console.log(message.data.toString());
      });
    });

});

    
</entry>
<entry [Thu 2013:04:18 13:12:26 EST] PERL SOCKET MODULES>

POE::Component::MessageQueue
----------------------------
A POE message queue that uses STOMP for its communication protocol

**** Subscriber ****
use Net::Stomp;
 
my $stomp = Net::Stomp->new({
  hostname => 'localhost',
  port     => 61613
});
 
# Currently, PoCo::MQ doesn't do any authentication, so you can put
# whatever you want as the login and passcode.
$stomp->connect({ login => $USERNAME, passcode => $PASSWORD });
 
$stomp->subscribe({
  destination => '/queue/my_queue.sub_queue',
  ack         => 'client'
});
 
while (1)
{
  my $frame = $stomp->receive_frame;
  print $frame->body . "(), "(), "(), "\n";
  $stomp->ack({ frame => $frame });
}
 
$stomp->disconnect();


**** Producer ****
use Net::Stomp;
 
my $stomp = Net::Stomp->new({
  hostname => 'localhost',
  port     => 61613
});
 
# Currently, PoCo::MQ doesn't do any authentication, so you can put
# whatever you want as the login and passcode.
$stomp->connect({ login => $USERNAME, passcode => $PASSWORD });
 
$stomp->send({
  destination => '/queue/my_queue.sub_queue',
  body        => 'I am a message',
  persistent  => 'true',
});
 
$stomp->disconnect();


**** Server ****
If you want to use a different arrangement of storage engines or to embed PoCo::MQ inside another application, the following synopsis may be useful to you:
use POE;
use POE::Component::Logger;
use POE::Component::MessageQueue;
use POE::Component::MessageQueue::Storage::Default;
use Socket; # For AF_INET
use strict;
 
my $DATA_DIR = '/tmp/perl_mq';
 
# we create a logger, because a production message queue would
# really need one.
POE::Component::Logger->spawn(
  ConfigFile => 'log.conf',
  Alias      => 'mq_logger'
);
 
POE::Component::MessageQueue->new({
  port     => 61613,            # Optional.
  address  => '127.0.0.1',      # Optional.
  hostname => 'localhost',      # Optional.
  domain   => AF_INET,          # Optional.
   
  logger_alias => 'mq_logger',  # Optional.
 
  # Required!!
  storage => POE::Component::MessageQueue::Storage::Default->new({
    data_dir     => $DATA_DIR,
    timeout      => 2,
    throttle_max => 2
  })
});
 
POE::Kernel->run();
exit;



Net::STOMP
----------
A Streaming Text Orientated Messaging Protocol Client

This module allows you to write a Stomp client. Stomp is the Streaming Text Orientated Messaging Protocol (or the Protocol Briefly Known as TTMP and Represented by the symbol :ttmp). It's a simple and easy to implement protocol for working with Message Orientated Middleware from any language. Net::Stomp is useful for talking to Apache ActiveMQ, an open source (Apache 2.0 licensed) Java Message Service 1.1 (JMS) message broker packed with many enterprise features.


#### send a message to the queue 'foo'
use Net::Stomp;
my $stomp = Net::Stomp->new( { hostname => 'localhost', port => '61613' } );
$stomp->connect( { login => 'hello', passcode => 'there' } );
$stomp->send(
    { destination => '/queue/foo', body => 'test message' } );
$stomp->disconnect;


#### subscribe to messages from the queue 'foo'
use Net::Stomp;
my $stomp = Net::Stomp->new( { hostname => 'localhost', port => '61613' } );
$stomp->connect( { login => 'hello', passcode => 'there' } );
$stomp->subscribe(
    {   destination             => '/queue/foo',
        'ack'                   => 'client',
        'activemq.prefetchSize' => 1
    }
);
while (1) {
  my $frame = $stomp->receive_frame;
  warn $frame->body; # do something here
  $stomp->ack( { frame => $frame } );
}
$stomp->disconnect;


#### write your own frame
my $frame = Net::Stomp::Frame->new(
     { command => $command, headers => $conf, body => $body } );
$self->send_frame($frame);

# connect with failover supporting similar URI to ActiveMQ
$stomp = Net::Stomp->new({ failover => "failover://tcp://primary:61616" })
# "?randomize=..." and other parameters are ignored currently
$stomp = Net::Stomp->new({ failover => "failover:(tcp://primary:61616,tcp://secondary:61616)?randomize=false" })

# Or in a more natural perl way
$stomp = Net::Stomp->new({ hosts => [
  { hostname => 'primary', port => 61616 },
  { hostname => 'secondary', port => 61616 },
] });



IO::Socket::Multicast
---------------------
Send and receive multicast messages
http://search.cpan.org/~lds/IO-Socket-Multicast-1.05/Multicast.pm


use IO::Socket::Multicast;

# create a new UDP socket ready to read datagrams on port 1100
my $s = IO::Socket::Multicast->new(LocalPort=>1100);

# Add a multicast group
$s->mcast_add('225.0.1.1');

# Add a multicast group to eth0 device
$s->mcast_add('225.0.0.2','eth0');

# now receive some multicast data
$s->recv($data,1024);

# Drop a multicast group
$s->mcast_drop('225.0.0.1');

# Set outgoing interface to eth0
$s->mcast_if('eth0');

# Set time to live on outgoing multicast packets
$s->mcast_ttl(10);

# Turn off loopbacking
$s->mcast_loopback(0);

# Multicast a message to group 225.0.0.1
$s->mcast_send('hello world!','225.0.0.1:1200');
$s->mcast_set('225.0.0.2:1200');
$s->mcast_send('hello again!');
  
    
</entry>
<entry [Thu 2013:04:18 11:05:13 EST] PERL RABBITMQ MODULES>


NB: METACPAN!!
https://metacpan.org/search?q=RabbitMQ


Net::RabbitMQ
-------------
http://search.cpan.org/~jesus/Net--RabbitMQ-0.2.6/RabbitMQ.pm
Net::RabbitMQ - interact with RabbitMQ over AMQP using librabbitmq
Net::RabbitMQ provides a simple wrapper around the librabbitmq library that allows connecting, declaring exchanges and queues, binding and unbinding queues, publishing, consuming and receiving events.

Error handling in this module is primarily achieve by Perl_croak (die). You should be making good use of eval around these methods to ensure that you appropriately catch the errors.

use Net::RabbitMQ;
my $mq = Net::RabbitMQ->new();
$mq->connect("localhost", { user => "guest", password => "guest" });
$mq->channel_open(1);
$mq->publish(1, "queuename", "Hi there!");
$mq->disconnect();

INSTALLED TO:

    /usr/local/man/man3/Net::RabbitMQ::Channel.3pm
    /usr/local/share/perl/5.14.2/Net/RabbitMQ/Channel.pm
    /usr/local/share/perl/5.14.2/Net/RabbitMQ/Connection.pm
    /usr/local/share/perl/5.14.2/Net/RabbitMQ/Exchange.pm
    /usr/local/share/perl/5.14.2/Net/RabbitMQ/Queue.pm

   
Test::Net::RabbitMQ
--------------------
A mock RabbitMQ implementation for use when testing.
est::Net::RabbitMQ is a terrible approximation of using the real thing, but hopefully will allow you to test systems that use Net::RabbitMQ without having to use an actual RabbitMQ instance.

The general overview is that calls to publish pushes a message into one or more queues (or none if there are no bindings) and calls to recv pop them.

use Test::Net::RabbitMQ;

my $mq = Test::Net::RabbitMQ->new;
$mq->connect;
$mq->channel_open(1);
$mq->exchange_declare(1, 'order');
$mq->queue_declare(1, 'new-orders');
$mq->queue_bind(1, 'new-orders', 'order', 'order.new');
$mq->publish(1, 'order.new', 'hello!', { exchange => 'order' });
$mq->consume(1, 'new-orders');
my $msg = $mq->recv;
# Or
my $msg = $mq->get(1, 'order.new', {});


Net::RabbitMQ::Channel
----------------------
Use rabbitmq, OOP style

Net::Rabbit::Channel DEPENDENCIES:
Class::Easy
Sys::SigAction


use Net::RabbitMQ::Channel;

my $channel = Net::RabbitMQ::Channel->new (1, {
        hosts => {
                rabbit1 => {user => 'guest', pass => 'guest'},
                rabbit2 => {user => 'guest', pass => 'guest'}
        }
});

my $exchange = $channel->exchange_declare (
        'test.x', 
        exchange_type => "topic",
);

my $publisher_key = 'test.*';

# consumer part
my $queue = $channel->queue_declare (
        'test.q',
        exclusive => 0,
);

$queue->bind ($exchange, $publisher_key);

# publisher part
$exchange->publish ($publisher_key, $message,
        app_id => 'test',
        timestamp => time
);

# consumer part
my $message = $queue->get;


AnyEvent::RabbitMQ
------------------
AnyEvent::RabbitMQ is known to work with RabbitMQ versions 2.5.1 and versions 0-8 and 0-9-1 of the AMQP specification.
This client is the non-blocking version, for a blocking version with a similar API, see Net::RabbitFoot.

use AnyEvent::RabbitMQ;

my $cv = AnyEvent->condvar;

my $ar = AnyEvent::RabbitMQ->new->load_xml_spec()->connect(
    host       => 'localhost',
    port       => 5672,
    user       => 'guest',
    pass       => 'guest',
    vhost      => '/',
    timeout    => 1,
    tls        => 0, # Or 1 if you'd like SSL
    tune       => { heartbeat => 30, channel_max => $whatever, frame_max = $whatever },
    on_success => sub {
        $ar->open_channel(
            on_success => sub {
                my $channel = shift;
                $channel->declare_exchange(
                    exchange   => 'test_exchange',
                    on_success => sub {
                        $cv->send('Declared exchange');
                    },
                    on_failure => $cv,
                );
            },
            on_failure => $cv,
            on_close   => sub {
                my $method_frame = shift->method_frame;
                die $method_frame->reply_code, $method_frame->reply_text;
            }
        );
    },
    on_failure => $cv,
    on_read_failure => sub {die @_},
    on_return  => sub {
        my $frame = shift;
        die "Unable to deliver ", Dumper($frame);
    }
    on_close   => sub {
        my $method_frame = shift->method_frame;
        die $method_frame->reply_code, $method_frame->reply_text;
    },
);

print $cv->recv, "(), "(), "(), "\n";



Net::RabbitFoot
---------------
An Asynchronous and multi channel Perl AMQP client.
Net::RabbitFoot is known to work with RabbitMQ versions 2.3.1 and version 0-8 of the AMQP specification.

use Net::RabbitFoot;

 my $rf = Net::RabbitFoot->new()->load_xml_spec()->connect(
     host    => 'localhost',
     port    => 5672,
     user    => 'guest',
     pass    => 'guest',
     vhost   => '/',
     timeout => 1,
 );

 my $ch = $rf->open_channel();
 $ch->declare_exchange(exchange => 'test_exchange');


App::TailRabbit
---------------
Listen to a RabbitMQ exchange and emit the messages to console.


tail_reabbit --exchange_name firehose --routing_key # --rabbitmq_user guest --rabbitmq_user guest --rabbitmq_host localhost



App::RabbitTail
---------------
Log tailer which broadcasts log lines into RabbitMQ exchanges.

See the

rabbit_tail

script shipped with the distribution for simple CLI useage.

use App::RabbitTail;
use AnyEvent; # Not strictly needed, but you probably want to
              # use it yourself if you're doing this manually.

my $tailer = App::RabbitTail->new(
    # At least 1 filename must be supplied
    filename => [qw/ file1 file2 /],
    # Optional args, defaults below
    routing_key => [qw/ # /],
    host => 'localhost',
    port => 5672,
    user => 'guest',
    pass => 'guest',
    vhost => '/',
    exchange_type => 'direct',
    exchange_name => 'logs',
    exchange_durable => 0,
    max_sleep => 10,
);
# You can setup other AnyEvent io watchers etc here.
$tailer->run; # enters the event loop
# Or:
$tailer->tail;


Net::STOMP::Client
------------------
STOMP object oriented client module


#
# simple producer
#

use Net::STOMP::Client;

$stomp = Net::STOMP::Client->new(host => "127.0.0.1", port => 61613);
$stomp->connect(login => "guest", passcode => "guest");
$stomp->send(destination => "/queue/test", body => "hello world!");
$stomp->disconnect();

#
# consumer with client side acknowledgment
#

use Net::STOMP::Client;

$stomp = Net::STOMP::Client->new(host => "127.0.0.1", port => 61613);
$stomp->connect(login => "guest", passcode => "guest");
# declare a callback to be called for each received message frame
$stomp->message_callback(sub {
    my($self, $frame) = @_;
    $self->ack(frame => $frame);
    printf("received: %s(), "(), "(), "\n", $frame->body());
    return($self);
});
# subscribe to the given queue
$stomp->subscribe(
    destination => "/queue/test",
    id          => "testsub",          # required in STOMP 1.1
    ack         => "client",           # client side acknowledgment
);
# wait for a specified message frame
$stomp->wait_for_frames(callback => sub {
    my($self, $frame) = @_;
    if ($frame->command() eq "MESSAGE") {
        # stop waiting for new frames if body is "quit"
        return(1) if $frame->body() eq "quit";
    }
    # continue to wait for more frames
    return(0);
});
$stomp->unsubscribe(id => "testsub");
$stomp->disconnect();


</entry>
<entry [Wed 2013:04:17 23:39:17 EST] RABBITMQ VS DATABASES>

why messaging

    get jobs done in order
    server push
    cloud network latency

    
why use a queue?

Background processing – tasks that don’t need to be immediately whilst the user waits, or even tasks that the user will wait for but have to be run by separate processes. The key here is the tasks get run asynchronously so the user is either doing something else or is waiting with a status page.
Examples of these kind of jobs could be sending notifications such as via e-mail, where a short delay isn’t critical or where there are many items to send e.g. bulk e-mailing.
Internal communication – streaming events throughout your infrastructure to different nodes or components.



DATABASES
most people would just create a simple "queue" table 
and: SELECT * FROM queue WHERE done = 0 ORDER BY created LIMIT 1
“concurrency issues on that thing now - inserting into the queue occasionally takes 
longer than doing the task that needs to be executed synchronously”
“middle management did not want to have "new third party sof

PUBSUB
A means of authenticated communication (network transport) 
- eg HTTP, OAuth
An addressable place to publish to 
- Usually a topic, feed, endpoint or address.
A way to name, enrol, share, and discover these addressable places
- For example “blaine@twitter.com” or - TBD!
A way to deliver and ack delivery (or “take responsibility”) 
The above is in fact a distributed object system




Data                Objects serialised as   Messages organised 
                    rows in tables          into streams

Interest            Filter by query         Durable “follow”

Notiﬁcation         Pull                    Push
                    (polling sucks!)

Buffering           Put = add row to table  PUT and GET are 
(non-idempotent)    Get = delete top row    symmetric


Scale               Overheads tend to       Data ﬂows out to 
                    grow indeﬁnitely        destinations


Database Pubsub/MQYou might need messaging if ... you need to monit


</entry>
<entry [Wed 2013:04:17 23:14:50 EST] INSTALL RABBITMQ>
    
github: http://github.com/norbu09

relevant repositories are:

net-amqp
Net_RabbitMQ_HTTP
RabbitIntro


1. UPDATE sources.list

/etc/apt/sources.list

ADD:

deb http://www.rabbitmq.com/debian/ testing main

(Please note that the word testing in this line refers to the state of our release of RabbitMQ, not any particular Debian distribution. You can use it with Debian stable, testing or unstable, as well as with Ubuntu. We describe the release as "testing" to emphasise that we release somewhat frequently.)


2. ADD PUBLIC KEY (To avoid warnings about unsigned packages)

cd /home/syoung/software/rabbitmq
wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo apt-key add rabbitmq-signing-key-public.asc


3. UPDATE APT-GET

apt-get update


4. INSTALL RABBITMQ

sudo apt-get install rabbitmq-server


5. SET MAX OPEN FILE HANDLES TO 1024 IN CONFIG FILE

/etc/default/rabbitmq-server

Invoke ulimit when the service is started to set the maximum number of file open handles for the service process to 1024 (the default):

ulimit -n 1024


6. START THE RABBITMQ SERVER

rabbitmqctl stop        # stop the server
rabbitmqctl status      # check whether it is running

rabbitmqctl start_app -n rabbit@syoung-dev

    Starting node 'rabbit@syoung-dev' ...
    ...done.

WHICH STARTED THESE PROCESSES:

    root@syoung-dev:/usr/local/bioinf# ps aux | grep rabbit
    rabbitmq 17828  0.0  0.0   7416   320 ?        S    01:31   0:00 /usr/lib/erlang/erts-5.9.1/bin/epmd -daemon
    rabbitmq 17851  0.0  0.0   4396   616 ?        S    01:31   0:00 /bin/sh /usr/sbin/rabbitmq-server
    rabbitmq 17858  0.6  0.5 1081276 29296 ?       Sl   01:31   0:00 /usr/lib/erlang/erts-5.9.1/bin/beam.smp -W w -K true -A30 -P 1048576 -- -root /usr/lib/erlang -progname erl -- -home /var/lib/rabbitmq -- -noshell -noinput -sname rabbit@syoung-dev -boot /var/lib/rabbitmq/mnesia/rabbit@syoung-dev-plugins-expand/rabbit -kernel inet_default_connect_options [{nodelay,true}] -sasl errlog_type error -sasl sasl_error_logger false -rabbit error_logger {file,"/var/log/rabbitmq/rabbit@syoung-dev.log"} -rabbit sasl_error_logger {file,"/var/log/rabbitmq/rabbit@syoung-dev-sasl.log"} -os_mon start_cpu_sup false -os_mon start_disksup false -os_mon start_memsup false -mnesia dir "/var/lib/rabbitmq/mnesia/rabbit@syoung-dev"
    rabbitmq 17974  0.0  0.0   7380   424 ?        Ss   01:31   0:00 inet_gethost 4
    rabbitmq 17975  0.0  0.0   9480   628 ?        S    01:31   0:00 inet_gethost 4
    root     18131  0.0  0.0  13580   936 pts/1    S+   01:33   0:00 grep --color=auto rabbit

    
... AND CREATED THIS FOLDER IN /var/lib/rabbitmq:

/var/lib/rabbitmq/mnesia/rabbit(), "(), "(), "\@syoung-dev

    -rw-r--r-- 1 rabbitmq rabbitmq  154 Apr 19 01:34 DECISION_TAB.LOG
    -rw-r--r-- 1 rabbitmq rabbitmq   93 Apr 19 01:34 LATEST.LOG
    drwxr-xr-x 2 rabbitmq rabbitmq 4.0K Apr 19 01:31 msg_store_persistent
    drwxr-xr-x 2 rabbitmq rabbitmq 4.0K Apr 19 01:31 msg_store_transient
    -rw-r--r-- 1 rabbitmq rabbitmq    8 Apr 19 01:31 rabbit_durable_exchange.DCD
    -rw-r--r-- 1 rabbitmq rabbitmq 1.7K Apr 19 01:34 rabbit_durable_exchange.DCL
    -rw-r--r-- 1 rabbitmq rabbitmq    8 Apr 19 01:31 rabbit_durable_queue.DCD
    -rw-r--r-- 1 rabbitmq rabbitmq    8 Apr 19 01:31 rabbit_durable_route.DCD
    -rw-r--r-- 1 rabbitmq rabbitmq    3 Apr 19 01:31 rabbit_serial
    -rw-r--r-- 1 rabbitmq rabbitmq    8 Apr 19 01:31 rabbit_user.DCD
    -rw-r--r-- 1 rabbitmq rabbitmq  310 Apr 19 01:34 rabbit_user.DCL
    -rw-r--r-- 1 rabbitmq rabbitmq    8 Apr 19 01:31 rabbit_user_permission.DCD
    -rw-r--r-- 1 rabbitmq rabbitmq  255 Apr 19 01:34 rabbit_user_permission.DCL
    -rw-r--r-- 1 rabbitmq rabbitmq    8 Apr 19 01:31 rabbit_vhost.DCD
    -rw-r--r-- 1 rabbitmq rabbitmq  161 Apr 19 01:34 rabbit_vhost.DCL
    -rw-r--r-- 1 rabbitmq rabbitmq  21K Apr 19 01:31 schema.DAT
    -rw-r--r-- 1 rabbitmq rabbitmq  214 Apr 19 01:31 schema_version


LOG FILE CONTENTS:

em /var/log/rabbitmq/rabbit@syoung-dev.log

    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    Limiting to approx 924 file handles (829 sockets)
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
        application: mnesia
        exited: stopped
        type: permanent
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    Memory limit set to 1933MB of 4834MB total.
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    Disk free limit set to 953MB
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    Adding vhost '/'
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    Creating user 'guest'
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    Setting user tags for user 'guest' to [administrator]
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    Setting permissions for 'guest' in '/' to '.*', '.*', '.*'
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    msg_store_transient: using rabbit_msg_store_ets_index to provide index
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    msg_store_persistent: using rabbit_msg_store_ets_index to provide index
    
    =WARNING REPORT==== 19-Apr-2013::01:31:09 ===
    msg_store_persistent: rebuilding indices from scratch
    
    =INFO REPORT==== 19-Apr-2013::01:31:09 ===
    started TCP Listener on [::]:5672



NOTES
-----

LOGGING

Output from the server is sent to a RABBITMQ_NODENAME.log file in the RABBITMQ_LOG_BASE directory. Additional log data is written to RABBITMQ_NODENAME-sasl.log.

The broker always appends to the log files, so a complete log history is retained.

You can use the logrotate program to do all necessary rotation and compression, and you can change it. By default, this script runs weekly on files located in default /var/log/rabbitmq directory. See /etc/logrotate.d/rabbitmq-server to configure logrotate.


</entry>