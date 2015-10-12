sge.quickref



<entry [Fri 2014:07:25 20:41:35 EST] SUSPEND AND RESUBMIT STALLED JOBS>

http://gis.cri.fmach.it/grid-engine-howto/

Suspend and resubmit stalled jobs

# as user:
qstat | grep neteler | tr -s ' ' ' '  | cut -d' ' -f2 > /tmp/to_suspend.sge
cat /tmp/to_suspend.sge

# as root (?):
su -
for i in `cat /tmp/to_suspend.sge` ; do qmod -sj $i ; done
qstat

# remove crashed blade from list of execution hosts:
qconf -de blade14

# delete host from list:
qconf -mhgrp "@allhosts"

# apply new list:
qconf -shgrp "@allhosts"

# verify queue stats:
qstat -f

# resubmit jobs to other nodes (as job user!!):
exit
for i in `cat /tmp/to_suspend.sge` ; do qresub $i ; done
qstat

	
</entry>
<entry [Fri 2014:07:25 20:39:20 EST] EXPLAIN ERROR>

http://gis.cri.fmach.it/grid-engine-howto/

State E: Some job is hanging. Get info with
    
qstat -explain E -qs E


Note: State "E" does not go away automatically To globally clear all E states in your SGE cluster WHEN YOU ARE SURE that this is ok:

qmod -c '*'


Multi-queue management: Suspend and resume queues

Suspend a queue (add -f in case sge_execd is not reachable):
qmod -s q_name1

Suspend two queues (add -f in case sge_execd is not reachable):
qmod -s q_name1, q_name2

Resumes (unsuspend) a queue:
qmod -us -f q_name1

Disable/Enable a particular queue for some reason
... for example for maintenance... Disable a particular queue:
qconf -sql  # add -f in case sge_execd is not reachable qmod -d q_name

To enable back the queue:
qmod -e q_name

Wildcards can be used to specify a range of queues:
qmod -e q_name*


	
</entry>
<entry [Fri 2014:07:25 20:34:41 EST] USE qalter TO GET INFO ON JOB>

qalter -w v JOBNUMBER

qalter -w v 2658
	verification: job is already running

qalter -w v 2659
	verification: found possible assignment with 8 slots

	
</entry>
<entry [Wed 2014:06:25 07:24:36 EST] SGE CHEAT SHEET>

https://confluence.rcs.griffith.edu.au/display/v20zCluster/SGE+cheat+sheet

Clean up!

/usr/local/SGE/bin/lx24-amd64/qmod -cq lam mpich2 long short nolimit short

Commonly Used commands

qconf -mhgrp @allhosts                   edit hostgroup "@allhosts"
qstat -f [-q \*@node23]                  full display info [for node23 only]
qconf -sq all.q                          show "all.q" queue info
qconf -mq all.q                          modify "all.q" queue: update hostlist, #slots
qconf -aq all.q                          create queue named "all.q"
qmon                                     GUI
qmod                                     manipulate jobs, queues
qconf -rattr queue slots 0 all.q@node23  #slots -> 0 (== pbsnodes -o)
qstat -s r -q all.q@node23               show all running jobs on node23
qhost -h node23,node24                   show host info for multiple nodes
qhost -q -h node23,node24                ibid, plus queue info
qmod -e all.q@node23                     enable node23 in queue all.q (-d == disable)
qsub -j y -o `pwd` -q all.q test.sh      submit test.sh job on queue all.q
qping -info node23 6445 execd 1          check status of execd on node23

qstat                                    current user jobs
qstat -u "*"                             all user jobs
qstat -g c                               show available nodes and load
qstat -f                                 detailed list of machines and job state 
qstat -explain c -j job-id               specific job status
qdel job-id                              delete job
qsub -l h_vmem=### job.sh                mem limit, see queue_conf(5) RESOURCE LIMITS

qstat -f -u "*"
qconf -mc
qsub -w v job.00                         Troubleshoot problems with queue/scheduling

Reference:
http://sph.bu.edu/index.php?Itemid=398

http://gridengine.sunsource.net/howto/commontasks.html

	
</entry>
<entry [Thu 2012:09:13 02:51:58 EST] SET SGE COMMLIB ERROR LOG LEVEL>

export SGE_COMMLIB_DEBUG=4

export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-microcluster; export SGE_QMASTER_PORT=36351; export SGE_EXECD_PORT=36352; /opt/sge6/bin/linux-x64/sge_execd 


    
</entry>
<entry [Thu 2011:09:08 13:35:04 EST] SYNTAX OF host_aliases FILE>
    

em /opt/sge6/syoung-microcluster/common/host_aliases

    master      domU-12-31-38-04-D8-06
    headnode    domU-12-31-38-04-80-08


NOTES
-----

http://wikis.sun.com/display/GridEngine/Other+Installation+Issues


The machine's host name is sge. When a connection is established from sge to another machine, it might go through sge, sge-qfe1, or sge-qfe2. Upon installation, Grid Engine will only recognize sge. When Grid Engine receives a connection request from sge-qfe2, it closes the connection because the request is not from one of the authorized (or known) nodes.

To solve this problem, use the host_aliases files to "tell" Grid Engine that sge, sge1, and sge-qfe2 are all from the same machine. See the sge_h_aliases man page for details. The host_aliases file in this case would look like this:

sge sge-qfe1 sge-qfe2


</entry>
<entry [Thu 2011:09:08 12:27:04 EST] INSTALL LIBMOTIF4 (INCLUDES libX3.so.3) TO USE qmon>

sudo apt-get install libmotif4
    OK
    
    
LATER: FIREFOX WAS DISABLED BY THE CHANGE, SO UNINSTALLED:

sudo apt-get remove libmotif4

    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    The following packages will be REMOVED:
      libmotif4
    0 upgraded, 0 newly installed, 1 to remove and 170 not upgraded.
    After this operation, 3,793 kB disk space will be freed.
    Do you want to continue [Y/n]? y
    (Reading database ... 163016 files and directories currently installed.)
    Removing libmotif4 ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place


</entry>
<entry [Thu 2011:09:08 12:16:58 EST] SET DEFAULT QUEUE>

To have a default queue, that unspecified jobs get put to, SET THE default requested queue in

$SGE_ROOT/$SGE_CELL/common/sge_request 
    
</entry>
<entry [Thu 2011:09:08 12:04:32 EST] LOCATION OF QUEUE CONFIGURATION FILES>

The queue configurations are stored in the directory $SGE_ROOT/$SGE_CELL/spool/qmaster/cqueues/, e.g.:

  cat /opt/sge/n1ge6/default/spool/qmaster/cqueues/long.q
    
</entry>
<entry [Thu 2011:09:08 11:53:56 EST] EXCLUDE A HOST/HOSTGROUP FROM SUBMITTED JOBS>

request a queue as follows:

    qsub -q clusterqueuename@@hostgroupname .....

OR USING wildcards:

    qsub -q *@@hostgroupname .....    (gets any cluster queue on hostgroupname)
    qsub -q clusterqueuename@@* ..... (gets clusterqueuename on any hostgroup)

request to NOT USE a particular hostgroup or clusterqueue.

qsub -q '! clusterqueuename@@hostgroupname'


request to NOT USE a particular HOST:

qsub -q clusterqueuename -l h='!hostname'

    
</entry>
<entry [Thu 2011:09:08 10:04:25 EST] CREATE @allhosts AND all.q>

> 
> Having seen this before, you can run the following to create all.q and
> @allhosts after-the-fact:
> 
> echo "group_name  @allhosts" > /tmp/hostqueue
> echo "hostlist    NONE" >> /tmp/hostqueue
> qconf -Ahgrp /tmp/hostqueue
> qconf -sq > /tmp/hostqueue
> sed -e "/qname/s/template/all.q/" \
>     -e "/hostlist/s/NONE/@allhosts/" \
>     -e "/pe_list/s/NONE/make/" /tmp/hostqueue > /tmp/hostqueue.q
> qconf -Aq /tmp/hostqueue.q
> rm -f /tmp/hostqueue*

</entry>
<entry [Fri 2011:05:06 01:06:28 EST] MASTER .bash_profile>

export PATH=/opt/sge6/bin/lx24-amd64/:/opt/sge6/util:/opt/sge6/utilbin/lx24-amd64:$PATH

alias ersge="echo 'tail -n 100 /opt/sge6/syoung-smallcluster/spool/qmaster/messages'; tail -n 100 /opt/sge6/syoung-smallcluster/spool/qmaster/messages; echo 'tail -n 100 /opt/sge6/syoung-smallcluster/spool/exec_spool_local/master/messages'; tail -n 100 /opt/sge6/syoung-smallcluster/spool/exec_spool_local/master/messages; echo 'tail -n 100 /tmp/sge_messages'; tail -n 100 /tmp/sge_messages; "

alias envars='export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6;'
alias sobash='source ~/.bash_profile'
alias gobash='emacs -nw ~/.bash_profile'


</entry>
<entry [Thu 2011:05:05 10:55:28 EST] ERROR MESSAGES>

GET SGE ERROR MESSAGES ON MASTER:

date
    Mon Jan 10 17:28:15 UTC 2011
tail /opt/sge6/default/spool/qmaster/messages


STARTUP
tail /tmp/sge_qmaster_messages
tail /tmp/sge_execd_messages


RUN TIME MESSAGES (E.G., NODE EXECD INFO) IN /opt/sge6/default
tail -f /opt/sge6/default/spool/exec_spool_local/master/messages 
tail -f /opt/sge6/default/spool/exec_spool_local/node001/messages 
    05/04/2011 03:36:38|  main|master|W|job 48.1 exceeded hard wallclock time - initiate terminate method


RUN TIME MESSAGES IN /tmp
tail -n 100 /tmp/sge_messages
    05/09/2011 01:39:42|  main|master|E|communication error for "master/qmaster/1" running on port 36251: "can't bind socket"
    05/09/2011 01:39:43|  main|master|E|commlib error: can't bind socket (no additional information available)


STARTUP INFO
tail /opt/sge6/default/spool/qmaster/messages
    01/10/2011 16:51:33|  main|ip-10-124-245-118|I|read job database with 0 entries in 0 seconds
    01/10/2011 16:51:33|  main|ip-10-124-245-118|E|error opening file "/opt/sge6/default/spool/qmaster/./sharetree" for reading: No such file or directory


</entry>
<entry [Thu 2011:05:05 10:54:31 EST] CHECK HOSTS AND QUEUES>

To view and change the setup of hosts use qconf -XY [file] with the following options:

   =================================================================
                     HOST   execution   admin     submit  host_group 
                       Y      e          h          s
    ACTION        X 
   ----------------------------------------------------------------- 
   add (edit)     a           *          *          *         *
   add (file)     A           *                               *
   delete         d           *          *          *         *
   modify (edit)  m           *                               *
   modify (file)  M           *                               *
   show           s           *          *          *         *
   show list      sYl         *                               *
   ================================================================
 
SUBMIT
------

CHECK CURRENT SUBMIT HOSTS
qconf -ss

ADD AQ-7 AS SUBMIT HOST
qconf -as ip-10-127-158-202.ec2.internal


ADMIN
-----

ADD AQ-7 AS ADMIN HOST
qconf -ah ip-10-127-158-202.ec2.internal

CHECK ADMIN HOSTS:
qconf -sh

SHOW LIST OF QUEUES:
qconf -sql
    all.q


EXECUTION
---------

ADD EXEC HOST



</entry>

<entry [Mon 2011:05:02 12:18:58 EST] CHECK PORTS>

netstat -ntulp | grep mount

    tcp        0      0 0.0.0.0:32767           0.0.0.0:*               LISTEN      4291/rpc.mountd 
    udp        0      0 0.0.0.0:32767           0.0.0.0:*                           4291/rpc.mountd 

CHECK EC2 OPEN PORTS:
ec2-describe-group

OPEN PORT sge_qmaster PORT ON EC2
ec2-authorize @sc-masters -p 63231 -P udp
ec2-authorize @sc-masters -p 63231 -P tcp

OPEN sge_execd PORT (NEEDED FOR qstat, qsub ETC.)
ec2-authorize @sc-masters -p 63232 -P udp
ec2-authorize @sc-masters -p 63232 -P tcp

SHOW PORTS BEING LISTENED AT    
netstat -ntulp | grep sge

CHECK HOST NAME IS BEING LOOKED UP CORRECTLY:
/opt/sge6/utilbin/lx24-x86/gethostname localhost
/opt/sge6/utilbin/lx24-x86/gethostbyname ip-10-124-245-118
    
    Hostname: ip-10-124-245-118.ec2.internal
    Aliases:  
    Host Address(es): 10.124.245.118

/opt/sge6/utilbin/lx24-x86/gethostbyaddr   10.124.245.118
    
    Hostname: ip-10-124-245-118.ec2.internal
    Aliases:  
    Host Address(es): 10.124.245.118 


CHECK CURRENT SSH AND NFS CONNECTIONS:
netstat
    Active Internet connections (w/o servers)
    Proto Recv-Q Send-Q Local Address               Foreign Address             State      
    tcp        0      0 ip-10-127-158-202.ec2:35468 ip-10-124-245-118.ec2.i:ssh ESTABLISHED 
    tcp        0      0 ip-10-127-158-202.ec2.:1017 ip-10-124-245-118.ec2.i:nfs ESTABLISHED 
    tcp        0    532 ip-10-127-158-202.ec2.i:ssh ::ffff:129.171.150.19:44725 ESTABLISHED 
    tcp        0      0 ip-10-127-158-202.ec2.i:ssh ::ffff:129.171.150.19:29646 ESTABLISHED 
    ...
    
    
CHECK REVERSE DNS
host  ip-10-124-245-118
    ip-10-124-245-118.ec2.internal has address 10.124.245.118

nslookup ip-10-124-245-118
    Server:         172.16.0.23
    Address:        172.16.0.23#53
    
    Non-authoritative answer:
    Name:   ip-10-124-245-118.ec2.internal
    Address: 10.124.245.118


** NB: DOES NOT SHOW SGE PORTS **
rpcinfo -p | awk -F " " '{print $3 "\t" $4 "\t" $5}' | sort | uniq | grep -v proto
    
    tcp	111	portmapper
    tcp	2049	nfs
    tcp	32767	mountd
    tcp	36348	status
    tcp	38856	nlockmgr
    udp	111	portmapper
    udp	2049	nfs
    udp	32767	mountd
    udp	39995	status
    udp	49493	nlockmgr


** NB: DOES NOT SHOW SGE PORTS **
CHECK SSH, NFS AND MOUNTD PORTS 
nmap -P0 10.124.245.118

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2011-01-10 10:58 EST
    Interesting ports on ip-10-124-245-118.ec2.internal (10.124.245.118):
    Not shown: 1677 filtered ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    111/tcp  open  rpcbind
    2049/tcp open  nfs

DEFAULT SGE PORTS:
cat /etc/services | grep sge
sge_qmaster     6444/tcp                        # Grid Engine Qmaster Service
sge_qmaster     6444/udp                        # Grid Engine Qmaster Service
sge_execd       6445/tcp                        # Grid Engine Execution Service
sge_execd       6445/udp                        # Grid Engine Execution Service


</entry>
<entry [Mon 2011:05:02 11:58:22 EST] QUEUES>

ON MASTER, SHOW LIST OF QUEUES:

qconf -sql
    all.q


CHECK IF USER root IS INCLUDED IN USER LIST FOR QUEUE all.q
/opt/sge6/bin/lx24-amd64/qconf -sq all.q


ADD 'root' AS OPERATOR/USER:
/opt/sge6/bin/lx24-amd64/qconf -ao root
    root@ip-10-127-158-202.ec2.internal added "root" to operator list
/opt/sge6/bin/lx24-amd64/qconf -am root
    manager "root" already exists

REGISTER root AS A USER OF THE all.q QUEUE
qconf -sconf | grep user_lists
    user_lists                   none


</entry>
<entry [Tue 2011:05:03 17:48:02 EST] qconf COMMANDS TABLE>

Using qconf Command
http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html

To view the basic cluster and host configuration use the qconf -sconf command:

   qconf -sconf  [global]
   qconf -sconf  host_name
To modify the basic cluster or host specific configuration use the following commands:

   qconf -mconf  global
   qconf -mconf  host_name
To view and change the setup of hosts use qconf -XY [file] with the following options:

   =================================================================
                     HOST   execution   admin     submit  host_group 
                       Y      e          h          s
    ACTION        X 
   ----------------------------------------------------------------- 
   add (edit)     a           *          *          *         *
   add (file)     A           *                               *
   delete         d           *          *          *         *
   modify (edit)  m           *                               *
   modify (file)  M           *                               *
   show           s           *          *          *         *
   show list      sYl         *                               *
   ================================================================
    
</entry>

<entry [Tue 2011:05:03 15:54:26 EST] SET RUNNING JOBS TO RESUBMIT USING qalter>
    
https://lists.sdsc.edu/pipermail/npaci-rocks-discussion/2008-July/032460.html

For SGE, you have the "resubmit" option by using the qsub command with the
"-r y" option (NOT the -R, that's for reservation)

qsub -r y test.sh


For jobs that are already in queue, you can do

qalter -r y < job-id >

I'm pretty sure this works on serial jobs. For parallel jobs - you can test it.

    
</entry>


<entry [Thu 2011:05:03 10:41:22 EST] GET FILES BEING USED BY SGE USING lsof | grep sge>
    
    
lsof | grep sge
    sge_execd 2156   sgeadmin    3u     IPv4              10935      0t0        TCP *:sge_execd (LISTEN)
    sge_execd 2156   sgeadmin    4u     IPv4              12513      0t0        TCP ip-10-86-199-110.ec2.internal:51705->ip-10-124-231-156.ec2.internal:sge_qmaster (SYN_SENT)



GET HOST NAME USING $SGE_ROOT/utilbin/$ARCH/gethostname

/opt/sge6/utilbin/lx24-amd64/gethostname 

    Hostname: ip-10-124-231-156.ec2.internal


/opt/sge6/utilbin/lx24-amd64# ll

    -rwxr-xr-x 1 root root 146K 2011-04-22 20:23 adminrun
    -r-s--x--x 1 root root 144K 2011-04-22 20:23 authuser
    -rwxr-xr-x 1 root root  60K 2011-04-22 20:23 berkeley_db_svc
    -rwxr-xr-x 1 root root 227K 2011-04-22 20:23 checkprog
    -rwxr-xr-x 1 root root 144K 2011-04-22 20:23 checkuser
    -rwxr-xr-x 1 root root 7.8K 2011-04-22 20:23 db_archive
    -rwxr-xr-x 1 root root 9.5K 2011-04-22 20:23 db_checkpoint
    -rwxr-xr-x 1 root root 9.6K 2011-04-22 20:23 db_deadlock
    -rwxr-xr-x 1 root root  12K 2011-04-22 20:23 db_dump
    -rwxr-xr-x 1 root root  21K 2011-04-22 20:23 db_load
    -rwxr-xr-x 1 root root  56K 2011-04-22 20:23 db_printlog
    -rwxr-xr-x 1 root root 8.9K 2011-04-22 20:23 db_recover
    -rwxr-xr-x 1 root root  11K 2011-04-22 20:23 db_stat
    -rwxr-xr-x 1 root root 8.4K 2011-04-22 20:23 db_upgrade
    -rwxr-xr-x 1 root root 8.7K 2011-04-22 20:23 db_verify
    -rwxr-xr-x 1 root root 146K 2011-04-22 20:23 echo_raw
    -rwxr-xr-x 1 root root 144K 2011-04-22 20:23 filestat
    -rwxr-xr-x 1 root root 144K 2011-04-22 20:23 fstype
    -rwxr-xr-x 1 root root 532K 2011-04-22 20:23 gethostbyaddr
    -rwxr-xr-x 1 root root 532K 2011-04-22 20:23 gethostbyname
    -rwxr-xr-x 1 root root 532K 2011-04-22 20:23 gethostname
    -rwxr-xr-x 1 root root 146K 2011-04-22 20:23 getservbyname
    -rwxr-xr-x 1 root root 159K 2011-04-22 20:23 infotext
    -rwxr-xr-x 1 root root 429K 2011-04-22 20:23 loadcheck
    -rwxr-xr-x 1 root root  17K 2011-04-22 20:23 now
    -rwxr-xr-x 1 root root 435K 2011-04-22 20:23 openssl
    -rwxr-xr-x 1 root root 213K 2011-04-22 20:23 qrsh_starter
    -rwxr-xr-x 1 root root  21K 2011-04-22 20:23 read_raw
    -r-s--x--x 1 root root  25K 2011-04-22 20:23 rlogin
    -r-s--x--x 1 root root  51K 2011-04-22 20:23 rsh
    -rwxr-xr-x 1 root root 242K 2011-04-22 20:23 rshd
    -rwxr-xr-x 1 root root 1.5M 2011-04-22 20:23 sge_share_mon
    -rwxr-xr-x 1 root root 321K 2011-04-22 20:23 spooldefaults
    -rwxr-xr-x 1 root root 372K 2011-04-22 20:23 spooledit
    -rwxr-xr-x 1 root root 1.5M 2011-04-22 20:23 spoolinit
    -r-s--x--x 1 root root  21K 2011-04-22 20:23 testsuidroot
    -rwxr-xr-x 1 root root  21K 2011-04-22 20:23 uidgid
    -rwxr-xr-x 1 root root 9.5K 2011-04-22 20:23 valid_jvmlib

</entry>
<entry [Mon 2011:04:11 22:21:28 EST] qsub OPTIONS>

#$ -pe mvapich 4 
#$ -M [my email] 
#$ -m ea 
#$ -l h_rt=8:00:00 
#$ -R y 
#$ -j y 
#$ -notify 
#$ -cwd 

</entry>
<entry [Mon 2011:04:11 22:21:28 EST] qsub OPTIONS>

netstat -tulp | grep sge

1. source SGE_ROOT/SGE_CELL/common/settings.sh FILE


Targeting Queue Instances With the qselect Command
The qselect command outputs a list of queue instances. If you specify options, qselect lists only the queue instances that match the criteria that you specify. You can use qselect in combination with the qconf command to target specific queue instances that you want to modify.

Example ? Listing Queues
The following command lists all queue instances on Linux machines:

% qselect -l arch=glinux
The following command lists all queue instances on machines with two CPUs:

% qselect -l num_proc=2


$SGE_ROOT
     |-- $SGE_CELL
         |-- common
         |   |-- act_qmaster          Master hostname 
         |   |-- configuration        Do not edit manually!  See qconf -sconf
         |   |-- ...
         |   |
         |   |-- local_conf
         |       |-- merlinXX
         |       |-- ...
         |   
         |-- spool
         |   |-- qmaster   
         |   |   |-- admin_hosts   
         |   |   |   |-- merlinXX   
         |   |   |   |-- ...
         |   |   |-- exec_hosts   
         |   |   |   |-- merlinXX   
         |   |   |   |-- ...
         |   |   |-- submit_hosts   
         |   |   |   |-- merlinXX   
         |   |   |   |-- ...
         |   |   |-- qinstances
         |   |       |-- all.q
         |   |       |   |-- merlinXX   
         |   |       |   |-- ...
         |   |       |-- long.q
         |   |       |   |-- merlinXX   
         |   |       |   |-- ...
         |   |       |-- background.q
         |   |       |   |-- merlinXX   
         |   |       |   |-- ...
         |   |   
         |   |-- merlinXX   
         |   |-- ...



Example:

  find $SGE_ROOT/$SGE_CELL  -name '*merlin11*' 
  /opt/sge/n1ge6/default/spool/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/qinstances/long.q/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/qinstances/background.q/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/qinstances/all.q/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/admin_hosts/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/install_merlin11_2006-04-26_15:55:50.log
  /opt/sge/n1ge6/default/spool/qmaster/exec_hosts/merlin11
  /opt/sge/n1ge6/default/spool/qmaster/submit_hosts/merlin11
  /opt/sge/n1ge6/default/common/local_conf/merlin11
  
  
GET HOST LIST
http://www.vsa-services.com/sge-tips

qconf -sel	Show a list of all currently-configured execution hosts.

EXAMPLE OUTPUT:
http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html

    qconf -sel
      merlin01
      merlin02
      merlin03
      merlin04
      merlin05
      ...


IANA PORT NUMBERS:
#			   Paul Sterk < paul.sterk&sun.com > March 2006
sge_qmaster	6444/tcp   Grid Engine Qmaster Service
sge_qmaster	6444/udp   Grid Engine Qmaster Service
sge_execd	6445/tcp   Grid Engine Execution Service
sge_execd	6445/udp   Grid Engine Execution Service

GET PORT IN /etc/services
cat /etc/services | grep 6444

    sge_qmaster	6444/tcp			# Grid Engine Qmaster Service
    sge_qmaster	6444/udp			# Grid Engine Qmaster Service

</entry>
<entry [Thu 2011:05:05 10:43:12 EST] qconf COMMANDS CHEAT SHEET>
    
For a detailed list of available qconf commands, see the qconf(1) man page.

Complex Configuration

qconf -sc	Show the current complex configuration.
qconf -mc	Modify the complex configuration using an editor.
qconf -Mc filename	Modify the current complex configuration by overwriting the current configuration as specified by the file filename.
For more information, see How to Configure the Complex From the Command Line.

Calendar Configuration

qconf -scal calendarname	Show the configuration for the specified calendar.
qconf -scall	Show a list of all currently configured calendars.
qconf -acal calendarname	Add a new calendar definition to the Sun Grid Engine environment.
qconf -Acal filename	Add a new calendar definition to the Sun Grid Engine environment from the file filename.
qconf -mcal calendarname	Modify the specified calendar configuration using an editor.
qconf -Mcal filename	Modify the current calendar configuration by overwriting the current configuration as specified by filename.
qconf -dcal calendarname	Delete a calendar.
For more information, see How to Configure Queue Calendars From the Command Line.

Checkpointing Environment Configuration

qconf -sckpt checkpointname	Show the configuration of the specified checkpointing environment.
qconf -sckptl	Show a list of all currently configured checkpointing environments.
qconf -ackpt checkpointname	Add a checkpointing environment to the Sun Grid engine environment.
qconf -Ackpt filename	Add a checkpointing environment from the file filename.
qconf -mckpt checkpointname	Modify the specified checkpointing environment using an editor.
qconf -Mckpt filename	Modify a checkpointing environment from file filename.
qconf -dckpt checkpointname	Delete a checkpointing environment.
For more information, see How to Configure Checkpointing Environments From the Command Line.

Cluster Configuration

qconf -sconf [host,...|global]	Show a local host configuration or the global cluster configuration.
qconf -sconfl	Show a list of all currently configured hosts.
qconf -aconf host,...	Add a host configuration.
qconf -Aconf filelist	Add the configuration specified in the files enlisted in the comma-separated filelist.
qconf -mconf [host,...|global]	Modify one or more local host configurations, or modify the global cluster configuration.
qconf -Mconf filelist	Modify the configurations specified in the files enlisted in the comma separated filelist.
qconf -dconf host,...	Delete one or more hosts from the configuration list.
For more information, see How to Configure Clusters From the Command Line.

Event Client Configuration

qconf -secl	Show event client list.
qconf -kec [eventclientname,...|all]	Shuts down event clients registered at the master daemon.

Host Configuration

qconf -se host	Show the configuration for the specified execution host.
qconf -sel	Show a list of all currently-configured execution hosts.
qconf -ae	Add an execution host.
qconf -Ae filename	Add an execution host from file filename.
qconf -me host	Modify the specified execution host using an editor.
qconf -Me filename	Modify an execution host from file filename.
qconf -de host,...	Delete one or more execution hosts.
qconf -sh	Show a list of all currently-configured administrative hosts.
qconf -ah host,...	Add one or more administrative hosts.
qconf -dh host,...	Delete one or more administrative hosts from the administrative host list.
qconf -ss	Show a list of all currently-configured submit hosts.
qconf -as host,...	Add one or more submit hosts.
qconf -ds host,...	Delete a submit host.
For more information, see Configuring Hosts.

Host Group Configuration

qconf -shgrp groupname	Show the configuration for the specified host group.
qconf -shgrpl	Show a list of all currently configured host groups.
qconf -ahgrp hostgroupname	Add a host group.
qconf -Ahgrp filename	Add a host group configuration from file filename.
qconf -mhgrp hostgroupname	Modify the specified host group using an editor.
qconf -Mhgrp filename	Modify a host group configuration from file filename.
For more information, see How to Configure Host Groups From the Command Line.

Parallel Environment Configuration

qconf -sp pename	Show the configuration for the specified parallel environment.
qconf -spl	Show a list of all currently configured parallel environments.
qconf -ap pename	Add a new parallel environment.
qconf -Ap filename	Add a parallel environment from file filename.
qconf -mp pename	Modify the specified parallel environment using an editor.
qconf -Mp filename	Modify a parallel environment from file filename.
qconf -dp pename	Delete the specified parallel environment.
For more information, see How to Configure Parallel Environments From the Command Line.

Project Configuration

qconf -sprj projectname	Show the configuration for the specified project.
qconf -sprjl	Show a list of all currently configured projects.
qconf -aprj	Add a new project.
qconf -Aprj filename	Add a new project from file filename.
qconf -mprj projectname	Modify the specified project using an editor.
qconf -Mprj filename	Modify a project from file filename.
qconf -dprj projectname	Delete a project.
For more information, see How to Configure Projects From the Command Line.


Queue Configuration

The most flexible way to automate the configuration of queue instances is to use the qconf command with the qselect command. With the combination of these commands, you can build up your own custom administration scripts.

qconf -sq wc_queue_list	Show one or multiple cluster queues or queue instances.
qconf -sql	Show a list of all currently configured cluster queues.
qconf -aq queuename	Add a new queue.
qconf -Aq filename	Add a queue from file filename.
qconf -mq queuename	Modify the specified queue using an editor.
qconf -Mq filename	Modify a queue from file filename.
qconf -dq queuename	Delete a queue.
	-purge allows you to delete an entire list attribute from the underlying queue instances of a cluster queue, whereas -dattr only deletes a value or an item from a list attribute.
For more information, see Configuring Queues.

Scheduler Configuration

qconf -ssconf	Show the current scheduler configuration.
qconf -msconf	Modify the scheduler configuration using an editor.
qconf -tsm	Trigger scheduler monitoring.
For more information, see Managing the Scheduler.

Sharetree Configuration

qconf -sstree	Show the sharetree.
qconf -sstnode nodelist	Show one or more sharetree node.
qconf -rsstnode nodelist	Show one or more sharetree nodes and their children.
qconf -astree	Add a sharetree.
qconf -Astree filename	Add a sharetree from filename.
qconf -astnode nodelist	Add one or more sharetree nodes.
qconf -mstree	Modify a sharetree.
qconf -Mstree filename	Modify a sharetree from filename.
qconf -dstree	Delete a sharetree.
qconf -dstnode nodelist	Delete or more sharetree nodes.
User Configuration

qconf -suser username,...	Show the configuration for one or more users.
qconf -suserl	Show a list of all currently-configured users.
qconf -auser	Add a user to the list of registered users.
qconf -Auser filename	Add a user from file filename.
qconf -muser username	Modify the specified user configuration using an editor.
qconf -Muser filename	Modify a user from file filename.
qconf -duser username,...	Delete one or more users.
qconf -sm	Show a list of all currently-configured managers.
qconf -am username	Add a user to the manager list.
qconf -dm username,...	Delete one or more managers.
qconf -so	Show a list of all currently-configured operators.
qconf -ao username	Adds a user to the operator list.
qconf -do username,...	Deletes one or more operators.
For more information, see Configuring User Access.

User Access List Configuration

qconf -su aclname [,...]	Displays the configuration for the specified access list.
qconf -sul	Displays a list of all currently configured user access lists.
qconf -au username [,...] accesslistname [,...]	Adds a user or users to an access list or lists.
qconf -Au filename	Adds a user access list from file filename.
qconf -mu aclname	Opens an editor to modify the specified access list configuration.
qconf -Mu filename	Modifies a user access list from file filename.
qconf -du username [,...] aclname [,...]	Deletes a user or users to an access list or lists.
qconf -dul aclname [,...]	Deletes one or more user access lists.
    
    
</entry>

<entry [Thu 2011:05:05 10:43:27 EST] USE #$ -pe threaded N TO ALLOCATE MULTIPLE CPUS TO JOB>
 
SPECIFY 2 CPUS PER JOB:

NB: REMEMBER TO ADD SLOTS TO QUEUE AND arusers TO user_lists IN threaded.conf


    #!/bin/tcsh
    #
    #$ -S /bin/tcsh -cwd
    #$ -o simple.out -j y
    #$ -pe threaded 2
    cd /home/username/thread/simple
    myprog


SPECIFY A RANGE OF CPUS:

    #!/bin/tcsh
    #
    #$ -S /bin/tcsh -cwd
    #$ -o simple.out -j y
    #$ -pe threaded 2-8
    cd /home/username/thread/simple
    myprog




</entry>

<entry [Fri 2011:04:08 14:27:33 EST] SGE CONFIGURATION COMMANDS>

ALSO SEE:

man queue_conf


Configuring Queues From the Command Line
http://wikis.sun.com/display/GridEngine/Configuring+Queues

To configure queues from the command line, type the following command with the appropriate options:

# qconf < options>
The qconf command has the following options:

 qconf -aq [cluster-queue]
The -aq option (add cluster queue) displays an editor containing a template for cluster queue configuration. The editor is either the default vi editor or an editor defined by the EDITOR environment variable. If cluster-queue is specified, the configuration of this cluster queue is used as template. Configure the cluster queue by changing the template and then saving it. See the queue_conf(5) man page for a detailed description of the template entries to change.
 qconf -Aq filename
The -Aq option (add cluster queue from file) uses the file filename to define a cluster queue. The definition file might have been produced by the qconf -sq queue command.
 qconf -cq queue [,...]
The -cq option (clean queue) cleans the status of the specified cluster queues, queue domains, or queue instances to be idle and free from running jobs. The status is reset without respect to the current status. This option is useful for eliminating error conditions, but you should not use it in normal operation mode.
 qconf -dq cluster-queue [,...]
The -dq option (delete cluster queue) deletes the cluster queues specified in the argument list from the list of available queues.
 qconf -mq cluster-queue
The -mq option (modify cluster queue) modifies the specified cluster queue. The -mq option displays an editor containing the configuration of the cluster queue to be changed. The editor is either the default vi editor or an editor defined by the EDITOR environment variable. Modify the cluster queue by changing the configuration and then saving your changes.
 qconf -Mq filename
The -Mq option (modify cluster queue from file) uses the file filename to define the modified cluster queue configuration. The definition file might have been produced by the qconf -sq queue command and subsequent modification.
 qconf -sq [queue[,...]]
The -sq option (show queue) without arguments displays the default template cluster queue, queue domain, or queue instance configuration. The -sq option with arguments displays the current configuration of the specified queues.
 qconf -sql
The -sql option (show cluster queue list) displays a list of all currently configured cluster queues.
The qconf command provides the following set of options that you can use to change specific queue attributes:

-aattr ? Add attributes
-Aattr ? Add attributes from a file
-dattr ? Delete attributes
-Dattr ? Delete attributes listed in a file
-mattr ? Modify attributes
-Mattr ? Modify attributes from a file
-rattr ? Replace attributes
-Rattr ? Replace attributes from a file
-sobjl ? Show list of configuration objects
For a description of how to use these options and for some examples of their use, see Using Files to Modify Queues, Hosts, and Environments. For detailed information about these options, see the qconf(1) man page.

    
</entry>


<entry [Fri 2011:04:08 00:34:09 EST] INSTALL GANGLIA>

INSTALL GANGLIA
aptitude search ganglia
    p   ganglia-monitor          - cluster monitoring toolkit - node daemon
    p   ganglia-webfrontend      - cluster monitoring toolkit - web front-end
    p   libganglia1              - cluster monitoring toolkit - shared libraries
    p   libganglia1-dev          - cluster monitoring toolkit - development libraries  

apt-get install ganglia-monitor ganglia-webfrontend libganglia1 libganglia1-dev


INSTALL SGE 
gridengine-master   Distributed resource management - Master Server
gridengine-exec     Distributed resource management - Execution Server
gridengine-common   Distributed resource management - common files (INSTALLED WITH ABOVE)
gridengine-client   Utilities for Grid Engine queue management
gridengine-qmon     Graphical utilities for Grid Engine queue management

UBUNTU SOFTWARE CENTER OR ON THE COMMAND LINE:
sudo apt-get install gridengine-master gridengine-exec gridengine-client gridengine-qmon gridengine-common


netstat -anp | grep 644

tcp        0      0 0.0.0.0:6444            0.0.0.0:*               LISTEN      6918/sge_qmaster
tcp        0      0 0.0.0.0:6445            0.0.0.0:*               LISTEN      3067/sge_execd  
tcp        0      0 192.168.0.102:42289     192.168.0.102:6444      ESTABLISHED 3067/sge_execd  
tcp        0      0 192.168.0.102:6444      192.168.0.102:42289     ESTABLISHED 6918/sge_qmaster

AND THERE ARE RUNNING INSTANCES OF execd AND qmaster:

ps aux | grep sge

    sgeadmin  3067  0.0  0.0  57332  2008 ?        Sl   19:19   0:03 /usr/lib/gridengine/sge_execd
    sgeadmin  6918  0.0  0.1 134848  4804 ?        Sl   22:14   0:00 /usr/lib/gridengine/sge_qmaster
    root      7178  0.0  0.0      0     0 pts/0    Z    22:21   0:00 [sge_execd] < defunct>
    root      7262  0.0  0.0   8956   876 pts/1    S+   22:31   0:00 grep --color=auto sge




LIST EXECUTION HOSTS
qconf -sel
    hp

LIST SUBMIT HOSTS
qconf -sh
    hp
    

SEARCHED FOR BOOTSTRAP SCRIPT:

head /var/lib/gridengine/default/common/bootstrap

    Version: 6.2
    admin_user              sgeadmin
    default_domain          none
    ignore_fqdn             false
    spooling_method         berkeleydb
    spooling_lib            libspoolb
    spooling_params         /var/spool/gridengine/spooldb
    binary_path             /usr/sbin
    qmaster_spool_dir       /var/spool/gridengine/qmaster
    security_mode           none



NB: CAN ALSO PUT ENV VARIABLES INTO env_keep LIST IN /etc/sudoers:

visudo

Defaults env_keep += "SGE_CELL SGE_ARCH SGE_EXECD_PORT SGE_QMASTER_PORT SGE_ROOT"



ADDED www-data TO USERS:

User Configuration -> type: www-data -> Add
User Configuration -> Userset -> Highlight userset arusers --> Modify -> Input user name in User/Group field -> Click Ok to finish



EDIT CONFIG FILE:

export EDITOR="emacs -nw"
qconf -mq default

    qname                 default
    hostlist              hp
    ...

QCONF COMMANDS:

qconf -sel
    Show the list of execution hosts
    
qconf -sh
    Show administrative hosts 

Add administrative hosts 
   # qconf -ah < hostname >



Killing Daemons From the Command Line

qconf -ke[j] {< hostname>[,...] | all}
qconf -ks
qconf -km


    
SGE Hosts
http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_hosts.html
view the basic cluster and host configuration use the qconf -sconf command:
   qconf -sconf  [global]
   qconf -sconf  host_name
To modify the basic cluster or host specific configuration use the following commands:
   qconf -mconf  global
   qconf -mconf  host_name
To view and change the setup of hosts use qconf -XY [file] with the following options:
   =================================================================
                     HOST   execution   admin     submit  host_group 
                       Y      e          h          s
    ACTION        X 
   ----------------------------------------------------------------- 
   add (edit)     a           *          *          *         *
   add (file)     A           *                               *
   delete         d           *          *          *         *
   modify (edit)  m           *                               *
   modify (file)  M           *                               *
   show           s           *          *          *         *
   show list      sYl         *                               *
   ================================================================
   
qconf -help
-----------
/opt/sge6/bin/lx24-amd64/qconf -help    
GE 6.2u5
usage: qconf [options]
   [-aattr obj_nm attr_nm val obj_id_list]  add to a list attribute of an object
   [-Aattr obj_nm fname obj_id_list]        add to a list attribute of an object
   [-acal calendar_name]                    add a new calendar
   [-Acal fname]                            add a new calendar from file
   [-ackpt ckpt_name]                       add a ckpt interface definition
   [-Ackpt fname]                           add a ckpt interface definition from file
   [-aconf host_list]                       add configurations
   [-Aconf file_list]                       add configurations from file_list
   [-ae [exec_server_template]]             add an exec host using a template
   [-Ae fname]                              add an exec host from file
   [-ah hostname_list]                      add an administrative host
   [-ahgrp group]                           add new host group entry
   [-Ahgrp file]                            add new host group entry from file
   [-arqs [rqs_list]]                       add resource quota set(s)
   [-Arqs fname]                            add resource quota set(s) from file
   [-am user_list]                          add user to manager list
   [-ao user_list]                          add user to operator list
   [-ap pe-name]                            add a new parallel environment
   [-Ap fname]                              add a new parallel environment from file
   [-aprj]                                  add project
   [-Aprj fname]                            add project from file
   [-aq [queue_name]]                       add a new cluster queue
   [-Aq fname]                              add a queue from file
   [-as hostname_list]                      add a submit host
   [-astnode node_shares_list]              add sharetree node(s)
   [-astree]                                create/modify the sharetree
   [-Astree fname]                          create/modify the sharetree from file
   [-at thread_name]                        add/start qmaster thread
   [-au user_list listname_list]            add user(s) to userset list(s)
   [-Au fname]                              add userset from file
   [-auser]                                 add user
   [-Auser fname]                           add user from file
   [-clearusage]                            clear all user/project sharetree usage
   [-cq destin_id_list]                     clean queue
   [-dattr obj_nm attr_nm val obj_id_list]  delete from a list attribute of an object
   [-Dattr obj_nm fname obj_id_list]        delete from a list attribute of an object
   [-dcal calendar_name]                    delete calendar
   [-dckpt ckpt_name]                       delete ckpt interface definition
   [-dconf host_list]                       delete local configurations
   [-de host_list]                          delete exec host
   [-dh host_list]                          delete administrative host
   [-dhgrp group]                           delete host group entry
   [-drqs rqs_list]                         delete resource quota set(s)
   [-dm user_list]                          delete user from manager list
   [-do user_list]                          delete user from operator list
   [-dp pe-name]                            delete parallel environment
   [-dprj project_list]                     delete project
   [-dq destin_id_list]                     delete queue
   [-ds host_list]                          delete submit host
   [-dstnode node_list]                     delete sharetree node(s)
   [-dstree]                                delete the sharetree
   [-du user_list listname_list]            delete user(s) from userset list(s)
   [-dul listname_list]                     delete userset list(s) completely
   [-duser user_list]                       delete user(s)
   [-help]                                  print this help
   [-ke[j] host_list                        shutdown execution daemon(s)
   [-k{m|s}]                                shutdown master|scheduling daemon
   [-kec evid_list]                         kill event client
   [-kt thread_name]                        kill qmaster thread
   [-mattr obj_nm attr_nm val obj_id_list]  modify an attribute (or element in a sublist) of an object
   [-Mattr obj_nm fname obj_id_list]        modify an attribute (or element in a sublist) of an object
   [-mc ]                                   modify complex attributes
   [-mckpt ckpt_name]                       modify a ckpt interface definition
   [-Mc fname]                              modify complex attributes from file
   [-mcal calendar_name]                    modify calendar
   [-Mcal fname]                            modify calendar from file
   [-Mckpt fname]                           modify a ckpt interface definition from file
   [-mconf [host_list|global]]              modify configurations
   [-Mconf file_list]                       modify configurations from file_list
   [-me server]                             modify exec server
   [-Me fname]                              modify exec server from file
   [-mhgrp group]                           modify host group entry
   [-Mhgrp file]                            modify host group entry from file
   [-mrqs [rqs_list]]                       modify resource quota set(s)
   [-Mrqs fname [rqs_list]]                 modify resource quota set(s) from file
   [-mp pe-name]                            modify a parallel environment
   [-Mp fname]                              modify a parallel environment from file
   [-mprj project]                          modify a project
   [-Mprj fname]                            modify project from file
   [-mq queue]                              modify a queue
   [-Mq fname]                              modify a queue from file
   [-msconf]                                modify scheduler configuration
   [-Msconf fname]                          modify scheduler configuration from file
   [-mstnode node_shares_list]              modify sharetree node(s)
   [-Mstree fname]                          modify/create the sharetree from file
   [-mstree]                                modify/create the sharetree
   [-mu listname_list]                      modify the given userset list
   [-Mu fname]                              modify userset from file
   [-muser user]                            modify a user
   [-Muser fname]                           modify a user from file
   [-purge obj_nm3 attr_nm objectname]      deletes attribute from object_instance
   [-rattr obj_nm attr_nm val obj_id_list]  replace a list attribute of an object
   [-Rattr obj_nm fname obj_id_list]        replace a list attribute of an object
   [-sc]                                    show complex attributes
   [-scal calendar_name]                    show given calendar
   [-scall]                                 show a list of all calendar names
   [-sckpt ckpt_name]                       show ckpt interface definition
   [-sckptl]                                show all ckpt interface definitions
   [-sconf [host_list|global]]              show configurations
   [-sconfl]                                show a list of all local configurations
   [-se server]                             show given exec server
   [-secl]                                  show event client list
   [-sel]                                   show a list of all exec servers
   [-sep]                                   show a list of all licensed processors
   [-sh]                                    show a list of all administrative hosts
   [-shgrp group]                           show host group
   [-shgrp_tree group]                      show host group and used hostgroups as tree
   [-shgrp_resolved group]                  show host group with resolved hostlist
   [-shgrpl]                                show host group list
   [-sds]                                   show detached settings
   [-srqs [rqs_list]]                       show resource quota set(s)
   [-srqsl]                                 show resource quota set list
   [-sm]                                    show a list of all managers
   [-so]                                    show a list of all operators
   [-sobjl obj_nm2 attr_nm val]             show objects which match the given value
   [-sp pe-name]                            show a parallel environment
   [-spl]                                   show all parallel environments
   [-sprj project]                          show a project
   [-sprjl]                                 show a list of all projects
   [-sq [destin_id_list]]                   show the given queue
   [-sql]                                   show a list of all queues
   [-ss]                                    show a list of all submit hosts
   [-sss]                                   show scheduler state
   [-ssconf]                                show scheduler configuration
   [-sstnode node_list]                     show sharetree node(s)
   [-rsstnode node_list]                    show sharetree node(s) and its children
   [-sst]                                   show a formated sharetree
   [-sstree]                                show the sharetree
   [-su listname_list]                      show the given userset list
   [-suser user_list]                       show user(s)
   [-sul]                                   show a list of all userset lists
   [-suserl]                                show a list of all users
   [-tsm]                                   trigger scheduler monitoring
complex_list            complex[,complex,...]
destin_id_list          queue[,queue,...]
hostname_list           hostname[,hostname,...]
listname_list           listname[,listname,...]
rqs_list                rqs_name[,rqs_name,...]
node_list               node_path[,node_path,...]
node_path               [/]node_name[[/.]node_name...]
node_shares_list        node_path=shares[,node_path=shares,...]
user_list               user[,user,...]
obj_nm                  "queue"|"exechost"|"pe"|"ckpt"|"hostgroup"|"resource_quota"
attr_nm                 (see man pages)
obj_id_list             objectname [ objectname ...]
project_list            project[,project,...]
evid_list               all | evid[,evid,...]
host_list               all | hostname[,hostname,...]
obj_nm2                 "queue"|"queue_domain"|"queue_instance"|"exechost"
obj_nm3                 "queue"
thread_name             "scheduler"|"jvm"


qmaster USAGE
--------------
/etc/init.d/sgemaster.starcluster restart
Grid Engine start/stop script. Valid parameters are:
   (no parameters): start qmaster and shadow daemon if applicable
   "start"        dto.
   "stop"         shutdown local Grid Engine processes and jobs
   "-qmaster"     only start/stop qmaster (if applicable)
   "-shadowd"     only start/stop shadowd (if applicable)
   "-migrate"     shutdown qmaster if it's running on another
                    host and restart it on this host
                    Migration only works if this host is an admin host
   "-nosmf"       force no SMF
Only one of the parameters "start", "stop" or "softstop" is allowed.
Only one of the parameters beginning  with "-" is allowed. Does not 
apply to -nosmf.
Default argument is "start" for all components.
Default for "stop" is shutting down all components.

MODIFY CLUSTER CONFIG
---------------------
Modifying the Basic Cluster Configurations From the Command Line
Note –
You must be an administrator to use the qconf command to change cluster configurations.
Type one of the following commands:
% qconf -mconf global
% qconf -mconf host
The qconf -mconf global command modifies the global configuration.
The qconf -mconf host command modifies the local configuration of the specified execution host or master host.
The qconf commands that are described here are examples of the many available qconf commands. See the qconf(1) man page for others.

