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

			THE Workflow OBJECT PERFORMS THE FOLLOWING TASKS:
			
				1. SAVE WORKFLOWS
                
                2. RUN WORKFLOWS
				
                3. PROVIDE WORKFLOW STATUS

        SEE Workflow.pm FOR EXAMPLES

=cut

use strict;

use FCGI; # Imports the library; required line

$| = 1;

while (FCGI::accept >= 0) {

my $begintime;

BEGIN {
$begintime = time();
print "begintime: $begintime\n";
    
}


#### PRINT HEADER
print "Content-type: text/html\n\n";

#### FLUSH STDOUT SO THE MIME TYPE GETS OUT BEFORE ANY ERRORS
$| = 1;

    #### TIME BEFORE    
	use Devel::Peek;
	use Time::HiRes qw[gettimeofday tv_interval];
	my $time = [gettimeofday()];	

    #### MEMORY USAGE BEFORE    
	warn "Beginning memory usage: ";
    warn qx{ ps -o rss,vsz $$ }, "\n";

#### USE LIBS
use FindBin qw($Bin);
use lib "$Bin/lib";
use lib "$Bin/lib/external";

warn "FindBin: ", tv_interval($time), "\n";

#### INTERNAL MODULES
use Agua::Workflow;
use Agua::DBaseFactory;
use Conf::Agua;

warn "Internal Modules: ", tv_interval($time), "\n";

#### EXTERNAL MODULES
use DBI;
use DBD::SQLite;
use Data::Dumper;

warn "External Modules: ", tv_interval($time), "\n";

#use IO::Handle;
#OUTPUT_HANDLE->autoflush(1);
#use FileHandle;
#STDOUT->autoflush;
#STDERR->autoflush;

#### GET PUTDATA
my $input	= $ARGV[0];

print "{ error: 'workflow.pl    input not defined' }" and exit if not defined $input or not $input or $input =~ /^\s*$/;

#### GET JSON
use JSON;
my $jsonParser = JSON->new();
#my $json = $jsonParser->allow_nonref->jsonToObj($input);
my $json = $jsonParser->allow_nonref->decode($input);
print "{ 'error' : 'workflow.pl   JSON not defined' }" and exit if not defined $json;

warn "JSON Parser: ", tv_interval($time), "\n";


#### GET MODE
my $mode = $json->{mode};
print "{ error: 'workflow.pl    mode not defined' }" and exit if not defined $mode;

#### GET USERNAME
my $username = $json->{username};
print "{ error: 'view.cgi    username not defined' }" and exit if not defined $username;

#### SET LOG
my $SHOWLOG     =   2;
my $PRINTLOG    =   5;
my $logfile     =   "$Bin/log/agua-$username.workflow.log";

#### GET CONF
my $conf = Conf::Agua->new(
	inputfile	=>	"$Bin/conf/default.conf",
	backup		=>	1,
    logfile     =>  $logfile,
    SHOWLOG     =>  2,
    PRINTLOG    =>  4
);

warn "Instantiate Conf::Agua: ", tv_interval($time), "\n";


my $workflow = Agua::Workflow->new({
    conf        =>  $conf,
    json        =>  $json,
    logfile     =>  $logfile,
    #SHOWLOG     =>  4,
    SHOWLOG     =>  $SHOWLOG,
    PRINTLOG    =>  $PRINTLOG
});


warn "Instantiate Agua::Workflow: ", tv_interval($time), "\n";

#### RUN QUERY
no strict;
my $result = $workflow->$mode();
use strict;

warn "workflow->$mode(): ", tv_interval($time), "\n";

my $endtime = time();
print "total: " . ($endtime - $begintime) . "\n";


} #### while (FCGI::accept >= 0) {
