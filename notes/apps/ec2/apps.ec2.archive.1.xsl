apps.ec2.archive.1

<entry [Fri Nov  12 16:08:14 EST 2010] NO COST FOR USED ELASTIC IPS>



http://aws.amazon.com/ec2/#pricing
Elastic IP Addresses

No cost for Elastic IP addresses while in use
$0.01 per non-attached Elastic IP address per complete hour
$0.00 per Elastic IP address remap – first 100 remaps / month
$0.10 per Elastic IP address remap – additional remap / month over 100


</entry>



<entry [Fri Nov  12 16:08:14 EST 2010] METADATA QUERY TOOL + HOWTO AWS ACCESS IDENTIFIERS >



EC2 Instance Metadata Query Tool
http://aws.amazon.com/code/Amazon%20EC2/1825


AWS ACCESS IDENTIFIERS - SOME IMAGES BUT BETTER DONE AS A SCREENCAST
http://s3.amazonaws.com/mturk/tools/pages/aws-access-identifiers/aws-identifier.html


</entry>



<entry [Thurs Nov  11 16:08:14 EST 2010] AGUA VERSIONS>




AQUARIUS    2   Update script in /etc/rc.d/rc.local 
                    -   Read 'version file' to decide whether or not to convert
                        -   If /data/msyql not present, follow Autoload Sequence (see below)
                            and quit
                        -   Otherwise, if /root/version is less than /data/version
                            this new AMI contains updated applications
                            and 'agua2' database
                    -   Convert 'agua' to 'agua2':
                        -   Save 'agua' tables to .tsv files
                        -   Parse .tsv files to 'agua2' table format
                        -   Load .tsv files into 'agua2' (except apps, which remains unchanged)

AQUARIUS    1   Autoload sequence (called in /etc/rc.d/rc.local):
                    -   AMI contains applications and mysql installation with 'agua' database
                    -   Start httpd (allows reporting of errors in later steps)
                    -   If not exists, create 'data' EBS volume (max 1 TB, add manually later)
                        in user's own account
                    -   Mount 'data' EBS volume at /data
                    -   If not exists /data/mysql:
                        -   Load empty 'agua' database into /data/mysql:
                            -   'apps' table is already populated
                            -   'admin' user password is set to default 'open4admin'
                            -   Mysql root password is set to default 'open4root'
                    -   Start mysql from /data/mysql

STARCLUSTER 9   agua 0.5 with https enabled
STARCLUSTER 8   agua on starcluster
STARCLUSTER 7   agua on centos






</entry>



<entry [Thurs Nov  11 16:07:14 EST 2010] FAILED BOOT OF STARCLUSTER-9 USING ALL REFERENCED SCRIPTS IN /etc/rc.local>

    [/sbin/fsck.ext3 (1) -- /] fsck.ext3 -a /dev/sda1 
    /dev/sda1: clean, 129288/655360 files, 1282878/2621440 blocks
    [  OK  ]
    Remounting root filesystem in read-write mode:  [  OK  ]
    Mounting local filesystems:  mount: special device /dev/sdb does not exist
    mount: special device /data/mysql/etc/mysql does not exist
    mount: special device /data/mysql/lib/mysql does not exist
    mount: special device /data/mysql/log/mysql does not exist


CHECKED /dev BLOCK DEVICES:

ll /dev/sd*

    brw-r----- 1 root disk 8,  1 Nov 10 22:49 /dev/sda1
    brw-r----- 1 root disk 8, 96 Nov 10 22:48 /dev/sdg

WHICH MATCHES AWS INFO:

Block Devices:
/dev/sda1=snap-8929bae3:10:true

    10 GiB	
    Created by CreateImage(i-0caa7261) for ami-90d720f9 from vol-22ddc94b
    2010-11-08 11

/dev/sdg=snap-4928bb23:40:false


VIEW SYSLOG

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'dmesg'
    
    ...
    Floppy drive(s): fd0 is unknown type 15 (usb?), fd1 is unknown type 15 (usb?)
    Failed to obtain physical IRQ 6
    floppy0: no floppy controllers found
    lp: driver loaded but no devices found
    md: Autodetecting RAID arrays.
    md: autorun ...
    md: ... autorun DONE.
    device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: dm-devel@redhat.com
    device-mapper: multipath: version 1.0.5 loaded
    EXT3 FS on sdb, internal journal
    IA-32 Microcode Update Driver: v1.14a-xen < tigran@veritas.com>
    audit(1287910208.632:2): audit_pid=916 old=0 by auid=4294967295 subj=kernel
    NET: Registered protocol family 10
    lo: Disabled Privacy Extensions
    Mobile IPv6
    eth0: no IPv6 routers present



VIEW SYSLOG:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'tail -f /var/log/messages'

USE fuser TO FIND OUT WHICH PROCESS IS KEEPING THE DEVICE BUSY:
fuser -m /dev/sdi
    /dev/sdi:             2327c

ps aux | grep 2327
    root      2327  0.0  0.0  76100  1088 pts/1    T    01:33   0:00 tar zxpS -C /vol

kill -9 2327

umount /vol

    [1]+  Stopped                 tar cpS --one-file-system / | gzip -c | tar zxpS -C /vol



YUCHING NEW INSTANCE
ec2-174-129-86-219.compute-1.amazonaws.com



</entry>
<entry [Tue Nov  9 16:08:14 EST 2010] SETUP AUTOMATIC MOUNT OF /data AND START HTTPD AND MYSQL ON BOOT>




AQUARIUS 1
----------

YUCHING:    ec2-174-129-112-58.compute-1.amazonaws.com

df -a
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1              10G  4.8G  4.7G  51% /
none                     0     0     0   -  /proc
none                     0     0     0   -  /sys
none                     0     0     0   -  /dev/pts
none                     0     0     0   -  /proc/sys/fs/binfmt_misc
/dev/sdg               40G   25G   14G  65% /data
[root@ip-10-203-85-248 ~]# . ~/.aws/aws.sh 
[root@ip-10-203-85-248 ~]# ec2-describe-instances
RESERVATION     r-8b0edbe1      728213020069    default
INSTANCE        i-0caa7261      ami-fa669293    ec2-50-16-43-39.compute-1.amazonaws.com ip-10-122-218-37.ec2.internal    running agua    0               t1.micro        2010-11-11T05:22:30+0000        us-east-1a      aki-b51cf9dc     ari-b31cf9da            monitoring-disabled     50.16.43.39     10.122.218.37                   ebs
BLOCKDEVICE     /dev/sda1       vol-22ddc94b    2010-10-25T06:45:32.000Z
BLOCKDEVICE     /dev/sdg        vol-6c752005    2010-10-27T03:52:18.000Z


STUART:     ec2-50-16-43-39.compute-1.amazonaws.com 

df -a
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda1              10G  4.9G  4.7G  52% /
none                     0     0     0   -  /proc
none                     0     0     0   -  /sys
none                     0     0     0   -  /dev/pts
none                     0     0     0   -  /proc/sys/fs/binfmt_misc
/dev/sdg               40G   25G   14G  65% /data
/data/mysql/etc/mysql
                       40G   25G   14G  65% /etc/mysql
/data/mysql/lib/mysql
                       40G   25G   14G  65% /var/lib/mysql
/data/mysql/log/mysql
                       40G   25G   14G  65% /var/log/mysql
[root@ip-10-122-218-37 ~]# . ~/.aws/aws.sh 
[root@ip-10-122-218-37 ~]# ec2-describe-instances
RESERVATION     r-8b0edbe1      728213020069    default
INSTANCE        i-0caa7261      ami-fa669293    ec2-50-16-43-39.compute-1.amazonaws.com ip-10-122-218-37.ec2.internal      running agua    0               t1.micro        2010-11-11T05:22:30+0000        us-east-1aaki-b51cf9dc     ari-b31cf9da            monitoring-disabled     50.16.43.39     10.122.218.37             ebs
BLOCKDEVICE     /dev/sda1       vol-22ddc94b    2010-10-25T06:45:32.000Z
BLOCKDEVICE     /dev/sdg        vol-6c752005    2010-10-27T03:52:18.000Z


### MY STARCLUSTER-9 IP: ec2-50-16-41-25.compute-1.amazonaws.com 

### RESTARTED YUCHING'S STARCLUSTER-9, NEW IP: ec2-174-129-174-176.compute-1.amazonaws.com



LOGGING OF /etc/rc.local DURING SYSTEM BOOT

As far as I know any messages displayed by this script should be recorded in

/var/log/boot.log


dmesg output is dumped to

/var/log/dmesg


USE 'exec' TO REDIRECT STDOUT:

cat /var/log/startup/mount.log

Thu Nov 11 01:17:27 EST 2010
Starting httpd
Attaching volume
Mounting mysql
Starting mysql
[root@ip-10-122-218-37 ~]# cat /var/log/startup.log
Starting script
Starting httpd: [  OK  ]
Stopping MySQL:  [FAILED]
Starting MySQL:  [  OK  ]


AND /etc/rc.d/rc.local IS AS FOLLOWS:
(NOTE: NOT /etc/rc.local, WHICH IS NOT EXECUTED AT BOOT)


emacs /etc/rc.d/rc.local
#!/bin/sh
#
# This script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.

touch /var/lock/subsys/local

exec &> /var/log/startup.log 2>&1
echo "**** Starting script" 
date 

#### START HTTPD
echo "**** Starting httpd" 
/etc/init.d/httpd start

#### ATTACH VOLUME
echo "**** Attaching volume" 
###/root/.aws/mount-data.sh

### MOUNT MYSQL
echo "**** Mounting mysql" 
### /root/.aws/mount-mysql.sh

#### START MYSQL
echo "**** Starting mysql" 
/etc/init.d/mysqld restart

#### MOUNT VOLUME
####mount /dev/sdf /data


cat startup.log

    **** Starting script
    Thu Nov 11 01:59:44 EST 2010
    **** Starting httpd
    Starting httpd: [  OK  ]
    **** Attaching volume
    **** Mounting mysql
    **** Starting mysql
    Stopping MySQL:  [FAILED]
    Starting MySQL:  [  OK  ]


/etc/fstab
----------

EDIT THIS TO REMOVE /data/mysql/... LINES:

/dev/sda1  /         ext3    defaults        1 1
/dev/sdb   /mnt      ext3    defaults        0 0
none       /dev/pts  devpts  gid=5,mode=620  0 0
none       /proc     proc    defaults        0 0
none       /sys      sysfs   defaults        0 0
/swapfile  none      swap    sw              0 0

/data/mysql/etc/mysql /etc/mysql     none bind
/data/mysql/lib/mysql /var/lib/mysql none bind
/data/mysql/log/mysql /var/log/mysql none bind
/data/mysql/etc/mysql /etc/mysql     none bind
/data/mysql/lib/mysql /var/lib/mysql none bind
/data/mysql/log/mysql /var/log/mysql none bind
/data/mysql/etc/mysql /etc/mysql     none bind
/data/mysql/lib/mysql /var/lib/mysql none bind
/data/mysql/log/mysql /var/log/mysql none bind
/data/mysql/log/mysql /var/log/mysql none bind
/data/mysql/etc/mysql /etc/mysql     none bind
/data/mysql/lib/mysql /var/lib/mysql none bind
/data/mysql/log/mysql /var/log/mysql none bind


/etc/rc.local
-------------

cat /etc/rc.local
#!/bin/sh
#
# This script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.

touch /var/lock/subsys/local

#### START HTTPD
echo "Starting httpd"
/etc/init.d/httpd start

#### ATTACH VOLUME
echo "Attaching volume"
/root/.aws/mount-data.sh 

### MOUNT MYSQL
echo "Mounting mysql"
/root/.aws/mount-mysql.sh


#### START MYSQL
echo "Starting mysql"
/etc/init.d/mysqld restart

#### MOUNT VOLUME
####mount /dev/sdf /data




mount-data.sh
-------------

#!/bin/bash

# Call the environment setup script
. ~/.aws/aws.sh

# MYSQL VOLUME ID:
volume=vol-6c752005

# STOP MYSQL
/etc/init.d/mysqld stop

# Get basic info from instance meta-data
instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
avail_zone=`curl -s \
http://169.254.169.254/latest/meta-data/placement/availability-zone`

#### Change these to suit your environment
vol_size=40
device=/dev/sdg
mountpoint=/data

# Attach the volume
#echo "Attaching volume: $volume"
#ec2attvol "$volume" -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -i "$instance_id" -d "$device"
#while [[ "$vol_status" != "attached"  ]];

echo "Volume attached: $volume"
echo "Mounting $device to $mountpoint" 

mkdir $mountpoint
mount -t ext3 $device $mountpoint

echo "Device $device mounted to $mountpoint"
echo "Completed automount"

# START MYSQL
/etc/init.d/mysqld start





mount-mysql.sh
--------------

#!/bin/bash

# CREATE BINDINGS TO LINK TO MYSQL ON AMI

# USE bind AND mount TO MIRROR NEW LOCATIONS IN OLD FOLDERS
# Point MySQL to the correct database files on the EBS volume using mount bind.
echo "/data/mysql/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
#
#   SHOULD SEE SOMETHING LIKE THIS:
#   /data/mysql/etc/mysql /etc/mysql     none bind

mkdir /etc/mysql
mount /etc/mysql

echo "/data/mysql/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
#
#   SHOULD SEE SOMETHING LIKE THIS:
#   /data/mysql/lib/mysql /var/lib/mysql none bind

# Mount in /var/lib
mount /var/lib/mysql

# Add to /etc/fstab
echo "/data/mysql/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
mkdir /var/log/mysql
mount /var/log/mysql

# RESTART MYSQL

/etc/init.d/mysqld restart







</entry>



<entry [Thu Oct 28 09:49:40 EDT 2010] SHARE STARCLUSTER-7 WITH YUCHING>





1. GET INSTANCE ID:

. ~/.aws/aws.sh 
ec2-describe-instances

    RESERVATION     r-8b0edbe1      728213020069    default
    INSTANCE        i-0caa7261      ami-fa669293    ec2-50-16-41-25.compute-1.amazonaws.com ip-10-122-225-17.ec2.internal running agua    0               t1.micro        2010-11-08T05:25:57+0000        us-east-1a      aki-b51cf9dc  ari-b31cf9da            monitoring-disabled     50.16.41.25     10.122.225.17                   ebs
    BLOCKDEVICE     /dev/sda1       vol-22ddc94b    2010-10-25T06:45:32.000Z
    BLOCKDEVICE     /dev/sdg        vol-6c752005    2010-10-27T03:52:18.000Z



2. GIVE YUCHING PERMISSION TO LAUNCH:

STARCLUSTER-9

ec2-modify-image-attribute ami-90d720f9 --launch-permission --add 983300124420

    launchPermission        ami-90d720f9    ADD     userId  983300124420


AMI INFO:

    EC2 Amazon Machine Image: ami-90d720f9
    
    AMI ID: ami-90d720f9
    Name: starcluster-9
    Description: agua 0.5 with https enabled
    Source: 728213020069/starcluster-9
    Owner: 728213020069	Visibility: Private	Product Code:
    State: available	Kernel ID: aki-b51cf9dc	RAM Disk ID: ari-b31cf9da
    Image Type: machine	Architecture: x86_64	Platform: Other Linux
    Root Device Type: ebs	Root Device: /dev/sda1	Image Size: 50 GiB
    Block Devices: /dev/sda1=snap-8929bae3:10:true, /dev/sdg=snap-4928bb23:40:false
    Virtualization: paravirtual




STARCLUSTER-7

ec2-modify-image-attribute ami-fa669293 --launch-permission --add 983300124420

    launchPermission        ami-fa669293    ADD     userId  983300124420


AMI INFO:

    EC2 Amazon Machine Image: ami-fa669293
    
    AMI ID: ami-fa669293
    Name: starcluster-7
    Description: starcluster installed on centos5.4 x64_86
    Source: 728213020069/starcluster-7
    Owner: 728213020069	Visibility: Private	Product Code:
    State: available	Kernel ID: aki-b51cf9dc	RAM Disk ID: ari-b31cf9da
    Image Type: machine	Architecture: x86_64	Platform: Other Linux
    Root Device Type: ebs	Root Device: /dev/sda1	Image Size: 10 GiB
    Block Devices: /dev/sda1=snap-1b7ddc71:10:true
    Virtualization: paravirtual




3. YUCHING

    - GENERATES SECURITY KEY PAIR

    - SET SECURITY GROUP agua (SSH, HTTP, HTTPS)
    
    - LAUNCH INSTANCE OF STARCLUSTER 9

        EC2 Instance: i-be3db7d3
        
        Description
        Monitoring
        Tags
        AMI ID: ami-90d720f9	Zone: us-east-1a
        Security Groups: default	Type: t1.micro
        Status: running	Owner: 983300124420
        VPC ID: -	Subnet ID: -
        Virtualization: paravirtual	Placement Group:
        Reservation: r-e36cdc89	RAM Disk ID: ari-b31cf9da
        Platform: -	Key Pair Name: agua
        Kernel ID: aki-b51cf9dc	Monitoring: disabled
        AMI Launch Index: 0	Elastic IP: -
        Root Device: /dev/sda1	Root Device Type: ebs
        Block Devices: /dev/sda1=vol-f7a84b9f:attached:2010-11-10T05:47:15.000Z:true, /dev/sdg=vol-c9a84ba1:attached:2010-11-10T05:47:15.000Z:false
        Lifecycle: normal
        Public DNS: ec2-75-101-186-102.compute-1.amazonaws.com
        Private DNS: ip-10-112-6-141.ec2.internal
        Private IP Address: 10.112.6.141
        Launch Time: 2010-11-10 00:47 EST

    
    - CONNECT VIA SSH
    
        root@ec2-75-101-186-102.compute-1.amazonaws.com
    
    [root@ip-10-122-225-17 ~]# ec2-describe-instances

        RESERVATION     r-8b0edbe1      728213020069    default
        INSTANCE        i-0caa7261      ami-fa669293    ec2-50-16-41-25.compute-1.amazonaws.com ip-10-122-225-17.ec2.internal running agua    0               t1.micro        2010-11-08T05:25:57+0000        us-east-1a      aki-b51cf9dc  ari-b31cf9da            monitoring-disabled     50.16.41.25     10.122.225.17                   ebs
        BLOCKDEVICE     /dev/sda1       vol-22ddc94b    2010-10-25T06:45:32.000Z
        BLOCKDEVICE     /dev/sdg        vol-6c752005    2010-10-27T03:52:18.000Z





YUCHING
-------


user id:        9833-0012-4420
983300124420
access key id:  AKIAI6A6W55JJGZAUZJQ


rm -fr /root/.aws/aws.sh
emacs /root/.aws/aws.sh
#!/bin/bash
export AMAZON_USER_ID=983300124420
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-APKAJLSLZIS4DAQYFRFQ.pem
export EC2_CERT=/root/base/apps/ec2/keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem
export AWS_ACCESS_KEY_ID=AKIAI6A6W55JJGZAUZJQ
###export AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/home/ec2
export EC2_APITOOL_HOME=/home/ec2
export EC2_HOME=/home/ec2
export JAVA_HOME=/usr
PATH=$EC2_AMITOOL_HOME/bin:$PATH



pk-APKAJLSLZIS4DAQYFRFQ.pem

-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQCoAJvQeqFGWEAdd5rNzu0hMQQkLFOUB5MS1VYsppAOmbk+WSiM
0NIUvSXeM3WchDUeR/R2ormI2hMi74Jqj5WFKXcfK/8fo2toEDyi2InQmLtH7wcB
shOHLm9yPXK1JRvUw+P5meQQo4TvXt3p4BkmgvUnS6RsPeiAShuEbcncQwIDAQAB
AoGBAJAg9YvFqNZQn7CoC4bFH2p6QrNF0+4LEYH2xBdKTgw4lVOH6eHkxFZGb1ZR
j3TXdzqjQHcG42UksYYnNBt3Uy2iPoTgrbfR2W9cYocTFOq7Plh+kPo+R5Vy3xCu
J7punnaOX0lT7k0XWhRnWRiA2+pkBptzVuLsQjjV1P+wMUwBAkEA8tZtujzwLu7Y
BczZhon6FI0XHrwsNMG8mU6MdNPxWMWsx6CPZiB5HCjvaViq2VP3MbUdu0E3RBWS
Iq6ZMMHWcQJBALEbx5hI/qWCh+2Bi+GI9E/U7j3RWbfiPSFY1NJqtbV+WLzIermO
snVCcsQ2IVSg2oTAZ2ybWM3xpoEdjvwdv/MCQBVLbnXdcCZ9dV4U16JvqQlyUeu1
Dp9Vuecrty9rgoeJVhxvXQPUpyosAMqZJupF7bBjNIc+Mc17osP90Zsv9FECQCLr
sU0rh1onBJol4ujTUiizeU4jCyegqiD7HOtoMu/YO7LtbJVNt447Tdm2OpgvJybp
sPrPHpFsxkHLDDhVvVUCQEvJYAE5YFf+Tvv03jNepqi2jfXvnxj5Ynhj6MzKAV2H
AVUmDdBRkYxJPGuyfKnHuB0aPRAohShVPYx8iSv3F7s=
-----END RSA PRIVATE KEY-----



rsa-APKAJLSLZIS4DAQYFRFQ.pem

-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCoAJvQeqFGWEAdd5rNzu0hMQQk
LFOUB5MS1VYsppAOmbk+WSiM0NIUvSXeM3WchDUeR/R2ormI2hMi74Jqj5WFKXcf
K/8fo2toEDyi2InQmLtH7wcBshOHLm9yPXK1JRvUw+P5meQQo4TvXt3p4BkmgvUn
S6RsPeiAShuEbcncQwIDAQAB
-----END PUBLIC KEY-----






JOHNNY GILBERT
558277860346



Hi John,

You now have launch permission for my AMI: 

ami-fa669293

>ec2-modify-image-attribute ami-fa669293 -l -a 558277860346
>launchPermission        ami-fa669293    ADD     userId  558277860346

The website is here:

http://ec2-184-72-155-55.compute-1.amazonaws.com/agua/0.5/agua.html?jgilbert,9999999999.9999.999

Cheers,

Stuart





</entry>



<entry [Mon Nov  8 01:04:01 EST 2010] REDIRECT TO https>





1. CREATE SSL CERTIFICATE

GOOD TUTORIAL ON SSL
http://www.linux.org/docs/ldp/howto/Apache-WebDAV-LDAP-HOWTO/ssl.html


CREATE SSL CERTIFICATE ON CENTOS
http://www.xenocafe.com/tutorials/linux/centos/openssl/self_signed_certificates/index.php




GENERATE SSL CERTIFICATE


MAKE DIRECTORY


mkdir -p /root/base/apps/ssl
cd /root/base/apps/ssl


1. GENERATE PRIVATE KEY

cd /root/base/apps/ssl
openssl genrsa -des3 -rand file1:file2:file3:file4:file5 -out server.key 1024
	
	0 semi-random bytes loaded
	Generating RSA private key, 1024 bit long modulus
	.........................................................................++++++
	.......................................++++++
	e is 65537 (0x10001)
	Enter pass phrase for server.key:
	Verifying - Enter pass phrase for server.key:

cd /root/base/apps/ssl
ll

	-rw-r--r-- 1 root root  963 Nov  7 18:32 server.key


cat server.key 

	-----BEGIN RSA PRIVATE KEY-----
	Proc-Type: 4,ENCRYPTED
	DEK-Info: DES-EDE3-CBC,D9EFFE3B1B22EBAB
	
	oCkCkEJIMgMK9OVG9LrbMWscZa7yi1Fs4go01Xhiamn4uye+vrcWFJHqdSct/usn
	TtCj99Cbla7yDdvTZVlpCnY8oHhZZaQ1eae1hZ1p05FoacjPhCtMn15D8IBQjD0l
	hLFvOj2jSPJUIgddEIkjTH9dZSTj4EYp9fGGp4ibcaCvajlZYA4dDqSyABQg8JVE
	Kbgc3KqfbsbDS1+0Kl+tgeI0pXZ+RFse1cPVwTrZhIjq/pxXsYfdkbcPci9U01rq
	PwFVO3vn8HzVGzBN5vI28chKRVLdBWS9Uo0AQGCKQSUin5cK4R9hl49KNBNOiwKS
	fv95JqX0Iyhwj+iMv4xWME3JOm8m2VlzWUsFk3L6xZCv09UwCZyCqjrLsiZESPXy
	csDneJcidWdyxVFydmZUCXLAt2xTNfT17PxiH+69TUYITV+OGLFhN4SGRRizfRkk
	0cneWHUhcDybhuPHokt0X3501eVoq4vP2HKWs3gz+BdVYFcpqfm6d2MzJwqfvw+8
	muaUxXRjOzHpH8GSj+Dj833GgPJMv83Fi1D5ke/Tmi7+MsWY77XqK7Z6sRRkETRF
	AW4ZW8iwG2U6hxDYMQnAPjdO+mv+l8D8P/ULy9+WXonhWUYo1Qxetpbuyv9TaXT7
	osXgisC3JbXrk1Pl8Sy/9kMKZsauo+93p5sYT9DG+C08u24KxsZvUDFwMb9AlvNT
	MjgJyRMALzxZmrQ3LbmB4F4ZWBhd4LlQvh3F4Cxe4Pohn+UyGURBYI0KNuUly5MC
	Z3uXRrJJha1AWFZtpayubAtYEnNDn9D4JRwtf+NeM+9PqCinelN9Nw==
	-----END RSA PRIVATE KEY-----


2. GENERATE CSR (Certificate Signing Request)

NB: USE INSTANCE URL FOR 'COMMON NAME': ec2-184-72-155-55.compute-1.amazonaws.com

cd /root/base/apps/ssl
openssl req -new -key server.key -out server.csr

	Enter pass phrase for server.key:
	You are about to be asked to enter information that will be incorporated
	into your certificate request.
	What you are about to enter is what is called a Distinguished Name or a DN.
	There are quite a few fields but you can leave some blank
	For some fields there will be a default value,
	If you enter '.', the field will be left blank.
	-----
	Country Name (2 letter code) [GB]:US
	State or Province Name (full name) [Berkshire]:Florida
	Locality Name (eg, city) [Newbury]:Miami
	Organization Name (eg, company) [My Company Ltd]:Stuart Young
	Organizational Unit Name (eg, section) []:
	Common Name (eg, your name or your server's hostname) []:ec2-184-72-155-55.compute-1.amazonaws.com
	Email Address []:youngstuart@hotmail.com
	
	Please enter the following 'extra' attributes
	to be sent with your certificate request
	A challenge password []:
	An optional company name []


cd /root/base/apps/ssl
ll

	-rw-r--r-- 1 root root  733 Nov  7 18:37 server.csr
	-rw-r--r-- 1 root root  963 Nov  7 18:32 server.key



3. REMOVE PASSWORD

cd /root/base/apps/ssl
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key

	Enter pass phrase for server.key.org:
	Enter pass phrase for server.key.org: <"none">
	writing RSA key

The newly created server.key file has no passphrase in it anymore.

ll

	-rw-r--r-- 1 root root  733 Nov  7 18:37 server.csr
	-rw-r--r-- 1 root root  887 Nov  7 18:38 server.key
	-rw-r--r-- 1 root root  963 Nov  7 18:37 server.key.org


4. GENERATE SELF-SIGNED CERTIFICATE

cd /root/base/apps/ssl
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

	Signature ok
	subject=/C=US/ST=Florida/L=Miami/O=Stuart Young/CN=ec2-184-72-155-55.compute-1.amazonaws.com/emailAddress=youngstuart@hotmail.com
	Getting Private key

ll

	-rw-r--r-- 1 root root 1009 Nov  7 18:39 server.crt
	-rw-r--r-- 1 root root  733 Nov  7 18:37 server.csr
	-rw-r--r-- 1 root root  887 Nov  7 18:38 server.key
	-rw-r--r-- 1 root root  963 Nov  7 18:37 server.key.org


cd /root/base/apps/ssl
cat server.crt

	-----BEGIN CERTIFICATE-----
	MIICvTCCAiYCCQCprv6uv1bVhDANBgkqhkiG9w0BAQUFADCBojELMAkGA1UEBhMC
	VVMxEDAOBgNVBAgTB0Zsb3JpZGExDjAMBgNVBAcTBU1pYW1pMRUwEwYDVQQKEwxT
	dHVhcnQgWW91bmcxMjAwBgNVBAMTKWVjMi0xODQtNzItMTU1LTU1LmNvbXB1dGUt
	MS5hbWF6b25hd3MuY29tMSYwJAYJKoZIhvcNAQkBFhd5b3VuZ3N0dWFydEBob3Rt
	YWlsLmNvbTAeFw0xMDExMDcyMzM5MjNaFw0xMTExMDcyMzM5MjNaMIGiMQswCQYD
	VQQGEwJVUzEQMA4GA1UECBMHRmxvcmlkYTEOMAwGA1UEBxMFTWlhbWkxFTATBgNV
	BAoTDFN0dWFydCBZb3VuZzEyMDAGA1UEAxMpZWMyLTE4NC03Mi0xNTUtNTUuY29t
	cHV0ZS0xLmFtYXpvbmF3cy5jb20xJjAkBgkqhkiG9w0BCQEWF3lvdW5nc3R1YXJ0
	QGhvdG1haWwuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDCkHRMJ+AG
	6sjSDZAbKETD2ePUGAWj7aqsyWkbiCWZZXuh+B0jI1KKMOUDkY096FmdMLCD4K6s
	otdo/K3bFN1sQLPAWA4O7f8SSEOPlItchYKOU7LcoOKJUTzYZIQ453WIIxfyr5XQ
	bqNC2uUy6s+LE8r1FFa6OZx/HM3l2WgHUwIDAQABMA0GCSqGSIb3DQEBBQUAA4GB
	AChIOxydQCoTDB2CBM9z1R6AsJEpJnWj99FL5Lly186Gm/A9Mb/t4CLSnMuut4c/
	cfivUXfYZ+6amyfaYq6of6NKEcU5k/Cd+V+DDEQlyf30UQLLDKf5lgR9BeSevy5P
	3gB362rCQr6vHKmI4tPqO7J0STzo3q/o1NIBKO+N26jU
	-----END CERTIFICATE-----



cat server.key

	-----BEGIN RSA PRIVATE KEY-----
	MIICXQIBAAKBgQDCkHRMJ+AG6sjSDZAbKETD2ePUGAWj7aqsyWkbiCWZZXuh+B0j
	I1KKMOUDkY096FmdMLCD4K6sotdo/K3bFN1sQLPAWA4O7f8SSEOPlItchYKOU7Lc
	oOKJUTzYZIQ453WIIxfyr5XQbqNC2uUy6s+LE8r1FFa6OZx/HM3l2WgHUwIDAQAB
	AoGBAI+exEpHEQbqHu13V43EbuZHm/a++MLmOJutXWoWWPLfx6BrH08FzvL1XsgA
	lEtDjYsMGvBuVWJYHjyAcPGMeFkb0im17xcpO8k9k/uCRvrxG/FjqlmKs1Iq4rOB
	hybVt1R9jkHlSgHSBQE1Dla8ZRhuE0UTwyn9ZKuuAcLfMUhJAkEA5gdseQKmxnSu
	zpm4qujnIMqYs+k/zUoW4K21Yvif0ha72r4acOuQDXPoiJFZj+fklOg6zZEKNHKG
	DCudt50+3QJBANiH/HjMSpkjqYaZwzyIbAFfGkr9AVPdC4Ijmxta5rQw/Gwmr9AR
	StH1datM7FfnxIk/n7YrAqtdSW1xpqoYw+8CQHc0HahQEXECgpwZ2TLoYu4BT0Tc
	eO2/mT9xhW/2e4v5r/vZTAZ8bDgserJa8Fi8yR3Jgr+IjAtF1eV0rNS8LhkCQCzz
	Rfk5x760xYuYvgwB8hHy0T2B+lWTjMEObTOnkj8T8ELvYQ4bmOGvSCcwh9vT1Fv9
	pkUl9p7mdcjPkB69l2cCQQCoVUysDdJQY0L9UOuXo5W7F2FP5CuGLfAKTroAdUpI
	9/89s+bIz6tjbS07hd1jgLnnZuTvZqpLKJAZi8ueJUjI
	-----END RSA PRIVATE KEY-----


cat server.key.org

	-----BEGIN RSA PRIVATE KEY-----
	Proc-Type: 4,ENCRYPTED
	DEK-Info: DES-EDE3-CBC,D9EFFE3B1B22EBAB
	
	oCkCkEJIMgMK9OVG9LrbMWscZa7yi1Fs4go01Xhiamn4uye+vrcWFJHqdSct/usn
	TtCj99Cbla7yDdvTZVlpCnY8oHhZZaQ1eae1hZ1p05FoacjPhCtMn15D8IBQjD0l
	hLFvOj2jSPJUIgddEIkjTH9dZSTj4EYp9fGGp4ibcaCvajlZYA4dDqSyABQg8JVE
	Kbgc3KqfbsbDS1+0Kl+tgeI0pXZ+RFse1cPVwTrZhIjq/pxXsYfdkbcPci9U01rq
	PwFVO3vn8HzVGzBN5vI28chKRVLdBWS9Uo0AQGCKQSUin5cK4R9hl49KNBNOiwKS
	fv95JqX0Iyhwj+iMv4xWME3JOm8m2VlzWUsFk3L6xZCv09UwCZyCqjrLsiZESPXy
	csDneJcidWdyxVFydmZUCXLAt2xTNfT17PxiH+69TUYITV+OGLFhN4SGRRizfRkk
	0cneWHUhcDybhuPHokt0X3501eVoq4vP2HKWs3gz+BdVYFcpqfm6d2MzJwqfvw+8
	muaUxXRjOzHpH8GSj+Dj833GgPJMv83Fi1D5ke/Tmi7+MsWY77XqK7Z6sRRkETRF
	AW4ZW8iwG2U6hxDYMQnAPjdO+mv+l8D8P/ULy9+WXonhWUYo1Qxetpbuyv9TaXT7
	osXgisC3JbXrk1Pl8Sy/9kMKZsauo+93p5sYT9DG+C08u24KxsZvUDFwMb9AlvNT
	MjgJyRMALzxZmrQ3LbmB4F4ZWBhd4LlQvh3F4Cxe4Pohn+UyGURBYI0KNuUly5MC
	Z3uXRrJJha1AWFZtpayubAtYEnNDn9D4JRwtf+NeM+9PqCinelN9Nw==
	-----END RSA PRIVATE KEY-----


cd /root/base/apps/ssl
cat server.csr

	-----BEGIN CERTIFICATE REQUEST-----
	MIIB4zCCAUwCAQAwgaIxCzAJBgNVBAYTAlVTMRAwDgYDVQQIEwdGbG9yaWRhMQ4w
	DAYDVQQHEwVNaWFtaTEVMBMGA1UEChMMU3R1YXJ0IFlvdW5nMTIwMAYDVQQDEyll
	YzItMTg0LTcyLTE1NS01NS5jb21wdXRlLTEuYW1hem9uYXdzLmNvbTEmMCQGCSqG
	SIb3DQEJARYXeW91bmdzdHVhcnRAaG90bWFpbC5jb20wgZ8wDQYJKoZIhvcNAQEB
	BQADgY0AMIGJAoGBAMKQdEwn4AbqyNINkBsoRMPZ49QYBaPtqqzJaRuIJZlle6H4
	HSMjUoow5QORjT3oWZ0wsIPgrqyi12j8rdsU3WxAs8BYDg7t/xJIQ4+Ui1yFgo5T
	styg4olRPNhkhDjndYgjF/KvldBuo0La5TLqz4sTyvUUVro5nH8czeXZaAdTAgMB
	AAGgADANBgkqhkiG9w0BAQUFAAOBgQBeerz4mW/hhyKp6nW6B2gwRdu6WLQ4FaNq
	uSn6K3sNHRp7rIczXS+Xsu9HCWDF3FQkp2TPVRiUY2Y/eWRTCZBAAgNjXCvT2MVI
	Xb9n0k5wK3No7/URBte5IuZ61F6+jWiNFjg306LQRKJTexM3113LyQ6WU9Voih1s
	p8vtHf54Kg==
	-----END CERTIFICATE REQUEST-----



http://learn.iis.net/page.aspx/144/how-to-set-up-ssl-on-iis-7/
Choosing a Certificate

There are three things that a browser usually verifies in a server certificate:
	- The current date and time is within the "Valid from" and "Valid to" date range on the certificate.
	- The certificate's "Common Name" (CN) matches the host header in the request. For example, if the client is making a request to http://www.contoso.com/, then the CN must also be http://www.contoso.com/.
	- the issuer of the certificate is a known and trusted CA.

If one or more of these checks fails, the browser prompts the user with warnings.


5. UPDATE mod_ssl

yum install mod_ssl

	...
	Installed:
	  mod_ssl.x86_64 1:2.2.3-43.el5.centos.3                                                       		Dependency Installed:
	  distcache.x86_64 0:1.4.5-14.1                                                                	
	Dependency Updated:
	  openssl.i686 0:0.9.8e-12.el5_4.6               openssl.x86_64 0:0.9.8e-12.el5_4.6            		Complete!


This automatically configured Apache to use SSL when it was restarted, by adding the file which contains the necessary stuff to enable SSL:
 
/etc/httpd/conf.d/ssl.conf



RESTART APACHE:


/etc/init.d/httpd restart



5.5 INSTALL PRIVATE KEY AND CERTIFICATE

MAKE APACHE mod_ssl CERTIFICATE FILE DIRECTORY:

mkdir -p /etc/httpd/conf/ssl.crt
mkdir -p /etc/httpd/conf/ssl.key


COPY FILES:

cd /root/base/apps/ssl
cp server.crt /etc/httpd/conf/ssl.crt
cp server.key /etc/httpd/conf/ssl.key

#cp server.crt /usr/local/apache/conf/ssl.crt
#cp server.key /usr/local/apache/conf/ssl.key



6. CONFIGURE SSL ENABLED VIRTUAL HOSTS IN httpd.conf

emacs /etc/httpd/conf.d/ssl.conf

ADD THIS:

<VirtualHost ec2-184-72-155-55.compute-1.amazonaws.com:443>

SSLEngine on
SSLCertificateFile /etc/httpd/conf/ssl.crt/server.crt
SSLCertificateKeyFile /etc/httpd/conf/ssl.key/server.key
SetEnvIf User-Agent “.*MSIE.*” nokeepalive ssl-unclean-shutdown



	#<VirtualHost www.yourdomain.com:443>
	#SSLEngine on
	#SSLCertificateFile /usr/local/apache/conf/ssl.crt/server.crt
	#SSLCertificateKeyFile /usr/local/apache/conf/ssl.key/server.key
	#SetEnvIf User-Agent “.*MSIE.*” nokeepalive ssl-unclean-shutdown
	#</VirtualHost>



AND IN httpd.conf ADD  THIS LINE:



Include /etc/httpd/conf.d/ssl.conf

 


7. RESTART APACHE


/etc/init.d/httpd restart




PROBLEM:

tail /var/log/httpd/error_log
OR
cat ssl_error_log

	[Sun Nov 07 20:08:57 2010] [warn] RSA server certificate is a CA certificate (BasicConstraints: CA == TRUE !?)
	[Sun Nov 07 20:08:57 2010] [warn] RSA server certificate CommonName (CN) `ip-10-120-66-176' does NOT match server name!?
	[Sun Nov 07 20:08:57 2010] [notice] Apache/2.2.3 (CentOS) configured -- resuming normal operation


SOLUTION:

HAD TO COMMENT OUT DEFAULT REFERENCES TO SSL CERTIFICATE FILE AND KEY FILE IN ssl.conf:


	#### FOR https,
	#### COMMENTED OUT THIS:	
	### SSLCertificateFile /etc/pki/tls/certs/localhost.crt
	
	...
	
	#### FOR https,
	#### COMMENTED OUT THIS:
	###SSLCertificateKeyFile /etc/pki/tls/private/localhost.key


cd /var/log/httpd

	-rw-r--r--  1 root root  928 Nov  7 20:08 ssl_error_log
	-rw-r--r--  1 root root    0 Nov  7 19:45 ssl_request_log



PROBLEM:


tail /var/log/httpd/error_log
OR
cat ssl_error_log
	
	[Sun Nov 07 20:42:55 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?
	[Sun Nov 07 20:42:55 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?



hostname

	ip-10-120-66-176

cat /etc/sysconfig/network

	HOSTNAME=localhost.localdomain
	NETWORKING=yes




CHANGED LOGLEVEL IN ssl.conf TO debug:

#LogLevel warn
LogLevel debug



THEN GOT THIS ERROR OUTPUT IN ssl_error_log:

	[Sun Nov 07 21:37:25 2010] [info] Loading certificate & private key of SSL-aware server
	[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_pphrase.c(469): unencrypted RSA private key - pass phrase not required
	[Sun Nov 07 21:37:25 2010] [info] Configuring server for SSL protocol
	[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(406): Creating new SSL context (protocols: SSLv3, TLSv1)
	[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(602): Configuring permitted SSL ciphers [ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:+LOW]
	[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(730): Configuring RSA server certificate
	[Sun Nov 07 21:37:25 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?
	[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(769): Configuring RSA server private key

	**REPEAT**



SEARCHED FOR 'EC2 SSL CERTIFICATE' AND FOUND THIS:




SO ADDED ELASTIC IP:

184.73.189.109



CONFIRMED THAT PORT 443 IS OPEN:

telnet ip-10-120-66-176 443

	Trying 10.120.66.176...
	Connected to ip-10-120-66-176.ec2.internal (10.120.66.176).
	Escape character is '^]'.




AT WHICH POINT SSH FROZE, SO RECONNECTED USING NEW IP:


	The host key database does not contain an entry for the
	hostname 184.73.189.109, which resolved to 184.73.189.109,
	port 22.  If you have received this message more
	than once for 184.73.189.109, this may mean that 184.73.189.109
	is an "alias" which resolves to different hosts.
	
	It is recommended you verify your host key before accepting.
	
	Server's host key fingerprint (MD5 hash):
	a9:0d:f1:70:0f:e0:d0:14:a5:76:f3:bc:22:c3:73:14

OK

	
	Last login: Sun Nov  7 19:51:17 2010 from 98.254.40.187
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
	[root@ip-10-120-66-176 ~]# 



THEN REVISITED USING lynx:

cat ssl_error_log

[Sun Nov 07 21:18:03 2010] [error] [client 10.120.66.176] Directory index forbidden by Options directive: /var/www/html/
[Sun Nov 07 21:30:52 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?
[Sun Nov 07 21:30:52 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?
[Sun Nov 07 21:31:20 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?
[Sun Nov 07 21:31:20 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?
[Sun Nov 07 21:37:25 2010] [info] Loading certificate & private key of SSL-aware server
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_pphrase.c(469): unencrypted RSA private key - pass phrase not required
[Sun Nov 07 21:37:25 2010] [info] Configuring server for SSL protocol
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(406): Creating new SSL context (protocols: SSLv3, TLSv1)
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(602): Configuring permitted SSL ciphers [ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:+LOW]
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(730): Configuring RSA server certificate
[Sun Nov 07 21:37:25 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(769): Configuring RSA server private key
[Sun Nov 07 21:37:25 2010] [info] Loading certificate & private key of SSL-aware server
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_pphrase.c(469): unencrypted RSA private key - pass phrase not required
[Sun Nov 07 21:37:25 2010] [info] Configuring server for SSL protocol
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(406): Creating new SSL context (protocols: SSLv3, TLSv1)
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(602): Configuring permitted SSL ciphers [ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:+LOW]
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(730): Configuring RSA server certificate
[Sun Nov 07 21:37:25 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?
[Sun Nov 07 21:37:25 2010] [debug] ssl_engine_init.c(769): Configuring RSA server private key
[Sun Nov 07 22:00:11 2010] [info] [client 10.120.66.176] Connection to child 0 established (server ip-10-120-66-176.ec2.internal:443)
[Sun Nov 07 22:00:11 2010] [info] Seeding PRNG with 144 bytes of entropy
[Sun Nov 07 22:00:11 2010] [debug] ssl_engine_kernel.c(1801): OpenSSL: Handshake: start
[Sun Nov 07 22:00:11 2010] [debug] ssl_engine_kernel.c(1809): OpenSSL: Loop: before/accept initialization
[Sun Nov 07 22:00:11 2010] [debug] ssl_engine_io.c(1819): OpenSSL: read 4/11 bytes from BIO#5555559027f0 [mem: 555555907ed0] (BIO dump follows)
[Sun Nov 07 22:00:11 2010] [debug] ssl_engine_io.c(1766): +-------------------------------------------------------------------------+
[Sun Nov 07 22:00:11 2010] [debug] ssl_engine_io.c(1791): | 0000: 5e 5d 0d 0a                                      ^]..             |
[Sun Nov 07 22:00:11 2010] [debug] ssl_engine_io.c(1797): +-------------------------------------------------------------------------+
[Sun Nov 07 22:00:14 2010] [debug] ssl_engine_io.c(1819): OpenSSL: read 3/7 bytes from BIO#5555559027f0 [mem: 555555907ed4] (BIO dump follows)
[Sun Nov 07 22:00:14 2010] [debug] ssl_engine_io.c(1766): +-------------------------------------------------------------------------+
[Sun Nov 07 22:00:14 2010] [debug] ssl_engine_io.c(1791): | 0000: 7d 0d 0a                                         }..              |
[Sun Nov 07 22:00:14 2010] [debug] ssl_engine_io.c(1797): +-------------------------------------------------------------------------+
[Sun Nov 07 22:00:21 2010] [debug] ssl_engine_io.c(1819): OpenSSL: read 4/4 bytes from BIO#5555559027f0 [mem: 555555907ed7] (BIO dump follows)
[Sun Nov 07 22:00:21 2010] [debug] ssl_engine_io.c(1766): +-------------------------------------------------------------------------+
[Sun Nov 07 22:00:21 2010] [debug] ssl_engine_io.c(1791): | 0000: ff ed ff fd                                      ....             |
[Sun Nov 07 22:00:21 2010] [debug] ssl_engine_io.c(1797): +-------------------------------------------------------------------------+
[Sun Nov 07 22:00:21 2010] [debug] ssl_engine_kernel.c(1838): OpenSSL: Exit: error in SSLv2/v3 read client hello A
[Sun Nov 07 22:00:21 2010] [info] [client 10.120.66.176] SSL library error 1 in handshake (server ip-10-120-66-176.ec2.internal:443)
[Sun Nov 07 22:00:21 2010] [info] SSL Library Error: 336027900 error:140760FC:SSL routines:SSL23_GET_CLIENT_HELLO:unknown protocol speaking not SSL to HTTPS port!?
[Sun Nov 07 22:00:21 2010] [info] [client 10.120.66.176] Connection closed to child 0 with abortive shutdown (server ip-10-120-66-176.ec2.internal:443)


cat ssl_access_log 

	10.120.66.176 - - [07/Nov/2010:21:18:03 -0500] "GET / HTTP/1.0" 403 5043


RESTARTED HTTPD:

/etc/init.d/httpd restart

	Stopping httpd: [  OK  ]
	Starting httpd: [Sun Nov 07 23:03:03 2010] [error] (EAI 2)Name or service not known: Could not resolve host name ec2-184-72-155-55.compute-1.amazonaws.com -- ignoring!
	[  OK  ]



CHANGED ssl.conf TO:


#< VirtualHost _default_:443>
#< VirtualHost ec2-184-72-155-55.compute-1.amazonaws.com:443>
< VirtualHost amazonaws.com:443>

SSLEngine on
SSLCertificateFile /etc/httpd/conf/ssl.crt/server.crt
SSLCertificateKeyFile /etc/httpd/conf/ssl.key/server.key
SetEnvIf User-Agent nokeepalive ssl-unclean-shutdown

ServerName ec2-184-72-155-55.compute-1.amazonaws.com




AND RESTARTED HTTPD:


cat  /var/log/httpd/ssl_error_log

[Sun Nov 07 23:10:51 2010] [info] Loading certificate & private key of SSL-aware server
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_pphrase.c(469): unencrypted RSA private key - pass phrase not required
[Sun Nov 07 23:10:51 2010] [info] Configuring server for SSL protocol
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_init.c(406): Creating new SSL context (protocols: SSLv3, TLSv1)
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_init.c(602): Configuring permitted SSL ciphers [ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:+LOW]
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_init.c(730): Configuring RSA server certificate
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_init.c(769): Configuring RSA server private key
[Sun Nov 07 23:10:51 2010] [info] Loading certificate & private key of SSL-aware server
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_pphrase.c(469): unencrypted RSA private key - pass phrase not required
[Sun Nov 07 23:10:51 2010] [info] Configuring server for SSL protocol
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_init.c(406): Creating new SSL context (protocols: SSLv3, TLSv1)
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_init.c(602): Configuring permitted SSL ciphers [ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:+LOW]
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_init.c(730): Configuring RSA server certificate
[Sun Nov 07 23:10:51 2010] [debug] ssl_engine_init.c(769): Configuring RSA server private key



BUT WHEN SSH CONNECTION FAILED COULDN'T SEE IP ADDRESS IN AWS CONSOLE, SO REBOOTED

INSTANCE INFO BEFORE REBOOT:

	VPC ID: -	Subnet ID: -
	Virtualization: paravirtual	Placement Group:
	Reservation: r-8b0edbe1	RAM Disk ID: ari-b31cf9da
	Platform: -	Key Pair Name: agua
	Kernel ID: aki-b51cf9dc	Monitoring: disabled
	AMI Launch Index: 0	Elastic IP: -
	Root Device: /dev/sda1	Root Device Type: ebs
	Block Devices: /dev/sda1,/dev/sdg=vol-22ddc94b,vol-6c752005:attached,attached:2010-10-25T06:45:32.000Z,2010-10-27T03:52:18.000Z:true,false
	Lifecycle: normal
	Public DNS:
	Private DNS: ip-10-120-66-176.ec2.internal
	Private IP Address: 10.120.66.176
	Launch Time: 2010-10-26 07:57 EST



STILL SAME PROBLEM OF NO IP ADDRESS IN AWS CONSOLE, SO STOPPED THE INSTANCE AND THE NEW
IP ADDRESS APPEARED IMMEDIATELY:

ec2-50-16-52-249.compute-1.amazonaws.com

NB: OLD ADDRESS:

http://ec2-184-72-155-55.compute-1.amazonaws.com/


BUT AFTER RESTART, A NEW IP ADDRESS APPEARED:

ec2-50-16-41-25.compute-1.amazonaws.com



CONNECTED WITH SSH:

The host key database does not contain an entry for the
hostname ec2-50-16-41-25.compute-1.amazonaws.com, which resolved to 50.16.41.25,
port 22.  If you have received this message more
than once for ec2-50-16-41-25.compute-1.amazonaws.com, this may mean that ec2-50-16-41-25.compute-1.amazonaws.com
is an "alias" which resolves to different hosts.

It is recommended you verify your host key before accepting.

Server's host key fingerprint (MD5 hash):
a9:0d:f1:70:0f:e0:d0:14:a5:76:f3:bc:22:c3:73:14

--> ACCEPT AND SAVE

	
	Last login: Sun Nov  7 22:40:05 2010 from 98.254.40.187
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
	[root@ip-10-122-225-17 ~]#



CHANGED TO *:433 AND NO SERVERNAME IN ssl.conf:


emacs /etc/httpd/conf.d/ssl.conf

< VirtualHost *:443>

SSLEngine on
SSLCertificateFile /etc/httpd/conf/ssl.crt/server.crt
SSLCertificateKeyFile /etc/httpd/conf/ssl.key/server.key
SetEnvIf User-Agent nokeepalive ssl-unclean-shutdown

#ServerName ec2-184-72-155-55.compute-1.amazonaws.com



RESTARTED HTTPD:

/etc/init.d/httpd restart

	Stopping httpd: [FAILED]
	Starting httpd: [  OK  ]


BUT RETURNED BACK TO 'DOES NOT MATCH SERVER NAME' ERROR:

cd /var/log/httpd
cat ssl_error_log

	[Mon Nov 08 00:37:15 2010] [info] Loading certificate & private key of SSL-aware server
	[Mon Nov 08 00:37:15 2010] [debug] ssl_engine_pphrase.c(469): unencrypted RSA private key - pass phrase not required
	[Mon Nov 08 00:37:15 2010] [info] Configuring server for SSL protocol
	[Mon Nov 08 00:37:15 2010] [debug] ssl_engine_init.c(406): Creating new SSL context (protocols: SSLv3, TLSv1)
	[Mon Nov 08 00:37:15 2010] [debug] ssl_engine_init.c(602): Configuring permitted SSL ciphers [ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:+LOW]
	[Mon Nov 08 00:37:15 2010] [debug] ssl_engine_init.c(730): Configuring RSA server certificate
	[Mon Nov 08 00:37:15 2010] [warn] RSA server certificate CommonName (CN) `ec2-184-72-155-55.compute-1.amazonaws.com' does NOT match server name!?
	[Mon Nov 08 00:37:15 2010] [debug] ssl_engine_init.c(769): Configuring RSA server private key



RESTARTED WITH NEW KEY BASED ON NEW IP ADDRESS:


MAKE DIRECTORY


mkdir -p /root/base/apps/sslcert
cd /root/base/apps/sslcert


1. GENERATE PRIVATE KEY

cd /root/base/apps/sslcert
openssl genrsa -des3 -rand file1:file2:file3:file4:file5 -out server.key 1024
	
	0 semi-random bytes loaded
	Generating RSA private key, 1024 bit long modulus
	....................................................++++++
	...............++++++
	e is 65537 (0x10001)
	Enter pass phrase for server.key:
	Verifying - Enter pass phrase for server.key:


cd /root/base/apps/sslcert
ll

	-rw-r--r-- 1 root root  951 Nov  8 00:46 server.key

	#-rw-r--r-- 1 root root  963 Nov  7 18:32 server.key


cat server.key 

	-----BEGIN RSA PRIVATE KEY-----
	Proc-Type: 4,ENCRYPTED
	DEK-Info: DES-EDE3-CBC,AF8B9DD58C10CAB1
	
	KyzM9qCOlE7ApBrSoh3DF/oEF1Y6rPGmZIVFX0DaYa4/erl1121VqsjSdjBoRYzo
	/vgK8ELo24QJ+ZcxwC6Lx7EwU8tx2Pe2ZdZULbS8W00DCWxvEF7f/uWEEhu+ReA/
	aNWjuxHMzhLtZ64lDldxG0kJq8aAuBtMSiB3WeUjnGCcVQ8XHRnT9My/bXZOKQ8R
	en5iO+h7iNnMdChBayt203uck4yBNkZ4MpUEIked2HySc7eGaE0qIszK0t/2f1JM
	gAxPBg8ryFgsAeP2sla8glgoeIir8TyehNlHUNczxq+F7AtvEFByttJ88p4LpEg/
	4neaqth020kJsEJ2OBtSnFSAvqjfmXtpFH/+fbOjloVU3cYhXnrokHcNmQLApMTh
	IEKZmjj7qWpabRvVJXfnqQRC8AdjzD+p/OV634DeqDama1NwD45HRO8ZYCiQftjY
	c02zibIn7IqvYU66Lrp6ctjgjOeixpwm1S8WEi1zJnr9X57A0T0HFaKQz4qwrzQg
	MLgWuWMj+V+UqLWzxrPN/p1LSL7buxSDGZX3h6RgeDMFNXlTygJh11yRHj5QzFxK
	XrKYT+dGW9EJkVJ8lG5Tj9NyJIp0hnUMNwalWt8FEeGYE8xq9eEGzDRRV1b4O9ne
	2iawic6h9x0Hmf/e9s4glUcYhakF+HzUUUR9eI/CEJx7wC/LBbbUHOG7bwx7vD1H
	7VMfH5vdFYSiLuhTNBTQd+b1P6RGobNAON9ni4SVag5TlF8rXL7WrW7+Ffldz1w5
	5F5jJlpCgDSAg8ye3YO7u+ixLiIaetGMulnLCqhJ+SQ=
	-----END RSA PRIVATE KEY-----


	#-----BEGIN RSA PRIVATE KEY-----
	#Proc-Type: 4,ENCRYPTED
	#DEK-Info: DES-EDE3-CBC,D9EFFE3B1B22EBAB
	#
	#oCkCkEJIMgMK9OVG9LrbMWscZa7yi1Fs4go01Xhiamn4uye+vrcWFJHqdSct/usn
	#TtCj99Cbla7yDdvTZVlpCnY8oHhZZaQ1eae1hZ1p05FoacjPhCtMn15D8IBQjD0l
	#hLFvOj2jSPJUIgddEIkjTH9dZSTj4EYp9fGGp4ibcaCvajlZYA4dDqSyABQg8JVE
	#Kbgc3KqfbsbDS1+0Kl+tgeI0pXZ+RFse1cPVwTrZhIjq/pxXsYfdkbcPci9U01rq
	#PwFVO3vn8HzVGzBN5vI28chKRVLdBWS9Uo0AQGCKQSUin5cK4R9hl49KNBNOiwKS
	#fv95JqX0Iyhwj+iMv4xWME3JOm8m2VlzWUsFk3L6xZCv09UwCZyCqjrLsiZESPXy
	#csDneJcidWdyxVFydmZUCXLAt2xTNfT17PxiH+69TUYITV+OGLFhN4SGRRizfRkk
	#0cneWHUhcDybhuPHokt0X3501eVoq4vP2HKWs3gz+BdVYFcpqfm6d2MzJwqfvw+8
	#muaUxXRjOzHpH8GSj+Dj833GgPJMv83Fi1D5ke/Tmi7+MsWY77XqK7Z6sRRkETRF
	#AW4ZW8iwG2U6hxDYMQnAPjdO+mv+l8D8P/ULy9+WXonhWUYo1Qxetpbuyv9TaXT7
	#osXgisC3JbXrk1Pl8Sy/9kMKZsauo+93p5sYT9DG+C08u24KxsZvUDFwMb9AlvNT
	#MjgJyRMALzxZmrQ3LbmB4F4ZWBhd4LlQvh3F4Cxe4Pohn+UyGURBYI0KNuUly5MC
	#Z3uXRrJJha1AWFZtpayubAtYEnNDn9D4JRwtf+NeM+9PqCinelN9Nw==
	#-----END RSA PRIVATE KEY-----



2. GENERATE CSR (Certificate Signing Request)

USE COMMON NAME: ec2-50-16-41-25.compute-1.amazonaws.com

cd /root/base/apps/sslcert
openssl req -new -key server.key -out server.csr

	Enter pass phrase for server.key:
	You are about to be asked to enter information that will be incorporated
	into your certificate request.
	What you are about to enter is what is called a Distinguished Name or a DN.
	There are quite a few fields but you can leave some blank
	For some fields there will be a default value,
	If you enter '.', the field will be left blank.
	-----
	Country Name (2 letter code) [GB]:US
	State or Province Name (full name) [Berkshire]:Florida
	Locality Name (eg, city) [Newbury]:Miami
	Organization Name (eg, company) [My Company Ltd]:Stuart Young
	Organizational Unit Name (eg, section) []:
	Common Name (eg, your name or your server's hostname) []:ec2-50-16-41-25.compute-1.amazonaws.com
	Email Address []:youngstuart@hotmail.com
	
	Please enter the following 'extra' attributes
	to be sent with your certificate request
	A challenge password []:   
	An optional company name []:


cd /root/base/apps/sslcert
ll

	-rw-r--r-- 1 root root  729 Nov  8 00:49 server.csr
	-rw-r--r-- 1 root root  951 Nov  8 00:46 server.key

	#-rw-r--r-- 1 root root  733 Nov  7 18:37 server.csr
	#-rw-r--r-- 1 root root  963 Nov  7 18:32 server.key



3. REMOVE PASSWORD

cd /root/base/apps/sslcert
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key

	Enter pass phrase for server.key.org: <"none">
	writing RSA key

	#Enter pass phrase for server.key.org: <"none">
	#writing RSA key

ll

	-rw-r--r-- 1 root root  729 Nov  8 00:49 server.csr
	-rw-r--r-- 1 root root  887 Nov  8 00:50 server.key
	-rw-r--r-- 1 root root  951 Nov  8 00:50 server.key.org


	#-rw-r--r-- 1 root root  733 Nov  7 18:37 server.csr
	#-rw-r--r-- 1 root root  887 Nov  7 18:38 server.key
	#-rw-r--r-- 1 root root  963 Nov  7 18:37 server.key.org


4. GENERATE SELF-SIGNED CERTIFICATE

cd /root/base/apps/sslcert
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
	
	Signature ok
	subject=/C=US/ST=Florida/L=Miami/O=Stuart Young/CN=ec2-50-16-41-25.compute-1.amazonaws.com/emailAddress=youngstuart@hotmail.com
	Getting Private key

	##Signature ok
	##subject=/C=US/ST=Florida/L=Miami/O=Stuart Young/CN=ec2-184-72-155-55.compute-1.amazonaws.com/emailAddress=youngstuart@hotmail.com
	##Getting Private key

ll

cd /root/base/apps/sslcert
cat server.crt
cat server.key
cat server.key.org
cat server.csr


	cat server.crt
   -----BEGIN CERTIFICATE-----
   MIICuTCCAiICCQCqbfsxyrPsoDANBgkqhkiG9w0BAQUFADCBoDELMAkGA1UEBhMC
   VVMxEDAOBgNVBAgTB0Zsb3JpZGExDjAMBgNVBAcTBU1pYW1pMRUwEwYDVQQKEwxT
   dHVhcnQgWW91bmcxMDAuBgNVBAMTJ2VjMi01MC0xNi00MS0yNS5jb21wdXRlLTEu
   YW1hem9uYXdzLmNvbTEmMCQGCSqGSIb3DQEJARYXeW91bmdzdHVhcnRAaG90bWFp
   bC5jb20wHhcNMTAxMTA4MDU1MTMzWhcNMTExMTA4MDU1MTMzWjCBoDELMAkGA1UE
   BhMCVVMxEDAOBgNVBAgTB0Zsb3JpZGExDjAMBgNVBAcTBU1pYW1pMRUwEwYDVQQK
   EwxTdHVhcnQgWW91bmcxMDAuBgNVBAMTJ2VjMi01MC0xNi00MS0yNS5jb21wdXRl
   LTEuYW1hem9uYXdzLmNvbTEmMCQGCSqGSIb3DQEJARYXeW91bmdzdHVhcnRAaG90
   bWFpbC5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJMp5ZIgFhHDvDbS
   H4ykNCisnd9DFr3jtdOOsZXrqwNpNataxzFBiVZ5HYkl2o5lth1bjAH/RPQmWvJp
   iLUJWRogg5pJ+sRThXbOXHBxhxOVMoS98WH2EXrf/oUGhtkE+Hg5nINZZQxgJPYV
   Lfbv98dtrs9nmZ2yNBfKz82NDbvrAgMBAAEwDQYJKoZIhvcNAQEFBQADgYEAKvAD
   0FasuVhVzFo0bQs/5I0SQZptGhe9wDS8+XQJTLm5f5XbIehB5wJdY/mEV403y6HV
   Wv9Kyyb/2QqUG6IZOk4b2xLzMI0rLkhbFJe7uozhPpAxtWj+VBh+/8XNebDYfiN/
   WxXEu+1HB6a80VrVcWqu2uMeWoycAAG2fHIeCvM=
   -----END CERTIFICATE-----
   [root@ip-10-122-225-17 sslcert]# cat server.key
   -----BEGIN RSA PRIVATE KEY-----
   MIICWwIBAAKBgQCTKeWSIBYRw7w20h+MpDQorJ3fQxa947XTjrGV66sDaTWrWscx
   QYlWeR2JJdqOZbYdW4wB/0T0JlryaYi1CVkaIIOaSfrEU4V2zlxwcYcTlTKEvfFh
   9hF63/6FBobZBPh4OZyDWWUMYCT2FS327/fHba7PZ5mdsjQXys/NjQ276wIDAQAB
   AoGAcVnRAMeEGDTKkPMx59NGdZnXk/MJ3kM5dvUu5cn7FAqCkzS9vru6/AcX795f
   RFUle+FaquMjCmdMn/EXolHL9X/Z/7luYkyvna/vVDttPI2fBYsVmoqU10gWUmsQ
   lJJjmcsE87JGcaso+Z3PuU0ds8u+flFXrcyWdmUMVH0diwkCQQDCG0USw9TSRDWv
   RudaUd8msKJKuVckRsVt+/EJh2WqCK1jb5qOjKIW8b5tQ06JGZli5BWOh7m7I4ly
   pzDhDb0PAkEAwha5zhayrEQY+SpBp+sWD0dJ4Y1I1j9nGjxrirF21uV8fYDFj2Hf
   Aa9NBduZp6ug4IUqhoXAV5UgxM4TCVWLZQJAFZRei4WGBZJbvY7ObbYobu64PEJ6
   s6fCj0WxOHP7E3o/fIyNzEdKRe6+UvtmoctcyCe/Vcc1GN8MitiXkI2sdQJAScuG
   PfuXV7RUongUmpnhu1Fpn96uMPfOZcVPRl6PRsneeYF6nDekKOnUKUQDuiKhenxn
   XNqB9Ur4OJv51PS3mQJASnFK2o9UiS3Wm3eLgii8+yziCxNvQR9eFdHoO1EV/7fR
   EwoBljAgUgw6IxKDsXu9Iu+ZHxDSJE8+qtlrjaXa/Q==
   -----END RSA PRIVATE KEY-----
   [root@ip-10-122-225-17 sslcert]# cat server.key.org
   -----BEGIN RSA PRIVATE KEY-----
   Proc-Type: 4,ENCRYPTED
   DEK-Info: DES-EDE3-CBC,AF8B9DD58C10CAB1
   
   KyzM9qCOlE7ApBrSoh3DF/oEF1Y6rPGmZIVFX0DaYa4/erl1121VqsjSdjBoRYzo
   /vgK8ELo24QJ+ZcxwC6Lx7EwU8tx2Pe2ZdZULbS8W00DCWxvEF7f/uWEEhu+ReA/
   aNWjuxHMzhLtZ64lDldxG0kJq8aAuBtMSiB3WeUjnGCcVQ8XHRnT9My/bXZOKQ8R
   en5iO+h7iNnMdChBayt203uck4yBNkZ4MpUEIked2HySc7eGaE0qIszK0t/2f1JM
   gAxPBg8ryFgsAeP2sla8glgoeIir8TyehNlHUNczxq+F7AtvEFByttJ88p4LpEg/
   4neaqth020kJsEJ2OBtSnFSAvqjfmXtpFH/+fbOjloVU3cYhXnrokHcNmQLApMTh
   IEKZmjj7qWpabRvVJXfnqQRC8AdjzD+p/OV634DeqDama1NwD45HRO8ZYCiQftjY
   c02zibIn7IqvYU66Lrp6ctjgjOeixpwm1S8WEi1zJnr9X57A0T0HFaKQz4qwrzQg
   MLgWuWMj+V+UqLWzxrPN/p1LSL7buxSDGZX3h6RgeDMFNXlTygJh11yRHj5QzFxK
   XrKYT+dGW9EJkVJ8lG5Tj9NyJIp0hnUMNwalWt8FEeGYE8xq9eEGzDRRV1b4O9ne
   2iawic6h9x0Hmf/e9s4glUcYhakF+HzUUUR9eI/CEJx7wC/LBbbUHOG7bwx7vD1H
   7VMfH5vdFYSiLuhTNBTQd+b1P6RGobNAON9ni4SVag5TlF8rXL7WrW7+Ffldz1w5
   5F5jJlpCgDSAg8ye3YO7u+ixLiIaetGMulnLCqhJ+SQ=
   -----END RSA PRIVATE KEY-----
   [root@ip-10-122-225-17 sslcert]# cat server.csr
   -----BEGIN CERTIFICATE REQUEST-----
   MIIB4TCCAUoCAQAwgaAxCzAJBgNVBAYTAlVTMRAwDgYDVQQIEwdGbG9yaWRhMQ4w
   DAYDVQQHEwVNaWFtaTEVMBMGA1UEChMMU3R1YXJ0IFlvdW5nMTAwLgYDVQQDEydl
       YzItNTAtMTYtNDEtMjUuY29tcHV0ZS0xLmFtYXpvbmF3cy5jb20xJjAkBgkqhkiG
   9w0BCQEWF3lvdW5nc3R1YXJ0QGhvdG1haWwuY29tMIGfMA0GCSqGSIb3DQEBAQUA
   A4GNADCBiQKBgQCTKeWSIBYRw7w20h+MpDQorJ3fQxa947XTjrGV66sDaTWrWscx
   QYlWeR2JJdqOZbYdW4wB/0T0JlryaYi1CVkaIIOaSfrEU4V2zlxwcYcTlTKEvfFh
   9hF63/6FBobZBPh4OZyDWWUMYCT2FS327/fHba7PZ5mdsjQXys/NjQ276wIDAQAB
   oAAwDQYJKoZIhvcNAQEFBQADgYEALE0UakqedB6zGecme27Mc1Ic8GqvfhMRc3IO
   PQS262Rz3+E88adj0FYVEcJgKmLf+qUKPK4KYJdZxZnlRqEE0T/7V4O76cKB90EP
   R2efVVBp2/MIN6PSGLxKYwNKmrVSFB3TRSXaGyAckyAypeI7cn6sMxZZRMFAzWP2
   eOjMq7c=
   -----END CERTIFICATE REQUEST-----



5. INSTALL PRIVATE KEY AND CERTIFICATE

MAKE APACHE mod_ssl CERTIFICATE FILE DIRECTORY:

mv /etc/httpd/conf/ssl.crt/server.crt /etc/httpd/conf/ssl.crt/server.crt.old
mv /etc/httpd/conf/ssl.key/server.key  /etc/httpd/conf/ssl.key/server.key.old


COPY FILES:

cd /root/base/apps/sslcert
cp server.crt /etc/httpd/conf/ssl.crt
cp server.key /etc/httpd/conf/ssl.key


6. CONFIGURE SSL ENABLED VIRTUAL HOSTS IN httpd.conf

emacs /etc/httpd/conf.d/ssl.conf

ADD THIS:

<!--

<VirtualHost ec2-50-16-41-25.compute-1.amazonaws.com:443>

SSLEngine on
SSLCertificateFile /etc/httpd/conf/ssl.crt/server.crt
SSLCertificateKeyFile /etc/httpd/conf/ssl.key/server.key
SetEnvIf User-Agent “.*MSIE.*” nokeepalive ssl-unclean-shutdown

ServerName ec2-50-16-41-25.compute-1.amazonaws.com

-->

7. RESTART APACHE


/etc/init.d/httpd restart

	Stopping httpd: [  OK  ]
	Starting httpd: [  OK  ]



ERROR MESSAGES:

cat /var/log/httpd/ssl_error_log 

    [Mon Nov 08 01:02:22 2010] [info] Loading certificate & private key of SSL-aware server
    [Mon Nov 08 01:02:22 2010] [debug] ssl_engine_pphrase.c(469): unencrypted RSA private key - pass phrase not required
    [Mon Nov 08 01:02:22 2010] [info] Configuring server for SSL protocol
    [Mon Nov 08 01:02:22 2010] [debug] ssl_engine_init.c(406): Creating new SSL context (protocols: SSLv3, TLSv1)
    [Mon Nov 08 01:02:22 2010] [debug] ssl_engine_init.c(602): Configuring permitted SSL ciphers [ALL:!ADH:!EXPORT:!SSLv2:RC4+RSA:+HIGH:+MEDIUM:+LOW]
    [Mon Nov 08 01:02:22 2010] [debug] ssl_engine_init.c(730): Configuring RSA server certificate
    [Mon Nov 08 01:02:22 2010] [debug] ssl_engine_init.c(769): Configuring RSA server private key


TEST WITH lynx:

https://ec2-50-16-41-25.compute-1.amazonaws.com

SSL error:self signed certificate-Continue? (y)   



ADDED TO /etc/httpd/conf/httpd.conf

    <VirtualHost *:80>
    
    ServerName ec2-50-16-41-25.compute-1.amazonaws.com
    DocumentRoot /var/www/html
    
    </VirtualHost>


RAN EC2 COMMAND TO ENABLE SSL FOR SECURITY GROUP default:


ec2-authorize default -p 443

    GROUP           default
    PERMISSION              default ALLOWS  tcp     443     443     FROM    CIDR    0.0.0.0/0



    OK!!!!!!!!


HTTPS IS WORKING FINE.


NOTES
-----


http://matt-darby.com/posts/690-aws-ec2-and-ssl
To enable HTTPS on your EC2 instance just run:

    ec2-authorize default -p 443


CHANGE THE SSL LOG LEVEL
------------------------

http://httpd.apache.org/docs/2.0/mod/core.html#loglevel
LogLevel Directive

Description:	Controls the verbosity of the ErrorLog
Syntax:	LogLevel level
Default:	LogLevel warn
Context:	server config, virtual host
Status:	Core
Module:	core
LogLevel adjusts the verbosity of the messages recorded in the error logs (see ErrorLog directive). The following levels are available, in order of decreasing significance:

Level	Description	Example
emerg	Emergencies - system is unusable.	"Child cannot open lock file. Exiting"
alert	Action must be taken immediately.	"getpwuid: couldn't determine user name from uid"
crit	Critical Conditions.	"socket: Failed to get a socket, exiting child"
error	Error conditions.	"Premature end of script headers"
warn	Warning conditions.	"child process 1234 did not exit, sending another SIGHUP"
notice	Normal but significant condition.	"httpd: caught SIGBUS, attempting to dump core in ..."
info	Informational.	"Server seems busy, (you may need to increase StartServers, or Min/MaxSpareServers)..."
debug	Debug-level messages	"Opening config file ..."
When a particular level is specified, messages from all other levels of higher significance will be reported as well. E.g., when LogLevel info is specified, then messages with log levels of notice and warn will also be posted.







Generating an SSL Certificate with Apache+mod_ssl
http://slacksite.com/apache/certificate.php


Generating a Private Key and CSR

1. CREATE RSA Private Key

This key is a 1024 bit RSA key which is encrypted using Triple-DES and stored in a PEM format so that it is readable as ASCII text. We will use several files as random seed enhancers which will help to make the key more secure. Text files that have been compressed with a utility such as gzip are good choices. The key is generated using the following command, where file1:file2:etc represents the random compressed files.

openssl genrsa -des3 -rand file1:file2:file3:file4:file5 -out server.key 1024


The command will prompt you for a pass-phrase and then store the key in the file server.key


REMOVE THE pass-phrase FROM THE KEY:

openssl rsa -in server.key -out server.pem



During the generation of the CSR, you will be prompted for several pieces of information. These are the X.509 attributes of the certificate. One of the prompts will be for "Common Name (e.g., YOUR name)". It is important that this field be filled in with the fully qualified domain name of the server to be protected by SSL. If the website to be protected will be https://www.server.com, then enter www.server.com at this prompt. The command to generate the CSR is as follows:


openssl req -new -key server.key -out server.csr



A sample CSR generation session is shown below, with sample responses shown in bold:


openssl req -new -key server.key -out server.csr


Using configuration from /usr/local/ssl/openssl.cnf

Enter PEM pass phrase:Enter pass phrase here

You are about to be asked to enter information that will be incorporated into your certificate request.

What you are about to enter is what is called a Distinguished Name or a DN. There are quite a few fields but you can leave some blank.

For some fields there will be a default value, If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:New Hampshire
Locality Name (eg, city) []:Nashua
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Domain.com, Inc.
Organizational Unit Name (eg, section) []:.

Common Name (eg, YOUR name) []:www.domain.com
Email Address []:webmaster@domain.com


Please enter the following 'extra' attributes to be sent with your certificate request

A challenge password []:
An optional company name []:


Generating a Self-Signed Certificate

At this point you will need to generate a self-signed certificate because you either don't plan on having your certificate signed by a CA, or you wish to test your new SSL implementation while the CA is signing your certificate.

In my experience dealing with Thawte, it can take up to a week or more before receiving your signed certificate. The time it takes to receive the certificate will vary based on how quickly they receive your required documentation.

This temporary certificate will generate an error in the client browser to the effect that the signing certificate authority is unknown and not trusted.

To generate a temporary certificate which is good for 60 days, issue the following command:


openssl x509 -req -days 60 -in server.csr -signkey server.key -out server.crt


Installing the Private Key and Certificate

When Apache with mod_ssl is installed, it creates several directories in the Apache config directory.

The location of this directory will differ depending on how Apache was compiled. If using my instructions on compiling Apache, the config directory is 	l

The directories mod_ssl creates include ssl.crt, ssl.csr, and ssl.key. These are good locations to store server certificates, CSRs, and private keys, respectively. If there will be multiple SSL enabled hosts on one server, it may be good practice to name the files with the fully qualified domain name of the SSL enabled host.


When adding SSL enabled virtualhosts to the web server, I prefer to keep all of the SSL virtualhosts in a separate file. This insures that all SSL hosts can be easily found in one location and helps to keep the httpd.conf file from growing too large.

The SSL virtualhosts will be kept in a file called ssl.conf.

In order for Apache to recognize and parse this file, it must be included in the httpd.conf file with the following directive:

Include /usr/local/apache/etc/ssl.conf



Configuring SSL Enabled Virtual Hosts

Extensive examples of SSL configurations for a virtualhost are included as part of the /usr/local/apache/etc/httpd.conf.default file installed with mod_ssl. Please refer to this file and to the mod_ssl documentation for more detailed information on configuration options.

A basic SSL enabled virtualhost will appear as follows in the ssl.conf file:

# SSL Virtual Hosts
<IfDefine SSL>

<VirtualHost _default_:443>
ServerAdmin webmaster@domain.com
DocumentRoot /usr/local/apache/share/htdocs
ServerName www.domain.com
ScriptAlias /cgi-bin/ /usr/local/apache/share/htdocs/cgi-bin/
SSLEngine on
SSLCertificateFile /usr/local/apache/etc/ssl.crt/server.crt
SSLCertificateKeyFile /usr/local/apache/etc/ssl.key/server.pem
SetEnvIf User-Agent ".*MSIE.*" nokeepalive ssl-unclean-shutdown
CustomLog /usr/local/apache/var/log/ssl_request_log \"%t %h %{SSL_PROTOCOL}x %{SSL_CIPHER}x \"%r\" %b" </VirtualHost>

</IfDefine>

This will create an SSL virtualhost named www.domain.com, which is accessed via port 443 (the standard port for https) on the default IP address of the web server. It is possible to add as many additional virtualhosts as there are IP addresses that the web server listens to. Simply add additional virtualhost blocks inside of the <IfDefine SSL> and </IfDefine> tags. Due to the nature of the SSL encryption of the HTTP traffic, it is NOT possible to have name-based (HTTP1.1) SSL virtual hosts. To create a new SSL virtualhost on a different IP address, simply replace _default_ with the IP address of the virtualhost.

After adding the virtualhost to the ssl.conf file, Apache must be killed and restarted in order for it to recognize the new virtualhost. Unfortunately, this is one of the rare instances where a simple HUP signal will not work. After restarting the server, depending on whether the encrypted or unencrypted key was used, Apache will prompt you for the pass-phrase(s) of the SSL virtualhost(s). Enter the pass-phrase(s) and the web server will start.

Now, point your favorite browser to the new virtualhost you just created, remembering to use https:// instead of http://, and you should be greeted with a warning dialog if you are using the self-signed certificate. Acknowledge the dialog and the page will continue to load, protected by SSL. The status bar of your browser should be graced by the 'lock' icon, which signifies the page is protected via SSL. This is all there is to it!





HOW TO CREATE AN SSL CERTIFICATE

http://www.akadia.com/services/ssh_test_certificate.html

Generate a Private Key
----------------------

The openssl toolkit is used to generate an RSA Private Key and CSR (Certificate Signing Request). It can also be used to generate self-signed certificates which can be used for testing purposes or internal usage.

The first step is to create your RSA Private Key. This key is a 1024 bit RSA key which is encrypted using Triple-DES and stored in a PEM format so that it is readable as ASCII text.


openssl genrsa -des3 -out server.key 1024


Step 3: Remove Passphrase from Key

One unfortunate side-effect of the pass-phrased private key is that Apache will ask for the pass-phrase each time the web server is started. Obviously this is not necessarily convenient as someone will not always be around to type in the pass-phrase, such as after a reboot or crash. mod_ssl includes the ability to use an external program in place of the built-in pass-phrase dialog, however, this is not necessarily the most secure option either. It is possible to remove the Triple-DES encryption from the key, thereby no longer needing to type in a pass-phrase. If the private key is no longer encrypted, it is critical that this file only be readable by the root user! If your system is ever compromised and a third party obtains your unencrypted private key, the corresponding certificate will need to be revoked. With that being said, use the following command to remove the pass-phrase from the key:

cp server.key server.key.org
openssl rsa -in server.key.org -out server.key

The newly created server.key file has no more passphrase in it.

-rw-r--r-- 1 root root 745 Jun 29 12:19 server.csr
-rw-r--r-- 1 root root 891 Jun 29 13:22 server.key
-rw-r--r-- 1 root root 963 Jun 29 13:22 server.key.org

Step 4: Generating a Self-Signed Certificate

At this point you will need to generate a self-signed certificate because you either don't plan on having your certificate signed by a CA, or you wish to test your new SSL implementation while the CA is signing your certificate. This temporary certificate will generate an error in the client browser to the effect that the signing certificate authority is unknown and not trusted.

To generate a temporary certificate which is good for 365 days, issue the following command:

openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

Signature ok
subject=/C=CH/ST=Bern/L=Oberdiessbach/O=Akadia AG/OU=Information
Technology/CN=public.akadia.com/Email=martin dot zahn at akadia dot ch
Getting Private key


Step 5: Installing the Private Key and Certificate

When Apache with mod_ssl is installed, it creates several directories in the Apache config directory. The location of this directory will differ depending on how Apache was compiled.

cp server.crt /usr/local/apache/conf/ssl.crt
cp server.key /usr/local/apache/conf/ssl.key

Step 6: Configuring SSL Enabled Virtual Hosts

SSLEngine on
SSLCertificateFile /usr/local/apache/conf/ssl.crt/server.crt
SSLCertificateKeyFile /usr/local/apache/conf/ssl.key/server.key
SetEnvIf User-Agent ".*MSIE.*" nokeepalive ssl-unclean-shutdown
CustomLog logs/ssl_request_log \
   "%t %h %{SSL_PROTOCOL}x %{SSL_CIPHER}x \"%r\" %b"

Step 7: Restart Apache and Test

/etc/init.d/httpd stop
/etc/init.d/httpd stop

https://public.akadia.com




2. REDIRECT TO https





http://www.cyberciti.biz/tips/howto-apache-force-https-secure-connections.html



Matt H June 24, 2009
I was able to get a HTTP to HTTPS redirect working.

I put the redirect permanent in httpd.conf, in the section for a specific NameVirtualHost listener:

<NameVirtualHost 122.123.124.1:80>

    ServerName mywebsite.com:80
    ServerAlias http://www.mywebsite.com:80
    ServerAlias 122.123.124.1:80
    Redirect permanent / https://www.mywebsite.com/

</VirtualHost>



Redirect http to https Apache Configuration

First make sure Apache is configured for HTTPS connection and necessary SSL certificates are installed.

No non-ssl access i.e. only accept https connections

Now open httpd.conf or .htaccess file (mod_rewrite not required):
# vi httpd.conf

Append following line :
Redirect permanent / https://mail.nixcraft.com/

Any request made to http://mail.nixcraft.com will goto https://mail.nixcraft.com/

Save and close the file. Restart the Apache:
# /etc/init.d/httpd restart

This is easiest way to ensure that your normal user never use plain text HTTP protocol to send data. Now this makes it much harder to sniff sensitive data.

Force webmail login over SSL https session

So if you want force users to access their webmail through https, add following configuration to .htaccess file:

RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

Make sure you have something as follows in httpd.conf (mod_rewrite support):
LoadModule rewrite_module modules/mod_rewrite.so


SCD May 11, 2008
This way will never work. Instead go to the sites root directory. Open up .htaccess and add line

RewriteEngine On
RewriteCond %{SERVER_PORT} 80
RewriteRule ^(.*)$ https://www.example.com/$1 [R,L]

This should work


</entry>



<entry [Thu Oct 28 12:13:54 EDT 2010] RESTARTED HTTPD BUT NOW CAN'T FIND JBROWSE DATA BECAUSE LOOKING IN WRONG LOCATION>



SOLUTION:

FIXED View.js TO USE DEFAULT 'human' AND 'hg19' IF NOT SUPPLIED BY THE DATABASE



LOOKING IN WRONG LOCATION, I.E., MISSING 'human/hg19'

http://ec2-184-72-155-55.compute-1.amazonaws.com/agua/0.5/plugins/view/jbrowse/species/human/data/names/root.json

FILE LOCATION:

/agua/html/plugins/view/jbrowse/species/human/data/names/root.json

/var/www/html/agua/0.5/plugins/view/jbrowse/data

/var/www/html/agua/0.5/plugins/view/jbrowse/species


ERROR LOG SHOWS AS MUCH:

tail /var/log/httpd/error_log

    [Thu Oct 28 11:48:35 2010] [error] [client 129.171.150.136] File does not exist: /var/www/html/agua/0.5/plugins/view/jbrowse/data, referer: http://ec2-184-72-155-55.compute-1.amazonaws.com/agua/0.5/plugins/view/jbrowse/

ll /var/www/html/agua/0.5/plugins/view/jbrowse/data

    ls: /var/www/html/agua/0.5/plugins/view/jbrowse/data: No such file or directory

pwd

    /var/www/html/agua/0.5/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1






++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

starcluster-7 VOLUMES AVAILABLE BUT NOT MOUNTED

CONNECT

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-184-72-155-55.compute-1.amazonaws.com


df -a

    Filesystem            Size  Used Avail Use% Mounted on
    /dev/sda1              10G  4.8G  4.7G  51% /
    none                     0     0     0   -  /proc
    none                     0     0     0   -  /sys
    none                     0     0     0   -  /dev/pts
    none                     0     0     0   -  /proc/sys/fs/binfmt_misc

ec2-describe-instances

    RESERVATION     r-8b0edbe1      728213020069    default
    INSTANCE        i-0caa7261      ami-fa669293    ec2-184-72-155-55.compute-1.amazonaws.com       ip-10-120-66-176.ec2.internal       running agua    0               t1.micro        2010-10-26T11:57:19+0000    us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.155.55       10.120.66.176                   ebs
    BLOCKDEVICE     /dev/sda1       vol-22ddc94b    2010-10-25T06:45:32.000Z
    BLOCKDEVICE     /dev/sdf        vol-e2b9af8b    2010-10-27T03:49:07.000Z
    BLOCKDEVICE     /dev/sdg        vol-6c752005    2010-10-27T03:52:18.000Z


RUN AUTOMOUNT SCRIPT:

~/.aws/mount-data.sh 






ec2-detach-volume vol-e2b9af8b

    ATTACHMENT      vol-e2b9af8b    i-0caa7261      /dev/sdf        detaching       2010-10-27T03:49:07+0000

ec2-describe-instances

    RESERVATION     r-8b0edbe1      728213020069    default
    INSTANCE        i-0caa7261      ami-fa669293    ec2-184-72-155-55.compute-1.amazonaws.com       ip-10-120-66-176.ec2.internal       running agua    0               t1.micro        2010-10-26T11:57:19+0000    us-east-1a      aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.155.55       10.120.66.176                   ebs
    BLOCKDEVICE     /dev/sda1       vol-22ddc94b    2010-10-25T06:45:32.000Z
    BLOCKDEVICE     /dev/sdg        vol-6c752005    2010-10-27T03:52:18.000Z


NOTES
-----

MYSQL STARTUP INFO FOR STARCLUSTER-7

 /etc/init.d/httpd start
Starting httpd: [  OK  ]
[root@ip-10-120-66-176 ~]# /etc/init.d/mysql start
-bash: /etc/init.d/mysql: No such file or directory
[root@ip-10-120-66-176 ~]# /etc/init.d/mysqld start
Initializing MySQL database:  Installing MySQL system tables...
OK
Filling help tables...
OK

To start mysqld at boot time you have to copy
support-files/mysql.server to the right place for your system

PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:
/usr/bin/mysqladmin -u root password 'new-password'
/usr/bin/mysqladmin -u root -h ip-10-120-66-176 password 'new-password'

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



</entry>



<entry [Thu Oct 28 09:49:40 EDT 2010] SHARE STARCLUSTER-7>




Hi John,

You now have launch permission for my AMI: 

ami-fa669293

>ec2-modify-image-attribute ami-fa669293 -l -a 558277860346
>launchPermission        ami-fa669293    ADD     userId  558277860346

The website is here:

http://ec2-184-72-155-55.compute-1.amazonaws.com/agua/0.5/agua.html?jgilbert,9999999999.9999.999

Cheers,

Stuart



JOHN GILBERT
558277860346


ec2-modify-image-attribute ami-fa669293 -l -a 558277860346




Note:	 This feature is supported from API version 2006-10-01 and its supporting command-line tools.
Introduction

Sharing AMIs allows you to make your AMIs public, or grant specific users permission to launch your AMIs. In this tutorial, we'll go through: 

Making an AMI public
Sharing an AMI with a specific user
How others might discover and launch shared AMIs
Making a shared AMI's private again
Advertising your shared AMI
Before we begin, there are a few important notes for sharing AMIs:

There are security implications with sharing AMIs.	Please make sure you have read and understood the relevant sections in	the Developer Guide:

Sharing AMIs
Using Shared AMIs 
You have complete control over who is allowed to	 launch your AMIs.

The person launching an AMI is billed for resources used	 and not the owner of the AMI.

Prerequisites

To follow this guide you will need at least one AMI that is fit for public consumption.

Sharing AMIs

We are going to use two example AMIs to illustrate sharing AMIs. One, an Ubuntu base image, will be made public, and the other, a web server for Bob, will be shared with Bob only. AMIs are listed with ec2-describe-images. The flag -o self is used to list only images we own.

$ ec2-describe-images -o self
IMAGE ami-4ca2529b my-bucket/ubuntu-base.manifest.xml 495219933132 available private
IMAGE ami-5da964c3 my-bucket/bobs-webserver.manifest.xml 495219933132 available private
Launch permissions for an image are set by modifying an AMIs launch permission attribute. To make the Ubuntu image public, we add all to the launch permission attribute.

$ ec2-modify-image-attribute ami-4ca2529b --launch-permission --add all
launchPermission ami-4ca2529b ADD group all
We want to give Bob access to his web server. We do this by adding only his AWS account ID to the launch permission attribute. In this example, we use the short hand forms of --launch-permission and --add.

$ ec2-modify-image-attribute ami-5da964c3 -l -a 349782352074
launchPermission ami-5da964c3 ADD userId 349782352074
Launch permissions on an AMI can be checked at any time by running ec2-describe-image-attribute.

$ ec2-describe-image-attribute ami-4ca2529b -l
launchPermission ami-4ca2529b group all
Using Shared AMIs

For this section we look at what Bob does. He wants to launch his web server and create his own Ubuntu-based image without going through the steps of creating the initial Ubuntu image.

Bob knows that we have given him launch permissions to his web server and needs to find the AMI's ID. He does this by adding flags to ec2-describe-images so that only AMIs we own and he has explicit launch permissions for are returned. The -x flag is short hand for --executable-by.

$ ec2-describe-images -o 495219933132 -x self
IMAGE ami-5da964c3 my-bucket/bobs-webserver.manifest.xml 495219933132 available private
Bob can then launch the AMI in the normal fashion using ec2-run-instances.

$ ec2-run-instances ami-5da964c3 -k websvr-key
INSTANCE i-67a4410e ami-5da964c3 pending websvr-key 0
To build his Ubuntu image, Bob wants to find a public image with an Ubuntu base install. Bob executes the following command to list all public images, then only display the results containing the text ubuntu:

$ ec2-describe-images -x all | grep ubuntu
IMAGE ami-4ca2529b my-bucket/ubuntu-base.manifest.xml 495219933132 available public
Note:	 If you are running on Windows, you may need to remove | grep ubuntu for this command to work.
This AMI is exactly what Bob is looking for. He recognizes our AWS account ID. Because he knows us, he trusts that we would not produce a malicious AMI. Just to be sure, he checks the Public AMIs category in the Resource Center to see how other AWS developers have reviewed the Ubuntu AMI. Public AMIs are launched in the normal fashion.

$ ec2-run-instances ami-4ca2529b -k test-key
INSTANCE i-64a4410d ami-4ca2529b pending test-key 0
Permission Management with AMIs

After some time we no longer want our AMIs to be shared. Perhaps we release newer versions, or have a falling out with Bob and no longer want him running our software. Although de-registering an AMI will remove all launch permissions, we want to illustrate launch permission management without deregistering the AMI.

Individual launch permissions can be removed with ec2-modify-image-attribute.

$ ec2-modify-image-attribute ami-4ca2529b -l -r all
launchPermission ami-4ca2529b REMOVE group all
All launch permissions can be cleared from an AMI by using ec2-reset-image-attribute.

$ ec2-reset-image-attribute ami-5da964c3 -l
launchPermission ami-5da964c3 RESET
The owner of an AMI always has implicit launch permissions for that AMI. These will not be removed by using ec2-reset-image-attribute.

Advertising Your AMI

Advertise your shared AMI with the AWS developer community by adding it to the list of Public AMIs we have in our Resource Center. Submit your AMI to the Resource Center by following the directions on this page:
http://developer.amazonwebservices.com/connect/kbcategory.jspa?categoryID=116

Your category listing will show up after a quick review by AWS.



</entry>



<entry [Tue Oct 26 23:56:29 EDT 2010] INSTALLED AGUA ON STARCLUSTER-7>



EC2 Instance: i-0caa7261
AMI ID: ami-fa669293	Zone: us-east-1a
Security Groups: default	Type: t1.micro
Status: running	Owner: 728213020069
VPC ID: -	Subnet ID: -
Virtualization: paravirtual	Placement Group:
Reservation: r-8b0edbe1	RAM Disk ID: ari-b31cf9da
Platform: -	Key Pair Name: agua
Kernel ID: aki-b51cf9dc	Monitoring: disabled
AMI Launch Index: 0	Elastic IP: -
Root Device: /dev/sda1	Root Device Type: ebs
Block Devices: /dev/sda1=vol-22ddc94b:attached:2010-10-25T06:45:32.000Z:true
Lifecycle: normal
Public DNS: ec2-184-72-155-55.compute-1.amazonaws.com
Private DNS: ip-10-120-66-176.ec2.internal
Private IP Address: 10.120.66.176
Launch Time: 2010-10-26 07:57 EST


1. START HTTPD

/etc/init.d/httpd start

    Starting httpd: [  OK  ]


2. CHECK WEBPAGE

URL: root@ec2-184-72-155-55.compute-1.amazonaws.com

    OK
    

3. COPY AGUA FROM /data TO starcluster-7





</entry>



<entry [Mon Oct 25 09:08:51 EDT 2010] CREATE EBS VOLUME FROM data SNAPSHOT AND ATTACH+MOUNT ON starcluster-7>
    
ZONE=`curl http://169.254.169.254/latest/meta-data/placement/availability-zone`

vol=`ec2addvol --snapshot \
-K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -z "$avail_zone" --size $vol_size| cut -f2`


VOL_ID=`$EC2_HOME/bin/ec2addvol -s 50 -z $ZONE | awk '{ print $2 }'`
STATUS=creating
while [ $STATUS != "available" ]
do
echo volume $STATUS, waiting for volume create...
sleep 3
STATUS=`$EC2_HOME/bin/ec2dvol $VOL_ID | awk '{ print $5 }'`
done
Attach the volume


INST_ID=`curl http://169.254.169.254/latest/meta-data/instance-id`
$EC2_HOME/bin/ec2attvol $VOL_ID -i $INST_ID -d $EBS_DEV


root@ec2-184-72-155-55.compute-1.amazonaws.com


</entry>
<entry [Mon Oct 25 09:08:51 EDT 2010] AUTOMATIC MOUNT OF mysql EBS VOLUME ON starcluster-7>

NB: NEW URL FOR starcluster-7

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-184-72-155-55.compute-1.amazonaws.com

1. CREATE ENVIRONMENT SCRIPT

LINODE VERSION

mkdir ~/.aws
chmod -R 600 ~/.aws
rm -fr ~/.aws/aws.sh 
emacs ~/.aws/aws.sh 
#!/bin/bash
export AMAZON_USER_ID=728213020069
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export EC2_CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
export AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/root/base/apps/ec2/1.3-57419
export EC2_APITOOL_HOME=/root/base/apps/ec2/1.3-57419
export EC2_HOME=/root/base/apps/ec2/1.3-57419
export JAVA_HOME=/usr/bin/java
PATH=$EC2_AMITOOL_HOME/bin:$PATH


STARCLUSTER VERSION

mkdir /root/.aws
chmod -R 600 /root/.aws


rm -fr /root/.aws/aws.sh 
emacs /root/.aws/aws.sh 
#!/bin/bash
export AMAZON_USER_ID=728213020069
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export EC2_CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
export AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/home/ec2
export EC2_APITOOL_HOME=/home/ec2
export EC2_HOME=/home/ec2
export JAVA_HOME=/usr
PATH=$EC2_AMITOOL_HOME/bin:$PATH

chmod 700 /root/.aws/aws.sh

. /root/.aws/aws.sh



2. CREATE LOAD VOLUME SCRIPT

rm -fr ~/.aws/mount-data.sh 
emacs ~/.aws/mount-data.sh 
#!/bin/bash

# Call the environment setup script
. ~/.aws/aws.sh


# MYSQL VOLUME ID:
volume=vol-6c752005

# STOP MYSQL
/etc/init.d/mysqld stop

# Get basic info from instance meta-data
instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`
avail_zone=`curl -s \
http://169.254.169.254/latest/meta-data/placement/availability-zone`

#### Change these to suit your environment
vol_size=40
device=/dev/sdg
mountpoint=/data

# Attach the volume
#echo "Attaching volume: $volume"
#ec2attvol "$volume" -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -i "$instance_id" -d "$device"
#while [[ "$vol_status" != "attached"  ]];

echo "Volume attached: $volume"
echo "Mounting $device to $mountpoint"

mkdir $mountpoint
mount -t ext3 $device $mountpoint

echo "Device $device mounted to $mountpoint"
echo "Completed automount"

# START MYSQL
/etc/init.d/mysqld start





MANUALLY MOUNTED mysql ON /data VIA /dev/sdg
--------------------------------------------

AWS CONSOLE:

Elastic Block Store Volume: vol-6c752005

VolumeId:  vol-6c752005	Capacity: 40 GiB
Snapshot: --	Created: 2010-08-25 16:12 EST
Zone: us-east-1a	Status: in-use
Attachment Information:
i-0caa7261:/dev/sdg (attached)


MOUNT:

mount -t ext3 /dev/sdg /data

ll /data

    drwxr-xr-x  3 root root  4096 Oct 10 23:49 agua
    drwxr-xr-x 53 root root  4096 Oct 14 03:48 apps
    drwxr-xr-x  3 root root  4096 Oct 11 01:50 base
    drwxr-xr-x  2 root root  4096 Oct 18 19:56 img-mnt
    drwx------  2 root root 16384 Oct 10 23:43 lost+found
    drwxr-xr-x  5 root root  4096 Oct 11 01:07 mysql
    drwxr-xr-x  2 root root  4096 Oct 11 02:44 starcluster



CHECK LATEST VERSION OF MYSQL IS INSTALLED

yum install mysql

    Installed:
      mysql.i386 0:5.0.77-4.el5_5.3                    mysql.x86_64 0:5.0.77-4.el5_5.3                   
    Dependency Installed:
      perl-DBI.x86_64 0:1.52-2.el5 


yum install mysql-server

    Installed:
      mysql-server.x86_64 0:5.0.77-4.el5_5.3                                                             
    Dependency Installed:
      perl-DBD-MySQL.x86_64 0:3.0007-2.el5
  

CREATED mysqld EXECUTABLE:

ll /etc/init.d/mysqld 

    -rwxr-xr-x 1 root root 4286 May 27 21:07 /etc/init.d/mysqld


SET MYSQL TO RUN ON BOOT
# Use the chkconfig command to setup runlevels as needed.

/sbin/chkconfig --levels 235 mysqld on




MYSQL MOUNT SCRIPT TO MOUNT FROM /data

rm -fr /root/.aws/mount-mysql.sh
emacs /root/.aws/mount-mysql.sh
#!/bin/bash

# CREATE BINDINGS TO LINK TO MYSQL ON AMI

# USE bind AND mount TO MIRROR NEW LOCATIONS IN OLD FOLDERS
# Point MySQL to the correct database files on the EBS volume using mount bind.
echo "/data/mysql/etc/mysql /etc/mysql     none bind" | sudo tee -a /etc/fstab
#
#   SHOULD SEE SOMETHING LIKE THIS:
#   /data/mysql/etc/mysql /etc/mysql     none bind

mkdir /etc/mysql
mount /etc/mysql

echo "/data/mysql/lib/mysql /var/lib/mysql none bind" | sudo tee -a /etc/fstab
#
#   SHOULD SEE SOMETHING LIKE THIS:
#   /data/mysql/lib/mysql /var/lib/mysql none bind

# Mount in /var/lib
mount /var/lib/mysql

# Add to /etc/fstab
echo "/data/mysql/log/mysql /var/log/mysql none bind" | sudo tee -a /etc/fstab
mkdir /var/log/mysql
mount /var/log/mysql

# RESTART MYSQL

/etc/init.d/mysqld start



CHANGE PERMISSIONS:

chmod 700 /root/.aws/mount-mysql.sh


RUN:

/root/.aws/mount-mysql.sh


ADD THE SNAPSHOT OF THE mysql VOLUME
------------------------------------

ec2addvol \
--verbose \
--snapshot snap-d70afbbd \
-s 40 \
-z us-east-1a

    Setting User-Agent to [ec2-api-tools 1.3-45772]

    VOLUME  vol-e2b9af8b    40      snap-d70afbbd   us-east-1a      creating        2010-10-27T03:41:53+0000
    REQUEST ID      d632ef15-3081-4da9-b03d-48830009ae96


ec2attvol \
vol-e2b9af8b \
-i i-0caa7261 \
-d /dev/sdf

    ATTACHMENT      vol-e2b9af8b    i-0caa7261      /dev/sdf        attaching       2010-10-27T03:49:07+0000


ec2-describe-instances

    RESERVATION     r-8b0edbe1      728213020069    default
    INSTANCE        i-0caa7261      ami-fa669293    ec2-184-72-155-55.compute-1.amazonaws.com       ip-10-120-66-176.ec2.internal  running agua    0               t1.micro        2010-10-26T11:57:19+0000      us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.155.55   10.120.66.176                  ebs
    BLOCKDEVICE     /dev/sda1       vol-22ddc94b    2010-10-25T06:45:32.000Z
    BLOCKDEVICE     /dev/sdf        vol-e2b9af8b    2010-10-27T03:49:07.000Z


dmesg | grep sdf

    sdf: unknown partition table
    VFS: Can't find ext3 filesystem on dev sdf.


fdisk -l
    
    Disk /dev/sda1: 10.7 GB, 10737418240 bytes
    255 heads, 63 sectors/track, 1305 cylinders
    Units = cylinders of 16065 * 512 = 8225280 bytes
    
    Disk /dev/sda1 doesn't contain a valid partition table



SUCCESSFULLY ADDED A BLANK VOLUME
---------------------------------

#ec2addvol vol-6c752005 \
#-K /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
#-C /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
#-i i-0caa7261 \
#-d /dev/sdf \
#-z us-east-1a \
#-s 20

chmod 700 ~/.aws/mount-data.sh 

# CREATE A NEW BLANK VOLUME

ec2addvol \
-z us-east-1a \
-s 20

    VOLUME  vol-d0889eb9    20              us-east-1a      creating        2010-10-27T02:22:07+0000

# ec2attvol "$vol" -K "$EC2_PRIVATE_KEY" -C "$EC2_CERT" -i "$instance_id" -d "$dev"

ec2attvol \
vol-d0889eb9 \
-K /root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-C /root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem \
-i i-0caa7261 \
-d /dev/sdf


    ATTACHMENT      vol-d0889eb9    i-0caa7261      /dev/sdf        attaching       2010-10-27T02:25:37+0000


ec2-describe-instances

    RESERVATION     r-8b0edbe1      728213020069    default
    INSTANCE        i-0caa7261      ami-fa669293    ec2-184-72-155-55.compute-1.amazonaws.com       ip-10-120-66-176.ec2.internal  running agua    0               t1.micro        2010-10-26T11:57:19+0000      us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.155.55   10.120.66.176                  ebs
    BLOCKDEVICE     /dev/sda1       vol-22ddc94b    2010-10-25T06:45:32.000Z
    BLOCKDEVICE     /dev/sdf        vol-d0889eb9    2010-10-27T02:25:36.000Z


mount -t nfs /dev/sdf /data

OR SOMETHING LIKE mount -t vfat -o uid=myname,gid=users /dev/sda1 /home/myname/usb-disk


fdisk -l

    Disk /dev/sda1: 10.7 GB, 10737418240 bytes
    255 heads, 63 sectors/track, 1305 cylinders
    Units = cylinders of 16065 * 512 = 8225280 bytes
    
    Disk /dev/sda1 doesn't contain a valid partition table
    
    Disk /dev/sdf: 21.4 GB, 21474836480 bytes
    255 heads, 63 sectors/track, 2610 cylinders
    Units = cylinders of 16065 * 512 = 8225280 bytes
    
    Disk /dev/sdf doesn't contain a valid partition table


FIND OUT WHAT DEVICE sdb1 IS:

dmesg | grep sda1
    
    Command line:  root=/dev/sda1 ro 4
    Kernel command line:  root=/dev/sda1 ro 4
    EXT3 FS on sda1, internal journal


dmesg | grep sdf
    
     sdf: unknown partition table
    VFS: Can't find ext3 filesystem on dev sdf.

df -a

    Filesystem           1K-blocks      Used Available Use% Mounted on
    /dev/sda1             10403128   2586284   7292556  27% /
    none                         0         0         0   -  /proc
    none                         0         0         0   -  /sys
    none                         0         0         0   -  /dev/pts
    none                         0         0         0   -  /proc/sys/fs/binfmt_misc



DETACH VOLUME

ec2-detach-volume vol-d0889eb9

    ATTACHMENT      vol-d0889eb9    i-0caa7261      /dev/sdf        detaching       2010-10-27T02:25:36+0000



ec2-describe-instances

    RESERVATION     r-8b0edbe1      728213020069    default
    INSTANCE        i-0caa7261      ami-fa669293    ec2-184-72-155-55.compute-1.amazonaws.com       ip-10-120-66-176.ec2.internal  running agua    0               t1.micro        2010-10-26T11:57:19+0000      us-east-1a       aki-b51cf9dc    ari-b31cf9da            monitoring-disabled     184.72.155.55   10.120.66.176                  ebs
    BLOCKDEVICE     /dev/sda1       vol-22ddc94b    2010-10-25T06:45:32.000Z






NOTES
-----

1. CREATE NEW VOLUME, EITHER BLANK OR FROM A SNAPSHOT

ec2addvol --help

  SYNOPSIS
     
     ec2addvol ([ec2-create-volume])
     ec2addvol [GENERAL OPTIONS] (-s SIZE | --snapshot SNAPSHOT [-s SIZE]) -z ZONE
     
  GENERAL NOTES
     Any command option/parameter may be passed a value of '-' to indicate
     that values for that option should be read from stdin.
    
  DESCRIPTION
     Create a new volume.
     Create a volume, possibly based on a snapshot, of the indicated size in the specified zone.

  GENERAL OPTIONS

     -K, --private-key KEY
          Specify KEY as the private key to use. Defaults to the value of the
          EC2_PRIVATE_KEY environment variable (if set). Overrides the default.

     -C, --cert CERT
          Specify CERT as the X509 certificate to use. Defaults to the value 
          of the EC2_CERT environment variable (if set). Overrides the default.

     -U, --url URL
          Specify URL as the web service URL to use. Defaults to the value of
          'https://ec2.amazonaws.com' or to that of the EC2_URL environment
          variable (if set). Overrides the default.

     --region REGION
          Specify REGION as the web service region to use.
          This option will override the URL specified by the "-U URL" option
          and EC2_URL environment variable.

     -v, --verbose
          Verbose output.

     -?, --help
          Display this help.

     -H, --headers
          Display column headers.

     --debug
          Display additional debugging information.

     --show-empty-fields
          Indicate empty fields.

     --connection-timeout TIMEOUT
          Specify a connection timeout TIMEOUT (in seconds).

     --request-timeout TIMEOUT
          Specify a request timeout TIMEOUT (in seconds).

     -s, --size SIZE
          The size of the volume, in GiB (2^30 octets), to be created.

     --snapshot SNAPSHOT
          The snapshot on which the volume should be based.

     -z, --availability-zone ZONE
          The zone in which the volume should be created.


2. ATTACH A VOLUME TO THE INSTANCE


ec2attvol -h
  SYNOPSIS
     ec2attvol ([ec2-attach-volume])
     ec2attvol [GENERAL OPTIONS] VOLUME -i INSTANCE -d DEVICE
  GENERAL NOTES
     Any command option/parameter may be passed a value of '-' to indicate
     that values for that option should be read from stdin.
  DESCRIPTION
     Attach an available volume to an instance as a specific device.
     The VOLUME parameter specifies an available volume to attach.

  GENERAL OPTIONS

     -K, --private-key KEY
          Specify KEY as the private key to use. Defaults to the value of the
          EC2_PRIVATE_KEY environment variable (if set). Overrides the default.

     -C, --cert CERT
          Specify CERT as the X509 certificate to use. Defaults to the value 
          of the EC2_CERT environment variable (if set). Overrides the default.

     -U, --url URL
          Specify URL as the web service URL to use. Defaults to the value of
          'https://ec2.amazonaws.com' or to that of the EC2_URL environment
          variable (if set). Overrides the default.

     --region REGION
          Specify REGION as the web service region to use.
          This option will override the URL specified by the "-U URL" option
          and EC2_URL environment variable.

     -v, --verbose
          Verbose output.

     -?, --help
          Display this help.

     -H, --headers
          Display column headers.

     --debug
          Display additional debugging information.

     --show-empty-fields
          Indicate empty fields.

     --connection-timeout TIMEOUT
          Specify a connection timeout TIMEOUT (in seconds).

     --request-timeout TIMEOUT
          Specify a request timeout TIMEOUT (in seconds).

     -i, --instance INSTANCE
          A running instance to which to attach VOLUME.

     -d, --device DEVICE
          A device name as which to expose VOLUME inside INSTANCE.




3. CALL LOAD VOLUME SCRIPT ON BOOTUP

http://www.ioncannon.net/system-administration/199/automounting-amazon-ebs-volumes-on-ec2-instances/

Call it out of the local startup script:

/etc/rc.local

so it mounts on startup


CHANGE THIS 

emacs /etc/rc.local

    #!/bin/sh
    #
    # This script will be executed *after* all the other init scripts.
    # You can put your own initialization stuff in here if you don't
    # want to do the full Sys V style init stuff.
    
    touch /var/lock/subsys/local


TO THIS:

emacs /etc/rc.local

#!/bin/sh
#
# This script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.

touch /var/lock/subsys/local


# ATTACH VOLUME
/root/.aws/mount-data.sh 

# MOUNT VOLUME
mount /dev/sdf /data



ll /etc/rc.local


</entry>
<entry [Mon Oct 25 09:08:51 EDT 2010] INSTALLED AND STARTED HTTPD ON starcluster-7>



1. INSTALLED

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-73-189.compute-1.amazonaws.com

yum install httpd

    ...
    Installed:
      httpd.x86_64 0:2.2.3-43.el5.centos.3                                                             Complete!


ll /var/www

    drwxr-xr-x 2 root root 4096 Aug 30 12:32 cgi-bin
    drwxr-xr-x 3 root root 4096 Oct 25 09:00 error
    drwxr-xr-x 2 root root 4096 Aug 30 12:32 html
    drwxr-xr-x 3 root root 4096 Oct 25 09:00 icons


2. STARTED

/etc/init.d/httpd start

    Starting httpd: [  OK  ]


CHECKED URL:

http://ec2-174-129-73-189.compute-1.amazonaws.com

    OK!




</entry>



<entry [Mon Oct 25 01:23:29 UTC 2010] SUCCESSFUL FRESH START CREATING EBS-BACKED AMI starcluster-7>




LAUNCHED MICRO INSTANCE OF CENTOS 5.4 AMI

EC2 Instance: i-984c95f5

AMI ID: ami-75b8571c	Zone: us-east-1a
Security Groups: default	Type: t1.micro
Status: running	Owner: 728213020069
VPC ID: -	Subnet ID: -
Virtualization: paravirtual	Placement Group:
Reservation: r-cbc217a1	RAM Disk ID: ari-b31cf9da
Platform: -	Key Pair Name: agua
Kernel ID: aki-b51cf9dc	Monitoring: disabled
AMI Launch Index: 0	Elastic IP: -
Root Device: /dev/sda1	Root Device Type: ebs
Block Devices: /dev/sda1=vol-4e3e2a27:attached:2010-10-25T03:18:31.000Z:true
Lifecycle: normal
Public DNS: ec2-67-202-50-248.compute-1.amazonaws.com
Private DNS: ip-10-122-106-44.ec2.internal
Private IP Address: 10.122.106.44
Launch Time: 2010-10-24 23:18 EST

CONNECT OKAY TO STARCLUSTER-5:

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-67-202-50-248.compute-1.amazonaws.com



AND CREATED EBS-AMI IMAGE OF IT:

starcluster-6

ami-e265918b



LAUNCHED AND CONNECTED to STARCLUSTER-6:

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-75-101-194-165.compute-1.amazonaws.com
    
    ...
    debug2: callback done
    debug2: channel 0: open confirm rwindow 0 rmax 32768
    debug2: channel 0: rcvd adjust 2097152
    Last login: Sun Oct 24 23:54:41 2010 from 173.230.142.248
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
    [root@domU-12-31-38-01-C4-7B ~]#


INSTALLED PYTHON

mkdir -p /software/python/2.7
cd /software/python/2.7
wget http://python.org/ftp/python/2.7/Python-2.7.tgz
tar xvfz *
cd Py*
./configure
make
    
    Python build finished, but the necessary bits to build these modules were not found:
    _bsddb             _curses            _curses_panel   
    _sqlite3           _ssl               _tkinter        
    bsddb185           bz2                dbm             
    dl                 gdbm               imageop         
    readline           sunaudiodev                        
    To find the necessary bits, look in setup.py in detect_modules() for the module's name.
    ...    
    
make install


INSTALL PYTHON setuptools FOR PYTHON v 2.7
------------------------------------------

mkdir -p /software/python-setuptools/2.7
cd /software/python-setuptools/2.7
wget http://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg#md5=bd639f9b0eac4c42497034dec2ec0c2b
chmod 755 setuptools-0.6c11-py2.7.egg 
./setuptools-0.6c11-py2.7.egg 
    
    Copying setuptools-0.6c11-py2.7.egg to /usr/local/lib/python2.7/site-packages
    Adding setuptools 0.6c11 to easy-install.pth file
    Installing easy_install script to /usr/local/bin
    Installing easy_install-2.7 script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/setuptools-0.6c11-py2.7.egg
    Processing dependencies for setuptools==0.6c11
    Finished processing dependencies for setuptools==0.6c11


INSTALL PYTHON DEVEL
--------------------

yum install python-devel
    
    Installed:
      python-devel.i386 0:2.4.3-27.el5                  python-devel.x86_64 0:2.4.3-27.el5             Complete!



INSTALL PYTHON HASHLIB LIBRARY
------------------------------

mkdir -p /software/python-hashlib/20081119
cd /software/python-hashlib/20081119
wget http://code.krypto.org/python/hashlib/hashlib-20081119.zip

COPY FROM WINDOWS TO LINODE TO STARCLUSTER-6

scp root@173.230.142.248:hashlib-20081119.zip ./

python setup.py install
    
    copying build/lib.linux-x86_64-2.7/_sha.so -> /usr/local/lib/python2.7/site-packages
    byte-compiling /usr/local/lib/python2.7/site-packages/hashlib.py to hashlib.pyc
    running install_egg_info
    Writing /usr/local/lib/python2.7/site-packages/hashlib-20081119-py2.7.egg-info




INSTALL STARCLUSTER WITH PYTHON easy_install

cd /root/base/apps/starcluster/0.91
python /usr/local/bin/easy_install StarCluster

BUT DID NOT COMPLETE INSTALL DUE TO FAILURE AT paramiko DOWNLOAD SITE:


    Download error: [Errno -3] Temporary failure in name resolution -- Some packages may not be found!
    Best match: paramiko 1.7.6
    Downloading http://www.lag.net/paramiko/download/paramiko-1.7.6.zip
    error: Download error for http://www.lag.net/paramiko/download/paramiko-1.7.6.zip: [Errno -3] Temporary failure in name resolution


RUNNING starcluster COMMAND GAVE FOLLOWING ERROR: 

    Traceback (most recent call last):
      File "/usr/local/bin/starcluster", line 4, in <module>
        import pkg_resources
      File "build/bdist.linux-i686/egg/pkg_resources.py", line 2603, in <module>
      File "build/bdist.linux-i686/egg/pkg_resources.py", line 666, in require
      File "build/bdist.linux-i686/egg/pkg_resources.py", line 565, in resolve
    pkg_resources.DistributionNotFound: paramiko>=1.7.6



INSTALL STARCLUSTER FROM SOURCE GAVE SAME ERROR WITH paramiko DOWNLOAD:

    ...
    Installed /usr/local/lib/python2.7/site-packages/StarCluster-0.91-py2.7.egg
    Processing dependencies for StarCluster==0.91
    Searching for paramiko>=1.7.6
    Reading http://pypi.python.org/simple/paramiko/
    Reading http://www.lag.net/~robey/paramiko/
    Download error: [Errno -3] Temporary failure in name resolution -- Some packages may not be found!
    Reading http://www.lag.net/paramiko/
    Download error: [Errno -3] Temporary failure in name resolution -- Some packages may not be found!
    Best match: paramiko 1.7.6
    Downloading http://www.lag.net/paramiko/download/paramiko-1.7.6.zip
    error: Download error for http://www.lag.net/paramiko/download/paramiko-1.7.6.zip: [Errno -3] Temporary failure in name resolution


DOWNLOADED PARAMIKO SOURCE:

mkdir -p /root/base/apps/starcluster/0.91/dependencies/paramiko
cd /root/base/apps/starcluster/0.91/dependencies/paramiko
wget http://ftp.de.debian.org/debian/pool/main/p/paramiko/paramiko_1.7.6.orig.tar.gz
tar xvfz *
mv pa*1.7.6 1.7.6
cd 1.7.6
python setup.py install

    
    Installed /usr/local/lib/python2.7/site-packages/paramiko-1.7.6-py2.7.egg
    Processing dependencies for paramiko==1.7.6
    Searching for pycrypto>=1.9
    Reading http://pypi.python.org/simple/pycrypto/
    Reading http://pycrypto.sourceforge.net
    Reading http://www.pycrypto.org/
    Reading http://www.amk.ca/python/code/crypto
    Best match: pycrypto 2.3
    Downloading http://www.pycrypto.org/files/pycrypto-2.3.tar.gz
    Processing pycrypto-2.3.tar.gz
    Running pycrypto-2.3/setup.py -q bdist_egg --dist-dir /tmp/easy_install-WHywTM/pycrypto-2.3/egg-dist-tmp-rqFrCb
    warning: GMP library not found; Not building Crypto.PublicKey._fastmath.
    zip_safe flag not set; analyzing archive contents...
    Adding pycrypto 2.3 to easy-install.pth file
    
    Installed /usr/local/lib/python2.7/site-packages/pycrypto-2.3-py2.7-linux-x86_64.egg
    Finished processing dependencies for paramiko==1.7.6


WENT TO REINSTALL STARCLUSTER USING easy_install

cd /root/base/apps/starcluster/0.91
python /usr/local/bin/easy_install StarCluster

    Searching for StarCluster
    Best match: StarCluster 0.91
    Processing StarCluster-0.91-py2.7.egg
    StarCluster 0.91 is already the active version in easy-install.pth
    Installing starcluster script to /usr/local/bin
    
    Using /usr/local/lib/python2.7/site-packages/StarCluster-0.91-py2.7.egg
    Processing dependencies for StarCluster
    Finished processing dependencies for StarCluster

BUT GOT THIS ERROR WHEN RAN starcluster:

starcluster

    Traceback (most recent call last):
      File "/usr/local/bin/starcluster", line 5, in <module>
        pkg_resources.run_script('StarCluster==0.91', 'starcluster')
      File "build/bdist.linux-i686/egg/pkg_resources.py", line 489, in run_script
      File "build/bdist.linux-i686/egg/pkg_resources.py", line 1214, in run_script
      File "/usr/local/lib/python2.7/site-packages/StarCluster-0.91-py2.7.egg/EGG-INFO/scripts/starcluster", line 2, in <module>
        # EASY-INSTALL-SCRIPT: 'StarCluster==0.91','starcluster'
      File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 38, in <module>
      File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 12, in <module>
      File "build/bdist.linux-x86_64/egg/starcluster/awsutils.py", line 531, in <module>
      File "build/bdist.linux-x86_64/egg/starcluster/awsutils.py", line 533, in EasyS3
    AttributeError: 'module' object has no attribute 'connection'


UNINSTALL AFTER easy_install

1. REMOVE STARCLUSER FROM .pth FILE

python /usr/local/bin/easy_install -m StarCluster

    Searching for StarCluster
    Best match: StarCluster 0.91
    Processing StarCluster-0.91-py2.7.egg
    Removing StarCluster 0.91 from easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Using /usr/local/lib/python2.7/site-packages/StarCluster-0.91-py2.7.egg
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:
    
        pkg_resources.require("StarCluster")  # latest installed version
        pkg_resources.require("StarCluster==0.91")  # this exact version
        pkg_resources.require("StarCluster>=0.91")  # this version or higher
    
    Processing dependencies for StarCluster
    Finished processing dependencies for StarCluster


2. REMOVE STARCLUSTER EGG FILE

cd /usr/local/lib/python2.7/site-packages

    -rw-r--r-- 1 root root 843918 Oct 25 01:27 boto-2.0b3-py2.7.egg
    -rw-r--r-- 1 root root    303 Oct 25 01:55 easy-install.pth
    -rw-r--r-- 1 root root    424 Oct 25 01:25 hashlib-20081119-py2.7.egg-info
    -rw-r--r-- 1 root root   4993 Nov 19  2008 hashlib.py
    -rw-r--r-- 1 root root   4327 Oct 25 01:25 hashlib.pyc
    -rwxr-xr-x 1 root root  36527 Oct 25 01:25 _md5.so
    -rw-r--r-- 1 root root 299456 Oct 25 01:51 paramiko-1.7.6-py2.7.egg
    -rw-r--r-- 1 root root 559135 Oct 25 01:51 pycrypto-2.3-py2.7-linux-x86_64.egg
    -rw-r--r-- 1 root root    119 Oct 25 01:01 README
    -rwxr-xr-x 1 root root 332005 Jul  7 20:26 setuptools-0.6c11-py2.7.egg
    -rw-r--r-- 1 root root     30 Oct 25 01:03 setuptools.pth
    -rwxr-xr-x 1 root root  43647 Oct 25 01:25 _sha256.so
    -rwxr-xr-x 1 root root  48307 Oct 25 01:25 _sha512.so
    -rwxr-xr-x 1 root root  35381 Oct 25 01:25 _sha.so
    -rw-r--r-- 1 root root 163209 Oct 25 01:38 StarCluster-0.91-py2.7.egg

mv StarCluster-0.91-py2.7.egg StarCluster-0.91-py2.7.egg.bkp


cd /root/base/apps/starcluster/0.91
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
    creating build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    copying build/scripts-2.7/starcluster -> build/bdist.linux-x86_64/egg/EGG-INFO/scripts
    changing mode of build/bdist.linux-x86_64/egg/EGG-INFO/scripts/starcluster to 755
    copying StarCluster.egg-info/PKG-INFO -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/SOURCES.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/dependency_links.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/requires.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/top_level.txt -> build/bdist.linux-x86_64/egg/EGG-INFO
    copying StarCluster.egg-info/zip-safe -> build/bdist.linux-x86_64/egg/EGG-INFO
    creating 'dist/StarCluster-0.91-py2.7.egg' and adding 'build/bdist.linux-x86_64/egg' to it
    removing 'build/bdist.linux-x86_64/egg' (and everything under it)
    Processing StarCluster-0.91-py2.7.egg
    Copying StarCluster-0.91-py2.7.egg to /usr/local/lib/python2.7/site-packages
    Adding StarCluster 0.91 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/StarCluster-0.91-py2.7.egg
    Processing dependencies for StarCluster==0.91
    Searching for boto==2.0b3
    Best match: boto 2.0b3
    Processing boto-2.0b3-py2.7.egg
    boto 2.0b3 is already the active version in easy-install.pth
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
    
    Using /usr/local/lib/python2.7/site-packages/boto-2.0b3-py2.7.egg
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
    Finished processing dependencies for StarCluster==0.91
    


starcluster

    Traceback (most recent call last):
      File "/usr/local/bin/starcluster", line 5, in <module>
        pkg_resources.run_script('StarCluster==0.91', 'starcluster')
      File "build/bdist.linux-i686/egg/pkg_resources.py", line 489, in run_script
      File "build/bdist.linux-i686/egg/pkg_resources.py", line 1214, in run_script
      File "/usr/local/lib/python2.7/site-packages/StarCluster-0.91-py2.7.egg/EGG-INFO/scripts/starcluster", line 2, in <module>
        # EASY-INSTALL-SCRIPT: 'StarCluster==0.91','starcluster'
      File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 38, in <module>
      File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 12, in <module>
      File "build/bdist.linux-x86_64/egg/starcluster/awsutils.py", line 531, in <module>
      File "build/bdist.linux-x86_64/egg/starcluster/awsutils.py", line 533, in EasyS3
    AttributeError: 'module' object has no attribute 'connection'



CHECKED ONLINE AND FOUND THIS:

    [Starcluster] starcluster install error (AttributeError: 'module' object has no attribute 'connection')
    
    Justin Riley jtriley at MIT.EDU 
    Fri Aug 6 14:46:43 EDT 2010
    Previous message: [Starcluster] OT: How much does supercomputing cost?
    Next message: [Starcluster] Cluster with mixed NODE_INSTANCE_TYPE's
    Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
    -----BEGIN PGP SIGNED MESSAGE-----
    Hash: SHA1
    
    Hi Fabian,
    
    Sorry to hear you're having issues. This error is most likely related to
    the version of boto you're using. My guess is that boto 2.0* is
    installed and this is the problem. I'm releasing a new version soon that
    is compatible with the boto 2.0* releases.
    
    StarCluster 0.91 was developed against boto 1.9b so you'll probably want
    to try installing it and see if it fixes the issue. Just for drill would
    you mind sending me the output of the following command:
    
    $ python -c "import boto; print boto.Version"
    
    Again, if it doesn't say 1.9b then installing boto 1.9b will likely fix
    the problem for now.
    
    Also, how did you install StarCluster? Did you use easy-install, pip,
    virtualenv, portage, or just run python setup.py install?
    
    BTW, I've cc'd the StarCluster mailing list on this message in case
    others run into a similar problem. Please consider joining the mailing
    list for future questions:
    
    http://mailman.mit.edu/mailman/listinfo/starcluster
    
    Thanks for your interest in StarCluster,



I.E., COULD BE boto PROBLEM SO DOWNGRADED TO BOTO 1.9:

cd /usr/local/lib/python2.7/site-packages
mv boto-2.0b3-py2.7.egg boto-2.0b3-py2.7.egg.bkp

python /usr/local/bin/easy_install -m boto
    
    
    Searching for boto
    Reading http://pypi.python.org/simple/boto/
    Reading http://code.google.com/p/boto/
    Reading http://code.google.com/p/boto
    Best match: boto 2.0b3
    Downloading http://boto.googlecode.com/files/boto-2.0b3.tar.gz
    Processing boto-2.0b3.tar.gz
    Running boto-2.0b3/setup.py -q bdist_egg --dist-dir /tmp/easy_install-c70uEd/boto-2.0b3/egg-dist-tmp-Pc35JE
    zip_safe flag not set; analyzing archive contents...
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
    
    Because this distribution was installed --multi-version, before you can
    import modules from this package in an application, you will need to
    'import pkg_resources' and then use a 'require()' call similar to one of
    these examples, in order to select the desired version:
    
        pkg_resources.require("boto")  # latest installed version
        pkg_resources.require("boto==2.0b3")  # this exact version
        pkg_resources.require("boto>=2.0b3")  # this version or higher
    
    Processing dependencies for boto
    Finished processing dependencies for boto





cd /root/base/apps/starcluster/0.91/dependencies/boto/1.9b

wget http://boto.googlecode.com/files/boto-1.9b.tar.gz

    ...
    Adding boto 1.9b to easy-install.pth file
    Installing launch_instance script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    
    Installed /usr/local/lib/python2.7/site-packages/boto-1.9b-py2.7.egg
    Processing dependencies for boto==1.9b
    Finished processing dependencies for boto==1.9b


RAN STARCLUSTER

starcluster

    OK!

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
                            



SAVED starcluster-6 AS EBS-AMI starcluster-7


ami-fa669293


LAUNCHED starcluster-7 AMI

EC2 Instance: i-7c7ba211
AMI ID: ami-e265918b	Zone: us-east-1a
Security Groups: default	Type: t1.micro
Status: running	Owner: 728213020069
VPC ID: -	Subnet ID: -
Virtualization: paravirtual	Placement Group:
Reservation: r-a7f421cd	RAM Disk ID: ari-b31cf9da
Platform: -	Key Pair Name: agua
Kernel ID: aki-b51cf9dc	Monitoring: disabled
AMI Launch Index: 0	Elastic IP: -
Root Device: /dev/sda1	Root Device Type: ebs
Block Devices: /dev/sda1=vol-ec3b2f85:attached:2010-10-25T03:52:12.000Z:true
Lifecycle: normal
Public DNS: ec2-75-101-194-165.compute-1.amazonaws.com
Private DNS: domU-12-31-38-01-C4-7B.compute-1.internal
Private IP Address: 10.253.203.137
Launch Time: 2010-10-24 23:52 EST


CONNECT:

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-56-20.compute-1.amazonaws.com


debug2: channel 0: rcvd adjust 2097152
Last login: Mon Oct 25 01:25:17 2010 from 173.230.142.248
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


RUN STARCLUSTER:

    OK!

starcluster

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



STOPPED, RESTARTED, AND CONNECTED:


NOTE THE NEW URL!

####ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
####root@ec2-174-129-56-20.compute-1.amazonaws.com

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-184-73-148-127.compute-1.amazonaws.com


    
    debug2: channel 0: rcvd adjust 2097152
    Last login: Mon Oct 25 02:47:03 2010 from 173.230.142.248
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


RAN STARCLUSTER:

    OK!

[root@ip-10-122-53-144 ~]# starcluster
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



ONCE MORE STOPPED, RESTARTED AND CONNECTED:

NOTE THE NEW URL!

########ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
########root@ec2-174-129-56-20.compute-1.amazonaws.com
####
####ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
####root@ec2-184-73-148-127.compute-1.amazonaws.com

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-73-189.compute-1.amazonaws.com


    OK!

    Last login: Mon Oct 25 03:00:15 2010 from 173.230.142.248
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


starcluster

    OK!
    
    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    ...    







NOTES
-----



CREATED EBS-AMI FROM STARCLUSTER CENTOS 5.1 CLUSTER INSTANCE

ami-40659129

BUT WHEN TRIED TO LAUNCH NEW EBS-AMI, DISCOVERED THAT
COULD ONLY CREATE A CLUSTER INSTANCE (I.E., COULD NOT CREATE A MICRO INSTANCE)



STARCLUSTER USING HIGH MEMORY MASTER NODE
------------------------------------------

[Starcluster] Cluster with mixed NODE_INSTANCE_TYPE's

Hesselberth, Jay JAY.HESSELBERTH at ucdenver.edu 
Mon Aug 9 15:30:14 EDT 2010
Previous message: [Starcluster] starcluster install error (AttributeError: 'module' object has no attribute 'connection')
Next message: [Starcluster] Cluster with mixed NODE_INSTANCE_TYPE's
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]

I have an application where I'm running 1000's of jobs with small memory requirements (e.g. ~500 Mb / job), but there is a periodic job that needs substantially more RAM (~8 Gb).  I've been running clusters with c1.xlarge instances to maximize throughput of the small jobs, but these don't have the necessary RAM.

I was thinking it would be nice to specify clusters with mixed NODE_INSTANCE_TYPES; e.g. configuring a cluster with 4 c1.xlarge instances for throughput and 1 m2.xlarge instance to handle large RAM jobs.  I don't see how this is currently possible (I'm using the experimental starcluster branch).   Is a feature that is planned for the future?

Thanks,
Jay Hesselberth


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









EXAMPLE SCRIPT TO CREATE EBS-BACKED AMI

###ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
###root@ec2-67-202-39-32.compute-1.amazonaws.com



export AMAZON_USER_ID=728213020069
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export EC2_CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
export  AWS_ACCESS_KEY_ID=AKIAIZXZ6S7ARZ44TTHQ
export  AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/root/base/apps/ec2/1.3-57419
export EC2_APITOOL_HOME=/root/base/apps/ec2/1.3-57419
export EC2_HOME=/root/base/apps/ec2/1.3-57419
PATH=$EC2_AMITOOL_HOME/bin:$PATH

export JAVA_HOME=/usr


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




CREATE SCRIPT FILE
# Here’s the interesting portion of the script (parsing arguments and setting up
# environment variable for the tools has been omitted) :
# Using the AMI ID, get the manifest name and architecture

AMI_DESC=`$EC2_HOME/bin/ec2dim |grep $AMI_ID`
MANIFEST=`echo $AMI_DESC | awk '{ print $3 }'`
ARCH=`echo $AMI_DESC | awk '{ print $7 }'`
MANIFEST_PATH=`dirname $MANIFEST`/
MANIFEST_PREFIX=`basename $MANIFEST |awk -F. '{ print $1 }'`

#Download the bundle to /mnt
echo grabbing bundle $MANIFEST_PATH $MANIFEST_PREFIX
/usr/local/bin/ec2-download-bundle -b $MANIFEST_PATH -a $ACCESS_ID -s $SECRET_KEY -k pk.pem -p $MANIFEST_PREFIX -d /mnt

# Unbundle the image into a single (rather large) file.
echo unbundling, this will take a while
/usr/local/bin/ec2-unbundle -k pk.pem -m /mnt/$MANIFEST_PREFIX.manifest.xml  -s /mnt -d /mnt

# Create an EBS volume, 10 GB. This size is used because that is the largest size for an S3 based AMI.
# Using launch options I show at the end of this article, you can increase that at run time.
# Notice, the availability zone comes from instance metadata. We must wait till the volume is created before moving on

ZONE=`curl http://169.254.169.254/latest/meta-data/placement/availability-zone`
VOL_ID=`$EC2_HOME/bin/ec2addvol -s 50 -z $ZONE | awk '{ print $2 }'`
STATUS=creating
while [ $STATUS != "available" ]
do
echo volume $STATUS, waiting for volume create...
sleep 3
STATUS=`$EC2_HOME/bin/ec2dvol $VOL_ID | awk '{ print $5 }'`
done
# Attach the volume


INST_ID=`curl http://169.254.169.254/latest/meta-data/instance-id`
$EC2_HOME/bin/ec2attvol $VOL_ID -i $INST_ID -d $EBS_DEV

# Here’s where we turn the image into a real volume, using our old friend “dd”
# echo copying image to volume, this will also take a while

dd if=/mnt/$MANIFEST_PREFIX of=$EBS_DEV

# Mount the volume and remove ephemeral store entry from /etc/fstab.
# This is required because “Boot from EBS” doesn’t use the ephemeral store by default.


mount $EBS_DEV /perm
cat /perm/etc/fstab |grep -v mnt >/tmp/fstab
mv /perm/etc/fstab /perm/etc/fstab.bak
mv /tmp/fstab /perm/etc/

# Then, unmount and detach the volume. We’re nearly there.
umount /perm
$EC2_HOME/bin/ec2detvol $VOL_ID -i $INST_ID


# Create a snapshot and wait for it to complete.
SNAP_ID=`$EC2_HOME/bin/ec2addsnap $VOL_ID -d "created by createAMI.sh" | awk '{ print $2 }'`
# now, wait for it
STATUS=pending
while [ $STATUS != "completed" ]
do
echo volume $STATUS, waiting for snap complete...
sleep 3
STATUS=`$EC2_HOME/bin/ec2dsnap $SNAP_ID | awk '{ print $4 }'`
done
Finally, delete the volume and register the snapshot


$EC2_HOME/bin/ec2delvol $VOL_ID
$EC2_HOME/bin/ec2reg -s $SNAP_ID -a $ARCH -d $DESCR -n $MANIFEST_PREFIX
To run your AMI with a larger root partition, use a command like this (which specifies 100GB);
  ec2-run-instances –key <KEYPAIR> –block-device-mapping /dev/sda1=:100 <AMI_ID>
Ads by Google




rm -fr /root/base/pipeline/ec2/EBS-to-AMI-v1.sh
emacs /root/base/pipeline/ec2/EBS-to-AMI-v1.sh
# My personal data:
AMI_ID=ami-74b65c1d
ACCESS_ID=728213020069
SECRET_KEY=4+0Max8DLoykQ+kPeGzP6S4LUJw0y5Ab0DrschU6
PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
EBS_DEV=/dev/sdh
VOL_SIZE=20 #Size in GB
DESCR="starcluster-4-EBS"

IFS=" AMI_DATA=`ec2dim -v $AMI_ID`
ARCH=`echo $AMI_DATA | grep 'architecture' | sed -e 's/^.*architecture>\(.*\)\(.*\)\/\(.*\)\(.*\)/tmp/fstab
mv /perm/etc/fstab /perm/etc/fstab.bak
mv /tmp/fstab /perm/etc/

echo "/etc/fstab has been moved to /perm/etc. Giving you some time to check it out …"
sleep 30

umount /perm
$EC2_HOME/bin/ec2detvol $VOL_ID -i $INST_ID
SNAP_ID=`$EC2_HOME/bin/ec2addsnap $VOL_ID -d "Created with EBS-to-AMI-v1.sh" | cut -f2`
STATUS=pending
echo volume $STATUS, waiting for snap complete…
while ! echo $STATUS | grep -q "completed"
do
sleep 3
STATUS=`$EC2_HOME/bin/ec2dsnap $SNAP_ID | cut -f4`
echo volume $STATUS, waiting for snap complete…
done

echo Deleting Volume $VOL_ID
echo $EC2_HOME/bin/ec2delvol $VOL_ID
$EC2_HOME/bin/ec2delvol $VOL_ID

echo Registering EBS AMI …
echo $EC2_HOME/bin/ec2reg -s $SNAP_ID -a $ARCH -d "$DESCR" -n ${MANIFEST_PREFIX}-ebs
$EC2_HOME/bin/ec2reg -s $SNAP_ID -a $ARCH -d "$DESCR" -n ${MANIFEST_PREFIX}-ebs



RUN SCRIPT

 
chmod 755 /root/base/pipeline/ec2/EBS-to-AMI.sh
/root/base/pipeline/ec2/EBS-to-AMI.sh



NOTES
-----
http://www.capsunlock.net/2009/12/create-ebs-boot-ami.html



http://coderslike.us/2009/12/07/amazon-ec2-boot-from-ebs-and-ami-conversion/

George
December 27, 2009 at 7:35 am
For anyone that’s interested, I turned the above snippets into a shell script with some modifications. Just use the following to pull down the instance store based AMI, copy the data with `dd` to a new EBS volume, take a snapshot, and lastly register the snapshot as an AMI.

Of course, check the variables in the top section and modify to suit your needs.

# My personal data:
AMI_ID=ami-0XXXXXX # Instance AMI you wish to convert
ACCESS_ID=XXXXXXXXXXXXXXXX # Copy/paste from YourAccount->SecurityCreds->AccessKeys->AccessKeyID
SECRET_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXX #Copy/paste from YourAccount->SecurityCreds->AccessKey->SecretAccessKey->Show
PRIVATE_KEY=/mnt/.ec2/pk-XXXXXXXXXXXXXXXXXXXXXXXXXXXXX.pem
CERT=/mnt/.ec2/cert-XXXXXXXXXXXXXXXXXXXXXXXXXX.pem
EBS_DEV=/dev/sdh
VOL_SIZE=11 #Size in GB. I picked 11, but change to suit your needs.
DESCR=”DescriptionOfMyAMI”

IFS=” AMI_DATA=`ec2dim -v $AMI_ID`
ARCH=`echo $AMI_DATA | grep ‘architecture’ | sed -e ‘s/^.*architecture>\(.*\)\(.*\)\/\(.*\)\(.*\)/tmp/fstab
mv /perm/etc/fstab /perm/etc/fstab.bak
mv /tmp/fstab /perm/etc/

echo “/etc/fstab has been moved to /perm/etc. Giving you some time to check it out …”
sleep 30

umount /perm
$EC2_HOME/bin/ec2detvol $VOL_ID -i $INST_ID
SNAP_ID=`$EC2_HOME/bin/ec2addsnap $VOL_ID -d “created by George’s Modified createAMI.sh” | cut -f2`
STATUS=pending
echo volume $STATUS, waiting for snap complete…
while ! echo $STATUS | grep -q “completed”
do
sleep 3
STATUS=`$EC2_HOME/bin/ec2dsnap $SNAP_ID | cut -f4`
echo volume $STATUS, waiting for snap complete…
done

echo Deleting Volume $VOL_ID
echo $EC2_HOME/bin/ec2delvol $VOL_ID
$EC2_HOME/bin/ec2delvol $VOL_ID

echo Registering EBS AMI …
echo $EC2_HOME/bin/ec2reg -s $SNAP_ID -a $ARCH -d “$DESCR” -n ${MANIFEST_PREFIX}-ebs
$EC2_HOME/bin/ec2reg -s $SNAP_ID -a $ARCH -d “$DESCR” -n ${MANIFEST_PREFIX}-ebs



amazon ec2 – boot from ebs and ami conversion
By dkavanagh	 28 Comments
Categories: Uncategorized	
Tags: aws, cloud, EC2
Amazon recently announced an important new feature for their Elastic Compute Cloud. Previously, each instance was based on an image that could be a maximum of 10 GB in size. So, each machine you brought up could have a root partition up to 10 GB in size and additional storage would need to be added in other ways. The size restriction alone is somewhat limiting. Amazon has not only addressed that, but given users some other very powerful abilities.

Now, you can define an image in an EBS snapshot. That means the size of your root partition can be as large as 1 TB. Yes, that’s 100 times larger than the old 10 GB limit. Beyond the obvious benefit of having larger images, you can also stop instances. Stopping an instance is different than terminating an instance. The distinction is important because stopping an instance is very much like hitting the “pause” button. It doesn’t take a lot to realize that pausing a running instance and being able to start it up again later is very powerful! Instances tend to boot faster off EBS. As  you might expect, if you create a really large volume for a root partition (like 100s of GBs), it will take longer to come up. That’s just because it takes longer to create larger volumes than smaller ones.

Let’s go further and look at how powerful it is to have snapshots as the basis for images. By having a snapshot that you can create EBS volumes from, that means you can mount a volume, based on your snapshot (which represents your image) and make modifications to it! This is immensely helpful when trying to make changes to an image. Previously, it was somewhat more awkward to modify an image. You actually had to boot it up and run it. But now, even if there is an error that prevents proper running, you can access the image storage and make changes. Very useful!

Of course judging by the number of public AMIs out there, there are a great number of images backed by S3 that people will want to convert. Towards this end, I came up with a script to convert AMIs from the old to the new style. Here’s the cliff’s notes version.

Use an instance in the same region as your image to do the following,

download the image bundle to the ephemeral store
unbundle the image (resulting in a single file)
create a temporary EBS volume in the same availability zone as the instance
attach the volume to your instance
copy the unbundled image onto the raw EBS volume
mount the EBS volume
edit /etc/fstab on the volume to remove the ephemeral store mount line
unmount and detach the volume
create a snapshot of the EBS volume
register the snapshot as an image, and you’re done!
During the private beta for this feature, I created an AMI to handle all of this, so you boot the AMI with a set of parameters and it does the dirty work. The script uses the standard API and AMI tools that Amazon supplies. I’ll roll that out on the public cloud shortly.

Here’s the interesting portion of the script (parsing arguments and setting up environment variable for the tools has been omitted) :

Using the AMI ID, get the manifest name and architecture
1
AMI_DESC=`$EC2_HOME/bin/ec2dim |grep $AMI_ID`
2
MANIFEST=`echo $AMI_DESC | awk '{ print $3 }'`
3
ARCH=`echo $AMI_DESC | awk '{ print $7 }'`
4
MANIFEST_PATH=`dirname $MANIFEST`/
5
MANIFEST_PREFIX=`basename $MANIFEST |awk -F. '{ print $1 }'`
Download the bundle to /mnt

1
echo grabbing bundle $MANIFEST_PATH $MANIFEST_PREFIX
2
/usr/local/bin/ec2-download-bundle -b $MANIFEST_PATH -a $ACCESS_ID -s $SECRET_KEY -k pk.pem -p $MANIFEST_PREFIX -d /mnt
Unbundle the image into a single (rather large) file.

1
echo unbundling, this will take a while
2
/usr/local/bin/ec2-unbundle -k pk.pem -m /mnt/$MANIFEST_PREFIX.manifest.xml  -s /mnt -d /mnt
Create an EBS volume, 10 GB. This size is used because that is the largest size for an S3 based AMI. Using launch options I show at the end of this article, you can increase that at run time. Notice, the availability zone comes from instance metadata. We must wait till the volume is created before moving on.

1
ZONE=`curl http://169.254.169.254/latest/meta-data/placement/availability-zone`
2
VOL_ID=`$EC2_HOME/bin/ec2addvol -s 50 -z $ZONE | awk '{ print $2 }'`
3
STATUS=creating
4
while [ $STATUS != "available" ]
5
do
6
echo volume $STATUS, waiting for volume create...
7
sleep 3
8
STATUS=`$EC2_HOME/bin/ec2dvol $VOL_ID | awk '{ print $5 }'`
9
done
Attach the volume

1
INST_ID=`curl http://169.254.169.254/latest/meta-data/instance-id`
2
$EC2_HOME/bin/ec2attvol $VOL_ID -i $INST_ID -d $EBS_DEV
Here’s where we turn the image into a real volume, using our old friend “dd”

1
echo copying image to volume, this will also take a while
2
dd if=/mnt/$MANIFEST_PREFIX of=$EBS_DEV
Mount the volume and remove ephemeral store entry from /etc/fstab. This is required because “Boot from EBS” doesn’t use the ephemeral store by default.

1
mount $EBS_DEV /perm
2
cat /perm/etc/fstab |grep -v mnt >/tmp/fstab
3
mv /perm/etc/fstab /perm/etc/fstab.bak
4
mv /tmp/fstab /perm/etc/
Then, unmount and detach the volume. We’re nearly there.

1
umount /perm
2
$EC2_HOME/bin/ec2detvol $VOL_ID -i $INST_ID
Create a snapshot and wait for it to complete.

1
SNAP_ID=`$EC2_HOME/bin/ec2addsnap $VOL_ID -d "created by createAMI.sh" | awk '{ print $2 }'`
2
# now, wait for it
3
STATUS=pending
4
while [ $STATUS != "completed" ]
5
do
6
echo volume $STATUS, waiting for snap complete...
7
sleep 3
8
STATUS=`$EC2_HOME/bin/ec2dsnap $SNAP_ID | awk '{ print $4 }'`
9
done
Finally, delete the volume and register the snapshot

1
$EC2_HOME/bin/ec2delvol $VOL_ID
2
$EC2_HOME/bin/ec2reg -s $SNAP_ID -a $ARCH -d $DESCR -n $MANIFEST_PREFIX
To run your AMI with a larger root partition, use a command like this (which specifies 100GB);
  ec2-run-instances –key <KEYPAIR> –block-device-mapping /dev/sda1=:100 <AMI_ID>
  
  
  

</entry>



<entry [Sun Oct 24 01:40:22 UTC 2010] INSTANCE INVENTORY>



# starcluster-3-AMI
ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com

HANGS

# starcluster-2-AMI
ssh -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-75-101-201-63.compute-1.amazonaws.com
    
starcluster-2-AMI CONNECTS OKAY:

debug1: SSH2_MSG_KEXINIT received
debug1: kex: server->client aes128-cbc hmac-md5 none
debug1: kex: client->server aes128-cbc hmac-md5 none
debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
The authenticity of host 'ec2-75-101-201-63.compute-1.amazonaws.com (75.101.201.63)' can't be established.
RSA key fingerprint is a9:25:21:6c:74:00:91:1f:2d:3d:0e:34:94:52:ff:d1.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'ec2-75-101-201-63.compute-1.amazonaws.com,75.101.201.63' (RSA) to the list of known hosts.
debug1: ssh_rsa_verify: signature correct
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: SSH2_MSG_SERVICE_REQUEST sent
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey,gssapi-with-mic
debug1: Next authentication method: gssapi-with-mic
debug1: Unspecified GSS failure.  Minor code may provide more information
Unknown code krb5 195

debug1: Unspecified GSS failure.  Minor code may provide more information
Unknown code krb5 195

debug1: Unspecified GSS failure.  Minor code may provide more information
Unknown code krb5 195

debug1: Next authentication method: publickey
debug1: Trying private key: /root/base/apps/ec2/keypair/agua.pem
debug1: read PEM private key done: type RSA
debug1: Authentication succeeded (publickey).
debug1: channel 0: new [client-session]
debug1: Entering interactive session.
debug1: Sending environment.
debug1: Sending env LANG = en_US.UTF-8
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
[root@ip-10-122-129-115 ~]# debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1

[root@ip-10-122-129-115 ~]# 
[root@ip-10-122-129-115 ~]# 
[root@ip-10-122-129-115 ~]# debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1

[root@ip-10-122-129-115 ~]# ll /var/log/install




starcluster-3-AMI HANGS:


ssh -v -i /root/base/apps/ec2/keypair/agua.pem \
> root@ec2-174-129-175-155.compute-1.amazonaws.com
OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: Applying options for *
debug1: Connecting to ec2-174-129-175-155.compute-1.amazonaws.com [174.129.175.155] port 22.
debug1: Connection established.
debug1: permanently_set_uid: 0/0
debug1: identity file /root/base/apps/ec2/keypair/agua.pem type -1
debug1: loaded 1 keys
debug1: Remote protocol version 2.0, remote software version OpenSSH_4.3
debug1: match: OpenSSH_4.3 pat OpenSSH*
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_4.3
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: server->client aes128-cbc hmac-md5 none
debug1: kex: client->server aes128-cbc hmac-md5 none
debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
The authenticity of host 'ec2-174-129-175-155.compute-1.amazonaws.com (174.129.175.155)' can't be established.
RSA key fingerprint is a9:25:21:6c:74:00:91:1f:2d:3d:0e:34:94:52:ff:d1.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'ec2-174-129-175-155.compute-1.amazonaws.com,174.129.175.155' (RSA) to the list of known hosts.
debug1: ssh_rsa_verify: signature correct
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: SSH2_MSG_SERVICE_REQUEST sent
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey,gssapi-with-mic
debug1: Next authentication method: gssapi-with-mic
debug1: Unspecified GSS failure.  Minor code may provide more information
Unknown code krb5 195

debug1: Unspecified GSS failure.  Minor code may provide more information
Unknown code krb5 195

debug1: Unspecified GSS failure.  Minor code may provide more information
Unknown code krb5 195

debug1: Next authentication method: publickey
debug1: Trying private key: /root/base/apps/ec2/keypair/agua.pem
debug1: read PEM private key done: type RSA
debug1: Authentication succeeded (publickey).
debug1: channel 0: new [client-session]
debug1: Entering interactive session.
debug1: Sending environment.
debug1: Sending env LANG = en_US.UTF-8
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1

 
MORE VERBOSE OUTPUT:

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
> root@ec2-174-129-175-155.compute-1.amazonaws.com
OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: Applying options for *
debug2: ssh_connect: needpriv 0
debug1: Connecting to ec2-174-129-175-155.compute-1.amazonaws.com [174.129.175.155] port 22.
debug1: Connection established.
debug1: permanently_set_uid: 0/0
debug2: key_type_from_name: unknown key type '-----BEGIN'
debug2: key_type_from_name: unknown key type '-----END'
debug1: identity file /root/base/apps/ec2/keypair/agua.pem type -1
debug1: loaded 1 keys
debug1: Remote protocol version 2.0, remote software version OpenSSH_4.3
debug1: match: OpenSSH_4.3 pat OpenSSH*
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_4.3
debug2: fd 3 setting O_NONBLOCK
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug2: kex_parse_kexinit: diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1
debug2: kex_parse_kexinit: ssh-rsa,ssh-dss
debug2: kex_parse_kexinit: aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,arcfour128,arcfour256,arcfour,aes192-cbc,aes256-cbc,rijndael-cbc@lysator.liu.se,aes128-ctr,aes192-ctr,aes256-ctr
debug2: kex_parse_kexinit: aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,arcfour128,arcfour256,arcfour,aes192-cbc,aes256-cbc,rijndael-cbc@lysator.liu.se,aes128-ctr,aes192-ctr,aes256-ctr
debug2: kex_parse_kexinit: hmac-md5,hmac-sha1,hmac-ripemd160,hmac-ripemd160@openssh.com,hmac-sha1-96,hmac-md5-96
debug2: kex_parse_kexinit: hmac-md5,hmac-sha1,hmac-ripemd160,hmac-ripemd160@openssh.com,hmac-sha1-96,hmac-md5-96
debug2: kex_parse_kexinit: none,zlib@openssh.com,zlib
debug2: kex_parse_kexinit: none,zlib@openssh.com,zlib
debug2: kex_parse_kexinit: 
debug2: kex_parse_kexinit: 
debug2: kex_parse_kexinit: first_kex_follows 0 
debug2: kex_parse_kexinit: reserved 0 
debug2: kex_parse_kexinit: diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1,diffie-hellman-group1-sha1
debug2: kex_parse_kexinit: ssh-rsa,ssh-dss
debug2: kex_parse_kexinit: aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,arcfour128,arcfour256,arcfour,aes192-cbc,aes256-cbc,rijndael-cbc@lysator.liu.se,aes128-ctr,aes192-ctr,aes256-ctr
debug2: kex_parse_kexinit: aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,arcfour128,arcfour256,arcfour,aes192-cbc,aes256-cbc,rijndael-cbc@lysator.liu.se,aes128-ctr,aes192-ctr,aes256-ctr
debug2: kex_parse_kexinit: hmac-md5,hmac-sha1,hmac-ripemd160,hmac-ripemd160@openssh.com,hmac-sha1-96,hmac-md5-96
debug2: kex_parse_kexinit: hmac-md5,hmac-sha1,hmac-ripemd160,hmac-ripemd160@openssh.com,hmac-sha1-96,hmac-md5-96
debug2: kex_parse_kexinit: none,zlib@openssh.com
debug2: kex_parse_kexinit: none,zlib@openssh.com
debug2: kex_parse_kexinit: 
debug2: kex_parse_kexinit: 
debug2: kex_parse_kexinit: first_kex_follows 0 
debug2: kex_parse_kexinit: reserved 0 
debug2: mac_init: found hmac-md5
debug1: kex: server->client aes128-cbc hmac-md5 none
debug2: mac_init: found hmac-md5
debug1: kex: client->server aes128-cbc hmac-md5 none
debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
debug2: dh_gen_key: priv key bits set: 139/256
debug2: bits set: 538/1024
debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
debug1: Host 'ec2-174-129-175-155.compute-1.amazonaws.com' is known and matches the RSA host key.
debug1: Found key in /root/.ssh/known_hosts:23
debug2: bits set: 519/1024
debug1: ssh_rsa_verify: signature correct
debug2: kex_derive_keys
debug2: set_newkeys: mode 1
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug2: set_newkeys: mode 0
debug1: SSH2_MSG_NEWKEYS received
debug1: SSH2_MSG_SERVICE_REQUEST sent
debug2: service_accept: ssh-userauth
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug2: key: /root/base/apps/ec2/keypair/agua.pem ((nil))
debug1: Authentications that can continue: publickey,gssapi-with-mic
debug1: Next authentication method: gssapi-with-mic
debug1: Unspecified GSS failure.  Minor code may provide more information
Unknown code krb5 195

debug1: Unspecified GSS failure.  Minor code may provide more information
Unknown code krb5 195

debug1: Unspecified GSS failure.  Minor code may provide more information
Unknown code krb5 195

debug2: we did not send a packet, disable method
debug1: Next authentication method: publickey
debug1: Trying private key: /root/base/apps/ec2/keypair/agua.pem
debug1: read PEM private key done: type RSA
debug2: we sent a publickey packet, wait for reply
debug1: Authentication succeeded (publickey).
debug1: channel 0: new [client-session]
debug2: channel 0: send open
debug1: Entering interactive session.
debug2: callback start
debug2: client_session2_setup: id 0
debug2: channel 0: request pty-req confirm 0
debug1: Sending environment.
debug1: Sending env LANG = en_US.UTF-8
debug2: channel 0: request env confirm 0
debug2: channel 0: request shell confirm 0
debug2: fd 3 setting TCP_NODELAY
debug2: callback done
debug2: channel 0: open confirm rwindow 0 rmax 32768
debug2: channel 0: rcvd adjust 2097152
debug2: client_check_window_change: changed
debug2: channel 0: request window-change confirm 0
debug2: client_check_window_change: changed
debug2: channel 0: request window-change confirm 0
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug2: client_check_window_change: changed
debug2: channel 0: request window-change confirm 0
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1
debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1

 

SCP ON starcluster-3-AMI (HANGING WITH SSH)

SENDING A FILE WORKS:

scp -v -i /root/base/apps/ec2/keypair/agua.pem \
mysql.txt root@ec2-174-129-175-155.compute-1.amazonaws.com:

    Executing: program /usr/bin/ssh host ec2-174-129-175-155.compute-1.amazonaws.com, user root, command scp -v -t .
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-174-129-175-155.compute-1.amazonaws.com [174.129.175.155] port 22.
    debug1: Connection established.
    debug1: permanently_set_uid: 0/0
    debug1: identity file /root/base/apps/ec2/keypair/agua.pem type -1
    debug1: loaded 1 keys
    debug1: Remote protocol version 2.0, remote software version OpenSSH_4.3
    debug1: match: OpenSSH_4.3 pat OpenSSH*
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_4.3
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: server->client aes128-cbc hmac-md5 none
    debug1: kex: client->server aes128-cbc hmac-md5 none
    debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
    debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
    debug1: Host 'ec2-174-129-175-155.compute-1.amazonaws.com' is known and matches the RSA host key.
    debug1: Found key in /root/.ssh/known_hosts:23
    debug1: ssh_rsa_verify: signature correct
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: SSH2_MSG_SERVICE_REQUEST sent
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey,gssapi-with-mic
    debug1: Next authentication method: gssapi-with-mic
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Next authentication method: publickey
    debug1: Trying private key: /root/base/apps/ec2/keypair/agua.pem
    debug1: read PEM private key done: type RSA
    debug1: Authentication succeeded (publickey).
    debug1: channel 0: new [client-session]
    debug1: Entering interactive session.
    debug1: Sending environment.
    debug1: Sending env LANG = en_US.UTF-8
    debug1: Sending command: scp -v -t .
    Sending file modes: C0644 95075 mysql.txt
    Sink: C0644 95075 mysql.txt
    mysql.txt                                                           100%   93KB  92.9KB/s   00:00    
    debug1: client_input_channel_req: channel 0 rtype exit-status reply 0
    debug1: channel 0: free: client-session, nchannels 1
    debug1: fd 0 clearing O_NONBLOCK
    debug1: fd 1 clearing O_NONBLOCK
    debug1: Transferred: stdin 0, stdout 0, stderr 0 bytes in 0.6 seconds
    debug1: Bytes per second: stdin 0.0, stdout 0.0, stderr 0.0
    debug1: Exit status 0


PULLING A FILE WORKS TOO:

scp -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com:mysql.txt ./



LOGIN WITH PUTTY SHOWS 'Server refused to allocate pty':

login as: root
Authenticating with public key "imported-openssh-key"
Server refused to allocate pty



SOLUTION:

http://developer.amazonwebservices.com/connect/thread.jspa?threadID=20682&start=15&tstart=0
Re: Server refused to allocate pty 
Posted: Mar 28, 2008 7:45 AM PDT     in response to: kieranbaws		
 		Reply

Hi Kieran 

The most likely cause is probably that the /etc/fstab file in the newly bundle AMI is not correct. 

I believe that the bundling tools override the instance /etc/fstab which their own copy which does not work correctly with FC8, to fix this use the '--fstab /etc/fstab' bundlevol flag whilst bundling from the original AMI. 

The fstab for FC8 should look as follows : 

/dev/sda1 / ext3 defaults 1 1 
/dev/sda2 /mnt ext3 defaults 0 0 
/dev/sda3 swap swap defaults 0 0 
none /dev/pts devpts gid=5,mode=620 0 0 
none /dev/shm tmpfs defaults 0 0 
none /proc proc defaults 0 0 
none /sys sysfs defaults 0 0 

We'll be sure to fix this in the next release of the bundling tools, please let us know if you have any other issues. 

Regards 
Marcin 




agentnate	
Posts: 1 
Registered: 11/6/09
Re: Server refused to allocate pty 
Posted: Nov 6, 2009 2:30 PM PST     in response to: Rajesh Viswanat...		
 		Reply

Hey Rajesh, 

Since your post was almost two years ago, you have probably moved on, but I wanted to share a tip with the others who get to this forum with your problem. I also encountered the same thing with one of my bundles and really, really didn't want to rebundle.  

I found that you CAN SALVAGE the bundle by using pscp (putty's secure copy) or WinSCP to grab the fstab file from the /etc directory (of the running instance), modify it, and re-upload it.  Then, after you reboot the instance, you can ssh in as normal.  pscp / WinSCP uses the same keypair (*.ppk) as putty does, assuming you're using putty as your ssh client.  The difference being, of course, that pscp / WinSCP does not need pty, so the flawed fstab file doesn't stop you. 

Hope that helps all of the lost souls out there who don't want to rebundle their image. 

Nate




DOWNLOADED /etc/fstab:


scp -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com:/etc/fstab ./

EDITED fstab, CHANGED FROM THIS:

proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0
/dev/sda2                                       /mnt            ext3    defaults        0       0


TO LOOK LIKE THIS:

proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0
/dev/sda2                                       /data            ext3    noauto        0       0

AND UPLOADED:

scp -v -i /root/base/apps/ec2/keypair/agua.pem \
fstab root@ec2-174-129-175-155.compute-1.amazonaws.com:/etc

CONFIRM UPLOADED:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/fstab'

    proc                                            /proc           proc    defaults        0       0
    /dev/sda3                                       None            swap    defaults        0       0
    /dev/sdb                                       /               ext3    defaults        0       0
    /dev/sda2                                       /data            ext3    noauto        0       0


RECONNECTED:

ssh -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com

GOT 'Unspecified GSS failure' ERROR:

    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
FULL OUTPUT:

    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-174-129-175-155.compute-1.amazonaws.com [174.129.175.155] port 22.
    debug1: Connection established.
    debug1: permanently_set_uid: 0/0
    debug1: identity file /root/base/apps/ec2/keypair/agua.pem type -1
    debug1: loaded 1 keys
    debug1: Remote protocol version 2.0, remote software version OpenSSH_4.3
    debug1: match: OpenSSH_4.3 pat OpenSSH*
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_4.3
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: server->client aes128-cbc hmac-md5 none
    debug1: kex: client->server aes128-cbc hmac-md5 none
    debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
    debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
    debug1: Host 'ec2-174-129-175-155.compute-1.amazonaws.com' is known and matches the RSA host key.
    debug1: Found key in /root/.ssh/known_hosts:23
    debug1: ssh_rsa_verify: signature correct
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: SSH2_MSG_SERVICE_REQUEST sent
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey,gssapi-with-mic
    debug1: Next authentication method: gssapi-with-mic
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Next authentication method: publickey
    debug1: Trying private key: /root/base/apps/ec2/keypair/agua.pem
    debug1: read PEM private key done: type RSA
    debug1: Authentication succeeded (publickey).
    debug1: channel 0: new [client-session]
    debug1: Entering interactive session.
    debug1: Sending environment.
    debug1: Sending env LANG = en_US.UTF-8
    debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1



ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'ls -al /etc/ssh'

    -rw-------  1 root root 132839 Mar 31  2010 moduli
    -rw-r--r--  1 root root   1827 Mar 31  2010 ssh_config
    -rw-------  1 root root   3367 Dec  8  2009 sshd_config
    -rw-------  1 root root    672 Aug 11 10:38 ssh_host_dsa_key
    -rw-r--r--  1 root root    590 Aug 11 10:38 ssh_host_dsa_key.pub
    -rw-------  1 root root    963 Aug 11 10:38 ssh_host_key
    -rw-r--r--  1 root root    627 Aug 11 10:38 ssh_host_key.pub
    -rw-------  1 root root   1675 Aug 11 10:38 ssh_host_rsa_key
    -rw-r--r--  1 root root    382 Aug 11 10:38 ssh_host_rsa_key.pub


ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'who'
    < EMPTY>
    

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'head -n 100 /etc/ssh/ssh_host_dsa_key'


==> /etc/ssh/ssh_host_dsa_key <==
-----BEGIN DSA PRIVATE KEY-----
MIIBvAIBAAKBgQDyag62Re9SwC27nP3yq2HB3JxMBggr7xm4aCsb+limRys7OTll
fMXUlvKl9ym1f6U0pTAhShuAdbcCTSdshBD9eORP6nwpcXF3AriZLhKr/KJbD56d
Gq8UPY0s6Gad+twu07DZb6B0YSgA6XevMV81sM+CWqTAPUKjuXJGEGeVawIVAKL8
qAa38UMYb+vmDDjC/xhQLOHPAoGBANTDSqr7cfkGhsBEaFqjpnuyJ3FrG6oDltAj
7G8XaikOXdV9NwFRab5KLjJtDFnGRYlkUhiqSgm3sjW7xY9h2hMeFpQWKgOWgKxm
ycN5kn2M5eGwTBHyABI9O45xkQAmHkiB0JIfJA55eoEEiay2AIMHcDzO7ECGvvXk
UceK1m7IAoGBAOBNrVM+EJpJhUrtByxeJ5J+b6EY1TPhYy7S2Eoym8yLXumB6S6q
FHxrjupF7qGBHERjZ8rYEdR3G3NXNdPzKlUYMt4y88wY448KscO2Bxhgq6BheYL9
pE3ixal0U5zBJ3a7DO1HR2OsoH2uoXExR1mixzIImQBaz9aYIE772UtuAhQ6JDmR
8K02DxLSL+rFW0ZepQREFQ==
-----END DSA PRIVATE KEY-----



ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'head -n 100 /etc/ssh/ssh_host_rsa_key'


-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA2UwYe4N4Vs31VB61XzHgcdEHQRLyZifsR+vQCooTSa6Lyf3W
NZm7ADfJxByl/uwAVAByhiEMXLy/18lL8XkvUTLFE7vwHuWniFe0hx2AUEwVigQ/
guqBvntPia08Dkm6H9wWiL4+qIYu8TIT2UGGzNYXDLLF/cguQxse126hIbSOyTrd
EFUnCYcu96NEwI0lm0G/MEHDbXEBWAHOF6k0bKhzALyyI1wPfHRC+dLks00AbhZ7
1AqzRTtUuy32k1lSrrQbU3sgI/u/DHn09RGdzD2ol47dWQH7zJP8UUYpaL1BiLyu
8ULXFWIjL/zI9rKS/MttACMb4S5EM+d+eFbcRQIBIwKCAQEAoWu6amGp2hVXKIvX
MMX3L/pdKQbCskmK85k7dYskRV0XYtnSU7QHQf2Oka7htg5mpM0h3/tLAw/e+BHg
pMBsSvKDxYRL+bHqKsTPP8zFt/4BXzZbEMt2UvyEOmNucQORlAKUZZSjkyHZunz4
zUaepsrsjRcWvIYTvNJRbNXWyJNjaCMrtQISNi7Jsyw1wLK0F05xBbPNs3XnieLQ
4wnX8UgpFrmYRsLz+RuNZKfL2c0zr2s0z1xSzctulVqrMoPYmUwHcJAj83MrLB1L
mwkhINTOzppnWpwQJIrK48nd7TwNQLuVsYk27Lt/Fh0J9I2+QcyChGfEhiCAIgZW
yT71cwKBgQDuW9HO9fj0iABHtGqOaxNkSve0jRqbLO+kvpIiJZD47SZe0eNJXkwd
lbxllclwqD+LsrBm3eyzT1DGkcAenD8r8Abvmg+jbe3OcXqNvMkngtM6rxeMIGOM
3UpFNlDJH9CuP8Sa3TQ9AceE0CRU3q8+PDLPrMUIGlpiERO89TvSawKBgQDpYTm1
umNBX/kmg0IfNIkxWEzBQtx/p4oHX9II59nAMNwEQX0byESVyJyfDcUctKCbdqSI
8quQfmxlm3PKH2iqjdqEK70k7lVd35zj55TJsOl+5gntebin+Sxq6FHwnUMe+6zK
kV+8cnbVwhPTAAlyLPGe3DTZ/pRwufKbdDKYDwKBgQDZ7Yyf9tT81B2DYx+YJ2Iv
z4NjPy5Eu17Cglm40eOhwuFAv+W/bChVkDc4Tm8H6ki6PPkNl7PXI/IUooPENxUv
fF4c5KCVa9Ib1XddBGAkH9cRFRzX4xkwVUs39yVKK7d6vfWU54A3xxzRM1Rq2jnS
gC50uzfM5OTr8lsway9hSwKBgQDVYDTDaJVDFesb5bjMEsaTg+5njZZmFYWDFcdY
mXahFrqHjFUgtxoii4fh4LQ3gJLXR+bjnAqSvLrgjiC4zEJwDKqHeHJq6IiQV2re
/536O1kjkH4a8vH4qU0ui0OaKWHwcRMCWQcSscu8HygRXx6URllAyVTkkPy+1eUg
ajziywKBgDeMQPXXVYNjffoiGx1/vo4OuV4VzYMvnh32IRVt8Wew/6LNsOqHxnIx
sq4zrrGPFH5tJSDqiXCuZWm5kqn2hGEod58AyPnCxHIlYmFw8+0YV8N/o2WEgiM3
A5MK/axG2MiSQiqeoSDRSGVFf1x2Qw1pG0rRr9nd63M1BLWRz08P
-----END RSA PRIVATE KEY-----


CHECK AUTHORIZED KEYS ON starcluster-3-AMI:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /root/.ssh/authorized_keys'


    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCPnQNSJ8BlNLcb9I/XZW3L1D7iWNzfWs6RJp+H2nMGY3f05ERG1VyuIlADto/8xMypyItInBOGu2Pg1GeOpKYXMVdGtXJ00st5IHPt1gubMMlKki4KCZRqhJu7+mc7ijUa84IX45oEHn7KEf8M6X52npL3sgJw+GSWcKEJ1YQ1AJuykj7SaAAgMoFXvGi9p611ZI1n0PsoupmWAVii9KLd8ZaZEWxiq/NCx/MglBJcYSFzabgi0bmvRdAiY5qYitrMRYLwr1aCk4aZ5ow8wkFvPVqE+I8cpgdyk+fjo/eEnl52aVOaHG7NzUnub3mqXhIy2QozZqxV5k8DzMuqYRL agua
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCPnQNSJ8BlNLcb9I/XZW3L1D7iWNzfWs6RJp+H2nMGY3f05ERG1VyuIlADto/8xMypyItInBOGu2Pg1GeOpKYXMVdGtXJ00st5IHPt1gubMMlKki4KCZRqhJu7+mc7ijUa84IX45oEHn7KEf8M6X52npL3sgJw+GSWcKEJ1YQ1AJuykj7SaAAgMoFXvGi9p611ZI1n0PsoupmWAVii9KLd8ZaZEWxiq/NCx/MglBJcYSFzabgi0bmvRdAiY5qYitrMRYLwr1aCk4aZ5ow8wkFvPVqE+I8cpgdyk+fjo/eEnl52aVOaHG7NzUnub3mqXhIy2QozZqxV5k8DzMuqYRL agua
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCPnQNSJ8BlNLcb9I/XZW3L1D7iWNzfWs6RJp+H2nMGY3f05ERG1VyuIlADto/8xMypyItInBOGu2Pg1GeOpKYXMVdGtXJ00st5IHPt1gubMMlKki4KCZRqhJu7+mc7ijUa84IX45oEHn7KEf8M6X52npL3sgJw+GSWcKEJ1YQ1AJuykj7SaAAgMoFXvGi9p611ZI1n0PsoupmWAVii9KLd8ZaZEWxiq/NCx/MglBJcYSFzabgi0bmvRdAiY5qYitrMRYLwr1aCk4aZ5ow8wkFvPVqE+I8cpgdyk+fjo/eEnl52aVOaHG7NzUnub3mqXhIy2QozZqxV5k8DzMuqYRL agua
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCPnQNSJ8BlNLcb9I/XZW3L1D7iWNzfWs6RJp+H2nMGY3f05ERG1VyuIlADto/8xMypyItInBOGu2Pg1GeOpKYXMVdGtXJ00st5IHPt1gubMMlKki4KCZRqhJu7+mc7ijUa84IX45oEHn7KEf8M6X52npL3sgJw+GSWcKEJ1YQ1AJuykj7SaAAgMoFXvGi9p611ZI1n0PsoupmWAVii9KLd8ZaZEWxiq/NCx/MglBJcYSFzabgi0bmvRdAiY5qYitrMRYLwr1aCk4aZ5ow8wkFvPVqE+I8cpgdyk+fjo/eEnl52aVOaHG7NzUnub3mqXhIy2QozZqxV5k8DzMuqYRL agua
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCPnQNSJ8BlNLcb9I/XZW3L1D7iWNzfWs6RJp+H2nMGY3f05ERG1VyuIlADto/8xMypyItInBOGu2Pg1GeOpKYXMVdGtXJ00st5IHPt1gubMMlKki4KCZRqhJu7+mc7ijUa84IX45oEHn7KEf8M6X52npL3sgJw+GSWcKEJ1YQ1AJuykj7SaAAgMoFXvGi9p611ZI1n0PsoupmWAVii9KLd8ZaZEWxiq/NCx/MglBJcYSFzabgi0bmvRdAiY5qYitrMRYLwr1aCk4aZ5ow8wkFvPVqE+I8cpgdyk+fjo/eEnl52aVOaHG7NzUnub3mqXhIy2QozZqxV5k8DzMuqYRL agua




COMPARE WITH PUBLIC KEY ON LINODE:

cat /root/base/apps/ec2/keypair/agua.pem

-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAgj50DUifAZTS3G/SP12Vty9Q+4ljc31rOkSafh9pzBmN39ORERtVcriJQA7a
P/MTMqciLSJwThrtj4NRnjqSmFzFXRrVydNLLeSBz7dYLmzDJSpIuCgmUaoSbu/pnO4o1GvOCF+O
aBB5+yhH/DOl+dp6S97ICcPhklnChCdWENQCbspI+0mgAIDKBV7xovaetdWSNZ9D7KLqZlgFYovS
i3fGWmRFsYqvzQsfzIJQSXGEhc2m4ItG5r0XQImOamIrazEWC8K9WgpOGmeaMPMJBbz1ahPiPHKY
HcpPn46P3hJ5edmlTmhxuzc1J7m95ql4SMtkKM2asVeZPA8zLqmESwIDAQABAoIBAH2W8VsZytHA
iy+q2AboHAT/KEzU50QnDS2rl3nEmsUHYyoQnVLsk5HC5f4SFFwT7VArn6X8DmUSTD7Vtu8ntdIb
quijhsFN8LF5Jb+BIRPrJqWAx4xkksaug4Xb6926PT7QEWU7l1s7gBQyfG9x8jsidEkSsrvP2YTA
7vN15uTj2o2Uq47BxasR37MYC3xHyr77gV/4NGDh9lLRSJmPz9jfPfnngP1T13HAYjUTQwOBXUAW
p7Mqmfmr+XYcXLZD9dHT1BXsRZW14Tx7PqSLerfqSxCEp4c3/IBZz5atloZBCkqhnZ+E4tss8HCA
7K+7v+C3Rou6NA5motKU2v1j45ECgYEAuzMONxkQwIHr/0JPvBjUGtKYFjU8ueBTWZvkVCBSMb2J
6JctNY0F2fWY0nDbqsBr8huDvERr41Viv9EJv67dytVgSTP3oBIpHkTDswykwg/o2YS+LQhzyphF
gfVMK7KHqiItERIAGlK3Lw44F7EsFqnxCdN+pdSFisF8eUHmLcMCgYEAshynouPPDWNq2XJgqtuh
euU8fISiUOi2tMGOwEe+sTQ2GXPoWnyGyvhxNFyc+gTRPyuZwe5PqeABpC4184df4s3RQyf12Ig5
HO5rALEpNbvocNdOtzeJrsswmbrY51UecdkJo/xLjcitvIERTassGLKKOl39miGEkasFEfmyvtkC
gYEAt4yI/Kc8ELWTM3bOfY0Os7oX23aZs1tr/mnnSEFktla1GPTaJC7BNQQlsvlruZHwhbRKx9eC
vaWkLJYHbAZGfDIZtc0ZmL8VyBL+m9ni1lEJK/aHDdrCxjvls1ZUOGhVsxDNhXZT2XuPF7lmcHyM
0TASImNYQ7sMsY+jv7VIv0cCgYARRtBH75sE7HDP2NVhnV5DgnrkhSUNfhVC4UeMhSkNHUhmHaUb
KdsVUxYAAz/CzLbTTtJiSlB15OGj4EuhbK8zW82Bmx2wvD31/XZpocWijbCVSX08Lmnvh4wWTVZ+
0fXbCzdxLabSgPXBRC++fe0QFDluQfG4gqnOS215eeQJuQKBgCzC8+zfQcSL5t4UB76DpCYwgoBn
2uZfhkN33P/YUfOa3iHedei1pVoCgeD5jg9TpUqHXKb6dVgVglCO4IiyV1YTAkco1abESl6TxZB1
Iwmdi9XFuss1e045AMbdCmjkxEGfFMFb/LSUu2kdVJOtbs1DRFkpM0RJaNw/GoxA1SRl
-----END RSA PRIVATE KEY-----



CHECK KNOWN HOSTS ON starcluster-3-AMI:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat ~/.ssh/known_hosts'

173.230.142.248 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAyAY8Z9/CZBpc8tiT0dDkvLSK38FOJq5/2oLkKu4/WR3xyHUOSykDmxFMLRFklkTEJo1VRvIhRPzoKCgScghQ0f2kLSwzh3YmUJrQnQzPOWwVxUWmJA/5NbOGkTA486Ql4H8AkXprN7pdBM4XYI47iY+lb+GmZP5CI9VTqjzfxHR99mygtH9Xc7UO7unowDyyKGXongHS8uczsBYieLmVQ6zJg6mXbrDmlXKeVzcKLda9BIeSN3wE/NLjzjRZQFV2B1SKugNZh15w8Jo9oDAUPlO+9vgbt02H5W1iiQGX6ttcV0e908XbempC1fSWCKAGwbb4uW8vfoyv/C+Yga+oZw==


CHECK SSHD AND SSH CONFIGS:


ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/ssh/sshd_config'


    #       $OpenBSD: sshd_config,v 1.73 2005/12/06 22:38:28 reyk Exp $
    
    # This is the sshd server system-wide configuration file.  See
    # sshd_config(5) for more information.
    
    # This sshd was compiled with PATH=/usr/local/bin:/bin:/usr/bin
    
    # The strategy used for options in the default sshd_config shipped with
    # OpenSSH is to specify options with their default value where
    # possible, but leave them commented.  Uncommented options change a
    # default value.
    
    #Port 22
    #Protocol 2,1
    Protocol 2
    #AddressFamily any
    #ListenAddress 0.0.0.0
    #ListenAddress ::
    
    # HostKey for protocol version 1
    #HostKey /etc/ssh/ssh_host_key
    # HostKeys for protocol version 2
    #HostKey /etc/ssh/ssh_host_rsa_key
    #HostKey /etc/ssh/ssh_host_dsa_key
    
    # Lifetime and size of ephemeral version 1 server key
    #KeyRegenerationInterval 1h
    #ServerKeyBits 768
    
    # Logging
    # obsoletes QuietMode and FascistLogging
    #SyslogFacility AUTH
    SyslogFacility AUTHPRIV
    #LogLevel INFO
    
    # Authentication:
    
    #LoginGraceTime 2m
    #PermitRootLogin yes
    #StrictModes yes
    #MaxAuthTries 6
    
    #RSAAuthentication yes
    #PubkeyAuthentication yes
    #AuthorizedKeysFile     .ssh/authorized_keys
    
    # For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
    #RhostsRSAAuthentication no
    # similar for protocol version 2
    #HostbasedAuthentication no
    # Change to yes if you don't trust ~/.ssh/known_hosts for
    # RhostsRSAAuthentication and HostbasedAuthentication
    #IgnoreUserKnownHosts no
    # Don't read the user's ~/.rhosts and ~/.shosts files
    #IgnoreRhosts yes
    
    # To disable tunneled clear text passwords, change to no here!
    #PasswordAuthentication no
    #PermitEmptyPasswords no
    PasswordAuthentication no
    
    # Change to no to disable s/key passwords
    #ChallengeResponseAuthentication yes
    ChallengeResponseAuthentication no
    
    # Kerberos options
    #KerberosAuthentication no
    #KerberosOrLocalPasswd yes
    #KerberosTicketCleanup yes
    #KerberosGetAFSToken no
    
    # GSSAPI options
    #GSSAPIAuthentication no
    GSSAPIAuthentication yes
    #GSSAPICleanupCredentials yes
    GSSAPICleanupCredentials yes
    
    # Set this to 'yes' to enable PAM authentication, account processing, 
    # and session processing. If this is enabled, PAM authentication will 
    # be allowed through the ChallengeResponseAuthentication mechanism. 
    # Depending on your PAM configuration, this may bypass the setting of 
    # PasswordAuthentication, PermitEmptyPasswords, and 
    # "PermitRootLogin without-password". If you just want the PAM account and 
    # session checks to run without PAM authentication, then enable this but set 
    # ChallengeResponseAuthentication=no
    #UsePAM no
    UsePAM yes
    
    # Accept locale-related environment variables
    AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES 
    AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT 
    AcceptEnv LC_IDENTIFICATION LC_ALL
    #AllowTcpForwarding yes
    #GatewayPorts no
    #X11Forwarding no
    X11Forwarding yes
    #X11DisplayOffset 10
    #X11UseLocalhost yes
    #PrintMotd yes
    #PrintLastLog yes
    #TCPKeepAlive yes
    #UseLogin no
    #UsePrivilegeSeparation yes
    #PermitUserEnvironment no
    #Compression delayed
    ClientAliveInterval 60
    ClientAliveCountMax 240
    #ShowPatchLevel no
    #UseDNS yes
    #PidFile /var/run/sshd.pid
    #MaxStartups 10
    #PermitTunnel no
    #ChrootDirectory none
    
    # no default banner path
    #Banner /some/path
    
    # override default of no subsystems
    Subsystem       sftp    /usr/libexec/openssh/sftp-server
    UseDNS  no
    PermitRootLogin without-password



ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/ssh/ssh_config'

    
    #       $OpenBSD: ssh_config,v 1.21 2005/12/06 22:38:27 reyk Exp $
    
    # This is the ssh client system-wide configuration file.  See
    # ssh_config(5) for more information.  This file provides defaults for
    # users, and the values can be changed in per-user configuration files
    # or on the command line.
    
    # Configuration data is parsed as follows:
    #  1. command line options
    #  2. user-specific file
    #  3. system-wide file
    # Any configuration value is only changed the first time it is set.
    # Thus, host-specific definitions should be at the beginning of the
    # configuration file, and defaults at the end.
    
    # Site-wide defaults for some commonly used options.  For a comprehensive
    # list of available options, their meanings and defaults, please see the
    # ssh_config(5) man page.
    
    # Host *
    #   ForwardAgent no
    #   ForwardX11 no
    #   RhostsRSAAuthentication no
    #   RSAAuthentication yes
    #   PasswordAuthentication yes
    #   HostbasedAuthentication no
    #   BatchMode no
    #   CheckHostIP yes
    #   AddressFamily any
    #   ConnectTimeout 0
    #   StrictHostKeyChecking ask
    #   IdentityFile ~/.ssh/identity
    #   IdentityFile ~/.ssh/id_rsa
    #   IdentityFile ~/.ssh/id_dsa
    #   Port 22
    #   Protocol 2,1
    #   Cipher 3des
    #   Ciphers aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,arcfour,aes192-cbc,aes256-cbc
    #   EscapeChar ~
    #   Tunnel no
    #   TunnelDevice any:any
    #   PermitLocalCommand no
    Host *
            GSSAPIAuthentication yes
    # If this option is set to yes then remote X11 clients will have full access
    # to the original X11 display. As virtually no X11 client supports the untrusted
    # mode correctly we set this to yes.
            ForwardX11Trusted yes
    # Send locale-related environment variables
            SendEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES 
            SendEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT 
            SendEnv LC_IDENTIFICATION LC_ALL




UPDATED SSHD:


ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'mkdir /root/ssh-temp; cp -r /etc/ssh/ssh_config /root/ssh-temp; cp -r /etc/ssh/sshd_config /root/ssh-temp'

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'ls -alR /root/ssh-temp'


4. Update openssh-server

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'yum update openssh-server'
    
    OK
 

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'chmod 600 /etc/ssh/sshd_config'

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'ls -al /etc/ssh/ssh*config'

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'diff /etc/ssh/sshd_config /root/ssh-temp/sshd_config;'

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'diff /etc/ssh/ssh_config /root/ssh-temp/ssh_config'


6. Move back your old configs:
Code:

mv sshd_config /etc/ssh/
mv ssh_config /etc/ssh/

7. Restart sshd

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'/etc/init.d/sshd restart'
    
    Stopping sshd: [  OK  ]
    Starting sshd: [  OK  ]
    
    
8. CONNECT

ssh -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com
    
    HANGS
    
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-174-129-175-155.compute-1.amazonaws.com [174.129.175.155] port 22.
    debug1: Connection established.
    debug1: permanently_set_uid: 0/0
    debug1: identity file /root/base/apps/ec2/keypair/agua.pem type -1
    debug1: loaded 1 keys
    debug1: Remote protocol version 2.0, remote software version OpenSSH_4.3
    debug1: match: OpenSSH_4.3 pat OpenSSH*
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_4.3
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: server->client aes128-cbc hmac-md5 none
    debug1: kex: client->server aes128-cbc hmac-md5 none
    debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
    debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
    debug1: Host 'ec2-174-129-175-155.compute-1.amazonaws.com' is known and matches the RSA host key.
    debug1: Found key in /root/.ssh/known_hosts:23
    debug1: ssh_rsa_verify: signature correct
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: SSH2_MSG_SERVICE_REQUEST sent
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey,gssapi-with-mic
    debug1: Next authentication method: gssapi-with-mic
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Next authentication method: publickey
    debug1: Trying private key: /root/base/apps/ec2/keypair/agua.pem
    debug1: read PEM private key done: type RSA
    debug1: Authentication succeeded (publickey).
    debug1: channel 0: new [client-session]
    debug1: Entering interactive session.
    debug1: Sending environment.
    debug1: Sending env LANG = en_US.UTF-8
    debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1


ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'reboot'

CHANGE /etc/fstab FROM THIS:

proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0
/dev/sda2                                       /data            ext3    noauto        0       0

TO THIS:

proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0


CREATED FOLDER IN PIPELINE

cd /root/base/pipeline/ec2

scp -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com:/etc/fstab ./

EDITED fstab, CHANGED FROM THIS:

proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0
/dev/sda2                                       /mnt            ext3    defaults        0       0


TO LOOK LIKE THIS:

proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0

AND UPLOADED:

scp -v -i /root/base/apps/ec2/keypair/agua.pem \
fstab root@ec2-174-129-175-155.compute-1.amazonaws.com:/etc

CONFIRM UPLOADED:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/fstab'

AND REBOOTED:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/fstab'


CONNECT:

ssh -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com


CHECK SSH VERSION:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'ssh -V'

    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008



RECHECKED ERROR OUTPUT AND NOTICED THAT gssapi-with-mic CAME JUST BEFORE GSS FAILURE

    debug1: Authentications that can continue: publickey,gssapi-with-mic
    debug1: Next authentication method: gssapi-with-mic
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195


SO DISABLED GSSAPI IN sshd_config


CREATED NEW sshd_config IN ec2 PIPELINE DIRECTORY 

cd /root/base/pipeline/ec2
emacs sshd_config
#       $OpenBSD: sshd_config,v 1.73 2005/12/06 22:38:28 reyk Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/bin:/bin:/usr/bin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options change a
# default value.

#Port 22
#Protocol 2,1
Protocol 2
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

# HostKey for protocol version 1
#HostKey /etc/ssh/ssh_host_key
# HostKeys for protocol version 2
#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_dsa_key

# Lifetime and size of ephemeral version 1 server key
#KeyRegenerationInterval 1h
#ServerKeyBits 768

# Logging
# obsoletes QuietMode and FascistLogging
#SyslogFacility AUTH
SyslogFacility AUTHPRIV
#LogLevel INFO

# Authentication:

#LoginGraceTime 2m
#PermitRootLogin yes
#StrictModes yes
#MaxAuthTries 6

#RSAAuthentication yes
#PubkeyAuthentication yes
#AuthorizedKeysFile     .ssh/authorized_keys

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#RhostsRSAAuthentication no
# similar for protocol version 2
#HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# RhostsRSAAuthentication and HostbasedAuthentication
#IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
#IgnoreRhosts yes

# To disable tunneled clear text passwords, change to no here!
#PasswordAuthentication no
#PermitEmptyPasswords no
PasswordAuthentication no

# Change to no to disable s/key passwords
#ChallengeResponseAuthentication yes
ChallengeResponseAuthentication no

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no

# GSSAPI options
GSSAPIAuthentication no
#GSSAPIAuthentication yes
#GSSAPICleanupCredentials yes
GSSAPICleanupCredentials yes

# Set this to 'yes' to enable PAM authentication, account processing, 
# and session processing. If this is enabled, PAM authentication will 
# be allowed through the ChallengeResponseAuthentication mechanism. 
# Depending on your PAM configuration, this may bypass the setting of 
# PasswordAuthentication, PermitEmptyPasswords, and 
# "PermitRootLogin without-password". If you just want the PAM account and 
# session checks to run without PAM authentication, then enable this but set 
# ChallengeResponseAuthentication=no
#UsePAM no
UsePAM yes

# Accept locale-related environment variables
AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES 
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT 
AcceptEnv LC_IDENTIFICATION LC_ALL
#AllowTcpForwarding yes
#GatewayPorts no
#X11Forwarding no
X11Forwarding yes
#X11DisplayOffset 10
#X11UseLocalhost yes
#PrintMotd yes
#PrintLastLog yes
#TCPKeepAlive yes
#UseLogin no
#UsePrivilegeSeparation yes
#PermitUserEnvironment no
#Compression delayed
ClientAliveInterval 60
ClientAliveCountMax 240
#ShowPatchLevel no
#UseDNS yes
#PidFile /var/run/sshd.pid
#MaxStartups 10
#PermitTunnel no
#ChrootDirectory none

# no default banner path
#Banner /some/path

# override default of no subsystems
Subsystem       sftp    /usr/libexec/openssh/sftp-server
UseDNS  no
PermitRootLogin without-password


UPLOADED TO starcluster-3-AMI:

cd /root/base/pipeline/ec2

scp -v -i /root/base/apps/ec2/keypair/agua.pem \
sshd_config root@ec2-174-129-175-155.compute-1.amazonaws.com:/etc/ssh

CONFIRM UPLOADED:

cd /root/base/pipeline/ec2

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/ssh/sshd_config'

RESTART SSH:


ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'/etc/init.d/sshd restart'


CONNECT:

ssh -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com

    DOESN'T GIVE GSS ERROR ANY MORE BUT STILL HANGS
    
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-174-129-175-155.compute-1.amazonaws.com [174.129.175.155] port 22.
    debug1: Connection established.
    debug1: permanently_set_uid: 0/0
    debug1: identity file /root/base/apps/ec2/keypair/agua.pem type -1
    debug1: loaded 1 keys
    debug1: Remote protocol version 2.0, remote software version OpenSSH_4.3
    debug1: match: OpenSSH_4.3 pat OpenSSH*
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_4.3
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: server->client aes128-cbc hmac-md5 none
    debug1: kex: client->server aes128-cbc hmac-md5 none
    debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
    debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
    debug1: Host 'ec2-174-129-175-155.compute-1.amazonaws.com' is known and matches the RSA host key.
    debug1: Found key in /root/.ssh/known_hosts:23
    debug1: ssh_rsa_verify: signature correct
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: SSH2_MSG_SERVICE_REQUEST sent
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey
    debug1: Next authentication method: publickey
    debug1: Trying private key: /root/base/apps/ec2/keypair/agua.pem
    debug1: read PEM private key done: type RSA
    debug1: Authentication succeeded (publickey).
    debug1: channel 0: new [client-session]
    debug1: Entering interactive session.
    debug1: Sending environment.
    debug1: Sending env LANG = en_US.UTF-8


MORE DEBUG INFORMATION:

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com
    
    
    debug2: client_session2_setup: id 0
    debug2: channel 0: request pty-req confirm 0
    debug1: Sending environment.
    debug1: Sending env LANG = en_US.UTF-8
    debug2: channel 0: request env confirm 0
    debug2: channel 0: request shell confirm 0
    debug2: fd 3 setting TCP_NODELAY
    debug2: callback done
    debug2: channel 0: open confirm rwindow 0 rmax 32768
    debug2: channel 0: rcvd adjust 2097152



ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat .bashrc'

    export PATH=$PATH:/home/ec2/bin
    export EC2_HOME=/home/ec2
    
    # Source global definitions
    if [ -f /etc/bashrc ]; then
            . /etc/bashrc
    fi

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/bashrc'

    NO REFERENCE TO .bashrc


ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat .bash_profile'

# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
unset USERNAME


WRITE NEW .bash_profile AND UPLOAD

emacs .bash_profile
    # .bash_profile
    
    # Get the aliases and functions
    if [ -f ~/.bashrc ]; then
            . ~/.bashrc
    fi
    
    # User specific environment and startup programs
    
    export PATH=$PATH:$HOME/bin


UPLOADED:

scp -v -i /root/base/apps/ec2/keypair/agua.pem \
.bash_profile root@ec2-174-129-175-155.compute-1.amazonaws.com:


CHECKED UPLOAD:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat .bash_profile'

    # .bash_profile
    
    # Get the aliases and functions
    if [ -f ~/.bashrc ]; then
            . ~/.bashrc
    fi
    
    # User specific environment and startup programs
    
    export PATH=$PATH:$HOME/bin




VIEW SYSLOG

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'dmesg'
    
    ...
    Floppy drive(s): fd0 is unknown type 15 (usb?), fd1 is unknown type 15 (usb?)
    Failed to obtain physical IRQ 6
    floppy0: no floppy controllers found
    lp: driver loaded but no devices found
    md: Autodetecting RAID arrays.
    md: autorun ...
    md: ... autorun DONE.
    device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: dm-devel@redhat.com
    device-mapper: multipath: version 1.0.5 loaded
    EXT3 FS on sdb, internal journal
    IA-32 Microcode Update Driver: v1.14a-xen < tigran@veritas.com>
    audit(1287910208.632:2): audit_pid=916 old=0 by auid=4294967295 subj=kernel
    NET: Registered protocol family 10
    lo: Disabled Privacy Extensions
    Mobile IPv6
    eth0: no IPv6 routers present



VIEW SYSLOG:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'tail -f /var/log/messages'



CHECK IF DUE TO SOME CRONTAB LOGROTATE

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/crontab'

    SHELL=/bin/bash
    PATH=/sbin:/bin:/usr/sbin:/usr/bin
    MAILTO=root
    HOME=/
    
    # run-parts
    01 * * * * root run-parts /etc/cron.hourly
    02 4 * * * root run-parts /etc/cron.daily
    22 4 * * 0 root run-parts /etc/cron.weekly
    42 4 1 * * root run-parts /etc/cron.monthly

WHEREAS ON LINODE:

cat /etc/crontab

    SHELL=/bin/bash
    PATH=/sbin:/bin:/usr/sbin:/usr/bin
    MAILTO=root
    HOME=/
    
    */30 * * * * wget -q -O /dev/null http://stuartpyoung.com/moodle/admin/cron.php
    
    @reboot /root/start-confluence.sh
    
    # run-parts
    01 * * * * root run-parts /etc/cron.hourly
    02 4 * * * root run-parts /etc/cron.daily
    22 4 * * 0 root run-parts /etc/cron.weekly
    42 4 1 * * root run-parts /etc/cron.monthly





VIEWED SSH LOGS AND FOUND ERRORS:

    Oct 24 11:31:42 ip-10-122-53-199 sshd[1848]: error: openpty: No such file or directory
    Oct 24 11:31:42 ip-10-122-53-199 sshd[1848]: error: session_pty_req: session 0 alloc failed


ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'tail /var/log/secure'

    
    Oct 24 11:31:11 ip-10-122-53-199 sshd[1804]: error: session_pty_req: session 0 alloc failed
    Oct 24 11:31:22 ip-10-122-53-199 sshd[1831]: Accepted publickey for root from 173.230.142.248 port 46886 ssh2
    Oct 24 11:31:22 ip-10-122-53-199 sshd[1831]: pam_unix(sshd:session): session opened for user root by (uid=0)
    Oct 24 11:31:33 ip-10-122-53-199 sshd[1804]: pam_unix(sshd:session): session closed for user root
    Oct 24 11:31:42 ip-10-122-53-199 sshd[1848]: Accepted publickey for root from 173.230.142.248 port 46887 ssh2
    Oct 24 11:31:42 ip-10-122-53-199 sshd[1848]: pam_unix(sshd:session): session opened for user root by (uid=0)
    Oct 24 11:31:42 ip-10-122-53-199 sshd[1848]: error: openpty: No such file or directory
    Oct 24 11:31:42 ip-10-122-53-199 sshd[1848]: error: session_pty_req: session 0 alloc failed
    Oct 24 11:34:19 ip-10-122-53-199 sshd[1875]: Accepted publickey for root from 173.230.142.248 port 58897 ssh2
    Oct 24 11:34:19 ip-10-122-53-199 sshd[1875]: pam_unix(sshd:session): session opened for user root by (uid=0)






OPTION 1
--------
rm /etc/init.d/mount. lin e2fsprogs. You will get the newer mount script with 
the udev support you are missing.

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'ls -al /etc/init.d/*'


OPTION 2
--------

SSH will not log in

2004-03-12 From the logfile:
sshd[18384]: error: openpty: No such file or directory
sshd[18384]: error: session_pty_req: session 0 alloc failed
This is because of missing pty's. In my case it was solved with booting with the option 'devfs=mount' (in LILO or GRUB).



OPTION 3
--------


ADDED TO /etc/fstab:
 
none            /dev/pts        devpts        gid=5,mode=620    0 0


cd /root/base/pipeline/ec2
emacs fstab

    proc        /proc           proc    defaults        0       0
    /dev/sda3    None            swap    defaults       0       0
    /dev/sdb    /               ext3    defaults        0       0
    none        /dev/pts        devpts  gid=5,mode=620  0       0

scp -v -i /root/base/apps/ec2/keypair/agua.pem \
fstab root@ec2-174-129-175-155.compute-1.amazonaws.com:/etc


CONNECT:

ssh -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com

    debug1: Entering interactive session.
    debug1: Sending environment.
    debug1: Sending env LANG = en_US.UTF-8
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


STOP, RESTART AND CONNECT:

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com

    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug2: ssh_connect: needpriv 0
    debug1: Connecting to ec2-174-129-175-155.compute-1.amazonaws.com [174.129.175.155] port 22.


CHECK FSTAB:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/fstab'


NON-INTERACTIVE SSH NOT WORKING:

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'cat /etc/fstab'
    
    < hangs>
    
    
REBOOTED, RECONNECT:

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com



CHECKED starcluster-2-EBS:

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-75-101-201-63.compute-1.amazonaws.com
    
    debug2: fd 3 setting TCP_NODELAY
    debug2: callback done
    debug2: channel 0: open confirm rwindow 0 rmax 32768
    debug2: channel 0: rcvd adjust 2097152
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


STOPPED, STARTED AND CONNECT:

ssh -vv -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-75-101-201-63.compute-1.amazonaws.com

    
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug2: ssh_connect: needpriv 0
    debug1: Connecting to ec2-75-101-201-63.compute-1.amazonaws.com [75.101.201.63] port 22.


GET CONSOLE OUTPUT:


ec2-get-console-output i-c6835dab

    
    i-c6835dab
    2010-10-24T18:51:10+0000
    Linux version 2.6.21.7-2.fc8xen (mockbuild@xenbuilder4.fedora.phx.redhat.com) (gcc version 4.1.2 20070925 (Red Hat 4.1.2-33)) #1 SMP Fri Feb 15 12:34:28 EST 2008
    Command line:  root=/dev/sdb ro 4
    BIOS-provided physical RAM map:
     Xen: 0000000000000000 - 0000000026f00000 (usable)
    end_pfn_map = 159488
    Zone PFN ranges:
      DMA             0 ->   159488
      DMA32      159488 ->   159488
      Normal     159488 ->   159488
    early_node_map[1] active PFN ranges
        0:        0 ->   159488
    No mptable found.
    PERCPU: Allocating 26496 bytes of per cpu data
    Built 1 zonelists.  Total pages: 157308
    Kernel command line:  root=/dev/sdb ro 4
    Initializing CPU#0
    PID hash table entries: 4096 (order: 12, 32768 bytes)
    Xen reported: 2659.998 MHz processor.
    Console: colour dummy device 80x25
    Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
    Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
    Software IO TLB disabled
    Memory: 604028k/637952k available (2265k kernel code, 25036k reserved, 1351k data, 200k init)
    Calibrating delay using timer specific routine.. 5323.49 BogoMIPS (lpj=2661749)
    Security Framework v1.0.0 initialized
    SELinux:  Initializing.
    selinux_register_security:  Registering secondary module capability
    Capability LSM initialized as secondary
    Mount-cache hash table entries: 256
    CPU: L1 I cache: 32K, L1 D cache: 32K
    CPU: L2 cache: 6144K
    CPU: Physical Processor ID: 0
    CPU: Processor Core ID: 1
    SMP alternatives: switching to UP code
    Freeing SMP alternatives: 28k freed
    Brought up 1 CPUs
    NET: Registered protocol family 16
    Brought up 1 CPUs
    PCI: Fatal: No config space access function found
    PCI: setting up Xen PCI frontend stub
    ACPI: Interpreter disabled.
    Linux Plug and Play Support v0.97 (c) Adam Belay
    pnp: PnP ACPI: disabled
    xen_mem: Initialising balloon driver.
    usbcore: registered new interface driver usbfs
    usbcore: registered new interface driver hub
    usbcore: registered new device driver usb
    PCI: System does not support PCI
    PCI: System does not support PCI
    NetLabel: Initializing
    NetLabel:  domain hash size = 128
    NetLabel:  protocols = UNLABELED CIPSOv4
    NetLabel:  unlabeled traffic allowed by default
    NET: Registered protocol family 2
    IP route cache hash table entries: 32768 (order: 6, 262144 bytes)
    TCP established hash table entries: 131072 (order: 9, 3145728 bytes)
    TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
    TCP: Hash tables configured (established 131072 bind 65536)
    TCP reno registered
    checking if image is initramfs... it is
    Freeing initrd memory: 7520k freed
    audit: initializing netlink socket (disabled)
    audit(1287946086.370:1): initialized
    VFS: Disk quotas dquot_6.5.1
    Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
    ksign: Installing public key data
    Loading keyring
    io scheduler noop registered
    io scheduler anticipatory registered
    io scheduler deadline registered
    io scheduler cfq registered (default)
    pci_hotplug: PCI Hot Plug PCI Core version: 0.5
    rtc: IRQ 8 is not free.
    Non-volatile memory driver v1.2
    Linux agpgart interface v0.102 (c) Dave Jones
    RAMDISK driver initialized: 16 RAM disks of 16384K size 4096 blocksize
    input: Macintosh mouse button emulation as /class/input/input0
    Xen virtual console successfully installed as xvc0
    Linux version 2.6.21.7-2.fc8xen (mockbuild@xenbuilder4.fedora.phx.redhat.com) (gcc version 4.1.2 20070925 (Red Hat 4.1.2-33)) #1 SMP Fri Feb 15 12:34:28 EST 2008
    Command line:  root=/dev/sdb ro 4
    BIOS-provided physical RAM map:
     Xen: 0000000000000000 - 0000000026f00000 (usable)
    end_pfn_map = 159488
    Zone PFN ranges:
      DMA             0 ->   159488
      DMA32      159488 ->   159488
      Normal     159488 ->   159488
    early_node_map[1] active PFN ranges
        0:        0 ->   159488
    No mptable found.
    PERCPU: Allocating 26496 bytes of per cpu data
    Built 1 zonelists.  Total pages: 157308
    Kernel command line:  root=/dev/sdb ro 4
    Initializing CPU#0
    PID hash table entries: 4096 (order: 12, 32768 bytes)
    Xen reported: 2659.998 MHz processor.
    Console: colour dummy device 80x25
    Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
    Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
    Software IO TLB disabled
    Memory: 604028k/637952k available (2265k kernel code, 25036k reserved, 1351k data, 200k init)
    Calibrating delay using timer specific routine.. 5323.49 BogoMIPS (lpj=2661749)
    Security Framework v1.0.0 initialized
    SELinux:  Initializing.
    selinux_register_security:  Registering secondary module capability
    Capability LSM initialized as secondary
    Mount-cache hash table entries: 256
    CPU: L1 I cache: 32K, L1 D cache: 32K
    CPU: L2 cache: 6144K
    CPU: Physical Processor ID: 0
    CPU: Processor Core ID: 1
    SMP alternatives: switching to UP code
    Freeing SMP alternatives: 28k freed
    Brought up 1 CPUs
    NET: Registered protocol family 16
    Brought up 1 CPUs
    PCI: Fatal: No config space access function found
    PCI: setting up Xen PCI frontend stub
    ACPI: Interpreter disabled.
    Linux Plug and Play Support v0.97 (c) Adam Belay
    pnp: PnP ACPI: disabled
    xen_mem: Initialising balloon driver.
    usbcore: registered new interface driver usbfs
    usbcore: registered new interface driver hub
    usbcore: registered new device driver usb
    PCI: System does not support PCI
    PCI: System does not support PCI
    NetLabel: Initializing
    NetLabel:  domain hash size = 128
    NetLabel:  protocols = UNLABELED CIPSOv4
    NetLabel:  unlabeled traffic allowed by default
    NET: Registered protocol family 2
    IP route cache hash table entries: 32768 (order: 6, 262144 bytes)
    TCP established hash table entries: 131072 (order: 9, 3145728 bytes)
    TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
    TCP: Hash tables configured (established 131072 bind 65536)
    TCP reno registered
    checking if image is initramfs... it is
    Freeing initrd memory: 7520k freed
    audit: initializing netlink socket (disabled)
    audit(1287946086.370:1): initialized
    VFS: Disk quotas dquot_6.5.1
    Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
    ksign: Installing public key data
    Loading keyring
    io scheduler noop registered
    io scheduler anticipatory registered
    io scheduler deadline registered
    io scheduler cfq registered (default)
    pci_hotplug: PCI Hot Plug PCI Core version: 0.5
    rtc: IRQ 8 is not free.
    Non-volatile memory driver v1.2
    Linux agpgart interface v0.102 (c) Dave Jones
    RAMDISK driver initialized: 16 RAM disks of 16384K size 4096 blocksize
    input: Macintosh mouse button emulation as /class/input/input0
    Xen virtual console successfully installed as xvc0
    Event-channel device installed.
    usbcore: registered new interface driver hiddev
    usbcore: registered new interface driver usbhid
    drivers/usb/input/hid-core.c: v2.6:USB HID core driver
    PNP: No PS/2 controller found. Probing ports directly.
    i8042.c: No controller found.
    mice: PS/2 mouse device common for all mice
    TCP bic registered
    Initializing XFRM netlink socket
    NET: Registered protocol family 1
    NET: Registered protocol family 17
    XENBUS: Device with no driver: device/vif/0
    XENBUS: Device with no driver: device/vbd/2064
    drivers/rtc/hctosys.c: unable to open rtc device (rtc0)
    Freeing unused kernel memory: 200k freed
    Write protecting the kernel read-only data: 981k
    Red Hat nash version 6.0.19 starting
    Mounting proc filesystem
    Mounting sysfs filesystem
    Creating /dev
    Creating initial device nodes
    Setting up hotplug.
    Creating block device nodes.
    Loading xennet.ko module
    netfront: Initialising virtual ethernet driver.
    netfront: device eth0 has flipping receive path.
    Loading xenblk.ko module
    xen-vbd: registered block device major 8
     sdb: unknown partition table
    Loading ehci-hcd.ko module
    Loading ohci-hcd.ko module
    Loading uhci-hcd.ko module
    USB Universal Host Controller Interface driver v3.0
    Loading mbcache.ko module
    Loading jbd.ko module
    Loading ext3.ko module
    Creating root device.
    Mounting root filesystem.
    kjournald starting.  Commit interval 5 seconds
    EXT3-fs: mounted filesystem with ordered data mode.
    Setting up other filesystems.
    Setting up new root fs
    no fstab.sys, mounting internal defaults
    Switching to new root and running init.
    unmounting old /dev
    unmounting old /proc
    unmounting old /sys
    INIT: version 2.86 booting
                    Welcome to  CentOS release 5.5 (Final)
                    Press 'I' to enter interactive startup.
    Cannot access the Hardware Clock via any known method.
    Use the --debug option to see the details of our search for an access method.
    Setting clock : Sun Oct 24 14:48:10 EDT 2010 [  OK  ]
    Starting udev: [  OK  ]
    Setting hostname localhost.localdomain:  [  OK  ]
    No devices found
    Setting up Logical Volume Management: File descriptor 7 (/sys/kernel/hotplug) leaked on lvm.static invocation. Parent PID 207: /bin/bash
    [  OK  ]
    Checking filesystems
    Checking all file systems.
    [  OK  ]
    Remounting root filesystem in read-write mode:  [  OK  ]
    Mounting local filesystems:  [  OK  ]
    Enabling local filesystem quotas:  [  OK  ]
    Enabling /etc/fstab swaps:  [  OK  ]
    INIT: Entering runlevel: 4
    Entering non-interactive startup
    Applying Intel CPU microcode update: [FAILED]
    Starting background readahead: [  OK  ]
    Checking for hardware changes [  OK  ]
    Bringing up loopback interface:  [  OK  ]
    Bringing up interface eth0:  
    Determining IP information for eth0... done.
    [  OK  ]
    Starting auditd: [  OK  ]
    Starting getsshkey:    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100   386  100   386    0     0   5068      0 --:--:-- --:--:-- --:--:--     0
    got ssh-key.
    [  OK  ]
    Starting syslog-ng: [  OK  ]
    Starting system message bus: [  OK  ]
    Mounting other filesystems:  [  OK  ]
    Starting PC/SC smart card daemon (pcscd): [  OK  ]
    Starting HAL daemon: [  OK  ]
    Starting sshd: [  OK  ]
    Starting cups: [  OK  ]
    Starting sendmail: [  OK  ]
    Starting sm-client: [  OK  ]
    curl: (22) The requested URL returned error: 404
    Starting crond: [  OK  ]
    Starting process accounting:  [  OK  ]
    Starting xfs: [  OK  ]
    [  OK  ] atd: [  OK  ]
    Starting jexec:  Starting jexec services[  OK  ]
    Starting Avahi daemon... [  OK  ]
    
    CentOS release 5.5 (Final)
    Kernel 2.6.21.7-2.fc8xen on an x86_64


What is the console output of the instance? You can get this through an API client or a command like:

ec2-get-console-output INSTANCE_ID
There are so many reasons that connectivity might be down to a remote server or service that it would be impossible to get a significant percentage of them listed in one article. I’ll start by listing some of the more common problems here; please add to the comments as you run into or remember others.



Sshd makes error 'openpty: No such file or directory' after upgrade to glibc2.1

Extracted from debian-devel 
Tip provided by Alexander Stavitsky
> =Topic on #debian: if telnetd/sshd/etc after glibc2.1 upgrade don't
> =      work, restart them || glibc2.1 casualties list: apt 0.1.10, prcs,
> =      libtricks, libgc4
>
> sshd still don't work..but that's ok...ssltelnet does. so I'm good.
 
 Glibc 2.1 has the support for new pty system. I had the same problem.
>From Chages file in 2.2.x kernel:
    Optional support for Unix98 pty devices has also been added. If you
    want to use the Unix98 ptys, you should be running at least
    glibc-2.0.9x, and you must switch completely to Unix98 pty's.  The
    general procedure for configuring Unix98 pty support is:
 
    - Compile your kernel with CONFIG_UNIX98_PTYS and CONFIG_DEVPTS_FS.
    - mknod /dev/ptmx c 5 2
      chmod 666 /dev/ptmx
      mkdir /dev/pts
    - Add to /etc/fstab:
 
 
      none            /dev/pts        devpts        gid=5,mode=620    0 0
 
      (Note:  gid=5 is applicable for RedHat systems for which group "tty" has
      gid 5.  Adjust according to your distribution.  Use mode=600 if you want
      "mesg n" to be default.)
    - Mount /dev/pts
  
 I did this and sshd is working again.



OPTION 4
--------

UPGRADE OPENSSH TO 3.5

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'yum update openssh-server'
    
    OK
 
    No Packages marked for Update

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'ssh -V'

    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008


ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'sshd -V'

    sshd: illegal option -- V
    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    usage: sshd [-46Ddeiqt] [-b bits] [-f config_file] [-g login_grace_time]
                [-h host_key_file] [-k key_gen_time] [-o option] [-p port] [-u len]


I solved it by upgrading openssh to 3.5 

In this forum there is a thread which show how to upgrade to openssh 3.5 (via rpm) 

Thanks 
TDD
propheci
Jun 24 2003, 05:54 PM
hi, sorry for reviving this old thread but i'm having this exact same problem even though i upgraded to OpenSSH 3.5p1. my logs say: 

Jun 24 16:20:57 ensim sshd[3597]: error: openpty: No such file or directory 
Jun 24 16:20:57 ensim sshd[3599]: error: session_pty_req: session 0 alloc failed 

and 

Jun 24 16:20:57 ensim PAM_ensimvwh[3599]: Failed to mount devpts 1 (this may be benign) 

/dev/pts is mounted: 

none on /dev/pts type devpts (rw,gid=5,mode=620) 

any idea? thank you very much.


CHECK IF /dev/pts IS MOUNTED

ssh -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com \
'ls -al /dev/pts'

    total 0
    drwxr-xr-x  2 root root   40 Oct 24 04:49 .
    drwxr-xr-x 10 root root 2800 Oct 24 04:50 ..





#### DID NOT WORK

####Re: OpenSSL vulnerability in Debian---Ubuntu too?
####Quote:
####Originally Posted by Tuna-Fish  
####Is there a fast way to tell a computer to regenerate all the keys? How should I start doing it?
####Okay here's how I did it for SSH. Not the most elegant way but it works.
####
####1. Login as root or use sudo.
####2. Copy your ssh configs so you can put them back later:
####Code:
####cp /etc/ssh/ssh_config ./
####cp /etc/ssh/sshd_config ./
####3. Remove purge openssh-server:
####Code:
####apt-get purge openssh-server
####4. Reinstall openssh-server:
####Code:
####apt-get install openssh-server
####5. While installing watch for the following output. If you see it then all is good:
####Code:
####Creating SSH2 RSA key; this may take some time ...
####Creating SSH2 DSA key; this may take some time ...
####6. Move back your old configs:
####Code:
####mv sshd_config /etc/ssh/
####mv ssh_config /etc/ssh/
####7. Restart sshd
####Code:
####/etc/init.d/ssh restart
####Note this won't work for feisty since it has no "apt-get purge", you will need to manually delete the keys in /etc/ssh




####Kiran May 23, 2007
####Try ssh-copy-id to copy your keys ,,,
####
####REPLY
####
####2sudhanshu July 28, 2010
#####ssh-copy-id -i //to copy your keys
####Insted of DSA key RSA is very strong so always prefer RSA key
####
####REPLY
####
####3ricc May 31, 2007
####Vivek,
####
####A small suggestion. Instead of
####
####scp ~/.ssh/id_dsa.pub user@jerry:.ssh/authorized_keys
####
####It is better to copy it in some other name and append the contents of the authorized_keys file with the contents of the id_dsa.pub file.
####
####This way if there are any existing keys in the file, it will not get overwritten.
####
####ricc
####


1. CONNECT

ssh -i /root/base/apps/ec2/keypair/agua.pem root@ec2-67-202-8-87.compute-1.amazonaws.com



2. EDIT /etc/fstab

CHANGE FROM THIS:

proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0
/dev/sda2                                       /mnt            ext3    defaults        0       0
FSTABEOF


TO THIS:

proc                                            /proc           proc    defaults        0       0
/dev/sda3                                       None            swap    defaults        0       0
/dev/sdb                                       /               ext3    defaults        0       0
/dev/sda2                                       /data            ext3    noauto        0       0


REBOOTED BUT STILL CAN'T CONNECT

ssh -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-174-129-175-155.compute-1.amazonaws.com 























3. CREATE BINDINGS TO LINK TO MYSQL ON AMI


USE bind AND mount TO MIRROR NEW LOCATIONS IN OLD FOLDERS
Point MySQL to the correct database files on the EBS volume using mount bind.

#### MOUNT /data

mkdir /data
mount /dev/sda2 /data

#### BIND MYSQL TO /data

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

#### CHECK BINDINGS IN /etc/fstab

cat /etc/fstab

#    proc                                            /proc           proc    defaults        0       0
#    /dev/sda3                                       None            swap    defaults        0       0
#    /dev/sdb                                       /               ext3    defaults        0       0
#    /dev/sda2                                       /data            ext3    defaults        0       0
#    /data/mysql/etc/mysql /etc/mysql     none bind
#    /data/mysql/lib/mysql /var/lib/mysql none bind
#    /data/mysql/log/mysql /var/log/mysql none bind
#    /data/mysql/etc/mysql /etc/mysql     none bind
#    /data/mysql/lib/mysql /var/lib/mysql none bind
#    /data/mysql/log/mysql /var/log/mysql none bind
#    /data/mysql/etc/mysql /etc/mysql     none bind
#    /data/mysql/lib/mysql /var/lib/mysql none bind
#    /data/mysql/log/mysql /var/log/mysql none bind

#### RESTART MYSQL

/etc/init.d/mysqld start


#### STOP AND RESTART


#### CONNECT


ssh -v -i /root/base/apps/ec2/keypair/agua.pem \
root@ec2-184-73-136-222.compute-1.amazonaws.com


    OpenSSH_4.3p2, OpenSSL 0.9.8e-fips-rhel5 01 Jul 2008
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-73-136-222.compute-1.amazonaws.com [184.73.136.222] port 22.
    debug1: Connection established.
    debug1: permanently_set_uid: 0/0
    debug1: identity file /root/base/apps/ec2/keypair/agua.pem type -1
    debug1: loaded 1 keys
    debug1: Remote protocol version 2.0, remote software version OpenSSH_4.3
    debug1: match: OpenSSH_4.3 pat OpenSSH*
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_4.3
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: server->client aes128-cbc hmac-md5 none
    debug1: kex: client->server aes128-cbc hmac-md5 none
    debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
    debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
    debug1: Host 'ec2-184-73-136-222.compute-1.amazonaws.com' is known and matches the RSA host key.
    debug1: Found key in /root/.ssh/known_hosts:21
    debug1: ssh_rsa_verify: signature correct
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: SSH2_MSG_SERVICE_REQUEST sent
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey,gssapi-with-mic
    debug1: Next authentication method: gssapi-with-mic
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Unspecified GSS failure.  Minor code may provide more information
    Unknown code krb5 195
    
    debug1: Next authentication method: publickey
    debug1: Trying private key: /root/base/apps/ec2/keypair/agua.pem
    debug1: read PEM private key done: type RSA
    debug1: Authentication succeeded (publickey).
    debug1: channel 0: new [client-session]
    debug1: Entering interactive session.
    debug1: Sending environment.
    debug1: Sending env LANG = en_US.UTF-8
    debug1: client_input_channel_req: channel 0 rtype keepalive@openssh.com reply 1


Re: delay in pw prompt when ssh'ing into ubuntu
Delays when ssh'ing in are almost always DNS related. To diagnose this, ssh into the machine from a known good box (that doesn't see the delays elsewhere) with the command line "ssh -vv username@hostname" and see where the delay is. It's likely that the server that is giving you the delay is trying to reverse lookup the IP of the machine you are sshing from and timing out (hence the delay). 

To fix, edit your ssh config ("/etc/ssh/sshd_config") and add a "UseDNS no" line (or change the existing one to this). 

Then restart your sshd via "sudo /etc/init.d/ssh restart".

Hope that helps.




??? This is my fault. I forgot to add 'root' to the AllowGroups in sshd config.


####ENABLE TELNET
####
####
####yum install telnet-server
####
####
####START TELNET
####
####/etc/init.d/xinetd restart
####
####
####TELNET
####
####telnet ec2-184-73-136-222.compute-1.amazonaws.com
####




SYSTEM LOG:



    Linux version 2.6.21.7-2.fc8xen (mockbuild@xenbuilder4.fedora.phx.redhat.com) (gcc version 4.1.2 20070925 (Red Hat 4.1.2-33)) #1 SMP Fri Feb 15 12:34:28 EST 2008

Command line:  root=/dev/sdb ro 4

BIOS-provided physical RAM map:

 Xen: 0000000000000000 - 0000000026f00000 (usable)

end_pfn_map = 159488

Zone PFN ranges:

  DMA             0 ->   159488

  DMA32      159488 ->   159488

  Normal     159488 ->   159488

early_node_map[1] active PFN ranges

    0:        0 ->   159488

No mptable found.

PERCPU: Allocating 26496 bytes of per cpu data

Built 1 zonelists.  Total pages: 157308

Kernel command line:  root=/dev/sdb ro 4

Initializing CPU#0

PID hash table entries: 4096 (order: 12, 32768 bytes)

Xen reported: 2659.996 MHz processor.

Console: colour dummy device 80x25

Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)

Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)

Software IO TLB disabled

Memory: 604028k/637952k available (2265k kernel code, 25036k reserved, 1351k data, 200k init)

Calibrating delay using timer specific routine.. 5337.91 BogoMIPS (lpj=2668955)

Security Framework v1.0.0 initialized

SELinux:  Initializing.

selinux_register_security:  Registering secondary module capability

Capability LSM initialized as secondary

Mount-cache hash table entries: 256

CPU: L1 I cache: 32K, L1 D cache: 32K

CPU: L2 cache: 6144K

CPU: Physical Processor ID: 0

CPU: Processor Core ID: 2

SMP alternatives: switching to UP code

Freeing SMP alternatives: 28k freed

Brought up 1 CPUs

NET: Registered protocol family 16

Brought up 1 CPUs

PCI: Fatal: No config space access function found

PCI: setting up Xen PCI frontend stub

ACPI: Interpreter disabled.

Linux Plug and Play Support v0.97 (c) Adam Belay

pnp: PnP ACPI: disabled

xen_mem: Initialising balloon driver.

usbcore: registered new interface driver usbfs

usbcore: registered new interface driver hub

usbcore: registered new device driver usb

PCI: System does not support PCI

PCI: System does not support PCI

NetLabel: Initializing

NetLabel:  domain hash size = 128

NetLabel:  protocols = UNLABELED CIPSOv4

NetLabel:  unlabeled traffic allowed by default

NET: Registered protocol family 2

IP route cache hash table entries: 32768 (order: 6, 262144 bytes)

TCP established hash table entries: 131072 (order: 9, 3145728 bytes)

TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)

TCP: Hash tables configured (established 131072 bind 65536)

TCP reno registered

checking if image is initramfs... it is

Freeing initrd memory: 7520k freed

audit: initializing netlink socket (disabled)

audit(1287889933.836:1): initialized

VFS: Disk quotas dquot_6.5.1

Dquot-cache hash table entries: 512 (order 0, 4096 bytes)

ksign: Installing public key data

Loading keyring

io scheduler noop registered

io scheduler anticipatory registered

io scheduler deadline registered

io scheduler cfq registered (default)

pci_hotplug: PCI Hot Plug PCI Core version: 0.5

rtc: IRQ 8 is not free.

Non-volatile memory driver v1.2

Linux agpgart interface v0.102 (c) Dave Jones

RAMDISK driver initialized: 16 RAM disks of 16384K size 4096 blocksize

input: Macintosh mouse button emulation as /class/input/input0

Xen virtual console successfully installed as xvc0

Linux version 2.6.21.7-2.fc8xen (mockbuild@xenbuilder4.fedora.phx.redhat.com) (gcc version 4.1.2 20070925 (Red Hat 4.1.2-33)) #1 SMP Fri Feb 15 12:34:28 EST 2008

Command line:  root=/dev/sdb ro 4

BIOS-provided physical RAM map:

 Xen: 0000000000000000 - 0000000026f00000 (usable)

end_pfn_map = 159488

Zone PFN ranges:

  DMA             0 ->   159488

  DMA32      159488 ->   159488

  Normal     159488 ->   159488

early_node_map[1] active PFN ranges

    0:        0 ->   159488

No mptable found.

PERCPU: Allocating 26496 bytes of per cpu data

Built 1 zonelists.  Total pages: 157308

Kernel command line:  root=/dev/sdb ro 4

Initializing CPU#0

PID hash table entries: 4096 (order: 12, 32768 bytes)

Xen reported: 2659.996 MHz processor.

Console: colour dummy device 80x25

Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)

Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)

Software IO TLB disabled

Memory: 604028k/637952k available (2265k kernel code, 25036k reserved, 1351k data, 200k init)

Calibrating delay using timer specific routine.. 5337.91 BogoMIPS (lpj=2668955)

Security Framework v1.0.0 initialized

SELinux:  Initializing.

selinux_register_security:  Registering secondary module capability

Capability LSM initialized as secondary

Mount-cache hash table entries: 256

CPU: L1 I cache: 32K, L1 D cache: 32K

CPU: L2 cache: 6144K

CPU: Physical Processor ID: 0

CPU: Processor Core ID: 2

SMP alternatives: switching to UP code

Freeing SMP alternatives: 28k freed

Brought up 1 CPUs

NET: Registered protocol family 16

Brought up 1 CPUs

PCI: Fatal: No config space access function found

PCI: setting up Xen PCI frontend stub

ACPI: Interpreter disabled.

Linux Plug and Play Support v0.97 (c) Adam Belay

pnp: PnP ACPI: disabled

xen_mem: Initialising balloon driver.

usbcore: registered new interface driver usbfs

usbcore: registered new interface driver hub

usbcore: registered new device driver usb

PCI: System does not support PCI

PCI: System does not support PCI

NetLabel: Initializing

NetLabel:  domain hash size = 128

NetLabel:  protocols = UNLABELED CIPSOv4

NetLabel:  unlabeled traffic allowed by default

NET: Registered protocol family 2

IP route cache hash table entries: 32768 (order: 6, 262144 bytes)

TCP established hash table entries: 131072 (order: 9, 3145728 bytes)

TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)

TCP: Hash tables configured (established 131072 bind 65536)

TCP reno registered

checking if image is initramfs... it is

Freeing initrd memory: 7520k freed

audit: initializing netlink socket (disabled)

audit(1287889933.836:1): initialized

VFS: Disk quotas dquot_6.5.1

Dquot-cache hash table entries: 512 (order 0, 4096 bytes)

ksign: Installing public key data

Loading keyring

io scheduler noop registered

io scheduler anticipatory registered

io scheduler deadline registered

io scheduler cfq registered (default)

pci_hotplug: PCI Hot Plug PCI Core version: 0.5

rtc: IRQ 8 is not free.

Non-volatile memory driver v1.2

Linux agpgart interface v0.102 (c) Dave Jones

RAMDISK driver initialized: 16 RAM disks of 16384K size 4096 blocksize

input: Macintosh mouse button emulation as /class/input/input0

Xen virtual console successfully installed as xvc0

Event-channel device installed.

usbcore: registered new interface driver hiddev

usbcore: registered new interface driver usbhid

drivers/usb/input/hid-core.c: v2.6:USB HID core driver

PNP: No PS/2 controller found. Probing ports directly.

i8042.c: No controller found.

mice: PS/2 mouse device common for all mice

TCP bic registered

Initializing XFRM netlink socket

NET: Registered protocol family 1

NET: Registered protocol family 17

XENBUS: Device with no driver: device/vif/0

XENBUS: Device with no driver: device/vbd/2064

XENBUS: Device with no driver: device/vbd/2050

drivers/rtc/hctosys.c: unable to open rtc device (rtc0)

Freeing unused kernel memory: 200k freed

Write protecting the kernel read-only data: 981k

Red Hat nash version 6.0.19 starting
Mounting proc filesystem
Mounting sysfs filesystem
Creating /dev
Creating initial device nodes
Setting up hotplug.
Creating block device nodes.
Loading xennet.ko module
netfront: Initialising virtual ethernet driver.

netfront: device eth0 has flipping receive path.

Loading xenblk.ko module
xen-vbd: registered block device major 8

 sdb: unknown partition table

Loading ehci-hcd.ko module
Loading ohci-hcd.ko module
Loading uhci-hcd.ko module
USB Universal Host Controller Interface driver v3.0

Loading mbcache.ko module
Loading jbd.ko module
Loading ext3.ko module
Creating root device.
Mounting root filesystem.
kjournald starting.  Commit interval 5 seconds

EXT3-fs: mounted filesystem with ordered data mode.

Setting up other filesystems.
Setting up new root fs
no fstab.sys, mounting internal defaults
Switching to new root and running init.
unmounting old /dev
unmounting old /proc
unmounting old /sys

INIT: version 2.86 booting

		Welcome to  CentOS release 5.5 (Final)
		Press 'I' to enter interactive startup.
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.
Setting clock : Sat Oct 23 23:12:22 EDT 2010 [  OK  ]

Starting udev: [  OK  ]

Setting hostname localhost.localdomain:  [  OK  ]

No devices found
Setting up Logical Volume Management: File descriptor 7 (/sys/kernel/hotplug) leaked on lvm.static invocation. Parent PID 208: /bin/bash
[  OK  ]

Checking filesystems
Checking all file systems.
[  OK  ]

Remounting root filesystem in read-write mode:  [  OK  ]

Mounting local filesystems:  [  OK  ]

Enabling local filesystem quotas:  [  OK  ]

Enabling /etc/fstab swaps:  [  OK  ]

INIT: Entering runlevel: 4

Entering non-interactive startup
Applying Intel CPU microcode update: [FAILED]

Starting background readahead: [  OK  ]

Checking for hardware changes [  OK  ]

Bringing up loopback interface:  [  OK  ]

Bringing up interface eth0:  
Determining IP information for eth0... done.
[  OK  ]

Starting auditd: [  OK  ]

Starting getsshkey:    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

100   386  100   386    0     0  12132      0 --:--:-- --:--:-- --:--:-- 12132
100   386  100   386    0     0  12064      0 --:--:-- --:--:-- --:--:--     0
got ssh-key.
[  OK  ]

Starting syslog-ng: [  OK  ]

Starting system message bus: [  OK  ]

Mounting other filesystems:  [  OK  ]

Starting PC/SC smart card daemon (pcscd): [  OK  ]

Starting HAL daemon: [  OK  ]

Starting sshd: [  OK  ]

Starting cups: [  OK  ]

Starting sendmail: [  OK  ]

Starting sm-client: [  OK  ]

curl: (22) The requested URL returned error: 404
Starting crond: [  OK  ]

Starting process accounting:  [  OK  ]

Starting xfs: [  OK  ]

Starting atd: [  OK  ]
[  OK  ]

Starting jexec:  Starting jexec services[  OK  ]

Starting Avahi daemon... [  OK  ]


CentOS release 5.5 (Final)
Kernel 2.6.21.7-2.fc8xen on an x86_64

ip-10-122-107-28 login:






STOP AND RESTART BUT FAILED TO BOOT PROPERLY:

SYSTEM LOG:


Linux version 2.6.21.7-2.fc8xen (mockbuild@xenbuilder4.fedora.phx.redhat.com) (gcc version 4.1.2 20070925 (Red Hat 4.1.2-33)) #1 SMP Fri Feb 15 12:34:28 EST 2008

Command line:  root=/dev/sdb ro 4

BIOS-provided physical RAM map:

 Xen: 0000000000000000 - 0000000026f00000 (usable)

end_pfn_map = 159488

Zone PFN ranges:

  DMA             0 ->   159488

  DMA32      159488 ->   159488

  Normal     159488 ->   159488

early_node_map[1] active PFN ranges

    0:        0 ->   159488

No mptable found.

PERCPU: Allocating 26496 bytes of per cpu data

Built 1 zonelists.  Total pages: 157308

Kernel command line:  root=/dev/sdb ro 4

Initializing CPU#0

PID hash table entries: 4096 (order: 12, 32768 bytes)

Xen reported: 2659.998 MHz processor.

Console: colour dummy device 80x25

Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)

Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)

Software IO TLB disabled

Memory: 604028k/637952k available (2265k kernel code, 25036k reserved, 1351k data, 200k init)

Calibrating delay using timer specific routine.. 5336.84 BogoMIPS (lpj=2668423)

Security Framework v1.0.0 initialized

SELinux:  Initializing.

selinux_register_security:  Registering secondary module capability

Capability LSM initialized as secondary

Mount-cache hash table entries: 256

CPU: L1 I cache: 32K, L1 D cache: 32K

CPU: L2 cache: 6144K

CPU: Physical Processor ID: 0

CPU: Processor Core ID: 2

SMP alternatives: switching to UP code

Freeing SMP alternatives: 28k freed

Brought up 1 CPUs

NET: Registered protocol family 16

Brought up 1 CPUs

PCI: Fatal: No config space access function found

PCI: setting up Xen PCI frontend stub

ACPI: Interpreter disabled.

Linux Plug and Play Support v0.97 (c) Adam Belay

pnp: PnP ACPI: disabled

xen_mem: Initialising balloon driver.

usbcore: registered new interface driver usbfs

usbcore: registered new interface driver hub

usbcore: registered new device driver usb

PCI: System does not support PCI

PCI: System does not support PCI

NetLabel: Initializing

NetLabel:  domain hash size = 128

NetLabel:  protocols = UNLABELED CIPSOv4

NetLabel:  unlabeled traffic allowed by default

NET: Registered protocol family 2

IP route cache hash table entries: 32768 (order: 6, 262144 bytes)

TCP established hash table entries: 131072 (order: 9, 3145728 bytes)

TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)

TCP: Hash tables configured (established 131072 bind 65536)

TCP reno registered

checking if image is initramfs... it is

Freeing initrd memory: 7520k freed

audit: initializing netlink socket (disabled)

audit(1287885538.373:1): initialized

VFS: Disk quotas dquot_6.5.1

Dquot-cache hash table entries: 512 (order 0, 4096 bytes)

ksign: Installing public key data

Loading keyring

io scheduler noop registered

io scheduler anticipatory registered

io scheduler deadline registered

io scheduler cfq registered (default)

pci_hotplug: PCI Hot Plug PCI Core version: 0.5

rtc: IRQ 8 is not free.

Non-volatile memory driver v1.2

Linux agpgart interface v0.102 (c) Dave Jones

RAMDISK driver initialized: 16 RAM disks of 16384K size 4096 blocksize

input: Macintosh mouse button emulation as /class/input/input0

Xen virtual console successfully installed as xvc0

Linux version 2.6.21.7-2.fc8xen (mockbuild@xenbuilder4.fedora.phx.redhat.com) (gcc version 4.1.2 20070925 (Red Hat 4.1.2-33)) #1 SMP Fri Feb 15 12:34:28 EST 2008

Command line:  root=/dev/sdb ro 4

BIOS-provided physical RAM map:

 Xen: 0000000000000000 - 0000000026f00000 (usable)

end_pfn_map = 159488

Zone PFN ranges:

  DMA             0 ->   159488

  DMA32      159488 ->   159488

  Normal     159488 ->   159488

early_node_map[1] active PFN ranges

    0:        0 ->   159488

No mptable found.

PERCPU: Allocating 26496 bytes of per cpu data

Built 1 zonelists.  Total pages: 157308

Kernel command line:  root=/dev/sdb ro 4

Initializing CPU#0

PID hash table entries: 4096 (order: 12, 32768 bytes)

Xen reported: 2659.998 MHz processor.

Console: colour dummy device 80x25

Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)

Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)

Software IO TLB disabled

Memory: 604028k/637952k available (2265k kernel code, 25036k reserved, 1351k data, 200k init)

Calibrating delay using timer specific routine.. 5336.84 BogoMIPS (lpj=2668423)

Security Framework v1.0.0 initialized

SELinux:  Initializing.

selinux_register_security:  Registering secondary module capability

Capability LSM initialized as secondary

Mount-cache hash table entries: 256

CPU: L1 I cache: 32K, L1 D cache: 32K

CPU: L2 cache: 6144K

CPU: Physical Processor ID: 0

CPU: Processor Core ID: 2

SMP alternatives: switching to UP code

Freeing SMP alternatives: 28k freed

Brought up 1 CPUs

NET: Registered protocol family 16

Brought up 1 CPUs

PCI: Fatal: No config space access function found

PCI: setting up Xen PCI frontend stub

ACPI: Interpreter disabled.

Linux Plug and Play Support v0.97 (c) Adam Belay

pnp: PnP ACPI: disabled

xen_mem: Initialising balloon driver.

usbcore: registered new interface driver usbfs

usbcore: registered new interface driver hub

usbcore: registered new device driver usb

PCI: System does not support PCI

PCI: System does not support PCI

NetLabel: Initializing

NetLabel:  domain hash size = 128

NetLabel:  protocols = UNLABELED CIPSOv4

NetLabel:  unlabeled traffic allowed by default

NET: Registered protocol family 2

IP route cache hash table entries: 32768 (order: 6, 262144 bytes)

TCP established hash table entries: 131072 (order: 9, 3145728 bytes)

TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)

TCP: Hash tables configured (established 131072 bind 65536)

TCP reno registered

checking if image is initramfs... it is

Freeing initrd memory: 7520k freed

audit: initializing netlink socket (disabled)

audit(1287885538.373:1): initialized

VFS: Disk quotas dquot_6.5.1

Dquot-cache hash table entries: 512 (order 0, 4096 bytes)

ksign: Installing public key data

Loading keyring

io scheduler noop registered

io scheduler anticipatory registered

io scheduler deadline registered

io scheduler cfq registered (default)

pci_hotplug: PCI Hot Plug PCI Core version: 0.5

rtc: IRQ 8 is not free.

Non-volatile memory driver v1.2

Linux agpgart interface v0.102 (c) Dave Jones

RAMDISK driver initialized: 16 RAM disks of 16384K size 4096 blocksize

input: Macintosh mouse button emulation as /class/input/input0

Xen virtual console successfully installed as xvc0

Event-channel device installed.

usbcore: registered new interface driver hiddev

usbcore: registered new interface driver usbhid

drivers/usb/input/hid-core.c: v2.6:USB HID core driver

PNP: No PS/2 controller found. Probing ports directly.

i8042.c: No controller found.

mice: PS/2 mouse device common for all mice

TCP bic registered

Initializing XFRM netlink socket

NET: Registered protocol family 1

NET: Registered protocol family 17

XENBUS: Device with no driver: device/vif/0

XENBUS: Device with no driver: device/vbd/2064

XENBUS: Device with no driver: device/vbd/2050

drivers/rtc/hctosys.c: unable to open rtc device (rtc0)

Freeing unused kernel memory: 200k freed

Write protecting the kernel read-only data: 981k

Red Hat nash version 6.0.19 starting
Mounting proc filesystem
Mounting sysfs filesystem
Creating /dev
Creating initial device nodes
Setting up hotplug.
Creating block device nodes.
Loading xennet.ko module
netfront: Initialising virtual ethernet driver.

netfront: device eth0 has flipping receive path.

Loading xenblk.ko module
xen-vbd: registered block device major 8

 sdb: unknown partition table

Loading ehci-hcd.ko module
Loading ohci-hcd.ko module
Loading uhci-hcd.ko module
USB Universal Host Controller Interface driver v3.0

Loading mbcache.ko module
Loading jbd.ko module
Loading ext3.ko module
Creating root device.
Mounting root filesystem.
kjournald starting.  Commit interval 5 seconds

EXT3-fs: mounted filesystem with ordered data mode.

Setting up other filesystems.
Setting up new root fs
no fstab.sys, mounting internal defaults
Switching to new root and running init.
unmounting old /dev
unmounting old /proc
unmounting old /sys

INIT: version 2.86 booting

		Welcome to  CentOS release 5.5 (Final)
		Press 'I' to enter interactive startup.
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.
Setting clock : Sat Oct 23 21:59:07 EDT 2010 [  OK  ]

Starting udev: [  OK  ]

Setting hostname localhost.localdomain:  [  OK  ]

No devices found
Setting up Logical Volume Management: File descriptor 7 (/sys/kernel/hotplug) leaked on lvm.static invocation. Parent PID 208: /bin/bash
[  OK  ]

Checking filesystems
WARNING: bad format on line 4 of /etc/fstab
Checking all file systems.
[  OK  ]

Remounting root filesystem in read-write mode:  [  OK  ]

Mounting local filesystems:  mount: mount point system> does not exist
mount: mount point <type> does not exist
mount: mount point  does not exist
[FAILED]

Enabling local filesystem quotas:  [  OK  ]

Enabling /etc/fstab swaps:  [  OK  ]

INIT: Entering runlevel: 4

Entering non-interactive startup
Applying Intel CPU microcode update: [FAILED]

Starting background readahead: [  OK  ]

Checking for hardware changes [  OK  ]

Bringing up loopback interface:  [  OK  ]

Bringing up interface eth0:  
Determining IP information for eth0... done.
[  OK  ]

Starting auditd: [  OK  ]

Starting getsshkey:    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

100   386  100   386    0     0  12585      0 --:--:-- --:--:-- --:--:-- 12585
100   386  100   386    0     0  12512      0 --:--:-- --:--:-- --:--:--     0
got ssh-key.
[  OK  ]

Starting syslog-ng: [  OK  ]

Starting system message bus: [  OK  ]

Mounting other filesystems:  mount: mount point system> does not exist
mount: mount point <type> does not exist
mount: mount point  does not exist
[FAILED]

Starting PC/SC smart card daemon (pcscd): [  OK  ]

Starting HAL daemon: [  OK  ]

Starting sshd: [  OK  ]

Starting cups: [  OK  ]

Starting sendmail: [  OK  ]

Starting sm-client: [  OK  ]

curl: (22) The requested URL returned error: 404
Starting crond: [  OK  ]

Starting process accounting:  [  OK  ]

Starting xfs: [  OK  ]

Starting atd: [  OK  ]
[  OK  ]

Starting jexec:  Starting jexec services[  OK  ]

Starting Avahi daemon... [  OK  ]


CentOS release 5.5 (Final)
Kernel 2.6.21.7-2.fc8xen on an x86_64

ip-10-122-6-226 login:
Close








PREVIOUS FAILED BOOT SYSTEM LOG

   Linux version 2.6.21.7-2.fc8xen (mockbuild@xenbuilder4.fedora.phx.redhat.com) (gcc version 4.1.2 20070925 (Red Hat 4.1.2-33)) #1 SMP Fri Feb 15 12:34:28 EST 2008

Command line:  root=/dev/sdb ro 4

BIOS-provided physical RAM map:

 Xen: 0000000000000000 - 0000000026f00000 (usable)

end_pfn_map = 159488

Zone PFN ranges:

  DMA             0 ->   159488

  DMA32      159488 ->   159488

  Normal     159488 ->   159488

early_node_map[1] active PFN ranges

    0:        0 ->   159488

No mptable found.

PERCPU: Allocating 26496 bytes of per cpu data

Built 1 zonelists.  Total pages: 157308

Kernel command line:  root=/dev/sdb ro 4

Initializing CPU#0

PID hash table entries: 4096 (order: 12, 32768 bytes)

Xen reported: 2659.994 MHz processor.

Console: colour dummy device 80x25

Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)

Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)

Software IO TLB disabled

Memory: 604028k/637952k available (2265k kernel code, 25036k reserved, 1351k data, 200k init)

Calibrating delay using timer specific routine.. 5326.94 BogoMIPS (lpj=2663472)

Security Framework v1.0.0 initialized

SELinux:  Initializing.

selinux_register_security:  Registering secondary module capability

Capability LSM initialized as secondary

Mount-cache hash table entries: 256

CPU: L1 I cache: 32K, L1 D cache: 32K

CPU: L2 cache: 6144K

CPU: Physical Processor ID: 0

CPU: Processor Core ID: 2

SMP alternatives: switching to UP code

Freeing SMP alternatives: 28k freed

Brought up 1 CPUs

NET: Registered protocol family 16

Brought up 1 CPUs

PCI: Fatal: No config space access function found

PCI: setting up Xen PCI frontend stub

ACPI: Interpreter disabled.

Linux Plug and Play Support v0.97 (c) Adam Belay

pnp: PnP ACPI: disabled

xen_mem: Initialising balloon driver.

usbcore: registered new interface driver usbfs

usbcore: registered new interface driver hub

usbcore: registered new device driver usb

PCI: System does not support PCI

PCI: System does not support PCI

NetLabel: Initializing

NetLabel:  domain hash size = 128

NetLabel:  protocols = UNLABELED CIPSOv4

NetLabel:  unlabeled traffic allowed by default

NET: Registered protocol family 2

IP route cache hash table entries: 32768 (order: 6, 262144 bytes)

TCP established hash table entries: 131072 (order: 9, 3145728 bytes)

TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)

TCP: Hash tables configured (established 131072 bind 65536)

TCP reno registered

checking if image is initramfs... it is

Freeing initrd memory: 7520k freed

audit: initializing netlink socket (disabled)

audit(1287636580.601:1): initialized

VFS: Disk quotas dquot_6.5.1

Dquot-cache hash table entries: 512 (order 0, 4096 bytes)

ksign: Installing public key data

Loading keyring

io scheduler noop registered

io scheduler anticipatory registered

io scheduler deadline registered

io scheduler cfq registered (default)

pci_hotplug: PCI Hot Plug PCI Core version: 0.5

rtc: IRQ 8 is not free.

Non-volatile memory driver v1.2

Linux agpgart interface v0.102 (c) Dave Jones

RAMDISK driver initialized: 16 RAM disks of 16384K size 4096 blocksize

input: Macintosh mouse button emulation as /class/input/input0

Xen virtual console successfully installed as xvc0

Linux version 2.6.21.7-2.fc8xen (mockbuild@xenbuilder4.fedora.phx.redhat.com) (gcc version 4.1.2 20070925 (Red Hat 4.1.2-33)) #1 SMP Fri Feb 15 12:34:28 EST 2008

Command line:  root=/dev/sdb ro 4

BIOS-provided physical RAM map:

 Xen: 0000000000000000 - 0000000026f00000 (usable)

end_pfn_map = 159488

Zone PFN ranges:

  DMA             0 ->   159488

  DMA32      159488 ->   159488

  Normal     159488 ->   159488

early_node_map[1] active PFN ranges

    0:        0 ->   159488

No mptable found.

PERCPU: Allocating 26496 bytes of per cpu data

Built 1 zonelists.  Total pages: 157308

Kernel command line:  root=/dev/sdb ro 4

Initializing CPU#0

PID hash table entries: 4096 (order: 12, 32768 bytes)

Xen reported: 2659.994 MHz processor.

Console: colour dummy device 80x25

Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)

Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)

Software IO TLB disabled

Memory: 604028k/637952k available (2265k kernel code, 25036k reserved, 1351k data, 200k init)

Calibrating delay using timer specific routine.. 5326.94 BogoMIPS (lpj=2663472)

Security Framework v1.0.0 initialized

SELinux:  Initializing.

selinux_register_security:  Registering secondary module capability

Capability LSM initialized as secondary

Mount-cache hash table entries: 256

CPU: L1 I cache: 32K, L1 D cache: 32K

CPU: L2 cache: 6144K

CPU: Physical Processor ID: 0

CPU: Processor Core ID: 2

SMP alternatives: switching to UP code

Freeing SMP alternatives: 28k freed

Brought up 1 CPUs

NET: Registered protocol family 16

Brought up 1 CPUs

PCI: Fatal: No config space access function found

PCI: setting up Xen PCI frontend stub

ACPI: Interpreter disabled.

Linux Plug and Play Support v0.97 (c) Adam Belay

pnp: PnP ACPI: disabled

xen_mem: Initialising balloon driver.

usbcore: registered new interface driver usbfs

usbcore: registered new interface driver hub

usbcore: registered new device driver usb

PCI: System does not support PCI

PCI: System does not support PCI

NetLabel: Initializing

NetLabel:  domain hash size = 128

NetLabel:  protocols = UNLABELED CIPSOv4

NetLabel:  unlabeled traffic allowed by default

NET: Registered protocol family 2

IP route cache hash table entries: 32768 (order: 6, 262144 bytes)

TCP established hash table entries: 131072 (order: 9, 3145728 bytes)

TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)

TCP: Hash tables configured (established 131072 bind 65536)

TCP reno registered

checking if image is initramfs... it is

Freeing initrd memory: 7520k freed

audit: initializing netlink socket (disabled)

audit(1287636580.601:1): initialized

VFS: Disk quotas dquot_6.5.1

Dquot-cache hash table entries: 512 (order 0, 4096 bytes)

ksign: Installing public key data

Loading keyring

io scheduler noop registered

io scheduler anticipatory registered

io scheduler deadline registered

io scheduler cfq registered (default)

pci_hotplug: PCI Hot Plug PCI Core version: 0.5

rtc: IRQ 8 is not free.

Non-volatile memory driver v1.2

Linux agpgart interface v0.102 (c) Dave Jones

RAMDISK driver initialized: 16 RAM disks of 16384K size 4096 blocksize

input: Macintosh mouse button emulation as /class/input/input0

Xen virtual console successfully installed as xvc0

Event-channel device installed.

usbcore: registered new interface driver hiddev

usbcore: registered new interface driver usbhid

drivers/usb/input/hid-core.c: v2.6:USB HID core driver

PNP: No PS/2 controller found. Probing ports directly.

i8042.c: No controller found.

mice: PS/2 mouse device common for all mice

TCP bic registered

Initializing XFRM netlink socket

NET: Registered protocol family 1

NET: Registered protocol family 17

XENBUS: Device with no driver: device/vif/0

XENBUS: Device with no driver: device/vbd/2064

XENBUS: Device with no driver: device/vbd/2128

drivers/rtc/hctosys.c: unable to open rtc device (rtc0)

Freeing unused kernel memory: 200k freed

Write protecting the kernel read-only data: 981k

Red Hat nash version 6.0.19 starting
Mounting proc filesystem
Mounting sysfs filesystem
Creating /dev
Creating initial device nodes
Setting up hotplug.
Creating block device nodes.
Loading xennet.ko module
netfront: Initialising virtual ethernet driver.

netfront: device eth0 has flipping receive path.

Loading xenblk.ko module
xen-vbd: registered block device major 8

 sdb: unknown partition table

 sdf: unknown partition table

Loading ehci-hcd.ko module
Loading ohci-hcd.ko module
Loading uhci-hcd.ko module
USB Universal Host Controller Interface driver v3.0

Loading mbcache.ko module
Loading jbd.ko module
Loading ext3.ko module
Creating root device.
Mounting root filesystem.
EXT3-fs: INFO: recovery required on readonly filesystem.

EXT3-fs: write access will be enabled during recovery.

kjournald starting.  Commit interval 5 seconds

EXT3-fs: recovery complete.

EXT3-fs: mounted filesystem with ordered data mode.

Setting up other filesystems.
Setting up new root fs
no fstab.sys, mounting internal defaults
Switching to new root and running init.
unmounting old /dev
unmounting old /proc
unmounting old /sys

INIT: version 2.86 booting

		Welcome to  CentOS release 5.5 (Final)
		Press 'I' to enter interactive startup.
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access method.
Setting clock : Thu Oct 21 00:49:47 EDT 2010 [  OK  ]

Starting udev: [  OK  ]

Setting hostname localhost.localdomain:  [  OK  ]

No devices found
Setting up Logical Volume Management: File descriptor 7 (/sys/kernel/hotplug) leaked on lvm.static invocation. Parent PID 208: /bin/bash
[  OK  ]

Checking filesystems
WARNING: bad format on line 4 of /etc/fstab
Checking all file systems.
[  OK  ]

Remounting root filesystem in read-write mode:  [  OK  ]

Mounting local filesystems:  mount: mount point system> does not exist
mount: mount point <type> does not exist
mount: mount point  does not exist
mount: special device /dev/sda2 does not exist
[FAILED]

Enabling local filesystem quotas:  [  OK  ]

Enabling /etc/fstab swaps:  [  OK  ]

INIT: Entering runlevel: 4

Entering non-interactive startup
Applying Intel CPU microcode update: [FAILED]

Starting background readahead: [  OK  ]

Checking for hardware changes [  OK  ]

Bringing up loopback interface:  [  OK  ]

Bringing up interface eth0:  
Determining IP information for eth0... done.
[  OK  ]

Starting auditd: [  OK  ]

Starting getsshkey:    % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

100   386  100   386    0     0    156      0  0:00:02  0:00:02 --:--:--   156
100   386  100   386    0     0    156      0  0:00:02  0:00:02 --:--:--     0
got ssh-key.
[  OK  ]

Starting syslog-ng: [  OK  ]

Starting system message bus: [  OK  ]

Mounting other filesystems:  mount: mount point system> does not exist
mount: mount point <type> does not exist
mount: mount point  does not exist
mount: special device /dev/sda2 does not exist
[FAILED]

Starting PC/SC smart card daemon (pcscd): [  OK  ]

Starting HAL daemon: [  OK  ]

Starting sshd: [  OK  ]

Starting cups: [  OK  ]

Starting sendmail: [  OK  ]

Starting sm-client: [  OK  ]

curl: (22) The requested URL returned error: 404
Starting crond: [  OK  ]

Starting process accounting:  [  OK  ]

Starting xfs: [  OK  ]

Starting atd: [  OK  ]
[  OK  ]

Starting jexec:  Starting jexec services[  OK  ]

Starting Avahi daemon... [  OK  ]


CentOS release 5.5 (Final)
Kernel 2.6.21.7-2.fc8xen on an x86_64

ip-10-122-55-109 login:






</entry>



