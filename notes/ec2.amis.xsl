ec2.amis



<entry [Mon 2013:01:28 05:43:11 EST] CREATED IMAGE FROM MASTER>

1. CREATED IMAGE ON HEADNODE

/data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config \
ebsimage \
i-1d3fb179 \
aquarius-8

    AMI ami-9c835cf5


2. CONFIRM IMAGE
    
    IMAGE	ami-9c835cf5	728213020069/aquarius-8	728213020069	available	private		x86_64	machine	aki-825ea7eb		ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-39268643	10	


3. LAUNCH IMAGE


ec2-run-instances \
--key aquarius2 \
ami-9c835cf5 \
--instance-type t1.micro \
-z us-east-1a 


RESERVATION	r-44e21a27	728213020069	default
INSTANCE	i-e7661783	ami-9c835cf5			pending	aquarius2	0	t1.micro	2012-03-17T22:33:36+0000	us-east-1a	aki-825ea7eb			monitoring-disabled					ebs					paravirtual	xen		sg-2925d740	default


ec2din i-e7661783

RESERVATION	r-44e21a27	728213020069	default
INSTANCE	i-e7661783	ami-9c835cf5	ec2-107-20-22-110.compute-1.amazonaws.com	ip-10-122-246-184.ec2.internal	running	aquarius2	0		t1.micro	2012-03-17T22:33:36+0000	us-east-1a	aki-825ea7eb			monitoring-disabled107.20.22.110	10.122.246.184			ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-f5436499	2012-03-17T22:33:55.000Z



ACCESSED

ssh root@ec2-107-20-22-110.compute-1.amazonaws.com
    OK



<entry [Mon 2013:01:28 05:43:10 EST] CLEANED UP AMIS>

GET ALL IMAGES
**************

ec2dim

**** KEPT IMAGES ****

IMAGE	ami-78837d11	728213020069/aquarius-8-cluster.4	728213020069	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-9f466ef0	15		standard	
TAG	image	ami-78837d11	Name	aquarius-8-cluster.4

IMAGE	ami-76837d1f	728213020069/aquarius-8f2	728213020069	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtualxen
BLOCKDEVICEMAPPING	/dev/sda1		snap-f7476f98	15		standard	
BLOCKDEVICEMAPPING	/dev/sdi		snap-f5476f9a	40		standard	
BLOCKDEVICEMAPPING	/dev/sdh		snap-f3476f9c	40		standard	
TAG	image	ami-76837d1f	Name	aquarius-8f2

IMAGE	ami-b3bd0fda	728213020069/eridanus-0.8.0-alpha.2	728213020069	available	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-31c7f044	10		standard	

IMAGE	ami-ca847aa3	728213020069/starcluster-u10.04-hadoop.2	728213020069	available	private		x86_64	machine	aki-0b4aa462			ebsparavirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-83ae80ec	15		standard	
TAG	image	ami-ca847aa3	Name	starcluster-u10.04-hadoop.2



**** DELETED IMAGES ****
Are you sure you want to deregister the following images?
ami-ef39f286
ami-11c67678
ami-9c835cf5
ami-c6a877af

(JGILBERT 558277860346)
IMAGE	ami-8e827ce7	558277860346/aquarius-8-cluster.4	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-1f4f6770	15		standard	

(JGILBERT 558277860346)
IMAGE	ami-6688760f	558277860346/aquarius-8e-prefix-reboot	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-19daf676	15		standard	
BLOCKDEVICEMAPPING	/dev/sdh		snap-1ddaf672	40		standard	
BLOCKDEVICEMAPPING	/dev/sdi		snap-1bdaf674	40		standard	

(JGILBERT 558277860346)
IMAGE	ami-3a847a53	558277860346/starcluster-u10.04-hadoop.2	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebsparavirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-17f6d878	15		standard	

IMAGE	ami-fc847a95	558277860346/aquarius-8f	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtualxen
BLOCKDEVICEMAPPING	/dev/sda1		snap-edd9f782	15		standard	
BLOCKDEVICEMAPPING	/dev/sdh		snap-13d9f77c	40		standard	
BLOCKDEVICEMAPPING	/dev/sdi		snap-11d9f77e	40		standard	

IMAGE	ami-b07985d9	558277860346/starcluster-u10.04-64bit-hadoop	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebsparavirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-c54ef9aa	15		standard	

IMAGE	ami-d08b75b9	558277860346/aquarius-8-cluster	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtualxen
BLOCKDEVICEMAPPING	/dev/sda1		snap-7bf9d514	15		standard	

IMAGE	ami-38847a51	558277860346/aquarius-8-cluster.3	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-9df9d7f2	15		standard	

IMAGE	ami-d47b8cbd	983300124420/aquarius-3	983300124420	available	private		x86_64	machine	aki-b51cf9dc	ari-b31cf9da		ebs	paravirtualxen
BLOCKDEVICEMAPPING	/dev/sda1		snap-bfd5afd5	10		standard	


**** DELETED IN AWS CONSOLE ****

IMAGE	ami-c6a877af	728213020069/eridanus-8	728213020069	available	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-ed09b597	10		standard	

IMAGE	ami-9c835cf5	728213020069/aquarius-8	728213020069	available	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-39268643	10		standard	

IMAGE	ami-ef39f286	728213020069/AQUARIUS-8	728213020069	available	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-6df52208	10		standard	
TAG	image	ami-ef39f286	Name	AQUARIUS-8

IMAGE	ami-11c67678	728213020069/eridanus-0.8.0-alpha	728213020069	available	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-eaada998	10		standard	



</entry>
<entry [Tue 2012:09:25 01:26:39 EST] ami-b3bd0fda ERIDANUS-0.8.0-alpha.2 POST install.pl AND config.pl FOR AGUA BASE>

1. LAUNCHED ERIDANUS-0.8.0-alpha (PRE config.pl)

ec2-run-instances \
ami-11c67678 \
-g default \
-k aquarius2 \
--instance-type m1.small \
-z us-east-1a

    RESERVATION	r-f3745b94	728213020069	default
    INSTANCE	i-7ba84006	ami-11c67678	ec2-107-22-72-212.compute-1.amazonaws.com	domU-12-31-38-01-86-B0.compute-1.internal	running	aquarius2	0		m1.small	2012-09-24T20:47:14+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	107.22.72.21210.253.137.90			ebs					paravirtual	xen		sg-2925d740	default
    BLOCKDEVICE	/dev/sda1	vol-4f68cf35	2012-09-24T20:47:17.000Z	

ec2-create-tags i-7ba84006 \
--tag name=aquarius-8h \
--tag description="TESTING init.html"

    RESERVATION	r-f3745b94	728213020069	default
    INSTANCE	i-7ba84006	ami-11c67678	ec2-107-22-72-212.compute-1.amazonaws.com	domU-12-31-38-01-86-B0.compute-1.internal	running	aquarius2	0		m1.small	2012-09-24T20:47:14+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	107.22.72.21210.253.137.90			ebs					paravirtual	xen		sg-2925d740	default
    BLOCKDEVICE	/dev/sda1	vol-4f68cf35	2012-09-24T20:47:17.000Z	
    TAG	instance	i-7ba84006	description	TESTING init.html
    TAG	instance	i-7ba84006	name	aquarius-8h


2. INSTALLED AGUA

ON LAPTOP:

cd /tmp
git clone https://github.com/syoung/agua.git
tar cvfz agua.tar.gz agua
scp agua.tar.gz root@$HEADIP2:/
    
ON ERIDANUS:
./install.pl
    20 MINUTES
    OK
    
./config.pl
    OK

DEFAULT admin SYSTEM USER PASSWORD: 12345678
DEFAULT root MYSQL USER PASSWORD: 12345678
DEFAULT agua MYSQL USER PASSWORD: 12345678
DEFAULT aguatest MYSQL USER PASSWORD: 12345678


3. CREATED AMI

ON LAPTOP

3.1 CREATE CONFIG FILE LISTING aquarius2 KEY:

emacs -nw /agua/conf/syoung/starcluster.config

    [global]
    DEFAULT_TEMPLATE=admin-microcluster
    ENABLE_EXPERIMENTAL=True
    
    [cluster admin-microcluster]
    AVAILABILITY_ZONE=us-east-1a
    CLUSTER_SIZE=1
    CLUSTER_USER=sgeadmin
    KEYNAME=aquarius2
    NODE_IMAGE_ID=ami-999d49f0
    NODE_INSTANCE_TYPE=t1.micro
    
    [aws info]
    AWS_ACCESS_KEY_ID=AKIAIKZHIY7T75JIF34A
    AWS_SECRET_ACCESS_KEY=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
    AWS_USER_ID=728213020069
    
    [key aquarius2]
    KEYNAME=aquarius2
    KEY_LOCATION=/home/syoung/agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa-aquarius2


3.2 INSTALL STARCLUSTER ON LAPTOP

SEE [Tue 2012:09:25 02:17:35 EST] INSTALLED starcluster ON LAPTOP



3.3 CREATE AMI:

NB: AMI names must be between 3 and 128 characters long, and may contain letters, numbers, '(', ')', '.', '-', '/' and '_'


/data/starcluster/0.92rc2/bin/starcluster \
-c /agua/conf/syoung/starcluster.config \
ebsimage \
i-7ba84006 \
eridanus-0.8.0-alpha.2
 
    StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Removing private data...
    >>> Creating EBS image...
    >>> Waiting for AMI ami-b3bd0fda to become available... 
    >>> create_image took 7.147 mins
    >>> Your new AMI id is: ami-b3bd0fda

 
    
</entry>
<entry [Thu 2012:09:13 05:44:51 EST] CREATED ami-11c67678 ERIDANUS-0.8.0-alpha: INSTALLED MooseX::Declare>

1. LAUNCHED ERIDANUS-8

ec2-run-instances \
--key aquarius2 \
ami-c6a877af \
--instance-type t1.micro \
-z us-east-1a 

    RESERVATION	r-d7e278b0	728213020069	default
    INSTANCE	i-7e387e04	ami-c6a877af			pending	aquarius2	0		t1.micro	2012-09-13T09:37:48+0000	us-east-1a	aki-825ea7eb			monitoring-disabled				ebs					paravirtual	xen		sg-2925d740	default


2. GET IP

ec2din i-7e387e04

    RESERVATION	r-d7e278b0	728213020069	default
    INSTANCE	i-7e387e04	ami-c6a877af	ec2-107-21-141-70.compute-1.amazonaws.com	ip-10-122-97-85.ec2.internal	running	aquarius2	0		t1.micro	2012-09-13T09:37:48+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	107.21.141.70	10.122.97.85			ebs			paravirtual	xen		sg-2925d740	default
    BLOCKDEVICE	/dev/sda1	vol-1c99a467	2012-09-13T09:37:55.000Z	


3. CONNECT

ssh root@ec2-107-21-141-70.compute-1.amazonaws.com

    OK

    
4. INSTALL MooseX::Declare

cpanm install MooseX::Declare


5. UPDATE R

http://cran.r-project.org/bin/linux/ubuntu/README

apt-get update
apt-get install r-base
    
    r-base is already the newest version.

NB: THIS ALSO INSTALLS r-base-dev WHICH IS USED TO COMPILE R PACKAGES FROM SOURCE (e.g. for package maintainers, or anyone installing packages with install.packages())



6. INSTALL BIOCONDUCTOR

GET R PROMPT:

R

source("http://www.bioconductor.org/biocLite.R")
biocLite()

AS BEFORE, bioMart DIDN'T INSTALL PROPERLY:

    Welcome to Bioconductor
    
      Vignettes contain introductory material. To view, type
      'browseVignettes()'. To cite Bioconductor, see
      'citation("Biobase")' and for packages 'citation("pkgname")'.
    
    ** help
    *** installing help indices
    ** building package indices ...
    ** testing if installed package can be loaded
    
    * DONE (affyQCReport)
    
    The downloaded packages are in
        ‘/tmp/Rtmpa8sWDn/downloaded_packages’
    Warning messages:
    1: In install.packages(pkgs = pkgs, repos = repos, ...) :
      installation of package 'XML' had non-zero exit status
    2: In install.packages(pkgs = pkgs, repos = repos, ...) :
      installation of package 'RCurl' had non-zero exit status
    3: In install.packages(pkgs = pkgs, repos = repos, ...) :
      installation of package 'biomaRt' had non-zero exit status
    
 
7. EDITED CONFIG FILE
 
 
em /nethome/admin/.starcluster/admin-smallcluster.config

    #### [key id_rsa-admin-key]
    #### KEYNAME=id_rsa-admin-key
    #### KEY_LOCATION=/nethome/admin/.starcluster/id_rsa-admin-key                         
    [key aquarius2]
    KEYNAME=aquarius2
    KEY_LOCATION=/tmp/aquarius2

  
8. CREATED IMAGE ON HEADNODE

/data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config \
ebsimage \
i-7e387e04 \
eridanus-0.8.0-alpha

    >>> Removing private data...
    >>> Creating EBS image...
    >>> Waiting for AMI ami-11c67678 to become available.
    >>> create_image took 2.824 mins
    >>> Your new AMI id is: ami-11c67678

ec2dim ami-11c67678

    IMAGE	ami-11c67678	728213020069/eridanus-0.8.0-alpha	728213020069	available	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-eaada998	10	


9. UPDATE ami TABLE WITH NEW AMI ID ON MASTER

update ami set amiid='ami-11c67678' where aminame='StarCluster-base';
update cluster set amiid='ami-11c67678';

    
</entry>

<entry [Thu 2012:09:13 02:58:33 EST] FIXED sge.py FAILING TO START SGE>

cat /opt/sge6/admin-microcluster/spool/exec_spool_local/master/messages 

    09/13/2012 05:32:13|  main|master|I|starting up OGS/GE 2011.11 (linux-x64)
    09/13/2012 05:38:07|  main|master|E|commlib error: got read error (closing "master/qmaster/1")


    
</entry>
<entry [Sat 2012:08:18 01:03:47 EST] ami-46d4792f CLOUD BIOLINUX ubuntu 12.04 AMI>

WEBSITE SHOWS UBUNTU 12.04:

http://cloudbiolinux.org/

ami-46d4792f -- Ubuntu 12.04 64bit (27 June 2012)
Amazon EC2 (us-east-1)



AWS CONSOLE ALSO SHOWS UBUNTU 11.10:

ami-0cd17765
678711657553/CloudBioLinux/StarCluster Ubuntu 11.10 64bit 20120523
678711657553

    
</entry>
<entry [Fri 2012:08:17 23:41:07 EST] AVAILABLE StarCluster UBUNTU 11.10 64-BIT BASE AMIS (ALL EBS)>

ami-4583572c
342652561657/starcluster-base-ubuntu-11.10-x86_64-hvm (HADOOP?)
342652561657


ami-999d49f0
342652561657/starcluster-base-ubuntu-11.10-x86_64
342652561657


</entry>
<entry [Wed 2012:01:11 09:29:23 EST] PRUNED DOWN AMIS TO FOUR - TWO LATEST AGUA HEADNODE AND TWO LATEST AGUA CLUSTER>

AGUA HEADNODE
=============

AQUARIUS-8
 ami-ef39f286
728213020069/AQUARIUS-8

aquarius-8f2
 ami-76837d1f
728213020069/aquarius-8f2

AGUA CLUSTER
============

aquarius-8-cluster.4
 ami-78837d11
728213020069/aquarius-8-cluster.4

starcluster-u10.04-hadoop.2
 ami-ca847aa3
728213020069/starcluster-u10.04-hadoop.2

    
</entry>
<entry [Sat 2011:12:03 18:41:16 EST] ami-ef39f286 CREATED (AQUARIUS-8): AGUA 0.6 ON STARCLUSTER UBUNTU 10.04 HADOOP AMI>

1. ARCHIVED LATEST VERSION OF AGUA

/agua/0.6/bin/scripts/archive.pl \
--name agua \
--basedir /agua/0.6 \
--version 0.6 \
--versionfile VERSION \
--outputdir /home/syoung

git archive --format=tar --prefix=0.6-00310-506f5db/ HEAD | gzip > /home/syoung/0.6/agua.0.6-00310-506f5db.tar.gz


2. SELECTED LATEST STARCLUSTER EBS-BACKED AMI IN AWS CONSOLE

StarCluster Base Ubuntu AMI 11.10 x86_64 (US-EAST)
ami-c723e8ae
starcluster-base-ubuntu-11.10-x86_64
342652561657


3. STARTED INSTANCE:

ec2-run-instances \
ami-c723e8ae \
-g default \
-k aquarius2 \
--instance-type m1.large \
-z us-east-1a

    RESERVATION	r-5f23c93e	728213020069	default
    INSTANCE	i-dffac4bc	ami-c723e8ae	ec2-107-20-82-75.compute-1.amazonaws.com	ip-10-124-155-250.ec2.internal	running	aquarius2	0	m1.large	2011-12-04T07:15:51+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	107.20.82.75	10.124.155.250			ebs					paravirtual	xen		sg-2925d740	default
    BLOCKDEVICE	/dev/sda1	vol-9f2d92f2	2011-12-04T07:16:20.000Z	



4. RAN install.pl SCRIPT
    *******************************************************    
    *******************************************************

Agua has been installed here:

    /agua/0.6

There are two more steps to enable your installation:

1. Run the configuration script to set up the mysql database:

    /agua/0.6/bin/scripts/config.pl

2. Browse to your new Agua instance here to provide your EC2 credentials: 

    http://ec2-107-20-82-75.compute-1.amazonaws.com/agua/0.6/agua.html

    *******************************************************    

For added security, you can do this over an HTTPS connection:
        
    https://ec2-107-20-82-75.compute-1.amazonaws.com/agua/0.6/agua.html

In order to do this, you must enable HTTPS access:
    
    a) If you have the ec2-api tools installed, do this:
    
        ec2-authorize default -p 443 -P tcp
        
    or, b) Use the AWS console:

        1. Log in to AWS: http://aws.amazon.com
        2. Click 'EC2' tab
        3. In the left Navigation Bar, click 'Security Groups'
        4. Click on 'default' (or your own, custom security group)
        The security group's details will appear in the bottom pane.
        In the bottom pane, select the 'Inbound' tab and create a
        new 'Custom TCP Rule':

            Port range: 443
            Source:     0.0.0.0/0

    *******************************************************    
    *******************************************************


5. CREATED IMAGE

ON TOSHIBA:

ec2-create-image \
--name AQUARIUS-8 \
-d "AQUARIUS 8: UBUNTU 10.04, STARCLUSTER, HADOOP, AGUA 0.6" \
i-dffac4bc

IMAGE	ami-ef39f286

IMAGE	ami-ef39f286	728213020069/AQUARIUS-8	728213020069	pending	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-6df52208	10	



</entry>
<entry [Sat 2011:09:24 10:30:20 EST] TESTED aquarius-8f2 AS MASTER/EXEC NODE>
 
 
</entry>
<entry [Mon 2011:08:08 06:21:12 EST] LIST OF CURRENT AMIS>


HADOOP
------

starcluster-u10.04-hadoop.2
ami-ca847aa3

starcluster-hadoop-u10.04
ami-167a867f


AQUARIUS-8
----------

aquarius-8f2
ami-76837d1f

aquarius-8f
ami-9a847af3

aquarius-8-cluster.4
ami-78837d11

aquarius-8-cluster.3
ami-f4847a9d

aquarius-8-cluster
ami-5488763d


 
</entry>
<entry [Tue 2011:09:06 22:13:51 EST] CREATED starcluster-u10.04-hadoop.3 WITH ADDED PERL MODULES>

START starcluster-u10.04-hadoop.2 LARGE INSTANCE:

ec2-run-instances \
ami-ca847aa39 \
-g default \
-k aquarius \
--instance-type m1.large -z us-east-1a

DOWNLOAD AGUA:


INSTALL PERL MODULES:

./install.pl

curl -L http://cpanmin.us | perl - App::cpanminus

cpanm install Getopt::Simple


 
</entry>
<entry [Sun 2011:05:15 05:21:54 EST]  ami-78837d11 STUART COPY OF aquarius-8-cluster.4>

ami-78837d11

</entry>
<entry [Sun 2011:05:15 05:08:11 EST] ami-8e827ce7 aquarius-8-cluster.4 ADDED CRON JOB TO FIX MICRO REBOOT>

ec2-create-image --name aquarius-8-cluster.4 --description "Added cron job to fix micro reboot" i-8b1cf6e5

IMAGE	ami-8e827ce7	558277860346/aquarius-8-cluster.4	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-1f4f6770	15	


ec2-modify-image-attribute ami-8e827ce7 -l -a 728213020069
ec2-modify-image-attribute ami-8e827ce7 -l -a 913944561404
ec2-modify-image-attribute ami-8e827ce7 -l -a 983300124420

</entry>
<entry [Sun 2011:05:15 00:50:25 EST] ami-9a847af3 STUART COPY OF aquarius-8f>

COPY OF aquarius-8f2    
 ami-9a847af3

COPY OF aquarius-8f2
ami-76837d1f
 
</entry>

<entry [Sun 2011:05:15 00:12:18 EST] ami-ca847aa3 STUART COPY OF starcluster-u10.04-hadoop.2>
 ami-ca847aa3
</entry>
<entry [Sun 2011:05:15 00:11:02 EST] ami-f4847a9d STUART COPY OF aquarius-8-cluster.3>
    
ami-f4847a9d

</entry>
<entry [Sun 2011:05:15 00:04:25 EST] ami-fc847a95 AQUARIUS-8f AFTER FIXED MICRO INSTANCE REBOOT>

ec2-create-image --name aquarius-8f --description "Fixed micro instance reboot" i-b63811d9
    
IMAGE	ami-fc847a95	558277860346/aquarius-8f	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-edd9f782	15	
BLOCKDEVICEMAPPING	/dev/sdi		snap-11d9f77e	40	
BLOCKDEVICEMAPPING	/dev/sdh		snap-13d9f77c	40

ec2-modify-image-attribute ami-fc847a95 -l -a 728213020069
ec2-modify-image-attribute ami-fc847a95 -l -a 913944561404
ec2-modify-image-attribute ami-fc847a95 -l -a 983300124420

</entry>
<entry [Sat 2011:05:14 23:37:03 EST] ami-38847a51 aquarius-8-cluster.3 AFTER FIXED MICRO INSTANCE REBOOT>
    
ec2-create-image --name aquarius-8-cluster.3 --description "Fixed micro instance reboot" i-ffa04a91

IMAGE	ami-38847a51	558277860346/aquarius-8-cluster.3	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-9df9d7f2	15	

GAVE PERMISSIONS TO syoung, stuartpyoung AND yuching:

ec2-modify-image-attribute ami-38847a51 -l -a 728213020069
ec2-modify-image-attribute ami-38847a51 -l -a 913944561404
ec2-modify-image-attribute ami-38847a51 -l -a 983300124420

</entry>
<entry [Sat 2011:05:14 23:35:33 EST] ami-3a847a53 REIMAGED starcluster-u10.04-hadoop AFTER FIXED MICRO INSTANCE REBOOT>

ec2-create-image --name starcluster-u10.04-hadoop.2 --description "Fixed micro instance reboot" i-f5bd579b

IMAGE	ami-3a847a53	558277860346/starcluster-u10.04-hadoop.2	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-17f6d878	15	

GAVE PERMISSIONS TO syoung, stuartpyoung AND yuching:

ec2-modify-image-attribute ami-3a847a53 -l -a 728213020069
ec2-modify-image-attribute ami-3a847a53 -l -a 913944561404
ec2-modify-image-attribute ami-3a847a53 -l -a 983300124420

</entry>
<entry [Sat 2011:05:14 21:08:54 EST] ami-8e8678e7 aquarius-8-cluster.2 *** CANONICAL ***>

CREATED USING ERIDANUS-8 ami-d08b75b9

ec2-describe-instances i-f35db69d
RESERVATION	r-8b3d8ae7	558277860346	default
INSTANCE	i-f35db69d	ami-d08b75b9	ec2-50-16-46-124.compute-1.amazonaws.com	ip-10-122-98-39.ec2.internal	running	aquarius	0		t1.micro	2011-05-15T01:02:41+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.16.46.124	10.122.98.39			ebs		
BLOCKDEVICE	/dev/sda1	vol-0d4ee866	2011-05-15T01:02:59.000Z

ec2-create-image --name aquarius-8-cluster.2 --description "Clean /etc/fstab" i-f35db69d

    IMAGE	ami-8e8678e7


ec2dim ami-8e8678e7

IMAGE	ami-8e8678e7	558277860346/aquarius-8-cluster.2	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs
BLOCKDEVICEMAPPING	/dev/sda1		snap-79775916	15	


    
    
</entry>

<entry [Sat 2011:05:14 14:35:16 EST] ami-5488763d SYOUNG COPY OF ami-d08b75b9 aquarius-8-cluster *** CANONICAL ***>
    
ec2-modify-image-attribute ami-d08b75b9 -l -a 558277860346
ec2-modify-image-attribute ami-d08b75b9 -l -a 913944561404
ec2-modify-image-attribute ami-d08b75b9 -l -a 983300124420
    

    
</entry>
<entry [Sat 2011:05:14 14:14:55 EST] ami-6688760f aquarius-8-prefix-reboot>

The AMI ID is: ami-6688760f
   
ec2-modify-image-attribute ami-6688760f -l -a 728213020069
ec2-modify-image-attribute ami-6688760f -l -a 913944561404
ec2-modify-image-attribute ami-6688760f -l -a 983300124420

 
</entry>
<entry [Sat 2011:05:14 11:02:54 EST] ami-d08b75b9 aquarius-8-cluster *** CANONICAL *** >

aquarius8-cluster Moose, Mysql, EC@, etc. - NO DOT IN .bash_profile

A new EBS-backed AMI is being created and will
be available in a moment.

The AMI ID is: ami-d08b75b9

GAVE PERMISSIONS TO syoung, stuartpyoung AND yuching:

ec2-modify-image-attribute ami-d08b75b9 -l -a 728213020069
ec2-modify-image-attribute ami-d08b75b9 -l -a 913944561404
ec2-modify-image-attribute ami-d08b75b9 -l -a 983300124420
</entry>

<entry [Fri 2011:05:13 15:26:09 EST] ami-30936d59 aquarius-8-cluster Moose, Mysql, EC2, etc.>

ALL PERL MODULES, ETC. INSTALLED

    The AMI ID is: ami-30936d59

REMOVED cloud-config FROM /etc/stab:

    proc              /proc           proc    nodev,noexec,nosuid 0       0
    /dev/sda1         /               ext3    defaults            0       0
    /dev/sdb1         /mnt            auto    defaults,nobootwait 0       0


TESTED SIMPLE BOOT:

ec2-run-instances \
ami-30936d59 \
-g default \
-k aquarius \
--instance-type t1.micro -z us-east-1a

    OK
    
TESTED IN STARCLUSTER:

plug
sc start syoung-smallcluster



RESERVATION	r-91ce64fd	558277860346	default
INSTANCE	i-51f51a3f	ami-30936d59	ec2-50-17-164-141.compute-1.amazonaws.com	ip-10-127-107-187.ec2.internal	running	aquarius	0		t1.micro	2011-05-14T01:48:19+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.17.164.141	10.127.107.187			ebs					paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-2748ec4c	2011-05-14T01:48:43.000Z	



</entry>
<entry [Mon 2011:05:02 00:07:16 EST] ami-c4e619ad AQUARIUS-8e>
    
    A new EBS-backed AMI is being created and will
    be available in a moment.
    The AMI ID is: ami-c4e619ad

IMAGE	ami-c4e619ad	558277860346/aquarius-8e-presge	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-9ba8c9f4	15	
BLOCKDEVICEMAPPING	/dev/sdh		snap-99a8c9f6	40	
BLOCKDEVICEMAPPING	/dev/sdi		snap-97a8c9f8	40	

</entry>
<entry [Fri 2011:04:24 12:53:27 EST] ami-b07985d9 starcluster-u10.04-64bit-hadoop>

    IMAGE	ami-b07985d9	558277860346/starcluster-u10.04-64bit-hadoop	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-c54ef9aa	15	
    
</entry>
    
<entry [Fri 2011:05:13 16:50:36 EST] ami-988679f1 AQUARIUS 8a3-postconfig>
    
    A new EBS-backed AMI is being created and will
    be available in a moment.
    
    The AMI ID is: ami-988679f1

ec2-describe-images

    IMAGE	ami-8ccc3de5	558277860346/aquarius-75	558277860346	available	private		x86_64	machine	aki-b51cf9dc	ari-b31cf9da		ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-ef6bef82	10	
    BLOCKDEVICEMAPPING	/dev/sdh		snap-e96bef84	40	
    BLOCKDEVICEMAPPING	/dev/sdi		snap-eb6bef86	40	
    IMAGE	ami-ca1deda3	558277860346/aquarius-7b	558277860346	available	private		x86_64	machine	aki-b51cf9dc	ari-b31cf9da		ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-97dee7fa	10	
    BLOCKDEVICEMAPPING	/dev/sdh		snap-91dee7fc	40	
    BLOCKDEVICEMAPPING	/dev/sdi		snap-93dee7fe	40	

    IMAGE	ami-988679f1	558277860346/aquarius-8a3-post-config	558277860346	pending	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-a9b725c6	15	
    IMAGE	ami-728e711b	558277860346/aquarius-8bv2	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-f7891898	15	
    IMAGE	ami-90af5ef9	728213020069/aquarius-7	728213020069	available	private		x86_64	machine	aki-b51cf9dc	ari-b31cf9da		ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-e1a8678c	10

</entry>
<entry [Fri 2011:05:13 20:18:56 EST] ami-728e711b 8bv2 POST-install AND config, MICRO-ENABLED u10.04 HADOOP>

    A new EBS-backed AMI is being created and will
    be available in a moment
    The AMI ID is: ami-728e711b
    

ec2-run-instances ami-728e711b \
-g default \
-k aquarius \
--instance-type m1.large -z us-east-1a

BUT CAN'T CONNECT.


</entry>
<entry [Sun 2012:03:18 13:52:19 EST] ami-c6a877af CREATED ERIDANUS-8>

1. CHECK CURRENT IMAGES

ec2dim
IMAGE	ami-d08b75b9	558277860346/aquarius-8-cluster	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-7bf9d514	15	
IMAGE	ami-38847a51	558277860346/aquarius-8-cluster.3	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-9df9d7f2	15	
IMAGE	ami-8e827ce7	558277860346/aquarius-8-cluster.4	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-1f4f6770	15	
IMAGE	ami-6688760f	558277860346/aquarius-8e-prefix-reboot	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-19daf676	15	
BLOCKDEVICEMAPPING	/dev/sdh		snap-1ddaf672	40	
BLOCKDEVICEMAPPING	/dev/sdi		snap-1bdaf674	40	
IMAGE	ami-fc847a95	558277860346/aquarius-8f	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-edd9f782	15	
BLOCKDEVICEMAPPING	/dev/sdh		snap-13d9f77c	40	
BLOCKDEVICEMAPPING	/dev/sdi		snap-11d9f77e	40	
IMAGE	ami-b07985d9	558277860346/starcluster-u10.04-64bit-hadoop	558277860346	available	private		x86_64	machine	aki-0b4aa462		ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-c54ef9aa	15	
IMAGE	ami-3a847a53	558277860346/starcluster-u10.04-hadoop.2	558277860346	available	private		x86_64	machine	aki-0b4aa462		ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-17f6d878	15	
IMAGE	ami-9c835cf5	728213020069/aquarius-8	728213020069	available	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-39268643	10	
IMAGE	ami-ef39f286	728213020069/AQUARIUS-8	728213020069	available	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-6df52208	10	
TAG	image	ami-ef39f286	Name	AQUARIUS-8
IMAGE	ami-78837d11	728213020069/aquarius-8-cluster.4	728213020069	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-9f466ef0	15	
TAG	image	ami-78837d11	Name	aquarius-8-cluster.4
IMAGE	ami-76837d1f	728213020069/aquarius-8f2	728213020069	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-f7476f98	15	
BLOCKDEVICEMAPPING	/dev/sdi		snap-f5476f9a	40	
BLOCKDEVICEMAPPING	/dev/sdh		snap-f3476f9c	40	
TAG	image	ami-76837d1f	Name	aquarius-8f2
IMAGE	ami-ca847aa3	728213020069/starcluster-u10.04-hadoop.2	728213020069	available	private		x86_64	machine	aki-0b4aa462		ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-83ae80ec	15	
TAG	image	ami-ca847aa3	Name	starcluster-u10.04-hadoop.2
IMAGE	ami-d47b8cbd	983300124420/aquarius-3	983300124420	available	private		x86_64	machine	aki-b51cf9dc	ari-b31cf9da		ebs	paravirtual	xen
BLOCKDEVICEMAPPING	/dev/sda1		snap-bfd5afd5	10	


2. LAUNCH LARGE INSTANCE OF 64-BIT EBS STARCLUSTER IMAGE

AMI ID FROM admin-smallcluster.config FILE

ec2-run-instances \
--key aquarius2 \
ami-999d49f0 \
--instance-type m1.large \
-z us-east-1a 

ec2din i-85dda0e1
RESERVATION	r-ca5693a9	728213020069	default
INSTANCE	i-85dda0e1	ami-999d49f0	ec2-50-17-112-96.compute-1.amazonaws.com	ip-10-88-85-75.ec2.internal	running	aquarius2	0	m1.large	2012-03-18T17:56:05+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	50.17.112.96	10.88.85.75			ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-1f381973	2012-03-18T17:56:25.000Z	

CONNECT
ssh root@ec2-50-17-112-96.compute-1.amazonaws.com
    OK

4. INSTALL PERL PACKAGES AND R

UPLOAD AGUA AND RUN ./install.pl --mode perlmods

ON TOSHIBA
cd /home/syoung/RELEASE
scp agua.0.7.5+build17-efb6efe.tar.gz root@ec2-50-17-112-96.compute-1.amazonaws.com:/

ON REMOTE
cd /
tar xvfz *tar.gz
cd agua*/bin/scripts
./install.pl --mode installPerlMods


INSTALL MOOSE

cpanm install Task::Moose
cpanm install Devel::Declare
cpanm install MooseX::Method::Signatures::Meta::Method --force
cpanm install MooseX::Declare


INSTALL R AND BIOCONDUCTOR

http://cran.r-project.org/bin/linux/ubuntu/README

Install the complete R system:

apt-get update
apt-get install r-base
    OK

NB: THIS ALSO INSTALLS r-base-dev WHICH IS USED TO COMPILE R PACKAGES FROM SOURCE (e.g. for package maintainers, or anyone installing packages with install.packages())


GET R PROMPT:
R

INSTALL BIOCONDUCTOR

source("http://www.bioconductor.org/biocLite.R")
biocLite()

    Welcome to Bioconductor
    
      Vignettes contain introductory material. To view, type
      'browseVignettes()'. To cite Bioconductor, see
      'citation("Biobase")' and for packages 'citation("pkgname")'.
    
    ** help
    *** installing help indices
    ** building package indices ...
    ** testing if installed package can be loaded
    
    * DONE (affyQCReport)
    
    The downloaded packages are in
        ‘/tmp/RtmpWMFIhA/downloaded_packages’
    Warning messages:
    1: In install.packages(pkgs = pkgs, repos = repos, ...) :
      installation of package 'XML' had non-zero exit status
    2: In install.packages(pkgs = pkgs, repos = repos, ...) :
      installation of package 'RCurl' had non-zero exit status
    3: In install.packages(pkgs = pkgs, repos = repos, ...) :
      installation of package 'biomaRt' had non-zero exit status

   
3. CREATED IMAGE ON HEADNODE

/data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config \
ebsimage \
i-85dda0e1 \
eridanus-8

    >>> Removing private data...
    >>> Creating EBS image...
    >>> Waiting for AMI ami-c6a877af to become available... 
    >>> create_image took 1.063 mins
    >>> Your new AMI id is: ami-c6a877af

ec2dim ami-c6a877af
    
    IMAGE	ami-c6a877af	728213020069/eridanus-8	728213020069	available	private		x86_64	machine	aki-825ea7eb			ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-ed09b597	10	


NB: CONFIG FILE LISTS aquarius2 KEY:

cat /nethome/admin/.starcluster/admin-smallcluster.config

    [global]
    DEFAULT_TEMPLATE=admin-smallcluster
    ENABLE_EXPERIMENTAL=True
    
    [cluster admin-smallcluster]
    AVAILABILITY_ZONE=us-east-1a
    CLUSTER_SIZE=1
    CLUSTER_USER=sgeadmin
    KEYNAME=aquarius2
    NODE_IMAGE_ID=ami-999d49f0
    NODE_INSTANCE_TYPE=t1.micro
    PLUGINS=automount,sge,startup
    
    [aws info]
    AWS_ACCESS_KEY_ID=AKIAIKZHIY7T75JIF34A
    AWS_SECRET_ACCESS_KEY=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
    AWS_USER_ID=728213020069
    
    [key aquarius2]
    KEYNAME=aquarius2
    KEY_LOCATION=/home/syoung/agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa-aquarius2


    
</entry>
