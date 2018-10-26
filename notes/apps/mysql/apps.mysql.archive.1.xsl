apps.mysql.archive.1

<entry [Wed Apr 21 09:58:33 EDT 2010] OPTIMISING MYSQL ON EC2 >

1. CHECK PERFORMANCE

- use the BENCHMARK comand,
- set you startup options correctly,
- optimize the table structure (using the OPTIMIZE command!)
- optimize queries using EXPLAIN


2. CREATE INDEXES

Beyond hardware and software optimization is the optimization of tables, as well as SELECT queries. Table optimization, using the OPTIMIZE command, allows you to reclaim unused space. You can see how well (or not) optimized your queries are by using the EXPLAIN command. The resulting output will show if and when indexes are used, and whether you can use any indexes to speed up the given query.

Please keep in mind that adding an index will initially slow dow nyour database (the index needs to be set up and maintained by the system), but will speed up searches.

Also, keep in mind that indexes only work when the index is exactly the same as the searched values in the where clause. So, if you have an index on, say, ClientNo, but there is a select * from clients where clientno=10020 AND name ="Jones", the index will not work properly.

Other sources:
http://www.databasejournal.com/features/mysql/article.php/1382791
Badly defined or non-existent indexes are one of the primary reasons for poor performance, and fixing these can often lead to phenomenal improvements.


3. SET MEMORY, ETC.

http://www.debianhelp.co.uk/mysqlperformance.htm
Mysql provides a configuration file located in /etc/mysql/my.cnf. From here you can set all of the memory, table, and connection limits as well as a host of other options.

You can get the default buffer sizes used by the mysqld server with this command:

shell> mysqld --help
Optimize Mysql Database response time

The most important part for getting a system fast is of course the basic design. You also need to know what kinds of things your system will be doing, and what your bottlenecks are.


Q: How do you decide which fields in a MYSQL database to Index?
If you have a MYSQL database table with 20 or so fields, which ones do you decide to index? Is it only the primary key fields you index? Or should you index others? (2 answers - asked 39 months ago)
A: You index the fields that are expected to be used for look-ups.
Most generally, the index will cover the primary field(s). However, if there are going to be many searches on a non-primary field, you should validate whether putting in an index on that field is valid or not.



SOURCE:

http://askville.amazon.com/SimilarQuestions.do?req=large-MYSQL-database-amazon-S3-EC2

What is the best way to use a very large MYSQL database with amazon S3 and EC2?

My database is starting to get very large and slow down my dedicated server. I'm thinking about moving to Amazon storage. How can I make this move? I know amazon storage doesn't use MYSQL, but key=>value based storage. What is a...... (1 answer - asked 29 months ago)
A: It can be done, but not well
Amazon's EC2 service is a fantastic deal for a small-to-medium-sized company that needs scalability.  You build up your solution as a virtual machine image and they stick it on any number of machines you ask.  Easy as pie.

Amazon's S3 service is also pretty great.  You send some data and a key, and they store that data for you and let you retrieve it later with that same key.  Plenty of rights and permissions and whatnot, easy API's.  Very awesome stuff.

However, S3 is not a relational database.  It's a hash table.  You can MAKE it be a database, but it's extremely non-optimal.  This guy did it, and he's got some source code and a presentation on it if you really want to do that: http://fallenpegasus.com/code/mysql-awss3/

His presentation explains the main hiccup with trying to turn a hash into a database.  There's no WHERE clause.  You've got to pull down all of the possibly-interesting rows every single time, and that's just far too expensive, time-wise and money-wise.

Here's what you SHOULD do.  Use the EC2 service alone.  The biggest single machine they offer has 1.7 PETABYTES of storage space.  Run a MYSQL server on your EC2 service.  It's got more than enough space.  Run your program on the same machine, or possibly on a dedicated separate machine.  Think of the S3 services as your own personal computers.  You can do anything you want with them, and they're perfectly good database boxes.  They'll run you about 70 cents per hour.  You can probably get by with the lower-tier machines for quite some time, though.

So that's my advice.  Do NOT use S3 as something it's not.  Use it to store images or documents or customer data or webpages or whatever you like, but don't try to use it like a relational database.  Use a relational database for that.  And run your relational database on EC2.

Also, here's a good price calculator for EC2 and S3: http://calculator.s3.amazonaws.com/calc5.html?
Sources: http://www.amazon.com/b/ref=sc_fe_c_0_370375011_1/105-2628125-0034036?ie=UTF8&node=201590011&no=370375011
Q: What is the best way of optimizing a mysql database?
Short of referential integrity, how else should a mysql database be optimized? (1 answer - asked 39 months ago)
A: See below

At this site, http://www.samspublishing.com/articles/article.asp?p=29406&rl=1 there is a guideline on how to optimize your database.
In short,
- use the BENCHMARK comand,
- set you startup options correctly,
- optimize the table structure (using the OPTIMIZE command!)
- optimize queries using EXPLAIN

Summary
Running an optimized MySQL server starts with the hardware and operating system in use. Your system's CPU should be sufficiently fast, and you should have enough RAM in use to pick up the slack when your CPU struggles. This is especially true if MySQL shares resources with other processes, such as a Web server. Additionally, the hard drive in use is important, as a small hard drive will limit the amount of information you can store in your database. The seek time of your hard drive is importanta slow seek time will cause the overall performance of the server to be slower. Your operating system should not overwhelm your machine and should share resources with MySQL rather than using all the resources itself.

Some key startup parameters for MySQL are the values of key_buffer_size and table_cache, among others. Baseline values can be found in sample MySQL configuration files, or you can modify the values of these variables and watch the server performance to see whether you hit on the right result for your environment.

Beyond hardware and software optimization is the optimization of tables, as well as SELECT queries. Table optimization, using the OPTIMIZE command, allows you to reclaim unused space. You can see how well (or not) optimized your queries are by using the EXPLAIN command. The resulting output will show if and when indexes are used, and whether you can use any indexes to speed up the given query.

With all optimizationhardware, software, or related to queriestry to perform the modifications and tests in a development environment rather than a production environment. Locked tables or degraded server performance should be worked out in the development environment and not during prime time!
__

Other sources:
http://www.databasejournal.com/features/mysql/article.php/1382791
Badly defined or non-existent indexes are one of the primary reasons for poor performance, and fixing these can often lead to phenomenal improvements.

http://www.debianhelp.co.uk/mysqlperformance.htm
Mysql provides a configuration file located in /etc/mysql/my.cnf. From here you can set all of the memory, table, and connection limits as well as a host of other options.

You can get the default buffer sizes used by the mysqld server with this command:

shell> mysqld --help
Optimize Mysql Database response time

The most important part for getting a system fast is of course the basic design. You also need to know what kinds of things your system will be doing, and what your bottlenecks are.

The most common bottlenecks are:

Disk seeks. It takes time for the disk to find a piece of data. With modern disks in 1999, the mean time for this is usually lower than 10ms, so we can in theory do about 100 seeks a second. This time improves slowly with new disks and is very hard to optimise for a single table. The way to optimise this is to spread the data on more than one disk.

Disk reading/writing. When the disk is at the correct position we need to read the data. With modern disks in 1999, one disk delivers something like 10-20 MB. This is easier to optimise than seeks because you can read in parallel from multiple disks.

CPU cycles. When we have the data in main memory (or if it already were there) we need to process it to get to our result. Having small tables compared to the memory is the most common limiting factor. But then, with small tables speed is usually not the problem.

Memory bandwidth. When the CPU needs more data than can fit in the CPU cache the main memory bandwidth becomes a bottleneck. This is an uncommon bottleneck for most systems, but one should be aware of it.

Sources: http://www.samspublishing.com/articles/article.asp?p=29406&rl=1

Q: How do you decide which fields in a MYSQL database to Index?

If you have a MYSQL database table with 20 or so fields, which ones do you decide to index? Is it only the primary key fields you index? Or should you index others? (2 answers - asked 39 months ago)

A: You index the fields that are expected to be used for look-ups.

Most generally, the index will cover the primary field(s). However, if there are going to be many searches on a non-primary field, you should validate whether putting in an index on that field is valid or not.

Please keep in mind that adding an index will initially slow down your database (the index needs to be set up and maintained by the system), but will speed up searches.

Also, keep in mind that indexes only work when the index is exactly the same as the searched values in the where clause. So, if you have an index on, say, ClientNo, but there is a select * from clients where clientno=10020 AND name ="Jones", the index will not work properly.
Sources: My knowledge 



</entry>



<entry [Wed Mar 31 00:57:30 EDT 2010] GOOD SITE ON INSTALLING MYSQL ON WINDOWS>

http://www.sitepoint.com/blogs/2009/03/24/how-to-install-mysql/

mysql> select distinct user from user;
+-------+
| user  |
+-------+
| admin | 
| ibis  | 
| root  | 
| aqwa  | 
+-------+
4 rows in set (0.00 sec)



mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema | 
| aqwa               | 
| ibis_db            | 
| jbrowse            | 
| mysql              | 
| test               | 
+--------------------+
6 rows in set (0.00 sec)


</entry>
<entry [Thu Feb 11 01:22:26 EST 2010] REINSTATE GRANT TABLES FOR PASSWORD AUTHENTICATION AFTER STARTING WITH --skip-grants>

PROBLEM

ANY USER CAN NOW LOG ON WITHOUT USING A PASSWORD BUT WE DON'T WANT TO RESTART THE SERVER

   [syoung@ngsdev cgi-bin]$ mysql -u root -p
   Enter password: < NOTHING ENTERED, JUST RETURN>
   Welcome to the MySQL monitor.  Commands end with ; or \g.
   Your MySQL connection id is 1941
   Server version: 5.0.45 Source distribution
   
   Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
   
   mysql> exit

SOLUTION

USE mysqladmin flush-privileges password '*'

MQ
NB: mysqladmin PASSWORD COMMAND DOESN'T WORK WHEN DB ALREADY STARTED WITH --skip-grants

mysqladmin -u root password open4root
   mysqladmin: 
   You cannot use 'password' command as mysqld runs
    with grant tables disabled (was started with --skip-grant-tables).

   Use: "mysqladmin flush-privileges password '*'" instead


SO FLUSH PRIVILEGES FOR ALL USERS:

mysqladmin flush-privileges password '*'
   mysqladmin: unable to change password; error: 'Can't find any matching row in the user table'

mysqladmin flush-privileges password 'root'
   mysqladmin: connect to server at 'localhost' failed
   error: 'Access denied for user 'root'@'localhost' (using password: NO)


</entry>
<entry [Thu Feb 11 01:22:26 EST 2010] GET MYSQL ENVIRONMENT VARIABLES>



mysql_config --libs
mysql_config --include


E.G., FOR INSTALLING
SEE Notes-apps-kent.txt
Thu Feb 11 00:44:46 EST 2010
INSTALLED kent


</entry>



<entry [Tues Feb 02 13:40:37 EDT 2010] MYSQL ERROR LOG ON WINDOWS (BUT NOT DETAILED ERROR LOG)>




TRYING TO FIGURE OUT WHY 'SELECT * INTO OUTFILE' DOESN'T WORK ON WINDOWS...


http://dev.mysql.com/doc/refman/5.0/en/query-log.html


THE DATA DIRECTORY LOCATION IS INSIDE E:/mysql/my.ini:

#Path to the database root
datadir="C:/Documents and Settings/All Users/Application Data/MySQL/MySQL Server 5.1/Data/"

THE ERROR FILE IS HERE:
(All the errors are logged into this file.)

C:/Documents and Settings/All Users/Application Data/MySQL/MySQL Server 5.1/Data/ComputerName.err


BUT NO GENERAL LOG FILE CREATED BY DEFAULT. TO ADD THE LOG FILE:


1. RESTART MYSQL SERVER WITH --log:

   1. Open Services on your computer
   2. Stop the MySQL server
   3. Run mysqld from the command line:

mysqld.exe --defaults-file="E:\\mysql\\my.ini" --log-error --log-warnings --general_log


2. LOOK IN DATA DIRECTORY FOR LOG FILE:

C:/Documents and Settings/All Users/Application Data/MySQL/MySQL Server 5.1/Data/s1.log


   mysqld.exe, Version: 5.1.42-community-log (MySQL Community Server (GPL)). started with:
   TCP Port: 3306, Named Pipe: (null)
   Time                 Id Command    Argument
   100202 13:55:25	    1 Connect	aqwa@localhost on aqwa
               1 Query	set autocommit=1
               1 Query	SHOW TABLES
               1 Query	SELECT * from access INTO OUTFILE E:\0.4\bin\sql\01\access.tsv
               1 Query	SELECT * from app INTO OUTFILE E:\0.4\bin\sql\01\app.tsv
               1 Query	SELECT * from aqwausers INTO OUTFILE E:\0.4\bin\sql\01\aqwausers.tsv
               1 Query	SELECT * from diffs INTO OUTFILE E:\0.4\bin\sql\01\diffs.tsv
   ...








</entry>



<entry [Fri Jan 08 13:40:37 EDT 2010] TRIED TO FIX MYSQL 5.0 ERROR ON CSV INSERT: Incorrect datetime value:''>



... BUT INSTEAD JUST RESTRICTED THE INSERTED FIELDS TO NOT CONTAIN NULL DATETIME AND INTEGER FIELDS




http://kb.helpdeskpilot.com/knowledgebase.php?act=art&article_id=124

If you get the "insert into" error with "Incorrect datetime value: '' for some column, this error occurs due to the restricted mode of the database which doesn't allow the null value insertion, to rectify the issue please follow the below mentioned steps.

1) Find out the value of the variable 'sql_mode' from your database configuration details.

2) To know the value of the variable 'sql_mode', please execute the following query in your mysql query browser:

SELECT @@SESSION.sql_mode;
or
SELECT @@global.sql_mode;

3) If this variable contains value like : STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER etc.... then this is the reason for the occurrence of the error.

4) Modify the value of the variable sql_mode to null to resolve the issue.

5) To do that execute the following query:
set global sql_mode='';

This will change the variable value to null.

Now, open the my.ini file located at c:program files/MySQL/MySQL Server X.x/my.ini.

Add a # at the begining of the line: sql-mode="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"

Type sql_mode='' on the next line and save the file.


I.E., DID THIS:


#### DISABLED STRICT MODE TO FIX MYSQL 5.0 ERROR
#### ON CSV INSERT: Incorrect datetime value:''

####sql-mode="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"

sql_mode=''



</entry>



<entry [Tues Jan 05 13:40:37 EDT 2010] CREATE DATABASE INSTALL SCRIPT USING mysqldump --no-data>

http://dev.mysql.com/doc/workbench/en/wb-reverse-engineer-create-script.html

Create a data definition (DDL) script:

mysqldump db_name --no-data > script_file.sql


Using the --no-data option ensures that the script contains DDL statements only.


Note
If you plan to redesign a database within MySQL Workbench and then export the changes, be sure to retain a copy of the original DDL script. You will need the original script in order to create an ALTER script.

For more information, see Section 6.5.10.1.2, 'Altering a Schema'.


</entry>
<entry [Thurs Jan 22 13:40:37 EDT 2009] dozer DOWN, USE tank INSTEAD>

mysql -u ngsadmin -paccessngs -h tank.ccs.miami.edu  -P 3307

</entry>
<entry [Thurs Jan 22 13:40:37 EDT 2009] MYSQL ACCOUNT ON dozer>

-----Original Message-----
From: Warnes, Sebastian 
Sent: Monday, October 27, 2008 11:34 AM
To: Young, Stuart
Subject: RE: mysql account on dozer

Hi Stuart,

The access to dozer has been create, please let me know if you find any problem with it.

Thanks,

Sebastian

-----Original Message-----
From: Young, Stuart 
Sent: Friday, October 24, 2008 3:55 PM
To: Warnes, Sebastian
Subject: mysql account on dozer

Hi Sebastian,

Following up on our chat just now, could you please set the following mysql account on dozer for me:

Database: ngs
User: ngsadmin
Pass: accessngs

Cheers,

Stuart.



</entry>



<entry [Sun Aug 17 13:40:37 EDT 2008] RESET THE ROOT PASSWORD>



FROM: http://www.mydigitallife.info/2006/04/23/reset-the-root-password-of-mysql-server/

   1. Stop mysqld and restart it with the --skip-grant-tables options

ps aux | grep mysqld
kill -9 <PID>
   
   OR
    
sudo su
mysqladmin shutdown

(TYPE THIS OUT, DON'T CUT AND PASTE BECAUSE THE '--' WON'T PASTE NICELY)
mysqld_safe ---skip-grant-tables &


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
<entry [Thu Apr 17 15:59:36 EDT 2008] REPAIRING NODES node001, node002, node007, node010, node013, node016 ON CLUSTER - AFTER MIRROR, FIX MYSQL>



1. FIX HOST NAME
===============

node002:~ vanwye$ sudo changeip - 192.168.2.7 192.168.2.7 node002 node007
Password:

DNS lookup shows name 'node007.cluster.private' for 192.168.2.7, which does not match 'node007'

Do you want to use 'node007.cluster.private' instead? (y/N) y
Updating local node
Updating Password Server config
Updating Open Directory config
Updating hostconfig file
Updating smb.conf file
Updating Kerberos Service Principals and keytabs
klist: No such file or directory while starting scan of keytab (null)
Finished updating Kerberos
Changing IP Addresses and host names for iChat Server
Changing IP Addresses and host names for Mail Server


2. COPY /private/var/mysql/mysql FOLDER AND SET PERMISSIONS:
============================================================

CREATE /private/var/mysql FOLDER IF DOESN'T EXIST:
sudo mkdir /private/var/mysql
sudo chmod 775 /private/var/mysql


FOR ALL NODES (node002,node004,node005,...,node016) INDIVIDUALLY, DO:
nodeXXX
# <password>
sudo scp -r local@129.171.101.102:~/mysql /private/var/mysql
# <node password>
# <gems password>


SET PERMISSIONS AND START MYSQL:

sudo chown -R mysql:wheel /private/var/mysql
sudo mysqld_safe &
ps aux | grep mysql

root      3221   0.0  0.1    27808    708  p0  S     1:30PM   0:00.04 /bin/sh /usr/bin/mysqld_safe
mysql     3259   0.0  5.4   479340  56320  p0  S     1:30PM   0:00.20 /usr/libexec/mysqld --basedir=/usr --datadir=/var/mysql --user=m
vanwye    3263   0.0  0.0    18048    228  p0  R+    1:30PM   0:00.00 grep mysql

OK!!!


NB: WHERE mysql FOLDER CONTAINS THE FOLLOWING:


gems:~ local$ ll mysql/
total 968
drwx------   47 local  wheel      1K Mar 13  2007 .
drwxr-xr-x   45 local  admin      1K Apr 17 15:49 ..
-rw-r-----    1 local  wheel      0B Mar 13  2007 columns_priv.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 columns_priv.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 columns_priv.frm
-rw-r-----    1 local  wheel      2K Mar 13  2007 db.MYD
-rw-r-----    1 local  wheel      4K Mar 13  2007 db.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 db.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 func.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 func.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 func.frm
-rw-r-----    1 local  wheel    864B Mar 13  2007 help_category.MYD
-rw-r-----    1 local  wheel      3K Mar 13  2007 help_category.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 help_category.frm
-rw-r-----    1 local  wheel      6K Mar 13  2007 help_keyword.MYD
-rw-r-----    1 local  wheel     11K Mar 13  2007 help_keyword.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 help_keyword.frm
-rw-r-----    1 local  wheel      4K Mar 13  2007 help_relation.MYD
-rw-r-----    1 local  wheel      9K Mar 13  2007 help_relation.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 help_relation.frm
-rw-r-----    1 local  wheel    184K Mar 13  2007 help_topic.MYD
-rw-r-----    1 local  wheel     15K Mar 13  2007 help_topic.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 help_topic.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 host.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 host.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 host.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 tables_priv.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 tables_priv.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 tables_priv.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone_leap_second.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone_leap_second.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone_leap_second.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone_name.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone_name.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone_name.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone_transition.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone_transition.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone_transition.frm
-rw-r-----    1 local  wheel      0B Mar 13  2007 time_zone_transition_type.MYD
-rw-r-----    1 local  wheel      1K Mar 13  2007 time_zone_transition_type.MYI
-rw-r-----    1 local  wheel      8K Mar 13  2007 time_zone_transition_type.frm
-rw-r-----    1 local  wheel   1016B Mar 13  2007 user.MYD
-rw-r-----    1 local  wheel      2K Mar 13  2007 user.MYI
-rw-r-----    1 local  wheel      9K Mar 13  2007 user.frm


</entry>



<entry [Thu Feb 21 15:37:52 EST 2008] FIX mysql TABLE USING myisamchk ON THE COMMAND LINE >



gems:/private/var/mysql local$ sudo  myisamchk /private/var/mysql/swissprot/collectioniprscan.MYI
Password:
Checking MyISAM file: /private/var/mysql/swissprot/collectioniprscan.MYI
Data records: 2623535   Deleted blocks:       0
- check file-size
myisamchk: error: Size of indexfile is: 16777216        Should be: 247696384
myisamchk: error: Size of datafile is: 62914560          Should be: 214574524
- check record delete-chain
- check key delete-chain
- check index reference
- check data record references index: 1
myisamchk: error: Can't read indexpage from filepos: 118981632
- check record links
myisamchk: error: Found wrong record at 50790336
MyISAM-table '/private/var/mysql/swissprot/collectioniprscan.MYI' is corrupted
Fix it using switch "-r" or "-o"
gems:/private/var/mysql local$ sudo  myisamchk -r /private/var/mysql/swissprot/collectioniprscan.MYI 
- recovering (with sort) MyISAM-table '/private/var/mysql/swissprot/collectioniprscan.MYI'
Data records: 2623535
- Fixing index 1
Key 1 - Found wrong stored record at 50790336
Key 1 - Found wrong stored record at 60522488
Found block that points outside data file at 62914532
Found block that points outside data file at 62914548
Data records: 766080
gems:/private/var/mysql local$ 


</entry>



<entry [Tue Jan 29 13:19:50 EST 2008] GET sum OF count>




drop table if exists counts;
create temporary table if not exists counts ( count int(6) );
insert into counts select count(distinct targetaccession) as count from collectionblast group by collectionid having count >100 and count <=200;

select sum(count) from counts;

+------------+
| sum(count) |
+------------+
|      18224 |
+------------+
1 row in set (0.00 sec)





</entry>



<entry [Fri Jan  4 03:32:11 EST 2008] HIT MAX SIZE FOR innodb DATABASE>



Creating table 'swissprotselfblast' if not exists... done.
Query failed: The table 'swissprotselfblast' is full (1114)
DID NOT LOAD!

LOCATION OF my.cnf:

On Unix, MySQL programs read startup options from the following files:
Filename 	          Purpose
/etc/my.cnf 	    Global options
$MYSQL_HOME/my.cnf 	Server-specific options

I.E.:

/Volumes/Backup/young/FUNNYBASE/mysql/data/my.cnf

VIEW LATEST ERROR MESSAGES:

/usr/local/mysql/data young$ tail -n 100  dlc-genomics.rsmas.miami.edu.err


ADDING myisam_data_pointer_size TO my.cnf DID NOT WORK:

[mysqld]
myisam_data_pointer_size = 5


http://dev.mysql.com/doc/refman/5.0/en/full-table.html
>>>...
 You are using a MyISAM table and the space required for the table exceeds what is allowed by the internal pointer size. MyISAM  creates tables to allow up to 4GB by default (256TB as of MySQL 5.0.6), but this limit can be changed up to the maximum allowable size of 65,536TB (2567 -- 1 bytes).

If you need a MyISAM table that is larger than the default limit and your operating system supports large files, the CREATE TABLE statement supports AVG_ROW_LENGTH and MAX_ROWS options. See Section 11.1.5, 'CREATE TABLE Syntax'. The server uses these options to determine how large a table to allow.

If the pointer size is too small for an existing table, you can change the options with ALTER TABLE to increase a table's maximum allowable size. See Section 11.1.2, 'ALTER TABLE Syntax'.

ALTER TABLE tbl_name MAX_ROWS=1000000000 AVG_ROW_LENGTH=nnn;

You have to specify AVG_ROW_LENGTH only for tables with BLOB or TEXT columns; in this case, MySQL can't optimize the space required based only on the number of rows.

To change the default size limit for MyISAM tables, set the myisam_data_pointer_size, which sets the number of bytes used for internal row pointers. The value is used to set the pointer size for new tables if you do not specify the MAX_ROWS option. The value of myisam_data_pointer_size can be from 2 to 7. A value of 4 allows tables up to 4GB; a value of 6 allows tables up to 256TB.

You can check the maximum data and index sizes by using this statement:

SHOW TABLE STATUS FROM db_name LIKE 'tbl_name';



iprscanset TABLE LENGTH HAS REACHED MAXIMUM LENGTH:

show table status from swissprot like 'iprscanset'\G
*************************** 1. row ***************************
           Name: iprscanset
         Engine: MyISAM
        Version: 9
     Row_format: Dynamic
           Rows: 29722725
 Avg_row_length: 144
    Data_length: 4294967168
Max_data_length: 4294967295
   Index_length: 1757572096
      Data_free: 0
 Auto_increment: NULL
    Create_time: 2008-02-23 08:15:34
    Update_time: 2008-02-23 08:57:27
     Check_time: NULL
      Collation: latin1_swedish_ci
       Checksum: NULL
 Create_options: 
        Comment: 
1 row in set (0.01 sec)



FIX max_data_length:

alter table iprscanset max_rows = 200000000000 avg_row_length = 50;


WHICH TAKES A LONG TIME. THE SHORTER WAY IS TO RE-CREATE THE TABLE:


CREATE TABLE IF NOT EXISTS iprscanset (
    
    collectionid    INT(6),
    
    label           INT(1),
    annotation      VARCHAR(255),
    
    accession           VARCHAR(20) NOT NULL,
    id              VARCHAR(20) NOT NULL,
    targetsource    VARCHAR(20) NOT NULL default '',
    targetid        VARCHAR(20) NOT NULL,
    targetname      VARCHAR(200) NOT NULL,
    interproid      VARCHAR(10) NOT NULL default '',
    interproname    VARCHAR(200) NOT NULL default '',
    interprotype    VARCHAR(20) NOT NULL default '',
    hitscoredec     DECIMAL(4,2) NOT NULL,
    hitscoreexp     SMALLINT(4) NOT NULL,
    hitstatus       VARCHAR(1) NOT NULL,
    querystart      INT(8) NOT NULL default '0',
    querystop       INT(8) NOT NULL default '0',
    childlist       VARCHAR(255) NOT NULL default '',
    foundinlist     VARCHAR(255) NOT NULL default '',
    golist          TEXT,
    
    PRIMARY KEY (collectionid, accession, targetsource, targetid, targetname, interproid, hitscoredec, hitscoreexp, querystart, querystop)
) 
max_rows = 200000000000
avg_row_length = 50;




</entry>



<entry [Fri Dec 21 17:29:23 EST 2007] LOAD DATA INFILE ... IGNORE 1 LINES>



CREATE FILE 'test.tsv':
===============================
#### NOTES
1	'one'
2	'two'
3	'three'
===============================


create table test1 ( one int(2), two varchar(21), primary key(one));
load data infile '/Users/young/FUNNYBASE/bin/orthologues/sql/test.tsv' into table test1 ignore 1 lines;

    Query OK, 3 rows affected (0.03 sec)
    Records: 3  Deleted: 0  Skipped: 0  Warnings: 0

select * from test1;

    +-----+---------+
    | one | two     |
    +-----+---------+
    |   1 | 'one'   |
    |   2 | 'two'   |
    |   3 | 'three' |
    +-----+---------+


</entry>



<entry [Fri Oct 26 03:19:56 EDT 2007] MYSQL MEDIAN AND MODE>



Another take on MEDIAN: The SELECT statement
listed in a comment above does not work for all
lists of values (especially when the median value
is not unique in the list, or when the median
should be the average of the two middle-most
values in an even-sized list). Here is a
three-step process that has worked for me:

CREATE TEMPORARY TABLE medians SELECT x.val FROM
data x, data y GROUP BY x.val HAVING
((COUNT(*)-(SUM(SIGN(1-SIGN(y.val-x.val))))) <=
floor((COUNT(*) +1)/2)) and
((COUNT(*)-(SUM(SIGN(1+SIGN(y.val-x.val))))) <=
floor((COUNT(*) +1)/2));

The resulting medians table will either have 1 or
2 rows. If the size of your original data is an
odd number or the two middle-most data values are
the same there will
only be 1 row. If the size of
your original data is an even number and the
middle data values are not equal, there will be 2
rows. Take the average to get the true median:

SELECT AVG(val) AS median FROM medians;

The last step is to drop your temporary table
medians:

DROP TABLE medians;

I couldn't think of another way to compute the
MEDIAN without using a temporary table. If you
know how to optimize my technique, I would love to
hear from you.


MySQL has no built-in function for computing the mode or median of a set of values, but you can compute them yourself. The mode is the value that occurs most frequently. To determine what it is, count each value and see which one is most common:

mysql> SELECT score, COUNT(score) AS frequency
    -> FROM testscore GROUP BY score ORDER BY frequency DESC;
+-------+-----------+
| score | frequency |
+-------+-----------+
|     9 |         5 |
|     6 |         4 |
|     7 |         4 |
|     4 |         2 |
|     8 |         2 |
|    10 |         2 |
|     5 |         1 |
+-------+-----------+

In this case, 9 is the modal score value.

The median of a set of ordered values can be calculated like this:[*]

    [*] Note that the definition of median given here isn't fully general; it doesn't address what to do if the middle values in the dataset are duplicated.

    *

      If the number of values is odd, the median is the middle value.
    *

      If the number of values is even, the median is the average of the two middle values.

Based on that definition, use the following procedure to determine the median of a set of observations stored in the database:

   1.

      Issue a query to count the number of observations. From the count, you can determine whether the median calculation requires one or two values, and what their indexes are within the ordered set of observations.
   2.

      Issue a query that includes an ORDER BY clause to sort the observations and a LIMIT clause to pull out the middle value or values.
   3.

      If there is a single middle value, it is the median. Otherwise, take the average of the middle values.

For example, if a table t contains a score column with 37 values (an odd number), you need to select a single value to get the median, using a statement like this:

SELECT score FROM t ORDER BY score LIMIT 18,1


If the column contains 38 values (an even number), the statement becomes:

SELECT score FROM t ORDER BY score LIMIT 18,2


sub median
{
my ($dbh, $db_name, $tbl_name, $col_name) = @_;
my ($count, $limit);

  $count = $dbh->selectrow_array ("SELECT COUNT($col_name)
                                   FROM $db_name.$tbl_name");
  return undef unless $count > 0;
  if ($count % 2 == 1)  # odd number of values; select middle value
  {
    $limit = sprintf ("LIMIT %d,1", ($count-1)/2);
  }
  else          # even number of values; select middle two values
  {
    $limit = sprintf ("LIMIT %d,2", $count/2 - 1);
  }

  my $sth = $dbh->prepare ("SELECT $col_name
                            FROM $db_name.$tbl_name
                            ORDER BY $col_name $limit");
  $sth->execute ();
  my ($n, $sum) = (0, 0);
  while (my $ref = $sth->fetchrow_arrayref ())
  {
    ++$n;
    $sum += $ref->[0];
  }
  return ($sum / $n);
}


					  

</entry>



<entry [Fri Oct 26 03:19:38 EDT 2007] STANDARD DEVIATION WITH STDDEV>




create table testscore ( subject int(3), age int(3), sex varchar(1), score int(3) );
insert into testscore values (1, 5, 'M', 5);
insert into testscore values (2, 5, 'M', 4);
insert into testscore values (3, 5, 'F', 6);
insert into testscore values (4, 5, 'F', 7);
insert into testscore values (5, 6, 'M', 8);
insert into testscore values (6, 6, 'M', 9);
insert into testscore values (7, 6, 'F', 4);
insert into testscore values (8, 6, 'F', 6);
insert into testscore values (9, 7, 'M', 8);
insert into testscore values (10, 7, 'M', 6);
insert into testscore values (11, 7, 'F', 9);
insert into testscore values (12, 7, 'F', 7);
insert into testscore values (13, 8, 'M', 9);
insert into testscore values (14, 8, 'M', 6);
insert into testscore values (15, 8, 'F', 7);
insert into testscore values (16, 8, 'F', 10);
insert into testscore values (17, 9, 'M', 9);
insert into testscore values (18, 9, 'M', 7);
insert into testscore values (19, 9, 'F', 10);
insert into testscore values (20, 9, 'F', 9);


+---------+-----+-----+-------+
| subject | age | sex | score |
+---------+-----+-----+-------+
|       1 |   5 | M   |     5 |
|       2 |   5 | M   |     4 |
|       3 |   5 | F   |     6 |
|       4 |   5 | F   |     7 |
|       5 |   6 | M   |     8 |
|       6 |   6 | M   |     9 |
|       7 |   6 | F   |     4 |
|       8 |   6 | F   |     6 |
|       9 |   7 | M   |     8 |
|      10 |   7 | M   |     6 |
|      11 |   7 | F   |     9 |
|      12 |   7 | F   |     7 |
|      13 |   8 | M   |     9 |
|      14 |   8 | M   |     6 |
|      15 |   8 | F   |     7 |
|      16 |   8 | F   |    10 |
|      17 |   9 | M   |     9 |
|      18 |   9 | M   |     7 |
|      19 |   9 | F   |    10 |
|      20 |   9 | F   |     9 |
+---------+-----+-----+-------+

*** OK ***

SELECT age,
COUNT(score) AS n,
SUM(score) AS sum,
MIN(score) AS minimum,
MAX(score) AS maximum,
AVG(score) AS mean,
STDDEV(score) AS 'std. dev.'
FROM testscore
GROUP BY age;



***NOT OK*** STDDEV_SAMP IS MYSQL 5.0 ONLY

SELECT sex, COUNT(score) AS n,
SUM(score) AS sum,
MIN(score) AS minimum,
MAX(score) AS maximum,
AVG(score) AS mean,
STDDEV_SAMP(score) AS 'std. dev.',
VAR_SAMP(score) AS 'variance'
FROM testscore
GROUP BY sex;



create table test ( age int(3), sex varchar(1) );
insert into test values(1, 'f');
insert into test values(2, 'f');
insert into test values(3, 'f');
insert into test values(4, 'f');
insert into test values(4, 'm');
insert into test values(3, 'm');
insert into test values(2, 'm');
insert into test values(1, 'm');

SELECT sex, 
STDDEV(age)
FROM test
group by sex;

SELECT sex, COUNT(age) AS count,
STDDEV(age)
FROM test
GROUP BY sex;

</entry>



<entry [Tue Oct 23 20:20:09 EDT 2007] AUTOCOMPLETE>



rehash


</entry>



<entry [Thu Oct 11 20:09:28 EDT 2007] Mysql Cookbook Ch 2 - Statistical Summaries >



(SAVED PAGES IN dev/mysql/statistical.summary )


A good first step in analyzing a set of observations is to generate some descriptive statistics that summarize their general characteristics as a whole. Common statistical values of this kind include:

    *

      The number of observations, their sum, and their range (minimum and maximum)
    *

      Measures of central tendency, such as mean, median, and mode
    *

      Measures of variation, such as standard deviation and variance

Aside from the median and mode, all of these can be calculated easily by invoking aggregate functions:

mysql> SELECT COUNT(score) AS n,
    -> SUM(score) AS sum,
    -> MIN(score) AS minimum,
    -> MAX(score) AS maximum,
    -> AVG(score) AS mean,
    -> STDDEV_SAMP(score) AS 'std. dev.',
    -> VAR_SAMP(score) AS 'variance'
    -> FROM testscore;
+----+------+---------+---------+--------+-----------+----------+
| n  | sum  | minimum | maximum | mean   | std. dev. | variance |
+----+------+---------+---------+--------+-----------+----------+
| 20 |  146 |       4 |      10 | 7.3000 |    1.8382 |   3.3789 |
+----+------+---------+---------+--------+-----------+----------+


The STDDEV_SAMP( ) and VAR_SAMP( ) functions produce sample measures rather than population measures. That is, for a set of n values, they produce a result that is based on nÐ1 degrees of freedom. If you want the population measures, which are based on n degrees of freedom, use the STDDEV_POP( ) and VAR_POP( ) functions instead. STDDEV( ) and VARIANCE( ) are synonyms for STDDEV_POP( ) and VAR_POP( ).

Standard deviation can be used to identify outliersÑvalues that are uncharacteristically far from the mean. For example, to select values that lie more than three standard deviations from the mean, you can do something like this:

SELECT @mean := AVG(score), @std := STDDEV_SAMP(score) FROM testscore;
SELECT score FROM testscore WHERE ABS(score-@mean) > @std * 3;


MySQL has no built-in function for computing the mode or median of a set of values, but you can compute them yourself. The mode is the value that occurs most frequently. To determine what it is, count each value and see which one is most common:

mysql> SELECT score, COUNT(score) AS frequency
    -> FROM testscore GROUP BY score ORDER BY frequency DESC;
+-------+-----------+
| score | frequency |
+-------+-----------+
|     9 |         5 |
|     6 |         4 |
|     7 |         4 |
|     4 |         2 |
|     8 |         2 |
|    10 |         2 |
|     5 |         1 |
+-------+-----------+


In this case, 9 is the modal score value.

The median of a set of ordered values can be calculated like this:[*]

    [*] Note that the definition of median given here isn't fully general; it doesn't address what to do if the middle values in the dataset are duplicated.

    *

      If the number of values is odd, the median is the middle value.
    *

      If the number of values is even, the median is the average of the two middle values.

Based on that definition, use the following procedure to determine the median of a set of observations stored in the database:

   1.

      Issue a query to count the number of observations. From the count, you can determine whether the median calculation requires one or two values, and what their indexes are within the ordered set of observations.
   2.

      Issue a query that includes an ORDER BY clause to sort the observations and a LIMIT clause to pull out the middle value or values.
   3.

      If there is a single middle value, it is the median. Otherwise, take the average of the middle values.

For example, if a table t contains a score column with 37 values (an odd number), you need to select a single value to get the median, using a statement like this:

SELECT score FROM t ORDER BY score LIMIT 18,1


If the column contains 38 values (an even number), the statement becomes:

SELECT score FROM t ORDER BY score LIMIT 18,2


Then you can select the values returned by the statement and compute the median from their average.

The following Perl function implements a median calculation. It takes a database handle and the names of the database, table, and column that contain the set of observations. Then it generates the statement that retrieves the relevant values and returns their average:



sub median
{
my ($dbh, $db_name, $tbl_name, $col_name) = @_;
my ($count, $limit);

  $count = $dbh->selectrow_array ("SELECT COUNT($col_name)
                                   FROM $db_name.$tbl_name");
  return undef unless $count > 0;
  if ($count % 2 == 1)  # odd number of values; select middle value
  {
    $limit = sprintf ("LIMIT %d,1", ($count-1)/2);
  }
  else          # even number of values; select middle two values
  {
    $limit = sprintf ("LIMIT %d,2", $count/2 - 1);
  }

  my $sth = $dbh->prepare ("SELECT $col_name
                            FROM $db_name.$tbl_name
                            ORDER BY $col_name $limit");
  $sth->execute ();
  my ($n, $sum) = (0, 0);
  while (my $ref = $sth->fetchrow_arrayref ())
  {
    ++$n;
    $sum += $ref->[0];
  }
  return ($sum / $n);
}


					  


The preceding technique works for a set of values stored in the database. If you happen to have already fetched an ordered set of values into an array @val, you can compute the median like this instead:

if (@val == 0)          # if array is empty, median is undefined
{
  $median = undef;
}
elsif (@val % 2 == 1)   # if array size is odd, median is middle number
{
  $median = $val[(@val-1)/2];
}
else                    # array size is even; median is average
{                       # of two middle numbers
  $median = ($val[@val/2 - 1] + $val[@val/2]) / 2;
}


The code works for arrays that have an initial subscript of 0; for languages that use 1-based array indexes, adjust the algorithm accordingly.


Problem

You want to produce descriptive statistics for each subgroup of a set of observations.
Solution

Use aggregate functions, but employ a GROUP BY clause to arrange observations into the appropriate groups.
Discussion

Section 13.1 shows how to compute descriptive statistics for the entire set of scores in the testscore table. To be more specific, you can use GROUP BY to divide the observations into groups and calculate statistics for each of them. For example, the subjects in the testscore table are listed by age and sex, so it's possible to calculate similar statistics by age or sex (or both) by application of appropriate GROUP BY clauses.

Here's how to calculate by age:

mysql> SELECT age, COUNT(score) AS n,
    -> SUM(score) AS sum,
    -> MIN(score) AS minimum,
    -> MAX(score) AS maximum,
    -> AVG(score) AS mean,
    -> STDDEV_SAMP(score) AS 'std. dev.',
    -> VAR_SAMP(score) AS 'variance'
    -> FROM testscore
    -> GROUP BY age;
+-----+---+------+---------+---------+--------+-----------+----------+
| age | n | sum  | minimum | maximum | mean   | std. dev. | variance |
+-----+---+------+---------+---------+--------+-----------+----------+
|   5 | 4 |   22 |       4 |       7 | 5.5000 |    1.2910 |   1.6667 |
|   6 | 4 |   27 |       4 |       9 | 6.7500 |    2.2174 |   4.9167 |
|   7 | 4 |   30 |       6 |       9 | 7.5000 |    1.2910 |   1.6667 |
|   8 | 4 |   32 |       6 |      10 | 8.0000 |    1.8257 |   3.3333 |
|   9 | 4 |   35 |       7 |      10 | 8.7500 |    1.2583 |   1.5833 |
+-----+---+------+---------+---------+--------+-----------+----------+


By sex:

mysql> SELECT sex, COUNT(score) AS n,
    -> SUM(score) AS sum,
    -> MIN(score) AS minimum,
    -> MAX(score) AS maximum,
    -> AVG(score) AS mean,
    -> STDDEV_SAMP(score) AS 'std. dev.',
    -> VAR_SAMP(score) AS 'variance'
    -> FROM testscore
    -> GROUP BY sex;
+-----+----+------+---------+---------+--------+-----------+----------+
| sex | n  | sum  | minimum | maximum | mean   | std. dev. | variance |
+-----+----+------+---------+---------+--------+-----------+----------+
| M   | 10 |   71 |       4 |       9 | 7.1000 |    1.7920 |   3.2111 |
| F   | 10 |   75 |       4 |      10 | 7.5000 |    1.9579 |   3.8333 |
+-----+----+------+---------+---------+--------+-----------+----------+


By age and sex:
Code View: Scroll / Show All

mysql> SELECT age, sex, COUNT(score) AS n,
    -> SUM(score) AS sum,
    -> MIN(score) AS minimum,
    -> MAX(score) AS maximum,
    -> AVG(score) AS mean,
    -> STDDEV_SAMP(score) AS 'std. dev.',
    -> VAR_SAMP(score) AS 'variance'
    -> FROM testscore
    -> GROUP BY age, sex;
+-----+-----+---+------+---------+---------+--------+-----------+----------+
| age | sex | n | sum  | minimum | maximum | mean   | std. dev. | variance |
+-----+-----+---+------+---------+---------+--------+-----------+----------+
|   5 | M   | 2 |    9 |       4 |       5 | 4.5000 |    0.7071 |   0.5000 |
|   5 | F   | 2 |   13 |       6 |       7 | 6.5000 |    0.7071 |   0.5000 |
|   6 | M   | 2 |   17 |       8 |       9 | 8.5000 |    0.7071 |   0.5000 |
|   6 | F   | 2 |   10 |       4 |       6 | 5.0000 |    1.4142 |   2.0000 |
|   7 | M   | 2 |   14 |       6 |       8 | 7.0000 |    1.4142 |   2.0000 |
|   7 | F   | 2 |   16 |       7 |       9 | 8.0000 |    1.4142 |   2.0000 |
|   8 | M   | 2 |   15 |       6 |       9 | 7.5000 |    2.1213 |   4.5000 |
|   8 | F   | 2 |   17 |       7 |      10 | 8.5000 |    2.1213 |   4.5000 |
|   9 | M   | 2 |   16 |       7 |       9 | 8.0000 |    1.4142 |   2.0000 |
|   9 | F   | 2 |   19 |       9 |      10 | 9.5000 |    0.7071 |   0.5000 |
+-----+-----+---+------+---------+---------+--------+-----------+----------+


					  

Recipe 13.3. Generating Frequency Distributions
Problem

You want to know the frequency of occurrence for each value in a table.
Solution

Derive a frequency distribution that summarizes the contents of your dataset.
Discussion

A common application for per-group summary techniques is to generate a breakdown of the number of times each value occurs. This is called a frequency distribution. For the testscore table, the frequency distribution looks like this:

mysql> SELECT score, COUNT(score) AS occurrence
    -> FROM testscore GROUP BY score;
+-------+------------+
| score | occurrence |
+-------+------------+
|     4 |          2 |
|     5 |          1 |
|     6 |          4 |
|     7 |          4 |
|     8 |          2 |
|     9 |          5 |
|    10 |          2 |
+-------+------------+


If you express the results in terms of percentages rather than as counts, you produce a relative frequency distribution. To break down a set of observations and show each count as a percentage of the total, use one query to get the total number of observations and another to calculate the percentages for each group:

mysql> SELECT @n := COUNT(score) FROM testscore;
mysql> SELECT score, (COUNT(score)*100)/@n AS percent
    -> FROM testscore GROUP BY score;
+-------+---------+
| score | percent |
+-------+---------+
|     4 |      10 |
|     5 |       5 |
|     6 |      20 |
|     7 |      20 |
|     8 |      10 |
|     9 |      25 |
|    10 |      10 |
+-------+---------+


The distributions just shown summarize the number of values for individual scores. However, if the dataset contains a large number of distinct values and you want a distribution that shows only a small number of categories, you may want to lump values into categories and produce a count for each category. "Lumping" techniques are discussed in Section 8.12.

One typical use of frequency distributions is to export the results for use in a graphing program. In the absence of such a program, you can use MySQL itself to generate a simple ASCII chart as a visual representation of the distribution. For example, to display an ASCII bar chart of the test score counts, convert the counts to strings of * characters:

mysql> SELECT score, REPEAT('*',COUNT(score)) AS occurrences
    -> FROM testscore GROUP BY score;
+-------+-------------+
| score | occurrences |
+-------+-------------+
|     4 | **          |
|     5 | *           |
|     6 | ****        |
|     7 | ****        |
|     8 | **          |
|     9 | *****       |
|    10 | **          |
+-------+-------------+


To chart the relative frequency distribution instead, use the percentage values:

mysql> SELECT @n := COUNT(score) FROM testscore;
mysql> SELECT score, REPEAT('*',(COUNT(score)*100)/@n) AS percent
    -> FROM testscore GROUP BY score;
+-------+---------------------------+
| score | percent                   |
+-------+---------------------------+
|     4 | **********                |
|     5 | *****                     |
|     6 | ********************      |
|     7 | ********************      |
|     8 | **********                |
|     9 | ************************* |
|    10 | **********                |
+-------+---------------------------+


The ASCII chart method is fairly crude, obviously, but it's a quick way to get a picture of the distribution of observations, and it requires no other tools.

If you generate a frequency distribution for a range of categories where some of the categories are not represented in your observations, the missing categories will not appear in the output. To force each category to be displayed, use a reference table and a LEFT JOIN (a technique discussed in Section 12.8). For the testscore table, the possible scores range from 0 to 10, so a reference table should contain each of those values:

mysql> CREATE TABLE ref (score INT);
mysql> INSERT INTO ref (score)
    -> VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
            


Then join the reference table to the test scores to generate the frequency distribution:

mysql> SELECT ref.score, COUNT(testscore.score) AS occurrences
    -> FROM ref LEFT JOIN testscore ON ref.score = testscore.score
    -> GROUP BY ref.score;
+-------+-------------+
| score | occurrences |
+-------+-------------+
|     0 |           0 |
|     1 |           0 |
|     2 |           0 |
|     3 |           0 |
|     4 |           2 |
|     5 |           1 |
|     6 |           4 |
|     7 |           4 |
|     8 |           2 |
|     9 |           5 |
|    10 |           2 |
+-------+-------------+


This distribution includes rows for scores 0 through 3, none of which appear in the frequency distribution shown earlier.

The same principle applies to relative frequency distributions:

mysql> SELECT @n := COUNT(score) FROM testscore;
mysql> SELECT ref.score, (COUNT(testscore.score)*100)/@n AS percent
    -> FROM ref LEFT JOIN testscore ON ref.score = testscore.score
    -> GROUP BY ref.score;
+-------+---------+
| score | percent |
+-------+---------+
|     0 |       0 |
|     1 |       0 |
|     2 |       0 |
|     3 |       0 |
|     4 |      10 |
|     5 |       5 |
|     6 |      20 |
|     7 |      20 |
|     8 |      10 |
|     9 |      25 |
|    10 |      10 |
+-------+---------+





Recipe 13.5. Calculating Linear Regressions or Correlation Coefficients
Problem

You want to calculate the least-squares regression line for two variables or the correlation coefficient that expresses the strength of the relationship between them.
Solution

Apply summary functions to calculate the necessary terms.
Discussion

When the data values for two variables X and Y are stored in a database, the least-squares regression for them can be calculated easily using aggregate functions. The same is true for the correlation coefficient. The two calculations are actually fairly similar, and many terms for performing the computations are common to the two procedures.

Suppose that you want to calculate a least-squares regression using the age and test score values for the observations in the testscore table:
Code View: Scroll / Show All

mysql> SELECT age, score FROM testscore;
+-----+-------+
| age | score |
+-----+-------+
|   5 |     5 |
|   5 |     4 |
|   5 |     6 |
|   5 |     7 |
|   6 |     8 |
|   6 |     9 |
|   6 |     4 |
|   6 |     6 |
|   7 |     8 |
|   7 |     6 |
|   7 |     9 |
|   7 |     7 |
|   8 |     9 |
|   8 |     6 |
|   8 |     7 |
|   8 |    10 |
|   9 |     9 |
|   9 |     7 |
|   9 |    10 |
|   9 |     9 |
+-----+-------+


					  


The following equation expresses the regression line, where a and b are the intercept and slope of the line:

               Y = bX + a
            


Letting age be X and score be Y, begin by computing the terms needed for the regression equation. These include the number of observations; the means, sums, and sums of squares for each variable; and the sum of the products of each variable:[dagger]

    [dagger] You can see where these terms come from by consulting any standard statistics text.

mysql> SELECT
    -> @n := COUNT(score) AS N,
    -> @meanX := AVG(age) AS 'X mean',
    -> @sumX := SUM(age) AS 'X sum',
    -> @sumXX := SUM(age*age) AS 'X sum of squares',
    -> @meanY := AVG(score) AS 'Y mean',
    -> @sumY := SUM(score) AS 'Y sum',
    -> @sumYY := SUM(score*score) AS 'Y sum of squares',
    -> @sumXY := SUM(age*score) AS 'X*Y sum'
    -> FROM testscore\G
*************************** 1. row ***************************
               N: 20
          X mean: 7.000000000
           X sum: 140
X sum of squares: 1020
          Y mean: 7.300000000
           Y sum: 146
Y sum of squares: 1130
         X*Y sum: 1053


From those terms, calculate the regression slope and intercept as follows:

mysql> SELECT
    -> @b := (@n*@sumXY - @sumX*@sumY) / (@n*@sumXX - @sumX*@sumX)
    -> AS slope;
+-------------+
| slope       |
+-------------+
| 0.775000000 |
+-------------+
mysql> SELECT @a := (@meanY - @b*@meanX) AS intercept;
+----------------------+
| intercept            |
+----------------------+
| 1.875000000000000000 |
+----------------------+


The regression equation then is:

mysql> SELECT CONCAT('Y = ',@b,'X + ',@a) AS 'least-squares regression';
+-----------------------------------------+
| least-squares regression                |
+-----------------------------------------+
| Y = 0.775000000X + 1.875000000000000000 |
+-----------------------------------------+


To compute the correlation coefficient, many of the same terms are used:

mysql> SELECT
    -> (@n*@sumXY - @sumX*@sumY)
    -> / SQRT((@n*@sumXX - @sumX*@sumX) * (@n*@sumYY - @sumY*@sumY))
    -> AS correlation;
+------------------+
| correlation      |
+------------------+
| 0.61173620442199 |
+------------------+



Recipe 13.6. Generating Random Numbers
Problem

You need a source of random numbers.
Solution

Invoke MySQL's RAND?(? ? ?) function.
Discussion

MySQL has a RAND?(? ? ?) function that produces random numbers between 0 and 1:

mysql> SELECT RAND(), RAND(), RAND();
+------------------+--------------------+------------------+
| RAND()           | RAND()             | RAND()           |
+------------------+--------------------+------------------+
| 0.18768198246852 | 0.0052350517411111 | 0.46312934203365 |
+------------------+--------------------+------------------+


When invoked with an integer argument, RAND?(? ? ?) uses that value to seed the random number generator. You can use this feature to produce a repeatable series of numbers for a column of a query result. The following example shows that RAND?(? ? ?) without an argument produces a different column of values per query, whereas RAND( N ) produces a repeatable column:

mysql> SELECT i, RAND(), RAND(10), RAND(20) FROM t;
+------+------------------+------------------+------------------+
| i    | RAND()           | RAND(10)         | RAND(20)         |
+------+------------------+------------------+------------------+
|    1 | 0.60170396939079 | 0.65705152196535 | 0.15888261251047 |
|    2 | 0.10435410784963 | 0.12820613023658 | 0.63553050033332 |
|    3 | 0.71665866180943 | 0.66987611602049 | 0.70100469486881 |
|    4 | 0.27023101623192 | 0.96476222012636 | 0.59843200407776 |
+------+------------------+------------------+------------------+
mysql> SELECT i, RAND(), RAND(10), RAND(20) FROM t;
+------+------------------+------------------+------------------+
| i    | RAND()           | RAND(10)         | RAND(20)         |
+------+------------------+------------------+------------------+
|    1 | 0.55794027034001 | 0.65705152196535 | 0.15888261251047 |
|    2 | 0.22995210460383 | 0.12820613023658 | 0.63553050033332 |
|    3 | 0.47593974273274 | 0.66987611602049 | 0.70100469486881 |
|    4 | 0.68984243058585 | 0.96476222012636 | 0.59843200407776 |
+------+------------------+------------------+------------------+


If you want to seed RAND?(? ? ?) randomly, pick a seed value based on a source of entropy. Possible sources are the current timestamp or connection identifier, alone or perhaps in combination:

RAND(UNIX_TIMESTAMP())
RAND(CONNECTION_ID())
RAND(UNIX_TIMESTAMP()+CONNECTION_ID())


How Random Is RAND?(? ? ?)?

Does the RAND?(? ? ?) function generate evenly distributed numbers? Check it out for yourself with the following Python script, rand_test.py, from the stats directory of the recipes distribution. It uses RAND?(? ? ?) to generate random numbers and constructs a frequency distribution from them, using .1-sized categories. This provides a means of assessing how evenly distributed the values are:
Code View: Scroll / Show All

#!/usr/bin/python
# rand_test.pl - create a frequency distribution of RAND() values.
# This provides a test of the randomness of RAND().

# Method: Draw random numbers in the range from 0 to 1.0,
# and count how many of them occur in .1-sized intervals

import MySQLdb
import Cookbook

npicks = 1000   # number of times to pick a number
bucket = [0] * 10 # buckets for counting picks in each interval

conn = Cookbook.connect ()
cursor = conn.cursor ()

for i in range (0, npicks):
  cursor.execute ("SELECT RAND()")
  (val,) = cursor.fetchone ()
  slot = int (val * 10)
  if slot > 9:
    slot = 9    # put 1.0 in last slot
  bucket[slot] = bucket[slot] + 1

cursor.close ()
conn.close ()

# Print the resulting frequency distribution

for slot in range (0, 9):
  print "%2d  %d" % (slot+1, bucket[slot])


					  


The stats directory also contains equivalent scripts in other languages.

However, it's probably better to use other seed value sources if you have them. For example, if your system has a /dev/random or /dev/urandom device, you can read the device and use it to generate a value for seeding RAND?(? ? ?).

</entry>



<entry [Wed Oct  3 21:36:44 EDT 2007] CORRECT FULLTEXT QUERY FOR swissprotiprscan>



SELECT count(*)
FROM swissprotiprscan
WHERE MATCH(targetid)
AGAINST('G3DSA:1.20');


</entry>



<entry [Sat Sep 15 22:06:00 EDT 2007] DELETE ENTRIES OLDER THAN 10 DAYS>



DELETE FROM comments WHERE date < DATE_SUB(NOW(), INTERVAL 10 DAY);


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Wed Jun 20 20:19:21 EDT 2007
SUBSTRING FUNCTION

select collectionid, hitevalueexp, hitevaluedec, SUBSTRING(targetannotation, 1, 100) from collectionsequencesannotation limit 50;


	+--------------+--------------+--------------+------------------------------------------------------------------------------------------------------+
	| collectionid | hitevalueexp | hitevaluedec | SUBSTRING(targetannotation, 1, 100)                                                                  |
	+--------------+--------------+--------------+------------------------------------------------------------------------------------------------------+
	|            1 |          -63 |         1.11 | hyaluronan-binding protein [Rattus norvegicus]                                                       |
	|            2 |          -23 |         2.30 | Complement factor H-related protein 1 precursor (FHR-1) (H factor-like protein 1) (H-factor-like 1)  |
	|            3 |          -19 |         2.88 | Proactivator polypeptide precursor [Contains: Saposin A (Protein A); Saposin B (Sphingolipid activat |
	|            4 |           -9 |         7.44 | suppressor of G2 allele of SKP1 [Homo sapiens]                                                       |
	|            5 |          -32 |         1.11 | Proteasome subunit beta type 7 precursor (EC 3.4.25.1) (Proteasome subunit Z) (Macropain chain Z) (M |


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Tue Jun 19 15:06:49 EDT 2007
ERROR 1016: Can't open file: 'collectionblast.MYI'. (errno: 145)

AFTER FAILED LOAD funnybase10 BLAST AGAINST refseq-mouse DUE TO DUPLICATE LINES IN .TSV FILE:

Current database: funnybase10

Didn't find any fields in table 'collectionblast'
ERROR 1016: Can't open file: 'collectionblast.MYI'. (errno: 145)

SOLUTION:

repair table collectionblast;

( OR, ON THE COMMAND LINE: myisamchk -r collectionblast || myisamchk -r funnybase10.collectionblast )

+-----------------------------+--------+----------+----------+
| Table                       | Op     | Msg_type | Msg_text |
+-----------------------------+--------+----------+----------+
| funnybase10.collectionblast | repair | status   | OK       |
+-----------------------------+--------+----------+----------+
1 row in set (4 min 59.09 sec)

select targetsource , count(*) from collectionblast group by targetsource ;
+--------------+----------+
| targetsource | count(*) |
+--------------+----------+
| refseq-dog   |  2263289 |
| refseq-human |  1694892 |
| refseq-mouse |   439072 |
| refseq-rat   |  1152199 |
| swissprot    |  2039546 |
+--------------+----------+


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Mon Jun 18 02:40:13 EDT 2007
TABLE IS FULL

...
Doing target database: refseq-rat
TSV file: /common/pipeline/funnybase12/blast/funnybase12-refseq-rat.blast.tsv
Deleting from collectionblast WHERE targetsource='refseq-rat'...done.
DBD::mysql::db do failed: The table 'collectionblast' is full at /Users/young/FUNNYBASE/lib/Database.pm line 590.
Query failed: The table 'collectionblast' is full (1114)
Loading 'refseq-rat' hits data into table 'collectionblast'...DID NOT LOAD!
done.
...



show table status from funnybase12 like 'collectionblast'\G
*************************** 1. row ***************************
           Name: collectionblast
           Type: MyISAM
     Row_format: Dynamic
           Rows: 7564201
 Avg_row_length: 567
    Data_length: 4294966856
Max_data_length: 4294967295
   Index_length: 128234496
      Data_free: 0
 Auto_increment: NULL
    Create_time: 2007-06-15 00:00:05
    Update_time: 2007-06-15 23:55:22
     Check_time: NULL
 Create_options: 
        Comment: 
1 row in set (0.00 sec)


DO ALTER TABLE AND SET MAX_ROWS TO 2 BILLION:


ALTER TABLE collectionblast  MAX_ROWS = 2000000000 AVG_ROW_LENGTH = 600;
Query OK, 7564201 rows affected (7 min 28.48 sec)
Records: 7564201  Duplicates: 0  Warnings: 0



FULLTEXT ERROR 1191: Can't find FULLTEXT index matching the column list
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

THIS GIVES ERROR 1191: Can't find FULLTEXT index matching the column list:

	SELECT collectionid, collectionaccession, targetannotation,
	MATCH(collectionid, collectionaccession, targetannotation)
	AGAINST ('$all_words') AS relevance
	FROM collectionsequencesannotation
	$where MATCH(targetannotation, targetsource, targetname, targetid)
	AGAINST ('$all_words')
	GROUP BY collectionid};
	print "$query\n";

BUT CHANGE THE FIRST MATCH() TO THE FULL FULLTEXT COLUMNS AND IT WORKED OKAY:

SELECT collectionid, collectionaccession, targetannotation,
MATCH(targetannotation, targetsource, targetid, targetname)
AGAINST ('Troponin I, slow skeletal') AS relevance
FROM collectionsequencesannotation
WHERE  MATCH(targetannotation, targetsource, targetid, targetname)
AGAINST ('Troponin I, slow skeletal');


mysql> show create table collectionsequencesannotation;

...
  FULLTEXT KEY `collectionannotation` (`targetannotation`,`targetsource`,`targetid`),
  FULLTEXT KEY `targetannotation` (`targetannotation`,`targetsource`,`targetid`,`targetname`)
) TYPE=MyISAM |
+-------------------------------+--------------------------------------------------------------



TEST FULLTEXT RETURN OF RELEVANCE
+++++++++++++++++++++++++++++++++

create table fulltext1 ( copy text );

INSERT INTO fulltext1 VALUES
('It appears good from here'), 
('The here and the past'), 
('Why are we hear'), 
('An all-out alert'), 
('All you need is love'), 
('A good alert');
	
select * from fulltext1;
+-------------------------------+
| copy                          |
+-------------------------------+
| a good alert                  |
| it all appears good from here |
| an all-out alert              |
| It appears good from here     |
| The here and the past         |
| Why are we hear               |
| An all-out alert              |
| All you need is love          |
| A good alert                  |
+-------------------------------+

ALTER TABLE fulltext1 ADD FULLTEXT copy (copy);

SELECT copy,MATCH(copy) AGAINST('good,alert') AS relevance 
FROM fulltext1 WHERE MATCH(copy) AGAINST('good,alert');
+---------------------------+------------------+
| copy                      | relevance        |
+---------------------------+------------------+
| A good alert              |  1.3551265001297 |
| An all-out alert          | 0.68526661396027 |
| It appears good from here | 0.67756325006485 |
+---------------------------+------------------+




CREATE NEW USERS ON ALL NODES
+++++++++++++++++++++++++++++

START MYSQL ON ALL NODES:

sudo dsh -a mysqld_safe &


CREATE USERS:

sudo dsh -a mysqladmin -u root password <password>

E.G.:

sudo dsh -a mysqladmin -u root password <password>
sudo dsh -a mysqladmin -u young password <password>



SPEED UP MYSQL DUMP WITH --opt ARGUMENT 
+++++++++++++++++++++++++++++++++++++++

mysqldump -u young -popen4stuart --opt --where="targetsource='karenia3_p95_o100'" karenia3_p90_o100 collectionblast > /common/pipeline/karenia3_p90_o100/collection/karenia3_p90_o100.collectionblast.dump

WITHOUT '--opt' :   RUN TIME: 00:02:31

WITH '--opt'    :   RUN TIME: 00:01:38


MYSQL DUMP WITH 'WHERE' CONDITION
+++++++++++++++++++++++++++++++++

FROM arraycompareengine.pl

#### 1. CREATE MYSQL .dump FILES FOR THE MYSQL TABLES:
####	- collectionblast TABLE HITS AGAINST TARGET DATABASE
my $dump_command = qq{mysqldump -u $user -p$password --where="targetsource='$target'" $database collectionblast > $collection_directory/$database.collectionblast.dump}; 
print "$dump_command\n";
`$dump_command`;

mysqldump -u young -popen4stuart --where="targetsource='karenia3_p95_o100'" karenia3_p90_o100 collectionblast > /common/pipeline/karenia3_p90_o100/collection/karenia3_p90_o100.collectionblast.dump

WITHOUT 'WHERE  :   RUN TIME: 00:03:57

WITH 'WHERE'    :   RUN TIME: 00:02:31

DUMP FILE:
>>>
-- MySQL dump 9.11
--
-- Host: localhost    Database: karenia3_p90_o100
-- ------------------------------------------------------
-- Server version       4.0.20-standard

--
-- Table structure for table `collectionblast`
--

CREATE TABLE collectionblast (
  collectionid int(8) NOT NULL default '0',
  collectionaccession int(2) NOT NULL default '
...<<<
  


LEFT JOIN TO GET WHAT'S NOT IN ANOTHER TABLE
++++++++++++++++++++++++++++++++++++++++++++

LEFT JOIN WORKS BUT SUB-SELECT DOES NOT:

# MySQL 4 will do this with a sub-select such as:

# SELECT whatever FROM table1 WHERE auctionid NOT IN (SELECT auctionID
# FROM table2);

SELECT collectionid
FROM collectionsequences
WHERE collectionid NOT IN 
(
	SELECT collectionid
	FROM collectionsequencesannotation
)

DOESN'T WORK!!

# Or you can do it with a LEFT JOIN (should work in MySQL 3):
#
# SELECT table1.whatever FROM table1 LEFT JOIN table2 ON
# table1.auctionid = table2.auctionid WHERE table2.auctionid IS NULL

SELECT collectionsequences.collectionid FROM collectionsequences
LEFT JOIN collectionsequencesannotation
ON
collectionsequences.collectionid=collectionsequencesannotation.collectionid
WHERE collectionsequencesannotation.collectionid IS NULL

OKAY!!


INSTALL MYSQL ON ALL NODES
++++++++++++++++++++++++++

FOR ALL NODES (node002,node004,node005,...,node016) INDIVIDUALLY, DO:
nodeXXX
<password>
sudo scp -r local@129.171.101.102:~/mysql /private/var/mysql
<node password>
<gems password>


USE dsh TO DO PERMISSIONS AND START MYSQL:

sudo dsh -a chown -R mysql:wheel /private/var/mysql
sudo dsh -a mysqld_safe &



DONE!

mysqld is missing
+-+-+-+-+-+-+-+-+

node001:/usr/share/mysql/mysql-test vanwye$ sudo ./mysql-test-run 
Password:
Installing Test Databases
Removing Stale Files
Installing Master Databases
mysqld is missing - looked in ../bin and in ../libexec
Error:  Could not install master test DBs
node001:/usr/share/mysql/mysql-test vanwye$ ls
README          client-cert.pem include         lib             r               server-key.pem  t
cacert.pem      client-key.pem  install_test_db mysql-test-run  server-cert.pem std_data        var
node001:/usr/share/mysql/mysql-test vanwye$ ls var
log run tmp

node001:/usr/share/mysql/mysql-test vanwye$ locate mysqld
/Applications/Server/MySQL Manager.app/Contents/Resources/mysqld_manager_options
/Applications/Server/MySQL Manager.app/Contents/Resources/mysqld_manager_options.8
/usr/bin/mysqldump
/usr/bin/mysqldumpslow
/usr/bin/mysqld_manager_options
/usr/bin/mysqld_multi
/usr/bin/mysqld_safe
/usr/include/mysql/mysqld_error.h
/usr/libexec/mysqld
/usr/share/man/man1/mysqld.1
/usr/share/man/man1/mysqldump.1
/usr/share/man/man1/mysqldumpslow.1
/usr/share/man/man1/mysqld_multi.1
/usr/share/man/man1/mysqld_safe.1
/usr/share/man/man8/mysqld_manager_options.8
/usr/share/mysql/mysql-test/r/mysqldump.result
/usr/share/mysql/mysql-test/t/mysqldump.test
/usr/share/zsh/4.2.3/functions/_mysqldiff

node001:/usr/share/mysql/mysql-test vanwye$ cd ..

node001:/usr/share/mysql vanwye$ ls
MySQL-shared-compat.spec       japanese-sjis                  ndb-config-2-node.ini
charsets                       korean                         norwegian
czech                          mi_test_all                    norwegian-ny
danish                         mi_test_all.res                polish
dutch                          my-huge.cnf                    portuguese
english                        my-innodb-heavy-4G.cnf         romanian
estonian                       my-large.cnf                   russian
fill_help_tables.sql           my-medium.cnf                  serbian
french                         my-small.cnf                   slovak
german                         mysql-4.1.13a.spec             spanish
greek                          mysql-log-rotate               swedish
hungarian                      mysql-test                     ukrainian
italian                        mysql.server
japanese                       mysql_fix_privilege_tables.sql


gems AND node001 SEEM TO HAVE IDENTICAL INSTALLATIONS OF mysql EXCEPT FOR THE MISSING 'var'
DIRECTORY IN mysql-test:


node001:/usr/share/mysql vanwye$ ll
total 680
drwxr-xr-x   42 root  wheel      1K Dec 29 06:51 .
drwxr-xr-x   57 root  wheel      1K Oct 24  2005 ..
-rw-r--r--    1 root  wheel      2K Apr 24  2006 MySQL-shared-compat.spec
drwxr-xr-x   28 root  wheel    952B Dec 29 06:51 charsets
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 czech
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 danish
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 dutch
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 english
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 estonian
-rw-r--r--    1 root  wheel    207K Apr 24  2006 fill_help_tables.sql
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 french
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 german
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 greek
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 hungarian
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 italian
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 japanese
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 japanese-sjis
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 korean
-rw-r--r--    1 root  wheel      4K Aug 22  2005 mi_test_all
-rw-r--r--    1 root  wheel      1K Aug 22  2005 mi_test_all.res
-rw-r--r--    1 root  wheel      4K Apr 24  2006 my-huge.cnf
-rw-r--r--    1 root  wheel     20K Aug 22  2005 my-innodb-heavy-4G.cnf
-rw-r--r--    1 root  wheel      4K Apr 24  2006 my-large.cnf
-rw-r--r--    1 root  wheel      4K Aug 22  2005 my-medium.cnf
-rw-r--r--    1 root  wheel      2K Aug 22  2005 my-small.cnf
-rw-r--r--    1 root  wheel     30K Apr 24  2006 mysql-4.1.13a.spec
-rw-r--r--    1 root  wheel    781B Aug 22  2005 mysql-log-rotate
drwxr-xr-x   16 root  wheel    544B Mar 13 13:42 mysql-test
-rwxr-xr-x    1 root  wheel      6K Apr 24  2006 mysql.server
-rw-r--r--    1 root  wheel     15K Apr 24  2006 mysql_fix_privilege_tables.sql
-rw-r--r--    1 root  wheel    589B Aug 22  2005 ndb-config-2-node.ini
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 norwegian
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 norwegian-ny
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 polish
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 portuguese
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 romanian
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 russian
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 serbian
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 slovak
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 spanish
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 swedish
drwxr-xr-x    4 root  wheel    136B Dec 29 06:51 ukrainian
node001:/usr/share/mysql vanwye$ cd mysql-test/
node001:/usr/share/mysql/mysql-test vanwye$ ls
README          client-cert.pem include         lib             r               server-key.pem  t
cacert.pem      client-key.pem  install_test_db mysql-test-run  server-cert.pem std_data        var
node001:/usr/share/mysql/mysql-test vanwye$ 


total 680
drwxr-xr-x   42 root  wheel      1K Jul 25  2006 .
drwxr-xr-x   57 root  wheel      1K Jul 21  2006 ..
-rw-r--r--    1 root  wheel      2K Apr 24  2006 MySQL-shared-compat.spec
drwxr-xr-x   28 root  wheel    952B Jul 25  2006 charsets
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 czech
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 danish
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 dutch
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 english
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 estonian
-rw-r--r--    1 root  wheel    207K Apr 24  2006 fill_help_tables.sql
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 french
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 german
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 greek
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 hungarian
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 italian
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 japanese
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 japanese-sjis
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 korean
-rw-r--r--    1 root  wheel      4K Aug 22  2005 mi_test_all
-rw-r--r--    1 root  wheel      1K Aug 22  2005 mi_test_all.res
-rw-r--r--    1 root  wheel      4K Apr 24  2006 my-huge.cnf
-rw-r--r--    1 root  wheel     20K Aug 22  2005 my-innodb-heavy-4G.cnf
-rw-r--r--    1 root  wheel      4K Apr 24  2006 my-large.cnf
-rw-r--r--    1 root  wheel      4K Aug 22  2005 my-medium.cnf
-rw-r--r--    1 root  wheel      2K Aug 22  2005 my-small.cnf
-rw-r--r--    1 root  wheel     30K Apr 24  2006 mysql-4.1.13a.spec
-rw-r--r--    1 root  wheel    781B Aug 22  2005 mysql-log-rotate
drwxr-xr-x   15 root  wheel    510B Jul 25  2006 mysql-test
-rwxr-xr-x    1 root  wheel      6K Apr 24  2006 mysql.server
-rw-r--r--    1 root  wheel     15K Apr 24  2006 mysql_fix_privilege_tables.sql
-rw-r--r--    1 root  wheel    589B Aug 22  2005 ndb-config-2-node.ini
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 norwegian
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 norwegian-ny
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 polish
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 portuguese
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 romanian
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 russian
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 serbian
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 slovak
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 spanish
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 swedish
drwxr-xr-x    4 root  wheel    136B Jul 25  2006 ukrainian
gems:/usr/share/mysql local$ cd mysql-test/
gems:/usr/share/mysql/mysql-test local$ ls
README          client-cert.pem include         lib             r               server-key.pem  t
cacert.pem      client-key.pem  install_test_db mysql-test-run  server-cert.pem std_data
gems:/usr/share/mysql/mysql-test local$ 


THERE WAS A mysql DAEMON RUNNING...
node001:/private/var vanwye$ ps aux | grep mysql
root     16763   0.0  0.0    27452    440  p0- S     5Feb07   0:00.01 sudo mysqld_safe
vanwye   12217   0.0  0.0    18048    224  p0  U+    2:00PM   0:00.00 grep mysql

SO I KILLED IT AND RESTARTED, BUT IT THEN STOPPED:

node001:/private/var vanwye$ sudo kill -9 16763
node001:/private/var vanwye$ ps aux | grep mysql
vanwye   12220   0.0  0.0    18048    288  p0  R+    2:00PM   0:00.00 grep mysql
node001:/private/var vanwye$ sudo mysqld_safe &
[1] 12223
node001:/private/var vanwye$ Starting mysqld daemon with databases from /var/mysql
STOPPING server from pid file /var/mysql/node001.cluster.private.pid
070313 14:01:03  mysqld ended

THERE WERE NEW FILES CREATED IN /var/mysql, WHICH WAS EMPTY BEFORE:

node001:/private/var vanwye$ cd /var/mysql/
node001:/var/mysql vanwye$ ls
ib_logfile0                 ibdata1                     node001-bin.000002          node001.cluster.private.err
ib_logfile1                 node001-bin.000001          node001-bin.index
node001:/var/mysql vanwye$ ll
total 40992
drwxr-xr-x    9 mysql  wheel      306B Mar 13 14:01 .
drwxr-xr-x   34 root   wheel        1K Mar 13 09:22 ..
-rw-rw----    1 mysql  wheel        5M Mar 13 14:01 ib_logfile0
-rw-rw----    1 mysql  wheel        5M Mar 13 14:01 ib_logfile1
-rw-rw----    1 mysql  wheel       10M Mar 13 14:01 ibdata1
-rw-rw----    1 mysql  wheel       79B Mar 13 14:00 node001-bin.000001
-rw-rw----    1 mysql  wheel       79B Mar 13 14:01 node001-bin.000002
-rw-rw----    1 mysql  wheel       42B Mar 13 14:01 node001-bin.index
-rw-rw----    1 mysql  wheel        2K Mar 13 14:01 node001.cluster.private.err

AND WITHIN THE node001.cluster.private.err FILE WAS THIS MESSSAGE:

070313 14:01:03 [ERROR] Fatal error: Can't open privilege tables: Table 'mysql.host' doesn't exist
070313 14:01:03  mysqld ended


SO TRANSFERRED THE /private/var/mysql/mysql DIRECTORY FROM gems TO node001 AND CHANGED PERMISSIONS:

node001:/private/var/mysql vanwye$ sudo chown -R mysql:wheel mysql

AND RESTARTED MYSQL:

node001:/private/var/mysql vanwye$ sudo mysqld_safe &
[4] 12615
node001:/private/var/mysql vanwye$ Starting mysqld daemon with databases from /var/mysql

OKAY!!



INITIAL CONFIGURATION
+++++++++++++++++++++

/usr/local/mysql/bin/mysqladmin -u root -p password new_password
< empty_password>

/usr/local/mysql/bin/mysqladmin -u root -h localhost -p password new_password
< new_password>

/usr/local/mysql/bin/mysqladmin version



MYSQL ON EXECUTION NODES
++++++++++++++++++++++++
mysql -V
>>>mysql  Ver 14.7 Distrib 4.1.13a, for apple-darwin8.0 (powerpc) using  EditLine wrapper<<<

sudo mysqladmin ping
>>>mysqladmin: connect to server at 'localhost' failed
error: 'Can't connect to local MySQL server through socket '/var/mysql/mysql.sock' (2)'
Check that mysqld is running and that the socket: '/var/mysql/mysql.sock' exists!<<<


myEST DATABASE USER PRIVILEGES
++++++++++++++++++++++++++++++

NB: USER MUST HAVE create AND drop PRIVILEGES ON *.*
E.G.: GRANT CREATE ON *.* TO young@localhost;			# NB: ...@localhost!!!
E.G.: GRANT DROP ON *.* TO young@localhost;			# NB: ...@localhost!!!
E.G.: REVOKE DROP ON *.* FROM young@localhost;		# NB: ...@localhost!!!


TRIM \n AND \s AT START AND END OF ENTRY
++++++++++++++++++++++++++++++++++++++++

create table test1 ( string varchar(255));
insert into test1 (string) values ('GTCGACGAATTCACGCAGGTTCCACAGGAGAACGACCGTTCACAGATATTATAACCAGTG
TACGCTATTGGATCATTCATAGTGTGACCATTCCATCACTTTTCGTCTCAGGTTTTTTAT
TTGTATTAACCGGTTTAGCTTACGACGCATTTGGAACCCCTCGACCTTCTGAATATTACA
CCGAAAAGCGTAATGCTGCACCAAGATTAACTGAGCGTTATGGTGCAAAAGCGGAGTTAA
CAGCCATCGCGGCGGGTATGCAAGAAGACTAAATGAAATCCCATGGGCATGCGTCGACGA

');

select * from test1;

UPDATE test1 SET string = TRIM('\n' FROM string);

select * from test1;

TRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr FROM] str)

Returns the string str with all remstr prefixes or suffixes removed. If none of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is assumed. remstr is optional and, if not specified, spaces are removed.

mysql> SELECT TRIM('  bar   ');
        -> 'bar'
mysql> SELECT TRIM(LEADING 'x' FROM 'xxxbarxxx');
        -> 'barxxx'
mysql> SELECT TRIM(BOTH 'x' FROM 'xxxbarxxx');
        -> 'bar'
mysql> SELECT TRIM(TRAILING 'xyz' FROM 'barxxyz');
        -> 'barx'


UPDATE yourTable SET yourString = TRIM('\n' FROM yourString);
UPDATE nested_category SET temp = TRIM(both ' ' FROM temp);
UPDATE nested_category SET temp = TRIM(both '\r\n' FROM temp);

UPDATE nested_category SET temp = TRIM(trailing ' ' FROM temp);
UPDATE nested_category SET temp = TRIM(trailing '\r\n' FROM temp);

UPDATE nested_category SET temp = TRIM(trailing ' ' FROM temp); 


REMOVE WHITESPACE
+++++++++++++++++

UPDATE test1 SET string = SELECT string);


ON DUPLICATE KEY UPDATE
+++++++++++++++++++++++

Cool INSERT ON DUPLICATE KEY UPDATE feature in MySQL 4.1.

E.G.:

INSERT INTO tableName VALUES (2,1,4,'dpinto') ON DUPLICATE KEY UPDATE posts=posts+4;
    
INSERT INTO funnybasesequencesdiv
(
    funnybaseid,
    funnybaseaccession,
    funnybaseversion,
    sequencediv
)
VALUES
(
    '2',
    '1',
    '0.01',
    'Some sequence div'
)
ON DUPLICATE KEY UPDATE sequencediv = 'Some sequence div';



WHAT VERSION OF MYSQL
+++++++++++++++++++++

mysql -V
mysql  Ver 12.22 Distrib 4.0.20, for apple-darwin7.3.0 (powerpc)


MYSQL DATA TYPE SIZES
+++++++++++++++++++++

BINARY	The BINARY type is similar to the CHAR type, but stores binary byte strings rather than non-binary character strings. This type was added in MySQL 4.1.2.  
BLOB	A BLOB column with a maximum length of 65,535 (2^16 &#8722; 1) bytes. 
BOOLEAN	These are synonyms for TINYINT(1). The BOOLEAN synonym was added in MySQL 4.1.0. A value of zero is considered false. Non-zero values are considered true. In the future, full boolean type handling will be introduced in accordance with standard SQL.  
CHAR	A fixed-length string that is always right-padded with spaces to the specified length when stored. ... 
DOUBLE	A normal-size (double-precision) floating-point number. Allowable values are -1.7976931348623157E+3... 
ENUM	An enumeration. A string object that can have only one value, chosen from the list of values 'value... 
LONGBLOB	A BLOB column with a maximum length of 4,294,967,295 or 4GB (2^32 &#8722; 1) bytes. Up to MySQL 3.23... 
LONGTEXT	A TEXT column with a maximum length of 4,294,967,295 or 4GB (2^32 &#8722; 1) characters. Up to MySQ... 
MEDIUMTEXT	A TEXT column with a maximum length of 16,777,215 (2^24 &#8722; 1) characters. 
SET	A set. A string object that can have zero or more values, each of which must be chosen from the list of values 'value1', 'value2', ... A SET column can have a maximum of 64 members. SET values are represented internally as integers. 
TEXT	A TEXT column with a maximum length of 65,535 (2^16 &#8722; 1) characters. 
TINYBLOB	A BLOB column with a maximum length of 255 (2^8 &#8722; 1) bytes. 
TINYTEXT	A TEXT column with a maximum length of 255 (2^8 &#8722; 1) characters. 
VARBINARY	The VARBINARY type is similar to the VARCHAR type, but stores binary byte strings rather than non-binary character strings. This type was added in MySQL 4.1.2.  
VARCHAR	A variable-length string. M represents the maximum column length. The range of M is 1 to 255 before... 


LOCATION OF my.cnf
++++++++++++++++++
 On Unix, MySQL programs read startup options from the following files:

Filename 	          Purpose
/etc/my.cnf 	    Global options
$MYSQL_HOME/my.cnf 	Server-specific options
defaults-extra-file The file specified with --defaults-extra-file=path, if any
~/.my.cnf 	        User-specific options

MYSQL_HOME is an environment variable containing the path to the directory in which the server-specific my.cnf file resides. (This was DATADIR prior to MySQL version 5.0.3.)

If MYSQL_HOME is not set and you start the server using the mysqld_safe program, mysqld_safe attempts to set MYSQL_HOME as follows:
    - Let BASEDIR and DATADIR represent the pathnames of the MySQL base directory and data directory, respectively.
    - If there is a my.cnf file in DATADIR but not in BASEDIR, mysqld_safe sets MYSQL_HOME to DATADIR.

Otherwise, if MYSQL_HOME is not set and there is no my.cnf file in DATADIR, mysqld_safe sets MYSQL_HOME to BASEDIR.

In MySQL 5.0, use of DATADIR as the location for my.cnf is deprecated. BASEDIR is a better location.

Typically, DATADIR is /usr/local/mysql/data for a binary installation or /usr/local/var for a source installation. Note that this is the data directory location that was specified at configuration time, not the one specified with the --datadir option when mysqld starts. Use of --datadir at runtime has no effect on where the server looks for option files, because it looks for them before processing any options.

MySQL looks for option files in the order just described and reads any that exist. If an option file that you want to use does not exist, create it with a plain text editor.

If multiple instances of a given option are found, the last instance takes precedence. There is one exception: For mysqld, the first instance of the --user option is used as a security precaution, to prevent a user specified in an option file from being overridden on the command line.

Note: On Unix platforms, MySQL ignores configuration files that are world-writable. This is intentional, and acts as a security measure. 



MYSQL RESERVED WORDS
++++++++++++++++++++
ADD 	ALL 	ALTER
ANALYZE 	AND 	AS
ASC 	ASENSITIVE 	BEFORE
BETWEEN 	BIGINT 	BINARY
BLOB 	BOTH 	BY
CALL 	CASCADE 	CASE
CHANGE 	CHAR 	CHARACTER
CHECK 	COLLATE 	COLUMN
CONDITION 	CONNECTION 	CONSTRAINT
CONTINUE 	CONVERT 	CREATE
CROSS 	CURRENT_DATE 	CURRENT_TIME
CURRENT_TIMESTAMP 	CURRENT_USER 	CURSOR
DATABASE 	DATABASES 	DAY_HOUR
DAY_MICROSECOND 	DAY_MINUTE 	DAY_SECOND
DEC 	DECIMAL 	DECLARE
DEFAULT 	DELAYED 	DELETE
DESC 	DESCRIBE 	DETERMINISTIC
DISTINCT 	DISTINCTROW 	DIV
DOUBLE 	DROP 	DUAL
EACH 	ELSE 	ELSEIF
ENCLOSED 	ESCAPED 	EXISTS
EXIT 	EXPLAIN 	FALSE
FETCH 	FLOAT 	FLOAT4
FLOAT8 	FOR 	FORCE
FOREIGN 	FROM 	FULLTEXT
GRANT 	GROUP 	HAVING
HIGH_PRIORITY 	HOUR_MICROSECOND 	HOUR_MINUTE
HOUR_SECOND 	IF 	IGNORE
IN 	INDEX 	INFILE
INNER 	INOUT 	INSENSITIVE
INSERT 	INT 	INT1
INT2 	INT3 	INT4
INT8 	INTEGER 	INTERVAL
INTO 	IS 	ITERATE
JOIN 	KEY 	KEYS
KILL 	LEADING 	LEAVE
LEFT 	LIKE 	LIMIT
LINES 	LOAD 	LOCALTIME
LOCALTIMESTAMP 	LOCK 	LONG
LONGBLOB 	LONGTEXT 	LOOP
LOW_PRIORITY 	MATCH 	MEDIUMBLOB
MEDIUMINT 	MEDIUMTEXT 	MIDDLEINT
MINUTE_MICROSECOND 	MINUTE_SECOND 	MOD
MODIFIES 	NATURAL 	NOT
NO_WRITE_TO_BINLOG 	NULL 	NUMERIC
ON 	OPTIMIZE 	OPTION
OPTIONALLY 	OR 	ORDER
OUT 	OUTER 	OUTFILE
PRECISION 	PRIMARY 	PROCEDURE
PURGE 	RAID0 	READ
READS 	REAL 	REFERENCES
REGEXP 	RELEASE 	RENAME
REPEAT 	REPLACE 	REQUIRE
RESTRICT 	RETURN 	REVOKE
RIGHT 	RLIKE 	SCHEMA
SCHEMAS 	SECOND_MICROSECOND 	SELECT
SENSITIVE 	SEPARATOR 	SET
SHOW 	SMALLINT 	SONAME
SPATIAL 	SPECIFIC 	SQL
SQLEXCEPTION 	SQLSTATE 	SQLWARNING
SQL_BIG_RESULT 	SQL_CALC_FOUND_ROWS 	SQL_SMALL_RESULT
SSL 	STARTING 	STRAIGHT_JOIN
TABLE 	TERMINATED 	THEN
TINYBLOB 	TINYINT 	TINYTEXT
TO 	TRAILING 	TRIGGER
TRUE 	UNDO 	UNION
UNIQUE 	UNLOCK 	UNSIGNED
UPDATE 	USAGE 	USE
USING 	UTC_DATE 	UTC_TIME
UTC_TIMESTAMP 	VALUES 	VARBINARY
VARCHAR 	VARCHARACTER 	VARYING
WHEN 	WHERE 	WHILE
WITH 	WRITE 	X509
XOR 	YEAR_MONTH 	ZEROFILL

The following are new reserved words in MySQL 5.0: ASENSITIVE, CALL, CONDITION, CONNECTION, CONTINUE, CURSOR, DECLARE, DETERMINISTIC, EACH, ELSEIF, EXIT, FETCH, GOTO, INOUT, INSENSITIVE, ITERATE, LABEL, LEAVE, LOOP, MODIFIES, OUT, READS, RELEASE, REPEAT, RETURN, SCHEMA, SCHEMAS, SENSITIVE, SPECIFIC, SQL, SQLEXCEPTION, SQLSTATE, SQLWARNING, TRIGGER, UNDO, UPGRADE, WHILE. 


EXECUTE COMMANDS FROM A FILE
++++++++++++++++++++++++++++

shell> mysql database < text_file

E.G.:

mq karenia0 < create_funnybaseblast.sql 

You can also start your text file with a USE db_name statement. In this case, it is unnecessary to specify the database name on the command line:

shell> mysql < text_file

If you are already running mysql, you can execute an SQL script file using the source command:

mysql> source filename;


REPAIR TABLE
++++++++++++

ERROR 1034: Incorrect key file for table: 'funnybaseblast'. Try to repair it

IN MYSQL:

REPAIR TABLE funnybaseblast;

OR, ON THE COMMAND LINE:

*** THIS DELETED ALL BUT 3 ROWS... ***
myisamchk -r /path/to/the/table


Slow Query Log
++++++++++++++

The slow query log consists of all SQL statements that took more than long_query_time seconds to execute. The time to acquire the initial table locks is not counted as execution time. The minimum and default values of long_query_time are 1 and 10, respectively.

mysqld writes a statement to the slow query log after it has been executed and after all locks have been released. Log order may be different from execution order.

To enable the slow query log, start mysqld with the --log-slow-queries[=file_name] option.

If no file_name value is given, the default is the name of the host machine with a suffix of -slow.log. If a filename is given, but not as an absolute pathname, the server writes the file in the data directory.

The slow query log can be used to find queries that take a long time to execute and are therefore candidates for optimization. However, examining a long slow query log can become a difficult task. To make this easier, you can process the slow query log using the mysqldumpslow command to summarize the queries that appear in the log. Use mysqldumpslow --help to see the options that this command supports.

In MySQL 5.0, queries that do not use indexes are logged in the slow query log if the --log-queries-not-using-indexes option is specified. See Section 5.2.2, ÒCommand OptionsÓ.

In MySQL 5.0, the --log-slow-admin-statements server option enables you to request logging of slow administrative statements such as OPTIMIZE TABLE, ANALYZE TABLE, and ALTER TABLE to the slow query log.

Queries handled by the query cache are not added to the slow query log, nor are queries that would not benefit from the presence of an index because the table has zero rows or one row. 

If you see many trivial queries being logged here, you may have log-long-format enabled.
This logs all queries not using indexes in the slow query logs, which includes queries so trivial that using the index would be slower.


Please note that the mysql slow query log will not show the SQL of your slow queries if your application uses prepared statement.
You may want to turn on General Query Log instead.

NB: ALSO HAVE TO SET THE long_query_time. IN THE /etc/my.cnf FILE ADD (SET TO 5 SECONDS):

set-variable = long_query_time = 5


DELETE NULL FIELDS
++++++++++++++++++
delete from readsblast where blastapp is NULL;


SHOW WARNINGS - DOESN'T WORK (IN THIS VERSION?)
+++++++++++++

SHOW WARNINGS Syntax

SHOW WARNINGS [LIMIT [offset,] row_count]
SHOW COUNT(*) WARNINGS

SHOW WARNINGS shows the error, warning, and note messages that resulted from the last statement that generated messages, or nothing if the last statement that used a table generated no messages. A related statement, SHOW ERRORS, shows only the errors. See Section 13.5.4.11, ÒSHOW ERRORS SyntaxÓ.

The list of messages is reset for each new statement that uses a table.

The SHOW COUNT(*) WARNINGS statement displays the total number of errors, warnings, and notes. You can also retrieve this number from the warning_count variable:

SHOW COUNT(*) WARNINGS;
SELECT @@warning_count;

The value of warning_count might be greater than the number of messages displayed by SHOW WARNINGS if the max_error_count system variable is set so low that not all messages are stored. An example shown later in this section demonstrates how this can happen.

The LIMIT clause has the same syntax as for the SELECT statement. See Section 13.2.7, ÒSELECT SyntaxÓ.

The MySQL server sends back the total number of errors, warnings, and notes resulting from the last statement. If you are using the C API, this value can be obtained by calling mysql_warning_count(). See Section 22.2.3.71, Òmysql_warning_count()Ó.

Warnings are generated for statements such as LOAD DATA INFILE and DML statements such as INSERT, UPDATE, CREATE TABLE, and ALTER TABLE.
    
The following DROP TABLE statement results in a note:

mysql> DROP TABLE IF EXISTS no_such_table;
mysql> SHOW WARNINGS;
+-------+------+-------------------------------+
| Level | Code | Message                       |
+-------+------+-------------------------------+
| Note  | 1051 | Unknown table 'no_such_table' |
+-------+------+-------------------------------+

Here is a simple example that shows a syntax warning for CREATE TABLE and conversion warnings for INSERT:

mysql> CREATE TABLE t1 (a TINYINT NOT NULL, b CHAR(4)) TYPE=MyISAM;
Query OK, 0 rows affected, 1 warning (0.00 sec)
mysql> SHOW WARNINGS\G
*************************** 1. row ***************************
  Level: Warning
   Code: 1287
Message: 'TYPE=storage_engine' is deprecated, use
         'ENGINE=storage_engine' instead
1 row in set (0.00 sec)




LOAD DATA INFILE
++++++++++++++++
LOAD DATA INFILE. This is usually 20 times faster than using INSERT statements.
INSERT is still much slower for loading data than LOAD DATA INFILE, even when using the strategies below.

ALTER TABLE funnybaseblast DISABLE KEYS;
load data infile '/private/tmp/dummy' into table readsblast;
SHOW WARNINGS LIMIT 10;
ALTER TABLE funnybaseblast ENABLE KEYS;

Syntax:

LOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE 'file_name'
    [REPLACE | IGNORE]
    INTO TABLE tbl_name
    [FIELDS
        [TERMINATED BY 'string']
        [[OPTIONALLY] ENCLOSED BY 'char']
        [ESCAPED BY 'char']
    ]
    [LINES
        [STARTING BY 'string']
        [TERMINATED BY 'string']
    ]
    [IGNORE number LINES]
    [(col_name_or_user_var,...)]
    [SET col_name = expr,...)]


Speed of INSERT Statements
++++++++++++++++++++++++++

The time required for inserting a row is determined by the following factors, where the numbers indicate approximate proportions:

    *      Connecting: (3)
    *      Sending query to server: (2)
    *      Parsing query: (2)
    *      Inserting row: (1 ? size of row)
    *      Inserting indexes: (1 ? number of indexes)
    *      Closing: (1)

This does not take into consideration the initial overhead to open tables, which is done once for each concurrently running query.
The size of the table slows down the insertion of indexes by log N, assuming B-tree indexes.
You can use the following methods to speed up inserts:

    *      If you are inserting many rows from the same client at the same time, use INSERT statements with multiple VALUES lists to insert several rows at a time. This is considerably faster (many times faster in some cases) than using separate single-row INSERT statements. If you are adding data to a non-empty table, you can tune the bulk_insert_buffer_size variable to make data insertion even faster. See Section 5.2.3, ÒSystem VariablesÓ.
    *      If you are inserting a lot of rows from different clients, you can get higher speed by using the INSERT DELAYED statement. See Section 13.2.4.2, ÒINSERT DELAYED SyntaxÓ.
    *      For a MyISAM table, you can use concurrent inserts to add rows at the same time that SELECT statements are running if there are no deleted rows in middle of the table. See Section 7.3.3, ÒConcurrent InsertsÓ.
    *      When loading a table from a text file, use LOAD DATA INFILE. This is usually 20 times faster than using INSERT statements. See Section 13.2.5, ÒLOAD DATA INFILE SyntaxÓ.
    *      With some extra work, it is possible to make LOAD DATA INFILE run even faster for a MyISAM table when the table has many indexes. Use the following procedure:
         1.            Optionally create the table with CREATE TABLE.
         2.            Execute a FLUSH TABLES statement or a mysqladmin flush-tables command.
         3.            Use myisamchk --keys-used=0 -rq /path/to/db/tbl_name. This removes all use of indexes for the table.
         4.            Insert data into the table with LOAD DATA INFILE. This does not update any indexes and therefore is very fast.
         5.            If you intend only to read from the table in the future, use myisampack to compress it. See Section 14.1.3.3, ÒCompressed Table CharacteristicsÓ.
         6.            Re-create the indexes with myisamchk -rq /path/to/db/tbl_name. This creates the index tree in memory before writing it to disk, which is much faster that updating the index during LOAD DATA INFILE because it avoids lots of disk seeks. The resulting index tree is also perfectly balanced.
         7.            Execute a FLUSH TABLES statement or a mysqladmin flush-tables command.

      Note that LOAD DATA INFILE performs the preceding optimization automatically if the MyISAM table into which you insert data is empty. The main difference is that you can let myisamchk allocate much more temporary memory for the index creation than you might want the server to allocate for index re-creation when it executes the LOAD DATA INFILE statement.

      You can also disable or enable the indexes for a MyISAM table by using the following statements rather than myisamchk. If you use these statements, you can skip the FLUSH TABLE operations:

      ALTER TABLE tbl_name DISABLE KEYS;
      ALTER TABLE tbl_name ENABLE KEYS;

    *      To speed up INSERT operations that are performed with multiple statements for non-transactional tables, lock your tables:

      LOCK TABLES a WRITE;
      INSERT INTO a VALUES (1,23),(2,34),(4,33);
      INSERT INTO a VALUES (8,26),(6,29);
      ...
      UNLOCK TABLES;

      This benefits performance because the index buffer is flushed to disk only once, after all INSERT statements have completed. Normally, there would be as many index buffer flushes as there are INSERT statements. Explicit locking statements are not needed if you can insert all rows with a single INSERT.

      To obtain faster insertions, for transactional tables, you should use START TRANSACTION and COMMIT instead of LOCK TABLES.

      Locking also lowers the total time for multiple-connection tests, although the maximum wait time for individual connections might go up because they wait for locks. For example:
         1.            Connection 1 does 1000 inserts
         2.            Connections 2, 3, and 4 do 1 insert
         3.            Connection 5 does 1000 inserts

      If you do not use locking, connections 2, 3, and 4 finish before 1 and 5. If you use locking, connections 2, 3, and 4 probably do not finish before 1 or 5, but the total time should be about 40% faster.

      INSERT, UPDATE, and DELETE operations are very fast in MySQL, but you can obtain better overall performance by adding locks around everything that does more than about five inserts or updates in a row. If you do very many inserts in a row, you could do a LOCK TABLES followed by an UNLOCK TABLES once in a while (each 1,000 rows or so) to allow other threads access to the table. This would still result in a nice performance gain.

      To increase performance for MyISAM tables, for both LOAD DATA INFILE and INSERT, enlarge the key cache by increasing the key_buffer_size system variable. See Section 7.5.2, ÒTuning Server ParametersÓ.


TROUBLESHOOTING
+++++++++++++++
VIEW ERROR LOG:

YOU CAN SPECIFY WHERE MYSQLD STORES THE ERROR LOG (FROM VERSION MySQL 4.0.10)

--log-error[=filename]

IF YOU DON'T USE THIS OPTION, MYSQLD WILL USE mysql-data-dir/'hostname'.err, I.E.:

sudo emacs /private/var/mysql/gems.rsmas.miami.edu.err

 

TRANSFER DATABASES
++++++++++++++++++

MOVE funnybase3 DIRECTORY INTO THE data DIRECTORY THEN DO THE FOLLOWING:

sudo chown -R mysql:wheel funnybase7
sudo chmod -R 660 funnybase7/
sudo chmod 700 funnybase7/

OR

sudo chown -R mysql:wheel funnybase3
sudo chmod -R 660 funnybase3/
sudo chmod 700 funnybase3/

NB: THE PERMISSIONS SHOULD LOOK LIKE:

drwxr-xr-x   19 mysql  wheel      646B Jul 25 12:54 .
drwxr-xr-x   35 root   wheel        1K Jul 25 12:55 ..
drwx------   12 mysql  wheel      408B Jul 25 07:31 bipod
drwx------    6 mysql  wheel      204B Jul 21 18:09 controlpanel
drwx------   18 mysql  wheel      612B Jul 25 09:50 dbnet
drwx------   32 mysql  wheel      1088 Jul 28 11:32 funnybase3
-rw-rw----    1 mysql  wheel       79B Jul 25 10:25 gems-bin.000001
-rw-rw----    1 mysql  wheel        3K Jul 25 12:10 gems-bin.000002
-rw-rw----    1 mysql  wheel       79B Jul 25 12:54 gems-bin.000003
-rw-rw----    1 mysql  wheel       54B Jul 25 12:54 gems-bin.index
-rw-rw----    1 mysql  wheel        7K Jul 25 15:09 gems.rsmas.miami.edu.err
-rw-rw----    1 mysql  wheel        4B Jul 25 12:54 gems.rsmas.miami.edu.pid
-rw-rw----    1 mysql  wheel        5M Jul 25 12:54 ib_logfile0
-rw-rw----    1 mysql  wheel        5M Jul 21 18:09 ib_logfile1
-rw-rw----    1 mysql  wheel       10M Jul 25 12:54 ibdata1
drwx------   12 mysql  wheel      408B Jul 21 18:09 itest
drwx------   47 mysql  wheel        1K Jul 21 18:08 mysql
srwxrwxrwx    1 mysql  wheel        0B Jul 25 12:54 mysql.sock
drwx------    2 mysql  wheel       68B Jul 21 18:08 test

AND INSIDE THE DIRECTORIES THE PERMISSIONS SHOULD LOOK LIKE THIS:

ls -al
total 246728
drwx------   23 mysql  wheel       782 Jul 28 13:49 .
drwxr-xr-x   24 mysql  wheel       816 Jul 28 13:49 ..
-rw-rw----    1 mysql  wheel  64038052 Jul 28 13:48 assemblyblast.MYD
-rw-rw----    1 mysql  wheel    534528 Jul 28 13:48 assemblyblast.MYI
-rw-rw----    1 mysql  wheel      9688 Jul 28 13:48 assemblyblast.frm
-rw-rw----    1 mysql  wheel    155448 Jul 28 13:48 assemblyreads.MYD
-rw-rw----    1 mysql  wheel     62464 Jul 28 13:48 assemblyreads.MYI
-rw-rw----    1 mysql  wheel      8856 Jul 28 13:48 assemblyreads.frm
-rw-rw----    1 mysql  wheel  41227944 Jul 28 13:49 assemblysequences.MYD
-rw-rw----    1 mysql  wheel     14336 Jul 28 13:49 assemblysequences.MYI
-rw-rw----    1 mysql  wheel      9120 Jul 28 13:48 assemblysequences.frm
-rw-rw----    1 mysql  wheel  20054508 Jul 28 13:49 reads.MYD
-rw-rw----    1 mysql  wheel     78848 Jul 28 13:49 reads.MYI
-rw-rw----    1 mysql  wheel      8900 Jul 28 13:49 reads.frm
-rw-rw----    1 mysql  wheel     25168 Jul 28 13:49 readsinfo.MYD
-rw-rw----    1 mysql  wheel     10240 Jul 28 13:49 readsinfo.MYI
-rw-rw----    1 mysql  wheel      8724 Jul 28 13:49 readsinfo.frm
-rw-rw----    1 mysql  wheel         0 Jul 28 13:49 sequences.MYD
-rw-rw----    1 mysql  wheel      1024 Jul 28 13:49 sequences.MYI
-rw-rw----    1 mysql  wheel      9060 Jul 28 13:49 sequences.frm
-rw-rw----    1 mysql  wheel        45 Jul 28 13:49 testmedian.MYD
-rw-rw----    1 mysql  wheel      1024 Jul 28 13:49 testmedian.MYI
-rw-rw----    1 mysql  wheel      8558 Jul 28 13:49 testmedian.frm
gems:/var/mysql/384library2 root# exit


THEN RESTART MYSQL:

sudo mysqladmin -u root -p shutdown

THEN

sudo mysqld_safe &


LOCATION OF DATABASES
+++++++++++++++++++++

GENOMICS
/usr/local/mysql/data
GEMS
/private/var/mysql


INITIAL CONFIGURATION
+++++++++++++++++++++

/usr/local/mysql/bin/mysqladmin -u root -p password new_password
< empty_password>

/usr/local/mysql/bin/mysqladmin -u root -h localhost -p password new_password
< new_password>

/usr/local/mysql/bin/mysqladmin version


ADD USER
++++++++

GRANT ALL PRIVILEGES ON *.* TO 'young'@'localhost'
IDENTIFIED BY 'open4stuart' WITH GRANT OPTION;

FLUSH PRIVILEGES;



*** OPTIONAL TESTS ***


There is a script in mysql-test called mysql-test-run that will run extensive tests. Modify the path in the script to include /usr/local/mysql/bin, and run:

[mysql-test]# ./mysql-test-run
Installing Test Databases
Removing Stale Files
Installing Master Databases
010801  0:41:57  ../sql/mysqld: Shutdown Complete

Installing Slave Databases
010801  0:41:58  ../sql/mysqld: Shutdown Complete

Starting MySQL daemon
Loading Standard Test Databases
Starting Tests

TEST                         USER   SYSTEM  ELAPSED        RESULT
------------------------------------------------------------------------
alias                         0.49     0.24     1.30       [ pass ]
alter_table                   0.10     0.13     0.39       [ pass ]
.
.
.
variables                     0.10     0.12     0.23       [ pass ]
warnings                      0.15     0.07     0.25       [ pass ]
------------------------------------------------------------------------
 
Ending Tests
Shutting-down MySQL daemon
  
Master shutdown finished
Slave shutdown finished
All 125 tests were successful.
   
[mysql-test]#

Add the following to /etc/rc.local to start MySQL automatically:

/usr/local/mysql/share/mysql/mysql.server start

You could use many methods for this, but rc.local is more generic.
We also need to add these lines to /etc/my.cnf:

[mysql.server]
basedir=/usr/local/mysql

And under the [mysqld] section in /etc/my.cnf:

datadir         = /usr/local/mysql/var
user            = mysql

Here is how we tweaked the module config on webmin to manage our MySQL server.
Check out our BIND Automation page for more info on webmin.
Here is what the webmin MySQL manager screen looks like.
We have a database server. Rejoice!



RESTART MYSQL NICELY
++++++++++++++++++++

sudo mysqladmin -u root -p shutdown

sudo safe_mysqld &

RENAME A DATABASE
+++++++++++++++++

1. RENAME THE DIRECTORY IN WHICH THE DATA IS STORED AND RESTART MYSQL.

TO FIND THE DIRECTORY:

mysqladmin variables | grep datadir

2. CHECK THE GRANTS - THEY MIGHT STILL REFER TO THE OLD DATABASE NAME.

use mysql
select * from db


UPDATE FULLTEXT KEY
+++++++++++++++++++
# REMOVE OLD KEY:
DROP INDEX targetannotation ON funnybaseblast;

# ADD NEW KEY:
ALTER TABLE funnybaseblast ADD FULLTEXT targetannotation (targetannotation, targetsource, targetname, targetid);

# ALSO WORKS:
ALTER TABLE assemblyblast ADD FULLTEXT KEY(target_annotation, target_source, target_name, target_id);


COPY A DATABASE
+++++++++++++++

Use mysqldump to dump the existing database:

mysqldump -h host -u root -ppassword olddbname > dumpfile.sql

E.G.:

mysqldump -u root -p 384blast > 384blast.sqldump


Then use the mysql command-line utility to import the dumpfile:

mysql -h host -u root -p

Enter password: ********
mysql> create database newdbname;
mysql> use newdbname;
mysql> source dumpfile.sql; 


E.G.:

mysql -u young -p
********
# mysql>

create database 384blast2;
use 384blast2;
source /Users/young/FUNNYBASE/NOTES/mysql/384/384blast.sqldump; 




RENAME TABLE
++++++++++++

RENAME TABLE 384sequences TO assemblysequences;

RENAME TABLE 384blast TO assemblyblast;


ADD COLUMN AND POPULATE IT
++++++++++++++++++++++++++

ALTER TABLE 384blast ADD sequence_type VARCHAR(20) NOT NULL;
UPDATE 384blast SET sequence_type='contig';


ALTER COLUMN NAMES
++++++++++++++++++

ALTER TABLE 384blast CHANGE 384_id  gene_number int(8);
ALTER TABLE 384blast CHANGE 384_subcontig  sequence_number int(8);



ORDER BY EXPONENTIAL NUMBERS
++++++++++++++++++++++++++++

option 1 (right):

REBUILD THE TABLE, SPLITTING hit_evalue INTO hit_evalue_decimal AND hit_evalue_exp:

SIMILARLY, SPLIT hsp_evalue INTO hit_evalue_decimal AND hit_evalue_exp:


option 2 (wrong):

'NUMERIC' AND 'DECIMAL' FIELD TYPES RECOGNISE EXPONENTIAL NUMBERS

ALTER TABLE funnybaseblast CHANGE hit_evalue hit_evalue DECIMAL(M,D)

# the maximum M is 65, not 254


SELECT ... INTO OUTFILE
=======================

select funnybaseblast.div from funnybaseblast where div !='' limit 1 into outfile '/tmp/mysql.out1';

NB:
- TARGET FILE MUST NOT EXIST
- MUST HAVE WRITE PERMISSION TO DIRECTORY
- MYSQL USER MUST HAVE 'FILE' PERMISSION


INCREASE MAX_ALLOWED_PACKET SIZE
++++++++++++++++++++++++++++++++

GOT 'MAX_ALLOWED_PACKET SIZE EXCEEDED' ERROR WHEN DOING funnybasesequencesdiv.pl

POSSIBILITY 1: (NOT CORRECT)
==============
mysqladmin -u root -p variables

SAW THAT 'max_allowed_packet' WAS SET TO 1048576 (I.E., ROUGHLY 1 MB)
SO RESET TO 4,000,000

mysqladmin -u root -p --max_allowed_packet=4000000

BUT STILL GOT THE ERROR.


POSSIBILITY 2: (CORRECT)
==============
select max(length(div)) from funnybasesequences;
+------------------+
| max(length(div)) |
+------------------+
|            65535 |
+------------------+

SO USED 'ALTER' TO CHANGE THE COLUMN FROM 'TEXT' TO 'MEDIUMTEXT':

alter table funnybasesequences change div div mediumtext;
desc funnybasesequences;

THEN REDID funnybasesequencesdiv.pl AND GOT:

select max(length(div)) from funnybasesequences;
+------------------+
| max(length(div)) |
+------------------+
|          3206168 |
+------------------+

SO FIXED THE ERROR IN funnybasesequencesdiv.pl THAT WAS ACCUMULATING THE div TEXT
AND CHANGED div BACK TO 'TEXT' FIELD.


Text Fields
+++++++++++

Field	Min. Length	Max. Length	Remarks
CHAR(M) 	1 	255 	Faster than VARCHAR. MySQL changes CHAR to VARCHAR when used in the same table with TINYTEXT, TEXT, MEDIUMTEXT, or LONGTEXT.
VARCHAR(M) 	1 	255 	 
TINYTEXT 	1 	255 	 
TEXT 	1 	65535 	 
MEDIUMTEXT 	1 	16,777,215 	 
LONGTEXT 	1 	4,294,967,295 	 





ISNULL
++++++

SELECT * FROM table_name WHERE NOT ISNULL([columnname]);


ADD FULLTEXT KEY
++++++++++++++++

(REM: CAN ONLY USE TEXT, CHAR OR VARCHAR FIELDS!!!)

ALTER TABLE funnybaseblast ADD FULLTEXT (target_annotation, target_source, target_name, target_id, query_sequence, target_sequence);




********** FROM MYSQL COOKBOOK ******************

4.12. Using FULLTEXT Searches
4.12.1. Problem

You want to search through a lot of text.
4.12.2. Solution

Use a FULLTEXT index.
4.12.3. Discussion

You can use pattern matches to look through any number of rows, but as the amount of text goes up, the match operation can become quite slow. It's also common to look for the same text in several string columns, which with pattern matching tends to result in unwieldy queries:

SELECT * from tbl_name
WHERE col1 LIKE 'pat' OR col2 LIKE 'pat' OR col3 LIKE 'pat' ...


A useful alternative (available as of MySQL 3.23.23) is to use FULLTEXT searching, which is designed for looking through large amounts of text, and can search multiple columns simultaneously. To use this capability, add a FULLTEXT index to your table, then use the MATCH operator to look for strings in the indexed column or columns. FULLTEXT indexing can be used with MyISAM tables, for columns of type CHAR, VARCHAR, or TEXT.

FULLTEXT searching is best illustrated with a reasonably good-sized body of text. If you don't have a sample dataset, several repositories of freely available electronic text are available on the Internet. For the examples here, the one I've chosen is the complete text of the King James Version of the Bible (KJV), which is relatively large and has the advantage of being nicely structured by book, chapter, and verse. Because of its size, this dataset is not included with the recipes distribution, but is available separately as the mcb-kjv distribution at the MySQL Cookbook web site.[3] (See Appendix A.) The distribution includes a file kjv.txt that contains the verse records. Some sample records look like this:

    [3] The mcb-kjv distribution is derived from the KJV text available at the Unbound Bible site at Biola University (http://unbound.biola.edu), but has been modified somewhat to make it easier to use for the recipes in this book. The mcb-kjv distribution includes notes that describe how it differs from the Biola distribution.

O   Genesis 1   1   1   In the beginning God created the heaven and the earth.
O   Exodus  2   20  13  Thou shalt not kill.
N   Luke    42  17  32  Remember Lot's wife.


Each record contains the following fields:

    *

      Book section. This is either O or N, signifying the Old or New Testament.
    *

      Book name and corresponding book number, from 1 to 66.
    *

      Chapter and verse numbers.
    *

      Text of the verse.

To import the records into MySQL, create a table named kjv that looks like this:

CREATE TABLE kjv
(
    bsect   ENUM('O','N') NOT NULL,         # book section (testament)
    bname   VARCHAR(20) NOT NULL,           # book name
    bnum    TINYINT UNSIGNED NOT NULL,      # book number
    cnum    TINYINT UNSIGNED NOT NULL,      # chapter number
    vnum    TINYINT UNSIGNED NOT NULL,      # verse number
    vtext   TEXT NOT NULL                   # text of verse
) TYPE = MyISAM;


Then load the kjv.txt file into the table using this statement:

mysql> LOAD DATA LOCAL INFILE 'kjv.txt' INTO TABLE kjv;


You'll notice that the kjv table contains columns for both book names (Genesis, Exodus, ...) and book numbers (1, 2, ...). The names and numbers have a fixed correspondence, and one can be derived from the otherÑa redundancy that means the table is not in normal form. It's possible to eliminate the redundancy by storing just the book numbers (which take less space than the names), and then producing the names when necessary in query results by joining the numbers to a small mapping table that associates each book number with the corresponding name. But I want to avoid using joins at this point. Thus, the table includes book names so that search results can be interpreted more easily, and numbers so that the results can be sorted easily into book order.

After populating the table, prepare it for use in FULLTEXT searching by adding a FULLTEXT index. This can be done using an ALTER TABLE statement:[4]

    [4] It's possible to include the index definition in the initial CREATE TABLE statement, but it's generally faster to create a non-indexed table and then add the index with ALTER TABLE after populating the table than to load a large dataset into an indexed table.

mysql> ALTER TABLE kjv ADD FULLTEXT (vtext);


To perform a search using the index, use MATCH( ) to name the indexed column and AGAINST( ) to specify what text to look for. For example, to answer the question "How often does the name Mizraim occur?" (you've often wondered about that, right?), search the vtext column using this query:

mysql> SELECT COUNT(*) from kjv WHERE MATCH(vtext) AGAINST('Mizraim');
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+


To find out what those verses are, select the columns you want to see (the example here uses \G so that the results better fit the page):

mysql> SELECT bname, cnum, vnum, vtext
    -> FROM kjv WHERE MATCH(vtext) AGAINST('Mizraim')\G
*************************** 1. row ***************************
bname: Genesis
 cnum: 10
 vnum: 6
vtext: And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.
*************************** 2. row ***************************
bname: Genesis
 cnum: 10
 vnum: 13
vtext: And Mizraim begat Ludim, and Anamim, and Lehabim, and Naphtuhim,
*************************** 3. row ***************************
bname: 1 Chronicles
 cnum: 1
 vnum: 8
vtext: The sons of Ham; Cush, and Mizraim, Put, and Canaan.
*************************** 4. row ***************************
bname: 1 Chronicles
 cnum: 1
 vnum: 11
vtext: And Mizraim begat Ludim, and Anamim, and Lehabim, and Naphtuhim,


The results come out in book, chapter, and verse number order in this particular instance, but that's actually just coincidence. By default, FULLTEXT searches compute a relevance ranking and use it for sorting. To make sure a search result is sorted the way you want, add an explicit ORDER BY clause:

SELECT bname, cnum, vnum, vtext
FROM kjv WHERE MATCH(vtext) AGAINST('search string')
ORDER BY bnum, cnum, vnum;


You can include additional criteria to narrow the search further. The following queries perform progressively more specific searches to find out how often the name Abraham occurs in the entire KJV, the New Testament, the book of Hebrews, and Chapter 11 of Hebrews:

mysql> SELECT COUNT(*) from kjv WHERE MATCH(vtext) AGAINST('Abraham');
+----------+
| COUNT(*) |
+----------+
|      216 |
+----------+
mysql> SELECT COUNT(*) from kjv
    -> WHERE MATCH(vtext) AGAINST('Abraham')
    -> AND bsect = 'N';
+----------+
| COUNT(*) |
+----------+
|       66 |
+----------+
mysql> SELECT COUNT(*) from kjv
    -> WHERE MATCH(vtext) AGAINST('Abraham')
    -> AND bname = 'Hebrews';
+----------+
| COUNT(*) |
+----------+
|       10 |
+----------+
mysql> SELECT COUNT(*) from kjv
    -> WHERE MATCH(vtext) AGAINST('Abraham')
    -> AND bname = 'Hebrews' AND cnum = 11;
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+


If you expect to use search criteria that include other non-FULLTEXT columns frequently, you can increase the performance of such queries by adding regular indexes to those columns. For example, to index the book, chapter, and verse number columns, do this:

mysql> ALTER TABLE kjv ADD INDEX (bnum), ADD INDEX (cnum), ADD INDEX (vnum);


Search strings in FULLTEXT queries can include more than just a single word, and you might suppose that adding additional words would make a search more specific. But in fact that widens it, because a FULLTEXT search returns records that contain any of the words. In effect, the query performs an OR search for any of the words. This is illustrated by the following queries, which identify successively larger numbers of verses as additional search words are added:

mysql> SELECT COUNT(*) from kjv
    -> WHERE MATCH(vtext) AGAINST('Abraham');
+----------+
| COUNT(*) |
+----------+
|      216 |
+----------+
mysql> SELECT COUNT(*) from kjv
    -> WHERE MATCH(vtext) AGAINST('Abraham Sarah');
+----------+
| COUNT(*) |
+----------+
|      230 |
+----------+
mysql> SELECT COUNT(*) from kjv
    -> WHERE MATCH(vtext) AGAINST('Abraham Sarah Ishmael Isaac');
+----------+
| COUNT(*) |
+----------+
|      317 |
+----------+


To perform a search where each word in the search string must be present, see Recipe 4.14.

If you want to use a FULLTEXT search that looks though multiple columns simultaneously, name them all when you construct the index:

ALTER TABLE tbl_name ADD FULLTEXT (col1, col2, col3);


To issue a search query that uses this index, name those same columns in the MATCH( ) list:

SELECT ... FROM tbl_name
WHERE MATCH(col1, col2, col3) AGAINST('search string');


4.12.4. See Also

FULLTEXT indexes provide a quick-and-easy way to set up a simple search engine. One way to use this capability is to provide a web-based interface to the indexed text. The MySQL Cookbook site includes a basic web-based KJV search page that demonstrates this.


4.13. Using a FULLTEXT Search with Short Words
4.13.1. Problem

FULLTEXT searches for short words return no records.
4.13.2. Solution

Change the indexing engine's minimum word length parameter.
4.13.3. Discussion

In a text like the KJV, certain words have special significance, such as "God" and "sin." However, if you perform FULLTEXT searches on the kjv table for those words using a MySQL 3.23 server, you'll observe a curious phenomenonÑboth words appear to be missing from the text entirely:

mysql> SELECT COUNT(*) FROM kjv WHERE MATCH(vtext) AGAINST('God');
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
mysql> SELECT COUNT(*) FROM kjv WHERE MATCH(vtext) AGAINST('sin');
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+


One property of the indexing engine is that it ignores words that are "too common" (that is, words that occur in more than half the records). This eliminates words such as "the" or "and" from the index, but that's not what is going on here. You can verify that by counting the total number of records, and by using SQL pattern matches to count the number of records containing each word:[5]

    [5] The use of COUNT( ) to produce multiple counts from the same set of values is described in Recipe 7.2.

mysql> SELECT COUNT(*) AS 'total verses',
    -> COUNT(IF(vtext LIKE '%God%',1,NULL)) AS 'verses containing "God"',
    -> COUNT(IF(vtext LIKE '%sin%',1,NULL)) AS 'verses containing "sin"'
    -> FROM kjv;
+--------------+-------------------------+-------------------------+
| total verses | verses containing "God" | verses containing "sin" |
+--------------+-------------------------+-------------------------+
|        31102 |                    4118 |                    1292 |
+--------------+-------------------------+-------------------------+


Neither word is present in more than half the verses, so sheer frequency of occurrence doesn't account for the failure of a FULLTEXT search to find them. What's really happening is that by default, the indexing engine doesn't include words less than four characters long. On a MySQL 3.23 server, there's nothing you can do about that (at least, nothing short of messing around with the MySQL source code and recompiling). As of MySQL 4.0, the minimum word length is a configurable parameter, which you can change by setting the ft_min_word_len server variable. For example, to tell the indexing engine to include words containing three or more characters, add a set-variable line to the [mysqld] group of the /etc/my.cnf file (or whatever option file you put server settings in):

[mysqld]
set-variable = ft_min_word_len=3


After making this change and restarting the server, rebuild the FULLTEXT index to take advantage of the new setting:

mysql> ALTER TABLE kjv DROP INDEX vtext;
mysql> ALTER TABLE kjv ADD FULLTEXT (vtext);


Then try out the new index to verify that it includes shorter words:

mysql> SELECT COUNT(*) FROM kjv WHERE MATCH(vtext) AGAINST('God');
+----------+
| COUNT(*) |
+----------+
|     3878 |
+----------+
mysql> SELECT COUNT(*) FROM kjv WHERE MATCH(vtext) AGAINST('sin');
+----------+
| COUNT(*) |
+----------+
|      389 |
+----------+


That's better!

But why do the MATCH( ) queries find 3878 and 389 records, whereas the earlier LIKE queries find 4118 and 1292 records? That's because the LIKE patterns match substrings and the FULLTEXT search performed by MATCH( ) matches whole words.

4.14. Requiring or Excluding FULLTEXT Search Words
4.14.1. Problem

You want to specifically require or disallow words in a FULLTEXT search.
4.14.2. Solution

Use a Boolean mode search.
4.14.3. Discussion

Normally, FULLTEXT searches return records that contain any of the words in the search string, even if some of them are missing. For example, the following query finds records that contain either of the names David or Goliath:

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext) AGAINST('David Goliath');
+----------+
| COUNT(*) |
+----------+
|      934 |
+----------+


This behavior is undesirable if you want only records that contain both words. One way to do this is to rewrite the query to look for each word separately and join the conditions with AND:

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext) AGAINST('David')
    -> AND MATCH(vtext) AGAINST('Goliath');
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+


As of MySQL 4.0.1, another way to require multiple words is with a Boolean mode search. To do this, precede each word in the search string with a + character and add IN BOOLEAN MODE after the string:

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext) AGAINST('+David +Goliath' IN BOOLEAN MODE)
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+


Boolean mode searches also allow you to exclude words. Just precede any disallowed word with a - character. The following queries select kjv records containing the name David but not Goliath, or vice versa:

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext) AGAINST('+David -Goliath' IN BOOLEAN MODE)
+----------+
| COUNT(*) |
+----------+
|      928 |
+----------+
mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext) AGAINST('-David +Goliath' IN BOOLEAN MODE)
+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+


Another useful special character in Boolean searches is *; when appended to a search word, it acts as a wildcard operator. The following query finds records containing not only whirl, but also words such as whirls, whirleth, and whirlwind:

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext) AGAINST('whirl*' IN BOOLEAN MODE);
+----------+
| COUNT(*) |
+----------+
|       28 |
+----------+


4.15. Performing Phrase Searches with a FULLTEXT Index
4.15.1. Problem

You want to perform a FULLTEXT search for a phrase, that is, for words that occur adjacent to each other and in a specific order.
4.15.2. Solution

Use the FULLTEXT phrase search capability, or combine a non-phrase FULLTEXT search with regular pattern matching.
4.15.3. Discussion

To find records that contain a particular phrase, you can't use a simple FULLTEXT search:

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext) AGAINST('still small voice');
+----------+
| COUNT(*) |
+----------+
|      548 |
+----------+


The query returns a result, but it's not the result you're looking for. A FULLTEXT search computes a relevance ranking based on the presence of each word individually, no matter where it occurs within the vtext column, and the ranking will be nonzero as long as any of the words are present. Consequently, this kind of query tends to find too many records.

As of MySQL 4.0.2, FULLTEXT searching supports phrase searching in Boolean mode. To use it, just place the phrase within double quotes.

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext) AGAINST('"still small voice"' IN BOOLEAN MODE);
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+


Prior to 4.0.2, a workaround is necessary. You could use an IN BOOLEAN MODE search to require each word to be present, but that doesn't really solve the problem, because the words can still occur in any order:

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext)
    -> AGAINST('+still +small +voice' IN BOOLEAN MODE);
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+


If you use a SQL pattern match instead, it returns the correct result:

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE vtext LIKE '%still small voice%';
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+


However, using a SQL pattern match is likely to be slower than a FULLTEXT search. So it seems you have the unpleasant choice of using a method that is faster but doesn't produce the desired results, or one that works properly but is slower. Fortunately, those aren't your only options. You can combine both methods in the same query:

mysql> SELECT COUNT(*) FROM kjv
    -> WHERE MATCH(vtext) AGAINST('still small voice')
    -> AND vtext LIKE '%still small voice%';
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+


What this gains you is the best of both types of matching:

    *

      Using the MATCH( ) expression, MySQL can perform a FULLTEXT search to produce a set of candidate rows that contain words in the phrase. This narrows the search considerably.
    *

      Using the SQL pattern test, MySQL can search the candidate rows to produce only those records that have all the words arranged in the proper order. 

This technique will fail if all the words are less than the indexing engine's minimum word length or occur in more than half the records. In that case, the FULLTEXT search returns no records at all. You can find the records using a SQL pattern match.


</entry>