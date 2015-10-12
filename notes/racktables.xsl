racktables



<entry [Mon 2014:01:13 19:43:11 EST] SAVED RACKTABLES DATABASE TO software>

/home/syoung/software/racktables/racktables.tar.gz

	
</entry>
<entry [Sun 2013:09:29 15:03:00 EST] INSTALL RACKTABLES ON UBUNTU>

https://github.com/ibettinger/racktables

1. INSTALL DEPENDENCIES (I.E., PHP)

    *** Debian 6
    * MySQL: aptitude install mysql-server-5.1
    * Apache/PHP: aptitude install libapache2-mod-php5 php5-gd php5-mysql php5-snmp
    * To enable Unicode, add "character-set-server=utf8" line to "[mysqld]"
    section of "/etc/mysql/my.cnf" file and restart mysqld.

    
2. INSTALL RACKTABLES

DOWNLOAD RACKTABLES

git clone https://github.com/ibettinger/racktables.git


MOVE TO LOCATION


*** II. FILES ***
Unpack distro files to any directory you want and configure Apache to "wwwroot"
subdirectory as DocumentRoot.
Symlinks to wwwroot or even index.php from your web server root are also possible.


INSTALL IN BROWSER


*** III. INSTALLER ***
Open your configured RackTables URL and you will be prompted to configure
and initialize the application.

*******************************************************
*                                                     *
*              UPGRADING RACKTABLES                   *
*                                                     *
*******************************************************
RackTables (since 0.14.6) provides an automatic database upgrade feature.
If you already have a working installation, the following procedure
should be sufficient:

0. BACKUP YOUR DATABASE and check the release notes (below) before actually
   starting the upgrade,.
1. Remove all existing files except inc/secret.php and the gateways'
   configuration (in the gateways directory).
2. Unpack the new tarball into the place.
3. Open your RackTables page in a browser. The software detects version
   mismatch and displays a message telling to log in as admin to finish
   the upgrade.
4. Do that. Normally, everything should be Ok. If there are
   errors displayed, send these in a bug report.

*******************************************************


    
</entry>
<entry [Sun 2013:09:29 14:55:20 EST] RACKTABLES REST API>

REST/YAML RACKTABLES API
http://sjoeboo.github.io/blog/2012/05/31/getting-racktables-location-info-into-puppet/

    A script, running from cron, reading the racktables database and spitting out YAML documents of the data on a per host basis.

        Now, we can query the nice puppet/forman api’s for location data! Better yet, I can use these with storedconfigs to do things like add location info to Ganglia! Or have systems in 1 data center get specific configs (dns? puppet master? AD?)

        Our config management system is now location aware!


REST RACKTABLES API

https://github.com/ibettinger/racktables

issues can be filed at

https://github.com/ibettinger/racktables/issues


Build a RESTful API for RackTables
posted by Philip Durbin 
pdurbin@fas.harvard.edu

RackTables is a PHP webapp that lets system administrators describe where their servers are within a rack and a datacenter.

To see RackTables in action log in as admin/admin to http://racktables.org/demo.php and click around a datacenter.

RackTables has something of a server-side API at http://sourceforge.net/apps/mediawiki/racktables/index.php?title=RackTablesDevelGuide#API but it is not well suited to client-side, RESTful queries (such as the Twitter API). The need for such an API has been recognized on the RackTables mailing list at http://www.freelists.org/post/racktables-users/api-question and I'm aware of at least two department at Harvard that use RackTables and would benefit from an API.

A read-only API would be a great first step. Given a hostname, the API could return the datacenter, rack, and rack unit(s) in which a server resides, for example.

2012-05-12 update: A colleague of mine wrote an API that we're now using: http://blog.mattynick.com/blog/2012/05/31/getting-racktables-location-info-into-puppet/ . See also some discussion at http://www.freelists.org/post/racktables-users/RESTful-API-for-RackTables

2012-06-25 update: Ian Bettinger from Topsy Labs is working on a restful web service API for Racktables and hopes to merge his code into the main branch http://www.freelists.org/post/racktables-users/writing-a-restful-API-in-php-for-Racktables

2012-07-13 update: Ian has asked for feedback on some preliminary code (api.php - http://cache.gmane.org//gmane/comp/misc/racktables/user/1766-001.bin ) with this accompanying message: http://www.freelists.org/post/racktables-users/writing-a-restful-API-in-php-for-Racktables,11

2012-09-24 update: Ian Bettinger has published his code to https://github.com/ibettinger/racktables and issues can be filed at https://github.com/ibettinger/racktables/issues
    
</entry>
<entry [Sun 2013:09:29 14:48:14 EST] RACKTABLES VERSION 0.20.4 OF OLD INSTALLATION>

VERSION 0.20.4


</entry>