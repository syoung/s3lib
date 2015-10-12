apps.ec2.quickref


<entry [Sat 2014:01:04 23:11:38 EST] AWS CLI CONFIG FILE>

1. CREATE CONFIG FILE

aws configure

OR

EDIT MANUALLY:

cat /root/.aws/config

	[default]
	output = json
	region = us-west-2
	aws_access_key_id = AKIAIKZHIY7T75JIF34A
	aws_secret_access_key = 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


2. SET LOCATION FOR CONFIG FILE

export AWS_CONFIG_FILE=/root/.aws/config


DEFAULT LOCATION:

LINUX AND OSX

~/.aws/config


WINDOWS

C:\Users\USERNAME\.aws\config 


</entry>
<entry [Thu 2013:09:19 01:54:01 EST] COPY AN AMI FROM ONE ZONE TO ANOTHER>

1. AWS MANAGEMENT CONSOLE

2. select the AMI to be copied

3. choose the destination region, and start the copy


AMI Copy can also be accessed via the EC2 Command Line Interface or EC2 API as described in the EC2 User’s Guide. Once the copy is complete, the new AMI can be used to launch new EC2 instances in the destination region.

    
</entry>
<entry [Thu 2013:09:19 01:32:41 EST] ADD A TAG TO AN INSTANCE>

ec2-create-tags i-7ba84006 \
--tag name=aquarius-8h \
--tag description="TESTING init.html"

    
</entry>
<entry [Thu 2013:09:19 01:13:08 EST] LIST OF AWS ZONES>

Code	Name
ap-northeast-1      Asia Pacific (Tokyo) Region
ap-southeast-1      Asia Pacific (Singapore) Region
ap-southeast-2      Asia Pacific (Sydney) Region
eu-west-1           EU (Ireland) Region
sa-east-1           South America (Sao Paulo) Region
us-east-1           US East (Northern Virginia) Region
us-west-1           US West (Northern California) Region
us-west-2           US West (Oregon) Region
    
</entry>
<entry [Wed 2013:01:30 01:46:02 EST] HOW TO ENABLE PING>

http://support.rightscale.com/06-FAQs/FAQ_0145_-_How_do_I_enable_ICMP_echo_(ping_reply)

1. ADD 'All ICMP' RULE TO defaults SECURITY GROUP

EC2 CONSOLE --> Security Groups --> CLICK defaults --> Inbound --> Create new rule: All ICMP --> Source 0.0.0.0/0 --> Add Rule --> APPLY RULE CHANGES

OR:

ec2auth default -P icmp -t -1:-1

    GROUP			default		
    PERMISSION		default	ALLOWS	icmp	-1	-1	FROM	CIDR	0.0.0.0/0	ingress

 -t, --icmp-type-code TYPE:CODE
          icmp type and code. If the icmp protocol is specified, then icmp type
          and code may optionally be specified as type:code, where both type and
          code are integers and compliant with RFC792. Type or code (or both) may
          be specified as -1 which is a wildcard covering all types or codes.

          
          
2. TEST PING

ping ec2-54-234-114-245.compute-1.amazonaws.com

    64 bytes from ec2-54-234-114-245.compute-1.amazonaws.com (54.234.114.245): icmp_req=670 ttl=42 time=40.2 ms

    OK!


see also: Associate Elastic IP on Instance Startup - (Linux)
http://www.idevelopment.info/data/AWS/AWS_Tips/AWS_Management/AWS_14.shtml


</entry>
<entry [Sat 2012:10:06 14:05:33 EST] FLUSH FILESYSTEM TO AVOID 'attaching' HANGS>

1. flush file system caches

sync
echo 3 > /proc/sys/vm/drop_caches


2. flush file system meta data


    
</entry>
<entry [Sat 2012:07:21 23:26:24 EST] FIXED ERROR WHEN ADD/REMOVE KEYPAIR: 'Client.MalformedSOAPSignature: Invalid SOAP Signature. Failed to check signature with X.509 cert'>

RUNNING ec2-add-keypair OR ec2-delete-keypair GIVES THIS ERROR:


ec2-delete-keypair \
-K /agua/conf/.ec2/admin/private.pem \
-C /agua/conf/.ec2/admin/public.pem \
id_rsa-admin-key

    Client.MalformedSOAPSignature: Invalid SOAP Signature. Failed to check signature with X.509 cert


ec2-add-keypair \
-K /agua/conf/.ec2/admin/private.pem \
-C /agua/conf/.ec2/admin/public.pem \
id_rsa-admin-key \
> /nethome/admin/.starcluster/id_rsa-admin-key
    
    Client.MalformedSOAPSignature: Invalid SOAP Signature. Failed to check signature with X.509 cert


DIAGNOSIS

WRONG private.pem FILE CONTENTS - NEW KEY WAS NOT PRINTED TO FILE

INPUT private.pem TEXT:

-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ
WWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ
NVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC
gYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3
8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG
M6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC
aE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK
pzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9
4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc
6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC
QQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN
ukFcKuTSGIpO
-----END PRIVATE KEY-----


ACTUAL private.pem FILE CONTENTS:

cat /agua/conf/.ec2/admin/private.pem
-----BEGIN PRIVATE KEY-----
MIIEpgIBAAKCAQEA1vLhO49CjIakdmSzaYTihkaPMzjNkPPsqsH7A9R2FbRHw4afRFfcOouKKJdW
hvSiWQOyE+7n0BVjGK7RI3pWr+A9uCkhCc8aEr/ECf+rb6dsD6ztgwcelwQzBxMcVU+eJ8juBYX6
zXELdrJInFWW6THt8frbA9kDnDFiNWjCOCIjAA57moF/vuYUTt9FNEElqcYXmXnZxIqNdrtPwkL2
dRGenMrMPNs6BDzjn4fjhMVT/2AaOY+/fmYMG1EPa/naymnCPAnOK6CL5Cen7Hw3fZOmL711wald
ckXX+wDbWjC6DIMrcsz4dBZzi6k5vnu433urCrfk0rby2iwVFUFlNQIDAQABAoIBAQDTg8lTfJO2
CMBJqKpLyXHHRCOh+eF/JCjdl2jUyfsxPGfp5c1PyU1zZuCbNOD2iEBBa7uOlecTAhizr0MpsDch
dn4FfKOALYWwsXfNhwNCKfPSMQ6/gv/9ByrXaVzWLjSpXbWrRb4Y74aiVKnS/P41luZY2csvLBu7
VXUYrW+BH3hLLnVtstQDCLw9tULzIYrNg7ICWL4PdV0leEBhb3nTv1C7DgTRtzvfHgZneDmzLcLr
P924H+MJA94QrX6Ozvm3BVabHtIWo8R3qlfGOG9FCGZdxJLJeVW37TH1gCChVK1bM3HslfVKLHnK
lU4AKWl4c8YQnYHwme4OH7i1Dl7BAoGBAPT8C/ylhJvJry64F9faAkkgSY0mTfnd1hO98PIBFyYC
AziK9RNUNNdydlvEQHl2wLoZrZV5hvT2GDkSQ+FxzMQR9BjA+wNJeMQ66Rp3ooi6zf4agmB5Ksk1
tX3XD+aIZT1YdEXr3Gmtw6Iek1mGDoQXjPJd3Zt0JVjhfPfOCdVtAoGBAOCdGUFXEWH6QsTSc77G
it0k6Rh5brSPamRq6MANHkXbjjvrPUYj+r+v5bW7OdFUl4AE828FQgc9cxIkWy9394darWuuFdyO
6c1Q6tf80QXjTOVDCU1TbygHK0U92r/0VU0dvemBKQ/FQrWkgTg8ls0acqEgPjEE96At/yuMwJnp
AoGBAPJTpp/AMc3P0AMMgjk3Im+nCloee58fObTJe15GidlEwF7bxNPbxXEffcgD9iqvtq/e2n8y
eLYx/3/ke1SzNnLzt1oM+b4knNqt0wolMJbDASPKoRBAinwBLodNhiLo5AusRUcsqRe3k/329JXn
LtCmYvsSsjQkzRR/5xdPrRZ5AoGBAN+pL5vTwlho5pGs6lqew2ogNggL60Pax1uE5Y1PwsRXM1PR
E+vDKg40bi2/aHxcmpt80pbLiotBElOPZklnUVEz5xoheF1u5btwBtnaQp11UH2+egXIvhgCw4Co
binUeBhZNGHPHn84swvC6nWAR72mx1xQif0v8BBNnRjViHf5AoGBAKy57uRYZUpJHBdux5N1JEnv
YMp4V5eAgq3asrqX9Adx3+/b9qT3vSKkEieCNjQZVbe0XAM9o928dJz6YsMgybcX3umzLzHfhCIx
iaqan9CBt8P/Q+BHJztMzzzlfLAmjKzFTYmtT1u5zAc+JfyH9bGbF2B8kLO3jbNh66VEbGio
-----END PRIVATE KEY-----


ALTERNATELY:

1. PROBLEM WITH private.pem OR public.pem - ARE THEY VALID? CHECK public.pem IN AWS CONSOLE

2. WRONG PRIVATE KEY (using the SSH one instead of the X.509 CERTIFICATE) 

    NO NO NO!!! do not use the private key used for SSH access, but the Private key of the CERTIFICATE!!!



SOLUTION

USE VALID private.pem AND public.pem FILES:

ec2-add-keypair -K /agua/conf/admin/.keypairs/private.pem -C /agua/conf/admin/.keypairs/public.pem id_rsa-admin-ke

KEYPAIR	id_rsa-admin-ke	90:7c:7c:80:0e:41:a2:32:93:22:60:0e:04:26:9c:51:8a:29:1c:44
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAk+rC2wzq5Fye3cEYQzdFCr6aZK33kQTBEIJtNdCeQIqCygWwoGl5G+ECmSJE
TrQwfnKBfiohWeWF1/gIVOmoN+7o/VtO+f6pbD5mYy3/cv88KKAyfIaPMSzs/NpmrQep/cp77noR
ZTKgrfJwd7eLr5UFwz1AGEKRVp0WP1qtZOYjGBOd8x/accfR2Ey8PXSEYs+PKL7HxuarGfBf4aMH
DheWXYyC5aHpRc193hY7AKi+JYEAG6HrhEX6yfxw5UZbDOZy/bhEL/1BDvfVVdIi9pKTlaFU5Apm
B5xp2e544T6s2TmAX9UZcqEnagl7OzcCDq7O05/+IwdBeVIvjRibLwIDAQABAoIBAH2lr7vPL0Co
hLKuMeP28Qj9e70GIgPn2/AgOpC6E5OTlSHyz2ST87KA4moeN5P7cC4ZKnJ3azknxRf9s2YdzS0m
HngItf+aGWS/ZM3e5t1SflGsMvagfsYw+WaYRxu4JOhWtguPWXNzHBZmmK65FUki93AveWCiOz8t
1RYf+qZ3nv8Y7N8/hqowB166Fy0RfueQuCdK9iNVkD7lUM0NHrKuW8FHDj69rGfe92VsFCnONLAx
fEqoYbf6Mv6YHNpUQyztwl8pEmaygAZobk2q5DqMZPOJBZb+eomTxj6chgKzoODlPW0ct08qMFXv
8MZ4mUFGFOIBFyRvBAbORuthnqECgYEA6nwSzUOQF8zmGJOkiTlLEPT0sL2GMUaokMDLx91d9C7d
x3Zsdmkb2HWX4p5Fs5tLtG3FENAkwe7XmuJeQ1Cq0PHCT8bgs2XfI0E/BAsAZKUUh09fF3xUrcAJ
42+evHSE47qjpAj9D0lZDyPGLTreJ5IqVLj5PUwfJmLW5GcZt2kCgYEAoX1B/q3w6MIK2t7pmZhJ
XWNaiNAGWzASv/wsBGlWLBT/AmrODM8rNj9XHVuz06iQigh+Hn5WGc8iQ7ipbbf+Ilk8QWUM9N0d
Vy4KZGO10lfHwWRxkA8YjbTG2RFDFlRYkx8EYVYSGUghf0DYNf7CRXeU66s/Yd91jexNco8ywtcC
gYEArGTSEfWlX8o2NUV/R6BGz025BKQin+HaFqqYZ/YZmGhIh9hKP/hhD5DNPUCt8DGxxBKcOxM8
oxRtkaLyOL17CKll+e82zs6L8kiLAvbvsA8qe5zgRc0UGLZCzuMGqnlkJmXW38f3/aAoiRf9IM3R
/PfahXWFUQrBMCCk60Hdx1kCgYA/i+e1TUM4hGr7F666xydPfXI51go6Rd+K9rNnhP/o1tZGYDr2
5WrurNwd7GEGEBXYi2D9pN9CxrSIC5l4WGfDonPIk/gWPxB1puNl/6qju/EaE+lwM9CIqrN45YcN
uWEle5Ygq1rx4eV0itLJ5JcT+Ot8FWYaoHFEyNDtHJZv/wKBgDBAdiyt9oQ3hez0fHMQ7tPy2dRt
4JPv9W2gqEnuKplp25l1KZ57zDt24gUtXSCKo2TYgAQjDt4hAo1PsiXfA2SJ+//5HUckCQmxfPSH
Vq8XCZbaoKg+IEwuMBmeldT8Cbys5Udh8T1+cVRmTQq2S4c0WcRajIXfLHSTwbxxlxZ4
-----END RSA PRIVATE KEY-----


    
</entry>
<entry [Thu 2012:03:15 21:54:32 EST] ACCESSING INSTANCE meta-data>

http://open.eucalyptus.com/participate/wiki/accessing-instance-metadata

curl http://169.254.169.254/latest/meta-data/
    block-device-mapping/     security-groups
    ami-manifest-path
    ancestor-ami-ids
    public-keys/
    reservation-id
    ramdisk-id
    public-keys/0/
    ami-launch-index
    kernel-id
    instance-type
    local-hostname
    local-ipv4
    hostname
    product-codes
    public-ipv4
    instance-id
    public-hostname
    ami-id
    placement/

    
</entry>
<entry [Mon 2012:02:27 23:11:56 EST] RESTART AQUARIUS-8F2 AS M1.LARGE>

ec2stop $head    
ec2-modify-instance-attribute  --instance-type m1.large $head
    instanceType	i-b34d25d2	m1.large
    
ec2-describe-instance-attribute  --instance-type $head
    instanceType	i-b34d25d2	m1.large
ec2start $head
ec2din $head
 
    
</entry>
<entry [Mon 2012:01:16 18:11:38 EST] CHANGE INSTANCE TYPE WITH ec2-modify-instance-attribute>

ec2stop $head    

ec2-modify-instance-attribute  \
--instance-type m1.large \
$head
    ec2din instanceType	i-b34d25d2	m1.large

ec2start $head
ec2din $head

</entry>
<entry [Sat 2011:12:03 18:13:56 EST] GRANT AMI ACCESS TO USERS>

ec2-modify-image-attribute ami-6688760f -l -a 728213020069
ec2-modify-image-attribute ami-6688760f -l -a 913944561404
ec2-modify-image-attribute ami-6688760f -l -a 983300124420
    
</entry>
<entry [Fri 2011:10:21 00:47:44 EST] CREATE IMAGE COMMAND AND console-output COMMAND>

CREATE IMAGE    
ec2-create-image --name aquarius-8-cluster.2 --description "Clean /etc/fstab" i-f35db69d

CONSOLE OUTPUT
ec2-get-console-output $head
    
</entry>
<entry [Fri 2011:09:30 00:50:03 EST] AWS CREDENTIALS>

http://docs.amazonwebservices.com/AWSSecurityCredentials/1.0/AboutAWSCredentials.html#EC2KeyPairs

Use X.509 certificates:
    Make secure SOAP protocol requests to AWS service APIs
    Use the command line tools.

Amazon EC2 Key Pairs: 
    Launch and then securely access your Amazon EC2 instances.

Each EC2 key pair includes a key pair name, a private key file, and a public key file;

Key pair name—When you create an EC2 key pair, you give it a friendly name. Make sure to record the name, because you must provide it when launching an instance with the associated key pair.

Private key—When you create the EC2 key pair, you download the private key file and give it a name. We recommend you use the same name you used for the key pair itself. You store the private key locally on the system you're using to access the instance. Your private key is a secret, and should be readable only by you. AWS doesn't have a copy of it. Don't e-mail it to anyone, include it any AWS requests, or post it on the AWS Discussion Forums. No authorized person from AWS will ever ask for your private key.

Public key—When you create the EC2 key pair, AWS keeps the public key (it's not available for you to download). When you launch an instance, you specify a particular EC2 key pair name, and AWS puts a copy of the public key from that pair on the instance. Only the holder of the private key (you) should therefore be able to access the instance.
For root access to a Linux/UNIX instance via SSH, you provide the name of the private key as part of the SSH command. AWS uses that key to authenticate your access to the instance.

</entry>
<entry [Tue 2011:09:27 12:18:00 EST] TROUBLESHOOT AN INSTANCE THAT CAN'T CONNECT TO BY SSH>

LAUNCH RESCUE INSTANCE
ec2-run-instances \
ami-76837d1f \
-g default \
-k aquarius2 \
--instance-type t1.micro \
-z us-east-1a

    i-b8e489d8


ec2din i-b8e489d8
    RESERVATION	r-266cab48	728213020069	default
    INSTANCE	i-b8e489d8	ami-76837d1f	ec2-50-16-80-159.compute-1.amazonaws.com	domU-12-31-38-07-1E-28.compute-1.internal	running	aquarius2	0	t1.micro	2011-09-27T14:34:25+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.16.80.159	10.223.29.210			ebs		paravirtual	
    BLOCKDEVICE	/dev/sda1	vol-59155833	2011-09-27T14:35:03.000Z	
    BLOCKDEVICE	/dev/sdi	vol-5d155837	2011-09-27T14:35:03.000Z	
    BLOCKDEVICE	/dev/sdh	vol-53155839	2011-09-27T14:35:03.000Z


CONNECT TO RESCUE INSTANCE
ssh root@ec2-50-16-80-159.compute-1.amazonaws.com
    OK


ec2-detach-volume vol-dafa05b0
ec2-attach-volume vol-dafa05b0 -i i-b8e489d8 -d /dev/sdj
ec2dvol vol-dafa05b0
    VOLUME	vol-dafa05b0	15	snap-f7476f98	us-east-1a	in-use	2011-08-08T15:44:21+0000
    ATTACHMENT	vol-dafa05b0	i-b8e489d8	/dev/sdj	attached	2011-09-27T14:58:21+0000


MOUNT DOWNED INSTANCE VOLUME ON RESCUE INSTANCE:

mount /dev/sdj /mnt
 

CHECK LOGS:

Linux Log files and usage

/var/log/messages : General log messages
/var/log/boot : System boot log
/var/log/debug : Debugging log messages
/var/log/auth.log : User login and authentication logs
/var/log/daemon.log : Running services such as squid, ntpd and others log message to this file
/var/log/dmesg : Linux kernel ring buffer log
/var/log/dpkg.log : All binary package log includes package installation and other information
/var/log/faillog : User failed login log file
/var/log/kern.log : Kernel log file
/var/log/lpr.log : Printer log file
/var/log/mail.* : All mail server message log files
/var/log/mysql.* : MySQL server log file
/var/log/user.log : All userlevel logs
/var/log/xorg.0.log : X.org log file
/var/log/apache2/* : Apache web server log files directory
/var/log/lighttpd/* : Lighttpd web server log files directory
/var/log/fsck/* : fsck command log
/var/log/apport.log : Application crash report / log file


To view log files at shell prompt

Use tail, more, less and grep command.

tail -f /var/log/apport.log
more /var/log/xorg.0.log
cat /var/log/mysql.err
less /var/log/messages
grep -i fail /var/log/boot
em /mnt/var/log/syslog
    /etc/postfix/main.cf: No such file or directory
em /mnt/var/log/kern.log
em dmesg




View log files using GUI tools using the GNOME System Log Viewer

System Log Viewer is a graphical, menu-driven viewer that you can use to view and monitor your system logs. System Log Viewer comes with a few functions that can help you manage your logs, including a calendar, log monitor and log statistics display. System Log Viewer is useful if you are new to system administration because it provides an easier, more user-friendly display of your logs than a text display of the log file. It is also useful for more experienced administrators, as it contains a calendar to help you locate trends and track problems, as well as a monitor to enable you to continuously monitor crucial logs.


You can start System Log Viewer in the following ways:

Click on System menu > Choose Administration > System Log:


    
    
</entry>
<entry [Tue 2011:05:17 13:27:16 EST] SCP FROM HP TO 8e>

cd /agua/0.6/html/plugins/view/jbrowse

scp -r -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
species.tar.gz \
root@ec2-184-73-140-253.compute-1.amazonaws.com:/data/jbrowse/0.6
    
</entry>
<entry [Sun 2011:05:15 01:39:50 EST] FIX MICRO REBOOT>

1. COMMENT OUT cloudconfig LINE IN /etc/fstab

proc         /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1    /               ext3    defaults            0       0
/dev/sdb1    /mnt            auto    defaults,nobootwait 0       0
#/dev/sdb1      /mnt    auto    defaults,comment=cloudconfig    0       0


2. REINSTALL cloud-init 

l="deb http://archive.ubuntu.com/ubuntu lucid-proposed main"
echo "$l" | sudo tee -a /etc/apt/sources.list
sudo apt-get update && sudo apt-get install cloud-init
dpkg-query --show cloud-init

    cloud-init	0.5.10-0ubuntu1.5


3. ADD A BOOT SCRIPT THAT WILL REMOVE A NEW LINE /etc/fstab WRITTEN BY cloud-config


crontab -e
@reboot /etc/fstab-fix.pl /etc/fstab &> /etc/fstab-fix.out


AND FINALLY THIS WORKS THE PROGRAMMATIC WAY:

( crontab -l ; echo "@reboot /etc/fstab-fix.pl /etc/fstab &> /etc/fstab-fix.out") | crontab -


4. REBOOT INSTANCE 

    OK!!!!


First Cup of Ubuntu
 
Join Date: Oct 2008
Beans: 10
Re: Changing crontab but can't restart cron
I believe you can make changes to your user's crontab by using the crontab binary and cron will automatically pick up these changes after you save the file. I could be wrong, but I think editing the crontab manually using vi or nano would require you to reload crond by the method you described above or by killing it and rerunning it. 

try crontab -e and see if that works for ya.


 
NOTES
-----


./fstab-fix.pl fstab
Completed ./fstab-fix.pl

root@ip-10-122-5-98:/tmp/etc# cat fstab
# REMOVED: /dev/sdb1	/mnt	auto	defaults,comment=cloudconfig	0	0
proc         /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1    /               ext3    defaults            0       0
/dev/sdb1    /mnt            auto    defaults,nobootwait 0       0

root@ip-10-122-5-98:/tmp/etc# cat fstab.bkp 
# REMOVED: /dev/sdb1	/mnt	auto	defaults,comment=cloudconfig	0	0
proc         /proc           proc    nodev,noexec,nosuid 0       0
/dev/sda1    /               ext3    defaults            0       0
/dev/sdb1    /mnt            auto    defaults,nobootwait 0       0

/dev/sdb1	/mnt	auto	defaults,nobootwait,comment=cloudconfig	0	0


<!--

#!/usr/bin/perl -w

=head2

    APPLICATION         fstab-fix
    
    PURPOSE
    
        REMOVE A LINE ADDED TO /etc/fstab BY cloud-init WHICH
        
        STOPS t1.micro INSTANCES FROM REBOOTING

=cut 

use strict;

my $file = $ARGV[0];
print "No file supplied\n" and exit if not defined $file;

open(FILE, $file) or die "Can't open file: $file\n";
my @lines = <FILE>;
close(FILE) or die "Can't close file: $file\n";

for ( my $i = 0; $i < $#lines + 1; $i++ )
{
    my $line = $lines[$i];
    next if $line =~ /^#/;
    
    if ( $line =~ /comment=cloudconfig/ )
    {
        splice @lines, $i, 1;
        $i--;
    }
}

open(OUT, ">$file") or die "Can't open file: $file\n";
foreach my $line ( @lines ) {   print OUT $line;    }
close(OUT) or die "Can't close file: $file\n";

print "Completed $0\n";
print `date`;

-->


</entry>
<entry [Sat 2011:05:14 00:31:08 EST] DETACH VOLUME, PROBE AND REATTACH>

MOUNT ON PROBE
==============
export VOLUME=vol-1554f27e
export INSTANCE=i-ffa04a91
export PROBE=i-f5bd579b
export PROBE_IP=ec2-50-17-57-12.compute-1.amazonaws.com

# DETACH ROOT VOLUME FROM 8e AND ATTACH TO EXPLORATORY:
ec2-stop-instances $INSTANCE
ec2-detach-volume $VOLUME
ec2-describe-volumes $VOLUME
ec2-attach-volume -i $PROBE -d /dev/sdx $VOLUME

# ON EXPLORATORY:
ssh -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@$PROBE_IP

mkdir -p /mnt/8e
mount /dev/sdx /mnt/8e


REMOUNT
=======

umount /mnt/8e

ec2-detach-volume $VOLUME
ec2-describe-volumes $VOLUME
ec2-attach-volume -i $INSTANCE -d /dev/sda1 $VOLUME
ec2-start-instances $INSTANCE
ec2-describe-instances $INSTANCE

    
    

</entry>
<entry [Fri 2011:05:13 12:51:06 EST] EC2 COMMANDS>
    
GRANT PERMISSION
ec2-modify-image-attribute ami-fa669293 -l -a 558277860346
    launchPermission        ami-fa669293    ADD     userId  558277860346

SHOW OPEN PORTS IN SECURITY GROUP
ec2-describe-group
    GROUP	sg-0a0da063	558277860346	default	default group	
    PERMISSION	558277860346	default	ALLOWS	tcp	0	65535	FROM	USER	558277860346	NA

OPEN A PORT
ec2-authorize default -p 3306 -P udp
    PERMISSION		default	ALLOWS	udp	3306	3306	FROM	CIDR	0.0.0.0/0	ingress

LAUNCH AN INSTANCE (STARCLUSTER u10.05 64-bit HADOOP)
ec2-run-instances \
ami-b07985d9 \
-g default \
-k aquarius \
--instance-type t1.micro \
-z us-east-1a

CONNECT 
ssh -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@ec2-50-17-6-155.compute-1.amazonaws.com

CREATE A DEVICE
cd /dev
sudo /sbin/MAKEDEV sdf 

SHOW PARTITIONS
fdisk -l


</entry>

<entry [Fri 2011:05:13 12:50:36 EST] AMAZON USER IDS>

SYOUNG          728213020069
STUARTPYOUNG    913944561404
GUNEY           503401961460
JGILBERT        558277860346
KNYUTEMANS      684733399587
YUCHING         983300124420

</entry>
<entry [Sun 2011:04:24 17:48:18 EST] JGILBERT CREDENTIALS>
    
JGILBERT    558277860346

THESE FILES ARE IDENTICAL:
/nethome/admin/.keypairs/private.pem
/nethome/jgilbert/aws/.keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem

ec2-add-keypair \
-K /nethome/admin/.keypairs/private.pem \
-C /nethome/admin/.keypairs/public.pem \
id_rsa-admin-key \
> /nethome/admin/.starcluster/id_rsa-admin-key

export AMAZON_USER_ID=558277860346
export AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
export AWS_SECRET_ACCESS_KEY=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
export EC2_PRIVATE_KEY=/nethome/jgilbert/aws/.keypair/pk-APKAJLSLZIS4DAQYFRFQ.pem
export EC2_CERT=/nethome/jgilbert/aws/.keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem
export EC2_AMITOOL_HOME=/home/ec2
export EC2_APITOOL_HOME=/home/ec2
export EC2_HOME=/home/ec2
export JAVA_HOME=/usr
PATH=$EC2_AMITOOL_HOME/bin:$PATH

KEYPAIRS
ec2-describe-keypairs
    KEYPAIR	ec2-keypair1	48:18:33:d1:5a:4b:25:53:01:c6:c0:c9:d3:2a:ac:6c:0e:d1:f4:43
    KEYPAIR	aquarius	03:b7:c5:f0:a6:e7:6b:af:3d:8a:68:ff:ec:f1:d6:05
    KEYPAIR	id_rsa-admin-key	8b:d9:db:a1:8f:f5:3b:2e:9d:a2:ef:fb:87:9f:f4:01:43:d1:25:35
    KEYPAIR	id_rsa-jgilbert-key	cc:63:81:5b:c1:6a:00:4b:a8:e8:17:c8:7d:cb:68:4d:01:bf:07:71
    KEYPAIR	id_rsa-starcluster-1	cb:f9:77:bc:ed:c6:fb:91:3f:a2:12:a5:f0:ea:bc:ae:1a:a7:7c:41
    KEYPAIR	agua	0d:d8:03:2c:72:81:68:36:67:41:bf:db:28:a5:f1:33:9e:97:8b:02

</entry>
<entry [Sun 2011:04:24 21:09:12 EST] JGILBERT KEY FILES>
    
    PRINT ec2privatekey

emacs /nethome/jgilbert/aws/.keypair/pk-APKAJLSLZIS4DAQYFRFQ.pem
-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw		
-----END PRIVATE KEY-----

PRINT ec2publiccert:

emacs /nethome/jgilbert/aws/.keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem
-----BEGIN CERTIFICATE-----
MIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlk     C/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E	
-----END CERTIFICATE-----


amazonuserid=558277860346&awsaccesskeyid=AKIAJWZIAB2ZZB7FHJIQ&awssecretaccesskey=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&ec2publiccert=-----BEGIN CERTIFICATE-----\nMIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlk     C/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=\n-----END CERTIFICATE-----&ec2privatekey=-----BEGIN PRIVATE KEY-----\nMIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==\n-----END PRIVATE KEY-----    

</entry>

<entry [Sun 2011:04:24 18:33:25 EST] WHICH KEY FOR WHICH EC2 SERVICE>
http://docs.amazonwebservices.com/AWSSecurityCredentials/1.0/AboutAWSCredentials.html#X509Credentials


Use the EC2 command line tools	            X.509 Certificates
Launch or connect to an EC2 instance	    Amazon EC2 Key Pairs
Bundle an EC2 AMI	                        X.509 Certificates & AWS Account ID
Upload an EC2 AMI	                        Access Keys
Share an EC2 AMI or EBS snapshot	        Recipient's AWS Account ID


Make a REST or Query API request to AWS product	    Access Keys	
Make a SOAP API request to S3 	                    Access Keys
Make a SOAP API request to Mechanical Turk          Access Keys
Make a SOAP API request to other AWS product	    X.509 Certificates
AWS Management Console	                            E-mail Address and Password
Access AWS Discussion Forums                        E-mail Address and Password
Access AWS Premium Support                          E-mail Address and Password
Create signed URL for CloudFront private content	Amazon CloudFront Key Pairs


</entry>

<entry [Sun 2011:04:24 17:50:48 EST] AQUARIUS-7 INSTANCE INFO>

i-b42f3fd9
ec2-75-101-214-196.compute-1.amazonaws.com
ip-10-127-158-202.ec2.internal

</entry>

<entry [Tue 2011:04:19 14:43:02 EST] stuartpyoung CREDENTIALS>

STUARTPYOUNG

amazonuserid	913944561404
awsaccesskeyid	AKIAJCICVKEQEEE7CYOA
awssecretaccesskey	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

HP UBUNTU 10.10 .bash_profile

#### ec2

export AMAZON_USER_ID=913944561404
export AWS_ACCESS_KEY_ID=AKIAJCICVKEQEEE7CYOA
export AWS_SECRET_ACCESS_KEY=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
export PATH=/usr/share/ec2/1.4.2.4/bin:$PATH
export EC2_HOME=/usr/share/ec2/1.4.2.4
export JAVA_HOME=/usr/java/jre1.6.0_24
export EC2_PRIVATE_KEY=/home/syoung/22-agua/cloud/AWS/keypair/agua.pem
export EC2_CERT=/nethome/jgilbert/aws/.keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem


CONNECT TO AQUARIUS-7

ssh -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem \
root@ec2-75-101-214-196.compute-1.amazonaws.com

    OK

COPIED AQUARIUS-7 .bash_profile TO /home/syoung/notes/bash/aquarius

mkdir -p /home/syoung/notes/bash/aquarius
cd /home/syoung/notes/bash/aquarius
scp -i /home/syoung/22-agua/cloud/AWS/keypair/agua.pem \
root@ec2-75-101-214-196.compute-1.amazonaws.com:.bash_profile ./


</entry>

<entry [Sun 2011:04:24 17:48:37 EST] YUCHING CREDENTIALS
>

emacs /root/.aws/aws.sh
#!/bin/bash
export AMAZON_USER_ID=983300124420
export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-APKAJLSLZIS4DAQYFRFQ.pem
export EC2_CERT=/root/base/apps/ec2/keypair/rsa-APKAJLSLZIS4DAQYFRFQ.pem
export AWS_ACCESS_KEY_ID=AKIAI6A6W55JJGZAUZJQ
export AWS_SECRET_ACCESS_KEY=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
export EC2_AMITOOL_HOME=/home/ec2
export EC2_APITOOL_HOME=/home/ec2
export EC2_HOME=/home/ec2
export JAVA_HOME=/usr
PATH=$EC2_AMITOOL_HOME/bin:$PATH
    
</entry>
