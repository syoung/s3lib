fastcgi 


<entry [Tue 2012:07:24 02:38:20 EST] FIXED 'idle timeout'>

CHANGED -idle-timeout PARAMETER FOR EXCUTABLES IN apache2.conf

FROM

FastCgiServer /var/www/cgi-bin/agua/workflow.cgi -idle-timeout 60 -processes 1

TO

FastCgiServer /var/www/cgi-bin/agua/workflow.cgi -idle-timeout 600 -processes 1
    

    
</entry>
<entry [Fri 2012:07:13 06:25:25 EST] HOW TO DEBUG FASTCTI PERL SCRIPTS>
    
http://www.fastcgi.com/om_archive/words/FAQ.htm    

How do I debug my FastCGI app?

Since FastCGI applications are started from the Web server and are run dissociated from a controlling terminal, some of the debugging techniques you are used to won't work. But there are replacements.

If you are accustomed to using an interactive debugger such as gdb or dbx, you can still use these debuggers on FastCGI apps. As usual, you must compile the app for debugging (e.g. -g switch to gcc) in order to get the best use of the debugger. Also, your debugger must be able to attach to a running process. Some platforms don't allow attaching to a running process, but most do. A typical command-line syntax for attaching to a running process is

gdb prog_name pid

where prog_name is the name of the executable and pid is the process number. Consult your debugger's documentation for full information.
Sometimes you will want to attach the debugger to your app before it has performed its initialization. One way to enable this is to make your main program look something\ like this:

    void main(void)
    {
        int stopSleep = 0;
        while (getenv("SLEEP") != NULL && stopSleep == 0) {
            sleep(2);
        }
        /* the application proper starts here */
           .
           .
           .
    }
    
Now if you need to debug the application, start it with AppClass ... -initial-env SLEEP=TRUE. This will place the application into the sleep loop as soon as it starts. Then use ps to find the application process, attach your debugger to the process, set whatever breakpoints you like, set stopSleep to a non-zero value, and continue the application. Here's a transcript, using dbx:

    % dbx fcgi_debug 9488
    ...
    Reading symbolic information for libmp.so.1
    Reading symbolic information for libw.so.1
    Attached to process 9488  >>>Press ^C here to force a signal<<<
    stopped in _sigsuspend at 0xdf678004
    _sigsuspend+0x4:        ta      0x8
    Current function is main
        9         sleep(2);
    (dbx) assign stopSleep=1
    (dbx) next
    stopped in main at line 12 in file "fcgi_debug.c"
       12       while(FCGI_Accept() >= 0) {
    (dbx)quit
    detaching from process 9488
    %
    
Some programming languages used with FastCGI (e.g. Perl) do not support attaching debuggers. You perform debugging in these languages by inserting print statements. Before entering the request loop, you can print to syslog or to a log file that you open within the application (most likely controlled by an environment variable like SLEEP above.) Within the request loop you have the additional options of printing to the standard output and error streams. Anything you print to standard output will go to the client, typically a browser. You may want to format your debug printing to standard output as HTML comments (e.g. <!-- this is a comment -->), which you can look at using the "View/Document Source" entry on the browser's menu. Anything you print to standard error will go to the server's error log file.



</entry>
<entry [Fri 2012:07:13 04:41:04 EST] FIXED FASTCGI PROBLEM WITH REDIRECTED STDOUT>

PROBLEM

curl CALL IN getRemoteTagsTimeout WORKS ON COMMAND LINE BUT FAILS WHEN RUN THROUGH BROWSER:

2012-07-13 04:32:50    [DEBUG]          Agua::Ops::GitHub::createCurlFile       18      contents: header = "Authorization: token ded526622a10cfaaea0134662696b748ff666696"
2012-07-13 04:32:50    [DEBUG]          Agua::Ops::GitHub::getRemoteTagsTimeout 363     command: curl --connect-timeout 5 -K /tmp/curl.6678.txt https://api.github.com/repos/agua/agua/tags
2012-07-13 04:32:50    [DEBUG]          Agua::Ops::runCommand   220     command: curl --connect-timeout 5 -K /tmp/curl.6678.txt https://api.github.com/repos/agua/agua/tags

    ... NO MORE OUTPUT ...


DIAGNOSIS

FASTCGI USES A SINGLE FILE DESCRIPTOR INSTEAD OF STDOUT/STDERR/STDIN



SOLUTION

REWROTE Agua::Ops::runCommand TO USE CONDITIONAL '1>' AND '2>' REDIRECTS:

		my $stdoutfile = "/tmp/$$.out";
		my $stderrfile = "/tmp/$$.err";
		my $oldout;
		my $olderr;
		
		#open($oldout, ">&STDOUT") or die "Can't set stdout\n";
		#open($olderr, ">&STDERR") or die "Can't set stderr\n";
		#open(STDERR, ">$stderrfile") or die "Can't redirect STDERR to stderrfile: $stderrfile\n";
		#open(STDOUT, ">$stdoutfile") or die "Can't redirect STDOUT to stdoutfile: $stdoutfile\n";
		#print `$command`;
		#open STDERR, ">&", $olderr;
		#open STDOUT, ">&", $oldout;

		#### TAKE REDIRECTS IN THE COMMAND INTO CONSIDERATION
		if ( $command =~ />\s+/ ) {
			if ( $command =~ /\s+&>\s+/
				or ( $command =~ /\s+1>\s+/ and $command =~ /\s+2>\s+/)
				or ( $command =~ /\s+1>\s+/ and $command =~ /\s+2>&1\s+/) ) {
				#### DO NOTHING, ERROR AND OUTPUT ALREADY REDIRECTED
			}
			elsif ( $command =~ /\s+1>\s+/ or $command =~ /\s+>\s+/ ) {
				#### STDOUT ALREADY REDIRECTED - REDIRECT STDERR ONLY
				$command .= " 2> $stderrfile";
			}
			elsif ( $command =~ /\s+2>\s+/ or $command =~ /\s+2>&1\s+/ ) {
				#### STDERR ALREADY REDIRECTED - REDIRECT STDOUT ONLY
				$command .= " 1> $stdoutfile";
			}
		}
		else {
			$command .= " 1> $stdoutfile 2> $stderrfile";
		}
		
		print `$command`;
		my $output = `cat $stdoutfile`;
		my $error = `cat $stderrfile`;
		$self->logDebug("output", $output);
		$self->logDebug("error", $error);
		
		#### CHECK FOR PROCESS ERRORS
		$self->logError("Error with command: $command") and exit if $? != 0 and not $self->warn();
		
		#### CLEAN UP
		`rm -fr $stdoutfile`;
		`rm -fr $stderrfile`;
		chomp($output);
		chomp($error);
		
		return $output, $error;




NOTES
-----

http://www.fastcgi.com/om_archive/words/FAQ.htm    
    
In a FastCGI application, the standard input, output, and error streams no longer correspond one-to-one with file descriptors. On each request, the FastCGI application library obtains a single file descriptor over which it multiplexes input, output, and error information. Therefore any application code that reaches behind the standard streams and attempts to manipulate the underlying file descriptors won't work with FastCGI. For instance, you can't use Perl's sysread(STDIN) or syswrite(STDOUT). Fortunately, there is no loss of functionality in using the stream-based functions such as print.

Because FastCGI applications run as persistent processes, they must be careful not to leak resources such as memory and file descriptors. Most CGI programs don't worry about managing these resources because when the process terminates the OS takes care of releasing them. If it is too difficult to fix a resource leak in your FastCGI app, you can work around the problem by keeping track of the leak (e.g. by counting requests) and exiting the app before the leak gets out of hand. Your application manager (typically the FastCGI module in your Web server) will restart the application for you. Your app should call the FastCGI finish function to complete the current request before exiting; otherwise the unlucky requestor that causes the app to exit will see a server error.

Some CGI apps rely on exit to flush all stream buffers at the end of each request. Since a FastCGI app doesn't call exit at the end of each request, it needs to get this functionality some other way. For instance, if a FastCGI app writes to a log file stream on each request, it may want to use an unbuffered stream or flush the stream at the end of each request, so the log file is up to date should the application crash. (There is no need to flush the standard output and error streams; the FastCGI application library takes care of that.)

Keeping these points in mind, here's how we rewrite our Perl CGI app to use FastCGI:

    #!/usr/local/bin/perl

    # Tell Perl to use code in FCGI module
    use FCGI;

    # Initialization code, 
    #
    # REPLACE: open (OUTPUT, ">>mylog.log")||die ("Unable to open output");
    # ^^^^^^^
    if (!(open (OUTPUT, ">>mylog.log"))) {
        # We shouldn't just terminate the process.  If the log file
        # isn't available, we'll do without it by writing to /dev/null:
        open (OUTPUT, ">/dev/null");
    }

    # Here starts the main request-processing loop
    while (FCGI::accept()>=0) {
        # new request, so deal with it

        # print HTTP header
        print "Content-type: text/html\r\n\r\n"; 

        # open the pipe
        #
        # REPLACE: open (INPUT, "uptime|") || exit(1);
        # ^^^^^^^
        if (!(open (INPUT, "uptime|"))) {
            # We shouldn't just terminate the process.  Instead,
            # we'll display an error message and
            # go back to the top of the loop.
            print "Unable to obtain information from uptime";
            next;
        }

        # get the information
        $load = <INPUT> ;
                
        # must close the pipe once we are done with it in order 
        # to prevent a file descriptor leaks.
        close (INPUT);

        # extract and format
        $load =~ s/^\s+|\s+$//;
        if ($load =~ /average:/) {
            $avgs = $';
            @avgs = split (/, /, $avgs);
            $avgs[0] =~ s/^\s+//;
            print "\n";
            print "Load  1 minute  ago was : $avgs[0]\n";
            print "Load  5 minutes ago was : $avgs[1]\n";
            print "Load 15 minutes ago was : $avgs[2]\n";
        }       

        # log to file.  The simplest way to ensure that the
        # logged information makes it to the file is to set the
        # log stream to unbuffered.  A higher-performance
        # way to do it is to explicitly flush the stream,
        # but Perl doesn't provide us this option.
        # XXX: right?
        select (OUTPUT);
        $| = 1;
        print "\n";
        print "Load  1 minute  ago was : $avgs[0]\n";
        print "Load  5 minutes ago was : $avgs[1]\n";
        print "Load 15 minutes ago was : $avgs[2]\n";
        ($sec, $min, $hour, $day, $month, $year, @stuff) = 
                localtime(time);
        print "Logged on $month/$day/$year at $hour:$min:$sec\n";
                
        # reset the output to STDOUT, so that the
        # next print does not write to the log file
        select (STDOUT);
                
        # REPLACE: return(0);
        # ^^^^^^^
        # the end of the request loop functions for FastCGI like
        # return did for CGI
    }

    # When FCGI::accept returns an error, just exit
    

    
</entry>
<entry [Mon 2012:07:09 06:00:42 EST] FASTCGI autoUpdate>

ADDED THIS LINE TO apache2.conf

    FastCgiConfig -autoUpdate

    
<!--
#### FASTCGI
<IfModule mod_fastcgi.c>
   AddType application/x-httpd-fcgi .fcgi
   AddHandler fastcgi-script .fcgi .fcg .pl
    FastCgiServer /var/www/cgi-bin/agua/workflow.cgi -idle-timeout 60 -processes 1
    FastCgiServer /var/www/cgi-bin/agua/admin.cgi -idle-timeout 60 -processes 1
    FastCgiConfig -autoUpdate
    
</IfModule>

-->


http://dbforch.wordpress.com/2010/05/21/apache2-fastcgi-multiple-php-versions-ubuntulucid-10-04/


http://stackoverflow.com/questions/216092/reloading-a-fastcgi-app

Applications started by mod_fastcgi can use the autoUpdate argument to FastCgiServer and/or FastCgiConfig (see the mod_fastcgi docs). A drawback to this approach is that, mod_fastcgi will check on every request for a new version of the application. A smarter implementation might have the application itself check periodically (either by number of requests handled or by time passed) and reload if a newer version of itself (or one of its libraries) exists. If a process manager, such as that embedded in mod_fastcgi, is responsible for the process, simply exiting will cause a new instance to be created.
   
</entry>
<entry [Mon 2012:07:09 04:22:19 EST] FASTCGI ALTERNATIVE TO exit - GOTO>


http://wiki.dreamhost.com/FastCGI

If your script terminates by some command (like exit; or last; in Perl), the script will start over from scratch the next time it's run, losing the benefits of running certain code only once. 

The solution:

Wrong way
---------

#!/usr/bin/perl

#-----------------------
#  CODE THAT RUNS ONCE
#-----------------------
     (open a database)

#---------------------------------
#  CODE THAT RUNS EVERY TIME
#---------------------------------

use FCGI;
while ( FCGI::accept() >= 0 ) {
      print "Content-type:text/html\n\n";

      if (some test) { exit;}

      more code;
}


Right way
---------

#!/usr/bin/perl

#-----------------------
#  CODE THAT RUNS ONCE
#-----------------------
     (open a database)

#---------------------------------
#  CODE THAT RUNS EVERY TIME
#---------------------------------

use FCGI;

while ( FCGI::accept() >= 0 ) {
      print "Content-type:text/html\n\n";

      if (some test) { goto(EXITLABEL) }

      more code;

      EXITLABEL: {}
}


</entry>
<entry [Sun 2012:07:08 21:12:04 EST] ADDITIONS TO apache2.conf>

ADDED THIS TO THE BOTTOM OF /etc/apache2/apache2.conf

<!--
#### mod_perl
Alias /modperl/ /mnt/agua/modperl/
#LoadModule perl_module modules/mod_perl.so
PerlModule ModPerl::Registry

<Location /modperl>
  SetHandler perl-script
  PerlHandler ModPerl::Registry
  Options ExecCGI
  PerlSendHeader On
  allow from all
</Location>


#ServerName syoung-Satellite-L355
ServerName localhost


#### SET SERVER STATUS PAGE
<Location /server-status>
SetHandler server-status

</Location>

<VirtualHost localhost:80>
    SuexecUserGroup root root
    ScriptAlias /modperl/ /mnt/agua/modperl/
    Options ExecCGI Indexes
</VirtualHost>


#### FASTCGI
<IfModule mod_fastcgi.c>
   AddType application/x-httpd-fcgi .fcgi
   AddHandler fastcgi-script .fcgi .fcg .pl
    FastCgiServer /var/www/cgi-bin/agua/workflow.cgi -idle-timeout 60 -processes 1
</IfModule>
-->

   
</entry>
<entry [Sun 2012:07:08 15:33:23 EST] UPDATED: FASTCGI/MODPERL PERFORMANCE BENCHMARK>

FASTCGI SPEEDS UP AGUA LOAD BY 1.5 TIMES, THE SAME AS MOD_PERL

FOR ALL OTHER CALLS FASTCGI WAS AT LEAST TWICE AS FAST AS MOD_PERL AND WAS 60-250 TIMES FASTER THAN PLAIN CGI


NB: PREVIOUS FASTCGI FIGURES WERE INCORRECT AS IT WASN'T WORKING

getStatus (1)     39.96  (4.50 for workflow->getStatus METHOD CALL)
getData            8.17
getStatus          0.34 
checkFile          0.09 
moveWorkflow       0.08
addStageParameter  0.13 



addStageParameter  14.34 14.61 15.83  (restarted after checkFile)
checkFile          0.42 2.36 2.44   (competing with addStageParameter)

                                                   mod_perl    fastcgi
               mod_perl    fastcgi (ON)   plain    MULTIPLE    MULTIPLE
getData        9.50        8.17           15.94    1.5         1.5
getStatus      0.56        0.34           17.62    30          60
checkfile      0.40        0.09           23.10    60          250
moveWorkflow   0.31        0.08           12.09    30          130
addStageParameter 0.44     0.13           23.05    50          180

   
</entry>
<entry [Sun 2012:07:08 05:00:59 EST] SOLVED: FASTCGI WITH SETUID>
TEST IN FIREBUG:

console.clear();
var query = {
username : "admin",
sessionId : "9999999999.9999.999",
mode: "getData",
project: "Project1",
workflow: "Workflow1"
};

//,
//SHOWLOG: 4

var url = "../cgi-bin/agua/fcgi.cgi";

Agua.doPut({
url: url,
query: query
});


SUCCESS CRITERIA

1. MUST RUN AS ROOT, I.E., SETUID WORKS

2. MUST INCREMENT COUNTER

3. MUST CACHE AND PROVIDE SIGNIFICANT SPEEDUP



PROCEDURE

1. BOTH THE C WRAPPER AND THE PERL TARGET MUST BE SETUID

chown root:root fcgi.*; chmod 6755 fcgi.*


2. NO 'my' FOR $cnt COUNTER VARIABLE IN fcgi.pl


3. THE C WRAPPER MUST BE RUN AS FASTCGI

/etc/apache2/apache2.conf

<!--

#### FASTCGI
<IfModule mod_fastcgi.c>
   AddType application/x-httpd-fcgi .fcgi
   AddHandler fastcgi-script .fcgi .fcg .pl
    #FastCgiServer /var/www/cgi-bin/agua/workflow.fcgi -idle-timeout 60 -processes 1
    #FastCgiServer /var/www/cgi-bin/agua/workflow.cgi -idle-timeout 60 -processes 1
    FastCgiServer /var/www/cgi-bin/agua/workflow.pl -idle-timeout 60 -processes 1
    FastCgiServer /var/www/cgi-bin/agua/fcgi.cgi -idle-timeout 60 -processes 1
    #FastCgiServer /var/www/cgi-bin/agua/fcgi.pl -idle-timeout 60 -processes 1
</IfModule>

-->

4. RESTART APACHE (AND FASTCGI)
service apache2 restart

   OK
   
   USER IS root
   COUNTER INCREMENTS

<!--
<h2>fcgi.pl</h2>
<head>
<title>FastCGI Demo Page (perl)</title>
</head>
<h1>FastCGI Demo Page (perl)</h1>
This is coming from a FastCGI server.
<BR>
Running on <EM></EM> to <EM></EM>
<BR>
This is connection number 1
 XXX: root<br>

 
 
 <h2>fcgi.pl</h2>
<head>
<title>FastCGI Demo Page (perl)</title>
</head>
<h1>FastCGI Demo Page (perl)</h1>
This is coming from a FastCGI server.
<BR>
Running on <EM></EM> to <EM></EM>
<BR>
This is connection number 2
 XXX: root<br>

-->


   
</entry>
<entry [Sat 2012:07:07 23:19:32 EST] INSTALLED PERL 5.10 FOR SETUID>


http://www.trilithium.com/johan/2005/04/apache2-fastcgi/


downloaded perl and perl-suid


http://ftp.de.debian.org/debian/pool/main/p/perl/

-rw-rw-r--  1 syoung syoung 4457342 Jul  7 23:27 perl_5.10.1-17squeeze3_amd64.deb
-rw-rw-r--  1 syoung syoung   35386 Jul  7 20:57 perl-suid_5.10.1-17squeeze3_amd64.deb

   
</entry>
<entry [Sat 2012:07:07 23:18:36 EST] REVISIT FASTCGI>

http://www.trilithium.com/johan/2005/04/apache2-fastcgi/
http://www.trilithium.com/johan/2005/04/apache2-fastcgi/
http://www.trilithium.com/johan/2005/04/apache2-fastcgi/

fastcgi docs
http://www.fastcgi.com/mod_fastcgi/docs/mod_fastcgi.html
   
   
   
</entry>
<entry [Sat 2012:07:07 23:14:50 EST] CGI::Fast MODULE>

http://search.cpan.org/dist/CGI/lib/CGI/Fast.pm


CGI::Fast - CGI Interface for Fast CGI

SYNOPSIS 

    use CGI::Fast qw(:standard);
    $COUNTER = 0;
    while (new CGI::Fast) {
        print header;
        print start_html("Fast CGI Rocks");
        print
            h1("Fast CGI Rocks"),
            "Invocation number ",b($COUNTER++),
            " PID ",b($$),".",
            hr;
        print end_html;
    }
DESCRIPTION 

CGI::Fast is a subclass of the CGI object created by CGI.pm. It is specialized to work well FCGI module, which greatly speeds up CGI scripts by turning them into persistently running server processes. Scripts that perform time-consuming initialization processes, such as loading large modules or opening persistent database connections, will see large performance improvements.

OTHER PIECES OF THE PUZZLE 

In order to use CGI::Fast you'll need the FCGI module. See http://www.cpan.org/ for details.

WRITING FASTCGI PERL SCRIPTS 

FastCGI scripts are persistent: one or more copies of the script are started up when the server initializes, and stay around until the server exits or they die a natural death. After performing whatever one-time initialization it needs, the script enters a loop waiting for incoming connections, processing the request, and waiting some more.

A typical FastCGI script will look like this:

    #!/usr/bin/perl
    use CGI::Fast;
    &do_some_initialization();
    while ($q = new CGI::Fast) {
        &process_request($q);
    }
Each time there's a new request, CGI::Fast returns a CGI object to your loop. The rest of the time your script waits in the call to new(). When the server requests that your script be terminated, new() will return undef. You can of course exit earlier if you choose. A new version of the script will be respawned to take its place (this may be necessary in order to avoid Perl memory leaks in long-running scripts).

CGI.pm's default CGI object mode also works. Just modify the loop this way:

    while (new CGI::Fast) {
        &process_request;
    }
Calls to header(), start_form(), etc. will all operate on the current request.

INSTALLING FASTCGI SCRIPTS 

See the FastCGI developer's kit documentation for full details. On the Apache server, the following line must be added to srm.conf:

    AddType application/x-httpd-fcgi .fcgi
FastCGI scripts must end in the extension .fcgi. For each script you install, you must add something like the following to srm.conf:

    FastCgiServer /usr/etc/httpd/fcgi-bin/file_upload.fcgi -processes 2
    
</entry>
<entry [Sat 2012:07:07 22:18:40 EST] (RE)INSTALL APACHE ON UBUNTU>

INSTALL APACHE 2.4.2
http://www.laobanit.com/article-001/

DITTO ON UBUNTU 12.04
http://edin.no-ip.com/comment/337
   
</entry>
<entry [Sat 2012:07:07 22:09:14 EST] INSTALL apache2-suexec AND CONFIGURE IN apache2.conf>


1. INSTALL MODULE

apt-get install apache2-suexec

(avoid this error later: Warning: SuexecUserGroup directive requires SUEXEC wrapper.)


2. ENABLE MODULE

a2enmod suexec


3. CONFIGURE apache2.conf
<!--
<VirtualHost localhost:80>
    SuexecUserGroup root root
    ScriptAlias /modperl/ /mnt/agua/modperl/
    Options ExecCGI Indexes
</VirtualHost>

-->


SEE DETAILED CONFIGURATION FILE EXAMPLE

http://ubuntuforums.org/showthread.php?t=1918651



</entry>
<entry [Sat 2012:07:07 21:56:14 EST] CHECK APACHE WAS COMPILED WITH SUEXEC - NOPE>

1. APACHE NOT COMPILED WITH SUEXEC

apachectl -V 
   Server version: Apache/2.2.22 (Ubuntu)
   Server built:   Feb 13 2012 01:51:50
   Server's Module Magic Number: 20051115:30
   Server loaded:  APR 1.4.6, APR-Util 1.3.12
   Compiled using: APR 1.4.5, APR-Util 1.3.12
   Architecture:   64-bit
   Server MPM:     Prefork
     threaded:     no
       forked:     yes (variable process count)
   Server compiled with....
    -D APACHE_MPM_DIR="server/mpm/prefork"
    -D APR_HAS_SENDFILE
    -D APR_HAS_MMAP
    -D APR_HAVE_IPV6 (IPv4-mapped addresses enabled)
    -D APR_USE_SYSVSEM_SERIALIZE
    -D APR_USE_PTHREAD_SERIALIZE
    -D SINGLE_LISTEN_UNSERIALIZED_ACCEPT
    -D APR_HAS_OTHER_CHILD
    -D AP_HAVE_RELIABLE_PIPED_LOGS
    -D DYNAMIC_MODULE_LIMIT=128
    -D HTTPD_ROOT="/etc/apache2"
    -D SUEXEC_BIN="/usr/lib/apache2/suexec"
    -D DEFAULT_PIDLOG="/var/run/apache2.pid"
    -D DEFAULT_SCOREBOARD="logs/apache_runtime_status"
    -D DEFAULT_LOCKFILE="/var/run/apache2/accept.lock"
    -D DEFAULT_ERRORLOG="logs/error_log"
    -D AP_TYPES_CONFIG_FILE="mime.types"
    -D SERVER_CONFIG_FILE="apache2.conf"

   
</entry>
<entry [Sat 2012:07:07 21:49:19 EST] CHECK APACHE CONFIG IS OKAY>

apache2ctl configtest
   Syntax OK
   

export APACHE_RUN_USER=www-data
export APACHE_RUN_GROUP=www-data
/usr/sbin/apache2 -t
   Syntax OK
   
   
</entry>
<entry [Sat 2012:07:07 21:28:51 EST] SETUID PROBLEM WITH MOD_PERL>

EVEN WHEN mod_perl SCRIPT IS SET WITH chown root AND chmod 6755, IT STILL APPEARS TO BE RUN BY www-data:

print "Content-type: text/html\n\n";
print "\$>: " , $> , "\n";


PRINTS "$>: 33" WHICH IS THE www-data USER'S ID:

id www-data
uid=33(www-data) gid=33(www-data) groups=33(www-data)





DROP PRIVILEGES (INCLUDES saved-user)
http://search.cpan.org/~dmartin/Unix-SavedIDs-0.4.1/lib/Unix/SetUser.pm


How to use Suexec with Apache2 ?
Hello guys

I'm trying to use Suexec in my computer. I've installed apache with default settings (so Suexec is installed with my emerge Apache , Gentoo) .

My settings on /etc/conf.d/apache2

Code:
# SUEXEC Enables running CGI scripts (in USERDIR) through suexec.
# USERDIR Enables /~username mapping to /home/username/public_html
#
APACHE2_OPTS="-D DEFAULT_VHOST -D INFO -D LANGUAGE -D SSL -D SSL_DEFAULT_VHOST -D SUEXEC -D PHP5 -D USERDIR "

When I'm restarting my apache, I've the correct line on my log who indicate Suexec is running well :

Code:
[Sat Jan 26 15:33:39 2008] [notice] Apache/2.2.6 (Unix) mod_ssl/2.2.6 OpenSSL/0.9.7i PHP/5.2.5-pl0-gentoo configur$
[Sat Jan 26 15:41:44 2008] [notice] caught SIGTERM, shutting down
[Sat Jan 26 15:41:46 2008] [notice] suEXEC mechanism enabled (wrapper: /usr/sbin/suexec)
[Sat Jan 26 15:41:47 2008] [notice] Digest: generating secret for digest authentication ...
[Sat Jan 26 15:41:47 2008] [notice] Digest: done
I create an user
/usr/sbin/useradd evolv -m -s /bin/bash

In /var/www/evolv/public_html folder, I create php file with :
"< ?php echo "user: ".exec('whoami');?>"

My vhost below :

Code:

<!--
<VirtualHost *:80>
ServerAdmin webmaster@evolv.com
DocumentRoot /var/www/evolv/public_html
ServerName www.evolv.com
ServerAlias evolv.com
SuexecUserGroup evolv evolv
CustomLog /var/log/apache2/evolv-web-access_log combined
ErrorLog /var/log/apache2/evolv-web-error_log
<Directory />
AllowOverride All
Options FollowSymLinks -Indexes Includes ExecCGI
</Directory>
</VirtualHost>

-->

Code:

suexec -V
-D AP_DOC_ROOT="/var/www"
-D AP_GID_MIN=100
-D AP_HTTPD_USER="apache"
-D AP_LOG_EXEC="/var/log/apache2/suexec_log"
-D AP_SAFE_PATH="/usr/local/bin:/usr/bin:/bin"
-D AP_SUEXEC_UMASK=077
-D AP_UID_MIN=1000
-D AP_USERDIR_SUFFIX="public_html"

</entry>
<entry [Sat 2012:07:07 18:50:36 EST] MYSQL CACHING>

http://www.redips.net/wordpress/make-it-faster/#section2


1. USE ab TO BENCHMARK APACHE

The most common benchmarking tool in LAMP World is ab - Apache HTTP server benchmarking tool.

ab -h
   -n requests     Number of requests to perform
   -c concurrency  Number of multiple requests to make
   -t timelimit    Seconds to max. wait for responses

Web server will feel load of 10 clients concurrently, each client will send 10 requests:

ab -n100 -c10 localhost/agua/agua.html
<!--
   Server Software:        Apache/2.2.22
   Server Hostname:        localhost
   Server Port:            80
   
   Document Path:          /agua/agua.html
   Document Length:        1920 bytes
   
   Concurrency Level:      10
   Time taken for tests:   0.046 seconds
   Complete requests:      100
   Failed requests:        0
   Write errors:           0
   Total transferred:      219700 bytes
   HTML transferred:       192000 bytes
   Requests per second:    2160.34 [#/sec] (mean)
   Time per request:       4.629 [ms] (mean)
   Time per request:       0.463 [ms] (mean, across all concurrent requests)
   Transfer rate:          4635.03 [Kbytes/sec] received
   
   Connection Times (ms)
                 min  mean[+/-sd] median   max
   Connect:        0    0   0.9      0       4
   Processing:     2    4   1.1      4       7
   Waiting:        0    3   0.8      3       5
   Total:          2    4   1.1      4       7
   
   Percentage of the requests served within a certain time (ms)
     50%      4
     66%      5
     75%      5
     80%      5
     90%      6
     95%      6
     98%      7
     99%      7
    100%      7 (longest request)


-->


ab -n100 -c10 localhost/cgi-bin/agua/workflow.cgi


EXAMPLE

[dbunic ~]$ ab -n100 -c10 www.redips.net/wordpress/new-to-wordpress/
 
Concurrency Level:      10
Time taken for tests:   29.35572 seconds
Complete requests:      100
Failed requests:        0
Write errors:           0
Total transferred:      2134100 bytes
HTML transferred:       2114400 bytes
Requests per second:    3.44 [num/sec] (mean)
Time per request:       2903.557 [ms] (mean)
Time per request:       290.356 [ms] (mean, across all concurrent requests)
Transfer rate:          71.77 [Kbytes/sec] received

You can see how WordPress Web application can give only 3.44 requests per second and time taken for test is about 30 seconds. With some easy magic, LAMP server can be 150% faster 




2. USE MySQL CACHING

MySQL is simple and quick database but it can be even faster. By default, caching is turned off. To check MySQL caching, please log in to MySQL console and list Qcache variables:


show status like 'Qcache%';

   +-------------------------+----------+
   | Variable_name           | Value    |
   +-------------------------+----------+
   | Qcache_free_blocks      | 6        |
   | Qcache_free_memory      | 16602920 |
   | Qcache_hits             | 201      |
   | Qcache_inserts          | 162      |
   | Qcache_lowmem_prunes    | 0        |
   | Qcache_not_cached       | 170      |
   | Qcache_queries_in_cache | 60       |
   | Qcache_total_blocks     | 146      |
   +-------------------------+----------+

+-------------------------+-------+
| Variable_name           | Value |
+-------------------------+-------+
| Qcache_free_blocks      | 0     |
| Qcache_free_memory      | 0     |
| Qcache_hits             | 0     |
| Qcache_inserts          | 0     |
| Qcache_lowmem_prunes    | 0     |
| Qcache_not_cached       | 0     |
| Qcache_queries_in_cache | 0     |
| Qcache_total_blocks     | 0     |
+-------------------------+-------+

To turn on MySQL query cache, open /etc/my.cnf file and add query-cache-type and query-cache-size options in [mysqld] section. After file is saved, restart MySQL server.

[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
# Default to using old password format for compatibility with mysql 3.x
# clients (those using the mysqlclient10 compatibility package).
old_passwords=1
# turn on query cache
query-cache-type = 1
query-cache-size = 32M
 
[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
query-cache-type variable has three options:

0 or OFF
1 or ON
2 or DEMAND
query-cache-size defines size of cache and 32Mb is enough for some average Web application. After enabling MySQL cache, query cache variables should look:

mysql> show status like 'Qcache%';
+-------------------------+----------+
| Variable_name           | Value    |
+-------------------------+----------+
| Qcache_free_blocks      | 1        |
| Qcache_free_memory      | 33545600 |
| Qcache_hits             | 0        |
| Qcache_inserts          | 0        |
| Qcache_lowmem_prunes    | 0        |
| Qcache_not_cached       | 1        |
| Qcache_queries_in_cache | 0        |
| Qcache_total_blocks     | 1        |
+-------------------------+----------+


Please see how ab statistics looks after enabling MySQL cache for WordPress:

Concurrency Level:      10
Time taken for tests:   25.884421 seconds
Complete requests:      100
Requests per second:    3.86 [num/sec] (mean)
Time per request:       2588.442 [ms] (mean)
Time per request:       258.844 [ms] (mean, across all concurrent requests)
Transfer rate:          80.51 [Kbytes/sec] received
Hm, there is a small improvement for WordPress - from 3.44 to 3.86 requests per second. I expected better acceleration and the reason for a such score can be:

empty / small database (my test database contains only 5 articles)
small number of database queries on / per page
tested WordPress version doesn't have any additional modules
small number of tables in database (WordPress has only 10 tables)
optimized database queries
MySQL query cache settings will certainly give more speed for larger databases like phpBB and Joomla.


   
</entry>
<entry [Sat 2012:07:07 18:47:00 EST] HOW TO SECURE APACHE>

http://www.redips.net/linux/lamp-setup-apache-php/

2. Hide Apache version
Open httpd.conf file. In Linux/Unix installations it should be placed inside /etc directory and in RedHat family it is in /etc/httpd/conf/httpd.conf. Two lines have to be changed: ServerTokens and ServerSignature. Edit them to look like:

# return only "Server: Apache" in HTTP header instead of Apache version, OS and modules
ServerTokens Prod
 
# hide line containing the server version and virtual host
# name to server-generated pages (internal error documents, FTP directory
# listings, mod_status and mod_info output etc)
ServerSignature Off


6. Turn off directory browsing
In default Apache configuration, HTTP request on directory without index page will result with directory listing. This "feature" should be turned off. Open httpd.conf and find < Directory "/var/www/html"> where goes directives for document root. Inside should be Options directive with options Indexes and FollowSymLinks. Just place "-" (minus) before Indexes.

# The Options directive is both complicated and important.  Please see
# http://httpd.apache.org/docs/2.2/mod/core.html#options
# for more information.
Options -Indexes FollowSymLinks
FollowSymLinks enables Apache to follows symbolic links. If you haven't any symbolic links inside document root turn it off too with "-" before like -FollowSymLinks.



7. Make webalizer logs accessible only to your IP
After all this settings, it is good to monitor and analyse Web traffic. Why? First of all, only owner should be able to access Web statistics to avoid "referer spam" attack. What is referer spam attack? Client with fake referer frequently accesses site with public Web statistic and his only goal is to appear on referer top list. This way they got free link. Many useful informations can be read from Web statistic. For example, when is minimum load of site then is perfect time for backup and database optimization, or you can see top list of sites by hits and KBytes etc. By default, webalizer.conf allows access only from local host. Comment this two lines and add one with your IP or name like in example:
<!--
<Location /usage>
  Order deny,allow
  Deny from all
  # Allow from 127.0.0.1
  # Allow from ::1
  Allow from 123.123.123.123
  Allow from your.site.name
</Location>

-->

   
</entry>
<entry [Sat 2012:07:07 18:35:02 EST] ENABLED server-status PAGE>

1. mod_status IS ALREADY ENABLED

2. ADDED TO /etc/apache2/apache2.conf

<!--
#### SET SERVER STATUS PAGE
<Location /server-status>
SetHandler server-status
</Location>
-->   

3. RESTARTED APACHE

/usr/sbin/apache2 restart


</entry>
<entry [Sat 2012:07:07 18:12:34 EST] DISABLE UNNEEDED APACHE MODULES>


a2dismod

Your choices are:

actions
alias
apreq

#### HTTP AUTHENTICATION - NOT NEEDED
auth_basic   
authn_file
authz_default
authz_groupfile
authz_host
authz_user

autoindex
cgi
deflate
dir
env
mime
negotiation
perl
### reqtimeout
### setenvif    # Sets environment variables conditional on HTTP User-Agent
ssl
status


DISABLE COMMANDS:

a2dismod reqtimeout
a2dismod auth_basic authn_file authz_default authz_groupfile authz_host authz_user 
/usr/sbin/apache2 -t
   Invalid command 'Order', perhaps misspelled or defined by a module not included in the server configuration

   
   
REENABLE authz_host MODULE TO AVOID ERROR MESSAGE:

a2enmod authz_host
/usr/sbin/apache2 -t
   Syntax OK
   

a2dismod setenvif

   
REENABLE AUTHZ

a2enmod auth_basic authn_file authz_default authz_groupfile authz_host authz_user 

   
COMPREHENSIVE LIST OF APACHE MODULES

http://en.wikipedia.org/wiki/List_of_Apache_modules


SHORT LIST OF APACHE MODULES

manual.conf : This configuration file allows the manual to be accessed at http://localhost/manual/
perl.conf : mod_perl incorporates a Perl interpreter into the Apache web server, so that the Apache web server can directly execute Perl code.
php.conf : php5 module for php
proxy_ajp.conf : When loaded, the mod_proxy_ajp module adds support for proxying to an AJP/1.3 backend server such as Tomcat.
python.conf : mod_python is a module that embeds the Python language interpreter within the server, allowing Apache handlers to be written in Python.
squid.conf : Access to squid cache manager
ssl.conf : Apache SSL server configuration
webalizer.conf : Webalizer stats configuration
welcome.conf : This configuration file enables the default "Welcome" page if there is no default index page present for
the root URL.


ANOTHER LIST OF APACHE MODULES

http://www.redips.net/linux/lamp-setup-apache-php/
Here is my excluded modules list.

#LoadModule authn_dbm_module modules/mod_authn_dbm.so
#LoadModule authz_dbm_module modules/mod_authz_dbm.so
#LoadModule ldap_module modules/mod_ldap.so
#LoadModule authnz_ldap_module modules/mod_authnz_ldap.so
#LoadModule deflate_module modules/mod_deflate.so
#LoadModule usertrack_module modules/mod_usertrack.so
#LoadModule dav_module modules/mod_dav.so
#LoadModule dav_fs_module modules/mod_dav_fs.so
#LoadModule speling_module modules/mod_speling.so
#LoadModule proxy_module modules/mod_proxy.so
#LoadModule proxy_balancer_module modules/mod_proxy_balancer.so
#LoadModule proxy_ftp_module modules/mod_proxy_ftp.so
#LoadModule proxy_http_module modules/mod_proxy_http.so
#LoadModule proxy_connect_module modules/mod_proxy_connect.so
#LoadModule cgi_module modules/mod_cgi.so
Proxy, speling, dav, ldap are candidates for sure to be turned off. I don't use output compression so I turned off mod_deflate too. Same for mod_cgi, authn_dbm_module and authz_dbm_module. When you start to comment out needless modules be careful because of existing module dependencies. For example if you comment proxy_module only, but you leave proxy_balancer_module, proxy_ftp_module ... httpd will not run after restart. Instead there will be printed error message:

   
NOTES
-----

PROBLEM:

/usr/sbin/apache2
bad user name ${APACHE_RUN_USER}

SOLUTION:

this is because the value of ${APACHE_RUN_USER} is not getting picked up. Ideally it should be picked up from /etc/apache2/envvars

which has the following entries
# envvars – default environment variables for apache2ctl
# Since there is no sane way to get the parsed apache2 config in scripts, some
# settings are defined via environment variables and then used in apache2ctl,
# /etc/init.d/apache2, /etc/logrotate.d/apache2, etc.
export APACHE_RUN_USER=www-data
export APACHE_RUN_GROUP=www-data
export APACHE_PID_FILE=/var/run/apache2.pid
However, still in your case if these values are not picked up then goto the /etc/apache2/apache2.conf file and make the following changes
# These need to be set in /etc/apache2/envvars
# User ${APACHE_RUN_USER}
# Group ${APACHE_RUN_GROUP}
User www-data
Group www-data
   
</entry>
<entry [Sat 2012:07:07 16:42:37 EST] UNINSTALLED FASTCGI>

1. REMOVE ENTRY IN /etc/apache2/apache2.conf

<!--

#### FASTCGI
<IfModule mod_fastcgi.c>
   AddHandler fastcgi-script .fcgi .fcg
    FastCgiServer /var/www/cgi-bin/agua/workflow.fcgi -idle-timeout 60 -processes 2 
</IfModule>


-->

3. DISABLE MODULE

DISABLE

a2dismod fastacgi
service apache2 restart
 * Restarting web server apache2                                           ... waiting              [ OK ]
 
NB: THIS REMOVES THE FASTCGI CONF FILE FROM mods-enabled

cat /etc/apache2/mods-enabled/fastcgi.conf
<!--
<IfModule mod_fastcgi.c>
  AddHandler fastcgi-script .fcgi
  #FastCgiWrapper /usr/lib/apache2/suexec
  FastCgiIpcDir /var/lib/apache2/fastcgi
</IfModule>

-->



ENABLE
a2enmod

To install the mod_rewrite you have to type following commands:
#a2enmod rewrite
   
RELOAD

#/etc/init.d/apache2 force-reload
Example


</entry>
<entry [Sat 2012:07:07 02:23:02 EST] FIXED ERROR: 'require $classfile' FAILS ON SECOND CALL TO mod_perl SCRIPT>

PROBLEM:

THE SECOND TIME THE mod_perl SCRIPTS ARE CALLED, THE 'require $classfile' WILL FAIL:

{ error: 'workflow.cgi    require classfile failed: /mnt/agua/modperl/lib/Agua/Workflow.pm. error: Attempt to reload /mnt/agua/modperl/lib/Agua/Workflow.pm aborted.
Compilation failed in require at /mnt/agua/modperl/workflow.cgi line 86' }


DIAGNOSIS

BECAUSE THE SCRIPT IS ALREADY COMPILED, THE MODULE IS ALREADY LOADED


SOLUTION:

CHANGED THIS

if $@;

TO THIS:

if $@ and not $INC{"Agua/$class.pm"};

   
</entry>
<entry [Sat 2012:07:07 01:32:07 EST] TEST mod_perl CGI SCRIPTS>

AGUA
echo '{"username":"admin","password":"aaa","mode":"submitLogin","class":"Admin"}' | ./agua.cgi


WORKFLOW
echo '{"class":"Workflow","username":"admin","sessionId":"9999999999.9999.999","mode":"getData"}' | ./workflow.cgi


FOLDERS
echo '{"mode":"fileSystem","requestor":"admin","sessionId":"9999999999.9999.999","location":"/data/sequence/demo","url":"../modperl/folders.cgi?","username":"syoung","owner":"syoung","groupname":"","query":"/data/sequence/demo"}' | ./folders.cgi

echo '{"mode":"getTable","table":"sharedProjects","requestor":"admin","sessionId":"9999999999.9999.999","username":"syoung","owner":"syoung","class":"Workflow","SHOWLOG":4}' | ./agua.cgi 


ADMIN
echo '{"username":"admin","sessionId":"9999999999.9999.999","mode":"addGroup","data":{"username":"admin","sessionId":"9999999999.9999.999","groupname":"newERgroup","description":"newEr group desc","notes":"my notes"}}' | ./admin.cgi


VIEW
echo '{"project":"Project1","view":"View2","species":"human","build":"hg19","mode":"addView","username":"admin","sessionId":"9999999999.9999.999"}' | ./view.cgi

OK

echo '{"project":"Project1","view":"View3","species":"human","build":"hg19","mode":"viewStatus","username":"admin","sessionId":"9999999999.9999.999"}' | ./view.cgi

GIVES METHOD SIGNATURE ERROR... RETRY IN MORNING


THE FIRST FEW viewStatus POLLS OCCUR TOO SOON AFTER addView

I.E, BEFORE 'status' VALUE HAS BEEN INPUT INTO THE DATABASE, SO THE viewStatus CALL RETURNS 'none', AS EXPECTED

NOT SURE WHY viewStatus CALLS FAIL INSTEAD OF RETURNING 'none'


</entry>
<entry [Fri 2012:07:06 04:54:25 EST] CREATED workflow.cgi C BINARY FOR MODE_PERL workflow.pl>

workflow.cgi --> ../../modperl/workflow.pl

workflow.c LINE 35:
    execl("../modperl/workflow.pl", "'", number, NULL); 

1. SAVE OLD workflow.cgi

cd /var/www/cgi-bin/agua/
mv workflow.cgi workflow.cgi.plain


2. CREATE NEW workflow.cgi (TARGET: mod_perl workflow.pl)

cd /agua/private/cgi-bin/c/modperl
gcc workflow.c -o workflow.cgi
cp workflow.cgi /var/www/cgi-bin/agua


3. MOVE FAST CGI TESTING SCRIPTS TO private/cgi-bin

cd /var/www/cgi-bin/agua/
mv workflow.cgi.* /agua/private/cgi-bin
mv workflow.fcgi /agua/private/cgi-bin/
mv workflow.par* /agua/private/cgi-bin/

   
</entry>
<entry [Fri 2012:07:06 03:18:34 EST] FASTCGI/MOD_PERL PERFORMANCE BENCHMARK>

               mod_perl    fastcgi (off)  plain    MULTIPLE
getData        9.50        24.40          15.94    1.5
getStatus      0.56        17.67          17.62    30
checkfile      0.40        31.70          23.10    60
moveWorkflow   0.31        14.60          12.09    30
addStageParameter 0.44     31.70          23.05    50


CONCLUSION:

MOD_PERL IS BETWEEN 1.5 AND 60 TIMES FASTER THAN STANDARD CGI

FOR THE MAJORITY OF CALLS (I.E, EXCLUDING getData), MOD_PERL IS 30-60 TIMES FASTER !!!!


NB: DURING THE APPROX. MINUTE WHILE I WAS ALTERING THE STATUS OF PROJECT1.WORKFLOW1 THERE WERE THREE CALLS TO getStatus THAT TOOK ~14 SECONDS EACH (WITH A 0.5 SECOND CALL AMONG THEM)


</entry>
<entry [Fri 2012:07:06 01:29:23 EST] FIXED: CHANGES IN MOD_PERL SCRIPT NOT APPEARING IN SERVER>

KILL ALL APACHE PROCESSES THEN RESTARTED APACHE

killall /usr/sbin/apache2
service apache2 restart

   
</entry>
<entry [Fri 2012:07:06 01:25:36 EST] FIXED FindBin ERROR: $Bin IS /usr/sbin NOT /agua/modperl>

USED FindBin::Real INSTEAD OF FindBin

REPLACED

use FindBin qw($Bin);

WITH

use FindBin::Real qw(Bin);
my $Bin = FindBin::Real::Bin();

   
</entry>
<entry [Fri 2012:07:06 00:22:07 EST] FIXED ERROR ON APACHE restart 'apache2: Could not reliably determine the server's fully qualified domain name'>

PROBLEM:

service apache2 restart
 * Restarting web server apache2                                                                                                                    apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName
apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1 for ServerName    [ OK ]
 
SOLUTION:

ADDED THIS TO apache2.conf

ServerName syoung-Satellite-L355
   
</entry>
<entry [Thu 2012:07:05 19:57:59 EST] INSTALLED mod_perl>

1. INSTALL mod_perl

# Install the relevant packages 
sudo apt-get install apache2 apache2-mpm-prefork 
sudo apt-get install libapache2-mod-perl2 libapache2-mod-apreq2 

# Enable the apreq and mod perl modules 
a2enmod apreq 
a2enmod perl 

# Restart apache 
/etc/init.d/apache2 restart 

CONFIRM perl.load MODULE IS ENABLED:

ll  /etc/apache2/mods-enabled/
   
   lrwxrwxrwx 1 root root   27 Jul  5 20:00 perl.load -> ../mods-available/perl.load


2. INSTALL mod_perl 2

CHECK APACHE VERSION IS SUPPORTED

apache2 -v
   Server version: Apache/2.2.22 (Ubuntu)
   Server built:   Feb 13 2012 01:51:50

   OK - THIS VERSION OF MOD_PERL SUPPORTS UP TO APACHE 2.2.22


INSTALL libperl (TO AVOID make ERROR '/usr/bin/ld: cannot find -lperl')

sudo apt-get install libperl-dev

INSTALL MOD_PERL

cd /mnt/home/syoung/software/modperl/mod_perl-2.0.7
perl Makefile.PL MP_APXS=/usr/bin/apxs2

   [warning] mod_perl dso library will be built as mod_perl.so
   [warning] You'll need to add the following to httpd.conf:
   [warning] 
   [warning]   LoadModule perl_module modules/mod_perl.so
   [warning] 
   [warning] depending on your build, mod_perl might not live in
   [warning] the modules/ directory.
   
   [warning] Check the results of
   [warning] 
   [warning]   $ /usr/bin/apxs2 -q LIBEXECDIR
   [warning] 
   [warning] and adjust the LoadModule directive accordingly.


make && make test
make install
   OK

   
Simple config:

  LoadModule perl_module modules/mod_perl.so
  #PerlModule Apache::compat
  # your config comes here

For a more detailed version (including more options) refer to:

  docs/user/intro/start_fast.pod




3. INSTALL ModPerl::Registry PERL MODULE 

cpanm install apache2-dev 
cpanm install ModPerl::Registry
   OK
   
   Reading package lists... Done
   Building dependency tree       
   Reading state information... Done
   Note, selecting 'apache2-threaded-dev' instead of 'apache2-dev'
   The following packages will be REMOVED:
     apache2-prefork-dev
   The following NEW packages will be installed:
     apache2-threaded-dev
   ...
   

 
4. CONFIGURE MOD PERL IN APACHE CONFIG

NB: Apache::Registry WAS REPLACED BY ModPerl::Registry IN apache2+mod_perl2

ADD THIS TO THE END OF apache2.conf
<!--

Alias /modperl/ /mnt/agua/modperl/
LoadModule perl_module modules/mod_perl.so
PerlModule ModPerl::Registry

<Location /modperl>
  SetHandler perl-script
  PerlHandler ModPerl::Registry
  Options ExecCGI
  PerlSendHeader On
  allow from all
</Location>

-->


5. TEST mod_perl


cd /agua/modperl
./workflow.cgi '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}'




NOTES
-----

MOD_PERL IN 30 MINUTES (Apache::Registry, ETC.)
http://www.perl.com/pub/2002/03/22/modperl.html




LIST STATICALLY COMPILED MODULES INSIDE APACHE BINARY:
apache2 -l
   Compiled in modules:
     core.c
     mod_log_config.c
     mod_logio.c
     prefork.c
     http_core.c
     mod_so.c


PROBLEM:

make
   
   ************* WARNING *************
   
     Your Perl is configured to link against libgdbm, 
     but libgdbm.so was not found.
     You could just symlink it to /usr/lib/x86_64-linux-gnu/libgdbm.so.3.0.0
   

SOLUTION:

INSTALL libgdbm-dev



http://www.perlmonks.org/?node_id=769636

Even being able to successfully start Apache does not necessarily mean that its C sources are installed. Most distros only install the Apache runtime environment, i.e. compiled program, etc. (when you install the apache package), but not the source/header files. You typically need to install them separately via "*-dev" or "*-devel" packages.

If you intend to use packages supplied by the disto (or are generally not experienced with compiling stuff yourself), it's usually easier to also use the precompiled mod_perl distro package, if one is available..

   
</entry>
<entry [Thu 2012:07:05 18:15:04 EST] FOUND CONFUSION IN LOADING OF Net::LDAP>

pp -c workflow.par.pl 
Content-type: text/html

{ error: 'workflow.pl    input not defined' }Different modules for file 'Net/LDAP.pm' were found.
 -> Using '/mnt/external/Net/LDAP.pm'.
 -> Ignoring '/usr/local/share/perl/5.14.2/Net/LDAP.pm'.
Different modules for file 'Convert/ASN1/_decode.pm' were found.
 -> Using '/mnt/external/Convert/ASN1/_decode.pm'.
 -> Ignoring '/usr/local/share/perl/5.14.2/Convert/ASN1/_decode.pm'.
Different modules for file 'Convert/ASN1/_encode.pm' were found.
 -> Using '/mnt/external/Convert/ASN1/_encode.pm'.
 -> Ignoring '/usr/local/share/perl/5.14.2/Convert/ASN1/_encode.pm'.
Different modules for file 'Convert/ASN1/parser.pm' were found.
 -> Using '/mnt/external/Convert/ASN1/parser.pm'.
 -> Ignoring '/usr/local/share/perl/5.14.2/Convert/ASN1/parser.pm'.
Different modules for file 'Convert/ASN1.pm' were found.
 -> Using '/mnt/external/Convert/ASN1.pm'.
 -> Ignoring '/usr/local/share/perl/5.14.2/Convert/ASN1.pm'.
Different modules for file 'Net/LDAP/ASN.pm' were found.
 -> Using '/mnt/external/Net/LDAP/ASN.pm'.
 -> Ignoring '/usr/local/share/perl/5.14.2/Net/LDAP/ASN.pm'.
Different modules for file 'Net/LDAP/Message.pm' were found.
 -> Using '/mnt/external/Net/LDAP/Message.pm'.
 -> Ignoring '/usr/local/share/perl/5.14.2/Net/LDAP/Message.pm'.
Different modules for file 'Convert/ASN1/IO.pm' were found.
 -> Using '/mnt/external/Convert/ASN1/IO.pm'.
 -> Ignoring '/usr/local/share/perl/5.14.2/Convert/ASN1/IO.pm'.
Different modules for file 'Net/LDAP/Constant.pm' were found.
 -> Using '/mnt/external/Net/LDAP/Constant.pm'.
 -> Ignoring '/usr/local/share/perl/5.14.2/Net/LDAP/Constant.pm'.
/tmp/parlvNvQ: private subdirectory /tmp/par-root is unsafe (please remove it and retry your operation)


SOLUTION

REMOVED /tmp/external

pp -c workflow.par.pl 

Content-type: text/html

{ error: 'workflow.pl    input not defined' }/tmp/parl7P9R: private subdirectory /tmp/par-root is unsafe (please remove it and retry your operation)

/usr/bin/pp: Failed to extract a parl from 'PAR::StrippedPARL::Static' to file '/tmp/parl9d0iaPb' at /usr/share/perl5/PAR/Packer.pm line 1169, < DATA> line 1.



   
</entry>
<entry [Thu 2012:07:05 17:56:48 EST] USE Storable?>

http://search.cpan.org/dist/Storable/Storable.pm

Storable
If you need to a save a hash, array, or more complex data structure to use in its entirety at a later time, it is around 4 times faster to use storable than to read/write it from a text file.  Its simple to use, just two calls…
store(\%hash, $filename);
$hashref = retrieve($filename);
   
</entry>
<entry [Thu 2012:07:05 17:44:14 EST] CREATED workflow.app.pl BINARY WITH perlapp>

FAILED DUE TO PROBLEMS FINDING MooseX::Declare::Syntax::MethodDeclaration:

perlapp \
-M MooseX::Declare \
-M MooseX::Declare::Syntax::Keyword::Class \
-M MooseX::Declare::Syntax::MethodDeclaration \
-M MooseX::Declare::Syntax::Moose::Setup \
-o workflow.par.pl \
-lib /usr/local/share/perl/5.14.2 workflow.pl


PerlApp 9.1.1 build 295479
Copyright (C) 1998-2011 ActiveState Software Inc. All rights reserved.
Trial license (Expires: 2012-07-26)

****************************************************************************
* WARNING: Applications generated by this evaluation copy of PerlApp will  *
*          stop working after the end of the evaluation period: 2012-07-26 *
****************************************************************************

Use of uninitialized value $_ in exists at /usr/local/share/perl/5.14.2/namespace/autoclean.pm line 50.
Couldn't load class (MooseX::Declare::Syntax::MooseSetup) because: Couldn't load class (MooseX::Declare::Syntax::MethodDeclaration) because: Can't call method "on_scope_end" without a package or object reference at /usr/local/share/perl/5.14.2/namespace/autoclean.pm line 43.

   
   
</entry>
<entry [Thu 2012:07:05 17:35:58 EST] INSTALLED PERL DEV KIT TO USE perlApp>

1. INSTALLED ACTIVE PERL (REQUIRED BY PDK)

cd /mnt/home/syoung/software/activestate/activeperl
tar xvfx *
cd A*
sudo ./install.sh


2. INSTALLED PDK

cd /mnt/home/syoung/software/activestate/pdk/PDK-9.1.1.295479-linux-64
sudo ./install.sh
   
   Installing...
     - copying PDK files to /opt/pdk...
     - saving installer doc files...
     - configuring PDK installation at /opt/pdk...
   Done.
   
       The PDK is now installed on your system.  In most shells, use
       the following command to add '/opt/pdk/bin' to your PATH:
   
           PATH=/opt/pdk/bin:$PATH
   
       Run 'man pdk' or 'perldoc pdk' to read the documentation.  The PDK
       User Guide can be read by pointing your web browser at:
   
           file:///opt/pdk/share/doc/HTML/en/pdk/index.html


3. ADDED PDK DIR TO PATH IN .bash_profile

export PATH=/opt/pdk/bin:$PATH


   
   
</entry>
<entry [Thu 2012:07:05 03:39:14 EST] COMPARE PLAIN workflow.pl WITH workflow.fcgi AND workflow.par.pl>

PLAIN workflow.pl
-----------------

time ./workflow.pl  '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}' 

real	0m6.725s
user	0m6.224s
sys	0m0.184s

real	0m7.327s
user	0m6.316s
sys	0m0.288s


workflow.fcgi
-------------

time ./workflow.fcgi  '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}' 

   FindBin: 0.050193
   Internal Modules: 0.050326
   External Modules: 0.050429
   JSON Parser: 0.050728
   Instantiate Conf::Agua: 0.059939
   Instantiate Agua::Workflow: 1.172031

real	0m6.642s
user	0m6.116s
sys	0m0.240s


   FindBin: 0.039794
   Internal Modules: 0.039923
   External Modules: 0.040025
   JSON Parser: 0.040319
   Instantiate Conf::Agua: 0.042722
   Instantiate Agua::Workflow: 1.119655

real	0m6.566s
user	0m6.072s
sys	0m0.220s


workflow.par.pl
---------------

time ./workflow.par.pl  '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}' 

real	0m7.168s
user	0m6.620s
sys	0m0.212s

real	0m8.567s
user	0m6.420s
sys	0m0.228s


</entry>
<entry [Thu 2012:07:05 03:38:56 EST9. INSTALLED PAR AND TESTED RUNTIME] >
   
INSTALL PAR:

apt-get install libpar-packer-perl

NB: USED 'pp -M' TO FIX PROBLEM WITH NOT FINDING MooseX/Declare.pm IN @INC


CREATE BINARY

cd /var/www/cgi-bin/agua

#-I /usr/local/share

pp -B \
-M MooseX::Declare \
-M MooseX::Declare::Syntax::Keyword::Class \
-M Class::Load::XS \
-M MooseX::Declare::Syntax::MooseSetup \
-M MooseX::Declare::Syntax::Keyword::MethodModifier \
-M MooseX::Declare::Syntax::MethodDeclaration \
-M Time::localtime \
-o workflow.par.pl \
workflow.pl

pp -B -M MooseX::Declare -M MooseX::Declare::Syntax::Keyword::Class -I /usr/local/lib/perl/5.14.2 -I /usr/local/share/perl/5.14.2 -o workflow.par.pl workflow.pl


pp @par.settings.txt -o workflow.par.pl workflow.pl

WHERE par.settings.txt CONTAINS:

-M MooseX::Declare
-M MooseX::Declare::Syntax::Keyword::Class

RUN BINARY

./workflow.par.pl  '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}' 

   FindBin: 0.024425
   Internal Modules: 0.024563
   JSON Parser: 0.024875
   Instantiate Conf::Agua: 0.031638
   Instantiate Agua::Workflow: 1.220792
   workflow->getStatus(): 1.421781
   total: 7


TAKES THE SAME TIME AS workflow.pl !!!!

./workflow.pl  '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}' 
   
   FindBin: 0.04456
   Internal Modules: 0.044712
   JSON Parser: 0.045013
   Instantiate Conf::Agua: 0.047568
   Instantiate Agua::Workflow: 1.24712
   workflow->getStatus(): 1.486004
   total: 7


SO THE ONLY ADVANTAGE WITH PAR IS THAT YOU HAVE A SELF-CONTAINED PACKAGE, I.E., THERE IS NO REDUCTION IN THE TIME TAKEN TO LOAD LIBRARIES AT RUNTIME



NOTES
-----

http://search.cpan.org/~rschupp/PAR-1.005/lib/PAR.pm

A .par file is mostly a zip of the blib/ directory after the build process of a CPAN distribution. To generate a .par file yourself, all you have to do is compress the modules under arch/ and lib/, e.g.:

    % perl Makefile.PL
    % make
    % cd blib
    % zip -r mymodule.par arch/ lib/
Afterward, you can just use mymodule.par anywhere in your @INC, use PAR, and it will Just Work. Support for generating .par files is going to be in the next (beyond 0.2805) release of Module::Build.

For convenience, you can set the PERL5OPT environment variable to -MPAR to enable PAR processing globally (the overhead is small if not used); setting it to -MPAR=/path/to/mylib.par will load a specific PAR file. Alternatively, consider using the par.pl utility bundled with the PAR::Packer distribution, or using the self-contained parl utility which is also distributed with PAR::Packer on machines without PAR.pm installed.

Note that self-containing scripts and executables created with par.pl and pp may also be used as .par archives:

    % pp -o packed.exe source.pl        # generate packed.exe (see PAR::Packer)
    % perl -MPAR=packed.exe other.pl    # this also works
    % perl -MPAR -Ipacked.exe other.pl  # ditto
   
   
</entry>
<entry [Thu 2012:07:05 03:38:25 EST] TESTED RUNNING workflow.fcgi>

./workflow.fcgi  '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}'
   

FindBin: 0.054917
Internal Modules: 0.05505
External Modules: 0.055157

./workflow.pl '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}'

FindBin: 0.02478
Internal Modules: 0.024916
External Modules: 0.025029
malformed JSON string, neither array, object, number, string or atom, at character offset 0 (before "./workflow.pl") at (eval 677) line 161, < DATA> line 275.


1. CREATED workflow.cgi WHICH CALLS workflow.fcgi


cd /agua/private/cgi-bin/c/fcgi
gcc workflow.c -o workflow.cgi


2. REPLACED EXISTING workflow.cgi

cd /var/www/cgi-bin/agua
mv workflow.cgi workflow.cgi.plain
cp /agua/private/cgi-bin/c/fcgi/workflow.cgi .
chown root:root workflow.cgi
chmod 6755 workflow.cgi


3. COMPARED RUNTIMES OF workflow.fcgi AND workflow.pl


echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}' | time ./workflow.cgi 

FindBin: 0.022983
Internal Modules: 0.023117
External Modules: 0.023215
JSON Parser: 0.023623
Instantiate Conf::Agua: 0.026017
Instantiate Agua::Workflow: 1.976032
workflow->getStatus(): 2.245737

   7.09  user
   0.34  system
   0:11.30  elapsed
   65%   CPU

   
   
WHY HAS 11.3 SECONDS ELAPSED BUT THE APPLICATION ONLY RAN FOR 2.24 SECONDS?


USED strace:

echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"getStatus"}' | strace -cTf ./workflow.cgi -o /tmp/workflow.strace

em /tmp/workflow.strace


CONCLUSION:

THE MODULE LOADING IS TAKING ALL THE TIME AND FASTCGI DOES NOT AVOID THIS BECAUSE IT DOES NOT CACHE THE COMPILED PERL CODE

http://grokbase.com/p/modperl/modperl/0076nzcjws/apache-mod-perl-vs-fastcgi

   FastCGI with perl may or may not be that fast. I could be totally wrong here
   but I believe that FastCGI will be able to cache the perl runtime, but perl
   will still have to reload and recompile any scripts during every hit.


I.E., FASTCGI IS MORE USEFUL FOR HAVING A PERSISTENT MODEL ON THE SERVER




</entry>
<entry [Wed 2012:07:04 04:15:28 EST] INSTALL FASTCGI ON UBUNTU>

0. ENABLE MULTIVERSE PACKAGES 

libapache2-mod-fastcgi is in 'precise multiverse', which is not eanbled in the default installation of Ubuntu.

TO AVOID THESE ERRORS:

Package libapache2-mod-fastcgi is not available, but is referred to by another package

ADD THESE LINES TO 

/etc/apt/sources.list

    deb http://us.archive.ubuntu.com/ubuntu/ precise multiverse
    deb http://us.archive.ubuntu.com/ubuntu/ precise-updates multiverse


OR JUST COPY OVER FILE /etc/apt/sources.list (DID THIS)


1. INSTALL libapache2-mod-fastcgi

sudo apt-get install libapache2-mod-fastcgi


2. ENABLE mod_fastcgi MODULE (along with mod_actions)

sudo a2enmod fastcgi actions


3. EDIT APACHE CONFIG FILE

ADD TO THE BOTTOM OF /etc/apache2/apache2.conf (NB: RUNS TWO PROCESSES):

<!--

<IfModule mod_fastcgi.c>
   AddHandler fastcgi-script .fcgi .fcg
    FastCgiServer /var/www/cgi-bin/agua/workflow.fcgi -idle-timeout 60 -processes 2 
</IfModule>

-->


4. RESTART APACHE

sudo service apache2 restart


5. VERIFY TWO FCGI PROCESSES ARE RUNNING

ps aux | grep cgi
www-data  3861  0.0  0.0  82868  2696 ?        S    13:19   0:00 /usr/sbin/fcgi-pm -k start
www-data  3863 54.0  1.5 109452 44556 ?        R    13:19   0:02 /usr/bin/perl -w /var/www/cgi-bin/agua/workflow.fcgi
www-data  3920 47.0  1.2 101484 36536 ?        R    13:19   0:01 /usr/bin/perl -w /var/www/cgi-bin/agua/workflow.fcgi


NOTES
-----

1. FIXED ERROR 'Can't locate XXX.pm in @INC'


PROBLEM

CREATE workflow.par.pl WITH pp BUT GIVES THIS ERROR WHEN RUN:

'Could not find a suitable Class::Load implementation: Can't locate Class/Load/XS.pm in @INC'


SOLUTION

USE -M modulename OPTION

pp -o workflow.par.pl -I /usr/local/share -M MooseX::Declare workflow.pl


*** NB: DOESN'T WORK ON COMMAND LINE, MUST USE tkpp GUI ***



http://stackoverflow.com/questions/8038963/coul-not-find-a-suitable-classload-implementation

For some reason PAR can't find Class::Load::XS or Class::Load:PP.

You can try if those are at all on your include path with eg.:

perl -MClass::Load::PP -e1

If not, try to (re?)install them or fix your classpath. The corresponding files in your filesystem should be Class/Load/XS.pm and Class/Load/PP.pm.

If the oneliner doesn't give you an error, it could be that PAR uses different include paths.


SHOW INCLUDE PATHS:

perl -le 'print for @INC'


TEMPORARILY ADD TO PATH:

-I/my/path

OR, INSIDE PERL FILE:

use lib '/my/path'; 



2. INSTALL FASTCGI - APACHE CONFIGURATION

http://failover.co.za/2012/01/29/setup-apache-mpm-worker-fastcgi-php-fpm-apc/

Apache Configuration

I found that mod_fastcgi was automatically enabled upon install, but just to be sure we enable it anyway, along with mod_actions which we will be using.

sudo a2enmod fastcgi actions

   Module fastcgi already enabled
   Enabling module actions.
   To activate the new configuration, you need to run:
     service apache2 restart


I added the following to /etc/apache2/httpd.conf, but I’m sure you could also add it to a specific virtualhost. I also created the directory /var/www/fastcgi, you may also have change its’ ownership to be the same as the Apache or PHP-FPM processes so they can access the directory, it’s usually www-data on Ubuntu. We are also using Unix sockets to connect to the PHP-FPM process as this has less overhead than going through the TCP/IP stack.


<!--
<IfModule mod_fastcgi.c>
        Alias /php5.fastcgi /var/www/fastcgi/php5.fastcgi
        AddHandler php-script .php
        FastCGIExternalServer /var/www/fastcgi/php5.fastcgi -socket /var/run/php-fpm.sock
        Action php-script /php5.fastcgi virtual
 
# This part is not necessary to get it to work, but it stops anything else from being
# accessed from it by mistake or maliciously.
        <Directory "/var/www/fastcgi">
                Order allow,deny
                <Files "php5.fastcgi">
                        Order deny,allow
                </Files>
        </Directory>
</IfModule>

-->
In short it tells Apache to send all PHP files off to the PHP-FPM process. Seeing as we are using FastCGIExternalServer, FastCGI will let PHP-FPM do it’s own process management.



1. INSTALL mod_fastcgi

http://www.fastcgi.com/mod_fastcgi/docs/mod_fastcgi.html

DOWNLOADED FROM HERE:
http://www.fastcgi.com/dist/

Installing mod_fastcgi manually
==================================

  1. Copy or move the mod_fastcgi distribution directory to
     /usr/lib/apache2/modules/fastcgi.

     cp /mnt/home/syoung/software/fastcgi/mod_fastcgi-2.4.6.tar.gz
     
  2. Add the FastCGI module to < apache_dir>/src/Configuration.  Note
     that modules are listed in reverse priority order --- the ones that
     come later can override the behavior of those that come earlier.  I
     put mine just after the mod_cgi entry.

       AddModule modules/fastcgi/libfastcgi.a

  3. From the < apache_dir>/src directory, reconfigure and rebuild Apache.
<!--
       <apache_dir>/src$ ./Configure
       <apache_dir>/src$ make
    
-->     Install the new httpd.

  4. Edit the httpd configuration files to enable your FastCGI
     application(s).  See docs/mod_fastcgi.html for details.

  5. Stop and start the server.

<!--

       $ kill -TERM `cat <run_dir>/logs/httpd.pid`
       $ <run_dir>/bin/httpd -f <run_dir>/conf/httpd.conf

-->

3. 

https://help.ubuntu.com/community/HelpOnInstalling/FastCgi#Deploying_on_Apache

FastCGI is a method which enables a web server to communicate with long-running scripts. This has the advantage that the script is only started and initialized one time, and that data could be cached in memory from request to request, enhancing the performance of the CGI application.

Follow the basic installation for your operating system as described in other parts of the MoinMoin installation documentation. This is HelpOnInstalling/BasicInstallation and HelpOnInstalling/WikiInstanceCreation, or HelpOnInstalling/ApacheOnLinux in most cases. 

Contents

http://fastcgi.com - FastCGI Homepage

FastCGI — The Forgotten Treasure (introduction)

Deploying on Apache

To deploy MoinMoin using FastCGI you need an apache with mod_fastcgi. Please refer to the documentation of mod_fastcgi ( mod_fastcgi homepage ).

Don't forget to install the fastcgi Apache module (e.g. libapache2-mod-fastcgi). Then in places where the documentation refers to moin.cgi you use moin.fcg instead. Be sure that .fcg is handled by the FastCGI module (AddHandler fastcgi-script .fcg in your apache config).

Normally Apache will start CGI scripts with its own user and group, or with the user and group of the VirtualHost if you are using the suexec wrapper. To enable this with FastCGI you need to use FastCgiWrapper On in your Apache config (check your distributions and/or FastCGI Documentation).

Be sure to restart your Apache after you changed py files (i.e. the config) for a running FastCGI server, or you won't see any changes!

Script options

No matter how and where you install or how you configure, you can add some options (in Apache config or as self-running process). Here is a list of some options.

FastCgiExternalServer


-host [hostname:port]     - The port and on what host name to respond.
-idle-timeout [seconds]   - The number of seconds of inactivity allowed before request is aborted.

FastCgiServer


-port [port]              - The port the application will use for communication with the web server.
-idle-timeout [seconds]   - The number of seconds of inactivity allowed before request is aborted.
Example for Apache2 on Debian

Edit the /etc/apache2/conf.d/your_wiki:

<!--
<IfModule mod_fastcgi.c>
   AddHandler fastcgi-script .fcgi .fcg
   FastCgiServer /your/path/to/moin.fcg -idle-timeout 60 -processes 1
   ScriptAlias /your_wiki "/your/path/to/moin.fcg"
</IfModule>

-->
number of processes depends on your hardware..



Expand the Apache installation:

apt-get install libapache2-mod-fastcgi
a2enmod fastcgi
apache2ctl graceful

Now, your wiki should respond a little faster.

Running as an external application and/or on Windows

(see also ../ApacheOnWin32withFastCgi for a Windows-specific how-to)

MoinMoin can be run as an external application that answers FastCGI request via a local TCP/IP socket. This works on Windows as well. All you need to do (after having installed mod_fastcgi and a working MoinMoin instance) is this:

Select a port number for the internal communication. It should be larger than 1023. For this example, we chose 8888 (just for fun).
Add the following lines to your httpd.conf:

Alias /moin.fcg "/your/path/to/moin.fcg"
FastCgiExternalServer "/your/path/to/moin.fcg" -host localhost:8888
Edit moin.fcg. Replace

fcg = thfcgi.FCGI(handle_request, max_requests=max_requests, backlog=backlog, max_threads=max_threads)
with

fcg = thfcgi.FCGI(handle_request, 0, 8888, max_requests=max_requests, backlog=backlog, max_threads=max_threads)
Start the file moin.fcg manually like a Python script:

python moin.fcg
Start Apache.
Fallback to CGI if FastCGI is not available

Install and test MoinMoin according to HelpOnInstalling/ApacheOnLinux. Then make and test the changes to run mod_fastcgi. If you are satisfied, you can add the following block to your apache config:

<!--
<IfModule !mod_fastcgi.c>
    ScriptAlias /mywiki "/your/path/to/moin.cgi"
</IfModule>
<IfModule mod_fastcgi.c>
    AddHandler fastcgi-script .fcg
    ScriptAlias /mywiki "/your/path/to/moin.fcg"
</IfModule>
-->

Now Apache will use mod_fastcgi if available and otherwise use the slow cgi script.


</entry>