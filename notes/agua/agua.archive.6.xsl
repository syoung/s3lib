agua.archive.6

<entry [Tue 2011:10:25 13:56:26 EST] FIXED 'No match' ERROR WHEN SUBMITTING JOBS TO SGE>
    
SUMMARY:

MUST SET QUEUE SHELL TO BASH



PROBLEM:

GET 'No match' ERROR WHEN SUBMITTING JOBS TO SGE ALTHOUGH SCRIPT RUNS FINE OTHERWISE


DIAGNOSIS:

qsub -V -q syoung-Project1-Workflow1 scripts/Project1-1-Workflow1-1.sh
    OK
    
/nethome/syoung/agua/Project1/Workflow1# cat stdout/Project1-1-Workflow1-1.err

    /usr/bin/perl: No match.
    /usr/bin/perl: No match.
    PROJECT: Undefined variable.   <==== RAN MANUALLY WITHOUT ENVIRONMENT VARS
    /agua/0.6/bin/apps/utils/deepvac.pl: No match.  <=== REMOVED /usr/bin/perl
    /usr/bin/perl: No match.        <=== USED #/bin/sh 
    /agua/0.6/bin/apps/utils/deepvac.pl: No match. <=== REMOVED /usr/bin/perl
    /agua/0.6/bin/apps/utils/deepvac.pl: No match.  <=== REMOVED /usr/bin/perl
    /mnt/agua/0.6/bin/apps/utils/deepvac.pl: No match.
    /usr/bin/perl: No match.    <=== PARED DOWN TO COMMAND + SGE COMMANDS

THE SCRIPT IS:

#!/bin/bash

#$ -N Project1-1-Workflow1-1
#$ -o /nethome/syoung/agua/Project1/Workflow1//stdout/Project1-1-Workflow1-1.out
#$ -e /nethome/syoung/agua/Project1/Workflow1//stdout/Project1-1-Workflow1-1.err
#$ -q syoung-Project1-Workflow1
#$ -l h_rt=24:00:00

#hostname -f
#date > /nethome/syoung/agua/Project1/Workflow1//lock/Project1-1-Workflow1-1.lock
/usr/bin/perl /agua/0.6/bin/apps/utils/deepvac.pl --outputdir /nethome/syoung/agua/Project1/Workflow1/downloads --regex chr[XYM0-9]+\.fa\.gz --type html --url http://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes
#unlink /nethome/syoung/agua/Project1/Workflow1//lock/Project1-1-Workflow1-1.lock;


SOLUTION:

CHANGE FROM C SHELL TO BASH 


    
</entry>

<entry [Mon 2011:10:24 23:51:10 EST] CREATED resetMaster.pl TO UPDATE MASTER IP, SGE AND MOUNTS AFTER RESTART>



SUMMARY:

resetMaster.pl CONNECTS TO reset.cgi ON HEADNODE OVER HTTPS AFTER EACH REBOOT (INCLUDING RESTART)

    - CHECKS IF MASTER IP HAS CHANGED

    - IF CHANGED UPDATES MASTER IP, SGE AND MOUNTS FROM HEADNODE


startup.py SETS resetMaster.pl TO RUN AT BOOT:

    -   COPIES PRIVATE/PUBLIC KEYS TO MASTER /reset

    -   COPIES resetMaster.pl TO MASTER /reset

    -   SETS /etc/rc.local TO RUN resetMaster.pl AT STARTUP


NB: HAS 'LOG' VARIABLE SET TO 1 IN updateHostname.pl FOR DEBUGGING IN SGE.pm (1= 'ON', 0 = 'OFF')

NNB: SGE STAYS RUNNING OKAY ON MASTER WHILE HEADNODE IS REBOOTING!!



TESTING
-------

HEADNODE startup.py:
(NB: CHECK FOR TYPOS IN PLUGIN ENTRY IF GET THIS ERROR: 'PluginError: Not enough settings provided for plugin startup')

# STARTUP.PY
cd /nethome/admin/.starcluster/plugins
/data/starcluster/0.92rc2/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-microcluster.config \
shell

cfg.get_plugin('startup')
import startup; clus = cluster.ClusterManager(cfg); cluster.ClusterManager.run_plugin(clus, 'startup', 'syoung-microcluster')

reload(startup); cluster.ClusterManager.run_plugin(clus, 'startup', 'syoung-microcluster')



MASTER resetMaster.pl:

/reset/resetMaster.pl --cell syoung-microcluster --headnodeid i-b34d25d2 --cgiscript /cgi-bin/agua/0.6/reset.cgi


HEADNODE reset.cgi:

echo '{"masterid":"i-98b09ef8","mode":"resetMaster","cell":"syoung-microcluster"}' | ./reset.cgi





TROUBLESHOOTING
===============

PROBLEM:

NFS ERROR WHEN ISSUE REMOTE OR LOCAL MOUNT COMMAND:
mount -t nfs ip-10-122-126-60.ec2.internal:/nethome /mnt/nethome
    mount.nfs: access denied by server while mounting ip-10-122-126-60.ec2.internal:/nethome


DIAGNOSIS:

MASTER NAME WAS NOT UPDATED IN HEADNODE /etc/exports

OR

HEADNOE NAME WAS NOT UPDATED IN MASTER /etc/fstab


NB: DAEMONS RUNNING WITH CORRECT PORTS. CHECKED BY RUNNING rpcinfo (NB: portmap is now called rpcbind on recent releases)

ON SERVER
# This will give a listing of running RPC programs that has to include mountd, portmapper, nfs, and nlockmgr.
rpcinfo -p localhost 

ON CLIENT:
# Return status, portmapper, and nlockmgr as running.
rpcinfo -p






PROBLEM:

10/18/2011 20:00:40|  main|ip-10-126-43-137|E|can't find connection
10/18/2011 20:00:40|  main|ip-10-126-43-137|E|can't get configuration from qmaster -- backgrounding


DIAGNOSIS:

HOSTNAME IN act_qmaster IS OLD
echo "ip-10-126-35-168.ec2.internal" > /opt/sge6/syoung-microcluster/common/act_qmaster 


SOLUTION:

UPDATE HOSTNAME AND ADD TO SUBMIT/ADMIN HOSTS:

root@ip-10-126-43-137:~# /opt/sge6/bin/lx24-amd64/qconf -sserror: denied: host "ip-10-126-35-168.ec2.internal" is neither submit nor admin host



PROBLEM:

error: commlib error: access denied (client IP resolved to host name "master". This is not identical to clients host name "ip-10-125-6-139.ec2.internal")
ERROR: unable to send message to qmaster using port 36341 on host "ip-10-125-6-139.ec2.internal": got send error
root@ip-10-125-6-139:~# cat /opt/sge6/syoung-microcluster/common/act_qmaster 
ip-10-125-6-139.ec2.internal


DIAGNOSIS:

DIDN'T ADD NEW DNS_NAME TO /etc/hosts


SOLUTION:

ON MASTER ADD ip-10-125-6-139.ec2.internal LONG INTERNAL IP (DNS_NAME) TO /etc/hosts:


    10.125.6.139 ip-10-125-6-139.ec2.internal master


THEN MASTER IS ABLE TO ACCESS SGE:

qconf -sh

    domU-12-31-38-01-C2-F0.compute-1.internal
    ip-10-122-194-11.ec2.internal
    ip-10-125-6-139.ec2.internal
    master

    
</entry>

<entry [Sun 2011:10:23 11:28:17 EST] FIXED: MASTER STALLS AFTER HEADNODE REBOOT DUE TO MOUNT PROBLEMS>

PROBLEM:

MASTER STALLS WHEN REBOOT HEADNODE OR STOP NFS DAEMON ON HEADNODE


DIAGNOSIS:

MASTER NFS CLIENT STALLS AND HANGS SYSTEM BECAUSE MOUNTS ARE IN '/'


SOLUTION:

MOVE MOUNTS TO /mnt AND CREATE LINKS TO '/':

1. AFTER HEADNODE REBOOT, UPDATE /etc/fstab ON MASTER WITH NEW HEADNODE DNS NAME

2. CREATE MOUNT DIRS ON MASTER IF NOT PRESENT

rm -fr /agua
mkdir -p /mnt/agua
ln -s /mnt/agua /agua

3. RESTART NFS DAEMONS ON HEADNODE AND MASTER


EVEN WITH THIS FIX, cat HANGS ON MASTER, ALTHOUGH tail AND em ARE FINE


NOTES
=====
NON-HANGING FILE SYSTEM CHECK
-----------------------------

WHEN NFS SERVER IS OFF:

root@domU-12-31-38-04-25-6E:/etc# perl -e 'eval("print `ls /mnt/nethome/syoung`")'
^X^C
root@domU-12-31-38-04-25-6E:/etc# perl -e 'eval("print `ls /mnt/nethome`")'
^X^C
root@domU-12-31-38-04-25-6E:/etc# perl -e 'eval("print `ls /mnt`")'
agua
data
nethome
sgeadmin


DETACH
------
MOUNT STOPPED MASTER ROOT VOLUME ON HEADNODE:

ec2-detach-volume vol-d1b798bb
ec2-attach-volume vol-d1b798bb -i i-b34d25d2 -d /dev/sdj
ec2dvol vol-d1b798bb

ON HEADNODE:
mount /dev/sdj /mnt

REATTACH
---------
ON HEADNODE:
cd /; umount /mnt; fuser -m /mnt

ON TOSHIBA:
ec2-detach-volume --force vol-d1b798bb
ec2dvol vol-d1b798bb
ec2-attach-volume vol-d1b798bb -i i-98b09ef8 -d /dev/sda1
ec2dvol vol-d1b798bb



REBOOTED 

showmount -e  ip-10-122-126-137.ec2.internal
Export list for ip-10-122-126-137.ec2.internal:
/nethome domU-12-31-38-04-25-6E.compute-1.internal
/data    domU-12-31-38-04-25-6E.compute-1.internal
/agua    domU-12-31-38-04-25-6E.compute-1.internal



REBOOTED HEAD AND CHECKED MASTER ERROR LOGS:

diff -r log/daemon.log /var/log/daemon.log
2690a2691
> Oct 24 04:00:08 domU-12-31-38-04-25-6E mountd[561]: Caught signal 15, un-registering and exiting.
diff -r log/kern.log /var/log/kern.log
5451a5452,5455
> Oct 24 04:00:08 domU-12-31-38-04-25-6E kernel: [ 2305.111861] nfsd: last server has exited, flushing export cache
> Oct 24 04:00:10 domU-12-31-38-04-25-6E kernel: [ 2306.168454] svc: failed to register lockdv1 RPC service (errno 97).
> Oct 24 04:00:10 domU-12-31-38-04-25-6E kernel: [ 2306.169166] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
> Oct 24 04:00:10 domU-12-31-38-04-25-6E kernel: [ 2306.169183] NFSD: starting 90-second grace period
diff -r log/messages /var/log/messages
5151a5152,5155
> Oct 24 04:00:08 domU-12-31-38-04-25-6E kernel: [ 2305.111861] nfsd: last server has exited, flushing export cache
> Oct 24 04:00:10 domU-12-31-38-04-25-6E kernel: [ 2306.168454] svc: failed to register lockdv1 RPC service (errno 97).
> Oct 24 04:00:10 domU-12-31-38-04-25-6E kernel: [ 2306.169166] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
> Oct 24 04:00:10 domU-12-31-38-04-25-6E kernel: [ 2306.169183] NFSD: starting 90-second grace period
diff -r log/syslog /var/log/syslog
8539a8540,8544
> Oct 24 04:00:08 domU-12-31-38-04-25-6E mountd[561]: Caught signal 15, un-registering and exiting.
> Oct 24 04:00:08 domU-12-31-38-04-25-6E kernel: [ 2305.111861] nfsd: last server has exited, flushing export cache
> Oct 24 04:00:10 domU-12-31-38-04-25-6E kernel: [ 2306.168454] svc: failed to register lockdv1 RPC service (errno 97).
> Oct 24 04:00:10 domU-12-31-38-04-25-6E kernel: [ 2306.169166] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
> Oct 24 04:00:10 domU-12-31-38-04-25-6E kernel: [ 2306.169183] NFSD: starting 90-second grace period



CRON UMOUNT/REMOUNT SCRIPT:


#!/bin/bash

NFS_HOST=$(mount | grep nfs | awk '{ print $1 }' | cut -d ":" -f 1)
NFS_HOST_PATH=$(mount | grep nfs | awk '{ print $1 }' | cut -d ":" -f 2)

host $NFS_HOST

if [[ $? -ne 0 ]]; then
    echo "NFS host $NFS_HOST doesn't exist!"
    exit 2
fi

MOUNT_POINT=$(mount | grep $NFS_HOST | awk '{ print $3 }')

NFS_IP=$(host $NFS_HOST | awk '{ print $4 }')

mount | grep "$NFS_IP"

if [[ $? -ne 0 ]]; then
    umount -fl $MOUNT_POINT
    mount "$NFS_HOST:$NFS_HOST_PATH" $MOUNT_POINT
fi




http://www.cs.bgu.ac.il/~arik/usail/network/nfs/tips.html

Exporting

Use the ro (read-only) option unless clients must write to file.
In secure installations, set anon to -1 to disable root access on any client, except those specified in the root option.
Mounting

Use conventional mounting for clients that are inoperable without NFS directories (such as diskless or dataless clients) and for directories frequently used.
If directories are mounted with rw (read-write) option or if they are executable files they should be mounted with hard option. If the NFS server fails while a directory is hard-mounted, the client keeps trying to complete the current NFS operation until the server responds.
The intr option is recommended when using a hard mount. It allows the user to break transmission attempts if the server becomes unavailable for an extended period of time.
The bg option should be used to expedite the boot process if a server is unavailable when the client is booting. In other words, a client hangs until the server comes back up unless bg option is specified.
Do not put NFS mount points in the root '/' directory of a client. Mount points in a root directory can slow the performance of the client and can cause the client to be unavailable when the server becomes unavailable.







NB: CAN'T ENABLE NFS LOGGING ON UBUNTU? WORKS ON SOLARIS:
http://docstore.mik.ua/orelly/networking_2ndEd/nfs/ch14_06.htm



    
</entry>
<entry [Sun 2011:10:23 11:00:49 EST] BASIC updateHostname.sh SHELL SCRIPT>


#!/bin/sh                                                                                                                                   

#### AUTOMOUNT DATA                                                                                                                         
mount -t ext3 /dev/sdh /data

#### START LOG                                                                                                                              
LOGFILE=/tmp/aguaStartup.log
echo "Doing aguaStartup.sh" > $LOGFILE
echo `date` >> $LOGFILE

#### GET THE INTERNAL IP                                                                                                                    
META=http://169.254.169.254/latest/meta-data
HOSTNAME=`/usr/bin/curl -s $META/hostname | /bin/sed 's+\..*++g'`
echo "hostname: " $HOSTNAME 2>> $LOGFILE 1>> $LOGFILE

#### SET HOSTNAME                                                                                                                           
hostname $HOSTNAME  2>> $LOGFILE 1>> $LOGFILE
echo $HOSTNAME > /etc/hostname


#IPV4=`/usr/bin/curl -s $META/public-ipv4`                                                                                                  
### DNS API ...

    
    
</entry>
<entry [Thu 2011:10:20 21:40:12 EST] FIXED: HEADNODE STALLS BECAUSE OF MOUNT PROBLEMS>

SUMMARY
-------

PROBLEM:

HEADNODE STALLS ON REBOOT

DIAGNOSIS:

DUE TO ERRONEOUS nfs LINE IN HEADNODE /etc/fstab:
    

SOLUTION:

REMOVED LINE IN /etc/fstab AND REBOOTED OKAY



DETAILS
-------

PROBLEM:
    
ec2-get-console-output $head

    ...
    mountall: Disconnected from Plymouth
    mountall: mount /data [374] terminated with status 32
    mount.nfs: remote share not in 'host:dir' format
    init: ureadahead-other main process (388) terminated with status 4
    init: ureadahead-other main process (390) terminated with status 4
    init: ureadahead-other main process (392) terminated with status 4
    init: plymouth-log main process (408) terminated with status 1
    mountall: mount /data [385] terminated with status 32
    mount.nfs: remote share not in 'host:dir' format
    mountall: mount /data [451] terminated with status 32
    [74G[ OK ]g AppArmor profiles       [80G 
    [74G[ OK ] sensors limits       [80G 
     * ipvsadm is not configured to run. Please run dpkg-reconfigure ipvsadm
    init: apport pre-start process (517) terminated with status 1
    init: apport post-stop process (527) terminated with status 1
     [33m*[39;49m No configuration file found, doing nothing.
    Starting ha_logd: ok
    logd: [580]: info: logd started with default configuration.
    logd: [580]: WARN: Core dumps could be lost if multiple dumps occur.
    logd: [580]: WARN: Consider setting non-default value in /proc/sys/kernel/core_pattern (or equivalent) for maximum supportability
    logd: [580]: WARN: Consider setting /proc/sys/kernel/core_uses_pid (or equivalent) to 1 for maximum supportability
    logd: [580]: info: G_main_add_SignalHandler: Added signal handler for signal 15
    logd: [582]: info: G_main_add_SignalHandler: Added signal handler for signal 15
    mount.nfs: remote share not in 'host:dir' format
    mountall: mount /data [594] terminated with status 32
    [74G[ OK ]ng directories for NFS kernel daemon...       [80G 
    [74G[ OK ]g NFS kernel daemon       [80G 
    Starting openhpid:  * success
    landscape-client is not configured, please run landscape-config.
    updateHostname.pl     printing to logfile: /tmp/agua.updatehostname.log
    [74G[ OK ]ing web server apache2       [80G 
    mount: /dev/sdi already mounted or /nethome busy
    mount: according to mtab, /dev/sdi is already mounted on /nethome
    
    Ubuntu 10.04.2 LTS ip-10-122-243-110.ec2.internal tty1


LAUNCHED RESCUE INSTANCE:

ec2-run-instances \
ami-76837d1f \
-g default \
-k aquarius2 \
--instance-type t1.micro \
-z us-east-1a

    RESERVATION	r-70fb6c1e	728213020069	default
    INSTANCE	i-bcc3dadc	ami-76837d1f			pending	aquarius2	0		t1.micro	2011-10-21T02:23:40+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs		paravirtual	

ec2din i-bcc3dadc

    RESERVATION	r-70fb6c1e	728213020069	default
    INSTANCE	i-bcc3dadc	ami-76837d1f	ec2-107-22-46-67.compute-1.amazonaws.com	domU-12-31-38-07-40-97.compute-1.internal	running	aquarius2	0		t1.micro	2011-10-21T02:23:40+0000	us-east-1a	aki-0b4aa462		monitoring-disabled	107.22.46.67	10.223.67.101			ebs					paravirtual	
    BLOCKDEVICE	/dev/sda1	vol-47ffff2d	2011-10-21T02:24:15.000Z	
    BLOCKDEVICE	/dev/sdi	vol-45ffff2f	2011-10-21T02:24:15.000Z	
    BLOCKDEVICE	/dev/sdh	vol-5bffff31	2011-10-21T02:24:15.000Z	


CONNECT TO RESCUE INSTANCE

ssh root@ec2-107-22-46-67.compute-1.amazonaws.com


IDENTIFY ROOT VOLUME ON DOWNED NODE:

vol-101ce07a


ec2din $head
    RESERVATION	r-cb22aca4	728213020069	default
    INSTANCE	i-b34d25d2	ami-76837d1f			stopped	aquarius2	0t1.micro	2011-10-20T18:10:21+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs					paravirtual	
    BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-10-21T01:51:50.000Z	
    BLOCKDEVICE	/dev/sdh	vol-141ce07e	2011-10-21T01:51:50.000Z	
    BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-10-21T01:51:50.000Z	
    TAG	instance	i-b34d25d2	name	aquarius-8g
    TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)


ec2-detach-volume vol-101ce07a
ec2-attach-volume vol-101ce07a -i i-bcc3dadc -d /dev/sdj
ec2dvol vol-101ce07a


MOUNT DOWNED INSTANCE VOLUME ON RESCUE INSTANCE:

mount /dev/sdj /mnt



EDITED OUT MOUNT COMMANDS IN /etc/rc.local

    #### SET HOSTNAME
    /agua/0.6/bin/scripts/updateHostname.pl
    
    #### RESTART apache2
    /etc/init.d/apache2 restart
    
    #### AUTOMOUNT /data
    #mount -t ext3 /dev/sdh /data
    #### AUTOMOUNT /nethome
    #mount -t ext3 /dev/sdi /nethome


... AND REMOVED THE NFS RELATED (AND UNCOMMENTED) LINE IN FSTAB:

cat fstab

# /etc/fstab: static file system information.
# file system  mount point   type  options       dump  pass
proc            /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1       /               ext3    defaults        0       0
/dev/sdb1       /mnt 		auto 	defaults,nobootwait 0 0
/dev/sdh        /data	  	ext3	defaults,nobootwait 0 0
/dev/sdi        /nethome      	ext3    defaults,nobootwait 0 0
/nethome/mysql/etc/mysql /etc/mysql     none bind
/nethome/mysql/lib/mysql /var/lib/mysql none bind
/nethome/mysql/log/mysql /var/log/mysql none bind
/dev/sdh        /data           nfs     defaults,nfsvers=3 0 0  <========= ****** HERE *******
#/dev/sdi        /nethome        nfs     defaults,nfsvers=3 0 0
#/dev/sdh	/data	 	nfs     rw,nfsvers=3,rsize=32768,wsize=32768 0 0
#/dev/sdi	/nethome	nfs     rw,nfsvers=3,rsize=32768,wsize=32768 0 0


/etc/mtab LOOKS NORMAL:

cat mtab
    /dev/sda1 / ext3 rw 0 0
    proc /proc proc rw,noexec,nosuid,nodev 0 0
    none /sys sysfs rw,noexec,nosuid,nodev 0 0
    devtmpfs /dev devtmpfs rw,mode=0755 0 0
    none /dev/pts devpts rw,noexec,nosuid,gid=5,mode=0620 0 0
    none /dev/shm tmpfs rw,nosuid,nodev 0 0
    none /var/run tmpfs rw,nosuid,mode=0755 0 0
    none /var/lock tmpfs rw,noexec,nosuid,nodev 0 0
    none /lib/init/rw tmpfs rw,nosuid,mode=0755 0 0
    nfsd /proc/fs/nfsd nfsd rw 0 0



REATTACHED AND RESTARTED HEAD:

ON RESCUE:
umount /mnt

ON TOSHIBA:
ec2-detach-volume vol-101ce07a
ec2-attach-volume vol-101ce07a -i i-b34d25d2 -d /dev/sda1
ec2dvol vol-101ce07a



#### WORKED OKAY FOR A COUPLE OF RESTARTS BUT THEN FAILED TO RESTART AT FIRST ATTEMPT TO CHECK EXISTENCE OF /agua DIRECTORY:

ec2-get-console-output $head

    ...
    ip-10-122-171-95.ec2.internal:/dev/sdj  /nethome    nfs     rnfsvers=3,defaults 0 0" > /etc/fstab'
    Agua::Ops::sshCommand    result: 
    Agua::Ops::sshCommand    command: ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-126-42-99.ec2.internal 'if [ -f /etc/fstab ]; then echo 1; else echo 0; fi'
    Agua::Ops::sshCommand    result: 1
    
    Agua::Ops::sshCommand    command: ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-126-42-99.ec2.internal 'cat /etc/fstab'
    Agua::Ops::sshCommand    result: # file system  mount point   type  options       dump  pass
    proc         /proc           proc    nodev,noexec,nosuid 0       0
    /dev/sda1    /               ext3    defaults            0       0
    /dev/sdb1    /mnt            auto    defaults,nobootwait 0       0
    
    ip-10-122-171-95.ec2.internal:/dev/sdh  /agua    nfs     rnfsvers=3,defaults 0 0
    ip-10-122-171-95.ec2.internal:/dev/sdi  /data    nfs     rnfsvers=3,defaults 0 0
    ip-10-122-171-95.ec2.internal:/dev/sdj  /nethome    nfs     rnfsvers=3,defaults 0 0
    
    Agua::Ops::restartNfs    uname: Linux ip-10-122-171-95.ec2.internal 2.6.32-305-ec2 #9-Ubuntu SMP Thu Apr 15 08:05:38 UTC 2010 x86_64 GNU/Linux
    
    Agua::StarCluster::mountNfs    StarCluster::mountNfs(source, sourceip, mountpoint, keypairfile, targetip)
    Agua::StarCluster::mountNfs    source: /agua
    Agua::StarCluster::mountNfs    sourceip: ip-10-122-171-95.ec2.internal
    Agua::StarCluster::mountNfs    mountpoint: /agua
    Agua::Ops::sshCommand    command: ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-126-42-99.ec2.internal 'if [ -d /agua ]; then echo 1; else echo 0; fi'
    init: mongodb main process (521) terminated with status 12
     * ipvsadm is not configured to run. Please run dpkg-reconfigure ipvsadm
     [33m*[39;49m No configuration file found, doing nothing.
    Stopping openhpid:  * success
    Stopping ha_logd: logd: [862]: debug: Stopping ha_logd with pid 568
    logd: [568]: debug: logd_term_action: received SIGTERM
    logd: [568]: debug: logd_term_action: waiting for 0 messages to be read by write process
    logd: [568]: debug: logd_term_action: sending SIGTERM to write process
    logd: [571]: info: logd_term_write_action: received SIGTERM
    logd: [571]: debug: Writing out 0 messages then quitting
    logd: [571]: info: Exiting write process
    logd: [862]: info: Waiting for pid=568 to exit
    logd: [862]: info: Pid 568 exited
    stopped
    [74G[ OK ]g NFS kernel daemon       [80G 
    [74G[ OK ]ting directories for NFS kernel daemon...       [80G 
    [74G[ OK ]or running unattended-upgrades:  * Asking all remaining processes to terminate...       [80G 
    [74G[ OK ]cesses ended within 1 seconds....       [80G 
    [74G[ OK ]guring network interfaces...       [80G 
    [74G[ OK ]ating swap...       [80G 
    [74G[ OK ]ing local filesystems...       [80G 
     * Will now halt
    [  994.857995] System halted.
    



RESTARTED RESCUE INSTANCE:

ec2din i-bcc3dadc

    RESERVATION	r-70fb6c1e	728213020069	default
    INSTANCE	i-bcc3dadc	ami-76837d1f	ec2-174-129-129-109.compute-1.amazonaws.com	ip-10-86-129-151.ec2.internal	running	aquarius2	0		t1.micro	2011-10-21T14:30:34+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.129.109	10.86.129.151			ebs					paravirtual	
    BLOCKDEVICE	/dev/sda1	vol-47ffff2d	2011-10-21T14:31:08.000Z	
    BLOCKDEVICE	/dev/sdi	vol-45ffff2f	2011-10-21T14:31:08.000Z	
    BLOCKDEVICE	/dev/sdh	vol-5bffff31	2011-10-21T14:31:08.000Z	


... AND INVESTIGATED FILESYSTEM AND LOGS:
NO CHANGE IN /etc/fstab AND /etc/mtab
NO LOGGING TO /var/log/syslog AS USUAL..!!!


ENABLED LOGGING TO /var/log/startup.log AND /var/log/syslog BY ADDING TO TOP OF /etc/rc.local:
( SEE: [Fri 2011:10:21 14:50:14 EST] EDIT /etc/rc.local TO ENABLE CONSOLE OUTPUT LOGGING TO FILE)

#!/usr/bash -ex

exec > >(tee /var/log/startup.log|logger -t STARTUP-SCRIPT -s 2>/dev/console) 2>&1


... AND RESTARTED HEAD:


REATTACHED AND RESTARTED HEAD:

ON RESCUE:
umount /mnt

ON TOSHIBA:
ec2-detach-volume vol-101ce07a
ec2-attach-volume vol-101ce07a -i i-b34d25d2 -d /dev/sda1
ec2dvol vol-101ce07a


... BUT RESTARTING HEAD RESULTED IN MASTER HANGING AT MOUNT COMMAND IN HEADNODE STARTUP SCRIPT:

    ...
    Agua::StarCluster::mountNfs    StarCluster::mountNfs(source, sourceip, mountpoint, keypairfile, targetip)
    Agua::StarCluster::mountNfs    source: /agua
    Agua::StarCluster::mountNfs    sourceip: ip-10-122-171-95.ec2.internal
    Agua::StarCluster::mountNfs    mountpoint: /agua
    Agua::Ops::sshCommand    command: ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-126-42-\
    99.ec2.internal 'if [ -d /agua ]; then echo 1; else echo 0; fi'

    (MASTER HANGS)


DIAGNOSIS:

FORGOT TO COMMENT OUT CANNED INSTANCE INFO USED FOR TESTING IN Agua::Common::SGE SO THE OLD HEADNODE INTERNAL IP ADDRESS WAS USED IN updateHostname.pl.


OLD IP: ip-10-122-171-95.ec2.internal
NEW IP: ip-10-122-127-70.ec2.internal

THIS IS APPARENT IN MASTER /var/log/syslog, WHICH SHOWS MASTER IS TRYING TO MOUNT WITH OLD IP:

    Oct 21 08:39:48 ip-10-126-42-99 kernel: [   13.368868] eth0: no IPv6 routers present
    Oct 21 14:21:26 ip-10-126-42-99 kernel: [20511.273457] nfs: server ip-10-122-171-95.ec2.internal not responding, still trying
    Oct 22 01:48:16 ip-10-126-42-99 kernel: [61719.273487] nfs: server ip-10-122-171-95.ec2.internal not responding, still trying
    Oct 22 04:11:07 ip-10-126-42-99 kernel: Kernel logging (proc) stopped.
    Oct 22 04:11:30 ip-10-126-42-99 kernel: imklog 4.2.0, log source = /proc/kmsg started.
    Oct 22 04:11:30 ip-10-126-42-99 kernel: [    0.000000] Initializing cgroup subsys cpuset
    Oct 22 04:11:30 ip-10-126-42-99 kernel: [    0.000000] Initializing cgroup subsys cpu
    Oct 22 04:11:30 ip-10-126-42-99 kernel: [    0.000000] Linux version 2.6.32-305-ec2 (buildd@yellow) (gcc version 4.4.3 (Ubuntu 4.4.3-4ubuntu5) ) #9-Ubuntu SMP Thu Apr 15 08:05:3\
    8 UTC 2010 (Ubuntu 2.6.32-305.9-ec2 2.6.32.11+drm33.2)
    Oct 22 04:11:30 ip-10-126-42-99 kernel: [    0.000000] Command line:  root=/dev/sda1 ro 4
    Oct 22 04:11:30 ip-10-126-42-99 kernel: [    0.000000] KERNEL supported cpus:
    Oct 22 04:11:30 ip-10-126-42-99 kernel: [    0.000000]   Intel GenuineIntel



... THIS IS BECAUSE THE MASTER'S /etc/fstab CONTAINS THE OLD IP SETTINGS:

cat /etc/fstab
    proc         /proc           proc    nodev,noexec,nosuid 0       0
    /dev/sda1    /               ext3    defaults            0       0
    /dev/sdb1    /mnt            auto    defaults,nobootwait 0       0
    
    ip-10-122-171-95.ec2.internal:/dev/sdh  /agua    nfs     rnfsvers=3,defaults 0 0
    ip-10-122-171-95.ec2.internal:/dev/sdi  /data    nfs     rnfsvers=3,defaults 0 0
    ip-10-122-171-95.ec2.internal:/dev/sdj  /nethome    nfs     rnfsvers=3,defaults 0 0



SOLUTION:

1. COMMENTED OUT DEBUG INSTANCE INFO AND RERAN updateHostname.pl

2. JUST IN CASE THE ABOVE DOESN'T WORK IN PRACTICE, CREATED timeoutCommand IN Agua::Ops TO RESORT TO REBOOTING MASTER IF COMMAND NOT COMPLETED AFTER 10 SECONDS 





</entry>
<entry [Sat 2011:10:15 00:05:24 EST] FIXED PROBLEM: CAN'T RUN ec2 TOOLS ON MASTER>

ec2din
    Exception in thread "main" java.lang.NoClassDefFoundError: com/amazon/aes/webservices/client/cmd/DescribeInstances
    ...


DIAGNOSIS:

NB: DIFFERENT JAVA VERSIONS ON TOSHIBA AND MASTER BUT THIS DOESN'T AFFECT IT

TOSHIBA:

java -version
java version "1.6.0_22"
OpenJDK Runtime Environment (IcedTea6 1.10.2) (6b22-1.10.2-0ubuntu1~11.04.1)
OpenJDK 64-Bit Server VM (build 20.0-b11, mixed mode)

MASTER:

env | grep EC2
EC2_HOME=/usr/
EC2_PRIVATE_KEY=/agua/conf/admin/.keypairs/private.pem
EC2_CERT=/agua/conf/admin/.keypairs/public.pem

root@master:/usr/bin# java -version
java version "1.6.0_24"
Java(TM) SE Runtime Environment (build 1.6.0_24-b07)
Java HotSpot(TM) 64-Bit Server VM (build 19.1-b02, mixed mode)



THE PROBLEM LIES IN THE LAST LINE OF /usr/bin/ec2-cmd FILE ON MASTER:
(
SEE FULL FILE CONTENTS AT:
apps/ec2/usr-bin-ec2-cmd-BAD.txt
apps/ec2/usr-bin-ec2-cmd-GOOD.txt
)

"${JAVA_HOME}/bin/java" ${EC2_JVM_ARGS} ${cygprop} -classpath "${CP}" "com.amazon.aes.webservices.client.cmd.${CMD}" $EC2_DEFAULT_ARGS "$@"


CAN REPLICATE THE ERROR AS FOLLOWS:

export CLASSPATH=/usr/lib/ec2-api-tools
export CMD=DescribeInstances
export CP=$CLASSPATH
java $EC2_JVM_ARGS $cygprop -classpath "$CP" com.amazon.aes.webservices.client.cmd.$CMD "$@"

    Exception in thread "main" java.lang.NoClassDefFoundError: com/amazon/aes/webservices/client/cmd/DescribeInstances
    Caused by: java.lang.ClassNotFoundException: com.amazon.aes.webservices.client.cmd.DescribeInstances
        at java.net.URLClassLoader$1.run(URLClassLoader.java:202)
        at java.security.AccessController.doPrivileged(Native Method)
        at java.net.URLClassLoader.findClass(URLClassLoader.java:190)
        at java.lang.ClassLoader.loadClass(ClassLoader.java:307)
        at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:301)
        at java.lang.ClassLoader.loadClass(ClassLoader.java:248)
    Could not find the main class: com.amazon.aes.webservices.client.cmd.DescribeInstances.  Program will exit.
    Connection to ec2-184-73-104-84.compute-1.amazonaws.com closed.


THIS IS THE ORIGINAL (NON-WORKING) /usr/bin/ec2-cmd FILE ON MASTER:

cat /usr/bin/ec2-cmd.bkp

    #!/usr/bin/env bash
    
    # 'Globals'
    __ZIP_PREFIX__EC2_HOME="${EC2_HOME:-EC2_HOME is not set}"
    __RPM_PREFIX__EC2_HOME=/usr/local/aes/cmdline
    LIBDIR="${EC2_HOME}/lib"
    ...
    CMD=$1
    shift
    "${JAVA_HOME}/bin/java" ${EC2_JVM_ARGS} ${cygprop} -classpath "${CP}" "com.amazon.aes.webservices.client.cmd.${CMD}" $EC2_DEFAULT_ARGS "$@"



... WHICH DIFFERS WITH THE (WORKING) /usr/bin/ec2-cmd FILE ON HEADNODE:

cat /usr/bin/ec2-cmd

    #!/bin/sh
    
    # 'Globals'
    EC2_HOME=/usr/lib/ec2-api-tools
    LIBDIR=${EC2_HOME}
    
    # If a classpath exists preserve it
    CP=$CLASSPATH
    ...    
    CMD=$1
    shift
    exec java $EC2_JVM_ARGS $cygprop -classpath "$CP" com.amazon.aes.webservices.client.cmd.$CMD "$@"



SOLUTION:

REPLACED /usr/bin/ec2-cmd FILE WITH COPY FROM HEADNODE, THEN IT WORKED:

ec2din


    
</entry>
<entry [Fri 2011:10:14 18:03:37 EST] SET HOSTNAME IN /etc/hostname>

http://jblevins.org/notes/hostname
Linux Hostname Configuration

The ker­nel main­tains the cur­rent host­name which is set (in a dis­tri­b­u­tion-spe­cific way) at boot time and can be changed on the fly.

The do­main name is de­ter­mined by the re­solver sys­tem, usu­ally from the sta­tic hosts data­base (/etc/hosts) or via DNS.


The Host­name

The ker­nel main­tains the cur­rent (un­qual­i­fied) host­name of the sys­tem. Be­fore try­ing to set your host­name, it’s im­por­tant to know how to tell when you’ve got it right. Here are a few of the nu­mer­ous ways to ob­tain it:

    hostname
    uname -n
    cat /proc/sys/kernel/hostname
    sysctl kernel.hostname

The host­name can be changed tem­porar­ily by run­ning

hostname gauss
as root. This tells the ker­nel to use the host­name gauss until told oth­er­wise.


To change the host­name per­ma­nently:

De­bian-based sys­tems (De­bian, Ubuntu, etc.):

/etc/init.d/hostname.sh

is called at boot time and sets the host­name what is given in /etc/hostname.

To change the host­name:

1. place only the un­qual­i­fied host­name (e.g., gauss) in /etc/hostname
2. run sudo /etc/init.d/hostname.sh


Red Hat sys­tems look for a line like

1. Change the line in /etc/sysconfig/network

HOSTNAME=gauss

2. run hostname gauss as root or sim­ply re­boot.



The Fully Qual­i­fied Do­main Name (FQDN)

The do­main name is de­ter­mined /etc/hosts or DNS (by the re­solver sub­sys­tem). Putting to­gether the host­name and the do­main name yields the fully qual­i­fied do­main name (FQDN) of the sys­tem. The cur­rent FQDN of the sys­tem can be found as fol­lows:

% hostname -f
gauss.xbeta.org

To ob­tain this in­for­ma­tion the sys­tem first finds asks for the host­name: gauss. Then it asks for the IP ad­dress of gauss, which in my case is 66.103.254.221. Fi­nally, it asks for the full host­name and do­main that cor­re­sponds to 66.103.254.221: gauss.xbeta.org.


Change the FQDN:
Un­less you are using bind or NIS for host lookups you can change the FQDN and the DNS do­main name (which is part of the FQDN) in the /etc/hosts file.

1. Add a line to /etc/hosts file:

IP_address canonical_hostname [aliases...]

E.G.:

127.0.0.1 localhost
66.103.254.221 gauss.xbeta.org gauss

As far as the sys­tem is con­cerned, the ef­fects of chang­ing /etc/hosts are im­me­di­ate.

NB: Some ap­pli­ca­tions such as Fire­fox seem to cache this in­for­ma­tion and may need to be restarted.

    
</entry>
<entry [Mon 2011:10:24 14:53:18 EST] DEPRECATED: masterStartup.pl - PRECURSOR TO resetMaster.pl>

/agua/0.6/bin/scripts/masterStartup.pl  --privatekey /nethome/admin/.keypairs/private.pem --publiccert /nethome/admin/.keypairs/public.pem --cell syoung-microcluster --qmasterport 36341 --execdport 36342 --root /opt/sge6

WHICH AUTOMATES THE FOLLOWING

1. UPDATE HOSTNAME WITH NEW DNS_NAME
2. UPDATE IP AND DNS NAME IN /etc/hosts ON MASTER
3. UPDATE act_qmaster ON MASTER
4. UPDATE qmaster_info ON HEADNODE
5. REPLACE OLD DNS_NAME IN ADMIN HOSTS LIST


NB: qmaster_info IS CREATED BY HEADNODE DURING sge.py:
cat /opt/sge6/syoung-microcluster/qmaster_info
    ip-10-126-35-168.ec2.internal	ip-10-126-35-168	10.126.35.168	i-98b09ef8


1. UPDATE HOSTNAME WITH NEW DNS_NAME
hostname NEW_DNS_NAME
echo 'NEW_DNS_NAME' > /etc/hostname 
 
    
2. UPDATE IP AND DNS NAME IN /etc/hosts ON MASTER

REPLACE THIS:

10.253.197.26 master

WITH THIS:

10.125.6.139 master

TO GET THIS:

cat /etc/hosts

    # The following lines are desirable for IPv6 capable hosts
    ::1 ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    ff02::3 ip6-allhosts
    10.86.193.30 ip-10-86-193-30.ec2.internal ip-10-86-193-30 node001
    10.125.6.139 ip-10-125-6-139.ec2.internal master


WHERE NEW INSTANCE INFO IS:

INSTANCE	i-98b09ef8	ami-78837d11	ec2-67-202-7-202.compute-1.amazonaws.com	ip-10-125-6-139.ec2.internal	running	id_rsa-admin-key	0		t1.micro	2011-10-13T17:16:14+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	67.202.7.202	10.125.6.139			ebs					paravirtual	
BLOCKDEVICE	/dev/sda1	vol-d1b798bb	2011-10-13T17:16:34.000Z	
TAG	instance	i-98b09ef8	alias	master



3. UPDATE act_qmaster ON MASTER

cat /opt/sge6/syoung-microcluster/common/act_qmaster
    domU-12-31-38-01-C2-F0.compute-1.internal

echo "ip-10-125-6-139.ec2.internal" > /opt/sge6/syoung-microcluster/common/act_qmaster

    cat /opt/sge6/syoung-microcluster/common/act_qmasterip-10-125-6-139.ec2.internal
    ip-10-125-6-139.ec2.internal



4. UPDATE act_qmaster ON HEADNODE

cat /opt/sge6/syoung-microcluster/common/act_qmaster
    domU-12-31-38-01-C2-F0.compute-1.internal

echo "ip-10-125-6-139.ec2.internal" > /opt/sge6/syoung-microcluster/common/act_qmaster

    cat /opt/sge6/syoung-microcluster/common/act_qmasterip-10-125-6-139.ec2.internal
    ip-10-125-6-139.ec2.internal



5. REPLACE OLD DNS_NAME IN ADMIN HOSTS LIST

qconf -sh

    domU-12-31-38-01-C2-F0.compute-1.internal
    ip-10-122-194-11.ec2.internal
    ip-10-125-6-139.ec2.internal
    master
    
qconf -dh domU-12-31-38-01-C2-F0.compute-1.internal
    
qconf -sh 

    ip-10-122-194-11.ec2.internal
    ip-10-125-6-139.ec2.internal
    master

    
</entry>
<entry [Mon 2011:10:24 14:53:50 EST] SHELL SCRIPT TO MOUNT /data ON HEADNODE AND UPDATE HOSTNAME IN /etc/hostname>
    

#!/bin/sh

#### AUTOMOUNT DATA    
mount -t ext3 /dev/sdh /data

#### START LOG
LOGFILE=/tmp/aguaStartup.log
echo "Doing aguaStartup.sh" > $LOGFILE
echo `date` >> $LOGFILE

#### GET THE INTERNAL IP
META=http://169.254.169.254/latest/meta-data
HOSTNAME=`/usr/bin/curl -s $META/hostname | /bin/sed 's+\..*++g'`
echo "hostname: " $HOSTNAME 2>> $LOGFILE 1>> $LOGFILE

#### SET HOSTNAME
hostname $HOSTNAME  2>> $LOGFILE 1>> $LOGFILE
echo $HOSTNAME > /etc/hostname


#IPV4=`/usr/bin/curl -s $META/public-ipv4`
### DNS API ...




</entry>
<entry [Fri 2011:10:14 00:54:05 EST] CONFIRMED updateHostname.pl UPDATES IP AFTER STOP/START HEADNODE>

1. STORE OLD IP BEFORE STOP

ec2din $head
RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f	ec2-107-20-137-20.compute-1.amazonaws.com	domU-12-31-38-04-89-25.compute-1.internal	running	aquarius2	0		t1.micro	2011-10-14T03:25:03+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	107.20.137.20	10.220.138.211			ebs			paravirtual	
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-10-14T03:25:36.000Z	
BLOCKDEVICE	/dev/sdh	vol-141ce07e	2011-10-14T03:25:36.000Z	
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-10-14T03:25:36.000Z	
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)


2. STOP AND RESTART

ec2-stop-instances $head

ec2-start-instances $head

ec2din $head
    RESERVATION	r-cb22aca4	728213020069	default
    INSTANCE	i-b34d25d2	ami-76837d1f	ec2-50-19-174-222.compute-1.amazonaws.com	ip-10-87-11-112.ec2.internal	running	aquarius2	0		t1.micro	2011-10-14T04:57:12+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.19.174.222	10.87.11.112			ebs					paravirtual	
    BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-10-14T04:57:43.000Z	
    BLOCKDEVICE	/dev/sdh	vol-141ce07e	2011-10-14T04:57:43.000Z	
    BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-10-14T04:57:43.000Z	
    TAG	instance	i-b34d25d2	name	aquarius-8g
    TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)


3. CONFIRMED MASTER HOST LISTS ON MASTER CHANGED

root@ip-10-125-6-139:~# qconf -ss
domU-12-31-38-04-89-25.compute-1.internal
ip-10-126-33-135.ec2.internal
ip-10-127-97-73.ec2.internal

root@ip-10-125-6-139:~# qconf -ss
domU-12-31-38-04-89-25.compute-1.internal
ip-10-126-33-135.ec2.internal
ip-10-127-97-73.ec2.internal
ip-10-87-11-112.ec2.internal

root@ip-10-125-6-139:~# qconf -sh
domU-12-31-38-04-89-25.compute-1.internal
ip-10-126-33-135.ec2.internal
ip-10-126-43-231.ec2.internal
ip-10-127-97-73.ec2.internal


root@ip-10-125-6-139:~# qconf -sh
domU-12-31-38-04-89-25.compute-1.internal
ip-10-126-33-135.ec2.internal
ip-10-126-43-231.ec2.internal
ip-10-127-97-73.ec2.internal
ip-10-87-11-112.ec2.internal



BUT OLD IP IS WRONG:

em agua.sethostname.log
    Agua::Common::SGE::setHostname    oldip: domU-12-31-38-04-E2-CE




TROUBLESHOOTING
===============


COULD NOT FIND 'domU-12-31-38-04-E2-CE' ANYWHERE IN SYSTEM EXCEPT A COMMENTED OUT LINE IN /etc/hosts.


SO SET NEW IP IN /etc/hosts:


    ip-10-87-11-112.ec2.internal 10.87.11.112 localhost



STORED OLD IP AND RESTARTED:

ec2din $head


RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f	ec2-50-19-174-222.compute-1.amazonaws.com	ip-10-87-11-112.ec2.internal	running	aquarius2	0		t1.micro	2011-10-14T04:57:12+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.19.174.222	10.87.11.112			ebs				paravirtual	
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-10-14T04:57:43.000Z	
BLOCKDEVICE	/dev/sdh	vol-141ce07e	2011-10-14T04:57:43.000Z	
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-10-14T04:57:43.000Z	
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)


NEW MASTER IP:

ec2din $master
RESERVATION	r-56c97c38	728213020069	@sc-syoung-microcluster
INSTANCE	i-98b09ef8	ami-78837d11	ec2-184-73-104-84.compute-1.amazonaws.com	ip-10-126-43-137.ec2.internal	running	id_rsa-admin-key	0t1.micro	2011-10-14T13:16:16+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	184.73.104.84	10.126.43.137		ebs					paravirtual	
BLOCKDEVICE	/dev/sda1	vol-d1b798bb	2011-10-14T13:16:38.000Z	
TAG	instance	i-98b09ef8	alias	master


NEW HEAD IP:

ec2din $head
RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f	ec2-107-20-93-96.compute-1.amazonaws.com	ip-10-126-49-96.ec2.internal	running	aquarius2	0	t1.micro	2011-10-14T13:31:41+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	107.20.93.96	10.126.49.96			ebs					paravirtual	
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-10-14T13:32:11.000Z	
BLOCKDEVICE	/dev/sdh	vol-141ce07e	2011-10-14T13:32:11.000Z	
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-10-14T13:32:11.000Z	
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)



    
</entry>
<entry [Thu 2011:10:13 01:32:50 EST] FIXED STARCLUSTER MISCOUNT OF NODES (TWO EXTRA)>
    

PROBLEM:

STARCLUSTER IS COUNTING THE MASTER LONG INTERNAL IP ENTRY AND THE HEADNODE ENTRY IN THE ADMIN HOSTS LIST:

Agua::Monitor::SGE::BUILD    logfile:
/nethome/admin/agua/.cluster/syoung-microcluster-jobscheduler.log


tail -f /nethome/admin/agua/.cluster/syoung-microcluster-loadbalancer.out

    >>> qacct: no jobs running since startup
    /opt/sge6/syoung-microcluster/common/accounting: No such file or directory
    >>> Oldest job is from None. # queued jobs = 0. # hosts = 3.
    >>> Avg job duration = 0 sec, Avg wait time = 0 sec.
    >>> Won't add another host, currently at max (3).
    >>> Cluster change made less than 30 seconds ago (2011-10-13 04:41:26.299327).
    >>> Not changing cluster size until cluster stabilizes.
    >>> Sleeping, looping again in 30 seconds.


DIAGNOSIS:

THIS OCCURS BECAUSE balancers/sge/__init__.py COUNTS THE HOSTS AS FOLLOWS:

CALL TO qhost DELIVERS LIST OF HOSTS:

qconf -sh
    domU-12-31-38-01-C2-F0.compute-1.internal   <== MASTER LONG INTERNAL IP
    ip-10-122-194-11.ec2.internal               <== HEADNODE
    master


SOLUTION:

EDIT balancers/sge/__init__.py TO REDUCE THE NUMBER BY 2:

5 PLACES FROM 634 TO 728.


    
</entry>
<entry [Tue 2011:10:11 11:50:38 EST] CHECKED checkBalancers.pl>
    
    root@ip-10-122-194-11:~# tail -f /tmp/loadbalancers.out 
Agua::Common::Balancer::checkBalancers    Common::Balancers::checkBalancers()
Agua::Common::Balancer::checkBalancers    No. active clusterobjects: 1
Agua::Common::Balancer::checkBalancers    pid: 1731
Agua::Common::Balancer::checkBalancers    balancer is running: root      6584  0.0  0.0   4092   584 ?        S    15:50   0:00 sh -c ps aux | grep " 1731 " | grep loadbalancer

Agua::Common::Balancer::setClusterPolled    Agua::Common::Balancer::setClusterPolled(username, cluster)
UPDATE clusterstatus
SET
polled=NOW()
WHERE username='syoung'
AND cluster='syoung-microcluster'
Agua::Common::Balancer::checkBalancers    Checking if cluster NOT is running - if so set status to 'terminated'
Agua::Common::Balancer::checkBalancers    No. remaining clusterobjects: 0
Agua::Common::Balancer::markClustersForTermination    Agua::Common::Balancer::markClustersForTermination(clusterobject)
Agua::Common::Balancer::markClustersForTermination    Checking if cluster is NOT busy - if so set minnodes to zero
Agua::Common::Balancer::checkBalancers    END

Completed /agua/0.6/bin/scripts/checkBalancers.pl
Tue Oct 11 15:50:11 UTC 2011



    
</entry>
<entry [Tue 2011:10:04 09:46:05 EST] CREATED updateHostname.pl STARTUP SCRIPT TO MOUNT /data, SET HOSTNAME, ETC. ON REBOOT>

Init.pm RUNS updateHostname.pl METHOD:

$self->setHostname();

Init.pm ALSO ADDS THE FOLLOWING COMMANDS TO /etc/rc.local:

h#### SET HOSTNAME TO LONG INTERNAL IP AND UPDATE IN CLUSTERS IF CHANGED
/agua/0.6/bin/scripts/updateHostname.pl

#### AUTOMOUNT /data
mount -t ext3 /dev/sdh /data

#### RESTART APACHE
/etc/init.d/apache2 restart



THE updateHostname.pl SCRIPT DOES THE FOLLOWING:

1. SET HOSTNAME TO INTERNAL IP, E.G.:

    hostname ip-10-122-194-11.ec2.internal

2. IF CORRECT HOSTNAME DIFFERS FROM ACTUAL HOSTNAME, UPDATE CORRECT HOSTNAME IN CLUSTERS

    - REMOVE OLD HOSTNAME FROM ADMIN/SUBMIT HOST GROUPS
    
    - ADD NEW HOSTNAME TO ADMIN/SUBMIT HOST GROUPS
    
</entry>
<entry [Mon 2011:10:03 21:56:10 EST] AFTER FIXING HOSTNAME AS IP, PROBLEM PERSISTS STARTING execd AND qstat DOESN'T WORK>

PROBLEM: AFTER SET HOSTNAME TO IP, EXECD DOESN'T WORK AND QSTAT DOESN'T FIND THE RIGHT HOST

Agua::Common::SGE::startExecd    command: export SGE_QMASTER_PORT=36341; export SGE_EXECD_PORT=36342; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/sge_execd

    critical error: abort qmaster registration due to communication errors
    daemonize error: child exited before sending daemonize state


DIAGNOSIS:

CHECKED /tmp ERROR MESSAGES:

em /tmp/execd_messages.1742
    
10/04/2011 01:55:25|  main|10|C|abort qmaster registration due to communication errors
10/04/2011 01:55:27|  main|10|W|daemonize error: child exited before sending daemonize state


CHECKED QMASTER IP:

cat /opt/sge6/syoung-microcluster/common/act_qmaster
    domU-12-31-38-04-7E-D6.compute-1.internal


CONFIRMED THAT MASTER IS LISTENING ON CORRECT NODES:

telnet domU-12-31-38-04-7E-D6.compute-1.internal 36341
    OK
    
telnet domU-12-31-38-04-7E-D6.compute-1.internal 36342
    OK    


QSTAT DOESN'T FIND THE RIGHT HOST:

export SGE_QMASTER_PORT=36341; export SGE_EXECD_PORT=36342; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; qstat
    reresolve hostname failed: can't resolve host name


BUT gethostbyname WORKS USING DNS NAME:


root@domU-12-31-38-04-E2-CE:/opt/sge6/utilbin/lx24-amd64# ./gethostbyname domU-12-31-38-04-7E-D6.compute-1.internal
Hostname: domU-12-31-38-04-7E-D6.compute-1.internal
Aliases:  
Host Address(es): 10.220.125.32 


SO I ADDED MASTER IP AND DNS NAMES TO /etc/hosts:


10.220.125.32 domU-12-31-38-04-7E-D6.compute-1.internal



NOTES
-----

Cristobal says:
March 31, 2010 at 3:50 pm
Chris

i reinstalled with your advices,

im getting this error when doing “qconf -sconf”
reresolve hostname failed: can’t resolve host name

my host name from /bin/hostname is:
ijorge.local

and my file /etc/hosts is the one i mentioned on the last post

reply
blogadmin says:
March 31, 2010 at 3:53 pm
SGE is sensitive to DNS and it looks like it is not set up for your system. One workaround would be to edit /etc/hosts on your system and make an entry for “ijorge.local” that uses the IP that the SGE qmaster is listening too. On most Apple OS X systems I will go out of my way to make sure that /etc/hosts is correct and fully populated in addition to having forward and reverse DNS set up.

-Chris



    
</entry>
<entry [Mon 2011:10:03 17:02:39 EST] FIXED 'error: sge_gethostbyname failed' ERROR>

export SGE_QMASTER_PORT=36341; export SGE_EXECD_PORT=36342; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qstat

    Agua::Common::SGE::qstatFailure    output: error: sge_gethostbyname failed



gethostbyname WORKS WITH IP ADDRESS:

./gethostbyname 10.122.194.11
    Hostname: ip-10-122-194-11.ec2.internal
    Aliases:  
    Host Address(es): 10.122.194.11


BUT gethostbyname DOES NOT WORK WITH DNS NAME:

./gethostbyname domU-12-31-38-04-E2-CE
    error resolving host "domU-12-31-38-04-E2-CE": can't resolve host name (h_errno = HOST_NOT_FOUND)


WHEN SET hostname TO IP ADDRESS, gethostname WORKS:

hostname 10.122.194.11
root@domU-12-31-38-04-E2-CE:/opt/sge6/utilbin/lx24-amd64# ./gethostnameHostname: ip-10-122-194-11.ec2.internal
Aliases:  
Host Address(es): 10.122.194.11 


BUT DOES NOT WORK WHEN SET HOSTNAME TO DNS NAME:

hostname domU-12-31-38-04-E2-CE
./gethostname
    error resolving local host: can't resolve host name (h_errno = HOST_NOT_FOUND)

... EVEN WITH IP AND DNS MATCHING ENTRY IN /etc/hosts:

em /etc/hosts
    ...
    domU-12-31-38-04-E2-CE 10.122.194.11 ip-10-122-194-11.ec2.internal localhost

... gethostname STILL FAILS:

hostname domU-12-31-38-04-E2-CE
./gethostname
    error resolving local host: can't resolve host name (h_errno = HOST_NOT_FOUND)



BUT CHANGING HEADNODE HOSTNAME TO LONG INTERNAL IP DID THE TRICK:

hostname ip-10-122-194-11.ec2.internal
qstat
    OK


... AND ALLOWED ME TO START EXECD:

export SGE_QMASTER_PORT=36341; export SGE_EXECD_PORT=36342; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/sge_execd

    OK
    
CONFIRMED THAT EXECD IS LISTENING ON CORRECT PORT:

netstat -ntulp | grep sge

    tcp        0      0 0.0.0.0:36342           0.0.0.0:*               LISTEN      2152/sge_execd



NB: CHECK /etc/sysconfig/network IF hostname COMMAND NOT WORKING
    
</entry>
<entry [Sun 2011:10:02 02:23:30 EST] ADDED DELETE VOLUMES TO STARCLUSTER PLUGINS on_delete_node>

SIMILAR TO:
    
alias delvols='ec2dvol | grep available | cut -f 2 | xargs -n 1 ec2-delete-volume'

BUT USING THE STORED VOLUME NAMES OF THE NODE:

    GENERATED IN automount.py run AND on_add_node FOR EACH NEW NODE
    
    STORED IN NODE NAMES VS VOLUMES LIST IN $SGE_ROOT/$SGE_CELL/node_volumes, E.G.:
    
    /opt/sge6/syoung-microcluster/node_volumes




    

    
</entry>
<entry [Sat 2011:10:01 22:44:09 EST] FIXED SGE SPOOL DIR PROBLEM>

SUMMARY: EDIT common/configuration FILE execd_spool_dir ENTRY TO POINT TO NEW SGE_CELL

/opt/sge6/syoung-microcluster/common# grep -n default *

bootstrap:8:spooling_params         /opt/sge6/default/common;/opt/sge6/default/spool/qmaster
bootstrap:10:qmaster_spool_dir       /opt/sge6/default/spool/qmaster
configuration:7:execd_spool_dir              /opt/sge6/default/spool
settings.csh:7:setenv SGE_CELL default
settings.sh:7:SGE_CELL=default; export SGE_CELL
sgeexecd:73:SGE_CELL=default; export SGE_CELL
sgemaster:78:SGE_CELL=default; export SGE_CELL


sed 's/\/default/\/syoung-microcluster/' configuration > temp; mv -f temp configuration;


bootstrap:4:default_domain          none
configuration:50:auto_user_default_project    none
qtask:35:# This file contains cell wide defaults which commands are
qtask:54:# overriding of the default redirection for the
sched_configuration:5:algorithm default
sched_configuration:40:default_duration INFINITY
sgeexecd:44:#                   spool directory is in the default location.
sgeexecd:163:# Send SIGTERM (default) or signal $3 to process name $1 with pid in file $2
sge_request:3:# This file contains cell wide default submit options which are
sge_request:5:# these defaults by using the -clear option.
sge_request:56:# Sample #3 assigns a low default submit priority. For higher 


PROBLEM:

AFTER CHANGING TO USING LONG INTERNAL IP FOR MASTER AM UNABLE TO START EXECD AND ALSO GET THIS ERROR IN /tmp:

10/02/2011 02:40:20|  main|domU-12-31-38-04-8A-D3|W|local configuration domU-12\
-31-38-04-8A-D3.compute-1.internal not defined - using global configuration
10/02/2011 02:40:20|  main|domU-12-31-38-04-8A-D3|C|can't create directory "dom\
U-12-31-38-04-8A-D3": No such file or directory


DIAGNOSIS:

SO EXECD IS USING default/spool, NOT syoung-microcluster/spool AS EXPECTED.

THE CLUSTER CONFIGURATION IS IN /opt/sge6/syoung-microcluster/common/configuration:

    # Version: 6.2u5
    #
    # DO NOT MODIFY THIS FILE MANUALLY!
    #
    conf_name                    global
    conf_version                 0
    execd_spool_dir              /opt/sge6/default/spool
    

NB: CHECK FOR ERRORS IN the messages file in the qmaster and the node IN THE execd_spool_dir


SOLUTION:

CHANGED PERMISSIONS ON default/spool:

chmod 777 /opt/sge6/default/spool

/opt/sge6/default# ll
    total 16K
    drwxr-xr-x  4 root root 4.0K 2011-05-02 14:58 .
    drwxr-xr-x 22 root root 4.0K 2011-10-01 16:26 ..
    drwxr-xr-x  4 root root 4.0K 2011-05-02 15:02 common
    drwxrwxrwx  5 root root 4.0K 2011-10-02 02:49 spool


AND COULD START EXECD AS sgeadmin USER:

/opt/sge6/default/spool/domU-12-31-38-04-8A-D3# cat messages 
    10/02/2011 02:49:04|  main|domU-12-31-38-04-8A-D3|W|local configuration domU-12-31-38-04-8A-D3.compute-1.internal not defined - using global configuration
    10/02/2011 02:49:04|  main|domU-12-31-38-04-8A-D3|I|starting up GE 6.2u5 (lx24-amd64)


WHICH CREATED THE domU-12-31-38-04-8A-D3 SPOOL SUBDIR:

/opt/sge6/default/spool# ll
    total 20K
    drwxrwxrwx  5 root     root     4.0K 2011-10-02 02:49 .
    drwxr-xr-x  4 root     root     4.0K 2011-05-02 14:58 ..
    drwxr-xr-x  5 sgeadmin sgeadmin 4.0K 2011-10-02 02:49 domU-12-31-38-04-8A-D3
    drwxrwxrwx  4 root     root     4.0K 2011-05-02 14:58 exec_spool_local
    drwxrwxrwx 20 root     root     4.0K 2011-05-02 14:58 qmaster



NOTES
-----


#mkdir -p /local/sge/spool
#chown -R sgeadmin62:sgeadmin62 /local
#where "/local" is the local spool directory I specified and "sgeadmin62" is the grid engine admin user.
#
#It all starts perfectly now.  Thank you so much for your help.  I hope this solution helps someone else in the future.
#

	#### SET PERMISSIONS TO ALLOW ROOT TO START EXECD WITHOUT THIS ERROR:
	#### 10/01/2011 16:17:36|  main|domU-12-31-38-04-8A-D3|W|local configuration domU-12-31-38-04-8A-D3.compute-1.internal not defined - using global configuration
	#### 10/01/2011 16:17:36|  main|domU-12-31-38-04-8A-D3|C|can't create directory "domU-12-31-38-04-8A-D3": No such file or directory
	#### 
	#### I.E.:
	#### chown sgeadmin:root /opt/sge6/syoung-microcluster/spool
	#### chmod 775 $sgeroot/$cluster/spool




NB: SET SUID ON BINARIES NOT STRICTLY NECESSARY


cd /opt/sge6/bin/lx24-amd64
chown sgeadmin:sgeadmin *
    
    
</entry>
<entry [Fri 2011:09:30 02:33:40 EST] TROUBLESHOOTING sge.py AT CLUSTER START>

FLAWLESS START AND automount.py BUT FAILS AT sge.py:

/data/starcluster/0.92rc2-110929/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config start syoung-microcluster
StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

>>> Using default cluster template: syoung-microcluster
!!! ERROR - Failed to import plugin automount: No module named automount
root@domU-12-31-38-04-E2-CE:~# cd /nethome/admin/.starcluster/plugins
root@domU-12-31-38-04-E2-CE:/nethome/admin/.starcluster/plugins# /data/starcluster/0.92rc2-110929/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config start syoung-microcluster
StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

>>> Using default cluster template: syoung-microcluster
>>> Loaded plugin: automount.NfsShares
>>> Loaded plugin: sge.CreateCell
>>> Validating cluster template settings...
>>> Cluster template settings are valid
>>> Starting cluster...
>>> Launching a 1-node cluster...
>>> Creating security group @sc-syoung-microcluster...
Reservation:r-0240896c
>>> Waiting for cluster to come up... (updating every 30s)
>>> Waiting for all nodes to be in a 'running' state...
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Waiting for SSH to come up on all nodes...
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> The master node is ec2-184-72-140-74.compute-1.amazonaws.com
>>> Setting up the cluster...
>>> Configuring hostnames...
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Creating cluster user: sgeadmin (uid: 1001, gid: 1001)
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring scratch space for user: sgeadmin
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring /etc/hosts on each node
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Configuring NFS...
>>> Setting up NFS took 0.008 mins
>>> Configuring passwordless ssh for root
>>> Configuring passwordless ssh for sgeadmin
>>> Removing previous SGE installation...
>>> Installing Sun Grid Engine...
>>> Creating SGE parallel environment 'orte'
1/1 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Adding parallel environment 'orte' to queue 'all.q'
>>> Shutting down threads...
20/20 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Running plugin automount
>>> Running plugin: automount.NfsShares
>>> automount.NfsShares.getHeadIp    Getting headnode internal IP
>>> automount.NfsShares.getHeadIp    self.head_ip: 10.220.137.29
>>> Setting mountd port on master
portmap start/running, process 232
 * Stopping NFS kernel daemon                                                                                                                                              [ OK ] 
 * Unexporting directories for NFS kernel daemon...                                                                                                                        [ OK ] 
 * Exporting directories for NFS kernel daemon...                                                                                                                          [ OK ] 
 * Starting NFS kernel daemon                                                                                                                                              [ OK ] 
>>> Mounting shared from head node to master
>>> Adding /etc/fstab entry (/agua on master)
>>> Adding /etc/fstab entry (/data on master)
>>> Adding /etc/fstab entry (/nethome on master)
>>> Adding /etc/exports entry (/agua to master)
portmap start/running, process 232
 * Stopping NFS kernel daemon                                                                                                                                              [ OK ] 
 * Unexporting directories for NFS kernel daemon...                                                                                                                        [ OK ] 
 * Exporting directories for NFS kernel daemon...                                                                                                                          [ OK ] 
 * Starting NFS kernel daemon                                                                                                                                              [ OK ] 
>>> Adding /etc/exports entry (/data to master)
portmap start/running, process 232
 * Stopping NFS kernel daemon                                                                                                                                              [ OK ] 
 * Unexporting directories for NFS kernel daemon...                                                                                                                        [ OK ] 
 * Exporting directories for NFS kernel daemon...                                                                                                                          [ OK ] 
 * Starting NFS kernel daemon                                                                                                                                              [ OK ] 
>>> Adding /etc/exports entry (/nethome to master)
portmap start/running, process 232
 * Stopping NFS kernel daemon                                                                                                                                              [ OK ] 
 * Unexporting directories for NFS kernel daemon...                                                                                                                        [ OK ] 
 * Exporting directories for NFS kernel daemon...                                                                                                                          [ OK ] 
 * Starting NFS kernel daemon                                                                                                                                              [ OK ] 
>>> Mounting NFS shares on master
>>> mount -t nfs 10.220.137.29:/agua /agua
>>> Mounting NFS shares on master
>>> mount -t nfs 10.220.137.29:/data /data
>>> Mounting NFS shares on master
>>> mount -t nfs 10.220.137.29:/nethome /nethome
>>> automount.NfsShares.run    Completed
>>> Running plugin sge
>>> Running plugin: sge.CreateCell
>>> CreateCell.run    DEBUG SKIP  self.openSgePorts()
>>> Adding environment variables to /etc/profile
>>> Copying cell directory on head node
>>> Copying cell directory on master
>>> mkdir /opt/sge6/syoung-microcluster &> /dev/null
!!! ERROR - command 'cd /opt/sge6/syoung-microcluster/common; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export SGE_QMASTER_PORT=36341; export SGE_EXECD_PORT=36342; /opt/sge6/util/create_settings.sh /opt/sge6/syoung-microcluster/common' failed with status 2
>>> rsync -a /opt/sge6/default/* /opt/sge6/syoung-microcluster --exclude *tar.gz
>>> chown -R sgeadmin:sgeadmin /opt/sge6/syoung-microcluster
>>> Updating act_qmaster file
>>> sge.CreateCell.editAllhosts    Replacing 'master' with master long internal IP in @allhosts
error: commlib error: got select error (Connection timed out)


    
</entry>
<entry [Fri 2011:09:30 02:30:55 EST] FIXED CLUSTER START STALLED AT 'Waiting for SSH to come up on all nodes...'>

PROBLEM:

START HANGS AT 'Waiting for SSH to come up on all nodes...'

DIAGNOSIS:

KEY PAIR PROBLEM

SOLUTION:

RE-CREATED KEY PAIR USING NEW KEY FILE CONTENTS IN Admin Settings PANEL:
/home/syoung/22-agua/cloud/AWS/keypair/syoung/pk-KTDSDFEV2K3VDW574BC7JK3QOY3EMUZN.pem
/home/syoung/22-agua/cloud/AWS/keypair/syoung/cert-KTDSDFEV2K3VDW574BC7JK3QOY3EMUZN.pem



    
</entry>
<entry [Thu 2011:09:29 00:48:47 EST] STOPPED INSTANCES>

RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f	ec2-107-20-113-160.compute-1.amazonaws.com	domU-12-31-38-04-1A-13.compute-1.internal	running	aquarius2	0		t1.micro	2011-09-27T23:04:30+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	107.20.113.160	10.220.25.221			ebs			paravirtual	
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-09-27T23:05:05.000Z	
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-09-27T23:05:05.000Z	
BLOCKDEVICE	/dev/sdh	vol-141ce07e	2011-09-27T23:05:05.000Z	
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)
RESERVATION	r-e171f88e	728213020069	default
INSTANCE	i-3ba8c35a	ami-76837d1f			stopped	aquarius2	0		t1.micro	2011-09-27T20:51:23+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs					paravirtual	
BLOCKDEVICE	/dev/sdi	vol-d8fa05b2	2011-09-28T05:14:02.000Z	
BLOCKDEVICE	/dev/sdh	vol-622bd108	2011-09-28T05:14:02.000Z	
BLOCKDEVICE	/dev/sda1	vol-dafa05b0	2011-09-28T05:14:02.000Z	
TAG	instance	i-3ba8c35a	name	aquarius-8g-LARGE
TAG	instance	i-3ba8c35a	description	aquarius-8f2 using aquarius2 WITH LARGE INSTANCE to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)
RESERVATION	r-266cab48	728213020069	default
INSTANCE	i-b8e489d8	ami-76837d1f			stopped	aquarius2	0		t1.micro	2011-09-27T14:34:25+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs					paravirtual	
BLOCKDEVICE	/dev/sda1	vol-59155833	2011-09-27T23:05:25.000Z	
BLOCKDEVICE	/dev/sdi	vol-5d155837	2011-09-27T23:05:25.000Z	
BLOCKDEVICE	/dev/sdh	vol-53155839	2011-09-27T23:05:25.000Z	
RESERVATION	r-8e8c41e0	728213020069	@sc-syoung-microcluster
INSTANCE	i-c02b5ea0	ami-ca847aa3	ec2-107-20-99-217.compute-1.amazonaws.com	domU-12-31-38-04-71-E9.compute-1.internal	running	id_rsa-admin-key	0t1.micro	2011-09-28T21:52:56+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	107.20.99.217	10.220.114.23			ebs			paravirtual	
BLOCKDEVICE	/dev/sda1	vol-6d004907	2011-09-28T21:53:17.000Z	
TAG	instance	i-c02b5ea0	alias	master
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ 
syoung@Satellite-L355:~$ ssh root@ec2-107-20-54-36.compute-1.amazonaws.com
ssh: connect to host ec2-107-20-54-36.compute-1.amazonaws.com port 22: Connection timed out
syoung@Satellite-L355:~$ ec2-stop-instances i-b34d25d2 i-c02b5ea0
INSTANCE	i-b34d25d2	running	stopping
INSTANCE	i-c02b5ea0	running	stopping
syoung@Satellite-L355:~$ 

    
</entry>
<entry [Wed 2011:09:28 11:10:33 EST] FIXED STARCLUSTER 'config file does not exist' PROBLEM>
    
PROBLEM:

/data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config start syoung-microcluster

    ...
    ConfigNotFound: config file /root/.starcluster/config does not exist



DIAGNOSIS: OLD INSTALLATION OF STARCLUSTER IS BEING USED BY /usr/bin/starcluster
    
    
SOLUTION: INSTALL STARCLUSTER 0.92rc2 WITH DEVELOP OPTION

cd /data/starcluster/0.92.rc2
python setup.py develop

NOW IT WORKS OKAY:

/data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config start syoung-microcluster

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> 0.92.rc2    commands.start.addopts    utils.config_file: /nethome/admin/.starcluster/syoung-microcluster.config
    >>> Using default cluster template: syoung-microcluster
    !!! ERROR - Not enough settings provided for plugin automount



</entry>
<entry [Tue 2011:09:27 23:42:52 EST] RAN saveDb.pl>

/agua/0.6/bin/scripts/saveDb.pl --db agua --outputdir /agua/0.6/bin/sql/tsv/110928

    
</entry>
<entry [Tue 2011:09:27 19:12:42 EST] ARCHIVED AGUA>

/agua/0.6/bin/scripts/archive.pl \
--name agua \
--basedir /agua/0.6 \
--version 0.6 \
--versionfile bin/scripts/resources/VERSION \
--outputdir /agua

    
</entry>
<entry [Tue 2011:09:27 14:38:41 EST] FIXED POSTFIX ERROR>

SYSLOG:

em syslog   
        /etc/postfix/main.cf: No such file or directory

em mail.log
    Sep 27 05:18:01 domU-12-31-38-04-80-08 postfix/sendmail[26156]: fatal: open /etc/postfix/main.cf: No such file or directory

SOLUTION:

sudo apt-get -V install postfix

OR

sudo apt-get remove postfix
sudo dpkg --purge postfix
sudo apt-get -V install postfix


    
</entry>
<entry [Tue 2011:09:27 10:04:55 EST] CAN'T CONNECT TO HEADNODE AFTER STOP/START THEN FIXIP>
    
    
syoung@Satellite-L355:~$ hn
    ssh: connect to host 107.20.162.29 port 22: Connection refused


LAUNCH IMAGE TO MOUNT

ec2-run-instances \
ami-76837d1f \
-g default \
-k aquarius2 \
--instance-type t1.micro \
-z us-east-1a


ec2din i-b8e489d8
RESERVATION	r-266cab48	728213020069	default
INSTANCE	i-b8e489d8	ami-76837d1f	ec2-50-16-80-159.compute-1.amazonaws.com	domU-12-31-38-07-1E-28.compute-1.internal	running	aquarius2	0	t1.micro	2011-09-27T14:34:25+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.16.80.159	10.223.29.210			ebs		paravirtual	
BLOCKDEVICE	/dev/sda1	vol-59155833	2011-09-27T14:35:03.000Z	
BLOCKDEVICE	/dev/sdi	vol-5d155837	2011-09-27T14:35:03.000Z	
BLOCKDEVICE	/dev/sdh	vol-53155839	2011-09-27T14:35:03.000Z


    i-b8e489d8

ssh root@ec2-50-16-80-159.compute-1.amazonaws.com
    OK

ec2-detach-volume vol-dafa05b0

#### ec2attvol [GENERAL OPTIONS] VOLUME -i INSTANCE -d DEVICE
ec2-attach-volume vol-dafa05b0 -i i-b8e489d8 -d /dev/sdj
ec2dvol vol-dafa05b0
    VOLUME	vol-dafa05b0	15	snap-f7476f98	us-east-1a	in-use	2011-08-08T15:44:21+0000
    ATTACHMENT	vol-dafa05b0	i-b8e489d8	/dev/sdj	attached	2011-09-27T14:58:21+0000


MOUNT ON NEW NODE:

mount /dev/sdj /mnt
 

CHECKED LOGS BUT NOTHING UNUSUAL:


apache2 invoked oom-killer

TRY:

vmstat



fuser -m /mnt
umount /mnt
ec2-detach-volume vol-dafa05b0
ec2-attach-volume vol-dafa05b0 -i i-3ba8c35a -d /dev/sda1



SO RESTARTED SPARE AS THE NEW HEADNODE:

ec2-start-instances i-b34d25d2
    INSTANCE	i-b34d25d2	stopped	pending


AND STOPPED FAULTY HEADNODE:

syoung@Satellite-L355:~$ ec2-stop-instances i-b8e489d8
    INSTANCE	i-b8e489d8	running	stopping



COPIED OLD HEADNODE /data AND SWAPPED INTO NEW HEADNODE /data

vol-53155839 --> snap-c4c518a7



</entry>
<entry [Tue 2011:09:27 00:26:00 EST] FIXED SGE commlib ERROR>


PROBLEM:

CAN'T RESTART SGE DAEMON - FIX SGE stopSgeProcess


APACHE ERROR LOG;


    (Not all processes could be identified, non-owned process info
     will not be shown, you would have to be root to see it all.)
    
    error: communication error for "domU-12-31-38-04-80-08.compute-1.internal/execd/1" running on port 36502: "can't bind socket"
    error: commlib error: can't bind socket (no additional information available)
    critical error: abort qmaster registration due to communication errors
    daemonize error: child exited before sending daemonize state


MANUAL TEST:

work '{"cluster":"syoung-microcluster","project":"BOWTIE","workflow":"alignment","username":"syoung","sessionId":"9999999999.9999.999","mode":"saveClusterWorkflow"}'

    Content-type: text/html
    
    Agua::Common::Cluster::saveClusterWorkflow    Common::saveClusterWorkflow()
    Agua::Common::Cluster::saveClusterWorkflow    username: syoung
    Agua::Common::Cluster::saveClusterWorkflow    project: BOWTIE
    Agua::Common::Cluster::saveClusterWorkflow    workflow: alignment
    Agua::Common::Cluster::saveClusterWorkflow    cluster: syoung-microcluster
    Agua::Common::Cluster::saveClusterWorkflow    oldcluster: syoung-microcluster
    Agua::Common::SGE::stopSgeProcess    pid NOT DEFINED. No running SGE process
    Agua::Common::SGE::stopSgeProcess    pid NOT DEFINED. No running SGE process
    Agua::Common::SGE::startSge    command: export SGE_QMASTER_PORT=36501; export SGE_EXECD_PORT=36502; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/sge_qmaster
    Agua::Common::SGE::startSge    command: export SGE_QMASTER_PORT=36501; export SGE_EXECD_PORT=36502; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-BOWTIE-alignment; export PROJECT=BOWTIE; export WORKFLOW=alignment; /opt/sge6/bin/lx24-amd64/sge_execd
    error: communication error for "domU-12-31-38-04-80-08.compute-1.internal/execd/1" running on port 36502: "can't bind socket"
    error: commlib error: can't bind socket (no additional information available)
    critical error: abort qmaster registration due to communication errors
    daemonize error: child exited before sending daemonize state


    Agua::Common::Cluster::saveClusterWorkflow    queuefile: /nethome/admin/agua/.sge/conf/syoung-BOWTIE-alignment.conf
    Agua::Common::Cluster::saveClusterWorkflow    _removeClusterWorkflow success: 1
    root@domU-12-31-38-04-80-08.compute-1.internal removed "syoung-BOWTIE-alignment" from cluster queue list
    Agua::Common::Cluster::saveQueue    _removeQueue success: 1
    SELECT instancetype
    FROM cluster
    WHERE username='syoung'
    AND cluster='syoung-microcluster'
    No cluster queue or queue instance matches the phrase "syoung-BOWTIE-alignment"
    root@domU-12-31-38-04-80-08.compute-1.internal added "syoung-BOWTIE-alignment" to cluster queue list
    Agua::Common::Cluster::saveQueue    _addQueue success: 1
    { status: 'Added workflow alignment to cluster syoung-microcluster' }




ALSO GOT THIS ERROR (FROM getStatus ?):

error: directory doesn't exist: /opt/sge6//common
error: directory doesn't exist: /opt/sge6//common
error: directory doesn't exist: /opt/sge6//common

    
</entry>
<entry [Tue 2011:09:27 00:24:54 EST] FIX PERMISSIONS ERROR FOR QUEUEFILE>

PROBLEM:
    rm: cannot remove `/nethome/admin/agua/.sge/conf/syoung-BOWTIE-alignment.conf': Permission denied

    www-data@domU-12-31-38-04-80-08.compute-1.internal removed "syoung-BOWTIE-alignment" from cluster queue list
    No cluster queue or queue instance matches the phrase "syoung-BOWTIE-alignment"
    www-data@domU-12-31-38-04-80-08.compute-1.internal added "syoung-BOWTIE-alignment" to cluster queue list


SOLUTION:
chown admin:www-data /nethome/admin/agua/.sge/conf/syoung-BOWTIE-alignment.conf


QUEUE IS CREATED PROPERLY ON NEXT LOAD:

www-data@domU-12-31-38-04-80-08.compute-1.internal removed "syoung-BOWTIE-alignment" from cluster queue list
No cluster queue or queue instance matches the phrase "syoung-BOWTIE-alignment"
www-data@domU-12-31-38-04-80-08.compute-1.internal added "syoung-BOWTIE-alignment" to cluster queue list

    
</entry>
<entry [Mon 2011:09:26 23:37:52 EST] ADD www-data TO MANAGERS LISTS>


PROBLEM: MULTIPLE ERRORS IN APACHE ERROR LOG

tail -f -n 100 /var/log/apache2/error.log
    
    ...
    (Not all processes could be identified, non-owned process info
     will not be shown, you would have to be root to see it all.)
    error: communication error for "domU-12-31-38-04-80-08.compute-1.internal/execd/1" running on port 36502: "can't bind socket"
    [Tue Sep 27 03:28:36 2011] [error] [client 76.110.77.97] File does not exist: /var/www/html/agua/plugins, referer: http://107.20.162.29/agua/0.6/plugins/workflow/css/parameters.css
    error: commlib error: can't bind socket (no additional information available)
    critical error: abort qmaster registration due to communication errors
    daemonize error: child exited before sending daemonize state
    rm: cannot remove `/nethome/admin/agua/.sge/conf/syoung-BOWTIE-alignment.conf': Permission denied
    denied: "www-data" must be manager for this operation
    denied: "www-data" must be manager for this operation


DIAGNOSIS:

WWW-DATA USER DOES NOT HAVE MANAGER PRIVILEGES


SOLUTION:

ADD www-data TO MANAGER LIST:

export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export SGE_QMASTER_PORT=36501; export SGE_EXECD_PORT=36502;

qconf -am www-data
    root@domU-12-31-38-04-80-08.compute-1.internal added "www-data" to manager list




</entry>
<entry [Mon 2011:09:26 23:33:14 EST] FIXED Can't locate PERL MODULE ERROR>
    
PROBLEM:

GET THIS ERROR WHEN RUNNING BOWTIE ALIGNMENT STAGE: Can't locate MooseX/UndefTolerant/Attribute.pm in @INC


export SGE_QMASTER_PORT=36341; export SGE_EXECD_PORT=36342; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qsub  -q syoung-Project1-Workflow1 -V  -l h_rt=24:00:00  /nethome/syoung/agua/Project1/Workflow1//scripts/Project1-1-Workflow1-3.sh


tail -f stdout/BOWTIE-6-alignment-4.err

Can't locate MooseX/UndefTolerant/Attribute.pm in @INC (@INC contains: /agua/0.6-195-aa4143f/bin/apps/aligners/../../../lib/external /agua/0.6-195-aa4143f/bin/apps/aligners/../../../lib /etc/perl /usr/local/lib/perl/5.10.1 /usr/local/share/perl/5.10.1 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10 /usr/local/lib/site_perl .) at /agua/0.6-195-aa4143f/bin/apps/aligners/../../../lib/Aligner/ELAND.pm line 3.
BEGIN failed--compilation aborted at /agua/0.6-195-aa4143f/bin/apps/aligners/../../../lib/Aligner/ELAND.pm line 3.
Compilation failed in require at /agua/0.6/bin/apps/aligners/ELAND.pl line 181.
BEGIN failed--compilation aborted at /agua/0.6/bin/apps/aligners/ELAND.pl line 181.


DIAGNOSIS:

MooseX/UndefTolerant IS INSTALLED IN TWO DIFFERENT PLACES. HERE:

/usr/local/lib/perl/5.10.1

AND HERE:

/usr/local/share/perl/5.10.1


locate MooseX/UndefTolerant
    /usr/local/lib/perl/5.10.1/auto/MooseX/UndefTolerant
    /usr/local/lib/perl/5.10.1/auto/MooseX/UndefTolerant/.packlist
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/ApplicationToClass.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/ApplicationToRole.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Attribute.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Class.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Composite.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Constructor.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Role.pm


SOLUTION:

REMOVE THE INSTALLATION IN /usr/local/lib/perl/5.10.1

mv /usr/local/lib/perl/5.10.1/auto/MooseX /usr/local/lib/perl/5.10.1/auto/MooseX.bkp

DIDN'T WORK SO REVERTED:

mv /usr/local/lib/perl/5.10.1/auto/MooseX.bkp /usr/local/lib/perl/5.10.1/auto/MooseX


AND SET PATH IN BEGIN BUT STILL GOT NOT FOUND IN @INC ERROR WHEN SUBMIT SCRIPT TO QSUB:


/nethome/syoung/agua/Project1/Workflow1/scripts//Project1-1-Workflow1-3.sh

#!/bin/bash

#$ -N Project1-1-Workflow1-3
#$ -o /nethome/syoung/agua/Project1/Workflow1//stdout/Project1-1-Workflow1-3.out
#$ -e /nethome/syoung/agua/Project1/Workflow1//stdout/Project1-1-Workflow1-3.err
#$ -q syoung-Project1-Workflow1
#$ -l h_rt=24:00:00

/usr/bin/perl /agua/0.6/bin/apps/converters/elandIndex.pl --inputdir /nethome/syoung/agua/Project1/Workflow1/downloads --outputdir /nethome/syoung/agua/Project1/Workflow1/eland


    Can't locate MooseX/UndefTolerant/Attribute.pm in @INC (@INC contains: /usr/share/perl/5.10.1 /mnt/agua/0.6-241-d4878b2/bin/apps/converters/../../../lib /etc/perl /usr/local/lib/perl/5.10.1 /usr/local/share/perl/5.10.1 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10 /usr/local/lib/site_perl .) at /mnt/agua/0.6-241-d4878b2/bin/apps/converters/../../../lib/Aligner/ELAND.pm line 3.
    BEGIN failed--compilation aborted at /mnt/agua/0.6-241-d4878b2/bin/apps/converters/../../../lib/Aligner/ELAND.pm line 3.
    Compilation failed in require at /agua/0.6/bin/apps/converters/elandIndex.pl line 61.
    BEGIN failed--compilation aborted at /agua/0.6/bin/apps/converters/elandIndex.pl line 61.



NEXT, CHECKED DIFFERENCE BETWEEN MANUAL ROOT AND www-data PATH:

MANUAL (ROOT)
--- /nethome/syoung/agua/Project1/Workflow1/stdout/Project1-1-Workflow1-3.out.ok-last 

QSUB BY WWW-DATA
+++ /nethome/syoung/agua/Project1/Workflow1/stdout/Project1-1-Workflow1-3.out

-PATH=/tmp/72.1.syoung-Project1-Workflow1:/usr/bin:/agua/bin/apps/logic:/opt/sge6/bin/lx24-amd64/:/opt/sge6/util:/opt/sge6/utilbin/lx24-amd64:/opt/sge6/bin/lx24-amd64:/opt/sge6/utilbin/lx24-amd64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/sge6/bin/lx24-amd64

+PATH=/tmp/73.1.syoung-Project1-Workflow1:/usr/bin:/opt/sge6/bin/lx24-amd64:/agua/bin/apps/logic:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

AND SGE_O_PATH:

-SGE_O_PATH=/usr/bin:/agua/bin/apps/logic:/opt/sge6/bin/lx24-amd64/:/opt/sge6/util:/opt/sge6/utilbin/lx24-amd64:/opt/sge6/bin/lx24-amd64:/opt/sge6/utilbin/lx24-amd64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/sge6/bin/lx24-amd64

+SGE_O_PATH=/usr/bin:/opt/sge6/bin/lx24-amd64:/agua/bin/apps/logic:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games




locate MooseX | grep Undef
    
    /usr/local/lib/perl/5.10.1/auto/MooseX.bkp/UndefTolerant
    /usr/local/lib/perl/5.10.1/auto/MooseX.bkp/UndefTolerant/.packlist
    /usr/local/share/man/man3/MooseX::Types::UndefinedType.3pm
    /usr/local/share/man/man3/MooseX::UndefTolerant.3pm
    /usr/local/share/man/man3/MooseX::UndefTolerant::Attribute.3pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant.pm
    /usr/local/share/perl/5.10.1/MooseX/Types/UndefinedType.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/ApplicationToClass.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/ApplicationToRole.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Attribute.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Class.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Composite.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Constructor.pm
    /usr/local/share/perl/5.10.1/MooseX/UndefTolerant/Role.pm

AFTER MOVE BACK:

mv /usr/local/lib/perl/5.10.1/auto/MooseX.bkp /usr/local/lib/perl/5.10.1/auto/MooseX




    
</entry>
<entry [Mon 2011:09:26 23:33:50 EST] FIXED NO JOB INFO>
    
    
qstat -j 2


    error: commlib error: access denied (client IP resolved to host name "domU-12-31-38-04-94-9D.compute-1.internal". This is not identical to clients host name "master")
    unable to send message to qmaster using port 36501 on host "master": got send error
    unable to send message to qmaster using port 36501 on host "master": got send error



PROBLEM: NO JOB INFO

qstat -j 2

    ...
    scheduling info:            (Collecting of scheduler job information is turned off)


SOLUTION:

MANUAL
export EDITOR=/usr/bin/emacs
qconf -msconf

    schedd_job_info                   true




FIX LATER FOR USE OF PARALLEL ENVIRONMENT:

>> Removing previous SGE installation...
>>> Installing Sun Grid Engine...
!!! ERROR - command 'source /etc/profile && qconf -mattr queue shell "/bin/bash" all.q' failed with status 1
!!! ERROR - command 'source /etc/profile && qconf -Ap /tmp/pe.txt' failed with status 1
!!! ERROR - command 'source /etc/profile && qconf -mattr queue pe_list "orte" all.q' failed with status 1
>>> Shutting down threads...
20/20 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
>>> Running plugin automount
>>> Running plugin: automount.NfsShares
>>> automount.NfsShares.getHeadIp()
>>> automount.NfsShares.getHeadIp    self.head_ip: 10.220.131.246
Client.InvalidPermission.Duplicate: The permission '0.0.0.0/0-1-2049-2049' has already been authorized on the specified group

REMOVED 'source /etc/profile' AND GOT DIFFERENT ERROR:

>>> Configuring NFS...
>>> _setup_nfs took 0.015 mins
>>> Configuring passwordless ssh for root
>>> Configuring passwordless ssh for sgeadmin
>>> Removing previous SGE installation...
>>> Installing Sun Grid Engine...
!!! ERROR - command 'qconf -mattr queue shell "/bin/bash" all.q' failed with status 127
!!! ERROR - command 'qconf -Ap /tmp/pe.txt' failed with status 127
!!! ERROR - command 'qconf -mattr queue pe_list "orte" all.q' failed with status 127
>>> Shutting down threads...
20/2



ERROR ON TERMINATION:

Terminate EBS cluster syoung-microcluster (y/n)? y
>>> Detaching volume vol-c5b7f0af from master
>>> Detaching volume vol-c7b7f0ad from master
>>> Terminating node: master (i-6e30ab0e)
>>> Removing @sc-syoung-microcluster security group
!!! ERROR - InvalidGroup.InUse: There are active instances using security group '@sc-syoung-microcluster'


SOLUTION: USE -c 'CONFIRM' OPTION TO TERMINATE AUTOMATICALLY

terminate -c syoung-microcluster 



Reservation:r-76ba4518
Agua::StarCluster::start    balancer_running: 0
SELECT *
FROM cluster
WHERE username='syoung'
AND cluster='syoung-microcluster'
DBD::mysql::st execute failed: MySQL server has gone away at /agua/0.6-195-aa4143f/cgi-bin/lib/Agua/DBase/MySQL.pm line 377.
DBD::mysql::st execute failed: MySQL server has gone away at /agua/0.6-195-aa4143f/cgi-bin/lib/Agua/DBase/MySQL.pm line 377.
www-data@domU-12-31-38-04-80-08:~/cgi-bin/agua/0.6$ 



</entry>
<entry [Mon 2011:09:26 23:35:28 EST] Can't locate JSON.pm>
    

PROBLEM:

Can't locate JSON.pm in @INC (@INC contains: /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../\
external /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../ /agua/0.6-195-aa4143f/bin/apps/jbro\
wse/../external /agua/0.6-195-aa4143f/bin/apps/jbrowse/../.. /agua/0.6-195-aa4143f/bin/app\
s/jbrowse/../ /agua/0.6-195-aa4143f/bin/apps/jbrowse /agua/0.6-195-aa4143f/bin/apps/jbrows\
e/../../../lib/external /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../../lib /etc/perl /usr\
/local/lib/perl/5.10.1 /usr/local/share/perl/5.10.1 /usr/lib/perl5 /usr/share/perl5 /usr/l\
ib/perl/5.10 /usr/share/perl/5.10 /usr/local/lib/site_perl .) at /agua/0.6-195-aa4143f/bin\
/apps/jbrowse/../../../lib/Agua/Common/Util.pm line 177.
BEGIN failed--compilation aborted at /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../../lib/A\
gua/Common/Util.pm line 177.
Compilation failed in require at /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../../lib/Agua/\
View.pm line 138.
BEGIN failed--compilation aborted at /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../../lib/A\
gua/View.pm line 138.
Compilation failed in require at /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl line 153.
BEGIN failed--compilation aborted at /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl line 15\
3.


DIAGNOSIS:

NOT USING THE UPDATED IMAGE (WITH ALL REQUIRED PERL MODULES INSTALLED)


SOLUTION:

INSTALL THE UPDATED IMAGE (WITH ALL REQUIRED PERL MODULES INSTALLED)


NEW aquarius-8f2
ami-76837d1f

OLD aquarius-8f
ami-9a847af3

    
</entry>
<entry [Mon 2011:09:26 23:35:42 EST] FIXED: GET ACCOUNTING INFO USING SSH COMMAND TO MASTER>


PROBLEM: CAN'T GET qacct TO WORK ON HEADNODE

Type of arg 1 to Agua::View::class must be block or sub {} (not subroutine entry) at /agua\
/0.6-195-aa4143f/bin/apps/jbrowse/../../../lib/Agua/JBrowse.pm line 1348, near "};"
BEGIN not safe after errors--compilation aborted at /agua/0.6-195-aa4143f/bin/apps/jbrowse\
/../../../lib/Agua/JBrowse.pm line 1348.
Compilation failed in require at /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../../lib/Agua/\
View.pm line 140.
BEGIN failed--compilation aborted at /agua/0.6-195-aa4143f/bin/apps/jbrowse/../../../lib/A\
gua/View.pm line 140.
Compilation failed in require at /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl line 153.
BEGIN failed--compilation aborted at /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl line 15\
3.


DIAGNOSIS:

DISCOVERED THAT ACCOUNTING INFO IS NOT ACCESSIBLE ON HEADNODE - MUST USE SSH COMMAND TO MASTER:


qacct -j 73
    
    ==============================================================
    qname        syoung-BOWTIE-alignment
    hostname     domU-12-31-38-04-D8-06.compute-1.internal
    group        root                
    owner        root                
    project      NONE                
    department   defaultdepartment   
    jobname      BOWTIE-6-alignment-1
    jobnumber    73                  
    taskid       undefined
    account      sge                 
    priority     0                   
    qsub_time    Tue Sep 20 02:06:03 2011
    start_time   Tue Sep 20 02:06:09 2011
    end_time     Tue Sep 20 02:06:09 2011
    granted_pe   NONE                
    slots        1                   
    failed       0    
    exit_status  0                   
    ru_wallclock 0            
    ru_utime     0.140        
    ru_stime     0.060        
    ru_maxrss    3544                
    ru_ixrss     0                   
    ru_ismrss    0                   
    ru_idrss     0                   
    ru_isrss     0                   
    ru_minflt    2680                
    ru_majflt    0                   
    ru_nswap     0                   
    ru_inblock   0                   
    ru_oublock   28520               
    ru_msgsnd    0                   
    ru_msgrcv    0                   
    ru_nsignals  0                   
    ru_nvcsw     165                 
    ru_nivcsw    3                   
    cpu          0.200        
    mem          0.000             
    io           0.000             
    iow          0.000             
    maxvmem      0.000


</entry>
