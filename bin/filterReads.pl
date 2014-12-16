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
use FilterReads;
use Conf::Yaml;

my $log			=	2;
my $printlog	=	4;

my $uuid 	= 	undef;
my $inputfile	=	undef;
my $outputfile  =       undef;
my $help;


GetOptions (
		
    'uuid=s'  => \$uuid,
    'inputfile=s'  => \$inputfile,
    'outputfile=s'  => \$outputfile,


    'log=i'     	=> \$log,
    'printlog=i'    => \$printlog,
    'help'          => \$help
);

#### SET CONF
my $logfile			=	"$installdir/log/$$.log";
my $configfile		=	"$installdir/conf/config.yaml";
my $conf = Conf::Yaml->new(
    memory      =>  0,
    inputfile   =>  $configfile,
    backup      =>  1,
    log     	=>  $log,
    printlog    =>  $printlog,
    logfile     =>  $logfile
);

my $object = FilterReads->new({
   conf		=>	$conf,
   log     	=>  $log,
   printlog    =>  $printlog,
   logfile     =>  $logfile
});


$object->filterReads($uuid, $inputfile,$outputfile);

