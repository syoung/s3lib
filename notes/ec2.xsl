ec2


<entry [Mon 2012:12:17 20:22:57 EST] AMAZON FREE USAGE FOR ONE YEAR http://aws.amazon.com/free>

http://aws.amazon.com/free/

SUMMARY

ONE-YEAR FREE
EC2 micro instance
750 hours of Amazon RDS Single-AZ Micro DB Instance
    20 GB of database storage
    10 million I/Os
    20 GB of backup storage for your automated database backups and any user-initiated DB Snapshots

FOREVER FREE
SWF, DynamoDB, SimpleDB, SQS, and SNS (SEE LIMITS BELOW)

TWO-MONTH FREE
CloudWatch
    10 Amazon Cloudwatch metrics, 10 alarms, and 1,000,000 API requests**
    


AWS Free Usage Tier

To help new AWS customers get started in the cloud, AWS is introducing a free usage tier. New AWS customers will be able to run a free Amazon EC2 Micro Instance and a free Amazon RDS Micro Instance for a year, while also leveraging a free usage tier for Amazon S3, Amazon Elastic Block Store, Amazon Elastic Load Balancing, and AWS data transfer. AWS’s free usage tier can be used for anything you want to run in the cloud: launch new applications, test existing applications in the cloud, or simply gain hands-on experience with AWS.

For no additional charge, AWS Elastic Beanstalk allows you quickly and easily deploy your Java, PHP, Python, Ruby, and .NET applications using many of the services offered in the free usage tier. To learn more about AWS Elastic Beanstalk and the free usage tier, go to "Deploy a Sample Web Application in the Free Usage Tier" in the AWS Getting Started Guide: Free Usage Tier.

Below are the highlights of AWS’s free usage tiers. All are available for one year (except SWF, DynamoDB, SimpleDB, SQS, and SNS which are free indefinitely):

An AWS account requires a valid credit card. 

To stay within the Free Usage Tier(s), use only EC2 and RDS Micro sized instances. 

See offer terms.

AWS Free Usage Tier (Per Month):
Elastic Compute Cloud (EC2)
750 hours of Amazon EC2 Linux† Micro Instance usage (613 MB of memory and 32-bit and 64-bit platform support) – enough hours to run continuously each month*
750 hours of Amazon EC2 Microsoft Windows Server‡ Micro Instance usage (613 MB of memory and 32-bit and 64-bit platform support) – enough hours to run continuously each month*
750 hours of an Elastic Load Balancer plus 15 GB data processing*
30 GB of Amazon Elastic Block Storage, plus 2 million I/Os and 1 GB of snapshot storage*

Simple Storage Service (S3)
5 GB of Amazon S3 standard storage, 20,000 Get Requests, and 2,000 Put Requests*

DynamoDB
100 MB of storage, 5 units of write capacity, and 10 units of read capacity for Amazon DynamoDB.**

Relational Database Service (RDS)
750 hours of Amazon RDS Single-AZ Micro DB Instances, for running MySQL, Oracle BYOL or SQL Server (running SQL Server Express Edition) – enough hours to run a DB Instance continuously each month*
20 GB of database storage
10 million I/Os
20 GB of backup storage for your automated database backups and any user-initiated DB Snapshots


SimpleDB
25 Amazon SimpleDB Machine Hours and 1 GB of Storage**

Simple Workflow (SWF)
1,000 Amazon SWF workflow executions can be initiated for free. A total of 10,000 activity tasks, signals, timers and markers, and 30,000 workflow-days can also be used for free**

Simple Queue Service (SQS) and Simple Notification Service (SNS)
100,000 Requests of Amazon Simple Queue Service**
100,000 Requests, 100,000 HTTP notifications and 1,000 email notifications for Amazon Simple Notification Service**

CloudWatch
10 Amazon Cloudwatch metrics, 10 alarms, and 1,000,000 API requests**

Data Transfer
15 GB of bandwidth out aggregated across all AWS services*
In addition to these services, the AWS Management Console is available at no charge to help you build and manage your application on AWS.

60-day Free Trial

In addition to the Free Usage Tier we also offer 60-day Free Trial for all AWS customers that are new to Amazon ElastiCache. AWS customers can avail of this Free Trial in addition to the Free Usage Tier offerings.

For more information on the free trial please follow the link below:

Amazon ElastiCache free trial

* These free tiers are only available to new AWS customers, and are available for 12 months following your AWS sign-up date. When your free usage expires or if your application use exceeds the free usage tiers, you simply pay standard, pay-as-you-go service rates (see each service page for full pricing details). Restrictions apply; see offer terms for more details.

** These free tiers do not expire after 12 months and are available to both existing and new AWS customers indefinitely.

† The following Linux variants are not eligible for the free usage tier as a software license is required: SuSe Linux Enterprise Server and Red Hat Enterprise Linux (RHEL).

‡ The following Windows variants are not eligible for the free usage tier: Microsoft Windows Server 2008 R2 with SQL Server Web, Microsoft Windows Server 2008 R2 with SQL Server Standard, Microsoft Windows 2008 R2 64-bit for Cluster Instances and Microsoft Windows 2008 R2 SQL Server 64-bit for Cluster Instances.

The AWS free usage tier applies to participating services across all AWS regions: US East (Northern Virginia), US West (Oregon), US West (Northern California), EU (Ireland), Asia Pacific (Singapore), Asia Pacific (Tokyo), Asia Pacific (Sydney), and South America (Sao Paulo). Your free usage is calculated each month across all regions and automatically applied to your bill – free usage does not accumulate.

Why Amazon Web Services

Amazon Web Services provides a flexible, scalable, low-cost cloud computing platform for businesses of all sizes all around the world. With AWS, you have access to the same reliable, secure technology platform used to power Amazon.com’s global web properties.

Pay as you go. Beyond the AWS free usage tier, you only pay for the resources you use; there are no long-term contracts or up-front commitments.

Scalable. With AWS, you have access to Amazon’s massive infrastructure – you can use the resources you need to scale your application up or down based on demand.

Flexible. If it runs in your data center, it can run in the cloud. You choose the operating system, programming language, web application platform, software, and other tools to launch existing applications in the cloud or deploy new applications.

Easy to use. You can get started with AWS in minutes. Use the AWS Management Console, APIs, SDKs, or other development tools to get started quickly. Spend time focusing on your idea, not provisioning and managing hardware.

How to Get Started

You can sign up today to automatically take advantage of AWS’s free usage tier.

Sign-up for an AWS account and subscribe to the services you’d like to use.
Enter your billing address and credit card information. You will not be charged unless your usage exceeds the free usage tiers.
Start using AWS – See the Getting Started Guide AWS Free Usage Tier to learn how to get started with the free usage tier. Visit the Resources Section to find Getting Started Guides, development tools, and tutorials, or visit the Community Forums to get your questions answered.

    
</entry>
<entry [Mon 2012:10:01 23:56:18 EST] RECOVER FROM STOP WHEN INSTANCE WON'T START BECAUSE VOLUMES ARE NOT ATTACHED>

1. CREATE DATA FROM SNAPSHOT

DATA SNAPSHOT
    SNAPSHOT	snap-6341b301	vol-5bffe631	completed	2011-10-29T06:36:52+0000	100%	728213020069	200	200GB BIOINFORMATICS DATA VOLUME: REFERENCE SEQUENCES AND JBROWSE DATA

INSTANCE ID i-7ba84006

ec2-create-volume --snapshot snap-6341b301 -s 200 -z us-east-1a 
    VOLUME	vol-4b472531	200	snap-6341b301	us-east-1a	creating	2012-10-01T21:02:03+0000

2. CREATE NETHOME VOLUME FROM SCRATCH

ec2-create-volume -s 100 -z us-east-1a 
    VOLUME	vol-fb442681	100		us-east-1a	creating	2012-10-01T21:02:57+0000

3. ATTACH VOLUMES TO HEAD2 INSTANCE

/data
ec2-attach-volume vol-4b472531 -i i-7ba84006 -d /dev/sdh

/nethome
ec2-attach-volume vol-fb442681 -i i-7ba84006 -d /dev/sdi

ec2-detach-volume vol-4b472531 --force
ec2-detach-volume vol-fb442681 --force


4. REBOOT INSTANCE

ec2din $head2
ec2-reboot-instances $head2

</entry>
<entry [Mon 2012:10:01 23:55:38 EST] CAN'T FIX 'unrecognized disk label'>
    
    
PROBLEM

parted -l GAVE THIS ERROR MESSAGE WITH /nethome:

Error: /dev/xvdi: unrecognised disk label


DIAGNOSIS

TRIED TO FIX WITH fsck

fsck.ext3 -fy /dev/xvdi

    fsck.ext3: Superblock invalid, trying backup blocks...
    fsck.ext3: Bad magic number in super-block while trying to open /dev/xvdi


SOLUTION

TRASH IT AND MAKE NEW VOLUME FROM SNAPSHOT ... OR MAKE A SNAPSHOT OF THE VOLUME AND RECREATE IT

https://forums.aws.amazon.com/message.jspa?messageID=303189

Re: Volume problem after scheduled maintenance reboot
Posted by:   DanielC@AWS
Posted on: Dec 16, 2011 9:19 AM
 in response to: lzappa
 		Reply
Hi lzappa, 

Unfortunately it looks like you are correct. The volume is corrupt and the OS could not find any filesystem on it.

At this point, you will need to recreate your volume from your backup. You could create a volume from the latest snapshot and update the volume with the latest backup that you have.

Please let me know if I can help you further.

Regards, 

-Daniel
Re: Volume problem after scheduled maintenance reboot
Posted by: lzappa
Posted on: Dec 16, 2011 4:45 PM
 in response to: DanielC@AWS
 		Reply
just for info. I was able to make a snapshot of the volume, recreate a new volume and attach it to a new instance.
But snapshot process was very slow, backup recovery finished before....





NOTE: DON'T USE PARTED'S mklabel:

Command: mklabel label-type

Creates a new disk label, of type label-type. The new disk label will have no partitions. This command (normally) won't technically destroy your data, but it will make it basically unusable, and you will need to use the rescue command (see Related information) to recover any partitions. Parted works on all partition tables. 1


</entry>
<entry [Wed 2012:09:26 06:20:56 EST] FIXED PROBLEM OF MISSING /dev/sdh WHEN MOUNTING /data>

PROBLEM

DO ec2-attach-volume AND CAN SEE ITS ATTACHED AT /dev/sdh:

ec2din $head2
RESERVATION	r-f3745b94	728213020069	default
INSTANCE	i-7ba84006	ami-11c67678	ec2-54-243-226-229.compute-1.amazonaws.com	ip-10-88-214-108.ec2.internal	running	aquarius2	0		m1.small	2012-09-26T02:06:49+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	54.243.226.229	10.88.214.108			ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-4f68cf35	2012-09-24T20:47:17.000Z	
BLOCKDEVICE	/dev/sdh	vol-df10a7a5	2012-09-26T09:43:38.000Z	
TAG	instance	i-7ba84006	description	TESTING init.html
TAG	instance	i-7ba84006	name	aquarius-8h


... BUT WHEN I MOUNT I GET THIS ERROR:

mount /dev/sdh /data
    
    device not ready: /dev/sdh


DIAGNOSIS

parted -l SHOWS NO /dev/sdh BUT THERE IS A 200GB /dev/xvdh VOLUME CONTAINING 160GB OF DATA:

    Model: Unknown (unknown)
    Disk /dev/xvdb1: 160GB
    Sector size (logical/physical): 512B/512B
    Partition Table: loop
    
    Number  Start  End    Size   File system  Flags
     1      0.00B  160GB  160GB  ext3


THIS IS BECAUSE OF THE PARTICULAR KERNEL OF THE INSTANCE:

http://stackoverflow.com/questions/6986737/aws-ebs-attached-but-cant-find-on-instance

    Some kernels use /dev/xvd* instead of /dev/sd*. In your case, if you have attached the volume with device name /dev/sdh it would appear as /dev/xvdh in the machine.
    Not sure if it will be the reason in your case, but we found a similar problem while integrating Fedora images in our infrastructure for BitNami Cloud Hosting.
    

SOLUTION

CHECK FOR /dev/sdh. IF NOT FOUND, CHECK FOR /dev/xvdh THEN MOUNT

mount /dev/xvdh /data
ll /data

    drwxr-xr-x 53 www-data www-data     4096 2011-08-12 11:11 apps
    drwxr-xr-x 53 root     root         4096 2010-10-14 07:48 apps.recent
    drwxr-xr-x  3 www-data www-data     4096 2011-08-11 10:50 jbrowse
    drwxr-xr-x  5 www-data www-data     4096 2010-10-11 05:07 mysql
    drwxr-xr-x  5 root     root         4096 2010-10-11 05:07 mysql.recent
    drwxrwxr-x  3 www-data www-data     4096 2011-08-10 08:24 sequence
    -rw-r--r--  1 www-data www-data 48343218 2011-05-01 06:07 sequence.tar.gz
    drwxr-xr-x  6 root     root         4096 2011-09-30 04:35 starcluster
    drwxr-xr-x  8 www-data www-data     4096 2011-08-29 03:47 starcluster.ok


    
</entry>
<entry [Mon 2012:07:30 03:28:42 EST] TOKEN TOO LONG TO FIT ROW - BREAK WITH >

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDEdDH pWm9dfGUfVw+3FxJT3X610PsB9CvP3cCZkR9ZjtvSRWf ED9g83TCsaSb3AW6E9KGcj8JNzZkrDydG7TtwXLPAlpT ePqtqg/SV+Pf6juRVHbcYMbGoS9GtYWbaWoCeZH2fKv8 k+vbo0XjbwEFP6kV0tvut5HuOyz2MqzS6YQ==     
</entry>
<entry [Mon 2012:07:30 01:50:54 EST] CONVERTING TO PKCS #8 FORMAT>

SUMMARY

1. Privacy Enhanced Mail (PEM) is a specific type of Base64 encoding...which is to say it is a way of representing binary data using only printable ASCII characters.

2. In order to get a public key that worked using ssh-keygen instead of running "ssh-keygen -f key.pub -e -m pem" I had to run "ssh-keygen -f key.pub -e -m pkcs8".

I believe using "pem" creates a PKCS#1 grammar public key instead of PKCS#8 and openssl expectes PKCS#8




http://blog.oddbit.com/2011/05/converting-openssh-public-keys.html

Converting OpenSSH public keys
I've posted a followup to this article that discusses ssh-agent.
For reasons best left to another post, I wanted to convert an SSH public key into a PKCS#1 PEM-encoded public key. That is, I wanted to go from this:

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD7EZn/BzP26AWk/Ts2ymjpTXuXRiEWIWn
HFTilOTcuJ/P1HfOwiy4RHC1rv59Yh/E6jbTx623+OGySJWh1IS3dAEaHhcGKnJaikrBn3c
cdoNVkAAuL/YD7FMG1Z0SjtcZS6MoO8Lb9pkq6R+Ok6JQjwCEsB+OaVwP9RnVA+HSYeyCVE
0KakLCbBJcD1U2aHP4+IH4OaXhZacpb9Ueja6NNfGrv558xTgfZ+fLdJ7cpg6wU8UZnVM1B
JiUW5KFasc+2IuZR0+g/oJXaYwvW2T6XsMgipetCEtQoMAJ4zmugzHSQuFRYHw/7S6PUI2U
03glFmULvEV+qIxsVFT1ng3pj lars@tiamat.house
To this:

-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEA+xGZ/wcz9ugFpP07Nspo6U17l0YhFiFpxxU4pTk3Lifz9R3zsIsu
ERwta7+fWIfxOo208ett/jhskiVodSEt3QBGh4XBipyWopKwZ93HHaDVZAALi/2A
+xTBtWdEo7XGUujKDvC2/aZKukfjpOiUI8AhLAfjmlcD/UZ1QPh0mHsglRNCmpCw
mwSXA9VNmhz+PiB+Dml4WWnKW/VHo2ujTXxq7+efMU4H2fny3Se3KYOsFPFGZ1TN
QSYlFuShWrHPtiLmUdPoP6CV2mML1tk+l7DIIqXrQhLUKDACeM5roMx0kLhUWB8P
+0uj1CNlNN4JRZlC7xFfqiMbFRU9Z4N6YwIDAQAB
-----END RSA PUBLIC KEY-----

If you have a recent version of OpenSSH (where recent means 5.6 or later), you can just do this:

ssh-keygen -f key.pub -e -m pem

If you don't have that, read on.

OpenSSH Public Key Format

The OpenSSH public key format is fully documented RFC 4253. Briefly, an OpenSSH public key consists of three fields:

The key type

A chunk of PEM-encoded data

What, you may ask, is PEM encoding? Privacy Enhanced Mail (PEM) is a specific type of Base64 encoding...which is to say it is a way of representing binary data using only printable ASCII characters.

For an ssh-rsa key, the PEM-encoded data is a series of (length, data) pairs. The length is encoded as four octets (in big-endian order). The values encoded are:

algorithm name (one of (ssh-rsa, ssh-dsa)). This duplicates the key type in the first field of the public key.
RSA exponent
RSA modulus

For more information on how RSA works and what the exponent and modulus are used for, read the Wikipedia article on RSA.

We can read this in with the following Python code:

import sys
import base64
import struct

# get the second field from the public key file.
keydata = base64.b64decode(
  open('key.pub').read().split(None)[1])

parts = []
while keydata:
    # read the length of the data
    dlen = struct.unpack('>I', keydata[:4])[0]

    # read in < length> bytes
    data, keydata = keydata[4:dlen+4], keydata[4+dlen:]

    parts.append(data)
This leaves us with an array that, for an RSA key, will look like:

['ssh-rsa', '...bytes in exponent...', '...bytes in modulus...']
We need to convert the character buffers currently holding e (the exponent) and n (the modulus) into numeric types. There may be better ways to do this, but this works:

e_val = eval('0x' + ''.join(['%02X' % struct.unpack('B', x)[0] for x in
    parts[1]]))
n_val = eval('0x' + ''.join(['%02X' % struct.unpack('B', x)[0] for x in
    parts[2]]))
We now have the RSA public key. The next step is to produce the appropriate output format.

PKCS#1 Public Key Format
Our target format is a PEM-encoded PKCS#1 public key.

PKCS#1 is "the first of a family of standards called Public-Key Cryptography Standards (PKCS), published by RSA Laboratories." (Wikipedia). You can identify a PKCS#1 PEM-encoded public key by the markers used to delimit the base64 encoded data:

-----BEGIN RSA PUBLIC KEY-----
...
-----END RSA PUBLIC KEY-----
This is different from an x.509 public key, which looks like this:

-----BEGIN PUBLIC KEY-----
...
-----END PUBLIC KEY-----
The x.509 format may be used to store keys generated using algorithms other than RSA.

The data in a PKCS#1 key is encoded using DER, which is a set of rules for serializing ASN.1 data. For more information see:

The WikiPedia entry for Distinguished Encoding Rules
A Layman's Guide to a Subset of ASN.1, BER, and DER
Basically, ASN.1 is a standard for describing abstract data types, and DER is a set of rules for transforming an ASN.1 data type into a series of octets.

According to the ASN module for PKCS#1, a PKCS#1 public key looks like this:

RSAPublicKey ::= SEQUENCE {
    modulus           INTEGER,  -- n
    publicExponent    INTEGER   -- e
}
We can generate this from our key data using Python's PyASN1 module:

from pyasn1.type import univ

pkcs1_seq = univ.Sequence()
pkcs1_seq.setComponentByPosition(0, univ.Integer(n_val))
pkcs1_seq.setComponentByPosition(1, univ.Integer(e_val))
Generating the output
Now that we have the DER encoded key, generating the output is easy:

from pyasn1.codec.der import encoder as der_encoder

print '-----BEGIN RSA PUBLIC KEY-----'
print base64.encodestring(der_encoder.encode(pkcs1_seq))
print '-----END RSA PUBLIC KEY-----'
Appendix: OpenSSH private key format
Whereas the OpenSSH public key format is effectively "proprietary" (that is, the format is used only by OpenSSH), the private key is already stored as a PKCS#1 private key. This means that the private key can be manipulated using the OpenSSL command line tools.

The clever folks among you may be wondering if, assuming we have the private key available, we could have skipped this whole exercise and simply extracted the public key in the correct format using the openssl command. We can come very close...the following demonstrates how to extract the public key from the private key using openssl:

$ openssl rsa -in key -pubout
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA+xGZ/wcz9ugFpP07Nspo
6U17l0YhFiFpxxU4pTk3Lifz9R3zsIsuERwta7+fWIfxOo208ett/jhskiVodSEt
3QBGh4XBipyWopKwZ93HHaDVZAALi/2A+xTBtWdEo7XGUujKDvC2/aZKukfjpOiU
I8AhLAfjmlcD/UZ1QPh0mHsglRNCmpCwmwSXA9VNmhz+PiB+Dml4WWnKW/VHo2uj
TXxq7+efMU4H2fny3Se3KYOsFPFGZ1TNQSYlFuShWrHPtiLmUdPoP6CV2mML1tk+
l7DIIqXrQhLUKDACeM5roMx0kLhUWB8P+0uj1CNlNN4JRZlC7xFfqiMbFRU9Z4N6
YwIDAQAB
-----END PUBLIC KEY-----
So close! But this is in x.509 format, and even though the OpenSSL library supports PKCS#1 encoding, there is no mechanism to make the command line tools cough up this format.

Additionally, I am trying for a solution that does not require the private key to be available, which means that in any case I will still have to parse the OpenSSH public key format.

Posted by Lars at 9:03 PM
Email This
BlogThis!
Share to Twitter
Share to Facebook

Labels: cryptography, openssh, openssl, rsa
2 comments:

thwartedJune 14, 2011 5:28 AM
I improved on your code and generated, from just the public key file, the same format openssl generates from extracting the publickey from the private key file.

https://gist.github.com/1024558

Reply

Gene WoodJune 23, 2012 1:46 AM
In order to get a public key that worked using ssh-keygen instead of running "ssh-keygen -f key.pub -e -m pem" I had to run "ssh-keygen -f key.pub -e -m pkcs8".

I believe using "pem" creates a PKCS#1 grammar public key instead of PKCS#8 and openssl expectes PKCS#8

Reply

    
</entry>
<entry [Mon 2012:07:30 01:48:42 EST] AMAZON USES VERSION 1 KEY ?? >

http://ubuntuforums.org/showthread.php?t=1777348

First thing is your key really needs to be a Version 2 key, not Version 1,
but Amazon uses Version 1

NOT TRUE -- USED ssh-keygen TO CREATE A VERSION 1 KEY:

ssh-keygen -t rsa1
    OK

/tmp/rsa1$ head *
==> id_rsa1 <==
    SSH PRIVATE KEY FILE FORMAT 1.1
    **** BINARY FILE CONTENTS ****

==> id_rsa1.pub <==
    2048 65537 21537305268663802954073564457138375440469435143690976707428454970380716443173655048453237594133179350345952747134511838658499900550767075050515282593255706236989822226361270612992451089869347190003851618635367334000975450130254107622750124190299069266682797116039251160988811714928556975362594212083287076277212897138781784859072507620877503127270710866078022330903288710921402005708937820969472964978042156358581610153655189413369846254518699908134358094921246137264473594384952517799434808182325830251863003108339384086480770428352034494933971989496570781320651921577739973503789321777340064574304794018063432276809 syoung@syoung-Satellite-C675D


NOT TRUE -- USED ssh-keygen TO CREATE A VERSION 1 KEY:

ssh-keygen -t rsa -P "" -f id_rsa
    Generating public/private rsa key pair.
    Your identification has been saved in id_rsa.
    Your public key has been saved in id_rsa.pub.
    The key fingerprint is:
    ec:ca:b0:dc:9e:c6:58:cf:c8:07:e7:e7:58:77:a7:a2 syoung@syoung-Satellite-C675D
    The key's randomart image is:
    +--[ RSA 2048]----+
    |                 |
    |                 |
    |                 |
    |       .         |
    |        S        |
    |      o..        |
    |    .= B. . . . .|
    |   ..==o=o.... o |
    |    oo*..oE. ..  |
    +-----------------+

syoung@syoung-Satellite-C675D:/tmp/rsa2$ ll
total 16K
drwxrwxr-x  2 syoung syoung 4.0K Jul 30 02:16 .
drwxrwxrwt 21 root   root   4.0K Jul 30 02:15 ..
-rw-------  1 syoung syoung 1.7K Jul 30 02:16 id_rsa
-rw-r--r--  1 syoung syoung  411 Jul 30 02:16 id_rsa.pub


cd /tmp/rsa2
head *

    ==> id_rsa <==
    -----BEGIN RSA PRIVATE KEY-----
    MIIEowIBAAKCAQEAw4pqjxM5rJTPTPhlTKJEaJJA/cHwh8ZsjTTel2bB23F3w+Ee
    GQVyrNPyMuY6WzpS5XEypjSzoajq9Sjfl4wRA2YzDjom1MSXZMwufQXMXfSCsW67
    taDyR6uX/f5fvOq/WFJ1luLoybpSTsLHgA+1YivWfX+QxdI6cE1RfF576NwSKB8n
    64b655j2Z+TgLZMAh0zOyKwQMTWcgG07xnWnjylFOv79JzpIZhytpdUGtl80L0v4
    yxWaD5wyJ+ctbdSgQDhxValyJzrTIvVEIvLLsAOvnwamKarIA4woljIb2remJUTj
    eLhYlEc90eqUDVgwKpD20VsCi2z06I0oW2pMXQIDAQABAoIBAA57lATg0aa8ptX2
    l9ojMpnkKzggQyZrReL3hX0FOVp9fvddFxOXWbT/RbMLZksXeMhRqASzZpKUpkJe
    MqFQ2Hm9+g4VtIaRwPzQOqk74rUaxQtLPk/nicpRJULEsmaVpHJwORFh4Qf/6tS2
    jHwpra+Fu68z4Y8lUPq8X0qs3NSURvozWJBRwS1A1mEUTPf1bXETU55huF8wBVl2
    
    ==> id_rsa.pub <==
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDimqPEzmslM9M+GVMokRokkD9wfCHxmyNNN6XZsHbcXfD4R4ZBXKs0/Iy5jpbOlLlcTKmNLOhqOr1KN+XjBEDZjMOOibUxJdkzC59Bcxd9IKxbru1oPJHq5f9/l+86r9YUnWW4ujJulJOwseAD7ViK9Z9f5DF0jpwTVF8Xnvo3BIoHyfrhvrnmPZn5OAtkwCHTM7IrBAxNZyAbTvGdaePKUU6/v0nOkhmHK2l1Qa2XzQvS/jLFZoPnDIn5y1t1KBAOHFVqXInOtMi9UQi8suwA6+fBqYpqsgDjCiWMhvat6YlRON4uFiURz3R6pQNWDAqkPbRWwKLbPTojShbakxd syoung@syoung-Satellite-C675D

    
</entry>
<entry [Mon 2012:07:30 01:45:24 EST] REPEAT AGAIN: GENERATE id_rsa.pub FOR GITHUB FROM EC2 *.pem - OUTSIDE OF ~/.ssh DIRECTORY>


NB: THIS PRIVATE KEY IS USED AS A DEPLOY KEY FOR aguadev:test-1

SO GET THIS ERROR WHEN TRYING TO PUSH TO syoung:biorepository:

ERROR: Permission to syoung/biorepository.git denied to aguadev/test-1.



0. MAKE DIR 

mkdir /tmp/ec2
cd /tmp/ec2

1. DOWNLOAD PRIVATE KEY AND CERT FROM AWS

AWS --> Security Credentials --> Access Credentials --> Create New Certificate

DOWNLOAD TO:

cd /home/syoung/notes/backup/agua/admin/.keypairs/testdual
ls

    cert-ETJPG2EINWHADJEEZVIV75VBIPVZK6FJ.pem
    pk-ETJPG2EINWHADJEEZVIV75VBIPVZK6FJ.pem

head -n 40 *
    ==> cert-ETJPG2EINWHADJEEZVIV75VBIPVZK6FJ.pem <==
    -----BEGIN CERTIFICATE-----
    MIICdjCCAd+gAwIBAgIFZItwKaswDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC
    VVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY
    QVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEyMDczMDA2MjQwOFoXDTEzMDcz
    MDA2MjQwOFowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV
    BgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEwxra3QxOHYzeGVnM2UwgZ8w
    DQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMR0Melab118ZR9XD7cXElPdfrXQ+wH0
    K8/dwJmRH1mO29JFZ8QP2DzdMKxpJvcBboT0oZyPwk3NmSsPJ0btO3Bcs8CWlN4+
    q2qD9JX49/qO5FUdtxgxsahL0a1hZtpagJ5kfZ8q/yT69ujReNvAQU/qRXS2+63k
    e47LPYyrNLphAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK
    BggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBTGrc6UaDqKYg6h5p4L
    /tk0pA9CxTANBgkqhkiG9w0BAQUFAAOBgQC4/415dfSoj6I+4dwYnQINmjiXoByO
    Dzba1zF8ik7qG7w9smZq+8kn86Ny+FZP4JkQer8Y/GPF2EAw0UrK8GNGPa5W+heu
    v24Jn8WS56pkYAIX5S97L9tHYZUwVoZFtTC2wE7MYWAo+xCmUzq1yUbfBTvq9fOu
    sQYRibrv0QqRhw==
    -----END CERTIFICATE-----
    
    ==> pk-ETJPG2EINWHADJEEZVIV75VBIPVZK6FJ.pem <==
    -----BEGIN PRIVATE KEY-----
    MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMR0Melab118ZR9XD7cXElPdfrXQ
    +wH0K8/dwJmRH1mO29JFZ8QP2DzdMKxpJvcBboT0oZyPwk3NmSsPJ0btO3Bcs8CWlN4+q2qD9JX4
    9/qO5FUdtxgxsahL0a1hZtpagJ5kfZ8q/yT69ujReNvAQU/qRXS2+63ke47LPYyrNLphAgMBAAEC
    gYAOJIdLU1VdF414Gh5pgeGx4+oxUKAhXeChkEdDRu1I1z3//zsfJDze9NWCM/e4JIQ+UhYoXTkR
    vNFgBjE/q+hxaAUDcfEIArc/9xTrNAQ9aC/BNevA+AupWBXaED2hioO/FkW80+hUBMScrcrDN0cw
    VdsWG9a4jK1amQ3u55YeAQJBAOyr98N6stdlVpEeKZFlW0ci9r7+14RBiyfLnTYXPvI5crPQYjpw
    dPzKMaMeMkpyYM7RLu8eyKh15VHWTleM+nECQQDUf2c2ezCEgYKfHsqMt4zqzHhuunu5O4O01XAY
    qXlS8CimiiBPO6xaKnd1I83rv4uJhoGGfQz8U2bt0Sloi1bxAkBI7QxhPZOR73XnLWYdmR+xIcLq
    Q1hhNlkMoB8HJc6NkMoZQiKiYziJFDyLSKiya+AMmkReBhxKXFmXB/QH4jbhAkEAoxpTH5c4q0w4
    9WeN8qpkSEi/W8ZZdtj+g8ub6eITFJzvpry4hfh4lxCndksQIJZ6RQnv20masQZXJ8z2qp7hEQJB
    AL4peS6h6uGoJ/dN1HK4TvsxBprBRdfdgYBEKXYBH4ut4mS8abZQEE3v8kCPfBsILNG3mZ6W7dkQ
    VlxCEMm2udk=
    -----END PRIVATE KEY-----



2. COPY PRIVATE *.pem FILE TO id_ssl FILE

cd /tmp/ec2
cp /home/syoung/notes/backup/agua/admin/.keypairs/testdual/cert-ETJPG2EINWHADJEEZVIV75VBIPVZK6FJ.pem public.pem
cp /home/syoung/notes/backup/agua/admin/.keypairs/testdual/pk-ETJPG2EINWHADJEEZVIV75VBIPVZK6FJ.pem private.pem

    -rw-rw-r--  1 syoung syoung  928 Jul 30 02:31 private.pem
    -rw-rw-r--  1 syoung syoung  916 Jul 30 02:31 public.pem

chmod 600 private.pem


3. GENERATE NEW id_rsa.pub FROM COPIED *.pem FILE

ssh-keygen -y -f private.pem > id_rsa.pub
    OK

    -rw-rw-r--  1 syoung syoung  213 Jul 30 02:31 id_rsa.pub
    -rw-------  1 syoung syoung  928 Jul 30 02:31 private.pem
    -rw-rw-r--  1 syoung syoung  916 Jul 30 02:31 public.pem

cat id_rsa.pub

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDEdDHpWm9dfGUfVw+3FxJT3X610PsB9CvP3cCZkR9ZjtvSRWfED9g83TCsaSb3AW6E9KGcj8JNzZkrDydG7TtwXLPAlpTePqtqg/SV+Pf6juRVHbcYMbGoS9GtYWbaWoCeZH2fKv8k+vbo0XjbwEFP6kV0tvut5HuOyz2MqzS6YQ==

    OK    

    
4. PASTE INTO GITHUB AS DEPLOY KEY IN aguadev/test REPO ADMIN PAGE:

https://github.com/aguadev/test

-->  Admin --> Deploy Keys --> Add Deploy Key

    sshkeygen (b6:96:3d:4a:06:ea:53:42:29:62:27:b4:0b:5b:f4:64)
    


5. ACCESS REPO USING PRIVATE KEY (COPIED FROM *.pem)

ssh -T -i private.pem git@github.com
    Hi aguadev/test-1! You've successfully authenticated, but GitHub does not provide shell access.

    
6. RETRY ACCESS AFTER ADDING TO SSH AGENT WITH ssh-add:

ssh-add private.pem
    Identity added: /home/syoung/.ssh/private.pem (/home/syoung/.ssh/private.pem)

NOW WORKS WITHOUT 'Agent admitted failure' MESSAGE:

ssh -T -i private.pem git@github.com:aguadev/test
    Hi aguadev/test! You've successfully authenticated, but GitHub does not provide shell access.
    

    
</entry>
<entry [Mon 2012:07:30 00:21:51 EST] REPEAT: GENERATE id_rsa.pub FOR GITHUB FROM EC2 *.pem>


1. RENAME EXISTING id_rsa.pub

mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub.orig


2. COPY PRIVATE *.pem FILE TO id_ssl FILE

cp /home/syoung/notes/backup/agua/admin/.keypairs/private.pem ~/.ssh/id_ssl
chmod 600 ~/.ssh/id_ssl


3. GENERATE NEW id_rsa.pub FROM COPIED *.pem FILE

ssh-keygen -y -f ~/.ssh/id_ssl > ~/.ssh/id_rsa.pub
    OK

ALSO WORKS WITH     private.pem
    
    cp /home/syoung/notes/backup/agua/admin/.keypairs/private.pem ~/.ssh/private.pem
    chmod 600 ~/.ssh/private.pem
    ssh-keygen -y -f ~/.ssh/private.pem > ~/.ssh/id_rsa.pub-private.pem
        OK

cat id_rsa.pub-private.pem 

    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCZ+6PKDlGlIE8CONGqEV65risoWVlmSXlnC4Z2HJrIAtheH/cx0vVKUXnFodkK6y11ZrvsXbsNXaH1sVAE/6f+dZRjleYcq3bbDKBw0DVSLwujNhEw/rc+Word5OmewNWlq1fOpu8rVOeZo+wZ4o17aTLyNJ17OfVVXoOHAcP0BQ==

    OK    

4. PASTE INTO GITHUB AS DEPLOY KEY IN aguadev/test REPO ADMIN PAGE:

https://github.com/aguadev/test -->  Admin --> Deploy Keys --> Add Deploy Key

    FROM *.pem (74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e)


5. ACCESS REPO USING PRIVATE KEY (COPIED FROM *.pem)

ssh -T -i ~/.ssh/id_ssl git@github.com:aguadev/test

    Agent admitted failure to sign using the key.
    Hi aguadev/test! You've successfully authenticated, but GitHub does not provide shell access.

    
6. RETRY ACCESS AFTER ADDING TO SSH AGENT WITH ssh-add:

ssh-add ~/.ssh/id_ssl
    Identity added: /home/syoung/.ssh/id_ssl (/home/syoung/.ssh/id_ssl)

NOW WORKS WITHOUT 'Agent admitted failure' MESSAGE:

ssh -T -i ~/.ssh/id_ssl git@github.com:aguadev/test
    Hi aguadev/test! You've successfully authenticated, but GitHub does not provide shell access.


    
</entry>
<entry [Sun 2012:07:29 23:52:25 EST] GITHUB EXPECTS PKCS FORMAT PRIVATE KEY AND CERT>


standard PKCS format

OPENSSH 5.6+

ssh-keygen -f key.pub -e -m pem

http://blog.oddbit.com/2011/05/converting-openssh-public-keys.html


</entry>
<entry [Sun 2012:07:29 23:46:39 EST] DIFFERENCE BETWEEN 'BEGIN PRIVATE KEY' AND 'BEGIN RSA PRIVATE KEY'>

http://stackoverflow.com/questions/9678202/why-different-private-key-strings-under-linux-or-windows

WHAT'S THE DIFFERENCE BETWEEN

-----BEGIN PRIVATE KEY-----NBgkqhkiG9w0BAQE....ASDFasjkfa-----END PRIVATE KEY-----

AND THIS:

-----BEGIN RSA PRIVATE KEY-----NBgkqhkiG9E....ASDFasjkfa-----END RSA PRIVATE KEY-----


OpenSSL supports more than one private key format. The PEM header identifies which format is being used.

The first one is in a standard PKCS format and includes an identifier that indicates that it's an RSA key.

The second one is in an RSA-specific format and so doesn't need that identifier.

    
</entry>
<entry [Sun 2012:07:29 23:29:33 EST] CREATE CUSTOM UBUNTU AMI THE SECURE WAY>

https://github.com/kickstarter/build-ubuntu-ami

Create custom Ubuntu AMIs the hard (secure) way
build-ubunut-ami is a simple tool for making secure, custom Ubuntu images for Amazon EC2 from your local computer.

Why the hard way?
Booting and logging in to a system offers many opportunities to leak secret credentials (even if you delete them). Creating an AMI from a pristine image rather than a running root volume obviates the need to remove leaked credentials.

This program is based on Eric Hammond's blog post Creating Public AMIs Securely for EC2, and his shell script alestic-git-build-ami.

For convenience, this script does not need an AWS EC2 private key & cert for credentials. It uses the AWS Access Key ID and Secret Access Key instead.

Install

# Using rubygems
gem install build-ubuntu-ami



Basic Usage
See examples of custom build scripts.

# Create a custom AMI from my_script.sh
build-ubuntu-ami my_script.sh

# Show options
build-ubuntu-ami -h

# Example output
$ build-ubuntu-ami -k aaron-rsa -g aaron-test -b demoami custom.sh
Configuration:
  region: us-east-1

  
ALESTIC BUILD GIT SERVER SCRIPT
--------------------------------

https://github.com/alestic/alestic-git/blob/master/bin/alestic-git-build-ami

<!--
#!/bin/bash -ex
#
# alestic-git-build-ami
#
# Build new AMI for an Alestic Git Server.
#
# This expects to run on an EC2 instance.
#

# Defaults

# Brand used in AMI name and description
brand="My"

# Size of AMI file system
size=8 # GB

# Ubuntu release
codename=oneiric

# AMI name timestamp
now=$(date -u +%Y%m%d-%H%M)

# Command line options
while [ $# -gt 0 ]; do
  case $1 in
    --brand)       brand=$2;     shift 2 ;;
    --size)        size=$2;      shift 2 ;;
    --codename)    codename=$2;  shift 2 ;;
    --now)         now=$2;       shift 2 ;;
    *)             echo "$0: Unrecognized option: $1" >&2; exit 1;
  esac
done

# Setup
case $codename in
  maverick)   release=10.10     ;;
  natty)      release=11.04     ;;
  oneiric)    release=11.10     ;;
  precise)    release=12.04     ;;
  *)          echo "$0: Unrecognized codename: $codename" >&2; exit 1;
esac

if [ $(uname -m) = 'x86_64' ]; then
  arch=x86_64
  arch2=amd64
  ephemeraldev=/dev/sdb
else
  arch=i386
  arch2=i386
  ephemeraldev=/dev/sda2
fi

name="${brand,}-git-server-ubuntu-$release-$codename-$arch2-$now"
description="$brand Git Server - Ubuntu $release ${codename^} $arch2 $now"

export EC2_CERT=$(echo /mnt/cert-*.pem)
export EC2_PRIVATE_KEY=$(echo /mnt/pk-*.pem)

imagename=$codename-server-cloudimg-$arch2
imageurl=http://cloud-images.ubuntu.com/$codename/current/$imagename.tar.gz
amisurl=http://cloud-images.ubuntu.com/query/$codename/server/released.current.txt
zoneurl=http://instance-data/latest/meta-data/placement/availability-zone
zone=$(wget -qO- $zoneurl)
region=$(echo $zone | perl -pe 's/.$//')
akiid=$(wget -qO- $amisurl | egrep "ebs.$arch2.$region.*paravirtual" | cut -f9)
#ariid=$(wget -qO- $amisurl | egrep "ebs.$arch2.$region.*paravirtual" | cut -f10)

# Update and install Ubuntu packages
export DEBIAN_FRONTEND=noninteractive
sudo perl -pi -e 's/^# *(deb .*multiverse)$/$1/' /etc/apt/sources.list
sudo apt-get update
sudo -E apt-get upgrade -y
sudo -E apt-get install -y \
  ec2-api-tools            \
  ec2-ami-tools
#  xfsprogs

# Download base Ubuntu server image built by Canonical
image=/mnt/$imagename.img
imagedir=/mnt/$codename-cloudimg-$arch2
wget -qO- $imageurl |
  sudo tar xzf - -C /mnt
sudo mkdir -p $imagedir
sudo mount -o loop $image $imagedir

# Allow network access from chroot environment
sudo cp /etc/resolv.conf $imagedir/etc/

# We used XFS for the target root file system
#sudo perl -pi -e 's%(\t/\t)ext4(\t)%${1}xfs${2}%' $imagedir/etc/fstab

# Upgrade and install packages on the target file system
sudo chroot $imagedir mount -t proc none /proc
#sudo chroot $imagedir mount -t devpts none /dev/pts
cat <<EOF | sudo tee $imagedir/usr/sbin/policy-rc.d > /dev/null
#!/bin/sh
exit 101
EOF
sudo chmod 755 $imagedir/usr/sbin/policy-rc.d
DEBIAN_FRONTEND=noninteractive
sudo perl -pi -e 's/^# *(deb .*multiverse)$/$1/' \
  $imagedir/etc/apt/sources.list                 \
  $imagedir/etc/cloud/templates/sources.list.tmpl
#sudo chroot $imagedir add-apt-repository ppa:alestic
sudo chroot $imagedir apt-get update
sudo -E chroot $imagedir apt-get dist-upgrade -y

# Turn off byobu autolaunch as it causes errors on later chroot commands
sudo chroot $imagedir       \
  mkdir -p /root/.byobu /home/ubuntu/.byobu
sudo chroot $imagedir       \
  touch /root/.byobu/disable-autolaunch /home/ubuntu/.byobu/disable-autolaunch

#### BEGIN alestic-git

gituser=git

# Install software
sudo -E chroot $imagedir    \
  apt-get install -y        \
    ec2-api-tools           \
    coreutils               \
    git-core                \
    nginx-light             \

#    ec2-consistent-snapshot \

# Create git user with hardcoded UID
sudo chroot $imagedir       \
  addgroup --gid 500 $gituser
sudo chroot $imagedir       \
  adduser                   \
    --home /home/$gituser   \
    --uid 500               \
    --gid 500               \
    --disabled-password     \
    --gecos gitolite        \
    $gituser

echo 'PATH="$HOME/bin:$PATH"' |
  sudo tee -a $imagedir/home/$gituser/.bashrc > /dev/null

# Install git as the git user in the chroot
sudo chroot $imagedir sudo -i -u $gituser <<EOF
  # The Ubuntu gitolite package is a bit out of date,
  # so install gitolite from source on github
  git clone --branch master git://github.com/sitaramc/gitolite

  # We'll install gitolite in local directories
  mkdir -p                    \
    /home/$gituser/bin                 \
    /home/$gituser/share/gitolite/conf \
    /home/$gituser/share/gitolite/hooks
  PATH=$PATH:/home/$gituser/bin

  # Install gitolite
  gitolite/install -ln /home/$gituser/bin
EOF

# Install init script and config
sudo cp /mnt/alestic-git-init $imagedir/usr/bin/alestic-git-init
sudo cp /mnt/alestic-git.conf $imagedir/etc/init/alestic-git.conf

# git version
git_version=$(sudo chroot $imagedir git --version)

# gitolite version and branch
gitolite_version=$(sudo chroot $imagedir bash -c \
  "cd /home/$gituser/gitolite; git describe --tags")
gitolite_branch=$(sudo chroot $imagedir bash -c \
  "cd /home/$gituser/gitolite; git branch | grep '*' | cut -f2 -d' '")

#### END alestic-git

# Clean up chroot environment
sudo chroot $imagedir umount /proc
#sudo chroot $imagedir umount /dev/pts
sudo rm -f $imagedir/usr/sbin/policy-rc.d
sudo rm -f $imagedir/etc/resolv.conf

export EC2_URL=http://ec2.$region.amazonaws.com

# Create and mount temporary EBS volume with file system to hold new AMI image
volumeid=$(ec2-create-volume --size $size --availability-zone $zone |
  cut -f2)
instanceid=$(wget -qO- http://instance-data/latest/meta-data/instance-id)
ec2-attach-volume --device /dev/sdi --instance "$instanceid" "$volumeid"
dev=/dev/xvdi
while [ ! -e $dev ]
  do sleep 3; done
#sudo mkfs.xfs -L cloudimg-rootfs $dev
sudo mkfs.ext4 -L cloudimg-rootfs $dev
ebsimagedir=$imagedir-ebs
sudo mkdir $ebsimagedir
sudo mount $dev $ebsimagedir

# Copy file system from temporary rootdir to EBS volume
sudo tar -cSf - -C $imagedir . | sudo tar xvf - -C $ebsimagedir
sudo umount $imagedir
sudo umount $ebsimagedir
ec2-detach-volume "$volumeid"
while ec2-describe-volumes "$volumeid" | grep -q ATTACHMENT
  do sleep 3; done
snapshotid=$(ec2-create-snapshot --description "$name" "$volumeid" | cut -f2)
while ec2-describe-snapshots "$snapshotid" | grep -q pending
  do sleep 30; done

# Register the snapshot as a new AMI
amiid=$(ec2-register                              \
  --name "$name"                                  \
  --description "$description"                    \
  --architecture "$arch"                          \
  --kernel "$akiid"                               \
  --block-device-mapping $ephemeraldev=ephemeral0 \
  --snapshot "$snapshotid" |
  cut -f2)

ec2-delete-volume "$volumeid"

cat <<EOF
AMI: $amiid $codename $region $arch2

ami id:       $amiid
aki id:       $akiid
region:       $region ($zone)
architecture: $arch ($arch2)
os:           Ubuntu $release $codename
name:         $name
description:  $description
EBS volume:   $volumeid (deleted)
EBS snapshot: $snapshotid
git:          $git_version
gitolite:     $gitolite_version ($gitolite_branch branch)

Test the new AMI using something like:

  export EC2_URL=http://ec2.$region.amazonaws.com
  ec2-run-instances \\
    --key \$USER \\
    --instance-type t1.micro \\
    $amiid

EOF
-->
  
</entry>
<entry [Sun 2012:07:29 23:08:25 EST] LAUNCH INSTANCE LINK>
    

https://console.aws.amazon.com/ec2/home?region=us-east-1#launchAmi=ami-82fa58eb



</entry>
<entry [Sun 2012:07:29 22:51:22 EST] CONVERT BETWEEN DIFFERENT KEY FORMATS>

https://www.sslshopper.com/ssl-converter.html

PEM Format

The PEM format is the most common format that Certificate Authorities issue certificates in. PEM certificates usually have extentions such as .pem, .crt, .cer, and .key. They are Base64 encoded ASCII files and contain "-----BEGIN CERTIFICATE-----" and "-----END CERTIFICATE-----" statements. Server certificates, intermediate certificates, and private keys can all be put into the PEM format.

Apache and other similar servers use PEM format certificates. Several PEM certificates, and even the private key, can be included in one file, one below the other, but most platforms, such as Apache, expect the certificates and private key to be in separate files.

DER Format
The DER format is simply a binary form of a certificate instead of the ASCII PEM format. It sometimes has a file extension of .der but it often has a file extension of .cer so the only way to tell the difference between a DER .cer file and a PEM .cer file is to open it in a text editor and look for the BEGIN/END statements. All types of certificates and private keys can be encoded in DER format. DER is typically used with Java platforms. The SSL Converter can only convert certificates to DER format. If you need to convert a private key to DER, please use the OpenSSL commands on this page.

PKCS#7/P7B Format
The PKCS#7 or P7B format is usually stored in Base64 ASCII format and has a file extention of .p7b or .p7c. P7B certificates contain "-----BEGIN PKCS7-----" and "-----END PKCS7-----" statements. A P7B file only contains certificates and chain certificates, not the private key. Several platforms support P7B files including Microsoft Windows and Java Tomcat.

PKCS#12/PFX Format
The PKCS#12 or PFX format is a binary format for storing the server certificate, any intermediate certificates, and the private key in one encryptable file. PFX files usually have extensions such as .pfx and .p12. PFX files are typically used on Windows machines to import and export certificates and private keys.

When converting a PFX file to PEM format, OpenSSL will put all the certificates and the private key into a single file. You will need to open the file in a text editor and copy each certificate and private key (including the BEGIN/END statments) to its own individual text file and save them as certificate.cer, CACert.cer, and privateKey.key respectively.

OpenSSL Commands to Convert SSL Certificates on Your Machine
It is highly recommended that you convert to and from .pfx files on your own machine using OpenSSL so you can keep the private key there. Use the following OpenSSL commands to convert SSL certificate to different formats on your own machine:

OpenSSL Convert PEM
Convert PEM to DER

openssl x509 -outform der -in certificate.pem -out certificate.der

Convert PEM to P7B

openssl crl2pkcs7 -nocrl -certfile certificate.cer -out certificate.p7b -certfile CACert.cer

Convert PEM to PFX

openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CACert.crt

OpenSSL Convert DER
Convert DER to PEM

openssl x509 -inform der -in certificate.cer -out certificate.pem

OpenSSL Convert P7B
Convert P7B to PEM

openssl pkcs7 -print_certs -in certificate.p7b -out certificate.cer

Convert P7B to PFX

openssl pkcs7 -print_certs -in certificate.p7b -out certificate.cer

openssl pkcs12 -export -in certificate.cer -inkey privateKey.key -out certificate.pfx -certfile CACert.cer

OpenSSL Convert PFX
Convert PFX to PEM

openssl pkcs12 -in certificate.pfx -out certificate.cer -nodes
    
</entry>
<entry [Sun 2012:07:29 21:15:00 EST] USE GODADDY SSL CERTIFICATE IN AWS LOADBALANCER>

How do I setup SSL certs on Amazon AWS Load Balancer using Godaddy certificates? -Public key and private cert don't match

up vote
22
down vote
favorite
27
I'm trying to install a GoDaddy SSL certificate on a new load balancer I'm setting up on Amazon AWS. I originally created the certificate at Godaddy using the keytool program for direct installation on a Glassfish 3.1 server (Amazon linux ami). I had no problems getting that setup directly on the server. I now need to move the certificate from the web server to the new load balancer. Amazon requires the private key and certs to be in PEM format, so I used the "rekey" tool at GoDaddy to create new certs. When I load those in the load balancer setup screen on AWS Mgmt Console, I get the error message: "Public Key Certificate and Private Key doesn't match."

Here is how I'm creating the keys:

$ openssl genrsa -des3 -out private.key 2048
$ openssl req -new -key private.key -out apps.mydomain.com.csr
I then submit the .csr file to GoDaddy during the "rekey" process. Once the rekey is complete, I download the 2 newly created certs (apps.mydomain.com.crt & gd_bundle.crt). I download them selecting (Apache) as the type of server (I've also tried "other" and "Cpanel" but the all look to be the same).

At this point, I remove the encryption from the private.key file by using the following command:

$ openssl rsa -in private.key -out private.pem
At this point, I go back into the AWS Mgmt console, create the load balancer, add the secure server redirect and put the contents of the following files in the respective fields on the screen where it asks to setup the ssl certificate:

private.pem --> Private Key
apps.mydomain.com.crt --> Public Key Certificate
gd_bundle.crt --> Certificate Chain
When I click the "continue button" I get the error "Error: Public Key Certificate and Private Key doesn't match."

-Is there a way that I can test that I'm getting a valid error message from Amazon? It seems odd to me that the keys wouldn't match when I'm following GoDaddy's instructions pretty closely.

I've tried creating the private.key file without RSA encryption prior to creating the .csr and that doesn't seem to make any difference.

I'm also assuming that the .crt files I'm downloading from GoDaddy are in .PEM format, but I'm not sure how to verify this.

Any ideas?

ssl amazon-ec2 openssl ssl-certificate godaddy
share|improve this question
asked Jul 19 '11 at 20:24


Looks like the issue was the way in which I was copying the contents of the key and certs into the AWS Management console. I was using an Ubuntu desktop running in Virtual Box on a Windows 7 desktop; copy and pasting the values from a gedit screen into the browser running on the Windows box. Once I opened the key and cert files on the same box as the web browser (Windows in this case) the certs went through just fine. I'm guessing some parts of the file aren't making it over correctly when using the shared clip board between Virtual Box client and host. Case closed.

    
</entry>
<entry [Sun 2012:07:29 21:09:57 EST] CHANGE SSL CERT IN LOADBALANCER>

Change / renew SSL certificate in LoadBalancer
How do you go about uploading the new SSL cert?

EDIT Nevermind...I found it. For those that havent: You need to use the `iam-servercertupload` command line program.


</entry>
<entry [Sun 2012:07:29 20:01:47 EST] CREATE RSA KEY FOR GITHUB AND CONVERT TO PEM TO USE ON EC2>

STRATEGY 1
----------

USER DOWNLOADS *.pem KEY AND CERT FROM AWS, USER UPLOADS TO AMAZON

AGUA CREATES RSA KEYPAIR TO START/STOP INSTANCES


AUTOMATICALLY GENERATE AWS CERT ON REMOTE, DISPLAY IN ADMIN 'Aws' PANEL SO THAT THE USER CAN COPY IT TO FILE LOCALLY IN ORDER TO MANUALLY START/STOP INSTANCES 


PROBLEM: SECURITY - HAVE TO PROVIDE KEYPAIR TO CLIENT 

SOLUTION:
    1. HTTPS SOLVES THIS MOSTLY
    2. SOCIAL ENGINEERING A PROBLEM BUT ANYONE WITH ACCESS TO SCREEN HAS ACCESS TO MACHINE


BUT WILL THE AWS-GENERATED KEYS WORK ON GITHUB -- NO. HAVE TO GENERATE AN RSA-FORMAT PUBLIC CERTIFICATE

THIS WORKED EARLIER BUT NOW ssh-keygen IS GIVING PROBLEMS, ASKING FOR PASSPHRASE AND THEN GIVING "Load failed"



STRATEGY 2
----------

USER DOWNLOADS FROM AWS, UPLOADS TO AGUA


1. GENERATE RSA PRIVATE KEY WITH EC2-API

ec2-create-keypair ec2

    KEYPAIR	ec2	78:fd:5a:f4:66:4c:70:31:a4:14:52:e7:62:d6:28:63:e2:d2:4f:03
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEA2pnOmxVjSCoi9hXahV5z/4XsFxpNEeGdHSnJI3ytsj1s77PeQfBN//WkV+Th
    awdqn5A4yRUJiZQjZSrk6GSlgKP6TrY1WxoxUcTycUn9D4Ar2sgYt6yLbXQOIZWioqMHYMxvVO2V
    mvHuogwvkaHuTea9KEyBFNH4TL08QzQb4RnHK1Cc07rTlKTp/rlp7GKZ+s19PnNk6MYT6LLNgkVo
    yeF0hOrmUECaeolkrUHQJMFqz2GUoPbfO7xtu2WX4oCzhDqjJ6x/gAeNVou0KPVJiWoKTlsija1P
    6Mf97EetPR3i2i8Sjb4y7ozIeVsx2sxRRtG7fe8r3mAWZ6FZVvFFzQIDAQABAoIBAQCOK6AabrOO
    WJE6WQYw3Tg2BGSCtgFP0tr6/5UoNktFc/uofePcIKyp/plu7JXKpR0sP4EfDkaQqr7GajpMBkE5
    Q+xkSs6yvHs9Agjns0YZUbOz65Vfx6E6g1M5dnc6rSr8QplZs9cr2ZLo42IApj81fQ6i6fa9kr2Z
    My3BS1+iaoxobcFmz8pGaeHLM13PjTzf7o9ApsgV1T0aIbvg2rU3axELVfh+M/3jFl7Dfdhry7Re
    j4n+EpCqnjk73WEnv61V2bem7/lhdZW3gGM66b+DMYKEY7s6NrBCqIMBKZLq5uspHMEqAuWdMbzy
    C/VY1+AOBkOyXj1kx5v9+ytlb1tBAoGBAPkAWuEzgMERkofVa83bKeyCztcPZm5LtUqYc6i3eIt1
    aCDojqVzQ6AygPo7p+axpILofySlYZxTqPRa+fy5Om6Qogy2XvzsfzKMohH3oup0hCTrNwolM4TW
    N5EV27BvHRxNzMWXirIY01RC8M64ppJOLaJ7e0wJ+awr61fBi7E9AoGBAOC+tcrgyrGdFV+N3n7w
    HX9K3jDaOcI+BC+VewHF13cJ3SbpHmvOX1DV4m8Oq5m8/N46+68Xd1u6lg+Hn/GL/5/hpjyTHp/J
    n8uq8DS197fULPfw3EzXk/WNSgRhcVCCb0a7O4FZRzlD22ZdGgvxfw7Y/JgMPK3k+6as8aIIvw/R
    AoGAWhOCzMzw2uccdv8BzKpn9CMt6CauC2Bf6OhVjscwWGLUlHMMh1W3NRCQD/Xcu1uwA5tPw1YA
    hajOCfePT5lCRhUUSjz/B8gWC5dMWeuXh/E2jJR6iLUEeh10ZIvfuWe4xDBwz1oO1nacnHLK4j1y
    JKMbZxf8dnl1VI9ex5RAkJECgYEAhzPzpYMqLUO00fFFAtRsymE93eHKkYJBfmbMwzpD7wbuFjRz
    6qMSUEz7lZgbv7cj4IVXV/QkB/jtwZXzsJpqQ8K6AQL4j2P6T8ocC3nU9rAcBWTPAyNFjZlcB9qf
    ErIFQ2Xr3FrbMCYUXTZxLvIvX71F6CqkbnCsu46bJsFgP6ECgYAszR7+SA8SruThp4CtknSNkfXE
    BX9ebgec2PI6+Iv8SP4pmZ1kxbWGLwSJwVsgTwRNhF0NuD7NU64LDMHsGYKbhTily7xs3vj/1G3e
    QfZSnyk0eS7zbeOHociKMt/oSJZMRbs99vImylvYj/JVKgmKeRbFdUj9RwYKaX+pACa+Hg==
    -----END RSA PRIVATE KEY-----


2. PRINT PRIVATE KEY TO FILE

em /tmp/ec2/id_rsa-ec2-keypair
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEA2pnOmxVjSCoi9hXahV5z/4XsFxpNEeGdHSnJI3ytsj1s77PeQfBN//WkV+Th
    awdqn5A4yRUJiZQjZSrk6GSlgKP6TrY1WxoxUcTycUn9D4Ar2sgYt6yLbXQOIZWioqMHYMxvVO2V
    mvHuogwvkaHuTea9KEyBFNH4TL08QzQb4RnHK1Cc07rTlKTp/rlp7GKZ+s19PnNk6MYT6LLNgkVo
    yeF0hOrmUECaeolkrUHQJMFqz2GUoPbfO7xtu2WX4oCzhDqjJ6x/gAeNVou0KPVJiWoKTlsija1P
    6Mf97EetPR3i2i8Sjb4y7ozIeVsx2sxRRtG7fe8r3mAWZ6FZVvFFzQIDAQABAoIBAQCOK6AabrOO
    WJE6WQYw3Tg2BGSCtgFP0tr6/5UoNktFc/uofePcIKyp/plu7JXKpR0sP4EfDkaQqr7GajpMBkE5
    Q+xkSs6yvHs9Agjns0YZUbOz65Vfx6E6g1M5dnc6rSr8QplZs9cr2ZLo42IApj81fQ6i6fa9kr2Z
    My3BS1+iaoxobcFmz8pGaeHLM13PjTzf7o9ApsgV1T0aIbvg2rU3axELVfh+M/3jFl7Dfdhry7Re
    j4n+EpCqnjk73WEnv61V2bem7/lhdZW3gGM66b+DMYKEY7s6NrBCqIMBKZLq5uspHMEqAuWdMbzy
    C/VY1+AOBkOyXj1kx5v9+ytlb1tBAoGBAPkAWuEzgMERkofVa83bKeyCztcPZm5LtUqYc6i3eIt1
    aCDojqVzQ6AygPo7p+axpILofySlYZxTqPRa+fy5Om6Qogy2XvzsfzKMohH3oup0hCTrNwolM4TW
    N5EV27BvHRxNzMWXirIY01RC8M64ppJOLaJ7e0wJ+awr61fBi7E9AoGBAOC+tcrgyrGdFV+N3n7w
    HX9K3jDaOcI+BC+VewHF13cJ3SbpHmvOX1DV4m8Oq5m8/N46+68Xd1u6lg+Hn/GL/5/hpjyTHp/J
    n8uq8DS197fULPfw3EzXk/WNSgRhcVCCb0a7O4FZRzlD22ZdGgvxfw7Y/JgMPK3k+6as8aIIvw/R
    AoGAWhOCzMzw2uccdv8BzKpn9CMt6CauC2Bf6OhVjscwWGLUlHMMh1W3NRCQD/Xcu1uwA5tPw1YA
    hajOCfePT5lCRhUUSjz/B8gWC5dMWeuXh/E2jJR6iLUEeh10ZIvfuWe4xDBwz1oO1nacnHLK4j1y
    JKMbZxf8dnl1VI9ex5RAkJECgYEAhzPzpYMqLUO00fFFAtRsymE93eHKkYJBfmbMwzpD7wbuFjRz
    6qMSUEz7lZgbv7cj4IVXV/QkB/jtwZXzsJpqQ8K6AQL4j2P6T8ocC3nU9rAcBWTPAyNFjZlcB9qf
    ErIFQ2Xr3FrbMCYUXTZxLvIvX71F6CqkbnCsu46bJsFgP6ECgYAszR7+SA8SruThp4CtknSNkfXE
    BX9ebgec2PI6+Iv8SP4pmZ1kxbWGLwSJwVsgTwRNhF0NuD7NU64LDMHsGYKbhTily7xs3vj/1G3e
    QfZSnyk0eS7zbeOHociKMt/oSJZMRbs99vImylvYj/JVKgmKeRbFdUj9RwYKaX+pACa+Hg==
    -----END RSA PRIVATE KEY-----


chmod 400 id_rsa-ec2-keypair ; ls -l id_rsa-ec2-keypair  


NB: CAN'T USE THIS TO RUN EC2-API

export EC2_PRIVATE_KEY=/tmp/ec2/id_rsa-ec2-keypair
ec2din $head

    Client.MalformedSOAPSignature: Invalid SOAP Signature. Failed to check signature with X.509 cert



3. 
    



Convert OpenSSH RSA or DSA key to PEM format

1. CREATE RSA KEY USING OPENSSH'S ssh-keygen:

ssh-keygen -t rsa -P "" -f id_rsa


2. ADD id_rsa.pub TO GITHUB AS 'ssh-keygen'
    OK


3. CONVERT id_rsa TO PEM FORMAT

openssl rsa -in id_rsa -outform pem > id_rsa.pem
    Writing RSA Key
    OK
   
6. CREATE id_rsa.pem.pub

ssh-keygen -e -f id_rsa.pem >> id_rsa.pem.pub
    
 
4. IMPORT KEYPAIR INTO EC2

ec2-import-keypair --public-key-file id_rsa.pem.pub ssh-keygen
    KEYPAIR	ssh-keygen	0f:de:e6:43:2e:87:b6:e0:b9:71:6e:18:c4:f5:8e:de
    KEYPAIR	ssh-keygen	0f:de:e6:43:2e:87:b6:e0:b9:71:6e:18:c4:f5:8e:de
    OK


5. CONFIRM KEYPAIR IS REGISTERED IN AWS CONSOLE

AWS console --> EC2 --> Key Pairs (LEFT NAV BAR)
    OK


6. CONNECT TO EC2 USING id_rsa.pem AND id_rsa.pub    

export EC2_PRIVATE_KEY=/tmp/rsa2pem/id_rsa.pem
export EC2_CERT=/tmp/rsa2pem/id_rsa.pem.pub

ec2din $head
    FAILS WITH
	java.security.cert.CertificateException: Could not parse certificate: java.io.IOException: Empty input

    
    
    
    

NOTES
-----


USE openssl TO GENERATE RSA PRIVATE KEY
---------------------------------------
openssl genrsa -des3 -out private.key 2048

Remove the encryption from the private.key file by using the following command:

openssl rsa -in private.key -out private.pem




DSA to PEM
----------
First create an DSA key using OpenSSH tools:

ssh-keygen -t dsa

Then convert it to PEM format:

openssl dsa -in ~/.ssh/id_dsa -outform pem > id_dsa.pem


COMMENT:

openssl dsa -in ~/.ssh/id_dsa -outform pem > id_dsa.pem
diff id_dsa id_dsa.pem

The files are identical?

    
</entry>
<entry [Sun 2012:07:29 18:27:42 EST] AMAZON ACCESS KEYS>

http://docs.amazonwebservices.com/AWSSecurityCredentials/1.0/AboutAWSCredentials.html
    
</entry>
<entry [Sun 2012:07:29 14:21:20 EST] GENERATE PUBLIC CERT FROM PRIVATE KEY WITHOUT PASSWORD PROMPT>

http://docs.amazonwebservices.com/AWSSecurityCredentials/1.0/AboutAWSCredentials.html

PRIVATE KEY DOWNLOADED FROM AMAZON IS IN UNENCRYPTED *.pem FORMAT

I.E., *** IT HAS NO PASSPHRASE ***



****** DOES NOT WORK *****
USE openssl TO CONVERT *.pem TO id_rsa 

mkdir /tmp/temp3
cd /tmp/temp3
sudo cp /agua/conf/.ec2/admin/private.pem .

# PERMISSIONS
chmod 600 id_rsa

# CONVERT *.pem KEY TO GITHUB FORMAT

openssl rsa -in private.pem -inform PEM -out id_rsa -outform DER

    unable to load Private Key
    139660984854176:error:0906D064:PEM routines:PEM_read_bio:bad base64 decode:pem_lib.c:811:






mkdir /tmp/temp
cd /tmp/temp
sudo cp /agua/conf/.ec2/admin/private.pem id_rsa

# PERMISSIONS
chmod 600 id_rsa

# CONVERT *.pem KEY TO GITHUB FORMAT

openssl x509 -in private.pem -inform PEM –out id_rsa -outform DER

#ssh-keygen -p -f amazon-ec2-key.pem
# REMOVE PASSWORD
ssh-keygen -p -f id_rsa -P ""
    Bad passphrase.

    
    

cp ~/.ssh/TTS.pem ~/.ssh/id_ssl

CREATE PUBLIC CERT 

#ssh-keygen -y -f ~/.ssh/id_ssl > ~/.ssh/id_rsa.pub
ssh-keygen -y -f id_ssl > id_rsa.pub




NB: DOING JUST CREATE PUBLIC CERT WITHOUT FIRST CONVERTING KEY TO OPENSSH FORMAT GIVES THIS ERROR:

ssh-keygen -y -f id_rsa > id_rsa.pub -P "" -vvvv
    debug3: Incorrect RSA1 identifier
    debug1: key_parse_private_pem: PEM_read_PrivateKey failed
    debug1: read PEM private key done: type < unknown>
    debug3: Incorrect RSA1 identifier
    debug1: key_parse_private_pem: PEM_read_PrivateKey failed
    debug1: read PEM private key done: type < unknown>
    load failed



Create Public Key: Now use ssh-keygen again to extract the public portion of the Amazon EC2 Key file as shown below. This will create a .pub file and when using this public key then SecureCRT will not only require the .pub file but also the private key file or .pem file.

ssh-keygen -e -f amazon-ec2-key.pem >> amazon-ec2-key.pem.pub




NOTES
-----

CONVERT AMAZON *.pem KEY TO RSA KEY
-----------------------------------

http://www.question-defense.com/2009/10/01/convert-amazon-web-services-private-rsa-key-for-use-with-securecrt

Convert Amazon Web Services Private RSA Key For Use With SecureCRT
Posted by alex in Insights at 1:01 AM

When I first was working with an Amazon Web Services instance at EC2 I was getting frustrated trying to use SecureCRT to connect to the AWS instance. When you configure an instance you are required to configure an Amazon EC2 key pair which will allow you to connect to your instances via SSH.  The problem is once you receive the key pair via download it will not work with SecureCRT so you need to convert it to a public key to work. I did a lot of searching and didn’t find much but the below worked for me.


Convert Amazon Web Services Key Pair for Use With SecureCRT:

**NOTE: You will either need to do the below on a Linux machine or have cygwin installed on your Windows computer.

Create Amazon EC2 Key Pair: First via the AWS Management Console you need to create a key pair. Once logged into the AWS Console click on Key Pairs at the bottom of the left side navigation. Click the Create Key Pair button located at the top left of the center column. You will be required to provide a name for the Key Pair and then click the Create button. Once you do this the Amazon EC2 Key will automatically download. Make sure to save it to a location that you will remember.

Modify Key File Permissions: If you do not have cygwin installed on Windows then transfer the Key file to a Linux computer to complete the below tasks. Issue the below command to modify the Amazon EC2 Key file. In our example below we will be using amazon-ec2-key.pem as the example file.

chmod og-r amazon-ec2-key.pem


Rewrite Key In OpenSSH Format: Now issue the below command to reqrite the Amazon EC2 Key .pem file into OpenSSH format. You can leave the passphrase empty as the Amazon EC2 Key Pair generator does. To do this just click enter when asked for the passphrase and again when asked to verify the passphrase.

ssh-keygen -p -f amazon-ec2-key.pem


Create Public Key: Now use ssh-keygen again to extract the public portion of the Amazon EC2 Key file as shown below. This will create a .pub file and when using this public key then SecureCRT will not only require the .pub file but also the private key file or .pem file.

ssh-keygen -e -f amazon-ec2-key.pem >> amazon-ec2-key.pem.pub


Point SecureCRT To Public Key: Now set SecureCRT to use the .pub file you have created.

In SecureCRT click on Options in the top navigation menu and select Global Options from the drop down menu. Once the Global Options configuration menu opens click on SSH2 in the left navigation. At the top of this configuration window you will see Public Key so make sure that the “Use identity or certificate file” radio button is selected and then use the right button to navigate to the .pub file you created earlier.
Use SecureCRT Public Key: When you attempt to connect to the instance it will probably try to use a username and password first so you will need to modify the session options. This can be done by click Options in the top navigation and selecting Session Options from the drop down. Highlight SSH2 in the left navigation and then in the Authentication window move PublicKey to the top using the arrows.

Connect to AWS EC2 Using SecureCRT: Now try to connect again using the SecureCRT session you have created and you should connect directly to your Amazon Web Services instance without issue.

There may be other ways to do this but initially this caused me a lot of problems and when I figured out how to do this I was relieved to be able to use SecureCRT to connect to Amazon Web Services at EC2.	

AMAZON PRIVATE KEY AND PUBLIC CERT
----------------------------------

http://docs.amazonwebservices.com/AWSSecurityCredentials/1.0/AboutAWSCredentials.html

X.509 Certificates

X.509 certificates are based on the idea of public key cryptography. We recommend you take a few minutes to familiarize yourself with it to help you understand how AWS uses your X.509 certificates to secure your requests. For more information about public key cryptography, go to http://en.wikipedia.org/wiki/Public_Key_Cryptography.

Purpose	Making requests to AWS product SOAP APIs (except for Amazon S3 and Amazon Mechanical Turk, which use access keys for their SOAP APIs).

They're also used for some specific Amazon EC2 tasks (see Using Credentials with Amazon EC2).

Getting Them	

You can have AWS generate the certificate and private key files for you, or you can provide your own certificate file. In both cases, you need to go to the X.509 Certificates tab on the AWS Security Credentials page.
Replacing Them	For security purposes, we recommend you change your X.509 certificates every 90 days. For more information, see Access Credential Rotation.
Parts & Usage	Your X.509 certificates consist of a certificate file and a private key file:
X.509 Certificate—The certificate holds the public key and related metadata. You include it in each service request, so it's not a secret.

Private Key—Each certificate has a private key associated with it. Use the private key to calculate the digital signature to include in the request. Your private key is a secret, and only you should have it. AWS doesn't keep a copy of it. Don't e-mail it to anyone, include it any AWS requests, or post it on the AWS Discussion Forums. No authorized person from AWS will ever ask for your private key.

When you create a request, you create a digital signature with your private key and include it in the request, along with your certificate. When we get the request, we use the public key in the certificate to decrypt the signature and confirm that you're the request sender. We also verify the certificate you provide matches the one we have on file.

If you have us generate your X.509 certificates, we give you a PEM-encoded certificate file, and a PEM-encoded private key (unencrypted, which means you don't get a password for it). You'll need to convert the files to whatever format your toolkit uses (see the toolkit's documentation for help). Even though we provide you the private key, we don't store it anywhere. If you lose it, you must switch to using a different X.509 certificate.

If you provide your own keys, you must upload only your certificate to AWS (you keep the private key). The certificate must be in PEM format. AWS accepts any syntactically and cryptographically valid, unexpired X.509 certificates. They don't need to be from a formal Certificate Authority (CA).
 
 
USING ssh-keygen
----------------
 

http://linux.about.com/library/cmd/blcmdl1_ssh-keygen.htm

ssh-keygen - authentication key generation, management and conversion  
SYNOPSIS

ssh-keygen [-q ] [-b bits ] -t type [-N new_passphrase ] [-C comment ] [-f output_keyfile ] 
ssh-keygen -p [-P old_passphrase ] [-N new_passphrase ] [-f keyfile ] 
ssh-keygen -i [-f input_keyfile ] 
ssh-keygen -e [-f input_keyfile ] 
ssh-keygen -y [-f input_keyfile ] 
ssh-keygen -c [-P passphrase ] [-C comment ] [-f keyfile ] 
ssh-keygen -l [-f input_keyfile ] 
ssh-keygen -B [-f input_keyfile ] 
ssh-keygen -D reader 
ssh-keygen -U reader [-f input_keyfile ]  

DESCRIPTION

ssh-keygen generates, manages and converts authentication keys for ssh(1). ssh-keygen can create RSA keys for use by SSH protocol version 1 and RSA or DSA keys for use by SSH protocol version 2. The type of key to be generated is specified with the -t option.
Normally each user wishing to use SSH with RSA or DSA authentication runs this once to create the authentication key in $HOME/.ssh/identity $HOME/.ssh/id_dsa or $HOME/.ssh/id_rsa Additionally, the system administrator may use this to generate host keys, as seen in /etc/rc

Normally this program generates the key and asks for a file in which to store the private key. The public key is stored in a file with the same name but ``.pub'' appended. The program also asks for a passphrase. The passphrase may be empty to indicate no passphrase (host keys must have an empty passphrase), or it may be a string of arbitrary length. A passphrase is similar to a password, except it can be a phrase with a series of words, punctuation, numbers, whitespace, or any string of characters you want. Good passphrases are 10-30 characters long, are not simple sentences or otherwise easily guessable (English prose has only 1-2 bits of entropy per character, and provides very bad passphrases), and contain a mix of upper and lowercase letters, numbers, and non-alphanumeric characters. The passphrase can be changed later by using the -p option.

There is no way to recover a lost passphrase. If the passphrase is lost or forgotten, a new key must be generated and copied to the corresponding public key to other machines.

For RSA1 keys, there is also a comment field in the key file that is only for convenience to the user to help identify the key. The comment can tell what the key is for, or whatever is useful. The comment is initialized to ``user@host'' when the key is created, but can be changed using the -c option.

After a key is generated, instructions below detail where the keys should be placed to be activated.

The options are as follows:

-b bits
Specifies the number of bits in the key to create. Minimum is 512 bits. Generally 1024 bits is considered sufficient, and key sizes above that no longer improve security but make things slower. The default is 1024 bits.

-c
Requests changing the comment in the private and public key files. This operation is only supported for RSA1 keys. The program will prompt for the file containing the private keys, for the passphrase if the key has one, and for the new comment.

-e
This option will read a private or public OpenSSH key file and print the key in a `SECSH Public Key File Format' to stdout. This option allows exporting keys for use by several commercial SSH implementations.

-f filename
Specifies the filename of the key file.

-i
This option will read an unencrypted private (or public) key file in SSH2-compatible format and print an OpenSSH compatible private (or public) key to stdout. ssh-keygen also reads the `SECSH Public Key File Format' This option allows importing keys from several commercial SSH implementations.

-l
Show fingerprint of specified public key file. Private RSA1 keys are also supported. For RSA and DSA keys ssh-keygen tries to find the matching public key file and prints its fingerprint.

-p
Requests changing the passphrase of a private key file instead of creating a new private key. The program will prompt for the file containing the private key, for the old passphrase, and twice for the new passphrase.

-q
Silence ssh-keygen Used by /etc/rc when creating a new key.

-y
This option will read a private OpenSSH format file and print an OpenSSH public key to stdout.

-t type
Specifies the type of the key to create. The possible values are ``rsa1'' for protocol version 1 and ``rsa'' or ``dsa'' for protocol version 2.

-B
Show the bubblebabble digest of specified private or public key file.

-C comment
Provides the new comment.

-D reader
Download the RSA public key stored in the smartcard in reader

-N new_passphrase
Provides the new passphrase.

-P passphrase
Provides the (old) passphrase.

-U reader
Upload an existing RSA private key into the smartcard in reader
    
</entry>

<entry [Tue 2012:07:24 03:25:39 EST] USING SPOT INSTANCES FOR SCIENTIFIC COMPUTING>

http://aws.amazon.com/ec2/spot-and-science/

    
</entry>
<entry [Mon 2012:07:23 02:50:56 EST] TRIED Net::Amazon::EC2>

sub runInstance {
#### LAUNCH AN INSTANCE
	my $self		=	shift;
	my $accesskeyid		=	shift;	
	my $awssecretaccesskey	=	shift;	
	
	
	my $ec2 = Net::Amazon::EC2->new(
		AWSAccessKeyId	=>	$accesskeyid, 
		SecretAccessKey	=>	$awssecretaccesskey
	);
	
	
	# Start 1 new instance from AMI: ami-XXXXXXXX
	my $instance = $ec2->runInstances(
		InstanceType => 'm1.large',
		ImageId => 'ami-0a59bb63',
		MinCount => 1,
		MaxCount => 1
	);
	
	#### 32-bit
	#ImageId => 'ami-0859bb61',
	
	$self->logDebug("instance", $instance);
	
	
	my $running_instances = $ec2->describe_instances;
	
	foreach my $reservation (@$running_instances) {
	   foreach my $instance ($reservation->instances_set) {
		   $self->logDebug("instance->instance_id: ". $instance->instance_id);
	   }
	}
	
	my $instance_id = $instance->instances_set->[0]->instance_id;
	$self->logDebug("instance_id", $instance_id);

	return $instance_id;
}	


sub terminateInstance {
	my $accesskeyid		=	shift;	
	my $awssecretaccesskey	=	shift;	
	
	my $ec2 = Net::Amazon::EC2->new(
		AWSAccessKeyId => $accesskeyid, 
		SecretAccessKey => $awssecretaccesskey
	);
	
	##### Terminate instance
	#my $result = $ec2->terminateInstances(InstanceId => $instance_id);

	#return $result;
}

    
</entry>
<entry [Mon 2012:07:16 00:01:21 EST] NOTE: CANNOT RUN EC2 WITH id_rsa.pub GENERATED FROM private.pem>


1. CREATE id_rsa.pub FROM private.pem

cd /agua/conf/admin/.keypairs/

ssh-keygen -y -f private.pem > id_rsa.pub


2. TEST EC2

ll
    -rw-rw-r-- 1 syoung syoung  213 Jul 16 00:03 id_rsa.pub
    -rw------- 1 syoung syoung  913 Jul 15 20:24 private.pem
    -rw-rw-r-- 1 syoung syoung  915 Jul 15 20:24 public.pem

WORKS WITH public.pem

ec2din -K private.pem -C public.pem 
RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f			stopped	aquarius2	0		t1.micro	2012-07-06T03:07:19+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2012-07-09T13:10:48.000Z	
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2012-07-09T13:10:48.000Z	
BLOCKDEVICE	/dev/sdk	vol-53155839	2012-07-09T13:10:48.000Z	
BLOCKDEVICE	/dev/sdl	vol-5bffe631	2012-07-09T13:10:48.000Z	
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)

BUT FAILS WITH id_rsa.pub

ec2din -K private.pem -C id_rsa.pub

    Unexpected error:
    org.codehaus.xfire.fault.XFireFault: General security error; nested exception is: 
        java.security.cert.CertificateParsingException: invalid DER-encoded certificate data
        at org.codehaus.xfire.fault.XFireFault.createFault(XFireFault.java:89)
        at org.codehaus.xfire.client.Invocation.invoke(Invocation.java:83)


    
</entry>
<entry [Sun 2012:07:15 23:07:36 EST] USE EC2 private.pem FILE TO DO GITHUB PUSH/CLONE>

TEST PUSH REPO COMMIT TO aguadev/test WITH id_ssl (COPY OF private.pem)

1. COPY id_ssl TO TEMP DIR

mkdir /tmp/temp
cd /tmp/temp
cp /home/syoung/.ssh/id_ssl .


2. CREATE git-ssh.sh FILE 

emacs -nw /root/.ssh/git-ssh.sh

    #!/bin/sh
    
    exec ssh -i /tmp/temp/id_ssl -o "StrictHostKeyChecking no" "$@"
    exit 0

chmod 755 /root/.ssh/git-ssh.sh


3. EXPORT 'GIT_SSH'

export GIT_SSH=/root/.ssh/git-ssh.sh


4. SET REMOTE

git remote add github git@github.com:aguadev/test


5. DO PUSH

git push -u github master

    Counting objects: 5, done.
    Delta compression using up to 2 threads.
    Compressing objects: 100% (4/4), done.
    Writing objects: 100% (5/5), 1.89 KiB, done.
    Total 5 (delta 0), reused 0 (delta 0)
    To git@github.com:aguadev/test
     * [new branch]      master -> master
    Branch master set up to track remote branch master from github.



6. DO CLONE

mkdir /tmp/temp2
cd /tmp/temp2
git clone git@github.com:aguadev/test
    OK
    
ll test
    drwxr-xr-x 8 root root 4096 Jul 15 22:59 .git/
    -rw-r--r-- 1 root root 1675 Jul 15 22:59 id_rsa
    -rw-r--r-- 1 root root  411 Jul 15 22:59 id_rsa.pub
    -rw-r--r-- 1 root root    0 Jul 15 22:59 TEST
    -rw-r--r-- 1 root root    0 Jul 15 22:59 TEST2
    -rw-r--r-- 1 root root    0 Jul 15 22:59 TEST3


    
</entry>
<entry [Sun 2012:07:15 21:16:42 EST] GENERATE id_rsa.pub FOR GITHUB FROM EC2 *.pem>


1. RENAME EXISTING id_rsa.pub

mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub.orig


2. COPY PRIVATE *.pem FILE TO id_ssl FILE

cp /home/syoung/notes/backup/agua/admin/.keypairs/private.pem ~/.ssh/id_ssl
chmod 600 ~/.ssh/id_ssl


3. GENERATE NEW id_rsa.pub FROM COPIED *.pem FILE

# CERT IS BAD - CAN'T USE ec2-api EVEN AFTER IMPORTING KEYPAIR BASED ON CERT AND *.pem KEY
#ssh-keygen -y -f ~/.ssh/id_ssl > ~/.ssh/id_rsa.pub

openssl req -new -x509 -key id_rsa.pem -out id_rsa.pem.X509.pub -days 3650

ALSO WORKS WITH     private.pem

cp /home/syoung/notes/backup/agua/admin/.keypairs/private.pem ~/.ssh/private.pem
chmod 600 ~/.ssh/private.pem
ssh-keygen -y -f ~/.ssh/private.pem > ~/.ssh/id_rsa.pub-private.pem
    OK
    
IDENTICAL PUBLIC CERT FILE PRODUCED:

diff id_rsa.pub id_rsa.pub-private.pem 
syoung@syoung-Satellite-C675D:~/.ssh$ head id_rsa.pub id_rsa.pub-private.pem 
==> id_rsa.pub <==
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCZ+6PKDlGlIE8CONGqEV65risoWVlmSXlnC4Z2HJrIAtheH/cx0vVKUXnFodkK6y11ZrvsXbsNXaH1sVAE/6f+dZRjleYcq3bbDKBw0DVSLwujNhEw/rc+Word5OmewNWlq1fOpu8rVOeZo+wZ4o17aTLyNJ17OfVVXoOHAcP0BQ==

==> id_rsa.pub-private.pem <==
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCZ+6PKDlGlIE8CONGqEV65risoWVlmSXlnC4Z2HJrIAtheH/cx0vVKUXnFodkK6y11ZrvsXbsNXaH1sVAE/6f+dZRjleYcq3bbDKBw0DVSLwujNhEw/rc+Word5OmewNWlq1fOpu8rVOeZo+wZ4o17aTLyNJ17OfVVXoOHAcP0BQ==



4. PASTE INTO GITHUB AS DEPLOY KEY IN aguadev/test REPO ADMIN PAGE:

https://github.com/aguadev/test -->  Admin --> Deploy Keys --> Add Deploy Key

    FROM *.pem (74:4d:d4:a9:f3:bd:58:ce:11:a3:0b:92:e9:ce:35:7e)


5. ACCESS REPO USING PRIVATE KEY (COPIED FROM *.pem)

ssh -T -i ~/.ssh/id_ssl git@github.com:aguadev/test

    Agent admitted failure to sign using the key.
    Hi aguadev/test! You've successfully authenticated, but GitHub does not provide shell access.

    
6. RETRY ACCESS AFTER ADDING TO SSH AGENT WITH ssh-add:

ssh-add ~/.ssh/id_ssl
    Identity added: /home/syoung/.ssh/id_ssl (/home/syoung/.ssh/id_ssl)

NOW WORKS WITHOUT 'Agent admitted failure' MESSAGE:

ssh -T -i ~/.ssh/id_ssl git@github.com:aguadev/test
    Hi aguadev/test! You've successfully authenticated, but GitHub does not provide shell access.



</entry>
<entry [Sun 2012:07:15 20:38:03 EST] USE ssh-keygen TO GENERATE 'ssh-rsa' KEY THAT GITHUB ACCEPTS>

1. GENERATED id_rsa AND id_rsa.pub

mkdir -p /tmp/temp
cd /tmp/temp
ssh-keygen -t rsa -f id_rsa -q -N ''

cat id_rsa.pub

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCd3NBTMtP9KKF5EUo1+9KdivipbeVIECna69IO0Jjh46suiC27Ytuei553LlHOfCxrdoi82CZbofePIZhvG7uq9X6ZNJoYmpoGRhabz480h4F2/b9c3Mkxp4TgqF6PplpesgigdkVfu7dNtJpZ9/Dehr8d/4wgqMaBIwFRK6srx18tuBmJlZ0J+xUmZLcrYRXuknQ+xCs+53yqHpGdmmDhtsfjSUt+BP8iBRDdzpM+MJqywsYnNIZphw7kVL0ZmdXRL8qn6p8ERdLGSTqCyXrN8sRFjAqrR9Kfe/o25Vl1W1Hux57QvntR8ZeRLamvPl4QKkiVT7qL1NWkkA4T9Mwd syoung@syoung-Satellite-C675D


cat id_rsa

-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAndzQUzLT/SiheRFKNfvSnYr4qW3lSBAp2uvSDtCY4eOrLogt
u2Lbnouedy5Rznwsa3aIvNgmW6H3jyGYbxu7qvV+mTSaGJqaBkYWm8+PNIeBdv2/
XNzJMaeE4Khej6ZaXrIIoHZFX7u3TbSaWffw3oa/Hf+MIKjGgSMBUSurK8dfLbgZ
iZWdCfsVJmS3K2EV7pJ0PsQrPud8qh6RnZpg4bbH40lLfgT/IgUQ3c6TPjCassLG
JzSGaYcO5FS9GZnV0S/Kp+qfBEXSxkk6gsl6zfLERYwKq0fSn3v6NuVZdVtR7see
0L57UfGXkS2prz5eECpIlU+6i9TVpJAOE/TMHQIDAQABAoIBABgWaXNIfjBS0tC2
Yqx6EFkZq3eu3R1x2fEdqp+4FJvjMWuYO+Ir43b9tuBYoQLwz5ZWL+cg1DmHLU8Z
wTiy8p/Tdc3KyPiYHoh2iVyc/yz0wDx324s/5TM+bHgbONKSf5eTct2JLmy9J+sj
c6nmu0o5JVBeffM9zYxG2xyXnTbAp9RHH7h9nq7Yw2CFxLLdLv+t5PN1KXil6oYT
+qcmLtMKiyjj5tjlyMu63qRQ9p7EQ7GE0bga3c1+3k4WwU7i+LokhrNsvPTm2fvF
+mdnJbGlVYs0Gb1hNh4NwGYZSG0oxblBwcY+bRS6hxZoIWttj8SW2zzN7sOE9yAM
6m1xfAECgYEAz109B4FJjM6g9dQFqZer1+X1vnh6OWQBw/aIeq/Kb/2oRF808kJe
Iyyaetm78PwZJi1zqGywbtY9L2Tk78LSzxWgOdv0ffi1iYWy9kgB+VzmGEK1his/
RJlFBp3fItlf8YNak512Qfc1LkWtB25pNxYLkGUXoTTgAhISPXb8qA0CgYEAwuNZ
YYEyfAwOsvMcJ5IFeephm+9mSSfq9xAxuAbGxuAhZsGLI6hIMsFNpgLapfOUUfde
mRjPt4PPGb0oIzXmXt7bUeykMwaNCbJ07kfYyHylRMcy9evjMRBbCTU+XcQXkLNS
9OCJrMfnhsMgLW0YcxuJoSgztPNT/aHz68qKIFECgYA869GgQNWQ7qvPTSkUuCCe
X0shWFfgQIdcQTO7h6Xb3RPwcmAlxGXPw6zm5s0WcZoZ40SVeMkk5wA2yleQMRaq
DFp0ZTChSc5bxtHbFTCvSCG5gu+9qTr/NmBXH06M+Hv9gm+76ojxvGT9YS8Cfeef
bXScSXb1v4kIUrLVJ/32iQKBgHhUBwu8yX7tsuWqVOfZsKflnv64gV8J1nlU9l25
UWHZYMYhGdeaP3mXAGpPuNBd5GX3ZeEBAL8+EtDBidazoNlSn/elNHyMvugN10SH
98FRtHkSxNQyIMRaZNr6lNcwC5y8G6w2NssHYlxCfcuOYFox1ng6ajJ/Sox/QiuD
kmUBAoGAN6ateoU5/lfCoarSsOuiLo4PgtVhV0mjSLA2H3/E7I4IbFa6nhC+3ckn
zdvyBHmP7IlsGgIBp36jZrmFMCoOovxJQewJ4jRab5s/Mb0HgpxbOI/etXyOdf/x
OUiG2rjQJeYAaxHyiguvQ7i+ysOlmQBHppSsK5dQlGPRka4yXxs=
-----END RSA PRIVATE KEY-----



2. PASTED INTO GITHUB AS DEPLOY KEY IN aguadev/test REPO ADMIN PAGE:

https://github.com/aguadev/test -->  Admin --> Deplay Keys --> Add Deploy Key

    homemade (28:63:10:87:c9:b3:fe:06:8e:84:74:6e:2a:07:a6:81)

    OK
    
</entry>
<entry [Sun 2012:07:15 20:35:44 EST] GITHUB DOESN'T ACCEPT EC2 *.pem PUBLIC CERT >


ON GITHUB: Admin --> Deplay Keys --> Add Deploy Key

PASTED IN THIS EC2 CERT:

-----BEGIN CERTIFICATE-----
MIICeDCCAeGgAwIBAgIGAPU26XvIMA0GCSqGSIb3DQEBBQUAMFMxCzAJBgNVBAYT
AlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMQwwCgYDVQQLEwNBV1MxITAfBgNVBAMT
GEFXUyBMaW1pdGVkLUFzc3VyYW5jZSBDQTAeFw0xMDEwMDQxODE0MzlaFw0xMTEw
MDQxODE0MzlaMFMxCzAJBgNVBAYTAlVTMRMwEQYDVQQKEwpBbWF6b24uY29tMRcw
FQYDVQQLEw5BV1MtRGV2ZWxvcGVyczEWMBQGA1UEAxMNMWdjbG41ZW5qYXcxNDCB
nzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEArakx/b3BIYoal1of5iVhZTtgGkFz
5InF582kyAviP2Mceou9vcc+RdXHIc4PgTU7N37t5wGP8j9SA7u5dFWxb4TRNONq
X6iPskF2DfUKlfFK1mXEp8h7ucGBbY9D4BHu07zQhNczfnjsqGlrRfmBCtrTCFNP
y58KuyXceZOb5xMCAwEAAaNXMFUwDgYDVR0PAQH/BAQDAgWgMBYGA1UdJQEB/wQM
MAoGCCsGAQUFBwMCMAwGA1UdEwEB/wQCMAAwHQYDVR0OBBYEFA2qXsSYvwsst1nA
dM9SbVpWytCWMA0GCSqGSIb3DQEBBQUAA4GBAAtHxmSUKGMxiJXy8LjYg1DAG0Z1
VYh8juWAzsYLk8I19AqvDp/Z4hB3OeGCmTyY31siCdaAwhkWHX+OIS91HzUi1Uy8
774I4O3Ar1wqF5keR25avv/QZREJ68k8yucb7U/+9ds3/uPd2JHq+HyADQfPQUEJ
wUC8PMLuYkyOikXi
-----END CERTIFICATE-----

AND GOT THIS ERROR:

    Key is invalid. It must begin with 'ssh-rsa' or 'ssh-dss'. Check that you're copying the public half of the key



    
</entry>
<entry [Sun 2011:12:04 01:20:13 EST] ADDED VOLUMES ARE PRESERVED ON TERMINATION OF AGUA INSTANCE>

SEE:
[Tue Oct 12 08:59:11 EDT 2010] RESIZE RUNNING EBS BOOT INSTANCE>
http://alestic.com/2010/02/ec2-resize-running-ebs-root
Resizing the Root Disk on a Running EBS Boot EC2 Instance
Note: Since you manually created the new volume and attached it to the instance yourself, it will not be deleted automatically when the instance is terminated. You can modify the instance attributes to change the delete-on-termination flag for the volume if you wish.


http://alestic.com/2010/01/ec2-instance-locking

Note: EBS volumes attached to an instance after it is already running are, by default, left alone on termination (i.e., not deleted). The default rules are: If the EBS volume is created by the creation of the instance, then the termination of the instance deletes the volumes. If you created the volume explicitly, then you must delete it explicitly.

    
</entry>
<entry [Sat 2011:12:03 22:35:00 EST] GET PUBLIC IP AND OTHER INFO FROM meta-data>

http://docs.amazonwebservices.com/AWSEC2/2007-08-29/DeveloperGuide/AESDG-chapter-instancedata.html

EXTERNAL HOSTNAME
curl http://169.254.169.254/latest/meta-data/public-hostname

EXTERNAL IP
curl http://169.254.169.254/latest/meta-data/public-ipv4

INTERNAL IP
curl http://169.254.169.254/latest/meta-data/local-ipv4


FULL DETAILS:

Data	Description	Version Introduced

ami-id	The AMI ID used to launch the instance.	1.0
ami-manifest-path	The manifest path of the AMI with which the instance was launched.	1.0
ami-launch-index	The index of this instance in the reservation (per AMI).	1.0
ancestor-ami-ids	The AMI IDs of any instances that were rebundled to create this AMI.	2007-10-10
instance-id	The ID of this instance.	1.0
instance-type	The type of instance to launch. For more information, see Selecting Instance Types.	2007-08-29
local-hostname	The local hostname of the instance.	2007-01-19
public-hostname	The public hostname of the instance.	2007-01-19
local-ipv4	Public IP address if launched with direct addressing; private IP address if launched with public addressing.	1.0
public-ipv4	NATted public IP Address	2007-01-19
public-keys/	Public keys. Only available if supplied at instance launch time	1.0
reservation-id	ID of the reservation.	1.0
security-groups	Names of the security groups the instance is launched in. Only available if supplied at instance launch time	1.0
product-codes	Product codes associated with this instance.	2007-03-01



</entry>
<entry [Sat 2011:12:03 17:36:22 EST] AUTOMATICALLY GENERATE A PRIVATE KEY WITH ssh-keygen>

ssh-keygen -t rsa -f ./id_rsa -q -N '' 
    
</entry>
<entry [Sat 2011:10:29 00:52:15 EST] RESIZE INSTANCE FROM IMAGE>

https://github.com/chapmanb/cloudbiolinux

When building from scratch with Alestic images, you will need to increase the size of the root filesystem to fit all of the CloudBioLinux data and libraries. This is done by starting the instance from the commandline with:

ec2-run-instances ami-1aad5273 -k kunkel-keypair -t m1.large -b /dev/sda1=:20
ec2-describe-instances i-0ca39764


On Ubuntu 10.04, you then need to ssh into the instance and resize the filesystem with:

sudo resize2fs /dev/sda1


On 11.04 the resize happens automatically and this is not required.



    
</entry>
<entry [Fri 2011:10:21 16:02:12 EST] CREATING SECURE PUBLIC AMIS>

http://alestic.com/2011/06/ec2-ami-security

    
</entry>
<entry [Fri 2011:10:21 14:56:52 EST] UPLOAD YOUR HOMEMADE PUBLIC KEY TO EC2>
http://alestic.com/2010/10/ec2-ssh-keys

NB: RSA KEY WORKS BUT DSA KEY DOES NOT WORK!!!


If you haven’t yet created an ssh key for your local system, it can be done with the command:

ssh-keygen
You can accept the default file locations, and I recommend using a secure passphrase to keep the key safe.

Here are some sample commands that will upload to all existing regions your personal ssh public key from the default file location on Ubuntu, giving it an EC2 keypair name of your current username. Adjust to suit your preferences:

keypair=$USER  # or some name that is meaningful to you
publickeyfile=$HOME/.ssh/id_rsa.pub
regions=$(ec2-describe-regions | cut -f2)

for region in $regions; do
  echo $region
  ec2-import-keypair --region $region --public-key-file $publickeyfile $keypair
done
When you start new instances, you can now specify this new keypair name and EC2 will provide the previously uploaded public ssh key to the instance, allowing you to ssh in. For example:

ec2-run-instances --key $USER ami-508c7839
[...]
ec2-describe-instances i-88eb15e5
[...]
ssh ubuntu@ec2-184-73-107-172.compute-1.amazonaws.com
Don’t forget to terminate the instance if you started one to test this.

[Update]

Based on a Twitter question, I tested uploading a DSA public ssh key (instead of RSA) and got this error from Amazon:

Client.InvalidKeyPair.Format: Invalid DER encoded key material

I don’t see why DSA would not work since it’s just a blurb of text being stored by EC2 and passed to the instance to add to $HOME/.ssh/authorized_keys but there you have it.

    
</entry>
<entry [Fri 2011:10:21 14:50:14 EST] EDIT /etc/rc.local TO ENABLE CONSOLE OUTPUT LOGGING TO FILE>
http://alestic.com/2010/12/ec2-user-data-output


NB: USE -ex AT TOP OF SCRIPT TO AID DEBUGGING

-x: print commands as '+' lines in the output
-e: stop running the script as soon as one of the commands returns an error


TO ENABLE LOGGING TO FILE, ADD THIS LINE TO /etc/rc.local:

exec > >(tee /var/log/startup.log|logger -t STARTUP-SCRIPT -s 2>/dev/console) 2>&1


... WHICH SENDS ALL OUTPUT TO THREE LOCATIONS:

/var/log/syslog - In case you’d like to have the results in a standard logging location with automatic timestamps (real time).

/var/log/user-data.log - In case you’d like to have a single place to get just the output and nothing but the output (real time).

Console output - In case you’d like to be able to see the results through an EC2 API call or the ec2-get-console-output command line program without logging in to the instance (snapshot available a few minutes after boot).


NOTES
-----

Take care to put a space between the two > > characters at the beginning of the statement.

Here’s a complete user-data script as an example:

#!/bin/bash -ex
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
echo BEGIN
date '+%Y-%m-%d %H:%M:%S'
echo END
I started a new Ubuntu 10.10 Maverick instance with this script specified as the user-data:

ec2-run-instances --user-data-file user-data.sh --key $USERNAME ami-508c7839
I waited a bit for the instance to come up, made a note of the instance id and IP address, and then looked for the output in all three places:

$ ssh ubuntu@50.16.102.155 grep user-data: /var/log/syslog
Dec 22 05:00:31 ip-10-117-73-160 user-data: + echo BEGIN
Dec 22 05:00:31 ip-10-117-73-160 user-data: BEGIN
Dec 22 05:00:31 ip-10-117-73-160 user-data: + date '+%Y-%m-%d %H:%M:%S'
Dec 22 05:00:31 ip-10-117-73-160 user-data: 2010-12-22 05:00:31
Dec 22 05:00:31 ip-10-117-73-160 user-data: + echo END
Dec 22 05:00:31 ip-10-117-73-160 user-data: END

$ ssh ubuntu@50.16.102.155 cat /var/log/user-data.log
+ echo BEGIN
BEGIN
+ date '+%Y-%m-%d %H:%M:%S'
2010-12-22 05:00:31
+ echo END
END

$ ec2-get-console-output i-0c9e9461 | grep user-data:
user-data: + echo BEGIN
user-data: BEGIN
user-data: + date '+%Y-%m-%d %H:%M:%S'
user-data: 2010-12-22 05:00:31
user-data: + echo END
user-data: END
And, don’t forget to clean up your running test instance:

ec2kill i-0c9e9461
Notes:

The “+” lines showed up in the output because I used the -x option in the bash script. This outputs each statement before executing it. The -e option tells bash to stop running the script as soon as one of the commands returns an error. Combined, these assist in debugging and figuring out what went wrong if there are problems.

My ssh command examples do not use the -i option to specify a private key file because I followed my instructions on uploading your personal ssh key to EC2.

user-data scripts can be written in any language as long as you can start the program file with shabang (#!). Bash is popular for writing startup scripts since it’s so easy to run other programs and has basic instructions for program flow, which is why I demonstrate it here. Redirecting output for other languages is left as an exercise for the reader.*


    
</entry>
<entry [Thu 2011:07:07 06:43:21 EST] YORUBA NA 18507 PILOT DATA FTP URL>

ftp://ftp.ncbi.nih.gov/1000genomes/ftp/pilot_data/data/NA18507/sequence_read/

E.G.:

ERR002342_1.recal.fastq.gz
ERR002342_2.recal.fastq.gz	
    
</entry>

<entry [Thu 2011:07:07 06:08:52 EST] SMALL PART OF 1000 GENOMES DATA>

1. USE TABIX TO DOWNLOAD DATA IN VCF FORMAT
You can get tabix from the samtools website
https://sourceforge.net/projects/samtools/files/

tabix ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/release/2010_07/exon/CEU.exon.2010_03.genotypes.vcf.gz 1:233411980:245804116

2. USE VCFTOOLS
vcftools are a set of perl and c++ scripts/programs for handling the vcf files
http://vcftools.sourceforge.net/

SEE HERE:
http://seqanswers.com/forums/archive/index.php/t-6019.html

3. USE ANNOVAR SITE DATA

Download the three 1000G files from http://www.openbioinformatics.org/annovar/annovar_download.html.

Then just do 

perl -ne 'm/(\d+)\t(\d+)/ and $1 eq "8" and $2>=125975261 and $2<=125977441 and print' < hg18_CEU.sites.2010_03.txt

You'll get all variants in CEU population. Do the same for YRI/ASN.


NOTES
-----

FROM THE FOLLOWING
http://seqanswers.com/forums/archive/index.php/t-6019.html

culmen
07-19-2010, 08:00 AM
Hi,

I am a newbie to next-gen data (just working from past couple of days). I am working on 1000genomes data for my thesis work. 
I need to extract all 1000 individual genome sequences at particular position 
EX: chr 8 + 125975261-125977441 

I don't have computing any resources to download all 1000 genome sequence read and align data ( which is > 200TB) from ftp site (ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/).
Is there any way that I could extract only a particular part of all 1000 genome sequences without downloading them? 

Appreciate your help,

Thanks in advance,
Culmen.
nickloman
07-19-2010, 09:31 AM
One way might be to use Amazon EC2 to do this. You would create an Amazon EC2 instance, for example with a Ubuntu image, and then access the 1000 genomes data which is apparently available through S3.

See also this thread 

http://seqanswers.com/forums/showthread.php?t=4874

There might be other, easier ways of doing it .. but this is one method of avoiding downloading the data locally.
krobison
07-19-2010, 09:47 AM
samtools can access the 1000 genomes BAM files on their websites; it will download the index file for each alignment you access but not the entire alignment. 

There are various wrappers for samtools & I don't know if this will work in them. It definitely works at the command line & in the current version of pysam (Python binding) with a few small mods.
culmen
07-19-2010, 01:21 PM
Thanks a lot nickloman and Robison for your help.

samtools can access the 1000 genomes BAM files on their websites; it will download the index file for each alignment you access but not the entire alignment.
--krobison

The alignment in the BAM file shows the reads alignment to reference sequence. Is there any way that I could get the consensus of that particular part (as shown in the ensembl browser of 1000genomes data (http://browser.1000genomes.org/Homo_sapiens/Location/View?r=8:125976261-125976401) with NA19238 selected (http://img2.pict.com/7b/1a/ac/3811591/0/1279574369.jpg)) of each genome in 1000genomes data.

Are there any tools to blast each genome sequence of 1000genomes data (without downloading data) with a query sequence (primer)? 

Thanks a lot,
Culmen
culmen
07-20-2010, 06:08 AM
Basically I am looking for all the SNPs in the region of a STR (ex: [TCTA]8 whose marker D6S502 ) with 1000bp flanks on either streams. (from all 1000 genomes).

So I thought it would be great if I could extract that particular regions ( 1kbp < STR > 1kbp ) from all the 1000 genomes.

Expecting this table (http://img2.pict.com/0d/76/3a/3812381/0/1279592572.jpg) as a result of my data extraction.

Appreciate any kind of help or suggestion,
Culmen
laura
08-09-2010, 02:16 AM
If what you are after is variant calls then you are better looking at the results in their july release of data

ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/release/2010_07/README.2010_07_release

You can even download subsets of snps in vcf format using tabix

tabix ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/pilot_data/release/2010_07/exon/CEU.exon.2010_03.genotypes.vcf.gz 1:233411980:245804116


You can get tabix from the samtools website

https://sourceforge.net/projects/samtools/files/

and then vcftools are a set of perl and c++ scripts/programs for handling the vcftools

http://vcftools.sourceforge.net/
tumorim
08-09-2010, 12:52 PM
download the three 1000G files from http://www.openbioinformatics.org/annovar/annovar_download.html.

Then just do 

perl -ne 'm/(\d+)\t(\d+)/ and $1 eq "8" and $2>=125975261 and $2<=125977441 and print' < hg18_CEU.sites.2010_03.txt

You'll get all variants in CEU population. Do the same for YRI/ASN.
KevinLam
08-09-2010, 11:16 PM
caveat: I haven't done this yet so I might be way wrong.
but since you only have 'variant data' for a stretch of 2kb. 
why not upload your bam / wig file up to ucsc instead?
2 kbase sounds quite manageable.
culmen
08-10-2010, 06:56 AM
Thanks a lot for your suggestions guys.

@laura: Thanks I am following similar steps.

@tumorim: ANNOVAR looks cool. Thanks for letting me know about it. 

@KevinLam: Thats a good idea. I would have tried UCSC, but I have more than 13 x (1000 files of 2kbps).


    
</entry>

<entry [Thu 2011:07:07 05:55:42 EST] DEMAND FOR EC2 + 1000 GENOMES DATA AT s3://1000genomes>


http://seqanswers.com/forums/archive/index.php/t-4874.html

FYI - having the data in the AWS Public Data Catalog/S3 would be neat for people analyzing data on AWS EC2 (their cloud computing infrastructure) because transfering data within a region is free and very fast.

http://aws.amazon.com/s3/#pricing
There is no Data Transfer charge for data transferred between Amazon EC2 and Amazon S3 within the same Region or for data transferred between the Amazon EC2 Northern Virginia Region and the Amazon S3 US Standard Region.
mndoci
06-22-2010, 11:54 AM
s3://1000genomes
bioinfosm
06-22-2010, 02:22 PM
How does one decrypt this s3 link to actually view/download the data?
mndoci
06-22-2010, 02:49 PM
I would recommend installing S3fox or similar S3 browser. Since the bucket is public, just type /1000genomes into the location windows (every bucket ID in S3 is unique)

Screenshot: http://img.skitch.com/20100622-geb3s471kmf52q8xngw3rrecc1.jpg

and

http://img.skitch.com/20100622-nixij1xs2ni92jdeud3myrcskq.jpg

Each individual BAM file is addressable, e.g. 

http://1000genomes.s3.amazonaws.com/Pilots_Bam/NA20828/NA20828.SLX.maq.SRP000033.2009_09.chrX_1_154913754.bam

(added later)

Also if you use curl or a browser and point to http://1000genomes.s3.amazonaws.com/ you'll get the XML response
cope
06-25-2010, 04:45 AM
S3fox is great. I also like Bucket Explorer (commerical, but there's a 30-day trial). If the analysis tools you are using are expecting a filesystem, you could create an AMI and try using s3fs or subcloud. Due to the large size of the current dataset, EBS is just not an option as it is for other public datasets which are less than 1 TB.

On thing to be aware of is that because S3 does not natively understand directories, it is up to the clients to infer the directory structure. Unfortunately some clients differ in this, and so when you mount the bucket using something like s3fs, the directory structure may not appear correctly.
spenthil
06-25-2010, 07:51 AM
Also, the AWS console now allows access to S3: http://aws.amazon.com/console/#s3

Haven't used it myself, but it looks nice enough.


 
    
</entry>
<entry [Thu 2011:07:07 05:50:38 EST] 1000 GENOMES FTP ON EC2 + LOW COST OF CLOUD COMPUTING>

1000 GENOMES FTP - JUST FASTA, EMBL, MYSQL, GTF, ETC. - NO BAM FILES
http://browser.1000genomes.org/info/data/ftp/index.html


LOW COST OF CLOUD COMPUTING FOR 1000 GENOMES DATA
http://www.genomics.cn/en/news_show.php?type=show&id=535

Data analysis and access – and first major release of biomedical data on the Amazon Web Services Cloud
The amount of data produced by the 1000 Genomes Project is unprecedented in biomedical research. Currently, the total size of the datasets is over 50 terabytes, or 50,000 gigabytes. That corresponds to almost eight trillion DNA base pairs, or terabases, of sequence data. Early in the project, merely copying the vast quantities of data between the European Bioinformatics Institute (EBI) in the U.K. and National Center for Biotechnology Information (NCBI), part of the U.S. National Library of Medicine in the U.S. consumed large fractions of both groups' capacity on the Internet for several days.
 
Researchers can freely access the 1000 Genomes Project pilot data through the 1000 Genomes web site, www.1000genomes.org. Researchers can download the data from NCBI at: ftp://ftp­trace.ncbi.nih.gov/1000genomes/ or from the EBI at: ftp://ftp.1000genomes.ebi.ac.uk/.
For many researchers and institutions, especially those who lack the computer and analytical power to study such a massive data set, an economical option is being tested to access and analyze the pilot data. The pilot datasets of the 1000 Genomes Project (7.3TB of data) are now available as a public dataset through Amazon Web Services (AWS) and integrated into the company’s Elastic Compute Cloud (Amazon EC2 and Simple Storage Service, S3) As new data become available and usage of this data increase on AWS, it is anticipated that additional data sets will be available in AWS.
The cost to researchers for computing through Amazon EC2 can be counted in tens of dollars per day compared to the hundreds of thousands of dollars it would cost to purchase the computer infrastructure needed to download and analyze this amount of data locally. Because 1000 Genomes Project data are publicly available from EBI and NCBI, other companies that provide similar computing services are also free to download and provide the data to their clients.
"The 1000 Genomes Project has a simple goal: peer more deeply into the genetic variations of the human genome to understand the genetic contribution to common human diseases,” said Eric D. Green, M.D., Ph.D., director of the National Human Genome Research Institute, which provides major funding to the effort. “I am excited about the progress being made on this resource for use by scientists around the world and look forward to seeing what we learn from the next stage of the project.”
Consortium researchers are writing a paper that describes the pilot data and the design of the full project that is expected to be published in a peer-reviewed scientific journal later this year.


</entry><entry [Wed 2011:07:06 03:52:43 EST] FREEBASE>

http://wiki.freebase.com/wiki/Main_Page

    
</entry>

<entry [Wed 2011:07:06 03:51:09 EST] SHARED DATA SETS>

LATEST ANNOUNCEMENT WAS IN OCTOBER LAST YEAR:
https://forums.aws.amazon.com/forum.jspa?forumID=55

New Data Set: 1000 Genomes 
Posted by: AdamG@AWS-- Oct 28, 2010 9:41 AM


CURRENT LIST OF DATA
http://aws.amazon.com/datasets?_encoding=UTF8&jiveRedirect=1

1000 Genomes Project
http://s3.amazonaws.com/1000genomes

Public Data Sets
Public Data Sets on AWS provides a centralized repository of public data sets that can be seamlessly integrated into AWS cloud-based applications. AWS is hosting the public data sets at no charge for the community, and like all AWS services, users pay only for the compute and storage they use for their own applications. Learn more about Public Data Sets on AWS and visit the Public Data Sets forum.

Featured Public Data Sets
Illumina - Jay Flatley (CEO of Illumina) Human Genome Data Set
Jay Flatley (CEO of Illumina) human genome data set.
YRI Trio Dataset
Complete genome sequence data for three Yoruba individuals from Ibadan, Nigeria

Ensembl Annotated Human Genome Data - for MySQL
The Ensembl project produces genome databases for human as well as over 50 other species, and makes this information freely available.
Last Modified: Jun 9, 2011 0:00 AM GMT

Ensembl Annotated Human Genome Data - for FASTA
The Ensembl project produces genome databases for human as well as over 50 other species, and makes this information freely available.
Last Modified: Jun 9, 2011 0:00 AM GMT

1000 Genomes Project
The 1000 Genomes Project is an international public-private consortium to build the most detailed map of human genetic variation to date
Last Modified: Oct 18, 2010 16:57 PM GMT


Human Liver Cohort (Sage Bionetworks)
Human Liver Cohort characterizing gene expression in liver samples
Last Modified: Sep 8, 2010 20:56 PM GMT
C57BL/6J by C3H/HeJ Mouse Cross (Sage Bionetworks)
C57BL/6J by C3H/HeJ mouse cross from the Jake Lusis lab at UCLA
Last Modified: Sep 8, 2010 20:53 PM GMT

Illumina - Jay Flatley (CEO of Illumina) Human Genome Data Set
Jay Flatley (CEO of Illumina) human genome data set.
Last Modified: Jan 20, 2010 21:54 PM GMT

GenBank
An annotated collection of all publicly available DNA sequences including more than 85.7B bases and 82.8M sequence records.
Last Modified: Dec 9, 2009 2:49 AM GMT

YRI Trio Dataset
Complete genome sequence data for three Yoruba individuals from Ibadan, Nigeria
Last Modified: Oct 19, 2009 16:57 PM GMT

Ensembl - FASTA Database Files
Ensembl sequence databases of transcript and translation models
Last Modified: Oct 1, 2009 22:34 PM GMT

    
</entry>

<entry [Wed 2011:07:06 03:48:05 EST] HOW TO SHARE AN EC2 SNAPSHOT>


Re: How to share an EBS snapshot among multiple EC2 accounts?
Posted by:   Shlomo Swidler
Posted on: Sep 24, 2009 2:23 AM
 in response to: hippo12345
 		Reply

Good news... Amazon today announced the ability to share EBS snapshots!

http://aws.amazon.com/about-aws/whats-new/2009/09/24/introducing-amazon-ebs-shared-snapshots/



https://forums.aws.amazon.com/thread.jspa?messageID=125345

How to share an EBS snapshot among multiple EC2 accounts?
Posted by: Patrick Linskey  
Posted on: Nov 10, 2008 2:12 PM
 		Reply
	 This question is not answered. Helpful answers available: 2. Correct answers available: 1.
Hi,

In my organization, we use one EC2 keypair for day-to-day development and testing purposes, and a separate keypair for production. We do this to reduce the likelihood of someone accidentally taking down our production servers.

One step of our continuous integration story is a multi-hour database import and analysis job. Once the job is done, we snapshot the EBS volume that the data is stored to. Then, in day-to-day development tasks, we just create a new volume from that snapshot rather than redoing the full import.

So far, so good. However, I can't figure out how to share that snapshot (stored with the dev EC2 keypair) with the production environment (using the production keypair). For other S3 objects (such as our AMIs), we've been successful by granting the production keypair access to the appropriate objects. But since the EBS snapshots seem to be stored in non-user-visible S3 space, we can't do that for our snapshots.

Does anyone have any suggestions (other than manually snapshotting back to S3 on our own) for how to deal with this?

Or, does anyone have any tips about how we could use a single EC2 account for dev and production, but somehow set up a flag to keep the production instances safe from accidental deletion?

Thanks,

-Patrick


    
</entry>
<entry [Fri 2011:04:22 11:26:51 EST] AWS HAS NEW 'IDENTITY AND ACCESS MANAGEMENT' (IAM)>
    
HOMEPAGE
http://aws.amazon.com/iam/
IAM provides a simple set of APIs that make it easy to manage Users, groups, and permissions within your AWS Account

DOWNLOAD
http://aws.amazon.com/developertools/4143?_encoding=UTF8&jiveRedirect=1

mkdir -p /usr/share/iam/archive
cd /usr/share/iam
wget http://awsiammedia.s3.amazonaws.com/public/tools/cli/latest/IAMCli.zip
unzip *zip
mv IAMcli-1.2.0 1.2.0
mv *zip archive

ADD TO PATH IN .bash_profile

#### ADD IAM TO PATH
PATH=/usr/share/iam/1.2.0/bin:$PATH
export AWS_IAM_HOME=/usr/share/iam/1.2.0
export AWS_CREDENTIAL_FILE=/home/syoung/22-agua/cloud/AWS/keypair/jgilbert/jgilbert-aws-credentials.txt

#### CREATE AWS CREDENTIALS FILE
emacs /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/jgilbert-aws-credentials.txt
    AWSAccessKeyId=558277860346
    AWSSecretKey=7dEtf/23BzV2UAwk6jUikk80WBsItHISdC2Urwef


TO AVOID THIS ERROR:
Could not load AWS Credential file.
Make sure that the environment variable AWS_CREDENTIAL_FILE or command line argument --aws-credential-file is set to a file containing AWS Credentials in the following format.

    AWSAccessKeyId=< Write your AWS access key ID>
    AWSSecretKey=< Write your AWS secret key>


NOTE: THIS IS DIFFERENT TO THE jgilbert EC2 CREDENTIALS SCRIPT

IN .bash_profile

    #### ADD EC2 TO PATH
    export EC2_HOME=/usr/share/ec2/1.4.2.4
    export JAVA_HOME=/usr
    PATH=/usr/share/ec2/1.4.2.4/bin:$PATH
    alias jg='source /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/jgilbert.sh'


jgilbert EC2 CREDENTIALS SCRIPT

emacs /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/jgilbert.sh
    export AMAZON_USER_ID=558277860346
    export AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
    export AWS_SECRET_ACCESS_KEY=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
    export PATH=/usr/share/ec2/1.4.2.4/bin:$PATH
    export EC2_HOME=/usr/share/ec2/1.4.2.4
    export JAVA_HOME=/usr/java/jre1.6.0_24
    export EC2_PRIVATE_KEY=/nethome/jgilbert/aws/.keypair/pk-APKAJLSLZIS4DAQYFRFQ.pem
    export EC2_CERT=/nethome/jgilbert/aws/.keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem



SET UP AN ADMIN GROUP
http://docs.amazonwebservices.com/IAM/latest/UserGuide/

iam-groupcreate -g Admins

    403 InvalidClientTokenId The security token included in the request is invalid


iam-groupcreate -g Admins --aws-credential-file /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/jgilbert-aws-credentials.txt

iam-grouplistbypath


</entry>

<entry [Wed 2011:04:20 01:24:08 EST] NON-INTERACTIVE passwd ON UBUNTU 10.10>
    

CREATE USER WITH HOME DIR /home/jgilbert

useradd -m jgilbert


CREATE NON-/home USER HOME DIRECTORY:

useradd -D -b /nethome  #### SET NEW DEFAULT BASE DIR
useradd -m jgilbert


DELETE A USER WITHOUT REMOVING THEIR HOME DIR:

userdel jgilbert


CHANGE A USER'S PASSWORD

echo 'jgilbert:open' | chpasswd 





NOTES
-----


USE mkpasswd TO CREATE A RANDOM PASSWORD STRING

mkpasswd MKPA




USE newusers TO CREATE OR MODIFY A USER

newusers -r NEWUSER

syoung:x:1000:1000:syoung,,,:/home/syoung:/bin/bash





PROBLEM:

echo 'jgilbert:open' | chpasswd 

    Authentication Token Manipulation Error

DIAGNOSIS:
http://mohammednv.wordpress.com/2008/01/08/authentication-token-manipulation-error-when-changing-user-passwords-in-linux/
You may get an error, such as Authentication Token Manipulation Error, while trying to change passwords for a user. For example:

#passwd user
Authentication Token Manipulation Error
#
This error is being produced because you are using shadowed password files and the shadow doesn’t have entry for this user. i.e, /etc/passwd has an entry for this user, but /etc/shadow doesn’t.

In order to resolve this, you can either add the entry manually or recreate the shadow file. You can use pwconv to recreate the shadow file. See the manpage for more details on this.

SOLUTION:

DON'T FORGET TO CREATE USER jgilbert AND CONFIRM THAT IT APPEARS IN BOTH /etc/passwd AND /etc/shadow



http://ubuntuforums.org/showthread.php?t=208644
adduser will accept a password with --password but it must be ecrypted with crypt

http://lists.gllug.org.uk/pipermail/gllug/2003-May/034740.html
RedHat's passwd program can do stdin, but not the one in Debian (as 
of 3.0) or SuSE (as of 7.1).



</entry>

<entry [Tue 2011:04:19 23:56:34 EST] INSTALL EC2 ON UBUNTU 10.10>
    

1. DOWNLOAD EC2 AND UNZIP

apt-get install ec2-api-tools

OR:

mkdir /usr/share/ec2
cd /usr/share/ec2
wget http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip
unzip *
mv ec2-api-tools-1.4.2.4/ 1.4.2.4
ll 1.4.2.4
    drwxr-xr-x 2 root root 20480 2011-04-06 03:03 bin/
    drwxr-xr-x 2 root root  4096 2011-04-06 03:03 lib/
    -rw-r--r-- 1 root root  4852 2011-04-06 03:00 license.txt
    -rw-r--r-- 1 root root   539 2011-04-06 03:00 notice.txt
    -rw-r--r-- 1 root root 46468 2011-04-06 03:00 THIRDPARTYLICENSE.TXT

2. GET THE JAVA VERSION

java -version
    java version "1.6.0_24"
    Java(TM) SE Runtime Environment (build 1.6.0_24-b07)
    Java HotSpot(TM) 64-Bit Server VM (build 19.1-b02, mixed mode)

ll /usr/java/jre1.6.0_24/bin
    OK

3. SET PATHS IN .bash_profile

emacs /nethome/jgilbert/.bash_profile
    
    #### ec2
    export PATH=/usr/share/ec2/1.4.2.4/bin:$PATH
    export EC2_HOME=/usr/share/ec2/1.4.2.4
    export JAVA_HOME=/usr/java/jre1.6.0_24
    export EC2_PRIVATE_KEY=/nethome/jgilbert/aws/.keypair/pk-APKAJLSLZIS4DAQYFRFQ.pem
    export EC2_CERT=/nethome/jgilbert/aws/.keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem

    OK!




    
</entry>


<entry [Tue 2011:04:19 20:49:36 EST] INSTALL libfuse2 ON UBUNTU 10.10>

LIBFUSE2 IS ALREADY INSTALLED BY DEFAULT ON UBUNTU 10.10

apt-get install libfuse2

    
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    libfuse2 is already the newest version.
    The following package was automatically installed and is no longer required:
      compiz-fusion-plugins-main
    Use 'apt-get autoremove' to remove them.
    0 upgraded, 0 newly installed, 0 to remove and 27 not upgraded.
    root@hp:/home/syoung# 

    
    
</entry>
<entry [Tue 2011:04:19 20:41:36 EST] HOW TO ALLOW NON-ROOT USERS TO MOUNT DRIVES>
    
http://mailman.mit.edu/pipermail/starcluster/2010-October/000402.html
a file system can be mounted by a non-root user. For instance, on my home boxes, I have:

/dev/sdb1      /mnt/sdb1     auto    use    0 0
/dev/sdb2      /mnt/sdb2     auto    user   0 0
[download]

in my /etc/fstab file, allowing a non-root user to mount usb devices.
    
</entry>


<entry [Tue 2011:04:19 18:08:36 EST] INSTALL S3 FOR UBUNTU>

http://s3tools.org/repositories#note-deb
Debian & Ubuntu


1. IMPORT S3tools SIGNING KEY

wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -


2. ADD THE REPO TO THE SOURCES LIST

sudo wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list


3. REFERSH PACKAGE CACHE AND SINTALL THE LATEST s3cmd

sudo apt-get update && sudo apt-get install s3cmd
    

4. ADD AWS ACCESS KEY AND SECRET KEY

s3cmd --configure

    ...
    Configuration saved to '/home/syoung/.s3cfg'


cat /home/syoung/.s3cfg

    [default]
    access_key = AKIAJCICVKEQEEE7CYOA
    bucket_location = US
    cloudfront_host = cloudfront.amazonaws.com
    cloudfront_resource = /2010-07-15/distribution
    default_mime_type = binary/octet-stream
    delete_removed = False
    dry_run = False
    encoding = UTF-8
    encrypt = False
    follow_symlinks = False
    force = False
    get_continue = False
    gpg_command = /usr/bin/gpg
    gpg_decrypt = %(gpg_command)s -d --verbose --no-use-agent --batch --yes --passphrase-fd %(passphrase_fd)s -o %(output_file)s %(input_file)s
    gpg_encrypt = %(gpg_command)s -c --verbose --no-use-agent --batch --yes --passphrase-fd %(passphrase_fd)s -o %(output_file)s %(input_file)s
    gpg_passphrase = stuart
    guess_mime_type = True
    host_base = s3.amazonaws.com
    host_bucket = %(bucket)s.s3.amazonaws.com
    human_readable_sizes = False
    list_md5 = False
    log_target_prefix = 
    preserve_attrs = True
    progress_meter = True
    proxy_host = 
    proxy_port = 0
    recursive = False
    recv_chunk = 4096
    reduced_redundancy = False
    secret_key = KIrmK78FWPVEvKIcu/tDKlsZ1u/GHU7xud6jvr6I
    send_chunk = 4096
    simpledb_host = sdb.amazonaws.com
    skip_existing = False
    socket_timeout = 10
    urlencoding_mode = normal
    use_https = True
    verbosity = WARNING


</entry>


<entry [Tue 2011:04:19 17:55:26 EST] PARALLEL S3 FILE TRANSFER>

S3 HOMEPAGE
http://s3tools.org/s3cmd


PARALLEL TRANSFER
Jeremy wrote:

Please consider merging the excellent —parallel option developed here:

https://github.com/pcorliss/s3cmd-modification

It does parallel transfers, dramatically speeding up operations that involve large numbers of small files.


Aleksander Ohlens wrote:

I am using the parallel patch and it is a life saver that has turned 2 day transfer queues into hours. It would be great to see it included in s3cmd natively.

(18 March 2011, 04:03 · #)


</entry>

<entry [Tue 2011:04:19 14:33:00 EST] MOUNT S3 ON EC2>
  

s3cmd & libfuse2
----------------
http://stackoverflow.com/questions/956904/mounting-an-s3-bucket-in-ec2-and-using-transparently-as-a-mnt-point

This is a little snipped that I use for an Ubuntu system and I have not tested it on so it will obviously need to be adapted for a M$ system. You'll also need to install s3-simple-fuse. If you wind up eventually putting your job to the clound, I'd recommend fabric to run the same command.


import os, subprocess

'''
Note: this is for Linux with s3cmd installed and libfuse2 installed
Run: 'fusermount -u mount_directory' to unmount
'''



def mountS3(aws_access_key_id, aws_secret_access_key, targetDir, bucketName = None):
    #######
    if bucketName is None:
        bucketName = 's3Bucket'



mountDir = os.path.join(targetDir, bucketName)
if not os.path.isdir(mountDir):
    os.path.mkdir(mountDir)
subprocess.call('s3-simple-fuse %s -o AWS_ACCESS_KEY_ID=%s,AWS_SECRET_ACCESS_KEY=%s,bucket=%s'%(mountDir, aws_access_key_id, aws_secret_access_key, bucketName)


s3cmd NOTES
-----------

s3cmd list yourbucket: | wc



    
</entry>