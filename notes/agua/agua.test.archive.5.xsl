agua.test.archive.5


<entry [Sat 2012:09:08 03:27:51 EST] sge.py MISSING admin-microcluster/common FILES>

SUMMARY:

/opt/sge6/CELL/common AND OTHER FILES HAVEN'T BEEN COPIED FROM /opt/sge6/default


reset; echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-microcluster","SHOWLOG":5}' | ./workflow.pl

PRODUCES THIS LOG

/tmp/starcluster-debug-root.log

    PID: 4160 sge.py:185 - INFO - export EC2_PRIVATE_KEY=/agua/conf/.ec2/admin/private.pem; export EC2_CERT=/agua/conf/.ec2/admin/public.pem; ec2-authorize default -p 36351 -P tcp
    PID: 4160 sge.py:185 - INFO - export EC2_PRIVATE_KEY=/agua/conf/.ec2/admin/private.pem; export EC2_CERT=/agua/conf/.ec2/admin/public.pem; ec2-authorize default -p 36351 -P udp
    PID: 4160 sge.py:610 - INFO - Copying cell directory on head node
    PID: 4160 sge.py:611 - DEBUG - sge.CreateCell.copyCellOnHead    CreateCell.copyCellOnHead()
    PID: 4160 sge.py:613 - DEBUG - sge.CreateCell.copyCellOnHead    commands: ('mkdir /opt/sge6/admin-microcluster &> /dev/null', 'rsync -a /opt/sge6/default/* /opt/sge6/admin-microcluster \
    --exclude *tar.gz', 'chown -R sgeadmin:sgeadmin /opt/sge6/admin-microcluster')
    PID: 4160 sge.py:616 - DEBUG - sge.CreateCell.copyCell    target: /opt/sge6/admin-microcluster
    PID: 4160 sge.py:617 - DEBUG - sge.CreateCell.copyCellOnHead    os.path.isdir(target): True
    PID: 4160 sge.py:630 - INFO - Copying cell directory on master
    PID: 4160 sge.py:631 - DEBUG - sge.CreateCell.copyCell    CreateCell.copyCell(master)
    PID: 4160 sge.py:633 - DEBUG - sge.CreateCell.copyCell    commands: ('mkdir /opt/sge6/admin-microcluster &> /dev/null', 'rsync -a /opt/sge6/default/* /opt/sge6/admin-microcluster --excl\
    ude *tar.gz', 'chown -R sgeadmin:sgeadmin /opt/sge6/admin-microcluster')
    PID: 4160 sge.py:636 - DEBUG - sge.CreateCell.copyCell    target: /opt/sge6/admin-microcluster
    PID: 4160 sge.py:637 - DEBUG - sge.CreateCell.copyCell    os.path.isdir(target): True
    PID: 4160 sge.py:640 - INFO - mkdir /opt/sge6/admin-microcluster &> /dev/null
    PID: 4160 sge.py:533 - DEBUG - sge.CreateCell.createSettings    cmd: cd /opt/sge6/admin-microcluster/common; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export SGE_QM\
    ASTER_PORT=36351; export SGE_EXECD_PORT=36352; /opt/sge6/util/create_settings.sh /opt/sge6/admin-microcluster/common
    cPID: 4160 ssh.py:399 - ERROR - command 'cd /opt/sge6/admin-microcluster/common; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export SGE_QMASTER_PORT=36351; export SGE\
    _EXECD_PORT=36352; /opt/sge6/util/create_settings.sh /opt/sge6/admin-microcluster/common' failed with status 2
    PID: 4160 ssh.py:405 - DEBUG - bash: line 0: cd: /opt/sge6/admin-microcluster/common: No such file or directory
    PID: 4160 ssh.py:405 - DEBUG - /opt/sge6/util/create_settings.sh: 67: cannot create /opt/sge6/admin-microcluster/common/settings.csh: Directory nonexistent
    PID: 4160 ssh.py:405 - DEBUG - /opt/sge6/util/create_settings.sh: 68: cannot create /opt/sge6/admin-microcluster/common/settings.csh: Directory nonexistent
    PID: 4160 ssh.py:405 - DEBUG - /opt/sge6/util/create_settings.sh: 69: cannot create /opt/sge6/admin-microcluster/common/settings.csh: Directory nonexistent
    PID: 4160 ssh.py:405 - DEBUG - /opt/sge6/util/create_settings.sh: 70: cannot create /opt/sge6/admin-microcluster/common/settings.csh: Directory nonexistent

    
</entry>
<entry [Thu 2012:09:06 05:10:41 EST] Workflow::executeWorkflow>

FIREBUG:


var doIt = function () {
    console.clear();
    Agua.doPut(
    {
        query:{
            "cluster":"admin-microcluster",
            "project":"Project1",
            "workflow":"Workflow1",
            "workflownumber": 1,
            "start":1,
            "username":"admin",
            "sessionId":"9999999999.9999.999",
            "mode":"executeWorkflow",
            "submit":1,
            "SHOWLOG":5
        },
        url: "../cgi-bin/agua/workflow.cgi"
    });
};
doIt();



COMMAND LINE:

reset; echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-microcluster","SHOWLOG":5}' | ./workflow.pl


FAILS AT:

2012-09-19 07:29:46        [DEBUG]   	Agua::Common::Util::createDir	135	directory: /nethome/admin/agua/Project1/Workflow1/scripts
2012-09-19 07:29:46        [DEBUG]   	Agua::Common::Util::createDir	135	directory: /nethome/admin/agua/Project1/Workflow1/stdout
2012-09-19 07:29:47        [DEBUG]   	Agua::Common::Util::createDir	135	directory: /nethome/admin/agua/Project1/Workflow1/stdout
2012-09-19 07:29:47        [DEBUG]   	Agua::Workflow::getMonitor	898	Doing require Agua/Monitor/SGE.pm


STARTED CLUSTER:

    ...
    The cluster has been started and configured.
    Login to the master node as root by running:
    
        $ starcluster sshmaster admin-microcluster
    
    When you are finished using the cluster, run:
    
        $ starcluster stop admin-microcluster
    
    to shutdown the cluster and stop paying for service.
    
    If this cluster uses EBS instances then the 'stop' command
    above will put all nodes into a 'stopped' state. The cluster
    may then be restarted at a later time, without losing data,
    by passing the -x option to the 'start' command.
    
    To completely terminate an EBS cluster:
    
        $ starcluster terminate admin-microcluster
    
    NOTE: Terminating an EBS cluster will destroy all volumes
    backing the nodes.
    >>> Starting cluster took 8.927 mins

cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/admin-microcluster.config \
shell


easy_install ipython

    Searching for ipython
    Best match: ipython 0.13
    Processing ipython-0.13-py2.6.egg
    ipython 0.13 is already the active version in easy-install.pth
    Installing ipcontroller script to /usr/local/bin
    Installing iptest script to /usr/local/bin
    Installing ipcluster script to /usr/local/bin
    Installing ipython script to /usr/local/bin
    Installing pycolor script to /usr/local/bin
    Installing iplogger script to /usr/local/bin
    Installing irunner script to /usr/local/bin
    Installing ipengine script to /usr/local/bin
    
    Using /usr/local/lib/python2.6/dist-packages/ipython-0.13-py2.6.egg
    Processing dependencies for ipython
    Finished processing dependencies for ipython



ONWORKING START MASTER SGE:


2012-09-09 10:14:14        [DEBUG]   	Agua::Common::Ssh::setRemoteSsh	55	Agua::Common::Ssh::setRemoteSsh(keypairfile, targetip)
2012-09-09 10:14:14        [DEBUG]   	Agua::Common::Ssh::setRemoteSsh	65	keypairfile: /nethome/admin/.starcluster/id_rsa-admin-key
2012-09-09 10:14:14        [DEBUG]   	Agua::Common::Ssh::setRemoteSsh	66	keypairfile: /nethome/admin/.starcluster/id_rsa-admin-key
2012-09-09 10:14:14        [DEBUG]   	Agua::Common::Ssh::setRemoteSsh	67	targetip: 10.123.2.105
2012-09-09 10:14:14        [DEBUG]   	Agua::Common::SGE::setMasterOpsRemote	1181	remote: ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@10.123.2.105
2012-09-09 10:14:14        [DEBUG]   	Agua::Common::SGE::setMasterOpsRemote	1183	self->master->ops: bless( {"apiroot":"https://api.github.com","opsmodloaded":0,"filetype":"ext3","parser":bless( do{\(my $o = 0)}, "JSON::Backend::XS::Supportable" ),"remoteroot":"https://api.github.com/repos","credentials":"","remote":"ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@10.123.2.105","instancetypeslots":{"m2.4xlarge":26,"cg1.4xlarge":34,"c1.xlarge":20,"c1.medium":5,"m1.xlarge":8,"m1.large":4,"t1.micro":1,"m1.small":1,"m2.2xlarge":13,"m2.xlarge":7,"cc1.4xlarge":34},"showreport":1,"privacy":"public","backup":0,"fileroot":"","versionformat":"semver","hubtype":"github","conf":bless( {"indent":4,"ignore":"#;\\[?","inputfile":"/agua/cgi-bin/conf/default.conf","OLDSHOWLOG":2,"memory":0,"comment":"#","SHOWLOG":2,"OLDPRINTLOG":2,"PRINTLOG":4,"backup":1,"logfile":"/agua/cgi-bin/log/admin.workflow.log","valueoffset":24,"spacer":"\\t=\\s"}, "Conf::Agua" ),"indent":4,"githubapi":"https://api.github.com","package":"","OLDSHOWLOG":2,"SHOWLOG":2,"keyfile":"","PRINTLOG":2,"OLDPRINTLOG":2,"sleep":600}, "Moose::Meta::Class::__ANON__::SERIAL::11" )
2012-09-09 10:14:14        [DEBUG]   	Agua::Common::SGE::checkMasterSge	832	Agua::Workflow::checkMasterSge(qmasterport, execdport)
2012-09-09 10:14:14        [DEBUG]   	Agua::Common::SGE::checkMasterSge	835	BEFORE qmaster_running: 0
2012-09-09 10:14:14        [DEBUG]   	Agua::Common::SGE::checkMasterSge	837	BEFORE execd_running: 0
2012-09-09 10:14:14        [DEBUG]   	Agua::Common::SGE::restartMasterSge	1248	Common::SGE::restartMasterSge(qmasterport, execdport)
2012-09-09 10:14:15        [DEBUG]   	Agua::Common::SGE::startMasterSge	1265	command: export SGE_QMASTER_PORT=36351; export SGE_EXECD_PORT=36352; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/sge_qmaster
2012-09-09 10:14:17        [DEBUG]   	Agua::Common::SGE::checkMasterSge	846	AFTER qmaster_running: 0
2012-09-09 10:14:17        [DEBUG]   	Agua::Common::SGE::checkMasterSge	848	AFTER execd_running: 0
{"error":"Could not restart qmaster","subroutine":"Agua::Common::SGE::checkMasterSge","linenumber":"849","filename":"/agua/cgi-bin/lib/Agua/Common/SGE.pm","timestamp":"2012-09-09 10:14:17"}


    
</entry>
<entry [Thu 2012:09:06 01:04:14 EST] Cluster::saveClusterWorkflow>

reset; echo '{"cluster":"admin-microcluster","project":"Project1","workflow":"Workflow1","username":"admin","sessionId":"1346907647.9014.980","mode":"saveClusterWorkflow","SHOWLOG":5}' | ./workflow.pl



var doIt = function () {
    console.clear();
    Agua.doPut(
    {
        query:{
            "cluster":"",
            "project":"Project1",
            "workflow":"Workflow1",
            "username":"admin",
            "sessionId":"1346907647.9014.980",
            "mode":"saveClusterWorkflow",
            "SHOWLOG":5
        },
        url: "../cgi-bin/agua/workflow.cgi"
    });
};
doIt();


    
</entry>
<entry [Thu 2012:09:06 00:44:30 EST] Cluster::addCluster>

reset; echo '{"cluster":"admin-microcluster","minnodes":"1","maxnodes":"1","instancetype":"t1.micro","amiid":"ami-c6a877af","availzone":"us-east-1a","description":"Description","username":"admin","sessionId":"1346905744.5899.867","mode":"newCluster","SHOWLOG":5}' | ./workflow.pl



var doIt = function () {

console.clear();
Agua.doPut(
{
query:{

"cluster":"admin-microcluster",
"minnodes":"1",
"maxnodes":"1",
"instancetype":"t1.micro",
"amiid":"ami-c6a877af",
"availzone":"us-east-1a",
"description":"Description",
"username":"admin",
"sessionId":"1346905744.5899.867",
"mode":"newCluster",
"SHOWLOG":5

},
url: "../cgi-bin/agua/workflow.cgi"

});

};
doIt();


    
</entry>
<entry [Mon 2012:09:03 02:14:22 EST] UPGRADE BIOAPPS INSTALL IN BIOREPOSITORY 0.7.6+build13>

reset ; echo '{"username":"admin","sessionId":"9999999999.9999.999","package":"bioapps","repository":"bioapps","version":"0.7.3","privacy":"public","owner":"syoung","installdir":"/agua/bioapps","mode":"upgrade","random":510843297447,"SHOWLOG":4}' | ./workflow.pl


FIREBUG:

var doIt = function () {

console.clear();
Agua.doPut(
{
query:{

"username":"admin",
"sessionId":"9999999999.9999.999",
"package":"bioapps",
"repository":"bioapps",
"version":"0.7.3",
"privacy":"public",
"owner":"syoung",
"installdir":"/agua/bioapps",
"mode":"upgrade",
"random":510843297447,
"SHOWLOG":5

},
url: "../cgi-bin/agua/workflow.cgi"

});

};
doIt();


var home = Agua.controllers["home"].tabPanes[0];
//home.stopProgress();



{"timer":148,"isRunning":false,"interval":30000,"onStart":null,"onStop":null}



http://ec2-23-20-206-228.compute-1.amazonaws.com/agua/agua.html?admin,9999999999.9999.999,data.home

var home = Agua.controllers["home"].tabPanes[0];
console.dir({home:home});
home.stopProgress();
home.timer.interval = 999999999;
console.dir({timer:home.timer});

</entry>
<entry [Mon 2012:09:03 02:14:22 EST] UPGRADE AGUA 0.8.0-alpha.1+build22 WITH CUSTOM DOCK NODES>

SUMMARY

SOLVED UPGRADE FAILURE AND MISSING/GARBLED LOGS ON UPGRADE agua BY SEPARATION OF CONCERNS IN Logger

1. REMOVED STDOUT/STDERR REDIRECTS FROM Logger

2. REMOVED logfile FROM install.pl ARGUMENTS IN agua.pm

3. LATER: ADD logStderr/logStdout TO Logger TO HANDLE NEED TO CATCH STDERR/STDOUT


PROBLEM

er
    [Mon Sep 03 07:13:53 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi"stderr: Use of uninitialized value $aguaversion in concatenation (.) or string at /agua/repos/public/syoung/biorepository/syoung/agua/agua.pm line 46., referer: http://ec2-107-21-144-62.compute-1.amazonaws.com/agua/agua.html?admin,9999999999.9999.999,data.home
    [Mon Sep 03 07:13:58 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: Use of uninitialized value $logfile in concatenation (.) or string at /agua/repos/public/syoung/biorepository/syoung/agua/agua.pm line 105., referer: http://ec2-107-21-144-62.compute-1.amazonaws.com/agua/agua.html?admin,9999999999.9999.999,data.home
    Option logfile requires an argument
    No options specified. Try '--help'


INSTALLED AGUA 0.8.0-alpha.1+build.22 MANUALLY

THEN GOT THIS ERROR:


2012-09-03 08:09:07    [DEBUG]          Agua::Common::Package::Upgrade::upgrade 74      upgrade    self->dbobject(): bl\
ess( {"sqlite":"","dbfile":undef,"oldout":\*{"Agua::Common::Logger::$oldout"},"logfh":\*{"Agua::Common::Logger::$logfh"\
},"password":"open4agua","dbtype":"mysql","user":"agua","backup":0,"logfile":"/agua/cgi-bin/log/admin.workflow.log","ol\
derr":\*{"Agua::Common::Logger::$olderr"},"indent":4,"database":"agua","OLDSHOWLOG":2,"dbh":bless( {}, "DBI::db" ),"SHO\
WLOG":5,"PRINTLOG":5,"OLDPRINTLOG":2}, "Agua::DBase::MySQL" )
2012-09-03 08:09:07    [NOTE]           Agua::DBase::MySQL::initialise  62      self: bless( {"sqlite":"","dbfile":unde\
f,"oldout":\*{"Agua::Common::Logger::$oldout"},"logfh":\*{"Agua::Common::Logger::$logfh"},"password":"open4agua","dbtyp\
e":"mysql","user":"agua","backup":0,"logfile":"/agua/cgi-bin/log/admin.workflow.log","olderr":\*{"Agua::Common::Logger:\
:$olderr"},"indent":4,"database":"agua","OLDSHOWLOG":2,"dbh":"","SHOWLOG":5,"PRINTLOG":5,"OLDPRINTLOG":2}, "Agua::DBase\
::MySQL" )
2012-09-03 08:09:07    [NOTE]           Agua::DBase::MySQL::initialise  63      user: agua
2012-09-03 08:09:07    [NOTE]           Agua::DBase::MySQL::initialise  65      database: agua
2012-09-03 08:09:07    [NOTE]           Agua::DBase::MySQL::initialise  66      dsn: DBI:mysql:agua;mysql_local_infile=\
1
2012-09-03 08:09:07    [NOTE]           Agua::DBase::MySQL::initialise  69      dbh: bless( {}, "DBI::db" )
2012-09-03 08:09:07    [CALLER]         Agua::DBase::MySQL::queryhash   295     caller: Agua::Common::Package::getPacka\
ge       58      query: SELECT * FROM package
WHERE owner='syoung'
AND installdir='/agua'
AND package='biorepository'
2012-09-03 08:09:07    [CALLER]         Agua::DBase::MySQL::queryhash   295     caller: Agua::Common::Package::setLogin\
Credentials      66      query: SELECT login, token
        FROM hub
        WHERE username='admin'
        AND hubtype='github'

        

DIAGNOSIS

Logger::startLog REDIRECTS STDERR AND STDOUT, WHICH IS NOT DESIRED



SOLUTION

REMOVE REDIRECTS FROM Logger::startLog AND SHIFT TO logStderr/logStdout METHODS



FIREBUG:

var doIt = function () {

console.clear();
Agua.doPut(
{
query:{

"username":"admin",
"sessionId":"9999999999.9999.999",
"package":"agua",
"repository":"agua",
"version":"0.8.0-alpha.1+build22",
"privacy":"public",
"owner":"syoung",
"installdir":"/agua",
"mode":"upgrade",
"random":510843297447,
"SHOWLOG":5

},
url: "../cgi-bin/agua/workflow.cgi"

});

};
doIt();

var home = Agua.controllers["home"].tabPanes[0];
//home.stopProgress();
    
</entry>
<entry [Thu 2012:08:30 17:10:49 EST] Home PANE DOCK NODE - CHANGE IMAGE>

FIREBUG:

console.clear();
var home = Agua.controllers["home"].tabPanes[0];
home.progressPane.show();
var dockNode = home.progressPane.dockNode;
console.dir({dockNode:dockNode});

    
</entry>
<entry [Wed 2012:08:29 09:31:32 EST] agua - ADDED terminalInstall RESTART>

ON AQUARIUS:

reset ; echo '{"username":"admin","sessionId":"1346217137.6437.405","package":"agua","repository":"agua","version":"0.8.0-alpha.1+build19","privacy":"public","owner":"syoung","installdir":"/agua","mode":"upgrade","random":237904041551,"SHOWLOG":4}' | ./workflow.pl

    OK

ON TOSHIBA COPY agua.pm AND UPLOAD TO AQUARIUS:

cd /agua/repos/public/syoung/biorepository/syoung/agua
cp /repos/private/syoung/biorepodev/syoung/agua/agua.pm  .
sf biorepository.pm

    
</entry>
<entry [Tue 2012:08:28 03:01:18 EST] UPGRADE biorepository>

reset ; echo '{"username":"admin","sessionId":"1346132124.4329.63","package":"biorepository","repository":"biorepository","version":"0.7.6+build10","privacy":"public","owner":"syoung","installdir":"/agua/repos/public/agua/biorepository","mode":"upgrade","random":430409367890,"SHOWLOG":4}' | ./workflow.pl

ON TOSHIBA COPY biorepository.pm FROM syoung:biorepodev TO agua:biorepository AND UPLOAD TO AQUARIUS:

cd /agua/repos/public/syoung/biorepository/syoung/biorepository
cp /repos/private/syoung/biorepodev/syoung/biorepository/biorepository.pm  .
sf biorepository.pm


</entry>
<entry [Sat 2012:08:18 11:46:23 EST] UPGRADE agua ON AQUARIUS-8F2>

0.8.0-alpha.1+build16 - FIXED biorepository.pm (Agua::Common::Project::_addProject UNNECESSARY CALL TO validate), install.pl SET PERMISSIONS IN cgi-bin, ETC.:

reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","package":"agua","repository":"agua","version":"0.8.0-alpha.1+build16","privacy":"public","owner":"syoung","installdir":"/agua","mode":"upgrade","random":978259817990,"SHOWLOG":4}' | ./workflow.pl 

    OK

reset;  echo '{"username":"admin","sessionId":"9999999999.9999.999","package":"agua","repository":"agua","version":"0.8.0-alpha.1+build14","privacy":"private","owner":"syoung","installdir":"/agua","mode":"upgrade","random":978259817990,"SHOWLOG":4}' | ./workflow.pl


    OK
    
</entry>
<entry [Fri 2012:08:17 13:05:55 EST] RE-RUN doh TESTS IN FIREFOX>

var group = "t.plugins.admin.hub.test";
doh._groups[group] = [];
doh._testCount = 0;

// RUN TESTS
doh.register("t.plugins.admin.hub.test", [
{
...

    
</entry>
<entry [Fri 2012:08:17 00:12:39 EST] DOH VS SELENIUM>

http://rob.coup.net.nz/2008/01/automated-dojo-testing-doh-selenium-rc.html
    
</entry>
<entry [Fri 2012:08:17 00:04:46 EST] DOH + DJANGO COMMAND LINE TESTING>

http://africkinlazer.blogspot.com/2012/04/full-spectrum-testing-djangotest-dojos.html
    
</entry>
<entry [Thu 2012:08:16 20:12:52 EST] UPDATE APP IN APP ROW>

reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","mode":"saveApp","data":{"name":"ELAND","type":"aligner","executor":"XXXXX","package":"bioapps","location":"bin/aligners/ELAND.pl","localonly":0,"description":"Solexa/Illumina short read aligner (max 32 bps aligned)","notes":"","url":""},"SHOWLOG":4}' | ./workflow.pl


Sat Aug 18 06:16:17 UTC 2012

2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Install::startHtmlLog	293	AFTER logReport(page)
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Install::runInstall	89	before if ( self->can(preInstall) )
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Install::updateStatus	473	object: {
          'owner' => 'syoung',
          'installdir' => '/agua',
          'opsdir' => '/agua/repos/private/syoung/biorepository/syoung/agua',
          'version' => '0.8.0-alpha.1+build13',
          'status' => 'installing',
          'package' => 'agua',
          'username' => 'admin'
        }
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Install::updateTable	444	query: UPDATE package SET status = 'installing',
datetime = NOW()
WHERE owner = 'syoung'
AND package = 'agua'
AND installdir = '/agua'

2012-08-18 06:16:17	[REPORT]   	Updated status to 'installing'
2012-08-18 06:16:17	[REPORT]   	Installation directory: /agua
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Install::runInstall	109	installdir: /agua
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::runCommand	221	command: if [ -d /agua ]; then echo 1; else echo 0; fi
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::runCommand	260	output: 1

2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::runCommand	261	error: 
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Files::foundDirectory	36	returning found: 1
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Install::runInstall	111	found: 1
2012-08-18 06:16:17	[REPORT]   	Pulling from remote repo: agua (owner: syoung)
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Install::runInstall	136	Pulling from remote repo
2012-08-18 06:16:17    [CALLER]   	Agua::Ops::Git::changeToRepo	21	caller: Agua::Ops::Install::runInstall	20	
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Git::changeToRepo	22	directory: /agua
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::runCommand	221	command: if [ -d /agua ]; then echo 1; else echo 0; fi
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::runCommand	260	output: 1

2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::runCommand	261	error: 
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Files::foundDirectory	36	returning found: 1
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Git::changeToRepo	26	result: 1
2012-08-18 06:16:17    [DEBUG]   	Agua::Ops::Git::foundGitDir	38	gitrefs: /agua/.git
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::GitHub::fetchResetRemoteRepo	230	keyfile: /agua/conf/.repos/github/syoung/id_rsa
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::GitHub::setGitSsh	626	login: syoung
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::GitHub::setGitSsh	627	repotype: github
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::GitHub::setGitSsh	628	keyfile: /agua/conf/.repos/github/syoung/id_rsa
2012-08-18 06:16:18    [DEBUG]   	Agua::Common::Aws::getRepoKeyDir	351	login: syoung
2012-08-18 06:16:18    [DEBUG]   	Agua::Common::Aws::getRepoKeyDir	352	repotype: github
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::GitHub::setGitSsh	640	Doing createdir(/agua/conf/.repos/github/syoung)
2012-08-18 06:16:18    [DEBUG]   	Agua::Common::Util::createDir	190	directory: /agua/conf/.repos/github/syoung
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::GitHub::setGitSsh	650	content: #!/bin/sh
	
exec ssh -T -i /agua/conf/.repos/github/syoung/id_rsa -o "StrictHostKeyChecking no" -o "IdentitiesOnly yes" "$@"

exit 0

2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::runCommand	221	command: cd /agua; export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::runCommand	260	output: 
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::runCommand	261	error: 
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::runCommand	221	command: cd /agua; export GITSSH_KEYFILE=/agua/conf/.repos/github/syoung/id_rsa
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::runCommand	260	output: 
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::runCommand	261	error: 
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::GitHub::fetchResetRemoteRepo	233	command: export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;  git fetch git@github.com:syoung/agua.git 
2012-08-18 06:16:18    [DEBUG]   	Agua::Ops::runCommand	221	command: cd /agua; export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;  git fetch git@github.com:syoung/agua.git 
2012-08-18 06:16:19    [DEBUG]   	Agua::Ops::runCommand	260	output: 
2012-08-18 06:16:19    [DEBUG]   	Agua::Ops::runCommand	261	error: ERROR: Repository not found.
fatal: The remote end hung up unexpectedly

2012-08-18 06:16:19    [DEBUG]   	Agua::Ops::GitHub::fetchResetRemoteRepo	239	command: export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;  git fetch git@github.com:syoung/agua.git --tags 
2012-08-18 06:16:19    [DEBUG]   	Agua::Ops::runCommand	221	command: cd /agua; export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;  git fetch git@github.com:syoung/agua.git --tags 
2012-08-18 06:16:20    [DEBUG]   	Agua::Ops::runCommand	260	output: 
2012-08-18 06:16:20    [DEBUG]   	Agua::Ops::runCommand	261	error: ERROR: Repository not found.
fatal: The remote end hung up unexpectedly

2012-08-18 06:16:20    [DEBUG]   	Agua::Ops::GitHub::fetchResetRemoteRepo	244	command: export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;  git reset --hard FETCH_HEAD 2> /dev/null 
2012-08-18 06:16:20    [DEBUG]   	Agua::Ops::runCommand	221	command: cd /agua; export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;  git reset --hard FETCH_HEAD 2> /dev/null 
2012-08-18 06:16:20    [DEBUG]   	Agua::Ops::runCommand	260	output: 
2012-08-18 06:16:20    [DEBUG]   	Agua::Ops::runCommand	261	error: 
2012-08-18 06:16:20    [DEBUG]   	Agua::Ops::Install::runInstall	143	FAILED to fetch repo



RUN MANUALLY:

export GIT_SSH=/agua/conf/.repos/github/syoung/git-ssh.sh;  git fetch git@github.com:syoung/agua.git --tags

    ERROR: Repository not found.
    fatal: The remote end hung up unexpectedly


cat /agua/conf/.repos/github/syoung/git-ssh.sh;  

    #!/bin/sh
        
    exec ssh -T -i /agua/conf/.repos/github/syoung/id_rsa -o "StrictHostKeyChecking no" -o "IdentitiesOnly yes" "$@"
    
    exit 0


cat /agua/conf/.repos/github/syoung/id_rsa

    -----BEGIN PRIVATE KEY-----
    MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ
    WWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ
    NVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC
    gYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3
    8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG
    M6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC
    aE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK
    pzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9
    4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc
    6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC
    QQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN
    ukFcKuTSGIpO
    -----END PRIVATE KEY-----



    
</entry>
<entry [Thu 2012:08:16 08:01:18 EST] SYNC APPS>

reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","message":"Test Sync Apps","details":"","hubtype":"github","mode":"syncApps","SHOWLOG":4}' | ./workflow.pl

    
</entry>
<entry [Sun 2012:08:12 22:41:20 EST] SYNC WITH MULTILINE COMMIT MESSAGE>

reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","message":"test 2","details":"","hubtype":"github","mode":"syncWorkflows","SHOWLOG":4}' | ./workflow.pl



console.clear();
var workflows = Agua.controllers["workflow"].tabPanes[0].core.userWorkflows;
console.dir({workflows:workflows});
var syncdialog = workflows.syncDialog;

console.dir({syncdialog:syncdialog});

syncdialog.doEnter = function(type) {
// RUN ENTER CALLBACK IF 'ENTER' CLICKED
	console.log("SyncDialog.doEnter    plugins.dijit.SyncDialog.doEnter()");

	var inputs = this.validateInputs(["message", "details"]);
	console.log("SyncDialog.doEnter    inputs:");
	console.dir({inputs:inputs});
	if ( ! inputs ) {
		console.log("SyncDialog.doEnter    inputs is null. Returning");
		return;
	}

	// RESET
	this.message.set('value', "");
	this.details.innerHTML = "";

	// DO CALLBACK
    // HIDE
    this.hide();
	
	this.dialog.enterCallback(inputs);	
};



    
</entry>
<entry [Thu 2012:08:09 01:34:06 EST] SET DEPLOY KEY BEFORE SYNCING>


1. SYNC syoung:biorepository FAILS BECAUSE DEPLOY KEY NOT SET

reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","message":"test 2","details":"","hubtype":"github","mode":"syncWorkflows","SHOWLOG":4}' | ./workflow.pl

    FAIL

2. PASTE id_rsa.pub INTO DEPLOY KEY FOR syoung:biorepository

cat /agua/conf/.repos/github/syoung/id_rsa.pub

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCZ+6PKDlGlIE8CONGqEV65risoWVlmSXlnC4Z2HJrIAtheH/cx0vVKUXnFodkK6y11ZrvsXbsNXaH1sVAE/6f+dZRjleYcq3bbDKBw0DVSLwujNhEw/rc+Word5OmewNWlq1fOpu8rVOeZo+wZ4o17aTLyNJ17OfVVXoOHAcP0BQ==

syoung:biorepository --> Admin --> Deploy Keys

    ec2_private_key (74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e)

    
3. CAN NOW SYNC syoung:biorepository

reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","message":"test 2","details":"","hubtype":"github","mode":"syncWorkflows","SHOWLOG":4}' | ./workflow.pl
    
    OK


</entry>
