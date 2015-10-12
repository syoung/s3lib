apps.starcluster.archive.1

<entry [Wed Jan 19 00:56:10 EST 2011] TEST CREATE IMAGE OF MASTER AND SAVE TO JGILBERT S3>

1. CREATE STARCLUSTER BUCKET IN S3 USING ELASTICFOX

SET ENVIRONMENT VARIABLES FOR s3cmd
(SEE /home/s3sync/README.txt)

export AWS_ACCESS_KEY_ID=AKIAILLN2EEVC7TPWX7A
export AWS_SECRET_ACCESS_KEY=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


CREATE starcluster BUCKET

s3cmd createbucket jgilbert-starcluster
s3cmd listbuckets
    
    jgilbert-starcluster


2. CREATE IMAGE OF MASTER

starcluster  -c /nethome/admin/.starcluster/config createimage i-6f21d203 starmaster-1 jgilbert-starcluster

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    cli.py:506 - WARNING - Instance i-6f21d203 is a StarCluster instance
    
    cli.py:510 - WARNING - Creating an image from a StarCluster instance can lead to problems when attempting to use the resulting image with StarCluster later on
    
    cli.py:517 - WARNING - The recommended way to re-image a StarCluster AMI is to launch a single instance using either ElasticFox, the EC2 command line tools, or the AWS management console. Then login to the instance, modify it, and use this command to create a new AMI from it.


#ec2-describe-instance-attribute i-6f21d203 
#
#ec2-modify-image-attribute  ami-6a788f03 --launch-permission --add 684733399587
#
#    launchPermission        ami-6a788f03    ADD     userId  684733399587
#
#SEE WHO CAN LAUNCH THE INSTANCE:
#
#ec2-describe-image-attribute ami-6a788f03    --launch-permission







NOTES
-----

/home/s3sync/README_s3cmd.txt

    ... s3sync and s3cmd complement each other. s3sync is useful to perform serious synchronization operations, and s3cmd allows you to do simple things such as bucket management, listing, transferring single files, and the like.
   
   Here is the usage, with examples to follow.
   
   s3cmd.rb [options] < command> [arg(s)]           version 1.0.0
     --help    -h        --verbose     -v     --dryrun    -n
     --ssl     -s        --debug       -d
   
   Commands:
   s3cmd.rb  listbuckets  [headers]
   s3cmd.rb  createbucket|deletebucket  < bucket>  [headers]
   s3cmd.rb  list  < bucket>[:prefix]  [max/page]  [delimiter]  [headers]
   s3cmd.rb  delete  < bucket>:key  [headers]
   s3cmd.rb  deleteall  < bucket>[:prefix]  [headers]
   s3cmd.rb  get|put  < bucket>:key  < file>  [headers]



$ starcluster createimage i-9999999 my-new-image mybucket

In this command, i-99999999 is the instance id of the instance you wish to create a new image from. my-new-image is the name of the image (or AMI prefix) and mybucket is the bucket in S3 to store your new AMI in.

After this command completes it should print out the new AMI id that you can now use in the node_image_id/master_image_id settings in your cluster templates.


Creating a New AMI From the StarCluster AMI
http://web.mit.edu/stardev/cluster/docs/create_new_ami.html

The StarCluster base AMIs are meant to be fairly minimal in terms of the software installed. If you’d like to have an additional set of software installed on the AMI you can use StarCluster to create a new version of the StarCluster AMIs.

To do this, use either ElasticFox or the Amazon Web Services console to start a single instance of either the 32bit or 64bit StarCluster AMI. Once this instance has come up, login and customize the software installed on the AMI using either apt-get or by manually installing the software from source.

Once you’ve finished customizing the software installed on the instance, you can then run StarCluster’s createimage command to create a new AMI.

$ starcluster createimage i-9999999 my-new-image mybucket
In this command, i-99999999 is the instance id of the instance you wish to create a new image from. my-new-image is the name of the image (or AMI prefix) and mybucket is the bucket in S3 to store your new AMI in.

After this command completes it should print out the new AMI id that you can now use in the node_image_id/master_image_id settings in your cluster templates.


</entry>



<entry [Wed Jan 19 00:56:09 EST 2011] DOWNLOAD WITH git>


git clone https://github.com/jtriley/StarCluster.git

****

1. SET UP DEVEL INSTANCE OF PYTHON

(starcluster)$ python setup.py develop

Using 'develop' instead of 'install' has the advantage that doing a 'git 
pull' will update the code without needing to rerun setup.py.


NOTES
-----


Justin Riley jtriley at MIT.EDU 
Sun Dec 5 20:35:10 EST 2010
Previous message: [StarCluster] Errors with Boto 2.0b3
Next message: [StarCluster] SGE issue
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
Hey Raj,

Did you run "python setup.py install" after changing to the virtualenv? 
It's picking up your /usr/local/lib/python2.6 installation rather than 
the virtualenv for some reason in the output you provided. Can you check 
whether boto 2.0b3 is installed in your virtualenv's site-packages 
(~/Envs/StarCluster/lib/python2.6/site-packages)? If you're using 
virtualenvwrapper:

$ workon StarCluster
(starcluster)$ cdsitepackages
(starcluster)$ ls
(look for boto*)

Either way try installing the latest version of boto via pip once you've 
changed into the StarCluster virtualenv:

$ workon StarCluster
(starcluster)$ pip install --upgrade boto

You should then be able to do:

(starcluster)$ python -c 'import boto; print boto.Version'
2.0b3

Also just for drill:

(starcluster)$ python setup.py develop

Using 'develop' instead of 'install' has the advantage that doing a 'git 
pull' will update the code without needing to rerun setup.py.

~Justin






</entry>



<entry [Fri Jan  7 14:21:39 EST 2011] SET UP NFS FROM MASTER TO AQUARIUS-7>

GET AQUARIUS-7'S INTERNAL IP

ec2din

AQUARIUS-7

    RESERVATION     r-e30f5d89      558277860346    default
    INSTANCE        i-b42f3fd9      ami-90af5ef9    ec2-75-101-214-196.compute-1.amazonaws.com      ip-10-127-158-202.ec2.internal     running aquarius        0               t1.micro        2010-12-24T09:51:37+0000  us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     75.101.214.196  10.127.158.202                     ebs
    BLOCKDEVICE     /dev/sda1       vol-c6e346ae    2010-12-24T09:51:40.000Z
    BLOCKDEVICE     /dev/sdh        vol-266dc84e    2010-12-24T23:03:04.000Z
    BLOCKDEVICE     /dev/sdi        vol-fa6dc892    2010-12-24T23:05:50.000Z

MASTER

    RESERVATION     r-e1af858b      558277860346    @sc-masters,@sc-smallcluster
    INSTANCE        i-2fc83843      ami-a5c42dcc    ec2-184-72-82-189.compute-1.amazonaws.com       ip-10-124-242-36.ec2.internal      running id_rsa-admin-key        0               m1.large        2011-01-06T04:42:43+0000   us-east-1a      aki-fd15f694    ari-7b739e12            monitoring-disabled     184.72.82.189   10.124.242.36                      instance-store
    BLOCKDEVICE     /dev/sdj        vol-fc5af194    2011-01-06T04:45:45.000Z

NODE 1

    RESERVATION     r-e7af858d      558277860346    @sc-smallcluster
    INSTANCE        i-29c83845      ami-a5c42dcc    ec2-75-101-251-57.compute-1.amazonaws.com       ip-10-124-243-154.ec2.internal     running id_rsa-admin-key        0               m1.large        2011-01-06T04:42:43+0000   us-east-1a      aki-fd15f694    ari-7b739e12            monitoring-disabled     75.101.251.57   10.124.243.154                     instance-store



ON CLUSTER MASTER ADD THIS LINE TO /etc/exports:

    #/data	ip-10-127-158-202.ec2.internal(rw,sync,no_subtree_check)
    /data	ip-10-127-158-202.ec2.internal(async,no_root_squash,no_subtree_check,rw)

emacs /etc/exports

    /home ip-10-124-243-154.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /opt/sge6 ip-10-124-243-154.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-124-243-154.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-127-158-202.ec2.internal(rw,sync,no_subtree_check)


RESTART NFS SERVER

/etc/init.d/nfs-kernel-server restart

    * Stopping NFS kernel daemon
      ...done.
    * Unexporting directories for NFS kernel daemon...
      ...done.
    * Exporting directories for NFS kernel daemon...
      ...done.
    * Starting NFS kernel daemon
      ...done.

exportfs

    /home           ip-10-124-243-154.ec2.internal
    /opt/sge6       ip-10-124-243-154.ec2.internal
    /data           ip-10-124-243-154.ec2.internal
    /data           ip-10-127-158-202.ec2.internal



exportfs DESCRIPTION
http://manpages.ubuntu.com/manpages/lucid/man8/exportfs.8.html

       The  exportfs command is used to maintain the current table of exported
       file systems for NFS. This list  is  kept  in  a  separate  file  named
       /var/lib/nfs/etab  which  is read by mountd when a remote host requests
       access to mount a file tree, and parts of the list which are active are
       kept in the kernel’s export table.

       Normally  this  etab  file  is  initialized  with  the list of all file
       systems named in /etc/exports by invoking exportfs -a.

       However, administrators can choose to add and  delete  individual  file
       systems without modifying /etc/exports using exportfs.
       

cat /var/lib/nfs/etab

    /data   ip-10-124-243-154.ec2.internal(rw,async,wdelay,hide,nocrossmnt,secure,no_root_squash,no_all_squash,no_subtree_check,secure_locks,acl,anonuid=65534,anongid=65534)
    /data   ip-10-127-158-202.ec2.internal(rw,async,wdelay,hide,nocrossmnt,secure,no_root_squash,no_all_squash,no_subtree_check,secure_locks,acl,anonuid=65534,anongid=65534)
    /opt/sge6       ip-10-124-243-154.ec2.internal(rw,async,wdelay,hide,nocrossmnt,secure,no_root_squash,no_all_squash,no_subtree_check,secure_locks,acl,anonuid=65534,anongid=65534)
    /home   ip-10-124-243-154.ec2.internal(rw,async,wdelay,hide,nocrossmnt,secure,no_root_squash,no_all_squash,no_subtree_check,secure_locks,acl,anonuid=65534,anongid=65534)


GET mountd ERROR MESSAGES:

tail /var/log/messages

    Jan  6 04:44:39 ubuntu kernel: [   13.261248] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
    Jan  6 04:44:39 ubuntu kernel: [   13.263245] NFSD: starting 90-second grace period
    Jan  6 04:45:47 ubuntu kernel: [   80.831679]  sdj: sdj1
    Jan  6 04:45:52 ubuntu kernel: [   85.418621] kjournald starting.  Commit interval 5 seconds
    Jan  6 04:45:52 ubuntu kernel: [   86.107949] EXT3 FS on sdj1, internal journal
    Jan  6 04:45:52 ubuntu kernel: [   86.107955] EXT3-fs: mounted filesystem with writeback data mode.
    Jan  6 05:37:30 ubuntu kernel: [ 3183.324781] nfsd: last server has exited, flushing export cache
    Jan  6 05:37:31 ubuntu kernel: [ 3184.393001] svc: failed to register lockdv1 RPC service (errno 97).
    Jan  6 05:37:31 ubuntu kernel: [ 3184.394088] NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
    Jan  6 05:37:31 ubuntu kernel: [ 3184.394104] NFSD: starting 90-second grace period


http://www.cyberciti.biz/tips/ubuntu-linux-nfs-client-configuration-to-mount-nfs-share.html



RESTART PORTMAP ON MASTER:

/etc/init.d/portmap restart

    portmap start/running, process 597

    Rather than invoking init scripts through /etc/init.d, use the service(8)
    utility, e.g. service portmap restart
    
    Since the script you are attempting to invoke has been converted to an
    Upstart job, you may also use the restart(8) utility, e.g. restart portmap







MOUNT MASTER'S NFS SHARE ON AQUARIUS-7:

CHECK MOUNT IS AVAILABLE

showmount -e ip-10-124-242-36.ec2.internal

showmount 

    Hosts on ip-10-127-158-202:


RESTART PORTMAP

/etc/init.d/portmap restart
Stopping portmap: [FAILED]
Starting portmap: [  OK  ]


RESTART NFS

/etc/init.d/nfs restart

    Shutting down NFS mountd: [FAILED]
    Shutting down NFS daemon: [FAILED]
    Shutting down NFS quotas: [FAILED]
    Shutting down NFS services:  [FAILED]
    Starting NFS services:  [  OK  ]
    Starting NFS quotas: [  OK  ]
    Starting NFS daemon: [  OK  ]
    Starting NFS mountd: [  OK  ]
    Starting RPC idmapd: [  OK  ]


CREATE FOLDER FOR MOUNT:

mkdir /mnt


MOUNT THE REMOTE FOLDER:

# HANGS: mount ip-10-124-242-36.ec2.internal:/data /mnt

mount -t ext2 ip-10-124-242-36.ec2.internal:/data /mnt

    mount: special device ip-10-124-242-36.ec2.internal:/data does not exist

dmesg | tail

    ...
    sdj: unknown partition table
    sdj: unknown partition table
    sdj: sdj1
    sdj: sdj1
    sdj: sdj1
   VFS: Can't find ext3 filesystem on dev sdj.
   VFS: Can't find an ext2 filesystem on dev sdj.
   EXT2-fs warning (device sdj1): ext2_fill_super: mounting ext3 filesystem as ext2
   vbd vbd-2192: 16 Device in use; refusing to close
   Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
   NFSD: Using /var/lib/nfs/v4recovery as the NFSv4 state recovery directory
   NFSD: starting 90-second grace period



STOP starcluster

starcluster -c /nethome/admin/.starcluster/config stop smallcluster
    
    >>> Shutting down i-2fc83843
    >>> Shutting down i-29c83845
    >>> Removing cluster security group @sc-smallcluster



RESTARTED Thu Jan  6 12:08:04 EST 2011


START smallcluster

starcluster -c /nethome/admin/.starcluster/config start smallcluster


CONNECT TO MASTER:

starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster



OPEN NFS PORTS ON MASTER


CHECK IP ADDRESES ON AQ-7 AND MASTER:

ec2-describe-group

GROUP   558277860346    default default group
PERMISSION      558277860346    default ALLOWS  all                     FROM    USER    558277860346    GRPNAME    default
PERMISSION      558277860346    default ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     80      80      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     443     443     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     3306    3306    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     8443    8443    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     8773    8773    FROM    CIDR    0.0.0.0/0

GROUP   558277860346    @sc-smallcluster        Cluster requested at 201101060911
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     1       65535   FROM    USER    558277860346       GRPNAME @sc-smallcluster
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  udp     1       65535   FROM    USER    558277860346       GRPNAME @sc-smallcluster
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  icmp    -1      -1      FROM    USER    558277860346       GRPNAME @sc-smallcluster
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0

GROUP   558277860346    @sc-masters     StarCluster Master Nodes
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     32771   32772   FROM    CIDR    10.127.158.202/32

    
USED PORTS ON AQUARIUS-7:

[root@ip-10-127-158-202 ~]# rpcinfo -p
   program vers proto   port
    100000    2   tcp    111  portmapper
    100000    2   udp    111  portmapper
    100011    1   udp    801  rquotad
    100011    2   udp    801  rquotad
    100011    1   tcp    804  rquotad
    100011    2   tcp    804  rquotad
    100021    1   udp  33493  nlockmgr
    100021    3   udp  33493  nlockmgr
    100021    4   udp  33493  nlockmgr
    100003    2   udp   2049  nfs
    100003    3   udp   2049  nfs
    100003    4   udp   2049  nfs
    100021    1   tcp  57225  nlockmgr
    100021    3   tcp  57225  nlockmgr
    100021    4   tcp  57225  nlockmgr
    100003    2   tcp   2049  nfs
    100003    3   tcp   2049  nfs
    100003    4   tcp   2049  nfs
    100005    1   udp    834  mountd
    100005    1   tcp    837  mountd
    100005    2   udp    834  mountd
    100005    2   tcp    837  mountd
    100005    3   udp    834  mountd
    100005    3   tcp    837  mountd



USED PORTS ON MASTER:

root@ip-10-124-245-118:~# rpcinfo -p
   program vers proto   port
    100000    2   tcp    111  portmapper
    100000    2   udp    111  portmapper
    100024    1   udp  44695  status
    100024    1   tcp  39970  status

    nlockmgr PORT CHANGES 
    100021    1   udp  60454  nlockmgr
    100021    3   udp  60454  nlockmgr
    100021    4   udp  60454  nlockmgr
    100021    1   tcp  57100  nlockmgr
    100021    3   tcp  57100  nlockmgr
    100021    4   tcp  57100  nlockmgr
    
    100003    2   udp   2049  nfs
    100003    3   udp   2049  nfs
    100003    4   udp   2049  nfs
    100003    2   tcp   2049  nfs
    100003    3   tcp   2049  nfs
    100003    4   tcp   2049  nfs
    100005    1   udp  36059  mountd
    100005    1   tcp  34982  mountd
    100005    2   udp  36059  mountd
    100005    2   tcp  34982  mountd
    100005    3   udp  36059  mountd
    100005    3   tcp  34982  mountd
    
    
SET PORTS FOR mountd, nlockmgr AND portmapper:

find /lib/modules/ -name '*lockd*'


ADD NFS PORTS ACCESS TO @sc-cluster SECURITY GROUP
#(A LA CUPCAKE)
#TCP: 111, 2049
#UDP: 111, 32806

#ON AQ-7:
#TCP: 111, 804, 57225, 2049, 837
#UDP: 111, 801, 33493, 2049, 834

ON MASTER:
TCP: 111, 34982, 57225, 2049, 837
UDP: 111, 36059, 33493, 2049, 834


portmapper PORT 111 (TCP AND UDP)
ec2-authorize @sc-masters -p 111 -P tcp
ec2-authorize @sc-masters -p 111 -P udp

mountd PORTS 34982 (UDP) AND 36059 (TCP)
ec2-authorize @sc-masters -p 34982 -P tcp
ec2-authorize @sc-masters -p 36059 -P udp


nfs PORTS 2049 (TCP AND UDP)
ec2-authorize @sc-masters -p 2049 -P udp
ec2-authorize @sc-masters -p 2049 -P tcp


status PORTS 44695 (UDP) AND 39970 (TCP)
ec2-authorize @sc-masters -p 44695 -P udp
ec2-authorize @sc-masters -p 39970 -P tcp


nlockmgr PORTS 60454 (UDP) AND 57100 (TCP)
ec2-authorize @sc-masters -p 60454 -P udp
ec2-authorize @sc-masters -p 57100 -P tcp


NB: CREATE A SCRIPT THAT DOES THEM ALL:

openNfsPorts.pl


for port in 111 2049 32089 ; do ec2-authorize default -p $port ; done


ec2-describe-group

    GROUP   558277860346    default default group
    PERMISSION      558277860346    default ALLOWS  all                     FROM    USER    558277860346    GRPNAME    default
    PERMISSION      558277860346    default ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    default ALLOWS  tcp     80      80      FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    default ALLOWS  tcp     443     443     FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    default ALLOWS  tcp     3306    3306    FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    default ALLOWS  tcp     8443    8443    FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    default ALLOWS  tcp     8773    8773    FROM    CIDR    0.0.0.0/0
    GROUP   558277860346    @sc-smallcluster        Cluster requested at 201101060911
    PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     1       65535   FROM    USER    558277860346       GRPNAME @sc-smallcluster
    PERMISSION      558277860346    @sc-smallcluster        ALLOWS  udp     1       65535   FROM    USER    558277860346       GRPNAME @sc-smallcluster
    PERMISSION      558277860346    @sc-smallcluster        ALLOWS  icmp    -1      -1      FROM    USER    558277860346       GRPNAME @sc-smallcluster
    PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
    GROUP   558277860346    @sc-masters     StarCluster Master Nodes
    PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     111     111     FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     2049    2049    FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     36059   36059   FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     39970   39970   FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     57100   57100   FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  udp     111     111     FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  udp     2049    2049    FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  udp     34982   34982   FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  udp     44695   44695   FROM    CIDR    0.0.0.0/0
    PERMISSION      558277860346    @sc-masters     ALLOWS  udp     60454   60454   FROM    CIDR    0.0.0.0/0


ADDED CORRECT TCP AND UPD FOR MOUNTD:

ec2-authorize @sc-masters -p 36059 -P udp
GROUP           @sc-masters
PERMISSION              @sc-masters     ALLOWS  tcp     34982   34982   FROM    CIDR    0.0.0.0/0
[root@ip-10-127-158-202 ~]# ec2-authorize @sc-masters -p 36059 -P udp
GROUP           @sc-masters
PERMISSION              @sc-masters     ALLOWS  udp     36059   36059   FROM    CIDR    0.0.0.0/0



EDIT /etc/exports ON MASTER

emacs /etc/exports

    /home ip-10-124-243-154.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /opt/sge6 ip-10-124-243-154.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-124-243-154.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-127-158-202.ec2.internal(rw,sync,no_subtree_check)



LOAD THE CHANGES ON MASTER
(use anytime you add another mount point).

exportfs -ar


RESTART NFS SERVICES

#/etc/init.d/portmap restart
#/etc/init.d/nfs-kernel-server restart
service portmap restart
### RPCBIND IS RUN BY PORTMAP: service rpcbind restart
service nfs restart
service nfslock restart



root@ip-10-124-245-118:~# #/etc/init.d/portmap restart
root@ip-10-124-245-118:~# #/etc/init.d/nfs-kernel-server restart
root@ip-10-124-245-118:~# service portmap restart
portmap start/running, process 566
root@ip-10-124-245-118:~# service rpcbind restart
rpcbind: unrecognized service
root@ip-10-124-245-118:~# service nfs restart
 * Stopping NFS kernel daemon
   ...done.
 * Unexporting directories for NFS kernel daemon...
   ...done.
 * Exporting directories for NFS kernel daemon...
   ...done.
 * Starting NFS kernel daemon
   ...done.
root@ip-10-124-245-118:~# service nfslock restart
nfslock: unrecognized service



CHECK EXPORTS

root@ip-10-124-245-118:~# exportfs

    /home           ip-10-124-247-224.ec2.internal
    /opt/sge6       ip-10-124-247-224.ec2.internal
    /data           ip-10-124-247-224.ec2.internal
    /data           ip-10-127-158-202.ec2.internal



CHECK IP ADDRESSES OF AQ-7 AND MASTER

ec2din

AQ-7
    RESERVATION     r-e30f5d89      558277860346    default
    INSTANCE        i-b42f3fd9      ami-90af5ef9    ec2-75-101-214-196.compute-1.amazonaws.com      ip-10-127-158-202.ec2.internal     running aquarius        0               t1.micro        2010-12-24T09:51:37+0000  us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     75.101.214.196  10.127.158.202                     ebs
    BLOCKDEVICE     /dev/sda1       vol-c6e346ae    2010-12-24T09:51:40.000Z
    BLOCKDEVICE     /dev/sdh        vol-266dc84e    2010-12-24T23:03:04.000Z
    BLOCKDEVICE     /dev/sdi        vol-fa6dc892    2010-12-24T23:05:50.000Z

MASTER
    RESERVATION     r-6dfecb07      558277860346    @sc-masters,@sc-smallcluster
    INSTANCE        i-6f21d203      ami-a5c42dcc    ec2-72-44-59-38.compute-1.amazonaws.com ip-10-124-245-118.ec2.internal     running id_rsa-admin-key        0               m1.large        2011-01-06T14:11:09+0000  us-east-1a       aki-fd15f694    ari-7b739e12            monitoring-disabled     72.44.59.38     10.124.245.118                     instance-store
    BLOCKDEVICE     /dev/sdj        vol-fc5af194    2011-01-06T14:14:11.000Z

NODE 001
    RESERVATION     r-63fecb09      558277860346    @sc-smallcluster
    INSTANCE        i-6921d205      ami-a5c42dcc    ec2-67-202-9-15.compute-1.amazonaws.com ip-10-124-247-224.ec2.internal     running id_rsa-admin-key        0               m1.large        2011-01-06T14:11:09+0000  us-east-1a       aki-fd15f694    ari-7b739e12            monitoring-disabled     67.202.9.15     10.124.247.224                     instance-store


CONFIRM rpc.statd IS RUNNING ON MASTER
(IT'S STARTED BY nfs-kernel-server?)

ps aux | grep rpc

    root      1124  0.0  0.0      0     0 ?        S<   14:13   0:00 [rpciod/0]
    root      1125  0.0  0.0      0     0 ?        S<   14:13   0:00 [rpciod/1]
    root      5110  0.0  0.0  25268  1236 ?        Ss   19:04   0:00 /usr/sbin/rpc.mountd --manage-gids
    statd     5147  0.0  0.0  10300   792 ?        Ss   19:06   0:00 rpc.statd -L
    root      5250  0.0  0.0   7336   872 pts/0    R+   19:30   0:00 grep rpc


CONFIRM MOUNTS ON MASTER

showmount 
    Hosts on ip-10-124-245-118:
    10.124.247.224


CHECK AVAILABLE MOUNTS ON AQ-7

showmount -e ip-10-124-245-118
Export list for ip-10-124-245-118:
/data     ip-10-127-158-202.ec2.internal,ip-10-124-247-224.ec2.internal
/opt/sge6 ip-10-124-247-224.ec2.internal
/home     ip-10-124-247-224.ec2.internal


MOUNT /data FROM MASTER ON AQ-7
    
mount -t nfs ip-10-124-245-118:/data /mnt

ll /mnt 

    drwxr-xr-x  3 root root 4.0K Oct 10 22:49 agua
    drwxr-xr-x 53 root root 4.0K Oct 14 02:48 apps
    drwxr-xr-x  3 root root 4.0K Oct 11 00:50 base
    drwx------  2 root root  16K Oct 10 22:43 lost+found
    drwxr-xr-x  5 root root 4.0K Oct 11 00:07 mysql
    drwxr-xr-x  2 root root 4.0K Jan  5 11:47 starcluster

umount /mnt
ll /mnt

    drwxr-xr-x  2 root root 4.0K Dec  8  2009 .
    drwxr-xr-x 29 root root 4.0K Jan  5 10:55 ..


mount -t nfs ip-10-124-245-118.ec2.internal:/data /mnt

ll /mnt

    drwxr-xr-x  3 root root 4.0K Oct 10 22:49 agua
    drwxr-xr-x 53 root root 4.0K Oct 14 02:48 apps
    drwxr-xr-x  3 root root 4.0K Oct 11 00:50 base
    drwx------  2 root root  16K Oct 10 22:43 lost+found
    drwxr-xr-x  5 root root 4.0K Oct 11 00:07 mysql
    drwxr-xr-x  2 root root 4.0K Jan  5 11:47 starcluster

    OK

umount /mnt
ll /mnt

    drwxr-xr-x  2 root root 4.0K Dec  8  2009 .
    drwxr-xr-x 29 root root 4.0K Jan  5 10:55 ..

mount -t nfs ec2-72-44-59-38.compute-1.amazonaws.com:/data /mnt
ll /mnt

    drwxr-xr-x  3 root root 4.0K Oct 10 22:49 agua
    drwxr-xr-x 53 root root 4.0K Oct 14 02:48 apps
    drwxr-xr-x  3 root root 4.0K Oct 11 00:50 base
    drwx------  2 root root  16K Oct 10 22:43 lost+found
    drwxr-xr-x  5 root root 4.0K Oct 11 00:07 mysql
    drwxr-xr-x  2 root root 4.0K Jan  5 11:47 starcluster



COPY FILE TO MOUNTED DIR:

cd /data/agua/0.5
cp agua-0.5.tar.gz /mnt

    cp: cannot create regular file `/mnt/agua-0.5.tar.gz': Permission denied


CHECK MOUNTS ON AQ-7

mount -f

    /dev/sda1 on / type ext3 (rw)
    none on /proc type proc (rw)
    none on /sys type sysfs (rw)
    none on /dev/pts type devpts (rw,gid=5,mode=620)
    /dev/sdh on /data type ext3 (rw,noatime)
    /dev/sdi on /nethome type ext3 (rw)
    /nethome/mysql/etc/mysql on /etc/mysql type none (rw,bind)
    /nethome/mysql/lib/mysql on /var/lib/mysql type none (rw,bind)
    /nethome/mysql/log/mysql on /var/log/mysql type none (rw,bind)
    none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)
    sunrpc on /var/lib/nfs/rpc_pipefs type rpc_pipefs (rw)
    nfsd on /proc/fs/nfsd type nfsd (rw)
    ec2-72-44-59-38.compute-1.amazonaws.com:/data on /mnt type nfs (rw,addr=10.124.245.118)


CHECK ROOT USER UID ON AQ-7

id
    uid=0(root) gid=0(root) groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel)


... AND ROOT USER UID ON MASTER

id
    uid=0(root) gid=0(root) groups=0(root)


RECHECK SETTINGS IN /etc/exports ON MASTER

cat /etc/exports

    /home ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /opt/sge6 ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-127-158-202.ec2.internal(rw,sync,no_subtree_check)

CHANGE PERMISSINGS IN LAST LINE TO MATCH OTHERS

cat /etc/exports

    /home ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /opt/sge6 ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-124-247-224.ec2.internal(async,no_root_squash,no_subtree_check,rw)
    /data ip-10-127-158-202.ec2.internal(async,no_root_squash,no_subtree_check,rw)


RESTART portmap AND nfs

service portmap restart
service nfs restart


RETRY COPY AND IT WORKED!

cd /data/agua/0.5
cp agua-0.5.tar.gz /mnt
ll /mnt

    drwxr-xr-x  3 root root 4.0K Oct 10 22:49 agua
    -rw-r--r--  1 root root  60M Jan  7 10:48 agua-0.5.tar.gz
    drwxr-xr-x 53 root root 4.0K Oct 14 02:48 apps
    drwxr-xr-x  3 root root 4.0K Oct 11 00:50 base
    drwx------  2 root root  16K Oct 10 22:43 lost+found
    drwxr-xr-x  5 root root 4.0K Oct 11 00:07 mysql
    drwxr-xr-x  2 root root 4.0K Jan  5 11:47 starcluster



SSH DIRECTLY TO MASTER:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-245-118

KEY LOCATION TAKEN FROM config:

cat /nethome/admin/.starcluster/config
    
    ...
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    ...



FIX PORTS FOR NFS, MOUNTD, ETC.

1. CHECK CURRENT PORTS

rpcinfo -p
   program vers proto   port
    100000    2   tcp    111  portmapper
    100000    2   udp    111  portmapper
    100024    1   udp  60033  status
    100024    1   tcp  43829  status
    100021    1   udp  49229  nlockmgr
    100021    3   udp  49229  nlockmgr
    100021    4   udp  49229  nlockmgr
    100021    1   tcp  54650  nlockmgr
    100021    3   tcp  54650  nlockmgr
    100021    4   tcp  54650  nlockmgr
    100003    2   udp   2049  nfs
    100003    3   udp   2049  nfs
    100003    4   udp   2049  nfs
    100003    2   tcp   2049  nfs
    100003    3   tcp   2049  nfs
    100003    4   tcp   2049  nfs
    100005    1   udp  60485  mountd
    100005    1   tcp  59527  mountd
    100005    2   udp  60485  mountd
    100005    2   tcp  59527  mountd
    100005    3   udp  60485  mountd
    100005    3   tcp  59527  mountd


2. ASSIGN PERMANENT PORT NUMBERS

FOR THESE NFS SERVICES:

rquotad
mountd
statd
lockd

(NB: NFS-COMMON CONTAINS showmount, lockd AND statd)

mountd
------
# /usr/share/nfs-kernel-server/conffiles/nfs-kernel-server.default
emacs /etc/default/nfs-kernel-server
RPCMOUNTDOPTS="--port 32767 --manage-gids"



statd
-----

TEST MANUALLY
rpc.statd --port 4000 --outgoing-port 4001


netstat -anp|grep statd

tcp 0 0 0.0.0.0:4000 0.0.0.0:* LISTEN 30976/rpc.statd
udp 0 0 0.0.0.0:4000 0.0.0.0:* 30976/rpc.statd
udp 0 0 0.0.0.0:624 0.0.0.0:* 30976/rpc.statd


BUT NOW status IS NOT SHOWN IN rpcinfo -p

rpcinfo -p

   program vers proto   port
    100000    2   tcp    111  portmapper
    100000    2   udp    111  portmapper
    100021    1   udp  58839  nlockmgr
    100021    3   udp  58839  nlockmgr
    100021    4   udp  58839  nlockmgr
    100021    1   tcp  35844  nlockmgr
    100021    3   tcp  35844  nlockmgr
    100021    4   tcp  35844  nlockmgr
    100003    2   udp   2049  nfs
    100003    3   udp   2049  nfs
    100003    4   udp   2049  nfs
    100003    2   tcp   2049  nfs
    100003    3   tcp   2049  nfs
    100003    4   tcp   2049  nfs
    100005    1   udp  32767  mountd
    100005    1   tcp  32767  mountd
    100005    2   udp  32767  mountd
    100005    2   tcp  32767  mountd
    100005    3   udp  32767  mountd
    100005    3   tcp  32767  mountd


# /usr/share/nfs-common/conffiles/nfs-common.default
emacs /etc/default/nfs-common
STATDOPTS="--port 40000 --outgoing-port 40001"

nlockmgr
--------

http://www.ba.infn.it/calcolo/documenti/NFSServer.html

NFS lock manager (rpc.lockd): normally uses a random port allocated by portmapper.

On systems where the lock manager is implemented as a loadable module
(RedHat 7.3 and greater, Mandrake 8.2 and greater) the port number used
is set at module load time, and so is configured by adding (or editing)
a line in the file:

/etc/modules.conf 

options nlockmgr nlm_udpport=4001 nlm_tcpport=4001


##EDIT /etc/services
##
##emacs /etc/services
##
##ADD THESE LINES:
##lockmgr        2044/tcp   nfs_lockd     # NFS Lock daemon (NLM)    
##nlockmgr        2044/udp   nfs_lockd     # NFS Lock daemon (NLM)


NOT NECCESSARY?

http://forums11.itrc.hp.com/service/forums/questionanswer.do?threadId=61832
ll === On May 13, 2003 Sean O'Brien wrote:
> > Is this service required for NFS? Can I
> > disable llockmgr and still NFS mount a CD
> > drive from another machine? 

I suppose so, as long as your applications won't need file-locking semantics off any of the mounted filesystems; the reason why I surmise a non-llockmgr NFS configuration
to not break NFS mounting functionality is because of the 'statelessness' of the protocol...
emacs /etc/modprobe.d/options.conf
options lockd nlm_udpport=4001 nlm_tcpport=4001

###emacs /etc/sysctl.conf
###
###fs.nfs.nlm_udpport=4045
###fs.nfs.nlm_tcpport=4045
  

####make the lock daemon listen on port 4045 only - note that this 
####requires setting module load options in a file in/etc/modprobe.d/  - 
####I create an aptly named file of
####
####emacs /etc/modprobe.d/lockd.conf
####
####options lockd nlm_udpport=4045 nlm_tcpport=4045




TRIED IT WITHOUT OPENING nlockmgr PORTS

1. CHECK WHICH PORTS ARE OPEN ON MASTER WITH netstat -ntulp AND rpcinfo -p


rpcinfo -p | awk -F " " '{print $3 "\t" $4 "\t" $5}' | sort | uniq | grep -v proto
    
    tcp     111     portmapper
    tcp     2049    nfs
    tcp     32767   mountd
    tcp     35844   nlockmgr
    udp     111     portmapper
    udp     2049    nfs
    udp     32767   mountd
    udp     58839   nlockmgr


rpcinfo -p

   program vers proto   port
    100000    2   tcp    111  portmapper
    100000    2   udp    111  portmapper
    100024    1   udp  60033  status
    100024    1   tcp  43829  status
    100021    1   udp  45242  nlockmgr
    100021    3   udp  45242  nlockmgr
    100021    4   udp  45242  nlockmgr
    100021    1   tcp  51636  nlockmgr
    100021    3   tcp  51636  nlockmgr
    100021    4   tcp  51636  nlockmgr
    100003    2   udp   2049  nfs
    100003    3   udp   2049  nfs
    100003    4   udp   2049  nfs
    100003    2   tcp   2049  nfs
    100003    3   tcp   2049  nfs
    100003    4   tcp   2049  nfs
    100005    1   udp  32767  mountd
    100005    1   tcp  32767  mountd
    100005    2   udp  32767  mountd
    100005    2   tcp  32767  mountd
    100005    3   udp  32767  mountd
    100005    3   tcp  32767  mountd


netstat -ntulp

    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      4325/sge_execd  
    tcp        0      0 0.0.0.0:2049            0.0.0.0:*               LISTEN      -               
    tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      1075/mysqld     
    tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      5133/portmap    
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1226/apache2    
    tcp        0      0 0.0.0.0:51636           0.0.0.0:*               LISTEN      -               
    tcp        0      0 0.0.0.0:43829           0.0.0.0:*               LISTEN      5147/rpc.statd  
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      933/sshd        
    tcp        0      0 0.0.0.0:32767           0.0.0.0:*               LISTEN      7830/rpc.mountd 
    tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      3308/sge_qmaster
    tcp6       0      0 :::22                   :::*                    LISTEN      933/sshd        
    udp        0      0 0.0.0.0:2049            0.0.0.0:*                           -               
    udp        0      0 0.0.0.0:60033           0.0.0.0:*                           5147/rpc.statd  
    udp        0      0 0.0.0.0:659             0.0.0.0:*                           5147/rpc.statd  
    udp        0      0 0.0.0.0:45242           0.0.0.0:*                           -               
    udp        0      0 0.0.0.0:68              0.0.0.0:*                           839/dhclient3   
    udp        0      0 0.0.0.0:59088           0.0.0.0:*                           612/avahi-daemon: r
    udp        0      0 0.0.0.0:5353            0.0.0.0:*                           612/avahi-daemon: r
    udp        0      0 0.0.0.0:111             0.0.0.0:*                           5133/portmap    
    udp        0      0 0.0.0.0:32767           0.0.0.0:*                           7830/rpc.mountd


2. OPEN PORTS FOR @sc-masters GROUP ON EC2, EXCEPT FOR nlockmgr PORTS

ec2-authorize @sc-masters -p 111 -P tcp
ec2-authorize @sc-masters -p 111 -P udp
ec2-authorize @sc-masters -p 60033 -P udp
ec2-authorize @sc-masters -p 43829 -P tcp
##ec2-authorize @sc-masters -p 45242 -P udp
##ec2-authorize @sc-masters -p 51636 -P tcp
ec2-authorize @sc-masters -p 2049 -P udp
ec2-authorize @sc-masters -p 2049 -P tcp
ec2-authorize @sc-masters -p 32767 -P udp
ec2-authorize @sc-masters -p 32767 -P tcp


CONFIRMED PORTS ARE OPEN:

ec2-describe-group
GROUP   558277860346    default default group
PERMISSION      558277860346    default ALLOWS  all                     FROM    USER    558277860346    GRPNAMdefault
PERMISSION      558277860346    default ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     80      80      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     443     443     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     3306    3306    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     8443    8443    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    default ALLOWS  tcp     8773    8773    FROM    CIDR    0.0.0.0/0
GROUP   558277860346    @sc-smallcluster        Cluster requested at 201101060911
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     1       65535   FROM    USER    558277860346   GRPNAME @sc-smallcluster
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  udp     1       65535   FROM    USER    558277860346   GRPNAME @sc-smallcluster
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  icmp    -1      -1      FROM    USER    558277860346   GRPNAME @sc-smallcluster
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  tcp     111     111     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  udp     111     111     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-smallcluster        ALLOWS  udp     60033   60033   FROM    CIDR    0.0.0.0/0
GROUP   558277860346    @sc-masters     StarCluster Master Nodes
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     22      22      FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     111     111     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     2049    2049    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     32767   32767   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     33932   33932   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     34982   34982   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     36059   36059   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     39970   39970   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     43829   43829   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     48830   48830   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  tcp     57100   57100   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     111     111     FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     2049    2049    FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     32767   32767   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     33485   33485   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     34982   34982   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     36059   36059   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     44695   44695   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     45161   45161   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     60033   60033   FROM    CIDR    0.0.0.0/0
PERMISSION      558277860346    @sc-masters     ALLOWS  udp     60454   60454   FROM    CIDR    0.0.0.0/0


CHECK IF MASTER'S MOUNT IS SEEN BY AQ-7:

showmount -e ip-10-124-245-118

Export list for ip-10-124-245-118:
/data     ip-10-127-158-202.ec2.internal,ip-10-124-247-224.ec2.internal
/opt/sge6 ip-10-124-247-224.ec2.internal
/home     ip-10-124-247-224.ec2.internal


MOUNT /data FROM MASTER ON AQ-7
    
mount -t nfs ip-10-124-245-118:/data /mnt

    OK!


CAN MOVE A FILE:

cd /mnt/agua/0.5
ll
    
    drwxr-xr-x  7 root root 4.0K Jan  7 13:40 bin
    drwxr-xr-x  4 root root 4.0K Oct 27 01:06 cgi-bin
    drwxr-xr-x  2 root root 4.0K Jun 29  2010 conf
    drwxr-xr-x 11 root root 4.0K Jun 29  2010 home
    drwxr-xr-x  7 root root 4.0K Oct 27 07:00 html
    drwxr-xr-x 10 root root 4.0K Sep 10 10:44 lib
    -rw-r--r--  1 root root  431 Oct 10 23:35 mysql.txt
    drwxr-xr-x  2 root root 4.0K Jun 29  2010 software

ll bin

    -rw-r--r-- 1 root root  60M Oct 10 22:59 agua-0.5.tar.gz
    drwxr-xr-x 7 root root 4.0K Jan  7 10:14 apps
    drwxr-xr-x 2 root root 4.0K Jun 29  2010 db
    drwxr-xr-x 3 root root 4.0K Oct 27 00:07 scripts
    drwxr-xr-x 3 root root 4.0K Oct 27 00:40 sql
    drwxr-xr-x 7 root root 4.0K Jun 29  2010 workflows
    
mv bin/agua-0.5.tar.gz  .
ll

    -rw-r--r--  1 root root  60M Oct 10 22:59 agua-0.5.tar.gz
    drwxr-xr-x  7 root root 4.0K Jan  7 14:09 bin
    drwxr-xr-x  4 root root 4.0K Oct 27 01:06 cgi-bin
    drwxr-xr-x  2 root root 4.0K Jun 29  2010 conf
    drwxr-xr-x 11 root root 4.0K Jun 29  2010 home
    drwxr-xr-x  7 root root 4.0K Oct 27 07:00 html
    drwxr-xr-x 10 root root 4.0K Sep 10 10:44 lib
    -rw-r--r--  1 root root  431 Oct 10 23:35 mysql.txt
    drwxr-xr-x  2 root root 4.0K Jun 29  2010 software

ll bin

    drwxr-xr-x 7 root root 4.0K Jan  7 10:14 apps
    drwxr-xr-x 2 root root 4.0K Jun 29  2010 db
    drwxr-xr-x 3 root root 4.0K Oct 27 00:07 scripts
    drwxr-xr-x 3 root root 4.0K Oct 27 00:40 sql
    drwxr-xr-x 7 root root 4.0K Jun 29  2010 workflows








SECURING NFS
http://wiki.debian.org/SecuringNFS

It's easy to configure the port options for the statd, mountd and quotad RPC services, thanks to the use of /etc/default/* by the init-scripts

 # /etc/default/nfs-common
 STATDOPTS="--port 32765 --outgoing-port 32766"

 # /etc/default/nfs-kernel-server
 RPCMOUNTDOPTS="-p 32767"

 # /etc/default/quota
 RPCRQUOTADOPTS="-p 32769"
The nfs daemon (rpc.nfsd or just nfsd) will listen on port 2049 by default if no port is specified.


STATD CONFIG:

emacs /usr/share/nfs-common/conffiles/nfs-common.default

    ...
    # Do you want to start the statd daemon? It is not needed for NFSv4.
    NEED_STATD=
    
    # Options for rpc.statd.
    #   Should rpc.statd listen on a specific port? This is especially useful
    #   when you have a port-based firewall. To use a fixed port, set this
    #   this variable to a statd argument like: "--port 4000 --outgoing-port 4001".
    #   For more information, see rpc.statd(8) or http://wiki.debian.org/?SecuringNFS
    STATDOPTS=
    
    # Do you want to start the idmapd daemon? It is only needed for NFSv4.
    NEED_IDMAPD=
    
    # Do you want to start the gssd daemon? It is required for Kerberos mounts.
    NEED_GSSD=


MOUNTD CONFIG:

cat /usr/share/nfs-kernel-server/conffiles/nfs-kernel-server.default

    # Number of servers to start up
    RPCNFSDCOUNT=8
    
    # Runtime priority of server (see nice(1))
    RPCNFSDPRIORITY=0
    
    # Options for rpc.mountd.
    # If you have a port-based firewall, you might want to set up
    # a fixed port here using the --port option. For more information, 
    # see rpc.mountd(8) or http://wiki.debian.org/?SecuringNFS
    RPCMOUNTDOPTS=--manage-gids
    
    # Do you want to start the svcgssd daemon? It is only required for Kerberos
    # exports. Valid alternatives are "yes" and "no"; the default is "no".
    NEED_SVCGSSD=
    
    # Options for rpc.svcgssd.
    RPCSVCGSSDOPTS=






1. CHECK AVAILABLE PORTS

locate nfs | grep conf

    /usr/share/nfs-common/conffiles
    /usr/share/nfs-common/conffiles/idmapd.conf
    /usr/share/nfs-common/conffiles/idmapd.conf.md5sum
    /usr/share/nfs-common/conffiles/nfs-common.default
    /usr/share/nfs-common/conffiles/nfs-common.default.md5sum
    /usr/share/nfs-kernel-server/conffiles
    /usr/share/nfs-kernel-server/conffiles/etc.exports
    /usr/share/nfs-kernel-server/conffiles/etc.exports.md5sum
    /usr/share/nfs-kernel-server/conffiles/nfs-kernel-server.default
    /usr/share/nfs-kernel-server/conffiles/nfs-kernel-server.default.md5sum
    /var/lib/dpkg/info/nfs-common.conffiles  #### LOCATION OF CONFIG FILE READER SCRIPTS
    /var/lib/dpkg/info/nfs-kernel-server.conffiles

cat /var/lib/dpkg/info/nfs-common.conffiles
/etc/init/statd.conf
/etc/init/rpc_pipefs.conf
/etc/init/gssd.conf
/etc/init/idmapd.conf


NFS-COMMON CONTAINS showmount, lockd AND statd

    http://fadaskeng.com/nfs.php
    
    The nfs-common package is shared by ALL (client/server) NFS tools.
    The package nfs-kernel-server contains the main NFS daemon.(Server)
    
    Main Debian Packages include the following system binaries.
    
    nfs-common
    a. #/sbin/showmount - reveals mounts and exports on remote servers
    b. #/sbin/rpc.lockd - handles locking of files
    c. #/sbin/rpc.statd - provides stats for mounts (files and directories)
    
    nfs-kernel-server
    #/usr/sbin/exportfs - exports file systems listed in /etc/exports. 


## DIDN'T WORK:
##2. CREATE /etc/sysconfig/nfs
##
##mkdir /etc/sysconfig
##emacs /etc/sysconfig/nfs
### NFS port numbers
##STATD_PORT=10002
##STATD_OUTGOING_PORT=10003
##MOUNTD_PORT=10004
##RQUOTAD_PORT=10005
##LOCKD_UDPPORT=30001
##LOCKD_TCPPORT=30001
##






http://pario.no/2008/01/15/allow-nfs-through-iptables-on-a-redhat-system/

Solution
The first step is to assign a permanent port number to each of the NFS services (rquotad, mountd, statd, and lockd). While they can use any unused ports greater than 1024, it is recommended that you first consult the file /etc/services to find a valid unused port range. The following examples use the range 10000-10005.

The majority of the ports are configured through the file /etc/sysconfig/nfs. You will need to create this file if it does not exist. It should look similar to the following example:

# NFS port numbers
STATD_PORT=10002
STATD_OUTGOING_PORT=10003
MOUNTD_PORT=10004
RQUOTAD_PORT=10005

The lockd service is configured differently from the others because it is compiled as a kernel module. To set the port which lockd uses, add these options in the /etc/sysconfig/nfs file:

LOCKD_UDPPORT=30001
LOCKD_TCPPORT=30001

where “30001? can be replaced with any port that is available and can be assigned for use.

After these configuration changes, you can view the port assignments with the command rpcinfo -p

# rpcinfo -p | awk -F " " '{print $3 ", " $4 ", " $5}' | sort | uniq

At this point, the ports will remain the same when NFS is restarted. The following is a list of ports which need to be opened on the firewall:

proto, port,
tcp, 10004, mountd
tcp, 10005, rquotad
tcp, 111, portmapper
tcp, 2049, nfs
tcp, 32771, nlockmgr
udp, 10004, mountd
udp, 10005, rquotad
udp, 111, portmapper
udp, 2049, nfs
udp, 32768, nlockmgr

At this point, the ports will remain the same when NFS is restarted. The following is a list of ports which need to be opened on the firewall:

proto, port,
tcp, 10004, mountd
tcp, 10005, rquotad
tcp, 111, portmapper
tcp, 2049, nfs
tcp, 32771, nlockmgr
udp, 10004, mountd
udp, 10005, rquotad
udp, 111, portmapper
udp, 2049, nfs
udp, 32768, nlockmgr




OPEN NFS PORTS

If you have a firewall you need to make sure ports 32771, 111 and 2049 are open

CUPCAKE'S DETAILED INSTRUCTIONS
http://www.cupcakewithsprinkles.com/amazon-ec2-and-nfs/

Amazon EC2 and NFS

Filed Under: Systems Administration by Hunter Ford — Leave a commentJune 22, 2010

There is a lack of updated information online about launching NFS in EC2 specifically, so I thought I would contribute to help those who might encounter this in the future; and it’s actually quite easy.
We’re running Fedora 8 (while we wait for Fedora 13 to be supported).
NFS-utils and rpcbind should already be installed, but if not, you need to run the following on the instance that will act as the server:
yum install nfs-utils rpcbind
*Note: you’ll find in a lot of tutorials portmap is used instead of rpcbind. Portmap was renamed to rpcbind.

Still on the server, we need to define what directory we want to share, with whom (which server), along with the permissions and options for that share.

# open up our definition file

    nano /etc/exports

You can look at all the options in the exports man page.
For the purpose of this tutorial I’m just going to share a directory I created under /var/www

    /var/www/test   ec2-180-71-131-129.compute-1.amazonaws.com(rw,async)

In the example above, I’m using the public DNS of one of my instances that has an elastic IP. Elastic IP DNS names inside EC2 get translated to internal IPs (you can verify it with ping). You can use hostnames, IPs, netmasks and even wildcards. rw specifies that it’s read/writable and async allows disk operations to happen asynchronously. Next we need to load the changes.

    exportfs -ar

You can use that anytime you add another mount point.

And now we need to start the server and related services:

    service rpcbind start
    service nfs start
    service nfslock start

Next, we need to open up some ports in Amazon’s security group. Through the EC2 Console or API, you want to allowing connections from your client to your server on the following ports:
TCP: 111, 2049
UDP: 111, 32806
On the client, you need to start nfslock and rpcbind, and optionally add them to startup:

    service rpcbind start
    service nfslock start
    chkconfig --level 2345 rpcbind on
    chkconfig --level 2345 nfslock on


We need to create a directory as a mount point and mount the NFS server:
    mkdir /var/www/test
    mount -t nfs ec2-180-71-131-132.compute-1.amazonaws.com:/var/www/test /var/www/test

*Make sure to change the host name to the hostname or IP of your NFS server.

That’s all there is to it.

Originally I had only opened up port TCP 111 and 2049. This only gave me this error:

    mount to NFS server ’10.214.58.54? failed: timed out, retrying
    
I then opened up UDP 111 and by running the mount command in verbose mode (-v) I saw that I needed to open UDP 32806. It looks like the mount command requires TCP and UDP 111, but only TCP 2049 and UDP 32806.

If you want these services to run on startup, you’ll want to do the following:

    chkconfig --level 2345 rpcbind on
    chkconfig --level 2345 nfs on
    chkconfig --level 2345 nfslock on

And to have the mounts created at startup, edit /etc/fstab

    ec2-180-71-131-132.compute-1.amazonaws.com:/var/www/test    /var/www/test       nfs rsize=8192,wsize=8192,timeo=14,intr 0 0






CHECK WHICH PORTS ARE OPEN USING netstat -ntulp

    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      4325/sge_execd  
    tcp        0      0 0.0.0.0:2049            0.0.0.0:*               LISTEN      -               
    tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      1075/mysqld     
    tcp        0      0 0.0.0.0:33932           0.0.0.0:*               LISTEN      5110/rpc.mountd 
    tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      5133/portmap    
    tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1226/apache2    
    tcp        0      0 0.0.0.0:43829           0.0.0.0:*               LISTEN      5147/rpc.statd  
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      933/sshd        
    tcp        0      0 0.0.0.0:48830           0.0.0.0:*               LISTEN      -               
    tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      3308/sge_qmaster
    tcp6       0      0 :::22                   :::*                    LISTEN      933/sshd        
    udp        0      0 0.0.0.0:60033           0.0.0.0:*                           5147/rpc.statd  
    udp        0      0 0.0.0.0:2049            0.0.0.0:*                           -               
    udp        0      0 0.0.0.0:659             0.0.0.0:*                           5147/rpc.statd  
    udp        0      0 0.0.0.0:68              0.0.0.0:*                           839/dhclient3   
    udp        0      0 0.0.0.0:33485           0.0.0.0:*                           5110/rpc.mountd 
    udp        0      0 0.0.0.0:59088           0.0.0.0:*                           612/avahi-daemon: r
    udp        0      0 0.0.0.0:45161           0.0.0.0:*                           -               
    udp        0      0 0.0.0.0:5353            0.0.0.0:*                           612/avahi-daemon: r
    udp        0      0 0.0.0.0:111             0.0.0.0:*                           5133/portmap

WHICH MIRRORS rpcinfo -p

rpcinfo -p

   program vers proto   port
    100000    2   tcp    111  portmapper
    100021    1   udp  45161  nlockmgr
    100021    3   udp  45161  nlockmgr
    100021    4   udp  45161  nlockmgr
    100021    1   tcp  48830  nlockmgr
    100021    3   tcp  48830  nlockmgr
    100021    4   tcp  48830  nlockmgr
    100003    2   udp   2049  nfs
    100003    3   udp   2049  nfs
    100003    4   udp   2049  nfs
    100003    2   tcp   2049  nfs
    100003    3   tcp   2049  nfs
    100003    4   tcp   2049  nfs
    100005    1   udp  33485  mountd
    100005    1   tcp  33932  mountd
    100005    2   udp  33485  mountd
    100005    2   tcp  33932  mountd
    100005    3   udp  33485  mountd
    100005    3   tcp  33932  mountd
    100000    2   udp    111  portmapper
    100024    1   udp  60033  status
    100024    1   tcp  43829  status




ALTERNATE METHODS FOR CHECKING OPEN PORTS

CHECK MASTER FROM AQ-7

1) USING nmap

1. INSTALL ON AQ-7

yum install nmap

    ...
    Installed:
      nmap.x86_64 2:4.11-1.1
      Complete!

2. RUN nmap TO SCAN MASTER FROM AQ-7

nmap -P0 10.124.245.118
    
    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2011-01-07 09:58 EST
    Interesting ports on ip-10-124-245-118.ec2.internal (10.124.245.118):
    Not shown: 1677 filtered ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    111/tcp  open  rpcbind
    2049/tcp open  nfs
    
    Nmap finished: 1 IP address (1 host up) scanned in 21.651 seconds



CHECK MASTER FROM ITSELF

1. INSTALL nmap ON MASTER

apt-get install nmap

    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    The following extra packages will be installed:
      liblua5.1-0
    The following NEW packages will be installed:
      liblua5.1-0 nmap
    0 upgraded, 2 newly installed, 0 to remove and 109 not upgraded.
    Need to get 1,701kB of archives.
    After this operation, 6,623kB of additional disk space will be used.
    Do you want to continue [Y/n]? y
    Get:1 http://us-east-1.ec2.archive.ubuntu.com karmic/main liblua5.1-0 5.1.4-3 [89.6kB]
    Get:2 http://us-east-1.ec2.archive.ubuntu.com karmic/main nmap 5.00-2 [1,612kB]
    Fetched 1,701kB in 0s (15.7MB/s) 
    Selecting previously deselected package liblua5.1-0.
    (Reading database ... 47944 files and directories currently installed.)
    Unpacking liblua5.1-0 (from .../liblua5.1-0_5.1.4-3_amd64.deb) ...
    Selecting previously deselected package nmap.
    Unpacking nmap (from .../archives/nmap_5.00-2_amd64.deb) ...
    Processing triggers for man-db ...
    Setting up liblua5.1-0 (5.1.4-3) ...
    
    Setting up nmap (5.00-2) ...
    
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    /sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.


2. RUN NMAP

nmap -sS -O 127.0.0.1

    Starting Nmap 5.00 ( http://nmap.org ) at 2011-01-07 14:31 UTC
    Interesting ports on localhost.localdomain (127.0.0.1):
    Not shown: 995 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    2049/tcp open  nfs
    3306/tcp open  mysql
    No exact OS matches for host (If you know what OS is running on it, see http://nmap.org/submit/ ).
    TCP/IP fingerprint:
    OS:SCAN(V=5.00%D=1/7%OT=22%CT=1%CU=30943%PV=N%DS=0%G=Y%TM=4D2723E6%P=x86_64
    OS:-unknown-linux-gnu)SEQ(SP=C2%GCD=1%ISR=CF%TI=Z%CI=Z%II=I%TS=7)OPS(O1=M40
    OS:0CST11NW7%O2=M400CST11NW7%O3=M400CNNT11NW7%O4=M400CST11NW7%O5=M400CST11N
    OS:W7%O6=M400CST11)WIN(W1=8000%W2=8000%W3=8000%W4=8000%W5=8000%W6=8000)ECN(
    OS:R=Y%DF=Y%T=40%W=8018%O=M400CNNSNW7%CC=Y%Q=)T1(R=Y%DF=Y%T=40%S=O%A=S+%F=A
    OS:S%RD=0%Q=)T2(R=N)T3(R=Y%DF=Y%T=40%W=8000%S=O%A=S+%F=AS%O=M400CST11NW7%RD
    OS:=0%Q=)T4(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T5(R=Y%DF=Y%T=40%W=0%S
    OS:=Z%A=S+%F=AR%O=%RD=0%Q=)T6(R=Y%DF=Y%T=40%W=0%S=A%A=Z%F=R%O=%RD=0%Q=)T7(R
    OS:=Y%DF=Y%T=40%W=0%S=Z%A=S+%F=AR%O=%RD=0%Q=)U1(R=Y%DF=N%T=40%IPL=164%UN=0%
    OS:RIPL=G%RID=G%RIPCK=G%RUCK=G%RUD=G)IE(R=Y%DFI=N%T=40%CD=S)
    
    Network Distance: 0 hops
    
    OS detection performed. Please report any incorrect results at http://nmap.org/submit/ .
    Nmap done: 1 IP address (1 host up) scanned in 12.46 seconds


2) USING netstat -nap

NOTE: THIS GIVES TOO MUCH INFORMATION

netstat -nap

Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      4325/sge_execd  
tcp        0      0 0.0.0.0:2049            0.0.0.0:*               LISTEN      -               
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      1075/mysqld     
tcp        0      0 0.0.0.0:33932           0.0.0.0:*               LISTEN      5110/rpc.mountd 
tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN      5133/portmap    
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1226/apache2    
tcp        0      0 0.0.0.0:43829           0.0.0.0:*               LISTEN      5147/rpc.statd  
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      933/sshd        
tcp        0      0 0.0.0.0:48830           0.0.0.0:*               LISTEN      -               
tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      3308/sge_qmaster
tcp        0      0 10.124.245.118:2049     10.124.247.224:775      ESTABLISHED -               
tcp        0      0 10.124.245.118:22       10.127.158.202:47131    ESTABLISHED 5515/0          
tcp        0      0 10.124.245.118:63231    10.124.245.118:52084    ESTABLISHED 3308/sge_qmaster
tcp        0      0 10.124.245.118:63231    10.124.247.224:36842    ESTABLISHED 3308/sge_qmaster
tcp        0      0 10.124.245.118:52084    10.124.245.118:63231    ESTABLISHED 4325/sge_execd  
tcp6       0      0 :::22                   :::*                    LISTEN      933/sshd        
udp        0      0 0.0.0.0:60033           0.0.0.0:*                           5147/rpc.statd  
udp        0      0 0.0.0.0:2049            0.0.0.0:*                           -               
udp        0      0 0.0.0.0:659             0.0.0.0:*                           5147/rpc.statd  
udp        0      0 0.0.0.0:68              0.0.0.0:*                           839/dhclient3   
udp        0      0 0.0.0.0:33485           0.0.0.0:*                           5110/rpc.mountd 
udp        0      0 0.0.0.0:59088           0.0.0.0:*                           612/avahi-daemon: r
udp        0      0 0.0.0.0:45161           0.0.0.0:*                           -               
udp        0      0 0.0.0.0:5353            0.0.0.0:*                           612/avahi-daemon: r
udp        0      0 0.0.0.0:111             0.0.0.0:*                           5133/portmap    
Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node   PID/Program name    Path
unix  2      [ ACC ]     STREAM     LISTENING     6288     621/hald            @/var/run/hald/dbus-PYeYdpTPKC
unix  10     [ ]         DGRAM                    6153     584/rsyslogd        /dev/log
unix  2      [ ACC ]     STREAM     LISTENING     6221     621/hald            @/var/run/hald/dbus-aIzyxoSgwD
unix  2      [ ACC ]     STREAM     LISTENING     6946     1075/mysqld         /var/run/mysqld/mysqld.sock
unix  2      [ ACC ]     STREAM     LISTENING     6198     612/avahi-daemon: r /var/run/avahi-daemon/socket
unix  2      [ ACC ]     STREAM     LISTENING     3745     1/init              @/com/ubuntu/upstart
unix  2      [ ACC ]     STREAM     LISTENING     7515     1230/apache2        /var/run/apache2/cgisock.1226
unix  2      [ ACC ]     STREAM     LISTENING     5467     582/dbus-daemon     /var/run/dbus/system_bus_socket
unix  2      [ ]         DGRAM                    3819     338/udevd           @/org/kernel/udev/udevd
unix  2      [ ]         DGRAM                    6319     621/hald            @/org/freedesktop/hal/udev_event
unix  3      [ ]         STREAM     CONNECTED     16204    582/dbus-daemon     /var/run/dbus/system_bus_socket
unix  3      [ ]         STREAM     CONNECTED     16203    5515/0              
unix  2      [ ]         DGRAM                    16202    5515/0              
unix  2      [ ]         DGRAM                    15304    5147/rpc.statd      
unix  2      [ ]         DGRAM                    15222    5133/portmap        
unix  2      [ ]         DGRAM                    6939     1076/logger         
unix  2      [ ]         DGRAM                    6615     839/dhclient3       
unix  2      [ ]         DGRAM                    6376     1/init              
unix  3      [ ]         STREAM     CONNECTED     6306     621/hald            @/var/run/hald/dbus-PYeYdpTPKC
unix  3      [ ]         STREAM     CONNECTED     6305     717/hald-runner     
unix  3      [ ]         STREAM     CONNECTED     6285     582/dbus-daemon     /var/run/dbus/system_bus_socket
unix  3      [ ]         STREAM     CONNECTED     6284     643/console-kit-dae 
unix  2      [ ]         DGRAM                    6278     643/console-kit-dae 
unix  3      [ ]         STREAM     CONNECTED     6267     582/dbus-daemon     /var/run/dbus/system_bus_socket
unix  3      [ ]         STREAM     CONNECTED     6266     643/console-kit-dae 
unix  3      [ ]         STREAM     CONNECTED     6223     582/dbus-daemon     /var/run/dbus/system_bus_socket
unix  3      [ ]         STREAM     CONNECTED     6222     621/hald            
unix  3      [ ]         STREAM     CONNECTED     6201     582/dbus-daemon     /var/run/dbus/system_bus_socket
unix  3      [ ]         STREAM     CONNECTED     6200     612/avahi-daemon: r 
unix  3      [ ]         STREAM     CONNECTED     6195     614/avahi-daemon: c 
unix  3      [ ]         STREAM     CONNECTED     6194     612/avahi-daemon: r 
unix  2      [ ]         DGRAM                    6191     612/avahi-daemon: r 
unix  3      [ ]         STREAM     CONNECTED     5513     582/dbus-daemon     /var/run/dbus/system_bus_socket
unix  3      [ ]         STREAM     CONNECTED     5512     1/init              
unix  3      [ ]         STREAM     CONNECTED     5509     582/dbus-daemon     
unix  3      [ ]         STREAM     CONNECTED     5508     582/dbus-daemon     
unix  3      [ ]         DGRAM                    3843     338/udevd           
unix  3      [ ]         DGRAM                    3842     338/udevd           
unix  3      [ ]         STREAM     CONNECTED     3810     1/init              @/com/ubuntu/upstart
unix  3      [ ]         STREAM     CONNECTED     3807     326/upstart-udev-br


OUTPUT

   Active Internet connections (TCP, UDP, raw)
   Proto
       The protocol (tcp, udp, raw) used by the socket.

   Recv-Q
       The count of bytes not copied by the user program connected to this socket.

   Send-Q
       The count of bytes not acknowledged by the remote host.

   Local Address
       Address and port number of the local end of the socket.  Unless the --numeric (-n) option
       is specified, the socket address is resolved to its canonical host name (FQDN),  and  the
       port number is translated into the corresponding service name.

   Foreign Address
       Address and port number of the remote end of the socket.  Analogous to "Local Address."

   State
       The state of the socket. Since there are no states in raw mode and usually no states used
       in UDP, this column may be left blank. Normally this can be one of several values:

       ESTABLISHED
              The socket has an established connection.

       SYN_SENT
              The socket is actively attempting to establish a connection.

       SYN_RECV
              A connection request has been received from the network.

       FIN_WAIT1
              The socket is closed, and the connection is shutting down.

       FIN_WAIT2
              Connection is closed, and the socket is waiting for a  shutdown  from  the  remote
              end.

       TIME_WAIT
              The socket is waiting after close to handle packets still in the network.

       CLOSED The socket is not being used.

       CLOSE_WAIT
              The remote end has shut down, waiting for the socket to close.

       LAST_ACK
              The  remote  end has shut down, and the socket is closed. Waiting for acknowledge-
              ment.

       LISTEN The socket is listening for incoming connections.  Such sockets are  not  included
              in the output unless you specify the --listening (-l) or --all (-a) option.

       CLOSING
              Both sockets are shut down but we still don't have all our data sent.

       UNKNOWN
              The state of the socket is unknown.

   User
       The username or the user id (UID) of the owner of the socket.



3) USING lsof -i -n -P

NB: DOESN'T SHOW ALL

lsof -i -n -P 

    COMMAND    PID     USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
    avahi-dae  612    avahi   14u  IPv4   6213      0t0  UDP *:5353 
    avahi-dae  612    avahi   15u  IPv4   6214      0t0  UDP *:59088 
    dhclient3  839     root    4u  IPv4   6616      0t0  UDP *:68 
    sshd       933     root    3u  IPv4   6823      0t0  TCP *:22 (LISTEN)
    sshd       933     root    4u  IPv6   6825      0t0  TCP *:22 (LISTEN)
    mysqld    1075    mysql   10u  IPv4   6945      0t0  TCP 127.0.0.1:3306 (LISTEN)
    apache2   1226     root    3u  IPv4   7497      0t0  TCP *:80 (LISTEN)
    apache2   1245 www-data    3u  IPv4   7497      0t0  TCP *:80 (LISTEN)
    apache2   1246 www-data    3u  IPv4   7497      0t0  TCP *:80 (LISTEN)
    sge_qmast 3308 sgeadmin    3u  IPv4  11909      0t0  TCP *:63231 (LISTEN)
    sge_qmast 3308 sgeadmin    4u  IPv4  13207      0t0  TCP 10.124.245.118:63231->10.124.245.118:52084 (ESTABLISHED)
    sge_qmast 3308 sgeadmin    5u  IPv4  13246      0t0  TCP 10.124.245.118:63231->10.124.247.224:36842 (ESTABLISHED)
    sge_execd 4325 sgeadmin    3u  IPv4  13205      0t0  TCP *:63232 (LISTEN)
    sge_execd 4325 sgeadmin    4u  IPv4  13206      0t0  TCP 10.124.245.118:52084->10.124.245.118:63231 (ESTABLISHED)
    rpc.mount 5110     root    7u  IPv4  15135      0t0  UDP *:33485 
    rpc.mount 5110     root    8u  IPv4  15140      0t0  TCP *:33932 (LISTEN)
    portmap   5133   daemon    5u  IPv4  15224      0t0  UDP *:111 
    portmap   5133   daemon    6u  IPv4  15225      0t0  TCP *:111 (LISTEN)
    rpc.statd 5147    statd    6u  IPv4  15306      0t0  UDP *:659 
    rpc.statd 5147    statd    8u  IPv4  15313      0t0  UDP *:60033 
    rpc.statd 5147    statd    9u  IPv4  15316      0t0  TCP *:43829 (LISTEN)
    sshd      5515     root    3r  IPv4  16171      0t0  TCP 10.124.245.118:22->10.127.158.202:47131 (ESTABLISHED)







NFS

server ports keep changing
http://ubuntuforums.org/showthread.php?t=180457

Hi there,

Whenever I reboot my server, the ports used by mountd and statd seem to change, always in the region of 860 and 980, respectively. I wouldn't mind, except that my server is firewalled and I have to mess with the server's iptables config if I want to mount an NFS share on a client! Can anybody tell me how to nail down the ports used by an NFS server?

Thanks,
// dave
  	
 May 22nd, 2006	   #2
joft
Gee! These Aren't Roasted!

 
Join Date: Dec 2005
Location: Germany
Beans: 179
Ubuntu 9.10 Karmic Koala
Re: NFS server ports keep changing
Hi,

you have to edit /etc/default/nfs-common (for statd) and /etc/default/nfs-kernel-server (vor mountd). In the first one search for the variable STATDOPTS and append -p < portnumber> (inside the "). In the second one you need to look for RPCMOUNTDOPTS and use the same thing: -p < anotherport> .




NFS-RELATED STARCLUSTER MAILING LIST ENTRIES:

--001636d34cc6727067048da1f1dc
Content-Type: text/plain; charset=ISO-8859-1

I've got a 20GB volume that I created using startcluster createvolume that I
want to enlarge to 1 TB.   I've tried to follow these instructions:

  http://www.capsunlock.net/2009/06/enlarge-amazon-ebs-volume.html

for ext3 filesystems.

However, I think I'm using the wrong fs type, since -- even before trying to
re-write the partition table -- I can't mount the drive as ext3, e.g.

[root@domU-12-31-39-0C-DC-22 /]# mount -t ext3 /dev/sdi /home
mount: wrong fs type, bad option, bad superblock on /dev/sdi,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so


Similary, I can't mount it as xfs either.   Knowing that nfs is somehow
involved here, I tried:

[root@domU-12-31-39-0C-DC-22 /]# mount -t nfs /dev/sdi /home
mount: directory to mount not in host:dir format

I'm not at all familiar with the details of how nfs works ...  So --, what
is the correct procedure for me to follow?

Thanks!
Dan



On 08/12/2010 11:43 AM, Dan Yamins wrote:
> Does this completely confirm that the larger 500 GB volume is completely
> "seen"?   (And if so, does this mean that nothing like resize2fs or
> xfs_growfs is necessary?)

Dan,

- From the fdisk -l output you sent you can see that you have a larger
volume now (536.8GB) however your partition is still only 20GB big:

20964824(blocks)/1024.0(blocks/MB) ~= 20GB

You need to recreate the partition to be 536.8GB and then run resize2fs:

If you're doing this on a StarCluster you'll first need to run the
following command (as root) on each node of the cluster for the
mount_path defined in your volume's StarCluster config:

$ umount MOUNT_PATH

Then shutdown the nfs service (as root) on the master node:

$ /etc/init.d/nfs stop

After that do the following (as root) to resize your new volume:

$ umount /dev/sdz
$ fdisk /dev/sdz

# Type 'd' to delete the primary partition
# Type 'n' for new partition
# Type 'p' for primary
# Type '1' for 1st
# Type Enter for 1st cylinder
# Type Enter for last cylinder (full disk)
# Type 'w' to finish

$ e2fsck -f /dev/sdz1
$ resize2fs -p /dev/sdz1
$ fsck -f -y /dev/sdz1

Then you should be able to mount the new volume:

$ mount /dev/sdz1 MOUNT_PATH

And start nfs again on the master:

$ /etc/init.d/nfs start

And re-mount the NFS drives for that volume on each of the nodes:

$ mount MOUNT_PATH

HTH,

Justin




MIGHT NEED THIS TO SET PORTMAP PORTS SO THEY DON'T CHANGE WHEN NFS IS RESTARTED:
http://pario.no/2008/01/15/allow-nfs-through-iptables-on-a-redhat-system/

15 Jan 08 Allow NFS through iptables on a RedHat system
Posted by Hans-Henry Jakobsen

This post describes how you can configure your RedHat Enterprise WS 4 NFS system behind a iptables firewall to be available for clients outside the firewall on a permanent basis.

Symptom
NFS relies on portmap to assign the ports on which it will listen. One side effect of this is that the ports are randomly assigned, so each time NFS is restarted the ports will change. This can make it difficult to run an NFS server behind a firewall which only allows access to specific ports on the system.

Solution
The first step is to assign a permanent port number to each of the NFS services (rquotad, mountd, statd, and lockd). While they can use any unused ports greater than 1024, it is recommended that you first consult the file /etc/services to find a valid unused port range. The following examples use the range 10000-10005.

The majority of the ports are configured through the file:

/etc/sysconfig/nfs

You will need to create this file if it does not exist. It should look similar to the following example:

# NFS port numbers
STATD_PORT=10002
STATD_OUTGOING_PORT=10003
MOUNTD_PORT=10004
RQUOTAD_PORT=10005
The lockd service is configured differently from the others because it is compiled as a kernel module. To set the port which lockd uses, add these options in the /etc/sysconfig/nfs file:

LOCKD_UDPPORT=30001
LOCKD_TCPPORT=30001
where “30001? can be replaced with any port that is available and can be assigned for use.

After these configuration changes, you can view the port assignments with the command rpcinfo -p

# rpcinfo -p | awk -F " " '{print $3 ", " $4 ", " $5}' | sort | uniq
   proto, port,
tcp, 111, portmapper
tcp, 2049, nfs
tcp, 32771, nlockmgr
tcp, 800, rquotad
tcp, 814, mountd
udp, 111, portmapper
udp, 2049, nfs
udp, 32768, nlockmgr
udp, 797, rquotad
udp, 811, mountd
At this point, the ports will remain the same when NFS is restarted. The following is a list of ports which need to be opened on the firewall:

proto, port,
tcp, 10004, mountd
tcp, 10005, rquotad
tcp, 111, portmapper
tcp, 2049, nfs
tcp, 32771, nlockmgr
udp, 10004, mountd
udp, 10005, rquotad
udp, 111, portmapper
udp, 2049, nfs
udp, 32768, nlockmgr
You can now open these ports on the firewall to allow remote clients to mount a share on the server. If you are using iptables, the following commands can be used to add inbound/outbound rules to allow access to these ports.
Note that this is only an example, as your specific firewall rules may differ.
This is an excerp of my /etc/sysconfig/iptables file. It allows NFS connections from IP address 192.168.0.10 but doesn’t restrict traffic out.

-A RH-Firewall-1-INPUT -s 192.168.0.10 -p tcp -m tcp --dport 111 -j ACCEPT
-A RH-Firewall-1-INPUT -s 192.168.0.10 -p udp -m udp --dport 111 -j ACCEPT
-A RH-Firewall-1-INPUT -s 192.168.0.10  -p tcp -m tcp --dport 2049 -j ACCEPT
-A RH-Firewall-1-INPUT -s 192.168.0.10 -p udp -m udp --dport 2049 -j ACCEPT
-A RH-Firewall-1-INPUT -s 192.168.0.10 -p tcp -m tcp --dport 10000 -j ACCEPT
-A RH-Firewall-1-INPUT -s 192.168.0.10 -p udp -m udp --dport 10001 -j ACCEPT
-A RH-Firewall-1-INPUT -s 192.168.0.10 -p tcp -m tcp --dport 10002:10005 -j ACCEPT
-A RH-Firewall-1-INPUT -s 192.168.0.10 -p udp -m udp --dport 10002:10005 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A RH-Firewall-1-INPUT -i eth0 -p tcp -m tcp -j LOG --log-prefix "Reject Traffic " --log-level 6
-A RH-Firewall-1-INPUT -i eth0 -p tcp -m tcp -j REJECT --reject-with icmp-port-unreachable
This post is a modified example of the solution from RedHat Knowledgebase Article ID 5928.

Tags: iptables, NFS, RedHat, rpcinfo








DO IT WITH SSH
http://www.howtogeek.com/howto/ubuntu/how-to-mount-a-remote-folder-using-ssh-on-ubuntu/


DO IT WITH NFS
http://www.techotopia.com/index.php/Sharing_Ubuntu_Linux_Folders_with_Remote_Linux_and_UNIX_Systems

Installing NFS Services on Ubuntu

The services required to enable NFS folder sharing are not installed by default on Ubuntu. They can easily be installed, however, by opening a terminal window and entering the following command:

sudo apt-get install nfs-kernel-server

The installation process should automatically start the NFS service. To verify that the service is indeed running, execute the following command:

sudo /etc/init.d/nfs-kernel-server status

If the output from the above command indicates that the service is not running, it may starte
d as follows:

sudo /etc/init.d/nfs-kernel-server start


Sharing Folders

Once the NFS service is installed and running, the next step is to configure any folders that are to be shared with remote systems. Any folders which are to be shared are listed in the /etc/exports file which may be edited from a terminal window as follows:

sudo gedit /etc/exports

Each folder that is to be shared via NFS must have an entry in this file. The basic syntax is as follows:

< folder path> < hostname>(permissions)

For example, to allow a system with the IP address of 192.168.2.24 to access /tmp with read-only access, the following entry would be added to the /etc/exports file:

/tmp	192.168.2.24(rw,sync,no_subtree_check)

Similarly, to also make the folder accessible to a system with the hostname ubuntu2 with read/write permission, the line would read as follows:

/tmp	192.168.2.24(ro,sync,no_subtree_check) ubuntu2(rw,sync,no_sub_tree_check)

Alternatively, to provided read/write access to all hosts, simply use the wildcard character (*):

/tmp    *((rw,sync,no_sub_tree_check)

Once the folder entries have been made in the /etc/exports file, the current settings may be checked at any time by running the exportfs command:

sudo exportfs

/tmp          	192.168.2.24



Configuring the Firewall

If the Ubuntu system on which the NFS server is running has a firewall activated, it is essential that the firewall on the NFS server system be configured to allow NFS traffic before any folders can be mounted over the network. For more details on firewall configuration refer to Basic Ubuntu Linux Firewall Configuration and Using Firestarter to Configure an Ubuntu Linux Firewall. By default, Ubuntu does not configure a firewall to block NFS traffic. Unless you have specifically configured a firewall since installing Ubuntu it should not, therefore, be necessary to make any changes for NFS to work.


Mounting a Remote NFS Folder

Once a folder has been exported it may then be mounted on a client system using the mount command. To mount a remote folder from the command line, open a terminal window and create folder where you would like the remote folder to be mounted:

mkdir /tmp/mnt

Next enter the command to mount to the remote folder (in this example we use ubuntu as the remote hostname):

sudo mount ubuntu:/tmp /tmp/mnt

The remote folder will then be mounted on the local system. Once mounted, the /tmp/mnt folder will contain the remote folder and all its contents.




http://www.ubuntugeek.com/nfs-server-and-client-configuration-in-ubuntu.html

NFS Server and Client Configuration in Ubuntu
May 2, 2007 · Server · Email This Post
Share
9
If you're new here, you may want to subscribe to my RSS feed and if you have questions related to your ubuntu system post question to our forums. Thanks for visiting!



 NFS was developed at a time when we weren’t able to share our drives like we are able to today - in the Windows environment. It offers the ability to share the hard disk space of a big server with many smaller clients. Again, this is a client/server environment. While this seems like a standard service to offer, it was not always like this. In the past, clients and servers were unable to share their disk space.
Thin clients have no hard drives and thus need a “virtual” hard-disk. The NFS mount their hard disk from the server and, while the user thinks they are saving their documents to their local (thin client) disk, they are in fact saving them to the server. In a thin client environment, the root, usr and home partitions are all offered to the client from the server via NFS.

NFS Advantages

• Local workstations use less disk space because commonly used data can be stored on a single machine and still remain accessible to others over the network.

• There is no need for users to have separate home directories on every network machine. Home directories could be set up on the NFS server and made available throughout the network.

• Storage devices such as floppy disks, CDROM drives, and Zip® drives can be used by other machines on the network. This may reduce the number of removable media drives throughout the network.

Install NFS Server in Ubuntu

sudo apt-get install nfs-kernel-server nfs-common portmap

When configuring portmap do =not= bind loopback. If you do you can either edit /etc/default/portmap using the following

sudo vi /etc/default/portmap

or use the following command

sudo dpkg-reconfigure portmap

Restart Portmap using the following command

sudo /etc/init.d/portmap restart

NFS Server Configuration

NFS exports from a server are controlled by the file /etc/exports. Each line begins with the absolute path of a directory to be exported, followed by a space-seperated list of allowed clients.

You need to edit the exports file using the following command

sudo vi /etc/exports

Here are some quick examples of what you could add to your /etc/exports

For Full Read Write Permissions allowing any computer from 192.168.1.1 through 192.168.1.255

/files 192.168.1.1/24(rw,no_root_squash,async)

Or for Read Only from a single machine

/files 192.168.1.2 (ro,async)

save this file and exit

A client can be specified either by name or IP address. Wildcards (*) are allowed in names, as are netmasks (e.g. /24) following IP addresses, but should usually be avoided for security reasons.

A client specification may be followed by a set of options, in parenthesis. It is important not to leave any space between the last client specification character and the opening parenthesis, since spaces are intrepreted as client seperators.

Now you need to restart NFS server using the following command

sudo /etc/init.d/nfs-kernel-server restart

If you make changes to /etc/exports on a running NFS server, you can make these changes effective by issuing the command

sudo exportfs -a

Install NFS client support in Ubuntu

sudo apt-get install portmap nfs-common

This will install all the required packages for nfs client

Mounting manually

Example to mount server.mydomain.com:/files to /files. In this example server.mydomain.com is the name of the server containing the nfs share, and files is the name of the share on the nfs server

The mount point /files must first exist on the client machine.

Create files directory using the following command

sudo mkdir files

You need to mount the share using the following command

sudo mount server.mydomain.com:/files /files

Now you may need to restart services using the following command

sudo /etc/init.d/portmap restart

sudo /etc/init.d/nfs-common restart

Mounting at boot using /etc/fstab

If you want to mount using fstab file

sudo vi /etc/fstab

In this example my /etc/fstab was like this

server.mydomain.com:/files /files nfs rsize=8192,wsize=8192,timeo=14,intr

Change “servername.mydomain.com:/files”, and “/files” to match your server name,share name, and the name of the mount point you created.

Firewall Ports for NFS

If you have a firewall you need to make sure ports 32771, 111 and 2049 are open
Testing Your Configuration

Use the following command in terminal to test

mount /files

the mount point /files will be mounted from the server.

Reference

http://czarism.com/easy-peasy-ubuntu-linux-nfs-file-sharing







DIDN'T WORK:
http://docs.hp.com/en/B1031-90043/ch07s04.html
START mountd LOGGING

/usr/sbin/rpc.mountd -l /var/adm/mountd.log

    root      4802     1  0 05:37 ?        00:00:00 /usr/sbin/rpc.mountd --manage-gids
    root      4807  4668  0 05:58 pts/1    00:00:00 grep mountd

kill -9 4802


LOG MOUNT REQUESTS, FAILURES AND OTHER ERRORS WITH -t2 OPTION:


/usr/sbin/rpc.mountd -l /var/log/mountd.log -t 2 --manage-gids

    Usage: /usr/sbin/rpc.mountd [-F|--foreground] [-h|--help] [-v|--version] [-d kind|--debug kind]
            [-o num|--descriptors num] [-f exports-file|--exports-file=file]
            [-p|--port port] [-V version|--nfs-version version]
            [-N version|--no-nfs-version version] [-n|--no-tcp]
            [-H ha-callout-prog] [-s|--state-directory-path path]
            [-g|--manage-gids] [-t num|--num-threads=num]
            
To stop logging, kill rpc.mountd and restart it without the -l logfile and -t2 options.


/usr/sbin/rpc.mountd --manage-gids


BASED ON:


GET LOG OF mountd
http://docs.hp.com/en/B1031-90043/ch07s04.html

To Start and Stop rpc.mountd Logging
Issue the following commands to kill the rpc.mountd process and restart it with logging turned on (PID is a process ID returned by the ps command):


ps -ef | grep mountd
kill PID
/usr/sbin/rpc.mountd -l /var/adm/mountd.log

If you want rpc.mountd to log mount requests and mount failures as well as errors, add the -t2 option to the rpc.mountd command, as in the following example:


/usr/sbin/rpc.mountd -l /var/adm/mountd.log -t2

To stop logging, kill rpc.mountd and restart it without the -l logfile and -t2 options.

If you do not specify the -l or-t option, rpc.mountd logs only errors to /var/adm/mountd.log. If this file does not exist, rpc.mountd creates it. rpc.mountd can share the same log file with the other NFS daemons.

For more information, type man 1M mountd at the HP-UX prompt.

</entry>


<entry [Fri Jan  7 14:21:39 EST 2011] MOUNTED VOLUME FROM SNAPSHOT ON MASTER AND NODES>

1. CREATE, PARTITION AND FORMAT VOLUME ON AQUARIUS-7 (JGILBERT)

http://web.mit.edu/stardev/cluster/docs/create_volume_manually.html#partitioning-and-formatting-the-new-volume

ec2-create-volume --availability-zone us-east-1a --size 40

    VOLUME  vol-3a05ad52    40              us-east-1a      creating        2011-01-05T15:34:28+0000

ec2-attach-volume vol-3a05ad52 -i i-b42f3fd9 -d /dev/sdj

    ATTACHMENT      vol-3a05ad52    i-b42f3fd9      /dev/sdj        attaching       2011-01-05T15:36:28+0000

ec2-describe-volumes


PARTITION THE VOLUME WITH ONE LINUX ext2 PARTITION USING THE WHOLE VOLUME

echo ",,L" | sfdisk -L /dev/sdj

    Checking that no-one is using this disk right now ...
    OK
    
    Disk /dev/sdj: 5221 cylinders, 255 heads, 63 sectors/track
    Old situation:
    Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0
    
       Device Boot Start     End   #cyls    #blocks   Id  System
    /dev/sdj1          0+   5220    5221-  41937682   83  Linux
    /dev/sdj2          0       -       0          0    0  Empty
    /dev/sdj3          0       -       0          0    0  Empty
    /dev/sdj4          0       -       0          0    0  Empty
    New situation:
    Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0
    
       Device Boot Start     End   #cyls    #blocks   Id  System
    /dev/sdj1          0+   5220    5221-  41937682   83  Linux
    /dev/sdj2          0       -       0          0    0  Empty
    /dev/sdj3          0       -       0          0    0  Empty
    /dev/sdj4          0       -       0          0    0  Empty
    Warning: no primary partition is marked bootable (active)
    This does not matter for LILO, but the DOS MBR will not boot this disk.
    Successfully wrote the new partition table
    
    Re-reading the partition table ...
    
    If you created or changed a DOS partition, /dev/foo7, say, then use dd(1)
    to zero the first 512 bytes:  dd if=/dev/zero of=/dev/foo7 bs=512 count=1


FORMAT THE NEWLY CREATED PARTITION (NB: ***/dev/sdj1*** ):

mkfs.ext3 /dev/sdj1
    
    mke2fs 1.39 (29-May-2006)
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    5242880 inodes, 10484420 blocks
    524221 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=4294967296
    320 block groups
    32768 blocks per group, 32768 fragments per group
    16384 inodes per group
    Superblock backups stored on blocks: 
            32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
            4096000, 7962624
    
    Writing inode tables: done                            
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: done
    
    This filesystem will be automatically checked every 36 mounts or
    180 days, whichever comes first.  Use tune2fs -c or -i to override.


MOUNT THE NEWLY CREATED PARTITION (NB: ***/dev/sdj1*** ):
mount -t ext2 /dev/sdj1 /scvol

COPy OVER DATA FROM /data TO /scvol
cp -rp /data/* /scvol


    
UNMOUNTED AND DETACHED /dev/sdj1 AND CREATED SNAPSHOT IN ELASTICFOX.
ADDED CONFIG FILE ENTRIES:

[starcluster]
DATASNAPSHOT snap-4b4fcf26
DATASIZE     40
DATADEVICE   /dev/sdj




2. SET CONFIG ON MASTER 

/agua/bin/apps/cluster/starcluster.pl writeConfigfile \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--amazonuserid 558277860346 \
--accesskeyid AKIAJWZIAB2ZZB7FHJIQ \
--secretaccesskey 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 \
--keyname admin-key \
--username admin


GENERATES VOLUME FROM SNAPSHOT:
    vol-fa3e9692


AND ADDS 'PARTITION' TO volume SECTION OF CONFIG:

    [volume data]
    DEVICE=/dev/sdj
    MOUNT_PATH=/data
    PARTITION=1
    VOLUME_ID=vol-fc5af194







NOTES
-----


ERROR: ON START smallcluster, GET THIS:

    clustersetup.py:201 - WARNING - Cannot find partition /dev/sdh1 on volume vol-5e802836
    clustersetup.py:203 - WARNING - Not mounting vol-5e802836 on /data


SOLUTION

MUST FIRST ADD PARTITION TO VOLUME BEFORE YOU MAKE IT A SNAPSHOT


DIAGNOSIS:

START smallcluster

starcluster -c /nethome/admin/.starcluster/config start smallcluster
    
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 2-node cluster...
    >>> Launching master node...
    >>> Master AMI: ami-a5c42dcc
    >>> Creating security group @sc-smallcluster...
    Reservation:r-a3d0f8c9
    >>> Launching worker nodes...
    >>> Node AMI: ami-a5c42dcc
    Reservation:r-a7d0f8cd
    >>> Waiting for cluster to start.../>>> The master node is ec2-50-16-5-253.compute-1.amazonaws.com
    >>> Attaching volume vol-5e802836 to master node on /dev/sdh ...
     
    >>> Setting up the cluster...
    >>> Mounting EBS volume vol-5e802836 on /data...
    >>> Using private key /nethome/admin/.starcluster/id_rsa-admin-key (rsa)
    clustersetup.py:201 - WARNING - Cannot find partition /dev/sdh1 on volume vol-5e802836
    clustersetup.py:203 - WARNING - Not mounting vol-5e802836 on /data
    clustersetup.py:206 - WARNING - This either means that the volume has not beenpartitioned or that the partition specifieddoes not exist on the volume
    >>> Creating cluster user: sgeadmin
    >>> Using private key /nethome/admin/.starcluster/id_rsa-admin-key (rsa)
    >>> Configuring scratch space for user: sgeadmin
    >>> Configuring /etc/hosts on each node
    >>> Configuring NFS...
    ssh.py:245 - ERROR - command mount /data failed with status 32
    >>> Configuring passwordless ssh for root
    >>> Configuring passwordless ssh for user: sgeadmin
    >>> Generating local RSA ssh keys for user: sgeadmin
    >>> Installing Sun Grid Engine...
    >>> Done Configuring Sun Grid Engine
    >>> 
    
    The cluster has been started and configured. 
    
    Login to the master node as root by running: 
    
        $ starcluster sshmaster smallcluster
    
    or manually as sgeadmin:
    
        $ ssh -i /nethome/admin/.starcluster/id_rsa-admin-key sgeadmin@ec2-50-16-5-253.compute-1.amazonaws.com
    
    When you are finished using the cluster, run:
    
        $ starcluster stop smallcluster
    
    to shutdown the cluster and stop paying for service
    
            
    >>> start took 4.793 mins


ERROR WAS FROM StarCluster-0.91/starcluster/clustersetup.py:

    def _setup_ebs_volumes(self):
        """
        Mount EBS volumes, if specified in ~/.starcluster/config to /home
        """
        # setup /etc/fstab on master to use block device if specified
        master = self._master
        devs = master.ssh.ls('/dev')
        for vol in self._volumes:
            vol = self._volumes[vol]
            vol_id = vol.get("volume_id")
            mount_path = vol.get('mount_path')
            device = vol.get("device")
            volume_partition = vol.get('partition')
            if not (vol_id and device and mount_path):
                log.error("missing required settings for vol %s" % vol)
                continue
            if not master.ssh.path_exists(device):
                log.warn("Cannot find device %s for volume %s" % (device, vol))
                log.warn("Not mounting %s on %s" % (vol_id, mount_path))
                log.warn("This usually means there was a problem" + \
                         "attaching the EBS volume to the master node")
                continue
            if not volume_partition:
                partitions = filter(lambda x: x.startswith(device), devs)
                if len(partitions) == 1:
                    volume_partition = device
                elif len(partitions) == 2:
                    volume_partition = device + '1'
                else:
                    log.error(
                        "volume has more than one partition, must specify" + \
                        "a partition to use in the config")
                    continue
            elif not master.ssh.path_exists(volume_partition):
                log.warn("Cannot find partition %s on volume %s" % \
                         (volume_partition, vol_id))
                log.warn("Not mounting %s on %s" % (vol_id,
                                                    mount_path))
                log.warn("This either means that the volume has not " + \
                         "been partitioned or that the partition" + \
                         "specified does not exist on the volume")
                continue
            log.info("Mounting EBS volume %s on %s..." % (vol_id, mount_path))
            mount_map = self._master.get_mount_map()
            dev = mount_map.get(volume_partition)
            if dev:
                path, fstype, options = dev
                if path != mount_path:
                    log.error("Volume %s is mounted on %s, not on %s" % \
                              (vol_id, path, mount_path))
                else:
                    log.info(
                        "Volume %s already mounted on %s...skipping" % \
                        (vol_id, mount_path))
                continue
            self._master.mount_device(volume_partition, mount_path)



CONNECT TO MASTER:

starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster


df -ah
   Filesystem            Size  Used Avail Use% Mounted on
   /dev/sda1             9.9G  3.9G  5.5G  42% /
   proc                     0     0     0   -  /proc
   none                     0     0     0   -  /sys
   none                     0     0     0   -  /sys/fs/fuse/connections
   none                     0     0     0   -  /sys/kernel/debug
   none                     0     0     0   -  /sys/kernel/security
   udev                  3.8G   84K  3.8G   1% /dev
   none                     0     0     0   -  /dev/pts
   none                  3.8G     0  3.8G   0% /dev/shm
   none                  3.8G   84K  3.8G   1% /var/run
   none                  3.8G     0  3.8G   0% /var/lock
   none                  3.8G     0  3.8G   0% /lib/init/rw
   /dev/sdb              414G  199M  393G   1% /mnt
   nfsd                     0     0     0   -  /proc/fs/nfsd
   sunrpc                   0     0     0   -  /var/lib/nfs/rpc_pipefs

root@domU-12-31-38-04-FE-4F:~# ls -al /
   total 84
   drwxr-xr-x  21 root root  4096 2011-01-05 05:10 .
   drwxr-xr-x  21 root root  4096 2011-01-05 05:10 ..
   drwxr-xr-x   2 root root  4096 2010-02-18 00:17 bin
   drwxr-xr-x   3 root root  4096 2010-02-18 00:13 boot
   drwxr-xr-x  11 root root 12820 2011-01-05 05:10 dev
   drwxr-xr-x 103 root root  4096 2011-01-05 05:10 etc
   drwxr-xr-x   4 root root  4096 2011-01-05 05:10 home
   lrwxrwxrwx   1 root root    30 2010-01-21 04:09 initrd.img -> boot/initrd.img-2.6.31-302-ec2
   lrwxrwxrwx   1 root root    32 2010-01-21 04:08 initrd.img.old -> boot/initrd.img-2.6.31-17-server
   drwxr-xr-x  12 root root  4096 2010-02-18 00:15 lib
   lrwxrwxrwx   1 root root     4 2010-01-21 04:00 lib64 -> /lib
   drwx------   2 root root 16384 2010-01-21 04:00 lost+found
   drwxr-xr-x   4 root root  4096 2011-01-05 05:10 mnt
   drwxr-xr-x   5 root root  4096 2011-01-05 05:10 opt
   dr-xr-xr-x 105 root root     0 2011-01-05 05:08 proc
   drwx------   7 root root  4096 2011-01-05 05:08 root
   drwxr-xr-x   2 root root  4096 2010-02-18 00:15 sbin
   drwxr-xr-x   2 root root  4096 2011-01-05 05:10 scratch
   drwxr-xr-x   2 root root  4096 2009-10-20 00:48 selinux
   drwxr-xr-x   3 root root  4096 2010-02-18 00:16 srv
   drwxr-xr-x  13 root root     0 2011-01-05 05:08 sys
   drwxrwxrwt   4 root root  4096 2011-01-05 05:10 tmp
   drwxr-xr-x  11 root root  4096 2010-02-18 00:15 usr
   drwxr-xr-x  16 root root  4096 2010-02-18 00:15 var
   lrwxrwxrwx   1 root root    27 2010-01-21 04:09 vmlinuz -> boot/vmlinuz-2.6.31-302-ec2
   lrwxrwxrwx   1 root root    29 2010-01-21 04:08 vmlinuz.old -> boot/vmlinuz-2.6.31-17-server


TRY 2
-----
Wed Jan  5 08:57:18 EST 2011

RERAN writeConfigfile:

/agua/bin/apps/cluster/starcluster.pl writeConfigfile \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--amazonuserid 558277860346 \
--accesskeyid AKIAJWZIAB2ZZB7FHJIQ \
--secretaccesskey 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 \
--keyname admin-key \
--username admin


GENERATED THIS VOLUME:

    vol-fa3e9692


ADDED 'PARTITION' TO volume SECTION OF CONFIG:

    [volume data]
    DEVICE=/dev/sdh
    MOUNT_PATH=/data
    PARTITION=/dev/sdh1
    VOLUME_ID=vol-203c9448



START smallcluster

starcluster -c /nethome/admin/.starcluster/config start smallcluster

    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 2-node cluster...
    >>> Launching master node...
    >>> Master AMI: ami-a5c42dcc
    >>> Creating security group @sc-smallcluster...
    Reservation:r-610c270b
    >>> Launching worker nodes...
    >>> Node AMI: ami-a5c42dcc
    Reservation:r-7b0c2711
    >>> Waiting for cluster to start.../>>> The master node is ec2-184-72-91-142.compute-1.amazonaws.com
    >>> Attaching volume vol-fa3e9692 to master node on /dev/sdh ...
     
    >>> Setting up the cluster...
    >>> Mounting EBS volume vol-fa3e9692 on /data...
    >>> Using private key /nethome/admin/.starcluster/id_rsa-admin-key (rsa)
    clustersetup.py:201 - WARNING - Cannot find partition /dev/sdh1 on volume vol-fa3e9692
    clustersetup.py:203 - WARNING - Not mounting vol-fa3e9692 on /data
    clustersetup.py:206 - WARNING - This either means that the volume has not beenpartitioned or that the partition specifieddoes not exist on the volume
    >>> Creating cluster user: sgeadmin
    >>> Using private key /nethome/admin/.starcluster/id_rsa-admin-key (rsa)
    >>> Configuring scratch space for user: sgeadmin
    >>> Configuring /etc/hosts on each node
    >>> Configuring NFS...
    ssh.py:245 - ERROR - command mount /data failed with status 32
    >>> Configuring passwordless ssh for root
    >>> Configuring passwordless ssh for user: sgeadmin
    >>> Generating local RSA ssh keys for user: sgeadmin
    >>> Installing Sun Grid Engine...
    >>> Done Configuring Sun Grid Engine
    >>> 
    
    The cluster has been started and configured. 
    
    Login to the master node as root by running: 
    
        $ starcluster sshmaster smallcluster
    
    or manually as sgeadmin:
    
        $ ssh -i /nethome/admin/.starcluster/id_rsa-admin-key sgeadmin@ec2-184-72-91-142.compute-1.amazonaws.com
    
    When you are finished using the cluster, run:
    
        $ starcluster stop smallcluster
    
    to shutdown the cluster and stop paying for service
    
            
    >>> start took 4.782 mins



RECAP OF ERROR MESSAGE:

    >>> Mounting EBS volume vol-fa3e9692 on /data...
    >>> Using private key /nethome/admin/.starcluster/id_rsa-admin-key (rsa)
    clustersetup.py:201 - WARNING - Cannot find partition /dev/sdh1 on volume vol-fa3e9692
    clustersetup.py:203 - WARNING - Not mounting vol-fa3e9692 on /data
    clustersetup.py:206 - WARNING - This either means that the volume has not beenpartitioned or that the partition specifieddoes not exist on the volume


starcluster -c /nethome/admin/.starcluster/config listclusters      

    -----------------------------------------------
    smallcluster (security group: @sc-smallcluster)
    -----------------------------------------------
    Launch time: 2011-01-05T14:08:24.000Z
    Zone: us-east-1a
    Keypair: id_rsa-admin-key
    EBS volumes:
        vol-fa3e9692 on master:/dev/sdh (status: attached)
    Cluster nodes:
         master running i-fb25d397 ec2-184-72-91-142.compute-1.amazonaws.com 
        node001 running i-f725d39b ec2-184-72-210-165.compute-1.amazonaws.com 

CONNECT TO MASTER:

starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster


dmesg

    ...
    117.094440]  sdh: unknown partition table


ls -al /dev/sd*
brw-rw---- 1 root disk 8,   1 2011-01-05 14:10 /dev/sda1
brw-rw---- 1 root disk 8,  16 2011-01-05 14:10 /dev/sdb
brw-rw---- 1 root disk 8,  32 2011-01-05 14:10 /dev/sdc
brw-rw---- 1 root disk 8, 112 2011-01-05 14:12 /dev/sdh



CREATE, PARTITION AND FORMAT VOLUME ON AQUARIUS-7 (JGILBERT)

http://web.mit.edu/stardev/cluster/docs/create_volume_manually.html#partitioning-and-formatting-the-new-volume

ec2-create-volume --availability-zone us-east-1a --size 40

    VOLUME  vol-3a05ad52    40              us-east-1a      creating        2011-01-05T15:34:28+0000

ec2-attach-volume vol-3a05ad52 -i i-b42f3fd9 -d /dev/sdj

    ATTACHMENT      vol-3a05ad52    i-b42f3fd9      /dev/sdj        attaching       2011-01-05T15:36:28+0000

ec2-describe-volumes


PARTITION THE VOLUME WITH ONE LINUX ext2 PARTITION USING THE WHOLE VOLUME

echo ",,L" | sfdisk /dev/sdj

    Checking that no-one is using this disk right now ...
    OK
    
    Disk /dev/sdj: 5221 cylinders, 255 heads, 63 sectors/track
    
    sfdisk: ERROR: sector 0 does not have an msdos signature
     /dev/sdj: unrecognized partition table type
    Old situation:
    No partitions found
    New situation:
    Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0
    
       Device Boot Start     End   #cyls    #blocks   Id  System
    /dev/sdj1          0+   5220    5221-  41937682   83  Linux
    /dev/sdj2          0       -       0          0    0  Empty
    /dev/sdj3          0       -       0          0    0  Empty
    /dev/sdj4          0       -       0          0    0  Empty
    Warning: no primary partition is marked bootable (active)
    This does not matter for LILO, but the DOS MBR will not boot this disk.
    Successfully wrote the new partition table
    
    Re-reading the partition table ...
    
    If you created or changed a DOS partition, /dev/foo7, say, then use dd(1)
    to zero the first 512 bytes:  dd if=/dev/zero of=/dev/foo7 bs=512 count=1
    (See fdisk(8).)


REDO PARTITION BUT THIS TIME WITH '-L' TO IGNORE THE DOS-RELATED MESSAGES:

echo ",,L" | sfdisk -L /dev/sdj

    Checking that no-one is using this disk right now ...
    OK
    
    Disk /dev/sdj: 5221 cylinders, 255 heads, 63 sectors/track
    Old situation:
    Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0
    
       Device Boot Start     End   #cyls    #blocks   Id  System
    /dev/sdj1          0+   5220    5221-  41937682   83  Linux
    /dev/sdj2          0       -       0          0    0  Empty
    /dev/sdj3          0       -       0          0    0  Empty
    /dev/sdj4          0       -       0          0    0  Empty
    New situation:
    Units = cylinders of 8225280 bytes, blocks of 1024 bytes, counting from 0
    
       Device Boot Start     End   #cyls    #blocks   Id  System
    /dev/sdj1          0+   5220    5221-  41937682   83  Linux
    /dev/sdj2          0       -       0          0    0  Empty
    /dev/sdj3          0       -       0          0    0  Empty
    /dev/sdj4          0       -       0          0    0  Empty
    Warning: no primary partition is marked bootable (active)
    This does not matter for LILO, but the DOS MBR will not boot this disk.
    Successfully wrote the new partition table
    
    Re-reading the partition table ...
    
    If you created or changed a DOS partition, /dev/foo7, say, then use dd(1)
    to zero the first 512 bytes:  dd if=/dev/zero of=/dev/foo7 bs=512 count=1


FORMAT THE NEWLY CREATED PARTITION (NB: ***/dev/sdj1*** ):

mkfs.ext3 /dev/sdj1
    
    mke2fs 1.39 (29-May-2006)
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    5242880 inodes, 10484420 blocks
    524221 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=4294967296
    320 block groups
    32768 blocks per group, 32768 fragments per group
    16384 inodes per group
    Superblock backups stored on blocks: 
            32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
            4096000, 7962624
    
    Writing inode tables: done                            
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: done
    
    This filesystem will be automatically checked every 36 mounts or
    180 days, whichever comes first.  Use tune2fs -c or -i to override.



MOUNT THE NEWLY CREATED PARTITION (NB: ***/dev/sdj1*** ):

mount -t ext2 /dev/sdj1 /scvol



COPIED OVER DATA FROM /data TO /scvol

cp -rp /data/* /scvol



UNMOUNTED AND DETACHED /dev/sdj1 AND CREATED SNAPSHOT IN ELASTICFOX.
ADDED CONFIG FILE ENTRIES:

STARCLUSTERDATASNAPSHOT snap-4b4fcf26
STARCLUSTERDATASIZE     40
STARCLUSTERDATADEVICE   /dev/sdj


STOP starcluster

starcluster -c /nethome/admin/.starcluster/config stop smallcluster

    Shutdown cluster smallcluster (y/n)? Y
    >>> Shutting down i-fb25d397
    >>> Shutting down i-f725d39b
    >>> Removing cluster security group @sc-smallcluster

    Wed Jan  5 12:04:15 EST 2011










RERAN writeConfigfile TO GENERATE NEW VOLUME USING PARTITIONED SNAPSHOT:

Wed Jan  5 23:40:06 EST 2011

/agua/bin/apps/cluster/starcluster.pl writeConfigfile \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--amazonuserid 558277860346 \
--accesskeyid AKIAJWZIAB2ZZB7FHJIQ \
--secretaccesskey 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 \
--keyname admin-key \
--username admin

    StarCluster::createVolume    volumeid: vol-fc5af194


cat /nethome/admin/.starcluster/config

    ...
    [volume data]
    DEVICE=/dev/sdj
    MOUNT_PATH=/data
    PARTITION=1
    VOLUME_ID=vol-fc5af194



START smallcluster

starcluster -c /nethome/admin/.starcluster/config start smallcluster
    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 2-node cluster...
    >>> Launching master node...
    >>> Master AMI: ami-a5c42dcc
    >>> Creating security group @sc-smallcluster...
    Reservation:r-e1af858b
    >>> Launching worker nodes...
    >>> Node AMI: ami-a5c42dcc
    Reservation:r-e7af858d
    >>> Waiting for cluster to start.../>>> The master node is ec2-184-72-82-189.compute-1.amazonaws.com
    >>> Attaching volume vol-fc5af194 to master node on /dev/sdj ...
     
    >>> Setting up the cluster...
    >>> Mounting EBS volume vol-fc5af194 on /data...
    >>> Using private key /nethome/admin/.starcluster/id_rsa-admin-key (rsa)
    >>> Creating cluster user: sgeadmin
    >>> Using private key /nethome/admin/.starcluster/id_rsa-admin-key (rsa)
    >>> Configuring scratch space for user: sgeadmin
    >>> Configuring /etc/hosts on each node
    >>> Configuring NFS...
    >>> Configuring passwordless ssh for root
    >>> Configuring passwordless ssh for user: sgeadmin
    >>> Generating local RSA ssh keys for user: sgeadmin
    >>> Installing Sun Grid Engine...
    >>> Done Configuring Sun Grid Engine
    >>> 
    
    The cluster has been started and configured. 
    
    Login to the master node as root by running: 
    
        $ starcluster sshmaster smallcluster
    
    or manually as sgeadmin:
    
        $ ssh -i /nethome/admin/.starcluster/id_rsa-admin-key sgeadmin@ec2-184-72-82-189.compute-1.amazonaws.com
    
    When you are finished using the cluster, run:
    
        $ starcluster stop smallcluster
    
    to shutdown the cluster and stop paying for service
    
            
    >>> start took 3.626 mins



CONNECT TO MASTER:

starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster

    root@ip-10-124-242-36:~# ls -al /
    total 88
    drwxr-xr-x  22 root root  4096 2011-01-06 04:45 .
    drwxr-xr-x  22 root root  4096 2011-01-06 04:45 ..
    drwxr-xr-x   2 root root  4096 2010-02-18 00:17 bin
    drwxr-xr-x   3 root root  4096 2010-02-18 00:13 boot
    drwxr-xr-x   8 root root  4096 2011-01-05 16:45 data
    drwxr-xr-x  11 root root 12840 2011-01-06 04:45 dev
    drwxr-xr-x 103 root root  4096 2011-01-06 04:46 etc
    drwxr-xr-x   4 root root  4096 2011-01-06 04:45 home
    lrwxrwxrwx   1 root root    30 2010-01-21 04:09 initrd.img -> boot/initrd.img-2.6.31-302-ec2
    lrwxrwxrwx   1 root root    32 2010-01-21 04:08 initrd.img.old -> boot/initrd.img-2.6.31-17-server
    drwxr-xr-x  12 root root  4096 2010-02-18 00:15 lib
    lrwxrwxrwx   1 root root     4 2010-01-21 04:00 lib64 -> /lib
    drwx------   2 root root 16384 2010-01-21 04:00 lost+found
    drwxr-xr-x   4 root root  4096 2011-01-06 04:45 mnt
    drwxr-xr-x   5 root root  4096 2011-01-06 04:45 opt
    dr-xr-xr-x 106 root root     0 2011-01-06 04:44 proc
    drwx------   7 root root  4096 2011-01-06 04:44 root
    drwxr-xr-x   2 root root  4096 2010-02-18 00:15 sbin
    drwxr-xr-x   2 root root  4096 2011-01-06 04:45 scratch
    drwxr-xr-x   2 root root  4096 2009-10-20 00:48 selinux
    drwxr-xr-x   3 root root  4096 2010-02-18 00:16 srv
    drwxr-xr-x  13 root root     0 2011-01-06 04:44 sys
    drwxrwxrwt   4 root root  4096 2011-01-06 04:46 tmp
    drwxr-xr-x  11 root root  4096 2010-02-18 00:15 usr
    drwxr-xr-x  16 root root  4096 2010-02-18 00:15 var
    lrwxrwxrwx   1 root root    27 2010-01-21 04:09 vmlinuz -> boot/vmlinuz-2.6.31-302-ec2
    lrwxrwxrwx   1 root root    29 2010-01-21 04:08 vmlinuz.old -> boot/vmlinuz-2.6.31-17-server
    root@ip-10-124-242-36:~# cd /data
    root@ip-10-124-242-36:/data# ll
    ll: command not found
    root@ip-10-124-242-36:/data# ls -al
    total 44
    drwxr-xr-x  8 root root  4096 2011-01-05 16:45 .
    drwxr-xr-x 22 root root  4096 2011-01-06 04:45 ..
    drwxr-xr-x  3 root root  4096 2010-10-11 03:49 agua
    drwxr-xr-x 53 root root  4096 2010-10-14 07:48 apps
    drwxr-xr-x  3 root root  4096 2010-10-11 05:50 base
    drwx------  2 root root 16384 2010-10-11 03:43 lost+found
    drwxr-xr-x  5 root root  4096 2010-10-11 05:07 mysql
    drwxr-xr-x  2 root root  4096 2011-01-05 16:47 starcluster
    root@ip-10-124-242-36:/data# qsub
    ^Z^CUnable to read script file because of error: no input read from stdin
    root@ip-10-124-242-36:/data# qstat
    root@ip-10-124-242-36:/data# df -a
    Filesystem           1K-blocks      Used Available Use% Mounted on
    /dev/sda1             10321208   4062188   5734732  42% /
    proc                         0         0         0   -  /proc
    none                         0         0         0   -  /sys
    none                         0         0         0   -  /sys/fs/fuse/connections
    none                         0         0         0   -  /sys/kernel/debug
    none                         0         0         0   -  /sys/kernel/security
    udev                   3941388        88   3941300   1% /dev
    none                         0         0         0   -  /dev/pts
    none                   3941388         0   3941388   0% /dev/shm
    none                   3941388        84   3941304   1% /var/run
    none                   3941388         0   3941388   0% /var/lock
    none                   3941388         0   3941388   0% /lib/init/rw
    /dev/sdb             433455904    203016 411234584   1% /mnt
    nfsd                         0         0         0   -  /proc/fs/nfsd
    /dev/sdj1             41279568  20449200  18733484  53% /data
    sunrpc                       0         0         0   -  /var/lib/nfs/rpc_pipefs


SHOW CLUSTER NODES:

starcluster -c /nethome/admin/.starcluster/config listclusters     
    
    -----------------------------------------------
    smallcluster (security group: @sc-smallcluster)
    -----------------------------------------------
    Launch time: 2011-01-06T04:42:43.000Z
    Zone: us-east-1a
    Keypair: id_rsa-admin-key
    EBS volumes:
        vol-fc5af194 on master:/dev/sdj (status: attached)
    Cluster nodes:
         master running i-2fc83843 ec2-184-72-82-189.compute-1.amazonaws.com 
        node001 running i-29c83845 ec2-75-101-251-57.compute-1.amazonaws.com 


CONNECT TO NODE 1:

starcluster -c /nethome/admin/.starcluster/config sshnode -u sgeadmin smallcluster node001



sfdisk
------

THIS COMMAND CREATES AN ext2 PARTITION USING UP ALL OF THE VOLUME:

echo ",,L" | sfdisk /dev/sdj


man sfdisk

    ...
    INPUT FORMAT

       sfdisk reads lines of the form

<!--
              <start> <size> <id> <bootable> <c,h,s> <c,h,s>

-->
       where each line fills one partition descriptor.

       Fields are separated by whitespace, or comma or semicolon possibly  followed  by  whites-
       pace;  initial and trailing whitespace is ignored.  Numbers can be octal, decimal or hex-
       adecimal, decimal is default.  When a field is absent or empty, a default value is  used.

       The  < c,h,s>  parts  can  (and  probably  should)  be omitted - sfdisk computes them from
       < start> and < size> and the disk geometry as given by the kernel or  specified  using  the
       -H, -S, -C flags.

       Bootable  is  specified as [*|-], with as default not-bootable.  (The value of this field
       is irrelevant for Linux - when Linux runs it has been booted already - but might  play  a
       role  for  certain boot loaders and for other operating systems.  For example, when there
       are several primary DOS partitions, DOS assigns C: to  the  first  among  these  that  is
       bootable.)

       Id  is  given in hex, without the 0x prefix, or is [E|S|L|X], where L (LINUX_NATIVE (83))
       is  the  default,  S  is  LINUX_SWAP  (82),  E  is  EXTENDED_PARTITION  (5),  and  X   is
       LINUX_EXTENDED (85).

       The default value of start is the first nonassigned sector/cylinder/...

       The default value of size is as much as possible (until next partition or end-of-disk).

       However,  for  the  four partitions inside an extended partition, the defaults are: Linux
       partition, Extended partition, Empty, Empty.

       But when the -N option (change a single partition only) is given, the  default  for  each
       field is its previous value.

EXAMPLE
       The command
              sfdisk /dev/hdc << EOF
              0,407
              ,407
              ;
              ;
              EOF
       will partition /dev/hdc just as indicated above.

       The command
              sfdisk /dev/hdb << EOF
              ,3,L
              ,60,L
              ,19,S
              ,,E
              ,130,L
              ,130,L
              ,130,L
              ,,L
              EOF
       will  partition /dev/hdb into two Linux partitions of 3 and 60 cylinders, a swap space of
       19 cylinders, and an extended partition covering the rest. Inside the extended  partition
       there  are  four  Linux  logical  partitions, three of 130 cylinders and one covering the
       rest.

       With the -x option, the number of input lines must be a multiple of 4: you have  to  list


</entry>



<entry [Thu Dec 23 12:31:18 EST 2010] DEFAULT CONFIG FILE>



emacs /root/.starcluster/config
[global]
# the default cluster template to use when starting a cluster
DEFAULT_TEMPLATE=smallcluster

[aws info]
# Stuart
AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
AWS_SECRET_ACCESS_KEY=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
AWS_USER_ID=728213020069


[key starcluster-1]
# Section name should match KEYNAME
KEY_LOCATION=/agua/home/admin/.keypairs/id_rsa-starcluster-1
KEYNAME = starcluster-1

#########################
#### Default cluster ####
#########################
[cluster smallcluster]
KEYNAME = starcluster-1

# number of ec2 instances to launch
CLUSTER_SIZE = 2

# create the following user on the cluster
CLUSTER_USER = sgeadmin

# AMI for cluster nodes.
# The base i386 StarCluster AMI is ami-d1c42db8
# The base x86_64 StarCluster AMI is ami-a5c42dcc
NODE_IMAGE_ID = ami-d1c42db8

# instance type for all cluster nodes 
# (options: m1.large, c1.xlarge, m1.small, c1.medium, m1.xlarge, m2.4xlarge, m2.2xlarge)
NODE_INSTANCE_TYPE = m1.small

# list of volumes to attach to the master node and nfs share to worker nodes (OPTIONAL)
# (see "Configuring EBS Volumes" below for an example of defining volume sections)
VOLUMES = agua, data, nethome

# list of plugins to load after StarCluster's default setup routines (OPTIONAL)
# (see "Configuring StarCluster Plugins" below for an example of defining a plugin section)
#PLUGINS = myplugin, myplugin2

# availability zone to launch the cluster in (OPTIONAL)
# (automatically determined based on volumes (if any) or 
# selected by Amazon if not specified)
AVAILABILITY_ZONE = us-east-1a



#########################
## Additional Clusters ##
#########################

# Supply all configuration options, OR use EXTENDS=<cluster_name> 

[cluster mediumcluster]
EXTENDS=smallcluster
CLUSTER_SIZE=8

[cluster largecluster]
EXTENDS=mediumcluster
CLUSTER_SIZE=16


#################
## EBS Volumes ##
#################

# NB: The volume name is used in the VOLUMES setting in a cluster template 
# to declare that an EBS volume is to be mounted and nfs shared on the cluster.

[volume agua]
VOLUME_ID = vol-c999999
MOUNT_PATH = /agua

[volume data]
VOLUME_ID = vol-c999999
MOUNT_PATH = /data

[volume nethome]
VOLUME_ID = vol-c999999
MOUNT_PATH = /nethome


#############
## Plugins ##
#############

# Custom python class for extra setup procedures when starting a cluster 
# myplugin module is either in ~/.starcluster/plugins or in PYTHONPATH

# [plugin myplugin]
# SETUP_CLASS = myplugin.SetupClass
# extra settings are passed as arguments to your plugin:
# SOME_PARAM_FOR_MY_PLUGIN = 1
# SOME_OTHER_PARAM = 2




</entry>



<entry [Thu Dec 23 12:30:18 EST 2010] STARCLUSTER SUPPORTS GPU INSTANCES>




[StarCluster] New StarCluster GPU/Cluster Compute AMI Available

Justin Riley jtriley at MIT.EDU 
Mon Dec 20 21:08:12 EST 2010
Previous message: [StarCluster] SGE clarification and 2 questions
Next message: [StarCluster] ERROR - Invalid	AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY combination
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
Hi All,

My apologies for the delay on this. Below is a (public) release 
candidate for the new StarCluster Cluster Compute/GPU instance type:

ami-12b6477b

This AMI contains the following GPU software in addition to the usual 
StarCluster stack:

* NVIDIA Driver 260.19.21
* NVIDIA Cuda Toolkit 3.2 (cublas, cufft, curand)
* PyCuda and PyOpenCL (recent git checkouts)
* MAGMA 1.0-rc2

This AMI is currently not compatible with StarCluster 0.91.2, however, 
the instances are a bit pricey ($2.10/hr for GPU) so if you just want to 
play around with the new GPU instances you're probably better off 
launching a single instance from the AWS management console. If anyone 
needs a GPU cluster the latest github code does work with this new AMI 
and instance type (both cg1.4xlarge and cc1.4xlarge) if you're 
interested in testing.

A few notes:

1. CUDA is installed in /usr/local/cuda
2. MAGMA library is installed in /usr/local/magma
3. Custom python2.6 installation in /usr/lib64/python2.6/site-packages
4. NumPy/SciPy/PyCuda/OpenCL/etc are installed in the custom python2.6 
installation
5. All software sources used are in /usr/local/src (look here for 
PyCuda/PyOpenCL/MAGMA examples, etc)

Let me know if you have issues,




</entry>



<entry [Thu Dec 23 12:30:18 EST 2010] JOINED STARCLUSTER MAILING LIST>




USER stuartpyoung@hotmail.com
PASS *o*



VIEW ALL MONTHS
http://mailman.mit.edu/pipermail/starcluster/

VIEW THREADS FOR DECEMBER
http://mailman.mit.edu/pipermail/starcluster/2010-December/thread.html

CHANGE USER OPTIONS:
http://mailman.mit.edu/mailman/options/starcluster/stuartpyoung@gmail.com



</entry>



<entry [Thurs Dec 23 11:41:12 EST 2010] STARCLUSTER CONFIG ON AQUARIUS-6>




1. CREATE KEYPAIR FILE
----------------------

(COPIED FROM LINODE)

ON LINODE:

/root/base/apps/ec2/keypair
[root@li182-248 keypair]# cat id_rsa-starcluster-1 
KEYPAIR starcluster-1   12:a9:09:e0:08:4a:a5:bf:fc:45:68:bf:0e:5e:19:b6:d8:0b:dc:28
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAkWvDJrk5HkS0Tswd/I58Ias89z4qrNbTD2UtU4cyMPoUojEqy15Le4iC5aoe
Ynr0+IieTFnT9xpvpmrVk3GXbT2tJDyjgP3qJYqS/3yM2JMjM6JvZk9q+H6pU/q8fNCdKcmDJ6To
b0PLPh72zkSVSi4g3RljIvLTQS1IT1fQU2Dnv3CAkqCjzgNDxmI2o+Zv8Y2iTYjzK2fMIZBc+Dg7
DlR9+Ot6hSvmS5IzoLW36f3Wi4nUcP46Q2k+rjg6hWb/FK4KsZWvm79i0WjhLgMkkBhKBje1sO5m
3jHNpQZqeMymS9pV9F9vQdk0pWHhaAS4LiFh2k495LMTSwfAfm5IWQIDAQABAoIBAEvhVDpfihtu
NDutrLP9UW5sIOrOSIxZqFYvMECWmi0OQTgEudTWhkKWj97xLtuqVytcdmVWthEJfVr0Ai/mpOI+
vZrb/WEwnT4rmdqwjfnwhPzLdJ+JL0MtLIQCoNnsLSYB3WsRVKvCT0pB8/zbsp67hTB5r84rsOog
i8vDAZSPgVugRPCTgM8aVAnI4twpI/a5H1JyqawthC8VY8FjsdJ6g2mZEa8b8/r9MZdkDXlJcfJd
+9/fd1cotwo0T9YwjV2qtgZ1HLVZjGsj70nZ6r/IMEaVUkEYFInnR7JdAjGaHJqc3NJhvDx4LcmL
pN8Nze2u2R9N6/Q3oDyRZpTfCcUCgYEAz2Gzem51cWw56YYxnlqdZqV+N9vSibfxVbej+6Ueb2zd
Vh26Z1miL7P4U/30TPNld3MRsuUPOKVK1PyZS6VTfMMd7AkpWWRm/2Twuviwkmn4oiJ3scAvSJI3
DuJT10BNGjbRa9P2YWjylcrJB3BT7yBPOne4aZUM9z96u/W/f98CgYEAs4NnRlH63x4kRPeTachc
W1pCtbRcYF8k7APRJ5gNIKIk6EyG1TMG1Y4MLlbuoIQNTTZ9IUF3q3idA+Y4+v+5aRL06BVb5W2Y
OyTHyFHs1rF93f4xmiyxNkg84Tqahpg8IFwzeha4IcfzCbYuiBhTGvCqGuHcz1ygFHPshBYiXscC
gYAXOe4MDEsDBQgHa4wrHCL82BQm1WvjGMLiwsqO6JNcD2lKt9GkuZk8ln99iLfP1oLKugyFaLon
sfuLly7kFgQfuQqk4PHMnT4b5IZBqpC8FTpPjmSxd8DT8+xOsnKJbR41jWYvGXJCvqpMtIWHW8FK
yueUuMvip1roZies3X0xKQKBgQCN3Ict1DVsQzaoZfpR+2u5KbBURg9GfYoBFdcg8hFVu61tAqT/
MQ7yjwnjSQHVSeX1Id1q/YCjunJjFXnsKVENz1RJYC+6NIy8GInlLZD77VIpr+rlCvKUkivCVfyt
5vqFHDf2AKRM1eWjxBwrowVx4cSb7+f+2xUKdL3xeEh7GwKBgQDAM1aw+ZqXzlTBIMGISkGDN36b
xgXA0kzF3MXT9z0Kp25hOsWlakz+T9azU/6ufvedwi5zTblfnbCBQ/Jd4+KVo06a0spGwVBbSfB0
Sj8pl2bLczSvD2GC6/BJR5M7vNBvKNFchT7HVJMBBfLomfKRAhZ+dtVxrxaaEzMIdcFC/A==
-----END RSA PRIVATE KEY-----



ON AQUARIUS-6:


emacs /agua/home/admin/.keypairs/id_rsa-starcluster-1
KEYPAIR starcluster-1   12:a9:09:e0:08:4a:a5:bf:fc:45:68:bf:0e:5e:19:b6:d8:0b:dc:28
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAkWvDJrk5HkS0Tswd/I58Ias89z4qrNbTD2UtU4cyMPoUojEqy15Le4iC5aoe
Ynr0+IieTFnT9xpvpmrVk3GXbT2tJDyjgP3qJYqS/3yM2JMjM6JvZk9q+H6pU/q8fNCdKcmDJ6To
b0PLPh72zkSVSi4g3RljIvLTQS1IT1fQU2Dnv3CAkqCjzgNDxmI2o+Zv8Y2iTYjzK2fMIZBc+Dg7
DlR9+Ot6hSvmS5IzoLW36f3Wi4nUcP46Q2k+rjg6hWb/FK4KsZWvm79i0WjhLgMkkBhKBje1sO5m
3jHNpQZqeMymS9pV9F9vQdk0pWHhaAS4LiFh2k495LMTSwfAfm5IWQIDAQABAoIBAEvhVDpfihtu
NDutrLP9UW5sIOrOSIxZqFYvMECWmi0OQTgEudTWhkKWj97xLtuqVytcdmVWthEJfVr0Ai/mpOI+
vZrb/WEwnT4rmdqwjfnwhPzLdJ+JL0MtLIQCoNnsLSYB3WsRVKvCT0pB8/zbsp67hTB5r84rsOog
i8vDAZSPgVugRPCTgM8aVAnI4twpI/a5H1JyqawthC8VY8FjsdJ6g2mZEa8b8/r9MZdkDXlJcfJd
+9/fd1cotwo0T9YwjV2qtgZ1HLVZjGsj70nZ6r/IMEaVUkEYFInnR7JdAjGaHJqc3NJhvDx4LcmL
pN8Nze2u2R9N6/Q3oDyRZpTfCcUCgYEAz2Gzem51cWw56YYxnlqdZqV+N9vSibfxVbej+6Ueb2zd
Vh26Z1miL7P4U/30TPNld3MRsuUPOKVK1PyZS6VTfMMd7AkpWWRm/2Twuviwkmn4oiJ3scAvSJI3
DuJT10BNGjbRa9P2YWjylcrJB3BT7yBPOne4aZUM9z96u/W/f98CgYEAs4NnRlH63x4kRPeTachc
W1pCtbRcYF8k7APRJ5gNIKIk6EyG1TMG1Y4MLlbuoIQNTTZ9IUF3q3idA+Y4+v+5aRL06BVb5W2Y
OyTHyFHs1rF93f4xmiyxNkg84Tqahpg8IFwzeha4IcfzCbYuiBhTGvCqGuHcz1ygFHPshBYiXscC
gYAXOe4MDEsDBQgHa4wrHCL82BQm1WvjGMLiwsqO6JNcD2lKt9GkuZk8ln99iLfP1oLKugyFaLon
sfuLly7kFgQfuQqk4PHMnT4b5IZBqpC8FTpPjmSxd8DT8+xOsnKJbR41jWYvGXJCvqpMtIWHW8FK
yueUuMvip1roZies3X0xKQKBgQCN3Ict1DVsQzaoZfpR+2u5KbBURg9GfYoBFdcg8hFVu61tAqT/
MQ7yjwnjSQHVSeX1Id1q/YCjunJjFXnsKVENz1RJYC+6NIy8GInlLZD77VIpr+rlCvKUkivCVfyt
5vqFHDf2AKRM1eWjxBwrowVx4cSb7+f+2xUKdL3xeEh7GwKBgQDAM1aw+ZqXzlTBIMGISkGDN36b
xgXA0kzF3MXT9z0Kp25hOsWlakz+T9azU/6ufvedwi5zTblfnbCBQ/Jd4+KVo06a0spGwVBbSfB0
Sj8pl2bLczSvD2GC6/BJR5M7vNBvKNFchT7HVJMBBfLomfKRAhZ+dtVxrxaaEzMIdcFC/A==
-----END RSA PRIVATE KEY-----

chmod 600 /agua/home/admin/.keypairs/id_rsa-starcluster-1





2. EDIT CONFIG FILE
-------------------


rm -fr /root/.starcluster/config
emacs /root/.starcluster/config
####################################
## StarCluster Configuration File ##
####################################

[global]
# configure the default cluster template to use when starting a cluster
# defaults to 'smallcluster' defined below. this template should be usable
# out-of-the-box provided you've configured your keypair correctly
DEFAULT_TEMPLATE=smallcluster
# enable experimental features for this release
ENABLE_EXPERIMENTAL=False

[aws info]
# This is the AWS credentials section.
# These settings apply to all clusters
# replace these with your AWS keys


# STUART (NEW ACCESS KEYS)
#AWS_USER_ID=728213020069
#AWS_ACCESS_KEY_ID=AKIAIKZHIY7T75JIF34A
#AWS_SECRET_ACCESS_KEY=TGItbOygM1uKJkDchv9z02CdoiOi5TE97hvS7Ssw


# Stuart
AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
AWS_SECRET_ACCESS_KEY=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
AWS_USER_ID=728213020069


# johhny
#AWS_ACCESS_KEY_ID = AKIAJWZIAB2ZZB7FHJIQ
#AWS_SECRET_ACCESS_KEY = 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
#AWS_USER_ID= 558277860346




# karen
AWS_ACCESS_KEY_ID = AKIAIKR6ZDBQA3RFJRUQ
AWS_SECRET_ACCESS_KEY = VqV/AWAgcZilaRUyn9M7KUgNLArrJjC9sO3pbrzX
AWS_USER_ID=684733399587


# Sections starting with "key" define your keypairs
# (see the EC2 getting started guide tutorial on using ec2-add-keypair to learn
# how to create new keypairs)
# Section name should match your key name e.g.:
[key gsg-keypair]
KEY_LOCATION=/agua/home/admin/.keypairs/id_rsa-starcluster-1

KEYNAME = starcluster-1

# You can of course have multiple keypair sections
# [key my-other-gsg-keypair]
# KEY_LOCATION=/home/myuser/.ssh/id_rsa-my-other-gsg-keypair

# Sections starting with "cluster" define your cluster templates
# Section name is the name you give to your cluster template e.g.:
[cluster smallcluster]
# change this to the name of one of the keypair sections defined above 
KEYNAME = starcluster-1

# number of ec2 instances to launch
CLUSTER_SIZE = 2

# create the following user on the cluster
CLUSTER_USER = sgeadmin

# optionally specify shell (defaults to bash)
# (options: tcsh, zsh, csh, bash, ksh)
CLUSTER_SHELL = bash

# AMI for cluster nodes.
# The base i386 StarCluster AMI is ami-d1c42db8
# The base x86_64 StarCluster AMI is ami-a5c42dcc
NODE_IMAGE_ID = ami-d1c42db8
# instance type for all cluster nodes 
# (options: m1.large, c1.xlarge, m1.small, c1.medium, m1.xlarge, m2.4xlarge, m2.2xlarge)
NODE_INSTANCE_TYPE = m1.small

# Uncomment to specify a different instance type for the master node  (OPTIONAL)
# (defaults to NODE_INSTANCE_TYPE if not specified)
#MASTER_INSTANCE_TYPE = m1.small

# Uncomment to specify a separate AMI to use for the master node. (OPTIONAL)
# (defaults to NODE_IMAGE_ID if not specified)
#MASTER_IMAGE_ID = ami-d1c42db8 (OPTIONAL)

# availability zone to launch the cluster in (OPTIONAL)
# (automatically determined based on volumes (if any) or 
# selected by Amazon if not specified)
#AVAILABILITY_ZONE = us-east-1c

# list of volumes to attach to the master node and nfs share to worker nodes (OPTIONAL)
# (see "Configuring EBS Volumes" below for an example of defining volume sections)
#VOLUMES = oceandata, biodata

# list of plugins to load after StarCluster's default setup routines (OPTIONAL)
# (see "Configuring StarCluster Plugins" below for an example of defining a plugin section)
#PLUGINS = myplugin, myplugin2

###########################################
## Defining Additional Cluster Templates ##
###########################################

# You can also define multiple cluster templates.
# You can either supply all configuration options as with smallcluster above, or
# create an EXTENDS=<cluster_name> variable in the new cluster section to use all 
# settings from <cluster_name> as defaults. Below are a couple of example
# cluster templates that use the EXTENDS feature:

# [cluster mediumcluster]
# Declares that this cluster uses smallcluster as defaults
# EXTENDS=smallcluster
# This section is the same as smallcluster except for the following settings:
# KEYNAME=my-other-gsg-keypair
# NODE_INSTANCE_TYPE = c1.xlarge
# CLUSTER_SIZE=8
# VOLUMES = biodata2

# [cluster largecluster]
# Declares that this cluster uses mediumcluster as defaults
# EXTENDS=mediumcluster
# This section is the same as mediumcluster except for the following variables:
# CLUSTER_SIZE=16

#############################
## Configuring EBS Volumes ##
#############################

# Using EBS volumes with StarCluster is relatively straight forward. You create
# a [volume] section that represents an EBS volume. The section name is a tag
# for your volume. This tag is used in the VOLUMES setting in a cluster template 
# to declare that an EBS volume is to be mounted and nfs shared on the cluster.
# (see the commented VOLUMES setting in the 'smallcluster' template above)
# Below are some examples of defining and configuring EBS volumes to be used
# with StarCluster:

# Sections starting with "volume" define your EBS volumes
# Section name tags your volume e.g.:
# [volume biodata]
# (attach 1st partition of volume vol-c9999999 to /home on master node)
# VOLUME_ID = vol-c999999
# MOUNT_PATH = /home

# Same volume as above, but mounts to different location
# [volume biodata2]
# (attach 1st partition of volume vol-c9999999 to /opt/ on master node)
# VOLUME_ID = vol-c999999
# MOUNT_PATH = /opt/

# Another volume example 
# [volume oceandata]
# (attach 1st partition of volume vol-d7777777 to /mydata on master node)
# VOLUME_ID = vol-d7777777
# MOUNT_PATH = /mydata

# Same as oceandata only uses the 2nd partition instead
# [volume oceandata]
# (attach 2nd partition of volume vol-d7777777 to /mydata on master node)
# VOLUME_ID = vol-d7777777
# MOUNT_PATH = /mydata
# PARTITION = 2

#####################################
## Configuring StarCluster Plugins ##
#####################################

# Sections starting with "plugin" define a custom python class
# which can perform additional configurations to StarCluster's default routines. These plugins 
# can be assigned to a cluster template to customize the setup procedure when
# starting a cluster from this template
# (see the commented PLUGINS setting in the 'smallcluster' template above) 
# Below is an example of defining a plugin called 'myplugin':

# [plugin myplugin]
# myplugin module either lives in ~/.starcluster/plugins or is 
# in your PYTHONPATH
# SETUP_CLASS = myplugin.SetupClass
# extra settings are passed as arguments to your plugin:
# SOME_PARAM_FOR_MY_PLUGIN = 1
# SOME_OTHER_PARAM = 2










    
    ####################################
    ## StarCluster Configuration File ##
    ####################################
    
    [global]
    # configure the default cluster template to use when starting a cluster
    # defaults to 'smallcluster' defined below. this template should be usable
    # out-of-the-box provided you've configured your keypair correctly
    DEFAULT_TEMPLATE=smallcluster
    # enable experimental features for this release
    ENABLE_EXPERIMENTAL=False
    
    [aws info]
    # This is the AWS credentials section.
    # These settings apply to all clusters
    # replace these with your AWS keys
    AWS_ACCESS_KEY_ID = #your_aws_access_key_id
    AWS_SECRET_ACCESS_KEY = #your_secret_access_key
    # replace this with your account number
    AWS_USER_ID= #your userid
    
    # Sections starting with "key" define your keypairs
    # (see the EC2 getting started guide tutorial on using ec2-add-keypair to learn
    # how to create new keypairs)
    # Section name should match your key name e.g.:
    [key gsg-keypair]
    KEY_LOCATION=/home/myuser/.ssh/id_rsa-gsg-keypair
    
    # You can of course have multiple keypair sections
    # [key my-other-gsg-keypair]
    # KEY_LOCATION=/home/myuser/.ssh/id_rsa-my-other-gsg-keypair
    
    # Sections starting with "cluster" define your cluster templates
    # Section name is the name you give to your cluster template e.g.:
    [cluster smallcluster]
    # change this to the name of one of the keypair sections defined above 
    KEYNAME = gsg-keypair
    
    # number of ec2 instances to launch
    CLUSTER_SIZE = 2
    
    # create the following user on the cluster
    CLUSTER_USER = sgeadmin
    
    # optionally specify shell (defaults to bash)
    # (options: tcsh, zsh, csh, bash, ksh)
    CLUSTER_SHELL = bash
    
    # AMI for cluster nodes.
    # The base i386 StarCluster AMI is ami-d1c42db8
    # The base x86_64 StarCluster AMI is ami-a5c42dcc
    NODE_IMAGE_ID = ami-d1c42db8
    # instance type for all cluster nodes 
    # (options: m1.large, c1.xlarge, m1.small, c1.medium, m1.xlarge, m2.4xlarge, m2.2xlarge)
    NODE_INSTANCE_TYPE = m1.small
    
    # Uncomment to specify a different instance type for the master node  (OPTIONAL)
    # (defaults to NODE_INSTANCE_TYPE if not specified)
    #MASTER_INSTANCE_TYPE = m1.small
    
    # Uncomment to specify a separate AMI to use for the master node. (OPTIONAL)
    # (defaults to NODE_IMAGE_ID if not specified)
    #MASTER_IMAGE_ID = ami-d1c42db8 (OPTIONAL)
    
    # availability zone to launch the cluster in (OPTIONAL)
    # (automatically determined based on volumes (if any) or 
    # selected by Amazon if not specified)
    #AVAILABILITY_ZONE = us-east-1c
    
    # list of volumes to attach to the master node and nfs share to worker nodes (OPTIONAL)
    # (see "Configuring EBS Volumes" below for an example of defining volume sections)
    #VOLUMES = oceandata, biodata
    
    # list of plugins to load after StarCluster's default setup routines (OPTIONAL)
    # (see "Configuring StarCluster Plugins" below for an example of defining a plugin section)
    #PLUGINS = myplugin, myplugin2
    
    ###########################################
    ## Defining Additional Cluster Templates ##
    ###########################################
    
    # You can also define multiple cluster templates.
    # You can either supply all configuration options as with smallcluster above, or
    # create an EXTENDS=<cluster_name> variable in the new cluster section to use all 
    # settings from <cluster_name> as defaults. Below are a couple of example
    # cluster templates that use the EXTENDS feature:
    
    # [cluster mediumcluster]
    # Declares that this cluster uses smallcluster as defaults
    # EXTENDS=smallcluster
    # This section is the same as smallcluster except for the following settings:
    # KEYNAME=my-other-gsg-keypair
    # NODE_INSTANCE_TYPE = c1.xlarge
    # CLUSTER_SIZE=8
    # VOLUMES = biodata2
    
    # [cluster largecluster]
    # Declares that this cluster uses mediumcluster as defaults
    # EXTENDS=mediumcluster
    # This section is the same as mediumcluster except for the following variables:
    # CLUSTER_SIZE=16
    
    #############################
    ## Configuring EBS Volumes ##
    #############################
    
    # Using EBS volumes with StarCluster is relatively straight forward. You create
    # a [volume] section that represents an EBS volume. The section name is a tag
    # for your volume. This tag is used in the VOLUMES setting in a cluster template 
    # to declare that an EBS volume is to be mounted and nfs shared on the cluster.
    # (see the commented VOLUMES setting in the 'smallcluster' template above)
    # Below are some examples of defining and configuring EBS volumes to be used
    # with StarCluster:
    
    # Sections starting with "volume" define your EBS volumes
    # Section name tags your volume e.g.:
    # [volume biodata]
    # (attach 1st partition of volume vol-c9999999 to /home on master node)
    # VOLUME_ID = vol-c999999
    # MOUNT_PATH = /home
    
    # Same volume as above, but mounts to different location
    # [volume biodata2]
    # (attach 1st partition of volume vol-c9999999 to /opt/ on master node)
    # VOLUME_ID = vol-c999999
    # MOUNT_PATH = /opt/
    
    # Another volume example 
    # [volume oceandata]
    # (attach 1st partition of volume vol-d7777777 to /mydata on master node)
    # VOLUME_ID = vol-d7777777
    # MOUNT_PATH = /mydata
    
    # Same as oceandata only uses the 2nd partition instead
    # [volume oceandata]
    # (attach 2nd partition of volume vol-d7777777 to /mydata on master node)
    # VOLUME_ID = vol-d7777777
    # MOUNT_PATH = /mydata
    # PARTITION = 2
    
    #####################################
    ## Configuring StarCluster Plugins ##
    #####################################
    
    # Sections starting with "plugin" define a custom python class
    # which can perform additional configurations to StarCluster's default routines. These plugins 
    # can be assigned to a cluster template to customize the setup procedure when
    # starting a cluster from this template
    # (see the commented PLUGINS setting in the 'smallcluster' template above) 
    # Below is an example of defining a plugin called 'myplugin':
    
    # [plugin myplugin]
    # myplugin module either lives in ~/.starcluster/plugins or is 
    # in your PYTHONPATH
    # SETUP_CLASS = myplugin.SetupClass
    # extra settings are passed as arguments to your plugin:
    # SOME_PARAM_FOR_MY_PLUGIN = 1
    # SOME_OTHER_PARAM = 2



3. START STARCLUSTER

cd /root/base/apps/starcluster/0.91.2
starcluster start physicscluster

    OK





</entry>



<entry [Wed Dec 22 16:41:12 EST 2010] SOLVED 'SignatureDoesNotMatch' ERROR>



PROBLEM:

starcluster start physicscluster

    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    cluster.py:766 - ERROR - Invalid AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY combination.
    cli.py:243 - ERROR - settings for cluster template "smallcluster" are not valid

SAME ERROR WITH:

/root/base/apps/starcluster/0.91/bin/starcluster \
-c /root/.starcluster/config \
start physicscluster

ACCESS KEY ID AND SECRET ACCESS KEY ARE FINE (CHECKED IN AWS CONSOLE)

AKIAIZXZ6S7ARZ44TTHQ
4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6



DIAGNOSIS:


https://forums.aws.amazon.com/thread.jspa?messageID=186070&#186070

Got it. I was using Python 2.7, which has some differences with unicode handling. I tried in Python 2.6, and it worked like a charm.



SOLUTION:

DOWNLOAD AND INSTALL PYTHON 2.6



Installing multiple versions OF PYTHON
---------------------------------------

On Unix and Mac systems if you intend to install multiple versions of Python
using the same installation prefix (--prefix argument to the configure
script) you must take care that your primary python executable is not
overwritten by the installation of a different version.  All files and
directories installed using "make altinstall" contain the major and minor
version and can thus live side-by-side.  "make install" also creates
${prefix}/bin/python which refers to ${prefix}/bin/pythonX.Y.  If you intend
to install multiple versions using the same prefix you must decide which
version (if any) is your "primary" version.  Install that version using
"make install".  Install all other versions using "make altinstall".

For example, if you want to install Python 2.5, 2.6 and 3.0 with 2.6 being
the primary version, you would execute "make install" in your 2.6 build
directory and "make altinstall" in the others.



NB: RERAN WITH make install TO MAKE python2.6 THE PRIMARY VERSION:

cd /root/base/apps/python/Python-2.6.6
make install

    ...
    running install_scripts
    changing mode of /usr/local/bin/smtpd.py to 755
    changing mode of /usr/local/bin/2to3 to 755
    changing mode of /usr/local/bin/pydoc to 755
    changing mode of /usr/local/bin/idle to 755
    running install_egg_info
    Removing /usr/local/lib/python2.6/lib-dynload/Python-2.6.6-py2.6.egg-info
    Writing /usr/local/lib/python2.6/lib-dynload/Python-2.6.6-py2.6.egg-info
    if test -f /usr/local/bin/python -o -h /usr/local/bin/python; \
            then rm -f /usr/local/bin/python; \
            else true; \
            fi
    (cd /usr/local/bin; ln python2.6 python)
    rm -f /usr/local/bin/python-config
    (cd /usr/local/bin; ln -s python2.6-config python-config)
    /usr/bin/install -c -m 644 ./Misc/python.man \
                    /usr/local/share/man/man1/python.1


CONFIRMED THAT PYTHON 2.6.6 IS THE DEFAULT VERSION:

python -V

    Python 2.6.6


FIRST INSTALLED AS ALTERNATE INSTALLATION WITH make altinstall:

mkdir -p /root/base/apps/python
cd /root/base/apps/python
wget http://www.python.org/ftp/python/2.6.6/Python-2.6.6.tgz
tar xvfz *
cd Py*
./configure
make altinstall
    
    ...
    running install_scripts
    copying build/scripts-2.6/smtpd.py -> /usr/local/bin
    copying build/scripts-2.6/2to3 -> /usr/local/bin
    copying build/scripts-2.6/pydoc -> /usr/local/bin
    copying build/scripts-2.6/idle -> /usr/local/bin
    changing mode of /usr/local/bin/smtpd.py to 755
    changing mode of /usr/local/bin/2to3 to 755
    changing mode of /usr/local/bin/pydoc to 755
    changing mode of /usr/local/bin/idle to 755
    running install_egg_info
    Writing /usr/local/lib/python2.6/lib-dynload/Python-2.6.6-py2.6.egg-info

WHICH CREATED THIS python EXECUTABLE:

/root/base/apps/python/Python-2.6.6/python -V
    
    Python 2.6.6




INSTALL BOTO
cd /root/base/apps/boto/archive/boto-2.0a2
/root/base/apps/python/Python-2.6.6/python setup.py install

    ...
    changing mode of /usr/local/bin/bundle_image to 755
    running install_egg_info
    Writing /usr/local/lib/python2.6/site-packages/boto-2.0a2-py2.6.egg-info


cd /usr/local/lib/python2.6/site-packages/
    
    -rw-r--r--  1 root root  119 Dec 22 05:14 README
    drwxr-xr-x 20 root root 4.0K Dec 22 05:26 boto
    -rw-r--r--  1 root root  500 Dec 22 05:26 boto-2.0a2-py2.6.egg-info


INSTALL SETUPTOOLS FOR PYTHON 2.6


mkdir -p /root/base/apps/python/modules/setuptools
cd /root/base/apps/python/modules/setuptools
wget http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz#md5=7df2a529a074f613b509fb44feefe74e
tar xvfz *
cd setup*
/root/base/apps/python/Python-2.6.6/python setup.py install 

    ...
    Installed /usr/local/lib/python2.6/site-packages/setuptools-0.6c11-py2.6.egg
    Processing dependencies for setuptools==0.6c11
    Finished processing dependencies for setuptools==0.6c11

INSTALL STARCLUSTER

cd /root/base/apps/starcluster/0.91.2
/root/base/apps/python/Python-2.6.6/python setup.py install 

    running install
    running bdist_egg
    running egg_info
    writing requirements to StarCluster.egg-info/requires.txt
    writing StarCluster.egg-info/PKG-INFO
    writing top-level names to StarCluster.egg-info/top_level.txt
    writing dependency_links to StarCluster.egg-info/dependency_links.txt
    reading manifest file 'StarCluster.egg-info/SOURCES.txt'
    reading manifest template 'MANIFEST.in'
    writing manifest file 'StarCluster.egg-info/SOURCES.txt'
    installing library code to build/bdist.linux-x86_64/egg
    running install_lib
    running build_py
    creating build/bdist.linux-x86_64/egg
    creating build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cluster.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/spinner.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/node.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cli.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cluster.py.bkp -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/__init__.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/utils.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/awsutils.py.bkp -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/exception.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/ssh.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/static.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/image.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/exception.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cluster.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cli.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/dumper.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cli.py~ -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/config.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/static.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/hacks.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/spinner.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/config.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/volume.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/optcomplete.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/logger.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/volume.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/node.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/optcomplete.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/hacks.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/ssh.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cluster.py~ -> build/bdist.linux-x86_64/egg/starcluster
    creating build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/test_cluster_validation.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/__init__.pyc -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/mytestplugin.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/test_config.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    creating build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/templates/__init__.pyc -> build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/templates/config.pyc -> build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/templates/config.py -> build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/templates/__init__.py -> build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/__init__.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/logger.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/clustersetup.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/#cluster.py# -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/awsutils.pyc -> build/bdist.linux-x86_64/egg/starcluster
    creating build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sge_pe.pyc -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/__init__.pyc -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sgeinstall.pyc -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sgeprofile.pyc -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sgeprofile.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/config.pyc -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/config.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/experimental.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sgeinstall.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/experimental.pyc -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sge_pe.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/__init__.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/awsutils.py~ -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/utils.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/clustersetup.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/dumper.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/image.pyc -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/__init__.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/awsutils.py -> build/bdist.linux-x86_64/egg/starcluster
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/cli.py to cli.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/test_cluster_validation.py to test_cluster_validation.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/mytestplugin.py to mytestplugin.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/test_config.py to test_config.pyc
    creating build/bdist.linux-x86_64/egg/EGG-INFO
    installing scripts to build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    running install_scripts
    running build_scripts
    creating build/scripts-2.6
    copying and adjusting bin/starcluster -> build/scripts-2.6
    changing mode of build/scripts-2.6/starcluster from 644 to 755
    creating build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    copying build/scripts-2.6/starcluster -> build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    changing mode of build/bdist.linux-x86_64/egg/EGG-INFO/scripts/starcluster to 755
    copying StarCluster.egg-info/PKG-INFO -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/SOURCES.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/dependency_links.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/requires.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/top_level.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/zip-safe -> build/bdist.linux-x86_64/egg/EGG-INFO
    creating 'dist/StarCluster-0.91.2-py2.6.egg' and adding 'build/bdist.linux-x86_64/egg' to it
    removing 'build/bdist.linux-x86_64/egg' (and everything under it)
    Processing StarCluster-0.91.2-py2.6.egg
    Copying StarCluster-0.91.2-py2.6.egg to /usr/local/lib/python2.6/site-packages
    Adding StarCluster 0.91.2 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/site-packages/StarCluster-0.91.2-py2.6.egg
    Processing dependencies for StarCluster==0.91.2
    Searching for boto==1.9b
    Reading http://pypi.python.org/simple/boto/
    Reading http://code.google.com/p/boto/
    Reading http://code.google.com/p/boto
    Best match: boto 1.9b
    Downloading http://boto.googlecode.com/files/boto-1.9b.tar.gz
    Processing boto-1.9b.tar.gz
    Running boto-1.9b/setup.py -q bdist_egg --dist-dir /tmp/easy_install-yNASd9/boto-1.9b/egg-dist-tmp-TYFJFc
    zip_safe flag not set; analyzing archive contents...
    boto.s3.__init__: module references __path__
    boto.sqs.__init__: module references __path__
    Adding boto 1.9b to easy-install.pth file
    Installing launch_instance script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/site-packages/boto-1.9b-py2.6.egg
    Searching for paramiko==1.7.6
    Reading http://pypi.python.org/simple/paramiko/
    Reading http://www.lag.net/~robey/paramiko/
    Reading http://www.lag.net/paramiko/
    Best match: paramiko 1.7.6
    Downloading http://pypi.python.org/packages/source/p/paramiko/paramiko-1.7.6.zip#md5=b1cfe0cd55772115f808a11c1baba8a0
    Processing paramiko-1.7.6.zip
    Running paramiko-1.7.6/setup.py -q bdist_egg --dist-dir /tmp/easy_install-pZimND/paramiko-1.7.6/egg-dist-tmp-FDn8rD
    warning: no files found matching '*' under directory 'docs'
    zip_safe flag not set; analyzing archive contents...
    Adding paramiko 1.7.6 to easy-install.pth file
    
    Installed /usr/local/lib/python2.6/site-packages/paramiko-1.7.6-py2.6.egg
    Searching for pycrypto>=1.9
    Reading http://pypi.python.org/simple/pycrypto/
    Reading http://pycrypto.sourceforge.net
    Reading http://www.pycrypto.org/
    Reading http://www.amk.ca/python/code/crypto
    Best match: pycrypto 2.3
    Downloading http://www.pycrypto.org/files/pycrypto-2.3.tar.gz
    Processing pycrypto-2.3.tar.gz
    Running pycrypto-2.3/setup.py -q bdist_egg --dist-dir /tmp/easy_install-DFhVGE/pycrypto-2.3/egg-dist-tmp-DgyJxK
    warning: GMP library not found; Not building Crypto.PublicKey._fastmath.
    zip_safe flag not set; analyzing archive contents...
    Adding pycrypto 2.3 to easy-install.pth file
    
    Installed /usr/local/lib/python2.6/site-packages/pycrypto-2.3-py2.6-linux-x86_64.egg
    Finished processing dependencies for StarCluster==0.91.2
    


starcluster -c /root/.starcluster/config listpublic

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    awsutils.EasyEC2.__init___    awsutils.EasyEC2.__init___(...)
    
    awsutils.EasyAWS.__init__    awsutils.EasyAWS.__init__(accesskey, secretkey, connection_authenticator, kwards)
    
    awsutils.EasyAWS.__init__    awsutils.EasyAWS.__init__(accesskey, secretkey, connection_authenticator, kwards)
    awsutils.conn   self.conn(self)
    awsutils.conn   self.aws_access_key: **AKIAIZXZ6S7ARZ44TTHQ**
    awsutils.conn   self.aws_secret_access_key: **4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6**
    awsutils.conn    Doing self._conn = self.connection_authenticator()
    awsutils.conn    self.connection_authenticator:  < function connect_ec2 at 0xaba6e0>
    
    awsutils.conn    Returning self._conn... 
    
    send: 'GET /?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeImages&Owner.1=342652561657&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-22T10%3A37%3A47&Version=2009-11-30&Signature=QNUHHD/zIQW1obXc7Xw0d0fGXtKxsFBy4tibGukHhDs%3D HTTP/1.1\r\nHost: ec2.amazonaws.com\r\nAccept-Encoding: identity\r\nDate: Wed, 22 Dec 2010 10:37:47 GMT\r\nContent-Length: 0\r\nAuthorization: AWS AKIAIZXZ6S7ARZ44TTHQ:oUYGI0WOfpfqKW0BdJftvUS50o8=\r\nUser-Agent: Boto/1.9b (linux2)\r\n\r\n'
    reply: 'HTTP/1.1 200 OK\r\n'
    header: Content-Type: text/xml;charset=UTF-8
    header: Transfer-Encoding: chunked
    header: Date: Wed, 22 Dec 2010 10:37:46 GMT
    header: Server: AmazonEC2
    >>> Listing all public StarCluster images...
    
    32bit Images:
    -------------
    [0] ami-8cf913e5 us-east-1 starcluster-base-ubuntu-10.04-x86-rc3
    [1] ami-8f9e71e6 us-east-1 starcluster-base-ubuntu-9.04-x86
    [2] ami-17b15e7e us-east-1 starcluster-base-ubuntu-9.10-x86-rc7
    [3] ami-d1c42db8 us-east-1 starcluster-base-ubuntu-9.10-x86-rc8
    
    64bit Images:
    --------------
    [0] ami-12b6477b us-east-1 starcluster-base-centos-5.4-x86_64-ebs-hvm-gpu-rc2
    [1] ami-0af31963 us-east-1 starcluster-base-ubuntu-10.04-x86_64-rc1
    [2] ami-a19e71c8 us-east-1 starcluster-base-ubuntu-9.04-x86_64
    [3] ami-2941ad40 us-east-1 starcluster-base-ubuntu-9.10-x86_64-rc3
    [4] ami-a5c42dcc us-east-1 starcluster-base-ubuntu-9.10-x86_64-rc4
    
    total images: 9





NOTES
-----


TRIED LARGE STARCLUSTER 
-----------------------
(FROM PUBLIC AMI TO TEST KEYS BUT COULD NOT RUN starcluster)

Latest Stable AMI IDs: ami-d1c42db8 (i386), ami-a19e71c8 (x86_64)

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-50-16-103-19.compute-1.amazonaws.com


starcluster

    < NOT FOUND>





USE python -S TO IGNORE THIS EGG AND THE REST OF THE python2.7 PATH MODULES:

man python

    -S      Disable the import of the module site and the site-dependent
            manipulations of sys.path that it entails.

    -E     Ignore environment variables like PYTHONPATH and PYTHONHOME that modify
           the behavior of the interpreter.



DECOMPOSE starcluster COMMAND:

head starcluster 

    #!/usr/bin/env python
    from starcluster import cli
    
    if __name__ == '__main__':
        try:
            cli.main()
        except KeyboardInterrupt:
            print "Interrupted, exiting."


NB: WANT TO USE THIS VERSION OF cluster.py FOR DEBUGGING:

locate cluster.py

    /root/base/apps/starcluster/0.91/build/lib/starcluster/cluster.py
    /root/base/apps/starcluster/0.91/starcluster/cluster.py


cd /root/base/apps/starcluster/0.91/dist
mv StarCluster-0.91-py2.7.egg StarCluster-0.91-py2.7.egg.bkp





USE PYPY TO INSTALL LATEST VERSION OF STARCLUSTER
-------------------------------------------------

sudo easy_install StarCluster

    Searching for StarCluster
    Best match: StarCluster 0.91
    Processing StarCluster-0.91-py2.7.egg
    StarCluster 0.91 is already the active version in easy-install.pth
    Installing starcluster script to /usr/local/bin
    
    Using /usr/local/lib/python2.7/site-packages/StarCluster-0.91-py2.7.egg
    Processing dependencies for StarCluster
    Finished processing dependencies for StarCluster


2nd INSTALL AFTER INSTALL OF VERSION 0.91-2 FROM DOWNLOADED FILE:
    
sudo easy_install StarCluster

    Searching for StarCluster
    Best match: StarCluster 0.91
    Processing StarCluster-0.91-py2.7.egg
    Adding StarCluster 0.91 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Using /usr/local/lib/python2.7/site-packages/StarCluster-0.91-py2.7.egg
    Processing dependencies for StarCluster
    Finished processing dependencies for StarCluster


THEN RUN EGG WITH easy_install:

cd /usr/local/lib/python2.7/site-packages

easy_install StarCluster-0.91-py2.7.egg
Processing StarCluster-0.91-py2.7.egg
StarCluster 0.91 is already the active version in easy-install.pth
Installing starcluster script to /usr/local/bin

Installed /usr/local/lib/python2.7/site-packages/StarCluster-0.91-py2.7.egg
Processing dependencies for StarCluster==0.91
Finished processing dependencies for StarCluster==0.91
[root@domU-12-31-38-01-85-C9 site-packages]# starcluster
StarCluster - (http://web.mit.edu/starcluster)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

Usage: starcluster [global-opts] action [action-opts] [< action-args> ...]

Available Actions
- start: Start a new cluster
- stop: Shutdown a running cluster
- listclusters: List all active clusters
- sshmaster: SSH to a cluster's master node
- sshnode: SSH to a cluster node
- sshinstance: SSH to an EC2 instance
- listinstances: List all running EC2 instances
- listimages: List all registered EC2 images (AMIs)
- listpublic: List all public StarCluster images on EC2
- createimage: Create a new image (AMI) from a currently running EC2 instance
- removeimage: Deregister an EC2 image (AMI) and remove it from S3
- listvolumes: List all EBS volumes
- createvolume: Create a new EBS volume for use with StarCluster
- removevolume: Delete one or more EBS volumes
- listspots: List all EC2 spot instance requests
- spothistory: Show spot instance pricing history stats (last 30 days by default)
- showconsole: Show console output for an EC2 instance
- listzones: List all EC2 availability zones
- listbuckets: List all S3 buckets
- showbucket: Show all files in an S3 bucket
- showimage: Show all AMI parts and manifest files on S3 for an EC2 image (AMI)
- shell: Load interactive IPython shell for starcluster development
- help: Show StarCluster usage


Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  -d, --debug           print debug messages (useful for diagnosing problems)
  -c FILE, --config=FILE
                        use alternate config file (default:
                        /root/.starcluster/config)


TEST:

starcluster \
-c /root/.starcluster/config \
start physicscluster




INSTALLED STARCLUSTER VERSION 0.91.2
------------------------------------


mkdir -p /root/base/apps/starcluster/0.91.2
mkdir -p /root/base/apps/starcluster/archive
cd /root/base/apps/starcluster/archive
wget http://pypi.python.org/packages/source/S/StarCluster/StarCluster-0.91.2.tar.gz#md5=2480d13d9a6d133e26d5d07641aab2db
tar xvfz *
cd StarCluster-0.91.2
sudo python setup.py install

    running install
    running bdist_egg
    running egg_info
    writing requirements to StarCluster.egg-info/requires.txt
    writing StarCluster.egg-info/PKG-INFO
    writing top-level names to StarCluster.egg-info/top_level.txt
    writing dependency_links to StarCluster.egg-info/dependency_links.txt
    reading manifest file 'StarCluster.egg-info/SOURCES.txt'
    reading manifest template 'MANIFEST.in'
    writing manifest file 'StarCluster.egg-info/SOURCES.txt'
    installing library code to build/bdist.linux-x86_64/egg
    running install_lib
    running build_py
    creating build
    creating build/lib
    creating build/lib/starcluster
    copying starcluster/cluster.py -> build/lib/starcluster
    copying starcluster/node.py -> build/lib/starcluster
    copying starcluster/cli.py -> build/lib/starcluster
    copying starcluster/exception.py -> build/lib/starcluster
    copying starcluster/ssh.py -> build/lib/starcluster
    copying starcluster/image.py -> build/lib/starcluster
    copying starcluster/static.py -> build/lib/starcluster
    copying starcluster/hacks.py -> build/lib/starcluster
    copying starcluster/spinner.py -> build/lib/starcluster
    copying starcluster/config.py -> build/lib/starcluster
    copying starcluster/volume.py -> build/lib/starcluster
    copying starcluster/optcomplete.py -> build/lib/starcluster
    copying starcluster/logger.py -> build/lib/starcluster
    copying starcluster/utils.py -> build/lib/starcluster
    copying starcluster/clustersetup.py -> build/lib/starcluster
    copying starcluster/__init__.py -> build/lib/starcluster
    copying starcluster/awsutils.py -> build/lib/starcluster
    creating build/lib/starcluster/templates
    copying starcluster/templates/sgeprofile.py -> build/lib/starcluster/templates
    copying starcluster/templates/config.py -> build/lib/starcluster/templates
    copying starcluster/templates/experimental.py -> build/lib/starcluster/templates
    copying starcluster/templates/sgeinstall.py -> build/lib/starcluster/templates
    copying starcluster/templates/sge_pe.py -> build/lib/starcluster/templates
    copying starcluster/templates/__init__.py -> build/lib/starcluster/templates
    creating build/lib/starcluster/tests
    copying starcluster/tests/test_cluster_validation.py -> build/lib/starcluster/tests
    copying starcluster/tests/mytestplugin.py -> build/lib/starcluster/tests
    copying starcluster/tests/test_config.py -> build/lib/starcluster/tests
    copying starcluster/tests/__init__.py -> build/lib/starcluster/tests
    creating build/lib/starcluster/tests/templates
    copying starcluster/tests/templates/config.py -> build/lib/starcluster/tests/templates
    copying starcluster/tests/templates/__init__.py -> build/lib/starcluster/tests/templates
    creating build/bdist.linux-x86_64
    creating build/bdist.linux-x86_64/egg
    creating build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cluster.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/node.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cli.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/exception.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/ssh.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/image.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/static.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/hacks.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/spinner.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/config.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/volume.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/optcomplete.py -> build/bdist.linux-x86_64/egg/starcluster
    creating build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/test_cluster_validation.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/mytestplugin.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/test_config.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    creating build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/templates/config.py -> build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/templates/__init__.py -> build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/__init__.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/logger.py -> build/bdist.linux-x86_64/egg/starcluster
    creating build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sgeprofile.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/config.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/experimental.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sgeinstall.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sge_pe.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/__init__.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/utils.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/clustersetup.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/__init__.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/awsutils.py -> build/bdist.linux-x86_64/egg/starcluster
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/cluster.py to cluster.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/node.py to node.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/cli.py to cli.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/exception.py to exception.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/ssh.py to ssh.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/image.py to image.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/static.py to static.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/hacks.py to hacks.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/spinner.py to spinner.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/config.py to config.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/volume.py to volume.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/optcomplete.py to optcomplete.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/test_cluster_validation.py to test_cluster_validation.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/mytestplugin.py to mytestplugin.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/test_config.py to test_config.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/templates/config.py to config.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/templates/__init__.py to __init__.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/__init__.py to __init__.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/logger.py to logger.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/sgeprofile.py to sgeprofile.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/config.py to config.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/experimental.py to experimental.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/sgeinstall.py to sgeinstall.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/sge_pe.py to sge_pe.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/__init__.py to __init__.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/utils.py to utils.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/clustersetup.py to clustersetup.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/__init__.py to __init__.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/awsutils.py to awsutils.pyc
    creating build/bdist.linux-x86_64/egg/EGG-INFO
    installing scripts to build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    running install_scripts
    running build_scripts
    creating build/scripts-2.7
    copying and adjusting bin/starcluster -> build/scripts-2.7
    changing mode of build/scripts-2.7/starcluster from 644 to 755
    creating build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    copying build/scripts-2.7/starcluster -> build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    changing mode of build/bdist.linux-x86_64/egg/EGG-INFO/scripts/starcluster to 755
    copying StarCluster.egg-info/PKG-INFO -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/SOURCES.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/dependency_links.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/requires.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/top_level.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/zip-safe -> build/bdist.linux-x86_64/egg/EGG-INFO
    creating dist
    creating 'dist/StarCluster-0.91.2-py2.7.egg' and adding 'build/bdist.linux-x86_64/egg' to it
    removing 'build/bdist.linux-x86_64/egg' (and everything under it)
    Processing StarCluster-0.91.2-py2.7.egg
    Copying StarCluster-0.91.2-py2.7.egg to /usr/local/lib/python2.7/site-packages
    Adding StarCluster 0.91.2 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/StarCluster-0.91.2-py2.7.egg
    Processing dependencies for StarCluster==0.91.2
    Searching for boto==1.9b
    Best match: boto 1.9b
    Processing boto-1.9b-py2.7.egg
    boto 1.9b is already the active version in easy-install.pth
    Installing launch_instance script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    
    Using /usr/local/lib/python2.7/site-packages/boto-1.9b-py2.7.egg
    Searching for paramiko==1.7.6
    Best match: paramiko 1.7.6
    Processing paramiko-1.7.6-py2.7.egg
    paramiko 1.7.6 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.7/site-packages/paramiko-1.7.6-py2.7.egg
    Searching for pycrypto==2.3
    Best match: pycrypto 2.3
    Processing pycrypto-2.3-py2.7-linux-x86_64.egg
    pycrypto 2.3 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.7/site-packages/pycrypto-2.3-py2.7-linux-x86_64.egg
    Finished processing dependencies for StarCluster==0.91.2






NEW EGG INSTALLED IN PYTHON'S site-packages DIRECTORY:

cd /usr/local/lib/python2.7/site-packages

    -rw-r--r--  1 root root  119 Dec 18 00:24 README
    -rw-r--r--  1 root root 160K Oct 25 01:38 StarCluster-0.91-py2.7.egg.bkp
    -rw-r--r--  1 root root 160K Oct 25 02:01 StarCluster-0.91-py2.7.egg.bkp2
    -rw-r--r--  1 root root 160K Dec 19 22:08 StarCluster-0.91.2-py2.7.egg
    -rwxr-xr-x  1 root root  36K Oct 25 01:25 _md5.so
    -rwxr-xr-x  1 root root  35K Oct 25 01:25 _sha.so
    -rwxr-xr-x  1 root root  43K Oct 25 01:25 _sha256.so
    -rwxr-xr-x  1 root root  48K Oct 25 01:25 _sha512.so
    drwxr-xr-x  4 root root 4.0K Oct 25 02:16 boto-1.9b-py2.7.egg
    -rw-r--r--  1 root root 825K Oct 25 02:14 boto-2.0b3-py2.7.egg
    -rw-r--r--  1 root root 825K Oct 25 01:27 boto-2.0b3-py2.7.egg.bkp
    -rw-r--r--  1 root root  333 Dec 19 21:57 easy-install.pth
    -rw-r--r--  1 root root  424 Oct 25 01:25 hashlib-20081119-py2.7.egg-info
    -rw-r--r--  1 root root 4.9K Nov 19  2008 hashlib.py
    -rw-r--r--  1 root root 4.3K Dec 18 00:26 hashlib.pyc
    -rw-r--r--  1 root root 4.3K Dec 18 00:26 hashlib.pyo
    -rw-r--r--  1 root root 293K Oct 25 01:51 paramiko-1.7.6-py2.7.egg
    -rw-r--r--  1 root root 547K Oct 25 01:51 pycrypto-2.3-py2.7-linux-x86_64.egg
    -rwxr-xr-x  1 root root 325K Jul  7 20:26 setuptools-0.6c11-py2.7.egg
    -rw-r--r--  1 root root   30 Oct 25 01:03 setuptools.pth



NOTE THE NEW easy-install.pth FILE THE DIRECTORY:

cat easy-install.pth 
    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./boto-1.9b-py2.7.egg
    ./StarCluster-0.91.2-py2.7.egg
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); sys.path[p:p]=new; sys.__egginsert = p+len(new)



DECOMPOSE starcluster COMMAND:

cat /usr/local/bin/starcluster
    #!/usr/bin/python
    # EASY-INSTALL-SCRIPT: 'StarCluster==0.91.2','starcluster'
    __requires__ = 'StarCluster==0.91.2'
    import pkg_resources
    pkg_resources.run_script('StarCluster==0.91.2', 'starcluster')



GET THIS ERROR WHEN RUN starcluster:

starcluster

    Traceback (most recent call last):
      File "/usr/local/bin/starcluster", line 4, in ?
        import pkg_resources
    ImportError: No module named pkg_resources





NOW INSTALL THE EGG WITH easy_install:


cd /usr/local/lib/python2.7/site-packages

easy_install StarCluster-0.91.2-py2.7.egg

    Processing StarCluster-0.91.2-py2.7.egg
    Adding StarCluster 0.91.2 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/StarCluster-0.91.2-py2.7.egg
    Processing dependencies for StarCluster==0.91.2
    Finished processing dependencies for StarCluster==0.91.243


WHICH INSTALLED A NEW starcluster EXECUTABLE TO /usr/local/bin:

cat /usr/local/bin/starcluster

    #!/usr/local/bin/python2.7
    # EASY-INSTALL-SCRIPT: 'StarCluster==0.91.2','starcluster'
    __requires__ = 'StarCluster==0.91.2'
    import pkg_resources
    pkg_resources.run_script('StarCluster==0.91.2', 'starcluster')




TEST:

starcluster

    OK

    
BUT GET SAME ERROR WHEN RUN THIS:

starcluster \
-c /root/.starcluster/config \
start physicscluster

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    cluster.py:766 - ERROR - Invalid AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY combination.
    cli.py:243 - ERROR - settings for cluster template "smallcluster" are not valid





RAN starcluster LOCALLY FROM UNZIPPED EGG
-----------------------------------------

1. MOVE STARCLUSTER EGG SO IT'S NOT CALLED:
cd /usr/local/lib/python2.7/site-packages
mv StarCluster-0.91.2-py2.7.egg StarCluster-0.91.2-py2.7.egg-GOOD


2. SET ENVIRONMENT VARIABLES

export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib/:/usr/local/lib/python2.7/:/usr/local/lib/python2.7/site-packages
export PYTHONHOME=/usr/local


3. RUN starcluster LOCALLY

cd /root/base/apps/starcluster/0.91.2/build/lib/starcluster
python cli.py -d -c /root/.starcluster/config start physicscluster


ALL COMMANDS TOGETHER:

export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib/:/usr/local/lib/python2.7/:/usr/local/lib/python2.7/site-packages
export PYTHONHOME=/usr/local
cd /root/base/apps/starcluster/0.91.2/build/lib/starcluster
python cli.py -d -c /root/.starcluster/config start physicscluster

    
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    config.py:281 - DEBUG - Loading config
    config.py:99 - DEBUG - Loading file: /root/.starcluster/config
    >>> Using default cluster template: smallcluster
    awsutils.EasyEC2.__init___    awsutils.EasyEC2.__init___(...)
    
    awsutils.EasyAWS.__init__    awsutils.EasyAWS.__init__(accesskey, secretkey, connection_authenticator, kwards)
    
    awsutils.EasyAWS.__init__    awsutils.EasyAWS.__init__(accesskey, secretkey, connection_authenticator, kwards)
    awsutils.EasyEC2.__init___    awsutils.EasyEC2.__init___(...)
    
    awsutils.EasyAWS.__init__    awsutils.EasyAWS.__init__(accesskey, secretkey, connection_authenticator, kwards)
    
    awsutils.EasyAWS.__init__    awsutils.EasyAWS.__init__(accesskey, secretkey, connection_authenticator, kwards)
    awsutils.conn   self.conn(self)
    awsutils.conn   self.aws_access_key: **AKIAIZXZ6S7ARZ44TTHQ**
    awsutils.conn   self.aws_secret_access_key: **4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6**
    awsutils.py:64 - DEBUG - creating self._conn w/ connection_authenticator kwargs = {'path': '/', 'region': None, 'port': None, 'is_secure': True}
    awsutils.conn    Doing self._conn = self.connection_authenticator()
    awsutils.conn    self.connection_authenticator:  < function connect_ec2 at 0x9c5c80>
    boto.connection.AWSAuthConnection.__init__    boto.connection.AWSAuthConnection.__init__(self, host, aws_access_key_id, aws_secret_access_key, etc)
    boto.connection.AWSAuthConnection.__init__    aws_access_key_id:  AKIAIZXZ6S7ARZ44TTHQ
    boto.connection.AWSAuthConnection.__init__    aws_secret_access_key:  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
    ec2.connection.AWSAuthConnection.__init__    self.hmac:  < hmac.HMAC instance at 0x13f3560>
    
    boto.connection.AWSQueryConnection.__init__    boto.connection.AWSQueryConnection.__init__(self, host, aws_access_key_id, aws_secret_access_key, etc)
    boto.connection.AWSQueryConnection.__init__    aws_access_key_id:  AKIAIZXZ6S7ARZ44TTHQ
    boto.connection.AWSQueryConnection.__init__    aws_secret_access_key:  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
    ec2.connection.EC2Connection.__init__    EC2ResponseError:  < class 'boto.exception.EC2ResponseError'>
    < class 'boto.exception.EC2ResponseError'>
    
    awsutils.conn    Returning self._conn... 
    
    connection.make_request    connection.make_request(self, action, params, path, verb)
    connection.get_signature    connection.get_signature(self, params, verb, path)
    connection.calc_signature2    connection.calc_signature2(self, params, verb, path)
    connection.calc_signature2    Returning qs:  AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeSecurityGroups&GroupName.1=%40sc-physicscluster&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T08%3A27%3A08&Version=2009-11-30  and b64:  FrHckX/jNOQ40WukfOjVFO8CXiYVqEGb1bLNbZY4P8I=
    connection.make_request    Returning AWSAuthConnection.make_request(...)
    connection.AWSAuthConnection.make_request    connection.AWSAuthConnection.make_request(self, method, path, headers, data, host, auth_path, sender)
    connection.AWSAuthConnection.make_request    Before return self._mexe
    connection._mexe    connection._mexe(method, path, data, headers, host, sender)
        Method: GET
        Path: /?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeSecurityGroups&GroupName.1=%40sc-physicscluster&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T08%3A27%3A08&Version=2009-11-30&Signature=FrHckX/jNOQ40WukfOjVFO8CXiYVqEGb1bLNbZY4P8I%3D
        Data: 
        Headers: {'Date': 'Tue, 21 Dec 2010 08:27:08 GMT', 'Content-Length': '0', 'Authorization': 'AWS AKIAIZXZ6S7ARZ44TTHQ:6lzoMU3zIhy9909bXDkKpB3MqVQ=', 'User-Agent': 'Boto/1.9b (linux2)'}
        Host: None
    connection._mexe    try  0
    connection._mexe    callable(sender) NOT DEFINED

    connection._mexe    response:  httplib.HTTPResponse instance at 0x13fe320>

    connection._mexe    BEFORE if response.status == 500
    connection._mexe    response.status < 300 or >=400 
    < HTTPResponse at 13fe320> 
      _method: 'GET'
      chunk_left: None
      chunked: 1
      debuglevel: 0
      fp: < _fileobject at 0x13eddd0>: < socket._fileobject object at 0x13eddd0>
      length: None
      msg: < HTTPMessage at 13fe368: Transfer-Encoding: chunked
    Date: Tue, 21 Dec 2010 08:27:07 GMT
    Server: AmazonEC2
    >
        dict: < dictionary at 0x14702a0>: {'transfer-encoding': 'chunked', 'date': 'Tue, 21 Dec 2010 08:27:07 GMT', 'server': 'AmazonEC2'}
        encodingheader: None
        fp: None
        headers: < list at 0x13f3908>: ['Transfer-Encoding: chunked\r\n', 'Date: Tue, 21 Dec 2010 08:27:07 GMT\r\n', 'Server: AmazonEC2\r\n']
        maintype: 'text'
        plist: < list at 0x13f3e18>: []
        plisttext: ''
        seekable: 0
        startofbody: None
        startofheaders: None
        status: ''
        subtype: 'plain'
        type: 'text/plain'
        typeheader: None
        unixfrom: ''
      reason: 'Forbidden'
      status: 403
      strict: 0
      version: 11
      will_close: < bool at 0x787990>: False
    boto.exception.EC2ResponseError    boto.exception.EC2ResponseError(BotoServerError)
    boto.exception.EC2ResponseError    BotoServerError:  < class 'boto.exception.BotoServerError'>
    < class 'boto.exception.BotoServerError'>
    >>> Validating cluster template settings...
    
    cluster.is_valid    is_valid(self)
    cluster.is_valid    BEFORE self._validate_credentials
    
    cluster._validate_credentials    cluster._validate_credentials(self)
    awsutils.is_valid_conn    awsutils.is_valid_conn(self)
    awsutils.is_valid_conn    Doing try self.get_all_instances()
    
    awsutils.get_all_instances    get_all_instances(self, instance_ids)
    awsutils.get_all_instances    instance_ids:  []
    awsutils.conn   self.conn(self)
    awsutils.conn   self.aws_access_key: **AKIAIZXZ6S7ARZ44TTHQ**
    awsutils.conn   self.aws_secret_access_key: **4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6**
    awsutils.py:64 - DEBUG - creating self._conn w/ connection_authenticator kwargs = {'path': '/', 'region': None, 'port': None, 'is_secure': True}
    awsutils.conn    Doing self._conn = self.connection_authenticator()
    awsutils.conn    self.connection_authenticator:  < function connect_ec2 at 0x9c5c80>
    boto.connection.AWSAuthConnection.__init__    boto.connection.AWSAuthConnection.__init__(self, host, aws_access_key_id, aws_secret_access_key, etc)
    boto.connection.AWSAuthConnection.__init__    aws_access_key_id:  AKIAIZXZ6S7ARZ44TTHQ
    boto.connection.AWSAuthConnection.__init__    aws_secret_access_key:  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
    ec2.connection.AWSAuthConnection.__init__    self.hmac:  < hmac.HMAC instance at 0x13fef38>
    
    boto.connection.AWSQueryConnection.__init__    boto.connection.AWSQueryConnection.__init__(self, host, aws_access_key_id, aws_secret_access_key, etc)
    boto.connection.AWSQueryConnection.__init__    aws_access_key_id:  AKIAIZXZ6S7ARZ44TTHQ
    boto.connection.AWSQueryConnection.__init__    aws_secret_access_key:  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
    ec2.connection.EC2Connection.__init__    EC2ResponseError:  < class 'boto.exception.EC2ResponseError'>
    < class 'boto.exception.EC2ResponseError'>
    
    awsutils.conn    Returning self._conn... 
    
    connection.make_request    connection.make_request(self, action, params, path, verb)
    connection.get_signature    connection.get_signature(self, params, verb, path)
    connection.calc_signature2    connection.calc_signature2(self, params, verb, path)
    connection.calc_signature2    Returning qs:  AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T08%3A27%3A08&Version=2009-11-30  and b64:  QNqIbL9pTcv0RsgUMhEicrlddUD5ZkY66GsfZeb1afk=
    connection.make_request    Returning AWSAuthConnection.make_request(...)
    connection.AWSAuthConnection.make_request    connection.AWSAuthConnection.make_request(self, method, path, headers, data, host, auth_path, sender)
    connection.AWSAuthConnection.make_request    Before return self._mexe
    connection._mexe    connection._mexe(method, path, data, headers, host, sender)
        Method: GET
        Path: /?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T08%3A27%3A08&Version=2009-11-30&Signature=QNqIbL9pTcv0RsgUMhEicrlddUD5ZkY66GsfZeb1afk%3D
        Data: 
        Headers: {'Date': 'Tue, 21 Dec 2010 08:27:08 GMT', 'Content-Length': '0', 'Authorization': 'AWS AKIAIZXZ6S7ARZ44TTHQ:6lzoMU3zIhy9909bXDkKpB3MqVQ=', 'User-Agent': 'Boto/1.9b (linux2)'}
        Host: None
    connection._mexe    try  0
    connection._mexe    callable(sender) NOT DEFINED
    connection._mexe    response:  < httplib.HTTPResponse instance at 0x140f2d8>
    connection._mexe    BEFORE if response.status == 500
    connection._mexe    response.status <  300 or >=400 
    < HTTPResponse at 140f2d8> 
      _method: 'GET'
      chunk_left: None
      chunked: 1
      debuglevel: 0
      fp: < _fileobject at 0x1404050>: < socket._fileobject object at 0x1404050>
      length: None
      msg: < HTTPMessage at 140f320: Transfer-Encoding: chunked
    Date: Tue, 21 Dec 2010 08:27:08 GMT
    Server: AmazonEC2
    >
        dict: < dictionary at 0x1496a60>: {'transfer-encoding': 'chunked', 'date': 'Tue, 21 Dec 2010 08:27:08 GMT', 'server': 'AmazonEC2'}
        encodingheader: None
        fp: None
        headers: < list at 0x13f2368>: ['Transfer-Encoding: chunked\r\n', 'Date: Tue, 21 Dec 2010 08:27:08 GMT\r\n', 'Server: AmazonEC2\r\n']
        maintype: 'text'
        plist: < list at 0x13f23f8>: []
        plisttext: ''
        seekable: 0
        startofbody: None
        startofheaders: None
        status: ''
        subtype: 'plain'
        type: 'text/plain'
        typeheader: None
        unixfrom: ''
      reason: 'Forbidden'
      status: 403
      strict: 0
      version: 11
      will_close: < bool at 0x787990>: False
    boto.exception.EC2ResponseError    boto.exception.EC2ResponseError(BotoServerError)
    boto.exception.EC2ResponseError    BotoServerError:  < class 'boto.exception.BotoServerError'>
    < class 'boto.exception.BotoServerError'>
    awsutils.is_valid_conn    boto.exception.EC2REsponseError RAISED!!!
    awsutils.is_valid_conn    e:  EC2ResponseError: 403 Forbidden
    < ?xml version="1.0" encoding="UTF-8"?>
    < Response>< Errors>< Error>< Code>SignatureDoesNotMatch< /Code>< Message>The request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.< /Message>< /Error>< /Errors>< RequestID>cdb73666-37a6-4dfc-9f66-2add7b04a0bf< /RequestID>< /Response>
    awsutils.is_valid_conn    DUMP boto.exception.EC2ResponseError: 
    < class 'boto.exception.EC2ResponseError'>
    
    cluster._validate_credentials    self.ec2.is_valid_conn NOT TRUE
    cluster.is_valid    ERROR
    cluster.py:782 - ERROR - Invalid AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY combination.
    cli.py:243 - ERROR - settings for cluster template "smallcluster" are not valid


DEBUG OUTPUT:

import pprint;
pp = pprint.PrettyPrinter(indent=4)
pprint(self._conn)

import dumper;

sys.stdout.write("awsutils.conn   self.aws_access_key: **");
sys.stdout.write(self.aws_access_key)
sys.stdout.write('**\n');
sys.stdout.write("awsutils.conn   self.aws_secret_access_key: **");
sys.stdout.write(self.aws_secret_access_key)
sys.stdout.write('**\n')

log.debug("awsutils.conn    Doing self._conn = self.connection_authenticator()");
log.debug("awsutils.conn    self.connection_authenticator: ");
log.debug(self.connection_authenticator);


boto
----

IN CODE:

if not boto.config.has_section('Boto'):
    boto.config.add_section('Boto')
    boto.config.set('Boto', 'debug', '2')

CONFIG FILE:

[Boto]
debug = 0
num_retries = 10

proxy = myproxy.com
proxy_port = 8080
proxy_user = foo
proxy_pass = bar












NB: CHANGED TIMEZONE TO GMT BUT SAME ERROR




EDITS
-----

cli.py
------
LINE 1019

def main():
    # Create global options parser.

    print "HERE"
    import dumper
    dumper.max_depth = 10           # default is 5
    dumper.dump(self)
    #dumper.dump (really_deep_object)


cluster.py
----------
LINE 755



awsutils.py
-----------
LINE 59

    import dumper
    dumper.max_depth = 10           # default is 5
    dumper.dump (really_deep_object)

    import pprint
    pp = pprint.PrettyPrinter(indent=4)
    d = self.connection_authenticator.__dict__
    print d
    
    print vars(self.connection_authenticator)
    

THIS OUTPUTS THAT self.connection_authenticator IS REALLY FUNCTION connect_ec2]

    awsutils.conn    self.connection_authenticator:  < function connect_ec2 at 0x9c5c80>


WHICH IS AT awsutils.py LINE 89:

    super(EasyEC2, self).__init__(aws_access_key_id, aws_secret_access_key,
                                      boto.connect_ec2, **kwargs)
                                      
                                      


WHICH CALLS connect_ec2 IN boto's __init__.py:


LINE 101:

def connect_ec2(aws_access_key_id=None, aws_secret_access_key=None, **kwargs):
    """
    :type aws_access_key_id: string
    :param aws_access_key_id: Your AWS Access Key ID

    :type aws_secret_access_key: string
    :param aws_secret_access_key: Your AWS Secret Access Key

    :rtype: :class  :`boto.ec2.connection.EC2Connection`
    :return: A connection to Amazon's EC2
    """
    from boto.ec2.connection import EC2Connection
    return EC2Connection(aws_access_key_id, aws_secret_access_key, **kwargs)
    

WHICH CALLS EC2Connection IN

/usr/local/lib/python2.7/site-packages/boto-1.9b-py2.7.egg/boto/ec2/connection.py


WHICH IN TURN CALLS AWSQueryConnection IN 

/usr/local/lib/python2.7/site-packages/boto-1.9b-py2.7.egg/boto/connection.py





















CLOCK IS OFF BY MORE THAN 10 MINS
---------------------------------

1. MOVE OLD TIMEZONE FILE

mv /etc/localtime /etc/localtime.bkp


2. LINK /etc/localtime TO GMT

ln -sf /usr/share/zoneinfo/GMT /etc/localtime


3. CONFIRM NEW TIMEZONE IN DATE

date

    Tue Dec 21 17:25:07 GMT 2010


4. AND CHANGE BACK AGAIN:

mv /etc/localtime /etc/localtime.bkp
ln -sf /usr/share/zoneinfo/EST /etc/localtime
date




The timezone under Linux is set by a symbolic link from

/etc/localtime

to a file in the

/usr/share/zoneinfo

directory that corresponds with what timezone you are in.


For example, since I'm in South Australia, /etc/localtime is a symlink to /usr/share/zoneinfo/Australia/South.

To set this link, type:

ln -sf ../usr/share/zoneinfo/your/zone /etc/localtime

Replace your/zone with something like Australia/NSW or Australia/Perth. Have a look in the directories under /usr/share/zoneinfo to see what timezones are available.

[1] This assumes that /usr/share/zoneinfo is linked to /etc/localtime as it is under Red Hat Linux.

[2] On older systems, you'll find that /usr/lib/zoneinfo is used instead of /usr/share/zoneinfo. See also the later section ``The time in some applications is wrong''.



The advice provided by allen03 on this thread is a good place to start.

"I think the first thing to check is that the GMT time on your computer is set correctly."

http://developer.amazonwebservices.com/connect/thread.jspa?threadID=16023&tstart=0

If the clock on your system that is signing your requests is off by more than 10 minutes, your requests will fail.





http://www.linuxsa.org.au/tips/time.html
Linux, Clocks, and Time

Introduction

This document explains how to set your computer's clock from Linux, how to set your timezone, and other stuff related to Linux and how it does its time-keeping.

Your computer has two timepieces; a battery-backed one that is always running (the ``hardware'', ``BIOS'', or ``CMOS'' clock), and another that is maintained by the operating system currently running on your computer (the ``system'' clock). The hardware clock is generally only used to set the system clock when your operating system boots, and then from that point until you reboot or turn off your system, the system clock is the one used to keep track of time.

On Linux systems, you have a choice of keeping the hardware clock in UTC/GMT time or local time. The preferred option is to keep it in UTC because then daylight savings can be automatically accounted for. The only disadvantage with keeping the hardware clock in UTC is that if you dual boot with an operating system (such as DOS) that expects the hardware clock to be set to local time, the time will always be wrong in that operating system.
Setting your timezone

The timezone under Linux is set by a symbolic link from /etc/localtime[1] to a file in the /usr/share/zoneinfo[2] directory that corresponds with what timezone you are in. For example, since I'm in South Australia, /etc/localtime is a symlink to /usr/share/zoneinfo/Australia/South. To set this link, type:

ln -sf ../usr/share/zoneinfo/your/zone /etc/localtime

Replace your/zone with something like Australia/NSW or Australia/Perth. Have a look in the directories under /usr/share/zoneinfo to see what timezones are available.

[1] This assumes that /usr/share/zoneinfo is linked to /etc/localtime as it is under Red Hat Linux.

[2] On older systems, you'll find that /usr/lib/zoneinfo is used instead of /usr/share/zoneinfo. See also the later section ``The time in some applications is wrong''.

Setting UTC or local time

When Linux boots, one of the initialisation scripts will run the /sbin/hwclock program to copy the current hardware clock time to the system clock. hwclock will assume the hardware clock is set to local time unless it is run with the --utc switch. Rather than editing the startup script, under Red Hat Linux you should edit the /etc/sysconfig/clock file and change the ``UTC'' line to either ``UTC=true'' or ``UTC=false'' as appropriate.

Setting the system clock

To set the system clock under Linux, use the date command. As an example, to set the current time and date to July 31, 11:16pm, type ``date 07312316'' (note that the time is given in 24 hour notation). If you wanted to change the year as well, you could type ``date 073123161998''. To set the seconds as well, type ``date 07312316.30'' or ``date 073123161998.30''. To see what Linux thinks the current local time is, run date with no arguments.

Setting the hardware clock

To set the hardware clock, my favourite way is to set the system clock first, and then set the hardware clock to the current system clock by typing ``/sbin/hwclock --systohc'' (or ``/sbin/hwclock --systohc --utc'' if you are keeping the hardware clock in UTC). To see what the hardware clock is currently set to, run hwclock with no arguments. If the hardware clock is in UTC and you want to see the local equivalent, type ``/sbin/hwclock --utc''

The time in some applications is wrong

If some applications (such as date) display the correct time, but others don't, and you are running Red Hat Linux 5.0 or 5.1, you most likely have run into a bug caused by a move of the timezone information from /usr/lib/zoneinfo to /usr/share/zoneinfo. The fix is to create a symbolic link from /usr/lib/zoneinfo to /usr/share/zoneinfo: ``ln -s ../share/zoneinfo /usr/lib/zoneinfo''.

Summary

/etc/sysconfig/clock sets whether the hardware clock is stored as UTC or local time.
Symlink /etc/localtime to /usr/share/zoneinfo/... to set your timezone.
Run ``date MMDDhhmm'' to set the current system date/time.
Type ``/sbin/hwclock --systohc [--utc]'' to set the hardware clock.
Other interesting notes

The Linux kernel always stores and calculates time as the number of seconds since midnight of the 1st of January 1970 UTC regardless of whether your hardware clock is stored as UTC or not. Conversions to your local time are done at run-time. One neat thing about this is that if someone is using your computer from a different timezone, they can set the TZ environment variable and all dates and times will appear correct for their timezone.

If the number of seconds since the 1st of January 1970 UTC is stored as an signed 32-bit integer (as it is on your Linux/Intel system), your clock will stop working sometime on the year 2038. Linux has no inherent Y2K problem, but it does have a year 2038 problem. Hopefully we'll all be running Linux on 64-bit systems by then. 64-bit integers will keep our clocks running quite well until aproximately the year 292271-million.

Other programs worth looking at

rdate - get the current time from a remote machine; can be used to set the system time.
xntpd - like rdate, but it's extremely accurate and you need a permanent 'net connection. xntpd runs continuously and accounts for things like network delay and clock drift, but there's also a program (ntpdate) included that just sets the current time like rdate does.
Further information

date(1)
hwclock(8)
/usr/doc/HOWTO/mini/Clock




URL ENCODING CONVERSION
-----------------------

URL ENCODING
http://www.blooberry.com/indexdot/html/topics/urlencoding.htm

FORWARD SLASH "/" IS %2F




export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib/:/usr/local/lib/python2.7/:/usr/local/lib/python2.7/site-packages
export PYTHONHOME=/usr/local
cd /root/base/apps/starcluster/0.91.2/build/lib/starcluster
python cli.py -d -c /root/.starcluster/config start physicscluster


http://ec2.amazonaws.com?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA1&SignatureVersion=2&Timestamp=2010-12-22T09%3A04%3A20&Version=2009-11-30&Signature=pr3RqCe%2F7Z1cYH6fPlcmoCblufU%3D




AMAZON SIGNATURES
Authenticating REST Requests
http://docs.amazonwebservices.com/AmazonS3/latest/dev/index.html?RESTAuthentication.html


TEST ec2.amazonaws.com URL:

http://ec2.amazonaws.com/?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T16:31:14&Version=2009-11-30&Signature=WuL6svq8y6tL3vItyCBCMlKMJlcrPJVzwPMub/YQNE8%3D


OUTPUT:

SignatureDoesNotMatchThe request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.5160d3b9-a368-4299-9c16-48e755ae4de4




TEST ec2.amazonaws.com URL REPLACING URL ENCODING WITH '=':

http://ec2.amazonaws.com/?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T16:31:14&Version=2009-11-30&Signature=WuL6svq8y6tL3vItyCBCMlKMJlcrPJVzwPMub/YQNE8=

OUTPUT:

SignatureDoesNotMatchThe request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.ece7c9ff-261f-4aca-a683-22b2f1cb38b2



CHANGE SIGNING METHOD FROM hmac SHA256 TO hmac SHA1:





CHANGE SIGNING METHOD TO hmac 0:


hmac SHA1

send: 'GET /?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA1&SignatureVersion=2&Timestamp=2010-12-21T17%3A08%3A32&Version=2009-11-30&Signature=Gc1NrSJoB9lbXChcw4omAZ4Wzxo%3D HTTP/1.1\r\nHost: ec2.amazonaws.com\r\nAccept-Encoding: identity\r\nDate: Tue, 21 Dec 2010 17:08:32 GMT\r\nContent-Length: 0\r\nAuthorization: AWS AKIAIZXZ6S7ARZ44TTHQ:XOGw4f7yPvbbXJO3xYCylruVo5w=\r\nUser-Agent: Boto/1.9b (linux2)\r\n\r\n'
reply: 'HTTP/1.1 403 Forbidden\r\n'


hmac 0

send: 'GET /?Action=DescribeInstances&AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&SignatureVersion=2&Timestamp=2010-12-21T17%3A09%3A31&Version=2009-11-30&Signature=dm3wkXymbjSm%2BIzzeEF%2B04nMX0I%3D HTTP/1.1\r\nHost: ec2.amazonaws.com\r\nAccept-Encoding: identity\r\nDate: Tue, 21 Dec 2010 17:09:31 GMT\r\nContent-Length: 0\r\nAuthorization: AWS AKIAIZXZ6S7ARZ44TTHQ:Qh3ef0pQYB9cfAeKPmRRgPaG7O4=\r\nUser-Agent: Boto/1.9b (linux2)\r\n\r\n'
reply: 'HTTP/1.1 400 Bad Request\r\n'
header: Transfer-Encoding: chunked

    awsutils.is_valid_conn    e:  EC2ResponseError: 400 Bad Request
    <?xml version="1.0" encoding="UTF-8"?>
    <Response><Errors><Error><Code>MissingParameter</Code><Message>The request must contain the parameter SignatureMethod</Message></Error></Errors><RequestID>db7e5063-05f0-4967-a860-ba0c2eed3de4</RequestID></Response>






OUR CALCULATED SIGNATURE:

    connection.calc_signature2    Returning qs:  AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T08%3A27%3A08&Version=2009-11-30  and b64:  QNqIbL9pTcv0RsgUMhEicrlddUD5ZkY66GsfZeb1afk=


...GETS CONVERTED INTO URL ENCODING WHEN IT'S PUT INTO THE QUERY:

        Path: /?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T08%3A27%3A08&Version=2009-11-30&Signature=QNqIbL9pTcv0RsgUMhEicrlddUD5ZkY66GsfZeb1afk%3D


HYPOTHESIS:

AMAZONEC2 REJECTS THE REQUEST BECAUSE THE SIGNATURE 

QNqIbL9pTcv0RsgUMhEicrlddUD5ZkY66GsfZeb1afk%3D

DOES NOT MATCH IT'S CALCULATED SIGNATURE:

QNqIbL9pTcv0RsgUMhEicrlddUD5ZkY66GsfZeb1afk=



SOLUTION:

CONVERT BACK SIGNATURE PORTION BEFORE SENDING OUT





https://forums.aws.amazon.com/thread.jspa?messageID=81141&#81141

The problem is that WMP appears to be changing the URL:

sysinternals' process explorer confirms that the browser hands the correct signature on the command line to WMP:

c:\progfiles\wmplayer.exe /open http://...&Signature=YrGlRXcApOx25kXJdsCJjTS1%2Bes%3D

but it gets changed to

GET /...&Signature=YrGlRXcApOx25kXJdsCJjTS1+es= HTTP/1.1

on the wire.

Query string parameters are URL encoded, so + means space not plus, and Amazon S3 rejects the WMP request because the signature doesn't match.




















BOTO
----

DOWNLOAD AND INSTALL BOTO 2.0a2
-------------------------------

DOWNLOAD SITE
http://code.google.com/p/boto/downloads/list

DOWNLOAD FILE
http://boto.googlecode.com/files/boto-2.0a2.tar.gz


mkdir -p /root/base/apps/boto/archive
wget http://boto.googlecode.com/files/boto-2.0a2.tar.gz
tar xfvz *
cd boto*
python setup.py install
    
    ...
    creating /usr/local/lib/python2.7/site-packages/boto-2.0a2-py2.7.egg
    Extracting boto-2.0a2-py2.7.egg to /usr/local/lib/python2.7/site-packages
    Removing boto 1.9b from easy-install.pth file
    Adding boto 2.0a2 to easy-install.pth file
    Installing launch_instance script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing cfadmin script to /usr/local/bin
    Installing pyami_sendmail script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing kill_instance script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    Installing bundle_image script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/boto-2.0a2-py2.7.egg
    Processing dependencies for boto==2.0a2
    Finished processing dependencies for boto==2.0a2






BotoConfig  
Site and user configuration of boto.
Introduction
There is a growing list of configuration options for the boto library. Many of these options can be passed into the constructors for top-level objects such as connections. Some options, such as credentials, can also be read from environment variables (e.g. AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY). But there is no central place to manage these options. So, the development version of boto has now introduced the notion of boto config files.

Details
A boto config file is simply a .ini format configuration file that specifies values for options that control the behavior of the boto library. Upon startup, the boto library looks for configuration files in the following locations and in the following order:

/etc/boto.cfg - for site-wide settings that all users on this machine will use
~/.boto - for user-specific settings
The options are merged into a single, in-memory configuration that is available as boto.config. The boto.pyami.config class is a subclass of the standard Python SafeConfigParser object and inherits all of the methods of that object. In addition, the boto.pyami.config class defines additional methods that are described on the PyamiConfigMethods page.

Sections
The following sections and options are currently recognized within the boto config file.

Credentials
The Credentials section is used to specify the AWS credentials used for all boto requests. The order of precedence for authentication credentials is:

Credentials passed into Connection class constructor.
Credentials specified by environment variables
Credentials specified as options in the config file.
This section defines the following options:

aws_access_key_id

Your AWS access key
aws_secret_access_key

Your AWS secret access key
Example
[Credentials]
aws_access_key_id = < your access key>
aws_secret_access_key = < your secret key>
Boto
The Boto section is used to specify options that control the operaton of boto itself. This section defines the following options:

debug

Controls the level of debug messages that will be printed by the boto library. The following values are defined:
        0 - no debug messages are printed
        1 - basic debug messages from boto are printed
        2 - all boto debugging messages plus request/response messages from httplib
proxy

The name of the proxy host to use for connecting to AWS.
proxy_port

The port number to use to connect to the proxy host.
proxy_user

The user name to use when authenticating with proxy host.
proxy_pass

The password to use when authenticating with proxy host.
num_retries

The number of times to retry failed requests to an AWS server. If boto receives an error from AWS, it will attempt to recover and retry the request. The default number of retries is 5 but you can change the default with this option.
Examples
[Boto]
debug = 0
num_retries = 10

proxy = myproxy.com
proxy_port = 8080
proxy_user = foo
proxy_pass = bar

Comment by mbloore, Sep 29, 2008
You may want to do your own retries, say to log errors. You can do that in your code without affecting (or creating) the config file:

if not boto.config.has_section('Boto'):
boto.config.add_section('Boto')
boto.config.set('Boto', 'num_retries', '0')
Naturally, that applies to any parameter you want to change locally.

Comment by Matthew.Pettis, Oct 14, 2008
Hi,

1. Where should you stick boto.cfg on a WindowsXP box? 2. Can you tell boto where to find boto.cfg if it isn't in a standard directory?

Comment by mjunaiddar, Nov 04, 2008
Hi,

raise self.ResponseError?(response.status, response.reason, body)
boto.exception.EC2ResponseError: EC2ResponseError: 401 Unauthorized < ?xml version="1.0"?> < Response>< Errors>< Error>< Code>AuthFailure?< /Code>< Message>AWS was not able to validate the provided access credentials< /Message>< /Error>< /Errors>< RequestID>15232c56-6992-4fe6-8f77-8c42a3a3c096< /RequestID>< /Response>

This is the error when I try to run the boto file on linux machine, The system has: Python 2.3.4 (#1, Jul 25 2008, 14:23:21) 3.4.6 20060404 (Red Hat 3.4.6-10)? on linux2

Is this due to the version problem? because the credentials are all ok and the same file is running at my Windows System. I just copied the finger print ppk file and the two .pem files to the linux machine from my Windows is it ok or am I supposed to create a new key pair file ? if so can you please tell me how to ?

Is their any tutorial available on setting up Boto from scratch on linux system in step by step manner?







MESSAGES TO AMAZON
-----------------



Hi,

I'm replying to this contact form as I couldn't reply by email to Christa, who responded to my earlier message (please see copied below).

Thank you,

Stuart.

----------------------------------------------------------------------------------

Hi Christa,

I forgot to mention that I already tried using a newly generated access 
key pair but I got the same error.

I need to determine whether it's a problem with boto (I'm using version 
1.9b) or at your end. Is there any way you can check a request id and, 
e.g., provide me with debug output? Here's the request id:

7e896661-3b7a-4993-8146-af89098836d3

Thank you for the link to your forums. I found this link while I was 
searching them:
Authenticating REST Requests
http://docs.amazonwebservices.com/AmazonS3/latest/dev/index.html?RESTAuthentication.html

It's very informative on S3 authentication but I'm not clear EC2 
authentication, e.g., what types of encoding (hmac sha1, sha256, etc.), 
is base64 encoding supported/required, etc. Is there a link you could 
send me that gives the same information as this link, but for EC2?

Here's an example of the actual requests I'm making:

TEST ec2.amazonaws.com URL (please paste this into your browser URL window):

http://ec2.amazonaws.com/?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T16:31:14&Version=2009-11-30&Signature=WuL6svq8y6tL3vItyCBCMlKMJlcrPJVzwPMub/YQNE8%3D


OUTPUT:

SignatureDoesNotMatch The request signature we calculated does not match 
the signature you provided. Check your AWS Secret Access Key and signing 
method. Consult the service documentation for 
details.5160d3b9-a368-4299-9c16-48e755ae4de4


Btw, just in case, I tried replacing the URL encoding for '=' with the 
actual character '=" but got the same error:

TEST ec2.amazonaws.com URL REPLACING URL ENCODING WITH '=':

http://ec2.amazonaws.com/?AWSAccessKeyId=AKIAIZXZ6S7ARZ44TTHQ&Action=DescribeInstances&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2010-12-21T16:31:14&Version=2009-11-30&Signature=WuL6svq8y6tL3vItyCBCMlKMJlcrPJVzwPMub/YQNE8=

OUTPUT:

SignatureDoesNotMatchThe request signature we calculated does not match 
the signature you provided. Check your AWS Secret Access Key and signing 
method. Consult the service documentation for 
details.ece7c9ff-261f-4aca-a683-22b2f1cb38b2


Cheers,

Stuart



On 12/21/2010 12:21 PM, Amazon.com Customer Service wrote:
> > Hello Stuart,
> >
> > I'm truly sorry to hear of the troubles you've encountered authenticating your AWS Access Keys using Boto.
> >
> > You can reset your AWS Access Keys by following these steps:
> >
> > 1. Go to http://aws.amazon.com
> > 2. Click on "Account">  "Security Credentials"
> > 3. Sign into your AWS account
> > 4. Click on "Access Credentials"
> >
>> > > From here, click on "Create a new Access Key" and confirm that you would like to generate a new pair. This will generate both access and secret access keys.
> >
> > Please keep in mind that your account is only able to have two sets of keys at any given time. If you already have two sets created, you will not see the option to create a new set until one has been made inactive and then deleted.
> >
> > Your technical questions will be best answered on our Amazon EC2 developer forums:
> >
> > http://developer.amazonwebservices.com/ec2/forums
> >
> > Our technical staff and the Amazon Web Services developer community participate in the forums regularly and will be able to help you. Generally, questions are responded to in about a day, though there is not a guaranteed response time.
> >
> > If you have critical business infrastructure on AWS, you may also want to consider an AWS Premium Support package, which provides a direct, reliable support channel for technical issues related to many of our services. You can learn more about AWS Premium Support here:
> >
> > http://aws.amazon.com/premiumsupport
> >
> > I hope this helps. We look forward to seeing you again soon.
> >
> > Did I solve your problem?
> >
> > If yes, please click here:
> > http://www.amazon.com/rsvp-y?c=fvcybarc3260036644
> >
> > If no, please click here:
> > http://www.amazon.com/rsvp-n?c=fvcybarc3260036644
> >
> > Please note: this e-mail was sent from an address that cannot accept incoming e-mail.
> >
> > To contact us about an unrelated issue, please visit the Help section of our web site.
> >
> > Best regards,
> >
> > Crista W.
> > aws.amazon.com
> >
> > ---- Original message: ----
> >
> > AWS AccountId			728213020069
> > email			youngstuart@hotmail.com
> > accountnumber			728213020069
> > name			Young Stuart Peter
> > subject			SignatureDoesNotMatch
> > message			I am having a problem with authenticating my aws access key and aws secret access key using the python module 'boto' (v1.9b). I can authenticate with ElasticFox or using perl Net::Amazon::EC2 using my keys but when I try it with boto I get the following error:
> >
> > awsutils.is_valid_conn    e:  EC2ResponseError: 403 Forbidden
> > < ?xml version="1.0" encoding="UTF-8"?>
> > < Response>< Errors>< Error>< Code>SignatureDoesNotMatch< /Code>< Message>The request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.< /Message>< /Error>< /Errors>< RequestID>7e896661-3b7a-4993-8146-af89098836d3< /RequestID>< /Response>
> > cluster.is_valid    ERROR
> > cluster.py:774 - ERROR - Invalid AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY combination.
> >
> > How is the request signature calculated and are there any reasons (e.g., signing method) why it might be calculated differently by Amazon's servers and my boto installation?
> >
> > Could you please let me know what the 'signing method' is and how I can change it?
> >
> > And could you also check that my keys are behaving normally when requests like this get sent to EC2?
> >
> > Thank you,
> >
> > Stuart
> >
> >
> >






I am having a problem with authenticating my aws access key and aws secret access key using the python module 'boto' (v1.9b). I can authenticate with ElasticFox or using perl Net::Amazon::EC2 using my keys but when I try it with boto I get the following error:

awsutils.is_valid_conn    e:  EC2ResponseError: 403 Forbidden
< ?xml version="1.0" encoding="UTF-8"?>
< Response>< Errors>< Error>< Code>SignatureDoesNotMatch< /Code>< Message>The request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.< /Message>< /Error>< /Errors>< RequestID>7e896661-3b7a-4993-8146-af89098836d3< /RequestID>< /Response>
cluster.is_valid    ERROR
cluster.py:774 - ERROR - Invalid AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY combination. 

How is the request signature calculated and are there any reasons (e.g., signing method) why it might be calculated differently by Amazon's servers and my boto installation?

Could you please let me know what the 'signing method' is and how I can change it?

And could you also check that my keys are behaving normally when requests like this get sent to EC2?

Thank you,

Stuart









REINSTALL STARCLUSTER 0.91.2 WITH BOTO 2.0b3
--------------------------------------------

1. MOVE BOTO 1.9b EGG

cd /usr/local/lib/python2.7/site-packages
mv boto-1.9b-py2.7.egg boto-1.9b-py2.7.egg.ok

    cd /root/base/apps/starcluster/0.91.2
python setup.py install 

    
    running install
    ...
    Installed /usr/local/lib/python2.7/site-packages/StarCluster-0.91.2-py2.7.egg
    Processing dependencies for StarCluster==0.91.2
    Searching for boto==1.9b
    Reading http://pypi.python.org/simple/boto/
    Reading http://code.google.com/p/boto/
    Reading http://code.google.com/p/boto
    Best match: boto 1.9b
    Downloading http://boto.googlecode.com/files/boto-1.9b.tar.gz
    Processing boto-1.9b.tar.gz
    Running boto-1.9b/setup.py -q bdist_egg --dist-dir /tmp/easy_install-rGmR0d/boto-1.9b/egg-dist-tmp-WvObOF
    zip_safe flag not set; analyzing archive contents...
    boto.s3.__init__: module references __path__
    boto.sqs.__init__: module references __path__
    Adding boto 1.9b to easy-install.pth file
    Installing launch_instance script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/boto-1.9b-py2.7.egg
    Searching for paramiko==1.7.6
    Best match: paramiko 1.7.6
    Processing paramiko-1.7.6-py2.7.egg
    paramiko 1.7.6 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.7/site-packages/paramiko-1.7.6-py2.7.egg
    Searching for pycrypto==2.3
    Best match: pycrypto 2.3
    Processing pycrypto-2.3-py2.7-linux-x86_64.egg
    pycrypto 2.3 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.7/site-packages/pycrypto-2.3-py2.7-linux-x86_64.egg
    Finished processing dependencies for StarCluster==0.91.2


WHICH CHANGED easy-install.pth

CHANGED FROM THIS:

cat easy-install.pth

    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./boto-1.9b-py2.7.egg
    ./StarCluster-0.91.2-py2.7.egg
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); sys.path[p:p]=new; sys.__egginsert = p+len(new)


TO THIS:

cat easy-install.pth 

    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./ipython-0.10.1-py2.7.egg
    ./readline-6.1.0-py2.7-linux-x86_64.egg
    /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2
    ./boto-1.9b-py2.7.egg
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); s\
    ys.path[p:p]=new; sys.__egginsert = p+len(new)



DISABLED DEBUGGING IN dev/0.91.2/starcluster IN FAVOUR OF USING CURRENT DEV IN

emacs easy-install.pth 

CHANGED THIS:

    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./ipython-0.10.1-py2.7.egg
    ./readline-6.1.0-py2.7-linux-x86_64.egg
    /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2
    ./boto-1.9b-py2.7.egg
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); s\
    ys.path[p:p]=new; sys.__egginsert = p+len(new)


TO THIS:

    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./ipython-0.10.1-py2.7.egg
    ./readline-6.1.0-py2.7-linux-x86_64.egg
    ./StarCluster-0.91.2-py2.7.egg
    ./boto-1.9b-py2.7.egg
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); s\
    ys.path[p:p]=new; sys.__egginsert = p+len(new)




INSTALL BOTO 2.0b3
------------------

1. DOWNLOAD BOTO 2.0b3

mkdir -p /root/base/apps/starcluster/dev/0.91.2/dependencies/boto/2.0b3
cd /root/base/apps/starcluster/dev/0.91.2/dependencies/boto/2.0b3
wget http://boto.googlecode.com/files/boto-2.0b3.tar.gz
cd /root/base/apps/starcluster/dev/0.91.2/dependencies/boto/2.0b3/boto-2.0b3

python setup.py install
    
    ...
    creating dist
    creating 'dist/boto-2.0b3-py2.7.egg' and adding 'build/bdist.linux-x86_64/egg' to it
    removing 'build/bdist.linux-x86_64/egg' (and everything under it)
    Creating /usr/local/lib/python2.7/site-packages/site.py
    Processing boto-2.0b3-py2.7.egg
    removing '/usr/local/lib/python2.7/site-packages/boto-2.0b3-py2.7.egg' (and everything under it)
    Copying boto-2.0b3-py2.7.egg to /usr/local/lib/python2.7/site-packages
    Removing boto 1.9b from easy-install.pth file
    Adding boto 2.0b3 to easy-install.pth file
    Installing cfadmin script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing cq script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing lss3 script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing launch_instance script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing pyami_sendmail script to /usr/local/bin
    Installing kill_instance script to /usr/local/bin
    Installing bundle_image script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/boto-2.0b3-py2.7.egg
    Processing dependencies for boto==2.0b3
    Finished processing dependencies for boto==2.0b3

rerun:
    
    removing 'build/bdist.linux-x86_64/egg' (and everything under it)
    Processing boto-2.0b3-py2.7.egg
    Removing /usr/local/lib/python2.7/site-packages/boto-2.0b3-py2.7.egg
    Copying boto-2.0b3-py2.7.egg to /usr/local/lib/python2.7/site-packages
    Adding boto 2.0b3 to easy-install.pth file <======= CHANGED easy-install.pth
    Installing cfadmin script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing cq script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing lss3 script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing launch_instance script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing pyami_sendmail script to /usr/local/bin
    Installing kill_instance script to /usr/local/bin
    Installing bundle_image script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/boto-2.0b3-py2.7.egg
    Processing dependencies for boto==2.0b3
    Finished processing dependencies for boto==2.0b3


WHICH CHANGED THIS:

cat easy-install.pth 

    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./ipython-0.10.1-py2.7.egg
    ./readline-6.1.0-py2.7-linux-x86_64.egg
    /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2
    ./boto-1.9b-py2.7.egg
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); s\
    ys.path[p:p]=new; sys.__egginsert = p+len(new)


TO THIS:

cat easy-install.pth 

    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./ipython-0.10.1-py2.7.egg
    ./readline-6.1.0-py2.7-linux-x86_64.egg
    /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2
    ./boto-2.0b3-py2.7.egg      <====== CHANGED HERE
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); s\
    ys.path[p:p]=new; sys.__egginsert = p+len(new)



RAN cli.py BUT GET THE SAME ERROR REGARDLESS OF WHETHER UNZIPPED BOTO 2.0b3 EGG:

python cli.py -d -c /root/.starcluster/config start physicscluster

    ---------------------------------------------------------------------------
    AttributeError                            Traceback (most recent call last)
    
    /root/base/apps/starcluster/0.91.2/build/lib/starcluster/cli.py in < module>()
         36 
         37 from boto.exception import EC2ResponseError, S3ResponseError
    ---> 38 from starcluster import cluster
         39 from starcluster import node
         40 from starcluster import config
    
    /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2/starcluster/cluster.pyc in < module>()
         10 
         11 from starcluster import ssh
    ---> 12 from starcluster import awsutils
         13 from starcluster import clustersetup
         14 from starcluster import static
    
    /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2/starcluster/awsutils.pyc in < module>()
        529                        if c in string.printable])
        530 
    --> 531 class EasyS3(EasyAWS):
        532     DefaultHost = 's3.amazonaws.com'
        533     _calling_format=boto.s3.connection.OrdinaryCallingFormat()
    
    /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2/starcluster/awsutils.pyc in EasyS3()
        531 class EasyS3(EasyAWS):
        532     DefaultHost = 's3.amazonaws.com'
    --> 533     _calling_format=boto.s3.connection.OrdinaryCallingFormat()
        534     def __init__(self, aws_access_key_id, aws_secret_access_key,  
        535                  aws_s3_path='/', aws_port=None, aws_is_secure=True,
    
    AttributeError: 'module' object has no attribute 'connection'


CHANGED easy-install.pth BACK:

cd /usr/local/lib/python2.7/site-packages
emacs easy-install.pth 

FROM THIS:

    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./ipython-0.10.1-py2.7.egg
    ./readline-6.1.0-py2.7-linux-x86_64.egg
    /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2
    ./boto-2.0b3-py2.7.egg      < ====== CHANGED HERE
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); s\
    ys.path[p:p]=new; sys.__egginsert = p+len(new)



TO THIS:

    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./ipython-0.10.1-py2.7.egg
    ./readline-6.1.0-py2.7-linux-x86_64.egg
    /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2
    ./boto-1.9b-py2.7.egg
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); s\
    ys.path[p:p]=new; sys.__egginsert = p+len(new)





REINSTALL DEV 0.91.2
--------------------








INSTALL DEV 0.91.2
------------------

1. UNINSTALL STARCLUSTER (remove the egg from site-packages)

cd /usr/local/lib/python2.7/site-packages
mv StarCluster-0.91.2-py2.7.egg StarCluster-0.91.2-py2.7.egg.new


2. DOWNLOAD STARCLUSTER 0.91.2, UNPACK AND RUN python setup.py develop
This will 'link' the unzipped source to your python
install. This means if you make changes to the source code, you will be
able to import and see/use those changes without having to reinstall.


mkdir -p /root/base/apps/starcluster/dev/0.91.2
cd /root/base/apps/starcluster/dev/0.91.2
wget http://web.mit.edu/stardev/media/uploads/cluster/downloads/starcluster-0.91.2.tar.gz
python setup.py develop

    running develop
    running egg_info
    writing requirements to StarCluster.egg-info/requires.txt
    writing StarCluster.egg-info/PKG-INFO
    writing top-level names to StarCluster.egg-info/top_level.txt
    writing dependency_links to StarCluster.egg-info/dependency_links.txt
    reading manifest file 'StarCluster.egg-info/SOURCES.txt'
    reading manifest template 'MANIFEST.in'
    writing manifest file 'StarCluster.egg-info/SOURCES.txt'
    running build_ext
    Creating /usr/local/lib/python2.7/site-packages/StarCluster.egg-link (link to .)
    Adding StarCluster 0.91.2 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Installed /root/base/apps/starcluster/dev/0.91.2/StarCluster-0.91.2
    Processing dependencies for StarCluster==0.91.2
    Searching for boto==1.9b
    Reading http://pypi.python.org/simple/boto/
    Reading http://code.google.com/p/boto/
    Reading http://code.google.com/p/boto
    Best match: boto 1.9b
    Downloading http://boto.googlecode.com/files/boto-1.9b.tar.gz
    Processing boto-1.9b.tar.gz
    Running boto-1.9b/setup.py -q bdist_egg --dist-dir /tmp/easy_install-Trpip5/boto-1.9b/egg-dist-tmp-sdKQxq
    zip_safe flag not set; analyzing archive contents...
    boto.s3.__init__: module references __path__
    boto.sqs.__init__: module references __path__
    Removing boto 2.0b3 from easy-install.pth file
    Adding boto 1.9b to easy-install.pth file
    Installing launch_instance script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/boto-1.9b-py2.7.egg
    Searching for paramiko==1.7.6
    Best match: paramiko 1.7.6
    Processing paramiko-1.7.6-py2.7.egg
    paramiko 1.7.6 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.7/site-packages/paramiko-1.7.6-py2.7.egg
    Searching for pycrypto==2.3
    Best match: pycrypto 2.3
    Processing pycrypto-2.3-py2.7-linux-x86_64.egg
    pycrypto 2.3 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.7/site-packages/pycrypto-2.3-py2.7-linux-x86_64.egg
    Finished processing dependencies for StarCluster==0.91.2










import base64,hashlib,hmac,time
from urllib import urlencode
 
AWS_ACCESS_KEY_ID = "Your Access Key ID"
AWS_SECRET_ACCESS_KEY = "Your Secret Key"
 
base_url = "http://ecs.amazonaws.com/onca/xml"
url_params = {'Operation':"ItemSearch",'Service':"AWSECommerceService",
 'AWSAccessKeyId':AWS_ACCESS_KEY_ID,'AssociateTag':"yourtag-10",
 'Version':"2006-09-11",'Availability':"Available",'Condition':"All",
 'ItemPage':"1",'ResponseGroup':"Images,ItemAttributes,EditorialReview",
 'Keywords':"Amazon"}
 
# Add a ISO 8601 compliant timestamp (in GMT)
url_params['Timestamp'] = time.strftime("%Y-%m-%dT%H:%M:%S", time.gmtime())
 
# Sort the URL parameters by key
keys = url_params.keys()
keys.sort()
# Get the values in the same order of the sorted keys
values = map(url_params.get, keys)
 
# Reconstruct the URL paramters and encode them
url_string = urlencode( zip(keys,values) )
url_string = url_string.replace('+'," ") 
url_string = url_string.replace(':',":") 
 
#Construct the string to sign
string_to_sign = """GET
ecs.amazonaws.com
/onca/xml
%s""" % url_string
 
# Sign the request
signature = hmac.new(
    key=AWS_SECRET_ACCESS_KEY,
    msg=string_to_sign,
    digestmod=hashlib.sha256).digest()
 
# Base64 encode the signature
signature = base64.encodestring( signature )
 
# Make the signature URL safe
signature = signature.replace('+','+')
signature = signature.replace('=','=')
url_string += "&Signature;=%s" % signature
print "%s?%s" % (base_url,url_string)




















    

starcluster shell
-----------------

1. COPIED dumper.py TO LOCAL starcluster INSTALLATION DIR:

cd /root/base/apps/starcluster/0.91.2/build/lib/dumper.py


2. SET ENVIRONMENT VARIABLES

export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib/:/usr/local/lib/python2.7/:/usr/local/lib/python2.7/site-packages
export PYTHONHOME=/usr/local


3. RUN starcluster LOCALLY TO DUMP cfg OBJECT

cd /root/base/apps/starcluster/0.91.2/build/lib/starcluster

starcluster shell
import dumper
dumper.max_depth = 10           # default is 5
dumper.dump(cfg)

    
    < StarClusterConfig at 137c710: < starcluster.config.StarClusterConfig object at 0x137c710>> 
      _config: < ConfigParser at 131f908>
        object contents suppressed (instance from different module)
      aws: < AttributeDict at 13bfaa0: {'ec2_private_key': '/agua/home/admin/.keypairs/private.pem', 'aws_secret_access_key': '4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6', 'ec2_cert': '/agua/home/admin/.keypairs/public.pem', '__name__': 'aws info', 'aws_access_key_id': 'AKIAIZXZ6S7ARZ44TTHQ', 'aws_user_id': '728213020069'}>
        object contents suppressed (instance from different module)
      cache: < bool at 0x787990>: False
      cfg_file: None
      clusters: < AttributeDict at 13bfbd0: {'smallcluster': {'cluster_size': 2, 'availability_zone': None, 'master_image_id': None, 'key_location': '/agua/home/admin/.keypairs/id_rsa-starcluster-1', 'node_instance_type': 'm1.small', 'plugins': [], '__name__': 'cluster smallcluster', 'cluster_shell': 'bash', 'master_instance_type': None, 'cluster_user': 'sgeadmin', 'keyname': 'starcluster-1', 'extends': None, 'volumes': [], 'node_image_id': 'ami-d1c42db8'}}>
        object contents suppressed (instance from different module)
      globals: < AttributeDict at 13bf970: {'default_template': 'smallcluster', '__name__': 'global', 'enable_experimental': False}>
        object contents suppressed (instance from different module)
      keys: < AttributeDict at 13c0010: {'starcluster-1': {'__name__': 'key starcluster-1', 'key_location': '/agua/home/admin/.keypairs/id_rsa-starcluster-1'}}>
        object contents suppressed (instance from different module)
      plugins: < AttributeDict at 13c0270: {}>
        object contents suppressed (instance from different module)
      type_validators: < dictionary at 0x13bf850>
        < type 'int'>: < instancemethod at 1301f50: < bound method StarClusterConfig._get_int of < starcluster.config.StarClusterConfig object at 0x137c710>>>
          object contents suppressed (instance from different module)
        < type 'str'>: < instancemethod at 13130a0: < bound method StarClusterConfig._get_string of < starcluster.config.StarClusterConfig object at 0x137c710>>>
          object contents suppressed (instance from different module)
        < type 'bool'>: < instancemethod at 1301fa0: < bound method StarClusterConfig._get_bool of < starcluster.config.StarClusterConfig object at 0x137c710>>>
          object contents suppressed (instance from different module)
      vols: < AttributeDict at 13c0140: {}>
        object contents suppressed (instance from different module)        
    


NB: CAN RUN cli.main() FROM SHELL
---------------------------------
cli.main()

    HERE
    '1'
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Importing module config
    >>> Importing module cli
    >>> Importing module awsutils
    >>> Importing module ssh
    >>> Importing module utils
    >>> Importing module static
    >>> Importing module exception
    >>> Importing module cluster
    >>> Importing module node
    >>> Importing module clustersetup
    >>> Importing module image
    >>> Importing module volume
    >>> Importing module tests
    >>> Importing module templates
    >>> Importing module optcomplete






















N0TES
-----


TEST COMMANDS
-------------

starcluster -d listpublic
-------------------------

starcluster -d listpublic

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    config.py:281 - DEBUG - Loading config
    config.py:99 - DEBUG - Loading file: /root/.starcluster/config
    awsutils.py:47 - DEBUG - creating self._conn w/ connection_authenticator kwargs = {'path': '/', 'region': None, 'port': None, 'is_secure': True}
    cli.py:1083 - ERROR - SignatureDoesNotMatch: The request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.


WHICH REFERS TO awsutils.py LINE 47:

    def reload(self):
        self._conn = None
        return self.conn

    @property
    def conn(self):
        if self._conn is None:
            log.debug('creating self._conn w/ connection_authenticator ' +
                      'kwargs = %s' % self._kwargs)
            self._conn = self.connection_authenticator(
                self.aws_access_key_id, self.aws_secret_access_key,
                **self._kwargs)
        return self._conn



starcluster shell
-----------------


WARNING: Readline services not available on this platform.
WARNING: The auto-indent feature requires the readline library
StarCluster - (http://web.mit.edu/starcluster)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

>>> Importing module config
>>> Importing module cli
>>> Importing module awsutils
>>> Importing module ssh
>>> Importing module utils
>>> Importing module static
>>> Importing module exception
>>> Importing module cluster
>>> Importing module node
>>> Importing module clustersetup
>>> Importing module image
>>> Importing module volume
>>> Importing module tests
>>> Importing module templates
>>> Importing module optcomplete


import pprint
pp = pprint.PrettyPrinter(indent=4)
pp.pprint(ec2)
< starcluster.awsutils.EasyEC2 object at 0x915390>





TRIED TO USE BOTO 2.0b3 BUT DIDN'T WORK
----------------------------------------


ZIPPED THE boto-1.9 EGG BUT NOW CAN'T FIND BOTO:

../../../bin/starcluster -d listpublic

    Traceback (most recent call last):
      File "../../../bin/starcluster", line 2, in < module>
        from starcluster import cli
      File "/root/base/apps/starcluster/0.91.2/build/lib/starcluster/cli.py", line 37, in < module>
        from boto.exception import EC2ResponseError, S3ResponseError
    ImportError: No module named boto.exception
    

SO UNZIPPED BOTO 1.9 EGG AND NOW OKAY:
   
../../../bin/starcluster -d listpublic

    HERE
    '1'
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    config.py:281 - DEBUG - Loading config
    config.py:99 - DEBUG - Loading file: /root/.starcluster/config
    awsutils.conn   self.conn()
    awsutils.conn   self.aws_access_key:  AKIAIZXZ6S7ARZ44TTHQ
    awsutils.conn   self.aws_secret_access_key:  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
    awsutils.py:53 - DEBUG - creating self._conn w/ connection_authenticator kwargs = {'path': '/', 'region': None, 'port': None, 'is_secure': True}
    awsutils.conn    Doing self._conn = self.connection_authenticator()
    awsutils.conn    self.connection_authenticator:  < function connect_ec2 at 0x2aaaaf50ac80>
    awsutils.conn    Returning...
    cli.py:1100 - ERROR - SignatureDoesNotMatch: The request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.


IT APPEARS THAT BOTO-1.9 IS THE VERSION THAT IS INSTALLED:

/usr/local/lib/python2.7/site-packages

cat easy-install.pth 

    import sys; sys.__plen = len(sys.path)
    ./setuptools-0.6c11-py2.7.egg
    ./paramiko-1.7.6-py2.7.egg
    ./pycrypto-2.3-py2.7-linux-x86_64.egg
    ./boto-1.9b-py2.7.egg
    ./StarCluster-0.91.2-py2.7.egg
    ./ipython-0.10.1-py2.7.egg
    ./readline-6.1.0-py2.7-linux-x86_64.egg
    import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); sys.path[p:p]=new; sys.__egginsert = p+len(new)


CHANGE THIS TO BOTO 2.0b3:


emacs easy-install.pth 

CHANGE THIS:

import sys; sys.__plen = len(sys.path)
./setuptools-0.6c11-py2.7.egg
./paramiko-1.7.6-py2.7.egg
./pycrypto-2.3-py2.7-linux-x86_64.egg
./boto-1.9b-py2.7.egg
./StarCluster-0.91.2-py2.7.egg
./ipython-0.10.1-py2.7.egg
./readline-6.1.0-py2.7-linux-x86_64.egg
import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); sys.path[p:p]=new; sys.__egginsert = p+len(new)


TO THIS:

import sys; sys.__plen = len(sys.path)
./setuptools-0.6c11-py2.7.egg
./paramiko-1.7.6-py2.7.egg
./pycrypto-2.3-py2.7-linux-x86_64.egg
./boto-2.0b3-py2.7.egg
./StarCluster-0.91.2-py2.7.egg
./ipython-0.10.1-py2.7.egg
./readline-6.1.0-py2.7-linux-x86_64.egg
import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); sys.path[p:p]=new; sys.__egginsert = p+len(new)


BUT THEN GOT THIS ERROR SO CHANGED IT BACK TO BOTO 1.9:

../../../bin/starcluster -d listpublic
    ---------------------------------------------------------------------------
    AttributeError                            Traceback (most recent call last)
    
    /root/base/apps/starcluster/0.91.2/bin/starcluster in < module>()
          1 
    ----> 2 #!/usr/bin/env python
    
          3 from starcluster import cli
          4 
          5 if __name__ == '__main__':
          6     try:
    
    /root/base/apps/starcluster/0.91.2/build/lib/starcluster/cli.pyc in < module>()
         36 
         37 from boto.exception import EC2ResponseError, S3ResponseError
    ---> 38 from starcluster import cluster
         39 from starcluster import node
         40 from starcluster import config
    
    /root/base/apps/starcluster/0.91.2/build/lib/starcluster/cluster.pyc in < module>()
         10 
         11 from starcluster import ssh
    ---> 12 from starcluster import awsutils
         13 from starcluster import clustersetup
         14 from starcluster import static
    
    /root/base/apps/starcluster/0.91.2/build/lib/starcluster/awsutils.pyc in < module>()
        571                        if c in string.printable])
        572 
    --> 573 class EasyS3(EasyAWS):
        574     DefaultHost = 's3.amazonaws.com'
        575     _calling_format=boto.s3.connection.OrdinaryCallingFormat()
    
    /root/base/apps/starcluster/0.91.2/build/lib/starcluster/awsutils.pyc in EasyS3()
        573 class EasyS3(EasyAWS):
        574     DefaultHost = 's3.amazonaws.com'
    --> 575     _calling_format=boto.s3.connection.OrdinaryCallingFormat()
        576     def __init__(self, aws_access_key_id, aws_secret_access_key,  
        577                  aws_s3_path='/', aws_port=None, aws_is_secure=True,









ADDED dumper.py TO STARCLUSTER LIB DIR
--------------------------------------
/root/base/apps/starcluster/0.91.2/build/lib/dumper.py





TROUBLESHOOTING RUNNING PYTHON ON LOCAL, UNZIPPED EGG
-----------------------------------------------------

USE -c ARGUMENT TO cli.py TO RUN MODULE AS SCRIPT:

cd /root/base/apps/starcluster/0.91.2/build/lib/starcluster
python cli.py -d -c /root/.starcluster/config start physicscluster


NB: NEED TO FIRST SET PYTHONPATH AND PYTHONHOME:

export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib/:/usr/local/lib/python2.7/:/usr/local/lib/python2.7/site-packages
export PYTHONHOME=/usr/local





6.1.1. Executing modules as scripts¶
http://docs.python.org/tutorial/modules.html

When you run a Python module with

python fibo.py < arguments>

the code in the module will be executed, just as if you imported it, but with the __name__ set to "__main__". That means that by adding this code at the end of your module:

if __name__ == "__main__":
    import sys
    fib(int(sys.argv[1]))
you can make the file usable as a script as well as an importable module, because the code that parses the command line only runs if the module is executed as the “main” file:

$ python fibo.py 50
1 1 2 3 5 8 13 21 34
If the module is imported, the code is not run:

>>> import fibo
>>>
This is often used either to provide a convenient user interface to a module, or for testing purposes (running the module as a script executes a test suite).



PROBLEM: MISSING starcluster

cd /root/base/apps/starcluster/0.91.2/build/lib/starcluster

python cli.py \
-c /root/.starcluster/config \
start physicscluster
    
    Traceback (most recent call last):
      File "cli.py", line 21, in < module>
        from starcluster import __version__
    ImportError: No module named starcluster

SOLUTION:

ADD PATH TO starcluster/lib INTO PYTHONPATH:

export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib/:/usr/local/lib/python2.7/:/usr/local/lib/python2.7/site-packages



PROBLEM: MISSING site

export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib/starcluster
export PYTHONHOME=/root/base/apps/starcluster/0.91.2/build/lib/starcluster
cd /root/base/apps/starcluster/0.91.2/build/lib/starcluster
python cli.py -c /root/.starcluster/config start physicscluster

    ImportError: No module named site

SOLUTION:

ADD PATH TO site.py INTO PYTHONPATH:

export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib/:/usr/local/lib/python2.7/:/usr/local/lib/python2.7/site-packages




PROBLEM: MISSING os.py

NB: USE PYTHONPATH=.../lib FINDS site.py BUT NOT os.py

export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib
export PYTHONHOME=/usr/local/lib/python2.7
cd /root/base/apps/starcluster/0.91.2/build/lib/starcluster
python -S cli.py -c /root/.starcluster/config start physicscluster
    
    Traceback (most recent call last):
      File "cli.py", line 21, in < module>
        from starcluster import __version__
      File "/root/base/apps/starcluster/0.91.2/build/lib/starcluster/__init__.py", line 21, in < module>
        from starcluster import static 
      File "/root/base/apps/starcluster/0.91.2/build/lib/starcluster/static.py", line 5, in < module>
        import os
    ImportError: No module named os


SOLUTION:

ADD PATH TO os.py (/usr/local/lib/python2.7) INTO PYTHONPATH:

export PYTHONPATH=/root/base/apps/starcluster/0.91.2/build/lib/:/usr/local/lib/python2.7/:/usr/local/lib/python2.7/site-packages




INSTALLED ipython
-----------------

DISCOVERED ipython WAS NOT INSTALLED BY USING starcluster shell
http://web.mit.edu/stardev/cluster/docs/plugins.html#creating-a-new-plugin

Using the Development Shell
To launch StarCluster’s development shell, use the shell command
    
    $ starcluster shell
    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Importing module config
    >>> Importing module plugins
    >>> Importing module cli
    >>> Importing module awsutils
    >>> Importing module ssh
    >>> Importing module utils
    >>> Importing module static
    >>> Importing module exception
    >>> Importing module cluster
    >>> Importing module node
    >>> Importing module clustersetup
    >>> Importing module image
    >>> Importing module volume
    >>> Importing module tests
    >>> Importing module templates
    >>> Importing module optcomplete
    >>> Importing module boto
    >>> Importing module paramiko
    
    [~]|1>
    This launches you into an IPython shell with all of the StarCluster modules automatically loaded. You’ll also notice that you have the following variables available to you automagically:
    
    ec2 - object for interacting with EC2 (starcluster.awsutils.EasyEC2)
    s3 - object for interacting with S3 (starcluster.awsutils.EasyS3)
    cfg - object for retrieving values from the config file (starcluster.config.StarClusterConfig)



starcluster shell

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Importing module config
    >>> Importing module cli
    >>> Importing module awsutils
    >>> Importing module ssh
    >>> Importing module utils
    >>> Importing module static
    >>> Importing module exception
    >>> Importing module cluster
    >>> Importing module node
    >>> Importing module clustersetup
    >>> Importing module image
    >>> Importing module volume
    >>> Importing module tests
    >>> Importing module templates
    >>> Importing module optcomplete


import pprint
pp = pprint.PrettyPrinter(indent=4)
pp.pprint(cfg)

    < starcluster.config.StarClusterConfig object at 0x905350>




INSTALLED ipython WITH easy_install TO AVOID THIS ERROR:

starcluster shell
    ...
    >>> Importing module tests
    >>> Importing module templates
    >>> Importing module optcomplete
    utils.py:146 - ERROR - Unable to load IPython.
    utils.py:147 - ERROR - Please check that IPython is installed and working.
    utils.py:148 - ERROR - If not, you can install it via: easy_install ipython


easy_install ipython

    Searching for ipython
    Reading http://pypi.python.org/simple/ipython/
    Reading http://ipython.scipy.org
    Reading http://ipython.scipy.org/dist/0.10
    Reading http://ipython.scipy.org/dist/0.9.1
    Reading http://ipython.scipy.org/dist/0.8.4
    Reading http://ipython.scipy.org/dist/old/0.9
    Reading http://ipython.scipy.org/dist
    Best match: ipython 0.10.1
    Downloading http://ipython.scipy.org/dist/ipython-0.10.1.zip
    Processing ipython-0.10.1.zip
    Running ipython-0.10.1/setup.py -q bdist_egg --dist-dir /tmp/easy_install-CYGvLj/ipython-0.10.1/egg-dist-tmp-gNOzhh
    Adding ipython 0.10.1 to easy-install.pth file
    Installing iptest script to /usr/local/bin
    Installing ipythonx script to /usr/local/bin
    Installing ipcluster script to /usr/local/bin
    Installing ipython script to /usr/local/bin
    Installing pycolor script to /usr/local/bin
    Installing ipcontroller script to /usr/local/bin
    Installing ipengine script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/ipython-0.10.1-py2.7.egg
    Processing dependencies for ipython
    Finished processing dependencies for ipython




THEN RAN starcluster listpublic:


starcluster listpublic

    **********************************************************************
    Welcome to IPython. I will try to create a personal configuration directory
    where you can customize many aspects of IPython's functionality in:
    
    /root/.ipython
    Initializing from configuration: /usr/local/lib/python2.7/site-packages/ipython-0.10.1-py2.7.egg/IPython/UserConfig
    
    Successful installation!
    
    Please read the sections 'Initial Configuration' and 'Quick Tips' in the
    IPython manual (there are both HTML and PDF versions supplied with the
    distribution) to make sure that your system environment is properly configured
    to take advantage of IPython's features.
    
    Important note: the configuration system has changed! The old system is
    still in place, but its setting may be partly overridden by the settings in 
    "~/.ipython/ipy_user_conf.py" config file. Please take a look at the file 
    if some of the new settings bother you. 
    
    
    Please press <  RETURN> to start IPython.
    **********************************************************************
    WARNING: Readline services not available on this platform.
    WARNING: The auto-indent feature requires the readline library
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    cli.py:1083 - ERROR - SignatureDoesNotMatch: The request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.


NOTE: SUBSEQUENNT CALLS OF listpublic DON'T SHOW THE IPYTHON STARTUP INFO BUT STILL GIVE THE SAME SignatureDoesNotMatch ERROR:

starcluster listpublic

    WARNING: Readline services not available on this platform.
    WARNING: The auto-indent feature requires the readline library
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    cli.py:1083 - ERROR - SignatureDoesNotMatch: The request signature we calculated does not match the signature you provided. Check your AWS Secret Access Key and signing method. Consult the service documentation for details.



CONTENTS OF ipython CONFIG FILE:

cat ~/.ipython/ipy_user_conf.py
""" User configuration file for IPython

This is a more flexible and safe way to configure ipython than *rc files
(ipythonrc, ipythonrc-pysh etc.)

This file is always imported on ipython startup. You can import the
ipython extensions you need here (see IPython/Extensions directory).

Feel free to edit this file to customize your ipython experience.

Note that as such this file does nothing, for backwards compatibility.
Consult e.g. file 'ipy_profile_sh.py' for an example of the things 
you can do here.

See http://ipython.scipy.org/moin/IpythonExtensionApi for detailed
description on what you could do here.
"""

# Most of your config files and extensions will probably start with this import

import IPython.ipapi
ip = IPython.ipapi.get()

# You probably want to uncomment this if you did %upgrade -nolegacy
# import ipy_defaults    

import os   

def main():   

    # uncomment if you want to get ipython -p sh behaviour
    # without having to use command line switches  
    # import ipy_profile_sh

    # Configure your favourite editor?
    # Good idea e.g. for %edit os.path.isfile

    #import ipy_editors
    
    # Choose one of these:
    
    #ipy_editors.scite()
    #ipy_editors.scite('c:/opt/scite/scite.exe')
    #ipy_editors.komodo()
    #ipy_editors.idle()
    # ... or many others, try 'ipy_editors??' after import to see them
    
    # Or roll your own:
    #ipy_editors.install_editor("c:/opt/jed +$line $file")
    
    
    o = ip.options
    # An example on how to set options
    #o.autocall = 1
    o.system_verbose = 0
    
    #import_all("os sys")
    #execf('~/_ipython/ns.py')


    # -- prompt
    # A different, more compact set of prompts from the default ones, that
    # always show your current location in the filesystem:

    #o.prompt_in1 = r'\C_LightBlue[\C_LightCyan\Y2\C_LightBlue]\C_Normal\n\C_Green|\#>'
    #o.prompt_in2 = r'.\D: '
    #o.prompt_out = r'[\#] '
    
    # Try one of these color settings if you can't read the text easily
    # autoexec is a list of IPython commands to execute on startup
    #o.autoexec.append('%colors LightBG')
    #o.autoexec.append('%colors NoColor')
    #o.autoexec.append('%colors Linux')
    
    # for sane integer division that converts to float (1/2 == 0.5)
    #o.autoexec.append('from __future__ import division')
    
    # For %tasks and %kill
    #import jobctrl 
    
    # For autoreloading of modules (%autoreload, %aimport)    
    #import ipy_autoreload
    
    # For winpdb support (%wdb)
    #import ipy_winpdb
    
    # For bzr completer, requires bzrlib (the python installation of bzr)
    #ip.load('ipy_bzr')
    
    # Tab completer that is not quite so picky (i.e. 
    # "foo".<  TAB> and str(2).<  TAB> will work). Complete 
    # at your own risk!
    #import ipy_greedycompleter
    
    # If you are on Linux, you may be annoyed by
    # "Display all N possibilities? (y or n)" on tab completion,
    # as well as the paging through "more". Uncomment the following
    # lines to disable that behaviour
    #import readline
    #readline.parse_and_bind('set completion-query-items 1000')
    #readline.parse_and_bind('set page-completions no')


# some config helper functions you can use 
def import_all(modules):
    """ Usage: import_all("os sys") """ 
    for m in modules.split():
        ip.ex("from %s import *" % m)

def execf(fname):
    """ Execute a file in user namespace """
    ip.ex('execfile("%s")' % os.path.expanduser(fname))

main()



NOW starcluster shell WORKS:

WARNING: Readline services not available on this platform.
WARNING: The auto-indent feature requires the readline library
StarCluster - (http://web.mit.edu/starcluster)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

>>> Importing module config
>>> Importing module cli
>>> Importing module awsutils
>>> Importing module ssh
>>> Importing module utils
>>> Importing module static
>>> Importing module exception
>>> Importing module cluster
>>> Importing module node
>>> Importing module clustersetup
>>> Importing module image
>>> Importing module volume
>>> Importing module tests
>>> Importing module templates
>>> Importing module optcomplete


import pprint
pp = pprint.PrettyPrinter(indent=4)
pp.pprint(ec2)
<  starcluster.awsutils.EasyEC2 object at 0x915390>




INSTALLED readline
------------------

TO AVOID 'WARNING: Readline services not available' MESSAGE ON starcluster shell, INSTALLED readline WITH easy_install:

FIRST INSTALLED NCURSES DEPENDENCY FOR readline USING YUM:

yum install ncurses-devel

    ...
    Installed:
      ncurses-devel.i386 0:5.5-24.20060715             ncurses-devel.x86_64 0:5.5-24.20060715    Complete!


THEN INSTALLED readline:

easy_install readline

    Searching for readline
    Reading http://pypi.python.org/simple/readline/
    Reading http://www.python.org/
    Reading http://github.com/ludwigschwardt/python-readline
    Best match: readline 6.1.0
    Downloading http://pypi.python.org/packages/source/r/readline/readline-6.1.0.tar.gz#md5=1456828f863e05a4a47c2d89823cdc4e
    Processing readline-6.1.0.tar.gz
    Running readline-6.1.0/setup.py -q bdist_egg --dist-dir /tmp/easy_install-73JTOy/readline-6.1.0/egg-dist-tmp-FSQ1R0
    Adding readline 6.1.0 to easy-install.pth file
    
    Installed /usr/local/lib/python2.7/site-packages/readline-6.1.0-py2.7-linux-x86_64.egg
    Processing dependencies for readline
    Finished processing dependencies for readline



















cd /usr/local/lib/python2.7/site-packages
python 

    Python 2.7 (r27:82500, Dec 18 2010, 00:24:27) 
    [GCC 4.1.2 20080704 (Red Hat 4.1.2-46)] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import starcluster;
    >>> dir(starcluster);
    ['__all__', '__author__', '__builtins__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__path__', '__version__', 'static', 'sys']




DOWNLOADED LATEST JTRILEY CODE
------------------------------
http://github.com/jtriley/StarCluster/zipball/master






INSTALLED LATEST VERSION USING GIT
----------------------------------


This method requires that you have git installed on your machine. If you’re unsure, either use the latest development snapshot as described above, or install the latest stable version from pypi.

mkdir -p /root/base/apps/starcluster/git
cd /root/base/apps/starcluster/git


$ git clone git://github.com/jtriley/StarCluster.git
$ cd StarCluster
$ sudo python ez_setup.py install
$ sudo python setup.py installInstall development version using git
This method requires that you have git installed on your machine. If you’re unsure, either use the latest development snapshot as described above, or install the latest stable version from pypi.

$ git clone git://github.com/jtriley/StarCluster.git
$ cd StarCluster
$ sudo python ez_setup.py install
$ sudo python setup.py install




NOTES
-----

PROBLEM:


starcluster start physicscluster

>>> Using default cluster template: smallcluster
>>> Validating cluster template settings...
cluster.py:766 - ERROR - Invalid AWS_ACCESS_KEY_ID/AWS_SECRET_ACCESS_KEY combination.
cli.py:243 - ERROR - settings for cluster template "smallcluster" are not valid


PROBLEM:

starcluster start physicscluster

    AttributeError: 'module' object has no attribute 'HTTPSConnection'


DIAGNOSIS:

SSL SUPPORT IS NOT ENABLED FOR PYTHON

python

    Python 2.7 (r27:82500, Oct 25 2010, 00:54:19) 
    [GCC 4.1.2 20080704 (Red Hat 4.1.2-46)] on linux2
    Type "help", "copyright", "credits" or "license" for more information.

    >>> import socket 

    >>> socket.ssl

    Traceback (most recent call last):
      File "<  stdin>", line 1, in <  module>
    AttributeError: 'module' object has no attribute 'ssl'


SOLUTION:

ENABlE SSL SUPPORT FOR PYTHON
http://agiletesting.blogspot.com/2008/05/compiling-python-25-with-ssl-support.html


1. edited Modules/Setup.dist from the Python 2.5.2 source distribution and made sure the correct lines were put back in (they were commented out by default):

    _socket socketmodule.c
    
    # Socket module helper for SSL support; you must comment out the other
    # socket line above, and possibly edit the SSL variable:
    #SSL=/usr/local/ssl
    _ssl _ssl.c \
    -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \
    -L$(SSL)/lib -lssl -lcrypto


I.E., CHANGE THIS:

emacs /software/python/2.7/Modules/Setup.dist

# Socket module helper for socket(2)
#_socket socketmodule.c

# Socket module helper for SSL support; you must comment out the other
# socket line above, and possibly edit the SSL variable:
#SSL=/usr/local/ssl
#_ssl _ssl.c \
#       -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \
#       -L$(SSL)/lib -lssl -lcrypto


TO THIS:

emacs /software/python/2.7/Modules/Setup.dist

# Socket module helper for socket(2)
_socket socketmodule.c

# Socket module helper for SSL support; you must comment out the other
# socket line above, and possibly edit the SSL variable:
#SSL=/usr/local/ssl
_ssl _ssl.c \
       -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \
       -L$(SSL)/lib -lssl -lcrypto



2) RUN configure AND INSTALL

./configure; make; make install

    ...
    changing mode of /usr/local/bin/idle to 755
    running install_egg_info
    Removing /usr/local/lib/python2.7/lib-dynload/Python-2.7-py2.7.egg-info
    Writing /usr/local/lib/python2.7/lib-dynload/Python-2.7-py2.7.egg-info
    if test -f /usr/local/bin/python -o -h /usr/local/bin/python; \
            then rm -f /usr/local/bin/python; \
            else true; \
            fi
    (cd /usr/local/bin; ln python2.7 python)
    rm -f /usr/local/bin/python-config
    (cd /usr/local/bin; ln -s python2.7-config python-config)
    test -d /usr/local/lib/pkgconfig || /usr/bin/install -c -d -m 755 /usr/local/lib/pkgconfig
    rm -f /usr/local/lib/pkgconfig/python.pc
    (cd /usr/local/lib/pkgconfig; ln -s python-2.7.pc python.pc)
    /usr/bin/install -c -m 644 ./Misc/python.man \
                    /usr/local/share/man/man1/python2.7.1
                    
                    
    OK
    
3) verified that I can access socket.ssl:

python

    Python 2.7 (r27:82500, Dec 18 2010, 00:24:27) 
    [GCC 4.1.2 20080704 (Red Hat 4.1.2-46)] on linux2
    Type "help", "copyright", "credits" or "license" for more information.

    >>> import socket

    >>> socket.ssl

        <  function ssl at 0x2aaaaac15050>


    OK


</entry>