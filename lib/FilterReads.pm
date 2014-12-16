use MooseX::Declare;

use strict;
use warnings;

class FilterReads extends Common {

#####////}}}}}

use FindBin qw($Bin);

use Agua::CLI::App;
use Conf::Yaml;

# Integers
has 'sleep'			=> 	( isa => 'Str|Undef', is => 'rw', default	=>	10 );

# Strings
has 'keyfile'		=> 	( isa => 'Str|Undef', is => 'rw', required	=>	1 );
has 'uuid'			=> 	( isa => 'Str|Undef', is => 'rw', required 	=> 	0 );
has 'version'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"" );
has 'options'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"-l200m" );

# Objects
has 'conf'			=> ( isa => 'Conf::Yaml', is => 'rw', lazy => 1, builder => "setConf" );

method filterReads ($uuid, $inputfile, $outputfile) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("inputfile", $inputfile);
	$self->logDebug("outputfile", $outputfile);
	
	#my $projects	=	[ "broadbp" ];
	#my $installdir	=	$self->getInstallDir($project);
	#$self->logDebug("installdir", $installdir);
	#my $packagename	=	uc($project);
	
	my $validated	=	$self->bamIsAPair($inputfile);
	$self->logDebug("validated",$validated);
	if ( $validated ) {
			
			my $bam_installdir	=	$self->getInstallDir("bamtools");
	        my $bamtools	=	"$bam_installdir/bamtools";
			
			my $sam_installdir	=	$self->getInstallDir("samtools");
	        my $samtools	=	"$sam_installdir/samtools";
				
			#/agua/apps/bamtools/v2.3.0/bin/bamtools  filter -isMapped false -isPaired false -isProperPair false -in /data/nrc/SRR645386/SRR645386.fxmt.bam -out /data/nrc/SRR645386/SRR645386.fxmt_flt.bam
			my $command	=	qq{bamtools filter -isMapped true -isPaired true -isProperPair true -in $inputfile -out $outputfile /
			samtools index $outputfile};
			
			$self->logDebug("command", $command);
	
	}
	else {
			my $bam_installdir	=	$self->getInstallDir("bamtools");
	        my $bamtools	=	"$bam_installdir/bamtools";
			
			my $sam_installdir	=	$self->getInstallDir("samtools");
	        my $samtools	=	"$sam_installdir/samtools";

			my $command	=	qq{bamtools filter -isMapped true -in $inputfile -out $outputfile /
			samtools index $outputfile};
			$self->logDebug("command", $command);
			
		
	}

	$self->logDebug("COMPLETED");	
}


method bamIsAPair ($inputfile) {
	$self->logDebug("inputfile", $inputfile);
	
	my $output	=	$self->getBamLines($inputfile);
	#$self->logDebug("output", $output);			

	my $lines;
	my $count = 0;
	@$lines		=	split "\n", $output;
	for (my $i=0 ; $i<@$lines ; $i++ ) {
		my $line = $$lines[$i];
		my ($header) = $line =~ /^(\S+)/;
		$self->logDebug("header",$header);
		
		if ($i > 0) {
			my ($previous) = $$lines[$i-1] =~ /^(\S+)/;
		    $self->logDebug("previous",$previous);
			
			if ($previous eq $header) {
			
				my ($previous_flag) = $$lines[$i-1] =~ /^\S+\s+(\d+)/;
				my ($flag) = $line =~ /^\S+\s+(\d+)/;
				
				if ($flag % 2 == 1 and $previous_flag % 2 == 1) {
					return 1;
				}
				
			}
			
		}
		
		my $tabs;
		@$tabs		=	split " ", $line;
		my $entry   =   $$tabs[0];
		my $pair    =   substr($entry,-2,2);
		
		if ( $pair =~ '\D(1|2)'  ) {
				return 1;
			
		}
	}
	
	return 0;	
}

method getBamLines ($inputfile) {
	$self->logDebug("inputfile", $inputfile);

	#### GET EXECUTABLES
	my $installdir	=	$self->getInstallDir("samtools");
	my $samtools	=	"$installdir/samtools";
	# E.G.: /agua/apps/samtools/0.1.19/samtools

	my $command = "$samtools view $inputfile | head -n 30";
	$self->logDebug("command", $command);
    my $output =  `$command`;
	$self->logDebug("output", $output);
	
    return $output;	
}

	
}


