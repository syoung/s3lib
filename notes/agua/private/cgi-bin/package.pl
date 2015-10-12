#!/usr/bin/perl -w

=head2

	APPLICATION     workflow.pl
	
	PURPOSE

		RESPOND TO CLIENT QUERIES:
			
			1. SAVE WORKFLOW JSON SENT BY CLIENT
		
    		2. RUN WORKFLOWS ON REQUEST
            
	USAGE
		
		./workflow.pl <mode> <database> [additional_arguments]
		
    EXAMPLES

			THE Package OBJECT PERFORMS THE FOLLOWING TASKS:
			
				1. SYNC PROJECTS AND WORKFLOWS
                

        SEE Agua/Package.pm FOR EXAMPLES

=cut

use strict;

#### PRINT HEADER
print "Content-type: text/html\n\n";

#### FLUSH STDOUT SO THE MIME TYPE GETS OUT BEFORE ANY ERRORS
$| = 1;

#### USE LIBS
use FindBin qw($Bin);
use lib "$Bin/lib";
use lib "$Bin/lib/external";

#### INTERNAL MODULES
use Agua::Package;
use Agua::DBaseFactory;

#### EXTERNAL MODULES
use DBI;
use DBD::SQLite;
use Data::Dumper;

#use IO::Handle;
#OUTPUT_HANDLE->autoflush(1);

use FileHandle;
STDOUT->autoflush;
STDERR->autoflush;


#### GET PUTDATA
my $input	= $ARGV[0];

print "{ error: 'workflow.pl    input not defined' }" 
	and exit if not defined $input
	or not $input or $input =~ /^\s*$/;

#### GET JSON
use JSON;
my $jsonParser = JSON->new();
#my $json = $jsonParser->allow_nonref->jsonToObj($input);
my $json = $jsonParser->allow_nonref->decode($input);
print "{ 'error' : 'workflow.pl   JSON not defined' }"
	and exit if not defined $json;

#### GET MODE
my $mode = $json->{mode};
print "{ error: 'workflow.pl    mode not defined' }"
	and exit if not defined $mode;

#### GET USERNAME
my $username = $json->{username};
print "{ error: 'view.cgi    username not defined' }" and exit if not defined $username;

#### MODULES
use FindBin qw($Bin);
use lib "$Bin/lib";
use Conf::Agua;

#### SET LOG
my $SHOWLOG     =   5;
my $PRINTLOG    =   5;

     =   "$Bin/log/agua-$username.workflow.log";

#### GET CONF
my $conf = Conf::Agua->new(
	inputfile	=>	"$Bin/conf/default.conf",
	backup		=>	1,
    logfile     =>  $logfile,
    SHOWLOG     =>  2,
    PRINTLOG    =>  4
);

my $workflow = Agua::Package->new({
    conf        =>  $conf,
    json        =>  $json,
    logfile     =>  $logfile,
    SHOWLOG     =>  $SHOWLOG,
    PRINTLOG    =>  $PRINTLOG
});

#### RUN QUERY
no strict;
my $result = $workflow->$mode();
use strict;

exit;
