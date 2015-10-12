#!/usr/bin/perl -w
use strict;

my $DEBUG = 0;
#$DEBUG = 1;

=head2

APPLICATION     config

PURPOSE

    1. CONFIGURE THE aguatest username
    
INPUT

	1. LOCATION OF aguatest username DUMP FILE

OUTPUT

    1. GRANT MYSQL username ACCESS AND MODIFICATION PRIVILEGES
	
		FOR AGUA MYSQL USER

USAGE

sudo ./config.pl [--username String] [--help]

--username  :	Name of username (default: aguatest)
--help      :   Print help info

EXAMPLES

sudo config.pl --username aguatest

=cut

#### FLUSH BUFFER
$| = 1;

#### USE LIB
use FindBin qw($Bin);
use lib "../../../lib";
use lib "../../../t/lib";

#### EXTERNAL MODULES
use Getopt::Long;
use Data::Dumper;

#### INTERNAL MODULES
use Conf::Agua;
use Agua::Workflow;

my $conf = Conf::Agua->new(
	inputfile	=>	"$Bin/../../conf/default.conf",
	backup		=>	1,
	separator	=>	"\t",
	spacer		=>	"\\s\+"
);

my $database = $conf->getKey('agua', 'TESTDATABASE');
my $username = $conf->getKey('agua', 'TESTUSERNAME');
my $password = $conf->getKey('agua', 'TESTPASSWORD');

#### GET OPTIONS
my $outputfile = "$Bin/../../html/json/getData.json";
my $help;
GetOptions (
    'database=s'    => \$database,
    'password=s'    => \$password,
    'username=s'    => \$username,
    'outputfile=s'  => \$outputfile,
    'help'          => \$help
) or die "No options specified. Try '--help'\n";

my $json = 	{
	database	=>	$database,
	username	=>	$username,
	password	=>	$password,
	dbtype		=>	"MySQL",
	sessionId	=>	"9999999999.9999.999"
};

my $workflow = Agua::Workflow->new(
	{
        'conf'      =>  $conf,
        'json'      =>  $json
	}
);

open my $oldout, ">&STDOUT"  or die "Can't duplicate STDOUT: $!";
open(STDOUT, ">$outputfile") or die "Can't redirect STDOUT to outputfile: $outputfile\n";
$workflow->getData();
open STDOUT, ">&", $oldout;

print "\n\nCompleted $0\n\n";
print "\n\nPrinted outputfile:\n\n$outputfile\n\n";

sub usage {
    print `perldoc $0`;
}
    


