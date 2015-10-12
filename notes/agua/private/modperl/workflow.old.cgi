#!/usr/bin/perl -w

=head2

	APPLICATION     workflow.cgi
	
	PURPOSE

		RESPOND TO CLIENT QUERIES:
			
			1. SAVE WORKFLOW JSON SENT BY CLIENT
		
    		2. RUN WORKFLOWS ON REQUEST
            
	USAGE
		
		SEE WEB API AT www.aguadev.org
		
    EXAMPLES

			THE Workflow OBJECT PERFORMS THE FOLLOWING TASKS:
			
				1. SAVE WORKFLOWS
                
                2. RUN WORKFLOWS
				
                3. PROVIDE WORKFLOW STATUS

        SEE Workflow.pm FOR EXAMPLES

=cut

use strict;

BEGIN {
    use FindBin::Real qw(Bin);
    use lib FindBin::Real::Bin() . "/lib";
    use lib "/agua/lib";
}


#### PRINT HEADER
print "Content-type: text/html\n\n";

#### FLUSH STDOUT SO THE MIME TYPE GETS OUT BEFORE ANY ERRORS
$| = 1;

#### USE LIBS
use FindBin::Real qw(Bin);
#use lib "/agua/lib";
#use lib FindBin::Real::Bin() . "/lib";

#### INTERNAL MODULES
use Agua::Workflow;
use Agua::DBaseFactory;
use Conf::Agua;

#### EXTERNAL MODULES
use DBI;
use DBD::SQLite;
use Data::Dumper;

#### GET PUTDATA
#my $input	= $ARGV[0];
my $input = <STDIN>;

print "{ error: 'workflow.cgi    input not defined' }" and exit if not defined $input or not $input or $input =~ /^\s*$/;

#### GET JSON
use JSON;
my $jsonParser = JSON->new();
my $json = $jsonParser->allow_nonref->decode($input);
print "{ 'error' : 'workflow.cgi   JSON not defined' }" and exit if not defined $json;

#### GET MODE
my $mode = $json->{mode};
print "{ error: 'workflow.cgi    mode not defined' }" and exit if not defined $mode;

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

my $workflow = Agua::Workflow->new({
    conf        =>  $conf,
    json        =>  $json,
    logfile     =>  $logfile,
    #SHOWLOG     =>  4,
    SHOWLOG     =>  $SHOWLOG,
    PRINTLOG    =>  $PRINTLOG
});

#### RUN QUERY
no strict;
my $result = $workflow->$mode();
use strict;

exit;