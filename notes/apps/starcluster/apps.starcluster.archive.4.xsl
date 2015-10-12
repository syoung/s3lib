apps.starcluster.archive.4

<entry [Mon 2011:05:09 22:51:11 EST] FIXED 'Not enough settings' PROBLEM WITH sge.py PLUGIN>

/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 0 

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> AutoMount.__init__    Initialising AutoMount plugin.
    >>> AutoMount.__init__    head_ip 10.122.61.250
    >>> AutoMount.__init__    interval 30
    >>> AutoMount.__init__    sourcedirs /data,/nethome
    >>> AutoMount.__init__    mountpoints /data,/nethome
    cluster.py:574 - WARNING - Not enough settings provided for plugin sge
    cluster.py:575 - WARNING - An error occured while loading plugins
    cluster.py:576 - WARNING - Not running any plugins

BUT CONFIG FILE APPEARS TO CONTAIN ENOUGH ARGUMENTS FOR sge PLUGIN:

[plugin sge]
cell=syoung-smallcluster
execdport=36252
head_ip=10.122.61.250
qmasterport=36251
root=/opt/sge6
setup_class=sge.createCell
slots=1

emacs /nethome/admin/.starcluster/plugins/sge.py
    ...
    class createCell (ClusterSetup):
        """
        Automatically mounts external NFS shares on StarCluster nodes
        """
        def __init__(self, head_ip, cell, execdport, qmasterport, root, slots):
            log.info("createCell.__init__    Initialising createCell plugin.")
            log.info("createCell.__init__    head_ip %s" % head_ip)        
            log.info("createCell.__init__    cell %s" % cell)
            log.info("createCell.__init__    execdport %s" % execdport)
            log.info("createCell.__init__    qmasterport %s" % qmasterport)
            log.info("createCell.__init__    root %s" % root)
            log.info("createCell.__init__    slots %s" % slots)
    ...
    
LOOKING INTO /tmp/starcluster-debug-root.log  SHOWS THIS:

/tmp/starcluster-debug-root.log | grep 17409

    PID: 17409 cluster.py:431 - DEBUG - plugin args = ['self', 'head_ip', 'cell', 'execdport', 'qmasterport', 'root', 'slots']
    PID: 17409 cluster.py:432 - DEBUG - plugin varargs = None
    PID: 17409 cluster.py:433 - DEBUG - plugin keywords = None
    PID: 17409 cluster.py:434 - DEBUG - plugin defaults = None
    PID: 17409 cluster.py:451 - DEBUG - config_args = ['10.122.61.250', 'smallcluster', '36252', '36251', '/opt/sge6']
    PID: 17409 cluster.py:452 - DEBUG - config_kwargs = {}
    PID: 17409 cluster.py:574 - WARNING - Not enough settings provided for plugin sge


LOOKS LIKE A BUG IN THE LATEST VERSION (0.91.316):

/usr/local/lib/python2.6/dist-packages/StarCluster-0.9999-py2.6.egg/starcluster/

GIVES PHANTOM VALUES FOR sge.py INPUTS:

/data/starcluster/110202bal/bin/starcluster  -c /nethome/admin/.starcluster/syoung-smallcluster.config bal -m 5 syoung-smallcluster

    ...
    >>> AutoMount.__init__    mountdport 32767
    >>> plugin = {'cell': 'smallcluster', 'execdport': '36252', 'setup_class': 'sge.createCell', '__name__': 'sge', 'root': '/opt/sge6', 'qmasterport': '36251', 'head_ip': '10.122.61.250'}
    ...

REBOOTED MASTER AND FAILED WITH THIS ERROR:

ec2-get-console-output i-fa110695

    mount.nfs: No such device
    mountall: mount /data [332] terminated with status 32



SO KILLED THE STARCLUSTER AND CREATED A NEW ONE.

... AND THE CORRECT INPUTS APPEARED:

echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","cluster":"smallcluster","submit":"1","mode":"ex\
ecuteWorkflow","number":"2"}' |/var/www/cgi-bin/agua/0.6/workflow.cgi;

WHICH RAN:

/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config start syoung-smallcluster &> /nethome/agua/syoung/.cluster/syoung-smallcluster-starcluster.out

    ...
    >>> AutoMount.__init__    mountdport 32767
    >>> plugin = {'setup_class': 'sge.createCell', 'qmasterport': '36251', 'cell': 'syoung-smallcluster', '__nam
    e__': 'sge', 'execdport': '36252', 'slots': '1', 'root': '/opt/sge6', 'head_ip': '10.122.61.250'}
    ...

BUT THE LOAD BALANCER STARTED IMMEDIATELY AS THE CLUSTER WAS BEING CREATED:

starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 0

    OK

</entry>
<entry [Mon 2011:05:09 12:53:43 EST] FIXED LOAD BALANCER ENVARS FOR qhost|qstat|qacct>

RAN LOAD BALANCER:

cd /nethome/admin/.starcluster/plugins
/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 0 

... BUT GOT THIS ERROR DUE TO MISSING ENVIRONMENT VARIABLES:

tail /tmp//starcluster-debug-root.log 
    PID: 19677 ssh.py:382 - ERROR - command 'source /etc/profile && qhost -xml' failed with status 1
    PID: 19677 ssh.py:382 - ERROR - command 'source /etc/profile && qstat -q all.q -u "*" -xml' failed with status 1
    PID: 19677 ssh.py:385 - DEBUG - command source /etc/profile && qacct -j -b 201105091524 failed with status 1
    PID: 19677 __init__.py:399 - DEBUG - sizes: qhost: 150, qstat: 150, qacct: 92.
    PID: 19677 cli.py:184 - DEBUG - Traceback (most recent call last):
    PID: 19677 cli.py:129 - ERROR - Oops! Looks like you've found a bug in StarCluster
    PID: 19677 cli.py:130 - ERROR - Debug file written to: /tmp/starcluster-debug-root.log
    PID: 19677 cli.py:131 - ERROR - Look for lines starting with PID: 19677
    PID: 19677 cli.py:132 - ERROR - Please submit this file, minus any private information,
    PID: 19677 cli.py:133 - ERROR - to starcluster@mit.edu
    PID: 19677 ssh.py:514 - DEBUG - __del__ called
    

RUNS OKAY ON MASTER WITH ENVARS:

qhost -xml
    error: commlib error: got select error (Connection refused)
    error: unable to send message to qmaster using port 63231 on host "10.253.202.159": got send error

envars
qhost -xml
    OK

SOLUTION:

ADD ENVARS TO /etc/profile ON MASTER

export SGE_ROOT=/opt/sge6;
export SGE_CELL=syoung-smallcluster;
export SGE_QMASTER_PORT=36251;
export SGE_EXECD_PORT=36252;

    OK

NB: INITIALLY GOT THIS PROBLEM BUT WENT AWAY WHEN RESTARTED LOAD BALANCER:

    source /etc/profile && qhost -xml
    error: commlib error: access denied (client IP resolved to host name "ip-10-122-234-54.ec2.internal". This is not identical to clients host name "master")
    error: unable to send message to qmaster using port 36251 on host "master": got send error

(ALTERNATELY: CHANGE THE STARCLUSTER CODE TO PASS THE ENVARS BY ADDING GLOBAL VARIABLE utils.envars)

</entry>
<entry [Fri 2011:05:06 01:07:27 EST] TEST qsub SCRIPTS test.sh|test.pl>

emacs /nethome/syoung/agua/Project1/Workflow1/test.pl
#!/usr/bin/perl -w

use strict;
my $filename = $ARGV[0];
my $times = $ARGV[1];
my $sleep = $ARGV[2];
$times = 5 if not defined $times;
$sleep = 5 if not defined $sleep;
open(OUT, ">$filename") or die "Can't open filename: $filename\n";
print OUT `date`;
my $counter = 0;
while ( $counter < $times )
{
    print OUT "$counter:  ";
    print OUT `date`;
    $counter++;    
    sleep(5);
}
close(OUT) or die "Can't close filename: $filename\n";
print "Completed $0\n";

AND:

/nethome/syoung/agua/Project1/Workflow1# cat test.sh
#!/bin/sh

#$ -N test
#$ -o /nethome/syoung/agua/Project1/Workflow1/test.out
#$ -e /nethome/syoung/agua/Project1/Workflow1/test.err
##$ -q syoung-Project1-Workflow1
#$ -l h_rt=1:00:00
echo `hostname`
echo `date`
  /nethome/syoung/agua/Project1/Workflow1/test.pl \
/nethome/syoung/agua/Project1/Workflow1/test.OUT \
10

RUN
chmod 755 /nethome/syoung/agua/Project1/Workflow1/test.sh
chmod 755 /nethome/syoung/agua/Project1/Workflow1/test.pl
qsub test.sh
qsub test.sh; qsub test.sh; qsub test.sh; qsub test.sh; qsub test.sh; qsub test.sh; 

MONITOR
tail -f test.OUT

</entry>
<entry [Fri 2011:05:06 01:06:27 EST] ADDED threaded PE COMMANDS TO sge.py>

submit ()
print Dumper ;echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","cluster":"smallcluster","submit":"1","mode":"executeWorkflow","number":"2"
    ...
    Agua::Monitor::SGE::setQueuefileContents    queue: Project1-Workflow1
    Agua::Monitor::SGE::addQueue    add: qconf -Aq /nethome/admin/agua/.sge/conf/queue-Project1-Workflow1.conf

    qconf -Aq /nethome/admin/agua/.sge/conf/queue-Project1-Workflow1.conf
    unable to resolve host "node001"


NB: ALTHOUGH THERE APPEARS TO BE A PROBLEM WITH PE CREATION: 

>>> Running plugin sge
>>> createCell.run    createCell.run(nodes, master, user, user_shell, volumes
ssh.py:382 - ERROR - command

'export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/qconf -Ap /tmp/pe.txt'

failed with status 1

... IT WAS ACTUALLY WORKING BUT JUST COMPLAINED BY RETURNING 1 BECAUSE THE PE ALREADY EXISTS.

THESE COMMANDS TO MASTER ON 8e COMMAND LINE WORKED:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-184-72-75-178.compute-1.amazonaws.com "export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/qconf -Ap /tmp/pe.txt"

    parallel environment "threaded" already exists

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-184-72-75-178.compute-1.amazonaws.com "export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/qconf -mattr queue pe_list "threaded" all.q"
    
    root@master modified "all.q" in cluster queue list

COMMANDS ALSO WORKED OKAY ON MASTER:

export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/qconf -Ap /tmp/pe.txt

    root@master added "threaded" to parallel environment list

export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; /opt/sge6/bin/lx24-amd64/qconf -mattr queue pe_list "threaded" all.q

    Unable to find "threaded" in "pe_list" of "all.q" - Adding new element.
    root@master modified "all.q" in cluster queue list


NOTES
-----

SETTING 'allocation_rule    $pe_slots'

http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_queues.html
man pe_conf

allocation_rule
    If the special denominator $pe_slots is used, the full range of processes 
    as specified with the qsub(1) -pe switch has to be allocated on a single host.

</entry>
<entry [Sun 2011:05:08 21:35:45 EST] TESTED CELL CREATION BY sge.py USING 'adminkey' CONFIG FILE>
THE FOLLOWING TEST WORKED OKAY

1. CONFIRM config INPUTS 
------------------------

emacs /nethome/admin/.starcluster/syoung-smallcluster.config

[global]export SGE_CELL=syoung-smallcluster;export SGE_QMASTER_PORT=36251;export SGE_EXECD_PORT=36252;export SGE_ROOT=/opt/sge6;

DEFAULT_TEMPLATE=syoung-smallcluster
ENABLE_EXPERIMENTAL=True

[cluster syoung-smallcluster]
AVAILABILITY_ZONE=us-east-1a
CLUSTER_SIZE=1
CLUSTER_USER=sgeadmin
KEYNAME=id_rsa-admin-key
NODE_IMAGE_ID=ami-b07985d9
NODE_INSTANCE_TYPE=t1.micro
PLUGINS=automount,sge

[aws info]
AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
AWS_SECRET_ACCESS_KEY=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
AWS_USER_ID=558277860346

[key id_rsa-admin-key]
KEYNAME=id_rsa-admin-key
KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key

[plugin automount]
cluster=syoung-smallcluster
devices=/dev/sdh,/dev/sdi
head_ip=10.122.61.250
interval=30
mountdport=32767
mountpoints=/data,/nethome
nfsport=2049
portmapport=111
setup_class=automount.NfsShares
sourcedirs=/data,/nethome

[plugin sge]
cell=syoung-smallcluster
execdport=36252
head_ip=10.122.61.250
qmasterport=36251
root=/opt/sge6
setup_class=sge.createCell
slots=1


2. RUN PLUGIN
-------------
GOTCHAS:
1. MUST BE INSIDE DIRECTORY /nethome/admin/.starcluster/plugins)
2. MUST BE ROOT WHEN LAUNCHING DEVELOPMENT SHELL AND TESTING PLUGIN

# START CLUSTER  *** NOT NEEDED - CLUSTER WAS ALREADY RUNNING
/data/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
start syoung-smallcluster
    OK

# START SHELL
cd /nethome/admin/.starcluster/plugins
/data/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
shell

# CONFIRM cfg OBJECT HAS PLUGIN INFO:
cfg.get_plugin('sge')
    {'__name__': 'sge',
     'cell': 'syoung-smallcluster',
     'execdport': '36252',
     'head_ip': '10.122.61.250',
     'qmasterport': '36251',
     'root': '/opt/sge6',
     'setup_class': 'sge.createCell'}

TEST:
import sge; clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')

RELOAD:
reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')
        
</entry>
<entry [Sun 2011:05:08 14:32:45 EST] CREATED STARCLUSTER CONFIG FILE FOR 'adminkey' USERS>
CREATE CONFIG FILE FOR adminKey USER syoung:

echo '{"availzone":"us-east-1a","username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"smallcluster","minnodes":"0","maxnodes":"5","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi

cat /nethome/admin/.starcluster/syoung/smallcluster.config
[global]
    DEFAULT_TEMPLATE=syoung-smallcluster
    ENABLE_EXPERIMENTAL=True
    
    [aws info]
    AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
    AWS_SECRET_ACCESS_KEY=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
    AWS_USER_ID=558277860346
    
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    
    [cluster syoung-smallcluster]
    AVAILABILITY_ZONE=us-east-1a
    CLUSTER_SIZE=1
    CLUSTER_USER=sgeadmin
    KEYNAME=id_rsa-admin-key
    NODE_IMAGE_ID=ami-d1c42db8
    NODE_INSTANCE_TYPE=t1.micro
    PLUGINS=automount,sge
    
    [plugin automount]
    devices=/dev/sdh,/dev/sdi
    head_ip=10.122.61.250
    interval=30
    mountpoints=/data,/nethome
    setup_class=automount.NfsShares
    sourcedirs=/data,/nethome
    
    [plugin sge]
    cell=syoung-smallcluster
    execdport=36252
    head_ip=10.122.61.250
    qmasterport=36251
    root=/opt/sge6
    setup_class=sge.createCell


CREATE CONFIG FILE FOR adminKey USER test:

echo '{"availzone":"us-east-1a","username":"test","sessionId":"0000000000.0000.000","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi

cat /nethome/admin/.starcluster/test/picocluster.config
    [global]
    DEFAULT_TEMPLATE=test-picocluster
    ENABLE_EXPERIMENTAL=True
    
    [aws info]
    AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
    AWS_SECRET_ACCESS_KEY=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
    AWS_USER_ID=558277860346
    
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    
    [cluster test-picocluster]
    AVAILABILITY_ZONE=us-east-1a
    CLUSTER_SIZE=2
    CLUSTER_USER=sgeadmin
    KEYNAME=id_rsa-admin-key
    NODE_IMAGE_ID=ami-d1c42db8
    NODE_INSTANCE_TYPE=t1.micro
    PLUGINS=automount,sge
    
    [plugin automount]
    devices=/dev/sdh,/dev/sdi
    head_ip=10.127.95.154
    interval=30
    mountpoints=/data,/nethome
    setup_class=automount.NfsShares
    sourcedirs=/data,/nethome
    
    [plugin sge]
    cell=test-picocluster
    execdport=36242
    head_ip=10.127.95.154
    qmasterport=36241
    root=/opt/sge6
    setup_class=sge.createCell

</entry>
<entry [Thu 2011:05:05 23:22:55 EST] CREATE CELL USING sge.py >

1. CONFIRM config INPUTS 
------------------------

emacs /nethome/admin/.starcluster/smallcluster.config

[global]
DEFAULT_TEMPLATE=admin-smallcluster
ENABLE_EXPERIMENTAL=True

[aws info]
AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
AWS_SECRET_ACCESS_KEY=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
AWS_USER_ID=558277860346

[key id_rsa-admin-key]
KEYNAME=id_rsa-admin-key
KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key

[cluster admin-smallcluster]
AVAILABILITY_ZONE=us-east-1a
CLUSTER_SIZE=2
CLUSTER_USER=sgeadmin
KEYNAME=id_rsa-admin-key
NODE_IMAGE_ID=ami-d1c42db8
NODE_INSTANCE_TYPE=t1.micro
PLUGINS=automount,sge

[plugin automount]
devices=/dev/sdh,/dev/sdi
head_ip=10.122.61.250
interval=30
mountpoints=/data,/nethome
setup_class=automount.NfsShares
sourcedirs=/data,/nethome

[plugin sge]
cell=admin-smallcluster
execdport=36252
head_ip=10.122.61.250
qmasterport=36251
root=/opt/sge6
setup_class=sge.createCell


2. RUN PLUGIN
-------------
GOTCHAS:
1. MUST BE INSIDE DIRECTORY /nethome/admin/.starcluster/plugins)
2. MUST BE ROOT WHEN LAUNCHING DEVELOPMENT SHELL AND TESTING PLUGIN

# START CLUSTER:
/data/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/smallcluster.config \
start admin-smallcluster
    OK

# START SHELL:
cd /nethome/admin/.starcluster/plugins
/data/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/smallcluster.config \
shell

# CONFIRM cfg OBJECT HAS PLUGIN INFO:
cfg.get_plugin('sge')
    {'__name__': 'sge',
     'cell': 'admin-smallcluster',
     'execdport': '36252',
     'head_ip': '10.122.61.250',
     'qmasterport': '36251',
     'root': '/opt/sge6',
     'setup_class': 'sge.createCell'}

TEST:
import sge; clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'sge', 'admin-smallcluster')

RELOAD:
reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'admin-smallcluster')

    OK
    

</entry>
<entry [Sat 2011:05:07 00:29:09 EST] GENERATE KEYPAIR FILE USING saveAws>

*** NB: FIXED SO THAT IT WILL NOT PRINT KEY FILES OR REGENERATE KEYPAIR FILE IF THERE IS NO CHANGE IN THE PRIVATE KEY OR PUBLIC CERT

echo '{"username":"admin","sessionId":"9999999999.9999.999","mode":"saveAws","volumesize":100,"amazonuserid":"558277860346","ec2publiccert":"-----BEGIN CERTIFICATE-----MIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlkC/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAJWZIAB2ZZB7FHJIQ","secretaccesskey":"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"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi


CREATES THESE THREE FILES:

/nethome/admin/.keypairs/private.pem
/nethome/admin/.keypairs/public.pem
/nethome/admin/.starcluster/id_rsa-admin-key


RE-REGISTER id_rsa-admin-key KEYPAIR FILE
-----------------------------------------

1. SHOW CURRENT KEYPAIRS

ec2-describe-keypairs
KEYPAIR	ec2-keypair1	48:18:33:d1:5a:4b:25:53:01:c6:c0:c9:d3:2a:ac:6c:0e:d1:f4:43
KEYPAIR	aquarius	03:b7:c5:f0:a6:e7:6b:af:3d:8a:68:ff:ec:f1:d6:05
KEYPAIR	id_rsa-jgilbert-key	cc:63:81:5b:c1:6a:00:4b:a8:e8:17:c8:7d:cb:68:4d:01:bf:07:71
KEYPAIR	id_rsa-admin-key	de:22:bd:54:48:17:70:7e:1e:c9:93:59:23:a6:70:a8:fb:f6:7b:a5
KEYPAIR	id_rsa-starcluster-1	cb:f9:77:bc:ed:c6:fb:91:3f:a2:12:a5:f0:ea:bc:ae:1a:a7:7c:41
KEYPAIR	agua	0d:d8:03:2c:72:81:68:36:67:41:bf:db:28:a5:f1:33:9e:97:8b:02
KEYPAIR	id_rsa-syoung-key	e1:1c:6f:04:27:b3:78:33:d0:45:96:c1:ff:6a:43:ed:f1:24:29:ca
syoung@hp:~$ 

2. DELETE KEYPAIR IF EXISTS ALREADY

ec2-delete-keypair id_rsa-admin-key


3. ADD KEYPAIR

ec2-add-keypair \
-K /nethome/admin/.keypairs/private.pem \
-C /nethome/admin/.keypairs/public.pem \
id_rsa-admin-key

 ec2-add-keypair -K /nethome/admin/.keypairs/private.pem -C /nethome/admin/.keypairs/public.pem id_rsa-admin-key
KEYPAIR	id_rsa-admin-key	d9:f4:e4:ce:5a:a0:6e:4e:dc:79:d9:7e:fd:47:d7:2e:6a:38:00:e2
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAg85UjbGRDusSQJZVJOGQ74nHfsXNIuaiJxkCn87OUQjAkSosoBI2csu1uzSw
DZYW5eNvLq7DNMtCeoPvi2He/2M3qNQxRKA2xP89SzUDLl0hOunk7ZRN5Nsmzoy6erTLvshFKv8d
tFIaqRJqrZiedOEpyvSYwmZCGbgikClfxKhkD/Qtgv17WyDDJUcLYgQUmTD+wSkZJHXxxNpWvPlA
PsnMaCdd9cRzJTLTlzM+2pwjleTcU5e92KJKreAxgSsf1Ak8OO3jrDGh/IEuPoIJkBjaEpXdXmaO
u8zZBzLVSuIDzCxWTHaBQJBkRnjSIIApICpWBQMCc1koCpYNyU+RDwIDAQABAoIBABtGAZcETCjT
GYbF1L558lyunNotoeH76Ue/1BwvVd/MuNQQ7wT8X8nnPyaKo3dcPEa7hhEZ1ojBGnNxg4rK6LLd
2/GSXtN9d3fR/OPoB017tdmT9mv2yRt3AZOx6RBlAtfqZu2btpDOgHfFuM9NClTTFqvJayamtDzQ
Lk64UPnHNXMGeOrI3kBKRiMbtAUVfE6SEhOLnhp0AjTNfxBsTh4Zo7UeMVQxOHkS+o5F+fjwirob
gGw/4OqYpZadh5HKqx0EHzfT5dSKl3T7sT6tD6BQewF3aFQlwAJEZ1dVfAJGfljnYfrVp6zQDXZK
tvBC1NQZeDoXU9dT/3o8NB3NGrkCgYEA1YyRqpWlSPyjVMzDxqARUej4Am2JGvDC4dzNQJxjVL1C
IeknT5UpcWhWG07BM2z6TZnR6jD+YpMnOWroaE3cRgbNudfKp5m9x3zr0Q1svfqQTWVyfF/UiJ6n
CuPvqVJ4oc33gzeaKqGZ2aCMJNDkI0Subfl7j+1iKnvhX3CNJA0CgYEAngHisR2s5nCtmUkEaIQT
nn+zKyaIMeM9oXAbqZni8xF6Cjqz5S3VRQMdx35eceqrCRyr4fYxbo4v1iG9siUNBrLf8r2A/NLY
gl3Yo8SzY9W3JwVnAKa2V3BCHDiAyDAECSWvRGs7n4lab9+EVfboXMpRjsMQ70X9zxhZTneLdosC
gYEAh75qHfAv97w4KsBatliridC4TfrIy2o9xwrvIeIHNidz8VBe37SmemNjUMp3/zOHzGo5yE9K
dOirZ1Ew2JSdr5nFjhvAw1b0Dum2kNWiyQSMU9Zntu3HkOygrEiF4LD+44OkkTF3+x9sR61JSGHM
kyqmYlvTEoNIAk9qzJsj7MUCgYBQVBkRfkq2ZLZ85VguYmcu/zDxUQeQhTyB5GLL2IY+mLX4mVt3
udNg4HK1RxNwyqLlYQQpPmZnFDZRoJm2BYwXybx8xcbbwb18mYVXzNp+eNpCJkb1V8v/q/yQKFGg
dHi4xcXS/Mk1FDk8AuBea8Y51kmcUKM9YdHlBTXx5GisfQKBgCL9QvzGv5n/lbi/UYU9OwQxBS2W
SSJc4zpZ5p4adDHdf1IU3OlzSk5t24Qqa24opgLCRnw28c1jEHi9Kl7Pf+MMeqSB3npaZ8JtnFxb
V3/OqclpcQm9UwrhXVcK/KvhHQGr33arRigZT5W3NeARz2kDbaJWsjthJcUlQHQUTd7U
-----END RSA PRIVATE KEY-----


NOTE: THIS IS A NEW KEYPAIR ENTIRELY SO MUST USE IT TO REPLACE THE PREVIOUS KEYPAIR WITH THE SAME NAME:

cat /nethome/admin/.starcluster/id_rsa-admin-key

    KEYPAIR	id_rsa-admin-key	8b:d9:db:a1:8f:f5:3b:2e:9d:a2:ef:fb:87:9f:f4:01:43:d1:25:35
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEAidTORoU4YT9CXZyn6URwXtKM8P9K5TBbe71BfI4Ni5kRvyqAFicwt3zlI/iK
    3Qq/yuN97kNWBxwA4eAUtxRwIM9gF90ZUBNcUdiGz1O0JEmfANjgjvBeSW1MMONIXfGYuREf9IOd
    JdMqRSz6jAeUQx61rErUEmAxrMqmX4J0daVjDlqrnBUxyp7zyJ/aITqZKm6Y+LZ1RFXEdAjF5cUh
    HT2Vh3VSAFPaUr9muTC7P1uqLxnT0reBaPh3QXndseDdRewtDBCrdqBw12ip2h7Jge27KtpI98CQ
    hbicUIjmSfB2Ic5PYYMyuoRx7SUmyGbtLU9S+7ZofGmDIXRpt1iQFwIDAQABAoIBAGr32zbjwUPH
    wovAPphM4yDUK0oF92wzwWwhDyfJXz3OB/Xi2BFZTPe6WGM4Sx0NcJfXQi6d17AgzZZ/P9Ruai8s
    ghlDIJgCzo0+jDFvdskK0fnoVy7X4XT+/Dicy9cM30gRwEkVs+pdHdsd8zylzSziMoCKelfgi+zc
    QY6yQgvirdm1mdk+Qr19BfuUQmviESv615FI8CSuop8ijGG7jxRouYsncRmD8CpOCiUCTuMu/trr
    xa83Icn1P2gEMCNmxlJODYx1DQ/YG32Wzve2curUPdf2gx5IHw0bibZveIkyzYLR7e0Avo1o4zhd
    6MSHQHRdj4kcy5+FiKQp4J3+QLECgYEA3FrF0sFZGu6yWWaTZDOBYB5PiB+uMGi2A22OqcWqMG3q
    vHF6xmOVwviWdLzQvF/VXVoP4lJIDTHMgtMxdeDWoNCheo++6X6tZhMVuqp0RnnV0HOMxNLVH1x1
    KtmBApo+jSOytl75MecdsWVhprozUYK+7m662Bfo3qaxEn++ACUCgYEAoCCdLJz3ZqMR8TQA5PDU
    4+UdIBFPsX867pEtQUJXb3tpcoocREbMzMdW9O4Wob2pYauP2COrO8wwtZmFMjHTCHrJQ3M3Xalx
    /lOHIEcVZO/ByO6WAmTI/OhXiB/rehsgoza+lwg+TkQolqruID2idwlPNoYD2FNsifnhLw19zIsC
    gYEAx6Vuqr8HboFqEdoAHL8VrvKHeHvLpIyarIxsv6EZy3srPMVMScccf2QfXXFdZe8mL8hTr+iA
    44OFGdsjavvlOhsM0zC99mwRyvPrsg6R/vCQKqcmmYW0Fw/8EHC0lJkPp2z6lIWEHhSaMIn8acU2
    jdl6CClHHFa9ZE1/DZWzngkCgYBrCCHHFkyQQGPX1Cjc3tWOVzD2pFueiyq7GDMlsdB75gP/2a03
    PhPatUu8gACEsB+t91043e6xE7VjTXCosoEa4+fvu+3AH2jg1Lg3rQvx4gin5EJE61UlJ7CKfruJ
    bOSN9CPFFG+BJTH0M+DjkA8uffyCt2WOjYS5XVtVdjEmLQKBgQCnV5bBR4DHT5/SFCk8LqyS4oFT
    l3AbYWLxQNMcHw031hR1ISLCH8sjUioX3iBbGZ6uTvdly5T/yvIPVUpQNF6YMnEiZeuEvTgq3l45
    vdm1jJtW0icVHzipyql7AoOjkhLA7Wl8vVV3rkuPgVr90l7TmN7ZPTcvzYRXtRK99e81Tg==
    -----END RSA PRIVATE KEY-----


rm -fr /nethome/admin/.starcluster/id_rsa-admin-key

emacs /nethome/admin/.starcluster/id_rsa-admin-key

    KEYPAIR	id_rsa-admin-key	d9:f4:e4:ce:5a:a0:6e:4e:dc:79:d9:7e:fd:47:d7:2e:6a:38:00:e2
    -----BEGIN RSA PRIVATE KEY-----
    MIIEowIBAAKCAQEAg85UjbGRDusSQJZVJOGQ74nHfsXNIuaiJxkCn87OUQjAkSosoBI2csu1uzSw
    DZYW5eNvLq7DNMtCeoPvi2He/2M3qNQxRKA2xP89SzUDLl0hOunk7ZRN5Nsmzoy6erTLvshFKv8d
    tFIaqRJqrZiedOEpyvSYwmZCGbgikClfxKhkD/Qtgv17WyDDJUcLYgQUmTD+wSkZJHXxxNpWvPlA
    PsnMaCdd9cRzJTLTlzM+2pwjleTcU5e92KJKreAxgSsf1Ak8OO3jrDGh/IEuPoIJkBjaEpXdXmaO
    u8zZBzLVSuIDzCxWTHaBQJBkRnjSIIApICpWBQMCc1koCpYNyU+RDwIDAQABAoIBABtGAZcETCjT
    GYbF1L558lyunNotoeH76Ue/1BwvVd/MuNQQ7wT8X8nnPyaKo3dcPEa7hhEZ1ojBGnNxg4rK6LLd
    2/GSXtN9d3fR/OPoB017tdmT9mv2yRt3AZOx6RBlAtfqZu2btpDOgHfFuM9NClTTFqvJayamtDzQ
    Lk64UPnHNXMGeOrI3kBKRiMbtAUVfE6SEhOLnhp0AjTNfxBsTh4Zo7UeMVQxOHkS+o5F+fjwirob
    gGw/4OqYpZadh5HKqx0EHzfT5dSKl3T7sT6tD6BQewF3aFQlwAJEZ1dVfAJGfljnYfrVp6zQDXZK
    tvBC1NQZeDoXU9dT/3o8NB3NGrkCgYEA1YyRqpWlSPyjVMzDxqARUej4Am2JGvDC4dzNQJxjVL1C
    IeknT5UpcWhWG07BM2z6TZnR6jD+YpMnOWroaE3cRgbNudfKp5m9x3zr0Q1svfqQTWVyfF/UiJ6n
    CuPvqVJ4oc33gzeaKqGZ2aCMJNDkI0Subfl7j+1iKnvhX3CNJA0CgYEAngHisR2s5nCtmUkEaIQT
    nn+zKyaIMeM9oXAbqZni8xF6Cjqz5S3VRQMdx35eceqrCRyr4fYxbo4v1iG9siUNBrLf8r2A/NLY
    gl3Yo8SzY9W3JwVnAKa2V3BCHDiAyDAECSWvRGs7n4lab9+EVfboXMpRjsMQ70X9zxhZTneLdosC
    gYEAh75qHfAv97w4KsBatliridC4TfrIy2o9xwrvIeIHNidz8VBe37SmemNjUMp3/zOHzGo5yE9K
    dOirZ1Ew2JSdr5nFjhvAw1b0Dum2kNWiyQSMU9Zntu3HkOygrEiF4LD+44OkkTF3+x9sR61JSGHM
    kyqmYlvTEoNIAk9qzJsj7MUCgYBQVBkRfkq2ZLZ85VguYmcu/zDxUQeQhTyB5GLL2IY+mLX4mVt3
    udNg4HK1RxNwyqLlYQQpPmZnFDZRoJm2BYwXybx8xcbbwb18mYVXzNp+eNpCJkb1V8v/q/yQKFGg
    dHi4xcXS/Mk1FDk8AuBea8Y51kmcUKM9YdHlBTXx5GisfQKBgCL9QvzGv5n/lbi/UYU9OwQxBS2W
    SSJc4zpZ5p4adDHdf1IU3OlzSk5t24Qqa24opgLCRnw28c1jEHi9Kl7Pf+MMeqSB3npaZ8JtnFxb
    V3/OqclpcQm9UwrhXVcK/KvhHQGr33arRigZT5W3NeARz2kDbaJWsjthJcUlQHQUTd7U
    -----END RSA PRIVATE KEY-----


... AND CAN START STARCLUSTER USING THE NEW KEYPAIR:

cat /nethome/admin/.starcluster/smallcluster.config 
    ...
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    ...

data/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/smallcluster.config \
start admin-smallcluster

    OK
    
    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: admin-smallcluster
    >>> AutoMount.__init__    Initialising AutoMount plugin.
    >>> AutoMount.__init__    head_ip 10.122.61.250
    >>> AutoMount.__init__    interval 30
    ...


</entry>
<entry [Wed 2011:05:04 12:14:42 EST] RUN tophat TASK JOB>

OK AND SGE_TASK_ID WORKS TOO!

/opt/sge6/bin/lx24-amd64/qsub -t 1-4 test-array.sh
/opt/sge6/bin/lx24-amd64/qsub -t 1-4 test-array-sgeid.sh
    OK
    
</entry>
<entry [Wed 2011:05:04 11:42:25 EST] CREATE sge.py INPUTS IN STARCLUSTER config FILE>

WRITE STARCLUSTER CONFIG FILE:

/agua/0.6/bin/apps/cluster/starcluster.pl writeConfigfile \
/agua/0.6/bin/apps/cluster/starcluster.pl writeConfigfile \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--amazonuserid 728213020069 \
--accesskeyid AKIAIZXZ6S7ARZ44TTHQ \
--secretaccesskey 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 \
--keyname admin-key \
--username admin \
--sources /data,/nethome \
--mounts /data,/nethome \
--devs /dev/sdh,/dev/sdi \
--instancetype t1.micro \
--nodes 2 \
--availzone us-east-1a \
--nodeimage ami-b07985d9 \
--cluster smallcluster \
--configfile /nethome/admin/.starcluster/smallcluster.config

    OK

WHICH CREATED THIS:

em /nethome/admin/.starcluster/smallcluster.config
    
    [global]
    DEFAULT_TEMPLATE=admin-smallcluster
    ENABLE_EXPERIMENTAL=True
    
    [aws info]
    AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
    AWS_SECRET_ACCESS_KEY=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
    AWS_USER_ID=728213020069
    
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    
    [cluster admin-smallcluster]
    AVAILABILITY_ZONE=us-east-1a
    CLUSTER_SIZE=2
    CLUSTER_USER=sgeadmin
    KEYNAME=id_rsa-admin-key
    NODE_IMAGE_ID=ami-b07985d9
    NODE_INSTANCE_TYPE=t1.micro
    PLUGINS=automount,sge
    
    [plugin automount]
    devices=/dev/sdh,/dev/sdi
    head_ip=10.122.61.250
    interval=30
    mountpoints=/data,/nethome
    sourcedirs=/data,/nethome
    
    [plugin sge]
    cell=admin-smallcluster
    execdport=36252
    head_ip=10.122.61.250
    qmasterport=36251
    root=/opt/sge6



... AND DIRECTLY FROM WEB CLIENT:

echo '{"username":"admin","availzone":"us-east-1a","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"smallcluster","clustername":"smallcluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-b07985d9","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi;


echo '{"username":"syoung","availzone":"us-east-1a","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-b07985d9","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi;

    OK
    
WHICH CREATED THIS:

    [global]
    DEFAULT_TEMPLATE=admin-picocluster
    ENABLE_EXPERIMENTAL=True
    
    [aws info]
    AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
    AWS_SECRET_ACCESS_KEY=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
    AWS_USER_ID=558277860346
    
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    
    [cluster admin-smallcluster]
    AVAILABILITY_ZONE=us-east-1a
    CLUSTER_SIZE=2
    CLUSTER_USER=sgeadmin
    KEYNAME=id_rsa-admin-key
    NODE_IMAGE_ID=ami-b07985d9
    NODE_INSTANCE_TYPE=t1.micro
    PLUGINS=automount,sge
    
    [plugin automount]
    devices=/dev/sdh,/dev/sdi
    head_ip=10.122.61.250
    interval=30
    mountpoints=/data,/nethome
    sourcedirs=/data,/nethome
    
    [plugin sge]
    cell=admin-picocluster
    execdport=36252
    head_ip=10.122.61.250
    qmasterport=36251
    root=/opt/sge6
    
    [cluster admin-picocluster]
    AVAILABILITY_ZONE=us-east-1a
    CLUSTER_SIZE=2
    CLUSTER_USER=sgeadmin
    KEYNAME=id_rsa-admin-key
    NODE_IMAGE_ID=ami-d1c42db8
    NODE_INSTANCE_TYPE=t1.micro
    PLUGINS=automount,sge



</entry>
<entry [Thu 2011:05:05 01:32:22 EST] NOT NECESSARY TO COPY default FROM MASTER TO 8e>

*** SUMMARY: IT'S NOT NECESSARY TO COPY THE DIRECTORY FROM MASTER TO 8e.
*** JUST COPY IT LOCALLY

DID A diff BETWEEN:
    THE syoung-project1-workflow1 DIRECTORY COPIED FROM default LOCALLY, AND
    THE syoung-project1-workflow1 DIRECTORY COPIED FROM default ON MASTER

cd /opt/sge6
diff syoung-project1-workflow1-8e/ syoung-project1-workflow1

CHANGED FILES
-------------

diff -r syoung-project1-workflow1-8e/common/sched_configuration
syoung-project1-workflow1/common/sched_configuration
12c12
< schedd_job_info false
---
> schedd_job_info true


diff -r syoung-project1-workflow1-8e/common/settings.csh syoung-project1-workflow1/common/settings.csh
9,10c9,10
< setenv SGE_QMASTER_PORT 63231
< setenv SGE_EXECD_PORT 63232
---
> setenv SGE_QMASTER_PORT 63241
> setenv SGE_EXECD_PORT 63242


diff -r syoung-project1-workflow1-8e/common/settings.sh syoung-project1-workflow1/common/settings.sh
9,10c9,10
< SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT
< SGE_EXECD_PORT=63232; export SGE_EXECD_PORT
---
> SGE_QMASTER_PORT=63241; export SGE_QMASTER_PORT
> SGE_EXECD_PORT=63242; export SGE_EXECD_PORT

diff -r syoung-project1-workflow1-8e/spool/qmaster/cqueues/all.q syoung-project1-workflow1/spool/qmaster/cqueues/all.q
8c8
< load_thresholds       np_load_avg=1.75
---
> load_thresholds       np_load_avg=40
19c19
< slots                 1,[master=1],[node001=1]
---
> slots                 1,[domU-12-31-38-01-C5-51.compute-1.internal=1],[ip-10-126-49-153.ec2.internal=1]


diff -r syoung-project1-workflow1-8e/spool/qmaster/qinstances/all.q/node001 syoung-project1-workflow1/spool/qmaster/qinstances/all.q/node001
7c7
< state                 0
---
> state                 1024


DIFFERENT FILES
---------------

Only in syoung-project1-workflow1/common: accounting
Only in syoung-project1-workflow1/spool/exec_spool_local/master/jobs: 00
Only in syoung-project1-workflow1/spool/exec_spool_local/master/job_scripts: 82
Only in syoung-project1-workflow1/spool/exec_spool_local/node001/active_jobs: 81.1
Only in syoung-project1-workflow1/spool/exec_spool_local/node001/jobs: 00
Only in syoung-project1-workflow1/spool/exec_spool_local/node001/job_scripts: 81
Only in syoung-project1-workflow1/spool/qmaster/cqueues: default
Only in syoung-project1-workflow1/spool/qmaster/users: root
Only in syoung-project1-workflow1/spool/qmaster/qinstances: default
Only in syoung-project1-workflow1/spool/qmaster/exec_hosts: domU-12-31-38-01-C5-51.compute-1.internal
Only in syoung-project1-workflow1/spool/qmaster/pe: threaded
Only in syoung-project1-workflow1/spool/qmaster/jobs: 00
Only in syoung-project1-workflow1/spool/qmaster/job_scripts: 81
Only in syoung-project1-workflow1/spool/qmaster/job_scripts: 82
Only in syoung-project1-workflow1/spool/exec_spool_local/master/active_jobs: 82.1


ALTHOUGH GOT ERROR 'can't create directory active_jobs/108.1: File exists':

/opt/sge6/syoung-project1-workflow1.master/spool/exec_spool_local/master/active_jobs:
    drwxr-xr-x 2 root root 4.0K 2011-05-04 15:39 82.1

/opt/sge6/syoung-project1-workflow1.master/spool/exec_spool_local/node001/active_jobs:
    drwxr-xr-x 2 root root 4.0K 2011-05-04 15:39 81.1


BOTH NODES WERE IN ERROR OR 'au' STATE:
(The "a" means 'alarm' and the "u" means unheard/unreachable.) 

qstat -f
    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    all.q@master                   BIP   0/0/1          1.42     lx24-amd64    E
    ---------------------------------------------------------------------------------
    all.q@node001                  BIP   0/0/1          -NA-     lx24-amd64    au
    ---------------------------------------------------------------------------------
    default@master                 BIP   0/0/1          1.42     lx24-amd64    E
    ---------------------------------------------------------------------------------
    default@node001                BIP   0/0/1          -NA-     lx24-amd64    au
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
        115 0.55500 test       root         qw    05/05/2011 14:34:20     1        


SO CANCELLED THE STATE:

echo $SGE_CELL
    syoung-project1-workflow1
qmod -c all.q
    Queue instance "all.q@node001" is already in the specified state: no error
    root@ip-10-122-61-250.ec2.internal changed state of "all.q@master" (no error)


CONFIRMED THAT MASTER AND NODE001 ARE IN all.q:
qconf -sq all.q

slots                 1,[domU-12-31-38-01-C5-51.compute-1.internal=1], \
                      [ip-10-126-49-153.ec2.internal=1]


CHECKED EXECUTION HOST STATUS OF MASTER:
qconf -se domU-12-31-38-01-C5-51.compute-1.internal

    hostname              domU-12-31-38-01-C5-51.compute-1.internal
    load_scaling          NONE
    complex_values        NONE
    load_values           NONE
    processors            0
    user_lists            NONE
    xuser_lists           NONE
    projects              NONE
    xprojects             NONE
    usage_scaling         NONE
    report_variables      NONE


GOT A TRUNCATED VERSION WHEN WENT TO EDIT EXECUTION HOST ENTRY FOR MASTER:

hostname              domU-12-31-38-01-C5-51.compute-1.internal
load_scaling          NONE
complex_values        NONE
user_lists            NONE
xuser_lists           NONE
projects              NONE
xprojects             NONE
usage_scaling         NONE
report_variables      NONE



ADDED load_values ENTRY LIKE THIS:

    hostname              master
    load_scaling          NONE
    complex_values        NONE
    load_values           arch=lx24-amd64,num_proc=1,mem_total=615.222656M, \
                          swap_total=0.000000M,virtual_total=615.222656M, \
                          load_avg=1.920000,load_short=2.270000, \
                          load_medium=1.920000,load_long=2.170000, \
                          mem_free=546.855469M,swap_free=0.000000M, \
                          virtual_free=546.855469M,mem_used=68.367188M, \
                          swap_used=0.000000M,virtual_used=68.367188M, \
                          cpu=0.000000,m_topology=NONE,m_topology_inuse=NONE, \
                          m_socket=-1,m_core=0,np_load_avg=1.920000, \
                          np_load_short=2.270000,np_load_medium=1.920000, \
                          np_load_long=2.170000
    processors            1
    user_lists            NONE
    xuser_lists           NONE
    projects              NONE
    xprojects             NONE
    usage_scaling         NONE
    report_variables      NONE



qconf -Me domU-12-31-38-01-C5-51.compute-1.internal

    hostname              domU-12-31-38-01-C5-51.compute-1.internal
    load_scaling          NONE
    complex_values        NONE
    load_values           arch=lx24-amd64,num_proc=1,mem_total=615.222656M, \
                          swap_total=0.000000M,virtual_total=615.222656M, \
                          load_avg=1.920000,load_short=2.270000, \
                          load_medium=1.920000,load_long=2.170000, \
                          mem_free=546.855469M,swap_free=0.000000M, \
                          virtual_free=546.855469M,mem_used=68.367188M, \
                          swap_used=0.000000M,virtual_used=68.367188M, \
                          cpu=0.000000,m_topology=NONE,m_topology_inuse=NONE, \
                          m_socket=-1,m_core=0,np_load_avg=1.920000, \
                          np_load_short=2.270000,np_load_medium=1.920000, \
                          np_load_long=2.170000
    processors            1
    user_lists            NONE
    xuser_lists           NONE
    projects              NONE
    xprojects             NONE
    usage_scaling         NONE
    report_variables      NONE


RESTARTED SGE ON NODE001 AND DID qmod -c TO CANCEL ERROR/AU STATE. SUBMITTED SUCCESSFULLY FOM :

qstat -f
queuename                      qtype resv/used/tot. load_avg arch          states
---------------------------------------------------------------------------------
all.q@master                   BIP   0/0/1          1.60     lx24-amd64    
---------------------------------------------------------------------------------
all.q@node001                  BIP   0/0/1          0.66     lx24-amd64    
---------------------------------------------------------------------------------
default@master                 BIP   0/1/1          1.60     lx24-amd64    
    112 0.55500 test       root         r     05/05/2011 16:02:41     1        
---------------------------------------------------------------------------------
default@node001                BIP   0/1/1          0.66     lx24-amd64    
    111 0.55500 test       root         r     05/05/2011 16:02:41     1  


    
</entry>

<entry [Wed 2011:05:04 19:23:52 EST] SETTING SSH ENV VARS FOR SOURCING settings.sh>

1. SOURCE FIRST ON LOCAL HOST THEN DO SSH ***AND*** REPEAT SOURCE WITHIN SSH COMMAND

DOING JUST THE FIRST PART WILL echo THE NEW ENVIRONMENT VARIABLES BUT THEY WON'T BE USED IN THE COMMAND...(?)

NB: WHEN SOURCING settings.sh YOU GET THIS ERROR BUT THE ENV VARIABLES ARE SET OKAY:
    [: 359: 11: unexpected operator


THIS ** WON'T ** RESTART SGE WITH THE CORRECT ENV VARS
------------------------------------------------------
source /opt/sge6/syoung-project1-workflow1/common/settings.sh; 
export SGE_ROOT=/opt/sge6

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key \
root@10.253.202.159 \
"echo $SGE_ROOT >> /tmp/envars; echo $SGE_QMASTER_PORT >> /tmp/envars; echo $SGE_EXECD_PORT >> /tmp/envars; echo $SGE_CELL >> /tmp/envars; /opt/sge6/bin/lx24-amd64/qconf -ke all; /opt/sge6/bin/lx24-amd64/qconf -km; /opt/sge6/bin/lx24-amd64/sge_qmaster; /opt/sge6/bin/lx24-amd64/sge_execd;"

    critical error: Please set the environment variable SGE_ROOT.
    critical error: Please set the environment variable SGE_ROOT.

ENV VARS ARE CORRECT:

root@master:~# cat /tmp/envars 

    /opt/sge6
    63241
    63242
    syoung-project1-workflow1


BUT SGE IS NOT RUNNING:

root@master:~# ps axu | grep sge
    root     13129  0.0  0.1   6216   656 pts/0    R+   22:46   0:00 grep sge


THIS ** WILL ** RESTART SGE WITH THE CORRECT ENV VARS
-----------------------------------------------------
source /opt/sge6/syoung-project1-workflow1/common/settings.sh; 
export SGE_ROOT=/opt/sge6

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key \
root@10.253.202.159 \
"source /opt/sge6/syoung-project1-workflow1/common/settings.sh; export SGE_ROOT=/opt/sge6; echo $SGE_QMASTER_PORT >> /tmp/envars ; echo $SGE_EXECD_PORT >> /tmp/envars ; echo $SGE_CELL >> /tmp/envars ; /opt/sge6/bin/lx24-amd64/qconf -ke all; /opt/sge6/bin/lx24-amd64/qconf -km; /opt/sge6/bin/lx24-amd64/sge_qmaster; /opt/sge6/bin/lx24-amd64/sge_execd;"

    error: commlib error: got select error (Connection refused)
    ERROR: unable to send message to qmaster using port 63241 on host "master": got send error
    error: commlib error: got select error (Connection refused)
    ERROR: unable to send message to qmaster using port 63241 on host "master": got send error


DESPITE THE COMPLAINTS ABOUT 'unable to send message', THE ENV VARS ARE CORRECT:

cat /tmp/envars 
    /opt/sge6
    63241
    63242
    syoung-project1-workflow1

... AND SGE IS RUNNING:

root@master:~# ps axu | grep sge
sgeadmin 13243  0.0  0.7 130748  4544 ?        Sl   22:47   0:00 /opt/sge6/bin/lx24-amd64/sge_qmaster
sgeadmin 13247  0.0  0.3  55612  2112 ?        Sl   22:47   0:00 /opt/sge6/bin/lx24-amd64/sge_execd
root     13265  0.0  0.1   7620   888 pts/0    S+   22:48   0:00 grep sge



** IMPORTANT ** YOU GET THE WRONG ENV VARS IF YOU DON'T DO source ON THE LOCAL HOST (8e) BEFORE ISSUING THE SSH COMMAND:

cat /tmp/envars 
    63231
    63232
    default

ps aux | grep sge

    sgeadmin 13477  0.0  0.7 130748  4552 ?        Sl   23:11   0:00 /opt/sge6/bin/lx24-amd64/sge_qmaster
    sgeadmin 13481  0.0  0.3  55612  2120 ?        Sl   23:11   0:00 /opt/sge6/bin/lx24-amd64/sge_execd
    root     13511  0.0  0.1   7620   888 pts/0    S+   23:11   0:00 grep sge
    
</entry>
<entry [Wed 2011:05:04 11:01:52 EST] SET UP SEPARATE SGE CELLS ON 8e>

DESIGN POINT:    

    1. A NEW CELL IS CREATED ON 8E FOR EACH CLUSTER THAT IS STARTED

        E.G., /opt/sge6/syoung-smallcluster

    2. WITHIN EACH CELL, A NEW QUEUE IS CREATED FOR EACH WORKFLOW
    
        E.G., syoung-project1-workflow1


http://arc.liv.ac.uk/pipermail/gridengine-users/2010-May.txt
    
a new cell is sufficient. It's just a shared SGE installation which don't know anything about others, but uses different ports for communication. Hence you will need to source the correct `settings.sh` from the cell you want to use for your SGE commands.

REM: NODE IPs

MASTER
ec2-184-72-151-121.compute-1.amazonaws.com
domU-12-31-38-01-C5-51.compute-1.internal
184.72.151.121
10.253.202.159

node001
ec2-50-19-12-149.compute-1.amazonaws.com
ip-10-126-49-153.ec2.internal
50.19.12.149
10.126.49.153

ON 8e
-----

1. CREATE NEW CELL DIRECTORY

scp -pr /opt/sge6/default /opt/sge6/syoung-project1-workflow1


2. UPDATE MASTER'S IP ADDRESS IN act_qmaster FILE

THIS IS REQUIRED IN ORDER TO USE qstat, qsub, ETC. ON 8e

emacs /opt/sge6/syoung-project1-workflow1/common/act_qmaster
    10.253.202.159

3. SET NEW PORTS FOR QMASTER AND EXECD

-   CHOOSE NON-OPEN PORTS INCREMENTED BY 10
-   STORE IN CLUSTER TABLE


4. OPEN NEW PORTS ON EC2 

OPEN PORTS 63241 AND 63242 FOR GROUP @sc-smallcluster
ec2-authorize @sc-smallcluster -p 63241 -P tcp
ec2-authorize @sc-smallcluster -p 63241 -P udp
ec2-authorize @sc-smallcluster -p 63242 -P tcp
ec2-authorize @sc-smallcluster -p 63242 -P udp

5. CREATE NEW settings.sh FILE (SEE NOTES FOR EXAMPLE)

# SET ENV
export SGE_CELL=syoung-project1-workflow1
export SGE_QMASTER_PORT=63241 
export SGE_EXECD_PORT=63242

# CREATE settings.sh
cd /opt/sge6/syoung-project1-workflow1/common
mv settings.sh settings.sh.bkp
/opt/sge6/util/create_settings.sh .
cat settings.sh




ON MASTER
---------

1. CREATE NEW CELL DIRECTORY
**
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key \
root@10.253.202.159 \
"cp -pr /opt/sge6/default /opt/sge6/syoung-project1-workflow1"

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key \
root@10.126.49.153 \
"cp -pr /opt/sge6/default /opt/sge6/syoung-project1-workflow1"

    OK
    

2. RESTART SGE

source /opt/sge6/syoung-project1-workflow1/common/settings.sh; 
export SGE_ROOT=/opt/sge6

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key \
root@10.253.202.159 \
"source /opt/sge6/syoung-project1-workflow1/common/settings.sh; export SGE_ROOT=/opt/sge6; echo $SGE_QMASTER_PORT >> /tmp/envars ; echo $SGE_EXECD_PORT >> /tmp/envars ; echo $SGE_CELL >> /tmp/envars ; /opt/sge6/bin/lx24-amd64/qconf -ke all; /opt/sge6/bin/*lx24-amd64/qconf -km; /opt/sge6/bin/lx24-amd64/sge_qmaster; /opt/sge6/bin/lx24-amd64/sge_execd;"


    error: commlib error: got select error (Connection refused)
    ERROR: unable to send message to qmaster using port 63241 on host "master": got send error
    error: commlib error: got select error (Connection refused)
    ERROR: unable to send message to qmaster using port 63241 on host "master": got send error

NB: DESPITE THE COMPLAINTS ABOUT 'unable to send message', THE ENV VARS ARE CORRECT AND SGE IS RUNNING:

root@master:~# ps axu | grep sge

sgeadmin 13243  0.0  0.7 130748  4544 ? Sl 22:47   0:00 /opt/sge6/bin/lx24-amd64/sge_qmaster
sgeadmin 13247  0.0  0.3  55612  2112 ? Sl 22:47   0:00 /opt/sge6/bin/lx24-amd64/sge_execd
root     13265  0.0  0.1   7620   888 pts/0    S+   22:48   0:00 grep sge



NODES
-----

1. CREATE NEW CELL DIRECTORY

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key \
root@10.253.202.159 \
"cp -pr /opt/sge6/default /opt/sge6/syoung-project1-workflow1"

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key \
root@10.126.49.153 \
"cp -pr /opt/sge6/default /opt/sge6/syoung-project1-workflow1"

    OK
    

2. RESTART SGE

source /opt/sge6/syoung-project1-workflow1/common/settings.sh; 
export SGE_ROOT=/opt/sge6

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key \
root@10.253.202.159 \
"source /opt/sge6/syoung-project1-workflow1/common/settings.sh; export SGE_ROOT=/opt/sge6; echo $SGE_QMASTER_PORT >> /tmp/envars ; echo $SGE_EXECD_PORT >> /tmp/envars ; echo $SGE_CELL >> /tmp/envars ; /opt/sge6/bin/lx24-amd64/qconf -ke all; /opt/sge6/bin/*lx24-amd64/qconf -km; /opt/sge6/bin/lx24-amd64/sge_qmaster; /opt/sge6/bin/lx24-amd64/sge_execd;"



THEN STARTED SOME JOBS WITH THE syoung-project1-workflow1 SGE_CELL (AND OTHER ENV VARS):

source /opt/sge6/syoung-project1-workflow1/common/settings.sh; 
export SGE_ROOT=/opt/sge6

qstat

    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
         83 0.55500 tophat     root         r     05/04/2011 16:26:13 default@node001                    1        
         89 0.55500 test       root         r     05/04/2011 19:31:17 default@master                     1        
         90 0.55500 test       root         r     05/04/2011 19:31:17 all.q@master                       1        


... WHILE AT THE SAME TIME RUNNING JOBS IN THE default SGE_CELL (AND ENV VARS):

source /opt/sge6/default/common/settings.sh; 
export SGE_ROOT=/opt/sge6

qstat

    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
         83 0.55500 tophat     root         r     05/04/2011 16:26:13 default@node001                    1        
        102 0.00000 test       root         qw    05/04/2011 19:31:22                                    1        
        103 0.00000 test       root         qw    05/04/2011 19:31:22                                    1        
        104 0.00000 test       root         qw    05/04/2011 19:31:23                                    1        
        105 0.00000 test       root         qw    05/04/2011 19:31:24                                    1        



    OK!!!



NOTES
-----

USING create_settings.sh TO CREATE settings.sh FILE
---------------------------------------------------

usage: create_settings.sh outdir
       $SGE_ROOT must be set
       $SGE_CELL, $SGE_QMASTER_PORT and $SGE_EXECD_PORT must be set if used in your environment
       $SGE_CLUSTER_NAME must be set or $SGE_ROOT and $SGE_CELL must be set

1. SET ENVIRONMENT VARIABLES

export SGE_CELL=syoung-project1-workflow1
SGE_QMASTER_PORT=63241; export SGE_QMASTER_PORT
SGE_EXECD_PORT=63242; export SGE_EXECD_PORT

2. CREATE settings.sh

cd /opt/sge6/syoung-project1-workflow1/common
/opt/sge6/util/create_settings.sh .
cat settings.sh

    SGE_ROOT=/opt/sge6; export SGE_ROOT
    
    ARCH=`$SGE_ROOT/util/arch`
    DEFAULTMANPATH=`$SGE_ROOT/util/arch -m`
    MANTYPE=`$SGE_ROOT/util/arch -mt`
    
    SGE_CELL=syoung-project1-workflow1; export SGE_CELL
    SGE_CLUSTER_NAME=; export SGE_CLUSTER_NAME
    SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT
    SGE_EXECD_PORT=63232; export SGE_EXECD_PORT
    
    if [ "$MANPATH" = "" ]; then
       MANPATH=$DEFAULTMANPATH
    fi
    MANPATH=$SGE_ROOT/$MANTYPE:$MANPATH; export MANPATH
    
    PATH=$SGE_ROOT/bin/$ARCH:$PATH; export PATH
    # library path setting required only for architectures where RUNPATH is not supported
    case $ARCH in
    sol*|lx*|hp11-64)
       ;;
    *)
       shlib_path_name=`$SGE_ROOT/util/arch -lib`
       old_value=`eval echo '$'$shlib_path_name`
       if [ x$old_value = x ]; then
          eval $shlib_path_name=$SGE_ROOT/lib/$ARCH
       else
          eval $shlib_path_name=$SGE_ROOT/lib/$ARCH:$old_value
       fi
       export $shlib_path_name
       unset shlib_path_name old_value
       ;;
    esac
    unset ARCH DEFAULTMANPATH MANTYPE



CONTENTS OF DEFAULT settings.sh
-------------------------------

emacs /opt/sge6/default/common/settings.sh

    SGE_ROOT=/opt/sge6; export SGE_ROOT
    
    ARCH=`$SGE_ROOT/util/arch`
    DEFAULTMANPATH=`$SGE_ROOT/util/arch -m`
    MANTYPE=`$SGE_ROOT/util/arch -mt`
    
    SGE_CELL=default; export SGE_CELL
    SGE_CLUSTER_NAME=starcluster; export SGE_CLUSTER_NAME
    SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT
    SGE_EXECD_PORT=63232; export SGE_EXECD_PORT
    
    if [ "$MANPATH" = "" ]; then
       MANPATH=$DEFAULTMANPATH
    fi
    MANPATH=$SGE_ROOT/$MANTYPE:$MANPATH; export MANPATH
    
    PATH=$SGE_ROOT/bin/$ARCH:$PATH; export PATH
    # library path setting required only for architectures where RUNPATH is not supported                                                                                                                
    case $ARCH in
    sol*|lx*|hp11-64)
       ;;
    *)
       shlib_path_name=`$SGE_ROOT/util/arch -lib`
       old_value=`eval echo '$'$shlib_path_name`
       if [ x$old_value = x ]; then
          eval $shlib_path_name=$SGE_ROOT/lib/$ARCH
       else
          eval $shlib_path_name=$SGE_ROOT/lib/$ARCH:$old_value
       fi
       export $shlib_path_name
       unset shlib_path_name old_value
       ;;
    esac
    unset ARCH DEFAULTMANPATH MANTYPE


POSTS ON SGE CELLS
------------------

http://arc.liv.ac.uk/pipermail/gridengine-users/2006-August.txt

From reuti at staff.uni-marburg.de  Tue Aug  8 10:06:21 2006
From: reuti at staff.uni-marburg.de (Reuti)
Date: Tue, 8 Aug 2006 11:06:21 +0200
Subject: [GE users] Adding a new cell
Message-ID: < mailman.11170.1294864792.7834.gridengine-users@liv.ac.uk>

Hi,

Am 08.08.2006 um 10:56 schrieb John Hearns:

> Has anyone ever added a new SGE cell to an already running  
> installation?
>
> I have created a second script to start the sge master, using a  
> different SGE_CELL name and
> different ports for qmaster and execd.
> I cannot connect to the qmaster on the new port:
> " error: commlib error: can't connect to service (Connection refused)
> unable to contact qmaster using port 1801 "

you just duplicated the sgemaster script? You also need the complete  
directory in $SGE_ROOT, which is normally called "default" (i.e. the  
name of the cell) and bootstrap some information there.

Before you start the manual installation, export the SGE_QMASTER_PORT  
and SGE_EXECD_PORT with the new information, to supersede the  
information you might get otherwise with /etc/services.

In the end you have two qmaster running on this machine; one for each  
cell.

HTH - Reuti


http://gridengine.sunsource.net/ds/viewMessage.do?dsForumId=38&dsMessageId=257863

To unsubscribe from this discussion, e-mail: [users-unsubscribe at gridengine.sunsource.net].


From reuti at staff.uni-marburg.de  Wed May 19 15:17:38 2010
From: reuti at staff.uni-marburg.de (reuti)
Date: Wed, 19 May 2010 15:17:38 +0100
Subject: [GE users] resource quota question
Message-ID: < mailman.30590.1294864917.7834.gridengine-users@liv.ac.uk>

Hi,

Am 19.05.2010 um 15:52 schrieb rumpelkeks:

> Hi,
> 
> < snip>
>>> Not sure - what are the exact implications? What it says on the box, 
>>> exclusive access to that queue? So it would suspend all jobs in 
>>> subordinate queues and give that qsub exclusive queue access? In which 
>>> case I don't think. It is not supposed to use all nodes in the queue, 
>>> just a subset. (I don't want to have a queue for every problem, really; 
>>> I'm trying to avoid that.)
>> 
>> Aha, what about this: remove the subordination (hence fill both queues 
>> (may an adjustment to any total slot count is also necessary).
>> When I got you right, the endless application won't generate any load all the time. 
>> If it starts to generate load, you could use a suspend_threshold (for the user with 
>> the endless job) to suspend itself when his load plus the one of the normal queue 
>> exceeds a limit. If he is alone on the machine, his job will continue.
>> 
>> I think you have already two queues (a normal one and one for the special user) anyway.
> < /snip>
> 
> Interesting suggestion. Not sure it works, but would need to try. The 
> special users application - the one that just keeps running - does 
> create load all the time (and always uses all available slots, I 
> believe, so at the moment no further jobs would be schedules onto them 
> anyway (but that could be changed).
> 
> What we have is four queues, actually. Bottom, Low, Medium, High. Bottom 
> subordinate to everything, Low to Medium and High, Medium to High (you 
> get the picture). Standard request submits to medium (got a time limit). 
> Low is without a time limit. Bottom the one for the special user (I call 
> him my background noise). High can only be used by our data acquisition 
> software, as this must take precedence in whatever situation. The main 
> requirement on the cluster is that whenever data is taken and some 
> special data reduction software is run, this must be run instantly 
> ('real time' data processing), across as much of the cluster as 
> possible. So High goes and suspends everything else (pretty quickly). 
> That's also what needed the 'exclusive' most.
> 
> People are quite happy with that, it seems really. I was just (at the 
> moment) trying to solve a problem of sharing between low and bottom 
> queue, so trying to make a user of low 'share' resources with bottom - 
> so not actually what we should be doing. I like the idea of getting rid 
> of bottom and put the 'continuous jobs' user back into low, with 
> appropriate thresholds set. That would work just fine, I guess. Thanks 
> for setting my head right!
> 
> Btw (although off-topic here) - I want to set up a test cluster so I can 
> test even scheduler changes more freely in the future. Does that really 
> require a second SGE installation, or is a second cell sufficient (i.e. 
> is any configuration above cell level)?

a new cell is sufficient. It's just a shared SGE installation which don't know anything about others, but uses different ports for communication. Hence you will need to source the correct `settings.sh` from the cell you want to use for your SGE commands.

I even have two older machines set aside just for a mini cluster to test things.

-- Reuti

    
</entry>

<entry [Tue 2011:05:03 15:30:59 EST] RUN TOPHAT ON smallcluster>
    
    
SUMMARY:

    1. MUST SET pe 1 IN *.sh FILE AND '--num-threads 1' IN SCRIPT IF RUNNING 1 CPU NODES
    (SGE WILL NOT WARN YOU IF YOU OVERCLAIM CPUs EITHER IN THE PE OR IN THE APPLICATION)
    
    2. CLEANED OUT master/node001 LEGACY INFORMATION REMAINING ON 8e FROM ITS PREVIOUS LIFE
    /etc/hosts
    qconf -me master
    qconf -me node001

    NB: qconf -Me master OR node GAVE AN ERROR WHEN USING NODES OWN qconf -se master OUTPUT!
    
    qconf -Me /nethome/admin/agua/.sge/conf/host-node001.conf
        error: unknown attribute name "load_values"
        error: error reading file: "/nethome/admin/agua/.sge/conf/host-node001.conf"
        invalid format

    3. RESTART SGE ON ALL NODES USING SSH COMMAND

    starcluster sshnode node001 "/opt/sge6/bin/lx24-amd64/qconf -ke all"
    starcluster sshnode node001 "/opt/sge6/bin/lx24-amd64/sge_execd"

    4. USE all.q BUT WITH DIFFERENT CELL PER WORKFLOW:

    COPY /opt/sge6/default DIRECTORY TO /opt/sge6/USERNAME-WORKFLOWNAME
    
    5. SET EXEC HOSTS BY IP ADDRESS (NOT NAMES master, node001, ETC.)
    
        (CAN'T USE master, node001, ETC. IN /etc/hosts BECAUSE OF CONFLICTS
        
        BETWEEN CELLS)
    

CLIENT PUT:

echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"1"}' | ./workflow.cgi

WHICH RUNS:

/usr/bin/perl /agua/0.6/bin/apps/expression/TOPHAT.pl --cpus 3 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --label yoruba --matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt  --outputdir /nethome/syoung/agua/Project1/Workflow1 --queue default --reference /nethome/syoung/agua/Project1/Workflow1/chr22 --species human 1> /nethome/syoung/agua/Project1/Workflow1/stdout/1-TOPHAT.stdout 2> /nethome/syoung/agua/Project1/Workflow1/stderr/1-TOPHAT.stderr


WHICH RUNS:

/opt/sge6/bin/lx24-amd64//qsub -t 1-1 -q default /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh

WHICH RUNS MULTIPLE TASKS OF THIS:


export PATH=/data/apps/bowtie/0.12.2:$PATH
export PATH=/data/apps/tophat/1.0.12/bin:$PATH
export PATH=/nethome/syoung/agua/Project1/Workflow1/chr22/chr22/1:$PATH

mkdir -p /nethome/syoung/agua/Project1/Workflow1/chr22/1
cd /nethome/syoung/agua/Project1/Workflow1/chr22/1

time /data/apps/tophat/1.0.12/bin/tophat \
--num-threads 3 \
--keep-tmp \
--output-dir /nethome/syoung/agua/Project1/Workflow1/chr22/1 \
--mate-inner-dist 200 \
/nethome/syoung/agua/Project1/Workflow1/chr22/chr22 \
/nethome/syoung/agua/Project1/Workflow1/1/yoruba_1.1.txt \
/nethome/syoung/agua/Project1/Workflow1/1/yoruba_2.1.txt 
unlink /nethome/syoung/agua/Project1/Workflow1/chr22/lock/1/tophatBatchAlignment-chr22-lock.txt;



QSUB GIVES ERROR:

    Agua::Monitor::SGE::submitJob    JOBID_REGEX: ^(Your job|Your job-array) (\S+)
     { error: 'Agua::Monitor::SGE::submitJob    job_id not defined' }


/opt/sge6/bin/lx24-amd64//qsub -t 1-1 -q default /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh


qstat -j 15
    ==============================================================
    job_number:                 15
    exec_file:                  job_scripts/15
    submission_time:            Tue May  3 19:31:51 2011
    owner:                      root
    uid:                        0
    group:                      root
    gid:                        0
    sge_o_home:                 /root
    sge_o_log_name:             root
    sge_o_path:                 /usr/bin:/opt/sge6/bin/lx24-amd64:/agua/bin/apps/logic:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/sge6/bin/lx24-amd64
    sge_o_shell:                /bin/bash
    sge_o_workdir:              /root
    sge_o_host:                 ip-10-122-61-250
    account:                    sge
    stderr_path_list:           NONE:NONE:/nethome/syoung/agua/Project1/Workflow1/chr22/stdout/$TASKNUM/tophatBatchAlignment-chr22-stderr.txt
    hard resource_list:         h_rt=86400
    mail_list:                  root@ip-10-122-61-250.ec2.internal
    notify:                     FALSE
    job_name:                   tophatBatchAlignment-chr22
    stdout_path_list:           NONE:NONE:/nethome/syoung/agua/Project1/Workflow1/chr22/stdout/$TASKNUM/tophatBatchAlignment-chr22-stdout.txt
    jobshare:                   0
    hard_queue_list:            default
    env_list:                   
    script_file:                /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh
    parallel environment:  threaded range: 3
    job-array tasks:            1-1:1
    scheduling info:            queue instance "all.q@node001" dropped because it is temporarily not available
                                queue instance "default@node001" dropped because it is temporarily not available
                                cannot run in PE "threaded" because it only offers 0 slots


RESUBMIT WITHOUT QUEUE default:

/opt/sge6/bin/lx24-amd64//qsub -t 1-1  /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh

... GAVE SAME AS ABOVE


MADE SCRIPT USE pe 1 AND --num-threads 1 AND THE 'cannot run in PE' DISAPPEARED, TO BE REPLACED BY THIS ERROR:

/opt/sge6/bin/lx24-amd64//qsub -t 1-1  /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh

qstat -j 18

    scheduling info:            queue instance "all.q@node001" dropped because it is temporarily not available
                                queue instance "default@node001" dropped because it is temporarily not available
                                queue instance "all.q@master" dropped because it is overloaded: np_load_avg=11.510000 (no load adjustment) >= 1.75
                                queue instance "default@master" dropped because it is overloaded: np_load_avg=11.510000 (no load adjustment) >= 4
                                All queues dropped because of overload or full


THE THRESHOLD IS SET IN THE default QUEUE BY qconf:

qconf -sq default  |grep np_load_avg
    load_thresholds       np_load_avg=4


EDITED MANUALLY qconf FOR DEFAULT:

qconf -mq default

AND CHANGED FROM: 

TO THIS:
load_thresholds       np_load_avg=24



AFTER WHICH, THIS LINE DISAPPEARED FROM qstat -j 19:

    queue instance "default@master" dropped because it is overloaded: np_load_avg=11.510000 (no load adjustment) >= 4

qconf -mq all.q

CHANGED THIS:
load_thresholds       np_load_avg=1.75

TO THIS:
load_thresholds       np_load_avg=40

    root@ip-10-122-61-250.ec2.internal modified "all.q" in cluster queue list
    
THEN JOB 19 RAN:

 qstat -j 19
Following jobs do not exist: 
19


NOW SUBMITTING test.sh (SLEEP COUNTER) GIVES THIS ERROR:

    queue instance "all.q@node001" dropped because it is temporarily not available
    queue instance "default@master" dropped because it is full
    cannot run in queue "all.q" because it is not contained in its hard queue list (-q)





CHECKED messages ON MASTER:

root@master:~/test# cat /opt/sge6/default/spool/qmaster/messages
    
    ...
    05/03/2011 19:37:32|worker|master|E|parallel environment "threaded" already exists
    05/03/2011 19:37:36|schedu|master|E|invalid pe job range setting for job 14
    
    05/03/2011 19:37:36|schedu|master|E|invalid pe job range setting for job 15
    
    05/03/2011 19:37:51|schedu|master|E|invalid pe job range setting for job 14
    
    05/03/2011 19:37:51|schedu|master|E|invalid pe job range setting for job 15
    
root@master:~/test# dated
Tue May  3 20:50:07 UTC 2011


CREATED tophat.sh

    #!/bin/sh
    
    #$ -N tophat
    #$ -o /nethome/syoung/agua/Project1/Workflow1/tophat.out
    #$ -e /nethome/syoung/agua/Project1/Workflow1/tophat.err
    ##$ -q syoung-Project1-Workflow1
    #$ -l h_rt=:00:00
    
    echo COMMD_PORT: $COMMD_PORT
    echo SGE_ROOT: $SGE_ROOT
    echo SGE_CELL: $SGE_CELL
    echo SGE_JOB_SPOOL_DIR: $SGE_JOB_SPOOL_DIR
    echo SGE_O_HOME: $SGE_O_HOME
    echo SGE_O_HOST: $SGE_O_HOST
    echo SGE_O_LOGNAME: $SGE_O_LOGNAME
    echo SGE_O_MAIL: $SGE_O_MAIL
    echo SGE_O_PATH: $SGE_O_PATH
    echo SGE_O_SHELL: $SGE_O_SHELL
    echo SGE_O_TZ: $SGE_O_TZ
    echo SGE_O_WORKDIR: $SGE_O_WORKDIR
    echo SGE_CKPT_ENV: $SGE_CKPT_ENV
    echo SGE_CKPT_DIR: $SGE_CKPT_DIR
    echo SGE_STDERR_PATH:$SGE_STDERR_PATH
    echo SGE_STDOUT_PATH:$SGE_STDOUT_PATH
    echo SGE_TASK_ID: $SGE_TASK_ID
    echo HOME: $HOME
    echo HOSTNAME: $HOSTNAME
    echo JOB_ID: $JOB_ID
    echo JOB_NAME: $JOB_NAME
    echo NQUEUES: $NQUEUES
    echo NSLOTS: $NSLOTS
    hostname -f
    
    
    date > /nethome/syoung/agua/Project1/Workflow1/chr22/lock/1/tophatBatchAlignment-chr22-lock.txt;
    
    export PATH=/data/apps/bowtie/0.12.2:$PATH
    export PATH=/data/apps/tophat/1.0.12/bin:$PATH
    export PATH=/nethome/syoung/agua/Project1/Workflow1/chr22/chr22/1:$PATH
    
    mkdir -p /nethome/syoung/agua/Project1/Workflow1/chr22/1
    cd /nethome/syoung/agua/Project1/Workflow1/chr22/1
    
    time /data/apps/tophat/1.0.12/bin/tophat \
    --num-threads 1 \
    --keep-tmp \
    --output-dir /nethome/syoung/agua/Project1/Workflow1/chr22/1 \
    --mate-inner-dist 200 \
    /nethome/syoung/agua/Project1/Workflow1/chr22/chr22 \
    /nethome/syoung/agua/Project1/Workflow1/1/yoruba_1.1.txt \
    /nethome/syoung/agua/Project1/Workflow1/1/yoruba_2.1.txt
     
    unlink /nethome/syoung/agua/Project1/Workflow1/chr22/lock/1/tophatBatchAlignment-chr22-lock.txt;


RAN tophat.sh:

qsub tophat.sh


GOT THIS ERROR:

opt/sge6/default/spool/exec_spool_local/master/job_scripts/32: 35: cannot create

/nethome/syoung/agua/Project1/Workflow1/chr22/lock/1/tophatBatchAlignment-chr22-lock.txt

: Directory nonexistent


SO PRECREATED LOCK FILE DIR:

mkdir -p /nethome/syoung/agua/Project1/Workflow1/chr22/lock/1/

AND RAN AGAIN:

cd /nethome/syoung/agua/Project1/Workflow1/scripts
qsub tophat.sh

Your job 33 ("tophat") has been submitted


BUT IT DIED AGAIN:

tail -f /opt/sge6/default/spool/qmaster/messages

    05/03/2011 21:08:39|worker|master|W|job 33.1 failed on host master assumedly after job because: job 33.1 died through signal KILL (9)


CAN RUN tophat MANUALLY BUT SUBMITTED JOBS TERMINATE WITH NO ERROR:


AND test.sh GIVES THIS ERROR:

    queue instance "default@node001" dropped because it is temporarily not available
    queue instance "all.q@node001" dropped because it is temporarily not available
    queue instance "default@master" dropped because it is full



NOTE THAT all.q HAS A SLOT LIST:

qconf -sq all.q

    slots                 1,[ip-10-86-250-251.ec2.internal=1], [ip-10-86-193-30.ec2.internal=1]



AND default QUEUE HAS ONLY THIS:

    slots                 1


SO EDITED default MANUALLY:

qconf -mq default


NOW I GET:

scheduling info:
    queue instance "all.q@node001" dropped because it is temporarily not available
    queue instance "default@node001" dropped because it is temporarily not available



QHOST SHOWS THAT node001 IS NOT LOADED AT ALL:

qhost

    HOSTNAME                ARCH         NCPU  LOAD  MEMTOT  MEMUSE  SWAPTO  SWAPUS
    -------------------------------------------------------------------------------
    global                  -               -     -       -       -       -       -
    master                  lx24-amd64      1  1.73  615.2M   68.6M     0.0     0.0
    node001                 lx24-amd64      1     -  615.2M       -     0.0       -


AND qconf -me SHOWS THAT NEITHER master NOR node001 ARE EXECUTION HOSTS:


qconf -me master
ip-10-86-250-251.ec2.internal is not an execution host
root@ip-10-122-61-250:~# qconf -me node001
ip-10-86-193-30.ec2.internal is not an execution host


EVEN THOUGH THEY ARE IN THE EXECUTION HOST LIST: 

root@ip-10-122-61-250:~# qconf -sel
    master
    node001


... CAN'T GET THEIR EXECUTION CONFIGURATION:

root@ip-10-122-61-250:~# qconf -se master
    ip-10-86-250-251.ec2.internal is not an execution host


SO SET AS EXECUTION HOSTS:

qconf -ae master
qconf -ae node001


root@ip-10-122-61-250:~# qconf -sel
master
node001
root@ip-10-122-61-250:~# qconf -se master
ip-10-86-250-251.ec2.internal is not an execution host


NOT GETTING ANY INFO ON 8e BUT WHEN SSH'D TO MASTER COULD ACCESS THE EXECUTION HOST INFO:

FIRST HAD TO SORT OUT MASTER'S HOSTNAME:

root@master:~/test# qconf -sel
error: commlib error: access denied (client IP resolved to host name "domU-12-31-38-01-C5-51.compute-1.internal". This is not identical to clients host name "master")
ERROR: unable to send message to qmaster using port 63231 on host "master": got send error
root@master:~/test# hostname master
root@master:~/test# qconf -sel

    master
    node001


qconf -se master

    hostname              master
    load_scaling          NONE
    complex_values        NONE
    load_values           arch=lx24-amd64,num_proc=1,mem_total=615.222656M, \
                          swap_total=0.000000M,virtual_total=615.222656M, \
                          load_avg=1.920000,load_short=2.270000, \
                          load_medium=1.920000,load_long=2.170000, \
                          mem_free=546.855469M,swap_free=0.000000M, \
                          virtual_free=546.855469M,mem_used=68.367188M, \
                          swap_used=0.000000M,virtual_used=68.367188M, \
                          cpu=0.000000,m_topology=NONE,m_topology_inuse=NONE, \
                          m_socket=-1,m_core=0,np_load_avg=1.920000, \
                          np_load_short=2.270000,np_load_medium=1.920000, \
                          np_load_long=2.170000
    processors            1
    user_lists            NONE
    xuser_lists           NONE
    projects              NONE
    xprojects             NONE
    usage_scaling         NONE
    report_variables      NONE


THIS WAS DUE TO AN INCORRECT (OLD) ENTRY FOR master IN /etc/hosts

ON 8e
-----
/opt/sge6/utilbin//lx24-amd64/gethostname 
    Hostname: ip-10-122-61-250.ec2.internal
    Aliases:  
    Host Address(es): 10.122.61.250 

ON master
---------

/opt/sge6/utilbin//lx24-amd64/gethostname 
    Hostname: master
    Aliases:  
    Host Address(es): 10.253.202.159 


ON node001
----------

/opt/sge6/utilbin//lx24-amd64/gethostname 
    Hostname: node001
    Aliases:  
    Host Address(es): 10.126.49.153 


... WHICH BOTH CONCUR WITH ec2din.


SO COMMENTED OUT THE INCORRECT ENTRIES IN /etc/hosts ON 8e:

root@ip-10-122-61-250:~# cat /etc/hosts

    127.0.0.1 localhost
    
    # The following lines are desirable for IPv6 capable hosts
    ::1 ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    ff02::3 ip6-allhosts
    #10.86.250.251 ip-10-86-250-251.ec2.internal ip-10-86-250-251 master
    #10.86.193.30 ip-10-86-193-30.ec2.internal ip-10-86-193-30 node001


AND REDID CONFIGURATION OF MASTER:

qconf -se 10.253.202.159
domU-12-31-38-01-C5-51.compute-1.internal is not an execution host

root@ip-10-122-61-250:~# qconf -ae 10.253.202.159
domU-12-31-38-01-C5-51.compute-1.internal is no exec host
root@ip-10-122-61-250:~# qconf -ae 
added host domU-12-31-38-01-C5-51.compute-1.internal to exec host list
root@ip-10-122-61-250:~# qconf -se 10.253.202.159
hostname              domU-12-31-38-01-C5-51.compute-1.internal
load_scaling          NONE
complex_values        NONE
load_values           NONE
processors            0
user_lists            NONE
xuser_lists           NONE
projects              NONE
xprojects             NONE
usage_scaling         NONE
report_variables      NONE


NODE IPs
--------

MASTER
ec2-184-72-151-121.compute-1.amazonaws.com
domU-12-31-38-01-C5-51.compute-1.internal
184.72.151.121
10.253.202.159

node001
ec2-50-19-12-149.compute-1.amazonaws.com
ip-10-126-49-153.ec2.internal
50.19.12.149
10.126.49.153



WHEN EDIT default QUEUE USING qconf -mq default KEEP GETTING THIS ERROR:

error: Value for "10.126.49.153" is multiply defined
error: error reading file: "/tmp/pid-21848-LF6ov8"
error reading in file


SO DELETED default AND RE-ADDED USING THIS COPY, REPLACING OLD IP WITH LINE TAKEN FROM default QUEUE DEFINITION ON MASTER:

slots                 1,[domU-12-31-38-01-C5-51.compute-1.internal=1], \
                      [ip-10-126-49-153.ec2.internal=1]

OFFENDING LINE ON 8e:

slots                 1,[ip-10-86-193-30.ec2.internal=1], \
                      [domU-12-31-38-01-C5-51.compute-1.internal=1]

ON 8e:

emacs /nethome/admin/agua/.sge/conf/queue-default.conf

qname                 default
hostlist              @allhosts
seq_no                0
load_thresholds       np_load_avg=24
suspend_thresholds    NONE
nsuspend              1
suspend_interval      00:05:00
priority              0
min_cpu_interval      00:05:00
processors            UNDEFINED
qtype                 BATCH INTERACTIVE
ckpt_list             NONE
pe_list               make orte threaded
rerun                 FALSE
slots                 1,[domU-12-31-38-01-C5-51.compute-1.internal=1], \
                      [ip-10-126-49-153.ec2.internal=1]
tmpdir                /tmp
shell                 /bin/sh
prolog                NONE
epilog                NONE
shell_start_mode      posix_compliant
starter_method        NONE
suspend_method        NONE
resume_method         NONE
terminate_method      NONE
notify                00:00:60
owner_list            NONE
user_lists            NONE
xuser_lists           NONE
subordinate_list      NONE
complex_values        NONE
projects              NONE
xprojects             NONE
calendar              NONE
initial_state         default
s_rt                  INFINITY
h_rt                  INFINITY
s_cpu                 INFINITY
h_cpu                 INFINITY
s_fsize               INFINITY
h_fsize               INFINITY
s_data                INFINITY
h_data                INFINITY
s_stack               INFINITY
h_stack               INFINITY
s_core                INFINITY
h_core                INFINITY
s_rss                 INFINITY
h_rss                 INFINITY
s_vmem                INFINITY
h_vmem                INFINITY


DELETE AND ADD BACK:

qconf -dq default
qconf -Aq /nethome/admin/agua/.sge/conf/queue-default.conf



RUN TEST:

cd /nethome/syoung/agua/Project1/Workflow1/
qsub test.sh

tail -f /opt/sge6/default/spool/qmaster/messages


http://gridengine.sunsource.net/howto/nfsreduce.html


As the accounting file is written by the qmaster, only on the master node the `qacct` will work, because there is no accounting information on any node.


qacct -h
    HOST        WALLCLOCK         UTIME         STIME           CPU             MEMORY                 IO                IOW
    ========================================================================================================================
    master           4837       509.530        14.800       574.900            125.408              6.171              0.000
    node001            32         0.000         0.000         0.000              0.000              0.000              0.000
    

ON MASTER:

emacs /opt/sge6/default/spool/exec_spool_local/master/messages 

    05/04/2011 03:36:38|  main|master|W|job 48.1 exceeded hard wallclock time - initiate terminate method

    

SO SUBMITS WERE KILLED IMMEDIATELY BECAUSE OF THE WALLTIME:



NOW I CAN RUN TOPHAT BUT ONLY ON MASTER, NOT ON NODE001:

qstat
    job-ID  prior   name       user         state submit/start at queue  slots ja-task-ID
        
    -----------------------------------------------------------------------------
    54 0.55500 tophat     root         r     05/04/2011 04:32:07 all.q@master    1        
    55 0.00000 tophat     root         qw    05/04/2011 04:38:44   1        

qstat -f

    queuename                      qtype resv/used/tot. load_avg arch          states
    ---------------------------------------------------------------------------------
    all.q@master                   BIP   0/1/1          8.98     lx24-amd64    
         54 0.55500 tophat     root         r     05/04/2011 04:32:07     1        
    ---------------------------------------------------------------------------------
    all.q@node001                  BIP   0/0/1          -NA-     lx24-amd64    au
    ---------------------------------------------------------------------------------
    default@master                 BIP   0/0/1          8.98     lx24-amd64    
    ---------------------------------------------------------------------------------
    default@node001                BIP   0/0/1          -NA-     lx24-amd64    au
    
    ############################################################################
     - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
    ############################################################################
         55 0.00000 tophat     root         qw    05/04/2011 04:38:44     1        
    root@ip-10-122-61-250:/nethome/syoung/agua/Project1/Workflow2# qstat -j 55



qstat -j 55


scheduling info:            queue instance "all.q@node001" dropped because it is temporarily not available
                            queue instance "default@node001" dropped because it is temporarily not available
                            queue instance "all.q@master" dropped because it is full
                            queue instance "default@master" dropped because it is full




FURTHERMORE, THE all.q HAS THE WRONG IP FOR NODE 001:

SHOULD BE:

    slots                 1,[domU-12-31-38-01-C5-51.compute-1.internal=1], \
                      [ip-10-126-49-153.ec2.internal=1]

OFFENDING LINE ON 8e:

INSTEAD OF:

    slots                 1,[ip-10-86-193-30.ec2.internal=1], \
                      [domU-12-31-38-01-C5-51.compute-1.internal=1]


REM: NODE IPs
-------------

MASTER
ec2-184-72-151-121.compute-1.amazonaws.com
domU-12-31-38-01-C5-51.compute-1.internal
184.72.151.121
10.253.202.159

node001
ec2-50-19-12-149.compute-1.amazonaws.com
ip-10-126-49-153.ec2.internal
50.19.12.149
10.126.49.153


ON 8e
-----

emacs /nethome/admin/agua/.sge/conf/queue-all.q.conf

qconf -sq all.q

qname                 all.q
hostlist              @allhosts
seq_no                0
load_thresholds       np_load_avg=40
suspend_thresholds    NONE
nsuspend              1
suspend_interval      00:05:00
priority              0
min_cpu_interval      00:05:00
processors            UNDEFINED
qtype                 BATCH INTERACTIVE
ckpt_list             NONE
pe_list               make orte
rerun                 FALSE
slots                 1,[domU-12-31-38-01-C5-51.compute-1.internal=1], \
                      [ip-10-126-49-153.ec2.internal=1]
tmpdir                /tmp
shell                 /bin/bash
prolog                NONE
epilog                NONE
shell_start_mode      posix_compliant
starter_method        NONE
suspend_method        NONE
resume_method         NONE
terminate_method      NONE
notify                00:00:60
owner_list            NONE
user_lists            NONE
xuser_lists           NONE
subordinate_list      NONE
complex_values        NONE
projects              NONE
xprojects             NONE
calendar              NONE
initial_state         default
s_rt                  INFINITY
h_rt                  INFINITY
s_cpu                 INFINITY
h_cpu                 INFINITY
s_fsize               INFINITY
h_fsize               INFINITY
s_data                INFINITY
h_data                INFINITY
s_stack               INFINITY
h_stack               INFINITY
s_core                INFINITY
h_core                INFINITY
s_rss                 INFINITY
h_rss                 INFINITY
s_vmem                INFINITY
h_vmem                INFINITY



NB: REMOVED THESE LINES:

slots                 1,[ip-10-86-250-251.ec2.internal=1], \
                      [ip-10-86-193-30.ec2.internal=1]


DELETED AND RE-ADDED QUEUE all.q:

qconf -dq all.q
    root@ip-10-122-61-250.ec2.internal removed "all.q" from cluster queue lis

qconf -Aq /nethome/admin/agua/.sge/conf/queue-all.q.conf
    root@ip-10-122-61-250.ec2.internal added "all.q" to cluster queue list


BUT qstat -f STILL SHOWS NODE001 AS 'dropped because it is temporarily not available' 

emacs /opt/sge6/default/spool/exec_spool_local/master/messages 



RESTARTED SGE ON MASTER BUT NODE001 STILL NOT RUNNING JOBS.


COPY qconf FOR MASTER AND USE TO MODIFY NODE001:

hostname              master
load_scaling          NONE
complex_values        NONE
load_values           arch=lx24-amd64,num_proc=1,mem_total=615.222656M, \
                      swap_total=0.000000M,virtual_total=615.222656M, \
                      load_avg=1.080000,load_short=1.570000, \
                      load_medium=1.080000,load_long=0.980000, \
                      mem_free=539.175781M,swap_free=0.000000M, \
                      virtual_free=539.175781M,mem_used=76.046875M, \
                      swap_used=0.000000M,virtual_used=76.046875M, \
                      cpu=0.000000,m_topology=NONE,m_topology_inuse=NONE, \
                      m_socket=-1,m_core=0,np_load_avg=1.080000, \
                      np_load_short=1.570000,np_load_medium=1.080000, \
                      np_load_long=0.980000
processors            1
user_lists            NONE
xuser_lists           NONE
projects              NONE
xprojects             NONE
usage_scaling         NONE
report_variables      NONE


emacs /nethome/admin/agua/.sge/conf/host-node001.conf
    hostname              node001
    load_scaling          NONE
    complex_values        NONE
    load_values           arch=lx24-amd64,num_proc=1,mem_total=615.222656M, \
                          swap_total=0.000000M,virtual_total=615.222656M, \
                          load_avg=1.080000,load_short=1.570000, \
                          load_medium=1.080000,load_long=0.980000, \
                          mem_free=539.175781M,swap_free=0.000000M, \
                          virtual_free=539.175781M,mem_used=76.046875M, \
                          swap_used=0.000000M,virtual_used=76.046875M, \
                          cpu=0.000000,m_topology=NONE,m_topology_inuse=NONE, \
                          m_socket=-1,m_core=0,np_load_avg=1.080000, \
                          np_load_short=1.570000,np_load_medium=1.080000, \
                          np_load_long=0.980000
    processors            1
    user_lists            NONE
    xuser_lists           NONE
    projects              NONE
    xprojects             NONE
    usage_scaling         NONE
    report_variables      NONE


BUT GET AN ERROR 'unknown attribute name "load_values"': 

qconf -Me /nethome/admin/agua/.sge/conf/host-node001.conf
    error: unknown attribute name "load_values"
    error: error reading file: "/nethome/admin/agua/.sge/conf/host-node001.conf"
    invalid format


AND GET THE SAME ERROR WHEN USING NODE001'S OWN qconf -se OUTPUT!:

emacs /nethome/admin/agua/.sge/conf/host-node001-original.conf
hostname              node001
load_scaling          NONE
complex_values        NONE
load_values           arch=lx24-amd64,num_proc=1,mem_total=615.222656M, \
                      swap_total=0.000000M,virtual_total=615.222656M
processors            1
user_lists            NONE
xuser_lists           NONE
projects              NONE
xprojects             NONE
usage_scaling         NONE
report_variables      NONE

qconf -Me /nethome/admin/agua/.sge/conf/host-node001-original.conf
    error: unknown attribute name "load_values"
    error: error reading file: "/nethome/admin/agua/.sge/conf/host-node001-original.conf"
    invalid format


SO TRIED CHANGING NODE001'S qconf INFO MANUALLY TO MASTER'S INFO:

qconf -me node001



THEN I NOTICED THAT IN QSTAT, NODE001'S STATE IS 'au':

qstat -f
queuename                      qtype resv/used/tot. load_avg arch          states
---------------------------------------------------------------------------------
all.q@master                   BIP   0/1/1          1.35     lx24-amd64    
     66 0.55500 test       root         r     05/04/2011 14:25:39     1        
---------------------------------------------------------------------------------
all.q@node001                  BIP   0/0/1          -NA-     lx24-amd64    au
---------------------------------------------------------------------------------
default@master                 BIP   0/1/1          1.35     lx24-amd64    
     65 0.55500 test       root         r     05/04/2011 14:25:39     1        
---------------------------------------------------------------------------------
default@node001                BIP   0/0/1          -NA-     lx24-amd64    au

############################################################################
 - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS - PENDING JOBS
############################################################################
     67 0.00000 test       root         qw    05/04/2011 14:25:39     1        
     68 0.00000 test       root         qw    05/04/2011 14:25:39     1        
     69 0.00000 test       root         qw    05/04/2011 14:25:40     1     



http://markmail.org/message/dszbfjwwovm5kdjx
'au' simply means that Grid Engine is likely not running on the node.  
The "a" means 'alarm' and the "u" means unheard/unreachable. The  
combination of the two more often than not means that SGE is not  
running on the compute node.


USED qmod -c QUEUENAME TO CLEAR ERROR STATE:

qmod -c default
    Queue instance "default@node001" is already in the specified state: no error
    Queue instance "default@master" is already in the specified state: no error


SO STARTED sge_execd ON NODE001 AND NOW IT APPEARS WITHOUT THE 'au' STATE:

qstat -f
queuename                      qtype resv/used/tot. load_avg arch          states
---------------------------------------------------------------------------------
all.q@master                   BIP   0/0/1          1.08     lx24-amd64    
---------------------------------------------------------------------------------
all.q@node001                  BIP   0/0/1          0.27     lx24-amd64    
---------------------------------------------------------------------------------
default@master                 BIP   0/0/1          1.08     lx24-amd64    
---------------------------------------------------------------------------------
default@node001                BIP   0/0/1          0.27     lx24-amd64    


SUBMITTED JOBS INITIALLY RAN ON NODE001 BUT IMMEDIATELY FAILED:

qstat

job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
-----------------------------------------------------------------------------------------------------------------
     70 0.55500 test       root         r     05/04/2011 14:31:54 default@node001                    1        
     71 0.55500 test       root         t     05/04/2011 14:31:54 all.q@node001                      1        
     72 0.55500 test       root         r     05/04/2011 14:31:54 default@master                     1        
     73 0.55500 test       root         t     05/04/2011 14:31:54 all.q@master                       1        
     74 0.55500 test       root         qw    05/04/2011 14:31:52                                    1        

qstat

job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
-----------------------------------------------------------------------------------------------------------------
     72 0.55500 test       root         r     05/04/2011 14:31:54 default@master                     1        
     73 0.55500 test       root         r     05/04/2011 14:31:54 all.q@master                       1        
     74 0.55500 test       root         qw    05/04/2011 14:31:52                                    1   


CHECKED SPOOL LOGS FOR NODE001:

tail -f /opt/sge6/default/spool/exec_spool_local/node001/messages
tail -f /opt/sge6/default/spool/exec_spool_local/master/messages


DISCOVERED THAT NODE001 WAS MISSING THE /root/test FILE TREE. ADDED IT AND test.sh RAN FINE ON NODE001:


root@node001:~/test# tail -f test.out
    Wed May  4 14:40:24 UTC 2011
    0:  Wed May  4 14:40:24 UTC 2011
    1:  Wed May  4 14:40:29 UTC 2011
    2:  Wed May  4 14:40:34 UTC 2011
    3:  Wed May  4 14:40:39 UTC 2011
    4:  Wed May  4 14:40:44 UTC 2011
    5:  Wed May  4 14:40:49 UTC 2011
    6:  Wed May  4 14:40:54 UTC 2011
    7:  Wed May  4 14:40:59 UTC 2011
    8:  Wed May  4 14:41:04 UTC 2011
    9:  Wed May  4 14:41:09 UTC 2011



RAN TOPHAT ON NODE001:

cd /nethome/syoung/agua/Project1/Workflow1
qsub tophat.sh

qstat -f
queuename                      qtype resv/used/tot. load_avg arch          states
---------------------------------------------------------------------------------
all.q@master                   BIP   0/0/1          0.89     lx24-amd64    
---------------------------------------------------------------------------------
all.q@node001                  BIP   0/0/1          0.65     lx24-amd64    
---------------------------------------------------------------------------------
default@master                 BIP   0/0/1          0.89     lx24-amd64    
---------------------------------------------------------------------------------
default@node001                BIP   0/1/1          0.65     lx24-amd64    
     81 0.55500 tophat     root         r     05/04/2011 14:41:24     1  


WHILST CONCURRENTLY RUNNING tophat2 ON MASTER:

cd /nethome/syoung/agua/Project1/Workflow2
qsub tophat.sh

qstat
job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
-----------------------------------------------------------------------------------------------------------------
     81 0.55500 tophat     root         r     05/04/2011 14:41:24 default@node001                    1        
     82 0.55500 tophat2    root         r     05/04/2011 14:44:24 default@master                     1  



BUT TOPHAT APPEARS TO HAVE QUIT AT THE splice finding STAGE:

emacs /nethome/syoung/agua/Project1/Workflow1/tophat.err

    [Wed May  4 14:44:24 2011] Beginning TopHat run (v1.0.12)
    -----------------------------------------------
    [Wed May  4 14:44:24 2011] Preparing output location /nethome/syoung/agua/Project1/Workflow2/chr22/1/
    [Wed May  4 14:44:24 2011] Checking for Bowtie index files
    [Wed May  4 14:44:24 2011] Checking for reference FASTA file
    [Wed May  4 14:44:24 2011] Checking for Bowtie
            Bowtie version:          0.12.2.0
    [Wed May  4 14:44:24 2011] Checking reads
            seed length:     36bp
            format:          fastq
            quality scale:   --phred33-quals
    [Wed May  4 14:47:33 2011] Mapping reads against chr22 with Bowtie
    [Wed May  4 14:56:28 2011] Joining segment hits
    [Wed May  4 14:57:19 2011] Mapping reads against chr22 with Bowtie
    [Wed May  4 15:11:50 2011] Joining segment hits
    [Wed May  4 15:12:44 2011] Searching for junctions via segment mapping
    [Wed May  4 15:23:42 2011] Joining segment hits
    [Wed May  4 15:23:49 2011] Mapping reads against chr22 with Bowtie
    [Wed May  4 15:28:32 2011] Retrieving sequences for splices
    [Wed May  4 15:31:14 2011] Indexing splices



A NORMAL RUN WOULD CONTINUE WITH THE FOLLOWING STAGES:

    [Fri Oct  8 11:32:26 2010] Indexing splices
    [Fri Oct  8 11:32:28 2010] Mapping reads against segment_juncs with Bowtie
    [Fri Oct  8 11:32:54 2010] Mapping reads against segment_juncs with Bowtie
    [Fri Oct  8 11:33:21 2010] Joining segment hits
    [Fri Oct  8 11:33:24 2010] Reporting output tracks
    -----------------------------------------------
    Run complete [00:11:00 elapsed]
    

SAME WITH WORKFLOW2 (MASTER):


qname        default             
hostname     master              
group        root                
owner        root                
project      NONE                
department   defaultdepartment   
jobname      tophat2             
jobnumber    82                  
taskid       undefined
account      sge                 
priority     0                   
qsub_time    Wed May  4 14:44:16 2011
start_time   Wed May  4 14:44:24 2011
end_time     Wed May  4 15:44:25 2011
granted_pe   NONE                
slots        1                   
failed       100 : assumedly after job


LOCK FILES REMAIN SO JOBS DID NOT COMPLETE:

cd /nethome/syoung/agua/Project1/
ll Workflow*/chr22/lock/1/tophatBatchAlignment-chr22-lock.txt

    -rw-r--r-- 1 root root 29 2011-05-04 14:41 Workflow1/chr22/lock/1/tophatBatchAlignment-chr22-lock.txt
    -rw-r--r-- 1 root root 29 2011-05-04 14:44 Workflow2/chr22/lock/1/tophatBatchAlignment-chr22-lock.txt    
    

QUIT ABOUT AN HOUR AFTER STARTED:

root@master:/nethome/syoung/agua/Project1/Workflow1/chr22/1# ll -tr tmp
    ...
    -rw-r--r-- 1 root root   6782976 2011-05-04 15:43 segment_juncs.2.ebwt

root@master:/nethome/syoung/agua/Project1/Workflow1/chr22/1# ll -tr tmp
    ...
    -rw-r--r-- 1 root root   6782976 2011-05-04 15:43 segment_juncs.2.ebwt


... BECAUSE EXCEEDED WALLTIME:

tail -f /opt/sge6/default/spool/exec_spool_local/master/messages
05/04/2011 15:44:25|  main|master|W|job 82.1 exceeded hard wallclock time - initiate terminate method



SO RERAN WITH 24-HOUR WALLTIME:


Wed May  4 16:27:42 UTC 2011

qstat
    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
         83 0.55500 tophat     root         r     05/04/2011 16:26:13 default@node001                    1        
         85 0.55500 tophat2    root         r     05/04/2011 16:27:28 default@master                     1        


</entry>

<entry [Mon 2011:05:02 22:04:52 EST] USE StarCluster.pm TO ADD QUEUE AND PE>


/agua/0.6/bin/apps/cluster/starcluster.pl start \
--username admin \
--cluster smallcluster \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--keyname admin-key \
--nodes 2 \
--maxnodes 5 \
--minnodes 1 \
--outputdir /nethome/admin/agua/Project1/Workflow1 \
--sources /data,/nethome \
--mounts /data,/nethome \
--devs /dev/sdh,/dev/sdi \
--configfile /nethome/admin/.starcluster/config

NB: CREATES THESE CONF FILES:

/nethome/admin/agua/.sge/conf/pe-default.conf
/nethome/admin/agua/.sge/conf/queue-default.conf


NOTES
-----

PE FILE VALUES
--------------

http://ait.web.psi.ch/services/linux/hpc/merlin3/sge/admin/sge_queues.html
man pe_conf
  ...
  allocation_rule
     The allocation rule is interpreted by sge_schedd(8) and helps the scheduler 
     to decide how to distribute parallel processes among the available machines. 
     If, for instance, a parallel environment is built for shared memory applications only, 
     all parallel processes have to be assigned to a single machine.
     If, however, the parallel environment follows the distributed memory paradigm, 
     an even distribution of processes among machines may be favorable.
  >int>:   
     An  integer  number  fixing  the  number  of processes per host. 
     If the number is 1, all processes have to reside on different hosts. 
     If the special denominator $pe_slots is used, the full range of processes 
     as specified with the qsub(1) -pe switch has to be allocated on a single host.
  $fill_up: 
     Starting  from  the  best suitable host/queue, all available slots are allocated. 
     Further hosts and queues are "filled up" as long as a job still requires slots
     for parallel tasks.
  $round_robin:
     The allocation scheme walks through suitable hosts in a best-suitable-first order.
Show the available parallel environments:

</entry>

<entry [Mon 2011:05:02 22:31:37 EST] FULL OUTPUT OF executeWorkflow COMMAND>

echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"1"}' | ./workflow.cgi
    
Agua::Workflow::executeWorkflow    Agua::Workflow::executeWorkflow()
Agua::Workflow::setStages    Agua::Workflow::setStages(json)
Agua::Workflow::setStageParameters    Agua::Workflow::setStageParameters(stages, json)
Agua::Workflow::setStart    Agua::Workflow::setStart(stages, json)
Agua::Workflow::executeWorkflow    queue: syoung-Project1-Workflow1
Agua::Workflow::executeWorkflow    submit: 
Agua::Workflow::executeWorkflow    cluster: 
Agua::Workflow::executeWorkflow    outputdir: /nethome/syoung/agua/Project1/Workflow1/
{ status: 'Workflow::executeWorkflow    running workflow: Project1.Workflow1' } /**/

Agua::Workflow::executeWorkflow    Stage 1: TOPHAT
username            :	syoung
project             :	Project1
workflownumber      :	1
workflow            :	Workflow1
name                :	TOPHAT
number              :	1
start               :	
executor            :	/usr/bin/perl
location            :	apps/expression/TOPHAT.pl
fileroot            :	/nethome/syoung/agua
queue               :	syoung-Project1-Workflow1
queue_options       :	
outputdir           :	/nethome/syoung/agua/Project1/Workflow1/
scriptfile          :	/nethome/syoung/agua/Project1/Workflow1/scripts/1-TOPHAT.sh
stdoutfile          :	/nethome/syoung/agua/Project1/Workflow1/stdout/1-TOPHAT.stdout
stderrfile          :	/nethome/syoung/agua/Project1/Workflow1/stderr/1-TOPHAT.stderr
workflowpid         :	7034
stagepid            :	1105
stagejobid          :	
submit              :	
setuid              :	
installdir          :	/agua/0.6
cluster             :	
qsub                :	/opt/sge6/bin/lx24-amd64//qsub
qstat               :	/opt/sge6/bin/lx24-amd64/qstat
resultfile          :	/tmp/result-7034


Agua::Workflow::executeWorkflow    Stage 2: indexReads
username            :	syoung
project             :	Project1
workflownumber      :	1
workflow            :	Workflow1
name                :	indexReads
number              :	2
start               :	
executor            :	/usr/bin/perl
location            :	apps/index/indexReads.pl
fileroot            :	/nethome/syoung/agua
queue               :	syoung-Project1-Workflow1
queue_options       :	
outputdir           :	/nethome/syoung/agua/Project1/Workflow1/
scriptfile          :	/nethome/syoung/agua/Project1/Workflow1/scripts/2-indexReads.sh
stdoutfile          :	/nethome/syoung/agua/Project1/Workflow1/stdout/2-indexReads.stdout
stderrfile          :	/nethome/syoung/agua/Project1/Workflow1/stderr/2-indexReads.stderr
workflowpid         :	7034
stagepid            :	1111
stagejobid          :	
submit              :	
setuid              :	
installdir          :	/agua/0.6
cluster             :	
qsub                :	/opt/sge6/bin/lx24-amd64//qsub
qstat               :	/opt/sge6/bin/lx24-amd64/qstat
resultfile          :	/tmp/result-7034


Agua::Workflow::runStages    Agua::Workflow::runStages(self)
Agua::Workflow::runStages    Running stages (total 2)
Agua::Workflow::runStages    Start stage index: 0
Agua::Workflow::runStages    Running stage 1: TOPHAT
Agua::Stage::run    Stage::run()
Agua::Stage::run    submit not defined
Agua::Stage::run    cluster not defined
Agua::Stage::setStatus    Stage::setStatus(self)
Agua::Stage::setStatus    Status: running
Agua::Stage::run    Executing...
Agua::Stage::runLocally    Stage::runLocally()
Agua::Stage::runLocally    fileroot: /nethome/syoung/agua
Agua::Stage::setArguments    Adding fileroot to file: Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt
Agua::Stage::setArguments    Adding fileroot to file: Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt 
Agua::Stage::setArguments    Adding fileroot to directory: Project1/Workflow1
Agua::Stage::setArguments    Adding fileroot to directory: Project1/Workflow1/chr22
Agua::Stage::runLocally    arguments: --cpus 3 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --label yoruba --matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt  --outputdir /nethome/syoung/agua/Project1/Workflow1 --queue default --reference /nethome/syoung/agua/Project1/Workflow1/chr22 --species human
Agua::Stage::runLocally    application: /agua/0.6/bin/apps/expression/TOPHAT.pl

Stage::runLocally    /usr/bin/perl /agua/0.6/bin/apps/expression/TOPHAT.pl --cpus 3 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --label yoruba --matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt  --outputdir /nethome/syoung/agua/Project1/Workflow1 --queue default --reference /nethome/syoung/agua/Project1/Workflow1/chr22 --species human 1> /nethome/syoung/agua/Project1/Workflow1/stdout/1-TOPHAT.stdout 2> /nethome/syoung/agua/Project1/Workflow1/stderr/1-TOPHAT.stderr

Agua::Stage::runLocally    application: /agua/0.6/bin/apps/expression/TOPHAT.pl
Agua::Stage::runLocally    Change directory: /agua/0.6/bin/apps/expression
Agua::Stage::runLocally    $self->dbobject()->dbh(): DBI::db=HASH(0x3ff4160)
Agua::Stage::runLocally    stagepid: 7037
TOPHAT.pl    arguments: --cpus 3 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --label yoruba --matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt  --outputdir /nethome/syoung/agua/Project1/Workflow1 --queue default --reference /nethome/syoung/agua/Project1/Workflow1/chr22 --species human 1> /nethome/syoung/agua/Project1/Workflow1/stdout/1-TOPHAT.stdout 2> /nethome/syoung/agua/Project1/Workflow1/stderr/1-TOPHAT.stderr
TOPHAT.pl    tophat: /data/apps/tophat/1.0.12/bin
TOPHAT.pl    bowtie: /data/apps/bowtie/0.12.2
TOPHAT.pl    inputfiles: /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt
TOPHAT.pl    outputdir: /nethome/syoung/agua/Project1/Workflow1
TOPHAT.pl    referencedir: /nethome/syoung/agua/Project1/Workflow1/chr22
TOPHAT.pl    cluster: SGE
TOPHAT.pl    samtools index: /data/sequence/human/hg19/samtools
TOPHAT.pl    no. files: 1
TOPHAT.pl    ins: /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt
TOPHAT.pl    mates: /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt 
TOPHAT.pl    queue: default
TOPHAT.pl    args: 
TOPHAT.pl    Doing run()
Expression::TOPHAT::run    Expression::TOPHAT::run()
Expression::TOPHAT::run    splitfile: /nethome/syoung/agua/Project1/Workflow1/splitfile.txt
Expression::TOPHAT::run    Doing getReferencefiles()  11-05-03 02:18:05
Expression::TOPHAT::run    After getReferencefiles()  11-05-03 02:18:05
Expression::TOPHAT::run    No. referencefiles: 1
Expression::TOPHAT::run    references: chr22
Expression::TOPHAT::run    Doing doSplitfiles()  11-05-03 02:18:05
Agua::Cluster::Util::doSplitfiles    Agua::Cluster::doSplitfiles(splitfile, label)
Agua::Cluster::Util::doSplitfiles    Getting splitfiles hash from splitfile: /nethome/syoung/agua/Project1/Workflow1/splitfile.txt
Expression::TOPHAT::run    After doSplitfiles()  11-05-03 02:18:05
Expression::TOPHAT::run    No. splitfiles: 1
Expression::TOPHAT::run    Doing runTophat()   11-05-03 02:18:05
Expression::TOPHAT::runTophat    Expression::TOPHAT::runTophat(outputfile, referencefile, splitfiles)
Agua::Cluster::Jobs::setBatchJob    Agua::Cluster::Jobs::setBatchJob(commands, label, outputdir, number)
Tophat::runTophat    length(jobs): 1
Agua::Cluster::Jobs::execute    Agua::Cluster::Jobs::execute(jobs, label)
Agua::Cluster::Jobs::execute    no. jobs: 1
Agua::Cluster::Jobs::execute    executing 1 jobs
Agua::Cluster::Jobs::printSgeScriptfile    Agua::Cluster::Jobs::printLsfScriptfile(scriptfile, commands, label, stdoutfile, stderrfile)
Agua::Cluster::Jobs::printSgeScriptfile    stdoutfile: /nethome/syoung/agua/Project1/Workflow1/chr22/stdout/$TASKNUM/tophatBatchAlignment-chr22-stdout.txt
Agua::Cluster::Jobs::printSgeScriptfile    stderrfile: /nethome/syoung/agua/Project1/Workflow1/chr22/stdout/$TASKNUM/tophatBatchAlignment-chr22-stderr.txt
#!/bin/sh

export TASKNUM=$(expr $SGE_TASK_ID)

#$ -N tophatBatchAlignment-chr22
#$ -pe threaded 3
#$ -o /nethome/syoung/agua/Project1/Workflow1/chr22/stdout/$TASKNUM/tophatBatchAlignment-chr22-stdout.txt
#$ -e /nethome/syoung/agua/Project1/Workflow1/chr22/stdout/$TASKNUM/tophatBatchAlignment-chr22-stderr.txt
#$ -q default
#$ -l h_rt=24:00:00

echo COMMD_PORT: 	$COMMD_PORT
echo SGE_ROOT: 		$SGE_ROOT
echo SGE_CELL: 		$SGE_CELL
echo SGE_JOB_SPOOL_DIR: $SGE_JOB_SPOOL_DIR
echo SGE_O_HOME: 	$SGE_O_HOME
echo SGE_O_HOST: 	$SGE_O_HOST
echo SGE_O_LOGNAME: $SGE_O_LOGNAME
echo SGE_O_MAIL: 	$SGE_O_MAIL
echo SGE_O_PATH: 	$SGE_O_PATH
echo SGE_O_SHELL: 	$SGE_O_SHELL
echo SGE_O_TZ: 		$SGE_O_TZ
echo SGE_O_WORKDIR: $SGE_O_WORKDIR
echo SGE_CKPT_ENV: 	$SGE_CKPT_ENV
echo SGE_CKPT_DIR: 	$SGE_CKPT_DIR
echo SGE_STDERR_PATH:$SGE_STDERR_PATH
echo SGE_STDOUT_PATH:$SGE_STDOUT_PATH
echo SGE_TASK_ID: 	$SGE_TASK_ID
echo HOME: 			$HOME
echo HOSTNAME: 		$HOSTNAME
echo JOB_ID: 		$JOB_ID
echo JOB_NAME: 		$JOB_NAME
echo NQUEUES: 		$NQUEUES
echo NSLOTS: 		$NSLOTS
hostname -f
date > /nethome/syoung/agua/Project1/Workflow1/chr22/lock/$TASKNUM/tophatBatchAlignment-chr22-lock.txt

export PATH=/data/apps/bowtie/0.12.2:$PATH
export PATH=/data/apps/tophat/1.0.12/bin:$PATH
export PATH=/nethome/syoung/agua/Project1/Workflow1/chr22/chr22/$TASKNUM:$PATH

mkdir -p /nethome/syoung/agua/Project1/Workflow1/chr22/$TASKNUM
cd /nethome/syoung/agua/Project1/Workflow1/chr22/$TASKNUM

time /data/apps/tophat/1.0.12/bin/tophat \
--num-threads 3 \
--keep-tmp \
--output-dir /nethome/syoung/agua/Project1/Workflow1/chr22/$TASKNUM \
--mate-inner-dist 200 \
/nethome/syoung/agua/Project1/Workflow1/chr22/chr22 \
/nethome/syoung/agua/Project1/Workflow1/$TASKNUM/yoruba_1.$TASKNUM.txt \
/nethome/syoung/agua/Project1/Workflow1/$TASKNUM/yoruba_2.$TASKNUM.txt 
unlink /nethome/syoung/agua/Project1/Workflow1/chr22/lock/$TASKNUM/tophatBatchAlignment-chr22-lock.txt;

exit

Agua::Cluster::Jobs::printSgeScriptfile    scriptfile printed: /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh
Agua::Cluster::Jobs::execute    Doing scriptfile: /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh
Agua::Cluster::Jobs::execute    Doing monitor->submitJob()
Agua::Monitor::SGE::submitJob   Agua::Monitor::SGE::submitJob(command)
Agua::Monitor::SGE::submitJob   args: 
$VAR1 = {
          'tasks' => 1,
          'stderrfile' => '/nethome/syoung/agua/Project1/Workflow1/chr22/stdout/$TASKNUM/tophatBatchAlignment-chr22-stderr.txt',
          'qstat' => '/opt/sge6/bin/lx24-amd64/qstat',
          'scriptfile' => '/nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh',
          'stdoutfile' => '/nethome/syoung/agua/Project1/Workflow1/chr22/stdout/$TASKNUM/tophatBatchAlignment-chr22-stdout.txt',
          'qsub' => '/opt/sge6/bin/lx24-amd64//qsub',
          'batch' => '-t 1-1',
          'queue' => 'default'
        };

Agua::Monitor::SGE::submitJob   command: /opt/sge6/bin/lx24-amd64//qsub -t 1-1 -q default /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh
Agua::Monitor::SGE::submitJob    output: 
Agua::Monitor::SGE::submitJob    JOBID_REGEX: ^(Your job|Your job-array) (\S+)
 { error: 'Agua::Monitor::SGE::submitJob    job_id not defined' }Agua::Stage::runLocally    resultfile: /tmp/result-7034
Agua::Stage::runLocally    result: 0

Agua::Stage::runLocally    Returning result: 0

Agua::Stage::run    Stage run success: 0

Agua::Stage::run    Stage run success not defined
Agua::Stage::registerIds    Agua::Stage::registerIds()
Agua::Stage::registerIds    workflowpid: 7034
Agua::Stage::registerIds    stagepid: 7037
Agua::Stage::registerIds    stagejobid: 
Agua::Stage::registerIds::register    insert success: 1
Agua::Stage::registerIds::register    Successful insert!
Agua::Stage::run    Waiting...
Agua::Stage::run    Finished waiting.
Successfully completed stage 0: 0

Agua::Workflow::runStages    Stage 1: TOPHATcompleted successfully: 0


</entry>

<entry [Mon 2011:05:02 11:28:33 EST] CREATE NEW QUEUE FOLDER FOR EACH NEW CLUSTER>

LATER: USE SGE CELL FOR CLUSTER AND DIFFERENT QUEUES FOR EACH WORKFLOW

EVEN LATER: MORE FINE GRAINED CONTROL - ALLOW USER TO SPECIFY DIFFERENT QUEUE FOR EACH STAGE

    
</entry>

<entry [Mon 2011:05:02 11:27:33 EST] SET UP SHARES USING automount.py>

NB: CONNECT TO MASTER

/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster


1. MAKE EXPORTS AVAILABE ON 8e TO MASTER
----------------------------------------

(Agua::StarCluster::start DOES THIS)

OPEN PORTS
# PORTMAP
ec2-authorize @sc-smallcluster -p 111 -P tcp
ec2-authorize @sc-smallcluster -p 111 -P udp
# NFS
ec2-authorize @sc-smallcluster -p 2049 -P udp
ec2-authorize @sc-smallcluster -p 2049 -P tcp
# MOUNTD
ec2-authorize @sc-smallcluster -p 32767 -P udp
ec2-authorize @sc-smallcluster -p 32767 -P tcp
    OK


(Agua::AWS::init DOES THIS)

ADD nfs MOUNT INFO (**vers=3**) TO /etc/fstab:
/dev/sdh  /data      nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
/dev/sdi  /nethome   nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0


#### THE FOLLOWING IS DONE BY automount.py
<!--SET EXPORTS:
emacs /etc/exports
/data domU-12-31-38-01-C5-51.compute-1.internal(async,no_root_squash,no_subtree_check,rw)
/nethome domU-12-31-38-01-C5-51.compute-1.internal(async,no_root_squash,no_subtree_check,rw)

EXPORT THE SHARES (EVERY TIME /etc/exports IS CHANGED)
sudo exportfs -ra

RESTART PORTMAP AND NFS
/etc/init.d/portmap restart
/etc/init.d/nfs-kernel-server restart

VERIFY EXPORTS
exportfs
    /data         	10.253.202.159
    /nethome      	10.253.202.159
-->

2. SET config INPUTS 
--------------------

[cluster smallcluster]
...
NODE_INSTANCE_TYPE=t1.micro
plugins=automount
...

[plugin automount]
setup_class=automount.NfsShares
head_ip=10.122.61.250
interval=30
sourcedirs=/data,/nethome
mountpoints=/data,/nethome

NOTE: *** head_ip IS NUMERIC FORM OF INTERNAL IP ***


3. RUN PLUGIN
-------------
(NB: MUST BE INSIDE DIRECTORY /nethome/admin/.starcluster/plugins)
**AS ROOT** LAUNCH DEVELOPMENT SHELL AND TEST PLUGIN 

cd /nethome/admin/.starcluster/plugins

/data/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/config \
shell

import automount
clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'automount', 'smallcluster')

RETEST AFTER EDITING automount.py:
reload 
cluster.ClusterManager.run_plugin(clus, 'automount', 'smallcluster')


In [3]: cluster.ClusterManager.run_plugin(clus, 'automount', 'smallcluster')
>>> AutoMount.__init__    Initialising AutoMount plugin.
>>> AutoMount.__init__    head_ip ip-10-124-231-156.ec2.internal
>>> AutoMount.__init__    interval 30
>>> AutoMount.__init__    sourcedirs /data,/nethome
>>> AutoMount.__init__    mountpoints /data,/nethome
>>> Running plugin automount
>>> 
>>> AutoMount.run    Starting AutoMount...
>>> AutoMount.run    self.head_ip ip-10-124-231-156.ec2.internal
>>> AutoMount.run    Mounting NFS shares on master
>>> 
>>> AutoMount._mount    node.private_dns_name: domU-12-31-38-01-C5-51.compute-1.internal
>>> AutoMount._mount    self.head_ip: ip-10-124-231-156.ec2.internal
>>> AutoMount._mount    HERE XXXX YYYYY
>>> echo 'ip-10-124-231-156.ec2.internal:/data  /data  nfs  nfsvers=3,defaults 0 0' >> /etc/fstab ;
>>> echo 'ip-10-124-231-156.ec2.internal:/nethome  /nethome  nfs  nfsvers=3,defaults 0 0' >> /etc/fstab ;

CONFIRMED /etc/fstab CHANGED ON MASTER

/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster
root@master:~# cat /etc/fstab

<!--
    # /etc/fstab: static file system information.
    # <file system> <mount point>   <type>  <options>       <dump>  <pass>
    proc        /proc           proc    nodev,noexec,nosuid 0       0
    /dev/sda1   /               ext3    defaults        0       0
    /dev/sdb1   /mnt auto defaults,nobootwait 0 0
    #/dev/sdb1	/mnt	auto	defaults,comment=cloudconfig	0	0
    ip-10-124-231-156.ec2.internal:/data  /data  nfs  nfsvers=3,defaults 0 0
    ip-10-124-231-156.ec2.internal:/nethome  /nethome  nfs  nfsvers=3,defaults 0 0

-->

BEFORE self._addToExports ON 8e:
cat /etc/exports
/home ip-10-86-193-30.ec2.internal(async,no_root_squash,no_subtree_check,rw)
/opt/sge6 ip-10-86-193-30.ec2.internal(async,no_root_squash,no_subtree_check,rw)
/data domU-12-31-38-01-C5-51.compute-1.internal(async,no_root_squash,no_subtree_check,rw)
/nethome domU-12-31-38-01-C5-51.compute-1.internal(async,no_root_squash,no_subtree_check,rw)

    >>> echo '/data  10.253.202.159(async,no_root_squash,no_subtree_check,rw)' >> /etc/exports ;
    portmap start/running, process 286
     * Stopping NFS kernel daemon                                                    [ OK ] 
     * Unexporting directories for NFS kernel daemon...                              [ OK ] 
     * Exporting directories for NFS kernel daemon...                                [ OK ] 
     * Starting NFS kernel daemon                                                    [ OK ] 
    >>> echo '/nethome  10.253.202.159(async,no_root_squash,no_subtree_check,rw)' >> /etc/exports ;
    portmap start/running, process 286
     * Stopping NFS kernel daemon                                                    [ OK ] 
     * Unexporting directories for NFS kernel daemon...                              [ OK ] 
     * Exporting directories for NFS kernel daemon...                                [ OK ] 
     * Starting NFS kernel daemon                                                    [ OK ] 


AFTER self._addToExports ON 8e:

cat /etc/exports
/home ip-10-86-193-30.ec2.internal(async,no_root_squash,no_subtree_check,rw)
/opt/sge6 ip-10-86-193-30.ec2.internal(async,no_root_squash,no_subtree_check,rw)
/data domU-12-31-38-01-C5-51.compute-1.internal(async,no_root_squash,no_subtree_check,rw)
/nethome domU-12-31-38-01-C5-51.compute-1.internal(async,no_root_squash,no_subtree_check,rw)
/data  10.253.202.159(async,no_root_squash,no_subtree_check,rw)
/nethome  10.253.202.159(async,no_root_squash,no_subtree_check,rw)


    >>> mount -t nfs ip-10-124-231-156.ec2.internal:/data /data
    >>> AutoMount._mountNfs    Running cmd: mount -t nfs ip-10-124-231-156.ec2.internal:/data /data
    ssh.py:382 - ERROR - command 'mount -t nfs ip-10-124-231-156.ec2.internal:/data /data' failed with status 32


TEST self._setMountdPort
------------------------
CONNECT
/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster


BEFORE MOUNTD PORT ON MASTER:
netstat -ntulp| grep mountd
tcp        0      0 0.0.0.0:44868           0.0.0.0:*               LISTEN      575/rpc.mountd  
udp        0      0 0.0.0.0:54970           0.0.0.0:*                           575/rpc.mountd  

    >>> Doing node.ssh.execute: echo 'RPCMOUNTDOPTS="--port 32767 --manage-gids"' >> /etc/default/nfs-kernel-server;
    >>> Doing os.system: echo 'RPCMOUNTDOPTS="--port 32767 --manage-gids"' >> /etc/default/nfs-kernel-server;
    portmap start/running, process 286
     * Stopping NFS kernel daemon                                                    [ OK ] 
     * Unexporting directories for NFS kernel daemon...                              [ OK ] 
     * Exporting directories for NFS kernel daemon...                                [ OK ] 
     * Starting NFS kernel daemon                                                    [ OK ] 
    >>> Doing node.ssh.execute: echo 'RPCMOUNTDOPTS="--port 32767 --manage-gids"' >> /etc/default/nfs-kernel-server;
    >>> Doing os.system: echo 'RPCMOUNTDOPTS="--port 32767 --manage-gids"' >> /etc/default/nfs-kernel-server;
    portmap start/running, process 286
     * Stopping NFS kernel daemon                                                    [ OK ] 
     * Unexporting directories for NFS kernel daemon...                              [ OK ] 
     * Exporting directories for NFS kernel daemon...                                [ OK ] 
     * Starting NFS kernel daemon                                                    [ OK ] 


AFTER MOUNTD PORT ON MASTER:
root@master:~# netstat -ntulp| grep mountd
tcp        0      0 0.0.0.0:32767           0.0.0.0:*               LISTEN      5803/rpc.mountd 
udp        0      0 0.0.0.0:32767           0.0.0.0:*                           5803/rpc.mountd 


TEST self._mountNfs
-------------------

CONNECT
/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster


CAN CONNECT FROM MASTER TO 8e USING TELNET:

telnet 10.122.61.250 32767
    Trying 10.122.61.250...
    Connected to 10.122.61.250.
    Escape character is '^]'.

... BUT STILL CAN'T MOUNT:


#### DIDN'T WORK (USING THE OLD HOSTNAME)
mount -t nfs ip-10-124-231-156.ec2.internal:/data /data


BUT THIS WORKED (USING THE NEW HOSTNAME)
mount -t nfs 10.122.61.250:/data /data




    >>> AutoMount._mountNfs    Running cmd: mount -t nfs ip-10-124-231-156.ec2.internal:/data /data
    ssh.py:382 - ERROR - command 'mount -t nfs ip-10-124-231-156.ec2.internal:/data /data' failed with status 32


EVEN THOUGH EXPORTS APPEARS TO BE WORKING:

ON MASTER
---------

CHECK EXPORTS FROM 8e:
showmount -e 10.122.61.250

    Export list for 10.122.61.250:
    /nethome  10.253.202.159
    /data     10.253.202.159







#DEBUG automount PLUGIN
#
#
#PID: 6970 cluster.py:1280 - INFO - Running plugin automount
#PID: 6970 automount.py:26 - DEBUG - AutoMount.run    Starting AutoMount...
#PID: 6970 automount.py:27 - INFO - AutoMount.run    self.head_ip ip-10-127-158-202.ec2.internal
#PID: 6970 automount.py:33 - INFO - AutoMount.run    Mounting NFS shares on master
#PID: 6970 automount.py:45 - INFO - 
#PID: 6970 automount.py:46 - INFO - AutoMount._mount    node.private_dns_name: ip-10-124-246-12.ec2.internal
#PID: 6970 automount.py:47 - INFO - AutoMount._mount    self.head_ip: ip-10-127-158-202.ec2.internal
#PID: 6970 automount.py:55 - INFO - AutoMount._mount    cmd echo '' >> /etc/fstab
#PID: 6970 automount.py:55 - INFO - AutoMount._mount    cmd echo 'ip-10-127-158-202.ec2.internal:/data  /data nfs nfsvers=3,defaults 0 0' >> /etc/fstab
#PID: 6970 automount.py:55 - INFO - AutoMount._mount    cmd echo 'ip-10-127-158-202.ec2.internal:/nethome  /nethome nfs nfsvers=3,defaults 0 0' >> /etc/fstab
#PID: 6970 automount.py:66 - INFO - 
#PID: 6970 automount.py:68 - INFO - AutoMount._mountNfs    cmd: mount -t nfs ip-10-127-158-202.ec2.internal:/data /data
#PID: 6970 ssh.py:369 - ERROR - command 'mount -t nfs ip-10-127-158-202.ec2.internal:/data /data' failed with status 32
#PID: 6970 ssh.py:375 - DEBUG - mount.nfs: access denied by server while mounting ip-10-127-158-202.ec2.internal:/data
#PID: 6970 ssh.py:369 - ERROR - command 'ls mountpoint' failed with status 2
#PID: 6970 ssh.py:375 - DEBUG - ls: cannot access mountpoint: No such file or directory
#PID: 6970 automount.py:76 - INFO - AutoMount._mountNfs    file_list BEFORE break: ['ls: cannot access mountpoint: No such file or directory']
#PID: 6970 automount.py:66 - INFO - 
#PID: 6970 automount.py:68 - INFO - AutoMount._mountNfs    cmd: mount -t nfs ip-10-127-158-202.ec2.internal:/nethome /nethome
#PID: 6970 ssh.py:369 - ERROR - command 'mount -t nfs ip-10-127-158-202.ec2.internal:/nethome /nethome' failed with status 32
#PID: 6970 ssh.py:375 - DEBUG - mount.nfs: access denied by server while mounting ip-10-127-158-202.ec2.internal:/nethome
#PID: 6970 ssh.py:369 - ERROR - command 'ls mountpoint' failed with status 2
#PID: 6970 ssh.py:375 - DEBUG - ls: cannot access mountpoint: No such file or directory
#PID: 6970 automount.py:76 - INFO - AutoMount._mountNfs    file_list BEFORE break: ['ls: cannot access mountpoint: No such file or directory']
#


NOTES
-----

DOES PLUGIN HAVE SAME PATH AS CONFIG
------------------------------------

[Wed 2011:04:20 20:51:43 EST] RAN LOAD BALANCER ON UBUNTU

1. WILL IT FIND plugins/automount.py IF I USE -c TO SPECIFY CONFIG FILE LOCATION?

YES, plugins/automount.py FOLLOWS config PATH

I.E., SPECIFYING:

-c /nethome/admin/.starcluster/config

USES:

/nethome/admin/.starcluster/plugins/automount.py

NOT:

/root/.starcluster/plugins/automount.py

... EVEN WHEN RUN AS THE ROOT USER.




CONFIRM cfg OBJECT HAS PLUGIN INFO
----------------------------------
cfg.get_plugin('automount')

    {
        '__name__': 'automount',
        'head_ip': 'ip-10-124-231-156.ec2.internal',
        'interval': '30',
        'mountpoints': '/data,/nethome',
        'setup_class': 'automount.NfsShares',
        'sourcedirs': '/data,/nethome'
    }



reload()

 The reload command does a 'deep' reload of a module: changes made to the
  module since you imported will actually be available without having to exit.


New Plugin Hooks - Plugins can now play a part when adding/removing a node as well as when restarting/shutting down the entire cluster by implementing the on_remove_node/on_add_node/on_shutdown/on_reboot methods

THE ClusterManager CLASS IN cluster.py DOES THIS (AS DOES THE Cluster CLASS, WHICH IS ***NOT*** THE RIGHT ONE):


    def run_plugin(self, plugin_name, cluster_tag):
        """
        Run a plugin defined in the config.

        plugin_name must match the plugin's section name in the config
        cluster_tag specifies the cluster to run the plugin on
        """
        cl = self.get_cluster(cluster_tag, load_plugins=False)
        if not cl.is_cluster_up():
            raise exception.ClusterNotRunning(cluster_tag)
        plugs = [self.cfg.get_plugin(plugin_name)]
        name, plugin = cl.load_plugins(plugs)[0]
        cl.run_plugin(plugin, name)



USE ipcluster.py PLUGIN AS TEMPLATE BECAUSE IT CONTAINS THE on_add_node, ETC. METHODS


ADD THE FOLLOWING SECTIONS TO /root/.starcluster/config 

[cluster smallcluster]
....
plugins = automount

AND

[plugin automount]
setup_class = AutoMount
head_ip = ip-10-127-158-202.ec2.internal


WRITE STUB OF PLUGIN AND PLACE HERE /root/.starcluster/plugins/automount.py

    #!/usr/bin/env python
    import posixpath
    
    from starcluster.clustersetup import ClusterSetup
    from starcluster.logger import log
    
    
    class NfsShares (ClusterSetup):
        """
        Starts an AutoMount on StarCluster
        """
        def __init__(self, head_ip):
            log.info("AutoMount.__init__    Running AutoMount plugin.")
    ...



START TEST CLUSTER

starcluster start testcluster -s 2


INSTALL ipython IF YOU GET 'Unable to load IPython.' ERROR:

easy_install ipython




    
</entry>

<entry [Mon 2011:05:02 03:20:43 EST] CONNECTED TO MASTER AND MADE 8e SUBMIT HOST>

8e DETAILS
----------
#ec2-50-19-4-224.compute-1.amazonaws.com
#ip-10-86-199-110.ec2.internal
ec2-50-16-171-46.compute-1.amazonaws.com
ip-10-122-61-250.ec2.internal


MASTER DETAILS 
--------------
ec2-184-72-151-121.compute-1.amazonaws.com
domU-12-31-38-01-C5-51.compute-1.internal
10.253.202.159


CONNECTED:
/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster


1. ADD 8e TO LIST OF SUBMIT AND ADMIN HOSTS
-------------------------------------------

ON MASTER
---------

CHECK CURRENT SUBMIT HOSTS
qconf -ss
    master
    node001

ADD 8e AS SUBMIT HOST
qconf -as ip-10-122-61-250.ec2.internal
    OK
qconf -ss
    ip-10-122-61-250.ec2.internal
    master
    node001

ADD 8e AS ADMIN HOST
qconf -ah ip-10-122-61-250.ec2.internal
    OK
qconf -sh
    ip-10-122-61-250.ec2.internal
    master
    node001


ON 8e
-----

COPY DEFAULT FOLDER TO 8e

scp -r -i /nethome/admin/.starcluster/id_rsa-admin-key \
root@ec2-184-72-151-121.compute-1.amazonaws.com:/opt/sge6/default \
/opt/sge6
    
    OK


2. CHANGE act_qmaster ON 8e TO MATCH IP ADDRESS OF MASTER
---------------------------------------------------------

ON 8e
-----

CHANGE /opt/sge6/default/common/act_qmaster  FROM THIS:

master

TO THIS (IP OF MASTER):

10.253.202.159


3. OPEN PORTS ON MASTER
-----------------------

NB: CAN'T CONNECT FROM 8e TO MASTER USING qstat, qconf, ETC. BECAUSE PORT IS BLOCKED

ON 8e
-----

telnet ip-10-122-61-250.ec2.internal 63231
    Trying 10.122.61.250...
    telnet: Unable to connect to remote host: Connection refused

(NB: 'nmap -P0 10.253.202.159' SHOWS MASTER IS BLOCKED ON PORT 63231 EVEN WHEN IT'S OPEN!)


ON MASTER
---------

CONFIRM SGE RUNNING CORRECTLY ON PORTS 63231 AND 63232:
netstat -tulp | grep sge
    tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      3200/sge_qmaster
    tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      3218/sge_execd  

OPEN PORTS 63231 AND 63232 FOR GROUP @sc-smallcluster
ec2-authorize @sc-smallcluster -p 63231 -P tcp
ec2-authorize @sc-smallcluster -p 63231 -P udp
ec2-authorize @sc-smallcluster -p 63232 -P tcp
ec2-authorize @sc-smallcluster -p 63232 -P udp
    OK

RESTART SGEMASTER AND EXECD ON MASTER

*** IMPORTANT ***

1. ** MUST RESTART AS PORTS STILL CLOSED AT THIS POINT:
telnet 10.253.202.159 63231Trying 10.253.202.159...
telnet: Unable to connect to remote host: Connection refused)

2. nmap -P0 DOESN'T SHOW THE OPENED PORTS

3. /etc/services NOT NEEDED - CONTAINS THE WRONG PORTS BUT CAN STILL qstat OKAY 
grep sge /etc/services
    sge_qmaster	6444/tcp			# Grid Engine Qmaster Service
    sge_qmaster	6444/udp			# Grid Engine Qmaster Service
    sge_execd	6445/tcp			# Grid Engine Execution Service
    sge_execd	6445/udp			# Grid Engine Execution Service



ON 8e
-----

RETRY PORTS ON MASTER:

root@ip-10-124-231-156:/opt/sge6/default/common# telnet 10.253.202.159 63231
    Trying 10.253.202.159...
    Connected to 10.253.202.159.
    Escape character is '^]'.

    OK!!!
    
    
NOW QSTAT WORKS PARTIALLY:

qstat
    error: commlib error: access denied (client IP resolved to host name "ip-10-122-61-250.ec2.internal". This is not identical to clients host name "ip-10-124-231-156.ec2.internal")
    error: unable to contact qmaster using port 63231 on host "10.253.202.159"


SO FIXED BY UPDATING hostname WITH NEW IP (CHANGED AFTER REBOOT):
hostname ip-10-122-61-250.ec2.internal


NOW QSTAT AND SUB WORK FINE:

export SGE_QMASTER_PORT=63231
export SGE_EXECD_PORT=63232
export PATH=/opt/sge6/bin/lx24-amd64:$PATH
qstat
    OK
    
qsub /root/test/test.sh 
    Your job 1 ("test.sh") has been submitted



4. ENABLE SCHEDULER JOB INFORMATION
-----------------------------------

CHECK QSTAT OF RUNNING JOB:
qstat -j 3
    scheduling info:            (Collecting of scheduler job information is turned off)

SET JOB SCHEDULER INFO TO true:

export EDITOR=/usr/bin/emacs
qconf -msconf

    schedd_job_info                   true


ON MASTER
---------
RESTARTED QMASTER
qconf -ke all
qconf -km
    OK
/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd



NOW SCHEDULING INFO IS AVAILABLE THOUGH SEEMS SPURIOUS:
qstat -j 4

scheduling info: queue instance "all.q@node001" dropped because it is temporarily not available
                 queue instance "all.q@master" dropped because it is full


... AS JOB RAN OKAY:
qstat

    job-ID  prior   name       user         state submit/start at     queue                          slots ja-task-ID 
    -----------------------------------------------------------------------------------------------------------------
          4 0.55500 test.sh    root         r     05/02/2011 15:40:36 all.q@master



5. RUN TEST JOBS

ON 8e
-----

emacs /root/test/test.sh
#!/bin/sh

echo `hostname`
echo `date`
  
/root/test/test.pl \
/root/test/test.out \
10


ON MASTER
---------

emacs /root/test/test.pl
#!/usr/bin/perl -w

use strict;

my $filename = $ARGV[0];
my $times = $ARGV[1];
my $sleep = $ARGV[2];
$times = 5 if not defined $times;
$sleep = 5 if not defined $sleep;


open(OUT, ">$filename") or die "Can't open filename: $filename\n";
print OUT `date`;

my $counter = 0;
while ( $counter < $times )
{
    print OUT "$counter:  ";
    print OUT `date`;
    $counter++;
    
    sleep(5);
}
close(OUT) or die "Can't close filename: $filename\n";
print "Completed $0\n";


chmod 755 /root/test/test.pl



ON 8e
-----

RUN JOB:

qsub /root/test/test.sh
    Your job 7 ("test.sh") has been submitted
    OK!!
    

ON MASTER
---------

CHECK RESULTS:

root@master:~/test# cat test.out
    Mon May  2 16:13:36 UTC 2011
    0:  Mon May  2 16:13:36 UTC 2011
    1:  Mon May  2 16:13:41 UTC 2011
    2:  Mon May  2 16:13:46 UTC 2011
    3:  Mon May  2 16:13:51 UTC 2011
    4:  Mon May  2 16:13:56 UTC 2011
    5:  Mon May  2 16:14:01 UTC 2011
    6:  Mon May  2 16:14:06 UTC 2011
    7:  Mon May  2 16:14:11 UTC 2011
    8:  Mon May  2 16:14:16 UTC 2011
    9:  Mon May  2 16:14:21 UTC 2011

    OK!
    
</entry>

