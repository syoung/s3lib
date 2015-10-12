starcluster.archive.5

<entry [Tue 2011:05:24 01:20:49 EST] MIXED NODE FUNCTIONALITY IN STARCLUSTER>

[Starcluster] Cluster with mixed NODE_INSTANCE_TYPE's

Justin Riley jtriley at MIT.EDU 
Mon Aug 9 16:39:56 EDT 2010
Previous message: [Starcluster] Cluster with mixed NODE_INSTANCE_TYPE's
Next message: [Starcluster] Cluster with mixed NODE_INSTANCE_TYPE's
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
Hi Jay,

Since you're just wanting a single m2.xlarge instance and 4 c1.xlarge instances you could do the following:

[cluster mycluster]
cluster_size = 5
master_instance_type = m2.xlarge
node_instance_type = c1.xlarge
....

This template will use the m2.xlarge type to launch the master, and the c1.xlarge type for the 4 worker nodes.

We do have support for even more fine grained control of node instance types (thanks to Dan Yamins) if it's needed, however, I haven't yet documented this functionality. Let me know if the above doesn't meet your needs and I'll fill you in.

~Justin    
    
</entry>

<entry [Mon 2011:05:23 00:15:32 EST] CHANGED TIME ZONE ON 8e TO EST>

cat /etc/timezone
    
    Etc/UTC

echo "America/New_York" | sudo tee /etc/timezone

    America/New_York
    
    
sudo dpkg-reconfigure --frontend noninteractive tzdata
    
    Current default time zone: 'America/New_York'
    Local time is now:      Mon May 23 00:45:24 EDT 2011.
    Universal Time is now:  Mon May 23 04:45:24 UTC 2011.



LATER: CHECK TO MAKE SURE THAT IMAGES LAUNCHED IN DIFFERENT TIMEZONES HAVE THE CORRECT TIME


NOTE: DON'T HAVE TO USE Date.getTimezoneOffset() TO OFFSET GMT

    var currentDate = new Date();
    var offset = currentDate.getTimezoneOffset()/60;



</entry>
<entry [Sat 2011:05:21 21:32:40 EST] FIX Agua::Monitor::SGE RECOGNITION OF 'error: commlib error'>

PROBLEM:

qstat TIMES OUT AND GIVES THIS ERROR:

error: commlib error: access denied (client IP resolved to host name "ip-10-126-35-154.ec2.internal". This is not identical to clients host name "master")
error: unable to send message to qmaster using port 36251 on host "master": got send error

Agua::Monitor::SGE WILL LIKELY NEVER SEE THE ERROR MESSAGE

DIAGNOSIS:


http://markmail.org/message/w5wpdhfktq2ogrc3#query:error%3A%20commlib%20error%3A%20access%20denied%20(client%20IP%20resolved%20to%20host%20name%20This%20is%20not%20identical%20to%20clients%20host%20name%20%3A%20unable%20to%20send%20message%20got%20send%20error+page:1+mid:w5wpdhfktq2ogrc3+state:results
Found the problem, not SGE related ...

Apparently the remote compute nodes are not attached to the qmaster  
via a simple private network switch. There is some sort of clever  
router or device in the middle that is masquerading or NAT'ing the  
traffic from the nodes back to the qmaster.

The symptoms described below are caused by traffic coming into the  
qmaster with a different source IP address than what the compute nodes  
are actually configured with. DNS for the proper IPs is of course  
totally correct but there is no DNS or /etc/hosts entry for the IP the  
traffic is actually appearing to come from.

This explains all the odd behavior described below ...



SOLUTION:

CHANGE /etc/hosts ON MASTER FROM THIS:

10.86.193.30 ip-10-86-193-30.ec2.internal ip-10-86-193-30 node001
10.126.35.154 master

TO THIS:

10.86.193.30 ip-10-86-193-30.ec2.internal ip-10-86-193-30 node001
10.126.35.154 ip-10-126-35-154.ec2.internal ip-10-126-35-154 master


AND FOR THE RELATED ERROR:

export SGE_CELL=syoung-smallcluster;export SGE_ROOT=/opt/sge6;export SGE_QMASTER_PORT=36251;export SGE_EXECD_PORT=36252;/opt/sge6/bin/lx24-amd64/qsub  -q Project1-Workflow1 /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh
error: commlib error: access denied (server host resolves destination host "ip-10-126-35-154.ec2.internal" as "master")
Unable to run job: unable to contact qmaster using port 36251 on host "10.126.35.154".
Exiting.

... WHERE MASTER WAS CORRECTLY IDENTIFIED IN act_qmaster ON 8e:

root@ip-10-122-13-145:/nethome/syoung/agua/Project1/Workflow1/chr22# cat /opt/sge6/syoung-smallcluster/common/act_qmaster
10.126.35.154
root@ip-10-122-13-145:/nethome/syoung/agua/Project1/Workflow1/chr22# cat /etc/hosts
127.0.0.1 localhost


I ADDED THIS LINE TO /etc/hosts ON 8e:

10.126.35.154 master ip-10-126-35-154.ec2.internal ip-10-126-35-154 master

TO MAKE IT:

    # The following lines are desirable for IPv6 capable hosts
    ::1 ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    ff02::3 ip6-allhosts
    #10.86.250.251 ip-10-86-250-251.ec2.internal ip-10-86-250-251 master
    #10.86.193.30 ip-10-86-193-30.ec2.internal ip-10-86-193-30 node001
    10.126.35.154 master ip-10-126-35-154.ec2.internal ip-10-126-35-154 master

THEN THE JOB SUBMITTED OKAY:

export SGE_CELL=syoung-smallcluster;export SGE_ROOT=/opt/sge6;export SGE_QMASTER_PORT=36251;export SGE_EXECD_PORT=36252;/opt/sge6/bin/lx24-amd64/qsub -t 1-5:1 -q Project1-Workflow1 /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh

    Your job 39 ("tophatBatchAlignment-chr22") has been submitted






    
</entry>
<entry [Fri 2011:05:20 11:08:04 EST] FIX AUTOMOUNT - AUTOMATIC RENAME OF HEAD IP IF CHANGED (E.G., STOP/START LOSS OF ORIGINAL IP ADDRESS)>
    
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
shell

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

 
    
    
    
    
</entry>
<entry [Thu 2011:05:19 13:49:49 EST] DOING Stage::runLocally>

 select * from app where name='sleep'\G
*************************** 1. row ***************************
      owner: syoung
       name: sleep
       type: test
   location: /nethome/syoung/agua/Project1/test/test.sh
  localonly: 0
   executor: /bin/sh
    version: 0.1
description: Run test.pl to sleep and print to stdout file
      notes: Notes
1 row in set (0.01 sec)

select * from stage where username='syoung' and project='Project1' and workflow ='Workflow2'\G
*************************** 1. row ***************************
        username: syoung
           owner: admin
         project: Project1
        workflow: Workflow2
  workflownumber: 8
            name: sleep
          number: 1
            type: test
        location: /nethome/syoung/agua/Project1/test/test.sh
        executor: /bin/sh
         cluster: 
          submit: NULL
      stderrfile: NULL
      stdoutfile: NULL
          queued: NULL
         started: NULL
       completed: NULL
     workflowpid: NULL
        stagepid: NULL
      stagejobid: NULL
          status: NULL
       stagename: NULL
stagedescription: NULL
      stagenotes: NULL


sleeper () { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow2","workflownumber":"1","cluster":"syoung\
-smallcluster","submit":"0","mode":"executeWorkflow","number":"1"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","wo\
rkflow":"Workflow2","workflownumber":"1","cluster":"syoung-smallcluster","submit":"0","mode":"executeWorkflow","number":"1"}' |/var/www/cgi-bin/agua/0.6/w\
orkflow.cgi; }
    
    
gua::StarCluster::setQueue    queuefile: /nethome/admin/agua/.sge/conf/queue-Project1-Workflow2.conf
Agua::Common::SGE::createQueuefile    queuefiledir: /nethome/admin/agua/.sge/conf
Agua::Common::SGE::setQueuefileContents    queue: Project1-Workflow2
Agua::Common::SGE::addQueue    add: export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; qconf -Aq /nethome/admin/agua/.sge/conf/queue-Project1-Workflow2.conf
root@ip-10-87-1-167.ec2.internal added "Project1-Workflow2" to cluster queue list
Agua::Workflow::setStages    Agua::Workflow::setStages(json)
{ error: 'Agua::Workflow::setStages    stages not defined for username: syoung' }root@ip-10-87-1-167:/nethome/syoung/agua/Project1/Workflow1# 



</entry>

<entry [Mon 2011:05:16 15:05:24 EST] PROBLEM: bal IS USING NUMBER OF JOBS INSTEAD OF NUMBER OF TASKS TO DECIDE ON ADDING NODES>

>>> Oldest job is from 2011-05-16 18:29:02. # queued jobs = 1. # hosts = 2.
>>> Avg job duration = 949 sec, Avg wait time = 719 sec.
>>> starcluster.balancers.sge.__init__.get_queued_jobs()
>>> starcluster.balancers.sge.__init__.get_queued_jobs    j: {'tasks': u'3', 'job_state': u'running', 'queue_name': u'Project1-Workflow1@node001', 'JB_job_number': u'7', 'state': u'r', 'slots': u'1'}
>>> starcluster.balancers.sge.__init__.get_queued_jobs    j: {'tasks': u'4,5', 'job_state': u'pending', 'JB_job_number': u'7', 'JB_submission_time': u'2011-05-16T18:29:02', 'state': u'qw', 'slots': u'1'}
>>> starcluster.balancers.sge.__init__.get_queued_jobs    queued: [{'tasks': u'4,5', 'job_state': u'pending', 'JB_job_number': u'7', 'JB_submission_time': u'2011-05-16T18:29:02', 'state': u'qw', 'slots': u'1'}]



    
</entry>
<entry [Mon 2011:05:16 13:41:20 EST] FIXED: bal WAS ONLY CHECKING FOR JOBS IN THE all.q QUEUE>
    
SOLUTION:

1. CHANGED starcluster/balancers/sge/__init__.py:

    #def __init__(self, interval=60, plot=False, max_nodes=5, wait_time=900,
    #             add_pi=1, kill_after=45, stab=180, lookback_win=3,
    #             min_nodes=1):
    def __init__(self, interval=60, plot=False, max_nodes=5, wait_time=900,
                 add_pi=1, kill_after=45, stab=180, lookback_win=3,
                 min_nodes=1, queue_name="all.q"):

2. ADDED TO starcluster/balancers/commands/loadbalance.py:

        parser.add_option("-q", "--queue_name", dest="queue_name",
                          action="store", type="str", default=None,
                          help="Name of the queue (default: all.q)")
                          
                          
3. CALL bal WITH THE EXTRA --queue_name ARGUMENT

cd /nethome/admin/.starcluster/plugins
envars
/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 30 -w 100 -s 30 -k 10 --queue_name Project1-Workflow1


</entry>
<entry [Mon 2011:05:16 05:03:35 EST] FIXED 'commlib error: access denied (client IP resolved to host name ...'>

source /etc/profile && qstat -q Project1-Workflow1 -u "*" -xml
error: commlib error: access denied (client IP resolved to host name "ip-10-120-65-10.ec2.internal". This is not identical to clients host name "master")
error: unable to send message to qmaster using port 36251 on host "master": got send error
root@master:~# hostname ip-10-120-65-10.ec2.internal
root@master:~# source /etc/profile && qstat -q Project1-Workflow1 -u "*" -xml
error: denied: host "ip-10-120-65-10.ec2.internal" is neither submit nor admin host
root@master:~# hostname ip-10-120-65-10
root@master:~# source /etc/profile && qstat -q Project1-Workflow1 -u "*" -xml
error: denied: host "ip-10-120-65-10.ec2.internal" is neither submit nor admin host
root@master:~# hostname master


SOLUTION:

WAIT IT OUT



>>> Done adding nodes.
>>> Sleeping, looping again in 30 seconds.

ssh.py:382 - ERROR - command 'source /etc/profile && qstat -q Project1-Workflow1 -u "*" -xml' failed with status 1
Traceback (most recent call last):
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/cli.py", line 160, in main
    sc.execute(args)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/commands/loadbalance.py", line 59, in execute
    lb.run(cluster)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 467, in run
    if self.get_stats() == -1:
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 426, in get_stats
    self.stat.parse_qstat(qstatXml)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 74, in parse_qstat
    doc = xml.dom.minidom.parseString(string)
  File "/usr/lib/python2.6/xml/dom/minidom.py", line 1928, in parseString
    return expatbuilder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 940, in parseString
    return builder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 223, in parseString
    parser.Parse(string, True)
ExpatError: syntax error: line 1, column 0

cli.py:129 - ERROR - Oops! Looks like you've found a bug in StarCluster
cli.py:130 - ERROR - Debug file written to: /tmp/starcluster-debug-root.log
cli.py:131 - ERROR - Look for lines starting with PID: 18757
cli.py:132 - ERROR - Please submit this file, minus any private information,
cli.py:133 - ERROR - to starcluster@mit.edu

</entry>
<entry [Mon 2011:05:16 03:19:53 EST] 'Project1-Workflow1' RUNNING - TESTED WITH bal>
envars
cd /nethome/admin/.starcluster/plugins

/data/starcluster/0.91-316/bin/starcluster \
-c  /nethome/admin/.starcluster/syoung-smallcluster.config \
bal syoung-smallcluster \
-m 5 -n 1 -i 30 -w 100 -s 30 -k 10

PROBLEM:

'Not enough settings provided for plugin sge'

    >>> Loaded plugin: automount.NfsShares
    cluster.py:575 - WARNING - Not enough settings provided for plugin sge
    cluster.py:576 - WARNING - An error occured while loading plugins
    cluster.py:577 - WARNING - Not running any plugins
    __init__.py:353 - WARNING - wait_time should be >= 300 seconds (it takes ~5 min to launch a new EC2 node)

>>> cluster.load_receipt    cluster_settings: {'_zone': u'us-east-1a', 'disable_queue': False, 'node_instance_types': [], 'cluster_shell': 'bash', 'volumes': {}, 'availability_zone': 'us-east-1a', '_plugins': [{'mountpoints': '/agua,/data,/nethome', 'setup_class': 'automount.NfsShares', 'interval': '30', 'devices': '/dev/sdh,/dev/sdi', 'sourcedirs': '/agua,/data,/nethome', 'cluster': 'syoung-smallcluster', 'nfsport': '2049', 'mountdport': '32767', 'portmapport': '111', '__name__': 'automount', 'head_ip': '10.124.163.223'},

{
'setup_class': 'sge.CreateCell',
'qmasterport': '36251',
'cell': 'syoung-smallcluster',
'__name__': 'sge',
'execdport': '36252',
'slots': '1',
'root': '/opt/sge6',
'head_ip': '10.124.163.223'}],


'cluster_description': 'Cluster requested at 201105150916', 'master_instance_type': 't1.micro', 'cluster_user': 'sgeadmin', 'disable_threads': False, 'node_instance_type': 't1.micro', 'cluster_tag': 'syoung-smallcluster', 'cluster_size': 1, 'node_image_id': 'ami-8e827ce7', 'keyname': 'id_rsa-admin-key', 'refresh_interval': 30, 'permissions': []}
>>> Loaded plugin: automount.NfsShares
cluster.py:577 - WARNING - Not enough settings provided for plugin sge
cluster.py:578 - WARNING - An error occured while loading plugins
cluster.py:579 - WARNING - Not running any plugins
__init__.py:353 - WARNING - wait_time should be >= 300 seconds (it takes ~5 min to launch a new EC2 node)
^C^X^CInterrupted, exiting.


SOLUTION:

FIXED BY RESTARTING CLUSTER (DID NOT HAVE head_long_ip ARGUMENT WHEN IT WAS STARTED)



oot@master:~# source /etc/profile && qstat -q Project1-Workflow1 -u "*" -xml
error: commlib error: access denied (client IP resolved to host name "ip-10-120-65-10.ec2.internal". This is not identical to clients host name "master")
error: unable to send message to qmaster using port 36251 on host "master": got send error
root@master:~# hostname ip-10-120-65-10.ec2.internal
root@master:~# source /etc/profile && qstat -q Project1-Workflow1 -u "*" -xml



TESTED PLUGIN sge.py IN SHELL:

cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
shell

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')

reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')



cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

    
</entry>
<entry [Mon 2011:05:16 03:13:44 EST] MAKE SURE CLUSTER IS STOPPED WHEN ALL JOBS ARE FINISHED>

USE clusterstatus TO DETERMINE IF ANY QUEUES ARE USING THE CLUSTER    


</entry>
<entry [Mon 2011:05:16 02:39:00 EST] REMOVED all.q QUEUE>

root@ip-10-87-1-167:~# qconf -dq all.q
root@ip-10-87-1-167.ec2.internal removed "all.q" from cluster queue list


</entry>

<entry [Mon 2011:05:16 02:05:44 EST] FIX --clean ARGUMENT NOT APPEARING IN COMMAND>

select name, valuetype, value from stageparameter where username='syoung' and project='Project1' and workflow='Workflow1';
+------------+-----------+-------------------------------------------------------+
| name       | valuetype | value                                                 |
+------------+-----------+-------------------------------------------------------+
| dbfile     | file      | Project1/Workflow1/chr22/out.dbl                      |
| samfiles   | files     | Project1/Workflow1/chr22/out.sam                      |
| clean      | flag      |                                                       |
| coverage   | file      | Project1/Workflow1/coverage.wig                       |
| cpus       | integer   | 1                                                     |
| distance   | integer   | 200                                                   |
| hits       | file      | Project1/Workflow1/accepted_hits.sam                  |
| inputfiles | file      | Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt  |
| jobs       | integer   |                                                       |
| junctions  | file      | Project1/Workflow1/junctions.bed                      |
| keep       | flag      |                                                       |
| label      | string    | yoruba                                                |
| matefiles  | file      | Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt  |
| outputdir  | directory | Project1/Workflow1                                    |
| params     | string    |                                                       |
| queue      | string    | Project1-Workflow1                                    |
| reads      | integer   | 200000                                                |
| reference  | directory | Project1/Workflow1/chr22                              |
| species    | string    | human                                                 |
+------------+-----------+-------------------------------------------------------+


/usr/bin/perl /agua/0.6/bin/apps/expression/TOPHAT.pl \
--cpus 1 \
--distance 200 \
--inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt \
--label yoruba \
--matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt  \
--outputdir /nethome/syoung/agua/Project1/Workflow1 \
--queue Project1-Workflow1 \
--reads 200000 \
--reference /nethome/syoung/agua/Project1/Workflow1/chr22 \
--species human


FIXED IN Agua::Stage

    OK
    


</entry>
<entry [Mon 2011:05:16 01:58:58 EST] FIX USAGE TO SGE FORMAT USING 'qacct -j'>

qacct -j 21
==============================================================
qname        Project1-Workflow1  
hostname     master              
group        root                
owner        root                
project      NONE                
department   defaultdepartment   
jobname      Project1-1-Workflow1-1
jobnumber    21                  
taskid       undefined
account      sge                 
priority     0                   
qsub_time    Mon May 16 05:08:59 2011
start_time   Mon May 16 05:09:02 2011
end_time     Mon May 16 05:09:41 2011
granted_pe   NONE                
slots        1                   
failed       100 : assumedly after job
exit_status  137                 
ru_wallclock 39           
ru_utime     0.000        
ru_stime     0.000        
ru_maxrss    1340                
ru_ixrss     0                   
ru_ismrss    0                   
ru_idrss     0                   
ru_isrss     0                   
ru_minflt    1780                
ru_majflt    0                   
ru_nswap     0                   
ru_inblock   0                   
ru_oublock   40                  
ru_msgsnd    0                   
ru_msgrcv    0                   
ru_nsignals  0                   
ru_nvcsw     38                  
ru_nivcsw    4                   
cpu          3.480        
mem          0.157             
io           0.002             
iow          0.000             
maxvmem      79.340M
arid         undefined

    
</entry>
<entry [Mon 2011:05:16 00:25:35 EST] FIX WALLTIME NOT DEFINED ON submit>

PROBLEM:

#!/bin/sh

export TASKNUM=$(expr $SGE_TASK_ID)

#$ -N Project1-1-Workflow1-1
#$ -o /nethome/syoung/agua/Project1/Workflow1//stdout/Project1-1-Workflow1-1-stdout.txt
#$ -e /nethome/syoung/agua/Project1/Workflow1//stdout/Project1-1-Workflow1-1-stderr.txt
#$ -q Project1-Workflow1
#$ -l h_rt=:00:00


ADDED WALLTIME VARIABLE TO TOPHAT.pm

# INTS
has 'walltime'	=> ( isa => 'Int|Undef', is => 'rw', default => 24 );


NB: ALSO ADDED 'clean' FLAG SO THAT SPLITFILE WILL BE REWRITTEN WITH reads VALUE OF 200,000

    
</entry>

<entry [Sun 2011:05:15 23:54:17 EST] ADJUST np_load_avg UPWARDS TO AVOID QUEUE 'is overloaded' ERROR>

PROBLEM:

usage    1:                 cpu=00:00:00, mem=0.00000 GBs, io=0.00000, vmem=N/A, maxvmem=N/A
scheduling info:            queue instance "Project1-Workflow1@master" dropped because it is full
                            queue instance "all.q@master" dropped because it is overloaded: np_load_avg=1.960000 (= 1.460000 + 0.50 * 1.000000 with nproc=1) >= 1.75



SOLUTION:

INCREASE np_load_avg IN QUEUE AT OUTSET, I.E., IN Agua::Common::SGE, SET np_load_avg TO 20:

Agua::Common::SGE::setQueuefileContents

	qname                 $queue
	hostlist              \@allhosts
	seq_no                0
	load_thresholds       np_load_avg=20
	suspend_thresholds    NONE


OR DO IT MANUALLY:

qconf -mq Project1-Workflow1

CHANGE FROM: 

load_thresholds       np_load_avg=1.75

TO:

load_thresholds       np_load_avg=20


NOTES
-----

http://markmail.org/message/rdg7xkpesj7zzqij

np_load_avg is the system load normalized by CPU count. It is an  
attempt by SGE to arrive at a figure for "how busy" any given system  
is (regardless of CPU count) and it allows the scheduler to make  
better load-based scheduling decisions in clusters where you may have  
machines of varying size and power.

The load_avg is just the pure measurement without any adjustments or  
normalizations made.

In machines of differing size you would not really be able to make a  
pure side-by-side comparison or sort based on load_avg figures. You  
can, however, use the np_load_avg value as a pretty fair metric of how  
much work a system is doing.

For this reason, np_load_avg is the figure I usually adjust when  
needed (rarely as the default values is usually good for me).

You should probably leave the numbers alone unless there is a specific  
problem you are trying to fix:

  - If your machines are constantly entering load alarm ('a') state  
and you think SGE is being too conservative with protecting the nodes.  
In this case you would raise the value of np_load_avg so that the  
machines can take on more "work" before nearing any sort of load  
threshold that would trigger the "a" alarm state

- If your slot count is high enough that your machines are really  
stressing and thrashing around when all their local job slots are  
full. In this case you would lower the value of np_load_avg so that  
SGE will close the node off to new work (generating an 'a' alarm  
state) when things get too busy (regardless if there are job slots  
free on the queue instance or not)



job_load_adjustments
http://comments.gmane.org/gmane.comp.clustering.gridengine.users/19661
By default, Grid Engine is set with job_load_adjustments as np_load_avg=0.5.  That means that for every job placed on a node, Grid Engine adds 0.5 to that host's np_load_avg virtually.  That load decays over time (7.5 minutes by default).  The idea is that jobs tend to ramp 
up their resource usage (CPU in this case) over time.  Instead of making scheduling decisions based on the jobs' initial resource usage, we add the virtual load to give them a little buffer space.  The net is that Grid Engine doesn't pack jobs in as tightly as you might at first expect.


</entry>
<entry [Sun 2011:05:15 22:34:01 EST] ENABLED AUTOMATIC SCHEDULING INFORMATION>

FOR EACH NEW CELL, MAKE THIS:

qstat -j 8
    ...
    scheduling info:            (Collecting of scheduler job information is turned off)
    ...
    
BECOME THIS:


1. SET ENVARS 

2. GET INFO WITH qconf -ssconf

    qconf -ssconf
    algorithm                         default
    schedule_interval                 0:0:15
    maxujobs                          0
    queue_sort_method                 load
    job_load_adjustments              np_load_avg=0.50
    load_adjustment_decay_time        0:7:30
    load_formula                      np_load_avg
    schedd_job_info                   false
    flush_submit_sec                  0
    flush_finish_sec                  0
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


3. SET JOB SCHEDULER INFO TO TRUE: 
    schedd_job_info                   true


4. WRITE TO FILE AND LOAD USING

qconf -Msconf filename


5. RESTART QMASTER
/etc/init.d/sgemaster.starcluster stop   

    
</entry>
<entry [Sun 2011:05:15 17:37:00 EST] FIXED submit ERROR DIFFERENT HOSTNAMES>

SOLUTION

SET HOSTNAME ON HEAD IN sge.py USING LONG INTERNAL HOST IP, E.G.:

ip-10-87-1-167.ec2.internal


PROBLEM:

Agua::Monitor::SGE::submitJob   command: export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_ROOT=/opt/sge6; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/qsub  -q Project1-Workflow1 /nethome/syoung/agua/Project1/Workflow1//scripts/Project1-1-Workflow1-1.sh
error: commlib error: access denied (client IP resolved to host name "ip-10-87-1-167.ec2.internal". This is not identical to clients host name "ip-10-124-231-156.ec2.internal")
Unable to run job: unable to contact qmaster using port 36251 on host "10.253.137.40".
Exiting.
    
</entry>
<entry [Sun 2011:05:15 14:26:12 EST] FIX automount.py FAILURE TO MOUNT /agua>

CONFIRMED AUTOMOUNT OF /agua, /data AND /nethome FUNCTIONING CORRECTLY NOW.
CONFIRMED sge.py WORKS CORRECTLY.

# START SHELL 
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
shell

# SGE

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')

reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')
    
    OK
    
AUTOMOUNT

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

    OK

    
</entry>
<entry [Sun 2011:05:15 00:59:05 EST] FIXED PROBLEM RUNNING STARCLUSTER WITH ami-38847a51 aquarius-8-cluster.3>

**** WON'T COMPLETE BOOT:
    >>> Waiting for all nodes to be in a 'running' state...
    1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Waiting for SSH to come up on all nodes...


USED LATEST ami-38847a51 aquarius-8-cluster.3 WHICH SHOULD HAVE FIXED REBOOT:

/nethome/admin/.starcluster/plugins# em ../syoung-smallcluster.config

KEYNAME=id_rsa-admin-key
NODE_IMAGE_ID=ami-38847a51
NODE_INSTANCE_TYPE=t1.micro

THIS IS THE FAILED NODE:

RESERVATION	r-adb305c1	558277860346	@sc-syoung-smallcluster
INSTANCE	i-5b36dc35	ami-38847a51	ec2-50-16-5-42.compute-1.amazonaws.com	ip-10-122-57-27.ec2.internal	running	id_rsa-admin-key	0		t1.micro	2011-05-15T04:52:38+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.16.5.42	10.122.57.27			ebs					paravirtual	xen		sg-b25a2adb	default
BLOCKDEVICE	/dev/sda1	vol-6b1eb800	2011-05-15T04:52:58.000Z	
TAG	instance	i-5b36dc35	alias	master


TRIED TO CONNECT:

ssh -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
ec2-50-16-5-42.compute-1.amazonaws.com

    ssh: connect to host ec2-50-16-5-42.compute-1.amazonaws.com port 22: Connection refused


KILL AND LAUNCHED AS A FREE-STANDING INSTANCE FOR PROBING:

i-8b1cf6e5	FROM ami-38847a51 aquarius-8-cluster.3 

ec2-run-instances \
ami-38847a51 \
-g default \
-k aquarius \
--instance-type t1.micro \
-z us-east-1a
    
RESERVATION	r-93a016ff	558277860346	default
INSTANCE	i-8b1cf6e5	ami-38847a51	ec2-184-72-162-86.compute-1.amazonaws.com	ip-10-122-5-98.ec2.internal	running	aquarius	0		t1.micro2011-05-15T05:22:36+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	184.72.162.86	10.122.5.98			ebs			paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-ebe44580	2011-05-15T05:22:55.000Z	

sshi ec2-184-72-162-86.compute-1.amazonaws.com
    ssh: connect to host ec2-184-72-162-86.compute-1.amazonaws.com port 22: Connection refused


TURNS OUT THAT ANOTHER /dev/sdb1 LINE HAS BEEN INSERTED INTO /etc/fstab.

SO CHANGED THIS:

proc         /proc   proc    nodev,noexec,nosuid 0       0
/dev/sda1    /       ext3    defaults            0       0
/dev/sdb1    /mnt    auto    defaults,nobootwait 0       0
#/dev/sdb1   /mnt    auto    defaults,comment=cloudconfig    0       0

TO THIS:

#### REMOVED: /dev/sdb1       /mnt    auto    defaults,comment=cloudconfig    0       0
proc         /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1    /               ext3    defaults            0       0
/dev/sdb1    /mnt            auto    defaults,nobootwait 0       0


MOUNT ON PROBE
==============
export VOLUME=vol-ebe44580
export INSTANCE=i-8b1cf6e5
export PROBE=i-f5bd579b
export PROBE_IP=ec2-50-17-57-12.compute-1.amazonaws.com

# DETACH ROOT VOLUME FROM 8e AND ATTACH TO EXPLORATORY:
ec2-stop-instances $INSTANCE
ec2-describe-instances $INSTANCE
ec2-detach-volume $VOLUME
ec2-describe-volumes $VOLUME
ec2-attach-volume -i $PROBE -d /dev/sdx $VOLUME

# ON EXPLORATORY:
ssh -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@$PROBE_IP
mkdir -p /mnt/8e
mount /dev/sdx /mnt/8e

REMOUNT
=======
umount /mnt/8e

ec2-detach-volume $VOLUME
ec2-describe-volumes $VOLUME
ec2-attach-volume -i $INSTANCE -d /dev/sda1 $VOLUME
ec2-start-instances $INSTANCE
ec2-describe-instances $INSTANCE


RESTARTED INSTANCE:

RESERVATION	r-93a016ff	558277860346	default
INSTANCE	i-8b1cf6e5	ami-38847a51	ec2-50-16-160-220.compute-1.amazonaws.com	domU-12-31-38-04-21-FD.compute-1.internal	running	aquarius	0	t1.micro	2011-05-15T06:11:20+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.16.160.220	10.220.33.251			ebs		paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-ebe44580	2011-05-15T06:11:41.000Z	

.... AND CONNECTED OKAY!
ssh -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@ec2-50-16-160-220.compute-1.amazonaws.com

CHECKED /etc/fstab TO FIND THAT 

# REMOVED: /dev/sdb1	/mnt	auto	defaults,comment=cloudconfig	0	0
proc         /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1    /               ext3    defaults            0       0
/dev/sdb1    /mnt            auto    defaults,nobootwait 0       0

/dev/sdb1	/mnt	auto	defaults,nobootwait,comment=cloudconfig	0	0



</entry>
<entry [Fri 2011:05:13 12:05:23 EST] MOUNT /agua ON STARCLUSTER>

cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
shell

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

    OK

    
</entry>
<entry [Thu 2011:05:12 01:28:24 EST] RAN WORKFLOW AS QUEUE>
    
submit

*.sh FILE RUNS ok NON-TMP


Agua::Monitor::SGE::repeatTries    Qstat result: error: commlib error: got select error (Connection timed out)
unable to contact qmaster using port 63231 on host "10.127.93.97"
unable to contact qmaster using port 63231 on host "10.127.93.97"

Agua::Monitor::SGE::repeatTries    Qstat sleeping 5 seconds
Agua::Monitor::SGE::repeatTries    current datetime: Fri May 13 15:23:08 UTC 2011


agua::Stage
line 381

	#### SET *** BATCH *** JOB 
	my $job = $self->setJob([$command], $label, $outputdir);


</entry>
<entry [Wed 2011:05:11 10:12:26 EST] FIXED NO-REBOOT PROBLEM WITH 8e IMAGE>

1. REMOVED NFS-RELATED LINES IN /etc/fstab

2. USED nobootwait FOR VOLUMES /dev/sdh AND /dev/sdi




NOTES
-----

NFS TIPS
http://www.bga.org/~lessem/psyc5112/usail/network/nfs/tips.html
https://bugs.launchpad.net/ubuntu/+source/mountall/+bug/501678

1. DON'T MOUNT TO /    

2. USE hard,intr FOR RW OR EXECUTABLES DRIVES

3. USE bg SO THAT THE CLIENT DOESN'T HANG DURING THE BOOT PROCESS IF THE SERVER IS UNAVAILABLE 

4. ADD nobootwait 


</entry>
<entry [Mon 2011:05:09 23:12:58 EST] CREATED CRON JOB TO RESTART bal IF CLUSTER IS RUNNING>

0. CRON JOB RUNS EVERY MINUTE

    * * * * * /agua/0.6/bin/scripts/checkBalancers.pl --logfile /tmp/checkbalancers.out

1. CHECKS clusterstatus DATABASE TABLE FOR RUNNING CLUSTERS

2. FOR RUNNING CLUSTERS, CHECKS IF LOCK FILE IS OLDER THAN 1 MINUTE

3. IF LOCK FILE STALE, RESTART bal FOR THE CLUSTER:
    
    -   KILL PREVIOUS PROCESS USING PID IN PID FILE
    
    -   START bal: STORE PID IN PID FILE, CONCAT OUTPUT TO OUTPUT FILE


/agua/0.6/bin/scripts/checkBalancers.pl --logfile /tmp/checkbalancers.log



NOTES
-----

**** CAN'T USE '&>' TO REDIRECT, MUST USE ONLY '>'


CRONTAB IS SETUID:

ll /usr/bin/crontab
-rwxr-sr-x 1 root crontab 35896 2010-08-24 16:45 /usr/bin/crontab*

CRONTAB ON 8e:

root@ip-10-122-61-250:/nethome/admin/.starcluster/plugins# crontab -h
crontab: invalid option -- 'h'
crontab: usage error: unrecognized option
usage:	crontab [-u user] file
	crontab [-u user] { -e | -l | -r }
		(default operation is replace, per 1003.2)
	-e	(edit user's crontab)
	-l	(list user's crontab)
	-r	(delete user's crontab)
	-i	(prompt before deleting user's crontab)
root@ip-10-122-61-250:/nethome/admin/.starcluster/plugins# crontab -l
no crontab for root



http://www.perlhowto.com/check_if_a_process_is_running

check if a process is running
-----------------------------
( categories: system )

Send a 0 (zero) signal to the process ID you want to check using the kill function. If the process exists, the function returns true, otherwise it returns false.

Example:

#-- check if process 1525 is running
$exists = kill 0, 1525;
print "Process is running\n" if ( $exists );


used howto to monitor and restart application

Submitted by rjw on Tue, 07/27/2010 - 00:25.

Struggled with tearing apart ps output which was clunky, then found your elegant suggestion of signal 0 which returns "truth" of whether the process is running or not.

Used the technique to monitor bind on OpenBSD and restart if it isn't running.
Script can be run manually and reports if process running or not.
Script normally run from cron (i use 1-minute intervals).

ns1:named {146} cat named-test

#!/usr/bin/perl
#
# test to see if named process exists and if not, start it up again.
#
# (named writes process number on first line followed by the command used
# to start it in second line of /var/named/named.pid)
# cat named.pid
# 6389
# named -t /var/named -u named
#
# test to see if named process exists and if not, start it up again.
#
$exists = kill 0, `head -1 /var/named/named.pid`;
#
unless ($exists) { exec `tail -1 /var/named/named.pid` }
#
print "\n\$exists = <$exists>\n";


</entry>
<entry [Mon 2011:05:09 22:51:37 EST] FIXED LOAD BALANCER 'commlib error'>


USAGE:

    Options:
      -h, --help            show this help message and exit
      -p, --plot            Plot usage data at each iteration
      -i INTERVAL, --interval=INTERVAL
                            Polling interval for load balancer
      -m MAX_NODES, --max_nodes=MAX_NODES
                            Maximum # of nodes in cluster
      -w WAIT_TIME, --job_wait_time=WAIT_TIME
                            Maximum wait time for a job before adding nodes,
                            seconds
      -a ADD_PI, --add_nodes_per_iter=ADD_PI
                            Number of nodes to add per iteration
      -k KILL_AFTER, --kill_after=KILL_AFTER
                            Minutes after which a node can be killed
      -s STAB, --stabilization_time=STAB
                            Seconds to wait before cluster stabilizes
      -l LOOKBACK_WIN, --lookback_window=LOOKBACK_WIN
                            Minutes to look back for past job history
      -n MIN_NODES, --min_nodes=MIN_NODES
                            Minimum number of nodes in cluster

IMPORTANT PARAMETERS:

-i polling interval (secs)
-w max wait time before adding node (secs)
-s cluster stabilisation time to wait (secs)
-k Can kill node after it has been up for XX minutes (DEFAULT: 45 mins)


START STARCLUSTER

cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config start syoung-smallcluster &> /nethome/agua/syoung/.cluster/syoung-smallcluster-starcluster.out

START LOAD BALANCER

# DEBUG 
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 30 -w 100 -s 30 -k 10


# NORMAL
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 30 -w 300 -s 300 -k 10



MOST RECURRENT ERROR:

>>> Oldest job is from 2011-05-10 18:29:20. # queued jobs = 53. # hosts = 5.
>>> Avg job duration = 50 sec, Avg wait time = 517 sec.
>>> Won't add another host, currently at max (5).
>>> Sleeping, looping again in 10 seconds.

ssh.py:382 - ERROR - command 'source /etc/profile && qhost -xml' failed with status 1
ssh.py:382 - ERROR - command 'source /etc/profile && qstat -q all.q -u "*" -xml' failed with status 1
>>> balancers.sge.__init__.parse_qhost string: error: commlib error: access denied (client IP resolved to host name "ip-10-126-47-173.ec2.internal". This is not identical to clients host name "master")
error: unable to send message to qmaster using port 36251 on host "master": got send error
Traceback (most recent call last):
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/cli.py", line 160, in main
    sc.execute(args)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/commands/loadbalance.py", line 56, in execute
    lb.run(cluster)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 455, in run
    if self.get_stats() == -1:
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 413, in get_stats
    self.stat.parse_qhost(qhostXml)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 47, in parse_qhost
    doc = xml.dom.minidom.parseString(string)
  File "/usr/lib/python2.6/xml/dom/minidom.py", line 1928, in parseString
    return expatbuilder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 940, in parseString
    return builder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 223, in parseString
    parser.Parse(string, True)
ExpatError: syntax error: line 1, column 0

cli.py:129 - ERROR - Oops! Looks like you've found a bug in StarCluster
cli.py:130 - ERROR - Debug file written to: /tmp/starcluster-debug-root.log
cli.py:131 - ERROR - Look for lines starting with PID: 4449
cli.py:132 - ERROR - Please submit this file, minus any private information,
cli.py:133 - ERROR - to starcluster@mit.edu



OTHER ERRORS:


>>> /bin/ps aux | grep sgeadmin | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID
ssh.py:382 - ERROR - command '/bin/ps aux | grep sgeadmin | cut -c9-14 | xargs -n1 -iPID /bin/kill -9 PID' failed with status -1
>>> sge.restartSge    export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/sge_execd
>>> sge.addToAllhosts    command: /opt/sge6/bin/lx24-amd64/qconf -aattr hostgroup hostlist node002 @allhosts >> /tmp/allhosts.out; 
ssh.py:382 - ERROR - command 'export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/qconf -aattr hostgroup hostlist node002 @allhosts >> /tmp/allhosts.out; ' failed with status 1
>>> Done adding nodes.
>>> Sleeping, looping again in 30 seconds.

ssh.py:382 - ERROR - command 'source /etc/profile && qhost -xml' failed with status 1
ssh.py:382 - ERROR - command 'source /etc/profile && qstat -q all.q -u "*" -xml' failed with status 1
Traceback (most recent call last):
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/cli.py", line 160, in main
    sc.execute(args)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/commands/loadbalance.py", line 56, in execute
    lb.run(cluster)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 443, in run
    if self.get_stats() == -1:
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 401, in get_stats
    self.stat.parse_qhost(qhostXml)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 41, in parse_qhost
    doc = xml.dom.minidom.parseString(string)
  File "/usr/lib/python2.6/xml/dom/minidom.py", line 1928, in parseString
    return expatbuilder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 940, in parseString
    return builder.parseString(string)
  File "/usr/lib/python2.6/xml/dom/expatbuilder.py", line 223, in parseString
    parser.Parse(string, True)
ExpatError: syntax error: line 1, column 0

cli.py:129 - ERROR - Oops! Looks like you've found a bug in StarCluster
cli.py:130 - ERROR - Debug file written to: /tmp/starcluster-debug-root.log
cli.py:131 - ERROR - Look for lines starting with PID: 32523
cli.py:132 - ERROR - Please submit this file, minus any private information,
cli.py:133 - ERROR - to starcluster@mit.edu
root@ip-10-122-61-250:/nethome/admin/.starcluster/plugins# cat /etc/profile
# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

if [ "$PS1" ]; then
  if [ "$BASH" ]; then
    PS1='\u@\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi


... SO HAVE TO ADD ENVARS TO /etc/profile ON MASTER!


RERAN AGAIN:

>>> Oldest job is from 2011-05-10 14:29:36. # queued jobs = 34. # hosts = 2.
>>> Avg job duration = 0 sec, Avg wait time = 0 sec.
>>> Sleeping, looping again in 30 seconds.

>>> Oldest job is from 2011-05-10 14:29:36. # queued jobs = 69. # hosts = 2.
>>> Avg job duration = 0 sec, Avg wait time = 0 sec.
>>> A job has been waiting for 38 sec, longer than max 30.
ON THE FIRST JOB
>>> *** ADDING 1 NODES.
>>> Launching node(s): node003
Reservation:r-f771d69b
>>> Waiting for node(s) to come up... (updating every 30s)
>>> Waiting for all nodes to be in a 'running' state...
3/3 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Waiting for SSH to come up on all nodes...
3/3 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring hostnames...
__init__.py:510 - ERROR - Failed to add new host.
>>> Sleeping, looping again in 30 seconds.

>>> Entire cluster is not up, nodes added/removed. No Action.
>>> Oldest job is from 2011-05-10 14:29:36. # queued jobs = 67. # hosts = 3.
>>> Avg job duration = 50 sec, Avg wait time = 9 sec.
Traceback (most recent call last):
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/cli.py", line 160, in main
    sc.execute(args)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/commands/loadbalance.py", line 56, in execute
    lb.run(cluster)
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 452, in run
    self._eval_add_node()
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 475, in _eval_add_node
    sph = self.stat.slots_per_host()
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 183, in slots_per_host
    total = self.count_total_slots()
  File "/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/balancers/sge/__init__.py", line 174, in count_total_slots
    slots = slots + int(h['num_proc'])
ValueError: invalid literal for int() with base 10: '-'

cli.py:129 - ERROR - Oops! Looks like you've found a bug in StarCluster
cli.py:130 - ERROR - Debug file written to: /tmp/starcluster-debug-root.log
cli.py:131 - ERROR - Look for lines starting with PID: 844
cli.py:132 - ERROR - Please submit this file, minus any private information,
cli.py:133 - ERROR - to starcluster@mit.edu

<!--

>>> balancers.sge.__init__.parse_qhost string: <?xml version='1.0'?>
<qhost xmlns:xsd="http://gridengine.sunsource.net/source/browse/*checkout*/gridengine/source/dist/util/resources/schemas/qhost/qhost.xsd?revision=1.2">
<host name='global'>
<hostvalue name='arch_string'>-</hostvalue>
<hostvalue name='num_proc'>-</hostvalue>
<hostvalue name='load_avg'>-</hostvalue>
<hostvalue name='mem_total'>-</hostvalue>
<hostvalue name='mem_used'>-</hostvalue>
<hostvalue name='swap_total'>-</hostvalue>
<hostvalue name='swap_used'>-</hostvalue>
</host>
<host name='master'>
<hostvalue name='arch_string'>lx24-amd64</hostvalue>
<hostvalue name='num_proc'>1</hostvalue>
<hostvalue name='load_avg'>1.10</hostvalue>
<hostvalue name='mem_total'>615.2M</hostvalue>
<hostvalue name='mem_used'>88.4M</hostvalue>
<hostvalue name='swap_total'>0.0</hostvalue>
<hostvalue name='swap_used'>0.0</hostvalue>
</host>
</qhost>
>>> Oldest job is from 2011-05-10 17:10:40. # queued jobs = 61. # hosts = 1.
>>> Avg job duration = 50 sec, Avg wait time = 599 sec.
>>> Sleeping, looping again in 15 seconds.



-->

SEEMS TO BE A HOSTNAME ISSUE:

>>> balancers.sge.__init__.parse_qhost string: error: commlib error: access denied (client IP resolved to host name "ip-10-126-47-173.ec2.internal". This is not identical to clients host name "master")

CHANGED MASTER'S HOSTNAME TO IP ADDRESS BUT GOT SAME ERROR.


CHECKED pe_hostfile:

root@master:/opt/sge6# find . -name pe_hostfile
./syoung-smallcluster/spool/node002/active_jobs/102.1/pe_hostfile
./syoung-smallcluster/spool/node002/active_jobs/98.1/pe_hostfile
./syoung-smallcluster/spool/node001/active_jobs/6.1/pe_hostfile
./syoung-smallcluster/spool/node001/active_jobs/104.1/pe_hostfile
./syoung-smallcluster/spool/node001/active_jobs/96.1/pe_hostfile
./syoung-smallcluster/spool/exec_spool_local/master/active_jobs/3.1/pe_hostfile
./syoung-smallcluster/spool/exec_spool_local/master/active_jobs/7.1/pe_hostfile
./syoung-smallcluster/spool/exec_spool_local/master/active_jobs/105.1/pe_hostfile
./syoung-smallcluster/spool/exec_spool_local/master/active_jobs/97.1/pe_hostfile
./syoung-smallcluster/spool/node004/active_jobs/103.1/pe_hostfile
./default/spool/node002/active_jobs/213.1/pe_hostfile
./default/spool/node001/active_jobs/212.1/pe_hostfile
./default/spool/node005/active_jobs/214.1/pe_hostfile
./default/spool/exec_spool_local/master/active_jobs/215.1/pe_hostfile
./default/spool/node004/active_jobs/211.1/pe_hostfile


CHECKED pe_hostfile CONTENTS ON MASTER:

root@master:/opt/sge6# head ./syoung-smallcluster/spool/exec_spool_local/master/active_jobs/*/pe_hostfile

==> ./syoung-smallcluster/spool/exec_spool_local/master/active_jobs/105.1/pe_hostfile <==
master 1 all.q@master UNDEFINED

==> ./syoung-smallcluster/spool/exec_spool_local/master/active_jobs/3.1/pe_hostfile <==
master 1 all.q@master UNDEFINED

==> ./syoung-smallcluster/spool/exec_spool_local/master/active_jobs/7.1/pe_hostfile <==
master 1 all.q@master UNDEFINED

==> ./syoung-smallcluster/spool/exec_spool_local/master/active_jobs/97.1/pe_hostfile <==
master 1 all.q@master UNDEFINED


CHECKED pe_hostfile CONTENTS ON NODES:

root@master:/opt/sge6# head ./syoung-smallcluster/spool/node00*/active_jobs/*/pe_hostfile
==> ./syoung-smallcluster/spool/node001/active_jobs/104.1/pe_hostfile <==
node001 1 all.q@node001 UNDEFINED

==> ./syoung-smallcluster/spool/node001/active_jobs/6.1/pe_hostfile <==
node001 1 all.q@node001 UNDEFINED

==> ./syoung-smallcluster/spool/node001/active_jobs/96.1/pe_hostfile <==
node001 1 all.q@node001 UNDEFINED

==> ./syoung-smallcluster/spool/node002/active_jobs/102.1/pe_hostfile <==
node002 1 all.q@node002 UNDEFINED

==> ./syoung-smallcluster/spool/node002/active_jobs/98.1/pe_hostfile <==
node002 1 all.q@node002 UNDEFINED

==> ./syoung-smallcluster/spool/node004/active_jobs/103.1/pe_hostfile <==
node004 1 all.q@node004 UNDEFINED


GOT THE IDENTICAL ERROR USING qstat -t:

qstat -t

    error: commlib error: access denied (client IP resolved to host name "master". This is not identical to clients host name "ip-10-126-47-173.ec2.internal")
    error: failed receiving gdi request response for mid=1 (can't find connection).





THIS POST BY CHRIS TO REUTI SUGGESTS COMPILING SGE AS THE FINAL SOLUTION:
http://markmail.org/message/qizvjpjmelstw4ie

Subject:	error: commlib error: access denied (client IP resolved to host name "". (was Re: [GE users] Running MPICH jobs)	
From:	Chris Dagdigian (da...@sonsorol.org)
Date:	May 2, 2006 6:21:02 am
List:	net.sunsource.gridengine.users

This reply is not on-topic for this "running MPICH"  thread but I  
wanted to add my $.02 in here regarding this particular error message.

I see this error occasionally on Apple OS X based clusters, usually  
the main symptom is a SGE admin approaching us to say that "qstat"  
will fail at random intervals and then suddenly start working again  
within a minute or two. The specific error usually looks like this:

error: commlib error: access denied (client IP resolved to host name
"". This is not identical to clients host name "")
unable to contact qmaster using port 701 on host
"xxx.xxx(hostname deleted).xxx"

Whenever I've been able to login to the system in question I've been  
able to confirm the behavior -- sometimes qstat will work, sometimes  
it will not and will fail with the error noted above. I have  
collectively spent many days trying to fix the error shown below, it  
appears randomly on about 5% of the Apple OS X base clusters that I  
work on. I've never been able to correlate it to a particular system  
configuration and I've never been able to reproduce the error after  
"fixing" it.  The operating system version does not matter and the  
CPU arch (G4 vs G5) does not matter.

In all cases, forward and reverse DNS is functioning perfectly, both  
at the /etc/hosts and the DNS resolver levels.

in all cases all of the SGE utilbin/ binaries are also functioning  
perfectly and able to resolve names and IPs correctly and without error.

Over the past year or so, I've been able to fix this issue on about  
50% of the SGE systems showing the behavior simply by dropping new or  
updated courtesy binaries into place.  The remaining 50% of the  
clusters are not fixed by this and continue to show the odd behavior  
even when the latest binaries are dropped into place.

For those systems not fixed by new binaries, the only way (after  
*much* trial and error and experimentation) I've been able to  
conclusively make the problem go away is to build Grid Engine from  
source on the affected system. Hand-built binaries installed into  
$SGE_ROOT have always cleared the issue. This is the only "fix" that  
works for us right now for this particular issue.

This is a real issue that I've seen on multiple different (Apple)  
systems but since I can't figure out the root cause or "fix" it by  
any other means than rebuilding from sourcecode I've never filed an  
Issue report. If I ever learn more I'll open up something in the  
Issue tracker.

Anyway, like I said this is not on topic for the thread but the error  
message quoted below brought back bad memories (heh!) and I thought  
I'd send a note so it would get listed in the archives. Maybe this  
will help someone doing a google or archive search on  "access denied  
(client IP resolved to host name """ in the future.

-Chris

On May 2, 2006, at 5:33 AM, Reuti wrote:


ANOTHER POST IN 2008 BY REUTI:

Subject:	Re: [GE users] "commlib error: access denied" with 6.2 install_execd	
From:	Reuti (reu...@staff.uni-marburg.de)
Date:	Oct 28, 2008 10:20:55 am
List:	net.sunsource.gridengine.users
Hi Harry,

Am 28.10.2008 um 17:58 schrieb Harry Mangalam:

Hi All,

Background follows immediately, real issue at **ISSUE** below

I'm an SGE newbie, and have installed sge6.2 on a test cluster that
includes a login node & scheduler node, each with an external i/f's
and an internal interface (192.168.0.xxx) to the compute nodes, which
only have private i/f's.

root can ssh to all nodes without passwords and the SGE_ROOT is
mounted by all nodes.

I've done both interactive installs and config-file-based installs and
the qmaster installs fine on the sched node with the command:

 cd $SGE_ROOT; sudo ./inst_sge -m -auto /path/to/sge.conf

However, the execution nodes fail to install with the corresponding
command:

 cd $SGE_ROOT; sudo ./inst_sge -x -auto /path/to/sge.conf

with almost no feedback.  The log file produces output that implies
that it has worked:

      8 bduc-i32-1
      9 remote execd installation on host bduc-i32-1
     10 adminhost "bduc-i32-1" already exists
     11 bduc-i32-2
     12 remote execd installation on host bduc-i32-2
     13 adminhost "bduc-i32-2" already exists


but also produces output like this:


     47 Reading configuration from file /home/hmangala/sge_bducs.conf
     48 gethostbyaddr() took 20 seconds and returns success
     49
     50 do_ypcall: clnt_call: RPC: Timed out
     51 do_ypcall: clnt_call: RPC: Timed out
     52 gethostbyaddr() took 25 seconds and returns success
     53
     54 do_ypcall: clnt_call: RPC: Timed out
     55 do_ypcall: clnt_call: RPC: Timed out
     56 do_ypcall: clnt_call: RPC: Timed out
     57 do_ypcall: clnt_call: RPC: Timed out
     58 TERM environment variable not set.
     59 gethostbyaddr() took 30 seconds and returns success
     60
     61 gethostbyaddr() took 30 seconds and returns success
     62
     63 gethostbyaddr() took 30 seconds and returns success


but implies that it was successful in the end.

However, there's no SGE rc startup script written to the execution
nodes and no sge_execd running on them afterwards.

**ISSUE**

Another post suggested running qhost to check the connections among
hosts and that seems to have identified the problem:

from the qmaster host (sched):
$ qhost
HOSTNAME                ARCH         NCPU  LOAD  MEMTOT  MEMUSE
SWAPTO  SWAPUS
---------------------------------------------------------------------- 
---------
global                  -               -     -       -        
-       -       -

from an execution host:
$ qhost
error: commlib error: access denied (client IP resolved to host
name "bduc-login.nacs.uci.edu". This is not identical to clients host
name "bduc-i32-2")
error: unable to contact qmaster using port 536 on
host "bduc-sched.nacs.uci.edu"

For some reason the execution node is being resolved to the login
node, but using nslookup and the included gethost... utils, the name
& IP resolve correctly both ways on the login host, the sched host,
and the execution host.

The ports 536/7 are entered in the /etc/services on the sched host,
but not on the exec hosts - is that be a problem?  They are defined
as 536/7 in the config file.

Are there other suggestions to resolve this?  This appears to be
similar to the issue as raised in:

http://gridengine.sunsource.net/issues/show_bug.cgi?id=1661

http://gridengine.sunsource.net/issues/show_bug.cgi?id=1358

but this one involves hostnames in conflict, not IP# < - > hostnames.

but all references in the config file are by hostname (and the
sched /etc/hosts file refers to them all by name as well (no
references to naked IP #s being used)

please have a look here:

http://gridengine.sunsource.net/howto/multi_intrfcs.html

you will need two entries for the login and scheduler node.

You might also check (you are using NIS?), that the traffic from the  
login node to the scheduler node is also using the secondary  
interface with a rule in the routing like:

external.scheduler.node.edu *               255.255.255.255 UH     
0      0        0 eth1

or alike.



</entry>

<entry [Tue 2011:05:10 01:40:12 EST] FIXED NODES NOT IN QUEUE PROBLEM>

SOLUTION:    

(RE)START EXECD ON ADDED NODES


PROBLEM:
ADD NODE AS NEW EXEC HOST
emacs node004.conf

    hostname              node004
    load_scaling          NONE
    complex_values        NONE
    user_lists            NONE
    xuser_lists           NONE
    projects              NONE
    xprojects             NONE
    usage_scaling         NONE
    report_variables      NONE

qconf -Ae node004.conf


ADD HOST TO @allhosts GROUP
qconf -aattr hostgroup hostlist node007 @allhosts

qconf -shgrp @allhosts
    group_name @allhosts
    hostlist master node001 node002 node004


CONFIRMED ON MASTER ONLY all.q EXISTS:

ll /opt/sge/syoung-smallcluster/default/spool/qmaster/cqueues
    all.q

AND ONLY master IS IN THE @allhosts GROUP:

HOST GROUP TREE VIEW:
qconf -shgrp_tree @allhosts

    @allhosts
       master

ORDINARY VIEW HOST GROUP:
qconf -shgrp @allhosts

ONLY RESOLVED HOSTS:
qconf -shgrp_resolved @allhosts

HOST GROUP LIST (displays a list of all host groups):
qconf -shgrpl
    @allhosts



ADD A HOST GROUP:
qconf -ahgrp @newgroup

ADD A HOST TO A HOST GROUP
qconf -aattr hostgroup hostlist node001 @allhosts
qconf -aattr hostgroup hostlist node002 @allhosts
    root@master modified "@allhosts" in host group list

CHECK HOST HAS BEEN ADDED
qconf -mhgrp @allhosts
    group_name @allhosts
    hostlist master node001 node002


SOLUTION:    

(RE)START EXECD ON ADDED NODES



</entry>

<entry [Tue 2011:05:10 00:42:28 EST] REFACTORED sge.py AND automount.py, FIXED on_add_node>
# NOTE: USING LATEST VERSION 0.91.316

# START SHELL 
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
shell

# SGE

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')

reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')
    
    OK
    
AUTOMOUNT

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

    OK
    
</entry>
