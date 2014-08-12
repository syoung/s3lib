use MooseX::Declare;

use strict;
use warnings;

class NRC::App::CheckAligned extends NRC::Main {

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

method checkAligned ($uuid, $inputfile, $outputfile) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("inputfile", $inputfile);
	$self->logDebug("outputfile", $outputfile);
	
	my $validated	=	$self->bamIsAligned($inputfile);
	if ( $validated ) {
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
	}
	else {
		my $projects	=	[ "broadbp" ];
		foreach my $project ( @$projects ) {
			my $installdir	=	$self->getInstallDir($project);
			$self->logDebug("installdir", $installdir);
			my $packagename	=	uc($project);
			my $command	=	qq{cd $installdir/conf && $flow $packagename.proj runProject --samplestring "sample:$uuid" --log 4};
			$self->logDebug("command", $command);
			
		}
	}

	$self->logDebug("COMPLETED");	
}


method bamIsAligned ($inputfile) {
	$self->logDebug("inputfile", $inputfile);

	#### GET EXECUTABLES
	my $installdir	=	$self->getInstallDir("samtools");
	my $samtools	=	"$installdir/samtools";
	# E.G.: /agua/apps/samtools/0.1.19/samtools

	my $command = "$samtools view $inputfile | head -n 100 $outputfile";
	$self->logDebug("command", $command);
	my $output	=	`$command`;
	$self->logDebug("output", $output);			

	my $lines;
	@$lines		=	split "\n", $output;
	foreach my $line ( @$lines ) {
		my $tabs;
		@$tabs		=	split "\t", $line; 
		if ( $$tabs[2] == '*' ) {
			return 0;
		}
	}
	
	return;	
}


	
}


