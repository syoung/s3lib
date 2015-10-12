apps.ec2.archive.0


<entry [Thu Oct 21 00:53:12 EDT 2010] RECOVER EBS-BACKED INSTANCE WHEN HANGS ON SECOND START>
                    
http://www.openg.info/entry/recover-ec2-instance-created-ami-ebs-instance

Recover EC2 instance created from AMI of other EBS instance


It rebooted, then won't restart.

Forgive me if I'm short on details - still collecting them. It is an EBS image created from an AMI which was created from another EBS image.

The notes at end may provide some insight.

Is this recoverable? because it is an ebs instance, i can try to attach to it via another image, but I'd rather recover the running EBS.. and would like to understand what happened, is happening.

Any other suggestions very welcome.

Begin: Running /scripts/local-bottom ...
Done.
Done.
Begin: Running /scripts/init-bottom ...
Begin: Starting AppArmor profiles ...
chroot: cannot execute /etc/apparmor/initramfs: No such file or directory
Failure: AppArmor profiles failed to load
Done.
init: console-setup main process (2098) terminated with status 1


    %Ginit: plymouth main process (300) killed by SEGV signal

init: plymouth-splash main process (2387) terminated with status 2

cloud-init running: Sun, 25 Jul 2010 17:28:07 -0400. up 5.89 seconds
init: ureadahead-other main process (2449) terminated with status 4

swapon: /dev/sda3: swapon failed: Device or resource busy
mountall: swapon /dev/sda3 [2451] terminated with status 255
mountall: Problem activating swap: /dev/sda3
mountall: Disconnected from Plymouth
init: hwclock-save main process (2464) terminated with status 1



Looks like it was something wrong with /etc/fstab. Basically

take a snapshot of broken ebs (as precaution)
detatch broken ebs from /dev/sda1 on relevant machine
created new ebs from snapshot
attached from running server and
edited /etc/fstab detached and
reattached to original ebs instance at /dev/sda1 (aws gives error but it worked!)
By Hendler
current plan is to mount the ebs drive from a running instance and modify the /etc/fstab... ....
further, AWS support provided this link http://osdir.com/ml/ec2ubuntu/2010-05/msg00092.html



</entry>



<entry [Tue Oct 19 18:01:09 EDT 2010] START UP PREVIOUSLY SAVED EBS-BACKED AMI>



1. START UP IN AWS

EC2 Instance: i-16bd757b

    AMI ID: ami-8a2edae3	Zone: us-east-1a
    Security Groups: default	Type: t1.micro
    Status: running	Owner: 728213020069
    VPC ID: -	Subnet ID: -
    Virtualization: paravirtual	Placement Group:
    Reservation: r-9569a9ff	RAM Disk ID: ari-b31cf9da
    Platform: -	Key Pair Name: agua
    Kernel ID: aki-b51cf9dc	Monitoring: disabled
    AMI Launch Index: 0	Elastic IP: -
    Root Device: /dev/sdb	Root Device Type: ebs
    Block Devices: /dev/sdb=vol-a22a24cb:attached:2010-10-19T19:57:28.000Z:true
    Lifecycle: normal
    Public DNS: ec2-72-44-57-108.compute-1.amazonaws.com
    Private DNS: domU-12-31-38-01-C4-99.compute-1.internal
    Private IP Address: 10.253.203.103
    Launch Time: 2010-10-19 15:57 EST


2. CONNECT

ssh -i /root/base/apps/ec2/keypair/agua.pem  root@ec2-72-44-57-108.compute-1.amazonaws.com


3. CREATE DIR AND STOP INSTANCE

mkdir /data/dummy


4. RELAUNCH AND RECONNECT (NOTE NEW URL)


ssh -i /root/base/apps/ec2/keypair/agua.pem  root@ec2-184-72-175-74.compute-1.amazonaws.com

    ssh: connect to host ec2-184-72-175-74.compute-1.amazonaws.com port 22: Connection refused


4. ATTACH /data


i-16bd757b


</entry>



<entry [Mon Oct 18 18:17:17 EDT 2010] EC2 INSTANCE TYPES: MICRO IS ONLY 32-BIT AND 64-BIT INSTANCE TYPE>




http://developer.amazonwebservices.com/connect/message.jspa?messageID=198289
Re: 64bit EBS backed image on instance-type m1.small 

m1.small and c1.medium are 32-bit only, for both EBS and S3.
t1.micro is the only instance type which supports both 64-bit and 32-bit;
all other types are exclusively 32-bit or 64-bit. 


Best as I can tell, Amazon doesn't let you run anything 64-bit on a small image.  Which is a colossal pain in the ass, and means I have to maintain double the images so that I have a 32-bit image to run on m1.smalls and c1.mediums and a 64-bit one to run on everything bigger.  So if you need a shoulder to cry on, I'm here for you. 




</entry>



<entry [Mon Oct 18 18:17:17 EDT 2010] RETRY CREATING AN EBS-BACKED AMI>



THEN LAUNCH OWN EBS-BACKED AMI AS MICRO INSTANCE AND TEST mysql AND starcluster


SUMMARY
-------

Process for Converting a Linux/UNIX Amazon S3-Backed AMI
http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/index.html?Using_BootFromEBS.html

#### SKIP THIS #### Copy the AMI's root device information to an Amazon EBS volume. How you do that is up to you.

#### START HERE #### Create a snapshot of that volume. For more information, see How to Create an Amazon EBS Snapshot.

Register the image with a block device mapping that maps the root device name of your choice to the snapshot you just created. For an example of how to register an image, see Automatically Attaching Volumes.


Another Summary
http://www.elastician.com/2009/12/creating-ebs-backed-ami-from-s3-backed.html

Install stuff, format the EBS volume as an EXT3 filesystem, mount that filesystem as /ebs and then copy the entire contents of the current root volume over to the EBS volume, then unmount the EBS volume.


PROCEDURE
---------

1. LAUNCH AN AMI INSTANCE

NOTE: THIS IS NOT AN EBS-BACKED AMI

EC2 Amazon Machine Image: ami-74b65c1d

    AMI ID: ami-74b65c1d
    Name: starcluster-centOS5-1.0
    Description: 201008111707
    Source: dvnimages/starcluster-centOS5-1.0.manifest.xml
    Owner: 076326289960	Visibility: Public	Product Code:
    State: available	Kernel ID: aki-b51cf9dc	RAM Disk ID: ari-b31cf9da
    Image Type: machine	Architecture: x86_64	Platform: Cent OS
    Root Device Type: instance-store	Root Device: /dev/sda1	Image Size: 0 bytes
    Block Devices: N/A - Instance Store
    Virtualization: paravirtual


NOTE:

Kernel ID: aki-b51cf9dc
RAM Disk ID: ari-b31cf9da


RUNNING INSTANCE:

EC2 Instance: i-56905f3b

AMI ID: ami-74b65c1d	Zone: us-east-1a
Security Groups: default	Type: m1.large
Status: running	Owner: 728213020069
VPC ID: -	Subnet ID: -
Virtualization: paravirtual	Placement Group:
Reservation: r-3591505f	RAM Disk ID: ari-b31cf9da
Platform: -	Key Pair Name: agua
Kernel ID: aki-b51cf9dc	Monitoring: disabled
AMI Launch Index: 0	Elastic IP: -
Root Device: -	Root Device Type: instance-store
Block Devices: N/A - Instance Store
Lifecycle: normal
Public DNS: ec2-184-73-144-208.compute-1.amazonaws.com
Private DNS: ip-10-122-238-218.ec2.internal
Private IP Address: 10.122.238.218
Launch Time: 2010-10-18 19:30 EST



DETACH MYSQL VOLUME IF ATTACHED TO ANYTHING ELSE

ec2-detach-volume vol-6c752005



ATTACH EBS VOLUME mysql TO EC2 INSTANCE i-56905f3b ON /dev/sdf

ec2-attach-volume vol-6c752005 -i i-56905f3b -d /dev/sdf



CONNECT

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-184-73-144-208.compute-1.amazonaws.com



MOUNT EBS VOLUME mysql

mkdir /data
mount /dev/sdf /data



3. ATTACH AN EBS VOLUME AT /dev/sdXXX
-------------------------------------

COPY OVER CREDENTIALS

mkdir -p /root/base/apps/ec2/keypair
cd /root/base/apps/ec2/keypair
scp root@173.230.142.248:/root/base/apps/ec2/keypair/*.pem ./


CREDENTIALS SUMMARY

AWS Account ID:
7282-1302-0069

Canonical User ID:
f30462040ebba8804e2f9ca67a71a93ac44015e835cf6c0f71d1710f8cbfaddb

access key id
AKIAIZXZ6S7ARZ44TTHQ

secret access key
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

aws Key Pair Name: agua
Fingerprint: 61:2d:42:13:55:92:09:bb:a9:8c:fa:17:69:29:ae:39:b5:76:d9:82

PUBLIC AND PRIVATE KEYPAIR

-k /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 
-c /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 




WRAP IT ALL UP IN THIS FILE:


emacs ~/.aws/aws.sh 
#!/bin/bash

export AMAZON_USER_ID=728213020069
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export EC2_CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export  AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
export  AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/home/ec2
export EC2_APITOOL_HOME=/home/ec2
export EC2_HOME=/home/ec2
PATH=$EC2_AMITOOL_HOME/bin:$PATH
export JAVA_HOME=/usr

chmod -R 600 ~/.aws
chmod o+x ~/.aws/aws.sh



# Change these to suit your environment
vol_size=20
dev=/dev/sdi
desc="starcluster-1-EBS"
rm -rf /usr/local/ec*


# Call the environment setup script
. ~/.aws/aws.sh


# Get basic info from instance meta-data
instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
avail_zone=`curl -s \
http://169.254.169.254/latest/meta-data/placement/availability-zone`


# Create the Volume
echo $EC2_PRIVATE_KEY
echo $EC2_CERT
vol=`ec2-create-volume -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -z "$avail_zone" --size $vol_size| cut -f2`

    ATTACHMENT      vol-6407080d    i-56905f3b      /dev/sdi        attaching       2010-10-18T23:42:50+0000

# Attach the volume
ec2attvol "$vol" -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -i "$instance_id" -d "$dev"
while [[ "$vol_status" != "attached"  ]];
do
vol_status=`ec2-describe-volumes -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" "$vol"\
| grep ATTACHMENT | cut -f5`
echo Status of "$vol" : $vol_status
done

    Status of vol-6407080d : attached




4. FORMAT EBS PARTITION
-----------------------


# Prepare the volume

mkfs.ext3 "$dev"
    
    mke2fs 1.39 (29-May-2006)
    /dev/sdi is entire device, not just one partition!
    Proceed anyway? (y,n) Y
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    2621440 inodes, 5242880 blocks
    262144 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=4294967296
    160 block groups
    32768 blocks per group, 32768 fragments per group
    16384 inodes per group
    Superblock backups stored on blocks: 
            32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
            4096000 
    
    Writing inode tables: done                            
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: ^[[Bdone
    
    This filesystem will be automatically checked every 24 mounts or
    180 days, whichever comes first.  Use tune2fs -c or -i to override.



5. MOUNT EBS PARTITION AND COPY ROOT PARTITION OVER
---------------------------------------------------

mkdir -p /vol
mount "$dev" /vol


mkdir /data/img-mnt
mount -o loop /data/image /data/img-mnt

#mount -o loop /mnt/image /mnt/img-mnt

time rsync -av /data/img-mnt/ /vol/
    building file list ...
    ...   
    var/www/icons/small/uu.png
    var/yp/
    var/yp/nicknames
    var/yp/binding/
    
    sent 3343559033 bytes  received 2165348 bytes  25442770.96 bytes/sec
    total size is 3556722238  speedup is 1.06
    
    real    2m10.939s
    user    0m8.296s
    sys     0m13.784s   


# Set the fstab up 
cat > /vol/etc/fstab << FSTABEOF
#
<file system>                                 <mount
point>   <type>  <options>       <dump> 
<pass>
proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0
/dev/sda2                                       /mnt            ext3    defaults        0       0
FSTABEOF





cat /vol/etc/fstab
   #
   <file system>                                 <mountpoint>   <type>  <options>       <dump>   <pass>
   proc                                            /proc           proc    defaults        0       0
   /dev/sda3                                       None            swap    defaults        0       0
   /dev/sdb                                       /               ext3    defaults        0       0
   /dev/sda2                                       /mnt            ext3    defaults        0       0

ll /vol
   total 104
   drwxr-xr-x  2 root root  4096 Aug 11 12:53 bin
   drwxr-xr-x  2 root root  4096 Aug 11 12:46 boot
   drwxr-xr-x  6 root root  4096 Oct 11 01:52 data
   drwxr-xr-x  2 root root  4096 Oct 11 01:53 dev
   drwxr-xr-x 84 root root  4096 Oct 11 01:53 etc
   drwxr-xr-x  4 root root  4096 Jan 26  2010 home
   drwxr-xr-x 10 root root  4096 Aug 11 12:46 lib
   drwxr-xr-x  7 root root  4096 Aug 11 12:46 lib64
   drwx------  2 root root 16384 Dec  8  2009 lost+found
   drwxr-xr-x  2 root root  4096 Mar 31  2010 misc
   drwxr-xr-x  2 root root  4096 Oct 11 01:53 mnt
   drwxr-xr-x 10 root root  4096 Aug 11 14:41 opt
   drwxr-xr-x  2 root root  4096 Oct 11 01:53 proc
   drwxr-x---  8 root root  4096 Oct 11 01:38 root
   drwxr-xr-x  2 root root 12288 Aug 11 12:46 sbin
   drwxr-xr-x  4 root root  4096 Oct 10 23:29 selinux
   drwxr-xr-x  2 root root  4096 Jan 26  2010 srv
   drwxr-xr-x  2 root root  4096 Oct 11 01:53 sys
   drwxrwxrwt  5 root root  4096 Oct 11 01:14 tmp
   drwxr-xr-x 16 root root  4096 Aug 11 12:44 usr
   drwxr-xr-x 21 root root  4096 Aug 11 12:55 var


df -a

   Filesystem           1K-blocks      Used Available Use% Mounted on
   /dev/sda1             10321208   3588196   6208724  37% /
   none                         0         0         0   -  /proc
   none                         0         0         0   -  /sys
   none                         0         0         0   -  /dev/pts
   /dev/sdb             433455904    203016 411234584   1% /mnt
   none                         0         0         0   -  /proc/sys/fs/binfmt_misc
   /dev/sdf              41284928  30213632   8974144  78% /data
   /dev/sdi              20642428   3984600  15609252  21% /vol
   /data/image           10321208   3824992   5971928  40% /data/img-mnt






6. DETACH EBS VOLUME
--------------------

umount /vol



7. CREATE SNAPSHOT
------------------

# Snapshot the volume. Note the snapshot id for the registration step
Here we are detaching the EBS volume and then creating a snapshot of that volume.  

vol=vol-6407080d

time ec2addsnap -C $EC2_CERT -K $EC2_PRIVATE_KEY -d $desc $vol

    SNAPSHOT        snap-99b47ef3   vol-6407080d    pending 2010-10-19T02:02:39+0000                728213020069    20      starcluster-1-EBS

    #SNAPSHOT        snap-b18d77db   vol-18e8e971    pending 2010-10-14T06:17:20+0000                728213020069    20      CreateEBS-backedAMI



8. REGISTER SNAPSHOT
--------------------

ec2-register -n "starcluster-2-EBS" \
-a x86_64 \
-s snap-99b47ef3 \
-b /dev/sda1=ephemeral0 \
--root-device-name /dev/sdb \
--kernel aki-b51cf9dc \
--ramdisk ari-b31cf9da


    IMAGE   ami-8a2edae3



THE NEW AMI HAS THESE CREDENTIALS ON THE AMI PAGE OF AWS CONSOLE:

    AMI ID: ami-fcdb2f95
    Name: starcluster-1-ebs
    Description: -
    Source: 728213020069/starcluster-1-ebs
    Owner: 728213020069	Visibility: Private	Product Code:
    State: available	Kernel ID: -	RAM Disk ID: -
    Image Type: machine	Architecture: i386	Platform: Other Linux
    Root Device Type: ebs	Root Device: /dev/sdb	Image Size: 20 GiB
    Block Devices: /dev/sdb=snap-b18d77db:20:true
    Virtualization: paravirtual




9. LAUNCH THE EBS-BACKED AMI AND SSH IN
---------------------------------------

Instances --> Launch Instance --> ami-fcdb2f95 --> 'micro'

EC2 Instance: i-f823ec95

    AMI ID: ami-8a2edae3	Zone: us-east-1a
    Security Groups: default	Type: t1.micro
    Status: running	Owner: 728213020069
    VPC ID: -	Subnet ID: -
    Virtualization: paravirtual	Placement Group:
    Reservation: r-a5db1acf	RAM Disk ID: ari-b31cf9da
    Platform: -	Key Pair Name: agua
    Kernel ID: aki-b51cf9dc	Monitoring: disabled
    AMI Launch Index: 0	Elastic IP: -
    Root Device: /dev/sdb	Root Device Type: ebs
    Block Devices: /dev/sdb=vol-a23f30cb:attached:2010-10-19T02:23:48.000Z:true
    Lifecycle: normal
    Public DNS: ec2-67-202-61-54.compute-1.amazonaws.com
    Private DNS: domU-12-31-38-01-D9-07.compute-1.internal
    Private IP Address: 10.253.222.245
    Launch Time: 2010-10-18 22:23 EST


SHOWS UP IN EBS VOLUMES:

Name     Volume ID	Capacity	Snapshot	Created	Zone	Status	Attachment Information
mysql    vol-6c752005	40 GiB	--	2010-08-25 16:12 EST	us-east-1a	available	
         vol-aa3e3ec3	20 GiB	snap-b18d77db	2010-10-14 14:04 EST	us-east-1d	available	xxx DELETED
         vol-18e8e971	20 GiB	--	2010-10-14 00:39 EST	us-east-1a	available	            xxx DELETED
         vol-6407080d	20 GiB	--	2010-10-18 19:42 EST	us-east-1a	available	            
         vol-a23f30cb	20 GiB	snap-99b47ef3	2010-10-18 22:23 EST	us-east-1a	in-use	i-f823ec95:/dev/sdb (attached)      <==== HERE



CONNECT

ssh -i /root/base/apps/ec2/keypair/agua.pem  root@ec2-67-202-61-54.compute-1.amazonaws.com



MOUNT mysql EBS VOLUME ON /data

mkdir /data
mount /dev/sdf /data


MAKE SURE MYSQL RUNS LOCALLY

ps aux | grep mysql

/etc/init.d/mysqld start
    
    Initializing MySQL database:  Installing MySQL system tables...
    OK
    Filling help tables...
    OK
    
    To start mysqld at boot time you have to copy
    support-files/mysql.server to the right place for your system
    
    PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
    To do so, start the server, then issue the following commands:
    /usr/bin/mysqladmin -u root password 'new-password'
    /usr/bin/mysqladmin -u root -h domU-12-31-38-01-D9-07 password 'new-password'
    
    Alternatively you can run:
    /usr/bin/mysql_secure_installation
    
    which will also give you the option of removing the test
    databases and anonymous user created by default.  This is
    strongly recommended for production servers.
    
    See the manual for more instructions.
    
    You can start the MySQL daemon with:
    cd /usr ; /usr/bin/mysqld_safe &
    
    You can test the MySQL daemon with mysql-test-run.pl
    cd mysql-test ; perl mysql-test-run.pl
    
    Please report any problems with the /usr/bin/mysqlbug script!
    
    The latest information about MySQL is available on the web at
    http://www.mysql.com
    Support MySQL by buying support/licenses at http://shop.mysql.com
    [  OK  ]
    Starting MySQL:  [  OK  ]

ps aux | grep mysql
    
    root      1371  0.0  0.2  63788  1292 pts/0    S    23:21   0:00 /bin/sh /usr/bin/mysqld_safe --datadir=/var/lib/mysql --socket=/var/lib/mysql/mysql.sock --log-error=/var/log/mysqld.log --pid-file=/var/run/mysqld/mysqld.pid --user=mysql
    mysql     1421  0.1  4.0 178308 25716 pts/0    Sl   23:21   0:00 /usr/libexec/mysqld --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/var/run/mysqld/mysqld.pid --skip-external-locking --socket=/var/lib/mysql/mysql.sock
    
    
SOCK FILE IS IN LOCAL /var/lib/mysql DIRECTORY

ll /var/lib/mysql
    
    -rw-rw---- 1 mysql mysql 10485760 Oct 18 23:21 ibdata1
    -rw-rw---- 1 mysql mysql  5242880 Oct 18 23:21 ib_logfile0
    -rw-rw---- 1 mysql mysql  5242880 Oct 18 23:21 ib_logfile1
    drwx------ 2 mysql mysql     4096 Oct 18 23:21 mysql
    srwxrwxrwx 1 mysql mysql        0 Oct 18 23:21 mysql.sock
    drwx------ 2 mysql mysql     4096 Oct 18 23:21 test


SHUTDOWN MYSQL

/etc/init.d/mysqld stop



CREATE BINDINGS TO LINK TO MYSQL ON AMI

USE bind AND mount TO MIRROR NEW LOCATIONS IN OLD FOLDERS
Point MySQL to the correct database files on the EBS volume using mount bind.


echo "/data/mysql/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
#    /data/mysql/etc/mysql /etc/mysql     none bind

mkdir /etc/mysql
mount /etc/mysql

echo "/data/mysql/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
#    /data/mysql/lib/mysql /var/lib/mysql none bind
mount /var/lib/mysql

echo "/data/mysql/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
mkdir /var/log/mysql
mount /var/log/mysql


RESTART MYSQL

/etc/init.d/mysqld start

    Starting MySQL:  [  OK  ]

ps aux | grep mysql
    
    root      1523  0.0  0.2  63788  1292 pts/0    S    23:24   0:00 /bin/sh /usr/bin/mysqld_safe --datadir=/var/lib/mysql --socket=/var/lib/mysql/mysql.sock --log-error=/var/log/mysqld.log --pid-file=/var/run/mysqld/mysqld.pid --user=mysql
    mysql     1570  0.1  3.7 188532 23988 pts/0    Sl   23:24   0:00 /usr/libexec/mysqld --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/var/run/mysqld/mysqld.pid --skip-external-locking --socket=/var/lib/mysql/mysql.sock


CHECK THAT MYSQL IS USING THE DATABASE IN /data  (YES)

mysql -u root -p

mysql> show databases;


    ...
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema | 
    | mysql              | 
    | test               | 
    | tutorial_sample    | 
    +--------------------+


10. STOP IN AWS CONSOLE
-----------------------

VERIFY STOPPED AND NOT TERMINATED

ec2-describe-instances

    RESERVATION     r-a551afcf      728213020069    default
    INSTANCE        i-e0bd468d      ami-fcdb2f95                    stopped agua    0               t1.micr2010-10-14T18:04:00+0000 us-east-1d                              monitoring-disabled                    ebs                                      paravirtual
    TAG     instance        i-e0bd468d      Name    starcluster-ebs

    RESERVATION     r-a5db1acf      728213020069    default
    INSTANCE        i-f823ec95      ami-8a2edae3                    stopped agua    0               t1.micr2010-10-19T02:23:42+0000 us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled    ebs                                      paravirtual
    BLOCKDEVICE     /dev/sdb        vol-a23f30cb    2010-10-19T02:23:48.000Z
    BLOCKDEVICE     /dev/sdf        vol-6c752005    2010-10-19T03:15:51.000Z
    TAG     instance        i-f823ec95      Name    starcluster-2-EBS



11. START IN AWS CONSOLE
------------------------

EC2 Instance: i-f823ec95

    AMI ID: ami-8a2edae3	Zone: us-east-1a
    Security Groups: default	Type: t1.micro
    Status: running	Owner: 728213020069
    VPC ID: -	Subnet ID: -
    Virtualization: paravirtual	Placement Group:
    Reservation: r-a5db1acf	RAM Disk ID: ari-b31cf9da
    Platform: -	Key Pair Name: agua
    Kernel ID: aki-b51cf9dc	Monitoring: disabled
    AMI Launch Index: 0	Elastic IP: -
    Root Device: /dev/sdb	Root Device Type: ebs
    Block Devices: /dev/sdb=vol-a23f30cb:attached:2010-10-19T02:23:48.000Z:true, /dev/sdf=vol-6c752005:attached:2010-10-19T03:15:51.000Z:false
    Lifecycle: normal
    Public DNS: ec2-184-73-148-92.compute-1.amazonaws.com
    Private DNS: domU-12-31-38-01-68-15.compute-1.internal
    Private IP Address: 10.253.111.227
    Launch Time: 2010-10-18 23:56 EST


CONNECT

ssh  -i /root/base/apps/ec2/keypair/agua.pem  root@ec2-184-73-148-92.compute-1.amazonaws.com






12. SHUT DOWN IN AWS CONSOLE AND VERIFY ON COMMAND LINE
-------------------------------------------------------

ec2-describe-instances

    RESERVATION     r-9f1fe0f5      728213020069    ngsdev
    INSTANCE        i-fc49b791      ami-74b65c1d    ec2-174-129-11-221.compute-1.amazonaws.com      domU-12-31-36-00-18-A2.z-1.compute-1.internal   shutting-down   agua    0               m1.large        2010-10-14T03:22:30+000us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     174.129.11.221  10.253.31.80   instance-store                                   paravirtual
    BLOCKDEVICE     /dev/sdi        vol-18e8e971    2010-10-14T04:40:14.000Z
    TAG     instance        i-fc49b791      Name
    RESERVATION     r-f1be409b      728213020069    default
    INSTANCE        i-e02fd68d      ami-fcdb2f95    ec2-184-73-107-173.compute-1.amazonaws.com      domU-12-31-39-10-3C-27.compute-1.internal       shutting-down   agua    0               m1.small        2010-10-14T07:45:53+000us-east-1c                               monitoring-disabled     184.73.107.173  10.198.63.213                  ebs                                      paravirtual
    BLOCKDEVICE     /dev/sdb        vol-589b9a31    2010-10-14T07:46:04.000Z






NOTES
-----

PROBLEM


LAUNCHED THE EBS-BACKED AMI:

Instances --> Launch Instance --> ami-fcdb2f95 --> 'micro'

AND CONNECTED:

ssh -i /root/base/apps/ec2/keypair/agua.pem  root@ec2-184-72-179-154.compute-1.amazonaws.com

BUT IT HANGS...



DIAGNOSIS

http://coderslike.us/2009/12/07/amazon-ec2-boot-from-ebs-and-ami-conversion/

Segedunum
December 17, 2009 at 2:55 pm
I think you missed a step in registering the snapshot. I had to make sure that I specified the kernel and ramdisk IDs that I am using. Without those I couldn’t boot my EBS snapshot.



SOLUTION

REDO WITH KERNEL AND RAMDISK IDS






</entry>



<entry [Thu Oct 14 21:11:46 EDT 2010] LAUNCH STARCLUSTER SMALL UBUNTU INSTANCE AND SAVE AS EBS-BACKED AMI>




GOT THIS ERROR WHEN TRIED TO START CLUSTER:

failed to authenticate to host root as user ec2-174-129-54-141.compute-1.amazonaws.com

SHOULD EXPLICITLY SPECIFY USER NAME?



starcluster start smallcluster
    
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 2-node cluster...
    >>> Launching master node...
    >>> Master AMI: ami-d1c42db8
    >>> Creating security group @sc-masters...
    >>> Creating security group @sc-smallcluster...
    Reservation:r-416b922b
    >>> Launching worker nodes...
    >>> Node AMI: ami-d1c42db8
    Reservation:r-476b922d
    >>> Waiting for cluster to start... 
    >>> The master node is ec2-174-129-54-141.compute-1.amazonaws.com
    >>> Setting up the cluster...
    >>> Using private key /root/base/apps/ec2/keypair/id_rsa-starcluster-1 (rsa)
    cli.py:1079 - ERROR - failed to authenticate to host root as user ec2-174-129-54-141.compute-1.amazonaws.com


HOWEVER THE CLUSTER APPEARED TO HAVE STARTED BUT, PERHAPS RELATED TO THE ABOVE ERROR, I COULD NOT SSH TO CLUSTER NODES.


Permission denied (publickey) ERROR WHEN TRIED TO START UP CLUSTER


SOLUTION:

USE MULTIPLE -i FILES, I.E., USE PUBLIC KEY AND PRIVATE KEY?

man ssh

    ...
     -i identity_file
             Selects a file from which the identity (private key) for RSA or DSA authentication is read.  The default is ~/.ssh/identity for protocol
             version 1, and ~/.ssh/id_rsa and ~/.ssh/id_dsa for protocol version 2.  Identity files may also be specified on a per-host basis in the
             configuration file.  It is possible to have multiple -i options (and multiple identities specified in configuration files).
    ...





1. LAUNCH STARCLUSTER SMALL UBUNTU INSTANCE
-------------------------------------------
ec2-describe-instances
    
    RESERVATION     r-1f0ef775      728213020069    default
    INSTANCE        i-c6fe04ab      ami-8cf913e5    ec2-184-72-172-173.compute-1.amazonaws.com      domU-12-31-38-01-BD-14.compute-1.internal        running agua    0               m1.small        2010-10-15T01:38:05+0000 us-east-1a      aki-754aa41c                    monitoring-disabled     184.72.172.173   10.253.194.226                  instance-store                                  paravirtual
    TAG     instance        i-c6fe04ab      Name    starcluster-ubuntu10.4-small


2. CONNECT
----------

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-184-72-172-173.compute-1.amazonaws.com


3. INSTALL STARCLUSTER
----------------------

easy_install StarCluster

    ...
    Processing pycrypto-2.3.tar.gz
    Running pycrypto-2.3/setup.py -q bdist_egg --dist-dir /tmp/easy_install-u_xaR8/pycrypto-2.3/egg-dist-tmp-Cde2c5
    warning: GMP library not found; Not building Crypto.PublicKey._fastmath.
    zip_safe flag not set; analyzing archive contents...
    Adding pycrypto 2.3 to easy-install.pth file
    
    Installed /usr/local/lib/python2.6/dist-packages/pycrypto-2.3-py2.6-linux-i686.egg
    Finished processing dependencies for StarCluster


4. USE STARCLUSTER
------------------

StarCluster - (http://web.mit.edu/starcluster)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

Usage: starcluster [global-opts] action [action-opts] [<action-args> ...]

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


5. GENERATE NEW KEYPAIR
-----------------------

Use X.509 certificates to make secure SOAP protocol requests to AWS service APIs. 
Exceptions: Amazon S3 and Amazon Mechanical Turk instead require your Access Keys for SOAP requests.

export AMAZON_USER_ID=728213020069
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export EC2_CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export  AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
export  AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/home/ec2
export EC2_APITOOL_HOME=/home/ec2
export EC2_HOME=/home/ec2
PATH=$EC2_AMITOOL_HOME/bin:$PATH
export JAVA_HOME=/usr


COPY KEYPAIR TO INSTANCE FROM LINODE:

mkdir -p /root/base/apps/ec2/keypair
cd /root/base/apps/ec2/keypair
scp root@173.230.142.248:/root/base/apps/ec2/keypair/*.pem ./
chmod 400 *
    
    -r-------- 1 root root 1670 2010-10-15 02:01 agua.pem
    -r-------- 1 root root  916 2010-10-15 02:01 cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
    -r-------- 1 root root  926 2010-10-15 02:01 pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem


GENERATE NEW KEYPAIR:

cd /root/base/apps/ec2/keypair


THIS KEYPAIR CORRESPONDS TO THE KEY PAIR NAME starcluster-1 IN AWS CONSOLE:

12:a9:09:e0:08:4a:a5:bf:fc:45:68:bf:0e:5e:19:b6:d8:0b:dc:28


ec2-add-keypair \
-K /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-C /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
starcluster-1


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



WRITE THIS TO A KEYPAIR FILE:

emacs /root/base/apps/ec2/keypair/id_rsa-starcluster-1

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


NOTE: THE CORRESPONDING ENTRIES IN THE config FILE ARE

[key gsg-keypair]

KEY_LOCATION=/root/base/apps/ec2/keypair/id_rsa-starcluster-1

# Sections starting with "cluster" define your cluster templates
# Section name is the name you give to your cluster template e.g.:
[cluster smallcluster]
# change this to the name of one of the keypair sections defined above 

KEYNAME = gsg-keypair





COPY NEW KEY TO LINODE

scp /root/base/apps/ec2/keypair/id_rsa-starcluster-1 root@173.230.142.248:/root/base/apps/ec2/keypair/



RECONNECT TO INSTANCE FROM LINODE USING THE NEW KEY:

/root/base/apps/ec2/keypair/id_rsa-starcluster-1 

#

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-184-72-172-173.compute-1.amazonaws.com

    OK
    
    
cat /root/base/apps/ec2/keypair/agua.pem

    -----BEGIN RSA PRIVATE KEY-----
    MIIEowIBAAKCAQEAgj50DUifAZTS3G/SP12Vty9Q+4ljc31rOkSafh9pzBmN39ORERtVcriJQA7a
    P/MTMqciLSJwThrtj4NRnjqSmFzFXRrVydNLLeSBz7dYLmzDJSpIuCgmUaoSbu/pnO4o1GvOCF+O
    aBB5+yhH/DOl+dp6S97ICcPhklnChCdWENQCbspI+0mgAIDKBV7xovaetdWSNZ9D7KLqZlgFYovS
    i3fGWmRFsYqvzQsfzIJQSXGEhc2m4ItG5r0XQImOamIrazEWC8K9WgpOGmeaMPMJBbz1ahPiPHKY
    HcpPn46P3hJ5edmlTmhxuzc1J7m95ql4SMtkKM2asVeZPA8zLqmESwIDAQABAoIBAH2W8VsZytHA
    ...

ssh -i /root/base/apps/ec2/keypair/id_rsa-starcluster-1  root@ec2-184-72-172-173.compute-1.amazonaws.com
    
    Permission denied (publickey)


cat /root/base/apps/ec2/keypair/id_rsa-starcluster-1

    KEYPAIR starcluster-1   12:a9:09:e0:08:4a:a5:bf:fc:45:68:bf:0e:5e:19:b6:d8:0b:dc:28
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEAkWvDJrk5HkS0Tswd/I58Ias89z4qrNbTD2UtU4cyMPoUojEqy15Le4iC5aoe
    Ynr0+IieTFnT9xpvpmrVk3GXbT2tJDyjgP3qJYqS/3yM2JMjM6JvZk9q+H6pU/q8fNCdKcmDJ6To
    b0PLPh72zkSVSi4g3RljIvLTQS1IT1fQU2Dnv3CAkqCjzgNDxmI2o+Zv8Y2iTYjzK2fMIZBc+Dg7
    DlR9+Ot6hSvmS5IzoLW36f3Wi4nUcP46Q2k+rjg6hWb/FK4KsZWvm79i0WjhLgMkkBhKBje1sO5m


PROBLEM:

emacs /root/.starcluster/config

    [key gsg-keypair]
    # KEY_LOCATION=/home/myuser/.ssh/id_rsa-gsg-keypair
    KEY_LOCATION=/root/base/apps/ec2/keypair/id_rsa-starcluster-1
    
    # Sections starting with "cluster" define your cluster templates
    # Section name is the name you give to your cluster template e.g.:
    [cluster smallcluster]
    # change this to the name of one of the keypair sections defined above 
    # KEYNAME = gsg-keypair
    KEYNAME = gsg-keypair


GIVES THIS ERROR:


starcluster start smallcluster
StarCluster - (http://web.mit.edu/starcluster)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

cli.py:998 - ERROR - keypair starcluster-1 not defined in config


SOLUTION

FOR A KEYPAIR FILE:

emacs /root/base/apps/ec2/keypair/id_rsa-starcluster-1

    KEYPAIR starcluster-1   12:a9:09:e0:08:4a:a5:bf:fc:45:68:bf:0e:5e:19:b6:d8:0b:dc:28
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEAkWvDJrk5HkS0Tswd/I58Ias89z4qrNbTD2UtU4cyMPoUojEqy15Le4iC5aoe
    Ynr0+IieTFnT9xpvpmrVk3GXbT2tJDyjgP3qJYqS/3yM2JMjM6JvZk9q+H6pU/q8fNCdKcmDJ6To
    ...

THE CORRESPONDING ENTRIES IN THE config FILE SHOULD BE:


    [key gsg-keypair]
    
    KEY_LOCATION=/root/base/apps/ec2/keypair/id_rsa-starcluster-1
    
    # Sections starting with "cluster" define your cluster templates
    # Section name is the name you give to your cluster template e.g.:
    [cluster smallcluster]
    # change this to the name of one of the keypair sections defined above 
    
    KEYNAME = gsg-keypair






6. EDIT CONFIG FILE
-------------------

starcluster listclusters

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    cli.py:994 - ERROR - config file /root/.starcluster/config does not exist
    
    Options:
    --------
    [1] Show the StarCluster config template
    [2] Write config template to /root/.starcluster/config
    [q] Quit
    
    Please enter your selection: 2
    
    >>> Config template written to /root/.starcluster/config. Please customize this file.

BACKUP CONFIG FILE:

cp  /root/.starcluster/config  /root/.starcluster/config.bkp


VIEW CONFIG FILE:

cat /root/.starcluster/config


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








WRITE NEW CONFIG FILE:


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
AWS_ACCESS_KEY_ID = AKIAIZXZ6S7ARZ44TTHQ
AWS_SECRET_ACCESS_KEY = 4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6
AWS_USER_ID= 728213020069


# Sections starting with "key" define your keypairs
# (see the EC2 getting started guide tutorial on using ec2-add-keypair to learn
# how to create new keypairs)
# Section name should match your key name e.g.:
# KEY_LOCATION=/home/myuser/.ssh/id_rsa-gsg-keypair

[key gsg-keypair]
KEY_LOCATION=/root/base/apps/ec2/keypair/id_rsa-starcluster-1

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
#AVAILABILITY_ZONE = us-east-1a

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




LIST CLUSTERS:

starcluster listclusters

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> No clusters found...



START CLUSTER:

starcluster start smallcluster


APPEARS TO GIVE AN ERROR:


    cli.py:1079 - ERROR - failed to authenticate to host root as user ec2-174-129-54-141.compute-1.amazonaws.com 
    
    
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 2-node cluster...
    >>> Launching master node...
    >>> Master AMI: ami-d1c42db8
    >>> Creating security group @sc-masters...
    >>> Creating security group @sc-smallcluster...
    Reservation:r-416b922b
    >>> Launching worker nodes...
    >>> Node AMI: ami-d1c42db8
    Reservation:r-476b922d
    >>> Waiting for cluster to start... 
    >>> The master node is ec2-174-129-54-141.compute-1.amazonaws.com
    >>> Setting up the cluster...
    >>> Using private key /root/base/apps/ec2/keypair/id_rsa-starcluster-1 (rsa)
    cli.py:1079 - ERROR - failed to authenticate to host root as user ec2-174-129-54-141.compute-1.amazonaws.com






BUT THE CLUSTER IS ACTUALLY RUNNING:

starcluster listclusters

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
        
    -----------------------------------------------
    smallcluster (security group: @sc-smallcluster)
    -----------------------------------------------
    Launch time: 2010-10-15T02:53:52.000Z
    Zone: us-east-1a
    Keypair: gsg-keypair
    Cluster nodes:
         master running i-9edc26f3 ec2-174-129-54-141.compute-1.amazonaws.com 
        node001 running i-98dc26f5 ec2-75-101-225-244.compute-1.amazonaws.com 



    
starcluster listclusters
    
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    
    -----------------------------------------------
    smallcluster (security group: @sc-smallcluster)
    -----------------------------------------------
    Launch time: 2010-10-15T05:49:36.000Z
    Zone: us-east-1a
    Keypair: gsg-keypair
    Cluster nodes:
         master running i-7609f31b ec2-67-202-25-182.compute-1.amazonaws.com 
        node001 running i-7209f31f ec2-184-72-81-94.compute-1.amazonaws.com
        
    
    
starcluster sshmaster -u sgeadmin smallcluster
starcluster sshnode smallcluster node001


# ssh -i /home/user/.ssh/id_rsa-gsg-keypair myuser@ec2-123-12-12-123.compute-1.amazonaws.com

ssh -i  /root/base/apps/ec2/keypair/id_rsa-starcluster-1 root@ec2-184-72-81-94.compute-1.amazonaws.com

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    Permission denied (publickey).



TRY USING PUBLIC KEY USED TO CREATE starcluster-1 KEY PAIR:

ssh -i /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem  root@ec2-184-72-81-94.compute-1.amazonaws.com





ssh -i  /root/base/apps/ec2/keypair/id_rsa-starcluster-1 root@ec2-184-72-81-94.compute-1.amazonaws.com -v


    OpenSSH_5.3p1 Debian-3ubuntu4, OpenSSL 0.9.8k 25 Mar 2009
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-72-81-94.compute-1.amazonaws.com [10.220.165.129] port 22.
    debug1: Connection established.
    debug1: permanently_set_uid: 0/0
    debug1: identity file /root/base/apps/ec2/keypair/id_rsa-starcluster-1 type -1
    debug1: Remote protocol version 2.0, remote software version OpenSSH_5.1p1 Debian-6ubuntu2
    debug1: match: OpenSSH_5.1p1 Debian-6ubuntu2 pat OpenSSH*
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_5.3p1 Debian-3ubuntu4
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: server->client aes128-ctr hmac-md5 none
    debug1: kex: client->server aes128-ctr hmac-md5 none
    debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024<1024<8192) sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
    debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
    debug1: Host 'ec2-184-72-81-94.compute-1.amazonaws.com' is known and matches the RSA host key.
    debug1: Found key in /root/.ssh/known_hosts:4
    debug1: ssh_rsa_verify: signature correct
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: SSH2_MSG_SERVICE_REQUEST sent
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey
    debug1: Next authentication method: publickey
    debug1: Trying private key: /root/base/apps/ec2/keypair/id_rsa-starcluster-1
    debug1: read PEM private key done: type RSA
    debug1: Authentications that can continue: publickey
    debug1: No more authentication methods to try.
    Permission denied (publickey).




http://github.com/guides/addressing-authentication-problems-with-ssh

This is usually caused when ssh cannot find your keys. Make sure your key is in the default location, ~/.ssh. If you run ssh-keygen again and just press enter at all 3 prompts it will be placed here automatically. Then you can add the contents of id_rsa.pub to my github keys. If id_rsa.pub doesn’t work try id_dsa.pub. You might need to generate a new dsa key with ssh-keygen -t dsa if you just have an rsa key.

cp /root/base/apps/ec2/keypair/id_rsa-gsg-keypair ~/.ssh/id_rsa.pub

~/.ssh/id_dsa.pub

You might need to generate a new dsa key with

ssh-keygen -t dsa

if you just have an rsa key.



Finding out what keys ssh is using

Finding what keys ssh is offering to the server is fairly simple. Run ssh -v git@github.com and look at the output:

debug1: Next authentication method: publickey
debug1: Trying private key: /Users/tekkub/.ssh/identity
debug1: Trying private key: /Users/tekkub/.ssh/id_rsa
debug1: Trying private key: /Users/tekkub/.ssh/id_dsa
debug1: No more authentication methods to try.

In this example, SSH could not find any keys

(“Trying” means ssh is trying to find the key on disk).

We should either rename our keypair to use a default name, or run ssh-add path/to/key to make SSH aware of the key’s existence.

debug1: Next authentication method: publickey
debug1: Offering public key: /Users/tekkub/.ssh/id_rsa
debug1: Remote: Forced command: gerve tekkub
...
ERROR: Hi tekkub! You've successfully authenticated, but GitHub does not provide shell access
Here we’ve renamed our keypair to ~/.ssh/id_rsa. SSH finds the key and offers it to the server. This key works and we authenticate as user “tekkub”.



We should either rename our keypair to use a default name, or run

ssh-add path/to/key

to make SSH aware of the key’s existence.


and check that the key is loaded using:

ssh-add -l




http://help.github.com/msysgit-key-setup/






PROBLEM

SSH TO EXECUTION HOST

starcluster sshnode smallcluster node001


ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-184-72-172-173.compute-1.amazonaws.com


ssh -i /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem root@ec2-174-129-54-141.compute-1.amazonaws.com

GIVES THIS ERROR:

    Permission denied (publickey).




DIAGNOSIS

This is because your user doesn't have their own keys shared in

emacs ~/.ssh/authorized_keys

    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCPnQNSJ8BlNLcb9I/XZW3L1D7iWNzfWs6RJp+H2nMGY3f05ERG1VyuIlADto/8xMypyItInBOGu2Pg1GeOpKYXMVdGtXJ00st5IHPt1gubMMlKki4KCZRqhJu7+mc7ijUa84IX45oEHn7KEf8M6X52npL3sgJw+GSWcKEJ1YQ1AJuykj7SaAAgMoFXvGi9p611ZI1n0PsoupmWAVii9KLd8ZaZEWxiq/NCx/MglBJcYSFzabgi0bmvRdAiY5qYitrMRYLwr1aCk4aZ5ow8wkFvPVqE+I8cpgdyk+fjo/eEnl52aVOaHG7NzUnub3mqXhIy2QozZqxV5k8DzMuqYRL agua




SHUT DOWN CLUSTER

starcluster  stop smallcluster

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    Shutdown cluster smallcluster (y/n)? y
    >>> Shutting down i-9edc26f3
    >>> Shutting down i-98dc26f5
    >>> Removing cluster security group @sc-smallcluster


    


CONNECT TO MASTER NODE:

starcluster


####ssh root@ec2-174-129-54-141.compute-1.amazonaws.com
#
#    The authenticity of host 'ec2-174-129-54-141.compute-1.amazonaws.com (10.120.71.104)' can't be established.
#    RSA key fingerprint is 98:a0:a4:11:a5:d5:42:c8:3c:f1:c1:d5:a7:44:22:b4.
#    Are you sure you want to continue connecting (yes/no)? yes
#    Warning: Permanently added 'ec2-174-129-54-141.compute-1.amazonaws.com,10.120.71.104' (RSA) to the list of known hosts.
#    Permission denied (publickey).




</entry>



<entry [Thu Oct 14 21:11:46 EDT 2010] INSTALL STARCLUSTER ON MICRO INSTANCE AND SAVE AS EBS-BACKED AMI>



STARCLUSTER DIDN'T WORK SO RESTARTED WITH 'SMALL' INSTANCE ABOVE


1. LAUNCH EBS-BACKED MICRO AMI

ec2-describe-instances

RESERVATION     r-81e41deb      728213020069    default
INSTANCE        i-0600fb6b      ami-a002f7c9    ec2-184-72-196-237.compute-1.amazonaws.com  ip-10-204-242-9.ec2.internal     running agua    0               t1.micro        2010-10-14T22:10:08+0000     us-east-1d      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled 184.72.196.237   10.204.242.9                    ebs                                     paravirtual
BLOCKDEVICE     /dev/sda1       vol-7a888813    2010-10-14T22:10:11.000Z


2. CONNECT

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-184-72-196-237.compute-1.amazonaws.com


3. INSTALL PYTHON 2.7

mkdir -p /software/python/2.7
cd /software/python/2.7
wget http://python.org/ftp/python/2.7/Python-2.7.tgz
tar xvfz *
./configure
make
    
    Python build finished, but the necessary bits to build these modules were not found:
    _bsddb             _curses            _curses_panel   
    _sqlite3           _ssl               _tkinter        
    bsddb185           bz2                dbm             
    dl                 gdbm               imageop         
    readline           sunaudiodev                        
    To find the necessary bits, look in setup.py in detect_modules() for the module's name.
    
    running build_scripts
    creating build/scripts-2.7
    copying and adjusting /software/python/Python-2.7/Tools/scripts/pydoc -> build/scripts-2.7
    copying and adjusting /software/python/Python-2.7/Tools/scripts/idle -> build/scripts-2.7
    copying and adjusting /software/python/Python-2.7/Tools/scripts/2to3 -> build/scripts-2.7
    copying and adjusting /software/python/Python-2.7/Lib/smtpd.py -> build/scripts-2.7
    changing mode of build/scripts-2.7/pydoc from 644 to 755
    changing mode of build/scripts-2.7/idle from 644 to 755
    changing mode of build/scripts-2.7/2to3 from 644 to 755
    changing mode of build/scripts-2.7/smtpd.py from 644 to 755
    /usr/bin/install -c -m 644 ./Tools/gdb/libpython.py python-gdb.py

make install

    OK
 

`
BUT /usr/bin/starcluster DID NOT RUN PROPERLY:

/usr/bin/starcluster 

    Traceback (most recent call last):
      File "/usr/bin/starcluster", line 5, in ?
        pkg_resources.run_script('StarCluster==0.91', 'starcluster')
      File "/usr/lib/python2.4/site-packages/setuptools-0.6c11-py2.4.egg/pkg_resources.py", line 489, in run_script
        self.require(requires)[0].run_script(script_name, ns)
      File "/usr/lib/python2.4/site-packages/setuptools-0.6c11-py2.4.egg/pkg_resources.py", line 1214, in run_script
        exec script_code in namespace, namespace
      File "/usr/bin/starcluster", line 2, in ?
        # EASY-INSTALL-SCRIPT: 'StarCluster==0.91','starcluster'
      File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 38, in ?
      File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 12, in ?
      File "build/bdist.linux-x86_64/egg/starcluster/awsutils.py", line 531, in ?
      File "build/bdist.linux-x86_64/egg/starcluster/awsutils.py", line 533, in EasyS3
    AttributeError: 'module' object has no attribute 'connection'
   
SOLUTION ???

    “AttributeError: ‘module’ object has no attribute ‘blah’”
    The obvious cause of this is that the settings.py doesn’t have the directory containing blah listed in INSTALLED_APPS.
    A less obvious cause: you’ll also get this error if the directory doesn’t contain a file __init__.py.




REINSTALLED WITH PYTHON V2.7 easy_install
    
    python /usr/local/bin/easy_install StarCluster
    Searching for StarCluster
    Best match: StarCluster 0.91
    Processing StarCluster-0.91-py2.4.egg
    StarCluster 0.91 is already the active version in easy-install.pth
    Installing starcluster script to /usr/bin
    
    Using /usr/lib/python2.4/site-packages/StarCluster-0.91-py2.4.egg
    Processing dependencies for StarCluster
    Finished processing dependencies for StarCluster

BUT STILL /usr/bin/starcluster DID NOT RUN PROPERLY...



INSTALLED STARCLUSTER MANUALLY

mkdir -p /software/starcluster/0.91
cd /software/starcluster/0.91
python setup.py install

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
    copying build/lib/starcluster/ssh.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/hacks.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/image.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/volume.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/optcomplete.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/logger.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/clustersetup.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/spinner.py -> build/bdist.linux-x86_64/egg/starcluster
    creating build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/test_cluster_validation.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/test_config.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/tests/mytestplugin.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    creating build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/templates/__init__.py -> build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/templates/config.py -> build/bdist.linux-x86_64/egg/starcluster/tests/templates
    copying build/lib/starcluster/tests/__init__.py -> build/bdist.linux-x86_64/egg/starcluster/tests
    copying build/lib/starcluster/utils.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/cluster.py -> build/bdist.linux-x86_64/egg/starcluster
    creating build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sgeprofile.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sgeinstall.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/experimental.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/sge_pe.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/__init__.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/templates/config.py -> build/bdist.linux-x86_64/egg/starcluster/templates
    copying build/lib/starcluster/cli.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/static.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/awsutils.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/__init__.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/node.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/exception.py -> build/bdist.linux-x86_64/egg/starcluster
    copying build/lib/starcluster/config.py -> build/bdist.linux-x86_64/egg/starcluster
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/ssh.py to ssh.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/hacks.py to hacks.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/image.py to image.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/volume.py to volume.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/optcomplete.py to optcomplete.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/logger.py to logger.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/clustersetup.py to clustersetup.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/spinner.py to spinner.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/test_cluster_validation.py to test_cluster_validation.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/test_config.py to test_config.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/mytestplugin.py to mytestplugin.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/templates/__init__.py to __init__.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/templates/config.py to config.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/tests/__init__.py to __init__.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/utils.py to utils.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/cluster.py to cluster.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/sgeprofile.py to sgeprofile.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/sgeinstall.py to sgeinstall.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/experimental.py to experimental.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/sge_pe.py to sge_pe.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/__init__.py to __init__.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/templates/config.py to config.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/cli.py to cli.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/static.py to static.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/awsutils.py to awsutils.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/__init__.py to __init__.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/node.py to node.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/exception.py to exception.pyc
    byte-compiling build/bdist.linux-x86_64/egg/starcluster/config.py to config.pyc
    creating build/bdist.linux-x86_64/egg/EGG-INFO
    installing scripts to build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    running install_scripts
    running build_scripts
    creating build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    copying build/scripts-2.4/starcluster -> build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    changing mode of build/bdist.linux-x86_64/egg/EGG-INFO/scripts/starcluster to 755
    copying StarCluster.egg-info/PKG-INFO -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/SOURCES.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/dependency_links.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/requires.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/top_level.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/zip-safe -> build/bdist.linux-x86_64/egg/EGG-INFO
    creating 'dist/StarCluster-0.91-py2.4.egg' and adding 'build/bdist.linux-x86_64/egg' to it
    removing 'build/bdist.linux-x86_64/egg' (and everything under it)
    Processing StarCluster-0.91-py2.4.egg
    Removing /usr/lib/python2.4/site-packages/StarCluster-0.91-py2.4.egg
    Copying StarCluster-0.91-py2.4.egg to /usr/lib/python2.4/site-packages
    StarCluster 0.91 is already the active version in easy-install.pth
    Installing starcluster script to /usr/bin
    
    Installed /usr/lib/python2.4/site-packages/StarCluster-0.91-py2.4.egg
    Processing dependencies for StarCluster==0.91
    Searching for boto==2.0b3
    Best match: boto 2.0b3
    Processing boto-2.0b3-py2.4.egg
    boto 2.0b3 is already the active version in easy-install.pth
    Installing cfadmin script to /usr/bin
    Installing taskadmin script to /usr/bin
    Installing s3put script to /usr/bin
    Installing elbadmin script to /usr/bin
    Installing cq script to /usr/bin
    Installing fetch_file script to /usr/bin
    Installing lss3 script to /usr/bin
    Installing sdbadmin script to /usr/bin
    Installing launch_instance script to /usr/bin
    Installing list_instances script to /usr/bin
    Installing pyami_sendmail script to /usr/bin
    Installing kill_instance script to /usr/bin
    Installing bundle_image script to /usr/bin
    
    Using /usr/lib/python2.4/site-packages/boto-2.0b3-py2.4.egg
    Searching for paramiko==1.7.6
    Best match: paramiko 1.7.6
    Processing paramiko-1.7.6-py2.4.egg
    paramiko 1.7.6 is already the active version in easy-install.pth
    
    Using /usr/lib/python2.4/site-packages/paramiko-1.7.6-py2.4.egg
    Searching for pycrypto==2.3
    Best match: pycrypto 2.3
    Processing pycrypto-2.3-py2.4-linux-x86_64.egg
    pycrypto 2.3 is already the active version in easy-install.pth
    
    Using /usr/lib/python2.4/site-packages/pycrypto-2.3-py2.4-linux-x86_64.egg
    Finished processing dependencies for StarCluster==0.91


BUT STILL DID NOT WORK

[root@ip-10-204-242-9 0.91]# starcluster
Traceback (most recent call last):
  File "/usr/bin/starcluster", line 4, in <module>
    import pkg_resources
  File "build/bdist.linux-i686/egg/pkg_resources.py", line 2603, in <module>
  File "build/bdist.linux-i686/egg/pkg_resources.py", line 666, in require
  File "build/bdist.linux-i686/egg/pkg_resources.py", line 565, in resolve
pkg_resources.DistributionNotFound: StarCluster==0.91



</entry>



<entry [Wed Oct 13 23:49:44 EDT 2010] CREATING AN EBS-BACKED AMI>




SUMMARY
-------

Process for Converting a Linux/UNIX Amazon S3-Backed AMI
http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/index.html?Using_BootFromEBS.html

Copy the AMI's root device information to an Amazon EBS volume. How you do that is up to you.

Create a snapshot of that volume. For more information, see How to Create an Amazon EBS Snapshot.

Register the image with a block device mapping that maps the root device name of your choice to the snapshot you just created. For an example of how to register an image, see Automatically Attaching Volumes.


Another Summary
http://www.elastician.com/2009/12/creating-ebs-backed-ami-from-s3-backed.html

Install stuff, format the EBS volume as an EXT3 filesystem, mount that filesystem as /ebs and then copy the entire contents of the current root volume over to the EBS volume, then unmount the EBS volume.


PROCEDURE
---------

1. LAUNCH AN AMI INSTANCE


NOTE: THIS IS NOT AN EBS-BACKED AMI

AMI ID: ami-74b65c1d
Name: starcluster-centOS5-1.0
Description: 201008111707
Source: dvnimages/starcluster-centOS5-1.0.manifest.xml
Owner: 076326289960	Visibility: Public	Product Code:
State: available	Kernel ID: aki-b51cf9dc	RAM Disk ID: ari-b31cf9da
Image Type: machine	Architecture: x86_64	Platform: Cent OS
Root Device Type: instance-store	Root Device: /dev/sda1	Image Size: 0 bytes
Block Devices: N/A - Instance Store
Virtualization: paravirtual

DETACH VOLUME

ec2-detach-volume vol-6c752005


ATTACH EBS VOLUME starcluster-2 CONTAINING MYSQL


/dev/sdf

2. DO STUFF


CONNECT

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-174-129-119-117.compute-1.amazonaws.com



MOUNT EBS VOLUME starcluster-2 CONTAINING MYSQL

mount /dev/sdf /data


MAKE SURE MYSQL RUNS LOCALLY

ps aux | grep mysql

/etc/init.d/mysqld start

    root      1390  0.0  0.0  63788  1292 pts/0    S    23:37   0:00 /bin/sh /usr/bin/mysqld_safe --datadir=/var/lib/mysql --socket=/var/lib/mysql/mysql.sock --log-error=/var/log/mysqld.log --pid-file=/var/run/mysqld/mysqld.pid --user=mysql
    mysql     1440  2.0  0.3 178308 25712 pts/0    Sl   23:37   0:00 /usr/libexec/mysqld --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/var/run/mysqld/mysqld.pid --skip-external-locking --socket=/var/lib/mysql/mysql.sock
    root      1457  0.0  0.0  61132   756 pts/0    R+   23:37   0:00 grep mysql

SOCK FILE IS IN LOCAL /var/lib/mysql DIRECTORY

ll /var/lib/mysql

    -rw-rw---- 1 mysql mysql 10485760 Oct 13 23:37 ibdata1
    -rw-rw---- 1 mysql mysql  5242880 Oct 13 23:37 ib_logfile0
    -rw-rw---- 1 mysql mysql  5242880 Oct 13 23:37 ib_logfile1
    drwx------ 2 mysql mysql     4096 Oct 13 23:37 mysql
    srwxrwxrwx 1 mysql mysql        0 Oct 13 23:37 mysql.sock
    drwx------ 2 mysql mysql     4096 Oct 13 23:37 test


SHUTDOWN MYSQL

/etc/init.d/mysqld stop



CREATE BINDINGS TO LINK TO MYSQL ON AMI


USE bind AND mount TO MIRROR NEW LOCATIONS IN OLD FOLDERS
Point MySQL to the correct database files on the EBS volume using mount bind.


echo "/data/mysql/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
#    /data/mysql/etc/mysql /etc/mysql     none bind

mkdir /etc/mysql
mount /etc/mysql

echo "/data/mysql/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
#    /data/mysql/lib/mysql /var/lib/mysql none bind
mount /var/lib/mysql

echo "/data/mysql/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
mount /var/log/mysql


RESTART MYSQL


/etc/init.d/mysqld start

ps aux | grep mysql



CHECK THAT MYSQL IS USING THE DATABASE IN /data  (YES)

mysql -u root -p
    Enter password: 

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.0.77 Source distribution

Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema | 
| mysql              | 
| test               | 
| tutorial_sample    | 
+--------------------+
4 rows in set (0.01 sec)




LOAD APPS, AGUA AND JBROWSE FILES ON starcluster-2

CHECK DISC USAGE

df -ah
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1             9.9G  3.5G  6.0G  37% /
none                     0     0     0   -  /proc
none                     0     0     0   -  /sys
none                     0     0     0   -  /dev/pts
/dev/sdb              414G  199M  393G   1% /mnt
none                     0     0     0   -  /proc/sys/fs/binfmt_misc
/dev/sdf               40G  9.9G   28G  27% /data
/data/mysql/etc/mysql
                       40G  9.9G   28G  27% /etc/mysql
/data/mysql/lib/mysql
                       40G  9.9G   28G  27% /var/lib/mysql
/data/mysql/log/mysql
                       40G  9.9G   28G  27% /var/log/mysql


ON starcluster-1

mkdir /data/apps


ON PEGASUS


cd /ngs/bioinfo/syoung/base/apps
scp root@173.230.142.248:/root/base/apps/ec2/keypair/agua.pem ./

scp -i agua.pem * root@ec2-174-129-119-117.compute-1.amazonaws.com:/data/apps




START HTTPD

/etc/init.d/httpd start
    OK
    
DON'T USE AMI'S IP ADDRESS (10.253.31.80), INSTEAD USE

ELASTIC IP:

174.129.11.221


LOG BACK IN ***WITH ELASTIC IP***:

ssh -i /root/base/apps/ec2/keypair/agua.pem root@174.129.11.221


FILES TRANSFERRED (FAST!):

scp -i agua.pem s*.gz root@174.129.11.221:/data/apps

samtools.tar.gz                                          100%   23MB  11.4MB/s   00:02    
seqmap.tar.gz                                            100%  181KB 180.6KB/s   00:00    
shore.tar.gz                                             100% 9082KB   8.9MB/s   00:01    
shrimp.tar.gz                                            100%   10MB  10.0MB/s   00:00    
soap.tar.gz                                              100% 1726KB   1.7MB/s   00:00    
sra.tar.gz                                               100% 7313KB   7.1MB/s   00:01    
ssaha.tar.gz                                             100% 7832KB   7.7MB/s   00:01    
subversion.tar.gz                                        100%   13MB  12.7MB/s   00:00    
[syoung@u02 apps]$ scp -i agua.pem t*.gz root@174.129.11.221:/data/apps
tandemrepeats.tar.gz                                     100%   80KB  79.9KB/s   00:00    
temp.tar.gz                                              100%   13MB   6.6MB/s   00:02    
tophat.tar.gz                                            100% 3268KB   3.2MB/s   00:00    
trac.tar.gz                                              100%   11MB  10.8MB/s   00:01    
[syoung@u02 apps]$ scp -i agua.pem v*.gz root@174.129.11.221:/data/apps
velvet.tar.gz                                            100% 3591KB   3.5MB/s   00:01    
[syoung@u02 apps]$ scp -i agua.pem y*.gz root@174.129.11.221:/data/apps
yum.tar.gz                                               100% 4171KB   4.1MB/s   00:00


cd /data/apps
ll

    -rw-r--r-- 1 root root 308116330 Oct 14 00:00 454.tar.gz
    -rw-r--r-- 1 root root 470970599 Oct 14 00:01 agua.tar.gz
    -rw-r--r-- 1 root root    634699 Oct 14 00:01 bedtools.tar.gz
    -rw-r--r-- 1 root root   4438479 Oct 14 00:01 bfast.tar.gz
    -rw-r--r-- 1 root root       510 Oct 14 00:01 biolinux.tar.gz
    -rw-r--r-- 1 root root   9683673 Oct 14 00:01 bioperl.tar.gz
    -rw-r--r-- 1 root root   1653015 Oct 14 00:01 blat.tar.gz
    -rw-r--r-- 1 root root  46931367 Oct 14 00:01 bowtie.tar.gz
    -rw-r--r-- 1 root root   1340030 Oct 14 00:01 bwa.tar.gz
    -rw-r--r-- 1 root root 143680499 Oct 14 00:01 casava.tar.gz
    -rw-r--r-- 1 root root  86790743 Oct 14 00:01 circos.tar.gz
    -rw-r--r-- 1 root root 218951745 Oct 14 00:01 complete.tar.gz
    -rw-r--r-- 1 root root  10709177 Oct 14 00:01 crossbow.tar.gz
    -rw-r--r-- 1 root root  14707899 Oct 14 00:01 cufflinks.tar.gz
    -rw-r--r-- 1 root root 843849887 Oct 14 00:02 GAPipeline.tar.gz
    -rw-r--r-- 1 root root  35817443 Oct 14 00:02 gatk.tar.gz
    -rw-r--r-- 1 root root    448421 Oct 14 00:02 gff2aplot.tar.gz
    -rw-r--r-- 1 root root 151487528 Oct 14 00:02 git.tar.gz
    -rw-r--r-- 1 root root  89105620 Oct 14 00:02 hadoop.tar.gz
    -rw-r--r-- 1 root root  47184968 Oct 14 00:02 jbrowse.tar.gz
    -rw-r--r-- 1 root root 114995371 Oct 14 00:02 jdk.tar.gz
    -rw-r--r-- 1 root root 385750062 Oct 14 00:03 libs.tar.gz
    -rw-r--r-- 1 root root    697537 Oct 14 00:03 lynx.tar.gz
    -rw-r--r-- 1 root root 488606168 Oct 14 00:03 maq.tar.gz
    -rw-r--r-- 1 root root       149 Oct 14 00:03 mosaik.tar.gz
    -rw-r--r-- 1 root root   3719239 Oct 14 00:03 mummer.tar.gz
    -rw-r--r-- 1 root root  17531591 Oct 14 00:03 myrna.tar.gz
    -rw-r--r-- 1 root root  29562757 Oct 14 00:03 novoalign.tar.gz
    -rw-r--r-- 1 root root    191081 Oct 14 00:03 piqa.tar.gz
    -rw-r--r-- 1 root root 243636735 Oct 14 00:03 polybayes.tar.gz
    -rw-r--r-- 1 root root   3488912 Oct 14 00:03 pygr.tar.gz
    -rw-r--r-- 1 root root    688679 Oct 14 00:03 pyrobayes.tar.gz
    -rw-r--r-- 1 root root 148239400 Oct 14 00:08 repeatmasker.tar.gz
    -rw-r--r-- 1 root root 173815250 Oct 14 00:08 rmblast.tar.gz
    -rw-r--r-- 1 root root 118936798 Oct 14 00:08 rnamate.tar.gz
    -rw-r--r-- 1 root root 427717667 Oct 14 00:08 R.tar.gz
    -rw-r--r-- 1 root root  23875214 Oct 14 00:08 samtools.tar.gz
    -rw-r--r-- 1 root root    184962 Oct 14 00:08 seqmap.tar.gz
    -rw-r--r-- 1 root root   9300292 Oct 14 00:08 shore.tar.gz
    -rw-r--r-- 1 root root  10525045 Oct 14 00:08 shrimp.tar.gz
    -rw-r--r-- 1 root root   1767900 Oct 14 00:08 soap.tar.gz
    -rw-r--r-- 1 root root   7488315 Oct 14 00:08 sra.tar.gz
    -rw-r--r-- 1 root root   8020427 Oct 14 00:08 ssaha.tar.gz
    -rw-r--r-- 1 root root  13277440 Oct 14 00:08 subversion.tar.gz
    -rw-r--r-- 1 root root     81772 Oct 14 00:09 tandemrepeats.tar.gz
    -rw-r--r-- 1 root root  13805486 Oct 14 00:09 temp.tar.gz
    -rw-r--r-- 1 root root   3346653 Oct 14 00:09 tophat.tar.gz
    -rw-r--r-- 1 root root  11274946 Oct 14 00:09 trac.tar.gz
    -rw-r--r-- 1 root root   3677000 Oct 14 00:09 velvet.tar.gz
    -rw-r--r-- 1 root root   4271594 Oct 14 00:09 yum.tar.gz

df -a

    Filesystem           1K-blocks      Used Available Use% Mounted on
    /dev/sda1             10321208   3609508   6187412  37% /
    none                         0         0         0   -  /proc
    none                         0         0         0   -  /sys
    none                         0         0         0   -  /dev/pts
    /dev/sdb             433455904    203016 411234584   1% /mnt
    none                         0         0         0   -  /proc/sys/fs/binfmt_misc
    /dev/sdf              41284928  15028616  24159160  39% /data
    /data/mysql/etc/mysql
                          41284928  15028616  24159160  39% /etc/mysql
    /data/mysql/lib/mysql
                          41284928  15028616  24159160  39% /var/lib/mysql
    /data/mysql/log/mysql
                          41284928  15028616  24159160  39% /var/log/mysql


NOW UNZIP THEM:


APPSDIR=/data/apps
cd $APPSDIR
FILES="*"
for FILE in $FILES;
do
    TARFILE=$(echo $FILE | egrep "\.tar\.gz" ); 
    if [ "$TARFILE" != "" ]; then
        echo "TARFILE: " $APPSDIR/$TARFILE
        tar xvfz $APPSDIR/$TARFILE
        
    fi;
    
done;



df -a

    Filesystem           1K-blocks      Used Available Use% Mounted on
    /dev/sda1             10321208   3603352   6193568  37% /
    none                         0         0         0   -  /proc
    none                         0         0         0   -  /sys
    none                         0         0         0   -  /dev/pts
    /dev/sdb             433455904   5008524 406429076   2% /mnt
    none                         0         0         0   -  /proc/sys/fs/binfmt_misc
    /data/mysql/etc/mysql
                          41284928  30213628   8974148  78% /etc/mysql
    /data/mysql/lib/mysql
                          41284928  30213628   8974148  78% /var/lib/mysql
    /data/mysql/log/mysql
                          41284928  30213628   8974148  78% /var/log/mysql
    /mnt/image            10321208   3581740   6215180  37% /mnt/img-mnt
    /dev/sdf              41284928  30213628   8974148  78% /data



3. ATTACH AN EBS VOLUME AT /dev/sdXXX
-------------------------------------

COPY OVER CREDENTIALS

mkdir -p /root/base/apps/ec2/keypair
cd /root/base/apps/ec2/keypair
scp root@173.230.142.248:/root/base/apps/ec2/keypair/*.pem ./


AWS Account ID:	7282-1302-0069
Canonical User ID:	f30462040ebba8804e2f9ca67a71a93ac44015e835cf6c0f71d1710f8cbfaddb

access key id
AKIAIZXZ6S7ARZ44TTHQ

secret access key
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

aws Key Pair Name: agua
Fingerprint: 61:2d:42:13:55:92:09:bb:a9:8c:fa:17:69:29:ae:39:b5:76:d9:82

PUBLIC AND PRIVATE KEYPAIR

-k /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 
-c /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 




WRAP IT ALL UP IN THIS FILE:


emacs ~/.aws/aws.sh 
#!/bin/bash

export AMAZON_USER_ID=728213020069
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export EC2_CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export  AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
export  AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/home/ec2
export EC2_APITOOL_HOME=/home/ec2
export EC2_HOME=/home/ec2
PATH=$EC2_AMITOOL_HOME/bin:$PATH
export JAVA_HOME=/usr

chmod -R 600 ~/.aws
chmod o+x ~/.aws/aws.sh



# Change these to suit your environment
vol_size=20
dev=/dev/sdi
desc="CreateEBS-backedAMI"
rm -rf /usr/local/ec*


# Call the environment setup script
. ~/.aws/aws.sh


# Get basic info from instance meta-data
instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
avail_zone=`curl -s \
http://169.254.169.254/latest/meta-data/placement/availability-zone`


# Create the Volume
echo $EC2_PRIVATE_KEY
echo $EC2_CERT
vol=`ec2-create-volume -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -z "$avail_zone" --size $vol_size| cut -f2`

    OK!

# ATTACHMENT      vol-18e8e971    i-fc49b791      /dev/sdi        attaching       2010-10-14T04:40:14+0000
# Attach the volume
ec2attvol "$vol" -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -i "$instance_id" -d "$dev"
while [[ "$vol_status" != "attached"  ]];
do
vol_status=`ec2-describe-volumes -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" "$vol"\
| grep ATTACHMENT | cut -f5`
echo Status of "$vol" : $vol_status
done

    Status of vol-18e8e971 : attached




4. FORMAT EBS PARTITION
-----------------------


# Prepare the volume

mkfs.ext3 "$dev"
    
    mke2fs 1.39 (29-May-2006)
    /dev/sdi is entire device, not just one partition!
    Proceed anyway? (y,n) mount "$dev" /vol
    rm -rf /mnt/image*
    rm -rf /mnt/img-mnt
    [root@domU-12-31-36-00-18-A2 keypair]# rm -rf /mnt/image*
    [root@domU-12-31-36-00-18-A2 keypair]# rm -rf /mnt/img-mnt
    [root@domU-12-31-36-00-18-A2 keypair]# mkfs.ext3 "$dev"
    mke2fs 1.39 (29-May-2006)
    /dev/sdi is entire device, not just one partition!
    Proceed anyway? (y,n) y
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    2621440 inodes, 5242880 blocks
    262144 blocks (5.00%) reserved for the super user
    First data block=0
    Maximum filesystem blocks=4294967296
    160 block groups
    32768 blocks per group, 32768 fragments per group
    16384 inodes per group
    Superblock backups stored on blocks: 
            32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
            4096000
    
    Writing inode tables: done                            
    Creating journal (32768 blocks): done
    Writing superblocks and filesystem accounting information: done
    
    This filesystem will be automatically checked every 21 mounts or
    180 days, whichever comes first.  Use tune2fs -c or -i to override




OR, ALTERNATELY:

root@domU-12-31-39-02-31-51:~# mkfs -t ext3 /dev/sdh
mke2fs 1.41.4 (27-Jan-2009)
/dev/sdh is entire device, not just one partition!
Proceed anyway? (y,n) y
...



5. MOUNT EBS PARTITION AND COPY ROOT PARTITION OVER

mkdir -p /vol
mount "$dev" /vol

REMOVE THE OLD IMAGE

rm -rf /mnt/image*
rm -rf /mnt/img-mnt


####root@domU-12-31-39-02-31-51:~# mkdir /ebs
####root@domU-12-31-39-02-31-51:~# mount -t ext3 /dev/sdh /ebs
####root@domU-12-31-39-02-31-51:~# tar cpS / | cpipe -vt -b 1024 | gzip -c | tar zxpS -C /ebs
####....
####root@domU-12-31-39-02-31-51:~# umount /ebs




# Use bundle to create a clean image (we will not upload)

NB: MUST FIRST DETACH THE /data EBS VOLUME TO AVOID THIS

    ERROR: execution failed: "rsync -rlpgoD -t -r -S -l --exclude /sys --exclude /var/log/mysql --exclude /var/lib/mysql --exclude /proc --exclude /etc/mysql --exclude /dev/pts --exclude /proc/sys/fs/binfmt_misc --exclude /dev --exclude /media --exclude /mnt --exclude /proc --exclude /sys --exclude /vol --exclude /mnt/image --exclude /mnt/img-mnt -X /* /mnt/img-mnt 2>&1 > /dev/null"

NB: /vol MUST BE EMPTY


ec2-bundle-vol -c $EC2_CERT -k $EC2_PRIVATE_KEY -u $AMAZON_USER_ID \
-e /vol -d /mnt
    
    Please specify a value for arch [x86_64]: 
    Copying / into the image file /mnt/image...
    Excluding: 
             /sys
             /var/log/mysql
             /var/lib/mysql
             /proc
             /etc/mysql
             /dev/pts
             /proc/sys/fs/binfmt_misc
             /dev
             /media
             /mnt
             /proc
             /sys
             /vol
             /mnt/image
             /mnt/img-mnt
    1+0 records in
    1+0 records out
    1048576 bytes (1.0 MB) copied, 0.002723 seconds, 385 MB/s
    mke2fs 1.39 (29-May-2006)
    Bundling image file...
    Splitting /mnt/image.tar.gz.enc...
    Created image.part.000
    ...
    Created image.part.102
    Created image.part.103
    Created image.part.104
    Generating digests for each part...
    Digests generated.
    Unable to read instance meta-data for product-codes
    Creating bundle manifest...
    ec2-bundle-vol complete.



#### OR USE tar TO TRANSFER '/' PARTITION DATA
#### tar cpS --one-file-system / | gzip -c | tar zxpS -C /vol

    OK!


# take the clean image and install on the EBS Volume

NB: MUST DETACH THE /data DIRECTORY TO AVOID THIS:

    ...
    data/starcluster/.image.lN9ccj
    rsync: writefd_unbuffered failed to write 4 bytes [sender]: Broken pipe (32)
    rsync: write failed on "/vol/data/starcluster/.image.lN9ccj": No space left on device (28)


mount -o loop /mnt/image /mnt/img-mnt

rsync -av /mnt/img-mnt/ /vol/
    
    ...
    var/www/icons/small/uu.gif
    var/www/icons/small/uu.png
    var/yp/
    var/yp/nicknames
    var/yp/binding/
    
    sent 3297353068 bytes  received 2164238 bytes  33497637.62 bytes/sec
    total size is 3290215727  speedup is 1.00



# Set the fstab up 
cat > /vol/etc/fstab << FSTABEOF
#
<file system>                                 <mount
point>   <type>  <options>       <dump> 
<pass>
proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0
###/dev/sda2                                       /mnt            ext3    defaults        0       0
FSTABEOF


###/dev/sda2                                       /mnt            ext3    defaults        0       0




6. DETACH EBS VOLUME AND CREATE SNAPSHOT

umount /vol


PROBLEM

umount: /vol: device is busy

SOLUTION

USE fuser TO FIND OUT WHICH PROCESS IS KEEPING THE DEVICE BUSY:
fuser -m /dev/sdi
    /dev/sdi:             2327c

ps aux | grep 2327
    root      2327  0.0  0.0  76100  1088 pts/1    T    01:33   0:00 tar zxpS -C /vol

kill -9 2327

umount /vol

    [1]+  Stopped                 tar cpS --one-file-system / | gzip -c | tar zxpS -C /vol




# Snapshot the volume. Note the snapshot id for the registration step
Here we are detaching the EBS volume and then creating a snapshot of that volume.  

ec2addsnap -C $EC2_CERT -K $EC2_PRIVATE_KEY -d $desc $vol

    SNAPSHOT        snap-b18d77db   vol-18e8e971    pending 2010-10-14T06:17:20+0000                728213020069    20      CreateEBS-backedAMI




REGISTER THE SNAPSHOT
E.G.: ec2-register -n "starcluster-1-ebs" -s <snapshotid> -b /dev/sda=ephemeral0 --kernel <kernel> --ramdisk <kernel> --root-device-name /dev/sdb

We need to import some data structures that will allow us to register a new EBS-based image. The first data structure is the EBSBlockDeviceType.  There are a number of available fields in that object but the only one we need to worry about is the snapshot_id.  This tells EC2 that when someone wants to start up a new instance of our AMI, EC2 needs to start by creating a new EBS volume from this snapshot.

The second data structure is the BlockDeviceMapping.  It is actually a subclass of a Python dictionary and behaves as you would expect.  We need to add an entry that maps the device name of our root volume (in this case /dev/sda1) to the EBS snapshot.  Finally, we call register_image to create the new AMI.  We pass in a name, a description, the architecture, the kernel and ramdisk (we are just referring to the same ones used by the original S3-backed AMI), the name of our root device (/dev/sda1) and the block device mapping we just created.  EC2 returns with a new AMI id and we can then use that to start new EC2 instances.




ec2-register -n "starcluster-1-ebs" \
-s snap-b18d77db \
-b /dev/sda1=ephemeral0 \
--root-device-name /dev/sdb

    IMAGE   ami-fcdb2f95

##--kernel 2.6.21.7-2.fc8xen \
##--ramdisk 2.6.21.7-2.fc8xen \



THE NEW AMI HAS THESE CREDENTIALS ON THE AMI PAGE OF AWS CONSOLE:

AMI ID: ami-fcdb2f95
Name: starcluster-1-ebs
Description: -
Source: 728213020069/starcluster-1-ebs
Owner: 728213020069	Visibility: Private	Product Code:
State: available	Kernel ID: -	RAM Disk ID: -
Image Type: machine	Architecture: i386	Platform: Other Linux
Root Device Type: ebs	Root Device: /dev/sdb	Image Size: 20 GiB
Block Devices: /dev/sdb=snap-b18d77db:20:true
Virtualization: paravirtual




7. LAUNCH THE EBS-BACKED AMI AND SSH IN

Instances --> Launch Instance --> ami-fcdb2f95 --> 'micro'


PROBLEM

COULD NOT CONNECT WHEN LAUNCHED THE EBS-BACKED AMI:

Instances --> Launch Instance --> ami-fcdb2f95 --> 'micro'


AMI ID: ami-fcdb2f95	Zone: us-east-1a
Security Groups: @sc-masters	Type: t1.micro
Status: running	Owner: 728213020069
VPC ID: -	Subnet ID: -
Virtualization: paravirtual	Placement Group:
Reservation: r-7375b319	RAM Disk ID: -
Platform: -	Key Pair Name: agua
Kernel ID: -	Monitoring: disabled
AMI Launch Index: 0	Elastic IP: -
Root Device: /dev/sdb	Root Device Type: ebs
Block Devices: /dev/sdb=vol-b87778d1:attached:2010-10-18T22:21:43.000Z:true
Lifecycle: normal
Public DNS: ec2-184-73-129-12.compute-1.amazonaws.com
Private DNS: domU-12-31-38-04-18-D8.compute-1.internal
Private IP Address: 10.220.27.38
Launch Time: 2010-10-18 18:21 EST


AND CONNECTED:

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-184-73-129-12.compute-1.amazonaws.com

... AND IT HANGS INDEFINITELY...




DIAGNOSIS

http://coderslike.us/2009/12/07/amazon-ec2-boot-from-ebs-and-ami-conversion/

Segedunum
December 17, 2009 at 2:55 pm
I think you missed a step in registering the snapshot. I had to make sure that I specified the kernel and ramdisk IDs that I am using. Without those I couldn’t boot my EBS snapshot.



SOLUTION


REDO WITH KERNEL AND RAMDISK IDS




8. SHUT DOWN IN AWS CONSOLE AND VERIFY ON COMMAND LINE



ec2-describe-instances

    RESERVATION     r-9f1fe0f5      728213020069    ngsdev
    INSTANCE        i-fc49b791      ami-74b65c1d    ec2-174-129-11-221.compute-1.amazonaws.com      domU-12-31-36-00-18-A2.z-1.compute-1.internal   shutting-down   agua    0               m1.large        2010-10-14T03:22:30+000us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     174.129.11.221  10.253.31.80   instance-store                                   paravirtual
    BLOCKDEVICE     /dev/sdi        vol-18e8e971    2010-10-14T04:40:14.000Z
    TAG     instance        i-fc49b791      Name
    RESERVATION     r-f1be409b      728213020069    default
    INSTANCE        i-e02fd68d      ami-fcdb2f95    ec2-184-73-107-173.compute-1.amazonaws.com      domU-12-31-39-10-3C-27.compute-1.internal       shutting-down   agua    0               m1.small        2010-10-14T07:45:53+000us-east-1c                               monitoring-disabled     184.73.107.173  10.198.63.213                  ebs                                      paravirtual
    BLOCKDEVICE     /dev/sdb        vol-589b9a31    2010-10-14T07:46:04.000Z










NOTES
-----


Migrating a Linux S3 Based AMI to an EBS Based AMI

http://www.full360.com/blogs/Migrating-Linux-S3-Based-AMI-EBS-Based-AMI

Posted by Rohit Amarnath on Mon, 12/07/2009 - 21:05

While we have been booting from EBS a month after it came out using pivot_root - most of our implementations are based on a couple of AMIs and many different EBS snapshots and volumes. We were nonetheless happy to see Amazon's announcement to allow AMIs to boot from AMIs, it makes some of our scripts much simpler. I put this article together to show migrating an existing Linux AMI to EBS can be a trivial task. 

Once you have the AMI you want to migrate booted up, ssh into the machine. Use the following bootstrap script to prep the machine for running the ami tools and api. The script after the bootstrap will setup a volume snapshot ready to be registered as an AMI.

You will require the following packages, if they are not already installed on the AMI:

    openssh-client 
    openssh-server 
    curl 
    unzip 
    wget 
    rsync 
    parted 
    bc 
    sudo 
    ruby 
    libopenssl-ruby1.8 
    openjdk-6-jre-headless 
 

This script bootstraps your AWS environment, you can skip this if you already have this done, but you will need to modify the next script to match your environment:

cat > aws_bootstrap.sh << \BOOTEOF
#!/bin/bash
#EC2 AMI Tools 
cd /tmp
wget http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip -O ec2-ami-tools.zip
cd /usr/local
unzip /tmp/ec2-ami-tools.zip
ln -s `find . -type d -name ec2-ami-tools-*` ec2-ami-tools
chmod -R go-rwsx ec2*
rm -rf /tmp/ec2*


#EC2 API Tools
cd /tmp
wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
cd /usr/local
unzip /tmp/ec2-api-tools.zip
ln -s `find . -type d -name ec2-api-tools*` ec2-api-tools
chmod -R go-rwsx ec2*
rm -rf /tmp/ec2*


mkdir ~/.aws
cat > ~/.aws/cert.pem <<\EOF
-----BEGIN CERTIFICATE-----
<snip - insert the text from your certificate>
-----END CERTIFICATE-----
EOF
cat > ~/.aws/pk.pem <<\EOF
-----BEGIN PRIVATE KEY-----
<snip - insert the text from your private key>
-----END PRIVATE KEY-----
EOF


cat >~/.aws/aws.sh <<\EOF
#!/bin/bash
export EC2_PRIVATE_KEY=/mnt/ec2/pk.pem
export EC2_CERT=/mnt/ec2/cert.pem
export EC2_AMITOOL_HOME=/usr/local/ec2-ami-tools
export EC2_APITOOL_HOME=/usr/local/ec2-api-tools
export EC2_HOME=/usr/local/ec2-api-tools
export JAVA_HOME=/usr
export AMAZON_USER_ID=<snip!!!>
export AWS_ACCESS_KEY_ID=<snip!!!>
export AWS_SECRET_ACCESS_KEY=<snip!!!>
PATH=$EC2_AMITOOL_HOME/bin:$PATH
EOF
chmod -R 600 ~/.aws
chmod o+x ~/.aws/aws.sh
BOOTEOF



This script does the migration. I could have used rsync instead of ec2-bundle, but this makes sure the resulting image looks like what Amazon is expecting.


cat > migrate2ebs.sh << \MIGEOF
# Change these to suit your environment
vol_size=20
dev=/dev/sdp
desc="My First EBS Migration"
rm -rf /usr/local/ec*


# Call the environment setup script
. ~/.aws/aws.sh


# Get basic info from instance meta-data
instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
avail_zone=`curl -s \
http://169.254.169.254/latest/meta-data/placement/availability-zone`


# Create the Volume
vol=`ec2-create-volume -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -z "$avail_zone"\
--size $vol_size| cut -f2`


# Attach the volume
ec2attvol "$vol" -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -i "$instance_id" -d "$dev"
while [[ "$vol_status" != "attached"  ]];
do
vol_status=`ec2-describe-volumes -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" "$vol"\
| grep ATTACHMENT | cut -f5`
echo Status of "$vol" : $vol_status
done


# Prepare the volume
mkfs.ext3 "$dev"
mkdir -p /vol
mount "$dev" /vol
rm -rf /mnt/image*
rm -rf /mnt/img-mnt


# Use bundle to create a clean image (we will not upload)
ec2-bundle-vol -c $EC2_CERT -k $EC2_PRIVATE_KEY -u $AMAZON_USER_ID \
-e /vol -d /mnt


# take the clean image and install on the EBS Volume
mount -o loop /mnt/image /mnt/img-mnt
rsync -av /mnt/img-mnt/ /vol/


# Set the fstab up 
cat > /vol/etc/fstab << FSTABEOF
#
<file system>                                 <mount
point>   <type>  <options>       <dump> 
<pass>
proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0
/dev/sda2                                       /mnt            ext3    defaults        0       0
FSTABEOF


# Snapshot the volume. Note the snapshot id for the registration step
umount /vol
ec2addsnap -C $EC2_CERT -K $EC2_PRIVATE_KEY -d $desc $vol
MIGEOF
chmod o+x migrate2ebs.sh
Run the scripts, and note the snapshot id from the last step in the script, you'll need it for the AMI registration

./aws_bootstrap.sh
./migrate2ebs.sh

now all that is left to do is register the snapshot created in the last step
ec2-register -n "MyFirstEBSMigration" -s <snapshotid> -b /dev/sda=ephemeral0 --kernel <kernel> --ramdisk <kernel> --root-device-name /dev/sdb


If everything ran successfully, you should have a brand spanking new EBS based AMI that is a mirror of your old AMI.

This works for us, but your mileage might vary! drop me a line via twitter (@ramarnat) if you have questions.






Process for Converting a Linux/UNIX Amazon S3-Backed AMI
http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/index.html?Using_BootFromEBS.html

Copy the AMI's root device information to an Amazon EBS volume. How you do that is up to you.

Create a snapshot of that volume. For more information, see How to Create an Amazon EBS Snapshot.

Register the image with a block device mapping that maps the root device name of your choice to the snapshot you just created. For an example of how to register an image, see Automatically Attaching Volumes.



How to Create an Amazon EBS Snapshot

After writing data to an Amazon EBS volume, you can periodically create a snapshot of the volume to use as a baseline for new volumes or for data backup.

Snapshots occur asynchronously and the status of the volume is "pending" until the snapshot is complete.

By default, only you can launch volumes from your snapshots. However, you can choose to share your snapshots with specific AWS accounts or make them public. For more information, see How to Modify Snapshot Permissions.

Note

If you make periodic snapshots of a volume, the snapshots are incremental so that only the blocks on the device that have changed since your last snapshot are incrementally saved in the new snapshot. Even though snapshots are saved incrementally, the snapshot deletion process is designed so that you need to retain only the most recent snapshot in order to restore the volume.


AWS Management Console

Log in to the AWS Management Console and click the Amazon EC2 tab.
Click Snapshots in the Navigation pane.
The console displays a list of current snapshots.
Click Create Snapshot.
The Create Snapshot dialog box appears.
Select the volume to create a snapshot for and click Create.
Amazon EC2 begins creating the snapshot.

Command Line Tools

To create a snapshot enter the following command:

PROMPT>  ec2-create-snapshot volume_id
Amazon EC2 returns information similar to the following example.

SNAPSHOT        snap-88fe11e0   vol-c7f95aae    pending 2010-03-30T14:10:38+0000        999988887777     800

When the snapshot is complete, its status will change to completed.





Automatically Attaching Volumes

By default, every Amazon EBS-backed AMI has a snapshot associated with it for the root device volume. Whenever you launch an instance of the AMI, that snapshot automatically instantiates and a volume for the root device attaches to the instance.

What if you want other volumes to automatically attach to your instance? You can easily do that by specifying a block device mapping when you register the image. You can register an image using the command line tools or API; you can't use the AWS Management Console. For more information about block device mappings, see Block Device Mapping.

Command Line Tools

You use ec2-register and specify a block device mapping that includes the additional volumes. In the example shown here, you register an AMI and attach two extra volumes (in addition to the root device volume).

To add additional volumes to the AMI

Use the ec2-register command with the block device mapping information. The following example registers an AMI with three volumes (one for the root device, and two extra):

The first is an 80 GiB root device volume at /dev/sda1 created from the snap-12345678 snapshot. The root volume's DeleteOnTermination flag is set to false. Remember that if you specify a size, it must be equal to or larger than the snapshot's size. You can omit a size value and the volume uses the snapshot's size.

The second volume is mapped to /dev/sdh and created from snapshot snap-88888888. The mapping uses the default size of the snapshot and doesn't specify a value for DeleteOnTermination. The default value is true.

The third volume is an empty 40 GiB volume mapped to /dev/sdj. The volume's DeleteOnTermination flag is set to false.

PROMPT>  ec2-register -n My_Image_Name -d My_image_description --root-device-name /dev/sda1 -b /dev/sda1=snap-12345678:80:false -b /dev/sdh=snap-88888888 -b /dev/sdj=:40:false
In response, you get the ID for your new AMI.

IMAGE     ami-61a54008
Any instance of the AMI that you launch includes the three volumes by default.

You can view the AMI's or instance's block device mapping at any time. For more information, see Viewing Block Device Mappings.



Viewing Block Device Mappings

You can get a list of the block devices mapped to an AMI or an instance. The list includes only the Amazon EBS volumes that are mapped to the AMI or instance; no information about local instance storage is provided. For general information about block device mapping, see Block Device Mapping.

AWS Management Console

The devices mapped to an AMI are listed as part of the AMI details displayed in the console. Only the Amazon EBS snapshots mapped to the AMI are listed; no information is displayed for local storage devices that are mapped. The following image shows an AMI's details.


The Block Devices field shows information about the root device's mapping: /dev/sda1=snap-a08912c9:15:true. This means the root device /dev/sda1 is mapped to a 15 GiB volume created from the snap-a08912c9 snapshot, and the volume's DeleteOnTermination flag is true.

The devices mapped to an instance are listed as part of the instance details displayed in the console. Only the Amazon EBS volumes mapped to the instance are listed; no information is displayed for local storage devices that are mapped. The following image shows an instance's details.


The Block Devices field shows information about two different devices. For each device, the following items are displayed:

The device name (e.g., /dev/sda1)

The volume ID (e.g., vol-12345678)

The status of the attachment (e.g., attached)

The time when volume creation was initiated

The DeleteOnTermination value (true or false)

For the example shown in the preceding image, the root device is /dev/sda1 and it's mapped to vol-818843e8. The volume is currently attached and was created on February 22 at 10:36 UTC. The root device volume is set to be deleted when the instance terminates.

The second mapped device is /dev/sdk, and it's mapped to vol-b7ae65de. The volume is currently attached and was created on February 23 at 22:58 UTC. This volume will not be deleted when the instance terminates.

Command Line Tools

You can get information about an AMI's or instance's block device mapping through the command line tools.

To view the block device mapping for an AMI

Use the ec2-describe-images command:

PROMPT>  ec2-describe-images ami_id
Following is an example of the part of the response that includes the block device mapping.

BLOCKDEVICEMAPPING      /dev/sda1               snap-a08912c9   15
This response shows device /dev/sda1 is mapped to a 15 GiB volume created from the snap-a08912c9 snapshot. The response doesn't include the value of the DeleteOnTermination flag. However, if you run the command in verbose mode (i.e., with the -v switch), you can view the underlying XML response, which includes the flag's value.

To view the block device mapping for an instance

Use the ec2-describe-instances command:

PROMPT>  ec2-describe-instances instance_id
Following is an example of the part of the response that includes the block device mapping.

BLOCKDEVICE     /dev/sda1       vol-818843e8    2010-02-22T20:36:18.000Z
BLOCKDEVICE     /dev/sdk        vol-b7ae65de    2010-02-23T22:58:31.000Z
The response shows the ID of the volume mapped to the root device /dev/sda1. The response currently doesn't include the status of the volume's attachment or the value of the DeleteOnTermination flag. However, if you run the command in verbose mode (i.e., with the -v switch), you can view the underlying XML response, which includes that information. For an example, see Changing the Root Volume to Persist.

The second mapped device is /dev/sdk, and it's mapped to vol-b7ae65de. The volume was created on February 23 at 22:58 UTC.



http://www.elastician.com/2009/12/creating-ebs-backed-ami-from-s3-backed.html

FRIDAY, DECEMBER 4, 2009

Creating an EBS-backed AMI from an S3-backed AMI
The recent introduction of Boot From EBS for EC2 opens up a lot of new possibilities.  But there are some bootstrapping issues to deal with.  There aren't many EBS-backed AMI's available yet and, given the rather complex process involved in porting them, it may take a while for them to show up.  This article will walk through the process of converting a popular S3-based AMI to an EBS-backed AMI.  I don't guarantee that this is the best process and I certainly wouldn't recommend that anyone use the resulting EBS-backed AMI for anything other than testing and further development, but it puts a stake in the ground regarding a potential process.  I'm sure I will hear about the shortcomings and possible improvements!

As a starting point, I'm going to use one of Eric Hammond's excellent Ubuntu AMI's.  In particular, I'm going to use:

ami-eef61587 alestic-64/ubuntu-9.04-jaunty-base-64-20091011.manifest.xml

This same basic process should work for other Linux-based AMI's.  The first thing I need to do is fire up an new instance of this AMI.  In addition, I'm going to create a new 10GB EBS volume that will serve as the prototype for my EBS-based AMI.  Here's how I do that using boto:

>>> import boto
>>> c = boto.connect_ec2()
>>> c.get_all_images(['ami-eef61587'])
[Image:ami-eef61587]
>>> img = _[0]
>>> img.run(key_name='cloudright', security_groups=['test1'], instance_type='m1.large')
Reservation:r-0369c96b
>>> inst = _.instances[0]
>>> inst.update()
u'pending'
>>> inst.update()
u'running'
>>> inst.placement
u'us-east-1b'
>>> v = c.create_volume(10, inst.placement)
>>> v.attach(inst.id, '/dev/sdh')
u'attaching'
>>> inst.public_dns_name
u'ec2-67-202-30-28.compute-1.amazonaws.com'

So, at this point I have a new EC2 instance up and running using the S3-based AMI and a new 10GB EBS volume attached to that instance.  Now, I need to login to that new instance and do a bit of work.

$ ssh -i ~/.ssh/cloudright root@ec2-67-202-30-28.compute-1.amazonaws.com
...
root@domU-12-31-39-02-31-51:~# apt-get update
...
root@domU-12-31-39-02-31-51:~# apt-get -y upgrade
...
root@domU-12-31-39-02-31-51:~# apt-get -y install cpipe
...
root@domU-12-31-39-02-31-51:~# mkfs -t ext3 /dev/sdh
mke2fs 1.41.4 (27-Jan-2009)
/dev/sdh is entire device, not just one partition!
Proceed anyway? (y,n) y
...
root@domU-12-31-39-02-31-51:~# mkdir /ebs
root@domU-12-31-39-02-31-51:~# mount -t ext3 /dev/sdh /ebs
root@domU-12-31-39-02-31-51:~# tar cpS / | cpipe -vt -b 1024 | gzip -c | tar zxpS -C /ebs
....
root@domU-12-31-39-02-31-51:~# umount /ebs

So, basically I have ssh'ed into the new instance, run apt-get update and apt-get upgrade to install all of the latest patches, formatted the EBS volume as an EXT3 filesystem, mounted that filesystem as /ebs and then copied the entire contents of the current root volume over to the EBS volume.  Then I unmount the EBS volume.  Now, let's go back to my Python session running on my local machine.

>>> v.detach()
u'detaching'
>>> v.create_snapshot('Initial snapshot for EBS-backed 64-bit Ubuntu 9.04 AMI.')
Snapshot:snap-023ca66b
>>> from boto.ec2.blockdevicemapping import EBSBlockDeviceType, BlockDeviceMapping
>>> ebs = EBSBlockDeviceType()
>>> ebs.snapshot_id = 'snap-023ca66b'
>>> block_map = BlockDeviceMapping()
>>> block_map['/dev/sda1'] = ebs
>>> c.register_image('MG-Ubuntu-9.04-EBS-20091204', 'Testing the creation of EBS-backed Ubuntu AMI.',
architecture='x86_64', kernel_id=img.kernel_id,
ramdisk_id=img.ramdisk_id,
root_device_name='/dev/sda1', block_device_map=block_map)
u'ami-f002e099'

So, here we are detaching the EBS volume and then creating a snapshot of that volume.  Then, we need to import some data structures that will allow us to register a new EBS-based image.  The first data structure is the EBSBlockDeviceType.  There are a number of available fields in that object but the only one we need to worry about is the snapshot_id.  This tells EC2 that when someone wants to start up a new instance of our AMI, EC2 needs to start by creating a new EBS volume from this snapshot.  The second data structure is the BlockDeviceMapping.  It is actually a subclass of a Python dictionary and behaves as you would expect.  We need to add an entry that maps the device name of our root volume (in this case /dev/sda1) to the EBS snapshot.  Finally, we call register_image to create the new AMI.  We pass in a name, a description, the architecture, the kernel and ramdisk (we are just referring to the same ones used by the original S3-backed AMI), the name of our root device (/dev/sda1) and the block device mapping we just created.  EC2 returns with a new AMI id and we can then use that to start new EC2 instances.  Just to verify, let's start up a new instance based on our EBS-backed AMI:

>>> c.run_instances('ami-f002e099', key_name='cloudright', security_groups=['test1'], instance_type='m1.large')
Reservation:r-f175d599
>>> inst2 = _.instances[0]
>>> inst2.update()
u'pending'
>>> inst2.update()
u'running'
>>> inst2.public_dns_name
u'ec2-75-101-218-5.compute-1.amazonaws.com'

Now let's SSH into our new EBS-based instance and make sure everything is okay.

jobs:~ mitch$ ssh -i ~/.ssh/cloudright.pem root@ec2-75-101-218-5.compute-1.amazonaws.com
...
root@domU-12-31-39-06-E1-62:~# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda1             10321208    837672   8959248   9% /
tmpfs                  3935948         0   3935948   0% /lib/init/rw
varrun                 3935948        40   3935908   1% /var/run
varlock                3935948         0   3935948   0% /var/lock
udev                   3935948        72   3935876   1% /dev
tmpfs                  3935948         0   3935948   0% /dev/shm
root@domU-12-31-39-06-E1-62:~# 


I have made this AMI public and available in the us-east-1 region.  Feel free to fire it up and play around with it but be aware that none of the careful testing that accompanies Eric's or Canonical's AMI releases has happened here so it is for illustrative purposes only.



STARCLUSTER COMPUTE CLUSTER EBS AMI
-----------------------------------

** ** **> ABANDONED THIS ATTEMPT WHEN REALISED THAT THE AMI IS A 4 X LARGE COMPUTE CLUSTER


http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/index.html?Using_BootFromEBS.html
ALSO
http://www.full360.com/blogs/Migrating-Linux-S3-Based-AMI-EBS-Based-AMI


IN AWS CONSOLE SELECT

AMIs --> EBS Images --> starcluster



LOWER PANE DISPLAYS AMI INFO:


EC2 Amazon Machine Image: ami-30b84d59

AMI ID: ami-30b84d59
Name: starcluster-CentOS5-HVM-v1.0
Description: StarCluster Cluster Compute Image with PETSc
Source: 076810171851/starcluster-CentOS5-HVM-v1.0
Owner: 076810171851	Visibility: Public	Product Code:
State: available	Kernel ID: -	RAM Disk ID: -
Image Type: machine	Architecture: x86_64	Platform: Cent OS
Root Device Type: ebs	Root Device: /dev/sda1	Image Size: 20 GiB
Block Devices: /dev/sda1=snap-28a0e943:20:true
Virtualization: hvm



NOTE 'Root Device Type' IS 'ebs' AND ROOT DEVICE IS /dev/sda1.

Block Devices field shows information about the root device's mapping:


/dev/sda1=snap-28a0e943:20:true
/dev/sda1=snap-a08912c9:15:true.

This means the root device /dev/sda1 is

    mapped to a 20 GiB volume

    created from the snap-28a0e943 snapshot

and the volume's DeleteOnTermination flag is true.



LAUNCH INSTANCE

Right-click the AMI in the list and click Launch Instance.
The launch wizard starts. Walk through the wizard and launch an instance. If you're using Amazon VPC, make sure to specify the subnet you want to launch the instance into. If you'd like, connect to the instance once it's running.
Go to the Instances page and look at the instance's information. Specifically take note of the instance ID and public DNS.


EC2 Amazon Machine Image: ami-30b84d59 IS A QUADRUPLE LARGE CLUSTER COMPUTE INSTANCE (4 X LARGE) AT $1.60/HOUR!! SKIP THIS AND USE TUTORIALS SMALL EBS-BASED INSTANCE:









US – N. VirginiaUS – N. CaliforniaEU – IrelandAPAC – Singapore
Standard On-Demand Instances	Linux/UNIX Usage	Windows Usage
Small (Default)	$0.085 per hour	$0.12 per hour
Large	$0.34 per hour	$0.48 per hour
Extra Large	$0.68 per hour	$0.96 per hour
Micro On-Demand Instances	Linux/UNIX Usage	Windows Usage
Micro	$0.02 per hour	$0.03 per hour
High-Memory On-Demand Instances	
Extra Large	$0.50 per hour	$0.62 per hour
Double Extra Large	$1.00 per hour	$1.24 per hour
Quadruple Extra Large	$2.00 per hour	$2.48 per hour
High-CPU On-Demand Instances	
Medium	$0.17 per hour	$0.29 per hour
Extra Large	$0.68 per hour	$1.16 per hour
Cluster Compute Instances	
Quadruple Extra Large	$1.60 per hour	N/A*
* Windows is not currently available for Cluster Compute Instances.







</entry>



<entry [Tue Oct 12 08:59:11 EDT 2010] RESIZE RUNNING EBS BOOT INSTANCE>

http://alestic.com/2010/02/ec2-resize-running-ebs-root

Resizing the Root Disk on a Running EBS Boot EC2 Instance

By Eric Hammond on February 10, 2010 7:47 PM | 7 Comments | 1 TrackBack
In a previous article I described how to run an EBS boot AMI with a larger root disk size than the default. That’s fine if you know the size you want before running the instance, but what if you have an EC2 instance already running and you need to increase the size of its root disk without running a different instance?

As long as you are ok with a little down time on the EC2 instance (few minutes), it is possible to change out the root EBS volume with a larger copy, without needing to start a new instance.

Let’s walk through the steps on a sample Ubuntu 9.10 Karmic EBS boot instance. I tested this with ami-6743ae0e but check Alestic.com for the latest AMI ids.

On the instance we check the initial size of the root file system (15 GB):

$ df -h /
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1              15G  675M   14G   5% /
The following commands are all run on a system other than the one we are resizing. Pick a new size (in GB) that is larger than the current size:

<!--
instanceid=<YOURINSTANCEID>
size=20

-->

Get the root EBS volume id and availability zone for this instance:

oldvolumeid=$(ec2-describe-instances $instanceid |
  egrep "^BLOCKDEVICE./dev/sda1" | cut -f3)
zone=$(ec2-describe-instances $instanceid | egrep ^INSTANCE | cut -f12)
echo "instance $instanceid in $zone with original volume $oldvolumeid"
Stop (not terminate!) the instance:

ec2-stop-instances $instanceid
Detach the original volume from the instance:

while ! ec2-detach-volume $oldvolumeid; do sleep 1; done
Create a snapshot of the original volume:

snapshotid=$(ec2-create-snapshot $oldvolumeid | cut -f2)
while ec2-describe-snapshots $snapshotid | grep -q pending; do sleep 1; done
echo "snapshot: $snapshotid"
Create a new volume from the snapshot, specifying a larger size:

newvolumeid=$(ec2-create-volume   --availability-zone $zone       --size $size                    --snapshot $snapshotid |
  cut -f2)
echo "new volume: $newvolumeid"
Attach the new volume to the instance:

ec2-attach-volume          --instance $instanceid   --device /dev/sda1       $newvolumeid
while ! ec2-describe-volumes $volumeid | grep -q attached; do sleep 1; done


Start the instance and find its new public IP address/hostname. (If you were using an elastic IP address, re-assign it to the instance.)

ec2-start-instances $instanceid
while ! ec2-describe-instances $instanceid | grep -q running; do sleep 1; done
ec2-describe-instances $instanceid
Connect to the instance with ssh (not shown) and resize the root file system to fill the new EBS volume:

# ext3 root file system (most common)
sudo resize2fs /dev/sda1

# XFS root file system (less common):
sudo apt-get update && sudo apt-get install -y xfsprogs
sudo xfs_growfs /
Show that the root file system is the new, larger size (20 GB):

$ df -h /
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1              20G  679M   19G   4% /
Delete the old EBS volume and snapshot if you no longer need them, though I recommend you at least keep the snapshot for a while just in case:

ec2-delete-volume $oldvolumeid
ec2-delete-snapshot $snapshotid
Note: Since you manually created the new volume and attached it to the instance yourself, it will not be deleted automatically when the instance is terminated. You can modify the instance attributes to change the delete-on-termination flag for the volume if you wish.

</entry>
<entry [Tue Oct 12 08:58:11 EDT 2010] EC2 USER DATA>

USER DATA
http://docs.amazonwebservices.com/AmazonEC2/dg/2006-10-01/AESDG-chapter-instancedata.html

Categories of Available Data

The data available to instances is categorized into metadata
This data is specific to an instance.

Currently we provide:

AMI id
AMI manifest path
AMI launch index
Instance id
Hostname
Local IPv4 address
Public keys (if supplied at instance launch time)
Reservation id
Security group names (if supplied at instance launch time)


user-supplied data
Any user-supplied data is treated as opaque data: what you give us is what you get back.

Note:

All instances launched together get the same user-supplied data.
**** You may use the AMI launch index metadatum as an index into the data (example). ****
User data is limited to 16K.
The user data must be base64-encoded before being submitted to the API.
The API command-line tools perform the base64-encoding for you.
The data will be base64 decoded before being presented to the instance.





</entry>



<entry [Mon Oct 11 22:45:12 EDT 2010] LAUNCH NEW INSTANCE AND LOAD MYSQL TABLES FROM S3 SNAPSHOT OF EBS>




LAUNCH NEW INSTANCE IN AWS CONSOLE (NB: MUST BE IN SAME REGION!!)

AMI ID          ami-f4fa0e9d
INSTANCE ID     i-b4f205d9



ec2-run-instances

http://docs.amazonwebservices.com/AmazonEC2/dg/2006-10-01/CLTRG-run-instances.html


#ON LINODE (NB: ENVIRONMENT VARIABLES ARE ALL LOADED)
#
#ec2-run-instances \
#ami-f4fa0e9d \
#-t m1.large \
#--region us-east-1 \
#--availability-zone us-east-1a \
#--group ngsdev
#
#Error occurred during initialization of VM
#Could not reserve enough space for object heap
#
#
#RESERVATION     r-a9ba49c3      728213020069    default
#INSTANCE        i-a26c9dcf      ami-f4fa0e9d                    pending         0               m1.large    2010-10-12T03:44:31+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled                                 instance-store
#
#
#
#ec2-describe-instances
#
#    (PENDING -- SAME AS ABOVE -- FOR ONE MINUTE)
#
#
#    RESERVATION     r-a9ba49c3      728213020069    default
#    INSTANCE        i-a26c9dcf      ami-f4fa0e9d    ec2-184-72-85-240.compute-1.amazonaws.com       ip-10-122-61-224.ec2.internal       running         0               m1.large        2010-10-12T03:44:31+0000    us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.85.240       10.122.61.224                   instance-store
#
#
#
#ATTACH EBS VOLUME TO NEW INSTANCE
#
#/root/base/apps/ec2/1.3-57419/bin/ec2-attach-volume \
#vol-6c752005 \
#-i i-a26c9dcf \
#-d /dev/sda
#
#    ATTACHMENT      vol-6c752005    i-a26c9dcf      /dev/sda        attaching       2010-10-12T03:47:09+0000 
#    ####ATTACHMENT      vol-6c752005    i-b4f205d9      /dev/sda        attaching       2010-10-11T07:28:29+0000
#
#
#
#DESCRIBE THE NEW INSTANCE
#
#ec2-describe-instances i-a26c9dcf
#
#    RESERVATION     r-a9ba49c3      728213020069    default
#    INSTANCE        i-a26c9dcf      ami-f4fa0e9d    ec2-184-72-85-240.compute-1.amazonaws.com       ip-10-122-61-224.ec2.internal       running         0               m1.large        2010-10-12T03:44:31+0000    us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.85.240       10.122.61.224                   instance-store                                  paravirtual
#    BLOCKDEVICE     /dev/sda        vol-6c752005    2010-10-12T03:47:08.000Z
#
#    
#    ####RESERVATION     r-abae5fc1      728213020069    ngsdev
#    ####INSTANCE        i-b4f205d9      ami-f4fa0e9d    ec2-75-101-251-195.compute-1.amazonaws.com      ip-10-122-211-240.ec2.internal      running starcluster     0               m1.large        2010-10-11T07:23:38+0000    us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     75.101.251.195      10.122.211.240                  instance-store                                  paravirtual
#    ####BLOCKDEVICE     /dev/sda        vol-6c752005    2010-10-11T07:28:29.000Z
#    ####TAG     instance        i-b4f205d9      Name 
#    
#
#ec2-detach-volume vol-6c752005
#
#ec2-terminate-instances i-a26c9dcf



CONNECT TO NEW INSTANCE


ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-174-129-44-83.compute-1.amazonaws.com
    
         ___   _        __   __   ____            __    
        / _ \ (_)___ _ / /  / /_ / __/____ ___ _ / /___ 
       / , _// // _ `// _ \/ __/_\ \ / __// _ `// // -_)
      /_/|_|/_/ \_, //_//_/\__//___/ \__/ \_,_//_/ \__/ 
               /___/                                                 
                                                  
    Welcome to a public Amazon EC2 image brought to you by RightScale!
Categories of Available Data

The data available to instances is categorized into

metadata
This data is specific to an instance. Currently we provide:
AMI id
AMI manifest path
AMI launch index
Instance id
Hostname
Local IPv4 address
Public keys (if supplied at instance launch time)
Reservation id
Security group names (if supplied at instance launch time)
user-supplied data
Any user-supplied data is treated as opaque data: what you give us is what you get back.
Note:
All instances launched together get the same user-supplied data. You may use the AMI launch index metadatum as an index into the data (example).
User data is limited to 16K.
The user data must be base64-encoded before being submitted to the API. The API command-line tools perform the base64-encoding for you. The data will be base64 decoded before being presented to the instance.
    
    ********************************************************************
    ********************************************************************
    ***       Your EC2 Instance is now operational.                  ***
    ***       All of the configuration has completed.                ***
    ***       Please check /var/log/install for details.             ***
    ********************************************************************
    ********************************************************************



MOUNT EBS VOLUME ON NEW INSTANCE

mkdir /data
mount /dev/sda /data 

    OK!


START MYSQL


/etc/init.d/mysqld start

    Starting MySQL:  [  OK  ]


mysql -u root -p -e 'SHOW DATABASES'

    
    Enter password: 
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema | 
    | mysql              | 
    | test               | 
    | tutorial_sample    | 
    +--------------------+

You are now running MySQL with all of the data and binary log files persistently stored on a high performance, redundant EBS volume!


    OK!




NB: IS RUNNING LOCAL DATA, NOT EBS /data VOLUME DATA BECAUSE *.sock FILE IS IN LOCAL FOLDER

SO FIRST, REMOVE THE LOCAL MYSQL DATA FOLDERS


ll /var/lib/mysql

    -rw-rw---- 1 mysql mysql 10485760 Oct 11 00:46 ibdata1
    -rw-rw---- 1 mysql mysql  5242880 Oct 11 03:39 ib_logfile0
    -rw-rw---- 1 mysql mysql  5242880 Oct 10 23:59 ib_logfile1
    drwx------ 2 mysql mysql     4096 Oct 11 00:43 mysql
    srwxrwxrwx 1 mysql mysql        0 Oct 11 03:39 mysql.sock
    drwx------ 2 mysql mysql     4096 Oct 11 00:43 test
    drwx------ 2 mysql mysql     4096 Oct 11 01:14 tutorial_sample

ll /data/mysql/lib/mysql

    -rw-rw---- 1 mysql mysql 10485760 Oct 11 03:15 ibdata1
    -rw-rw---- 1 mysql mysql  5242880 Oct 11 03:15 ib_logfile0
    -rw-rw---- 1 mysql mysql  5242880 Oct 10 23:59 ib_logfile1
    drwx------ 2 mysql mysql     4096 Oct 11 00:43 mysql
    drwx------ 2 mysql mysql     4096 Oct 11 00:43 test
    drwx------ 2 mysql mysql     4096 Oct 11 01:14 tutorial_sample





Cleanup

Unmount the EBS volume file systems on each of the EC2 instances.

sudo /etc/init.d/mysql stop
sudo umount /etc/mysql /var/lib/mysql /var/log/mysql /vol


ON LINODE, RUN 

The rest of the commands should be run on your local system (which has the EC2 API command line tools installed):


Detach EBS volumes from EC2 instances, delete the volumes, delete the snapshots, and shutdown the instances.

ec2-detach-volume vol-6c752005

ec2-terminate-instances i-b4f205d9

    INSTANCE        i-b4f205d9      running shutting-down


Verify that it's all gone.

ec2-describe-instances
ec2-describe-volumes
ec2-describe-snapshots



NOTES
-----

Setting up an EBS volume on an EC2 instance for use with MySQL (CONT.)

http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1663


Restoring the snapshotted database

So you want to check out the snapshot of your MySQL database to see if it really has the right data. Or, you'd like to test some code on an instance which has nearly current production data without risk to the live production database. Or, you want to start a MySQL replication slave. Or, you need to recover from an unfortunate DELETE statement without a WHERE clause...

We'll start another EC2 instance to run the second database server. It is not necessary to terminate the original instance; both can be running in parallel. The second instance and volume must be together in the same availability zone, though it does not have to be where the first instance/volume reside.



Run a second instance, making a note of the instance id (say, i-IIII2222). Check to see if the instance is running (might take a minute) and make a note of the external hostname (say, HOST2222).

ec2-run-instances -z us-east-1b --key YOURKEYPAIR ami-1515f67c

ec2-describe-instances i-IIII2222



Create a second EBS volume based on the snapshot of the original volume and make a note of the volume id (say, vol-VVVV2222). Check to see if the second volume is available (might take a while).

ec2-create-volume -z us-east-1b --snapshot snap-SSSS1111

ec2-describe-volumes vol-VVVV2222
Once it's available, attach the second EBS volume to the second instance as /dev/sdh

ec2-attach-volume -d /dev/sdh -i i-IIII2222 vol-VVVV2222
Note: If the original instance had crashed or been terminated, we could skip the creation of a second volume from a snapshot and simply attach the original volume to the second instance. The remainder of these instructions would apply just the same for getting up and running with that original volume, though you might want to run xfs_check just before mounting to make sure the file system is in a consistent state after the crash.

Now, hop on to the second instance, install the required software, and mount the attached EBS volume. (The MySQL password does not matter here because we will be using a pre-existing database.) We also make sure the files are owned by mysql, just in case UIDs are different on the new instance.

ssh -i YOURSSHKEYFILE ubuntu@HOST2222

sudo apt-get update && sudo apt-get upgrade -y
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get install -y xfsprogs mysql-server

echo "/dev/sdh /vol xfs noatime 0 0" | sudo tee -a /etc/fstab
sudo mkdir -m 000 /vol
sudo mount /vol

sudo find /vol/{lib,log}/mysql/ ! -user  root -print0 | 
  sudo xargs -0 -r chown mysql
sudo find /vol/{lib,log}/mysql/ ! -group root -a ! -group adm -print0 |
  sudo xargs -0 -r chgrp mysql
Point MySQL to the correct database files on the EBS volume.

sudo /etc/init.d/mysql stop

echo "/vol/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
sudo mount /etc/mysql

echo "/vol/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/lib/mysql

echo "/vol/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/log/mysql

sudo /etc/init.d/mysql start
You now have a second machine running against an exact copy of the first database at the time of the snapshot. Imagine the possibilities and smile!

You can verify this by looking for the "tutorial_sample" database you created earlier.

mysql -u root -p -e 'SHOW DATABASES'
Note: Each of these instances has mounted a different volume and is using a different set of database files. Though they would have started out sharing similar values in the database, any changes made in one will not be reflected in the other.



CLEANUP


If you followed the above steps, you will have created resources which will continue to be charged against your EC2 account until you release them. Here are the steps to shut down and delete everything created in this tutorial. The first commands run on the instances:

Unmount the EBS volume file systems on each of the EC2 instances.

sudo /etc/init.d/mysql stop
sudo umount /etc/mysql /var/lib/mysql /var/log/mysql /vol


ON LINODE, RUN 
The rest of the commands should be run on your local system (which has the EC2 API command line tools installed):

Detach EBS volumes from EC2 instances, delete the volumes, delete the snapshots, and shutdown the instances.

ec2-detach-volume vol-VVVV1111
ec2-detach-volume vol-VVVV2222

ec2-delete-volume vol-VVVV1111
ec2-delete-volume vol-VVVV2222

ec2-delete-snapshot snap-SSSS1111

ec2-terminate-instances i-IIII1111
ec2-terminate-instances i-IIII2222
Verify that it's all gone.

ec2-describe-instances
ec2-describe-volumes
ec2-describe-snapshots







Amazon EC2 boot from EBS

http://vinf.net/2009/12/04/amazon-ec2-boot-from-ebs/


December 4, 2009
This is a much wanted feature, I haven’t checked yet – but if this is allowed for Windows instances I can see a whole heap of new use-cases in my work – check it out – this is akin to boot from SAN in a traditional infrastructure and allows for persistent OS images to be kept around when they are not running on EC2.

official announcement..

Amazon EC2 Boot from Amazon EBS

Amazon EC2 has also announced the ability to boot instances directly from Amazon EBS snapshots, providing significantly increased flexibility in how customers can manage their instances. You can still save an Amazon Machine Image (AMI) in an Amazon S3 bucket and boot it from the local instance store, but you can now also choose to save AMIs as Amazon EBS snapshots and boot directly from an Amazon EBS volume. When an instance is booted from an Amazon EBS snapshot, the root partition of the instance is created on an Amazon EBS volume. Instances booted from Amazon EBS volumes can be stopped and later restarted, preserving any of the state that is saved to your volume and allowing you to modify some properties of your instances while it is stopped. For example, you can change your instance size or update the kernel it is using, or attach your root partition to a different running instance, making it easier to do debugging when you are creating new boot images. When booting from an Amazon EBS volume, AMIs and root partitions are no longer limited to 10GB, but can be up to 1TB in size, enabling significantly more complex images. Additionally, you are not charged for stopped instance hours and you will only incur charges for your Amazon EBS volumes while your instance is stopped, allowing you to reduce your Amazon EC2 costs when you do not need your instances running. Customers can now use a newly launched API that makes it easy to bundle images without using the command line tools, and can also take advantage of the fact that the content of an Amazon EBS volume is available to the instance immediately on volume creation which can lead to much faster instance boot times. For more details on this new addition to Amazon EC2, please see the Boot from Amazon EBS Feature Guide.





</entry>



<entry [Mon Oct 11 22:45:12 EDT 2010] TRANSFER DATA BETWEEN EC2 AND S2 WITH s3cmd AND s3sync>




http://developer.mindtouch.com/en/kb/Deploying_MindTouch_on_Amazon_EC2

6- Transferring data between EC2 and S3.

Note that data transfers from EC2 to S3 are free of charge.

For managing your S3 storage, you might also consider using the S3fox extension for Firefox.


You can transfer data between EC2 and your local network without problem as you have all the standard tools available (SCP, FTP, etc.). Moreover, SCP (or PSCP) is already configured to use public key authentication which makes it even easier.


For using Amazon S3, the MindTouch image provides the "s3cmd" and "s3sync" commands.

- Set your environment :
export AWS_ACCESS_KEY_ID=your_access_key_id
export AWS_SECRET_ACCESS_KEY=your_secret_access_key

- How to use "s3cmd" command :
[root@domU-xx-xx:~] s3cmd -h
s3cmd [options] <command> [arg(s)]              version 1.0.6
  --help    -h        --verbose     -v     --dryrun    -n
  --ssl     -s        --debug       -d     --progress

Commands:
s3cmd  listbuckets  [headers]
s3cmd  createbucket|deletebucket  <bucket>  [headers]
s3cmd  list  <bucket>[:prefix]  [max/page]  [delimiter]  [headers]
s3cmd  delete  <bucket>:key  [headers]
s3cmd  deleteall  <bucket>[:prefix]  [headers]
s3cmd  get|put  <bucket>:key  <file>  [headers]


How to use "s3sync" command :


[root@domU-xx-xx:~] s3sync -h
s3sync [options] <source> <destination>         version 1.1.4
  --help    -h          --verbose     -v     --dryrun    -n
  --ssl     -s          --recursive   -r     --delete
  --public-read -p      --expires="<exp>"    --cache-control="<cc>"
  --exclude="<regexp>"  --progress           --debug   -d           
One of <source> or <destination> must be of S3 format, the other a local path.

Examples: (using S3 bucket 'bucket' and prefix 'pre')
  Put the local etc directory itself into S3
        s3sync  -r  /etc  bucket:pre
        (This will yield S3 keys named  pre/etc/...)
  Put the contents of the local /etc dir into S3, rename dir:
        s3sync  -r  /etc/  bucket:pre/etcbackup
        (This will yield S3 keys named  pre/etcbackup/...)
  Put contents of S3 "directory" etc into local dir
        s3sync  -r  bucket:pre/etc/  /root/etcrestore
        (This will yield local files at  /root/etcrestore/...)
  Put the contents of S3 "directory" etc into a local dir named etc
        s3sync  -r  bucket:pre/etc  /root
        (This will yield local files at  /root/etc/...)



</entry>



<entry [Mon Oct 11 00:21:42 2010] RUN MYSQL FROM EBS ON STARCLUSTER (USING RUNNING INSTANCE OF STARCLUSTER CREATED EARLIER)>



http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1663

1. STARTED INSTANCE FROM ELASTICFOX AND CREATED 40GB EBS VOLUME 

AMI NAME            ami-74b65c1d
INSTANCE ID         i-08798d65
PUBLIC DNS NAME     ec2-184-72-207-199.compute-1.amazonaws.com
PRIVATE DNS NAME    ip-10-122-189-75.ec2.internal
PRIVATE IP          10.122.189.75

EBS VOLUME ID       vol-6c752005


AWS AUTHENTICATION
------------------

AWS Account ID:	7282-1302-0069
Canonical User ID:	f30462040ebba8804e2f9ca67a71a93ac44015e835cf6c0f71d1710f8cbfaddb

access key id
AKIAIZXZ6S7ARZ44TTHQ

secret access key
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

aws Key Pair Name: agua
Fingerprint: 61:2d:42:13:55:92:09:bb:a9:8c:fa:17:69:29:ae:39:b5:76:d9:82

PUBLIC AND PRIVATE KEYPAIR

-k /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 
-c /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 


DESCRIBE THE INSTANCE

ec2-describe-instances i-08798d65 \
-K /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-C /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 

    RESERVATION     r-3773855d      728213020069    default
    INSTANCE        i-08798d65      ami-74b65c1d    ec2-184-72-207-199.compute-1.amazonaws.com      ip-10-122-189-75.ec2.internal       running agua    0               m1.large        2010-10-11T03:27:05+0000    us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.207.199      10.122.189.75                   instance-store                                  paravirtual
    BLOCKDEVICE     /dev/sda        vol-6c752005    2010-10-11T03:38:55.000Z




CHECK LATEST VERSION OF MYSQL IS INSTALLED

yum install mysql-server

    Package mysql-server-5.0.77-4.el5_5.3.x86_64 already installed and latest version
    Nothing to do


SET MYSQL TO RUN ON BOOT
Use the chkconfig command to setup runlevels as needed.

/sbin/chkconfig --levels 235 mysqld on



START MYSQL AS ROOT:

/etc/init.d/mysqld start

    Initializing MySQL database:  Installing MySQL system tables...
    OK
    Filling help tables...
    OK
    
    To start mysqld at boot time you have to copy
    support-files/mysql.server to the right place for your system
    
    PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
    To do so, start the server, then issue the following commands:
    /usr/bin/mysqladmin -u root password 'new-password'
    /usr/bin/mysqladmin -u root -h ip-10-122-189-75 password 'new-password'
    
    Alternatively you can run:
    /usr/bin/mysql_secure_installation
    
    which will also give you the option of removing the test
    databases and anonymous user created by default.  This is
    strongly recommended for production servers.
    
    See the manual for more instructions.
    
    You can start the MySQL daemon with:
    cd /usr ; /usr/bin/mysqld_safe &
    
    You can test the MySQL daemon with mysql-test-run.pl
    cd mysql-test ; perl mysql-test-run.pl
    
    Please report any problems with the /usr/bin/mysqlbug script!
    
    The latest information about MySQL is available on the web at
    http://www.mysql.com
    Support MySQL by buying support/licenses at http://shop.mysql.com
    [  OK  ]
    Starting MySQL:  [  OK  ]


ps aux | grep mysql
    
    root      1474  0.0  0.0 115208  6980 pts/0    T    00:35   0:00 emacs mysql.txt
    root      1477  0.0  0.0 115224  6988 pts/0    T    00:37   0:00 emacs /opt/rightscale/etc/mysql/my-dedicated-innodb.cnf
    root      1481  0.0  0.0 115220  6996 pts/0    T    00:38   0:00 emacs /opt/rightscale/etc/mysql/my-dedicated.cnf
    root      1483  0.0  0.0 115224  6996 pts/0    T    00:38   0:00 emacs /opt/rightscale/etc/mysql/my-shared.cnf
    root      1648  0.0  0.0  63784  1288 pts/0    S    00:43   0:00 /bin/sh /usr/bin/mysqld_safe --datadir=/var/lib/mysql --socket=/var/lib/mysql/mysql.sock --log-error=/var/log/mysqld.log --pid-file=/var/run/mysqld/mysqld.pid --user=mysql
    mysql     1698  0.0  0.3 188536 24140 pts/0    Sl   00:43   0:00 /usr/libexec/mysqld --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/var/run/mysqld/mysqld.pid --skip-external-locking --socket=/var/lib/mysql/mysql.sock


mysql

    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 2
    Server version: 5.0.77 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> exit
    Bye



SET MYSQL ROOT PASSWORD

/usr/bin/mysqladmin -u root password open4root
/usr/bin/mysqladmin -u root -h ip-10-122-189-75 password open4root

    /usr/bin/mysqladmin: connect to server at 'ip-10-122-189-75' failed
    error: 'Host 'ip-10-122-189-75.ec2.internal' is not allowed to connect to this MySQL server'

/usr/bin/mysqladmin -u root -h localhost password open4root


TRIED THIS BUT STILL GOT ABOVE ERROR:

GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost'
IDENTIFIED BY 'open4root' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'ip-10-122-189-75'
IDENTIFIED BY 'open4root' WITH GRANT OPTION;

FLUSH PRIVILEGES;


CONFIGURE MySQL TO USE THE EBS VOLUME
(put the MySQL database on the EBS volume and tell MySQL where it is)


1. STOP MYSQL


/etc/init.d/mysqld stop
ps aux | grep mysql

    OK




2. Move the existing database files to the EBS volume.

mkdir /data/mysql

mkdir /data/mysql/etc /data/mysql/lib /data/mysql/log

#### mv /etc/mysql     /data/mysql/etc/     #### /etc/msyql NOT FOUND
#### mv /var/log/mysql /data/mysql/log/     #### /var/log/mysql NOT FOUND
mkdir -p /data/mysql/etc/mysql
mkdir -p /data/mysql/log/mysql
mv /var/lib/mysql /data/mysql/lib/

mkdir /etc/mysql
mkdir /var/lib/mysql
mkdir /var/log/mysql



USE bind AND mount TO MIRROR NEW LOCATIONS IN OLD FOLDERS
Point MySQL to the correct database files on the EBS volume using mount bind.


echo "/data/mysql/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab

    /data/mysql/etc/mysql /etc/mysql     none bind

mount /etc/mysql

echo "/data/mysql/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
mount /var/lib/mysql

echo "/data/mysql/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
mount /var/log/mysql



RESTART MYSQL

/etc/init.d/mysqld start


/etc/init.d/mysqld start

    Starting MySQL:  [  OK  ]


tail -f /var/log/mysqld.log 

    101011 01:14:07  mysqld started
    101011  1:14:07  InnoDB: Started; log sequence number 0 43655
    101011  1:14:07 [Note] /usr/libexec/mysqld: ready for connections.
    Version: '5.0.77'  socket: '/var/lib/mysql/mysql.sock'  port: 3306  Source distribution


You are now running MySQL with all of the data and binary log files persistently stored on a high performance, redundant EBS volume!

    OK!



To prove to yourself that a later snapshot saved your database changes, you might want to load some data or simply create a placeholder database with a SQL statement like:

mysql -u root -p -e 'CREATE DATABASE tutorial_sample'

Enter password: 
[root@ip-10-122-189-75 etc]# mysql 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.0.77 Source distribution

Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema | 
| mysql              | 
| test               | 
| tutorial_sample    | 
+--------------------+
4 rows in set (0.00 sec)


    OK!
    
Your data is pretty safe here, but let's make it even safer with snapshot backups.




SNAPSHOT THE DATABASE

Snapshotting the database

An EBS snapshot is a point in time copy of the complete EBS volume. It will save the current state of all files that were placed on that volume at a block level including the MySQL database data and binary logs. Snapshots are saved to Amazon S3 which is even more secure than EBS in that it is archived in multiple geographic locations.

Since file systems and databases often have things in memory on their way to disk and active processes can be changing the state of the disk so that it isn't always entirely consistent with itself, we take pains to flush, lock, and freeze the database and the file system for the few moments that it takes to create the EBS snapshot. This may cause a slight pause in activity on that system, but if the process is automated, it tends to be sufficiently short that most folks won't notice.

To be able to type all the required commands in a single connection to the EC2 instance, this example uses the mysql "SYSTEM" statement to run command line programs, but these commands don't really have to be run from inside MySQL to be effective.

Start a MySQL session on the instance, using the password you set above.





Note: If all of your tables use the InnoDB engine, then you may skip the LOCK/UNLOCK statements above. MySQL will restore the database to a consistent state when it is run against the binary backup.




ON LINODE, CREATE SNAPSHOT OF EBS VOLUME

On your local system (which has the EC2 API command line tools installed) create a snapshot of the EBS volume. Make a note of the snapshot id (say, snap-SSSS1111).

ec2-create-snapshot vol-6c752005


    SNAPSHOT        snap-d70afbbd   vol-6c752005    pending 2010-10-11T05:37:50+0000                728213020069        40


####FLUSH TABLES AND ACQUIRE LOCK ON MYSQL
####
####In the mysql session, flush the tables to disk and acquire a lock.
####Flush the file system to disk and freeze it.
####Do not exit the MySQL session or you will lose the lock and snapshot potentially inconsistent database files!
####
####FLUSH TABLES WITH READ LOCK;
####SHOW MASTER STATUS;
####SYSTEM sudo xfs_freeze -f /data
####
####    sudo: xfs_freeze: command not found
####    
######## Note: The output from SHOW MASTER STATUS can be handy if you later want to start a slave database from the snapshot.


#### UNLOCK MYSQL
####Back in the same MySQL session on the instance, unfreeze the file system, release the database lock, and you're done!
####
####SYSTEM sudo xfs_freeze -u /vol
####
####    sudo: xfs_freeze: command not found
####    
####UNLOCK TABLES; 
####EXIT



You can monitor the progress of the snapshot with this command:

ec2-describe-snapshots snap-6c752005


Note: If you have a busy database with some long running statements, then acquiring a database lock may be difficult without interfering with operations. However, if all of your tables use the InnoDB engine, then you may skip the LOCK/UNLOCK statements above. MySQL will restore the database to a consistent state when it is run against the binary backup.




BUNDLE starcluster INSTANCE AND SAVE TO S3


CREATE BUCKET IN S3 USING AWS MANAGEMENT CONSOLE

starcluster-1


COPIED KEYPAIR FILES TO RUNNING STARCLUSTER INSTANCE

/data/base/apps/ec2/keypair


ON THE STARCLUSTER INSTANCE, BUNDLE THE AMI


STOP MYSQL

/etc/init.d/mysql stop

BUNDLE AMI

ec2-bundle-vol \
-d /data \
-k /data/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-c /data/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-u 728213020069 \
-r x86_64

    Copying / into the image file /data/image...
    Excluding: 
             /sys
             /var/log/mysql
             /var/lib/mysql
             /proc
             /etc/mysql
             /dev/pts
             /proc/sys/fs/binfmt_misc
             /dev
             /media
             /mnt
             /proc
             /sys
             /data/image
             /mnt/img-mnt
    1+0 records in
    1+0 records out
    1048576 bytes (1.0 MB) copied, 0.007475 seconds, 140 MB/s
    mke2fs 1.39 (29-May-2006)
    Bundling image file...
    Splitting /data/image.tar.gz.enc...
    Created image.part.000
    Created image.part.001
    Created image.part.002
    Created image.part.003
    ...
    Created image.part.111
    Created image.part.112
    Generating digests for each part...
    Digests generated.
    Unable to read instance meta-data for product-codes
    Creating bundle manifest...
    ec2-bundle-vol complete.

cd /data
ll

    -rw-r--r-- 1 root root 10737418240 Oct 11 01:53 image
    -rw-r--r-- 1 root root       17586 Oct 11 02:03 image.manifest.xml
    -rw-r--r-- 1 root root    10485760 Oct 11 02:03 image.part.000
    -rw-r--r-- 1 root root    10485760 Oct 11 02:03 image.part.001
    -rw-r--r-- 1 root root    10485760 Oct 11 02:03 image.part.002
    -rw-r--r-- 1 root root    10485760 Oct 11 02:03 image.part.003
    -rw-r--r-- 1 root root    10485760 Oct 11 02:03 image.part.004
    -rw-r--r-- 1 root root    10485760 Oct 11 02:03 image.part.005
    ...
    -rw-r--r-- 1 root root    10485760 Oct 11 02:03 image.part.110
    -rw-r--r-- 1 root root    10485760 Oct 11 02:03 image.part.111
    -rw-r--r-- 1 root root     7533040 Oct 11 02:03 image.part.112



UPLOAD AMI

ec2-upload-bundle \
-b starcluster-1 \
-m /data/image.manifest.xml \
-a AKIAIZXZ6S7ARZ44TTHQ \
-s 4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6

    Uploading bundled image parts to the S3 bucket starcluster-1 ...
    Uploaded image.part.000
    Uploaded image.part.001
    Uploaded image.part.002
    Uploaded image.part.003
    ...
    Uploaded image.part.112
    Uploading manifest ...
    Uploaded manifest.
    Bundle upload completed.




REDO EXCLUDING THE /data FOLDER


CREATE BUCKET IN S3

export  AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
export  AWS_SECRET_ACCESS_KEY=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

s3cmd createbucket starcluster-2

    OK!

NB: OTHER s3cmd COMMANDS:
  
    s3cmd  listbuckets  [headers]
    s3cmd  createbucket  <bucket>  [constraint (i.e. EU)]
    s3cmd  deletebucket  <bucket>  [headers]
    s3cmd  list  <bucket>[:prefix]  [max/page]  [delimiter]  [headers]
    s3cmd  location  <bucket> [headers]
    s3cmd  delete  <bucket>:key  [headers]
    s3cmd  deleteall  <bucket>[:prefix]  [headers]
    s3cmd  get|put  <bucket>:key  <file>  [headers]



BUNDLE INSTANCE

mkdir /data/starcluster

ec2-bundle-vol \
-d /data/starcluster \
-k /data/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-c /data/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-u 728213020069 \
-r x86_64 \
--all \
-e /data

    Copying / into the image file /data/starcluster/image...
    Excluding: 
             /dev
             /media
             /mnt
             /proc
             /sys
             /data
             /data/starcluster/image
             /mnt/img-mnt
    1+0 records in
    1+0 records out
    1048576 bytes (1.0 MB) copied, 0.001788 seconds, 586 MB/s
    mke2fs 1.39 (29-May-2006)
    ...
    Created image.part.103
    Created image.part.104
    Generating digests for each part...
    Digests generated.
    Unable to read instance meta-data for product-codes
    Creating bundle manifest...
    ec2-bundle-vol complete.



UPLOAD BUNDLE

time ec2-upload-bundle \
-b starcluster-2 \
-m /data/starcluster/image.manifest.xml \
-a AKIAIZXZ6S7ARZ44TTHQ \
-s 4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6

    Uploading bundled image parts to the S3 bucket starcluster-2 ...
    Uploaded image.part.000
    Uploaded image.part.001
    ...
    Uploaded image.part.103
    Uploaded image.part.104
    Uploading manifest ...
    Uploaded manifest.
    Bundle upload completed.
    
    real    3m8.680s
    user    0m7.054s
    sys     0m3.495s



REGISTER AMI

time ec2-register starcluster-2/image.manifest.xml \
-K /data/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-C /data/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
--name starcluster-2


    IMAGE   ami-f4fa0e9d

    real    0m7.684s
    user    0m4.265s
    sys     0m0.117s


    
SHUT DOWN PREVIOUS INSTANCE IN AWS CONSOLE

    Broadcast message from root (Mon Oct 11 03:15:17 2010):
    
    The system is going down for system halt NOW!
    Connection to ec2-184-72-207-199.compute-1.amazonaws.com closed by remote host.
    Connection to ec2-184-72-207-199.compute-1.amazonaws.com closed.
    

LAUNCH NEW INSTANCE IN AWS CONSOLE (NB: MUST BE IN SAME REGION!!)

AMI ID          ami-f4fa0e9d
INSTANCE ID     i-b4f205d9





ATTACH EBS VOLUME TO NEW INSTANCE

/root/base/apps/ec2/1.3-57419/bin/ec2-attach-volume \
vol-6c752005 \
-i i-b4f205d9 \
-d /dev/sda

    ATTACHMENT      vol-6c752005    i-b4f205d9      /dev/sda        attaching       2010-10-11T07:28:29+0000
 



DESCRIBE THE NEW INSTANCE

ec2-describe-instances i-b4f205d9
    
    RESERVATION     r-abae5fc1      728213020069    ngsdev
    INSTANCE        i-b4f205d9      ami-f4fa0e9d    ec2-75-101-251-195.compute-1.amazonaws.com      ip-10-122-211-240.ec2.internal      running starcluster     0               m1.large        2010-10-11T07:23:38+0000    us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     75.101.251.195      10.122.211.240                  instance-store                                  paravirtual
    BLOCKDEVICE     /dev/sda        vol-6c752005    2010-10-11T07:28:29.000Z
    TAG     instance        i-b4f205d9      Name 
    

CONNECT TO NEW INSTANCE


ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-75-101-251-195.compute-1.amazonaws.com
    
         ___   _        __   __   ____            __    
        / _ \ (_)___ _ / /  / /_ / __/____ ___ _ / /___ 
       / , _// // _ `// _ \/ __/_\ \ / __// _ `// // -_)
      /_/|_|/_/ \_, //_//_/\__//___/ \__/ \_,_//_/ \__/ 
               /___/                                                 
                                                  
    Welcome to a public Amazon EC2 image brought to you by RightScale!
    
    ********************************************************************
    ********************************************************************
    ***       Your EC2 Instance is now operational.                  ***
    ***       All of the configuration has completed.                ***
    ***       Please check /var/log/install for details.             ***
    ********************************************************************
    ********************************************************************



MOUNT EBS VOLUME ON NEW INSTANCE

mkdir /data
mount /dev/sda /data 

    OK!


START MYSQL


/etc/init.d/mysqld start

    Starting MySQL:  [  OK  ]


mysql -u root -p -e 'SHOW DATABASES'

    
    Enter password: 
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema | 
    | mysql              | 
    | test               | 
    | tutorial_sample    | 
    +--------------------+

You are now running MySQL with all of the data and binary log files persistently stored on a high performance, redundant EBS volume!


    OK!




NB: IS RUNNING LOCAL DATA, NOT EBS /data VOLUME DATA BECAUSE *.sock FILE IS IN LOCAL FOLDER

SO FIRST, REMOVE THE LOCAL MYSQL DATA FOLDERS


ll /var/lib/mysql

    -rw-rw---- 1 mysql mysql 10485760 Oct 11 00:46 ibdata1
    -rw-rw---- 1 mysql mysql  5242880 Oct 11 03:39 ib_logfile0
    -rw-rw---- 1 mysql mysql  5242880 Oct 10 23:59 ib_logfile1
    drwx------ 2 mysql mysql     4096 Oct 11 00:43 mysql
    srwxrwxrwx 1 mysql mysql        0 Oct 11 03:39 mysql.sock
    drwx------ 2 mysql mysql     4096 Oct 11 00:43 test
    drwx------ 2 mysql mysql     4096 Oct 11 01:14 tutorial_sample

ll /data/mysql/lib/mysql

    -rw-rw---- 1 mysql mysql 10485760 Oct 11 03:15 ibdata1
    -rw-rw---- 1 mysql mysql  5242880 Oct 11 03:15 ib_logfile0
    -rw-rw---- 1 mysql mysql  5242880 Oct 10 23:59 ib_logfile1
    drwx------ 2 mysql mysql     4096 Oct 11 00:43 mysql
    drwx------ 2 mysql mysql     4096 Oct 11 00:43 test
    drwx------ 2 mysql mysql     4096 Oct 11 01:14 tutorial_sample





Cleanup

Unmount the EBS volume file systems on each of the EC2 instances.

sudo /etc/init.d/mysql stop
sudo umount /etc/mysql /var/lib/mysql /var/log/mysql /vol


ON LINODE, RUN 

The rest of the commands should be run on your local system (which has the EC2 API command line tools installed):


Detach EBS volumes from EC2 instances, delete the volumes, delete the snapshots, and shutdown the instances.

ec2-detach-volume vol-6c752005

ec2-terminate-instances i-b4f205d9

    INSTANCE        i-b4f205d9      running shutting-down


Verify that it's all gone.

ec2-describe-instances
ec2-describe-volumes
ec2-describe-snapshots


ec2-describe-instances

    RESERVATION     r-3773855d      728213020069    default
    INSTANCE        i-08798d65      ami-74b65c1d                    terminated      agua    0          m1.large 2010-10-11T03:27:05+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled                                 instance-store                                  paravirtual
    RESERVATION     r-a1a657cb      728213020069    ngsdev
    INSTANCE        i-508c7b3d      ami-f4fa0e9d                    terminated      starcluster     0  m1.large 2010-10-11T07:04:57+0000        us-east-1d      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled                                 instance-store                                  paravirtual
    TAG     instance        i-508c7b3d      Name    starcluster-2
    RESERVATION     r-abae5fc1      728213020069    ngsdev
    INSTANCE        i-b4f205d9      ami-f4fa0e9d                    terminated      starcluster     0  m1.large 2010-10-11T07:23:38+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled                                 instance-store                                  paravirtual
    TAG     instance        i-b4f205d9      Name

ec2-describe-volumes

    VOLUME  vol-6c752005    40              us-east-1a      available       2010-08-25T20:12:52+0000
    TAG     volume  vol-6c752005    Name    mysql


ec2-describe-snapshots
    SNAPSHOT        snap-14dcc67f   vol-6c752005    completed       2010-10-04T19:03:08+0000        100728213020069     40      starcluster
    SNAPSHOT        snap-d70afbbd   vol-6c752005    completed       2010-10-11T05:37:50+0000        100728213020069     40


NOTES
-----

Setting up an EBS volume on an EC2 instance for use with MySQL

http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1663


To get started, we'll run an EC2 instance, create an EBS volume, and attach the volume to the instance. You can run the instance in any availability zone, just make sure to create the volume in the same zone so it can be attached to the instance.

As mentioned in the previous section, we assume that you have installed the EC2 API command line tools on your local system.

Run an instance of Ubuntu 9.10 Karmic base install specifying your ssh keypair name. Make a note of the instance id (say, i-IIII1111). Check to see if the instance is running (might take a minute) and make a note of the external hostname (say, HOST1111).

ec2-run-instances -z us-east-1a --key YOURKEYPAIR ami-1515f67c

ec2-describe-instances i-IIII1111
Create a new 10 GB EBS volume and make a note of the volume id (say, vol-VVVV1111). Check to see if the new volume is available (might take a few seconds).

ec2-create-volume -z us-east-1a -s 10

ec2-describe-volumes vol-VVVV1111
Once it's available, attach the EBS volume to the instance as /dev/sdh

ec2-attach-volume -d /dev/sdh -i i-IIII1111 vol-VVVV1111
Now we can set things up on the instance itself, so connect to it and install the necessary software on the instance. Enter and record a secure MySQL root password when prompted.

ssh -i YOURSSHKEYFILE ubuntu@HOST1111

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y xfsprogs mysql-server
Create an XFS file system on the EBS volume and mount it as /vol

grep -q xfs /proc/filesystems || sudo modprobe xfs
sudo mkfs.xfs /dev/sdh

echo "/dev/sdh /vol xfs noatime 0 0" | sudo tee -a /etc/fstab
sudo mkdir -m 000 /vol
sudo mount /vol
You now have a 10 GB (or whatever size you specified) EBS volume mounted under /vol with an XFS file system, and it will be automatically mounted if the instance reboots.

Anything you store under /vol (including MySQL files) will persist beyond the life of the current instance, and you can take snapshots of this volume for backup or replication.


Configuring MySQL to use the EBS volume

Now that we have an EBS volume mounted on the instance with a good file system, let's put the MySQL database on that volume and tell MySQL where it is.
Stop the MySQL server.

sudo /etc/init.d/mysql stop

Move the existing database files to the EBS volume. Point MySQL to the correct database files on the EBS volume using mount bind.

sudo mkdir /vol/etc /vol/lib /vol/log
sudo mv /etc/mysql     /vol/etc/
sudo mv /var/lib/mysql /vol/lib/
sudo mv /var/log/mysql /vol/log/

sudo mkdir /etc/mysql
sudo mkdir /var/lib/mysql
sudo mkdir /var/log/mysql

echo "/vol/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
sudo mount /etc/mysql

echo "/vol/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/lib/mysql

echo "/vol/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/log/mysql
Restart the MySQL server.

sudo /etc/init.d/mysql start
You are now running MySQL with all of the data and binary log files persistently stored on a high performance, redundant EBS volume!

To prove to yourself that a later snapshot saved your database changes, you might want to load some data or simply create a placeholder database with a SQL statement like:

mysql -u root -p -e 'CREATE DATABASE tutorial_sample'
Your data is pretty safe here, but let's make it even safer with snapshot backups.

Snapshotting the database

An EBS snapshot is a point in time copy of the complete EBS volume. It will save the current state of all files that were placed on that volume at a block level including the MySQL database data and binary logs. Snapshots are saved to Amazon S3 which is even more secure than EBS in that it is archived in multiple geographic locations.

Since file systems and databases often have things in memory on their way to disk and active processes can be changing the state of the disk so that it isn't always entirely consistent with itself, we take pains to flush, lock, and freeze the database and the file system for the few moments that it takes to create the EBS snapshot. This may cause a slight pause in activity on that system, but if the process is automated, it tends to be sufficiently short that most folks won't notice.

To be able to type all the required commands in a single connection to the EC2 instance, this example uses the mysql "SYSTEM" statement to run command line programs, but these commands don't really have to be run from inside MySQL to be effective.

Start a MySQL session on the instance, using the password you set above.

mysql -u root -p
In the mysql session, flush the tables to disk and acquire a lock. Flush the file system to disk and freeze it. Do not exit the MySQL session or you will lose the lock and snapshot potentially inconsistent database files!

FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
SYSTEM sudo xfs_freeze -f /vol
Note: The output from SHOW MASTER STATUS can be handy if you later want to start a slave database from the snapshot.

On your local system (which has the EC2 API command line tools installed) create a snapshot of the EBS volume. Make a note of the snapshot id (say, snap-SSSS1111).

ec2-create-snapshot vol-VVVV1111
Back in the same MySQL session on the instance, unfreeze the file system, release the database lock, and you're done!

SYSTEM sudo xfs_freeze -u /vol
UNLOCK TABLES; 
EXIT
Though the ec2-create-snapshot command returns quickly, the actual snapshot may take a while to complete writing to S3. Have no fear, it will be consistent as of the time the snapshot was initiated above and no further database or disk writes on the instance will affect it.

You can monitor the progress of the snapshot with this command:

ec2-describe-snapshots snap-SSSS1111
Note: If you have a busy database with some long running statements, then acquiring a database lock may be difficult without interfering with operations. However, if all of your tables use the InnoDB engine, then you may skip the LOCK/UNLOCK statements above. MySQL will restore the database to a consistent state when it is run against the binary backup.

Automated snapshot program

The above sequence of MySQL statements and shell commands can be a bit of a hassle when performed manually, not to mention that database activity will be blocked while you are typing, so...

The ec2-consistent-snapshot program automates the appropriate flushing and locking of MySQL and XFS file systems while the EBS snapshot is initiated. To install this on Ubuntu, use the following steps:

codename=$(lsb_release -cs)
echo "deb http://ppa.launchpad.net/alestic/ppa/ubuntu $codename main"|
  sudo tee /etc/apt/sources.list.d/alestic-ppa.list    
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BE09C571
sudo apt-get update
sudo apt-get install -y ec2-consistent-snapshot
sudo PERL_MM_USE_DEFAULT=1 cpan Net::Amazon::EC2
The documentation can be accessed using:

man ec2-consistent-snapshot
This program can be run from a scheduled cron job on the EC2 instance to automate backup snapshots while you sleep.

Since each snapshot only takes up space based on which blocks have changed since the last snapshot and since there may be additional compression applied, the incremental cost of frequent snapshots can sometimes be small.

Restoring the snapshotted database

So you want to check out the snapshot of your MySQL database to see if it really has the right data. Or, you'd like to test some code on an instance which has nearly current production data without risk to the live production database. Or, you want to start a MySQL replication slave. Or, you need to recover from an unfortunate DELETE statement without a WHERE clause...

We'll start another EC2 instance to run the second database server. It is not necessary to terminate the original instance; both can be running in parallel. The second instance and volume must be together in the same availability zone, though it does not have to be where the first instance/volume reside.

Run a second instance, making a note of the instance id (say, i-IIII2222). Check to see if the instance is running (might take a minute) and make a note of the external hostname (say, HOST2222).

ec2-run-instances -z us-east-1b --key YOURKEYPAIR ami-1515f67c

ec2-describe-instances i-IIII2222
Create a second EBS volume based on the snapshot of the original volume and make a note of the volume id (say, vol-VVVV2222). Check to see if the second volume is available (might take a while).

ec2-create-volume -z us-east-1b --snapshot snap-SSSS1111

ec2-describe-volumes vol-VVVV2222
Once it's available, attach the second EBS volume to the second instance as /dev/sdh

ec2-attach-volume -d /dev/sdh -i i-IIII2222 vol-VVVV2222
Note: If the original instance had crashed or been terminated, we could skip the creation of a second volume from a snapshot and simply attach the original volume to the second instance. The remainder of these instructions would apply just the same for getting up and running with that original volume, though you might want to run xfs_check just before mounting to make sure the file system is in a consistent state after the crash.

Now, hop on to the second instance, install the required software, and mount the attached EBS volume. (The MySQL password does not matter here because we will be using a pre-existing database.) We also make sure the files are owned by mysql, just in case UIDs are different on the new instance.

ssh -i YOURSSHKEYFILE ubuntu@HOST2222

sudo apt-get update && sudo apt-get upgrade -y
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get install -y xfsprogs mysql-server

echo "/dev/sdh /vol xfs noatime 0 0" | sudo tee -a /etc/fstab
sudo mkdir -m 000 /vol
sudo mount /vol

sudo find /vol/{lib,log}/mysql/ ! -user  root -print0 | 
  sudo xargs -0 -r chown mysql
sudo find /vol/{lib,log}/mysql/ ! -group root -a ! -group adm -print0 |
  sudo xargs -0 -r chgrp mysql
Point MySQL to the correct database files on the EBS volume.

sudo /etc/init.d/mysql stop

echo "/vol/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
sudo mount /etc/mysql

echo "/vol/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/lib/mysql

echo "/vol/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/log/mysql

sudo /etc/init.d/mysql start
You now have a second machine running against an exact copy of the first database at the time of the snapshot. Imagine the possibilities and smile!

You can verify this by looking for the "tutorial_sample" database you created earlier.

mysql -u root -p -e 'SHOW DATABASES'
Note: Each of these instances has mounted a different volume and is using a different set of database files. Though they would have started out sharing similar values in the database, any changes made in one will not be reflected in the other.

Cleanup

If you followed the above steps, you will have created resources which will continue to be charged against your EC2 account until you release them. Here are the steps to shut down and delete everything created in this tutorial. The first commands run on the instances:

Unmount the EBS volume file systems on each of the EC2 instances.

sudo /etc/init.d/mysql stop
sudo umount /etc/mysql /var/lib/mysql /var/log/mysql /vol
The rest of the commands should be run on your local system (which has the EC2 API command line tools installed):

Detach EBS volumes from EC2 instances, delete the volumes, delete the snapshots, and shutdown the instances.

ec2-detach-volume vol-VVVV1111
ec2-detach-volume vol-VVVV2222

ec2-delete-volume vol-VVVV1111
ec2-delete-volume vol-VVVV2222

ec2-delete-snapshot snap-SSSS1111

ec2-terminate-instances i-IIII1111
ec2-terminate-instances i-IIII2222
Verify that it's all gone.

ec2-describe-instances
ec2-describe-volumes
ec2-describe-snapshots
Feedback

Please send feedback, corrections, and recommended enhancements to the author:
Eric Hammond <ehammond-ec2@thinksome.com>

Questions may be posted to the Amazon EC2 Forum so others can pitch in with and benefit from answers.

I am especially interested in notes about what specific steps you changed to get this guide to work on other Linux distributions. These may be included in an update to this tutorial.

Thanks for ideas, code, and suggestions: Mark Callaghan, petterim, Rodney Quillo, smarttux, B. True, nrforum, mattjive

Resources

Feature Guide: Elastic Block Store
Amazon EC2 Developer Guide (Elastic Block Store)
Amazon EC2 Getting Started Guide (running and connecting to instances)
XFS file system
Ubuntu and Debian AMIs for Amazon EC2
MySQL snapshots and replication info
UPDATES

The following information has come out since the original publication of this tutorial:

The ext3 and other file systems can also be used to create consistent snapshots with EBS if they are layered on top of LVM or dmsetup. The "dmsetup suspend" and "dmsetup resume" commands take care of the file system freezing. [more info about setting up], [more info about suspending/resuming]
HISTORY

2010-03-22
Upgrade sample commands to work with Ubuntu 9.10 Karmic AMI.
2009-10-16

umount even the bind mount points, thanks to Ben Standefer
2009-10-02

Updated script pointer to ec2-consistent-snapshot
Converted to Jaunty
2009-08-14

Create mount point with mode "000" to help protect against accidentally using it when the EBS volume file system is not mounted.
Mention the AWS console
Update Ubuntu AMI id
2009-05-24

Switch to using mount bind so that these instructions will work with the default Apparmor configuration.
Add "sudo" so that these instructions will work with the Ubuntu images for EC2 published by Canonical (which require you to log in as a normal user).
2008-08-20

Initial document publication.





INITIALISE MYSQL WITH /etc/init.d/mysqld start
----------------------------------------------

STARCLUSTER HAS MYSQL INSTALLED BUT WON'T RUN UNLESS INITIALISED WITH /etc/init.d/mysqld start

locate mysql

    /opt/rightscale/etc/mysql
    /opt/rightscale/etc/mysql/my-dedicated-innodb.cnf
    /opt/rightscale/etc/mysql/my-dedicated.cnf
    /opt/rightscale/etc/mysql/my-shared.cnf
    /opt/rightscale/etc/mysql/my.cnf
    /usr/lib/python2.4/site-packages/sos/plugins/mysql.py
    /usr/lib/python2.4/site-packages/sos/plugins/mysql.pyc
    /usr/lib/python2.4/site-packages/sos/plugins/mysql.pyo
    /usr/share/man/man5/mysql_table.5.gz
    /usr/share/vim/vim70/syntax/mysql.vim


mysqld_safe &

    Starting mysqld daemon with databases from /var/lib/mysql
    STOPPING server from pid file /var/run/mysqld/mysqld.pid
    101010 23:59:59  mysqld ended


tail /var/log/mysqld.log 

    InnoDB: Setting log file ./ib_logfile1 size to 5 MB
    InnoDB: Database physically writes the file full: wait...
    InnoDB: Doublewrite buffer not found: creating new
    InnoDB: Doublewrite buffer created
    InnoDB: Creating foreign key constraint system tables
    InnoDB: Foreign key constraint system tables created
    101010 23:59:59  InnoDB: Started; log sequence number 0 0
    101010 23:59:59 [ERROR] Fatal error: Can't open and lock privilege tables: Table 'mysql.host' doesn't exist
    101010 23:59:59  mysqld ended


mysqld_safe --datadir=/var/lib/mysql --user=mysql 

tail -n 20 /var/log/mysqld.log 

    101011 00:40:41  mysqld started
    InnoDB: Log scan progressed past the checkpoint lsn 0 36808
    101011  0:40:41  InnoDB: Database was not shut down normally!
    InnoDB: Starting crash recovery.
    InnoDB: Reading tablespace information from the .ibd files...
    InnoDB: Restoring possible half-written data pages from the doublewrite
    InnoDB: buffer...
    InnoDB: Doing recovery: scanned up to log sequence number 0 43655
    101011  0:40:41  InnoDB: Starting an apply batch of log records to the database...
    InnoDB: Progress in percents: 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 
    InnoDB: Apply batch completed
    101011  0:40:42  InnoDB: Started; log sequence number 0 43655
    101011  0:40:42 [ERROR] Fatal error: Can't open and lock privilege tables: Table 'mysql.host' doesn't exist
    101011 00:40:42  mysqld ended








</entry>



<entry [Mon Oct 11 00:20:42 2010] INSTALL EC2 ON LINODE>





1. DOWNLOAD EC2 AND UNZIP

wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip

/root/base/apps/ec2/1.3-57419
ll
    drwxrwxr-x 2 root root  20K Oct 11 04:20 bin
    drwxrwxr-x 2 root root 4.0K Sep 16 16:36 lib
    -rw-r--r-- 1 root root 5.0K Sep 16 16:36 license.txt
    -rw-r--r-- 1 root root 1.8K Sep 16 16:36 notice.txt
    -rw-r--r-- 1 root root  74K Sep 16 16:36 THIRDPARTYLICENSE.TXT



2. SET PATHS IN .bash_profile

#### ec2
export PATH=/root/base/apps/ec2/1.3-57419/bin:$PATH
export EC2_HOME=/root/base/apps/ec2/1.3-57419
export JAVA_HOME=/root/base/apps/java/jre1.6.0_17
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export EC2_CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem



    OK!



</entry>



<entry [Sun Oct 10 11:33:02 2010] ATTACHED EBS VOLUME TO CENTOS 5.1 STARCLUSTER>



1. STARTED INSTANCE FROM ELASTICFOX

AMI NAME            ami-74b65c1d
INSTANCE ID         i-08798d65
PUBLIC DNS NAME     ec2-184-72-207-199.compute-1.amazonaws.com
PRIVATE DNS NAME    ip-10-122-189-75.ec2.internal
PRIVATE IP          10.122.189.75


OR LAUNCH INSTANCE MANUALLY

ec2-run-instances -z us-east-1a --key /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem ami-74b65c1d


PUBLIC AND PRIVATE KEYPAIR

-k /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 
-c /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 

NB: CAN USE THESE FILE LOCATIONS (SEE COMMANDS BELOW) OR SET THEM AS ENVIRONMENT VARIABLES
export EC2_PRIVATE_KEY=$HOME/.ec2/pk-<STRING>.pem
export EC2_CERT=$HOME/.ec2/cert-<STRING>.pem




2. CREATED 40GB EBS INSTANCE USING ELASTICFOX AND ASSOCIATED 



3. CONNECT TO INSTANCE VIA LINODE:

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-184-72-207-199.compute-1.amazonaws.com


4. VERIFY THE EBS VOLUME CAN BE SEEN ON THE INSTANCE
 
cat /proc/partitions

    major minor  #blocks  name
    
       8     1   10485760 sda1
       8    16  440366080 sdb
       8    32  440366080 sdc
       8     0   41943040 sda       <==== HERE



5. CREATE AN EXT3 FILESYSTEM ON THE EBS VOLUMNE
 
mke2fs -F -j /dev/sda
    
    mke2fs 1.39 (29-May-2006)
    Filesystem label=
    OS type: Linux
    Block size=4096 (log=2)
    Fragment size=4096 (log=2)
    5242880 inodes, 10485760 blocks
    524288 blocks (5.00%) reserved for the super user
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
    Writing superblocks and filesystem accounting information: 
    done
    
    This filesystem will be automatically checked every 25 mounts or
    180 days, whichever comes first.  Use tune2fs -c or -i to override.



MOUNT IT ON /data

mkdir /data
mount /dev/sda /data 

    OK!





</entry>



<entry [Mon Oct  4 14:04:59 UTC 2010] STARTED STARCLUSTER INSTANCE, BUNDLED IT AND SAVED TO S3>



STARTED STARCLUSTER INSTANCE
----------------------------

(AWS MANAGEMENT CONSOLE)

AMI: ami-0af31963

Instance: i-3d0a1557


OR COMMAND LINE TO CREATE LARGER INSTANCE
ec2run \
-b /dev/sda1/=snp



ACCESS INSTANCE VIA SSH
-----------------------

To access your instance using any SSH client
Open the SSH client of your choice (e.g., PuTTY, terminal).


ON LINODE private key file (agua.pem) IS HERE:

ssh -i /root/base/apps/ec2/keypair/agua.pem


SET PERMISSIONS (ssh won't work otherwise):

chmod 400 /root/base/apps/ec2/keypair/agua.pem


CONNECT TO INSTANCE'S public DNS [ec2-174-129-179-206.compute-1.amazonaws.com]:

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-174-129-179-206.compute-1.amazonaws.com

    ...
    **********************************************************
    ** StarCluster - Ubuntu 10.04 Lucid AMI (alestic based) **
    **********************************************************
    
    mailing list: starcluster@mit.edu
    project homepage: http://web.mit.edu/starcluster
    built from alestic ami: ami-2d4aa444
    
    NOTE: Numpy/Scipy/Atlas have been custom compiled on this image.
    For now, please take care to avoid installing python-numpy, python-scipy,
    and liblapack* packages from apt-get as this will break these custom
    installations.
    
    

CREATE BUCKET IN S3 
-------------------
(AWS MANAGEMENT CONSOLE)

starcluster-1


CREATE X.509 KEYPAIR IN AWS CONSOLE
-----------------------------------
(AWS MANAGEMENT CONSOLE)

Account -> Security Credentials -> Access Credentials --> X.509 Certificates


PUBLIC KEY:

rsa-APKAIZMXXJHGGOI7W5JA.pem

-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCC+Q4z17g7noixkW6J+WWqpzRz
MThEpK7NkP2ESzHxecMCyrP+4Gd++EH9rx8/jFE2Q/nrdWkOi6zcdPpnuWKX9Zd8
gYQdFxDEXYcApxeVB1by4zDx44VXIEtNZinikXgjmSuRq/qAeWwoGgbTVCLmWGzK
xtvMc70IOTZxQIk6hQIDAQAB
-----END PUBLIC KEY-----


PRIVATE KEY:

pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem

-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAK2pMf29wSGKGpdaH+YlYWU7YBpB
c+SJxefNpMgL4j9jHHqLvb3HPkXVxyHOD4E1Ozd+7ecBj/I/UgO7uXRVsW+E0TTjal+oj7JBdg31
CpXxStZlxKfIe7nBgW2PQ+AR7tO80ITXM3547Khpa0X5gQra0whTT8ufCrsl3HmTm+cTAgMBAAEC
gYBB8ilYuRE5Ik+cwA2zAOjuX1DMR6Sx2Zu8vfvgN5sQBRwQcTZ5dcrxDBBVhwGeSE+XcGz5Nz+p
d2A2qLfxNIVvOSqrFHWGLylyPxfp/L3gpvXz/5N+eZ6Y9PT18NiYWmpXEXcKEDT+Msg8Io8CiivY
U+cSs1yCq1becopC+EftqQJBAPI/j6T9BlFWO2e4Bu8xxKST3Xc5Q7+6Ux3v7h0bRD225dxrE/ML
1/N36GwJq7joWHtscK6+jLJOgm4uBQ9sq+UCQQC3hOXiBHDRVtk8Pn6goRTPxMxAixoqbCP6DDog
kigIpuJ4iEvmAYEE4XVfqC1bjay/oHU9hn8AOP0XwAJKHkeXAkAnu28W830eyBL0PwW8I6CKEcqI
LHdFMg1B4sFeOsOlj6MB1PovqeiggTE4zxlAObORgsa0koJHGINiCOBBmGRVAkEAhfMHw9fP7MxC
VVmcHWxVf206VGXznEFAZTNlff6QH/iHVsjM9T3lyQUzIbXkHW4kR947lMPFkQkHmr04Lpc5UwJA
SiBGFuHXymAL3LzH1tGxZLbWvoXgkLGEJHG2Badq9ADhxHM5OVgq8mV2oG9JJDR0NXZ3GIQGUOVC
4ibdjDymrg==
-----END PRIVATE KEY-----


COPIED TO LINODE:

ll /root/apps/ec2/keypair/

    -rw-r--r-- 1 root root  916 Oct  4 14:15 cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
    -rw-r--r-- 1 root root  926 Oct  4 14:14 pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem


COPIED TO STARCLUSTER:

mkdir -p /root/base/apps/ec2/keypair
cd /root/base/apps/ec2/keypair
scp root@173.230.142.248:/root/apps/ec2/keypair/* ./
    OK

ll
    
    -r-------- 1 root root 1670 2010-10-04 18:35 agua.pem
    -rw-r--r-- 1 root root  916 2010-10-04 18:35 cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
    -rw-r--r-- 1 root root  926 2010-10-04 18:35 pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem


NB: CAN USE THESE FILE LOCATIONS (SEE COMMANDS BELOW) OR SET THEM AS ENVIRONMENT VARIABLES:

E.G.:
export EC2_PRIVATE_KEY=$HOME/.ec2/pk-< STRING>.pem
export EC2_CERT=$HOME/.ec2/cert-< STRING>.pem



BUNDLE THE AMI


ec2-bundle-vol \
-d /tmp \
-k pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-c cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-u 728213020069 \
-r x86_64


    
    Copying / into the image file /tmp/image...
    Excluding: 
             /sys/kernel/debug
             /sys/kernel/security
             /sys
             /proc/fs/nfsd
             /proc
             /dev/pts
             /dev
             /dev
             /media
             /mnt
             /proc
             /sys
             /etc/udev/rules.d/70-persistent-net.rules
             /etc/udev/rules.d/z25_persistent-net.rules
             /tmp/image
             /mnt/img-mnt
    1+0 records in
    1+0 records out
    1048576 bytes (1.0 MB) copied, 0.00218949 s, 479 MB/s
    mke2fs 1.41.11 (14-Mar-2010)
    Bundling image file...
    Splitting /tmp/image.tar.gz.enc...
    ERROR: No space left on device - /tmp/image.part.087



SOLUTION:

INCREASE THE SIZE OF THE AMI BEFORE LAUNCHING
http://blog.bioteam.net/2010/07/14/how-to-resize-an-amazon-ec2-ami-when-boot-disk-is-on-ebs/




UPLOAD THE AMI

bundle the EC2 image and save it to S3 :
/etc/init.d/mysql stop


<!--
ec2-bundle-vol \
-d /mnt \
-k /mnt/<your pk>.pem \
-c /mnt/<your cert>.pem \
-u <your AWS access ID> \
-r i386

ec2-upload-bundle \
-b <your-s3-bucket> \
-m /mnt/image.manifest.xml \
-a <your AWS access ID> \
-s <aws-secret-access-key>

-->







NOTES
-----


MY AWS AUTHENTICATION INFO
--------------------------

AWS Account ID:	7282-1302-0069
Canonical User ID:	f30462040ebba8804e2f9ca67a71a93ac44015e835cf6c0f71d1710f8cbfaddb

access key id
AKIAIZXZ6S7ARZ44TTHQ

secret access key
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

aws Key Pair Name: agua
Fingerprint: 61:2d:42:13:55:92:09:bb:a9:8c:fa:17:69:29:ae:39:b5:76:d9:82



PUBLIC AND PRIVATE KEYPAIR

-k /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 
-c /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem 






Signing up for Amazon EC2
-------------------------
http://docs.amazonwebservices.com/AWSEC2/2007-08-29/GettingStartedGuide/?ref=get-started

After you have signed up for Amazon S3, you'll need to sign up for Amazon EC2. To sign your AWS account up for the Amazon EC2 service, log into your AWS account and then follow the link to Amazon EC2 under the "Browse Web Services" section on the left. Click on the "Sign Up For Web Service" button in the top right of the screen and follow the on-screen instructions.

Once you've signed up for Amazon EC2, move your mouse over the button labeled "Your Web Services Account" and select the "View Access Key Identifiers" link on the menu that appears. At the bottom of this page is a section titled "Your X.509 Certificate". Follow the "Create New" button in this section to create a new X.509 certificate. Follow the link to create a new X.509 certificate and save the certificate and private key.

You'll need this shortly when you set up our command line tools. Create a .ec2 directory in your home directory, and save these files to it with the filenames offered by your browser.

You should end up with a PEM-encoded X509 certificate and a private key file named as per the examples below:

cert-HKZYKTAIG2ECMXYIBH3HXV4ZBZQ55CLO.pem: A PEM encoded signed X.509 certificate.

pk-HKZYKTAIG2ECMXYIBH3HXV4ZBZQ55CLO.pem: An unencrypted, PEM encoded RSA private key that corresponds to the X.509 certificate above.

This X.509 certificate will be associated with your account until you generate or upload a new certificate. If you have an existing certificate you'd prefer to use, you can come back to the "Access Key Identifiers" page later and upload that.

Finally, you'll need to look up your AWS account ID. You should use this value whenever you need to provide an EC2 user ID. Staying with the AWS portal page, move your mouse over the button labeled "Your Web Services Account" and select the "Account Activity" link on the menu that appears. At the top of this page, just under the Account Activity title, you should see a label named "Account Number", followed by a hyphenated number. Something like this:

4952-1993-3132

Your AWS account ID, with the hyphens removed is your EC2 user ID. The example above would be 495219933132.

That's it. You're all set to start setting up your tools.





ec2-bundle-image
----------------
http://docs.amazonwebservices.com/AWSEC2/2010-08-31/CommandLineReference/index.html?CLTRG-ami-bundle-image.html


Description

Create a bundled AMI from an operating system image created in a loopback file. For more information, go to the Amazon Elastic Compute Cloud User Guide.

	Note
Scripts that require a copy of the public key from the launch key pair must obtain the key from the instance's metadata (not the key file in the instance store) for instances bundled with the 2007-08-29 AMI tools and later. AMIs bundled before this release will continue to work normally.
Syntax

ec2-bundle-image -k private_key -c cert -u user_id -i image_path -r {i386 | x86_64} [-d destination] [-p ami_prefix] [--ec2cert cert_path] [--kernel kernel-id] [--ramdisk ramdisk_id] [--block-device-mappingblock_device_mapping]

Options

Option	Description	Required
-k, --privatekey private_key
The path to the user's PEM-encoded RSA key file.

Example: -k pk-HKZYKTAIG2ECMXYIBH3HXV4ZBZQ55CLO.pem
Yes
-c, --cert cert
The user's PEM encoded RSA public key certificate file.

Example: -c cert-HKZYKTAIG2ECMXYIBH3HXV4ZBZQ55CLO.pem
Yes
-u, --user user_id
The user's AWS account ID without dashes. Do not use the Access Key ID.

Example: -u 999988887777
Yes
-i, --image image_path
The path to the image to bundle.

Example: -i /var/spool/my-image/version-2/debian.img
Yes
-r, --arch architecture
Image architecture. If you don't provide this on the command line, you'll be prompted to provide it when the bundling starts.

Valid Values: i386 | x86_64

Example: -r x86_64
Yes
-d, --destination destination
The directory in which to create the bundle.

Default: /tmp

Example: -d /var/run/my-bundle
No
-p, --prefix ami_prefix
The filename prefix for bundled AMI files.

Default: The name of the image file. For example, if the image path is /var/spool/my-image/version-2/debian.img, then the default prefix is debian.img.

Example: -p my-image-is-special
No
--ec2cert cert_path
The path to the Amazon EC2 X.509 public key certificate.

Default: /etc/ec2/amitools/cert-ec2.pem (varies, depending on tools)

Example: --ec2cert /etc/ec2/amiutil/cert-ec2.pem
No
--kernel kernel_id
The ID of the kernel to select.

Default: 2.6.16-xenU

Example: --kernel aki-ba3adfd3
No
--ramdisk ramdisk_id
The ID of the RAM disk to select.

Some kernels require additional drivers at launch. Check the kernel requirements for information on whether you need to specify a RAM disk. To find kernel requirements, go to the Resource Center and search for the kernel ID.

Example: --ramdisk ari-badbad00
No
--block-device-mapping mappings
Default block-device-mapping scheme with which to launch the AMI. This defines how block devices are exposed to an instance of this AMI if the instance type supports the specified device.

The scheme is a comma-separated list of key=value pairs, where each key is a virtual name and each value is the desired device name. Virtual names include:

ami—The root file system device, as seen by the instance
root—The root file system device, as seen by the kernel
swap—The swap device, as seen by the instance
ephemeralN—The Nth ephemeral store
Example: --block-device-mapping ami=sda1,root=/dev/sda1,ephemeral0=sda2,swap=sda3

Example: --block-device-mapping ami=0,root=/dev/dsk/c0d0s0,ephemeral0=1
No
Output

Status messages describing the stages and status of the bundling process.

Example

This example creates a bundled AMI from an operating system image that was created in a loopback file.

$ ec2-bundle-image -k pk-HKZYKTAIG2ECMXYIBH3HXV4ZBZQ55CLO.pem -c cert-HKZYKTAIG2ECMXYIBH3HXV4ZBZQ55CLO.pem -u 999988887777 -i image.img -d bundled/ -p fred -r x86_64
Splitting bundled/fred.gz.crypt...
Created fred.part.00
Created fred.part.01
Created fred.part.02
Created fred.part.03
Created fred.part.04
Created fred.part.05
Created fred.part.06
Created fred.part.07
Created fred.part.08
Created fred.part.09
Created fred.part.10
Created fred.part.11
Created fred.part.12
Created fred.part.13
Created fred.part.14
Generating digests for each part...
Digests generated.
Creating bundle manifest...
ec2-bundle-image complete.
    
    






ec2-bundle-vol --help
---------------------

MANDATORY PARAMETERS
    -c, --cert PATH                  The path to the user's PEM encoded RSA public key certificate file.
    -k, --privatekey PATH            The path to the user's PEM encoded RSA private key file.
    -u, --user USER                  The user's EC2 user ID (Note: AWS account number, NOT Access Key ID).

OPTIONAL PARAMETERS
    -h, --help                       Display this help message and exit.
        --version                    Display the version and copyright notice and then exit.
        --manual                     Display the user manual and exit.
        --batch                      Run in batch mode. No interactive prompts.
        --debug                      Display debug messages.
    -d, --destination PATH           The directory to create the bundle in. Defaults to '/tmp'.
        --ec2cert PATH               The path to the EC2 X509 public key certificate bundled into the AMI.
                                     Defaults to '/etc/ec2/amitools/cert-ec2.pem'.
    -r, --arch ARCHITECTURE          Specify target architecture. One of ["i386", "x86_64"]
        --productcodes PRODUCT_CODES Default product codes attached to the image at registration time.
                                     Comma separated list of product codes.
        --kernel ID                  Id of the default kernel to launch the AMI with.
        --ramdisk ID                 Id of the default ramdisk to launch the AMI with.
    -B, --block-device-mapping MAPS  Default block-device-mapping scheme to launch the AMI with. This scheme
                                     defines how block devices may be exposed to an EC2 instance of this AMI
                                     if the instance-type of the instance is entitled to the specified device.
                                     The scheme is a comma-separated list of key=value pairs, where each key
                                     is a "virtual-name" and each value, the corresponding native device name
                                     desired. Possible virtual-names are:
                                      - "ami": denotes the root file system device, as seen by the instance.
                                      - "root": denotes the root file system device, as seen by the kernel.
                                      - "swap": denotes the swap device, if present.
                                      - "ephemeralN": denotes Nth ephemeral store; N is a non-negative integer.
                                     Note that the contents of the AMI form the root file system. Samples of
                                     block-device-mappings are:
                                      - "ami=sda1,root=/dev/sda1,ephemeral0=sda2,swap=sda3"
                                      - "ami=0,root=/dev/dsk/c0d0s0,ephemeral0=1"
    -a, --all                        Include all directories in the volume being bundled, including those
                                     on remotely mounted filesystems.
    -e, --exclude DIR1,DIR2,...      A comma-separated list of absolute directory paths to exclude. This
                                     option overrides the "--all" option.
    -p, --prefix PREFIX              The filename prefix for bundled AMI files. Defaults to "image".
    -s, --size MB                    The size, in MB (1024 * 1024 bytes), of the image file to create.
                                     The maximum size is 10240 MB.
        --[no-]inherit               Inherit instance metadata. Enabled by default.
                                     Bundling will fail if inherit is enabled but instance data
                                     is not accessible, for example not bundling an EC2 instance.
    -v, --volume PATH                The absolute path to the mounted volume to be bundled. Defaults to "/".
        --fstab PATH                 The absolute path to the fstab to be bundled into the image.
        --generate-fstab             Inject a generated EC2 fstab. (Only use this if you are not rebundling
                                     an existing instance.)
                                     
                                     


</entry>



<entry [Mon Oct  4 12:50:06 EDT 2010] HOW TO SAVE/BUNDLE AN EC2 IMAGE TO S3>




access key id
AKIAIZXZ6S7ARZ44TTHQ

secret access key
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

cloudfront key pair id
APKAIZMXXJHGGOI7W5JA

cloudfront public key
e:\22-agua\cloud\AWS\keypair\rsa-APKAIZMXXJHGGOI7W5JA.pem


aws Key Pair Name: agua
Fingerprint: 61:2d:42:13:55:92:09:bb:a9:8c:fa:17:69:29:ae:39:b5:76:d9:82



bundle the EC2 image and save it to S3 :
/etc/init.d/mysql stop

ec2-bundle-vol \
-d /mnt \
-k /mnt/<your pk>.pem \
-c /mnt/<your cert>.pem \
-u <your AWS access ID> \
-r i386

ec2-upload-bundle \
-b <your-s3-bucket> \
-m /mnt/image.manifest.xml \
-a <your AWS access ID> \
-s <aws-secret-access-key>

register your AMI :
ec2-register <your S3 bucket>/image.manifest.xml
Powered by a free Atlassian Confluence Open Source Project License granted to Codehaus. Evaluate Confluence today.
Powered by Atlassian Confluence 3.3, the Enterprise Wiki   |  Report a bug  |  Atlassian News



Bundle an Amazon EC2 image
http://docs.codehaus.org/display/SONAR/Bundle+an+Amazoan+EC2+image

Added by Simon Brandhof, last edited by Simon Brandhof on Jan 03, 2009  (view change)
Labels:

install EC2 tools and follow instructions from EC2 documentation to setup your environment

generate a keypair :

PROMPT> ec2-add-keypair sonar-keypair
create a file namedid_rsa-sonar-keypairand paste everything between (and including) the "--BEGIN RSA PRIVATE KEY----" and "--END RSA PRIVATE KEY----" lines into.
set the permissions :
PROMPT> chmod 600 id_rsa-sonar-keypair
launch the instance of this Ubuntu 7.10 image :
PROMPT> ec2-run-instances ami-b111f4d8 -k sonar-keypair
something like that is displayed :
INSTANCE    i-9ca96df5    ami-b111f4d8            pending    sonar-keypair    0        m1.small    2008-03-29T09:02:00+0000    us-east-1c

The second column (i-9ca96df5) is the ID of your instance

Wait for the instance is started :
PROMPT> ec2-describe-instances [ID of your instance]
INSTANCE    [ID of your instance]    ami-b111f4d8    [your public domain] [your private domain] running sonar-keypair ....
copy your keys :
scp -i id_rsa-sonar-keypair \[path to your pk key\].pem \[path to your cert key\].pem root@\[your public domain\]:/mnt
connect to the image :
ssh -i id_rsa-sonar-keypair root@[your public domain]
install softwares :
cd /home
wget http://dist.sonar.codehaus.org/sonar-1.5.zip
apt-get install unzip
unzip sonar-1.5.zip
apt-get install subversion
apt-get install mysql-server (if it fails, relaunch the command + apt-get update)
apt-get install mysql-admin
apt-get install sun-java6-jdk

configure mysql to store data on the ephemeral storage (/mnt) :
mkdir /mnt/mysql_data
chown mysql:mysql /mnt/mysql_data
/etc/init.d/mysql stop
mv /var/lib/mysql/* /mnt/mysql_data
rmdir /var/lib/mysql
vi /etc/mysql/my.cnf    # update datadir=/mnt/mysql_data and tmpdir=/mnt/mysql_data/tmp/
configure mysql for sonar :
mysql -p
mysql> create database sonar CHARACTER SET utf8 COLLATE utf8_general_ci;
mysql> grant all privileges on sonar.* to 'sonar'@'localhost' identified by '[your sonar password]';
mysql> flush privileges;

configure sonar :
vi /home/sonar-1.5/conf/wrapper.conf
vi /home/sonar-1.5/conf/sonar.properties

bundle the EC2 image and save it to S3 :
/etc/init.d/mysql stop
ec2-bundle-vol -d /mnt -k /mnt/<your pk>.pem -c /mnt/<your cert>.pem -u <your AWS access ID> -r i386
ec2-upload-bundle -b <your-s3-bucket> -m /mnt/image.manifest.xml -a <your AWS access ID> -s <aws-secret-access-key>

register your AMI :
ec2-register <your S3 bucket>/image.manifest.xml
Powered by a free Atlassian Confluence Open Source Project License granted to Codehaus. Evaluate Confluence today.
Powered by Atlassian Confluence 3.3, the Enterprise Wiki   |  Report a bug  |  Atlassian News



</entry>



<entry [Tue Aug 24 20:55:38 UTC 2010] FIX ELASTICFOX ERROR 'ec2 responded with an error for describeSNAPSHOTS'>




1. INSTALL EC2 API ON WINDOWS
-----------------------------

DOWNLOADED ec2-api-tools FROM

http://www.amazon.com/gp/redirect.html/ref=aws_rc_ec2tools?location=http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip&token=A80325AA4DAB186C80828ED5138633E3F49160D9


UNZIPPED AND ADDED TO $PATH:

E:\22-agua\cloud\ec2\ec2-api-tools\ec2-api-tools-1.3-51254\bin


RIGHT-CLICK 'MY COMPUTER' --> PROPERTIES --> ADVANCED --> ENVIRONMENT VARIABLES


SET ENVIRONMENT VARIABLE:

EC2_HOME 
E:\22-agua\cloud\ec2\ec2-api-tools\ec2-api-tools-1.3-51254

JAVA_HOME

C:\Program Files\Java\jre1.6.0


TO AVOID THIS ERROR:

C:\Documents and Settings\syoung>ec2-run-instances
Required option '-K, --private-key KEY' missing (-h for usage)



cd E:\22-agua\cloud\ec2\ec2-api-tools\ec2-api-t
ools-1.3-51254\bin

ec2-describe-keypairs -K E:\22-agua\cloud\AWS\keypair\agua.pem -C E:\22-agua\cloud\AWS\keypair\agua.pem



C:\Documents and Settings\syoung>ec2-describe-keypair
'ec2-describe-keypair' is not recognized as an internal or external command,
operable program or batch file.

C:\Documents and Settings\syoung>ec2-describe-keypairs
Required option '-K, --private-key KEY' missing (-h for usage)

C:\Documents and Settings\syoung>ec2-describe-keypairs -K

C:\Documents and Settings\syoung>cd Required option '-K, --private-key KEY' miss
ing

C:\Documents and Settings\syoung>cd E:\22-agua\cloud\ec2\ec2-api-tools\ec2-api-t
ools-1.3-51254\bin

C:\Documents and Settings\syoung>ec2-describe-keypairs
Required option '-K, --private-key KEY' missing (-h for usage)

C:\Documents and Settings\syoung>


</entry>



<entry [Tue Aug 24 19:55:38 UTC 2010] CREATE AND POPULATE EBS VOLUME>



HOW TO CREATE AN EBS
http://aws.amazon.com/ebs/

DETAILS
http://learnaws.com/archives/159

BASIC PROCEDURE:
http://blog.blackpepper.co.uk/black-pepper-blog/Using-Amazon-EC2-EBS-S3-for-automated-backups.html


1. Create an Amazon EC2 persistent volume of your desired size

    Log in to the AWS Management Console, click the Amazon EC2 tab and click Volumes on the left navigation pane
    Right click on the volume and create a snapshot

    VOLUME INFO:
    
    40 GB
    vol-6c752005

    OR USE ELASTICFOX -- BROKEN!!:
    
    http://web.mit.edu/stardev/cluster/docs/create_volume_manually.html


    OR USE FIREFOX ADDON - S3FOX:
    
    http://www.s3fox.net/Features.aspx?isnew=true&from=addon

    WHICH REQUIRES THE AWS ACCESS KEY ID:
    
    AWS --> Account --> Security credentials --> Access Credentials
    

September 16, 2009
    AWS Access Key ID
AKIAIZXZ6S7ARZ44TTHQ    
    AWS Secret Access Key
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
    
August 25, 2010
AKIAJ436YXFUYDHSGQLA
gSXHmuPJRGkzZDCr0gu4W6J2bs0pumhHoXi1PF0H
    
    
    DETAILS ABOUT AWS ACCESS KEY AND SECRET KEY
    http://www.bucketexplorer.com/documentation/amazon-s3--what-is-my-aws-access-and-secret-key.html
    https://addons.mozilla.org/en-US/firefox/addon/3247/    

    
    

2. Start up an Amazon EC2 cloud machine

    

3. Mount your persistent volume to this temporary machine

    ${EC2_HOME}/bin/ec2-attach-volume ${vol_name} -i ${iid} -d ${device_name}  

    mounts our volume to our machine --- NEEDED?
    
        mkdir /mnt/data-store && mount ${device_name} /mnt/data-store


4. rsync your data over to the machine

    rsync -e "ssh -i ${id_file}" -avRz --exclude-from=exclude-from-backup.txt --include-from=include-in-backup.txt /home/kieran/ root@$EC2_HOST:/mnt/data-store/kierans-laptop/  

5. Shutdown the machine




NOTES
------

WHOLE BACKUP SCRIPT
http://blog.blackpepper.co.uk/black-pepper-blog/Using-Amazon-EC2-EBS-S3-for-automated-backups.html

### Setup EC Tools  
export EC2_HOME=~/tools/ec2-api-tools-1.3-41620  
PATH=$EC2_HOME/bin:$PATH  
### Location of your account security credentials  
export EC2_PRIVATE_KEY=~/Documents/pk-XXXXXXXXXXXXXXXXXXX.pem  
export EC2_CERT=~/Documents/cert-XXXXXXXXXXXXXXXXXXX.pem  
### Override the default US EC2 location if you want to use the European data centre  
export EC2_URL=https://eu-west-1.ec2.amazonaws.com  
### Java location  
export JAVA_HOME=/usr/lib/jvm/java-6-sun/jre/  
 
### Machine image you want to use as the base for the machine you want to start up, more on this later.  
export amiid="ami-0db89079"  
### SSH key to use to setup the machine with. In the EC2 console you need to setup an SSH key that you can connect to your new machine with as by default they do not allow access by any other means. This is my own keyname on the console.  
export key="ec2-backups"  
### Where do launch your machine. Europe for me.  
export zone="eu-west-1a"  
### Local SSH key to connect to machine with. Location of the actual SSH key that you also put in the EC2 console.  
export id_file="/home/kieran/ec2-backups.pem"  
### Volume to mount to machine. The volume that we've previously created.  
export vol_name="vol-2e0aef47"  
### Where to mount the volume on our new machine.  
export mount_point="/mnt/vol"  
### Device name for the mount  
export device_name="/dev/sdf"  
### Security group. To help me identify my machine, I use security groups as EC2 doesn't have real instance labels.  
export group="backups"  
 
#  
# Start the instance  
# Capture the output so that  
# we can grab the INSTANCE ID field  
# and use it to determine when  
# the instance is running  
#  
echo Launching AMI ${amiid}  
${EC2_HOME}/bin/ec2-run-instances ${amiid} -z ${zone} -k ${key} --group ${group}  > /tmp/a  
if [ $? != 0 ]; then  
   echo Error starting instance for image ${amiid}  
   exit 1  
fi  
export iid=`cat /tmp/a | grep INSTANCE | cut -f2`  
 
#  
# Loop until the status changes to 'running'  
#  
sleep 30  
echo Starting instance ${iid}  
export RUNNING="running"  
export done="false"  
while [ $done == "false" ]  
do  
   export status=`${EC2_HOME}/bin/ec2-describe-instances ${iid} | grep INSTANCE | cut -f6`  
   if [ $status == ${RUNNING} ]; then  
      export done="true"  
   else  
      echo Waiting...  
      sleep 10  
   fi  
done  
echo Instance ${iid} is running  
 
#  
# Attach the volume to the running instance  
#  
echo Attaching volume ${vol_name}  
${EC2_HOME}/bin/ec2-attach-volume ${vol_name} -i ${iid} -d ${device_name}  
sleep 15  
 
#  
# Loop until the volume status changes  
# to 'attached'  
#  
export ATTACHED="attached"  
export done="false"  
while [ $done == "false" ]  
do  
   export status=`${EC2_HOME}/bin/ec2-describe-volumes | grep ATTACHMENT | grep ${iid} | cut -f5`  
   if [ $status == ${ATTACHED} ]; then  
      export done="true"  
   else  
      echo Waiting...  
      sleep 10  
   fi  
done  
echo Volume ${vol_name} is attached  
  
export EC2_HOST=`ec2-describe-instances | grep ${iid} | tr 't' 'n'  
    | grep amazonaws.com`  
 
### Important trick here. Because you will be starting up a different machine every time you run this script, you'll be forced to say yes to accepting the change of host for the SSH key, the options here make sure the doesn't happen and you can run this completely automated without human interaction.  
### This line logs on and mounts our volume to our machine.  
ssh -i ${id_file} -o "StrictHostKeyChecking no" root@$EC2_HOST "mkdir /mnt/data-store && mount ${device_name} /mnt/data-store"  
 
### Run rsync, whatever options you'd like, here are a couple of examples I use.  
rsync -e "ssh -i ${id_file}" -avRz --exclude-from=exclude-from-backup.txt --include-from=include-in-backup.txt /home/kieran/ root@$EC2_HOST:/mnt/data-store/kierans-laptop/  
 
#rsync -e "ssh -i ${id_file}" -avRz --exclude-from=exclude-from-backup.txt --include-from=include-in-backup.txt /home/kieran/ root@$EC2_HOST:/mnt/data-#store/kierans-laptop/ > kieranhomebackuplog.txt  
  
#rsync -e "ssh -i ${id_file}" -avRz --exclude-from=exclude-from-backup.txt --include-from=include-in-backup.txt /linkstation/ root@$EC2_HOST:/mnt/data-store/kierans-laptop/  
#rsync -e "ssh -i ${id_file}" -avRz --exclude-from=exclude-from-backup.txt --include-from=include-in-backup.txt /linkstation/ root@$EC2_HOST:/mnt/data-#store/kierans-laptop/ > linkstationbackuplog.txt  
 
### Clean up. Disconnect the volume  
ssh -i ~/ec2-backups.pem root@$EC2_HOST "umount /mnt/data-store"  
### Detact volume from machine  
ec2-detach-volume ${vol_name} -i ${iid}  
### Shutdown instance  
ec2-terminate-instances ${iid}





AWS Management Console:
Create a new Amazon EBS volume and copy only the files that you wish to share on to that volume
Log in to the AWS Management Console, click the Amazon EC2 tab and click Volumes on the left navigation pane
Right click on the volume and create a snapshot
Click on Snapshots on the left navigation pane
Right-click on the snapshot you wish to share and select Snapshot permissions
Add the AWS account numbers of the developers who you want to grant access or share it publicly
Hit Save to apply the permissions


NB: Programs like IOSTAT can be used to measure the exact I/O usage of your system at any time. However, applications and operating systems often do different levels of caching, so you will likely see a lower number of I/O requests on your bill than is seen by your application unless you sync all of your I/Os to disk.


Projecting Costs
----------------

COST FOR UPLOADING 4 GB TO EBS:

4 GB = 1,000 puts = 1000 x 0.10 x 10-6 ?

With Amazon Elastic Block Store, you only pay for what you use. Volume storage is charged by the amount you allocate until you release it, and is priced at a rate of $0.10 per allocated GB per month Amazon EBS also charges $0.10 per 1 million I/O requests you make to your volume.


As an example, a medium sized website database might be 100 GB in size and expect to average 100 I/Os per second over the course of a month. This would translate to $10 per month in storage costs (100 GB x $0.10/month), and approximately $26 per month in request costs (~2.6 million seconds/month x 100 I/O per second * $0.10 per million I/O).


Volume data is broken up into chunks before being transferred to Amazon S3. While the size of the chunks could change through future optimizations, the number of PUTs required to save a particular snapshot to Amazon S3 can be estimated by dividing the size of the data that has changed since the last snapshot by 4MB. Conversely, when loading a snapshot from Amazon S3 into and Amazon EBS volume, the number of GET requests needed to fully load the volume can be estimated by dividing the full size of the snapshot by 4MB. You will also be charged for GETs and PUTs at normal Amazon S3 rates.




</entry>



<entry [Tue Aug 24 19:55:38 UTC 2010] ACCESS STARCLUSTER AMI>




1. SET starcluster AMI RUNNING IN AWS CONSOLE



2. CLICKED 'CONNECT' IN RIGHTCLICK MENU AND GOT THIS INFO:
 
Instance: i-49ceba23
To access your instance using any SSH client
Open the SSH client of your choice (e.g., PuTTY, terminal).
Locate your private key file, agua.pem
Use chmod to make sure your key file isn't publicly viewable, ssh won't work otherwise:
chmod 400 agua.pem
Connect to your instance using instance's public DNS [ec2-184-73-27-2.compute-1.amazonaws.com].
Example
Enter the following command line:


ON LINODE:

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-184-73-27-2.compute-1.amazonaws.com



3. CONNECTED SUCCESSFULLY

ssh -i agua.pem root@ec2-184-73-27-2.compute-1.amazonaws.com

     OK!

     The authenticity of host 'ec2-184-73-27-2.compute-1.amazonaws.com (184.73.27.2)' can't be established.
     RSA key fingerprint is d8:5b:31:0f:44:d5:70:77:54:4b:66:1c:65:c7:f8:51.
     Are you sure you want to continue connecting (yes/no)? yes
     Warning: Permanently added 'ec2-184-73-27-2.compute-1.amazonaws.com,184.73.27.2' (RSA) to the list of known hosts.
     Linux domU-12-31-39-06-3C-21 2.6.21.7-2.fc8xen-ec2-v1.0 #1 SMP Tue Sep 1 10:25:30 EDT 2009 x86_64
     
     The programs included with the Ubuntu system are free software;
     the exact distribution terms for each program are described in the
     individual files in /usr/share/doc/*/copyright.
     
     Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
     applicable law.
     
     To access official Ubuntu documentation, please visit:
     http://help.ubuntu.com/
     
     Created From:
     ami-eef61587
     Amazon EC2 Ubuntu 9.04 jaunty AMI built by Eric Hammond
     http://alestic.com  http://ec2ubuntu-group.notlong.com
     
     StarCluster EC2 AMI created by Justin Riley (MIT)
     url: http://web.mit.edu/stardev/cluster
     email: star@mit.edu
     
     5 packages can be updated.
     0 updates are security updates.
     
     root@domU-12-31-39-06-3C-21:~# 



4. INSTALLED starcluster

easy_install StarCluster
 
    Searching for StarCluster
    Reading http://pypi.python.org/simple/StarCluster/
    Reading http://web.mit.edu/starcluster
    Best match: StarCluster 0.91
    Downloading http://pypi.python.org/packages/source/S/StarCluster/StarCluster-0.91.tar.gz#md5=7f81e09e10f934f7dfb7a4b5f060f49e
    Processing StarCluster-0.91.tar.gz
    Running StarCluster-0.91/setup.py -q bdist_egg --dist-dir /tmp/easy_install-LzTDB2/StarCluster-0.91/egg-dist-tmp-kG7b_I
    Adding StarCluster 0.91 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/dist-packages/StarCluster-0.91-py2.6.egg
    Processing dependencies for StarCluster
    Searching for boto>=1.9b
    Reading http://pypi.python.org/simple/boto/
    Reading http://code.google.com/p/boto/
    Reading http://code.google.com/p/boto
    Best match: boto 2.0b2
    Downloading http://boto.googlecode.com/files/boto-2.0b2.tar.gz
    Processing boto-2.0b2.tar.gz
    Running boto-2.0b2/setup.py -q bdist_egg --dist-dir /tmp/easy_install-8Y39UY/boto-2.0b2/egg-dist-tmp-1Q28Et
    zip_safe flag not set; analyzing archive contents...
    boto.file.__init__: module references __path__
    Adding boto 2.0b2 to easy-install.pth file
    Installing fetch_file script to /usr/local/bin
    Installing cfadmin script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing pyami_sendmail script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing launch_instance script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    Installing bundle_image script to /usr/local/bin
    Installing kill_instance script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/dist-packages/boto-2.0b2-py2.6.egg
    Searching for paramiko>=1.7.6
    Reading http://pypi.python.org/simple/paramiko/
    Reading http://www.lag.net/~robey/paramiko/
    Reading http://www.lag.net/paramiko/
    Best match: paramiko 1.7.6
    Downloading http://www.lag.net/paramiko/download/paramiko-1.7.6.zip
    Processing paramiko-1.7.6.zip
    Running paramiko-1.7.6/setup.py -q bdist_egg --dist-dir /tmp/easy_install-N4yByE/paramiko-1.7.6/egg-dist-tmp-e3npDG
    zip_safe flag not set; analyzing archive contents...
    Adding paramiko 1.7.6 to easy-install.pth file
    
    Installed /usr/local/lib/python2.6/dist-packages/paramiko-1.7.6-py2.6.egg
    Searching for pycrypto>=1.9
    Reading http://pypi.python.org/simple/pycrypto/
    Reading http://pycrypto.sourceforge.net
    Reading http://www.amk.ca/python/code/crypto
    Reading http://www.pycrypto.org/
    Best match: pycrypto 2.2
    Downloading http://www.pycrypto.org/files/pycrypto-2.2.tar.gz
    Processing pycrypto-2.2.tar.gz
    Running pycrypto-2.2/setup.py -q bdist_egg --dist-dir /tmp/easy_install-4A26zF/pycrypto-2.2/egg-dist-tmp-AsT9rf
    warning: GMP library not found; Not building Crypto.PublicKey._fastmath.
    zip_safe flag not set; analyzing archive contents...
    Adding pycrypto 2.2 to easy-install.pth file
    
    Installed /usr/local/lib/python2.6/dist-packages/pycrypto-2.2-py2.6-linux-x86_64.egg
    Finished processing dependencies for StarCluster


starcluster help

    **********************************************************************
    Welcome to IPython. I will try to create a personal configuration directory
    where you can customize many aspects of IPython's functionality in:
    
    /root/.ipython
    Initializing from configuration /var/lib/python-support/python2.6/IPython/UserConfig
    
    Successful installation!
    
    Please read the sections 'Initial Configuration' and 'Quick Tips' in the
    IPython manual (there are both HTML and PDF versions supplied with the
    distribution) to make sure that your system environment is properly configured
    to take advantage of IPython's features.
    
    Important note: the configuration system has changed! The old system is
    still in place, but its setting may be partly overridden by the settings in 
    "~/.ipython/ipy_user_conf.py" config file. Please take a look at the file 
    if some of the new settings bother you. 

    Please press <RETURN> to start IPython.
    **********************************************************************



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
        # "foo".<TAB> and str(2).<TAB> will work). Complete 
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



THIS SHOULD HAVE CREATED A FILE IN ~/.starcluster/config BUT NOT FOUND:


ls ~/.starcluster/config
ls: cannot access /root/.starcluster/config: No such file or directory


DOING starcluster help AGAIN DOESN'T HELP:


    root@domU-12-31-39-06-3C-21:~# starcluster help
    ERROR: An unexpected error occurred while tokenizing input
    The following traceback may be corrupted or invalid
    The error message is: ('EOF in multi-line statement', (405, 0))
    
    ---------------------------------------------------------------------------
    AttributeError                            Traceback (most recent call last)
    
    /usr/local/lib/python2.6/dist-packages/StarCluster-0.91-py2.6.egg/EGG-INFO/scripts/starcluster in <module>()
          3 __requires__ = 'StarCluster==0.91'
          4 import pkg_resources
    ----> 5 pkg_resources.run_script('StarCluster==0.91', 'starcluster')
          6 
          7 


SO CREATE THE DIRECTORY, MOVE TO IT AND MOVE OLD CONFIG FILE TO *.bkp AND RERUN starcluster help:


mkdir -p ~/.starcluster/config
mv ~/.ipython/ipy_user_conf.py ~/.ipython/ipy_user_conf.py.bkp
cd ~/.starcluster/config

</entry>



<entry [Sun July  11 21:59:46 EDT 2010] SGE NOW DOES CLOUD BURST AND INTEGRATED HADOOP>




http://www.cloudiquity.com/
admin on 15 Jan 2010

Sun’s Grid Engine now features Cloud burst and Apache Hadoop Integration
Sun (or is that Oracle…) has released a new version of their Grid Engine which brings it into the cloud.

There are two main additions in this release. The First is is integration with Apache Hadoop in which Hadoop jobs can now be submitted to Grid Engine, as if they were any other computation job. The Grid Engine also understand Hadoop’s global file systems which means that the Grid Engine is able to send work to the correct part of the cluster (data affinity).

The second is dynamic resource reallocation which also includes the ability to use on-demand resources from Amazon EC2. Grid Engine also is now able to manage resources across logical clusters which can be either in Cloud or off Cloud. This means that Grid engine can now be configured to “cloud burst” dependent on load which is a great feature. Integration is specifically set up with EC2 and enables scale down as well as scale up.

This release of Grid Engine also implements a usage accounting and billing feature called ARCo, making it truly SaaS ready as it is able to cost and bill jobs.

Impressive and useful stuff, and if you are interested in finding out more you can do so here.


</entry>



<entry [Sun July  11 21:58:46 EDT 2010] LOWER COST S3 STORAGE - RRS: REDUCED REDUNDANCY STORAGE>




http://www.cloudiquity.com/
admin on 19 May 2010

Amazon S3 add RRS – Reduced Redundancy Storage
introduce a new storage option for Amazon S3 called Reduced Redundancy Storage (RRS) that enables customers to reduce their costs by storing non-critical, reproducible data at lower levels of redundancy than the standard storage of Amazon S3. It provides a cost-effective solution for distributing or sharing content that is durably stored elsewhere, or for storing thumbnails, transcoded media, or other processed data that can be easily reproduced. The RRS option stores objects on multiple devices across multiple facilities, providing 400 times the durability of a typical disk drive, but does not replicate objects as many times as standard Amazon S3 storage does, and thus is even more cost effective. Both storage options are designed to be highly available, and both are backed by Amazon S3’s Service Level Agreement.Once customer data is stored using either Amazon S3’s standard or reduced redundancy storage options, Amazon S3 maintains durability by quickly detecting failed, corrupted, or unresponsive devices and restoring redundancy by re-replicating the data. Amazon S3 standard storage is designed to provide 99.999999999% durability and to sustain the concurrent loss of data in two facilities, while RRS is designed to provide 99.99% durability and to sustain the loss of data in a single facility.Pricing for Amazon S3 Reduced Redundancy Storage starts at only $0.10 per gigabyte per month and decreases as you store more data. To get started using RRS and Amazon S3, visit http://aws.amazon.com/s3 or learn more by joining our May 26 webinar.Sincerely,The Amazon S3 Team
Amazon have introduced a new storage option for Amazon S3 called Reduced Redundancy Storage (RRS) that enables customers to reduce their costs by storing non-critical, reproducible data at lower levels of redundancy than the standard storage of Amazon S3.

It provides a cost-effective solution for distributing or sharing content that is durably stored elsewhere, or for storing thumbnails, transcoded media, or other processed data that can be easily reproduced. The RRS option stores objects on multiple devices across multiple facilities, providing 400 times the durability of a typical disk drive, but does not replicate objects as many times as standard Amazon S3 storage does, and thus is even more cost effective.

Both storage options are designed to be highly available, and both are backed by Amazon S3’s Service Level Agreement.

Once customer data is stored using either Amazon S3’s standard or reduced redundancy storage options, Amazon S3 maintains durability by quickly detecting failed, corrupted, or unresponsive devices and restoring redundancy by re-replicating the data. Amazon S3 standard storage is designed to provide 99.999999999% durability and to sustain the concurrent loss of data in two facilities, while RRS is designed to provide 99.99% durability and to sustain the loss of data in a single facility.

Pricing for Amazon S3 Reduced Redundancy Storage starts at only $0.10 per gigabyte per month and decreases as you store more data.

From a programming viewpoint to enable your storage to take advantage of RRS  you need to set the storage class of an object you upload to RRS. To enable this you set x-amz-storage-class to REDUCED_REDUNDANCY in a PUT request.



</entry>



<entry [Sun July  11 21:57:46 EDT 2010] MYSQL USING EBS>




http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1663


1. INSTALL EC2 API ON WINDOWS
-----------------------------

DOWNLOADED ec2-api-tools FROM

http://www.amazon.com/gp/redirect.html/ref=aws_rc_ec2tools?location=http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip&token=A80325AA4DAB186C80828ED5138633E3F49160D9


UNZIPPED AND ADDED TO $PATH:

E:\22-agua\cloud\ec2\ec2-api-tools\ec2-api-tools-1.3-51254\bin


RIGHT-CLICK 'MY COMPUTER' --> PROPERTIES --> ADVANCED --> ENVIRONMENT VARIABLES


SET ENVIRONMENT VARIABLE:

EC2_HOME 
E:\22-agua\cloud\ec2\ec2-api-tools\ec2-api-tools-1.3-51254

JAVA_HOME

C:\Program Files\Java\jre1.6.0


TO AVOID THIS ERROR:

C:\Documents and Settings\syoung>ec2-run-instances
Required option '-K, --private-key KEY' missing (-h for usage)









Run an instance of Ubuntu 9.10 Karmic base install specifying your ssh keypair name. Make a note of the instance id (say, i-IIII1111). Check to see if the instance is running (might take a minute) and make a note of the external hostname (say, HOST1111).




To get started, we'll run an EC2 instance, create an EBS volume, and attach the volume to the instance. You can run the instance in any availability zone, just make sure to create the volume in the same zone so it can be attached to the instance.




As mentioned in the previous section, we assume that you have installed the EC2 API command line tools on your local system.





Run an instance of Ubuntu 9.10 Karmic base install specifying your ssh keypair name. Make a note of the instance id (say, i-IIII1111). Check to see if the instance is running (might take a minute) and make a note of the external hostname (say, HOST1111).

ec2-run-instances -z us-east-1a --key YOURKEYPAIR ami-1515f67c

ec2-describe-instances i-IIII1111



Create a new 10 GB EBS volume and make a note of the volume id (say, vol-VVVV1111). Check to see if the new volume is available (might take a few seconds).


ec2-create-volume -z us-east-1a -s 10

ec2-describe-volumes vol-VVVV1111




Once it's available, attach the EBS volume to the instance as /dev/sdh

ec2-attach-volume -d /dev/sdh -i i-IIII1111 vol-VVVV1111



Now we can set things up on the instance itself, so connect to it and install the necessary software on the instance. Enter and record a secure MySQL root password when prompted.

ssh -i YOURSSHKEYFILE ubuntu@HOST1111

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y xfsprogs mysql-server



Create an XFS file system on the EBS volume and mount it as /vol

grep -q xfs /proc/filesystems || sudo modprobe xfs
sudo mkfs.xfs /dev/sdh

echo "/dev/sdh /vol xfs noatime 0 0" | sudo tee -a /etc/fstab
sudo mkdir -m 000 /vol
sudo mount /vol
You now have a 10 GB (or whatever size you specified) EBS volume mounted under /vol with an XFS file system, and it will be automatically mounted if the instance reboots.

Anything you store under /vol (including MySQL files) will persist beyond the life of the current instance, and you can take snapshots of this volume for backup or replication.



Configuring MySQL to use the EBS volume

Now that we have an EBS volume mounted on the instance with a good file system, let's put the MySQL database on that volume and tell MySQL where it is.
Stop the MySQL server.

sudo /etc/init.d/mysql stop
Move the existing database files to the EBS volume. Point MySQL to the correct database files on the EBS volume using mount bind.

sudo mkdir /vol/etc /vol/lib /vol/log
sudo mv /etc/mysql     /vol/etc/
sudo mv /var/lib/mysql /vol/lib/
sudo mv /var/log/mysql /vol/log/

sudo mkdir /etc/mysql
sudo mkdir /var/lib/mysql
sudo mkdir /var/log/mysql

echo "/vol/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
sudo mount /etc/mysql

echo "/vol/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/lib/mysql

echo "/vol/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/log/mysql
Restart the MySQL server.

sudo /etc/init.d/mysql start


You are now running MySQL with all of the data and binary log files persistently stored on a high performance, redundant EBS volume!

To prove to yourself that a later snapshot saved your database changes, you might want to load some data or simply create a placeholder database with a SQL statement like:

mysql -u root -p -e 'CREATE DATABASE tutorial_sample'
Your data is pretty safe here, but let's make it even safer with snapshot backups.












http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1663

Running MySQL on Amazon EC2 with EBS (Elastic Block Store)

Average Review:          

This tutorial describes one approach to using Amazon EC2's Elastic Block Store (EBS) as a persistent storage mechanism for a production MySQL database server, including snapshot backup and restore.

Date Published:	Original 2008-08-20, Updated 2009-10-02

By Eric Hammond, Internet Startup Technologist (@esh on Twitter)

This guide covers:

Benefits of using EBS for MySQL
Setting up an EBS volume on an EC2 instance for use with MySQL
Configuring MySQL to use the EBS volume for data files and binary logs
Snapshotting the database
Restoring the snapshotted database on a second EC2 instance
This explicitly does not cover:
How to set up an Amazon EC2 account
How to use MySQL
Advanced multi-host redundancy, master/slave, failover, scaling, clusters
The focus here is on simplicity and to help the reader get a feel for the basics of what EBS offers to database servers.

Benefits of using EBS for MySQL

There are numerous reasons why you will want to run your MySQL database on EBS. Some of them are obvious and some are wonderful. They include:

Persistent storage in the event of instance failure - If an EBS volume is used as the storage for a MySQL database, then the data is protected from instance termination or failure. You can simply attach/mount the volume on another instance and MySQL will run its normal recovery procedures to bring the database up to date with the binary logs.

Safety & Replication - According to Amazon, "EBS volume data is replicated across multiple servers". This makes your data safer than the default instance storage.

Improved performance - Early reports from studies on random access disk IO performance indicate that EBS IO rates can be faster than ephemeral storage and even local disk IO. This has obvious benefits for databases which are often IO bound.

Large data storage capacity - EBS volumes can be up to 1TB in size. You can go larger with LVM or RAID across EBS volumes, or by placing different databases or table files on different EBS volumes.

Instance type portability - If you find that your current small EC2 instance is not able to handle your growing demand, you can switch the EBS volume holding your MySQL database to a running extra large instance in a matter of seconds without having to copy the database across the network. Downgrade instance types later to save money.

Fast and easy backups - EBS snapshots alone can be a sufficiently attractive reason to move a database server to Amazon EC2. Being able to take live, consistent, binary snapshots of the database in just a few seconds is a thing of beauty. Add in the ability to create a new EBS volume from a snapshot so another EC2 instance can run against an exact copy of that database... and you've opened up new worlds of possibilities.

Technology choices

This guide shows examples using the Amazon EC2 API command line tools which are assumed to be installed on your local system. Many of the same results can be accomplished with the AWS Console, the Firefox EC2 plugin or with some of the 3rd party web management interfaces to Amazon EC2 such as RightScale.

This guide shows examples using Ubuntu 9.10 (Karmic). The same concepts would apply with slight modifications on Debian, Fedora, Red Hat, CentOS, and other Linux distributions. The latest versions of the Ubuntu AMIs can be found on the following page maintained by the author: http://alestic.com

This guide shows examples using the XFS file system. Besides being a stable, modern, high performance, journaling file system, XFS supports file system freeze/thaw which is extremely useful for ensuring a consistent state during EBS snapshots. XFS also supports file system growth which can be used if your database and other data are reaching the limits of your current volume size.



Setting up an EBS volume on an EC2 instance for use with MySQL



To get started, we'll run an EC2 instance, create an EBS volume, and attach the volume to the instance. You can run the instance in any availability zone, just make sure to create the volume in the same zone so it can be attached to the instance.

As mentioned in the previous section, we assume that you have installed the EC2 API command line tools on your local system.

Run an instance of Ubuntu 9.10 Karmic base install specifying your ssh keypair name. Make a note of the instance id (say, i-IIII1111). Check to see if the instance is running (might take a minute) and make a note of the external hostname (say, HOST1111).

ec2-run-instances -z us-east-1a --key YOURKEYPAIR ami-1515f67c

ec2-describe-instances i-IIII1111
Create a new 10 GB EBS volume and make a note of the volume id (say, vol-VVVV1111). Check to see if the new volume is available (might take a few seconds).

ec2-create-volume -z us-east-1a -s 10

ec2-describe-volumes vol-VVVV1111
Once it's available, attach the EBS volume to the instance as /dev/sdh

ec2-attach-volume -d /dev/sdh -i i-IIII1111 vol-VVVV1111


Now we can set things up on the instance itself, so connect to it and install the necessary software on the instance. Enter and record a secure MySQL root password when prompted.

ssh -i YOURSSHKEYFILE ubuntu@HOST1111

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y xfsprogs mysql-server
Create an XFS file system on the EBS volume and mount it as /vol

grep -q xfs /proc/filesystems || sudo modprobe xfs
sudo mkfs.xfs /dev/sdh

echo "/dev/sdh /vol xfs noatime 0 0" | sudo tee -a /etc/fstab
sudo mkdir -m 000 /vol
sudo mount /vol
You now have a 10 GB (or whatever size you specified) EBS volume mounted under /vol with an XFS file system, and it will be automatically mounted if the instance reboots.

Anything you store under /vol (including MySQL files) will persist beyond the life of the current instance, and you can take snapshots of this volume for backup or replication.

Configuring MySQL to use the EBS volume

Now that we have an EBS volume mounted on the instance with a good file system, let's put the MySQL database on that volume and tell MySQL where it is.
Stop the MySQL server.

sudo /etc/init.d/mysql stop
Move the existing database files to the EBS volume. Point MySQL to the correct database files on the EBS volume using mount bind.

sudo mkdir /vol/etc /vol/lib /vol/log
sudo mv /etc/mysql     /vol/etc/
sudo mv /var/lib/mysql /vol/lib/
sudo mv /var/log/mysql /vol/log/

sudo mkdir /etc/mysql
sudo mkdir /var/lib/mysql
sudo mkdir /var/log/mysql

echo "/vol/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
sudo mount /etc/mysql

echo "/vol/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/lib/mysql

echo "/vol/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/log/mysql
Restart the MySQL server.

sudo /etc/init.d/mysql start
You are now running MySQL with all of the data and binary log files persistently stored on a high performance, redundant EBS volume!

To prove to yourself that a later snapshot saved your database changes, you might want to load some data or simply create a placeholder database with a SQL statement like:

mysql -u root -p -e 'CREATE DATABASE tutorial_sample'
Your data is pretty safe here, but let's make it even safer with snapshot backups.

Snapshotting the database

An EBS snapshot is a point in time copy of the complete EBS volume. It will save the current state of all files that were placed on that volume at a block level including the MySQL database data and binary logs. Snapshots are saved to Amazon S3 which is even more secure than EBS in that it is archived in multiple geographic locations.

Since file systems and databases often have things in memory on their way to disk and active processes can be changing the state of the disk so that it isn't always entirely consistent with itself, we take pains to flush, lock, and freeze the database and the file system for the few moments that it takes to create the EBS snapshot. This may cause a slight pause in activity on that system, but if the process is automated, it tends to be sufficiently short that most folks won't notice.

To be able to type all the required commands in a single connection to the EC2 instance, this example uses the mysql "SYSTEM" statement to run command line programs, but these commands don't really have to be run from inside MySQL to be effective.

Start a MySQL session on the instance, using the password you set above.

mysql -u root -p
In the mysql session, flush the tables to disk and acquire a lock. Flush the file system to disk and freeze it. Do not exit the MySQL session or you will lose the lock and snapshot potentially inconsistent database files!

FLUSH TABLES WITH READ LOCK;
SHOW MASTER STATUS;
SYSTEM sudo xfs_freeze -f /vol
Note: The output from SHOW MASTER STATUS can be handy if you later want to start a slave database from the snapshot.

On your local system (which has the EC2 API command line tools installed) create a snapshot of the EBS volume. Make a note of the snapshot id (say, snap-SSSS1111).

ec2-create-snapshot vol-VVVV1111
Back in the same MySQL session on the instance, unfreeze the file system, release the database lock, and you're done!

SYSTEM sudo xfs_freeze -u /vol
UNLOCK TABLES; 
EXIT
Though the ec2-create-snapshot command returns quickly, the actual snapshot may take a while to complete writing to S3. Have no fear, it will be consistent as of the time the snapshot was initiated above and no further database or disk writes on the instance will affect it.

You can monitor the progress of the snapshot with this command:

ec2-describe-snapshots snap-SSSS1111
Note: If you have a busy database with some long running statements, then acquiring a database lock may be difficult without interfering with operations. However, if all of your tables use the InnoDB engine, then you may skip the LOCK/UNLOCK statements above. MySQL will restore the database to a consistent state when it is run against the binary backup.

Automated snapshot program

The above sequence of MySQL statements and shell commands can be a bit of a hassle when performed manually, not to mention that database activity will be blocked while you are typing, so...

The ec2-consistent-snapshot program automates the appropriate flushing and locking of MySQL and XFS file systems while the EBS snapshot is initiated. To install this on Ubuntu, use the following steps:

codename=$(lsb_release -cs)
echo "deb http://ppa.launchpad.net/alestic/ppa/ubuntu $codename main"|
  sudo tee /etc/apt/sources.list.d/alestic-ppa.list    
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BE09C571
sudo apt-get update
sudo apt-get install -y ec2-consistent-snapshot
sudo PERL_MM_USE_DEFAULT=1 cpan Net::Amazon::EC2
The documentation can be accessed using:

man ec2-consistent-snapshot
This program can be run from a scheduled cron job on the EC2 instance to automate backup snapshots while you sleep.

Since each snapshot only takes up space based on which blocks have changed since the last snapshot and since there may be additional compression applied, the incremental cost of frequent snapshots can sometimes be small.

Restoring the snapshotted database

So you want to check out the snapshot of your MySQL database to see if it really has the right data. Or, you'd like to test some code on an instance which has nearly current production data without risk to the live production database. Or, you want to start a MySQL replication slave. Or, you need to recover from an unfortunate DELETE statement without a WHERE clause...

We'll start another EC2 instance to run the second database server. It is not necessary to terminate the original instance; both can be running in parallel. The second instance and volume must be together in the same availability zone, though it does not have to be where the first instance/volume reside.

Run a second instance, making a note of the instance id (say, i-IIII2222). Check to see if the instance is running (might take a minute) and make a note of the external hostname (say, HOST2222).

ec2-run-instances -z us-east-1b --key YOURKEYPAIR ami-1515f67c

ec2-describe-instances i-IIII2222
Create a second EBS volume based on the snapshot of the original volume and make a note of the volume id (say, vol-VVVV2222). Check to see if the second volume is available (might take a while).

ec2-create-volume -z us-east-1b --snapshot snap-SSSS1111

ec2-describe-volumes vol-VVVV2222
Once it's available, attach the second EBS volume to the second instance as /dev/sdh

ec2-attach-volume -d /dev/sdh -i i-IIII2222 vol-VVVV2222
Note: If the original instance had crashed or been terminated, we could skip the creation of a second volume from a snapshot and simply attach the original volume to the second instance. The remainder of these instructions would apply just the same for getting up and running with that original volume, though you might want to run xfs_check just before mounting to make sure the file system is in a consistent state after the crash.

Now, hop on to the second instance, install the required software, and mount the attached EBS volume. (The MySQL password does not matter here because we will be using a pre-existing database.) We also make sure the files are owned by mysql, just in case UIDs are different on the new instance.

ssh -i YOURSSHKEYFILE ubuntu@HOST2222

sudo apt-get update && sudo apt-get upgrade -y
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get install -y xfsprogs mysql-server

echo "/dev/sdh /vol xfs noatime 0 0" | sudo tee -a /etc/fstab
sudo mkdir -m 000 /vol
sudo mount /vol

sudo find /vol/{lib,log}/mysql/ ! -user  root -print0 | 
  sudo xargs -0 -r chown mysql
sudo find /vol/{lib,log}/mysql/ ! -group root -a ! -group adm -print0 |
  sudo xargs -0 -r chgrp mysql
Point MySQL to the correct database files on the EBS volume.

sudo /etc/init.d/mysql stop

echo "/vol/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
sudo mount /etc/mysql

echo "/vol/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/lib/mysql

echo "/vol/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
sudo mount /var/log/mysql

sudo /etc/init.d/mysql start
You now have a second machine running against an exact copy of the first database at the time of the snapshot. Imagine the possibilities and smile!

You can verify this by looking for the "tutorial_sample" database you created earlier.

mysql -u root -p -e 'SHOW DATABASES'
Note: Each of these instances has mounted a different volume and is using a different set of database files. Though they would have started out sharing similar values in the database, any changes made in one will not be reflected in the other.

Cleanup

If you followed the above steps, you will have created resources which will continue to be charged against your EC2 account until you release them. Here are the steps to shut down and delete everything created in this tutorial. The first commands run on the instances:

Unmount the EBS volume file systems on each of the EC2 instances.

sudo /etc/init.d/mysql stop
sudo umount /etc/mysql /var/lib/mysql /var/log/mysql /vol
The rest of the commands should be run on your local system (which has the EC2 API command line tools installed):

Detach EBS volumes from EC2 instances, delete the volumes, delete the snapshots, and shutdown the instances.

ec2-detach-volume vol-VVVV1111
ec2-detach-volume vol-VVVV2222

ec2-delete-volume vol-VVVV1111
ec2-delete-volume vol-VVVV2222

ec2-delete-snapshot snap-SSSS1111

ec2-terminate-instances i-IIII1111
ec2-terminate-instances i-IIII2222
Verify that it's all gone.

ec2-describe-instances
ec2-describe-volumes
ec2-describe-snapshots
Feedback

Please send feedback, corrections, and recommended enhancements to the author:
Eric Hammond <ehammond-ec2@thinksome.com>

Questions may be posted to the Amazon EC2 Forum so others can pitch in with and benefit from answers.

I am especially interested in notes about what specific steps you changed to get this guide to work on other Linux distributions. These may be included in an update to this tutorial.

Thanks for ideas, code, and suggestions: Mark Callaghan, petterim, Rodney Quillo, smarttux, B. True, nrforum, mattjive

Resources

Feature Guide: Elastic Block Store
Amazon EC2 Developer Guide (Elastic Block Store)
Amazon EC2 Getting Started Guide (running and connecting to instances)
XFS file system
Ubuntu and Debian AMIs for Amazon EC2
MySQL snapshots and replication info
UPDATES

The following information has come out since the original publication of this tutorial:

The ext3 and other file systems can also be used to create consistent snapshots with EBS if they are layered on top of LVM or dmsetup. The "dmsetup suspend" and "dmsetup resume" commands take care of the file system freezing. [more info about setting up], [more info about suspending/resuming]
HISTORY

2010-03-22
Upgrade sample commands to work with Ubuntu 9.10 Karmic AMI.
2009-10-16

umount even the bind mount points, thanks to Ben Standefer
2009-10-02

Updated script pointer to ec2-consistent-snapshot
Converted to Jaunty
2009-08-14

Create mount point with mode "000" to help protect against accidentally using it when the EBS volume file system is not mounted.
Mention the AWS console
Update Ubuntu AMI id
2009-05-24

Switch to using mount bind so that these instructions will work with the default Apparmor configuration.
Add "sudo" so that these instructions will work with the Ubuntu images for EC2 published by Canonical (which require you to log in as a normal user).
2008-08-20

Initial document publication.


Related Documents
	 Running Microsoft SQLServer on Amazon EC2

Discussion	

The 5 most recent discussion messages. View full discussion.

Eric Hammond


Posts: 1,179 
Registered: 7/7/07
Re: Use of XFS for EBS volumes as recomended by article 
Posted: Nov 30, 2009 6:05 PM PST	     in response to: borism1	 	
 		Reply

borism1: Make sure you're using the same account credential information in the cron job. 


borism1	 Posts: 30 
Registered: 8/20/07
Re: Use of XFS for EBS volumes as recomended by article 
Posted: Dec 2, 2009 7:28 AM PST	     in response to: Eric Hammond	 	
 		Reply

Hi Eric, 

Thanks for your replay. My script is running in root cron. 

Cron <root@ip-10-224-114-100> perl /usr/bin/ec2-snapshot-xfs-mysql.pl /persistent vol-e0c22789 > /persistent/logs/logfromcron.log 


Client.InvalidVolume.NotFound: The volume 'vol-e0c22789' does not exist. 

Thanks. 

Boris 


borism1	 Posts: 30 
Registered: 8/20/07
Re: Use of XFS for EBS volumes as recomended by article 
Posted: Dec 7, 2009 3:17 PM PST	     in response to: borism1	 	
 		Reply

Hi! 

I resolved this by adding EC2_URL to takesnapshot. My instance is running in EU west region. 

Boris 
http://milikic.tel


devteam	 Posts: 13 
Registered: 10/15/09
Re: Use of XFS for EBS volumes as recomended by article 
Posted: Apr 12, 2010 1:38 AM PDT	     in response to: borism1	 	
 		Reply

Hi, 
has this tip of storing database at EBS rather than default location any impact on performance? 

Thanks. 


ssundy1	 Posts: 1 
Registered: 9/2/09
Re: Use of XFS for EBS volumes as recomended by article 
Posted: May 27, 2010 8:49 PM PDT	     in response to: Caleb Maclennan	 	
 		Reply

Eric.  Excellent.  Works out of the box as usual.  I've been using your  ami-1515f67c for some time as a cloud slave-server.  I'd like to move both master and slave to AWS using the EBS image you describe in the tutorial.  When creating  the second instance you describe installing all the software and pointing to the relocated mysql files etc.  Is is possible to bundle the fully configured instance then just launch it to create a slave server or if the instance terminates or should each new instance be reloaded and configured each time?  Thanks. 



Reviews	
	Write a Review
         

Thanks for cutting to the chase, Aug 21, 2008 4:53 AM 
Reviewer: Caleb Maclennan
Thanks for a concise and helpful rundown of the basic issues involved here. Sometime I would love to see other people's thoughts on how to tune mysql's internal cache and other variables for speed and reliability on EBS, but this article was exactly what i needed to get started quickly.
         

Great tutorial, Aug 21, 2008 6:48 AM 
Reviewer: simonebrunozzi
Congratulations, Eric, this tutorial is very well written, concise, and clear. I am sure it will be useful for many developers. Keep the good job :-)
         

great tutorial, Aug 21, 2008 1:52 PM 
Reviewer: petterim
Thank you very much. However I had to change one thing: perl -pi -e 's%/var/log/%/vol/log/%' /vol/log/mysql-bin.index to: perl -pi -e 's%/var/log/%/vol/log/%' /vol/log/mysql/mysql-bin.index and it worked.
         

This is great, Aug 24, 2008 8:42 AM 
Reviewer: Mark Callaghan
Both the feature and your notes are great. You always want to use FLUSH TABLES WITH READ LOCK whether or not InnoDB is in use. Otherwise you risk getting the snapshot with DDL in mid-flight (frm file exists and storage engine does not know about it, frm file does not exist and storage engine thinks it does).
         

Great article., Aug 27, 2008 2:23 PM 
Reviewer: smarttux
Thanks for posting this. Is there any reason one shouldn't use /var/lib/mysql symlinked to /vol/lib/mysql ? Then the reconfiguring mysql part can be skipped.
         

Awesome, Sep 3, 2008 7:46 PM 
Reviewer: srigotti
Dude, this is awesome. I tried all over the web to get the backup setup for my EC2 mysql instance and couldn't find anything until I stumbled upon this. I tried the steps you mentioned and it worked like a gem. Thanks a lot for all your hard work for writing such a detailed steps and also, making it work. I owe a bunch of thanks to you for it.
         

Minor changes to get it working on Fedora-based instances, Sep 4, 2008 3:49 PM 
Reviewer: B. True
This is a very concise tutorial and worked for me on a Fedora instance, except for some changes needed to the /etc/init.d/mysqld startup script. The change needed was to update the references in /etc/init.d/mysqld to point to /vol (/var is hard-coded in the file) and to add -S$socketfile to the line that calls /usr/bin/mysqladmin to point to our non-standard socket file location. Other than that, great job!
         

anything for dumb people as me?, Oct 20, 2008 1:12 PM 
Reviewer: tomaskapler
Your article seems nice, but actually for not so skilled men I am afraid it is too unueasy. I have just been on Simones presentation of AWS, and i like it, and i want to start using AWS for some (all?) of our projects, but I'm not sure if we will be able to do what is all necessary. Today, we are using simple managed serverhosting, so when i want to install some PHP+mysql website, i just click in our management to create (sub)domain and database, define name and password for ftp and database and that's it (30 seconds totaly with one simple browser window with few fields). Then i put there our PHP scripts using FTP, they automaticaly generate the database tables (or I do it using our common PHPmyAdmin) and voila - it works. I'm now trying to find such simple way of using AWS and replace our managed serverhosting, but all seems so difficult. But anyway thank you for this article, i will post it to my programmers with some linux experience, thay may understand it better then me. Or if someone will find some easy article like "how to install wordpress CMS on AWS for novices", i would love a link on tomas@kapler.cz, thank you ;)
         

Perl DBI Dependency, Oct 22, 2008 7:25 PM 
Reviewer: Alex Farrill
N.B. I needed to apt-get install libdbi-perl to run this script Alex
         

Terminating scenario, Nov 12, 2008 2:03 AM 
Reviewer: contextin
Great article. Thanks. I have one question though - When terminating the instance, are there any preparations needed to be made? (unmounted the device? detaching?) Can I simply terminate the instance and they, say the next day, restart and instance and have everything working properly? (Assuming, of course, I bundled an AMI after following these instructions and the volume is untouched) Thanks again...
         

Great tutorial, Jan 18, 2009 5:44 AM 
Reviewer: awsmrami
Great tutorial on how setting up MySQL on an AMI with EBS on EC2. Almost exact same steps can be applied for Fedora. Since this tutorial was written pre-AWS Management Console, I've written a tutorial for doing the above steps using AMC, heavily based upon this tutorial. Hope you find that useful too.
         

Watch out for AppArmor, Feb 1, 2009 3:09 PM 
Reviewer: alanol
Hello, Fantastic article. the only issue I had was that AppArmor needed to be updated with the new data locations. Details: https://wiki.ubuntu.com/AppArmor Step 1 Edit: /etc/apparmor.d/usr.sbin.mysqld Step 2 : sudo invoke-rc.d apparmor restart -A
         

Looks great..but I am getting errors, Feb 19, 2009 12:55 PM 
Reviewer: vpolineni
Hi, We use Intrepid 8.10. After mount /vol, my systems hangs up. I cannot login or access my application. If I reboot the instance (from ec2 web console), that doesnt help. When I do mkfs.xfs /dev/sdh, it tells me that there is an existing file system at /dev/sdh, use -f option to force it. I tried it with -f and I also tried by skipping the mkfs.sxfs step. apt-get upgrade is updating many files, so I also tried to skip it, but no use. Please help. Thank you
         

Excellent, Feb 25, 2009 4:33 AM 
Reviewer: Richard Rauser
Great article. After following this tutorial on a Fedora instance I had a small problem with my PHP config and MySQL client config, but these problems were easily remedied by a couple changes outlined here: http://www.richardrauser.com/index.php/2009/01/28/aws-elastic-block-store-mysql-tutorial/
         

Worked for me, Feb 27, 2009 9:37 AM 
Reviewer: Robert Krikorian
I'm new to EC2 and Ubuntu, just migrating my web app from Solaris on another cloud computing platform. If everyone wrote tutorials with this clarity the world would be a better place. Thanks!
         

Great methodology, Apr 13, 2009 2:33 AM 
Reviewer: thegreyham
Hi Eric - this is a great tutorial, I've now set up two servers one 64 bit the other 32 and it's working very well for me. I've also built my apache files onto the EBS volume so I can switch between a small, large xl server depending on the traffic on my site. next step is to build load balancer, with multiple apache/mysql servers - still need to the traffic to grow though :) Graham
         

Great tutorial, May 7, 2009 3:03 PM 
Reviewer: zoodak
Thanks for posting great tutorial. It guides me properly while start setting-up my test environment from scratch. Anyway I tried using symbol link instead of modifying mysql configuration, but I failed to run mysql successfully. Is there anyone who succeeds in using symbolic link. I tried to make a symbol link ln -s /vol/lib/mysql /var/lib/mysql.
         

Fantastic Tutorial, May 25, 2009 11:50 AM 
Reviewer: Gandalf
AWS and the Ubuntu LAMP community owes Eric Hammond a debt of gratitude. He is one of the most effective, generous, and clear-minded technologists out there. This tutorial works perfectly and I refer to it often.
         

Very nice solution, Jun 22, 2009 3:29 PM 
Reviewer: jorgegrippo
I second all those of us who were benefit by your exceptional tutorial. I wanted to add it is full of beauty. Whis is not so easy to find on technical writings. Thanks Eric.
         

good tutorial, Jul 21, 2009 5:36 PM 
Reviewer: nlazouzi
Hello, Thank you for this tutorial. It's been great help. I am however having a small problem. when i run the following: SYSTEM xfs_freeze -f /vol i get >> xfs_freeze: cannot freeze filesystem at /vol: Operation not permitted any ideas on what could be causing this ? ANy suggestions are most certainly welcome. Thank you Nabil
         

Very helpful, Aug 15, 2009 1:41 PM 
Reviewer: jpmalek
Great stuff. Thanks much for your work.
         

Great, Oct 22, 2009 9:48 AM 
Reviewer: Nancy W. Abramson
Thanks for the simple and straight forward instructions.
         

very concise yet thorough, Nov 17, 2009 9:05 AM 
Reviewer: siiva
Thank you Eric for everything you do for the ec2 community. Just an FYI for others using this now: You may not have to run this command: sudo modprobe xfs I'm using Ubuntu 9.10, so not sure if there was a change from the time this was written to now. Thanks
         

Thats great - but it needs a little extra scripting, Mar 12, 2010 9:49 AM 
Reviewer: sambastream
I used this article as a starting point, and the ec2-consistent-snapshot program is great, but whats missing is an automated way of removing old snapshots so you don't go over AWS's 500 snapshot limit and end up keeping way more than you need - if you did hourly backups within a few weeks you'd hit 500 snapshots and it becomes unmanagable without automated tools to clean them up. In the interim until AWS or ec2-consistent-snapshot implement this much needed functionality I've written some easy to use scripts that use this program and a PHP script to automate the entire process: http://www.sambastream.com/blogs/dgildeh/12-03-10/implementing-revolving-backups-aws-ec2 I hope someone finds this useful!
         

Can't locate Net/Amazon/EC2.pm, Apr 20, 2010 5:30 PM 
Reviewer: Dmitry Amelchenko
I've been trying to get the automated snapshots to work with no much luck, every time I run ec2-consistent-snapshot i get following message: Can't locate Net/Amazon/EC2.pm in @INC (@INC contains: /etc/perl /usr/local/lib/perl/5.10.0 /usr/local/share/perl/5.10.0 /usr/lib/perl5 /usr/share/perl5 /usr/lib/perl/5.10 /usr/share/perl/5.10 /usr/local/lib/site_perl .) at /usr/bin/ec2-consistent-snapshot line 12. BEGIN failed--compilation aborted at /usr/bin/ec2-consistent-snapshot line 12. Googling for the keywords in the message does not yield any results, I think it's a problem with the latest stack of software packages (I've been through this procedure few month ago on another instance, and had no any problems at all). Has anyone tried to configure the automated snapshot recently? Has it been tested to work? Perhaps someone knows what the problem is and can suggest. Thanks
         

Very useful writeup, May 14, 2010 6:56 AM 
Reviewer: shiningleaf
Thanks for the great write up. Not only MySQl. I used the instructions given, to install my Apache also similarly (with conf, modules and logs on the EBS)
         

thank you, Jun 4, 2010 11:01 AM 
Reviewer: Brett D. Moser
The setup of the XFS filesystem and moving of MySQL files to the newly mounted /vol worked flawlessly. This guide really makes things simple and fast.
	
	
Welcome, Guest	
	Login


Community Recognition Guidelines Help Community RSS
AWS Blog  Press Inquiries Careers at AWS Contact Us Privacy Policy Terms of Use

© 2009-2010 Amazon Web Services LLC or its affiliates. All rights reserved. 







</entry>



<entry [Tue Jun 15 12:57:46 EDT 2010] CUSTOM LAUNCH OF AMI USING S3 BUCKET>




Patching AMI Instances with Updates on Amazon S3
http://developer.amazonwebservices.com/connect/entry.jspa?externalID=1403&categoryID=100

THREE MAIN POINTS:

1. STORE DATA ON S3

2. LOAD DATA ON AMI STARTUP USING /etc/rc.local SCRIPT

3. SAVE CHANGES BACK TO DATA ON S3

 
Using Amazon S3 for storage in Amazon EC2 deployments is free of transfer costs. This makes Amazon S3 the ideal place to store changing content. I'll also show you how to automate the use of Amazon S3 for your software changes so that your AMI will update itself at startup, with content from an Amazon S3 bucket.

As the article "Using Parameterized Launches to Customize Your AMIs," explains, the last startup script to run on the Fedora Core Linux distribution is called /etc/rc.local. You can modify this script in your AMIs to download, from a specific Amazon S3 bucket, the sets of changes to perform on your system and to apply them to an instance.

The changesets can consist of any kinds of files. The example in this article relies on a script called autostart.sh, tucked inside a compressed .tar file, along with any other files you want to include. You have all the flexibility you need to manage your system changes. The important part is storing changes in Amazon S3, downloading them at instance startup, and running the script to apply the content to the running instance.

Implementing the System

To keep things simple, you'll use the s3sync utilities introduced in the article "Using Amazon S3 from Amazon EC2 with Ruby." These utilities simplify uploading to and downloading from protected Amazon S3 buckets. Install the s3sync utilities to the /usr/local/s3sync folder, and make sure that this folder is added to the system path:


## Edit /etc/profile and add /usr/local/s3sync to the $PATH
# vi /etc/profile

# cd /usr/local

# wget http://s3.amazonaws.com/ServEdge_pub/s3sync/s3sync.tar.gz

# tar xzf s3sync.tar.gz
Besides installing s3sync, you'll need to modify /etc/rc.local. In this example, you'll hard code the name of the Amazon S3 bucket and Amazon authentication keys, but you could use this system along with parameterized launches to make the script much more flexible.


## Copy the following to the end of your /etc/rc.local file

# replace xxxx with your AWS access key
AWS_ACCESS_KEY_ID=xxxx

# replace yyyy with your AWS secret
AWS_SECRET_ACCESS_KEY=yyyy

# change this to your own S3 bucket name
S3_CHANGESETS_BUCKET=pjc_changesets

mkdir -p /tmp/changesets
cd /tmp/changesets/

## This downloads all compressed .tar files stored in the Amazon S3 bucket.
## To keep things simple, this script does not recurse into folders.
s3sync.rb $S3_CHANGESETS_BUCKET:/*.tgz /tmp/changesets/

for file in *.tgz
do
   tar xzpf $file

   dirname=`echo $file | sed -e 's/.tgz//g' `

   if [ -d $dirname ]; then
      pushd $dirname

      if [ -e autorun.sh ]; then
         /usr/bin/bash autorun.sh
      fi

      popd
   fi
done
The script downloads all files with extension .tgz into the folder /tmp/changesets/. Then the script loops over the .tgz files, in alphanumeric order, extracting the content and executing the autorun.sh file inside. Really simple. All the magic is in autorun.sh and in the other content that you've stored in the compressed .tar file.

For example, let's say you have an Amazon EC2 instance serving up a Rails application, and you want to pull fixes from Amazon S3. To start, create one compressed .tar file, called myrailsapp01.tgz and containing the complete Rails application and the following script to deploy the application:

## autorun.sh
##
## Deploy the contents of the compressed .tar file. The Rails application 
## is in a folder named myrailsapp. You need to move it to /var/railsapps 
## and make a symlink of the public folder on the web server document 
## root. Then,  move a web server configuration file that sets up the 
## virtual host.

mv myrailsapp /var/railsapps/

ln -s /var/railsapps/myrailsapp/public /var/www/myrailsapp

mv myrailsapp-virtualhost.conf /etc/httpd/conf.d/

Suppose that you later need to make a change to myrailsapp. You have at least two options: You can recreate the file myrailsapp01.tgz with the new content, or you can make a patch by using the diff -u command :

# diff -u myrailsapp-previous myrailsapp-current > myrailsapp-patch.diff
Then, pack the patch into the file myrailsapp02.tgz by using the following autorun.sh script:

## autorun.sh
##
## Apply patch to myrailsapp.

cd /var/railsapps/myrailsapp

patch -u -p2 < myrailsapp_patch.diff
If you upload myrailsapp02.tgz to the Amazon S3 bucket, the next time the Amazon EC2 instance is started, the modified /etc/rc.local script will download both compressed .tar files, myrailsapp01.tgz and myrailsapp02.tgz, unpacking them in alphanumerical order and processing the autorun.sh script in each archive.

Conclusions

You might prefer to recreate the compressed .tar file with the changed content rather than use diff files. Using the modified /etc/rc.local script and your Amazon S3 bucket, you can put anything you want into your compressed .tar files, and the autorun.sh script gives you unlimited flexibility in deploying anything to your AMI instance. These files don't need to hold "content" in the usual sense at all.

When you combine the /etc/rc.local script with the concepts shown in the "Using Parameterized Launches to Customize Your AMIs," you can have the ability to specify at launch which Amazon S3 bucket your AMI instance should use to get its changesets.

I hope the concepts in this example have sparked some ideas about how to simplify change deployment to your AMIs, increasing bandwidth and storage efficiency.

PJ Cabrera is a freelance software developer specializing in Ruby on Rails e-commerce and content management systems development. PJ's interests include Ruby on Rails and open-source scripting languages and frameworks, agile development practices, mesh networks, compute clouds, XML parsing and processing technologies, microformats for more semantic web content, and research into innovative uses of Bayesian filtering and symbolic processing for improved information retrieval, question answering, text categorization, and extraction. You can reach him at pjcabrera at pobox dot com, and read his weblog at pjtrix.com/blawg/



Related Documents
	 s3sync and s3cmd in Ruby

Discussion	

The 5 most recent discussion messages. View full discussion.

Sriram Natarajan	 Posts: 2 
Registered: 6/19/08
Patching AMI Instances with Updates on Amazon S3 
Posted: Jun 19, 2008 12:50 AM PDT	 	
 		Reply

Just a thought... if some one is using OpenSolaris based AMI, then you can simply leverage on the ZFS file system - default within OpenSolaris and take snap shot and can roll back based on it, if necessary 

create a location where you want to host the site 
pfexec /usr/sbin/zfs create rpool/var/railapps 
pfexec /usr/sbin/zfs set mountpoint=/var/rails rpool/railapps 
pfexec /usr/sbin/zfs snapshot rpool/railapps 

pfexec /usr/sbin/zfs rollback rpol/railapps 


PJ Cabrera	 Posts: 1 
Registered: 11/12/07
Re: Patching AMI Instances with Updates on Amazon S3 
Posted: Jun 23, 2008 2:40 PM PDT	     in response to: Sriram Natarajan	 	
 		Reply

Hi Sriram, thanks for your comment. 

Your assertion about OpenSolaris is correct, but only if your AMI instance is using persistent storage. Persistent storage is not the default configuration for most instances and is still in limited beta availability. 

Even with persistent storage, I hope you're taking advantage of the inexpensive S3 cloud to store backups of important data and code. We all back up our data, right?  


Reviews	
	Write a Review
         

Wildcard problems, Jun 27, 2008 6:18 AM 
Reviewer: mckenfra
Great tutorial, but the following does not work for me: s3sync.rb $S3_CHANGESETS_BUCKET:/*.tgz /tmp/changesets/ When I run this with my bucket, it doesn't return anything, because it doesn't interpret the wildcard. Any idea why this works for you and not me?
         

Distinguishing OS and Frameworks from Application, Sep 10, 2008 8:18 AM 
Reviewer: "sublime1"
As I understand it, this methodology is mainly for changing the parts of the system you're in control of -- your application, like Rails. This is what I would call a software release, and maybe using a patch approach is a good way of handling this. But it seems like reinventing a wheel. Or maybe I am not understanding what your objective is. But is this really the best approach for managing the stack of applications (e.g. OS fixes/updates, plus Apache, MySQL, postfix, java, etc.) that are maintained by a third party and installed as packages? Before you save your customized AMI the first time, you might use yum or apt-get to make sure the AMI is up to date, then save it to an S3 bucket. But a month later, perhaps a new version of Apache is available, or a security patch to postfix, or Linux comes out? Sure, you could run yum or apt-get every time you fire up an instance, but that's not a fast process, and gets longer over time, and would need to be repeated for each AMI (in which case, you would be better off just running the update from within each AMI instead of reloading. But this creates a chance for instances to become out of sync. So I am probably just missing the point on this, but it might be worth clarifying the use case of your solution. Tom
         

Great idea and writeup! But..., Aug 23, 2009 6:48 PM 
Reviewer: Paul Ryan
...the article seems a bit out of date, as a crucial line of the init script is (now) inaccurate. The learning curve to figure out what tweaks to make was steep (for me), but I took the hill in the end. The central issue is the one pointed out by the reviewer mckenfra (gulp) a year ago: S3 doesn't accept wildcards in specifying which files to pull out of S3. Of course this need is key to the concept, so a workaround was needed, and that turned out to be to use a tricky regex with the --exclude parameter with s3sync.rb. So that line became /usr/local/s3sync/s3sync.rb -v --exclude=".*\.(?!tgz$)" $S3_CHANGESETS_BUCKET: /tmp/changesets/ Also, on my Fedora8 install, the line /usr/bin/bash autorun.sh was adjusted to /bin/bash autorun.sh Another important item of note which the article didn't make so clear is that when you tar up your autorun.sh files into a .tgz archive, be sure to place the autorun.sh into a subdirectory before before the tar'ring. Script jockeys looking at the code will see this straight off, but those who aren't, like me, it took work to make sense of it. Finally, I definitely recommend reading about s3sync *first* in the document linked by the author, so you get a sense of what that tool does before implementing this solution. One thing I had to do on my Fedora8 platform for the sake of s3sync was to install Ruby. Thankfully that's exceedingly easy with the command: yum install ruby HTH. The solution is working great now! I hope this feedback will turn others onto it.


</entry>



<entry [Tue Jun 15 12:57:46 EDT 2010] MOUNT S3 ON AMI>



http://nerdvittles.com/index.php?p=235#comments
By Scott, Thursday, May 13, 2010 @ 12:29 pm

Regarding S3, I am embarrassed to admit I didn’t make it all the way down the article before i started configuring. Therefore when it told me to edit the script and change the location, I immediately knew I needed a way to mount my s3 store. So I stumbled upon the s3fs GoogleCode site, and this was what I did:

(1) yum install fuse-devel
(2) echo modprobe fuse > /etc/sysconfig/modules/fuse.modules
(3) wget http://s3fs.googlecode.com/files/s3fs-r191-source.tar.gz
(4) tar xzvf s3fs-r191-source.tar.gz
(5) cd s3fs
(6) make
(7) cp s3fs /usr/bin
(8) entered my credentials in /etc/passwd-s3fs in the format AccessKey:SecretKey
(9) mkdir /mnt/s3fs (in case its not there already)
(10) echo /usr/bin/s3fs mybucket /mnt/s3fs >> /etc/rc.d/rc.local
(11) then to get it running without a reboot I ran “modprobe fuse” and then “/usr/bin/s3fs mybucket /mnt/s3fs”

I then changed to that directory, and did a listing. All was well. Going to be testing a migration to a completely different box later today. Thanks, this stuff ROCKS!




</entry>



<entry [Wed Apr 21 10:19:07 EDT 2010] RUN MYSQL ON EC2, SAVE TO ELASTIC BLOCK STORAGE - $0.10 / GB>



With Amazon Elastic Block Store, you only pay for what you use. Volume storage is charged by the amount you allocate until you release it, and is priced at a rate of $0.10 per allocated GB per month Amazon EBS also charges $0.10 per 1 million I/O requests you make to your volume. Programs like IOSTAT can be used to measure the exact I/O usage of your system at any time. However, applications and operating systems often do different levels of caching, so you will likely see a lower number of I/O requests on your bill than is seen by your application unless you sync all of your I/Os to disk.

As an example, a medium sized website database might be 100 GB in size and expect to average 100 I/Os per second over the course of a month. This would translate to $10 per month in storage costs (100 GB x $0.10/month), and approximately $26 per month in request costs (~2.6 million seconds/month x 100 I/O per second * $0.10 per million I/O).

Snapshot storage is based on the amount of space your data consumes in Amazon S3. Because data is compressed before being saved to Amazon S3, and Amazon EBS does not save empty blocks, it is likely that the size of a snapshot will be considerably less than the size of your volume. For the first snapshot of a volume, Amazon EBS will save a full copy of your data to Amazon S3. However for each incremental snapshot, only the part of your Amazon EBS volume that has been changed will be saved to Amazon S3.

Volume data is broken up into chunks before being transferred to Amazon S3. While the size of the chunks could change through future optimizations, the number of PUTs required to save a particular snapshot to Amazon S3 can be estimated by dividing the size of the data that has changed since the last snapshot by 4MB. Conversely, when loading a snapshot from Amazon S3 into and Amazon EBS volume, the number of GET requests needed to fully load the volume can be estimated by dividing the full size of the snapshot by 4MB. You will also be charged for GETs and PUTs at normal Amazon S3 rates.



++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\
Wed Apr 21 10:21:49 EDT 2010
OPTIMISING MYSQL ON EC2 

COPIED FROM:
Wed Apr 21 09:58:33 EDT 2010
OPTIMISING MYSQL ON EC2 


1. CHECK PERFORMANCE

- use the BENCHMARK comand,
- set you startup options correctly,
- optimize the table structure (using the OPTIMIZE command!)
- optimize queries using EXPLAIN


2. CREATE INDEXES

Beyond hardware and software optimization is the optimization of tables, as well as SELECT queries. Table optimization, using the OPTIMIZE command, allows you to reclaim unused space. You can see how well (or not) optimized your queries are by using the EXPLAIN command. The resulting output will show if and when indexes are used, and whether you can use any indexes to speed up the given query.

Please keep in mind that adding an index will initially slow dow nyour database (the index needs to be set up and maintained by the system), but will speed up searches.

Also, keep in mind that indexes only work when the index is exactly the same as the searched values in the where clause. So, if you have an index on, say, ClientNo, but there is a select * from clients where clientno=10020 AND name ="Jones", the index will not work properly.

Other sources:
http://www.databasejournal.com/features/mysql/article.php/1382791
Badly defined or non-existent indexes are one of the primary reasons for poor performance, and fixing these can often lead to phenomenal improvements.


3. SET MEMORY, ETC.

http://www.debianhelp.co.uk/mysqlperformance.htm
Mysql provides a configuration file located in /etc/mysql/my.cnf. From here you can set all of the memory, table, and connection limits as well as a host of other options.

You can get the default buffer sizes used by the mysqld server with this command:

shell> mysqld --help
Optimize Mysql Database response time

The most important part for getting a system fast is of course the basic design. You also need to know what kinds of things your system will be doing, and what your bottlenecks are.


Q: How do you decide which fields in a MYSQL database to Index?
If you have a MYSQL database table with 20 or so fields, which ones do you decide to index? Is it only the primary key fields you index? Or should you index others? (2 answers - asked 39 months ago)
A: You index the fields that are expected to be used for look-ups.
Most generally, the index will cover the primary field(s). However, if there are going to be many searches on a non-primary field, you should validate whether putting in an index on that field is valid or not.



SOURCE:

http://askville.amazon.com/SimilarQuestions.do?req=large-MYSQL-database-amazon-S3-EC2

What is the best way to use a very large MYSQL database with amazon S3 and EC2?

My database is starting to get very large and slow down my dedicated server. I'm thinking about moving to Amazon storage. How can I make this move? I know amazon storage doesn't use MYSQL, but key=>value based storage. What is a...... (1 answer - asked 29 months ago)
A: It can be done, but not well
Amazon's EC2 service is a fantastic deal for a small-to-medium-sized company that needs scalability.  You build up your solution as a virtual machine image and they stick it on any number of machines you ask.  Easy as pie.

Amazon's S3 service is also pretty great.  You send some data and a key, and they store that data for you and let you retrieve it later with that same key.  Plenty of rights and permissions and whatnot, easy API's.  Very awesome stuff.

However, S3 is not a relational database.  It's a hash table.  You can MAKE it be a database, but it's extremely non-optimal.  This guy did it, and he's got some source code and a presentation on it if you really want to do that: http://fallenpegasus.com/code/mysql-awss3/

His presentation explains the main hiccup with trying to turn a hash into a database.  There's no WHERE clause.  You've got to pull down all of the possibly-interesting rows every single time, and that's just far too expensive, time-wise and money-wise.

Here's what you SHOULD do.  Use the EC2 service alone.  The biggest single machine they offer has 1.7 PETABYTES of storage space.  Run a MYSQL server on your EC2 service.  It's got more than enough space.  Run your program on the same machine, or possibly on a dedicated separate machine.  Think of the S3 services as your own personal computers.  You can do anything you want with them, and they're perfectly good database boxes.  They'll run you about 70 cents per hour.  You can probably get by with the lower-tier machines for quite some time, though.

So that's my advice.  Do NOT use S3 as something it's not.  Use it to store images or documents or customer data or webpages or whatever you like, but don't try to use it like a relational database.  Use a relational database for that.  And run your relational database on EC2.

Also, here's a good price calculator for EC2 and S3: http://calculator.s3.amazonaws.com/calc5.html?
Sources: http://www.amazon.com/b/ref=sc_fe_c_0_370375011_1/105-2628125-0034036?ie=UTF8&node=201590011&no=370375011
Q: What is the best way of optimizing a mysql database?
Short of referential integrity, how else should a mysql database be optimized? (1 answer - asked 39 months ago)
A: See below

At this site, http://www.samspublishing.com/articles/article.asp?p=29406&rl=1 there is a guideline on how to optimize your database.
In short,
- use the BENCHMARK comand,
- set you startup options correctly,
- optimize the table structure (using the OPTIMIZE command!)
- optimize queries using EXPLAIN

Summary
Running an optimized MySQL server starts with the hardware and operating system in use. Your system's CPU should be sufficiently fast, and you should have enough RAM in use to pick up the slack when your CPU struggles. This is especially true if MySQL shares resources with other processes, such as a Web server. Additionally, the hard drive in use is important, as a small hard drive will limit the amount of information you can store in your database. The seek time of your hard drive is important—a slow seek time will cause the overall performance of the server to be slower. Your operating system should not overwhelm your machine and should share resources with MySQL rather than using all the resources itself.

Some key startup parameters for MySQL are the values of key_buffer_size and table_cache, among others. Baseline values can be found in sample MySQL configuration files, or you can modify the values of these variables and watch the server performance to see whether you hit on the right result for your environment.

Beyond hardware and software optimization is the optimization of tables, as well as SELECT queries. Table optimization, using the OPTIMIZE command, allows you to reclaim unused space. You can see how well (or not) optimized your queries are by using the EXPLAIN command. The resulting output will show if and when indexes are used, and whether you can use any indexes to speed up the given query.

With all optimization—hardware, software, or related to queries—try to perform the modifications and tests in a development environment rather than a production environment. Locked tables or degraded server performance should be worked out in the development environment and not during prime time!
__

Other sources:
http://www.databasejournal.com/features/mysql/article.php/1382791
Badly defined or non-existent indexes are one of the primary reasons for poor performance, and fixing these can often lead to phenomenal improvements.

http://www.debianhelp.co.uk/mysqlperformance.htm
Mysql provides a configuration file located in /etc/mysql/my.cnf. From here you can set all of the memory, table, and connection limits as well as a host of other options.

You can get the default buffer sizes used by the mysqld server with this command:

shell> mysqld --help
Optimize Mysql Database response time

The most important part for getting a system fast is of course the basic design. You also need to know what kinds of things your system will be doing, and what your bottlenecks are.

The most common bottlenecks are:

Disk seeks. It takes time for the disk to find a piece of data. With modern disks in 1999, the mean time for this is usually lower than 10ms, so we can in theory do about 100 seeks a second. This time improves slowly with new disks and is very hard to optimise for a single table. The way to optimise this is to spread the data on more than one disk.

Disk reading/writing. When the disk is at the correct position we need to read the data. With modern disks in 1999, one disk delivers something like 10-20 MB. This is easier to optimise than seeks because you can read in parallel from multiple disks.

CPU cycles. When we have the data in main memory (or if it already were there) we need to process it to get to our result. Having small tables compared to the memory is the most common limiting factor. But then, with small tables speed is usually not the problem.

Memory bandwidth. When the CPU needs more data than can fit in the CPU cache the main memory bandwidth becomes a bottleneck. This is an uncommon bottleneck for most systems, but one should be aware of it.
Sources: http://www.samspublishing.com/articles/article.asp?p=29406&rl=1
Q: How do you decide which fields in a MYSQL database to Index?
If you have a MYSQL database table with 20 or so fields, which ones do you decide to index? Is it only the primary key fields you index? Or should you index others? (2 answers - asked 39 months ago)
A: You index the fields that are expected to be used for look-ups.
Most generally, the index will cover the primary field(s). However, if there are going to be many searches on a non-primary field, you should validate whether putting in an index on that field is valid or not.

Please keep in mind that adding an index will initially slow dow nyour database (the index needs to be set up and maintained by the system), but will speed up searches.

Also, keep in mind that indexes only work when the index is exactly the same as the searched values in the where clause. So, if you have an index on, say, ClientNo, but there is a select * from clients where clientno=10020 AND name ="Jones", the index will not work properly.
Sources: My knowledge 




</entry>



<entry [Wed Feb 17 13:37:02 EST 2010] TRIED TO DOWNLOAD JCVI-Cloud-BioLinux BUT DID NOT DOWNLOAD>




wget http://downloads.sourceforge.net/project/jcvicloud/JCVI-Cloud-BioLinux.zip?use_mirror=iweb



</entry>



<entry [Sat Dec 6 22:19:03 UTC 2009] HADOOP GUIDES>




http://hadoop.apache.org/common/docs/r0.17.2/hod_admin_guide.html

http://hadoop.apache.org/common/docs/current/cluster_setup.html




</entry>



<entry [Sat Dec 6 21:19:03 UTC 2009] BUNDLE A CUSTOMISED AMI FROM A GENERIC CENTOS LAMP AMI>





How to create an EC2 AMI
http://afkham.org/2008/10/how-to-create-ec2-ami.html


The easiest way to create an EC2 AMI (Amazon Machine Image) is to select one of the publicly available AMIs which suits your requirement. Let's say you selected an Ubuntu image, ami-0757b26e. If you don't have an Amazon Web Services (AWS) account, first create one. Also you will need to download the EC2 command line tools & then set them up. For instructions on how to setup the EC2 tools, read this.

Follw these step to create your AMI:

0. Generate a keypair if you have not already done so

e.g. ec2-add-keypair key1

The output will be something like the following:

KEYPAIR key1
-----BEGIN RSA PRIVATE KEY-----
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-----END RSA PRIVATE KEY-----

Copy the string starting from -----BEGIN RSA PRIVATE KEY----- up to -----END RSA PRIVATE KEY----- and save it in your keys directory, say in the /home/azeez/.ec2/keys/id_key1 file. Make sure that only the owner can read & write to that file.
i.e. chmod 600 /home/azeez/.ec2/keys/id_key1


1. Launch an instance of ami-0757b26e, providing a key, say key1, which you generated in step 0

ec2-run-instances ami-0757b26e -k key1
or you could use the ElasticFox GUI to do the same thing
The output will be something similar to
---------------------------------------------------------------------------------------------------
RESERVATION r-d5825cbc 610968236798 default
INSTANCE i-5c7dd335 ami-0757b26e pending key1 0 m1.small 2008-10-20T03:25:27+0000 us-east-1b aki-a71cf9ce ari-a51cf9cc
---------------------------------------------------------------------------------------------------


2. Connect to that instance using SSH,

e.g. ssh -i /home/azeez/.ec2/keys/id_key1 root@ec2-67-202-60-248.compute-1.amazonaws.com


3. Make the necessary changes to that instance. For example, you may install some custom software on that instance.


4. Upload your Amazon Web Services (AWS) private key (PK) & certificate (CERT) files to that instance. You can use scp to do this.
scp -i /home/azeez/.ec2/keys/id_key1 pk-XXX.pem cert-xxx.pem root@ec2-75-101-215-95.compute-1.amazonaws.com:/mnt/


5. On that instance, create an image of the current setup.
ec2-bundle-vol -k /mnt/pk-xxx.pem -c /mnt/cert-xxx.pem -u [user-id] -d /mnt

pk-xxx.pem = the PK file you uploaded in step 4
cert-xxx.pem = the CERT file you uploaded in step 4.
user-id = Your AWS User ID

In this step, you may wish to exclude some directories from the new image. Use the -e option followed by the ABSOLUTE path of the directories to be excluded. By default, some directories, like /mnt/, are excluded during image creation.


6. Create a bucket in Amazon S3. You can use s3fox to do this using a GUI, or use the command line tooling.


7. Upload the newly created image to your S3 bucket which was created in step 6
ec2-upload-bundle -b [your-s3-bucket] -m /mnt/image.manifest.xml -a [aws-access-key-id] -s [aws-secret-access-key-id]
aws-access-key-id = your AWS access key
aws-secret-access-key-id = your AWS secret access key.

8. Register the image. On your local machine, run
ec2-register [your-s3-bucket]/image.manifest.xml
The AMI ID will be displayed if the image was successfully registered. Say this was ami-af34d0c6

9. Test your image. Launch an instance of your new image. On your local machine run, e.g.
ec2-run-instances ami-af34d0c6 -k key1
or you could use the ElasticFox GUI to do the same thing

10. Connect to your new instance using SSH. This is similar to step 2.

That's it. You have just created your own AMI.

If you would like to make your AMI public, do the following:
1. ec2-modify-image-attribute --launch-permission -a all
2. Check the launch permissions of an AMI
ec2-describe-image-attribute -l
ami_id= the ID of the AMI
Posted by Afkham Azeez at 12:04 AM
Labels: Amazon EC2, Amazon S3, Amazon Web Services, howto
7 comments:

Ashok said...

    For those who want to bundle an Image of Windows Instances, Please bear in mind that we have to run ec2-bundle-instances command (run through EC2 API Tool) from the local machine rather than in that instances machine.

    I have found the above procedure in the ElasticFox manual on the page 20 and the stated text is:

    "Bundling a Linux/UNIX instance requires the use of the AMI tools, and differs from Windows in that the bundling is performed from within the running EC2 instance. (As described above, you need to bundle Windows from outside the actual EC2 instance)."

    And more over, to delete a created bundle in S3, I didn't find ec2-delete-bundle command in EC2-API Tools. For that I used S3Fox firefox plugin. And also, the author of this article (Azeez) has informed me that he used S3 command line tool.
    Thursday, November 27, 2008 10:49:00 AM IST 
Nir Simionovich said...

    Hi Azeez,

    Your post is great, helped me out big time when doing my first AMI on EC2.

    Check out my post regarding it at

    http://www.simionovich.com/?p=201

    Thanks again,
    Cheers
    Wednesday, January 21, 2009 11:33:00 PM IST 
Afkham Azeez said...

    Hi Nir,
    Glad that you found it useful.

    Regards
    Azeez
    Tuesday, February 24, 2009 7:06:00 AM IST 
Duncan said...

    Hi Azeez,

    Your post made creating my first AMI really clear, thanks a lot!

    Duncan
    Sunday, March 15, 2009 3:15:00 PM IST 
samuelj_2009 said...

    Hi,

    I was able to configure one Centos instance with Apache and MySQL on it using Elasticfox. I installed other tools which are required for my basic application hosting purpose. I wanted to instantiate the same instance multiple times so that I do not have to install all these tools always when I want a new instance. I understand that ec2 tools must be used for generating multiple instances with the same oonfiguration if the instances are based on Unix/Linux. Could you please tell me how can I use these tools to do that.

    Thanks,
    Sam
    Friday, March 27, 2009 7:16:00 AM IST 
joydeep said...

    very clear - thanks! much better than amazon documentation
    Tuesday, April 28, 2009 11:01:00 AM IST 
Anonymous said...

    Thanks for an excellent blog post.

    An alternative to installing ec2-register from the AWS api tools package is to use the AWS EC2 Management console: http://console.aws.amazon.com

    Then click on EC2 manager. Then click on AMI Images on the left. Then click the Register AMI Image at the top of the page.
    
    
    Friday, June 12, 2009 4:46:00 AM IST
    
    
    
</entry>