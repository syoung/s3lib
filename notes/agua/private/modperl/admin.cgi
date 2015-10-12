#!/usr/bin/perl -w

=head2

	APPLICATION 	agua.cgi
	
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

BEGIN {
    use FindBin::Real qw(Bin);
    use lib FindBin::Real::Bin() . "/lib";
    use lib "/agua/lib";
}

#### PRINT HEADER WITH TEXT MIME TYPE
print "Content-type: text/html\n\n";

#### FLUSH STDOUT SO THE MIME TYPE GETS OUT BEFORE ANY ERRORS
$| = 1;

#### USE LIBS
use FindBin::Real qw(Bin);
use lib FindBin::Real::Bin() . "/lib";

#### INTERNAL MODULES
use Conf::Agua;
use Util;

#### EXTERNAL MODULES
use DBI;
use DBD::mysql;
use Data::Dumper;

#### GET PUTDATA
my $input	= <STDIN>;

#### FLUSH
$| = 1;
if ( not defined $input or not $input or $input =~ /^\s*$/ )
{
	print "{ error: 'agua.cgi: input not defined' }";

	#### FLUSH
	$| = 1;
	exit;
}

#### CHECK JSON
use JSON;
my $jsonObject = JSON->new();
my $json = $jsonObject->decode($input);
print "{ error: 'agua.cgi    json not defined' }\n" and exit if not defined $json;

#### GET MODE
my $mode = $json->{mode};
print "{ error: 'agua.cgi    mode not defined' }\n" and exit if not defined $mode;

#### GET USERNAME
my $username = $json->{username};
print "{ error: 'agua.cgi    username not defined' }" and exit if not defined $username;

#### GET CLASS
my $class = $json->{class} || "Admin";
#$class = "NotFound";
print "{ error: 'agua.cgi    class not defined or empty' }" and exit if not defined $class or not $class;
my $classfile    = FindBin::Real::Bin() . "/lib/Agua/$class.pm";
print "{ error: 'agua.cgi    classfile not found: $classfile' }" and exit if not -f $classfile;
eval { require $classfile };
print "{ error: 'agua.cgi    require classfile failed: $classfile' }" and exit if $@ and not $INC{"Agua/$class.pm"};

#### SET LOG
my $SHOWLOG     =   2;
my $PRINTLOG    =   5;
my $logfile 	= FindBin::Real::Bin() . "/log/$username.$class.log";

#### GET CONF
my $conf = Conf::Agua->new(
	inputfile	=>	FindBin::Real::Bin() . "/conf/default.conf",
	backup		=>	1,
	logfile     =>  $logfile,
    SHOWLOG     =>  2,
    PRINTLOG    =>  2
);

my $module = "Agua::" . $class;
my $object = $module->new({
	conf      	=>  $conf,
	json      	=>  $json,
	logfile     =>  $logfile,
	SHOWLOG     =>  $SHOWLOG,
	PRINTLOG    =>  $PRINTLOG
});

#### RUN QUERY
#no strict;
if ( not $object->can($mode)) {
    print "{ error : 'mode not supported: $mode' }";
    exit(0);
}
$object->$mode();
#use strict;

exit(0);
