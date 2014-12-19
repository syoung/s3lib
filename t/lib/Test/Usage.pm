use MooseX::Declare;

use strict;
use warnings;

class Test::Usage extends (Usage, Test::Common) {

use FindBin qw($Bin);
use Test::More;

#####////}}}}}

method testGetUsage {
	diag("getUsage");
	
	my $directory	=	"$Bin/inputs/Run";
	my $expectedfile=	"$Bin/inputs/usage.raw";

	my $usage		=	$self->getUsage($directory);
	$self->logDebug("length usage", length($usage));
	$self->logDebug("usage", $usage);

	my $expected	=	$self->fileContents($expectedfile);
	$self->logDebug("length expected", length($expected));
	
	ok($usage eq $expected, "usage match");	
}

method testReport {
	diag("report");
	
	my $directory	=	"$Bin/inputs/Run";
	my $expectedfile=	"$Bin/inputs/usage.tsv";
	my $outputfile	=	"$Bin/outputs/usage.tsv";

	$self->report($directory, $outputfile);
	
	ok($self->diff($outputfile, $expectedfile), "file match");	
}


}

