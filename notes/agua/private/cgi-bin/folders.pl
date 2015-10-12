#!/usr/bin/perl -U

#### DEBUG
my $DEBUG = 0;
#$DEBUG = 1;

=head2

	APPLICATION 	folders.pl
	
	PURPOSE
		
        SUBMISSION OF REQUESTS TO project.pl, WHICH USES Project.pm
		
		TO PERFORM THE FOLLOWING TASKS:
        
            1. RETURN FILE AND DIRECTORY LIST OF A GIVEN PATH

            2. MAINTAIN A DATABASE TABLE OF THE HIERARCHY OF FOLDERS:
                
            3. MAINTAIN THE USER/GROUP/WORLD PERMISSIONS ON THE PROJECT FOLDERS
                
            4. PROVIDE THE FOLLOWING FUNCTIONALITY:

    NOTES
        
        MUST DO THE FOLLOWING FOR THIS SCRIPT TO WORK:
        
            1. SET SUID BIT FOR UID AND GID OF SCRIPT ON LINUX COMMAND LINE
				
				chown root:root folders.cgi;
				chmod u+s folders.cgi; chmod g+s folders.cgi;
				OR JUST:
				chmod 5755 folders.cgi
				
				ll folders.cgi
				
					-rwsr-xr-x 1 root root 3.0K 2012-02-16 10:33 folders.pl
	USAGE

echo '<username> <sessionId> <mode>' | folders.pl 

    EXAMPLES

echo '{"mode":"fileSystem,sessionId":"1226547894.7868.158,username":"admin,path":".%2FProject1%2Finputdir"}' | ./folders.pl

=cut

use strict;

#### DEBUG HEADER
print "Content-type: text/html\n\n";

#### USE LIBS
use FindBin qw($Bin);
use lib "$Bin/lib";
use lib "$Bin/lib/external";

#### INTERNAL MODULES
use Agua::Admin;
use Agua::DBaseFactory;
use Agua::Folders;

#use Util;

#### EXTERNAL MODULES
use DBI;
use DBD::SQLite;
use Data::Dumper;
use Util;

my $input = $ARGV[0];
if ( not defined $input )
{
    print "folders.pl    Getting input from QUERY_STRING\n" if $DEBUG;
    $input = $ENV{'QUERY_STRING'};
}
print "folders.pl    input: $input\n" if $DEBUG;

#### CREATE CGI OBJECT TO BE PASSED TO Project.pm
#### FOR USE IN ITS cgiParam METHOD
use Agua::JSON;
my $jsonparser = Agua::JSON->new(SHOWLOG => 0);
my $json = $jsonparser->decode($input);
print "{ error: 'folders.pl    json not defined' }\n" and exit if not defined $json;
print "folders.pl    json:\n" if $DEBUG;
print Dumper $json if $DEBUG;

#### GET mode
my $mode = $json->{mode};
print "folders.pl    mode: $mode\n" if $DEBUG;
print "{ error: 'folders.pl    mode not defined' }" and exit if not defined $mode;

#### GET USERNAME
my $username = $json->{username};
print "{ error: 'folders.pl    username not defined' }" and exit if not defined $username;
print "folders.pl    username: $username\n" if $DEBUG;

#### SET LOG
my $SHOWLOG     =   2;
my $PRINTLOG    =   5;
my $logfile 	= "$Bin/log/agua-$username.folders.log";

#### GET CONF
use FindBin qw($Bin);
use lib "$Bin/lib";
use Conf::Agua;
my $conf = Conf::Agua->new(
	inputfile	=>	"$Bin/conf/default.conf",
	backup		=>	1,
    logfile     =>  $logfile,
    SHOWLOG     =>  2,
    PRINTLOG    =>  2
);
print "folders.pl     conf: \n" if $DEBUG;
print Dumper $conf if $DEBUG;

#### CHECK mode IS DEFINED
print "{ error: 'Mode not defined' }" and exit if not defined $mode;

print "folders.pl    BEFORE Project->new()\n" if $DEBUG;
my $project = Agua::Folders->new(
	{
		json	    =>	$json,
        conf      	=>  $conf,
        logfile     =>  $logfile,
        SHOWLOG     =>  $SHOWLOG,
        PRINTLOG    =>  $PRINTLOG
	}
);

#### RUN QUERY
no strict;
my $result = $project->$mode();
use strict;

exit;
