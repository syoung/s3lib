rabbitmq.quickref


MASTER
ssh ubuntu@54.144.21.248

WORKER 4
ssh ubuntu@54.158.14.204
0b6d0f39-51d1-4af8-8f86-aa2140763529

WORKER 5
ssh ubuntu@107.22.53.207
7465b6d2-2fc0-4269-ab8a-149f9d91a

WORKER 6
ssh ubuntu@54.146.1.157
3d1e7edc-7930-4bfb-806d-f45c531ca07e

WORKER 7
54.80.43.177

/a/bin/cli/flow runStage --project QC --workflow DownloadQC --username admin --log 4 --samplestring "sample:10929123-d244-48fb-bf11-c3a36cb4574d" --stagenumber 1



WORKER 8
54.166.245.64


WORKER 9
107.22.59.108


WORKER 10
54.224.97.22





REFRESH ONE JOB IN QUEUE

rabbitmqadmin delete queue --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=54.144.21.248 name=tasks
mql "update queuesample set status='none'"
mql "update queuesample set status='completed' where sample='04254250-486c-422a-98d9-d443de99ca46'"
mql "update queuesample set status='completed' where sample='0b6d0f39-51d1-4af8-8f86-aa2140763529'"
mql "update queuesample set status='completed' where sample='7465b6d2-2fc0-4269-ab8a-149f9d91a743'"
mql "update queuesample set status='completed' where sample='3d1e7edc-7930-4bfb-806d-f45c531ca07e'"
/a/bin/daemon/master --log 4
mql "select * from queuesample"





DELETE ALL QUEUES

rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app
rabbitmqctl add_user rabbituser runrabit%2
rabbitmqctl set_user_tags rabbituser administrator
rabbitmqctl add_vhost rabbitvhost
rabbitmqctl set_permissions -p rabbitvhost rabbituser ".*" ".*" ".*"
sudo rabbitmqctl set_permissions rabbituser ".*" ".*" ".*"


DELETE ONE QUEUE

rabbitmqadmin delete queue --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=54.144.21.248 name=tasks


VIEW TASK MESSAGES

rabbitmqadmin get --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=54.144.21.248 queue=tasks requeue=true count=10

rabbitmqadmin get --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=54.144.21.248 queue=update.host.status requeue=true count=10

LIST QUEUES

rabbitmqadmin list queues --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=54.144.21.248

SIMPLE LIST QUEUES

rctl list_queues -p rabbitvhost


SET USER

rabbitmqctl add_user rabbituser runrabit%2
rabbitmqctl set_user_tags rabbituser administrator
rabbitmqctl add_vhost rabbitvhost
rabbitmqctl set_permissions -p rabbitvhost rabbituser ".*" ".*" ".*"
sudo rabbitmqctl set_permissions rabbituser ".*" ".*" ".*"


PUBLISH

rabbitmqadmin publish --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=54.144.21.248 routing_key=chat payload='{"queue":"username.Project.Workflow"}'

GET

rabbitmqadmin get --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=54.144.21.248 queue=chat requeue=true count=10



<entry [Mon 2015:08:31 04:00:28 EST] FIX rabbitmqadmin ERROR: '[Errno 111] Connection refused'>

PROBLEM

rabbitmqadmin get --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=localhost queue=chat requeue=true count=10
    
    *** Could not connect: [Errno 111] Connection refused

DIAGNOSIS

COPIED OVER rabbitmqadmin EXECUTABLE BUT FORGOT TO ENABLE THE PLUGIN


SOLUTION

1. ENABLE THE PLUGIN

rabbitmq-plugins enable rabbitmq_management

2. RESTART RABBIT

service rabbitmq-server restart

3. TEST


</entry>
<entry [Mon 2015:08:31 02:14:36 EST] SEND/GET/RECEIVE TOOLS>

SEND

./sendTask --message '{"queue":"testqueue"}'

rabbitmqadmin publish --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2  routing_key=chat payload='{"queue":"username.Project.Workflow"}'
    Message published

GET MESSAGES

rabbitmqadmin get --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2  queue=chat requeue=true count=10
+-------------+----------+---------------+---------------------------------------+---------------+------------------+------------+-------------+
| routing_key | exchange | message_count |                payload                | payload_bytes | payload_encoding | properties | redelivered |
+-------------+----------+---------------+---------------------------------------+---------------+------------------+------------+-------------+
| chat        |          | 1             | {"queue":"testqueue"}                 | 21            | string           |            | True        |
| chat        |          | 0             | {"queue":"username.Project.Workflow"} | 37            | string           |            | False       |
+-------------+----------+---------------+---------------------------------------+---------------+------------------+------------+-------------+

RECEIVE

/a/bin/daemon/agua --log 1

[x] Received from queue chat: {"queue":"testqueue"}
[x] Received from queue chat: {"queue":"username.Project.Workflow"}

    
</entry>
<entry [Sun 2015:08:30 23:06:24 EST] RABBIT API ON localhost>

http://localhost:15672/api/

NB: As the default virtual host is called "/", this will need to be encoded as "%2f".


</entry>
<entry [Sun 2015:08:30 22:21:44 EST] rabbitmq-dump-queue DUMPS QUEUES TO FILE>

*** ONLY WORKS ON DEFAULT '/' VHOST AS CAN'T USE -url OPTION

./rabbitmq-dump-queue -url="amqp://guest:guest@localhost:5672/" -queue=gravity.checks -max-messages=50 -output-dir=/tmp

... GIVES ERROR:
    flag provided but not defined: -url
        

1. INSTALL

BINARY

https://github.com/dubek/rabbitmq-dump-queue/releases/download/v0.1/rabbitmq-dump-queue-v0.1-linux-386.tgz

SOURCE

INSTALL GO https://golang.org/doc/install

wget https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz
tar xvfz go1.5.linux-amd64.tar.gz
cd go
sudo cp bin/* /usr/bin
sudo mkdir /usr/local/go


INSTALL rabbitmq-dump-queue

go get github.com/dubek/rabbitmq-dump-queue



2. COPY TO /usr/bin

/usr/bin/rabbitmq-dump-queue

2. RUN

./rabbitmq-dump-queue -queue="gravity.checks"

    -rw-r--r-- 1 syoung syoung      34 Aug 30 22:31 msg-0000
    -rw-r--r-- 1 syoung syoung      34 Aug 30 22:31 msg-0001
    -rw-r--r-- 1 syoung syoung      33 Aug 30 22:31 msg-0002
    -rw-r--r-- 1 syoung syoung      33 Aug 30 22:31 msg-0003



./rabbitmq-dump-queue -url="amqp://guest:guest@localhost:5672/" -queue=gravity.checks -max-messages=50 -output-dir=/tmp

flag provided but not defined: -url
Usage of ./rabbitmq-dump-queue:
  -max-messages=1000: Maximum number of messages to dump
  -output-dir=".": Directory in which to save the dumped messages
  -queue="": Ephemeral AMQP queue name
  -uri="amqp://guest:guest@localhost:5672/": AMQP URI
  -verbose=false: Print progress


EXAMPLE

rabbitmq-dump-queue -url="amqp://user:password@rabbitmq.example.com:5672/" -queue=incoming_1 -max-messages=50 -output-dir=/tmp

    
</entry>
<entry [Sun 2015:08:30 19:59:02 EST] rabbitmqadmin COMMANDS>

https://www.rabbitmq.com/management-cli.html

GET MESSAGE CONTENT WITH get
#  get queue=... [count=... requeue=... payload_file=... encoding=...]
 * If payload is not specified on publish, standard input is used
  * If payload_file is not specified on get, the payload will be shown on standard output along with the message metadata
  * If payload_file is specified on get, count must not be set

# GET LAST MESSAGE
rabbitmqadmin get queue=gravity.checks requeue=true

# MULTIPLE MESSAGES
rabbitmqadmin get queue=gravity.checks requeue=true count=10

# PRINT SINGLE MESSAGE TO FILE
rabbitmqadmin get queue=gravity.checks payload_file=/tmp/messages


SEND A MESSAGE WITH publish
# publish routing_key=... [payload=... payload_encoding=... exchange=...]

SEND TO EXCHANGE gravity.checks
rabbitmqadmin publish routing_key=gravity.checks payload="rabbitmqadmin sent a message 10"

CHECK WITH get:

rabbitmqadmin get queue=gravity.checks requeue=true
+----------------+----------+---------------+---------------------------------+---------------+------------------+------------+-------------+
|  routing_key   | exchange | message_count |             payload             | payload_bytes | payload_encoding | properties | redelivered |
+----------------+----------+---------------+---------------------------------+---------------+------------------+------------+-------------+
| gravity.checks |          | 1             | rabbitmqadmin sent a message 10 | 31            | string           |            | True        |
+----------------+----------+---------------+---------------------------------+---------------+------------------+------------+-------------+

RECEIVED BY worker:
./worker 
    Worker 2917: Received from queue gravity.checks: rabbitmqadmin sent a message 10
    Worker 2917: Work done in 10 seconds


USE USERNAME AND PASSWORD
rabbitmqadmin get --vhost=rabbitvhost queue=chat requeue=true count=10 -u rabbituser -p runrabit%2


DELETE EXCHANGE
radm  --vhost=rabbitvhost --username=rabbituser --password=runrabit%2 delete exchange name=gravity.xchecks
    exchange deleted



CONNECT TO REMOTE HOST

rabbitmqadmin -H localhost -u rabbituser -p runrabit%2 list vhosts

54.144.21.248


Connect to another host as another user

rabbitmqadmin -H myserver -u simon -p simon list vhosts
+------+
| name |
+------+
| /    |
+------+

Declare an exchange
rabbitmqadmin declare exchange name=my-new-exchange type=fanout
    exchange declared

Declare a queue, with optional parameters
rabbitmqadmin declare queue name=my-new-queue durable=false
queue declared


Export configuration

rabbitmqadmin export rabbit.config
Exported configuration for localhost to "rabbit.config"

Import configuration, quietly
rabbitmqadmin -q import rabbit.config

Close all connections
rabbitmqadmin -f tsv -q list connections name | while read conn ; do rabbitmqadmin -q close connection name=${conn} ; done


USAGE

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

    
</entry>
<entry [Sun 2015:08:30 19:21:04 EST] AUTOMATE BUILDOUT WITH BROKER CONFIG FILES>

http://blog.trestle-consulting.com/2013/03/rabbitmq-part-1-basic-configuration.html

Importing Broker Definition Files
The last topic relating to configuration covered in this posting is importing broker definition files.  A broker definition is a JSON file that contains definitions for broker objects:  users, permissions, queues, exchanges, bindings and more.  Here is an example:

{
 "queues":[
  { 
   "name":"queue.example",
   "vhost":"/",
   "durable":true,
   "auto_delete":false,
   "arguments":{}
  }],
 "exchanges":[
  {
   "name":"exchange.example",
   "vhost":"/",
   "type":"topic",
   "durable":true,
   "auto_delete":false,
   "internal":false,
   "arguments":{}
  }],
 "bindings":[
  {
   "source":"exchange.example",
   "vhost":"/",
   "destination":"queue.example",
   "destination_type":"queue",
   "routing_key":"*",
   "arguments":{}
  }]
}


To import broker definition files, use the rabbitmqadmin command line tool.  The command below will import a broker definition file with name broker-def.json located in the home directory. 

./rabbitmqadmin import ~/broker-def.json -u example -p example

With this ability to reset a broker and import broker definition files, you can easily implement a nuke-and-pave strategy for building and rebuilding brokers.

Note:  Importing declarations for queues and exchanges which are already defined do not alter the existing definition.

Note: Binding definitions that exactly match a pre-existing binding are ignored.  Those that do not are bound to the exchange.

Note: Importing declarations will never cause an AMQP entity (queue, exchange or binding) to be deleted.
    
</entry>
<entry [Sun 2015:08:30 09:36:21 EST] SET rabbitmqadmin.conf FILE>

http://stackoverflow.com/questions/6742938/deleting-queues-in-rabbitmq


	
There is rabbitmqadmin which is nice to work from console.

If you ssh/log into server where you have rabbit installed, you can download it from:

http://{server}:15672/cli/rabbitmqadmin
and save it into /usr/local/bin/rabbitmqadmin

Then you can run

rabbitmqadmin -u {user} -p {password} -V {vhost} delete queue name={name}
Usually it requires sudo.

If you want to avoid typing your user name and password, you can use config

rabbitmqadmin -c /var/lib/rabbitmq/.rabbitmqadmin.conf -V {vhost} delete queue name={name}
All that under assumption that you have file ** /var/lib/rabbitmq/.rabbitmqadmin.conf** and have bare minumum

hostname = localhost
port = 15672
username = {user}
password = {password}
shareimprove this answer



1. CREATE FILE

emacs ~/.rabbitmqadmin.conf

[host_normal]
hostname = localhost
port = 5672
username = administrator
password = runrabit%2

[host_ssl]
hostname = 54.144.21.248
port = 5672
username = administrator
password = runrabit%2
ssl = True
ssl_key_file = /home/syoung/.ssh/inova/bioinfo1/id_rsa
ssl_cert_file = /home/syoung/.ssh/inova/bioinfo1/id_rsa.pub


2. RUN COMMAND

rabbitmqadmin -c ~/.rabbitmqadmin.conf -N host_ssl -V rabbitvhost list queues vhost name node messages message_stats.publish_details.rate

*** Could not connect: [Errno 336445449] _ssl.c:369: error:140DC009:SSL routines:SSL_CTX_use_certificate_chain_file:PEM lib

rabbitmqadmin -c ~/.rabbitmqadmin.conf -N host_normal -V rabbitvhost list queues vhost name node messages message_stats.publish_details.rate

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
  File "/usr/lib/python2.7/httplib.py", line 1051, in getresponse
    response.begin()
  File "/usr/lib/python2.7/httplib.py", line 415, in begin
    version, status, reason = self._read_status()
  File "/usr/lib/python2.7/httplib.py", line 371, in _read_status
    line = self.fp.readline(_MAXLINE + 1)
  File "/usr/lib/python2.7/socket.py", line 476, in readline
    data = self._sock.recv(self._rbufsize)
socket.error: [Errno 104] Connection reset by peer




</entry>
<entry [Sun 2015:08:30 08:47:11 EST] INSTALL rabbitmqadmin>

NB: REQUIRES Python 2.x, 2.6 or later (i.e. not Python 3)

SEE [Mon 2014:11:10 17:00:33 EST] SUCCESSFULLY INSTALLED rabbitmqadmin


1. INSTALL PLUGIN rabbitmq_management

rabbitmq-plugins enable rabbitmq_management


2. RESTART RABBITMQ

service rabbitmq-server restart



3. BROWSE TO DOWNLOAD rabbitmqadmin

IN CHROME:

http://localhost:15672/cli/

Download it from here (Right click, Save as), make executable, and drop it in your path. Note that many browsers will rename the file rabbitmqadmin.txt. You will need Python 2.x, 2.6 or later (i.e. not Python 3).

See the rabbitmqadmin page on the website for more information on its use, or invoke rabbitmqadmin --help for usage instructions. Windows users will need to ensure Python is on their path, and invoke rabbitmqadmin as python.exe rabbitmqadmin.

SAVED TO

/home/syoung/notes/agua/private/bin/test/rabbitmq/rabbitmqadmin.txt


4. COPY TO /usr/bin

cp /home/syoung/notes/agua/private/bin/test/rabbitmq/rabbitmqadmin.txt /usr/bin/rabbitmqadmin

chmod 755 /usr/bin/rabbitmqadmin

CREATE ALIAS IN .profile

alias radmin='rabbitmqadmin'


5. RUN

rabbitmqadmin --help

    OK
    
    
6. ENABLE BASH AUTOCOMPLETION

PRINT SCRIPT TO /etc/bash_completion.d

sudo sh -c 'rabbitmqadmin --bash-completion > /etc/bash_completion.d/rabbitmqadmin'

ADD LINE IN .profile

. /etc/bash-completion


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
                        maximum depth to recurse for listing tables [default:
                        1]
--bash-completion       Print bash completion script [default: False]
--version               Display version and exit

More Help
=========

For more help use the help subcommand:

  rabbitmqadmin help subcommands  # For a list of available subcommands
  rabbitmqadmin help config       # For help with the configuration file

</entry>
<entry [Tue 2015:08:11 05:31:49 EST] GET RABBITMQ VERSION>

SIMPLE COMMAND:

rabbitmqctl status | grep rabbit
Status of node rabbit@comp3 ...
 {running_applications,[{rabbit,"RabbitMQ","3.2.4"},

OR MORE VERBOSE:

service rabbitmq-server status
Status of node rabbit@comp3 ...
[{pid,13143},
 {running_applications,[{rabbit,"RabbitMQ","3.2.4"},
                        {os_mon,"CPO  CXC 138 46","2.2.14"},
                        {mnesia,"MNESIA  CXC 138 12","4.11"},
                        {xmerl,"XML parser","1.3.5"},
                        {sasl,"SASL  CXC 138 11","2.3.4"},
                        {stdlib,"ERTS  CXC 138 10","1.19.4"},
                        {kernel,"ERTS  CXC 138 10","2.16.4"}]},
 {os,{unix,linux}},
 {erlang_version,"Erlang R16B03 (erts-5.10.4) [source] [64-bit] [smp:8:8] [async-threads:30] [kernel-poll:true]\n"},
 {memory,[{total,39163168},
          {connection_procs,73160},
          {queue_procs,41696},
          {plugins,0},
          {other_proc,13586328},
          {mnesia,64400},
          {mgmt_db,0},
          {msg_index,34144},
          {other_ets,762824},
          {binary,2634488},
          {code,16522377},
          {atom,594537},
          {other_system,4849214}]},
 {vm_memory_high_watermark,0.4},
 {vm_memory_limit,3293272473},
 {disk_free_limit,50000000},
 {disk_free,189010096128},
 {file_descriptors,[{total_limit,924},
                    {total_used,5},
                    {sockets_limit,829},
                    {sockets_used,2}]},
 {processes,[{limit,1048576},{used,149}]},
 {run_queue,0},
 {uptime,318}]
...done.

    
</entry>
<entry [Tue 2015:08:11 04:57:53 EST] FIX MESSAGE MAX SIZE LIMIT (frame_max)>

SEE [Mon 2014:04:21 11:41:58 EST] FIXED aguad DAEMON ERROR: RABBITMQ SEND MESSAGE FAILS ABOVE MAX SIZE (frame_max)>

1. ADD frame_max TO rabbitmq.config

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


    
</entry>
<entry [Tue 2015:03:10 12:24:14 EST] SHORTCUTS>

rl	tail -f /var/log/upstart/rabbitjs.log
rq	rabbitmqctl list_queues name messages messages_ready memory
	
</entry>
<entry [Tue 2015:03:10 00:09:59 EST] FIXED ERROR: {amqp_error,not_found,"no exchange 'chat' in vhost '/'",'queue.bind'}>

REDECLARE EXCHANGE

sudo su

rabbitmqadmin delete queue name=chat
rabbitmqadmin delete exchange name=chat
rabbitmqadmin declare exchange "name=chat" type="fanout"


VERIFY

rabbitmqctl list_exchanges
rabbitmqctl list_connections
rabbitmqctl list_channels
rabbitmqctl list_consumers
rabbitmqctl list_queues
rabbitmqctl list_exchanges
rabbitmqctl list_bindings

	
</entry>
<entry [Mon 2014:11:10 19:53:21 EST] COMMON COMMANDS>

RESTART

rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app

SET USER

rabbitmqctl add_user rabbituser runrabit%2
rabbitmqctl set_user_tags rabbituser administrator
rabbitmqctl add_vhost rabbitvhost
rabbitmqctl set_permissions -p rabbitvhost rabbituser ".*" ".*" ".*"
sudo rabbitmqctl set_permissions rabbituser ".*" ".*" ".*"

DELETE USER

rabbitmqctl delete_user rabbituser

RECREATE VHOST

rabbitmqctl delete_vhost "/"
rabbitmqctl add_vhost "/"
rabbitmqctl set_permissions -p "/" guest ".*" ".*" ".*"

CHANGE PASSWORD

rabbitmqctl change_password guest somepassword

SET TEST USER

rabbitmqctl add_user test test
rabbitmqctl set_user_tags test administrator
rabbitmqctl set_permissions -p / test ".*" ".*" ".*"

LIST PERMISSIONS

rabbitmqctl list_permissions
    Listing permissions in vhost "/" ...
    guest	.*	.*	.*
    ...done.

rabbitmqctl list_permissions -p rabbitvhost
    Listing permissions in vhost "rabbitvhost" ...
    rabbituser	.*	.*	.*
    ...done.



</entry>