use MooseX::Declare;

use strict;
use warnings;

class NRC::App::Varscan extends NRC::Main with Agua::Common::Database {

#####////}}}}}

use FindBin qw($Bin);

use Agua::CLI::App;

use Conf::Yaml;

# Strings
has 'batchsize'		=> 	( isa => 'Int|Undef', is => 'rw', default	=>	5 );

# Strings
has 'uuid'			=> 	( isa => 'Str|Undef', is => 'rw', required 	=> 	0 );
has 'sleep'			=> 	( isa => 'Str|Undef', is => 'rw', default	=>	10 );
has 'version'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"v1.0.4" );

# Objects
has 'conf'			=> ( isa => 'Conf::Yaml', is => 'rw', lazy => 1, builder => "setConf" );


method align ($uuid, $inputdir, $outputdir, $reference, $options) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("inputdir", $inputdir);
	$self->logDebug("outputdir", $outputdir);
	$self->logDebug("reference", $reference);
	
	#### GET VARSCAN
	my $installdir	=	$self->getInstallDir("varscan");
	$self->logDebug("installdir", $installdir);
	my $varscan	=	 "$installdir/varscan.jar";

	#### GET SAMTOOLS
	$installdir	=	$self->getInstallDir("samtools");
	$self->logDebug("installdir", $installdir);
	my $samtools	=	 "$installdir/bin/samtools";
	
	#### GET JAVA
	$installdir	=	$self->getInstallDir("java");
	$self->logDebug("installdir", $installdir);
	my $java	=	 "$installdir/bin/java";
	
	#### QUIT IF NORMAL
	return if $self->isNormal($uuid);
	
	#### SET TUMOUR FILE
	my $tumourfile	=	"$inputdir/$uuid/$uuid.bam";
	print "Tumour file not found\n" and exit(1) if not -f $tumourfile;
	
	#### GET NORMAL MATE
	my $normalfile		=	undef;
	if ( not defined $normalfile ) {
		my $mate		=	$self->getMate($uuid);
		$self->logDebug("mate", $mate);
		my $mateuuid	=	$mate->{sample};
		$self->logDebug("mateuuid", $mateuuid);

		$normalfile	=	"$inputdir/$mateuuid/$mateuuid.bam";
	}
	$self->logDebug("normalfile", $normalfile);
	print "Normal file not defined\n" and exit(1) if not defined $normalfile;
	print "Normal file not found\n" and exit(1) if not -f $normalfile;
	
	#### CREATE OUTPUTDIR
	`mkdir -p $outputdir` if not -d $outputdir;
	
#Run samtools/varscan
#samtools mpileup -f $ref $cur_dir/$normal $cur_dir/$tumor | java -jar /work/knode05/milanesej/varscan/VarScan.v2.3.5.jar somatic --output-snp $cur_dir/${sample} --output-indel $cur_dir/${sample}_indel --mpileup 1 --min-coverage 30 --min-var-freq 0.08 --strand-filter 1 --output-vcf 1

#/agua/apps/java/1.7.0_51/bin/java -jar /agua/apps/varscan/2.3.5/varscan.jar  somatic --output-snp /data/nrc/SRR645388/SRR645388.snp.vcf --output-indel /data/nrc/SRR645388/SRR645388.indel.vcf --mpileup 1 --output-vcf 1 --min-var-freq 0.08 --strand-filter 1

	#### SET OUTPUT FILES
	my $outputsnp	=	"$outputdir/$uuid.snp.vcf";
	my $outputindel	=	"$outputdir/$uuid.indel.vcf";	

	my $command	=	qq{$samtools mpileup \\
-f $reference \\
$tumourfile \\
$normalfile \\
| \\
$java -jar \\
$varscan somatic \\
--output-snp $outputsnp \\
--output-indel $outputindel \\
$options
};
	$self->logDebug("command", $command);

$self->logDebug("DEBUG EXIT") and exit;
	
	`$command`;
}

method getMate ($uuid) {
	$self->logDebug("uuid", $uuid);
	
	#### TABLE	
	my $table	=	"tcgasample";
	$table		=	"srasample" if $uuid	=~	/^SRR/;
	$self->logDebug("table", $table);

	#### SET DATABASE HANDLE
	$self->setDbh();
	
	#### GET SAMPLE HASH
	my $samplehash	=	$self->getSampleHash($table, $uuid);
	$self->logDebug("samplehash", $samplehash);

	my $samplename	=	$samplehash->{samplename};
	$self->logDebug("samplename", $samplename);
	my $samples		=	undef;
	if ( defined $samplename ) {
		$samples		=	$self->getSamplesBySampleName($table, $samplename)
	}
	print "No samples for uuid: $uuid\n" and exit if not defined $samples;

	$self->logDebug("samples:");
	foreach my $sample ( @$samples ) {
		print "$sample->{sample}\n";
	}
	my $firstuuid	=	$$samples[0]->{sample};
	$self->logDebug("firstuuid", $firstuuid);

	
$self->logDebug("DEBUG EXIT") and exit;

	
}

method isNormal ($uuid) {
	$self->logDebug("uuid", $uuid);

	#### TABLE	
	my $table	=	"tcgasample";
	$table		=	"srasample" if $uuid	=~	/^SRR/;
	$self->logDebug("table", $table);

	#### SET DATABASE HANDLE
	$self->setDbh();
	
	#### GET SAMPLE HASH
	my $samplehash	=	$self->getSampleHash($table, $uuid);
	$self->logDebug("samplehash", $samplehash);
	
	return 0;
	return 1;
}


method getSampleHash ($table, $sample) {
	my $query		=	qq{SELECT * FROM $table
WHERE sample='$sample'};
	my $samplehash	=	$self->db()->queryhash($query);
	$self->logDebug("samplehash", $samplehash);
	
	return $samplehash;
}

method getSamplesBySampleName ($table, $samplename) {
	$self->logDebug("samplename", $samplename);
	my $query		=	qq{SELECT * FROM $table
WHERE samplename='$samplename'
ORDER BY sample};

	my $samplehash	=	$self->db()->queryhasharray($query);
	$self->logDebug("samplehash", $samplehash);
	
	return $samplehash;
}


	
}

