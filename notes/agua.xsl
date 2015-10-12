agua



<entry [Sun 2015:08:30 18:02:33 EST] BAR CODE SCANNER QUEUE>

https://github.com/najoshi/ucd-biocore-galaxy/blob/master/universe_wsgi.ini

# ---- Galaxy Message Queue -------------------------------------------------

# Galaxy uses AMQ protocol to receive messages from external sources like 
# bar code scanners. Galaxy has been tested against RabbitMQ AMQP implementation.
# For Galaxy to receive messages from a message queue the RabbitMQ server has 
# to be set up with a user account and other parameters listed below. The 'host'
# and 'port' fields should point to where the RabbitMQ server is running. 

[galaxy_amqp]

#host = 127.0.0.1
#port = 5672
#userid = galaxy
#password = galaxy
#virtual_host = galaxy_messaging_engine
#queue = galaxy_queue
#exchange = galaxy_exchange
#routing_key = bar_code_scanner
#rabbitmqctl_path = /path/to/rabbitmqctl
    
</entry>
<entry [Fri 2015:08:28 17:30:23 EST] REMOVED OLD default.conf>

LAST COMMIT CONTAINING /a/conf/default.conf

commit b4b906d72b2225fd3186d8387cc79510600cd5b0


</entry>
<entry [Mon 2015:08:24 00:44:28 EST] METEOR DEVSHOP>

https://devshop.meteor.com/
    
</entry>
<entry [Mon 2015:08:24 00:44:06 EST] FIBERS AND THREADS IN NODE>

https://bjouhier.wordpress.com/2012/03/11/fibers-and-threads-in-node-js-what-for/
    
</entry>
<entry [Mon 2015:08:24 00:23:37 EST] PROFILE JAVASCRIPT>

https://developer.chrome.com/devtools/docs/cpu-profiling
    
</entry>
<entry [Wed 2015:08:05 08:23:23 EST] GATK IN CLINICAL PIPELINES>

http://blog.goldenhelix.com/grudy/gatk-is-a-research-tool-clinics-beware/
    
</entry>
<entry [Wed 2015:08:05 08:20:49 EST] COMPLETED DNASEQ INSTALLER>


PICARD SETTINGS

http://sourceforge.net/p/picard/wiki/Main_Page/
https://broadinstitute.github.io/picard/command-line-overview.html

GATK SETTINGS

https://toolshed.g2.bx.psu.edu/repository/display_tool?repository_id=c45d6c51a4fcfc6c&tool_config=database%2Fcommunity_files%2F000%2Frepo_259%2Fpicard_AddOrReplaceReadGroups.xml&changeset_revision=ab1f60c26526

https://www.broadinstitute.org/gatk/gatkdocs/org_broadinstitute_gatk_tools_walkers_readutils_PrintReads.php

HAPLOTYPE CALLER --dbsnp OPTION

http://gatkforums.broadinstitute.org/discussion/2788/haplotypecaller-dbsnp

</entry>
<entry [Tue 2015:08:04 02:50:20 EST] BRAD CHAPMAN - PYTHON LIBRARIES FOR SYNTHETIC BIOLOGY>

http://bcb.io/2009/05/31/python-libraries-for-synthetic-biology/

    
</entry>
<entry [Wed 2015:04:15 08:46:49 EST] OPEN SOURCE LIMS DB>

https://github.com/TGAC/miso-lims/blob/master/sqlstore/src/main/java/uk/ac/bbsrc/tgac/miso/sqlstore/SQLDilutionDAO.java

    
</entry>
<entry [Sun 2015:03:15 18:38:33 EST] FIXED started AND completed VALUES IN Workflow::executeWorkflow>

**** DONE AND TESTED ****

QUERY

{"username":"guest","sessionid":"1426480658.4498.510","sourceid":"plugins/workflow/RunStatus/Status_0","mode":"executeWorkflow","module":"Agua::Workflow","callback":"handleStatus","sendtype":"request","cluster":"","project":"Project1","workflow":"Workflow1","workflownumber":"1","start":"1","stop":2,"submit":0}


ACTUAL STARTED

cd /home/guest/agua/Project1/Workflow1/stdout

==> 1-sleep.stdout <==
comp3
Sun Mar 15 18:35:43 PDT 2015
Sleeping 40 seconds
Sun Mar 15 18:36:23 PDT 2015
Completed


OUTPUT

data: callback: "handleStatus"data: clusterstatus: queuestatus: stagestatus: project: "Project1"stages: Array[1]0: cluster: ""completed: "2015-03-15 18:36:26"core: duration: "0 hours 0 min 3 sec"executor: "/bin/sh"installdir: "/a/apps/bioapps"lapsed: "0 hours 0 min 0 sec"location: "0.8.0-beta.1+build.6/bin/test/sleep.sh"name: "sleep"now: "2015-03-15 18:36:26"number: "1"owner: "agua"package: "bioapps"project: "Project1"queued: "2015-03-15 18:36:23"stagedescription: ""stagejobid: "0"stagename: ""stagenotes: ""stagepid: "0"started: "2015-03-15 18:36:23"status: "completed"stderrfile: "/home/guest/agua/Project1/Workflow1/stdout/1-sleep.stderr"stdoutfile: "/home/guest/agua/Project1/Workflow1/stdout/1-sleep.stdout"submit: "0"type: "test"username: "guest"version: "0.6.0"workflow: "Workflow1"workflownumber: "1"workflowpid: "0"__proto__: length: 1__proto__: Array[0]status: "running"workflow: "Workflow1"__proto__: status: null__proto__: database: "agua"sendtype: "response"sourceid: "plugins/workflow/RunStatus/Status_0"token: "XhMzDpAn1rRuDIL5"username: "guest"


	
</entry>
<entry [Sun 2015:01:25 03:59:27 EST] SEND EMAIL>

1. SUCCESSFUL EMAIL SEND WITHOUT sendmail USING aguanoreply@gmail.com

#!/usr/bin/perl

use strict;
use warnings;
use Email::Send;
use Email::Send::Gmail;
use Email::Simple::Creator;

my $from	=	"aguanoreply\@gmail.com";
my $to 		= "stuartpyoung\@gmail.com";

my $email = Email::Simple->create(
	header => [
		From    => 	$from,
		To      => 	$to,
		Subject => 	"Email::Send::Gmail TEST 2 from $from to $to",
	],
	body => 'Test email',
);

my $sender = Email::Send->new(
	{
		mailer      => 'Gmail',
		mailer_args => [
			username => 'aguanoreply',
			password => 'norepagua',
		]
	}
);
eval { $sender->send($email) };
die "Error sending email: $@" if $@;

	
</entry>
<entry [Thu 2014:12:18 15:52:38 EST] GIT PULL FROM bit CAUSED MANY CONFLICTS>

**** SUMMARY: git reset --hard  7fb3449
**** COMMIT 7fb3449 CONTAINS NEW AMD-FORMAT FILES IN html


git diff --name-only --diff-filter=U

.gitignore
README
VERSION
cgi-bin/lib
cgi-bin/sql
html/agua.html
html/dojo
html/exchange/rabbitjs/example/socketio/index.html
html/exchange/rabbitjs/example/socketio/rabbit.js
html/plugins/apps/App.js
html/plugins/apps/Apps.js
html/plugins/apps/PackageRow.js
html/plugins/cloud/Ami.js
html/plugins/cloud/AmiRow.js
html/plugins/cloud/Cloud.js
html/plugins/cloud/Controller.js
html/plugins/cloud/Hub.js
html/plugins/cloud/Settings.js
html/plugins/core/Agua.js
html/plugins/core/Agua/App.js
html/plugins/core/Agua/Aws.js
html/plugins/core/Agua/Cloud.js
html/plugins/core/Agua/Cluster.js
html/plugins/core/Agua/Data.js
html/plugins/core/Agua/Exchange.js
html/plugins/core/Agua/Feature.js
html/plugins/core/Agua/File.js
html/plugins/core/Agua/Group.js
html/plugins/core/Agua/Hub.js
html/plugins/core/Agua/Package.js
html/plugins/core/Agua/Parameter.js
html/plugins/core/Agua/Project.js
html/plugins/core/Agua/Request.js
html/plugins/core/Agua/Shared.js
html/plugins/core/Agua/Sharing.js
html/plugins/core/Agua/Stage.js
html/plugins/core/Agua/StageParameter.js
html/plugins/core/Agua/User.js
html/plugins/core/Agua/View.js
html/plugins/core/Agua/Workflow.js
html/plugins/core/Common.js
html/plugins/core/Common/ComboBox.js
html/plugins/core/Common/Date.js
html/plugins/core/Common/Sort.js
html/plugins/core/Common/Text.js
html/plugins/core/Common/Toast.js
html/plugins/core/Common/Util.js
html/plugins/core/Plugin.js
html/plugins/core/PluginController.js
html/plugins/core/PluginManager.js
html/plugins/core/Updater.js
html/plugins/core/templates/agua.html
html/plugins/dijit/Confirm.js
html/plugins/dijit/ConfirmDialog.js
html/plugins/dijit/InputDialog.js
html/plugins/dijit/SelectiveDialog.js
html/plugins/dijit/TitlePane.js
html/plugins/dijit/form/ValidationTextBox.js
html/plugins/dnd/Target.js
html/plugins/dojox/layout/Dock.js
html/plugins/dojox/layout/FloatingPane.js
html/plugins/dojox/widget/Toaster.js
html/plugins/exchange/Exchange.js
html/plugins/files/Controller.js
html/plugins/files/Dialog.js
html/plugins/files/FileDrag.js
html/plugins/files/FileManager.js
html/plugins/files/FileMenu.js
html/plugins/files/TitlePane.js
html/plugins/files/_FileInfoPane.js
html/plugins/files/_GroupDragPane.js
html/plugins/files/templates/filemenu.html
html/plugins/folders/Controller.js
html/plugins/folders/Files.js
html/plugins/folders/Folders.js
html/plugins/folders/ProjectFiles.js
html/plugins/folders/SharedProjectFiles.js
html/plugins/folders/SourceFiles.js
html/plugins/folders/templates/filesystem.html
html/plugins/folders/templates/folders.html
html/plugins/form/DndSource.js
html/plugins/form/EditRow.js
html/plugins/form/Inputs.js
html/plugins/form/Status.js
html/plugins/form/UploadDialog.js
html/plugins/login/Login.js
html/plugins/login/LoginStatus.js
html/plugins/menu/Menu.js
html/plugins/view/Controller.js
html/plugins/view/View.js
html/plugins/view/templates/view.html
html/plugins/workflow/Apps/AdminPackages.js
html/plugins/workflow/Apps/AguaPackages.js
html/plugins/workflow/Apps/AppMenu.js
html/plugins/workflow/Apps/AppRow.js
html/plugins/workflow/Apps/AppSource.js
html/plugins/workflow/Apps/Apps.js
html/plugins/workflow/Apps/Packages.js
html/plugins/workflow/Apps/SharedApps.js
html/plugins/workflow/Apps/SharedPackages.js
html/plugins/workflow/Apps/templates/appmenu.html
html/plugins/workflow/Controller.js
html/plugins/workflow/Grid.js
html/plugins/workflow/GridStage.js
html/plugins/workflow/GridWorkflow.js
html/plugins/workflow/History.js
html/plugins/workflow/HistoryPane.js
html/plugins/workflow/IO.js
html/plugins/workflow/ParameterRow.js
html/plugins/workflow/Parameters.js
html/plugins/workflow/RunStatus/ClusterStatus.js
html/plugins/workflow/RunStatus/QueueStatus.js
html/plugins/workflow/RunStatus/StageStatus.js
html/plugins/workflow/RunStatus/StageStatusRow.js
html/plugins/workflow/RunStatus/Status.js
html/plugins/workflow/RunStatus/css/runstatus.css
html/plugins/workflow/RunStatus/templates/runstatus.html
html/plugins/workflow/SharedWorkflows.js
html/plugins/workflow/StageMenu.js
html/plugins/workflow/StageRow.js
html/plugins/workflow/UserWorkflows.js
html/plugins/workflow/Workflow.js
html/plugins/workflow/Workflows.js
html/plugins/workflow/templates/grid.html
html/plugins/workflow/templates/gridworkflow.html
html/plugins/workflow/templates/stagemenu.html
html/plugins/workflow/templates/workflow.html
lib/Agua/CLI/Flow.pm
lib/Agua/Common/Database.pm
lib/Agua/Common/History.pm
lib/Agua/Common/Package/Sync.pm
lib/Agua/Common/Parameter.pm
lib/Agua/Common/Stage.pm
lib/Agua/Ops/Stager.pm
lib/Agua/Request.pm
lib/Agua/Stage.pm
lib/Agua/StarCluster.pm
lib/Agua/Workflow.pm
lib/Exchange.pm
lib/Queue/Daemon.pm
t/unit/html/doh/Agua.js
t/unit/html/doh/util.js
t/unit/html/plugins/exchange/routing/runTests.js
t/unit/html/plugins/exchange/routing/test.html
t/unit/html/plugins/folders/copyfile/runTests.js
t/unit/html/plugins/folders/copyfile/test.html
t/unit/html/plugins/workflow/apps/adminpackages/apps.json
t/unit/html/plugins/workflow/apps/adminpackages/conf.json
t/unit/html/plugins/workflow/apps/adminpackages/runTests.js
t/unit/html/plugins/workflow/apps/adminpackages/test.html
t/unit/html/plugins/workflow/filemanager/runTests.js
t/unit/html/plugins/workflow/filemanager/test.html
t/unit/html/plugins/workflow/grid/runTests.js
t/unit/html/plugins/workflow/grid/test.html
t/unit/html/plugins/workflow/history/runTests.js
t/unit/html/plugins/workflow/history/test.html
t/unit/html/plugins/workflow/parameters/test.html
t/unit/html/plugins/workflow/runstatus/status/runTests.js
t/unit/html/plugins/workflow/runstatus/status/test.html
t/unit/html/plugins/workflow/runstatus/status/test1.json
t/unit/html/plugins/workflow/target/runTests.js
t/unit/html/plugins/workflow/workflows/runTests.js
t/unit/html/plugins/workflow/workflows/test.html

	
</entry>
<entry [Wed 2014:11:12 10:09:52 EST] GOOGLE FORMS>

https://www.google.com/forms/about/?utm_source=product&utm_medium=forms_confirmation&utm_campaign=forms

	
</entry>
<entry [Sat 2014:11:01 18:53:29 EST] FIXED ERROR: no exchange 'chat' in vhost '/'>


*** SUMMARY: RUN Net::RabbitFoot emit_log.pl TO RECREATE 'chat' EXCHANGE ***

/home/syoung/notes/agua/private/bin/test/perl/NetRabbitFoot/emit_log.pl



1. RESTART RABBITMQ-SERVER AND rabbitjs

service rabbitmq-server restart
service rabbitjs restart


2. WAIT A FEW MINUTES

service rabbitmq-server restart

3. TEST

/a/bin/exchange/receiveFanout
	
	
</entry>
<entry [Sat 2014:11:01 00:00:25 EST] TEST - REBOOT AND TRY TO START agua --log 4>

1. MAKE SURE DON'T GET THIS ERROR

./agua --log 4

	2014-10-31 23:54:23    [DEBUG]   	Queue::Daemon::receiveFanout	116
	Binding queue: server channel error 404, message: NOT_FOUND - no exchange 'chat' in vhost '/' at /a/lib/Queue/Daemon.pm line 148.

2. IF DO, TRY RUNNING receiveFanout THEN DETERMINE CAUSE

/a/bin/exchange/receiveFanout 
[x] Received from queue chat: test2


3. IF NOT, VERIFY AGUA CAN RECEIVE MESSAGES

localhost:8080

	
</entry>
<entry [Mon 2014:10:20 12:06:35 EST] AGUA 2.0 SITE - Cloud Images PAGE>

Amazon Web Services (AWS) Image
You only need a credit card and an internet connection to launch an Amazon cloud server from an Amazon Machine Image (AMI). To for the next two steps
1. Create an Amazon EC2 account
2. Generate Amazon EC2 credentials
3. Launch the Agua AMI
4. Connect to your cloud server

    
</entry>
<entry [Wed 2014:10:15 19:34:51 EST] TO DO: ADD RABBITMQ CONFIG TO Install.pm>


1. ADD frame_max TO FILE rabbitmq.config TO SET MAX SIZE TO 10 MILLION CHARACTERS

emacs -nw /etc/rabbitmq/rabbitmq.config

	[
		{mnesia, [{dump_log_write_threshold, 1000}]},
		{rabbit, [{frame_max, 10000000}]}
	].

NB: THE FINAL '.' MUST BE THERE (IT'S ERLANG)


2. RESTART SERVER

service rabbitmq-server restart

   
    
</entry>
<entry [Fri 2014:10:10 08:49:57 EST] FIXED Net::RabbitFoot ERROR 'Error connecting to AMQP Server'>

PROBLEM

/a/bin/daemon/agua
    
    Error connecting to AMQP Server 192.168.1.16:5672: Network is unreachable at /usr/local/share/perl/5.18.2/Net/RabbitFoot.pm line 64.

    
SOLUTION

REBOOT ROUTER

    
</entry>
<entry [Tue 2014:10:07 22:33:11 EST] PAYPAL DONATE BUTTON>

https://www.paypal.com/tw/cgi-bin/webscr?SESSION=Q7GwAcuQybfq98J2tTcK66nU1Db9dvBeGj4VIBA-roF22VV6y7onhgv1qiq&dispatch=5885d80a13c0db1f8e263663d3faee8dbd0a2170b502f343d92a90377a9956d7

<!--

<form target="paypal" action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="W382ZQH4MLN4U">
<table>
<tr><td><input type="hidden" name="on0" value="Donation levels">Donation levels</td></tr><tr><td><select name="os0">
	<option value="I'll give">I'll give $10.00 USD</option>
	<option value="I'll give">I'll give $25.00 USD</option>
	<option value="I'll give">I'll give $50.00 USD</option>
	<option value="I'll give">I'll give $100.00 USD</option>
	<option value="I'll give">I'll give $200.00 USD</option>
	<option value="I'll give">I'll give $500.00 USD</option>
</select> </td></tr>
</table>
<input type="hidden" name="currency_code" value="USD">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_cart_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form>

-->

    
</entry>
<entry [Tue 2014:10:07 22:32:55 EST] DEPRECATED: PLUGIN DESCRIPTOR info.json>

h1. Plugin descriptor

The Plugin descriptor file is the 'info.json' file inside the top level of the plugin directory. It contains a JSON (Javascript Object notation) object which contains the neccessary information to tell Aqwa about the plugin itself, the modules contained within it and any other plugins it requires, including their versions. 

The required format for the descriptor file is as follows:

{code}
{
	name: "plugins.myPlugin.Controller",

	version : "0.01",
	
	url : '',  // the website for myPlugin
	
	description : "This is what myPlugin does",
		
	dependencies : // which plugins myPlugin requires to work
	[
		{	name: "plugins.core.Controls", version: 0.01	}
	]
}
{code}


</entry>
<entry [Mon 2014:09:15 10:53:45 EST] FIXED samtools INSTALL - ADDED '-fPIC' TO CFLAGS IN Makefile>

#CFLAGS=         -g -Wall -O2 #-m64 #-arch ppc
CFLAGS=         -g -Wall -O2 -fPIC #-m64 #-arch ppc

    
</entry>
<entry [Sun 2014:09:14 14:48:16 EST] SPUN OFF Flow.pm FROM Project.pm, ADDED EXECUTABLES param, app, work AND proj>

NEW flow SIGNATURE WITHOUT FILENAME 

addProject

/a/bin/cli/flow addProject --project RunSRA --username syoung
    Project 'RunSRA' saved to database 'agua'


deleteProject

/a/bin/cli/flow deleteProject --project RunSRA 

    Project 'RunSRA' deleted from database 'agua'


loadProject

/a/bin/cli/flow loadProject --inputfile cd /a/apps/cu/0.0.11/conf/sra/RunSRA/RunSRA.proj --username syoung


printProject

/a/bin/cli/flow print --project RunSRA --username syoung --log 4 #### DEFAULT format=yaml
/a/bin/cli/flow print --project RunSRA --username syoung --log 4 --format json


printWorkflow

/a/bin/cli/flow printWorkflow --username syoung --project RunSRA --workflow Aspera


    
</entry>
<entry [Sat 2014:09:13 11:43:01 EST] ADD YAML FORMAT TO Agua::CLI>


1. CREATED NEW conf FILES DIR (OLD FILES GO TO json)

mkdir -p /agua/apps/cu/0.0.11/conf/sra/RunSRA/json
cp /agua/apps/cu/0.0.11/conf/sra/RunSRA/* /agua/apps/cu/0.0.11/conf/sra/RunSRA/json
emacs -nw /agua/apps/cu/0.0.11/conf/sra/RunSRA/RunSRA.proj


2. LOADED WORKFLOWS FROM OLD json FILES

loadWorkflow
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/1-Aspera.work  --format json
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/2-SraToBam.work --format json
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/3-LaneFastq.work --format json
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/4-Bwa.work --format json
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/5-Merge.work --format json
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/6-IndexBam.work --format json
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/7-FreeBayes.work --format json


3. PRINTED WORKFLOWS TO NEW yaml FILES

cd /a/apps/cu/0.0.11/conf/sra/RunSRA/
/a/bin/cli/flow printWorkflow --username syoung --project RunSRA --workflow Aspera
/a/bin/cli/flow printWorkflow --username syoung --project RunSRA --workflow SraToBam
/a/bin/cli/flow printWorkflow --username syoung --project RunSRA --workflow LaneFastq
/a/bin/cli/flow printWorkflow --username syoung --project RunSRA --workflow Bwa
/a/bin/cli/flow printWorkflow --username syoung --project RunSRA --workflow Merge
/a/bin/cli/flow printWorkflow --username syoung --project RunSRA --workflow IndexBam
/a/bin/cli/flow printWorkflow --username syoung --project RunSRA --workflow FreeBayes


4. VERIFIED BY LOADING WORKFLOWS FROM NEW yaml FILES

/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/1-Aspera.work 
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/2-SraToBam.work
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/3-LaneFastq.work
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/4-Bwa.work
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/5-Merge.work
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/6-IndexBam.work
/a/bin/cli/flow saveWorkflow --username syoung --project RunSRA --wkfile /a/apps/cu/0.0.11/conf/sra/RunSRA/7-FreeBayes.work

    OK
    
</entry>
<entry [Sun 2014:08:24 10:09:03 EST] BLOCKLY - BLOCK FACTORY>

https://blockly-demo.appspot.com/static/apps/blockfactory/index.html

Blockly.Blocks['loop'] = {
  init: function() {
    this.setHelpUrl('http://www.example.com/');
    this.setColour(105);
    this.appendValueInput("loop")
        .setCheck("String")
        .setAlign(Blockly.ALIGN_CENTRE)
        .appendField(new Blockly.FieldTextInput("Loop"), "LOOP");
    this.appendStatementInput("fork")
        .setCheck(["loop", "stage", "fork", "join"])
        .appendField(new Blockly.FieldVariable("item"), "NAME");
    this.setInputsInline(true);
    this.setPreviousStatement(true);
    this.setNextStatement(true);
    this.setTooltip('');
  }
};
	
</entry>
<entry [Sat 2014:08:16 17:46:32 EST] INSTALL MYSQL>

1. INSTALL 

UBUNTU:

apt-get install -y facter
apt-get install -y mysql-server mysql-client
apt-get install -y libmysqlclient-dev

CENTOS:


2. INSTALL DBD::mysql

SET MYSQL PASSWORD TO '' IF ALREADY SET
mysql -u root -p
	set password = password('');
 
cpanm install DBD::mysql


	GIVES ERROR:

	Running Mkbootstrap for DBD::mysql ()
	chmod 644 mysql.bs
	PERL_DL_NONLAZY=1 /usr/bin/perl "-MExtUtils::Command::MM" "-MTest::Harness" "-e" "undef *Test::Harness::Switches; test_harness\
	(0, 'blib/lib', 'blib/arch')" t/*.t
	t/00base.t ........................... ok
	Bailout called.  Further testing stopped:  ERROR: Access denied for user 'root'@'localhost' (using password: NO)
	FAILED--Further testing stopped: ERROR: Access denied for user 'root'@'localhost' (using password: NO)
	make: *** [test_dynamic] Error 255
	-> FAIL Installing DBD::mysql failed. See /root/.cpanm/build.log for details.	
	
</entry>
<entry [Tue 2014:07:22 14:06:37 EST] FIXED pancancer WON'T INSTALL>

SUMMARY:
1. CHANGED privacy TO private IN pancancer.ops
2. CHANGED Ops::Install TO USE git@bitbucket IF privacy IS private


LATER:

CHECK FOR KEY ACCESS TO REPOS:


ssh -T git@bitbucket.org -o StrictHostKeyChecking=no
authenticated via a deploy key.


You can use git or hg to connect to Bitbucket. Shell access is disabled.

This deploy key has read access to the following repositories:

annaisystems/pancancer: bcf-deploy -- syoung@comp2
annaisystems/moores: bcf-deploy -- syoung@comp2
annaisystems/cu: bcf-deploy -- syoung@comp2

	
</entry>
<entry [Tue 2014:07:22 11:27:00 EST] ADDED TO README>


UPDATED README TO SHOW ADDITION OF preinstall.pl SCRIPT

LATER:

configure.pl


Show the full list of installed packages and the latest versions of available packages:

    --mode list
    
Install all of the listed packages:

    --mode all


	
</entry>
<entry [Mon 2014:07:14 06:16:30 EST] USE pipefail TO GET ERROR IF PIPED JOBS FAIL>

Added set -o pipefail to bash jobs to ensure failures be caught even with piped multiple commands


	
</entry>
<entry [Thu 2014:05:22 11:03:11 EST] AGUA JIRA SERVICE DESK PLUGIN>

https://marketplace.atlassian.com/plugins/com.atlassian.servicedesk

INSTALL INSTRUCTIONS


1. GET LICENSE

CLICK 'TRY' AND LOGIN

https://marketplace.atlassian.com/plugins/com.atlassian.servicedesk


2. COPY LICENCE

AAAA8w0ODAoPeNptj8tOg0AUhvfzFJO4hsAU1JDMggCLNlxMi67cHMfTdlIYyFyIvL0gJhrj4mz+y 5fz37VXRyuYKWM03CUBS6JHmuUtZUEYkRyN0HK0clD8sD+m9IR6kgLpYtzoedB0VV8TWkzQOVhzp Hb9G+rm/GxQG+6FJNP45eRgka9YL4g9tiM/HW61Q9ItYGXwZamtGiMVSGVRgRJYfIxSz78I9x5jp NEXUNJsjPTigJyKmi/nlVEYxA9hTMoN+n//22znEWvokWdNVRXHbJ+WRAy9D7YDYyQo32yz35fVP ggrJ9xefnJaXMHg32mfK39utzAsAhRHkqPfNzKTmWTA0NYwibdtFkt2ugIUVCwvY+RzfUlYKWVQc hf9d/4Oamw=X02ck


3. DOWNLOAD PLUGIN

/home/syoung/software/atlassian/plugins/jira-servicedesk-1.2.5.obr


4. UPLOAD TO JIRA

Administration --> Add-Ons --> Manage Add-Ons --> Upload Add-On


5. APPLY LICENCE

Administration --> Add-Ons --> Manage Add-Ons --> Service Desk --> copy and paste license key


6. PLUGIN INSTALLATION LOCATION

/var/atlassian/application-data/jira/plugins/installed-plugins/jira-servicedesk-1.2.5.jar



</entry>
<entry [Thu 2014:05:08 05:48:51 EST] agua:MODULES ENTRY IN config.yaml>

MODULES: Queue::Monitor,Agua::Admin,Agua::Folders,Agua::Package,Agua::Sharing,Agua::Upload,Agua::View,Agua::Workflow

	
</entry>
<entry [Mon 2014:04:21 19:34:25 EST] RUN https.js DAEMON AS A SERVICE>

node /mnt/repos/private/syoung/notes/agua/private/bin/test/node/https/https.js
	
</entry>
<entry [Mon 2014:04:21 18:08:28 EST] RUN rabbitjs DAEMON AS A SERVICE>

1. COPY FILES TO /etc



2. **COPY** TO /usr/bin

ln -s /agua/bin/daemon/rabbitjs /usr/bin/rabbitjs


3. RUN SERVICE

service rabbitjs start


</entry>
<entry [Mon 2014:04:21 16:36:26 EST] RUN agua DAEMON AS A SERVICE>

1. COPY FILES TO /etc

cd /agua/bin/install/resources/agua
sudo cp etc/init.d/agua /etc/init.d
sudo cp etc/init/agua.conf /etc/init
sudo cp etc/default/agua /etc/default


2. **LINK** TO /usr/bin

ln -s /agua/bin/daemon/agua /usr/bin/agua


3. RUN SERVICE

sudo service agua start

start: Rejected send message, 1 matched rules; type="method_call", sender=":1.102" (uid=1000 pid=21148 comm="start agua ") interface="com.ubuntu.Upstart0_6.Job" member="Start" error name="(unset)" requested_reply="0" destination="com.ubuntu.Upstart" (uid=0 pid=1 comm="/sbin/init")


	
</entry>
<entry [Mon 2014:04:21 00:56:47 EST] INSTALLED TryCatch TO PACKAGED PERL FOR USE IN Queue::Daemon>

1. CREATE modules FILE

emacs -nw /agua/bin/install/resources/agua/modules

	TryCatch
	
2. INSTALL 

SET PERMISSIONS
sudo chown -R syoung /agua/apps/perl/5.18.2/lib/5.18.2

SET ENVIRONMENT VARIABLES
source /agua/apps/pancancer/bin/envars.sh
export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2

MANUALLY INSTALL
/agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm  --no-interactive --notest -v -l /agua/apps/perl/5.18.2/lib/5.18.2 B::Hooks::OP::PPAddr --force

/agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm  --no-interactive --notest -v -l /agua/apps/perl/5.18.2/lib/5.18.2 TryCatch

OR, RUN AUTOMATED INSTALL
/agua/bin/install/resources/agua/install.sh \
/agua/apps/perl/5.18.2/lib/5.18.2 \
/agua/bin/install/resources/agua/modules

WHICH RUNS THIS:

/agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm  --no-interactive --notest -v -l /agua/apps/perl/5.18.2/lib/5.18.2 TryCatch


OR USE THE NON-OO VERSION:

sub try (&$) {
   my($try, $catch) = @_;
   eval { $try };
   if ($@) {
      local $_ = $@;
      &$catch;
   }
}

sub catch (&) { $_[0] }





</entry>
<entry [Sun 2014:04:20 23:17:42 EST] SHORTER DEBUGGING - GET NAME OF VARIABLE AS STRING>

To do this, you need to use the module PadWalker, which lets you inspect the lexical pads that store variables.

use PadWalker qw/peek_my peek_our/;

sub debug {
    my $my     = peek_my 1;
    my $our    = peek_our 1;
    my $caller = caller() . '::';
    my $stash  = do {
        no strict 'refs';
        \%$caller
    };
    my %lookup;
    for my $pad ($my, $our) {
        $lookup{$$pad{$_}} ||= $_ for keys %$pad;
    }
    for my $name (keys %$stash) {
        if (ref \$$stash{$name} eq 'GLOB') {
            for (['$' => 'SCALAR'],
                 ['@' => 'ARRAY'],
                 ['%' => 'HASH'],
                 ['&' => 'CODE']) {
                if (my $ref = *{$$stash{$name}}{$$_[1]}) {
                    $lookup{$ref} ||= $$_[0] . $caller . $name
                }
            }
        }
    }
    for (@_) {
       my $name = $lookup{\$_} || 'name not found';
       print "$name: $_\n";
    }
}
and then to use it:

my $x = 5;
our $y = 10;
$main::z = 15;

debug $x, $y, $main::z;
which prints:

$x: 5
$y: 10
$main::z: 15
EDIT:

Here is the same functionality, refactored a bit:

use PadWalker qw/peek_my peek_our/;

sub get_name_my {
    my $pad = peek_my($_[0] + 1);
    for (keys %$pad) {
        return $_ if $$pad{$_} == \$_[1]
    }
}
sub get_name_our {
    my $pad = peek_our($_[0] + 1);
    for (keys %$pad) {
        return $_ if $$pad{$_} == \$_[1]
    }
}
sub get_name_stash {
    my $caller = caller($_[0]) . '::';
    my $stash = do {
        no strict 'refs';
        \%$caller
    };
    my %lookup;
    for my $name (keys %$stash) {
        if (ref \$$stash{$name} eq 'GLOB') {
            for (['$' => 'SCALAR'],
                 ['@' => 'ARRAY'],
                 ['%' => 'HASH'],
                 ['&' => 'CODE']) {
                if (my $ref = *{$$stash{$name}}{$$_[1]}) {
                    $lookup{$ref} ||= $$_[0] . $caller . $name
                }
            }
        }
    }
    $lookup{\$_[1]}
}
sub get_name {
    unshift @_, @_ == 2 ? 1 + shift : 1;
    &get_name_my  or
    &get_name_our or
    &get_name_stash
}

sub debug {
    for (@_) {
       my $name = get_name(1, $_) || 'name not found';
       print "$name: $_\n";
    }
}


</entry>
<entry [Sun 2014:04:20 21:45:43 EST] OO TRYCATCH WITH TryCatch>

http://search.cpan.org/~ash/TryCatch-1.003002/lib/TryCatch.pm

 use TryCatch;

 sub foo {
   my ($self) = @_;

   try {
     die Some::Class->new(code => 404 ) if $self->not_found;
     return "return value from foo";
   }
   catch (Some::Class $e where { $_->code > 100 } ) {
   }
 }
 
 
This module aims to give first class exception handling to perl via 'try' and 'catch' keywords. The basic syntax this module provides is try { # block } followed by zero or more catch blocks. Each catch block has an optional type constraint on it the resembles Perl6's method signatures.

Also worth noting is that the error variable ($@) is localised to the try/catch blocks and will not leak outside the scope, or stomp on a previous value of $@.

The simplest case of a catch block is just

 catch { ... }
where upon the error is available in the standard $@ variable and no type checking is performed. The exception can instead be accessed via a named lexical variable by providing a simple signature to the catch block as follows:

 catch ($err) { ... }
Type checking of the exception can be performed by specifing a type constraint or where clauses in the signature as follows:

 catch (TypeFoo $e) { ... }
 catch (Dict[code => Int, message => Str] $err) { ... }
As shown in the above example, complex Moose types can be used, including MooseX::Types style of type constraints

In addition to type checking via Moose type constraints, you can also use where clauses to only match a certain sub-condition on an error. For example, assuming that HTTPError is a suitably defined TC:

 catch (HTTPError $e where { $_->code >= 400 && $_->code <= 499 } ) {
   return "4XX error";
 }
 catch (HTTPError $e) {
   return "other http code";
 }
would return "4XX error" in the case of a 404 error, and "other http code" in the case of a 302.

In the case where multiple catch blocks are present, the first one that matches the type constraints (if any) will executed.


</entry>
<entry [Sat 2014:04:19 22:00:28 EST] MULTIPLE GLIBC LIBRARIES ON ONE HOST>

TALKS ABOUT rpath

http://stackoverflow.com/questions/847179/multiple-glibc-libraries-on-a-single-host


USE patchelf TO CHANGE rpath IN EXISTING BINARY

http://nixos.org/patchelf.html
https://github.com/NixOS/patchelf
RELEASES
http://hydra.nixos.org/build/8066949#tabs-constituents


http://linuxgazette.net/issue48/tag/48.html
use LD_PRELOAD_PATH


SOLUTION

http://stackoverflow.com/questions/847179/multiple-glibc-libraries-on-a-single-host

It is very possible to have multiple versions of glibc on the same system (we do that every day).

However, you need to know that glibc consists of many pieces (200+ shared libraries) which all must match. One of the pieces is ld-linux.so.2, and it must match libc.so.6, or you'll see the errors you are seeing.

The absolute path to ld-linux.so.2 is hard-coded into the executable at link time, and can not be easily changed after the link is done.

To build an executable that will work with the new glibc, do this:

g++ main.o -o myapp ... \
   -Wl,--rpath=/path/to/newglibc \
   -Wl,--dynamic-linker=/path/to/newglibc/ld-linux.so.2
The -rpath linker option will make the runtime loader search for libraries in /path/to/newglibc (so you wouldn't have to set LD_LIBRARY_PATH before running it), and the -dynamic-linker option will "bake" path to correct ld-linux.so.2 into the application.

If you can't relink the myapp application (e.g. because it is a third-party binary), not all is lost, but it gets trickier. One solution is to set a proper chroot environment for it. Another possibility is to use rtldi and a binary editor.

share|improve this answer
edited May 29 '12 at 0:35

answered May 12 '09 at 5:10

Employed Russian
47k64890
1	  	
Note that -Wl,--dynamic-linker=file (takes two '-') only works when compiling for ELF executables. Check /sbin/ldconfig -p | grep ld –  Tom May 28 '12 at 14:08 
  	  	
@Tom Thanks for the catch; corrected. –  Employed Russian May 29 '12 at 0:36
4	  	
Now you can use a convenient utility patchelf (nixos.org/patchelf.html), which allows you to modify rpath and interpreter of already compiled ELF. –  constantius Feb 13 '1


</entry>
<entry [Thu 2014:04:17 13:25:01 EST] SAVANT READ BROWSER WITH BOOKMARKS>

http://bioinformatics.oxfordjournals.org/content/26/16/1938.long
	
</entry>
<entry [Tue 2014:04:15 15:13:38 EST] INSTALLED Getopt::ArgParse TO PACKAGED PERL>


1. CREATE modules FILE

emacs -nw /agua/bin/install/resources/agua/modules

	Getopt::ArgParse
	
2. INSTALL 

export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2

/agua/bin/install/resources/agua/install.sh \
/agua/apps/perl/5.18.2/lib/5.18.2 \
/agua/bin/install/resources/agua/modules



#!/usr/bin/perl -w

=head2

APPLICATION 	volume

PURPOSE

	1. Attach or detach volumes on an instance
	
HISTORY

	v0.01	Basic wrappers around nova and cinder API clients

USAGE

$0 < --mode (attach|detach)> < --size Int> < --type (SSD|HD)>

=cut

#### EXTERNAL MODULES
use Term::ANSIColor qw(:constants);
use Getopt::Long;
use FindBin qw($Bin);

#### USE LIBRARY
use lib "$Bin/../../lib";	
BEGIN {
    my $installdir = $ENV{'installdir'} || "/agua";
    unshift(@INC, "$installdir/lib");
}

use lib "/agua/lib";

#### INTERNAL MODULES
use Conf::Yaml;
#use Openstack::Nova;
use Queue::Manager;

my $installdir = $ENV{'installdir'} || "/agua";
my $configfile	=	"$installdir/conf/config.yaml";

use Getopt::ArgParse;

$ap = Getopt::ArgParse->new_parser(
	prog        => 'volume.pl',
	description => 'Attach/detach volumes to/from instances in Openstack',
	epilog      => 'This appears at the bottom of usage',
);

# subcommands
# Must be called to initialize subcommand parsing
$ap->add_subparsers(title => 'subcommands'); 
$list_parser = $ap->add_parser(
	'attach',
	help => 'List directory entries',
	description => 'A multiple paragraphs long description.',
);

my $args =   [
	[
     '--instanceid', '-i',
      type => 'Count',
      help => 'Verbosity',
   ],
   [
     '--volumeid', '-v',
      help => 'Volume ID',
   ],
   [
     '--size', '-s',
      help => 'Size (GB)',
   ],
];

foreach my $arg ( @$args ) {
	$list_parser->add_args($arg);	
}

#$list_parser->add_args([
#		'--serverid', '-v',
#		type => 'Count',
#		help => 'Verbosity',
#	],
#	[
#		'--depth',
#		help => 'depth',
#	]
#);


$ns = $ap->parse_args(split(' ', 'attach -v volume'));

print $ns->current_command(); # current_command stores list,
                             # Don't use this name for your own option

 $ns =$ap->parse_args(split(' ', 'help')); # This will print the usage for the list command
 # help subcommand is automatically added for you
print $ns->help_command(); # list



#my $nodename;
#my $mode;
#my $SHOWLOG		=	2;
#my $PRINTLOG	=	2;
#my $logfile		=	"/tmp/pancancer-restart.$$.log";
#my $help;
#GetOptions (
#    'nodename=s'	=> \$nodename,
#    'mode=s'	=> \$mode,
#    'SHOWLOG=i'     => \$SHOWLOG,
#    'PRINTLOG=i'    => \$PRINTLOG,
#    'help'          => \$help
#) or die "No options specified. Try '--help'\n";
#usage() if defined $help;
#
#
my $conf = Conf::Yaml->new(
    memory      =>  0,
    inputfile   =>  $configfile,
    backup      =>  1,

    SHOWLOG     =>  $SHOWLOG,
    PRINTLOG    =>  $PRINTLOG,
    logfile     =>  $logfile
);


my $object = Queue::Manager->new({
	conf		=>	$conf,
    SHOWLOG     =>  $SHOWLOG,
    PRINTLOG    =>  $PRINTLOG,
    logfile     =>  $logfile
});
#$object->$mode($nodename);

exit 0;

##############################################################

sub usage {
	print `perldoc $0`;
	exit;
}


	
</entry>
<entry [Tue 2014:04:15 02:03:46 EST] REMOVED FILES TO PULL TO agua FROM aguadev>

sudo chown -R ubuntu:ubuntu lib
sudo chown -R ubuntu:ubuntu cgi-bin

rm -fr .gitattributes .gitignore 
rm -fr apps/node-amqp/.gitignore
rm -fr apps/node-amqp/node_modules/socket.io/support/expresso/.gitmodules
rm -fr apps/node/node-v0.10.15
sudo rm -fr apps/node/node-v0.10.15
rm -fr bin/sql/report.sql
rm -fr html/dojo-1.8.3/dojox/.gitattributes
rm -fr html/dojo-1.8.3/dojox/.gitmodules
rm -fr  html/dojo-1.8.3/dwb/.gitignore
rm -fr html/dojo-1.8.3/dwb/logs/.gitignore
rm -fr html/dojo-1.8.3/dwb/src/main/webapp/WEB-INF/config/packages/.gitignore
rm -fr html/dojo-1.8.3/jszlib/.gitignore
rm -fr html/dojo-1.8.3/lazyload/test/node_modules/express/node_modules/qs/.gitmoduleshtml/dojo-1.8.3/lazyload/test/node_modules/express/node_modules/
rm -fr html/dojo/jDataView/.git*install.sh
rm -fr html/dojo/jszlib/.gitignore
rm -fr html/dojo/lazyload/test/node_modules/express/node_modules/qs
rm -fr html/dojo/util/less/.gitignore
rm -fr html/log/.dummy
rm -fr html/plugins/.gitignore
rm -fr html/plugins/view/.gitignore
rm -fr html/plugins/view/jbrowse/samtools-master/.gitignore
rm -fr lib/Agua/Monitor/LSF.pm
rm -fr lib/Agua/Monitor/PBS.pm
rm -fr lib/Agua/Report.pm
rm -fr html/dojo-1.8.3/lazyload/test/node_modules/express/node_modules/qs/
rm -fr html/dojo-1.8.3/lazyload/test/node_modules/express/node_modules/qs/.gitmodules

rm -fr bin/install/resources/agua/install.sh
rm -fr bin/install/resources/agua/perlmods
rm -fr bin/install/resources/agua/setup.log
rm -fr cgi-bin/conf
rm -fr cgi-bin/lib
rm -fr cgi-bin/log
rm -fr cgi-bin/sql


rm -fr bin/install/resources/agua/config
rm -fr bin/install/resources/agua/extra
rm -fr bin/install/resources/agua/install.sh
rm -fr bin/install/resources/agua/moo
rm -fr bin/install/resources/agua/perlmods
rm -fr bin/install/resources/agua/setup.log
rm -fr bin/install/resources/agua/setup.log.bkp1
rm -fr lib/Logger.pm
rm -fr lib/Openstack/Nova.pm
rm -fr lib/Queue/Manager.pm




rm -fr .gitattributes
rm -fr .gitignore
rm -fr apps/node-amqp/.gitignore
rm -fr apps/node-amqp/node_modules/socket.io/support/expresso/.gitmodules
rm -fr bin/install/resources/agua/config
rm -fr bin/install/resources/agua/extra
rm -fr bin/install/resources/agua/install.sh
rm -fr bin/install/resources/agua/moo
rm -fr bin/install/resources/agua/perlmods
rm -fr bin/install/resources/agua/setup.log
rm -fr bin/install/resources/agua/setup.log.bkp1
rm -fr bin/sql/report.sql
rm -fr cgi-bin/conf
rm -fr cgi-bin/lib
rm -fr cgi-bin/log
rm -fr cgi-bin/sql
rm -fr html/dojo-1.8.3/dojox/.gitattributes
rm -fr html/dojo-1.8.3/dojox/.gitmodules
rm -fr html/dojo-1.8.3/dwb/.gitignore
rm -fr html/dojo-1.8.3/dwb/logs/.gitignore
rm -fr html/dojo-1.8.3/dwb/src/main/webapp/WEB-INF/config/packages/.gitignore
rm -fr html/dojo-1.8.3/jszlib/.gitignore
rm -fr html/dojo-1.8.3/lazyload/test/node_modules/express/node_modules/qs/.gitmodules
rm -fr html/dojo-1.8.3/lazyload/test/node_modules/express/node_modules/qs/support/expresso/.gitignore
rm -fr html/dojo-1.8.3/lazyload/test/node_modules/express/node_modules/qs/support/expresso/.gitmodules
rm -fr html/dojo-1.8.3/lazyload/test/node_modules/express/node_modules/qs/support/should/.gitmodules
rm -fr html/dojo/jDataView/.gitignore
rm -fr html/dojo/jDataView/.gitmodules
rm -fr html/dojo/jszlib/.gitignore
rm -fr html/dojo/lazyload/test/node_modules/express/node_modules/qs/.gitmodules
rm -fr html/dojo/lazyload/test/node_modules/express/node_modules/qs/support/expresso/.gitignore
rm -fr html/dojo/lazyload/test/node_modules/express/node_modules/qs/support/expresso/.gitmodules
rm -fr html/dojo/lazyload/test/node_modules/express/node_modules/qs/support/should/.gitmodules
rm -fr html/dojo/util/less/.gitignore
rm -fr html/log/.dummy
rm -fr html/plugins/.gitignore
rm -fr html/plugins/view/.gitignore
rm -fr html/plugins/view/jbrowse/samtools-master/.gitignore
rm -fr lib/Agua/Monitor/LSF.pm
rm -fr lib/Agua/Monitor/PBS.pm
rm -fr lib/Agua/Report.pm
rm -fr lib/Logger.pm
rm -fr lib/Openstack/Nova.pm
rm -fr lib/Queue/Manager.pm


</entry>
<entry [Mon 2014:04:14 16:10:02 EST] INSTALLED Package::Variant>

cd /agua/bin/install/resources/agua
export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2
/agua/bin/install/resources/agua/install.sh \
/agua/apps/perl/5.18.2/lib/5.18.2 \
extra

PACKAGE INSTALLED HERE:

/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/Package/Variant.pm

	
</entry>
<entry [Mon 2014:04:14 14:39:53 EST] INSTALLED MooX::Declare>

1. DOWNLOAD AND INSTALL

mkdir -p /agua/apps/perl/5.18.2/downloads
cd /agua/apps/perl/5.18.2/downloads
git clone https://github.com/haarg/MooX-Declare.git
cd MooX-Declare
/agua/apps/perl/5.18.2/bin/perl Makefile.PL PREFIX=/agua/apps/perl/5.18.2/
make
make install
	Installing /agua/apps/perl/5.18.2/lib/site_perl/5.18.2/MooX/Declare.pm
	Installing /agua/apps/perl/5.18.2/lib/site_perl/5.18.2/MooX/Declare/Filter.pm
	Installing /agua/apps/perl/5.18.2/lib/site_perl/5.18.2/MooX/Declare/Role.pm
	Installing /agua/apps/perl/5.18.2/lib/site_perl/5.18.2/MooX/Declare/Methods.pm
	Installing /agua/apps/perl/5.18.2/lib/site_perl/5.18.2/MooX/Declare/HasParams.pm
	Installing /agua/apps/perl/5.18.2/lib/site_perl/5.18.2/MooX/Declare/_RegisterTypes.pm
	Installing /agua/apps/perl/5.18.2/lib/site_perl/5.18.2/MooX/Declare/Class.pm
	Installing /agua/apps/perl/5.18.2/lib/site_perl/5.18.2/MooX/Declare/Types.pm
	Installing /agua/apps/perl/5.18.2/man/man3/MooX::Declare.3
	Appending installation info to /agua/apps/perl/5.18.2//lib/5.18.2/x86_64-linux/perllocal.pod

	
INSTALLED TO:

/agua/apps/perl/5.18.2/lib/site_perl/5.18.2/MooX/


	
2. INSTALLED DEPENDENCY Filter::Keyword

DEVELOPER'S WEBSITE
http://git.shadowcat.co.uk/gitweb/gitweb.cgi?p=p5sagit/Filter-Keyword.git;a=shortlog;h=refs/heads/single-filter

DOWNLOAD Filter::Keyword


mkdir -p /agua/apps/perl/5.18.2/downloads
cd /agua/apps/perl/5.18.2/downloads
wget http://git.shadowcat.co.uk/gitweb/gitweb.cgi?p=p5sagit/Filter-Keyword.git;a=snapshot;h=decee21b18f0e1ffcbe4558867fa75a528ec94fe;sf=tgz
tar xvfz Filter-Keyword-*
cp -r /agua/apps/perl/5.18.2/downloads/Filter-Keyword/lib/Filter \
/agua/apps/perl/5.18.2/lib/site_perl/5.18.2


3. VALIDATE

unset PERL5LIB
export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5:$PERL5LIB
/agua/apps/perl/5.18.2/bin/perl -e 'use MooX::Declare'

	OK

unset PERL5LIB
export PERL5LIB=/agua/apps/perl/5.18.2/lib/site_perl/5.18.2
export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5:$PERL5LIB
/agua/apps/perl/5.18.2/bin/perl -e 'use MooX::Declare'
	OK



THESE ARE NOT NECESSARY TO LOAD 'MooX::Declare':

export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2:$PERL5LIB
export PERL5LIB=/agua/apps/perl/5.18.2/lib/site_perl/5.18.2



NB: NEEDS THIS LINE

export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5:$PERL5LIB

TO FIND strictures MODULE

/agua/apps/perl/5.18.2/lib/5.18.2/lib/perl5/strictures.pm



	
</entry>
<entry [Mon 2014:04:14 06:34:28 EST] COLORZILLA CSS GRADIENT EDITOR>

http://www.colorzilla.com/gradient-editor/
	
</entry>
<entry [Mon 2014:04:14 06:32:14 EST] INSTALL Moox::Declare IN PACKAGED PERL>

1. CREATE moo FILE

emacs -nw /agua/bin/install/resources/agua/moo

	MooX::Declare
	Moo::Role
	Moose::Manual::Types
	MooX::Types::MooseLike	
	

2. INSTALL App::Cpanminus

/agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm  --no-interactive --notest -v -l /agua/apps/perl/5.18.2/lib/5.18.2 App::Cpanminus;



3. INSTALL Moo, ETC.

NB: EDITED install.sh TO TAKE NAME OF MODULE FILE AS SECOND ARGUMENT


export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2

/agua/bin/install/resources/agua/install.sh \
/agua/apps/perl/5.18.2/lib/5.18.2 \
/agua/bin/install/resources/agua/moo

	OK
	
	Installing modules to: /agua/apps/perl/5.18.2/lib/5.18.2
	[MooX::Declare]
	Installing build prerequisite MooX::Declare... done.
	[Moo::Role]
	Installing build prerequisite Moo::Role... done.
	[Moose::Manual::Types]
	Installing build prerequisite Moose::Manual::Types... done.
	[MooX::Types::MooseLike]
	Installing build prerequisite MooX::Types::MooseLike... done.

	
</entry>
<entry [Sat 2014:04:12 13:31:19 EST] USE Getopt::ArgParse FOR AUTOMATIC COMMAND LINE FOR APPS>

http://search.cpan.org/~mytram/Getopt-ArgParse-1.0.2/lib/Getopt/ArgParse.pm
	
http://search.cpan.org/~mytram/Getopt-ArgParse-1.0.2/lib/Getopt/ArgParse.pm

Getopt::ArgParse - Parsing command line arguments with a richer and more user-friendly API interface, similar to python's argpare but with perlish extras.

In particular, the modules provides the following features:

  - generating usage messages
  - storing parsed arg values in an object, which can be also used to
    load configuration values from files and therefore the ability for
    applications to combine configurations in a single interface
  - A more user-friendly interface to specify arguments, such as
    argument types, argument values split, etc.
  - Subcommand parsing, such svn < command>
  - Supporting both flag based optional arguments and positional arguments
VERSION ^

version 1.0.2

SYNOPSIS ^

 use Getopt::ArgParse;

 $ap = Getopt::ArgParse->new_parser(
        prog        => 'MyProgramName',
        description => 'This is a program',
    epilog      => 'This appears at the bottom of usage',
 );

 # Parse an option: '--foo value' or '-f value'
 $ap->add_arg('--foo', '-f', required => 1);

 # Parse a boolean: '--bool' or '-b' using a different name from
 # the option
 $ap->add_arg('--bool', '-b', type => 'Bool', dest => 'boo');

 # Parse a positonal option.
 # But in this case, better using subcommand. See below
 $ap->add_arg('command', required => 1);

 # $ns is also accessible via $ap->namespace
 $ns = $ap->parse_args(split(' ', 'test -f 1 -b'));

 say $ns->command; # 'test'
 say $ns->foo;     # false
 say $ns->boo;     # false
 say $ns->no_boo;   # true - 'no_' is added for boolean options

 # You can continue to add arguments and parse them again
 # $ap->namespace is accumulatively populated

 # Parse an Array type option and split the value into an array of values
 $ap->add_arg('--emails', type => 'Array', split => ',');
 $ns = $ap->parse_args(split(' ', '--emails a@perl.org,b@perl.org,c@perl.org'));
 # Because this is an array option, this also allows you to specify the
 # option multiple times and splitting
 $ns = $ap->parse_args(split(' ', '--emails a@perl.org,b@perl.org --emails c@perl.org'));

 # Below will print: a@perl.org|b@perl.org|c@perl.org|a@perl.org|b@perl.org|c@perl.org
 # Because Array types are appended
 say join('|', $ns->emails);

 # Parse an option as key,value pairs
 $ap->add_arg('--param', type => 'Pair', split => ',');
 $ns = $ap->parse_args(split(' ', '--param a=1,b=2,c=3'));

 say $ns->param->{a}; # 1
 say $ns->param->{b}; # 2
 say $ns->param->{c}; # 3

 # You can use choice to restrict values
 $ap->add_arg('--env', choices => [ 'dev', 'prod' ],);

 # or use case-insensitive choices
 # Override the previous option with reset
 $ap->add_arg('--env', choices_i => [ 'dev', 'prod' ], reset => 1);

 # or use a coderef
 # Override the previous option
 $ap->add_args(
        '--env',
        choices => sub {
                die "--env invalid values" if $_[0] !~ /^(dev|prod)$/i;
        },
    reset => 1,
 );

 # subcommands
 $ap->add_subparsers(title => 'subcommands'); # Must be called to initialize subcommand parsing
 $list_parser = $ap->add_parser(
         'list',
         help => 'List directory entries',
         description => 'A multiple paragraphs long description.',
 );

 $list_parser->add_args(
   [
     '--verbose', '-v',
      type => 'Count',
      help => 'Verbosity',
   ],
   [
     '--depth',
      help => 'depth',
   ],
 );

 $ns = $ap->parse_args(split(' ', 'list -v'));

 say $ns->current_command(); # current_command stores list,
                             # Don't use this name for your own option

 $ns =$ap->parse_args(split(' ', 'help list')); # This will print the usage for the list command
 # help subcommand is automatically added for you
 say $ns->help_command(); # list

 # Copy parsing
 $common_args = Getopt::ArgParse->new_parser();
 $common_args->add_args(
   [
     '--dry-run',
      type => 'Bool',
      help => 'Dry run',
   ],
 );

 $sp = $ap->add_parser(
   'remove',
   aliases => [qw(rm)],           # prog remove or prog rm
   parents => [ $command_args ],  # prog rm --dry-run
 );

 # Or copy explicitly
 $sp = $ap->add_parser(
   'copy',
   aliases => [qw(cp)],           # prog remove or prog rm
 );

 $sp->copy_args($command_parser); # You can also copy_parsers() but in this case
                                  # $common_parser doesn't have subparsers

</entry>
<entry [Sat 2014:04:12 13:29:08 EST] USE MooX::Declare TO SPEED UP Agua::Cli>

DOCUMENTATION
http://search.cpan.org/~haarg/Moo-1.004002/lib/Moo.pm


package Cat::Food;

use Moo;
use namespace::clean;

sub feed_lion {
  my $self = shift;
  my $amount = shift || 1;

  $self->pounds( $self->pounds - $amount );
}

has taste => (
  is => 'ro',
);

has brand => (
  is  => 'ro',
  isa => sub {
	die "Only SWEET-TREATZ supported!" unless $_[0] eq 'SWEET-TREATZ'
  },
);

has pounds => (
  is  => 'rw',
  isa => sub { die "$_[0] is too much cat food!" unless $_[0] < 15 },
);

1;
And elsewhere:

my $full = Cat::Food->new(
   taste  => 'DELICIOUS.',
   brand  => 'SWEET-TREATZ',
   pounds => 10,
);

$full->feed_lion;

say $full->pounds;

</entry>
<entry [Thu 2014:04:10 08:02:49 EST] INSTALL AGUA PERL MODULES DEPENDENCIES INTO /agua/apps/perl>

1. EDIT install.sh

emacs -nw /agua/bin/install/resources/agua/install.sh

CHANGE

/usr/bin/cpanm

TO

/agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm 


2. RUN install.sh

#export PERL5LIB=/home/syoung/.cpan/CPAN
#./install.sh /agua/apps/perl/5.18.2/lib/5.18.2

export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2
/agua/bin/install/resources/agua/install.sh /agua/apps/perl/5.18.2/lib/5.18.2 perlmods


</entry>
<entry [Thu 2014:04:10 06:20:15 EST] UPGRADE ALL PERL MODULES WITH cpanm>

SUMMARY: INSTALL


/agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm  App::cpanoutdated

1. INSTALL cpanm

curl -L http://cpanmin.us | perl - App::cpanminus

2. INSTALL cpan-outdated

/agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm App::cpanoutdated


3. INSTALL OUTDATED MODULES

cpan-outdated -p | cpanm

agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm  BINGOS/ExtUtils-MakeMaker-6.74.tar.gz
	--> Working on BINGOS/ExtUtils-MakeMaker-6.74.tar.gz

##/agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm App::cpanoutdated
/agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm TOKUHIROM/cpan-outdated-0.28.tar.gz


http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/local-lib-1.008015.tar.gz



/agua/apps/perl/5.18.2/bin/cpan-outdated 

L/LE/LEONT/Test-Harness-3.30.tar.gz
B/BI/BINGOS/Archive-Extract-0.72.tar.gz
B/BI/BINGOS/Archive-Tar-1.96.tar.gz
S/SM/SMUELLER/Attribute-Handlers-0.96.tar.gz
P/PJ/PJF/autodie-2.25.tar.gz
S/SM/SMUELLER/AutoLoader-5.74.tar.gz
R/RU/RURBAN/B-Debug-1.19.tar.gz
Z/ZE/ZEFRAM/Carp-1.3301.tar.gz
M/MA/MARKSTOS/CGI.pm-3.65.tar.gz
P/PM/PMQS/Compress-Raw-Bzip2-2.064.tar.gz
P/PM/PMQS/Compress-Raw-Zlib-2.065.tar.gz
P/PM/PMQS/IO-Compress-2.064.tar.gz
H/HM/HMBRAND/Config-Perl-V-0.20.tgz
D/DA/DAGOLDEN/CPAN-Meta-2.140640.tar.gz
D/DA/DAGOLDEN/CPAN-Meta-Requirements-2.125.tar.gz
D/DA/DAGOLDEN/CPAN-Meta-YAML-0.012.tar.gz
B/BI/BINGOS/CPANPLUS-0.9148.tar.gz
B/BI/BINGOS/CPANPLUS-Dist-Build-0.76.tar.gz
W/WO/WOLFSAGE/Devel-PPPort-3.22.tar.gz
G/GA/GAAS/Digest-MD5-2.53.tar.gz
M/MS/MSHELOR/Digest-SHA-5.88.tar.gz
D/DA/DANKOGAI/Encode-2.59.tar.gz
A/AM/AMBS/ExtUtils/ExtUtils-CBuilder-0.280216.tar.gz
F/FL/FLORA/ExtUtils-Command-1.18.tar.gz
B/BI/BINGOS/ExtUtils-MakeMaker-6.94.tar.gz
B/BI/BINGOS/ExtUtils-Install-1.64.tar.gz
S/SM/SMUELLER/ExtUtils-ParseXS-3.24.tar.gz
B/BI/BINGOS/File-Fetch-0.48.tar.gz
D/DA/DAGOLDEN/File-Temp-0.2304.tar.gz
S/SM/SMUELLER/Filter-Simple-0.91.tar.gz
R/RU/RURBAN/Filter-1.49.tar.gz
J/JV/JV/Getopt-Long-2.42.tar.gz
D/DA/DAGOLDEN/HTTP-Tiny-0.043.tar.gz
L/LE/LEONT/Module-Build-0.4205.tar.gz
B/BI/BINGOS/IPC-Cmd-0.92.tar.gz
M/MH/MHX/IPC-SysV-2.04.tar.gz
M/MA/MAKAMAKA/JSON-PP-2.27203.tar.gz
P/PE/PEVANS/Scalar-List-Utils-1.38.tar.gz
E/ET/ETHER/local-lib-2.000011.tar.gz
S/SB/SBECK/Locale-Codes-3.30.tar.gz
B/BI/BINGOS/Log-Message-0.08.tar.gz
P/PJ/PJACKLAM/Math-BigInt-1.9993.tar.gz
P/PJ/PJACKLAM/bignum-0.37.tar.gz
P/PJ/PJACKLAM/Math-BigInt-FastCalc-0.31.tar.gz
P/PJ/PJACKLAM/Math-BigRat-0.2606.tar.gz
G/GA/GAAS/MIME-Base64-3.14.tar.gz
B/BI/BINGOS/Module-CoreList-3.09.tar.gz
B/BI/BINGOS/Module-Load-0.32.tar.gz
B/BI/BINGOS/Module-Load-Conditional-0.62.tar.gz
E/ET/ETHER/Module-Metadata-1.000019.tar.gz
S/SI/SIMONW/Module-Pluggable-5.1.tar.gz
B/BI/BINGOS/Object-Accessor-0.48.tar.gz
B/BI/BINGOS/Package-Constants-0.04.tar.gz
B/BI/BINGOS/Params-Check-0.38.tar.gz
C/CO/CORION/parent-0.228.tar.gz
D/DA/DAGOLDEN/Parse-CPAN-Meta-1.4414.tar.gz
D/DA/DAGOLDEN/Perl-OSType-1.007.tar.gz
L/LL/LLAP/perlfaq-5.0150044.tar.gz
M/MA/MAREKR/Pod-Checker-1.70.tar.gz
N/NE/NEILB/Pod-Escapes-1.06.tar.gz
M/MA/MAREKR/Pod-Parser-1.62.tar.gz
R/RR/RRA/podlators-2.5.3.tar.gz
M/MA/MALLEN/Pod-Perldoc-3.23.tar.gz
M/MA/MAREKR/Pod-Usage-1.63.tar.gz
P/PE/PEVANS/Socket-2.013.tar.gz
A/AM/AMS/Storable-2.45.tar.gz
S/SA/SAPER/Sys-Syslog-0.33.tar.gz
R/RR/RRA/Term-ANSIColor-4.03.tar.gz
J/JS/JSTOWE/Term-Cap-1.16.tar.gz
F/FL/FLORA/Term-ReadLine-1.14.tar.gz
B/BI/BINGOS/Term-UI-0.42.tar.gz
C/CH/CHORNY/Text-ParseWords-3.29.tar.gz
M/MU/MUIR/modules/Text-Tabs+Wrap-2013.0523.tar.gz
J/JD/JDHEDDEN/Thread-Queue-3.05.tar.gz
J/JD/JDHEDDEN/threads-1.92.tar.gz
J/JD/JDHEDDEN/threads-shared-1.46.tar.gz
Z/ZE/ZEFRAM/Time-HiRes-1.9726.tar.gz
R/RJ/RJBS/Time-Piece-1.27.tar.gz
S/SA/SADAHIRO/Unicode-Collate-1.04.tar.gz
S/SA/SADAHIRO/Unicode-Normalize-1.17.tar.gz
J/JP/JPEACOCK/version-0.9908.tar.gz


UPDATE ALL OUTDATED PERL MODULES:

/agua/apps/perl/5.18.2/bin/cpan-outdated | /agua/apps/perl/5.18.2/bin/perl /usr/bin/cpanm 




</entry>
<entry [Thu 2014:04:10 04:28:10 EST] PERL BUNDLES>

http://www.slideshare.net/badenhughes/managing-perl-a-sysadmins-view

	
1. CREATE BUNDLE FILE

perl -MCPAN -e shell
autobundle

WHICH CREATES FILE

/root/.cpan/Bundle/Snapshot_2014_04_10_00.pm


2. INSTALL ON NEW MACHINE

perl -MCPAN -e "install /root/.cpan/Bundle/Snapshot_2014_04_10_00.pm"



</entry>
<entry [Thu 2014:04:10 04:14:05 EST] USE Local::lib>

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"
	
</entry>
<entry [Thu 2014:04:10 04:13:51 EST] LIST INSTALLED PERL MODULES>

perldoc perllocal | grep \"Module\"
	
</entry>
<entry [Thu 2014:04:10 03:02:00 EST] FIXED AGUA createCert>

PROBLEM

WHEN A NODE IS RESTARTED OR IS RECONFIGURED WITH A NEW IP ADDRESS, THE SSL CERTIFICATE MUST BE RECREATED

STARTUP LOG OF INSTANCE

/etc/rc2.d/S99rc.local: 43: /etc/rc2.d/S99rc.local: /etc/init.d/apache2: not found
Can't locate Agua/Installer.pm in @INC (@INC contains: /agua/bin/scripts/../../lib /etc/perl /usr/local/lib/perl/5.14.2 /usr/local/share/perl/5.14.2 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.14 /usr/share/perl/5.14 /usr/local/lib/site_perl .) at /agua/bin/scripts/createCert.pl line 65.
BEGIN failed--compilation aborted at /agua/bin/scripts/createCert.pl line 65.


SOLUTION

FIXED

/agua/bin/scripts/createCert.pl

	
</entry>
<entry [Wed 2014:04:09 02:54:33 EST] INSTALL PERL 5.18.2 LOCALLY>

http://troy.jdmz.net/perls/

1. INSTALL PERL 5.18.2

sudo mkdir -p /aguadev/apps/perl/
sudo chown $USER:$USER /aguadev/apps/perl
cd /aguadev/apps/perl/
mkdir build cpan
cd build/
wget http://www.cpan.org/src/5.0/perl-5.18.2.tar.gz
tar xzvf perl-5.18.2.tar.gz
cd perl-5.18.2
rm -f config.sh Policy.sh ; sh Configure -de -Dprefix=/agua/apps/perl/5.18.2

	Updating makefile...
	make[1]: Leaving directory `/mnt/repos/private/syoung/aguadev/apps/perl/build/perl-5.18.2/x2p'
	Now you must run 'make'.
	
	If you compile perl5 on a different machine or from a different object
	directory, copy the Policy.sh file from this object directory to the
	new one before you run Configure -- this will help you with most of
	the policy defaults.

make && make test && make install


2. SET UP CPAN
/agua/apps/perl/5.18.2/bin/perl -MCPAN -e shell

LET IT "autoconfigure"
	
	...
	commit: wrote '/home/syoung/.cpan/CPAN/MyConfig.pm'

type EXIT at the prompt.

EDIT MyConfig.pm FILE:

/home/syoung/.cpan/CPAN/MyConfig.pm


CHANGE PATHS FROM:

  'build_dir' => q[/home/syoung/.cpan/build],
  'cpan_home' => q[/home/syoung/.cpan],
  'histfile' => q[/home/syoung/.cpan/histfile],
  'keep_source_where' => q[/home/syoung/.cpan/sources],
  'prefs_dir' => q[/home/syoung/.cpan/prefs],
  
TO 

  'build_dir' => q[/agua/apps/perl/cpan/build],
  'cpan_home' => q[/agua/apps/perl/cpan],
  'histfile' => q[/agua/apps/perl/cpan/histfile],
  'keep_source_where' => q[/agua/apps/perl/cpan/sources],
  'prefs_dir' => q[/agua/apps/perl/cpan/prefs],


3. START CPAN (CHECK FOR ERRORS):

/agua/apps/perl/5.18.2/bin/perl -MCPAN -e shell


4. INSTALL CPAN AND LWP:

install Bundle::CPAN Bundle::LWP


5. INSTALL PERL MODULES

perl -e 'print join "\n", @INC;'
	/agua/apps/perl/5.18.2/lib/5.18.2
	/etc/perl
	/usr/local/lib/perl/5.14.2
	/usr/local/share/perl/5.14.2
	/usr/lib/perl5
	/usr/share/perl5
	/usr/lib/perl/5.14
	/usr/share/perl/5.14
	/usr/local/lib/site_perl


export PERL5LIB=/agua/apps/perl/5.18.2/lib/5.18.2
/agua/bin/install/resources/agua/install.sh \
/agua/apps/perl/5.18.2/lib/5.18.2 \
perlmods


</entry>
<entry [Tue 2014:04:08 03:39:57 EST] PERL MODULES PACKAGED WITH DISTRO>

1. INSTALLED INDEPENDENCIES

# INSTALL mysql ON UBUNTU
apt-get install -y mysql-server
apt-get install -y mysql-client
apt-get install -y libmysqlclient-dev

# INSTALL mysql ON CENTOS
yum install -y mysql-server
yum install -y mysql
yum install mysql-devel

# INSTALL EXPAT FOR XML::Simple
mkdir -p /tmp/expat
cd /tmp/expat
wget http://downloads.sourceforge.net/expat/expat-2.0.1.tar.gz
tar xvfz expat-2.0.1.tar.gz
cd expat-2.0.1
./configure
make
make install

# INSTALL libxml2 DEVEL
apt-get install -y libxml2-dev
OR
yum install -y libxml2-devel

# http://search.cpan.org/dist/App-cpanminus/bin/cpanm
IN install.sh ADDED TO cpanm CALL --config-args='-y'


2. RUN install.sh (SEE CONTENTS BELOW)

mkdir /tmp/perlmods
/agua/bin/install/resources/agua/install.sh 


3. PACKAGE IT UP AND STORE IT

cd /tmp
tar cvfz perlmods.tar.gz perlmods
cp -r perlmods.tar.gz /home/syoung/software/agua


4. MOVE IT TO lib/external

cp /tmp/perlmods/lib/perl5



4. USE IT BY EXPORTING PERL5LIB

export PERL5LIB=/tmp/perlmods/lib/perl5


5. USE IT IN APPS

#!/usr/bin/perl

use FindBin qw($Bin);
use lib "$Bin/../../lib";
use lib "$Bin/../../lib/external";



6. ADD ARCHITECTURE-SPECIFIC SUBDIRS

i686-linux-gnu-thread-multi-64int




install.sh
----------

<!--

#!/bin/bash

done_message () {
    if [ $? == 0 ]; then
        echo " done."
        if [ "x$1" != "x" ]; then
            echo $1;
        fi
    else
        echo " failed.  See setup.log file for error messages." $2
        echo "    Please check INSTALL file for items that should be installed by a package manager"
        exit 1
    fi
}

if [ "$#" -ne "1" ] ; then
  echo "Please provide an installation path  such as /opt/ICGC"
  exit 0;
fi

INST_PATH=$1;

echo "Installing modules to: $INST_PATH"

# get current directory
INIT_DIR=`pwd`

# cleanup inst_path
mkdir -p $INST_PATH/bin
cd $INST_PATH
INST_PATH=`pwd`
cd $INIT_DIR

# make sure that build is self contained
unset PERL5LIB;
ARCHNAME=`perl -e 'use Config; print $Config{archname};'`;
PERLROOT=$INST_PATH/lib/perl5
PERLARCH=$PERLROOT/$ARCHNAME
export PERL5LIB="$PERLROOT:$PERLARCH";

#create a location to build dependencies
SETUP_DIR=$INIT_DIR/install_tmp
mkdir -p $SETUP_DIR

# re-initialise log file
echo > $INIT_DIR/setup.log;


# log information about this system
(
    echo '============== System information ====';
    set -x;
    lsb_release -a;
    uname -a;
    sw_vers;
    system_profiler;
    grep MemTotal /proc/meminfo;
    set +x;
    echo; echo;
) >>$INIT_DIR/setup.log 2>&1;


#perlmods=( "Module::Build" "File::ShareDir" "File::ShareDir::Install" "Const::Fast" )
#for i in "${perlmods[@]}";
#do

export PERL_MM_USE_DEFAULT=1
export PERL_AUTOINSTALL=--defaultdeps


perlmods=$(<perlmods)
#perlmods=$(<coro)
#perlmods=$(<xml)
for i in $perlmods;
do
	echo "[.......] $i"
  echo -n "Installing build prerequisite $i..."
  if( perl -I$INST_PATH/lib/perl5 -Mlocal::lib=$INST_PATH -M$i -e 1 >& /dev/null); then
      echo $i already installed.
  else
    (
      set +e;
#      /usr/bin/cpanm --configure-args="-y" --install-args  --no-interactive --notest -v -l $INST_PATH $i;
      if [[ `/usr/bin/cpanm --no-interactive --notest -v -l $INST_PATH $i;` ]]; then
	  echo "Standard install succeeded"
      elif [[ `/usr/bin/cpanm --configure-args="-y"  --no-interactive --notest -v -l $INST_PATH $i;` ]]; then
	  echo "Installed with --configure-args"
      elif [[ `/usr/bin/cpanm --configure-args="-y" --install-args  --no-interactive --notest -v -l $INST_PATH $i;` ]]; then
	  echo "Installed with --configure-args=\"-y\" --install-args=\"-y\""
      fi

#      if [ $? == 0 ]; then
#	  echo "Doing cpanm install without --configure-args"
#	  /usr/bin/cpanm  --no-interactive --notest -v -l $INST_PATH $i;
#      fi

      set -e;
#      /usr/bin/cpanm --configure-args="-y" --install-args="-y"  --no-interactive --notest -v -l $INST_PATH $i;
#      /usr/bin/cpanm --configure-args="-y"  --no-interactive --notest -v -l $INST_PATH $i;
      echo; echo;
    ) >>$INIT_DIR/setup.log 2>&1;
    done_message "" "Failed during installation of $i.";
  fi
done

-->


</entry>
<entry [Fri 2014:04:04 14:41:24 EST] CREATED BRANCH lite WITHOUT TESTS>

1. ON ALIEN

cd /aguadev
git checkout -b lite

EDIT

emacs -nw .gitignore

ADD

#### LITE
t

cd /aguadev
rm -fr t
gitadd
gitcom

git push git lite
	OK


2. ON VM

mkdir lite
cd lite
git init
#time git remote add -t lite -f origin git@github.com:syoung/aguadev
time git remote add -t lite -f origin https://github.com/syoung/aguadev


	STARTS PULLING AUTOMATICALLY 

	Updating origin
	remote: Counting objects: 100911, done.
	remote: Compressing objects: 100% (56434/56434), done.
	remote: Total 100911 (delta 40689), reused 100871 (delta 40673)
	Receiving objects: 100% (100911/100911), 1.16 GiB | 18.97 MiB/s, done.
	Resolving deltas: 100% (40689/40689), done.
	From github.com:syoung/aguadev
	 * [new branch]      lite       -> origin/lite
	From github.com:syoung/aguadev
	 * [new tag]         0.6        -> 0.6
	 * [new tag]         0.7        -> 0.7
	 * [new tag]         0.7.1      -> 0.7.1
	 * [new tag]         0.7.2      -> 0.7.2
	 * [new tag]         0.7.3      -> 0.7.3
	...
	 * [new tag]         0.8.0-beta.1+build.18 -> 0.8.0-beta.1+build.18
	 * [new tag]         0.8.0-beta.1+build.19 -> 0.8.0-beta.1+build.19
	 * [new tag]         0.8.0-beta.1+build.2 -> 0.8.0-beta.1+build.2
	 * [new tag]         0.8.0-beta.1+build.20 -> 0.8.0-beta.1+build.20
	 * [new tag]         0.8.0-beta.1+build.21 -> 0.8.0-beta.1+build.21
	 * [new tag]         0.8.0-beta.1+build.22 -> 0.8.0-beta.1+build.22
	 * [new tag]         0.8.0-beta.1+build.3 -> 0.8.0-beta.1+build.3
	 * [new tag]         0.8.0-beta.1+build.4 -> 0.8.0-beta.1+build.4
	...
	 * [new tag]         0.8.0-beta.1+build.9 -> 0.8.0-beta.1+build.9

	
</entry>
<entry [Tue 2014:04:01 22:01:21 EST] VAGRANT - NETWORK VMs TOGETHER>

https://github.com/adrienthebo/vagrant-hosts
	
</entry>
<entry [Mon 2014:03:31 17:18:53 EST] MESSAGE QUEUE IN PERL>

https://github.com/rabbitmq/rabbitmq-tutorials/tree/master/perl
	
</entry>
<entry [Mon 2014:03:31 11:07:25 EST] INSTALL PERL LIBS LOCALLY ON CENTOS VAGRANT>

http://perltraining.com.au/tips/2012-03-27.html
http://search.cpan.org/~apeiron/local-lib-1.003003/lib/local/lib.pm
https://wiki.hpcc.msu.edu/display/Bioinfo/Installing+Local+Perl+Modules+with+CPAN
http://search.cpan.org/~flora/ExtUtils-Manifest-1.63/lib/ExtUtils/Manifest.pm



CENTOS
x86_64-linux-thread-multi

UBUNTU
x86_64-linux-gnu-thread-multi


ON ALIEN:

cd /data2/vagrant/centos2
sudo su
vagrant up
vagrant ssh

ON VM (AS centos USER):

DOWNLOAD local::lib

wget http://search.cpan.org/CPAN/authors/id/A/AP/APEIRON/local-lib-1.003003.tar.gz
tar xvfz local-lib-1.003003.tar.gz
cd local-lib-1.003003
perl Makefile.PL --bootstrap
make test && make install

echo 'eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)' >>~/.bashrc


DOWNLOAD ExtUtils::Manifest

wget http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/ExtUtils-Manifest-1.63.tar.gz
tar xvfz ExtUtils-Manifest-1.63.tar.gz
cd ExtUtils-Manifest-1.63
./configure --prefix=~/perl5


perl -Mlocal::lib

	export PERL_LOCAL_LIB_ROOT="/home/syoung/perl5";
	export PERL_MB_OPT="--install_base /home/syoung/perl5";
	export PERL_MM_OPT="INSTALL_BASE=/home/syoung/perl5";
	export PERL5LIB="/home/syoung/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/syoung/perl5/lib/perl5";
	export PATH="/home/syoung/perl5/bin:$PATH";


export PERL_LOCAL_LIB_ROOT="/root/perl5"; export PERL_MB_OPT="--install_base /root/perl5"; export PERL_MM_OPT="INSTALL_BASE=/root/perl5"; export PERL5LIB="/root/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/root/perl5/lib/perl5"; export PATH="/root/perl5/bin:$PATH"; 


	
</entry>
<entry [Mon 2014:03:10 01:04:30 EST] FIXED APACHE ERROR: 'You don't have permission to access /agua/ on this server'>

PROBLEM

AFTER INSTALL ON CENTOS 6.4, IN BROWSER
	-	LOCALHOST DOESN'T SHOW agua FOLDER
	-	LOCALHOST/agua GIVES ERROR
		'You don't have permission to access /agua/ on this server'
		
SOLUTION

EDIT httpd.conf, REPLACE 'Order...' AND 'Allow...' LINES WITH 'Require all granted'

<!--

emacs -nw /etc/httpd/conf/httpd.conf

<Directory "/var/www/html">
    Options Indexes FollowSymLinks
    AllowOverride None

	#    Order allow,deny
	#    Allow from all
	Require all granted

</Directory>

-->

	
</entry>
<entry [Thu 2014:03:06 20:03:35 EST] package.json SPECIFICATION>

https://www.npmjs.org/doc/json.html
	
</entry>
<entry [Mon 2014:03:03 06:19:39 EST] node XML TO JSON>

http://stackoverflow.com/questions/5672151/any-recommendation-for-xml-to-json-for-node-js
	
</entry>
<entry [Mon 2014:03:03 06:16:45 EST] MOBILE APP EXAMPLE - TOPCOAT AND PHONEGAP>

http://coenraets.org/blog/2013/06/building-modular-mobile-phonegap-apps-with-backbone-js-requirejs-and-topcoat/

d3.js	
http://coenraets.org/blog/2014/02/interactive-mobile-dashboard-d3-charts/


</entry>
<entry [Sun 2014:03:02 22:26:18 EST] NODE AND DATABASES (COUCHDB)>

APP MADE WITH BACKBONE, PHONEGAP, TOPCOAT
http://coenraets.org/blog/2013/06/building-modular-mobile-phonegap-apps-with-backbone-js-requirejs-and-topcoat/

http://coenraets.org/apps/directory-backbone-topcoat-require/

TOPCOAT
http://topcoat.io/

	
</entry>
<entry [Sun 2014:03:02 22:06:12 EST] DOWNLOADED QUNIT>

wget http://code.jquery.com/qunit/qunit-1.14.0.js
wget http://code.jquery.com/qunit/qunit-1.14.0.css


index.html

<!--

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>QUnit Example</title>
  <link rel="stylesheet" href="/resources/qunit.css">
</head>
<body>
  <div id="qunit"></div>
  <div id="qunit-fixture"></div>
  <script src="/resources/qunit.js"></script>
  <script src="/resources/tests.js"></script>
</body>
</html>

-->

tests.js

test( "hello test", function() {
  ok( 1 == "1", "Passed!" );
});

	
</entry>
<entry [Sun 2014:03:02 21:54:06 EST] 'JUST NOW' TIMING WITH METHOD howLongAgo>

function howLongAgo (now, time) {
  var date = new Date(time || ""),
    diff = (((new Date(now)).getTime() - date.getTime()) / 1000),
    day_diff = Math.floor(diff / 86400);
 
  if ( isNaN(day_diff) || day_diff < 0 || day_diff >= 31 )
    return;
 
  return day_diff == 0 && (
      diff < 60 && "just now" ||
      diff < 120 && "1 minute ago" ||
      diff < 3600 && Math.floor( diff / 60 ) +
        " minutes ago" ||
      diff < 7200 && "1 hour ago" ||
      diff < 86400 && Math.floor( diff / 3600 ) +
        " hours ago") ||
    day_diff == 1 && "Yesterday" ||
    day_diff < 7 && day_diff + " days ago" ||
    day_diff < 31 && Math.ceil( day_diff / 7 ) +
      " weeks ago";
}
	
</entry>
<entry [Sun 2014:03:02 18:35:21 EST] INSTALLED grunt TO AUTOMATE TESTS>

http://merrickchristensen.com/articles/gruntjs-workflow.html



1. INSTALL GRUNT LOCALLY

cd /tmp/temp
npm install grunt 


2. CREATE Gruntfile.js FILE

module.exports = function(grunt) {

mocha: {
  all: ['tests/index.html']
};

grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
		options: {
			banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
		},
		dist: {
			src: 'src/<%= pkg.name %>.js',
			dest: 'dist/<%= pkg.name %>.min.js'
		}
    }
});

grunt.loadNpmTasks('grunt-mocha');

};


3. CREATED package.json

cat package.json 
{
  "name": "biorepository",
  "version": "0.1.0",
  "devDependencies": {
    "grunt": "~0.4.2",
    "grunt-contrib-jshint": "~0.6.3",
    "grunt-contrib-nodeunit": "~0.2.0",
    "grunt-contrib-uglify": "~0.2.2",
    "grunt-mocha": "~0.4.10"
  }
}


4. INSTALL grunt PLUGIN FOR MOCHA

cd /tmp/temp
npm install grunt-mocha -D



5. RUN mocha TEST

grunt mocha

	Running "mocha:all" (mocha) task
	Testing: /aguadev/t/unit/html/plugins/apps/packages/test.html
	
	Warning: PhantomJS timed out, possibly due to a missing Mocha run() call. Use --force to continue.
	
	Aborted due to warnings.



</entry>
<entry [Thu 2014:02:27 10:42:37 EST] ADD DEPLOY FOR JBrowse DATA>

    "resources"         :   {
        "datavolume"         :   {
                "id"            :   "snap-6341b301",
                "name"          :   "aquarius-8",
                "description"   :   "Bioinformatics data volume: Bioapps SNP SQLite database, NextGen aligner reference sequences and JBrowse feature data"
        },
        "configfile"    :   "conf/default.conf"
    }

	
</entry>
<entry [Wed 2014:02:26 23:44:56 EST] CHANGED NODE VERSION TO 0.10.26 ON CENTOS 6.4>

CENTOS 6.4
http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz

CENTOS 6.3
http://nodejs.org/dist/v0.10.15/node-v0.10.15.tar.gz
  
	
</entry>
<entry [Thu 2014:02:13 00:57:29 EST] arvados MARKETING>

https://arvados.org/projects/arvados/wiki/Introduction_to_Arvados

Introduction to Arvados

Overview
Arvados is a platform for storing, organizing, processing, and sharing genomic and other biomedical big data. The platform is designed to make it easier for bioinformaticians to develop analyses, developers to create genomic web applications and IT administers to manage large-scale compute and storage genomic resources. The platform is designed to run on top of "cloud operating systems" such as Amazon Web Services and OpenStack. Currently, there are implementations that work on AWS and Xen+Debian/Ubuntu.

Project
The core technology has been under development at Harvard Medical School for many years (see history). We are now in the process of refactoring original code, refactoring the APIs, and developing significant new capabilities.

Why Arvados
A set of relatively low-level compute and data management functions are consistent across a wide range of analysis pipelines and applications that are being built for genomic data. Unfortunately, every organization working with these data have been forced to build their own custom systems for these low level functions. At the same time, there are proprietary platforms emerging that seek to solve these same problems. Arvados was created to provide a common solution across a wide range of applications that would be free and open source.

Benefits
The Arvados platform seeks to solve a set of common problems faced by informaticians and IT Organizations:

Benefits to informaticians:
Make authoring analyses and constructing pipelines in any language as efficient as possible
Provide an environment that can run open source and commercial tools (e.g. Galaxy, GATK, etc.)
Enable deep provenance and reproducibility across all pipelines
Provide a way to flexibly organize data and ensure data integrity
Make queries of variant and other compact genome data very high-performance
Create a simple way to run distributed batch processing jobs
Enable the secure sharing of data sets from small to very large
Provide a set of common APIs that enable application and pipeline portability across systems
Offer a reference environment for implementation of standards
Standardize file format translation
Benefits to IT organizations:
Low total cost of ownership
Eliminate unnecessary data duplication
Ability to create private, on-premise clouds
Self-service provisioning of resources
Ability to utilize low-cost off the shelf hardware
Easy-to-manage horizontally scaling architecture
Straight-forward browser-based administration
Provide facilities for hybrid (public and private) clouds
Ensure full compliance with security and regulatory standards
Support data sets from tens of terabytes to exabytes
Functional Capabilities¶
Functionally, Arvados has two major sets of capabilities: (a) data management and (b) compute management.

Data Management
The data management services are designed to handle all of the challenges associated with storing and organizing large omic data sets. The heart of theses services is the Data Manager, which brokers data storage. The data management system is designed to handle the following needs:

Store files (e.g. BAM, FASTQ, VCF, etc.) reliably
Store metadata about files for a wide variety of organizational schema
Create collections (sets of files) that can be used in analyses
Ensure files are not unnecessarily duplicated
Track provenance (sources and methods used to produce data)
Control who can access which files
Offer reliable distributed storage using inexpensive commodity disks
Control storage redundancy based on importance of datasets
Compute Management
The compute management services are designed to handle the challenges associated with creating and running pipelines as large scale distributed processing jobs.

Enable a common way to represent pipelines (JSON)
Support the use of any pipeline creation tool
Keep all pipeline code in a revision control system (git repository)
Run pipelines as distributed computations using MapReduce
Easily and reliably retrieve pipeline outputs
Store a record of every pipeline that is run
Eliminate the need to re-run pipeline components that have already been run
Easily and reliably re-run and verify any past pipeline
Create a straightforward way to author web applications that use underlying data and pipelines
Easily share results, pipelines, and applications between systems
Run distributed computations across clusters in different data centers to make use of very large data sets
The compute management system also includes a sub-component for doing tertiary analysis. This component provides an in-memory database for very high-performance queries of a compact representation of a genome that includes variants and other relevant data needed for tertiary analysis. (This component is in the design stage.)

Virtual Machines
Arvados works best in an environment where informaticians receive access to virtual machines (VMs) on a private or public cloud. This approach eliminates the need to manage separate physical servers for different projects, significantly increasing the utilization of underlying hardware resources. It also gives informaticians a great deal of freedom to choose the best operating systems and tools for their work. With virtual machines, each informatician or project team has full isolation, security, autonomy, and privacy for their work.

The Arvados platform provides shared common services that can be used from within a virtual machine. All of the Arvados services are accessible through APIs.

APIs and SDKs
Arvados is designed so all of the data management and compute management services can be accessed through a set of a consistent APIs and interfaces. Most of the functionality is represented in a set of REST APIs. Some components use native interfaces (notably Keep and git). Arvados provides SDKs for popular languages (Python, Perl, Ruby, R, and Java) as well as a standalone tool for command line use.

Workbench
Arvados includes a browser-based UI which provides a convenient way to do common browsing and searching tasks. Workbench also serves as an application portal, providing a point of access to applications running on Arvados.

Related Articles
Technical Architecture showing key components

Creative Commons License Unless noted, site content licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
Powered by Redmine © 2006-2013 Jean-Philippe Lang
	
</entry>
<entry [Wed 2014:02:12 23:41:26 EST] REMOVED TOPHAT DOWNLOAD FROM biorepodev>

1. BACKUP biorepodev REPO

cd /mnt/repos/private/syoung
cp -r biorepodev biorepodev.bkp


2. REMOVE TOPHAT *.tar.gz FILE FROM PREVIOUS COMMITS

cd /mnt/repos/private/syoung/biorepodev
git filter-branch --index-filter \
'git rm --cached --ignore-unmatch syoung/tophat/tophat-2.0.9.Linux_x86_64*' \
--tag-name-filter cat -- --all


3. DELETE BACKUPS TO REMOVE FILE FOREVER

cd /mnt/repos/private/syoung/biorepodev
rm -Rf .git/refs/original       # careful
git gc --aggressive --prune=now # danger

*** REDUCED REPO SIZE BY 2 MB TO 32 MB ***

</entry>
<entry [Thu 2014:02:06 21:32:02 EST] PUPPET FAIL TO RESTART HTTPD>

RESET ROOT MYSQL PASSWORD ON CENTOS
https://dev.mysql.com/doc/refman/5.5/en/resetting-permissions.html


1) sudo service mysqld stop
2) sudo service mysqld startsos
3) mysql -u root
4) Now you will be at mysql prompt. Here type:-
4.1) UPDATE mysql.user SET Password=PASSWORD('NewPassHere') WHERE User='root';
4.2) FLUSH PRIVILEGES;
4.3) quit;
5) sudo service mysqld restart


Syntax error on line 36 of /etc/httpd/conf.d/25-ssl.conf:
Invalid command 'SSLEngine', perhaps misspelled or defined by a module not included in the server configuration




Warning: /Stage[main]/Rabbitmq::Install::Rabbitmqadmin/File[/usr/local/bin/rabbitmqadmin]: Skipping because of failed dependencies
Warning: /Stage[main]/Rabbitmq/Anchor[rabbitmq::end]: Skipping because of failed dependencies
Error: Could not find a suitable provider for rabbitmq_plugin



anagement] has failures: true
Notice: Finished catalog run in 7.08 seconds
^[[5~Error: Duplicate declaration: Package[npm] is already declared in file /etc/puppet/modules/nodejs/manifests/init.pp:99; cannot redeclare at /etc/puppet/manifests/nodejs.pp:18 on node benchmarker.openstacklocal
Error: Duplicate declaration: Package[npm] is already declared in file /etc/puppet/modules/nodejs/manifests/init.pp:99; cannot redeclare at /etc/puppet/manifests/nodejs.pp:18 on node benchmarker.openstacklocal


Installer::installNode    nodeurl: http://nodejs.org/dist/v0.10.15/node-v0.10.15.tar.gz
--2014-02-07 05:32:45--  http://nodejs.org/dist/v0.10.15/node-v0.10.15.tar.gz
Resolving nodejs.org... 165.225.133.150
Connecting to nodejs.org|165.225.133.150|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 13760477 (13M) [application/octet-stream]
Saving to: “node-v0.10.15.tar.gz.1”

100%[================================================>] 13,760,477  3.73M/s   in 3.8s    

2014-02-07 05:32:49 (3.46 MB/s) - “node-v0.10.15.tar.gz.1” saved [13760477/13760477]

tar (child): node-v0.10.15: Cannot read: Is a directory
tar (child): At beginning of tape, quitting now
tar (child): Error is not recoverable: exiting now

gzip: stdin: unexpected end of file



	
</entry>
<entry [Fri 2014:01:24 17:08:23 EST] SOLVED RABBITMQ FAILS TO START: 'epmd error for host "loaner": address (cannot connect to host/port)'>
	
PROBLEM

cat /var/log/rabbitmq/startup_log
	ERROR: epmd error for host "loaner": address (cannot connect to host/port)


DIAGNOSIS

INCORRECT IP ADDRESS FOR HOST IN /etc/hosts

	10.1.0.200	loaner.loaner.bcf.net	loaner

ALSO:

RABBITMQ CAN'T START IF THERE IS A MISMATCH BETWEEN THE hostname AND THE CONTENTS OF

/etc/hosts
/etc/hostname


SOLUTION

FIX /etc/hosts:

	10.1.0.136	loaner.bcf.net	loaner


</entry>
<entry [Fri 2014:01:24 15:38:09 EST] SOLVED PUPPET apt-get ERROR: ''>

PROBLEM

puppet apply /etc/puppet/manifests/apache.pp

	...
	/usr/bin/apt-get -q -y -o DPkg::Options::=--force-confold install apache2
	...
	WARNING: The following packages cannot be authenticated!
	  libcap2 libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap
	  apache2.2-bin apache2-utils apache2.2-common apache2-mpm-worker apache2
	  ssl-cert
	E: There are problems and -y was used without --force-yes
	

SOLUTION

apt-get install debian-archive-keyring -y --force-yes
apt-get update

	
</entry>
<entry [Thu 2014:01:23 02:12:20 EST] ADDED Logic::Shepherd TO bioapps>

http://perldoc.perl.org/threads.html

-	USES THREADS TO RUN JOBS IN PARALLEL

-	RUNS max JOBS CONCURRENTLY

-	POLLS PERIODICALLY TO GET OUTPUT FROM COMPLETED JOBS

-	ADDS MORE JOBS UP TO max JOBS AS RUNNING THREADS 

-	ENDS WHEN ALL JOBS ARE DONE



</entry>
<entry [Mon 2014:01:13 03:06:05 EST] SPIFFWORKFLOWS REVIEW IN OPENSTACK>
	
https://wiki.openstack.org/wiki/NovaOrchestration/WorkflowEngines/SpiffWorkflow




</entry>
<entry [Sun 2014:01:12 15:43:41 EST] PUPPET INSTALL APACHE - REMOVES sites-available/default-ssl FILE>

PROBLEM



DIAGNOSIS

https://github.com/puppetlabs/puppetlabs-apache/issues/465



if $ssl and $ensure == 'present' {
    include apache::mod::ssl
    # Required for the AddType lines.
    include apache::mod::mime
  }

SOLUTION

if $ssl and $ensure == 'present' {
    include apache::mod::ssl
    # Required for the AddType lines.
    include apache::mod::mime
}
	
</entry>
<entry [Sun 2014:01:12 03:58:31 EST] MOVED rabbit.js TO apps>

ORIGINAL forever COMMAND:

cd /aguadev/apps/node-amqp/node_modules/rabbit.js/example/socketio; \
/usr/local/bin/forever server.js 2>&1 >> /var/log/rabbitjs-server.log &


NEW forever COMMAND:

cd /aguadev/apps/rabbit.js/example/socketio; \
/usr/local/bin/forever server.js 2>&1 >> /var/log/rabbitjs-server.log &

	
</entry>
<entry [Sat 2014:01:11 22:28:42 EST] FIXED SYNC ERROR: 'error: src refspec master does not match any'>

PROBLEM

GET THIS ERROR WHEN TRYING TO SYNC NEW LOCAL WORKFLOWS FOLDER TO REMOTE

git push github master --force

	error: src refspec master does not match any.
	error: failed to push some refs to 'git@github.com:syoung/biorepository.git'


SOLUTION

1. PULL FROM REMOTE

git pull --commit --no-edit github master


2. ADD CHANGES

REMOVE WORKFLOWS DIR AND REPOPULATE


3. PUSH TO REMOTE

git push -u github master
 

</entry>
<entry [Sat 2014:01:11 02:42:15 EST] FIXED JAVA ERROR ON ec2-delete-keypair: "DerInputStream.getLength lengthTag '=' 127 too big">

PROBLEM

GET THIS ERROR WHEN RUN ec2-delete-keypair

ec2-delete-keypair \
> -K /aguadev/conf/.ec2/syoung/private.pem \
> -C /aguadev/conf/.ec2/syoung/public.pem \
> id_rsa-syoung-key

	Unexpected error:
	org.codehaus.xfire.fault.XFireFault: General security error; nested exception is: 
		java.security.cert.CertificateException: Unable to initialize, java.io.IOException: DerInputStream.getLength(): lengthTag=127, too big.


DIAGNOSIS

SEE minecraft.xsl
[Fri 2013:05:03 17:23:55 EST] TROUBLESHOOTING EC2-API 'unexpected error'

USED WRONG AWS TAB TO GENERATE THE PRIVATE KEY AND CERTIFICATE

GOOD (;;)   'X.509 Certificates'

BAD XXXXX   'Key Pairs'


DIAGNOSIS

**** private.pem WAS NOT ADDED TO ssh-agent ****

java.security FILE

emacs -nw /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/java.security

CONTAINS LINE:

keystore.type=jks

SO *.pem KEY MUST BE CONVERTED INTO *.jks FORMAT


BUT WHEN RAN CONVERSION GOT THIS ERROR:


openssl x509 -outform der -in private.pem -out private.der
	
	unable to load certificate

SOMETHING WRONG WITH THE private.pem FILE?



SOLUTION


1. CHANGE TO USER syoung AND ADD annai SSH KEY

ec2key annai


2. USE annai KEY AND CERT INSTEAD OF syoung (POSSIBLE OLD) KEY AND CERT

ec2-delete-keypair -K /aguadev/conf/.ec2/syoung/annai-private.pem -C /aguadev/conf/.ec2/syoung/annai-public.pem id_rsa-syoung-key

	KEYPAIR	id_rsa-syoung-key

	OK


NOTES
-----

1. CONVERT *.pem FILE TO *.der FILE

cd /aguadev/conf/.ec2/syoung/
openssl x509 -outform der -in private.pem -out private.der

2. IMPORT *.der TO *.jks JAVA KEYSTORE FILE

cd /aguadev/conf/.ec2/syoung/
keytool -import -alias id_rsa-syoung-key -keystore private.jks -file certificate.der

	
</entry>
<entry [Sat 2014:01:11 02:37:16 EST] SSLSHOPPER.COM - HOW TO FIND THE BEST SSL CERTIFICATE>

http://www.sslshopper.com

	
</entry>
<entry [Sat 2014:01:11 02:35:52 EST] HOW TO TELL THE DIFFERENCE BETWEEN *.pem, *.der AND OTHER KEY FILES>

http://myonlineusb.wordpress.com/2011/06/19/what-are-the-differences-between-pem-der-p7bpkcs7-pfxpkcs12-certificates/

How to Convert certificates between PEM, DER, P7B/PKCS#7, PFX/PKCS#12
What are the differences between PEM, DER, P7B/PKCS#7, PFX/PKCS#12 certificates

June 19, 2011 by arungp

NOTE: Please note that, this is a RIP OFF from the website http://www.sslshopper.com. Thanks for http://www.sslhopper.com for the valuable information provided. If anyone has any complaints, please contact me.

Different Platforms & Devices requires SSL certificates in different formats
eg:- A Windows Server uses .pfx files
An Apache Server uses .crt, .cer files

NOTE: Only way to tell the difference between PEM .cer and DER .cer is to open the file in a Text editor and look for the BEGIN/END statements.

 

PEM Format
It is the most common format that Certificate Authorities issue certificates in. It contains the ‘—–BEGIN CERTIFICATE—–” and “—–END CERTIFICATE—–” statements.

Several PEM certificates and even the Private key can be included in one file, one below the other. But most platforms(eg:- Apache) expects the certificates and Private key to be in separate files.
> They are Base64 encoded ACII files
> They have extensions such as .pem, .crt, .cer, .key
> Apache and similar servers uses PEM format certificates

DER Format
It is a Binary form of ASCII PEM format certificate. All types of Certificates & Private Keys can be encoded in DER format
> They are Binary format files
> They have extensions .cer & .der
> DER is typically used in Java platform

P7B/PKCS#7
They contain “—–BEGIN PKCS—–” & “—–END PKCS7—–” statements. It can contain only Certificates & Chain certificates but not the Private key.
> They are Base64 encoded ASCII files
> They have extensions .p7b, .p7c
> Several platforms supports it. eg:- Windows OS, Java Tomcat

PFX/PKCS#12
They are used for storing the Server certificate, any Intermediate certificates & Private key in one encryptable file.
> They are Binary format files
> They have extensions .pfx, .p12
> Typically used on Windows OS to import and export certificates and Private keys

 

Converting Certificates between different Formats

PEM
Convert PEM to DER
—————————————————————————————————–
$ openssl x509 -outform der -in certificate.pem -out certificate.der
—————————————————————————————————–

Convert PEM to P7B
———————————————————————————————————————————
$ openssl crl2pkcs7 -nocrl -certfile certificate.cer -out certificate.p7b -certfile CAcert.cer
———————————————————————————————————————————-

Convert PEM to PFX
——————————————————————————————————————————————————
$ openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CAcert.crt
——————————————————————————————————————————————————

 

DER
Convert DER to PEM
————————————————————————————————–
$ openssl x509 -inform der -in certificate.cer -out certificate.pem
————————————————————————————————–

 

P7B
Convert P7B to PEM
————————————————————————————————-
$ openssl pkcs7 -print_certs -in certificate.p7b -out certificate.cer
————————————————————————————————-

Convert P7B to PFX
——————————————————————————————————————————————————-
$ openssl pkcs7 -print_certs -in certificate.p7b -out certificate.cer
$ openssl pkcs12 -export -in certificate.cer -inkey privateKey.key -out certificate.pfx -certfile CAcert.cer
——————————————————————————————————————————————————-

 

PFX
Convert PFX to PEM
——————————————————————————————–
$ openssl pkcs12 -in certificate.pfx -out certificate.cer -nodes
——————————————————————————————–

NOTE: While converting PFX to PEM format, openssl will put all the Certificates and Private Key into a single file. You will need to open the file in Text editor and copy each Certificate & Private key(including the BEGIN/END statements) to its own individual text file and save them as certificate.cer, CAcert.cer, privateKey.key respectively.



	
</entry>
<entry [Sat 2014:01:04 21:20:26 EST] ADDED S3 SYNC TO Ops::AWS>

http://aws.amazon.com/cli/

LIST FILES IN BUCKET
aws s3 ls s3://mybucket

RECURSIVE UPLOADS/DOWNLOADS
aws s3 cp myfolder s3://mybucket/myfolder --recursive 

SYNC DIRS
aws s3 sync myfolder s3://mybucket/myfolder --exclude *.tmp 


DELETE DIRS OR FILES

aws s3 help

   Single Local File and S3 Object Operations
       Some commands perform operations only on single files and  S3  objects.

       The following commands are single file/object operations if no --recur-
       sive flag is provided.

           o cp

           o mv

           o rm

       For this type of operation, the first path argument, the  source,  must
       exist  and be a local file or S3 object.  The second path argument, the
       destination, can be the name of  a  local  file,  local  directory,  S3
       object, S3 prefix, or S3 bucket.

       The  destination  is  indicated  as a local directory, S3 prefix, or S3
       bucket if it ends with a forward slash or back slash.  The use of slash
       depends  on  the  path argument type.  If the path argument is a Local-
       Path, the type of slash is the separator used by the operating  system.
       If  the  path is a S3Path, the forward slash must always be used.  If a
       slash is at the end of the destination, the destination file or  object
       will  adopt the name of the source file or object.  Otherwise, if there
       is no slash at the end, the file or object will be saved under the name
       provided.  See examples in cp and mv to illustrate this description.

	
</entry>
<entry [Thu 2014:01:02 22:49:29 EST] ENABLED HTTPS ON CENTOS>

1. ADDED apache::vhost ENTRY IN install-apache.pp

    notice("install-apache    Installing apache::vhost")
    apache::vhost { 'ssl.example.com':
        port     => '443',
        docroot  => '/var/www/html',
        ssl      => true,
        ssl_cert => '/etc/pki/tls/certs/server.crt',
        ssl_key  => '/etc/pki/tls/private/server.key',
    }
    notice("install-apache    COMPLETED install apache::vhost")

	
WHICH CREATES THIS ADDITIONAL .conf FILE

/etc/httpd/conf.d/25-ssl.example.com.conf

<!--
# ************************************
# Vhost template in module puppetlabs-apache
# Managed by Puppet
# ************************************

<VirtualHost *:443>
  ServerName ssl.example.com

  ## Vhost docroot
  DocumentRoot /var/www/html



  ## Directories, there should at least be a declaration for /var/www/html

  <Directory /var/www/html>
    Options Indexes FollowSymLinks MultiViews
    AllowOverride None
    Order allow,deny
    Allow from all
  </Directory>

  ## Load additional static includes


  ## Logging
  ErrorLog /var/log/httpd/ssl.example.com_error_ssl.log
  ServerSignature Off
  CustomLog /var/log/httpd/ssl.example.com_access_ssl.log combined



  ## SSL directives
  SSLEngine on
  SSLCertificateFile      /etc/pki/tls/certs/server.crt
  SSLCertificateKeyFile   /etc/pki/tls/private/server.key
  SSLCACertificatePath    /etc/pki/tls/certs
</VirtualHost>
-->

2. EDIT httpd.conf, ADD CGI-BIN ScriptAlias AND Directory

emacs -nw /etc/httpd/conf/httpd.conf

<!--
ScriptAlias /cgi-bin/ /var/www/cgi-bin/
<Directory "/var/www/cgi-bin">
	AddHandler cgi-script .cgi .pl
	AllowOverride None
	Options Indexes FollowSymLinks MultiViews
	Options +ExecCGI -MultiViews
	Order allow,deny
	Allow from all
</Directory>
-->

NOTE: httpd.conf ALSO HAS THIS ADDED FOR FASTCGI:

<!--
#### FASTCGI
<IfModule mod_fastcgi.c>
   AddType application/x-httpd-fcgi .fcgi
   AddHandler fastcgi-script .fcgi .fcg .pl
    FastCgiServer /var/www/cgi-bin/aguadev/agua.cgi -idle-timeout 600 -processes 1
    FastCgiConfig -autoUpdate
</IfModule>
-->


3. EDIT conf.d/ssl.conf

ADD THESE LINES

<!--
LoadModule ssl_module /usr/lib64/httpd/modules/mod_ssl.so	

<IfModule mod_ssl.c>

	NameVirtualHost *:443
    Listen 443
-->	
	

4. ADD SSL ENTRIES IN conf/ports.conf

emacs -nw /aguadev/bin/install/resources/apache2/centos/conf/ports.conf

<!--
# ************************************
# Listen & NameVirtualHost resources in module puppetlabs-apache
# Managed by Puppet
# ************************************

Listen 80
Listen 443
NameVirtualHost *:80
NameVirtualHost *:443
-->


5. LINKED APACHE CONFIG FILES

conf/httpd.conf
conf/ports.conf
conf.d/15-default.conf
conf.d/25-ssl-example.com.conf
conf.d/ssl.conf

FROM

/aguadev/bin/install/resources/apache2/centos

TO 

/etc/httpd/


6. RESTART APACHE AND BROWSE TO HTTPS

https://localhost

	OK
	
	
7. TEST CGI-BIN ON CENTOS:

echo '{"mode":"submitLogin","module":"Agua::Workflow","password":"guest","username":"guest"}' | ./agua.pl

	OK


	
</entry>
<entry [Wed 2013:12:25 14:00:48 EST] FIXED ERROR: 'You don't have permission to access /cgi-bin/ on this server.'>

PROBLEM

GET THIS ERROR WHEN BROWSE TO cgi-bin

You don't have permission to access /cgi-bin/ on this server.

"GET /cgi-bin/ HTTP/1.1" 403 181


SOLUTION


ADD CGI-BIN ScriptAlias AND Directory TO

/etc/httpd/conf/httpd.conf

<!--
ScriptAlias /cgi-bin/ /var/www/cgi-bin/
<Directory "/var/www/cgi-bin">
	AddHandler cgi-script .cgi .pl
	AllowOverride None
	Options Indexes FollowSymLinks MultiViews
	Options +ExecCGI -MultiViews
	Order allow,deny
	Allow from all
</Directory>
-->


NOTES
-----

ALSO TRIED THE FOLLOWING WITHOUT SUCCESS:

1. IN Vagrantfile SET OWNER TO apache

2. RESET HTTPD sys_content IN SELINUX

chcon -R -h -t httpd_sys_content_t /var/www/cgi-bin
chcon -R -t httpd_sys_content_t /var/www/cgi-bin/aguadev

NB: SAFE TO IGNORE THIS ERROR
chcon: can't apply partial context to unlabeled file

	
</entry>
<entry [Sun 2013:12:22 23:07:10 EST] INSTALLED fastcgi ON CENTOS>

1. INSTALL mod_fastcgi

yum -y install libtool httpd-devel apr-devel apr 
cd /opt 
wget http://www.fastcgi.com/dist/mod_fastcgi-current.tar.gz 
tar -zxvf mod_fastcgi-current.tar.gz 
cd mod_fastcgi-2.4.6
cp Makefile.AP2 Makefile

make top_dir=/usr/lib64/httpd
make install top_dir=/usr/lib64/httpd


2. CONFIRM fastcgi MOD INSTALLED

ll -tr /usr/lib64/httpd/modules/

	-rwxr-xr-x 1 root root 241118 Dec 23 07:09 mod_fastcgi.so


3. CONFIGURE mod_fastcgi


CREATE mod_fastcgi.conf

mkdir -p /aguadev/bin/install/resources/apache2/centos/conf.d

emacs -nw /aguadev/bin/install/resources/apache2/centos/conf.d/mod_fastcgi.conf


CONTENTS ARE

LoadModule fastcgi_module modules/mod_fastcgi.so


LINK TO APACHE'S conf.d DIR

ln -s /aguadev/bin/install/resources/apache2/centos/conf.d/mod_fastcgi.conf /etc/httpd/conf.d/mod_fastcgi.conf


#### CHANGE OWNERSHIP OF LOGS TO APACHE

chown apache:apache /etc/httpd/logs/



RESTART APACHE

service httpd restart


	
</entry>
<entry [Sun 2013:12:22 22:31:44 EST] FIXED ERROR: 'The requested URL /cgi-bin was not found on this server'>

PROBLEM

ON CENTOS, HTML DIRECTORY WORKS BUT CAN'T ACCESS CGI-BIN DIRECTORY:

BROWSER ERROR:

	The requested URL /cgi-bin was not found on this server.


SOLUTION

ADDED CORRECT Options IN cgi-bin ALIAS IN httpd.conf





SE LINUX

chcon -h system_u:object_r:httpd_sys_content_t /usr/local/apache2/htdocs

chcon -R -h root:object_r:httpd_sys_content_t /usr/local/apache2/htdocs/*
	
</entry>
<entry [Thu 2013:12:19 09:17:33 EST] TO DO: FIX FAIL TO START MYSQL>

service mysqld stop
mv /var/lib/mysql/mysql.sock /var/lib/mysql/mysql.sock.bak
service mysqld start

	
</entry>
<entry [Mon 2013:12:16 10:11:14 EST] FIXED ERROR: 'Starting httpd: httpd: Syntax error on line 48 of /etc/httpd/conf/httpd.conf'>

PROBLEM

GET ERROR WHEN STARTING APACHE ON CENTOS:

service httpd restart

	Starting httpd: httpd: Syntax error on line 48 of
	
	/etc/httpd/conf/httpd.conf
	
	Can't locate API module structure `log_config' in file
	
	/etc/httpd/modules/mod_log_config.so
	
	
	/etc/httpd/modules/mod_log_config.so: undefined symbol: log_config


SOLUTION

USE httpd.conf CREATED BY NEW INSTALLATION, ADD FASTCGI SECTION AT BOTTOM

<!--
#### FASTCGI
<IfModule mod_fastcgi.c>
   AddType application/x-httpd-fcgi .fcgi
   AddHandler fastcgi-script .fcgi .fcg .pl
    FastCgiServer /var/www/cgi-bin/aguadev/agua.cgi -idle-timeout 600 -processes 1
    FastCgiConfig -autoUpdate
</IfModule>
-->

	
</entry>
<entry [Mon 2013:12:16 10:08:56 EST] FIXED ERROR: 'could not open mime types config file /etc/httpd/conf/mime.types'>
	
PROBLEM

service httpd start

	No such file or directory: could not open mime types config file /etc/httpd/conf/mime.types


SOLUTION

copy the mime.types files from

/etc

TO

/etc/httpd/conf/

	
</entry>
<entry [Mon 2013:12:16 08:08:16 EST] UPDATED APACHE CONF DIRECTIVES TO 2.4.7 IN apache2.conf AND httpd.conf>

/etc/init.d/rc.local


In this example, all requests are denied.

2.2 configuration:

	Order deny,allow
	Deny from all


2.4 configuration:

	Require all denied

In this example, all requests are allowed.

2.2 configuration:

	Order allow,deny
	Allow from all

2.4 configuration:

	Require all granted


In the following example, all hosts in the example.org domain are allowed access; all other hosts are denied access.

2.2 configuration:

	Order Deny,Allow
	Deny from all
	Allow from example.org

2.4 configuration:

	Require host example.org
	
</entry>
<entry [Sun 2013:12:08 13:13:12 EST] ENABLE INSTALL FASTCGI ON CENTOS>
	
PROBLEM

APACHE START ERRORS OUT WITH 'AddHandler' ISSUE

service httpd restart

	Syntax error on line 10 of /etc/httpd/conf.d/fcgid.conf:
	
	Invalid command 'AddHandler', perhaps misspelled or defined by a module not included in the server configuration
	
	Stopping httpd:                                            [FAILED]
	Starting httpd:                                            [FAILED]

	AddHandler fcgid-script fcg fcgi fpl


WHERE THE CONTENTS OF THE fcgid.conf FILE ARE AS FOLLOWS:

emacs -nw /etc/httpd/conf.d/fcgid.conf


	# This is the Apache server configuration file for providing FastCGI support   # through mod_fcgid                                                            #                                                                                 
	# Documentation is available at                                                   
	# http://httpd.apache.org/mod_fcgid/mod/mod_fcgid.html                            
	LoadModule fcgid_module modules/mod_fcgid.so
	# Use FastCGI to process .fcg .fcgi & .fpl scripts                                
	AddHandler fcgid-script fcg fcgi fpl
	# Sane place to put sockets and shared memory file                                
	FcgidIPCDir /var/run/mod_fcgid
	FcgidProcessTableFile /var/run/mod_fcgid/fcgid_shm


DOWNLOAD

cd /opt
wget http://mirror.tcpdiag.net/apache//httpd/mod_fcgid/mod_fcgid-2.3.9.tar.gz
tar xvfz mod_fcgid-*.tar.gz
cd mod_fcgid-2.3.9

cd /opt
wget http://mirror.tcpdiag.net/apache//httpd/mod_fcgid/fcgid-2.3.9.tar.gz
	
	

	
	


	
http://linuxwave.blogspot.com/2010/08/installing-apache-modfastcgifastcgi.html

Installing apache mod_fastcgi(fastcgi module) on CentOS 5

In the previous post, I have written about installing apache mod_fcgid module to enable fastcgi support on apache. This time, I will write on how to install mod_fastcgi module to enable fastcgi module on apache installed on CentOS 5. Since by the time of this writing, there is no rpm for apache mod_fastcgi, we have to compile the mod_fastcgi module.

1. Install requirements for compilation

# yum install httpd-devel apr apr-devel libtool

2. Download latest mod_fastcgi source code
cd /opt
wget http://www.fastcgi.com/dist/mod_fastcgi-current.tar.gz

3. Untar the package.
tar -xvzf mod_fastcgi-current.tar.gz

4. Install the module. You can find the installation guide on the INSTALL.AP2 file. We have to specify top_dir in the make and make install commands because we install apache2/httpd using yum
# cd mod_fastcgi-2.4.6
# cp Makefile.AP2 Makefile
# make top_dir=/usr/lib/httpd
# make install top_dir=/usr/lib/httpd

5. Add "LoadModule fastcgi_module modules/mod_fastcgi.so" to /etc/httpd/conf/httpd.conf to tell apache to load the new module

6. Restart apache
# /etc/init.d/httpd restart

7. You can assure that the mod is loaded by apache2, by looking at /var/log/httpd/error_log
# grep -i "FastCGI" /var/log/httpd/error_log


	
</entry>
<entry [Wed 2013:12:04 13:29:03 EST] USE puppetlabs/mysql TO CREATE MYSQL DATABASE AND USERS>


1. DOWNLOAD puppetlabs/mysql MODULE

mkdir -p /aguadev/bin/install/resources/puppet/manifests/mysql
cd /aguadev/bin/install/resources/puppet/manifests/mysql
wget https://forge.puppetlabs.com/puppetlabs/mysql/2.1.0.tar.gz
tar xvfz 2.1.0.tar.gz
mv puppetlabs-mysql-2.1.0 2.1.0


/aguadev/bin/install/resources/puppet/manifests/mysql/2.1.0$ cat tests/mysql_database.pp 
class { 'mysql::server':
  config_hash => {'root_password' => 'password'}
}
database{ ['test1', 'test2', 'test3']:
  ensure  => present,
  charset => 'utf8',
  require => Class['mysql::server'],
}
database{ 'test4':
  ensure  => present,
  charset => 'latin1',
}
syoung@comp2:/aguadev/bin/install/resources/puppet/manifests/mysql/2.1.0$ cat tests/mysql_grant.pp 
mysql_grant{'test1@localhost/redmine.*':
  user       => 'test1@localhost',
  table      => 'redmine.*',
  privileges => ['UPDATE'],
}


</entry>
<entry [Wed 2013:12:04 13:14:27 EST] FIXED: Installer.pm INSTALL PERL MODS>

PROBLEM

SOME MODULES FAIL TO INSTALL

cd /aguadev/bin/install

./install.pl --installdir /aguadev --urlprefix aguadev

	Building and testing DBD-mysql-4.025 ... FAIL
	
	Building and testing Heap-Simple-Perl-0.14 ... FAIL



SOLUTION

ADD --force TO ENTRY IN permods.txt

Heap::Simple --force

	
</entry>
<entry [Wed 2013:12:04 13:10:16 EST] Installer.pm - USE PUPPET TO INSTALL mqsql>


	
</entry>
<entry [Wed 2013:12:04 03:23:58 EST] multitool FOR FILE MANIPULATION LOCALLY OR WITH HADOOP>

Cascading.Multitool is a sed and grep command line tool for Apache Hadoop. 

Think of this as grep, sed, and awk for Hadoop, which also supports joins between multiple data-sets.

HOMEPAGE
http://www.cascading.org/multitool/

GITHUB
https://github.com/Cascading/cascading.multitool

</entry>
<entry [Tue 2013:12:03 06:04:33 EST] INPUT CHAINING - CONVENTION OVER CONFIGURATION>

GOOD EXAMPLE:

http://docs-v1.vagrantup.com/v1/docs/base_boxes.html

Convention over Configuration

Choice is a good thing, so just about everything in Vagrant can be changed. However, it's easier for others to use Vagrant when you follow a set of conventions. Now, while these aren't enforced conventions, if you plan to distribute the box, it is recommended you follow the following where possible:
Hostname: vagrant-[os-name], e.g. vagrant-debian-lenny
Domain: vagrantup.com
Root Password: vagrant
Main account login: vagrant
Main account password: vagrant
Also keep in mind that, in order to simplify configurations, Vagrant make assumptions about the main account login/password. It will assume the text 'vagrant' for both values. If any of these are changed, you will need to remember to specify them in the Vagrantfile using the appropriate configuration methods before packaging the box.
	
</entry>
<entry [Mon 2013:12:02 22:23:22 EST] 3D WEB GRAPHICS WITH three.js>

http://threejs.org/
	
</entry>
<entry [Mon 2013:12:02 20:08:01 EST] ENABLED AUTOMATIC RESTART node.js>

1. INSTALLED forever

nmp install forever


2. CREATED /etc/init/rabbitjs.conf

NB: ADDED SLEEP 10 TO AVOID IT QUITTING WITH RETURN 2

emacs -nw /etc/init/rabbitjs.conf

	description "Run rabbit.js"
	author "Stuart Young"
	
	start on (local-filesystems and net-device-up IFACE=eth0)
	stop on shutdown
	
	respawn
	
	script
	
		sleep 10;
		cd INSTALLDIR/apps/node-amqp/node_modules/rabbit.js/example/socketio
		/usr/local/bin/forever server.js 2>&1 >> /var/log/rabbitjs-server.log
	
	end script


3. RESTARTED VAGRANT VM

EACH TIME, RABBITJS IS RUNNING

	
</entry>
<entry [Mon 2013:12:02 03:06:18 EST] FIXED PROBLEM 'STATIC' ERRORS DURING INSTALL OF node>

SUMMARY: IGNORE

PROBLEM

INSTALL OF node-v0.10.15 gives 'STATIC...' ERRORS:

./install.pl --installdir /aguadev --urlprefix aguadev


DIAGNOSIS

../deps/v8/src/checks.h:283:30: note: in expansion of macro ‘STATIC_CHECK’
 #define STATIC_ASSERT(test)  STATIC_CHECK(test)
 
GCC 4.8 has a new unused checking (or at least it is newly enabled by -Wall): unused-local-typedefs.

As v8 is by default compiled with "-Wall -Werror", the compilation will fail with as follows.

I see two possibilities:

(a) Compiling with -Wno-unused-local-typedefs  [cf. patch far below]
(b) Modifying SEMI_STATIC_JOIN to prevent the warning
    (and via -Werror the error)

	
SOLUTION

IGNORE

	
</entry>
<entry [Sun 2013:12:01 23:10:16 EST] ADAPTING AGUA INSTALL TO UBUNTU 13.10>

APACHE VERSION
--------------

ON comp2 LAPTOP

apache2ctl -version
	Server version: Apache/2.2.22 (Ubuntu)
	Server built:   Jul 12 2013 13:18:16

	
ON VAGRANT VM

/home/vagrant# apachectl -version
Server version: Apache/2.4.6 (Ubuntu)
Server built:   Aug  9 2013 14:31:04


APACHE CONFIG
-------------
	
/etc/apache2/apache2.conf

1. CHANGED TO MUTEX

LockFile ${APACHE_LOCK_DIR}/accept.lock

TO

Mutex file:${APACHE_LOCK_DIR} default


You will need to install mod_xml2enc with these steps:

Make sure you have mod_proxy:

sudo apt-get install libapache2-mod-proxy-html
For mod_xml2enc

sudo apt-get install apache2-prefork-dev
mkdir ~/modbuild/ && cd ~/modbuild/
wget http://apache.webthing.com/svn/apache/filters/mod_xml2enc.c
wget http://apache.webthing.com/svn/apache/filters/mod_xml2enc.h
apxs2 -aic -I/usr/include/libxml2 ./mod_xml2enc.c
cd ~
rm -rfd ~/modbuild/
sudo service apache2 restart


2. FIXED DEFAULTTYPE

 Ignoring deprecated use of DefaultType in line 176 of /etc/apache2/apache2.conf

	
</entry>
<entry [Sun 2013:12:01 22:53:16 EST] FIXED AGUA INSTALLER PROBLEM INSTALLING XML::LibXML>

PROBLEM

INSTALL OF XML::LibXML FAILS

cpanm install XML::LibXML

WITH LOG OUTPUT:

em /root/.cpanm/work/1385967008.24018/build.log
	...
	Checking for ability to link against xml2...no
	Checking for ability to link against libxml2...libxml2, zlib, and/or the Math library (-lm) have not been found.
	Try setting LIBS and INC values on the command line
	Or get libxml2 from
	  http://xmlsoft.org/
	If you install via RPMs, make sure you also install the -devel
	RPMs, as this is where the headers (.h files) are.

	
SOLUTION

INSTALL zlib PACKAGE

sudo apt-get install zlib1g-dev


</entry>
<entry [Thu 2013:11:28 10:14:14 EST] SPIFFWORKFLOW URL>

https://github.com/knipknap/SpiffWorkflow


	
</entry>
<entry [Wed 2013:11:13 16:12:02 EST] ERROR: "undefined values: owner version installdir IN Agua::Common::Base::_addToTable">

{"error":"undefined values: owner version installdir","subroutine":"Agua::Common::Base::_addToTable","linenumber":"305","filename":"/aguadev/cgi-bin/lib/Agua/Common/Base.pm","timestamp":"2013-11-14 00:08:48"}

    
</entry>
<entry [Tue 2013:11:12 17:12:27 EST] ERROR INSTALLING WITH ./install.pl>

PROBLEM

Agua::Installer::installPerlMods    installing module: 
Agua::Installer::installPerlMods    Problem installing module 
Installer::copyConf    Copying conf file to: /aguadev/bin/install/../../conf/config.yaml
command: cp -f /aguadev/bin/install/resources/agua/conf/config.yaml /aguadev/bin/install/../../conf/config.yaml
Error: install): Version mismatch between Carp 1.20 (/usr/share/perl/5.14/Carp.pm) and Carp::Heavy 1.32 (/usr/local/share/perl/5.14.2/Carp/Heavy.pm).  Did you alter @INC after Carp was loaded?
Compilation failed in require at /usr/local/lib/perl/5.14.2/Moose/Error/Default.pm line 12.
BEGIN failed--compilation aborted at /usr/local/lib/perl/5.14.2/Moose/Error/Default.pm line 12.
Compilation failed in require at /usr/local/lib/perl/5.14.2/Moose/Meta/Class.pm line 23.
BEGIN failed--compilation aborted at /usr/local/lib/perl/5.14.2/Moose/Meta/Class.pm line 23.
Compilation failed in require at /usr/local/lib/perl/5.14.2/Moose.pm line 27.
BEGIN failed--compilation aborted at /usr/local/lib/perl/5.14.2/Moose.pm line 27.
Compilation failed in require at /usr/local/share/perl/5.14.2/MooseX/Declare/Syntax/Keyword/Class.pm line 10.
BEGIN failed--compilation aborted at /usr/local/share/perl/5.14.2/MooseX/Declare/Syntax/Keyword/Class.pm line 10.
Compilation failed in require at (eval 90) line 1.
BEGIN failed--compilation aborted at (eval 90) line 1.
 at /usr/local/share/perl/5.14.2/MooseX/Declare.pm line 15
BEGIN failed--compilation aborted at /usr/local/share/perl/5.14.2/MooseX/Declare.pm line 15.
Compilation failed in require at /aguadev/bin/install/../../lib/Conf/Yaml.pm line 1.
BEGIN failed--compilation aborted at /aguadev/bin/install/../../lib/Conf/Yaml.pm line 1.
Compilation failed in require at /aguadev/bin/install/../../lib/Agua/Installer.pm line 361.

SOLUTION

EDITED Installer.pm TO SKIP EMPTY LINES IN perlmods.txt FILE


    
</entry>
<entry [Fri 2013:11:01 02:01:29 EST] JAVASCRIPT GRAPHICS LIBRARY TO DRAW WORKFLOW>
    
http://jsplumbtoolkit.com/home/jquery.html


http://stackoverflow.com/questions/17780942/javascript-workflow-visualisation-framework-library
Javascript workflow Visualisation Framework/library [closed]

QUESTION

I've been searching for a javascript library/framework to create a workflow. I need to be able to:

Draw Boxes and connect them with edges
Have the arrows come in and come out from a set direction. I.e. you can specify that an arrow leaves from the left side of a box, and comes in the right etc.
It lays the boxes and draws the arrows for you.
It is interactive, we need to be able to click the boxes and ideally have callbacks
I've currently looked at:

JsPlumb - Has all the functionality I need, other than automatically laying it out. Looked at using Liviz with it, but that lays out the boxes, and not the arcs so it as just a mess
D3 - very interactive, but no layout algorithm for this sort of work, and we'd like to avoid creating one ourselves
Graphviz - We've checked out graphviz javascript ports, and they don't allow for interactivity, or much flexibility.
Can anyone think of a library/framework which could solve this problem? Thanks!

javascript graph workflow visualization flowchart
share|improve this question
asked Jul 22 at 6:07


ANSWER:

I'll throw in yFiles for HTML. This is a commercial graph drawing library, so if this is not in a commercial context, it might not be what you are looking for. For personal use the license is quite expensive, but usually not in a commercial context.

Other than that I'd say it's a very good fit for your use-case:

It has a very large set of highly configurable layout algorithms. For typical workflow diagrams the hierarchic layout algorithm (the concept is Sugiyama based) is a very good fit as it highlights the flow of the structure (there is a main layout direction). Also it is very configurable and let's you optionally determine the order of the elements in their layers, the sequence between elements, the direction the edges leave and enter the nodes, the edge routing style, the way labels are placed (without overlapping other items), etc. There is a nice demo that shows many of these features in an interactive manner, but the TableEditorDemo shows that the algorithm can be used for more than just that.

It has full editing capabilities. While D3.js for example is quite nice for viewing large amounts of data, yFiles has a very rich editor included that works with the mouse, keyboard, and touch devices. The editor can easily be customized and augmented with custom user gestures. Events for all kind of user interaction (hovering, clicking, context menus, tooltips, etc.) are provided, of course.

You can fully customize the visualization of the items. Since SVG is leveraged as the visualization backend. Nice CSS styled (and animated) visualizations are pretty easy to achieve.

Disclaimer: I work for the company who created this library, however on SO I do not represent my employer. My thoughts, comments, suggestions, etc. are my own.
    
</entry>
<entry [Fri 2013:11:01 01:51:54 EST] VISUALIZATION TOOLS, E.G., draw2d VS draw.io >

http://www.draw2d.org/draw2d/

COMPARE TO:

www.draw.io


</entry>
<entry [Thu 2013:10:31 23:49:22 EST] INSTALL PERL MODULES - UPDATED>


1. CHANGED LINES IN perlmods.txt FILE TO cpanm install COMMANDS

cpanm -L /System/Library/Perl/Extras/5.12/darwin-thread-multi-2level


2. FIXED Path::Tiny INSTALL

PROBLEM

CPANM NOT FINDING Path::Tiny FOR INSTALL OF

cpanm install MooseX::Types::Path::Tiny
cpanm install MooseX::App::Cmd
cpanm install MooseX::ConfigFromFile

LOGFILE SAYS:

emacs -nw /var/root/.cpanm/work/1383288450.2080/build.log

    cp lib/MooseX/Types/Path/Tiny.pm blib/lib/MooseX/Types/Path/Tiny.pm
    t/00-check-deps.t ...... ok
    Cannot find type 'Path::Tiny', perhaps you forgot to load it at /System/Library/Perl/Extras/5.12/darwin-thread-multi-2level/Moose/Util/TypeConstraints.pm line 561

SO REINSTALLED Path::Tiny IN DESIRED PATH:

cpanm -L /System/Library/Perl/Extras/5.12/darwin-thread-multi-2level Path::Tiny


    
</entry>
<entry [Wed 2013:10:09 09:01:49 EST] DOWNLOAD APPS>

BOWTIE

http://downloads.sourceforge.net/project/bowtie-bio/bowtie2/2.1.0/bowtie2-2.1.0-source.zip

SAMTOOLS
http://downloads.sourceforge.net/project/samtools/samtools/0.1.19/samtools-0.1.19.tar.bz2

VCFTOOLS
http://downloads.sourceforge.net/project/vcftools/vcftools_0.1.11.tar.gz


    
</entry>
<entry [Sun 2013:09:29 13:43:43 EST] SSH PROTOCOL ARCHITECTURE>

http://tools.ietf.org/rfc/rfc4251.txt
    
</entry>
<entry [Sat 2013:09:21 13:30:23 EST] AGUA OPT-IN FOR USAGE METRICS>

https://confluence.atlassian.com/display/AGILE/JIRA+Agile+Usage+Data

POPUP FOR OPT-IN

OPT IN FOR A BETTER JIRA AGILE
Help us make JIRA Agile better! We're continuously working to optimize the JIRA Agile experience for the needs of users like you. Anonymous usage data helps us do just that.
Click on the "yes" button below to agree to our collection of analytics data (described here) through our own tools as well as Google Analytics.
Yes, pleaseNo, thanks


OPT-IN PAGE

JIRA Agile Usage Data
Skip to end of metadata
Added by Rosie Jameson [Atlassian], last edited by Andrew Lui [Atlassian Technical Writer] on Aug 19, 2013  (view change) Go to start of metadata
When anonymous usage data collection is enabled for an instance of JIRA Agile a variety of information is collected and sent to Atlassian to help us improve the user experience. The information we collect includes the number of uses of various features and functions as well as the JIRA Agile configuration related to those functions. We do not expect this information will include any personally identifiable information (see below for more detail).

Specific Data
The following is the specific event data that we collect:

Views of the Getting Started Page (and links used from the Getting Started Page).
Views of the Chart Introduction Page.
Creates, edits and deletes of Rapid Boards (including the JQL used).
Creates of projects.
Creates, edits and deletes of Swimlanes, Columns, Card Color Configuration and Quick Filters in Rapid Boards (including the JQL used).
Starts and ends of Sprints in Rapid Boards.
Releasing of Versions from Rapid Boards.
Actioning and ranking of issues on Rapid Boards.
No personally identifiable information is collected unless the JQL used in a Rapid Board explicitly includes such information. We believe there is no reasonable case where such use would occur absent an affirmative action by the administrator to transmit such information.


    
</entry>
<entry [Fri 2013:08:30 03:28:14 EST] CREATED aguadev YOUTUBE CHANNEL>

1. CREATE YOUTUBE ACCOUNT

2. LOGIN TO ACCOUNT

3. CLICK ON DOWN ARROW NEXT TO USER PIC ON TOP RIGHT --> YouTube Settings

4. Overview Tab --> Name --> Advanced --> Channel settings --> Create Custom URL


 http://www.youtube.com/user/annaisystems
c
http://www.youtube.com/user/aguadev


UPLOAD VIDEOS FROM PHONE:

m940v8pt7iwf@m.youtube.com

 
 
    
</entry>
<entry [Sun 2013:08:18 22:22:05 EST] GALAXY WORKFLOW MODEL>

~/software/galaxy/galaxy/lib/galaxy/jobs/handler.py
~/software/galaxy/galaxy/lib/galaxy/jobs/__init__.py

    
</entry>
<entry [Sun 2013:08:04 19:03:03 EST] RECONCILE infusiondev CONFLICTS TO LATEST dev-backend COMMIT>
    
LATEST dev-backend COMMIT

    2 months ago 879a25d -Fix html/plugins/infusion,t: Restored Filter.js test

LATEST dev-lists COMMIT

    3 months ago ad7b8c2 -Onw html/plugins,t/plugins: Enabling List.renderArray

    
TREE AFTER MERGE dev-lists INTO dev-backend
    
*   9 weeks ago 4be094a Merge branch 'dev-lists' of github.com:illuminatest/infusiondev
|\  Conflicts:
| |     html/dojo-1.8.3/dgrid/List.js
| |     html/plugins/core/Agua.js
| |     html/plugins/exchange/Exchange.js
| |     html/plugins/infusion/Data.js
| |     html/plugins/infusion/Dialog/Project.js
| |     html/plugins/infusion/Filter.js
| |     html/plugins/infusion/Infusion.js
| |     html/plugins/infusion/Lists.js
| |     html/plugins/infusion/templates/infusion.html
| |     html/plugins/infusion/templates/lists.html
| |     t/html/plugins/infusion/lists/runTests.js
| |     t/html/plugins/infusion/lists/test.html




    
</entry>
<entry [Mon 2013:07:22 17:35:09 EST] ENABLING JBROWSE 1.9.8 SUPPORT>

CHANGES
-------

CONVERT FROM trackInfo.js TO trackList.json:

    trackdef.urlTemplate = trackdef.url;
    //trackdef.urlTemplate = trackdef.url.replace(/\{refseq\}\/([^/]+)/, "$1/{refseq}");
    delete trackdef.url;
    
    ... AND REPLACE data/tracks WITH tracks


SET includes

EITHER THIS:

    this.baseUrl + "/users/" + username + "/jbrowse_conf.json",
    dataRoot + "/trackList.json"

OR THIS:

    {
    	version:	"1",
    	url:	this.baseUrl + "/users/" + username + "/jbrowse_conf.json"
    },
    {
    	version:	"1",
    	url:	dataRoot + "/trackList.json"
    }


SET trackList.json:

{
   "tracks" : [
      {
         "urlInfo": "http://genomewiki.ucsc.edu/index.php/Known_genes_III",
         "urlTemplate" : "data/tracks/knownGene/{refseq}/trackData.json",
         "type" : "FeatureTrack",
         "label" : "knownGene",
         "key" : "UCSC Genes"
      },
      {
         "urlInfo": "http://www.h-invitational.jp/", 
         "urlTemplate" : "data/tracks/hinv70NonCoding/{refseq}/trackData.json",
         "label" : "hinv70NonCoding",
         "type" : "FeatureTrack",
         "key" : "H-Inv non-coding"
      },
      {
         "urlInfo": "http://www.h-invitational.jp/", 
         "urlTemplate" : "data/tracks/hinv70PseudoGene/{refseq}/trackData.json",
         "label" : "hinv70PseudoGene",
         "type" : "FeatureTrack",
         "key" : "H-Inv pseudo-genes"
      },
   
      {
         "urlInfo": "http://www.sanger.ac.uk/mouseportal/", 
         "urlTemplate" : "data/tracks/hgIkmc/{refseq}/trackData.json",
         "type" : "FeatureTrack",
         "label" : "hgIkmc",
         "key" : "IKMC Genes Mapped"
      },
   
      {
         "urlInfo": "http://projects.tcag.ca/variation/", 
         "urlTemplate" : "data/tracks/dgv/{refseq}/trackData.json",
         "label" : "dgv",
         "type" : "FeatureTrack",
         "key" : "DGV Struct Var"
      },
   
      {
         "urlInfo": "http://vega.sanger.ac.uk/index.html", 
         "urlTemplate" : "data/tracks/vegaGene/{refseq}/trackData.json",
         "label" : "vegaGene",
         "type" : "FeatureTrack",
         "key" : "Vega Protein Genes"
      },
      {
         "urlInfo": "http://genome.crg.es/gencode/", 
         "urlTemplate" : "data/tracks/wgEncodeGencodeAutoV4/{refseq}/trackData.json",
         "type" : "FeatureTrack",
         "label" : "wgEncodeGencodeAutoV4",
         "key" : "Gencode Auto"
      },
      {
         "urlInfo": "http://vega.sanger.ac.uk/index.html", 
         "urlTemplate" : "data/tracks/vegaPseudoGene/{refseq}/trackData.json",
         "label" : "vegaPseudoGene",
         "type" : "FeatureTrack",
         "key" : "Vega Pseudogenes"
      },
      {
         "urlInfo": "http://genome.crg.es/gencode/", 
         "urlTemplate" : "data/tracks/wgEncodeGencodePolyaV4/{refseq}/trackData.json",
         "type" : "FeatureTrack",
         "label" : "wgEncodeGencodePolyaV4",
         "key" : "Gencode PolyA"
      },
      {
         "urlInfo": "http://genome.crg.es/gencode/", 
         "urlTemplate" : "data/tracks/wgEncodeGencode2wayConsPseudoV4/{refseq}/trackData.json",
         "label" : "wgEncodeGencode2wayConsPseudoV4",
         "type" : "FeatureTrack",
         "key" : "Gencode Pseudo"
      },
      {
         "urlInfo": "http://www.ncbi.nlm.nih.gov/CCDS/CcdsBrowse.cgi", 
         "urlTemplate" : "data/tracks/ccdsGene/{refseq}/trackData.json",
         "label" : "ccdsGene",
         "type" : "FeatureTrack",
         "key" : "CCDS"
      },
      {
         "urlInfo": "http://www.ncbi.nlm.nih.gov/RefSeq/", 
         "urlTemplate" : "data/tracks/refGene/{refseq}/trackData.json",
         "type" : "FeatureTrack",
         "label" : "refGene",
         "key" : "RefSeq Genes"
      },
      {
         "urlInfo": "http://www.ncbi.nlm.nih.gov/pubmed/18428682", 
         "urlTemplate" : "data/tracks/nscanGene/{refseq}/trackData.json",
         "label" : "nscanGene",
         "type" : "FeatureTrack",
         "key" : "N-SCAN"
      },
      {
         "urlInfo": "http://genome.crg.es/software/sgp2/index.html", 
         "urlTemplate" : "data/tracks/sgpGene/{refseq}/trackData.json",
         "type" : "FeatureTrack",
         "label" : "sgpGene",
         "key" : "SGP Genes"
      },
      {
         "urlInfo": "http://genome.crg.es/software/geneid/", 
         "urlTemplate" : "data/tracks/geneid/{refseq}/trackData.json",
         "label" : "geneid",
         "type" : "FeatureTrack",
         "key" : "Geneid Genes"
      },
      {
         "urlInfo": "http://compgen.bscb.cornell.edu/phast/help-pages/exoniphy.txt", 
         "urlTemplate" : "data/tracks/exoniphy/{refseq}/trackData.json",
         "type" : "FeatureTrack",
         "label" : "exoniphy",
         "key" : "Exoniphy"
      }
   ]
}

    
</entry>
<entry [Fri 2013:07:19 02:32:44 EST] COPIED JBROWSE DATA FROM EC2 INSTANCE TO LAPTOP>

scp -r -i /home/syoung/notes/agua/keypair/syoung/aquarius2/id_rsa  root@ec2-23-22-167-31.compute-1.amazonaws.com:/data/jbrowse/species/human/hg19/data .

COPIED

trackInfo.js (CONTAINING urlInfo ENTRIES FOR FEATURES)
tracks
seq
names

TO:

/data/jbrowse/species/human/hg19/data

 
</entry>
<entry [Sun 2013:07:14 03:18:28 EST] EMBOSS seqret USAGE>

HELP
----

<!--/aguadev/apps/emboss/bin/seqret -help
Reads and writes (returns) sequences
Version: EMBOSS:6.4.0.0

   Standard (Mandatory) qualifiers:
  [-sequence]          seqall     (Gapped) sequence(s) filename and optional
                                  format, or reference (input USA)
  [-outseq]            seqoutall  [<sequence>.<format>] Sequence set(s)
                                  filename and optional format (output USA)

   Additional (Optional) qualifiers: (none)
   Advanced (Unprompted) qualifiers:
   -feature            boolean    Use feature information
   -firstonly          boolean    [N] Read one sequence and stop

   General qualifiers:
   -help               boolean    Report command line options and exit. More
                                  information on associated and general
                                  qualifiers can be found with -help -verbose

-->
EXAMPLES
--------

1. CREATE SEQUENCE FILE

>XLRHODOPL Xenopus laevis rhodopsin

ggtagaacagcttcagttg
ggatcacaggcttctagggatcctttgggcaaaaaagaaacacagaaggc
attctttctatacaagaaaggactttatagagctgctaccatgaacggaa


/aguadev/apps/emboss/bin/seqret xlrhodop -outseq xlrhodop.fasta
    Reads and writes (returns) sequences

    
    >EMBOSS_001
    XLRHODOPLXenopuslaevisrhodopsinggtagaacagcttcagttgggatcacagg
    cttctagggatcctttgggcaaaaaagaaacacagaaggcattctttctatacaagaaag
    gactttatagagctgctaccatgaacggaac

-rw-r--r-- 1 root   root    162 Jul 13 19:12 xlrhodop
-rw-r--r-- 1 root   root    166 Jul 13 19:33 xlrhodop.fasta

/aguadev/apps/emboss/bin/seqret embl:xlrhodop
Reads and writes (returns) sequences
Error: Failed to open filename 'embl'
Error: Unable to read sequence 'embl:xlrhodop'
Died: seqret terminated: Bad value for '-sequence' and no prompt
ll
total 32
drwxrwxr-x 5 syoung syoung 4096 Jul 13 19:33 ./
drwxrwxr-x 5 syoung syoung 4096 Jul 13 19:53 ../
-rwxr-xr-x 1 syoung syoung 2022 Jul 13 16:11 emboss.t*
drwxrwxr-x 5 syoung syoung 4096 Jul 11 21:09 inputs/
drwxr-xr-x 3 syoung syoung 4096 Jul 11 21:14 lib/
drwxrwxr-x 2 syoung syoung 4096 Jul 11 21:09 outputs/
-rw-r--r-- 1 root   root    162 Jul 13 19:12 xlrhodop
-rw-r--r-- 1 root   root    166 Jul 13 19:33 xlrhodop.fasta
/aguadev/apps/emboss/bin/seqret -sequence embl:xlrhodop
Reads and writes (returns) sequences
Error: Failed to open filename 'embl'
Error: Unable to read sequence 'embl:xlrhodop'
Died: seqret terminated: Bad value for '-sequence' and no prompt
/aguadev/apps/emboss/bin/seqret -sequence xlrhodop
Reads and writes (returns) sequences
output sequence(s) [xlrhodop.fasta]: 
ll
total 32
drwxrwxr-x 5 syoung syoung 4096 Jul 13 19:33 ./
drwxrwxr-x 5 syoung syoung 4096 Jul 13 19:53 ../
-rwxr-xr-x 1 syoung syoung 2022 Jul 13 16:11 emboss.t*
drwxrwxr-x 5 syoung syoung 4096 Jul 11 21:09 inputs/
drwxr-xr-x 3 syoung syoung 4096 Jul 11 21:14 lib/
drwxrwxr-x 2 syoung syoung 4096 Jul 11 21:09 outputs/
-rw-r--r-- 1 root   root    162 Jul 13 19:12 xlrhodop
-rw-r--r-- 1 root   root    166 Jul 14 03:16 xlrhodop.fasta
/aguadev/apps/emboss/bin/seqret -sequence xlrhodop -help
Reads and writes (returns) sequences
Version: EMBOSS:6.4.0.0

<!--   Standard (Mandatory) qualifiers:
  [-sequence]          seqall     [xlrhodop] (Gapped) sequence(s) filename and
                                  optional format, or reference (input USA)
  [-outseq]            seqoutall  [<sequence>.<format>] Sequence set(s)
                                  filename and optional format (output USA)

   Additional (Optional) qualifiers: (none)
   Advanced (Unprompted) qualifiers:
   -feature            boolean    Use feature information
   -firstonly          boolean    [N] Read one sequence and stop

   General qualifiers:
   -help               boolean    Report command line options and exit. More
                                  information on associated and general
                                  qualifiers can be found with -help -verbose

-->

/aguadev/apps/emboss/bin/seqret embl:xlrhodop xlrhodop.fasta -osformat gcg
Reads and writes (returns) sequences
Error: Failed to open filename 'embl'
Error: Unable to read sequence 'embl:xlrhodop'
Died: seqret terminated: Bad value for '-sequence' and no prompt
/aguadev/apps/emboss/bin/seqret xlrhodop xlrhodop.fasta -osformat gcg
Reads and writes (returns) sequences
ll
total 32
drwxrwxr-x 5 syoung syoung 4096 Jul 13 19:33 ./
drwxrwxr-x 5 syoung syoung 4096 Jul 13 19:53 ../
-rwxr-xr-x 1 syoung syoung 2022 Jul 13 16:11 emboss.t*
drwxrwxr-x 5 syoung syoung 4096 Jul 11 21:09 inputs/
drwxr-xr-x 3 syoung syoung 4096 Jul 11 21:14 lib/
drwxrwxr-x 2 syoung syoung 4096 Jul 11 21:09 outputs/
-rw-r--r-- 1 root   root    162 Jul 13 19:12 xlrhodop
-rw-r--r-- 1 root   root    260 Jul 14 03:17 xlrhodop.fasta
em xlrhodop.fasta 

[3]+  Stopped                 emacs -nw xlrhodop.fasta
cat xlrhodop.fasta 
!!AA_SEQUENCE 1.0

EMBOSS_001  Length: 151  Type: P  Check: 8360 ..

   1 XLRHODOPLX enopuslaev isrhodopsi nggtagaaca gcttcagttg

  51 ggatcacagg cttctaggga tcctttgggc aaaaaagaaa cacagaaggc

 101 attctttcta tacaagaaag gactttatag agctgctacc atgaacggaa

 151 c

root@computer:/mnt/
    
</entry>
<entry [Fri 2013:07:12 11:15:32 EST] FIXED CPANM ERROR: '/root/.cpanm/build.log: No such file or directory'>


PROBLEM

GET THIS ERROR WHEN TRY TO INSTALL WITH CPANM

cpanm install XML::LibXML

    /root/.cpanm/build.log: No such file or directory at /loader/0x1626ed8/App/cpanminus/script.pm line 275.



SOLUTION

rm -fr /root/.cpanm/build.log

cpanm install XML::LibXML

    OK    

    
</entry>
<entry [Fri 2013:07:12 11:12:19 EST] FIXED FAILURE TO INSTALL Net::RabbitFoot DUE TO XML::LibXML>

SUMMARY: NEEDED libxml2-dev


PROBLEM

cpanm AND CPAN INSTALLS OF Net::RabbitFoot FAIL DUE TO XML::LibXML

cpanm install Net::RabbitFoot
    ...
    Configuring XML-LibXML-2.0019 ... N/A
    ! Configure failed for XML-LibXML-2.0019



SOLUTION

INSTALL libxml2-dev

apt-get install libxml2-dev

    
</entry>
<entry [Thu 2013:07:11 22:34:57 EST] EMBOSS USA FORMAT INPUTS>


NB: SET THIS TO INPUT VALUETYPE 'file' IN AGUA (FOR AUTOMATION) 


The sequence input and output specification of this (and many other EMBOSS programs) is described as being a Uniform Sequence Address.

The Uniform Sequence Address, or USA, is a somewhat tongue-in-cheek reference to a URL-style sequence naming used by all EMBOSS applications.

The USA is a very flexible way of specifying one or more sequences from a variety of sources and includes sequence files, database queries and external applications.

See the full specification of USA syntax at: 
http://emboss.sourceforge.net/docs/themes/UniformSequenceAddress.html

The basic USA syntax is one of:

"file"
"file:entry"
"format::file"
"format::file:entry"
"database:entry"
"database"
"@file"

Note that ':' separates the name of a file containing many possible entries from the specific name of a sequence entry in that file. It also separates the name of a database from an entry in that database

Note also that '::' separates the specified format of a file from the name of the file. Normally the format can be omitted, in which case the program will attempt to identify the correct format when reading the sequence in and will default to using FASTA format when writing the sequence out.

Valid names of the databases set up in your local implementation of EMBOSS can be seen by using the program 'showdb'.

Database queries, and individual entries in files that have more than one sequence entry, use wildcards of "?" for any character and "*" for any string of characters. There are some problems with the Unix shell catching these characters so they do need to be hidden in quotes or preceded by a backslash on the Unix command line, (for example "embl:hs\*")

The output USA name 'stdout' is special. It makes the output go to the device 'standard output'. This is the screen, by default.

Example USAs

The following are valid USAs for sequences:

USA	Description

xxx.seq	A sequence file "xxx.seq" in any format
fasta::xxx.seq	A sequence file "xxx.seq" in fasta format
gcg::egmsmg.gcg	A sequence file "egmsmg.gcg" in GCG 9 format
egmsmg.gcg -sformat=gcg	A sequence file "egmsmg.gcg" in GCG 9 format
embl::paamir.em	A sequence file "paamir.em" in EMBL format
embl:paamir	EMBL entry PAAMIR, using whatever access method is defined locally for the EMBL database
embl:X13776	EMBL entry X13776, using whatever access method is defined locally for the EMBL database and searching by accession number and entry name (X13776 is the accession number in this case)
embl-acc:X13776	EMBL entry X13776, using whatever access method is defined locally for the EMBL database and searching by accession number only
embl-id:paamir	EMBL entry PAAMIR, using whatever access method is defined locally for the EMBL database, and searching by ID only
embl:paami*	EMBL entries PAAMIB, PAAMIE and so on, usually in alphabetical order, using whatever access method is defined locally for the EMBL database
embl or EMBL:*	All sequences in the EMBL database
@mylist	Reads file mylist and uses each line as a separate USA. This is standard VMS list file syntax, also used in SRS 4.0 but missing in SRS 5.0. The list file is a list of USAs (one per line). List files can contain references to other lists files or any other standard USA.
list::mylist	Same as "@mylist" above
'getz -e [embl-id:paamir] |'	The pipe character "|" causes EMBOSS to fire up getz (SRS 5.1) to extract entry PAAMIR from EMBL in EMBL format. Any application or script which writes one or more sequences to stdout can be used in this way.
asis::atacgcagttatctgaccat	So far the shortest USA we could invent. In 'asis' format the name is the sequence so no file needs to be opened. This is a special case. It was intended as a joke, but could be quite useful for generating command lines.


    
</entry>
<entry [Thu 2013:07:11 12:01:45 EST] FIXED agua.cgi ERROR: 'File does not exist: /var/www/html/aguadev/lib'>

PROBLEM

agua.html CALL TO agua.cgi RETURN ERROR:

[error] [client 127.0.0.1] File does not exist: /var/www/html/aguadev/lib, referer: http://localhost/aguadev/agua.html?admin,9999999999.9999.999,data.home.workflow

DIAGNOSIS

agua.cgi IS NOT RUNNING AS FASTCGI SCRIPT


SOLUTION


1. ADD TO /etc/apache2/apache2.conf

   FastCgiServer /var/www/cgi-bin/aguadev/agua.cgi -idle-timeout 600 -processes 1
  
  
2. RESTART apache2

service apache2 restart


    
</entry>
<entry [Mon 2013:06:03 22:35:55 EST] SANGER EST DATABASE PLATFORM>

http://www.sanger.ac.uk/resources/software/est_db/

    
</entry>
<entry [Mon 2013:05:13 10:54:40 EST] FIXED Exchange.t CALL TO sendData ON services-dev>

PROBLEM

Upload.t ON syoung-dev SUCCESSFULLY SENDS A MESSAGE TO 'chat' QUEUE

Upload.t ON services-dev DOES NOT SEND MESSAGE


Exchange.t ON BOTH syoung-dev AND services-dev SENDS THE MESSAGE




DIAGNOSIS

COMPARED OUTPUT OF connection OBJECT FROM logDebug:

ON services-dev, LINE :

	"_queue":bless( {"_drain_code_queue":[sub { "DUMMY" }],


    
</entry>
<entry [Mon 2013:05:13 01:42:06 EST] FIXED INSTALL Net::RabbitFoot PROBLEM WITH cpanm>

SUMMARY: INSTALL XML::LibXML IS A MESS SO INSTALLED Net::RabbitFoot WITH --force

cpanm install Net::RabbitFoot --force

    OK


PROBLEM

GET THIS ERROR WHEN TRYING TO MANUALLYL INSTALL XML::LibXML

    The installed version of libxml2 is too low


SOLUTION:

1. INSTALL python-dev AND build-essential

sudo apt-get install build-essential
apt-get install python-dev

2. DOWNLOAD AND INSTALL libxml2:

mkdir /tmp/perlmods
cd /tmp/perlmods
wget ftp://xmlsoft.org/libxml2/libxml2-2.9.1.tar.gz
tar xvfz libxml2-2.9.1*
cd libxml2-2.9.1
./configure
make
make install

    OK

apt-get install libxml2-dev

    OK


NB: USING GITHUB VERSION DIDN'T WORK (CAN'T INSTALL WTHOUT ./configure FILE)
mkdir /tmp/perlmods
cd /tmp/perlmods
git clone git://git.gnome.org/libxml2

... SO TRIED DIRECT DOWNLOAD:


You'll get the 'libxml2 is missing' error if you're missing a build toolchain (at least I ran into this issue on Debian Lenny).

cpanm install Net::RabbitFoot

    Configuring XML-LibXML-2.0017 ... N/A
    ! Configure failed for XML-LibXML-2.0017. See /root/.cpanm/build.log for details.

    
FORCE INSTALL XML::LibXML:

cd /root/.cpanm/work/1368434032.28829/XML-LibXML-2.0017

perl Makefile.PL 

    enable native perl UTF8
    running xml2-config...The installed version of libxml2 is too low, as older versions proved to
    be buggy.
    You need at least version 2.9.0.
    You have version 2.8.0 .





cpanm install  MooseX::App::Cmd -v --force

    Test Summary Report
    -------------------
    t/configfile.t             (Wstat: 256 Tests: 3 Failed: 1)



TO AVOID THIS ERROR:


em /root/.cpanm/build.log 

    ...    
    running xml2-config...didn't manage to get libxml2 config, guessing
    options:
      LIBS='-L/usr/local/lib -L/usr/lib -lxml2 -lm'
      INC='-I/usr/local/include -I/usr/include'
    If this is wrong, Re-run as:
      $ /usr/bin/perl Makefile.PL LIBS='-L/path/to/lib' INC='-I/path/to/include'
    
    Checking for ability to link against xml2...no
    Checking for ability to link against libxml2...libxml2, zlib, and/or the Math library (-lm) have not been found.
    Try setting LIBS and INC values on the command line
    Or get libxml2 from
      http://xmlsoft.org/
    If you install via RPMs, make sure you also install the -devel
    RPMs, as this is where the headers (.h files) are.
    
    Also, you may try to run perl Makefile.PL with the DEBUG=1 parameter
    to see the exact reason why the detection of libxml2 installation
    failed or why Makefile.PL was not able to compile a test program.
    -> N/A
    -> FAIL Configure failed for XML-LibXML-2.0017. See /root/.cpanm/build.log for details.
    -> FAIL Bailing out the installation for Net-AMQP-0.06. Retry with --prompt or --force.
    -> FAIL Bailing out the installation for AnyEvent-RabbitMQ-1.13. Retry with --prompt or --force.
    -> FAIL Bailing out the installation for Net-RabbitFoot-1.03. Retry with --prompt or --force.
    22 distributions installed


MooseX::App::Cmd



先试一下：
  perl Makefile.PL LIBS='-L/usr/lib64'

无论你用的哪个发行版，建议还是先查一下libxml2模块装了没有。一般而言，应该是装在/usr/lib下面。
/opt目录下的libxml2模块，configure肯定不会自动认的。

另外建议用cpanm来安装perl模块，快捷方便。


cd /root/.cpanm/work/1368434032.28829/XML-LibXML-2.0017
perl Makefile.PL LIBS='-L/usr/lib64'

    QUITS WHEN CAN'T FIND libXML
    

    
1. Update the package index (package list) in your pc.
sudo apt-get update 

2. Use the apt-cache command to search for dependencies (missing packages). In your case:

apt-cache search libxml
apt-cache search libxml | grep dev
    libxml2-dev - Development files for the GNOME XML library
    ...

3. Install it.

sudo apt-get install libxml2-dev

libxml2 in Ubuntu has version 2.6.31 so that's no problem.

apt-cache show libxml2-dev

Compilation from source needs the header files (*.h), therefore you must install the xxx-dev package. That's why I limited the listing with | grep dev. Dev package will in turn pull out all necessary runtime libraries.

Last edited by moma; June 21st, 2008 at 01:16 PM.

    

INSTALL XML::LibXML ON UBUNTU

running xml2-config...The installed version of libxml2 is too low, as older versions proved to
be buggy.
You need at least version 2.9.0.
You have version 2.8.0 .



cd ~/.cpanm/work/1368434032.28829/XML-LibXML-2.0017
perl Makefile.PL LIBS='-L/usr/local/include'

    enable native perl UTF8
    Checking for ability to link against xml2...no
    Checking for ability to link against libxml2...libxml2, zlib, and/or the Math library (-lm) have not been found.
    Try setting LIBS and INC values on the command line
    ...


INSTALL ALL LIBXML PACKAGES:


apt-get install libxml-libxml-perl

apt-get install  zlib1g-dev



</entry>
<entry [Mon 2013:05:13 01:41:00 EST] ADDED installRabbitMQ AND installRabbitJs METHODS TO INSTALLER>




    
</entry>
<entry [Sun 2013:05:12 22:40:06 EST] VAGRANT - GOOD INTRO>


http://docs.vagrantup.com/v2/why-vagrant/

WHY VAGRANT?
Vagrant provides easy to configure, reproducible, and portable work environments built on top of industry-standard technology and controlled by a single consistent workflow to help maximize the productivity and flexibility of you and your team.

To achieve its magic, Vagrant stands on the shoulders of giants. Machines are provisioned on top of VirtualBox, VMware, AWS, or any other provider. Then, industry-standard provisioning tools such as shell scripts, Chef, or Puppet, can be used to automatically install and configure software on the machine.

HOW VAGRANT BENEFITS YOU

If you're a developer, Vagrant will isolate dependencies and their configuration within a single disposable, consistent environment, without sacrificing any of the tools you're used to working with (editors, browsers, debuggers, etc.). Once you or someone else creates a single Vagrantfile, you just need to vagrant up and everything is installed and configured for you to work. Other members of your team create their development environments from the same configuration, so whether you're working on Linux, Mac OS X, or Windows, all your team members are running code in the same environment, against the same dependencies, all configured the same way. Say goodbye to "works on my machine" bugs.

If you're an operations engineer, Vagrant gives you a disposable environment and consistent workflow for developing and testing infrastructure management scripts. You can quickly test things like shell scripts, Chef cookbooks, Puppet modules, and more using local virtualization such as VirtualBox or VMware. Then, with the same configuration, you can test these scripts on remote clouds such as AWS or RackSpace with the same workflow. Ditch your custom scripts to recycle EC2 instances, stop juggling SSH prompts to various machines, and start using Vagrant to bring sanity to your life.

If you're a designer, Vagrant will automatically setup everything required for that web app in order for you to focus on doing what you do best: design. Once a developer configures Vagrant, you don't need to worry about how to get that app running ever again. No more bothering other developers to help you fix your environment so you can test designs. Just check out the code, vagrant up, and start designing.
    
</entry>
<entry [Sun 2013:05:12 21:48:59 EST] NODE AND PERL>


http://www.slideshare.net/baudehlo/intro-to-nodejs-from-the-perspective-of-a-perl-hacker


    
</entry>
<entry [Fri 2013:05:10 22:24:55 EST] USING SVG>

http://css-tricks.com/using-svg/


    
</entry>
<entry [Fri 2013:05:10 22:23:21 EST] INSTALLED INKSCAPE (SVG EDITOR)>



**** USED SOFTWARE-CENTER ****
    OK


1. DOWNLOAD INKSCAPE

/home/syoung/software/inkscape/inkscape-0.48.4.tar.gz

2. INSTALL DEPENDENCIES

   * Boehm-GC
   * libsigc++
   * glibmm
   * gtkmm


Please see http://wiki.inkscape.org/wiki/index.php/CompilingInkscape for the
most current dependencies, including links to the source tarballs.

http://www.hpl.hp.com/personal/Hans_Boehm/gc

gc-7.2d.tar.gz
tar xvfz *.gz
cd gc-7.2
./configure
make
make install
    
    OK
    
apt-get install libsigc++

    OK

apt-get install libglibmm-2.4-1c2a

    ALREADY INSTALLED

apt-get install libgtkmm-2.4-1c2a

    ALREADY INSTALLED

    
    
3. INSTALL INKSCAPE

cd /home/syoung/software/inkscape
tar xvfz inkscape-0.48.4.tar.gz
cd inkscape-0.48.4
./configure

    configure: error: Cannot find freetype-config

apt-get install libfreetype6-dev
    
    OK


./configure

    configure: error: --enable-lcms was specified, but appropriate LittleCms development packages could not be found

DOWNLOAD LITTLE CMS
http://sourceforge.net/projects/lcms/files/lcms/2.4/lcms2-2.4.tar.gz/download
    
    

</entry>
<entry [Thu 2013:05:09 13:17:29 EST] FIXED RECURRING 'input not defined' BY infusion.pl>

PROBLEM

LOGIN GIVES THE FOLLOWING ERROR:

{error : 'input is not defined'}

DESPITE THE FACT THAT:

    - THE PERMISSIONS __SEEM__ CORRECT

    - infusion.cgi IS SET TO BE RUN IN /etc/apache2/apache2.conf
    
    - RESTARTED APACHE
    
print "\n";
SOLUTION

1. CHECK TO MAKE SURE STDOUT/STDERR REDIRECT TO workflow.out/workflow.err IS COMMENTED OUT

2. DON'T TRUST YOUR EYES - REDO PERMISSIONS 6755 ON infusion.pl AFTER EDITING

3. RESTART APACHE

    OK

    

UPDATE: NOT WORKING ON servdev

4. INSTALL mod_perl

apt-get install libapache-mod-perl

THIS WILL AT LEAST ALLOW infusion.cgi TO WORK AND EXECUTE infusion.pl, AND SHOW NO INPUT:

cat input.json

    Content-type: text/html
    
    { error: 'infusion.pl    input not defined' }




Premature end of script headers:
 


INSTALL DEPENDENCIES

aptitude install libgdbm-dev


BUT THEN GOT PROBLEM CREATING MAKEFILE FOR mod_perl:

perl Makefile.PL MP_APXS=/usr/bin/apxs2
    ...
    [warning] mod_perl dso library will be built as mod_perl.so
    [warning] You'll need to add the following to httpd.conf:
    [warning] 
    [warning]   LoadModule perl_module modules/mod_perl.soprint "\n";
    ...
    

SO SCRAPPED THAT AND USED A COPY OF

/aguadev/private/cgi-bin/c/infusion/infusion.cgi.good

TO

/infusiondev/cgi-bin/infusion.cgi

    OK!!!

... IT WORKS AS NORMAL. ___BUT____ ITS NOT USING STDIN:


em infusion.pl

<!--
### GET PUTDATA                                                                                        
#my $input      = <STDIN>;                                                                             
my $input       = $ARGV[0];
-->



    
    
</entry>
<entry [Wed 2013:03:20 22:34:48 EST] FIXED ERROR: "Can't create logfile" and "Can't create keyfile">

whoami AND uid/gid AS SUID ROOT BINARY RUN BY APACHE

==> out <==
whoami: root
gid: 0 33
pid: 0 33
uid=0(root) gid=0(root) groups=0(root),33(www-data)

whoami AND uid/gid MANUALLY AS ROOT

==> out.manual <==
whoami: root
gid: 0 0
pid: 0 0
uid=0(root) gid=0(root) groups=0(root)

    
</entry>
<entry [Wed 2013:03:20 17:01:30 EST] AMAZON SWF >

MAIN PAGE
http://aws.amazon.com/swf/

WHITE PAPER - RECIPES
http://aws.amazon.com/code/2535278400103493?ref_=pe_12300_26837160

WERNER VOGELS
http://www.allthingsdistributed.com/2012/02/Amazon-Simple-Workflow-Service.html

IMPLEMENTED WORKFLOW PATTERNS
http://www.infoq.com/news/2012/11/swfrecipes

Amazon Provides Simple Workflow Service Recipes
Posted by Boris Lublinsky on Nov 16, 2012

Amazon just released a whitepaper and code samples containing Amazon Simple Workflow Service Recipes.

Amazon Simple Workflow Service (SWF) is a:

... workflow service for building scalable, resilient applications. Whether automating business processes for finance or insurance applications, building sophisticated data analytics applications, or managing cloud infrastructure services, Amazon SWF reliably coordinates all of the processing steps within an application.
The big advantage of SWF is that it is a fully managed service that does not require any additional investments either in hardware or administration, including tuning, patching or software upgrading. It provides simple APIs and allows the execution of workflow steps either on EC2 or any machine having an Internet connection. The SWF implementation is based on polling, and, as a result, a program running on an internal (to enterprise) machine just polls SWF for new tasks. Finally, the AWS Management Console provides detailed reporting on the current status and execution history of workflows.

The SWF implementation requires adding "decider" code to a new or existing application that defines the work coordination logic by specifying work sequencing, timing, and failure conditions. It is also necessary to implement "activities", which are application components that execute each step of the work. The decider and activities form a "workflow." Once the decider and activities are in place, the SWF service coordinates the work on behalf of the application.

De`te all the advantages of AWS SWF, it is not always easy to produce a SWF implementation, due to lack of examples and best implementation practices. A new whitepaper from Amazon is filling this void by providing a wealth of workflow pattern implementation samples, accompanied by working code, implementing those patterns. The following groups of patterns and implementations are covered:

·         Repeated Execution of an activity, including:

o   Using a loop for repetitively execution of an activity a specified number of times.

o   Recursive execution of asynchronous activity a specified number of times.

o   Recursive execution of asynchronous activity while a condition is satisfied.

·         Concurrent Execution of multiple Activities, including:

o   Fork-Join with  a fixed number of activities

o   Fork-Join with  a dynamically determined number of activities

o   Fork multiple activities and use the result from the first activity to complete.

·         Conditional Execution of Workflow Logic

o   Execution of one of several activities based on a condition.

o   Execution of multiple activities from a larger group based on a condition.

·         Manual completion of an activity task

o   Manual activity implementation.

·         Exceptions handling for asynchronous execution

o   Handling exceptions thrown by asynchronous code such as activities and clean up resources using try/catch/finally.

o   Handling exceptions thrown by asynchronous code by invoking other asynchronous code.

·         Retrying failed asynchronous code

o   Retrying an activity until it either completes or the retry attempts reach a specified limit.

o   Annotating an activity so that the framework retries it automatically by using an exponential retry strategy, which waits for an increasingly long period between each retry, and stops at a specified point.

o   Implementing exponential retry by using the RetryDecorator class, which allows specifying the retry policy at run time and change it as needed.

o   Implementing exponential retry by using the AsyncRetryingExecutor class, which allows specifying the retry policy at run time. In addition, it shows the usage of the AsyncRunnable abstraction to implement a run method, which AsyncRetryingExecutor calls to execute the activity for each retry attempt.

o   Implementing a custom retry strategy.

·         Signaling a Workflow

o   Implementing a workflow waiting a specified time for a signal before proceeding.

Using the newly published SWF recipes provides a great starting point for the implementation of new custom workflows.

 


</entry>
<entry [Tue 2013:03:19 10:02:01 EST] FIXED ERROR 'Cannot determine the server's fully qualified domain name, using 127.0.1.1'>

1. EDIT

/etc/apache2/apache2.conf


ADD    

ServerName localhost


2. RESTART APACHE2

service apache2 restart
    OK
     * Restarting web server apache2                                                                     ... waiting           


</entry>
<entry [Thu 2013:02:28 12:55:40 EST] LOGGER TODO: UML SEQUENCE DIAGRAM>

http://www.ibm.com/developerworks/rational/library/3101.html

    
</entry>
<entry [Thu 2013:02:28 10:11:23 EST] ASPERA ON DEMAND>

http://cloud.asperasoft.com/aspera-on-demand/
    
</entry>
<entry [Fri 2013:02:08 03:39:59 EST] MATROX TRIPLEHEAD2GO FOR 3 VGA SCREENS>

http://www.cdw.com/shop/search/result.aspx?key=matrox+triplehead2go&wclsscat=&b=&p=&searchscope=All&ctlgfilter=&sr=1
    
</entry>
<entry [Fri 2013:02:08 00:23:04 EST] MANUALLY HIDE ADDRESS BAR IN CHROME>

*** FEATURE NOT FOUND IN STANDARD CHROME RELEASE ****

In order to use this feature

1. first get the latest Chrome Canary build

2. type about:flags on the address bar.

3. look for the “Compact Navigation” option and restart Canary.

4. Once you start the browser back up, just right-click the tab bar and select “Hide the toolbar”.

What you’ll  be left with will be a glass-like window frame and an address bar that will only show up as needed:

either when you open a tab or when you bring it up yourself by hitting Ctrl + L.


</entry>
<entry [Fri 2013:01:25 07:35:12 EST] ADDED loadSources TO bioapps.pm TO ENABLE LOAD OF AGUA SOURCES>

1. EXTRACTED AGUA SOURCE DATA TO TSVFILES

select * from groups where owner='agua' into outfile '/tmp/groups.tsv'; 
select * from groupmember where owner='agua' into outfile '/tmp/groupmember.tsv'; 
select * from source where username='agua' into outfile '/tmp/source.tsv'; 
select * from access where owner='agua' into outfile '/tmp/access.tsv'; 


2. COPIED TO OPSDIR bioapps/conf/tsv

cp /tmp/*tsv /agua/repos/private/syoung/bioappsdev/conf/tsv



3. RAN TEST

cd /agua/t/bin/Agua/Install
./Install.t --SHOWLOG 4

    
</entry>
<entry [Fri 2013:01:18 13:26:36 EST] PUBLISH PAPERS IN ELIFE>

http://www.elifesciences.org/
    
</entry>
<entry [Fri 2013:01:18 03:33:04 EST] BACKED UP repos AND notes TO LaCie>

#### DO IT WITHOUT COPYING LINKED DIRS, E.G.: /data/jbrowse/species FILES

#### COPY NOTES
mkdir -p /media/syoung/LaCie/u10.10/syoung/notes/0.8.0-beta.1+build.2
cp /home/syoung/notes /media/syoung/LaCie/u10.10/syoung/notes/0.8.0-beta.1+build.2
ll /media/syoung/LaCie/u10.10/syoung/notes/0.8.0-beta.1+build.2


#### COPY AGUA
#CREATE DIR
mkdir -p /media/syoung/LaCie/u10.10/syoung/0.8.0-beta.1+build.2

#COPY FILES
sudo rsync -av --safe-links /agua/* /media/syoung/LaCie/u10.10/syoung/0.8.0-beta.1+build.2

#COPY .GIT DIR
cp -r /agua/.git /media/syoung/LaCie/u10.10/syoung/0.8.0-beta.1+build.2
   
#CHECK FILES
ll /media/syoung/LaCie/u10.10/syoung/0.8.0-beta.1+build.2


####COPY AGUATEST
mkdir -p /media/syoung/LaCie/u10.10/syoung/aguatest/0.8.0-beta.1+build.2
sudo rsync -av --safe-links /agua/repos/private/syoung/aguatest/* /media/syoung/LaCie/u10.10/syoung/aguatest/0.8.0-beta.1+build.2
cp -r /agua/repos/private/syoung/aguatest/.git /media/syoung/LaCie/u10.10/syoung/aguatest/0.8.0-beta.1+build.2
ll /media/syoung/LaCie/u10.10/syoung/aguatest/0.8.0-beta.1+build.2


    
</entry>
<entry [Thu 2013:01:10 23:00:55 EST] FIND AND REMOVE MEMORY LEAKS CAUSED BY DOJO AND JAVASCRIPT>

IE
http://www.ibm.com/developerworks/web/library/wa-sieve/

ADD PURGE MEMORY BUTTON
http://www.askvg.com/tip-add-secret-purge-memory-button-in-google-chromes-task-manager/?utm_source=feedburner&utm_medium=email&utm_campaign=Feed%3A+AskVG+%28AskVG%29


    
</entry>
<entry [Thu 2013:01:10 02:18:07 EST] LISTENING>

http://www.huffingtonpost.com/2013/01/10/republican-party-election-2012_n_2443344.html

Obama campaign's chief technology officer, the tattooed, pierced former Threadless CTO Harper Reed

"We listened aggressively. I mean aggressively. To the point where people had Google alerts for errors that they expected. [Staffers] had searches on Twitter that were built specifically to ensure that things were going well. If someone said, 'I just tried to give $5 to the Obama campaign and it didn't work,' we would be alerted very quickly to that."


"It's less like there was a eureka moment of, 'Oh my God, everybody wants this,' and more of a just constant reading and interpreting data, every day for 20 months," Goff said.

Goff said regular engagement gave the campaign a good sense of how to motivate supporters, of what worked and what didn't.

Reed added that the process of soliciting feedback from volunteers and from voters was "incredibly manual."

The tech team had someone produce a daily digest of all the comments sent to the campaign from volunteers on the ground, and merged that with what it was hearing from the other parts of the campaign staff in Chicago.

Obama campaign staff also looked for supporters who were the most outspoken and effective on Twitter, Facebook and other social media, and reached out to them to offer support and give them more information to disseminate.

"Whereas when you look at overall neighborhood team approach, that neighborhood team leader is responsible for their neighborhoods in six or eight or 10 precincts, and they have to own them, and they have to figure out who lives there," he added. "And it's not always going to be, especially given where our voters are, it's not a homogenous area. So they have to find volunteers that look like that neighborhood."

    
</entry>
<entry [Tue 2013:01:01 22:34:03 EST] ADDED YORUBA SEQUENCES TO /data/sequence/reads>

/data/sequence/reads

    
</entry>
<entry [Mon 2012:12:31 13:01:09 EST] HOW BIG IS THE EC2 CLOUD>

http://it20.info/2012/09/cloud-and-the-three-it-geographies-silicon-valley-us-and-rest-of-the-world/
    
</entry>
<entry [Sat 2012:12:29 12:47:32 EST] UML IN JAVASCRIPT>

http://www.tikalk.com/javascript/building-uml-editor-javascript-part-1

    
</entry>
<entry [Fri 2012:12:28 05:22:38 EST] ADDED ntHumChimp DATA TO /data/sequence/demo/ntHumChimp>

1. LOCATE ntHumChimp.bed

cd /media/syoung/LaCie/u10.10
find . -type f -name *ntHumChimp*

    ./nethome/Project1/ntHumChimp/ntHumChimp.bed
    ./nethome/Project1/ntHumChimp/ntHumChimp.bed.bkp
    ./nethome/Project1/ntHumChimp/ntHumChimp.gtf
    ./nethome/Project1/ntHumChimp/ntHumChimp.gtf.bkp
    ./nethome/Project1/Workflow1/gff/chr1/ntHumChimp.gff
    ./nethome/Project1/Workflow1/gff/chr10/ntHumChimp.gff
    ./nethome/Project1/Workflow1/gff/chr11/ntHumChimp.gff
    ./nethome/Project1/Workflow1/gff/chr12/ntHumChimp.gff
    ...

2. MAKE TARGET DIR

mkdir /data/sequence/demo/ntHumChimp


3. COPY

cp -r /media/syoung/LaCie/u10.10/nethome/Project1/ntHumChimp/* \
/data/sequence/demo/ntHumChimp
cp -r /media/syoung/LaCie/u10.10/nethome/Project1/Workflow1/gff \
/data/sequence/demo/ntHumChimp



</entry>
<entry [Fri 2012:12:28 04:15:24 EST] CREATE USER DOES NOT SET PASSWORD>


... SO HAVE TO DO THIS:

root@syoung-Satellite-C675D:/home/aguadev# passwd
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully


    
</entry>
<entry [Sun 2012:12:23 06:53:19 EST] INSTALLED agua USER apps, parameter AND feature TABLE ENTRIES BY UPGRADING bioapps>

NB: app AND parameter DATA ALSO STORED IN agua-head1.dump

1. ADDED loadFeatures METHOD TO bioapps.pm

2. UPGRADED bioapps

clear; echo '{"username":"admin","sessionId":"9999999999.9999.999","package":"bioapps","repository":"bioapps","opsrepo":"biorepodev","version":"0.8.0-alpha.1+build.4","privacy":"private","owner":"syoung","installdir":"/agua/apps/bioapps","mode":"upgrade","random":940895504738,"SHOWLOG":4}' | ./workflow.pl

    
</entry>
<entry [Sun 2012:12:23 06:43:09 EST] ADDED feature TABLE STATIC FEATURES TO bioapps>

MOTIVATION: LOAD FEATURES ON INSTALL bioapps USING Ops::Install::loadTsvFile

1. MYSQL
select * from feature where type='static' into outfile '/tmp/feature.tsv';

2. COMMAND
cp /tmp/feature.tsv /agua/apps/bioapps/conf/tsv/feature.tsv



</entry>
<entry [Sat 2012:12:22 04:21:00 EST] RESTORED JBROWSE DEMO DATA TO admin USER PROJECTS>

1. COPIED control1

mkdir -p /home/admin/agua/Project2/Parkinsons/jbrowse

cd /home/admin/agua/Project2/Parkinsons/jbrowse
cp -r /mnt/data/jbrowse/species/human/hg19/demo/control1/ .
cp -r /mnt/data/jbrowse/species/human/hg19/demo/control2/ .
cp -r /mnt/data/jbrowse/species/human/hg19/demo/test1/ .
cp -r /mnt/data/jbrowse/species/human/hg19/demo/test2/ .

2. POPULATED viewfeature TABLE

INSERT INTO `viewfeature` VALUES ('admin','Project2','View1','control1-parkinsons','human','hg19','/nethome/admin/agua/Project2/Parkinsons/jbrowse/control1');
INSERT INTO `viewfeature` VALUES ('admin','Project2','View1','control2-parkinsons','human','hg19','/nethome/admin/agua/Project2/Parkinsons/jbrowse/control2');
INSERT INTO `viewfeature` VALUES ('admin','Project2','View1','test1-parkinsons','human','hg19','/nethome/admin/agua/Project2/Parkinsons/jbrowse/test1');
INSERT INTO `viewfeature` VALUES ('admin','Project2','View1','test2-parkinsons','human','hg19','/nethome/admin/agua/Project2/Parkinsons/jbrowse/test2');


3. POPULATED feature TABLE

GET ARCHIVED DATA
grep admin /mnt/home/syoung/notes/agua/private/bin/sql/tsv/120116/feature.tsv
    ...
    admin   Project1        Workflow0       test1-parkinsons        dynamic human   hg19    /nethome/jgilbert/agua/Project1/test1/jbrowse/test1-parkinsons
    admin   Project1        Workflow0       test2-parkinsons        dynamic human   hg19    /nethome/jgilbert/agua/Project1/test2/jbrowse/test2-parkinsons
    admin   Project1        Workflow0       control1-parkinsons     dynamic human   hg19    /nethome/jgilbert/agua/Project1/control1/jbrowse/control1-parkinsons
    admin   Project1        Workflow0       control2-parkinsons     dynamic human   hg19    /nethome/jgilbert/agua/Project1/control2/jbrowse/control2-parkinsons

desc feature;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| username | varchar(30) | NO   | PRI | NULL    |       |
| project  | varchar(20) | NO   | PRI | NULL    |       |
| workflow | varchar(20) | NO   | PRI |         |       |
| feature  | varchar(30) | NO   | PRI | NULL    |       |
| type     | varchar(20) | NO   |     | NULL    |       |
| species  | varchar(20) | YES  |     | NULL    |       |
| build    | varchar(20) | YES  |     | NULL    |       |
| location | text        | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+

IMPORT DATA

em /tmp/feature.tsv
admin	Project2	Parkinsons	test1	dynamic	human	hg19	/home/admin/agua/Project2/Parkinsons/jbrowse/test1
admin	Project2	Parkinsons	test2	dynamic	human	hg19	/home/admin/agua/Project2/Parkinsons/jbrowse/test2
admin	Project2	Parkinsons	control1	dynamic	human	hg19	/home/admin/agua/Project2/Parkinsons/jbrowse/control1
admin	Project2	Parkinsons	control2	dynamic	human	hg19	/home/admin/agua/Project2/Parkinsons/jbrowse/control2
	
LOAD IN MYSQL

load data local infile '/tmp/feature.tsv' into table feature;
    OK    


4. POPULATED viewfeature IN VIEW PANE
    OK
    
    
</entry>
<entry [Fri 2012:12:21 04:03:40 EST] PRE-MERGE CGI SCRIPTS TO agua.pl>

MEMORY USAGE FOR ONE MODULE IS ALMOST THE SAME AS FOR FOUR MODULES:


ONE MODULE (UPLOAD):

ps v 9921

PID TTY      STAT   TIME  MAJFL   TRS   DRS   RSS %MEM COMMAND
9921 ?        S      0:12      0     4 244907 81076  1.0 /usr/bin/perl ./upload.pl


FOUR MODULES:

PID TTY      STAT   TIME  MAJFL   TRS   DRS   RSS %MEM COMMAND
10723 ?        R      0:04      0     4 95651 34948  0.4 /usr/bin/perl ./upload.pl

WHERE

Page faults
Size of working segment that has been touched
Size of working segment and code segment in memory
Size of text segment
Size of resident set
Percentage of real memory used by this process

    
</entry>
<entry [Thu 2012:12:20 18:23:26 EST] IBM WHITE PAPER ON WHICH BUSINESS PROCESSES BENEFITED FROM CLOUD THE MOST>

http://reg.accelacomm.com/servlet/Frs.FrsGetContent?id=50279643


VERY NICE:

Figure 1. Workload affinity for cloud computing


IBM Development and Test Cloud benefits summary
•	 Resource provisioning reduced to as little as 1 hour from 
5 days or longer
•	 More efficient resource utilization through higher virtualization
•	 Increased availability of system resources as developers are more 
likely to de-provision images sooner
•	 Reduced labor spent building and supporting development and test 
environments and deploying associated middleware 
•	 Standard builds, reducing defects and the costs of custom 
configurations 
    
</entry>
<entry [Wed 2012:12:19 01:18:48 EST] IGNORED ERROR: /usr/bin/perl: no process found>
    
PROBLEM

WHEN TRY TO START APACHE, GET ERROR: /usr/bin/perl: no process found


SOLUTION

IGNORE, APACHE IS STARED NORMALLY



</entry>
<entry [Tue 2012:12:18 21:31:36 EST] ARCHIVED workflows AND /data FROM head BEFORE TERMINATION>

HEAD  
----
ARCHIVED 55 workflows AND 74 stages
/agua/private/bin/sql/dump/agua-head1.dump

DOWNLOADED

/data/bioapps/binary (24KB) AND MOVED TO
/agua/t/bin/Agua/Ops/GitHub/inputs/binary
*** LATER MOVE TO File ...? TESTS

/data/starcluster.tar.gz
/data/sequence.tar.gz
/data/apps.tar.gz

cd /data
time tar cvfz apps.tar.gz apps
    ...
    real	53m47.525s
    user	23m25.256s
    sys	2m11.596s

NB:
cd /data
time tar cvfz apps.zipfiles.tar.gz zipfiles
    ...
    real	16m45.751s
    user	5m3.991s
    sys	0m46.319s


    
THEN TERMINATED INSTANCE:

SEE [Tue 2012:12:18 23:25:25 EST]
i-b34d25d2: TERMINATED aquarius-8f2 (aquarius2 KEYFILE) USED TO TEST BOWTIE, NOVOALIGN AND MAQ PIPELINES

    
</entry>
<entry [Sat 2012:12:15 00:19:40 EST] RESTORED /home/jbrowse/users AND /data/jbrowse/species>

1. DOWNLOADED /home/jbrowse/users FROM HEADNODE

cd /mnt/home/jbrowse
scp root@$HEADIP3:/nethome/jbrowse/users.tar.gz .
    users.tar.gz                                  100%   22MB 672.9KB/s   00:34    

ll
    -rw-r--r-- 1 syoung syoung 23427212 Dec 15 00:17 users.tar.gz

tar xvfz users.tar.gz

ll /home
    lrwxrwxrwx 1 root root 9 Nov 16 14:05 /home -> /mnt/home/

ll /home/
    drwxr-xr-x  4 admin      www-data   4096 Nov 23 02:35 admin/
    drwxrwxr-x  3 syoung     syoung     4096 Dec 15 00:17 jbrowse/
    drwxr-xr-x  2 rioandshaw rioandshaw 4096 Nov 28 12:03 rioandshaw/
    drwxr-xr-x 44 syoung     syoung     4096 Dec 14 23:16 syoung/

ln -s /home/jbrowse/users /var/www/html/agua/plugins/view/jbrowse/users



2. COPIED /data/jbrowse/species (5.3 GB) FROM LaCie ARCHIVE

mkdir -p /mnt/data/jbrowse/species/
cd /media/syoung/LaCie/u10.10/data/jbrowse/species
cp -r human/ /mnt/data/jbrowse/species/
    OK
sudo du -hs /mnt/data/jbrowse/species/
    5.3G	/mnt/data/jbrowse/species/



3. CORRECTED PERMISSIONS ON /data/jbrowse AND /nethome/jbrowse/users LINKS AND FOLDERS

cd /mnt/data/jbrowse
warm www-data
cd /nethome/jbrowse/users

    

4. CREATED LINKS TO species AND users DIRS BY CREATING NEW VIEW

echo '{"project":"Project1","view":"View1","species":"human","build":"hg19","mode":"addView","username":"admin","sessionId":"9999999999.9999.999","SHOWLOG":4}' | ./view.pl

    
    
</entry>
<entry [Thu 2012:12:13 21:20:59 EST] CROWDFUNDING SITES>

the top crowdfunding platforms

Kickstarter
Indiegogo
Rocket Hub
    
</entry>
<entry [Mon 2012:12:03 03:53:30 EST] HEADNODE /data NOT MOUNTING AT STARTUP>

SUMMARY

DO MANUAL MOUNT OF NFS SHARES:

mount -v \\\\192.168.0.195\\myshare /media/myshare -t cifs -o rw,username=XXX,password=YYY


PROBLEM

/data DOESN'T MOUNT ON BOOT IF UNCOMMENT /data NFS ENTRY

em /etc/fstab

    LABEL=cloudimg-rootfs	/	ext4	defaults					0 0
    /dev/xvdi	/nethome	ext3	defaults,nobootwait				0 0
    #/dev/xvdi	/nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
    /dev/xvdh	/data		ext3	defaults,nobootwait				 0 0
    /dev/xvdh	/data		nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0



DIAGNOSIS


dmesg WITH NFS ENTRY IN /etc/fstab (DIFFERENCE FROM WITHOUT NFS ENTRY):


[14328178.040104] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[14328178.229407] init: statd-mounting main process (533) killed by TERM signal
[14328178.264950] type=1400 audit(1355357965.789:2): apparmor="STATUS" operation="profile_load" name="/sbin/dhclient" pid=571 comm="apparmor_parser"
[14328178.265390] type=1400 audit(1355357965.789:3): apparmor="STATUS" operation="profile_load" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=571 comm="apparmor_parser"
[14328178.265663] type=1400 audit(1355357965.789:4): apparmor="STATUS" operation="profile_load" name="/usr/lib/connman/scripts/dhclient-script" pid=571 comm="apparmor_parser"
[14328178.289169] type=1400 audit(1355357965.813:5): apparmor="STATUS" operation="profile_load" name="/usr/sbin/mysqld" pid=582 comm="apparmor_parser"
[14328178.291238] EXT3-fs: barriers not enabled
[14328178.295774] kjournald starting.  Commit interval 5 seconds
[14328178.295801] EXT3-fs (xvdi): warning: maximal mount count reached, running e2fsck is recommended
[14328178.297097] EXT3-fs (xvdi): using internal journal
[14328178.297103] EXT3-fs (xvdi): mounted filesystem with ordered data mode


WITHOUT NFS:

[14324591.779108] FS-Cache: Loaded
[14324591.867701] FS-Cache: Netfs 'nfs' registered for caching
[14324591.883077] EXT3-fs: barriers not enabled
[14324591.892841] kjournald starting.  Commit interval 5 seconds
### [14324591.892867] EXT3-fs (xvdi): warning: maximal mount count reached, running e2fsck is recommended
### [14324591.894411] EXT3-fs (xvdi): using internal journal
### [14324591.894417] EXT3-fs (xvdi): mounted filesystem with ordered data mode
[14324592.015376] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
### [14324592.079972] EXT3-fs: barriers not enabled
[14324592.086516] kjournald starting.  Commit interval 5 seconds
[14324592.086578] EXT3-fs (xvdh): warning: checktime reached, running e2fsck is recommended
### [14324592.087933] EXT3-fs (xvdh): using internal journal
### [14324592.087939] EXT3-fs (xvdh): mounted filesystem with ordered data mode
[14324592.767192] type=1400 audit(1355354380.494:2): apparmor="STATUS" operation="profile_load" name="/sbin/dhclient" pid=543 comm="apparmor_parser"
[14324592.767616] type=1400 audit(1355354380.494:3): apparmor="STATUS" operation="profile_load" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=543 comm="apparmor_parser"
[14324592.767879] type=1400 audit(1355354380.494:4): apparmor="STATUS" operation="profile_load" name="/usr/lib/connman/scripts/dhclient-script" pid=543 comm="apparmor_parser"
[14324592.792397] type=1400 audit(1355354380.518:5): apparmor="STATUS" operation="profile_load" name="/usr/sbin/mysqld" pid=544 comm="apparmor_parser"
[14324592.862086] type=1400 audit(1355354380.586:6): apparmor="STATUS" operation="profile_load" name="/usr/sbin/tcpdump" pid=545 comm="apparmor_parser"
[14324593.175865] init: failsafe main process (481) killed by TERM signal
[14324593.178137] init: apport pre-start process (575) terminated with status 1
[14324593.201617] init: apport post-stop process (586) terminated with status 1
[14324593.381794] type=1400 audit(1355354381.106:7): apparmor="STATUS" operation="profile_replace" name="/usr/sbin/mysqld" pid=624 comm="apparmor_parser


WITH NFS:

[14328177.736424] FS-Cache: Loaded
[14328177.875097] FS-Cache: Netfs 'nfs' registered for caching






[14328178.040104] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[14328178.229407] init: statd-mounting main process (533) killed by TERM signal
[14328178.264950] type=1400 audit(1355357965.789:2): apparmor="STATUS" operation="profile_load" name="/sbin/dhclient" pid=571 comm="apparmor_parser"
[14328178.265390] type=1400 audit(1355357965.789:3): apparmor="STATUS" operation="profile_load" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=571 comm="apparmor_parser"
[14328178.265663] type=1400 audit(1355357965.789:4): apparmor="STATUS" operation="profile_load" name="/usr/lib/connman/scripts/dhclient-script" pid=571 comm="apparmor_parser"
[14328178.289169] type=1400 audit(1355357965.813:5): apparmor="STATUS" operation="profile_load" name="/usr/sbin/mysqld" pid=582 comm="apparmor_parser"
### [14328178.291238] EXT3-fs: barriers not enabled
[14328178.295774] kjournald starting.  Commit interval 5 seconds
### [14328178.295801] EXT3-fs (xvdi): warning: maximal mount count reached, running e2fsck is recommended
### [14328178.297097] EXT3-fs (xvdi): using internal journal
### [14328178.297103] EXT3-fs (xvdi): mounted filesystem with ordered data mode
[14328178.301932] type=1400 audit(1355357965.825:6): apparmor="STATUS" operation="profile_load" name="/usr/sbin/tcpdump" pid=584 comm="apparmor_parser"
[14328179.111474] init: failsafe main process (513) killed by TERM signal
[14328179.115376] init: apport pre-start process (633) terminated with status 1
[14328179.130419] init: apport post-stop process (657) terminated with status 1
[14328179.374428] type=1400 audit(1355357966.897:7): apparmor="STATUS" operation="profile_replace" name="/usr/sbin/mysqld" pid=704 comm="apparmor_parser"





SOLUTION

CHANGED vers=3 TO nfsvers=3

#### DIDN'T WORK


TRIED USING CONFIGURATION FOUND IN /proc/mounts

rw,relatime,errors=continue,barrier=0,data=ordered

#### DIDN'T WORK


LOOKED IN /var/log/boot.log


pcbind: Cannot open '/run/rpcbind/rpcbind.xdr' file for reading, errno 2 (No such file or directory)^M
rpcbind: Cannot open '/run/rpcbind/portmap.xdr' file for reading, errno 2 (No such file or directory)^M
/usr/lib/python2.6/dist-packages/cloudinit/UserDataHandler.py:27: DeprecationWarning: the md5 module is deprecated; use hashlib instead
  import md5
cloud-init start-local running: Tue, 11 Dec 2012 21:37:41 +0000. up 3.54 seconds
no instance data found in start-local
/usr/lib/python2.6/dist-packages/cloudinit/UserDataHandler.py:27: DeprecationWarning: the md5 module is deprecated; use hashlib instead
  import md5
Traceback (most recent call last):
  File "/usr/bin/cloud-init", line 192, in < module>
    main()
  File "/usr/bin/cloud-init", line 91, in main
    print netinfo.debug_info()
  File "/usr/lib/python2.6/dist-packages/cloudinit/netinfo.py", line 67, in debug_info
    for (dev, d) in netdev.iteritems():
AttributeError: 'list' object has no attribute 'iteritems'
mountall: Event failed
 * Starting AppArmor profiles       ^[[80G ^M^[[74G[ OK ]
mount.nfs: remote share not in 'host:dir' format
mountall: mount /data [561] terminated with status 32
mount.nfs: remote share not in 'host:dir' format
mountall: mount /data [600] terminated with status 32


CHANGED /etc/fstab TO host:dir

cat /etc/fstab
LABEL=cloudimg-rootfs	/	ext4	defaults				0 0
/dev/xvdi	/nethome	ext3	defaults,nobootwait			0 0
#/dev/xvdi	/nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
/dev/xvdh	/data		ext3	defaults,nobootwait			 0 0
domU-12-31-38-04-6E-9C.compute-1.internal:/dev/xvdh	/data		nfs     rw,nfsvers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0


mount.nfs ERROR HAS DISAPPEARED IN BOOT LOG:

    rpcbind: Cannot open '/run/rpcbind/rpcbind.xdr' file for reading, errno 2 (No such file or directory)^M
    rpcbind: Cannot open '/run/rpcbind/portmap.xdr' file for reading, errno 2 (No such file or directory)^M
    /usr/lib/python2.6/dist-packages/cloudinit/UserDataHandler.py:27: DeprecationWarning: the md5 module is deprecated; use hashlib ins\
    tead
      import md5
    cloud-init start-local running: Wed, 12 Dec 2012 02:30:10 +0000. up 4.06 seconds
    no instance data found in start-local
    /usr/lib/python2.6/dist-packages/cloudinit/UserDataHandler.py:27: DeprecationWarning: the md5 module is deprecated; use hashlib ins\
    tead
      import md5
    Traceback (most recent call last):
      File "/usr/bin/cloud-init", line 192, in < module>
        main()
      File "/usr/bin/cloud-init", line 91, in main
        print netinfo.debug_info()
      File "/usr/lib/python2.6/dist-packages/cloudinit/netinfo.py", line 67, in debug_info
        for (dev, d) in netdev.iteritems():
    AttributeError: 'list' object has no attribute 'iteritems'
    mountall: Event failed
    
    ...
    
    Since the script you are attempting to invoke has been converted to an
    Upstart job, you may also use the start(8) utility, e.g. start S20mysql
    start: Unknown job: S20mysql
    Checking for running unattended-upgrades:
    landscape-client is not configured, please run landscape-config.
     * Starting MySQL Server^[[74G[ OK ]
     * Starting web server apache2       ^[[80G ^M^[[74G[ OK ]
    Agua::Installer::openLogfile    Opening logfile: /agua/bin/scripts/../../createcert.log
    Agua::Installer::openLogfile    Writing to logfile: /agua/bin/scripts/../../createcert.log
    Wed Dec 12 02:30:17 UTC 2012    flagfile found. Quitting
     * Stopping CPU interrupts balancing daemon^[[74G[ OK ]
    updateHostname.pl     printing to logfile: /tmp/agua.updatehostname.log
     ... waiting ...






TRIED ADDING //192.168.0.1 TO FIRST COLUMN IN /etc/fstab:

//192.168.0.1






ADDED NFS OPTION timeo=14 TO /etc/fstab




http://hunterford.me/amazon-ec2-and-nfs/


TRYING SETTING rpcbind TO START AT BOOT

chkconfig --level 2345 rpcbind on


I had some problem booting up my appliances after upgrading to 9.10. The home directories were mounted over NFS at boot time and after the upgrade, it wouldn't mount anymore, unless i mounted it manually after boot.

Message that showed:
Code:
init: statd pre-start process (505) terminated with status 1
...
mount.nfs: Either use '-o nolock' to keep locks local, or start statd

Since i am not at all familiar with Upstart, it took some time to figure this out..

It seems like a line is missing from the pre-start script in /etc/init/statd.conf

Before 'status portmap | grep -q start/running || start portmap' add:

emacs -nw /etc/init/statd.conf

    exec rpc.statd -L $STATDOPTS


Then nfs mounts works at boot again.





CREATE THE MISSING FILES:

touch /run/rpcbind/rpcbind.xdr
touch /run/rpcbind/portmap.xdr

ll /run/rpcbind
    -rw-r--r--  1 root root   0 2012-12-11 22:08 portmap.xdr
    -rw-r--r--  1 root root   0 2012-12-11 22:08 rpcbind.xdr

#### DIDN'T WORK

    
</entry>
<entry [Sun 2012:12:02 06:22:31 EST] FIXED SGE ERROR: 'All queues dropped because of overload or full'>

SUMMARY

1. THE MESSAGE IN qstat -f OUTPUT IS SPURIOUS:

'scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is full
                            All queues dropped because of overload or full
    
    THE JOB IS RUNNING AND COMPLETES FINE!!!

2. I WAS LOOKING FOR OUTPUT IN THE WRONG DIRECTORY
    
    I.E., I WAS LOOKING IN /nethome/admin INSTEAD OF /home/admin 

3. REMOVED ETERNAL SLEEP FROM FTP.pl


ALL THE CHANGES BELOW MAY OR MAY NOT HAVE HELPED BUT THE DEFAULT SETTINGS APPEAR TO WORK ANYWAY


CHANGED admin-Project1-Workflow1 QUEUE CONFIG

qconf -mq admin-Project1-Workflow1

FROM: 

    load_thresholds       np_load_avg=20

TO:

    load_thresholds       np_load_avg=24





https://forums.oracle.com/forums/thread.jspa?messageID=10476280

Hello,

the error message "cannot run in queue instance xyz because it is not of type batch" occurs because the queue instance is not setup to accept batch jobs. You can verify this by running qconf -mq queuename and the find the "qtype" property. In the case of your queues it may only have INTERACTIVE defined. You can change this to "BATCH INTERACTIVE" to accept both types of jobs.

Hope this helps,

Michael



http://linux.die.net/man/5/sge_sched_conf
http://arc.liv.ac.uk/pipermail/gridengine-users/2007-August/015511.html
http://bioinformatics.org/pipermail/bioclusters/2004-December/002146.html


http://www.mentby.com/Group/grid-engine/trouble-with-load-thresholds.html

Please have a look at `man sched_conf` for the exact explanation of   
the behavior. As SGE usually uses the 5 minutes average load (the   
middle ouput of 1/5/15 avg load in `uptime`), it will put some   
artificial load on the machine to avoid oversubscription by the delay   
the np_load_avg faces in the 5 minutes average and decay this over the   
specified time. When you have short running jobs this should just   
reflect the actual load.

They aren't. If they would, you could check this with `qstat -f` and   
`qstat -explain A`. The adjusted load will only be used to allow or   
disallow the scheduling of jobs. As the adjusted load value should   
reflect the real load after the decay time, the scheduler is looking   
ahead: if this job would really reach the estimated load, it would   
suspend a job in the near future. Hence the job isn't scheduled.

So the theory, but I also notice some jobs being pushed into T state w/ 
o the queue itself being in suspend alarm state A - confusing. Even a   
single job can push itself into suspend state and will resume and so   
on... Can you please file a bug?




Hi.

I pack jobs unto nodes using the following GE setup:

     # qconf -ssconf | egrep "queue|load"
     queue_sort_method                 seqno
     job_load_adjustments              NONE
     load_adjustment_decay_time        0
     load_formula                      slots

I also set my nodes with the slots complex value:

     # qconf -rattr exechost complex_values "slots=64" compute-2-1

Serial jobs are all packed nicely unto a node until the node is full and then it goes unto the next node.

The issue I am having is that my subordinate queue breaks when I have set my nodes with the node complex value above.

I have two queues:  The owner queue and the free queue:

     # qconf -sq owner | egrep "subordinate|shell"
     shell                 /bin/bash
     shell_start_mode      posix_compliant
     subordinate_list      free=1

     # qconf -sq free | egrep "subordinate|shell"
     shell                 /bin/bash
     shell_start_mode      posix_compliant
     subordinate_list      NONE







PROBLEM

RUN SGE JOB

export SGE_QMASTER_PORT=36371; export SGE_EXECD_PORT=36372; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qsub  -q admin-Project1-Workflow1 -V  -l h_rt=24:00:00  -r y /home/admin/agua/Project1/Workflow1//scripts/Project1-1-Workflow1-1.sh 2>&1


BUT SGE JOB PENDING WITH qstat -j ERROR:

qstat -j 10
    ...
    scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is overloaded: np_load_avg=100.010000 (= 0.010000 + 100 * 1.000000 with nproc=1) >= 20

*** WHERE DOES THE NUMBER 20 COME FROM? ****
*** IT IS SET IN THE QUEUE'S CONFIG:

/opt/sge6/bin/lx24-x86/qconf -sq admin-Project1-Workflow1
    qname                 admin-Project1-Workflow1
    hostlist              @allhosts
    seq_no                0
    load_thresholds       np_load_avg=20
    suspend_thresholds    NONE
    nsuspend              1
    suspend_interval      00:05:00
    priority              0
    min_cpu_interval      00:05:00

**********************************************


WHERE THE SCHEDULER CONFIG BEFORE CHANGE IS:

/opt/sge6/bin/lx24-x86/qconf -ssconf

    algorithm                         default
    schedule_interval                 0:0:15
    maxujobs                          0
    queue_sort_method                 load
    job_load_adjustments              np_load_avg=100
    load_adjustment_decay_time        0:0:15
    load_formula                      np_load_avg
    schedd_job_info                   true
    flush_submit_sec                  1
    flush_finish_sec                  1
    params                            none
    reprioritize_interval             0:0:0
    halftime                          168
    usage_weight_list                 cpu=1.000000,mem=0.000000,io=0.000000
    compensation_factor               5.000000
    weight_user                       0.250000
    weight_project                    0.250000
    weight_department                 0.250000
    weight_job                        0.250000
    weight_tickets_functional         0
    weight_tickets_share              0
    share_override_tickets            TRUE
    share_functional_shares           TRUE
    max_functional_jobs_to_schedule   200
    report_pjob_tickets               TRUE
    max_pending_tasks_per_job         50
    halflife_decay_list               none
    policy_hierarchy                  OFS
    weight_ticket                     0.010000
    weight_waiting_time               0.000000
    weight_deadline                   3600000.000000
    weight_urgency                    0.100000
    weight_priority                   1.000000
    max_reservation                   0
    default_duration                  INFINITY



QSTAT SHOWS JOB IS PENDING:

/opt/sge6/bin/lx24-x86/qstat -f

    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    admin-Project1-Workflow1@ip-10 BIP   0/1/1          0.01     linux-x64     
          3 0.55500 Project1-1 root         r     12/02/2012 07:54:19     1        
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
          4 0.55500 Project1-1 root         qw    12/02/2012 10:52:01     1        



THE HOSTS ARE NOT OVERLOADED:

/opt/sge6/bin/lx24-x86/qhost

    HOSTNAME                ARCH         NCPU  LOAD  MEMTOT  MEMUSE  SWAPTO  SWAPUS
    -------------------------------------------------------------------------------
    global                  -               -     -       -       -       -       -
    ip-10-122-209-130       linux-x64       1  0.01  592.0M  134.4M     0.0     0.0
    ip-10-87-71-97          lx24-x86        1  0.01    1.6G  631.2M     0.0     0.0





    
CHANGED schedule_max_interval FROM 0:0:15 TO 0:15:0

qstat -j 10

    scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is overloaded: np_load_avg=56.010000 (= 0.010000 + 100 * 0.560000 with nproc=1) >= 20
                            All queues dropped because of overload or full

JACKED UP job_load_adjustments TO np_load_avg=1000

qstat -j 10

    scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is overloaded: np_load_avg=310.010000 (= 0.010000 + 1000 * 0.310000 with nproc=1) >= 20
                            All queues dropped because of overload or full


REDUCED job_load_adjustments TO 10 AND INCREASED schedule_max_interval TO 0:45:0:

qstat -j 10

scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is full

CHANGED
job_load_adjustments    100
schedule_max_interval   0:45:0

qstat -j 12

    scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is overloaded: np_load_avg=86.010000 (= 0.010000 + 100 * 0.860000 with nproc=1) >= 20
                            All queues dropped because of overload or full


CHANGED
job_load_adjustments              np_load_avg=100
load_adjustment_decay_time        0:0:15
load_formula                      np_load_avg

qstat -j 12

    scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is overloaded: np_load_avg=100.010000 (= 0.010000 + 100 * 1.000000 with nproc=1) >= 20
                            All queues dropped because of overload or full




scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is overloaded: np_load_avg=97.010000 (= 0.010000 + 100 * 0.970000 with nproc=1) >= 20
                            All queues dropped because of overload or full
                            
CHANGED

job_load_adjustments              np_load_avg=100
load_adjustment_decay_time        0:45:0
load_formula                      np_load_avg
schedd_job_info                   true

qstat -j 12

scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is overloaded: np_load_avg=54.010000 (= 0.010000 + 100 * 0.540000 with nproc=1) >= 20
                            All queues dropped because of overload or full


CHANGED
job_load_adjustments              np_load_avg=100
load_adjustment_decay_time        0:0:15
load_formula                      np_load_avg

scheduling info:            queue instance "admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal" dropped because it is full


CHANGED

job_load_adjustments              np_load_avg=0

TO

job_load_adjustments              NONE


BUT STILL JOB HANGS AFTER SET TO 'r'

/opt/sge6/bin/lx24-x86/qstat -explain A
queuename                      qtype resv/used/tot. load_avg arch          states
---------------------------------------------------------------------------------
admin-Project1-Workflow1@ip-10 BIP   0/1/1          0.01     linux-x64     
     14 0.55500 Project1-1 root         r     12/03/2012 06:07:39     1  


GET SGE VERSION:

/opt/sge6/bin/lx24-x86/qstat --help

    GE 6.2u5

    
TRIED THE FOLLOWING CONFIGURATION:

qconf -ssconf | egrep "queue|load"

    queue_sort_method                 seqno
    job_load_adjustments              NONE
    load_adjustment_decay_time        0
    load_formula                      slots


BUT NO CHANGE.

SO TRIED CHANGING job_load_adjustments METHOD BACK TO load THEN SETTING np_load_ag IN QUEUE (NOT SCHEDULER) CONFIG:

/opt/sge6/bin/lx24-x86/qconf -sq admin-Project1-Workflow1

CHANGED

    load_thresholds       np_load_avg=20

TO
    
    load_thresholds       np_load_avg=1

BUT NO CHANGE.


SET job_load_adjustments TO np_load_avg=0.5 AND NOW TWO JOBS ARE RUNNING ON THE ONE EXECUTION NODE:

/opt/sge6/bin/lx24-x86/qconf -msconf

CHANGED

job_load_adjustments              np_load_avg=1

TO:

job_load_adjustments              np_load_avg=0.5



/opt/sge6/bin/lx24-x86/qstat
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
-----------------------------------------------------------------------------------------------------------------
     16 0.55500 Project1-1 root         r     12/03/2012 06:57:17 admin-Project1-Workflow1@ip-10     1        
     17 0.55500 Project1-1 root         r     12/03/2012 08:06:18 admin-Project1-Workflow1@ip-10     1        
     18 0.55500 Project1-1 root         qw    12/03/2012 07:16:28                                    1        
     19 0.55500 Project1-1 root         qw    12/03/2012 07:16:43                                    1        

THE SAME (REVERSIBLE) THING HAPPENED WHEN SET processors AND slots IN QUEUE CONFIG:

/opt/sge6/bin/lx24-x86/qconf -mq admin-Project1-Workflow1

CHANGED:

    processors            1
    slots                 1

TO:

    processors            2
    slots                 2
    

NB: PURGED QUEUE AFTER RESET (ALTHOUGH NOT NECESSARY)

/opt/sge6/bin/lx24-x86/qconf -cq admin-Project1-Workflow1


    
USED qstat -f -r -ne TO GET MORE DETAIL:


/opt/sge6/bin/lx24-x86/qstat -r -ne
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
-----------------------------------------------------------------------------------------------------------------
     16 0.55500 Project1-1 root         r     12/03/2012 06:57:17 admin-Project1-Workflow1@ip-10     1        
       Full jobname:     Project1-1-Workflow1-1
       Master Queue:     admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal
       Hard Resources:   h_rt=86400 (0.000000)
       Soft Resources:   
       Hard requested queues: admin-Project1-Workflow1
     17 0.55500 Project1-1 root         r     12/03/2012 08:06:18 admin-Project1-Workflow1@ip-10     1        
       Full jobname:     Project1-1-Workflow1-1
       Master Queue:     admin-Project1-Workflow1@ip-10-122-209-130.ec2.internal
       Hard Resources:   h_rt=86400 (0.000000)
       Soft Resources:   
       Hard requested queues: admin-Project1-Workflow1
     18 0.55500 Project1-1 root         qw    12/03/2012 07:16:28                                    1        
       Full jobname:     Project1-1-Workflow1-1
       Hard Resources:   h_rt=86400 (0.000000)
       Soft Resources:   
       Hard requested queues: admin-Project1-Workflow1
     19 0.55500 Project1-1 root         qw    12/03/2012 07:16:43                                    1        
       Full jobname:     Project1-1-Workflow1-1
       Hard Resources:   h_rt=86400 (0.000000)
       Soft Resources:   
       Hard requested queues: admin-Project1-Workflow1



CHANGED SCHEDULER CONFIG job_load_adjustments BACK TO 1:

/opt/sge6/bin/lx24-x86/qconf -sq admin-Project1-Workflow1

FROM:

job_load_adjustments              np_load_avg=0.5

TO:

job_load_adjustments              np_load_avg=1



FOUND sched_configuration FILE IN admin-microcluster CELL:

cat /opt/sge6/admin-microcluster/common/sched_configuration 

    # Version: 6.2u5
    # 
    # DO NOT MODIFY THIS FILE MANUALLY!
    # 
    algorithm default
    schedule_interval 0:0:15
    maxujobs 0
    queue_sort_method 0
    job_load_adjustments np_load_avg=0.50
    load_adjustment_decay_time 0:7:30
    load_formula np_load_avg
    schedd_job_info false
    flush_submit_sec 0
    flush_finish_sec 0
    params none
    reprioritize_interval 0:0:0
    halftime 168
    usage_weight_list cpu=1.000000 mem=0.000000 io=0.000000
    compensation_factor 5.000000
    weight_user 0.250000
    weight_project 0.250000
    weight_department 0.250000
    weight_job 0.250000
    weight_tickets_functional 0
    weight_tickets_share 0
    weight_tickets_override 0
    share_override_tickets TRUE
    share_functional_shares TRUE
    max_functional_jobs_to_schedule 200
    report_pjob_tickets TRUE
    max_pending_tasks_per_job 50
    halflife_decay_list none
    policy_hierarchy OFS
    weight_ticket 0.010000
    weight_waiting_time 0.000000
    weight_deadline 3600000.000000
    weight_urgency 0.100000
    weight_priority 1.000000
    max_reservation 0
    default_duration INFINITY



TRIED USING -tsm ARGUMENT TO LOG TO common/schedd_runlog:

FILE DOES NOT EXIST:

/opt/sge6/admin-microcluster/common/schedd_runlog

/opt/sge6/bin/lx24-x86/qconf -tsm

    root@ip-10-87-71-97.ec2.internal triggers scheduler monitoring

WHERE:

     -tsm  < trigger scheduler monitoring>
          The Sun Grid Engine scheduler is forced by this  option
          to  print  trace messages of its next scheduling run to
          the file  < sge_root>/< cell>/common/schedd_runlog.   The
          messages  indicate  the reasons for jobs and queues not
          being selected in that run.  Requires root  or  manager
          privileges.

          Note, that  the  reasons  for  job  requirements  being
          invalid with respect to resource availability of queues
          are displayed using the format  as  described  for  the
          qstat(1)  -F  option (see description of Full Format in
          section OUTPUT FORMATS of the qstat(1) manual page.



DOESN'T WORK. THIS FILE DID NOT APPEAR:

head /opt/sge6/admin-microcluster/common/schedd_runlog



USED 'qstat -F' TO GET FULL OUTPUT:

/opt/sge6/bin/lx24-x86/qstat -F

    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    admin-Project1-Workflow1@ip-10 BIP   0/2/2          0.01     linux-x64     
        hl:arch=linux-x64
        hl:num_proc=1
        hl:mem_total=592.043M
        hl:swap_total=0.000
        hl:virtual_total=592.043M
        hl:load_avg=0.010000
        hl:load_short=0.000000
        hl:load_medium=0.010000
        hl:load_long=0.050000
        hl:mem_free=415.621M
        hl:swap_free=0.000
        hl:virtual_free=415.621M
        hl:mem_used=176.422M
        hl:swap_used=0.000
        hl:virtual_used=176.422M
        hl:cpu=0.100000
        hl:m_topology=SC
        hl:m_topology_inuse=SC
        hl:m_socket=1
        hl:m_core=1
        hl:np_load_avg=0.010000
        hl:np_load_short=0.000000
        hl:np_load_medium=0.010000
        hl:np_load_long=0.050000
        qf:qname=admin-Project1-Workflow1
        qf:hostname=ip-10-122-209-130.ec2.internal
        qc:slots=0
        qf:tmpdir=/tmp
        qf:seq_no=0
        qf:rerun=0.000000
        qf:calendar=NONE
        qf:s_rt=infinity
        qf:h_rt=infinity
        qf:s_cpu=infinity
        qf:h_cpu=infinity
        qf:s_fsize=infinity
        qf:h_fsize=infinity
        qf:s_data=infinity
        qf:h_data=infinity
        qf:s_stack=infinity
        qf:h_stack=infinity
        qf:s_core=infinity
        qf:h_core=infinity
        qf:s_rss=infinity
        qf:h_rss=infinity
        qf:s_vmem=infinity
        qf:h_vmem=infinity
        qf:min_cpu_interval=00:05:00
         16 0.55500 Project1-1 root         r     12/03/2012 06:57:17     1        
         17 0.55500 Project1-1 root         r     12/03/2012 08:06:18     1        
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
         18 0.55500 Project1-1 root         qw    12/03/2012 07:16:28     1        
         19 0.55500 Project1-1 root         qw    12/03/2012 07:16:43     1    



SLOTS=0 FOR EXECUTION HOST:

    qf:hostname=ip-10-122-209-130.ec2.internal
    qc:slots=0




CHECKED OK CONFIG FOR EXECUTION HOST

/opt/sge6/bin/lx24-x86/qconf -se ip-10-122-209-130.ec2.internal
    
    hostname              ip-10-122-209-130.ec2.internal
    load_scaling          NONE
    complex_values        NONE
    load_values           arch=linux-x64,num_proc=1,mem_total=592.042969M, \
                          swap_total=0.000000M,virtual_total=592.042969M, \
                          load_avg=0.010000,load_short=0.000000, \
                          load_medium=0.010000,load_long=0.050000, \
                          mem_free=415.664062M,swap_free=0.000000M, \
                          virtual_free=415.664062M,mem_used=176.378906M, \
                          swap_used=0.000000M,virtual_used=176.378906M, \
                          cpu=0.000000,m_topology=SC,m_topology_inuse=SC, \
                          m_socket=1,m_core=1,np_load_avg=0.010000, \
                          np_load_short=0.000000,np_load_medium=0.010000, \
                          np_load_long=0.050000
    processors            1
    user_lists            NONE
    xuser_lists           NONE
    projects              NONE
    xprojects             NONE
    usage_scaling         NONE
    report_variables      NONE


DIAGNOSIS

http://linux.die.net/man/5/sge_sched_conf

JOB LOAD ADJUSTMENTS

If the job_load_adjustments list is assigned the special denominator NONE, no load corrections are performed.

    
    
</entry>
<entry [Fri 2012:11:30 16:41:57 EST] FIXED CAN'T SUBMIT SGE JOB>

PROBLEM 

root@ip-10-87-71-97:/var/www/cgi-bin/agua# cat /tmp/execd_messages.4530 
11/30/2012 21:39:45|  main|ip-10-87-71-97|E|communication error for "ip-10-87-71-97.ec2.internal/execd/1" running on port 36372: "can't bind socket"
11/30/2012 21:39:46|  main|ip-10-87-71-97|E|commlib error: can't bind socket (no additional information available)
11/30/2012 21:40:14|  main|ip-10-87-71-97|C|abort qmaster registration due to communication errors
11/30/2012 21:40:16|  main|ip-10-87-71-97|W|daemonize error: child exited before sending daemonize state


commit ef803a4a5c7be13ae86ca7dea09e1e1e730dc4bb
Author: Stuart Young < stuartpyoung@gmail.com>
Date:   Sat Dec 1 03:46:53 2012 -0500

    +Fix lib/Agua: Multiple mods in fix submit SGE job
    
    Problems:
    1) 'sgeadmin' user not created (with userid 1001)
    2) 'master' lingering in @allhosts hostlist after new cluster start
    3) New master's info not being used - old data in qmaster_info file
    
    Solutions:
    1) Added creation of 'sgeadmin' (uid 1001) in config --mode createUsers
    2) Added Workflow::deleteDefaultMaster to:
       - Remove master from @allhosts hostlist
       - Remove master from admin, submit and execution host lists
    3) Added setMasterInfo method to:
       - Update qmaster_info file on headnode
       - Update act_qmaster file on headnode & master
       - Add new master's internalfqd to @allhosts hostlist


    
</entry>
<entry [Fri 2012:11:30 03:06:46 EST] ADDED removeFromAllHosts METHOD TO Agua::Workflow>

*** THIS DOESN'T WORK BECAUSE AN EMPTY @allhosts hostlist LEADS TO THE admin-Project1-Workflow1 QUEUE NOT BEING RECOGNISED ON SUBMIT ***



REMOVE master FROM @allhosts AND LEAVE IT EMPTY

http://biowiki.org/HowToAdministerSunGridEngine


You must add the exec host name to the hostlist list, and how many CPUs it has for SGE to the slots field.

ADDING A HOST TO THE @allhosts GROUP is only useful if you have more than one host group... So you can probably omit this... 

Add the host to the "@allhosts" host group:

qconf -mhgrp @allhosts

then add the name of the new host, save, and exit.
    
</entry>
<entry [Thu 2012:11:29 22:29:16 EST] POST-REFACTOR ROLE Agua::Common::SGE UML USAGE REPORT>
    

cd /agua/bin/scripts
reset; ./uml.pl \
--sourcefile /agua/lib/Agua/Common/SGE.pm \
--targetdir /agua/lib/Agua \
--mode roleUsers \
--outputfile /tmp/sge-roleusers.tsv \
--SHOWLOG 4 &> out


cat /tmp/sge-roleusers.tsv

Agua::Common::SGE
	roles: 
	slots: envars execdport json masterip project qmasterport sgeroot workflow
	methods: _addQueue _getSgeBinRoot _removeQueue addPE addPEQueuefileContents addPEToQueue backupFile checkHeadnodeSge checkMasterSge checkSge createQueuefile deleteAdminHost deleteQueueJobs getActQmaster getHeadnodeMasterInfo getHostlist getHostname getQueue getQueueConf getQueuefile getQueuefileTemplate getSgeBinRoot getSgePorts isIntel modifyQueue mountOnMaster qstatFailure qstatSummary queueExists queueStatus rebootInstance removePE resetMaster restartHeadnodeSge restartMasterSge setHeadnodeActQmaster setHeadnodeHostname setHeadnodeHostnamefile setHeadnodeMasterInfo setHeadnodeSubmit setMasterActQmaster setMasterEtcHosts setMasterHostname setMasterHostnamefile setMasterMountPoints setMasterOpsSsh setPEFileContents setQueuefileContents setSgePorts setSgeSubmitHosts sgeEnvars sgebinCommand startHeadnodeSge startMasterSge stopHeadnodeSge stopMasterSge update updateHeadnodeEtcExports updateHeadnodeInSge updateHostname updateMasterEtcFstab updateMasterInSge
	internals: _getSgeBinRoot addPEQueuefileContents backupFile checkHeadnodeSge checkMasterSge createQueuefile deleteQueueJobs getHeadnodeMasterInfo getQueuefileTemplate getSgePorts isIntel modifyQueue mountOnMaster qstatFailure qstatSummary restartHeadnodeSge restartMasterSge setHeadnodeActQmaster setHeadnodeHostname setHeadnodeHostnamefile setHeadnodeMasterInfo setMasterActQmaster setMasterEtcHosts setMasterHostname setMasterHostnamefile setMasterMountPoints setMasterOpsSsh setPEFileContents setQueuefileContents setSgePorts setSgeSubmitHosts sgeEnvars sgebinCommand startHeadnodeSge startMasterSge stopHeadnodeSge stopMasterSge update updateHeadnodeEtcExports updateHeadnodeInSge updateMasterEtcFstab updateMasterInSge
	externals: captureStderr cell cluster conf db execdport getAdminKey getEc2PrivateFile getEc2PublicFile getEnvars getFileContents getFileroot getHeadnodeSgeBin head logDebug logEror logError master masterid privatekey publiccert qmasterport runCommand setDbh setKeypairFile ssh username
Agua::Workflow
	external_calls
		*Agua::Workflow	*Agua::Common::SGE
		setQueue	_addQueue	
		unsetQueue	_removeQueue	
		setPE	addPE	
		setPE	addPEToQueue	
		ensureSgeRunning	checkSge	
		setPE	getQueuefile	2	
		setQueue	getQueuefile	
		unsetQueue	getQueuefile	
		loadStarCluster	getSgePorts	
		setQueue	queueExists
        
</entry>
<entry [Mon 2012:11:26 03:56:07 EST] USER Agua::StarCluster UML USAGE REPORT>

cd /agua/bin/scripts
reset; ./uml.pl \
--targetfile /agua/lib/Agua/StarCluster.pm \
--mode userRoles \
--outputfile /tmp/Agua-StarCluster--userroles.tsv \
--SHOWLOG 4 &> out


cat  /tmp/Agua-StarCluster--userroles.tsv 
Agua::StarCluster
	roles: Agua::Common::Aws Agua::Common::Base Agua::Common::Cluster Agua::Common::Database Agua::Common::Logger Agua::Common::SGE Agua::Common::Ssh Agua::Common::Util
	slots: PRINTLOG SHOWLOG amazonuserid amiid availzone awsaccesskeyid awssecretaccesskey balancerfile cluster clustertype clusteruser conf conffile config configfile db devices devs executable fields fileroot help instance instanceid instancetype interval keyfile keyname keypairfile launched loaded logfile maxnodes minnodes monitor mountpoints mounts nodes outputdir outputfile pid plugins privatekey publiccert queue requestor running sgecell sgeroot sleep sleepinterval slots sourcedirs sources stabilisationtime tailwait username waittime workflowpid
	methods: BUILD _createVolume addKeypair args balancerLog balancerRunning clear clusterLog createConfig deleteKeypair dumpObject generateKeypair getopts initialise isRunning launchBalancer launchCluster load loadArgs setBalancerFile setInstanceId setKeyname setOutputDir{ setOutputFile setPE setQueue shortenString startBalancer startCluster stopCluster terminateBalancer terminateCluster unsetQueue writeConfigFile
	internals: addKeypair args clear createConfig deleteKeypair getopts initialise launchBalancer launchCluster loadArgs setBalancerFile setInstanceId setKeyname setOutputFile shortenString terminateBalancer terminateCluster writeConfigFile
	externals: SHOWLOG _addQueue _createPluginsDir _removeQueue addPE addPEToQueue amazonuserid amiid availzone awsaccesskeyid awssecretaccesskey balancerfile can captureStderr cluster clusteruser conf config configfile db devices devs execdport executable fields fileTail getAdminKey getConfigFile getEnvars getQueuefile help instance instanceid instancetype interval keyname keypairfile killPid loaded logDebug logError logNote maxnodes meta minnodes mountpoints mounts nodes outputdir outputfile pid plugins privatekey project publiccert qmasterport queueExists setKeypairFile setSlots sgeroot sleepinterval sourcedirs sources stabilisationtime unTaint username waittime workflow

Agua::Common::Database
	roles: 
	slots: database
	methods: grantPrivileges inputRootPassword inputValue setDbh
	internals: inputValue
	externals: PRINTLOG SHOWLOG can conf db json logDebug logError logNote logfile rootpassword

Agua::Common::Base
	roles: 
	slots: fileroot
	methods: _addToTable _removeFromTable _updateTable arrayToArrayhash getData getFileroot getTable getTestFileroot isTestUser
	internals: getTestFileroot
	externals: can conf cowCase db fileroot getAccess getAmis getAppHeadings getApps getAws getCloudHeadings getClusterWorkflows getClusters getFeatures getFileCaches getGroupMembers getGroups getHub getPackages getParameters getProjects getRegionZones getSharedApps getSharedParameters getSharedProjects getSharedSources getSharedStageParameters getSharedStages getSharedViewFeatures getSharedViews getSharedWorkflows getSharingHeadings getSources getStageParameters getStages getUsers getViewFeatures getViews getWorkflows isAdminUser json logCaller logDebug logError logNote requestor username

Agua::Common::SGE
	external_calls
		*Agua::Common::SGE	*Agua::Common::Base
		getQueuefile	getFileroot	
		getQueuefile	getFileroot	

Agua::Common::Cluster
	roles: 
	slots: configfile instancetypeslots privatekey publiccert
	methods: _addCluster _addClusterWorkflow _createCellDir _createPluginsDir _isCluster _removeCellDir _removeCluster _removeClusterWorkflow clusterIsBusy clusterNodesInfo describeInstances getAdminKey getCellDir getCluster getClusterByWorkflow getClusterInstanceIds getClusterStatus getClusterVars getClusterWorkflow getClusterWorkflows getClusters getConfigFile getDefaultCellDir getHeadnodeInternalIp getInstanceInfo getInternalIps getLocalInstanceInfo getMasterId getMasterInstanceInfo getMonitor getQmasterIps parseInstanceInfo removeCluster runningClusters saveClusterWorkflow setSlots updateClusterNodes
	internals: _addClusterWorkflow _removeCellDir _removeCluster _removeClusterWorkflow clusterNodesInfo describeInstances getAdminKey getCellDir getClusterByWorkflow getClusterInstanceIds getConfigFile getDefaultCellDir getInstanceInfo getLocalInstanceInfo getMasterId parseInstanceInfo setSlots
	externals: _addQueue _addToTable _removeFromTable _removeQueue adminkey checkSge cluster conf configfile db getQueuefile instancetypeslots json logCaller logDebug logError logStatus monitor privatekey project publiccert queueName username workflow workflowpid

Agua::Common::Ssh
	external_calls
		*Agua::Common::Ssh	*Agua::Common::Cluster
		setKeypairFile	getAdminKey	
		setKeypairFile	getAdminKey
        
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Cluster
		createConfig	_createPluginsDir	
		createConfig	getAdminKey	
		setKeyname	    getAdminKey	
		setOutputDir	getAdminKey	
		initialise	    getConfigFile	
		isRunning	    getConfigFile	
		launchBalancer	getConfigFile	
		setPE	        setSlots	
		setQueue	    setSlots	
		writeConfigFile	setSlots	


</entry>
<entry [Mon 2012:11:26 03:45:08 EST] ROLE Agua::Common::Cluster UML USAGE REPORT>

cd /agua/bin/scripts
reset; ./uml.pl \
--sourcefile /agua/lib/Agua/Common/Cluster.pm \
--targetdir /agua/lib/Agua \
--mode roleUsers \
--outputfile /tmp/Agua-Common-Cluster--roleusers.tsv \
--SHOWLOG 4 &> out


cat /tmp/Agua-Common-Cluster--roleusers.tsv 

Agua::Common::Cluster
	roles: 
	slots: configfile instancetypeslots privatekey publiccert
	methods: _addCluster _addClusterWorkflow _createCellDir _createPluginsDir _isCluster _removeCellDir _removeCluster _removeClusterWorkflow clusterIsBusy clusterNodesInfo describeInstances getAdminKey getCellDir getCluster getClusterByWorkflow getClusterInstanceIds getClusterStatus getClusterVars getClusterWorkflow getClusterWorkflows getClusters getConfigFile getDefaultCellDir getHeadnodeInternalIp getInstanceInfo getInternalIps getLocalInstanceInfo getMasterId getMasterInstanceInfo getMonitor getQmasterIps parseInstanceInfo removeCluster runningClusters saveClusterWorkflow setSlots updateClusterNodes
	internals: _addClusterWorkflow _removeCellDir _removeCluster _removeClusterWorkflow clusterNodesInfo describeInstances getAdminKey getCellDir getClusterByWorkflow getClusterInstanceIds getConfigFile getDefaultCellDir getInstanceInfo getLocalInstanceInfo getMasterId parseInstanceInfo setSlots
	externals: _addQueue _addToTable _removeFromTable _removeQueue adminkey checkSge cluster conf configfile db getQueuefile instancetypeslots json logCaller logDebug logError logStatus monitor privatekey project publiccert queueName username workflow workflowpid

Agua::Balancer
	external_calls
		*Agua::Balancer	*Agua::Common::Cluster
		markClustersForTermination	clusterIsBusy	
		markClustersForTermination	getConfigFile	
		checkBalancers	            runningClusters	

Agua::Workflow
	external_calls
		*Agua::Workflow	*Agua::Common::Cluster
		addCluster	    _addCluster	
		newCluster	    _addCluster	
		addCluster	    _removeCluster	
		runOnCluster	clusterIsBusy	
		createQueue	    getAdminKey	
		deleteQueue	    getAdminKey	
		getEc2KeyFiles	getAdminKey	
		createQueue	    getCluster	
		loadStarCluster	getCluster	
		_getStatus	    getClusterByWorkflow	
		loadStarCluster	getClusterStatus	
		_getStatus	    getClusterWorkflow	
		clusterStatus	getConfigFile	
		createQueue	    getConfigFile	2	
		deleteQueue	    getConfigFile	2	
		runOnCluster	getConfigFile	

Agua::Common::Ssh
	external_calls
		*Agua::Common::Ssh	*Agua::Common::Cluster
		setKeypairFile	getAdminKey	
		setKeypairFile	getAdminKey	

Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Cluster
		createConfig	_createPluginsDir	        <== to Agua::StarCluster
		createConfig	getAdminKey	
		setKeyname	    getAdminKey	
		setOutputDir	getAdminKey	
		initialise	    getConfigFile	
		isRunning	    getConfigFile	
		launchBalancer	getConfigFile	
		setPE	        setSlots	                <== to Agua::StarCluster
		setQueue	    setSlots	                <== to Agua::StarCluster
		writeConfigFile	setSlots	                <== to Agua::StarCluster

</entry>
<entry [Mon 2012:11:26 03:36:15 EST] ROLE Agua::Ops::Sge UML USAGE REPORT>

cd /agua/bin/scripts
reset; ./uml.pl \
--sourcefile /agua/lib/Agua/Ops/Sge.pm \
--targetdir /agua/lib/Agua \
--mode roleUsers \
--outputfile /tmp/Agua-Ops-Sge--roleusers.tsv \
--SHOWLOG 4 &> out


cat /tmp/Agua-Ops-Sge--roleusers.tsv 

    Agua::Ops::Sge
        roles: 
        slots: 
        methods: execdRunning killProcess qmasterRunning sgeProcessListening stopSgeProcess
        internals: killProcess sgeProcessListening
        externals: logDebug logError runCommand

    
</entry>
<entry [Sat 2012:11:24 03:37:41 EST] ROLE Agua::Common::SGE UML USAGE REPORT>

NB: THE ROLE Agua::Cluster::Jobs DOES NOT APPEAR BECAUSE IT USES getEnvars BUT IS NOT USED BY ANY CLASSES IN bin/Agua - IT IS USED BY bioapps CLASSES

cd /agua/bin/scripts
reset; ./uml.pl \
--sourcefile /agua/lib/Agua/Common/SGE.pm \
--targetdir /agua/lib/Agua \
--mode roleUsers \
--outputfile /tmp/sge-roleusers.tsv \
--SHOWLOG 4 &> out


cat  /tmp/sge-roleusers.tsv
Agua::Common::SGE
	roles: 
	slots: envars execdport json masterip project qmasterport sgeroot workflow
	methods: _addQueue _removeQueue addPE addPEQueuefileContents addPEToQueue backupFile checkHeadnodeSge checkMasterSge checkSge createQueuefile deleteQueueJobs getActQmaster getEnvars getHeadnodeMasterInfo getHostlist getHostname getPorts getQueue getQueueConf getQueuefile getQueuefileTemplate modifyQueue mountOnMaster qstatFailure qstatSummary queueExists queueName queueStatus rebootInstance removePE resetMaster restartHeadnodeSge restartMasterSge setHeadnodeActQmaster setHeadnodeHostname setHeadnodeHostnamefile setHeadnodeMasterInfo setHeadnodeSubmit setMasterActQmaster setMasterEtcHosts setMasterHostname setMasterHostnamefile setMasterMountPoints setMasterOpsSsh setPEFileContents setQueuefileContents setSgePorts setSgeSubmitHosts sgeEnvars sgebinCommand startHeadnodeSge startMasterSge stopHeadnodeSge stopMasterSge update updateHeadnodeEtcExports updateHeadnodeInSge updateHostname updateMasterEtcFstab updateMasterInSge
	internals: addPEQueuefileContents backupFile checkHeadnodeSge checkMasterSge createQueuefile deleteQueueJobs getEnvars getHeadnodeMasterInfo getPorts getQueuefileTemplate modifyQueue mountOnMaster qstatFailure qstatSummary queueName restartHeadnodeSge restartMasterSge setHeadnodeActQmaster setHeadnodeHostname setHeadnodeHostnamefile setHeadnodeMasterInfo setMasterActQmaster setMasterEtcHosts setMasterHostname setMasterHostnamefile setMasterMountPoints setMasterOpsSsh setPEFileContents setQueuefileContents setSgePorts setSgeSubmitHosts sgeEnvars sgebinCommand startHeadnodeSge startMasterSge stopHeadnodeSge stopMasterSge update updateHeadnodeEtcExports updateHeadnodeInSge updateMasterEtcFstab updateMasterInSge
	externals: captureStderr cell cluster conf db envars execdport getAdminKey getEc2PrivateFile getEc2PublicFile getFileContents getFileroot head json logDebug logError master masterid privatekey project publiccert qmasterport queue setDbh setKeypairFile ssh username workflow
Agua::View
	external_calls
		*Agua::View	*Agua::Common::SGE
		initialise	getEnvars	
		linkSpeciesDir	getEnvars	
Agua::Workflow
	external_calls
		*Agua::Workflow	*Agua::Common::SGE
		ensureSgeRunning	checkSge	
		killClusterJob	    getEnvars	
		loadStarCluster	    getEnvars	
		runOnCluster	    getEnvars	
		setStages	        getEnvars	
		loadStarCluster	    getPorts	
		createQueue	        queueName	
		deleteQueue	        queueName	
		setStages	        queueName	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::SGE
		setQueue	_addQueue	        <== to Agua::StarCluster
		unsetQueue	_removeQueue	    <== to Agua::StarCluster
		setPE	addPE	                <== to Agua::StarCluster
		setPE	addPEToQueue	        <== to Agua::StarCluster
		launchBalancer	getEnvars	    <== to Agua::StarCluster
		setPE	getQueuefile	2	    <== to Agua::StarCluster
		setQueue	getQueuefile	    <== to Agua::StarCluster    
		unsetQueue	getQueuefile	    <== to Agua::StarCluster    
		setQueue	queueExists	        <== to Agua::StarCluster
        
        
MATCHES MANUALLY CREATED LIST USING --mode userRole:

Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::SGE
		setQueue	    _addQueue	
		unsetQueue	    _removeQueue	
		setPE	        addPE	
		setPE	        addPEToQueue	
		launchBalancer	getEnvars	
		setPE	        getQueuefile	2	
		setQueue	    getQueuefile	
		unsetQueue	    getQueuefile	
		setQueue	    queueExists	

Agua::View
	external_calls
		*Agua::View	*Agua::Common::SGE
		initialise	    getEnvars	
		linkSpeciesDir	getEnvars
        
Agua::Workflow
	external_calls
		*Agua::Workflow	*Agua::Common::SGE
		ensureSgeRunning	checkSge	
		killClusterJob	getEnvars	
		loadStarCluster	getEnvars	
		runOnCluster	getEnvars	
		setStages	    getEnvars	
		loadStarCluster	getPorts	
		createQueue	    queueName	
		deleteQueue	    queueName	
		setStages	    queueName
        
        
</entry>
<entry [Fri 2012:11:09 13:26:36 EST] COPIED AGUA TO LACIE (1TB)>

GIT VERSION
cd /agua
git describe --tags --abbrev=1
    0.8.0-alpha.1+build.42-23-gf2ad3

CREATE DIR
mkdir -p /media/LaCie/u10.10/syoung/0.8.0-alpha.1+build.42

COPY FILES
rsync -av --safe-links /agua/* /media/LaCie/u10.10/syoung/0.8.0-alpha.1+build.42

COPY .GIT DIR
cp -r /agua/.git /media/LaCie/u10.10/syoung/0.8.0-alpha.1+build.42
   
CHECK FILES
ll /media/LaCie/u10.10/syoung/0.8.0-alpha.1+build.42

    
</entry>
<entry [Fri 2012:11:02 13:46:59 EST] GOOD DOCUMENTATION - MOJOLICIOUS>
    
http://mojolicio.us/perldoc
    
</entry>
<entry [Thu 2012:11:01 03:12:03 EST] Agua::Workflow ALL CALLS TO ROLES (NO ROLE DETAILS)>




    
</entry>
<entry [Thu 2012:11:01 00:51:08 EST] UBUNTU ERRORS SHOW PEAK REPORTING AFTER RELEASE>

NB: NICE BREAKDOWN BY DAY AND PACKAGE

https://errors.ubuntu.com/


</entry>
<entry [Thu 2012:11:01 00:40:45 EST] Agua::StarCluster ALL CALLS TO ROLES (NO ROLE DETAILS)>

NB: REMOVED CALLS TO Agua::Common::Logger

==> userroles--Agua-StarCluster--Agua-Common-Aws.tsv <==
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Aws
		writeConfigfile	getAws	

==> userroles--Agua-StarCluster--Agua-Common-Balancer.tsv <==
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Balancer
		start	balancerRunning	
		initialise	getBalancerOutputdir	
		start	launchBalancer	
		start	terminateBalancer	
		stop	terminateBalancer	

==> userroles--Agua-StarCluster--Agua-Common-Base.tsv <==
Agua::Common::Balancer
	external_calls
		*Agua::Common::Balancer	*Agua::Common::Base
		launchBalancer	_addToTable	
		launchBalancer	_addToTable	
Agua::Common::SGE
	external_calls
		*Agua::Common::SGE	*Agua::Common::Base
		getQueuefile	getFileroot	
		getQueuefile	getFileroot	

==> userroles--Agua-StarCluster--Agua-Common-Cluster.tsv <==
Agua::Common::Balancer
	external_calls
		*Agua::Common::Balancer	*Agua::Common::Cluster
		getBalancerOutputdir	getAdminKey	
		balancerRunning	getClusterStatus	
		getBalancerOutputdir	getAdminKey	
		balancerRunning	getClusterStatus	
Agua::Common::Ssh
	external_calls
		*Agua::Common::Ssh	*Agua::Common::Cluster
		setKeypairfile	getAdminKey	
		setKeypairfile	getAdminKey	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Cluster
		start	getCluster	
		initialise	getConfigFile	
		setPE	setSlots	
		setQueue	setSlots	
		writeConfigfile	setSlots	

==> userroles--Agua-StarCluster--Agua-Common-Database.tsv <==
Agua::Common::Balancer
	external_calls
		*Agua::Common::Balancer	*Agua::Common::Database
		launchBalancer	setDbh	
		launchBalancer	setDbh	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Database
		initialise	setDbh	

==> userroles--Agua-StarCluster--Agua-Common-SGE.tsv <==
Agua::Common::Balancer
	external_calls
		*Agua::Common::Balancer	*Agua::Common::SGE
		launchBalancer	getEnvars	
		launchBalancer	getEnvars	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::SGE
		setQueue	_addQueue	
		unsetQueue	_removeQueue	
		setPE	addPE	
		setPE	addPEToQueue	
		writeConfigfile	getPorts	
		setPE	getQueuefile	2	
		setQueue	getQueuefile	
		unsetQueue	getQueuefile	
		setQueue	queueExists	

==> userroles--Agua-StarCluster--Agua-Common-Ssh.tsv <==
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Ssh
		initialise	setKeypairfile	

==> userroles--Agua-StarCluster--Agua-Common-Util.tsv <==
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Util
		terminateCluster	captureStderr	2	
		launchCluster	fileTail	
		BUILD	unTaint	

    
</entry>
<entry [Thu 2012:11:01 00:21:09 EST] Agua::StarCluster ALL CALLS TO ROLES (WITH ROLE DETAILS)>


==> userroles--Agua-StarCluster--Agua-Common-Aws <==
Agua::Common::Aws
	roles: 
	slots: 
	methods: _addAws _getAws _removeAws addVolume formatLines formatPrivateKey formatPublicCert getAvailabilityZone getAws getEc2KeyDir getEc2PrivateFile getEc2PublicFile getRegionZones mountUserVolume omitAwsInfo printEc2KeyFiles removeAws
	internals: _getAws _removeAws formatLines formatPrivateKey formatPublicCert getAws getEc2KeyDir getEc2PrivateFile getEc2PublicFile omitAwsInfo
	externals: _addToTable _removeFromTable accesskeyid awssecretaccesskey conf db getAdminKey get_json json logDebug logError logNote printToFile username
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Aws
		writeConfigfile	getAws	

==> userroles--Agua-StarCluster--Agua-Common-Balancer <==
Agua::Common::Balancer
	roles: 
	slots: interval sleepinterval stabilisationtime waittime
	methods: balancerOutput balancerRunning checkBalancers getBalancerOutputdir getBalancerOutputfile launchBalancer markClustersForTermination processIsRunning setClusterPolled setClusterTerminated stopBalancer terminateBalancer
	internals: getBalancerOutputdir getBalancerOutputfile launchBalancer markClustersForTermination processIsRunning setClusterPolled setClusterTerminated
	externals: _addToTable clusterInputs clusterIsBusy clusterIsRunning conf db getAdminKey getClusterStatus getConfigFile getEnvars interval logDebug logError outputdir runningClusters setDbh stabilisationtime waittime
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Balancer
		start	balancerRunning	
		initialise	getBalancerOutputdir	
		start	launchBalancer	
		start	terminateBalancer	
		stop	terminateBalancer	

==> userroles--Agua-StarCluster--Agua-Common-Base <==
Agua::Common::Base
	roles: 
	slots: fileroot
	methods: _addToTable _removeFromTable _updateTable arrayToArrayhash getData getFileroot getTable getTestFileroot isTestUser
	internals: getTestFileroot
	externals: can conf cowCase db fileroot getAccess getAdminHeadings getAmis getApps getAws getClusterWorkflows getClusters getFeatures getFileCaches getGroupMembers getGroups getHub getPackages getParameters getProjects getRegionZones getSharedApps getSharedParameters getSharedProjects getSharedSources getSharedStageParameters getSharedStages getSharedViewFeatures getSharedViews getSharedWorkflows getSharingHeadings getSources getStageParameters getStages getUsers getViewFeatures getViews getWorkflows isAdminUser json logCaller logDebug logError logNote requestor username
Agua::Common::Balancer
	external_calls
		*Agua::Common::Balancer	*Agua::Common::Base
		launchBalancer	_addToTable	
		launchBalancer	_addToTable	
Agua::Common::SGE
	external_calls
		*Agua::Common::SGE	*Agua::Common::Base
		getQueuefile	getFileroot	
		getQueuefile	getFileroot	

==> userroles--Agua-StarCluster--Agua-Common-Cluster <==
Agua::Common::Cluster
	roles: 
	slots: configfile instancetypeslots privatekey publiccert
	methods: _addCluster _addClusterWorkflow _createCellDir _createPluginsDir _isCluster _removeCellDir _removeCluster _removeClusterWorkflow clusterInputs clusterIsBusy clusterNodesInfo describeInstances getAdminKey getCellDir getCluster getClusterByWorkflow getClusterInstanceIds getClusterStatus getClusterVars getClusterWorkflows getClusters getConfigFile getDefaultCellDir getHeadnodeInternalIp getInstanceInfo getInternalIps getLocalInstanceInfo getMasterId getMasterInstanceInfo getMonitor getQmasterIps newCluster parseInstanceInfo removeCluster runningClusters saveClusterWorkflow setSlots updateClusterNodes
	internals: _addCluster _addClusterWorkflow _createCellDir _removeCellDir _removeCluster _removeClusterWorkflow clusterNodesInfo describeInstances getAdminKey getCellDir getCluster getClusterByWorkflow getClusterInstanceIds getConfigFile getDefaultCellDir getInstanceInfo getLocalInstanceInfo getMasterId parseInstanceInfo setSlots
	externals: _addQueue _addToTable _createConfigFile _removeFromTable _removeQueue adminkey checkSge cluster conf configfile db getAws getEc2PrivateFile getEc2PublicFile getQueuefile instancetypeslots json logCaller logDebug logError logSError logStatus monitor privatekey project publiccert queueName setDbh username workflow workflowpid
Agua::Common::Balancer
	external_calls
		*Agua::Common::Balancer	*Agua::Common::Cluster
		getBalancerOutputdir	getAdminKey	
		balancerRunning	getClusterStatus	
		getBalancerOutputdir	getAdminKey	
		balancerRunning	getClusterStatus	
Agua::Common::Ssh
	external_calls
		*Agua::Common::Ssh	*Agua::Common::Cluster
		setKeypairfile	getAdminKey	
		setKeypairfile	getAdminKey	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Cluster
		start	getCluster	
		initialise	getConfigFile	
		setPE	setSlots	
		setQueue	setSlots	
		writeConfigfile	setSlots	

==> userroles--Agua-StarCluster--Agua-Common-Database <==
Agua::Common::Database
	roles: 
	slots: database
	methods: grantPrivileges inputRootPassword inputValue setDbh
	internals: inputValue
	externals: PRINTLOG SHOWLOG can conf db json logDebug logError logNote logfile rootpassword
Agua::Common::Balancer
	external_calls
		*Agua::Common::Balancer	*Agua::Common::Database
		launchBalancer	setDbh	
		launchBalancer	setDbh	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Database
		initialise	setDbh	

==> userroles--Agua-StarCluster--Agua-Common-Logger <==
Agua::Common::Logger
	roles: 
	slots: OLDPRINTLOG OLDSHOWLOG PRINTLOG SHOWLOG backup errpid indent logfh logfile olderr oldout username
	methods: DIE_handler WARN_handler appendLog{ backupLogfile fakeTermination logCaller logCritical logDebug logError logGroup logGroupEnd logInfo logNote logReport logStatus logTimestamp logWarning objectToJson pauseLog{ resumeLog{ setUserLogfile set_signal_handlers startLog startLogStderr stopLogStderr stopLog{
	internals: DIE_handler WARN_handler backupLogfile logDebug logError logTimestamp objectToJson
	externals: OLDPRINTLOG OLDSHOWLOG PRINTLOG SHOWLOG appendLog db errpid indent logfh logfile olderr oldout setDbh
Agua::Common::Balancer
	external_calls
		*Agua::Common::Balancer	*Agua::Common::Logger
		balancerRunning	logError	3	
		launchBalancer	logError	2	
		balancerRunning	logError	3	
		launchBalancer	logError	2	
Agua::Common::Ssh
	external_calls
		*Agua::Common::Ssh	*Agua::Common::Logger
		setKeypairfile	logCaller	
		setKeypairfile	logError	
		setKeypairfile	logCaller	
		setKeypairfile	logError	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Logger
		BUILD	logDebug	5	
		_createVolume	logDebug	2	
		addKeypair	logDebug	2	
		deleteKeypair	logDebug	3	
		dump	logDebug	
		generateKeypair	logDebug	6	
		getMonitor	logDebug	3	
		getopts	logDebug	10	
		initialise	logDebug	8	
		isRunning	logDebug	5	
		launchCluster	logDebug	13	
		setPE	logDebug	6	
		setQueue	logDebug	4	
		shortenString	logDebug	3	
		start	logDebug	6	
		stop	logDebug	3	
		terminateCluster	logDebug	5	
		unsetQueue	logDebug	
		writeConfigfile	logDebug	35	
		addKeypair	logError	
		generateKeypair	logError	
		initialise	logError	2	
		launchCluster	logError	2	
		start	logError	6	
		stop	logError	5	
		writeConfigfile	logError	2	

==> userroles--Agua-StarCluster--Agua-Common-SGE <==
Agua::Common::SGE
	roles: 
	slots: envars execdport json masterip project qmasterport sgeroot workflow
	methods: _addQueue _removeQueue addPE addPEQueuefileContents addPEToQueue backupFile checkHeadnodeSge checkMasterSge checkSge createQueuefile deleteQueueJobs getActQmaster getEnvars getHeadnodeMasterInfo getHostlist getHostname getPorts getQueue getQueueConf getQueuefile getQueuefileTemplate modifyQueue mountOnMaster qstatFailure qstatSummary queueExists queueName queueStatus rebootInstance removePE resetMaster restartHeadnodeSge restartMasterSge setHeadnodeActQmaster setHeadnodeHostname setHeadnodeHostnamefile setHeadnodeMasterInfo setHeadnodeSubmit setMasterActQmaster setMasterEtcHosts setMasterHostname setMasterHostnamefile setMasterMountPoints setMasterOpsSsh setPEFileContents setQueuefileContents setSgePorts setSgeSubmitHosts sgeEnvars sgebinCommand startHeadnodeSge startMasterSge stopHeadnodeSge stopMasterSge update updateHeadnodeEtcExports updateHeadnodeInSge updateHostname updateMasterEtcFstab updateMasterInSge
	internals: addPEQueuefileContents backupFile checkHeadnodeSge checkMasterSge createQueuefile deleteQueueJobs getEnvars getHeadnodeMasterInfo getPorts getQueuefileTemplate modifyQueue mountOnMaster qstatFailure qstatSummary queueName restartHeadnodeSge restartMasterSge setHeadnodeActQmaster setHeadnodeHostname setHeadnodeHostnamefile setHeadnodeMasterInfo setMasterActQmaster setMasterEtcHosts setMasterHostname setMasterHostnamefile setMasterMountPoints setMasterOpsSsh setPEFileContents setQueuefileContents setSgePorts setSgeSubmitHosts sgeEnvars sgebinCommand startHeadnodeSge startMasterSge stopHeadnodeSge stopMasterSge update updateHeadnodeEtcExports updateHeadnodeInSge updateMasterEtcFstab updateMasterInSge
	externals: captureStderr cell cluster conf db envars execdport getAdminKey getEc2PrivateFile getEc2PublicFile getFileContents getFileroot head json logDebug logError master masterid privatekey project publiccert qmasterport queue setDbh setKeypairfile ssh username workflow
Agua::Common::Balancer
	external_calls
		*Agua::Common::Balancer	*Agua::Common::SGE
		launchBalancer	getEnvars	
		launchBalancer	getEnvars	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::SGE
		setQueue	_addQueue	
		unsetQueue	_removeQueue	
		setPE	addPE	
		setPE	addPEToQueue	
		writeConfigfile	getPorts	
		setPE	getQueuefile	2	
		setQueue	getQueuefile	
		unsetQueue	getQueuefile	
		setQueue	queueExists	

==> userroles--Agua-StarCluster--Agua-Common-Ssh <==
Agua::Common::Ssh
	roles: 
	slots: keyname keypairfile
	methods: _disableSshPasswordLogin _enableSshPasswordLogin _setSsh getSshConfigfile setKeypairfile
	internals: getSshConfigfile
	externals: conf getAdminKey getFileContents keypairfile logCaller logDebug logError printToFile ssh username
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Ssh
		initialise	setKeypairfile	

==> userroles--Agua-StarCluster--Agua-Common-Util <==
Agua::Common::Util
	roles: 
	slots: 
	methods: _indexInArray addEnvars addHashes captureStderr collapsePath cowCase createDir createParentDir datetime fakeTermination fileTail getDirs getFileContents getFileDirs getFiles getLines hasharrayToHash incrementFile json_parser objectInArray parseHash printToFile setPermissions systemVariables unTaint
	internals: _indexInArray createParentDir systemVariables
	externals: conf foundDir foundFile jsonparser logCaller logCritical logDebug logError logNote logWarning project username workflow
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Util
		terminateCluster	captureStderr	2	
		launchCluster	fileTail	
		BUILD	unTaint	

    
</entry>
<entry [Wed 2012:10:31 23:24:02 EST] Agua::Workflow ALL CALLS TO Agua::Common::Cluster>
    
Agua::Workflow
	external_calls
		*Agua::Workflow	*Agua::Common::Cluster
		addCluster	_addCluster	
		_createConfigFile	_createPluginsDir	
		addCluster	_removeCluster	
		setStarClusterObject	clusterInputs	
		runOnCluster	clusterIsBusy	
		setClusterCompleted	clusterIsBusy	
		_createConfigFile	getAdminKey	
		createQueue	getAdminKey	
		deleteQueue	getAdminKey	
		_createConfigFile	getCluster	
		createQueue	getCluster	
		setStarClusterObject	getCluster	
		getStatus	getClusterByWorkflow	
		runOnCluster	getClusterStatus	
		setStarClusterObject	getClusterStatus	
		_createConfigFile	getConfigFile	2	
		clusterOutput	getConfigFile	
		createQueue	getConfigFile	2	
		deleteQueue	getConfigFile	2	
		getStatus	getConfigFile	
		startStarCluster	getConfigFile
        
</entry>
<entry [Wed 2012:10:31 23:23:20 EST] ALL CALLS TO Agua::Common::Cluster FROM Roles USED BY Agua::Workflow>

Agua::Workflow
	external_calls
		CALLER	CALLED
		addCluster	_addCluster	
		_createConfigFile	_createPluginsDir	
		addCluster	_removeCluster	
		setStarClusterObject	clusterInputs	
		runOnCluster	clusterIsBusy	
		setClusterCompleted	clusterIsBusy	
		_createConfigFile	getAdminKey	
		createQueue	getAdminKey	
		deleteQueue	getAdminKey	
		_createConfigFile	getCluster	
		createQueue	getCluster	
		setStarClusterObject	getCluster	
		getStatus	getClusterByWorkflow	
		runOnCluster	getClusterStatus	
		setStarClusterObject	getClusterStatus	
		_createConfigFile	getConfigFile	2	
		clusterOutput	getConfigFile	
		createQueue	getConfigFile	2	
		deleteQueue	getConfigFile	2	
		getStatus	getConfigFile	
		startStarCluster	getConfigFile	

    Agua::Common::Aws
        external_calls
            CALLER	CALLED
            _getAws	getAdminKey	
            _getAws	getAdminKey	
    Agua::Common::Balancer
        external_calls
            CALLER	CALLED
            stopBalancer	clusterInputs	
            markClustersForTermination	clusterIsBusy	
            getBalancerOutputdir	getAdminKey	
            balancerRunning	getClusterStatus	
            checkBalancers	getConfigFile	
            launchBalancer	getConfigFile	
            markClustersForTermination	getConfigFile	
            checkBalancers	runningClusters	
            stopBalancer	clusterInputs	
            markClustersForTermination	clusterIsBusy	
            getBalancerOutputdir	getAdminKey	
            balancerRunning	getClusterStatus	
            checkBalancers	getConfigFile	
            launchBalancer	getConfigFile	
            markClustersForTermination	getConfigFile	
            checkBalancers	runningClusters	
    Agua::Common::Base
        external_calls
            CALLER	CALLED
            getData	getClusterWorkflows	
            getData	getClusters	
            getData	getClusterWorkflows	
            getData	getClusters	
    Agua::Common::SGE
        external_calls
            CALLER	CALLED
            resetMaster	getAdminKey	
            resetMaster	getAdminKey	
    Agua::Common::Ssh
        external_calls
            CALLER	CALLED
            setKeypairfile	getAdminKey	
            setKeypairfile	getAdminKey	

</entry>
<entry [Wed 2012:10:31 23:20:07 EST] Agua::StarCluster ALL CALLS TO Agua::Common::Cluster >
    
Agua::StarCluster
	external_calls
		CALLER	CALLED
		start	getCluster	
		initialise	getConfigFile	
		setPE	setSlots	
		setQueue	setSlots	
		writeConfigfile	setSlots
Agua::Common::Balancer
	external_calls
		CALLER	CALLED
		getBalancerOutputdir	getAdminKey	
		balancerRunning	getClusterStatus	
		getBalancerOutputdir	getAdminKey	
		balancerRunning	getClusterStatus	
Agua::Common::Ssh
	external_calls
		CALLER	CALLED
		setKeypairfile	getAdminKey	
		setKeypairfile	getAdminKey	
        

</entry>
<entry [Wed 2012:10:31 23:19:29 EST] ALL CALLS TO Agua::Common::Cluster BY ROLES USED BY Agua::StarCluster>
    
Agua::StarCluster
	external_calls
		CALLER	CALLED
		start	getCluster	
		initialise	getConfigFile	
		setPE	setSlots	
		setQueue	setSlots	
		writeConfigfile	setSlots
        
    Agua::Common::Aws
        external_calls
            CALLER	CALLED
            _getAws	getAdminKey	
            _getAws	getAdminKey	
    Agua::Common::Balancer
        external_calls
            CALLER	CALLED
            stopBalancer	clusterInputs	
            markClustersForTermination	clusterIsBusy	
            getBalancerOutputdir	getAdminKey	
            balancerRunning	getClusterStatus	
            checkBalancers	getConfigFile	
            launchBalancer	getConfigFile	
            markClustersForTermination	getConfigFile	
            checkBalancers	runningClusters	
            stopBalancer	clusterInputs	
            markClustersForTermination	clusterIsBusy	
            getBalancerOutputdir	getAdminKey	
            balancerRunning	getClusterStatus	
            checkBalancers	getConfigFile	
            launchBalancer	getConfigFile	
            markClustersForTermination	getConfigFile	
            checkBalancers	runningClusters	
    Agua::Common::Base
        external_calls
            CALLER	CALLED
            getData	getClusterWorkflows	
            getData	getClusters	
            getData	getClusterWorkflows	
            getData	getClusters	
    Agua::Common::SGE
        external_calls
            CALLER	CALLED
            resetMaster	getAdminKey	
            resetMaster	getAdminKey	
    Agua::Common::Ssh
        external_calls
            CALLER	CALLED
            setKeypairfile	getAdminKey	
            setKeypairfile	getAdminKey	
        
</entry>
<entry [Wed 2012:10:31 19:55:33 EST] CREATED Agua::Uml AND GENERATED UML FOR Agua::Common::Cluster (Agua::Workflow VERSUS Agua::StarCluster)>

Agua::Common::Cluster
	roles: 
	slots: configfile instancetypeslots privatekey publiccert
	methods:
        _addCluster
        _addClusterWorkflow
        _createCellDir
        _createPluginsDir
        _isCluster
        _removeCellDir
        _removeCluster
        _removeClusterWorkflow
        clusterInputs
        clusterIsBusy
        clusterNodesInfo
        describeInstances
        getAdminKey
        getCellDir
        getCluster
        getClusterByWorkflow
        getClusterInstanceIds
        getClusterStatus
        getClusterVars
        getClusterWorkflows
        getClusters
        getConfigFile
        getDefaultCellDir
        getHeadnodeInternalIp
        getInstanceInfo
        getInternalIps
        getLocalInstanceInfo
        getMasterId
        getMasterInstanceInfo
        getMonitor
        getQmasterIps
        newCluster
        parseInstanceInfo
        removeCluster
        runningClusters
        saveClusterWorkflow
        setSlots
        updateClusterNodes
	internals: _addCluster _addClusterWorkflow _createCellDir _removeCellDir _removeCluster _removeClusterWorkflow clusterNodesInfo describeInstances getAdminKey getCellDir getCluster getClusterByWorkflow getClusterInstanceIds getConfigFile getDefaultCellDir getInstanceInfo getLocalInstanceInfo getMasterId parseInstanceInfo setSlots
	externals: _addQueue _addToTable _createConfigFile _removeFromTable _removeQueue adminkey checkSge cluster conf configfile db getAws getEc2PrivateFile getEc2PublicFile getQueuefile instancetypeslots json logCaller logDebug logError logSError logStatus monitor privatekey project publiccert queueName setDbh username workflow workflowpid


</entry>
<entry [Wed 2012:10:31 19:55:29 EST] GOOD FIRST PAGE - USES DROPDOWN TITLES INSTEAD OF TABS>

http://www.playonlinux.com/en/
    
</entry>
<entry [Sun 2012:10:28 00:44:37 EST] PERL UML SEQUENCE DIAGRAMS>

http://www.perl.com/pub/2006/08/03/sequence-diagrams.html


1. INSTALL libgd:

sudo apt-get -y install libgd2-xpm-dev build-essential
    OK
    
TO AVOID THIS ERROR WHEN INSTALLING GD (BELOW):

! Configure failed for GD-2.46. See /root/.cpanm/build.log for details.
! Bailing out the installation for UML-Sequence-0.08. Retry with --prompt or --force.

em /root/.cpanm/build.log 
    **UNRECOVERABLE ERROR**
    Could not find gdlib-config in the search path. Please install libgd 2.0.28 or higher


2. INSTALL GD

cpanm install GD

    Fetching http://www.cpan.org/authors/id/L/LD/LDS/GD-2.46.tar.gz ... OK
    Configuring GD-2.46 ... N/A
    OK

    
3. DOWNLOAD UML::Sequence

cd /mnt/syoung/software/perl/UML-Sequence
wget http://search.cpan.org/CPAN/authors/id/P/PH/PHILCROW/UML-Sequence-0.08.tar.gz


4. INSTALL UML::Sequence
 
tar xvfz UML-Sequence*.tar.gz
cd /mnt/syoung/software/perl/UML-Sequence/UML-Sequence-0.08
perl Makefile.PL
make
make install
    OK
    ...
    Installing /usr/local/bin/genericseq.pl
    Installing /usr/local/bin/seq2svg.pl
    Installing /usr/local/bin/seq2rast.pl


#### NB: CPANM DID NOT INSTALL!!
### cpanm install UML::Sequence
###    OK


5. CREATE METHODS FILE


cd /mnt/syoung/software/perl/UML-Sequence
rm -fr methods.txt

grep method /agua/lib/Agua/Workflow.pm \
| perl -pe 's/method\s*([a-zA-Z0-9]*)[\s]*.+$/$1/g' \
>> /mnt/syoung/software/perl/UML-Sequence/methods.txt

grep method /agua/lib/Agua/StarCluster.pm \
| perl -pe 's/method\s*([a-zA-Z0-9]*)[\s]*.+$/$1/g' \
>> /mnt/syoung/software/perl/UML-Sequence/methods.txt

head /mnt/syoung/software/perl/UML-Sequence/methods.txt

    BUILD
    initialise
    setUserLogfile
    executeWorkflow
    startStarCluster
    setStarClusterObject
    prepareStages
    setFileDirs
    runStages
    createQueue
    

6. RUN UML::Sequence

# EXAMPLE:
# genericseq.pl UML::Sequence::PerlSeq methods_file perl_program [args...] > sequence.xml


mkdir -p /agua/private/bin/scripts/uml
cd /agua/private/bin/scripts/uml


# EXAMPLE:
# genericseq.pl UML::Sequence::PerlSeq methods_file perl_program [args...] > sequence.xml


echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus","submit":1,"cluster":"admin-microcluster","SHOWLOG":5}' | ./workflow.pl genericseq.pl UML::Sequence::PerlSeq \
/agua/private/bin/scripts/uml/methods.txt


???? NO XML OUTPUT ????


genericseq.pl UML::Sequence::PerlSeq \
/agua/private/bin/scripts/uml/methods.txt \
./workflow.cgi '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-microcluster","SHOWLOG":5}' 



> sequence.xml




7. GENERATE SVG

seq2svg.pl sequence.xml > sequence.svg
    
    
</entry>
<entry [Sat 2012:10:27 23:55:09 EST] UML SEQUENCE DIAGRAMS (A.K.A. EVENT DIAGRAMS, EVENT SCENARIOS OR TIMING DIAGRAMS)>
   
1. WHAT ARE UML SEQUENCE DIAGRAMS?

http://en.wikipedia.org/wiki/Sequence_diagram

Sequence diagram
From Wikipedia, the free encyclopedia

A sequence diagram in a Unified Modeling Language (UML) is a kind of interaction diagram that shows how processes operate with one another and in what order. It is a construct of a Message Sequence Chart.

A sequence diagram shows object interactions arranged in time sequence. It depicts the objects and classes involved in the scenario and the sequence of messages exchanged between the objects needed to carry out the functionality of the scenario.

Sequence diagrams typically (but not always), are associated with use case realizations in the Logical View of the system under development.

Sequence diagrams are sometimes called event diagrams, event scenarios, and timing diagrams. 
    

</entry>
<entry [Sat 2012:10:06 03:32:54 EST] FIXED PROBLEM '"my" variable $self masks earlier declaration in same scope at /agua/cgi-bin/lib/Agua/Common/Base.pm line 227.'>
    
    
PROBLEM

LOAD/RUN workflow.cgi GIVES THIS ERROR

"my" variable $self masks earlier declaration in same scope at /agua/cgi-bin/lib/Agua/Common/Base.pm line 227.


DIAGNOSIS

REMNANT LINE FROM SWAP dbobject WITH db

   my $self->db()        =     $self->db();

SOLUTION

REMOVE LINE

    
</entry>
<entry [Sat 2012:10:06 00:42:05 EST] FIXED PROBLEM 'Are you sure you want to continue connecting' ON FIRST 'git fetch' ON MASTER>

PROBLEM

FIRST 'git fetch' ON MASTER, E.G., WHEN RUNNING UPGRADE FAILS WITH ERROR

    2012-10-06 02:00:21    [DEBUG]   	Agua::Ops::runCommand	206	command: cd /agua;  git fetch git@github.com:syoung/agua.git 
    The authenticity of host 'github.com (207.97.227.239)' can't be established.
    RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
    Are you sure you want to continue connecting (yes/no)? n
    Please type 'yes' or 'no': 


DIAGNOSIS

GITHUB SERVER'S HOSTNAME IS NOT IN /root/.ssh/authorized_hosts FILE ON MASTER


SOLUTION

ADD GITHUB SERVER'S HOSTNAME TO /root/.ssh/authorized_hosts

ssh -T git@github.com -o StrictHostKeyChecking=no 

    Warning: Permanently added 'github.com,207.97.227.239' (RSA) to the list of known hosts.
    Permission denied (publickey).
    
</entry>
<entry [Mon 2012:10:01 22:33:33 EST] FIXED PROBLEM 'getting "special device /dev/sdh does not exist" on mount of EBS volume'>

LOOK FOR /dev/xvdh INSTEAD OF  /dev/sdh

    
</entry>
<entry [Sun 2012:09:30 03:40:39 EST] FIXED PROBLEM WITH updateHostname.pl STARTUP SCRIPT ON ERIDANUS-0.8.0-alpha.1>

Agua::Installer::openLogfile    Opening logfile: /agua/bin/scripts/../../createcert.log
Agua::Installer::openLogfile    Writing to logfile: /agua/bin/scripts/../../createcert.log
Sun Sep 30 07:07:21 UTC 2012    flagfile found. Quitting
 * Stopping CPU interrupts balancing daemon^[[74G[ OK ]
updateHostname.pl    Started: Sun Sep 30 07:07:35 UTC 2012
updateHostname.pl    adminuser: admin
{"error":"Could not set hostname (ip-10-122-170-16.ec2.internal), got result: ","subroutine":"Agua::Common::SGE::setHeadnodeHostname","linenumber":"1475","filename":"/agua/bin/scripts/../../lib/Agua/Common/SGE.pm","timestamp":"2012-09-30 07:08:15"}
Can't find label EXITLABEL at /agua/bin/scripts/../../lib/Agua/Common/Logger.pm line 381.
 ... waiting .. * Restarting web server apache2       ^[[80G ^M^[[74G[ OK ]
 * Stopping System V runlevel compatibility^[[74G[ OK ]

    
</entry>
<entry [Sun 2012:09:30 00:59:45 EST] NFS MOUNT PROBLEM ON ERIDANUS-0.8.0-alpha.1>

PROBLEM

/data AND /nethome DON'T MOUNT DUE TO BAD /etc/fstab ENTRIES WITH TRAILING SLASH ON
DEVICE NAME.



DIAGNOSIS

REMOVED FROM FSTAB AND REBOOTED BUT fdisk -l SHOWS PROBLEM:

/dev/xvdi doesn't contain a valid partition table

THEN NOTICED MISMATCH/CONFLICT BETWEEN /dev/xvdi AND /dev/sdi: 

cat /etc/fstab

/	 ext4	defaults	0 0
/dev/xvdh	/data		ext3	defaults,nobootwait	0	0
/dev/xvdi   	/nethome	ext3    defaults,nobootwait	0	0
/dev/sdh	/data		nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
/dev/sdi	/nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0

CHANGED TO THIS:


/	 ext4	defaults	0 0
/dev/xvdh	/data		ext3	defaults,nobootwait	0	0
/dev/xvdi   	/nethome	ext3    defaults,nobootwait	0	0
/dev/xvdh	/data		nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
/dev/xvdi	/nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0

BUT DIDN'T HELP


TRIED TO FIX WITH fsck

fsck -fy /dev/xvdh

... BUT STILL DON'T MOUNT ON REBOOT.


CHECKED LOGS:

    lxcmount stop/pre-start, process 185
    rpcbind: Cannot open '/run/rpcbind/rpcbind.xdr' file for reading, errno 2 (No such file or directory)^M
    rpcbind: Cannot open '/run/rpcbind/portmap.xdr' file for reading, errno 2 (No such file or directory)^M
    fsck from util-linux 2.19.1
    cloudimg-rootfs: clean, 195033/655360 files, 1136718/2621440 blocks
    cloud-init start-local running: Sun, 30 Sep 2012 05:47:49 +0000. up 2.37 seconds
    no instance data found in start-local
    ci-info: lo    : 1 127.0.0.1       255.0.0.0
    ci-info: eth0  : 1 10.122.170.16   255.255.254.0   12:31:38:0b:c9:e2
    ci-info: route-0: 0.0.0.0         10.122.170.1    0.0.0.0         eth0   UG
    ci-info: route-1: 10.122.170.0    0.0.0.0         255.255.254.0   eth0   U
    cloud-init start running: Sun, 30 Sep 2012 05:47:50 +0000. up 2.82 seconds
    found data source: DataSourceEc2
    mountall: Event failed
     * Starting NSM status monitor^[[74G[ OK ]
     * Stopping Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
     * Starting Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
    mount.nfs: remote share not in 'host:dir' format
     * Stopping Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
    mount.nfs: remote share not in 'host:dir' format
     * Starting Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
     * Stopping Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
     * Starting Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
     * Stopping Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
    mountall: mount /data [568] terminated with status 32
    mountall: mount /nethome [583] terminated with status 32
    mount.nfs: remote share not in 'host:dir' format
     * Starting Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
     * Stopping Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
    mountall: mount /data [594] terminated with status 32
     * Starting Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
     * Stopping Block the mounting event for NFS filesytems until statd is running^[[74G[ OK ]
    mount.nfs: remote share not in 'host:dir' format
    mountall: mount /nethome [599] terminated with status 32
     * Starting AppArmor profiles       ^[[80G ^M^[[74G[ OK ]
     * Stopping Handle applying cloud-config^[[74G[ OK ]
     * Stopping Failsafe Boot Delay^[[74G[ OK ]
     * Stopping System V initialisation compatibility^[[74G[ OK ]
     * Starting System V runlevel compatibility^[[74G[ OK ]
     * Starting CPU interrupts balancing daemon^[[74G[ OK ]
     * Starting deferred execution scheduler^[[74G[ OK ]
     * Starting regular background program processing daemon^[[74G[ OK ]
     * Loading cpufreq kernel modules...       ^[[80G ^M^[[74G[^[[31mfail^[[39;49m]
     * disabled, governor not available...       ^[[80G  * CPUFreq Utilities: Setting ondemand CPUFreq governor...       ^[[80G \
    ^M^[[74G[ OK ]
    


USED BASH SCRIPT TO CHECK LOGS:

    checklogs () { perl -e 'my @files = </var/log/*>; chdir("/var/log"); foreach my $file ( @files ) { next if -B $file; print "$file\n";  print `grep -n '$1' $file`; } '; }

    alias pg='ps aux | grep '
    alias ll='ls -al'
    alias plug='cd /agua/html/plugins'
    alias scrip='cd /agua/bin/scripts'
    alias bin='cd /agua/bin'
    alias conf='cd /agua/conf'
    alias t='cd /agua/t'
    alias html='cd /var/www/html/agua'
    alias cgi='cd /var/www/cgi-bin/agua'
    alias lig='cd /agua/lib/Agua'
    alias lip='cd /agua/lib/Agua/Common/Package'
    alias lic='cd /agua/lib/Agua/Common'
    alias lio='cd /agua/lib/Agua/Ops'
    alias lib='cd /agua/lib'
    alias em='emacs -nw'
    alias me='emacs -nw'
    alias gobash='emacs -nw ~/.bash_profile'
    alias sobash='source ~/.bash_profile'
    alias er='tail -f -n 100 /var/log/apache2/error.log'
    alias ac='tail -f -n 100 /var/log/apache2/access.log'
    alias myer='tail -100 /var/log/mysqld.log'
    alias cl='clear; ls; pwd'


TRIED WITH /dev/sdh IN /etc/fstab

    /	 ext4	defaults	0 0
    /dev/xvdh	/data		ext3	defaults,nobootwait	0	0
    /dev/xvdi   	/nethome	ext3    defaults,nobootwait	0	0
    #/dev/xvdh	/data		nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
    #/dev/xvdi	/nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0


TRIED REBOOT WITH /dev/xvd* AFTER REMOVING nfs ENTRIES:
    
    /	 ext4	defaults	0 0
    /dev/xvdh	/data		ext3	defaults,nobootwait	0	0
    /dev/xvdi   	/nethome	ext3    defaults,nobootwait	0	0
    #/dev/xvdh	/data		nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
    #/dev/xvdi	/nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0

... AND IT WORKS!!! 


ll /nethome

drwxrwx---  3 admin www-data  4096 2012-09-25 04:49 admin
drwxrwxrwx  3 root  root      4096 2012-09-29 03:51 jbrowse
drwx------  2 root  root     16384 2012-09-28 14:00 lost+found
drwxr-xr-x  5 root  root      4096 2012-09-28 14:51 mysql

    
SO IT'S AN NFS PROBLEM. DID REBOOT AFTER ADDING BACK ONE NFS LINE:

    #/dev/xvdh	/data		nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0

STILL FAILED.


FOUND THAT portmap, rpcbind AND nfs PROCESSES ARE ***NOT*** RUNNING

SYSLOG HAS THIS ERROR:

tail -f /var/log/syslog
    Sep 30 18:25:42 ip-10-88-214-108 rpcbind: Cannot open '/run/rpcbind/rpcbind.xdr' file for reading, errno 2 (No such file or directory)
    Sep 30 18:25:42 ip-10-88-214-108 rpcbind: Cannot open '/run/rpcbind/portmap.xdr' file for reading, errno 2 (No such file or directory)
    Sep 30 18:25:42 ip-10-88-214-108 statd-pre-start: started
    Sep 30 18:25:42 ip-10-88-214-108 sm-notify[2501]: Version 1.2.4 starting
    Sep 30 18:25:42 ip-10-88-214-108 sm-notify[2501]: Already notifying clients; Exiting!
    Sep 30 18:25:42 ip-10-88-214-108 rpc.statd[2512]: Version 1.2.4 starting
    Sep 30 18:25:42 ip-10-88-214-108 rpc.statd[2512]: Flags: TI-RPC 
    Sep 30 18:26:37 ip-10-88-214-108 rpc.statd[2512]: Caught signal 15, un-registering and exiting
    Sep 30 18:26:37 ip-10-88-214-108 rpcbind: rpcbind terminating on signal. Restart with "rpcbind -w"
    

FOUND LINK SAYING TO STOP PORTMAP TO CREATE MISSING FILES:

https://answers.launchpad.net/ubuntu/+source/rpcbind/+question/185320

stop portmap
    portmap stop/waiting

ll /run/rpcbind/*
    -rw------- 1 root root 124 2012-09-30 18:26 /run/rpcbind/portmap.xdr
    -rw------- 1 root root 660 2012-09-30 18:26 /run/rpcbind/rpcbind.xdr

    
NOW PORTMAP STARTS OKAY!!!

/etc/init.d/portmap restart
   portmap start/running, process 2524


tail -f /var/log/syslog
    Sep 30 18:30:33 ip-10-88-214-108 statd-pre-start: started
    Sep 30 18:30:33 ip-10-88-214-108 sm-notify[2525]: Version 1.2.4 starting
    Sep 30 18:30:33 ip-10-88-214-108 sm-notify[2525]: Already notifying clients; Exiting!
    Sep 30 18:30:33 ip-10-88-214-108 rpc.statd[2536]: Version 1.2.4 starting
    Sep 30 18:30:33 ip-10-88-214-108 rpc.statd[2536]: Flags: TI-RPC 
    
    


EXPORT THE SHARES (EVERY TIME /etc/exports IS CHANGED)
sudo exportfs -ra

RESTART PORTMAP AND NFS
/etc/init.d/portmap restart
/etc/init.d/nfs-kernel-server restart

VERIFY EXPORTS
exportfs
    OK

    /export/data  	ec2-50-19-24-94.compute-1.amazonaws.com

nmap -P0 98.254.40.187

UNINSTALL portmap

apt-get install rpcbind


    
</entry>
<entry [Fri 2012:09:28 00:05:43 EST] FORCE UNMOUNT EC2 VOLUME>

1. USE fuser -mv _MOUNTPOINT_ 

You can add -v to the fuser command line switches – that will cause it to nicely print all the processes holding the locks. This way you can save yourself the effort of grepping through the process list.

fuser -mv /dev/xvdh
                     USER        PID ACCESS COMMAND
/dev/xvdh:           root     kernel mount /dev
                     root          1 F.... init
                     root        233 F.... upstart-socket-
                     root        255 F.... upstart-udev-br
                    ...
                     www-data   1081 F.... apache2
                     root       1141 F.... sshd
                     root       1162 F.... sshd
                     root       3408 f.... pager

***** NOTE ABOUT FUSER *****:
Unfortunately, ‘fuser’ does not show everything that can produce a ‘device is busy’ message. If you are running NFS and/or automounter on RHEL, you need to shut these down manually first:

cd /etc/init.d
sh autofs stop
sh nfs stop

Don’t know why these are not reported by fuser.


Jeremy (5 comments.) says:
October 29, 2011 at 5:15 am

In my case, I had an NFS mount blocking the umount of a filesystem, where fuser -m and lsof did not show what was blocking it.

I suspect this is because I was using nfs-kernel-server, which runs in kernel-space and thus cannot show up as a PID using the filesystem.
                            :
****************************


2. DO LAZY UMOUNT

umount -lfr /mnt/sambamountofboxthatsshutdown

l for lazyness
f for forced unmount for unreachable networked storage
r for just in case unmounting fails remount as readonly

FOR EXAMPLE:

umount -l /dev/sdwhatever

This does a lazy umount which immediately detaches the drive from the filesystem, and then cleans up the mess afterwards. This is especially handy if it’s a networked file system (NFS etc) and the network has gone down.



3. USE lsof +D

lsof |grep directorio_montado luego hacemos el grep con el directorio, sacamos el proceso y su le damos patatu 

jecutar
lsof +D /bin
va más rápido que
lsof | grep /bin
ya que va “al grano”, a ese directo


4. FOR FURTHER DIAGNOSTICS, USE pgrep TO FILTER RUNNING PROCESSES

Use the pgrep command to filter running processes.

For example, to look at all of root’s processes, you can use:

pgrep -l -u root

-l tells pgrep to also list the process name instead of just the PID.






    
</entry>
<entry [Thu 2012:09:27 04:44:56 EST] FIXED PROBLEM: Invalid value '/dev/sdi' for unixDevice. Attachment point /dev/sdi is already in use>


PROBLEM

WHEN RUNNING Init::mountNethome, CAN'T ATTACH VOLUME:

2012-09-27 08:43:32    [DEBUG]   	Agua::Ops::runCommand	206	command: ec2-attach-volume vol-ff269f85 -i i-7ba84006 -d /dev/sdi 
2012-09-27 08:43:44    [DEBUG]   	Agua::Ops::runCommand	246	output: 
2012-09-27 08:43:44    [DEBUG]   	Agua::Ops::runCommand	247	error: Client.InvalidParameterValue: Invalid value '/dev/sdi' for unixDevice. Attachment point /dev/sdi is already in use

ec2-attach-volume vol-ff269f85 -i i-7ba84006 -d /dev/sdi 


DIAGNOSIS

PROBLEM WITH INSTANCE



SOLUTION

STOP/START INSTANCE (I.E., NOT REBOOT)


</entry>
<entry [Mon 2012:09:24 03:43:34 EST] REST AND JSON DEFINITION>

http://www.kendoui.com/blogs/teamblog/posts/12-05-11/hello_services_webapi_rest_json_and_ajax.aspx


REST stands for Representational State Transfer. It’s a pattern for developing services which lets the HTTP requests describe what sort of action should be done, what format the data should be in and allows the server to indicate success or failure using HTTP codes. Using this strategy, it is easy to construct very predictable URL’s for web services so that consuming them becomes much easier. There is much more to REST than that short explanation, but this tutorial will try to stay as RESTful as possible.

JSON is an acronym that stands for JavaScript Object Notation. This is a way of serializing data and objects into a very simple and easy to understand string representation. This format is easily consumable not only by JavaScript, but is also much easier for humans to read and debug.
    
</entry>
<entry [Thu 2012:09:20 03:29:07 EST] Agua::Monitor::SGE::submitJob LATER POSSIBLE REFACTOR>

	#### SET QSUB LINE
	$command .= "$qsub $batch -q $queue -V $walltime $rerunnable $scriptfile 2>&1";
	$self->logDebug("command", $command);

	#### SUBMIT
	my $output = `$command`;
	wait;
	$self->logDebug("output", $output);
	if ( not $output or $output =~ /error: commlib error/ ) {
		$self->logError("Can't connect to qmaster. Command output: $output") and return;
	}
	
	##### LATER: POSSIBLY REPLACE WITH OPEN PIPE METHOD (FROM CPAN MODULE Schedule::SGE)
	#open(QSUB, "|$pipe > /tmp/$$.out 2>&1") || die "Can't open the pipe to submit jobs to";
	#close QSUB;
	#return 0 unless (-e "/tmp/$$.out"); 
	#open (IN, "/tmp/$$.out") || die "Can't open /tmp/$$.out";
	#my $line=< IN>;
	#close IN;


    
</entry>
<entry [Mon 2012:09:17 11:25:04 EST] AUTOHIDE WITH dojo/fx/Toggler>

require(["dojo/fx/Toggler", "dojo/dom", "dojo/on", "dojo/domReady!"],
function(Toggler, dom, on){
  var toggler = new Toggler({
    node: "basicNode"
  });
  on(dom.byId("hideButton"), "click", function(e){
    toggler.hide();
  });
  on(dom.byId("showButton"), "click", function(e){
    toggler.show();
  });
});

<!--

<button type="button" id="hideButton">Hide the node! </button>
<button type="button" id="showButton">Show the node! </button>
<div id="basicNode" style="width: 200px; background-color: red;">
  <b>This is a container of random content to toggle!</b>
</div>

-->
    
</entry>
<entry [Mon 2012:09:17 10:24:24 EST] WHY DOH.ROBOT IS BETTER THAN SELENIUM>

http://livedocs.dojotoolkit.org/util/dohrobot

DOH Robot

doh/robot provides an API that enables testers to automate their UI tests using real, cross-platform, system-level input events. This document describes the value of doh/robot for unit and accessibility testing, and how to get started using it.


The challenge of Web UI testing

Web UI testing frameworks like Selenium and Windmill already contain browser automation elements suitable for many different types of unit and acceptance tests of application code. But each of these frameworks has an underlying catch: the input events they create are synthetic. On one hand, synthetic events are great because synthetic events don't use the native input queue; you can run your tests in parallel across multiple browsers and windows all on one machine without a fight for the mouse and keyboard.

But the problem with synthetic events is that browsers don't trust synthetic events enough to let them execute their default action. For example, if you create a synthetic Tab keypress (expecting the browser to shift focus to the next element in the tab order), the focus won't actually move, because the browser doesn't trust the synthetic keypress enough to allow it to execute its default action. In a worse case, if you have a widget with onmouseover and onmousedown events, you would expect that the user would not be able to trigger the onmousedown without first triggering the onmouseover. But with synthetic events, this sort of common sense fails; you can easily send a click to an element without registering mouse movement over it, never mind the onmouseout from the previous element and the hundreds of onmousemoves a real user would generate in between. The result is that existing Web UI frameworks fail to support the testing of common requirements of Web applications like keyboard accessibility, and can be frustrating to deal with when you have to manually dispatch synthetic mouse events that would fire automatically for a human tester.


What doh/robot can do for you

We designed the doh/robot to enhance the DOH runner's ability to drive unit tests. Like other test frameworks, doh/robot provides testers with an API that enables them to simulate user interaction. However, we took a different approach to dispatching events: instead of using synthetic events, we used the cross-browser and cross-platform Java applet technology to place real events on the native event queue, as if a real person performed the action. This means that when you use doh/robot to execute your unit tests, browsers will trust the events doh/robot creates from your commands and will handle any and all contingent events for you. So when you tell doh/robot to send a Tab keypress, you can fully expect the Tab to move focus to the next element in the Tab order, as if a real user pressed Tab. And when you tell doh/robot to click an element, you can fully expect to get the onmouseover before the onmousedown, as well as all of those hundreds of onmousemoves a real user would generate in between. When you use the DOH test runner in conjunction with doh/robot, you can easily automate and report the results of numerous accessibility and UI unit tests that would otherwise require manual, visual inspection by a real person.

    
</entry>
<entry [Sat 2012:09:15 03:41:39 EST] FIXED FILE CACHES ERROR 'invalid character encountered while parsing JSON string'>

SUMMARY: PERL OPERATOR '-B' DOES NOT DETECT ALL *.vld BINARY FILES, SO USE REGEX PATTERN MATCH '/\.vld$/' AS TEMPORARY FIX

PROBLEM

reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getTable","table":"fileCaches","SHOWLOG":5}' | ./workflow.pl

    2012-09-15 07:39:26    [DEBUG]   	Agua::Common::File::recursiveFileCaches	213	SETTING FILECACHE->Project1/Workflow1/downloads.ok3
    invalid character encountered while parsing JSON string, at character offset 6138 (before "\x{1}\x{c3}\x{1b}e\x{6}...") at (eval 675) line 161.

    
</entry>
<entry [Fri 2012:09:14 01:45:48 EST] FIXED Net::OpenSSH ERROR 'stderr: child process STDIN is not a real system file handle'>

SUMMARY: REPLACED Net::OpenSSH WITH Agua::Ssh

PROBLEM

GET APACHE ERROR:

er

6.951858, referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html
[Fri Sep 14 05:44:46 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: child process STDIN is not a re
al system file handle at /agua/cgi-bin/lib/Agua/Common/Ssh.pm line 64., referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html
[Fri Sep 14 05:44:46 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: child process STDIN is not a real system file handle at /agua/cgi-bin/lib/Agua/Common/Ssh.pm line 64., referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html
[Fri Sep 14 05:44:46 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: \t(in cleanup) child process STDIN is not a real system file handle at /usr/lib/perl5/site_perl/5.14.2/Net/OpenSSH.pm line 607., referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html
[Fri Sep 14 05:44:46 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: \tNet::OpenSSH::_check_is_system_fh('STDIN', undef) called at /usr/lib/perl5/site_perl/5.14.2/Net/OpenSSH.pm line 1312, referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html
[Fri Sep 14 05:44:46 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: \tNet::OpenSSH::open_ex('Net::OpenSSH=HASH(0x73c53d8)', 'HASH(0x737a620)') called at /usr/lib/perl5/site_perl/5.14.2/Net/OpenSSH.pm line 1788, referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html
[Fri Sep 14 05:44:46 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: \tNet::OpenSSH::capture('Net::OpenSSH=HASH(0x73c53d8)', 'HASH(0x73b57b8)') called at /usr/lib/perl5/site_perl/5.14.2/Net/OpenSSH.pm line 953, referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html
[Fri Sep 14 05:44:46 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: \tNet::OpenSSH::_master_ctl('Net::OpenSSH=HASH(0x73c53d8)', 'exit') called at /usr/lib/perl5/site_perl/5.14.2/Net/OpenSSH.pm line 2111, referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html
[Fri Sep 14 05:44:46 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: \tNet::OpenSSH::DESTROY('Net::OpenSSH=HASH(0x73c53d8)') called at /usr/lib/perl5/site_perl/5.14.2/Carp.pm line 100, referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html
[Fri Sep 14 05:44:46 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: \teval {...} called at /usr/lib/perl5/site_perl/5.14.2/Carp.pm line 100, referer: http://ec2-107-21-164-185.compute-1.amazonaws.com/agua/agua.html



    
</entry>
<entry [Fri 2012:09:14 00:38:57 EST] SCALING UP IN EC2>

http://en.wikipedia.org/wiki/Scale_out#Scale_horizontally_vs._vertically

scaling up is adding CPU/RAM/disk
scaling out adds additional nodes


The advantage with scaling out is that with an appropriate topology you can add capacity without disrupting the running service. This is usually accomplished by having intelligence either in the network layer (a load balancer or cluster manager) which can distribute work between your nodes, or in the application to do a similar job.

Scaling up by comparison in the majority of cases (certainly on EC2) involves shutting down the node (instance) to change the node type, causing downtime for your service unless you've already got multiple instances ready to take over.

Amazon is geared towards scaling out and has instances such as the elastic load balancer which can distribute traffic between your nodes and functionality to automatically provision new instances when load gets to a threshold, you could certainly use this functionality to increase the capacity of your website.

Of course, this all depends on how available you need your service to be, how much performance you want, how much money you've got to spend and if your application can be made to scale over multiple nodes. Usually when you scale out (web applications) the first thing you do is implement some kind of shared storage between the nodes (networked storage or a cluster file system) and either database synchronization or a shared database.
    
</entry>
<entry [Thu 2012:09:13 23:21:06 EST] FIXED StarCluster BUG 'More values than Type Constraints'>

SUMMARY:

PASSED stop = 3 IN ARGS TO StarCluster.pm BUT IT HAS A METHOD CALLED stop


2012-09-14 03:17:23    [DEBUG]   	Agua::StarCluster::BUILD	183	ADDING key instancetype: t1.micro
2012-09-14 03:17:23    [DEBUG]   	Agua::StarCluster::BUILD	183	ADDING key stop: 3
Validation failed for 'Tuple[Tuple[Object],Dict[]]' with value "[ [ Agua::StarCluster=HASH(0x6e8bc78), 3 ], {  } ], Internal Validation Error is: \n [+] Validation failed for 'Tuple[Object]' with value "[ Agua::StarCluster{ OLDPRINTLOG: 2, OLDSHOWLOG: 2, PRINTLOG: 4, SHOWLOG: 4, accesskeyid: "AKIAIKZHIY7T75JIF34A", amazonuserid: 728213020069, ... }, 3 ]"\n  [+] More values than Type Constraints!" at /usr/lib/perl5/site_perl/5.14.2/MooseX/Method/Signatures/Meta/Method.pm line 435.

    
</entry>
<entry [Tue 2012:09:11 04:09:59 EST] ORGANISED bioapps REPOSITORIES>

SEE agua.blueprint.xls
[Wed 2012:06:27 01:09:53 EST] BIOAPPS STAGING>
 
1. LISTED EXISTING bioapps REPOS

cd /repos
find . -type d -name bioapps* | grep -v aguatest | grep -v biorepo

    ./public/agua/bioappsdev
    ./public/agua/bioapps
    ./public/syoung/bioapps-check
    ./public/syoung/bioapps
    ./private/agua/bioapps-agua
    ./private/syoung/bioappsdev.bitbucket
    ./private/syoung/bioappsdev.github
    ./private/syoung/bioappsdev
    ./private/syoung/bioapps
    ./private/syoung/bioappsdev.old

2. BITBUCKET CONTAINS LATEST VERSION (WITH t DIR AND 'aquarius-8' CHANGES)

STAGING IS AS FOLLOWS:

1: /repos/private/syoung/bioappsdev
2: /repos/private/syoung/bioapps
3: /repos/public/agua/bioappsdev
4: /repos/public/agua/bioapps


3. REMOTES ARE AS FOLLOWS:

1: /repos/private/syoung/bioappsdev

git remote add bit git@bitbucket.org:stuartpyoung/bioappsdev.git
git remote add github git@github.com:syoung/bioappsdev
git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/bioappsdev

2: /repos/private/syoung/bioapps

git remote add bit git@bitbucket.org:stuartpyoung/bioapps.git
git remote add github git@github.com:syoung/bioapps
git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/bioapps

3: /repos/public/agua/bioappsdev

git remote add bit git@bitbucket.org:aguadev/bioappsdev.git
git remote add github git@github.com:agua/bioappsdev
git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/bioappsdev

4: /repos/public/agua/bioappsdev

git remote add bit git@bitbucket.org:aguadev/bioapps.git
git remote add github git@github.com:agua/bioapps
git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/bioapps


    
</entry>
<entry [Mon 2012:09:10 16:41:52 EST] FIXED: DBOBJECT GOES AWAY AFTER LONG CLUSTER STARTUP>

PROBLEM:

WHEN RUN EXECUTEWORKFLOW

reset; echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-microcluster","SHOWLOG":5}' | ./workflow.pl

MYSQL GOES AWAY BEFORE CAN VERIFY SGE IS STARTED:

2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	87	command: export SGE_QMASTER_PORT=36351; export SGE_EXECD_PORT=36352; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-microcluster.config bal admin-microcluster -m 1 -n 1 -i 30 -w 100 -s 30 --kill-master 
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	92	outputdir: /nethome/admin/agua/.cluster
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::getBalancerOutputfile	383	cluster: admin-microcluster
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::getBalancerOutputfile	384	outputdir: /nethome/admin/agua/.cluster
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	99	configdir: /nethome/admin/.starcluster
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	102	pid: 2388
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	126	SELECT 1 FROM clusterstatus
WHERE username='admin'
AND cluster='admin-microcluster'
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	102	pid: 0
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	110	Running child
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	111	$$ pid: 2388
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	112	Doing exec(cd /nethome/admin/.starcluster/plugins; export SGE_QMASTER_PORT=36351; export SGE_EXECD_PORT=36352; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-microcluster.config bal admin-microcluster -m 1 -n 1 -i 30 -w 100 -s 30 --kill-master )
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	115	Redirecting STDOUT and STDERR to outputfile: /nethome/admin/agua/.cluster/admin-microcluster-loadbalancer.out
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	128	clusterstatus entry exists: 1
2012-09-09 17:59:10    [DEBUG]   	Agua::Common::Balancer::launchBalancer	141	UPDATE clusterstatus
SET pid='2388',
polled=NOW(),
status='running'
WHERE username='admin'
AND cluster='admin-microcluster'
2012-09-09 17:59:10        [DEBUG]   	Agua::Workflow::executeWorkflow	301	started: 1
2012-09-09 17:59:10        [DEBUG]   	Agua::Common::SGE::checkSge	628	Checking SGE and will restart if stopped.
2012-09-09 17:59:10        [DEBUG]   	Agua::Common::SGE::checkSge	629	username: admin
2012-09-09 17:59:10        [DEBUG]   	Agua::Common::SGE::checkSge	630	cluster: admin-microcluster
2012-09-09 17:59:10        [DEBUG]   	Agua::Common::SGE::setSgePorts	935	Common::SGE::setSgePorts(username, cluster)
2012-09-09 17:59:10        [DEBUG]   	Agua::Common::SGE::getPorts	856	StarCluster::getPorts()
2012-09-09 17:59:10        [DEBUG]   	Agua::Common::SGE::getPorts	875	SELECT qmasterport
FROM clustervars
WHERE username = 'admin'
AND cluster = 'admin-microcluster'
DBD::mysql::st execute failed: MySQL server has gone away at /agua/cgi-bin/lib/Agua/DBase/MySQL.pm line 279.
DBD::mysql::st execute failed: MySQL server has gone away at /agua/cgi-bin/lib/Agua/DBase/MySQL.pm line 279.


SOLUTION

ADDED self->setDbh() TO StarCluster.pm AT END OF WAIT FOR CLUSTER TO START

    
</entry>
<entry [Mon 2012:09:10 15:53:03 EST] FIXED: postfix FATAL ON RESTART NETWORKING>

PROBLEM

WHEN RESTART NETWORKING WITH

sh -c "ifdown eth0 && ifup eth0"

GET THIS ERROR

postconf: fatal: open /etc/postfix/main.cf: No such file or directory



SOLUTION

1. RECONFIGURE POSTFIX

sudo dpkg-reconfigure postfix
    /sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.
    
    /sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.
        
    Postfix was not set up.  Start with 
      cp /usr/share/postfix/main.cf.debian /etc/postfix/main.cf
    .  If you need to make changes, edit
    /etc/postfix/main.cf (and others) as needed.  To view Postfix configuration
    values, see postconf(1).
    
    After modifying main.cf, be sure to run '/etc/init.d/postfix reload'.

2. CREATE FILE /etc/postfix.main.cf

cp /usr/share/postfix/main.cf.debian /etc/postfix/main.cf
    
    
    
</entry>
<entry [Sat 2012:09:08 23:44:27 EST] ini FORMAT>

The StarCluster configuration file uses 'ini' formatting:

http://en.wikipedia.org/wiki/INI_file
    
</entry>
<entry [Sat 2012:08:25 00:18:26 EST] CAN USE pgrep TO KILL PROCESS BY ARGUMENTS>

www-data  2937  0.0  0.0  82940  2848 ?        S    00:10   0:00 /usr/sbin/fcgi-pm -k start
syoung    3234  0.0  0.0  13580   916 pts/0    S+   00:20   0:00 grep --color=auto cgi



pgrep -f "/usr/bin/perl ./workflow.pl"

pgrep -f "/usr/bin/perl ./workflow.pl"

ps aux | grep perl
root      1196  0.8  1.4 133268 53452 ?        S    Aug24   0:08 /usr/bin/perl ./view.pl 
root      1197  0.9  1.6 138060 60092 ?        S    Aug24   0:09 /usr/bin/perl ./package.pl 
root      1198  0.4  1.1 116796 41064 ?        S    Aug24   0:04 /usr/bin/perl ./folders.pl 
root      1199  0.9  1.9 151048 69272 ?        S    Aug24   0:09 /usr/bin/perl ./sharing.pl 
root      1200  0.9  1.9 151104 69276 ?        S    Aug24   0:09 /usr/bin/perl ./admin.pl 
root      1201  1.4  2.3 167084 85000 ?        S    Aug24   0:14 /usr/bin/perl ./workflow.pl 
root      1849  0.8  1.4 133284 53456 ?        S    Aug24   0:08 /usr/bin/perl ./view.pl 
root      1850  0.9  1.6 138084 60140 ?        S    Aug24   0:08 /usr/bin/perl ./package.pl 
root      1853  0.4  1.1 116796 41060 ?        S    Aug24   0:04 /usr/bin/perl ./folders.pl 
root      1854  0.9  1.9 151104 69272 ?        S    Aug24   0:09 /usr/bin/perl ./sharing.pl 
root      1857  0.9  1.9 151104 69272 ?        S    Aug24   0:09 /usr/bin/perl ./admin.pl 
root      1858  1.4  2.3 167084 85076 ?        S    Aug24   0:14 /usr/bin/perl ./workflow.pl 
root      2938  2.9  1.4 133268 53452 ?        S    00:10   0:08 /usr/bin/perl ./view.pl 
root      2939  3.0  1.6 138060 60136 ?        S    00:10   0:08 /usr/bin/perl ./package.pl 
root      2940  1.6  1.1 116824 41064 ?        S    00:10   0:04 /usr/bin/perl ./folders.pl 
root      2941  3.3  1.9 151104 69272 ?        S    00:10   0:09 /usr/bin/perl ./sharing.pl 
root      2942  3.3  1.9 151104 69276 ?        S    00:10   0:09 /usr/bin/perl ./admin.pl 
root      2943  4.9  2.3 167084 84996 ?        S    00:10   0:13 /usr/bin/perl ./workflow.pl 
syoung    3180  0.0  0.0  13580   920 pts/0    S+   00:15   0:00 grep --color=auto perl

syoung@syoung-Satellite-C675D:~$ killall "/usr/bin/perl ./workflow.pl"
/usr/bin/perl ./workflow.pl: No such file or directory
syoung@syoung-Satellite-C675D:~$ killall ^Csr/bin/perl 
syoung@syoung-Satellite-C675D:~$ pgrep -f workflow.pl
1201
1858
2943
syoung@syoung-Satellite-C675D:~$ man pgrep
^C^C

syoung@syoung-Satellite-C675D:~$ pgrep -f "/usr/bin/perl ./workflow.pl"
1201
1858
2943



       -f     The pattern is normally only matched against the process name.  When -f is set, the full command line is used.

    
NAME
       pgrep, pkill - look up or signal processes based on name and other attributes

SYNOPSIS
       pgrep [-cflvx] [-d delimiter] [-n|-o] [-P ppid,...] [-g pgrp,...] [-s sid,...] [-u euid,...] [-U uid,...] [-G gid,...] [-t term,...] [pattern]

       pkill [-signal] [-fvx] [-n|-o] [-P ppid,...] [-g pgrp,...] [-s sid,...] [-u euid,...] [-U uid,...] [-G gid,...] [-t term,...] [pattern]

DESCRIPTION
       pgrep looks through the currently running processes and lists the process IDs which matches the selection criteria to stdout.  All the criteria have to match.  For example,

              $ pgrep -u root sshd

       will only list the processes called sshd AND owned by root.  On the other hand,

              $ pgrep -u root,daemon

       will list the processes owned by root OR daemon.

       pkill will send the specified signal (by default SIGTERM) to each process instead of listing them on stdout.

OPTIONS
       -c     Suppress normal output; instead print a count of matching processes.

       -d delimiter
              Sets the string used to delimit each process ID in the output (by default a newline).  (pgrep only.)

       -f     The pattern is normally only matched against the process name.  When -f is set, the full command line is used.

       -g pgrp,...
              Only match processes in the process group IDs listed.  Process group 0 is translated into pgrep's or pkill's own process group.

       -G gid,...
              Only match processes whose real group ID is listed.  Either the numerical or symbolical value may be used.

       -l     List the process name as well as the process ID. (pgrep only.)

       -n     Select only the newest (most recently started) of the matching processes.

       -o     Select only the oldest (least recently started) of the matching processes.

       -P ppid,...
              Only match processes whose parent process ID is listed.

       -s sid,...
              Only match processes whose process session ID is listed.  Session ID 0 is translated into pgrep's or pkill's own session ID.

       -t term,...
              Only match processes whose controlling terminal is listed.  The terminal name should be specified without the "/dev/" prefix.

       -u euid,...
              Only match processes whose effective user ID is listed.  Either the numerical or symbolical value may be used.

</entry>
<entry [Thu 2012:08:23 17:55:12 EST] AWS COST ALLOCATION BY TAGGING>

http://aws.typepad.com/aws/2012/08/aws-cost-allocation.html
    
</entry>
<entry [Wed 2012:08:22 18:45:05 EST] SOLVED MISSING CONF ON AQUARIUS-8f2>

cd /agua
git checkout 6240131 conf/default.conf

</entry>
<entry [Sun 2012:08:19 23:24:15 EST] FIXED WARNING ON RESTART APACHE2: '_default_ VirtualHost overlap on port 443'>

PROBLEM

GET THIS WARNING WHEN RESTART APACHE2:

service apache2 restart
    * Restarting web server apache2                                                                                                                                    [Mon Aug 20 03:19:55 2012] [warn] _default_ VirtualHost overlap on port 443, the first has precedence
    ... waiting [Mon Aug 20 03:19:56 2012] [warn] _default_ VirtualHost overlap on port 443, the first has precedence
                                                  


SOLUTION

ADD THIS TO BOTTOM OF apache2.conf FILE

    NameVirtualHost *:443

NOW APACHE STARTS WITHOUT WARNING:

service apache2 restart
 * Restarting web server apache2                                                   ... waiting                                


    
</entry>
<entry [Sat 2012:08:18 15:48:23 EST] SOLVED: CAN'T ACCESS syoung:agua USING CORRECT SSH KEY>

SUMMARY: DEPLOY KEY SET FOR syoung:biorepository, NOT syoung:agua


PROBLEM

USING CORRECT SSH KEY BUT GET THIS ERROR MESSAGE:

export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;  git fetch git@github.com:syoung/agua.git 
ERROR: Repository not found.
fatal: The remote end hung up unexpectedly


DIAGNOSIS

USING -v OPTION IN git-ssh.sh FILE:

    #!/bin/sh                                                                                                                                                   	
    exec ssh -T -v -i /agua/conf/.repos/github/syoung/id_rsa -o "StrictHostKeyChecking no" -o "IdentitiesOnly yes" "$@"
    exit 0


... SHOWS THAT GITHUB IS ALLOWING ACCESS TO syoung:biorepository ***NOT*** syoung:agua

debug1: Trying private key: /agua/conf/.repos/github/syoung/id_rsa
debug1: read PEM private key done: type RSA
debug1: Remote: Forced command: gerve syoung/biorepository 74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e
debug1: Remote: Port forwarding disabled.
debug1: Remote: X11 forwarding disabled.
debug1: Remote: Agent forwarding disabled.
debug1: Remote: Pty allocation disabled.
debug1: Authentication succeeded (publickey).
Authenticated to github.com ([207.97.227.239]:22).
 
 
SOLUTION

REMOVE DEPLOY KEY FROM syoung:biorepository

syoung:biorepository --> Admin --> Deploy Keys --> Delete

    ec2_private_key (74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e)
    
    
CHECK SSH KEY FOR syoung ACCOUNT:

github.com/syoung --> Edit My Account --> SSH Keys

    aquarius2 (a0:0d:00:4b:2f:7d:61:07:a9:ec:13:33:fa:df:84:af)
    

ADD ec2_private_key DEPLOY KEY TO syoung:agua

syoung:agua --> Admin --> Deploy Keys

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCZ+6PKDlGlIE8CONGqEV65risoWVlmSXlnC4Z2HJrIAtheH/cx0vVKUXnFodkK6y11ZrvsXbsNXaH1sVAE/6f+dZRjleYcq3bbDKBw0DVSLwujNhEw/rc+Word5OmewNWlq1fOpu8rVOeZo+wZ4o17aTLyNJ17OfVVXoOHAcP0BQ==


RUN FETCH:

cd /agua
export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;  git fetch git@github.com:syoung/agua.git 

    Transferred: sent 4064, received 51896 bytes, in 1.1 seconds
    Bytes per second: sent 3851.2, received 49179.0
    debug1: Exit status 0
    remote: Total 140 (delta 114), reused 132 (delta 106)
    Receiving objects: 100% (140/140), 42.69 KiB, done.
    Resolving deltas: 100% (114/114), completed with 95 local objects.
    From github.com:syoung/agua
     * branch            HEAD       -> FETCH_HEAD
    
    OK
    
</entry>
<entry [Sat 2012:08:18 10:28:46 EST] PERL FOR CLOUDWATCH AND VM:EC2>

http://www.perlmonks.org/?node_id=982489

AWS CloudWatch - Does anyone use Perl for this? Should I choose a different tool for this job?

by LurkingFoobar	 Log inCreate a new user The Monastery Gates Super Search 
Seekers of Perl Wisdom Meditations PerlMonks Discussion 
Obfuscation Reviews Cool Uses For Perl Perl News Q&A Tutorials 
Poetry Recent Threads Newest Nodes Donate What's New
on Jul 18, 2012 at 17:05 UTC ( #982489=perlquestion: print w/ replies, xml )	Need Help??
LurkingFoobar has asked for the wisdom of the Perl Monks concerning the following question:
I have been looking at the the Perl CloudWatch library supplied by Amazon Web Services at http://aws.amazon.com/code/2518.

I noticed that there seemed to be an easy-to-find easy-to-fix bug in the getName/getValue code for metrics and dimensions. This tells me that no one actually uses this code. I would like to use Perl for some CloudWatch calls instead of the Java CLI tools or Python. In part this is because of Perl's integration with nagios.

However, after googling for perl and cloudwatch and finding nothing I have to conclude that no one is using this library or any other Perl library for CloudWatch.

Is this true? Should I just use python's very complete boto library for programming cloudwatch metrics?

There are other excellent Perl libraries out there for parts of AWS, e.g. VM::EC2. And some of the AWS supplied code has worked just fine so far. But I don't want to make myself obsolete. And frankly, I am a tool user not a tool maker or CPAN contributor.

    
</entry>
<entry [Sat 2012:08:18 10:20:40 EST] CLOUDMAN README>

cat /mnt/cm/README.md 
## CloudMan

Easily create a [compute cluster][9] on top of a [cloud computing infrastructure][11].

### Overview

[CloudMan][1] is a cloud manager that orchestrates all of the steps required
to provision a complete compute cluster environment on a cloud infrastructure;
subsequently, it allows one to manage the cluster, all through a web 
browser. Although CloudMan can be used in any domain and for any purpose that
calls for a compute cluster, it is primarily used in the context of [Galaxy Cloud][4]
and [CloudBioLinux][5] and, along with the infrastructure, ensures a complete 
[Next Generation Sequencing (NGS)][10] analysis toolset is instantly available.
CloudMan is currently available on the [AWS EC2 cloud][6].

### Use

To instantiate a CloudMan cluster, simply visit [biocloudcentral.org][7].

### Local deployment
For basic testing and some development, [CloudMan][1] can be run locally.
Start by cloning [CloudMan source][3], installing [virtualenv][2], and
adding Python libraries required by CloudMan. Then, run it:

    $ cd < project root dir>
    $ hg clone https://bitbucket.org/galaxy/cloudman
    $ virtualenv --no-site-packages .
    $ source bin/activate
    $ pip install -r cloudman/requirements.txt
    $ sh cloudman/run.sh [--reload]

### Custom cloud deployment
If you would like to deploy CloudMan and all of its dependencies on a cloud
infrastructure where a public image does not already exist, take a look at
[mi-deployment][8] scripts (mi_fabfile.py in particular), which enable an easy
way to do so.

[1]: https://usecloudman.org/
[2]: https://github.com/pypa/virtualenv
[3]: https://bitbucket.org/galaxy/cloudman
[4]: http://www.nature.com/nbt/journal/v29/n11/full/nbt.2028.html
[5]: http://cloudbiolinux.org/
[6]: http://aws.amazon.com/ec2/
[7]: http://biocloudcentral.org/
[8]: https://bitbucket.org/afgane/mi-deployment/
[9]: http://en.wikipedia.org/wiki/Computer_cluster
[10]: http://en.wikipedia.org/wiki/DNA_sequencing
[11]: http://en.wikipedia.org/wiki/Cloud_computing

## LICENSE

The code is freely available under the [MIT license][l1].

[l1]: http://www.opensource.org/licenses/mit-license.html




    
</entry>
<entry [Sat 2012:08:18 01:37:25 EST] BIOCLOUDCENTRAL: GALAXY AND BIOLINUX + CLOUDMAN>
        
http://bcbio.wordpress.com/2011/11/29/making-next-generation-sequencing-analysis-pipelines-easier-with-biocloudcentral-and-galaxy-integration/

    
</entry>
