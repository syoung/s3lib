agua




error: failed to push some refs to 'git@github.com:syoung/aguadev'
Counting objects: 125820, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (69484/69484), done.
Writing objects: 100% (125820/125820), 1.26 GiB | 40.00 KiB/s, done.
Total 125820 (delta 50802), reused 125679 (delta 50744)
remote: warning: File t/unit/bin/Queue/Master/outputs/test.log is 89.73 MB; this is larger than GitHub's recommended maximum file size of 50 MB
remote: warning: File html/dojo-1.8.3/util/.git.bkp/objects/pack/pack-25defd57ffd31122cd4e74fc9cd1893fc1e92cc6.pack is 65.52 MB; this is larger than GitHub's recommended maximum file size of 50 MB
remote: warning: File t/bin/Filter/SNP/dbfile/filtersnp.dbl is 64.92 MB; this is larger than GitHub's recommended maximum file size of 50 MB
remote: warning: File t/bin/Filter/inputs/chrY/chrY.fa is 57.76 MB; this is larger than GitHub's recommended maximum file size of 50 MB
remote: warning: File html/plugins/view/jbrowse/species.tar.gz is 74.49 MB; this is larger than GitHub's recommended maximum file size of 50 MB
remote: warning: File notes.tar.gz is 58.08 MB; this is larger than GitHub's recommended maximum file size of 50 MB
remote: error: GH001: Large files detected.
remote: error: Trace: 5ec6e07be1f5c1710685576c5c9e3df3
remote: error: See http://git.io/iEPt8g for more information.
remote: error: File bin/install/resources/sge/sge6.tar.gz is 105.22 MB; this exceeds GitHub's file size limit of 100 MB
remote: error: File lib/Agua/sub.txt is 157.34 MB; this exceeds GitHub's file size limit of 100 MB
remote: error: File agua.0.6-241-d4878b2.tar.gz is 128.96 MB; this exceeds GitHub's file size limit of 100 MB
remote: error: File lib/Admin/html/plugins/view/jbrowse-old/data-chr2,chrX,chrY.zip is 161.13 MB; this exceeds GitHub's file size limit of 100 MB
To git@github.com:syoung/aguadev



<entry [Fri 2015:02:13 18:08:17 EST] UNMERGING AFTER ACCIDENTAL MERGE OF OLD aguadev FROM BITBUCKET TO NEW aguadev>


*   5 weeks ago 66bc90b Merge branch 'master' of bitbucket.org:stuartpyoung/aguadev
|\  Conflicts:
| |     .gitignore
| |     README
| |     VERSION
...
...
| * 3 years, 10 months ago 613da42 Added .gitignore for builds dir
|  
* 8 weeks ago 7fb3449 -Inc lib/Agua: Added dryrun option to runProject, runWorkflow and runStage
|  
* 8 weeks ago aaf432d -Add t: Added html/mock/Mock.js and Agua mock
|  
* 8 weeks ago a5c9b16 -Inc lib: Fixed stop value in Workflow::runStages
|  
* 3 months ago d31a6aa -Add t/functional/html/plugins/workflow: Functional test - browser loads but intern broken
|  
* 3 months ago a6c6c8f -Onw html/plugins,lib: Enabling AMD in Workflow pane - stage drop and click ok
|  
* 3 months ago 8af9892 -Add t/unit/html/test/hello.js: Intern basic test working OK
|  
* 3 months ago 4f4bd9a -Del html/dojo: Replaced dojo 1.8.3 with dojo 1.10.2
|  
* 3 months ago 233eb21 +Add html/plugins,html/t/intern.js,t/functional: Added intern functional test and intern.js 
|  
* 3 months ago 1e28429 -Inc README: Added Codeship status image
|  
* 3 months ago efcbc84 -Onw html/plugins,t/unit/html: AMD-enabling all modules - fixed onclick load Params in Workf
|  
* 3 months ago 515305d -Onw html/plugins,t/unit/html: AMD-enabling all modules - fixed Workflows drop then renumber
|  
* 3 months ago 0821fab -Inc lib/Agua/Common: Updated server push responses for Workflow - History, Parameter, Stage
|  
* 3 months ago 258232d -Inc t/unit/html: Updated workflow tests - apps, grid, history, workflows
|  
* 3 months ago 1c15c36 -Onw html/plugins: Reenabling Workflow pane w/ AMD - all ok except Grid
|  
* 3 months ago a69df46 -Onw html/plugins: Reenabling Workflow pane with AMD - identified problem in plugins.dijit.T
|  
* 3 months ago 9d9228e -Onw html/plugins: Reenabling Workflow layout using AMD - load Parameters ok
|  
* 4 months ago 3ce9864 -Inc html/plugins/form/DndSource.js,t/unit/html/plugins/workflow/workflows: Better factory w
|  
* 4 months ago 3fe8ca3 -Inc t/unit/html/plugins/workflow/workflows: Enabled plugins.form.Plugin
|  
* 4 months ago 61b0740 -Inc html/plugins: Completed plugins.form.Plugin for adding workflow.Apps.AppRow
|  
* 4 months ago 2d81f64 -Inc html/plugins: Converted core modules en masse to AMD, enabled workflow ExpandoPane
|  
* 4 months ago 4a2b923 -Inc html/exchange: Updated http.js
|  
* 4 months ago 43a20a1 +Add t/unit/html/plugins/workflow: Added expando test and data.json to workflows test
|  
* 4 months ago 007897f -Inc html/plugins: Re-enabled ExpandoPane in Workflow with resize
|  
* 4 months ago 2da6230 -Onw html/plugins: Enabling plugins with AMD, passed Agua.controllers ok
|  
* 4 months ago 0249381 -Onw html/plugins: Enabling load plugins using AMD, avoiding multipleDefine error
|  
* 4 months ago 60feacd +Add html/excchange: Added https/http.js for testing, modified socketio/index.html and rabbi
|  
* 4 months ago c0e51c3 [0.8.0-beta.2] First build of Beta 2
|  
* 4 months ago 18d7c16 -Inc .gitignore: Excluded cgi-bin/hello.cgi and html/hello.cgi
|  
* 4 months ago 1e6e401 +Add all: First commit pre 0.8.0-beta.2


SOLUTION

git reset --hard origin/master

	
</entry>
<entry [Fri 2014:09:26 16:42:25 EST] AGUA 1-3 [0.8.0-beta.2] First build of Beta 2>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.2 \
--mode 1-3 \
--log 4 \
--message "First build of Beta 2"

1. REDUCED .git DIR FOOTPRINT BY REMOVING t DIR AND OLD apps DIRS

2. FIXED /a/bin/cli/app

/a/bin/cli/app create --name Aspera --param uuid --description "Download a file using Aspera (e.g., from the SRA)"
/a/bin/cli/app addParam --appfile ./Aspera.app --param uuid --value SRA645668
/a/bin/cli/app addParam --appfile ./Aspera.app --param outputdir --value /tmp


3. FIXED /a/bin/cli/param

/a/bin/cli/app create --name Aspera --description "Download a file using Aspera (e.g., from the SRA)" --log 4


4. ENABLED SERVER PUSH FOR Workflow STATUS

5. REPLACED Net::RabbitFoot WITH Net::RabbitMQ





</entry>
<entry [Fri 2014:09:26 02:38:47 EST] AGUA 1-3 [0.8.0-beta.1+build.111] Reduced Agua staging to 3 stages, removed 't' dir and apps>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.111 \
--mode 1-3 \
--log 4 \
--message "Reduced Agua staging to 3 stages, removed 't' dir and apps"


</entry>
<entry [Sat 2014:09:20 01:27:10 EST] AGUA 1-3 [0.8.0-beta.1+build.110] Updated Install.pm, refactored CLI executables and modules>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.110 \
--mode 1-3 \
--log 4 \
--message "Updated Install.pm, refactored CLI executables and modules"

* 2 minutes ago 86ef803 +Add bin/cli,lib/Agua/CLI/Flow.pm: Added new files and refactored CLI
* 3 weeks ago 14df5f6 -Fix bin/install/resources/agua/install/listener.sh: Set to executable
* 3 weeks ago 61ddf00 -Onw lib/Agua/Ops/Install.pm: Added asterisk support in *.ops 'unzipped' value
* 3 weeks ago b9dbdea -Inc lib/Agua/Install.pm: Added missing methods
* 3 weeks ago 6365d69 -Inc lib/Agua/Install.pm: Added installdir
* 3 weeks ago 4077695 -Fix lib/Agua/Install.pm: Added incrementFile and other util methods
* 3 weeks ago 42bce02 -Add INSTALL: Installation instructs - later: edit to remove install.pl options
* 3 weeks ago 2535028 -Inc lib/Agua/Install/MySQL.pm: Removed call to puppet
* 3 weeks ago 778cb7c -Ref lib/Agua/Install.pm: Converted from PreInstall plus original Install::copyConf

    
</entry>
<entry [Tue 2014:08:26 12:58:29 EST] AGUA 1-3 [0.8.0-beta.1+build.109] Added ipaddress field to instance and provenancetables, added heartbeat table>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.109 \
--mode 1-3 \
--log 4 \
--message "Added ipaddress field to instance and provenancetables, added heartbeat table"
	
* 16 seconds ago 9ce3ee7 -Inc bin/sql/dump: Added ipaddress field to instance and provenancetables, added heartbeat table
* 16 minutes ago ac27adb -Inc lib/Agua/Install.pm: Commented out non-essential calls in install method
* 17 minutes ago 539864f -Inc bin/sql: Added ipaddress to instance and provenance tables

	
</entry>
<entry [Sun 2014:08:24 17:09:49 EST] AGUA 1-3 [0.8.0-beta.1+build.109] Refactored heartbeat to Monitor from Worker, reenabled doShutdown>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.109 \
--mode 1-3 \
--log 4 \
--message "Refactored heartbeat to Monitor from Worker, reenabled doShutdown"
	

* 4 minutes ago 12eacad -Inc bin,lib: Refactored heartbeat to Monitor from Worker, reenabled doShutdown

	
</entry>
<entry [Sun 2014:08:24 15:00:27 EST] AGUA 1-3 [0.8.0-beta.1+build.108] Added monitor daemon to restart worker if heartbeat lost>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.108 \
--mode 1-3 \
--log 4 \
--message "Added monitor daemon to restart worker if heartbeat lost"
	
* 20 seconds ago 943e726 -Del bin/install/resources/agua/etc/init/task.conf: Cleanup
* 3 minutes ago 5ac8ebe -Add bin/daemon/monitor,bin/install/resources,lib: Added monitor daemon to restart worker if heartbeat lost
* 21 hours ago 6717c45 -Inc lib: Updated Exchange for receiveTask
	
</entry>
<entry [Sat 2014:08:23 09:33:16 EST] AGUA 1-3 [0.8.0-beta.1+build.107] Fixed receiveTask, onw check Workflow::addQueueSample>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.107 \
--mode 1-3 \
--log 4 \
--message "Fixed receiveTask, onw check Workflow::addQueueSample"
	
* 46 seconds ago 8baef80 -Onw lib/Agua/Workflow.pm,bin/exchange/receiveTask: Fixed receiveTask, onw check Workflow::addQueueSample
	
</entry>
<entry [Sat 2014:08:23 07:47:08 EST] AGUA 1-3 [0.8.0-beta.1+build.106] Restored Coro::pool loop in Worker to prevent error>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.106 \
--mode 1-3 \
--log 4 \
--message "Restored Coro::pool loop in Worker to prevent error"
	
* 39 seconds ago 18b7b1c -Fix lib/Queue/Worker.pm: Restored Coro::pool loop in Worker.pm to prevent error
	
	
</entry>
<entry [Sat 2014:08:23 07:11:10 EST] AGUA 1-3 [0.8.0-beta.1+build.105] Removed debug comment in Worker>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.105 \
--mode 1-3 \
--log 4 \
--message "Removed debug comment in Worker"
	
	
	
</entry>
<entry [Sat 2014:08:23 06:50:02 EST] AGUA 1-3 [0.8.0-beta.1+build.104] Fixed worker stall on job completion>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.104 \
--mode 1-3 \
--log 4 \
--message "Fixed worker stall on job completion"
	
* 48 seconds ago 8e4e8b6 -Fix lib/Queue/Worker.pm: Removed fork to prevent worker stall on job completion
	
</entry>
<entry [Fri 2014:08:22 18:08:33 EST] AGUA 1-3 [0.8.0-beta.1+build.103] Reenabled Worker::sendTask update.job.status>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.103 \
--mode 1-3 \
--log 4 \
--message "Reenabled Worker::sendTask update.job.status"

* 39 seconds ago 9a3601d -Fix lib/Queue/Worker.pm: Reenabled Worker sendTask update.job.status
* 2 hours ago d1f226d -Fix lib/Queue/Listener.pm: Changed updateInstanceStatus to use host not id	

</entry>
<entry [Fri 2014:08:22 15:51:55 EST] AGUA 1-3 [0.8.0-beta.1+build.102] Added foreman split from worker, fixed mysql integer errors on saveWorkflow>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.102 \
--mode 1-3 \
--log 4 \
--message "Added foreman split from worker, fixed mysql integer errors on saveWorkflow"
	
* 4915629 (HEAD, master) -Fix lib/Agua: Fixed mysql integer errors on saveWorkflow, cleaned up Workflow.pm
* 07d0953 -Fix bin/install/resources/agua/install/foreman.sh: Made executable
	
</entry>
<entry [Fri 2014:08:22 13:25:06 EST] AGUA 1-3 [0.8.0-beta.1+build.101] Fixed noninteger value for locked and submit>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.101 \
--mode 1-3 \
--log 4 \
--message "Fixed noninteger value for locked and submit"
	

* 35 seconds ago 964866b -Fix lib/Agua/CLI/App.pm: Fixed noninteger value for locked and submit



</entry>
<entry [Fri 2014:08:22 11:56:11 EST] AGUA 1-3 [0.8.0-beta.1+build.100] Fixed hostname save to config in Worker::doShutdown>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.100 \
--mode 1-3 \
--log 4 \
--message "Fixed hostname save to config in Worker::doShutdown"
	
* 75 seconds ago 9683165 -Inc lib/Queue: Fixed hostname save to config in Worker::doShutdown


</entry>
<entry [Fri 2014:08:22 11:14:08 EST] AGUA 1-3 [0.8.0-beta.1+build.99] Fixed hostname case-sensitive issue in Listener::deleteInstance>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.99 \
--mode 1-3 \
--log 4 \
--message "Fixed hostname case-sensitive issue in Listener::deleteInstance"
	
* 40 seconds ago 1dd4fd6 -Fix bin: Resolved hostname case-sensitive issue in Listener::deleteInstance

	
</entry>
<entry [Thu 2014:08:21 12:02:33 EST] AGUA 1-3 [0.8.0-beta.1+build.98] Increased parameter argument max length to 255>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.98 \
--mode 1-3 \
--log 4 \
--message "Increased parameter argument max length to 255"
	
* 38 seconds ago 2a97489 -Fix lib/Agua/Common/Package/Sync.pm,bin/sql: Set default ordinal to 0, increased parameter argument max length to 255
	
</entry>
<entry [Thu 2014:08:21 09:00:17 EST] AGUA 1-3 [0.8.0-beta.1+build.97] Added support for missing ordinal in *.work file>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.97 \
--mode 1-3 \
--log 4 \
--message "Added support for missing ordinal in *.work file"
	

* 40 seconds ago 405f8b4 -Inc lib/Agua/Common/Package/Sync.pm: Added support for missing ordinal in *.work file parameter entry


</entry>
<entry [Wed 2014:08:20 18:00:58 EST] AGUA 1-3 [0.8.0-beta.1+build.96] Fixed missing parameters in after load package due to _removeParameter ignoring ordinal>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.96 \
--mode 1-3 \
--log 4 \
--message "Fixed missing parameters in after load package due to _removeParameter ignoring ordinal"
	
* 6 hours ago db57b84 -Fix lib/Agua/Common/Parameter.pm,lib/Agua/Stage.pm: Ensured parameters sorted by ordinal
* 7 hours ago 77f7e27 -Fix lib/Agua/Common/Parameter.pm: Enabled deleteParameter with ordinal in key
	
</entry>
<entry [Wed 2014:08:20 06:18:54 EST] AGUA 1-3 [0.8.0-beta.1+build.95] Reenabled sendTask update.job.status 'started' in Worker>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.95 \
--mode 1-3 \
--log 4 \
--message "Reenabled sendTask update.job.status 'started' in Worker"
	
* 58 seconds ago 3094755 -Fix lib: Reenabled sendTask update.job.status 'started' in Worker

	
</entry>
<entry [Tue 2014:08:19 10:53:15 EST] AGUA 1-3 [0.8.0-beta.1+build.94] Removed 'wait' in Stage::runLocally>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.94 \
--mode 1-3 \
--log 4 \
--message "Removed 'wait' in Stage::runLocally"
	
* 30 seconds ago df59406 Fix lib/Agua/Stage.pm: Removed 'wait' in Stage::runLocally

	
</entry>
<entry [Tue 2014:08:19 10:36:13 EST] AGUA 1-3 [0.8.0-beta.1+build.93] Added 'envarfile' to stage to set environment variables>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.93 \
--mode 1-3 \
--log 4 \
--message "Added 'envarfile' to stage to set environment variables"
	
* 46 seconds ago 003b7ac -Inc bin/sql/stage.sql,lib/Agua: Added 'executor' to stage to set environment variables


</entry>
<entry [Mon 2014:08:18 04:41:19 EST] AGUA 1-3 [0.8.0-beta.1+build.92] Refactored Stage::runLocally to non-forking system call>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.92 \
--mode 1-3 \
--log 4 \
--message "Refactored Stage::runLocally to non-forking system call"
	
* 2 minutes ago e5f9b23 -Fix lib/Agua/Cluster/Jobs.pm,lib/Agua/Stage.pm: Completed refactor Stage::runLocally
* 29 hours ago bed35a9 -Inc bin/sql/dump/agua: Updated agua.dump - added 'sampletable' table
* 2 days ago 37e56b8 -Onw lib: Enabling Stage::printScriptFile with sendTask
* 2 days ago 595c13b -Fix bin/exchange/sendTask,lib/Exchange.pm: Corrected call signature for sendTask
	
</entry>
<entry [Wed 2014:08:13 06:00:10 EST] AGUA 1-3 [0.8.0-beta.1+build.91] Reenabled Agua::Stage after testing 'wait' call in runLocally>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.91 \
--mode 1-3 \
--log 4 \
--message "Reenabled Agua::Stage after testing 'wait' call in runLocally"

* 57 seconds ago 928834e -Inc lib/Agua/Stage.pm: Reenabled Agua::Stage after testing runLocally 'wait' call

	
</entry>
<entry [Wed 2014:08:13 04:15:59 EST] AGUA 1-3 [0.8.0-beta.1+build.90] Increased wait in attachVolume for attach before mount>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.90 \
--mode 1-3 \
--log 4 \
--message "Increased wait in attachVolume for attach before mount"

30 seconds ago e27083a -Inc lib/Virtual: Increased sleep in attachVolume before mount
	
	
</entry>
<entry [Wed 2014:08:13 01:00:47 EST] AGUA 1-3 [0.8.0-beta.1+build.89] Added bin/exchange scripts (incl. sendTask), enabled 'volume.pl --mode trash'>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.89 \
--mode 1-3 \
--log 4 \
--message "Added bin/exchange scripts (incl. sendTask), enabled 'volume.pl --mode trash'"


* 47 seconds ago 6e79912 -Inc bin/openstack/volume.pl,lib/Virtual/Openstack*: Enabled 'volume.pl --mode trash'
* 14 hours ago 6132841 -Inc bin/exchange/sendTask,lib/Exchange*: Enabled sendTask with queue option
* 14 hours ago eb573cd -Fix lib/Exchange: Enabled sendTask using Exchange::Manager
* 16 hours ago ac956cc -Inc lib/Queue: Minor changes - housekeeping send/receive methods
* 17 hours ago a8fa99a -Onw lib/Exchange.pm: Enabling all bin/exchange scripts
* 17 hours ago 4c21cea -Inc bin: Cleaning up exchangs scripts, reformatted 'log' lines in all bin scripts
* 35 hours ago b511996 -Fix lib/Queue/Master.pm,lib/Virtual/Openstack.pm: Moved *EXTRA* to front of userdata.tmpl file

	
</entry>
<entry [Mon 2014:08:11 05:37:41 EST] AGUA 1-3 [0.8.0-beta.1+build.88] Enabled Siphon adjust counts to include latest started workflow>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.88 \
--mode 1-3 \
--log 4 \
--message "Enabled Siphon adjust counts to include latest started workflow"
	
* 2 minutes ago 55a21c4 -Inc lib/Queue,lib/Agua/Workflow.pm: Fixed Workflow::updateJobStatus, Master::adjustCounts for last started
	
	
</entry>
<entry [Sun 2014:08:10 21:04:47 EST] AGUA 1-3 [0.8.0-beta.1+build.87] Fixed use Virtual::Openstack in volume.pl>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.87 \
--mode 1-3 \
--log 4 \
--message "Virtual::Openstack in volume.pl"
	
	
</entry>
<entry [Sun 2014:08:10 20:59:52 EST] AGUA 1-3 [0.8.0-beta.1+build.86] Reenabled volume.pl and fixed Master::getInstanceCounts>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.86 \
--mode 1-3 \
--log 4 \
--message "Reenabled volume.pl and fixed Master::getInstanceCounts"

* 87 seconds ago 15b2957 -Inc lib/Queue/Master.pm: Fixed getInstanceCounts - used floor instead of ceil
* 3 minutes ago 2154d7b -Inc bin/openstack/volume.pl,lib/Virtual/Openstack.pm: Reenabled volume.pl

	
</entry>
<entry [Sun 2014:08:10 15:05:16 EST] AGUA 1-3 [0.8.0-beta.1+build.85] Added pre-shutdown 'teardown' to Siphon>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.85 \
--mode 1-3 \
--log 4 \
--message "Added pre-shutdown 'teardown' to Siphon"

* 54 seconds ago b1bde69 -Inc lib/Agua: Improved deploy.pl status messages
* 85 seconds ago 9b91e16 -Fix lib/Queue/Master.pm: Fixed Master::deleteNodes - added id and host info
* 3 hours ago a5bc99d -Inc lib/Queue: Added teardown file to Master.pm and Worker.pm

	
	
</entry>
<entry [Sat 2014:08:09 13:03:54 EST] AGUA 1-3 [0.8.0-beta.1+build.84] Fixed Siphon instance add/delete>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.84 \
--mode 1-3 \
--log 4 \
--message "Fixed Siphon instance add/delete"


* 54 seconds ago ad3dbf3 -Fix lib/Queue,lib/Virtual: Enabled Listener::deleteInstance called by Worker::doShutdown
* 2 minutes ago 3009be8 -Inc bin/exchange,lib/Exchange: Refactored receiveTopic and sendTopic - all options for Siphon testing
* 3 hours ago 2498d7a -Add bin/exchange,lib/Exchange,t/unit/bin/Exchange: Moved bin/queue to bin/exchange, added Exchange/Manager.pm and scripts
* 33 hours ago 2726a4a -Inc lib/Queue: Restored listenTopics in Worker.pm, added Listener::deleteInstance	
	
</entry>
<entry [Wed 2014:08:06 12:46:21 EST] AGUA 1-3 [0.8.0-beta.1+build.83] Fixed CLI::Project::runStage and added Siphon Listener to handle update tasks>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.83 \
--mode 1-3 \
--log 4 \
--message "Fixed CLI::Project::runStage and added Siphon Listener to handle update tasks"

* 2 minutes ago 6b3ef0a +Add bin/daemon/listener,lib/Queue/Listener: Added Listener to handle update.job.status tasks
* 3 minutes ago a8d1283 -Fix lib/Agua/CLI/Project.pm: Fixed runStage missing assignation of samplehash

	
</entry>
<entry [Tue 2014:08:05 17:15:06 EST] AGUA 1-3 [0.8.0-beta.1+build.82] Fixed premature exit in Workflow::runLocally>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.82 \
--mode 1-3 \
--log 4 \
--message "Fixed premature exit in Workflow::runLocally"

* 44 seconds ago fa55f9e -Dbg lib/Agua/Common/Package/Sync.pm,lib/GT/Fuse.pm: Removed debug exits
* 80 seconds ago 522089a -Fix lib/Agua/Workflow.pm: Fixed premature exit in Workflow::runLocally
	
	
</entry>
<entry [Tue 2014:08:05 16:57:29 EST] AGUA 1-3 [0.8.0-beta.1+build.81] Fixed Worker-to-Master update.job.status relay>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.81 \
--mode 1-3 \
--log 4 \
--message "Fixed Worker-to-Master update.job.status relay"


* 2 minutes ago c247eb3 -Fix lib/Agua,lib/Queue: Fixed update.job.status relay from Worker to Master	

	
</entry>
<entry [Thu 2014:07:31 14:19:36 EST] AGUA 1-3 [0.8.0-beta.1+build.80] Reenabled workflow status update for Workflow local runs>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.80 \
--mode 1-3 \
--log 4 \
--message "Reenabled workflow status update for Workflow local runs"

* 37 seconds ago 586909f -Inc lib/Agua/Workflow.pm: Enabled Workflow::setWorkflowStatus call in runLocally
	
	
</entry>
<entry [Wed 2014:07:30 15:38:25 EST] AGUA 1-3 [0.8.0-beta.1+build.79] Fully enabled CPU and memory usage report in Agua::Stage>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.79 \
--mode 1-3 \
--log 4 \
--message "Fully enabled CPU and memory usage report in Agua::Stage"

* 2 minutes ago b29ac66 -Inc lib/Agua/Stage.pm: Minor change to runLocal system call - put time on own lines
* 22 minutes ago 2386657 -Fix lib/Agua/Stage.pm: Allowed for empty space before 'executor' envars file
	
	
</entry>
<entry [Mon 2014:07:28 16:27:32 EST] AGUA 1-3 [0.8.0-beta.1+build.78] Disabled PE and replaced with maxjobs throttling on SGE>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.78 \
--mode 1-3 \
--log 4 \
--message "Disabled PE and replaced with maxjobs throttling on SGE"

* 22 seconds ago ea6fdc6 -Inc lib/Agua: Minor changes
* 6 minutes ago e507c3b -Inc lib/Agua/Ops/Install.pm: Added output actual version when installing 'max'
* 9 minutes ago d097b95 -Inc lib/Agua/Cluster/Jobs.pm: Disabled PE and enabled maxjobs throttling
	
	
</entry>
<entry [Fri 2014:07:25 17:38:52 EST] AGUA 1-3 [0.8.0-beta.1+build.77] Support missing paramtype in stageparameter>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.77 \
--mode 1-3 \
--log 4 \
--message "Fixed stage table and enabled CLI::Project::runStage"


* 75 seconds ago 992ad76 -Inc lib/Agua: Enabled runStage in CLI::Project, removed Cluster::Jobs usage
* 2 minutes ago 73faa1b -Fix bin/sql/stage.sql: Increased executor field length to 255
	
</entry>
<entry [Wed 2014:07:23 13:20:57 EST] AGUA 1-3 [0.8.0-beta.1+build.76] Support missing paramtype in stageparameter>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.76 \
--mode 1-3 \
--log 4 \
--message "Support missing paramtype in stageparameter"

* 3 minutes ago afe7b9e -Inc lib/Agua/Common/Parameter.pm: Added support for stageparameter with undefined paramtype
* 3 minutes ago 6f45af3 -Fix lib/Agua/Workflow.pm: Added call to createQueue in Workflow::runInParallel
	
	
</entry>
<entry [Tue 2014:07:22 14:14:43 EST] AGUA 1-3 [0.8.0-beta.1+build.75] Enabled use deploy key with pancancer or any private repo>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.75 \
--mode 1-3 \
--log 4 \
--message "Enabled use deploy key with pancancer or any private repo"

[master e10a062] -Fix lib/Agua/Ops/GitHub.pm: Enabled use deploy key with pancancer or any private repo
	
</entry>
<entry [Tue 2014:07:22 12:28:55 EST] AGUA 1-3 [0.8.0-beta.1+build.74] Updated docs for deploy.pl 'list' and 'all' --mode options>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.74 \
--mode 1-3 \
--log 4 \
--message "Updated docs for deploy.pl 'list' and 'all' --mode options"

[master 54cf8b6] -Inc README,bin/install/deploy.pl: Updated docs for new deploy.pl 'list' and 'all' --mode options
		
</entry>
<entry [Tue 2014:07:22 12:24:02 EST] AGUA 1-3 [0.8.0-beta.1+build.73] Added 'list' and 'all' --mode options to deploy.pl>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.73 \
--mode 1-3 \
--log 4 \
--message "Added 'list' and 'all' --mode options to deploy.pl"

* 37 seconds ago b9bf4d3 -Inc lib/Agua/Deploy.pm: Added 'list' and 'all' --mode options to deploy.pl

	
</entry>
<entry [Tue 2014:07:22 11:29:17 EST] AGUA 1-3 [0.8.0-beta.1+build.72] Updated README to include ./preinstall.pl script>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.72 \
--mode 1-3 \
--log 4 \
--message "Updated README to include ./preinstall.pl script"

[master de97a9f] -Inc README: Updated README to include ./preinstall.pl script
 1 file changed, 12 insertions(+), 5 deletions(-)
	
</entry>
<entry [Tue 2014:07:22 05:31:38 EST] AGUA 1-3 [0.8.0-beta.1+build.71] Added usage info to Stage.pm and loadScript to CLI modules>
	
/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.71 \
--mode 1-3 \
--log 4 \
--message "Added usage info to Stage.pm and loadScript to CLI modules"
	
* 2 minutes ago dab3801 -Inc lib/Agua/Stage.pm: Added usage info to Stage.pm
* 10 hours ago bc08f05 -Onw lib/Agua: Added usage to Stage.pm system call, onw CU SRA pipeline
* 8 days ago b7d405f -Inc lib/Agua/CLI/Project.pm,t/unit: Cleaned up Agua::CLI::Project JSON output, added complete test
* 8 days ago 98abb96 -Inc lib/Agua/CLI: Added loadScript to Project, Workflow, App and Parameter classes

	
</entry>
<entry [Sat 2014:07:12 09:49:17 EST] AGUA 1-3 [0.8.0-beta.1+build.70] Fixed CLI workflow load failure (owner missing) and clone repo with deploy key>
	
/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.70 \
--mode 1-3 \
--log 4 \
--message "Fixed CLI workflow load failure (owner missing) and clone repo with deploy key"

* 2 minutes ago 918ff72 -Fix lib/Agua/Ops/Install.pm: Fully enabled clone private repo with deploy key
* 4 minutes ago 95cb3cf -Fix lib/Agua/Common/Stage.pm,lib/Agua/CLI: Fixed failure to load workflow when owner undefined

</entry>
<entry [Thu 2014:07:03 16:35:51 EST] AGUA 1-3 [0.8.0-beta.1+build.69] Added CLI newProject, enabled clone private repo with deploy key>
	
/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.69 \
--mode 1-3 \
--log 4 \
--message "Added CLI newProject, enabled clone private repo with deploy key"

* 29 seconds ago 546a655 -Inc bin/cli/flow.pl,lib/Agua/CLI: Added method CLI::Project::newProject
* 2 minutes ago 86deeaf -Inc lib/Agua/Deploy.pm,lib/Agua/Ops: Enabled clone private repo using deploy key


</entry>
<entry [Thu 2014:07:03 16:35:51 EST] AGUA 1-3 [0.8.0-beta.1+build.68] Added '--version max' for update to last version plus later unversioned changes>
	
/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.68 \
--mode 1-3 \
--log 4 \
--message "Added '--version max' for update to last version plus later unversioned changes"


</entry>
<entry [Thu 2014:07:03 04:37:44 EST] AGUA 1-3 [0.8.0-beta.1+build.67] Added return if workflow failure in CLI::Project::runProject>
	
/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.67 \
--mode 1-3 \
--log 4 \
--message "Added return if workflow failure in CLI::Project::runProject"


* 30 seconds ago 6dab6e2 -Dbg lib/Agua/Stage.pm: Commented out logDebug calls
* 2 minutes ago bfce959 -Inc lib/Agua/CLI/Project.pm: Added return if workflow failure in CLI::Project::runProject
* 3 minutes ago fb7df18 -Fix bin/scripts/version.pl: Changed to add local tag after commit so is included in deployed installation

</entry>
<entry [Thu 2014:06:26 09:00:40 EST] AGUA 1-3 [0.8.0-beta.1+build.66] Added quit CLI::Project::runProject on no success _runWorkflow>
	
/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.66 \
--mode 1-3 \
--log 4 \
--message "Removed debug exit in method CLI::Project::runProject"

</entry>
<entry [Thu 2014:06:26 09:00:40 EST] AGUA 1-3 [0.8.0-beta.1+build.65] Removed debug exit in method CLI::Project::runProject>
	
/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.65 \
--mode 1-3 \
--log 4 \
--message "Removed debug exit in method CLI::Project::runProject"

</entry>
<entry [Thu 2014:06:26 09:00:40 EST] AGUA 1-3 [0.8.0-beta.1+build.64] Enabled auto-deploy latest version, added CLI::Project runProject>
	
/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.64 \
--mode 1-3 \
--log 4 \
--message "Enabled auto-deploy latest version, added CLI::Project runProject"

* 16 seconds ago d64e7bb -Dbg lib: Minor changes
* 64 seconds ago 96bbba8 -Inc bin/scripts/version.pl: Enabled input log/printlog
* 3 minutes ago 351cf28 -Inc lib/Queue/Master.pm: Enabled add samplehash to each task
* 5 minutes ago 277bd8a -Inc lib/Agua/Ops/Install.pm: Enable use treeish for latest version if version not defined in gitInstall
* 7 minutes ago 03621e8 -Inc lib/Agua/Common/Util.pm: Added sortByRegex method
* 10 minutes ago 7f73701 -Inc lib/Agua/CLI/Project.pm: Added runProject method
* 13 minutes ago 522614e +Add t/unit: Added send/receive task and topic tests to Exchange, provenance tsv to Queue::Master
	
</entry>
<entry [Thu 2014:06:26 09:00:40 EST] AGUA 1-3 [0.8.0-beta.1+build.63] Enabled add extra to userdata and auto install latest version from bitbucket>
	
/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.63 \
--mode 1-3 \
--log 4 \
--message "Enabled add extra to userdata and auto install latest version from bitbucket"


* 35 seconds ago af4dbc3 -Fix lib/Agua/Ops: Fixed latest version not working with bitbucket
* 76 seconds ago 00ba8ec -Inc lib/Queue/Master.pm: Enabled add 'extra' to userdata script on launch VM
	
	
	
</entry>
<entry [Wed 2014:06:25 21:00:10 EST] AGUA 1-3 [0.8.0-beta.1+build.62] Reenabling Siphon worker executeWorkflow>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.62 \
--mode 1-3 \
--log 4 \
--message "Reenabling Siphon worker executeWorkflow"

* 3 minutes ago d16fa2b -Onw bin/sql/heartbeat.sql,lib/Agua,lib/Queue: Reenabling Siphon worker executeWorkflow


</entry>
<entry [Wed 2014:06:18 15:00:18 EST] AGUA 1-3 [0.8.0-beta.1+build.61] Enabled run workflow on SGE without StarCluster>


/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.61 \
--mode 1-3 \
--log 4 \
--message "Enabled run workflow on SGE without StarCluster"


* 60 seconds ago 894fbc9 -Inc bin/sql,lib/Agua,lib/Virtual/Openstack.pm: Fully enabled SGE without StarCluster
* 2 hours ago 9b68a1a -Fix lib/Queue/Master.pm: Added 'extra' argument to virtual->createConfig call



</entry>
<entry [Wed 2014:06:18 15:00:18 EST] AGUA 1-3 [0.8.0-beta.1+build.60] Enabled SGE sample workflow on command line, renabling host queue listen>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.60 \
--mode 1-3 \
--log 4 \
--message "Enabled SGE sample workflow on command line, renabling host queue listen"

* 2 minutes ago 6b33e7a -Onw lib/Queue,t/unit: Reenabling queue listening from worker hosts
* 2 minutes ago d696640 -Inc lib/Agua/Deploy.pm: Changed default *.ops hubtype to bitbucket
* 3 minutes ago 0497fab -Inc lib/Agua/CLI/Project.pm,lib/Agua/Stage.pm,lib/Agua/Workflow.pm: Enabled run SGE on command line
* 5 minutes ago 254e545 -Inc lib/Agua/Common/Sample.pm,bin/sample/loadSamples.pl: Enabled create custom table and load tsv
* 6 minutes ago 6c91737 -Inc bin/sql: Removed project-specific tables (diffs, sample, samplefile)
* 8 minutes ago 4615f3f +Add bin/sql/sampletable.sql: Holds names of project-specific sample tables
* 18 hours ago b09bacd -Onw lib/Queue,t/unit: Completing Queue::Master autolaunch, onw shutdown
* 19 hours ago 9aa50f7 -Onw lib/Queue/Master.pm: Enabled add/delete nodes, onw node termination
* 19 hours ago ef73042 -Inc bin/sql: Added heartbeat table, edited instance and tenant, and dumped all to file
* 23 hours ago e863f17 -Onw lib/Queue/Master.pm,lib/Virtual: Enabled node add/delete, onw Siphon full automation
* 23 hours ago 6aa46c7 +Add t/unit: Completed tests for Virtual::Openstack
* 27 hours ago f8e04f0 -Fix lib/Queue/Master.pm: Fixed signature of maintainQueue call to setWorkflowStatus
* 27 hours ago 4a15523 -Inc lib/Exchange.pm: Added addIdentifiers subroutine, not yet called


</entry>
<entry [Wed 2014:06:18 15:00:18 EST] AGUA 1-3 [0.8.0-beta.1+build.59] Enabling instance balancing on Openstack>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.59 \
--mode 1-3 \
--log 4 \
--message "Enabling instance balancing on Openstack"

* 5 minutes ago 41dce64 -Onw lib: Enabling Queue::Master autolaunch - balanceInstances done, onw maintainQueues missing 'addIdentifiers'
* 4 hours ago ce31940 -On lib/Queue/Master,lib,bin/scripts/loadTable.pl: Enabling run workflows from flow.pl and completing Queue::Master autolaunch
* 4 hours ago c6ed47a -Del bin/scripts/confluence.pl.safe: Cleanup
* 20 hours ago ef20a90 -Fix lib/Agua/Common/Package/Sync.pm: Fixed blocker missing workflownumber on saveWorkflow


</entry>
<entry [Tue 2014:06:17 16:56:41 EST] AGUA 1-3 [0.8.0-beta.1+build.58] Enabled automated Siphon workflow>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.58 \
--mode 1-3 \
--log 4 \
--message "Enabled automated Siphon workflow"

* 7 hours ago 56b9881 -Inc lib/Queue/Master.pm,t/unit: Almost completed enable autolaunch in Queue::Master
* 19 hours ago 11819b5 -Onw bin/sql,lib,t/unit: Enabling autolaunch in Queue::Master, redid Workflow::runSiphon tests
* 19 hours ago aae6561 +Add lib/Virtual: Moved Openstack::Nova to Virtual::Openstack and added Virtual.pm
* 28 hours ago 2a8b90b -Inc bin/sql: Added instanceid as key in instance table
* 29 hours ago 04f61b1 +Add bin/sql: Added instance table and dumped to agua.dump
*   2 days ago c874b3f Merge branch 'fusion' into 'master'
|\  Conflicts:
| |     lib/Agua/Ops/GitHub.pm
| |     lib/Agua/Ops/Install.pm
| | * 2 days ago a8fa019 -Onw lib/Queue/Master.pm: Enabling fully automated VM start/stop in Queue::Master::manage
| | * 2 days ago b5a77da +Add bin/sql: Added tenant table and dumped
| | * 2 days ago 387294e -Fix lib/Agua/Ops.pm: Fixed failure to load Agua::Ops::Github for non-github 'hubtype'
| | * 2 days ago 928ac7b +Add t/unit/bin/Queue/Master/inputs/duration: Added data for duration tests
| | * 5 days ago 5e96a99 -Onw lib,t/unit/bin: Completed Workflow::executeProject, onw Queue::Master::balanceQueues
| | * 5 days ago a61c5a2 +Add bin/install/resources/openstack/openrc.sh: Openstack openrc.sh file template
| | * 5 days ago 922fc61 +Add t/unit/bin/Queue/Master/inputs/getQueues: Added project status completed then running
| | * 5 days ago 9ef2b57 +Add t/unit/bin/Agua/Workflow/ExecuteProject: Test executeProject method
| | * 5 days ago 4482a83 -Inc lib/Agua/Ops/Install.pm: Added perlmakeInstall method to run 'perl Makefile.PL; make...'
| | * 7 days ago 72a7ddd -Inc .gitattributes: Added .gitignore
| * | 7 days ago 3c5857e -Inc lib/Queue/Master.pm: Before merge autolaunch code
| * | 7 days ago 435bb7a -Fix lib/Agua/Ops*: Restored use Ops::GitHub in Ops


</entry>
<entry [Mon 2014:06:09 11:15:10 EST] AGUA 3-4 [0.8.0-beta.1+build.57] Fixed sample file loading and enabled Git package install using treeish>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.57 \
--mode 3-4 \
--log 4 \
--message "Fixed sample file loading and enabled Git package install using treeish"

* 2 minutes ago 9425366 -Fix bin/sample,lib/Agua/Common/Sample.pm: Fixed loadSampleFiles method output row fields
* 2 minutes ago 33aaa78 -Fix bin/install/resources/agua/biorepository.pm: Removed debug output
* 2 hours ago b997f2a -Fix lib/Agua/Ops*: Enabled use treeish with correct verifyVersion

</entry>
<entry [Mon 2014:06:09 11:15:10 EST] AGUA 1-3 [0.8.0-beta.1+build.57] Fixed sample file loading and enabled Git package install using treeish>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.57 \
--mode 1-3 \
--log 4 \
--message "Fixed sample file loading and enabled Git package install using treeish"

* 2 minutes ago 9425366 -Fix bin/sample,lib/Agua/Common/Sample.pm: Fixed loadSampleFiles method output row fields
* 2 minutes ago 33aaa78 -Fix bin/install/resources/agua/biorepository.pm: Removed debug output
* 2 hours ago b997f2a -Fix lib/Agua/Ops*: Enabled use treeish with correct verifyVersion

</entry>
<entry [Mon 2014:06:09 11:15:10 EST] AGUA 1-3 [0.8.0-beta.1+build.56] Fixed OpsInfo missing hubtype slot>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.56 \
--mode 1-3 \
--log 4 \
--message "Fixed OpsInfo missing hubtype slot"

* 7 hours ago 334f712 -Fix bin/install/resources/agua/biorepository.pm,lib/Agua/Ops/Install.pm: Corrected setConf installdir


</entry>
<entry [Sun 2014:06:08 22:31:32 EST] AGUA 1-3 [0.8.0-beta.1+build.55] Reenabled deploy biorepo>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.55 \
--mode 1-3 \
--log 4 \
--message "Reenabled deploy biorepo"

* 21 seconds ago 1719720 -Fix bin: Removed use lib 'external'
* 63 seconds ago c35ccde -Fix lib/Agua/Common/Database.pm: Deploy fails to connect to db because database is empty
* 3 minutes ago af4dec9 -Fix lib/Agua/Ops/Install.pm: Deploy biorepo failed to find latest version
	
</entry>
<entry [Sun 2014:06:08 22:31:32 EST] AGUA 1-3 [0.8.0-beta.1+build.55] Reenabled deploy biorepo>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.55 \
--mode 1-3 \
--log 4 \
--message "Reenabled deploy biorepo"

* 21 seconds ago 1719720 -Fix bin: Removed use lib 'external'
* 63 seconds ago c35ccde -Fix lib/Agua/Common/Database.pm: Deploy fails to connect to db because database is empty
* 3 minutes ago af4dec9 -Fix lib/Agua/Ops/Install.pm: Deploy biorepo failed to find latest version
	
</entry>
<entry [Sun 2014:06:08 19:59:45 EST] AGUA 1-3 [0.8.0-beta.1+build.54] Implementing full automation of Siphon>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.54 \
--mode 1-3 \
--log 4 \
--message "Implementing full automation of Siphon"


* 2 days ago 1b78198 -Onw lib/Queue,t/unit/lib/Test/Queue/Worker.pm: Enabling 'heartbeat' methods
* 2 days ago 2f0b829 -Inc lib/Agua/Ops,lib/Agua/Deploy.pm: Enabled fetch non-master branches
* 2 days ago c7ce88c -Del bin/sql/dump/root*: Cleanup
* 2 days ago a3bac8c +Add bin/sample,bin/sql/samplefile.sql,lib/Agua/Common/Sample.pm: Enabling load sample IDs and filesizes
* 2 days ago d3b68c2 -Fix lib/Agua/Configure.pm,lib/Agua/DBase/MySQL.pm: Grant 'agua' access to test database
* 13 days ago eaadf7a -Inc t/unit/bin/Agua/Deploy/test.t,lib/Agua/Common: Refactored 'setOpsDir' and completed Agua::Deploy::skel tests
* 13 days ago 1e7519b -Mov t/unit/bin/Agua/Common/Package/Default/test.t: Moved from t/unit/bin/Agua/Common/Package/Default/Default.t
* 13 days ago 685aaba +Add t/unit,t/common,bin/install/deploy.pl,lib/Agua/Deploy.pm: Added 'skel' method to Deploy with tests

	
</entry>
<entry [Sat 2014:05:24 09:50:59 EST] AGUA 1-3 [0.8.0-beta.1+build.53] Changed Worker::sendTopic mode to 'updateJobStatus'>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.53 \
--mode 1-3 \
--log 4 \
--message "Changed 'SHOWLOG' to 'log', updating exchange"

	

*   42 seconds ago 08e04a8 -Mrg all: Merge branch 'exchange' into 'master'
|\  
| |   
| * 3 minutes ago 5fc93e2 -Del t/unit/html/plugins/workflow/history/workflow.filemanager.html: Cleaned up
| |   
| * 4 minutes ago 1efc7d8 -Fix all: Changed showlog to log
| |   
| * 3 days ago eaf4cc9 -Onw html/plugins,lib/Agua/Common/History.pm,t/integration: Enabling exchange in workflow History panel
| |   
| * 4 days ago a5ef27b -Inc html,lib,t/integration: Enabled server push getData with integration tests
| |   
| * 4 days ago 1629a2d +Mov bin/daemon/node-amqp: Moved from /agua/apps/node-amqp and fixed duplicate messages in RabbitJS
| |   
| * 4 days ago 2e57a1c -Del apps/node-amqp: Moved to bin/daemon/node-amqp
| |   
| * 4 days ago e70ce0c +Add bin/daemon/https,bin/daemon/node-amqp: Moved over from /agua/apps - all daemons together
| |     
| *   7 days ago e68260a Merge branch 'exchange' of github.com:syoung/aguadev into exchange
| |\  Conflicts:
| | |   lib/Agua/Common/Exchange.pm
| | |   lib/Exchange.pm
| | |   lib/Logger.pm
| | |   t/integration/bin/Agua/Common/Login/test.t
| | |   t/unit/bin/Agua/Common/Login/Login.t
| | |   t/unit/bin/Agua/Common/Login/test.t
| | |    
| | * 9 days ago 3313312 +Add t/unit/lib/Test/Exchange.pm:  Basic Exchange tests - open/closeConnection, sendData
| | |    
| | * 9 days ago 54bf9dc -Inc lib/Exchange.pm,t/integration/lib/Test/Agua/Common/Login.pm: Enabling submitLogin integration test
| | |    
| | * 9 days ago 68dedf4 +Add bin/daemon: Added from master branch
| | |    
| | * 10 days ago 1248b1b +Add all: Merged from master Exchange, Openstack, Synapse, demonisation scripts, etc.
| | |    
| * | 7 days ago 64b3046 -Inc bin,lib,t: Enabled Queue::Daemon integration test with Login::submitLogin
| | |    
| * | 7 days ago e5d1c03 +Add t/integration/lib/Test/Queue/Daemon.pm: First integration test - Agua::Common::Login::submitLogin
| | |    
| * | 7 days ago fdb8608 +Add t/unit/lib/Test/Mock/Exchange.pm: Stub mocked Exchange module
| | |    
| * | 7 days ago d429640 +Add t/integration/bin/Queue/Daemon: Integration test for Agua::Common::Login::submitLogin
| | |      
| * |   9 days ago 2368457 Merge branch 'master' into exchange
| |\ \  Conflicts:
| | | |         bin/queue/emit
| | | |         lib/Agua/Common/Exchange.pm
| | | |         lib/Exchange.pm
| | | |         lib/Queue/Daemon.pm
| | | |     
| * | | 9 days ago e3ce9f9 -Inc lib/Exchange.pm,t/unit/lib/Test/Queue/Daemon.pm: Enabling test Daemon
| | | |     
| * | | 9 days ago ceb05d5 +Add t/unit/lib/Test/Queue/Daemon.pm: Enabling test Queue/Daemon.pm
| | | |     
| * | | 9 days ago 0025055 -Onw lib: Enabling test of Queue/Daemon.pm and Exchange.pm
| | | |     
| * | | 9 days ago 4265b1f +Add t/unit/lib/Test/Exchange.pm:  Basic Exchange tests - open/closeConnection, sendData
| | | |     
| * | | 9 days ago 9a0c0b9 -Inc lib/Exchange.pm,t/integration/lib/Test/Agua/Common/Login.pm: Enabling submitLogin integration test
| | | |     
| * | | 9 days ago b411d4a +Add bin/daemon: Added from master branch
| | | |     
| * | | 10 days ago 4bfbf12 +Add all: Merged from master Exchange, Openstack, Synapse, demonisation scripts, etc.
| | |/  
| |/|   
| | |    
| * | 10 days ago f95e152 +Add bin/queue,lib/Queue: Merged from master, plus created bin/queue/socket.pl
| | |    
* | | 32 hours ago 262be26 -Inc lib/Agua/PreInstall.pm: Commented out puppet install
| |/  
|/|   
| |   
* | 2 weeks ago efd9d89 [0.8.0-beta.1+build.52] Changed Worker::sendTopic mode to 'updateJobStatus'

</entry>
<entry [Tue 2014:05:06 18.52:26 EST] AGUA 1-3 [0.8.0-beta.1+build.52] Changed Worker::sendTopic mode to 'updateJobStatus'>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.52 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Changed Worker::sendTopic mode to 'updateJobStatus'"


</entry>
<entry [Tue 2014:05:06 18:51:26 EST] AGUA 1-3 [0.8.0-beta.1+build.51] Changed provenance table to use unitary 'time' field>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.51 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Changed provenance table to use unitary 'time' field"

* 7 minutes ago 0b62854 -Inc lib/Agua/Stage.pm,lib/Queue,t/unit/bin: Changed Worker and Stage to conform to new provenance table, reenabled all tests
* 8 minutes ago 9ad0c0e -Inc t/unit/bin,t/unit/lib/Test/Agua/Common/Timer.pm: Added 'datetimeToMysql' test
* 9 minutes ago bac6ef7 -Inc lib/Agua/CLI/Stage.pm: Added 'version' and 'installdir' slots
* 10 minutes ago cf28143 -Inc bin/sql: Changed provenance datetime fields to unitary 'time' field and dumped



</entry>
<entry [Tue 2014:05:06 18:51:26 EST] AGUA 1-3 [0.8.0-beta.1+build.50] Fixed Agua::Stage::run regex for exports file>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.50 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Fixed Agua::Stage::run regex for exports file"


* 72 seconds ago 5b1fc98 -Fix lib/Agua/Stage.pm,lib/Queue/Worker.pm: Fixed Stage::run regex for exports file


</entry>
<entry [Tue 2014:05:06 18:51:26 EST] AGUA 1-3 [0.8.0-beta.1+build.49] Adapted Agua::Stage to extract ENVAR exports from file>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.49 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Adapted Agua::Stage to extract ENVAR exports from file"


* 52 seconds ago 374a818 -Inc t/unit/bin/Agua/Stage/test.t: Set to 4 tests
* 3 minutes ago c3b2614 +Add t/unit/bin/Agua/Stage: Added Agua::Stage::getFileExports to fix sourcing proglem


</entry>
<entry [Tue 2014:05:06 18:51:26 EST] AGUA 1-3 [0.8.0-beta.1+build.48] Added logfile to new Agua::Workflow in Worker::handleTask>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.48 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Added logfile to new Agua::Workflow in Worker::handleTask"


* 2 minutes ago 0390079 -Inc lib/Exchange.pm,lib/Queue: Reduced new connection sleep, added logfile to new Workflow in Worker.pm

</entry>
<entry [Tue 2014:05:06 18:51:26 EST] AGUA 1-3 [0.8.0-beta.1+build.47] Removed debug code in Queue::Master>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.47 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Removed debug code in Queue::Master"



</entry>
<entry [Tue 2014:05:06 18:51:26 EST] AGUA 1-3 [0.8.0-beta.1+build.46] Changed Master::updateQueueSamples to update rather than add>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.46 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Changed Master::updateQueueSamples to update rather than add"

* 85 seconds ago 8f038cf -Fix lib/Queue: Added test for fixed Master::updateQueueSamples, added mode 'updateHostStatus' in Worker::sendTopic


</entry>
<entry [Tue 2014:05:06 18:51:26 EST] AGUA 1-3 [0.8.0-beta.1+build.45] Minor fixes for Master/Worker, added Project::CLI::delete method>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.45 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Minor fixes for Master/Worker, added Project::CLI::delete method"


* 34 seconds ago 12e5ac3 -Inc lib/Queue,lib/Synapse.pm, t/unit: Minor refactoring, method name changes
* 2 minutes ago a3c3e18 -Onw lib/Agua/CLI/Project,t/unit: Added delete method, onworking tests


</entry>
<entry [Tue 2014:05:06 18:51:26 EST] AGUA 1-3 [0.8.0-beta.1+build.44] Linked Synapse with queuesamples table>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.44 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Linked Synapse with queuesamples table"

* 38 seconds ago 8981593 -Inc lib/Queue: Minor refactoring of Master.pm and Worker.pm
* 32 minutes ago 3785eb4 -Inc bin/Queue,lib/Queue,t/unit: Completed tests of Queue::Master::updateSamples
* 33 minutes ago 423ed9e -Fix bin/sql/dump/agua: Fixed incorrect dump of 'aguadev' not 'agua' tables
* 84 minutes ago 8784fbd -Fix lib/Synapse.pm: Fixed Synapse finding python and pythonpath
 Added synapse:python and synapse:pythonpath to config.yaml


</entry>
<entry [Tue 2014:05:06 18:51:26 EST] AGUA 1-3 [0.8.0-beta.1+build.43] Added to 'provenance' table fields: stdout, stderr>

/agua/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.43 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Added to 'provenance' table fields: stdout, stderr"

	
</entry>
<entry [Tue 2014:05:06 15:26:50 EST] AGUA 1-3 [0.8.0-beta.1+build.42] Added to db dump tables: queue, queuesample, provenance>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.42 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Added to db dump tables: queue, queuesample, provenance"

* 56 seconds ago 8820ebb +Add bin/sql/dump/agua: Added tables: queue, queuesample, provenance
* 16 hours ago 71c82fc -Fix lib/Queue/Master.pm,lib/Queue/Worker.pm: Enabled Download workflow.


</entry>
<entry [Mon 2014:05:05 20:36:19 EST] AGUA 1-3 [0.8.0-beta.1+build.41] Renamed 'manager' to 'master' and 'task' to 'worker'>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.41 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Renamed 'manager' to 'master' and 'task' to 'worker'"


* 59 seconds ago 1754642 -Mov bin/daemon,bin/install/resources/agua,lib/Queue: Moved manager -> master, task -> worker

	
</entry>
<entry [Mon 2014:05:05 11:19:44 EST] AGUA 1-3 [0.8.0-beta.1+build.40] Enabled job scheduler and feedback reporting channels>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.40 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Enabled job scheduler and feedback reporting channels"


* 6 hours ago 94cd6d8 -Inc bin/sql/provenance.sql,lib,t/unit/bin/Queue/Task: Enabled all automated tests (to do: synapse integration)
* 21 hours ago 9f74fdd -Inc lib/Agua/Workflow.pm,lib/Queue/Task.pm: Completed enabling Task::handleTask call to Workflow::sendTopic
* 22 hours ago e3d8d22 -Onw lib/Agua: Stabilised Task::sendTopic call within Task::receiveTask
| Replaced fork with Coro::async::pool in Task::receiveTask channel->consume
* 2 days ago 3877079 -Inc lib/Queue/Task.pm: Enabled call Agua::Worker::sendTopic from Queue:Task::handleTask
| Used two forks:
| - Queue::Task::receiveTask channel->consume subroutine: &", $self->handler($this, $body)
| - Queue::Task::handleTask: $self->execute($data)
* 2 days ago 7e7019c -Onw lib: Fixing block inside receiveTask event loop - working for first iteration
* 2 days ago 0db70a8 -Onw bin,lib,t: Working state for Task::sendTopic after Task::handleTask
* 3 days ago c2688e5 -Onw lib,t/unit: Enabling sendTopic from worker and receiveTopic on manager

</entry>
<entry [Tue 2014:04:22 06:59:03 EST] AGUA 1-3 [0.8.0-beta.1+build.39] Fixed Agua daemon start on boot>

/aguadev/bin/scripts/stager.pl (), "\
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.39 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Enabling queue scheduler"

* 77 seconds ago b601e02 +Inc lib,t/unit: Enabled run syoung.PanCancer.Align by Queue::Manager and Queue::Task
* 3 hours ago 713446f +Inc lib,t/unit/bin/Queue: Enabled executeWorkflow with correct exitcode check
* 26 hours ago 0a7535e +Add bin,lib,t: Added with tests task daemon, enabling Queue::Manager
* 26 hours ago 5ee856c +Add bin/install: Added task daemon configs
* 26 hours ago fcaf151 +Inc bin/sql: Updated dump with added queue and provenance tables
* 26 hours ago b1a65ea -Dbg bin/sql/*~: Cleanup
* 26 hours ago a49185d -Mov: lib/Exchange.pm: Moved from lib/Agua/Common/Exchange, all tests also moved
* 26 hours ago 6ccbbd2 +Del apps/perl: Removed Perl after testing showed not a practical option
* 26 hours ago 6f0510d +Del lib/external: Removed 'externals' after testing showed not a practical option
* 4 days ago 81265bd -Inc bin,lib: All tests completed for CLI save/saveWorkflow
* 4 days ago 5516d38 -Inc t/unit/lib/Test: Enabled CLI::Project in cli/flow.pl
* 4 days ago d3d01cd +Inc bin/cli/flow.pl: Added CLI::Project, enabled save/saveWorkflow methods
* 4 days ago 256718e +Add lib/Agua/CLI/Util.pm: Refactored common CLI methods into Util.pm
* 4 days ago a4b1e02 +Add t/unit/bin/Agua/CLI/Project: Tests completed for CLI save/saveWorkflow

</entry>
<entry [Tue 2014:04:22 06:59:03 EST] AGUA 1-3 [0.8.0-beta.1+build.38] Fixed Agua daemon start on boot>

aperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.38 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Fixed Agua daemon start on boot"

* 65 seconds ago 57e29ae -Fix bin/daemon/agua: Agua daemon failed to start on boot

</entry>
<entry [Tue 2014:04:22 06:59:03 EST] AGUA 1-3 [0.8.0-beta.1+build.37] Changed exchange 'masterip' to 'host' in config.yaml>

aperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.37 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Changed exchange 'masterip' to 'host' in config.yaml"

EDITED Exchange.pm

* 27 hours ago ec65f53 -Inc lib/Agua,lib/Synapse.pm: Minor fixes


</entry>
<entry [Tue 2014:04:22 06:59:03 EST] AGUA 1-3 [0.8.0-beta.1+build.36] Enabled basic monitoring messaging system with daemon>

aperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.36 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Enabled basic monitoring messaging system with daemon"


* 2 minutes ago a8e77fd -Inc lib/Agua,lib/Queue,lib/Synapse: Changing supporting Queue::Monitor
* 4 minutes ago 9a824aa +Add lib/Queue/Monitor.pm: Enabled systemCommand method, unified connections for all Exchange users
* 6 minutes ago 280840c -Dbg t/unit/bin/Agua/Common/Exchange/inputs: Changed authentication for emit and rreceive
* 7 minutes ago 3ed1b48 -Mov bin/cli/flow.pl: Moved from bin/logic/flow.pl


</entry>
<entry [Tue 2014:04:22 06:59:03 EST] AGUA 1-3 [0.8.0-beta.1+build.35] Changed Synapse installation info in config.yaml>

aperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.35 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Changed Synapse installation info in config.yaml"


</entry>
<entry [Tue 2014:04:22 06:59:03 EST] AGUA 1-3 [0.8.0-beta.1+build.34] Fixed duplicate messages and loaded all modules>

aperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.34 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Fixed duplicate messages and loaded all modules"

* 48 seconds ago 7a8a832 +Fix all: Changed from SHOWLOG to showlog, PRINTLOG to printlog	
* 3 hours ago 78f6f6c -Inc lib/Queue/Daemon.pm: Fixed duplicate exchange message and restored to load all modules
* 3 hours ago 8c6486d +Inc apps/rabbit.js,lib/Agua/Common/Exchange.pm,lib/Queue/Daemon.pm - Enabled ignore if identical process id


</entry>
<entry [Tue 2014:04:22 02:06:42 EST] AGUA 1-3 [0.8.0-beta.1+build.33] Enabled deploy.pl --biorepo and --install>

aperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.33 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Enabled deploy.pl --biorepo and --install"

	
* abbc91a (HEAD, master) -Fix lib/Agua/Deploy,lib/Agua/Ops,lib/Queue/Daemon.pm: Enabled deploy --biorepo and --install
* b68cbf0 +Add t/unit/bin/Agua/Common/Exchange/inputs: Added 'emit' and 'receive', also with bash aliases


</entry>
<entry [Mon 2014:04:21 20:02:46 EST] AGUA 1-3 [0.8.0-beta.1+build.32] Added packaged perl 5.18.2>

agperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.32 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Added packaged perl 5.18.2"

	
</entry>
<entry [Mon 2014:04:21 20:02:46 EST] AGUA 1-3 [0.8.0-beta.1+build.31] Fixed paths in agua and rabbitjs install.sh files>

agperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.31 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Fixed paths in agua and rabbitjs install.sh files"

	
</entry>
<entry [Sun 2014:04:20 17:46:38 EST] AGUA 1-3 [0.8.0-beta.1+build.30] Added /usr/bin/rabbitjs executable>

agperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.30 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Added /usr/bin/rabbitjs executable"


* 28 seconds ago 5cc08c0 -Inc bin/install/resources: Cleaned up agua and rabbitjs upstart files
|  
* 50 seconds ago 8c17cd4 +Add bin/daemon/rabbitjs: Script to call RabbitJs with node

	
</entry>
<entry [Sun 2014:04:20 17:46:38 EST] AGUA 1-3 [0.8.0-beta.1+build.29] Enabled daemon getData and daemonised with upstart>

agperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.29 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Enabled daemon getData and daemonised with upstart"
	
</entry>
<entry [Sun 2014:04:20 17:46:38 EST] AGUA 1-3 [0.8.0-beta.1+build.28] Working Agua daemon -- RabbitJS+Node queue-based exchange>

agperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.28 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Working Agua Daemon -- RabbitJS+Node queue-based exchange"
	
</entry>
<entry [Sun 2014:04:20 17:46:38 EST] AGUA 1-3 [0.8.0-beta.1+build.27] Enabling Exchange queue-based communication between hosts>

agperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.27 \
--mode 1-3 \
--SHOWLOG 4 \
--message "Enabling Exchange queue-based communication between hosts"
	
</entry>
<entry [Sun 2014:04:20 08:30:09 EST] AGUA 3-4 [0.8.0-beta.1+build.26] Enabling sample tracking>

agperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.26 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Enabling sample tracking"
	
</entry>
<entry [Sun 2014:04:20 08:12:04 EST] AGUA 2-3 [0.8.0-beta.1+build.26] Enabling sample tracking>

agperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.26 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Enabling sample tracking"
	
	
</entry>
<entry [Fri 2014:04:18 20:40:45 EST] AGUA 1-2 [0.8.0-beta.1+build.26] Enabling sample tracking>

agperl /aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.26 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Enabling sample tracking

* 20 minutes ago eed61a8 -Onw lib/Synapse.pm,lib/Openstack/Nova.pm: Enabling sample tracking, adding tools for PanCancer management and monitoring
* 20 minutes ago a8f4175 -Del lib/Conf.old: Cleaned up
* 46 minutes ago af0a28d +Add bin/queue: Added restart.pl and synapse.pl
* 46 minutes ago b04c1f1 +Add bin/openstack: Added cluster.pl, config.pl and volume.pl
* 32 hours ago 0742334 -Onw lib/Openstack/Nova.pm: Enabling 'command' method

"
	

</entry>
<entry [Fri 2014:04:18 20:40:45 EST] AGUA 3-4 [0.8.0-beta.1+build.25] Adding PanCancer project tools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.25 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Adding PanCancer project tools"
	


</entry>
<entry [Fri 2014:04:18 20:40:16 EST] AGUA 2-3 [0.8.0-beta.1+build.25] Adding PanCancer project tools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.25 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Adding PanCancer project tools"
	
	
</entry>
<entry [Fri 2014:04:18 20:39:36 EST] AGUA 1-2 [0.8.0-beta.1+build.25] Adding PanCancer project tools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.25 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Adding PanCancer project tools

* 24 minutes ago 1267b9f -Inc lib: Cleaned up docs in Openstack/Nova.pm and Queue/Manager.pm
* 74 minutes ago 35f9e1a -Onw lib/Openstack/Nova.pm: Adding 'command' and 'list' methods
* 75 minutes ago f621640 +Add t/unit/bin/PanCancer/Main: Beginning tests for PanCancer::Main and PanCancer::QC
* 76 minutes ago de8f465 +Add lib/Synapse.pm: Make calls to synapse to get and put info
* 76 minutes ago 7a440e3 +Add bin/sql/sample.sql: Basic sample tracking fields

"

</entry>
<entry [Tue 2014:04:15 19:49:02 EST] AGUA 3-4 [0.8.0-beta.1+build.24] Enabling Openstack node deployment and management>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.24 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Enabling Openstack node deployment and management"

</entry>
<entry [Tue 2014:04:15 19:49:02 EST] AGUA 2-3 [0.8.0-beta.1+build.24] Enabling Openstack node deployment and management>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.24 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Enabling Openstack node deployment and management"

</entry>
<entry [Tue 2014:04:15 19:48:41 EST] AGUA 1-2 [0.8.0-beta.1+build.24] Enabling Openstack node deployment and management>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.24 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Enabling Openstack node deployment and management

* 2 minutes ago d6027da -Inc lib/Openstack,lib/Queue,t/unit: Enabled restart.pl and volume.pl in PanCancer repo
* 11 hours ago 02f79aa -Inc lib/Openstack,lib/Queue,t/unit/bin: Enabled status, exited methods for controlled node shutdown
* 18 hours ago c4c800e -Del bin/gtrepo,lib/GT,lib/PanCancer,t: Moved GT and PanCancer plus tests to bioapps
* 18 hours ago c4f8f2c -Inc bin,t: Added use lib for 'lib/external' Perl modules
* 18 hours ago c83e0b5 +Add lib/external: First add of all non-core Perl dependencies
* 18 hours ago 1e870ff -Inc .gitignore: Excluded bin/install/resources/agua/setup.log
* 7 days ago f860c1e +Add lib/external: Added 'external' library of pre-installed Perl modules
"

</entry>
<entry [Sat 2014:04:05 22:25:07 EST] AGUA 3-4 [0.8.0-beta.1+build.23] Added gtfuse.pl>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.23 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Added gtfuse.pl"

</entry>
<entry [Sat 2014:04:05 22:24:55 EST] AGUA 2-3 [0.8.0-beta.1+build.23] Added gtfuse.pl>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.23 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Added gtfuse.pl"

</entry>
<entry [Sat 2014:04:05 22:18:37 EST] AGUA 1-2 [0.8.0-beta.1+build.23] Added gtfuse.pl>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.23 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Added gtfuse.pl

* 2 hours ago 795dab4 -Inc bin/gtrepo/gtfuse.pl,lib/GT/Fuse.pm: Added -u flag to unmount
* 3 hours ago 8354a9e -Inc bin/gtrepo/gtfuse.pl: Changed log to unique name- gtfuse-", ", $self->self->$.log
* 3 hours ago 730dd9a -Inc bin/gtrepo/gtfuse.pl: Removed duplicate notification when no gtrepo provided
* 3 hours ago eedf0ec -Inc bin/gtrepo/gtfuse.pl: Completed - all tests ok
* 6 hours ago 12d7fc1 -Inc bin/gtrepo/gtfuse.pl: Added keyfile parameter
* 7 hours ago f87e300 -Inc lib/GT/Fuse.pm,t/unit: Completed GT::Fuse with tests
* 15 hours ago 03a3b54 -Onw  t/unit/lib/Test/GT/Fuse.pm: Ongoing tests
* 15 hours ago 297a6f4 -Onw lib/GT/Fuse.pm,t/unit/bin/GT: Completed testing GT::Fuse::mount method, onw rest of tests
* 16 hours ago 21b90c3 -Inc .gitignore: Ignore t/.../outputs folder contents except .dummy
* 33 hours ago c36e2e9 +Add bin,lib,t: Copied GT::Fuse and tests from exchange branch
"

</entry>
<entry [Sat 2014:04:05 22:22:42 EST] [0.8.0-beta.1+build.22] Enabled biotools v5 installs and package table keys>

* 6 days ago 1efe1bf [0.8.0-beta.1+build.22] Enabled biotools v5 installs and package table keys
| * 17 seconds ago c8c37bc +Inc bin/sql/dump,t/unit: New dump after add version to package table
| * 4 minutes ago 12f4ad2 +Inc lib/Agua/Ops/Install.pm: Fixed all biotools installs
| * 9 days ago 99781eb -Fix lib/Agua/Common/Users.pm: Removed apacheuser in method _addLinuxUser
* 6 days ago c8c37bc +Inc bin/sql/dump,t/unit: New dump after add version to package table
* 6 days ago 12f4ad2 +Inc lib/Agua/Ops/Install.pm: Fixed all biotools installs
* 2 weeks ago 99781eb -Fix lib/Agua/Common/Users.pm: Removed apacheuser in method _addLinuxUser

	
</entry>
<entry [Mon 2014:03:31 02:30:48 EST] exchange BRANCH: Enabled Exchange submitLogin and task queues for bioapps Shepherd::Queue>


* 7 minutes ago ab429c1 +Inc lib/Agua/Common/Exchange.pm: Added sentTask and handleTasks methods
* 26 hours ago c307fee +Inc lib/Agua/Ops/Install.pm,lib/Agua/Common/Exchange.pm: Fixed all biotools installs
* 2 days ago 17cc7d5 +Inc bin/sql/dump,t/unit: New dump after add version to package table, reenabled Login.js and Login.pm tes
* 3 days ago 450276b -Onw cgi-bin/aguad,html/plugins,lib,t/unit: Enabled Exchange-based submitLogin and tests
| Created t/unit/html/plugins/login/submit tests
| Checks Login.handleResponse and fire of Agua.startPlugins
* 4 days ago b8bd421 -Onw cgi-bin,html,lib,t/unit/lib: Enabling submitLogin using Exchange
* 4 days ago 6476c60 +Add cgi-bin/aguad: Agua daemon
* 10 days ago 99781eb -Fix lib/Agua/Common/Users.pm: Removed apacheuser in method _addLinuxUser
"

</entry>
<entry [Sat 2014:03:22 05:57:39 EST] AGUA 3-4 [0.8.0-beta.1+build.21] Replaced aguadev with agua in default config.yaml>

/aguadev/bin/scripts/stager.pl (), "(), "\
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.21 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Replaced aguadev with agua in default config.yaml"

</entry>
<entry [Sat 2014:03:22 05:56:44 EST] AGUA 2-3 [0.8.0-beta.1+build.21] Replaced aguadev with agua in default config.yaml>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.21 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Replaced aguadev with agua in default config.yaml"

</entry>
<entry [Fri 2014:03:21 23:45:16 EST] AGUA 1-2 [0.8.0-beta.1+build.21] Replaced aguadev with agua in default config.yaml>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.21 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Replaced aguadev with agua in default config.yaml

* 44 seconds ago 0df9d69 -Fix bin/install/resources/agua/conf/config.yaml: Changed aguadev to agua
"

</entry>
<entry [Fri 2014:03:21 23:47:25 EST] AGUA 3-4 [0.8.0-beta.1+build.20] Fixed Ops::Install download install and added mutect binary download in biotools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.20 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Fixed Configure.pm error and Centos install resources"

</entry>
<entry [Fri 2014:03:21 23:46:14 EST] AGUA 2-3 [0.8.0-beta.1+build.20] Fixed Ops::Install download install and added mutect binary download in biotools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.20 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Fixed Configure.pm error and Centos install resources"

</entry>
<entry [Fri 2014:03:21 23:45:16 EST] AGUA 1-2 [0.8.0-beta.1+build.20] Fixed Ops::Install download install and added mutect binary download in biotools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.20 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Fixed Configure.pm error and Centos install resources

* 6 hours ago 31be7cf -Onw bin,html,lib: Updated centos.sh, Exchange.js, Request.js, and lib/Agua/Install/* files
* 6 hours ago 145c89b -Fix lib/Agua/Configure.pm: Fixed 'testuserpassword' variable
* 6 hours ago 1a5868e -Onw apps/node-amqp/node_modules/rabbit.js/example/socketio/server.js: Enabling CGI
* 4 days ago 4370732 -Fix apps/node-amqp/node_modules/rabbit.js/example/socketio/server.js: Converted to HTTPS
* 6 days ago 1e59412 -Fix .gitignore: Added correct bin/install/resources/apache2/centos/conf
* 6 days ago 5d4fc23 -Inc .gitignore: Added to repo bin/install/resources/apache2/conf
"

</entry>
<entry [Tue 2014:03:11 02:35:00 EST] AGUA 3-4 [0.8.0-beta.1+build.19] Fixed Ops::Install download install and added mutect binary download in biotools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.19 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Fixed Ops::Install download install and added mutect binary download in biotools"

</entry>
<entry [Tue 2014:03:11 02:34:24 EST] AGUA 2-3 [0.8.0-beta.1+build.19] Fixed Ops::Install download install and added mutect binary download in biotools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.19 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Fixed Ops::Install download install and added mutect binary download in biotools"

</entry>
<entry [Tue 2014:03:11 02:34:13 EST] AGUA 1-2 [0.8.0-beta.1+build.19] Fixed Ops::Install download install and added mutect binary download in biotools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.19 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Fixed Ops::Install download install and added mutect binary download in biotools

* 75 seconds ago 302f44b -Fix lib/Agua: Fixed Ops::Install::downloadInstall, added Configure method setTestUser

"

</entry>
<entry [Mon 2014:03:10 16:59:44 EST] AGUA 3-4 [0.8.0-beta.1+build.18] Fixed Ops::Install for biotools v4>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.18 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Fixed Ops::Install for biotools v4"

</entry>
<entry [Mon 2014:03:10 16:59:44 EST] AGUA 2-3 [0.8.0-beta.1+build.18] Fixed Ops::Install for biotools v4>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.18 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Fixed Ops::Install for biotools v4"

</entry>
<entry [Mon 2014:03:10 16:59:44 EST] AGUA 1-2 [0.8.0-beta.1+build.18] Fixed Ops::Install for biotools v4>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.18 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Fixed Ops::Install for biotools v4"

</entry>
<entry [Mon 2014:03:10 02:11:31 EST] AGUA 3-4 [0.8.0-beta.1+build.17] Reenabled default install using public Agua biorepository>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.17 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Reenabled  default install using public Agua biorepository"
	
</entry>
<entry [Mon 2014:03:10 02:11:06 EST] AGUA 2-3 [0.8.0-beta.1+build.17] Reenabled default install using public Agua biorepository>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.17 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Reenabled  default install using public Agua biorepository"
	
</entry>
<entry [Mon 2014:03:10 02:11:00 EST] AGUA 1-2 [0.8.0-beta.1+build.17] Reenabled default install using public Agua biorepository>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.17 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Reenabled  default install using public Agua biorepository

* 57 seconds ago de.1769 -Fix lib/Agua,bin/install/resources/agua/biorepository.pm: Enabled install default 'Agua' repo w/o pmfile
* 34 minutes ago 18e5152 -Fix lib/Agua: Commented out all password logDebug output
"
	
</entry>
<entry [Mon 2014:03:10 02:10:54 EST] AGUA 3-4 [0.8.0-beta.1+build.16] Enabled install biotools v4>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.16 \
--mode 3-4 \
--SHOWLOG 4 \
--message "Enabled install biotools v4 with tests"
	
</entry>
<entry [Mon 2014:03:10 02:10:48 EST] AGUA 2-3 [0.8.0-beta.1+build.16] Enabled install biotools v4>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.16 \
--mode 2-3 \
--SHOWLOG 4 \
--message "Enabled install biotools v4 with tests"
	
</entry>
<entry [Mon 2014:03:10 02:10:39 EST] AGUA 1-2 [0.8.0-beta.1+build.16] Enabled install biotools v4>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.16 \
--mode 1-2 \
--SHOWLOG 4 \
--message "Enabled install biotools v4 with tests

* 2 minutes ago e01dc27 -Fix lib/Agua/Ops/Install.pm: Completed install of all biotools v4 apps with tests
* 20 hours ago 3f4e173 -Onw html/plugins/request/Downloads.js: Enabling Request pane download method test
* 20 hours ago e3a6145 -Fix lib/Agua: Enabled test.t with Ops::Install, fixed Install::Https
"
	
</entry>
<entry [Wed 2014:03:05 11:55:05 EST] AGUA 3-4 [0.8.0-beta.1+build.15] Fixed getPackages failure and Login CSS>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.15 \
--mode 3-4 \
--message "Fixed Install::Exchange runCommands syntax" \
--SHOWLOG 4

</entry>
<entry [Thu 2014:03:06 15:01:39 EST] AGUA 2-3 [0.8.0-beta.1+build.15] Fixed getPackages failure and Login CSS>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.15 \
--mode 2-3 \
--message "Fixed Install::Exchange runCommands syntax" \
--SHOWLOG 4

</entry>
<entry [Wed 2014:03:05 11:55:05 EST] AGUA 1-2 [0.8.0-beta.1+build.15] Fixed getPackages failure and Login CSS>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.15 \
--mode 1-2 \
--message "Fixed Install::Exchange runCommands syntax" \
--SHOWLOG 4

</entry>
<entry [Wed 2014:03:05 12:00:12 EST] AGUA 3-4 [0.8.0-beta.1+build.14] Fixed getPackages failure and Login CSS>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.14 \
--mode 3-4 \
--message "Fixed getPackages failure and Login CSS" \
--SHOWLOG 4

</entry>
<entry [Wed 2014:03:05 11:59:32 EST] AGUA 2-3 [0.8.0-beta.1+build.14] Fixed getPackages failure and Login CSS>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.14 \
--mode 2-3 \
--message "Fixed getPackages failure and Login CSS" \
--SHOWLOG 4

</entry>
<entry [Wed 2014:03:05 11:55:05 EST] AGUA 1-2 [0.8.0-beta.1+build.14] Fixed getPackages failure and Login CSS>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.14 \
--mode 1-2 \
--message "Fixed getPackages failure and Login CSS

69 seconds ago 7c41d40 -Fix html/plugins,lib/Agua/Ops/Install.pm: Fixed missing 'owner' field in getPackages, reenabled Login CSS box shadow
" \
--SHOWLOG 4

</entry>
<entry [Wed 2014:03:05 05:33:29 EST] AGUA 3-4 [0.8.0-beta.1+build.13] Updated Deploy and Install, added better dependency handling>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.13 \
--mode 3-4 \
--message "Updated Deploy and Install, added better dependency handling" \
--SHOWLOG 4

</entry>
<entry [Wed 2014:03:05 05:33:29 EST] AGUA 2-3 [0.8.0-beta.1+build.13] Updated Deploy and Install, added better dependency handling>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.13 \
--mode 2-3 \
--message "Updated Deploy and Install, added better dependency handling" \
--SHOWLOG 4

</entry>
<entry [Wed 2014:03:05 05:33:29 EST] AGUA 1-2 [0.8.0-beta.1+build.13] Updated Deploy and Install, added better dependency handling>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.13 \
--mode 1-2 \
--message "Updated Deploy and Install, added better dependency handling

* 7 minutes ago f0635fc +Add t/unit/html/plugins/packages: Added with grunt and QUnit tests
* 9 minutes ago 498e997 -Inc lib/Agua/Deploy.pm,lib/Agua/Ops*: Completed mutect, bamtools and java ins
* 5 days ago 9f943c9 -Onw html/plugins,t/unit/html/plugins/apps: Renabling Packages panel in Apps pane
* 5 days ago a1c6383 -Fix lib/Agua: Changed Deploy, Ops::Install to install biorepository, onw Exchang
* 5 days ago 654ff1d -Fix bin/install/resources/node/init/rabbitjs: Changed from /usr/local/bin to /us
* 5 days ago 85d61b2 +Add bin/install/resources/agua: Added biorepository.pm and *.ops
* 8 days ago 6474c2d +Add t/unit/html/plugins/apps/packages: Test Apps pane Packages panel
* 8 days ago 577e71b -Fix bin/install/resources/puppet/bootstrap: Replaced librarian-puppet with 'pupp

" \
--SHOWLOG 4

</entry>
<entry [Fri 2014:01:31 18:28:06 EST] AGUA 3-4 [0.8.0-beta.1+build.13] Updated biorepository installation>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.13 \
--mode 3-4 \
--message "Updated biorepository installation"

</entry>
<entry [Fri 2014:01:31 18:28:06 EST] AGUA 2-3 [0.8.0-beta.1+build.13] Updated biorepository installation>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.13 \
--mode 2-3 \
--message "Updated biorepository installation"

</entry>
<entry [Fri 2014:01:31 18:28:06 EST] AGUA 1-2 [0.8.0-beta.1+build.13] Updated biorepository installation>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.13 \
--mode 1-2 \
--message "Updated biorepository installation"

</entry>
<entry [Fri 2014:01:31 18:28:06 EST] AGUA 3-4 [0.8.0-beta.1+build.12] Enabled automated installation of packages and dependencies>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.12 \
--mode 3-4 \
--message "Enabled automated installation of packages and dependencies"
    
</entry>
<entry [Fri 2014:01:31 18:28:06 EST] AGUA 2-3 [0.8.0-beta.1+build.12] Enabled automated installation of packages and dependencies>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.12 \
--mode 2-3 \
--message "Enabled automated installation of packages and dependencies"
    
</entry>
<entry [Fri 2014:01:31 18:28:06 EST] AGUA 1-2 [0.8.0-beta.1+build.12] Enabled automated installation of packages and dependencies>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.12 \
--mode 1-2 \
--message "Enabled automated installation of packages and dependencies

-Fix lib/Agua/Ops/Install.pm: Fixed load opsdata if file not found
-Inc html/plugins: Enabled logDebug in apps.Parameter* and form.DndSource
+Add html/plugins/core/Common/Logger.js: Log with className.method and line numbers
-Onw lib/Agua/Ops/Install.pm: Almost completed biotools v4 automated installation
-Inc lib/Agua,t/unit/bin/Agua: Added sameHigherVersion method to Ops::Version and installDependencies to Ops::Install
-Onw html/plugins: Enabling synchronous progress update in Login using .then in PluginManager
-Fix bin/install/resources/puppet/bootstrap/centos.sh: Install rubygems and stahnma/epel before librarian-puppet install
-Fix bin/sql/package.sql: Changed 'url' field to 'website'
-Fix html/plugins/apps: Changed attachNode to attachPoint to enable load
-Onw bin/install/deploy.pl,lib/Agua: Enabling biotools v4 packages in Install.pm
+Add html/plugins/login/Login.js,t/unit/html: Added progress bar test for Login.js
-Inc lib/Agua/Ops/Version,t/unit: Added sameHigherVersion method to Ops::Version with complete tests
+Fix html/plugins,t/unit/html/plugins/sharing: Reenabled Dnd drag, added test of Groups.js in sharing pane
  plugins.form.DndSource now uses plugins.dnd.Source instead of dojo.dnd.Source
  plugins.dnd.Source uses plugins.dnd.Manager
  plugins.dnd.Manager uses plugins.dnd.Avatar
  plugins.dnd.Avatar has top header code commented out
-Fix html/plugins/dnd/Source.js: Restored dnd functionality
  Converted to AMD and inherited from dojo.dnd.Source
-Fix lib/Agua/Install/Https.pm:   getDomainName returns undefined
  Replaced 'curl ...metadata' and 'hostname' with 'facter domain'

"
    
</entry>
<entry [Fri 2014:01:31 18:28:06 EST] AGUA 2-3 [0.8.0-beta.1+build.11] Puppet-enabled Install, renabled GitHub Sync, enabling Request and S3 Sync>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.11 \
--mode 2-3 \
--message "Fixed version sorting in Deploy.pm, changed dumpfile location, enabling Dnd"
    
</entry>
<entry [Fri 2014:01:31 18:28:06 EST] AGUA 1-2 [0.8.0-beta.1+build.11] Puppet-enabled Install, renabled GitHub Sync, enabling Request and S3 Sync>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.11 \
--mode 1-2 \
--message "Fixed version sorting in Deploy.pm, changed dumpfile location, enabling Dnd

-Onw bin/logic,bin/install,lib/Agua: Re-enabling install on Ubuntu 12.04
-Fix lib/Agua/Sharing.pm: Enabled save methods for GroupProjects
-Inc html/plugins,t/unit/html/plugins: Replaced attachNode with attachPoint
-Onw  html/plugins/sharing: Enabling test GroupProjects.js to fix no DnD on Workflow.js
+Add t/unit/html/plugins/sharing: Tests for GroupProjects.js and Groups.js in Sharing pane
-Fix lib/Agua/Deploy.pm: Inverted release sorting in sortVersion method
 Reversed sort result of release string 'cmp' comparison:
 alpha < beta < rc
 NB: Alphabetic order only okay if restrict to these release types
-Fix bin/install/resources/puppet,lib/Agua/Install/Apache,etc.: Enabled install apache
-Fix .gitignore: Restored exclusion of test *.log files from repo
-Fix .gitignore: Added html/log/.dummy to repo
-Fix t/unit/bin/Agua/Common/Package/Default/Default.t: Enabled use new common Util.pm
-Fix lib/Agua/Install*: Removed debugs, fixed setStartupScript method
-Fix lib/Agua/Ops/Stager.pm: Deleted deprecated tar archive and expansion step
"
    
    
</entry>
<entry [Fri 2014:01:10 21:58:09 EST] AGUA 2-3 [0.8.0-beta.1+build.10] Puppet-enabled Install, renabled GitHub Sync, enabling Request and S3 Sync>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.10 \
--mode 2-3 \
--message "Puppet-enabled Install, renabled GitHub Sync, enabling Request and S3 Sync" \
--SHOWLOG 4
    
    
</entry>
<entry [Fri 2014:01:10 21:58:16 EST] AGUA 1-2 [0.8.0-beta.1+build.10] Puppet-enabled Install, renabled GitHub Sync, enabling Request and S3 Sync>

#### ENSURE .dummy FILES ARE READABLE
sudo chmod 644 /aguadev/conf/.dummy
sudo chmod 644 /aguadev/log/.dummy

#### UPDATE VERSION
cd /aguadev/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.10 \
--mode 1-2 \
--message "Puppet-enabled Install, renabled GitHub Sync, enabling Request and S3 Sync

* 15 minutes ago 8ff69f6 +Mov bin/sql/dump: Moved dump files to 'agua' and 'test' folders, added testuser.dump copy of guest.dump
* 6 days ago f40d91d +Add lib/Agua/Ops/S3.pm: Added S3.pm to enable S3 syncing with project folders
* 6 days ago 33ea10c +Add bin/install/resources/puppet/manifests: Added ec2api.pp and ec2api-dependencies.pp (separate to avoid 'nothing to do' yum error)
* 7 days ago 40decad +Add bin/install/resources/puppet/manifests: Added install-awscli.pp, -ec2api.pp and -python27.app
* 11 days ago f388d0b +Add bin/install/resources/puppet: Added 'puppet' scripts directory
* 11 days ago 368e009 +Add  bin/install/resources/apache2/osx: Apache config files for OSX
* 13 days ago a42a336 +Add bin/install/resources/apache2/centos/modules/fcgid.conf: Added while testing enable fcgi versus fastcgi
* 13 days ago 1ec16bc +Add  bin/install/resources/apache2/centos/conf.d: Added 15-default.conf to enable cgi-bin and mod_fastcgi.conf
* 3 weeks ago 4c7e70b +Add apps/rabbit.js: Moved from apps/node-amqp
* 4 weeks ago 2501d94 +Mov bin/install,lib/Agua/Install: Divided Installer.pm into PreInstall.pm and Install.pm
* 5 weeks ago 5eb2d20 +Add bin/install/resources/apache2/centos/httpd.conf: Apache CentOS config file first commit
* 5 weeks ago 9074770 +Add bin/install/resources/ubuntu: Added sources.list files for versions 12.04 to 13.10
* 6 weeks ago 548bd7d +Add bin/install/resources: Created versioned subdirs for apache2.conf files
* 7 weeks ago 24d927e +Add lib/Agua/Common/Request.pm: Restored for Agua::Workflow calls to getQueries and getDownloads
* 8 weeks ago 27e435c +Add t/unit/bin/Agua/Common/Request,lib/Agua/Common/Request.pm: Completed Common/Request.pm methods and tests
* 8 weeks ago 5d15fa5 +Add bin/sql,lib/Agua/Common/Request,t/unit/bin/Agua/Common/Request: Enabled add/removeRequest with tests
* 8 weeks ago 2cf0bbd +Add bin/sql: Added queries.sql and downloads.tsv with tsv files

"

    
</entry>
<entry [Mon 2013:11:18 10:35:21 EST] AGUA 1-2 [0.8.0-beta.1+build.9] +Add lib,t/unit: Enabled backend for Request pane with tests>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.9 \
--mode 1-2 \
--message "+Add lib,t/unit: Enabled backend for Request pane with tests"
    
    
</entry>
<entry [Wed 2013:11:13 12:13:25 EST] AGUA 2-3 [0.8.0-beta.1+build.8] -Fix html/plugins/data/Controller.js: Confirmed load data>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.8 \
--mode 2-3 \
--message "-Fix html/plugins/data/Controller.js: Confirmed load data"

    
</entry>
<entry [Wed 2013:11:13 12:12:00 EST] AGUA 1-2 [0.8.0-beta.1+build.8] -Fix html/plugins/data/Controller.js: Confirmed load data>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.8 \
--mode 1-2 \
--message "-Fix html/plugins/data/Controller.js: Confirmed load data"

    
</entry>
<entry [Tue 2013:11:12 23:58:09 EST] AGUA 2-3 [0.8.0-beta.1+build.7] -Fix lib/Agua/Installer.pm: Handle empty lines in perlmods.txt>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.7 \
--mode 2-3 \
--message "-Fix lib/Agua/Installer.pm: Handle empty lines in perlmods.txt"

    
</entry>
<entry [Tue 2013:11:12 23:56:20 EST] AGUA 1-2 [0.8.0-beta.1+build.7] -Fix lib/Agua/Installer.pm: Handle empty lines in perlmods.txt>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.7 \
--mode 1-2 \
--message "-Fix lib/Agua/Installer.pm: Handle empty lines in perlmods.txt"

    
</entry>
<entry [Tue 2013:11:12 15:04:39 EST] AGUA 2-3 [0.8.0-beta.1+build.6] -Fix Removed all files larger than 50MB>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.6 \
--mode 2-3 \
--message "-Fix Removed all files larger than 50MB"


AND PUSHED TO github.com:aguadev

cd /mnt/repos/public/agua/aguadev
gitrem add git git@github.com:aguadev/aguadev
git push git master
  

</entry>
<entry [Tue 2013:11:12 15:00:19 EST] AGUA 1-2 [0.8.0-beta.1+build.6] -Fix Removed all files larger than 50MB>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.6 \
--mode 1-2 \
--message "-Fix Removed all files larger than 50MB"



REMOVED ALL FILES > 50MB

IN REPO

git rm -fr bin/install/resources/sge/sge6.tar.gz

NOT IN REPO

apps/hannah/tmp/progs/snpEff/data/GRCh37.71/snpEffectPredictor.bin
apps/bioapps.downloaded/t/bin/Filter/SNP/dbfile/filtersnp.dbl
apps/bioapps.downloaded/t/bin/Filter/inputs/chrY/chrY.fa


</entry>
<entry [Tue 2013:11:12 14:47:37 EST] AGUA 2-3 [0.8.0-beta.1+build.5] +Fix Enabled basic functionality of Request with Query.js output to Grid>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.5 \
--mode 2-3 \
--message "+Fix Enabled basic functionality of Request with Query.js output to Grid

html/plugins,t/unit/html/plugins/request: Enabled Query.js basic AND output to Grid
html/dojo-1.8.3: Removed all .git.bkp directories
"

    
</entry>
<entry [Tue 2013:11:12 14:43:18 EST] AGUA 1-2 [0.8.0-beta.1+build.5] +Fix Enabled basic functionality of Request with Query.js output to Grid>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.5 \
--mode 1-2 \
--message "+Fix Enabled basic functionality of Request with Query.js output to Grid

html/plugins,t/unit/html/plugins/request: Enabled Query.js basic AND output to Grid
html/dojo-1.8.3: Removed all .git.bkp directories
"

</entry>
<entry [Mon 2013:11:11 10:33:59 EST] AGUA 2-3 [0.8.0-beta.1+build.4] +Fix Renabled Apps updates. Added Exchange.js, Request.js, node-amqp, dojo-1.9.0>


./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.4 \
--mode 2-3 \
--message "+Fix Renabled Apps updates. Added Exchange.js, Request.js, node-amqp, dojo-1.9.0

Added Exchange.js and reenabled backend tests
Added Request.js stubs
Added apps/node-amqp
Added html/dojo/dojo-1.9.0
Created test subcategories: unit, integration, acceptance
" \
--SHOWLOG 4

    
</entry>
<entry [Mon 2013:11:11 10:15:40 EST] AGUA 1-2 [0.8.0-beta.1+build.4] +Fix Renabled Apps updates. Added Exchange.js, Request.js, node-amqp, dojo-1.9.0>

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.4 \
--mode 1-2 \
--message "+Fix Renabled Apps updates. Added Exchange.js, Request.js, node-amqp, dojo-1.9.0

Added Exchange.js and reenabled backend tests
Added Request.js stubs
Added apps/node-amqp
Added html/dojo/dojo-1.9.0
Created test subcategories: unit, integration, acceptance
" 


* 17 hours ago 0a33c91 +Add html/plugins,t/unit/html/plugins: Added Downloads.js and DownloadRow.js, completed DownloadRow unit tests
* 8 days ago 12d5e42 +Add html/plugins/request,t/unit/html/plugins/request: Added Query.js, QueryRow.js and CSS, html. Completed QueryRow tests
* 8 days ago 6670e22 +Add html/plugins/form/SelectList.js: First commit
* 9 days ago 75d74dd +Add html/plugins,t/unit/html: Added request module and unit tests
* 3 weeks ago 1f67a6e +Add t/html/plugins/apps/updatepackages,html/plugins: Added test for Agua.updater calls - updatePackages & updateApps
* 5 weeks ago 788820c +Add apps/node-amqp: First commit of node-amqp v0.9.1
* 5 weeks ago dc7185d +Add apps/node: First commit of node v0.1.10.15
* 7 weeks ago a7be82f +Add t/bin/Agua/Admin/log/.dummy: Ensures log directory is included in repo
* 7 weeks ago 35584c9 +Add bin/install/resources/agua/conf: First commit of config.yaml and default.conf
* 3 months ago 140bb97 +Add html/plugins/view/Features.js: Refactored Features.js from View.js
* 3 months ago 14eacb3 +Add t/html/plugins/view/features: Tests for Features.js refactored out of View.js
* 3 months ago 3ea3bda +Add html/plugins/core/Agua/Exchange.js: Moved out Exchange methods from Agua.js
* 3 months ago 6621473 +Add t/html/plugins/view/browser/users/aguatest/Project1/View4: Added View4 to test View.loadBrowser
* 3 months ago 020b987 +Add t/html/plugins/view/exchange: Completed test Agua.exchange.onMessage call to View._handleAddView
* 3 months ago fbf11f3 +Add html/plugins/core/Common/Array.js,t/html/plugins/core/common/array: Added tests for Common.Array._getIndexInArray
* 3 months ago e9e0b61 +Add html/dojo-1.8.3/dojox-1.9.0: Added dojox from dojo-1.9.0 trying to fix Uploader
* 4 months ago 82ea0ba +Add html/plugins/form,t/html/plugins/form: Added Status widget to display 'ready', 'loading' with spinner
* 4 months ago fd9a330 +Add t/bin/Agua/Common/App: Enabled test of App::_saveApp
* 4 months ago 464c75a +Add bin/sql/dump: Dump after added 'linkurl' field to app and add EMBOSS apps
* 4 months ago 2be4cf6 +Fix bin/sql/app.sql,lib/Agua: Added 'linkurl' field to app table, reenabled emboss.pm with paramtypes
* 4 months ago dceefa5 +Fix html/plugins/apps: ParameterRow not displaying
* 4 months ago 98d29c1 +Add t/html/plugins/workflow/apps: Completed AguaPackages and AdminPackages tests
* 4 months ago bb4d243 +Add lib/Deploy.pm,t: Completed EMBOSS parsing method tests
* 4 months ago ddc2905 +Add t/bin/Agua/Common/App,t/lib/Test/Agua/Common/App.pm: First commit, testing parseEmboss
* 5 months ago b883885 +Add html/js-doc-parse: First commit of Dojo automatic documentation
* 5 months ago 4cbb13e +Add t/html/plugins/apps/parameters: First add of Parameters tests
* 5 months ago a0c5861 +Add t/html/plugins/apps/parameterrow: Enabled ParameterRow with full CSS styling
* 5 months ago ba29902 +Add html/plugins/infusion: Added to compare infusion dialog tests with apps.dialog tests
* 5 months ago 833553d +Add html/plugins,t/html/plugins/apps: Added Dialog/Base for Scrape and tests
* 5 months ago 368cab5 +Add html/tests/connectline: Test SVGAnimatedString from AutoSave options tab
* 5 months ago ddcfdee +Add t: Updated all tests to current versions (copied from toshiba)
* 5 months ago 908333b +Add html/plugins/apps/Dialog: First commit of Scrape.js
* 5 months ago 3f787f3 +Add html/plugins/exchange: First commit
* 5 months ago ef94825 +Fix html/plugins/form: Added updated form elements
* 5 months ago f6597b5 +Add html/dojo-1.9.0: First commit
* 5 months ago 888a4fa +Add html/dojo-1.8.3: First commit
* 5 months ago 1208803 +Add t: First commit
* 6 months ago da15a5e +Mov bin/scripts/config.pl,bin/scripts/deploy.pl,bin/scripts/install.pl: To new install directory with resources folder
* 6 months ago 4d7f732 +Add docs/login.txt: Authentication for confluence login
* 6 months ago a35f514 +Add bin/scripts/confluence.pl,lib/Confluence.pm: Use confluence API to upload files
* 7 months ago 09825f3 +Add conf.bkp: Backup of conf to avoid wipe ".*" dirs
* 7 months ago 44a8e1d +Add html/plugins/workflow/Apps/SharedPackages.js: Refactor to fix duplicate object problem
* 7 months ago 0e5887b +Add html/rabbit.js,html/test/rabbitmq: Tests for Rabbit.js
* 8 months ago 7025d95 +Add bin/sql/dump/agua.*dump: Latest db dumps
* 8 months ago a25762d +Add conf.temp: Temporary backup of conf
* 10 months ago e64aa78 +Add html/plugins/login: Nice login/logout images
* 10 months ago 9ce8154 +Add lib/Agua/Common: File.pm & Transport.pm - File::canJson to fix unicode error
* 10 months ago dd050be +Add cgi-bin/agua*: agua.cgi calls agua.pl which loads all modules
* 10 months ago 0cbb636 +Add html: Added query.module to all xhrPuts to enable use agua.cgi



</entry>
<entry [Fri 2013:11:08 08:33:14 EST] AGUA 1-2 [0.8.0-beta.1+build.3] +Fix Apps, Login, Workflow & View GUIs. Enabled Chrome, added loadUsage>
    
* 10 months ago 3070ebf [0.8.0-beta.1+build.3] +Fix Apps, Login, Workflow & View GUIs. Enabled Chrome, added loadUsage 
    
</entry>
<entry [Wed 2013:10:02 11:11:27 EST] AGUA 1-2 [0.8.0-beta.1+build.4] +Fix Reenabled most backend tests after add dojo-1.9.0 and implementing Exchange>

**** DID NOT RUN ****

cd /aguadev/bin/scripts

./stager.pl \
--stagefile /aguadev/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.4 \
--mode 1-2 \
--message "+Fix Reenabled most backend tests after add dojo-1.9.0 and implementing Exchange" 


    
* a7be82f +Add t/bin/Agua/Admin/log/.dummy: Ensures log directory is included in repo
* 35584c9 +Add bin/install/resources/agua/conf: First commit of config.yaml and default.conf
* 140bb97 +Add html/plugins/view/Features.js: Refactored Features.js from View.js
* 14eacb3 +Add t/html/plugins/view/features: Tests for Features.js refactored out of View.js
* 3ea3bda +Add html/plugins/core/Agua/Exchange.js: Moved out Exchange methods from Agua.js
* 6621473 +Add t/html/plugins/view/browser/users/aguatest/Project1/View4: Added View4 to test View.loadBrowser
* 020b987 +Add t/html/plugins/view/exchange: Completed test Agua.exchange.onMessage call to View._handleAddView
* fbf11f3 +Add html/plugins/core/Common/Array.js,t/html/plugins/core/common/array: Added tests for Common.Array._getIndexInArray
* e9e0b61 +Add html/dojo-1.8.3/dojox-1.9.0: Added dojox from dojo-1.9.0 trying to fix Uploader
* 82ea0ba +Add html/plugins/form,t/html/plugins/form: Added Status widget to display 'ready', 'loading' with spinner
* fd9a330 +Add t/bin/Agua/Common/App: Enabled test of App::_saveApp
* 464c75a +Add bin/sql/dump: Dump after added 'linkurl' field to app and add EMBOSS apps
* 2be4cf6 +Fix bin/sql/app.sql,lib/Agua: Added 'linkurl' field to app table, reenabled emboss.pm with paramtypes
* dceefa5 +Fix html/plugins/apps: ParameterRow not displaying
* 98d29c1 +Add t/html/plugins/workflow/apps: Completed AguaPackages and AdminPackages tests
* bb4d243 +Add lib/Deploy.pm,t: Completed EMBOSS parsing method tests
* ddc2905 +Add t/bin/Agua/Common/App,t/lib/Test/Agua/Common/App.pm: First commit, testing parseEmboss
* b883885 +Add html/js-doc-parse: First commit of Dojo automatic documentation
* 4cbb13e +Add t/html/plugins/apps/parameters: First add of Parameters tests
* a0c5861 +Add t/html/plugins/apps/parameterrow: Enabled ParameterRow with full CSS styling
* ba29902 +Add html/plugins/infusion: Added to compare infusion dialog tests with apps.dialog tests
* 833553d +Add html/plugins,t/html/plugins/apps: Added Dialog/Base for Scrape and tests
* 368cab5 +Add html/tests/connectline: Test SVGAnimatedString from AutoSave options tab
* ddcfdee +Add t: Updated all tests to current versions (copied from toshiba)
* 908333b +Add html/plugins/apps/Dialog: First commit of Scrape.js
* 3f787f3 +Add html/plugins/exchange: First commit
* ef94825 +Fix html/plugins/form: Added updated form elements
* f6597b5 +Add html/dojo-1.9.0: First commit
* 888a4fa +Add html/dojo-1.8.3: First commit
* 1208803 +Add t: First commit
* da15a5e +Mov bin/scripts/config.pl,bin/scripts/deploy.pl,bin/scripts/install.pl: To new install directory with resources folder
* 4d7f732 +Add docs/login.txt: Authentication for confluence login
* a35f514 +Add bin/scripts/confluence.pl,lib/Confluence.pm: Use confluence API to upload files
* 09825f3 +Add conf.bkp: Backup of conf to avoid wipe ".*" dirs
* 44a8e1d +Add html/plugins/workflow/Apps/SharedPackages.js: Refactor to fix duplicate object problem
* 0e5887b +Add html/rabbit.js,html/test/rabbitmq: Tests for Rabbit.js
* 7025d95 +Add bin/sql/dump/agua.*dump: Latest db dumps
* a25762d +Add conf.temp: Temporary backup of conf
* e64aa78 +Add html/plugins/login: Nice login/logout images
* 9ce8154 +Add lib/Agua/Common: File.pm & Transport.pm - File::canJson to fix unicode error
* dd050be +Add cgi-bin/agua*: agua.cgi calls agua.pl which loads all modules
* 0cbb636 +Add html: Added query.module to all xhrPuts to enable use agua.cgi
* 3070ebf (tag: 0.8.0-beta.1+build.3) [0.8.0-beta.1+build.3] +Fix Apps, Login, Workflow & View GUIs. Enabled Chrome, added loadUsage

    
    
</entry>
<entry [Tue 2012:12:25 03:10:40 EST] AGUA 1-2 [0.8.0-beta.1+build.3] +Fix Apps, Login, Workflow & View GUIs. Enabled Chrome, added loadUsage>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.3 \
--mode 1-2 \
--message "+Fix Apps, Login, Workflow & View GUIs. Enabled Chrome, added loadUsage

SUMMARY
* 257fee3 +Add html/plugins/core/Common/BrowserDetect.js: Detects browser type, version and OS
* d792f40 +Fix html/index.html: Enabled close index.html after spawn agua.html
* 31b41c4 +Add html/plugins/apps & core, lib/Agua/Common/Base: Apps pane Packages panel default installdir & opsdir
* 24a32e1 +Add html/plugins/workflow/Apps: Displays apps and sharedapps correctly.
* 4d8b093 +Add html/plugins/workflow/Apps & html/agua.html: Moved Apps to workflow/Apps
* fa9976c +Fix html/plugins/apps: Modules now working (bad session ID)
* f4103cf +Add html/plugins/apps: Toggler to show/hide details
* f110940 +Fix html/plugins: Enabled chrome support
* b594a73 +Add bin/scripts/resources/node: AutoSave routes and testnodemonkey-1.js
* 6303cfa +Add lib/Agua/CLI/App.pm: Method loadUsage converts usage output to app
* 02b2fbe +Fix html/plugins/core/Agua.js: Logout does not remove loaded widgets

" \
--SHOWLOG 4


DETAILS
* 5822405 -Fix cgi-bin/workflow.pl: Commented warnings to just: mode, user, count
* 2306e57 -Add html/agua.html: View and core/Agua/* modules added inline for AutoSave
* f32f844 -Onw html/plugins/workflow: Enabling getStatus after runWorkflow
* 6be2ea6 -Fix lib/Agua/Common/Util.pm: Error in killPid when command is undefined
* 68be577 -Fix lib/Agua/Workflow.pm: Skip report OK if no error in executeWorkflow
* 1fe91f1 -Fix html/plugins/workflow/templates: Changed titles of grid, history and userWorkflows panels
* 046beb6 -Fix bin/scripts/resources/apache2/apache2.conf: Workflow getStatus ignored b/c process is busy with executeWorkflow
* 44fb8fe -Fix html/plugins/core & workflow: No parameters loaded on drop stage, can't copy Project in Shared
* b65e508 -Fix html/plugins/view/View.js: Can't open same view in more than one window
* b5cf42d -Fix html/plugins/workflow/RunStatus/Status.js: No message on run error passed from remote
* 257fee3 +Add html/plugins/core/Common/BrowserDetect.js: Detects browser type, version and OS
* 93e72fe -Fix html/index.html: Reenabled Chrome close window. Left message re Firefox fails to close
* cd7f55e -Add html/agua.html: Form elements inline for AutoSave editing
* b0a84b9 -Fix html/index.html: Tried enabling firefox window.close -> shows dialog but can't close
* e9a8263 -Fix lib: Commented out 'has 'sessionid'' in modules, added 'has 'sessionid'' to Common::Util
* 6ab63d1 -Fix html/plugins: Multiple images for workflow and folders menus
* 85703f2 -Fix html/plugins/login/Login.js: Changed loading message to 'Loading...'
* 4d8b8d2 -Fix html/plugins/core/Agua.js: Chrome fails to complete disablePageReload
* 8c4edac -Fix html/plugins/form/EditRow.js: Textarea not removed on empty input
* 18a840e -Fix html/plugins/form/EditRow.js: Chrome errors on method handleOnKeyPress
* 0ac8a68 -Fix html/plugins/workflow/IO.js: Commented out all console calls
* 60660e4 -Fix html/plugins/workflow/IO.js: novoIndex chain failed due to whitespace
* c238dcc -Fix html/plugins/view/css/view.css: View window stops at ~900px, does not extend with added features
* 0b76d47 -Add html/plugins/cloud/css/cloud.css: Purple tabLabels
* 1beda76 -Add html/plugins/core/Agua.js: Failed to load
* 3784dca -Add html/agua.html: Inline script files for most plugins/workflow classes
* a36ce88 -Fix html/plugins/workflow: StageStatus.stageTable not attached to attachNode
* d792f40 +Fix html/index.html: Enabled close index.html after spawn agua.html
* 31b41c4 +Add html/plugins/apps & core, lib/Agua/Common/Base: Apps pane Packages panel default installdir & opsdir
* 041a8c9 -Fix bin/scripts/resources/agua/conf/default.conf: Removed SHAREDPACKAGES, etc.
* 4e9e182 -Add agua/agua.html: Added inlines for Workflow, Core and Apps for AutoSave editing
* 356cffc -Onw html/plugins/apps & core: Adding Agua.Conf to provide opsrepo to Apps pane
* 645c208 -Fix README: Updated installation instructions - added deploy.pl & cleaned up
* 1288446 -Fix bin/scripts: Cleaned up deploy.pl and install.pl
* 6f07687 -Onw lib/Agua/Common/Base & Shared: Onworking add getConf to Base
* 94127f6 -Fix html/plugins/workflow: Minor fixes to SharedApps, SharedPackages, Workflow.js and workflow.css
* 24a32e1 +Add html/plugins/workflow/Apps: Displays apps and sharedapps correctly.
* 4d8b093 +Add html/plugins/workflow/Apps & html/agua.html: Moved Apps to workflow/Apps
* fa9976c +Fix html/plugins/apps: Modules now working (bad session ID)
* 96969d2 -Fix lib/Agua/Common: App, Package & Parameter - added 'username' field and simplified getApps query
* 8d0bf57 -Onw html/plugins/apps & core/css: Testing AutoSave and fixing Apps pane
* d42e302 -Fix lib/Agua/Common/Package/Default: removePackage does not remove associated apps and parameters
* 1f9152d -Fix lib/Agua/Common/Parameter & Sharing: Changes after added 'username' field to app and parameter tables
* 63050da -Add bin/sql/dump: Dumpfiles after add 'admin' projects, edit app, parameter and package tables
* 101e59c -Fix bin/sql/app & parameter.sql: Added 'username' field after 'owner
* 23748b8 -Fix bin/sql/stageparameter.sql: Swapped owner and username lines
* 7f7bbfe -Fix html/plugins/apps/App.js: Method setAppTypesCombo not showing newly-created apps
* f4103cf +Add html/plugins/apps: Toggler to show/hide details
* f110940 +Fix html/plugins: Enabled chrome support
* b594a73 +Add bin/scripts/resources/node: AutoSave routes and testnodemonkey-1.js
* efb9a50 -Add html/plugins/apps: Spinner and delay after Controller.createTab
* 67a9ba0 -Fix lib/Agua/Common/App.pm: saveApp fails with new app
* 21e7f33 -Fix html/plugins/apps/App: Added updatePackages. Fixed packageCombo
* 02eb848 -Fix html: core.Agua.Package and apps.Packages - delete package
* d8a76d5 -Add html/plugins,lib/Agua/Common/App: Added Module panel to App pane
* dbb275a -Onw html/plugins/workflow,lib/Agua/Common/Shared: Fixing shared apps from admin, apps from agua
* 3b337ab -Onw bin/jbrowse/trackInfo.pl: Checking USAGE for conversion to app
* f0b9db5 -Fix bin/sql/package.sql,lib/Agua/Ops/Install,lib/Auga/Common/Package/Default: Added 'repository' field to package table
* e1aa1b7 -Fix html/plugins/apps,lib/Agua/Common/App: Aborts addPackage after editing packageRow
* dc4a75b -Fix html: apps & controls CSS - tab background colour and subtabs colour
* 68807da -Onw bin/jbrowse: Load jbrowse into 'guest' user
* 6303cfa +Add lib/Agua/CLI/App.pm: Method loadUsage converts usage output to app
* 08d0111 -Fix lib/Agua/Common/User.pm: Method addUser does not set bash shell
* f6e70d8 -Fix html: Added progressMessage to Login, called from PluginManager
* 02b2fbe +Fix html/plugins/core/Agua.js: Logout does not remove loaded widgets
* 8267e85 -Fix all: Changed sessionId to sessionid. lib/Agua/Common/File - file samples

</entry>
<entry [Tue 2012:12:25 03:10:40 EST] AGUA 1-2 [0.8.0-beta.1+build.2] +Add html: build 038 - View pane fixed and up-to-date>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.2 \
--mode 1-2 \
--message "+Add html: build 038 - View pane fixed and up-to-date

* 18e99f7 -Fix html: apps/templates/apps.html,workflow/css/apps.css: Complete change main class from 'apps' to 'applications'
* 45cf523 -Fix html/plugins/apps/css: CSS from apps pane bleeding over into Workflow pane apps
* 13b122a +Fix html/plugins/view/View|core/Agua/View: Onclick fails to delete view feature
* f19c193 +Fix html/plugins/workflow/Workflows: Reenabled projectCombo fires change in workflowCombo
* 5cdbc47 -Fix html/plugins: Corrected -moz-box-shadow in all *.css files
* 39f490b +Fix html/plugins/view: Feature onclick required 'urlTemplate' in trackData.js

" \
--SHOWLOG 4

</entry>
<entry [Wed 2012:12:12 23:45:08 EST] AGUA 3-4 [0.8.0-beta.1+build.1] First build of Agua 0.8.0-beta.1>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.1 \
--mode 3-4 \
--message "First build of Agua 0.8.0-beta.1" \
--SHOWLOG 4

cd /mnt/repos/public/agua/agua
git push -u github master

    Counting objects: 9429, done.
    Delta compression using up to 2 threads.
    Compressing objects: 100% (8961/8961), done.
    Writing objects: 100% (9429/9429), 141.90 MiB | 83 KiB/s, done.
    Total 9429 (delta 1407), reused 0 (delta 0)
    To git@github.com:agua/agua
     * [new branch]      master -> master


</entry>
<entry [Wed 2012:12:12 23:45:08 EST] AGUA 2-3 [0.8.0-beta.1+build.1] +Add First build of Agua 0.8.0-beta.1>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.1 \
--mode 2-3 \
--message "+Add First build of Agua 0.8.0-beta.1

Fixes:
Kill balancer pid and load new pid into db enabled in StarCluster & Workflow
Fixed methods addMasterToAllHosts, setMasterInfo and isIntel in sge.py
Reenabled executeWorkflow with getStatus in Cluster & SGE

" \
--SHOWLOG 4


</entry>
<entry [Sat 2012:12:08 00:56:29 EST] AGUA 1-2 [0.8.0-beta.1+build.1] +Add First build of Agua 0.8.0-beta.1>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-beta.1+build.1 \
--mode 1-2 \
--message "+Add First build of Agua 0.8.0-beta.1

* 952c2fe +Fix lib: Kill balancer pid and load new pid into db enabled in StarCluster & Workflow
* 0d73763 -Del lib/Agua/Init: Commented call to superfluous method addNfsToFstab
* 9de283f -Fix lib/Agua/Common/Util: getProcessTree method, removed bad skip 0 index
*   816ff17 Merge branch 'master' of github.com:syoung/aguadev
|\  
| * 5803eac -Fix bin/scripts/resources/starcluster/plugins/sge.py: Fixed addMasterToAllHosts
* | 3357673 +Fix lib/Agua/Common: (Cluster & SGE) Enabled executeWorkflow with getStatus
* | 5ea7d54 -Fix lib/Agua/DBase/MySQL.pm: minor change
* | 42cbd43 -Fix bin/scripts/resources/starcluster/plugins/sge.py: Fixed addMasterToAllHosts
|/  
* d9fde1b -Fix bin/scripts/resources/starcluster/plugins/sge.py: Method setMasterInfo
* 424a29b -Fix bin/scripts/resources/starcluster/plugins/sge.py: isIntel method bad regex
* e558265 -Onw lib/Agua: Fix getStatus while executeWorkflow

" \
--SHOWLOG 4


</entry>
<entry [Sat 2012:12:08 00:56:29 EST] AGUA 1-2 [0.8.0-alpha.1+build.60] +Add html: build 037 Centered workflow/RunStatus polling countdown>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.60 \
--mode 1-2 \
--message "+Add html: build 037 Centered workflow/RunStatus polling countdown

* 677e7a6 +Add html/build/agua_all.js: Abortive attempt to add build 037
* f412b94 -Fix html/plugins/login/Login: Added 'this.logging = false' to show method
* e1566fb +Fix html/plugins/workflow/RunStatus: Centered polling countDown

" \
--SHOWLOG 4


</entry>
<entry [Sat 2012:12:08 00:56:29 EST] AGUA 1-2 [0.8.0-alpha.1+build.59] +Add html: build 036 Removed Status.notifier references>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.59 \
--mode 1-2 \
--message "+Add html: build 036 Removed Status.notifier references" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:16 EST] AGUA 1-2 [0.8.0-alpha.1+build.58] +Add html: build 035>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.58 \
--mode 1-2 \
--message "+Add html: build 035" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:15 EST] AGUA 1-2 [0.8.0-alpha.1+build.57] +Fix html/plugins/workflow/RunStatus: Improved stage status display CSS/html>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.57 \
--mode 1-2 \
--message "+Fix html/plugins/workflow/RunStatus: Improved stage status display CSS/html" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:14 EST] AGUA 1-2 [0.8.0-alpha.1+build.56] +Fix lib/Agua/Package: Set upgradesleep to 10>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.56 \
--mode 1-2 \
--message "+Fix lib/Agua/Package: Set upgradesleep to 10" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:07 EST] AGUA 1-2 [0.8.0-alpha.1+build.55] +Fix Added html/plugins/apps, enabled cluster run>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.55 \
--mode 1-2 \
--message "+Fix lib/Agua/Workflow: Added slot 'upgradesleep' to enable upgrade" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:13 EST] AGUA 1-2 [0.8.0-alpha.1+build.54] +Fix Added html/plugins/apps, enabled cluster run>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.54 \
--mode 1-2 \
--message "+Fix Added html/plugins/apps, enabled cluster run

* ab072f3 -Onw lib/Agua/Workflow: Onw ensure updateWorkflowStatus called at all stages of execute
* 66ae758 -Fix .gitignore: Changed 'apps' to 'apps/starcluster' to not ignore html/plugins/apps
* f12397c +Add html/plugins/apps: Added after fix .gitignore
* 81886be -Fix lib/Agua/Monitor/SGE: Removed DEBUG exit
* 75adec4 -Fix lib/Agua/Workflow: Changed 'status' to 'stagestatus' in _getStatus
* 7b79c14 -Fix lib/Agua/StarCluster: Restored '--kill-master' in launchBalancer
* f548475 -Fix lib/Agua/Common/Cluster: Restored old getMasterInstanceInfo
* 68d026c -Onw lib/Agua: Fix does not wait for cluster job to complete
* 50026b4 -Fix lib/Agua/Common/Volume: Updated JAVA to match changed default.conf
* b87bae0 -Fix bin/scripts/resources/agua/conf/default.conf: Changed [bioapps] to [package bioapps:0.8.0]
* 291e3d5 -Fix cgi-bin/workflow.pl: Added whoami to json for recall after forks
* 23dfeaf -Fix lib/Agua/Monitor/SGE: Added conf to ", ", $self->self->self->head() in 'initialise'
* 5f4f7e3 +Add lib/Agua/Common/Volume: placeholder 'loadSnapshot' method.
* ef803a4 +Fix lib/Agua: Multiple mods in fix submit SGE job
* 7882fd0 -Fix cgi,html: Ran config.pl --mode linkDirectories
* 4210d81 +Fix lib/Agua: Refactored Agua::Common::SGE into Agua::Workflow
* 935d7a2 -Fix lib/Agua/Uml.pm: Print role summary only once in Agua::Uml::_roleUsers
* 7e8d78f -Fix lib/Agua/StarCluster: removed commented call to setDbh
* 11d1edd +Fix lib/Agua/Uml: getUsers method set subrole instead of class
* 9416b62 -Fix lib/Agua/View: ABC ordered roles used by class
* 7c49d5c -Fix lib/Agua/Common/Logger: logGroupEnd indent changes after print
* 048ba57 -Onw lib: Enabling Uml roleUsers
* d2898d1 -Onw bin/scripts,lib/Agua: Fixing SGE not running
* 3918a6a +Fix lib/Agua/Common/SGE: missing return 1 in method checkMasterSge
* bbe9f35 -Onw lib/Agua/Common: troubleshooting executeWorkflow
* 6c89255 -Onw bin: Added sge.py 'getRemoteBinRoot' & 'getLocalBinroot' methods
* cc37e65 +Add html/plugins/workflow/RunStatus,core/css: Added balancer output to RunStatus
* a6eab21 -Fix lib/Agua/Installer: Added link dojo-* to dojo, log to cgi-bin/log
* 05fda14 -Add .gitattributes: ignore cgi-bin/log
* e43fa4e -Add bin/scripts/resources/agua/links: cgi log and html dojo links
* 3002e40 -Del lib/Agua/Ops/Stager: Cleanup old code in sourceToTarget
* 9c9bbe6 -Fix lib/Agua/Workflow: Incorrect no. args for _getStatus

" (), "(), "\
--SHOWLOG 4

</entry>
<entry [Wed 2012:11:21 00:46:12 EST] AGUA 2-3 [0.8.0-alpha.1+build.53] +Fix lib/Agua/Ops/Stager: Enabled export without compression>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.53 \

--mode 2-3 \
--message "+Fix lib/Agua/Ops/Stager: Enabled export without compression

+Add lib: Agua::Stager tool using export without compression
+Add html: Dojo build 034 post-migrate Admin pane to Apps & Cloud panes
+Add lib: Agua::Uml for UML role user analysis tool
+Fix lib: Refactored Workflow & StarCluster so no database use by latter
+Add lib: Agua::Deploy to install of Agua dependencies (biorepository, etc.)
+Add html: Display Agua version at center top of page
+Fix html: Bugs in Admin Aws and Hub panels
+Fix all: Tests 100% operational

" \
--SHOWLOG 4



* 032f357 (HEAD, tag: 0.8.0-alpha.1+build.53, master) [0.8.0-alpha.1+build.53] +Fix lib/Agua/Ops/Stager: Enabled export without compression
* 42eaf47 (tag: 0.8.0-alpha.1+build.52) [0.8.0-alpha.1+build.52] -Fix lib/Agua/Ops/Stager: Test increment version
* 0aa1906 (tag: 0.8.0-alpha.1+build.51) [0.8.0-alpha.1+build.51] +Add lib/Agua/Ops/Stager: Restored Stager and removed tar step
* 0ee314d (tag: 0.8.0-alpha.1+build.48) [0.8.0-alpha.1+build.48] +Fix lib/Agua/Ops/Stager: test method 'sourceToTarget'
* b035f0a (tag: 0.8.0-alpha.1+build.47) [0.8.0-alpha.1+build.47] +Fix lib/Agua/Ops/Stager: Restored from previous working state
* 3b0fb5c (tag: 0.8.0-alpha.1+build.46) [0.8.0-alpha.1+build.46] +Fix all: Enabled tests - 100% operational
* bf3d036 (lin/master, github/master, bit/master) +Fix all: Tests 100% enabled
* 358292a (tag: 0.8.0-alpha.1+build.45) [0.8.0-alpha.1+build.45] +Add html: build 034 post-migrate admin to apps & cloud
* 37d8de7 (tag: 0.8.0-alpha.1+build.44) [0.8.0-alpha.1+build.44] +Add html: build 033
* 91dafe1 (tag: 0.8.0-alpha.1+build.43) [0.8.0-alpha.1+build.43] +Add Agua::Uml, refactored Workflow/StarCluster
syoung@syoung-Satellite-C675D:/agua/repos/private/syoung/agua", ", $self->self-> gitlog 
* 032f357 (HEAD, tag: 0.8.0-alpha.1+build.53, master) [0.8.0-alpha.1+build.53] +Fix lib/Agua/Ops/Stager: Enabled export without compression
* 42eaf47 (tag: 0.8.0-alpha.1+build.52) [0.8.0-alpha.1+build.52] -Fix lib/Agua/Ops/Stager: Test increment version
* 0aa1906 (tag: 0.8.0-alpha.1+build.51) [0.8.0-alpha.1+build.51] +Add lib/Agua/Ops/Stager: Restored Stager and removed tar step
* 0ee314d (tag: 0.8.0-alpha.1+build.48) [0.8.0-alpha.1+build.48] +Fix lib/Agua/Ops/Stager: test method 'sourceToTarget'
* b035f0a (tag: 0.8.0-alpha.1+build.47) [0.8.0-alpha.1+build.47] +Fix lib/Agua/Ops/Stager: Restored from previous working state
* 3b0fb5c (tag: 0.8.0-alpha.1+build.46) [0.8.0-alpha.1+build.46] +Fix all: Enabled tests - 100% operational
* bf3d036 (lin/master, github/master, bit/master) +Fix all: Tests 100% enabled
* 358292a (tag: 0.8.0-alpha.1+build.45) [0.8.0-alpha.1+build.45] +Add html: build 034 post-migrate admin to apps & cloud
* 37d8de7 (tag: 0.8.0-alpha.1+build.44) [0.8.0-alpha.1+build.44] +Add html: build 033
* 91dafe1 (tag: 0.8.0-alpha.1+build.43) [0.8.0-alpha.1+build.43] +Add Agua::Uml, refactored Workflow/StarCluster
* c26d8c9 (tag: 0.8.0-alpha.1+build.42) [0.8.0-alpha.1+build.42] +Fix apps/.dummy, etc. and -Onw lib/Agua/Uml
* 2c3a230 (tag: 0.8.0-alpha.1+build.40) [0.8.0-alpha.1+build.40] +Add lib: Ops::Stager and Agua::Deploy
* dc3b305 [0.8.0-alpha.1+build39] +Add Display Agua version, SGE binaries, sge.py fix
* c39d675 (tag: 0.8.0-alpha.1+build39) [0.8.0-alpha.1+build38] +Add bin,lib: Implemented Stager, used on StarCluster
* c4e2f46 (tag: 0.8.0-alpha.1+build38, tag: 0.8.0-alpha.1+build37) +Add: Build 032 - Fixed Admin Aws and Hub panels


</entry>
<entry [Wed 2012:11:21 00:46:11 EST] AGUA 1-2 [0.8.0-alpha.1+build.53] +Fix lib/Agua/Ops/Stager: Enabled export without compression>

/agua/bin/scripts/stager.pl (), "(), "\
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.53 \
--mode 1-2 \
--message "+Fix lib/Agua/Ops/Stager: Enabled export without compression" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:10 EST] AGUA 1-2 [0.8.0-alpha.1+build.52] -Fix lib/Agua/Ops/Stager: Test increment version>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.52 \
--mode 1-2 \
--message "-Fix lib/Agua/Ops/Stager: Test increment version" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:09 EST] AGUA 1-2 [0.8.0-alpha.1+build.51] +Add lib/Agua/Ops/Stager: Restored Stager and removed tar step>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.51 \
--mode 1-2 \
--message "+Add lib/Agua/Ops/Stager: Restored Stager and removed tar step" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:08 EST] AGUA 1-2 [0.8.0-alpha.1+build.50] -Add .gitattributes: Added .gitignore/attributes and stager.pm/conf>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.50 \
--mode 1-2 \
--message "-Add .gitattributes: Added .gitignore/attributes and stager.pm/conf" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:07 EST] AGUA 1-2 [0.8.0-alpha.1+build.49] +Fix lib/Agua/Ops/Stager: test method 'commitRepo'>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.49 \
--mode 1-2 \
--message "+Fix lib/Agua/Ops/Stager: test method 'commitRepo'" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:46:07 EST] AGUA 1-2 [0.8.0-alpha.1+build.48] +Fix lib/Agua/Ops/Stager: test method 'sourceToTarget'>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.48 \
--mode 1-2 \
--message "+Fix lib/Agua/Ops/Stager: test method 'sourceToTarget'" \
--SHOWLOG 4


</entry>
<entry [Wed 2012:11:21 00:29:54 EST] AGUA 1-2 [0.8.0-alpha.1+build.47] +Fix all: Enabled tests - 100% operational>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.47 \
--mode 1-2 \
--message "+Fix lib/Agua/Ops/Stager: Restored from previous working state" \
--SHOWLOG 4


</entry>
<entry [Tue 2012:11:20 00:28:52 EST] AGUA 1-2 [0.8.0-alpha.1+build.46] +Fix all: Enabled tests - 100% operational>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.46 \
--mode 1-2 \
--message "+Fix all: Enabled tests - 100% operational

* 0cfb924 +Fix bin,lib: Uml - tests 100% enabled
* 46c45de +Fix lib/Agua/Common/View: no change, enabled View test
* 6c5fa0b -Onw html,lib: Completed tests to 95%, onw Uml/Role & Agua::View
* 0f602bf +Fix bin/scripts/repos.sh: doRepos calls gitConfig
* acbae68 +Add bin/scripts/repos.sh: Added gitConfig methodd
* 081bd00 +Add bin/scripts/resources/agua/perlmods.txt: added Sub::Override
* 20d09c9 +Fix Removed all redirection, enabled pauseLog & resumeLog
* 17e1296 +Fix lib: Package & Install - enabled test suite
* f086e7b +Fix lib/Agua/Common/Package/Upgrade: added logger
* 5c34fac +Add lib: Agua::StarCluster now uses StarCluster::Instance
* 0cb20a7 +Add lib: Agua::Logger for use by Ops::Install for htmlLog
* 36191c6 +Mov lib: Instance::StarCluster goes to StarCluster::Instance
* 88b3750 +Fix lib/Agua/Ops/GitHub: addRemote address changed from / to :

" \
--SHOWLOG 4



</entry>
<entry [Fri 2012:10:26 02:18:39 EST] AGUA 1-2 [0.8.0-alpha.1+build.45] +Add html: build 034 post-migrate admin to apps & cloud>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.45 \
--mode 1-2 \
--message "+Add html: build 034 post-migrate admin to apps & cloud" \
--SHOWLOG 4

    
</entry>   
<entry [Fri 2012:10:26 02:18:39 EST] AGUA 1-2 [0.8.0-alpha.1+build.44] +Add html: build 033>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.44 \
--mode 1-2 \
--message "+Add html: build 033" \
--SHOWLOG 4

    
</entry>
<entry [Fri 2012:10:26 02:18:39 EST] AGUA 1-2 [0.8.0-alpha.1+build.43] +Add Agua::Uml, refactored Workflow/StarCluster>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.43 \
--mode 1-2 \
--message "+Add Agua::Uml, refactored Workflow/StarCluster

Summary
Added lib/Agua/Uml
    Provides user-role stats
    Three modes: roleUser, roleUsers and userRoles
    to do: Enable mode 'allRoleUsers'
Added lib/Agua/Balancer
    Is run periodically by cron script
    Restarts balancers killed by StarCluster errors
    Absorbs half of defunct Agua::Common::Balancer    
Fixed lib/Agua/StarCluster
    Refactored to absorb Agua::Common::Balancer
    All balancer-related methods now contained in StarCluster
    Increased encapsulation facilitates rapid change of methods
    Comprehensive tests using 'overrideSequence' method
Fixed lib/Agua/Workflow
    Simplified 'running' checks by 'runOnCluster' method
        - Three steps: cluster, balancer and sge
        - Three statuses per step: starting, running, error
    Added 'status' field to workflow and project tables
        - To do: Merge clusterWorkflowStatus and workflowStatus
    Comprehensive tests using 'overrideSequence' method
Fixed lib/Agua/Configure
    Enabled set mysql root password without using mysql root password
Fixed lib/Agua/Ops/GitHub
    Correct URL for fetchResetRemoteRepo when using private key
Added html/plugins/workflow/RunStatus
    Consolidates all RunStatus-related classes, templates, CSS, etc.
    To do: Move/copy runStatus-related images to RunStatus/images
    
    
c0c922e (HEAD, master) +Add html/plugins/workflow/RunStatus: Completed 'startup' test
* d43e76e +Add html/plugins/workflow/RunStatus - gathers all RunStatus classes
* 9c74c43 +Add bin/scripts/deploy.pl: New 'aguatest' option to install tests
* 0e6523d -Onw html/plugins/workflow: Move RunStatus.js into RunStatus folder
* 1c93373 +Fix lib/Agua/Ops: fetchResetRemoteRepo ok, Workflow tests ok
* 7dc5333 +Fix lib: Workflow tests all ok (fixed executeWorkflow)
* bbab476 +Add bin/sql: dump after add 'status' field to workflow & project
* 156ea92 +Fix lib/Agua/Workflow: workflowstatus in getStatus method
*   b4da4bd Merge branch 'master' of github.com:syoung/aguadev
|\  
| * fadd824 +Add lib: Workflow 26 tests completed
* | f2a9fdb +Add lib: Workflow 26 tests completed
|/  
* f2ad3bb -Onw lib: Workflow - nearly completed tests
* 0f87a6b -Onw lib: test Workflow/StarCluster: added overrideSequence
* f4124e1 -Onw bin,lib: Workflow::executeWorkflow test
* e666e54 -Onw lib: StarCluster refactor, checking launchCluster
* 668b324 -Onw lib: Workflow::startStarCluster must return pid
* 8d21b22 +Del lib/Agua/Common/Balancer: refactor to StarCluster & Balancer
* e2000a9 -Onw lib: refactoring Common::Balancer into StarCluster
* 3e2554a -Onw lib/Agua/Uml: Uml::roleUsers getUsers ok, onw printUml
* 4909e5c +Fix lib/Agua/Common/Util: getDirs double splice in loop
* 563f358 -Onw lib: Workflow/StarCluster refactor - balancer in or out?
* f2ad684 -Onw lib/Agua/Workflow: testing load/startStarCluster
* d429020 +Fix lib/Agua/Configure: _setMysqlPassword needed root password
* a26c233 -Onw lib: mv yCommon::Cluster::clusterIsRunning to StarCluster::isRunning
* 165a8a7 -Del bin,cgi-bin: cleaned up multiple file
* a3e33b6 -Add lib/Agua/Workflow: ex setStarClusterObject to loadStarCluster
* 2c4150f -Onw lib/Agua/Workflow: changed StarCluster->new to ->load
* dd0a271 -Onw lib/Agua/StarCluster:    ok clear/load, onw method redefines
* 4ee94b9 -Onw lib/Agua/Uml: enough for now, StarCluster onw
* 1a0a225 -Onw lib/Agua/Uml: Uml::_userRoles ok, onw allUserRoles
* 3b4ce6d -Onw lib/Agua/Uml: printUml OK, onw parent->hasCall
* 771dc7d -Onw lib/Agua/Uml: generateUml fails in recurse?
* d75f1d0 -Del stager.conf and stager.pm - misplaced files
* 3bc255c -Fix bin/scripts/repos.sh: starcluster remote and editor

" \
--SHOWLOG 4

    
</entry>
<entry [Fri 2012:10:26 02:18:39 EST] AGUA 1-2 [0.8.0-alpha.1+build.42] +Fix apps/.dummy, etc. and -Onw lib/Agua/Uml>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.42 \
--mode 1-2 \
--message "+Fix apps/.dummy, etc. and -Onw lib/Agua/Uml

* 32fab46 -Onw lib/Agua/Uml: doing Proto::setCalls
* 1d31837 -Onw lib/Agua/Uml: enabled Uml::_roleUser
* 3b7b9cc -Onw lib: UML - sticky error
* ac130e0 -Onw bin,lib: UML - doing Uml.t testRoleUser
* 489925f +Onw bin,lib: UML recovering lost code
* 08c7420 +Fix Added .dummy files to retain apps and log dirs
* ba7fdd4 +Fix .gitignore - Ensure log, apps and conf dirs are in repo
* 4375141 +Fix: bin/scripts/doRepos.sh - enabled clone and remote
* a8961d6 +Add bin/scripts/doRepos.sh - autoclone and add remotes

" \
--SHOWLOG 4

    
</entry>
<entry [Fri 2012:10:26 02:18:39 EST] AGUA 1-2 [0.8.0-alpha.1+build.41] +Add lib: Agua::Deploy::tests, installs to /agua/t>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguadev/stager.pm \
--version 0.8.0-alpha.1+build.41 \
--mode 1-2 \
--message "+Add lib: Agua::Deploy::tests, installs to /agua/t

+Fix lib: Agua::Deploy implementation completed

+Fix .gitignore: exclude apps/starcluster from repo

" \
--SHOWLOG 4

    
</entry>
<entry [Sun 2012:10:07 05:37:04 EST] AGUA 2-3 (PUBLISH DEVEL) 0.8.0-alpha.1+build37 +Add: Html build 032, solved init 'attaching' error>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build37 \
--sourcerepo /repos/private/syoung/agua \
--targetrepo /repos/public/agua/aguadev \
--description "+Add: Html build 032, solved init 'attaching' error"

git commit --amend

+Fix: Solved init 'attaching' error, enabled use snapshot
+Add: Html build 031, 7-13 times faster than without build
+Fix: Refactored init.html with hideable progress log
+Add: Toaster allows different styles by message type
+Add: Bottom tray launcher for FileManager and Upgrade Log 
+Add: Build 027 (7-13 times faster than no build)
+Fix: Moved reload.js files to avoid reload using build
+Fix: Missing *.js files due to bad regex in build.pl
+Fix: Temporary fix for Files binary test
+Add: Replaced Net::OpenSSH with Agua::Ssh

</entry>
<entry [Sun 2012:10:07 05:37:04 EST] AGUA 1-2 0.8.0-alpha.1+build37 +Add: Build 032 - Fixed Admin Aws and Hub panels>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build37 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Build 032 - Fixed Admin Aws and Hub panels"

    OK

</entry>
<entry [Sun 2012:10:07 04:15:10 EST] AGUA 1-2 0.8.0-alpha.1+build36 +Fix: Solved 'attaching' error, enabled use snapshot>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build36 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Solved 'attaching' error, enabled use snapshot"

git commit --amend

+Fix: Solved 'attaching' error during init
-Fix: Purged 'dbobject' from lib modules
+Fix: Admin Aws and Hub panels: setAws/HubCert


</entry>
<entry [Sat 2012:09:29 23:26:57 EST] AGUA 1-2 0.8.0-alpha.1+build35 +Add: Init full mount enabled, refactored init plugin>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build35 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Init full mount enabled, refactored init plugin"

git commit --amend

Build 031 - Refactored init.html and added Toaster
Completed Init progressButton and new Toaster
Improved progress log style, fixed URL
Completed Init.pm, enabled full mount


</entry>
<entry [Sat 2012:09:29 23:26:57 EST] AGUA 1-2 0.8.0-alpha.1+build34 +Add: Adminuser input for Init>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build34 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Adminuser input for Init"

git commit --amend

Added 'adminuser' to Init (front and backend)
    Init::addAdminUser creates linux account
Fixed minor bugs in Init.js


</entry>
<entry [Sat 2012:09:29 23:26:57 EST] AGUA 1-2 0.8.0-alpha.1+build33 +Fix: Restored filemanager and improved Init>

git config --global user.name "Stuart Young"
git config --global user.email aguadev@gmail.com

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build33 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Restored filemanager and improved Init"

git commit --amend

First build after fixed executeWorkflow

Added cssOptimize build option and fixed reload.js files

Load times are now within a reasonable range for casual user:
Initial load is 2 seconds (7 times faster)
Plugins load is 6 seconds (13 times faster)
Workflow pane load is 5 seconds (8 times faster)

</entry>
<entry [Mon 2012:09:24 02:31:16 EST] AGUA 1-2 0.8.0-alpha.1+build32 +Add: Build 027 (7-13 times faster than no build)>

RESET AUTHOR/EMAIL:

git config --global user.name "Stuart Young"
git config --global user.email aguadev@gmail.com


/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build32 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Build 027 (7-13 times faster than no build)"

git commit --amend

First build after fixed executeWorkflow

Added cssOptimize build option and fixed reload.js files

Load times are now within a reasonable range for casual user:
Initial load is 2 seconds (7 times faster)
Plugins load is 6 seconds (13 times faster)
Workflow pane load is 5 seconds (8 times faster)

Todo: Restore FileManager auto load on startup
    
    
</entry>
<entry [Sat 2012:09:15 04:41:14 EST] AGUA 1-2 0.8.0-alpha.1+build31 +Add: Agua logo to login, fixed login message>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build31 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Agua logo to login, fixed login message"
    
</entry>
<entry [Sat 2012:09:15 04:41:14 EST] AGUA 1-2 0.8.0-alpha.1+build30 +Fix: Temporary fix for Files binary test>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build30 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Temporary fix for Files binary test"
    
</entry>
<entry [Sat 2012:09:15 03:17:54 EST] AGUA 1-2 0.8.0-alpha.1+build29 +Add: Replace Net::OpenSSH with Agua::Ssh>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build29 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Replace Net::OpenSSH with Agua::Ssh"
    
</entry>
<entry [Sun 2012:09:09 03:14:48 EST] AGUA 1-2 0.8.0-alpha.1+build28 +Add: Custom StarCluster log file>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build28 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Custom StarCluster log file"
    
</entry>
<entry [Wed 2012:09:05 02:36:41 EST] AGUA 1-2 0.8.0-alpha.1+build27 +Fix: Temporary fix for Home progress timer>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build27 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Temporary fix for Home progress timer"

    OK

</entry>
<entry [Wed 2012:09:05 02:36:41 EST] AGUA 1-2 0.8.0-alpha.1+build26 +Fix: Home progress pane title>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build26 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Home progress pane title"

    OK

</entry>
<entry [Wed 2012:09:05 02:29:56 EST] AGUA 1-2 0.8.0-alpha.1+build25 +Fix: Home progress pane title - use package name>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build25 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Home progress pane title - use package name"

    OK

</entry>
<entry [Wed 2012:09:05 01:39:56 EST] AGUA 1-2 0.8.0-alpha.1+build24 +Fix: Enabled install bioapps (biorepo 0.7.6+build13)>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build24 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Enabled install bioapps (biorepo 0.7.6+build13)"

    OK

</entry>
<entry [Tue 2012:09:04 03:04:51 EST] AGUA 1-2 0.8.0-alpha.1+build23 +Fix: Agua upgrade failure due to bug in Logger>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build23 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Agua upgrade failure due to bug in Logger"

    OK

</entry>
<entry [Sun 2012:09:02 13:22:56 EST] AGUA 1-2 0.8.0-alpha.1+build22 +Add: Custom files and Home update log dock node>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build22 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Custom files and Home update log dock node"

    OK

git commit --amend

    Fix: Config memory and updateStatus fields
    Fix: Changed upgrade tempdir from /tmp to /tempconf
    Fix: Corrected setWorkflowDir to include opsrepo

</entry>
<entry [Thu 2012:08:30 01:49:51 EST] AGUA 1-2 0.8.0-alpha.1+build21 -Fix: Config memory and updateStatus fields>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build21 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: Config memory and updateStatus fields"

    OK
    
</entry>
<entry [Wed 2012:08:29 20:12:53 EST] AGUA 1-2 0.8.0-alpha.1+build20 -Fix: Bad tempdir - chmod 700 /tmp on upgrade>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build20 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: Bad tempdir - chmod 700 /tmp on upgrade"

    OK
    
</entry>
<entry [Wed 2012:08:29 01:02:35 EST] AGUA 1-2 0.8.0-alpha.1+build19 -Fix: Change setWorkflowDir to include opsrepo>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build19 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: Change setWorkflowDir to include opsrepo"

    OK

</entry>
<entry [Sat 2012:08:25 01:53:02 EST] AGUA 1-2 0.8.0-alpha.1+build18 +Add: Install.pm call to terminalInstall>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build18 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Install.pm call to terminalInstall"

    OK

</entry>
<entry [Wed 2012:08:22 00:26:13 EST] AGUA 1-2 0.8.0-alpha.1+build17 -Fix: Removed validate() in _addProject>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build17 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: Removed validate() in _addProject"

    OK

</entry>
<entry [Wed 2012:08:22 00:26:13 EST] AGUA 1-2 0.8.0-alpha.1+build16 -Fix: Wiped conf dir, updated agua.pm>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build16 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: Wiped conf dir, updated agua.pm"

    OK

</entry>
<entry [Sat 2012:08:18 22:59:28 EST] AGUA 1-2 0.8.0-alpha.1+build15 -Fix: Removed conf dir, installer jbrowse dirs>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build15 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: Removed conf dir, installer jbrowse dirs"

    OK

</entry>
<entry [Sat 2012:08:18 22:59:28 EST] AGUA 1-2 0.8.0-alpha.1+build15 -Fix: Removed conf/.repos link to private>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build15 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: Removed conf/.repos link to private"

    OK

</entry>
<entry [Sat 2012:08:18 22:59:28 EST] AGUA 1-2 0.8.0-alpha.1+build14 +Fix: Renabled workflow panels>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build14 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Renabled workflow panels"

    OK

</entry>
<entry [Fri 2012:08:17 14:17:23 EST] AGUA 1-2 0.8.0-alpha+build13 +Add: Added Admin Hub and App/Workflow sync>

Add: Update sync App/Workflow after input hub login
Add: Added Sync button to Admin Apps panel
Add: Added privacy item to Admin Packages panel
Add: Sync multiline commit message, improved CSS
Add: Added Sync button to Workflows panel
Add: Added Admin Hub panel to input hub login info
Add: Added Agua::Common::Util::unTaint to face mods
Add: Refactored Admin Aws panel to autogenerate keys
Add: Added data argument to Logger::logStatus
Fix: Workflow::addAws (fixed StarCluster::getopts)

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build13 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "+Add: Added Admin Hub and App/Workflow sync"

    transfer.pl    version: 0.8.0-alpha.1+build13

</entry>
<entry [Sat 2012:07:21 02:57:36 EST] AGUA 1-2 0.8.0-alpha+build12 -Fix: FASTCGI installation enabled on 10.04>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build12 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: FASTCGI installation enabled on 10.04"

    transfer.pl    version: 0.8.0-alpha.1+build12

</entry>
<entry [Thu 2012:07:19 23:47:49 EST] AGUA 1-2 0.8.0-alpha+build11 -Fix: Tests workflow/execute and folders/copyfile ok>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build11 \
--sourcerepo /repos/private/syoung/aguadev \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: Tests workflow/execute and folders/copyfile ok"
    
    
</entry>
<entry [Thu 2012:07:19 19:10:30 EST] AGUA 1-2 (syoung:aguadev--syoung:agua) 0.8.0-alpha+build10 -Fix: Tests 100%, onworking cluster start/stop>

1. MOVED /agua/t TO /repos/private/syoung/aguatestdev AND LINKED BACK

mv /agua/t /repos/private/syoung/aguatestdev
ln -s /repos/private/syoung/aguatestdev /agua/t


2. DID TRANSFER AGUA 1-2 (syoung:aguadev--syoung:agua)

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build10 \
--sourcerepo /agua \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: Tests 100%, onworking cluster start/stop"

    OK

    0d3b522 (HEAD, tag: 0.8.0-alpha.1+build10, lin/master, github/master, bit/master, master)
    -Fix: Tests 100% - completed View.t

    
</entry>
<entry [Fri 2012:06:29 15:06:22 EST] ABORTED AGUA 1-2 (syoung:aguadev--syoung:agua) 0.8.0-alpha+build10 -Fix: getRemoteTagsTimeout, add fetchResetRemoteRepo>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--versiontype build \
--sourcerepo /agua \
--targetrepo /repos/private/syoung/agua \
--description "-Fix: getRemoteTagsTimeout, add fetchResetRemoteRepo"


cd /repos/private/syoung/agua
gitlog
    * bffe7b3 (HEAD, tag: 0.8.0-alpha.1+build10, master) -Fix: getRemoteTagsTimeout,
    * 17c2106 (tag: 0.8.0-alpha.1+build9, linode/master, github/master, bit/master) 
    * aed6c01 (tag: 0.8.0-alpha.1+build8) +Add: All enabled tests 100% complete
    * ed15112 -Fix: Remove old README.md file
    ...


    
NOTES
-----

REMOVE BUILD TAG FROM COMMIT MESSAGE BEFORE REDO

SEE git.xls [Fri 2012:06:29 15:19:16 EST] EDIT COMMIT MESSAGE

1. EDIT COMMIT MESSAGE

CHECK MESSAGES BEFORE

gitlog
    * 716b2f5 (HEAD, master) [0.8.0-alpha.1+build10] +Fix: Make getRemoteTagsTimeout conform to API v3
    * e053d5d (tag: 0.8.0-alpha.1+build10, linode/master, github/master, bit/master) [0.8.0-alpha.1+build9] +Fix: Move tests dev to autonomous lin
    * abd9b3c (tag: 0.8.0-alpha.1+build9) -Fix: Completed tests refactor post-link + 'prove'
    * 1933730 -Fix: Common/Package tests using github OAuth

EDIT MESSAGE

git commit --amend -m "+Fix: Make getRemoteTagsTimeout conform to API v3"
gitlog
    * 8d86b78 (HEAD, master) +Fix: Make getRemoteTagsTimeout conform to API v3
    * e053d5d (tag: 0.8.0-alpha.1+build10, linode/master, github/master, bit/master) [0.8.0-alpha.1+build9] +Fix: Move tests dev to autonomous link
    * abd9b3c (tag: 0.8.0-alpha.1+build9) -Fix: Completed tests refactor post-link + 'prove'
    * 1933730 -Fix: Common/Package tests using github OAuth
    ...

2. REMOVE TAG

git tag -d 0.8.0-alpha.1+build10
gitlog
    * 8d86b78 (HEAD, master) +Fix: Make getRemoteTagsTimeout conform to API v3
    * e053d5d (linode/master, github/master, bit/master) [0.8.0-alpha.1+build9] +Fix: Move tests dev to autonomous linked dir
    * abd9b3c (tag: 0.8.0-alpha.1+build9) -Fix: Completed tests refactor post-link + 'prove'
    * 1933730 -Fix: Common/Package tests using github OAuth

    OK
    

</entry>
<entry [Tue 2012:06:26 23:52:57 EST] AGUA syoung:aguadev--syoung:agua, 0.8.0-alpha+build9 +Fix: Move tests dev to autonomous linked dir>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--versiontype build \
--sourcerepo /agua \
--targetrepo /repos/private/syoung/agua \
--description "+Fix: Move tests dev to autonomous linked dir"

    OK BUT HAD TO MANUALLY --force PUSH TO GITHUB
    
</entry>
<entry [Wed 2012:06:06 09:33:47 EST] AGUA 0.8.0-alpha+build8: +Add: All enabled tests 100% complete>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--versiontype build \
--sourcerepo /agua \
--targetrepo /repos/private/syoung/agua \
--description "+Add: All enabled tests 100% complete"

    transfer.pl    repofile: /home/syoung/RELEASE/agua.0.8.0-alpha.1+build8-60c7a32.tar.gz
    transfer.pl    version: 0.8.0-alpha.1+build8


CHANGE GITHUB SOURCE FOR agua FROM agua:agua TO syoung:agua

select owner, username, package, status, version from package;
    +--------+----------+---------------+--------+----------------------+
    | owner  | username | package       | status | version              |
    +--------+----------+---------------+--------+----------------------+
    | syoung | syoung   | workflows     | ready  | 0.0.1                |
    | syoung | syoung   | apps          | ready  | 0.0.1                |
    | syoung | syoung   | bioapps       | ready  | 0.7.0                |
    | agua   | admin    | agua          | ready  | 0.8.0-alpha.1+build6 |

update package SET owner = 'syoung' WHERE username='admin' AND package='agua';

select owner, username, package, status, version from package;
    +--------+----------+---------------+--------+----------------------+
    | owner  | username | package       | status | version              |
    +--------+----------+---------------+--------+----------------------+
    | syoung | syoung   | workflows     | ready  | 0.0.1                |
    | syoung | syoung   | apps          | ready  | 0.0.1                |
    | syoung | syoung   | bioapps       | ready  | 0.7.0                |
    | syoung | admin    | agua          | ready  | 0.8.0-alpha.1+build6 |

", ", $self->self->self->logDebug("DEBUG EXIT") and exit;

</entry>
(), "(), "