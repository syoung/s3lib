Notes-apps-nfs.txt



<entry [Sat 2012:10:06 11:45:36 EST] 'WARM RESTART' RPCBIND AND NFS>


SUMMARY

1. RPCBIND

ps -ef |grep rpcbind
    root   115     1  0   May 31 ?        0:14 /usr/sbin/rpcbind
    root 13000  6944  0 11:11:15 pts/3    0:00 grep rpcbind
kill -s term 115
/usr/sbin/rpcbind -w

    
2. NFS

svcadm restart network/nfs/server



    
How to Warm-Start rpcbind
http://docs.oracle.com/cd/E19082-01/819-1634/rfsadmin-243/index.html

If the NFS server cannot be rebooted because of work in progress, you can restart rpcbind without having to restart all of the services that use RPC. Just complete a warm start by following these steps.

    Become superuser or assume an equivalent role.

    Roles contain authorizations and privileged commands. For more information about roles, see Configuring RBAC (Task Map) in System Administration Guide: Security Services. To configure a role with the Primary Administrator profile, see Chapter 2, Working With the Solaris Management Console (Tasks), in System Administration Guide: Basic Administration.

    Determine the PID for rpcbind.

    Run ps to get the PID, which is the value in the second column.

    # ps -ef |grep rpcbind
        root   115     1  0   May 31 ?        0:14 /usr/sbin/rpcbind
        root 13000  6944  0 11:11:15 pts/3    0:00 grep rpcbind

    Send a SIGTERM signal to the rpcbind process.

    In this example, term is the signal that is to be sent and 115 is the PID for the program (see the kill(1) man page). This command causes rpcbind to create a list of the current registered services in /tmp/portmap.file and /tmp/rpcbind.file.

    # kill -s term 115

    Note –

    If you do not kill the rpcbind process with the -s term option, you cannot complete a warm start of rpcbind. You must reboot the server to restore service.

    Restart rpcbind.

    Warm-restart the command so that the files that were created by the kill command are consulted. A warm start also ensures that the process resumes without requiring a restart of all the RPC services. See the rpcbind(1M) man page.

    # /usr/sbin/rpcbind -w

    
</entry><entry [Sun 2012:09:30 14:10:38 EST] RESTART RPCBIND (WITH PORTMAP) USING pidof>

pidof rpcbind 
2356
pg rpcbind
    root      2356  0.0  0.0  19072   988 ?        Ss   18:07   0:00 rpcbind -w
    root      2375  0.0  0.0   7972   896 pts/1    S+   18:09   0:00 grep rpcbind

kill -9 2356
/etc/init.d/portmap restart

    portmap stop/waiting
    portmap start/running, process 2402

# RESTART PORTMAP AND NFS
/etc/init.d/portmap restart
/etc/init.d/nfs-kernel-server restart

    
</entry>
<entry [Tue Jan 18 17:59:44 EST 2011] NFS MOUNT OF AQUARIUS /data AND /nethome ON MASTER (USING StarCluster.pm)>


1. ON MASTER, SET FIXED mountd PORT IN /etc/sysconfig/nfs
(DON'T WORRY ABOUT NFS (PORT 2049) OR PORTMAP (PORT 111))

cp /etc/sysconfig/nfs /etc/sysconfig/nfs.bkp

emacs /etc/sysconfig/nfs

#RQUOTAD_PORT=875
#STATD_PORT=662
MOUNTD_PORT=32767
#RPCMOUNTDOPTS="--port 32767 --manage-gids"



NB: DON'T DISABLE NFS VERSIONS 1 AND 2 IN /etc/sysconfig/nfs !

I.E., DON'T DO THIS:

MOUNTD_NFS_V1="no"
MOUNTD_NFS_V2="no"

When you disable mountd versions 1 and 2, then the "showmount -e galaxy" command will fail with an error similar to: "rpc mount export: RPC: Program/version mismatch; low version = 3, high version = 3". This can be alleviated by leaving all NFS versions running on the server and then forcing "nfsvers=3" in your "/etc/fstab" file on the remote client.


CHECK CURRENT PORTS:    

NFS     2049    TCP
MOUNTD  705 TCP 
PORTMAP 111 TCP
STATD   757 TCP
QUOTAD  690 TCP

NFS     2049    UDP
MOUNTD  702 UDP
STATD   751 UDP
STATD   754 UDP
PORTMAP 111 UDP
QUOTAD  687 UDP


netstat -ntulp

Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name   
tcp        0      0 0.0.0.0:705                 0.0.0.0:*                   LISTEN      13246/rpc.mountd    
tcp        0      0 0.0.0.0:2049                0.0.0.0:*                   LISTEN      -                   
tcp        0      0 0.0.0.0:37415               0.0.0.0:*                   LISTEN      -                   
tcp        0      0 0.0.0.0:3306                0.0.0.0:*                   LISTEN      1233/mysqld         
tcp        0      0 0.0.0.0:111                 0.0.0.0:*                   LISTEN      13167/portmap       
tcp        0      0 0.0.0.0:690                 0.0.0.0:*                   LISTEN      13230/rpc.rquotad   
tcp        0      0 0.0.0.0:757                 0.0.0.0:*                   LISTEN      13295/rpc.statd     
tcp        0      0 127.0.0.1:25                0.0.0.0:*                   LISTEN      1049/master         
tcp        0      0 :::80                       :::*                        LISTEN      1147/httpd          
tcp        0      0 :::22                       :::*                        LISTEN      994/sshd            
tcp        0      0 :::443                      :::*                        LISTEN      1147/httpd          
udp        0      0 0.0.0.0:2049                0.0.0.0:*                               -                   
udp        0      0 0.0.0.0:687                 0.0.0.0:*                               13230/rpc.rquotad   
udp        0      0 0.0.0.0:702                 0.0.0.0:*                               13246/rpc.mountd    
udp        0      0 0.0.0.0:68                  0.0.0.0:*                               871/dhclient        
udp        0      0 0.0.0.0:751                 0.0.0.0:*                               13295/rpc.statd     
udp        0      0 0.0.0.0:111                 0.0.0.0:*                               13167/portmap       
udp        0      0 0.0.0.0:754                 0.0.0.0:*                               13295/rpc.statd     
udp        0      0 0.0.0.0:33662               0.0.0.0:*                               -              V



RESTART NFS

/etc/rc.d/init.d/nfs restart

    
    Shutting down NFS mountd: [FAILED]
    Shutting down NFS daemon: [  OK  ]
    Shutting down NFS quotas: [  OK  ]
    Shutting down NFS services:  [FAILED]
    Starting NFS services:  [  OK  ]
    Starting NFS quotas: [  OK  ]
    Starting NFS daemon: [  OK  ]
    Starting NFS mountd: [  OK  ]


MOUNTD IS FIXED:

netstat -ntulp | grep mountd

    tcp        0      0 0.0.0.0:32767               0.0.0.0:*                   LISTEN      31022/rpc.mountd    
    udp        0      0 0.0.0.0:32767               0.0.0.0:*                               31022/rpc.mountd


netstat -ntulp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address               Foreign Address             State       PID/Program name   
tcp        0      0 0.0.0.0:2049                0.0.0.0:*                   LISTEN      -                   
tcp        0      0 0.0.0.0:37415               0.0.0.0:*                   LISTEN      -                   
tcp        0      0 0.0.0.0:3306                0.0.0.0:*                   LISTEN      1233/mysqld         
tcp        0      0 0.0.0.0:111                 0.0.0.0:*                   LISTEN      13167/portmap       
tcp        0      0 0.0.0.0:660                 0.0.0.0:*                   LISTEN      31008/rpc.rquotad   
tcp        0      0 0.0.0.0:757                 0.0.0.0:*                   LISTEN      13295/rpc.statd     
tcp        0      0 127.0.0.1:25                0.0.0.0:*                   LISTEN      1049/master         
tcp        0      0 0.0.0.0:32767               0.0.0.0:*                   LISTEN      31022/rpc.mountd    
tcp        0      0 :::80                       :::*                        LISTEN      1147/httpd          
tcp        0      0 :::22                       :::*                        LISTEN      994/sshd            
tcp        0      0 :::443                      :::*                        LISTEN      1147/httpd          
udp        0      0 0.0.0.0:2049                0.0.0.0:*                               -                   
udp        0      0 0.0.0.0:657                 0.0.0.0:*                               31008/rpc.rquotad   
udp        0      0 0.0.0.0:68                  0.0.0.0:*                               871/dhclient        
udp        0      0 0.0.0.0:751                 0.0.0.0:*                               13295/rpc.statd     
udp        0      0 0.0.0.0:111                 0.0.0.0:*                               13167/portmap       
udp        0      0 0.0.0.0:754                 0.0.0.0:*                               13295/rpc.statd     
udp        0      0 0.0.0.0:33662               0.0.0.0:*                               -                   
udp        0      0 0.0.0.0:32767               0.0.0.0:*                               31022/rpc.mountd



2. OPEN NFS PORTS FOR THE @sc-masters GROUP ON EC2

# PORTMAP
ec2-authorize default -p 111 -P tcp
ec2-authorize default -p 111 -P udp

# NFS
ec2-authorize default -p 2049 -P udp
ec2-authorize default -p 2049 -P tcp

# MOUNTD
ec2-authorize default -p 32767 -P udp
ec2-authorize default -p 32767 -P tcp



NB: CHECK LATER TO SEE IF STATD OR QUOTAD NEED TO BE FIXED


###NB: DON'T NEED TO OPEN status OR nlockmgr PORTS
####(CHECKED BY RESTARTING AND COULD STILL MOUNT ON AQ-7 EVEN THOUGH PORTS HAD CHANGED)




3. ON AQ-7, ADDED THE FOLLOWING LINE WITH vers=3 TO /etc/fstab:

cp /etc/fstab /etc/fstab.bkp

emacs /etc/fstab

    /dev/sda1  /         ext3    defaults        1 1
    none       /dev/pts  devpts  gid=5,mode=620  0 0
    none       /proc     proc    defaults        0 0
    none       /sys      sysfs   defaults        0 0
    /swapfile  none      swap    sw              0 0
    /dev/sdh   /data     ext3    noatime 0       0
    /dev/sdi   /nethome      ext3    defaults        0 0
    /nethome/mysql/etc/mysql /etc/mysql     none bind
    /nethome/mysql/lib/mysql /var/lib/mysql none bind
    /nethome/mysql/log/mysql /var/log/mysql none bind
    ip-10-124-245-118:/data  /cluster/data nfs nfsvers=3,defaults 0 0
    /dev/sdh  /data      nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0



4. ON AQ-7, SET UP EXPORT TO MASTER IN /etc/exports 

emacs /etc/exports

    /data ip-10-124-245-118.ec2.internal(async,no_root_squash,no_subtree_check,rw)



5. RESTART portmap AND nfs

service portmap restart
service nfs restart


    service nfs restart
        Stopping portmap: [  OK  ]
        Starting portmap: [  OK  ]
    
    service nfs restart
    
        Shutting down NFS mountd: [  OK  ]
        Shutting down NFS daemon: [  OK  ]
        Shutting down NFS quotas: [  OK  ]
        Shutting down NFS services:  [  OK  ]
        Starting NFS services:  [  OK  ]
        Starting NFS quotas: [  OK  ]
        Starting NFS daemon: [  OK  ]
        Starting NFS mountd: [  OK  ]



6. ON MASTER, SCAN AQ-7'S PORTS

BEFORE OPENING PORTS IN STEP 2 ABOVE:

nmap -P0 10.127.158.202
    
    Interesting ports on ip-10-127-158-202.ec2.internal (10.127.158.202):
    Not shown: 995 filtered ports
    PORT     STATE  SERVICE
    22/tcp   open   ssh
    80/tcp   open   http
    443/tcp  open   https
    3306/tcp open   mysql
    8443/tcp closed https-alt

AFTER OPENING PORTS:

nmap -P0 10.127.158.202

    Interesting ports on ip-10-127-158-202.ec2.internal (10.127.158.202):
    Not shown: 993 filtered ports
    PORT     STATE  SERVICE
    22/tcp   open   ssh
    80/tcp   open   http
    111/tcp  open   rpcbind ****
    443/tcp  open   https
    2049/tcp open   nfs     ****
    3306/tcp open   mysql
    8443/tcp closed https-alt



7. CHECK MOUNTS

ON AQ-7, CHECK EXPORTS

showmount -a

    All mount points on ip-10-127-158-202:

ON MASTER, CHECK EXPORTS FROM AQ-7:


showmount -e ip-10-127-158-202

    Export list for ip-10-127-158-202:
    /data ip-10-124-245-118.ec2.internal



8. ON MASTER, MOUNT /cluster/data FROM AQ-7 USING '-o nfsvers=3':

mkdir -p /aquarius/data
umount /aquarius/data
mount -o nfsvers=3 -t nfs ip-10-127-158-202:/data /aquarius/data



9. ON AQ-7, CREATE /aquarius AND LINK TO /data

mkdir /aquarius
ln -s /data/ /aquarius/data










</entry>



<entry [Tue Jan 18 17:59:44 EST 2011] NFS MOUNT OF MASTER /data VOLUME ON AQUARIUS (USING StarCluster.pm)>



RUN THIS COMMAND TO SET UP THE MOUNT:

/agua/bin/apps/cluster/starcluster.pl start \
--private /nethome/admin/.keypairs/private.pem \
--public /nethome/admin/.keypairs/public.pem \
--keyname admin-key \
--username admin \
--cluster smallcluster


TOOLS
-----

1. CHECK PORTS ON MASTER

netstat -ntulp
netstat -nap
rpcinfo -p | awk -F " " '{print $3 "\t" $4 "\t" $5}' | sort | uniq | grep -v proto

2. MOUNT USING NFS VERSION 3

mount -o nfsvers=3 -t nfs ip-10-124-245-118:/data /cluster/data



DETAILS
-------

SET NFS SHARE OF CLUSTER MASTER /data WITH AQUARIUS-7

*******
SUCCESS: DO IT USING vers=3 IN /etc/fstab
*******


1. ON MASTER, ASSIGN PERMANENT PORT NUMBER FOR mountd

ON AQ-7, GET SSH KEYFILE LOCATION FROM /nethome/admin/.starcluster/config:

cat /nethome/admin/.starcluster/config
    
    ...
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    ...

ON AQ-7, SET FIXED mountd PORT ON MASTER USING SSH:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-245-118 cat /etc/default/nfs-kernel-server

RPCMOUNTDOPTS="--port 32767 --manage-gids"


2. OPEN NFS PORTS FOR THE @sc-masters GROUP ON EC2

# PORTMAP
ec2-authorize @sc-masters -p 111 -P tcp
ec2-authorize @sc-masters -p 111 -P udp

# NFS
ec2-authorize @sc-masters -p 2049 -P udp
ec2-authorize @sc-masters -p 2049 -P tcp

# MOUNTD
ec2-authorize @sc-masters -p 32767 -P udp
ec2-authorize @sc-masters -p 32767 -P tcp


NB: DON'T NEED TO OPEN status OR nlockmgr PORTS
(CHECKED BY RESTARTING AND COULD STILL MOUNT ON AQ-7 EVEN THOUGH PORTS HAD CHANGED)



3. ON MASTER, ADDED THE FOLLOWING LINE WITH vers=3 TO /etc/fstab:

emacs /etc/fstab

    <!---->
    <!--# /etc/fstab: static file system information.                             # <file system> <mount point>   <type>  <options>  <dump>  <pass>         proc          /proc           proc    defaults        0       0-->
    <!--/dev/sda1     /               ext3    defaults        0       0-->
    <!--/dev/sdb      /mnt            ext3    defaults        0       0-->
    <!--#/dev/sdj1    /data           auto    noauto,defaults 0       0-->
    <!--/dev/sdj1     /data           nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0-->
    <!---->


4. ON MASTER, SET UP EXPORT IN /etc/exports 

cat /etc/exports

    /home ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /opt/sge6 ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
*** /data ip-10-127-158-202.ec2.internal(async,no_root_squash,no_subtree_check,rw)



5. RESTART portmap AND nfs

service portmap restart
service nfs restart
#/etc/init.d/nfs restart



6. ON AQ-7, SCAN MASTER'S PORTS

nmap -P0 10.124.245.118

    Interesting ports on ip-10-124-245-118.ec2.internal (10.124.245.118):
    Not shown: 1677 filtered ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    111/tcp  open  rpcbind
    2049/tcp open  nfs


7. CHECK MOUNTS

ON MASTER, CHECK EXPORTS

showmount -a
    All mount points on ip-10-124-245-118:
    10.124.247.224:/data
    10.124.247.224:/home
    10.124.247.224:/opt/sge6
    10.127.158.202:/data


ON AQ-7, CHECK IF MASTER'S MOUNT IS SEEN

showmount -e ip-10-124-245-118

Export list for ip-10-124-245-118:
/data     ip-10-127-158-202.ec2.internal,ip-10-124-247-224.ec2.internal
/opt/sge6 ip-10-124-247-224.ec2.internal
/home     ip-10-124-247-224.ec2.internal



8. ON AQ-7, MOUNT /cluster/data FROM MASTER USING '-o nfsvers=3':

umount /cluster/data
mount -o nfsvers=3 -t nfs ip-10-124-245-118:/data /cluster/data

    OK!


NOTES
-----


CREATED /etc/default/nfs-kernel-server ON AQUARIUS
-----------------------------------------------

LAUNCHED INSTANCE aquarius-75 AND CONFIRMED THAT IS ABSENT:

    cat: /etc/default/nfs-kernel-server: No such file or directory


NB: COPY OF /etc/default/nfs-kernel-server ON MASTER:

cat /etc/default/nfs-kernel-server

    # Number of servers to start up
    RPCNFSDCOUNT=8
    
    # Runtime priority of server (see nice(1))
    RPCNFSDPRIORITY=0
    
    # Options for rpc.mountd.
    # If you have a port-based firewall, you might want to set up
    # a fixed port here using the --port option. For more information, 
    # see rpc.mountd(8) or http://wiki.debian.org/?SecuringNFS
    # RPCMOUNTDOPTS=--manage-gids
    # RPCMOUNTDOPTS="--port 32767 --manage-gids"
    #RPCMOUNTDOPTS="--port 32767 --manage-gids"
    
    # Do you want to start the svcgssd daemon? It is only required for Kerberos
    # exports. Valid alternatives are "yes" and "no"; the default is "no".
    NEED_SVCGSSD=
    
    # Options for rpc.svcgssd.
    RPCSVCGSSDOPTS=
    RPCMOUNTDOPTS="--port 32767 --manage-gids"




NFS PROBLEM - SET TO VERSION 3
------------------------------



RSYNC OF hg19-bowtie.tar.gz (4 GB) FROM /data TO /scvolumes/data FAILS AT 2 GB:

time rsync -av /data/hg19-bowtie.tar.gz /scvolumes/data

    building file list ... done
    hg19-bowtie.tar.gz
    rsync: writefd_unbuffered failed to write 4 bytes [sender]: Broken pipe (32)
    rsync: write failed on "/scvolumes/data/hg19-bowtie.tar.gz": File too large (27)
    rsync error: error in file IO (code 11) at receiver.c(253) [receiver=2.6.8]
    rsync: connection unexpectedly closed (57 bytes received so far) [generator]
    rsync error: error in rsync protocol data stream (code 12) at io.c(463) [generator=2.6.8]
    rsync: connection unexpectedly closed (30 bytes received so far) [sender]
    rsync error: error in rsync protocol data stream (code 12) at io.c(463) [sender=2.6.8]
    
    real    5m52.135s
    user    0m4.397s
    sys     0m0.925s

NB:
        -av        The  files  are  transferred in "archive" mode, which ensures that sym-
       bolic links, devices, attributes,  permissions,  ownerships,  etc.  are
       preserved  in  the transfer.  


STRAIGHT COPY ALSO FAILS AT 2 GB:

time cp /data/hg19-bowtie.tar.gz /scvolumes/data

    File size limit exceeded
    
    real    4m35.126s
    user    0m1.183s
    sys     0m1.200s



NOT A quota PROBLEM:

ON MASTER:

ulimit

    unlimited



ADD NFS VERSION 3 TO /etc/fstab AND REMOUNT:

cat /etc/fstab

<!---->
<!--# /etc/fstab: static file system information.-->
<!--# <filesystem> <mountpoint> <type> <options> <dump> <pass>-->
<!--/dev/sda1  /         ext3    defaults        1 1-->
<!--none       /dev/pts  devpts  gid=5,mode=620  0 0-->
<!--none       /proc     proc    defaults        0 0-->
<!--none       /sys      sysfs   defaults        0 0-->
<!--/swapfile  none      swap    sw              0 0-->
<!--/dev/sdh        /data   ext3    noatime 0       0-->
<!--/dev/sdi   /nethome      ext3    defaults        0 0-->
<!--/nethome/mysql/etc/mysql /etc/mysql     none bind-->
<!--/nethome/mysql/lib/mysql /var/lib/mysql none bind-->
<!--/nethome/mysql/log/mysql /var/log/mysql none bind-->
<!---->

ADD THIS LINE:

ec2-72-44-59-38.compute-1.amazonaws.com:/data /cluster/data nfs nfsvers=3,defaults 0 0


UNMOUNT /scvolumes/data:

umount /scvolumes/data


AND REMOUNT AT /cluster/data:

mkdir /cluster/data
mount -t nfs ip-10-124-245-118:/data /cluster/data


BUT cp FAILED AGAIN AT 2.0 GB:

cp /data/hg19-bowtie.tar.gz  /cluster/data
File size limit exceeded

ls -al hg19-bowtie.tar.gz 

    -rw-r--r-- 1 root root 2140086272 2011-01-10 18:56 hg19-bowtie.tar.gz


scp WORKED OKAY SO MUST BE AN NFS PROBLEM (I.E., NOT A MASTER FILE SYSTEM PROBLEM):

scp -i /nethome/admin/.starcluster/id_rsa-admin-key -r /data/hg19-bowtie.tar.gz root@ip-10-124-245-118:/cluster/data 

    hg19-bowtie.tar.gz                                              84% 2712MB   1.1MB/s   07:07 ETA



RSYNC WAS SLOW ABOUT TWICE AS SLOW AS SCP



nfsstat VERSION ON AQ-7:

nfsstat --version

    nfsstat: 1.1.6


nfsstat VERSION ON MASTER:

nfsstat --version
    
    nfsstat: 1.0.9



LOOK FOR NFS-RELATED FILES ON MASTER:

locate nfs

    ...
    /lib/modules/2.6.31-14-server/kernel/fs/nfs
    /lib/modules/2.6.31-14-server/kernel/fs/nfs_common
    ...


USING nfsstat:

nfsstat --help
Usage: nfsstat [OPTION]...

  -m, --mounts          Show statistics on mounted NFS filesystems
  -c, --client          Show NFS client statistics
  -s, --server          Show NFS server statistics
  -2                    Show NFS version 2 statistics
  -3                    Show NFS version 3 statistics
  -4                    Show NFS version 4 statistics
  -o [facility]         Show statistics on particular facilities.
     nfs                NFS protocol information
     rpc                General RPC information
     net                Network layer statistics
     fh                 Usage information on the server's file handle cache
     rc                 Usage information on the server's request reply cache
     all                Select all of the above
  -v, --verbose, --all  Same as '-o all'
  -r, --rpc             Show RPC statistics
  -n, --nfs             Show NFS statistics
  -Z[#], --sleep[=#]    Collects stats until interrupted.
                            Cumulative stats are then printed
                            If # is provided, stats will be output every
                            # seconds.
  -S, --since file      Shows difference between current stats and those in 'file'
  -l, --list            Prints stats in list format
  --version             Show program version
  --help                What you just did



ON AQ-7:

nfsstat -m

    /cluster/data from ip-10-124-245-118:/data
    Flags: rw,vers=2,rsize=8192,wsize=8192,hard,proto=tcp,timeo=600,retrans=2,sec=sys,addr=ip-10-124-245-118


rw,vers=2,rsize=32768,wsize=32768,hard,proto=tcp


BUT NO OUTPUT ON MASTER:

nfsstat -m

    < NOTHING>



SO IT IS SET AS VERSION 2 IN THE FLAGS. HOW TO RESET THE vers= FLAG?

CHECK BOTH VERSIONS ARE WORKING NORMALLY ON MASTER:

rpcinfo -u localhost nfs 3
    program 100003 version 3 ready and waiting
rpcinfo -u localhost nfs 2
    program 100003 version 2 ready and waiting




TRIED TO FORCE MOUNT CONFIGURATION ON MASTER

REMOUNT ON MASTER USING THE nfsvers=3 OPTION IN /etc/fstab
http://linux.die.net/man/5/nfs

EDIT /etc/fstab
    
    /dev/sda1  /         ext3    defaults        1 1
    none       /dev/pts  devpts  gid=5,mode=620  0 0
    none       /proc     proc    defaults        0 0
    none       /sys      sysfs   defaults        0 0
    /swapfile  none      swap    sw              0 0
    /dev/sdh        /data   ext3    noatime 0       0
    /dev/sdi   /nethome      ext3    defaults        0 0
    /nethome/mysql/etc/mysql /etc/mysql     none bind
    /nethome/mysql/lib/mysql /var/lib/mysql none bind
    /nethome/mysql/log/mysql /var/log/mysql none bind
    ip-10-124-245-118:/data  /cluster/data nfs nfsvers=3,defaults 0 0



USE mount OPTION '-O':

THIS DIDN'T WORK
mount -o vers=3 -t nfs ip-10-124-245-118:/data /cluster/data


    mount: mount to NFS server 'ip-10-124-245-118' failed: RPC Error: Program/version mismatch.

BUT THIS DID

umount /cluster/data
mount -O vers=3 -t nfs ip-10-124-245-118:/data /cluster/data

    OK

####mount -F nfs -o vers=3,proto=udp,sec=sys,hard,intr,link,symlink,rsize=32768,wsize=32768,retrans=5,timeo=10 server:/export/dir /mountpoint


ALTHOUGH nfsstat -m GAVE THIS PROBLEM:

nfsstat -m
/cluster/data from ip-10-124-245-118:/data
 Flags: rw,vers=2,rsize=8192,wsize=8192,hard,proto=tcp,timeo=600,retrans=2,sec=sys,addr=ip-10-124-245-118
 
 
AND THE cp FAILED OVER NFS:

cp /data/hg19-bowtie.tar.gz /cluster/data/
    
    File size limit exceeded
 

TRIED mount WITH -o nfsvers=3 AND GOT THE SAME 'RPC Error: Program/version mismatch' ERROR:

umount /cluster/data
mount -o nfsvers=3 -t nfs ip-10-124-245-118:/data /cluster/data

    mount: mount to NFS server 'ip-10-124-245-118' failed: RPC Error: Program/version mismatch.



*******
SUCCESS: DO IT USING vers=3 IN /etc/fstab
*******

ON MASTER, ADDED vers=3 TO /etc/fstab ON MASTER AND RESTARTED nfs


emacs /etc/fstab


    <!---->
    <!--# /etc/fstab: static file system information.                                               -->
    <!--# <file system> <mount point>   <type>  <options>  <dump>  <pass>                                                                                 -->
    <!--proc          /proc           proc    defaults        0       0-->
    <!--/dev/sda1     /               ext3    defaults        0       0-->
    <!--/dev/sdb      /mnt            ext3    defaults        0       0-->
    <!--#/dev/sdj1    /data           auto    noauto,defaults 0       0-->
    <!--/dev/sdj1     /data           nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0-->
    <!---->


THEN RESTARTED NFS:

/etc/init.d/nfs restart


MOUNTED /cluster/data OKAY ON AQ-7

umount /cluster/data
mount -o nfsvers=3 -t nfs ip-10-124-245-118:/data /cluster/data

    OK!


cp /data/hg19-bowtie.tar.gz  /cluster/data/


    OK!!


COPIES FINE AND FAST TO BOOT (DUE TO INCREASED rsize AND wsize FROM 8K TO 32K)




ABOUT RSIZE AND WSIZE

4.2 Optimizing NFS
http://www.linuxselfhelp.com/howtos/NFS/NFS-HOWTO-4.html

Normally, if no rsize and wsize options are specified NFS will read and write in chunks of 4096 or 8192 bytes. Some combinations of Linux kernels and network cards cannot handle that large blocks, and it might not be optimal, anyway. So we'll want to experiment and find a rsize and wsize that works and is as fast as possible. You can test the speed of your options with some simple commands. Given the mount command above and that you have write access to the disk you can do this to test the sequential write performance:

time dd if=/dev/zero of=/mnt/testfile bs=16k count=4096
This creates a 64Mb file of zeroed bytes (which should be large enough that caching is no significant part of any performance perceived, use a larger file if you have a lot of memory). Do it a couple (5-10?) of times and average the times. It is the `elapsed' or `wall clock' time that's most interesting in this connection. Then you can test the read performance by reading back the file:

time dd if=/mnt/testfile of=/dev/null bs=16k

do that a couple of times and average. Then umount, and mount again with a larger rsize and wsize. They should probably be multiples of 1024, and not larger than 16384 bytes since that's the maximum size in NFS version 2. Directly after mounting with a larger size cd into the mounted file system and do things like ls, explore the fs a bit to make sure everything is as it should. If the rsize/wsize is too large the symptoms are very odd and not 100% obvious. A typical symptom is incomplete file lists when doing 'ls', and no error messages. Or reading files failing mysteriously with no error messages. After establishing that the given rsize/wsize works you can do the speed tests again. Different server platforms are likely to have different optimal sizes. SunOS and Solaris is reputedly a lot faster with 4096 byte blocks than with anything else.

Newer Linux kernels (since 1.3 sometime) perform read-ahead for rsizes larger or equal to the machine page size. On Intel CPUs the page size is 4096 bytes. Read ahead will significantly increase the NFS read performance. So on a Intel machine you will want 4096 byte rsize if at all possible.

Remember to edit /etc/fstab to reflect the rsize/wsize you found.

A trick to increase NFS write performance is to disable synchronous writes on the server. The NFS specification states that NFS write requests shall not be considered finished before the data written is on a non-volatile medium (normally the disk). This restricts the write performance somewhat, asynchronous writes will speed NFS writes up. The Linux nfsd has never done synchronous writes since the Linux file system implementation does not lend itself to this, but on non-Linux servers you can increase the performance this way with this in your exports file:

/dir    -async,access=linuxbox

or something similar. Please refer to the exports man page on the machine in question. Please note that this increases the risk of data loss.






rsync
-----
http://www.manpagez.com/man/1/rsync/

OPTIONS SUMMARY

       Here is a short summary of the options available in rsync. Please refer
       to the detailed description below for a complete description.

        -v, --verbose               increase verbosity
        -q, --quiet                 suppress non-error messages
            --no-motd               suppress daemon-mode MOTD (see caveat)
        -c, --checksum              skip based on checksum, not mod-time & size
        -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
            --no-OPTION             turn off an implied OPTION (e.g. --no-D)
        -r, --recursive             recurse into directories
        -R, --relative              use relative path names
            --no-implied-dirs       don't send implied dirs with --relative
        -b, --backup                make backups (see --suffix & --backup-dir)
            --backup-dir=DIR        make backups into hierarchy based in DIR
            --suffix=SUFFIX         backup suffix (default ~ w/o --backup-dir)
        -u, --update                skip files that are newer on the receiver
            --inplace               update destination files in-place
            --append                append data onto shorter files
            --append-verify         --append w/old data in file checksum
        -d, --dirs                  transfer directories without recursing
        -l, --links                 copy symlinks as symlinks
        -L, --copy-links            transform symlink into referent file/dir
            --copy-unsafe-links     only "unsafe" symlinks are transformed
            --safe-links            ignore symlinks that point outside the tree
        -k, --copy-dirlinks         transform symlink to dir into referent dir
        -K, --keep-dirlinks         treat symlinked dir on receiver as dir
        -H, --hard-links            preserve hard links
        -p, --perms                 preserve permissions
        -E, --executability         preserve executability
            --chmod=CHMOD           affect file and/or directory permissions
        -A, --acls                  preserve ACLs (implies -p)
        -X, --xattrs                preserve extended attributes
        -o, --owner                 preserve owner (super-user only)
        -g, --group                 preserve group
            --devices               preserve device files (super-user only)
            --specials              preserve special files
        -D                          same as --devices --specials
        -t, --times                 preserve modification times
        -O, --omit-dir-times        omit directories from --times
            --super                 receiver attempts super-user activities
            --fake-super            store/recover privileged attrs using xattrs
        -S, --sparse                handle sparse files efficiently
        -n, --dry-run               perform a trial run with no changes made
        -W, --whole-file            copy files whole (w/o delta-xfer algorithm)
        -x, --one-file-system       don't cross filesystem boundaries
        -B, --block-size=SIZE       force a fixed checksum block-size
        -e, --rsh=COMMAND           specify the remote shell to use
            --rsync-path=PROGRAM    specify the rsync to run on remote machine
            --existing              skip creating new files on receiver
            --ignore-existing       skip updating files that exist on receiver
            --remove-source-files   sender removes synchronized files (non-dir)
            --del                   an alias for --delete-during
            --delete                delete extraneous files from dest dirs
            --delete-before         receiver deletes before transfer (default)
            --delete-during         receiver deletes during xfer, not before
            --delete-delay          find deletions during, delete after
            --delete-after          receiver deletes after transfer, not before
            --delete-excluded       also delete excluded files from dest dirs
            --ignore-errors         delete even if there are I/O errors
            --force                 force deletion of dirs even if not empty
            --max-delete=NUM        don't delete more than NUM files
            --max-size=SIZE         don't transfer any file larger than SIZE
            --min-size=SIZE         don't transfer any file smaller than SIZE
            --partial               keep partially transferred files
            --partial-dir=DIR       put a partially transferred file into DIR
            --delay-updates         put all updated files into place at end
        -m, --prune-empty-dirs      prune empty directory chains from file-list
            --numeric-ids           don't map uid/gid values by user/group name
            --timeout=SECONDS       set I/O timeout in seconds
            --contimeout=SECONDS    set daemon connection timeout in seconds
        -I, --ignore-times          don't skip files that match size and time
            --size-only             skip files that match in size
            --modify-window=NUM     compare mod-times with reduced accuracy
        -T, --temp-dir=DIR          create temporary files in directory DIR
        -y, --fuzzy                 find similar file for basis if no dest file
            --compare-dest=DIR      also compare received files relative to DIR
            --copy-dest=DIR         ... and include copies of unchanged files
            --link-dest=DIR         hardlink to files in DIR when unchanged
        -z, --compress              compress file data during the transfer
            --compress-level=NUM    explicitly set compression level
            --skip-compress=LIST    skip compressing files with suffix in LIST
        -C, --cvs-exclude           auto-ignore files in the same way CVS does
        -f, --filter=RULE           add a file-filtering RULE
        -F                          same as --filter='dir-merge /.rsync-filter'
                                    repeated: --filter='- .rsync-filter'
            --exclude=PATTERN       exclude files matching PATTERN
            --exclude-from=FILE     read exclude patterns from FILE
            --include=PATTERN       don't exclude files matching PATTERN
            --include-from=FILE     read include patterns from FILE
            --files-from=FILE       read list of source-file names from FILE
        -0, --from0                 all *from/filter files are delimited by 0s
        -s, --protect-args          no space-splitting; wildcard chars only
            --address=ADDRESS       bind address for outgoing socket to daemon
            --port=PORT             specify double-colon alternate port number
            --sockopts=OPTIONS      specify custom TCP options
            --blocking-io           use blocking I/O for the remote shell
            --stats                 give some file-transfer stats
        -8, --8-bit-output          leave high-bit chars unescaped in output
        -h, --human-readable        output numbers in a human-readable format
            --progress              show progress during transfer
        -P                          same as --partial --progress
        -i, --itemize-changes       output a change-summary for all updates
            --out-format=FORMAT     output updates using the specified FORMAT
            --log-file=FILE         log what we're doing to the specified FILE
            --log-file-format=FMT   log updates using the specified FMT
            --password-file=FILE    read daemon-access password from FILE
            --list-only             list the files instead of copying them
            --bwlimit=KBPS          limit I/O bandwidth; KBytes per second
            --write-batch=FILE      write a batched update to FILE
            --only-write-batch=FILE like --write-batch but w/o updating dest
            --read-batch=FILE       read a batched update from FILE
            --protocol=NUM          force an older protocol version to be used
            --iconv=CONVERT_SPEC    request charset conversion of filenames
            --checksum-seed=NUM     set block/file checksum seed (advanced)
        -4, --ipv4                  prefer IPv4
        -6, --ipv6                  prefer IPv6
            --version               print version number
       (-h) --help                  show this help (see below for -h comment)




USAGE

       You use rsync in the same way you use rcp. You must  specify  a  source
       and a destination, one of which may be remote.

       Perhaps the best way to explain the syntax is with some examples:

              rsync -t *.c foo:src/


       This would transfer all files matching the pattern *.c from the current
       directory to the directory src on the machine foo. If any of the  files
       already  exist on the remote system then the rsync remote-update proto-
       col is used to update the file by sending only the differences. See the
       tech report for details.

              rsync -avz foo:src/bar /data/tmp


       This would recursively transfer all files from the directory src/bar on
       the machine foo into the /data/tmp/bar directory on the local  machine.
       The  files  are  transferred in "archive" mode, which ensures that sym-
       bolic links, devices, attributes,  permissions,  ownerships,  etc.  are
       preserved  in  the transfer.  Additionally, compression will be used to
       reduce the size of data portions of the transfer.

              rsync -avz foo:src/bar/ /data/tmp


       A trailing slash on the source changes this behavior to avoid  creating
       an  additional  directory level at the destination.  You can think of a
       trailing / on a source as meaning "copy the contents of this directory"
       as  opposed  to  "copy  the  directory  by name", but in both cases the
       attributes of the containing directory are transferred to the  contain-
       ing  directory on the destination.  In other words, each of the follow-
       ing commands copies the files in the same way, including their  setting
       of the attributes of /dest/foo:

              rsync -av /src/foo /dest
              rsync -av /src/foo/ /dest/foo


       Note  also  that  host  and  module references don't require a trailing
       slash to copy the contents of the default directory.  For example, both
       of these copy the remote directory's contents into "/dest":

              rsync -av host: /dest
              rsync -av host::module /dest


       You  can  also  use rsync in local-only mode, where both the source and
       destination don't have a ':' in the name. In this case it behaves  like
       an improved copy command.

       Finally,  you can list all the (listable) modules available from a par-
       ticular rsync daemon by leaving off the module name:

              rsync somehost.mydomain.com::


From the user's perspective, a daemon transfer via a remote-shell  con-
       nection uses nearly the same command-line syntax as a normal rsync-dae-
       mon transfer, with the only exception being that  you  must  explicitly
       set the remote shell program on the command-line with the --rsh=COMMAND
       option.  (Setting the RSYNC_RSH in the environment  will  not  turn  on
       this functionality.)  For example:

           rsync -av --rsh=ssh host::module /dest


       If you need to specify a different remote-shell user, keep in mind that
       the user@ prefix in front of the  host  is  specifying  the  rsync-user
       value  (for  a  module  that requires user-based authentication).  This
       means that you must give the '-l user' option to  ssh  when  specifying
       the remote-shell, as in this example that uses the short version of the
       --rsh option:

           rsync -av -e "ssh -l ssh-user" rsync-user@host::module /dest


       The "ssh-user" will be used at the ssh level; the "rsync-user" will  be
       used to log-in to the "module".



