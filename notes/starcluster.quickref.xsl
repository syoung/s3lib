starcluster.quickref

<entry [Mon 2012:09:10 22:40:57 EST] PLUGIN TESTING admin-microcluster>

# SGE.PY
cd /home/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /home/admin/.starcluster/admin-microcluster.config \
shell

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'sge', 'admin-microcluster')

reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'admin-microcluster')

# AUTOMOUNT.PY
cd /home/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /home/admin/.starcluster/admin-microcluster.config \
shell

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'automount', 'admin-microcluster')

reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'admin-microcluster')

# STARTUP.PY
cd /home/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /home/admin/.starcluster/admin-microcluster.config \
shell

cfg.get_plugin('startup')
import startup; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'startup', 'admin-microcluster')

reload(startup); cluster.ClusterManager.run_plugin(clus, 'startup', 'admin-microcluster')

</entry>

<entry [Sun 2012:09:09 02:46:21 EST] MODIFICATION: ADDED --logfile OPTION>

ADDED THE FOLLOWING LINES

cli.py, LINE 93
---------------
        ####  CHANGED
        """
            CHANGE LOG FILE TO USER-SUPPLIED LOCATION IF PROVIDED
        """
        if gopts.LOGFILE:
            static.DEBUG_FILE = gopts.LOGFILE
            #### REM: THIS REMOVES starcluster.logger.ConsoleLogger HANDLER
            while len(log.handlers) > 0:
                log.removeHandler(log.handlers[0])
            logger.configure_sc_logging()


cli.py, LINE 160
----------------

        gparser.add_option("-l", "--logfile", dest="LOGFILE", action="store",
                           metavar="FILE",
                           help="use alternate debug log file (default: %s)" % \
                           static.DEBUG_FILE)


    
</entry>
<entry [Tue 2012:07:03 01:38:22 EST] PLUGIN TESTING admin-smallcluster>
#### NOTE: UPDATE STARCLUSTER VERSION!!!

#### SGE
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/admin-smallcluster.config \
shell

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'sge', 'admin-smallcluster')

reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'admin-smallcluster')

#### AUTOMOUNT
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/admin-smallcluster.config \
shell

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'automount', 'admin-smallcluster')

reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'admin-smallcluster')

#### STARTUP
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/admin-smallcluster.config \
shell

cfg.get_plugin('startup')
import startup; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'startup', 'admin-smallcluster')

reload(startup); cluster.ClusterManager.run_plugin(clus, 'startup', 'admin-smallcluster')

    
    
</entry>
<entry [Sun 2012:03:18 03:16:43 EST] RUN bal COMMAND AND OPTIONS>

starcluster bal

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
/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config start admin-smallcluster &> /nethome/admin/.starcluster/admin-smallcluster-starcluster.out

START LOAD BALANCER

# DEBUG 
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config bal admin-smallcluster -m 5 -n 1 -i 30 -w 100 -s 30 -k 10


# NORMAL
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config bal admin-smallcluster -m 5 -n 1 -i 30 -w 300 -s 300 -k 10


    
</entry>
<entry [Sun 2011:09:04 08:50:54 EST] MODIFICATION: FIXED EXPAT ERROR WITH qhost>

SUMMARY:

1. REMOVED '-q all.q' FROM qstat COMMAND AND REPLACED WITH self.queue_name

2. ADDED ENVIRONMENT VARIABLES TO SYSTEM COMMANDS

3. ADDED TIME STAMP

SEE starcluster
[Sat 2011:06:18 01:20:52 EST]
FIXED commlib ERROR WITH qstat -q all.q

EDITED

            
            #qacct_cmd = 'source /etc/profile && qacct -j -b ' + qatime
            #qstat_cmd = 'source /etc/profile && qstat -q all.q -u \"*\" -xml'
            #qhostxml = '\n'.join(master.ssh.execute(
            #    'source /etc/profile && qhost -xml', log_output=True))

            self.qmasterport=   os.environ['SGE_QMASTER_PORT']
            self.execdport  =   os.environ['SGE_EXECD_PORT']    
            self.root       =   os.environ['SGE_ROOT']
            self.cell       =   os.environ['SGE_CELL']
            
            #log.info("balancers.sge.__init__.__init__    self.qmasterport: %s" % self.qmasterport)
            #log.info("balancers.sge.__init__.__init__    self.execdport: %s" % self.execdport)
            #log.info("balancers.sge.__init__.__init__    self.root: %s" % self.root)
            #log.info("balancers.sge.__init__.__init__    self.cell: %s" % self.cell)
            p = os.popen("date")
            log.info(p.read())
            
            envars = "export SGE_QMASTER_PORT=" + self.qmasterport + " && " \
                + " export SGE_EXECD_PORT=" + self.execdport + " && " \
                + " export SGE_ROOT=" + self.root + " && " \
                + " export SGE_CELL=" + self.cell + " && "
            qacct_cmd = envars + self.root + '/bin/lx24-amd64/qacct -j -b ' + qatime
            qstat_cmd = envars + self.root + '/bin/lx24-amd64/qstat ' + \
                        ' -q ' + self.queue_name + ' -u \"*\" -xml'
            log.info("qacct_cmd: %s" % qacct_cmd)
            log.info("qstat_cmd: %s" % qstat_cmd)
            qhostxml = '\n'.join(master.ssh.execute(
                envars + self.root + '/bin/lx24-amd64/qhost -xml', log_output=True))



NOTES
-----

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
<entry [Mon 2011:08:29 03:59:34 EST] MODIFICATION: THE CONFIG FILE IS UNDEFINED (AND DEFAULTED TO 'config')>

PROBLEM: commands.start.addons WAS NOT PASSING ANY ARGUMENTS TO config.StarClusterConfig

SOLUTION: ADDED THESE LINES

cli.py, LINE 24:
----------------

"""
ADD utils TO STORE CONFIG FILE FOR USE BY commands.start.addons
"""
from starcluster import utils


cli.py, LINE 90:
----------------

        """
            ADDED config_file TO utils FOR LATER USE IN commands.start.addons
        """
        if gopts.CONFIG.config_file:
            utils.config_file = gopts.CONFIG.config_file


commands/start.py, LINE 15:
---------------------------

"""
ADD utils TO GET utils.config_file STORED BY cli.parse_subcommands
"""
from starcluster import utils


commands/start.py, LINE 49
---------------------------

        #cfg = config.StarClusterConfig().load()
        cfg = config.StarClusterConfig(utils.config_file).load()

    
</entry>
<entry [Fri 2011:08:26 00:09:33 EST] FIXED PROBLEM: bal IS USING NUMBER OF JOBS INSTEAD OF NUMBER OF TASKS TO DECIDE ON ADDING NODES>
    
    
>>> Oldest job is from 2011-05-16 18:29:02. # queued jobs = 1. # hosts = 2.
>>> Avg job duration = 949 sec, Avg wait time = 719 sec.
>>> starcluster.balancers.sge.__init__.get_queued_jobs()
>>> starcluster.balancers.sge.__init__.get_queued_jobs    j: {'tasks': u'3', 'job_state': u'running', 'queue_name': u'Project1-Workflow1@node001', 'JB_job_number': u'7', 'state': u'r', 'slots': u'1'}
>>> starcluster.balancers.sge.__init__.get_queued_jobs    j: {'tasks': u'4,5', 'job_state': u'pending', 'JB_job_number': u'7', 'JB_submission_time': u'2011-05-16T18:29:02', 'state': u'qw', 'slots': u'1'}
>>> starcluster.balancers.sge.__init__.get_queued_jobs    queued: [{'tasks': u'4,5', 'job_state': u'pending', 'JB_job_number': u'7', 'JB_submission_time': u'2011-05-16T18:29:02', 'state': u'qw', 'slots': u'1'}]

</entry>
<entry [Thu 2011:08:25 23:55:59 EST] LOCATION OF STARCLUSTER INSTALLATION ON HEADNODE>

/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999
    
</entry>
<entry [Thu 2011:08:25 21:50:15 EST] MODIFICATION: ADDED queue_name OPTION BECAUSE bal WAS ONLY CHECKING FOR JOBS IN THE all.q QUEUE>

PROBLEM: bal WAS ONLY CHECKING FOR JOBS IN THE all.q QUEUE>
    
SOLUTION:

1. ADD queue_name TO ARGUMENTS FOR starcluster/balancers/sge/__init__.py

2. ADD EXTRA ARGUMENT IN starcluster/balancers/commands/loadbalance.py

3. CALL bal WITH THE EXTRA --queue_name ARGUMENT

cd /nethome/admin/.starcluster/plugins
envars
/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 1 -i 30 -w 100 -s 30 -k 10 --queue_name Project1-Workflow1



VERSION 0.92rc2
---------------

1. EDITED starcluster/balancers/sge/__init__.py:

    #def __init__(self, interval=60, max_nodes=5, wait_time=900,
    #             add_pi=1, kill_after=45, stab=180, lookback_win=3,
    #             min_nodes=1, allow_master_kill=False, plot_stats=False,
    #             plot_output_dir=None, dump_stats=False, stats_file=None):
    def __init__(self, interval=60, max_nodes=5, wait_time=900,
                 add_pi=1, kill_after=45, stab=180, lookback_win=3,
                 min_nodes=1, allow_master_kill=False, plot_stats=False,
                 plot_output_dir=None, dump_stats=False, stats_file=None,
                 queue_name="all.q"):

2. EDITED starcluster/balancers/commands/loadbalance.py:

        #### ADDED EXTRA OPTION --queue_name
        parser.add_option("-q", "--queue_name", dest="queue_name",
                          action="store", type="str", default=None,
                          help="Name of the queue (default: all.q)")


VERSION 0.92rc1
---------------

1. EDITED starcluster/balancers/sge/__init__.py:

    #def __init__(self, interval=60, max_nodes=5, wait_time=900,
    #             add_pi=1, kill_after=45, stab=180, lookback_win=3,
    #             min_nodes=1, allow_master_kill=False, plot_stats=False,
    #             plot_output_dir=None, dump_stats=False, stats_file=None):
    def __init__(self, interval=60, max_nodes=5, wait_time=900,
                 add_pi=1, kill_after=45, stab=180, lookback_win=3,
                 min_nodes=1, allow_master_kill=False, plot_stats=False,
                 plot_output_dir=None, dump_stats=False, stats_file=None,
                 queue_name="all.q"):

2. EDITED starcluster/balancers/commands/loadbalance.py:

        #### ADDED EXTRA OPTION --queue_name
        parser.add_option("-q", "--queue_name", dest="queue_name",
                          action="store", type="str", default=None,
                          help="Name of the queue (default: all.q)")


VERSION 110202bal
-----------------

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
                          
                          


</entry>
<entry [Tue 2011:05:10 02:05:31 EST] REMOVE AN EXECUTION HOST TEMPORARILY FROM A QUEUE>
    
delete the execution host:
qconf -de node001

add a host back into the execution list:
qconf -ae node001

OR:

If you're running 6.1 or better, This process will stop new jobs from being scheduled to the machine and allow the currently running jobs to complete:

Create a new hostgroup called @disabled:
qconf -ahgrp @disabled

Create a new resource quota set with "limit hosts @disabled to slots=0":
qconf -arqs

To disable a host, add it to the host group:
qconf -aattr hostgroup hostlist MYHOST @disabled

To reenable the host, remove it from the host group:
qconf -dattr hostgroup hostlist MYHOST @disabled

</entry>
<entry [Tue 2011:05:10 01:08:28 EST] ENABLE SCHEDULING INFORMATION>

ON MASTER:
export EDITOR=/usr/bin/emacs
qconf -msconf

    schedd_job_info                   true

qconf -ke all
qconf -km
/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd
    
</entry>
<entry [Mon 2011:05:09 15:17:50 EST] PLUGIN TESTING syoung-microcluster>
# NOTE: UPDATE STARCLUSTER VERSION!!!
# SGE.PY
cd /home/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /home/admin/.starcluster/syoung-microcluster.config \
shell

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-microcluster')

reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-microcluster')

# AUTOMOUNT.PY
cd /home/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /home/admin/.starcluster/syoung-microcluster.config \
shell

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-microcluster')

reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-microcluster')

# STARTUP.PY
cd /home/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /home/admin/.starcluster/syoung-microcluster.config \
shell

cfg.get_plugin('startup')
import startup; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'startup', 'syoung-microcluster')

reload(startup); cluster.ClusterManager.run_plugin(clus, 'startup', 'syoung-microcluster')

</entry>
<entry [Thu 2011:05:05 10:50:58 EST] ERROR MESSAGES>
    
MOUNT REQUESTS
grep sge /var/log/syslog
    Apr 22 20:24:26 ip-10-86-250-251 mountd[626]: authenticated mount request from 10.86.193.30:886 for /opt/sge6 (/opt/sge6)
    May  2 07:04:47 domU-12-31-38-01-C5-51 mountd[575]: authenticated mount request from 10.126.49.153:730 for /opt/sge6 (/opt/sge6)


RUNTIME ERROR LOG
tail /tmp/starcluster-debug-root.log


qconf COMMANDS OUTPUT IN /tmp/install.*
---------------------------------------

cat /tmp/install.29508

    ...
    Cannot contact qmaster. The command failed:
    
       ./bin/lx24-amd64/qconf -sh
    
    The error message was:
    
       error: commlib error: got select error (Connection refused)
    ERROR: unable to send message to qmaster using port 63231 on host "10.253.202.159": got send error


</entry>
<entry [Wed 2011:04:20 16:34:43 EST] STARCLUSTER IMAGES>

starcluster listpublic

>>> Listing all public StarCluster images...

32bit Images:
-------------
[0] ami-8cf913e5 us-east-1 starcluster-base-ubuntu-10.04-x86-rc3
[1] ami-1e4dbf77 us-east-1 starcluster-base-ubuntu-10.04-x86-hadoop-rc4-ebs (EBS)
[2] ami-d1c42db8 us-east-1 starcluster-base-ubuntu-9.10-x86-rc8
[3] ami-17b15e7e us-east-1 starcluster-base-ubuntu-9.10-x86-rc7
[4] ami-8f9e71e6 us-east-1 starcluster-base-ubuntu-9.04-x86

64bit Images:
--------------
[0] ami-0af31963 us-east-1 starcluster-base-ubuntu-10.04-x86_64-rc1
[1] ami-8852a0e1 us-east-1 starcluster-base-ubuntu-10.04-x86_64-hadoop
[2] ami-a5c42dcc us-east-1 starcluster-base-ubuntu-9.10-x86_64-rc4
[3] ami-2941ad40 us-east-1 starcluster-base-ubuntu-9.10-x86_64-rc3
[4] ami-a19e71c8 us-east-1 starcluster-base-ubuntu-9.04-x86_64
[5] ami-06a75a6f us-east-1 starcluster-base-centos-5.4-x86_64-ebs-hvm-gpu-hadoop-rc2 (HVM-EBS)
[6] ami-12b6477b us-east-1 starcluster-base-centos-5.4-x86_64-ebs-hvm-gpu-rc2 (HVM-EBS)

total images: 12

</entry>
<entry [Tue 2011:04:19 14:05:59 EST] STARCLUSTER COMMANDS>
    
START CLUSTER
starcluster -c /nethome/admin/.starcluster/config start smallcluster

SHOW CLUSTER NODES:
starcluster -c /nethome/admin/.starcluster/config listclusters     

CONNECT TO MASTER:
starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster

CONNECT TO NODE 1:
starcluster -c /nethome/admin/.starcluster/config sshnode -u sgeadmin smallcluster node001

STOP CLUSTER
starcluster -c /nethome/admin/.starcluster/config stop smallcluster

SCP COPY
scp -i /nethome/admin/.starcluster/id_rsa-admin-key -r /aquarius/data/ root@ip-10-124-245-118:/cluster/data

    
</entry>
