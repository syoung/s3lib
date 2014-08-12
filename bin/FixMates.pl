#!/usr/bin/perl -w

=doc

=head2	aspera

PURPOSE

    Download a file from a GNOS repository using Aspera

USAGE

./aspera.pl <--uuid String> \
	<--uuid String> \
	<--outputdir String> \
	[--filesize String] \
	[--filename String] \
	[--url String] \
	[--version String] \
	[--keyfile String ]

uuid   		:   UUID of the sample
outputdir	:	Directory for asperaed BAM files
filesize  	:	File size in bytes
filename  	:	Name of file (not file location)
url  	:	URL of the source GNOS repository
version  		:	Number of CPUs to be used for aspera
keyfile  	:	Location of private key for access to the GNOS repository

EXAMPLE

Download a BAM file from CGHub using a custom keyfile

./aspera.pl \
--uuid eaa56631-c802-47ff-8118-3ed40d10302b \
--outputdir /data/aspera \
--keyfile /root/cghub.key

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
use CU::App::Aspera;
use Conf::Yaml;

my $log			=	4;
my $printlog	=	4;

my $outputdir	=	undef;
my $outputfile	=	undef;
my $filesize	=	undef;
my $filename	=	undef;
my $url			=	undef;
my $version		=	undef;
my $options		=	undef;
my $keyfile		=	undef;

GetOptions (
    'outputdir=s'   => \$outputdir,
    'outputfile=s'  => \$outputfile,
    'url=s'   		=> \$url,
    'version=s'   	=> \$version,
    'options=s'   	=> \$options,
    'keyfile=s'   	=> \$keyfile,

    'log=i'     	=> \$log,
    'printlog=i'    => \$printlog,
    'help'          => \$help
) or die "No options specified. Try '--help'\n";
usage() if defined $help;

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

my $object = CU::App::Aspera->new({
    keyfile    	=>  $keyfile,
	conf		=>	$conf,
    log     	=>  $log,
    printlog    =>  $printlog,
    logfile     =>  $logfile
});


$object->download($url, $outputdir, $outputfile, $version, $options);

