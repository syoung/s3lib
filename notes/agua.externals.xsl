agua.config

<entry [Tue 2011:04:26 00:34:34 EST] FIXED apt-get ERROR: 'Could not get lock /var/lib/dpkg/lock'>

rm -fr /var/lib/dpkg/lock
dpkg --configure -a
rm -fr /var/cache/apt/archives/lock


/var/lib/apt/lists/lock


http://www.linuxquestions.org/questions/linux-newbie-8/e-could-not-get-lock-var-lib-dpkg-lock-open-11-resource-temporarily-unavailable-360554/

I fixed it by updating the file database .... 
1> sudo updatedb

2> kill -9 $(pidof dpkg)
3> kill -9 $(pidof synaptic)
4> kill -9 $(pidof apt-get)
5> locate lock | grep /var "to search for any lock files." prune the list looking for any single file called "lock"
6> I forcefully removed it with --> "rm -rf /var/lib/dpkg/lock"
7> apt-get upgrade
8> Then i re-run the "dpkg --configure -a" --> this then caused the previous broken packed to fail thus releasing the regeneration of the software lock.

After doing this I reran the updatedb and locate lock | grep /var to ensure that the lock didn't come back.


    
</entry>

<entry [Wed 2011:04:13 18:16:26 EST] INSTALLED Schedule::SGE FOR MORE ROBUST GRABBING OF JOBID>

**** BUT DIDN'T USE ***

IN CPAN:
install Schedule::SGE


There are currently four modules, SGE that is the glue, SGE::Run allows you to submit jobs to the SGE. SGE::Control for starting/stopping/deleting jobs, and SGE::Status for seeing what the cluster is currently up to. You should be able to use SGE; in your script and have all methods available to you.


SGE Modules
http://cpan.uwinnipeg.ca/dist/ScheduleSGE
http://cpan.uwinnipeg.ca/htdocs/ScheduleSGE/README.html

These are light-weight modules designed to submit jobs to the Sun Grid Engine, and query the status of the engine. There are more comprehensive modules available in DRMAA. The alternate module, DRMAA, relies on Swig and a bunch of C code. This is a pure perl implementation of an interface to SGE. The required commands are qsub, qdel, and qstat that should be supplied by SGE.


Environment Variables
The following environment variables should probably be set. The values below are the defaults for my system, an Orion cluster

        SGE_CELL                =>  "orionmulti"
        SGE_EXECD_PORT          =>  537
        SGE_QMASTER_PORT        =>  536
        SGE_ROOT                =>  /opt/sge
These are set at the beginning of SGE.pm

There are currently four modules, SGE that is the glue, SGE::Run allows you to submit jobs to the SGE. SGE::Control for starting/stopping/deleting jobs, and SGE::Status for seeing what the cluster is currently up to. You should be able to use SGE; in your script and have all methods available to you.

Methods should be documented with perldoc.

This has only been tested on an Orion 12-node desktop cluster. I would be happy to crash test it on any other clusters, just give me a login or send me a cluster to use.

Version History

0.01 April 2005. Initial release to the wild 0.02 October 2005. Received these excellent comments from Hinri Kerstens:

        Thank you for writing the ScheduleSGE perl module. When using this
        module I found two 'mismatches' between your system and mine.
        - My SGE version (5.3) returns "your job" instead of "Your job" after
        submission of a job. Maybe you can make line 233 of Run.pm tolerant for
        that.
        - The CPAN documentation claims that a jobID can be grabbed by  "my
        $pid=$sge->job_id;", but job_id doesn't exist in the modules. It should
        be "my $pid=$sge->execute;" isn't it?
        
        After these modifications the module runs happily, so keep on the good
        work.
        
        regards
        
        Hinri
    
</entry>
<entry [Wed 2011:04:06 11:18:40 EST] LOCALISATION @BABELZILLA>

https://addons.mozilla.org/en-US/firefox/addon/firesteg/
Additionally, I have revamped the user interface and added localization support for SEVEN new languages: German, Spanish, French, Japanese, Polish, Brazilian Portuguese, and Turkish. Many thanks to the folks at Babelzilla for providing the translations.
    
</entry>

<entry [Thu 2011:03:31 11:15:09 EST] ORIGINAL AND EDITED apache2/sites-available/default>
EDITED:
<!--
<VirtualHost *:80>
	ServerAdmin webmaster@localhost

#	DocumentRoot /var/www
	DocumentRoot /var/www/html
	<Directory />
		Options FollowSymLinks
		AllowOverride None
	</Directory>
#	<Directory /var/www/>
	<Directory /var/www/html>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride None
		Order allow,deny
		allow from all
	</Directory>

#	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
#	<Directory "/usr/lib/cgi-bin">
	ScriptAlias /cgi-bin/ /var/www/cgi-bin/
	<Directory "/var/www/cgi-bin">
		AllowOverride None
#		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
		Options Indexes FollowSymLinks MultiViews
		Options +ExecCGI -MultiViews
		Order allow,deny
		Allow from all
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog ${APACHE_LOG_DIR}/access.log combined

    Alias /doc/ "/usr/share/doc/"
    <Directory "/usr/share/doc/">
        Options Indexes MultiViews FollowSymLinks
        AllowOverride None
        Order deny,allow
        Deny from all
        Allow from 127.0.0.0/255.0.0.0 ::1/128
    </Directory>

</VirtualHost>



ORIGINAL

<VirtualHost *:80>
	ServerAdmin webmaster@localhost

	DocumentRoot /var/www/html
	<Directory />
		Options FollowSymLinks
		AllowOverride None
	</Directory>
	<Directory /var/www/html>
		Options Indexes +FollowSymLinks MultiViews
		AllowOverride None
		Order allow,deny
		allow from all
	</Directory>

	#ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
	#<Directory "/usr/lib/cgi-bin">

	ScriptAlias /cgi-bin/ /var/www/cgi-bin/
	<Directory "/var/www/cgi-bin">
		AllowOverride None
		Options Indexes FollowSymLinks MultiViews
		Options +ExecCGI -MultiViews 
		Order allow,deny
		Allow from all
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log

	# Possible values include: debug, info, notice, warn, error, crit,
	# alert, emerg.
	LogLevel warn

	CustomLog ${APACHE_LOG_DIR}/access.log combined

    Alias /doc/ "/usr/share/doc/"
    <Directory "/usr/share/doc/">
        Options Indexes MultiViews FollowSymLinks
        AllowOverride None
        Order deny,allow
        Deny from all
        Allow from 127.0.0.0/255.0.0.0 ::1/128
    </Directory>

</VirtualHost>



-->
	
</entry>
<entry [Thu 2011:03:31 09:26:46 EST] agua CONFIG>

1. INSTALL MYSQL

apt-get install mysql-server
mysql -u root -p < /home/syoung/0.6/bin/sql/createDb.sql
mysql -u root -p < /home/syoung/0.6/bin/sql/createAguaUser.sql
mysql -u root -p agua < /home/syoung/0.6/bin/sql/dump/agua-110230.dump

2. INSTALL APACHE
apt-get install apache2

3. REPLACE mpm-worker WITH mpm-prefork (Non-threaded) CGI DAEMON TO AVOID THIS:
    'unable to connect to cgi daemon'

apt-get remove apache2-mpm-prefork
apt-get install apache2-prefork-dev

4. SET SERVER ROOT IN /etc/apache2/apache2.conf

#ServerRoot "/etc/apache2"
ServerRoot "/etc/apache2"

5. LINK DIRECTORIES

ln -s /home/syoung/0.6/html /var/www/html/agua/0.6
ln -s /home/syoung/0.6/cgi-bin /var/www/cgi-bin/agua/0.6
ln -s /home/syoung/0.6/lib /var/www/cgi-bin/agua/0.6/lib
ln -s /home/syoung/0.6/conf /var/www/cgi-bin/agua/0.6/conf
ln -s /home/syoung/0.6/bin/sql /var/www/cgi-bin/agua/0.6/s  

3. SET PERMISSIONS

MAKE SURE THAT ALL THE LINKED DIRECTORIES ARE ACCESSIBLE TO www-data:
cd /home/syoung/0.6
find ./html -type d -exec chown syoung:www-data {} \;;
find ./html -type d -exec chmod 0775 {} \;;
find ./html -type f -exec chmod 0664 {} \;
find ./cgi-bin -type d -exec c
chown syoung:www-data {} \;;
find ./cgi-bin -type d -exec chmod 0775 {} \;;
find ./cgi-bin -type f -exec chmod 0664 {} \;
find ./cgi-bin -type f -name *cgi -exec chmod 0775 {} \;
find ./cgi-bin -type f -name *pl -exec chmod 0775 {} \;
find ./cgi-bin -type f -name agua -exec chmod 5775 {} \;

OPEN UP lib AND OTHER DIRS:
cd /home/syoung/0.6
find ./lib -type d -exec chmod 0775 {} \;;
find ./lib -type f -exec chmod 0644 {} \;

4. REPLACE apache2/sites-available/default (SEE NEW VERSION ABOVE) TO:
	SET HTML ROOT
	ENABLE CGI-BIN
	ALLOW FOLLOW SYMLINKS IN CGI-BIN (AVOID ERROR: 'method PUT not allowed')
		
5. SET UMASK AND SGE IN /etc/apache2/envvars

#### DEFAULT 775/664 FOR NEW FILES/DIRS
umask 0002 0002

#### GRID ENGINE ENV VARIABLES
export SGE_ROOT=/var/lib/gridengine
export SGE_QMASTER_PORT=701
export SGE_EXECD_PORT=702


6. RESTART APACHE:

/etc/init.d/apache2 restart




</entry>

<entry [Wed 2011:03:30 03:09:34 EST] BATCH INSTALL OF PERL MODULES WITH CPAN>

	SEE [Wed Nov 17 11:42:00 EST 2010] AUTOMATE CPAN INSTALLS
	FOR SETUP METHOD TO INSTALL AUTOMATICALLY

1. BACKUP ANY EXISTING MyConfig.pm FILE
cp ~/.cpan/CPAN/MyConfig.pm ~/.cpan/CPAN/MyConfig.pm.bkp

2. COPY MyConfig.pm FILE TO ~/.cpan/CPAN

3. FEED IN LIST OF MODULES FROM FILE

	SEE apps.unbuntu
	[Tue 2011:03:29 18:51:02 EST] INSTALL PERL MODULES


ALTERNATE METHOD
----------------

#!/usr/local/bin/perl
# Batch mode install of CPAN modules for SpamAssassin and Amavisd-new

use CPAN;

@modlist = qw( MD5 LWP Mail::Internet Archive::Tar Archive::Zip IO::Wrap IO::Stringy Unix::Syslog MIME::Words MIME::Head MIME::Body MIME::Entity MIME::Parser Net::SMTP Net::DNS Net::Ping Net::Server Net::Server::PreForkSimple Convert::TNEF Convert::UUlib MIME::Decoder::Base64 MIME::Decoder::Binary MIME::Decoder::Gzip64 MIME::Decoder::NBit MIME::Decoder::QuotedPrint MIME::Decoder::UU Time::HiRes Digest::SHA1 Digest::Nilsimsa Getopt::Long File::Copy Bit::Vector Date::Calc);

# install my favorite programs if necessary:
    for $mod (@modlist){
            my $obj = CPAN::Shell->expand('Module',$mod);
            $obj->install;
            printf "%s module version available is %s\n", $obj->id, $obj->cpan_version;
    }

##for $modu (CPAN::Shell->expand("Module","/./")){
##	next unless $modu->inst_file;
##	next if $modu->uptodate;
##	printf "Module %s is installed as %s, could be updated to %s from CPAN\n", $modu->id, $modu->inst_version, $modu->cpan_version;
##}

exit;

sub PrintArray {
	foreach my $i (@_) {
		print STDOUT "$i\n";
	}
}
	
</entry>

<entry [Wed 2011:03:30 01:26:49 EST] INSTALL 'ENVIRONMENT MODULES' MODULE>
	
SEE apps.envmod


	
</entry>


<entry [Wed Feb 16 01:02:55 EST 2011] CHANGING USERS' PASSWORDS - FIXED>
    

DON'T NEED TO IF USE passwd WITH stdin (NOT TERRIBLY SECURE):

http://www.computing.net/answers/linux/useradd-p-issue/13507.html

echo password | passwd --stdin $LOGIN_ID


ALSO TRIED:

INSTALL nslcd DAEMON FOR NSS AND PAM LOOKUPS USING LDAP TO ENABLE
CHANGING USER PASSWORDS USING THE WEB INTERFACE (I.E., AS ROOT) 
It is used by the libnss-ldapd and libpam-ldapd packages


E.G., IN Common.pm's saveUser SUBROUTINE:

    #### UPDATE PASSWORD ON SYSTEM IF IT HAS CHANGED
    #### USING chpasswd WITH A REDIRECT FROM A FILE PREVENTS THE 
    #### NEW PASSWORD FROM APPEARING MOMENTARILY IN THE PROCESS
    #### LIST (AS HAPPENS WITH usermod OR chpasswd USING PASSWORD
    #### AS ARGUMENT)
    my $tempdir = $self->get_conf()->{TEMPDIR};
    my $passfile = "$tempdir/" . rand(100000000);
    open(OUT, ">$passfile") or die "Can't open passfile: $passfile\n";
    my $username = $json->{data}->{username};
    my $password = $json->{data}->{password};
    print OUT "$username:$password";
    close(OUT) or die "Can't close passfile: $passfile\n";
    
    my $chpasswd = "chpasswd < $passfile";
    print "Common::saveUser   chpasswd: $chpasswd\n" if $DEBUG;
    print `$chpasswd`;


ON UBUNTU:

Synaptic Package Manager --> Quick search 'ldap' --> rightclick 'libpam-ldapd'

Accept installation of required dependencies --> Apply

To be installed: 
    libnss-ldapd
    libpam-ldapd
    nscd
    nslcd

SELECT ALL 'name services to configure' IN DEBCONF CONFIG:
(http://wikijc.blogspot.com/2009/09/instalacion-de-openldap.html)

    aliases - ethers - group - hosts - netgroup - networks -
    passwd - protocols - rpc - services - shadow 

AFTER INSTALLATION :

locate nslcd.conf
    /etc/nslcd.conf
    /usr/share/doc/nslcd/examples/nslcd.conf.gz
    /usr/share/man/man5/nslcd.conf.5.gz
    /var/lib/dpkg/info/nslcd.conffiles
    /var/lib/dpkg/info/nslcd.config
    

UNCOMMENTED rootpwmoddn ENTRY IN  nslcd.conf

    # The DN used for password modifications by root
    rootpwmoddn cn=admin,dc=example,dc=com


CONFIRMED nslcd DAEMON IS RUNNING :

ps aux | grep lcd

    nslcd    26909  0.0  0.0 149128   648 ?        Ssl  22:25   0:00 /usr/sbin/nslcd

CAN BE STARTED/RESTARTED AS A SERVICE

service nslcd

     * Usage: /etc/init.d/nslcd {start|stop|restart|force-reload|status}

BUT THEN UNINSTALLED BECAUSE IT DIDN'T ALLOW ME TO sudo su AS syoung


SO USED usermod INSTEAD:

usermod -p openup aaauser
    *no output*

su aaauser
aaauser@hplaptop:/root$ passwd
Changing password for aaauser.
(current) UNIX password: 
passwd: Authentication token manipulation error
passwd: password unchanged

we are own you
http://prolific-solutions.net/2010/11/02/add-a-user-with-root-privileges-non-interactively/

Pondering the Lifespan of Visible Passwords Against Brute Force Attack.
http://personal.stevens.edu/~khockenb/crypt3.html

crypt(3) uses the first 8 characters of a user's password as a key to encrypt a block of zeros using a modified DES encryption. The encryption is further permuted by the addition of a 12-bit random 'salt'.

Because the calculation that crypt(3) does is non-reversible, passwords can not be "decrypted". Instead, a key search is done; potential passwords are encrypted, and the result compared with the list of encrypted passwords. If a match is found, the password is known.

INSTALL (m)crypt:

apt-get install mcrypt

RUN CRYPT
Mcrypt  is  a  simple crypting program, a replacement for the old unix crypt(1).  When
encrypting or decrypting a file, a new file is created with the extension .nc and mode
0600. The new file keeps the modification date of the original.  The original file may
be deleted by specifying the -u parameter.  If no files are  specified,  the  standard
input is encrypted to the standard output.

emacs /tmp/passwd
    aaauser
    
crypt /tmp/passwd
    

</entry>


<entry [Wed Feb 16 01:02:54 EST 2011] SETTING APACHE UMASK>

1. ADD umask 0002 TO /etc/apache2/envvars

2. ADD umask 0002 TO /root/.bashrc ****** MUST DO THIS -- SEE BELOW ******


umask controls the default file creation permissions
0002 means files will have 664 and directories 775

Setting this (by editing the umask line at the bottom of /etc/profile in my case) means files created by one user will be writable by other users in the www-group without needing to chmod them.
 
 
http://serverfault.com/questions/6895/whats-the-best-way-of-handling-permissions-for-apache2s-user-www-data-in-var-w

On debian i had to modify /root/.bashrc umask also to 0002, or www-data won't have a proper umask by just editing umask in /etc/profile .

discriminate between files and folders:

find /var/www -type d -exec chmod 2775 {} \;

Change all the files to 0664

find /var/www -type f -exec chmod 0664 {} \;

Change the umask for your users to 0002

</entry>


<entry [Wed Feb 16 01:02:48 EST 2011] REINSTALLED ALL altitude-INSTALLED PACKAGES TO FIX gcc
>

WHY: gcc IS BROKEN ON UBUNTU


 February 1st, 2009


Re: broken g++/gcc after upgrade
Fixed -- looks like the package file was corrupted. Why can't this be detected automatically? Fixed by forcing synaptic to download the package again.

Code:
$ cd /var/cache/apt/archives
$ od -a libc6-dev_2.8~20080505-0ubuntu8_i386.deb.BROKEN > ~/tmp/brok
$ od -a libc6-dev_2.8~20080505-0ubuntu8_i386.deb > ~/tmp/ok
$ cd ~/tmp
$ diff ok brok | more
85717c85717
< 5166500 etb   u dc2   *   7   4  so   3   I   I  sp   3   ?  ff   t   f 
---
> 5166500 etb   5 dc2   *   7   4  so   3   I   I  sp   3   ?  ff   t   f
185941c185941
< 13262500 del   G   ~ del   5   x del   K   v   `   J   n   q nak   . nul
---
> 13262500 del bel   ~ del   5   x del   K   v   `   J   n   q nak   . nul




THE FOLLOWING FAILED (PROBABLY BECAUSE IT DIDN'T RE-DOWNLOAD THE PACKAGE)

cd /home/syoung/base/notes
dpkg --get-selections|awk '{print $1}' > package_list.txt

cat package_list.txt | xargs -n 1 sudo aptitude reinstall

INSTALL PART 3
cd /home/syoung/base/notes
cat hardware-hp-packages-part3.txt | xargs -n 1 sudo aptitude reinstall


    FAILED BEFORE COMPLETION:
    
    ...
    Unpacking replacement gnome-codec-install ...
    Processing triggers for hicolor-icon-theme ...
    Setting up gnome-codec-install (0.4.7ubuntu2) ...
    Processing triggers for python-central ...
                                             
    The following packages will be REINSTALLED:
      gnome-connection-manager 
    0 packages upgraded, 0 newly installed, 1 reinstalled, 0 to remove and 0 not upgraded.
    Need to get 0B of archives. After unpacking 0B will be used.
    E: I wasn't able to locate file for the gnome-connection-manager package. This might mean you need to manually fix this package.
    E: I wasn't able to locate file for the gnome-connection-manager package. This might mean you need to manually fix this package.
    E: Internal error: couldn't generate list of packages to download
    xargs: sudo: exited with status 255; aborting




</entry>

<entry [Wed Feb 16 01:02:47 EST 2011] USE 2770 FOR AUTOMATIC GROUP ASSIGNMENT OF NEW FILES>


http://forums.opensuse.org/english/get-technical-help-here/applications/424228-how-change-default-group-assignment-new-files.html
Re: How to change default group assignment to new files
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

By default a file/directory is group-owned by the primary group of the
user that created it. For example, your user's primary group is
apparently 'users'. There are a couple ways to change this. First, you
can change your primary group to something else. Second, you can create
the files/directories in a directory that has the SGID bit set which means
all files/directories within there will be group-owned by the same group
as the group-owner of the parent directory. This is useful if you have
another group that everybody is a member of and you want to share files by
making all files in that directory modifiable by those group members. For
example:

groupadd somenewgroup
mkdir /tmp/testsgid
chgrp somenewgroup /tmp/testsgid
chmod 2770 /tmp/testsgid
groupmod -A youruser somenewgroup
groupmod -A someotheruser somenewgroup
login/login with your user to apply changes+

Now all files created in /tmp/testsgid will be group-owned by
'somenewgroup' which means anybody in that group (per the directory's
permissions) can do anything they want with those files regardless of who
else created/modified the files.

What would be really helpful if you told us WHY you wanted to do what you
were asking.

Good luck.




</entry>

<entry [Sat Dec 22 23:55:31 EST 2010] CREATED 'INSTALL' FILE IN BASE '0.5' FOLDER>


CONTAINS THE FOLLOWING SECTIONS:

1. INSTALL PERL MODULES

2. INSTALL AGUA

3. INSTALL AGUA ON WINDOWS

4. TROUBLESHOOTING


</entry>

<entry [Sun Dec  5 21:29:00 EST 2010] SET KEYPAIR ENVIRONMENT SCRIPTS - keys.sh>

cd /root/base/apps/ec2/keypair
cat ychung/keys.sh 

	export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/ychung/pk-NM4PJIJUL2MENBRRP5JBQUNGEZG7G3HR.pem
	export EC2_CERT=/root/base/apps/ec2/keypair/ychung/cert-NM4PJIJUL2MENBRRP5JBQUNGEZG7G3HR.pem
	
	
cat syoung/keys.sh 

	export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
	export EC2_CERT=/root/base/apps/ec2/keypair/cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem

cat jgilbert/keys.sh 

	export EC2_PRIVATE_KEY=/root/base/apps/ec2/keypair/jgilbert/pk-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem
	export EC2_CERT=/root/base/apps/ec2/keypair/jgilbert/cert-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem[
	

DESCRIBE INSTANCES OF 3 DIFFERENT USERS:

keyjg

echo EC2_CERT
	EC2_CERT

echo $EC2_CERT
	/root/base/apps/ec2/keypair/jgilbert/cert-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem

echo $EC2_PRIVATE_KEY
	/root/base/apps/ec2/keypair/jgilbert/pk-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem
	
ec2-describe-instances                                            


keysy

ec2-describe-instances
	RESERVATION     r-cbef69a1      728213020069    default
	INSTANCE        i-84791ee9      ami-de2ed9b7                    stopped agua    0           t1.micro 2010-11-17T16:33:30+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da        monitoring-disabled                                      ebs                                 paravirtual
	BLOCKDEVICE     /dev/sda1       vol-2d789145    2010-11-16T01:15:45.000Z
	TAG     instance        i-84791ee9      Name    aquarius-2
	RESERVATION     r-2d69e747      728213020069    default
	INSTANCE        i-28056e45      ami-6a788f03                    stopped agua    0           m1.large 2010-11-19T15:19:38+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da        monitoring-disabled                                      ebs                                 paravirtual
	BLOCKDEVICE     /dev/sda1       vol-0bd02463    2010-11-19T15:19:42.000Z
	TAG     instance        i-28056e45      Name    aquarius-3


keyyc

ec2-describe-instances
	RESERVATION     r-cbef69a1      728213020069    default
	INSTANCE        i-84791ee9      ami-de2ed9b7                    stopped agua    0           t1.micro 2010-11-17T16:33:30+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da        monitoring-disabled                                      ebs                                 paravirtual
	BLOCKDEVICE     /dev/sda1       vol-2d789145    2010-11-16T01:15:45.000Z
	TAG     instance        i-84791ee9      Name    aquarius-2
	RESERVATION     r-2d69e747      728213020069    default
	INSTANCE        i-28056e45      ami-6a788f03                    stopped agua    0           m1.large 2010-11-19T15:19:38+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da        monitoring-disabled                                      ebs                                 paravirtual
	BLOCKDEVICE     /dev/sda1       vol-0bd02463    2010-11-19T15:19:42.000Z
	TAG     instance        i-28056e45      Name    aquarius-3



</entry>

<entry [Tue Nov 30 14:39:31 EST 2010] MIAME MODULE TO ADMIN>


MIAME 2.0 FORMAT
http://www.mged.org/Workgroups/MIAME/miame_2.0.html

Minimum Information About a Microarray Experiment - MIAME 2.0
The six following elements must be provided to support microarray based publications.

The raw data for each hybridisation.
The raw data are defined as data files produced by the microarray image analysis software, such as CEL files for Affymetrix or GPR files for GenePix. These files should be provided in the native formats and should match their respective array designs.

The final processed data for the set of hybridisations in the experiment (study)
The processed data is defined as the normalised and/or summarized data on which the conclusions in the related publication are based. For instance, these can be MAS5 or RMA normalised data matrices for Affymetrix data. In gene expression experiments the final processed data is typically a matrix of genes and experimental conditions characterizing the expression of each gene under each condition. The identifiers used in these processed data files should match the array annotation or locations on the arrays.

The essential sample annotation, including experimental factors and their values
Experimental factors (conditions) and their values are the most essential information about the samples used in the experiment. The experimental factors are the key experimental variables in the experiment, for instance "time" in time series experiments, "dose" in dose response experiments, "compound" in compound treatment experiments, or "disease state" (normal or otherwise) in disease studies. The same experiment may have several experimental factors, for example, compound, dose and time may all be experimental factors in a dose response experiment in which several compounds are used to treat samples over a time course. In addition to experimental factor values, additional sample information that is required to interpret the experiment must be given, for instance, the organism and organism part from which the sample has been taken.

The experiment design including sample data relationships
The purpose of the experimental design description is simply to specify the essential relationships between different biomaterials, such as samples and arrays, and the data files which are produced in each hybridisation. In a simple one channel one sample - one array experiment, this may be a table listing all samples and the respective raw data files. If relevant, it is important to show which hybridisations in the experiment are replicates, and which are technical and which are biological replicates. More generally, the experimental design can be described as a graph where nodes represent biomaterials (e.g., samples or their sources) and data objects (e.g., files), and edges or arrows show their relationships. MAGE-TAB provides a simple format to encode such graphs.

Sufficient annotation of the array design
Essential array design information is the reporter (probe) sequence information and/or the database accession numbers that characterise a sequence. For synthetic oligonucleotides the precise DNA sequence must be given. For commercial or other standard array platforms this information is typically provided by the array vendors or manufacturers.

Essential experimental and data processing protocols
The essential laboratory and data processing protocols are usually described in the journal methods section. It is sufficient to simply reference the standard experimental or data processing protocols, such as MAS5 or RMA. However, if a protocol depends on parameters that can be varied, their values should be provided. If novel or non-standard data processing protocols are used, these should be described in sufficient detail to allow the user to understand what exactly has been done in the experiment and how the data have been analysed to reach the conclusions of the study.




MIAMI WORKGROUPS
http://www.mged.org/Workgroups/MIAME/miame.html


Physiol. Genomics 13: 1-2, 2003; doi:10.1152/physiolgenomics.00019.2003 
Editorial
Our new requirement for MIAME standards
http://physiolgenomics.physiology.org/cgi/content/full/13/1/1


WRITE IN MAGE-TAB FORMAT
http://www.mged.org/mage-tab/

Rayner, 2006.	A simple spreadsheet-based, MIAME-supportive format for microarray data: MAGE-TAB
http://www.ncbi.nlm.nih.gov/pmc/articles/PMC1687205/

The MAGE-TAB specification defines four different types of files to fully describe a microarray investigation:

1. Investigation Description Format (IDF)  a tab-delimited file providing general information about the investigation, including its name, a brief description, the investigator's contact details, bibliographic references, and free text descriptions of the protocols used in the investigation.

2. Array Design Format (ADF)  a tab-delimited file defining each array type used. An ADF file describes the design of an array, e.g., what sequence is located at each position on an array and what the annotation of this sequence is. If the investigation uses arrays for which a description has been previously provided, cross-references to entries in a public repository (e.g., an ArrayExpress accession number [3]) can be included instead of explicit array descriptions.

3. Sample and Data Relationship Format (SDRF)  a tab-delimited file (or files) describing the relationships between samples, arrays, data, and other objects used or produced in the investigation, and providing all MIAME information that is not provided elsewhere. This is often the least trivial part of the experiment description due to the complex relationships which are possible between samples and their respective hybridizations; however, for simple experimental designs, constructing the SDRF file is straightforward, and even complex loop designs can be expressed in this format.

4. Raw and processed data files  ASCII or binary files, typically in their native formats; alternatively, data may also be provided in a specially defined tab-delimited format termed a "data matrix", described below.


Table 1
A spreadsheet representation of the investigation design graph shown in Figure 1.

Sample ID	Characteristics [Organism]	Characteristics [OrganismPart]	Protocol REF	Hybridization ID	ArrayDesign REF	ArrayData URI	Protocol REF	DerivedArrayData Matrix URI
liver 1	Homo sapiens	liver	P-XMPL-1	hyb 1	HG_U95A	Data1.cel	P-XMPL-2	FGDM.txt
kidney 1	Homo sapiens	kidney	P-XMPL-1	hyb 2	HG_U95A	Data2.cel	P-XMPL-2	FGDM.txt
brain 1	Homo sapiens	brain	P-XMPL-1	hyb 3	HG_U95A	Data3.cel	P-XMPL-2	FGDM.txt

Each initial sample has a Sample ID (the first column in the spreadsheet) and Characteristics  Organism (genus and species) and OrganismPart (the second and third columns). The terms used to annotate the characteristics can be obtained from the MGED Ontology [26], another suitable source of controlled vocabulary terms, or provided as user defined terms. The fourth column gives a reference to a relevant protocol, while the fifth gives the IDs of the three hybridizations performed. The reference to the array design type (HG_U95A) is given as a hybridization property, which is followed by the data file names, a reference to the data normalization protocol and the normalized data file.



++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ADDED starcluster.pl AND Admin::StarCluster TO MANAGE CLUSTER INSTANCES AND VOLUMES



starcluster

    StarCluster - (http://web.mit.edu/starcluster)
    Software Tools for Academics and Researchers (STAR)
    Please submit bug reports to starcluster@mit.edu
    
    Usage: starcluster [global-opts] action [action-opts] [<action-args> ...]
    
    Available Actions
    - start: Start a new cluster
    - stop: Shutdown a running cluster
    - listclusters: List all active clusters
    - sshmaster: SSH to a cluster's master node
    - sshnode: SSH to a cluster node
    - sshinstance: SSH to an EC2 instance
    - listinstances: List all running EC2 instances
    - listimages: List all registered EC2 images (AMIs)
    - listpublic: List all public StarCluster images on EC2
    - createimage: Create a new image (AMI) from a currently running EC2 instance
    - removeimage: Deregister an EC2 image (AMI) and remove it from S3
    - listvolumes: List all EBS volumes
    - createvolume: Create a new EBS volume for use with StarCluster
    - removevolume: Delete one or more EBS volumes
    - listspots: List all EC2 spot instance requests
    - spothistory: Show spot instance pricing history stats (last 30 days by default)
    - showconsole: Show console output for an EC2 instance
    - listzones: List all EC2 availability zones
    - listbuckets: List all S3 buckets
    - showbucket: Show all files in an S3 bucket
    - showimage: Show all AMI parts and manifest files on S3 for an EC2 image (AMI)
    - shell: Load interactive IPython shell for starcluster development
    - help: Show StarCluster usage
    


BACKUP CONFIG FILE:

cp  /root/.starcluster/config  /root/.starcluster/config.bkp


VIEW CONFIG FILE:

cat /root/.starcluster/config


####################################
## StarCluster Configuration File ##
####################################

[global]
# configure the default cluster template to use when starting a cluster
# defaults to 'smallcluster' defined below. this template should be usable
# out-of-the-box provided you've configured your keypair correctly
DEFAULT_TEMPLATE=smallcluster
# enable experimental features for this release
ENABLE_EXPERIMENTAL=False

[aws info]
# This is the AWS credentials section.
# These settings apply to all clusters
# replace these with your AWS keys
AWS_ACCESS_KEY_ID = #your_aws_access_key_id
AWS_SECRET_ACCESS_KEY = #your_secret_access_key
# replace this with your account number
AWS_USER_ID= #your userid

# Sections starting with "key" define your keypairs
# (see the EC2 getting started guide tutorial on using ec2-add-keypair to learn
# how to create new keypairs)
# Section name should match your key name e.g.:
[key gsg-keypair]
KEY_LOCATION=/home/myuser/.ssh/id_rsa-gsg-keypair

# You can of course have multiple keypair sections
# [key my-other-gsg-keypair]
# KEY_LOCATION=/home/myuser/.ssh/id_rsa-my-other-gsg-keypair

# Sections starting with "cluster" define your cluster templates
# Section name is the name you give to your cluster template e.g.:
[cluster smallcluster]
# change this to the name of one of the keypair sections defined above 
KEYNAME = gsg-keypair

# number of ec2 instances to launch
CLUSTER_SIZE = 2

# create the following user on the cluster
CLUSTER_USER = sgeadmin

# optionally specify shell (defaults to bash)
# (options: tcsh, zsh, csh, bash, ksh)
CLUSTER_SHELL = bash

# AMI for cluster nodes.
# The base i386 StarCluster AMI is ami-d1c42db8
# The base x86_64 StarCluster AMI is ami-a5c42dcc
NODE_IMAGE_ID = ami-d1c42db8
# instance type for all cluster nodes 
# (options: m1.large, c1.xlarge, m1.small, c1.medium, m1.xlarge, m2.4xlarge, m2.2xlarge)
NODE_INSTANCE_TYPE = m1.small

# Uncomment to specify a different instance type for the master node  (OPTIONAL)
# (defaults to NODE_INSTANCE_TYPE if not specified)
#MASTER_INSTANCE_TYPE = m1.small

# Uncomment to specify a separate AMI to use for the master node. (OPTIONAL)
# (defaults to NODE_IMAGE_ID if not specified)
#MASTER_IMAGE_ID = ami-d1c42db8 (OPTIONAL)

# availability zone to launch the cluster in (OPTIONAL)
# (automatically determined based on volumes (if any) or 
# selected by Amazon if not specified)
#AVAILABILITY_ZONE = us-east-1c

# list of volumes to attach to the master node and nfs share to worker nodes (OPTIONAL)
# (see "Configuring EBS Volumes" below for an example of defining volume sections)
#VOLUMES = oceandata, biodata

# list of plugins to load after StarCluster's default setup routines (OPTIONAL)
# (see "Configuring StarCluster Plugins" below for an example of defining a plugin section)
#PLUGINS = myplugin, myplugin2

###########################################
## Defining Additional Cluster Templates ##
###########################################

# You can also define multiple cluster templates.
# You can either supply all configuration options as with smallcluster above, or
# create an EXTENDS=<cluster_name> variable in the new cluster section to use all 
# settings from <cluster_name> as defaults. Below are a couple of example
# cluster templates that use the EXTENDS feature:

# [cluster mediumcluster]
# Declares that this cluster uses smallcluster as defaults
# EXTENDS=smallcluster
# This section is the same as smallcluster except for the following settings:
# KEYNAME=my-other-gsg-keypair
# NODE_INSTANCE_TYPE = c1.xlarge
# CLUSTER_SIZE=8
# VOLUMES = biodata2

# [cluster largecluster]
# Declares that this cluster uses mediumcluster as defaults
# EXTENDS=mediumcluster
# This section is the same as mediumcluster except for the following variables:
# CLUSTER_SIZE=16

#############################
## Configuring EBS Volumes ##
#############################

# Using EBS volumes with StarCluster is relatively straight forward. You create
# a [volume] section that represents an EBS volume. The section name is a tag
# for your volume. This tag is used in the VOLUMES setting in a cluster template 
# to declare that an EBS volume is to be mounted and nfs shared on the cluster.
# (see the commented VOLUMES setting in the 'smallcluster' template above)
# Below are some examples of defining and configuring EBS volumes to be used
# with StarCluster:

# Sections starting with "volume" define your EBS volumes
# Section name tags your volume e.g.:
# [volume biodata]
# (attach 1st partition of volume vol-c9999999 to /home on master node)
# VOLUME_ID = vol-c999999
# MOUNT_PATH = /home

# Same volume as above, but mounts to different location
# [volume biodata2]
# (attach 1st partition of volume vol-c9999999 to /opt/ on master node)
# VOLUME_ID = vol-c999999
# MOUNT_PATH = /opt/

# Another volume example 
# [volume oceandata]
# (attach 1st partition of volume vol-d7777777 to /mydata on master node)
# VOLUME_ID = vol-d7777777
# MOUNT_PATH = /mydata

# Same as oceandata only uses the 2nd partition instead
# [volume oceandata]
# (attach 2nd partition of volume vol-d7777777 to /mydata on master node)
# VOLUME_ID = vol-d7777777
# MOUNT_PATH = /mydata
# PARTITION = 2

#####################################
## Configuring StarCluster Plugins ##
#####################################

# Sections starting with "plugin" define a custom python class
# which can perform additional configurations to StarCluster's default routines. These plugins 
# can be assigned to a cluster template to customize the setup procedure when
# starting a cluster from this template
# (see the commented PLUGINS setting in the 'smallcluster' template above) 
# Below is an example of defining a plugin called 'myplugin':

# [plugin myplugin]
# myplugin module either lives in ~/.starcluster/plugins or is 
# in your PYTHONPATH
# SETUP_CLASS = myplugin.SetupClass
# extra settings are passed as arguments to your plugin:
# SOME_PARAM_FOR_MY_PLUGIN = 1
# SOME_OTHER_PARAM = 2





</entry>

<entry [Wed Nov 17 19:45:39 EST 2010] ADDED aws.pl AND Admin::AWS TO MANAGE ACCESS KEYS, INSTANCES AND VOLUMES ON AMI>


echo {"username":"syoung","sessionId":"1228791394.7868.158","mode":"saveAws","data":{"username":"syoung","volumesize":100,"amazonuserid":"7777888","ec2publiccert":"publiccert","ec2privatekey":"privatekey","awsaccesskeyid":"accesskeyid","secretaccesskey":"secreteaccess"}} | perl aws.pl




</entry>

<entry [Wed Nov 17 19:44:39 EST 2010] INSTALL AGUA PERL MODULES ON NEW PERL 5.12.2>


CHECK REQUIREMENTS
------------------
use DBI
use DBD
use DBD::mysql


INSTALL XML::Simple
-------------------

1. INSTALL EXPAT

cd /root/base/apps/perl
wget http://downloads.sourceforge.net/expat/expat-2.0.1.tar.gz

	OK

2. INSTALL XML::Simple USING CPAN

	OK


perl -MCPAN -e shell
install XML::Simple


3. INSTALL OTHER DEPENDENCIES
ops
install Config::JSON
install JSON
install File::Remove
install File::Copy::Recursive
install Net::LDAP
install File::Sort
install DBI
install DBD::SQLite
install Term::ReadKey

#### Net::Amazon::EC2 DEPENDENCIES
install Digest::HMAC_SHA1
install Params::Validate


4. INSTALL DBD::mysql

CHECK MYSQL VERSION

mysql -V
	mysql  Ver 14.12 Distrib 5.0.77, for redhat-linux-gnu (x86_64) using readline 5.1

INSTALL mysql-devel TO AVOID ERROR 'mysql.h: No such file or directory':
(mysql.h is included in the mysql-devel package which is not installed by default.)

yum install mysql-devel

	OK
	
INSTALL DBD::mysql

cd /root/base/apps/perl
wget http://search.cpan.org/CPAN/authors/id/C/CA/CAPTTOFU/DBD-mysql-4.018.tar.gz
...
make install

	OK


NOTES
-----

XML::SAX INSTALLED OKAY BUT THE ParserDetails.ini FILE WAS NOT ACCESSIBLE

./initAws.pl

	...
	[Thu Nov 18 00:42:32 2010] initAws.pl: could not find ParserDetails.ini in /usr/local/lib/perl5/site_perl/5.12.2/XML/SAX
	[Thu Nov 18 00:42:33 2010] initAws.pl: $VAR1 = {
	[Thu Nov 18 00:42:33 2010] initAws.pl:           'volumeId' => 'vol-032fc56b',
	[Thu Nov 18 00:42:33 2010] initAws.pl:           'xmlns' => 'http://ec2.amazonaws.com/doc/2009-11-30/',
	[Thu Nov 18 00:42:33 2010] initAws.pl:           'requestId' => '25dbf4d6-6009-400c-ac2d-70f161cb1e13',

CHECKED THE INSTALLATION TO SEE WHAT GIVES:

drwxr-xr-x 4 root root 4.0K Nov 17 19:33 ..
-r--r--r-- 1 root root 120K Nov 17 18:25 Base.pm
-r--r--r-- 1 root root 2.9K Oct 14  2005 DocumentLocator.pm
-r--r--r-- 1 root root 3.0K Nov 17 18:25 Exception.pm
-r-xr-xr-x 1 root root  20K Jun 30  2008 Expat.pm
-r--r--r-- 1 root root  15K Aug  4  2008 Intro.pod
-rw-r--r-- 1 root root  181 Nov 18 00:46 ParserDetails.ini
-r--r--r-- 1 root root 6.5K Aug  4  2008 ParserFactory.pm
drwxr-xr-x 3 root root 4.0K Nov 17 18:25 PurePerl
-r--r--r-- 1 root root  21K Aug  5  200U8 PurePerl.pm
-r--r--r-- 1 root root   12 Nov 19  2001 placeholder.pl

CHANGED PERMISSIONS ON ParserDetails.ini TO 755:

chmod 755 /usr/local/lib/perl5/site_perl/5.12.2/XML/SAX/ParserDetails.ini 


RERAN AND IT WORKED!

	OK




</entry>

<entry [Wed Nov 17 18:16:50 EST 2010] INSTALLED MOOSE USING CPAN>


1. INSTALLED PERL 5.12.2

INSTALLED FROM DOWNLOADED SOURCE

cd /agua/base/apps/perl

	OK
	

2. INSTALLED MOOSE WITH CPAN ON COMMAND LINE

PERL_MM_USE_DEFAULT=1 perl -MCPAN -e 'install Moose' &> moose-install3.txt

	OK

CHECKED WAS INSTALLED IN INTERACTIVE SHELL:

	cpan[1]> install Moose
	Going to read '/root/.cpan/Metadata'
	  Database was generated on Wed, 17 Nov 2010 07:31:59 GMT
	Moose is up to date (1.19).
	
	
</entry>

<entry [Wed Nov 10 18:16:50 EST 2010] COPIED EDITOR IMAGES FROM 1.4.2 TO 1.5.0>



dijit/icons/images/editorIconsEnabled.png


ADDED TO THE END OF:
dojo.1.5.0/dijit/icons/editorIcons.css

THIS TEXT:
.dijitEditorIconView { background-position: -828px; }
.dijitEditorIconWorkflow { background-position: -846px; }
.dijitEditorIconProject { background-position: -864px; }
.dijitEditorIconReport { background-position: -882px; }
.dijitEditorIconAdmin { background-position: -900px; }
.dijitEditorIconHelp { background-position: -918px; }
.dijitEditorIconAgua { background-position: -936px; }



ORIGINALLY FIXED HERE:


	Fri Jul  23 14:16:02 EDT 2010
	CHANGES TO workflow CLASSES

	workflow.js.uncompressed.js

	13686
	//			this._showAnim.play();

	dojo.1.4.2/dijit/themes/tundra/tundra.css
	
	.dijitEditorIconView { background-position: -828px; }
	.dijitEditorIconWorkflow { background-position: -846px; }
	.dijitEditorIconProject { background-position: -864px; }
	.dijitEditorIconReport { background-position: -882px; }
	.dijitEditorIconAdmin { background-position: -900px; }
	.dijitEditorIconHelp { background-position: -918px; }
	.dijitEditorIconAgua { background-position: -936px; }


AND HERE:


	Sun May 22 20:00:42 EDT 2010
	FIXED ICON CLASS ISSUE BY ADDING NEW ICONS TO dijit/icons/images/editorIconsEnabled.png
	
	
	LINE 1543 ADDED '!important':
	
	.dijitEditorIcon {
		background-image: url(../../icons/images/editorIconsEnabled.png) !important; 
		background-repeat: no-repeat;
	
	LINE 1598 ADDED NEW ICONS:
	
	.dijitEditorIconView { background-position: -828px; }
	.dijitEditorIconWorkflow { background-position: -846px; }
	.dijitEditorIconProject { background-position: -864px; }
	.dijitEditorIconReport { background-position: -882px; }
	.dijitEditorIconAdmin { background-position: -900px; }
	.dijitEditorIconHelp { background-position: -918px; }
	.dijitEditorIconAgua { background-position: -936px; }





</entry>

<entry [Wed Oct 27 00:24:02 EDT 2010] RAN AGUA CONFIG TO INSTALL TO /agua ON starcluster-7>


1. RAN CONFIG

cd /data/agua/0.5/bin/scripts
./config.pl 

	OK
	

2. SET PERMISSIONS IN cgi-bin



3. CHECKED AGUA

ec2-184-72-155-55.compute-1.amazonaws.com

	OK
	

4. COPIED JBROWSE chr1 DATA FROM NGSDEV TO SC7

COPY agua.pem TEMPORARILY TO 


scp -i /data/jbrowse/data/tracks/agua.pem \
-r chr1.tar.gz \
root@ec2-184-72-155-55.compute-1.amazonaws.com:/data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/data/tracks


5. EDITED httpd.conf


emacs /etc/httpd/conf/httpd.conf

	...
	#
	# "/var/www/cgi-bin" should be changed to whatever your ScriptAliased
	# CGI directory exists, if you have that configured.
	#
	< Directory "/var/www/cgi-bin">
	
		AllowOverride None

		#### ADDED THIS AND COMMENTED BELOW LINES	
		Options ExecCGI -MultiViews +FollowSymLinks
	
		#### Options None
	
		#### Order allow,deny
	
		Allow from all
	
	< /Directory>
	...

6. RESTARTED HTTPD

/etc/init.d/httpd restart

	Stopping httpd: [  OK  ]
	Starting httpd: [  OK  ]


7. SET UID ON *.cgi FILES

	alias sy='sudo chown syoung'
	alias rt='sudo chown root:root ~; sudo chmod 6755 ~'
	alias set='sudo chmod 6755 ~'
	alias unset='sudo chmod 0755 ~'


cd /var/www/cgi-bin/agua/0.5
set *cgi
ll *cgi

	-rwsr-sr-x 1 root root 6.5K Oct 27 02:04 admin.cgi
	-rwsr-sr-x 1 root root 4.0K Oct 27 02:04 download.cgi
	-rwsr-sr-x 1 root root 4.5K Oct 27 02:04 file.cgi
	-rwsr-sr-x 1 root root  12K Oct 27 02:04 galaxyDownload.cgi
	-rwsr-sr-x 1 root root  561 Oct 27 02:04 ldap.cgi
	-rwsr-sr-x 1 root root 4.6K Oct 27 02:04 project.cgi
	-rwsr-sr-x 1 root root 5.3K Oct 27 02:04 report.cgi
	-rwsr-sr-x 1 root root 8.0K Oct 27 02:04 upload.cgi
	-rwsr-sr-x 1 root root 5.3K Oct 27 02:04 view.cgi
	-rwsr-sr-x 1 root root 5.6K Oct 27 02:04 workflow.cgi


8. TEST AS USER APACHE

FIX 'This account is currently not available' ERROR WHEN DOING su - apache

emacs /etc/passwd

So, I assume that you mean that you're running CF as the user apache, which is presumably the user account for the Apache websever. You're better off running CF as some other non-privileged user account that is not 'apache', and then creating a group having both apache and coldfusion user in it, then make the webroot owned by that group recursively.

*** The su error message  means that the apache account is configured to not allow logins, which is typical for non-privileged accounts used to run daemons.
The shell is set to /bin/nologin instead of /bin/bash or /bin/sh. 

You could momentarily change the user's shell to allow logins, then su (don't forget the '-' in 'su -' to get the users environment too) and then finally test running the executable. When you are able to execute the script in this manner then so will the ColdFusion server. And after your test don't forget to change the shell back to /bin/nologin.


sudo su
emacs /etc/passwd

CHANGE FROM /bin/nologin TO /bin/bash


9. ALLOW APACHE TO RUN SETUID FILES

FIX THIS PROBLEM:

as apache: ./workflow.cgi

	Can't do setuid (cannot exec sperl)


Running a Perl script with the setuid bit actually runs 'sperl', a slightly modified version of Perl that it is a bit more cautious.

On a CentOS box, you need to install the 'perl-suidperl' package to get the necessary files installed:


yum install perl-suidperl

	Installed:
	  perl-suidperl.x86_64 4:5.8.8-32.el5_5.2                                                                                                                
	
	Dependency Updated:
	  perl.x86_64 4:5.8.8-32.el5_5.2                                                                                                                         


10. INSTALL PERL MODULES

File::Remove
File::Copy::Recursive
Net::LDAP
File::Sort
DBI
DBD::SQLite
Config::JSON
Term::ReadKey


ON linux AS root:

NB: FIRST SHUT DOWN HTTPD AND MYSQL TO AVOID THIS ERROR:
Cannot allocate memory at /usr/lib/perl5/5.8.8/CPAN.pm line 5726.

/etc/init.d/mysqld stop
/etc/init.d/httpd stop

	OK


#### install Config::JSON
install File::Remove
install File::Copy::Recursive
install Net::LDAP
install File::Sort
force install DBI (version 1.61)
install Term::ReadKey
#### DBD::SQLite

install ExtUtils::MakeMaker


CAN'T INSTALL DBD::SQLite BY CPAN SO DID IT MANUALLY
----------------------------------------------------

INSTALL xz TO HANDLE *.xz FILES

tar 1.22 adds support for xz via --xz or -J BUT:

tar --version

	tar (GNU tar) 1.15.1


yum install xz 



install DBD::SQLite
--------------------

mkdir -p /root/software/perlmods/DBD-SQLite
cd /root/software/perlmods/DBD-SQLite
wget http://www.archlinux.org/packages/extra/x86_64/perl-dbd-sqlite/download/

	-rw-r--r-- 1 root root 780K Aug  2 13:15 perl-dbd-sqlite-1.29-2-x86_64.pkg.tar.gz

unxz perl-dbd-sqlite-1.29-2-x86_64.pkg.tar.xz 

	-rw-r--r-- 1 root root 780K Aug  2 13:15 perl-dbd-sqlite-1.29-2-x86_64.pkg.tar


tar xvf perl-dbd-sqlite-1.29-2-x86_64.pkg.tar 

	.PKGINFO
	usr/
	usr/lib/
	usr/share/
	usr/share/man/
	usr/share/man/man3/
	usr/share/man/man3/DBD::SQLite::Cookbook.3pm.gz
	usr/share/man/man3/DBD::SQLite.3pm.gz
	usr/lib/perl5/
	usr/lib/perl5/vendor_perl/
	usr/lib/perl5/vendor_perl/DBD/
	usr/lib/perl5/vendor_perl/auto/
	usr/lib/perl5/vendor_perl/auto/DBD/
	usr/lib/perl5/vendor_perl/auto/DBD/SQLite/
	usr/lib/perl5/vendor_perl/auto/DBD/SQLite/SQLite.so
	usr/lib/perl5/vendor_perl/auto/DBD/SQLite/SQLite.bs
	usr/lib/perl5/vendor_perl/DBD/SQLite.pm


STOPPED HERE:



COPY TO

/usr/lib/perl5/5.8.8
/usr/lib/perl5/5.8.8/auto


COPY DIRS:

cp -r usr/lib/perl5/vendor_perl/DBD /usr/lib/perl5/5.8.8/
cp -r usr/lib/perl5/vendor_perl/auto/* /usr/lib/perl5/5.8.8/auto


perl: symbol lookup error: /usr/lib/perl5/5.8.8/auto/DBD/SQLite/SQLite.so: undefined symbol: Perl_Istack_sp_ptr


INSTALL DBI 
-----------

CHECK VERSIONS ON NGSDEV

perl -MDBI -e 'print $DBI::VERSION';

	1.609

perl -MDBD::SQLite -e 'print $DBD::SQLite::VERSION';

	1.27
	
	
VERSION ON STARCLUSTER-7

perl -MDBI -e 'print $DBI::VERSION';

	1.615

perl -MDBD::SQLite -e 'print $DBD::SQLite::VERSION';

	perl: symbol lookup error: /usr/lib/perl5/5.8.8/auto/DBD/SQLite/SQLite.so: undefined symbol: Perl_Istack_sp_ptr



perl -e 'use DBD::SQLite';

	DBI version 1.57 required--this is only version 1.52 at /usr/lib/perl5/vendor_perl/DBD/SQLite.pm line 5.


mkdir -p /root/software/perlmods/DBI
cd /root/software/perlmods/DBI
wget http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-1.615.tar.gz
# tar, etc...

INSTALLS TO THREE LOCATIONS:

/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI*
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI*
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/dbixs_rev.pl
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Win32/DBIODBC.pm


	Files found in blib/arch: installing files in blib/lib into architecture dependent library tree

make install
	
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/DBI.so
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/dbixs_rev.h
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/dbi_sql.h
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/Driver.xst
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/dbivport.h
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/dbd_xsh.h
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/DBI.bs
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/DBIXS.h
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/Driver_xst.h
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/dbipport.h

	Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/dbixs_rev.pl
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Win32/DBIODBC.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/PurePerl.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/ProxyServer.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/ProfileSubs.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Profile.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/FAQ.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/ProfileDumper.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/W32ODBC.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/ProfileData.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Changes.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/SQL/Nano.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Const/GetInfoReturn.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Const/GetInfoType.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Const/GetInfo/ANSI.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Const/GetInfo/ODBC.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD/SqlEngine.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD/Metadata.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD/SqlEngine/HowTo.pod
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD/SqlEngine/Developers.pod
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Execute.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Response.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Request.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Transport/pipeone.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Transport/stream.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Transport/Base.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Serializer/DataDumper.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Serializer/Storable.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Serializer/Base.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/ProfileDumper/Apache.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Util/CacheMemory.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Util/_accessor.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/ExampleP.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/File.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Proxy.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Sponge.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/NullP.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/DBM.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/File/Roadmap.pod
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/File/HowTo.pod
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/File/Developers.pod
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport/pipeone.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport/stream.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport/Base.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport/null.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Policy/rush.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Policy/classic.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Policy/Base.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Policy/pedantic.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bundle/DBI.pm

	Installing /usr/bin/dbiprof
	Installing /usr/bin/dbiproxy
	Installing /usr/bin/dbilogstrip

	Writing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/.packlist
	Appending installation info to /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod


CONFIRM DBI VERSION ON NGSDEV:

emacs /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod

<!--	=head2 Wed Dec  2 15:21:59 2009: C<Module> L<DBI|DBI>
	=over 4
	=item *
	C<installed into: /usr/lib/perl5/site_perl/5.8.8>
	=item *
	C<LINKTYPE: dynamic>
	=item *
	C<VERSION: 1.609>
-->

CONFIRM DBI VERSION ON STARCLUSTER-7:

emacs /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod

	
<!--	head2 Thu Oct 28 00:44:23 2010: C<Module> L<DBI|DBI>
	=over 4
	=item *
	C<installed into: /usr/lib/perl5/site_perl/5.8.8>
	=item *
	C<LINKTYPE: dynamic>
	=item *
	C<VERSION: 1.615>
	=item *
	C<EXE_FILES: dbiproxy dbiprof dbilogstrip>
	=back
-->





TRY INSTALL DBI 1.609 ON STARCLUSTER-7

perl Makefile.PL
        
	...
	Checking if your kit is complete...
	Looks good
	
	Warning: By default new modules are installed into your 'site_lib'
			 directories. Since site_lib directories come after the normal library
			 directories you must delete old DBI files and directories from your
			 'privlib' and 'archlib' directories and their auto subdirectories.
	
	Reinstall DBI and your DBD::* drivers after deleting the old directories.
	
	Here's a list of probable old files and directories:
	
	 /usr/lib/perl5/5.8.8/DBD
	 /usr/lib/perl5/5.8.8/auto/DBD
	 
	
		I see you're using perl 5.008008 on x86_64-linux-thread-multi, okay.
		Remember to actually *read* the README file!
		Use  'make' to build the software (dmake or nmake on Windows).
		Then 'make test' to execute self tests.
		Then 'make install' to install the DBI and then delete this working
		directory before unpacking and building any DBD::* drivers.
	
	Writing Makefile for DBI


make

	OK


make test

	All tests successful, 30 tests and 379 subtests skipped.
	Files=130, Tests=6001, 207 wallclock secs (30.00 cusr +  3.52 csys = 33.52 CPU)
	PERL_DL_NONLAZY=1 /usr/bin/perl "-Iblib/lib" "-Iblib/arch" test.pl
	test.pl 
	DBI test application $Revision: 12537 $
	Switch: DBI 1.609 by Tim Bunce, 1.609
	Available Drivers: DBM, ExampleP, File, Gofer, Proxy, SQLite, Sponge, mysql
	dbi:ExampleP:: testing 3 sets of 20 connections:
	Connecting... 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 
	Disconnecting...
	Connecting... 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 
	Disconnecting...
	Connecting... 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 
	Disconnecting...
	connect 20 and disconnect them, 3 times: 0.0050s / 60 = 0.0001s
	Testing handle creation speed...
	52631 NullP sth/s perl 5.008008 x86_64-linux-thread-multi (gcc 4.1.2 -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic) 0.000019s
	
	test.pl done

make install
	
	Manifying blib/man1/dbiprof.1
	Manifying blib/man1/dbiproxy.1
	Manifying blib/man1/dbilogstrip.1
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/DBI.so
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/dbixs_rev.h
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/Driver.xst
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/DBIXS.h
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/Driver_xst.h
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/dbipport.h
	Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Roadmap.pod
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/TASKS.pod
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Win32/DBIODBC.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/PurePerl.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/ProxyServer.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Roadmap.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Profile.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/FAQ.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/ProfileDumper.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Changes.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/SQL/Nano.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD/Metadata.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/Gofer/Execute.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/ProfileDumper/Apache.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/ExampleP.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/File.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Proxy.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/DBM.pm
	Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport/Base.pm
	Installing /usr/share/man/man3/DBI::Gofer::Transport::Base.3pm
	Installing /usr/share/man/man3/DBI::ProxyServer.3pm
	Installing /usr/share/man/man3/DBI::Util::CacheMemory.3pm
	Installing /usr/share/man/man3/DBI::Gofer::Transport::stream.3pm
	Installing /usr/share/man/man3/DBD::Gofer::Policy::Base.3pm
	Installing /usr/share/man/man3/DBD::DBM.3pm
	Installing /usr/share/man/man3/DBI::Gofer::Request.3pm
	Installing /usr/share/man/man3/DBD::Gofer.3pm
	Installing /usr/share/man/man3/DBI::Gofer::Serializer::Base.3pm
	Installing /usr/share/man/man3/DBI::Gofer::Serializer::DataDumper.3pm
	Installing /usr/share/man/man3/DBI::Const::GetInfoType.3pm
	Installing /usr/share/man/man3/DBI::ProfileDumper.3pm
	Installing /usr/share/man/man3/DBI::ProfileSubs.3pm
	Installing /usr/share/man/man3/DBI::PurePerl.3pm
	Installing /usr/share/man/man3/DBI::Gofer::Response.3pm
	Installing /usr/share/man/man3/DBI::W32ODBC.3pm
	Installing /usr/share/man/man3/DBD::File.3pm
	Installing /usr/share/man/man3/DBI::SQL::Nano.3pm
	Installing /usr/share/man/man3/DBD::Gofer::Policy::classic.3pm
	Installing /usr/share/man/man3/DBI::FAQ.3pm
	Installing /usr/share/man/man3/DBI::DBD.3pm
	Installing /usr/share/man/man3/Bundle::DBI.3pm
	Installing /usr/share/man/man3/DBI::Profile.3pm
	Installing /usr/share/man/man3/DBD::Gofer::Transport::Base.3pm
	Installing /usr/share/man/man3/DBI::Const::GetInfo::ANSI.3pm
	Installing /usr/share/man/man3/DBD::Gofer::Transport::stream.3pm
	Installing /usr/share/man/man3/Roadmap.3pm
	Installing /usr/share/man/man3/DBI.3pm
	Installing /usr/share/man/man3/DBD::Sponge.3pm
	Installing /usr/share/man/man3/DBI::Gofer::Execute.3pm
	Installing /usr/share/man/man3/DBI::Gofer::Serializer::Storable.3pm
	Installing /usr/share/man/man3/DBD::Gofer::Transport::null.3pm
	Installing /usr/share/man/man3/DBI::Const::GetInfo::ODBC.3pm
	Installing /usr/share/man/man3/DBD::Proxy.3pm
	Installing /usr/share/man/man3/Win32::DBIODBC.3pm
	Installing /usr/share/man/man3/DBI::Const::GetInfoReturn.3pm
	Installing /usr/share/man/man3/DBD::Gofer::Transport::pipeone.3pm
	Installing /usr/share/man/man3/DBI::ProfileDumper::Apache.3pm
	Installing /usr/share/man/man3/DBI::ProfileData.3pm
	Installing /usr/share/man/man3/DBI::DBD::Metadata.3pm
	Installing /usr/share/man/man3/DBD::Gofer::Policy::pedantic.3pm
	Installing /usr/share/man/man3/DBI::Gofer::Transport::pipeone.3pm
	Installing /usr/share/man/man3/TASKS.3pm
	Installing /usr/share/man/man3/DBD::Gofer::Policy::rush.3pm
	Installing /usr/bin/dbiprof
	Installing /usr/bin/dbiproxy
	Writing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/.packlist
	Appending installation info to /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod


CHECK THAT DBI VERSION IS CORRECT ON STARCLUSTER-7:


perl -MDBI -e 'print $DBI::VERSION';

	1.609



NOW INSTALL DBD::SQLite ON STARCLUSTER-7


perl Makefile.PL

	perl: symbol lookup error: /usr/lib/perl5/5.8.8/auto/DBD/SQLite/SQLite.so: undefined symbol: Perl_Istack_sp_ptr




COPY FILES FROM NGSDEV TO STARCLUSTER-7

scp -r \
-i /tmp/agua.pem \
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD* \
root@ec2-184-72-155-55.compute-1.amazonaws.com:/root/software/perlmods/DBD-SQLite/temp/site_perl/5.8.8/x86_64-linux-thread-multi


scp -r \
-i /tmp/agua.pem \
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI* \
root@ec2-184-72-155-55.compute-1.amazonaws.com:/root/software/perlmods/DBD-SQLite/temp/site_perl/5.8.8/x86_64-linux-thread-multi


scp -r \
-i /tmp/agua.pem \
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto \
root@ec2-184-72-155-55.compute-1.amazonaws.com:/root/software/perlmods/DBD-SQLite/temp/site_perl/5.8.8/x86_64-linux-thread-multi/auto


CREATE THESE TARGET DIRECTORIES ON STARCLUSTER

mkdir -p /root/software/perlmods/DBD-SQLite/temp/site_perl/5.8.8/x86_64-linux-thread-multi/DBD
mkdir -p /root/software/perlmods/DBD-SQLite/temp/site_perl/5.8.8/x86_64-linux-thread-multi/DBI
mkdir -p /root/software/perlmods/DBD-SQLite/temp/site_perl/5.8.8/x86_64-linux-thread-multi/auto
mkdir -p /root/software/perlmods/DBD-SQLite/temp/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD
mkdir -p /root/software/perlmods/DBD-SQLite/temp/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD




CORE FILEPATHS:

/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD*
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD


BACK UP OLD DBD FILES:

mv /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD.pm /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD.pm-old
mv /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD-old
mv /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD-old
mv /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD-old
mv /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD-old
mv /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/DBD.pm /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/DBD.pm-old
mv /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD-old



COPY FILES FROM temp DIR TO CORRECT LIBRARIES:

mkdir /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD
cp -r /root/software/perlmods/DBD-SQLite/temp/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/DBD.pm \
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD

/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD*
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD


CHANGE TO site_perl DIRECTORY
-----------------------------

cd /root/software/perlmods/DBD-SQLite/temp/site_perl/5.8.8/x86_64-linux-thread-multi

	drwxr-sr-x 4 root root 4.0K Oct 28 02:37 DBD
	drwxr-sr-x 8 root root 4.0K Oct 28 02:39 DBI
	-r--r--r-- 1 root root 288K Oct 28 02:39 DBI.pm
	drwxr-sr-x 3 root root 4.0K Oct 28 02:41 auto


COPY FILES AND DIRECTORIES:

cp -r DBD* /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/
cp -r DBI* /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/


cp -r auto/DBD* /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto


CHANGE TO vendor_perl DIRECTORY:
--------------------------------
cd /root/software/perlmods/DBD-SQLite/temp/vendor_perl/5.8.8/x86_64-linux-thread-multi


COPY FILES AND DIRECTORIES:

cp -r DBD /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi
cp -r DBD* /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD*
cp -r auto/DBD /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto
cp -r auto/DBD/* /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD



COPY /usr/lib/perl5
-------------------


CREATE DIR ON STARCLUSTER-7

mkdir -p /root/software/perlmods/DBD-SQLite/temp/usr/lib/perl5/5.8.8
mkdir -p /root/software/perlmods/DBD-SQLite/temp/usr/lib/perl5/5.8.8/auto


COPY FROM NGSDEV

scp -r \
-i /tmp/agua.pem \
/usr/lib/perl5/5.8.8/auto/DBD \
root@ec2-184-72-155-55.compute-1.amazonaws.com:/root/software/perlmods/DBD-SQLite/temp/usr/lib/perl5/5.8.8/auto

	SQLite.so	100%  699KB 698.8KB/s   00:00    
	SQLite.bs	100%    0     0.0KB/s   00:00    


SAVE OLD FILES

mv /usr/lib/perl5/5.8.8/auto/DBD /usr/lib/perl5/5.8.8/auto/DBD-old 
mv /usr/lib/perl5/5.8.8/DBD /usr/lib/perl5/5.8.8/DBD-old 
mv /usr/lib/perl5/5.8.8/DB.pm /usr/lib/perl5/5.8.8/DB.pm-old 
mv /usr/lib/perl5/5.8.8/DBM_Filter.pm /usr/lib/perl5/5.8.8/DBM_Filter.pm-old 


COPY OVER NEW ONES FROM TEMP FOLDER

cp -r /root/software/perlmods/DBD-SQLite/temp/usr/lib/perl5/5.8.8/DB* \
/usr/lib/perl5/5.8.8/


cp -r /root/software/perlmods/DBD-SQLite/temp/usr/lib/perl5/5.8.8/auto/DB* \
/usr/lib/perl5/5.8.8/auto


**** COPIED CORRECT FILES *****


scp -r \
-i /tmp/agua.pem \
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD \
root@ec2-184-72-155-55.compute-1.amazonaws.com:/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto



SQLite.bs                                                                                                                  100%    0     0.0KB/s   00:00    
SQLite.so                                                                                                                  100%  665KB 664.6KB/s   00:00    
.packlist                                                                                                                  100%  408     0.4KB/s   00:00


TESTED

perl -e 'use DBD::SQLite';

	OK!!!





COPY DBD::mysql FROM NGSDEV TO STARCLUSTER-7
--------------------------------------------

ON NGSDEV

/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/Bundle/DBD/mysql.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/mysql
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/mysql.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/mysql/GetInfo.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/mysql/INSTALL.pod
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/mysql
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/mysql/mysql.so







11. RESTARTED MYSQL AND HTTPD

[root@ip-10-120-66-176 0.5]# /etc/init.d/mysqld start
Starting MySQL:  [  OK  ]
[root@ip-10-120-66-176 0.5]# /etc/init.d/httpd start
Starting httpd: [  OK  ]




FULL LIST OF /usr/lib/perl5 FILES ON STARCLUSTER-7


[root@ip-10-120-66-176 x86_64-linux-thread-multi]# ll /usr/lib/perl5/5.8.8/DB*
-rw-r--r-- 1 root root  19K Sep 28 08:52 /usr/lib/perl5/5.8.8/DB.pm
-rw-r--r-- 1 root root  15K Sep 28 08:52 /usr/lib/perl5/5.8.8/DBM_Filter.pm

/usr/lib/perl5/5.8.8/DBD:
total 64K
drwxr-xr-x  2 root root 4.0K Oct 28 00:39 .
drwxr-xr-x 43 root root 4.0K Oct 28 00:39 ..
-r--r--r--  1 root root  49K Oct 28 00:39 SQLite.pm

/usr/lib/perl5/5.8.8/DBM_Filter:
total 28K
drwxr-xr-x  2 root root 4.0K Oct 27 22:43 .
drwxr-xr-x 43 root root 4.0K Oct 28 00:39 ..
-rw-r--r--  1 root root  837 Sep 28 08:52 compress.pm
-rw-r--r--  1 root root 1.4K Sep 28 08:52 encode.pm
-rw-r--r--  1 root root  734 Sep 28 08:52 int32.pm
-rw-r--r--  1 root root  947 Sep 28 08:52 null.pm
-rw-r--r--  1 root root  763 Sep 28 08:52 utf8.pm






FULL LIST OF DBD MODULES ON NGSDEV:

/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/DBM.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/ExampleP.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/File.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/NullP.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Proxy.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/SQLite
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/SQLite.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Sponge.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Policy
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Policy/Base.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Policy/classic.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Policy/pedantic.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Policy/rush.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport/Base.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport/null.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport/pipeone.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/Gofer/Transport/stream.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/SQLite/Cookbook.pod
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD/Metadata.pm
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD

/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/.packlist
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/SQLite.bs
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/SQLite.so



/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/Bundle/DBD
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/Bundle/DBD/mysql.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/DBM.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/ExampleP.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/File.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/NullP.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/Proxy.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/Sponge.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/mysql
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/mysql.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/mysql/GetInfo.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBD/mysql/INSTALL.pod
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/DBI/DBD/Metadata.pm
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/mysql
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/mysql/mysql.so








NOTES
-----

 
 
PROBLEM:

CPAN GIVES  Cannot allocate memory ERROR AFTER HANGING FOR 5 MINS:

install File::Copy::Recursive

	Running install for module File::Copy::Recursive
	Running make for D/DM/DMUEY/File-Copy-Recursive-0.38.tar.gz
	LWP not available

	Fetching with Net::FTP:
	  ftp://ftp.perl.org/pub/CPAN/authors/id/D/DM/DMUEY/File-Copy-Recursive-0.38.tar.gz
	
	Trying with "/usr/bin/wget -O -" to get
		ftp://ftp.perl.org/pub/CPAN/authors/id/D/DM/DMUEY/File-Copy-Recursive-0.38.tar.gz

	System call "/usr/bin/wget -O - "ftp://ftp.perl.org/pub/CPAN/authors/id/D/DM/DMUEY/File-Copy-Recursive-0.38.tar.gz"  > /root/.cpan/sources/authors/id/D/DM/DMUEY/File-Copy-Recursive-0.38.tar"
	returned status 72057594037927935 (wstat -1)
	Warning: expected file [/root/.cpan/sources/authors/id/D/DM/DMUEY/File-Copy-Recursive-0.38.tar.gz] doesn't exist
	Issuing "/usr/kerberos/bin/ftp -n"
	Couldn't open ftp: Cannot allocate memory at /usr/lib/perl5/5.8.8/CPAN.pm line 2806, < FIN> line 3.



DIAGNOSIS


NO SWAP SPACE ALLOCATED

swapon -s

	Filename                                Type            Size    Used    Priority

MEMORY ALL USED UP

cat /proc/meminfo

	MemTotal:       637480 kB
	MemFree:          4372 kB
	Buffers:          1040 kB
	Cached:           8272 kB
	SwapCached:          0 kB
	Active:         569372 kB
	Inactive:         3868 kB
	SwapTotal:           0 kB
	SwapFree:            0 kB
	Dirty:              60 kB
	Writeback:           0 kB
	AnonPages:      563928 kB
	Mapped:           4632 kB
	Slab:            22080 kB
	SReclaimable:    14912 kB
	SUnreclaim:       7168 kB
	PageTables:       3652 kB
	NFS_Unstable:        0 kB
	Bounce:              0 kB
	CommitLimit:    318740 kB
	Committed_AS:   606156 kB
	VmallocTotal: 34359738367 kB
	VmallocUsed:       180 kB
	VmallocChunk: 34359738187 kB

SOLUTION:

CREATE SWAP SPACE

# To create a swap file, use the dd command to create an empty file. To create a 1GB file, type:

dd if=/dev/zero of=/swapfile bs=1024 count=1048576
	
	1048576+0 records in
	1048576+0 records out
	1073741824 bytes (1.1 GB) copied, 48.98 seconds, 21.9 MB/s


# Prepare the swap file using mkswap just as you would a partition, but this time use the name of the swap file: 
 
mkswap /swapfile

	Setting up swapspace version 1, size = 1073737 kB


# mount it using the swapon command:

swapon /swapfile

	OK

# EDIT /etc/fstab TO ADD:

emacs /etc/fstab
/swapfile       none    swap    sw      0       0





PROBLEM:

CPAN HANGS


SOLUTION:

perl -MCPAN -e shell
o conf default




PROBLEM:

ERROR WHEN RUNNING CPAN install

    Running make test
      Can't test without successful make
    Running make install
      make had returned bad status, install seems impossible


SOLUTION:

INSTALL MAKE

yum install make
	
	Package 1:make-3.81-3.el5.x86_64 already installed and latest version
	Nothing to do


perl -MCPAN -e shell

#### SET MAKE IN CPAN
o conf make /usr/bin/make
o conf commit





PROBLEM:
http://www.archlinux.org/packages/extra/x86_64/perl-dbd-sqlite/
CAN'T INSTALL DBD::SQLite BY CPAN SO DID IT MANUALLY:

perl Makefile.PL
        
        Checking if your kit is complete...
        Looks good
        Multiple copies of Driver.xst found in: /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/ /nethome/bioinfo/apps/agua/0.4/lib64/external/vendor_perl/5.8.8/auto/DBI/ at Makefile.PL line 330
        Using DBI 1.609 (for perl 5.008008 on x86_64-linux-thread-multi) installed in /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/
        Writing Makefile for DBD::SQLite

make
        OK
make test
        OK
make install
        Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/SQLite.bs
        Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/SQLite.so
        Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
        Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/SQLite.pm
        Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/SQLite/Cookbook.pod
        Installing /usr/share/man/man3/DBD::SQLite.3pm
        Installing /usr/share/man/man3/DBD::SQLite::Cookbook.3pm
        Writing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/.packlist
        Appending installation info to /nethome/bioinfo/apps/agua/0.4/lib/external/5.8.8/x86_64-linux-thread-multi/perllocal.pod



</entry>

<entry [Wed Oct 27 00:24:02 EDT 2010] INSTALLED Term::ReadKey TO lib/external>

1. INSTALL TO /tmp/temp USING CPAN

o conf makepl_arg PREFIX=/tmp/temp

o conf mbuildpl_arg "--prefix /tmp/temp"

o conf commit

install Term::ReadKey

	OK

ll /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/

	drwxr-xr-x 2 root root 4096 Oct 27 00:22 Term
	drwxr-xr-x 3 root root 4096 Oct 27 00:22 auto

ll /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Term/ReadKey/

	-r--r--r-- 1 root root     0 Oct 27 00:22 ReadKey.bs
	-r-xr-xr-x 1 root root 98245 Oct 27 00:22 ReadKey.so
	-r--r--r-- 1 root root    91 Oct 27 00:22 autosplit.ix



2. COPY TO lib/external

TWO POSSIBLE LOCATIONS:


ALTERNATIVE 1
-------------
/data/agua/0.5/lib/external


cp -r /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Term \
/data/agua/0.5/lib/external

cp -r /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Term \
/data/agua/0.5/lib/external/auto/



ll /data/agua/0.5/lib/external/auto/
	
	drwxr-xr-x 5 root root 4096 Sep 10 11:37 DBD
	drwxr-xr-x 8 root root 4096 Sep 10 11:37 DBI
	drwxr-xr-x 3 root root 4096 Sep 10 11:37 Proc
	drwxr-xr-x 3 root root 4096 Oct 27 00:49 Term

ll /data/agua/0.5/lib/external/
	
	drwxr-xr-x 2 root root   4096 Sep 10 11:37 Bundle
	drwxr-xr-x 3 root root   4096 Sep 10 11:38 CGI
	drwxr-xr-x 3 root root   4096 Sep 10 11:38 Class
	drwxr-xr-x 2 root root   4096 Sep 10 11:38 Config
	drwxr-xr-x 3 root root   4096 Sep 10 11:38 Convert
	drwxr-xr-x 3 root root   4096 Sep 10 11:38 DBD.bkp
	drwxr-xr-x 8 root root   4096 Sep 10 11:39 DBI.bkp
	-rw-r--r-- 1 root root 290848 Jan  6  2010 DBI.pm.old
	drwxr-xr-x 3 root root   4096 Sep 10 11:38 Date
	drwxr-xr-x 3 root root   4096 Sep 10 11:39 File
	drwxr-xr-x 2 root root   4096 Sep 10 11:39 HTTP
	drwxr-xr-x 3 root root   4096 Sep 10 11:39 IPC
	drwxr-xr-x 3 root root   4096 Sep 10 11:39 JSON
	-rw-r--r-- 1 root root  59839 Jan  6  2010 JSON.pm
	drwxr-xr-x 2 root root   4096 Sep 10 11:42 LSF
	-rw-r--r-- 1 root root   4618 Mar  4  2010 LSF.pm
	drwxr-xr-x 4 root root   4096 Sep 10 11:43 Net
	drwxr-xr-x 2 root root   4096 Sep 10 11:43 Proc
	drwxr-xr-x 3 root root   4096 Sep 10 11:43 RPC
	-rw-r--r-- 1 root root  15161 Jan  6  2010 Roadmap.pod
	-rw-r--r-- 1 root root   1048 Jan  6  2010 TASKS.pod
	drwxr-xr-x 2 root root   4096 Oct 27 00:49 Term
	drwxr-xr-x 3 root root   4096 Sep 10 11:44 Test
	drwxr-xr-x 2 root root   4096 Sep 10 11:44 Unix
	drwxr-xr-x 2 root root   4096 Sep 10 11:44 Win32
	drwxr-xr-x 6 root root   4096 Oct 27 00:49 auto
	-rw-r--r-- 1 root root   1533 Jan  6  2010 dbixs_rev.pl
	drwxr-xr-x 3 root root   4096 Sep 10 11:39 lib
	drwxr-xr-x 3 root root   4096 Sep 10 11:40 lib64


cd /data/agua/0.5/bin/scripts
./config.pl 

	Can't open config file: /data/agua/0.4/conf/default-linux.conf

	OK!!


ALTERNATIVE 2 (???)
-------------
THE lib64 FOLDER TREE INSIDE /data/agua/0.5/lib/external

/data/agua/0.5/lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi


ll /data/agua/0.5/lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/
total 76
drwxr-xr-x  3 root root  4096 Sep 10 11:40 Attribute
drwxr-xr-x  3 root root  4096 Sep 10 11:41 Class
drwxr-xr-x  2 root root  4096 Sep 10 11:41 List
drwxr-xr-x  8 root root  4096 Sep 10 11:42 Moose
-rw-r--r--  1 root root 39866 Mar 26  2010 Moose.pm
drwxr-xr-x  2 root root  4096 Sep 10 11:42 Params
drwxr-xr-x  2 root root  4096 Sep 10 11:42 Test
drwxr-xr-x 10 root root  4096 Sep 10 11:40 auto
-rw-r--r--  1 root root  2664 Mar 25  2010 metaclass.pm
-rw-r--r--  1 root root  2183 Mar 26  2010 oose.pm



</entry>

<entry [Mon Oct 11 16:02:46 EDT 2010] ARGONNE WORKFLOW ENGINE (AWE) AND CLOUD WORKFLOW BY SPLITTING INPUT INTO MULTIPLE BUCKETS ON S3>

http://genomicscience.energy.gov/compbio/kbase_plan/kbaseimplementationplan.pdf

Example four from the University of Maryland is showcasing how the novel computational
metaphors coming available within the cloud context alter application development.


Example 1: A Cloud-Enabled Proteomics Workflow at Medical College of Wisconsin. Modern
mass spectrometers are capable of generating data many times faster than a typical single
desktop computer is able to analyze it. We have brought together two recent developments,
open source proteomics search programs and distributed on-demand or cloud computing, to
allow for the construction of a highly flexible, scalable, and very low cost solution to proteomics
data analysis: the Virtual Proteomics Data Analysis Cluster (ViPDAC). On boot, the application
sets up the databases, links launch scripts, executes worker daemons, and starts monitoring the
running processes. Access to the application is via a web browser to a server name provided by
EC2 on startup. Users create a new search job and upload their datafile, which is split into
independent chunks that are stored on S3 and distributed to waiting worker nodes. Each
worker searches the datafile against a database specified in the job, storing the search results
back on S3. When the job is complete, the head node downloads and assembles the result files
into an archive suitable for use with other analysis tools.


Example 2: Argonne's MG-RAST Server. Metagenomics applications were among the first to
explore the use of cloud computing. These large resource consumers are traditionally
implemented as distributed applications, requiring a complex software stack and a central file
system. They are also very similar to many of the existing genome analysis pipelines.
Argonne National Laboratory's metagenomics RAST server (MG-RAST) is one example for a
recent development in that type of application. More than 120 gigabases of DNA have been
analyzed via MG-RAST using a local cluster, TeraGrid, and cloud like resources. While the
integration of TeraGrid happened by manually moving datasets and computations to TeraGrid,
the integration of cloud resources was facilitated by using a novel workflow system: AWE.

AWE (Argonne Workflow Engine) was initially used to run the similarity computation step of the
pipeline on a variety of cloud-like resources.

AWE relies on a set of appliances that connect to a scalable fault tolerant server infrastructure
for coordination. Both client and servers are lightweight and highly scalable. The server assigns
work to clients based on the current workload and client capabilities. Work units are typically a
small fraction of the full similarity comparison. AWE understands the structure and semantics
of the work that is to be done, and hence can reuse intermediate results as well as scale the
size of the work units depending on the speed and capabilities of the client execution
environment. Similarly, AWE can use work unit data requirements to route work to locations
where needed data is already present. Finally, AWE uses a lease mechanism in work assignment
that allows automatic detection and re-routing of failure work units.
AWE provides a lightweight mechanism for distributing work across heterogenous resources,
including HPC clusters, clouds, Blue Gene systems, and systems with accelerators (GPUs or
FPGAs). Effectively harnessing these resources is a key challenge in order to maximize the
analysis progress we can make.



</entry>

<entry [Mon Oct 11 14:06:33 EDT 2010] LOAD apps, agua AND jbrowse ONTO CLOUD>


1. CLEAN UP APPS

du -hs ~/base/apps
	
	794M    454
	48G     agua
	2.5M    bedtools
	12M     bfast
	12K     biolinux
	49M     bioperl
	2.6M    blat
	116M    bowtie
	4.0M    bwa
	802M    casava
	128M    circos
	571M    complete
	24M     crossbow
	55M     cufflinks
	0       du.txt
	2.5G    GAPipeline
	38M     gatk
	2.4M    gff2aplot
	395M    git
	181M    hadoop
	195M    jbrowse
	188M    jdk
	37G     legacy
	1.9G    libs
	4.9M    lynx
	2.4G    maq
	8.0K    mosaik
	12M     mummer
	39M     myrna
	173M    novoalign
	200K    piqa
	823M    polybayes
	12M     pygr
	1.8M    pyrobayes
	1.4G    R
	245M    repeatmasker
	729M    rmblast
	241M    rnamate
	121M    samtools
	456K    seqmap
	9.1M    shore
	24M     shrimp
	3.2M    soap
	32M     sra
	287M    ssaha
	48M     subversion
	220K    tandemrepeats
	9.8M    tophat
	32M     trac
	17M     velvet
	9.1M    yum




2. TAR apps USING EXCLUDE 
(DO ALL EXCEPT agua AND legacy WHICH HAVE BEEN MOVED TO THE DIRECTORY ABOVE)

cd /nethome/syoung/base/apps
PWD=`pwd`;
DIRS="*"
for DIR in $DIRS;
do
    if [ -d $PWD/$DIR ]; then

		echo tar cvfz /ngs/bioinfo/syoung/base/apps/$DIR.tar.gz $DIR --wildcards --no-wildcards-match-slash --exclude \"$DIR/archive\"
		
		tar cvfz /ngs/bioinfo/syoung/base/apps/$DIR.tar.gz $DIR --wildcards --no-wildcards-match-slash --exclude "$DIR/archive"

    fi;
done;




3. TAR agua


cd /ngs/bioinfo/syoung/base/apps
tar cvfz agua.tar.gz /nethome/syoung/base/agua
ll 




4. TRANSFER jbrowse

SEE Notes-hardware-ec2.txt
Wed Oct 13 23:49:44 EDT 2010
CREATING AN EBS-BACKED AMI



NOTES
-----

man tar

		--wildcards 
		--no-wildcards-match-slash

       --exclude "PATTERN"
              exclude files based upon PATTERN

       -X, --exclude-from FILE
              exclude files listed in FILE



OTHER TRICKS FOR COPYING



ls -1 | grep -v "^.kde$" | xargs -n 1 -iHERE cp -R HERE destination

Basically, 'ls -1' gets all the contents of the directory, grep removes an entry of ".kde", and then xargs copies everything else.




cp *?[!php] /home/SOURCE/ /home/COPIED/

With this command in the bash you can copy all files except php from a directory.
  	



</entry>


<entry [Thu 2011:08:11 00:01:23 EST] INSTALLED PERL MODULE Stardust>

... AND ITS 21 DEPENDENCIES

cpanm install Stardust
    ...
    Configuring Set-Object-1.28 ... OK
    Building and testing Set-Object-1.28 ... OK
    Successfully installed Set-Object-1.28
    Building and testing Stardust-0.08 ... OK
    Successfully installed Stardust-0.08
    22 distributions installed
    You have new mail in /var/mail/root


</entry>
<entry [Wed 2011:08:03 06:31:29 EST] TWO METHODS FOR INSTALLING EC2-API TOOLS>

1. DOWNLOAD ZIPFILE AND INSTALL (Installer.pm)

    #### INSTALL EC2-API-TOOLS
    $self->installEc2("http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip");

2. ALTERNATE: sudo apt-get install ec2-api-tools


</entry>
<entry [Thu 2011:06:02 04:17:17 EST] FIX NON-INTERACTIVE INSTALL OF Bio::DB::Sam>

Bio::DB::Sam requires the bam library created during the samtools build AND all the samtools header files.

WE WANT TO AVOID THIS INTERACTIVE PROMPT ON INSTALLING Bio::DB::Sam USING cpanm:

    Configuring Bio-SamTools-1.28 ... Please enter the location of the bam.h and compiled libbam.a files: FAIL
    ! Timed out (> 60s). Use --verbose to retry.


1. INSTALL samtools

SEE apps.samtools
[Wed 2011:05:25 01:16:17 EST]
INSTALLED SAMTOOLS 0.1.16 AND Bio::DB::Sam 1.28 ON HP>


2. EXPORT LOCATION OF libbam. AND bam.h AS 'SAMTOOLS':

export SAMTOOLS=/data/apps/samtools/0.1.16


3. INSTALL WITH cpan

sudo cpan Bio::DB::Sam
    OK
    


notes
-----

DID NOT NEED TO DO THIS:

1. COPY libbam.a TO /lib

cd /data/apps/samtools/0.1.16
cp libbam.a /lib

2. COPY bam.h TO /usr/include
(diff /data/apps/samtools/0.1.16 /usr/include SHOWS NO FILES IN COMMON)

cd /data/apps/samtools/0.1.16
cp *h /usr/lib
    -rw-r--r-- 1 501 staff 1.5K 2011-03-01 14:50 bam2bcf.h
    -rw-r--r-- 1 501 staff 1.1K 2010-11-16 23:16 bam_endian.h
    -rw-r--r-- 1 501 staff  24K 2011-04-21 23:16 bam.h
    -rw-r--r-- 1 501 staff 1.5K 2010-11-16 23:16 bam_maqcns.h
    -rw-r--r-- 1 501 staff 4.6K 2011-04-10 18:33 bgzf.h
    -rw-r--r-- 1 501 staff  442 2011-03-01 14:50 errmod.h
    -rw-r--r-- 1 501 staff 3.2K 2010-11-16 23:16 faidx.h
    -rw-r--r-- 1 501 staff 1.8K 2010-11-16 23:16 glf.h
    -rw-r--r-- 1 501 staff 2.1K 2010-11-16 23:16 kaln.h
    -rw-r--r-- 1 501 staff  18K 2011-03-01 14:50 khash.h
    -rw-r--r-- 1 501 staff 3.4K 2010-11-16 23:16 klist.h
    -rw-r--r-- 1 501 staff 1.6K 2010-11-16 23:16 knetfile.h
    -rw-r--r-- 1 501 staff 1.6K 2010-11-16 23:16 kprobaln.h
    -rw-r--r-- 1 501 staff 8.0K 2010-11-16 23:16 kseq.h
    -rw-r--r-- 1 501 staff 9.8K 2010-11-16 23:16 ksort.h
    -rw-r--r-- 1 501 staff 2.6K 2011-03-01 14:50 kstring.h
    -rw-r--r-- 1 501 staff 4.1K 2010-11-16 23:16 razf.h
    -rw-r--r-- 1 501 staff 2.6K 2010-11-16 23:16 sam.h
    -rw-r--r-- 1 501 staff  643 2010-11-16 23:16 sam_header.h
    -rw-r--r-- 1 501 staff  396 2010-11-16 23:16 sample.h



</entry>
<entry [Mon 2011:05:02 23:53:39 EST] TESTED Agua::AWS::addNfsToFstab>

TEST init.pl

echo '{"username":"agua","mode":"init","data":{"username":"admin","amazonuserid":"728213020069","datavolume":"snap-55fe4a3f","uservolume":" New volume","datavolumesize":40,"uservolumesize":100,"datavolumecheckbox":0,"uservolumecheckbox":0,"ec2publiccert":"-----BEGIN CERTIFICATE-----MIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlkC/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}}' | ./init.cgi


BEFORE /etc/fstab

<!--
    # <file system> <mount point>   <type>  <options>       <dump>  <pass>                      proc        /proc           proc    nodev,noexec,nosuid 0       0
    /dev/sda1   /               ext3    defaults        0       0
    /dev/sdb1   /mnt    auto defaults,nobootwait 0 0
    #/dev/sdb1  /mnt    auto    defaults,comment=cloudconfig    0       0
    /dev/sdh    /data   ext3    noatime 0       0
    /dev/sdi    /nethome      ext3    defaults        0 0
    /nethome/mysql/etc/mysql /etc/mysql     none bind
    /nethome/mysql/lib/mysql /var/lib/mysql none bind
    /nethome/mysql/log/mysql /var/log/mysql none bind

-->
AFTER /etc/fstab

<!--
    # <file system> <mount point>   <type>  <options>       <dump>  <pass>                      proc        /proc           proc    nodev,noexec,nosuid 0       0
    /dev/sda1   /               ext3    defaults        0       0
    #/dev/sdb1	/mnt	auto	defaults,comment=cloudconfig	0	0
    /dev/sdh	/data	ext3	noatime	0	0
    /dev/sdi   /nethome      ext3    defaults        0 0
    /nethome/mysql/etc/mysql /etc/mysql     none bind
    /nethome/mysql/lib/mysql /var/lib/mysql none bind
    /nethome/mysql/log/mysql /var/log/mysql none bind
    /dev/sdh	/data	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
    /dev/sdi	/nethome	nfs     rw,vers=3,rsize=32768,wsize=32768,hard,proto=tcp 0 0
-->
    
</entry>
<entry [Sun 2011:05:01 01:47:06 EST] TESTED executeWorkflow ON 8e>


*** WAS ABOUT TO COPY OVER /var/lib/gridengine FROM HP BUT HAD AN EPIPHANY:
*** GET IT WORKING ON A STARCLUSTER MASTER AND COPY OVER NECESSARY FILES - IT WORKED!
***    
*** SEE: apps.starcluster.xsl
***      [Mon 2011:05:02 01:04:47 EST] INSTALLED STARCLUSTER ON 8e AND STARTED smallcluster
***

BASH SHORTCUT

exec() {
    echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"1"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi;
}

 /opt/sge6/bin/lx24-amd64//qsub -t 1-1 -q default /nethome/syoung/agua/Project1/Workflow1/chr22/scripts/tophatBatchAlignment-chr22.sh
error: commlib error: got select error (Connection timed out)

    Unable to run job: unable to contact qmaster using port 701 on host "ip-10-86-250-251.ec2.internal".


OPENED PORTS 701 AND 702:

ec2-authorize default -p 701 -P tcp
ec2-authorize default -p 701 -P udp
ec2-authorize default -p 702 -P tcp
ec2-authorize default -p 702 -P udp


THEN GOT THIS:

Unable to run job: unable to contact qmaster using port 63231 on host "ip-10-86-250-251.ec2.internal".

WHICH WAS DUE TO THIS;

cd /opt/sge6/default/common
grep 63231 *

    settings.csh:setenv SGE_QMASTER_PORT 63231
    settings.sh:SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT
    sgeexecd:SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT 
    sgemaster:SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT 
    root@ip-10-124-231-156:/opt/sge6/default/common

emacs settings.sh
    ...
    SGE_QMASTER_PORT=63231; export SGE_QMASTER_PORT
    SGE_EXECD_PORT=63232; export SGE_EXECD_PORT
    ...

SO RESET THE DEFAULT PORTS FOR SGE_QMASTER AND SGE_EXECD_PORT IN default.conf:

SGEQMASTERPORT          63231
SGEEXECDPORT            63232


AND OPENED PORTS 63231 AND 63232:

ec2-authorize default -p 63231 -P tcp
ec2-authorize default -p 63231 -P udp
ec2-authorize default -p 63232 -P tcp
ec2-authorize default -p 63232 -P udp


RESTART QMASTER:

/opt/sge6/bin/lx24-amd64/sge_qmaster
/opt/sge6/bin/lx24-amd64/sge_execd
    error: can't find connection
    error: can't get configuration from qmaster -- backgrounding


CHECKED DAEMONS ARE RUNNING:

    root      1365  0.0  0.1 183052 15088 pts/1    T    18:55   0:00 emacs -nw sge.txt
    sgeadmin  1768  0.0  0.0 130748  4444 ?        Sl   19:15   0:00 /opt/sge6/bin/lx24-amd64/sge_qmaster
    sgeadmin  1773  0.0  0.0  61888  1884 ?        Sl   19:15   0:00 /opt/sge6/bin/lx24-amd64/sge_execd
    root      1793  0.0  0.0   7624   932 pts/1    S+   19:17   0:00 grep sge


SO SET SGE_HOME, ETC. IN ENVIRONMENT USING .bash_profile;

export SGE_EXECD_PORT=63232;
export SGE_QMASTER_PORT=63231
export SGE_ROOT=/opt/sge6
export PATH=/opt/sge6/bin/lx24-amd64:$PATH


BUT PORTS SET IN /etc/services

cat /etc/services | grep 6444
    sge_qmaster	6444/tcp			# Grid Engine Qmaster Service
    sge_qmaster	6444/udp			# Grid Engine Qmaster Service


BUT LISTENED PORTS ARE AS FOLLOWS!!!

netstat -anp | grep sge
    tcp        0      0 0.0.0.0:63231           0.0.0.0:*               LISTEN      1768/sge_qmaster
    tcp        0      0 0.0.0.0:63232           0.0.0.0:*               LISTEN      1773/sge_execd  


FOUND REPORT OF SIMILAR PROBLEM:
http://markmail.org/message/ot22t3rktowuc2s7

We updated our SGE to 6.0u4, but we still get the same error. 
Fortunately, the error message is a bit more detailed:

    error: commlib error: access denied (client IP resolved to host name 
    "192.168.7.161". This is not identical to clients host name 
    "cmp11.gelb.exasol.com")
    error: executing task of job 93 failed: failed sending task to 
    execd@cmp11: can't find connection


GET FILES BEING USED BY SGE USING lsof

lsof | grep sge
    sge_execd 2156   sgeadmin    3u     IPv4              10935      0t0        TCP *:sge_execd (LISTEN)
    sge_execd 2156   sgeadmin    4u     IPv4              12513      0t0        TCP ip-10-86-199-110.ec2.internal:51705->ip-10-124-231-156.ec2.internal:sge_qmaster (SYN_SENT)


GET HOST NAME

/opt/sge6/utilbin/lx24-amd64/gethostname 

    Hostname: ip-10-124-231-156.ec2.internal
    Aliases:  
    Host Address(es): 10.124.231.156 




HOST IP DIFFERS WITH IP IN @hostnames AS THESE ARE LEFT OVER FROM THE INITIAL BOOTUP OF THE MASTER STARCLUSTER NODE OF WHICH THIS IMAGE IS A CLONE:

cat /opt/sge6/default/spool/qmaster/hostgroups/@allhosts 

# Version: 6.2u5
# 
# DO NOT MODIFY THIS FILE MANUALLY!
# 
group_name @allhosts
hostlist ip-10-86-250-251.ec2.internal ip-10-86-193-30.ec2.internal


SYSLOG SHOWS QMASTER WAS KILLED RECENTLY:

/var/log/syslog

    May  1 22:24:03 ip-10-124-231-156 kernel: [26955.607905] 1888092 pages non-shared
    May  1 22:24:03 ip-10-124-231-156 kernel: [26955.607909] Out of memory: kill process 1768 (sge_qmaster) score 32687 or a child
    May  1 22:24:03 ip-10-124-231-156 kernel: [26955.607928] Killed process 1768 (sge_qmaster)


NO EFFECT SPECIFYING ARCH:

export ARCH=lx24-amd64


FOUND THIS LURKING IN NETSTAT:

netstat -arp

    Kernel IP routing table
    Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
    10.86.198.0     *               255.255.254.0   U         0 0          0 eth0
    default         ip-10-86-198-1. 0.0.0.0         UG        0 0          0 eth0



CHANGED THE HOSTS IN @allhosts TO THIS HOST'S INTERNAL IP:

cp -pr /opt/sge6/default/spool/qmaster/hostgroups/@allhosts \
/opt/sge6/default/spool/qmaster/hostgroups/@allhosts.bkp 



THEN DISCOVERED THE REMAINING ENTRIES CONTAINING THE OLD HOSTS:

/opt/sge6# grep -R -n 10-86-250-251 *

default/common/local_conf/ip-10-86-250-251.ec2.internal:5:conf_name                    ip-10-86-250-251.ec2.internal


default/spool/qmaster/hostgroups/@allhosts.bkp:6:hostlist ip-10-86-250-251.ec2.internal ip-10-86-193-30.ec2.internal
default/spool/qmaster/hostgroups/@allhosts~:6:hostlist ip-10-86-250-251.ec2.internal ip-10-86-193-30.ec2.internal

default/spool/qmaster/exec_hosts/ip-10-86-250-251.ec2.internal:5:hostname              ip-10-86-250-251.ec2.internal
default/spool/qmaster/admin_hosts/ip-10-86-250-251.ec2.internal:5:hostname              ip-10-86-250-251.ec2.internal

default/spool/qmaster/qinstances/all.q/ip-10-86-250-251.ec2.internal:6:hostname              ip-10-86-250-251.ec2.internal

default/spool/qmaster/cqueues/all.q~:19:slots                 1,[ip-10-86-250-251.ec2.internal=2],[ip-10-86-193-30.ec2.internal=2]

default/spool/qmaster/cqueues/all.q.bkp:19:slots                 1,[ip-10-86-250-251.ec2.internal=2],[ip-10-86-193-30.ec2.internal=2]

default/spool/qmaster/submit_hosts/ip-10-86-250-251.ec2.internal:5:hostname              ip-10-86-250-251.ec2.internal

default/spool/exec_spool_local/ip-10-86-250-251/messages:1:04/22/2011 20:24:42|  main|ip-10-86-250-251|I|starting up GE 6.2u5 (lx24-amd64)


ec2_sge.conf:16:ADMIN_HOST_LIST=" ip-10-86-250-251.ec2.internal ip-10-86-193-30.ec2.internal"
ec2_sge.conf:17:SUBMIT_HOST_LIST=" ip-10-86-250-251.ec2.internal ip-10-86-193-30.ec2.internal"
ec2_sge.conf:18:EXEC_HOST_LIST=" ip-10-86-250-251.ec2.internal ip-10-86-193-30.ec2.internal"



EDITED VALUES IN /opt/sge6/ec2_sge.conf

cp /opt/sge6/ec2_sge.conf /opt/sge6/ec2_sge.conf.bkp
emacs /opt/sge6/ec2_sge.conf

#ADMIN_HOST_LIST=" ip-10-86-250-251.ec2.internal ip-10-86-193-30.ec2.internal"
#SUBMIT_HOST_LIST=" ip-10-86-250-251.ec2.internal ip-10-86-193-30.ec2.internal"
#EXEC_HOST_LIST=" ip-10-86-250-251.ec2.internal ip-10-86-193-30.ec2.internal"

ADMIN_HOST_LIST=" ip-10-86-199-110.ec2.internal"
SUBMIT_HOST_LIST=" ip-10-86-199-110.ec2.internal"
EXEC_HOST_LIST=" ip-10-86-199-110.ec2.internal"


SWAPPED GRID ENGINE TO FRESH COPY:

CHANGED /opt/sge6 TO /opt/sge6-starcluster
CHANGED /opt/sge6-fresh TO /opt/sge6


*** FOR THE CONTINUATION, SEE:
apps.starcluster.xsl
[Mon 2011:05:02 01:04:47 EST] INSTALLED STARCLUSTER ON 8e AND STARTED smallcluster

</entry>

<entry [Sun 2011:05:01 01:23:53 EST] COPIED /data/sequence (hg19 bowtie AND samtools) TO 8e>

cd /data
tar cvfz sequence.tar.gz sequence

scp -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
sequence.tar.gz \
root@ec2-50-19-38-136.compute-1.amazonaws.com:/data

    
</entry>

<entry [Sat 2011:04:30 21:29:12 EST] INSTALLED 'ENVIRONMENT MODULES' ON 8e>

mkdir -p /usr/share/modules
cd /usr/share/modules
wget http://sourceforge.net/projects/modules/files/Modules/modules-3.2.8/modules-3.2.8a.tar.gz/download

ERROR LOOKING FOR TCL ON CONFIGURE:
./configure

    ...
    checking for Tcl configuration (tclConfig.sh)... not found
    checking for Tcl version... 8.5
    checking TCL_VERSION... 8.5
    checking TCL_LIB_SPEC... configure: error: TCL_LIB_SPEC not found, need to use --with-tcl-li



</entry>

<entry [Sat 2011:04:30 21:07:07 EST] COPIED syoung PROJECT DIRECTORIES WITH INPUT FILES TO AQUARIUS-8e>

cd /nethome/syoung/agua
tar cvfz syoung-agua-home.tar.gz * --exclude=chr22

scp -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
syoung-agua-home.tar.gz \
root@ec2-50-19-38-136.compute-1.amazonaws.com:/nethome/syoungll
    
    
</entry>

<entry [Sat 2011:04:30 18:29:11 EST] FIXED MYSQL WON'T START>

PROBLEM:

service mysql start
     * Starting MySQL database server mysqld                  [fail] 


NO FILE IN /var/run/mysqld AND PERMISSIONS MESSED UP.


GET THE FOLLOWING ERRORS IN /var/log/daemon.log ON /etc/init.d/mysql start:

    Apr 30 22:34:17 ip-10-124-231-156 /etc/init.d/mysql[23142]: 0 processes alive and '/usr/bin/mysqladmin --defaults-file=/etc/mysql/debian.cnf ping' resulted in
    Apr 30 22:34:17 ip-10-124-231-156 /etc/init.d/mysql[23142]: #007/usr/bin/mysqladmin: connect to server at 'localhost' failed
    Apr 30 22:34:17 ip-10-124-231-156 /etc/init.d/mysql[23142]: error: 'Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)'
    Apr 30 22:34:17 ip-10-124-231-156 /etc/init.d/mysql[23142]: Check that mysqld is running and that the socket: '/var/run/mysqld/mysqld.sock' exists!


THEN AFTER CREATED FILE /var/run/mysqld/mysqld.sock WITH CORRECT PERMISSIONS:

    Apr 30 22:34:17 ip-10-124-231-156 /etc/init.d/mysql[23142]:
    Apr 30 22:36:38 ip-10-124-231-156 /etc/init.d/mysql[23337]: 0 processes alive and '/usr/bin/mysqladmin --defaults-file=/etc/mysql/debian.cnf ping' resulted in
    Apr 30 22:36:38 ip-10-124-231-156 /etc/init.d/mysql[23337]: #007/usr/bin/mysqladmin: connect to server at 'localhost' failed
    Apr 30 22:36:38 ip-10-124-231-156 /etc/init.d/mysql[23337]: error: 'Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (111)'
    Apr 30 22:36:38 ip-10-124-231-156 /etc/init.d/mysql[23337]: Check that mysqld is running and that the socket: '/var/run/mysqld/mysqld.sock' exists!


SOLUTION:

PURGE-REMOVE mysql-server and mysql-client THEN REINSTALL:

sudo apt-get --purge remove mysql-server mysql-client

 sudo apt-get install mysql-server mysql-clientReading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  mysql-client mysql-server
0 upgraded, 2 newly installed, 0 to remove and 165 not upgraded.
Need to get 0B/190kB of archives.
After this operation, 262kB of additional disk space will be used.
Selecting previously deselected package mysql-client.
(Reading database ... 88761 files and directories currently installed.)
Unpacking mysql-client (from .../mysql-client_5.1.41-3ubuntu12.10_all.deb) ...
Selecting previously deselected package mysql-server.
Unpacking mysql-server (from .../mysql-server_5.1.41-3ubuntu12.10_all.deb) ...
Setting up mysql-client (5.1.41-3ubuntu12.10) ...
Setting up mysql-server (5.1.41-3ubuntu12.10) ...


AND PERL DBD::mysql WORKS!

root@ip-10-124-231-156:/var/log# perl -e 'use DBD::mysql'



BUT WON'T START:


sudo -u mysql mysqld

    110430 23:15:12 [Note] Plugin 'FEDERATED' is disabled.
    110430 23:15:12  InnoDB: Started; log sequence number 0 1382550
    110430 23:15:12 [ERROR] Column count of mysql.db is wrong. Expected 22, found 20. Created with MySQL 50077, now running 50141. Please use mysql_upgrade to fix this error.
    110430 23:15:12 [ERROR] mysql.user has no `Event_priv` column at position 29
    110430 23:15:12 [ERROR] Event Scheduler: An error occurred when initializing system tables. Disabling the Event Scheduler.
    110430 23:15:12 [Note] mysqld: ready for connections.
    Version: *'5.1.41-3ubuntu12.10'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  (Ubuntu)



DISCOVERED PORT 3306 WAS BLOCKED BY DEFAULT. OPENED UP BY CREATING A /etc/mysql/my.cnf FILE:

emacs /etc/mysql/my.cnf
    [mysqld]
    user = mysql
    pid-file = /var/run/mysqld/mysqld.pid
    socket = /var/run/mysqld/mysqld.sock
    port = 3306
    basedir = /usr
    datadir = /var/lib/mysql
    tmpdir = /tmp
    bind-address = localhost


... AND RESTARTED mysqld:

sudo -u mysql mysqld

    110430 23:53:34 [Note] Plugin 'FEDERATED' is disabled.
    110430 23:53:34  InnoDB: Started; log sequence number 0 1382628
    110430 23:53:34 [ERROR] Column count of mysql.db is wrong. Expected 22, found 20. Created with MySQL 50077, now running 50141. Please use mysql_upgrade to fix this error.
    110430 23:53:34 [ERROR] mysql.user has no `Event_priv` column at position 29
    110430 23:53:34 [ERROR] Event Scheduler: An error occurred when initializing system tables. Disabling the Event Scheduler.
    110430 23:53:34 [Note] mysqld: ready for connections.
    Version: '5.1.41-3ubuntu12.10'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  (Ubuntu)

WHICH GAVE A RUNNING INSTANCE OF MYSQL:

ps aux | grep mysql
    mysql    27450 91.9  0.2 136320 21172 pts/1    Sl+  23:53   0:25 mysqld
    mysql    27491  0.1  0.2 108696 17584 ?        Ssl  23:53   0:00 /usr/sbin/mysqld
    root     27522  0.0  0.0   7620   912 pts/0    S+   23:54   0:00 grep mysql


AND RAN mysql_upgrade


mysql_upgrade -u root -p
Enter password: 
Looking for 'mysql' as: mysql
Looking for 'mysqlcheck' as: mysqlcheck
Running 'mysqlcheck with default connection arguments
Running 'mysqlcheck with default connection arguments
    agua.access                                        OK
    agua.aguausers                                     OK
    agua.app                                           OK
    agua.diffs                                         OK
    agua.diffs244079                                   OK
    agua.etcgroup                                      OK
    agua.groupmember                                   OK
    agua.groups                                        OK
    agua.monitor                                       OK
    agua.parameter                                     OK
    agua.project                                       OK
    agua.report                                        OK
    agua.sessions                                      OK
    agua.source                                        OK
    agua.stage                                         OK
    agua.stagejob                                      OK
    agua.stageparameter                                OK
    agua.users                                         OK
    agua.view                                          OK
    agua.workflow                                      OK
    agua.workflowparameter                             OK
    mysql.columns_priv                                 OK
    mysql.db                                           OK
    mysql.event                                        OK
    mysql.func                                         OK
    mysql.general_log
    Error    : You can't use locks with log tables.
    status   : OK
    mysql.help_category
    error    : Table upgrade required. Please do "REPAIR TABLE `help_category`" or dump/reload to fix it!
    mysql.help_keyword
    error    : Table upgrade required. Please do "REPAIR TABLE `help_keyword`" or dump/reload to fix it!
    mysql.help_relation                                OK
    mysql.help_topic
    error    : Table upgrade required. Please do "REPAIR TABLE `help_topic`" or dump/reload to fix it!
    mysql.host                                         OK
    mysql.ndb_binlog_index                             OK
    mysql.plugin                                       OK
    mysql.proc
    error    : Table upgrade required. Please do "REPAIR TABLE `proc`" or dump/reload to fix it!
    mysql.procs_priv                                   OK
    mysql.servers                                      OK
    mysql.slow_log
    Error    : You can't use locks with log tables.
    status   : OK
    mysql.tables_priv                                  OK
    mysql.time_zone                                    OK
    mysql.time_zone_leap_second                        OK
    mysql.time_zone_name
    error    : Table upgrade required. Please do "REPAIR TABLE `time_zone_name`" or dump/reload to fix it!
    mysql.time_zone_transition                         OK
    mysql.time_zone_transition_type                    OK
    mysql.user                                         OK
    tutorial_sample.dummy                              OK
    
    Repairing tables
    mysql.help_category                                OK
    mysql.help_keyword                                 OK
    mysql.help_topic                                   OK
    mysql.proc                                         OK
    mysql.time_zone_name                               OK
    Running 'mysql_fix_privilege_tables'...
    OK
    

SO LOGGED INTO MYSQL AND REPAIRED THE TABLES:

REPAIR TABLE `help_category`;
REPAIR TABLE `help_keyword`;
REPAIR TABLE `help_topic`;
REPAIR TABLE `proc`;
REPAIR TABLE `time_zone_name`;

    +---------------------+--------+----------+----------+
    | Table               | Op     | Msg_type | Msg_text |
    +---------------------+--------+----------+----------+
    | mysql.help_category | repair | status   | OK       |
    +---------------------+--------+----------+----------+
    ...


THEN RERAN mysql_upgrade:

mysql_upgrade -u root -p
    Enter password: 
    Looking for 'mysql' as: mysql
    Looking for 'mysqlcheck' as: mysqlcheck
    This installation of MySQL is already upgraded to 5.1.41, use --force if you still need to run mysql_upgrade


NOW MYSQL 5.1.41 IS LISTENING ON PORT 3306:

root@ip-10-124-231-156:/var/log# telnet localhost 3306
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
A
5.1.41-3ubuntu12.10-:<[9F8$!inkR8^PXIFb^CConnection closed by foreign host.


NOTE: /etc/mysql/debian.cnf IS AUTOMATICALLY GENERATED:

emacs /etc/mysql/debian.cnf 
    # Automatically generated for Debian scripts. DO NOT TOUCH!
    [client]
    host     = localhost
    user     = debian-sys-maint
    password = jGltZfKDSQ9Bxmpv
    socket   = /var/run/mysqld/mysqld.sock
    [mysql_upgrade]
    host     = localhost
    user     = debian-sys-maint
    password = jGltZfKDSQ9Bxmpv
    socket   = /var/run/mysqld/mysqld.sock
    basedir  = /usr


GOT ERROR IN /var/log/daemon.log ABOUT debian-sys-maint PASSWORD:
    
    Upgrading MySQL tables if necessary.
    /usr/bin/mysql_upgrade: the '--basedir' option is always ignored
    Looking for 'mysql' as: /usr/bin/mysql
    Looking for 'mysqlcheck' as: /usr/bin/mysqlcheck
    Running 'mysqlcheck' with connection arguments: '--host=localhost' '--socket=/var/run/mysqld/mysqld.sock' '--host=localhost' '--socket=/var/run/mysqld/mysqld.sock'
    /usr/bin/mysqlcheck: Got error: 1045: Access denied for user 'debian-sys-maint'@'localhost' (using password: YES) when trying to connect
    FATAL ERROR: Upgrade failed
    Checking for insecure root accounts.


THIS SHOWS HOW TO FIX THAT


http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=459764
I resolved this by resetting the debian-sys-maint password:

mysql -u root -p mysql
...
set password for 'debian-sys-maint'@'localhost'=$password

were $password is the one listed in /etc/mysql/debian.cnf.


WHICH WOULD ALSO FIX THE PROBLEM OF NOT BEING ABLE TO SHUT DOWN mysqld:


e: can't shutdown mysqld
Well, solved this my self. Turns out a while back I had destroyed the debian-sys-maint user account when I imported a DB from a server that was running CentOS. 

On Debian systems, this user apparently shuts down the DB, and various other maintenance stuff.

The solution was to simply recreate the user with:

Code:
GRANT ALL PRIVILEGES ON *.* TO 'debian-sys-maint'@'localhost' IDENTIFIED BY '<password>' WITH GRANT OPTION;


You do NOT need to grant all permissions, this is a bad habit to get into from a security standpoint.

All you need to grant is this (as root or whoever):

GRANT SHUTDOWN ON *.* TO 'debian-sys-maint'@'localhost';
GRANT SELECT ON `mysql`.`user` TO 'debian-sys-maint'@'localhost';

Because it needs to shutdown/startup, and does a test select from the users table as a sanity check to ensure the root user exists. This select is usually done by /usr/share/mysql/debian-start.inc.sh which is loaded by /etc/mysql/debian-start


SO RECREATED debian-sys-maint USER:

mysql -u root -p mysql
CREATE USER 'debian-sys-maint'@'localhost' IDENTIFIED BY 'jGltZfKDSQ9Bxmpv';
GRANT SHUTDOWN ON *.* TO 'debian-sys-maint'@'localhost';
GRANT SELECT ON `mysql`.`user` TO 'debian-sys-maint'@'localhost';

AND CAN NOW STOP AND START USING /etc/init.d/mysql

    OK!!!!


NOTES
-----

THIS DOESN'T FIX ERROR BUT DID IT ANYWAY:

sudo mkdir /var/run/mysqld/
sudo touch /var/run/mysqld/mysqld.sock
sudo chown -R mysql /var/run/mysqld/


apt-cache policy mysql-client

mysql-client:
  Installed: (none)
  Candidate: 5.1.41-3ubuntu12.10
  Version table:
     5.1.41-3ubuntu12.10 0
        500 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid-updates/main Packages
     5.1.41-3ubuntu12.7 0
        500 http://security.ubuntu.com/ubuntu/ lucid-security/main Packages
     5.1.41-3ubuntu12 0
        500 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid/main Packages





http://www.linuxquestions.org/questions/linux-server-73/cant-connect-to-local-mysql-server-through-socket-var-run-mysqld-mysqld-sock-753632/

The first error (2 -> No such file or directory ) comes from the fact that you have no mysql server running on localhost.

The second one (111 -> Connection refused) shows that either mysql port is blocked (firewall for instance) or that no mysql server is running on forums.domain.com.



if [ ! -f /etc/mysql/my.cnf ]; then echo " " > /etc/mysql/my.cnf; fi
if [ ! -f /etc/mysql/debian.cnf ]; then echo " " > /etc/mysql/debian.cnf; fi
rm -fr /var/run/mysqld/mysqld.sock
chown -R mysql:mysql /var/run/mysql /var/run/mysqld


http://anthologyoi.com/computers/cant-connect-to-local-mysql-server-through-socketerror.html

I recently moved my /home folder to its own partition, but in doing so, I broke MySQL. The full error I got was:

Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)

To fix this you need to create the file and make sure that MySQL has access to it. (All commands need to be run as root)

Create the directory (if it doesn’t already exist).

sudo mkdir /var/run/mysqld/
Create the file by “touching” it.

sudo touch /var/run/mysqld/mysqld.sock
Set the ownership of the mysqld.sock file and folder to mysql.

sudo chown -R mysql:mysql /var/run/mysqld/
You can then start MySQL and breath easier.

    
    
    
    
</entry>

<entry [Fri 2011:04:29 16:38:52 EST] FINISHED TESTING Init.pm ON AQUARIUS-8e (LARGE)>

CREATE INSTANCE 8e

ssh -v -i /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius \
root@ec2-50-19-38-136.compute-1.amazonaws.com


    RESERVATION	r-476e942b	558277860346	default
    INSTANCE	i-b63811d9	ami-b07985d9 ec2-50-19-38-136.compute-1.amazonaws.com	ip-10-124-231-156.ec2.internal	running	aquarius	0		m1.large	2011-04-29T19:47:09+0000	us-east-1a	aki-0b4aa462			monitoring-disabled	50.19.38.136	10.124.231.156			ebs					paravirtual	xen		sg-0a0da063	default
    BLOCKDEVICE	/dev/sda1	vol-ef78if [ ! -d /etc/mysql/my.cnf ]; then echo " " > /etc/mysql/my.cnf; done;
bc84	2011-04-29T19:47:30.000Z	


TEST init.pl

echo '{"username":"agua","mode":"init","data":{"username":"admin","amazonuserid":"728213020069","datavolume":"snap-55fe4a3f","uservolume":" New volume","datavolumesize":40,"uservolumesize":100,"datavolumecheckbox":0,"uservolumecheckbox":0,"ec2publiccert":"-----BEGIN CERTIFICATE-----MIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlkC/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}}' | ./init.cgi



/agua/0.6/bin/apps/cluster/starcluster.pl copyConfig \
--username admin


/agua/0.6/bin/apps/cluster/starcluster.pl generateKeypair \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--keyname admin-key \
--username admin


/agua/0.6/bin/apps/cluster/starcluster.pl writeConfigfile \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--amazonuserid 728213020069 \
--accesskeyid AKIAIZXZ6S7ARZ44TTHQ \
--secretaccesskey 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 \
--keyname admin-key \
--username admin


    OK
    
    
WILL USE Conf::Starcluster.pm TO ADD CLUSTER NAMES TO THIS FILE AS USER CREATES THEM IN THE Admin PANE Cluster PANEL.


NOTES
-----

GOT getcwd PROBLEM WHEN RUNNING install.pl:

    sh: getcwd() failed: No such file or directory


DIAGNOSIS:

http://web.archiveorange.com/archive/v/LLXmLjVafC1zNl1nlUIb

This error occurs if you run a command in a directory which no longer exists. To reproduce it, do the following:
Make an empty dir called bugreprod in your home directory and cd into it.
Now, open Nautilus and delete the directory.
Run 'sudo apt-get update' or any other command in the shell which is in the non-existant directory, and you will get this error.

I think this is a problem with your system, and not with bash or apport.



DID THE FOLLOWING:

    1. CREATED LINK
    ln -s /bin/pwd /usr/bin/getcwd

    2. CREATED LINK 
    ln -s /bin/pwd /bin/getcwd

    3. REMOVED EXTRANEOUS "." AT BOTTOM OF .bash_profile



</entry>


