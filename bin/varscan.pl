#!/usr/bin/perl -w

=doc

=head2	bwa

PURPOSE

    Align a BAM file against a reference genome using bwa_mem.pl
	with default PanCancer project alignment workflow parameters

USAGE

./bwa.pl <--uuid String> \
	<--inputdir String> \
	<--outputdir String> \
	<--filename String> \
	<--reference String> \
	[--batchsize Integer] \
	[--workdir String] \
	[--version String ] \

uuid   		:   UUID of the sample
inputdir	: 	Directory containing input lane BAM files
outputdir	:	Print aligned BAM file to this directory
filename	:	Name of the input BAM file (NB: name only, not full path to file)
reference	:	Stub location of BWA-format reference indexes (e.g., /data/genome.fa.gz)
batchsize	:	Max number of input files to align at once
workdir  	:	Directory for temporary files
version     :   Version of PCAP-Core package containing bwa_mem.pl

EXAMPLE

Align the BAM file for a particular UUID with bwa_mem using the default PanCancer alignment parameters 

./bwa.pl \
--uuid eaa56631-c802-47ff-8118-3ed40d10302b \
--inputdir /data/download \
--outputdir /data/split \
--workdir /mnt

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
use Conf::Yaml;
use CU::App::Bwa;

#### GET OPTIONS
my $uuid		=	undef;
my $inputdir	=	undef;
my $outputdir	=	undef;
my $filename	=	undef;
my $reference	=	undef;

my $batchsize	=	undef;
my $workdir 	= 	"/mnt";
my $version		=	undef;

my $log			=	2;
my $printlog	=	4;

GetOptions (
    'uuid=s'     	=> \$uuid,
    'inputdir=s'    => \$inputdir,
    'outputdir=s'   => \$outputdir,
    'filename=s'    => \$filename,
    'reference=s'   => \$reference,

    'batchsize=s'   => \$batchsize,
    'workdir=s'   	=> \$workdir,
    'version=s'   	=> \$version,

    'log=i'     	=> \$log,
    'printlog=i'    => \$printlog,
    'help'          => \$help
) or die "No options specified. Try '--help'\n";
usage() if defined $help;

#### SET CONF
my $configfile	=	"$installdir/conf/config.yaml";
my $logfile		=	"/tmp/bwa.$$.log";
my $conf = Conf::Yaml->new(
    memory      =>  0,
    inputfile   =>  $configfile,
    backup      =>  1,
    log     	=>  $log,
    printlog    =>  $printlog,
    logfile     =>  $logfile
);

my $object	=	CU::App::Bwa->new({
	conf		=>	$conf,
    log     	=>  $log,
    printlog    =>  $printlog,
    logfile     =>  $logfile	
});

$object->align($uuid, $inputdir, $filename, $outputdir, $reference, $workdir, $version, $batchsize);


