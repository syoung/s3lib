use MooseX::Declare;
use Method::Signatures::Simple;


use strict;
use warnings;

class FilterReads extends Common {

#####////}}}}}

use FindBin qw($Bin);

# Integers
has 'sleep'			=> 	( isa => 'Str|Undef', is => 'rw', default	=>	10 );

# Strings
#has 'keyfile'		=> 	( isa => 'Str|Undef', is => 'rw', required	=>	1 );
has 'uuid'			=> 	( isa => 'Str|Undef', is => 'rw', required 	=> 	0 );
has 'version'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"" );
has 'options'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"-l200m" );

# Objects
has 'conf'			=> ( isa => 'Conf::Yaml', is => 'rw', lazy => 1, builder => "setConf" );

method filterReads ($uuid, $inputfile, $outputfile) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("inputfile", $inputfile);
	$self->logDebug("outputfile", $outputfile);
	
	my $validated	=	$self->isPairedBam($inputfile);
	$self->logDebug("validated",$validated);
	
	
$self->logDebug("DEBUG EXIT") and exit;


	if ( $validated ) {
			
			my $bam_installdir	=	$self->getInstallDir("bamtools");
	        my $bamtools	=	"$bam_installdir/bin/bamtools";
			
			my $sam_installdir	=	$self->getInstallDir("samtools");
	        my $samtools	=	"$sam_installdir/samtools";
				
			#/agua/apps/bamtools/v2.3.0/bin/bamtools  filter -isMapped false -isPaired false -isProperPair false -in /data/nrc/SRR645386/SRR645386.fxmt.bam -out /data/nrc/SRR645386/SRR645386.fxmt_flt.bam
			my $command	=	qq{$bamtools filter -isMapped true -isPaired true -isProperPair true -in $inputfile -out $outputfile; $samtools index $outputfile};
			
			$self->logDebug("command", $command);
	
			`$command`;
	}
	else {
			my $bam_installdir	=	$self->getInstallDir("bamtools");
	        my $bamtools	=	"$bam_installdir/bin/bamtools";
			
			my $sam_installdir	=	$self->getInstallDir("samtools");
	        my $samtools	=	"$sam_installdir/samtools";

			my $command	=	qq{$bamtools filter -isMapped true -in $inputfile -out $outputfile; $samtools index $outputfile};
			$self->logDebug("command", $command);
			
			`$command`;
	}

	$self->logDebug("COMPLETED");	
}


method isPairedBam ($inputfile) {
	$self->logDebug("inputfile", $inputfile);
	
	my $sam_installdir	=	$self->getInstallDir("samtools");
	my $samtools	=	"$sam_installdir/samtools";

	my $command	=	qq{$samtools flagstats $inputfile};
	$self->logDebug("command", $command);
	
	my $stats = `$command`;
	$self->logDebug("stats", $stats);
	
	return 1 if $stats =~ /paired in sequencing/ms;
	
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


