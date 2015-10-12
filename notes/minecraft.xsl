minecraft



<entry [Sat 2015:01:17 18:15:11 EST] INSTALL MINECRAFT ON UBUNTU 14.04>


sudo add-apt-repository ppa:minecraft-installer-peeps/minecraft-installer

sudo apt-get update

sudo apt-get install minecraft-installer

	
</entry>
<entry [Sat 2014:03:15 11:55:53 EST] INSTALL MINECRAFT ON ALIEN 13.04>

1. ADD PPA TO APT-GET

add-apt-repository ppa:minecraft-installer-peeps/minecraft-installer 

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1024R/DA39203D


emacs -nw /etc/apt/sources.list

deb http://ppa.launchpad.net/minecraft-installer-peeps/minecraft-installer/ubuntu YOraring main 
deb-src http://ppa.launchpad.net/minecraft-installer-peeps/minecraft-installer/ubuntu raring main 	
	

2. INSTALL

apt-get update
apt-get install minecraft



</entry>
<entry [Wed 2013:05:22 10:41:08 EST] CONNECTED TO SPOT INSTANCE FROM HOME>

SUMMARY: OPEN PORTS IN minecraft GROUP USING COMMAND LINE TO ENSURE THEY ARE OPENED (DOING ec2dgrp DID NOT SHOW PORTS OPENED USING THE AWS CONTROL PANEL)

1. EXPORT KEYS
    
export EC2_PRIVATE_KEY=/home/syoung/notes/agua/keypair/invasionmoo/pk-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem
export EC2_CERT=/home/syoung/notes/agua/keypair/invasionmoo/cert-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem
export AWS_ACCESS_KEY_ID=AKIAJ567Y4UVQTYT64HA
export AWS_SECRET_ACCESS_KEY=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


2. GET EXTERNAL IP

ec2-174-129-62-94.compute-1.amazonaws.com


3. CONNECT

ssh -i /home/syoung/notes/agua/keypair/invasionmoo/id-minecraft-keypair \
ec2-user@ec2-174-129-62-94.compute-1.amazonaws.com
    

4. INSTALL MINECRAFT CLIENT ON LAPTOP

SEE [Fri 2013:05:03 17:39:28 EST] INSTALL MINECRAFT CLIENT ON UBUNTU


5. OPEN PORT 25565 ON NETGEAR ROUTER

ec2-authorize minecraft -p 25565 -P tcp
ec2-authorize minecraft -p 25565 -P udp


VERIFY

telnet 174.129.62.94 25565

    OK


    
</entry>
<entry [Fri 2013:05:03 17:49:02 EST] PORT FORWARDING>


http://superuser.com/questions/280660/allowing-a-friend-to-connect-over-the-internet-to-a-minecraft-server-ive-hosted


Here's what the scheme of things probably looks like:

┌───────────┐             ┌────────┐           ┌────────┐             ┌──────────┐
│ Your      │192.168.0.2  │ Your   │82.15.X.Y  │ Friend │192.168.0.1  │ Friend   │
│ computer  ├─────────────┤ router ├───────────┤ router ├─────────────┤ computer │
├───────────┤  192.168.0.1└────────┘  78.13.Z.T└────────┘  192.168.0.2└──────────┘
│ Minecraft ├ Port 25565
└───────────┘

└───────────────────────────┘ └───────────────────┘ └────────────────────────────┘
      Your home network           Teh Internets            Friend home network

Your minecraft server is listening is listening on port 25565 of your home computer, 192.168.0.2.
However, this is a private address that only makes sense when connected to your router.

Each router has its own private addresses, which means that your computer can be on 192.168.0.2,
your friend computer can also be on 192.168.0.2 and everything is still okay.

To connect to you, your friend needs the IP address your router is connected to the internet with.
Your ISP (more or less) dynamically assigns this number to you and it's what those "what is my ip"
sites show to you. So, to your friend, you're 82.15.X.Y, and that's what he will enter on Minecraft.

However, 82.15.X.Y is not your computer, but your router. Your router doesn't know what to do with
connections to that port and rejects the connection. What now?

Your router needs to know that, if he sees attempts to connect to port 25565 (Minecraft servers'
default listening port), he should forward those connections to the computer on address 192.168.0.2
— this is port forwarding.

To make port forwarding work, you need two things:

A static IP address in your home network. You can get this by configuring static allocation DHCP,
so that your computer* always gets the same IP address (say, 192.168.0.200).

The port forwarding information (forward all connections to port 25565 to 192.168.0.200).

The exact configuration process depends by your router make and model. Sites like portforward.com
have extended guides to get this working.

    
</entry>
<entry [Fri 2013:05:03 17:39:28 EST] INSTALL MINECRAFT CLIENT ON UBUNTU>

1. EDIT /etc/apt/sources.list

em /etc/apt/sources.list

ADD

deb http://archive.grahamedgecombe.com stable main
deb-src http://archive.grahamedgecombe.com stable main


2. ADD THE PUBLIC KEY

cd /tmp
curl http://grahamedgecombe.com/graham.asc > graham.asc
sudo apt-key add graham.asc
rm -f graham.asc


3. INSTALL THE CLIENT

sudo apt-get update
sudo apt-get install minecraft-installer


4. (OPTIONAL) INSTALL THE SERVER

sudo apt-get update
sudo apt-get install minecraft-server-installer


5. START MINECRAFT

/usr/games/minecraft


    
</entry>
<entry [Fri 2013:05:03 17:23:55 EST] TROUBLESHOOTING EC2-API 'unexpected error'>


PROBLEM

ec2din

    Unexpected error:
    org.codehaus.xfire.fault.XFireFault: General security error; nested exception is: 
        java.security.cert.CertificateException: Unable to initialize, java.io.IOException: DerInputStream.getLength(): lengthTag=127, too big.


DIAGNOSIS

YOU MIGHT HAVE USED WRONG TAB TO GENERATE THE X.509 PRIVATE KEY AND CERTIFICATE

GOOD (;;)   'X.509 Certificates'

BAD XXXXX   'Key Pairs'


    
</entry>
<entry [Fri 2013:05:03 17:22:55 EST] TROUBLESHOOTING SSH ERROR: 'Permission denied (publickey)'>

PROBLEM

SPOT INSTANCE STARTS OKAY:

ec2-request-spot-instances \
--region us-east-1 \
--price 0.80 \
--key id-minecraft-keypair \
--group minecraft \
--instance-type m1.medium \
ami-1624987f

EXTERNAL IP:    ec2-174-129-62-94.compute-1.amazonaws.com

BUT CAN'T CONNECT:

THIS FAILS:

ssh -i /mnt/home/syoung/notes/agua/keypair/invasionmoo/id-minecraft-keypair \
ec2_user@ec2-174-129-62-94.compute-1.amazonaws.com

BUT 5 MINS LATER IT WORKS

ssh -i /mnt/home/syoung/notes/agua/keypair/invasionmoo/id-minecraft-keypair \
ec2-user@ec2-174-129-62-94.compute-1.amazonaws.com
    
    Permission denied (publickey).
    

DIAGNOSIS

AUTHENTICATION LATENCY FOR SPOT INSTANCES (?)


    
SOLUTION

1. WAIT A WHILE AND RETRY (WORKS!)

2. RUN AN ON-DEMAND INSTANCE


ec2-run-instances \
ami-1624987f \
-g default \
-k aguadev \
--instance-type m1.small \
-z us-east-1a

    
</entry>
<entry [Fri 2013:05:03 16:26:56 EST] STARTED m1.small SPOT INSTANCE>

1. START SPOT INSTANCE

ec2-request-spot-instances \
--region us-east-1 \
--price 0.80 \
--key id-minecraft-keypair \
--group minecraft \
--instance-type m1.medium \
ami-1624987f

    SPOTINSTANCEREQUEST	sir-75af8a32	0.800000	one-time	Linux/UNIX	open	2013-05-03T16:26:19-0700						ami-1624987f	m1.medium	id-minecraft-keypair	sg-38827153				monitoring-disabled

    
2. GET IP

ec2din

RESERVATION	r-521b813e	380324225381	minecraft
INSTANCE	i-350d2c5a	ami-1624987f	ec2-174-129-62-94.compute-1.amazonaws.com	ip-10-194-247-192.ec2.internal	running	id-minecraft-keypair	0		m1.medium	2013-05-03T23:27:40+0000	us-east-1a	aki-88aa75e1			monitoring-disabled	174.129.62.94	10.194.247.192			ebs	spot	sir-75af8a32			paravirtual	xen	24b2f115-9e4b-4d7b-b533-93f78a735ace	sg-38827153	default	false	
BLOCKDEVICE	/dev/sda1	vol-b02ac0e8	2013-05-03T23:27:43.000Z	true	

    
3. ASSIGN EASY IP invasionmoo.no-ip.biz TO EXTERNAL IP 174.129.62.94

https://www.noip.com/members/dns/

www.no-ip.com
account: invasionmoo
pass: yep


4. CONNECT TO SERVER

ssh -i /mnt/home/syoung/notes/agua/keypair/invasionmoo/id-minecraft-keypair ec2-user@ec2-174-129-62-94.compute-1.amazonaws.com

    OK

ssh -i /mnt/home/syoung/notes/agua/keypair/invasionmoo/id-minecraft-keypair ec2-user@ 

    OK

ssh -i /mnt/home/syoung/notes/agua/keypair/invasionmoo/id-minecraft-keypair \
ec2_user@invasionmoo.no-ip.biz

    Warning: Permanently added 'invasionmoo.no-ip.biz,174.129.62.94' (RSA) to the list of known hosts.
    Permission denied (publickey).


5. INSTALL MINECRAFT

mkdir /minecraft
cd /minecraft
wget http://minecraft.net/download/minecraft_server.jar

java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui


    
</entry>
<entry [Sun 2013:04:14 15:07:27 EST] INSTALLED MINECRAFT ON EC2>

ACCOUNT ID
3803-2422-5381

AWS_ACCESS_KEY_ID
AKIAJ567Y4UVQTYT64HA

AWS_SECRET_ACCESS_KEY
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

EC2_PRIVATE_KEY
/mnt/home/syoung/notes/agua/keypair/invasionmoo/pk-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem

EC2_CERT
mnt/home/syoung/notes/agua/keypair/invasionmoo/cert-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem

AWS ACCOUNT ID
3803-2422-5381

CANONICAL USER ID
dc469710fec0adfc05ec07673076779b274d9cbb7267b803186c897ae8468f7b


1. CREATE minecraft SECURITY GROUP

ec2-add-group minecraft


2. OPEN PORTS TO ENABLE SSH ACCESS AND MINECRAFT PORT

NB: IN minecraft SECURITY GROUP

ec2-authorize minecraft -p 22       #### SSH
ec2-authorize minecraft -p 80       #### HTTP
ec2-authorize minecraft -p 65535    #### MINECRAFT


3. CREATE X.509 KEYPAIR (PRIVATE KEY pk-*.pem + PUBLIC CERT cert-*.pem FOR USING ec2-api-tools

AWS CONSOLE -> Security Credentials -> Access Credentials -> X.509 Certificates

    cert-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem
    pk-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem


NB: NORMALLY PUT THESE IN ~/.ec2 BUT INSTEAD KEEP THESE IN keypair/invasionmoo



4. INSTALL EC2 API TOOLS (REQUIRES java)

apt-get install ec2-api-tools
    OK


5. CREATE ACCESS KEY + SECRET ACCESS KEY FOR SSH ACCESS

AWS CONSOLE -> Security Credentials -> Create a New Access Key

    AWS_ACCESS_KEY_ID
    AKIAJ567Y4UVQTYT64HA
    
    AWS_SECRET_ACCESS_KEY
    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


6. EXPORT KEY LOCATIONS

export EC2_PRIVATE_KEY=/mnt/home/syoung/notes/agua/keypair/invasionmoo/pk-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem
export EC2_CERT=/mnt/home/syoung/notes/agua/keypair/invasionmoo/cert-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem
export AWS_ACCESS_KEY_ID=AKIAJ567Y4UVQTYT64HA
export AWS_SECRET_ACCESS_KEY=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


7. TEST ACCESS TO ACCOUNT USING ec2-api-tools

ec2-describe-regions

SEE TROUBLESHOOTING 'unexpected error'

8. GENERATE SSH KEYS (RSA private key) 

cd /mnt/home/syoung/notes/agua/keypair/invasionmoo
ec2-add-keypair minecraft > id-minecraft.keypair
chmod 600 id-minecraft.keypair

.. BUT DIDN'T APPEAR IN AWS CONSOLE, ALTHOUGH IT APPEARS ON COMMAND LINE:

 ec2-describe-keypairs
 
    KEYPAIR	id-minecraft-keypair	76:85:cb:01:b9:a4:dc:1e:c5:cf:91:6c:e6:d3:43:a5:72:ea:d2:4e

 
SO, JUST IN CASE, CREATED KEYPAIR IN AWS CONSOLE:

Key Pairs -> Create Key Pair

    Key Pair Name: minecraft
    Fingerprint: 1f:6b:65:27:71:4c:a7:13:08:d2:49:fa:9f:23:42:b6:03:09:e2:68

KEY minecraft SAVED TO:
    
/mnt/home/syoung/notes/agua/keypair/invasionmoo/minecraft.pem


TEST:

ssh -i /mnt/home/syoung/notes/agua/keypair/invasionmoo/minecraft.pem root@HOSTNAME

OR, USE config FILE:

# contents of $HOME/.ssh/config
Host invasionmoo
Hostname invasionmoo.no-ip.biz
User ec2-user 
IdentityFile /mnt/home/syoung/notes/agua/keypair/invasionmoo/minecraft.pem

CONNECT:

ssh invasionmoo


   
9. START SPOT INSTANCE

ec2-request-spot-instances \
--region us-east-1 \
--price 0.80 \
--key id-minecraft-keypair \
--group minecraft \
--instance-type m1.medium \
ami-1624987f

    SPOTINSTANCEREQUEST	sir-08f1e235	0.600000	one-time	Linux/UNIX	open	2013-04-14T19:07:22-0700						ami-1624987f	m1.medium	id-minecraft-keypair	sg-38827153				monitoring-disabled


ec2-describe-spot-instance-requests 
SPOTINSTANCEREQUEST	sir-08f1e235	0.600000	one-time	Linux/UNIX	open	2013-04-14T19:07:22-0700						ami-1624987f	m1.medium	id-minecraft-keypair	sg-38827153				monitoring-disabled		us-east-1a


MONITOR SPOT INSTANCES:

/usr//bin/ec2-describe-spot-price-history | grep m1.small

listec2 | grep spot
/usr//bin/ec2-cancel-spot-instance-requests
/usr//bin/ec2-create-spot-datafeed-subscription
/usr//bin/ec2-delete-spot-datafeed-subscription
/usr//bin/ec2-describe-spot-datafeed-subscription
/usr//bin/ec2-describe-spot-instance-requests
/usr//bin/ec2-describe-spot-price-history
/usr//bin/ec2-request-spot-instances


CONNECT

ssh -i /mnt/home/syoung/notes/agua/keypair/invasionmoo/id-minecraft-keypair \
ec2-user@ec2-50-17-104-205.compute-1.amazonaws.com

    OK!!
    

8. CREATE EASY-TO-REMEMBER 'no-ip' ADDRESS FOR KIDS

www.no-ip.com
account: invasionmoo
pass: yep


CREATED THIS IP address Amazon provided:

invasionmoo.no-ip.biz


CREATED MAPPING BETWEEN NO-IP ADDRESS AND AMAZON ELASTIC IP:

https://www.noip.com/members/dns/


CONNECT TO INSTANCE USING NO-IP ADDRESS:

ssh -i /mnt/home/syoung/notes/agua/keypair/invasionmoo/pk-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem root@invasionmoo.no-ip.biz

ssh -i /mnt/home/syoung/notes/agua/keypair/invasionmoo/pk-ZQ4GRHZP4YZZ5NTYKEXIZA5ORA3RVBEX.pem ec2-user@invasionmoo.no-ip.biz

   
   
8. CHECK EC2 SPOT PRICING
http://aws.amazon.com/ec2/spot-instances/#7   

Standard Spot Instances

                Linux/UNIX Usage	Windows Usage
Small (Default)	$0.007 per Hour	    $0.017 per Hour
Medium	        $0.013 per Hour	    $0.033 per Hour
Large	        $0.026 per Hour	    $0.066 per Hour
Extra Large	    $0.052 per Hour	    $0.132 per Hour


COMPARED TO ON-DEMAND INSTANCES:

            	Linux/UNIX Usage	Windows Usage
Standard On-Demand Instances
Small (Default)	$0.060 per Hour	    $0.091 per Hour
Medium	        $0.120 per Hour	    $0.182 per Hour
Large	        $0.240 per Hour	    $0.364 per Hour
Extra Large	    $0.480 per Hour	    $0.728 per Hour



NOTE: FREE TIER   
http://aws.amazon.com/ec2/pricing/

Free Tier*

As part of AWS’s Free Usage Tier, new AWS customers can get started with Amazon EC2 for free. Upon sign-up, new AWS customers receive the following EC2 services each month for one year:

750 hours of EC2 running Linux/Unix Micro instance usage
750 hours of EC2 running Microsoft Windows Server Micro instance usage
750 hours of Elastic Load Balancing plus 15 GB data processing
30 GB of Amazon EBS Standard volume storage plus 2 million IOs and 1 GB snapshot storage
15 GB of bandwidth out aggregated across all AWS services
1 GB of Regional Data Transfer


EC2 API COMMAND

ec2-request-spot-instances ami-1a2b3c4d -p 0.04 --key gsg-keypair --group default --instance-type m1.small -n 3 --type one-time

SPOTINSTANCEREQUEST	sir-1a2b3c4d	0.040000	one-time	Linux/UNIX	open	YYYY-MM-DDTHH:MM:SS-0800						ami-1a2b3c4d	m1.small	gsg-keypair	sg-1a2b3c4d				monitoring-disabled			
SPOTINSTANCESTATUS	pending-evaluation	YYYY-MM-DDTHH:MM:SS-0800	Your Spot request has been submitted for review, and is pending evaluation.
SPOTINSTANCEREQUEST	sir-2a2b3c4d	0.040000	one-time	Linux/UNIX	open	YYYY-MM-DDTHH:MM:SS-0800						ami-1a2b3c4d	m1.small	gsg-keypair	sg-1a2b3c4d				monitoring-disabled			
SPOTINSTANCESTATUS	pending-evaluation	YYYY-MM-DDTHH:MM:SS-0800	Your Spot request has been submitted for review, and is pending evaluation.
SPOTINSTANCEREQUEST	sir-3a2b3c4d	0.040000	one-time	Linux/UNIX	open	YYYY-MM-DDTHH:MM:SS-0800						ami-1a2b3c4d	m1.small	gsg-keypair	sg-1a2b3c4d				monitoring-disabled			
SPOTINSTANCESTATUS	pending-evaluation	YYYY-MM-DDTHH:MM:SS-0800	Your Spot request has been submitted for review, and is pending evaluation.



    
</entry>
<entry [Sun 2012:11:04 01:41:18 EST] INSTALLED BRAID>

1. BOUGHT BRAID

The email below should show up in your inbox soon! If it never shows up, please contact us and let us know which email provider you are using.
Thanks for purchasing Braid! To access your DRM-free game for Windows, Mac, and Linux just follow this link:

Unique Humble URL:

https://www.humblebundle.com/s?key=mmBPUxNGKcUk

Please save this email so that you can download Braid again whenever you'd like in the future. We will keep your copy online at the above URL for the foreseeable future. Please make a local backup though, to save bandwidth.

If you have any problems, please contact us and we will get it sorted out, ASAP.

Thanks again!

Humble Store


2. INSTALL DEPENDENCIES

apt-get install nvidia-cg-toolkit

    You might want to run 'apt-get -f install' to correct these:
    The following packages have unmet dependencies:
     nvidia-cg-toolkit : Depends: libcg (= 3.1.0013-1) but it is not going to be installed
                         Depends: libcggl (= 3.1.0013-1) but it is not going to be installed
                         Depends: nvidia-cg-dev (= 3.1.0013-1) but it is not going to be installed
                         Depends: freeglut3 but it is not going to be installed
    E: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a solution).

apt-get -f install
    OK


3. INSTALL BRAID

cd /mnt/syoung/software/braid
sudo dpkg -i braid_1.0.0-0ubuntu2_amd64.deb 

    Selecting previously unselected package braid.
    (Reading database ... 169236 files and directories currently installed.)
    Unpacking braid (from braid_1.0.0-0ubuntu2_amd64.deb) ...
    dpkg: dependency problems prevent configuration of braid:
     braid depends on nvidia-cg-toolkit; however:
      Package nvidia-cg-toolkit is not installed.


cd /mnt/syoung/software/braid
apt-get install nvidia-cg-toolkit

    
</entry>
<entry [Sun 2012:11:04 01:32:10 EST] INSTALL MINECRAFT MOD ON LINUX>


http://www.youtube.com/watch?v=eYOkyMm4OEs


Uploaded by MrApples901 on Apr 23, 2011

Minecraft Mod Instructions

1. Download:
http://adf.ly/1xFsU

If the link doesn't work you can download it from: 
http://adf.ly/1xFtG
or www.minecraftforum.net


2. Save it to your desktop. Otherwise drag it from the folder you saved it to to your desktop. This will make it much easier.

3. Right click on "modpack-v4.17_MC.beta.1.5_01.zip". Click Extract Here.

4. Go to Places then Home folder then Click on " ctrl H" Scroll down to the ".minecraft" folder.

5. Open up the "bin" folder.

6. Right click on "minecraft.jar" Click on Archive Manager.

7. Before I forget delete the " META- INF" folder.

8. Next go back to the "modpack-v4.17_MC.beta.1.5_01" Folder on you desktop.

9. Double Click on it to open.

10. Open up classes and drop all the class files into the archive manager window.

11. Next you can close out of that and open Places then Home folder then Click on " ctrl H" Scroll down to the ".minecraft" folder again.

12. Create a new folder. Call it "mods".

13. inside the mods folder create a new folder call " zombe" Spelt without an "I". If you put an "i" this will not work.

14. Next go back to the "modpack-v4.17_MC.beta.1.5_01" Folder on you desktop.

15. Open the "config" folder.

16. copy these files to the " zombe" folder.

17. Open "config.txt" and you can chose what mods you would like to select. For an example I will show you the flying mod.

18. in "config.txt" scroll down to where it say "fly mod - aka. Flying"

19. Delete the hash mark.

20. Now go into Minecraft.

21 Go to options and controls. You will need to change a few controls. Leave everything the same except for :
Drop: C
Sneak: TAB
Inventory: X
Toggle Fog: G

21. Now start your level and click on "f"
In the top left corner you will see that it says "flying".
hold down "e" to go up and hold down "q" to go down. You can use your WASD key as normal to move around.

I hope you enjoyed this tutorial. I hope it was as clear and easy as possible. if you have any question please contact me. I will be happy to help. :)
 
    
*</entry>
<entry [Sat 2012:11:03 21:24:13 EST] INSTALL CHEAT PACK MOD>

***DOESN'T WORK ON LINUX??****

1. DOWNLOAD CHEAT PACK MOD

http://minecraft-mods.org/download-file/?download=cheat-pack-mod


2. INSTALL

INSTALL INSTRUCTIONS
http://www.youtube.com/watch?feature=player_embedded&v=hNmMbgFHs0Q


Open .minecraft/ bin
Open Minecraft.jar
Delete the META INF
Drag over all the Cheat Mod Pack files
Done!

DOESN'T WORK.... 

    
</entry>
<entry [Fri 2012:10:26 05:26:55 EST] INSTALLED gitg>

apt-get install gitg
Reading package lists... Done
Building dependency tree       
Reading state information... Done
You might want to run 'apt-get -f install' to correct these:
The following packages have unmet dependencies:
 ia32-sun-java6-bin : Depends: ia32-libs but it is not going to be installed
                      Depends: libc6-i386 but it is not going to be installed
                      Recommends: ia32-libs-gtk
                      Recommends: lib32asound2 but it is not going to be installed
                      Recommends: lib32nss-mdns but it is not going to be installed
 sun-java6-bin : Depends: unixodbc
 sun-java6-source : Depends: sun-java6-jdk (>= 6.24-1build0.8.04.1) but it is not installable
E: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a solution).


apt-get -f install

    
</entry>
<entry [Thu 2012:10:25 19:26:26 EST] INSTALL MINECRAFT ON KIDS TOSHIBA>

1. INSTALL SUN JVM
### DOESN'T WORK: sudo apt-get install sun-java6-jdk sun-java6-plugin

sudo apt-get install java6-sdk

    ...
    Package java6-sdk is a virtual package provided by:
      openjdk-6-jdk 6b24-1.11.4-3ubuntu1
      openjdk-7-jdk 7u7-2.3.2a-1ubuntu1
      default-jdk 1:1.7-43ubuntu3
    You should explicitly select one to install.


apt-get install openjdk-6-jdk

    OK


/usr/lib/jvm/java-6-openjdk-amd64/jre/bin/java -version

    java version "1.6.0_24"
    OpenJDK Runtime Environment (IcedTea6 1.11.4) (6b24-1.11.4-3ubuntu1)
    OpenJDK 64-Bit Server VM (build 20.0-b12, mixed mode)

    
#### THIS HAS CIRCULAR DEPENDENCIES:

DOWNLOAD PAGE
http://security.ubuntu.com/ubuntu/pool/multiverse/s/sun-java6/


# JAVA BIN
http://security.ubuntu.com/ubuntu/pool/multiverse/s/sun-java6/sun-java6-bin_6.24-1build0.8.04.1_i386.deb

# IA32
http://security.ubuntu.com/ubuntu/pool/multiverse/s/sun-java6/ia32-sun-java6-bin_6.24-1build0.8.04.1_amd64.deb

# JRE
http://security.ubuntu.com/ubuntu/pool/multiverse/s/sun-java6/sun-java6-jre_6.24-1build0.8.04.1_all.deb 



dpkg -i sun-java6-bin_6.24-1build0.8.04.1_i386.deb 

dpkg -i ia32-sun-java6-bin_6.24-1build0.8.04.1_amd64.deb 

dpkg -i sun-java6-jre_6.24-1build0.8.04.1_all.deb 


dpkg -i sun-java6-jre_6.24-1build0.8.04.1_all.deb  \
sun-java6-bin_6.24-1build0.8.04.1_i386.deb \
ia32-sun-java6-bin_6.24-1build0.8.04.1_amd64.deb \




# JDK
http://security.ubuntu.com/ubuntu/pool/multiverse/s/sun-java6/sun-java6-jdk_6.24-1build0.8.04.1_amd64.deb

# PLUGIN
http://security.ubuntu.com/ubuntu/pool/multiverse/s/sun-java6/sun-java6-plugin_6.24-1build0.8.04.1_amd64.deb
 

2. INSTALL MINECRAFT

cd /usr/bin
wget https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft.jar
chmod 755 minecraft.jar


3. SET COMMAND TO RUN MINECRAFT

em /usr/bin/minecraft

#!/bin/sh

java -Xmx1024M -Xms512M -cp /usr/bin/minecraft.jar net.minecraft.LauncherFrame

    
</entry>