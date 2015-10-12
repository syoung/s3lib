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

my $begintime;

use lib "/agua/lib";

BEGIN {

 my $BEGIN = time();
    $begintime = $BEGIN;
}

my $pwd = `pwd`;

use Agua::Workflow;

#### PRINT HEADER
print "Content-type: text/html\n\n";

#print "pwd: $pwd\n";

#print "begintime: $begintime\n";

#### FLUSH STDOUT SO THE MIME TYPE GETS OUT BEFORE ANY ERRORS
$| = 1;

    #### TIME BEFORE    
	use Devel::Peek;
	use Time::HiRes qw[gettimeofday tv_interval];
	
    my $time = [gettimeofday()];
    
#### USE LIBS
use FindBin::Real qw(Bin);
use lib FindBin::Real::Bin() . "/lib";

#warn "FindBin: ", tv_interval($time), "\n";

#### INTERNAL MODULES
use Agua::Workflow;
use Agua::DBaseFactory;
use Conf::Agua;

#warn "Internal Modules: ", tv_interval($time), "\n";

#### EXTERNAL MODULES
use DBI;
use DBD::SQLite;
use Data::Dumper;


#### GET PUTDATA
my $input	= $ARGV[0];
#my $input	= <STDIN>;

print "{ error: 'workflow.CGI    input not defined' }" and exit if not defined $input or not $input or $input =~ /^\s*$/;

#### GET JSON
use JSON;
my $jsonParser = JSON->new();
#my $json = $jsonParser->allow_nonref->jsonToObj($input);
my $json = $jsonParser->allow_nonref->decode($input);
print "{ 'error' : 'workflow.pl   JSON not defined' }" and exit if not defined $json;

#warn "JSON Parser: ", tv_interval($time), "\n";


#### GET MODE
my $mode = $json->{mode};
print "{ error: 'workflow.pl    mode not defined' }" and exit if not defined $mode;

#### GET USERNAME
my $username = $json->{username};
print "{ error: 'view.cgi    username not defined' }" and exit if not defined $username;

#### SET LOG
my $SHOWLOG     =   2;
my $PRINTLOG    =   5;
my $logfile     =   FindBin::Real::Bin() . "/log/agua-$username.workflow.log";

#### GET CONF
my $conf = Conf::Agua->new(
	inputfile	=>	FindBin::Real::Bin() . "/conf/default.conf",
	backup		=>	1,
    logfile     =>  $logfile,
    SHOWLOG     =>  2,
    PRINTLOG    =>  4
);

#warn "Instantiate Conf::Agua: ", tv_interval($time), "\n";


my $workflow = Agua::Workflow->new({
    conf        =>  $conf,
    json        =>  $json,
    logfile     =>  $logfile,
    #SHOWLOG     =>  4,
    SHOWLOG     =>  $SHOWLOG,
    PRINTLOG    =>  $PRINTLOG
});


#warn "Instantiate Agua::Workflow: ", tv_interval($time), "\n";

#### RUN QUERY
no strict;
my $result = $workflow->$mode();
use strict;

#warn "\nworkflow->$mode(): ", tv_interval($time), "\n";

#my $endtime = time();
#print "total: " . ($endtime - $begintime) . "\n";
