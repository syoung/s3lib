agua.test




<entry [Mon 2015:08:31 07:32:37 EST] SIPHON TESTS>

PUBLISH

rabbitmqadmin publish --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=54.144.21.248 routing_key=chat payload='{"queue":"username.Project.Workflow","data":{"project":"QC","workflow":"DownloadQC","module":"Agua::Workflow","mode":"executeWorkflow","sendtype":"task"}}'

GET

rabbitmqadmin get --vhost=rabbitvhost  --username=rabbituser --password=runrabit%2 --host=54.144.21.248 queue=chat requeue=true count=10


    
</entry>
<entry [Mon 2015:03:23 23:08:29 EST] FRONTEND FAILED TO ADD CLUSTER WORKFLOW>

/a/bin/exchange/sendFanout --exchange chat --message \
'{"callback": "handleSaveClusterWorkflow","database": "","mode": "saveClusterWorkflow","module": "Agua::Workflow","sendtype": "response","sessionid": "1427173432.8251.746","sourceid": "uniqName_27_0","token": "q4EsOkeOinSa6oH4","username": "guest","data":{"error":"Could not add workflow Workflow1 to cluster ","workflow":"Workflow1","status":"Added workflow Workflow1 to cluster","project":"Project1","cluster":""}}'

{"data":{"error":"Could not add workflow Workflow1 to cluster ","workflow":"Workflow1","status":"Added workflow Workflow1 to cluster","project":"Project1","cluster":""},"sourceid":"uniqName_27_0","callback":"handleSaveClusterWorkflow","sendtype":"response","username":"guest","database":"agua","token":"q4EsOkeOinSa6oH4"}


</entry>
<entry [Mon 2015:03:23 22:05:17 EST] saveClusterWorkflow>

/a/bin/exchange/sendFanout --exchange chat --message \
'{"callback": "handleSaveClusterWorkflow","database": "","mode": "saveClusterWorkflow","module": "Agua::Workflow","sendtype": "request","sessionid": "1427173432.8251.746","sourceid": "uniqName_27_0","token": "q4EsOkeOinSa6oH4","username": "guest","data": {"cluster": "guest-TEST","project": "Project1","workflow": "Workflow1","username": "guest"}}'


{
	"callback": "handleSaveClusterWorkflow",
	"database": "",
	"mode": "saveClusterWorkflow",
	"module": "Agua::Workflow",
	"sendtype": "request",
	"sessionid": "1427173432.8251.746",
	"sourceid": "uniqName_27_0",
	"token": "q4EsOkeOinSa6oH4",
	"username": "guest",
	"data": {
		"username": "guest",
		"cluster": "guest-TEST",
		"project": "Project1",
		"workflow": "Workflow1"
	}
}
	
</entry>
<entry [Mon 2015:03:23 20:47:24 EST] LOGIN>

/a/bin/exchange/sendFanout --exchange chat --message \
'{"sourceid":"plugins_login_Login_0","callback":"handleResponse","username":"guest","password":"guest","mode":"submitLogin","module":"Agua::Workflow","sendtype":"request","sessionid":"","sourceid":"plugins_login_Login_0","token":"1Rm6CXVotgVzoMv9","username":"guest"}'


'{
	"sourceid":"plugins_login_Login_0",
	"callback":"handleResponse",
	"username":"guest",
	"password":"guest",
	"mode":"submitLogin",
	"module":"Agua::Workflow",
	"sendtype":"request",
	"sessionid":"",
	"sourceid":"plugins_login_Login_0",
	"token":"1Rm6CXVotgVzoMv9",
	"username":"guest"
}'
	
</entry>
<entry [Sun 2015:03:22 16:53:41 EST] FILE SYSTEM>

QUERY

/a/bin/exchange/sendFanout \
--message '{"mode":"fileSystem","module":"Agua::Workflow","requestor":"testuser","sendtype":"request","username":"testuser","sessionid":"9999999999.9999.999","data":{"path":"/home/guest/agua/Project1","location":"/home/guest/agua/Project1","username":"testuser","owner":"testuser","groupname":"","query":"/home/guest/agua/Project1/Workflow1"}}'	


RESPONSE

	
{"token":undef,"sourceid":"","username":"testuser","sendtype":"response","callback":"","data":{"total":4,"path":"Workflow1","items":[{"path":"/home/guest/agua/Project1/Workflow1/script","name":"script","modified":"1427082569","parentPath":"/home/guest/agua/Project1/Workflow1","size":"4096","parentDir":"/home/guest/agua/Project1/Workflow1","children":["1-bowtieIndex.sh","1-sleep.sh","2-sleep.sh","3-TOPHAT.sh","3-novoIndex.sh","3-sleep.sh","5-sleep.sh","7-sleep.sh","8-novoIndex.sh"],"directory":"true"},{"name":"scripts","path":"/home/guest/agua/Project1/Workflow1/scripts","children":[],"directory":"true","modified":"1426859021","parentPath":"/home/guest/agua/Project1/Workflow1","size":"4096","parentDir":"/home/guest/agua/Project1/Workflow1"},{"children":["1-sleep.exit","1-sleep.stderr","1-sleep.stdout","1-sleep.usage","2-sleep.exit","2-sleep.stderr","2-sleep.stdout","2-sleep.usage","3-sleep.exit","3-sleep.stderr","3-sleep.stdout","3-sleep.usage"],"directory":"true","size":"4096","parentDir":"/home/guest/agua/Project1/Workflow1","modified":"1427082575","parentPath":"/home/guest/agua/Project1/Workflow1","name":"stdout","path":"/home/guest/agua/Project1/Workflow1/stdout"},{"parentDir":"/home/guest/agua/Project1/Workflow1","size":"4096","modified":"1426854900","parentPath":"/home/guest/agua/Project1/Workflow1","children":[],"directory":"true","path":"/home/guest/agua/Project1/Workflow1/temp","name":"temp"}],"status":"ok","name":"Workflow1"},"database":"aguatest"}

	
</entry>
<entry [Wed 2014:10:01 11:41:40 EST] EXCHANGE LOGIN>

1. SET RABBITMQ

FLUSH ALL QUEUES + USERS

sudo su
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app

RESET USERS

sudo rabbitmqctl add_user rabbituser runrabit%2
sudo rabbitmqctl add_vhost rabbitvhost
sudo rabbitmqctl set_permissions -p rabbitvhost rabbituser ".*" ".*" ".*"


2. ADD socket ENTRIES TO config.yaml

echo "Adding to config.yaml" 
#sudo /a/bin/openstack/config.pl --mode setKey --section "queue:host" --value 192.168.1.16
#sudo /a/bin/openstack/config.pl --mode setKey --section "queue:port" --value 5672
#sudo /a/bin/openstack/config.pl --mode setKey --section "queue:user" --value rabbituser
#sudo /a/bin/openstack/config.pl --mode setKey --section "queue:pass" --value runrabit%2
#sudo /a/bin/openstack/config.pl --mode setKey --section "queue:vhost" --value rabbitvhost
#sudo /a/bin/openstack/config.pl --mode setKey --section "queue:exchange" --value topicexchange
#sudo /a/bin/openstack/config.pl --mode setKey --section "queue:exchangetype" --value topic

TO ADD SECTION:

# queue:
#   host: 192.168.1.16
#   pass: runrabit%2
#   port: 5672
#   user: rabbituser
#   vhost: rabbitvhost



sudo /a/bin/openstack/config.pl --mode setKey --section "queue:host" --value l
sudo /a/bin/openstack/config.pl --mode setKey --section "queue:port" --value 5672
sudo /a/bin/openstack/config.pl --mode setKey --section "queue:user" --value guest
sudo /a/bin/openstack/config.pl --mode setKey --section "queue:pass" --value guest
sudo /a/bin/openstack/config.pl --mode setKey --section "queue:vhost" --value "/"
sudo /a/bin/openstack/config.pl --mode setKey --section "queue:exchange" --value topicexchange
sudo /a/bin/openstack/config.pl --mode setKey --section "queue:exchangetype" --value topic


TO ADD SECTION:

queue:
  host: localhost
  pass: guest
  port: 5672
  user: guest
  vhost: /
  


3. TEST sendTask

./receiveTask --queue test.test.test

    [x] Received task in host 192.168.1.16 taskqueue 'test.test.test': {"workflow":"test","queue":"test.test.test","mode":"test","database":"agua","sendtype":"task","token":null,"sourceid":"","username":"test","callback":"","processid":8569,"project":"test"}

./sendTask --message '{"username":"test","project":"test","workflow":"test","mode":"test"}' --log 4 

    OK


4. TEST sendSocket

./receiveSocket  \
--host 192.168.1.16 \
--user rabbituser \
--pass runrabit%2 \
--vhost rabbitvhost \
--log 4

    [*] [192.168.1.16|topicexchange|topic|amq.gen-IjkDNbwH6b2hZ-h-52zOkg] Waiting for RabbitJs socket traffic
     [x] Received message: {"callback":"","message":"{\"token\":\"Tbc3K5bPEyGMH5lm\",\"sourceid\":\"plugins_login_Login_0\",\"callback\":\"handleResponse\",\"username\":\"guest\",\"password\":\"guest\",\"mode\":\"submitLogin\",\"module\":\"Agua::Workflow\",\"database\":\"testdatabase\"}","pass":"runrabit%2","sourceid":"","sendtype":"data","port":5672,"token":null,"user":"rabbituser","host":"192.168.1.16","vhost":"rabbitvhost","username":null}

/a/bin/exchange/sendSocket \
--message '{"token":"Tbc3K5bPEyGMH5lm","sourceid":"plugins_login_Login_0","callback":"handleResponse","username":"guest","password":"guest","mode":"submitLogin","module":"Agua::Workflow","database":"testdatabase"}' \
--host 192.168.1.16 \
--user rabbituser \
--pass runrabit%2 \
--vhost rabbitvhost \
--log 4 


    [*]   9039   [192.168.1.16|topicexchange|topic] Sent message: {"callback":"","message":"{\"token\":\"Tbc3K5bPEyGMH5lm\",\"sourceid\":\"plugins_login_Login_0\",\"callback\":\"handleResponse\",\"username\":\"guest\",\"password\":\"guest\",\"mode\":\"submitLogin\",\"module\":\"Agua::Workflow\",\"database\":\"testdatabase\"}","pass":"runrabit%2","sourceid":"","sendtype":"data","port":5672,"token":null,"user":"rabbituser","host":"192.168.1.16","vhost":"rabbitvhost","username":null}



5. TEST sendFanout WITH agua

RUN AGUA

/a/bin/daemon/agua --log 4


SEND FANOUT

/a/bin/exchange/sendFanout \
--message '{"token":"Tbc3K5bPEyGMH5lm","sourceid":"plugins_login_Login_0","callback":"handleResponse","username":"guest","password":"guest","mode":"submitLogin","module":"Agua::Workflow","sendtype":"request"}' \
--host 192.168.1.16 \
--user rabbituser \
--pass runrabit%2 \
--vhost rabbitvhost \
--exchange fanout \
--log 4


export TOKEN=UCtLVsQMFmLFE7mr

LOGIN

/a/bin/exchange/sendFanout \
--host 192.168.1.16 \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message '{"token":"UCtLVsQMFmLFE7mr","sourceid":"plugins_login_Login_0","callback":"handleResponse","username":"guest","password":"guest","mode":"submitLogin","module":"Agua::Workflow","sendtype":"request"}'


GET DATA

/a/bin/exchange/sendFanout \
--host 192.168.1.16 \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message '{"mode":"getData","module":"Agua::Workflow","sourceid":"plugins_data_Controller_2","callback":"loadData","token":"UCtLVsQMFmLFE7mr","sendtype":"request","username":"guest","sessionid":"1412917906.10691.920"}'


/a/bin/exchange/sendFanout \
--host localhost \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message '{"sendtype":"request","username":"guest","sourceid":"plugins.login.Login_0","mode":"getData","callback":"loadData","sessionid":"1413196311.18792.477","module":"Agua::Workflow","token":"t7XmAsjnG2RxiGSn"}'



INSERT STAGE

/a/bin/exchange/sendFanout \
--host 192.168.1.16 \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message '{"username":"guest","sessionid":"1413014583.9656.411","mode":"insertStage","module":"Agua::Workflow","data":{"linkurl":"","username":"guest","localonly":"0","type":"converter","version":"0.6.0","owner":"agua","description":"Run bowtie-build to convert FASTA files into *ebwt indexed files","name":"bowtieIndex","installdir":"/a/apps/bioapps","package":"bioapps","url":"http://www.aguadev.org/confluence/display/howto/Bioapps+API","location":"bin/converters/bowtieIndex.pl","notes":"","executor":"/usr/bin/perl","appname":"bowtieIndex","appnumber":"1","number":"1","cluster":"","project":"Project1","workflow":"Workflow1","workflownumber":"1"},"token":"nKbRhIx5LmKS0Seh","sendtype":"request"}'


/a/bin/exchange/sendFanout \
--host 192.168.1.16 \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message '{"database":"testdatabase","username":"testuser","sessionid":"0000000000.0000.000","mode":"insertStage","module":"Agua::Workflow","data":{"linkurl":"","username":"guest","localonly":"0","type":"converter","version":"0.6.0","owner":"agua","description":"Run bowtie-build to convert FASTA files into *ebwt indexed files","name":"bowtieIndex","installdir":"/a/apps/bioapps","package":"bioapps","url":"http://www.aguadev.org/confluence/display/howto/Bioapps+API","location":"bin/converters/bowtieIndex.pl","notes":"","executor":"/usr/bin/perl","appname":"bowtieIndex","appnumber":"1","number":"1","cluster":"","project":"Project1","workflow":"Workflow1","workflownumber":"1"},"token":"nKbRhIx5LmKS0Seh","sendtype":"request"}'



GET HISTORY


/a/bin/exchange/sendFanout \
--host 192.168.1.16 \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message '{"mode":"getHistory","callback":"handleHistory","module":"Agua::Workflow","sourceid":"plugins_workflow_History_0","token":"UCtLVsQMFmLFE7mr","sendtype":"request","sessionid":"1412917906.10691.920"}'


/a/bin/exchange/sendFanout \
--host localhost \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message '{"token":"7gjvnQMe55cGZ7t8","username":"guest","callback":"handleHistory","mode":"getHistory","sessionid":"1413197987.19482.424","sourceid":"plugins_workflow_History_0","module":"Agua::Workflow","sendtype":"request"}'


INSERT STAGE

/a/bin/exchange/sendFanout \
--host 192.168.1.16 \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message  '{"username":"guest","sessionid":"1413011085.7244.277","mode":"insertStage","module":"Agua::Workflow","token":"pDNCv7bQP0OIOzuV","sendtype":"request"}'


GUEST USER

/a/bin/exchange/sendFanout \
--host localhost \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message  '{"username":"guest","sessionid":"0000000000.0000.000","mode":"insertStage","module":"Agua::Workflow","sourceid":"plugins/dnd/Target_0","callback":"handleResponse","data":{"linkurl":"","username":"admin","localonly":"0","type":"converter","version":"0.6.0","owner":"agua","description":"Run bowtie-build to convert FASTA files into *ebwt indexed files","name":"bowtieIndex","installdir":"/a/apps/bioapps","package":"bioapps","url":"http://www.aguadev.org/confluence/display/howto/Bioapps+API","location":"bin/converters/bowtieIndex.pl","notes":"","executor":"/usr/bin/perl","appname":"bowtieIndex","appnumber":"1","number":"1","cluster":"","project":"Project1","workflow":"Workflow1","workflownumber":"1"},"token":"qVRb7suGidvq0nl4","sendtype":"request"}'


TESTUSER

/a/bin/exchange/sendFanout \
--host localhost \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message  '{"database":"testdatabase","username":"testuser","sessionid":"0000000000.0000.000","mode":"insertStage","module":"Agua::Workflow","sourceid":"plugins/dnd/Target_0","callback":"handleResponse","data":{"linkurl":"","username":"admin","localonly":"0","type":"converter","version":"0.6.0","owner":"agua","description":"Run bowtie-build to convert FASTA files into *ebwt indexed files","name":"bowtieIndex","installdir":"/a/apps/bioapps","package":"bioapps","url":"http://www.aguadev.org/confluence/display/howto/Bioapps+API","location":"bin/converters/bowtieIndex.pl","notes":"","executor":"/usr/bin/perl","appname":"bowtieIndex","appnumber":"1","number":"1","cluster":"","project":"Project1","workflow":"Workflow1","workflownumber":"1"},"token":"qVRb7suGidvq0nl4","sendtype":"request"}'



RUN WORKFLOWS

/a/bin/exchange/sendFanout \
--host localhost \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message  '{"username":"guest","cluster":"","sourceid":"plugins_workflow_RunStatus_Status_0","sessionid":"1413203949.20817.371","mode":"executeWorkflow","module":"Agua::Workflow","project":"Project1","workflow":"Workflow1","workflownumber":"1","start":"1","stop":"1","submit":0,"callback":"handleRunWorkflow"}'


##### ACTUAL REQUEST FROM AGUA:

#/a/bin/exchange/sendFanout \
#--host 192.168.1.16 \
#--user rabbituser \
#--pass runrabit%2 \
#--vhost rabbitvhost \
#--exchange fanout \
#--log 4 \
#--message  '{"sourceid":"plugins_login_Login_0","callback":"handleResponse","username":"guest","password":"guest","mode":"submitLogin","module":"Agua::Workflow","token":"KohGDITqo2mSjdV3","sendtype":"request"}'
#

BROWSE

https://localhost:8080/agua.html





/a/bin/exchange/sendFanout \
--host 192.168.1.16 \
--user guest \
--pass guest \
--vhost "/" \
--exchange chat \
--log 4 \
--message '{"mode":"getHistory","callback":"handleHistory","module":"Agua::Workflow","sourceid":"plugins_workflow_History_0","token":"V8wTQrTC2S1YBpnv","sendtype":"request","sessionid":"1412917906.10691.920"}'






OLD:

queue:
  exchange: topicexchange
  exchangetype: topic
  host: localhost
  pass: runrabit%2
  port: '5672'
  test: rabbitvhost
  user: rabbituser
  vhost: rabbitvhost


NEW:

queue:
  exchange: topicexchange
  exchangetype: topic
  host: localhost
  pass: guest
  port: 5672
  test: rabbitvhost
  user: guest
  vhost: /





    
</entry>
<entry [Sat 2014:09:27 09:32:31 EST] REFACTORED bin/cli/work TO SUPPORT YAML>

mkdir -p /home/syoung/flow
cd /home/syoung/flow


flow addWorkflow --project LoadSra --wkfile 1-LoadSamples.work --username admin
flow runWorkflow --project LoadSra --workflow LoadSamples


work create --workflow Download
work addApp --wkfile ./Download.work --appfile ./Aspera.app 

work deleteApp --wkfile ./Download.work --app Aspera --log 4


work desc --workflow Download
work desc --workflow Download --log 4

mq -NBe "select * from workflow"

    
</entry>
<entry [Fri 2014:09:26 21:47:54 EST] REFACTORED bin/cli/app TO SUPPORT YAML>

0. CREATE WORK DIR

mkdir -p /home/syoung/flow
cd /home/syoung/flow


1. CREATE APP Aspera

<!--
/a/bin/cli/app create \
--name Aspera \
--type download \
--description "Download a file using Aspera (e.g., from the SRA)"

    ---
    description: 'Download a file using Aspera (e.g., from the SRA)'
    name: Aspera
    parameters: []
    type: download

/a/bin/cli/app addParam \
--appfile ./Aspera.app \
--param uuid \
--value '<SAMPLE>' \
--ordinal 1

    ---
    description: 'Download a file using Aspera (e.g., from the SRA)'
    name: Aspera
    parameters:
      -
        ordinal: '1'
        param: uuid
        value: <SAMPLE>

c
    ---
    description: 'Download a file using Aspera (e.g., from the SRA)'
    name: Aspera
    parameters:
      -
        ordinal: '1'
        param: uuid
        value: <SAMPLE>
      -
        ordinal: '2'
        param: outputdir
        value: /data/sra/aspera/<SAMPLE>

-->


2. CREATE APP SraToBam

<!--

mkdir -p /home/syoung/flow
cd /home/syoung/flow

/a/bin/cli/app create \
--name SraToBam \
--param uuid \
--description "Download a file using Aspera (e.g., from the SRA)" \
--notes "Uses biobambam's fastqtobam" \
--owner admin \
--type converter

/a/bin/cli/app addParam \
--appfile ./SraToBam.app \
--name inputfile \
--argument '--inputfile' \
--description 'Input SRA file location' \
--value '/data/sra/aspera/<SAMPLE>/<SAMPLE>.sra'

/a/bin/cli/app addParam \
--appfile ./SraToBam.app \
--name outputfile \
--argument '--outputfile' \
--description 'Output BAM file location' \
--value '/data/sra/aspera/<SAMPLE>/<SAMPLE>.bam'


/a/bin/cli/app addParam \
--appfile ./SraToBam.app \
--argument '--reference' \
--description 'Reference sequence file location' \
--param reference \
--paramtype input \
--value /data/reference/genome.fa

---
description: 'Download a file using Aspera (e.g., from the SRA)'
name: SraToBam
notes: "Uses biobambam's fastqtobam"
owner: admin
parameters:
  -
    argument: --inputfile
    description: 'Input SRA file location'
    param: inputfile
    value: /data/sra/aspera/<SAMPLE>/<SAMPLE>.sra
  -
    argument: --outputfile
    description: 'Output BAM file location'
    param: outputfile
    value: /data/sra/aspera/<SAMPLE>/<SAMPLE>.bam
  -
    argument: --reference
    description: 'Reference sequence file location'
    param: reference
    paramtype: input
    value: /data/reference/genome.fa
type: converter

-->
</entry>
<entry [Sun 2014:05:25 14:11:45 EST] SET login, ETC. FOR INTEGRATION TESTS>

suu
source /home/syoung/notes/agua/private/conf/.repos/github/syoung/envars.sh
	
</entry>
<entry [Wed 2014:05:14 13:01:23 EST] TEST handleSubmit>

/agua/bin/exchange/sendSocket \
--mode send \
-- message '{"token":"Tbc3K5bPEyGMH5lm","sourceid":"plugins_login_Login_0","callback":"handleResponse","username":"guest","password":"guest","mode":"submitLogin","module":"Agua::Workflow","database":"testdatabase"}'


</entry>
<entry [Sun 2014:05:04 16:52:17 EST] TEST Queue::Manager::handleTopic>

ADD TO package TABLE

insert into package values ('syoung', 'syoung', 'bioapps', 'bioapps', 'public', 'ready', '0.8.0', '/agua/repos/public/agua/bioapps', '/apps/bioapps', 'Bioinformatics applications for Agua workflow platform', '', 'www.aguadev.org', NOW());


ADD TO project, workflow, stage AND stageparameter TABLES

**** FROM pancancer/README FILE

#### TESTING
# Add test project to database
cd /agua/apps/pancancer/conf
/agua/bin/cli/flow.pl ./Test.proj save --username testuser --database aguatest

# Add test workflow
/agua/bin/cli/flow.pl Test.proj saveWorkflow --wkfile 1-Sleep.work --username testuser --database aguatest


2) SQL queries to verify the workflow data is stored in the database

# DELETE ENTRIES (BEFORE RE-RUNNING THE ABOVE COMMANDS)

DELETE FROM project where name='PanCancer'; DELETE FROM workflow where project='PanCancer'; DELETE FROM stage where project='PanCancer'; DELETE FROM stageparameter WHERE project='PanCancer';

# GET ENTRIES

SELECT * FROM project where name='PanCancer'\G select * from workflow where project='PanCancer'\G SELECT * from stage where project='PanCancer'\G SELECT * from stageparameter WHERE project='PanCancer'\G

# SAMPLE RESULTS

SELECT * FROM project where name='PanCancer'\G
SELECT * FROM workflow where project='PanCancer' order by number\G
SELECT * from stage where project='PanCancer' order by number;
SELECT * from stageparameter where project='PanCancer' order by appnumber;


</entry>
<entry [Tue 2014:04:29 05:24:16 EST] TEST Queue::Manager - send/receive COMMANDS AND TASKS>

SUMMARY:
	ENSURE config.yaml HAS host, ETC.
	SET AUTHENTICATION WITH rabbitmqctl
	VERIFY WITH rabbitmqctl list_permissions


SEND/RECEIVE COMMANDS

SET RECEIVER (ON ALIEN)

/agua/bin/queue/receive.pl \
--user rabbituser \
--pass runrabit%2 \
--vhost rabbitvhost \
--host localhost


SEND MESSAGE (ON VM)

/agua/bin/queue/emit.pl \
--user rabbituser \
--pass runrabit%2 \
--vhost rabbitvhost \
--host 172.17.42.1 \
--message "TEST MESSAGE"


SEND/RECEIVE TASKS
------------------

SET RECEIVER (ON ALIEN)

/agua/bin/queue/worker.pl \
--username syoung \
--project 1234567890 \
--workflow Align 


SEND MESSAGE (ON VM)

/agua/bin/queue/tasker.pl \
--username syoung \
--project 1234567890 \
--workflow Align 

	OK

</entry>
<entry [Tue 2014:04:22 04:24:54 EST] TEST PanCancer::Apps IN pancancer REPO>

1. GET DATA FILE

mkdir -p /agua/apps/pancancer/t/bin/PanCancer/Apps/Align/inputs/
cd /agua/apps/pancancer/t/bin/PanCancer/Apps/Align/inputs/
wget https://s3-us-west-1.amazonaws.com/biotools/00000000.tar.gz
tar xvfz 00000000.tar.gz


2. TEST OUT APP

cd /agua/apps/pancancer/t/bin/PanCancer/Apps/Align
./test --showlog 4




</entry>
<entry [Mon 2014:04:21 23:32:03 EST] DEPLOY BY DAEMON>

SET SHORTCUTS IN .bash_profile

alias aperl='source /agua/apps/pancancer/envars.sh; /agua/apps/perl/5.18.2/bin/perl'
alias emit='aperl /agua/t/unit/bin/Agua/Common/Exchange/inputs/emit'
alias receive='aperl /agua/t/unit/bin/Agua/Common/Exchange/inputs/receive'
#alias dmn='service agua stop; source /agua/apps/pancancer/envars.sh; service agua start'    
alias dmn='service agua stop; source /agua/apps/pancancer/envars.sh; /agua/apps/perl/5.18.2/\
bin/perl /agua/bin/daemon/agua'


UPDATE BIOREPO TO LATEST COMMIT
emit '{"username":"admin","sessionid":"9999999999.9999.999","module":"Agua::Deploy","mode":"biorepo"}'

UPDATE BIOREPO TO LATEST VERSION
emit '{"username":"admin","sessionid":"9999999999.9999.999","module":"Agua::Deploy","mode":"biorepo","version":"latest"}'

UPDATE PACKAGE
emit '{"username":"admin","sessionid":"9999999999.9999.999","module":"Agua::Deploy","mode":"install","package":"biorepository","repository":"biorepository"}'

UPDATE bwa TO LATEST VERSION (0.7.7)
emit '{"username":"admin","sessionid":"9999999999.9999.999","module":"Agua::Deploy","mode":"install","package":"bwa","version":"0.7.7"}'

SUBMIT LOGIN
emit '{"username":"admin","password":"aaa","module":"Agua::Workflow","mode":"submitLogin"}'

CORRECT HOSTNAME
emit '{"username":"admin","password":"aaa","module":"Agua::Workflow","mode":"submitLogin","hostname":"split.v2-5.hd800-real-de2e4a8b-7034-4525-ab3e-33fc993797f8"}'

WRONG HOSTNAME
emit '{"username":"admin","password":"aaa","module":"Agua::Workflow","mode":"submitLogin","hostname":"split.v2-5.hd800-real-de2e4a8b-7034-4525-ab3e-33fc993797f8xxxxxx"}'



#### SYSTEM COMMAND
emit '{"username":"admin","password":"aaa","module":"Queue::Monitor","mode":"systemCommand","command":"ls -al /agua"}'

#### QUERY DATABASE
emit '{"username":"admin","password":"aaa","module":"Agua::Workflow","mode":"submitLogin","query":"SELECT * FROM workflow WHERE sampleid=\'XXX\'"}'


#### STOP WORKFLOW


#### START WORKFLOW


#### UPDATE AGUA (AND RESTART DAEMON)






</entry>
<entry [Mon 2014:03:10 01:14:07 EST] TEST INSTALL APP WITHOUT pmfile AND opsfile>

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--SHOWLOG 4 \
--package pip \
--version 1.5.4

	
</entry>
<entry [Sun 2014:03:09 13:19:20 EST] COMPLETED TESTS FOR REMAINING biotools v4 APPLICATIONS>

circos	0.64
cufflinks	2.1.1
freebayes	v9.9.13
gatk	2.8-1
setuptools 2.1
pip 1.2.1
python 2.7.3
python 3.3.0

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/gatk/gatk.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/gatk/gatk.ops \
--SHOWLOG 4 \
--package gatk \
--version 2.8-1

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/pip/pip.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/pip/pip.ops \
--SHOWLOG 4 \
--package pip \
--version 1.2.1

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/python/python.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/python/python.ops \
--SHOWLOG 4 \
--package python \
--version 2.7.3

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/python/python.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/python/python.ops \
--SHOWLOG 4 \
--package python \
--version 3.3.0


</entry>
<entry [Thu 2014:02:27 02:52:33 EST] TEST FTP.pl>

http://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes


</entry>
<entry [Fri 2014:02:07 01:52:45 EST] deploy.pl --mode install>

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/tophat/tophat.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/tophat/tophat.ops \
--SHOWLOG 4 \
--package tophat \
--version 2.0.9

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/bowtie2/bowtie2.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/bowtie2/bowtie2.ops \
--SHOWLOG 4 \
--package bowtie2 \
--version 2.2.0

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/cufflinks/cufflinks.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/cufflinks/cufflinks.ops \
--SHOWLOG 4 \
--package cufflinks \
--version 2.1.1

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/bedtools2/bedtools2.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/bedtools2/bedtools2.ops \
--SHOWLOG 4 \
--package bedtools2 \
--version 2.18.5

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/cmake/cmake.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/cmake/cmake.ops \
--SHOWLOG 4 \
--package cmake \
--version 2.8.12.1

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/bwa/bwa.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/bwa/bwa.ops \
--SHOWLOG 4 \
--package bwa \
--version 0.7.6a

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/picard/picard.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/picard/picard.ops \
--SHOWLOG 4 \
--package picard \
--version 1.107
	
reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/varscan/varscan.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/varscan/varscan.ops \
--SHOWLOG 4 \
--package varscan \
--version 2.3.6
	
reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/emboss/emboss.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoun
#g/emboss/emboss.ops \
--SHOWLOG 4 \
--package emboss \
--version 6.6.0

EMBOSS 6.6.0
	276 APPS
	2057 PARAMETERS
	
reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/fastqc/fastqc.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/fastqc/fastqc.ops \
--SHOWLOG 4 \
--package fastqc \
--version 0.10.1

	
reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/fastx/fastx.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/fastx/fastx.ops \
--SHOWLOG 4 \
--package fastx \
--version 0.0.12


reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/freebayes/freebayes.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/freebayes/freebayes.ops \
--SHOWLOG 4 \
--package freebayes \
--version v9.9.13


reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/m4/m4.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/m4/m4.ops \
--SHOWLOG 4 \
--package m4 \
--version 1.4.17
	
reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/mutect/mutect.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/mutect/mutect.ops \
--SHOWLOG 4 \
--package mutect \
--version 1.1.6


reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/samtools/samtools.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/samtools/samtools.ops \
--SHOWLOG 4 \
--package samtools \
--version 0.1.19


reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/R/r.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/R/r.ops \
--SHOWLOG 4 \
--package R \
--version 3.0.2-1

reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/rsem/rsem.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/rsem/rsem.ops \
--SHOWLOG 4 \
--package rsem \
--version 1.2.11


reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/blat/blat.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/blat/blat.ops \
--SHOWLOG 4 \
--package blat \
--version 35


reset; /aguadev/bin/install/deploy.pl \
--mode install \
--pmfile /mnt/repos/private/syoung/biorepodev/syoung/bamtools/bamtools.pm \
--opsfile /mnt/repos/private/syoung/biorepodev/syoung/bamtools/bamtools.ops \
--SHOWLOG 4 \
--package bamtools \
--version v2.3.0



</entry>
<entry [Mon 2014:01:20 21:56:31 EST] TEST addGroup>

echo '{"data":{"description":"Cancer clinical trials","groupname":"Group1","notes":"Phase I"},"sessionid":"9999999999.9999.999","username":"admin","mode":"addGroup","module":"Agua::Workflow","SHOWLOG":4}' | ./agua.pl

reset; echo '{"data":{"description":"Source3 description","name":"Source3","location":"/full/path/to/source"},"sessionid":"9999999999.9999.999","username":"admin","mode":"addSource","module":"Agua::Workflow","SHOWLOG":4}' | ./agua.pl

reset; echo '{"mode":"submitLogin","module":"Agua::Workflow","password":"aaa","username":"admin","SHOWLOG":4}' | ./agua.pl


</entry>
<entry [Sat 2014:01:11 01:56:14 EST] TEST Workflows.syncWorkflows>


echo '{"details":"details 2","hubtype":"github","message":"message 2","mode":"syncWorkflows","module":"Agua::Workflow","sessionid":"9999999999.9999.999","username":"syoung","SHOWLOG":4}' | ./agua.pl

USE syoung KEY/CERT:

echo '{"amazonuserid":"728213020069","awsaccesskeyid":"AKIAJUP5Z626SQIATKWQ","awssecretaccesskey":"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","ec2privatekey":"-----BEGIN PRIVATE KEY-----↵MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ↵WWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ↵NVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC↵gYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3↵8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG↵M6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC↵aE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK↵pzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9↵4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc↵6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC↵QQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN↵ukFcKuTSGIpO↵-----END PRIVATE KEY-----","ec2publiccert":"-----BEGIN CERTIFICATE-----↵MIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC↵VVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY↵QVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy↵NDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV↵BgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w↵DQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ↵eWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr↵dtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5↵9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK↵BggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti↵ZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7↵cPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU↵bs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z↵0626imzblXE8IA==↵-----END CERTIFICATE-----","mode":"addAws","module":"Agua::Workflow","repotype":"github","sessionid":"1389435714.2793.437","username":"syoung","SHOWLOG":4}' | ./agua.pl


USE annai KEY/CERT:

echo '{"amazonuserid":"416621443487","awsaccesskeyid":"AKIAIRGAMDHR2VTPPQUA","awssecretaccesskey":"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","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCGyWP3L7k11Qbi\nertANuYMZ+aobeSEmNBFaNyaZE+FcFDFPNeJyCCRp8pKljIfTjVcqJf/yOtvZqHZ\nizRsGw0vUiOed/23X/QnQ5vkVgiyjC48xQfAT0pzMCi9HrYiiZg/7Rc/VdGwYpkg\nHJ1PRcd88j3Xby9Us86hqWnyKOTe/itk2n0amdgGLXRMPrS4aWKFPSveU53o4Wxp\n4CwNZCqZI85yhBPA+3lIEUwedT61W9dEwnyzTKvezelne5g1ys7zyfi2PIZMffQr\nR1w5TBqFFrmkLdGii/CJVb51yLfR/UtFsH3cKw1TPUMm0rdYQDkZWM3hUygo673u\ndLhnKztdAgMBAAECggEANKol5CSCgpUs7ns0BQAuXPSP/ImLu3+WCTjS0YSWSbY7\n6QU/1ncauq7L7N7I0NCXKxA469mOnGWGoeCxZ/gd67p1bmrF+MuGM31IQSyYk2MQ\ngfAeejbBCUbs9BA27EHE+l1iMv4OQ5QS7qgfkyTZsGlaXn30CW2ENEhkvBjcbIBe\nLsTgUSy2MZ6WvPE5jQHR9bRH27LJi9zyGyH+dlsXeuKgEg46bD8Ez3/Nh6zPABWp\nGO8oV9vmAf9x+QWpa1QPvwh7DStXnl9qCmBKCHdKAruOl0tZK5hhwKs3JIFthHtG\nF6fVpxUWMuJhreEtUVJ9oKM2F2ziOdjTGvongWA3ZQKBgQD3tmgDV/M95E2E/jLf\nJJwhVLr1P8kMVd1OYfgW4hS/U63C17Y4A7EpWq6Seec4+XeR6RMMVHh80bAVNkcv\n+XMd31vyhbCY183GJs7nBl+M9A8MZe/YLaoIzmhT9VVdTmogkselS6pTQmHSmTHV\nsKAiRpIjyHXBnVx2f0U4SWdbkwKBgQCLS821tqTPExS6DdqprVIy2SFQcURnx3oQ\nu9YclWppzU2L/idrSRFRNjWoPiY+eDGO15QxkUM8GUTHTRIctNrTOsHM6Kb+Bi2X\nYXjIm8rJlwM+pRWmnBsvoUjklMeCpNZ+HeQaqs7pohTohx8lHIFbqcnyPbR8OM/S\nZfcpOYfDTwKBgQDz6fS5dhzZ0LhUQEmvV8k1OM1vOIOrVdE4oVc8kRmE28y5ktam\niVwlMFm9ebOocly+nBZZicOqhH8yI+Qs5R/pRkqvn9yoY7cHaqdI7QmhLaCzwJxO\n7YgEa9pm8ahA3Dm8IUvdA4iPu0m/qYFcvTKxDXRRL85j+6NUOzXZms3faQKBgFUo\nDWVWeCDD2Hr5t0Dd3Y+KYCxuYlRThZMvUfD9gyWVRiAcSvrym2ybiGgHPpgYIKvj\nrQw0cvcNt5djzXvRMKnLlOjxHg3TtxGBnDZ/z5Q4BtrIT5kgfBo9LnPXZLTAkwRc\nv7Nx0rbPyJpy6J5mc8qW3QeDo5ABp0NH5LbGHfJPAoGBAMpjiTe6RswKN/Wyw5S9\nt1toPDqtznFdSb9n6LppHa0vQ//c/SJ57O6cGCTrqseqblkpbq/wtSuFf8Iuzduj\n3IgxQj86FLBwh0DmOQYEIlzxz8fyJbmZl2TQXXa7nxlKIrXBYjASkpk4HZDucDRs\nIOuGe5/2KzQbYQIvjS2D4sT3\n-----END PRIVATE KEY-----","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIIDhzCCAm+gAwIBAgIVAIhXGZf0NozVVzIfS9OTz9wQSye4MA0GCSqGSIb3DQEB\nBQUAMFMxITAfBgNVBAMMGEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTEMMAoGA1UE\nCwwDQVdTMRMwEQYDVQQKDApBbWF6b24uY29tMQswCQYDVQQGEwJVUzAeFw0xMzA5\nMTkwNTQwNTFaFw0xNDA5MTkwNTQwNTFaME4xCzAJBgNVBAYTAlVTMRMwEQYDVQQK\nDApBbWF6b24uY29tMRIwEAYDVQQLDAlBV1MtVXNlcnMxFjAUBgNVBAMMDTE3ZWcz\ncWV6ZG01eDQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCGyWP3L7k1\n1QbiertANuYMZ+aobeSEmNBFaNyaZE+FcFDFPNeJyCCRp8pKljIfTjVcqJf/yOtv\nZqHZizRsGw0vUiOed/23X/QnQ5vkVgiyjC48xQfAT0pzMCi9HrYiiZg/7Rc/VdGw\nYpkgHJ1PRcd88j3Xby9Us86hqWnyKOTe/itk2n0amdgGLXRMPrS4aWKFPSveU53o\n4Wxp4CwNZCqZI85yhBPA+3lIEUwedT61W9dEwnyzTKvezelne5g1ys7zyfi2PIZM\nffQrR1w5TBqFFrmkLdGii/CJVb51yLfR/UtFsH3cKw1TPUMm0rdYQDkZWM3hUygo\n673udLhnKztdAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK\nBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSFV5GQIA59wlwwvf5v\nbJ0JOR9giDANBgkqhkiG9w0BAQUFAAOCAQEAkkbovrPbYlliVp0avrtWVqZe1WtT\nJ9/zIBUBMVpDNolOn4QLnl2wzY56axz4tRYHCcTis6o/8el2zD3eN8FyPEI5iR08\nul8DiUQtOkS8F/9LUEv+dRDhe2/9zbKP/VmJU8EXilc0VMdvJdy6HqF6+dhSke9r\nmSyAwW3JJKcSRLL0sWHEBXGj+8Anb+h34GtTg0CRfhdS/4fCtfFIIe2N08r1qeE5\njKELhxQTJgiLkDCv3fiOm7DuVSCMkpJllJfRtnJeeMugWO6qtwpPtZ8rVaN5nAC1\nU6asqsfDKqNGr1N5/uZJ26eocSwJjcy4FCCfFLoGAOBF47quRxtTO8Tb+w==\n-----END CERTIFICATE-----","mode":"addAws","module":"Agua::Workflow","repotype":"github","sessionid":"9999999999.9999.999","username":"syoung","SHOWLOG":4}' | ./agua.pl





	
</entry>
<entry [Thu 2013:12:19 01:05:26 EST] TEST RABBIT.JS USING VAGRANT>


ssh vagrant@localhost -p 2222  -L 8001:10.0.2.15:8000 -L 5672:10.0.2.15:5672

ON HOST (EMIT):

/home/syoung/notes/agua/private/bin/test/perl/NetRabbitFoot# ./emit_log.pl 
 [x] Sent info: Hello World!

 
ON VM (RECEIVE):

/home/vagrant/notes/agua/private/bin/test/perl/NetRabbitFoot# ./receive_logs.pl 
 [*] Waiting for logs. To exit press CTRL-C
 [x] info: Hello World!

	OK

	
</entry>
<entry [Tue 2013:10:15 11:28:15 EST] TEST DOWNLOAD>

./download.pl "mode=downloadFile&username=admin&sessionId=9999999999.9999.999&filepath=/nethome/admin/agua/Project1/Workflow0/stdout/1-jbrowseFeatures.stdout"


#echo '{"mode":"downloadFile","username":"admin","sessionid":"9999999999.9999.999","filepath":"/home/admin/aguadev/Project1/Workflow0/stdout/1-jbrowseFeatures.stdout","SHOWLOG":4}' | ./agua.pl    


</entry>
<entry [Tue 2013:10:15 10:28:17 EST] CREATE JBROWSE FEATURES>





    
</entry>
<entry [Mon 2013:10:07 12:42:28 EST] RETEST Workflow::insertStage, Workflow::getStatus>

Workflow::executeWorkflow
-------------------------


echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionid":"9999999999.9999.999","mode":"executeWorkflow","module":"Agua::Workflow","submit":0,"cluster":"","SHOWLOG":4}' | ./agua.pl

export PERL5LIB=/aguadev/lib; export SGE_EXECD_PORT=63232; export SGE_ROOT=/opt/sge6; export SGE_CELL=; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; export SESSION_ID=9999999999.9999.999;  /usr/bin/perl /aguadev/apps/bioapps/bin/utils/deepvac.pl --outputdir /home/admin/aguadev/Project1/Workflow1/downloads --regex chr22.fa.gz --type text --url ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/



echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":"3","stop":"3","username":"admin","sessionid":"9999999999.9999.999","mode":"executeWorkflow","module":"Agua::Workflow","submit":0,"cluster":"","SHOWLOG":4}' | ./agua.pl

export PERL5LIB=/aguadev/lib; export SGE_EXECD_PORT=63232; export SGE_ROOT=/opt/sge6; export SGE_CELL=; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; export SESSION_ID=9999999999.9999.999;  /usr/bin/perl /aguadev/apps/bioapps/bin/converters/bowtieIndex.pl --inputdir /home/admin/aguadev/Project1/Workflow1/downloads --outputdir /home/admin/aguadev/Project1/Workflow1/downloads --SHOWLOG 4





Workflow::insertStage
---------------------

echo '{"appname":"FTP","appnumber":"1","cluster":"","description":"Download FTP files or web pages from a URL","executor":"/usr/bin/perl","installdir":"/aguadev/apps/bioapps","linkurl":"","localonly":"0","location":"bin/utils/deepvac.pl","mode":"insertStage","module":"Agua::Workflow","name":"FTP","notes":"Download all files found in links in a page or raw text file","number":"1","owner":"agua","package":"bioapps","project":"Project1","sessionid":"9999999999.9999.999","type":"utility","url":"http://www.aguadev.org/confluence/display/howto/Bioapps+API","username":"admin","version":"0.6.0","workflow":"Workflow1","workflownumber":"1","SHOWLOG":4}' | ./agua.pl


Workflow::getStatus
-------------------

echo '{"username":"admin","sessionid":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getStatus","module":"Agua::Workflow","SHOWLOG":4}' | ./agua.pl
    

Workflow.runStatus.Status
-------------------------

{"workflow":"Workflow1","status":"","project":"Project1","stages":[{"stagedescription":"","stagepid":"0","number":"1","status":"","project":"Project1","submit":"0","workflowpid":"0","stagenotes":"","stagename":"","stagejobid":"0","completed":"0000-00-00 00:00:00","owner":"agua","workflownumber":"1","cluster":"","stderrfile":"","location":"bin/utils/deepvac.pl","version":"0.6.0","installdir":"/aguadev/apps/bioapps","executor":"/usr/bin/perl","name":"FTP","stdoutfile":"","package":"bioapps","username":"admin","workflow":"Workflow1","now":"2013-10-07 12:55:12","started":"0000-00-00 00:00:00","type":"utility","queued":"0000-00-00 00:00:00"},{"stagedescription":"","stagepid":"0","number":"2","status":"","project":"Project1","submit":"0","workflowpid":"0","stagenotes":"","stagename":"","stagejobid":"0","completed":"0000-00-00 00:00:00","owner":"agua","workflownumber":"1","cluster":"","stderrfile":"","location":"bin/utils/unzipFiles.pl","version":"0.6.0","installdir":"/aguadev/apps/bioapps","executor":"/usr/bin/perl","name":"unzipFiles","stdoutfile":"","package":"bioapps","username":"admin","workflow":"Workflow1","now":"2013-10-07 12:55:12","started":"0000-00-00 00:00:00","type":"utility","queued":"0000-00-00 00:00:00"}]}



</entry>
<entry [Mon 2013:10:07 09:35:09 EST] FTP DOWNLOAD URLS>

#### UCSC CHROMOSOMES
ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/chr*.fa.gz



### 2.6 GB
ftp://ftp.cbcb.umd.edu/pub/data/bowtie_indexes/hg19.ebwt.zip 

REGEX: chr*.fa.gz





ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/

ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/ ### DOESN'T WORK


    
</entry>
<entry [Wed 2013:10:02 11:48:16 EST] DEPLOY BIOAPPS>

1. INSTALL repos

# SET ENVARS: login, token, keyfile
sudo su
source /home/syoung/notes/agua/private/conf/.repos/github/syoung/envars.sh
echo ", $self->token

# INSTALL repos
sudo ./deploy.pl \
--mode biorepo \
--SHOWLOG 4


2. INSTALL bioapps

# SET ENVARS: login, token, keyfile
sudo su
source /home/syoung/notes/agua/private/conf/.repos/github/syoung/envars.sh
echo ", $self->token

reset;
/aguadev/bin/install/deploy.pl \
--mode installPackage \
--opsfile /aguadev/repos/private/syoung/biorepodev/syoung/bioapps/bioapps.ops \
--pmfile /aguadev/repos/private/syoung/biorepodev/syoung/bioapps/bioapps.pm \
--opsrepo biorepodev \
--repository bioappsdev \
--SHOWLOG 4

    OK

**** packages, app AND parameter TABLES ARE POPULATED WITH bioapps DATA **** 


</entry>
<entry [Wed 2013:08:28 01:47:05 EST] TEST Workflow::executeWorkflow>


echo '{"project":"Project1","workflow":"Workflow2","workflownumber":3,"start":"1","stop":"1","username":"admin","sessionid":"9999999999.9999.999","mode":"executeWorkflow","module":"Agua::Workflow","submit":0,"cluster":""}' | ./agua.pl


echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":"1","stop":"1","username":"guest","sessionid":"1377679485.1507.43","mode":"executeWorkflow","module":"Agua::Workflow","submit":0,"cluster":"","SHOWLOG":4}' | ./agua.pl



echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":2,"stop":2,"username":"guest","sessionid":"1377683725.1323.43","mode":"executeWorkflow","module":"Agua::Workflow","submit":0,"cluster":"","SHOWLOG":4}' | ./agua.pl



emacs -nw /aguadev/apps/bioapps/bin/test/sleep.sh

    #!/bin/bash
        
    hostname -f 
    date
        
    SLEEP=", $self->1;
    sleep $SLEEP;
    
    echo "Completed"

    
</entry>
<entry [Wed 2013:08:21 22:06:17 EST] TEST LOGIN>


echo '{"mode":"submitLogin","module":"Agua::Workflow","password":"guest","username":"guest","SHOWLOG":4}' | ./agua.pl


</entry>
<entry [Tue 2013:07:30 01:13:21 EST] TEST Agua::Upload>

export CONTENT_TYPE="multipart/form-data; boundary=------WebKitFormBoundaryKKwXU7fTbLCuzcck"

mysql>
insert into sessions values ('admin', '0000000000.0000.000', NOW());


reset; ./upload.pl < /aguadev/t/bin/Agua/Upload/inputs/missing-payload


    OK
    
    
    
</entry>
<entry [Fri 2013:07:19 01:44:08 EST] TEST View.pm (addView, addViewFeature, updateViewTracklist, updateViewLocation) AND View.js (_handleAddView) >


MANUAL FIRE addViewFeature




echo '{"mode":"addViewFeature","feature":"control1","sourceproject":"Project2","sourceworkflow":"Parkinsons","species":"human","build":"hg19","build":"hg19","callback":"_handleAddViewFeature","module":"Agua::View","project":"Project1","sessionid":"9999999999.9999.999","sourceid":"plugins_view_View_0","token":"abcdefghijklmnop","username":"aguatest","view":"View2","SHOWLOG":4}' | ./agua.pl



MANUAL FIRE addView

echo '{"build":"hg19","callback":"_handleAddView","mode":"addView","module":"Agua::View","project":"Project1","sessionid":"9999999999.9999.999","sourceid":"plugins_view_View_0","species":"human","token":"abcdefghijklmnop","username":"aguatest","view":"View4","SHOWLOG":4}' | ./agua.pl


build: "hg19"
callback: "_handleAddView"
mode: "addView"
module: "Agua::View"
project: "Project1"
sessionid: "9999999999.9999.999"
sourceid: "plugins_view_View_0"
species: "human"
token: "abcdefghijklmnop"
username: "aguatest"
view: "View4"


addView

echo '{"sourceid":"plugins_view_View_0","callback":"_handleAddView","token":"abcdefghijklmnop","build":"hg19","mode":"addView","module":"Agua::View","project":"Project1","sessionid":"9999999999.9999.999","species":"human","username":"admin","view":"View2","SHOWLOG":4}' | ./agua.pl


build: "hg19"
mode: "addView"
module: "Agua::View"
project: "Project1"
sessionid: "9999999999.9999.999"
species: "human"
username: "admin"
view: "View3"






_handleAddView

NB: MUST SET TOKEN IN Agua IN runTests.js SCRIPT

token : "abcdefghijklmnop"


SEND MESSAGE ON COMMAND LINE:

/aguadev/t/bin/Agua/Installer/inputs/emit_log.pl '{"sourceid":"plugins_view_View_0","callback":"_handleAddView","status":"ready","token":"abcdefghijklmnop","viewobject":{"project":"Project1","view":"View2"}}'


RUN addView ON COMMAND LINE:

echo '{"build":"hg19","mode":"viewStatus","module":"Agua::View","project":"Project1","sessionid":"9999999999.9999.999","species":"human","username":"admin","view":"View2","token":"abcdefghijklmnop","sourceid":"plugins_view_View_0","SHOWLOG":4}' | ./agua.pl



{"sourceid":"plugins_view_View_0","callback":"_handleAddView","status":"ready","token":"abcdefghijklmnop","data":{"project":"Project1","view":"View2"}




updateViewTracklist


echo '{"build":"hg19","chromosome":"chr1","datetime":"2013-07-28 03:12:40","mode":"updateViewTracklist","module":"Agua::View","notes":"","project":"Project1","sessionid":"9999999999.9999.999","species":"human","start":"9846475","status":"ready","stop":"112370744","tracks":"knownGene,ccdsGene,dgv,exoniphy","username":"admin","view":"View2","SHOWLOG":4}' | ./agua.pl


echo '{"chromosome":"chr1","datetime":"2013-07-28 03:12:40","mode":"updateViewTracklist","module":"Agua::View","notes":"","project":"Project1","sessionid":"9999999999.9999.999","species":"human","start":"9846475","status":"ready","stop":"112370744","tracks":"knownGene,ccdsGene,dgv","username":"admin","view":"View2","SHOWLOG":4}' | ./agua.pl

chromosome: "chr1"
datetime: "2013-07-28 03:12:40"
mode: "updateViewTracklist"
module: "Agua::View"
notes: ""
project: "Project1"
sessionid: "9999999999.9999.999"
species: "human"
start: "9846475"
status: "ready"
stop: "112370744"
tracks: "knownGene,ccdsGene,dgv"
username: "admin"
view: "View2"



echo '{"build":"hg19","chromosome":"chr1","datetime":"2010-06-15 18:59:15","mode":"updateViewTracklist","module":"Agua::View","notes":"Volvox sample data","project":"Project1","sessionid":"9999999999.9999.999","species":"volvox","start":"1000","stop":"20000","tracklist":["DNA"],"tracks":"Reference sequence,Test SNPs,Protein-coding genes,Example Features,Predicted genes,BigWig Density - volvox_microarray,BAM - volvox-sorted SNPs/Coverage,BigWig XY - volvox_sine,VCF - additional test data,Image - volvox_microarray.wig,BAM - volvox-sorted.bam,Fingerprinted BACs","username":"aguatest","view":"View3","SHOWLOG":4}' | ./agua.pl

build: "hg19"
chromosome: "chr1"
datetime: "2010-06-15 18:59:15"
mode: "updateViewTracklist"
module: "Agua::View"
notes: "Volvox sample data"
project: "Project1"
sessionid: "9999999999.9999.999"
species: "volvox"
start: "1000"
stop: "20000"
tracklist: [DNA]
tracks: "Reference sequence,Test SNPs,Protein-coding genes,Example Features,Predicted genes,BigWig Density - volvox_microarray,BAM - volvox-sorted SNPs/Coverage,BigWig XY - volvox_sine,VCF - additional test data,Image - volvox_microarray.wig,BAM - volvox-sorted.bam,Fingerprinted BACs"
username: "aguatest"
view: "View3"


updateViewLocation

echo '{"build":"hg19","chromosome":"chr1","datetime":"2011-05-25 15:52:40","mode":"updateViewLocation","module":"Agua::View","notes":"Notes for Project1.View2","project":"Project1","sessionid":"9999999999.9999.999","species":"human","start":9846475,"stop":112370744,"tracks":"vegaGene","username":"aguatest","view":"View2","SHOWLOG":4}' | ./agua.pl


build: "hg19"
chromosome: "chr1"
datetime: "2011-05-25 15:52:40"
mode: "updateViewLocation"
module: "Agua::View"
notes: "Notes for Project1.View2"
project: "Project1"
sessionid: "9999999999.9999.999"
species: "human"
start: 9846475
stop: 112370744
tracks: "vegaGene"
username: "aguatest"
view: "View2"


viewStatus

build: "hg19"
mode: "viewStatus"
module: "Agua::View"
project: "Project1"
sessionid: "9999999999.9999.999"
species: "human"
username: "admin"
view: "View2"


echo '{"build":"hg19","mode":"viewStatus","module":"Agua::View","project":"Project1","sessionid":"9999999999.9999.999","species":"human","username":"admin","view":"View2","SHOWLOG":4}' | ./agua.pl


    
</entry>
<entry [Mon 2013:07:08 20:26:03 EST] DEPLOY EMBOSS>

INSERT INTO hub TABLE:

 insert into hub values ('admin', 'syoung', 'github', '3b30695c9768c03731abfe78c9c66227e55d8e9a', 1, '/aguadev/conf/.repos/github/syoung/id_rsa', '');

 
CHANGE TO ROOT:

sudo su

SET ENVIRONMENT VARIABLES:

source /home/syoung/notes/agua/private/conf/.repos/github/syoung/envars.sh


RUN DEPLOY.PL:

sudo ./deploy.pl (), "\
--mode installPackage \
--opsfile /aguadev/repos/private/syoung/biorepodev/syoung/emboss/emboss.ops \
--pmfile /aguadev/repos/private/syoung/biorepodev/syoung/emboss/emboss.pm \
--opsrepo biorepodev \
--SHOWLOG 4


WHICH RUNS OPS.PL:
    
/mnt/repos/private/syoung/aguadev/bin/install/../logic/ops.pl \
biorepodev install \
--owner agua \
--username admin \
--repository biorepodev \
--package emboss \
--installdir /aguadev/apps/emboss \
--logfile /tmp/agua-biorepodev.install.log \
--opsdir /aguadev/repos/private/syoung/biorepodev/syoung/emboss \
--SHOWLOG 4




</entry>
<entry [Fri 2013:05:17 10:30:40 EST] DUMP getData>


echo '{"mode": "getData","module": "Infusion::Base","sessionid": "0000000000.0000.000","token": "T61P7mI0pJORJC51","username": "admin","SHOWLOG":4}' | ./infusion.pl > /tmp/getData.json

    
</entry>
<entry [Thu 2013:05:16 17:04:01 EST] TEST updateFlowcell>

echo '{"data":{"attempting_rehyb":"","comments":"","description":"","fail_code_id":"","flowcell_barcode":"C07ATACXX","flowcell_id":"133","fpga_version":"3.2.06","indexed":"no","lcm_broad_cause":"","lcm_comments":"","lcm_equipment_related":"","lcm_specific_cause":"","lcm_status":"","location":"/isilon/RUO/Runs/110922_SN1012_0086_BC07ATACXX_Pfizer317576","location_md5sum":"8761b5d98f3644a9e0fd1537c5ff013e","machine_name":"SN1012","operator":"","priority_flowcell":"0","recipe":"","rta_version":"1.12.4.2","run_length":"101,101","run_start_date":"0000-00-00","server":"uscp-prd-lndt-1-2.local","status_id":"","update_timestamp":"2013-02-17 23:33:50","user_code_and_ip":""}, "mode": "updateFlowcell","module": "Infusion::Base","sessionid": "0000000000.0000.000","token": "T61P7mI0pJORJC51","username": "admin","SHOWLOG":4}' | ./infusion.pl


attempting_rehyb: "0"
comments: ""
description: ""
flowcell_barcode: ""
flowcell_id: ""
fpga_version: ""
indexed: "no"
lcm_broad_cause: ""
lcm_comments: ""
lcm_equipment_related: ""
lcm_specific_cause: ""
lcm_status: ""
location: ""
machine_name: ""
priority_flowcell: ""
rta_version: ""
run_length: ""
run_start_date: ""
server: ""
status: "run_failed"
status_id: "8"
symptoms: "Computer Freeze"
update_timestamp: ""
mode: "updateFlowcell"
module: "Infusion::Base"


</entry>
<entry [Sat 2013:05:11 23:31:07 EST] TEST updateProject>

echo '{"data":{"build_location":"","build_version":"NCBI36","data_analyst":"ss","dbsnp_version":"129","description":"","include_NPF":"","project_id":"5","project_manager":"ss","project_name":"CHOP_Cheung_2","project_policy":"build_type:local"},"module":"Base","mode":"updateProject","sessionid":"0000000000.0000.000","taskid":"GSNJaPrjUgFLMZiX","token":"7fl7wxpqoWPU56tk","username":"admin","SHOWLOG":4}' | ./infusion.pl



{
    "data": {
        "build_location": "",
        "build_version": "NCBI36",
        "data_analyst": "ss",
        "dbsnp_version": "129",
        "description": "",
        "include_NPF": "",
        "project_id": "5",
        "project_manager": "ss",
        "project_name": "CHOP_Cheung_2",
        "project_policy": "build_type: local"
    },
    "module": "Base",
    "mode": "updateProject",
    "sessionid": "0000000000.0000.000",
    "taskid": "GSNJaPrjUgFLMZiX",
    "token": "7fl7wxpqoWPU56tk",
    "username": "admin"
}
    

</entry>
<entry [Sat 2013:05:11 07:17:33 EST] TEST UPLOAD ERROR DISPLAY>


cd /aguadev/private/bin/test/perl/NetRabbitFoot

./emit_log.pl '{"error":"Some error message","params":{"token":"1fyv2eUk0xsoSzip","mode":"manifest"}}'


    
</entry>
<entry [Wed 2013:05:08 15:52:50 EST] UPLOAD - PRINT OUT INPUT DATA>

	
#### DEBUG
", $self->/ = undef;
my $contents = <$stdin>;
$self->logDebug("contents", $contents);
my $outfile = "/tmp/parseparams.temp";
open(OUT, ">$outfile") or die "Can't open outfile: $outfile(), "\n";
print OUT ", $self->contents;
#print OUT `env`;
close(OUT);
$self->logDebug("DEBUG EXIT") and exit;


    
</entry>
<entry [Sat 2013:01:19 03:17:34 EST] Workflow::fileSystem ERROR: BACKSLASH>

PROBLEM

reset; echo '{"username":"admin","sessionid":"1358582162.20924.626","mode":"getFileCaches","module":"Workflow","SHOWLOG":4,"query":""}' | ./workflow.pl

    2013-01-19 03:18:49    [DEBUG]   	Agua::Common::File::fileJson	643	AFTER jsonSafe, sample: @HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;(), "\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    2013-01-19 03:18:49    [DEBUG]   	Agua::Common::File::fileJson	652	json: {
        "name": "run3-s_1_sequence.txt",
        "path": "/data/sequence/demo/runs/run3/run3-s_1_sequence.txt",
        "parentPath": "/data/sequence/demo/runs/run3",
        "parentDir": "/data/sequence/demo/runs/run3",
        "directory": false,
        "size": "264466702",
        "modified": 1358547292,
        "sample": "@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",     "bytes" : "200" }
    2013-01-19 03:18:49    [DEBUG]   	Agua::Common::File::recursiveFileCaches	213	json: {"name":"run3","path":"run3","total":"2","items":[{"name":"run3-s_1_sequence.10000.txt","path":"/data/sequence/demo/runs/run3/run3-s_1_sequence.10000.txt","parentPath":"/data/sequence/demo/runs/run3","parentDir":"/data/sequence/demo/runs/run3","directory":false,"size":"13957202","modified":1358547292,"sample":"@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","bytes":"200"},{"name":"run3-s_1_sequence.txt","path":"/data/sequence/demo/runs/run3/run3-s_1_sequence.txt","parentPath":"/data/sequence/demo/runs/run3","parentDir":"/data/sequence/demo/runs/run3","directory":false,"size":"264466702","modified":1358547292,"sample":"@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","bytes":"200"}]}
    2013-01-19 03:18:49    [DEBUG]   	Agua::Common::File::recursiveFileCaches	214	SETTING FILECACHE->/data/sequence/demo/runs/run3
    illegal backslash escape sequence in string, at character offset 431 (before "\\X\\XZ\\&#93;&#93;X...") at (eval 675) line 161.


{"name":"run3","path":"run3","total":"2","items":[{"name":"run3-s_1_sequence.10000.txt","path":"/data/sequence/demo/runs/run3/run3-s_1_sequence.10000.txt","parentPath":"/data/sequence/demo/runs/run3","parentDir":"/data/sequence/demo/runs/run3","directory":false,"size":"13957202","modified":1358547292,"sample":"@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","bytes":"200"},{"name":"run3-s_1_sequence.txt","path":"/data/sequence/demo/runs/run3/run3-s_1_sequence.txt","parentPath":"/data/sequence/demo/runs/run3","parentDir":"/data/sequence/demo/runs/run3","directory":false,"size":"264466702","modified":1358547292,"sample":"@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","bytes":"200"}]}


DIAGNOSIS

reset; echo '{"username":"admin","sessionid":"1358582162.20924.626","mode":"fileSystem","module":"Workflow","SHOWLOG":4,"location":"/data/sequence/demo/runs/run3/run3-s_1_sequence.txt","query":""}' | ./workflow.pl


2013-01-19 03:16:56    [DEBUG]   	Agua::Common::File::fileJson	652	json: {
    "name": "run3-s_1_sequence.txt",
    "path": "/data/sequence/demo/runs/run3/run3-s_1_sequence.txt",
    "parentPath": "/data/sequence/demo/runs/run3",
    "parentDir": "/data/sequence/demo/runs/run3",
    "directory": false,
    "size": "264466702",
    "modified": 1358547181,
    "sample": "@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",     "bytes" : "200" }
{"name":"run3-s_1_sequence.txt","path":"/data/sequence/demo/runs/run3/run3-s_1_sequence.txt","parentPath":"/data/sequence/demo/runs/run3","parentDir":"/data/sequence/demo/runs/run3","directory":false,"size":"264466702","modified":1358547181,"sample":"@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA","bytes":"200"}total: 0
Doing EXITLABEL


SOLUTION


http://search.cpan.org/dist/JSON/lib/JSON/backportPP.pm

USE BACKPORT JSON::PP

Basically, check to JSON or JSON::XS.

new

    ", $self->json = JSON::PP->new
Rturns a new JSON::PP object that can be used to de/encode JSON strings.

All boolean flags described below are by default disabled.

The mutators for flags all return the JSON object again and thus calls can be chained:

   my $json = JSON::PP->new->utf8->space_after->encode({a => [1,2]})
   => {"a": [1, 2]}
ascii

    $json = $json->ascii([$enable])
    
    $enabled = $json->get_ascii
If $enable is true (or missing), then the encode method will not generate characters outside the code range 0..127. Any Unicode characters outside that range will be escaped using either a single (), "\uXXXX or a double \uHHHH\uLLLLL escape sequence, as per RFC4627. (See to "OBJECT-ORIENTED INTERFACE" in JSON::XS).

In Perl 5.005, there is no character having high value (more than 255). See to "UNICODE HANDLING ON PERLS".

If ", $self->enable is false, then the encode method will not escape Unicode characters unless required by the JSON syntax or other flags. This results in a faster and more compact format.

  JSON::PP->new->ascii(1)->encode([chr 0x10401])
  => ["(), "\ud801\udc01"]
latin1

    ", $self->json = $json->latin1([$enable])
    
    $enabled = $json->get_latin1

    
    

    
</entry>
<entry [Sat 2013:01:19 01:21:57 EST] TEST agua.pl>
    
COMAND LINE

echo '{"username":"admin","mode":"test","module":"Workflow","sessionid":"9999999999.9999.999"}' | ./agua.pl c


BROWSER
    
Agua.doPut({query:{"username":"admin","mode":"test","module":"Workflow","sessionid":"9999999999.9999.999"},url:"../../cgi-bin/agua/agua.cgi"});
    
    
</entry>
<entry [Sat 2013:01:12 20:00:50 EST] TEST executeWorkflow WITH novoIndex.pl>

echo '{"project":"BuildReference","workflow":"NOVOALIGN","workflownumber":"1","start":"3","stop":"3","username":"admin","sessionid":"1358012860.1751.763","mode":"executeWorkflow","submit":0,"cluster":"","SHOWLOG":4}' |  ./workflow.pl



    
</entry>
<entry [Fri 2013:01:11 19:47:06 EST] TEST showResponse IN Workflow PANE Status PANEL>

IN FIREBUG:

console.clear();

var response = {"queuestatus":{"status":"","queue":"NO QUEUE INFORMATION AVAILABLE"},"stagestatus":{"workflow":"NOVOALIGN","status":"","project":"BuildReference","stages":[{"stagedescription":"","stagepid":"3563","number":"1","status":"completed","project":"BuildReference","submit":"0","workflowpid":"0","stagenotes":"","stagename":"","stagejobid":"0","completed":"2013-01-11 11:18:05","owner":"agua","workflownumber":"5","cluster":"","stderrfile":"/home/admin/agua/BuildReference/NOVOALIGN/stdout/1-FTP.stderr","location":"bin/utils/FTP.pl","version":"0.6.0","installdir":"/agua/apps/bioapps","executor":"/usr/bin/perl","name":"FTP","stdoutfile":"/home/admin/agua/BuildReference/NOVOALIGN/stdout/1-FTP.stdout","package":"bioapps","username":"admin","workflow":"NOVOALIGN","now":"2013-01-11 22:29:35","started":"2013-01-11 11:16:49","type":"utility","queued":"0000-00-00 00:00:00"},{"stagedescription":"","stagepid":"1785","number":"2","status":"completed","project":"BuildReference","submit":"0","workflowpid":"0","stagenotes":"","stagename":"","stagejobid":"0","completed":"2013-01-11 11:20:37","owner":"agua","workflownumber":"5","cluster":"","stderrfile":"/home/admin/agua/BuildReference/NOVOALIGN/stdout/2-unzipFiles.stderr","location":"bin/utils/unzipFiles.pl","version":"0.6.0","installdir":"/agua/apps/bioapps","executor":"/usr/bin/perl","name":"unzipFiles","stdoutfile":"/home/admin/agua/BuildReference/NOVOALIGN/stdout/2-unzipFiles.stdout","package":"bioapps","username":"admin","workflow":"NOVOALIGN","now":"2013-01-11 22:29:35","started":"2013-01-11 11:20:26","type":"utility","queued":"0000-00-00 00:00:00"},{"stagedescription":"","stagepid":"1785","number":"3","status":"error","project":"BuildReference","submit":"0","workflowpid":"0","stagenotes":"","stagename":"","stagejobid":"0","completed":"2013-01-11 11:21:52","owner":"agua","workflownumber":"1","cluster":"","stderrfile":"/home/admin/agua/BuildReference/NOVOALIGN/stdout/3-novoIndex.stderr","location":"bin/converters/novoIndex.pl","version":"0.8.0-alpha.1+build.4","installdir":"/agua/apps/bioapps","executor":"/usr/bin/perl","name":"novoIndex","stdoutfile":"/home/admin/agua/BuildReference/NOVOALIGN/stdout/3-novoIndex.stdout","package":"bioapps","username":"admin","workflow":"NOVOALIGN","now":"2013-01-11 22:29:35","started":"2013-01-11 11:21:48","type":"converter","queued":"0000-00-00 00:00:00"}]},"clusterstatus":{"cluster":"","balancer":"","status":"","log":"NO CLUSTER OUTPUT","list":"NO CLUSTER OUTPUT"}};
var controller = Agua.controllers["workflow"];
var workflow = controller.tabPanes[0];
console.dir({workflow:workflow});
var status = workflow.core.runStatus;
console.dir({status:status});

//var runner = status.createRunner(1,1);
//status.showStatus(runner, response);

var stageStatus = status.stageStatus;
console.dir({stageStatus:stageStatus});

stageStatus.displayStagesStatus = function (stages) {
	console.log("StageStatus.displayStagesStatus    stages:");
	console.dir({stages:stages});
	console.log("StageStatus.displayStagesStatus    this.stageTable:");
	console.dir({this_stageTable:this.stageTable});
	
    if ( ! stages )  return;
    
	// SET THE NODE CLASSES BASED ON STATUS
    this.rows = [];
	for ( var i = 0; i < stages.length; i++ )
	{
		console.log("StageStatus.displayStatus     Doing stages[" + i + "]: ");
		console.dir({stage:stages[i]});

		var tr = document.createElement('tr');
		this.stageTable.appendChild(tr);
		
		stages[i].duration = this.calculateDuration(stages[i]);
		//console.log("StageStatus.displayStatus     stages[i].duration: " + stages[i].duration);

		stages[i].lapsed = this.calculateLapsed(stages[i]);
		//console.log("StageStatus.displayStatus     stages[i].lapsed: " + stages[i].lapsed);

		if ( stages[i].completed == "0000-00-00 00:00:00" )
			stages[i].completed = '';
		if ( stages[i].queued == "0000-00-00 00:00:00" )
			stages[i].queued = '';
		
		stages[i].core = this.core;
		var stagestatusRow = new plugins.workflow.RunStatus.StageStatusRow(stages[i]);
		
		console.log("StageStatus.displayStatus     stagestatusRow:");
		console.dir({stagestatusRow:stagestatusRow});
		
        this.rows.push(stagestatusRow);

		var td = document.createElement('td');
		tr.appendChild(td);
		td.appendChild(stagestatusRow.domNode);
	}
	console.groupEnd("StageStatus-" + this.id + "    displayStatus");
};

//stageStatus.displayStatus(response.stagestatus);

console.log("stageStatus.attachNode: ");

console.dir({stageStatus_attachNode:stageStatus.attachNode});

console.log("stageStatus.attachNode:   DOING stageStatus.attachNode.appendChild(stageStatus.stageTable)");
stageStatus.attachNode.appendChild(stageStatus.stageTable);
console.dir({stageStatus_stageTable:stageStatus.stageTable});



</entry>
<entry [Sat 2013:01:05 02:31:59 EST] TEST App.saveApp IN Apps PANE>

echo '{"username":"admin","sessionid":"9999999999.9999.999","mode":"saveApp","data":{"name":"testapp","type":"automaton","executor":"/usr/bin/perl","package":"secondapps","location":"bin/automaton","localonly":0,"description":"Desc of automaton","notes":"Notes for automaton","url":"http://all.atomatons.com"},"SHOWLOG":4}' | ./admin.pl


    
</entry>
<entry [Sat 2013:01:05 02:07:03 EST] FIX Apps CONTROLLER createTab>
    
console.clear();
dojo.reload("plugins.apps.Controller");
dojo.reload("plugins.apps.App");
dojo.reload("plugins.apps.Apps");
dojo.reloadPage();
    
</entry>
<entry [Thu 2013:01:03 21:26:16 EST] TEST getApps AND getSharedApps AFTER ADDING 'APPSPACKAGE' AND 'SHAREDPACKAGES' TO default.conf>
    
getApps

clear; echo '{"username":"admin","sessionid":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getTable","table":"apps","SHOWLOG":4}' | ./workflow.pl
    
getSharedApps

clear; echo '{"username":"admin","sessionid":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getTable","table":"sharedApps","SHOWLOG":4}' | ./workflow.pl



</entry>
<entry [Wed 2012:12:26 05:46:34 EST] TEST folders.cgi>

reset; echo '{"mode":"fileSystem","username":"admin","sessionid":"1356512830.12883.122","url":null,"path":"Project3","query":"Project3/JBrowse/jbrowse.ok/test/data/tracks","SHOWLOG":4}' | ./workflow.pl
    
</entry>
<entry [Sun 2012:12:23 04:29:55 EST] TEST FIREBUG TEMPLATE Agua.doPut>
    

console.clear();
Agua.doPut({
    query:{
"project":"Project2",
"view":"Parkinsons",
"feature":"control1",
"sourceproject":"Project2",
"sourceworkflow":"Parkinsons",
"species":"human",
"build":"hg19",
"username":"admin",
"sessionid":"9999999999.9999.999",
"mode":"addViewFeature",
"SHOWLOG":2
    },
    url : "../cgi-bin/agua/view.cgi"
});


</entry>
<entry [Sat 2012:12:15 12:55:40 EST] TEST removeView>


echo '{"project":"Project1","view":"View1","species":"human","build":"hg19","mode":"removeView","username":"admin","sessionid":"9999999999.9999.999","SHOWLOG":4}' | ./view.pl

    
</entry>
<entry [Thu 2012:12:13 00:30:39 EST] ADD TO .gitattributes FAILING TESTS LIST BEFORE RELEASE 0.8.0-beta.1+build.1>

cd /agua/t
emacs -nw .gitattributes

bin/Agua/Common/Package/Default     export-ignore
bin/Agua/Configure                  export-ignore
bin/Agua/Ops/Install                export-ignore
bin/Agua/Ops/Sge                    export-ignore
bin/Agua/Ops/Version                export-ignore
bin/Agua/StarCluster/Instance       export-ignore
bin/Agua/Uml/Class                  export-ignore
bin/Agua/Uml/Uml                    export-ignore
bin/Agua/Upload                     export-ignore
bin/Agua/Workflow                   export-ignore



cd ./bin/Agua/Common/Package/Default; prove --blib --verbose *.t; cd ../../../../..
Default.t .. 
1..6
# Test defaultPackages
ok 1 - correct package information: apps
ok 2 - correct package information: apps
ok 3 - correct package information: workflows
ok 4 - correct package information: workflows
{"error":"undefined values: version","subroutine":"Agua::Common::Base::_addToTable","linenumber":"277","filename":"/agua/lib/Agua/Common/Base.pm","timestamp":"2012-12-12 23:10:33"}
Can't find label EXITLABEL at /agua/lib/Agua/Common/Logger.pm line 339.
# Looks like you planned 6 tests but ran 4.
# Looks like your test exited with 255 just after 4.
Dubious, test returned 255 (wstat 65280, 0xff00)
Failed 2/6 subtests 

Test Summary Report
-------------------
Default.t (Wstat: 65280 Tests: 4 Failed: 0)
  Non-zero exit status: 255
  Parse errors: Bad plan.  You planned 6 tests but ran 4.
Files=1, Tests=4, 16 wallclock secs ( 0.08 usr  0.02 sys + 12.85 cusr  0.46 csys = 13.41 CPU)
Result: FAIL


cd ./bin/Agua/Configure; prove --blib --verbose *.t; cd ../../..
Configure.t .. # Test enableSsh

ok 1 - enableSsh    correct value for PasswordAuthentication
ok 2 - enableSsh    authenticates for root user
# Test disableSsh
ok 3 - disableSsh    correct value for PasswordAuthentication
ok 4 - enableSsh    authenticates for root user
# Tests were run but no plan was declared and done_testing() was not seen.
All 4 subtests passed 

Test Summary Report
-------------------
Configure.t (Wstat: 0 Tests: 4 Failed: 0)
  Parse errors: No plan found in TAP output
Files=1, Tests=4, 16 wallclock secs ( 0.08 usr  0.01 sys +  8.11 cusr  0.35 csys =  8.55 CPU)
Result: FAIL



cd ./bin/Agua/Ops/Install; prove --blib --verbose *.t; cd ../../../..
Install.t .. 
1..9
ok 1 - updateConfig    expected file output
ok 2 - loadConfig    expected file output
# Test parseReport
ok 3 - correct version: 0.8.0-alpha.1+build7
ok 4 - correct version: 0.8.0-alpha.1+build7
ok 5 - correct version: 0.7.2
# Test installAgua
Cloning from remote repo: agua (owner: agua)
ok 6 - install    installed version
ok 7 - install    package table entry
# Test installBioApps
Cloning from remote repo: bioapps (owner: agua)
ok 8 - install    installed version
ok 9 - install    package table entry
# Test installTests
Cloning from remote repo: aguatestdev (owner: agua)
ok 10 - install    installed version
ok 11 - install    package table entry
# Looks like you planned 9 tests but ran 11.
Dubious, test returned 255 (wstat 65280, 0xff00)
All 9 subtests passed 

Test Summary Report
-------------------
Install.t (Wstat: 65280 Tests: 11 Failed: 2)
  Failed tests:  10-11
  Non-zero exit status: 255
  Parse errors: Bad plan.  You planned 9 tests but ran 11.
Files=1, Tests=11, 177 wallclock secs ( 0.08 usr  0.02 sys + 50.21 cusr 23.16 csys = 73.47 CPU)
Result: FAIL


cd ./bin/Agua/Ops/Sge; prove --blib --verbose *.t; cd ../../../..
Sge.t .. 
1..2
# Testing sgeProcessListening
Can't locate object method "timeoutCommand" via package "Test::Agua::Ops::Sge" at /agua/lib/Agua/Ops/Sge.pm line 66.
# Looks like your test exited with 25 before it could output anything.
Dubious, test returned 25 (wstat 6400, 0x1900)
Failed 2/2 subtests 

Test Summary Report
-------------------
Sge.t (Wstat: 6400 Tests: 0 Failed: 0)
  Non-zero exit status: 25
  Parse errors: Bad plan.  You planned 2 tests but ran 0.
Files=1, Tests=0,  7 wallclock secs ( 0.09 usr  0.01 sys +  5.81 cusr  0.25 csys =  6.16 CPU)
Result: FAIL




cd ./bin/Agua/Ops/Version; prove --blib --verbose *.t; cd ../../../..
Version.t .. 
1..230
# Test parseSemVer
ok 1 - parseSemVer    1.0.0-alpha
ok 2 - parseSemVer    1.0.0-alpha.1
ok 3 - parseSemVer    1.0.0-beta.2
ok 4 - parseSemVer    1.0.0-beta.11
ok 5 - parseSemVer    1.0.0-rc.1
ok 6 - parseSemVer    1.0.0-rc.1+build.1
ok 7 - parseSemVer    1.0.0
ok 8 - parseSemVer    1.0.0+0.3.7
ok 9 - parseSemVer    1.3.7+build
ok 10 - parseSemVer    1.3.7+build.2.b8f12d7
ok 11 - parseSemVer    1.3.7+build.11.e0f985a
currentversion: 1.3.7+build.11.e0f985a
# Test incrementSemVer
ok 12 - incrementSemVer    1.3.7+build.11.e0f985a --> 2.0.0 (major, undef)
ok 13 - incrementSemVer    1.3.7+build.11.e0f985a --> 1.4.0 (minor, undef)
ok 14 - incrementSemVer    1.3.7+build.11.e0f985a --> 1.3.8 (patch, undef)
ok 15 - incrementSemVer    1.3.7+build.11.e0f985a --> undef (release, undef)
ok 16 - incrementSemVer    1.3.7+build.11.e0f985a --> 1.3.7+build.12 (build, undef)
ok 17 - incrementSemVer    1.3.7+build.11.e0f985a --> undef (build, alpha)
ok 18 - incrementSemVer    1.3.7+build.11.e0f985a --> 2.0.0-alpha.1 (major, alpha)
ok 19 - incrementSemVer    1.3.7+build.11.e0f985a --> undef (undef, beta)
ok 20 - incrementSemVer    1.3.7+build.11.e0f985a --> undef (undef, rc)
currentversion: 1.0.0-alpha.1
ok 21 - incrementSemVer    1.0.0-alpha.1 --> 2.0.0 (major, undef)
ok 22 - incrementSemVer    1.0.0-alpha.1 --> 1.1.0 (minor, undef)
ok 23 - incrementSemVer    1.0.0-alpha.1 --> 1.0.1 (patch, undef)
ok 24 - incrementSemVer    1.0.0-alpha.1 --> 1.0.0-alpha.2 (release, undef)
ok 25 - incrementSemVer    1.0.0-alpha.1 --> 1.0.0-alpha.1+build.1 (build, undef)
ok 26 - incrementSemVer    1.0.0-alpha.1 --> undef (build, alpha)
ok 27 - incrementSemVer    1.0.0-alpha.1 --> 2.0.0-alpha.1 (major, alpha)
ok 28 - incrementSemVer    1.0.0-alpha.1 --> 1.0.0-beta.1 (undef, beta)
ok 29 - incrementSemVer    1.0.0-alpha.1 --> 1.0.0-rc.1 (undef, rc)
currentversion: 1.0.0-beta.2
ok 30 - incrementSemVer    1.0.0-beta.2 --> 2.0.0 (major, undef)
ok 31 - incrementSemVer    1.0.0-beta.2 --> 1.1.0 (minor, undef)
ok 32 - incrementSemVer    1.0.0-beta.2 --> 1.0.1 (patch, undef)
ok 33 - incrementSemVer    1.0.0-beta.2 --> 1.0.0-beta.3 (release, undef)
ok 34 - incrementSemVer    1.0.0-beta.2 --> 1.0.0-beta.2+build.1 (build, undef)
ok 35 - incrementSemVer    1.0.0-beta.2 --> undef (build, alpha)
ok 36 - incrementSemVer    1.0.0-beta.2 --> 2.0.0-alpha.1 (major, alpha)
ok 37 - incrementSemVer    1.0.0-beta.2 --> undef (undef, beta)
ok 38 - incrementSemVer    1.0.0-beta.2 --> 1.0.0-rc.1 (undef, rc)
currentversion: 1.0.0-rc.2
ok 39 - incrementSemVer    1.0.0-rc.2 --> 2.0.0 (major, undef)
ok 40 - incrementSemVer    1.0.0-rc.2 --> 1.1.0 (minor, undef)
ok 41 - incrementSemVer    1.0.0-rc.2 --> 1.0.1 (patch, undef)
ok 42 - incrementSemVer    1.0.0-rc.2 --> 1.0.0-rc.3 (release, undef)
ok 43 - incrementSemVer    1.0.0-rc.2 --> 1.0.0-rc.2+build.1 (build, undef)
ok 44 - incrementSemVer    1.0.0-rc.2 --> undef (build, alpha)
ok 45 - incrementSemVer    1.0.0-rc.2 --> 2.0.0-alpha.1 (major, alpha)
ok 46 - incrementSemVer    1.0.0-rc.2 --> undef (undef, beta)
ok 47 - incrementSemVer    1.0.0-rc.2 --> undef (undef, rc)
currentversion: 1.0.0-rc.2+build.5
ok 48 - incrementSemVer    1.0.0-rc.2+build.5 --> 2.0.0 (major, undef)
ok 49 - incrementSemVer    1.0.0-rc.2+build.5 --> 1.1.0 (minor, undef)
ok 50 - incrementSemVer    1.0.0-rc.2+build.5 --> 1.0.1 (patch, undef)
ok 51 - incrementSemVer    1.0.0-rc.2+build.5 --> 1.0.0-rc.3 (release, undef)
ok 52 - incrementSemVer    1.0.0-rc.2+build.5 --> 1.0.0-rc.2+build.6 (build, undef)
ok 53 - incrementSemVer    1.0.0-rc.2+build.5 --> undef (build, alpha)
ok 54 - incrementSemVer    1.0.0-rc.2+build.5 --> 2.0.0-alpha.1 (major, alpha)
ok 55 - incrementSemVer    1.0.0-rc.2+build.5 --> undef (undef, beta)
ok 56 - incrementSemVer    1.0.0-rc.2+build.5 --> undef (undef, rc)
currentversion: 1.0.0
ok 57 - incrementSemVer    1.0.0 --> 2.0.0 (major, undef)
ok 58 - incrementSemVer    1.0.0 --> 1.1.0 (minor, undef)
ok 59 - incrementSemVer    1.0.0 --> 1.0.1 (patch, undef)
ok 60 - incrementSemVer    1.0.0 --> undef (release, undef)
ok 61 - incrementSemVer    1.0.0 --> 1.0.0+build.1 (build, undef)
ok 62 - incrementSemVer    1.0.0 --> undef (build, alpha)
ok 63 - incrementSemVer    1.0.0 --> 2.0.0-alpha.1 (major, alpha)
ok 64 - incrementSemVer    1.0.0 --> undef (undef, beta)
ok 65 - incrementSemVer    1.0.0 --> undef (undef, rc)
# Test incrementVersion
currentversion: 1.3.7+build.11.e0f985a
ok 66 - incrementVersion    1.3.7+build.11.e0f985a --> 2.0.0 (major, undef)
not ok 67 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 68 - incrementVersion    versionfile contents: 2.0.0
ok 69 - incrementVersion    1.3.7+build.11.e0f985a --> 1.4.0 (minor, undef)
not ok 70 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.4.0

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.4.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 71 - incrementVersion    versionfile contents: 1.4.0
ok 72 - incrementVersion    1.3.7+build.11.e0f985a --> 1.3.8 (patch, undef)
not ok 73 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.3.8

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.3.8'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 74 - incrementVersion    versionfile contents: 1.3.8
ok 75 - incrementVersion    1.3.7+build.11.e0f985a --> undef (release, undef)
ok 76 - incrementVersion    1.3.7+build.11.e0f985a --> 1.3.7+build.12 (build, undef)
not ok 77 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.3.7+build.12

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.3.7+build.12'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 78 - incrementVersion    versionfile contents: 1.3.7+build.12
ok 79 - incrementVersion    1.3.7+build.11.e0f985a --> undef (build, alpha)
ok 80 - incrementVersion    1.3.7+build.11.e0f985a --> 2.0.0-alpha.1 (major, alpha)
not ok 81 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 82 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 83 - incrementVersion    1.3.7+build.11.e0f985a --> undef (undef, beta)
ok 84 - incrementVersion    1.3.7+build.11.e0f985a --> undef (undef, rc)
currentversion: 1.0.0-alpha.1
ok 85 - incrementVersion    1.0.0-alpha.1 --> 2.0.0 (major, undef)
not ok 86 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 87 - incrementVersion    versionfile contents: 2.0.0
ok 88 - incrementVersion    1.0.0-alpha.1 --> 1.1.0 (minor, undef)
not ok 89 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 90 - incrementVersion    versionfile contents: 1.1.0
ok 91 - incrementVersion    1.0.0-alpha.1 --> 1.0.1 (patch, undef)
not ok 92 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 93 - incrementVersion    versionfile contents: 1.0.1
ok 94 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-alpha.2 (release, undef)
not ok 95 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-alpha.2

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-alpha.2'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 96 - incrementVersion    versionfile contents: 1.0.0-alpha.2
ok 97 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-alpha.1+build.1 (build, undef)
not ok 98 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-alpha.1+build.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-alpha.1+build.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 99 - incrementVersion    versionfile contents: 1.0.0-alpha.1+build.1
ok 100 - incrementVersion    1.0.0-alpha.1 --> undef (build, alpha)
ok 101 - incrementVersion    1.0.0-alpha.1 --> 2.0.0-alpha.1 (major, alpha)
not ok 102 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 103 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 104 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-beta.1 (undef, beta)
not ok 105 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-beta.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-beta.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 106 - incrementVersion    versionfile contents: 1.0.0-beta.1
ok 107 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-rc.1 (undef, rc)
not ok 108 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-rc.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-rc.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 109 - incrementVersion    versionfile contents: 1.0.0-rc.1
currentversion: 1.0.0-beta.2
ok 110 - incrementVersion    1.0.0-beta.2 --> 2.0.0 (major, undef)
not ok 111 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 112 - incrementVersion    versionfile contents: 2.0.0
ok 113 - incrementVersion    1.0.0-beta.2 --> 1.1.0 (minor, undef)
not ok 114 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 115 - incrementVersion    versionfile contents: 1.1.0
ok 116 - incrementVersion    1.0.0-beta.2 --> 1.0.1 (patch, undef)
not ok 117 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 118 - incrementVersion    versionfile contents: 1.0.1
ok 119 - incrementVersion    1.0.0-beta.2 --> 1.0.0-beta.3 (release, undef)
not ok 120 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-beta.3

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-beta.3'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 121 - incrementVersion    versionfile contents: 1.0.0-beta.3
ok 122 - incrementVersion    1.0.0-beta.2 --> 1.0.0-beta.2+build.1 (build, undef)
not ok 123 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-beta.2+build.1

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-beta.2+build.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 124 - incrementVersion    versionfile contents: 1.0.0-beta.2+build.1
ok 125 - incrementVersion    1.0.0-beta.2 --> undef (build, alpha)
ok 126 - incrementVersion    1.0.0-beta.2 --> 2.0.0-alpha.1 (major, alpha)
not ok 127 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 128 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 129 - incrementVersion    1.0.0-beta.2 --> undef (undef, beta)
ok 130 - incrementVersion    1.0.0-beta.2 --> 1.0.0-rc.1 (undef, rc)
not ok 131 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-rc.1

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-rc.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 132 - incrementVersion    versionfile contents: 1.0.0-rc.1
currentversion: 1.0.0-rc.2
ok 133 - incrementVersion    1.0.0-rc.2 --> 2.0.0 (major, undef)
not ok 134 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 135 - incrementVersion    versionfile contents: 2.0.0
ok 136 - incrementVersion    1.0.0-rc.2 --> 1.1.0 (minor, undef)
not ok 137 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 138 - incrementVersion    versionfile contents: 1.1.0
ok 139 - incrementVersion    1.0.0-rc.2 --> 1.0.1 (patch, undef)
not ok 140 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 141 - incrementVersion    versionfile contents: 1.0.1
ok 142 - incrementVersion    1.0.0-rc.2 --> 1.0.0-rc.3 (release, undef)
not ok 143 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.0-rc.3

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.0-rc.3'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 144 - incrementVersion    versionfile contents: 1.0.0-rc.3
ok 145 - incrementVersion    1.0.0-rc.2 --> 1.0.0-rc.2+build.1 (build, undef)
not ok 146 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.0-rc.2+build.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.0-rc.2+build.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 147 - incrementVersion    versionfile contents: 1.0.0-rc.2+build.1
ok 148 - incrementVersion    1.0.0-rc.2 --> undef (build, alpha)
ok 149 - incrementVersion    1.0.0-rc.2 --> 2.0.0-alpha.1 (major, alpha)
not ok 150 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 151 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 152 - incrementVersion    1.0.0-rc.2 --> undef (undef, beta)
ok 153 - incrementVersion    1.0.0-rc.2 --> undef (undef, rc)
currentversion: 1.0.0-rc.2+build.5
ok 154 - incrementVersion    1.0.0-rc.2+build.5 --> 2.0.0 (major, undef)
not ok 155 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 156 - incrementVersion    versionfile contents: 2.0.0
ok 157 - incrementVersion    1.0.0-rc.2+build.5 --> 1.1.0 (minor, undef)
not ok 158 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 159 - incrementVersion    versionfile contents: 1.1.0
ok 160 - incrementVersion    1.0.0-rc.2+build.5 --> 1.0.1 (patch, undef)
not ok 161 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 162 - incrementVersion    versionfile contents: 1.0.1
ok 163 - incrementVersion    1.0.0-rc.2+build.5 --> 1.0.0-rc.3 (release, undef)
not ok 164 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.0-rc.3

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.0-rc.3'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 165 - incrementVersion    versionfile contents: 1.0.0-rc.3
ok 166 - incrementVersion    1.0.0-rc.2+build.5 --> 1.0.0-rc.2+build.6 (build, undef)
not ok 167 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.0-rc.2+build.6

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.0-rc.2+build.6'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 168 - incrementVersion    versionfile contents: 1.0.0-rc.2+build.6
ok 169 - incrementVersion    1.0.0-rc.2+build.5 --> undef (build, alpha)
ok 170 - incrementVersion    1.0.0-rc.2+build.5 --> 2.0.0-alpha.1 (major, alpha)
not ok 171 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 172 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 173 - incrementVersion    1.0.0-rc.2+build.5 --> undef (undef, beta)
ok 174 - incrementVersion    1.0.0-rc.2+build.5 --> undef (undef, rc)
currentversion: 1.0.0
ok 175 - incrementVersion    1.0.0 --> 2.0.0 (major, undef)
not ok 176 - incrementVersion    tag: 1.0.0 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 177 - incrementVersion    versionfile contents: 2.0.0
ok 178 - incrementVersion    1.0.0 --> 1.1.0 (minor, undef)
not ok 179 - incrementVersion    tag: 1.0.0 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 180 - incrementVersion    versionfile contents: 1.1.0
ok 181 - incrementVersion    1.0.0 --> 1.0.1 (patch, undef)
not ok 182 - incrementVersion    tag: 1.0.0 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 183 - incrementVersion    versionfile contents: 1.0.1
ok 184 - incrementVersion    1.0.0 --> undef (release, undef)
ok 185 - incrementVersion    1.0.0 --> 1.0.0+build.1 (build, undef)
not ok 186 - incrementVersion    tag: 1.0.0 should be newversion: 1.0.0+build.1

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 1.0.0+build.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 187 - incrementVersion    versionfile contents: 1.0.0+build.1
ok 188 - incrementVersion    1.0.0 --> undef (build, alpha)
ok 189 - incrementVersion    1.0.0 --> 2.0.0-alpha.1 (major, alpha)
not ok 190 - incrementVersion    tag: 1.0.0 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 191 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 192 - incrementVersion    1.0.0 --> undef (undef, beta)
ok 193 - incrementVersion    1.0.0 --> undef (undef, rc)
# Test versionSort
ok 194 - versionSort    versions: 0.8.0 0.9.1 0.11.0 1.0.0
ok 195 - versionSort    versions 2: 0.8.0 0.9.1 0.11.0 1.0.0 2.0.0 12.0.0
ok 196 - versionSort    versions: 1.0.0 1.0.0+build1 1.3.7+build.1 1.3.7+build.2.b8f12d7 1.3.7+build.11.e0f985a 2.0.0
ok 197 - versionSort    build permutations: 0.8.0+build1 0.8.0+build2 0.8.0+build11
ok 198 - versionSort    build permutations: 0.8.0+build1 0.8.0+build2 0.8.0+build11
ok 199 - versionSort    build permutations: 0.8.0+build1 0.8.0+build2 0.8.0+build11
ok 200 - versionSort    build vs release: 0.8.0-rc2 0.8.0+build11
ok 201 - versionSort    composite permutations: 0.8.0-alpha 0.8.0-alpha.1 0.8.0-beta 0.8.0-rc2 0.8.0 0.8.0+build1 0.8.0+build11 0.9.1 0.11.0 1.0.0 2.0.0 12.0.0
ok 202 - versionSort    composite permutations: 0.8.0-alpha 0.8.0-alpha.1 0.8.0-beta 0.8.0-rc2 0.8.0 0.8.0+build1 0.8.0+build11 0.9.1 0.11.0 1.0.0 2.0.0 12.0.0
ok 203 - versionSort    composite permutations: 0.8.0-alpha 0.8.0-alpha.1 0.8.0-alpha.2 0.8.0-alpha.12 0.8.0-beta 0.8.0-rc2 0.8.0+build1 0.8.0+build2 0.8.0+build11
ok 204 - versionSort    build vs release: 0.8.0-alpha.1 0.8.0-alpha.1+build.1 0.8.0-beta.1 0.8.0-beta.1+build.1
ok 205 - compare 0.7.2 and 0.6.0
ok 206 - compare 0.6.0 and 0.6.1
ok 207 - compare 0.6.0 and 0.6.0+build.1
ok 208 - compare 0.6.0 and 0.6.0-alpha.1
ok 209 - setVersion    1.3.7+build.11.e0f985a --> 1.2.0
ok 210 - setVersion    1.3.7+build.11.e0f985a --> 1.3.7+build.11
ok 211 - setVersion    1.3.7+build.11.e0f985a --> 1.3.8+build.11
not ok 212 - setVersion    tag: 1.3.7+build.11.e0f985a

#   Failed test 'setVersion    tag: 1.3.7+build.11.e0f985a'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 213 - setVersion    versionfile: 1.3.8+build.11
ok 214 - setVersion    1.3.7+build.11.e0f985a --> 2.0.0-alpha.1
not ok 215 - setVersion    tag: 1.3.7+build.11.e0f985a

#   Failed test 'setVersion    tag: 1.3.7+build.11.e0f985a'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 216 - setVersion    versionfile: 2.0.0-alpha.1
ok 217 - setVersion    1.3.7+build.11.e0f985a --> 0.8.0
ok 218 - setVersion    1.0.0-alpha.1 --> 1.2.0
not ok 219 - setVersion    tag: 1.0.0-alpha.1

#   Failed test 'setVersion    tag: 1.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 220 - setVersion    versionfile: 1.2.0
ok 221 - setVersion    1.0.0-alpha.1 --> 1.3.7+build.11
not ok 222 - setVersion    tag: 1.0.0-alpha.1

#   Failed test 'setVersion    tag: 1.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 223 - setVersion    versionfile: 1.3.7+build.11
ok 224 - setVersion    1.0.0-alpha.1 --> 1.3.8+build.11
not ok 225 - setVersion    tag: 1.0.0-alpha.1

#   Failed test 'setVersion    tag: 1.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 226 - setVersion    versionfile: 1.3.8+build.11
ok 227 - setVersion    1.0.0-alpha.1 --> 2.0.0-alpha.1
not ok 228 - setVersion    tag: 1.0.0-alpha.1

#   Failed test 'setVersion    tag: 1.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 229 - setVersion    versionfile: 2.0.0-alpha.1
ok 230 - setVersion    1.0.0-alpha.1 --> 0.8.0
sh: 0: getcwd() failed: No such file or directory
# Looks like you failed 43 tests of 230.
Dubious, test returned 43 (wstat 11008, 0x2b00)
Failed 43/230 subtests 

Test Summary Report
-------------------
Version.t (Wstat: 11008 Tests: 230 Failed: 43)
  Failed tests:  67, 70, 73, 77, 81, 86, 89, 92, 95, 98
                102, 105, 108, 111, 114, 117, 120, 123
                127, 131, 134, 137, 140, 143, 146, 150
                155, 158, 161, 164, 167, 171, 176, 179
                182, 186, 190, 212, 215, 219, 222, 225
                228
  Non-zero exit status: 43
Files=1, Tests=230, 120 wallclock secs ( 0.31 usr  0.05 sys + 15.07 cusr 49.61 csys = 65.04 CPU)
Result: FAIL




cd ./bin/Agua/StarCluster/Instance; prove --blib --verbose *.t; cd ../../../..
Instance.t .. 
1..7
# Test parseClusterList
Can't locate object method "meta" via package "Agua::StarCluster" at /agua/lib/Agua/StarCluster/Node.pm line 86.
# Looks like your test exited with 255 before it could output anything.
Dubious, test returned 255 (wstat 65280, 0xff00)
Failed 7/7 subtests 

Test Summary Report
-------------------
Instance.t (Wstat: 65280 Tests: 0 Failed: 0)
  Non-zero exit status: 255
  Parse errors: Bad plan.  You planned 7 tests but ran 0.
Files=1, Tests=0,  4 wallclock secs ( 0.07 usr  0.00 sys +  4.40 cusr  0.15 csys =  4.62 CPU)
Result: FAIL





cd ./bin/Agua/Uml/Class; prove --blib --verbose *.t; cd ../../../..
Class.t .. 
1..5
# Class.t    DOING testSetRoles()
ok 1 - rolesToString
not ok 2 - externalsToString

#   Failed test 'externalsToString'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Uml/Class/../../../../lib/Test/Agua/Uml/Class.pm line 138.
not ok 3 - internalsToString

#   Failed test 'internalsToString'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Uml/Class/../../../../lib/Test/Agua/Uml/Class.pm line 144.
ok 4 - modulename
not ok 5 - methodsToString

#   Failed test 'methodsToString'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Uml/Class/../../../../lib/Test/Agua/Uml/Class.pm line 177.
# Looks like you failed 3 tests of 5.
Dubious, test returned 3 (wstat 768, 0x300)
Failed 3/5 subtests 

Test Summary Report
-------------------
Class.t (Wstat: 768 Tests: 5 Failed: 3)
  Failed tests:  2-3, 5
  Non-zero exit status: 3
Files=1, Tests=5,  5 wallclock secs ( 0.08 usr  0.01 sys +  4.58 cusr  0.20 csys =  4.87 CPU)
Result: FAIL


cd ./bin/Agua/Uml/Uml; prove --blib --verbose *.t; cd ../../../..
Uml.t .. 
1..2
ok 1 - The object isa Test::Agua::Uml
# roleUser
Can't use string ("/mnt/repos/private/syoung/aguate"...) as a symbol ref while "strict refs" in use at /agua/lib/Agua/Uml.pm line 126.
# Looks like you planned 2 tests but ran 1.
# Looks like your test exited with 255 just after 1.
Dubious, test returned 255 (wstat 65280, 0xff00)
Failed 1/2 subtests 

Test Summary Report
-------------------
Uml.t (Wstat: 65280 Tests: 1 Failed: 0)
  Non-zero exit status: 255
  Parse errors: Bad plan.  You planned 2 tests but ran 1.
Files=1, Tests=1,  7 wallclock secs ( 0.08 usr  0.01 sys +  5.51 cusr  0.22 csys =  5.82 CPU)
Result: FAIL


cd ./bin/Agua/Upload; prove --blib --verbose *.t; cd ../../..
Upload.t .. 
1..14
ok 1 - use Conf::Agua;
ok 2 - use Test::Agua::Upload;
ok 3 - require Conf::Agua;
ok 4 - require Test::Agua::Upload;
ok 5 - conf isa Conf::Agua
ok 6 - uploader isa Test::Agua::Upload
# Test parseParams
ok 7 - username is correct
ok 8 - path is correct
not ok 9 - sessionid is correct

#   Failed test 'sessionid is correct'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Upload/../../../lib/Test/Agua/Upload.pm line 61.
# Test printTempfile
not ok 10 - details are correct

#   Failed test 'details are correct'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Upload/../../../lib/Test/Agua/Upload.pm line 22.
ok 11 - boundary number is correct
ok 12 - username is correct
ok 13 - path is correct
not ok 14 - sessionid is correct

#   Failed test 'sessionid is correct'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Upload/../../../lib/Test/Agua/Upload.pm line 40.
# Looks like you failed 3 tests of 14.
Dubious, test returned 3 (wstat 768, 0x300)
Failed 3/14 subtests 

Test Summary Report
-------------------
Upload.t (Wstat: 768 Tests: 14 Failed: 3)
  Failed tests:  9-10, 14
  Non-zero exit status: 3
Files=1, Tests=14,  9 wallclock secs ( 0.09 usr  0.01 sys +  9.20 cusr  0.25 csys =  9.55 CPU)
Result: FAIL




cd ./bin/Agua/Workflow; prove --blib --verbose *.t; cd ../../..
Workflow.t .. 
1..36
ok 1 - use Test::Agua::Workflow;
ok 2 - require Test::Agua::Workflow;
ok 3 - The object isa Test::Agua::Workflow
# loadStarCluster
ok 4 - The object isa Test::Agua::StarCluster
ok 5 - outputdir value is NOT /agua/t/bin/Agua/Workflow/outputs/loadstarcluster/aguatest/.starcluster
Attribute (whoami) does not pass the type constraint because: Validation failed for 'Str' with value undef at accessor Agua::StarCluster::whoami (defined at /agua/lib/Agua/StarCluster.pm line 127) line 4.
	Agua::StarCluster::whoami('Test::Agua::StarCluster=HASH(0x853cc80)', undef) called at /agua/lib/Agua/StarCluster.pm line 221
	Agua::StarCluster::loadArgs('Test::Agua::StarCluster=HASH(0x853cc80)', 'HASH(0x8599c28)') called at /agua/lib/Agua/StarCluster.pm line 236
	Agua::StarCluster::load('Test::Agua::StarCluster=HASH(0x853cc80)', 'HASH(0x8599c28)') called at /agua/lib/Agua/Workflow.pm line 512
	Agua::Workflow::loadStarCluster('Test::Agua::Workflow=HASH(0x17376d0)', 'aguatest', 'aguatest-testcluster') called at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Workflow/../../../lib/Test/Agua/Workflow.pm line 148
	Test::Agua::Workflow::testLoadStarCluster('Test::Agua::Workflow=HASH(0x17376d0)') called at Workflow.t line 67
# Looks like you planned 36 tests but ran 5.
# Looks like your test exited with 255 just after 5.
Dubious, test returned 255 (wstat 65280, 0xff00)
Failed 31/36 subtests 

Test Summary Report
-------------------
Workflow.t (Wstat: 65280 Tests: 5 Failed: 0)
  Non-zero exit status: 255
  Parse errors: Bad plan.  You planned 36 tests but ran 5.
Files=1, Tests=5, 24 wallclock secs ( 0.09 usr  0.01 sys + 21.53 cusr  0.58 csys = 22.21 CPU)
Result: FAIL



    
</entry>
<entry [Fri 2012:12:07 03:17:18 EST] TEST executeWorkflow ERROR: Failed to set '/opt/sge6/admin-microcluster/common/act_qmaster' contents>

NOTE: CLUSTER'S INITIAL LIST STATE ***AND*** RESIDUAL STATE WHEN NOT COMPLETELY TERMINATED

-----------------------------------------------------------
admin-microcluster (security group: @sc-admin-microcluster)
-----------------------------------------------------------
Launch time: N/A
Uptime: N/A
Zone: N/A
Keypair: N/A
EBS volumes: N/A
Cluster nodes: N/A


reset; echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionid":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-microcluster","SHOWLOG":4}' | ./workflow.pl
	
FIRST ERROR (HTML):

{"error":"Failed to set '/opt/sge6/admin-microcluster/common/act_qmaster' contents to: ip-10-124-111-184.ec2.internal","subroutine":"Agua::Ops::Edit::toFile","linenumber":"24","filename":"/agua/cgi-bin/lib/Agua/Ops/Edit.pm","timestamp":"2012-12-07 08:16:05"}
    
SECOND ERROR (COMMAND LINE):

root@ip-10-87-119-247.ec2.internal modified "@allhosts" in host group list
can't resolve hostname "master"
can't resolve hostname "master"
can't resolve hostname "master"
error: unrecognized characters after the attribute values in line 2: "ip-10-124-111-184.ec2.internal"
error: error reading file: "/home/admin/agua/.sge/conf/qconf.9387.conf"
Host group file "/home/admin/agua/.sge/conf/qconf.9387.conf" is not correct
no cqueue list defined
root@ip-10-87-119-247.ec2.internal added "admin-Project1-Workflow1" to cluster queue list
{"error":"job_id not defined","subroutine":"Agua::Monitor::SGE::submitJob","linenumber":"386","filename":"/agua/cgi-bin/lib/Agua/Monitor/SGE.pm","timestamp":"2012-12-07 08:21:45"}





</entry>
<entry [Wed 2012:12:05 04:28:03 EST] TEST startCluster>

startCluster

echo '{"username":"admin","sessionid":"1354697430.4815.441","project":"Project1","workflow":"Workflow1","cluster":"admin-microcluster","mode":"startCluster","start":1,"SHOWLOG":4}' | ./workflow.pl



addCluster

echo '{"username":"admin","sessionid":"1354697430.4815.441","cluster":"admin-microcluster","mode":"addCluster","minnodes":0,"maxnodes":1,"instancetype":"t1.micro","amiid":"ami-11c67678","availzone":"us-east-1a","SHOWLOG":4}' | ./workflow.pl


newCluster

echo '{"cluster":"admin-microcluster","minnodes":"0","maxnodes":"1","instancetype":"t1.micro","amiid":"ami-11c67678","availzone":"us-east-1a","description":"","username":"admin","sessionid":"1354756328.1097.895","mode":"newCluster","SHOWLOG":4}' | ./workflow.pl



</entry>
<entry [Wed 2012:12:05 03:57:45 EST] TEST getStatus>
    
getStatus

reset; echo '{"username":"admin","sessionid":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getStatus","SHOWLOG":4}' | ./workflow.pl


</entry>
<entry [Tue 2012:12:04 18:51:26 EST] TEST upgrade AGUA 0.8.0-alpha.1+build.54>


echo '{"username":"admin","sessionid":"1354665006.23225.270","package":"agua","repository":"agua","version":"0.8.0-alpha.1+build.55","privacy":"private","owner":"syoung","installdir":"/agua","mode":"upgrade","random":925237715595,"SHOWLOG":4}' | ./workflow.pl
    

</entry>



(), "