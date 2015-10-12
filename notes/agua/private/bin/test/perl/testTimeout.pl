#!/usr/bin/perl -w
use strict;

my $DEBUG = 0;
$DEBUG = 1;

=head2

APPLICATION     testTimeout

PURPOSE

	TEST timeoutCommand METHOD IN Agua::Ops
	
USAGE

./testTimeout.pl [--help]

--help      :   Print help info

EXAMPLES

testTimeout.pl

=cut

#### FLUSH BUFFER
$| = 1;

#### USE LIB
use FindBin qw($Bin);
use lib "/agua/lib";

#### EXTERNAL MODULES
use Getopt::Long;
use Data::Dumper;

#### INTERNAL MODULES
use Conf::Agua;
use Agua::DBaseFactory;
use Agua::Ops;

#### SET CONF OBJECT
my $conf = Conf::Agua->new(
	inputfile	=>	"/agua/conf/default.conf",
	backup		=>	1,
	separator	=>	"\t",
	spacer		=>	"\\s\+"
);

#### GET OPTIONS
my $command;
my $timeout;
my $help;
GetOptions (
    'command=s'		=> \$command,
    'timeout=i' 	=> \$timeout,
    'help'          => \$help
) or die "No options specified. Try '--help'\n";

print "command not specified\n" and exit if not defined $command;
print "timeout not specified\n" and exit if not defined $timeout;

package Timeout;
use Moose;
use Data::Dumper;
has 'conf' 	=> (
	is =>	'rw',
	'isa' => 'Conf::Agua',
	default	=>	sub { Conf::Agua->new(	backup	=>	1, separator => "\t"	);	}
);
has 'ops' 	=> (
	is =>	'rw',
	'isa' => 'Agua::Ops',
	default	=>	sub { Agua::Ops->new();	}
);

use Moose::Util qw( apply_all_roles );

my $object = Timeout->new({conf	 =>  $conf});
#apply_all_roles( $object, 'Agua::Common::Util' );
#apply_all_roles( $object, 'Agua::Common::SGE' );
#apply_all_roles( $object, 'Agua::Common::Cluster' );
#apply_all_roles( $object, 'Agua::Common::Aws' );
#apply_all_roles( $object, 'Agua::Common::Ssh' );

print "\ntestTimeout.pl    Started: ";
print `date`;

$object->ops()->SHOWLOG(4);
$object->ops()->PRINTLOG(5);

my $result = $object->ops()->timeoutCommand($command, $timeout);
print "testTimeout.pl    result: $result\n";
print "\ntestTimeout.pl    Completed: ";
print `date`;

sub usage {
    print `perldoc $0`;
}