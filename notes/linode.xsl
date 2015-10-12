linode




<entry [Sat 2014:03:22 10:56:58 EST] LINODE LOGIN>
	
youngstuart
s********

</entry>
<entry [Sun 2014:02:23 05:41:52 EST] RESTARTED CONFLUENCE (NOW JAVA 1.7.0_45)>

3. RESTARTED APACHE AND CONFLUENCE

/usr/sbin/apachectl -k restart

export JAVA_HOME=/root/base/apps/java/1.7.0_45
export JRE_HOME=/root/base/apps/java/1.7.0_45

/usr/share/confluence/bin/shutdown.sh
/usr/share/confluence/bin/startup.sh



/usr/share/confluence/bin/startup.sh


</entry>
<entry [Wed 2011:11:30 08:47:59 EST] FIXED CONFLUENCE MISDIRECT TO www.stuartpyoung.com>


1. CONFLUENCE ADMIN --> GENERAL CONFIGURATION --> SITE CONFIGURATION --> SERVER BASE URL

SET TO

www.aguadev.org



2. CONFLUENCE ADMIN --> REFINED WIKI OriginalTheme --> Manage categories (tabs) --> EDIT


SET TO

http://www.aguadev.org/confluence
     


     
</entry>
<entry [Wed 2011:11:23 22:51:53 EST] SET LINODE TO www.aguadev.org>

1. DISABLED www.stuartpyoung.com IN LINODE CONSOLE

Linode --> DNS MANAGER --> Edit --> SETTINGS --> DISABLE


2. EDITED CONFLUENCE server.xml CONF FILE TO REPLACE stuartpyoung.com WITH aguadev.org

cd /usr/share/confluence-3.0.2-std
grep -r -n stuartpyoung.com *

     conf/server.xml:7:		   proxyName="www.stuartpyoung.com" proxyPort="80"
     conf/server.xml:20:		 < Alias>confluence.stuartpyoung.com< /Alias>

em /usr/share/confluence-3.0.2-std/conf/server.xml


3. RESTARTED APACHE AND CONFLUENCE

/usr/sbin/apachectl -k restart

export JRE_HOME=/root/base/apps/java/jre1.6.0_17
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17


export JRE_HOME=/root/base/apps/java/jre1.6.0_17
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17

/usr/share/confluence/bin/shutdown.sh
/usr/share/confluence/bin/startup.sh

     OK

     
</entry>
<entry [Sat Nov 27 04:17:19 UTC 2010] SET UP www.asiabridgecommunications.com ON LINODE>
     
********** NB: COMMENTED OUT STEP 1 INFO IN httpd.conf  **************


1. EDIT httpd.conf

emacs /etc/httpd/conf/httpd.conf

ADD THIS:
<!--
<VirtualHost *:80>

     DocumentRoot /var/www/html/abc
     ServerName www.asiabridgecommunications.com
     ErrorLog /var/log/httpd/abc-error_log
     CustomLog /var/log/httpd/abc-access_log common

</VirtualHost>

-->
2. RESTART HTTPD

/etc/init.d/httpd restart

     OK!
     

3. CHECK URL

www.asiabridgecommunications.com

     OK



NOTES
-----

VIRTUAL HOST EXAMPLES
http://httpd.apache.org/docs/2.0/vhosts/examples.html

<VirtualHost 172.20.30.50>
DocumentRoot /www/example2
ServerName www.example2.org

# Other directives here ...

</VirtualHost>



</entry>



<entry [Sat Nov 6 04:17:19 UTC 2010] CONNECTED TO starcluster AMI>




PLACED agua.pem ON LINODE:

mkdir -p /root/apps/ec2/keypair

emacs /root/apps/ec2/keypair/agua.pem


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


chmod 400 /root/apps/ec2/keypair/agua.pem

cd /root/apps/ec2/keypair/

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



</entry>
<entry [Tue Aug 24 18:56:32 UTC 2010] NEW LINODE NETWORK SETTINGS>

IP ADDRESS: 173.230.142.248


SSH LOGIN:

user: root
IP  : 173.230.142.248
pass: kumoichi

     OK!


URL: li182-248.members.linode.com

     OK!



CONFLUENCE URL:

li182-248.members.linode.com:8080


FIXED THIS ERROR WITH CONFLUENCE:

     Non Clustered Confluence: Database is being updated by another Confluence instance. Please see http://confluence.atlassian.com/x/mwiyCg for troubleshooting.
     
     Your server id is: BFE9-Z3V6-PKYR-P33M.


Restart confluence:


export JRE_HOME=/root/base/apps/java/jre1.6.0_17
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17

/usr/share/confluence/bin/shutdown.sh
/usr/share/confluence/bin/startup.sh


     OK!


PROBLEM: LINODE DOES NOT MAP TO www.stuartpyoung.com


Current Reverse DNS
IP Address	RDNS
173.230.142.248	 li182-248.members.linode.com


NB: Can find domain contact details and DNS info is called WHOIS search. Many domain registrars provides this facility and it's free to find any info. Here are the good sites to find your domain info.

http://findnameservers.com
http://www.xwhois.com
http://www.dnsstuff.com
http://www.ehostpros.com


ON LINODE:

whois stuartpyoung.com

     Domain Name: STUARTPYOUNG.COM
       Registrar: TUCOWS INC.
       Whois Server: whois.tucows.com
       Referral URL: http://domainhelp.opensrs.net
       Name Server: NS1.LINODE.COM
       Name Server: NS2.LINODE.COM
       Name Server: NS3.LINODE.COM
       Name Server: NS4.LINODE.COM
       Status: ok
       Updated Date: 18-nov-2009
       Creation Date: 18-nov-2004
       Expiration Date: 18-nov-2011
    
    >>> Last update of whois database: Tue, 24 Aug 2010 19:13:44 UTC



NETWORK SETTINGS:

In Linode Manager:

Linodes --> Network Settings

     eth0:	173.230.142.248 ( li182-248.members.linode.com )
     Gateways:	 173.230.142.1
     Netmask:	255.255.255.0
     DNS Servers:	 75.127.97.6

     Current Reverse DNS
     IP Address	RDNS
     173.230.142.248	 li182-248.members.linode.com


BUT SHOULD READ:

eth0: 	74.207.235.81 ( www.stuartpyoung.com )
Gateways: 	74.207.235.1
Netmask: 	255.255.255.0
DNS Servers: 	75.127.97.6
75.127.97.7


Current Reverse DNS
IP Address 	RDNS
74.207.235.81 	www.stuartpyoung.com


CHECKED TUCOWS DNS SETTINGS:

(LOGIN WITH HELPING HOST ACCOUNT)
https://manage.opensrs.net/index.cgi

IN 'Name servers' ARE ADDRESSES:

ns1.linode.com
ns2.linode.com
ns3.linode.com
ns4.linode.com


JUST IN CASE, ADDED AND SAVED:

ns5.linode.com

     OK
     
     
SET THE DOMAIN'S REVERSE DNS:

LinodeManager --> Network tab --> reverse DNS (entry for your Linode's IP address):

NB: use the whole domain name, including the 'www':

www.stuartpyoung.com


SO DID SO TO UPDATE THE IP ADDRESS (CHANGED FROM 74.207.235.81 TO 173.230.142.248):


BUT STILL DIDN'T WORK SO CREATED A LINODE TROUBLE TICKET.


Tue Aug 24 19:54:38 UTC 2010



RESULT:


LINODE MESSAGED BACK THAT IT WAS WORKING (AFTER SOME UNSPECIFIED FIX OR MAYBE JUST LAG TIME)



</entry>



<entry [Thu Jun 17 14:49:03 EDT 2010] PADDLE TOOL INSTALLED ON LINODE (don't have to start and stop Confluence each time you test)>



/root/base/apps/confluence/paddle/paddle-2.0.jar


USAGE

Place atlassian-user.xml file in the same directory as the jar file

Then run:

java -jar paddle-2.0.jar



 Paddle
Attachments:3 Added by David Loeng, last edited by Renan Battaglin on Oct 24, 2008
From Confluence version 2.8 the 'External User Test' tool is integrated into the Administration Console, and you can also run it outside of Confluence. In previous versions of Confluence, this tool was available only as a separate utility called 'Paddle'.

For Confluence 2.8 and later, please refer to Troubleshooting LDAP User Management.
If you are running an earlier version of Confluence, please refer to the Confluence 2.7 documentation or choose the relevant Confluence version from the list of previous versions on the documentation home page.
Sometimes for troubleshooting purposes it may still be useful to use the stand-alone Paddle so you don't have to start and stop Confluence each time you test. Place your atlassian-user.xml file in the same directory as the jar file and run: java -jar paddle-2.0.jar.
	Be aware that:
The Atlassian-User optional setting useUnqualifiedUsernameForMembershipComparison is not supported by Paddle, so the tests may not be correct if this option is being used. In this case, the Connectivity test must can be done using Confluence.




</entry>



<entry [Thu Jun 17 14:49:03 EDT 2010] FIXED ERROR 'Database is being updated by another Confluence instance' WITH PATCH>


Thu Jun 17 18:48:48 UTC 2010

PROBLEM:

     2010-06-08 14:52:30  	fatal  	cluster
     
     Non Clustered Confluence: Database is being updated by another Confluence instance. Please see http://confluence.atlassian.com/x/mwiyCg for troubleshooting.
     
     Your server id is: BFE9-Z3V6-PKYR-P33M.

DIAGNOSIS

http://confluence.atlassian.com/display/CONFKB/Cluster+panics+(Confluence+2.10.4,+3.0.1+and+3.0.2)

 Cluster panics (Confluence 2.10.4, 3.0.1 and 3.0.2)
Added by Andrew Lynch, last edited by Roy Hartono on May 18, 2010  (view change) show comment
Symptoms
	There are multiple causes for this issue. Start with the parent article Database is being updated by an instance which is not part of the current cluster.
Cluster Panic error messages occur during normal operations, at some time post-startup. This only applies to Confluence version 2.10.4, 3.0.1 or 3.0.2.

Cause
In versions 2.10.4, 3.0.1 and 3.0.2, the cluster safety mechanism is not synchronized.


Resolution

Please Upgrade Confluence to version 3.1+. If you don't want to upgrade yet, there is a patch attached to CONF-17136 that you can apply to your installation.

If neither of the recommendations help, please follow the diagnostic instructions advised here to help track down the issue and contact Atlassian support.


SOLUTION

PATCHED FROM HERE
http://jira.atlassian.com/browse/CONF-17136


Andrew Lynch [Atlassian] added a comment - 07/Oct/09 7:20 PM
A patch has been provided for customers using 3.0.1 or 3.0.2.

To use it, please place the attached classes into WEB-INF/classes/com/atlassian/confluence/cluster/nonclustered (you will need to create the last couple of directories) and restart your Confluence instance.

Regards,
Andrew Lynch



1. CHECK VERSION OF CONFLUENCE -

     SEE PAGE BOTTOM BUT DOWN NOW...
     

     CHECKED INSTALLATON VERSION IS 3.0.2:
     
     /usr/share/confluence-3.0.2-std/confluence/WEB-INF


CHECK JVM, ETC.:

/usr/share/confluence/bin/version.sh -v                                  

     If you encounter issues starting up Confluence Standalone, please see the Installation guide at http://confluence.atlassian.com/display/DOC/Confluence+Installation+Guide
     Using CATALINA_BASE:   /usr/share/confluence
     Using CATALINA_HOME:   /usr/share/confluence
     Using CATALINA_TMPDIR: /usr/share/confluence/temp
     Using JRE_HOME:       /root/base/apps/java/jre1.6.0_17
     Server version: Apache Tomcat/6.0.14
     Server built:   Jul 20 2007 04:17:30
     Server number:  6.0.14.0
     OS Name:        Linux
     OS Version:     2.6.18.8-x86_64-linode10
     Architecture:   i386
     JVM Version:    1.6.0_17-b04
     JVM Vendor:     Sun Microsystems Inc.




2. INSTALL PATCH

A patch has been provided for customers using 3.0.1 or 3.0.2.


1. DOWNLOADED TO HERE


/root/base/apps/confluence/PATCH-17136



1. Place the attached classes into:

WEB-INF/classes/com/atlassian/confluence/cluster/nonclustered
     (you will need to create the last couple of directories)

mkdir -p /usr/share/confluence-3.0.2-std/confluence/WEB-INF/classes/com/atlassian/confluence/cluster/nonclustered


cp /root/base/apps/confluence/PATCH-17136/NonClusterManager*  \
/usr/share/confluence-3.0.2-std/confluence/WEB-INF/classes/com/atlassian/confluence/cluster/nonclustered


ll /usr/share/confluence-3.0.2-std/confluence/WEB-INF/classes/com/atlassian/confluence/cluster/nonclustered

     -rw-r--r-- 1 root root 4.7K Jun 17 19:18 NonClusterManager.class
     -rw-r--r-- 1 root root 1.5K Jun 17 19:18 NonClusterManager$SimpleClusteredLock.class


ll /usr/share/confluence-3.0.2-std/confluence/WEB-INF/classes/com/atlassian/confluence/                    
     drwxr-xr-x 3 root root 4.0K Jun 17 19:15 cluster
     drwxr-xr-x 2 root root 4.0K Oct  1  2009 setup
     drwxr-xr-x 2 root root 4.0K Oct  1  2009 userstatus



ll /usr/share/confluence-3.0.2-std/confluence/WEB-INF/classes/com/atlassian/confluence/*

     /usr/share/confluence-3.0.2-std/confluence/WEB-INF/classes/com/atlassian/confluence/cluster:
     total 12K
     drwxr-xr-x 3 root root 4.0K Jun 17 19:15 .
     drwxr-xr-x 5 root root 4.0K Jun 17 19:15 ..
     drwxr-xr-x 2 root root 4.0K Jun 17 19:18 nonclustered
     
     /usr/share/confluence-3.0.2-std/confluence/WEB-INF/classes/com/atlassian/confluence/setup:
     total 23M
     drwxr-xr-x 2 root root 4.0K Oct  1  2009 .
     drwxr-xr-x 5 root root 4.0K Jun 17 19:15 ..
     -rw-r--r-- 1 root root  18M Oct  1  2009 atlassian-bundled-plugins.zip
     -rw-r--r-- 1 root root 4.9M Oct  1  2009 demo-site.zip
     
     /usr/share/confluence-3.0.2-std/confluence/WEB-INF/classes/com/atlassian/confluence/userstatus:
     total 12K
     drwxr-xr-x 2 root root 4.0K Oct  1  2009 .
     drwxr-xr-x 5 root root 4.0K Jun 17 19:15 ..
     -rw-r--r-- 1 root root  515 Oct  1  2009 i18n.properties



2. Restart confluence


export JRE_HOME=/root/base/apps/java/jre1.6.0_17
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17

/usr/share/confluence/bin/shutdown.sh
/usr/share/confluence/bin/startup.sh


     OK!


     

</entry>



<entry [Thu Apr 15 02:35:41 EDT 2010] LINODE NETWORK SETTINGS>




eth0: 	74.207.235.81 ( www.stuartpyoung.com )
Gateways: 	74.207.235.1
Netmask: 	255.255.255.0
DNS Servers: 	75.127.97.6
75.127.97.7


Current Reverse DNS
IP Address 	RDNS
74.207.235.81 	www.stuartpyoung.com


</entry>



<entry [Thu Apr 15 01:35:41 EDT 2010] PLUGIN Confluence Basic Macros ALREADY INSTALLED, PROVIDES loremipsum>



Confluence Basic Macros 
This library includes basic macros for linking and formatting content. Below is the list of macros provided by this plugins with their descriptions.

Plugin Macros: {anchor}, {quote}, {noformat}, {panel}, {color}, {loremipsum}, {nolink}, {nl}, {cheese}


{anchor} - Create an anchor that allows people to link to a specific point in a page.
{quote} - Generate blockquotes that may contain multiple paragraphs or complex markup.
{noformat} - Create blocks of text where other wiki formatting is not applied.
{panel} - Draw a panel with an optional title and border.
{color} - Change the colour of the contained text.
{loremipsum} - Insert paragraphs of "lorem ipsum" space-filler text.
{nolink} and {nl} - Suppress rendering of a CamelCase link.



</entry>



<entry [Thu Apr 15 01:35:41 EDT 2010] INSTALLED 'Composition' PLUGIN>



Administration -> Plugins Repository -> Install

http://www.customware.net/repository/display/AtlassianPlugins/Composition+Plugin

This plugin contains macros which allow finer control over the layout (or composition) of a page. The macros in this package use CSS and JavaScript (a.k.a. ECMAScript) extensively. The macros generally don't do anything other than allow you to control how and when page content is displayed.


RECIPES:

http://www.customware.net/repository/display/AtlassianPlugins/User+contact+cards
Display user contact details using a contact card-style layout.
This recipe uses a combination of the Reporting Plugin and the {float} macro from the Composition Plugin to display a flexible set of contact information for registered users.


MACROS:

{card}
http://www.customware.net/repository/display/AtlassianPlugins/card

In coordination with the deck macro, allows for the creation of tabbed content.


     {deck:id=[Unique Deck ID]}
     {card:label=Card 1}
     Card 1 content.
     {card}
     {card:label=Card 2}
     Card 2 content.
     {card}
     {deck}

     USAGE:

          Name	 Required	 Default	 Description
          label	
          
          The label for the deck. May contain simple wiki text (e.g. bold, italic, emoticons and images).
          default	
          
          false
          If true, this card will be the default one shown when the page is first viewed.
          class	
          
          The custom CSS class the card is decorated by. Inherits its value from the containing {deck} if not specified.
          accessKey	
          
          The key that is hot linked to the specified card.
          Works in Firefox 2 using: Alt + Shift + <character> (Note that some characters (for example b, which accesses the bookmarks toolbar and t which accesses the Tools toolbar menu, will not work as an access key as the default browser functionality take precedence)
          accessKeys are not compatible with IE6 and IE7
          nextAfter	
          
          The number of seconds the slide will stay visible before moving to the next one. By default the current slide will not transition until prompted by the user. Inherits its value from the containing {deck} if not specified.
          effectType	
          
          none
          The effect to use when moving to this slide. May be 'fade' or 'none'. Inherits its value from the containing {deck} if not specified.
          effectDuration	
          
          The number of seconds the transition will take to complete. Eg. '1.5' or '10'. Inherits its value from the containing {deck} if not specified.



{cloak}
Creates a cloaked section which can be toggled between being visible and hidden. more info...

Simple Cloak
This is an example of a simple cloak setup which will default to all cloaked sections starting out hidden.

{composition-setup}

h2. {toggle-cloak:id=one} Section One

{cloak:id=one}
This is the contents of section one.
{cloak}

h2. {toggle-cloak:id=two} Section Two

{cloak:id=two}
This is the contents of section two.
{cloak}
Exclusive Cloak


This is an example of a simple cloak setup which will only reveal one section at a time.

{composition-setup}
cloak.toggle.exclusive = true
{composition-setup}

h2. {toggle-cloak:id=one} Section One

{cloak:id=one}
This is the contents of section one.
{cloak}

h2. {toggle-cloak:id=two} Section Two

{cloak:id=two}
This is the contents of section two.
{cloak}


{composition-setup}
Performs setup operations for some of the composition macros, as well as allowing page-wide defaults to be set. more info...

{deck}
In coordination with the card macro, allows for the creation of tabbed content. more info...
     
     {composition-setup}
     
     {deck:id=My Deck}
     {card:label=Card 1}
     {ipsumlorem:1}
     {card}
     {card:label=Card 2}
     {ipsumlorem:2}
     {card}
     {card:label=Card 3}
     {ipsumlorem:3}
     {card}
     {deck}

{float}
This macro allows content to 'float' to the left or right of the surrounding text. more info...

{show-card}
Shows a card in the specified deck. more info...

{toggle-cloak}
Creates a button to toggle a cloaked section between being visible and hidden. more info...



</entry>



<entry [Thu Apr 15 01:35:41 EDT 2010] INSTALLED 'expand' MACRO >



NB: The Toggle-Cloak Macro (SEE INSTALLED ABOVE) bundled with the Composition Plugin offers more advanced functionality such as:
     Multiple titles may open one panel
     The panel no longer needs to be beneath the title
     Optionally allowing only one panel open at a time

INSTALL 'EXPAND'

1. Go to 'Administration -> User Macros'

2. Select 'Create a new user macro'

3. Set 'Macro Name' to 'expand'

4. Select 'Macro has a body'

5. Select a rendering mode, depending on your version of Confluence

6. Select 'Convert macro body wiki markup to HTML'

7. Select 'Macro generates HTML markup'

8. For all versions, add (or append) the velocity script below into 'Template' and select 'Save': 

     ##
     ## Check for a blank first parameter
     ##
     #if($param0 && $param0.length()>0)
     #set($expandtitle=$param0)
     #else
     #set($expandtitle="Click here to expand...")
     #end
     #set( $toggleId = $action.random )
     ##
     ## Construct a confluence-page-friendly anchor name
     ##   For confluence anchors
     ##   1) anchor name is preceeded by page name and a hyphen
     ##   2) spaces, + and - are removed from both page and anchor names
     ##   3) Non-alpha numeric characters are removed (note, . @ and ? are also allowed in anchors but are unusual excpetions)
     ##   4) string is made (i.e. translate space to + and ? to %3F)
     ##
     #set($linkname=$generalUtil.urlEncode($content.getRealTitle().replaceAll("[+ -]","").concat("-").concat($expandtitle.replaceAll("[+ -]","").replaceAll("[^a-zA-Z0-9.@?]",""))))
     ##
     ##
     ## Show html output for DHTML action. Note: using lots of these in a page creates many redundant script tags and javascript functions
     ##
     <script>
     function ExpandMacroToggleAnswer(id) {
     var answer = document.getElementById("answer-" + id);
     var icon = document.getElementById("icon-" + id);
     ExpandMacroToggle(answer);
     if (answer.style.display == 'none') {
     icon.src="${bootstrap.webAppContextPath}/images/icons/arrow_closed_active_16.gif";
     }
     else {
     icon.src="${bootstrap.webAppContextPath}/images/icons/arrow_open_active_16.gif";
     }
     }
     function ExpandMacroToggle(el) {
     if ( el.style.display != 'none' ) {
     el.style.display = 'none';
     }
     else {
     el.style.display = '';
     }
     }
     // preload open image (variable not used elsewhere)
     openIcon = new Image();
     openIcon.src = "${bootstrap.webAppContextPath}/images/icons/arrow_open_active_16.gif";
     </script>
     ##
     ## Show anchor
     ##
     <a name="$linkname"  style="text-decoration:none;"/>
     ##
     ## Show title
     ##
     <div style="cursor: pointer; text-decoration:none;" onclick="ExpandMacroToggleAnswer('$toggleId')"><img id="icon-$toggleId" src="${bootstrap.webAppContextPath}/images/icons/arrow_closed_active_16.gif" style="vertical-align: middle; text-decoration:none;"> <expand-title style="vertical-align: middle; text-decoration:none;">$generalUtil.htmlEncode($expandtitle)</expand-title></div>
     ##
     ## Show content
     ##
     <div id="answer-$toggleId" class="toggle-answer" style="display: none">$body</div>


USAGE
=====

NB: The title cannot include wiki markup or cover multiple lines

{expand:Are you writing a FAQ-style series of entries?}
The answer can now pop out when the users clicks on it.
{expand}

Create a panel by embedding the {panel} macro in the text body

{expand:Expandable Panel} 
{panel} 
This text appears in a panel 
{panel}
{expand} 


Anchors are created to allow hyperlinking to expandable sections (does not affect expanded state)


</entry>



<entry [Thu Feb 11 04:44:11 UTC 2010] INSTALLED 'COPY SPACE' PLUGIN AND SET CONFLUENCE TO STARTUP AT BOOT>




COPY SPACE PLUGIN
=================

https://studio.plugins.atlassian.com/wiki/display/CPSP/Confluence+Copy+Space+Plugin
COPIED KBCS PTA SITE TO AGUA WITHOUT MISHAP



SET TO STARTUP AT BOOT
====================

     ADD CONFLUENCE TO rc.local
     ==========================

     EDIT /etc/rc.d/rc.local
     
     
     #!/bin/sh
     #
     # This script will be executed *after* all the other init scripts.
     # You can put your own initialization stuff in here if you don't
     # want to do the full Sys V style init stuff.
     
     touch /var/lock/subsys/local


     ADD THESE LINES:

export JRE_HOME=/root/base/apps/java/jre1.6.0_17
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17
/usr/share/confluence/bin/startup.sh




     RUN STARTUP SCRIPT THROUGH /etc/init.d
     ======================================
     
     DIDN'T USE THIS AS REQUIRED RATHER COMPLICATED START, KILL, ETC. INSTRUCTIONS


     CREATE STARTUP SCRIPT:

emacs /etc/init.d/confluence

#!/bin/sh

export JRE_HOME=/root/base/apps/java/jre1.6.0_17
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17
/usr/share/confluence/bin/startup.sh


     ADD TO CHKCONFIG:

     chkconfig --add confluence
     
          service confluence does not support chkconfig





MIGHT WORK BUT RATHER COMPLICATED:

     CREATE NEW USER AND STARTUP CONFLUENCE AS SERVICE RUN BY THIS USER
     ==================================================================
     http://confluence.atlassian.com/pages/viewpage.action?pageId=183148






DIDN'T WORK: 

     RUN STARTUP SCRIPT THROUGH CRON
     ===============================

     CREATE STARTUP SCRIPT:
     
     emacs /root/start-confluence.sh
     export JRE_HOME=/root/base/apps/java/jre1.6.0_17
     export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17
     /usr/share/confluence/bin/startup.sh
     
     
     SET CRON JOB:
     
     crontab -e
     OR
     emacs /etc/crontab
     
     
     ADD LINE:
     
     @reboot /root/start-confluence.sh
     
     
     SO THAT IT READS:
     
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



DIDN'T WORK:

     @reboot /etc/init.d/confluence start
     ====================================
     crontab -e
     
     ADD:
     
     @reboot /etc/init.d/confluence start
     
          
     
     /Cheers
     
     @reboot /etc/init.d/confluence start
     
     /etc/init.d/confluence


</entry>



<entry [Sun Feb 7 20:10:03 UTC 2009] CLONE LINODE TO DAD'S>

1. SHUT DOWN LINODE TO BE CLONED


2. CLONE THE LINODE
INSTRUCTIONS ON SETTING UP Finnix-recovery PROFILES ON BOTH DONOR AND RECEIVER
http://library.linode.com/linode-manager/copy-disk-separate-account#create_finnix_boot_profiles
http://library.linode.com/linode-manager/copy-disk-image-over-ssh


CREATE Finnix BOOT PROFILE ON LINODE.COM

Linodes -> Dashboard -> Create a new configuration profile

Label: Finnix MOODLE
Kernel: Finnix Recovery

Drive setup --> Device:

     /dev/xvda --> Recovery-Finnix(iso)
     /dev/xvdb --> CentOS 5.3 64bit Disk Image

Drive setup --> Uncompressed initrd image:

     /dev/xvdb --> CentOS 5.3 64bit Disk Image

Then, 'Save profile'.


3. REBOOT TO FINNIX PROFILES ON BOTH DONOR AND RECEIVER

DONOR NODE:

eth0:  	74.207.235.81 ( www.stuartpyoung.com )
Gateways: 	74.207.235.1
Netmask: 	255.255.255.0
DNS Servers: 	75.127.97.6
75.127.97.7

RECEIVER NODE:

eth0:	69.164.199.70 ( li114-70.members.linode.com )
Gateways:	 69.164.199.1
Netmask:	255.255.255.0
DNS Servers:	 72.14.179.5
72.14.188.5


4. LOGIN TO CONSOLE ON BOTH DONOR AND RECEIVER

On the "Console" tab in the Linode Manager for each Linode, click "AJAX Console" and you'll be presented with the Finnix environment.


On the receiving side
=====================

Set the root password and start the SSH server:

passwd
     s****
/etc/init.d/ssh start

     [*] Generating SSH1 RSA host key... done                                                    [*] Generating SSH2 RSA host key... done                                                    [*] Generating SSH2 DSA host key... done                                                    [*] Starting OpenBSD Secure Shell server... sshd done                                       

On the sending side
===================

Issue the following command to start copying your disk image to the receiving Linode:


###ssh root@12.34.56.78 "dd if=/dev/xvdb | cat" | dd of=/home/archive/linode.img



dd if=/dev/xvdb | ssh 69.164.199.70 "dd of=/dev/xvdb"


root@69.164.199.70's password:
dd: writing to `/dev/xvdb': No space left on device
20488192+0 records in
20488192+0 records out
10489954304 bytes (10 GB) copied20479984+34 records in
20480000+0 records out
10485760000 bytes (10 GB) copied, 2307.66 seconds, 4.5 MB/s
, 2310.5 seconds, 4.5 MB/s
[root@li77-81 ~]# dd if=/dev/xvda | ssh 69.164.199.70 "dd of=/dev/xvdb"



dd: writing to `/dev/xvdb': No space left on device
20479991+20 records in
20480000+0 records out
10485760000 bytes (10 GB) copied, 2335.03 seconds, 4.5 MB/s


REDID WITH 11GB SPACE ON RECEIVER:

root@69.164.199.70's password:
20488192+0 records in
20488192+0 records out
10489954304 bytes (10 GB) copied, 1873.51 seconds, 5.6 MB/s
20488189+6 records in
20488192+0 records out
10489954304 bytes (10 GB) copied, 1868.48 seconds, 5.6 MB/s

root@1:~# dd if=/dev/xvdb | ssh 69.164.199.70 "dd of=/dev/xvdb"



     #####The authenticity of host '69.164.199.70 (69.164.199.70)' can't be established
     #####RSA key fingerprint is f0:eb:52:8c:74:8e:a1:51:82:05:a8:88:b4:29:3a:ae.
     #####Are you sure you want to continue connecting (yes/no)? yes
     #####Warning: Permanently added '69.164.199.70' (RSA) to the list of known hosts.
     #####root@69.164.199.70's password:                                                              710249+0 records in                                                                         710248+0 records out                                                                        363646976 bytes (364 MB) copied, 76.6916 seconds, 4.7 MB/s                                         



2. VERIFY COPY ON RECEIVER

On the receiving side
=====================

Check the image by mounting it inside Finnix:

mount /dev/xvdb /mnt/xvdb

OR

mkdir linode
mount /dev/xvdb linode
ls linode/

     bin   dev  home  lib64       media  opt       proc  sbin     srv  tmp  var
     boot  etc  lib   lost+found  mnt    poweroff  root  selinux  sys  usr






OR, IF CAN REGISTER MULTIPLE LINODES TO YOUR USERNAME:
https://www.linode.com/members/linode/utilities.cfm
Linodes -> Settings & Utilitites -> Clone this Linode -> Copy individual disk images to another Linode ->



</entry>



<entry [Sun Feb 7 20:10:03 UTC 2009] INSTALL CRON>




yum install vixie-cron crontabs
/sbin/chkconfig crond on
/sbin/service crond start


CRON ON CENTOS
http://www.centos.org/docs/5/html/Deployment_Guide-en-US/ch-autotasks.html


34.1.3. Starting and Stopping the Service

To start the cron service, use

/sbin/service crond start

To stop the service, use

/sbin/service crond stop


START CRON AT BOOT:

yum install ntsysv


The easiest way to deny access to a service is to turn it off. Both the services managed by xinetd and the services in the /etc/rc.d/init.d hierarchy (also known as SysV services) can be configured to start or stop using three different applications:

Services Configuration Tool
This is a graphical application that displays a description of each service, displays whether each service is started at boot time (for runlevels 3, 4, and 5), and allows services to be started, stopped, and restarted.

ntsysv
This is a text-based application that allows you to configure which services are started at boot time for each runlevel. Non-xinetd services can not be started, stopped, or restarted using this program.

chkconfig
This is a command line utility that allows you to turn services on and off for the different runlevels. Non-xinetd services can not be started, stopped, or restarted using this utility.

You may find that these tools are easier to use than the alternatives — editing the numerous symbolic links located in the directories below /etc/rc.d by hand or editing the xinetd configuration files in /etc/xinetd.d.



CRON SYNTAX:


Each line in the /etc/crontab file represents a task and has the following format:

minute   hour   day   month   dayofweek   command

minute — any integer from 0 to 59
hour — any integer from 0 to 23
day — any integer from 1 to 31 (must be a valid day if a month is specified)
month — any integer from 1 to 12 (or the short name of the month such as jan or feb)
dayofweek — any integer from 0 to 7, where 0 or 7 represents Sunday (or the short name of the week such as sun or mon)
command — the command to execute (the command can either be a command such as ls /proc >> /tmp/proc or the command to execute a custom script)


34.1.2. Controlling Access to Cron

The /etc/cron.allow and /etc/cron.deny files are used to restrict access to cron. The format of both access control files is one username on each line. Whitespace is not permitted in either file. The cron daemon (crond) does not have to be restarted if the access control files are modified. The access control files are read each time a user tries to add or delete a cron task.

The root user can always use cron, regardless of the usernames listed in the access control files.

If the file cron.allow exists, only users listed in it are allowed to use cron, and the cron.deny file is ignored.

</entry>



<entry [Sun Feb 7 20:04:03 UTC 2009] FIXED MYSQL - NOTE HAVE TO HAVE TWO HYPHENS BEFORE --skip-grant-tables>




THIS FAILS TO START

mysqld_safe --skip-grant-tables &          

     [root@li77-81 mysql]# WARNING: Found /var/lib/mysql/my.cnf
     Datadir is deprecated place for my.cnf, please move it to /usr
     
     Starting mysqld daemon with databases from /var/lib/mysql
     STOPPING server from pid file /var/run/mysqld/mysqld.pid
     100208 00:01:19  mysqld ended


CHECKED MYSQLD LOG:

tail /var/log/mysqld_log

     100208 00:11:16  mysqld started
     100208  0:11:16 [ERROR] /usr/libexec/mysqld: unknown option '-k'
     100208 00:11:16  mysqld ended


THIS STARTS OKAY:

mysqld_safe --skip-grant-tables &          


CHECKED ITS RUNNING:

ps aux | grep mysql                        

     root     23931  0.2  0.2  63808  1312 ttyp0    S    00:18   0:00 /bin/sh /usr/bin/mysqld_safe --skip-grant-tables
     mysql    23970  0.8  4.5 239052 25376 ttyp0    Sl   00:18   0:00 /usr/libexec/mysqld --basedir=/usr --datadir=/var/lib/mysql --user=mysql --pid-file=/var/run/mysqld/mysqld.pid --skip-external-locking --socket=/var/lib/mysql/mysql.sock --skip-grant-tables
     root     23989  0.0  0.1  61156   780 ttyp0    S+   00:18   0:00 grep mysql


NB: BECAUSE OF ERROR MESSAGE, LATER ON CAN MOVE my.cnf

FROM

/var/lib/mysql/

TO

/usr/share/mysql

WITH THIS COMMAND

mv /var/lib/mysql/my.cnf /usr/share/mysql

AND EDIT my.cnf TO MOVE SOCKED FILE TO THE SAME DIRECTORY:

emacs /var/lib/mysql/my.cnf

TO READ:

[mysqld]
max_allowed_packet=8M
socket=/var/lib/mysql/mysql.sock



</entry>



