#!/usr/bin/perl -w

=head2

	APPLICATION 	workflow.cgi
	
	PURPOSE
	
		PRESENT JSON XMLHTTP REQUESTS TO AGUA BACKEND AND PROVIDE
		
		JSON RESPONSE IF AVAILABLE.
		
        TASKS INCLUDE:
        
            - AUTHENTICATION: LOGIN USING USERNAME AND PASSWORD OR 
            
              VALIDATION USING USERNAME AND SESSION ID
            
			- PERMIT CLASS-SPECIFIC (E.G., Agua::Workflow) METHOD CALLS

            - ALLOW ACCESS TO ALL API-SUPPORTED METHODS FOR EACH CLASS

=cut

use strict;

#### PRINT HEADER
print "Content-type: text/html\n\n";

BEGIN {
    use lib "/agua/lib";
}

#### FLUSH STDOUT SO THE MIME TYPE GETS OUT BEFORE ANY ERRORS
$| = 1;



#### USE LIBS
use FindBin::Real qw(Bin);
use lib "/agua/lib";
use lib FindBin::Real::Bin() . "/lib";

my $Bin = FindBin::Real::Bin();

print "Bin: $Bin\n";
exit;


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

print "{ error: 'workflow.CGI    input not defined' }" and exit if not defined $input or not $input or $input =~ /^\s*$/;

#### GET JSON
use JSON;
my $jsonParser = JSON->new();
my $json = $jsonParser->allow_nonref->decode($input);
print "{ 'error' : 'workflow.pl   JSON not defined' }" and exit if not defined $json;

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
#use strict;
#
#BEGIN {
#    use FindBin::Real qw(Bin);
#    use lib FindBin::Real::Bin() . "/lib";
#    use lib "/agua/lib";
#
##### USE LIBS
#use FindBin::Real qw(Bin);
#use lib FindBin::Real::Bin() . "/lib";
#
##### INTERNAL MODULES
#use Conf::Agua;
#use Util;
#
##### EXTERNAL MODULES
#use DBI;
#use DBD::mysql;
#use Data::Dumper;
#use Agua::Workflow;
#
##### USE LIBS
#use FindBin qw($Bin);
#use lib "$Bin/lib";
#use lib "/agua/lib";
#
#my $SHOWLOG     =   2;
#my $PRINTLOG    =   5;
#
##### GET CONF
#my $conf = Conf::Agua->new(
#	inputfile	=>	"$Bin/conf/default.conf",
#	backup		=>	1,
#    SHOWLOG     =>  2,
#    PRINTLOG    =>  4
#);
#
#my $object = Agua::Workflow->new({
#    conf        =>  $conf,
#    #SHOWLOG     =>  4,
#    SHOWLOG     =>  $SHOWLOG,
#    PRINTLOG    =>  $PRINTLOG
#});
#
#
#}
#
### This sets the real to the effective ID, and prevents
### an obscure error when starting apache/mod_perl
##$< = $>; # WORKAROUND
##$( = $) = 0; # set the group to root too
#
##### FLUSH STDOUT SO THE MIME TYPE GETS OUT BEFORE ANY ERRORS
#$| = 1;
#
#
##### PRINT HEADER WITH TEXT MIME TYPE
#print "Content-type: text/html\n\n";
#my $whoami = `whoami`;
#chomp($whoami);
#print "{ whoamiXXX: '$whoami'}\n";
#
#    print "BEGIN time: $begintime\n";
#    my $starttime = time() - $begintime;
#    print "START time: $starttime\n";
#
#    #### TIME BEFORE    
#	use Devel::Peek;
#	use Time::HiRes qw[gettimeofday tv_interval];
#	my $time = [gettimeofday()];	
#
#
##### GET PUTDATA
##my $input	= <STDIN>;
#my $input	= $ARGV[0];
#print "input: $input\n";
##### FLUSH
#$| = 1;
#if ( not defined $input or not $input or $input =~ /^\s*$/ )
#{
#	print "{ error: 'workflow.cgi: input not defined' }";
#
#	#### FLUSH
#	$| = 1;
#	exit;
#}
#
##### CHECK JSON
#use JSON;
#my $jsonObject = JSON->new();
#my $json = $jsonObject->decode($input);
#print "json: \n";
#use Data::Dumper;
#print Dumper $json;
#
#print "{ error: 'workflow.cgi    json not defined' }\n" and exit if not defined $json;
#
##### GET MODE
#my $mode = $json->{mode};
#print "{ error: 'workflow.cgi    mode not defined' }\n" and exit if not defined $mode;
#
##### GET USERNAME
#my $username = $json->{username};
#print "{ error: 'workflow.cgi    username not defined' }" and exit if not defined $username;
#
##### GET CLASS
#my $class = $json->{class} || "Workflow";
###$class = "NotFound";
##print "{ error: 'workflow.cgi    class not defined or empty' }" and exit if not defined $class or not $class;
##my $classfile    = FindBin::Real::Bin() . "/lib/Agua/$class.pm";
##print "{ error: 'workflow.cgi    classfile not found: $classfile' }" and exit if not -f $classfile;
##if ( not $INC{"Agua/$class.pm"} ) {
##    print "DOING eval { require $classfile }\n";
##    eval { require $classfile };
##    print "{ error: 'workflow.cgi    require classfile failed: $classfile. error: $@' }" and exit if $@;
##}
#
##### SET LOG
#my $logfile 	= FindBin::Real::Bin() . "/log/$username.$class.log";
#
###### GET CONF
##my $conf = Conf::Agua->new(
##	inputfile	=>	FindBin::Real::Bin() . "/conf/default.conf",
##	backup		=>	1,
##	logfile     =>  $logfile,
##    SHOWLOG     =>  2,
##    PRINTLOG    =>  2
##);
##
##my $module = "Agua::" . $class;
##my $object = $module->new({
##	conf      	=>  $conf,
##	json      	=>  $json,
##	logfile     =>  $logfile,
##	SHOWLOG     =>  $SHOWLOG,
##	PRINTLOG    =>  $PRINTLOG
##});
#
#
#my $logfile     =   "$Bin/log/agua-$username.workflow.log";
#$conf->logfile($logfile);
#$object->logfile($logfile);
#$object->initialise($json);
#
#warn "Instantiate Agua::Workflow: ", tv_interval($time), "\n";
#
##### RUN QUERY
#no strict;
#$object->$mode();
#use strict;
#
##
###### RUN QUERY
###no strict;
##if ( not $object->can($mode)) {
##    print "{ error : 'mode not supported: $mode' }";
##    exit(0);
##}
##
##$object->$mode();
###use strict;
##
##exit(0);
