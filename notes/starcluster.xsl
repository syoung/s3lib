starcluster


<entry [Thu 2012:11:29 05:50:42 EST] FIXED ERROR 'no cqueue list defined'>


PROBLEM

GET 'no cqueue list defined' WHEN TRY TO LIST QUEUES DURING executeWorkflow:

export SGE_QMASTER_PORT=36371; export SGE_EXECD_PORT=36372; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qconf -sql
    
    no cqueue list defined

    
SOLUTION

1. MANUALLY ADD QUEUE FOR CURRENT WORKFLOWS

qconf -aq queuename


2. OR, FIX PREVIOUS 'unable to resolve host "master"' PROBLEM TO ALLOW QUEUE FOR CURRENT WORKFLOW TO BE CREATED

    
</entry>
<entry [Thu 2012:11:29 05:27:32 EST] FIXED PROBLEM 'unable to resolve host "master"'>

SUMMARY

NOT AN ERROR, JUST A WARNING THAT THE 'master' HOST IS STILL IN THE HOSTS LIST


PROBLEM

export SGE_QMASTER_PORT=36371; export SGE_EXECD_PORT=36372; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qconf -Aq /home/admin/agua/.sge/conf/queue-admin-Project1-Workflow1.conf

    unable to resolve host "master"

    
DIAGNOSIS

cd /opt/sge6/admin-microcluster
reset;  grep -R -n master *

    ...
    common/local_conf/master:5:conf_name                    master
    ...
    spool/qmaster/hostgroups/@allhosts:6:hostlist master node001
    spool/qmaster/cqueues/all.q:19:slots                 1,[master=1],[node001=1]
    spool/qmaster/qinstances/all.q/master:6:hostname              master
    ...


SHOW HOSTS qconf COMMAND GIVES 'master' AS ONE OF HOSTS:
    
export SGE_QMASTER_PORT=36371; export SGE_EXECD_PORT=36372; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qconf -sh
ip-10-122-98-91.ec2.internal        <=== MASTER NODE
ip-10-124-38-166.ec2.internal       <=== HEADNODE
master


CONFIRMED MASTER NODE INTERNAL IP ADDRESS MATCHES ONE IN qconf LIST:

RESERVATION	r-2f93b356	728213020069	@sc-admin-microcluster
INSTANCE	i-7501350a	ami-11c67678	ec2-54-234-49-110.compute-1.amazonaws.com	ip-10-122-98-91.ec2.internal	running	id_rsa-admin-key	0t1.micro	2012-11-29T07:27:00+0000	us-east-1a	aki-825ea7eb	monitoring-disabled	54.234.49.110	10.122.98.91			ebs	paravirtual	xen		sg-80fedee8	default	false	
BLOCKDEVICE	/dev/sda1	vol-86ba85fa	2012-11-29T07:27:03.000Z	true		
TAG	instance	i-7501350a	alias	master


NB: LIST INFO DOES NOT MATCH INFO IN FILE SO qconf COMMAND FAILED:

INFO IN QUEUE sFILE:

cat /home/admin/agua/.sge/conf/queue-admin-Project1-Workflow1.conf
	
	qname                 admin-Project1-Workflow1
	hostlist              @allhosts
	seq_no                0
	load_thresholds       np_load_avg=20
	suspend_thresholds    NONE
	nsuspend              1
	suspend_interval      00:05:00
	priority              0
	min_cpu_interval      00:05:00
	processors            UNDEFINED
	qtype                 BATCH INTERACTIVE
	ckpt_list             NONE
	pe_list               make
	rerun                 FALSE
	slots                 1
	tmpdir                /tmp
	shell                 /bin/bash
	prolog                NONE
    ...

    
LIST INFO:

export SGE_QMASTER_PORT=36371; export SGE_EXECD_PORT=36372; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qconf -sql admin-Project-Workflow1
    qname                 template
    hostlist              NONE
    seq_no                0
    load_thresholds       np_load_avg=1.75
    suspend_thresholds    NONE
    nsuspend              1
    suspend_interval      00:05:00
    priority              0
    min_cpu_interval      00:05:00
    processors            UNDEFINED
    qtype                 BATCH INTERACTIVE
    ckpt_list             NONE
    pe_list               make
    rerun                 FALSE
    slots                 1
    tmpdir                /tmp
    shell                 /bin/csh
    prolog                NONE
    epilog                NONE
    ...


SOLUTION

1. REMOVE 'master' FROM LIST OF HOSTS

qconf -dh master


    
</entry>
<entry [Thu 2012:11:22 23:52:46 EST] FIXED PROBLEM: FAILED TO CREATE sgeadmin USER ON HEADNODE>

SUMMARY

ADD sgeUser METHOD TO Configure.pm TO CREATE sgeadmin DAEMON USER WITH USERID 1001 BEFORE CREATE AGUA admin USER


PROBLEM

CAN'T START SGE_QMASTER ON HEADNODE (ALTHOUGH SGE IS RUNNING FINE ON MASTER) BECAUSE sgeadmin USER WAS NOT CREATED ON HEADNODE


DIAGNOSIS

FAILED TO START sge_execd ON HEADNODE:

/opt/sge6/bin/lx24-x86/sge_execd 

ps aux | grep sge
    root      5280  0.0  0.0   7972   900 pts/0    S+   09:13   0:00 grep sge

cat /tmp/execd_messages.5272 
    11/27/2012 09:13:05|  main|ip-10-122-223-5|C|admin_user "sgeadmin" does not exist


NO sgeadmin USER ON HEADNODE

ERROR MESSAGE IN /tmp/execd_messages:

/tmp# em execd_messages.10434

    11/22/2012 23:52:22|  main|ip-10-126-41-116|W|daemonize error: timeout while waiting for daemonize state
    11/22/2012 23:52:24|  main|ip-10-126-41-116|E|got send timeout
    11/22/2012 23:52:24|  main|ip-10-126-41-116|E|can't get configuration from qmaster -- backgrounding
    11/22/2012 23:52:26|  main|ip-10-126-41-116|C|admin_user "sgeadmin" does not exist
    
CLUSTER STARTUP LOG:

/nethome/admin/.starcluster/admin-microcluster-STARCLUSTER.out

    PID: 9020 clustersetup.py:144 - INFO - Creating cluster user: sgeadmin (uid: 1001, gid: 1001)
    PID: 9020 threadpool.py:108 - DEBUG - unfinished_tasks = 1
    PID: 9020 clustersetup.py:161 - DEBUG - user sgeadmin does not exist, creating...
    PID: 9020 clustersetup.py:186 - INFO - Configuring scratch space for user: sgeadmin
    PID: 9020 threadpool.py:108 - DEBUG - unfinished_tasks = 1
    PID: 9020 clustersetup.py:195 - INFO - Configuring /etc/hosts on each node
    PID: 9020 threadpool.py:108 - DEBUG - unfinished_tasks = 1
    PID: 9020 ssh.py:254 - DEBUG - new /etc/hosts after removing regex (master) matches:
    127.0.0.1 ubuntu



sgeadmin USER EXISTS ON MASTER:

root@master:~# cat /etc/group | grep sge
sgeadmin:x:1001:

root@master:~# cat /etc/passwd | grep sge
sgeadmin:x:1001:1001::/home/sgeadmin:/bin/bash


*** USER ID '1001' CLASH *** BETWEEN sgeadmin ON MASTER AND admin USER ON HEADNODE

ON MASTER:

tail /etc/passwd
    mysql:x:109:115:MySQL Server,,,:/nonexistent:/bin/false
    sgeadmin:x:1001:1001::/home/sgeadmin:/bin/bash


ON HEADNODE:

tail /etc/passwd
    mysql:x:109:115:MySQL Server,,,:/nonexistent:/bin/false
    admin:x:1001:1001::/nethome/admin:/bin/sh


USER ID 1001 IS ALREADY USED BY THE ADMIN USER ON HEADNODE SO StarCluster CAN'T SET THE sgeadmin USER (USING THE '1001' USER ID FOR BOTH MASTER AND NODES)




NOTE THAT sge.py FAILS TO CREATE admin-microcluster DIRECTORY ON MASTER:

em /tmp/starcluster-debug-root.log

    PID: 4878 sge.py:661 - INFO - Copying cell directory on master
    PID: 4878 sge.py:662 - DEBUG - sge.CreateCell.copyCell    CreateCell.copyCell(master)
    PID: 4878 sge.py:664 - DEBUG - sge.CreateCell.copyCell    commands: ('mkdir /opt/sge6/admin-microcluster\
     &> /dev/null', 'rsync -a /opt/sge6/default/* /opt/sge6/admin-microcluster --exclude *tar.gz', 'chown -R\
     sgeadmin:sgeadmin /opt/sge6/admin-microcluster')
    PID: 4878 sge.py:667 - DEBUG - sge.CreateCell.copyCell    target: /opt/sge6/admin-microcluster
    PID: 4878 sge.py:668 - DEBUG - sge.CreateCell.copyCell    os.path.isdir(target): True
    PID: 4878 sge.py:671 - INFO - mkdir /opt/sge6/admin-microcluster &> /dev/null
    PID: 4878 ssh.py:402 - DEBUG - command mkdir /opt/sge6/admin-microcluster &> /dev/null failed with statu\
    s 1
    PID: 4878 sge.py:671 - INFO - rsync -a /opt/sge6/default/* /opt/sge6/admin-microcluster --exclude *tar.g\
    z
    PID: 4878 sge.py:671 - INFO - chown -R sgeadmin:sgeadmin /opt/sge6/admin-microcluster



SOLUTION

STARCLUSTER clustersetup._setup_cluster_user METHOD SEARCHES THE ***/home*** DIR BEFORE ALLOCATING USER ID FOR sgeadmin USER (I.E., ***NOT*** THE /nethome DIR).

SO SET THE AGUA USER DIR TO /home SO THAT STARCLUSTER SEES THE EXISTING admin USER FOLDER AND ALLOCATES A DIFFERENT USER ID FOR THE sgeadmin USER


ON HEADNODE:

1. CHANGE USERDIR IN default.conf TO /home (FROM /nethome)

    OK

    
2. MOVE THE EXISTING admin USER HOME DIR TO /home/admin.bkp AND jbrowse TO /home/jbrowse 

mv /nethome/admin /home/admin.bkp
mv /nethome/jbrowse /home/jbrowse


3. FIX LOCATION OF KEYPAIR FILE IN admin-microcluster.config
    
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/home/admin/.starcluster/id_rsa-admin-key


4. REMOVE admin USER

BEFORE REMOVE
tail /etc/passwd
    ...
    mapred:x:107:114:Hadoop MapReduce,,,:/usr/lib/hadoop-0.20:/bin/bash
    statd:x:108:65534::/var/lib/nfs:/bin/false
    mysql:x:109:115:MySQL Server,,,:/nonexistent:/bin/false
    admin:x:1001:1001::/nethome/admin:/bin/sh

DO REMOVE
userdel admin
    OK

AFTER REMOVE
tail /etc/passwd
    ...
    mapred:x:107:114:Hadoop MapReduce,,,:/usr/lib/hadoop-0.20:/bin/bash
    statd:x:108:65534::/var/lib/nfs:/bin/false
    mysql:x:109:115:MySQL Server,,,:/nonexistent:/bin/false


5. CREATE sgeadmin AND admin USER WITH config.pl --mode createUsers

./config.pl --mode adminUser
    OK

tail -n 3 /etc/passwd
    mysql:x:109:115:MySQL Server,,,:/nonexistent:/bin/false
    sgeadmin:x:1001:1001::/home/sgeadmin:/bin/false
    admin:x:1002:1002::/home/admin:/bin/sh

    

6. RUN executeWorkflow TO CREATE INSTALL sgeadmin ON HEADNODE, AND MASTER AND EXEC NODES

reset; echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-microcluster","SHOWLOG":5}' | ./workflow.pl

    OK
    
SGE_EXECD IS NOW RUNNING ON MASTER (WITH USER sgeadmin):

ps aux | grep sge

    sgeadmin  2969  0.1  0.1  61568  2276 ?        Sl   03:44   0:05 /opt/sge6/bin/lx24-amd64/sge_execd
    root      3773  0.0  0.0   7972   900 pts/0    S+   04:43   0:00 grep sge


SGE_EXECD IS RUNNING ON CORRECT PORT:

netstat -ntulp | grep sge

    tcp        0      0 0.0.0.0:36372           0.0.0.0:*               LISTEN      2969/sge_execd  


    
</entry>
<entry [Thu 2012:11:22 18:54:12 EST] SGE INSTALL LOGS ON STARCLUSTER MASTER>

ll /opt/sge6/default/common/install_logs/

    -rw-r--r-- 1 ubuntu ubuntu 1.2K 2012-10-18 00:38 execd_install_master_2011-05-02_07:05:25.log
    -rw-r--r-- 1 ubuntu ubuntu 1.2K 2012-10-18 00:38 execd_install_node001_2011-05-02_07:05:30.log
    -rw-r--r-- 1 ubuntu ubuntu 3.0K 2012-10-18 00:38 qmaster_install_master_2011-05-02_07:05:13.log

em /opt/sge6/default/common/install_logs/qmaster_install_master_2011-05-02_07\:05\:13.log
    
    
</entry>
<entry [Tue 2012:09:25 02:17:35 EST] INSTALLED starcluster ON LAPTOP>

0. STARCLUSTER DOES NOT RUN ON LAPTOP

/data/starcluster/0.92rc2/bin/starcluster

    Traceback (most recent call last):
      File "/data/starcluster/0.92rc2/bin/starcluster", line 4, in < module >
        from pkg_resources import require; require('StarCluster==0.92rc2')
      File "/usr/lib/python2.7/dist-packages/pkg_resources.py", line 2707, in < module >
        working_set.require(__requires__)
      File "/usr/lib/python2.7/dist-packages/pkg_resources.py", line 686, in require
        needed = self.resolve(parse_requirements(requirements))
      File "/usr/lib/python2.7/dist-packages/pkg_resources.py", line 584, in resolve
        raise DistributionNotFound(req)
    pkg_resources.DistributionNotFound: StarCluster==0.92rc2


1. INSTALL STARCLUSTER 0.92rc2 ON LAPTOP

cd /data/starcluster/0.92rc2
easy_install -m StarCluster==0.92rc2
 
    Searching for StarCluster==0.92rc2
    Reading http://pypi.python.org/simple/StarCluster/
    Reading http://web.mit.edu/starcluster
    Best match: StarCluster 0.92rc2
    Downloading http://pypi.python.org/packages/source/S/StarCluster/StarCluster-0.92rc2.tar.gz#md5=982e6525502def9ee1bc9335d67cde7d
    Processing StarCluster-0.92rc2.tar.gz
    Running StarCluster-0.92rc2/setup.py -q bdist_egg --dist-dir /tmp/easy_install-cnKkC6/StarCluster-0.92rc2/egg-dist-tmp-nKH_1p
    Installing starcluster script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/dist-packages/StarCluster-0.92rc2-py2.7.egg
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:
    
        pkg_resources.require("StarCluster")  # latest installed version
        pkg_resources.require("StarCluster==0.92rc2")  # this exact version
        pkg_resources.require("StarCluster>=0.92rc2")  # this version or higher
    
    Processing dependencies for StarCluster==0.92rc2
    Searching for workerpool==0.9.2
    Reading http://pypi.python.org/simple/workerpool/
    Reading http://code.google.com/p/workerpool/
    Reading http://github.com/shazow/workerpool
    Best match: workerpool 0.9.2
    Downloading http://workerpool.googlecode.com/files/workerpool-0.9.2.tar.gz
    Processing workerpool-0.9.2.tar.gz
    Running workerpool-0.9.2/setup.py -q bdist_egg --dist-dir /tmp/easy_install-qX0C1Q/workerpool-0.9.2/egg-dist-tmp-MpumMe
    
    Installed /usr/local/lib/python2.7/dist-packages/workerpool-0.9.2-py2.7.egg
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:
    
        pkg_resources.require("workerpool")  # latest installed version
        pkg_resources.require("workerpool==0.9.2")  # this exact version
        pkg_resources.require("workerpool>=0.9.2")  # this version or higher
    
    Searching for boto==2.0b4
    Reading http://pypi.python.org/simple/boto/
    Reading http://code.google.com/p/boto/
    Reading https://github.com/boto/boto/
    Reading https://github.com/boto/boto
    Reading http://code.google.com/p/boto
    Best match: boto 2.0b4
    Downloading http://pypi.python.org/packages/source/b/boto/boto-2.0b4.tar.gz#md5=f00ccf9167fee01d6a415bd4ab156171
    Processing boto-2.0b4.tar.gz
    Running boto-2.0b4/setup.py -q bdist_egg --dist-dir /tmp/easy_install-3fv23K/boto-2.0b4/egg-dist-tmp-_oKjAp
    zip_safe flag not set; analyzing archive contents...
    Installing bundle_image script to /usr/local/bin
    Installing cq script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing lss3 script to /usr/local/bin
    Installing route53 script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing launch_instance script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing pyami_sendmail script to /usr/local/bin
    Installing kill_instance script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing cfadmin script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/dist-packages/boto-2.0b4-py2.7.egg
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:
    
        pkg_resources.require("boto")  # latest installed version
        pkg_resources.require("boto==2.0b4")  # this exact version
        pkg_resources.require("boto>=2.0b4")  # this version or higher
    
    Searching for paramiko==1.7.7.1
    Reading http://pypi.python.org/simple/paramiko/
    Reading http://www.lag.net/~robey/paramiko/
    Reading http://www.lag.net/paramiko/
    Best match: paramiko 1.7.7.1
    Downloading http://www.lag.net/paramiko/download/paramiko-1.7.7.1.zip
    Processing paramiko-1.7.7.1.zip
    Running paramiko-1.7.7.1/setup.py -q bdist_egg --dist-dir /tmp/easy_install-KgHy0k/paramiko-1.7.7.1/egg-dist-tmp-s9ln_U
    zip_safe flag not set; analyzing archive contents...
    
    Installed /usr/local/lib/python2.7/dist-packages/paramiko-1.7.7.1-py2.7.egg
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:
    
        pkg_resources.require("paramiko")  # latest installed version
        pkg_resources.require("paramiko==1.7.7.1")  # this exact version
        pkg_resources.require("paramiko>=1.7.7.1")  # this version or higher
    
    Finished processing dependencies for StarCluster==0.92rc2



2. CONFIRMED INSTALLATION

which starcluster
    
    /usr/local/bin/starcluster


3. CREATED ERIDANUS-0.8.0-alpha.2

SEE [Tue 2012:09:25 01:26:39 EST]
ami-b3bd0fda ERIDANUS-0.8.0-alpha.2 POST install.pl AND config.pl FOR AGUA BASE



    
</entry>
<entry [Mon 2012:09:10 16:08:23 EST] FIXED ERROR WHEN RUNNING sge.py: 'Running /etc/init.d/networking restart is deprecated'>


PROBLEM:

RESTART NETWORKING COMMAND

/etc/init.d/networking restart

GIVES THIS ERROR:

    Running /etc/init.d/networking restart is deprecated because it may not enable again some interfaces', '* Reconfiguring network interfaces...', 'ssh stop/waiting', 'ssh start/running, process 2096', '...done.', 'RTNETLINK answers: File exists


SOLUTION

USE THIS INSTEAD:

nohup sh -c "ifdown eth0 && ifup eth0"


    
</entry>
<entry [Sat 2012:09:08 00:58:32 EST] FIXED: CLUSTER STARTS BUT FAILS TO CONNECT TO NEW NODES>

SUMMARY: USING OLD id_rsa-admin-key ON MASTER

PROBLEM

SSH TO NODES HANGS WHEN STARTING CLUSTER:

cd /nethome/admin/.starcluster/plugins; /data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-microcluster.config start admin-microcluster

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> 0.92.rc2    XXXXX commands.start.addopts    utils.config_file: /nethome/admin/.starcluster/admin-microcluster.config
    >>> Using default cluster template: admin-microcluster
    >>> Loaded plugin: automount.NfsShares
    >>> Loaded plugin: sge.CreateCell
    >>> rootpath: /opt/sge6/bin/lx24-amd64
    >>> Loaded plugin: startup.StartUp
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 1-node cluster...
    >>> Launching a 1-node cluster...
    >>> Creating security group @sc-admin-microcluster...
    Reservation:r-75b80612
    >>> Waiting for cluster to come up... (updating every 30s)
    >>> Waiting for all nodes to be in a 'running' state...
    1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Waiting for SSH to come up on all nodes...
    
        (HANGS INDEFINITELY)




DIAGNOSIS

CURRENT KEY IN AWS CONSOLE

id_rsa-admin-key
72:0a:56:e6:73:89:f2:30:df:c4:0d:3c:dd:e6:00:56:4f:22:89:5f

... IS DIFFERENT TO KEY IN KEYPAIR FILE:

head -n 3 /nethome/admin/.starcluster/id_rsa-admin-key

    KEYPAIR	id_rsa-admin-key	1d:19:51:5b:6b:b8:3d:d3:c0:a5:2b:6a:3a:ca:ab:f7:d3:6a:95:7a
    -----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEAiGct6W5CNFlV78MGlNND2VO8ClGG9Bm1TXip1l0BWKSidumZu5FPTfn01MK6


SOLUTION

1. DELETE OLD AWS id_rsa-admin-key

2. RE-GENERATE KEYPAIR (REGISTERS WITH AWS AND CREATES NEW KEYPAIR FILE)

SEE agua.test.xsl
[Tue 2012:07:24 05:13:20 EST] TEST StarCluster deleteKeyPair AND addKeyPair


GENERATED KEYPAIR IN FILE:

/nethome/admin/.starcluster/id_rsa-admin-key
    
    KEYPAIR	id_rsa-admin-key	d4:9a:f0:d8:33:c2:27:de:5f:36:54:1e:8c:cd:7f:96:4e:34:5c:24
    ...

AND ALSO REGISTERED IN AWS CONSOLE:
    
AWS --> EC2 --> Key Pairs 
    
id_rsa-admin-key
d4:9a:f0:d8:33:c2:27:de:5f:36:54:1e:8c:cd:7f:96:4e:34:5c:24



</entry>
<entry [Thu 2012:09:06 20:22:07 EST] FIXED: CLUSTER FAILS TO START ON StarCluster::launchCluster>

PROBLEM

CLUSTER FAILS TO START ON StarCluster::launchCluster. GET SAME ERROR WHEN RUN MANUALLY:

cd /nethome/admin/.starcluster/plugins; /data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-microcluster.config start admin-microcluster

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> 0.92.rc2    XXXXX commands.start.addopts    utils.config_file: /nethome/admin/.starcluster/admin-microcluster.config
    >>> Using default cluster template: admin-microcluster
    /data/starcluster/0.92rc2/starcluster/cluster.py:431: DeprecationWarning: BaseException.message has been deprecated as of Python 2.6
      (plugin_name, e.message))
    !!! ERROR - Failed to import plugin automount: No module named automount

    
GET MISSING IPYTHON WHEN RUN SHELL:

cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/admin-microcluster.config \
shell

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Importing module config
    >>> Importing module static
    >>> Importing module cluster
    >>> Importing module clustersetup
    >>> Importing module node
    >>> Importing module ssh
    >>> Importing module plugins
    >>> Importing module balancers
    >>> Importing module managers
    >>> Importing module image
    >>> Importing module volume
    >>> Importing module awsutils
    >>> Importing module cli
    >>> Importing module commands
    >>> Importing module logger
    >>> Importing module utils
    >>> Importing module iptools
    >>> Importing module threadpool
    >>> Importing module templates
    >>> Importing module exception
    >>> Importing module tests
    >>> Importing module optcomplete
    >>> Importing module progressbar
    >>> Importing module spinner
    >>> Importing module boto
    >>> Importing module paramiko
    !!! ERROR - Unable to load IPython.
    !!! ERROR - Please check that IPython is installed and working.
    !!! ERROR - If not, you can install it via: easy_install ipytho
    


Remove site-package/IPython and site-package/ipython*.egg
sudo easy_install ipython to fresh install the IPython
Apply the patch to the django's shell.py as Ignacio linked.

    try:
        shell = IPython.InteractiveShell()
    except AttributeError:
        # IPython < 0.11
        # Explicitly pass an empty list as arguments, because otherwise IPython
        # would use sys.argv from this script.
        shell = IPython.Shell.IPShell(argv=[])
    shell.mainloop()
    
    


DIAGNOSIS

ipython IS NOT INSTALLED

pkg_resources ALSO NOT INSTALLED

easy_install ipython
    Traceback (most recent call last):
      File "/usr/bin/easy_install", line 5, in < module>
        from pkg_resources import load_entry_point
    ImportError: No module named pkg_resources


TURNS OUT THAT easy_install IS FROM /usr/bin AND pkg_resources.py IS FROM /usr/local:

THE DEFAULT easy_install IS IN /usr/bin:

easy_install ipython

Traceback (most recent call last):
  File "/usr/bin/easy_install", line 5, in < module>
    from pkg_resources import load_entry_point
  File "/usr/local/lib/python2.6/dist-packages/distribute-0.6.28-py2.6.egg/pkg_resources.py", line 2819, in < module>
    parse_requirements(__requires__), Environment()
  File "/usr/local/lib/python2.6/dist-packages/distribute-0.6.28-py2.6.egg/pkg_resources.py", line 588, in resolve
    raise DistributionNotFound(req)
pkg_resources.DistributionNotFound: distribute==0.6.24dev-r0


... AND THE OTHER easy_install IS IN /usr/local/bin:

ll /usr/local/bin/easy_install
    -rwxr-xr-x 1 root root 323 2012-09-06 16:03 /usr/local/bin/easy_install

    
    
SOLUTION

INSTALL setuptools, THEN ipython

1. INSTALL setuptools

export PERL5LIB=/usr/share/perl5
apt-get install python-setuptools

    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    python-setuptools is already the newest version.
    0 upgraded, 0 newly installed, 0 to remove and 15 not upgraded.
    root@ip-10-123-6-230:/nethome/admin/.starcluster/plugins# apt-get install python-setuptools
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    python-setuptools is already the newest version.
    0 upgraded, 0 newly installed, 0 to remove and 15 not upgraded.


2. INSTALL ipython

mv /usr/bin/easy_install /usr/bin/easy_install.bkp
ln -s /usr/local/bin/easy_install /usr/bin/easy_install
easy_install ipython

    Searching for ipython
    Reading http://pypi.python.org/simple/ipython/
    Reading http://ipython.scipy.org
    Reading http://ipython.scipy.org/dist
    Reading http://ipython.scipy.org/dist/0.8.4
    Reading http://ipython.scipy.org/dist/0.9.1
    Reading http://ipython.org
    Reading http://archive.ipython.org/release/0.12.1
    Reading https://github.com/ipython/ipython/downloads
    Reading http://ipython.scipy.org/dist/old/0.9
    Reading http://ipython.scipy.org/dist/0.10
    Reading http://archive.ipython.org/release/0.11/
    Reading http://archive.ipython.org/release/0.12
    Best match: ipython 0.13
    Downloading https://github.com/downloads/ipython/ipython/ipython-0.13.zip
    Processing ipython-0.13.zip
    Writing /tmp/easy_install-10xySS/ipython-0.13/setup.cfg
    Running ipython-0.13/setup.py -q bdist_egg --dist-dir /tmp/easy_install-10xySS/ipython-0.13/egg-dist-tmp-5TKtmp
    warning: no files found matching 'setup2.py'
    warning: no files found matching 'setup3.py'
    no previously-included directories found matching 'IPython/deathrow'
    no previously-included directories found matching 'IPython/external/js'
    no previously-included directories found matching 'IPython/frontend/html/notebook/static/mathjax'
    warning: no files found matching 'IPython/.git_commit_info.ini'
    warning: no previously-included files found matching 'docs/#*'
    warning: no previously-included files found matching 'docs/man/*.1.gz'
    no previously-included directories found matching 'docs/attic'
    no previously-included directories found matching 'docs/build'
    no previously-included directories found matching 'docs/gh-pages'
    no previously-included directories found matching 'docs/dist'
    warning: no previously-included files matching '*~' found anywhere in distribution
    warning: no previously-included files matching '*.flc' found anywhere in distribution
    warning: no previously-included files matching '*.pyo' found anywhere in distribution
    warning: no previously-included files matching '.dircopy.log' found anywhere in distribution
    Adding ipython 0.13 to easy-install.pth file
    Installing ipcontroller script to /usr/local/bin
    Installing iptest script to /usr/local/bin
    Installing ipcluster script to /usr/local/bin
    Installing ipython script to /usr/local/bin
    Installing pycolor script to /usr/local/bin
    Installing iplogger script to /usr/local/bin
    Installing irunner script to /usr/local/bin
    Installing ipengine script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/dist-packages/ipython-0.13-py2.6.egg
    Processing dependencies for ipython
    Finished processing dependencies for ipython



NOW CAN RUN starcluster TO GET CLUSTER LIST:

cd /nethome/admin/.starcluster/plugins; /data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-microcluster.config listclusters

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> No clusters found...

    
BUT TRYING TO RUN SHELL RESULTS IN THIS ERROR:

cd /nethome/admin/.starcluster/plugins; /data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-microcluster.config shell
    
    StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Importing module config
    >>> Importing module static
    >>> Importing module cluster
    >>> Importing module clustersetup
    >>> Importing module node
    >>> Importing module ssh
    >>> Importing module plugins
    >>> Importing module balancers
    >>> Importing module managers
    >>> Importing module image
    >>> Importing module volume
    >>> Importing module awsutils
    >>> Importing module cli
    >>> Importing module commands
    >>> Importing module logger
    >>> Importing module utils
    >>> Importing module iptools
    >>> Importing module threadpool
    >>> Importing module templates
    >>> Importing module exception
    >>> Importing module tests
    >>> Importing module optcomplete
    >>> Importing module progressbar
    >>> Importing module spinner
    >>> Importing module boto
    >>> Importin
    g module paramiko
    !!! ERROR - Unable to load IPython.
    !!! ERROR - Please check that IPython is installed and working.
    !!! ERROR - If not, you can install it via: easy_install ipython

    

UNINSTALL IPYTHON WITH PIP
pip uninstall ipython

    Uninstalling ipython:
      /usr/bin/ipcluster
      /usr/bin/ipcontroller
      /usr/bin/ipengine
      /usr/bin/ipython
      /usr/bin/irunner
      /usr/bin/pycolor
      /usr/local/lib/python2.6/dist-packages/ipython-0.13-py2.6.egg
    Proceed (y/n)? y
      Successfully uninstalled ipython
  
  
PREVIOUS INSTALLATION OF PIP STILL EXISTS

locate ipython | grep -v "/usr/share" | grep -v "\.ipython"

    /data/starcluster/0.92rc2/docs/sphinx/plugins/ipython.rst
    /usr/bin/ipython
    /usr/bin/ipython-wx
    /usr/bin/ipython2.6
    /usr/bin/ipythonx
    /usr/lib/pymodules/python2.6/ipython-0.10-py2.6.egg-info
    /usr/lib/pymodules/python2.6/IPython/UserConfig/ipythonrc
    /usr/lib/pymodules/python2.6/IPython/UserConfig/ipythonrc-math
    /usr/lib/pymodules/python2.6/IPython/UserConfig/ipythonrc-numeric
    /usr/lib/pymodules/python2.6/IPython/UserConfig/ipythonrc-physics
    /usr/lib/pymodules/python2.6/IPython/UserConfig/ipythonrc-pysh
    /usr/lib/pymodules/python2.6/IPython/UserConfig/ipythonrc-tutorial
    /usr/lib/pymodules/python2.6/IPython/frontend/wx/ipythonx.py
    /usr/lib/pymodules/python2.6/IPython/frontend/wx/ipythonx.pyc
    /usr/lib/pymodules/python2.6/IPython/gui/wx/ipython_history.py
    /usr/lib/pymodules/python2.6/IPython/gui/wx/ipython_history.pyc
    /usr/lib/pymodules/python2.6/IPython/gui/wx/ipython_view.py
    /usr/lib/pymodules/python2.6/IPython/gui/wx/ipython_view.pyc
    /var/lib/dpkg/info/ipython.list
    /var/lib/dpkg/info/ipython.md5sums
    /var/lib/dpkg/info/ipython.postinst
    /var/lib/dpkg/info/ipython.prerm


UNINSTALL IPYTHON USING APT-GET

export PERL5LIB=/usr/share/perl 
apt-get remove ipython
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    Package ipython is not installed, so not removed
    0 upgraded, 0 newly installed, 0 to remove and 15 not upgraded.
    1 not fully installed or removed.
    After this operation, 0B of additional disk space will be used.
    Setting up man-db (2.5.7-2ubuntu1) ...
    Updating database of manual pages ...



REINSTALL IPYTHON WITH easy_install

easy_install ipython

    Searching for ipython
    Best match: ipython 0.13
    ipython 0.13 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.6/dist-packages
    Processing dependencies for ipython
    Finished processing dependencies for ipython


... BUT OPENING SHELL GIVES SAME ERROR AS ABOVE



UNINSTALL IPYTHON WITH PIP:

pip uninstall ipython

    Uninstalling ipython:
    Proceed (y/n)? y
      Successfully uninstalled ipython

      
      
DO UPDATEDB AND LIST REMAINING IPYTHON FILES:

updatedb
locate ipython | grep -v "/usr/local/share/doc" | grep -v "/\.ipython" | grep -v "/data/starcluster"

    /usr/local/bin/ipython
    /usr/local/lib/python2.6/dist-packages/ipython-0.13.egg-info
    /usr/local/lib/python2.6/dist-packages/IPython/config/profile/cluster/ipython_config.py
    /usr/local/lib/python2.6/dist-packages/IPython/config/profile/cluster/ipython_config.pyc
    /usr/local/lib/python2.6/dist-packages/IPython/config/profile/math/ipython_config.py
    /usr/local/lib/python2.6/dist-packages/IPython/config/profile/math/ipython_config.pyc
    /usr/local/lib/python2.6/dist-packages/IPython/config/profile/pysh/ipython_config.py
    /usr/local/lib/python2.6/dist-packages/IPython/config/profile/pysh/ipython_config.pyc
    /usr/local/lib/python2.6/dist-packages/IPython/config/profile/sympy/ipython_config.py
    /usr/local/lib/python2.6/dist-packages/IPython/config/profile/sympy/ipython_config.pyc
    /usr/local/lib/python2.6/dist-packages/IPython/frontend/html/notebook/static/codemirror/theme/ipython.css
    /usr/local/lib/python2.6/dist-packages/IPython/frontend/qt/console/ipython_widget.py
    /usr/local/lib/python2.6/dist-packages/IPython/frontend/qt/console/ipython_widget.pyc
    /usr/local/lib/python2.6/dist-packages/IPython/frontend/qt/console/rich_ipython_widget.py
    /usr/local/lib/python2.6/dist-packages/IPython/frontend/qt/console/rich_ipython_widget.pyc
    /usr/local/share/man/man1/ipython.1


ipython WORKS ON COMMAND LINE:

ipython
    /usr/local/lib/python2.6/dist-packages/IPython/utils/path.py:424: UserWarning: Found old IPython config file u'/root/.ipython/ipythonrc' (modified by user)
      warnings.warn("Found old IPython config file %r (modified by user)"%f)
    /usr/local/lib/python2.6/dist-packages/IPython/utils/path.py:436: UserWarning: 
      The IPython configuration system has changed as of 0.11, and these files will
      be ignored. See http://ipython.github.com/ipython-doc/dev/config for details
      of the new config system.
      To start configuring IPython, do `ipython profile create`, and edit
      `ipython_config.py` in < ipython_dir>/profile_default.
      If you need to leave the old config files in place for an older version of
      IPython and want to suppress this warning message, set
      `c.InteractiveShellApp.ignore_old_config=True` in the new config.
      `c.InteractiveShellApp.ignore_old_config=True` in the new config.""")
    Python 2.6.5 (r265:79063, Apr 16 2010, 13:57:41) 
    Type "copyright", "credits" or "license" for more information.
    
    IPython 0.13 -- An enhanced Interactive Python.
    ?         -> Introduction and overview of IPython's features.
    %quickref -> Quick reference.
    help      -> Python's own help system.
    object?   -> Details about 'object', use 'object??' for extra details.
    
    In [1]: 



MOVE THESE FILES OUT OF THE WAY

mv /usr/local/bin/ipython /usr/local/bin/ipython.old


NOW CAN'T REINSTALL IPYTHON USING APT-GET:

apt-get install ipython

    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    Package ipython is not available, but is referred to by another package.
    This may mean that the package is missing, has been obsoleted, or
    is only available from another source
    E: Package ipython has no installation candidate


TRY INSTALLING IPYTHON WITH PIP:

pip install ipython

    Requirement already satisfied (use --upgrade to upgrade): ipython in /usr/local/lib/python2.6/dist-packages
    Cleaning up...



BUT STILL GET ABOVE ERROR.

#SOLVED
#Remove site-package/IPython and site-package/ipython*.egg
#sudo easy_install ipython to fresh install the IPython
#Apply the patch to the django's shell.py as Ignacio linked.


REMOVED IPython FROM site-packages

cd /usr/local/lib/python2.6/site-packages
mv ipython-0.13-py2.6.egg ipython-0.13-py2.6.egg.old



REMOVED site-package/ipython.*egg

cd /usr/local/lib/python2.6/site-packages
mv IPython IPython.olf



REINSTALLED ipython WITH easy_install **** NOTE: IPython NOT ipython ****

easy_install IPython

    Searching for IPython
    Reading http://pypi.python.org/simple/IPython/
    Reading http://ipython.scipy.org
    Reading http://ipython.scipy.org/dist
    Reading http://ipython.scipy.org/dist/0.8.4
    Reading http://ipython.scipy.org/dist/0.9.1
    Reading http://ipython.org
    Reading http://archive.ipython.org/release/0.12.1
    Reading https://github.com/ipython/ipython/downloads
    Reading http://ipython.scipy.org/dist/old/0.9
    Reading http://ipython.scipy.org/dist/0.10
    Reading http://archive.ipython.org/release/0.11/
    Reading http://archive.ipython.org/release/0.12
    Best match: ipython 0.13
    Downloading https://github.com/downloads/ipython/ipython/ipython-0.13.zip
    Processing ipython-0.13.zip
    Writing /tmp/easy_install-eqFkrL/ipython-0.13/setup.cfg
    Running ipython-0.13/setup.py -q bdist_egg --dist-dir /tmp/easy_install-eqFkrL/ipython-0.13/egg-dist-tmp-JER5Kw
    warning: no files found matching 'setup2.py'
    warning: no files found matching 'setup3.py'
    no previously-included directories found matching 'IPython/deathrow'
    no previously-included directories found matching 'IPython/external/js'
    no previously-included directories found matching 'IPython/frontend/html/notebook/static/mathjax'
    warning: no files found matching 'IPython/.git_commit_info.ini'
    warning: no previously-included files found matching 'docs/#*'
    warning: no previously-included files found matching 'docs/man/*.1.gz'
    no previously-included directories found matching 'docs/attic'
    no previously-included directories found matching 'docs/build'
    no previously-included directories found matching 'docs/gh-pages'
    no previously-included directories found matching 'docs/dist'
    warning: no previously-included files matching '*~' found anywhere in distribution
    warning: no previously-included files matching '*.flc' found anywhere in distribution
    warning: no previously-included files matching '*.pyo' found anywhere in distribution
    warning: no previously-included files matching '.dircopy.log' found anywhere in distribution
    Adding ipython 0.13 to easy-install.pth file
    Installing ipcontroller script to /usr/local/bin
    Installing iptest script to /usr/local/bin
    Installing ipcluster script to /usr/local/bin
    Installing ipython script to /usr/local/bin
    Installing pycolor script to /usr/local/bin
    Installing iplogger script to /usr/local/bin
    Installing irunner script to /usr/local/bin
    Installing ipengine script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/dist-packages/ipython-0.13-py2.6.egg
    Processing dependencies for IPython
    Finished processing dependencies for IPython

    
    
Replace

import IPython.Shell
IPython.Shell.start().mainloop()

with

import IPython
IPython.embed()
on /opt/local/bin/ipython

 
LINES IN starcluster/utils.py:
 
 try:
    import IPython.Shell                                                         
    ipy_shell = IPython.Shell.IPShellEmbed(argv=[])                              

except ImportError:                                                              
    def ipy_shell(local_ns=None):
        log.error("Unable to load IPython.")
        log.error("Please check that IPython is installed and working.")
        log.error("If not, you can install it via: easy_install ipython")


CHANGED TO:


http://ipython.org/ipython-doc/dev/api/generated/IPython.html
ipy_shell = IPython.embed_kernel()

NOW GET ERROR:


HERE. importError IPython.zmq requires pyzmq >= 2.1.4
!!! ERROR - Unable to load IPython.
!!! ERROR - Please check that IPython is installed and working.
!!! ERROR - If not, you can install it via: easy_install ipython


INSTALLED ZMQ:

apt-cache search python zmq
    EMPTY


NB: SHOULD RETURN:

    python-zmq - Python bindings for 0MQ library
    python-zmq-dbg - Python bindings for 0MQ library - debugging files


Is this what you are looking for? Then

apt-get install python-zmq
    
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    E: Couldn't find package python-zmq



UNINSTALL IPYTHON AND REINSTALL IPYTHON 0.10 
    
pip freeze

    DRMAA-python==0.2
    Jinja2==2.5.5
    Landscape-Client==1.5.2
    PAM==0.4.2
    PIL==1.1.7
    PyYAML==3.09
    StarCluster==0.92rc2
    Twisted-Core==10.0.0
    Twisted-Names==10.0.0
    Twisted-Web==10.0.0
    boto==2.0b4
    cloud-init==0.5.10
    command-not-found==0.1
    ctypedbytes==0.1.6
    decorator==3.3.1
    distribute==0.6.28
    drmaa==0.4b3
    dumbo==0.21.29
    euca2ools==1.2
    ipython==0.13
    numpy==1.5.0b1
    oauth==1.0a
    paramiko==1.7.7.1
    pexpect==2.3
    pycrypto==2.3
    pyserial==2.3
    python-apt==0.7.94.2ubuntu6.4
    python-distutils-extra==2.18
    pytz==2010b
    pyzmq==2.2.0.1
    scipy==0.8.0
    typedbytes==0.3.6
    ufw==0.30pre1-0ubuntu2
    workerpool==0.9.2
    wsgiref==0.1.2
    wxPython==2.8.10.1
    wxPython-common==2.8.10.1
    zope.interface==3.5.3



pip uninstall ipython
    Uninstalling ipython:
      /usr/local/lib/python2.6/dist-packages/ipython-0.13-py2.6.egg
    Proceed (y/n)? y
      Successfully uninstalled ipython
    (EGG IS REMOVED)    
    

DOWNLOAD FROM GITHUB AND CHECKOUT 0.10.2 THEN INSTALL

mkdir -p /data/starcluster/ipython/0.10.2
cd /data/starcluster/ipython/0.10.2
git clone git://github.com/ipython/ipython.git
cd ipython
git checkout rel-0.10.2
python setup.py install

    ...
    copying docs/examples/core/example-embed.py -> /usr/local/share/doc/ipython/examples/core
    copying docs/examples/core/ipython_here_shell_extension.reg -> /usr/local/share/doc/ipython/examples/core
    running install_egg_info
    Writing /usr/local/lib/python2.6/dist-packages/ipython-0.10.2.egg-info


NOW CAN OPEN SHELL OK:



    
INSTALL ZMQ    
    
    Consider using easy_install, perhaps in connection with a Python virtual environment. You need to install the libzmq-dev package so that the Python package compiles.

sudo apt-get install libzmq-dev
virtualenv ~/test-ve
source ~/test-ve/bin/activate
easy_install pyzmq
Note the absence of sudo for the easy_install call, this is due to the Python virtual environment. You need to activate the virtualenv before running the Python code, though. For systemwide installation, simply do

apt-get install libzmq-dev


easy_install pyzmq



NOW CAN OPEN A KERNEL SHELL:

[IPKernelApp] To connect another client to this kernel, use:
[IPKernelApp] --existing kernel-2050.json


    
</entry>
<entry [Thu 2012:09:06 20:20:16 EST] INSTALL pkg_resources WITHOUT USING easy_install (WHICH DOESN'T WORK WITHOUT pkg_resources)>

*** Without pkg_resources, easy_install will likely also not work (so easy_install and pip won't be able to install setuptools) ***

I encountered the same ImportError, though it had nothing to do with the platform I was running on. Somehow the setuptools module had been deleted from my site-packages directory. I fixed the issue by re-running the setup script for distribute:

curl http://python-distribute.org/distribute_setup.py | python

    Adding distribute 0.6.28 to easy-install.pth file
    Installing easy_install script to /usr/local/bin
    Installing easy_install-2.6 script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/dist-packages/distribute-0.6.28-py2.6.egg
    Processing dependencies for distribute==0.6.28
    Finished processing dependencies for distribute==0.6.28
    After install bootstrap.
    Don't have permissions to write /usr/local/lib/python2.6/dist-packages/setuptools-0.6c11-py2.6.egg-info, skipping
    Creating /usr/local/lib/python2.6/dist-packages/setuptools-0.6c11-py2.6.egg-info
    Creating /usr/local/lib/python2.6/dist-packages/setuptools.pth


BUT STILL MISSING distribute PACKAGE SO GET THIS ERROR WHEN TRY TO INSTALL ipython:

easy_install ipython

    Traceback (most recent call last):
      File "/usr/bin/easy_install", line 5, in < module>
        from pkg_resources import load_entry_point
      File "/usr/local/lib/python2.6/dist-packages/distribute-0.6.28-py2.6.egg/pkg_resources.py", line 2819, in < module>
        parse_requirements(__requires__), Environment()
      File "/usr/local/lib/python2.6/dist-packages/distribute-0.6.28-py2.6.egg/pkg_resources.py", line 588, in resolve
        raise DistributionNotFound(req)
    pkg_resources.DistributionNotFound: distribute==0.6.24dev-r0



    
</entry>
<entry [Mon 2012:07:02 23:33:49 EST] TROUBLESHOOT SGE NOT RUNNING ON CREATE CLUSTER: 'command 'qconf -mattr queue shell "/bin/bash" all.q' failed with status 127'>


cd /opt/sge6 && TERM=rxvt ./inst_sge -m -x  -noremote -auto ./ec2_sge.conf

->>> Installing Sun Grid Engine...
>>> Doing mconn.execute('qconf -mattr queue shell '/bin/bash' all.q')
!!! ERROR - command 'qconf -mattr queue shell "/bin/bash" all.q' failed with status 127
>>> Doing mconn.execute('qconf -Ap s' /tmp/pe.txt parallel_environment.name)
!!! ERROR - command 'qconf -Ap /tmp/pe.txt' failed with status 127
>>> Doing mconn.execute('qconf -mattr queue pe_list 'orte' all.q')
!!! ERROR - command 'qconf -mattr queue pe_list "orte" all.q' failed with status 127
>>> Shutting down threads...


Replacing 'master' with master INTERNAL IP in @allhosts
>>> sge.CreateCell.addMasterToAllHosts     command: export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/qconf -shgrp @allhosts
error: commlib error: got select error (Connection timed out)
ERROR: unable to contact qmaster using port 36331 on host "ip-10-220-199-12"
>>> sge.CreateCell.addMasterToAllHosts    BEFORE allhosts_template: 
>>> sge.CreateCell.getHostname    master_ip: 10.220.199.12
>>> sge.CreateCell.getHostname    hostname: ip-10-220-199-12
>>> sge.CreateCell.addMasterToAllHosts    AFTER allhosts_template:  ip-10-220-199-12
>>> sge.CreateCell.addMasterToAllHosts    printed filename: /tmp/admin-smallcluster-allhosts.txt
>>> sge.CreateCell.addMasterToAllHosts    set_command: export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/lx24-amd64/qconf -Mhgrp /tmp/admin-smallcluster-allhosts.txt
error: commlib error: got select error (Connection timed out)
Aunable to contact qmaster using port 36331 on host "ip-10-220-199-12"
>>> Restarting SGE qmaster and execd daemons
>>> CreateCell.restartSge    rootpath: /opt/sge6/bin/linux-x64
>>> /bin/ps aux | grep sgeadmin | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
>>> /bin/ps aux | grep root | grep sge | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
>>> sge.CreateCell.restartSge    node.alias: master
>>> sge.CreateCell.restartSge    export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/linux-x64/sge_qmaster
>>> sge.CreateCell.restartSge    export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; /opt/sge6/bin/linux-x64/sge_execd
^C
www-data@domU-12-31-38-01-DA-E2:~/cgi-bin/agua$ >>> Enabling job scheduling info
error: commlib error: got select error (Connection timed out)



</entry>
<entry [Sun 2012:03:18 19:03:41 EST] INSTRUCTIONS FOR CREATING STARCLUSTER AMI FROM SCRATCH>


https://github.com/jtriley/StarCluster/wiki/ubuntu-10.04

StarCluster AMI Cookbook Ubuntu 10.04

Below are pseudo-instructions for creating the latest StarCluster AMI (Ubuntu 10.04 Lucid) from scratch:

Note

You should be root when executing any command in this guide

Launch AMI and Install Packages
Launch an alestic ubuntu AMI (x86: ami-2d4aa444, amd64: ami-fd4aa494)
Login via ssh as the ubuntu user and use "sudo -i" to switch to root
Edit /etc/apt/sources.list, add multiverse to the end of all lines
Update the packages to the latest versions:

apt-get update
apt-get upgrade

Install the necessary build tools:
apt-get --reinstall install build-essential python-dev swig gfortran -y
apt-get remove python-nose g77 python-setuptools -y
Install and configure blas/lapack:
rm -rvf /usr/lib{,64}/atlas/
apt-get remove liblapack"*" -y
apt-get remove libblas"*" -y
apt-get -y --reinstall install libatlas-base-dev libatlas3gf-base
Install and configure gfortran:
apt-get --reinstall install gfortran-4.4 -y
ln -sf /usr/bin/gfortran{-4.4,}
Remove any existing numpy/scipy installations:
rm -rvf /usr/local/lib/python2.6/*-packages/numpy*
rm -rvf /usr/local/lib/python2.6/*-packages/scipy*
Install and configure the base dependencies:
apt-get install python-dev git-core vim mercurial subversion cvs encfs \
ipython openmpi-bin libopenmpi-dev nfs-kernel-server python-django keychain \
screen tmux zsh ksh csh tcsh python-pip python-setuptools python-virtualenv \
python-imaging python-boto unzip rar unace build-essential gfortran \
ec2-api-tools ec2-ami-tools mysql-server mysql-client apache2 \
libapache2-mod-wsgi sysv-rc-conf pssh emacs cython irssi python-distutils-extra \
python-profiler htop vim-scripts python-ctypes
Install latest nose:
pip install nose
Configure Root Login
The alestic AMI's have been configured to disable root logins. Follow the commands below to undo this behavior:

Edit /etc/cloud/cloud.cfg and set disable_root: 0
Edit /root/.ssh/authorized_keys and remove prefix commands from pubkey entry
Edit /usr/bin/cloud-init, go to line 67 and change 'once-per-instance' to 'always', save and exit
Configure MOTD and Bash Completion
Customize motd in /etc/update-motd.d/* and /etc/motd.tail
Uncomment bash completion section in /etc/bash.bashrc
Configure NFS
StarCluster relies on the /etc/init.d/nfs script to start the NFS server. Run the command below to ensure this exists:

ln -s /etc/init.d/nfs-kernel-server /etc/init.d/nfs

Configure Sun Grid Engine
Unpack SGE 6u5 distribution files and move to /opt/sge6-fresh
Unpack python-drmaa (0.2) to /opt, set SGE6_ROOT='/opt/sge6-fresh' in setup.py and run:
python setup.py install
Unpack python-drmaa (0.4b3) to /opt and run the following command inside the source folder:
python setup.py install
Link the DRMAA library to /usr/lib64/libdrmaa.so:
ln -s /opt/sge6-fresh/lib/lx24-{x86|amd64}/libdrmaa.so.1.0 /usr/lib{64}/libdrmaa.so.1.0
ln -s /usr/lib{64}/libdrmaa.so.1.0 /usr/lib{64}/libdrmaa.so
Test that the following commands complete without error:
python -c "import DRMAA"
python -c "import drmaa"
Rebuild Ubuntu's OpenMPI packages with Sun Grid Engine Support
Install the build deps for libopenmpi-dev:
apt-get build-dep libopenmpi-dev
Get the source for the libopenmpi-dev debian package:
cd /usr/local/src
apt-get source libopenmpi-dev
Change into the libopenmpi-dev package's debian folder:
cd openmpi-1.4.1/debian
Modify the 'rules' file and add --with-sge to the configure arguments:
vim rules
(add --with-sge to configure args)
Rebuild the libopenmpi-dev package:
cd ..
dpkg-buildpackage -rfakeroot -b
Install the newly rebuild package:
cd ..
dpkg -i *.deb
Verify Sun Grid Engine support:
ompi_info | grep -i grid
    MCA ras: gridengine (MCA v2.0, API v2.0, Component v1.4.1)
Configure Optimized Atlas/UMFPACK/AMD/FFTW/Scipy/Numpy
The next sections describe installing an optimized scipy/numpy using Atlas/UMFPACK/AMD/FFTW libraries from source. A lot of these instructions were merged from http://scipy.org/Installing_SciPy/Linux

Install lapack/atlas from source

Checkout npinto-toolbox:
cd /usr/local/src
git clone git://github.com/jtriley/npinto-toolbox
cd npinto-toolbox
Run the ATLAS installer:
./install_atlas3.8.3_Ubuntu9.10-{x86,x86_64}-root.bash
Remove /usr/lib/liblapack.so:
rm /usr/lib/liblapack.so
Update /usr/lib/gfortran.so symlink:
ln -s /usr/lib/libgfortran.so.3 /usr/lib/gfortran.so
Install UMFPACK/AMD/UFconfig from source

Create a directory to unpack the source into:
mkdir /usr/local/src/umfpack
Get the latest versions of AMD, UFconfig and UMFPACK and untar them into /usr/local/src/umfpack
Modify /usr/local/src/umfpack/UFconfig/UFconfig.mk to look like (change -m64 to -m32 in the flags below for a 32bit system):
CC = gcc
CFLAGS = -O3 -fexceptions -m64 -fPIC -DNCHOLMOD
F77 = gfortran
F77FLAGS = -O -m64 -fPIC

BLAS = -lptf77blas -lptcblas -latlas -lgfortran
LAPACK = -llapack -lptf77blas -lptcblas -latlas -lgfortran
Run 'make' in the /usr/local/src/umfpack/UMFPACK directory:
cd /usr/local/src/umfpack/UMFPACK
make
Copy resulting libraries and include files:
cp /usr/local/src/umfpack/AMD/Lib/libamd.a /usr/lib
cp /usr/local/src/umfpack/UMFPACK/Lib/libumfpack.a /usr/lib
cp /usr/local/src/umfpack/AMD/Include/amd.h /usr/include
cp /usr/local/src/umfpack/UFconfig/UFconfig.h /usr/include
cp /usr/local/src/umfpack/UMFPACK/Include/*.h /usr/include
Create /usr/lib/libumfpack.so symlink:
ln -s /usr/lib/libumfpack.a /usr/lib/libumfpack.so
Install FFTW from source

Download fftw-3.2.2 from http://www.fftw.org into /usr/local/src and unpack
Change into the fftw source folder:
cd /usr/local/src/fftw-3.2.2
Configure fftw (change -m64 to -m32 for 32bit):
export CFLAGS="-O3 -fomit-frame-pointer -fstrict-aliasing -ffast-math -pthread -fPIC -m64"
export FFLAGS="-g -O2 -fPIC -m64"
export CXXFLAGS="-g -O2 -fPIC -m64"
./configure --enable-sse2 --enable-threads --with-combined-threads --prefix=/usr
Build fftw:
make install
Install Scipy/Numpy from source

Download numpy-1.5.0b1/scipy-0.8.0 into /usr/local/src and untar them
Copy numpy_scipy_site.cfg from npinto-toolbox:
cp /usr/local/src/npinto-toolbox/install_scripts/numpy_scipy_site.cfg /usr/local/src/numpy-1.5.0b1/site.cfg
cp /usr/local/src/npinto-toolbox/install_scripts/numpy_scipy_site.cfg /usr/local/src/scipy-0.8.0/site.cfg
Run the configure check for numpy:
cd /usr/local/src/numpy-1.5.0b1
python setup.py config
Copy the SMCFLAGS from the ATLAS VERSION output and export CFLAGS to be the same as SMCFLAGS
Copy the F77FLAGS from the ATLAS VERSION output and export F77FLAGS to be the same
Install numpy:
python setup.py install
Run the following command:
python -c "import numpy; numpy.show_config()"
The output of the above command should look something like:
In [3]: import numpy

In [4]: numpy.show_config()
atlas_threads_info:
    libraries = ['lapack', 'ptf77blas', 'ptcblas', 'atlas']
    library_dirs = ['/usr/lib']
    language = f77

blas_opt_info:
    libraries = ['ptf77blas', 'ptcblas', 'atlas']
    library_dirs = ['/usr/lib']
    define_macros = [('ATLAS_INFO', '"\\"3.8.3\\""')]
    language = c

atlas_blas_threads_info:
    libraries = ['ptf77blas', 'ptcblas', 'atlas']
    library_dirs = ['/usr/lib']
    language = c

lapack_opt_info:
    libraries = ['lapack', 'ptf77blas', 'ptcblas', 'atlas']
    library_dirs = ['/usr/lib']
    define_macros = [('ATLAS_INFO', '"\\"3.8.3\\""')]
    language = f77

lapack_mkl_info:
  NOT AVAILABLE

blas_mkl_info:
  NOT AVAILABLE

mkl_info:
  NOT AVAILABLE
Install scipy:
cd /usr/local/src/scipy-0.8.0
python setup.py install
Run the following command:
python -c "import scipy; scipy.show_config()"
Output of the above command should look something like:
In [5]: import scipy

In [6]: scipy.show_config()
amd_info:
    libraries = ['amd']
    library_dirs = ['/usr/lib']
    define_macros = [('SCIPY_AMD_H', None)]
    swig_opts = ['-I/usr/include']
    include_dirs = ['/usr/include']

umfpack_info:
    libraries = ['umfpack', 'gfortran', 'amd']
    library_dirs = ['/usr/lib']
    define_macros = [('SCIPY_UMFPACK_H', None), ('SCIPY_AMD_H', None)]
    swig_opts = ['-I/usr/include', '-I/usr/include']
    include_dirs = ['/usr/include']

atlas_threads_info:
    libraries = ['lapack', 'ptf77blas', 'ptcblas', 'atlas']
    library_dirs = ['/usr/lib']
    language = f77

blas_opt_info:
    libraries = ['ptf77blas', 'ptcblas', 'atlas']
    library_dirs = ['/usr/lib']
    define_macros = [('ATLAS_INFO', '"\\"3.8.3\\""')]
    language = c

atlas_blas_threads_info:
    libraries = ['ptf77blas', 'ptcblas', 'atlas']
    library_dirs = ['/usr/lib']
    language = c

lapack_opt_info:
    libraries = ['lapack', 'ptf77blas', 'ptcblas', 'atlas']
    library_dirs = ['/usr/lib']
    define_macros = [('ATLAS_INFO', '"\\"3.8.3\\""')]
    language = f77

lapack_mkl_info:
  NOT AVAILABLE

blas_mkl_info:
  NOT AVAILABLE

mkl_info:
  NOT AVAILABLE
Make sure the following commands both output "OK":
python -c "import numpy; numpy.test()"
python -c "import scipy; scipy.test()"
Last edited by Justin Riley, 8 months ago
  
</entry>
<entry [Mon 2012:03:12 17:53:32 EST] CHANGED DEFAULT STARCLUSTER IMAGE TO 64-BIT EBS>

PROBLEM:

>>> Creating security group @sc-admin-smallcluster...
!!! ERROR - UnsupportedOperation: AMI 'ami-d1c42db8' with an instance-store root device is not supported for the instance type 't1.micro'.
StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)


DIAGNOSIS:

TRYING TO RUN A 32-BIT NON-EBS IMAGE ON A t1.micro

/data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config listpublic
StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

>>> Listing all public StarCluster images...

32bit Images:
-------------
[0] ami-899d49e0 us-east-1 starcluster-base-ubuntu-11.10-x86 (EBS)
[1] ami-8cf913e5 us-east-1 starcluster-base-ubuntu-10.04-x86-rc3
[2] ami-d1c42db8 us-east-1 starcluster-base-ubuntu-9.10-x86-rc8
[3] ami-8f9e71e6 us-east-1 starcluster-base-ubuntu-9.04-x86

64bit Images:
--------------
[0] ami-4583572c us-east-1 starcluster-base-ubuntu-11.10-x86_64-hvm (HVM-EBS)
[1] ami-999d49f0 us-east-1 starcluster-base-ubuntu-11.10-x86_64 (EBS)
[2] ami-0af31963 us-east-1 starcluster-base-ubuntu-10.04-x86_64-rc1
[3] ami-8852a0e1 us-east-1 starcluster-base-ubuntu-10.04-x86_64-hadoop
[4] ami-a5c42dcc us-east-1 starcluster-base-ubuntu-9.10-x86_64-rc4
[5] ami-a19e71c8 us-east-1 starcluster-base-ubuntu-9.04-x86_64
[6] ami-06a75a6f us-east-1 starcluster-base-centos-5.4-x86_64-ebs-hvm-gpu-hadoop-rc2 (HVM-EBS)
[7] ami-12b6477b us-east-1 starcluster-base-centos-5.4-x86_64-ebs-hvm-gpu-rc2 (HVM-EBS)


SOLUTION:

USE UBUNTU 11.10 EBS 64-BIT IMAGE

[1] ami-999d49f0 us-east-1 starcluster-base-ubuntu-11.10-x86_64 (EBS)


</entry>
<entry [Sun 2011:10:09 23:13:21 EST] FIXED 'ImportError: No module named starcluster'>

PROBLEM：

/data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config listclusters syoung-microcluster

    Traceback (most recent call last):
      File "/data/starcluster/0.92rc2/bin/starcluster", line 2, in < module >
        from starcluster import cli
    ImportError: No module named starcluster


DIAGNOSIS:

EXECUTABLE MISSING LOAD OF StarCluster MODULE OR STARCLUSTER NOT INSTALLED

cat /data/starcluster/0.92rc2/bin/starcluster
#!/usr/bin/env python
from starcluster import cli

if __name__ == '__main__':
    try:
        cli.main()
    except KeyboardInterrupt:
        print "Interrupted, exiting."



SOLUTION:

1. ADD LINES TO EXECUTABLE


cat /data/starcluster/0.92.rc2/bin/starcluster

    #!/usr/bin/python
    __requires__ = 'StarCluster==0.92rc2'
    from pkg_resources import require; require('StarCluster==0.92rc2')
    del require
    
    from starcluster import cli
    
    if __name__ == '__main__':
        try:
            cli.main()
        except KeyboardInterrupt:
            print "Interrupted, exiting."


2. INSTALL STARCLUSTER

sudo apt-get install python-setuptools

cd /data/starcluster/0.92rc2
python setup.py develop

    ...
    Using /usr/lib/python2.7/dist-packages
    Finished processing dependencies for StarCluster==0.92rc2


    
</entry>
<entry [Thu 2011:09:01 05:57:55 EST] ADDED editAllhosts METHOD TO sge.py>

REPLACE master WITH MASTER LONG INTERNAL IP


# START SHELL
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-microcluster.config \
shell

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg);
cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-microcluster')

reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-microcluster')

    OK

</entry>
<entry [Sun 2011:09:04 09:27:20 EST] FIXED ExpatError AND qmaster DIES ON HEADNODE>

SOLUTION:

(OR: USE SGE_ROOT/SGE_CELL/common/host_aliases FILE TO SPECIFY ALIAS)

USE MASTER LONG INTERNAL IP INSTEAD OF SHORT INTERNAL IP IN act_qmaster ON HEADNODE

BEFORE: MASTER'S HOSTNAME IS SHORT INTERNAL IP
root@master:~# hostname
    master

AFTER : MASTER'S HOSTNAME IS LONG INTERNAL IP
hostname domU-12-31-38-04-D8-06.compute-1.internal
hostname
    domU-12-31-38-04-D8-06.compute-1.internal


BEFORE: HEADNODE'S act_qmaster HAS MASTER SHORT INTERNAL IP
cat /opt/sge6/syoung-microcluster/common/act_qmaster
    10.220.219.244

AFTER : HEADNODE'S act_qmaster HAS MASTER LONG INTERNAL IP
echo "domU-12-31-38-04-D8-06.compute-1.internal" > /opt/sge6/syoung-microcluster/common/act_qmaster


ON MASTER:

export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment;
qstat

    error: commlib error: access denied (client IP resolved to host name "domU-12-31-38-04-D8-06.compute-1.internal". This is not identical to clients host name "master")
    error: unable to send message to qmaster using port 36471 on host "master": got send error


CHECK CURRENT LIST OF ADMIN AND SUBMIT HOSTS:

qconf -ss
    domU-12-31-38-04-80-08.compute-1.internal
    ip-10-86-157-176.ec2.internal
    master

qconf -sh
    domU-12-31-38-04-80-08.compute-1.internal
    ip-10-86-157-176.ec2.internal
    master

/opt/sge6/utilbin/lx24-amd64/gethostbyaddr 10.220.219.244
    Hostname: domU-12-31-38-04-D8-06.compute-1.internal
    Aliases:  
    Host Address(es): 10.220.219.244 


ADD MASTER LONG INTERNAL IP TO SUBMIT AND ADMIN HOST GROUPS:

root@master:~# qstat
error: denied: host "domU-12-31-38-04-D8-06.compute-1.internal" is neither submit nor admin host


qconf -ah domU-12-31-38-04-D8-06.compute-1.internal
    
    error: commlib error: access denied (client IP resolved to host name "master". This is not identical to clients host name "domU-12-31-38-04-D8-06.compute-1.internal")
    ERROR: unable to send message to qmaster using port 36471 on host "master": got send error

qconf -as domU-12-31-38-04-D8-06.compute-1.internal
    
    error: commlib error: access denied (client IP resolved to host name "master". This is not identical to clients host name "domU-12-31-38-04-D8-06.compute-1.internal")
    ERROR: unable to send message to qmaster using port 36471 on host "master": got send error



ADDED MASTER INTERNAL IP TO SELF ENTRY IN MASTER /etc/hosts
em /etc/hosts

    127.0.0.1 localhost
    
    # The following lines are desirable for IPv6 capable hosts                       
    ::1 ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    ff02::3 ip6-allhosts
    10.86.193.30 ip-10-86-193-30.ec2.internal ip-10-86-193-30 node001
    10.220.219.244 domU-12-31-38-04-D8-06.compute-1.internal master


NOW MASTER RECOGNISES ITSELF ALTHOUGH IT WON'T ALLOW ITSELF TO ADD ITSELF TO THE ADMIN HOSTS GROUP:


qconf -as domU-12-31-38-04-D8-06.compute-1.internal
    denied: host "domU-12-31-38-04-D8-06.compute-1.internal" is no admin host

qconf -ah domU-12-31-38-04-D8-06.compute-1.internal
    denied: host "domU-12-31-38-04-D8-06.compute-1.internal" is no admin host



SO, FROM HEADNODE, ADDED MASTER TO ADMIN HOSTS:

export SGE_QMASTER_PORT=36471; export SGE_EXECD_PORT=36472; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment;

qconf -ah domU-12-31-38-04-D8-06.compute-1.internal
    domU-12-31-38-04-D8-06.compute-1.internal added to administrative host list

qconf -as domU-12-31-38-04-D8-06.compute-1.internal
    domU-12-31-38-04-D8-06.compute-1.internal added to submit host list


AND NOW MASTER HAS ADMIN PERMISSIONS:

root@master:~# qconf -as domU-12-31-38-04-D8-06.compute-1.internal
    submithost "domU-12-31-38-04-D8-06.compute-1.internal" already exists
root@master:~# qconf -ah domU-12-31-38-04-D8-06.compute-1.internal
    adminhost "domU-12-31-38-04-D8-06.compute-1.internal" already exists





CHECKED SGE ERROR OUTPUT ON HEADNODE:

em /tmp/sge_messages
em /tmp/starcluster-debug-www-data.log
em /opt/sge6/syoung-microcluster/spool/qmaster/messages


PROBLEM:

>>> Jobstats cache is not full. Pulling full job history.
>>> balancers.sge.__init__.__init__    self.qmasterport: 36471
>>> balancers.sge.__init__.__init__    self.execdport: 36472
>>> balancers.sge.__init__.__init__    self.root: /opt/sge6
>>> balancers.sge.__init__.__init__    self.cell: syoung-microcluster
>>> balancers.sge.__init__.__init__    p: < open file 'env', mode 'r' at 0x233b930>
!!! ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qhost -xml' failed with status 1
!!! ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qstat -q all.q -u "*" -xml' failed with status 1
Traceback (most recent call last):
  File "/data/starcluster/0.92rc2/starcluster/cli.py", line 172, in main
    sc.execute(args)
  File "/data/starcluster/0.92rc2/starcluster/commands/loadbalance.py", line 96, in execute
    lb.run(cluster)
  File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 611, in run
    if self.get_stats() == -1:
  File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 566, in get_stats
    self.stat.parse_qhost(qhostxml)
  File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 50, in parse_qhost
    doc = xml.dom.minidom.parseString(string)
  File "/usr/lib/python2.6/xml/dom/minidom.py", line 1928, in parseString
    return expatbuilder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 940, in parseString
    return builder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 223, in parseString
    parser.Parse(string, True)


MANUAL qshot COMMAND GIVES THIS ERROR:

export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 > && /opt/sge6/bin/lx24-amd64/qhost -xml
    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 36471 on host "domU-12-31-38-04-80-08.compute-1.internal": got send error


em /tmp/starcluster-debug-www-data.log

    PID: 541 __init__.py:543 - INFO - balancers.sge.__init__.__init__    p: < open file 'env', mode 'r' at 0x3353d20>
    PID: 541 ssh.py:399 - ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qhost -xml' failed\
     with status 1
    PID: 541 ssh.py:405 - DEBUG - error: commlib error: access denied (client IP resolved to host name "domU-12-31-38-04-D8-06.compute-1.internal". This is not identical to clients \
    host name "master")
    PID: 541 ssh.py:405 - DEBUG - error: unable to send message to qmaster using port 36471 on host "master": got send error
    PID: 541 ssh.py:399 - ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qstat -q all.q -u \
    "*" -xml' failed with status 1
    PID: 541 ssh.py:405 - DEBUG - error: commlib error: access denied (client IP resolved to host name "domU-12-31-38-04-D8-06.compute-1.internal". This is not identical to clients \
    host name "master")
    PID: 541 ssh.py:405 - DEBUG - error: unable to send message to qmaster using port 36471 on host "master": got send error
    PID: 541 ssh.py:402 - DEBUG - command export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qacct -j -b 2011090\
    41426 failed with status 1
    PID: 541 ssh.py:405 - DEBUG - no jobs running since startup
    PID: 541 ssh.py:405 - DEBUG - /opt/sge6/default/common/accounting: No such file or directory
    PID: 541 __init__.py:565 - DEBUG - sizes: qhost: 257, qstat: 257, qacct: 92.
    PID: 541 cli.py:194 - DEBUG - Traceback (most recent call last):
      File "/data/starcluster/0.92rc2/starcluster/cli.py", line 172, in main
        sc.execute(args)
      File "/data/starcluster/0.92rc2/starcluster/commands/loadbalance.py", line 96, in execute
        lb.run(cluster)
      File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 611, in run
        if self.get_stats() == -1:
      File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 566, in get_stats
        self.stat.parse_qhost(qhostxml)
      File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 50, in parse_qhost
        doc = xml.dom.minidom.parseString(string)
      File "/usr/lib/python2.6/xml/dom/minidom.py", line 1928, in parseString
        return expatbuilder.parseString(string)
      File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 940, in parseString
        return builder.parseString(string)
      File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 223, in parseString
    ...




ALSO CAN'T BIND SOCKET:
>>> Jobstats cache is not full. Pulling full job history.
>>> balancers.sge.__init__.__init__    self.qmasterport: 36471
>>> balancers.sge.__init__.__init__    self.execdport: 36472
>>> balancers.sge.__init__.__init__    self.root: /opt/sge6
>>> balancers.sge.__init__.__init__    self.cell: syoung-microcluster
>>> balancers.sge.__init__.__init__    p: < open file 'env', mode 'r' at 0x1fb68a0>
>>> Oldest job is from None. # queued jobs = 0. # hosts = 2.
>>> Avg job duration = 0 sec, Avg wait time = 0 sec.
>>> Checking to remove a node...
>>> No nodes can be killed at this time.
>>> Sleeping, looping again in 30 seconds.

>>> Jobstats cache is not full. Pulling full job history.
>>> balancers.sge.__init__.__init__    self.qmasterport: 36471
>>> balancers.sge.__init__.__init__    self.execdport: 36472
>>> balancers.sge.__init__.__init__    self.root: /opt/sge6
>>> balancers.sge.__init__.__init__    self.cell: syoung-microcluster
>>> balancers.sge.__init__.__init__    p: < open file 'env', mode 'r' at 0x288ed20>
!!! ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qhost -xml' failed with status 1
!!! ERROR - command 'export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qstat -q all.q -u "*" -xml' failed with status 1
Traceback (most recent call last):
  File "/data/starcluster/0.92rc2/starcluster/cli.py", line 172, in main
    sc.execute(args)
  File "/data/starcluster/0.92rc2/starcluster/commands/loadbalance.py", line 96, in execute
    lb.run(cluster)
  File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 611, in run
    if self.get_stats() == -1:
  File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 566, in get_stats
    self.stat.parse_qhost(qhostxml)
  File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 50, in parse_qhost
    doc = xml.dom.minidom.parseString(string)
  File "/usr/lib/python2.6/xml/dom/minidom.py", line 1928, in parseString
    return expatbuilder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 940, in parseString
    return builder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 223, in parseString
    parser.Parse(string, True)
ExpatError: syntax error: line 1, column 0
!!! ERROR - Oops! Looks like you've found a bug in StarCluster
!!! ERROR - Debug file written to: /tmp/starcluster-debug-www-data.log
!!! ERROR - Look for lines starting with PID: 12472
!!! ERROR - Please submit this file, minus any private information,
!!! ERROR - to starcluster@mit.edu
StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu


cat /tmp/sge_messages

    09/05/2011 09:35:24|  main|domU-12-31-38-04-80-08|E|communication error for "domU-12-31-38-04-80-08.compute-1.internal/qmaster/1" running on port 36471: "can't bind socket"
    09/05/2011 09:35:25|  main|domU-12-31-38-04-80-08|E|commlib error: can't bind socket (no additional information available)
    09/05/2011 09:35:33|  main|domU-12-31-38-04-80-08|E|communication error for "domU-12-31-38-04-80-08.compute-1.internal/qmaster/1" running on port 36471: "can't bind socket"
    09/05/2011 09:35:34|  main|domU-12-31-38-04-80-08|E|commlib error: can't bind socket (no additional information available)
    09/05/2011 09:35:53|  main|domU-12-31-38-04-80-08|C|abort qmaster startup due to communication errors
    09/05/2011 09:36:02|  main|domU-12-31-38-04-80-08|C|abort qmaster startup due to communication errors



LSOF:

lsof -r | grep sge | tee /tmp/sgeout

    sge_execd  8643 sgeadmin    3u     IPv4             494984      0t0        TCP *:36472 (LISTEN)
    sge_execd  8643 sgeadmin    5u     IPv4             495420      0t0        TCP domU-12-31-38-04-80-08.compute-1.internal:37690->domU-12-31-38-04-D8-06.compute-1.internal:36471 (ESTABLISHED)
    sge_qmast 12256 sgeadmin  cwd       DIR                8,1     4096     542049 /opt/sge6/default/spool/qmaster
    sge_qmast 12256 sgeadmin  rtd       DIR                8,1     4096          2 /
    sge_qmast 12256 sgeadmin  txt       REG                8,1  2724943     541174 /opt/sge6/bin/lx24-amd64/sge_qmaster
    sge_qmast 12256 sgeadmin  mem       REG                8,1    10448     245997 /lib/libnss_mdns4.so.2
    sge_qmast 12256 sgeadmin  mem       REG                8,1  1808716     541577 /opt/sge6/lib/lx24-amd64/libspoolc.so
    sge_qmast 12256 sgeadmin  mem       REG                8,1    93000     247710 /




DIAGNOSIS:

ERROR IS DUE TO THE FACT THAT THE MASTER IS NOT AN ADMIN HOST:

em /opt/sge6/syoung-microcluster/spool/qmaster/messages

    08/31/2011 07:41:23| timer|domU-12-31-38-04-80-08|W|act_qmaster file has been changed by another qmaster
    08/31/2011 07:41:23|  main|domU-12-31-38-04-80-08|E|jvm thread is not running
    08/31/2011 07:41:23|worker|domU-12-31-38-04-80-08|E|denied: host "10.220.219.244" is no admin host
    08/31/2011 07:41:23|worker|domU-12-31-38-04-80-08|E|denied: host "10.220.219.244" is no admin host
    08/31/2011 07:41:23|schedu|domU-12-31-38-04-80-08|E|denied: host "10.220.219.244" is no admin host
    08/31/2011 07:41:23|schedu|domU-12-31-38-04-80-08|E|denied: host "10.220.219.244" is no admin host
    08/31/2011 07:41:28|  main|domU-12-31-38-04-80-08|I|controlled shutdown 6.2u5 (exit state = 100)


SOLUTION:

ADD THE MASTER AS AN ADMIN HOST:

export SGE_QMASTER_PORT=36471 &&  export SGE_EXECD_PORT=36472 &&  export SGE_ROOT=/opt/sge6 && /opt/sge6/bin/lx24-amd64/qconf -ah 10.220.219.244
    domU-12-31-38-04-D8-06.compute-1.internal added to administrative host list

    
</entry>
<entry [Thu 2011:09:01 05:57:55 EST] CHANGED sge.py TO USE MASTER SHORT INTERNAL IP FOR act_qmaster>

# START SHELL
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-microcluster.config \
shell

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg);
cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-microcluster')
reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-microcluster')

    OK

TESTING:        self.head_ip = "10.220.131.246"

    
</entry>
<entry [Sun 2011:06:19 12:34:15 EST] RERUN OF 'source /etc/profile && qhost -xml' PROBLEM>

SEE starcluster
[Sun 2011:06:19 12:34:15 EST]
FIXED 'source /etc/profile && qhost -xml' failed with status 1 PROBLEM

PROBLEM: GET THIS ERROR WHEN RUNNING Workflow::executeWorkflow

em /nethome/admin/agua/.cluster/syoung-microcluster-loadbalancer.out

    ...
    !!! ERROR - command 'source /etc/profile && qhost -xml' failed with status 1
    !!! ERROR - command 'source /etc/profile && qstat -q all.q -u "*" -xml' failed with status 1
    Traceback (most recent call last):
      File "/data/starcluster/0.92rc2/starcluster/cli.py", line 172, in main
        sc.execute(args)
      File "/data/starcluster/0.92rc2/starcluster/commands/loadbalance.py", line 96, in execute
        lb.run(cluster)
      File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 578, in run
        if self.get_stats() == -1:
      File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 533, in get_stat    s
        self.stat.parse_qhost(qhostxml)
      File "/data/starcluster/0.92rc2/starcluster/balancers/sge/__init__.py", line 50, in parse_qho    st



DIAGNOSIS: SAME PROBLEM AS PREVIOUSLY:

ALTHOUGH /etc/profile IS USED BY THE MASTER AND EXEC NODES, IT SHOULD NOT BE USED ON THE HEADNODE BECAUSE ONE SOURCED FILE CAN'T CONCURRENTLY HOLD A DIFFERENT QMASTER PORT FOR EACH CLUSTER

SOLUTION:

    1. REMOVE /etc/profile FROM balancers/sge/__init__.py    

    LINES 518, 519 AND 521:
            #qacct_cmd = 'source /etc/profile && qacct -j -b ' + qatime
            #qstat_cmd = 'source /etc/profile && qstat -q all.q -u \"*\" -xml'
            #qhostxml = '\n'.join(master.ssh.execute(
            #    'source /etc/profile && qhost -xml', log_output=True))
            qacct_cmd = 'qacct -j -b ' + qatime
            qstat_cmd = 'qstat -q all.q -u \"*\" -xml'
            qhostxml = '\n'.join(master.ssh.execute(
                'qhost -xml', log_output=True))



    2. PASS ENVIRONMENT VARIABLES WHEN RUNNING starcluster, E.G.:
    
export ...***ETC.***; /data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config bal syoung-microcluster -m 3 -n 0 -i 30 -w 100 -s 30
    


</entry>
<entry [Wed 2011:08:31 05:02:22 EST] FIX PLUGIN: sge ERROR WHEN COPYING CELLDIR>

SOLUTION: NO FIX NEEDED

DIAGNOSIS: ERROR IS DUE TO DIRECTORY BEING ALREADY PRESENT.

PROBLEM: GET THIS ERROR ON STARTUP OF NEW CLUSTER:

If you would like to re-use these instances, rerun
the same start command with the --no-create option
>>> Running plugin sge
>>> Running plugin: sge.CreateCell
>>> Opening SGE qmaster and execd ports
>>> Copying cell directory on head node
>>> Copying cell directory on master
>>> mkdir /opt/sge6/syoung-microcluster &> /dev/null
!!! ERROR - command 'cd /opt/sge6/syoung-microcluster/common; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export SGE_QMASTER_PORT=36361; export SGE_EXECD_PORT=36362; /opt/sge6/util/create_settings.sh /opt/sge6/syoung-microcluster/common' failed with status 2
>>> rsync -a /opt/sge6/default/* /opt/sge6/syoung-microcluster --exclude *tar.gz
>>> chown -R sgeadmin:sgeadmin /opt/sge6/syoung-microcluster
>>> Updating act_qmaster file
>>> Restarting SGE qmaster and execd daemons
>>> /bin/ps aux | grep sgeadmin | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
>>> Adding 'threaded' parallel environment
>>> Adding head node to submit hosts and admin hosts lists
>>> Add master to @allhosts group
>>> sge.addToAllhosts    command: /opt/sge6/bin/lx24-amd64/qconf -aattr hostgroup hostlist master @allhosts >> /tmp/allhosts.out; 
>>> Restarting SGE qmaster and execd daemons
>>> /bin/ps aux | grep sgeadmin | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
>>> Completed running plugin: sge.CreateCell

    
</entry>
<entry [Wed 2011:08:31 04:40:13 EST] ENABLE sge.py AND automount.py PLUGINS TO SET HEADNODE IPs>

# START SHELL
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-microcluster.config \
shell

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-microcluster')
reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-microcluster')

    OK

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg);
cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-microcluster')
reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-microcluster')

    OK

TESTING:        self.head_ip = "10.220.131.246"



NOTES
-----

hostname
    domU-12-31-38-04-80-08

hostname 10.220.131.246


RESTARTING PORTMAP/NFS:
service portmap restart
service nfs restart





    
</entry>
<entry [Wed 2011:08:31 04:01:16 EST] FIX PLUGIN: automount>

PROBLEM:

>>> Running plugin automount
>>> Running plugin: automount.NfsShares
>>> Opening NFS ports
    OK!!!
    
>>> Mounting shared from head node to master
>>> Adding /etc/exports entry (/agua to master)
>>> Adding /etc/exports entry (/data to master)
>>> Adding /etc/exports entry (/nethome to master)
>>> Setting mountd port on master
>>> Mounting NFS shares on master
>>> mount -t nfs 10.86.157.176:/agua /agua
!!! ERROR - command 'mount -t nfs 10.86.157.176:/agua /agua' failed with status 32
!!! ERROR - command 'mount -t nfs 10.86.157.176:/agua /agua' failed with status 32



SOLUTION:

NOW:

1. ENABLE THE sge.py AND automount.py PLUGINS TO GET THE HEADNODE LONG AND SHORT INTERNAL IPS
2. TERMINATE ALL RUNNING CLUSTERS BEFORE STOPPING THE HEADNODE.
3. REPLACE INTERNAL IP (SHORT AND LONG) IN ALL EXISTING cluster CONFIG FILES ON RESTART


LATER: UPDATE SYSTEM WITH NEW INTERNAL IP AFTER RESTART

1. REPLACE INTERNAL IP (SHORT AND LONG) IN ALL EXISTING cluster CONFIG FILES
2. RERUN sge.py AND automount.py PLUGINS ALONE TO RENEW NFS AND SGE SETTINGS WITH NEW IP


DIAGNOSIS:

IP DIFFERS FROM HEADNODE IPs:

ec2din $head
RESERVATION	r-e171f88e	728213020069	default
INSTANCE	i-3ba8c35a	ami-76837d1f	ec2-107-20-183-34.compute-1.amazonaws.com	domU-12-31-38-04-80-08.compute-1.internal	running	aquarius2	0		t1.micro	2011-08-31T06:12:11+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	107.20.183.34	10.220.131.246			ebs			paravirtual	

... BECAUSE THE syoung-microcluster.config FILE WAS CREATED EARLIER, WHEN THE HEADNODE HAD A DIFFERENT INTERNAL IP:

cat /nethome/admin/.starcluster/syoung-microcluster.config
    ...
    [plugin automount]
    cluster=syoung-microcluster
    devices=/dev/sdh,/dev/sdi,/dev/sdj
    head_ip=10.86.157.176
    head_long_ip=ip-10-86-157-176.ec2.internal
    interval=30
    mountdport=32767
    mountpoints=/agua,/data,/nethome
    nfsport=2049
    portmapport=111
    setup_class=automount.NfsShares
    sourcedirs=/agua,/data,/nethome


    
</entry>
<entry [Mon 2011:08:29 05:38:28 EST] AVOID SSH INTERACTIVE PROMPT USING StrictHostKeyChecking>

PROBLEM: GET INTERACTIVE PROMPT ON SSH TO HEADNODE WITH NEW IP (AFTER STOP/START)

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-184-73-37-171.compute-1.amazonaws.com "export SGE_QMASTER_PORT=36581; export SGE_EXECD_PORT=36582; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; /opt/sge6/bin/lx24-amd64/qconf -ke all"

    The authenticity of host 'ec2-184-73-37-171.compute-1.amazonaws.com (10.122.85.238)' can't be established.
    RSA key fingerprint is 1f:87:f3:1f:8e:92:6a:d3:1e:c5:0a:12:37:3e:a8:af.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'ec2-184-73-37-171.compute-1.amazonaws.com,10.122.85.238' (RSA) to the list of known hosts.


SOLUTION: 

ssh -o StrictHostKeyChecking=no -i KEYPAIRFILE root@IP_ADDRESS



</entry>
<entry [Fri 2011:08:26 00:22:23 EST] FIXED PROBLEM: qhost FAILS WITH source /etc/profile>


PROBLEM:

echo '{"project":"BOWTIE","workflow":"alignment","workflownumber":"1","number":"1","stop":"1","username":"syoung","sessionId":"9999999999.9999.999","mode":"executeWorkflow","cluster":"syoung-microcluster"}' | ./workflow.cgi    
        
    *** WARNING - The recommended wait_time should be >= 300 seconds (it takes ~5 min to launch a new EC2 node)
    !!! ERROR - command 'source /etc/profile && qhost -xml' failed with status 1
    !!! ERROR - command 'source /etc/profile && qstat -u "*" -xml' failed with status 1



DIAGNOSIS: sge_qmaster WAS NOT RUNNING


SOLUTION:


1. START SGE QMASTER AND EXECD


2. IF THAT FAILS, REMOVE source /etc/profile FROM COMMAND:

REPLACED LINES IN starcluster/balancers/sge/___init___.py, FROM LINE 547:

            #qacct_cmd = 'source /etc/profile && qacct -j -b ' + qatime
            qacct_cmd = 'qacct -j -b ' + qatime
            #qstat_cmd = 'source /etc/profile && qstat -q all.q -u \"*\" -xml'
            qstat_cmd = 'qstat -u \"*\" -xml'


            log.debug("SGELoadBalancer.get_stats    Doing qhostxml = ...")
            qhostxml = '\n'.join(master.ssh.execute(
                #'source /etc/profile && qhost -xml', log_output=True))
                'qhost -xml', log_output=True))



</entry>
<entry [Fri 2011:08:26 00:21:23 EST] FIXED PROBLEM NOT USING '-c' SPECIFIED CONFIG FILE>

PROBLEM: STARCLUSTER IS NOT USING THE CORRECTLY-SPECIFIED CONFIG FILE (E.G., syoung-microcluster.config) AND IS INSTEAD LOOKING FOR THE DEFAULT ~/.starcluster/config
 
/data/starcluster/0.92.rc1/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config start syoung-microcluster

DIAGNOSIS:

SECOND INSTANTIATION OF config.py BY starcluster/commands/start.py DOES NOT HAVE THE -c SPECIFIED CONFIG FILE:

    >>> config.__init__    caller: parse_subcommands, module: /usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/cli.py
    >>> config.__init__    config_file: /nethome/admin/.starcluster/syoung-microcluster.config
    >>> config.__init__    self.cfg_file: /nethome/admin/.starcluster/syoung-microcluster.config

    >>> config.__init__    caller: addopts, module: /usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/commands/start.py
    >>> config.__init__    config_file: None
    >>> config.__init__    self.cfg_file: /var/www/.starcluster/config
    >>> Using default cluster template: syoung-microcluster


SOLUTION:

USE utils CLASS TO HOLD CONFIG FILE:

em /data/starcluster/0.92rc2/starcluster/cli.py

        """
            ADDED config_file TO utils FOR LATER USE IN commands.start.addons
        """
        #log.info("0.92.rc2    cli.parse_subcommands    Setting utils.config_file = gopts.CONFIG: %s", gopts.CONFIG)
        #import pprint
        #pp = pprint.PrettyPrinter(indent=4)
        #pp.pprint(gopts.CONFIG)
        utils.config_file = gopts.CONFIG



... AND PICK IT UP IN start.addopts:

em /data/starcluster/0.92rc2/starcluster/commands/start.py

    def addopts(self, parser):

        log.info("0.92.rc2    commands.start.addopts    utils.config_file: %s", utils.config_file)
        #cfg = config.StarClusterConfig().load()
        cfg = config.StarClusterConfig(utils.config_file).load()



</entry>
<entry [Sun 2011:06:19 12:34:15 EST] STARCLUSTER INSTALLATION LOCATION IN PYTHON 2.6.5>

/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster


NB: ALSO TRIED TO USE PYTHONBREW BUT IT FAILED TO INSTALL PYTHON 2.6.6

IF IT HAD WORKED ...:

cd /data/starcluster/0.92.rc2
pythonbrew switch 2.6.6
sudo easy_install StarCluster



</entry>
<entry [Sun 2011:06:19 12:34:15 EST] FIXED 'source /etc/profile && qhost -xml' failed with status 1 PROBLEM>

PROBLEM:

echo '{"project":"BOWTIE","workflow":"alignment","workflownumber":"1","number":1,"stop":"","username":"syoung","sessionId":"9999999999.9999.999","mode":"executeWorkflow","cluster":"syoung-microcluster"}' | ./workflow.cgi

    >>> Jobstats cache is not full. Pulling full job history.
    !!! ERROR - command 'source /etc/profile && qhost -xml' failed with status 1
    !!! ERROR - command 'source /etc/profile && qstat -q all.q -u "*" -xml' failed with status 1
    Traceback (most recent call last):
      File "/data/starcluster/0.92rc2/starcluster/cli.py", line 172, in main
        sc.execute(args)


SOLUTION:

1. REMOVE THE 'source /etc/profile' AND SET THE SGE_QMASTER_PORT AND SGE_EXECD_PORT ENVIRONMENT VARIABLES BEFORE THE CALL


</entry>
<entry [Sun 2011:06:19 12:34:15 EST] PROBLEM: sge_execd MAY CRASH WHEN RUNNING MORE THAN ONE CELL AT A TIME >


I.E., MULTIPLE INSTANCES OF sge_qmaster AND sge_execd WITH DIFFERENT SGE CELLS

QMASTER RUNS OKAY BUT EXECD FAILS:

echo '{"project":"BOWTIE","workflow":"alignment","workflownumber":"1","number":1,"stop":"","username":"syoung","sessionId":"9999999999.9999.999","mode":"executeWorkflow","cluster":"syoung-microcluster"}' | ./workflow.cgi

    qmaster: export SGE_QMASTER_PORT=36361; export SGE_EXECD_PORT=36362; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; /opt/sge6/bin/lx24-amd64/sge_qmaster
    Agua::Common::SGE::restartSge    output: 
    Agua::Common::SGE::restartSge    execd: export SGE_QMASTER_PORT=36361; export SGE_EXECD_PORT=36362; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; /opt/sge6/bin/lx24-amd64/sge_execd

    error: communication error for "ip-10-86-255-99.ec2.internal/execd/1" running on port 36362: "can't bind socket"
    error: commlib error: can't bind socket (no additional information available)
    critical error: abort qmaster registration due to communication errors



root@domU-12-31-38-07-1A-E1:/nethome/admin/.starcluster# netstat -ntulp | grep sge
tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      4197/sge_execd  
tcp        0      0 0.0.0.0:36361           0.0.0.0:*               LISTEN      5920/sge_qmaster
tcp        0      0 0.0.0.0:36362           0.0.0.0:*               LISTEN      4780/sge_execd  
root@domU-12-31-38-07-1A-E1:/nethome/admin/.starcluster# kill 4297
-bash: kill: (4297) - No such process
root@domU-12-31-38-07-1A-E1:/nethome/admin/.starcluster# kill -9 4197
root@domU-12-31-38-07-1A-E1:/nethome/admin/.starcluster# netstat -ntulp | grep sge
tcp        0      0 0.0.0.0:36361           0.0.0.0:*               LISTEN      5920/sge_qmaster
tcp        0      0 0.0.0.0:36362           0.0.0.0:*               LISTEN      4780/sge_execd  



</entry>
<entry [Sun 2011:06:19 12:34:15 EST] FIXED 'communication error for "ip-10-86-255-99.ec2.internal/execd/1' PROBLEM>


PROBLEM: 

export SGE_QMASTER_PORT=36361; export SGE_EXECD_PORT=36362; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; /opt/sge6/bin/lx24-amd64/sge_execd

    error: communication error for "ip-10-86-255-99.ec2.internal/execd/1" running on port 36362: "can't bind socket"
    error: commlib error: can't bind socket (no additional information available)


ON MASTER:

/opt/sge6/bin/lx24-amd64/sge_execd 
    error: cell directory "/opt/sge6/syoung-microcluster" doesn't exist


SOLUTION: 

CREATED syoung-microcluster CELL DIRECTORY


    
</entry>
<entry [Sun 2011:06:19 12:34:15 EST] FIXED 'not enough settings' PROBLEM>


PROBLEM: WHEN RUNNING Workflow::executeWorkflow GET THIS ERROR:

    !!! ERROR - Not enough settings provided for plugin automount


SOLUTION: USE workflow.cgi INSTEAD OF agua.cgi


</entry>
<entry [Sun 2011:06:19 12:34:15 EST] FIXED PROBLEM: starcluster NOT FINDING syoung-microcluster.config FILE>


EDITED starcluster TO MAKE IT FIND config FILE INSTEAD:

SEE starcluster
Fri 2011:08:26 00:21:23 EST
FIXED PROBLEM NOT USING '-c' SPECIFIED CONFIG FILE



</entry>
<entry [Sun 2011:06:19 12:34:15 EST] FIXED 'not enough arguments' ERROR WITH automount>


cd /nethome/admin/.starcluster/plugins
starcluster.0.92.rc1 -c /nethome/admin/.starcluster/syoung-microcluster.config start syoung-microcluster

    >>> Using default cluster template: syoung-microcluster
    !!! ERROR - Not enough settings provided for plugin automount


EXCERPT FROM syoung-microcluster.config:
    
    ...
    [plugin automount]
    cluster=syoung-microcluster
    devices=/dev/sdh,/dev/sdi,/dev/sdj
    interval=30
    mountdport=32767
    mountpoints=/agua,/data,/nethome
    nfsport=2049
    portmapport=111
    setup_class=automount.NfsShares
    sourcedirs=/agua,/data,/nethome
    ...



THIS IS THE CLASS:

class NfsShares (ClusterSetup):
    """                                                                                      
    Automatically mounts external NFS shares on StarCluster nodes                            
    """
    def __init__(self, head_ip, interval, sourcedirs, mountpoints, portmapport, nfsport, mou\
ntdport, cluster):
        log.info("Loaded plugin: automount.NfsShares")
        log.debug("automount.NfsShares.__init__    Initialising AutoMount plugin.")
        log.debug("automount.NfsShares.__init__    head_ip %s" % head_ip)
        log.debug("automount.NfsShares.__init__    interval %s" % interval)
        log.debug("automount.NfsShares.__init__    sourcedirs %s" % sourcedirs)
        log.debug("automount.NfsShares.__init__    mountpoints %s" % mountpoints)
        log.debug("automount.NfsShares.__init__    portmapport %s" % portmapport)
        log.debug("automount.NfsShares.__init__    nfsport %s" % nfsport)
        log.debug("automount.NfsShares.__init__    mountdport %s" % mountdport)




RAN IN SHELL TO DEBUG:

cd /nethome/admin/.starcluster/plugins
/data/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
shell

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-microcluster')
reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-microcluster')



    cfg.get_plugin('automount')
    Out[1]: 
    {'__name__': 'automount',
     'cluster': 'syoung-microcluster',
     'devices': '/dev/sdh,/dev/sdi,/dev/sdj',
     'interval': '30',
     'mountdport': '32767',
     'mountpoints': '/agua,/data,/nethome',
     'nfsport': '2049',
     'portmapport': '111',
     'setup_class': 'automount.NfsShares',
     'sourcedirs': '/agua,/data,/nethome'}




TRIED WITH COMMAND LINE GENERATED aquarius2 KEY BUT GOT THIS ERROR:

ec2-delete-keypair \
-K /nethome/admin/.keypairs/private.pem \
-C /nethome/admin/.keypairs/public.pem \
id_rsa-admin-key
Unexpected error:
org.codehaus.xfire.fault.XFireFault: General security error; nested exception is: 
	java.security.cert.CertificateParsingException: invalid DER-encoded certificate data
    ...



http://alestic.com/2010/10/ec2-ssh-keys

Based on a Twitter question, I tested uploading a DSA public ssh key (instead of RSA) and got this error from Amazon:

Client.InvalidKeyPair.Format: Invalid DER encoded key material

I don’t see why DSA would not work since it’s just a blurb of text being stored by EC2 and passed to the instance to add to $HOME/.ssh/authorized_keys but there you have it.



ec2-add-keypair \
-K /nethome/admin/.keypairs/private.pem \
-C /nethome/admin/.keypairs/public.pem \
id_rsa-admin-key \
> /nethome/admin/.starcluster/id_rsa-admin-key

Unexpected error:
org.codehaus.xfire.fault.XFireFault: General security error; nested exception is: 
	java.security.cert.CertificateParsingException: invalid DER-encoded certificate data
    ...




MANUALLY PASTED WITH THE FOLLOWING LINE LENGTHS AND WAS ACCEPTED BY :

aquarius2 PRIVATE KEY:

-----BEGIN RSA PRIVATE KEY-----
MIIEpgIBAAKCAQEA1vLhO49CjIakdmSzaYTihkaPMzjNkPPsqsH7A9R2FbRHw4af
RFfcOouKKJdWhvSiWQOyE+7n0BVjGK7RI3pWr+A9uCkhCc8aEr/ECf+rb6dsD6zt
gwcelwQzBxMcVU+eJ8juBYX6zXELdrJInFWW6THt8frbA9kDnDFiNWjCOCIjAA57
moF/vuYUTt9FNEElqcYXmXnZxIqNdrtPwkL2dRGenMrMPNs6BDzjn4fjhMVT/2Aa
OY+/fmYMG1EPa/naymnCPAnOK6CL5Cen7Hw3fZOmL711waldckXX+wDbWjC6DIMr
csz4dBZzi6k5vnu433urCrfk0rby2iwVFUFlNQIDAQABAoIBAQDTg8lTfJO2CMBJ
qKpLyXHHRCOh+eF/JCjdl2jUyfsxPGfp5c1PyU1zZuCbNOD2iEBBa7uOlecTAhiz
r0MpsDchdn4FfKOALYWwsXfNhwNCKfPSMQ6/gv/9ByrXaVzWLjSpXbWrRb4Y74ai
VKnS/P41luZY2csvLBu7VXUYrW+BH3hLLnVtstQDCLw9tULzIYrNg7ICWL4PdV0l
eEBhb3nTv1C7DgTRtzvfHgZneDmzLcLrP924H+MJA94QrX6Ozvm3BVabHtIWo8R3
qlfGOG9FCGZdxJLJeVW37TH1gCChVK1bM3HslfVKLHnKlU4AKWl4c8YQnYHwme4O
H7i1Dl7BAoGBAPT8C/ylhJvJry64F9faAkkgSY0mTfnd1hO98PIBFyYCAziK9RNU
NNdydlvEQHl2wLoZrZV5hvT2GDkSQ+FxzMQR9BjA+wNJeMQ66Rp3ooi6zf4agmB5
Ksk1tX3XD+aIZT1YdEXr3Gmtw6Iek1mGDoQXjPJd3Zt0JVjhfPfOCdVtAoGBAOCd
GUFXEWH6QsTSc77Git0k6Rh5brSPamRq6MANHkXbjjvrPUYj+r+v5bW7OdFUl4AE
828FQgc9cxIkWy9394darWuuFdyO6c1Q6tf80QXjTOVDCU1TbygHK0U92r/0VU0d
vemBKQ/FQrWkgTg8ls0acqEgPjEE96At/yuMwJnpAoGBAPJTpp/AMc3P0AMMgjk3
Im+nCloee58fObTJe15GidlEwF7bxNPbxXEffcgD9iqvtq/e2n8yeLYx/3/ke1Sz
NnLzt1oM+b4knNqt0wolMJbDASPKoRBAinwBLodNhiLo5AusRUcsqRe3k/329JXn
LtCmYvsSsjQkzRR/5xdPrRZ5AoGBAN+pL5vTwlho5pGs6lqew2ogNggL60Pax1uE
5Y1PwsRXM1PRE+vDKg40bi2/aHxcmpt80pbLiotBElOPZklnUVEz5xoheF1u5btw
BtnaQp11UH2+egXIvhgCw4CobinUeBhZNGHPHn84swvC6nWAR72mx1xQif0v8BBN
nRjViHf5AoGBAKy57uRYZUpJHBdux5N1JEnvYMp4V5eAgq3asrqX9Adx3+/b9qT3
vSKkEieCNjQZVbe0XAM9o928dJz6YsMgybcX3umzLzHfhCIxiaqan9CBt8P/Q+BH
JztMzzzlfLAmjKzFTYmtT1u5zAc+JfyH9bGbF2B8kLO3jbNh66VEbGio
-----END RSA PRIVATE KEY-----


aquarius2 PUBLIC KEY

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW8uE7j0KMhqR2ZLNphOKGRo8z
OM2Q8+yqwfsD1HYVtEfDhp9EV9w6i4ool1aG9KJZA7IT7ufQFWMYrtEjelav4D24
KSEJzxoSv8QJ/6tvp2wPrO2DBx6XBDMHExxVT54nyO4FhfrNcQt2skicVZbpMe3x
+tsD2QOcMWI1aMI4IiMADnuagX++5hRO30U0QSWpxheZednEio12u0/CQvZ1EZ6c
ysw82zoEPOOfh+OExVP/YBo5j79+ZgwbUQ9r+drKacI8Cc4roIvkJ6fsfDd9k6Yv
vXXBqV1yRdf7ANtaMLoMgytyzPh0FnOLqTm+e7jfe6sKt+TStvLaLBUVQWU1 stu
artpyoung@gmail.com




BUT GET A PEM-DER FORMAT MISMATCH:



2. NB: StarCluster NOW AUTOMATICALLY CONVERTS LICENSE FROM pem TO der FORMAT

/nethome/admin/.keypairs/private.pem --publiccert /nethome/admin/.keypairs/public.pem --keyname admin-key --username admin



SEE
ec2.credentials
[Thu 2011:08:25 04:38:08 EST]
CONVERSION FROM pem TO der KEY FILE FORMAT>

TO AVOID THIS ERROR:
java.security.cert.CertificateParsingException: invalid DER-encoded certificate data


    



    
</entry>
<entry [Sun 2011:06:19 12:34:15 EST] FIXED PARSING ERROR IN starcluster>

SUMMARY:

1. SUPPRESSED TRACEBACK IN logger.py

    import sys
    sys.tracebacklimit = 0

2. ADDED ERROR FILTER TO StarCluster.pm

	my $tail = `tail -$lines $outputfile`;
	$tail =~ s/^(Traceback|ValueError)[^\n]+\n//msg;


DEBUG LOAD BALANCER

ipython -logfile /tmp/ipython.log
(OR %logstart)

%pdb

%run /data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -w 100 -s 30 -k 10 -i 10 

%run /data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 30 -w 100 -s 30 -k 10

RERUN LOGGED COMMANDS TO RETURN TO STATE

ipython -logplay shell



cd /nethome/admin/.starcluster/plugins

/data/starcluster/0.91-316/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
bal syoung-smallcluster \
-m 5 -n 1 -i 30 -w 100 -s 30 -k 10 \
shell


# CONFIRM cfg OBJECT HAS PLUGIN INFO:
cfg.get_plugin('sge')

clus = cluster.ClusterManager(cfg)
#cluster.ClusterManager.run_plugin(clus, 'automount', 'smallcluster')
clus.add_node("syoung-smallcluster")


NOTES
-----

An introductory tutorial about IPython
http://onlamp.com/pub/a/python/2005/01/27/ipython.html

Introspection
Python has several built-in functions that facilitate introspection. IPython has access to all of the standard Python functions as well as some extras built into the shell. A typical introspective technique with the standard Python shell is using the built-in dir() function:

<!--

>>> import SimpleXMLRPCServer
>>> dir(SimpleXMLRPCServer.SimpleXMLRPCServer)
['__doc__', '__init__', '__module__', '_dispatch',
'_marshaled_dispatch', 'address_family', 'allow_reuse_address',
'close_request', 'fileno', 'finish_request', 'get_request',
'handle_error', 'handle_request', 'process_request',
'register_function', 'register_instance',
'register_introspection_functions', 'register_multicall_functions',
'request_queue_size', 'serve_forever', 'server_activate', 'server_bind',
'server_close', 'socket_type', 'system_listMethods',
'system_methodHelp', 'system_methodSignature', 'system_multicall',
'verify_request']
Well, that's nice. Very helpful, in fact. I have done just that for years now and have been very pleased with it. This is a nice list of all of SimpleXMLRPCServer.SimpleXMLRPCServer's methods, classes, modules, and so on. Because dir() is a built-in function, IPython can do the same thing, but its ? and ?? operators are more powerful:

In [1]: import SimpleXMLRPCServer

In [2]: ? SimpleXMLRPCServer.SimpleXMLRPCServer
Type:           classobj
String Form:    SimpleXMLRPCServer.SimpleXMLRPCServer
Namespace:      Interactive
File:           /usr/local/python24/lib/python2.4/SimpleXMLRPCServer.py
Docstring:
    Simple XML-RPC server.

    Simple XML-RPC server that allows functions and a single instance
    to be installed to handle requests. The default implementation
    attempts to dispatch XML-RPC calls to the functions or instance
    installed in the server. Override the _dispatch method inherited
    from SimpleXMLRPCDispatcher to change this behavior.

Constructor information:
Definition:     SimpleXMLRPCServer.SimpleXMLRPCServer(self, addr, 
                     requestHandler=<class
				SimpleXMLRPCServer.SimpleXMLRPCRequestHandler at 
				     0xf6b2c5cc>, logRequests=1)
                     
If long strings are present, the ? operator will trim them. The ?? will not trim long strings, and it will display syntax highlighted source code if the source is available.

-->

http://ipython.org/ipython-doc/dev/interactive/tutorial.html

Tab completion

TAB-completion, especially for attributes, is a convenient way to explore the structure of any object you’re dealing with. Simply type object_name.< TAB> and a list of the object’s attributes will be printed (see the readline section for more). Tab completion also works on file and directory names, which combined with IPython’s alias system allows you to do from within IPython many of the things you normally would need the system shell for.

Explore your objects

Typing object_name? will print all sorts of details about any object, including docstrings, function definition lines (for call arguments) and constructor details for classes. The magic commands %pdoc, %pdef, %psource and %pfile will respectively print the docstring, function definition line, full source code and the complete file for any object (when they can be found). If automagic is on (it is by default), you don’t need to type the ‘%’ explicitly. See this section for more.

The %run magic command

The %run magic command allows you to run any python script and load all of its data directly into the interactive namespace. Since the file is re-read from disk each time, changes you make to it are reflected immediately (in contrast to the behavior of import). I rarely use import for code I am testing, relying on %run instead. See this section for more on this and other magic commands, or type the name of any magic command and ? to get details on it. See also this section for a recursive reload command. %run also has special flags for timing the execution of your scripts (-t) and for executing them under the control of either Python’s pdb debugger (-d) or profiler (-p). With all of these, %run can be used as the main tool for efficient interactive development of code which you write in your editor of choice.

Debug a Python script

Use the Python debugger, pdb. The %pdb command allows you to toggle on and off the automatic invocation of an IPython-enhanced pdb debugger (with coloring, tab completion and more) at any uncaught exception. The advantage of this is that pdb starts inside the function where the exception occurred, with all data still available. You can print variables, see code, execute statements and even walk up and down the call stack to track down the true source of the problem (which often is many layers in the stack above where the exception gets triggered). Running programs with %run and pdb active can be an efficient to develop and debug code, in many cases eliminating the need for print statements or external debugging tools. I often simply put a 1/0 in a place where I want to take a look so that pdb gets called, quickly view whatever variables I need to or test various pieces of code and then remove the 1/0. Note also that ‘%run -d’ activates pdb and automatically sets initial breakpoints for you to step through your code, watch variables, etc. The output caching section has more details.

Use the output cache

All output results are automatically stored in a global dictionary named Out and variables named _1, _2, etc. alias them. For example, the result of input line 4 is available either as Out[4] or as _4. Additionally, three variables named _, __ and ___ are always kept updated with the for the last three results. This allows you to recall any previous result and further use it for new calculations. See the output caching section for more.

Suppress output
Put a ‘;’ at the end of a line to suppress the printing of output. This is useful when doing calculations which generate long output you are not interested in seeing. The _* variables and the Out[] list do get updated with the contents of the output, even if it is not printed. You can thus still access the generated results this way for further processing.

Input cache
A similar system exists for caching input. All input is stored in a global list called In , so you can re-execute lines 22 through 28 plus line 34 by typing ‘exec In[22:29]+In[34]’ (using Python slicing notation). If you need to execute the same set of lines often, you can assign them to a macro with the %macro function. See here for more.

Use your input history
The %hist command can show you all previous input, without line numbers if desired (option -n) so you can directly copy and paste code either back in IPython or in a text editor. You can also save all your history by turning on logging via %logstart; these logs can later be either reloaded as IPython sessions or used as code for your programs.

In particular, note taht the %rep magic function can repeat a command or get a command to the input line for further editing:

$ l = ["hei", "vaan"]
$ "".join(l)
==> heivaan
$ %rep
$ heivaan_ < == cursor blinking
For more details, type %rep? as usual.


OUTPUT CACHING
http://ipython.org/ipython-doc/dev/interactive/reference.html#output-caching

The following GLOBAL variables always exist (so don’t overwrite them!):

[_] (a single underscore) : stores previous output, like Python’s default interpreter.
[__] (two underscores): next previous.
[___] (three underscores): next-next previous.
Additionally, global variables named _< n> are dynamically created (< n> being the prompt counter), such that the result of output < n> is always available as _< n> (don’t use the angle brackets, just the number, e.g. _21).

These global variables are all stored in a global dictionary (not a list, since it only has entries for lines which returned a result) available under the names _oh and Out (similar to _ih and In). So the output from line 12 can be obtained as _12, Out[12] or _oh[12]. If you accidentally overwrite the Out variable you can recover it by typing ‘Out=_oh’ at the prompt.

This system obviously can potentially put heavy memory demands on your system, since it prevents Python’s garbage collector from removing any previously computed results. You can control how many results are kept in memory with the option (at the command line or in your ipythonrc file) cache_size. If you set it to 0, the whole system is completely disabled and the prompts revert to the classic ‘>>>’ of normal Python.



SCP

cd /data/starcluster/0.92.rc1/starcluster
scp logger.py root@ec2-174-129-137-49.compute-1.amazonaws.com:/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster

cd /data/starcluster/0.92.rc1/starcluster/balancers/sge
scp __init__.py root@ec2-174-129-137-49.compute-1.amazonaws.com:/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/balancers/sge



WHEN RUN MANUALLY:

/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 10 -w 100 -s 30 -k 10 &> /nethome/admin/agua/.cluster/syoung-smallcluster-loadbalancer.out



... GET THIS ERROR:

tail -f /nethome/admin/agua/.cluster/syoung-smallcluster-loadbalancer.out

ValueError: incomplete format

Traceback (most recent call last):
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/logger.py", line 83, in emit
    self._emit(record)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/logger.py", line 66, in _emit
    msg = self.format(record)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/logger.py", line 45, in format
    result = self.formatters[record.levelno].format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 436, in format
    record.message = record.getMessage()
  File "/usr/lib/python2.6/logging/__init__.py", line 306, in getMessage
    msg = msg % self.args



>>> Jobstats cache is not full. Pulling full job history.
Traceback (most recent call last):
  File "/usr/lib/python2.6/logging/handlers.py", line 71, in emit
    if self.shouldRollover(record):
  File "/usr/lib/python2.6/logging/handlers.py", line 144, in shouldRollover
    msg = "%s\n" % self.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 655, in format
    return fmt.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 437, in format
    record.message = record.getMessage()
  File "/usr/lib/python2.6/logging/__init__.py", line 307, in getMessage
    msg = msg % self.args

ValueError: incomplete format


>>> Jobstats cache is not full. Pulling full job history.
Traceback (most recent call last):
  File "/usr/lib/python2.6/logging/handlers.py", line 71, in emit
    if self.shouldRollover(record):
  File "/usr/lib/python2.6/logging/handlers.py", line 144, in shouldRollover
    msg = "%s\n" % self.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 656, in format
    return fmt.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 438, in format
    record.message = record.getMessage()
  File "/usr/lib/python2.6/logging/__init__.py", line 308, in getMessage
    msg = msg % self.args
ValueError: incomplete format
    Finally reached
logger.format    Returning result:  >>> Sleeping, looping again in 10 seconds.



STILL GETTING IT:

logger.format    Finally reached
logger.format    Returning result:  >>> Sleeping, looping again in 5 seconds.

logger.format    Doing try result = self.formatters[record.levelno].format(record)
logger.format    record:  < LogRecord: starcluster, 20, /usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/balancers/sge/__init__.py, 483, "Jobstats cache is not full. Pulling>>> Jobstats cache is not full. Pulling full job history.
Traceback (most recent call last):
  File "/usr/lib/python2.6/logging/handlers.py", line 71, in emit
    if self.shouldRollover(record):
  File "/usr/lib/python2.6/logging/handlers.py", line 144, in shouldRollover
    msg = "%s\n" % self.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 655, in format
    return fmt.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 437, in format
    record.message = record.getMessage()
  File "/usr/lib/python2.6/logging/__init__.py", line 307, in getMessage
    

    msg = msg % self.args
    
ValueError: incomplete format

>>> Oldest job is from None. # queued jobs = 0. # hosts = 1.
>>> Avg job duration = 0 sec, Avg wait time = 0 sec.
>>> Can't remove a node, already at min (1).
>>> Sleeping, looping again in 5 seconds.



cd /data/starcluster/0.92.rc1/starcluster

scp logger.py root@ec2-174-129-137-49.compute-1.amazonaws.com:/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster




FULL PARSING ERROR

>>> Terminating node: node001 (i-99baf2f7)
>>> ***KILLING NODE: i-af256ec1 (ec2-184-73-89-215.compute-1.amazonaws.com).
>>> Removing node node004 (i-af256ec1)...
>>> Removing node004 from SGE
>>> Removing node004 from known_hosts files
>>> Removing node004 from /etc/hosts
>>> Removing node004 from NFS
>>> Terminating node: node004 (i-af256ec1)
>>> Sleeping, looping again in 30 seconds.

>>> Jobstats cache is not full. Pulling full job history.
Traceback (most recent call last):
  File "/usr/lib/python2.6/logging/handlers.py", line 71, in emit
    if self.shouldRollover(record):
  File "/usr/lib/python2.6/logging/handlers.py", line 144, in shouldRollover
    msg = "%s\n" % self.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 648, in format
    return fmt.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 436, in format
    record.message = record.getMessage()
  File "/usr/lib/python2.6/logging/__init__.py", line 306, in getMessage
    msg = msg % self.args

ValueError: incomplete format
Traceback (most recent call last):
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/logger.py", line 83, in emit
    self._emit(record)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/logger.py", line 66, in _emit
    msg = self.format(record)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/logger.py", line 45, in format
    result = self.formatters[record.levelno].format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 436, in format
    record.message = record.getMessage()
  File "/usr/lib/python2.6/logging/__init__.py", line 306, in getMessage
    msg = msg % self.args
ValueError: incomplete format
>>> Oldest job is from None. # queued jobs = 0. # hosts = 3.
>>> Avg job duration = 0 sec, Avg wait time = 0 sec.
>>> Checking to remove a node...
>>> Idle Node i-17276c79 (node002) has been up for 3 minutes past the hour.
>>> Idle Node i-95266dfb (node003) has been up for 1 minutes past the hour.
>>> No nodes can be killed at this time.
>>> Sleeping, looping again in 30 seconds.



NEW INDEX OUT OF RANGE ERROR:

>>> Loaded plugin: automount.NfsShares
>>> Loaded plugin: sge.CreateCell
*** WARNING - The recommended wait_time should be >= 300 seconds (it takes ~5 min to launch a new EC2 node)
>>> SGELoadBalancer.get_qatime    Jobstats cache is not full. Pulling full job history.
>>> SGELoadBalancer.get_qatime    AFTER temp_lookback_window = self.lookback_window * 60 * 60 = 10800
>>> SGELoadBalancer.get_qatime    BEFORE now = now - datetime.timedelta(seconds=temp_lookback_window + 1)
>>> SGELoadBalancer.get_qatime    AFTER now = now - datetime.timedelta(seconds=temp_lookback_window + 1)
>>> SGELoadBalancer.get_qatime    AFTER str = now.strftime(%Y%m%d%H%M))
>>> SGELoadBalancer.get_qatime    Returning str: 201106200321
Traceback (most recent call last):
  File "/usr/lib/python2.6/logging/handlers.py", line 71, in emit
    if self.shouldRollover(record):
  File "/usr/lib/python2.6/logging/handlers.py", line 144, in shouldRollover
    msg = "%s\n" % self.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 656, in format
    return fmt.format(record)
  File "/usr/lib/python2.6/logging/__init__.py", line 438, in format
    record.message = record.getMessage()
  File "/usr/lib/python2.6/logging/__init__.py", line 308, in getMessage
    msg = msg % self.args
ValueError: incomplete format
>>> Oldest job is from None. # queued jobs = 0. # hosts = 0.
>>> Avg job duration = 0 sec, Avg wait time = 0 sec.
Traceback (most recent call last):
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/cli.py", line 155, in main
    sc.execute(args)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/commands/loadbalance.py", line 91, in execute
    lb.run(cluster)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/balancers/sge/__init__.py", line 616, in run
    self._eval_add_node()
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/balancers/sge/__init__.py", line 645, in _eval_add_node
    sph = self.stat.slots_per_host()
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/balancers/sge/__init__.py", line 212, in slots_per_host
    if self.hosts[0][u'num_proc'] == '-':
IndexError: list index out of range


TRACKED IT DOWN TO HERE:

PID: 9218 logger.py:42 - DEBUG - ConsoleLogger.format    DOING format(self, record)
PID: 9218 logger.py:43 - DEBUG - ConsoleLogger.format    record: < LogRecord: starcluster, 20, /usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/balancers/sge/__init__.py, 637, "Sleeping, looping again in 10 seconds.
">
PID: 9218 logger.py:50 - DEBUG - ConsoleLogger.format    Doing try result = self.formatters[record.levelno].format(record)
PID: 9218 logger.py:56 - DEBUG - ConsoleLogger.format    Finally reached
PID: 9218 ssh.py:536 - DEBUG - __del__ called



PID: 10425 logger.py:50 - DEBUG - ConsoleLogger.format    Doing try result = self.for\
matters[record.levelno].format(record)
PID: 10425 logger.py:55 - DEBUG - ConsoleLogger.format    Finally reached
PID: 10425 __init__.py:713 - INFO - Not changing cluster size until cluster stabilize\
s.
PID: 10425 logger.py:50 - DEBUG - ConsoleLogger.format    Doing try result = self.for\
matters[record.levelno].format(record)
PID: 10425 logger.py:55 - DEBUG - ConsoleLogger.format    Finally reached
PID: 10425 __init__.py:639 - INFO - Sleeping, looping again in 10 seconds.

PID: 10425 logger.py:50 - DEBUG - ConsoleLogger.format    Doing try result = self.for\
matters[record.levelno].format(record)
PID: 10425 logger.py:55 - DEBUG - ConsoleLogger.format    Finally reached
PID: 10425 ssh.py:536 - DEBUG - __del__ called



NARROWED DOWN PROBLEM TO:


PID: 13562 logger.py:54 - DEBUG - ConsoleLogger.format    Exception for result = self.formatters[record.levelno].format(record), record: < LogRecord: starcluster, 20, /usr/local/lib/python2.6/dist-packages/StarCluster-0.92rc1-py2.6.egg/starcluster/balancers/sge/__init__.py, 637, "**** Current time: %" >
PID: 13562 logger.py:61 - DEBUG - ConsoleLogger.format    Finally reached




    
</entry>
<entry [Sun 2011:06:19 12:42:14 EST] REDUCED LOAD BALANCER WAIT TIME IN StarCluster.pm>

-i polling interval (secs)
-w max wait time before adding node (secs)
-s cluster stabilisation time to wait (secs)

StarCluster SETTINGS:

starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 2 &> /nethome/admin/agua/.cluster/syoung-smallcluster-loadbalancer.out

MANUAL

/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 30 -w 100 -s 30 -k 10 &> /nethome/admin/agua/.cluster/syoung-smallcluster-loadbalancer.out

    
</entry>
<entry [Sat 2011:06:18 01:30:47 EST] FIXED PROBLEM RUNNING inst_sge SCRIPT WHEN ADDING NODE>

SUMMARY:

USED OLD sge6-starcluster DIRECTORY WITH SGE CELLS COPIED OVER AND INSTALLED LATEST STARCLUSTER - 0.92.rc1


PROBLEM:

ssh.py:382 - ERROR - command 'cd /opt/sge6 && TERM=rxvt ./inst_sge -x -noremote -auto ./ec2_sge.conf' failed with status 1


SOLUTION:

INSTALLED VERSION 0.92.rc1

python setup.py install

    ...
    Using /usr/local/lib/python2.6/dist-packages/boto-2.0b4-py2.6.egg
    Searching for pycrypto==2.3
    Best match: pycrypto 2.3
    Processing pycrypto-2.3-py2.6-linux-x86_64.egg
    pycrypto 2.3 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.6/dist-packages/pycrypto-2.3-py2.6-linux-x86_64.egg
    Finished processing dependencies for StarCluster==0.92rc1

ADD NODE:

# START SHELL

cd /nethome/admin/.starcluster/plugins
starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
shell

# CONFIRM cfg OBJECT HAS PLUGIN INFO:
cfg.get_plugin('sge')


clus = cluster.ClusterManager(cfg)
#cluster.ClusterManager.run_plugin(clus, 'automount', 'smallcluster')
clus.add_node("syoung-smallcluster")


In [3]: clus.add_node("syoung-smallcluster")
cluster.py:577 - WARNING - Not enough settings provided for plugin automount
cluster.py:578 - WARNING - An error occured while loading plugins
cluster.py:579 - WARNING - Not running any plugins
>>> Launching node(s): node001
Reservation:r-15a28079
>>> Waiting for node(s) to come up... (updating every 30s)
>>> Waiting for all nodes to be in a 'running' state...
2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Waiting for SSH to come up on all nodes...
2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring hostnames...
1/1 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring /etc/hosts on each node
>>> Configuring /etc/hosts for node i-1fba7771
>>> Configuring /etc/hosts for node i-a7dd92c9
2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring NFS...
>>> Mounting shares for node node001
1/1 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> _setup_nfs took 0.035 mins
1/1 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring scratch space for user: sgeadmin
1/1 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring passwordless ssh for root
>>> Using existing key: /root/.ssh/id_rsa
>>> Configuring passwordless ssh for sgeadmin
>>> Using existing key: /home/sgeadmin/.ssh/id_rsa
>>> Adding node001 to SGE
ssh.py:382 - ERROR - command 'cd /opt/sge6 && TERM=rxvt ./inst_sge -x -noremote -auto ./ec2_sge.conf' failed with status 1


</entry>
<entry [Sat 2011:06:18 01:20:52 EST] FIXED commlib ERROR WITH qstat -q all.q>

SUMMARY: REMOVED '-q all.q' FROM qstat COMMAND


DOWNLOADED STARCLUSTER 0.92.rc1

https://github.com/jtriley/StarCluster/commit/adba7cc0557f085ce69561ef1fe0ba26c50ac440

CHANGED LINE 512 IN starcluster/balancers/sge

            #qstat_cmd = 'source /etc/profile && qstat -q all.q -u \"*\" -xml'
            qstat_cmd = 'source /etc/profile && qstat -u \"*\" -xml'




START LOAD BALANCER
-------------------

screen -S bal

/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 30 -w 100 -s 30 -k 10 &> /nethome/admin/agua/.cluster/syoung-smallcluster-loadbalancer.out

    OK - NODES ADD WITHOUT DYING ON inst_sge FAILURE
    

tail -f /nethome/admin/agua/.cluster/syoung-smallcluster-loadbalancer.out

    
</entry>
<entry [Sat 2011:06:18 00:28:42 EST] RESTART SGE ON NODES>

ssh node002 "export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/sge_execd"


BEFORE:

qstat -f

    ...
    Project1-Workflow1@node001     BIP   0/0/1          -NA-     lx24-amd64    au
    Project1-Workflow2@node001     BIP   0/0/1          -NA-     lx24-amd64    au

AFTER:

    ...
    Project1-Workflow1@node001     BIP   0/0/1          0.54     lx24-amd64    
    Project1-Workflow2@node001     BIP   0/0/1          0.54     lx24-amd64    

    
</entry>
<entry [Fri 2011:06:17 21:35:11 EST] FIXED StarCluster PROBLEM LAUNCHING NODES>

SUMMARY: REMOVED BUILT BINARIES AND

COPIED FILES 
inst_sge
ec2_sge.conf

FROM
/opt/sge6-starcluster
TO
/opt/sge6 


PROBLEM:

>>> Adding node004 to SGE
ssh.py:382 - ERROR - command 'cd /opt/sge6 && TERM=rxvt ./inst_sge -x -noremote -auto ./ec2_sge.conf' failed with status 1
    
>>> Oldest job is from 2011-06-16 13:17:59. # queued jobs = 4. # hosts = 3.
>>> Avg job duration = 50 sec, Avg wait time = 4 sec.
>>> A job has been waiting for 44219 sec, longer than max 100.
>>> *** ADDING 1 NODES.
>>> Launching node(s): node004
>>> Waiting for node(s) to come up... (updating every 30s)
>>> Waiting for all nodes to be in a 'running' state...
5/5 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Waiting for SSH to come up on all nodes...
5/5 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring hostnames...
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring /etc/hosts on each node
>>> Configuring /etc/hosts for node i-1fba7771
>>> Configuring /etc/hosts for node i-bbf13bd5
>>> Configuring /etc/hosts for node i-d9f73db7
>>> Configuring /etc/hosts for node i-af0d42c1
>>> Configuring /etc/hosts for node i-ad0c43c3
5/5 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring NFS...
>>> Mounting shares for node node004
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> _setup_nfs took 0.035 mins
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring scratch space for user: sgeadmin
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring passwordless ssh for root
>>> Using existing key: /root/.ssh/id_rsa
>>> Configuring passwordless ssh for sgeadmin
>>> Using existing key: /home/sgeadmin/.ssh/id_rsa
>>> Adding node004 to SGE
ssh.py:382 - ERROR - command 'cd /opt/sge6 && TERM=rxvt ./inst_sge -x -noremote -auto ./ec2_sge.conf' failed with status 1
>>> Done adding nodes.
>>> Sleeping, looping again in 30 seconds.


SOLUTION:

COPIED OVER ec2_sge.conf FROM /opt/sge6-starcluster

cd /opt/sge6
./inst_sge -x -noremote -auto ./ec2_sge.conf


AND MOVED THE /usr/bin SGE BINARIES TO /usr/bin/sge AND REPLACED WITH /opt/sge6/lx24-amd64/bin BINARIES USING ln -s



</entry>
<entry [Fri 2011:06:17 17:50:54 EST] FIXED LOAD BALANCER ERROR - command 'source /etc/profile && qstat -q all.q -u "*" -xml' failed with status 1 BY ADDING -q ARGUMENT>




PROBLEM:

GET ERROR WHEN TRY TO RUN LOAD BALANCER:

sc bal syoung-smallcluster 
StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

cluster.py:577 - WARNING - Not enough settings provided for plugin automount
cluster.py:578 - WARNING - An error occured while loading plugins
cluster.py:579 - WARNING - Not running any plugins
>>> SGELoadBalancer.__init__    XXX queue_name: all.q
ssh.py:382 - ERROR - command 'source /etc/profile && qstat -q all.q -u "*" -xml' failed with status 1
Traceback (most recent call last):


MANUALLY GET SAME ERROR:

source /etc/profile && qstat -q all.q -u "*" -xml


.... BECAUSE IS USING WRONG QUEUE. WORKS OKAY WITH THIS:

<!--

source /etc/profile && qstat -q Project1-Workflow2 -u "*" -xml

    <?xml version='1.0'?>
    <job_info  xmlns:xsd="http://gridengine.sunsource.net/source/browse/*checkout*/gridengine/source/dist/util/resources/schemas/qstat/qstat.xsd?revision=1.11">
      <queue_info>
      </queue_info>
      <job_info>
      </job_info>
    </job_info>

-->


SOLUTION:

REMOVE THE -q queuename ARGUMENT FROM THE balancers/sge/__init__.py SCRIPT:

LINE 420

#            qstat_cmd = 'source /etc/profile && qstat -q ' + self.queue_name + ' -u \"*\" -xml'
            qstat_cmd = 'source /etc/profile && qstat -u \"*\" -xml'


NOW LOAD BALANCER RUNS FINE:

/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 30 -w 100 -s 30 -k 10 
StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

cluster.py:577 - WARNING - Not enough settings provided for plugin automount
cluster.py:578 - WARNING - An error occured while loading plugins
cluster.py:579 - WARNING - Not running any plugins
>>> SGELoadBalancer.__init__    XXX queue_name: all.q
__init__.py:373 - WARNING - wait_time should be >= 300 seconds (it takes ~5 min to launch a new EC2 node)
>>> starcluster.balancers.sge.__init__.get_queued_jobs()
>>> Oldest job is from 2011-06-16 13:17:59. # queued jobs = 1. # hosts = 3.
>>> Avg job duration = 0 sec, Avg wait time = 0 sec.
>>> starcluster.balancers.sge.__init__.get_queued_jobs()
>>> balancers.sge.__init__._eval_add_node    ettc: 3
>>> balancers.sge.__init__._eval_add_node    need_to_add: 0
>>> starcluster.balancers.sge.__init__.get_queued_jobs()
>>> Sleeping, looping again in 30 seconds.


</entry>
<entry [Tue 2011:05:24 05:47:08 EST] RAN jbrowseFeatures.pl>

submit2

submit2() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"syoung-smallcluster","mode":"executeWorkflow","number":"2"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"syoung-smallcluster","mode":"executeWorkflow","number":"2"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }


RUNS THIS:

export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung; /usr/bin/perl /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl --build hg19 --filetype bam --inputdir /nethome/syoung/agua/Project1/Workflow1 --key tophat-1 --label tophat-1 --project Project1 --queue Project1-Workflow1 --species human --username syoung --workflow Workflow1

WHICH RUNS THIS SHELL SCRIPT:

export SGE_CELL=syoung-smallcluster;export SGE_ROOT=/opt/sge6;export SGE_QMASTER_PORT=36251;export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/qsub  -q Project1-Workflow1 /nethome/syoung/agua/Project1/Workflow1/jbrowse/out/scripts/jbrowseFeatures-chr22-out.sh

WHICH RUNS bam-to-json.pl:

cd /nethome/syoung/agua/Project1/Workflow1/jbrowse/out;  /data/apps/jbrowse/1.2.6/bin/bam-to-json.pl  --bam /nethome/syoung/agua/Project1/Workflow1/chr22/out.bam  --tracklabel out  --key out


PROBLEM WITH PerlIO::gzip:

emacs -nw /nethome/syoung/agua/Project1/Workflow1/jbrowse/out/stdout/jbrowseFeatures-chr22-out-stderr.txt

    Can't locate PerlIO/gzip.pm in @INC (@INC contains: /data/apps/jbrowse/1.2.6/bin/../lib /etc/perl /usr/local/lib/perl/5.10.1 /usr/local/share/perl/5.10.1 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10 /usr/local/lib/site_perl .) at /data/apps/jbrowse/1.2.6/bin/../lib/JsonGenerator.pm line 16.
    BEGIN failed--compilation aborted at /data/apps/jbrowse/1.2.6/bin/../lib/JsonGenerator.pm line 16.
    Compilation failed in require at /data/apps/jbrowse/1.2.6/bin/bam-to-json.pl line 10.
    BEGIN failed--compilation aborted at /data/apps/jbrowse/1.2.6/bin/bam-to-json.pl line 10.


ALTHOUGH IT IS AVAILABLE ON THE COMMAND LINE:

perl -e 'use PerlIO::gzip'


WHERE THIS IS MY env PATH:

PATH=/usr/bin:/opt/sge6/bin/lx24-amd64:/opt/sge6/utilbin/lx24-amd64:/agua/bin/apps/logic:/opt/sge6/bin/lx24-amd64/:/opt/sge6/util:/opt/sge6/utilbin/lx24-amd64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/sge6/bin/lx24-amd64

WHICH MATCHES THE env OUTPUT FROM SHELL SCRIPT FOR SGE_O_PATH:

SGE_O_PATH=/usr/bin:/opt/sge6/bin/lx24-amd64:/opt/sge6/utilbin/lx24-amd64:/agua/bin/apps/logic:/opt/sge6/bin/lx24-amd64/:/opt/sge6/util:/opt/sge6/utilbin/lx24-amd64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/sge6/bin/lx24-amd64

BUT THE 'PATH' VARIABLE IN THE SHELL SCRIPT WAS AS FOLLOWS:

PATH=/tmp/682.1.Project1-Workflow1:/usr/local/bin:/bin:/usr/bin:/opt/sge6/bin/lx24-amd64


SO ADDED TO PATH BEFORE COMMAND BUT DIDN'T WORK:

export PATH=/usr/local/lib/perl/5.10.1:$PATH \
export SGE_CELL=syoung-smallcluster;export SGE_ROOT=/opt/sge6;export SGE_QMASTER_PORT=36251;export SGE_EXECD_PORT=36252;/opt/sge6/bin/lx24-amd64/qsub  -q Project1-Workflow1 /nethome/syoung/agua/Project1/Workflow1/jbrowse/out/scripts/jbrowseFeatures-chr22-out.sh


DIDN'T WORK SO ADD AS EXPORT BEFORE bam-to-json.pl COMMAND:


THIS IS THE TOP OF JsonGenerator.pm. ADDED use lib BUT IT HAD NO EFFECT:

    package JsonGenerator;
    
    use base 'Exporter';
    our @EXPORT_OK = qw/ readJSON writeJSON modifyJSFile /;
    
    use strict;
    use warnings;
    
    use lib "/usr/local/lib/perl/5.10.1";
    print `env`;
    
    use NCList;
    use LazyNCList;
    use JSON 2;
    use IO::File;
    use Fcntl ":flock";
    use POSIX qw(ceil floor);
    use List::Util qw(min max sum reduce);
    
    use PerlIO qw(encoding);
    
    use PerlIO::gzip;
    use constant MAX_JSON_DEPTH => 2048;
    ...



INSTALLATION OF PerlIO::gzip IS HERE:

/usr/local/lib/perl/5.10.1/PerlIO/gzip.pm
/usr/local/lib/perl/5.10.1/auto/PerlIO/gzip
/usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/.packlist
/usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.bs
/usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.so


REINSTALLED MANUALLY:

mkdir -p /data/apps/jbrowse/perlmods
cd /data/apps/jbrowse/perlmods
wget http://search.cpan.org/CPAN/authors/id/N/NW/NWCLARK/PerlIO-gzip-0.18.tar.gz

make

    cp gzip.pm blib/lib/PerlIO/gzip.pm
    /usr/bin/perl /usr/share/perl/5.10/ExtUtils/xsubpp  -typemap /usr/share/perl/5.10/ExtUtils/typemap  gzip.xs > gzip.xsc && mv gzip.xsc gzip.c
    cc -c   -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g   -DVERSION=\"0.18\" -DXS_VERSION=\"0.18\" -fPIC "-I/usr/lib/perl/5.10/CORE"   gzip.c
    gzip.xs: In function ‘PerlIOGzip_popped’:
    gzip.xs:870: warning: format ‘%d’ expects type ‘int’, but argument 2 has type ‘IV’
    Running Mkbootstrap for PerlIO::gzip ()
    chmod 644 gzip.bs
    rm -f blib/arch/auto/PerlIO/gzip/gzip.so
    cc  -shared -O2 -g -L/usr/local/lib -fstack-protector gzip.o  -o blib/arch/auto/PerlIO/gzip/gzip.so 	\
           -lz  	\
          
    chmod 755 blib/arch/auto/PerlIO/gzip/gzip.so
    cp gzip.bs blib/arch/auto/PerlIO/gzip/gzip.bs
    chmod 644 blib/arch/auto/PerlIO/gzip/gzip.bs
    Manifying blib/man3/PerlIO::gzip.3pm


make install

    Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
    Installing /usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.so
    Appending installation info to /usr/local/lib/perl/5.10.1/perllocal.pod



BUT DIDN'T WORK. SO IT APPEARS THE INSTALLATION OF PerlIO::gzip IS FINE. THE PROBLEM LIES WITH @INC:

    http://stackoverflow.com/questions/4716918/cant-locate-file-glob-pm-in-inc-inc-contains-d-tools-lib-at-directory-pl
    
    @INC should be set correctly upon installation of Perl. When it doesn't match your configuration, you seem to have messed up something.
    
    However, if the current value of @INC doesn't fit your needs, you have various options:
    
    Add D:\tools\lib\perl\510\ to the environment variable PERL5LIB (or PERLLIB if this doesn't work)
    
    Specify @INC on startup: perl -I D:\tools\lib\perl\510\
    Instead of writing use libname, you can write use path/to/libname
    Using a BEGIN block before the use statements:
    
    BEGIN {
      push @INC,"D:\tools\lib\perl\510\";
    }
    
    
SETTING PERL5LIB AND PERLLIB DIDN'T WORK

NOR DID USING A BEGIN BLOCK:

    BEGIN {
      push @INC, "/usr/local/lib/perl/5.10.1";
    }
    use PerlIO::gzip;



TRIED USING /usr/bin/perl -I /usr/local/lib/perl/5.10.1:



THEN REALISED THAT PerlIO::gzip IS INSTALLED IN THE WRONG DIRECTORY SO IT'S MISSING IT'S COMPANIONS AND PARENT:

locate PerlIO

    /usr/lib/perl/5.10.1/PerlIO
    /usr/lib/perl/5.10.1/PerlIO/encoding.pm
    /usr/lib/perl/5.10.1/PerlIO/scalar.pm
    /usr/lib/perl/5.10.1/PerlIO/via.pm
    /usr/lib/perl/5.10.1/auto/PerlIO
    /usr/lib/perl/5.10.1/auto/PerlIO/encoding
    /usr/lib/perl/5.10.1/auto/PerlIO/scalar
    /usr/lib/perl/5.10.1/auto/PerlIO/via
    /usr/lib/perl/5.10.1/auto/PerlIO/encoding/encoding.so
    /usr/lib/perl/5.10.1/auto/PerlIO/scalar/scalar.so
    /usr/lib/perl/5.10.1/auto/PerlIO/via/via.so
    /usr/local/lib/perl/5.10.1/PerlIO
    /usr/local/lib/perl/5.10.1/PerlIO/gzip.pm
    /usr/local/lib/perl/5.10.1/auto/PerlIO
    /usr/local/lib/perl/5.10.1/auto/PerlIO/gzip
    /usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/.packlist
    /usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.bs
    /usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.so


SO REINSTALLED MANUALLY USING PREFIX

cd /data/apps/jbrowse/perlmods

perl Makefile.PL PREFIX=/usr
Writing Makefile for PerlIO::gzip
make
make install
..

locate PerlIO
    /usr/lib/perl/5.10.1/PerlIO
    /usr/lib/perl/5.10.1/PerlIO/encoding.pm
    /usr/lib/perl/5.10.1/PerlIO/gzip.pm
    /usr/lib/perl/5.10.1/PerlIO/scalar.pm
    /usr/lib/perl/5.10.1/PerlIO/via.pm
    /usr/lib/perl/5.10.1/auto/PerlIO
    /usr/lib/perl/5.10.1/auto/PerlIO/encoding
    /usr/lib/perl/5.10.1/auto/PerlIO/gzip
    /usr/lib/perl/5.10.1/auto/PerlIO/scalar
    /usr/lib/perl/5.10.1/auto/PerlIO/via
    /usr/lib/perl/5.10.1/auto/PerlIO/encoding/encoding.so
    /usr/lib/perl/5.10.1/auto/PerlIO/gzip/.packlist
    /usr/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.bs
    /usr/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.so
    /usr/lib/perl/5.10.1/auto/PerlIO/scalar/scalar.so
    /usr/lib/perl/5.10.1/auto/PerlIO/via/via.so


AND REMOVED THE INSTALLATION IN THE WRONG LOCATION:


rm -fr /usr/lib/perl/lib/perl/5.10.1/PerlIO
rm -fr /usr/lib/perl/lib/perl/5.10.1/PerlIO/gzip.pm
rm -fr /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO
rm -fr /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO/gzip
rm -fr /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO/gzip/.packlist
rm -fr /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.bs
rm -fr /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.so
rm -fr /usr/local/lib/perl/5.10.1/PerlIO
rm -fr /usr/local/lib/perl/5.10.1/PerlIO/gzip.pm
rm -fr /usr/local/lib/perl/5.10.1/auto/PerlIO
rm -fr /usr/local/lib/perl/5.10.1/auto/PerlIO/gzip
rm -fr /usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/.packlist
rm -fr /usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.bs
rm -fr /usr/local/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.so

NB: INSTALLED TO WRONG PATH WHEN USED PREFIX=/usr/lib/perl -- MUST USE PREFIX=/usr

    /usr/lib/perl/lib/perl/5.10.1/PerlIO
    /usr/lib/perl/lib/perl/5.10.1/PerlIO/gzip.pm
    /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO
    /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO/gzip
    /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO/gzip/.packlist
    /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.bs
    /usr/lib/perl/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.so

BUT STILL DIDN'T WORK SO TRIED INSTALLING AN EARLIER VERSION OF PerlIO::gzip

mkdir -p /data/apps/jbrowse/perlmods
cd /data/apps/jbrowse/perlmods
wget http://search.cpan.org/CPAN/authors/id/N/NW/NWCLARK/PerlIO-gzip-0.18.tar.gz


SO PRINTED OUT @INC FROM RUNNING SHELL SCRIPT:
echo `perl -e 'print join "\n", @INC'`

    /etc/perl
    /usr/local/lib/perl/5.10.1
    /usr/local/share/perl/5.10.1
    /usr/lib/perl5
    /usr/share/perl5
    /usr/lib/perl/5.10
    /usr/share/perl/5.10
    /usr/local/lib/site_perl


AND PRINTED OUT @INC FROM JsonGenerator:
print "\@INC:\n";
print join "\n", @INC;

    @INC:
    /data/apps/jbrowse/1.2.6/bin/../lib
    /usr/local/lib/perl/5.10.1
    /usr/lib/perl/5.10.1
    /etc/perl
    /usr/local/share/perl/5.10.1
    /usr/lib/perl5
    /usr/share/perl5
    /usr/lib/perl/5.10
    /usr/share/perl/5.10
    /usr/local/lib/site_perl



SO MOVED FROM 8e TO HP FOR A CLOSER LOOK:

ON 8e:

cd /nethome/syoung/agua/Project1
scp -r -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius root@ec2-174-129-137-49.compute-1.amazonaws.com:/nethome/syoung/agua/Project1/test ./

export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung;

/usr/bin/perl /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl --build hg19 --filename out.bam --filetype bam --inputdir /nethome/syoung/agua/Project1/Workflow1 --key tophat-1 --label tophat-1 --project Project1 --queue Project1-Workflow1 --species human --username syoung --workflow Workflow1


ON HP:

export SGE_QMASTER_PORT=6444; \
export SGE_EXECD_PORT=6445; \
export SGE_ROOT=/var/lib/gridengine; \
export SGE_CELL=default; \
export USERNAME=syoung; \
 /usr/bin/perl /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl  \
--build hg19  \
--filename out.bam  \
--filetype bam  \
--inputdir /nethome/syoung/agua/Project1/Workflow1  \
--key tophat-1  \
--label tophat-1  \
--project Project1  \
--queue default  \
--species human  \
--username syoung  \
--workflow Workflow1  \
--qsub /var/lib/gridengine/bin/lx24-amd64/qsub



ON HP, INSTALLED PerlIO::gzip MANUALLY WITH /usr PREFIX:

mkdir -p /data/apps/jbrowse/perlmods
cd /data/apps/jbrowse/perlmods
wget http://search.cpan.org/CPAN/authors/id/N/NW/NWCLARK/PerlIO-gzip-0.18.tar.gz
perl Makefile.PL PREFIX=/usr
make
make install

    Installing /usr/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.bs
    Installing /usr/lib/perl/5.10.1/auto/PerlIO/gzip/gzip.so
    Installing /usr/lib/perl/5.10.1/PerlIO/gzip.pm

FIXED PROBLEM WITH jf.sh NOT FINDING PerlIO::gzip!!!!


ON HP, INSTALLED SAMTOOLS 0.1.16 AND Bio::DB::Sam 1.28

SEE apps.samtools
[Wed 2011:05:25 01:16:17 EST] INSTALLED SAMTOOLS 0.1.16 AND Bio::DB::Sam 1.28 ON HP
    

AND SOLVED ALL THE PROBLEMS. THESE COMMANDS IN THE SHELL SCRIPT:

echo `perl -e 'print join "\n", @INC'`
echo `perl -e 'use lib "/usr/lib/perl/5.10.1"; use Bio::DB::SeqFeature'`
echo `perl -e 'use Bio::DB::Sam'`
echo `perl -e 'use PerlIO::gzip'`


... GAVE THIS RESULT;

    Wed May 25 01:44:42 EDT 2011
    /etc/perl /usr/local/lib/perl/5.10.1 /usr/local/share/perl/5.10.1 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10 /usr/local/lib/site_perl .
    
    Can't open perl script "/data/apps/jbrowse/1.2.1/bin/bam-to-json.pl": No such file or directory



export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung; /usr/bin/perl /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl --build hg19 --filetype bam --inputdir /nethome/syoung/agua/Project1/Workflow1 --key tophat-1 --label tophat-1 --species human --username syoung --project Project1 --workflow Workflow1



export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung; /usr/bin/perl /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl --build hg19 --filetype bam --inputdir /nethome/syoung/agua/Project1/Workflow1 --key tophat-1 --label tophat-1 --project Project1 --species human --username syoung --workflow Workflow1




TESTING SUBMIT jbrowseFeatures.pl

export SGE_QMASTER_PORT=701; export SGE_EXECD_PORT=702; export SGE_ROOT=/var/lib/gridengine; export SGE_CELL=; export USERNAME=syoung; /usr/bin/perl /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl --build hg19 --filetype bam --inputdir /nethome/syoung/agua/Project1/Workflow1 --key tophat-1 --label tophat-1 --project Project1 --species human --username syoung --workflow Workflow1


jbrowseFeatures.pl    speciesdir: /data/sequence/human
jbrowseFeatures.pl    refseqfile: /data/sequence/human/hg19/jbrowse/refSeqs.js
jbrowseFeatures.pl    Can't find refseqfile: /data/sequence/human/hg19/jbrowse/refSeqs.js


START WORKFLOW

export USERNAME=syoung; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; /usr/bin/perl /agua/0.6/bin/apps/expression/TOPHAT.pl --cpus 1 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --keep --label yoruba --matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt --maxjobs 100 --outputdir /nethome/syoung/agua/Project1/Workflow1 --queue Project1-Workflow1 --reads 200000 --reference /nethome/syoung/agua/Project1/Workflow1/chr22 --species human


STOP WORKFLOW

stopWorkflow () { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"stopWorkflow","number":"1"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"stopWorkflow","number":"1"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }




var cluster = "syoung-smallcluster";
var username = "syoung";
var regex = username + "-";
cluster = cluster.replace(regex, '');
console.log("cluster: " + cluster);

		var workflow = Agua.widgets["workflow"][0];
		console.log("agua.html    workflow: " + workflow);
		var runStatus = workflow.core.runStatus;
		console.log("agua.html    runStatus: " + runStatus);


>>> Restarting SGE qmaster and execd daemons
>>> /bin/ps aux | grep sgeadmin | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID &> /dev/null
>>> Enabling job scheduling info
changed scheduler configuration
>>> Adding 'threaded' parallel environment
ssh.py:382 - ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/qconf -Ap /tmp/pe.txt &> /tmp/pe.out' failed with status 1
>>> Adding head node to submit hosts and admin hosts lists
>>> Add master to @allhosts group
>>> sge.addToAllhosts    command: /opt/sge6/bin/lx24-amd64/qconf -aattr hostgroup hostlist master @allhosts >> /tmp/allhosts.out; 
>>> Add node001 to @allhosts group




>>> Adding node002 to SGE
ssh.py:382 - ERROR - command 'cd /opt/sge6 && TERM=rxvt ./inst_sge -x -noremote -auto ./ec2_sge.conf' failed with status 1
>>> Done adding nodes.




export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; /usr/bin/perl /agua/0.6/bin/apps/expression/TOPHAT.pl --cpus 1 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --keep --label yoruba --matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt --maxjobs 100 --outputdir /nethome/syoung/agua/Project1/Workflow1 --queue Project1-Workflow1 --reads 200000 --reference /nethome/syoung/agua/Project1/Workflow1/chr22 --species human --username syoung --cluster syoung-smallcluster


export SGE_CELL=syoung-smallcluster;export SGE_ROOT=/opt/sge6;export SGE_QMASTER_PORT=36251;export SGE_EXECD_PORT=36252;



export SGE_CELL=syoung-smallcluster;export SGE_ROOT=/opt/sge6;export SGE_QMASTER_PORT=36251;export SGE_EXECD_PORT=36252;/opt/sge6/bin/lx24-amd64/qsub  -q Project1-Workflow1 /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh

    
</entry>
<entry [Tue 2011:05:24 02:22:04 EST] COPIED TEMPLATE refSeqs.js FILE TO /data/sequence/human/hg19/jbrowse/refSeqs.js>


ON 8e:

mkdir -p /data/sequence/human/hg19/jbrowse
cp /data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/data/refSeqs.js \
/data/sequence/human/hg19/jbrowse/refSeqs.js


ON HP:
mkdir -p /data/sequence/human/hg19/jbrowse/

cp /home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/data/refSeqs.js \
/data/sequence/human/hg19/jbrowse/refSeqs.js

cd /data/sequence/human/hg19/jbrowse/

</entry>

