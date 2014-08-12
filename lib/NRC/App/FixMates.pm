use MooseX::Declare;

use strict;
use warnings;

class NRC::App::FixMates extends CU::Main {

#####////}}}}}

use FindBin qw($Bin);

use Agua::CLI::App;
use Conf::Yaml;

# Integers
has 'sleep'			=> 	( isa => 'Str|Undef', is => 'rw', default	=>	10 );

# Strings
has 'keyfile'		=> 	( isa => 'Str|Undef', is => 'rw', required	=>	1 );
has 'uuid'			=> 	( isa => 'Str|Undef', is => 'rw', required 	=> 	0 );
has 'version'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"3.3.3.81344" );
has 'options'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"-l200m" );

# Objects
has 'conf'			=> ( isa => 'Conf::Yaml', is => 'rw', lazy => 1, builder => "setConf" );

method align ($uuid, $inputdir, $inputfile, $reference, $outputfile) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("inputdir", $inputdir);
	$self->logDebug("inputfile", $inputfile);
	$self->logDebug("reference", $reference);
	$self->logDebug("outputfile", $outputfile);
	

}
#
#	$self->logDebug("command", $command);
#	
#	print "CU::App::FixMates    command: $command\n";
#	`$command`;


method fileValidated ($bamfile) {


	my $installdir	=	$self->getInstallDir("agua"); #???
	
	my $executable	=	"$installdir/bin/bwa.pl";
	my $inputfile	=	"$bamfile.validate";
	my $command		=	"$executable $bamfile 2> $inputfile";
	$self->logDebug("command", $command);
	`$command`;
	
	my $contents	=	$self->fileContents($inputfile);
	$self->logDebug("contents", $contents);
	
	return 0 if not defined $contents or $contents =~ /^\S*$/;

	my $lines;
	@$lines		=	split "\n", $contents;
	my $tabs;
	@$tabs		=	split "\t", $lines; 

	foreach my $line ( @$lines ) {
		if ( $$tabs[2] == '*' ) {

			my $basedir	=	$self->conf()->getKey("agua:INSTALLDIR", undef);
			$self->logDebug("basedir", $basedir);
			my $flow	=	"$basedir/bin/cli/flow.pl";
			
			my $projects	=	[ "cu", "broadbp" ];
			foreach my $project ( @$projects ) {
				my $installdir	=	$self->getInstallDir($project);
				$self->logDebug("installdir", $installdir);
				my $packagename	=	uc($project);
				my $command	=	qq{cd $installdir/conf && $flow $packagename.proj runProject --samplestring "sample:$uuid" --log 4};
				$self->logDebug("command", $command);
				
			}
		
			
		$self->logDebug("DEBUG EXIT") and exit;
		
		
			##/agua/bin/cli/flow.pl RunSRA.proj runWorkflow --workflow Bwa --samplestring "sample:SRR645668" --log 4
			my $installdir	=	$self->getInstallDir("pcap"); 
			`mkdir -p $outputdir` if not -d $outputdir;
			my $executable	=	"$installdir/bin/bwa_men.pl";
			my $inputfile	=	"$bamfile.validate";
			my $command = "$executable runWorkflow --workflow Bwa --samplestring 'sample:<SAMPLE>' --log 4";
			
			$self->logDebug("command", $command);
			return 0;
		}
		else
		{

			my $projects	=	[ "broadbp" ];
			foreach my $project ( @$projects ) {
				my $installdir	=	$self->getInstallDir($project);
				$self->logDebug("installdir", $installdir);
				my $packagename	=	uc($project);
				my $command	=	qq{cd $installdir/conf && $flow $packagename.proj runProject --samplestring "sample:$uuid" --log 4};
				$self->logDebug("command", $command);
				
			}

			# /agua/apps/samtools/0.1.19/samtools  sort  /data/nrc/SRR645668/SRR645668.bam  /data/nrc/SRR645668/SRR645668.sorted
			#/agua/apps/picard/1.103/FixMateInformation.jar I=/data/nrc/SRR645668/SRR645668.sorted.bam O=/data/nrc/SRR645668/SRR645668.fxmt.bam SO=coordinate CREATE_INDEX=true VALIDATION_STRINGENCY=SILENT

			#### CREATE OUTPUT DIR
			`mkdir -p $outputdir` if not -d $outputdir;

			#### SET INPUTFILE
			my $inputfile	=	"$bamfile.validate";

			#### GET EXECUTABLES
			my $installdir	=	$self->getInstallDir("samtools");
			my $samtools	=	"$installdir/samtools";
			$installdir	=	$self->getInstallDir("samtools");
			my $picard	=	"$installdir/picard";			
			my $command = "$executable sort $inputfile $outputfile"
			
			my $command	= "
			$executable I= $inputfile O= $outputfile SO=coordinate CREATE_INDEX=true VALIDATION_";
			$self->logDebug("command", $command);
			return 1;
		}
	}
	
	
}

	
}


