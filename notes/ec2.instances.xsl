ec2.instances



<entry [Tue 2013:11:26 23:19:44 EST] RESTARTED CURRENT AGUA INSTANCE TO DOWNLOAD apps.tar.gz>

ec2start i-cf86f0b2

ec2din i-cf86f0b2
RESERVATION	r-e8529d8e	728213020069	default
INSTANCE	i-cf86f0b2	ami-b3bd0fda	ec2-54-237-22-88.compute-1.amazonaws.com	ip-10-126-35-32.ec2.internal	running	aquarius2	0	m1.medium	2013-11-27T07:19:43+0000	us-east-1a	aki-825ea7eb	monitoring-disabled	54.237.22.88	10.126.35.32			ebs	paravirtual	xen		sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-bd2604c7	2012-10-08T02:25:39.000Z	true		
BLOCKDEVICE	/dev/sdh	vol-a44142de	2012-10-11T01:31:02.000Z	false		

cd /data2
scp ubuntu@ec2-54-237-22-88.compute-1.amazonaws.com:/data/apps.tar.gz .


	
</entry>
<entry [Tue 2013:11:26 17:09:23 EST] MODIFIED CURRENT AGUA INSTANCE AS m1.medium AND RESTARTED THEN STOPPED>

MODIFIED

ec2-modify-instance-attribute  \
--instance-type m1.medium \
i-cf86f0b2


LAUNCHED

ec2start i-cf86f0b2
ec2din i-cf86f0b2
RESERVATION	r-e8529d8e	728213020069	default
INSTANCE	i-cf86f0b2	ami-b3bd0fda	ec2-184-72-159-65.compute-1.amazonaws.com	domU-12-31-38-04-B8-8A.compute-1.internal	pending	aquarius20m1.medium	2013-11-27T01:44:17+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	184.72.159.65	10.220.187.120			ebs					paravirtual	xen		sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-bd2604c7	2012-10-08T02:25:39.000Z	true		
BLOCKDEVICE	/dev/sdh	vol-a44142de	2012-10-11T01:31:02.000Z	false


CONNECTED

ssh ubuntu@ec2-184-72-159-65.compute-1.amazonaws.com


TOO SLOW TO DOWNLOAD /data/apps.tar.gz -- RETRY TOMORROW

NO CONFLUENCE INSTALLATION

	
</entry>
<entry [Wed 2013:10:09 10:36:16 EST] RESTARTED CURRENT AGUA INSTANCE AS m1.large AND DOWNLOADED apps.tar.gz>

ec2-modify-instance-attribute  \
--instance-type m1.large \
i-cf86f0b2

ec2start i-cf86f0b2
ec2din i-cf86f0b2

ssh root@ec2-23-20-118-24.compute-1.amazonaws.com



COPIED aquarius2 KEY TO id_rsa

cd /home/syoung/.ssh
cp id_rsa-aquarius2 id_rsa
chmod 400 id_rsa*


DOWNLOADED apps TO comp2:

cd /mnt
scp root@ec2-23-20-118-24.compute-1.amazonaws.com:/data/apps.tar.gz


**** ABANDONED BECAUSE NOT ENOUGH BANDWIDTH ****




    
</entry>
<entry [Fri 2013:06:21 23:19:23 EST] CREATED MYXY LARGE INSTANCE>

1. STARTED INSTANCE

AMI     eridanus-0.8.0-alpha.2

ec2-run-instances \
ami-b3bd0fda \
-g default \
-k aquarius5-keypair \
--instance-type m1.small \
-z us-east-1a

ec2din i-2c67c640

RESERVATION	r-504f5a3f	728213020069	default
INSTANCE	i-2c67c640	ami-b3bd0fda	ec2-54-226-70-93.compute-1.amazonaws.com    ip-10-125-6-135.ec2.internal	pending	aquarius5-keypair	0		m1.small2013-06-22T06:22:28+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	54.226.70.93	10.125.6.135			ebs			paravirtual	xen		sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-9bb530c1	2013-06-22T06:22:32.000Z	true


2. LABELED THIS $xy IN .bash_profile

#### XY NODE                                                                   
export xy=i-2c67c640
export XYIP=ec2-54-226-70-93.compute-1.amazonaws.com
alias xy='ssh root@$XYIP'


3. CONNECTED

xy

    OK


4. ADDED TAGS

ec2-create-tags i-2c67c640 \
--tag source=ami-b3bd0fda \
--tag name=MYXY \
--tag description="Added MyXY plugin to Agua"



    
</entry>
<entry [Tue 2013:06:11 00:25:17 EST] LAUNCHED 'CONFLUENCE-4' TO INSTALL CONFLUENCE 4.3.5>

1. STARTED INSTANCE

AMI     eridanus-0.8.0-alpha.2

ec2-run-instances \
ami-b3bd0fda \
-g default \
-k aquarius5-keypair \
--instance-type m1.small \
-z us-east-1a

ec2din i-09bc7c6b



2. LABELED THIS $head2 IN .bash_profile

#### HEADNODE 2                                                                   
export head2=i-09bc7c6b
export HEADIP2=ec2-184-73-35-56.compute-1.amazonaws.com
alias hn2='ssh root@$HEADIP2'

RESERVATION	r-a5a5ccc8	728213020069	default
INSTANCE	i-09bc7c6b	ami-b3bd0fda	ec2-184-73-35-56.compute-1.amazonaws.com	ip-10-120-251-122.ec2.internal	running	aquarius5-keypair	0m1.small	2013-06-11T07:27:08+0000	us-east-1a	aki-825ea7eb	monitoring-disabled	184.73.35.56	10.120.251.122			ebs	paravirtual	xen		sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-03bd8258	2013-06-11T07:27:12.000Z	true


3. CONNECTED

hn2

    OK


4. ADDED TAGS

ec2-create-tags i-09bc7c6b \
--tag source=ami-b3bd0fda \
--tag name=CONFLUENCE-4 \
--tag description="CONFLUENCE 4.3.5"


    
</entry>
<entry [Mon 2013:06:10 22:43:08 EST] RESTARTED NEW AGUA INSTANCE ('CONFLUENCE-5') AND INSTALLED CONFLUENCE 5.1.3>

1. RESTARTED INSTANCE

echo $head
    i-a20527cb
ec2start $head

RESERVATION	r-6c0fc704	728213020069	default
INSTANCE	i-a20527cb	ami-b3bd0fda	ec2-23-20-108-109.compute-1.amazonaws.com	ip-10-123-22-123.ec2.internal	running	aquarius5-keypair	0		m1.large	2013-06-11T05:43:59+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	23.20.108.109	10.123.22.123			ebs			paravirtual	xen		sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-a1ab08fa	2013-05-31T08:32:26.000Z	true

2. CONNECTED AS root

cd /home/syoung/notes/agua/keypair/syoung/ec2
ssh -i aquarius5-keypair.pem root@ec2-23-20-108-109.compute-1.amazonaws.com

    OK

    
3. INSTALLED CONFLUENCE
see [Mon 2013:06:10 23:00:19 EST] INSTALLED CONFLUENCE 5.1.3 ON EC2 m1.large


4. ADDED TAGS


ec2-create-tags i-a20527cb \
--tag source=ami-b3bd0fda \
--tag name=CONFLUENCE-5 \
--tag description="CONFLUENCE 5.1.3"



    
</entry>
<entry [Fri 2013:05:31 01:23:06 EST] CREATED NEW AGUA INSTANCE>
    
AMI     eridanus-0.8.0-alpha.2

eridanus-0.8.0-alpha.2 (ami-b3bd0fda)
Description:	Image created @ 201209250229
Status:	available
Platform:	Other Linux
Image size:	10 GB
Visibility:	Private
Owner:	syoung 728213020069


ec2-run-instances \
ami-b3bd0fda \
-g default \
-k aquarius5-keypair \
--instance-type m1.large \
-z us-east-1a


RESERVATION	r-6c0fc704	728213020069	default
INSTANCE	i-a20527cb	ami-b3bd0fda	ec2-54-226-82-240.compute-1.amazonaws.com   ip-10-87-11-204.ec2.internal	running	aquarius5-keypair	0		m1.large	2013-05-31T08:32:20+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	54.226.82.240	10.87.11.204			ebs					paravirtual	xen		sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-a1ab08fa	2013-05-31T08:32:26.000Z	true	



CONNECTED ***AS root USER***:

cd /home/syoung/notes/agua/keypair/syoung/ec2
ssh -i aquarius5-keypair.pem root@ec2-54-226-82-240.compute-1.amazonaws.com


    
</entry>
<entry [Fri 2013:05:31 00:26:28 EST] RESTARTED CURRENT AGUA INSTANCE i-cf86f0b2>

*** STARTED BUT CAN'T ACCESS BECAUSE OF DELETED KEYPAIR aquarius2 ***

ec2start i-cf86f0b2
    OK

ec2din i-cf86f0b2

RESERVATION	r-e8529d8e	728213020069	default
INSTANCE	i-cf86f0b2	ami-b3bd0fda	ec2-54-226-138-204.compute-1.amazonaws.com	ip-10-91-27-105.ec2.internal	running	aquarius2	0		m1.small	2013-05-31T08:15:03+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	54.226.138.204	10.91.27.105			ebs					paravirtual	xen		sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-bd2604c7	2012-10-08T02:25:39.000Z	true		
BLOCKDEVICE	/dev/sdh	vol-a44142de	2012-10-11T01:31:02.000Z	false	

    
</entry>
<entry [Mon 2013:01:28 05:51:51 EST] CURRENT AGUA INSTANCE>


ec2din $head

RESERVATION	r-e8529d8e	728213020069	default
INSTANCE	i-cf86f0b2	ami-b3bd0fda	ec2-184-72-155-64.compute-1.amazonaws.com	ip-10-120-179-238.ec2.internal	running	aquarius2	0		m1.small	2013-01-28T10:36:39+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	184.72.155.64	10.120.179.238			ebs			paravirtual	xen		sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-bd2604c7	2012-10-08T02:25:39.000Z	true		
BLOCKDEVICE	/dev/sdh	vol-a44142de	2012-10-11T01:31:02.000Z	false		
BLOCKDEVICE	/dev/sdi	vol-044b487e	2012-10-11T01:34:14.000Z	false	
    
</entry>
<entry [Thu 2012:12:27 23:14:52 EST] aguadev CONFLUENCE INSTANCE>

1. SELECTED ami-b3bd0fda ERIDANUS-0.8.0-alpha.2 FOR CONFLUENCE INSTANCE

    (POST install.pl AND config.pl)
    

2. syoung USER ALLOWS aguadev USER TO ACCESS ERIDANUS-0.8.0-alpha.2 AMI

aguadev USER ID: 711151400914

ec2-modify-image-attribute ami-b3bd0fda -l -a 711151400914
    launchPermission	ami-b3bd0fda	ADD	userId	711151400914


3. CREATED SSH PRIVATE KEYPAIR FOR LOGGING INTO INSTANCE

SEE ec2.credentials.xls
[Mon 2012:12:17 21:10:00 EST] aguadev CREDENTIALS



4. COPY aguadev X.509 PRIVATE AND PUBLIC KEYS TO aguadev USER HOME DIR

mkdir /home/aguadev/.keypair
cp /home/syoung/notes/agua/keypair/aguadev/pk-ABUIOJUST7NT7LIPAH6UK5ZSZMJBINBL.pem /home/aguadev/.keypair/privatekey.pem
cp /home/syoung/notes/agua/keypair/aguadev/cert-ABUIOJUST7NT7LIPAH6UK5ZSZMJBINBL.pem /home/aguadev/.keypair/publiccert.pem

emacs -nw /home/aguadev/.bash_profile
    export EC2_PRIVATE_KEY=~/.keypair/privatekey.pem
    export EC2_CERT=~/.keypair/publiccert.pem

emacs /home/aguadev/.bashrc
    source ~/.bash_profile


5. OPENED PORTS 22 AND 23 IN AWS CONSOLE

Security Groups --> Inbound --> Port Range: 22-23 --> Add Rule --> Apply Rule Changes

REPEAT FOR PORTS: 80, 443


**** NB: DON'T FORGET TO 'APPLY RULE CHANGES'


   
6. aguadev USER STARTS INSTANCE

su aguadev
source .bash_profile 
echo $EC2_PRIVATE_KEY
    /home/aguadev/.keypair/privatekey.pem

ec2-run-instances \
ami-b3bd0fda \
-g default \
-k aguadev \
--instance-type t1.micro \
-z us-east-1a
    
    OK

ec2din 

    RESERVATION	r-aac7bcd2	711151400914	default
    INSTANCE	i-05c12174	ami-b3bd0fda	ec2-184-72-170-28.compute-1.amazonaws.com	domU-12-31-39-02-DE-90.compute-1.internal	running	aguadev0t1.micro	2012-12-29T08:13:57+0000	us-east-1a	aki-825ea7eb	monitoring-disabled	184.72.170.28	10.248.225.122			ebs	paravirtual	xen		sg-ae4d7ec6	default	false	
    BLOCKDEVICE	/dev/sda1	vol-8cfde8f3	2012-12-29T08:14:01.000Z	true		
    TAG	instance	i-05c12174	Name	confluence4.3.5


7. CONNECTED TO CONFLUENCE INSTANCE

ssh -v root@ec2-54-234-76-111.compute-1.amazonaws.com
    OK
    
    
8. SWITCHED OFF FAST CGI

emacs -nw /etc/apache2/apache2.conf

 

9. RESTARTED INSTANCE AS m1.small

SET INSTANCE ID AS 'head' ENVIRONMENT VARIABLE
    
    #### AGUADEV INSTANCE                                                           
    export head=i-05c12174
    export HEADIP=ec2-184-72-170-28.compute-1.amazonaws.com
    alias hn='ssh root@$HEADIP'


ec2stop $head    
ec2-modify-instance-attribute  \
--instance-type m1.small \
$head
    instanceType	i-05c12174	m1.small

ec2start $head
ec2din $head
    RESERVATION	r-aac7bcd2	711151400914	default
    INSTANCE	i-05c12174	ami-b3bd0fda	ec2-54-243-20-133.compute-1.amazonaws.com	ip-10-190-133-159.ec2.internal	running	aguadev	0		m1.small	2012-12-29T09:30:25+0000	us-east-1a	aki-825ea7eb		monitoring-disabled	54.243.20.133	10.190.133.159			ebs	paravirtual	xen		sg-ae4d7ec6	default	false	
    BLOCKDEVICE	/dev/sda1	vol-8cfde8f3	2012-12-29T08:14:01.000Z	true		
    TAG	instance	i-05c12174	Name	confluence4.3.5


</entry>
<entry [Wed 2012:12:19 09:50:58 EST] i-cf86f0b2: SOLE REMAINING INSTANCE AFTER CLEANUP>

ec2din

RESERVATION	r-e8529d8e	728213020069	default
INSTANCE	i-cf86f0b2	ami-b3bd0fda	ec2-23-20-244-162.compute-1.amazonaws.com	ip-10-122-250-26.ec2.internal	running	aquarius2	0		m1.small	2012-12-18T02:00:37+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	23.20.244.162	10.122.250.26			ebs					paravirtual	xen	sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-bd2604c7	2012-10-08T02:25:39.000Z	true		
BLOCKDEVICE	/dev/sdh	vol-a44142de	2012-10-11T01:31:02.000Z	false		
BLOCKDEVICE	/dev/sdi	vol-044b487e	2012-10-11T01:34:14.000Z	false		

ec2dvol

VOLUME	vol-7665bf1e	40	snap-55fe4a3f	us-east-1a	in-use	2010-12-24T09:14:47+0000	standard	
VOLUME	vol-bd2604c7	10	snap-31c7f044	us-east-1a	in-use	2012-10-08T02:25:37+0000	standard	
ATTACHMENT	vol-bd2604c7	i-cf86f0b2	/dev/sda1	attached	2012-10-08T02:25:39+0000
VOLUME	vol-a44142de	200	snap-6341b301	us-east-1a	in-use	2012-10-11T01:30:42+0000	standard	
ATTACHMENT	vol-a44142de	i-cf86f0b2	/dev/sdh	attached	2012-10-11T01:31:02+0000
TAG	volume	vol-a44142de	name	/data
TAG	volume	vol-a44142de	description	DATA: 200GB REFERENCE SEQS, APPS AND JBROWSE DATA WITH urlTemplates
VOLUME	vol-044b487e	200	snap-e6380792	us-east-1a	in-use	2012-10-11T01:33:57+0000	standard	
ATTACHMENT	vol-044b487e	i-cf86f0b2	/dev/sdi	attached	2012-10-11T01:34:14+0000
TAG	volume	vol-044b487e	name	/nethome
TAG	volume	vol-044b487e	description	NETHOME including JBrowse features for test1, test2, control1 and control2

    
</entry>
<entry [Wed 2012:12:19 00:48:38 EST] TERMINATED ERIDANUS-0.8.0-alpha.2 USED FOR FINAL init.html TESTS BEFORE BETA>

1. GOT INSTANCE INFO

RESERVATION	r-2e9e6048	728213020069	default
INSTANCE	i-dda13aa0	ami-b3bd0fda	ec2-67-202-19-143.compute-1.amazonaws.com	ip-10-123-46-194.ec2.internal	running	aquarius2	0		m1.small	2012-12-19T05:47:42+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	67.202.19.143	10.123.46.194			ebs					paravirtual	xen		sg-2925d740	default	false	
BLOCKDEVICE	/dev/sda1	vol-2e055254	2012-10-06T12:50:30.000Z	false		
BLOCKDEVICE	/dev/sdi	vol-4d1b3e37	2012-10-07T05:22:14.000Z	false		
TAG	instance	i-dda13aa0	source	ami-b3bd0fda
TAG	instance	i-dda13aa0	description	FINAL init.html TESTS BEFORE BETA
TAG	instance	i-dda13aa0	name	ERIDANUS-0.8.0-alpha.2


2. CONNECTED AND CHECKED DATA

NOTHING TO ARCHIVE ASIDE FROM .bash_profile FILE

alias conf='cd /agua/conf'
alias er='tail -f -n 100 /var/log/apache2/error.log'
alias html='cd /var/www/html/agua'
alias cgi='cd /var/www/cgi-bin/agua'
alias ll='ls -al'
alias em='emacs -nw'
alias mq='mysql -u root -p12345678 agua'
alias gobash='emacs -nw ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias shrd='shred -f -v -z -u'
alias modin='ec2-modify-instance-attribute --instance-type '
alias llH='ls -alh | egrep -v -e "\s+\.\S*$"'
alias sas='service apache2 restart; killall /usr/bin/perl;'
alias se='service apache2 stop'
alias sb='service apache2 restart'
alias pg='ps aux | grep '
alias master='sc sshmaster admin-smallcluster'
alias p='ps auxf'
alias scrip='cd /agua/bin/scripts'
alias lig='cd /agua/lib/Agua'
alias lib='cd /agua/lib'
alias lic='cd /agua/lib/Agua/Common'
alias gitdesc='git describe --abbrev=0 --tags'
alias gitlog='git log --decorate --graph --oneline'
alias ag='cd /agua'


3. TERMINATED INSTANCE

ec2kill i-dda13aa0

4. KILLED STRAY VOLUMES



    
</entry>
<entry [Tue 2012:12:18 23:25:25 EST] i-b34d25d2: TERMINATED aquarius-8f2 (aquarius2 KEYFILE) USED TO TEST BOWTIE, NOVOALIGN AND MAQ PIPELINES>

SUMMARY: RETRIEVED WORKFLOWS AND SAVED TO /agua/private/bin/sql/dump/agua-head1.dump THEN TERMINATED

SEE [Tue 2012:12:18 21:31:36 EST]
ARCHIVED workflows AND /data FROM head BEFORE TERMINATION

1. GOT INSTANCE INFO

RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f	ec2-23-22-140-171.compute-1.amazonaws.com	ip-10-122-6-105.ec2.internal	running	aquarius2	0		t1.micro	2012-12-19T02:15:16+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	23.22.140.171	10.122.6.105			ebs					paravirtual	xensg-2925d740	default	false	
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-08-08T10:53:42.000Z	false		
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-10-22T01:10:37.000Z	false		
BLOCKDEVICE	/dev/sdk	vol-53155839	2011-10-28T20:32:59.000Z	false		
BLOCKDEVICE	/dev/sdl	vol-5bffe631	2012-01-11T07:51:18.000Z	false		
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)

NOTE THIS INSTANCE HAS /data (40GB) AND VOLUMES FOR mysql:

df -ah
    Filesystem            Size  Used Avail Use% Mounted on
    /dev/sda1              15G  9.2G  4.9G  66% /
    proc                     0     0     0   -  /proc
    none                     0     0     0   -  /sys
    none                     0     0     0   -  /sys/kernel/debug
    none                     0     0     0   -  /sys/kernel/security
    devtmpfs              295M  120K  294M   1% /dev
    none                     0     0     0   -  /dev/pts
    none                  308M     0  308M   0% /dev/shm
    none                  308M   84K  308M   1% /var/run
    none                  308M     0  308M   0% /var/lock
    none                  308M     0  308M   0% /lib/init/rw
    /dev/sdi               40G   12G   26G  31% /nethome
    /nethome/mysql/etc/mysql
                           40G   12G   26G  31% /etc/mysql
    /nethome/mysql/lib/mysql
                           40G   12G   26G  31% /var/lib/mysql
    /nethome/mysql/log/mysql
                           40G   12G   26G  31% /var/log/mysql
    /dev/sdk               40G   20G   18G  53% /data
    rpc_pipefs               0     0     0   -  /var/lib/nfs/rpc_pipefs
    nfsd                     0     0     0   -  /proc/fs/nfsd



   
2. REENABLED API TERMINATION

ec2-modify-instance-attribute   --disable-api-termination false i-b34d25d2
    OK

ec2-describe-instance-attribute   --disable-api-termination i-b34d25d2



3. TERMINATED INSTANCE

ec2kill i-b34d25d2



4. DELETED VOLUMES





    
</entry>
<entry [Sun 2012:10:07 22:23:41 EST] RAN ERIDANUS-0.8.0-alpha.2 FROM NEW agua:aguadev VERSION 0.8.0-alpha.1+build37>

1. START ERIDANUS-0.8.0-alpha.2

ec2-run-instances \
ami-b3bd0fda \
-g default \
-k aquarius2 \
--instance-type m1.small \
-z us-east-1a

RESERVATION	r-e8529d8e	728213020069	default
INSTANCE	i-cf86f0b2	ami-b3bd0fda	ec2-23-22-215-154.compute-1.amazonaws.com	ip-10-86-149-252.ec2.internal	running	aquarius2	0		m1.small	2012-10-08T19:42:22+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	23.22.215.154	10.86.149.252			ebs		paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-bd2604c7	2012-10-08T02:25:39.000Z	
BLOCKDEVICE	/dev/sdh	vol-6b3c1111	2012-10-08T05:47:30.000Z	
BLOCKDEVICE	/dev/sdi	vol-b03815ca	2012-10-08T05:52:36.000Z

    
</entry>
<entry [Thu 2012:10:04 22:15:14 EST] i-dda13aa0 RAN ERIDANUS-0.8.0-alpha.2 TO COMPLETE init.html TEST>

1. CREATED SNAPHOST snap-2a82cd5e OF /nethome WITH JBROWSE FEATURES (test1, test2, control1, control2)

SEE ec2.snapshots
[Fri 2012:10:05 13:07:49 EST] snap-2a82cd5e SNAPSHOT OF /nethome INCLUDING JBROWSE FEATURES FOR USER admin>


2. START ERIDANUS-0.8.0-alpha.2

ec2-run-instances \
ami-b3bd0fda \
-g default \
-k aquarius2 \
--instance-type m1.small \
-z us-east-1a

RESERVATION	r-2e9e6048	728213020069	default
INSTANCE	i-dda13aa0	ami-b3bd0fda			pending	aquarius2	0		m1.small	2012-10-05T17:57:15+0000us-east-1a	aki-825ea7eb			monitoring-disabled					ebs					paravirtual	xen		sg-2925d740	default

ec2-create-tags i-dda13aa0 \
--tag source=ami-b3bd0fda \
--tag name=ERIDANUS-0.8.0-alpha.2 \
--tag description="FINAL init.html TESTS BEFORE BETA"

RESERVATION	r-2e9e6048	728213020069	default
INSTANCE	i-dda13aa0	ami-b3bd0fda	ec2-23-22-220-172.compute-1.amazonaws.com	ip-10-90-170-208.ec2.internal	running	aquarius2	0		m1.small	2012-10-05T17:57:15+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	23.22.220.172	10.90.170.208			ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-2e055254	2012-10-05T17:57:25.000Z	
TAG	instance	i-dda13aa0	source	ami-b3bd0fda
TAG	instance	i-dda13aa0	description	FINAL init.html TESTS BEFORE BETA
TAG	instance	i-dda13aa0	name	ERIDANUS-0.8.0-alpha.2


RESTARTED:
ec2din $head2
RESERVATION	r-2e9e6048	728213020069	default
INSTANCE	i-dda13aa0	ami-b3bd0fda	ec2-50-19-167-230.compute-1.amazonaws.com	ip-10-86-151-165.ec2.internal	running	aquarius2	0		m1.small	2012-10-06T01:21:11+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	50.19.167.230	10.86.151.165			ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-2e055254	2012-10-05T17:57:25.000Z	
TAG	instance	i-dda13aa0	source	ami-b3bd0fda
TAG	instance	i-dda13aa0	description	FINAL init.html TESTS BEFORE BETA
TAG	instance	i-dda13aa0	name	ERIDANUS-0.8.0-alpha.2


3. UPGRADE TO agua-0.8.0-alpha.1+build35

    OK

    
    
4. INITIALISE USING snap-2a82cd5e /nethome SNAPSHOT

reset; ./init.pl '{"username":"agua","mode":"init","data":{"username":"admin","password":"aaa","amazonuserid":"728213020069","datavolume":"snap-6341b301","uservolume":"snap-2a82cd5e","datavolumesize":200,"uservolumesize":200,"ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy\nNDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w\nDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ\neWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr\ndtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5\n9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK\nBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti\nZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7\ncPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU\nbs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z\n0626imzblXE8IA==\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ\nWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ\nNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC\ngYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3\n8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG\nM6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC\naE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK\npzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9\n4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc\n6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC\nQQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN\nukFcKuTSGIpO\n-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIKZHIY7T75JIF34A","awssecretaccesskey":"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","SHOWLOG":4},"SHOWLOG":4}'


[Sun 2012:10:07 03:39:13 EST] 
RESTARTED BUT CAN'T CONNECT SO STOPPED
    

</entry>
<entry [Mon 2012:10:01 21:50:42 EST] i-674fff1a RESCUE INSTANCE TO FIX i-7ba84006 USED TO TEST init.html>

1. TEST init.html INSTANCE:

ec2din $head2

RESERVATION	r-f3745b94	728213020069	default
INSTANCE	i-7ba84006	ami-11c67678	ec2-174-129-135-76.compute-1.amazonaws.com	ip-10-122-187-121.ec2.internal	running	aquarius2	0	m1.small	2012-10-01T20:45:06+0000	us-east-1a	aki-825ea7eb		monitoring-disabled	174.129.135.76	10.122.187.121			ebs	paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-4f68cf35	2012-09-24T20:47:17.000Z	
BLOCKDEVICE	/dev/sdh	vol-4b472531	2012-10-01T21:22:25.000Z	
BLOCKDEVICE	/dev/sdi	vol-fb442681	2012-10-01T21:26:06.000Z	
TAG	instance	i-7ba84006	description	TESTING init.html
TAG	instance	i-7ba84006	name	aquarius-8h


2. START RESCUE INSTANCE:

ec2-run-instances \
ami-11c67678 \
-g default \
-k aquarius2 \
--instance-type t1.micro \
-z us-east-1a


ec2din $head3

RESERVATION	r-71889016	728213020069	default
INSTANCE	i-674fff1a	ami-11c67678	ec2-54-242-9-191.compute-1.amazonaws.com	domU-12-31-38-01-C6-80.compute-1.internal	running	aquarius2	0		t1.micro	2012-10-02T01:51:43+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	54.242.9.191	10.253.201.138			ebs				paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-1997fb63	2012-10-02T01:51:50.000Z	
BLOCKDEVICE	/dev/sdh	vol-4f68cf35	2012-10-02T02:00:29.000Z


3. ATTACHED TEST init.html BOOT VOLUME TO RESCUE INSTANCE AND CHANGED /etc/fstab TO THIS:

#LABEL=cloudimg-rootfs  /        ext4   defaults        0 0
/dev/xvdh       /data           ext3    defaults,nobootwait     0       0
/dev/xvdi       /nethome        ext3    defaults,nobootwait     0       0
#/dev/sdh       /data           nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
#/dev/sdi       /nethome        nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
#/nethome/mysql/etc/mysql /etc/mysql     none bind
#/nethome/mysql/var/log/mysql /var/log/mysql     none bind
#/nethome/mysql/var/lib/mysql /var/lib/mysql     none bind


4. DETACHED / VOLUME FROM RESCUE INSTANCE AND RE-ATTACHED TO TEST init.html INSTANCE:

ec2-attach-volume vol-4f68cf35 -i i-7ba84006 -d /dev/sda1



5. START UP TEST init.html AND CONNECT

    OK!!!


</entry>
<entry [Mon 2012:09:24 08:47:49 EST] i-7ba84006 RAN ERIDANUS-0.8.0-alpha TO FIX init.html>

ALSO CREATED ERIDANUS-0.8.0-alpha.2
SEE [Tue 2012:09:25 01:26:39 EST]
ami-b3bd0fda ERIDANUS-0.8.0-alpha.2 POST install.pl AND config.pl

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
    
</entry>
<entry [Sat 2012:08:18 02:32:38 EST] i-b34d25d2: CURRENT STOPPED - AQUARIUS-8F2 AND BIOLINUX>

 ec2din
RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f			stopped	aquarius2	0		m1.small	2012-08-17T21:10:51+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs					paravirtualxen		sg-2925d740	default
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2012-08-18T06:31:48.000Z	
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2012-08-18T06:31:48.000Z	
BLOCKDEVICE	/dev/sdk	vol-53155839	2012-08-18T06:31:48.000Z	
BLOCKDEVICE	/dev/sdl	vol-5bffe631	2012-08-18T06:31:48.000Z	
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)
RESERVATION	r-72745b16	728213020069	default
INSTANCE	i-4f99da34	ami-0cd17765			stopped	aquarius2	0		m1.large	2012-08-18T04:56:45+0000	us-east-1a	aki-825ea7eb			monitoring-disabled					ebs					paravirtualxen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-4f495e37	2012-08-18T06:30:43.000Z	



RESTARTED [Thu 2012:10:04 22:30:40 EST] 

ec2din i-b34d25d2
RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f	ec2-174-129-179-177.compute-1.amazonaws.com	ip-10-122-58-240.ec2.internal	running	aquarius20		m1.small	2012-10-05T02:30:02+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.179.177	10.122.58.240			ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-08-08T10:53:42.000Z	
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-10-22T01:10:37.000Z	
BLOCKDEVICE	/dev/sdk	vol-53155839	2011-10-28T20:32:59.000Z	
BLOCKDEVICE	/dev/sdl	vol-5bffe631	2012-01-11T07:51:18.000Z	
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)





</entry>
<entry [Fri 2012:08:17 23:46:18 EST] CREATED AQUARIUS-9 WITH BIOLINUX STARCLUSTER 11.10 UBUNTU 64-BIT>

ec2-run-instances \
ami-0cd17765 \
-g default \
-k aquarius2 \
--instance-type m1.large \
-z us-east-1a

    RESERVATION	r-72745b16	728213020069	default
    INSTANCE	i-4f99da34	ami-0cd17765			pending	aquarius2	0		m1.large	2012-08-18T04:56:45+0000	us-east-1a	aki-825ea7eb			monitoring-disabled					ebs					paravirtual	xen	sg-2925d740	default


ec2din i-4f99da34
    RESERVATION	r-72745b16	728213020069	default
    INSTANCE	i-4f99da34	ami-0cd17765	ec2-23-21-6-150.compute-1.amazonaws.com	ip-10-124-163-6.ec2.internal	running	aquarius2	0		m1.large	2012-08-18T04:56:45+0000	us-east-1a	aki-825ea7eb		monitoring-disabled	23.21.6.150	10.124.163.6			ebs	paravirtual	xen		sg-2925d740	default
    BLOCKDEVICE	/dev/sda1	vol-4f495e37	2012-08-18T04:57:14.000Z

POWERED DOWN:

ec2stop $head2
INSTANCE	i-4f99da34	running	stopping

    
</entry>
<entry [Fri 2012:02:10 09:25:03 EST] i-b34d25d2: AQUARIUS-8F2 CHANGED INSTANCE TYPE FROM m1.large TO t1.micro>

ec2-modify-instance-attribute \
--instance-type t1.micro \
$head
    instanceType	i-b34d25d2	t1.micro

    
</entry>
<entry [Wed 2012:02:08 17:00:31 EST] RESTARTED AQUARIUS-8F2 TO TEST AUTOINSTALL OF bioapps, agua AND biorepository>
    
ec2din $head
RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f	ec2-50-17-176-177.compute-1.amazonaws.com	ip-10-90-238-23.ec2.internal	running	aquarius2	0	m1.large	2012-02-08T21:59:11+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.17.176.177	10.90.238.23			ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2012-02-08T21:59:53.000Z	
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2012-02-08T21:59:53.000Z	
BLOCKDEVICE	/dev/sdk	vol-53155839	2012-02-08T21:59:53.000Z	
BLOCKDEVICE	/dev/sdl	vol-5bffe631	2012-02-08T21:59:53.000Z	
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)



</entry>
<entry [Mon 2012:01:16 17:44:28 EST] RESTARTED AQUARIUS-8F2 WITH ec2minatt MODIFIED INSTANCE TYPE (m1.large)>

ec2-modify-instance-attribute \
--instance-type m1.large \
$head

    ec2din instanceType	i-b34d25d2	m1.large

ec2start $head
ec2din $head

    RESERVATION	r-cb22aca4	728213020069	default
    INSTANCE	i-b34d25d2	ami-76837d1f	ec2-107-21-81-73.compute-1.amazonaws.com	ip-10-86-133-195.ec2.internal	running	aquarius2	0	m1.large	2012-01-16T22:55:35+0000	us-east-1a	aki-0b4aa462		monitoring-disabled	107.21.81.73	10.86.133.195			ebs	paravirtual	xen		sg-2925d740	default
    BLOCKDEVICE	/dev/sdi	vol-161ce07c	2012-01-16T22:56:11.000Z	
    BLOCKDEVICE	/dev/sda1	vol-101ce07a	2012-01-16T22:56:11.000Z	
    BLOCKDEVICE	/dev/sdk	vol-53155839	2012-01-16T22:56:11.000Z	
    BLOCKDEVICE	/dev/sdl	vol-5bffe631	2012-01-16T22:56:11.000Z	
    TAG	instance	i-b34d25d2	name	aquarius-8g
    TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)


</entry>
<entry [Wed 2012:01:11 02:11:36 EST] GET MAXIMUM NUMBER OF NODES AVAILABLE ON EC2>


http://alestic.com/2011/08/ec2-max-instances

By Eric Hammond on August 15, 2011 7:00 AM | 5 Comments
[Update: As predicted, these numbers are already out of date and Amazon has added more public IP address ranges for use by EC2 in various regions.]

Each standard Amazon EC2 instance has a public IP address. This is true for normal instances when they are first brought up and for instances which have had elastic IP addresses assigned to them. Your EC2 instance still has a public IP address even if you have configured the security group so that it cannot be contacted from the Internet, which happens to be the default setting for security groups.

Amazon has made public the EC2 IP address ranges that may be in use for each region.

From this information, we can calculate the absolute upper limit for the number of concurrently running standard EC2 instances that could possibly be supported in each region. At the time of this writing I calculate the hard upper limits to be:

EC2 Region	Max Instances*
us-east-1	585,704
us-west-1	98,298
eu-west-1	135,156
ap-southeast-1	43,000
ap-northeast-1	34,808


*Caveats:

An upper limit based on the IP address ranges does not tell you what the real number of possible instances is in a given EC2 region. It’s just an upper limit.

Amazon is sure to keep requesting, reserving, and announcing more IP addresses than is actively needed by EC2 at any point in time. Only they know the growth buffer percentage that they like to maintain.

Amazon may need to use different ranges of IP addresses for different groups of instances in different parts of their network, even in the same data center or availability zone, so they may publish and start using new ranges of IP addresses even before they are even near using up the capacity of previous ranges.

Amazon is free to add new IP address blocks to the list at any time as they keep growing, and they do. The specific numbers above could be out of date by the time you read this.

There are probably some IP addresses in each range that are reserved for various networking devices and protocols.

This calculation is for concurrently running EC2 instances. Many instances run for just a few minutes or hours and another instance, perhaps for another customer, can start up and use that same IP address moments later.

EC2 instances running inside Amazon VPC don’t necessarily use up an external IP address in Amazon’s EC2 public IP address ranges, so they are not included in the upper limits.

I am not a networking expert. I only play one at my startup.

Anything else I’m missing?

[Update 2012-12-27: Correct URL for Amazon’s latest IP address list.]

Categories: EC2, PlanetUbuntu, Ubuntu, UbuntuCloud
Tags: Amazon, AWS, EC2, instances, IP addresses, research
5 COMMENTS

  Eric Hammond | August 15, 2011 6:28 PM | Reply
For those lacking a calculator (what are you reading this on?) those numbers total up to 896,966. Let's just call that "nearly a million" public IP addresses reserved by Amazon for use with EC2 instances!
  dean.hiller | September 8, 2011 1:23 PM | Reply

Except many people use VPC so they have a NAT and behind that NAT have many more computers and only one Elastic ip ;). We had 100 nodes running behind "one Elastic ip" early this week for some tests.
  Eric Hammond replied to comment from dean.hiller | September 12, 2011 12:03 AM | Reply
dean.hiller:

Yes, I mentioned VPC in the notes.
  https://www.google.com/accounts/o8/id?id=AItOawk1m3IK4oSEGrQPDwDV6iL5huIOzg9_LY0 | September 18, 2011 11:59 AM | Reply


Well, the most important point is that a lot of people actually use load-balancers (both manually o
r configured by beans-talk or cloud-fromation) and you don't need IPs for each of the servers behind a load-balancer. In our cases the number of servers per IP is roughly 1:100 and keeps growing.
  Eric Hammond replied to comment from https://www.google.com/accounts/o8/id?id=AItOawk1m3IK4oSEGrQPDwDV6iL5huIOzg9_LY0 | September 19, 2011 3:
  
  
</entry>
<entry [Wed 2012:01:11 02:06:32 EST] SET LOCK ON aquarius-8f2 TO PREVENT TERMINATION >
    
ec2-describe-instance-attribute   --disable-api-termination i-b34d25d2

    disableApiTermination	i-b34d25d2	false


ec2-modify-instance-attribute   --disable-api-termination true  i-b34d25d2

    disableApiTermination	i-b34d25d2	true

    OK
    
</entry>
<entry [Wed 2012:01:11 01:59:25 EST] USE --disable-api-termination ON LAUNCH TO LOCK INSTANCE AGAINST TERMINATION>

LOCK INSTANCE AGAINST TERMINATION:

ec2-run-instances   --disable-api-termination   [...]

Now, if you try to terminate the instance, you will get an error like:

Client.OperationNotPermitted: The instance 'i-XXXXXXXX' may not be terminated.
Modify its 'disableApiTermination' instance attribute and try again.
Yay!

UNLOCK AND TERMINATE INSTANCE:

To unlock the instance and allow termination through the API, use a command like:

ec2-modify-instance-attribute   --disable-api-termination false   INSTANCEID
Then end it all with:

ec2-terminate-instances INSTANCEID


    
</entry>
<entry [Wed 2012:01:11 01:58:25 EST] KILLED i-3ba8c35a (aquarius-8) AND i-b8e489d8 (aquarius-8?)>
    
KILLED aquarius-8 AND DESTROYED /data VOLUME:

ec2-modify-instance-attribute   --disable-api-termination false   i-3ba8c35a
ec2kill i-3ba8c35a

Client.OperationNotPermitted: The instance 'i-3ba8c35a' may not be terminated. Modify its 'disableApiTermination' instance attribute and try again.

ec2dvol vol-622bd108
ec2-delete-volume vol-622bd108



ALSO KILLED UNTAGGED STOPPED aquarius8? INSTANCE:

ec2kill i-b8e489d8
INSTANCE	i-b8e489d8	stopped	terminated

... AND DELETED ITS VOLUMES:

BLOCKDEVICE	/dev/sda1	vol-59155833	2011-09-27T23:05:25.000Z	
BLOCKDEVICE	/dev/sdi	vol-5d155837	2011-09-27T23:05:25.000Z	

ec2delvol vol-59155833
ec2delvol vol-5d155837	


</entry>
<entry [Tue 2012:01:10 05:57:52 EST] CLEANED UP INSTANCES TO LEAVE JUST ONE AGUA DEVEL INSTANCE WITH 200GB DATA VOLUME>

EXTRACTED WORKFLOWS FROM OLD aquarius-8 (i-3ba8c35a)
====================================================


1. DETACH OLD aquarius-8 /data VOLUME FROM NEW aquarius-8f2

BLOCKDEVICE	/dev/sdh	vol-622bd108	2011-08-10T19:10:49.000Z	

ec2start i-b34d25d2
ec2din i-b34d25d2
    RESERVATION	r-cb22aca4	728213020069	default
    INSTANCE	i-b34d25d2	ami-76837d1f	ec2-174-129-117-248.compute-1.amazonaws.com	ip-10-122-90-215.ec2.internal	running	aquarius2	0	t1.micro	2012-01-10T11:03:19+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.117.248	10.122.90.215			ebs					paravirtual	xen		sg-2925d740	default
    BLOCKDEVICE	/dev/sdi	vol-161ce07c	2012-01-10T11:04:04.000Z    <==== /nethome	
    BLOCKDEVICE	/dev/sda1	vol-101ce07a	2012-01-10T11:04:04.000Z	
    BLOCKDEVICE	/dev/sdj	vol-622bd108	2012-01-10T11:04:04.000Z	<==== 40GB  OLD aquarius-8 /data
    BLOCKDEVICE	/dev/sdl	vol-5bffe631	2012-01-10T11:04:04.000Z	<==== 200GB DATA VOLUME
    BLOCKDEVICE	/dev/sdk	vol-53155839	2012-01-10T11:04:04.000Z	<==== 40GB  OLD aquarius-8? /data 
    TAG	instance	i-b34d25d2	name	aquarius-8g
    TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)

ec2-detach-volume vol-622bd108
ec2dvol vol-622bd108

RESTORE /data VOLUME TO OLD aquarius-8

ec2-attach-volume -i i-3ba8c35a -d /dev/sdh vol-622bd108
ec2start i-3ba8c35a
ec2din i-3ba8c35a


BUT aquarius-8 WON'T BOOT SO DIDN'T BOTHER TO FIX:

loud-init running: Wed, 11 Jan 2012 03:20:43 +0000. up 9.21 seconds
init: statd-mounting main process (364) killed by TERM signal
mount.nfs: remote share not in 'host:dir' format
mount.nfs: remote share not in 'host:dir' format
mountall: Disconnected from Plymouth
mountall: mount /data [376] terminated with status 32
mountall: mount /nethome [381] terminated with status 32
mount.nfs: remote share not in 'host:dir' format
mountall: mount /nethome [395] terminated with status 32

ec2din i-3ba8c35a

RESERVATION	r-e171f88e	728213020069	default
INSTANCE	i-3ba8c35a	ami-76837d1f	ec2-50-19-71-66.compute-1.amazonaws.com	domU-12-31-38-04-18-4D.compute-1.internal	running	aquarius2	0t1.micro	2012-01-11T03:20:05+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.19.71.66	10.220.27.187		ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sdi	vol-d8fa05b2	2012-01-11T03:20:57.000Z	<=== /nethome
BLOCKDEVICE	/dev/sda1	vol-dafa05b0	2012-01-11T03:20:57.000Z	<=== /
BLOCKDEVICE	/dev/sdh	vol-622bd108	2012-01-11T03:20:57.000Z	<=== /data
TAG	instance	i-3ba8c35a	name	aquarius-8g-LARGE
TAG	instance	i-3ba8c35a	description	aquarius-8f2 using aquarius2 WITH LARGE INSTANCE to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)


INSTEAD, STOPPED aquarius-8, REATTACHED ITS /data TO aquarius-8f AND DID TRIAGE IN /mnt/data:

ec2stop i-3ba8c35a
ec2-detach-volume vol-d8fa05b2
ec2-attach-volume -i i-b34d25d2 -d /dev/sdj vol-d8fa05b2
mount /dev/sdj /mnt/data

COPIED MYSQL DATA FILES:

cd /mnt/data/mysql/lib/mysql
tar cvfz agua-mysql-datafiles.tar.gz agua
mv agua-mysql-datafiles.tar.gz /root

THEN DOWNLOADED TO TOSHIBA:

mkdir -p /home/syoung/agua/archive-data
mv agua-mysql-datafiles.tar.gz /home/syoung/agua/archive-data
cd /home/syoung/agua/archive-data
tar xvfz *

THEN EXCHANGED WITH CURRENT AGUA DATABASE ON TOSHIBA:

sudo ls -al /var/lib/mysql/agua
    -rw-rw---- 1 mysql mysql  8846 2012-01-02 00:22 access.frm
    -rw-rw---- 1 mysql mysql   224 2012-01-02 00:22 access.MYD
    -rw-rw---- 1 mysql mysql  2048 2012-01-02 00:22 access.MYI
    -rw-rw---- 1 mysql mysql  8754 2012-01-02 00:22 ami.frm
    ...

sudo mv /var/lib/mysql/agua /var/lib/mysql/agua.safe
sudo cp -r agua /var/lib/mysql

NB: FIXED PERMISSIONS ON NEW agua DIRECTORY:

sudo su
cd /var/lib/mysql
chmod -R 660 agua
chown -R mysql:mysql agua
chmod 700 agua

AND DUMPED DATA FROM app AND parameter TABLES:

select * from parameter into outfile '/tmp/parameter.tsv.csv';
Query OK, 152 rows affected (0.00 sec)

mysql> select * from app into outfile '/tmp/app.tsv.csv';
Query OK, 23 rows affected (0.00 sec)

mysql> select count(*) from parameter where paramFunction !='';
+----------+
| count(*) |
+----------+
|       16 |
+----------+
1 row in set (0.00 sec)



... AND MOVED THE OUTPUT .tsv FILES TO /agua/0.6/restricted/paramFunction:

mkdir -p /agua/0.6/restricted/paramFunction
sudo mv /tmp/*tsv.csv /agua/0.6/restricted/paramFunction



NB: dumpDb.pl FAILED UNTIL I DROPPED SOME TABLES WITH MISSING *.MYD/*.MYI FILES:

    diffs
    groupmember
    project
    sessions
    source
    workflow


TO AVOID THIS ERROR:
    mysqldump: Got error: 1146: Table 'agua.project' doesn't exist when using LOCK TABLES
    dumpfile head:

AND RAN IT OKAY:

/agua/0.6/bin/scripts/dumpDb.pl --db agua --outputdir /agua/0.6/bin/sql/dump

    /agua/0.6/bin/sql/dump/agua.2012-01-11-01:24:34.dump

CHANGED THE FILENAME:

mv /agua/0.6/bin/sql/dump/agua.2012-01-11-01:24:34.dump /agua/0.6/bin/sql/dump/agua.2012-01-11-01:24:34.aquarius-8-paramFunctions.dump


... TO CREATE THIS FINAL DUMP FILE:

/agua/0.6/bin/sql/dump/agua.2012-01-11-01:24:34.aquarius-8-paramFunctions.dump


DETACHED aquarius-8 /nethome VOLUME FROM aquarius-8f AND DESTROYED IT:

umount /mnt/data

ec2-detach-volume vol-d8fa05b2 -f 
ec2-delete-volume vol-d8fa05b2

THEN KILLED aqaurius-8 AND ANOTHER aquarius-8? INSTANCE (SEE NEXT POSTS)


... AND REATTACHED 200 GB DATA TO aquarius-8f2 AFTER IT GOT DETACHED WHEN REBOOTED NODE
WHEN aquarius-8 /data VOLUME WOULD NOT DETACH:


ec2attvol -i i-b34d25d2 -d /dev/sdl vol-5bffe631
    ATTACHMENT	vol-5bffe631	i-b34d25d2	/dev/sdl	attaching	2012-01-11T07:51:18+0000

ec2dvol vol-5bffe631
    VOLUME	vol-5bffe631	200		us-east-1a	in-use	2011-10-28T20:24:49+0000
    ATTACHMENT	vol-5bffe631	i-b34d25d2	/dev/sdl	attached	2012-01-11T07:51:26+0000


... AND STOPPED aquarius-8f

ec2stop i-b34d25d2
    OK

</entry>
<entry [Thu 2011:10:13 22:48:21 EST] RESCUE INSTANCE FOR aquarius-8f2 HEADNODE AFTER SSH HANGS>

1. LAUNCH RESCUE INSTANCE

ec2-run-instances \
--key aquarius2 \
ami-76837d1f \
--instance-type t1.micro \
-z us-east-1a 

    RESERVATION	r-e69a2688	728213020069	default
    INSTANCE	i-f0340890	ami-76837d1f			pending	aquarius2	0		t1.micro	2011-10-14T02:47:23+0000	us-east-1a	aki-0b4aa462			monitoring-disabledebs					paravirtual	


ec2din i-f0340890

    RESERVATION	r-e69a2688	728213020069	default
    INSTANCE	i-f0340890	ami-76837d1f	ec2-107-20-59-35.compute-1.amazonaws.com	ip-10-126-35-210.ec2.internal	running	aquarius2	0		t1.micro	2011-10-14T02:47:23+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	107.20.59.35	10.126.35.210		ebs					paravirtual	
    BLOCKDEVICE	/dev/sda1	vol-272a1d4d	2011-10-14T02:47:56.000Z	
    BLOCKDEVICE	/dev/sdi	vol-252a1d4f	2011-10-14T02:47:56.000Z	
    BLOCKDEVICE	/dev/sdh	vol-3b2a1d51	2011-10-14T02:47:56.000Z	    


2. CONNECT

ssh root@ec2-107-20-59-35.compute-1.amazonaws.com
    OK


3. DETACH VOLUME AND ATTACH TO RESCUE INSTANCE

ON TOSHIBA
ec2-detach-volume vol-101ce07a

ON HEADNODE
ec2-attach-volume -i i-f0340890 -d /dev/sdk vol-101ce07a


4. EXAMINE /ETC/HOSTS ON RESCUE INSTANCE

cat /mnt/etc/hosts

    127.0.0.1 localhost
    
    # The following lines are desirable for IPv6 capable hosts
    ::1 ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    ff02::3 ip6-allhosts

    domU-12-31-38-04-E2-CE 10.122.194.11 ip-10-122-194-11.ec2.internal localhost
    10.220.125.32 domU-12-31-38-04-7E-D6.compute-1.internal


COMMENT OUT LAST TWO LINES:

    #domU-12-31-38-04-E2-CE 10.122.194.11 ip-10-122-194-11.ec2.internal localhost
    #10.220.125.32 domU-12-31-38-04-7E-D6.compute-1.internal



5. RESTORE VOLUME

ON RESCUE:
umount /mnt

ON TOSHIBA:
ec2-detach-volume vol-101ce07a

ec2-attach-volume -i i-b34d25d2 -d /dev/sda1 vol-101ce07a

ec2-start-instances i-b34d25d2


RESTART MASTER:

ec2-start-instances i-98b09ef8
    INSTANCE	i-98b09ef8	running	running


ec2din $master
    RESERVATION	r-56c97c38	728213020069	@sc-syoung-microcluster
    INSTANCE	i-98b09ef8	ami-78837d11	ec2-174-129-77-130.compute-1.amazonaws.com	ip-10-126-43-231.ec2.internal	running	id_rsa-admin-key	0		t1.micro	2011-10-14T02:42:31+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.77.130	10.126.43.231			ebs			paravirtual	
    BLOCKDEVICE	/dev/sda1	vol-d1b798bb	2011-10-14T02:42:55.000Z	
    TAG	instance	i-98b09ef8	alias	master


CONNECT TO MASTER FROM TOSHIBA:

export SGE_QMASTER_PORT=36341; export SGE_EXECD_PORT=36342; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung;
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-174-129-77-130.compute-1.amazonaws.com



PROBLEM STARTING SGE ON MASTER
==============================

PROBLEM: GET ERROR 'can't get configuration from qmaster' WHEN STARTING SGE EXECD

/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd 

... HANGS AND GIVES ERROR MESSAGE:

cat /tmp/execd_messages.1462 

    10/14/2011 04:00:20|  main|ip-10-125-6-139|E|communication error for "ip-10-125-6-139.ec2.internal/execd/1" running on port 36342: "can't bind socket"
    10/14/2011 04:00:21|  main|ip-10-125-6-139|E|commlib error: can't bind socket (no additional information available)
    10/14/2011 04:01:08|  main|ip-10-125-6-139|E|can't find connection
    10/14/2011 04:01:08|  main|ip-10-125-6-139|E|can't get configuration from qmaster -- backgrounding


DIAGNOSIS:

HOST NAME HAS CHANGED AFTER RESTART SO NEED TO UPDATE IN act_qmaster:



SOLUTION:

UPDATE act_qmaster ON MASTER (AS WELL AS HEADNODE)


cat /opt/sge6/syoung-microcluster/common/act_qmaster 
    ip-10-125-6-139.ec2.internal

hostname
    ip-10-126-43-231.ec2.internal

echo "ip-10-126-43-231.ec2.internal" > /opt/sge6/syoung-microcluster/common/act_qmaster


NOW CAN START EXECD OKAY:

export SGE_QMASTER_PORT=36341; export SGE_EXECD_PORT=36342; export SGE_ROOT=/opt/sge6; export SGE_CELL=syoung-microcluster; export USERNAME=syoung;
/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd 




    
</entry>
<entry [Mon 2011:08:08 11:43:13 EST] LAUNCHED m1.large INSTANCE OF aquarius-8f2 AMI WITH aquarius2>
    
1. LAUNCHED aquarius-8f2 LARGE INSTANCE

ec2-run-instances \
--key aquarius2 \
ami-76837d1f \
--instance-type m1.large \
-z us-east-1a 

ec2-create-tags i-3ba8c35a \
--tag name=aquarius-8g-LARGE \
--tag description="aquarius-8f2 using aquarius2 WITH LARGE INSTANCE to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)"

RESERVATION	r-e171f88e	728213020069	default
INSTANCE	i-3ba8c35a	ami-76837d1f	ec2-50-19-13-34.compute-1.amazonaws.com	domU-12-31-38-00-64-4E.compute-1.internal	running	aquarius2	0		m1.large	2011-08-10T19:08:59+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.19.13.34	10.252.107.188			ebs			paravirtual	
BLOCKDEVICE	/dev/sda1	vol-dafa05b0	2011-08-10T19:10:49.000Z	
BLOCKDEVICE	/dev/sdi	vol-d8fa05b2	2011-08-10T19:10:49.000Z	
BLOCKDEVICE	/dev/sdh	vol-622bd108	2011-08-10T19:10:49.000Z	
TAG	instance	i-3ba8c35a	name	aquarius-8g-LARGE
TAG	instance	i-3ba8c35a	description	aquarius-8f2 using aquarius2 WITH LARGE INSTANCE to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)


NOTES
-----


OLD INFO:


RESERVATION	r-e171f88e	728213020069	default
INSTANCE	i-3ba8c35a	ami-76837d1f	ec2-174-129-117-54.compute-1.amazonaws.com	domU-12-31-38-00-A8-71.compute-1.internal	running	aquarius2	0		m1.large	2011-08-10T06:13:35+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.117.54	10.252.175.127			ebs			paravirtual	
BLOCKDEVICE	/dev/sda1	vol-dafa05b0	2011-08-10T06:14:07.000Z	
BLOCKDEVICE	/dev/sdi	vol-d8fa05b2	2011-08-10T06:14:07.000Z	
BLOCKDEVICE	/dev/sdh	vol-defa05b4	2011-08-10T06:14:07.000Z	
TAG	instance	i-3ba8c35a	name	aquarius-8g-LARGE
TAG	instance	i-3ba8c35a	description	aquarius-8f2 using aquarius2 WITH LARGE INSTANCE to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)
syoung@Satellite-L355:~$ 


RESERVATION	r-e171f88e	728213020069	default
INSTANCE	i-3ba8c35a	ami-76837d1f	ec2-50-16-164-104.compute-1.amazonaws.com	ip-10-120-66-136.ec2.internal	running	aquarius2	0		m1.large	2011-08-08T23:06:15+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.16.164.104	10.120.66.136			ebs					paravirtual	
BLOCKDEVICE	/dev/sda1	vol-dafa05b0	2011-08-08T23:06:46.000Z	
BLOCKDEVICE	/dev/sdi	vol-d8fa05b2	2011-08-08T23:06:46.000Z	
BLOCKDEVICE	/dev/sdh	vol-defa05b4	2011-08-08T23:06:46.000Z	
TAG	instance	i-3ba8c35a	name	aquarius-8g-LARGE
TAG	instance	i-3ba8c35a	description	aquarius-8f2 using aquarius2 WITH LARGE INSTANCE to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)


RESERVATION	r-e171f88e	728213020069	default
INSTANCE	i-3ba8c35a	ami-76837d1f	ec2-174-129-69-54.compute-1.amazonaws.com	domU-12-31-38-07-1A-E1.compute-1.internal	running	aquarius2	0		m1.large	2011-08-08T15:44:18+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.69.54	10.223.25.11			ebs			paravirtual	
BLOCKDEVICE	/dev/sda1	vol-dafa05b0	2011-08-08T15:44:46.000Z	
BLOCKDEVICE	/dev/sdi	vol-d8fa05b2	2011-08-08T15:44:46.000Z	
BLOCKDEVICE	/dev/sdh	vol-defa05b4	2011-08-08T15:44:46.000Z




</entry>
<entry [Mon 2011:08:08 06:54:51 EST] i-b34d25d2: aquarius-8f2 AMI WITH aquarius2 PRIVATE KEY TO TEST BOWTIE, NOVOALIGN AND MAQ PIPELINES>

aquarius-8f2: FROZEN WHILE ONWORKING WORKFLOW ENVARS

1. LAUNCHED INSTANCE

ec2-run-instances \
--key aquarius2 \
ami-76837d1f \
--instance-type t1.micro \
-z us-east-1a 

    RESERVATION	r-cb22aca4	728213020069	default
    INSTANCE	i-b34d25d2	ami-76837d1f	ec2-174-129-46-0.compute-1.amazonaws.com	domU-12-31-38-04-E2-CE.compute-1.internal	running	aquarius2	0		t1.micro	2011-08-08T10:53:39+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.46.0	10.220.225.56			ebs			paravirtual	
    BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-08-08T10:54:10.000Z	
    BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-08-08T10:54:10.000Z	
    BLOCKDEVICE	/dev/sdh	vol-141ce07e	2011-08-08T10:54:10.000Z	
    TAG	instance	i-b34d25d2	name	aquarius-8g


2. ADDED TAGS TO INSTANCE

ec2-create-tags i-b34d25d2 \
--tag name=aquarius-8g \
--tag description="aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)"

    TAG	instance	i-b34d25d2	name	aquarius-8g
    TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)



3. ADDED 'default' GROUP TO INSTANCE

ec2-run-instances \
--debug \
--verbose \
ami-78837d11 \
-g default \
--key aquarius2 \
--instance-type t1.micro \
--availability-zone us-east-1a


4. CONNECTED


export HEADNODE_IP='ec2-174-129-46-0.compute-1.amazonaws.com'
export AQUARIUS2='/home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa'
alias headnode='ssh -i $AQUARIUS2 $HEADNODE_IP'
headnode

    
</entry>
<entry [Thu 2011:06:16 10:28:53 EST] snap-34f4925a LATEST SNAPSHOT OF /data >


SHARE WITH 728213020069


    
</entry>
<entry [Sat 2011:05:14 23:57:10 EST] i-b63811d9	aquarius-8e FIXED REBOOT PROBLEM>

RESERVATION	r-476e942b	558277860346	default
INSTANCE	i-b63811d9	ami-b07985d9	ec2-174-129-137-49.compute-1.amazonaws.com	ip-10-122-13-145.ec2.internal	running	aquarius	0		m1.large	2011-05-20T14:30:24+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.137.49	10.122.13.145			ebs					paravirtual	xen	sg-0a0da063	default
BLOCKDEVICE	/dev/sdh	vol-15599e7e	2011-05-20T14:30:54.000Z	
BLOCKDEVICE	/dev/sdi	vol-956fa8fe	2011-05-20T14:30:54.000Z	
BLOCKDEVICE	/dev/sda1	vol-ef78bc84	2011-05-20T14:30:54.000Z	
TAG	instance	i-b63811d9	name	aquarius-8e

**** CREATED IMAGE: AQUARIUS-8f


</entry>
<entry [Sat 2011:05:14 21:29:03 EST] i-f5bd579b 2ND PROBE OF i-ffa04a91 aquarius-8-cluster.2 *** CANONICAL ***>

aquarius-8-cluster.2 FAILED TO BOOT (AS DID VERSION 1)

ec2-run-instances \
ami-b07985d9 \
-g default \
-k aquarius \
--instance-type t1.micro \
-z us-east-1a


RESERVATION	r-cb13a4a7	558277860346	default
INSTANCE	i-f5bd579b	ami-b07985d9	ec2-50-17-57-12.compute-1.amazonaws.com	ip-10-122-195-95.ec2.internal	running	aquarius	0		t1.micro	2011-05-15T01:33:34+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.17.57.12	10.122.195.95			ebs					paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-db51f7b0	2011-05-15T01:34:01.000Z


THE SOLUTION TO THE t1.micro REBOOT PROBLEM
-------------------------------------------

RAN THIS ON starcluster-u10.04-hadoop INSTANCE i-f5bd579b AND ON aquarius-8-cluster

1. UNCOMMENT ONE OF THE /dev/sdb1 LINES IN /etc/fstab

proc         /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1    /               ext3    defaults            0       0
/dev/sdb1    /mnt            auto    defaults,nobootwait 0       0
#/dev/sdb1      /mnt    auto    defaults,comment=cloudconfig    0       0  /dev/sda1   /mnt    auto    defaults,comment=cloudconfig    0   0

2. REINSTALL cloud-init 

l="deb http://archive.ubuntu.com/ubuntu lucid-proposed main"
echo "$l" | sudo tee -a /etc/apt/sources.list
sudo apt-get update && sudo apt-get install cloud-init
dpkg-query --show cloud-init

    cloud-init	0.5.10-0ubuntu1.5

3. REBOOTED INSTANCE 

    OK!!!!




MOUNT ON PROBE
==============
VOLUME vol-1554f27e:

# DETACH ROOT VOLUME FROM 8e AND ATTACH TO EXPLORATORY:
ec2-stop-instances i-ffa04a91
ec2-detach-volume vol-1554f27e
ec2-describe-volumes vol-1554f27e
ec2-attach-volume -i i-f5bd579b -d /dev/sdx vol-1554f27e

# ON EXPLORATORY:
ssh -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@ec2-50-17-57-12.compute-1.amazonaws.com

mkdir -p /mnt/8e
mount /dev/sdx /mnt/8e


REMOUNT
=======

umount /mnt/8e

ec2-detach-volume vol-1554f27e
ec2-describe-volumes vol-1554f27e
ec2-attach-volume -i i-ffa04a91 -d /dev/sda1 vol-1554f27e
ec2-start-instances i-ffa04a91
ec2-describe-instances i-ffa04a91


CHANGES
========

1. REMOVED BOTH DUPLICATE /dev/sdb1 LINES (ONE /mnt AND ONE cloud-config) FROM /etc/fstab:

    proc              /proc           proc    nodev,noexec,nosuid 0       0
    /dev/sda1         /               ext3    defaults            0       0

#/dev/sdb1 /mnt auto defaults,nobootwait                     0       0
#/dev/sdb1      /mnt    auto    defaults,comment=cloudconfig 0       0       


2. ENABLED BOOT LOG

emacs /etc/default/bootlogd

CHANGED:
        BOOTLOGD_ENABLE=No
        
TO:
        BOOTLOGD_ENABLE=Yes


3. CHECKED VAR LOGS ON i-ffa04a91 aquarius-8-cluster.2:

/var/log/dmesg
    ...
    [    5.992806] type=1505 audit(1305421383.526:9):  operation="profile_load" pid=391 name="    /usr/sbin/tcpdump"
    [    6.762894] GFS2: path_lookup on /dev/sdb1 returned error -2

/var/log/syslog

    May 15 01:03:06 ip-10-120-66-235 init: plymouth-stop pre-start process (624) terminated with status 1
    May 15 01:03:11 ip-10-120-66-235 kernel: [   13.763073] eth0: no IPv6 routers present
    May 15 01:04:01 ip-10-120-66-235 cron[457]: (*system*cloudinit-updates) RELOAD (/etc/cron.d/cloudinit-updates)


/var/log/daemon.log

    May 15 01:03:06 ip-10-120-66-235 /etc/mysql/debian-start[595]: Triggering myisam-recover for all MyISAM tables
    May 15 01:03:06 ip-10-120-66-235 init: plymouth-stop pre-start process (624) terminated with status 1

NB: /etc/cron.d/cloudinit-updates IS AN UPDATE SCRIPT:

    03 01 * * * root uec-query-builds --system-suite --config /etc/cloud/build.info --output /var/lib/cloud/data/available.build is-update-available


RESTARTED aquarius-8-cluster.2 BUT STILL WON'T START! 



REMOUNTED ON PROBE AND CHECKED BOOT LOG BUT IT WAS THE SAME AS LAST TIME: 

/mnt/8e/var/log# cat boot

    (Nothing has been logged yet.)


MORE CHANGES
============

CHANGED /etc/fstab FROM THIS:

proc              /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1         /               ext3    defaults            0       0
/dev/sdb1       /mnt    auto    defaults,comment=cloudconfig    0       0


TO THIS:

proc         /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1    /               ext3    defaults            0       0
/dev/sdb1    /mnt            auto    defaults,nobootwait 0       0


REBOOTED aquarius-8-cluster AND IT WORKS!!!!!


RESERVATION	r-d52d9ab9	558277860346	default
INSTANCE	i-ffa04a91	ami-8e8678e7	ec2-50-17-175-86.compute-1.amazonaws.com	domU-12-31-38-00-AA-4A.compute-1.internal	running	aquarius	0		t1.micro	2011-05-15T03:30:06+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.17.175.86	10.252.173.180			ebs					paravirtualxen		sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-1554f27e	2011-05-15T03:30:40.000Z



**** FOLLOWED UP BY REINSTALLING UPDATED cloud-init (SEE ABOVE)
**** ON BOTH starcluster-u10.04-hadoop AND aquarius-8-cluster
**** AND RE-IMAGED BOTH



NOTES
------

FIX MICRO REBOOT SOLUTION
-------------------------

http://stackoverflow.com/questions/3679156/ec2-small-to-micro-instance-downgrade-problems
Commenting the line out doesn't fix it fully. If you reboot, it will write the same line back in. You need to:

l="deb http://archive.ubuntu.com/ubuntu lucid-proposed main"
echo "$l" | sudo tee -a /etc/apt/sources.list
sudo apt-get update && sudo apt-get install cloud-init
dpkg-query --show cloud-init

cloud-init	0.5.10-0ubuntu1.5

I'm assuming this will be fixed in the official Ubuntu release soon and you won't have to do this, but for now...

Source: https://bugs.launchpad.net/ubuntu/+source/cloud-init/+bug/634102

Also, we have a couple images based off the official Ubuntu AMI's that work on Micro's: http://blog.simpledeployr.com/2010/09/new-ruby-amis-with-latest-ubuntu-lucid.html



CLOUD-INIT RELATED STUFF
------------------------

IN STARCLUSTER MAILING LIST:

THIS IS RUN AT BOOT
/usr/bin/cloud-init

CONFIG INFO IS HERE
ls /etc/cloud/templates/
default-locale.tmpl  hosts.tmpl           sources.list.tmpl


GENERAL INFO:
locate cloud-config.txt
    /usr/share/doc/cloud-init/examples/cloud-config.txt.gz
    /usr/share/doc/cloud-init/examples/upstart-cloud-config.txt
    /var/lib/cloud/data/cloud-config.txt




</entry>

<entry [Sat 2011:05:14 21:13:04 EST] i-ffa04a91 FROM ami-8e8678e7 - TEST aquarius-8-cluster.2>

ec2-run-instances \
ami-8e8678e7 \
-g default \
-k aquarius \
--instance-type t1.micro \
-z us-east-1a
 
RESERVATION	r-d52d9ab9	558277860346	default
INSTANCE	i-ffa04a91	ami-8e8678e7	ec2-184-73-140-108.compute-1.amazonaws.com	ip-10-122-41-203.ec2.internal	running	aquarius	0		t1.micro	2011-05-15T01:14:01+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	184.73.140.108	10.122.41.203			ebs		
BLOCKDEVICE	/dev/sda1	vol-1554f27e	2011-05-15T01:14:27.000Z	

CAN'T CONNECT:    
sshi ec2-184-73-140-108.compute-1.amazonaws.com

NO CONSOLE OUTPUT:
ec2-get-console-output i-ffa04a91

    i-ffa04a91
    2011-05-15T01:17:24+0000


AFTER 2ND PROBE
(SEE  [Sat 2011:05:14 21:29:03 EST] i-f5bd579b 2ND PROBE OF i-ffa04a91 aquarius-8-cluster.2 *** CANONICAL *** )


RESERVATION	r-d52d9ab9	558277860346	default
INSTANCE	i-ffa04a91	ami-8e8678e7	ec2-184-73-1-183.compute-1.amazonaws.com	ip-10-122-234-87.ec2.internal	running	aquarius	0		t1.micro	2011-05-15T02:34:04+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	184.73.1.183	10.122.234.87			ebs					paravirtual	xensg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-1554f27e	2011-05-15T02:34:29.000Z	

CAN'T CONNECT~
    sshi ec2-184-73-1-183.compute-1.amazonaws.com


STOPPED AND RE-PROBED:



</entry>
<entry [Sat 2011:05:14 20:49:31 EST] i-1357bc7d FROM starcluster-u10.04-hadoop TO PROBE i-f35db69d (aquarius-8-cluster *** CANONICAL ***)>

ec2-run-instances \
ami-b07985d9 \
-g default \
-k aquarius \
--instance-type t1.micro \
-z us-east-1a

RESERVATION	r-bf388fd3	558277860346	default
INSTANCE	i-1357bc7d	ami-b07985d9	ec2-50-16-132-13.compute-1.amazonaws.com	ip-10-122-233-113.ec2.internal	running	aquarius	0		t1.micro	2011-05-15T00:54:33+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.16.132.13	10.122.233.113			ebs					paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-994debf2	2011-05-15T00:54:59.000Z	


MOUNT VOLUME vol-0d4ee866:

# DETACH ROOT VOLUME FROM 8e AND ATTACH TO EXPLORATORY:
ec2-stop-instances i-f35db69d
ec2-detach-volume vol-0d4ee866
ec2-describe-volumes vol-0d4ee866
ec2-attach-volume -i i-1357bc7d -d /dev/sdx vol-0d4ee866

# ON EXPLORATORY:
ssh -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@ec2-50-16-132-13.compute-1.amazonaws.com	
mkdir -p /mnt/8e
mount /dev/sdx /mnt/8e


# REMOVED DUPLICATE /dev/sdb1 LINES (ONE /mnt AND ONE cloud-config) FROM /etc/fstab:

    proc              /proc           proc    nodev,noexec,nosuid 0       0
    /dev/sda1         /               ext3    defaults            0       0


umount /mnt/8e

# COMMENTED OUT /dev/sdh AND /dev/sdi IN /etc/fstab ON 8e AND RESTARTED:
ec2-detach-volume vol-0d4ee866
ec2-describe-volumes vol-0d4ee866
ec2-attach-volume -i i-f35db69d -d /dev/sda1 vol-0d4ee866
ec2-start-instances i-f35db69d
ec2-describe-instances i-f35db69d

    
CREATED NEW IMAGE OF aquarius-8-cluster *** CANONICAL ***:

ec2.amis.xsl
[Sat 2011:05:14 21:08:54 EST]
ami-8e8678e7 VERSION 2 OF aquarius-8-cluster *** CANONICAL ***


</entry>
<entry [Sat 2011:05:14 20:42:37 EST] i-f35db69d FROM ami-d08b75b9 aquarius-8-cluster *** CANONICAL ***>
    
ec2-run-instances \
ami-d08b75b9 \
-g default \
-k aquarius \
--instance-type t1.micro \
-z us-east-1a

RESERVATION	r-8b3d8ae7	558277860346	default
INSTANCE	i-f35db69d	ami-d08b75b9	ec2-204-236-194-22.compute-1.amazonaws.com	ip-10-120-66-235.ec2.internal	running	aquarius	0		t1.micro	2011-05-15T00:46:53+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	204.236.194.22	10.120.66.235			ebs					paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-0d4ee866	2011-05-15T00:47:17.000Z

</entry>
<entry [Sat 2011:05:14 13:19:44 EST] i-05648c6b aquarius8-cluster.1 FROM ami-dc8a74b5 Moose, etc. (NO DOT)>
    
ec2-run-instances \
ami-dc8a74b5 \
-g default \
-k aquarius \
--instance-type t1.micro \
-z us-east-1a
    
RESERVATION	r-db18acb7	558277860346	default
INSTANCE	i-05648c6b	ami-dc8a74b5	ec2-50-17-13-206.compute-1.amazonaws.com	ip-10-127-98-156.ec2.internal	running	aquarius	0		t1.micro	2011-05-14T17:21:10+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.17.13.206	10.127.98.156			ebs					paravirtual	xensg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-a9ef49c2	2011-05-14T17:21:34.000Z


ec2-50-17-13-206.compute-1.amazonaws.com

    
</entry>
<entry [Fri 2011:05:13 19:21:55 EST] i-b63811d9 8e RESTARTED>

RESERVATION	r-476e942b	558277860346	default
INSTANCE	i-b63811d9	ami-b07985d9	ec2-50-19-55-4.compute-1.amazonaws.com	ip-10-124-163-223.ec2.internal	running	aquarius	0		m1.large	2011-05-14T06:19:06+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.19.55.4	10.124.163.223			ebs					paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sdh	vol-15599e7e	2011-05-14T06:19:33.000Z	
BLOCKDEVICE	/dev/sdi	vol-956fa8fe	2011-05-14T06:19:33.000Z	
BLOCKDEVICE	/dev/sda1	vol-ef78bc84	2011-05-14T06:19:33.000Z	
TAG	instance	i-b63811d9	name	aquarius-8e


REBOOTED AND COULDN'T CONNECT. CONSOLE OUTPUT:

    init: ureadahead-other main process (425) terminated with status 4
    
    mountall: Disconnected from Plymouth
    mountall: mount /data [410] terminated with status 32
    mountall: mount /nethome [415] terminated with status 32
    mount.nfs: remote share not in 'host:dir' format
    mount.nfs: remote share not in 'host:dir' format
    mountall: mount /data [429] terminated with status 32
    mountall: mount /nethome [434] terminated with status 32
    mount.nfs: remote share not in 'host:dir' format
    mountall: mount /nethome [442] terminated with status 32

cat /etc/fstab

proc            /proc       proc    nodev,noexec,nosuid     0   0
/dev/sda1       /           ext3    defaults                0   0
/dev/sdb1       /mnt        auto    defaults,nobootwait     0   0
/dev/sdh        /data	  	ext3	noatime	                0	0
/dev/sdi        /nethome    ext3    defaults                0   0
/nethome/mysql/etc/mysql /etc/mysql     none bind
/nethome/mysql/lib/mysql /var/lib/mysql none bind
/nethome/mysql/log/mysql /var/log/mysql none bind
/dev/sdh	    /data	 	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0  0
/dev/sdi	    /nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0  0

DETACH ROOT VOLUME FROM 8e AND ATTACH TO EXPLORATORY
ec2-detach-volume vol-ef78bc84
ec2-attach-volume -i i-9f2bc7f1 -d /dev/sdx vol-ef78bc84

ON 8e EXPLORATORY:
mkdir -p /mnt/8e
mount /dev/sdx /mnt/8e

COMMENTED OUT /dev/sdh AND /dev/sdi IN /etc/fstab ON 8e AND RESTARTED:
ec2-detach-volume vol-ef78bc84
ec2-attach-volume -i i-b63811d9 -d /dev/sda1 vol-ef78bc84


RESERVATION	r-476e942b	558277860346	default
INSTANCE	i-b63811d9	ami-b07985d9	ec2-50-19-2-57.compute-1.amazonaws.com	ip-10-122-190-97.ec2.internal	running	aquarius	0		m1.large	2011-05-13T23:20:37+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.19.2.57	10.122.190.97			ebs					paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sdh	vol-15599e7e	2011-05-13T23:21:10.000Z	
BLOCKDEVICE	/dev/sdi	vol-956fa8fe	2011-05-13T23:21:10.000Z	
BLOCKDEVICE	/dev/sda1	vol-ef78bc84	2011-05-13T23:21:10.000Z	
TAG	instance	i-b63811d9	name	aquarius-8e


DID NOT REBOOT, REDID DETACH-ATTACH WITH NEW /etc/fstab:

proc            /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1       /               ext3    defaults        0       0
/dev/sdb1       /mnt 		auto 	defaults,nobootwait 0 0
#/dev/sdh        /data	  	ext3	defaults,nobootwait 0 0
#/dev/sdi        /nethome      	ext3    defaults,nobootwait 0 0
/nethome/mysql/etc/mysql /etc/mysql     none bind
/nethome/mysql/lib/mysql /var/lib/mysql none bind
/nethome/mysql/log/mysql /var/log/mysql none bind
#/dev/sdh	/data	 	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
#/dev/sdi	/nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0

... AND BOOTED OK!!!


REDID /etc/fstab:

proc            /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1       /               ext3    defaults        0       0
/dev/sdb1       /mnt 		auto 	defaults,nobootwait 0 0
/dev/sdh        /data	  	ext3	defaults,nobootwait 0 0
/dev/sdi        /nethome      	ext3    defaults,nobootwait 0 0
/nethome/mysql/etc/mysql /etc/mysql     none bind
/nethome/mysql/lib/mysql /var/lib/mysql none bind
/nethome/mysql/log/mysql /var/log/mysql none bind
#/dev/sdh	/data	 	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
#/dev/sdi	/nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0

... AND BOOTED OK!!!


SO RETRIED WITH nfs STUFF UNCOMMENTED TO CONFIRM THAT THIS WAS THE CAUSE OF THE BOOT FAILURE:

    YES, THE nfs LINES WERE THE PROBLEM:

sshi ec2-50-17-97-119.compute-1.amazonaws.com

    debug1: connect to address 50.17.97.119 port 22: Connection refused
    ssh: connect to host ec2-50-17-97-119.compute-1.amazonaws.com port 22: Connection refused


SO CHANGED THE NFS OPTIONS:
http://linux.die.net/man/5/nfs

/dev/sdh	    /data	 	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0  0
/dev/sdi	    /nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0  0

TO:

/dev/sdh	    /data	 	nfs     rw,nfsvers=3,rsize=32768,wsize=32768,hard,proto=tcp 0  0
/dev/sdi	    /nethome	nfs     rw,nfsvers=3,rsize=32768,wsize=32768,hard,proto=tcp 0  0


sshi ec2-204-236-250-140.compute-1.amazonaws.com

... BUT FAILED TO BOOT


TRIED WITH THIS:

proc            /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1       /               ext3    defaults        0       0
/dev/sdb1       /mnt            auto    defaults,nobootwait 0 0
/dev/sdh        /data           ext3    defaults,nobootwait 0 0
/dev/sdi        /nethome        ext3    defaults,nobootwait 0 0
/nethome/mysql/etc/mysql /etc/mysql     none bind
/nethome/mysql/lib/mysql /var/lib/mysql none bind
/nethome/mysql/log/mysql /var/log/mysql none bind
/dev/sdh        /data           nfs     defaults,nfsvers=3 0 0
/dev/sdi        /nethome        nfs     defaults,nfsvers=3 0 0
#/dev/sdh        /data           nfs     rw,nfsvers=3,rsize=32768,wsize=32768 0 0
#/dev/sdi        /nethome        nfs     rw,nfsvers=3,rsize=32768,wsize=32768 0 0

sshi ec2-50-17-110-74.compute-1.amazonaws.com

... FAILED TO BOOT.

SO REMOVED THE NFS LINES FROM /etc/fstab AND RESTARTED:

RESERVATION	r-476e942b	558277860346	default
INSTANCE	i-b63811d9	ami-b07985d9	ec2-50-19-55-4.compute-1.amazonaws.com	ip-10-124-163-223.ec2.internal	running	aquarius	0		m1.large	2011-05-14T06:19:06+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.19.55.4	10.124.163.223			ebs					paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sdh	vol-15599e7e	2011-05-14T06:19:33.000Z	
BLOCKDEVICE	/dev/sdi	vol-956fa8fe	2011-05-14T06:19:33.000Z	
BLOCKDEVICE	/dev/sda1	vol-ef78bc84	2011-05-14T06:19:33.000Z	
TAG	instance	i-b63811d9	name	aquarius-8e

sshi ec2-50-19-55-4.compute-1.amazonaws.com
    OK


... AND ADDED NFS CONFIGURATION TO A CRON @bootup SCRIPT:

/agua/0.6/bin/scripts/resources/cron/bootup.sh
mount -t nfs /dev/sdh /mnt/share rw,nfsvers=3,rsize=32768,wsize=32768


ON 8e:

exportfs
    /agua         	10.120.66.154
    /agua         	10.122.195.122
    /agua         	10.220.105.210

showmount -e localhost
    Export list for localhost:
    /agua 10.220.105.210,10.122.195.122,10.120.66.154



CREATED CONFIG FILE:

echo '{"availzone":"us-east-1a","username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"syoung-smallcluster","minnodes":"0","maxnodes":"5","typecombo":"t1.micro","amiid":"ami-30936d59","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi


CONFIRMED IT HAS THE CORRECT HEAD IP:

emacs /nethome/admin/.starcluster/syoung-smallcluster.config
    ...
    [plugin sge]
    cell=smallcluster
    execdport=36262
    head_ip=10.124.163.223
    qmasterport=36261
    root=/opt/sge6
    setup_class=sge.CreateCell
    slots=1


RERAN PLUGINS TO MAKE SURE THEY GET THE CORRECT HEAD IP:


cd /nethome/admin/.starcluster/plugins
/data/starcluster/110202bal/bin/starcluster \
-c /nethome/admin/.starcluster/syoung-smallcluster.config \
shell

cfg.get_plugin('sge')
import sge; clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')
reload(sge); cluster.ClusterManager.run_plugin(clus, 'sge', 'syoung-smallcluster')

cfg.get_plugin('automount')
import automount; clus = cluster.ClusterManager(cfg)
cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')
reload(automount); cluster.ClusterManager.run_plugin(clus, 'automount', 'syoung-smallcluster')

    OK!!! 

</entry>
<entry [Fri 2011:05:13 18:28:56 EST] i-9f2bc7f1 8e EXPLORATORY AFTER 8e FAILED TO REBOOT>

ec2-run-instances \
ami-b07985d9 \
-g default \
-k aquarius \
--instance-type t1.micro -z us-east-1a
    
RESERVATION	r-cd963da1	558277860346	default
INSTANCE	i-9f2bc7f1	ami-b07985d9	ec2-50-17-60-155.compute-1.amazonaws.com	domU-12-31-38-00-A9-81.compute-1.internal	running	aquarius	0		t1.micro	2011-05-13T22:38:25+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.17.60.155	10.252.174.111			ebs					paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-35b1155e	2011-05-13T22:38:59.000Z


</entry>
<entry [Fri 2011:05:13 16:58:36 EST] i-1384687d INSTALLED Moose, ETC. TO CREATE IMAGE aquarius-8-cluster>

ec2-run-instances \
ami-b07985d9 \
-g default \
-k aquarius \
--instance-type m1.large -z us-east-1a

RESERVATION	r-11d2797d	558277860346	default
INSTANCE	i-1384687d	ami-b07985d9	ec2-50-16-4-41.compute-1.amazonaws.com	domU-12-31-38-00-17-81.compute-1.internal	running	aquarius	0		m1.large	2011-05-13T21:00:25+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.16.4.41	10.252.22.111			ebs					paravirtual	xen		sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-3dc06456	2011-05-13T21:00:54.000Z	

</entry>
<entry [Sat 2011:04:30 20:57:00 EST] AQUARIUS-7>

CONNECT TO AQUARIUS-7

ssh -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem \
root@ec2-75-101-214-196.compute-1.amazonaws.com

    OK


COPIED AQUARIUS-7 .bash_profile TO /home/syoung/notes/bash/aquarius

mkdir -p /home/syoung/notes/bash/aquarius

scp -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem \
root@ec2-75-101-214-196.compute-1.amazonaws.com:.bash_profile \
/home/syoung/notes/bash/aquarius


AQUARIUS-7 INSTANCE INFO

i-b42f3fd9
ec2-75-101-214-196.compute-1.amazonaws.com
ip-10-127-158-202.ec2.internal


</entry>

<entry [Sun 2011:04:24 15:17:14 EST] AQUARIUS-8 MICRO INSTANCE WON'T COME UP AFTER FIRST REBOOT>

DIAGNOSIS

/etc/fstab HAS cloudconfig ENTRY:

<!--
# /etc/fstab: static file system information.                                               # <file system> <mount point>   <type>  <options>       <dump>  <pass>
proc            /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1       /               ext3    defaults            0       0
/dev/sdb1 /mnt auto defaults,nobootwait                     0       0
/dev/sdb1      /mnt    auto    defaults,comment=cloudconfig 0       0       

-->

SOLUTION:

1. COMMENT OUT THE cloudconfig ENTRY IN /etc/fstab:

#/dev/sdb1	/mnt	auto	defaults,comment=cloudconfig	0	    0

AND ADD 'nobootwait' to the entry
that is added in /etc/fstab. That way, reboot wont hang, and if the user
restarted in a larger instance of the given type, they'd get some
ephemeral data.

2. CHECK FILESYSTEM:

root@ip-10-124-231-156:~# df -a
    Filesystem           1K-blocks      Used Available Use% Mounted on
    /dev/sda1             15481840   4697328   9998080  32% /
    proc                         0         0         0   -  /proc
    none                         0         0         0   -  /sys
    none                         0         0         0   -  /sys/kernel/debug
    none                         0         0         0   -  /sys/kernel/security
    devtmpfs               3813968       116   3813852   1% /dev
    none                         0         0         0   -  /dev/pts
    none                   3932272         0   3932272   0% /dev/shm
    none                   3932272        76   3932196   1% /var/run
    none                   3932272         0   3932272   0% /var/lock
    none                   3932272         0   3932272   0% /lib/init/rw
    /dev/sdb1            433455904    203012 411234588   1% /mnt
    nfsd                         0   

3. REBOOT AND REBOOT AND REBOOT

    OK
    OK
    OK
    
    

THE LONG SOLUTION
-----------------
https://bugs.launchpad.net/ubuntu/+source/cloud-init/+bug/634102

Scott Moser wrote on 2010-09-16:	 #7
I've verified this on both
us-east-1 ami-1234de7b ebs/ubuntu-lucid-10.04-i386-server-20100827
us-east-1 ami-1634de7f ebs/ubuntu-lucid-10.04-amd64-server-20100827

- launch instance
- ssh instance
- verify that '/etc/fstab' has an entry for "/mnt" whose device does not exist
 i386:
 | $ awk '$2 == "/mnt" { print $0 }' /etc/fstab
 | /dev/sda2 /mnt auto defaults,comment=cloudconfig 0 0
 | $ [ -b /dev/sda2 ] || echo "no"
 | no
 amd64:
 | $ awk '$2 == "/mnt" { print $0 }' /etc/fstab
 | /dev/sdb /mnt auto defaults,comment=cloudconfig 0 0
 | $ [ -b /dev/sdb ] || echo "no"
 | no

- enable proposed, update, install cloud-init
 | $ l="deb http://archive.ubuntu.com/ubuntu lucid-proposed main"
 | $ echo "$l" | sudo tee -a /etc/apt/sources.list
 | $ sudo apt-get update && sudo apt-get install cloud-init
 | $ dpkg-query --show cloud-init
 | cloud-init 0.5.10-0ubuntu1.3

- Now, verify that the installation of the package has fixed /etc/fstab
  Notice that 'nobootwait' has been added. In dpkg output, you will
  also see a message like:
    making ephemeral /dev/sda2 in /etc/fstab nobootwait (LP: #634102)
 i386
 | $ awk '$2 == "/mnt" { print $0 }' /etc/fstab
 | /dev/sda2 /mnt auto defaults,comment=cloudconfig,nobootwait 0 0
 amd64
 | $ awk '$2 == "/mnt" { print $0 }' /etc/fstab
 | /dev/sdb /mnt auto defaults,comment=cloudconfig,nobootwait 0 0

- Verify 'reboot', and that you can ssh back in

- Now, verify that cloud-init would write 'nobootwait' on first boot, by
  removing all of /var/lib/cloud so cloud-init thinks this is a first boot
 | $ sudo rm -Rf /var/lib/cloud && reboot

- ssh back in and check /etc/fstab
 i386
 | $ awk '$2 == "/mnt" { print $0 }' /etc/fstab
 | /dev/sda2 /mnt auto defaults,nobootwait,comment=cloudconfig 0 0
 amd64
 | $ awk '$2 == "/mnt" { print $0 }' /etc/fstab
 | /dev/sdb /mnt auto defaults,nobootwait,comment=cloudconfig 0 0

- reboot to test *that* written /etc/fstab, and connect again

tags:	 added: verification-done
removed: verification-needed



Jeff Bauer wrote on 2010-09-16:

I've verified this works on both:
us-east-1 ami-1234de7b ebs/ubuntu-lucid-10.04-i386-server-20100827
us-east-1 ami-1634de7f ebs/ubuntu-lucid-10.04-amd64-server-20100827

One minor edit to your verification process:
< $ sudo rm -Rf /var/lib/cloud && reboot
> $ sudo rm -Rf /var/lib/cloud && sudo reboot









https://bugs.launchpad.net/ubuntu/+source/cloud-init/+bug/634102
t1.micro EC2 instances hang on reboot

cloud-init writes ephemeral0 entry in /etc/fstab on t1.micro type
+ t1.micro instances hang on reboot


Binary package hint: cloud-init

on Amazon's new t1.micro instance type, there is no ephemeral storage at all. If you run a ubuntu ebs image on instance type t1.micro and reboot, it will not come back up. mountall will wait indefinitely for /dev/sda2, which is never going to be present.

cloud-init is basically hard coded to expect an 'ephemeral0', while other ephemeral devices are more dynamic.

Our images are registered with block-device-mapping indicating ephemeral0, so the metadata service will include ephemeral0 even though there is not one on the instance itself.

We need to do one of 2 things here:
a.) add 'nobootwait' for the ephemeral0 device (/dev/sda2 in this case)
b.) not write a entry in /etc/fstab (or comment it out) if that device is not present on the first boot.

There are 2 easy workarounds for this:
1.) copy and paste the following after first boot and ssh in:
[ "$(uname -m)" = "x86_64" ] && ephd=/dev/sdb || ephd=/dev/sda2
sudo sed -i.dist "\,${ephd},s,^,#," /etc/fstab

2.) launch instance with cloud-config metadata containing:
#cloud-config
mounts:
 - [ ephemeral0 ]

### SRU Information BEGIN ####
1. This bug affects anyone who is going to run an ec2 instance of type t1.micro . It is expected that this will be lots of people, especially those evaluating EC2 and/or Ubuntu. The bug is that the system will only boot and be reachable one time. On subsequent boots, the ssh service will not start, leaving a cloud instance completely unreachable. That is because on first boot an entry is written to /etc/fstab that will never be present.

2. The bug if fixed by
 a.) carefully updating existing entries in /etc/fstab to add 'nobootwait'. Only ephemeral devices are modified (either /dev/sda2 or /dev/sdb), and only if they contain 'comment=cloudconfig'.
 b.) on future first-boots, writing 'nobootwait' for the entry.

3. The patch is available at

lp:~cloud-init-dev/cloud-init/lucid

in changes seen at

http://bazaar.launchpad.net/~cloud-init-dev/cloud-init/lucid/revision/19?remember=15&compare_revid=15

4. To reproduce:
 a.) start ec2 lucid instance of t1.micro
 ec2-run-instances --region us-east-1 --key mykey ami-1437dd7d
 b.) ssh to instance and reboot
 sudo reboot
 c.) ssh will not come up, leaving the instance basically dead.

5. The opportunity for regression is almost completely contained in the pre-install script, and here it is very small. The only real negative fallout would be adding 'nobootwait' to an entry in /etc/fstab that the user *wanted* to wait on. This is very unlkely.
######### SRU Information END ##############

ProblemType: Bug
DistroRelease: Ubuntu 10.04
Package: cloud-init 0.5.10-0ubuntu1.2
ProcVersionSignature: User Name 2.6.32-308.15-ec2 2.6.32.15+drm33.5
Uname: Linux 2.6.32-308-ec2 i686
Architecture: i386
Date: Thu Sep 9 14:42:21 2010
Ec2AMI: ami-1234de7b
Ec2AMIManifest: (unknown)
Ec2AvailabilityZone: us-east-1c
Ec2InstanceType: t1.micro
Ec2Kernel: aki-5037dd39
Ec2Ramdisk: unavailable
PackageArchitecture: all
ProcEnviron:
 PATH=(custom, user)
 LANG=en_US.UTF-8
 SHELL=/bin/bash
SourcePackage: cloud-init

</entry>
<entry [Fri 2011:04:24 12:53:27 EST] i-669fc009 AQUARIUS 8 (FROM ami-b07985d9 u10.04 HADOOP)> 
    
ssh -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@ec2-174-129-99-4.compute-1.amazonaws.com

ec2-run-instances ami-b07985d9 \
-g default \
-k aquarius \
--instance-type t1.micro -z us-east-1a

    RESERVATION	r-1d56a171	558277860346	default
    INSTANCE	i-669fc009	ami-b07985d9	ec2-174-129-99-4.compute-1.amazonaws.com	ip-10-126-30-178.ec2.internal	running	aquarius	0		t1.micro	2011-04-25T01:12:30+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	174.129.99.4	10.126.30.178			ebs					paravirtual	xen		sg-0a0da063	default
    BLOCKDEVICE	/dev/sda1	vol-e9d82782	2011-04-25T01:12:54.000Z

</entry>
<entry [Fri 2011:05:13 19:06:15 EST] AQUARIUS 8a2 (micro) FROM ami-b07985d9>
    
ec2-run-instances ami-b07985d9 \
-g default \
-k aquarius \
--instance-type t1.micro -z us-east-1a
    
    RESERVATION	r-dd3ec5b1	558277860346	default
    INSTANCE	i-14e7c87b	ami-b07985d9	ec2-184-73-115-198.compute-1.amazonaws.com	ip-10-122-42-164.ec2.internal	running	aquarius	0		t1.micro	2011-04-29T08:05:26+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	184.73.115.198	10.122.42.164			ebs					paravirtual	xen	sg-0a0da063	default
    BLOCKDEVICE	/dev/sda1	vol-a79b5fcc	2011-04-29T08:05:51.000Z	
    TAG	instance	i-14e7c87b	name	aquarius-8a2


DID install.pl AND config.pl, THEN IMAGED TO CREATE aquarius-8a3....

</entry>
<entry [Fri 2011:05:13 19:06:29 EST] AQUARIUS 8a3-postconfig>
    
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
    IMAGE	ami-b07985d9	558277860346/starcluster-u10.04-64bit-hadoop	558277860346	available	private		x86_64	machine	aki-0b4aa462			ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-c54ef9aa	15	
    IMAGE	ami-90af5ef9	728213020069/aquarius-7	728213020069	available	private		x86_64	machine	aki-b51cf9dc	ari-b31cf9da		ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-e1a8678c	10

</entry>
<entry [Fri 2011:05:13 19:05:49 EST] LAUNCHED 8a3 USING POST-install.pl AND config.pl IMAGE>

ec2-run-instances ami-988679f1 \
-g default \
-k aquarius \
--instance-type t1.micro -z us-east-1a

    RESERVATION	r-81c933ed	558277860346	default
    INSTANCE	i-86ba94e9	ami-988679f1	ec2-50-16-74-237.compute-1.amazonaws.com	ip-10-127-93-43.ec2.internal	running	aquarius	0		t1.micro	2011-04-29T16:52:27+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.16.74.237	10.127.93.43			ebs					paravirtual	xen	sg-0a0da063	default
    BLOCKDEVICE	/dev/sda1	vol-6f39fd04	2011-04-29T16:52:51.000Z	

</entry>
<entry [Fri 2011:05:13 19:05:29 EST] AQUARIUS 8b TO COMPARE SPEED, JUST IN CASE ITS FASTER>
    
ec2-run-instances ami-b07985d9 \
-g default \
-k aquarius \
--instance-type t1.micro -z us-east-1a

    RESERVATION	r-ef59ae83	558277860346	default
    INSTANCE	i-408fd02f	ami-b07985d9	ec2-184-72-78-26.compute-1.amazonaws.com	ip-10-126-38-6.ec2.internal	running	aquarius	0		t1.micro	2011-04-25T01:44:18+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	184.72.78.26	10.126.38.6			ebs					paravirtual	xen		sg-0a0da063	default
    BLOCKDEVICE	/dev/sda1	vol-a5d32cce	2011-04-25T01:44:41.000Z

</entry>
<entry [Fri 2011:05:13 19:02:18 EST] 8bv2 POST-install AND config, MICRO-ENABLED u10.04 HADOOP>

    A new EBS-backed AMI is being created and will
    be available in a moment
    The AMI ID is: ami-728e711b
    

ec2-run-instances ami-728e711b \
-g default \
-k aquarius \
--instance-type m1.large -z us-east-1a

BUT CAN'T CONNECT.

GOT CONSOLE OUTPUT:

 ec2-get-console-output


</entry>
<entry [Fri 2011:05:13 19:03:19 EST] AQUARIUS 8c (LARGE)>
    
ec2-run-instances ami-b07985d9 \
-g default \
-k aquarius \
--instance-type m1.large -z us-east-1a

RESERVATION	r-8743bbeb	558277860346	default
INSTANCE	i-c2ab87ad	ami-b07985d9	ec2-50-17-145-149.compute-1.amazonaws.com	ip-10-86-246-84.ec2.internal	running	aquarius	0		m1.large	2011-04-29T02:42:31+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.17.145.149	10.86.246.84			ebs					paravirtual	xen	sg-0a0da063	default
BLOCKDEVICE	/dev/sda1	vol-47498c2c	2011-04-29T02:42:53.000Z	

IP ADDRESS
ec2-50-17-145-149.compute-1.amazonaws.com

    
</entry>
<entry [Fri 2011:05:13 19:03:39 EST] AQUARIUS 8d (MICRO) TO CHECK CONSOLE OUTPUT FOR TROUBLESHOOTING OTHER 8's>


ec2-run-instances ami-b07985d9 \
-g default \
-k aquarius \
--instance-type t1.micro -z us-east-1a

ec2din i-cebb95a1
    RESERVATION	r-01ce346d	558277860346	default
    INSTANCE	i-cebb95a1	ami-b07985d9	ec2-184-73-8-244.compute-1.amazonaws.com	ip-10-127-94-203.ec2.internal	running	aquarius	0		t1.micro	2011-04-29T17:41:23+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	184.73.8.244	10.127.94.203			ebs					paravirtual	xen	sg-0a0da063	default
    BLOCKDEVICE	/dev/sda1	vol-e339fd88	2011-04-29T17:41:47.000Z	
    TAG	instance	i-cebb95a1	name	aquarius-8d


CURRENT TAGS:

ec2dtag

    TAG	instance	i-86ba94e9	name	aquarius-8a3
    TAG	instance	i-b42f3fd9	name	aquarius-7
    TAG	instance	i-14e7c87b	name	aquarius-8a2
    TAG	instance	i-02153a6d	name	aquarius-8b2
    TAG	instance	i-408fd02f	name	aquarius-8b
    TAG	instance	i-c2ab87ad	name	aquarius-8c
    TAG	instance	i-cebb95a1	name	aquarius-8d



CHECK IF CAN CONNECT.

IF NOT THEN PROBLEM IT'S A PROBLEM WITH FINDING THE aquarius KEY IN THE syoung ACCOUNT ON HP

ssh -v -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@ec2-184-73-8-244.compute-1.amazonaws.com

    OpenSSH_5.5p1 Debian-4ubuntu5, OpenSSL 0.9.8o 01 Jun 2010
    debug1: Reading configuration data /home/syoung/.ssh/config
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to ec2-184-73-8-244.compute-1.amazonaws.com [184.73.8.244] port 22.
    debug1: connect to address 184.73.8.244 port 22: Connection refused
    ssh: connect to host ec2-184-73-8-244.compute-1.amazonaws.com port 22: Connection refused

THEN FOUND THAT PORT IS BLOCKED:

telnet ec2-184-73-8-244.compute-1.amazonaws.com  22

    Trying 184.73.8.244...
    telnet: Unable to connect to remote host: Connection refused
    syoung@hp:~/.ssh$ 


SO STOPPED AQUARIUS-8d AND TRIED MOUNTING ON AQUARIUS-7 TO DO AND fsck /dev/sdXX

GET AQUARIUS-8d INFO:
    INSTANCE	i-cebb95a1	ami-b07985d9			stopped	aquarius	0		t1.micro	2011-04-29T16:53:48+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs					paravirtual	xen		sg-0a0da063	default
    BLOCKDEVICE	/dev/sda1	vol-e339fd88	2011-04-29T17:19:06.000Z	
    TAG	instance	i-cebb95a1	name	aquarius-8d

STOP AQUARIUS-8d:
ec2-stop-instances i-cebb95a1


DETACH VOLUME:

ec2-detach-volume vol-e339fd88

ATTACHMENT	vol-e339fd88	i-cebb95a1	/dev/sda1	detaching	2011-04-29T17:53:34+0000


NB: ALSO CREATED IMAGE OF AQUARIUS-8d    
    A new EBS-backed AMI is being created and will
    be available in a moment.   
    The AMI ID is: ami-66847b0f


CHECK IT DETACHED:
ec2dvol
    VOLUME	vol-e339fd88	15	snap-c54ef9aa	us-east-1a	available	2011-04-29T16:53:53+0000

ATTACH ON AQUARIUS-7:

ec2-attach-volume -i i-b42f3fd9 -v vol-e339fd88 -d /dev/sdj

    ATTACHMENT	vol-e339fd88	i-b42f3fd9	/dev/sdj	attaching	2011-04-29T18:03:23+0000
    REQUEST ID	7054dfd9-3aa2-4619-a0e7-f59843e1fd8b


CHECK IT ATTACHED:

ec2dvol vol-e339fd88
    VOLUME	vol-e339fd88	15	snap-c54ef9aa	us-east-1a	in-use	2011-04-29T16:53:53+0000
    ATTACHMENT	vol-e339fd88	i-b42f3fd9	/dev/sdj	attached	2011-04-29T18:03:30+0000


MOUNT:

mkdir /mnt/8d


CHECK IN /etc/ssh/sshd_config FOR:
PermitRootLogin no

BUT WAS COMMENTED (UNCOMMENTED AND SET TO Yes)


CHECK IN /var/log/syslog:

SSH KEYS:

    #############################################################
    Aug 19 13:47:12 domU-12-31-39-18-15-1D ec2: -----BEGIN SSH HOST KEY FINGERPRINTS-----
    Aug 19 13:47:12 domU-12-31-39-18-15-1D ec2: 2048 33:79:f5:dc:e0:d7:28:43:6e:70:56:02:63:0c:d9:ea /etc/ssh/ssh_host_rsa_key.pub (RSA)
    Aug 19 13:47:12 domU-12-31-39-18-15-1D ec2: 1024 73:1e:ac:e3:12:67:84:b7:f4:be:bd:e3:66:c9:a6:2b /etc/ssh/ssh_host_dsa_key.pub (DSA)
    Aug 19 13:47:12 domU-12-31-39-18-15-1D ec2: -----END SSH HOST KEY FINGERPRINTS-----
    Aug 19 13:47:12 domU-12-31-39-18-15-1D ec2: #############################################################
    Aug 19 13:47:12 domU-12-31-39-18-15-1D ntpdate[355]: adjust time server 91.189.94.4 offset 0.007590 sec

MYSQL:

Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]:
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: To do so, start the server, then issue the following commands:
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]:
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: /usr/bin/mysqladmin -u root password 'new-password'
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: /usr/bin/mysqladmin -u root -h domU-12-31-39-18-15-1D password 'new-password'
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]:
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: Alternatively you can run:
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: /usr/bin/mysql_secure_installation
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]:
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: which will also give you the option of removing the test
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: databases and anonymous user created by default.  This is
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: strongly recommended for production servers.
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]:
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: See the manual for more instructions.
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]:
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: Please report any problems with the /usr/scripts/mysqlbug script!
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]:
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: The latest information about MySQL is available at http://www.mysql.com/
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]: Support MySQL by buying support/licenses from http://shop.mysql.com/
Aug 19 14:15:12 domU-12-31-39-18-15-1D mysqld_safe[26008]:




IN SYSLOG:

svc: failed to register lockdv1 RPC service (errno 97).


SOLUTION (SSH CONNECT):
http://ubuntuforums.org/showthread.php?t=1431118
in my case it was an AllowUsers line into /etc/ssh/sshd_config, I had to modify /etc/ssh/sshd_config and add AllowUsers ubuntu and then it booted 

TRIED THIS:

emacs /etc/ssh/sshd_config

#### CHANGED THIS
#LogLevel INFO
LogLevel VERBOSE

#### ADDED THIS
AllowUsers ubuntu


SUSPICIOUS ACTIVITY ON AQUARIUS-7:

grep -ir ssh /var/log/*
grep -ir breakin /var/log/*
grep -ir security /var/log/*

/var/log/audit/audit.log:type=USER_ERR msg=audit(1303785808.386:152049): user pid=15422 uid=0 auid=4294967295 subj=kernel msg='PAM: bad_ident acct="?" : exe="/usr/sbin/sshd" (hostname=72.94.30.27, addr=72.94.30.27, terminal=ssh res=failed)'
/var/log/audit/audit.log:type=USER_LOGIN msg=audit(1303785808.585:152050): user pid=15424 uid=0 auid=4294967295 subj=kernel msg='acct="studio": exe="/usr/sbin/sshd" (hostname=?, addr=72.94.30.27, terminal=sshd res=failed)'



CHECKED ON AQUARIUS-8d:

cd /mnt/8d
grep -ir ssh var/log/* >> varlog.out
grep -ir breakin var/log/* >> varlog.out
grep -ir security var/log/* >> varlog.out


cd /mnt/8d
grep -ir ssh var/log/* >> ssh.out


CHECKED IN AQUARIUS-8b SSH PUBLIC KEYS AND FOUND STRANGE IP:

em etc/ssh/ssh_host_dsa_key.pub

    ssh-dss AAAAB3NzaC1kc3MAAACBAP8D4svNEECHXhfsCym36WLYKz1vHvNpwGHDjOvBB9i+z40CC11RE4XIdxyTDv2bwaJrANoK/nCWqwueihKyUoDiPmGr5EUXXv6j+x7JU4giNRJqMMwDQ2IEJBTrl8Iv98+MrndJPJMv04oK3ilauETpEJkhbNIx5biFHlQ1mFexAAAAFQCGkROSLM9DHT6J5FTtXbRgfMkl5wAAAIEAxZb+7IJzta+G4FKKU2eK7KfPqTLhvoQq5DBirLbqztUCs3TN7cvvdsDNW4KwhzzzmMYBti/ntaUkJjHcY/i/NMESkhES6E+lR/dkRdRj/prSRW+h6amrpCX8WTVIS22NxPEb+i9tX7wGk4XpU+LE1AIrffND4BcXSoEO5mu3XOAAAACAP6KuMK8WCNcD3CqUBIV1p7mrG0NZ3ht01fDsTIi82QOupEfDJ5MPwoNkuSN+Wga2Z0HDaSr2FUA1noFYwlL5lGNH8hgA6bvuvHmF+ViYAXyxHABzt92cih88G6SR47TcBzsB0Ht3oVHvxP7Qg3TiKtjUwDhcpVl5EZfNqQnoLiM= root@ip-10-127-121-127
 
em etc/ssh/ssh_host_rsa_key.pub

    ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAu62glwjwnBF/y6W3E9mpu3zmQS8ADTDvPPZbsvyrhrZJKQd0NeLQVwbWZFVickw5DXtXrgJU1pk0IRRYck+Dpave3hvqA5/hL04n3CC2s2CPYNPk7o5WvDYXQ5Yh8Ex+SwmSwHn0I5AKe84aigeNUyC1KRzYoXjnQAVlXb7rXyVzKexQga0Jobf/edhMydKGNHaVnRnOeXdlbuGnxF/JuClkJvLaCgoIQ4IIyAEl967kxtc69LKypCdA9umZXMa/E7qiZ9B3za3B9ZzutYIigIC6ugjsPTNf9AhZrLsrcmWzsS+D6x/PNxCG0T3zFWRRuqICO035orKEG4cCwmauQw== root@ip-10-127-121-127


COMPARED TO CONTENTS OF AQUARIUS-7 PUBLIC KEY FILES:


cat /etc/ssh/ssh_host_rsa_key.pub
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5SyEggguQ8R6KbROuua8pjuFELFfYm5JUfiDUzRjzojfQGJVpwBguFaOJusTE4iyzfYMT117oK/HbGEK1SKuJlYbxbMC5aZFAHLUoOZdB9BhwWaL5AS5FHYOrfBEV7a9akhuXUP8npkg6mdg/B9APgTJAetOba98jUQKpG8LuSUMT4pTPDaChnFvGqPH7jmAfJW5tIajJz2SM2XNwkbtvOwzigemATnKuoGNYaFbGQ/DstmxaP56EElZYJiEbR7bT32sVwtRDIuxsnZi3P0t57aRFVn+N5GBhNJwgwsFO/S8I2BeYYxDczpEahqfDLuTWXPRaP8H1IfN1Lg4IJMLgQ== 
[root@ip-10-127-158-202 8d]# cat /etc/ssh/ssh_host_dsa_key.pub
ssh-dss AAAAB3NzaC1kc3MAAACBAKs2HT/9nBAQiZsHBBzLRFisQvm3yjnBJD6/6GKq/v/+tWzz41MDLBJBiUmAvaW3z+w+Hf4dWoIWV8J/xUyQcmguZE/PLnICJkGjfu7GYBTxjodzITzNzxz7PX/xksrquSSRqcl9qW7TzZw9oZUPkFsDgiVrvByw7ncuWQD+bLERAAAAFQCAb0F4D3dLiwMoIDvIkwO2bOhQ/QAAAIBlM5j1P2+brO5EbCDwWtcEwy0VnQPxAEA5N6vMeynoEan5bbvdzl9Zfbfr7Gizhk84skyzUn7wINdjQ6xVd2DIy22jD7WIY4LUObIY4aPibziuUYAhYhiiprolAu4EMpxZ0s/SySOnhugINDdLCHn26hiLwJXdA1hhGUp3rMNewwAAAIALd73+KWeuMmStyLe0Q/7GazH22yAgV+SrZhTF3WipRbTP6ihadE1+31Y8bOZVFAPRAQTtuY57wEXW3fNxqiytpkxUPiftsSPxn+Zmf3oF7JQGgtsiEPckWyI+n/6ooTlWa0z06iqnhpsmmPBUehK3f4NzfxJMj7mXycJvxcTK2A== 


CAN CONNECT BY TELNET TO  10.127.121.127 SO IT MAY BE THE OUTGOING IP FOR CLIENTS (INCLUDING MY HP LAPTOP) INSIDE MED CAMPUS NETWORK...?


FOUND USEFUL STUFF IN var/log/dmesg RELATING TO etc/fstab
    
    GFS2: path_lookup on /dev/sdb1 returned error -2


SO COMMENTED OUT /dev/sdb1 LINES IN etc/fstab
<!--
# /etc/fstab: static file system information.
# <file system>                                 <mount point>   <type>  <options>       <dump>  <pass>
proc                                            /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1                                       /               ext3    defaults        0       0
#/dev/sdb1 /mnt auto defaults,nobootwait 0 0
#/dev/sdb1      /mnt    auto    defaults,comment=cloudconfig    0       0

-->

UNMOUNTED AND DETACHED FROM AQUARIUS-7

ON AQUARIUS-7

ec2-detach-volume vol-e339fd88

    ATTACHMENT	vol-e339fd88	i-b42f3fd9	/dev/sdj	detaching	2011-04-29T18:03:30+0000


CHECK IT DETACHED:
ec2dvol vol-e339fd88

    VOLUME	vol-e339fd88	15	snap-c54ef9aa	us-east-1a	available	2011-04-29T16:53:53+0000


ATTACH ON AQUARIUS-8d:

ec2-attach-volume -i i-cebb95a1 -v vol-e339fd88 -d /dev/sda1
    
    ATTACHMENT	vol-e339fd88	i-cebb95a1	/dev/sda1	attaching	2011-04-29T19:22:00+0000
    REQUEST ID	8392a40a-4470-4687-b1b4-2762f14d4c8f


CHECK IT ATTACHED:

ec2dvol vol-e339fd88
    
    VOLUME	vol-e339fd88	15	snap-c54ef9aa	us-east-1a	in-use	2011-04-29T16:53:53+0000
    ATTACHMENT	vol-e339fd88	i-cebb95a1	/dev/sda1	attached	2011-04-29T19:22:00+0000


RESTARTED AQUARIUS-8d:

ec2-start-instances i-cebb95a1

    INSTANCE	i-cebb95a1	stopped	pending


CHECK AQUARIUS-8d STARTED:

ec2din i-cebb95a1

    RESERVATION	r-01ce346d	558277860346	default
    INSTANCE	i-cebb95a1	ami-b07985d9	ec2-184-73-96-87.compute-1.amazonaws.com	domU-12-31-38-01-86-01.compute-1.internal	running	aquarius	0		t1.micro2011-04-29T19:23:39+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	184.73.96.87	10.253.137.235			ebs					paravirtual	xen		sg-0a0da063	default
    BLOCKDEVICE	/dev/sda1	vol-e339fd88	2011-04-29T19:24:12.000Z	
    TAG	instance	i-cebb95a1	name	aquarius-8d


CONNECT TO AQUARIUS-8d (NB: NEW IP) FAILS WITH INCORRECT SSH KEY:


ssh -v -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@ec2-184-73-96-87.compute-1.amazonaws.com


SO GOT CONSOLE OUTPUT:

ec2-get-console-output i-cebb95a1



GET CONSOLE OUTPUT OF OTHER SSH-BLOCKED INSTANCES:

ec2dtag

    TAG	instance	i-86ba94e9	name	aquarius-8a3
    TAG	instance	i-b42f3fd9	name	aquarius-7
    TAG	instance	i-14e7c87b	name	aquarius-8a2
    TAG	instance	i-02153a6d	name	aquarius-8b2
    TAG	instance	i-408fd02f	name	aquarius-8b
    TAG	instance	i-c2ab87ad	name	aquarius-8c
    TAG	instance	i-cebb95a1	name	aquarius-8d

</entry>
<entry [Fri 2011:05:13 19:04:38 EST] AQUARIUS-8e (MICRO)>
        
ec2-run-instances ami-b07985d9 \
-g default \
-k aquarius \
--instance-type m1.large -z us-east-1a

ssh -v -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@ec2-50-19-38-136.compute-1.amazonaws.com



TO INVESTIGATE /etc/fstab AND WHERE THE MOUNT IS COMING FROM

CHECKED IN /etc/init.d BUT NO LIKELY CANDIDATE

**** SOLUTION: COMMENT OUT 'cloudconfig' LINE IN /etc/fstab ****


NOTES
-----

SOLUTION TO QUIETEN ERROR MESSAGE
---------------------------------
http://ubuntuforums.org/showthread.php?t=1431118

 think I have got the solution...

(the solution is to disable ipv6)

open /boot/grub/menu.lst with a text editor

edit the line:
Code:
kernel          /boot/vmlinuz-2.6.31-20-server root=/dev/md1 ro quiet splash
to this:
Code:
kernel          /boot/vmlinuz-2.6.31-20-server root=/dev/md1 ro quiet splash ipv6.disable=1
Then run
Code:
sudo update-grub
and reboot..

Now when I restart the nfs-kernel-server no error gets logged..

NOTE:
Default kernel boot options usually go into /etc/default/grub rather than directly into /boot/...

Makes upgrading easier and also applies to new kernels.

</entry>
<entry [Sat 2011:04:30 20:47:59 EST] CREATED AMI OF AQUARIUS-8e POST Init>

    A new EBS-backed AMI is being created and will
    be available in a moment.
    The AMI ID is: ami-94f30cfd


GRANTED PERMISSION TO yuching, syoung AND stuartpyoung:

SYOUNG          728213020069
STUARTPYOUNG    913944561404
GUNEY           503401961460
JGILBERT        558277860346
KNYUTEMANS      684733399587
YUCHING         983300124420

GRANT PERMISSION
ec2-modify-image-attribute ami-988679f1 -l -a 983300124420
ec2-modify-image-attribute ami-988679f1 -l -a 728213020069
ec2-modify-image-attribute ami-988679f1 -l -a 913944561404
    
</entry>
<entry [Sun 2011:04:24 19:50:13 EST] AQUARIUS-7 STORED KEYS>

cat /root/.ssh/authorized_keys

    ...
    ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwLfISpACAJLmhrcjSywBGNp8ZnV9sCBj77Vicp9yqewfv+Nl+Qs770N+rL6ud/P7HKDhCoalA1VToQSGGKZQKNBbPuFSpDm01eIf6pTLDDtmz17EUOiOYJO/2v0m6tHPfZkKTsLafXWVXkmoSjeuuxDEu/N2CTuFSKsKrTrw0h8m+a9/dvITARDknMaBKhoZp3TTNgKB04JafWpxHyjZd8bPkEUxR+kTafKn437bYE78MQpNrTaUPP2OJWyUrgev4wLPAvojFPPV+7NaLnGx/4vSX36H9RAvR7hz0im7hv4cmQkdOqwQgmnBdHH+p/T2xx2m9hgOqnwDqNkslVv0ew== aquarius
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCPnQNSJ8BlNLcb9I/XZW3L1D7iWNzfWs6RJp+H2nMGY3f05ERG1VyuIlADto/8xMypyItInBOGu2Pg1GeOpKYXMVdGtXJ00st5IHPt1gubMMlKki4KCZRqhJu7+mc7ijUa84IX45oEHn7KEf8M6X52npL3sgJw+GSWcKEJ1YQ1AJuykj7SaAAgMoFXvGi9p611ZI1n0PsoupmWAVii9KLd8ZaZEWxiq/NCx/MglBJcYSFzabgi0bmvRdAiY5qYitrMRYLwr1aCk4aZ5ow8wkFvPVqE+I8cpgdyk+fjo/eEnl52aVOaHG7NzUnub3mqXhIy2QozZqxV5k8DzMuqYRL agua
    ...

cat /root/.ssh/unknown_hosts

    ...
    98.254.40.187 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC57OvhygzMJruahwDJtedTelmyNuckthdI57/NEp124i0slP+OTb5FSKVI81OoteKH8Aa+rRrMTQRl6WPJyXSK0fhdFV9iqaeFuuPKUg++vCgRtPi3AhUhhi7XNPv6JfQAvCMlGwUc87ddNmSO3BiUEo7f6WSjEh9ls12VZUMjykrwwkBJI0blK0x/IaBA2O5nqpX0RIcul6vwQ0v2bcI3UBlrhYAVUdcetc/fwR8fIDvGCnq6mtnQDLeI9or/2Ghh0m2i/j6ff6UVfxylJ6rqOpuGK1APHAikr9oOk6eGRybNuxcOCKxrft3jW6y00eZWQHtf5g9Zfka6BnxxHMex


KEYS SAVED ON INSTANCE
/etc/ssh/ssh_host_rsa_key.pub
/etc/ssh/ssh_host_dsa_key.pub

cat /etc/ssh/ssh_host_dsa_key
    -----BEGIN DSA PRIVATE KEY-----
    MIIBugIBAAKBgQCrNh0//ZwQEImbBwQcy0RYrEL5t8o5wSQ+v+hiqv7//rVsec2a8+NT
    AywSQYlJgL2lt8/sPh3+HVqCFlfCf8VMkHJoLmRPzy5yAiZBo37uxmAU8Y6HcyE8
    zc8c+z1/8ZLK6rkkkanJfalu082cPaGVD5BbA4Ila7wcsO53LlkA/myxEQIVAIBv
    QXgPd0uLAyggO8iTA7Zs6FD9AoGAZTOY9T9vm6zuRGwg8FrXBMMtFZ0D8QBAOTer
    zHsp6BGp+W273c5fWX236+xos4ZPOLJMs1J+8CDXY0OsVXdgyMttow+1iGOC1Dmy
    GOGj4m84rlGAIWIYoqa6JQLuBDKcWdLP0skjp4boCDQ3Swh59uoYi8CV3QNYYRlK
    d6zDXsMCgYALd73+KWeuMmStyLe0Q/7GazH22yAgV+SrZhTF3WipRbTP6ihadE1+
    31Y8bOZVFAPRAQTtuY57wEXW3fNxqiytpkxUPiftsSPxn+Zmf3oF7JQGgtsiEPck
    WyI+n/6ooTlWa0z06iqnhpsmmPBUehK3f4NzfxJMj7mXycJvxcTK2AIUWD+Vhx9b
    dfvtiTuy6NMDcSfqT8I=
    -----END DSA PRIVATE KEY-----

cat /etc/ssh/ssh_host_rsa_key
    -----BEGIN RSA PRIVATE KEY-----
    MIIEoAIBAAKCAQEA5SyEggguQ8R6KbROuua8pjuFELFfYm5JUfiDUzRjzojfQGJV
    pwBguFaOJusTE4iyzfYMT117oK/HbGEK1SKuJlYbxbMC5aZFAHLUoOZdB9BhwWaL
    5AS5FHYOrfBEV7a9akhuXUP8npkg6mdg/B9APgTJAetOba98jUQKpG8LuSUMT4pT
    PDaChnFvGqPH7jmAfJW5tIajJz2SM2XNwkbtvOwzigemATnKuoGNYaFbGQ/Dstmx
    aP56EElZYJiEbR7bT32sVwtRDIuxsnZi3P0t57aRFVn+N5GBhNJwgwsFO/S8I2Be
    YYxDczpEahqfDLuTWXPRaP8H1IfN1Lg4IJMLgQIBIwKCAQBVHynnJ5wnzKJnQvir
    0guOM11PV9L4rJ7j7pctiHzXry5Zvh/QUJj0AuRXmSRXtm5Mf/Xxl8A0XovmbS/o
    w70G7Mh8oZNcnNfM93OMOE5wndsqk82PNPRJba2uUe1/qkZarTBOhvduG56C8zKm
    ycdnfh7GMtP82sfcst9hpZaj2dtg82UdtMDi030r91bgCyEMbrTgn+U4ESVdatBS
    XNAmKc0OMoPdZ03ZU6JPM9utv1L+660bzTO8N95W8dZWT4mQ2Ox7XZ3Hx7TZWKc+
    ceJgB8VZdOJoAhwDdtPFClY3LP22oSYHCq/2eN3u/Kvn6AQ8a8PAiSZRAMJxU/bC
    RRz3AoGBAP7fpdVhfFmtFy+YcmtvKZSFmP6yAw5cS6p68thDe3kQx96qryrUapis
    KAjNVFh8m8yTUtiZ1KDDfVJVF79Av4dOXyykKhTG2hlD6LLRWKqZ0xKyuVfrxrix
    QCHSzVr+KKe4UZDhpVBiJ/RuEIHWsQDsjPcX6orIljsI7QHvHslzAoGBAOYvy1nt
    Nfon5ccfg8Fe8fVzDcBW/HpvEoMfZxNl+PWAeLalbgR2QupPFeNI6MbcXStdgnzm
    xk4DSU36CVy6JrpAEYzc5TEEcIolY+3F+79fCaYjA3/RTvOPKwDY0xDkUvMwmASo
    BUC0kdMWJsSKmel7dfKtLRXjFunCEIoma2o7AoGAFdin0HYR+Q7WGgXAqh94l7Ou
    BzPUYFENzMi1usP0o/ofwqDqcWKqDRYSD2IOiz3hd+9e312kgs7tfBXsF7UXuyP5
    h3vJF7lF5OiQSddt//6Ob1El1FYJuA8xYfwgOv/XmVjxDGsczGAvT3cl/IAdzOET
    ZaL22LIbgWcqQf6NnD0CgYB89V/DGl8hZh2mnBRTB6frpNuUTHpuWY205SlTrGKT
    5qfuH0paMZIKKu6f9GEbfvC/xQxSbqYqWY4xpP3En5FdywI2hosL+xiFggMMDGQX
    bhsuTYWOh5FCY6mhX8MJK318s/rAsvuJhphOBLX1qlONYEdX2lpNtcqcJ4VST17h
    5QKBgGRK3xabfdPWzL+Kz1nPlvk7QfV2HtHjvRBFZXY7npaQw13Y/DCTdQt7Edmg
    Rw5JwyrpHvaTX7+91//SNUGqcCsH2hiwgyYI2apXp0NO2IuJPWCaZ/uNJASAxhJe
    ALN5wej9pnmMEy+Fm18UCoUTdlkl446Uq/DKWS72qxQ6Izxm
    -----END RSA PRIVATE KEY-----
    
</entry>
