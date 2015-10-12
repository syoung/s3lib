#!/usr/bin/perl -w

#### DEBUG
my $DEBUG = 0;
#$DEBUG = 1;

=head2

	APPLICATION 	view.cgi
	
	PURPOSE
		
		THIS APPPLICATION USES THE View.pm MODULE TO PERFORM THE
		
		FOLLOWING TASKS:
		
			1. ADD/REMOVE Views
			
			2. ALTER Views

`   USAGE

        INPUTS ARE 'PUT' (EQUIVALENT TO STDIN) TO THIS APPLICATION 
        
        IN JSON FORMAT.
        
        THE FOLLOWING JSON HASH KEYS ARE REQUIRED:
        
        mode        Name of subroutine to be executed
        
        username    Short username of clintt
        
        password    Database password
		
        sessionId   If session has already been created
        
=cut

use strict;

#### PRINT HEADER
print "Content-type: text/html\n\n";

#### FLUSH STDOUT SO THE MIME TYPE GETS OUT BEFORE ANY ERRORS
$| = 1;

print "view.cgi    $0\n" if $DEBUG;

#### USE LIBS
use FindBin qw($Bin);
use lib "$Bin/lib";
use lib "$Bin/lib/external";

#### INTERNAL MODULES
use Agua::View;
use Agua::DBaseFactory;
use Util;

#### EXTERNAL MODULES
use DBI;
use DBD::SQLite;
use Data::Dumper;

#### GET PUTDATA
my $input	= $ARGV[0];
print "view.cgi    input: $input\n" if $DEBUG;
print "{ error: 'view.cgi    input not defined' }"
	and exit if not defined $input
	or not $input or $input =~ /^\s*$/;

#### GET JSON
use JSON;
my $jsonParser = JSON->new();
my $json = $jsonParser->allow_nonref->decode($input);
print "{ 'error' : 'view.cgi   json not defined' }" and exit if not defined $json;
print "view.cgi    json: \n" if $DEBUG;
print Dumper $json if $DEBUG;

#### GET MODE
my $mode = $json->{mode};
print "{ error: 'view.cgi    mode not defined' }" and exit if not defined $mode;
print "view.cgi    mode: $mode\n" if $DEBUG;

#### GET USERNAME
my $username = $json->{username};
print "{ error: 'view.cgi    username not defined' }" and exit if not defined $username;
print "view.cgi    username: $username\n" if $DEBUG;

#### SET LOG
my $SHOWLOG     = 2;
my $PRINTLOG    = 5;
my $logfile 	= "$Bin/log/agua-$username.view.log";

#### GET CONF
use FindBin qw($Bin);
use lib "$Bin/lib";
use Conf::Agua;

my $conf = Conf::Agua->new(
	inputfile	=>	"$Bin/conf/default.conf",
	backup		=>	1,
    logfile     =>  $logfile,
    SHOWLOG     =>  $SHOWLOG,
    PRINTLOG    =>  $PRINTLOG
);

#### INSTIANTIATE View OBJECT
my $view = Agua::View->new({
    conf    	=>  $conf,
    json    	=>  $json,
    logfile     =>  $logfile,
    SHOWLOG     =>  $SHOWLOG,
    PRINTLOG    =>  $PRINTLOG
});

#### RUN QUERY
if ( not $view->can($mode)) {
    print "{ error : 'mode not supported: $mode' }";
    exit;
}
$view->$mode($json);
exit;
