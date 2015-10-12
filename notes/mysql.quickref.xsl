mysql.quickref



<entry [Thu 2015:08:27 08:24:03 EST] FIX FOR apparmor-CAUSED MySQL START ERROR WHEN USING LINKED /tmp DIR>

PROBLEM



SOLUTION

1. EDIT FILE, ADD /data/tmp DIRECTORY

emacs -nw /etc/apparmor.d/abstractions/user-tmp

    # ------------------------------------------------------------------
    #
    #    Copyright (C) 2002-2009 Novell/SUSE
    #    Copyright (C) 2009-2010 Canonical Ltd.
    #
    #    This program is free software; you can redistribute it and/or
    #    modify it under the terms of version 2 of the GNU General Public
    #    License published by the Free Software Foundation.
    #
    # ------------------------------------------------------------------
     
      # per-user tmp directories
      owner @{HOME}/tmp/**  rwkl,
      owner @{HOME}/tmp/    rw,
     
      # global tmp directories
      owner /var/tmp/**     rwkl,
      /var/tmp/             rw,
      owner /tmp/**         rwkl,
      /tmp/                 rw,

     #moved tmp directory to /data/tmp
    owner /data/tmp/**    rwkl,
    /data/tmp/            rw,

2. RESTART apparmor

service apparmor restart


3. SET PERMISSIONS ON LINKED /tmp DIR

chmod 1777 /data/tmp


4. RESTART MYSQL

service mysql restart

    OK
    

</entry>
<entry [Fri 2015:04:10 17:48:55 EST] MYSQL WORKBENCH - SYNCHRONISE ERR WITH MODEL>

http://stackoverflow.com/posts/2682210/edit

Database > Synchronize Model...
Choose Stored Connection
Select the Schemata
Choose which to update: Model or Source (in your case, point arrows to Model)
List item
List item
List item


Update: nevermind. I redact my solution, but can't seem to delete this post.

shareimprove this answer
answered May 5 '11 at 4:09

Jeff B
18614
  	 	
Actually that did it. I just installed the current version of MySQL Workbench (v5.2.33) and the Model Synchronized as I expected without me having to re-organize all the tables. Thanks! –  Tiago Alves May 6 '11 at 10:45
3	 	
That sync just drives me crazy. I only want to update the visual representation (e.g. DatabaseModel.mwb file) but the changes are always applied to the database itself and not the visual representation! What I am doing wrong? –  hfrmobile Jun 10 '13 at 10:36
  	 	
When you are in "Select changes to apply" - Model and Database Differences, your arrow is green and pointing to the right, you must select that row and click on "Update Model" button. –  Jaroslav Štreit Oct 1 '14 at 14:24

	
</entry>
<entry [Fri 2015:04:10 14:33:59 EST] USE CURRENT_TIMESTAMP TO UPDATE datetime FIELD>

CREATE TABLE test (
  name varchar(10) DEFAULT NULL,
  datetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
)

mysql> insert into test values('test1', NULL);
Query OK, 1 row affected (0.01 sec)

mysql> select * from test;
+-------+---------------------+
| name  | datetime            |
+-------+---------------------+
| test1 | 2015-04-10 14:32:35 |
+-------+---------------------+

mysql> update test set name='test1', datetime=NULL where name='test1';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from test;
+-------+---------------------+
| name  | datetime            |
+-------+---------------------+
| test1 | 2015-04-10 14:33:18 |
+-------+---------------------+


	
</entry>
<entry [Fri 2014:08:29 08:37:27 EST] GET ITEMS ADDED IN LAST HOUR USING datetime TYPE>



select count(*) as cnt
from  log
where date >= DATE_SUB(NOW(),INTERVAL 1 HOUR); 

	
</entry>
<entry [Tue 2014:08:05 15:53:32 EST] SHOW MYSQL SYSTEM VARIABLES>

Ways to see the names and values of system variables:


Show compiled-in defaults and option files:

mysqld --verbose --help


Show compiled-in defaults only, ignoring the settings in any option files:

mysqld --no-defaults --verbose --help


See the current values used by a running server:

SHOW VARIABLES 
	
	
</entry>
<entry [Sat 2013:12:21 00:08:09 EST] FIXED ERROR ON CENTOS: 'Another MySQL daemon already running with the same unix socket'>

SUMMARY: MOVE OR REMOVE OLD /var/lib/mysql/mysql.sock


PROBLEM

MYSQL WON'T RESTART BECAUSE OF EXISTING *.sock FILE

service mysqld restart

	Another MySQL daemon already running with the same unix socket

AND SOCK FILE EXISTS:

/var/lib/mysql/mysql.sock
	

SOLUTION

ADD TO STARTUP SCRIPT

emacs -nw /etc/init.d/mysqld

LINES

	if [ -f /var/lib/mysql/mysql.sock ]; then
		mv /var/lib/mysql/mysql.sock /var/lib/mysql/mysql.sock.bkp;
	fi

	
</entry>
<entry [Fri 2013:12:20 23:46:36 EST] CHECK IF MYSQL IS CONFIGURED TO START ON BOOT>


chkconfig --list mysqld

	mysqld         	0:off	1:off	2:on	3:on	4:on	5:on	6:off


	
</entry>
<entry [Thu 2013:12:05 06:20:06 EST] UNINSTALL MYSQL ON UBUNTU>

1. REMOVE ALL PACKAGES

sudo apt-get remove --purge mysql-server mysql-client mysql-common
sudo apt-get autoremove
sudo apt-get autoclean

2. CONFIRM REMOVED

dpkg --get-selections | grep mysql


</entry>
<entry [Wed 2013:11:27 21:21:53 EST] GRANT ACCESS TO DATABASE>

GRANT ALL PRIVILEGES ON DATABASE.* TO 'USERNAME'@'localhost';

	
</entry>
<entry [Wed 2013:11:27 21:11:30 EST] RESET USER PASSWORD>

UPDATE user SET Password=PASSWORD('YOURNEWPASSWORD') WHERE User='YOURUSERNAME'; FLUSH PRIVILEGES; exit;
	
</entry>
<entry [Fri 2013:08:09 02:16:37 EST] INSERT ... SELECT SYNTAX>

NB: DON'T USE 'values'

insert into aguadev.viewfeature  ( select * from aguatest.viewfeature );

    
</entry>
<entry [Fri 2013:03:08 10:08:20 EST] CREATE DATABASE ON COMMAND LINE>

mysql -uroot -ppassword -e "CREATE DATABASE testdb"

NB: Password will be obfuscated by client (replaces it with "x" characters)

    root      7258  0.0  0.0 106852  2268 pts/0    S+   10:11   0:00 mysql -u root -px xxx

</entry>
<entry [Sat 2012:12:29 05:12:07 EST] ADD USER>

CREATE USER 'confluence'@'localhost' IDENTIFIED BY 'XXXXXXX';
GRANT ALL PRIVILEGES ON confluence.* TO 'confluence'@'localhost';
    
</entry>
<entry [Mon 2012:11:05 00:55:45 EST] KILL MYSQL WITH PERL>
    
method stopMysql {
	$self->logDebug("");
	my $mysql = $self->getMysql();
    my $command = "$mysql stop";
	print "Agua::Init::mountMysql    command: $command\n";
	print `$command`;
}

method getMysql {
	my $mysql = "/etc/init.d/mysqld";
	$mysql = "/etc/init.d/mysql" if not -f $mysql;
	
	return $mysql;
}

method killMysql {
#### KILL MYSQL IF RUNNING
	$self->logDebug("");
	my @lines = split "\n", `ps aux | egrep "^mysql"`;
	$self->logDebug("lines", \@lines);
	foreach my $line ( @lines ) {
		$self->logDebug("line", $line);
		my ($pid) = $line =~ /^mysql\s+(\d+)/;
		$self->logDebug("pid", $pid);
		my $command = "kill -9 $pid";
		$self->logDebug("command", $command);
		`$command`;
	}	
}


 
</entry>
<entry [Mon 2012:11:05 00:48:28 EST] KILL MANY MYSQL CONNECTIONS INSIDE MYSQL CONSOLE>

Mass killing of MySQL Connections
May 21, 2009 By Peter Zaitsev 27 Comments
 
inShare
1
Every so often I run into situation when I need to kill a lot of connections on MySQL server – for example hundreds of instances of some bad query is running making server unusable. Many people have special scripts which can take the user, source host or query as a parameter and perform the action. There is also a way to do it just using MySQL with a few commands:
mysql> select concat('KILL ',id,';') from information_schema.processlist where user='root';
+------------------------+
| concat('KILL ',id,';') |
+------------------------+
| KILL 3101;             |
| KILL 2946;             |
+------------------------+
2 rows in set (0.00 sec)

mysql> select concat('KILL ',id,';') from information_schema.processlist where user='root' into outfile '/tmp/a.txt';
Query OK, 2 rows affected (0.00 sec)

mysql> source /tmp/a.txt;
Query OK, 0 rows affected (0.00 sec)

    
</entry>
<entry [Sun 2012:09:30 15:37:07 EST] START MYSQL AUTOMATICALLY ON BOOT>

1. ADD 'service mysql start' TO /etc/rc.local

OR

2. USE update-rc.d

sudo update-rc.d -f mysql remove
sudo update-rc.d mysql defaults

OR

3. USE chkconfig

    mysql                     0:off  1:off  2:on   3:on   4:on   5:on   6:off

chkconfig --level 345 mysql on

NOTE: THIS CREATES ERRORS:



FIRST, FIX ERROR:
    /sbin/insserv: No such file or directory

ln -s /usr/lib/insserv/insserv /sbin/insserv

chkconfig --add mysql


</entry>
<entry [Wed 2012:01:25 14:50:56 EST] DROP USER WITH 'drop user 'username'@'localhost" TO COMPLETELY REMOVE >

show grants for aguatest;
    | Grants for aguatest@%                                                                          | GRANT USAGE ON *.* TO 'aguatest'@'%' IDENTIFIED BY PASSWORD '*F4E9C97D2B27EDF6D7DA554C65995C0C90D8813E'


drop user aguatest;
    Query OK, 0 rows affected (0.00 sec)

show grants for aguatest;
    ERROR 1141 (42000): There is no such grant defined for user 'aguatest' on host '%'


BUT THE GRANTS STILL EXIST WHEN I DO show grants, 

show grants;
+-----------------------------------------------------------------------------------------------------------------+
| Grants for aguatest@localhost                                                                                   |
+-----------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'aguatest'@'localhost' IDENTIFIED BY PASSWORD '*A9422BBBCD7622213EACF917451FF504D53E62DE' |
| GRANT ALL PRIVILEGES ON `testversion`.* TO 'aguatest'@'localhost'                                               |
| GRANT ALL PRIVILEGES ON `agua`.* TO 'aguatest'@'localhost'



SO REDID DROP WITH CORRECT SYNTAX, I.E., INCLUDING THE ' QUOTATION MARKS:


DROP USER 'aguatest'@'localhost';


AFTER WHICH THE aguatest USER COULD NOT 'show grants' AND COULD NOT LOG BACK IN AFTER LOGGING OUT:

show grants;
    ERROR 1141 (42000): There is no such grant defined for user 'aguatest' on host 'localhost'
    mysql> 


</entry>
<entry [Wed 2012:01:25 14:40:56 EST] HOW TO REVOKE ALL PRIVILEGES FROM A USER>

NOTE: THE ' QUOTATION MARKS ARE ESSENTIAL!!!

1. BEFORE REVOKE

| GRANT USAGE ON *.* TO 'aguatest'@'localhost' IDENTIFIED BY PASSWORD '*A9422BBBCD7622213EACF917451FF504D53E62DE' |
| GRANT ALL PRIVILEGES ON `testversion`.* TO 'aguatest'@'localhost'                                               |
| GRANT ALL PRIVILEGES ON `agua`.* TO 'aguatest'@'localhost'  


2. DO REVOKE

REVOKE ALL PRIVILEGES ON *.* FROM 'aguatest'@'localhost';


3. AFTER REVOKE

SHOW GRANTS FOR aguatest@localhost;

    GRANT USAGE ON *.* TO 'aguatest'@'localhost' IDENTIFIED BY PASSWORD '*A9422BBBCD7622213EACF917451FF504D53E62DE' |
    | GRANT ALL PRIVILEGES ON `testversion`.* TO 'aguatest'@'localhost'                                               |
    | GRANT ALL PRIVILEGES ON `aguatest`.* TO 'aguatest'@'localhost'                                                  |
    | GRANT ALL PRIVILEGES ON `agua`.* TO 'aguatest'@'localhost'



| GRANT USAGE ON *.* TO 'aguatest'@'localhost' IDENTIFIED BY PASSWORD '*A9422BBBCD7622213EACF917451FF504D53E62DE' |
| GRANT ALL PRIVILEGES ON `testversion`.* TO 'aguatest'@'localhost'                                               |
| GRANT ALL PRIVILEGES ON `agua`.* TO 'aguatest'@'localhost'  

NB: THIS DOES NOT WORK

REVOKE ALL PRIVILEGES, GRANT OPTION FROM aguatest;

NOR DOES 'REVOKE USAGE' DOES NOT WORK

REVOKE USAGE ON *.* FROM aguatest;

    
</entry>
<entry [Wed 2012:01:25 14:37:06 EST] HOW TO ADD 'SHOW DATABASES' PRIVILEGE TO A USER>

http://kb.mediatemple.net/questions/788/HOWTO%3A+GRANT+privileges+in+MySQL#dv

1. GRANT 'SHOW DATABASES' PRIVILEGE

grant SHOW DATABASES ON *.* to 'aguatest'@'localhost' identified by '99999999';


2. CONFIRM THE USER CAN NOW USE mysqlshow TO SHOW ALL DATABASES

mysqlshow -u aguatest -p99999999 
+--------------------------+
|        Databases         |
+--------------------------+
| information_schema       |
| agua                     |
| #mysql50#agua-aquarius-8 |
| mysql                    |
| test                     |
+--------------------------+


    
</entry>

<entry [Sun 2012:01:01 23:48:44 EST] USE trace TO TROUBLESHOOT>


$self->dbobject()->dbh()->trace( 5 );

    
</entry>
<entry [Mon 2011:12:05 00:21:31 EST] SHOW GRANTS AND REVOKE PRIVILEGES>

SHOW GRANTS FOR aguatest@localhost;

+-----------------------------------------------------------------------------------------------------------------+
| Grants for aguatest@localhost                                                                                   |
+-----------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO 'aguatest'@'localhost' IDENTIFIED BY PASSWORD '*5C1A3F8A33280E0B0A2882A9D8DF390CD5F2BEAC' |
| GRANT ALL PRIVILEGES ON `testversion`.* TO 'aguatest'@'localhost'                                               |
| GRANT ALL PRIVILEGES ON `aguatest`.* TO 'aguatest'@'localhost'                                                  |
+-----------------------------------------------------------------------------------------------------------------+


REVOKE ALL PRIVILEGES
ON *.*
FROM aguatest@localhost


GRANT ALL ON aguatest.* TO aguatest@localhost IDENTIFIED BY '99999999';
    

</entry>
<entry [Fri 2011:11:25 00:17:06 EST] DELETE OLD ENTRIES IN A TABLE WITH timediff AND systdate>

USE 

select * from table where timediff(sysdate(),datetime) < 25 *  3600

    
</entry>
<entry [Thu 2011:11:24 16:56:48 EST] EXPORT HISTORY FILE>

DEFAULT HISTORY FILE:

~/.mysql_history

EXPORT TO A DIFFERENT FILE:

export MYSQL_HISTFILE=~/.mysql_history.agua
    
</entry>
<entry [Thu 2011:07:21 04:57:12 EST] REPLACE STRINGS>

http://dev.mysql.com/doc/refman/5.0/en/string-functions.html

SET SESSION SQL_MODE='NO_BACKSLASH_ESCAPES';
    Query OK, 0 rows affected (0.00 sec)

select replace (value, '\\', '\\') from stageparameter where username='syoung' and project='Project1' and workflow='TEST1' and appname='ELAND' and name='inputtype' \G 
    replace (value, '\\', '\\'): \\\\\\
    
select *, replace (value, '\\', '\') from stageparameter where username='syoung' and project='Project1' and workflow='TEST1' and appname='ELAND' and name='inputtype' \G 
*************************** 1. row ***************************
                  username: syoung
                     owner: admin
                   project: Project1
                  workflow: TEST1
            workflownumber: 0
                   appname: ELAND
                 appnumber: 1
                      name: inputtype
                 paramtype: input
                  category: inputtype
                 valuetype: string
                  argument: --inputtype
                     value: \\\\\\
                discretion: required
                    format: 
               description: Type of input sequence. Valid inputs: fastq, fasta, export or qseq\\\\\\
                      args: 
               inputParams: 
             paramFunction: 
                   chained: 0
replace (value, '\\', '\'): \\\
1 row in set (0.00 sec)



select replace (value, '\\', '\') from stageparameter where username='syoung' and project='Project1' and workflow='TEST1' and appname='ELAND' and name='inputtype' \G 
*************************** 1. row ***************************
replace (value, '\\', '\'): \\\


select replace (value, '\\', '\\') from stageparameter where username='syoung' and project='Project1' and workflow='TEST1' and appname='ELAND' and name='inputtype' \G 
*************************** 1. row ***************************
replace (value, '\\', '\\'): \\\\\\
1 row in set (0.00 sec)


SELECT REPLACE('www.mysql.com', 'w', 'Ww');
    WwWwWw.mysql.com 

SELECT REPLACE(REPLACE(REPLACE('abc','a','x'),'b','y'),'c','z');
    xyz

UPDATE MyTable
SET StringColumn = REPLACE (StringColumn, 'SearchForThis', 'ReplaceWithThis')
WHERE SomeOtherColumn LIKE '%PATTERN%'


UPDATE MyTable
SET StringColumn = REPLACE (StringColumn, 'GREATERTHAN', '<')
WHERE articleItemLIKE '%GREATERTHAN%'

    
</entry>
<entry [Sat 2011:04:30 19:52:53 EST] START MYSQL>

sudo -u mysql mysqld
    
</entry>

<entry [Sat 2011:04:30 19:33:49 EST] SETTING PASSWORDS>

sudo /etc/init.d/mysql stop
sudo mysqld --skip-grant-tables &
mysql -u root mysql
UPDATE user SET Password=PASSWORD('YOURNEWPASSWORD') WHERE User='root';
FLUSH PRIVILEGES;
exit;

    
</entry>

<entry [Sat 2011:04:30 19:31:35 EST] CHECK FOR mysqld LISTENING ON PORT>

netstat -ln | grep mysql

telnet localhost 3306

    Trying 127.0.0.1...
    telnet: Unable to connect to remote host: Connection refused
    root@ip-10-124-231-156:/var/log# 

    THIS MEANS ITS BLOCKED

</entry>