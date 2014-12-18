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

method filterReads ($uuid, $inputfile, $outputfile, $paired) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("paired", $paired);
	$self->logDebug("inputfile", $inputfile);
	$self->logDebug("outputfile", $outputfile);
	
	$paired	=	$self->isPairedBam($inputfile) if not defined $paired;
	$self->logDebug("FINAL paired",$paired);

	#### GET TOOLS
	my $bam_installdir	=	$self->getInstallDir("bamtools");
	my $bamtools	=	"$bam_installdir/bin/bamtools";
	
	if ( $paired ) {
		my $command	=	qq{$bamtools filter -isMapped true -isPaired true -isProperPair true -in $inputfile -out $outputfile};
		$self->logDebug("command", $command);
		`$command`;
	}
	else {
		my $command	=	qq{$bamtools filter -isMapped true -in $inputfile -out $outputfile};
		$self->logDebug("command", $command);
		`$command`;
	}

	$self->logDebug("COMPLETED $0");	
}


method isPairedBam ($inputfile) {
	$self->logDebug("inputfile", $inputfile);
	
	my $sam_installdir	=	$self->getInstallDir("samtools");
	my $samtools	=	"$sam_installdir/samtools";

	my $command	=	qq{$samtools flagstat $inputfile};
	$self->logDebug("command", $command);
	
	my $stats = `$command`;
	$self->logDebug("stats", $stats);
	
	return 1 if $stats =~ /paired in sequencing/ms;
	
	return 0;	
}

	
}


