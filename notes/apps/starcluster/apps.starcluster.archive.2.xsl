starcluster.archive.2

<entry [Thu 2011:04:21 23:24:05 EST] INSTALLED nfs-server AND nfs-client ON UBUNTU>

https://help.ubuntu.com/community/SettingUpNFSHowTo

**** HTML PAGE SAVED TO: apps/ubuntu/nfs


1. INSTALL NFS4 SERVER

RUN WITH -q QUIET and -y YES TO ALL, AND DISABLE BLUE whiptail CONFIGURATION SCREEN

export DEBIAN_FRONTEND=noninteractive
apt-get  -q -y install nfs-kernel-server
    OK

2. ADD TO NFS CONFIG FILE:

/etc/default/nfs-kernel-server

THIS LINE:

-RPCMOUNTDOPTS="--port 32767 --manage-gids"    


3. START SERVER:

/etc/init.d/nfs-kernel-server restart


4. INSTALL NFS4 CLIENT (SHOULD BE ALREADY INSTALLED)

export DEBIAN_FRONTEND=noninteractive
apt-get  -q -y apt-get install nfs-common

    nfs-common is already the newest version.
    nfs-common set to manually installed.





ADD TO CONFIG FILE:

emacs /etc/default/nfs-common

THESE LINES:

NEED_IDMAPD=yes
NEED_GSSD=no # no is default

because we want UID/GUID to be mapped from names. This way, server and client do not need the users to share same UID/GUID. Remember that mount/fstab defaults to NFSv3, so "mount -t nfs4" is necessary to make this work.



After setting up /etc/exports, export the shares:

sudo exportfs -ra
You'll want to do this command whenever /etc/exports is modified.





Portmap Lockdown OPTIONAL

Add the following line to /etc/hosts.deny:

portmap mountd nfsd statd lockd rquotad : ALL
By blocking all clients first, only clients in /etc/hosts.allow below will be allowed to access the server.

Now add the following line to /etc/hosts.allow:

portmap mountd nfsd statd lockd rquotad : list of IP addresses
Where the "list of IP addresses" string is, you need to make a list of IP addresses that consists of the server and all clients. These have to be IP addresses because of a limitation in portmap (it doesn't like hostnames). Note that if you have NIS set up, just add these to the same line.


Install NFS Server

sudo apt-get install portmap nfs-kernel-server



</entry>

<entry [Wed 2011:04:20 20:51:43 EST] RAN LOAD BALANCER ON UBUNTU>

1. COPY /nethome/admin/.starcluster FROM AQUARIUS-7:

scp -pr -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem \
root@ec2-75-101-214-196.compute-1.amazonaws.com:/nethome/admin/.starcluster \
/nethome/admin

VERIFY 'ENABLE_EXPERIMENTAL=True' IN CONFIG FILE [global] SECTION:
    [global]
    DEFAULT_TEMPLATE=smallcluster
    ENABLE_EXPERIMENTAL=True


2. COPY /nethome/admin/.keypairs FROM AQUARIUS-7:

scp -pr -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem \
root@ec2-75-101-214-196.compute-1.amazonaws.com:/nethome/admin/.keypairs \
/nethome/admin


3. START CLUSTER:

/data/apps/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/config \
start smallcluster 



4. MOUNT /data AND /nethome ON CLUSTER

/home/syoung/0.6/bin/apps/cluster/starcluster.pl start \
--username admin \
--cluster smallcluster \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--keyname admi\
n-key \
--nodes 2 \
--maxnodes 5 \
--minnodes 1 \
--outputdir /nethome/admin/agua/Project1/Workflow1 \
--sources /data,/nethome \
--mounts /data,/nethome \
--devs /dev/sdh,/dev/sdi \
--configfile /nethome/admin/.starcluster/config



#4. START LOAD BALANCER:
#
#/data/apps/starcluster/110202bal/bin/starcluster \
#-c /nethome/admin/.starcluster/config \
#bal smallcluster -m 5 -n 1 -i 30 -w 300 -s 30 
#
#    ...
#    >>> Starting cluster took 4.896 mins
#
#    WHERE:
#
#    -i polling interval (secs)
#    -w max wait time before adding node (secs)
#    -s cluster stabilisation time to wait (secs)
#    --plot plot usage data
#


5. CONNECT TO master:

/data/apps/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/config \
sshmaster smallcluster


COPIED /root/.ssh/id_rsa FROM AQUARIUS-7:

cat .ssh/id_rsa 
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


6. MONITOR CLUSTER:

starcluster -c /nethome/admin/.starcluster/config listclusters 

    -----------------------------------------------
    smallcluster (security group: @sc-smallcluster)
    -----------------------------------------------
    Launch time: 2011-04-21 02:05:02
    Uptime: 00:00:59
    Zone: us-east-1a
    Keypair: id_rsa-admin-key
    EBS volumes: N/A
    Cluster nodes:
         master pending i-6e0a4401 
        node001 pending i-6c0a4403 
    Total nodes: 2




7. SHUT DOWN CLUSTER:

If this cluster uses EBS instances then the 'stop' command
above will put all nodes into a 'stopped' state. The cluster
may then be restarted at a later time, without losing data,
by passing the -x option to the 'start' command.


starcluster \
-c /nethome/admin/.starcluster/config \
stop smallcluster


To completely terminate an EBS cluster:

starcluster terminate smallcluster




QUESTIONS:


1. WILL IT FIND plugins/automount.py IF I USE -c TO SPECIFY CONFIG FILE LOCATION?

YES - SEE
apps.starcluster...
[Mon 2011:05:02 11:27:33 EST]
SET UP SHARES USING automount.py

    
</entry>
<entry [Tue 2011:04:19 13:09:03 EST] INSTALLED STARCLUSTER ON hp UBUNTU 10.10>


1. CONFIRMED PYTHON 2.6.6

PYTHON 2.6.6 IS AVAILABLE BY DEFAULT ON UBUNTU 10.10:

python -V

    Python 2.6.6


2. INSTALL SETUPTOOLS FOR PYTHON 2.6

mkdir -p /data/apps/python/modules/setuptools
cd /data/apps/python/modules/setuptools
wget http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz#md5=7df2a529a074f613b509fb44feefe74e
tar xvfz *
cd setup*
python setup.py install 

    OK
    
    Adding setuptools 0.6c11 to easy-install.pth file
    Installing easy_install script to /usr/local/bin
    Installing easy_install-2.6 script to /usr/local/bin
    
    Installed /usr/local/lib/python2.6/dist-packages/setuptools-0.6c11-py2.6.egg
    Processing dependencies for setuptools==0.6c11
    Finished processing dependencies for setuptools==0.6c11

<!--    ...
    Installed /usr/local/lib/python2.6/site-packages/setuptools-0.6c11-py2.6.egg
    Processing dependencies for setuptools==0.6c11
    Finished processing dependencies for setuptools==0.6c11
-->


3. INSTALL BOTO 2.a02

mkdir -p /root/base/apps/starcluster/dev/0.91.2/dependencies/boto/2.0a2
cd /root/base/apps/starcluster/dev/0.91.2/dependencies/boto/2.0a2
wget http://boto.googlecode.com/files/boto-2.0a2.tar.gz
tar xvfz *
cd /root/base/apps/starcluster/dev/0.91.2/dependencies/boto/2.0a2/boto-2.0a2

python setup.py install

    OK
    
    Installed /usr/local/lib/python2.6/dist-packages/boto-2.0a2-py2.6.egg
    Processing dependencies for boto==2.0a2
    Finished processing dependencies for boto==2.0a2


CONFIRM THAT BOTO WAS INSTALLED TO dist-packages:

cd /usr/local/lib/python2.6/dist-packages/    
ll boto-2.0a2-py2.6.egg/boto/vpc/vpngateway.pyc
    -rw-r--r-- 1 root staff 3021 2011-04-19 13:15 boto-2.0a2-py2.6.egg/boto/vpc/vpngateway.pyc

date
    Tue Apr 19 13:17:50 EDT 2011


    OK


4. INSTALLED STARCLUSTER LATEST TRUNK VERSION

mkdir -p /data/apps/starcluster
cd /data/apps/starcluster
git clone https://github.com/jtriley/StarCluster.git
cd StarCluster
git describe --tags
    StarCluster-0.91-316-g3b5e56c
cd ..
mv StarCluster 0.91-316


UPDATE CONF FILE WITH STARCLUSTER LOCATION:

STARCLUSTER             /data/apps/starcluster/0.91-316

python setup.py install 

    OK
    
    ...
    Installed /usr/local/lib/python2.6/dist-packages/boto-2.0b4-py2.6.egg
    ...   
    Installed /usr/local/lib/python2.6/dist-packages/paramiko-1.7.6-py2.6.egg
    ...
    Searching for pycrypto==2.0.1
    Best match: pycrypto 2.0.1
    Adding pycrypto 2.0.1 to easy-install.pth file

    Using /usr/lib/python2.6/dist-packages
    Finished processing dependencies for StarCluster==0.9999


5. INSTALLED LOAD BALANCER

THE LATEST VERSION (110202bal)

mkdir -p /data/apps/aq7
cd /data/apps/aq7
scp -r -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem \
root@ec2-75-101-214-196.compute-1.amazonaws.com:/root/base/apps ./


    
</entry>
<entry [Tue 2011:04:19 13:04:37 EST] LIST OF CURRENT STARCLUSTER AMIs>

CHECK starcluster listimages

E.G.:

Mon Dec 20 21:08:12 EST 2010
Compute/GPU instance type:
ami-12b6477b

This AMI is currently not compatible with StarCluster 0.91.2, however, 
the instances are a bit pricey ($2.10/hr for GPU) so if you just want to 
play around with the new GPU instances you're probably better off 
launching a single instance from the AWS management console. If anyone 
    
</entry>
<entry [Mon 2011:04:18 12:29:14 EST] DOWNLOADED starcluster 64-BIT AMI iso IMAGE>

http://web.mit.edu/stardev/cluster/downloads/starcluster-base-ubuntu-10.04-x86_64-iso.html

Downloading starcluster-base-ubuntu-10.04-x86_64-rc1.iso.gz
Your download should begin in a few moments. If you have trouble downloading the file, please try this link.

Using the ISO Image
After you've downloaded and extracted starcluster-base-ubuntu-10.04-x86_64-rc1.iso.gz, run the following commands to login to the iso image:

$ sudo -i

(enter root password)

$ mkdir -p /mnt/starcluster-base-ubuntu-10.04-x86_64

$ mount -o loop /path/to/starcluster-base-ubuntu-10.04-x86_64-rc1.iso /mnt/starcluster-base-ubuntu-10.04-x86_64

$ mount -t proc none /mnt/starcluster-base-ubuntu-10.04-x86_64/proc

$ mount -o bind /dev /mnt/starcluster-base-ubuntu-10.04-x86_64/dev

$ cp -L /etc/resolv.conf /mnt/starcluster-base-ubuntu-10.04-x86_64/etc/resolv.conf

$ grep -v rootfs /proc/mounts > /mnt/starcluster-base-ubuntu-10.04-x86_64/etc/mtab

$ chroot /mnt/starcluster-base-ubuntu-10.04-x86_64 /bin/bash


If you'd rather not have to run these commands by hand (or remember them for that matter), you can download a the chroot_iso.py script to do this for you (SEE BELOW). To use this:

$ sudo -i

(enter root password)

$ mkdir -p /mnt/starcluster-base-ubutu-10.04-x86_64

$ python /path/to/chroot_iso.py /path/to/starcluster-base-ubuntu-10.04-x86_64-rc1.iso /mnt/starcluster-base-ubuntu-10.04-x86_64


emacs chroot_iso.py
    
    #!/usr/bin/env python
    ##################################################################
    # StarCluster (http://web.mit.edu/starcluster)                   #
    #                                                                #
    # Mount a Linux OS iso file to a directory and chroot into it    #
    #                                                                #
    # The iso file must contain a full Linux operating system inside #
    ##################################################################
    
    import os
    import sys
    
    if os.getuid() != 0:
        print 'chroot_iso.py must be run as root'
        sys.exit(1)
    
    if len(sys.argv) != 3:
        print 'usage: %s < iso_file> < target_dir>' % sys.argv[0]
        sys.exit(1)
    
    ISO_FILE=sys.argv[1]
    TARGET_DIR=sys.argv[2]
    
    if not os.path.isfile(ISO_FILE):
        print 'iso file %s does not exist or is not a regular file' % ISO_FILE
        sys.exit(1)
    
    if not os.path.isdir(TARGET_DIR):
        print 'target directory %s does not exist' % TARGET_DIR
        sys.exit(1)
    
    CHROOT_PROC = os.path.join(TARGET_DIR, 'proc')
    CHROOT_DEV = os.path.join(TARGET_DIR, 'dev')
    CHROOT_RESOLV = os.path.join(TARGET_DIR, 'etc','resolv.conf')
    CHROOT_MTAB = os.path.join(TARGET_DIR, 'etc','mtab')
    
    os.system('mount -o loop %s %s' % (ISO_FILE,TARGET_DIR))
    os.system('mount -t proc none %s' % CHROOT_PROC)
    os.system('mount -o bind /dev %s' % CHROOT_DEV)
    os.system('cp /etc/resolv.conf %s' % CHROOT_RESOLV)
    os.system('grep -v rootfs /proc/mounts > %s' % CHROOT_MTAB)
    os.system('chroot %s /bin/bash' % TARGET_DIR)
    os.system('umount %s' % CHROOT_PROC)
    os.system('umount %s' % CHROOT_DEV)
    os.system('rm %s' % CHROOT_RESOLV)
    os.system('rm %s' % CHROOT_MTAB)

    
</entry>
<entry [Tue Feb  8 22:46:16 EST 2011] LOAD BALANCER - FIXED 'ZeroDivisionError: float division' ERROR>
  
IN THE LATEST VERSION (110202bal) OF THE LOAD BALANCER BRANCH:

  File "build/bdist.linux-x86_64/egg/starcluster/progressbar.py", line 261, in percentage
    return self.currval * 100.0 / self.maxval
ZeroDivisionError: float division


BY ADDING A 30 SECOND PAUSE IN cluster.py BEFORE LOOKING FOR RUNNING INSTANCES:

LINE 1039, cluster.py:


        # ADDED SLEEP TO AVOID CRASH JUST AFTER FIRST CHECK OF RUNNING INSTANCES
        # >>> Waiting for all nodes to be in a 'running' state...
        # WHEN INSTANCES ARE NOT YET AVAILABLE
        time.sleep(interval)


    OK


FULL ERROR OUTPUT:

starcluster start smallcluster
StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

>>> Using default cluster template: smallcluster
>>> AutoMount.__init__    Running AutoMount plugin.
>>> Validating cluster template settings...
>>> Cluster template settings are valid
>>> Starting cluster...
>>> Launching a 2-node cluster...
>>> Launching master (ami: ami-a5c42dcc, type: m1.large)
>>> Launching node001 (ami: ami-a5c42dcc, type: m1.large)
>>> Creating security group @sc-smallcluster...
Reservation:r-0664ab6b
>>> Waiting for cluster to come up... (updating every 30s)
>>> Waiting for all nodes to be in a 'running' state...
Traceback (most recent call last):
  File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 152, in main
    sc.execute(args)
  File "build/bdist.linux-x86_64/egg/starcluster/commands/start.py", line 195, in execute
    scluster.start(create=create, create_only=create_only, validate=False)
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 1191, in start
    return self._start(create, create_only)
  File "build/bdist.linux-x86_64/egg/starcluster/utils.py", line 69, in wrap_f
    res = func(*arg, **kargs)
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 1209, in _start
    self._setup_cluster()
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 1223, in _setup_cluster
    self.wait_for_cluster()
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 1041, in wait_for_cluster
    pbar.update(0)
  File "build/bdist.linux-x86_64/egg/starcluster/progressbar.py", line 312, in update
    self.prev_percentage = self.percentage()
  File "build/bdist.linux-x86_64/egg/starcluster/progressbar.py", line 261, in percentage
    return self.currval * 100.0 / self.maxval
ZeroDivisionError: float division

cli.py:173 - ERROR - Oops! Looks like you've found a bug in StarCluster
cli.py:174 - ERROR - Debug file written to: /tmp/starcluster-debug-root.log
cli.py:175 - ERROR - Look for lines starting with PID: 3104
cli.py:177 - ERROR - Please submit this file, minus any private information,
cli.py:178 - ERROR - to starcluster@mit.edu


    
</entry>
<entry [Tue Feb  8 22:45:16 EST 2011] CREATED PLUGIN TO AUTOMATICALLY MOUNT /data AND /nethome ON NEW NODE>

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


LAUNCH DEVELOPMENT SHELL AND TEST PLUGIN

starcluster shell


CONFIRM cfg OBJECT HAS PLUGIN INFO:

cfg.get_plugin('auto

mount')

    {'__name__': 'automount',
     'head_ip': 'ip-10-127-158-202.ec2.internal',
     'setup_class': 'automount.NfsShares'}
     


 
RUN PLUGIN:


clus = cluster.ClusterManager(cfg)

cluster.ClusterManager.run_plugin(clus, 'automount', 'smallcluster')



IPYTHON SHELL DETAILS:

* The reload command does a 'deep' reload of a module: changes made to the
  module since you imported will actually be available without having to exit.
  



DEBUG automount PLUGIN


PID: 6970 cluster.py:1280 - INFO - Running plugin automount
PID: 6970 automount.py:26 - DEBUG - AutoMount.run    Starting AutoMount...
PID: 6970 automount.py:27 - INFO - AutoMount.run    self.head_ip ip-10-127-158-202.ec2.internal
PID: 6970 automount.py:33 - INFO - AutoMount.run    Mounting NFS shares on master
PID: 6970 automount.py:45 - INFO - 
PID: 6970 automount.py:46 - INFO - AutoMount._mount    node.private_dns_name: ip-10-124-246-12.ec2.internal
PID: 6970 automount.py:47 - INFO - AutoMount._mount    self.head_ip: ip-10-127-158-202.ec2.internal
PID: 6970 automount.py:55 - INFO - AutoMount._mount    cmd echo '' >> /etc/fstab
PID: 6970 automount.py:55 - INFO - AutoMount._mount    cmd echo 'ip-10-127-158-202.ec2.internal:/data  /data nfs nfsvers=3,defaults 0 0' >> /etc/fstab
PID: 6970 automount.py:55 - INFO - AutoMount._mount    cmd echo 'ip-10-127-158-202.ec2.internal:/nethome  /nethome nfs nfsvers=3,defaults 0 0' >> /etc/fstab
PID: 6970 automount.py:66 - INFO - 
PID: 6970 automount.py:68 - INFO - AutoMount._mountNfs    cmd: mount -t nfs ip-10-127-158-202.ec2.internal:/data /data
PID: 6970 ssh.py:369 - ERROR - command 'mount -t nfs ip-10-127-158-202.ec2.internal:/data /data' failed with status 32
PID: 6970 ssh.py:375 - DEBUG - mount.nfs: access denied by server while mounting ip-10-127-158-202.ec2.internal:/data
PID: 6970 ssh.py:369 - ERROR - command 'ls mountpoint' failed with status 2
PID: 6970 ssh.py:375 - DEBUG - ls: cannot access mountpoint: No such file or directory
PID: 6970 automount.py:76 - INFO - AutoMount._mountNfs    file_list BEFORE break: ['ls: cannot access mountpoint: No such file or directory']
PID: 6970 automount.py:66 - INFO - 
PID: 6970 automount.py:68 - INFO - AutoMount._mountNfs    cmd: mount -t nfs ip-10-127-158-202.ec2.internal:/nethome /nethome
PID: 6970 ssh.py:369 - ERROR - command 'mount -t nfs ip-10-127-158-202.ec2.internal:/nethome /nethome' failed with status 32
PID: 6970 ssh.py:375 - DEBUG - mount.nfs: access denied by server while mounting ip-10-127-158-202.ec2.internal:/nethome
PID: 6970 ssh.py:369 - ERROR - command 'ls mountpoint' failed with status 2
PID: 6970 ssh.py:375 - DEBUG - ls: cannot access mountpoint: No such file or directory
PID: 6970 automount.py:76 - INFO - AutoMount._mountNfs    file_list BEFORE break: ['ls: cannot access mountpoint: No such file or directory']


NOTES
-----

OPEN FILE AND REGEX
-------------------

import os
import re

put, get = os.popen4("du -s /Users/*")

for user in get.readlines():
       if re.match(r'^\d',user): print user,




</entry>
<entry [Wed Feb  9 02:36:17 EST 2011] EXAMPLE PLUGIN SECTION IN config>


# Sections starting with "plugin" define a custom python class which can
# perform additional configurations to StarCluster's default routines. These
# plugins can be assigned to a cluster template to customize the setup
# procedure when starting a cluster from this template
# (see the commented PLUGINS setting in the 'smallcluster' template above)
# Below is an example of defining a plugin called 'myplugin':

# [plugin myplugin]
# myplugin module either lives in ~/.starcluster/plugins or is
# in your PYTHONPATH
# SETUP_CLASS = myplugin.SetupClass
# extra settings are passed as arguments to your plugin:
# SOME_PARAM_FOR_MY_PLUGIN = 1
# SOME_OTHER_PARAM = 2



</entry>
<entry [Wed Feb  9 02:36:17 EST 2011] PACKAGE LOADER PLUGIN EXAMPLE>

https://github.com/godber/StarClusterPlugins/blob/master/plugins/package_loader/README.rst

PackageLoader Details
Author: Austin Godber < godber 'at' uberhip.com>

PackageLoader will check for the file /home/.starcluster-packages and then load the files recorded there. In order for this to work, the user must only install packages on the cluster using the associated cluster-install utility. This is an apt-get wrapper that will install the requested packages on all nodes and then records them in the appropriate place.

PackageLoader Usage
WARNING - There are currently issues with how this is implemented. The main problems being that when the plugin runs it upgrades any old packages while it is installing the missing packages.

Until I actually get this packaged as a Python module, you can just drop the packages.py into your ~/.starclusters/plugins directory and then add a plugin section to your starcluster config file as shown here:

[plugin packageloader]
setup_class = packages.PackageLoader
and then in the clusters you want to add:

PLUGINS = packageloader
Then copy the cluster-install script to the master node. When installing packages, do so on the master, as root, with this script. For example:

# cluster-install r-recommended ack-grep




# Copyright 2010 Austin Godber < godber@uberhip.com>
#
# This program is distributed under the terms of the Lesser GNU General Public
# License

from starcluster.clustersetup import ClusterSetup
from starcluster.logger import log
import os.path

class PackageLoader(ClusterSetup):
    """
    Loads a list of packages out of the /home/.starcluster-packages
    file.  This file is a dselect package list and can be managed manually.
    The utility ``cluster-install`` is provided to automatically manage this
    file while also installing the packages on all nodes.  This plugin assumes
    that /home/ is an EBS volume.

    Warning: This will upgrade any packages that are out of date.  So you might
    end up with slightly different builds of packages.
    """
    def __init__(self):
        log.debug('Running PackageLoader plugin.')
    def run(self, nodes, master, user, user_shell, volumes):
        pkgfile = '/home/.starcluster-packages'
        mconn = master.ssh
        # Test for the package file on the master node
        if mconn.path_exists(pkgfile):
            log.info("[PackageLoader] Package file found at: %s" % pkgfile)
            for node in nodes:
                log.info("[PackageLoader] Installing packages on %s" % node.alias)
                node.ssh.execute('dpkg --set-selections < ' + pkgfile)
                node.ssh.execute('apt-get update && apt-get -y dselect-upgrade')
        else:
            log.info("[PackageLoader] No package file found at: %s" % pkgfile)


</entry>

<entry [Wed Feb  9 02:34:17 EST 2011] FIXED CALL TO qconf ON MASTER FROM HEAD IN StarCluster.pm>

FIX SGE_QMASTER_PORT INCORRECTLY SET TO 6444 ON MASTER IMAGE WHEREAS IT'S SET AT 63231 IN THE common/settings.sh FILE:

cat /opt/sge6/default/common/settings.sh

    SGE_CELL=default; export SGE_CELL
    SGE_CLUSTER_NAME=starcluster; export SGE_CLUSTER_NAME
    SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT
    SGE_EXECD_PORT=63232; export SGE_EXECD_PORT
    ...


PROBLEM:

ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-241-66.ec2.internal "export SGE_ROOT=/opt/sge6; /opt/sge6/bin/lx24-amd64/qconf -de ip-10-124-241-66.ec2.internal; "

    error: commlib error: got select error (Connection refused)
    ERROR: unable to send message to qmaster using port 6444 on host "ip-10-124-241-66.ec2.internal": got send error


SOLUTION:

ADDED 'export ...' TO SSH COMMAND:

ssh -o StrictHostKeyChecking=no -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-124-241-66.ec2.internal "export SGE_ROOT=/opt/sge6; export SGE_QMASTER_PORT=63231; /opt/sge6/bin/lx24-amd64/qconf -de ip-10-124-241-66.ec2.internal; "

    Host object "ip-10-124-241-66.ec2.internal" is still referenced in cluster queue "all.q".


</entry>

<entry [Mon Feb  7 02:58:54 EST 2011] TEST LOAD BALANCER WITH BOWTIE ALIGNMENT>

START STARCLUSTER:

starcluster bal smallcluster -m 5 -n 1 -i 30 -w 300 -s 30 

    WHERE:
    
    -i polling interval (secs)
    -w max wait time before adding node (secs)
    -s cluster stabilisation time to wait (secs)
    --plot plot usage data


RUN BOWTIE COMMAND:

/cluster/data/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt \
--matefiles /aquarius/nethome/admin/.agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt \
--species human \
--distance 200 \
--label bowtie-1 \
--outputdir /aquarius/nethome/admin/.agua/Project1/Workflow1 \
--reference /aquarius/nethome/data/sequences/human/hg19/bowtie/chr22 \
--params "--seedlen 32" \
--reads 100000 \
--queue all.q \
--tempdir /tmp \
--clean


</entry>

<entry [Mon Feb  7 02:44:54 EST 2011] STARCLUSTERS ELASTIC LOAD BALANCING - RUN INSTRUCTIONS>

1. DOWNLOAD LATEST DEVELOPMENT VERSION WITH GIT

mkdir -p /root/base/apps/starcluster/110206
cd /root/base/apps/starcluster/110206
git clone git://github.com/jtriley/StarCluster.git

    OK


2. REPLACE LINE 547 IN starcluster/cluster.py TO AVOID THIS ERROR:
cli.py:156 - ERROR - failed to load cluster receipt: Incorrect padding

# "base64.b64decode" should have been "base64.b64encode"
#            compressed_data = base64.b64decode(self.cluster_group.description)
            compressed_data = base64.b64encode(self.cluster_group.description)


3. INSTALL STARCLUSTER

cd StarCluster
python -Vst
    Python 2.6.6

python setup.py install

    Installed /usr/local/lib/python2.6/site-packages/StarCluster-0.9999-py2.6.egg
    Processing dependencies for StarCluster==0.9999
    Searching for boto==2.0b3
    Reading http://pypi.python.org/simple/boto/
    Reading http://code.google.com/p/boto/
    Reading http://code.google.com/p/boto
    Best match: boto 2.0b3
    Downloading http://boto.googlecode.com/files/boto-2.0b3.tar.gz
    Processing boto-2.0b3.tar.gz
    Running boto-2.0b3/setup.py -q bdist_egg --dist-dir /tmp/easy_install-H3Vbdm/boto-2.0b3/egg-dist-tmp-ImLX0m
    zip_safe flag not set; analyzing archive contents...
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
    
    Installed /usr/local/lib/python2.6/site-packages/boto-2.0b3-py2.6.egg
    Searching for paramiko==1.7.6
    Best match: paramiko 1.7.6
    Processing paramiko-1.7.6-py2.6.egg
    paramiko 1.7.6 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.6/site-packages/paramiko-1.7.6-py2.6.egg
    Searching for pycrypto==2.3
    Best match: pycrypto 2.3
    Processing pycrypto-2.3-py2.6-linux-x86_64.egg
    pycrypto 2.3 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.6/site-packages/pycrypto-2.3-py2.6-linux-x86_64.egg
    Finished processing dependencies for StarCluster==0.9999


After this is complete, you will need to setup the configuration file:

starcluster help


5. ADD 'ENABLE_EXPERIMENTAL=True' TO CONFIG FILE [global] SECTION

SO IT LOOKS LIKE THIS:

    [global]
    DEFAULT_TEMPLATE=smallcluster
    ENABLE_EXPERIMENTAL=True



6. START UP CLUSTER

cd /root/base/apps/starcluster/110206/StarCluster/bin

/root/base/apps/starcluster/110206/StarCluster/bin/starcluster \
-c /nethome/admin/.starcluster/config \
start smallcluster 

</entry>

<entry [Mon Feb  7 02:59:54 EST 2011] RERUN WITH SHORT WAIT TIME AND STABILISATION TIME>

-i polling interval (secs)
-w max wait time before adding node (secs)
-s cluster stabilisation time to wait (secs)

starcluster bal smallcluster -m 5 -n 1 -i 30 -w 30 -s 30

    
    >>> Oldest job is from 2011-02-08 23:50:31. # queued jobs = 5. # hosts = 2.
    >>> Avg job duration = 1801 sec, Avg wait time = 2435 sec.
    >>> A job has been waiting for 747 sec, longer than max 30.
    >>> *** ADDING 1 NODES.
    >>> Launching node(s): node002
    __init__.py:510 - ERROR - Failed to add new host.
    >>> Sleeping, looping again in 60 seconds.


LOG OUTPUT:

PID: 31315 cluster.py:640 - DEBUG - cluster.nodes    updating existing node i-cf412da3 in self._nodes
PID: 31315 cluster.py:659 - DEBUG - cluster.nodes    returning self._nodes = [< Node: master (i-cd412da1)>, < Node: node001 (i-cf412da3)>]
PID: 31315 cluster.py:636 - DEBUG - cluster.nodes    existing nodes: {u'i-cd412da1': < Node: master (i-cd412da1)>, u'i-cf412da3': < Node: node001 (i-cf4\
12da3)>}
PID: 31315 cluster.py:637 - DEBUG - cluster.nodes    self.key_location: None
PID: 31315 cluster.py:640 - DEBUG - cluster.nodes    updating existing node i-cd412da1 in self._nodes
PID: 31315 cluster.py:640 - DEBUG - cluster.nodes    updating existing node i-cf412da3 in self._nodes
PID: 31315 cluster.py:659 - DEBUG - cluster.nodes    returning self._nodes = [< Node: master (i-cd412da1)>, < Node: node001 (i-cf412da3)>]
PID: 31315 cluster.py:751 - DEBUG - Highest node number is 1. choosing 2.
PID: 31315 cluster.py:785 - DEBUG - Adding node(s): ['node002']
PID: 31315 cluster.py:792 - INFO - Launching node(s): node002
PID: 31315 __init__.py:510 - ERROR - Failed to add new host.
PID: 31315 __init__.py:511 - DEBUG - Traceback (most recent call last):
  File "build/bdist.linux-x86_64/egg/starcluster/balancers/sge/__init__.py", line 508, in _eval_add_node
    self._cluster.add_nodes(need_to_add)
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 796, in add_nodes
    count=len(aliases))
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 738, in create_node
    placement_group=placement_group)
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 717, in _run_instances
    placement_group=placement_group)
  File "build/bdist.linux-x86_64/egg/starcluster/awsutils.py", line 295, in run_instances
    placement_group=placement_group)
  File "build/bdist.linux-x86_64/egg/boto/ec2/connection.py", line 566, in run_instances
    return self.get_object('RunInstances', params, Reservation, verb='POST')
  File "build/bdist.linux-x86_64/egg/boto/connection.py", line 663, in get_object
    raise self.ResponseError(response.status, response.reason, body)
EC2ResponseError: EC2ResponseError: 400 Bad Request
< ?xml version="1.0" encoding="UTF-8"?>
< Response>< Errors>< Error>< Code>InvalidAMIID.Malformed< /Code>< Message>Invalid id: "None" (expecting "ami-...")< /Message>< /Error>< /Errors>< RequestID>0e2\
06eaa-1194-4596-be74-96f94fa6f963< /RequestID>< /Response>

PID: 31315 __init__.py:459 - INFO - Sleeping, looping again in 60 seconds.



SOLUTION:

DOWNLOADED LATEST VERSION (Feb 02, 2011) FROM RBANERJEE'S BRANCH ON GITHUB AND LOAD BALANCER WORKS FINE:

starcluster bal smallcluster -m 5 -n 1 -w 100

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    __init__.py:366 - WARNING - wait_time should be >= 300 seconds (it takes ~5 min to launch a new EC2 node)
    >>> Jobstats cache is not full. Pulling full job history.
    >>> Oldest job is from None. # queued jobs = 0. # hosts = 2.
    >>> Avg job duration = 1801 sec, Avg wait time = 3645 sec.
    >>> Cluster change made less than 180 seconds ago (2011-02-09 02:39:49.639701).
    >>> Not changing cluster size until cluster stabilizes.
    >>> Sleeping, looping again in 60 seconds.
    
    >>> Jobstats cache is not full. Pulling full job history.
    >>> Oldest job is from None. # queued jobs = 0. # hosts = 2.
    >>> Avg job duration = 1801 sec, Avg wait time = 3645 sec.
    >>> Cluster change made less than 180 seconds ago (2011-02-09 02:39:49.639701).
    >>> Not changing cluster size until cluster stabilizes.
    >>> Sleeping, looping again in 60 seconds.
    
    ^[[A>>> Jobstats cache is not full. Pulling full job history.
    >>> Oldest job is from 2011-02-09 02:41:05. # queued jobs = 5. # hosts = 2.
    >>> Avg job duration = 1801 sec, Avg wait time = 3645 sec.
    >>> Cluster change made less than 180 seconds ago (2011-02-09 02:39:49.639701).
    >>> Not changing cluster size until cluster stabilizes.
    >>> Sleeping, looping again in 60 seconds.
    
    >>> Jobstats cache is not full. Pulling full job history.
    >>> Oldest job is from 2011-02-09 02:41:05. # queued jobs = 5. # hosts = 2.
    >>> Avg job duration = 1801 sec, Avg wait time = 3645 sec.
    >>> A job has been waiting for 108 sec, longer than max 100.
    >>> *** ADDING 1 NODES at 2011-02-09 02:42:52.871015.
    >>> Launching node(s): node002
    Reservation:r-6222ef0f
    >>> Waiting for node(s) to come up... (updating every 30s)
    >>> Waiting for all nodes to be in a 'running' state...
    3/3 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Waiting for SSH to come up on all nodes...
    3/3 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Configuring hostnames...
    >>> Configuring /etc/hosts on each node
    >>> Configuring NFS...
    >>> Configuring scratch space for user: sgeadmin
    >>> Configuring passwordless ssh for root
    >>> Using existing key: /root/.ssh/id_rsa
    >>> Configuring passwordless ssh for sgeadmin
    >>> Using existing key: /home/sgeadmin/.ssh/id_rsa
    >>> Adding node002 to SGE
    >>> Done adding nodes at 2011-02-09 02:46:04.396382.
    >>> Sleeping, looping again in 60 seconds.



</entry>

<entry [Mon Feb  7 02:57:54 EST 2011] LOAD BALANCER OPTIONS>

starcluster bal -h

    Usage: loadbalance < cluster_tag>
    
        Start the SGE Load Balancer.
    
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



</entry>

<entry [Mon Feb  7 02:56:54 EST 2011] FIXED decode TO encode IN cluster.py>


http://mailman.mit.edu/pipermail/starcluster/2011-February/000596.html
On Fri, Jan 14, 2011 at 1:55 PM, Kyeong Soo (Joseph) Kim
> As you can see, "base64.b64decode" should have been "base64.b64encode" in
> line 547.

# "base64.b64decode" should have been "base64.b64encode"
#            compressed_data = base64.b64decode(self.cluster_group.description)
            compressed_data = base64.b64encode(self.cluster_group.description)


GET THIS ERROR BEFORE FIX:

starcluster -c /nethome/admin/.starcluster/config bal smallcluster -m 5 -n 1

StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

ssh.py:369 - ERROR - command 'source /etc/profile && qhost -xml' failed with status 127
ssh.py:369 - ERROR - command 'source /etc/profile && qstat -q all.q -u "*" -xml' failed with status 127
Traceback (most recent call last):
  File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 152, in main
    sc.execute(args)
  File "build/bdist.linux-x86_64/egg/starcluster/commands/loadbalance.py", line 56, in execute
    lb.run(cluster)
  File "build/bdist.linux-x86_64/egg/starcluster/balancers/sge/__init__.py", line 443, in run
    if self.get_stats() == -1:
  File "build/bdist.linux-x86_64/egg/starcluster/balancers/sge/__init__.py", line 401, in get_stats
    self.stat.parse_qhost(qhostXml)
  File "build/bdist.linux-x86_64/egg/starcluster/balancers/sge/__init__.py", line 41, in parse_qhost
    doc = xml.dom.minidom.parseString(string)
  File "/usr/local/lib/python2.6/xml/dom/minidom.py", line 1928, in parseString
    return expatbuilder.parseString(string)
  File "/usr/local/lib/python2.6/xml/dom/expatbuilder.py", line 940, in parseString
    return builder.parseString(string)
  File "/usr/local/lib/python2.6/xml/dom/expatbuilder.py", line 223, in parseString
    parser.Parse(string, True)
ExpatError: syntax error: line 1, column 0

cli.py:173 - ERROR - Oops! Looks like you've found a bug in StarCluster
cli.py:174 - ERROR - Debug file written to: /tmp/starcluster-debug-root.log
cli.py:175 - ERROR - Look for lines starting with PID: 21550
cli.py:177 - ERROR - Please submit this file, minus any private information,
cli.py:178 - ERROR - to starcluster@mit.edu


AFTER FIX, GET A DIFFERENT ERROR:

starcluster bal smallcluster 

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    cli.py:156 - ERROR - cluster smallcluster is not running


CHECKED /tmp/starcluster-debug-root.log

    ...
    PID: 21613 cluster.py:653 - DEBUG - returning self._nodes = [< Node: master (i-5112733d)>, < \
    Node: node001 (i-5312733f)>]
    PID: 21613 ssh.py:505 - DEBUG - __del__ called
    PID: 21613 cli.py:156 - ERROR - cluster smallcluster is not running



SO IT'S A PROBLEM WITH SSH. TRIED TO CONNECT DIRECTLY TO NODE:


</entry>

<entry [Mon Feb  7 02:55:54 EST 2011] LOAD BALANCER CODE>


MOST OF THE LOAD BALANCING CODE IS IN THESE THREE FILES:

cd /root/base/apps/starcluster/110206
grep -R loadbalance *

    starcluster/balancers/sge/__init__.py:    Visualizer off by default. Start it with "starcluster loadbalance -p tag"

    starcluster/commands/loadbalance.py:    loadbalance < cluster_tag>
    starcluster/commands/loadbalance.py:    names = ['loadbalance', 'bal']
    starcluster/commands/loadbalance.py:            raise exception.ExperimentalFeature("The loadbalance command")

    starcluster/commands/__init__.py:from loadbalance import CmdLoadBalance


ALL PARAMS ARE STORED IN:

starcluster/balancer/sge/__init__.py


ACCIDENTALLY CREATED AN ADDITIONAL SECURITY GROUP BY TRYING TO START LOAD BALANCER ON NON-EXISTENT CLUSTER:

starcluster  -c /nethome/admin/.starcluster/config bal @sc-smallcluster -m 5 -n 1
   
   ...
    >>> Creating security group @sc-@sc-smallcluster...
    cli.py:156 - ERROR - cluster @sc-smallcluster is not running


NOTE: THE '>>> Creating security group' LINE DISAPPEARS WHEN INVOKE THE SAME COMMAND A SECOND TIME

SOLUTION: TERMINATE THE ACCIDENTALLY CREATED CLUSTER

starcluster terminate @sc-smallcluster



</entry>

<entry [Mon Feb  7 02:54:54 EST 2011] LOAD BALANCER DOCUMENTATION>


cd /root/base/apps/starcluster/rbanerjee/StarCluster/docs/sphinx
cat load_balancer.rst 

*********************************
StarCluster Elastic Load Balancer
*********************************

This load balancer grows and shrinks a Sun Grid Engine cluster according to the
length of the cluster's job queue. When the cluster is heavily loaded and 
processing a long job queue, ELB can gradually add more nodes, up to the 
specified max_nodes, to distribute the work and improve throughput. When the queue
becomes empty, ELB can remove idle nodes in order to save money. The cluster
will shrink down to one node (the master), terminating all of the other nodes
as they become idle.

**Goals**

* To increase the size of the cluster up to max_nodes when there is a large queue of waiting jobs
* To decrease the size of the cluster down to 1 when there are no jobs waiting, to save money
* To elastically balance the cluster's load deterministically, predictably, and slowly.

Usage
-----
To use the Elastic Load Balancer, you can start it from the command line:

.. code-block:: none

    starcluster loadbalance cluster_tag

    or

    starcluster bal cluster_tag

This will start the load balancer in an infinite loop. It can be terminated by 
pressing CTRL-C.


Configuration
-------------
At this time, all of the parameters are stored in the file 
starcluster/balancers/sge/__init__.py
with the appropriate descriptions. Before release, those configuration options
will be moved to the standard starcluster configuration file.


Capabilities
------------
There is a polling loop, default is 60 seconds, set in the configuration of the
load balancer. Every 60 seconds, the load balancer will connect to the cluster,
obtain statistics from Sun Grid Engine, and decide what to do about the
job queue. ELB deals only with the queue length and active machines. 

*ELB does not examine the load on any of the hosts.* If we had the ability to migrate jobs
from an overloaded host to an idle host, then we would spend more time looking 
at individual hosts' system load. However, since job migration is out of the scope
of this project and starcluster in general, we do not look at system load.

This diagram illustrates the decisions that ELB will make in each loop:

.. image:: _static/balancer_decision_diagram.jpg

Operation
----------
As mentioned before, the load balancer will loop every 60 seconds, collecting
statistics to make intelligent decisions about when to add nodes. 

**Criteria for Adding a Node**

A node will be added when *all* of the following criteria have been met:

#. There are jobs in the queued waiting (SGE's moniker is 'qw') state
#. The longest queued job has been waiting for more than 15 minutes
#. The number of nodes does not meet or exceed the maximum number of nodes
    set in the configuration file.

A user can set the number of nodes to be added per iteration. For instance, if
the user wanted to add 1 node per iteration, which is standard and a recommended 
practice, they would set the `add_nodes_per_iteration` parameter to 1. If the user 
wanted two nodes to be added per iteration, that parameter should be set to 2, and
the cluster would grow at a faster rate, consequently incurring higher charges from 
Amazon.com. 

**Criteria for Removing a Node**

A node will be removed when *all* of the following criteria have been met:

#. No jobs are in the queued waiting ('qw' state) state
#. The node in question is idle, meaning it is not running an SGE job
#. The node in question is not the master node
#. The node in question has been up for more than 45 minutes past the hour.

Each node in the cluster will be analyzed in turn, and any and all nodes meeting
the above criteria will be terminated in that polling loop. The entire cluster
need not be idle for a node to be terminated: If Node001 is working on a job,
but Node002 is idle and there are no queued waiting jobs, Node002 is a candidate
for termination.

**The 45 Minutes Past the Hour Rule**

Since Amazon charges by the hour, we are assuming that you have already paid for
a full hour of server time. It would be wasteful to turn it off the moment 
it becomes idle. By keeping that node up for 45 minutes, we allow for it to 
complete the maximum workload from the queue, and use 75% of the hour you have 
already paid for. 

Leaving a node up for this amount of time also increases the stability of the 
cluster. It is detrimental to the cluster and wasteful to be continuosly adding 
and removing nodes.

**The Process of Adding a Node**

Adding a new node is a multi-stage process:

#. Use the cluster class to start up a new node of the same instance and AMI as the other slave nodes in the cluster.

#. Wait for that node to come up. Name it with the highest Node # available: If Node001, Node003, and Node005, are started, the next node will be Node006.

#. Set up an /etc/hosts file on each node in the cluster, mapping the new node name to its ip address. 

#. Create a cluster user account and cluster group on the new node.

#. Set up the /etc/exports file, creating the NFS shares for /home and sge on the master, and then exportfs so the shares are open to the slave nodes.

#. Mount the NFS shares on the new node.

#. Configure SGE: inform the master of the new host's address, and inform the new host of the master, and excute the sge commands to establish communications.

**The Process of Removing a Node**

Removing a node is also a multi-stage process:

#. Remove the node from SGE, so that no jobs can be sent to the node while it is in a transition period.
#. Remove the node from the /etc/hosts file on other cluster machines. 
#. Remove the master's nfs export to this soon-to-be-killed node. Call exportfs to cut it off.
#. Terminate the node, sending a terminate command to Amazon through the Boto library.

Because the node is immediately removed from SGE, and it seems like SGE takes about 15 seconds between a qsub
command and a node beginning execution of a job, this makes it very unlikely that a job will be
started on a host as it is going down. There is a very small window of time within which this could happen.


</entry>

<entry [Mon Feb  7 02:53:54 EST 2011] CAN'T DOWNLOAD LOAD BALANCER BY BROWSER>

DOWNLOADED 'LATEST VERSION' BY BROWSER FROM HERE BUT IT DIDN'T HAVE LOADBALANCER:

ON AQUARIUS-7
mkdir -p /root/base/apps/starcluster/0.91.279
cd /root/base/apps/starcluster/0.91.279

DOWNLOAD WITH BROWSER ONTO WINDOWS AND TRANSFER VIA SSH
http://web.mit.edu/stardev/cluster/docs/installation.html#install-development-version-from-github

HAS THIS LINK:

https://github.com/jtriley/StarCluster/zipball/master

DOWNLOADED THIS FILE:

jtriley-StarCluster-StarCluster-0.91-279-g8ef48a3.zip



</entry>

<entry [Mon Feb  7 02:52:54 EST 2011] HOW TO DOWNLOAD jriley TRUNK WITH GIT>


http://web.mit.edu/stardev/cluster/docs/installation.html#install-development-version-from-github

This method requires that you have git installed on your machine. If youre unsure, either use the latest development snapshot as described above, or install the latest stable version from pypi.

git clone git://github.com/jtriley/StarCluster.git

cd StarCluster
sudo python ez_setup.py install
sudo python setup.py install

After this is complete, you will need to setup the configuration file:

starcluster help



</entry>


<entry [Mon Feb  7 02:43:54 EST 2011] PROBLEM: DEVELOPMENT VERSION OF starcluster CAN'T FIND THE CONFIG FILE USING THE -c OPTION>


/root/base/apps/starcluster/110206/StarCluster/bin/starcluster \
-c /nethome/admin/.starcluster/config \
start smallcluster 

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    Traceback (most recent call last):
      File "/root/base/apps/starcluster/110206/StarCluster/bin/starcluster", line 6, in < module>
        cli.main()
      File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 184, in main
      File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 147, in main
      File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 104, in parse_subcommands
      File "build/bdist.linux-x86_64/egg/starcluster/commands/start.py", line 42, in addopts
      File "build/bdist.linux-x86_64/egg/starcluster/config.py", line 496, in load
      File "build/bdist.linux-x86_64/egg/starcluster/config.py", line 410, in _load_section
      File "build/bdist.linux-x86_64/egg/starcluster/config.py", line 232, in _check_required
    starcluster.exception.ConfigError: missing required option aws_access_key_id in section "aws info"

SOLUTION:

COPY THE CONFIG FILE TO /root/.starcluster/config
    
    OK



PROBLEM: AFTER FIXING THE PROBLEM ABOVE, I NOW GET AN AUTHENTICATION ERROR:
    
starcluster start smallcluster 

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    cli.py:156 - ERROR - instance  has no alias


TRIED INSTALLING IN PYTHON2.7 BUT IT GAVE A 'zero length field name in format' ERROR:

cd /root/base/apps/starcluster/110206/

/usr/local/bin/python2.7 setup.py install
    ...
    
export PYTHONPATH=/root/base/apps/starcluster/110206/build/lib/:/usr/local/lib/python2.7/:/usr/local/lib/python2.7/site-packages
export PYTHONHOME=/usr/local
cd /root/base/apps/starcluster/110206/build/lib/starcluster
python cli.py -d -c /root/.starcluster/config listclusters

    Traceback (most recent call last):
      File "./starcluster", line 2, in < module>
        from starcluster import cli
      File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 19, in < module>
      File "build/bdist.linux-x86_64/egg/starcluster/config.py", line 3, in < module>
      File "/usr/local/lib/python2.7/urllib.py", line 1193, in < module>
        _safe_map[c] = c if (i <  128 and c in always_safe) else '%{:02X}'.format(i)
    ValueError: zero length field name in format



GET THE SAME 'has no alias' ERROR WHEN RUN LOAD BALANCER:

./starcluster  -c /nethome/admin/.starcluster/config bal smallcluster
#./starcluster  -c /nethome/admin/.starcluster/config loadbalance smallcluster
    
    bin/starcluster  -c /nethome/admin/.starcluster/config bal smallcluster
    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    cli.py:156 - ERROR - instance  has no alias


WHICH IS REPORTED BY THIS CODE IN node.py:

    @property
    def alias(self):
        """
        Return the alias stored in this node's user data.
        Alias returned as:
            user_data.split('|')[self.ami_launch_index]
        """
        if not self._alias:
            user_data = self.ec2.get_instance_user_data(self.id)
            aliases = user_data.split('|')
            index = self.ami_launch_index
            alias = aliases[index]
            if not alias:
                # TODO: raise exception about old version
                raise exception.BaseException(
                    "instance %s has no alias" % alias)
            self._alias = alias
        return self._alias


TRIED TO START A NEW CLUSTER, BUT STILL GET THIS ERROR:

starcluster start smallcluster
StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

cli.py:156 - ERROR - instance  has no alias


HOWEVER, listpublic WORKS:

starcluster listpublic

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Listing all public StarCluster images...
    
    32bit Images:
    -------------
    [0] ami-8cf913e5 us-east-1 starcluster-base-ubuntu-10.04-x86-rc3
    [1] ami-d1c42db8 us-east-1 starcluster-base-ubuntu-9.10-x86-rc8
    [2] ami-17b15e7e us-east-1 starcluster-base-ubuntu-9.10-x86-rc7
    [3] ami-8f9e71e6 us-east-1 starcluster-base-ubuntu-9.04-x86
    
    64bit Images:
    --------------
    [0] ami-0af31963 us-east-1 starcluster-base-ubuntu-10.04-x86_64-rc1
    [1] ami-a5c42dcc us-east-1 starcluster-base-ubuntu-9.10-x86_64-rc4
    [2] ami-2941ad40 us-east-1 starcluster-base-ubuntu-9.10-x86_64-rc3
    [3] ami-a19e71c8 us-east-1 starcluster-base-ubuntu-9.04-x86_64
    [4] ami-12b6477b us-east-1 starcluster-base-centos-5.4-x86_64-ebs-hvm-gpu-rc2 (HVM-EBS)
    
    total images: 9



DIAGNOSIS:

THE RUNNING smallcluster IS NOT RECOGNISED BY THIS NEW INSTALLATION OF STARCLUSTER.



SOLUTION:

TERMINATE THE OLD CLUSTERS THAT LACK THE 'alias' SLOT IN THEIR node OBJECT




TERMINATED MASTER AND NODE001 INSTANCES MANUALLY IN ELASTICFOX, THEN TRIED listclusters:

cd /root/base/apps/starcluster/0.91.2
bin/starcluster listclusters

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    -----------------------------------------------
    smallcluster (security group: @sc-smallcluster)
    -----------------------------------------------
    Launch time: N/A
    Uptime: N/A
    Zone: N/A
    Keypair: N/A
    EBS volumes: N/A
    Cluster nodes: N/A
    
    -------------------------------------
    masters (security group: @sc-masters)
    -------------------------------------
    Launch time: N/A
    Uptime: N/A
    Zone: N/A
    Keypair: N/A
    EBS volumes: N/A
    Cluster nodes: N/A


NB: MUST TERMINATE smallcluster **AND masters CLUSTER*** BEFORE STARTING A NEW smallcluster

starcluster  -c /nethome/admin/.starcluster/config start smallcluster
    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    cli.py:156 - ERROR - Stopped EBS Cluster 'smallcluster' already exists.
    cli.py:156 - ERROR - 
    cli.py:156 - ERROR - Either choose a different tag name, or start the stopped EBS cluster using:
    cli.py:156 - ERROR - 
    cli.py:156 - ERROR -   $ starcluster start smallcluster -x
    cli.py:156 - ERROR - 
    cli.py:156 - ERROR - Another option is to terminate the existing EBS Cluster using:
    cli.py:156 - ERROR - 
    cli.py:156 - ERROR -   $ starcluster terminate smallcluster
    cli.py:156 - ERROR - 
    cli.py:156 - ERROR - NOTE: Terminating an EBS cluster will destroy all volumes backing the nodes.


starcluster terminate smallcluster

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    Terminate cluster smallcluster (y/n)? y
    >>> Removing @sc-smallcluster security group

starcluster listclusters

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    -------------------------------------
    masters (security group: @sc-masters)
    -------------------------------------
    Launch time: N/A
    Uptime: N/A
    Zone: N/A
    Keypair: N/A
    EBS volumes: N/A
    Cluster nodes: N/A
    
    cli.py:156 - ERROR - cluster @sc-smallcluster does not exist
    starcluster listclusters

starcluster terminate masters

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    Terminate cluster masters (y/n)? y
    >>> Removing @sc-masters security group



NOW START smallcluster AND RUN LOAD BALANCER

starcluster  -c /nethome/admin/.starcluster/config start smallcluster

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 2-node cluster...
    >>> Launching master (ami: ami-a5c42dcc, type: m1.large)
    >>> Launching node001 (ami: ami-a5c42dcc, type: m1.large)
    >>> Creating security group @sc-smallcluster...
    Reservation:r-6e11d703
    >>> Waiting for cluster to come up... (updating every 30s)
    >>> Waiting for all nodes to be in a 'running' state...
    0/2 |                                                                               |   0%  
    2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Waiting for SSH to come up on all nodes...
    2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> The master node is ec2-50-17-20-70.compute-1.amazonaws.com
    >>> Setting up the cluster...
    >>> Configuring hostnames...
    >>> Creating cluster user: sgeadmin (uid: 1001, gid: 1001)
    >>> Configuring scratch space for user: sgeadmin
    >>> Configuring /etc/hosts on each node
    >>> Configuring NFS...
    >>> Configuring passwordless ssh for root
    >>> Configuring passwordless ssh for sgeadmin
    >>> Installing Sun Grid Engine...
    >>> 
    
    The cluster has been started and configured.
    Login to the master node as root by running:
    
        $ starcluster sshmaster smallcluster
    
    When you are finished using the cluster, run:
    
        $ starcluster stop smallcluster
    
    to shutdown the cluster and stop paying for service.
    
    If this cluster uses EBS instances then the 'stop' command
    above will put all nodes into a 'stopped' state. The cluster
    may then be restarted at a later time, without losing data,
    by passing the -x option to the 'start' command.
    
    To completely terminate an EBS cluster:
    
        $ starcluster terminate smallcluster
    
    >>> Starting cluster took 3.216 mins


starcluster listclusters

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    -----------------------------------------------
    smallcluster (security group: @sc-smallcluster)
    -----------------------------------------------
    Launch time: 2011-02-07 13:06:37
    Uptime: 00:07:42
    Zone: us-east-1a
    Keypair: id_rsa-admin-key
    EBS volumes: N/A
    Cluster nodes:
         master running i-5112733d ec2-50-16-107-213.compute-1.amazonaws.com 
        node001 running i-5312733f ec2-75-101-220-132.compute-1.amazonaws.com 
    Total nodes: 2


BUT SECOND STARTUP OF smallcluster FAILED:



>>> Using default cluster template: smallcluster
>>> Validating cluster template settings...
>>> Cluster template settings are valid
>>> Starting cluster...
>>> Launching a 2-node cluster...
>>> Launching master (ami: ami-a5c42dcc, type: m1.large)
>>> Launching node001 (ami: ami-a5c42dcc, type: m1.large)
>>> Creating security group @sc-smallcluster...
Reservation:r-fe61a793
>>> Waiting for cluster to come up... (updating every 30s)
>>> Waiting for all nodes to be in a 'running' state...
Traceback (most recent call last):
  File "build/bdist.linux-x86_64/egg/starcluster/cli.py", line 152, in main
    sc.execute(args)
  File "build/bdist.linux-x86_64/egg/starcluster/commands/start.py", line 195, in execute
    scluster.start(create=create, create_only=create_only, validate=False)
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 1195, in start
    return self._start(create, create_only)
  File "build/bdist.linux-x86_64/egg/starcluster/utils.py", line 69, in wrap_f
    res = func(*arg, **kargs)
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 1213, in _start
    self._setup_cluster()
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 1227, in _setup_cluster
    self.wait_for_cluster()
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 1045, in wait_for_cluster
    pbar.update(0)
  File "build/bdist.linux-x86_64/egg/starcluster/progressbar.py", line 312, in update
    self.prev_percentage = self.percentage()
  File "build/bdist.linux-x86_64/egg/starcluster/progressbar.py", line 261, in percentage
    return self.currval * 100.0 / self.maxval
ZeroDivisionError: float division

cli.py:173 - ERROR - Oops! Looks like you've found a bug in StarCluster
cli.py:174 - ERROR - Debug file written to: /tmp/starcluster-debug-root.log
cli.py:175 - ERROR - Look for lines starting with PID: 21702
cli.py:177 - ERROR - Please submit this file, minus any private information,
cli.py:178 - ERROR - to starcluster@mit.edu



EVEN SO, TRIED RUNNING LOAD BALANCER:
#### starcluster bal smallcluster -m < MAX_NODES you want> -n < MIN_NODES you want>

starcluster -c /nethome/admin/.starcluster/config bal smallcluster -m 5 -n 1

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    *** HANGS ***

    cli.py:156 - ERROR - cluster smallcluster is not running


starcluster listclusters

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    -----------------------------------------------
    smallcluster (security group: @sc-smallcluster)
    -----------------------------------------------
    Launch time: 2011-02-07 12:48:54
    Uptime: 00:09:09
    Zone: us-east-1a
    Keypair: id_rsa-admin-key
    EBS volumes: N/A
    Cluster nodes:
         master running i-9b3e5ff7 ec2-50-17-20-70.compute-1.amazonaws.com 
        node001 running i-953e5ff9 ec2-67-202-10-108.compute-1.amazonaws.com 
    Total nodes: 2

</entry>

<entry [Wed 2011:04:20 21:08:52 EST] FIXED ERROR: Identity file None not accessible>
    
    
PROBLEM: CONNECT TO CLUSTER DOESN'T WORK:
starcluster sshmaster smallcluster

    Warning: Identity file None not accessible: No such file or directory.
    Permission denied (publickey).


SOLUTION: COPIED KEYFILE TO AND SET PERMISSIONS ON ~/.ssh/id_rsa TO 600 AND

emacs /nethome/admin/.starcluster/config

    ...
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key
    ...


cp /nethome/admin/.starcluster/id_rsa-admin-key ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa



CAN NOW LOG IN TO MASTER ALTHOUGH I STILL GET THE WARNING 'Identity file None not accessible':

starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster

    Warning: Identity file None not accessible: No such file or directory.
    
    The authenticity of host 'ec2-50-17-18-24.compute-1.amazonaws.com (10.252.30.255)' can't be established.
    RSA key fingerprint is 86:d6:fe:0e:88:b5:59:4f:63:c2:1f:2b:ef:f6:52:43.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'ec2-50-17-18-24.compute-1.amazonaws.com,10.252.30.255' (RSA) to the list of known hosts.
    Linux domU-12-31-38-00-0F-F1 2.6.31-302-ec2 #7-Ubuntu SMP Tue Oct 13 19:55:22 UTC 2009 x86_64
    **********************************************************
    ** StarCluster - Ubuntu 9.10 Karmic AMI (alestic based) **
    **********************************************************
    ...    


CAN ALSO SSH INTO node001 BUT WITH SAME WARNING:

starcluster sshnode smallcluster node001

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    *** Warning: Identity file None not accessible: No such file or directory. ***
    
    The authenticity of host 'ec2-184-72-90-20.compute-1.amazonaws.com (10.122.242.180)' can't be established.
    RSA key fingerprint is 57:ee:89:f4:b8:d8:2a:ee:23:fa:f6:e8:81:7c:ce:42.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added 'ec2-184-72-90-20.compute-1.amazonaws.com,10.122.242.180' (RSA) to the list of known hosts.
    Linux ip-10-122-242-180 2.6.31-302-ec2 #7-Ubuntu SMP Tue Oct 13 19:55:22 UTC 2009 x86_64
    **********************************************************
    ** StarCluster - Ubuntu 9.10 Karmic AMI (alestic based) **
    **********************************************************
    ...


TRIED TO SSH MANUALLY

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-184-72-90-20.compute-1.amazonaws.com

    OK!
    
    Linux ip-10-122-242-180 2.6.31-302-ec2 #7-Ubuntu SMP Tue Oct 13 19:55:22 UTC 2009 x86_64
    **********************************************************
    ** StarCluster - Ubuntu 9.10 Karmic AMI (alestic based) **
    **********************************************************

ssh root@ec2-184-72-90-20.compute-1.amazonaws.com

    OK

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-50-17-18-24.compute-1.amazonaws.com

    OK
    
ssh -o StrictHostKeyChecking=no root@ec2-50-17-18-24.compute-1.amazonaws.com
    
    OK
    

... AND NO PROMPT APPEARED, E.G.:

    The authenticity of host 'ec2-50-17-18-24.compute-1.amazonaws.com (10.252.30.255)' can't be established.
    RSA key fingerprint is 86:d6:fe:0e:88:b5:59:4f:63:c2:1f:2b:ef:f6:52:43.
    Are you sure you want to continue connecting (yes/no)?

    
    Warning: Permanently added 'ec2-50-17-18-24.compute-1.amazonaws.com,10.252.30.255' (RSA) to the list of known hosts.
    Permission denied (publickey).

ssh root@ec2-50-17-18-24.compute-1.amazonaws.com



Mon Feb  7 14:27:16 EST 2011

PID: 21676 config.py:490 - DEBUG - Loading config
PID: 21676 config.py:107 - DEBUG - Loading file: /root/.starcluster/config
PID: 21676 awsutils.py:54 - DEBUG - creating self._conn w/ connection_authenticator kwargs = {'path': '/', 'region': None, 'port': None, 'is_secure': True}
PID: 21676 cluster.py:636 - DEBUG - existing nodes: {}
PID: 21676 cluster.py:644 - DEBUG - adding node i-5112733d to self._nodes list
PID: 21676 cluster.py:644 - DEBUG - adding node i-5312733f to self._nodes list
PID: 21676 cluster.py:653 - DEBUG - returning self._nodes = [< Node: master (i-5112733d)>, < Node: node001 (i-5312733f)>]
PID: 21676 ssh.py:505 - DEBUG - __del__ called
PID: 21676 cli.py:156 - ERROR - cluster smallcluster is not running



HOWEVER, WHEN TRY TO SSH ON master NODE OF smallcluster, I GET A DIFFERENT ERROR:

ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-50-17-18-24.compute-1.amazonaws.com
    Warning: Identity file /nethome/admin/.starcluster/id_rsa-admin-key not accessible: No such file or directory.


DISCOVERED THAT THE self.key_location ENTRY IS BEING LOST BY THE node, FIXED WITH THIS HACK:

LINE 738, node.py:
                                      private_key='/nethome/admin/.starcluster/id_rsa-admin-key')
                                      #private_key=self.key_location)



ALSO, HACKED THE STARTUP SCRIPT TO ADD A 30 SECOND PAUSE BEFORE LOOKING FOR RUNNING INSTANCES:

LINE 1035, cluster.py:


        # ADDED SLEEP TO AVOID CRASH JUST AFTER FIRST CHECK OF RUNNING INSTANCES
        # >>> Waiting for all nodes to be in a 'running' state...
        # WHEN INSTANCES ARE NOT YET AVAILABLE
        time.sleep(interval)


NB: CHECK def nodes IN cluster.py TO MONITOR self.key_location

    @property
    def nodes(self):
        states = ['pending', 'running', 'stopping', 'stopped']
        filters = {'group-id': self._security_group,
                   'instance-state-name': states}
        nodes = self.ec2.get_all_instances(filters=filters)
        existing_nodes = dict(map(lambda x: (x.id, x), self._nodes))
        #log.debug('cluster.nodes    existing nodes: %s' % existing_nodes)
        #log.debug('cluster.nodes    self.key_location: %s' % self.key_location)
        for node in nodes:
            if node.id in existing_nodes:
                #log.debug('cluster.nodes    updating existing node %s in self._nodes' % node.id)
                enode = existing_nodes.get(node.id)
                enode.key_location = self.key_location
                enode.instance = node
            else:
                #log.debug('cluster.nodes    adding node %s to self._nodes list' % node.id)
                #self.key_location = '/nethome/admin/.starcluster/id_rsa-admin-key')
                #log.debug('cluster.nodes    self.key_location: %s ' % self.key_location)

                n = Node(node, self.key_location) 

                #log.debug('cluster.nodes    Created Node n using self.key_location: %s' % self.key_location)
                if n.is_master():
                    self._master = n
                    self._nodes.insert(0, n)
                else:
                    self._nodes.append(n)
        self._nodes = filter(lambda n: n.state in states, self._nodes)
        self._nodes.sort(key=lambda n: n.alias)
        #log.debug('cluster.nodes    returning self._nodes = %s' % self._nodes)
        return self._nodes


</entry>


<entry [Wed 2011:04:21 20:57:42 EST] TEST LOAD BALANCER>


SUMMARY
starcluster start smallcluster
starcluster bal smallcluster -m 5 -n 1

COMMAND OUTPUT

starcluster start smallcluster

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 2-node cluster...
    >>> Launching master (ami: ami-a5c42dcc, type: m1.large)
    >>> Launching node001 (ami: ami-a5c42dcc, type: m1.large)
    >>> Creating security group @sc-smallcluster...
    Reservation:r-7256941f
    >>> Waiting for cluster to come up... (updating every 30s)
    >>> Waiting for all nodes to be in a 'running' state...
    2/2 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Waiting for SSH to come up on all nodes...
    2/2 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> The master node is ec2-50-16-138-225.compute-1.amazonaws.com
    >>> Setting up the cluster...
    >>> Configuring hostnames...
    >>> Creating cluster user: sgeadmin (uid: 1001, gid: 1001)
    >>> Configuring scratch space for user: sgeadmin
    >>> Configuring /etc/hosts on each node
    >>> Configuring NFS...
    >>> Configuring passwordless ssh for root
    >>> Configuring passwordless ssh for sgeadmin
    >>> Installing Sun Grid Engine...
    >>> 
    
    The cluster has been started and configured.
    Login to the master node as root by running:
    
        $ starcluster sshmaster smallcluster
    
    When you are finished using the cluster, run:
    
        $ starcluster stop smallcluster
    
    to shutdown the cluster and stop paying for service.
    
    If this cluster uses EBS instances then the 'stop' command
    above will put all nodes into a 'stopped' state. The cluster
    may then be restarted at a later time, without losing data,
    by passing the -x option to the 'start' command.
    
    To completely terminate an EBS cluster:
    
        $ starcluster terminate smallcluster
    
    >>> Starting cluster took 4.690 mins


starcluster bal smallcluster -m 5 -n 1


    >>> Oldest job is from None. # queued jobs = 0. # hosts = 2.
    >>> Avg job duration = 0 sec, Avg wait time = 0 sec.
    >>> Cluster change made less than 180 seconds ago (2011-02-08 20:52:30.348513).
    >>> Not changing cluster size until cluster stabilizes.
    >>> Sleeping, looping again in 60 seconds.




RUN SLEEP SCRIPT

emacs sleep.sh
#!/bin/bash

TASK_ID=$(expr $SGE_TASK_ID)
ID=${JOB_ID}
echo "TASK_ID: " $TASK_ID
echo "ID: " $ID
echo "JOB_ID: " $JOB_ID
echo "SGE_TASK_ID: " $SGE_TASK_ID

#$ -N sleep
#$ -cwd
#$ -o /root/sleep-out.$JOB_ID.$TASK_ID
#$ -e /root/sleep-err.$JOB_ID.$TASK_ID
#$ -l h_rt=0:30:00

hostname -f 
date

SLEEP=$1;
echo "Doing sleep " $SLEEP " seconds"
sleep $SLEEP;
echo "Completed"


SLEEP ONE HOUR

qsub -t 1-10 sleep.sh 3600




>>> Oldest job is from 2011-02-08 20:54:31. # queued jobs = 5. # hosts = 2.
>>> Avg job duration = 0 sec, Avg wait time = 0 sec.
>>> Sleeping, looping again in 60 seconds.



>>> Oldest job is from 2011-02-08 20:54:31. # queued jobs = 5. # hosts = 2.
>>> Avg job duration = 0 sec, Avg wait time = 0 sec.
>>> A job has been waiting for 1020 sec, longer than max 900.
__init__.py:502 - WARNING - There is a possibility that the job queue is shorter than 10 minutes in duration.
>>> *** ADDING 1 NODES.
>>> Launching node(s): node002
__init__.py:510 - ERROR - Failed to add new host.
>>> Sleeping, looping again in 60 seconds.



LOG FILE SHOWS MORE INFO:

PID: 31016 ssh.py:375 - DEBUG - Tue Feb  8 21:14:33 UTC 2011
PID: 31016 __init__.py:498 - INFO - A job has been waiting for 1202 sec, longer than max 900.
PID: 31016 __init__.py:502 - WARNING - There is a possibility that the job queue is shorter than 10 minutes in duration.
PID: 31016 __init__.py:506 - INFO - *** ADDING 1 NODES.
PID: 31016 cluster.py:636 - DEBUG - cluster.nodes    existing nodes: {u'i-cd412da1': < Node: master (i-cd412da1)>, u'i-cf412da3': < Node: node001 (i-cf4\
12da3)>}
PID: 31016 cluster.py:637 - DEBUG - cluster.nodes    self.key_location: None
PID: 31016 cluster.py:640 - DEBUG - cluster.nodes    updating existing node i-cd412da1 in self._nodes
PID: 31016 cluster.py:640 - DEBUG - cluster.nodes    updating existing node i-cf412da3 in self._nodes
PID: 31016 cluster.py:659 - DEBUG - cluster.nodes    returning self._nodes = [< Node: master (i-cd412da1)>, < Node: node001 (i-cf412da3)>]
PID: 31016 cluster.py:636 - DEBUG - cluster.nodes    existing nodes: {u'i-cd412da1': < Node: master (i-cd412da1)>, u'i-cf412da3': < Node: node001 (i-cf4\
12da3)>}
PID: 31016 cluster.py:637 - DEBUG - cluster.nodes    self.key_location: None
PID: 31016 cluster.py:640 - DEBUG - cluster.nodes    updating existing node i-cd412da1 in self._nodes
PID: 31016 cluster.py:640 - DEBUG - cluster.nodes    updating existing node i-cf412da3 in self._nodes
PID: 31016 cluster.py:659 - DEBUG - cluster.nodes    returning self._nodes = [< Node: master (i-cd412da1)>, < Node: node001 (i-cf412da3)>]
PID: 31016 cluster.py:751 - DEBUG - Highest node number is 1. choosing 2.
PID: 31016 cluster.py:785 - DEBUG - Adding node(s): ['node002']
PID: 31016 cluster.py:792 - INFO - Launching node(s): node002
PID: 31016 __init__.py:510 - ERROR - Failed to add new host.
PID: 31016 __init__.py:511 - DEBUG - Traceback (most recent call last):
  File "build/bdist.linux-x86_64/egg/starcluster/balancers/sge/__init__.py", line 508, in _eval_add_node
    self._cluster.add_nodes(need_to_add)
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 796, in add_nodes
    count=len(aliases))
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 738, in create_node
    placement_group=placement_group)
  File "build/bdist.linux-x86_64/egg/starcluster/cluster.py", line 717, in _run_instances
    placement_group=placement_group)
  File "build/bdist.linux-x86_64/egg/starcluster/awsutils.py", line 295, in run_instances
    placement_group=placement_group)
  File "build/bdist.linux-x86_64/egg/boto/ec2/connection.py", line 566, in run_instances
    return self.get_object('RunInstances', params, Reservation, verb='POST')
  File "build/bdist.linux-x86_64/egg/boto/connection.py", line 663, in get_object
    raise self.ResponseError(response.status, response.reason, body)
EC2ResponseError: EC2ResponseError: 400 Bad Request
< ?xml version="1.0" encoding="UTF-8"?>
< Response>< Errors>< Error>< Code>InvalidAMIID.Malformed< /Code>< Message>Invalid id: "None" (expecting "ami-...")< /Message>< /Error>< /Errors>< RequestID>7b8f9729-7d62-49e8-8136-aa64985964ca< /RequestID>< /Response>

PID: 31016 __init__.py:459 - INFO - Sleeping, looping again in 60 seconds.




</entry>


<entry [Wed 2011:04:20 20:57:42 EST] DOWNLOADED rbanerjee BRANCH WITH GIT>
    

GOT rbanerjee CODE IN BRANCH ON GITHUB
https://github.com/rqbanerjee/StarCluster

mkdir -p /root/base/apps/starcluster/rbanerjee
cd /root/base/apps/starcluster/rbanerjee

DOWNLOAD WITH GIT clone
git clone https://github.com/rqbanerjee/StarCluster.git


cd /root/base/apps/starcluster/rbanerjee/StarCluster
ll 

    drwxr-xr-x 8 root root 4.0K Dec 24 15:23 .git
    -rw-r--r-- 1 root root   93 Dec 24 15:23 .gitignore
    -rw-r--r-- 1 root root  35K Dec 24 15:23 COPYING
    -rw-r--r-- 1 root root 7.5K Dec 24 15:23 COPYING.LESSER
    -rw-r--r-- 1 root root   82 Dec 24 15:23 MANIFEST.in
    -rw-r--r-- 1 root root 4.4K Dec 24 15:23 README.rst
    drwxr-xr-x 2 root root 4.0K Dec 24 15:23 bin
    -rwxr-xr-x 1 root root  212 Dec 24 15:23 check.sh
    -rwxr-xr-x 1 root root  120 Dec 24 15:23 clean.sh
    drwxr-xr-x 2 root root 4.0K Dec 24 15:23 completion
    drwxr-xr-x 4 root root 4.0K Dec 24 15:23 docs
    -rw-r--r-- 1 root root 9.5K Dec 24 15:23 ez_setup.py
    -rw-r--r-- 1 root root 3.7K Dec 24 15:23 setup.py
    drwxr-xr-x 7 root root 4.0K Dec 24 15:23 starcluster
    drwxr-xr-x 2 root root 4.0K Dec 24 15:23 utils





Rajat Banerjee rbanerj at fas.harvard.edu 
Fri Feb 4 16:07:16 EST 2011
Previous message: [StarCluster] Starcluster and elastic load balancing
Next message: [StarCluster] createvolume errors
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
Hi Archie,
I believe you are correct. I can't find the date on which 0.91.2 was cut,
but if it doesn't have the "bal" or "loadbalance", then you're not running
new enough code.

That can be rectified if your admin installs with these directions:
http://web.mit.edu/stardev/cluster/docs/installation.html#install-development-version-from-github

And the result should look something like this:

$ starcluster bal
Leopard libedit detected.
StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster at mit.edu

Usage: loadbalance < cluster_tag>

    Start the SGE Load Balancer.

starcluster: error: please specify a < cluster_tag>

rbanerjee:/opt/pose/core [SVN: /main/core/trunk]
$ starcluster loadbalance
Leopard libedit detected.
StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster at mit.edu

Usage: loadbalance < cluster_tag>

    Start the SGE Load Balancer.

starcluster: error: please specify a < cluster_tag>


Best,
Rajat


On Fri, Feb 4, 2011 at 3:56 PM, Archie Russell < archier at gmail.com> wrote:

> Hi Rajat
>
> My version doesn't have "bal",   does that mean it is not the most recent
> version
> from github?  (our  system administrator installed it and may have missed
> that detail).
>
> Is there a version string to look for?
>
> $ starcluster bal mycluster -m 10 -n 2
> StarCluster - (http://web.mit.edu/starcluster)
> Software Tools for Academics and Researchers (STAR)
> Please submit bug reports to starcluster at mit.edu
>
> Error: invalid command 'bal'
>
>
> $ starcluster --version
> StarCluster - (http://web.mit.edu/starcluster)
> Software Tools for Academics and Researchers (STAR)
> Please submit bug reports to starcluster at mit.edu
>
> 0.91.2
>
>
> -A


    
</entry>
<entry [Wed 2011:04:20 20:59:04 EST] LOAD BALANCER GRAPHS>    

Kyeong Soo (Joseph) Kim kyeongsoo.kim at gmail.com 
Wed Feb 2 06:19:32 EST 2011
Previous message: [StarCluster] issues creating a new AMI from a starcluster AMI
Next message: [StarCluster] help starting up cluster
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
Hi Rajat,

Great thanks for the updates and the new graphs!

You must be quite busy now working on the final copy.
Of course, I do look forward to seeing either version soon.

In the meanwhile, I will try the ELB myself and get back to the list, if
there anything to report.

Regards,
Joseph
--
Kyeong Soo (Joseph) Kim, Ph.D.
Senior Lecturer in Networking
Room 112, Digital Technium
Multidisciplinary Nanotechnology Centre, College of Engineering
Swansea University, Singleton Park, Swansea SA2 8PP, Wales UK
TEL: +44 (0)1792 602024
EMAIL: k.s.kim_at_swansea.ac.uk
HOME: http://iat-hnrl.swan.ac.uk/ (group)
            http://iat-hnrl.swan.ac.uk/~kks/ (personal)


On Tue, Feb 1, 2011 at 4:23 AM, Rajat Banerjee < rbanerj at fas.harvard.edu>wrote:

> Hello Joseph,
> I really appreciate your words. I am pleased that the load balancer will be
> put to good use.
>
> I have written my masters thesis on this topic and it is very near
> completion. The final copy is due within the next two weeks, after which I
> will post a PDF to this list for everyone to view. Due to some onerous
> requirements, the document is over 50 pages. I hope to create an abridged
> version soon.
>
> In the meantime, ELB is fully operational (just like the 2nd death star). I
> hope to clean up the visualizer next week so others can use it. Justin has
> already given me useful suggestions that I simply need to implement.
>
> Here are some graphs that I've been toying with for the thesis experiment:
> http://dl.dropbox.com/u/224960/sc/index.html
>
> Best,
> Rajat
>
>
> On Mon, Jan 31, 2011 at 4:09 AM, Kyeong Soo (Joseph) Kim < 
> kyeongsoo.kim at gmail.com> wrote:
>
>> Hello Rajat,
>>
>> I am very interested in your work on the elastic load balancing; I do
>> remember that you posted some graphs on early results in the past and that
>> you were working on your MSc thesis.
>>
>> In fact, this new feature will be critical for my current research
>> requiring about 3~400 independent simulation runs and I do highly appreciate
>> your great contribution to the StarCluster.
>>
>> By the way, I wonder whether you have published your work in any
>> conferences/journals yet.
>>
>> Regards,
>> Joseph
>> --
>> Kyeong Soo (Joseph) Kim, Ph.D.
>> Senior Lecturer in Networking
>> Room 112, Digital Technium
>> Multidisciplinary Nanotechnology Centre, College of Engineering
>> Swansea University, Singleton Park, Swansea SA2 8PP, Wales UK
>> TEL: +44 (0)1792 602024
>> EMAIL: k.s.kim_at_swansea.ac.uk
>> HOME: http://iat-hnrl.swan.ac.uk/ (group)
>>             http://iat-hnrl.swan.ac.uk/~kks/< http://iat-hnrl.swan.ac.uk/%7Ekks/>(personal)
>>


On 1/28/2011 1:29 PM, Rajat Banerjee wrote:
> Hi Archie,
> Yes, there is ELB built into the latest releases of StarCluster. I wrote it, so feel free to write me (+ the list) with any questions.
>
> The docs on
> http://web.mit.edu/stardev/cluster/docs/index.html
>
> haven't been updated in a while. There is a documentation page on starcluster in the code base, see 
> /starcluster/StarCluster/docs/sphinx/load_balancer.rst
>
> That doc should have all of the information you need, and is readable in plain text.
>
> Typically, this is how I fire up the load balancer:
> starcluster bal < cluster_tag> -m < MAX_NODES you want> -n < MIN_NODES you want>
>
> It will poll the cluster every 60 seconds and make decisions. The decisions are described in load_balancer.rst. There is a visualizer which makes 6 graphs with matplotlib to show you how many nodes are working, how many jobs are running, queued, avg load, etc, but the visualizer still needs a little bit of work.
>
> Hope that helps, and feel free to send back questions.
> Rajat Banerjee
>
>
> On Fri, Jan 28, 2011 at 12:29 PM, < starcluster-request@mit.edu> wrote:
>
>     Send StarCluster mailing list submissions to
>            starcluster@mit.edu
>
>     To subscribe or unsubscribe via the World Wide Web, visit
>            http://mailman.mit.edu/mailman/listinfo/starcluster
>     or, via email, send a message with subject or body 'help' to
>            starcluster-request@mit.edu
>
>     You can reach the person managing the list at
>            starcluster-owner@mit.edu
>
>     When replying, please edit your Subject line so it is more specific
>     than "Re: Contents of StarCluster digest..."
>
>     Today's Topics:
>
>       1. Starcluster and elastic load balancing (Archie Russell)
>
>
>     ---------- Forwarded message ----------
>     From: Archie Russell < archier@gmail.com>
>     To: starcluster@mit.edu
>     Date: Thu, 27 Jan 2011 11:40:00 -0800
>     Subject: [StarCluster] Starcluster and elastic load balancing
>
>     Hi,
>
>     Online it says Starcluster has Elastic Load Balancing built into the latest code
>     version at Github.     How would I go about using this?     How does it work,  e.g.
>     when does it fire up new nodes and when does it shut them down?
>
>     Thanks,
>     Archie
>
>     _______________________________________________
>     StarCluster mailing list
>     StarCluster@mit.edu
>     http://mailman.mit.edu/mailman/listinfo/starcluster
>


</entry>

