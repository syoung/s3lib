use MooseX::Declare;

use strict;
use warnings;

class Varscan extends NRC::Main with Agua::Common::Database {

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


method align ($uuid, $inputdir, $suffix, $outputdir, $reference, $options, $samtools) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("inputdir", $inputdir);
	$self->logDebug("suffix", $suffix);
	$self->logDebug("outputdir", $outputdir);
	$self->logDebug("reference", $reference);
	
	#### GET VARSCAN
	my $installdir	=	$self->getInstallDir("varscan");
	$self->logDebug("installdir", $installdir);
	my $varscan	=	 "$installdir/varscan.jar";

	#### GET SAMTOOLS
	$installdir	=	$self->getInstallDir("samtools");
	$self->logDebug("installdir", $installdir);
	$samtools	=	 "$installdir/samtools" if not defined $samtools;
	
	#### GET JAVA
	$installdir	=	$self->getInstallDir("java");
	$self->logDebug("installdir", $installdir);
	my $java	=	 "$installdir/bin/java";
	
	#### QUIT IF NORMAL
	return if $self->isNormal($uuid);

	#### QUIT IF NOT LAST UUID FOR THIS SAMPLE
	return if not $self->isLastUuid($uuid);

	#### SET TUMOUR FILE
	my $tumourfile	=	"$inputdir/$uuid/$uuid.$suffix.bam";
	$self->logDebug("tumourfile", $tumourfile);
	
	#### SANITY CHECK
	print "Tumour file not found\n" and exit(1) if not -f $tumourfile;
	
	#### GET NORMAL UUID
	my $normaluuid		=	$self->getNormalUuid($uuid);
	print "Normal UUID not defined\n" and exit(1) if not defined $normaluuid;

	#### QUIT IF NORMAL FILE NOT FOUND
	my $normalfile	=	"$inputdir/$normaluuid/$normaluuid.$suffix.bam";
	$self->logDebug("normalfile", $normalfile);
	print "Normal file not found\n" and exit(1) if not -f $normalfile;
	
	#### CREATE OUTPUTDIR
	`mkdir -p $outputdir` if not -d $outputdir;

	#### SET OUTPUT FILES
	my $outputsnp	=	"$uuid.snp.varscan";
	my $outputindel	=	"$uuid.indel.varscan";
	#`mkdir -p $outputsnp` if not -d $outputsnp;
	#`mkdir -p $outputindel` if not -d $outputindel;

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
	
	`$command`;
}

method getNormalUuid ($uuid) {
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
	my $normalname	=	$samplename;
	$normalname		=~	s/Cancer/Normal/;
	$self->logDebug("normalname", $normalname);
	
	my $samples		=	$self->getSamplesBySampleName($table, $normalname);
	$self->logDebug("samples", $samples);
	print "No normal samples for uuid: $uuid\n" and exit if not defined $samples;

	$self->logDebug("samples:");
	foreach my $sample ( @$samples ) {
		print "$sample->{sample}\n";
	}
	my $lastuuid	=	$$samples[scalar(@$samples) - 1]->{sample};
	$self->logDebug("lastuuid", $lastuuid);

	return $lastuuid;
}

method isLastUuid ($uuid) {
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
	my $lastuuid	=	$$samples[scalar(@$samples) - 1]->{sample};
	$self->logDebug("lastuuid", $lastuuid);

	return 0 if $uuid ne $lastuuid;
	return 1;
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
	#return 1;
}


method getSampleHash ($table, $sample) {
	my $query		=	qq{SELECT * FROM $table
WHERE sample='$sample'};
	$self->logDebug("query", $query);
	my $samplehash	=	$self->db()->queryhash($query);
	$self->logDebug("samplehash", $samplehash);
	
	return $samplehash;
}

method getSamplesBySampleName ($table, $samplename) {
	$self->logDebug("samplename", $samplename);
	my $query		=	qq{SELECT * FROM $table
WHERE samplename='$samplename'
ORDER BY sample};
	$self->logDebug("query", $query);

	my $samplehash	=	$self->db()->queryhasharray($query);
	$self->logDebug("samplehash", $samplehash);
	
	return $samplehash;
}


	
}

