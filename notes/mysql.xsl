mysql




<entry [Wed 2015:04:15 09:10:51 EST] HOW TO DOCUMENT A MYSQL TABLE>

https://www.simple-talk.com/sql/database-administration/database-documentation---lands-of-trolls-why-and-how/




http://stackoverflow.com/questions/369266/how-to-document-a-database

In my experience, ER (or UML) diagrams aren't the most useful artifact - with a large number of tables, diagrams (especially reverse engineered ones) are often a big convoluted mess that nobody learns anything from.

For my money, some good human-readable documentation (perhaps supplemented with diagrams of smaller portions of the system) will give you the most mileage. This will include, for each table:

Descriptions of what the table means and how it's functionally used (in the UI, etc.)
Descriptions of what each attribute means, if it isn't obvious
Explanations of the relationships (foreign keys) from this table to others, and vice-versa
Explanations of additional constraints and / or triggers
Additional explanation of major views & procs that touch the table, if they're not well documented already
With all of the above, don't document for the sake of documenting - documentation that restates the obvious just gets in people's way. Instead, focus on the stuff that confused you at first, and spend a few minutes writing really clear, concise explanations. That'll help you think it through, and it'll massively help other developers who run into these tables for the first time.

As others have mentioned, there are a wide variety of tools to help you manage this, like Enterprise Architect, Red Gate SQL Doc, and the built-in tools from various vendors. But while tool support is helpful (and even critical, in bigger databases), doing the hard work of understanding and explaining the conceptual model of the database is the real win. From that perspective, you can even do it in a text file (though doing it in Wiki form would allow several people to collaborate on adding to that documentation incrementally - so, every time someone figures out something, they can add it to the growing body of documentation instantly).

shareimprove this answer
answered Dec 15 '08 at 19:06

Ian Varley
5,86131629
1	 	
I agree with the human-readable docs, assuming there's somebody capable of writing it; my experience has been the required knowledge has left the company, which makes the case for documenation all the more apparent. –  SqlACID Dec 15 '08 at 19:23
add a comment

	
</entry>
<entry [Thu 2015:04:09 05:57:21 EST] GET MORE DEBUG INFO WITH 'SHOW ENGINE INNODB STATUS'>


show warnings;
SHOW ENGINE INNODB STATUS;


------------------------
LATEST FOREIGN KEY ERROR
------------------------
150409  5:55:08 Error in foreign key constraint of table BergDb_v2/Peptides:
     FOREIGN KEY (`Proteins_GeneID`)     REFERENCES `BergDb_v2`.`Proteins` (`GeneID`)     ON DELETE NO ACTION     ON UPDATE NO ACTION):

Cannot find an index in the referenced table where the
referenced columns appear as the first columns, or column types
in the table and the referenced table do not match for constraint.
Note that the internal storage type of ENUM and SET changed in
tables created with >= InnoDB-4.1.12, and such columns in old tables
cannot be referenced by such columns in new tables.
See http://dev.mysql.com/doc/refman/5.5/en/innodb-foreign-key-constraints.html
for correct foreign key definition.



</entry>
<entry [Tue 2014:08:05 15:45:12 EST] FIXED ERROR 'DUPLICATE ENTRY' DUE TO TRUNCATED PRIMARY KEY (64 CHARACTERS)>

PROBLEM

GET DUPLICATE ENTRY




1. EDIT MYSQL CONFIG FILE:

ON UBUNTU:

/etc/mysql/my.cnf


ADD LINES:

[mysqld]

innodb_large_prefix=ON


2. RELOAD TABLE


select * from provenance into outfile '/tmp/provenance.tsv'
drop table provenance
source /agua/bin/sql/provenance.sql
load data local infile '/tmp/provenance.tsv' into table provenance


3. TEST

ON MASTER

cd /agua/bin/daemon
reset; ./master --log 4


ON MASTER OR WORKER:

cd /agua/t/unit/bin/Exchange/inputs

./sendtopic '{"stage":"download","stderr":"Welcome to gtdownload-3.8.5a.Ready to downloadCommunicating with GT Executive ...Downloaded        in 00:00:01.  Overall Rate       /s0.04user 0.00system 0:00.99elapsed 4%CPU (0avgtext+0avgdata 45920maxresident)k144inputs+328outputs (0major+3000minor)pagefaults 0swaps","number":"1","status":"completed","mode":"updateJobStatus","time":"2014-08-05 23:24:48","project":"RunTCGA","sample":"03287bf9-276b-4f2f-903c-40ebd75ba777","stdout":"heregtrepo not defined. Using default: https://cghub.ucsc.edu/cghub/data/analysis/download","completed":"0000-00-00 00:00:00","workflownumber":"1","location":"bin/download.pl","installdir":"/agua/apps/cu/0.0.11","version":"0.0.11","name":"download","stagenumber":"1","samplehash":{"workflownumber":"1","project":"RunTCGA","status":"none","username":"syoung","workflow":"Download","filesize":"2147483647","filename":"C500.TCGA-E7-A7PW-01A-11D-A34U-08.1.bam","sample":"03287bf9-276b-4f2f-903c-40ebd75ba777"},"host":"10.2.24.114","username":"syoung","workflow":"Download","started":"2014-08-05 23:24:42","queued":"2014-08-05 23:24:42"}'



RESPONSE ON MASTER:




</entry>
<entry [Wed 2013:03:20 10:57:49 EST] FIXED DBD::mysql INSTALL ERROR: 'Can't exec "mysql_config"'>

PROBLEM

APT-GET OR MANUAL INSTALL OF DBD::mysql GIVES THIS ERROR:

perl Makefile.PL

    Can't exec "mysql_config": No such file or directory at Makefile.PL line 479.


SOLUTION
    
1. INSTALL MYSQL-DEVEL LIBRARIES

apt-get install libmysql++-dev


2. INSTALL DBD::mysql

MANUALL INSTALL
perl Makefile.PL
make
make install
    OK
    
# ALTERNATELY:
cpanm install DBD::mysql


    
</entry>
<entry [Mon 2013:03:18 23:31:55 EST] CACHE MYSQL QUERIES>

UBUNTU MYSQL CONFIG FILE:

/etc/mysql/my.cnf

ADD:

[mysqld]
query_cache_size = 268435456
query_cache_type=1
query_cache_limit=1048576


NOTES
-----

Howto enable caching in MySQL

You can setup caching as follows:
$ mysql -u root –p

Output:

Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16 to server version: 4.1.15-Debian_1-log
Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
mysql>
Now setup cache size 16Mb:

mysql> SET GLOBAL query_cache_size = 16777216;

    Query OK, 0 rows affected (0.00 sec)

mysql> SHOW VARIABLES LIKE 'query_cache_size'; 
Output:

 +------------------+----------+
| Variable_name    | Value    |
+------------------+----------+
| query_cache_size | 16777216 |
+------------------+----------+


You can setup them in /etc/my.cnf (Red Hat) or /etc/mysql/my.cnf (Debian) file:
# vi /etc/my.cnf

Append config directives as follows:

query_cache_size = 268435456
query_cache_type=1
query_cache_limit=1048576

In above example the maximum size of individual query results that can be cached set to 1048576 using query_cache_limit system variable. Memory size in Kb.

    
</entry>
<entry [Tue 2013:03:12 10:43:33 EST] EXCLUDE COMMON MEMBERS>

THIS WILL RETURN A LINE FROM flowcell_samplesheet IF ANY LINE IN flowcell HAS A DIFFERENT flowcell_id:

SELECT DISTINCT flowcell_samplesheet.*
FROM flowcell, flowcell_samplesheet
WHERE flowcell_samplesheet.flowcell_id != flowcell.flowcell_id

SELECT flowcell_samplesheet.*
FROM flowcell_samplesheet
LEFT OUTER JOIN flowcell ON flowcell_samplesheet.flowcell_id = flowcell.flowcell_id
WHERE flowcell.flowcell_id IS NULL


select t1.*
from Table1 t1
left outer join Table2 t2 on t1.l_id = t2.l_id
    and t2.b_id = @SomeValue
where t2.l_id is null

SELECT DISTINCT flowcell_samplesheet.*
FROM flowcell_samplesheet
INNER JOIN flowcell 
ON flowcell_samplesheet.flowcell_id != flowcell.flowcell_id
ORDER BY flowcell_samplesheet.flowcell_id DESC     

    
</entry>
<entry [Fri 2012:12:07 20:21:09 EST] SOLUTION FOR ERROR 'Solution for DBD::mysql::db do failed'>

PROBLEM

RUNNING executeWorkflow GET THIS ERROR

2012-12-08 01:16:19    [DEBUG]   	Agua::Stage::setStatus	725	status: running
DBD::mysql::db do failed: MySQL server has gone away at /agua/cgi-bin/lib/Agua/DBase/MySQL.pm line 268.


SOLUTION

USE 'mysql_auto_reconnect' IN METHOD DBase::MySql::initialise:


    my $dbh = DBI->connect($dsn, $user, $password, { 'PrintError' => 1, 'RaiseError' => 0, 'mysql_auto_reconnect' => 1 });

    
    
    
    
    
    
**** NB: THIS DID NOT WORK: *****

Modify the system variables:

    interactive_timeout
    wait_timeout


    

1. EDIT /etc/mysql/my.cnf

ADD LINES TO SET MAX WAIT AT ONE HOUR:

emacs -nw /etc/mysql/my.cnf

    [mysqld]
    
    #### AVOID ERROR: MySQL server has gone away
    interactive_timeout=3600
    wait_timeout=3600


2. RESTART MYSQL

/etc/init.d/mysql restart
 
</entry>
<entry [Wed 2012:08:22 12:04:07 EST] FIXED ERROR: Unknown table engine 'InnoDB'>

PROBLEM

insert into sessions values('admin', '9999999999.9999.999', NOW());
    Unknown table engine 'InnoDB'


DIAGNOSIS

/tmp DIRECTORY HAD PERMISSIONS 700


SOLUTION

chmod 777 /tmp


    
</entry>
<entry [Mon 2012:05:07 18:11:26 EST] FIXED load data infile ERROR>

*** NB: INCORPORATED CHANGES INTO Installer.pm ***

*** NNB: HAVE TO USE [mysql] AND NOT [mysqld] ***


GOT THIS ERROR WHEN DOING load data local infile:

ERROR 1148 (42000): The used command is not allowed with this MySQL version


SOLUTION:

1. FOR PERL ACCESS, ADD "mysql_local_infile=1" TO DSN IN Agua::DBase::MySQL

my $dsn = "DBI:mysql:$database;mysql_local_infile=1";


2. FOR MYSQL COMMAND LINE ACCESS, ADD TWO ENTRIES TO /etc/mysql/my.cnf

[mysqld]
local-infile=1

[mysql]
local-infile=1


3. RESTART MYSQL
/etc/init.d/mysql restart


RESTARTED AND TESTED 'LOAD DATA' - OK!!

   
NOTES
=====

THE CONTENTS OF my.cnf:

cat /etc/mysql/my.cnf

    #
    # The MySQL database server configuration file.
    #
    # You can copy this to one of:
    # - "/etc/mysql/my.cnf" to set global options,
    # - "~/.my.cnf" to set user-specific options.
    # 
    # One can use all long options that the program supports.
    # Run program with --help to get a list of available options and with
    # --print-defaults to see which it would actually understand and use.
    #
    # For explanations see
    # http://dev.mysql.com/doc/mysql/en/server-system-variables.html
    
    # This will be passed to all mysql clients
    # It has been reported that passwords should be enclosed with ticks/quotes
    # escpecially if they contain "#" chars...
    # Remember to edit /etc/mysql/debian.cnf when changing the socket location.
    [client]
    port		= 3306
    socket		= /var/run/mysqld/mysqld.sock
    
    # Here is entries for some specific programs
    # The following values assume you have at least 32M ram
    
    # This was formally known as [safe_mysqld]. Both versions are currently parsed.
    [mysqld_safe]
    socket		= /var/run/mysqld/mysqld.sock
    nice		= 0
    
    [mysqld]
    
    #### ENABLE load data infile
    local-infile=1
    
    #
    # * Basic Settings
    #
    user		= mysql
    pid-file	= /var/run/mysqld/mysqld.pid
    socket		= /var/run/mysqld/mysqld.sock
    port		= 3306
    basedir		= /usr
    datadir		= /var/lib/mysql
    tmpdir		= /tmp
    lc-messages-dir	= /usr/share/mysql
    skip-external-locking
    #
    # Instead of skip-networking the default is now to listen only on
    # localhost which is more compatible and is not less secure.
    bind-address		= 127.0.0.1
    #
    # * Fine Tuning
    #
    key_buffer		= 16M
    max_allowed_packet	= 16M
    thread_stack		= 192K
    thread_cache_size       = 8
    # This replaces the startup script and checks MyISAM tables if needed
    # the first time they are touched
    myisam-recover         = BACKUP
    #max_connections        = 100
    #table_cache            = 64
    #thread_concurrency     = 10
    #
    # * Query Cache Configuration
    #
    query_cache_limit	= 1M
    query_cache_size        = 16M
    #
    # * Logging and Replication
    #
    # Both location gets rotated by the cronjob.
    # Be aware that this log type is a performance killer.
    # As of 5.1 you can enable the log at runtime!
    #general_log_file        = /var/log/mysql/mysql.log
    #general_log             = 1
    #
    # Error logging goes to syslog due to /etc/mysql/conf.d/mysqld_safe_syslog.cnf.
    #
    # Here you can see queries with especially long duration
    #log_slow_queries	= /var/log/mysql/mysql-slow.log
    #long_query_time = 2
    #log-queries-not-using-indexes
    #
    # The following can be used as easy to replay backup logs or for replication.
    # note: if you are setting up a replication slave, see README.Debian about
    #       other settings you may need to change.
    #server-id		= 1
    #log_bin			= /var/log/mysql/mysql-bin.log
    expire_logs_days	= 10
    max_binlog_size         = 100M
    #binlog_do_db		= include_database_name
    #binlog_ignore_db	= include_database_name
    #
    # * InnoDB
    #
    # InnoDB is enabled by default with a 10MB datafile in /var/lib/mysql/.
    # Read the manual for more InnoDB related options. There are many!
    #
    # * Security Features
    #
    # Read the manual, too, if you want chroot!
    # chroot = /var/lib/mysql/
    #
    # For generating SSL certificates I recommend the OpenSSL GUI "tinyca".
    #
    # ssl-ca=/etc/mysql/cacert.pem
    # ssl-cert=/etc/mysql/server-cert.pem
    # ssl-key=/etc/mysql/server-key.pem
    
    
    
    [mysqldump]
    quick
    quote-names
    max_allowed_packet	= 16M
    
    [mysql]
    #no-auto-rehash	# faster start of mysql but no tab completition
    
    [isamchk]
    key_buffer		= 16M
    
    #
    # * IMPORTANT: Additional settings that can override those from this file!
    #   The files must end with '.cnf', otherwise they'll be ignored.
    #
    !includedir /etc/mysql/conf.d/




ALTERNATIVE (DIDN'T TRY THIS):

REINSTALL MYSQL AND USE FLAG TO ENABLE local infile BY DEFAULT:


wget http://dev.mysql.com/get/Downloads/MySQL-5.0/mysql-5.0.16.tar.gz/from/http://mysql.localhost.net.ar/
tar xzvf mysql-5.0.16.tar.gz
cd mysql-5.0.16/

FROM SCRATCH:
install packages :
sudo apt-get install build-essential
sudo apt-get install libncurses5 libncurses5-dev
...or you won't be able to compile on a server install

create the user and group:
sudo groupadd mysql
sudo useradd -g mysql mysql

Compilation optimisation
You can speed up Mysql with processor optimisation
If you have a different processor, change the CHOST, CFLAGS, CXXFLAGS.
If you don't know what it is, Take the Generic one!

The configuration for specific processors were not tested. If it compiles you're fine. If it doesn't try the generic one. Use only one of the following three

Athlon-tbird XP (AMD)

export CHOST="i686-pc-linux-gnu"
export CFLAGS="-march=athlon-xp -O3 -pipe -fomit-frame-pointer -msse -mmmx  -mfpmath=sse"
export CXXFLAGS="-march=athlon-xp -O3 -pipe -fomit-frame-pointer -msse -mmmx  -mfpmath=sse -felide-constructors -fno-exceptions -fno-rtti"
export CXX=gcc 
Pentium 4 (Intel)

export CHOST="i686-pc-linux-gnu"
export CFLAGS="-march=pentium4 -mcpu=pentium4 -O3 -pipe -fomit-frame-pointer -msse -mmmx  -mfpmath=sse"
export CXXFLAGS="-march=pentium4 -mcpu=pentium4 -O3 -pipe -fomit-frame-pointer -msse -mmmx  -mfpmath=sse -felide-constructors -fno-exceptions -fno-rtti"
export CXX=gcc 
Generic

export CHOST="i686-pc-linux-gnu"
export CFLAGS="-mcpu=i686 -march=i686 -O3 -pipe -fomit-frame-pointer"
export CXX=gcc 

-fomit-frame-pointer should be omitted if you intend to debug. Otherwise leave it as it make mysql faster. 

Configuration
This is a full configuration.

GO TO UNZIPPED MYSQL FOLDER:

install mysql in /usr/local/mysql and data in /usr/local/mysql/data:

./configure \
--prefix=/usr/local/mysql \
--with-mysqld-user=mysql \
--without-debug \
--with-client-ldflags=-all-static \
--with-mysqld-ldflags=-all-static \
--disable-shared \
--localstatedir=/usr/local/mysql/data \
--with-extra-charsets=none \
--enable-assembler \
--with-unix-socket-path=/tmp/mysql.socket

make
make install



my.cnf
------
Now create the conf based in any of the pre-build confs. For small servers I recommend my-medium.cnf:
sudo cp support-files/my-medium.cnf /etc/my.cnf

Create GRANT tables
-------------------
Create the GRANT tables:

sudo /usr/local/mysql/bin/mysql_install_db --user=mysql

In later versions this script has been moved to:

/usr/local/mysql/scripts

Changing Owners
---------------
sudo chown -R root  /usr/local/mysql
sudo chown -R mysql /usr/local/mysql/var
sudo chgrp -R mysql /usr/local/mysql


Testing

Start the server

/usr/local/mysql/bin/mysqld_safe -user=mysql&
Set a root password for MySQL (does not affect system root's password)

/usr/local/mysql/bin/mysqladmin -u root password new_password
Try to log in!

/usr/local/mysql/bin/mysql
You should add /usr/local/mysql/bin to your path so you can always use mysql, mysqldump, mysqladmin and some others right from the shell.

Starting Mysql at boot time

sudo cp support-files/mysql.server /etc/init.d/mysql
sudo chmod +x /etc/init.d/mysql
sudo update-rc.d mysql defaults
When you restart mysql should be up if everything went ok.


MySql recompile with default UTF8

I ran into the same issue and I think I got it resolved without having to recompile mysql from source.

You just need to add the following 2 lines to your my.cnf option file (usually located under /etc/mysql/my.cnf)

at the end of [client] section, add:

Code:
default-character-set = utf8
at the end of [mysqld] section, add:

Code:
character-set-server = utf8
then restart your mysql server:

Code:
> sudo /etc/init.d/mysql restart
and make sure it says OK with 

Code:
* Starting MySQL database server mysqld
then check if it all works out 

Code:
> mysql -u root -p
mysql> show variables like '%char%';
you should see the following:

Code:
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8                       | 
| character_set_connection | utf8                       | 
| character_set_database   | utf8                       | 
| character_set_filesystem | binary                     | 
| character_set_results    | utf8                       | 
| character_set_server     | utf8                       | 
| character_set_system     | utf8                       | 
| character_sets_dir       | /usr/share/mysql/charsets/ | 
+--------------------------+----------------------------+
8 rows in set (0.00 sec)
then any new database you create should have character set utf8 by default.

    
</entry>
<entry [Sun 2012:05:06 02:02:30 EST] INSTALLED MYSQL WORKBENCH>

MySqlWorkBench
installation on Ubuntu 11.10
Temporary fix until Oracle fix it:

sudo add-apt-repository ppa:olivier-berten/misc
sudo apt-get update
sudo apt-get install mysql-workbench-gpl



DETAILS

sudo add-apt-repository ppa:olivier-berten/misc

    You are about to add the following PPA to your system:
     
     More info: https://launchpad.net/~olivier-berten/+archive/misc
    Press [ENTER] to continue or ctrl-c to cancel adding it
    
    Executing: gpg --ignore-time-conflict --no-options --no-default-keyring --secret-keyring /tmp/tmp.8nUfHQsPPf --trustdb-name /etc/apt/trustdb.gpg --keyring /etc/apt/trusted.gpg --primary-keyring /etc/apt/trusted.gpg --keyserver hkp://keyserver.ubuntu.com:80/ --recv EE20C45AF02F860D9D3B3A7D508AB215B4A9892F
    gpg: requesting key B4A9892F from hkp server keyserver.ubuntu.com
    gpg: key B4A9892F: public key "Launchpad PPA for Olivier Berten" imported
    gpg: Total number processed: 1
    gpg:               imported: 1  (RSA: 1)



sudo apt-get update
    ...
    Hit http://us.archive.ubuntu.com precise-backports/restricted Translation-en Hit http://us.archive.ubuntu.com precise-backports/universe Translation-en   Fetched 19.0 MB in 1min 56s (164 kB/s)                                       Reading package lists... Done

    

sudo apt-get install mysql-workbench-gpl
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    The following extra packages will be installed:
      libctemplate0 libzip2 python-paramiko python-pysqlite2
    Suggested packages:
      python-pysqlite2-doc python-pysqlite2-dbg
    The following NEW packages will be installed:
      libctemplate0 libzip2 mysql-workbench-gpl python-paramiko python-pysqlite2
    0 upgraded, 5 newly installed, 0 to remove and 20 not upgraded.
    Need to get 26.7 MB of archives.
    After this operation, 102 MB of additional disk space will be used.
    Do you want to continue [Y/n]? y
    Get:1 http://us.archive.ubuntu.com/ubuntu/ precise/universe libctemplate0 amd64 1.0-1 [246 kB]
    Get:2 http://ppa.launchpad.net/olivier-berten/misc/ubuntu/ precise/main mysql-workbench-gpl amd64 5.2.39-1ubu1204ppa2 [25.6 MB]
    Get:3 http://us.archive.ubuntu.com/ubuntu/ precise/main libzip2 amd64 0.10-1ubuntu1 [27.9 kB]
    Get:4 http://us.archive.ubuntu.com/ubuntu/ precise/main python-paramiko all 1.7.7.1-2 [796 kB]
    Get:5 http://us.archive.ubuntu.com/ubuntu/ precise/universe python-pysqlite2 amd64 2.6.3-2build1 [36.6 kB] 
    
    
    
</entry>
<entry [Tue 2012:04:24 14:09:09 EST] SPECIFY OPTION FILE LOCATION WITH --defaults-extra-file>


1. WRITE CREATE OPTION FILE

emacs /agua/log/dump/insert.cnf

[client]
user=agua
password=open4agua

[mysqldump]
no-data
ignore-table=agua.diffs
result-file=/tmp/dump/agua.create.dump


3. WRITE INSERT OPTION FILE

emacs /agua/log/dump/insert.cnf
    
    [client]
    user=agua
    password=open4agua
    
    [mysqldump]
    #agua ami cluster clustervars
    no-create-info
    skip-extended-insert
    compact
    skip-quote-names
    where="username = 'admin'"
    result-file=/tmp/dump/agua.insert.dump


4. RUN MYSQL WITH --defaults-extra-file ARGUMENT

mysqldump --defaults-extra-file=/tmp/dump/insert.cnf agua ami cluster clustervars

INSERT INTO ami VALUES ('admin','ami-c6a877af','StarCluster-base','EBS','StarCluster base image','2011-08-28 01:07:45');
INSERT INTO ami VALUES ('admin','ami-ca847aa3','sc-u10.04-hadoop.2','EBS','Ubuntu 10.04 StarCluster exec node image with Hadoop installed','2011-08-27 03:53:20');
INSERT INTO cluster VALUES ('admin','admin-largecluster',7,12,'t1.micro','ami-d1c42db8','us-east-1a','Large','0000-00-00 00:00:00');
INSERT INTO cluster VALUES ('admin','admin-mediumcluster',3,5,'t1.micro','ami-d1c42db8','us-east-1a','Medium','0000-00-00 00:00:00');
INSERT INTO cluster VALUES ('admin','admin-microcluster',1,1,'t1.micro','ami-d1c42db8','us-east-1a','micro cluster for testing','0000-00-00 00:00:00');
INSERT INTO cluster VALUES ('admin','admin-smallcluster',3,5,'t1.micro','ami-d1c42db8','us-east-1a','Small','0000-00-00 00:00:00');
INSERT INTO clustervars VALUES ('admin','admin-largecluster',36291,36292,'/opt/sge6','admin-largecluster');
INSERT INTO clustervars VALUES ('admin','admin-mediumcluster',36301,36302,'/opt/sge6','admin-mediumcluster');
INSERT INTO clustervars VALUES ('admin','admin-microcluster',36281,36282,'/opt/sge6','admin-microcluster');
INSERT INTO clustervars VALUES ('admin','admin-smallcluster',36311,36312,'/opt/sge6','admin-smallcluster');






 

NOTES
=====
 
 --defaults-extra-file=file_name

Read this option file after the global option file but (on Unix) before the user option file. If the file does not exist or is otherwise inaccessible, the program exits with an error. Before MySQL 5.5.8, file_name must be the full path name to the file. As of MySQL 5.5.8, the name is interpreted relative to the current directory if given as a relative path name.


On Unix, Linux and Mac OS X, MySQL programs read startup options from the following files, in the specified order (top items are used first).

File Name	Purpose
/etc/my.cnf	Global options
/etc/mysql/my.cnf	Global options
SYSCONFDIR/my.cnf	Global options
$MYSQL_HOME/my.cnf	Server-specific options
defaults-extra-file	The file specified with --defaults-extra-file=path, if any
~/.my.cnf	User-specific options


~ represents the current user's home directory (the value of $HOME).

SYSCONFDIR represents the directory specified with the SYSCONFDIR option to CMake when MySQL was built. By default, this is the etc directory located under the compiled-in installation directory.

MYSQL_HOME is an environment variable containing the path to the directory in which the server-specific my.cnf file resides. If MYSQL_HOME is not set and you start the server using the mysqld_safe program, mysqld_safe attempts to set MYSQL_HOME as follows:

Let BASEDIR and DATADIR represent the path names of the MySQL base directory and data directory, respectively.

If there is a my.cnf file in DATADIR but not in BASEDIR, mysqld_safe sets MYSQL_HOME to DATADIR.

Otherwise, if MYSQL_HOME is not set and there is no my.cnf file in DATADIR, mysqld_safe sets MYSQL_HOME to BASEDIR.

    
</entry>
<entry [Tue 2012:04:24 10:19:49 EST] COMMAND LINE MYSQL WITH '-BNe' SWITCH>

-B = BATCH MODE
-N = SKIP COLUMN NAMES
-e = EXECUTE COMMAND AND QUIT

GET CONTENTS OF TABLE

time mysql -u root -p -BNe "USE agua; SELECT * FROM ami"

Enter password: 
    admin	ami-ca847aa3	sc-u10.04-hadoop.2	EBS	Ubuntu 10.04 StarCluster exec node image with Hadoop installed	2011-08-27 03:53:20
    admin	ami-c6a877af	StarCluster-base	EBS	StarCluster base image	2011-08-28 01:07:45
    
    real	0m2.371s
    user	0m0.004s
    sys	0m0.000s


GET LIST OF TABLES

mysql -u root -p -BNe "show databases; use agua; show tables"
Enter password: 
information_schema
agua
aguatest
mysql
performance_schema
test
access
ami
app
aws
cluster
clusterstatus
clustervars
clusterworkflow
diffs
feature
fileinfo
groupmember
groups
package
parameter
project
repoaccess
report
sessions
source
stage
stageparameter
users
view
viewfeature
volume
workflow




USE mysqlshow TO GET INFO

mysqlshow -uroot | egrep -v "(Databases|information_schema|performance_schema|mysql)" | awk '{print "mysql -uroot -Bse \"drop database", $2, "\""}' | sh

    
</entry>
<entry [Tue 2012:04:24 10:03:24 EST] IMPORT AND EXPORT (WITH AND WITHOUT DATA) USING mysqldump AND mysqlimport>


1. DUMP ALL TABLES (EXCEPT diffs) WITHOUT INFO 

mkdir /tmp/dump
mysqldump -u root -p agua -d --ignore-table=agua.diffs > /tmp/dump/agua.tables.dump


2. DUMP DATA FOR SELECTED TABLES ONLY

PARAMETERS AS ARGUMENTS (INTERACTIVE: MUST INPUT PASSWORD)

mysqldump -u root -p agua ami cluster clustervars --no-create-info --compact --skip-quote-names --where="username = 'admin'" > /tmp/dump/agua.insert.dump

PARAMETERS IN FILE (NON-INTERACTIVE)

emacs /tmp/dump/insert.cnf
    
    [client]
    user=agua
    password=open4agua
    
    [mysqldump]
    no-create-info
    skip-extended-insert
    compact
    skip-quote-names
    where="username = 'admin'"
    result-file=/tmp/dump/agua.insert.dump

mysqldump --defaults-extra-file=/tmp/dump/insert.cnf agua ami cluster clustervars

    OK



3. LOAD USING mysqlimport

copy the tt.sql and tt.txt files to another host and restore...
cat /backup/*.sql | mysql sakila

mysqlimport sakila /backup/*.txt




NOTES
=====

http://oksoft.blogspot.com/2008/10/mysqldump-backups-and-transfers.html

Shantanu's Blog
Corporate Consultant
October 10, 2008
 
mysqldump backups and transfers
mysqldump and change dump file
// Good for backups
mysqldump --all-databases

// Only one database named 'test'
mysqldump test

// Only one table tt from the database test
mysqldump test tt

// all tables from test database except table Audit
mysqldump test --ignore-table=Audit

// save the dump to a file
mysqldump test tt > testing1.txt

// only structure without Data
mysqldump test -d

// only data in tab delimited format
mysqldump test tt --tab=/var/lib/mysql/customers 

copy the tt.sql and tt.txt files to another host and restore...
cat /backup/*.sql | mysql sakila
mysqlimport sakila /backup/*.txt

// without comments, lock tables, drop table if exist 
// only create table statement and insert into in a single statement
mysqldump test tt --compact
CREATE TABLE `tt` (
`name` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
INSERT INTO `tt` VALUES ('aba'),('abacad'),('abacadaea'),('aba'),('abacad'),('abacadaea');

// triggers backup
mysqldump -hlocalhost -uroot -proot@123 db_name -d --no-create-info | sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/' > triggers_backup.sql

# drop current triggers
mysql -Bse"select CONCAT('drop trigger ', TRIGGER_SCHEMA, '.', TRIGGER_NAME, ';') from information_schema.triggers" | mysql -hlocalhost -uroot -proot@123

# Restore from file, use root@localhost credentials
mysql -hlocalhost -uroot -proot@123 < triggers_backup.sql


// without create table statement
mysqldump test tt --compact --no-create-info
INSERT INTO `tt` VALUES ('aba'),('abacad'),('abacadaea'),('aba'),('abacad'),('abacadaea');

// separate insert statements
mysqldump test tt --compact --no-create-info --skip-extended-insert --skip-tz-utc
INSERT INTO `tt` VALUES ('aba');
INSERT INTO `tt` VALUES ('abacad');
INSERT INTO `tt` VALUES ('abacadaea');
INSERT INTO `tt` VALUES ('aba');
INSERT INTO `tt` VALUES ('abacad');
INSERT INTO `tt` VALUES ('abacadaea');

// only records that satisfy a criterion
mysqldump test tt --compact --no-create-info --skip-triggers --insert-ignore --skip-extended-insert --where="name like 'abacada%'"
INSERT ignore INTO `tt` VALUES ('abacadaea');
INSERT ignore INTO `tt` VALUES ('abacadaea');

// 100 records from each table of database dbName for testing
mysqldump --opt --where="true LIMIT 100" dbName > dbname.sql

// backup the stored procedure
mysqldump mysql proc --no-create-info --compact -w"db='db_name' and name='sp_name'"
mysqldump dbname -R -d --compact > somefile.txt
mysqldump -R adyp_mumbai > /root/jdyp_backup/"adyp_mumbai_48_`date +%d%m%y%I`.sql"

// import remote table directly into your local test database
mysqldump -h db4free.net -P 3306 -ushantanuo -pPassWord shantanuo calendar | mysql test

// dump backup to another server
mysqldump test | ssh user@remote.server.com "dd of=/mysql/$(date +'%d-%m-%y')"

// transfer one database to another server
mysqldump -h host1 -u username -pPASSWORD database_name | mysql -h host2 -u username -pPASSWORD database_name

// transfer one table to remote server 
mysqldump test india | mysql -h db4free.net -P 3306 -ushantanuo -pindia162 shantanuo

// transfer one table to another using ssh
mysqldump test mytest1 --compact | ssh root@172.29.0.215 mysql test

// transfer only data to remote table
mysqldump thisDB thisTBL --no-create-info --compact --skip-quote-names | replace "INSERT INTO thisTBL " "INSERT INTO thisTBL_New " | mysql -h 192.29.0.213 -uroot -pPassWd remoteDB

// Creates and optimized database backup of database then passes the output directly to gzip to compress the data
mysqldump –opt test | gzip > /root/

// Does the same thing as above, but for all of the databases on the server.
mysqldump –opt -A | gzip > destination

// copy a table to another server using gzip and ssh
mysqldump -uroot -pPassWord dbName tbl_name --compact | gzip | ssh 999.999.999.999 "gunzip | mysql -uroot -pPassWord someDB"

// dump all the databases to remote server
for I in $(mysql -e 'show databases' -uroot --pPassWord=root -s --skip-column-names); do mysqldump -uroot --pPassword=root $I | gzip -c | ssh user@server.com "cat > /home/$I.sql.gz"; done

//do not change the timestamp values based on timezones
mysqldump test testTime --skip-tz-utc

// restore only one database
mysqldump --one-database BooksDB < mytest.txt

// reset auto increment value to 0
# mysqldump -d dbname --compact | sed 's/\(.*ENGINE.*AUTO_INCREMENT=\).*/\10;/g'

// mysql dump of selected databases without data
mysqldump -uroot -pPassWord -d --compact --routine `echo $(mysqlshow -uroot -pPassWord | awk '{print $2}' | egrep -v 'mysql|test|Databases|information_schema|lost\+found')` | sed 's/\(.*ENGINE.*AUTO_INCREMENT=\).*/\10;/g' 

// search for a word P122C8 in any column 
mysqldump --skip-extended-insert db_name tbl_company | grep 'P122C8'

// In order to maintain the consistency of InnoDB tables
--single-transaction --master-data=2 

// copy a procedure from one database to another
(echo "DELIMITER ;; " && mysqldump --all-databases --routines -d | awk '/testProc/,/;;/') | mysql -h192.0.0.0 -uroot -pPassWord Other_DB

// remove the DEFINER from SP or Function 
// http://forge.mysql.com/tools/tool.php?id=242
mysqldump -uroot -pPassWord -d --routines dbName | perl /home/develop/dumper.pl --delete | more
time mysqldump -uroot -pPassWord -R --single-transaction dbDRCG | perl /home/shantanu/dumper.pl --delete | mysql -uroot -pPassWord shantanu

// or use sed
mysqldump prod_int_dev_ve app_users -d | sed -e 's/DEFINER=[^*]*\*/\*/' | more


// triggers backup
mysqldump -hlocalhost -uroot -proot@123 db_name -d --no-create-info | sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/' > triggers_backup.sql

# drop current triggers
mysql -Bse"select CONCAT('drop trigger ', TRIGGER_SCHEMA, '.', TRIGGER_NAME, ';') from information_schema.triggers" | mysql -hlocalhost -uroot -proot@123

# Restore from file, use root@localhost credentials
mysql -hlocalhost -uroot -proot@123 < triggers_backup.sql

// change all the definers of stored procedures to root@localhost
mysqldump -uroot --all-databases --no-create-info --no-data -R --skip-triggers | sed -e 's/DEFINER=[^*]*\*/\*/' | mysql -hlocalhost -uroot -proot@123


// strip indexes, change engine, set up slave
##perl -p0777i -e 's/,\n^\)/\n\)/mg' –> after removing the indexes, any commas before the closing bracket need to be removed
mysqldump -uuser -ppassword -h127.0.0.1 -P3306 dbname --master-data=1 | sed 's/ENGINE=MyISAM/ENGINE=archive/g' | grep -v '^ UNIQUE KEY' | grep -v '^ KEY' | perl -p0777i -e 's/,\n^\)/\n\)/mg' | mysql -uuser -ppassword -h127.0.0.1 -P3307 dbname

// Exclude one or two databases from dump 
mysql -BNe"show databases" | egrep -vw 'four|five_report|information_schema|mysql|test' | xargs echo mysqldump --single-transaction

// skip 2 tables from dump, can ignore views as well 
mysqldump -uroot -proot@123 -h10.10.10.10 -P3308 --all-databases --ignore-table=Batch.JOB_EXECUTION --ignore-table=Batch.EXECUTION_CONTEXT

// skip locking for log tables and take structure backup
50 08 * * * time mysqldump -h10.10.10.10 -uroot -proot@123 -d -R --all-databases --skip-lock-tables --skip-comments | zip > /home/backup_structure_101_$(date +'\%d\%m\%y').sql.zip 2> /home/backup_err.txt

// one liner to drop all databases
mysqlshow -uroot | egrep -v "(Databases|information_schema|performance_schema|mysql)" | awk '{print "mysql -uroot -Bse \"drop database", $2, "\""}' | sh

// one liner to check foreign key violations
mysqlshow | egrep -v "(Databases|information_schema|performance_schema|mysql)" | awk '{print $2}' | sed '/^$/d' | awk '{sub($1,"mysql \-uroot \-Bse \"call mysql.p_check_fk_constraint_violations\('"'"'&'"'"','"'"'%'"'"'\)\""); print $0}' | sh

// check all DB's for data violation of foreign key
# for dbname in `mysqlshow`; do echo $dbname; mysql -e"call mysql.p_check_fk_constraint_violations('$dbname','%')"; done

## mysql full backup cron
58 11 * * * time mysqldump -h10.11.12.13 -uroot -proot@123 -R --skip-tz-utc --master-data=2 --add-drop-database --databases db1 db2 db3 | zip > /home/shantanu/backup_full_master.sql.zip 2> /home/shantanu/backup_err.txt

# daily schemawise backup 
mysql -BNe"show databases" | egrep -v "(Databases|information_schema|performance_schema|mysql)" | awk '{print "mysqldump -R -f --skip-tz-utc --master-data=2 --add-drop-database --databases", $1, "| gzip > /home/backup/"$1"_$(date +\%Y\%m\%d).sql.gzip"}' | sh 

# daily schemawise backup using cron-job. escape special character %
32 09 * * * mysql -BNe"show databases" | egrep -v "(Databases|information_schema|performance_schema|mysql)" | awk '{print "mysqldump -R -f --skip-tz-utc --master-data=2 --add-drop-database --databases", $1, "| gzip > /home/backup/"$1"\_$(date +\%Y\%m\%d).sql.gzip"}' | sh > /home/shantanu/success.txt 2> /home/shantanu/err.txt

// schema wise back up of all databases starting with "STR"
time mysql -BNe"show databases" | grep ^STR | awk '{print "mysqldump -R -f --skip-tz-utc --master-data=2 --add-drop-database --databases", $1, "| gzip > /home/shantanu/STR/"$1".sql.gzip"}' | sh

// there is no –ignore-database option, use the following to select specific DB from a long list
time mysqldump --databases `mysql -Bse "SELECT GROUP_CONCAT(schema_name SEPARATOR ' ') FROM information_schema.schemata WHERE schema_name NOT IN ('mysql','performance_schema','information_schema');" >` >/mysql/backup/rds2.sql

// there are times when Linux commands like SED and GREP are more powerful than mysql update and alter:

mysqldump test AIRPORT --no-create-info --compact --skip-extended-insert | sed 's/INSERT INTO `AIRPORT` VALUES (//g' | sed 's/);//' > to_load.txt
1,'new airpor\"t',1
3,'3 airport',0
0,'FRANCE',4
5,'PAKIS\'TAN',5

// process the data found in file to_load.txt and then load it back after truncating the table

LOAD DATA LOCAL INFILE 'to_load.txt' into table AIRPORT fields terminated by ',' optionally enclosed by "'";

_____

You can use --compact or --skip-add-drop-table option to suppress the drop table if exist statement in the dump.
But if you have received a file that has the line, you will need to remove it before executing the dump so that the data will be updated in the existing records.

// Use sed to delete those sql statements before importing

# Create a temporary filename
uniq="/tmp/temp_"`date "+%s"`
for item in `ssh user@dbserver ls`;
do
echo -n "Importing $item..."
scp user@dbserver\:$item $uniq;
gunzip < $uniq | sed {/$'DROP TABLE IF EXISTS'/d} | mysql -f -u root $DB_SCHEMA_NAME
echo "..done"
done

# clean up
rm -f "$uniq"

_____

If you like to keep your ddl backed up in some source management tool like svn or cvs and want to do it individually for stored procedures, events, triggers, tables and such rather than having a single file you can easily do so using the below. 

user=backup_user
password=`cat ~/.backup_password`
hostname=127.0.0.1
port=3306
dbname=test_db
path=/home/mysql/ddl
date=`date +%Y%m%d`

mysqldump -u$user -p$password -h$hostname -P$port --no-create-info --no-data --no-create-db --skip-opt $dbname > "$path"/"$dbname"_triggers_"$date".sql
mysqldump -u$user -p$password -h$hostname -P$port --routines --skip-triggers --no-create-info --no-data --no-create-db --skip-opt $dbname > "$path"/"$dbname"_routines_"$date".sql
mysqldump -u$user -p$password -h$hostname -P$port --events --skip-triggers --no-create-info --no-data --no-create-db --skip-opt $dbname > "$path"/"$dbname"_events_"$date".sql
mysqldump -u$user -p$password -h$hostname -P$port --skip-triggers --no-data --no-create-db --skip-opt $dbname > "$path"/"$dbname"_tables_"$date".sql

_____

Copy data from one server to another.

Sending server:
mysqldump db_name tbl_name | bzip2 -c | nc -l 1234

Receiving server:
nc 10.10.10.14 1234 | bzip2 -cd | mysql -uroot -proot@123 db_name
Labels: mysql tips


posted by shantanu  # Friday, October 10, 2008 
Comments:
Thank you!

Was looking for way to reset auto_increment and found it here!

Can't imagine why it is not a default ...
# posted by  SQL_ER : 8:24 AM
Really useful tips. Thanks.
# posted by  Anonymous : 10:29 AM
This might be better option for resetting auto_increment to zero. The example above strips out everything after AUTO_INCREMENT. I needed to keep the options that follow.

mysqldump -d --compact dbname | sed 's/\(AUTO_INCREMENT=\)[0-9]*/\10/g'
# posted by  Anonymous : 10:56 AM
    
</entry>
<entry [Wed 2012:01:25 15:38:38 EST] FIXED PROBLEM OF NEEDING TO ALLOW USERS TO DO 'SHOW DATABASES'>

DID NOT WANT TO GIVE THEM ANY PRIVILEGES OVER mysql.* SO ADDED TO Agua::Configure::_createDbUser:


GRANT SHOW DATABASES ON *.* TO '$user'\@'localhost' IDENTIFIED BY '$password';


WHICH WORKED!!
  
    
</entry>
<entry [Wed 2012:01:11 00:44:58 EST] LOCATION OF MYSQL DATA FILES ON UBUNTU - /var/lib/mysql/agua>


sudo ls -al /var/lib/mysql/agua
    -rw-rw---- 1 mysql mysql  8846 2012-01-02 00:22 access.frm
    -rw-rw---- 1 mysql mysql   224 2012-01-02 00:22 access.MYD
    -rw-rw---- 1 mysql mysql  2048 2012-01-02 00:22 access.MYI
    -rw-rw---- 1 mysql mysql  8754 2012-01-02 00:22 ami.frm


On ubuntu the mysql database usually keeps everything in

/var/lib/mysql

There will be material for the mysql server there and there will be a subdirectory for each mysql database. 

So if you have databases 'foo' and 'bar' in addition to the pre-exisiting administrative database (the one holding it all together) called 'mysql' you will see three subdirectories:

/var/lib/mysql/mysql/
/var/lib/mysql/foo/
/var/lib/mysql/bar/

You will also find configuration data in this directory:
/etc/mysql/
If you want to let the system manage the programs and only worry about the database (columns, tables, users, data, variables, etc) then you can use mysqldump. Using the database's own backup facilities is the correct way to go if you are concerned about the data and maintaining database integrity. Otherwise, just copying the files from the disk you can get partially complete transactions, etc. 

For more detail information about backup and recovery:
http://dev.mysql.com/doc/refman/5.1/...-recovery.html
    
</entry>
<entry [Mon 2011:12:05 00:24:34 EST] FIND OUT WHICH DATABASE IS CURRENTLY SELECTED>

SELECT DATABASE();
    
</entry>
<entry [Sun 2011:12:04 05:33:05 EST] DROP ALL TABLES ON THE COMMAND LINE>

Drop all tables using shell script w/o root access

I've small handy shell script that removes all tables without dropping and creating MySQL database again.

#!/bin/bash
MUSER="$1"
MPASS="$2"
MDB="$3"
 
# Detect paths
MYSQL=$(which mysql)
AWK=$(which awk)
GREP=$(which grep)
 
if [ $# -ne 3 ]
then
	echo "Usage: $0 {MySQL-User-Name} {MySQL-User-Password} {MySQL-Database-Name}"
	echo "Drops all tables from a MySQL"
	exit 1
fi
 
TABLES=$($MYSQL -u $MUSER -p$MPASS $MDB -e 'show tables' | $AWK '{ print $1}' | $GREP -v '^Tables' )
 
for t in $TABLES
do
	echo "Deleting $t table from $MDB database..."
	$MYSQL -u $MUSER -p$MPASS $MDB -e "drop table $t"
done
Simply use above script as follows to empty a database called quiz with username tom and password jerry:
$ ./drop.table.sh tom jerry quiz
    
</entry>
<entry [Thu 2011:06:16 00:08:52 EST] EXTERMINATE MYSQL PROCESSES>

#### KILL mysql	

#print `/etc/init.d/mysql restart`;	 #### HANGS

my $kill = qq{kill `ps aux | grep mysql | awk -F" " '{ if (\$1 == "mysql") print \$2}'`};
print "$kill\n";
`$kill`;
sleep(1);


my @pidfiles = </var/lib/mysql/*pid>;
print "pidfiles: @pidfiles\n";
my $pid = `cat $pidfiles[0]` if @pidfiles;
my $oldpid = $pid;
while ( defined $pid and $pid and ($oldpid != $pid) )
{
	print "killing pid: $pid\n";
	`kill -9 $pid`;
	#`rm -fr /var/lib/mysql/*pid &> /dev/null`;
	sleep(1);

	$oldpid = $pid;
	undef $pid;
	@pidfiles = </var/lib/mysql/*pid>;
	print "pidfiles: @pidfiles\n";
	$pid = `cat $pidfiles[0]` if @pidfiles;
}
    
</entry>
<entry [Mon 2011:06:06 23:36:37 EST] SHOW GRANTS>

GET GRANTS FOR CURRENT USER:

show grants;

    +----------------------------------------------------------------------------------------------------------------------------------------+
    | Grants for root@localhost                                                                                                              |
    +----------------------------------------------------------------------------------------------------------------------------------------+
    | GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY PASSWORD '*4C098B2CC798F750AEBBED06310EBAF7ADBD3D7E' WITH GRANT OPTION |

</entry>
<entry [Wed 2011:04:27 23:48:48 EST] RESET ROOT PASSWORD ON UBUNTU>
http://ubuntu.flowconsult.at/en/mysql-set-change-reset-root-password/

    OK

Tested on
- Ubuntu Linux 7.10 Gutsy Gibbon and MySQL 5.0.45. (2007-10-21)
- Ubuntu Linux 6.06 Dapper Drake and MySQL 4.1.15.

Set / change / reset the MySQL root password on Ubuntu Linux. Enter the following lines in your terminal.

1. Stop the MySQL Server.
sudo /etc/init.d/mysql stop

2. Start the mysqld configuration.
sudo mysqld --skip-grant-tables &

3. Login to MySQL as root.
mysql -u root mysql

4. Replace YOURNEWPASSWORD with your new password!
UPDATE user SET Password=PASSWORD('YOURNEWPASSWORD') WHERE User='root'; FLUSH PRIVILEGES; exit;

Note: This method is not regarded as the securest way of resetting the password. However it works.


</entry>
<entry [Wed Dec 22 11:25:45 EST 2010] INSTALL MYSQL ON OSX (IMAC)>

ADD TO .bash_profile:
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"


DOWNLOAD MYSQL:

curl -O http://mysql.he.net/Downloads/MySQL-5.1/mysql-5.1.33.tar.gz
tar xzvf mysql-5.1.33.tar.gz
cd mysql-5.1.33


</entry>

<entry [Mon Nov  1 08:38:37 EDT 2010] CHANGE ROOT PASSWORD ON WINDOWS>

1. STOP MYSQL SERVER


For a server that is running as a Windows service, find the MySQL service in the list and stop it:

Start menu --> Control Panel --> Administrative Tools-- > Services.

RIGHTCLICK mysql --> Properties

"E:\mysql\bin\mysqld" --defaults-file="E:\mysql\my.ini" MySQL

OR:

If your server is not running as a service, you may need to use the Task Manager to force it to stop.



2. CREATE INI FILE

E:\mysql\mysql-init.txt

UPDATE mysql.user SET Password=PASSWORD('***MyNewPass***') WHERE User='root';
FLUSH PRIVILEGES;



3. START MYSQL IN TERMINAL CONSOLE

E:\mysql\bin\mysqld.exe --defaults-file=E:\mysql\my.ini --init-file=E:\mysql\mysql-init.txt



4. CONNECT TO MYSQL

mysql -u root -p
< PASSWORD>

    OK!

    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 2
    Server version: 5.5.5-m3 MySQL Community Server (GPL)
    
    Copyright (c) 2000, 2010, Oracle and/or its affiliates. All rights reserved.
    This software comes with ABSOLUTELY NO WARRANTY. This is free software,
    and you are welcome to modify and redistribute it under the GPL v2 license
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    mysql> 



5. DELETE mysql-init.txt FILE







NOTES
-----


http://dev.mysql.com/doc/refman/5.0/en/resetting-permissions.html


C.5.4.1.1. Resetting the Root Password: Windows Systems

On Windows, use the following procedure to reset the password for all MySQL root accounts:

Log on to your system as Administrator.

Stop the MySQL server if it is running.

For a server that is running as a Windows service:

Start menu --> Control Panel --> Administrative Tools-- > then Services.
Find the MySQL service in the list and stop it.

If your server is not running as a service, you may need to use the Task Manager to force it to stop.

Create a text file containing the following statements. Replace the password with the password that you want to use.

UPDATE mysql.user SET Password=PASSWORD('MyNewPass') WHERE User='root';
FLUSH PRIVILEGES;

Write the UPDATE and FLUSH statements each on a single line. The UPDATE statement resets the password for all root accounts, and the FLUSH statement tells the server to reload the grant tables into memory so that it notices the password change.

Save the file. For this example, the file will be named C:\mysql-init.txt.

Open a console window to get to the command prompt: From the Start menu, select Run, then enter cmd as the command to be run.

Start the MySQL server with the special --init-file option (notice that the backslash in the option value is doubled):

C:\> C:\mysql\bin\mysqld-nt --init-file=C:\\mysql-init.txt
If you installed MySQL to a location other than C:\mysql, adjust the command accordingly.

The server executes the contents of the file named by the --init-file option at startup, changing each root account password.

You can also add the --console option to the command if you want server output to appear in the console window rather than in a log file.

If you installed MySQL using the MySQL Installation Wizard, you may need to specify a --defaults-file option:

C:\> "C:\Program Files\MySQL\MySQL Server 5.0\bin\mysqld-nt.exe"
         --defaults-file="C:\\Program Files\\MySQL\\MySQL Server 5.0\\my.ini"
         --init-file=C:\\mysql-init.txt
The appropriate --defaults-file setting can be found using the Services Manager: From the Start menu, select Control Panel, then Administrative Tools, then Services. Find the MySQL service in the list, right-click it, and choose the Properties option. The Path to executable field contains the --defaults-file setting.

After the server has started successfully, delete C:\mysql-init.txt.

You should now be able to connect to the MySQL server as root using the new password. Stop the MySQL server, then restart it in normal mode again. If you run the server as a service, start it from the Windows Services window. If you start the server manually, use whatever command you normally use.


</entry>



<entry [Mon Nov  1 08:32:37 EDT 2010] INSTALL LOCAL MYSQL ON PEGASUS TO RUN TileQC>


Running MySQL as Non-Root
http://www.bugzilla.org/docs/2.18/html/nonroot.html


2.5.2.1.1. The Custom Configuration Method

Create a file .my.cnf in your home directory (using /home/foo in this example) as follows....

[mysqld]
datadir=/home/foo/mymysql
socket=/home/foo/mymysql/thesock
port=8081

[mysql]
socket=/home/foo/mymysql/thesock
port=8081

[mysql.server]
user=mysql
basedir=/var/lib

[safe_mysqld]
err-log=/home/foo/mymysql/the.log
pid-file=/home/foo/mymysql/the.pid



2.5.2.1.2. The Custom Built Method

You can install MySQL as a not-root, if you really need to. Build it with PREFIX set to /home/foo/mysql, or use pre-installed executables, specifying that you want to put all of the data files in /home/foo/mysql/data. If there is another MySQL server running on the system that you do not own, use the -P option to specify a TCP port that is not in use.


2.5.2.1.3. Starting the Server

After your mysqld program is built and any .my.cnf file is in place, you must initialize the databases (ONCE).

              bash$
              mysql_install_db
            
Then start the daemon with

              bash$
              safe_mysql &
            
After you start mysqld the first time, you then connect to it as "root" and GRANT permissions to other users. (Again, the MySQL root account has nothing to do with the *NIX root account.)






INSTALL MYSQL 5.5.5 ON LINODE

mkdir -p /root/base/apps/mysql/5.5.5

cd /root/base/apps/mysql/
wget http://www.mysql.com/get/Downloads/MySQL-5.1/mysql-5.1.50.tar.gz/from/ftp://mirror.services.wisc.edu/mirrors/mysql/

./configure --prefix=/root/base/apps/mysql/5.1.50
make

    ...
    sql_connection.o mysqlmanager-user_map.o mysqlmanager-messages.o mysqlmanager-commands.o mysqlmanager-instance.o mysqlmanager-instance_map.o mysqlmanager-instance_options.o mysqlmanager-buffer.o mysqlmanager-parse.o mysqlmanager-guardian.o mysqlmanager-parse_output.o mysqlmanager-user_management_commands.o mysqlmanager-angel.o  ./.libs/liboptions.a -lpthread -lpthread -lpthread -lpthread libnet.a ../../vio/libvio.a ../../mysys/libmysys.a ../../strings/libmystrings.a ../../dbug/libdbug.a -lz -lpthread -lcrypt -lnsl -lm -lpthread
    make[2]: Leaving directory `/root/base/apps/mysql/mysql-5.1.50/server-tools/instance-manager'
    make[1]: Leaving directory `/root/base/apps/mysql/mysql-5.1.50/server-tools'
    Making all in win
    make[1]: Entering directory `/root/base/apps/mysql/mysql-5.1.50/win'
    make[1]: Nothing to be done for `all'.
    make[1]: Leaving directory `/root/base/apps/mysql/mysql-5.1.50/win'


make install

    ...
    Making install in win
    make[1]: Entering directory `/root/base/apps/mysql/mysql-5.1.50/win'
    make[2]: Entering directory `/root/base/apps/mysql/mysql-5.1.50/win'
    make[2]: Nothing to be done for `install-exec-am'.
    make[2]: Nothing to be done for `install-data-am'.
    make[2]: Leaving directory `/root/base/apps/mysql/mysql-5.1.50/win'
    make[1]: Leaving directory `/root/base/apps/mysql/mysql-5.1.50/win'



INSTALL MYSQL 4.1.22 ON LINODE

mkdir /root/base/apps/mysql/4.1.22
cd /root/base/apps/mysql
wget ftp://mirror.anl.gov/pub/mysql/Downloads/MySQL-4.1/mysql-4.1.22.tar.gz
tar xvfz mysql-4.1.22.tar.gz
cd mysql-4.1.22
./configure --prefix=/root/base/apps/mysql/4.1.22

    ...
    config.status: creating thr/Makefile
    config.status: creating trx/Makefile
    config.status: creating usr/Makefile
    config.status: creating ib_config.h
    config.status: executing depfiles commands
    
    MySQL has a Web site at http://www.mysql.com/ which carries details on the
    latest release, upcoming features, and other information to make your
    work or play with MySQL more productive. There you can also find
    information about mailing lists for MySQL discussion.
    
    Remember to check the platform specific part of the reference manual for
    hints about installing MySQL on your platform. Also have a look at the
    files in the Docs directory.
    
    Thank you for choosing MySQL!


make

    ...
              -e 's!@''PERL_DBD_VERSION''@!@PERL_DBD_VERSION@!' \
              -e 's!@''PERL_DATA_DUMPER''@!@PERL_DATA_DUMPER@!' \
            ndb-config-2-node.ini.sh > ndb-config-2-node.ini-t
    /bin/mv ndb-config-2-node.ini-t ndb-config-2-node.ini
    make[3]: Leaving directory `/root/base/apps/mysql/mysql-4.1.22/support-files'
    make[2]: Leaving directory `/root/base/apps/mysql/mysql-4.1.22/support-files'
    make[1]: Leaving directory `/root/base/apps/mysql/mysql-4.1.22'


make install
    
    ...
     /usr/bin/install -c -m 644 'mysql-log-rotate' '/root/base/apps/mysql/4.1.22/share/mysql/mysql-log-rotate'
     /usr/bin/install -c -m 644 'binary-configure' '/root/base/apps/mysql/4.1.22/share/mysql/binary-configure'
     /usr/bin/install -c -m 644 'ndb-config-2-node.ini' '/root/base/apps/mysql/4.1.22/share/mysql/ndb-config-2-node.ini'
    test -z "/root/base/apps/mysql/4.1.22/share/mysql" || mkdir -p -- "/root/base/apps/mysql/4.1.22/share/mysql"
     /usr/bin/install -c 'mysql.server' '/root/base/apps/mysql/4.1.22/share/mysql/mysql.server'
    make[4]: Leaving directory `/root/base/apps/mysql/mysql-4.1.22/support-files'
    make[3]: Leaving directory `/root/base/apps/mysql/mysql-4.1.22/support-files'
    make[2]: Leaving directory `/root/base/apps/mysql/mysql-4.1.22/support-files'
    make[1]: Leaving directory `/root/base/apps/mysql/mysql-4.1.22'



THE CURRENT MYSQL INSTALLATION IS HERE:

[root@li182-248 bin]# which mysql

    /usr/bin/mysql


#mkdir -p root/base/apps/mysql/rpms/5.5.5
#cd root/base/apps/mysql/rpms/5.5.5
#ll
#
#    -rw-r--r-- 1 7161 wheel  17M Jul  6 21:27 MySQL-client-5.5.5_m3-1.linux2.6.x86_64.rpm
#    -rw-r--r-- 1 7161 wheel 6.2M Jul  6 21:28 MySQL-devel-5.5.5_m3-1.linux2.6.x86_64.rpm
#    -rw-r--r-- 1 7161 wheel  48M Jul  6 21:32 MySQL-embedded-5.5.5_m3-1.linux2.6.x86_64.rpm
#    -rw-r--r-- 1 7161 wheel  49M Jul  6 21:27 MySQL-server-5.5.5_m3-1.linux2.6.x86_64.rpm
#    -rw-r--r-- 1 7161 wheel 1.9M Jul  6 21:29 MySQL-shared-5.5.5_m3-1.linux2.6.x86_64.rpm
#    -rw-r--r-- 1 7161 wheel  39M Jul  6 21:28 MySQL-test-5.5.5_m3-1.linux2.6.x86_64.rpm
#
#
#
#for file in \
#MySQL-client-5.5.5_m3-1.linux2.6.x86_64.rpm \
#MySQL-devel-5.5.5_m3-1.linux2.6.x86_64.rpm \
#MySQL-embedded-5.5.5_m3-1.linux2.6.x86_64.rpm \
#MySQL-server-5.5.5_m3-1.linux2.6.x86_64.rpm \
#MySQL-shared-5.5.5_m3-1.linux2.6.x86_64.rpm \
#MySQL-test-5.5.5_m3-1.linux2.6.x86_64.rpm 
#    do rpm -Uvh --prefix=/root/base/apps/mysql/5.5.5 $file;
#done
#

</entry>

<entry [Wed Sept  8 10:58:33 EDT 2010] REMOVE MYSQL SERVICE ON WINDOWS>
    
How to remove MySQL service from XP without mysql in shell?


How to delete a Service in Windows XP


1. Click Start | Run and type regedit in the Open: line. Click OK. 

2. Navigate to HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services 

3. Scroll down the left pane, locate the service folder (MySQL in this case), right click it and select Delete. 

4. Reboot the system



lplatz
08-03-2010, 12:26 PM
Same situation as noted w/this submission. Removed MySQL, but the service remained running on my system. Further created an issue / conflict when I attempted to re-install MySQL. The presence of the MySQL service, blocked my re-install attempt.

using regedit
(START -> enter regedit in the search programs and files field)
click to open regedit
locate the registry location for:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services

From w/in this area locate the MySQL folder and right-click -> delete.

Always a VERY good point to create a restore point prior to deleting anything from your registry.
http://www.sevenforums.com/tutorials/697-system-restore-point-create.html

Thanks for the solution post!!!
    
</entry>


<entry [Wed Apr 21 10:58:33 EDT 2010] HOW TO MANUALLY INSTALL MULTIPLE MySQL INSTANCES ON LINUX>
    
http://code.openark.org/blog/mysql/manually-installing-multiple-mysql-instances-on-linux-howto

February 19, 2009

Installing a single MySQL instance on a linux machine is a very simple operation. It may be as simple as:

    apt-get install mysql-server

But you cannot use this method to install another MySQL instance. Moreover, if you try to manually install another instance, you may find that some collisions occur.

For example, when trying to install two 5.0 servers, apt-get or yum will just tell me 'package is already installed'.

When trying to install a new 5.1 server along with 5.0, an implicit upgrade is performed.

But even if we try forcing the installation, there are collisions:

    * A dpkg or rpm will install my.cnf under /etc. Two installations will override one another. With RPM you may get a .rpmsave backup file, but that doesn't help too much.
    * The daemon file: /etc/init.d/mysql(d) is overwritten.
    * The default data directory is used for both installations: /var/lib/mysql
    * The binaries are overwritten
    * Both installations will use port 3306.
    * In both installations, the same socket file (e.g. /var/run/mysql/mysql.sock) is used.

Interestingly, on Windows, multiple MySQL installations are by far easier:

    * Binaries are under Program Files\\MySQL\\MySQLX.X. With two installations, you specify different directories.
    * Data files are by default directly under the installations paths (MySQL 5.0) or under 'Documents And Settings' (MySQL 5.1) with no collisions.
    * The my.ini files are located directly under the installation paths.
    * The installer asks you for a service name, and notifies you if that name is already in use.
    * The installer let's you know if port 3306 is already taken, and allows you to specify another one.
    * Of course, there's no unix socket file.

I usually install MySQL on Linux using the binary tarball. When there's only one instance expected, I go with the standards: my.cnf is in /etc, mysqld is under /etc/init.d, etc. (no pun intended)
Steps for multiple installation on Linux

When more than one installation is expected, here's a safe way to ensure no collisions occur. We will assume a 5.0 and 5.1 installation (say we want to upgrade):
Install the MySQL binaries under /usr/local

Following the INSTALL document file, we make symbolic links to the full path in the names

    ln -s /usr/local/your-mysql-5.0-full-installation-path /usr/local/mysql50
    ln -s /usr/local/your-mysql-5.1-full-installation-path /usr/local/mysql51

Do not put my.cnf under /etc

Instead, put them directly in the installation path:

    touch /usr/local/mysql50/my.cnf
    touch /usr/local/mysql51/my.cnf



Setup different port numbers in the my.cnf files

For example, in /usr/local/mysql50/my.cnf, use port 3350:

    [mysql]
    port=3350

    [mysqld]
    port=3350

Choose another port (e.g. 3351) for the 5.1 installation, then have it written as above in the 5.1 my.cnf file.



Choose distinct socket files

For example, in /usr/local/mysql50/my.cnf, add:

    [mysql]
    port=3350
    socket=/tmp/mysql50.sock

    [mysqld]
    port=3350
    socket=/tmp/mysql50.sock

Choose another socket and set it up in the second my.cnf file. You may also choose to put the socket files under the data paths or installation paths.



Choose distinct data paths

Either do not specify them at all, in which case they will reside under the installation path, or, if you want to enjoy another partition, use:

    [mysql]
    port=3350
    socket=/tmp/mysql50.sock

    [mysqld]
    port=3350
    socket=/tmp/mysql50.sock
    datadir=/my_raid_path/mysql50/



Create distinct daemons

Manually copy support_files/mysql.server to /etc/init.d under distinct names. For example:

    cp /usr/local/mysql50/support_files/mysql.server /etc/init.d/mysqld50
    cp /usr/local/mysql51/support_files/mysql.server /etc/init.d/mysqld51

Other settings

You may wish to set up a soft link for the client binaries, for example:

    ln -s /usr/local/mysql50/bin/mysql /usr/bin/mysql50

chkconfig (RedHat and derived) can be used to start/stop daemon as service:

    chkconfig --add mysqld50

Conclusion

I would prefer MySQL to come bundled in self-contained directory. The tarball is almost that, except it expects socket file to be on /tmp, and by default uses the 3306 port. I would further like to have a dpkg-reconfigure script to setup the above issues.

Till then, it's manual configuration.


    
</entry>




