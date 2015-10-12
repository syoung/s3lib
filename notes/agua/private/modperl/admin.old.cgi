#!/usr/bin/perl -w

=head2

	APPLICATION 	admin.cgi
	
	PURPOSE
	
		RESPOND TO XMLHTTPRequest LOGIN AUTHENTICATION QUERIES
		
        TO DO:
        
            - Login USING USERNAME AND PASSWORD
            
            - Validation USING USERNAME AND SESSION ID
            
            - CREATE NEW DATABASE

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
use Agua::Admin;
use Agua::DBaseFactory;
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
	print "{ error: 'admin.cgi: input not defined' }";

	#### FLUSH
	$| = 1;
	exit;
}

#### CHECK JSON
use JSON;
my $jsonObject = JSON->new();
my $json = $jsonObject->decode($input);
print "{ error: 'admin.cgi    json not defined' }\n" and exit if not defined $json;

#### GET MODE
my $mode = $json->{mode};
print "{ error: 'admin.cgi    mode not defined' }\n" and exit if not defined $mode;

#### GET USERNAME
my $username = $json->{username};
print "{ error: 'view.cgi    username not defined' }" and exit if not defined $username;

#### GET CLASS


#### SET LOG
my $SHOWLOG     =   2;
my $PRINTLOG    =   5;
my $logfile 	= FindBin::Real::Bin() . "/log/agua-$username.admin.log";

#### GET CONF
my $conf = Conf::Agua->new(
	inputfile	=>	FindBin::Real::Bin() . "/conf/default.conf",
	backup		=>	1,
	logfile     =>  $logfile,
    SHOWLOG     =>  2,
    PRINTLOG    =>  2
);

my $admin = Agua::Admin->new({
	conf      	=>  $conf,
	json      	=>  $json,
	logfile     =>  $logfile,
	SHOWLOG     =>  $SHOWLOG,
	PRINTLOG    =>  $PRINTLOG
});

#### RUN QUERY
no strict;
my $result = $admin->$mode();
use strict;

exit;
