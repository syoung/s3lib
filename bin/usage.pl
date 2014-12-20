#!/usr/bin/perl -w

#!/usr/bin/perl -w

=doc

=head2	filterReads

PURPOSE

     Find if the input bam file is aligned or not. If not aligned - run BWA to align it.

=cut

#### EXTERNAL PACKAGES
use Data::Dumper;
use Getopt::Long;

#### INTERNAL PACKAGES
my $installdir;
BEGIN {
	$installdir	=	$ENV{'installdir'} || "/a";
    unshift(@INC, "$installdir/lib");
}
use FindBin qw($Bin);
use lib "$Bin/../lib";

#### INTERNAL PACKAGES
use Usage;
use Conf::Yaml;

my $log			=	4;
my $printlog	=	4;
my $directory	=	undef;
my $outputfile  =	undef;
my $help;

GetOptions (
    'directory=s'  	=> \$directory,
    'outputfile=s'  => \$outputfile,
    'log=i'     	=> \$log,
    'printlog=i'    => \$printlog,
    'help'          => \$help
);

my $object = Usage->new({
   conf		=>	$conf,
   log     	=>  $log,
   printlog    =>  $printlog,
   logfile     =>  $logfile
});


$object->filterReads($uuid, $directory, $outputfile, $paired);

print "Printed outputfile:\n\n$outputfile\n\n";

