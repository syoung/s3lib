#!/usr/bin/perl -w

=doc

=head2	UnifiedGenotyper

PURPOSE

    UnifiedGenotyper calls variant from one or multiple bam files

USAGE

./UnifiedGenotyper.pl <--uuid String> \
	<--inputdir String> \
	<--outputdir String> \
	<--filename String>

inputdir	: 	Directory containing input BAM files
outputdir	:	Directory for output BAM file
outputdir	:	Directory for intermediate files
filename  	:	Name of output file
version		:	Version of PCAP-core containing biobambam's bamUnifiedGenotyper

EXAMPLE

java -jar /agua/apps/gatk/3.2/GenomeAnalysisTK.jar -R /data/reference/genome.fa -T UnifiedGenotyper -I /data/nrc/SRR645668/SRR645668.rmdup_grp.bam -I /data/nrc/SRR645386/SRR645386.rmdup_grp.bam  --fix_misencoded_quality_scores --dbsnp  /agua/apps/gatk/3.2/ftp.broadinstitute.org/bundle/2.5/b37/dbsnp_137.b37.vcf -o snps.raw.vcf -stand_call_conf 50.0 -stand_emit_conf 10.0  -L /data/reference/target/SeqCap_EZ_Exome_v2-tiled.bed


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
use NRC::App::UnifiedGenotyper;
use Conf::Yaml;


#### GET OPTIONS
my $uuid		=	undef;
my $analysis_type	=	analysis_type;
my $reference_genome	=	reference_genome;
my $filename	=	undef;
my $workdir		=	"/mnt";
my $version		=	undef;
my $log			=	2;
my $printlog	=	4;

GetOptions (
    'uuid=s'     	=> \$uuid,
    'inputdir=s'   	=> \$inputdir,
	'suffix=s'   	=> \$suffix,
    'outputdir=s'	=> \$outputdir,
    'dbsnp=s'	=> \$dbsnp,
    'target=s'   	=> \$target,
	'reference_genome=s'   	=> \$reference_genome,
	'analysis_type=s'   	=> \$analysis_type,
    'version=s'   	=> \$version,

    'log=i'     	=> \$log,
    'printlog=i'    => \$printlog,
    'help'          => \$help
) or die "No options specified. Try '--help'\n";
usage() if defined $help;

#### SET CONF
my $configfile	=	"$installdir/conf/config.yaml";
my $logfile		=	"/tmp/UnifiedGenotyper.$$.log";
my $conf = Conf::Yaml->new(
    memory      =>  0,
    inputfile   =>  $configfile,
    backup      =>  1,
    log     	=>  $log,
    printlog    =>  $printlog,
    logfile     =>  $logfile
);

my $object	=	NRC::App::UnifiedGenotyper->new({
	conf		=>	$conf,
    log     	=>  $log,
    printlog    =>  $printlog,
    logfile     =>  $logfile	
});

$object->unifiedGenotyper($analysis_type, $reference_genome, $uuid, $inputdir, $suffix ,$dbsnp, $outputdir, $target, $version);

