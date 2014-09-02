use MooseX::Declare;

use strict;
use warnings;

class NRC::App::UnifiedGenotyper extends NRC::Main with Agua::Common::Database {

#####////}}}}}

=doc

=head2	PURPOSE

	1. UnifiedGenotyper calls variant on one or multiple bam files

	
=head2 	NOTES


=cut

use FindBin qw($Bin);

use Agua::CLI::App;

use Conf::Yaml;

# Strings
has 'uuid'			=> 	( isa => 'Str|Undef', is => 'rw', required 	=> 0 );
has 'sleep'			=> 	( isa => 'Str|Undef', is => 'rw', default	=>	10 );

# Objects
has 'conf'			=> ( isa => 'Conf::Yaml', is => 'rw', lazy => 1, builder => "setConf" );
has 'db'			=> ( isa => 'Agua::DBase::MySQL', is => 'rw', required => 0 );

has 'version'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"3.2" );
method unifiedGenotyper ($analysis_type, $reference_genome, $uuid, $inputdir, $suffix,$dbsnp, $outputdir, $target, $version) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("outputdir", $outputdir);
	$self->logDebug("reference_genome", $reference_genome);
	$self->logDebug("suffix", $suffix);
	$self->logDebug("dbsnp", $dbsnp);
	$self->logDebug("outputdir", $outputdir);
	$self->logDebug("target", $target);

	$self->logDebug("version",$version);
	
	$version	=	$self->version() if not defined $version;
	$self->logDebug("FINAL version", $version);
	
	my $package = $self->conf()->getKey("packages:broadbp", undef);
	
	my $installdir	=	$self->getInstallDir("gatk");
	my $executable	=	"$installdir/GenomeAnalysisTK.jar";
	
	my $java_installdir	=	$self->getInstallDir("java");
	my $java_executor	=	"java -jar";
			
	$self->logDebug("package", $package);
	#my $installdir	=	$package->{$version}->{INSTALLDIR};
	$self->logDebug("installdir"/java, $installdir);
	#$installdir		=~	s/\/[^\/]+$//;
	#my $executable	=	"$installdir/GenomeAnalaysisTK.jar";

	#### GET FIRST SAMPLE IF MULTIPLE SAMPLES
	my $inputfiles	=	$self->getSampleFiles($uuid, $inputdir, $suffix ) ;
	$self->logDebug("inputfiles", $inputfiles);
	#print "inputfiles not defined\n" and exit if not defined $inputfiles;
	
	#### CREATE OUTPUT DIR
	`mkdir -p $outputdir` if not -d $outputdir;
	
	#### RUN
	my $command		= qq{$java_executor $executable -T $analysis_type -R $reference_genome \\\n};
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

