hard.linode

<entry [Sat Nov 27 04:17:19 UTC 2010] SET UP www.asiabridgecommunications.com ON LINODE>


********** NB: COMMENTED OUT STEP 1 INFO IN httpd.conf  **************


1. EDIT httpd.conf

emacs /etc/httpd/conf/httpd.conf

ADD THIS:

<VirtualHost *:80>

     DocumentRoot /var/www/html/abc
     ServerName www.asiabridgecommunications.com
     ErrorLog /var/log/httpd/abc-error_log
     CustomLog /var/log/httpd/abc-access_log common

</VirtualHost>


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
    
    >>> Last update of whois database: Tue, 24 Aug 2010 19:13:44 UTC <<<



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



<entry [Sun Feb 7 19:04:30 UTC 2009] MOODLE INSTALL>



QUICK INSTALL
=============

A basic outline of the installation process:

1) Move the Moodle files into your web directory.

2) Create a single database for Moodle to store all
   it's tables in (or choose an existing database).

3) Create a data directory

4) Visit your Moodle site with a browser, you should
   be taken to the install.php script, which will lead
   you through creating a config.php file and then
   setting up Moodle, creating an admin account etc.

5) Set up a cron task to call the file admin/cron.php
   every five minutes or so.


INSTALLATION STEPS IN DETAIL
============================

1. DOWNLOADED MOODLE, 

http://moodle.org/downloads/

UNZIPPED PACKAGE AND COPIED FILES INTO WEB DIRECTORY moodle
http://docs.moodle.org/en/Installing_Moodle

cd /root/base/apps/moodle

tar xvfz moodle-100207-19.tgz

cp -r moodle /var/www/html

CHANGED OWNERSHIP AND PERMISSIONS TO MAKE moodle DIRECTORY WRITEABLE BY APACHE

chown -R root:apache /var/www/html/moodle
chmod -R 0700 /var/www/html/moodle


2. CREATE A DATABASE


    mysql -u root

        Welcome to the MySQL monitor.  Commands end with ; or \g.
        Your MySQL connection id is 1
        Server version: 5.0.45 Source distribution
        
        Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
        
        mysql>
        
   3. Issue the following statements in the mysql client:


RESET ROOT PASSWORD:

     UPDATE mysql.user SET Password=PASSWORD('o*****') WHERE User='root';
     
                 Query OK, 3 rows affected (0.01 sec)
                 Rows matched: 3  Changed: 3  Warnings: 0
     
     CREATE DATABASE moodle;
     Query OK, 1 row affected (0.00 sec)
     
     
     FLUSH PRIVILEGES;
    

LOG BACK IN AS ROOT:

     GRANT ALL PRIVILEGES ON moodle.* TO 'moodleuser'@'localhost'
     IDENTIFIED BY 'open4moodle' WITH GRANT OPTION;

     Query OK, 0 rows affected (0.00 sec)


RESTART MYSQL AS ROOT:

mysqld_safe &          




3. CREATE A DATA DIRECTORY
http://docs.moodle.org/en/Creating_Moodle_site_data_directory

mkdir /moodledata
chmod -R 0770 /moodledata
chown -R root:apache /moodledata


CHECK THAT apache USER CAN ACCESS THE FOLDER:

1. CHANGE TO apache USER

su -s /bin/bash apache

OR USE 'apache' alias in ~/.bash_profile:
alias apache='su -s /bin/bash apache'

ls /moodledata

     OK



4. OPEN INSTALLATION PAGE IN BROWSER

http://stuartpyoung.com/moodle/install.php

INSTALLATION STEPS:

     1. confirm the locations of this Moodle installation - OK
     NOTHING TO CHANGE
     
     2. configure the database
     
     User: moodleuser
     Pass: open4moodle
     
     3. Checking your environment
     
     4. Copyright notice -> Yes
     
     5. For information about this version of Moodle -> Continue
     
     6. Setting up database ... Database was successfully upgraded -> Continue
     
     7. Setting up module tables ... workshop tables have been set up correctly -> Continue
     
          MYSQL DATABASE OVERLOADED SO REBOOTED
     
     8. Setting up plugin tables ... truefalse tables have been set up correctly -> Continue
     
     9. Upgrading database ... Backup version is now 2009111300 -> Continue
     
     10. Upgrading database ... Blocks version is now 2007081300 -> Continue
     
     11. Setting up block tables ... Tags tables have been set up correctly -> Continue
     
     12. Setting up plugin tables ... paypal tables have been set up correctly -> Continue
     
     13. Setting up plugin tables ... xml tables have been set up correctly -> Continue
     
     14. Setting up plugin tables ... xml tables have been set up correctly -> Continue
     
     15. Setting up plugin tables ... user tables have been set up correctly -> Continue
     
     16. Setting up plugin tables ... stats tables have been set up correctly -> Continue
     
     17. Setting up plugin tables ... unittest tables have been set up correctly -> Continue
     
     18. Setup administrator account
     
          Username: admin
          New password: ADMINs//*101
          
          -> Update profile
     

SITE IS NOW WORKING AT:

http://stuartpyoung.com/moodle/admin/index.php


5. SET UP CRON JOB
http://docs.moodle.org/en/Cron

SET UP CRON JOB USING crontab ON THE LINUX COMMAND LINE:

crontab -e

OR:

emacs /etc/crontab

AND THEN ADDING THIS COMMAND:

*/30 * * * * wget -q -O /dev/null http://stuartpyoung.com/moodle/admin/cron.php


SO /etc/crontab NOW CONTAINS:

     SHELL=/bin/bash
     PATH=/sbin:/bin:/usr/sbin:/usr/bin
     MAILTO=root
     HOME=/
     
     */30 * * * * wget -q -O /dev/null http://stuartpyoung.com/moodle/admin/cron.php
     
     # run-parts
     01 * * * * root run-parts /etc/cron.hourly
     02 4 * * * root run-parts /etc/cron.daily
     22 4 * * 0 root run-parts /etc/cron.weekly
     42 4 1 * * root run-parts /etc/cron.monthly




NB: The first five entries are the times to run values, followed by the command to run. The asterisk is a wildcard, indicating any time.

The above example means run the command wget -q -O /dev/null...

every 30 minutes (*/30), every hour (*), every day of the month (*), every month (*), every day of the week (*).

The "O" of "-O" is the capital letter not zero, and refers the output file destination, in this case "/dev/null" which is a black hole and discards the output. If you want to see the output of your cron.php then enter its url in your browser.


TO SEE OUTPUT OF cron.php, BROWSE TO:

http://stuartpyoung.com/moodle/admin/cron.php
     
     Server Time: Mon, 08 Feb 2010 01:21:17 +0000
     
     
     Starting activity modules
     Processing module function assignment_cron ...done.
     Processing module function chat_cron ...done.
     Processing module function forum_cron ...Starting digest processing...
     Cleaned old digest records
     done.
     Processing module function scorm_cron ...Updating scorm packages which require daily update
     done.
     Processing module function wiki_cron ...done.
     Finished activity modules
     Starting blocks
     Processing cron function for rss_client....
     0 feeds refreshed (took 0.077199 seconds)
     done.
     Processing cron function for search....Global searching is not enabled. Nothing performed by search.
     done.
     Finished blocks
     Starting admin reports
     Finished admin reports
     Updating languages cache
     Removing expired enrolments ...none found
     Starting main gradebook job ...
     done.
     Running backups if required...
         Checking backup status...INACTIVE
     Backup tasks finished.
     Running auth crons if required...
     Cron script completed correctly
     Execution took 1.176911 seconds




NB: DATABASE OVERLOADED SO LOOKED ON COMMAND LINE FOR INSTALLER BUT THIS DIRECTORY WAS NOT PRESENT:

cd /var/www/html/moodle/admin/cli

More information about the options can be found using
$sudo -u wwwrun /usr/bin/php install.php --help
Last tasks





CUSTOM THEMES
http://moodle.org/mod/data/view.php?id=6552
===========================================

1. CHOOSE A THEME

E.G.: SKY_HIGH
http://moodle.org/mod/data/view.php?d=26&rid=2385

(** THIS ALSO LOOKS NICE: http://courses.aquinas.edu/, DOWNLOAD http://moodle.org/mod/data/view.php?d=26&rid=2352 **) 

2. DOWNLOADED sky_high.zip AND TRANSFERRED TO LINODE:

cd /var/www/html/moodle/theme
unzip sky_high.zip


3. SET PERMISSIONS TO 755 FOR ALL FILES AND FOLDERS:

chmod -R 755 /var/www/html/moodle/theme/sky_high

4. CHOOSE THEM WITHIN MOODLE:

Administration > Appearance > Themes > Theme selector




</entry>



<entry [Sun Feb 7 19:04:03 UTC 2009] MOODLE INSTALL>



user: sjy**
pass:s//****


</entry>



<entry [Sat Dec 6 23:04:03 UTC 2009] SAVE LINODE IMAGE TO LOCAL MACHINE>





1. CREATE Finnix BOOT PROFILE ON LINODE.COM
http://library.linode.com/linode-manager/copy-disk-image-over-ssh

Under your Linode's "Dashboard" tab, click "Create a new Configuration Profile".

Label: Finnix Recovery
Kernel: Finnix Recovery

Drive setup --> Device:

     /dev/xvda --> Recovery-Finix(iso)
     /dev/xvdb --> CentOS 5.3 64bit Disk Image

Drive setup --> Uncompressed initrd image:

     /dev/xvdb --> CentOS 5.3 64bit Disk Image

Then, 'Save profile'.


2. CHECK YOU CAN MOUNT THE CENTOS INSTALLATION ON FINNIX

Use the "Reboot" button for the Finnix Recovery profile to boot into the Finnix environment.

On the "Console" tab in the Linode Manager, click "AJAX Console" and you'll be presented with the Finnix environment.

Check the image by mounting it inside Finnix:

mount /dev/xvdb /mnt/xvdb



3. COPY THE CENTOS INSTALLATION AS AN IMAGE TO THE LOCAL DISC


IP OF LINODE: 74.207.235.81

ssh root@74.207.235.81 "dd if=/dev/xvdb | cat " | dd of=`pwd`/stuartpyoung.com.img





4. MOUNT THE COPIED IMAGE ON THE LOCAL MACHINE

mkdir test
mount -o loop stuarpyoung.img test
ll test




</entry>



<entry [Sun Nov 22 23:04:03 UTC 2009] TIDY UP THE PAGE>





A USEFUL FAQ
https://apps.akeles.com/confluence/display/DOC/Frequently+Asked+Questions#FrequentlyAskedQuestions-1.7


1. REMOVE THE "Last Updated and Created By ..." TEXT AT THE TOP OF THE PAGE

EDIT THE page-metadata.vm

emacs /usr/share/confluence/confluence/decorators/includes/page-metadata.vm


REMOVE THIS:


#if ($page.isLatestVersion() == true)
$action.getText('added.by.user.last.edited.on.date', ["#usernameLink ($page.creatorName)","#usernameLink ($page.lastModifierName)","$action.dateFormatter.format( $page.lastModificationDate )"])
#set ($previousPage = $action.getPreviousVersion($page.previousVersion))
#if ($!previousPage)
<span class="noprint">&nbsp;(<a href="$req.contextPath/pages/diffpages.action?pageId=${page.id}&originalId=$previousPage.id">$action.getText('view.change')</a>)</span>
#end
#else
$action.getText('added.by.user.edited.on.date', ["#usernameLink ($page.creatorName)","#usernameLink ($page.lastModifierName)","$action.dateFormatter.format( $page.lastModificationDate )"])
#end


NO NEED TO RESTART CONFLUENCE.

OK!




2. REMOVE THE CHILDREN LIST FROM THE BOTTOM OF THE PAGE

SHORT VIDEO

http://www.atlassian.com/tv/episode?id=nwfhaet1smwy


DELETE renderChildren() LINE FROM PAGE LAYOUT

Space Admin --> Layout --> Page Layout --> Remove this line:

     #renderChildre()
     
Save




</entry>



<entry [Sun Nov 22 10:52:03 UTC 2009] SETUP OUTGOING EMAIL FROM CONFLUENCE>



http://confluence.atlassian.com/display/DOC/Configuring+a+server+for+outgoing+mail


1. EDIT server.xml

emacs /usr/share/confluence/conf/server.xml


ADD INSIDE <Context path...

              <Resource name="mail/Session"
                    auth="Container"
                    type="javax.mail.Session"
                    mail.smtp.host="smtp.gmail.com"
                    mail.smtp.port="465"
                    mail.smtp.auth="true"
                    mail.smtp.user="stuartpyoung@gmail.com"
                    password="<****yourpassword ****>"
                    mail.smtp.starttls.enable="true"
                    mail.smtp.socketFactory.class="javax.net.ssl.SSLSocketFactory"
              />




2. MOVE mail*.jar AND activate*.jar TO THE TOMCAT FOLDER


mv /usr/share/confluence/confluence/WEB-INF/lib/mail-1.4.1.jar /usr/share/confluence/lib
chmod 755 /usr/share/confluence/lib/mail-1.4.1.jar 
mv /usr/share/confluence/confluence/WEB-INF/lib/activation-1.0.2.jar /usr/share/confluence/lib
chmod 755 /usr/share/confluence/lib/activation-1.0.2.jar 


3. RESTART CONFLUENCE

/usr/share/confluence/bin/shutdown.sh
/usr/share/confluence/bin/startup.sh



4. INCREASE LINODE MEMORY TO 540MB -- IMPORTANT!!! - WILL NOT WORK WITHOUT THIS!!!

TO AVOID THIS ERROR:

Error occurred during initialization of VM
Could not reserve enough space for object heap



5. CREATE A MAIL SERVER

Login Confluence as admin
Click on "Mail Servers" --> 'Add a new SMTP mail server'

use JNDI and enter

     java:comp/env/mail/Session



6. SEND A TEST EMAIL USING gmail SMTP server:


     Your test message has been sent successfully to stuartpyoung@gmail.com.



OK!


</entry>



<entry [Sun Nov 22 02:09:03 UTC 2009] INSTALL CONFLUENCE>




INSTALL CONFLUENCE PLUGINS


LAST 2 OF 7 MODULES IN Confluence HTML Macros
html
html-include


CALENDAR PLUGIN

INCREASE MYSQL max_allowed_packet TO 32M TO AVOID THIS ERROR:
"problem evicting or flushing a plugin object" 


     mysql -u root -p
     SET GLOBAL max_allowed_packet = 32000000;



AND SET my.cnf FILE

emacs /var/lib/mysql/my.cnf

     [mysqld]
     max_allowed_packet=16M



AND RESTART MYSQL

/etc/init.d/mysqld reload



CENTER PLUGIN

http://www.adaptavist.com/display/AtlassianConfluence/center+macro



CONFLUENCE USAGE STATS PLUGIN

Confluence Administration --> Plugin Manager --> Confluence Usage Stats --> Enable


MAIL PAGE PLUGIN

INSTALL AS ABOVE. TESTED EMAIL PAGE FROM kbcspta@gmail.com TO stuartpyoung@gmail.com AND WORKED OKAY - APPEARED IN kbcspta@gmail.com's SENT FOLDER ALSO!



</entry>



<entry [Sun Nov 22 01:48:03 UTC 2009] RESET THE mysql ROOT PASSWORD>



FROM: http://www.mydigitallife.info/2006/04/23/reset-the-root-password-of-mysql-server/

   1. Stop mysqld and restart it with the –skip-grant-tables options

    ps aux | grep mysqld
    kill -9 <PID>
    
    OR
    
    sudo mysqladmin shutdown

     
     RESTART WITHOUT GRANT TABLES:
    
    sudo mysqld_safe -–skip-grant-tables &
   

   2. Connect to the mysqld server with this command:

    mysql -u root

        Welcome to the MySQL monitor.  Commands end with ; or \g.
        Your MySQL connection id is 1
        Server version: 5.0.45 Source distribution
        
        Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
        
        mysql>
        
   3. Issue the following statements in the mysql client:
        
        UPDATE mysql.user SET Password=PASSWORD('<ROOT_PASSWORD>') WHERE User='root';

            Query OK, 3 rows affected (0.01 sec)
            Rows matched: 3  Changed: 3  Warnings: 0

        FLUSH PRIVILEGES;
    
            Query OK, 0 rows affected (0.00 sec)

    OK!





</entry>



<entry [Thu Nov 19 14:35:03 UTC 2009] INSTALL CONFLUENCE>



SEE http://confluence.atlassian.com/display/DOC/Installing+Confluence+Standalone+on+Unix+or+Linux


1. INSTALL JAVA JRE AND SDK

DOWNLOADED FROM HERE http://java.sun.com/javase/downloads/index.jsp

SAVED TO /root/software/java

JRE INSTALLED HERE

cd /root/base/apps/java/jre1.6.0_17/bin
./java -version 
     java version "1.6.0_17"
     Java(TM) SE Runtime Environment (build 1.6.0_17-b04)
     Java HotSpot(TM) Client VM (build 14.3-b01, mixed mode, sharing)


JDK INSTALLED HERE

/root/base/apps/java/jdk1.6.0_17


2. INSTALL X11 DEPENDECIES

yum install libXp
yum install libXp-devel



3. DOWNLOAD THE STANDALONE INSTALLATION FILE

wget http://www.atlassian.com/software/confluence/downloads/binary/confluence-3.0.2-std.zip

SAVED TO /root/software/confluence



INSTALLED TO HERE

cd /root/software/confluence
mv confluence-3.0.2-std /usr/share/

WHICH CREATED THIS INSTALLATION DIRECTORY

/usr/share/confluence-2.7.0-std/



EDIT confluence.home IN /confluence/WEB-INF/classes/confluence-init.properties

emacs /usr/share/confluence/confluence/WEB-INF/classes/confluence-init.properties


     #### confluence.home=c:/confluence/data
     
     confluence.home=/usr/share/confluence-data



CREATE DATA DIRECTORY

mkdir /usr/share/confluence-data



DOWNLOAD MYSQL CONNECTOR 

http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.10.tar.gz/from/pick



CREATE MYSQL DATABASE AND USER confluenceuser 


Login to the mysql client as the root mysql user:

mysql -u root -p;

Create the database:

CREATE DATABASE confluence CHARACTER SET utf8 COLLATE utf8_bin;

Grant the privileges:

GRANT ALL PRIVILEGES ON confluence.* TO 'confluenceuser'@'localhost' IDENTIFIED BY 'open4confluence';


Flush Changes:

FLUSH PRIVILEGES;





START CONFLUENCE AND SET UP NEW CONFIGURATION


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





Enter your license key and click the 'Custom Installation' button.

Under the 'External Database' heading, select 'MySQL' from the dropdown list and click 'External Database'.

On the next page, click 'Direct JDBC'.

Enter confluenceuser in the User Name field, and the password you chose earlier in the Password field

Click the Next button.

OK!!






( If you get the error message

'Could not successfully test your database: : Server connection failure during transaction. Due to underlying exception: 'java.sql.SQLException: Access denied for user 'confluenceuser'@'localhost' (using password: YES)'

verify that you have properly given the confluenceuser user all the right permissions when connecting from localhost.)





</entry>



<entry [Thu Nov 19 14:33:03 UTC 2009] INSTALL findutils AND locate>




INSTALL findutils

yum install which
yum install findutils


INSTALL locate

yum install slocate
updatedb



</entry>



<entry [Wed Nov 18 14:33:03 UTC 2009] INSTALL LAMP>




SET TIMEZONE

By default, Linode installations of CentOS are set to Eastern Standard Time.


INSTALL APACHE

yum install httpd

The configuration for Apache is contained in the httpd.conf file, which is located at: /etc/httpd/conf/httpd.conf. We advise you to make a backup of this file into your home directory, like so:

cp /etc/httpd/conf/httpd.conf ~/httpd.conf.backup


SET SECURITY

A configuration tool is available for basic firewall administration. Install the tool by issuing the following command:

yum install system-config-securitylevel-tui

Then, use the following command to start the tool:

system-config-securitylevel-tui

If you need more control over the firewall, you can interact with the firewall (iptables) directly with the iptables command, and you can see an output of all iptables rules with the following command:

less /etc/sysconfig/iptables-config


INSTALL whois (i.e., jwhois)

yum install jwhois


SET VIRTUAL HOST FOR kbcspta.org

emacs /etc/httpd/conf.d/vhost.conf

<VirtualHost *:80>
     ServerAdmin admin@kbcspta.org
     ServerName kbcspta.org
     ServerAlias www.kbcspta.org
     DocumentRoot /srv/www/kbcspta.org/
     ErrorLog /srv/www/kbcspta.org/logs/error.log
     CustomLog /srv/www/kbcspta.org/logs/access.log combined
</VirtualHost>

CREATE logs DIRECTORY

mkdir -p /srv/www/kbcspta.org/logs


RESTART HTTPD

/etc/init.d/httpd reload


CHANGE TO apache USER

su -s /bin/bash apache


(also set as alias in ~/.bash_profile:

alias apache='su -s /bin/bash apache'

)


WORKING!


TRANSFER DOMAIN www.stuartpyoung.com TO LINODE

BEFORE TRANSFER IS EFFECTIVE USE THE helpinghost DNS SERVERS

Primary DNS server:           ns1.helpinghost.com
Primary DNS IP address:       64.246.27.246
Secondary DNS server:         ns2.helpinghost.com
Secondary DNS IP address:     207.44.192.32



CHANGE DNS SERVERS TO LINODE HERE

https://manage.opensrs.net/

(LOGIN AS HELPINGHOST USER)

IN 'Name servers' SET THESE ADDRESSES:

ns1.linode.com
ns2.linode.com
ns3.linode.com
ns4.linode.com

(Allow up to 24 hours for DNS changes to propagate through the Internet, although it may 
happen much faster. You can use the whois utility from a shell prompt to see if your domain's 
record has been updated with our nameservers.)



SET DOMAIN NAME ON LINODE:

SEE http://library.linode.com/linode-manager/configuring-dns-with-the-linode-manager:

Log into the Linode Manager and click the "DNS Manager" tab. You'll see an empty zone list.

Click "Add a new domain zone" and enter 'stuartpyoung.com', then click OK.

Enter the SOA email address (use administrative contact email address for your domain) and accept the default choices for the remaining options.

Several DNS records will be automatically created for your domain. These include a default entry for your domain, A records for "www" and "mail", and an MX record directing mail delivery to "mail.yourdomain.com".


SET THE DOMAIN'S REVERSE DNS:

LinodeManager --> Network tab --> reverse DNS (entry for your Linode's IP address):

NB: use the whole domain name, including the 'www':

www.stuartpyoung.com





INSTALL MySQL

yum install mysql-server

In CentOS 5.2 this provides version 5.0.45 of MySQL. 



SET MYSQL TO RUN ON BOOT

/sbin/chkconfig --levels 235 mysqld on

Use the chkconfig command to setup runlevels as needed.



START MYSQL AS ROOT:

/etc/init.d/mysqld start


(NB: THIS OUTPUTS:

To start mysqld at boot time you have to copy
support-files/mysql.server to the right place for your system

)


FULL OUTPUT:


Initializing MySQL database:  WARNING: The host 'origin' could not be looked up with resolveip.
This probably means that your libc libraries are not 100 % compatible
with this binary MySQL version. The MySQL daemon, mysqld, should work
normally with the exception that host name resolving will not work.
This means that you should use IP addresses instead of hostnames
when specifying MySQL privileges !
Installing MySQL system tables...
OK
Filling help tables...
OK

To start mysqld at boot time you have to copy
support-files/mysql.server to the right place for your system

PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:
/usr/bin/mysqladmin -u root password 'new-password'
/usr/bin/mysqladmin -u root -h origin password 'new-password'

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
Starting MySQL:                                                      [  OK  ]



INSTALL PHP 

yum install php5 php-pear


Once PHP5 is installed we'll need to tune the configuration file located in /etc/php.ini to enable more descriptive errors, logging, and better performance. These modifications provide a good starting point if you're unfamiliar with PHP configuration.

Make sure that the following values are set, and relevant lines are uncommented (comments are lines begining with a semi-colon (;)):

emacs /etc/php.ini

error_reporting = E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR
display_errors = Off
log_errors = On
error_log = /var/log/php.log
max_execution_time = 300
memory_limit = 64M
register_globals = Off




INSTALL support for MySQL in PHP

yum install php-mysql




INSTALL mod_python

yum install mod_python




To enable python support for the site "kbcspta.org", you need to add the following to the site's <VirtualHost > entry in the configuration file:

emacs /etc/httpd/conf.d/vhost.conf

AddHandler mod_python .py
PythonHandler mod_python.publisher
PythonDebug On

SO IT NOW READS:

<VirtualHost *:80>
     ServerAdmin admin@kbcspta.org
     ServerName kbcspta.org
     ServerAlias www.kbcspta.org
     DocumentRoot /srv/www/kbcspta.org/
     ErrorLog /srv/www/kbcspta.org/logs/error.log
     CustomLog /srv/www/kbcspta.org/logs/access.log combined

     AddHandler mod_python .py
     PythonHandler mod_python.publisher
     PythonDebug On

</VirtualHost>



AND RESTART APACHE

/etc/init.d/httpd reload 

Reloading httpd:                                                     [  OK  ]



NB: START APACHE ON BOOT:

chkconfig httpd on



INSTALL MYSQL SUPPORT FOR PYTHON

yum install MySQL-python








NOTES
-----------


<VirtualHost *:80>
     ServerAdmin squire@ducklington.org
     ServerName ducklington.org
     ServerAlias www.ducklington.org
     DocumentRoot /srv/www/ducklington.org/public_html/
     ErrorLog /srv/www/ducklington.org/logs/error.log
     CustomLog /srv/www/ducklington.org/logs/access.log combined
</VirtualHost>



http://www.nsrc.org/tinyReg/docs/install.txt

My Products --> Domain Manager --> Check domain name --> click Nameserver icon --> Erase old and type in new namesservers



Sample CGI Config for VirtualHost 
---------------------------------
If you have installed tinyReg on a web site using the Apache web server and 
you are using virtual hosts, then you may need to add a section in to your 
Apache configuration file for the tinyReg CGI directory. Here is an example. 
You should update the file httpd.conf. You can find this file in the following 
locations: 

* Fedora/Red Hat Linux: /etc/httpd/conf/httpd.conf 
* Ubuntu/Debian Linux: /etc/apache/httpd.conf 
* FreeBSD: /usr/local/etc/apache/httpd.conf 

   <VirtualHost *>
   # ADD THIS
           ScriptAlias /cgi-bin /home/user/cgi-bin
           <Directory /home/user/cgi-bin>
                   Options ExecCGI
                   AllowOverride None
                   Allow from all
           </Directory>
   </VirtualHost
