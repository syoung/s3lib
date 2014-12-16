use MooseX::Declare;

use strict;
use warnings;

class UnifiedGenotyper extends Common {

#####////}}}}}

=doc

=head2	PURPOSE

	Use GATK to call variants in one or more BAM files

=cut

use FindBin qw($Bin);

use Conf::Yaml;

# Integers
has 'sleep'			=> 	( isa => 'Int', is => 'rw', default	=>	10 );

# Strings
has 'uuid'			=> 	( isa => 'Str|Undef', is => 'rw', required 	=> 0 );
has 'version'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"3.2" );

# Objects
has 'conf'			=> ( isa => 'Conf::Yaml', is => 'rw', lazy => 1, builder => "setConf" );
has 'db'			=> ( isa => 'Agua::DBase::MySQL', is => 'rw', required => 0 );

method unifiedGenotyper ($analysistype, $reference, $uuid, $inputdir, $suffix, $dbsnp, $outputdir, $target, $version) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("outputdir", $outputdir);
	$self->logDebug("reference", $reference);
	$self->logDebug("suffix", $suffix);
	$self->logDebug("dbsnp", $dbsnp);
	$self->logDebug("outputdir", $outputdir);
	$self->logDebug("target", $target);

	$version	=	$self->version() if not defined $version;
	$self->logDebug("version", $version);
	
	my $package = $self->conf()->getKey("packages:broadbp", undef);
	$self->logDebug("package", $package);
	
	#### EXECUTABLES
	my $installdir	=	$self->getInstallDir("gatk");
	my $executable	=	"$installdir/GenomeAnalysisTK.jar";
	my $java		=	"java -jar";

	#### GET FIRST SAMPLE IF MULTIPLE SAMPLES
	my $inputfiles	=	$self->getSampleFiles($uuid, $inputdir, $suffix ) ;
	$self->logDebug("inputfiles", $inputfiles);
	print "inputfiles not defined\n" and exit if not defined $inputfiles;
	
	#### CREATE OUTPUT DIR
	`mkdir -p $outputdir` if not -d $outputdir;
	
	#### RUN
	my $command		= qq{$java $executable -T $analysistype -R $reference \\\n};
	foreach my $inputfile ( @$inputfiles ) {
		$command 	.=	qq{-I $inputfile \\};
	}
	$command		.=	qq{
--fix_misencoded_quality_scores \\
--dbsnp $dbsnp \\
-o $outputdir/$uuid.UG.vcf \\
-stand_call_conf 50.0 \\
-stand_emit_conf 10.0 \\
-L $target \\
};


	$self->logDebug("command", $command);

	print "NRC::App::UnifiedGenotyper    command: $command\n";
	`$command`;
}


method getSampleFiles ($uuid, $inputdir, $suffix ) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("inputdir",$inputdir);
	$self->logDebug("suffix", $suffix);

	my $table	=	"srasample";
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
	$self->logDebug("samples:");
	foreach my $sample ( @$samples ) {
		print "$sample->{sample}\n";
	}
	
	my $firstuuid	=	$$samples[0]->{sample};
	$self->logDebug("firstuuid", $firstuuid);
	
	return if $uuid ne $firstuuid;
	
	my $samplefiles	=	[];
	my ($basedir)	=	$inputdir	=~ /^(.+)\/[^\/]+$/;
	foreach my $sample ( @$samples ) {
		$self->logDebug("sample", $sample);
		my $id	=	$sample->{sample};
		push @$samplefiles, "$inputdir/$id/$id.$suffix";
	}

	return $samplefiles;
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

