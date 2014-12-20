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

my $logfile		=	"/tmp/usage.$$.log";
my $log			=	2;
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
   log     		=>  $log,
   printlog    	=>  $printlog,
   logfile     	=>  $logfile
});


$object->report($directory, $outputfile);

print "Printed outputfile:\n\n$outputfile\n\n";

