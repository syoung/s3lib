linode.archive.1


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

   1. Stop mysqld and restart it with the skip-grant-tables options

    ps aux | grep mysqld
    kill -9 <PID>
    
    OR
    
    sudo mysqladmin shutdown

     
     RESTART WITHOUT GRANT TABLES:
    
    sudo mysqld_safe -skip-grant-tables &
   

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


<!--

<VirtualHost *:80>
     ServerAdmin admin@kbcspta.org
     ServerName kbcspta.org
     ServerAlias www.kbcspta.org
     DocumentRoot /srv/www/kbcspta.org/
     ErrorLog /srv/www/kbcspta.org/logs/error.log
     CustomLog /srv/www/kbcspta.org/logs/access.log combined
</VirtualHost>

-->


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
happen much faster. You can use the whois utility from a shell prompt to see if your domain's record has been updated with our nameservers.)



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




To enable python support for the site "kbcspta.org", you need to add the following to the site's < VirtualHost > entry in the configuration file:

emacs /etc/httpd/conf.d/vhost.conf

AddHandler mod_python .py
PythonHandler mod_python.publisher
PythonDebug On

SO IT NOW READS:


<!--
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

-->

AND RESTART APACHE

/etc/init.d/httpd reload 

Reloading httpd:                                                     [  OK  ]



NB: START APACHE ON BOOT:

chkconfig httpd on



INSTALL MYSQL SUPPORT FOR PYTHON

yum install MySQL-python



NOTES
-----------

<!--
<VirtualHost *:80>
     ServerAdmin squire@ducklington.org
     ServerName ducklington.org
     ServerAlias www.ducklington.org
     DocumentRoot /srv/www/ducklington.org/public_html/
     ErrorLog /srv/www/ducklington.org/logs/error.log
     CustomLog /srv/www/ducklington.org/logs/access.log combined
</VirtualHost>

-->

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
<!--
   <VirtualHost *>
   # ADD THIS
           ScriptAlias /cgi-bin /home/user/cgi-bin
           <Directory /home/user/cgi-bin>
                   Options ExecCGI
                   AllowOverride None
                   Allow from all
           </Directory>
   </VirtualHost
-->


</entry>