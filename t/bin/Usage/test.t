#!/usr/bin/perl -w

=head2
	
APPLICATION 	test.t

PURPOSE

	Test Usage module
	
NOTES

	1. RUN AS ROOT
	
	2. BEFORE RUNNING, SET ENVIRONMENT VARIABLES, E.G.:
	
		export installdir=/agua/location

=cut

use Test::More 	tests => 10;
use Getopt::Long;

use FindBin qw($Bin);
use lib "$Bin/../../../lib";		#### TEST MODULES
use lib "$Bin/../../../../lib";		#### TEST MODULES
BEGIN
{
    my $installdir = $ENV{'installdir'} || "/a";
    unshift(@INC, "$installdir/lib");
    unshift(@INC, "$installdir/apps/broadbp/t/lib");
    unshift(@INC, "$installdir/apps/broadbp/lib");
}

#### CREATE OUTPUTS DIR
my $outputsdir = "$Bin/outputs";
`mkdir -p $outputsdir` if not -d $outputsdir;

BEGIN {
	use_ok('Test::Usage');
}
require_ok('Test::Usage');

#### SET CONF FILE
my $installdir  =   $ENV{'installdir'} || "/a";
my $urlprefix  	=   $ENV{'urlprefix'} || "agua";

#### GET OPTIONS
my $logfile 	= 	"$Bin/outputs/test.log";
my $log     	=   2;
my $printlog    =   5;
my $help;
GetOptions (
    'log=i'     => \$log,
    'printlog=i'    => \$printlog,
    'logfile=s'     => \$logfile,
    'help'          => \$help
) or die "No options specified. Try '--help'\n";
usage() if defined $help;

my $object = new Test::Usage(
    logfile     =>  $logfile,
	log     	=>  $log,
	printlog    =>  $printlog
);
isa_ok($object, "Test::Usage", "object");

#### TESTS
$object->testGetUsage();
$object->testReport();


#### SATISFY Agua::Logger::logError CALL TO EXITLABEL
no warnings;
EXITLABEL : {};
use warnings;

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#                                    SUBROUTINES
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

sub usage {
    print `perldoc $0`;
}

