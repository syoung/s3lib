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
	$installdir	=	$ENV{'installdir'} || "/agua";
    unshift(@INC, "$installdir/lib");
}
use FindBin qw($Bin);
use lib "$Bin/../lib";

#### INTERNAL PACKAGES
use NRC::App::FilterReads;
use Conf::Yaml;

my $log			=	4;
my $printlog	=	4;

my $uuid 	= 	undef;
my $inputfile	=	undef;
my $outputfile  =       undef;




GetOptions (
		
    'uuid=s'  => \$uuid,
    'inputfile=s'  => \$inputfile,
    'outputfile=s'  => \$outputfile,


    'log=i'     	=> \$log,
    'printlog=i'    => \$printlog,
    'help'          => \$help
);

#### SET CONF
my $configfile		=	"$installdir/conf/config.yaml";
my $conf = Conf::Yaml->new(
    memory      =>  0,
    inputfile   =>  $configfile,
    backup      =>  1,
    log     	=>  $log,
    printlog    =>  $printlog,
    logfile     =>  $logfile
);

my $object = NRC::App::FilterReads->new({
   keyfile    	=>  $keyfile,
   conf		=>	$conf,
   log     	=>  $log,
   printlog    =>  $printlog,
   logfile     =>  $logfile
});


$object->filterReads($uuid, $inputfile,$outputfile);

