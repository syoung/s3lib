starcluster.archive.3


<entry [Mon 2011:05:02 01:04:47 EST] INSTALLED STARCLUSTER ON 8e AND STARTED smallcluster>

COPY LATEST TRUNK AND LOAD BALANCER TO 8e WITH PERMISSIONS PRESERVED (tar -p)

cd /data/apps/starcluster
tar pcvfz starcluster-110202bal.tar.gz 110202bal
tar pcvfz starcluster-0.91-316.tar.gz 0.91-316


cd /data/apps/starcluster
scp -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
starcluster-110202bal.tar.gz  \
root@ec2-50-19-4-224.compute-1.amazonaws.com:/data/starcluster

scp -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
starcluster-0.91-316.tar.gz \
root@ec2-50-19-4-224.compute-1.amazonaws.com:/data/starcluster


COPY /root/.starcluster/plugins DIRECTORY FROM HP TO 8e:

scp -r -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
/root/.starcluster/plugins \
root@ec2-50-19-4-224.compute-1.amazonaws.com:/root/.starcluster


BINARIES WOULD NOT RUN:

/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/config start smallcluster
Traceback (most recent call last):
  File "/data/starcluster/0.91-316/bin/starcluster", line 2, in < module>
    from starcluster import cli
ImportError: No module named starcluster



AND COULD NOT INSTALL WITH --exclude-scripts FLAG:

python setup.py install --exclude-scripts

    usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
       or: setup.py --help [cmd1 cmd2 ...]
       or: setup.py --help-commands
       or: setup.py cmd --help


SO HAD TO INSTALL NORMALLY:

cd /data/starcluster/0.91-316
python setup.py install

    Installed /usr/local/lib/python2.6/dist-packages/pycrypto-2.3-py2.6-linux-x86_64.egg
    Finished processing dependencies for StarCluster==0.9999



ON 8e, RUN STARCLUSTER:

/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/config start smallcluster

    CONFIGURED IPYTHON:
    Important note: the configuration system has changed! The old system is
    still in place, but its setting may be partly overridden by the settings in 
    "~/.ipython/ipy_user_conf.py" config file. Please take a look at the file 
    if some of the new settings bother you.

DIDN'T WORK, GAVE ERROR: 'Plugin class AutoMount does not exist'

 /data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/config start smallcluster

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: smallcluster
    cli.py:177 - ERROR - Plugin class AutoMount does not exist



PARTIAL SUCCESS RUNNING LOAD BALANCER:

/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/config start smallcluster
    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    start.py:180 - ERROR - settings for cluster template "smallcluster" are not valid:
    cli.py:177 - ERROR - Account does not contain a key with keyname = id_rsa-admin-key.



SEEMS THAT 8e DOES NOT HAVE THE id_rsa-admin-key FILE.

ON 8e, DO ec2-describe-keypairs:

KEYPAIR	ec2-keypair1	48:18:33:d1:5a:4b:25:53:01:c6:c0:c9:d3:2a:ac:6c:0e:d1:f4:43
KEYPAIR	aquarius	03:b7:c5:f0:a6:e7:6b:af:3d:8a:68:ff:ec:f1:d6:05
KEYPAIR	id_rsa-jgilbert-key	cc:63:81:5b:c1:6a:00:4b:a8:e8:17:c8:7d:cb:68:4d:01:bf:07:71
KEYPAIR	id_rsa-admin-key	91:89:52:82:51:15:3b:cd:eb:6f:96:97:6e:5a:03:52:b7:5d:f2:23
KEYPAIR	id_rsa-starcluster-1	cb:f9:77:bc:ed:c6:fb:91:3f:a2:12:a5:f0:ea:bc:ae:1a:a7:7c:41
KEYPAIR	agua	0d:d8:03:2c:72:81:68:36:67:41:bf:db:28:a5:f1:33:9e:97:8b:02


SO CHANGED AWS INFO IN admin CONFIG TO JGILBERT'S:

emacs -nw /nethome/admin/.starcluster/config


    [aws info]
    AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
    AWS_SECRET_ACCESS_KEY=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
    AWS_USER_ID=558277860346
    
    [key id_rsa-admin-key]
    KEYNAME=id_rsa-admin-key
    KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key



AND SUCCESSFULLY LAUNCHED A smallcluster:

/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/config start smallcluster

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 2-node cluster...
    >>> Launching a 2-node cluster...
    >>> Creating security group @sc-smallcluster...
    Reservation:r-252eee49
    >>> Waiting for cluster to come up... (updating every 30s)
    >>> Waiting for all nodes to be in a 'running' state...
    2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Waiting for SSH to come up on all nodes...
    2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> The master node is ec2-184-72-151-121.compute-1.amazonaws.com
    >>> Setting up the cluster...
    >>> Configuring hostnames...
    2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Creating cluster user: sgeadmin (uid: 1001, gid: 1001)
    2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Configuring scratch space for user: sgeadmin
    2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Configuring /etc/hosts on each node
    >>> Configuring /etc/hosts for node i-829caaed
    >>> Configuring /etc/hosts for node i-809caaef
    2/2 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Configuring NFS...
    >>> Mounting shares for node node001
    1/1 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> _setup_nfs took 0.075 mins
    >>> Configuring passwordless ssh for root
    >>> Configuring passwordless ssh for sgeadmin
    >>> Removing previous SGE installation...
    >>> Installing Sun Grid Engine...
    1/1 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
    >>> Shutting down threads...
    20/20 ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| 100%  
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
    
    >>> Starting cluster took 2.171 mins

    OK!!!

    
</entry>

<entry [Sun 2011:04:24 18:12:23 EST] TRIED TO CONVERT pem TO PUTTY ppk FOR FILEZILLA>

INSTALL PUTTY (INCLUDES PUTTYGEN)
apt-get install putty


BUT puttygen DOES NOT RECOGNISE *pem KEY FILE:

cd /nethome/admin/.keypairs/
puttygen private.pem -O private -o private.ppk

    puttygen: error loading `private.pem': unrecognised key type


DIAGNOSIS:
http://stackoverflow.com/questions/3190667/convert-pem-to-ppk-file-format

    A PEM file is an X.509 certificate in Base64 format.
    A PPK file is an SSH RSA key.
    You can't convert between the two because they're actually different authentication methods.
    Use Putty-CAC, which supports X.509 certificate authentication.

    
</entry>

<entry [Fri 2011:04:22 14:15:33 EST] RUNNING MULTIPLE VERSIONS OF STARCLUSTER>

WORKS WITH TWO INSTALLATIONS (POSSIBLY MORE):

INSTALLED 0.91-366 WITH:

python setup.py install --exclude-scripts

AND INSTALLED 110202bal WITH:

python setup.py develop


CAN RUN THE TWO SCRIPTS WITH THEIR INDIVIDUAL EXECUTABLES:

/data/apps/starcluster/0.91-366/bin/starcluster

AND

/data/apps/starcluster/110202bal/bin/starcluster


QUESTIONS:

DO I NEED A SEPARATE PYTHON INSTALLATION TO RUN DIFFERENT VERSIONS OF STARCLUSTER?

DOES USING LOCAL INSTALL OF STARCLUSTER ALLOW MULTIPLE VERSIONS USING SAME python?



NOTE: INSTALLING STARCLUSTER WITH python setup.py develop DOES NOT CREATE 'SILOS'


PROBLEM:

USING COMMAND

/some/path/to/nondefault/bin/starcluster


RUNS THE STARCLUSTER LIBRARIES HERE:

/path/to/default/starcluster 


I.E., THE LAST .. install OR .. develop INSTALLATION DEFINES THE PYTHON INSTALLATION TO USE WHEN RUNNING BINARIES EITHER DIRECTLY INSIDE THE INSTALLATION OR /usr/local/bin/starcluster


WHICH IS UNDESIRABLE BECAUSE I WANT TO RUN AT WILL DIFFERENT VERSIONS OF STARCLUSTER



INSTALLED LATEST TRUNK VERSION:

root@hp:/data/apps/starcluster/0.91-316# python setup.py develop

    running develop
    Checking .pth file support in /usr/local/lib/python2.6/dist-packages/
    /usr/bin/python -E -c pass
    TEST PASSED: /usr/local/lib/python2.6/dist-packages/ appears to support .pth files
    running egg_info
    writing requirements to StarCluster.egg-info/requires.txt
    writing StarCluster.egg-info/PKG-INFO
    writing top-level names to StarCluster.egg-info/top_level.txt
    writing dependency_links to StarCluster.egg-info/dependency_links.txt
    reading manifest file 'StarCluster.egg-info/SOURCES.txt'
    reading manifest template 'MANIFEST.in'
    writing manifest file 'StarCluster.egg-info/SOURCES.txt'
    running build_ext
    Creating /usr/local/lib/python2.6/dist-packages/StarCluster.egg-link (link to .)
    Removing StarCluster 0.9999 from easy-install.pth file
    Adding StarCluster 0.9999 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Installed /home/data/apps/starcluster/0.91-316
    Processing dependencies for StarCluster==0.9999
    Searching for workerpool==0.9.2
    Best match: workerpool 0.9.2
    Processing workerpool-0.9.2-py2.6.egg
    workerpool 0.9.2 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.6/dist-packages/workerpool-0.9.2-py2.6.egg
    Searching for boto==2.0b4
    Best match: boto 2.0b4
    Processing boto-2.0b4-py2.6.egg
    Removing boto 2.0b3 from easy-install.pth file
    Adding boto 2.0b4 to easy-install.pth file
    Installing cfadmin script to /usr/local/bin
    Installing taskadmin script to /usr/local/bin
    Installing s3put script to /usr/local/bin
    Installing elbadmin script to /usr/local/bin
    Installing cq script to /usr/local/bin
    Installing fetch_file script to /usr/local/bin
    Installing sdbadmin script to /usr/local/bin
    Installing launch_instance script to /usr/local/bin
    Installing list_instances script to /usr/local/bin
    Installing lss3 script to /usr/local/bin
    Installing pyami_sendmail script to /usr/local/bin
    Installing route53 script to /usr/local/bin
    Installing kill_instance script to /usr/local/bin
    Installing bundle_image script to /usr/local/bin
    
    Using /usr/local/lib/python2.6/dist-packages/boto-2.0b4-py2.6.egg
    Searching for paramiko==1.7.6
    Best match: paramiko 1.7.6
    Processing paramiko-1.7.6-py2.6.egg
    paramiko 1.7.6 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.6/dist-packages/paramiko-1.7.6-py2.6.egg
    Searching for pycrypto==2.0.1
    Best match: pycrypto 2.0.1
    Adding pycrypto 2.0.1 to easy-install.pth file
    
    Using /usr/lib/python2.6/dist-packages
    Finished processing dependencies for StarCluster==0.9999
    root@hp:/data/apps/starcluster/0.91-316# 


THEN USED THE --exclude-scripts, -x ARGUMENT TO SKIP INSTALLING SCRIPTS AND REINSTALLED THE LOAD BALANCER WITH develop

cd /data/apps/starcluster/110202bal
python setup.py develop --exclude-scripts 

    running develop
    Checking .pth file support in /usr/local/lib/python2.6/dist-packages/
    /usr/bin/python -E -c pass
    TEST PASSED: /usr/local/lib/python2.6/dist-packages/ appears to support .pth files
    running egg_info
    writing requirements to StarCluster.egg-info/requires.txt
    writing StarCluster.egg-info/PKG-INFO
    writing top-level names to StarCluster.egg-info/top_level.txt
    writing dependency_links to StarCluster.egg-info/dependency_links.txt
    reading manifest file 'StarCluster.egg-info/SOURCES.txt'
    reading manifest template 'MANIFEST.in'
    writing manifest file 'StarCluster.egg-info/SOURCES.txt'
    running build_ext
    Creating /usr/local/lib/python2.6/dist-packages/StarCluster.egg-link (link to .)
    Removing StarCluster 0.9999 from easy-install.pth file
    Adding StarCluster 0.9999 to easy-install.pth file
    Installing starcluster script to /usr/local/bin
    
    Installed /home/data/apps/starcluster/110202bal
    Processing dependencies for StarCluster==0.9999
    Searching for boto==2.0b3
    Best match: boto 2.0b3
    Processing boto-2.0b3-py2.6.egg
    Removing boto 2.0b4 from easy-install.pth file
    Adding boto 2.0b3 to easy-install.pth file
    
    Using /usr/local/lib/python2.6/dist-packages/boto-2.0b3-py2.6.egg
    Searching for paramiko==1.7.6
    Best match: paramiko 1.7.6
    Processing paramiko-1.7.6-py2.6.egg
    paramiko 1.7.6 is already the active version in easy-install.pth
    
    Using /usr/local/lib/python2.6/dist-packages/paramiko-1.7.6-py2.6.egg
    Searching for pycrypto==2.0.1
    Best match: pycrypto 2.0.1
    Adding pycrypto 2.0.1 to easy-install.pth file
    
    Using /usr/lib/python2.6/dist-packages
    Finished processing dependencies for StarCluster==0.9999
    
</entry>
<entry [Fri 2011:04:22 13:24:44 EST] 64-BIT HADOOP INSTANCE CONSOLE OUTPUT (NOTE RANDOMART)>

    [80G Generating public/private rsa key pair.
    Your identification has been saved in /etc/ssh/ssh_host_rsa_key.
    Your public key has been saved in /etc/ssh/ssh_host_rsa_key.pub.
    The key fingerprint is:
    d7:64:9d:7d:7c:23:66:9a:58:d0:8d:bb:8d:94:cd:1f root@ip-10-127-97-175
    The key's randomart image is:
    +--[ RSA 2048]----+
    |         .. o    |
    |          .o o + |
    |           .B+o.=|
    |          oB=o.E+|
    |        S.oo= . .|
    |         . o . . |
    |                 |
    |                 |
    |                 |
    +-----------------+
    Generating public/private dsa key pair.
    Your identification has been saved in /etc/ssh/ssh_host_dsa_key.
    Your public key has been saved in /etc/ssh/ssh_host_dsa_key.pub.
    The key fingerprint is:
    a4:bd:b1:fc:8e:0e:9b:ad:f2:fb:3d:e1:c8:56:3f:9c root@ip-10-127-97-175
    The key's randomart image is:
    +--[ DSA 1024]----+
    |                 |
    |                 |
    |        .        |
    |       +         |
    |      . S        |
    |       . +o      |
    |      ..++ + .   |
    |    .  =++o E    |
    |     o**=.+. .   |
    +-----------------+
    ec2: 
    ec2: #############################################################
    ec2: -----BEGIN SSH HOST KEY FINGERPRINTS-----
    ec2: 2048 d7:64:9d:7d:7c:23:66:9a:58:d0:8d:bb:8d:94:cd:1f /etc/ssh/ssh_host_rsa_key.pub (RSA)
    ec2: 1024 a4:bd:b1:fc:8e:0e:9b:ad:f2:fb:3d:e1:c8:56:3f:9c /etc/ssh/ssh_host_dsa_key.pub (DSA)
    ec2: -----END SSH HOST KEY FINGERPRINTS-----
    ec2: #############################################################
    [74G[ OK ]
     * Setting sensors limits       
    [80G 
    [74G[ OK ]
     * ipvsadm is not configured to run. Please run dpkg-reconfigure ipvsadm
     
    [33m*
    [39;49m No configuration file found, doing nothing.
    Starting ha_logd: ok
     * Exporting directories for NFS kernel daemon...       
    [80G 
    [74G[ OK ]
     * Starting NFS kernel daemon       
    [80G 
    [74G[ OK ]
    Starting openhpid:  * success
    landscape-client is not configured, please run landscape-config.
    Ubuntu 10.04.1 LTS ip-10-127-97-175 tty1
    ip-10-127-97-175 login: 

    
</entry>

<entry [Fri 2011:04:22 11:10:51 EST] CREATED ami-b07985d9 (t1.micro-RUNNABLE) EBS SNAPSHOT OF 10.04 UBUNTU 64-BIT HADOOP IMAGE>

1. SELECTED LATEST (u10.04) HADOOP STARCLUSTER IMAGE

starcluster --listpublic
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


2. LAUNCHED STARCLUSTER USING 64-BIT HADOOP INSTANCE ami-8852a0e1

EDITED admin CONFIG:

/nethome/admin/.starcluster/config

    # AMI for cluster nodes.
    # The base i386 StarCluster AMI is ami-d1c42db8
    # The base x86_64 StarCluster AMI is ami-a5c42dcc
    # ami-8852a0e1 IS EBS-BACKED, 64-BIT u10.04 UBUNTU
    NODE_IMAGE_ID=ami-8852a0e1


START CLUSTER:

starcluster -c /nethome/admin/.starcluster/config start smallcluster

    >>> Using default cluster template: smallcluster
    >>> Validating cluster template settings...
    >>> Cluster template settings are valid
    >>> Starting cluster...
    >>> Launching a 2-node cluster...
    >>> Launching master (ami: ami-8852a0e1, type: m1.large)
    >>> Launching node001 (ami: ami-8852a0e1, type: m1.large)
    >>> Creating security group @sc-smallcluster...
    Reservation:r-39886355
    >>> Waiting for cluster to come up... (updating every 30s)


CREATED IMAGE OF MASTER:

starcluster ebsimage i-180d5c77 starcluster-u10.04-64bit-hadoop

    Instance:i-180d5c77
    'id_rsa-admin-key'
    {   'id_rsa-admin-key': {   '__name__': 'key id_rsa-admin-key',
                                'key_location': '/nethome/admin/.starcluster/id_rsa-admin-key',
                                'keyname': 'id_rsa-admin-key'}}
    >>> ec2.create_ebs_image
    >>> Removing private data...
    >>> Creating new EBS-backed image from instance-store instance
    >>> Creating new root volume...
    >>> Created new volume: vol-1b8b7670
    >>> Attaching volume vol-1b8b7670 to instance i-180d5c77 on /dev/sdz
    >>> Mounting /dev/sdz on /ebs
    >>> Configuring /etc/fstab
    >>> Syncing root filesystem to new volume (vol-1b8b7670)
    >>> Unmounting /dev/sdz from /ebs
    >>> Detaching volume /dev/sdz from /ebs
    >>> Creating snapshot of volume: vol-1b8b7670
    >>> Waiting for snapshot to complete: snap-c54ef9aa
    snap-c54ef9aa: |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||100% Time: 00:27:09
    >>> New snapshot created: snap-c54ef9aa
    >>> Registering new image...
    >>> create_image took 30.929 mins
    >>> Your new AMI id is: ami-b07985d9



LAUNCH MICRO INSTANCE OF NEW AMI

ec2-run-instances ami-b07985d9 --instance-type t1.micro -z us-east-1a

    RESERVATION	r-49ef0425	558277860346	default
    INSTANCE	i-965706f9	ami-b07985d9			pending		0		t1.micro	2011-04-22T21:02:00+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs					paravirtual	xen		sg-0a0da063	default


GRANT ACCESS TO USER syoung

ec2-modify-image-attribute ami-b07985d9 --launch-permission --add 728213020069

    launchPermission	ami-b07985d9	ADD	userId	728213020069



LAUNCHED WITH USER syoung AND CONVERTED TO OWN AMI:


AMI ID: ami-167a867f
Name: starcluster-hadoop-u10.04
Description: Hadoop-enabled, 64-bit ubuntu 10.04
Source: 728213020069/starcluster-hadoop-u10.04
Owner: 728213020069	Visibility: Private	Product Code:
State: available	Kernel ID: aki-0b4aa462	RAM Disk ID: -
Image Type: machine	Architecture: x86_64	Platform: Other Linux
Root Device Type: ebs	Root Device: /dev/sda1	Image Size: 15 GiB
Block Devices: /dev/sda1=snap-d105b2be:15:true
Virtualization: paravirtual





NOTES
-----

HAD A PROBLEM WITH THE KEYS HERE...


1. LAUNCHED 64-BIT HADOOP INSTANCE 

jg
ec2-run-instances ami-8852a0e1 --instance-type m1.large -z us-east-1a

RESERVATION	r-07c1296b	558277860346	default
INSTANCE	i-70386e1f	ami-8852a0e1			pending		0m1.large	2011-04-22T16:09:12+0000	us-east-1a	aki-0b4aa462	monitoring-disabled					instance-store		xen		sg-0a0da063	default


3. CONNECT TO MASTER

ssh -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem root@ec2-174-129-109-161.compute-1.amazonaws.com

    debug1: Trying private key: /home/syoung/22-agua/cloud/AWS/keypair/agua.pem
    debug1: read PEM private key done: type RSA
    debug1: Authentications that can continue: publickey
    debug1: No more authentication methods to try.
    Permission denied (publickey).

SAME ERROR
ssh -i /nethome/admin/.keypairs/private.pem root@ec2-174-129-109-161.compute-1.amazonaws.com
ssh -i /root/.ssh/id_rsa root@ec2-174-129-109-161.compute-1.amazonaws.com
ssh -i /nethome/jgilbert/aws/.keypair/pk-APKAJLSLZIS4DAQYFRFQ.pem root@ec2-174-129-109-161.compute-1.amazonaws.com

/nethome/admin/.keypairs/private.pem


RELAUNCHED:

sudo su
ec2-run-instances ami-8852a0e1 --instance-type m1.large -z us-east-1a


ec2-run-instances ami-8852a0e1 --instance-type m1.large -z us-east-1a
RESERVATION	r-89bb50e5	558277860346	default
INSTANCE	i-3a154455	ami-8852a0e1			pending		0		m1.large	2011-04-22T19:54:46+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					instance-store						xen		sg-0a0da063	default

CONFIRMED ENVIRONMENT VARIABLES:

printenv

    AMAZON_USER_ID=558277860346
    EC2_HOME=/usr/share/ec2/1.4.2.4
    AWS_CREDENTIAL_FILE=/home/syoung/22-agua/cloud/AWS/keypair/jgilbert/jgilbert-aws-credentials.txt
    AWS_SECRET_ACCESS_KEY=7dEtf/23BzV2UAwk6jUikk80WBsItHISdC2Urwef
    SGE_EXECD_PORT=702
    LANG=en_US.UTF-8
    SGE_QMASTER_PORT=701
    SGE_ROOT=/var/lib/gridengine
    AWS_IAM_HOME=/usr/share/iam/1.2.0
    AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
    EC2_PRIVATE_KEY=/nethome/jgilbert/aws/.keypair/pk-APKAJLSLZIS4DAQYFRFQ.pem
    EC2_CERT=/nethome/jgilbert/aws/.keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem

IMAGE DETAILS

ec2din i-3a154455
RESERVATION	r-89bb50e5	558277860346	default
INSTANCE	i-3a154455	ami-8852a0e1	ec2-50-17-140-100.compute-1.amazonaws.com	ip-10-127-99-6.ec2.internal	running		0		m1.large	2011-04-22T19:54:46+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.17.140.100	10.127.99.6			instance-store					paravirtual	xen	sg-0a0da063	default


CREATE THE IMAGE
starcluster ebsimage i-3a154455 starcluster-u10.04-64bit-hadoop

    PID: 7348 ssh.py:65 - DEBUG - private key specified
    PID: 7348 ssh.py:114 - DEBUG - Using private key /nethome/admin/.starcluster/id_rsa-admin-key (rsa)
    PID: 7348 cli.py:180 - ERROR - failed to authenticate to host root as user ec2-50-17-140-100.compute-1.amazonaws.com
    PID: 7348 ssh.py:505 - DEBUG - __del__ called


RETRY USING /nethome/admin/.starcluster/id_rsa-admin-key:


export EC2_PRIVATE_KEY=/nethome/admin/.starcluster/id_rsa-admin-key
ec2-run-instances ami-8852a0e1 --instance-type m1.large -z us-east-1a

Unexpected error:
    org.codehaus.xfire.fault.XFireFault: Signature creation failed; nested exception is: 
        java.security.spec.InvalidKeySpecException: java.lang.IllegalStateException: DEF length 98 object truncated by 32




CREATE KEYPAIR FILE GOT jgilbert:

ec2-add-keypair \
-K /nethome/jgilbert/aws/.keypair/pk-APKAJLSLZIS4DAQYFRFQ.pem \
-C /nethome/jgilbert/aws/.keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem \
id_rsa-jgilbert-key

    KEYPAIR	id_rsa-jgilbert-key	cc:63:81:5b:c1:6a:00:4b:a8:e8:17:c8:7d:cb:68:4d:01:bf:07:71
    -----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEAhZSSSHK4R6bkJAqQi+7UtXqf1hsc4fRpeXTLs/M79cO32jqAebZ6vaM+CZ5l
    vVFtZYGvB6w5NpbmgDCAAzdvzkxiC0SoqKXq7CPKGdi+WYnIIjQM+TCZv/PHZk+3cnAck+lSCtub
    P5zTJ/mo1kwXRjJDqr0M3lqSSnkZiO1F46vVVVsh1Ho37rJYruop+gPL23CpcxqTdUD42ml22lU3
    tiFjdGsgPW6hdc6dhW6gwpN5D5HO3fpUjpZimLytqgeuN4SZv2j63Od3cEO9Yb69c+bkBytEBESm
    0UCzU/cGaAuF9ggWQRqIWgI3kzDF1Me1xKjMGSLKSvFFK3RfB8daEwIDAQABAoIBACRZm70PSspk
    xexw24jYwxVnexteYWuzgQhGGjCr3gMw8VT3WoLEf34fcABaFEGCaQyYT7L80MzkH3F+wTce3NP8
    wSlj06mhDN6ZlqOV8aaX8dgs5eLhsNUlV3ul8bu4em5dra+6tvKGkIduTt2R8zts7jEGJPxVFT4i
    2ioCt2QOt1gRXthQmWryRpDpeNy3GwOupYWp08bLMeABsjkgc6c/z1k1bF6Fd/YsXeUtB6Y6vyHv
    gxzbjj/sjyGCxtYIvOZkcqJRJVU7LMw/8n+81/cNKj79PPogJx1juN3yNBdGHoiizTwFshOCaW2N
    9YZcB9irDRjHnMkWXqOwX/y9QVECgYEAzYbugZKC/o3G2EU/jiVmGO7MAGgUa3tie2Qqf5nsQTBq
    49Ktl8YrfskN7on0iWvuQaWyYNJgDUuxh48rvx1UzONDstz3e6XxQsAPWJnm2FIFJbvnVkCm7Woz
    aNazTfOQYLVhOoLCLQWWpudaUJP1l7zIpyaxvxiXx5VSBH94kh0CgYEApmJ/A/giNKXpnSI1a8TE
    3La0Fq3X4oxbtcWpapCOci1aiM3a91Aa74UocAeUNGceaDz2Wn0yBPNUQsqbsVvQJnHVV6wK5S8z
    9XqYCFdtchE+MnMBnGlPNyfLJCrTNWeseH+Xh45qhzzQb5HsD4DR6dPQGWiKg9n3Txr8YEIf5e8C
    gYAUqDoypcIqyZ8xv4wKwnGHkgDJDaz3vJgCZOfsmVDooHAt48/00EMw5A5VamI8qa9xw7CxEJP8
    4h2+zUINXGpYiYMVaCYrtFsSZXFla1qLZXsE9uTig28Dr8fpAqNU82UQg0p5cgkIM2aX8ere7HAj
    xyK3wijdVyByO+zZbOJ2dQKBgEiW0DM7HjE58SHMuuG5humEDC2YyobcFWbIRZFoX70QbF8i8FTV
    berxfSLjK5VxJ6Lydcgktp3SSwCYxDQsijM7logZVueGIHUIdyuseOM7Apef9SP4DcdSZR3yURML
    mAM6JzHMwE0gCw+h6gsZeHs7HZ74LPY5MdwhOdoE/0WhAoGAY0QJH5mtQkCMUoUnCkjrj7t10l2n
    ShbUOA6nDBfpkGflXavm9KrEzb+4lOVYhCpQFo03GCdT6NyERbn8HZlPXjrDSYDRnK+D4W9xxE82
    WM+y+yLgqE9YidOvOrJHATne2zH+vwjT0Dsk074o0hd2MKAVgaCKy+45u/RUs1J5Mew=
    -----END RSA PRIVATE KEY-----


CREATE KEYPAIR FILE:

emacs /nethome/jgilbert/aws/.keypair/id_rsa-jgilbert-key


4. CREATED EBS IMAGE

/data/apps/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/config ebsimage i-70386e1f starcluster-u10.04-64bit-hadoop
StarCluster - (http://web.mit.edu/starcluster) (v. 0.9999)
Software Tools for Academics and Researchers (STAR)
Please submit bug reports to starcluster@mit.edu

cli.py:176 - ERROR - key None not found in config




ebsimage USAGE
--------------

/data/apps/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/config ebsimage --help

Usage: ebsimage [options] < instance-id> < image_name>

    Create a new EBS image (AMI) from a running EC2 instance

    Example:

        $ starcluster ebsimage i-999999 my-new-image-ebs

    NOTE: It should now be safe to create an image from an instance launched by
    StarCluster. If you have issues please submit a bug report to the mailing
    list.

Options:
  -h, --help            show this help message and exit
  -d DESCRIPTION, --description=DESCRIPTION
                        short description of this AMI
  -D SNAPSHOT_DESCRIPTION, --snapshot-description=SNAPSHOT_DESCRIPTION
                        short description for new EBS snapshot
  -k KERNEL_ID, --kernel-id=KERNEL_ID
                        kernel id for the new AMI
  -r RAMDISK_ID, --ramdisk-id=RAMDISK_ID
                        ramdisk id for the new AMI



</entry>

<entry [Fri 2011:04:22 00:49:29 EST] LAUNCH micro INSTANCE OF STARCLUSTER IMAGE FAILED BECAUSE NOT EBS-BACKED>

TRIED TO LAUNCH 10.04 UBUNTU 64-BIT STARCLUSTER IMAGE:

jg
ec2-run-instances \
ami-0af31963 \
--instance-type t1.micro \
-z us-east-1a \

GAVE THIS ERROR:

    Client.UnsupportedOperation: AMI 'ami-0af31963' with an instance-store root device is not supported for the instance type 't1.micro'.


DIAGNOSIS:

http://support.rightscale.com/06-FAQs/FAQ_0164_-_When_launching_a_t1.micro_based_server,_I_receive_an_%22UnsupportedOperation%22_error.
Answer
One of the common misconceptions is that you can launch a 'micro' instance types on EC2 using a standard 32-bit image.  Amazon's 'micro' instance types can only be launched using an EBS-based image because unlike other EC2 instance types, these instances do NOT contain any ephemeral local storage.



</entry>

<entry [Fri 2011:04:22 00:49:28 EST] MOUNT /data DIRECTORY (NB: NOT VOLUME) ON CLUSTER MASTER>

EXPORT FROM HP
--------------

1. SET t1.micro-RUNNABLE IMAGE IN /nethome/admin/.starcluster/config

    # AMI for cluster nodes.
    # The base i386 StarCluster AMI is ami-d1c42db8
    # The base x86_64 StarCluster AMI is ami-a5c42dcc
    # ami-8852a0e1 IS EBS-BACKED, 64-BIT u10.04 UBUNTU
    NODE_IMAGE_ID=ami-8852a0e1
    ...
    # instance type for all cluster nodes
    # (options: m1.large, c1.xlarge, m1.small, c1.medium, m1.xlarge, m2.4xlarge, m2.2xlarge)
    #NODE_INSTANCE_TYPE=m1.large
    NODE_INSTANCE_TYPE=t1.micro
    ...


2. LAUNCH CLUSTER (START ONLY)

/home/syoung/0.6/bin/apps/cluster/starcluster.pl start \
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

    
RESERVATION	r-7bb65c17	558277860346	@sc-smallcluster

INSTANCE	i-aa90c0c5	ami-b07985d9	ec2-50-19-24-94.compute-1.amazonaws.com	ip-10-122-99-236.ec2.internal	running	id_rsa-admin-key	0		t1.micro	2011-04-23T04:23:41+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.19.24.94	10.122.99.236			ebs					paravirtual	xen		sg-b2731ddb	default
BLOCKDEVICE	/dev/sda1	vol-bb708dd0	2011-04-23T04:24:02.000Z	

INSTANCE	i-a890c0c7	ami-b07985d9	ec2-67-202-12-32.compute-1.amazonaws.com	domU-12-31-38-01-C4-E5.compute-1.internal	running	id_rsa-admin-key	1		t1.micro	2011-04-23T04:23:41+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	67.202.12.32	10.253.203.19			ebs				paravirtual	xen		sg-b2731ddb	default
BLOCKDEVICE	/dev/sda1	vol-a5708dce	2011-04-23T04:24:07.000Z	


3. OPEN NFS PORTS FOR THE @sc-masters GROUP ON EC2

# PORTMAP
ec2-authorize @sc-smallcluster -p 111 -P tcp
ec2-authorize @sc-smallcluster -p 111 -P udp

# NFS
ec2-authorize @sc-smallcluster -p 2049 -P udp
ec2-authorize @sc-smallcluster -p 2049 -P tcp

# MOUNTD
ec2-authorize @sc-smallcluster -p 32767 -P udp
ec2-authorize @sc-smallcluster -p 32767 -P tcp

# SGE
ec2-authorize @sc-smallcluster -p 6444 -P tcp
ec2-authorize @sc-smallcluster -p 6444 -P udp
ec2-authorize @sc-smallcluster -p 6445 -P tcp
ec2-authorize @sc-smallcluster -p 6445 -P udp

    OK

CONFIRM BY DOING

ec2-describe-group @sc-smallcluster
ec2dgrp @sc-smallcluster
    OK


NB: DON'T NEED TO OPEN status OR nlockmgr PORTS
(CHECKED BY RESTARTING AND COULD STILL MOUNT ON AQ-7 EVEN THOUGH PORTS HAD CHANGED)




4. CONFIGURE EXPORT ON HP (UBUNTU 10.10)

mkdir -p /export/data
mount --bind /data /export/data


ADD TO fstab:
emacs /etc/fstab

THIS LINE:
/data    /export/data   none    bind  0  0


AND DO:
mount -o rw,ver=3 /export/data

CONFIRM MOUNT WORKED:

cat /proc/mounts

    /dev/sda3 /export/data ext4 rw,relatime,barrier=1,data=ordered 0 0

CHECK AGAIN USING mount:

mount -l | grep bind
    #/home/data on /export/data type none (rw,bind,commit=0)
    /home/data on /export/data type none (rw,bind,ver=3)


ADD TO
/etc/default/nfs-kernel-server 

THIS:
NEED_SVCGSSD=no # no is default


TO SET EXPORTS, ADD TO:
emacs /etc/exports

THIS:

/export/data  192.168.0.109(rw,ver=3,nohide,insecure,no_subtree_check,async)


/export       ec2-50-19-24-94.compute-1.amazonaws.com(rw,fsid=0,insecure,no_subtree_check,async)
/export/data  ec2-50-19-24-94.compute-1.amazonaws.com(rw,nohide,insecure,no_subtree_check,async)



EXPORT THE SHARES (EVERY TIME /etc/exports IS CHANGED)
sudo exportfs -ra

RESTART PORTMAP AND NFS
/etc/init.d/portmap restart
/etc/init.d/nfs-kernel-server restart

VERIFY EXPORTS
exportfs
    OK

    /export/data  	ec2-50-19-24-94.compute-1.amazonaws.com

nmap -P0 98.254.40.187



MOUNT ON REMOTE
----------------

IMPORTANT: OPEN PORTS ON D-LINK DI-524 ROUTER -> 192.168.0.1 --> Advanced --> Firewall

  	Action 	Name 	Source 	Destination 	Protocol 	 
	Allow	nfs	*,192.168.0.2-192.168.0.254	*,*	*,2049	editdeletepriority uppriority down
	Allow	portmapper	*,192.168.0.2-192.168.0.254	*,*	*,111	editdeletepriority uppriority down
	Allow	mountd	*,129.168.0.2-192.168.0.254	*,*	*,32767	editdeletepriority uppriority down
    

HP IP:

    c-98-254-40-187.hsd1.fl.comcast.net
    98.254.40.187

ifconfig | grep inet

    127.0.0.1
    172.16.151.1
    172.16.221.1
    192.168.0.102


apt-get install nfs-common

    < install>
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    The following extra packages will be installed:
      portmap
    The following packages will be upgraded:
      nfs-common portmap
    2 upgraded, 0 newly installed, 0 to remove and 165 not upgraded.
    Need to get 268kB of archives.
    After this operation, 12.3kB of additional disk space will be used.
    Do you want to continue [Y/n]? 
    Get:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid-updates/main portmap 6.0.0-1ubuntu2.1 [39.0kB]
    Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid-updates/main nfs-common 1:1.2.0-4ubuntu4.1 [229kB]
    Fetched 268kB in 0s (2,629kB/s)
    Preconfiguring packages ...
    (Reading database ... 86850 files and directories currently installed.)
    Preparing to replace portmap 6.0.0-1ubuntu2 (using .../portmap_6.0.0-1ubuntu2.1_amd64.deb) ...
    portmap stop/waiting
    Unpacking replacement portmap ...
    Preparing to replace nfs-common 1:1.2.0-4ubuntu4 (using .../nfs-common_1%3a1.2.0-4ubuntu4.1_amd64.deb) ...
    Unpacking replacement nfs-common ...
    Processing triggers for man-db ...
    Processing triggers for ureadahead ...
    Setting up portmap (6.0.0-1ubuntu2.1) ...
    Installing new version of config file /etc/init/portmap.conf ...
    portmap start/running, process 3934
    There are RPC services which were registered with the portmapper
    before the configuration was changed.
    You need to manually restart them in order for the changes to take effect.
    Current registered services:
    ------------------------------------------------
        100021    1   udp  56548  nlockmgr
        100021    3   udp  56548  nlockmgr
        100021    4   udp  56548  nlockmgr
        100021    1   tcp  45857  nlockmgr
        100021    3   tcp  45857  nlockmgr
        100021    4   tcp  45857  nlockmgr
        100003    2   udp   2049  nfs
        100003    3   udp   2049  nfs
        100003    4   udp   2049  nfs
        100003    2   tcp   2049  nfs
        100003    3   tcp   2049  nfs
        100003    4   tcp   2049  nfs
        100005    1   udp  59220  mountd
        100005    1   tcp  41559  mountd
        100005    2   udp  59220  mountd
        100005    2   tcp  41559  mountd
        100005    3   udp  59220  mountd
        100005    3   tcp  41559  mountd
        100024    1   udp  39235  status
        100024    1   tcp  49103  status
    ------------------------------------------------
    
    Setting up nfs-common (1:1.2.0-4ubuntu4.1) ...
    Installing new version of config file /etc/init/statd.conf ...
    Installing new version of config file /etc/init/rpc_pipefs.conf ...
    statd start/running, process 4136
    gssd stop/pre-start, process 4159
    idmapd start/running, process 4188
    < /install>


CHECKED PORTS ON HP AT 'SHEILDS UP':
https://www.grc.com/x/ne.dll?bh0ciyl2

----------------------------------------------------------------------
GRC Port Authority Report created on UTC: 2011-04-23 at 14:05:52

Results from scan of ports: 0, 21-23, 25, 79, 80, 110, 113, 
                            119, 135, 139, 143, 389, 443, 445, 
                            1002, 1024-1030, 1720, 5000
    0 Ports Open
    0 Ports Closed
   26 Ports Stealth
---------------------
   26 Ports Tested

ALL PORTS tested were found to be: STEALTH.

TruStealth: FAILED - ALL tested ports were STEALTH,
                   - NO unsolicited packets were received,
                   - A PING REPLY (ICMP Echo) WAS RECEIVED.



THIS WORKED ON TOSHIBA-K:

apt-get install nfs-common
ps aux | grep nfs
ps aux | grep portmap

apt-get install nfs-common
apt-get remove nfs-common
apt-get install nfs-common
/etc/init.d/nfs restart
netstat -ntulp
emacs /etc/default/nfs-common
apt-get install emacs
emacs /etc/default/nfs-common
emacs -nw /etc/default/nfs-common
/etc/init.d/portmap restart
cd /etc/init.d/
ll
netstat -ntulp
apt-get install nfs
aptitude search nfs
apt-get install aptitude
aptitude search nfs
apt-get install nfs-client
apt-get install nfs-common
which nfs
updatedb
apt-get install nfswatch
showmount -e 192.168.0.102
history -a




1. SET MOUNTD ON CLIENT

emacs /etc/default/nfs-kernel-server

    RPCMOUNTDOPTS="--port 32767 --manage-gids"

2. RESTART portmap AND nfs

#service portmap restart
#service nfs restart
/etc/init.d/portmap restart
/etc/init.d/nfs-kernel-server restart


3. CONFIRMED CORRECT PORTS ARE OPEN WITH netstat AND rpcinfo

ON MASTER:

rpcinfo -p | awk -F " " '{print $3 "\t" $4 "\t" $5}' | sort | uniq | grep -v proto
    
ON MASTER
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


ON AQ7

tcp	111	portmapper
tcp	2049	nfs
tcp	32767	mountd
tcp	32861	nlockmgr
tcp	748	rquotad
udp	111	portmapper
udp	2049	nfs
udp	32767	mountd
udp	47767	nlockmgr
udp	745	rquotad

netstat -ntulp | grep mount

    tcp        0      0 0.0.0.0:32767           0.0.0.0:*               LISTEN      4291/rpc.mountd 
    udp        0      0 0.0.0.0:32767           0.0.0.0:*                           4291/rpc.mountd 



ON HP:

rpcinfo -p | awk -F " " '{print $3 "\t" $4 "\t" $5}' | sort | uniq | grep -v proto
    tcp	111	portmapper
    tcp	2049	
    tcp	2049	nfs
    tcp	32767	mountd
    tcp	42921	status
    tcp	59821	nlockmgr
    udp	111	portmapper
    udp	2049	
    udp	2049	nfs
    udp	32767	mountd
    udp	56157	status
    udp	58188	nlockmgr

netstat -ntulp | grep mount
    tcp        0      0 0.0.0.0:32767           0.0.0.0:*               LISTEN      5233/rpc.mountd 
    udp        0      0 0.0.0.0:32767           0.0.0.0:*                           5233/rpc.mountd 



4. SCAN HP'S PORTS TO CHECK 111/tcp AND 2049/tcp ARE OPEN

ON MASTER
---------
nmap -P0 98.254.40.187
c-98-254-40-187.hsd1.fl.comcast.net





    All 1000 scanned ports on c-98-254-40-187.hsd1.fl.comcast.net (98.254.40.187) are filtered
    
    #111/tcp  open   rpcbind ****
    #2049/tcp open   nfs     ****


showmount -e 98.254.40.187
showmount -e c-98-254-40-187.hsd1.fl.comcast.net


    ***EMPTY***    
    #Export list for ip-10-127-158-202:
    #/data    ip-10-124-247-224.ec2.internal,ip-10-124-245-118.ec2.internal
    #/nethome ip-10-124-247-224.ec2.internal,ip-10-124-245-118.ec2.internal


ON HP
-----

showmount -a

    All mount points on hp:
    *** EMPTY ****

#    All mount points on ip-10-124-245-118:
#    10.124.247.224:/data
#    10.124.247.224:/home
#    10.124.247.224:/opt/sge6
#    10.127.158.202:/data


ON MASTER, CHECK IF HP'S MOUNT IS SEEN

showmount -e ip-10-124-245-118

    *** EMPTY ****
    #Export list for ip-10-124-245-118:
    #/data     ip-10-127-158-202.ec2.internal,ip-10-124-247-224.ec2.internal
    #/opt/sge6 ip-10-124-247-224.ec2.internal
    #/home     ip-10-124-247-224.ec2.internal


5. ON MASTER, MOUNT /data FROM MASTER USING '-o nfsvers=3':

mkdir /data
mount -o nfsvers=3 -t nfs 98.254.40.187:/data /data

    OK!



CHECKED /var/log/syslog ON MASTER

Apr 23 06:24:56 ip-10-122-99-236 mountd[595]: Caught signal 15, un-registering and exiting.







REDHAT: MAKE SERVICES START ON BOOT:
service rpcbind start
service nfslock start
chkconfig --level 2345 rpcbind on
chkconfig --level 2345 nfslock on



OPTIONAL - IF USING NFS4
------------------------

TO DISACTIVATE NFS4 SECURITY, ADD TO 

/etc/default/nfs-common

THIS

NEED_IDMAPD=yes
NEED_GSSD=no # no is default

</entry>

