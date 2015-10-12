#!/usr/bin/perl -w
use strict;

my $DEBUG = 0;
#$DEBUG = 1;

=head2

APPLICATION     config

PURPOSE

    1. CONFIGURE THE aguatest DATABASE
    
INPUT

	1. LOCATION OF aguatest DATABASE DUMP FILE

OUTPUT

    1. GRANT MYSQL DATABASE ACCESS AND MODIFICATION PRIVILEGES
	
		FOR AGUA MYSQL USER

USAGE

sudo ./config.pl [--database String] [--help]

--database  :	Name of database (default: aguatest)
--help      :   Print help info

EXAMPLES

sudo config.pl --database aguatest

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
use Test::Agua::Configure;
use Agua::DBaseFactory;
use Conf::Agua;

my $conf = Conf::Agua->new(
	inputfile	=>	"$Bin/conf/default.conf",
	backup		=>	1,
	separator	=>	"\t",
	spacer		=>	"\\s\+"
);
my $database = $conf->getKey('agua', 'TESTDATABASE');
my $username = $conf->getKey('agua', 'TESTUSERNAME');
my $password = $conf->getKey('agua', 'TESTPASSWORD');
my $email = $conf->getKey('agua', 'TESTEMAIL');

#### GET OPTIONS
my $logfile;
my $help;
GetOptions (
    'database=s'    => \$database,
    'username=s'    => \$username,
    'password=s'    => \$password,
    'logfile=s'     => \$logfile,
    'help'          => \$help
) or die "No options specified. Try '--help'\n";

my $configObject = Test::Agua::Configure->new(
    {
        configfile	=>  "$Bin/../../../conf/default.conf",
        database    =>  $database,
        logfile     =>  $logfile,
		username	=>	$username,
		requestor	=>	'admin',
		json		=>	{
			data	=>	{
				username	=>	$username,
				password	=>	$password,
				email		=>	$email,
				firstname	=>	$username,
				lastname	=>	$username,
				description	=>	'User for running tests with aguatest database'
			}
		}
	}
);
$configObject->config();
print "\n\nCompleted $0\n\n";

sub usage {
    print `perldoc $0`;
}
    


