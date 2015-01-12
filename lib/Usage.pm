use MooseX::Declare;
use Method::Signatures::Simple;


use strict;
use warnings;

class Usage extends Common {

#####////}}}}}

use FindBin qw($Bin);

method report ($directory, $outputfile) {
	$self->logDebug("directory", $directory);
	$self->logDebug("outputfile", $outputfile);
	my $usage	=	$self->getUsage($directory);
	$self->logDebug("usage", $usage);
	$usage		=~	s/==>\s+.+?([^\/]+)\/stdout\/(\d+)-([^\-]+).+?<==\n/$1\t$2\t$3\t/msg;
	$usage		=~	s/\S+\s+\S+\s+(\S+)elapsed\s+(\S+)CPU\s+.+?\s+(\d+)max.+?\n/$1\t$2\t$3/msg;
	$usage		=~	s/\.\d+//msg;
	$self->logDebug("PARSED usage", $usage);

$self->logDebug("DEBUG EXIT") and exit;


	my @lines	=	split "\n", $usage;
	foreach my $line ( @lines ) {
		my @elements = split "\t", $line;
		my $minutes	=	$elements[3];
		$minutes = $self->metricMinutes($minutes);
		#$self->logDebug("metric minutes", $minutes);
		$elements[3]	=	$minutes;
		$line	=	join "\t", @elements;
	}
	
	my $output	=	join "\n", @lines;
	$self->logDebug("output", $output);
	
	$self->printToFile($outputfile, $output);
	
	return $outputfile;
}

method metricMinutes ($minutes) {
	my ($mins, $secs)	=	$minutes	=~ /^([^:]+):([^:]+)/;
	#$self->logDebug("mins", $mins);
	#$self->logDebug("secs", $secs);
	
	$secs 	=	($secs/60) * 100;
    $secs 	= sprintf "%02d", $secs;
	
	return "$mins.$secs";
}

method getUsage ($directory) {
	#$self->logDebug("directory", $directory);
	my $command	=	"tail --lines=2 $directory/*/stdout/*usage";
	$self->logDebug("command", $command);
	
	my $usage	=	`$command`;
	#$self->logDebug("usage", $usage);
	
	return $usage;
}


	
}
