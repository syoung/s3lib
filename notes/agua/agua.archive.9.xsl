agua.archive.9


<entry [Fri 2012:08:17 23:55:48 EST] UPGRADED PERL ON MASTER (AQUARIUS-8F2)>

1. INSTALLED PERL 5.14.2
SEE [Fri 2012:08:17 21:07:49 EST] INSTALLED 5.14.2 ON MASTER TO SOLVE: workflow.pl CALL FAILS WITH 'Insecure dependency in require'


2. RAN bin/scripts/install.pl

./install.pl

COMPLETED INSTALL BUT GOT ERRORS:
    
    debconf: Perl may be unconfigured (Can't locate Debconf/Log.pm in @INC (@INC contains: /usr/lib/perl5/site_perl/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.14.2 /usr/lib/perl5/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/5.14.2 .) at (eval 1) line 4.

    Can't locate Dpkg.pm in @INC (@INC contains: /usr/lib/perl5/site_perl/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.14.2 /usr/lib/perl5/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/5.14.2 .) at /usr/bin/update-alternatives line 26.
    BEGIN failed--compilation aborted at /usr/bin/update-alternatives line 26.
    dpkg: error processing procps (--configure):
     subprocess installed post-installation script returned error exit status 2

    Setting up man-db (2.5.7-2ubuntu1) ...
    Can't locate Debconf/Db.pm in @INC (@INC contains: /usr/lib/perl5/site_perl/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.14.2 /usr/lib/perl5/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/5.14.2 .) at /usr/share/debconf/frontend line 6.
    BEGIN failed--compilation aborted at /usr/share/debconf/frontend line 6.



SET PATH TO Debconf/Db.pm IN PERLLIB ENVIRONMENT VARIABLE:


locate Debconf/Db.pm
    /usr/share/perl5/Debconf/Db.pm


export PERLLIB=/usr/share/perl5
apt-get install -f

    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    0 upgraded, 0 newly installed, 0 to remove and 7 not upgraded.
    3 not fully installed or removed.
    After this operation, 0B of additional disk space will be used.
    Setting up debconf (1.5.42ubuntu1) ...
    /bin/sh: python2.5: not found
    
    Setting up procps (1:3.2.8-1ubuntu4.3) ...
    
    Setting up man-db (2.5.7-2ubuntu1) ...
    Updating database of manual pages ...

    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    /sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.



GET INFO ON dpkg:

dpkg -l dpkg dpkg-dev

    Desired=Unknown/Install/Remove/Purge/Hold
    | Status=Not/Inst/Cfg-files/Unpacked/Failed-cfg/Half-inst/trig-aWait/Trig-pend
    |/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
    ||/ Name                                   Version                                Description
    +++-======================================-======================================-============================================================================================
    ii  dpkg                                   1.15.5.6ubuntu4.5                      Debian package management system
    ii  dpkg-dev                               1.15.5.6ubuntu4.5                      Debian package development tools



THIS FAILS:

RUN dpkg -C TO SEE WHAT STATE PACKAGES ARE IN

<!--
    The following packages are only half configured, probably due to problems
    configuring them the first time.  The configuration should be retried using
    dpkg --configure <package> or the configure menu option in dselect:
     man-db               on-line manual pager
     procps               /proc file system utilities
-->


THIS FAILS:

dpkg --configure man-db

    Setting up man-db (2.5.7-2ubuntu1) ...
    Can't locate Debconf/Db.pm in @INC (@INC contains: /usr/lib/perl5/site_perl/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.14.2 /usr/lib/perl5/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/5.14.2 .) at /usr/share/debconf/frontend line 6.
    BEGIN failed--compilation aborted at /usr/share/debconf/frontend line 6.
    dpkg: error processing man-db (--configure):
     subprocess installed post-installation script returned error exit status 2
    Errors were encountered while processing:
     man-db

.. AND THIS FAILS:

dpkg --configure -a

    Setting up man-db (2.5.7-2ubuntu1) ...
    Can't locate Debconf/Db.pm in @INC (@INC contains: /usr/lib/perl5/site_perl/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.14.2 /usr/lib/perl5/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/5.14.2 .) at /usr/share/debconf/frontend line 6.
    BEGIN failed--compilation aborted at /usr/share/debconf/frontend line 6.
    dpkg: error processing man-db (--configure):
     subprocess installed post-installation script returned error exit status 2
    Setting up procps (1:3.2.8-1ubuntu4.3) ...
    Can't locate Dpkg.pm in @INC (@INC contains: /usr/lib/perl5/site_perl/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.14.2 /usr/lib/perl5/5.14.2/x86_64-linux-thread-multi /usr/lib/perl5/5.14.2 .) at /usr/bin/update-alternatives line 26.
    BEGIN failed--compilation aborted at /usr/bin/update-alternatives line 26.
    dpkg: error processing procps (--configure):
     subprocess installed post-installation script returned error exit status 2
    Errors were encountered while processing:
     man-db
     procps

 
 
sudo dpkg-reconfigure libc6
sudo dpkg-reconfigure libc6-i686
sudo dpkg-reconfigure libc6-dev




THEN REINSTALLING PERL?

Thanks.. I used this command and reinstalled the perl and it solved my problem!!!



NOTES
-----

Not sure what is going on. Maybe your missing those directories now or something? Anything corrupted on your file system?

When apt-get gets interrupted otfen going:
apt-get -f install 
works. (the -f is for fix)

If you find some files that were corrupted you can maybe find what package they were located in and download and reinstall that package manually with the dpkg tools.

To find what file/directory was installed with a package you can go:
dpkg --search filename

Sometimes that helps.

Also if you go 'apt-get remove --purge packagename' it also removes any config files and such along with the package. (normally configuration stuff is left behind during a uninstall)
    

The message 'Perl may be unconfigured' ought to have been the hint. You should have run a dpkg -C to see what state packages were in, then a dpkg --configure -a to finish the setup of them. If there were further problems, they would have show up then.
antidumb

dpkg -C is a little trick I don't see noted much, but very useful. It performs of an audit of the dpkg status and tells you anything that's not as it should be. So if apt fails, you can see exactly what is still hung up by it and fix it manually.


</entry>
<entry [Thu 2012:07:26 02:46:41 EST] FIREFOX ROUNDED CORNERS CSS>

.pearElement  {
  border-top-left-radius: 7px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 6px;
  border-bottom-left-radius: 8px;
}
    
</entry>
<entry [Thu 2012:07:26 00:26:35 EST] INFO BUTTON>

<!--
<img src="plugins/core/images/info-16.png" onClick="window.open('http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/index.html?using-regions-availability-zones.html', '_blank')"></img>

-->    
</entry>
<entry [Sun 2012:07:22 17:57:31 EST] TRY INCONSOLATE FONT>

http://www.levien.com/type/myfonts/inconsolata.html
    
</entry>
<entry [Sun 2012:07:15 08:59:41 EST] FIXED APACHE2 SSL ERROR: Invalid method in request \x16\x03\x01 >

http://www.noah.org/wiki/Apache2_Invalid_method_in_request_%5Cx16%5Cx03%5Cx01

PROBLEM

SSL DOESN'T START:

telnet localhost 443
GET \
    UNENCRYPED HTML MESSAGE RETURNED, I.E., NOT LISTENING CORRECTLY ON PORT 443

APACHE ERROR LOG:

    Invalid method in request \x16\x03\x01

    
DIAGNOSIS

THERE IS A MISCONFIGURATION OR LACK OF CONFIGURATION OF VirtualHost WITH SSL.

In other words, your browser is expecting SSL, but the server is sending plain HTTP on port 443.

Typically your conf/httpd.conf file will include conf/extra/httpd-ssl.conf:
Include conf/extra/httpd-ssl.conf

The default httpd-ssl.conf file will have a section like this:
<!--

<VirtualHost _default_:443>
...
</VirtualHost>
    
-->    


SOLUTION

1. ADDED AN Include LINE INTO /etc/apache2/apache2.conf

    #### SSL
    Include sites-available/default-ssl

    ALTERNATELY:
    
    a2ensite default-ssl
    

2. RESTARTED APACHE

    OK


</entry>
<entry [Sun 2012:07:15 07:59:31 EST] FIXED string_too_short ERROR WHEN CREATING HTTPS CERTIFICATE>


http://ilovett.com/blog/projects/debian-apache-ssl

PROBLEM

RAN install.pl TO CREATE CA CERTIFICATE:

sudo /agua/bin/scripts/install.pl --mode enableHttps
 
WHICH RAN:

openssl \
> req \
> -config /mnt/agua/bin/scripts/../../conf/.https/config.txt \
> -newkey rsa:1024 \
> -key /mnt/agua/bin/scripts/../../conf/.https/id_rsa \
> -out /mnt/agua/bin/scripts/../../conf/.https/intermediary.pem

WHICH GAVE THIS ERROR

problems making Certificate Request
140281593738912:error:0D07A098:asn1 encoding routines:ASN1_mbstring_ncopy:string too short:a_mbstr.c:147:minsize=1



DIAGNOSIS

HAVE TO FILL OUT ALL THE FIELDS IN THE config.txt FILE



SOLUTION

FIXED hostname (INSTEAD OF localhost) IN Installer::getDomainName


    
</entry>
<entry [Fri 2012:07:13 15:11:11 EST] MAKE APACHE START AUTOMATICALLY ON BOOT>


*** PROBLEM WAS FASTCGI SCRIPT FAILING. APACHE ATTEMPTS TO START BUT FAILS.
AFTER FIXING THE SCRIPT PROBLEM, APACHE STARTS OKAY ON REBOOT ***


sudo update-rc.d apache2 defaults
chkconfig --levels 235 apache2 on


UNDO:

sudo update-rc.d -f apache2 remove


RESTARTED
LAST ERROR LOG:
[Sat Jul 14 06:31:00 2012] [error] [client 127.0.0.1] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: Doing EXITLABEL, referer: http://localhost/agua/agua.html?admin,9999999999.9999.999,data.home



sudo cp support-files/mysql.server /etc/init.d/mysql
sudo chmod +x /etc/init.d/mysql
sudo update-rc.d mysql defaults
When you restart mysql should be up if everything went ok.




CREATE /etc/init/apache FILE:

cat /etc/init/apache

start on runlevel [2345]
stop on runlevel [!2345]
expect daemon
exec /usr/sbin/apachectl start
pre-stop exec /usr/sbin/apachectl stop


chmod 755 /etc/init/apache



/server/apache/bin/apachectl start
into "/etc/rc.local". The better way to do it would be to create an /etc/init/apache.conf upstart script, I believe the correct values would be something along the lines of:

start on runlevel [2345]
stop on runlevel [!2345]
expect daemon
exec /server/apache/bin/apachectl start
pre-stop exec /server/apache/bin/apachectl stop
Then run "initctl start apache" to start it and "initctl stop apache" to stop it. For more information on upstart configuration files like the above, see "man 5 init".
    
</entry>
<entry [Thu 2012:07:12 02:33:34 EST] IMAGE FOR CLOUD DYNAMICS>
    
http://www.e-potpourri.com/index.php/2008/01/23/mini-magnito-spinning-top-inspired-salt-and-pepper-shaker/
    
    
    
</entry>
<entry [Thu 2012:07:12 02:13:00 EST] CLOUD MINDMAP>

http://www.mindmeister.com/maps/public_map_shell/15936058

    
</entry>
<entry [Wed 2012:07:11 17:59:21 EST] RSYNC'ED AGUA TO LACIE 0.8.0-alpha.1+build.11>

    
</entry>
<entry [Sun 2012:07:08 23:19:39 EST] RSYNC'ED AGUA TO LACIE 0.8.0-alpha.1+build.10.5>


AGUA

mkdir -p /media/LaCie/u10.10/syoung/agua/0.8.0-alpha.1+build10.5
sudo rsync -av --safe-links /repos/private/syoung/agua/* /media/LaCie/u10.10/syoung/agua/0.8.0-alpha.1+build10.5
cp -r /repos/private/syoung/agua/.git /media/LaCie/u10.10/syoung/agua/0.8.0-alpha.1+build10.5
ll /media/LaCie/u10.10/syoung/agua/0.8.0-alpha.1+build10.5

AGUATEST

mkdir -p /media/LaCie/u10.10/syoung/aguatest/0.8.0-alpha.1+build10.5
sudo rsync -av --safe-links /repos/private/syoung/aguatest/* /media/LaCie/u10.10/syoung/aguatest/0.8.0-alpha.1+build10.5
cp -r /repos/private/syoung/aguatest/.git /media/LaCie/u10.10/syoung/aguatest/0.8.0-alpha.1+build10.5
ll /media/LaCie/u10.10/syoung/aguatest/0.8.0-alpha.1+build10.5

NOTES

mkdir -p /media/LaCie/u10.10/syoung/notes/0.8.0-alpha.1+build10.5
sudo rsync -av --safe-links /mnt/home/syoung/notes/* /media/LaCie/u10.10/syoung/notes/0.8.0-alpha.1+build10.5
cp -r /mnt/home/syoung/notes/.git /media/LaCie/u10.10/syoung/notes/0.8.0-alpha.1+build10.5
ll /media/LaCie/u10.10/syoung/notes/0.8.0-alpha.1+build10.5


    
</entry>
<entry [Sat 2012:07:07 20:36:11 EST] USE PERL Safe MODULE FOR UNSAFE APPS>

http://perldoc.perl.org/perlsec.html

This is quite different, however, from not even trusting the writer of the code not to try to do something evil. That's the kind of trust needed when someone hands you a program you've never seen before and says, "Here, run this." For that kind of safety, you might want to check out the Safe module, included standard in the Perl distribution. This module allows the programmer to set up special compartments in which all system operations are trapped and namespace access is carefully controlled. Safe should not be considered bullet-proof, though: it will not prevent the foreign code to set up infinite loops, allocate gigabytes of memory, or even abusing perl bugs to make the host interpreter crash or behave in unpredictable ways. In any case it's better avoided completely if you're really concerned about security.

    
</entry>
<entry [Wed 2012:07:04 02:19:17 EST] FIX SLOW CGI>


DBD::mysql::st execute failed: Unknown column 'token' in 'field list' at /mnt/agua/cgi-bin/lib/Agua/DBase/MySQL.pm line 297.
DBD::mysql::st fetchrow_hashref failed: fetch() without execute() at /mnt/agua/cgi-bin/lib/Agua/DBase/MySQL.pm line 299.
Use of uninitialized value $token in concatenation (.) or string at /mnt/agua/cgi-bin/lib/Agua/Ops/GitHub.pm line 355.
DBD::mysql::st execute failed: Unknown column 'token' in 'field list' at /mnt/agua/cgi-bin/lib/Agua/DBase/MySQL.pm line 297.
DBD::mysql::st fetchrow_hashref failed: fetch() without execute() at /mnt/agua/cgi-bin/lib/Agua/DBase/MySQL.pm line 299.
Use of uninitialized value $token in concatenation (.) or string at /mnt/agua/cgi-bin/lib/Agua/Ops/GitHub.pm line 355.
DBD::mysql::st execute failed: Unknown column 'token' in 'field list' at /mnt/agua/cgi-bin/lib/Agua/DBase/MySQL.pm line 297.
DBD::mysql::st fetchrow_hashref failed: fetch() without execute() at /mnt/agua/cgi-bin/lib/Agua/DBase/MySQL.pm line 299.
Use of uninitialized value $token in concatenation (.) or string at /mnt/agua/cgi-bin/lib/Agua/Ops/GitHub.pm line 355.

    
</entry>
<entry [Sun 2012:06:10 03:50:07 EST] TODO LIST BEFORE RELEASE OF 0.8.0-beta>


aguatest.ops        |   --> SET resources->ec2snapshot VALUE
bioapps.ops         |

    
</entry>
<entry [Sat 2012:06:09 02:58:22 EST] RESTORED aguatest.ops AFTER DELETE>

/mnt/agua/t/bin/Agua/Ops/Install/outputs/public/biorepository/syoung/aguatest/aguatest.ops

{
    "name":   "aguatest",
    "version":        "0.8.0",
    "build":          "",
    "type":           "application",
    "source":         "git",
    "keywords":       ["tests", "agua", "bioinformatics", "workflows", "cloud", "next-generation", "sequencing", "analysis"],
    "description":    "Tests for Agua cloud workflow platform",
    "website ":       "http://www.aguadev.org",
    "installtype":    "ops",
    "opsfile":        "https://api.github.com/repos/syoung/biorepository/syoung/aguatest/aguatest.ops",
    "installfile":    "https://api.github.com/repos/syoung/biorepository/syoung/aguatest/aguatest.pm",
    "resources":      {
        "ec2snapshot": "XXXXXXXX"
    },
    "licensefile":    "https://api.github.com/repos/syoung/biorepository/syoung/aguatest/LICENSE",
    "readmefile":     "https://api.github.com/repos/syoung/biorepository/syoung/aguatests/README",
    "installtype":    "ops",
    "author":         [{ "name": "Stuart", "surname": "Young", "email": "stuartpyoung@gmail.com" }],
    "publication":    [],
    "organisation":   [],
    "ISA":            {},
    "acknowledgements": [],
    "citations":      []
}

    
</entry>
<entry [Wed 2012:06:06 14:06:03 EST] RESCUED agua AFTER ACCIDENTAL PARTIAL DELETE>


1. RESET TO PREVIOUS COMMIT

sudo su
cd /agua
git reset --hard a8be6a6


2. COPY /agua/repos FROM BACKUP





NOTES
=====


EXPRESS METHOD:

sudo su
cd /agua
git reset --hard a8be6a6


SAFE METHOD:

http://stackoverflow.com/questions/1616957/how-do-you-roll-back-reset-a-git-repository-to-a-particular-commit

A slightly less scary way to do this than the git reset --hard method is to create a new branch. Let's assume that you're on the master branch and the commit you want to go back to is c2e7af2b51.

Rename your current master branch:

git branch -m crazyexperiment
Check out your good commit:

git checkout c2e7af2b51
Make your new master branch here:

git checkout -b master

Now you still have your crazy experiment around if you want to look at it later, but your master branch is back at your last known good point, ready to be added to. If you really want to throw away your experiment, you can use:

git branch -D crazyexperiment
    
    
</entry>
<entry [Thu 2012:05:31 04:17:15 EST] ADDED FIX TO Installer.pm FOR FAILED 'LOAD DATA' IN MYSQL 5.5+>
        
TO ENABLE 'LOAD DATA' IN MYSQL AFTER MYSQL 5.5, ADDED "mysql_local_infile=1" TO DSN IN Agua::DBase::MySQL

my $dsn = "DBI:mysql:$database;mysql_local_infile=1";


IN Installer::installMysql, INSERT THE FOLLOWING LINE INTO /etc/mysql/my.cnf

[mysqld]
local-infile=1

   
</entry>
<entry [Wed 2012:05:30 17:19:57 EST] FAKE TERMINATION>

THE FOLLOWING DIDN'T WORK ON UBUNTU 12.04

sub fakeTermination {
	my $self		=	shift;

	#print "Agua::Common::Logger::fakeTermination    self->oldout(): ", 	$self->oldout(), "\n";
	#print "Agua::Common::Logger::fakeTermination    self->olderr(): ", 	$self->olderr(), "\n";
	#
	#### FORK: PARENT MESSAGES AND QUITS, CHILD DOES THE WORK
	if ( my $child_pid = fork() ) 
	{
		$| = 1;

		#### SET InactiveDestroy ON DATABASE HANDLE
		$self->dbobject()->dbh()->{InactiveDestroy} = 1;
		my $dbh = $self->dbobject()->dbh();
		undef $dbh;	

		close(STDOUT);  
		close(STDERR);
		close(STDIN);

		#### PARENT EXITS
		exit(0);
	}

	else
	{
		#### CHILD CONTINUES THE JOB
	
		##### CLOSE OUTPUT SO CGI SCRIPT WILL QUIT
		#close(STDOUT);  
		#close(STDERR);
		#close(STDIN);
		#
		#open(STDOUT);
		#open(STDERR);
		#open(STDIN);
		#

		#sleep(2);

		#### ENSURE DB HANDLE STAYS ALIVE
		
		#$self->logDebug("child", $self);
		#
		#$self->setDbh() if $self->can('dbobject');
	
	}
}


	#my $sleep		=	shift;
	#$sleep = 1 if not defined $sleep;
	
	#if (my $pid = fork) {       # parent does	
	#	$self->dbobject()->dbh->{InactiveDestroy} = 1;
	#	print $message;
	#	exit(0);
	#
	#} elsif (defined $pid) {    # child does
	#	$self->dbobject()->dbh->{InactiveDestroy} = 1;
	#	$self->dbobject()->dbh(undef);
	#	#close STDOUT;
	#	#close STDIN;
	#	#close STDERR;
	#	
	#	return;
	#}


	######if (!fork()) {
	######	print $message;
	######
	######	#### SET InactiveDestroy ON DATABASE HANDLE
	######	$self->dbobject()->dbh()->{InactiveDestroy} = 1;
	######	my $dbh = $self->dbobject()->dbh();
	######	undef $dbh;
	######
	######	close(STDIN) or die "Can't close STDIN: $!\n";
	######	close(STDOUT) or die "Can't close STDOUT: $!\n";
	######	close(STDERR) or die "Can't close STDERR: $!\n";
	######
	######	exit(0);
	######	#do_some_fork_stuff();
	######}

	#my $pid = fork();
	#$self->logDebug("pid", $pid);
	#if ( $pid == 0 )
	#{
	#	#### SET InactiveDestroy ON DATABASE HANDLE
	#	$self->dbobject()->dbh()->{InactiveDestroy} = 1;
	#	my $dbh = $self->dbobject()->dbh();
	#	undef $dbh;
	#	open STDIN, '/dev/null'   or die "Can't read /dev/null: $!";
	#	open STDOUT, '>>/dev/null' or die "Can't write to /dev/null: $!";
	#	open STDERR, '>>/dev/null' or die "Can't write to /dev/null: $!";
	##close(STDOUT);  
	##close(STDERR);
	##close(STDIN);
	#
	#	exit(0);
	#}
	#
	#### SAVE OLD STDOUT & STDERR
	#my $oldout;
	#open $oldout, ">&STDOUT" or die "Can't open old STDOUT\n";
	#my $olderr;
	#open $olderr, ">&STDERR" or die "Can't open old STDERR\n";
	#$self->oldout($oldout);
	#$self->olderr($olderr);
	

	#close(STDOUT);  
	#close(STDERR);
	#close(STDIN);
	#sleep(1);
	
	##### SAVE OLD STDOUT & STDERR
	#my $oldout;
	#open $oldout, ">&STDOUT" or die "Can't open old STDOUT\n";
	#my $olderr;
	#open $olderr, ">&STDERR" or die "Can't open old STDERR\n";
	#$self->oldout($oldout);
	#$self->olderr($olderr);
	#
	#close(STDOUT);  
	#close(STDERR);
	#close(STDIN);
	#sleep($sleep);
	#
	#
	##my $pid = fork();
	##if ( $pid  ) {
	##	print "INSIDE CHILD\n";
	##	exit(0);
	##}
	##else {
	##	print "IN PARENT\n";
	##}
	#
	####### RESTORE OLD STDOUT & STDERR
	##open STDERR, ">&", $olderr;
	#open STDOUT, ">&", $oldout;


    
</entry>
<entry [Tue 2012:05:29 07:14:16 EST] FAST CGI>

CGI::Fast MODULE ON CPAN

http://search.cpan.org/~skimo/FCGI-0.67/FCGI.PL


WRITING FCGI SCRIPTS

http://www.mythic-beasts.com/support/topic_fastcgi.html

FastCGI

After you've written a few web applications, you'll be aware of the performance limitations of the standard CGI ("common gateway interface") protocol by which web servers call user programs to generate pages. CGI is easy to use, but that's about all that can be said for it; a webserver must fork and execute an instance of a CGI script for each page view, and once your CGI programs become complicated, this can impose a substantial overhead. For most sites, this isn't a problem, but CGI is a big limitation for busy sites.

FastCGI is an alternative to CGI which overcomes its performance problems. Rather than invoking a script or program once for each web request, FastCGI maintains persistent "server" processes which can handle numerous requests. The web server communicates with these processes over TCP or UNIX-domain sockets using an open protocol. Unlike mod_perl, mod_python, etc., which run user code inside the webserver, FastCGI keeps users' code separate, which is more secure and reliable. Most scripting languages have support for FastCGI, and present it with the same interface as regular CGI. You can use FastCGI for hosting dynamic content with Mythic Beasts shell accounts, but we recommend that you don't unless it's absolutely necessary, since doing so requires additional setup and can make debugging problems harder. Unless your site really is very busy, we're likely to respond to support requests about FastCGI by recommending that you use normal CGI instead.

To use FastCGI, you need to arrange for the webserver to run your scripts as FastCGI server processes. It is easiest to do this with a .htaccess file. If you want a whole directory of scripts to be invoked as FastCGI servers, then use something like this:

Options +ExecCGI
SetHandler fastcgi-script
Or, to run only scripts with a certain suffix - e.g., .fcgi - as FastCGI servers, use:

Options +ExecCGI
AddHandler fastcgi-script .fcgi
As with regular CGI scripts, you need to take care with the permissions on scripts used as FastCGI servers.


Examples

Here are some trivial examples of scripts adapted for use under FastCGI. In each case, the modified version of the script will work either as a CGI or a FastCGI script:
    
FOR perl, REPLACE THIS:


#!/usr/bin/perl -w
use strict;
use CGI;

my $q = new CGI();

print $q->header(),
        $q->start_html('Test CGI script'),
        $q->p('Hello! The time is',
            scalar(localtime(time())),
            'and your IP address is',
            $q->remote_addr(),
        $q->end_html();
        
        
        
WITH THIS:


#!/usr/bin/perl -w
use strict;
use CGI;
use CGI::Fast;

while (my $q = new CGI::Fast()) {
    print $q->header(),
            $q->start_html('Test CGI script'),
            $q->p('Hello! The time is',
                scalar(localtime(time())),
                'and your IP address is',
                $q->remote_addr(),
            $q->end_html();
}


Python:
there are several modules for FastCGI support. We've installed fcgi.py from Total Control Software (no longer supported, but works fine). You can use any of the others if you install it in your own home directory. There are more changes than in the perl case, but the script is basically the same, and the new one still works under normal CGI:

<!--

#!/usr/bin/python

import cgi
import os
import time

print '''Content-Type: text/html

<html><head><title>
Test CGI Script
</title></head><body>
<p>Hello! The time is'''
print time.asctime(), 'and your IP address is',
print environ['REMOTE_ADDR'], '</body><html>'
-->

WITH THIS:

<!--
#!/usr/bin/python

import fcgi
import os
import time

while fcgi.isFCGI():
    request = fcgi.Accept()
    request.out.write('''Content-Type: text/html

<html><head><title>
Test CGI Script
</title></head><body>
<p>Hello! The time is''')
    request.out.write(time.asctime(), 'and your IP address is')
    request.out.write(request.env['REMOTE_ADDR'], '</body><html>')
    request.Finish()

-->    
    
</entry>
<entry [Mon 2012:05:28 23:50:32 EST] GZIP WITH APACHE>

http://developer.yahoo.com/performance/rules.html

Best Practices for Speeding Up Your Web Site

Gzip Components
tag: server
The time it takes to transfer an HTTP request and response across the network can be significantly reduced by decisions made by front-end engineers. It's true that the end-user's bandwidth speed, Internet service provider, proximity to peering exchange points, etc. are beyond the control of the development team. But there are other variables that affect response times. Compression reduces response times by reducing the size of the HTTP response.
Starting with HTTP/1.1, web clients indicate support for compression with the Accept-Encoding header in the HTTP request.
      Accept-Encoding: gzip, deflate

If the web server sees this header in the request, it may compress the response using one of the methods listed by the client. The web server notifies the web client of this via the Content-Encoding header in the response.
      Content-Encoding: gzip

Gzip is the most popular and effective compression method at this time. It was developed by the GNU project and standardized by RFC 1952. The only other compression format you're likely to see is deflate, but it's less effective and less popular.
Gzipping generally reduces the response size by about 70%. Approximately 90% of today's Internet traffic travels through browsers that claim to support gzip. If you use Apache, the module configuring gzip depends on your version: Apache 1.3 uses mod_gzip while Apache 2.x uses mod_deflate.
There are known issues with browsers and proxies that may cause a mismatch in what the browser expects and what it receives with regard to compressed content. Fortunately, these edge cases are dwindling as the use of older browsers drops off. The Apache modules help out by adding appropriate Vary response headers automatically.
Servers choose what to gzip based on file type, but are typically too limited in what they decide to compress. Most web sites gzip their HTML documents. It's also worthwhile to gzip your scripts and stylesheets, but many web sites miss this opportunity. In fact, it's worthwhile to compress any text response including XML and JSON. Image and PDF files should not be gzipped because they are already compressed. Trying to gzip them not only wastes CPU but can potentially increase file sizes.
Gzipping as many file types as possible is an easy way to reduce page weight and accelerate the user experience.
    
</entry>
<entry [Mon 2012:05:21 02:24:29 EST] ISOLATED VIEW TAB onClose CONFIRM METHOD>
    
INSIDE View.startup:

    var thisObject = this;
	this.mainTab.onClose = function() {
		console.log("view.View.startup    onClose fired.");
		var returned = confirm("Close this tab?");
		console.log("view.View.startup    returned: " + returned);

		return returned;
	};
    
</entry>
<entry [Thu 2012:05:17 18:54:44 EST] USERS DON'T LIKE SLOW GENOME BROWSERS>

FROM ARTICLE ON BLOG:
http://blog.openhelix.eu/?p=619

SURVEY OF GENOME BROWSERS:

http://www.maizegdb.org/genome_browser_survey.php

the respondents usually cite perceived slowness of the website as the major (and sometimes the only) problem.
    
</entry>
<entry [Thu 2012:05:17 18:48:39 EST] LINK TO GENE WIKI USING ENTREZ GENE ID>
    
http://en.wikipedia.org/wiki/Portal:Gene_Wiki

ENTREZ ID TO GENE WIKI MAPPING:

http://genewikiplus.org/data/genewiki-latest.txt


    
</entry><entry [Thu 2012:05:17 18:44:49 EST] GENOME WIKI ON FRIEND FEED - LINK OUT TO UCSC>

http://friendfeed.com/the-life-scientists/39433d2f/what-would-you-look-for-in-genome-wiki

The Life Scientists: Ian Holmes

What would you look for in a "genome wiki"? - http://biowiki.org/GenomeWiki
March 23, 2009 - Comment - Like - Share
'Mummi' Thorisson, Pierre Lindenbaum, Pedro Beltrao and 2 other people liked this
This page started off as a section for an article we're writing on JBrowse (http//jbrowse.org/). What have I missed? - Ian Holmes
I think the biggest thing is integration with an existing critical mass of users (because growing one from scratch is tough). So, how about links to/from the UCSC and Ensembl genome browsers? - Andrew Su
BTW, for consistency, you could link the Gene Wiki to http://en.wikipedia.org/wiki... - Andrew Su
thanks Andrew! I've added this. - Ian Holmes
Might be nice to have a way to have a central repository with links to map published ChIP-Seq data to the genome, like GEO. I know this is dreamland, but just saying. Also, customizable tracks like UCSC has is fantastic but underutilized re: Ensembl's "Configure this page". Your drag/view is great. - Heather
I second Andrew's comment: it'd be cool to be able to 'throw' a given track in G/JBrowse onto Ensembl and/or UCSC ( 'see this region in the [other] browser'), via DAS (for Ensembl) or BED/wiggle for UCSC. I suppose the DAS route is already possible, albeit not for very dense/big sets of features. - 'Mummi' Thorisson

    
</entry>

<entry [Thu 2012:05:17 17:29:07 EST] TWEET AGUA PROGRESS>

HTML LINK TO SEARCH TWITTER ON GOOGLE:

https://www.google.com/search?sclient=psy-ab&hl=en&biw=2495&bih=1182&site=webhp&source=hp&q=zarfeblong+%22progress%3A%22+site%3Atwitter.com&btnK=Google+Search
    
</entry>
<entry [Wed 2012:05:16 00:41:01 EST] DYNAMICALLY INSTANTIATE CLASS>

Dynamically Instantiate a Dojo Class At Runtime
Need to create an instance of a class in Dojo without knowing what that class is ahead of time? Will you only have the name of the class that you want to instantiate? Check this out:

/**
 * Create a new instance of a Dojo class.
 *
 * @param className
 *    (String) A fully-qualified name for class, such as 
 *    "my.pack.age.Class"
 * @param constructorSettings
 *    (object) An object that will be passed on to the 
 *    class's constructor.
 */
function instantiateDojoClass(className, constructorSettings){
    try {
        dojo.require(className);
        
        /*
         * Eval the class name to get a reference to the 
         * function, then call it as a constructor using the 
         * constructorSettings object as an argument.
         */
        var obj = new (eval(className))(constructorSettings);
    } catch (e){
        /*
         * Handle any errors that might happen.
         */
        if(console){
            console.error("Could not instantiate %s: %s", classsName, e.message);
        } else {
            alert("Could not instantiate "+className+": "+e.message);
        }
        throw e;
    }
}
    
</entry>
<entry [Mon 2012:05:14 03:13:36 EST] CREATED aguatest DATABASE WITH dumpUser.pl USING testuser ON agua DATABASE>

I.E., WANT **TEST** DATA TO SHADOW **REAL** DATA AS CLOSELY AS POSSIBLE

testuser IN agua DATABASE --> aguatest USER IN aguatest DATABASE 



1. USE testuser IN agua TO REPLICATE ERROR

COPY Project1/Workflow1 FROM admin TO testuser



2. DUMP FROM agua DATABASE USING dumpUser.pl

agua USER DATA

/agua/bin/scripts/dumpUser.pl \
--outputfile /agua/t/dump/agua.120514.dump \
--username agua \
--tables "access:owner='testuser',\
ami,\
app:owner='testuser',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='testuser',\
groupmember:name='testuser',\
groups,\
package,\
parameter:owner='testuser',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    dumpUser.pl    Completed    Mon May 14 03:42:09 EDT 2012


/agua/bin/scripts/dumpUser.pl \
--outputfile /agua/t/dump/testuser.120514.dump \
--username testuser \
--tables "access:owner='testuser',\
ami,\
app:owner='testuser',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='testuser',\
groupmember:name='testuser',\
groups,\
package,\
parameter:owner='testuser',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


    
3. REPLACE testuser WITH aguatest IN OUTPUT FILES


sed 's/testuser/aguatest/g' /agua/t/dump/insert-testuser.120514.dump > /agua/t/dump/insert-aguatest.120514.dump



4. LOAD INTO aguatest DATABASE

mysql -u root -p aguatest < /agua/t/dump/agua.120514.dump
mysql -u root -p aguatest < /agua/t/dump/insert-aguatest.120514.dump

select username, project, name , number from workflow;
    +----------+-----------+-----------+--------+
    | username | project   | name      | number |
    +----------+-----------+-----------+--------+
    | agua     | Project1  | Workflow3 |      3 |
    | agua     | Project1  | Workflow4 |      4 |
    | agua     | Project1  | WorkflowA |      5 |
    | agua     | ProjectX  | Workflow3 |      3 |
    | agua     | Reference | genomes   |      1 |
    | aguatest | Project1  | Workflow1 |      1 |
    | aguatest | Project1  | Workflow2 |      2 |
    | aguatest | Project2  | Workflow1 |      1 |
    +----------+-----------+-----------+--------+



5. COPY testuser FILESYSTEM TO aguatest IF CHANGED

mkdir -p /agua/t/nethome/aguatest/agua/Project1/Workflow1
mkdir -p /agua/t/nethome/aguatest/agua/Project1/Workflow2
mkdir -p /agua/t/nethome/aguatest/agua/Project2/Workflow1

COPY test* FILE/DIRS FOR copyFile TESTS:

cp -r /nethome/testuser/agua/Project1/Workflow1/* \
/agua/t/nethome/aguatest/agua/Project1/Workflow1
chown -R www-data:www-data /agua/t/nethome/aguatest/agua

    
    
6. GENERATE getData.*json FILE

echo '{"username":"aguatest","sessionId":"9999999999.9999.999","mode":"getData","database":"aguatest"}' | /var/www/cgi-bin/agua/workflow.cgi > /agua/t/html/json/getData.aguatest.120514.json

REMOVE:

    Content-type: text/html


</entry>
<entry [Sat 2012:05:12 05:19:01 EST] ADDED dijit.progressBar TO Login.js>

http://localhost/agua/dojo-1.6.1rc2/dijit/tests/ProgressBar.html


console.clear();
var login = Agua.loginController;
login.setLoginStyle = function () {
	
	dojo.removeClass(this.message, "error");
	dojo.removeClass(this.message, "accepted");
	this.message.innerHTML = "Authenticating...";
	
	console.log("Login.setLoginStyle    Doing progress bar removeClass 'inactive'"); 
    console.dir({login:this});       
    console.dir({progressBar:this.progressBar});       

    dojo.removeClass(this.progressBar.domNode, "inactive");
};

login.setLogoutStyle = function () {
	console.log("Logout.setLogoutStyle    Getting ");
	
	// RESET LOGIN DIALOGUE
	this.message.innerHTML = this.loginMessage;
	dojo.removeClass(this.message, "error");
	dojo.removeClass(this.message, "accepted");

	// RESET LOGIN STATUS
	this.statusBar.username.innerHTML = 'Logged out';
	this.statusBar.launcher.innerHTML = 'Log In';

	console.log("Login.setLoginStyle    Doing progress bar addClass 'inactive'");        
    dojo.addClass(this.progressBar.domNode, "inactive");
};

Agua.loginController.show();
//Agua.loginController.setLoginStyle();
//Agua.loginController.setLogoutStyle();


//Agua.loginController.progressBar.set({value:60,progress: 60});

//dojo.reloadCss();



    
</entry>
<entry [Thu 2012:05:10 16:10:02 EST] SIMPLIFIED dumpUser.pl TO PRODUCE SINGLE USER DATA>

PROBLEM: WANT **TEST** DATA TO SHADOW **REAL** DATA AS CLOSELY AS POSSIBLE

SOLUTION:

aguatest USER IN aguatest DATABASE MIRRORS testuser USER IN agua DATABASE

1. USE testuser IN agua TO REPLICATE ERROR

2. DUMP FROM agua DATABASE USING dumpUser.pl

3. REPLACE testuser WITH aguatest IN OUTPUT FILES

4. LOAD INTO aguatest DATABASE

5. COPY testuser FILESYSTEM TO aguatest IF CHANGED


testuser USER DATA

/agua/bin/scripts/dumpUser.pl \
--outputfile /agua/bin/sql/dump/testuser.dump \
--username agua \
--tables "access:owner='testuser',\
ami,\
app:owner='testuser',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='testuser',\
groupmember:name='testuser',\
groups,\
package,\
parameter:owner='testuser',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report

    
</entry>
<entry [Tue 2012:05:08 06:47:02 EST] INSTALL R ON STARCLUSTER WITH SNOWFALL>

Its pretty straightforward to setup and R cluster using StarCluster and the snow/snowfall package
    
</entry>
<entry [Mon 2012:05:07 12:32:03 EST] RAN dumpUser.pl USING agua USER DATA>

FIXED BUG BY REMOVING 'where=username="admin"' SO ami, cluster, ETC. TABLES ARE INCLUDED IN OUTPUT:


NON-USER DATA AND agua USER DATA

/agua/bin/scripts/dumpUser.pl \
--outputfile /agua/bin/sql/dump/default.dump \
--username agua \
--tables "access:owner='agua',\
ami,\
app:owner='agua',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='agua',\
groups,\
package,\
parameter:owner='agua',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


guest USER DATA

/agua/bin/scripts/dumpUser.pl \
--outputfile /agua/bin/sql/dump/guest.dump \
--username agua \
--tables "access:owner='guest',\
ami,\
app:owner='guest',\
cluster,\
clustervars,\
clusterworkflow,\
feature,\
groupmember:owner='guest',\
groupmember:name='guest',\
groups,\
package,\
parameter:owner='guest',\
project,\
sessions,\
source,\
stage,\
stageparameter,\
users,\
view,\
viewfeature,\
volume,\
workflow" \
--ignore diffs,report


OLD FORMAT:

/agua/bin/scripts/dumpUser.pl \
--outputfile /agua/bin/sql/dump/agua.dump \
--tables "ami,\
cluster,\
clustervars,\
feature:username='agua' or username='guest',\
viewfeature:username='agua' or username='guest',\
view:username='agua' or username='guest',\
source,\
groupmember:owner='agua' and groupname='users',\
access:owner='agua' and groupname='users',\
groups:username='agua' and groupname='users',\
users:username='guest' or username='agua'" \
--ignore diffs,report


EXAMPLE OUTPUT FILE:

cat /mnt/agua/bin/scripts/../../log/dump/insert.dump

#### INSERT TABLES 
INSERT INTO users VALUES ('guest','guest','guest@trash.com','guest','guest','Guest user with limited privileges','2012-03-06 01:50:25');
INSERT INTO source VALUES ('admin','Demo data','Application-specific input/output data','/data/sequence/demo');
INSERT INTO source VALUES ('admin','Reference genomes','Application-specific reference data','/data/sequence/reference');
INSERT INTO source VALUES ('syoung','Demo','Demo sequence data for all aligners','/data/sequence/demo');
INSERT INTO view VALUES ('guest','Project1','View1','human','hg19','chr1','knownGene',250000000,35000000,'','ready','2012-04-25 02:38:06');
INSERT INTO viewfeature VALUES ('guest','Project1','View2','control1','human','hg19','/nethome/guest/agua/Project1/Workflow9/jbrowse/control1');
INSERT INTO viewfeature VALUES ('guest','Project1','View2','control2','human','hg19','/nethome/guest/agua/Project1/Workflow9/jbrowse/control2');
INSERT INTO viewfeature VALUES ('guest','Project1','View1','test1','human','hg19','/nethome/guest/agua/Project1/Workflow9/jbrowse/test1');
INSERT INTO feature VALUES ('agua','','','knownGene','static','human','hg19','/data/jbrowse/human/hg19/knownGene');
INSERT INTO feature VALUES ('agua','','','knownAlt','static','human','hg19','/data/jbrowse/human/hg19/knownAlt');
INSERT INTO feature VALUES ('agua','','','dgv','static','human','hg19','/data/jbrowse/human/hg19/dgv');
INSERT INTO feature VALUES ('agua','','','hinv70PseudoGene','static','human','hg19','/data/jbrowse/human/hg19/hinv70PseudoGene');
INSERT INTO feature VALUES ('agua','','','hinv70NonCoding','static','human','hg19','/data/jbrowse/human/hg19/hinv70NonCoding');
INSERT INTO feature VALUES ('agua','','','wgEncodeGencode2wayConsPseudoV','static','human','hg19','/data/jbrowse/human/hg19/wgEncodeGencode2wayConsPseudoV4');
INSERT INTO feature VALUES ('agua','','','wgEncodeGencodePolyaV4','static','human','hg19','/data/jbrowse/human/hg19/wgEncodeGencodePolyaV4');
INSERT INTO feature VALUES ('agua','','','sgpGene','static','human','hg19','/data/jbrowse/human/hg19/sgpGene');
INSERT INTO feature VALUES ('agua','','','exoniphy','static','human','hg19','/data/jbrowse/human/hg19/exoniphy');
INSERT INTO feature VALUES ('agua','','','ccdsGene','static','human','hg19','/data/jbrowse/human/hg91/ccdsGene   ');
INSERT INTO feature VALUES ('agua','','','refGene','static','human','hg19','/data/jbrowse/human/hg19/refGene');
INSERT INTO feature VALUES ('agua','','','hgIkmc','static','human','hg19','/data/jbrowse/human/hg19/hgIkmc');
INSERT INTO feature VALUES ('agua','','','nscanGene','static','human','hg19','/data/jbrowse/human/hg19/nscanGene');
INSERT INTO feature VALUES ('agua','','','wgEncodeGencodeAutoV4','static','human','hg19','/data/jbrowse/human/hg19/wgEncodeGencodeAutoV4');
INSERT INTO feature VALUES ('agua','','','vegaPseudoGene','static','human','hg19','/data/jbrowse/human/hg19/vegaPseudoGene');
INSERT INTO feature VALUES ('agua','','','vegaGene','static','human','hg19','/data/jbrowse/human/hg19/vegaGene');
INSERT INTO clustervars VALUES ('admin','admin-microcluster',36281,36282,'/opt/sge6','admin-microcluster');
INSERT INTO clustervars VALUES ('admin','admin-largecluster',36291,36292,'/opt/sge6','admin-largecluster');
INSERT INTO clustervars VALUES ('admin','admin-mediumcluster',36301,36302,'/opt/sge6','admin-mediumcluster');
INSERT INTO clustervars VALUES ('admin','admin-smallcluster',36311,36312,'/opt/sge6','admin-smallcluster');
INSERT INTO cluster VALUES ('admin','admin-microcluster',1,1,'t1.micro','ami-d1c42db8','us-east-1a','micro cluster for testing','0000-00-00 00:00:00');
INSERT INTO cluster VALUES ('admin','admin-largecluster',7,12,'t1.micro','ami-d1c42db8','us-east-1a','Large','0000-00-00 00:00:00');
INSERT INTO cluster VALUES ('admin','admin-smallcluster',3,5,'t1.micro','ami-d1c42db8','us-east-1a','Small','0000-00-00 00:00:00');
INSERT INTO cluster VALUES ('admin','admin-mediumcluster',3,5,'t1.micro','ami-d1c42db8','us-east-1a','Medium','0000-00-00 00:00:00');
INSERT INTO ami VALUES ('admin','ami-ca847aa3','sc-u10.04-hadoop.2','EBS','Ubuntu 10.04 StarCluster exec node image with Hadoop installed','2011-08-27 03:53:20');
INSERT INTO ami VALUES ('admin','ami-c6a877af','StarCluster-base','EBS','StarCluster base image','2011-08-28 01:07:45');


</entry>
<entry [Sun 2012:05:06 04:12:05 EST] GUEST USER ALLOWED QUERIES>

getData
checkFiles
fileSystem

    
</entry>
<entry [Sat 2012:05:05 07:20:13 EST] WebKit REMOTE DEBUGGING FOR MOBILE APPS>

http://www.webkit.org/blog/1620/webkit-remote-debugging/
    
</entry>
<entry [Sat 2012:05:05 06:28:59 EST] firefile FIREBUG EXTENSION TO SAVE LIVE EDITED CSS FILES>

NB: GOOD LIST OF FIREBUG EXTENSIONS:
http://docs.moodle.org/dev/Firebug


https://addons.mozilla.org/en-US/firefox/addon/firefile/

Firebug extension to save the CSS files edited with firebug live to your web server. That makes Firebug become the first remote-save live-preview CSS editor and allows ultra-fast webdesign and prototyping.
    
</entry>
<entry [Sat 2012:05:05 06:27:37 EST] FLASHFIREBUG EXTENSION FOR FLASH EDITING>

https://addons.mozilla.org/en-US/firefox/addon/flashfirebug/
    
</entry>
<entry [Sat 2012:05:05 06:20:19 EST] FIREBUG ON IPAD AND IPHONE>

http://martinkool.com/post/13629963755/firebug-on-ipad-and-iphone
    
</entry>
<entry [Sat 2012:05:05 06:06:37 EST] USE CHROME WITH AutoSave TO LIVE EDIT JAVASCRIPT>

https://github.com/NV/chrome-devtools-autosave

http://addyosmani.com/blog/autosave-changes-chrome-dev-tools/
    
</entry>
<entry [Thu 2012:05:03 19:18:13 EST] PiClouds FREE CLOUD HOURS>

http://www.linkedin.com/news?viewArticle=&articleID=858214772&gid=4137054&type=member&item=77126427&articleURL=http%3A%2F%2Fblog%2Epicloud%2Ecom%2F2011%2F10%2F20%2Fintroducing-free-core-hours-for-academic-research%2F&urlhash=xL4_&trk=group_most_popular_guest-0-b-shrttl&goback=%2Egna_4137054
    
</entry>
<entry [Mon 2012:04:30 04:33:06 EST] PRE-TEST CLUSTER CREATED BUILD 021 AND VERSION 0.8.0-alpha+build6>

1. BUILT 023

[Mon 2012:04:30 04:34:02 EST] BUILD 023: FIXED delete AND refresh ON NEWLY-FILECACHED Folders


2. USED BUILD IN agua.html


3. CREATED VERSION 0.8.0-alpha+build6

[Mon 2012:04:30 04:30:33 EST] AGUA 0.8.0-alpha+build6: +Fix: Folders delete and refresh

    
</entry>
<entry [Tue 2012:04:24 13:02:21 EST] CREATED DEFAULT agua.tables.dump AND agua.data.dump FILES>

NB: Configure.pm LOADS THE agua.dump FILE GENERATED BY dumpUser.pl


CREATED dumpUser.pl TO GENERATE agua.dump FROM THESE FILES:

agua.create.dump        # CREATE TABLES
agua.insert.dump        # INSERT DATA


BEFORE RUNNING dumpUser.pl, VERIFY THE FOLLOWING CHECKLIST:


1. UPDATE AMI IDS IN ami TABLE

CURRENT AMIs:

select * from ami;

| username | amiid        | aminame            | amitype | description                                                    | datetime
| admin    | ami-ca847aa3 | sc-u10.04-hadoop.2 | EBS     | Ubuntu 10.04 StarCluster exec node image with Hadoop installed | 2011-08-27 03:53:20 |
| admin    | ami-c6a877af | StarCluster-base   | EBS     | StarCluster base image                                         | 2011-08-28 01:07:45 |


2. GET CONTENTS OF TABLES WHERE USERNAME = ADMIN

ami             DEFAULT AMIs IN ADMIN Cluster PANEL
cluster         DEFAULT CLUSTERS AVAILABLE TO ALL USERS
clustervars     PORT NUMBERS, ETC. OF DEFAULT CLUSTERS
source          REFERENCE AND DEMO DATA
feature         JBROWSE STATIC FEATURES
                (COMPLEMENTARY TO View::linkTracks - WHICH LISTS FILES
                IN DIR. LATER: USE feature TABLE TO MANAGE ADD/REMOVE
                static TRACKS)
groupmember     SHARED REFERENCE AND DEMO DATA


3. THESE TABLES WILL BE POPULATED BY admin ON LOAD PACKAGES

package     


4. THESE TABLES WILL BE POPULATED BY agua ON LOAD PACKAGES

apps
parameter
groupmember 
project
workflow
stage
stageparameter


5. *** IGNORE *** CONTENTS OF THESE TABLES

aws             AWS ACCESS CREDENTIALS
repoaccess      GITHUB TOKENS AND SSH KEYS
sessions        SESSION IDs



cd /agua/bin/sql/dump
grep "DROP TABLE" agua.dump


6. RUN dumpUser.pl

/agua/bin/scripts/dumpUser.pl \
--tables "ami,cluster,clustervars,feature,source,groupmember:owner='admin' and groupname='users' and name='Demo data' or name='Reference',access:owner='admin' and groupname='users',groups:username='admin' and groupname='users',users:username='guest'" \
--ignore diffs,report

    OK

cat /agua/bin/sql/dump/insert.dump 

#### INSERT TABLES 
INSERT INTO users VALUES ('guest','guest','guest@trash.com','guest','guest','Guest user with limited privileges','2012-03-06 01:50:25');
INSERT INTO groups VALUES ('admin','users','General users group','Use this group to share general sources and workflows');
INSERT INTO access VALUES ('admin','users',0,1,1,0,1,1);
INSERT INTO groupmember VALUES ('admin','users','','Demo data','source','Application-specific input/output data','/data/sequence/demo');
INSERT INTO groupmember VALUES ('admin','users','','Reference','project','','Reference');
INSERT INTO source VALUES ('admin','Demo data','Application-specific input/output data','/data/sequence/demo');
INSERT INTO source VALUES ('admin','Reference genomes','Application-specific reference data','/data/sequence/reference');
INSERT INTO feature VALUES ('admin','','','Affy','static','human','hg19','/data/jbrowse/human/hg19/Affy');
INSERT INTO feature VALUES ('admin','','','ccdsGene','static','human','hg19','/data/jbrowse/human/hg19/PolyA');
INSERT INTO feature VALUES ('admin','','','CpG','static','human','hg19','/data/jbrowse/human/hg19/PolyA');
INSERT INTO feature VALUES ('admin','','','Encode','static','human','hg19','/data/jbrowse/human/hg19/Encode');
INSERT INTO feature VALUES ('admin','','','PolyA','static','human','hg19','/data/jbrowse/human/hg19/PolyA');
INSERT INTO feature VALUES ('admin','','','vegaGene','static','human','hg19','/data/jbrowse/human/hg19/PolyA');
INSERT INTO feature VALUES ('admin','ProjectX','','Affy','static','human','hg19','/data/jbrowse/human/hg19/Affy');
INSERT INTO feature VALUES ('admin','ProjectX','','ccdsGene','static','human','hg19','/data/jbrowse/human/hg19/PolyA');
INSERT INTO feature VALUES ('admin','ProjectX','','CpG','static','human','hg19','/data/jbrowse/human/hg19/PolyA');
INSERT INTO feature VALUES ('admin','ProjectX','','Encode','static','human','hg19','/data/jbrowse/human/hg19/Encode');
INSERT INTO feature VALUES ('admin','ProjectX','','PolyA','static','human','hg19','/data/jbrowse/human/hg19/PolyA');
INSERT INTO feature VALUES ('admin','ProjectX','','vegaGene','static','human','hg19','/data/jbrowse/human/hg19/PolyA');
INSERT INTO clustervars VALUES ('admin','admin-largecluster',36291,36292,'/opt/sge6','admin-largecluster');
INSERT INTO clustervars VALUES ('admin','admin-mediumcluster',36301,36302,'/opt/sge6','admin-mediumcluster');
INSERT INTO clustervars VALUES ('admin','admin-microcluster',36281,36282,'/opt/sge6','admin-microcluster');
INSERT INTO clustervars VALUES ('admin','admin-smallcluster',36311,36312,'/opt/sge6','admin-smallcluster');
INSERT INTO cluster VALUES ('admin','admin-largecluster',7,12,'t1.micro','ami-d1c42db8','us-east-1a','Large','0000-00-00 00:00:00');
INSERT INTO cluster VALUES ('admin','admin-mediumcluster',3,5,'t1.micro','ami-d1c42db8','us-east-1a','Medium','0000-00-00 00:00:00');
INSERT INTO cluster VALUES ('admin','admin-microcluster',1,1,'t1.micro','ami-d1c42db8','us-east-1a','micro cluster for testing','0000-00-00 00:00:00');
INSERT INTO cluster VALUES ('admin','admin-smallcluster',3,5,'t1.micro','ami-d1c42db8','us-east-1a','Small','0000-00-00 00:00:00');
INSERT INTO ami VALUES ('admin','ami-c6a877af','StarCluster-base','EBS','StarCluster base image','2011-08-28 01:07:45');
INSERT INTO ami VALUES ('admin','ami-ca847aa3','sc-u10.04-hadoop.2','EBS','Ubuntu 10.04 StarCluster exec node image with Hadoop installed','2011-08-27 03:53:20');


    
</entry>
<entry [Mon 2012:04:23 00:47:57 EST] FIXED Folders.js DOUBLE CALL TO _GroupDragPane._onLoadHandler>


plugins.files._GroupDragPane._onLoadHandler caller: _setContent
plugins.files._GroupDragPane._onLoadHandler caller: onItems


    
</entry>
<entry [Wed 2012:04:18 16:32:20 EST] REMOVED 'WITH' ROLE CALLS FOR Workflow.pm>
    
    #class Agua::Workflow with (Agua::Common::Base,
#	Agua::Common::Cluster,
#	Agua::Common::Database,
#	Agua::Common::Group,
#	Agua::Common::Logger,
#	Agua::Common::Login,
#	Agua::Common::Package,
#	Agua::Common::Privileges,
#	Agua::Common::Project,
#	Agua::Common::SGE,
#	Agua::Common::Source,
#	Agua::Common::Stage,
#	Agua::Common::Workflow,
#	Agua::Common::User,
#	Agua::Common::Util)
#{


    
</entry>
<entry [Tue 2012:04:17 00:07:20 EST] AGUA AND OTHER DOMAINS ON GODADDY>
    

clouddynamicsconsulting.com	    08/27/2012

biorepo.org                     11/05/2012

asiabridgecommunications.com    11/26/2012

hwiki.org	                    01/05/2013

aguadev.org	                    03/13/2013

homeroomwiki.com	            04/16/2013

homeroomwiki.org	            04/17/2013

islandtranslations.com	        06/08/2013

invasionmoo.com	                02/03/2014

    
</entry>
<entry [Sun 2012:04:08 22:57:34 EST] CORRECTED ERRORS AFTER BUILD 018>

1. plugins.form.Uploader, ETC. NEED Agua BUT IT'S NOT DEFINED
E.G., NEEDS username AND sessionId IN FORM AS HIDDEN VALUES

SOLUTION: REMOVED INSTANTIATIONS IN dojo.addOnLoad CALLS AT END OF .Controller FILES


    
</entry>
<entry [Sun 2012:04:08 03:24:03 EST] VIEW: ADDED agua,applications AND agua,data TO CONF, REDID LINKS FOR VIEWS 1 AND 2>

1. CHANGED PERMISSIONS ON default.conf TO ALLOW EDITING BY syoung ONLY

2. ADDED ENTRIES TO default.conf

    APPLICATIONS            aquarius-8
    DATA                    aquarius-8


3. REMOVED THE '0.6' FROM VIEW LINKS:

cd /nethome/jbrowse/users/admin/Project1/View1/data/tracks

    ccdsGene -> /var/www/html/agua/0.6/plugins/view/jbrowse/species/human/hg19/data/tracks/chr10/ccdsGene
    control2 -> /nethome/syoung/agua/Project1/Workflow9/jbrowse/control2/data/tracks/chr10/control2
    cpgIslandExt -> /var/www/html/agua/0.6/plugins/view/jbrowse/species/human/hg19/data/tracks/chr10/cpgIslandExt
    cytoBand -> /var/www/html/agua/0.6/plugins/view/jbrowse/species/human/hg19/data/tracks/chr10/cytoBand



4. DELETED EXISTING ENTRIES IN view TABLE

DELETE FROM view WHERE project='Project1' AND view='View1' AND username='admin';
DELETE FROM view WHERE project='Project1' AND view='View2' AND username='admin';



5. RAN addView

echo '{"project":"Project1","view":"View1","species":"human","build":"hg19","username":"admin","sessionId":"9999999999.9999.999","mode":"addView","SHOWLOG":4}' | ./view.cgi


echo '{"project":"Project1","view":"View2","species":"human","build":"hg19","username":"admin","sessionId":"9999999999.9999.999","mode":"addView","SHOWLOG":4}' | ./view.cgi


    OK


</entry>
<entry [Tue 2012:04:03 19:42:09 EST] install.pl PROBLEM INSTALLING MooseX::Methods>

HAD TO INSTALL MANUALLY

cd /root/.cpanm/work/1333483355.9966/MooseX-Method-Signatures-0.41



    
</entry>
<entry [Tue 2012:04:03 14:22:36 EST] POST-UPDATE TO 12.04: REINSTALLED PACKAGES>

MYSQL

apt-get install mysql-server mysql-server-5.5
    ...
    The following NEW packages will be installed:
      libdbd-mysql-perl libdbi-perl libhtml-template-perl libmysqlclient18
      libnet-daemon-perl libplrpc-perl mysql-client-5.5 mysql-client-core-5.5
      mysql-common mysql-server mysql-server-5.5 mysql-server-core-5.5
    0 upgraded, 12 newly installed, 0 to remove and 441 not upgraded.
    Need to get 27.1 MB of archives.
    After this operation, 97.1 MB of additional disk space will be used.
    Do you want to continue [Y/n]? y
    ...

APACHE

apt-get install apache2

CPANMINUS

apt-get install cpanminus


PERL MODULES

cpanm install JSON
cpanm install Term::ReadKey
cpanm install File::Wildcard


COPY BASH SCRIPTS
/var/www/.bash_profile
emacs -nw /var/www/.bashrc
    . ~/.bash_profile


INSTALL

cd /agua/bin/scripts
./install.pl


REINSTALL APPS
apt-get install git
apt-get install qgit



    
</entry>

<entry [Sat 2012:03:31 12:23:24 EST] IBM WIDGETS API>

http://publib.boulder.ibm.com/infocenter/rbdhelp/v7r5m0/index.jsp?topic=/com.ibm.egl.lr.doc/topics/regl_ui_richui_extending_dojo.html
    
</entry>
<entry [Fri 2012:03:30 00:28:44 EST] HELP: EXPLANATION OF SSH BY BITBUCKET>


http://confluence.atlassian.com/display/BITBUCKET/Using+the+SSH+protocol+with+bitbucket


    
</entry>
<entry [Sun 2012:03:18 22:06:57 EST] FIXED 'fadeIn is undefined' ERROR WHEN CLOSING FileManager>


BY EDITING dijit.Dialog


IN  build/agua_dojo_dijit.js.uncompressed.js


LINE 97401


if(!dojo._hasResource["dijit.Dialog"]){ //_hasResource checks added by build. Do not use _hasResource directly in your code.
dojo._hasResource["dijit.Dialog"] = true;
dojo.provide("dijit.Dialog");


LINE 10106:

			// fade-in Animation object, setup below
			var fadeIn;

MOVED THIS UP:

			fadeIn = dojo.fadeIn({
				node: this.domNode,
				duration: this.duration,
				beforeBegin: dojo.hitch(this, function(){
					dijit._DialogLevelManager.show(this, this.underlayAttrs);
				}),
				onEnd: dojo.hitch(this, function(){
					if(this.autofocus && dijit._DialogLevelManager.isTop(this)){
						// find focusable items each time dialog is shown since if dialog contains a widget the
						// first focusable items can change
						this._getFocusItems(this.domNode);
						dijit.focus(this._firstFocusItem);
					}
					this._fadeInDeferred.callback(true);
					delete this._fadeInDeferred;
				})
			}).play();
			
			this._fadeInDeferred = new dojo.Deferred(dojo.hitch(this, function(){
				fadeIn.stop();
				delete this._fadeInDeferred;
			}));


    
</entry>
<entry [Sun 2012:03:18 20:42:46 EST] TESTED WORKFLOWS WITH ERIDANUS-8 AMI FOR STARCLUSTER NODES>

1. REPLACED AMI ID IN admin-smallcluster.config WITH ERIDANUS-8: ami-c6a877af

2. REPEATED WORKFLOW TESTS

ww
reset ; echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"2","start":1,"stop":"","username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-smallcluster","SHOWLOG":4}' | ./workflow.cgi | tee  /tmp/out






    
</entry>
<entry [Sun 2012:03:18 19:29:18 EST] EDUCATION: COURSE ON HOW TO USE R:BIOCONDUCTOR>

http://www.bioconductor.org/help/course-materials/2011/SeattleIntro2011/    
    
</entry>
<entry [Sun 2012:03:18 19:25:18 EST] INSTALLED R AND BIOCONDUCTOR ON HEADNODE>




PROBLEM:

apt-get r-base

GET ELF FILE ERROR AT END OF INSTALL


SOLUTION:

SET CFLAGS TO -m64 BEFORE CONFIGURE


    
</entry>
<entry [Sun 2012:03:18 19:21:36 EST] LIST OF NEXTGEN R PACKAGES>

Bioconductor packages for HTS

Biostrings
BSGenome
ShortRead
TileQC
GenomeGraphs
HilbertVis
TileQC
ChipSeq
edgeR

    
</entry>
<entry [Sun 2012:03:18 04:41:26 EST] FIX FAILURE TO KILL MASTER NODE>


PROBLEM:

BALANCER FAILS TO KILL master NODE 

/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config bal admin-smallcluster --max_nodes=5 --min_nodes=0 --interval=15 --job_wait_time=100 --stabilization_time=30 --kill_after=3  --kill-master


>>> Oldest job is from None. # queued jobs = 0. # hosts = 2.
>>> Avg job duration = 16 sec, Avg wait time = 10 sec.
>>> Checking to remove a node...
>>> Idle Node i-1d3fb179 (master) has been up for 42 minutes past the hour.
>>> ***KILLING NODE: i-1d3fb179 (ec2-23-20-42-177.compute-1.amazonaws.com).
!!! ERROR - Failed to terminate node master
>>> Sleeping, looping again in 15 seconds.



SOLUTION:

COMMENTED OUT LINES 824-825 IN cluster.py:

       for node in nodes:
            #if node.is_master():
                #raise exception.InvalidOperation("cannot remove master node")
 

NOW MASTER NODE IS KILLED:

>>> Oldest job is from None. # queued jobs = 0. # hosts = 2.
>>> Avg job duration = 16 sec, Avg wait time = 10 sec.
>>> Checking to remove a node...
>>> Idle Node i-1d3fb179 (master) has been up for 7 minutes past the hour.
>>> ***KILLING NODE: i-1d3fb179 (ec2-23-20-42-177.compute-1.amazonaws.com).
>>> Removing node master (i-1d3fb179)...
>>> Removing master from SGE
!!! ERROR - command 'source /etc/profile && qconf -sq all.q > /tmp/allq' failed with status 1
!!! ERROR - command 'source /etc/profile && qconf -Mq /tmp/allq_new' failed with status 1
!!! ERROR - command 'source /etc/profile && qconf -dconf master' failed with status 1
>>> Removing master from known_hosts files
>>> Removing master from /etc/hosts
>>> Removing master from NFS
>>> Terminating node: master (i-1d3fb179)
>>> Sleeping, looping again in 15 seconds.

>>> Entire cluster is not up, nodes added/removed. No Action.


    
</entry>
<entry [Sun 2012:03:18 03:30:19 EST] VERIFY KILL NODES AND CLUSTER STOP AFTER NO JOBS>

SEE [Sun 2012:03:18 03:16:43 EST] RUN bal COMMAND AND OPTIONS

/data/starcluster/0.91-316/bin/starcluster \
-c /nethome/admin/.starcluster/admin-smallcluster.config listcluster

cd /nethome/admin/.starcluster/plugins

/data/starcluster/0.91-316/bin/starcluster \
-c /nethome/admin/.starcluster/admin-smallcluster.config \
bal \
admin-smallcluster \
--max_nodes=5 \
--min_nodes=1 \
--interval=15 \
--job_wait_time=100 \
--stabilization_time=30 \
--kill_after=3


USAGE:

-i polling interval (secs)
-w max wait time before adding node (secs)
-s cluster stabilisation time to wait (secs)
-k Can kill node after it has been up for XX minutes (DEFAULT: 45 mins)

/data/starcluster/0.91-316/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config bal --help

Usage: loadbalance < cluster_tag >

    Start the SGE Load Balancer.

    Example:

        $ starcluster loadbalance mycluster

    This command will endlessly attempt to monitor and load balance 'mycluster'
    based on the current SGE load. You can also have the load balancer plot the
    various stats it's monitoring over time using the --plot-stats option:

        $ starcluster loadbalance -p mycluster

    If you just want the stats data and not the plots use the --dump-stats
    option instead:

        $ starcluster loadbalance -d mycluster

    See "starcluster loadbalance --help" for more details on the '-p' and '-d'
    options as well as other options for tuning the SGE load balancer
    algorithm.

Options:
  -h, --help            show this help message and exit
  -d, --dump-stats      Output stats to a csv file at each iteration
  -D STATS_FILE, --dump-stats-file=STATS_FILE
                        File to dump stats to (default:
                        /root/.starcluster/sge/< cluster_tag>/sge-stats.csv)
  -p, --plot-stats      Plot usage stats at each iteration
  -P PLOT_OUTPUT_DIR, --plot-output-dir=PLOT_OUTPUT_DIR
                        Output directory for stats plots (default:
                        /root/.starcluster/sge/< cluster_tag>)
  -i INTERVAL, --interval=INTERVAL
                        Polling interval for load balancer
  -m MAX_NODES, --max_nodes=MAX_NODES
                        Maximum # of nodes in cluster
  -w WAIT_TIME, --job_wait_time=WAIT_TIME
                        Maximum wait time for a job before adding nodes,
                        seconds
  -a ADD_PI, --add_nodes_per_iter=ADD_PI
                        Number of nodes to add per iteration
  -k KILL_AFTER, --kill_after=KILL_AFTER
                        Minutes after which a node can be killed
  -s STAB, --stabilization_time=STAB
                        Seconds to wait before cluster stabilizes
  -l LOOKBACK_WIN, --lookback_window=LOOKBACK_WIN
                        Minutes to look back for past job history
  -n MIN_NODES, --min_nodes=MIN_NODES
                        Minimum number of nodes in cluster
  -K, --kill-master     Allow the master to be killed when the queue is empty
                        (EXPERIMENTAL).
  -q QUEUE_NAME, --queue_name=QUEUE_NAME
                        Name of the queue (default: all.q)

    
</entry>
<entry [Sat 2012:03:17 19:33:58 EST] PREPARATION AND TEST RUN FOR CREATION OF ERIDANUS-8>

1. REMOVED KEYS FROM MASTER:

root@ip-10-220-113-204:~/.ssh# ll
total 24K
drwx------ 2 root root 4.0K 2012-03-12 22:59 .
drwx------ 6 root root 4.0K 2012-03-17 21:39 ..
-rw------- 1 root root  779 2012-03-12 22:58 authorized_keys
-r-------- 1 root root 1.7K 2012-03-12 22:58 id_rsa
-r-------- 1 root root  380 2012-03-12 22:58 id_rsa.pub
-rw-r--r-- 1 root root  388 2012-03-12 22:59 known_hosts
root@ip-10-220-113-204:~/.ssh# 


root@ip-10-220-113-204:~/.ssh# head -n 100 *
==> authorized_keys <==
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHMcasIdFoh52xGvClnvJxAOE97VymemqmTar73vnKgNdfXGy0i+A63Nm0C3mUqpC6bthA7Yf8t7lHKQObHLRY89jeK0YCgQ/fsrq88WxVi0+wCp8SncypMmnHasL2ZfBWp/pgmriRd6TqL8D0Urc4zXVFdyb0amLtvSSTYy7qKAkR5ImOW6PiBJ1d0EhB8cQDSyvZbddQeJtT4OUWvvhxeO23rK6fKvH6pJnZmhmsF5m49c2DrG/EUciszaogTmDxHv8cw9itQtPm/gBOzvmU1J7CHGm+oo49CH9a0uAJG0HQPEBhL7gGiIuXMeXt8+J3loYNRYeisOO6cuDH6U69 id_rsa-admin-key
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZ3T6ypwngQwxLw/yn9QqKSrtb8ZweIF0hO+civfhEVge6e5/EnJgkNB+n3fUyGhIMJBlsfE7BMsWU9Bhgm7XiNfRS8r/xPLRG0QIGgUZzNmPPYPmtjkVbgfaPi7lExEYcG3lWgRVulSFr5l5CwcG7+5cvNTphD4INeRBfWhnbFqBU6VshoWiYGoKLqDku4haM/DyIt2cT7ts5hx+1zU9CWfE2px4edt1FbCrjyb/zYI8RalNlZKzUXuFpB0G6scoTT/fp4FMQ7ILPLoEOCdS2yvlph9iqq8Gfd8puQl3tEkTmqoKgfWQsMev3NgXGR+9OS7t+XGhxrKgPHcQr7F9j

==> id_rsa <==
-----BEGIN RSA PRIVATE KEY-----
MIIEqQIBAAKCAQEA2d0+sqcJ4EMMS8P8p/UKikq7W/GcHiBdITvnIr34RFYHunuf
xJyYJDQfp931MhoSDCQZbHxOwTLFlPQYYJu14jX0UvK/8Ty0RtECBoFGczZjz2D5
rY5FW4H2j4u5RMRGHBt5VoEVbpUha+ZeQsHBu/uXLzU6YQ+CDXkQX1oZ2xagVOlb
IaFomBqCi6g5LuIWjPw8iLdnE+7bOYcftc1PQlnxNqceHnbdRWwq48m/82CPEWpT
ZWSs1F7haQdBurHKE0/36eBTEOyCzy6BDgnUtsr5aYfYqqvBn3fKbkJd7RJE5qqC
oH1kLDHr9zYFxkfvTku7flxocayoDx3EK+xfYwIDAQABAoIBAQC0CKWAIpMBtMZb
cei+rrr4DsuHLkCRkLME/KiDSDL53ZHjY7diVPlQqZYjNUMjFPInAEnWIV8/PgKS
lafzZZlHBskRJrLA2iYrgxpGX9vk52RRgdSxvCjKdrpWYuNF1WAOaBG8D02zpR8K
OENarRy4iC6l/zlv7c3N7mY+NYm6RhDf2M9PdmG/aCCVnvX05m4dLjR5y0gf9GfT
13HRM0kaLu+7SuTPn0UQ+mJUxTzjNCq3vtqMsPPlL4NUS89wMScAaBTl9wroEUvJ
wXoHF+gdKtDT/eWEpW41iK9sO4Av6+mmahGVrykaXlLgZqXtis/LHRHVFOBeypL4
DwViQmpxAoIAgQDlzqiE5kGuuPtXs1YohVOljCJXnRESmduhLCAxJhVUPUFfpbuV
ZVhcJ+mZBT7XTh+BL+YENgcdXmATvumTewP5MhpiKqN+hjMINbHgRm3xB10ybfBr
+fYsSb3ZptPpX3/RIgBZIhVrCQH5XmRCegYBmPPdwXC69VjfvXYywppiOwKCAIEA
8rIcocx9Tn59AzI2F7wNI5m/xQ0Uh+aXHGwgBhgVJfLCf/YwM+KgZO6GumSj3nKC
cXIytK0BtkmuucFboRROVGV1+rmUZgKOxDVHKEMhY2YgqnEsETwHQdBP4sX4n5mL
ixqWskGlgp/YfNIEr23t3eRmsLZtVksD9+EHd51nPPkCggCBAOUYblt/CH/cnYTC
nePrdoYU+6+IP5rhk1hLmxQkOSMvpdpqaGT5EWtdxrzrw8f0c+fgDlioW9NlYDaP
HmAORNnKnw66Hx9lPb6zeM5yp+ufQcOiYgniuQ1RvlgavitrLwsX8GzrU5rO8g7d
kOnMp+wzxPmPfIiFSsJSKGFWK349AoIAgB2uWMAU8TI7V/CfIGxwrC6xa/meaudf
9RUdyCDWqydz9AOQST7fNXyCi2maS0w2NuvG6pqcGfyAMGU5V4pwoE/EBNTAA30i
TPGEDorHAvtUDySpKJmG/OA4qLx0N77VGXLOsqVkT+iUwfYp/TazPAcKGuD7vo1y
KS8Uj0Q6tNiJAoIAgC8XQcTTVqsfGY0wIWPFrBBysKsB+A9q60vJfZF0oiKFyf63
xAqqMcpm7IQiDWDL9YIwbhB2MED4xiZcuYK4u44ZDbDxz3J0+g616v0T+wTySj8k
xDb6ey3+weqSyV1GezAfJb8kQ+C7DUbPrTPOqe9IA2iVZC53rcrCtWNP2w21
-----END RSA PRIVATE KEY-----

==> id_rsa.pub <==
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZ3T6ypwngQwxLw/yn9QqKSrtb8ZweIF0hO+civfhEVge6e5/EnJgkNB+n3fUyGhIMJBlsfE7BMsWU9Bhgm7XiNfRS8r/xPLRG0QIGgUZzNmPPYPmtjkVbgfaPi7lExEYcG3lWgRVulSFr5l5CwcG7+5cvNTphD4INeRBfWhnbFqBU6VshoWiYGoKLqDku4haM/DyIt2cT7ts5hx+1zU9CWfE2px4edt1FbCrjyb/zYI8RalNlZKzUXuFpB0G6scoTT/fp4FMQ7ILPLoEOCdS2yvlph9iqq8Gfd8puQl3tEkTmqoKgfWQsMev3NgXGR+9OS7t+XGhxrKgPHcQr7F9j
==> known_hosts <==
master ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkYroV8fGqLulUIQzjnsP0Vsbf6rBotT9xX9Pl5ZMnRtcKzCWaiqeeCCqFwMQ9/ubdJrFdjzGl94EozLnXOqvadAtQdr5H+4Tft4cwJBG790O9nqoxBmJX+9Ol5dIKhEwFIWr3agbvFVFRoxXbMZW8sbiVfEwEfYodwMaNOBjNb82nWFgs1lN8T6hcuMtpVrsMuTCzNUuU4cHg27ota+SlNd5RqDc4sUWuzyVzY7xVnflrGCMUyGqw8Ts2aO0E0OWdTORcPuT3ffvyMpFu0x+1LMgIZLdUbjKgsgVBCBdvaRdFkBHXo+csEZr9MLmROkIvz4i7zbpqAp8lgiKDoNnt

   
   
2. CREATED known_keys FILE IN .ssh TO ENABLE IMAGE COMMAND AND SSH FROM HEADNODE USING id_rsa-admin-key

cat .ssh/known_keys

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZ3T6ypwngQwxLw/yn9QqKSrtb8ZweIF0hO+civfhEVge6e5/EnJgkNB+n3fUyGhIMJBlsfE7BMsWU9Bhgm7XiNfRS8r/xPLRG0QIGgUZzNmPPYPmtjkVbgfaPi7lExEYcG3lWgRVulSFr5l5CwcG7+5cvNTphD4INeRBfWhnbFqBU6VshoWiYGoKLqDku4haM/DyIt2cT7ts5hx+1zU9CWfE2px4edt1FbCrjyb/zYI8RalNlZKzUXuFpB0G6scoTT/fp4FMQ7ILPLoEOCdS2yvlph9iqq8Gfd8puQl3tEkTmqoKgfWQsMev3NgXGR+9OS7t+XGhxrKgPHcQr7F9j


3. CLEANED UP DISC

SEE [Sat 2012:03:17 23:21:17 EST] SECURE DELETE FILES AND WIPE EMPTY SPACE

    1. INSTALL SECURE DELETE
    sudo aptitude install secure-delete
    
    2. CLEAN MEMORY
    srmem -v
    
    3. WRITE OVER BLANK SPACE
    sfill -v /
    
    4. FIND SWAP LOCATION
    cat /proc/swaps
    
    5. DISABLE SWAP
    sudo swapoff /dev/sda3
    
    6. WIPE SWAP
    sudo sswap /dev/sda3
    
    7. REENABLE SWAP
    sudo swapon /dev/sda3



   
3. CREATED IMAGE ON HEADNODE

/data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config \
ebsimage \
i-e7661783 \
eridanus-8

    StarCluster - (http://web.mit.edu/starcluster) (v. 0.92rc2)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    >>> Removing private data...
    >>> Creating EBS image...
    >>> Waiting for AMI ami-aa815ec3 to become available... 
    >>> create_image took 1.034 mins
    >>> Your new AMI id is: ami-aa815ec3


DELETE IMAGE AND REDO:

ec2-deregister ami-aa815ec3



4. CONFIRM IMAGE
    
    IMAGE	ami-9c835cf5	728213020069/aquarius-8	728213020069	available	private		x86_64	machine	aki-825ea7eb		ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-39268643	10	



5. LAUNCH IMAGE

ec2-run-instances \
--key aquarius2 \
ami-9c835cf5 \
--instance-type t1.micro \
-z us-east-1a 


 
</entry>
<entry [Sat 2012:03:17 00:48:44 EST] HOW TO CREATE AN AMI FROM STARCLUSTER IMAGE>

http://web.mit.edu/star/cluster/docs/latest/manual/create_new_ami.html


    
</entry>
