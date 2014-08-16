use MooseX::Declare;

use strict;
use warnings;

class NRC::App::FilterReads extends NRC::Main {

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
	
	my $validated	=	$self->bamIsAPair($inputfile);
	$self->logDebug("validated",$validated);
	if ( $validated ) {
			
			my $bam_installdir	=	$self->getInstallDir("bamtools");
	        my $bamtools	=	"$bam_installdir/bamtools";
			
			my $sam_installdir	=	$self->getInstallDir("samtools");
	        my $samtools	=	"$sam_installdir/samtools";
				
			#/agua/apps/bamtools/v2.3.0/bin/bamtools  filter -isMapped false -isPaired false -isProperPair false -in /data/nrc/SRR645386/SRR645386.fxmt.bam -out /data/nrc/SRR645386/SRR645386.fxmt_flt.bam
			my $command	=	qq{$bamtools filter -isMapped true -isPaired true -isProperPair true -in $uuid" -out $outputfie//
			$samtools index $outputfile};
			
			$self->logDebug("command", $command);
	
	}
	else {
			my $bam_installdir	=	$self->getInstallDir("bamtools");
	        my $bamtools	=	"$bam_installdir/bamtools";
			
			my $sam_installdir	=	$self->getInstallDir("samtools");
	        my $samtools	=	"$sam_installdir/samtools";

			my $command	=	qq{$bamtools filter -isMapped true -in $uuid" -out $outputfie//
			$samtools index $outputfile};
			$self->logDebug("command", $command);
			
		}
	}

	$self->logDebug("COMPLETED");	
}


method bamIsAPair ($inputfile) {
	$self->logDebug("inputfile", $inputfile);

	#### GET EXECUTABLES
	my $installdir	=	$self->getInstallDir("samtools");
	my $samtools	=	"$installdir/samtools";
	# E.G.: /agua/apps/samtools/0.1.19/samtools

	my $command = "$samtools view $inputfile | head -n 30";
	$self->logDebug("command", $command);
	my $output	=	`$command`;
	#$self->logDebug("output", $output);			

	my $lines;
	my $count = 0
	@$lines		=	split "\n", $output;
	foreach my $line ( @$lines ) {
		my $tabs;
		@$tabs		=	split " ", $line;
		
		if ( $$tabs[0][length($$tabs[0])-2] ne \D ) {
			$count++;
			if ($count > 20) {
				return 1;
			}
		}
	}
	
	return 0;	
}


	
}


