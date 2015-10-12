projects.agua.archive.1

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

apt-get install apache2-mpm-prefork
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


<entry [Sat 2011:03:12 22:54:43 EST] CREATED DOMAIN aguadev.org>

1. BOUGHT ON GODADDY

2. FORWARDED TO LINODE DNS SERVERS BY CHANGING 
	
NS69.DOMAINCONTROL.COM 
NS70.DOMAINCONTROL.COM 

TO THIS

ns1.linode.com
ns2.linode.com
ns3.linode.com
ns4.linode.com

3. SET DOMAIN NAME ON LINODE:

SEE http://library.linode.com/linode-manager/configuring-dns-with-the-linode-manager:

Log into the Linode Manager and click the "DNS Manager" tab. You'll see an empty zone list.

Click "Add a new domain zone" and enter 'aguadev.org', then click OK.

Enter the SOA email address: aguadev@gmail.com


???? 4. SET THE DOMAIN'S REVERSE DNS:

NB: use the whole domain name, including the 'www':
www.stuartpyoung.com

This concludes basic DNS configuration for your domain. If desired, you may also use the "Reverse DNS" link on the "Remote Access" tab in the Linode Manager to set the reverse DNS entry for your Linode's IP address:

Linodes --> Click on 'linode31455' --> Remote Access --> Network Access --> Reverse DNS


Reverse DNS

	Current Reverse DNS
	173.230.142.248	www.stuartpyoung.com

	Perform a forward lookup




	
</entry>




<entry [Thu Feb 24 23:11:20 EST 2011] ADDED NEW JBROWSE DATA TO AQUARIUS-7>

	COPIED hg18-MINI DATA TO /data/apps/jbrowse/species/human/hg19/data ON AQUARIUS-7
	
	View.js WILL LINK FROM THESE STATIC FILES TO USER ViewName DIRECTORIES INSIDE JBROWSE
	
	/data/apps/jbrowse/username/species/human/hg19/data
	
	DYNAMIC (USER-CREATED) FILES IN VIEWS WILL BE LINKED FROM JBROWSE PIPELINE
	
	OUTPUT DIR IN THE USERS' PROJECT DIRECTORY:
	
	Project1/View1/data/tracks/chr1/mydata

		--> 	/data/apps/jbrowse/username/species/human/hg19/data/tracks/chr1/mydata

	refSeq.js AND trackInfo.js FILES WILL BE GENERATED ANEW EACH TIME A NEW
	
	FEATURE TRACK IS ADDED
	
	
	NB: OLD JSON (INCOMPATIBLE) ARE HERE:
	/root/base/apps/jbrowse/jbrowse/data/

		
</entry>

<entry [Thu Feb 24 13:50:42 EST 2011] NEW REPORT POLICY: REMOVE report TABLE, REPORTS ARE INTERACTIVELY CONFIGURABLE STAGES>

	- DO AWAY WITH SEPARATE report TABLE TO AVOID LATER COMPLICATIONS
	
	- Report.pm RUNS APPLICATION WITH SPECIFIED PARAMETERS. NEXT, THE 
	
		REPORT WRAPPER DOES THE FOLLOWING:

			-	PASS ALL OR PORTIONS OF THE OUTPUTFILE TO Report.js CLASS
				(NUMBER OF LINES WITH OFFSET, Report.js KNOWS MAX LINES)
				
			-	AT ANY ONE TIME, THE CLIENT ONLY HAS < MAXLINES > IN MEMORY

	- VIEWS REMAIN A SEPARATE ENTITY BECAUSE THEY ARE DIFFERENT SAMPLES OF
	
		A STATIC DATA SET.
	
	VIEW SUMMARY:	

	1. VIEWS BELONG TO PROJECTS AND THEREFORE TO GROUPS

	1. ALL VIEWS HAVE ACCESS TO STATIC FEATURES (CAN BE DE/SELECTED)
		
	2. EACH VIEW HAS A COLLECTION OF DYNAMIC FEATURES
		
			GENERATED FROM OUTPUT FILES FROM ONE OR MORE WORKFLOWS
			
			GENERATED FROM UCSC FILES
	
			OTHER FILES UPLOADED BY THE USER
		
	3. FOR EACH VIEW, JBROWSE IS POINTED TO A SPECIFIC VIEW FOLDER, E.G.:
		
		/nethome/jgilbert/agua/Project1/View1
		
		WHICH CONTAINS:
		
			-	LINKS TO STATIC FEATURES STORED IN /data/jbrowse
		
				(LISTED IN viewstatic TABLE WHICH CONTAINS ALL STATIC FEATURES)
				
			-	USER-GENERATED FEATURE FILES IN JBROWSE FORMAT
				
				-	FILES RESIDE IN A FOLDER NAMED AFTER THE VIEW INSIDE
				
					THE USER'S PROJECT DIRECTORY
			
				-	JBROWSE FORMAT .json FILES GENERATED FROM GENOMIC FEATURE DATA
				
				-	LISTED IN viewdynamic TABLE WHICH CONTAINS ALL DYNAMIC FEATURES
				
				ORGANISED BY SPECIES AND BUILD)

			- 	THE PARTICULAR COMBINATION OF STATIC AND DYNAMIC FEATURES
			
				FOR EACH VIEW IS LISTED IN THE viewfeature TABLE
		
			-	TAILOR-MADE names.json FILE INFORMING JBROWSE WHICH FEATURES
			
				ARE PRESENT IN THIS VIEW 
				
			-	names.json FILE IS UPDATED EVERY TIME A FEATURE (DYNAMIC OR STATIC)
			
				IS ADDED OR REMOVED
			
</entry>

<entry [Thu Feb 24 13:41:18 EST 2011] DOJO WIDGET CONSTRUCTION METHODS>

// Any initialization code would go here in the constructor.
// plugins.report.Template and its superclasses dijit._Widget and
// dijit._Templated do not have parameters in their constructors, so
// there wouldn't be any multiple-inheritance complications
// if you were to include some paramters here.
constructor : function (args) {
	console.log("SNP.constructor    plugins.report.SNP.constructor(args)");
	
	this.project = args.project;
	this.workflow = args.workflow;
	this.filename = args.filename;

	console.log("SNP.constructor    this.project: " + this.project);
	console.log("SNP.constructor    this.workflow: " + this.workflow);
	console.log("SNP.constructor    this.filename: " + this.filename);
},



//Inherited from dijit._Widget and called just before template
//instantiation in buildRendering. This method is especially useful
//for manipulating the template before it becomes visible.
postMixInProperties: function() {
	console.log("SNP.postMixInProperties    plugins.report.SNP.postMixInProperties()");
	//this.popup = new dijit.Dialog({});
	console.log("SNP.postMixInProperties    this.containerNode: " + this.containerNode);

},


//You can override this method to manipulate widget once it is
//placed in the UI, but be warned that any child widgets contained
//in it may not be ready yet.        
postCreate: function() {
	console.log("SNP.postCreate    plugins.report.SNP.postCreate()");
	console.log("SNP.postCreate    this.containerNode: " + this.containerNode);
	console.log("SNP.postCreate    this.domNode: " + this.domNode);

	this.startup();
},




</entry>
<entry [Thu Feb 17 11:13:33 EST 2011] KOMODO SUPPORTS REPLACEMENT USING MATCHED STRING (SUBSTITUTION REGEX)>

http://docs.activestate.com/komodo/4.4/regex-intro.html


USE FOR REFACTORING Cluster ROLES


Substitution: Searching and Replacing

Regular expressions can be used as a "search and replace" tool. This aspect of regex use is known as substitution.

There are many variations in substitution syntax depending on the language used. This primer uses the "/search/replacement/modifier" convention used in Perl. In simple substitutions, the "search" text will be a regex like the ones we've examined above, and the "replace" value will be a string:

For example, to search for an old domain name and replace it with the new domain name:

Regex Substitution:
s/http:\/\/www\.old-domain\.com/http://www.new-domain.com/
Search for:
http://www.old-domain.com
Replace with:
http://www.new-domain.com
Notice that the "/" and "." characters are not escaped in the replacement string. In replacement strings, they do not need to be. In fact, if you were to preceed them with backslashes, they would appear in the substitution literally (i.e. "http:\/\/www\.new-domain\.com").

The one way you can use the backslash "\" is to put saved matches in the substitution using "\num". For example:

Substitution Regex:
s/(ftp|http):\/\/old-domain\.(com|net|org)/\1://new-domain.\2/
Target Text:
http://old-domain.com
Result:
http://new-domain.com
This regex will actually match a number of URLs other than "http://old-domain.com". If we had a list of URLs with various permutations, we could replace all of them with related versions of the new domain name (e.g. "ftp://old-domain.net" would become "ftp://new-domain.net"). To do this we need to use a modifier.

Modifiers

Modifiers alter the behavior of the regular expression. The previous substitution example replaces only the first occurence of the search string; once it finds a match, it performs the substitution and stops. To modify this regex in order to replace all matches in the string, we need to add the "g" modifier.

Substitution Regex:
/(ftp|http):\/\/old-domain\.(com|net|org)/\1://new-domain.\2/g
Target Text:
http://old-domain.com and ftp://old-domain.net
Result:
http://new-domain.com and ftp://new-domain.net
The "i" modifier causes the match to ignore the case of alphabetic characters. For example:

Regex:
/ActiveState\.com/i
Matches:
activestate.com
ActiveState.com
ACTIVESTATE.COM
Modifier Summary

Modifier	Meaning
i	Ignore case when matching exact strings.
m	Treat string as multiple lines. Allow "^'' and "$'' to match next to newline characters.
s	Treat string as single line. Allow ".'' to match a newline character.
x	Ignore whitespace and newline characters in the regular expression. Allow comments. 
o	Compile regular expression once only.
g	Match all instances of the pattern in the target string.



</entry>

<entry [Wed Feb 16 12:57:06 EST 2011] SELECT ONCLICK>

http://forums.linuxmint.com/viewtopic.php?f=49&t=63957

http://forums.linuxmint.com/styles/linux-mint/template/forum_fn.js

<!--

<dl>
    <dt>
        Code:
        <a href="#" onclick="selectCode(this); return false;">Select all</a>
    </dt>
    <dd>
        <code>
            WHAT WE WANT TO SELECT
        </code>
    </dd>
</dl>

function selectCode(a)
{
	// Get ID of code block
	var e = a.parentNode.parentNode.getElementsByTagName('CODE')[0];

	// Not IE
	if (window.getSelection)
	{
		var s = window.getSelection();
		// Safari
		if (s.setBaseAndExtent)
		{
			s.setBaseAndExtent(e, 0, e, e.innerText.length - 1);
		}
		// Firefox and Opera
		else
		{
			var r = document.createRange();
			r.selectNodeContents(e);
			s.removeAllRanges();
			s.addRange(r);
		}
	}
	// Some older browsers
	else if (document.getSelection)
	{
		var s = document.getSelection();
		var r = document.createRange();
		r.selectNodeContents(e);
		s.removeAllRanges();
		s.addRange(r);
	}
	// IE
	else if (document.selection)
	{
		var r = document.body.createTextRange();
		r.moveToElementText(e);
		r.select();
	}
}

-->


</entry>

<entry [Wed Feb 16 01:02:56 EST 2011] SUBSCRIBE TO AGUA MAILINGS LISTS>


Mailing Lists:
Three mailing lists are provided for people interested in Unison. It is strongly recommended that regular Unison users subscribe to one of the first two:
unison-announce is a moderated list where new Unison releases are announced. It is very low volume, averaging less than one message per month.
To subscribe, you can either visit http://groups.yahoo.com/group/unison-announce (you will be asked to create a Yahoo groups account if you do not already have one), or else send an email to unison-announce-subscribe@groups.yahoo.com (which will simply add you to the list, whether you have a Yahoo account or not).

unison-users is a higher-volume discussion forum for users of unison. It is used for discussions of many sorts --- proposals and designs for new features, installation and configuration questions, usage tips, etc. It is also moderated, but just to filter spam.
To subscribe, you can either visit http://groups.yahoo.com/group/unison-users or else send an email to unison-users-subscribe@groups.yahoo.com.

Release announcements are made on both of these lists, so there is no need to subscribe to both.

unison-hackers is for informal discussion among Unison developers. Anyone who considers themselves a Unison expert and wishes to lend a hand with maintaining and improving Unison is welcome to join. This list is also where commit logs are posted for the developer sources. Only members can post.
To subscribe, you can either visit http://lists.seas.upenn.edu/mailman/listinfo/unison-hackers or else send an email to unison-hackers-subscribe at lists dot seas dot upenn dot edu.

Archives of all the lists are available (and publically visible) via the above links. 

Reporting bugs:
If Unison is not working the way you expect, here are some steps to follow.
First, take a look at the Unison documentation, especially the FAQ section. Lots of questions are answered there.
Next, try running Unison with the "-debug all" command line option. This will cause Unison to generate a detailed trace of what it's doing, which may help pinpoint where the problem is occurring.
If this doesn't clarify matters, try sending an email describing your problem to the users list at unison-users@groups.yahoo.com. (Make sure you subscribe first, so that you'll see people's responses in case they reply only to the list!) Please include the version of Unison you are using (unison -version), the kind of machine(s) you are running it on, a record of what gets printed when the "-debug all" option is included, and as much information as you can about what went wrong.
Feature Requests:
Please post your feature requests, suggestions, etc. to unison-users@groups.yahoo.com. 


</entry>



<entry [Mon Jan 31 21:53:33 EST 2011] CHANGING USERS' PASSWORDS>


		NB: DON'T NEED TO IF USE passwd WITH stdin (NOT TERRIBLY SECURE):
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

<entry [Mon Jan 31 21:52:33 EST 2011] SETTING APACHE UMASK>


AS ROOT ADD umask 0002 TO 

/root/.bashrc 
 
 



http://serverfault.com/questions/6895/whats-the-best-way-of-handling-permissions-for-apache2s-user-www-data-in-var-w

On debian i had to modify /root/.bashrc umask also to 0002, or www-data won't have a proper umask by just editing umask in /etc/profile .



here's a -R recursive option, but that won't discriminate between files and folders, so you have to use find, like so:

find /var/www -type d -exec chmod 2775 {} \;

Change all the files to 0664

find /var/www -type f -exec chmod 0664 {} \;

Change the umask for your users to 0002

The umask controls the default file creation permissions, 0002 means files will have 664 and directories 775. Setting this (by editing the umask line at the bottom of /etc/profile in my case) means files created by one user will be writable by other users in the www-group without needing to chmod them.




</entry>

<entry [Mon Jan 31 21:51:33 EST 2011] WORKFLOW COMBO BOX STYLING>


dojo.provide("plugins.core.ComboBox");

// MODIFICATION OF dijit.form.ComboBox TO ALLOW STYLING OF THE
// DROPDOWN COMBO BOX POPUP:
//
// 1. DEFAULT STYLES ARE AS IN dijit.form.ComboBox.
//
// 2. ADJUST STYLES PROGRAMMATICALLY USING:
//
// comboBox.popupClass = "myClass dijitReset dijitMenu"
// 
// ADJUST HEIGHT OF MENU ITEMS TO MATCH YOUR STYLE:
//
// comboBox.itemHeight = 25;
//
//
//	E.G.:
//
//		this.groupCombo.popupClass = "groupusers groupCombo dijitReset dijitMenu";
//		this.groupCombo.wrapperClass = "groupusers dijitPopup";
//		this.groupCombo.itemHeight = 30;
//
// 3. ADD THE FOLLOWING CSS:
// 
//	/* NOTE: THIS IS NECESSARY FOR THE NEXT RULE TO WORK!!! */
// .groupusers .groupCombo .dijitReset .dijitMenu li,
// .groupusers .groupCombo .dijitReset .dijitMenuItem li
// {
// 	/*color: #0FF !important;*/
// }
// .groupusers .dijitMenu li,
// .groupusers .dijitMenuItem li
// {
// 	color: #224 !important;
// 	height: 25px;
// }



</entry>

<entry [Mon Jan 31 21:50:33 EST 2011] RATIONALE FOR USING SETUID RELAY WITH STDIN AS INPUT (RATHER THAN ARGUMENTS)>

 THIS WORKED OKAY FOR SMALL INPUTS BUT GAVE THIS ERROR ON LARGE INPUT:
 perl -U admin.cgi < t/admin-saveApp-runmaq-outputdir.json
 sh: -c: line 0: syntax error near unexpected token `('
 sh: -c: line 0: `perl -w /data/agua/0.3/cgi-bin/relay.pl ...

	print "BEFORE fluff input: \n" if $DEBUG;
	print "$input\n" if $DEBUG;
	
	#### FLUFF UP INPUT WITH QUOTES AND SLASHES FOR NEXT INPUT ROUND
	#### TURN THIS:
	#### echo {"mode":"login","username":"syoung","password":"anyold"}
	#### INTO THIS:
	#### echo \"{\\\"mode\\\":\\\"login\\\",\\\"username\\\":\\\"syoung\\\",\\\"password\\\":\\\"anyold\\\"}\"
	
	$input =~ s/"/\\\\\\\"/g;
	$input = qq{\\"$input\\"};
	#$input =~ s/"/\\"/g;
	#$input =~ s/^\s*(echo\s+)(\S+)(\s+.+)$/$1"$2"$3/;
	print "AFTER fluff input: \n" if $DEBUG;
	print "$input\n" if $DEBUG;
    


</entry>

<entry [Mon Jan 31 21:50:33 EST 2011] CREATED agua.c TO FIX INABILITY TO RUN A SUID SCRIPT ON UBUNTU>

CREATE C PROGRAM TO DEESCALATE BY ABSORBING SUID BIT

cd /var/www/cgi-bin/agua/0.5
gcc wrap.c -o wrap
set wrap

gcc
RUN AS ROOT

echo '{"username":"syoung","sessionId":"1228791394.7868.158","mode":"addUser","data":{"username":"aaa"}}' | ./wrap

    whoami: root

RUN AS APACHE

su www-data
echo '{"username":"syoung","sessionId":"1228791394.7868.158","mode":"addUser","data":{"username":"aaa"}}' | ./agua

    whoami: root


FULL SCRIPT:


<!--

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <strings.h>
#include <string.h>

int gid;

/* main(int argc, char **argv) - main process loop */
int main(int argc, char **argv)
{
    /* Set euid and egid to actual user */
    gid = getgid();
    setegid(getgid());
    seteuid(getuid());
    
    /* Set uid, gid, euid and egid to root */    
    setegid(0);
    seteuid(0);
    setgid(0);
    setuid(0);

    int c;
    int nc = 0;   
    char *input;
    while ( (c = getchar()) != EOF )
    {
        if ( c == '\n' || c == '\r' )
        {
            break;
        }

      input[nc] = (char)c;
        nc++;
    }
    /* Terminate string with null character: */
    input[nc] = '\0';
    
    printf("strlen(input):  %d\n", strlen(input));    
    printf("Number of characters in input = %d\n", nc);
    int i;
    for ( i = 0; i < nc; i++ )
    {
        printf("%c", input[i]);
    }
    
    char command[] = "";
    strcat(command, "echo  '");
    strcat(command, input);
    strcat(command, "' | ");
    strcat(command, "/var/www/cgi-bin/agua/0.5/admin.pl");

    return 0;
}

-->



CAN'T USE PERL SUID BECAUSE OF THIS ERROR:
    
./test.cgi

    test.cgi    whoami: root
    test.cgi     setown_command: chown root:root target.pl
    test.cgi    targetfile: target.pl

    YOU HAVEN'T DISABLED SET-ID SCRIPTS IN THE KERNEL YET!
    FIX YOUR KERNEL, OR PUT A C WRAPPER AROUND THIS SCRIPT!


ll target.pl 
    -rwxr-xr-x 1 agua agua 296 2011-02-14 01:53 target.pl


ll  test.cgi
-rwsr-sr-x 1 syoung syoung 876 2011-02-15 00:22 test.cgi

./test.cgi

    test.cgi    whoami: root
    test.cgi     setown_command: chown root:root target.pl
    test.cgi    targetfile: target.pl
    target.pl    whoami: root

ll target.pl 

    -rwsr-sr-x 1 root root 296 2011-02-14 01:53 target.pl


SO WILL DO THE chown ON THE RELAY SCRIPT BUT, IN THE CASE
OF admin.cgi --> putrelay.pl --> admin.pl, THE FINAL SCRIPT
CANNOT RUN THE addgroup COMMAND




CREATED WRAPPER WITH HELP FROM THIS:
http://linuxshellaccount.blogspot.com/2007/12/securing-suid-programs-using-simple-c.html


TEST getchar TO AVOID STRANGE SYMBOLS AT END:

emacs getchar.c

        ...
        buffer[i] = (char)ch;

    ...
   /* Terminate string with null character: */
   buffer[i] = '\0';
    ...

gcc -o getchar getchar.c

echo '{"username":"syoung","sessionId":"1228791394.7868.158","mode":"addUser","data":{"username":"aaa"}}' | ./getchar



TEST SUID EXECUTION OF admin.pl

gcc -o agua agua.c

echo '{"username":"syoung","sessionId":"1228791394.7868.158","mode":"addUser","data":{"username":"aaa"}}' | ./agua



ENABLE CORE DUMP
ulimit -c unlimited

DEBUGGING
http://www.cprogramming.com/debugging/segfaults.html

gdb FILES
http://www.chemie.fu-berlin.de/chemnet/use/info/gdb/gdb_13.html


INSTALLED gcc-opt (INCLUDES gcc-4.0 COMMAND)

apt-get install gcc-opt


<!--

emacs agua.c


#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include <strings.h>
#include <string.h>

int gid;
//int i;

/* main(int argc, char **argv) - main process loop */

int main(int argc, char **argv)
{
    /* Set euid and egid to actual user */
    gid = getgid();
    setegid(getgid());
    seteuid(getuid());
    
    /* Set uid, gid, euid and egid to root */    
    setegid(0);
    seteuid(0);
    setgid(0);
    setuid(0);

    int c;
    int nc = 0;   
    char *input;
    while ( (c = getchar()) != EOF )
    {
        if ( c == '\n' || c == '\r' )
        {
            break;
        }

      input[nc] = (char)c;
        nc++;
    }
    /* Terminate string with null character: */
    input[nc] = '\0';
    
    printf("strlen(input):  %d\n", strlen(input));    
    printf("Number of characters in input = %d\n", nc);
    int i;
    for ( i = 0; i < nc; i++ )
    {
        printf("%c", input[i]);
    }
    
    char command[] = "";
    strcat(command, "echo  '");
    strcat(command, input);
    strcat(command, "' | ");
    strcat(command, "/var/www/cgi-bin/agua/0.5/admin.pl");

    //    printf("command: %s", command);
    //    printf("Doing command:  %s\n", command);    
    //system(command);
    //    printf("Completed command:  %s\n", command);    

    //    return 1;

    // Setup our pipe for reading and execute our command.
    //    FILE *pf;
    //char data[1000];
    //pf = popen( "ls","r"); 
    
    //if(!pf){
    //  fprintf(stderr, "Could not open pipe for output.\n");
    //  return;
    //}
    
    //// Grab data from process execution
    //fgets(data, 1000 , pf);
    //
    //// Print grabbed data to the screen.
    //fprintf(stdout, "-%s-\n",data); 

    return 0;
}


//char *strcpy(char *dest, const char *src)
//{
//   char *save = dest;
//   while(*dest++ = *src++);
//   return save;
//}

//#include <string>
//#include <iostream>
//#include <stdio.h>
//
//std::string exec(char* cmd) {
//    
//    printf(cmd);
//    FILE* pipe = popen(cmd, "r");
//    if (!pipe) return "ERROR";
//    char buffer[128];
//    std::string result = "";
//    while(!feof(pipe)) {
//        if(fgets(buffer, 128, pipe) != NULL)
//                result += buffer;
//    }
//    pclose(pipe);
//    return result;
//}

/* strip trailing newline */
    for (i = 0; i < strlen(inputline); i++)
    {
        if ( inputline[i] == '\n' || inputline[i] == '\r' )
            inputline[i] = '\0';
    }

--> 

BASED ON:

<!--    
    #include <stdio.h>
    #include <sys/types.h>
    #include <unistd.h>
    #include <signal.h>
    #include <strings.h>
    
    /********************************************
     * Wrapper - Secure Yourself                *
     *                                          *
     * 2007 - Mike Golvach - eggi@comcast.net   *
     *                                          *
     * Usage: COMMAND [start|stop]              *
     *                                          *
     ********************************************/
     
     /* Creative Commons Attribution-Noncommercial-Share Alike 3.0 United States License */
    
    /* Define global variables */
    
    int gid;
    
    /* main(int argc, char **argv) - main process loop */
    
    int main(int argc, char **argv)
    {
    
    /* Set euid and egid to actual user */
    
     gid = getgid();
     setegid(getgid());
     seteuid(getuid());
    
    ///* Confirm user is in GROUP(999) group */
    //
    // if ( gid != 999 ) {
    //  printf("User Not Authorized!  Exiting...\n");
    //  exit(1);
    // }
    
    /* Check argc count only at this point */
    
     if ( argc != 1 ) {
      printf("Usage: COMMAND [start|stop]\n");
      exit(1);
     }
    
        int c;
        int nc = 0;
        
        nc = 0;
    //    i = getchar();
    //    while (i != EOF) {
    //	nc = nc + 1;
    //	i = getchar();
    //    }
    
        while ( (c = getchar()) != EOF ) nc++;
        printf("Number of characters in input = %d\n", nc);
    
    
    /* Set uid, gid, euid and egid to root */
    
     setegid(0);
     seteuid(0);
     setgid(0);
     setuid(0);
    
    /* Check argv for proper arguments and run 
     * the corresponding script, if invoked.
     */
    
     if ( strncmp(argv[1], "start", 5) == 0 ) {
      if (execl("/var/www/cgi-bin/agua/0.5/admin.pl", "COMMAND", "-v", NULL) < 0) {
       perror("Execl:");
      }
     } else if ( strncmp(argv[1], "stop", 4) == 0 ) {
      if (execl("/usr/local/bin/COMMAND", "COMMAND", "-v", NULL) < 0) {
       perror("Execl:");
      }
     } else {
      printf("Usage: COMMAND [start|stop]\n");
      exit(1);
     }
     exit(0);
    }

-->-




<entry [Wed 2011:04:20 13:08:21 EST] gcc ON UBUNTU 10.10 WAS BROKEN SO REINSTALLED ALL altitude-INSTALLED PACKAGES>
    
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



NOTES
-----


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


<entry [Wed 2011:04:20 13:09:10 EST] USE 2770 FOR AUTOMATIC GROUP ASSIGNMENT OF NEW FILES>
    

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

<entry [Tue Jan 25 13:55:31 EST 2010] ADDED Users.js AND Clusters.js TO ADMIN PANE>

Users.js

	1. ADD AND REMOVE USERS
	2. MUST SUPPLY USER NAME AND EMAIL
	3. EDIT USER INFORMATION

    
    http://unix-in-world.blogspot.com/2009/11/users-groups-chown-chgrp-useradd.html
    
    useradd - Adding a new user
    
    Options:
    
    -d home directory
    -s starting program (shell)
    -p password
    -g (primary group assigned to the users)
    -G (Other groups the user belongs to)
    -m (Create the user's home directory
    Example: To add a new user with
    
    a primary group of users
    a second group mgmt
    starting shell /bin/bash
    password of xxxx
    home directory of roger
    create home directory
    a login name of roger


    useradd -gusers -Gmgmt -s/bin/shell -pxxxx -d/home/roger -m roger    



    cat /etc/passwd | cut -d ":$userdir" -f1


    usermod - Modifying existing user
    Options:
    
    -d home directory
    -s starting program (shell)
    -p password
    -g (primary group assigned to the users)
    -G (Other groups the user belongs to)
    Example: To add the group 'others' to the user roger






Clusters.js

	1. ADD AND REMOVE CLUSTERS
	2. MUST SUPPLY:
	
		Cluster		CLUSTER NAME
		Nodes		NUMBER OF NODES
		Type		INSTANCE TYPE
	
	CREATE TABLE IF NOT EXISTS clusters
	(
		username        VARCHAR(30) NOT NULL,
		cluster         VARCHAR(30) NOT NULL,
		nodes           VARCHAR(20),
		instancetype    VARCHAR(20),
		project         VARCHAR(20) NOT NULL,
		workflow        VARCHAR(20) NOT NULL,
		description     TEXT,
		datetime        DATETIME NOT NULL,
		
		PRIMARY KEY (username, cluster, project, workflow)
	);



ADDED UPDATE 'clusters' TABLE PARAS TO Common.pm METHODS:

removeProject, removeWorkflow, renameProject, renameWorkflow



ADDED 'CLUSTER METHODS' SECTION TO Common.pm:

addCluster
removeCluster
editCluster




WorkflowClusters.js

ADD/REMOVE WORKFLOWS TO/FROM CLUSTERS


ADDED TO 'Cluster Methods' SECTION IN Common.pm:

addClusterWorkflow
removeClusterWorkflow






ADDED Monitor/SGE.pm


SGE JOB ENVIRONMENT VARIABLES

$HOME       home directory on execution machine
$USER       user ID of job owner
$JOB_ID     current job ID
$JOB_NAME   current job name (see -N option)
$HOSTNAME   name of the execution host
$TASK_ID    array job task index number'



</entry>

<entry [Mon Jan 31 21:52:33 EST 2011] FIXED INTERPRETER FOR CGI SCRIPTS ON WINDOWS XP LAPTOP>

HOW TO FIX IT
http://cgarvey.ie/blog/archive/2008/01/14/activestate-perl-and-apache-httpd-couldnt-spawn-child-process-error/

HOW TO FIX IT TOO
http://httpd.apache.org/docs/2.0/mod/core.html


PROBLEM

GET THESE ERRORS ON WINDOWS XP AFTER COPYING .cgi SCRIPTS OVER FROM BACKUP TO NEWLY REIMAGED SYSTEM

	[Mon Jan 31 17:31:12 2011] [error] [client 127.0.0.1] (OS 2)The system cannot find the file specified.  : couldn't create child process: 720002: workflow.cgi
	[Mon Jan 31 17:31:12 2011] [error] [client 127.0.0.1] (OS 2)The system cannot find the file specified.  : couldn't spawn child process: E:/base/www/cgi-bin/agua/0.5/workflow.cgi


DIAGNOSIS

APACHE NEEDS THE 'C:\Perl\bin\perl.exe' AT THE TOP OF THE .cgi SCRIPT TO KNOW WHAT TO DO WITH IT


SOLUTION

GET THE SCRIPT HANDLER INFO (I.E., DO IT WITH perl) FROM THE REGISTRY FOR ALL .cgi FILES


1. ADD THIS LINE TO http.conf

ScriptInterpreterSource registry 

2. ADD A REGISTRY KEY TO MAP THE .cgi EXTENSION TO PERL
(.pl is already done by the Perl installer)

Start --> Run --> regedit.exe

add a Key named '.cgi' to HKEY_LOCAL_MACHINE\SOFTWARE\Classes.

In that new key, change the default String (REG_SZ) value to 'Perl'
(which matches another key that the installer has added).


3. MAKE SURE THAT 'ExecCGI' OPTION IS ENABLED IN httpd.conf

4. RESTART APACHE AND CHECK .cgi SCRIPT WITH #!/usr/bin/perl HEADER

	OK!


</entry>

<entry [Sat Dec 22 23:55:31 EST 2010] CREATED 'INSTALL' FILE IN BASE '0.5' FOLDER>


CONTAINS THE FOLLOWING SECTIONS:

1. INSTALL PERL MODULES

2. INSTALL AGUA

3. INSTALL AGUA ON WINDOWS

4. TROUBLESHOOTING


</entry>

<entry [Sat Dec 22 23:55:31 EST 2010] REMOVED 'use DB_File' FROM StarCluster, SO DIDN'T NEED THIS:>

***REM: AFTER UPDATING PERL TO VERSION 5.12.2 ON HP LAPTOP

INSTALL DB_File
----------------

CPAN

E:\software\perl\DB_File\DB_File-1.78\blib\lib\auto\DB_File>cpan

It looks like you don't have a C compiler and make utility installed.  Trying
to install dmake and the MinGW gcc compiler using the Perl Package Manager.
This may take a a few minutes...

Downloading MinGW-5.1.4.1...done
Downloading dmake-4.11.20080107...done
Unpacking MinGW-5.1.4.1...done
Unpacking dmake-4.11.20080107...done
Generating HTML for MinGW-5.1.4.1...done
Generating HTML for dmake-4.11.20080107...done
Updating files in site area...done
1070 files installed

Please use the `dmake` program to run commands from a Makefile!

Set up gcc environment - 3.4.5 (mingw-vista special r3)

cpan shell -- CPAN exploration and modules installation (v1.9456)
Enter 'h' for help.


cpan>






TRIED WITH DOWNLOADED FILE AND COPYING OVER INTO c:\perl

USE THIS FILE IN perlmods
DB_File-1.78_bin.zip

NB: FILE WAS DOWNLOADED FROM HERE:
http://muquit.com/muquit/software/Count/Count2.6/Count2.6/download/bins/winnt/DB_File-1.78_bin.zip


UNZIP FILE AND COPY FILES TO PERL LIB


1. COPY DB_File.pm FROM HERE:

cd E:\software\perl\DB_File\DB_File-1.78\blib\lib

-rw-r--r--    1 syoung   Administ        0 Jul  4  2001 .exists
-rw-r--r--    1 syoung   Administ    65067 Oct 11  2001 DB_File.pm
drwxr-xr-x    3 syoung   Administ        0 Dec 26 00:29 auto

TO HERE:

C:\Perl\lib



2. COPY THIS DIRECTORY:

cd E:\software\perl\DB_File\DB_File-1.78\blib\arch\auto\DB_File
ll

-rw-r--r--    1 syoung   Administ        0 Jul  4  2001 .exists
-rw-r--r--    1 syoung   Administ        0 Oct 11  2001 DB_File.bs
-rwxr-xr-x    1 syoung   Administ   389120 Oct 11  2001 DB_File.dll
-rw-r--r--    1 syoung   Administ      7 80 Oct 11  2001 DB_File.exp
-rw-r--r--    1 syoung   Administ     2142 Oct 11  2001 DB_File.lib

TO HERE:

C:\Perl\site\lib\auto


C:\Perl\lib\auto



3. COPY THIS DIRECTORY:

cd E:\software\perl\DB_File\DB_File-1.78\blib\lib\auto\DB_File

    -rw-r--r--    1 syoung   Administ        0 Jul  4  2001 .exists
    -rw-r--r--    1 syoung   Administ       89 Oct 11  2001 autosplit.ix

TO HERE:

C:\Perl\site\lib\auto



TEST:

cd E:\software\perl\DB_File\DB_File-1.78\blib\lib\auto\DB_File
perl -e "use DB_File"

Can't load 'C:/Perl/site/lib/auto/DB_File/DB_File.dll' for module DB_File: load_
file:The specified module could not be found at C:/Perl/lib/DynaLoader.pm line 2
01.
 at -e line 1


C:\Perl\lib\DynaLoader.pm

That error is probably slightly misleading - it can result
from Net::SSLeay not finding the ssl dlls (libeay32.dll
and/or ssleay32.dll). Try adjusting the PATH environment
variable to include the directory where these dlls live (eg,
Apache has a SetEnv directive for doing such things). You'll
also have to ensure that the permissions on the directories
where the dlls are located are such that the dlls are
loadable by the user that the web server is running as.





cd E:\software\perl\DB_File\DB_File-1.78

ppm rep add E:/software/perl/DB_File/DB_File-1.78
ppm install DB_File
ppm query DB_File

ppm

query DB_File

    DB_File [1.78]  Module source: http://www.perl.com/CPAN-local/modules/ by-
        module/DB_File/DB_File-1.78.tar.gz.  I compiled this module 
        with Berkeley DB 3.3.11 with MS Visual C++ 6.0 on NT.  I used 
        ActiveState Perl build 628. I'm supplying this module with the 
        hope that it will be helpful to run the count_admin.pl CGI 
        program as I do not see any compiled version of the latest 
        distribution anywhere. Note: I'm not the  author of the moudle, 
        I just compiled it. I find the code very statble, however use 
        it at your own risk.  Counter page:
           http://www.muquit.com/muquit/software/Count/Count.html.
        Berkeley DB site: http://www.sleepycat.com/. Compiled by:
        muquit@muquit.com, On Aug-15-2001
        
query DB_File
quit



ppm rep add trouchelle.com http://trouchelle.com/ppm10/
ppm install DB_FILE


For me this works: 

1) download DB_File.zip from
http://ppm.activestate.com/PPMPackages/zips/6xx-builds-only 

2) unzip the archive in a directory 

from the DOS prompt: 

3) cd in this directory 

4) write:
ppm install --location=. db_file








</entry>

<entry [Sat Dec 11 10:26:00 EST 2010] DOJO FORM VALIDATION>

    VALIDATING TEXT BOX
    -------------------
    
    VALIDATE EMAIL, USERNAME, LIMIT BY REGEX, INVALID MESSAGE, ETC.
    http://www.webreference.com/programming/javascript/dojo_client_side_validation/2.html
    
    EXAMPLES:
    
    VALIDATE EMAIL
    
    <input type="text" id="email" name="email" size="30" 
        dojoType="dijit.form.ValidationTextBox" 
        required="true" 
        regExp="[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}" 
        promptMessage="Enter email address." 
        invalidMessage="Invalid Email Address." 
        trim="true" 
    />
    
    
    VALIDATE ZIP CODE:
    
    
        <input type="text" id="zipCode" name="address" size="30" 
            dojoType="dijit.form.ValidationTextBox" 
            trim="true" 
            required="true" 
            regExp="\d{5}([\-]\d{4})?$" 
            maxlength="10" 
            promptMessage="Enter zip code." 
            invalidMessage="Invalid zip code (NNNNN) or (NNNNN-NNNN)." 
        /> 
    

4

You can also add other validation attributes you'd normaly use in ValidationTextBox, like regExp to validate based on a regular expression.

The dojo component:


dojo.provide("ValidationTextarea");
dojo.require("dijit.form.SimpleTextarea");
dojo.require("dijit.form.ValidationTextBox");

dojo.declare(
    "ValidationTextarea",
    [dijit.form.ValidationTextBox,dijit.form.SimpleTextarea],
    {
        invalidMessage: "This field is required",

        postCreate: function() {
            this.inherited(arguments);
        },

        validate: function() {
            this.inherited(arguments);
            if (arguments.length==0) this.validate(true);
        },

        onFocus: function() {
            if (!this.isValid()) {
                this.displayMessage(this.getErrorMessage());
            }
        },

        onBlur: function() {
            this.validate(false);
        }
     }
);




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

TO AVOID ERROR 'mysql.h: No such file or directory':
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
-r--r--r-- 1 root root  21K Aug  5  2008 PurePerl.pm
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

<entry [Fri Nov  5 19:16:50 EST 2010] FIXED ICON CLASS ISSUE BY ADDING NEW ICONS TO dijit/icons/images/editorIconsEnabled.png>


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

<entry [Fri Nov  5 18:16:50 EST 2010] FIXED PROBLEM WITH workflow.cgi getData ON starcluster-7 INSTANCE>


***** TO DO: TEST RESTART OF MYSQL ON REBOOT OF INSTANCE



TURNS OUT IT WAS A PROBLEM WITH ACCESS TO MYSQL:

[root@ip-10-122-225-17 mysql]# mysql -u root -p

	Enter password: 
	ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)



CREATE INIT FILE:

emacs /root/base/apps/mysql/mysql-init.txt

UPDATE mysql.user SET Password=PASSWORD('***MyNewPass***') WHERE User='root';
FLUSH PRIVILEGES;



3. START MYSQL IN TERMINAL CONSOLE

#E:\mysql\bin\mysqld.exe --defaults-file=E:\mysql\my.ini --init-file=E:\mysql\mysql-init.txt

cat /etc/my.cnf

	[mysqld]
	datadir=/var/lib/mysql
	socket=/var/lib/mysql/mysql.sock
	user=mysql
	# Default to using old password format for compatibility with mysql 3.x
	# clients (those using the mysqlclient10 compatibility package).
	old_passwords=1
	
	# Disabling symbolic-links is recommended to prevent assorted security risks;
	# to do so, uncomment this line:
	# symbolic-links=0


# --defaults-file=/etc/my.cnf

/usr/libexec/mysqld --init-file=/root/base/apps/mysql/mysql-init.txt


GRANT ALL PRIVILEGES ON agua.* TO 'agua'@'localhost'
IDENTIFIED BY 'open4agua' WITH GRANT OPTION;

FLUSH PRIVILEGES;


RESTART MYSQL:

/usr/bin/mysqladmin shutdown 

/usr/bin/mysqld_safe &



	OK!




</entry>

<entry [Thu Nov  4 14:20:57 EDT 2010] COMPLETED Users TAB FOR Admin>


TO DO:

ERROR ON SCROLL DOWN USERS TABLE

this.manager.nodes[i] is null

			if(source.creator){
				// create an avatar representation of the node
				node = source._normalizedCreator(source.getItem(this.manager.nodes[i].id).data, "avatar").node;
			}else{



ADDED DELETE AT BACKEND:

echo {"username":"syoung","sessionId":"1228791394.7868.158","mode":"deleteUser","data":{"username":"aaa"}} | perl -U admin.cgi



ADDED PASSWORD TO NEW USER AND SAVE AT BACKEND:

echo {"username":"syoung","sessionId":"1228791394.7868.158","mode":"saveUser","data":{"username":"aaax","firstname":"xx","lastname":"ss","email":"ss","password":"ahaha","originalName":""}}  | perl -U admin.cgi



echo {"username":"syoung","sessionId":"1228791394.7868.158","mode":"saveUser","data":{"username":"aaa","firstname":"asasdf","lastname":"asdfaa","email":"asdf@asdfcomexx","originalName":"","password":"mypass"}} | perl -U admin.cgi







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
	<Directory "/var/www/cgi-bin">
	
		AllowOverride None

		#### ADDED THIS AND COMMENTED BELOW LINES	
		Options ExecCGI -MultiViews +FollowSymLinks
	
		#### Options None
	
		#### Order allow,deny
	
		Allow from all
	
	</Directory>
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

On a CentOS box, you need to install the perl-suidperl' package to get the necessary files installed:


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

	=head2 Wed Dec  2 15:21:59 2009: C<Module> L<DBI|DBI>
	=over 4
	=item *
	C<installed into: /usr/lib/perl5/site_perl/5.8.8>
	=item *
	C<LINKTYPE: dynamic>
	=item *
	C<VERSION: 1.609>


CONFIRM DBI VERSION ON STARCLUSTER-7:

emacs /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod

	
	head2 Thu Oct 28 00:44:23 2010: C<Module> L<DBI|DBI>
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
	Couldn't open ftp: Cannot allocate memory at /usr/lib/perl5/5.8.8/CPAN.pm line 2806, <FIN> line 3.



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



ls -1 | grep -v "^.kde$" | xargs -n 1 -iHERE cp -R HERE <destination

Basically, 'ls -1' gets all the contents of the directory, grep removes an entry of ".kde", and then xargs copies everything else.




cp *?[!php] /home/SOURCE/ /home/COPIED/

With this command in the bash you can copy all files except php from a directory.
  	



</entry>


