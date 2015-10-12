sge.archive.1

<entry [Wed Apr 30 18:31:26 EDT 2008] PROBLEM RESTARTING SGE AFTER FIXING gemshd3 USING DISK UTILITY ON STARTUP DISC>



q 4
error: commlib error: can't connect to service (Connection refused)
unable to contact qmaster using port 701 on host "gems.rsmas.miami.edu"

Wed Apr 30 18:27:29 EDT 2008
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


CHECK messages FILE IN /common/sge/default/spool/qmaster:

04/30/2008 18:26:39|qmaster|gems|E|couldn't open database environment for server "local spooling", directory "/common/sge/default/spool/spooldb": (-30978) DB_RUNRECOVERY: Fatal error, run database recovery
04/30/2008 18:26:39|qmaster|gems|E|startup of rule "default rule" in context "berkeleydb spooling" failed
04/30/2008 18:26:39|qmaster|gems|C|setup failed

TRIED TO USE /common/bin/db_recover:

gems:/common/bin local$ ./db_recover -c
dyld: lazy symbol binding failed: Symbol not found: _db_version
  Referenced from: /Volumes/gemshd3/common/bin/./db_recover
  Expected in: /common/sge/lib/darwin/libdb-4.2.dylib

dyld: Symbol not found: _db_version
  Referenced from: /Volumes/gemshd3/common/bin/db_recover
  Expected in: /common/sge/lib/darwin/libdb-4.2.dylib

Trace/BPT trap


SO TRIED COPYING /common/sge/lib/darwin/libdb-4.2.dylib TO LOCAL PATH:

cp /common/sge/lib/darwin/libdb-4.2.dylib /common/bin

AND IT WORKED!!

gems:/ local$ sudo /common/bin/db_recover -c
gems:/ local$ sudo SystemStarter restart SGE
error: commlib error: can't connect to service (Connection refused)
ERROR: unable to contact qmaster using port 701 on host "gems.rsmas.miami.edu"
error: commlib error: can't connect to service (Connection refused)
ERROR: unable to contact qmaster using port 701 on host "gems.rsmas.miami.edu"
   Shutting down Grid Engine execution daemon
ls: /gems/active_jobs: No such file or directory
   Shutting down Grid Engine scheduler
   Shutting down Grid Engine qmaster
gems:/ local$ q 4
queuename                      qtype used/tot. load_avg arch          states
----------------------------------------------------------------------------
all.q@gems.rsmas.miami.edu     BIP   0/2       0.04     darwin        
----------------------------------------------------------------------------
all.q@node001.cluster.private  BIP   0/2       0.00     darwin        
----------------------------------------------------------------------------


DIAGNOSIS:

Possibly installation of either Disk Inventory X or SuperDuper caused problems with the libdb-4.2.dylib file. Perhaps another libdb-4.2.dylib file was introduced that lacks the symbol '_db_version' earlier on in the PATH, although it appears not to be the case:

local$ locate libdb-4.2.dylib
/Volumes/gemshd3/common/bin/libdb-4.2.dylib
/Volumes/gemshd3/common/lib/libdb-4.2.dylib
/Volumes/gemshd3/common/sge/lib/darwin/libdb-4.2.dylib
/common.old/lib/libdb-4.2.dylib
/common.old/sge/lib/darwin/libdb-4.2.dylib


SOLUTION:

1) Locate the other libdb-4.2.dylib file and remove it from the PATH.

2) Create a simple script to run /common/bin/db_recover from the /common/bin directory, where it will have first access to the libdb-4.2.dylib file.    


</entry>
<entry [Wed Apr 30 01:25:38 EDT 2008] 'DISC IS FULL' / 'OUT OF SPACE' ERROR ON gemshd3, 'Volume Bit Map needs minor repair' WITH fsck_hfs>



SYMPTOMS
========

GET THIS ERROR WHEN RUNNING arraysetlabeldaemon.pl AND LOADING .TSV FILES INTO MYSQL:

Loading data into table 'setlabel'... Loading file: /common/pipeline/swissprot/collection/swissprot.setlabel.w1.m1.1.tsv
Query failed: Error reading file '/common/pipeline/swissprot/collection/swissprot.setlabel.w1.m1.1.tsv' (Errcode: 28) (2)
DID NOT LOAD!
Loading file: /common/pipeline/swissprot/collection/swissprot.setlabel.w1.m1.2.tsv
Query failed: Error reading file '/common/pipeline/swissprot/collection/swissprot.setlabel.w1.m1.2.tsv' (Errcode: 28) (2)
DID NOT LOAD!


FILES ARE NON-EMPTY:

 ll /common/pipeline/swissprot/collection/swissprot.setlabel.w1.m1.2.tsv
-rw-rw-rw-   1 root  admin    896K Apr 30 21:44 /common/pipeline/swissprot/collection/swissprot.setlabel.w1.m1.2.tsv

BUT GET 'Out of space' ERROR WHEN TRY TO OPEN THE FILE MANUALLY:

emacs -nw /common/pipeline/swissprot/collection/swissprot.setlabel.w1.m1.2.tsv


DIAGNOSIS
=========

'Volume Bit Map' ERROR, WHICH fsck_hfs WON'T FIX WHILE THE DISC IS MOUNTED WITH WRITE ACCESS:

gems:~ local$ sudo fsck_hfs /dev/disk1s3
Password:
** /dev/rdisk1s3
** Root file system
** Checking HFS Plus volume.
** Checking Extents Overflow file.
** Checking Catalog file.
** Checking multi-linked files.
** Checking Catalog hierarchy.
** Checking Extended Attributes file.
** Checking volume bitmap.
   Volume Bit Map needs minor repair
** Checking volume information.
** Cannot repair volume when it is mounted with write access.
** The volume gemshd1 could not be repaired.

NB: ERROR CODE 28 REFERS TO 'Couldn't rd/wr/ctl/sts cause driver not opened'.

SEE OSX ERROR CODES AT http://support.apple.com/kb/HT1618



SOLUTION
========

1. UNMOUNT WITH umount 

gems:/private/var/mysql local$ sudo umount  /dev/disk0s3
umount: unmount(/Volumes/gemshd3): Resource busy
gems:/private/var/mysql local$ sudo umount -f /dev/disk0s3
gems:/private/var/mysql local$ df -a
Filesystem                Size   Used  Avail Capacity  Mounted on
/dev/disk1s3               77G    56G    20G    73%    /
devfs                      99K    99K     0B   100%    /dev
fdesc                     1.0K   1.0K     0B   100%    /dev
< volfs>                   512K   512K     0B   100%    /.vol
/dev/disk2s3               77G    38G    38G    50%    /Volumes/gemshd2
automount -nsl [467]        0B     0B     0B   100%    /Network
automount -fstab [472]      0B     0B     0B   100%    /automount/Servers
automount -static [472]     0B     0B     0B   100%    /automount/static
gems:/private/var/mysql local$ 

2. RUN fsck_hfs -fy:

sudo fsck_hfs -fy /dev/disk0s3
** /dev/rdisk0s3
** Checking HFS Plus volume.
** Checking Extents Overflow file.
** Checking Catalog file.
** Checking multi-linked files.
** Checking Catalog hierarchy.
** Checking Extended Attributes file.
** Checking volume bitmap.
   Volume Bit Map needs minor repair
** Checking volume information.
   Invalid volume free block count
   (It should be 10509328 instead of 10438774)
** Repairing volume.
** Rechecking volume.
** Checking HFS Plus volume.
** Checking Extents Overflow file.
** Checking Catalog file.
** Checking multi-linked files.
** Checking Catalog hierarchy.
** Checking Extended Attributes file.
** Checking volume bitmap.
** Checking volume information.
** The volume gemshd3 was repaired successfully.


3. REMOUNT DISC:

gems:/private/var/mysql local$ sudo mount -t hfs -o nosuid,-w,-m=755 /dev/disk0s3 /Volumes/gemshd3
gems:/private/var/mysql local$ df -a
Filesystem                Size   Used  Avail Capacity  Mounted on
/dev/disk1s3               77G    56G    20G    73%    /
devfs                      99K    99K     0B   100%    /dev
fdesc                     1.0K   1.0K     0B   100%    /dev
< volfs>                   512K   512K     0B   100%    /.vol
/dev/disk2s3               77G    38G    38G    50%    /Volumes/gemshd2
automount -nsl [467]        0B     0B     0B   100%    /Network
automount -fstab [472]      0B     0B     0B   100%    /automount/Servers
automount -static [472]     0B     0B     0B   100%    /automount/static
/dev/disk0s3               77G    36G    40G    48%    /Volumes/gemshd3


NOTES
=====

***FAILED***: FIX WITH fsck -fy

sudo fsck -fy /dev/disk0s3
** /dev/rdisk0s3
BAD SUPER BLOCK: MAGIC NUMBER WRONG

LOOK FOR ALTERNATE SUPERBLOCKS? yes

SEARCH FOR ALTERNATE SUPER-BLOCK FAILED. YOU MUST USE THE
-b OPTION TO FSCK TO SPECIFY THE LOCATION OF AN ALTERNATE
SUPER-BLOCK TO SUPPLY NEEDED INFORMATION; SEE fsck(8).



gems:/private/var/mysql local$ sudo fsck -N /dev/disk0s3
Password:
** /dev/rdisk0s3 (NO WRITE)
BAD SUPER BLOCK: MAGIC NUMBER WRONG

LOOK FOR ALTERNATE SUPERBLOCKS? no



USE newfs TO FIND FREE SUPER-BLOCK BACKUP NUMBERS:


gems:/private/var/mysql local$ newfs
usage: newfs [ -fsoptions ] special-device [device-type]
where fsoptions are:
        -N do not create file system, just print out parameters
        -O create a 4.3BSD format filesystem
        -S sector size
        -T disktype
        -a maximum contiguous blocks
        -b block size
        -c cylinders/group
        -d rotational delay between contiguous blocks
        -e maximum blocks per file in a cylinder group
        -f frag size
        -g average file size
        -h average files per directory
        -i number of bytes per inode
        -k sector 0 skew, per track
        -l hardware sector interleave
        -m minimum free space %
        -n number of distinguished rotational positions
        -o optimization preference (`space' or `time')
        -p spare sectors per track
        -s file system size (sectors)
        -r revolutions/minute
        -t tracks/cylinder
        -u sectors/track
        -v filesystem/volume name
        -x spare sectors per cylinder
gems:/private/var/mysql local$ sudo newfs -N /dev/disk0s3
Warning: Block size and bytes per inode restrict cylinders per group to 5.
Warning: 7306 sector(s) in last cylinder unallocated
disk0s3:        160565174 sectors in 19678 cylinders of 255 tracks, 32 sectors
        78401.0MB in 3936 cyl groups (5 c/g, 19.92MB/g, 4960 i/g)
super-block backups (for fsck -b #) at:
 32, 40864, 81696, 122528, 163360, 204192, 245024, 285856,
 326688, 367520, 408352, 449184, 490016, 530848, 571680, 612512,
 653344, 694176, 735008, 775840, 816672, 857504, 898336, 939168,



***FAILED: SPECIFY SUPER-BLOCK USING -b ARGUMENT OF fsck:

gems:/private/var/mysql local$ sudo fsck -b 32 /dev/disk0s3
Alternate super block location: 32
** /dev/rdisk0s3
BAD SUPER BLOCK: MAGIC NUMBER WRONG
gems:/private/var/mysql local$ sudo fsck -b 40864 /dev/disk0s3
Alternate super block location: 40864
** /dev/rdisk0s3
BAD SUPER BLOCK: MAGIC NUMBER WRONG
gems:/private/var/mysql local$ sudo fsck -b 81696 /dev/disk0s3
Alternate super block location: 81696
** /dev/rdisk0s3
BAD SUPER BLOCK: MAGIC NUMBER WRONG
gems:/private/var/mysql local$ 


</entry>
<entry [Tue Apr 29 03:13:44 EDT 2008] RELOAD MISSING PERL MODULE File::NFSLock>


MODULE MISSING ERROR MESSAGE:

Can't locate File/NFSLock.pm in @INC (@INC contains: ../../ /Users/local/FUNNYBASE/lib /Users/young/FUNNYBASE/lib /RemotePerl/5.8.6/darwin-thread-multi-2level /RemotePerl/5.8.6 /RemotePerl /common/myEST/lib /System/Library/Perl/5.8.6/darwin-thread-multi-


ON gems, COPY FOLDER FROM genomics:

cd ~/FUNNYBASE/dev/plmods
sudo scp -r young@129.171.101.233:~/FUNNYBASE/dev/plmods/File-NFSLock ./


INSTALL:

cd ~/FUNNYBASE/dev/plmods/File-NFSLock/File-NFSLock-1.20
perl Makefile.PL 
make
make test
sudo make install
Installing /Library/Perl/5.8.6/File/NFSLock.pm
Installing /usr/local/man/man3/File::NFSLock.3pm
Writing /Library/Perl/5.8.6/darwin-thread-multi-2level/auto/File/NFSLock/.packlist
Appending installation info to //System/Library/Perl/5.8.6/darwin-thread-multi-2level/perllocal.pod


</entry>
<entry [Tue Apr 29 01:27:43 EDT 2008] IF PING FAILS TRY route -vn get host_ip (CORRECT SETTING FOR gems)>
If ping command waits a few minutes and then reports "100% packet loss", test using 'route -vn get < gateway_ip>':

    route -vn get 129.171.101.100
    u: inet 129.171.101.100; u: link ; RTM_GET: Report Metrics: len 128, pid: 0, seq 1, errno 0, flags:< UP,GATEWAY,HOST,STATIC>
    locks:  inits: 
    sockaddrs: < DST,IFP>
     129.171.101.100 
       route to: 129.171.101.100
    destination: 129.171.101.100
      interface: en0
          flags: < UP,HOST,DONE,LLINFO,WASCLONED>
     recvpipe  sendpipe  ssthresh  rtt,msec    rttvar  hopcount      mtu     expire
           0         0         0         0         0         0      1500      1198 
    
    locks:  inits: 
    sockaddrs: < DST,GATEWAY,IFP,IFA>
     129.171.101.100 0.4.96.1e.15.40 en0:0.d.93.c4.5b.68 129.171.101.233
    
CORRECT SETTING FOR gems:

If the interface it displays isn't 'en1', open System Preferences, Network pane, and set the Show: pulldown to "Network Port Configurations", as shown earlier on this page, and make sure 'en1' is enabled and on the top of the list.


</entry>
<entry [Mon Apr 28 21:52:34 EDT 2008] FIX EXTERNAL NETWORK CONNECTION AND NFS SHARE AFTER MOVING gems>

1. FIXED CONNECTION TO INTERNET

    A) RESET DATA IN System Preferences -> Network -> Show -> Network Status -> Click ethernet card USING INFO IN 'Inquiry Installation and User Guide v1.40', p.17,18
    
    B) *** NOT SURE IF THIS HELPED *** DID MODIFICATION OF 'Open Directory' USING 'Server Admin' TOOL AND INFO IN 'Inquiry Installation and User Guide v1.40', p.25-28

2. RECONFIGURE NFS ON gemshd1 AFTER RESTORE FROM IMAGE BY USING 'NetInfo Manager' TO CHANGE THE niutil CONFIGURATIONS FROM THE NETINFO exports ON gems AFTER RESTORE:

nidump -r /exports .
{
  "name" = ( "exports" );
  CHILDREN = (
    {
      "name" = ( "/Users" );
      "clients" = ( );
      "opts" = ( "maproot=root", "network=192.168.2.0", "mask=255.255.255.0" );
    },
    {
      "name" = ( "/Groups" );
      "clients" = ( );
      "opts" = ( "maproot=root", "network=192.168.2.0", "mask=255.255.255.0" );
    },
    {
      "name" = ( "/common" );
      "clients" = ( );
      "opts" = ( "maproot=root", "network=192.168.2.0", "mask=255.255.255.0" );
    },
    {
      "name" = ( "/Library/Perl" );
      "clients" = ( );
      "opts" = ( "ro", "network=192.168.2.0", "mask=255.255.255.0" );
    },
    {
      "name" = ( "/Library/NetBoot/NetBootSP0" );
      "opts" = ( "ro" );
    }
  )
}


TO SHARING /common AND /Users FROM /Volumes/gemshd3 AND /Volumes/gemshd2:


gems:~ local$ nidump -r /exports .
{
  "name" = ( "exports" );
  CHILDREN = (
    {
      "name" = ( "/Library/Perl" );
      "clients" = ( );
      "opts" = ( "ro", "network=192.168.2.0", "mask=255.255.255.0" );
    },
    {
      "name" = ( "/Library/NetBoot/NetBootSP0" );
      "opts" = ( "ro" );
    },
    {
      "clients" = ( "node001.cluster.private node002.cluster.private node004.cluster.private  node005.cluster.private node006.cluster.private node007.cluster.private node008.cluster.private node009.cluster.private node010.cluster.private node011.cluster.private node012.cluster.private node013.cluster.private node014.cluster.private node015.cluster.private node016.cluster.private " );
      "name" = ( "/Volumes/gemshd2" );
      "opts" = ( "maproot=root", "alldirs" );
    },
    {
      "clients" = ( "129.171.101.233 node001.cluster.private node002.cluster.private node004.cluster.private  node005.cluster.private node006.cluster.private node007.cluster.private node008.cluster.private node009.cluster.private node010.cluster.private node011.cluster.private node012.cluster.private node013.cluster.private node014.cluster.private node015.cluster.private node016.cluster.private " );
      "name" = ( "/Volumes/gemshd3" );
      "opts" = ( "maproot=root", "alldirs" );
    }
  )
}



COULD NOT START NETINFO DOMAINS USING (IN NetInfo Manager): Management -> Restart Local NetInfo Domains (STILL THE SAME MOUNTS):

showmount -e 129.171.101.102
Exports list on 129.171.101.102:
/Users                             192.168.2.0 
/Library/Perl                      192.168.2.0 
/Library/NetBoot/NetBootSP0         Everyone
/Groups                            192.168.2.0 


SO REBOOTED AND IT WORKED!! ALL HOST NODES HAVE THE NFS SHARES: /common AND /Users




NFS MOUNT ON genomics

1. ADDED THESE LINES TO ipfw ON GEMS:
sudo ipfw add 40000 allow ip from 129.171.101.233 to 129.171.101.102
sudo ipfw add 40001 allow ip from 129.171.101.102 to 129.171.101.233

ALSO SET THIS UP AS A SCRIPT IN /usr/bin:

/common/myEST/bin/utils/ipfw.allow.genomics.pl
>>>>
#!/usr/bin/perl

`ipfw add 40000 allow ip from 129.171.101.233 to 129.171.101.102`;
`ipfw add 40001 allow ip from 129.171.101.102 to 129.171.101.233`;

exit;

sudo ln -s /common/myEST/bin/utils/ipfw.allow.genomics.pl /usr/bin/ipfwgems


2. RAN ClusterServices 
sudo /Library/StartupItems/ClusterServices/ClusterServices

young$ sudo /Library/StartupItems/ClusterServices/ClusterServices
Password:
ClusterServices 1.0
HOSTNAME dlc-genomics.rsmas.miami.edu
Using Server gems.rsmas.miami.edu
Mounting Shared Volume
ln: /common: File exists
dlc-genomics:~ young$ 

AND IT WORKED!!

com
dlc-genomics:/common young$ ls
apps      dsh       info      lib       mysql     sbin      share
bin       etc       inquiry   libraries node      scratch   wisecfg
data      include   iprscan   myEST     pipeline  sge
dlc-genomics:/common young$ 



NOTE:

FROM:

    Thu Jan 25 12:38:05 EST 2007
    SETUP NFS MOUNT OF /common ON genomics

1. MAKE SURE portmap IS WORKING IF YOU GET THIS ERROR WHEN RUNNING /Library/StartupItems/ClusterServices/ClusterServices:

    NFS Portmap: RPC: Port mapper failure - RPC: Timed out

sudo /Library/StartupItems/ClusterServices/ClusterServices
>>>
ClusterServices 1.0
HOSTNAME dlc-genomics.rsmas.miami.edu
Using Server gems.rsmas.miami.edu
Mounting Shared Volume
NFS Portmap: RPC: Port mapper failure - RPC: Timed out
NFS Portmap: RPC: Port mapper failure - RPC: Timed out
..

CHECK portmap IS RUNNING WITH rpcinfo -p:

dlc-genomics:/Library/StartupItems/ClusterServices young$ rpcinfo -p
rpcinfo: can't contact portmapper: RPC: Remote system error - Connection refused

IF NOT RUNNING, START portmapper:

portmap

dlc-genomics:/Library/StartupItems/ClusterServices young$ rpcinfo -p   program vers proto   port
    100000    2   tcp    111  portmapper
    100000    2   udp    111  portmapper


2. COPIED THE /Library/StartupItems/ClusterServices DIRECTORY FROM node001 TO genomics

dlc-genomics:/Library/StartupItems/ClusterServices young$ ll
total 32
drwxr-xr-x    6 root  wheel  204B Jan 25 12:31 .
drwxr-xr-x   13 root  wheel  442B Jan 25 12:18 ..
-rwxr-xr-x    1 root  wheel    1K Jan 25 12:31 ClusterServices
-rwxr-xr-x    1 root  wheel    1K Jan 25 12:31 ClusterServices.bkp
-rwxr-xr-x    1 root  wheel    1K Jan 25 12:23 ClusterServices~
-r--r--r--    1 root  wheel  148B Jan 25 12:17 StartupParameters.plist

EDITED ClusterServices TO INCLUDE ONLY gemshd3 EXPORT AND SERVER AS gems.rsmas.miami.edu:

em ClusterServices
>>>
#!/bin/ksh
#
# ClusterServices Startup script
# Performs static NFS mounts.  Replaces AutoFS structure in default iNquiry

VERSION=1.0

. /etc/rc.common

ConsoleMessage "ClusterServices ${VERSION}"
PARTITION=gemshd4
set -A NFS_SERVERS "portal2net"
HOSTNAME=`hostname`
ConsoleMessage "HOSTNAME $HOSTNAME"
HOSTNAME=${HOSTNAME%.cluster.private}
HOSTNAME=${HOSTNAME%.local}
NODE_NUMBER=${HOSTNAME#node}

# SERVER=${NFS_SERVERS[$(( $NODE_NUMBER % ${#NFS_SERVERS[*]} ))]}

SERVER=gems.rsmas.miami.edu
ConsoleMessage "Using Server $SERVER"
# SERVER=nfs002
# ConsoleMessage "Mounting $PARTITION from $SERVER"

#
# Mounts the shared NFS volumes at boot time to avoid the automounter.
#
ConsoleMessage "Mounting Shared Volume"

#### Set up directories for mount of /common
# if [ ! -d /nfs/gemshd2 ]; then mkdir -p /nfs/gemshd2; fi
if [ ! -d /nfs/gemshd3 ]; then mkdir -p /nfs/gemshd3; fi
if [ ! -e /common ]; then ln -s /nfs/gemshd3/common /common; fi

#### Perform the mount, checking to see if it's already mounted.
if [ ! -d /nfs/gemshd3/common ];
  then mount_nfs -i -s $SERVER:/Volumes/gemshd3 /nfs/gemshd3
fi

#################################################
# STUFF BELOW THIS LINE IS NEEDED FOR NODES ONLY
#################################################

# Set up directories for mount of /Users
# if [ ! -e /Users ]; then ln -s /nfs/gemshd2/Users /Users; fi
# if [ ! -e /Groups ]; then ln -s /nfs/gemshd2/Groups /Groups; fi
# Perform the mount, checking to see if it's already mounted.
# if [ ! -d /nfs/gemshd2/Users ];
#   then mount_nfs -i -s $SERVER:/Volumes/gemshd2 /nfs/gemshd2
# fi


# if [ ! -e /RemotePerl ]; then mkdir /RemotePerl; fi
# if [ ! -d /RemotePerl/5.8.6 ];
#   then mount_nfs -i -s $SERVER:/Library/Perl /RemotePerl
# fi

#
# End of ClusterServices Startup script
#
<<<


</entry>
<entry [Mon Apr 28 20:17:01 EDT 2008] Reducing and Eliminating NFS usage by Grid Engine>

The default installation of Grid Engine assumes that the $SGE_ROOT directory is on a shared filesystem accessible by all hosts in the cluster. For a large cluster, this could entail significant NFS traffic. There are various ways to reduce this traffic, including a way to eliminate entirely the requirement that Grid Engine operate using shared files. However, for each alternative, there is a subsequent loss of convenience, and in some cases, functionality. This HOWTO explains how to implement the different alternatives.
Levels of Grid Engine NFS dependencies

Note: color indicates at each level which part of the file structure below is moved out of NFS sharing

SGE_ROOT

    *

      executables, including bin, util, utilbin

    *

      SGE_CELL

          o

            common

          o

            spool


default
=======	

executables, configuration files, spool directories: all shared
	
simple to install
easy to upgrade
easy to debug
	
potentially significant NFS traffic


local spool directories
=======================	

executables, configuration files: shared.

spool directories: local to each compute host

simple to install

easy to upgrade

***significant reduction in NFS traffic
	
less convenient to debug (must go to individual host to see execd messages file)


local executable files
=======================	

configuration files: shared

executables, spool directories: local to each compute host	

***near-elimination of NFS traffic (NOTE: consequences especially seen when running massively parallel jobs across many nodes)
	
less convenient to install and upgrade (must modify files on every host)

less convenient to debug


local configuration files
=========================

executables, configuration files, spool directories: all local to each compute host
	
***elimination of NFS requirement

less convenient to install and upgrade

less convenient to debug

less convenient to change some configuration parameters (must modify files on every host)

loss of shadow master functionality; partial loss of qacct functionality



Local Spool Directories

The spool directory for each execd is the greatest source of NFS traffic for Grid Engine. When jobs are dispatched to an exec host, the job script gets transferred via the commd and then written to the spool directory. Each job gets its own subdirectory, into which additional information is written by both the execd and the job shepherd process. Logfiles are also written into the spool directory, for both the execd as well as the individual jobs.

By configuring local spool directories, all that traffic can be redirected to the local disk on each compute host, thus isolating it from the rest of the network as well as reducing the I/O latency. One disadvantage is that, in order to view the logfiles for a particular job, you need to log onto the system where the job ran, instead of simply looking in the shared directory. But, this would only be necessary for detailed debugging of a job problem.

The path to the spool directory controlled by the parameter execd_spool_dir; it should be set to a directory on the local compute host which is owned by the admin user and which ideally can handle intensive reading/writing (e.g., /var/spool/sge). The execd_spool_dir parameter can be specified when running the install_qmaster script. However, this directory must already existed and be owned by the admin user, or else the script will complain and the execd will not function properly. Alternatively, the execd_spool_dir parameter can be changed in the cluster configuration (man sge_conf); the execds need to be halted before this change can be made. Please make you read sge_conf(5)
Local Executables

In the default setup, all hosts in a cluster read the binary files for daemons and commands off the shared directory. For daemons, this only occurs once, when they start up. When jobs run, other processes are invoked, such as the shepherd and the rshd (for interactive jobs). In a high-throughput cluster, or when invoking a massively-parallel job across many nodes, there is a possibility that many simultaneous NFS read accesses to these other executables could occur. To counter this, you could make all executables be local to the compute hosts.

In this configuration, rather than sharing $SGE_ROOT over NFS to the compute hosts, you would only share $SGE_ROOT/$SGE_CELL/common (you would also implement local spool directories as described above). On each compute host, you would need to install both the "common" and the architecture-specific binary packages. Then, you would mount the shared $SGE_ROOT/$SGE_CELL/common directory before invoking the install_execd script. In order to prevent confusion, make sure that the path to $SGE_ROOT is identical on the master host and compute hosts, e.g., SGE_ROOT=/opt/sge on all hosts.

For submit and admin hosts, you could choose to either install the executables locally, or else mount them from some shared version of $SGE_ROOT, since it is unlikely that NFS traffic on these types of hosts would be a cause for concern in terms of performance.
Local Configuration Files

Although the above two setups describe ways to reduce NFS traffic to almost nil, there might be other reasons why NFS is not desired. For example, the only available version of NFS for your operating environment might not be considered reliable enough for production use. In this case, you can choose not to share the configuration directory $SGE_ROOT/$SGE_CELL/common, but instead have it be local to each compute host. This would result in no files being shared via NFS. However, because you are no longer using a common set of files shared by all systems, there is some functionality which requires some extra effort to use, and other functionality which no longer works.

1) When you modify certain configuration files, the modification would need to be made manually across all hosts in the cluster. These files are located in the $SGE_ROOT/$SGE_CELL/common directory:

    *

      sge_request: default submit request flags; man sge_request(5)
    *

      host_aliases: hostname aliasing; man host_aliases(5)
    *

      sge_aliases: file path aliasing; man sge_aliases(5)
    *

      configuration: most of the information in this file does not need to be used by the exec hosts. However, there are two parameters, ignore_fqdn and default_domain, which are used by the commd on all hosts. If the value of these parameters is changed on the master hosts, then it also needs to be reflected on all exec hosts in the cluster. Normally, these two parameters would be set once, when the master host is installed, and then not changed again. However, in case you experience network problems, you may need to change these and see if it fixes the problem.

2) Another consequence is that the qacct command will only work if executed on the master host. This is because the accounting file, where all historical information is stored, is only updated on the master host. Because qacct will by default read information from the file $SGE_ROOT/$SGE_CELL/common/accounting, it will only be accurate on the master host. qacct can be directed to read information from any file, using the -f flag, so one alternative is to manually copy the accounting file periodically to another system, where the analysis can take place.

3) Finally, if you do not share the $SGE_ROOT/$SGE_CELL/common directory, you cannot use the Shadow Master facility. The Shadow Master feature relies upon a shared filesystem to keep track of the active master, so without NFS, Shadow Mastering does not work.

To install with this type of setup, proceed as follows:

   1.

      unpack/untar the Grid Engine distribution on each system (common and architecture-specific packages) to the same pathname on each system
   2.

      install the master host completely
   3.

      modify all the configuration files mentioned above to suit the requirements of your site
   4.

      on the master hosts make an archive of the directory $SGE_ROOT/$SGE_CELL/common
   5.

      on each exec host, unpack the archive created above
   6.

      on each exec host, run the install_execd script. It should automatically read in the configurations from the directory which was unpacked.

Other Considerations

Even though Sun Grid Engine can function perfectly well without NFS (except the noted functionality), there are other considerations which might lead to unexpected behavior.
Home directories

Unless otherwise specified, Grid Engine runs jobs in the user's home directory. If this is not shared, then whatever files are created will be placed in the home directory on the host where the job is executed. Also, any configuration given in dot-files, such as .cshrc and .sge_requests, will be read out of the home directory on the host where the job is executed . Finally, if the home directory of the user actually does not exist on the compute host, the job will go into an error state. You need to make sure that for every user, and on every compute host, a home directory is present and contains all the desired dot-file configurations. Also, for jobs run with the -cwd flag, the current path will be recorded, and when the job executes on the compute host, unless the exact same path is accessible to the user running the job, the job will go into an error state.
Application and data files

Obviously, without NFS there needs to be a way to stage data files in and out, and the application files (binaries, libraries, config files, databases, etc.) would also need to be either already present on each compute host or also staged in. The prolog and epilog script feature of Grid Engine provides a generic mechanism for implementing a site-specific stage-in/stage-out facility. Alternatively, these steps could be embedded into jobs scripts directly.
User virtualization

If application availability and data file staging were accounted for, one could in principle run Grid Engine without NFS over a WAN. However, part of the Grid Engine built-in authentication is that the username of the user submitting a job must be recognized on the compute host where the job runs. If running across administrative domains, the username might not exist on the target exec host. In this case, some of the solutions include:

    *

      allow users to log in as a common "grid user" (the -A submit flag could be used to distinguish the actual identity of the user).
    *

      using a SUID wrapper to submit and administrative commands to do the same thing transparently



Sun Microsystems Logo
	

By any use of this Website, you agree to be bound by these Policies and Terms of Use.
Copyright © 1995-2006 Sun Microsystems, Inc.
	CollabNet Logo


</entry>



<entry [Thu Apr 17 15:59:36 EDT 2008] REPAIRING NODES node001, node002, node007, node010, node013, node016 ON CLUSTER - AFTER MIRROR, FIX MYSQL AND HOST NAME SO CAN RESTART SGE>



1. FIX HOST NAME
===============

node002:~ vanwye$ sudo changeip - 192.168.2.7 192.168.2.7 node002 node007
Password:

DNS lookup shows name 'node007.cluster.private' for 192.168.2.7, which does not match 'node007'

Do you want to use 'node007.cluster.private' instead? (y/N) y
Updating local node
Updating Password Server config
Updating Open Directory config
Updating hostconfig file
Updating smb.conf file
Updating Kerberos Service Principals and keytabs
klist: No such file or directory while starting scan of keytab (null)
Finished updating Kerberos
Changing IP Addresses and host names for iChat Server
Changing IP Addresses and host names for Mail Server


2. COPY /private/var/mysql/mysql FOLDER AND SET PERMISSIONS:
============================================================

CREATE /private/var/mysql FOLDER IF DOESN'T EXIST:
sudo mkdir /private/var/mysql
sudo chmod 775 /private/var/mysql


FOR ALL NODES (node002,node004,node005,...,node016) INDIVIDUALLY, DO:
nodeXXX
# <password>
sudo scp -r local@129.171.101.102:~/mysql /private/var/mysql
# <node password>
# <gems password>


SET PERMISSIONS AND START MYSQL:

sudo chown -R mysql:wheel /private/var/mysql
sudo mysqld_safe &
ps aux | grep mysql

root      3221   0.0  0.1    27808    708  p0  S     1:30PM   0:00.04 /bin/sh /usr/bin/mysqld_safe
mysql     3259   0.0  5.4   479340  56320  p0  S     1:30PM   0:00.20 /usr/libexec/mysqld --basedir=/usr --datadir=/var/mysql --user=m
vanwye    3263   0.0  0.0    18048    228  p0  R+    1:30PM   0:00.00 grep mysql

OK!!!


NB: WHERE mysql FOLDER CONTAINS THE FOLLOWING:


gems:~ local$ ll mysql/
total 968
drwx------   47 local  wheel      1K Mar 13  2007 .
drwxr-xr-x   45 local  admin      1K Apr 17 15:49 ..
-rw-r-----    1 local  wheel      0B Mar 13  2007 columns_priv.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 columns_priv.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 columns_priv.frm
-rw-r-----    1 local  wheel      2K Mar 13  2007 db.MYD
-rw-r-----    1 local  wheel      4K Mar 13  2007 db.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 db.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 func.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 func.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 func.frm
-rw-r-----    1 local  wheel    864B Mar 13  2007 help_category.MYD
-rw-r-----    1 local  wheel      3K Mar 13  2007 help_category.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 help_category.frm
-rw-r-----    1 local  wheel      6K Mar 13  2007 help_keyword.MYD
-rw-r-----    1 local  wheel     11K Mar 13  2007 help_keyword.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 help_keyword.frm
-rw-r-----    1 local  wheel      4K Mar 13  2007 help_relation.MYD
-rw-r-----    1 local  wheel      9K Mar 13  2007 help_relation.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 help_relation.frm
-rw-r-----    1 local  wheel    184K Mar 13  2007 help_topic.MYD
-rw-r-----    1 local  wheel     15K Mar 13  2007 help_topic.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 help_topic.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 host.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 host.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 host.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 tables_priv.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 tables_priv.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 tables_priv.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone_leap_second.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone_leap_second.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone_leap_second.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone_name.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone_name.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone_name.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone_transition.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone_transition.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone_transition.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone_transition_type.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone_transition_type.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone_transition_type.frm
-rw-r-----    1 local  wheel   1016B Mar 13  2007 user.MYD
-rw-r-----    1 local  wheel      2K Mar 13  2007 user.MYI
-rw-r-----    1 local  wheel      9K Mar 13  2007 user.frm



</entry>



<entry [Wed Feb 20 14:15:57 EST 2008] AFTER POWER CYCLE OF genomics STILL CAN'T RUN BLAST BUT AFTER Disk Utility 'Repair Permissions' CAN BLAST AGAINST unigene-mouse BUT NOT swissprot>



After power cycle:

dlc-genomics:~ young$ sudo /common/apps/wublast/wu-blastall -p blastn -d /common/data/unigene-mouse -i /common/pipeline/unigene/blast/unigene.1.fasta -o /common/pipeline/unigene/blast/unigene-unigene-mouse.1.blast
nfs server gems.rsmas.miami.edu:/Volumes/gemshd3: not responding

FATAL:  Bus Error signal received.

Disk Utility --> Repair Permissions


dlc-genomics:~ young$ sudo /common/apps/wublast/wu-blastall -p blastn -d /common/data/unigene-mouse -i /common/pipeline/unigene/blast/unigene.1.fasta -o /common/pipeline/unigene/blast/unigene-unigene-mouse.1.blast
Password:
dlc-genomics:~ young$ ll /common/pipeline/unigene/blast/unigene-unigene-mouse.1.blast
-rw-r--r--   1 root  admin    15K Feb 20 13:30 /common/pipeline/unigene/blast/unigene-unigene-mouse.1.blast
dlc-genomics:~ young$ em /common/pipeline/unigene/blast/unigene-unigene-mouse.1.blast

BLASTN 2.0MP-WashU [10-May-2005] [macosx-10.2-ppc-ILP32F64 2005-05-10T20:04:03]

Copyright (C) 1996-2005 Washington University, Saint Louis, Missouri USA.
All Rights Reserved.

Reference:  Gish, W. (1996-2005) http://blast.wustl.edu

Notice:  this program and its default parameter settings are optimized to find
nearly identical sequences rapidly.  To identify weak protein similarities
encoded in nucleic acid, use BLASTX, TBLASTN or TBLASTX.

Query=  unigene.1
        (1248 letters)

Database:  /common/data/unigene-mouse
           64,632 sequences; 93,593,937 total letters.
Searching....10....20....30....40....50....60....70....80....90....100% done

                                                                     Smallest
                                                              High  Probability
Sequences producing High-scoring Segment Pairs:              Score  P(N)      N

AB041566 7670396|unigene-mouse|Mus musculus brain cDNA         127  2.1e-65   1
AK122421 28972573|unigene-mouse|Mus musculus mRNA for mKI...    20  0.16      1
XM_975192 94366301|unigene-mouse|PREDICTED: Mus musculus ...    20  0.16      1
NM_145998 110625930|unigene-mouse|Mus musculus H6 homeo b...    19  0.50      1
...<<<


But still can't do BLAST against Swissprot

dlc-genomics:~ young$ sudo /common/apps/wublast/wu-blastall -p blastx -d /common/data/swissprot -i /common/pipeline/unigene/blast/unigene.1.fasta -o /common/pipeline/unigene/blast/unigene-swissprot.1.blast
nfs server gems.rsmas.miami.edu:/Volumes/gemshd3: not responding


After Disk Utility --> Verify Permissions don't get an error message but Swissprot BLAST doesn't run:

dlc-genomics:~ young$ sudo /common/apps/wublast/wu-blastall -p blastx -d /common/data/swissprot -i /common/pipeline/unigene/blast/unigene.1.fasta -o /common/pipeline/unigene/blast/unigene-swissprot.1.blast
dlc-genomics:~ young$ ll /common/pipeline/unigene/blast/unigene-swissprot.1.blast
-rw-r--r--   1 root  admin     989K Feb 20 00:37 /common/pipeline/unigene/blast/unigene-swissprot.1.blast
dlc-genomics:~ young$ date
Wed Feb 20 14:21:35 EST 2008

dlc-genomics:~ young$ em /common/pipeline/unigene/blast/unigene-swissprot.1.blast

[2]+  Stopped                 emacs -nw /common/pipeline/unigene/blast/unigene-swissprot.1.blast
dlc-genomics:~ young$ sudo /common/apps/wublast/wu-blastall -p blastx -d /common/data/swissprot -i /common/pipeline/unigene/blast/unigene.1.fasta                                                            
dlc-genomics:~ young$ sudo /common/apps/wublast/wu-blastall -p blastn -d /common/data/unigene-mouse -i /common/pipeline/unigene/blast/unigene.1.fasta                                                                

sudo /common/apps/wublast/wu-blastall -p blastx -d /common/data/swissprot -i /common/pipeline/unigene/blast/unigene.1.fasta


After 'Disk Utility --> Repair Disk' on all 3 hard discs and 'Disk Utility --> Repair Permissions' on gemshd1 and gemshd3 (gemshd2 did not provide the option) using Restart Disc and powercycle on both gems and genomics, still can't do BLAST against Swissprot but can BLAST against mouse UniGene:

CAN'T BLAST AGAINST SWISSPROT:

dlc-genomics:~ young$ sudo /common/apps/wublast/wu-blastall -p blastx -d /common/data/swissprot -i /common/pipeline/unigene/blast/unigene.1.fasta
nfs server gems.rsmas.miami.edu:/Volumes/gemshd3: not responding
dlc-genomics:~ young$ 

CAN BLAST AGAINST UNIGENE-MOUSE:

dlc-genomics:~ young$ sudo /common/apps/wublast/wu-blastall -p blastn -d /common/data/unigene-mouse -i /common/pipeline/unigene/blast/unigene.1.fasta
Password:

BLASTN 2.0MP-WashU [10-May-2005] [macosx-10.2-ppc-ILP32F64 2005-05-10T20:04:03]

Copyright (C) 1996-2005 Washington University, Saint Louis, Missouri USA.
All Rights Reserved.

Reference:  Gish, W. (1996-2005) http://blast.wustl.edu

Notice:  this program and its default parameter settings are optimized to find
nearly identical sequences rapidly.  To identify weak protein similarities
encoded in nucleic acid, use BLASTX, TBLASTN or TBLASTX.

Query=  unigene.1
        (1248 letters)

Database:  /common/data/unigene-mouse
           64,632 sequences; 93,593,937 total letters.
Searching....10....20....30....40....50....60....70....80....90....100% done

                                                                     Smallest
                                                              High  Probability
Sequences producing High-scoring Segment Pairs:              Score  P(N)      N

AB041566 7670396|unigene-mouse|Mus musculus brain cDNA         127  2.1e-65   1
AK122421 28972573|unigene-mouse|Mus musculus mRNA for mKI...    20  0.16      1
XM_975192 94366301|unigene-mouse|PREDICTED: Mus musculus ...    20  0.16      1
...

</entry>



<entry [Tue Feb 19 11:18:28 EST 2008] Illegal instruction (cont.)>



dlc-genomics:~ root# sudo qsub
nfs server gems.rsmas.miami.edu:/Volumes/gemshd3: not responding
Bus error
dlc-genomics:~ root# /common/sge/bin/darwin/qhost
nfs server gems.rsmas.miami.edu:/Volumes/gemshd3: not responding
Bus error
dlc-genomics:~ root# /common/sge/bin/darwin/qacct
nfs server gems.rsmas.miami.edu:/Volumes/gemshd3: not responding
Bus error



ALSO GET THIS ERROR WHEN I TRY TO RUN BLAST ON /common (I.E., /Volumes/gemshd3 )

Could not open the database "/common/data/swissprot"


sudo /common/apps/wublast/wu-blastall -p tblastx -d /common/data/swissprot -i /common/pipeline/unigene/blast/unigene.1.fasta -o /common/pipeline/unigene/blast/unigene.1.blast

FATAL:  Could not open the database "/common/data/swissprot".  Please check
        its spelling, the file access permissions, the setting of the
        WUBLASTDB (or BLASTDB) environment variable, and that the database has
        been processed with "xdformat" or another supported BLAST database
        formatting program.

EXIT CODE 18


dlc-genomics:~ root# ll /common/pipeline/unigene/blast/unigene.1*
-rw-r--r--   1 local  admin  859B Feb 19 11:22 /common/pipeline/unigene/blast/unigene.1.blast
-rw-r--r--   1 local  admin    1K Feb 19 01:26 /common/pipeline/unigene/blast/unigene.1.fasta
dlc-genomics:~ root# 



sudo /common/apps/wublast/wu-blastall -p tblastx -d /common/data/swissprot -i /common/pipeline/unigene/blast/unigene.1.fasta -o /common/pipeline/unigene/blast/unigene.1.blast



dlc-genomics:~ young$ local
Last login: Tue Feb 19 01:32:39 2008 from dlc-genomics.rs
Welcome to Darwin!
gems:~ local$ ls /
Applications Developer    Shared Items automount    common       etc          mach.sym     private      usr
DamagedFiles Groups       System       bin          common.old   formatdb.log mach_kernel  sbin         var
Desktop DB   Library      Users        collection   cores        lost+found   nfs          scratch
Desktop DF   Network      Volumes      collections  dev          mach         opt          tmp
gems:~ local$ cd comm
-bash: cd: comm: No such file or directory
gems:~ local$ showmount -e
Exports list on localhost:
/Library/Perl                      192.168.2.0 
/Volumes/gemshd2                   node001.cluster.private node002.cluster.private node003.cluster.private node004.cluster.private node005.cluster.private node006.cluster.private node007.cluster.private node008.cluster.private node009.cluster.private node010.cluster.private node011.cluster.private node012.cluster.private node013.cluster.private node014.cluster.private node015.cluster.private node016.cluster.private 
/Volumes/gemshd3                   129.171.101.233 node001.cluster.private node002.cluster.private node003.cluster.private node004.cluster.private node005.cluster.private node006.cluster.private node007.cluster.private node008.cluster.private node009.cluster.private node010.cluster.private node011.cluster.private node012.cluster.private node013.cluster.private node014.cluster.private node015.cluster.private node016.cluster.private 
gems:~ local$ cd /Volumes/gemshd3/
gems:/Volumes/gemshd3 local$ ls
#disc.usage.txt# Library          Users            common           mach             sbin
Applications     Network          Volumes          cores            mach.sym         tmp
Desktop DB       Notes            automount        disc.usage.txt   mach_kernel      usr
Desktop DF       Shared Items     bin              etc              opt              var
Groups           System           bin (Mac OS 9)   lib              private
gems:/Volumes/gemshd3 local$ ll
total 11800
-rw-r--r--    1 local  admin     237B Dec 18  2006 #disc.usage.txt#
drwxrwxr-t   39 root   admin       1K Feb 13 01:46 .
drwxrwxrwt    5 root   admin     170B Feb 15 22:22 ..
-rw-r--r--    1 root   admin       6K Oct 24  2005 .DS_Store
drw-------   18 root   admin     612B Feb 14 16:28 .Spotlight-V100
drwxrwxrwt    3 508    admin     102B Jul  6  2007 .TemporaryItems
d-wx-wx-wt    2 root   admin      68B Feb 15 22:25 .Trashes
-rwxrwxrwx    1 508    admin      82B Jul  6  2007 ._.TemporaryItems
-rw-------    1 root   wheel       1M Jul  7  2006 .hotfiles.btree
-rw-------    1 root   admin       1K Jan 19  2007 .rnd
dr-xr-xr-x    2 root   wheel      68B Jul 31  2006 .vol
drwxrwxr-x   30 root   admin    1020B Jan 19  2007 Applications
-rw-r--r--    1 root   admin       8K Dec 12 00:05 Desktop DB
-rw-r--r--    1 root   admin       4K Jan 11  2007 Desktop DF
drwxrwxr-x    3 local  admin     102B Jan 19  2007 Groups
drwxrwxr-t   48 root   admin       1K Jan 19  2007 Library
drwxr-xr-x    5 root   wheel     170B Aug 22  2005 Network
drwxr-xr-x   40 local  admin       1K Jan 19  2007 Notes
drwxrwxr-x    4 local  admin     136B Jan 19  2007 Shared Items
drwxr-xr-x    4 root   wheel     136B Jan 19  2007 System
drwxrwxr-t    5 root   admin     170B Jan 19  2007 Users
drwxrwxrwt    5 root   admin     170B Jan 19  2007 Volumes
drwxr-xr-x    4 root   admin     136B Jan 19  2007 automount
drwxr-xr-x   40 root   wheel       1K Oct 22  2005 bin
drwxr-xr-x   42 local  admin       1K Dec 18  2006 bin (Mac OS 9)
drwxr-xr-x   23 www    admin     782B Oct 21 17:21 common
drwxrwxr-t    2 root   admin      68B Aug 22  2005 cores
-rw-r--r--    1 local  admin     304B Jan 12  2007 disc.usage.txt
lrwxr-xr-x    1 root   admin      11B Jan 19  2007 etc -> private/etc
drwxr-xr-x   32 local  local       1K Nov 26  2006 lib
lrwxr-xr-x    1 root   admin       9B Jan 19  2007 mach -> /mach.sym
-r--r--r--    1 root   admin     584K Jan 19  2007 mach.sym
-rw-r--r--    1 root   wheel       4M Oct  3  2005 mach_kernel
drwxr-xr-x    3 root   wheel     102B Oct 19  2005 opt
drwxr-xr-x    6 root   wheel     204B Jan 19  2007 private
drwxr-xr-x   63 root   wheel       2K Jan 19  2007 sbin
lrwxr-xr-x    1 root   admin      11B Jan 19  2007 tmp -> private/tmp
drwxr-xr-x    9 root   wheel     306B Jan 19  2007 usr
lrwxr-xr-x    1 root   admin      11B Jan 19  2007 var -> private/var
gems:/Volumes/gemshd3 local$ cd / 
gems:/ local$ ll
total 9923
drwxrwxr-t   39 root   admin       1K Feb 15 22:21 .
drwxrwxr-t   39 root   admin       1K Feb 15 22:21 ..
-rwxrwxrwx    1 local  staff       6K Jan  4 19:23 .DS_Store
drwxrwxrwt    2 local  admin      68B Feb 15 22:25 .Trashes
-rw-------    1 root   wheel      64K Jul 21  2006 .hotfiles.btree
-rw-------    1 root   admin       1K Jul 21  2006 .rnd
dr-xr-xr-x    2 root   wheel     160B Feb 15 22:21 .vol
drwxrwxr-x   35 root   admin       1K Dec 11 14:09 Applications
drwxrwxrwt    4 root   wheel     136B Feb 15 22:15 DamagedFiles
-rw-r--r--    1 root   admin       8K Dec 12 00:05 Desktop DB
-rw-r--r--    1 root   admin       2B Jul 21  2006 Desktop DF
drwxrwxr-x   14 root   admin     476B Jul 21  2006 Developer
drwxrwxr-x    3 local  admin     102B Jul 21  2006 Groups
drwxrwxr-t   51 root   admin       1K Dec 13 16:56 Library
drwxr-xr-x    1 root   wheel     512B Feb 15 22:22 Network
drwxrwxr-x    5 local  admin     170B Jan 21  2007 Shared Items
drwxr-xr-x    4 root   wheel     136B Dec 11 14:13 System
lrwxr-xr-x    1 root   admin      22B Jan 21  2007 Users -> /Volumes/gemshd2/Users
drwxrwxrwt    5 root   admin     170B Feb 15 22:22 Volumes
drwxr-xr-x    4 root   admin     136B Jan 19  2007 automount
drwxr-xr-x   40 root   wheel       1K Dec 11 14:08 bin
drwxrwxrwx    3 root   admin     102B Jan 16 16:37 collection
drwxr-xr-x    3 www    admin     102B Feb  6  2007 collections
lrwxr-xr-x    1 root   admin      23B Jan 21  2007 common -> /Volumes/gemshd3/common
drwxr-xr-x   27 root   admin     918B Jul 25  2006 common.old
drwxrwxrwt    2 root   wheel      68B Jul 31  2006 cores
dr-xr-xr-x    2 root   wheel     512B Feb 15 22:21 dev
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 etc -> private/etc
-rw-r--r--    1 root   admin       1K Jul 25  2006 formatdb.log
drwxrwxrwt    3 root   wheel     102B Feb 15 22:15 lost+found
lrwxr-xr-x    1 root   admin       9B Feb 15 22:21 mach -> /mach.sym
-r--r--r--    1 root   admin     590K Feb 15 22:21 mach.sym
-rw-r--r--    1 root   wheel       4M Oct 10 21:26 mach_kernel
drwxr-xr-x    3 root   admin     102B Oct  3 00:15 nfs
drwxr-xr-x    3 root   wheel     102B Oct 19  2005 opt
drwxr-xr-x    8 root   wheel     272B Feb 15 22:21 private
drwxr-xr-x   63 root   wheel       2K Dec 11 14:08 sbin
drwxrwxrwx    2 root   admin      68B Jul 21  2006 scratch
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 tmp -> private/tmp
drwxr-xr-x   11 root   wheel     374B Jul 21  2006 usr
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 var -> private/var
gems:/ local$ ll
total 9923
drwxrwxr-t   39 root   admin       1K Feb 15 22:21 .
drwxrwxr-t   39 root   admin       1K Feb 15 22:21 ..
-rwxrwxrwx    1 local  staff       6K Jan  4 19:23 .DS_Store
drwxrwxrwt    2 local  admin      68B Feb 15 22:25 .Trashes
-rw-------    1 root   wheel      64K Jul 21  2006 .hotfiles.btree
-rw-------    1 root   admin       1K Jul 21  2006 .rnd
dr-xr-xr-x    2 root   wheel     160B Feb 15 22:21 .vol
drwxrwxr-x   35 root   admin       1K Dec 11 14:09 Applications
drwxrwxrwt    4 root   wheel     136B Feb 15 22:15 DamagedFiles
-rw-r--r--    1 root   admin       8K Dec 12 00:05 Desktop DB
-rw-r--r--    1 root   admin       2B Jul 21  2006 Desktop DF
drwxrwxr-x   14 root   admin     476B Jul 21  2006 Developer
drwxrwxr-x    3 local  admin     102B Jul 21  2006 Groups
drwxrwxr-t   51 root   admin       1K Dec 13 16:56 Library
drwxr-xr-x    1 root   wheel     512B Feb 15 22:22 Network
drwxrwxr-x    5 local  admin     170B Jan 21  2007 Shared Items
drwxr-xr-x    4 root   wheel     136B Dec 11 14:13 System
lrwxr-xr-x    1 root   admin      22B Jan 21  2007 Users -> /Volumes/gemshd2/Users
drwxrwxrwt    5 root   admin     170B Feb 15 22:22 Volumes
drwxr-xr-x    4 root   admin     136B Jan 19  2007 automount
drwxr-xr-x   40 root   wheel       1K Dec 11 14:08 bin
drwxrwxrwx    3 root   admin     102B Jan 16 16:37 collection
drwxr-xr-x    3 www    admin     102B Feb  6  2007 collections
lrwxr-xr-x    1 root   admin      23B Jan 21  2007 common -> /Volumes/gemshd3/common
drwxr-xr-x   27 root   admin     918B Jul 25  2006 common.old
drwxrwxrwt    2 root   wheel      68B Jul 31  2006 cores
dr-xr-xr-x    2 root   wheel     512B Feb 15 22:21 dev
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 etc -> private/etc
-rw-r--r--    1 root   admin       1K Jul 25  2006 formatdb.log
drwxrwxrwt    3 root   wheel     102B Feb 15 22:15 lost+found
lrwxr-xr-x    1 root   admin       9B Feb 15 22:21 mach -> /mach.sym
-r--r--r--    1 root   admin     590K Feb 15 22:21 mach.sym
-rw-r--r--    1 root   wheel       4M Oct 10 21:26 mach_kernel
drwxr-xr-x    3 root   admin     102B Oct  3 00:15 nfs
drwxr-xr-x    3 root   wheel     102B Oct 19  2005 opt
drwxr-xr-x    8 root   wheel     272B Feb 15 22:21 private
drwxr-xr-x   63 root   wheel       2K Dec 11 14:08 sbin
drwxrwxrwx    2 root   admin      68B Jul 21  2006 scratch
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 tmp -> private/tmp
drwxr-xr-x   11 root   wheel     374B Jul 21  2006 usr
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 var -> private/var
gems:/ local$ cd 
gems:~ local$ cd /
gems:/ local$ cd common
-bash: cd: common: No such file or directory
gems:/ local$ ll 
total 9923
drwxrwxr-t   39 root   admin       1K Feb 15 22:21 .
drwxrwxr-t   39 root   admin       1K Feb 15 22:21 ..
-rwxrwxrwx    1 local  staff       6K Jan  4 19:23 .DS_Store
drwxrwxrwt    2 local  admin      68B Feb 15 22:25 .Trashes
-rw-------    1 root   wheel      64K Jul 21  2006 .hotfiles.btree
-rw-------    1 root   admin       1K Jul 21  2006 .rnd
dr-xr-xr-x    2 root   wheel     160B Feb 15 22:21 .vol
drwxrwxr-x   35 root   admin       1K Dec 11 14:09 Applications
drwxrwxrwt    4 root   wheel     136B Feb 15 22:15 DamagedFiles
-rw-r--r--    1 root   admin       8K Dec 12 00:05 Desktop DB
-rw-r--r--    1 root   admin       2B Jul 21  2006 Desktop DF
drwxrwxr-x   14 root   admin     476B Jul 21  2006 Developer
drwxrwxr-x    3 local  admin     102B Jul 21  2006 Groups
drwxrwxr-t   51 root   admin       1K Dec 13 16:56 Library
drwxr-xr-x    1 root   wheel     512B Feb 15 22:22 Network
drwxrwxr-x    5 local  admin     170B Jan 21  2007 Shared Items
drwxr-xr-x    4 root   wheel     136B Dec 11 14:13 System
lrwxr-xr-x    1 root   admin      22B Jan 21  2007 Users -> /Volumes/gemshd2/Users
drwxrwxrwt    5 root   admin     170B Feb 15 22:22 Volumes
drwxr-xr-x    4 root   admin     136B Jan 19  2007 automount
drwxr-xr-x   40 root   wheel       1K Dec 11 14:08 bin
drwxrwxrwx    3 root   admin     102B Jan 16 16:37 collection
drwxr-xr-x    3 www    admin     102B Feb  6  2007 collections
lrwxr-xr-x    1 root   admin      23B Jan 21  2007 common -> /Volumes/gemshd3/common
drwxr-xr-x   27 root   admin     918B Jul 25  2006 common.old
drwxrwxrwt    2 root   wheel      68B Jul 31  2006 cores
dr-xr-xr-x    2 root   wheel     512B Feb 15 22:21 dev
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 etc -> private/etc
-rw-r--r--    1 root   admin       1K Jul 25  2006 formatdb.log
drwxrwxrwt    3 root   wheel     102B Feb 15 22:15 lost+found
lrwxr-xr-x    1 root   admin       9B Feb 15 22:21 mach -> /mach.sym
-r--r--r--    1 root   admin     590K Feb 15 22:21 mach.sym
-rw-r--r--    1 root   wheel       4M Oct 10 21:26 mach_kernel
drwxr-xr-x    3 root   admin     102B Oct  3 00:15 nfs
drwxr-xr-x    3 root   wheel     102B Oct 19  2005 opt
drwxr-xr-x    8 root   wheel     272B Feb 15 22:21 private
drwxr-xr-x   63 root   wheel       2K Dec 11 14:08 sbin
drwxrwxrwx    2 root   admin      68B Jul 21  2006 scratch
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 tmp -> private/tmp
drwxr-xr-x   11 root   wheel     374B Jul 21  2006 usr
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 var -> private/var
gems:/ local$ sudo rm -fr common
gems:/ local$ sudo ln -s /Volumes/gemshd3/common /common
gems:/ local$ ll
total 9923
drwxrwxr-t   39 root   admin       1K Feb 19 11:19 .
drwxrwxr-t   39 root   admin       1K Feb 19 11:19 ..
-rwxrwxrwx    1 local  staff       6K Jan  4 19:23 .DS_Store
drwxrwxrwt    2 local  admin      68B Feb 15 22:25 .Trashes
-rw-------    1 root   wheel      64K Jul 21  2006 .hotfiles.btree
-rw-------    1 root   admin       1K Jul 21  2006 .rnd
dr-xr-xr-x    2 root   wheel     160B Feb 15 22:21 .vol
drwxrwxr-x   35 root   admin       1K Dec 11 14:09 Applications
drwxrwxrwt    4 root   wheel     136B Feb 15 22:15 DamagedFiles
-rw-r--r--    1 root   admin       8K Dec 12 00:05 Desktop DB
-rw-r--r--    1 root   admin       2B Jul 21  2006 Desktop DF
drwxrwxr-x   14 root   admin     476B Jul 21  2006 Developer
drwxrwxr-x    3 local  admin     102B Jul 21  2006 Groups
drwxrwxr-t   51 root   admin       1K Dec 13 16:56 Library
drwxr-xr-x    1 root   wheel     512B Feb 15 22:22 Network
drwxrwxr-x    5 local  admin     170B Jan 21  2007 Shared Items
drwxr-xr-x    4 root   wheel     136B Dec 11 14:13 System
lrwxr-xr-x    1 root   admin      22B Jan 21  2007 Users -> /Volumes/gemshd2/Users
drwxrwxrwt    5 root   admin     170B Feb 15 22:22 Volumes
drwxr-xr-x    4 root   admin     136B Jan 19  2007 automount
drwxr-xr-x   40 root   wheel       1K Dec 11 14:08 bin
drwxrwxrwx    3 root   admin     102B Jan 16 16:37 collection
drwxr-xr-x    3 www    admin     102B Feb  6  2007 collections
lrwxr-xr-x    1 root   admin      23B Feb 19 11:19 common -> /Volumes/gemshd3/common
drwxr-xr-x   27 root   admin     918B Jul 25  2006 common.old
drwxrwxrwt    2 root   wheel      68B Jul 31  2006 cores
dr-xr-xr-x    2 root   wheel     512B Feb 15 22:21 dev
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 etc -> private/etc
-rw-r--r--    1 root   admin       1K Jul 25  2006 formatdb.log
drwxrwxrwt    3 root   wheel     102B Feb 15 22:15 lost+found
lrwxr-xr-x    1 root   admin       9B Feb 15 22:21 mach -> /mach.sym
-r--r--r--    1 root   admin     590K Feb 15 22:21 mach.sym
-rw-r--r--    1 root   wheel       4M Oct 10 21:26 mach_kernel
drwxr-xr-x    3 root   admin     102B Oct  3 00:15 nfs
drwxr-xr-x    3 root   wheel     102B Oct 19  2005 opt
drwxr-xr-x    8 root   wheel     272B Feb 15 22:21 private
drwxr-xr-x   63 root   wheel       2K Dec 11 14:08 sbin
drwxrwxrwx    2 root   admin      68B Jul 21  2006 scratch
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 tmp -> private/tmp
drwxr-xr-x   11 root   wheel     374B Jul 21  2006 usr
lrwxr-xr-x    1 root   admin      11B Jul 31  2006 var -> private/var
gems:/ local$ cd common
gems:/common local$ ls
apps        collections dsh         include     inquiry     lib         myEST       node        sbin        sge         wisecfg
bin         data        etc         info        iprscan     libraries   mysql       pipeline    scratch     share
gems:/common local$ ll
total 0
drwxr-xr-x    23 www   admin   782B Oct 21 17:21 .
drwxrwxr-t    39 root  admin     1K Feb 19 11:19 ..
drwxr-xr-x    16 root  admin   544B Jul 10  2007 apps
drwxr-xr-x   478 www   admin    15K Oct 16 01:20 bin
drwxr-xr-x     2 root  admin    68B Feb  6  2007 collections
drwxrwxrwx   305 www   wheel    10K Feb 15 13:39 data
drwxr-xr-x     3 www   admin   102B Sep 28  2005 dsh
drwxr-xr-x    13 www   admin   442B Jul 21  2006 etc
drwxr-xr-x   148 www   admin     4K Nov 27  2006 include
drwxr-xr-x     7 www   admin   238B Jul 21  2006 info
drwxr-xr-x     9 www   admin   306B Jul 21  2006 inquiry
drwxrwxrwx    35 www   admin     1K Jan 14 03:03 iprscan
drwxr-xr-x   154 www   admin     5K Nov 27  2006 lib
drwxr-xr-x     4 root  admin   136B Feb  7  2007 libraries
drwxr-xr-x     6 508   www     204B Oct 17 18:39 myEST
drwxr-xr-x     3 root  admin   102B Oct 11 21:25 mysql
drwxr-xr-x     9 www   admin   306B Jan  9  2007 node
drwxrwxrwx     8 www   admin   272B Feb 15 13:38 pipeline
drwxr-xr-x     5 www   admin   170B Jul 21  2006 sbin
drwxrwxrwx     7 www   admin   238B Sep 27 13:14 scratch
drwxr-xr-x    21 sge   admin   714B Jul 25  2006 sge
drwxr-xr-x    13 www   admin   442B Jul 21  2006 share
drwxr-xr-x    26 www   admin   884B Sep 28  2005 wisecfg


</entry>



<entry [Fri Feb 15 15:08:44 EST 2008] Illegal instruction>




$ sudo qsub 
Illegal instruction

ALSO:

$ sudo ./qhost
^Z
[5]+  Stopped                 sudo ./qhost
dlc-genomics:/common/sge/bin/darwin young$ sudo ./qacct
^Z
[6]+  Stopped                 sudo ./qacct
dlc-genomics:/common/sge/bin/darwin young$ date
Fri Feb 15 15:08:44 EST 2008
[5]-  Bus error               sudo ./qhost
[6]+  Bus error               sudo ./qacct
dlc-genomics:/common/sge/bin/darwin young$ 


qsub CRASH LOG:


tail -n 50  /Library/Logs/CrashReporter/qsub.crash.log
0x90000000 - 0x901bcfff libdl.dylib     /usr/lib/libdl.dylib
0x90214000 - 0x90219fff libmathCommon.A.dylib   /usr/lib/system/libmathCommon.A.dylib

**********

Host Name:      GEMS-G5-Genomics
Date/Time:      2008-02-15 14:42:14.435 -0500
OS Version:     10.4.11 (Build 8S165)
Report Version: 4

Command: qsub
Path:    /usr/bin/qsub
Parent:  bash [304]

Version: ??? (???)

PID:    428
Thread: 0

Exception:  EXC_BAD_INSTRUCTION (0x0002)
Code[0]:    0x00000002
Code[1]:    0x00018e60


Thread 0 Crashed:
0   qsub                0x00018e60 japi_once_init + 0 (crt.c:300)
1   libdl.dylib         0x90008998 pthread_once + 68
2   qsub                0x00010c18 japi_init + 312 (crt.c:300)
3   qsub                0x00002bb4 main + 256 (crt.c:300)
4   qsub                0x000027e4 _start + 380 (crt.c:267)
5   qsub                0x00002664 start + 48

Thread 0 crashed with PPC Thread State 64:
  srr0: 0x0000000000018e60 srr1: 0x100000000208d030                        vrsave: 0x0000000000000000
    cr: 0x22000082          xer: 0x0000000000000000   lr: 0x0000000090008998  ctr: 0x0000000000018e60
    r0: 0x0000000030b1bcba   r1: 0x00000000bffff050   r2: 0x0000000030b1bcba   r3: 0x00000000000eb348
    r4: 0x0000000000000000   r5: 0x00000000000003e8   r6: 0xffffffffffffffff   r7: 0x00000000000f0ae8
    r8: 0x00000000000c0ae8   r9: 0x0000000000000000  r10: 0x00000000000c0224  r11: 0x0000000048000088
   r12: 0x0000000000018e60  r13: 0x0000000000000000  r14: 0x0000000000000000  r15: 0x0000000000000000
   r16: 0x0000000000000000  r17: 0x0000000000000000  r18: 0x0000000000000000  r19: 0x0000000000000000
   r20: 0x0000000000000000  r21: 0x0000000000000000  r22: 0x0000000000000000  r23: 0x0000000000000000
   r24: 0x0000000000000000  r25: 0x0000000000000000  r26: 0x00000000bffff180  r27: 0x00000000000f0ae8
   r28: 0x0000000000018e60  r29: 0x00000000000eb348  r30: 0x00000000000eb344  r31: 0x0000000000010ae8

Binary Images Description:
    0x1000 -    0xe8fff qsub    /usr/bin/qsub
0x8fe00000 - 0x8fe52fff dyld 46.16      /usr/lib/dyld
0x90000000 - 0x901bcfff libdl.dylib     /usr/lib/libdl.dylib
0x90214000 - 0x90219fff libmathCommon.A.dylib   /usr/lib/system/libmathCommon.A.dylib



</entry>



<entry [Sun Oct 21 03:05:17 EDT 2007] CLEAR ERROR STATE OR DISABLE/ENABLE >



au or E 
========
sudo qmod -c all.q@*

 d
===
sudo qmod -e all.q@*
sudo qmod -e all.q@node008

    :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    queuename                      qtype used/tot. load_avg arch          states
    ----------------------------------------------------------------------------
    all.q@gems.rsmas.miami.edu     BIP   0/2       0.21     darwin        
    ----------------------------------------------------------------------------
    all.q@node001.cluster.private  BIP   1/2       -NA-     darwin        au
    1076391 0.55500 iprscan-20 root         dr    08/21/2007 23:07:47     1        
    ----------------------------------------------------------------------------
             
    The states are as follows:
    
     a - alarm state - normal on an node queue or any other queue if
          the state of the node is full.
    
     u - unavailable - usually sge is down or the machine is down.
    
     E - ERROR - this requires the command `qmod -c` to clear the error state.
                  

qmod - modify a Grid Engine queue

SYNTAX
       qmod [ options ] [ wc_job_range_list | wc_queue_list ]

DESCRIPTION
       Qmod enables users classified as owners (see queue_conf(5) for details)
       of a workstation to modify the state of Grid Engine queues for  his/her
       machine  as  well as the state of his/her own jobs.  A manager/operator
       or root can execute qmod for any queue and job in a cluster. Find addi-
       tional   information   concerning   wc_queue_list  and  wc_job_list  in
       sge_types(1).

OPTIONS
       -c     Clears the error state of the  specified  jobs(s)/queue(s).   Do
              not use this switch anymore, use -cj / -cq instead.

       -cj    Clears the error state of the specified jobs(s).

       -cq    Clears the error state of the specified queue(s).

       -d     Disables  the  queue(s),  i.e. no further jobs are dispatched to
              disabled queues while jobs already executing in these queues are
              allowed to finish.

       -e     Enables the queue(s).

       -f     Force the modification action for the queue despite the apparent
              current state of the queue. For example if a queue appears to be
              suspended  but the job execution seems to be continuing the man-
              ager/operator can force a suspend operation which  will  send  a
              SIGSTOP  to  the jobs. In any case, the queue or job status will
              be set even if the sge_execd(8) controlling the queues/jobs can-
              not be reached. Requires manager/operator privileges.

       -help  Prints a listing of all options.


</entry>



<entry [Wed Oct  3 00:05:07 EDT 2007] error: can't chdir to /nfs/gemshd3/common/pipeline/funnybase11/blast>




gems:~ local$ qstat -j 1171042
==============================================================
job_number:                 1171042
exec_file:                  job_scripts/1171042
submission_time:            Tue Oct  2 23:50:38 2007
owner:                      root
uid:                        0
group:                      wheel
gid:                        0
sge_o_home:                 /Users/young
sge_o_log_name:             root
sge_o_path:                 /Users/young/apps/cytoscape/PLUGINS:/usr/lib/perl5/site_perl:/usr/share/apps/ActiveTcl/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/share/apps/komodo:/sw/bin:/sw/sbin:/sw/bin:/Users/young/FUNNYBASE/bin:/usr/X11R6/bin:/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/Users/young/FUNNYBASE/NOTES/tgicl/tgicl_linux/bin:/usr/local/biotools/bin:/Applications/bioinf/phylip/exe:/Applications/bioinf/t_coffee:/usr/local/biotools/bin
sge_o_shell:                /bin/bash
sge_o_workdir:              /nfs/gemshd3/common/pipeline/funnybase11/blast
sge_o_host:                 dlc-genomics
account:                    sge
cwd:                        /nfs/gemshd3/common/pipeline/funnybase11/blast
path_aliases:               /tmp_mnt/ * * /,/Volumes/gemshd4/ * * /,/Volumes/gemshd3/ * * /,/Volumes/gemshd2/ * * /
merge:                      y
mail_options:               e   
mail_list:                  local@gems.rsmas.miami.edu
notify:                     FALSE
job_name:                   funnybase11-refseq-dog.sh
jobshare:                   0
shell_list:                 /bin/bash
env_list:                   
script_file:                /common/pipeline/funnybase11/blast/funnybase11-refseq-dog.sh
job-array tasks:            1-30:1
error reason   11:          10/02/2007 23:50:52 [0:7330]: error: can't chdir to /nfs/gemshd3/common/pipeline/funnybase11/blast: 
error reason   25:          10/02/2007 23:50:52 [0:7333]: error: can't chdir to /nfs/gemshd3/common/pipeline/funnybase11/blast: 
scheduling info:            queue instance "all.q@node001.cluster.private" dropped because it is temporarily not available
                            job is in error state

SOLUTION:

HACKED A LINK FROM /nfs/gemshd3 TO /Volumes/gemshd3

gems:~ local$ cd /
gems:/ local$ ls
Applications Library      Users.old    common       formatdb.log private      var
Desktop DB   Network      Volumes      common.old   mach         sbin
Desktop DF   Shared Items automount    cores        mach.sym     scratch
Developer    System       bin          dev          mach_kernel  tmp
Groups       Users        collections  etc          opt          usr
gems:/ local$ sudo mkdir /nfs
Password:
gems:/ local$ cd nfs
gems:/nfs local$ ls
gems:/nfs local$ sudo ln -s /Volumes/gemshd3 /nfs/gemshd3
gems:/nfs local$ ll
total 8
drwxr-xr-x    3 root  admin  102B Oct  3 00:15 .
drwxrwxr-t   39 root  admin    1K Oct  3 00:15 ..
lrwxr-xr-x    1 root  admin   16B Oct  3 00:15 gemshd3 -> /Volumes/gemshd3




</entry>



<entry [Wed Oct  3 00:01:46 EDT 2007] NODE IN au STATE>




:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
queuename                      qtype used/tot. load_avg arch          states
----------------------------------------------------------------------------
all.q@gems.rsmas.miami.edu     BIP   0/2       0.21     darwin        
----------------------------------------------------------------------------
all.q@node001.cluster.private  BIP   1/2       -NA-     darwin        au
1076391 0.55500 iprscan-20 root         dr    08/21/2007 23:07:47     1        
----------------------------------------------------------------------------
         
The states are as follows:

 a - alarm state - normal on an node queue or any other queue if
	  the state of the node is full.

 u - unavailable - usually sge is down or the machine is down.

 E - ERROR - this requires the command `qmod -c` to clear the error state.
                  

	   
</entry>



<entry [Tue Oct  2 23:48:51 EDT 2007] unable to contact qmaster using port 701 on host "gems.rsmas.miami.edu">



PROBLEM:

WHEN RUN sudo ./collectionarrayblast.pl OR sudo ./orthologuesarrayblast.pl GET THIS ERROR -

Unable to initialize environment because of error: unable to contact qmaster using port 701 on host "gems.rsmas.miami.edu"

(...THIS WAS AFTER ALL THE NETWORK PROBLEMS AND THE HOST NAME HAD SUDDENLY CHANGED TO GEMS-G5-Genomics)

SOLUTION:

RENAME HOST USING sudo hostname -s <NEW_HOSTNAME>

GEMS-G5-Genomics:~/FUNNYBASE/bin/pipeline4 young$ sudo hostname -s dlc-genomics.rsmas.miami.edu
Password:
GEMS-G5-Genomics:~/FUNNYBASE/bin/pipeline4 young$ hostname
dlc-genomics.rsmas.miami.edu
GEMS-G5-Genomics:~/FUNNYBASE/bin/pipeline4 young$ sudo ./collectionarrayblast.pl -d funnybase11 -t refseq-dog

Doing BLAST against these databases: refseq-dog

Tue Oct  2 23:49:29 EDT 2007

Doing target database: refseq-dog
Collection sequences fastafile: /common/data/funnybase11
Getting target type... protein
Getting query type... nucleotide
Blast type: blastx
Printing shellscript '/common/pipeline/funnybase11/blast/funnybase11-refseq-dog.sh'... done.


Doing ARRAYBLAST of database 'funnybase11' (total sequences 11973) against refseq-dog (E-value cutoff: 1e-05)
qsub command: qsub -sync y -t 1-30 /common/pipeline/funnybase11/blast/funnybase11-refseq-dog.sh


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
INSTALLED SGE ON genomics USING COPY OF /common/sge FROM gems:
Tue Dec  5 10:14:21 EST 2006

source /common/sge/default/common/settings.sh   # OK
qstat -f
>>>Unable to contact qmaster using port 701 on host "gems.rsmas.miami.edu"



++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Tue Dec  5 07:53:45 EST 2006
SUBMIT HOST INSTALLATION

From : 	dag via RT <inquiry-support@bioteam.net>
Reply-To : 	inquiry-support@bioteam.net
Sent : 	Monday, December 4, 2006 6:11 PM
To : 	youngstuart@hotmail.com
Subject : 	Re: [bioteam.net #13817] install submit host + interproscan
	
	
Go to previous message	|	Go to next message	|	Delete	|	Inbox

Hi Stuart,

I've been communicating with the interproscan support staff in the  
hopes of getting an HOWTO up at the http://gridengine.info wiki site  
- no word on that yet but the word from their support person is that  
they are aware of SGE, have people using SGE and (perhaps) they have  
SGE integration documents or files already in their current release.

The most recent info I can find that does not come from the  
interproscan developers is covered here:
http://gridengine.info/articles/tag/interproscan

Regarding SGE submit host ...

This should be pretty easy, you don't need a NFS mount if all you  
want to do is submit work and query status but if a NFS mount is  
possible it represents the easiest way to get it to work.

The main requirements are:

(1) You run "qconf -as <hostname>" on the SGE system to add an entry  
for this new submit host. Your submit host should have a forward and  
reverse DNS entry ideally so that the SGE qmaster recognizes the  
connection when it comes in and can then match that connection to the  
hostname you used when registering it with "qconf -as".

(2) Your submit hosts needs local copies of the SGE binaries and it  
needs information on how to contact the SGE qmaster machine and which  
TCP ports it should be using for that communication. For me, the  
easiest way to do this was to just replicate (via rsync) the /common/ 
sge/ directory onto my laptop - that moves over both the binaries as  
well as all the setup and communication configuration parameters.  
Then all I needed to do on my laptop was initialize the SGE  
environmental setup scripts --> "source /common/sge/default/common/settings.sh" and I was all set.

Regards,
Chris Dagdigian
BioTeam



forward and reverse DNS
=======================
Any host that tries to connect to this server must have both a forward and reverse DNS entry. This means we must be able to lookup both your hostname *and* IP address

FORWARD AND REVERSE DNS IS WORKING:
local
nslookup genomics.rsmas.miami.edu
Note:  nslookup is deprecated and may be removed from future releases.
Consider using the `dig' or `host' programs instead.  Run nslookup with
the `-sil[ent]' option to prevent this message from appearing.
Server:         192.168.2.254
Address:        192.168.2.254#53

Non-authoritative answer:
genomics.rsmas.miami.edu        canonical name = dlc-genomics.rsmas.miami.edu.
Name:   dlc-genomics.rsmas.miami.edu
Address: 129.171.101.233

gems:~ local$ nslookup 129.171.101.233         
Note:  nslookup is deprecated and may be removed from future releases.
Consider using the `dig' or `host' programs instead.  Run nslookup with
the `-sil[ent]' option to prevent this message from appearing.
Server:         192.168.2.254
Address:        192.168.2.254#53

Non-authoritative answer:
233.101.171.129.in-addr.arpa    name = dlc-genomics.rsmas.miami.edu.

Authoritative answers can be found from:
101.171.129.in-addr.arpa        nameserver = ns4.miami.edu.
101.171.129.in-addr.arpa        nameserver = mitzi.rsmas.miami.edu.
101.171.129.in-addr.arpa        nameserver = umigw.miami.edu.
ns4.miami.edu   internet address = 208.109.18.69
mitzi.rsmas.miami.edu   internet address = 129.171.97.20
umigw.miami.edu internet address = 129.171.97.1

( Normally your isp should give you an ip address, and also a reverse lookup address. I have charter cable, and they might give me an address of 123.456.789.1
that's my IP Address. The reverse lookup address that I get from charter would be something like

123-456-789-1.hsacorp.net

or

123-456-789-1.charter.net )



On Dec 4, 2006, at 1:01 PM, stuart young via RT wrote:

>
> Mon Dec 04 13:01:02 2006: Request 13817 was acted upon.
> Transaction: Ticket created by youngstuart@hotmail.com
>        Queue: iNquiry Support
>      Subject: install submit host + interproscan
>        Owner: Nobody
>   Requestors: youngstuart@hotmail.com
>       Status: new
>  Ticket <URL: https://rt.bioteam.net/Ticket/Display.html?id=13817 >
>
>
> Hi Bill/Chris,
>
> I have two questions I was wondering if you could help me with:
>
> 1. I'd like to install SGE as a 'submit host' on a machine that is
> not part of our Inquiry-enabled cluster. Could you point me in the
> direction of any related instructions/FAQs. In particular, I'd like
> to know:
>    - if I need to do an NFS mount of /common/sge or any other
> directories on my new submit host.
>    - And if so, how do I go about it? I've read the manuals about
> installing master, shadow, submit, execution hosts but it's not clear
> to me - should I install the submit host as an execution host and
> then add it as a submit host on the master host?
>
> 2. How do I go about using the job processing capabilities of SGE
> with Interproscan?
>
> Thanks!
>
> Stuart.
>
> PS: I emailed the inquiry-support@bioteam.net address but it bounced
> back. Is that the right email for the BioTeam?
>
> ============
> Stuart Young
> Research Assistant
> Crawford Lab
> RSMAS
> University of Miami
>





NFS REQUIRES THAT THE USERID AND GROUPID ARE THE SAME on the client and server:

gems:~ local$ id
uid=501(local) gid=501(local) groups=501(local), 81(appserveradm), 79(appserverusr), 500(com.apple.access_all_services), 80(admin)


niutil -read . /users/young | grep uid 







CREATE USER young ON NODES:

SSH TO NODES:

ssh vanwye@192.168.2.X

CHECK FOR USER ID AND GROUP IDS ON genomics:

nireport / /users name uid

young 1027  - SO USE THIS

nireport / /groups name gid

local   501  - IS HIGHEST SO USE 502


CREATE USER:

sudo niutil -create / /users/young
sudo niutil -createprop / /users/young uid 1027
sudo niutil -createprop / /users/young realname "Stuart Young"
sudo niutil -createprop / /users/young home "/Users/young"
sudo niutil -createprop / /users/young shell "/dev/null"

CREATE A GROUP FOR THE USER:

niutil -create / /groups/young
niutil -createprop / /groups/young name young
sudo niutil -createprop / /users/young gid 502

sudo niutil -createprop / /users/young passwd "*" 
sudo passwd young
<TYPE IN PASSWORD>

CREATE THE HOME DIRECTORY AND ASSOCIATED SUBDIRS AND FILES:

sudo cp -R /System/Library/User\ Template/English.lproj /Users/young
sudo chown -R young:wheel /Users/young





++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Sun Dec  3 18:35:31 EST 2006

tar xvfz sge-6.0u9-common.tar.gz

CREATES:

3rd_party
catman
ckpt
doc
examples
include
inst_sge
install_qmaster
install_execd
pvm
qmon
lib                         
man                         
mpi
util

tar xvfz sge-6.0u9-bin-darwin.tar.gz

CREATES:
bin
utilbin
examples
lib/darwin

dlc-genomics:~/FUNNYBASE/apps/sge young$ tar xvfz sge-6.0u9-bin-darwin.tar.gz 
bin/darwin/
bin/darwin/sge_qmaster
bin/darwin/sge_execd
bin/darwin/sge_shadowd
bin/darwin/sge_schedd
bin/darwin/sge_shepherd
bin/darwin/sge_coshepherd
bin/darwin/qstat
bin/darwin/qselect
bin/darwin/qsub
bin/darwin/qalter
bin/darwin/qresub
bin/darwin/qhold
bin/darwin/qrls
bin/darwin/qconf
bin/darwin/qdel
bin/darwin/qacct
bin/darwin/qmod
bin/darwin/qsh
bin/darwin/qlogin
bin/darwin/qrsh
bin/darwin/qmon
bin/darwin/qhost
bin/darwin/qmake
bin/darwin/qtcsh
bin/darwin/qping
bin/darwin/sgepasswd
utilbin/darwin/
utilbin/darwin/uidgid
utilbin/darwin/gethostname
utilbin/darwin/gethostbyname
utilbin/darwin/gethostbyaddr
utilbin/darwin/getservbyname
utilbin/darwin/filestat
utilbin/darwin/checkprog
utilbin/darwin/loadcheck
utilbin/darwin/now
utilbin/darwin/checkuser
utilbin/darwin/adminrun
utilbin/darwin/qrsh_starter
utilbin/darwin/testsuidroot
utilbin/darwin/sge_share_mon
utilbin/darwin/infotext
utilbin/darwin/spooldefaults
utilbin/darwin/spooledit
utilbin/darwin/spoolinit
utilbin/darwin/fstype
utilbin/darwin/berkeley_db_svc
utilbin/darwin/db_archive
utilbin/darwin/db_checkpoint
utilbin/darwin/db_deadlock
utilbin/darwin/db_dump
utilbin/darwin/db_load
utilbin/darwin/db_printlog
utilbin/darwin/db_recover
utilbin/darwin/db_stat
utilbin/darwin/db_upgrade
utilbin/darwin/db_verify
utilbin/darwin/openssl
utilbin/darwin/rsh
utilbin/darwin/rshd
utilbin/darwin/rlogin
examples/jobsbin/darwin/
examples/jobsbin/darwin/work
lib/darwin/
lib/darwin/libspoolb.dylib
lib/darwin/libspoolc.dylib
lib/darwin/libXltree.dylib
lib/darwin/libcrypto.0.9.7.dylib
lib/darwin/libcrypto.dylib
lib/darwin/libssl.0.9.7.dylib
lib/darwin/libssl.dylib
lib/darwin/libssl.bundle
lib/darwin/libdb-4.2.dylib
lib/darwin/libdrmaa.dylib
lib/darwin/libdrmaa.jnilib







SGE ERROR MESSAGES
++++++++++++++++++

PENDING JOB NOT DISPATCHED:
qalter -w v <jobid>
    - lists the reasons why a job is not dispatchable in principle
    by performing a dry scheduling run is performed where all resources
    (also slots) are considered to be fully available for this job.
    Similarly all load values are ignored because they are varying.

qstat -j <jobid>
 
JOBS HAVE FREQUENT ERRORS:
qstat -j  | grep error
qstat -explain E

user abort mail
submit option "-m a" -> abort mail is sent to the adress specified with the "-M user[@host]" option.
The abort mail contains diagnosis information about job errors.

qacct -j 
get information about the job error from Grid Engine job accounting.

administrator abort mail
An administrator can order admistrator mails about job execution problems by specifying an appropriate email adress (see under administrator_mail in sge_conf(5) ). Administrator mails contain more detailed diagnosis information than user abort mails and are the recommended in case of frequent job execution errors. 

messages files

$SGE_ROOT/default/spool/qmaster/messages

Additional information can be sometimes found in the messages of the Execd where the job was started. Use
      
qacct -j <jobid>

TO GET THE HOST A JOB WAS RUN ON, THEN

$SGE_ROOT/default/spool/<host>/messages


Administrator mail
++++++++++++++++++
An administrator can order administrator mails about 
job execution problems by specifying an appropriate email address. See under 
administrator_mail on the sge_conf(5) man page. Administrator mail 
contains more detailed diagnosis information than user abort mail. Administrator 
mail is the recommended method in case of frequent job execution errors. 

sudo qconf -mconf global

WILL OPEN THE FILE WITH vim:

vim mynewfile
up arrow -- moves cursor up one line;
down arrow -- moves cursor down one line;
right arrow -- moves cursor right one character space;
left arrow -- moves cursor left one character space;
shift + c -- enters to "Insert" mode (write/edit mode);
i -- enters into Insert mode, wherever the cursor may be;
o -- enters into Insert mode, with a new line printed;
ctrl + c -- exits from "Insert";

(Out of "insert" mode)
ZZ -- exit and save any changes
x -- delete one character

ctrl + z -- exits vim and returns to the directory;
:q! -- forces an exit without saving changes [q - quit];
:wq -- exits and saves changes [w - write, q - quit].



SUDO AS THE www USER
++++++++++++++++++++

sudo passwd www
sudo -u www bash

EXECUTE A COMMAND AS THE www USER
+++++++++++++++++++++++++++++++++
E.G.:
su www -c "/usr/local/etc/webspirs/bin/webspird.cgi restart" 
OR
su www -c "/usr/local/etc/webspirs/bin/webspird.cgi restart" 

ALSO
'su -c "make install"'
OR
su -c "command needing root"

NB: UNLIKE 'su', 'su -'
- takes you away from your current directory
- loads the PATH for root (or specified user) from its own init files
- clears the terminal screen


SOLUTION!
++++++++

IN ServerAdmin --> DNS --> Settings --> General 
SET 
Zone name: rsmas.miami.edu
Server name: gems

NB: CHANGES WERE SAVED TO /private/etc/named.conf

REBOOT AND RERUN 

sudo SystemStarter stop SGE
sudo SystemStarter start SGE

ps aux | grep sge
sge       1245   0.0  0.3    42496   3392  ??  S    11:08PM   0:02.76 /common/sge/bin/darwin/sge_qmaster
sge       1254   0.0  0.1    28464   1336  ??  S    11:08PM   0:00.82 /common/sge/bin/darwin/sge_schedd
sge       1287   0.0  0.1    28508    816  ??  S    11:08PM   0:00.09 /common/sge/bin/darwin/sge_execd
young     1706   0.0  0.0    27336    380  p2  R+   11:21PM   0:00.00 grep sge




VERBOSE SystemStarter OUTPUT
++++++++++++++++++++++++++++
sudo SystemStarter -v -d  start SGE

NOT MUCH HELP. JUST POINTED TOWARDS THE /Library/StartupItems/SGE DIRECTORY

REMOVED THE LOCKFILE
++++++++++++++++++++

SO THAT SGE WOULD BE RECONFIGURED WHEN STARED WITH SystemStarter 

sudo mv /private/var/db/.sgeConfigDone /private/var/db/.sgeConfigDone.bkp

REBOOTED AND GOT SAME SystemStarter ERROR

POSSIBLE PROBLEM ROOT
+++++++++++++++++++++

USED gethostbyname TO CHECK RESOLUTION OF NODES:

$SGE_ROOT/utilbin/<arch>/
/common/sge/utilbin/darwin/gethostbyname
/common/sge/utilbin/darwin/gethostbyaddr


./gethostbyname -all cluster.private
Hostname: cluster.private
SGE name: cluster.private
Aliases:  
Host Address(es): 192.168.2.254 

gethostbyaddr 192.168.2.254
Hostname: node001.cluster.private
Aliases:  
Host Address(es): 192.168.2.254 




ADDED A ZONE IN THE DNS SECTION OF ServerAdmin AND RESTARTED DNS BUT NO CHANGE, SAME ERROR AS BELOW.

EXACT ERROR
+++++++++++

sudo SystemStarter stop SGE
error resolving local host: can't resolve host name (h_errno = HOST_NOT_FOUND)
error resolving local host: can't resolve host name (h_errno = HOST_NOT_FOUND)
critical error: unrecoverable error - contact systems manager
critical error: unrecoverable error - contact systems manager
   Shutting down Grid Engine execution daemon
ls: //active_jobs: No such file or directory
error resolving local host: can't resolve host name (h_errno = HOST_NOT_FOUND)
error resolving local host: can't resolve host name (h_errno = HOST_NOT_FOUND)






LOOK UP THE HOST MANUALLY
+++++++++++++++++++++++++

host gems.rsmas.miami.edu
RETURNS NOTHING

host -l node002.cluster.private
Host node002.cluster.private not found: 9(NOTAUTH)

host -a gems.rsmas.miami.edu

Trying "gems.rsmas.miami.edu"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 35157
;; flags: qr rd; QUERY: 1, ANSWER: 0, AUTHORITY: 13, ADDITIONAL: 0

;; QUESTION SECTION:
;gems.rsmas.miami.edu.          IN      ANY

;; AUTHORITY SECTION:
.                       518400  IN      NS      B.ROOT-SERVERS.NET.
.                       518400  IN      NS      C.ROOT-SERVERS.NET.
.                       518400  IN      NS      D.ROOT-SERVERS.NET.
.                       518400  IN      NS      E.ROOT-SERVERS.NET.
.                       518400  IN      NS      F.ROOT-SERVERS.NET.
.                       518400  IN      NS      G.ROOT-SERVERS.NET.
.                       518400  IN      NS      H.ROOT-SERVERS.NET.
.                       518400  IN      NS      I.ROOT-SERVERS.NET.
.                       518400  IN      NS      J.ROOT-SERVERS.NET.
.                       518400  IN      NS      K.ROOT-SERVERS.NET.
.                       518400  IN      NS      L.ROOT-SERVERS.NET.
.                       518400  IN      NS      M.ROOT-SERVERS.NET.
.                       518400  IN      NS      A.ROOT-SERVERS.NET.

Received 249 bytes from 192.168.2.254#53 in 19 ms

>>>>> no 'SERVER SECTION' so presumably didn't find the host




SHARED FILESYSTEMS
++++++++++++++++++

niutil -list . /exports

gems:
106      /Users
116      /Groups
117      /common
118      /Library/Perl

node002:
106      /Library/NetBoot/NetBootSP0



EMAIL OPTIONS
+++++++++++++

-m <options>

b  sent at begin
e  sent at end
a  sent on abort
b  sent on suspend
n  no mail sent


NB: THE DEFAULT REQUEST FILE i.e. /common/sge/default/common/sge_default OVERRIDES OTHER SETTINGS





RESTART sge
+++++++++++

sudo SystemStarter stop SGE
   Shutting down Grid Engine execution daemon
   Shutting down Grid Engine scheduler
   Shutting down Grid Engine qmaster

sudo SystemStarter start SGE
Checking disks

To restart SGE on a compute element execute:

inquiry:/Users/cdwan root# ssh node001 SystemStarter start SGE
Checking disks

Then check SGE again:

qstat -f




GET ENVIRONMENT VARIABLE INFO FOR A PARTICULAR sge JOB
++++++++++++++++++++++++++++++++++++++++++++++++++++++

qstat -j 214
job_number:                 214
exec_file:                  job_scripts/214
submission_time:            Tue Jul 18 12:26:51 2006
owner:                      root
uid:                        0
group:                      wheel
gid:                        0
sge_o_home:                 /Users/young
sge_o_log_name:             root
sge_o_path:                 /common/sge/bin/darwin:/bin:/sbin:/usr/bin:/usr/sbin:/common/mpich-1.2.7/ch_p4/bin:/common/bin:/common/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/common/data:/common/data/blastmat
sge_o_shell:                /bin/bash
sge_o_workdir:              /Users/young/FUNNYBASE/bin/pipeline2
sge_o_host:                 gems
account:                    sge
cwd:                        /Users/young/FUNNYBASE/bin/pipeline2
path_aliases:               /tmp_mnt/ * * /
merge:                      y
mail_options:               be  
mail_list:                  local@gems.rsmas.miami.edu
notify:                     FALSE
job_name:                   funnybase3-swissprot.sh
jobshare:                   0
shell_list:                 /bin/bash
env_list:                   
script_file:                /Users/young/FUNNYBASE/pipeline/blast.databases/funnybase3-swissprot.sh
job-array tasks:            1-10:1
scheduling info:            There are no messages available



CHANGE SGE mailer SETTING
+++++++++++++++++++++++++

qconf -sconf mailer /usr/bin/mail

CHANGE TAKES EFFECT IMMEDIATELY. MAILER MUST ACCEPT THE FOLLOWING SYNTAX

mailer -s <subject> <recipient>


CHECK postfix IS WORKING
++++++++++++++++++++++++

telnet localhost 25



Trying ::1...
telnet: connect to address ::1: Connection refused
Trying 127.0.0.1...
Connected to localhost.


CHECK mailer CONFIGURATION IN SGE
+++++++++++++++++++++++++++++++++

qmon &

GO TO Cluster Configuration --> mailer 	/usr/bin/mail

WHICH IS OKAY!


LISTEN WITH netstat FOR INTERNET USAGE
++++++++++++++++++++++++++++++++++++++

netstat -t -a | grep LISTEN





ONLINE MANUAL:
++++++++++++++
http://docs.sun.com/app/docs/doc/817-6117/

Mail
http://docs.sun.com/app/docs/doc/817-6117/6mlhdaps1?a=view

Database schemas
http://docs.sun.com/app/docs/doc/817-6117/6mlhdapst?a=view

GET qmon TO WORK
++++++++++++++++

PROBLEM 1:
==========
 qmon
dyld: Library not loaded: /usr/X11R6/lib/libXpm.4.dylib
  Referenced from: /common/sge/bin/darwin/qmon
  Reason: image not found
Trace/BPT trap
gems:~ local$ qmon
Error: Can't open display: 
gems:~ local$ 

SOLUTION:

Install X11User.pkg on XServe Install DVD remotely using Remote Desktop.

PROBLEM 2:
==========

qmon
Error: Can't open display: 

SOLUTION:

$ xterm
xterm Xt error: Can't open display:

1) You also must have an X server running on your desktop! - OKAY!

OTHERWISE..

2) Both the Secure Shell server and client must be configured to allow X11Forwarding.

The servers on our login nodes are configured to allow X11-over-ssh so check your local
client configuration (ssh_config) on the machine you're logging in from to see if X11Forwarding is enabled there.

You can also enable it via the command-line and in personal ssh configuration files.

Environment setup
=================

To set up your environment you need to execute this on the command line or put in your environment
tcsh/csh

source /nfs/sge/current/default/common/settings.csh
bash

. /nfs/sge/current/default/common/settings.sh
Status of jobs

To check the status of jobs you can visit http://blast.cs.unm.edu/gemonitor/.
Basic commands
qsub

Submits a background job. Example:

qsub -N "jobname" /tools/hw/wrap make test
+ Qsub requires command to be a script
+ Output goes to <jobname>.o<jobnumber>

Please note:
The SGE system will use /bin/csh to execute the shell scripts regardless of the shell specified at the top. If you are using an alternate shell, use the -S to specify the shell e.g.

#$ -S /bin/bash

instead of

#!/bin/bash
qbsub

Submit a binary background job. 
===============================
This is a wrapper script to qsub that does away with the necessity to use scripts. Example:

qbsub make OPT=1234 my_target

qrsh

Submit foreground job. Example:

qrsh make test

qstat

Check status of jobs. Examples:
qstat	     # Checks status of all jobs
qstat -u user  # Checks status of user's jobs
qstat -r       Show resources being used
qstat -j jobnum	    Details of 1 job
qdel

Delete a job. Example:

qdel 2345   # Kills job 2345
qmon

START QMON
++++++++++

qmon &


PASS ENVIRONMENT TO QSUB (-V flag)
++++++++++++++++++++++++++++++++++++++

qsub -V ./job.sh

(For example if you set a specific LD_LIBRARY_PATH that you want passed to your scripts -V is the way to go.

SPECIFY OUTPUT AND ERROR FILES (-e and -o flags)
++++++++++++++++++++++++++++++++++++++++++++++++

qbsub -o $PWD -e $PWD mystuff	# This will put both .o and .e files in whatever the present working directory is.

SEND A JOB TO A PARTICULAR SERVER (-q flag)
+++++++++++++++++++++++++++++++++++++++++++++++

qsub -q shelby.q,io.q,rhea.q script.pl		# dispatch the job only to shelby, io or rhea (in that order)

SPECIFY MINIMUM MEMORY ON SERVER (-l flag)
++++++++++++++++++++++++++++++++

qsub -l mem_total=800 script.pl			# EXECUTING SERVER has to have at least 800 MB of memory use


SPECIFY SERVER OPERATING SYSTEM
+++++++++++++++++++++++++++++++

qsub -l arch=darwin				# run a job on MacOS X only


# use glinux for x86 version of Linux 
# lx24-amd64 for AMD64 architecture ie. AMD Opteron or Athlon64.


GET STATS
+++++++++

qacct 

qacct -d 1
qacct -h  # LIST BY HOST (NODE)
qacct --help

displays the aggregate utilization on all machines of the SunGridEngine cluster as generated by all jobs 
having finished and being contained in the cluster accounting file

/common/sge/default/common/accounting

(<sge_root>/<cell>/common/accounting)

REAL / WALLCLOCK - TIME BETWEEN THE JOB START AND END. 
USER Ñ CPU TIME SPENT ON THE USER PROCESS
SYSTEM Ñ CPU TIME SPENT ON SYSTEM CALLS

request information about all jobs having completed and matching a resource requirement 
specification expressed with the same -l syntax as used with the qsub command to submit the job.

ERROR LOGS
++++++++++

Sun Grid Engine software reports errors or warnings by logging messages into 
certain files and/or by electronic mail (e-mail). The logfiles used are: 
 
Messages Files: 
There are separate messages files for the sge_qmaster, the sge_schedd and the 
sge_execds. The files have the same file name messages.

The sge_qmaster logfile:

/common/sge/default/spool/qmaster/messages

the sge_schedd messages file:

/common/sge/default/spool/qmaster/schedd/messages

the execution daemons logfiles:
		***
/common/sge/default/spool/gems/messages
		***
/common/sge/default/spool/node002/messages
/common/sge/default/spool/node003/messages
/common/sge/default/spool/node004/messages
/common/sge/default/spool/node005/messages
/common/sge/default/spool/node006/messages
/common/sge/default/spool/node007/messages
/common/sge/default/spool/node008/messages
/common/sge/default/spool/node009/messages
/common/sge/default/spool/node010/messages
/common/sge/default/spool/node011/messages
/common/sge/default/spool/node012/messages
/common/sge/default/spool/node013/messages
/common/sge/default/spool/node014/messages
/common/sge/default/spool/node015/messages
/common/sge/default/spool/node016/messages
/common/sge/default/spool/qmaster/messages
/common/sge/default/spool/qmaster/schedd/messages

reside in the spool directories of the execution daemons
(see the section, ÒSpool Directories Under  the Root DirectoryÓ on page 25 for more information about the spool directories). 
The messages files have the following format: 
 
Each message occupies a single line. 
 
The messages are subdivided into 5 components separated by the vertical bar 
sign (|). 
 
The first component is a time stamp for the message. 
 
The second specifies the Sun Grid Engine daemon generating the message. 
 
The third is the hostname the daemon runs on.


START MAIL SERVER
+++++++++++++++++

TO AUTOMATE START AT BOOT, EDIT

/etc/hostconfig in your favorite text editor. Edit the line that reads MAILSERVER=-NO- to MAILSERVER=-YES-:

ADD:

MAILSERVER=-YES-

THEN REBOOT.

Next, you must adjust the Sendmail configuration so that it doesn't detect a security error. By default,
Sendmail detects any group-writable directories that contain its configuration files and fails to start if it finds even one.
Because of the user and group structure in Mac OS X, if you were to change the permissions on the
Sendmail configuration directories, you'd lose other administrative features.
If you fail to complete this step, Sendmail will start at boot time, but will immediately quit,
saving errors such as this to the /var/spool/mail.log file:

# OSX
/private/var/log/mail.log

# LINUX
/var/spool/mail.log


To fix the problem, open the /etc/mail/sendmail.cf and look for the line

#O DontBlameSendmail=safe

Change the line to read

O DontBlameSendmail=GroupWritableDirPathSafe

This adds the option DontBlameSendmail with flag GroupWritableDirPat h Safe. This instructs Sendmail to define group-writable directories as being safe.

You can now restart your Mac OS X computer. The Sendmail e-mail server will start. You can verify that the server is running and responding by using telnet to connect to port 25 (SMTP):

[primal:/etc/mail] root# telnet localhost 25
Trying 127.0.0.1...
Connected to localhost.ag.ohio-state.edu.
Escape character is '^]'.
220 primal.ag.ohio-state.edu ESMTP Sendmail 8.10.2/8.10.2; Mon, 25 Jun 2001 21:08:27 -0400

   
   If your connection fails, verify that you do have a DNS-registered hostname for your computer and check for error messages in the /var/log/mail.log file. The Sendmail messages are quite verbose and a great deal of help with debugging a faulty installation.

Try sending yourself a test message from a remote computer. Be sure to specify the destination as the hostname and username used on your Mac OS X machine. Incoming messages are stored in /var/spool/ < username> . Use the command-line mail utility to read the contents of your mailbox:

[primal:/etc/mail] root# mail
Mail version 8.1 6/6/93.  Type ? for help.
"/var/mail/jray": 1 message 1 new
>N  1 jray@poisontooth.com  Mon Jun 25 21:11  20/838   "Testing"

Congratulations. Your Mac OS X computer is now running an enterprise-class SMTP server.

</entry>

