use MooseX::Declare;

use strict;
use warnings;

class NRC::App::Varscan extends NRC::Main {

#####////}}}}}

use FindBin qw($Bin);

use Agua::CLI::App;

use Conf::Yaml;

# Strings
has 'batchsize'		=> 	( isa => 'Int|Undef', is => 'rw', default	=>	5 );

# Strings
has 'uuid'			=> 	( isa => 'Str|Undef', is => 'rw', required 	=> 	0 );
has 'sleep'			=> 	( isa => 'Str|Undef', is => 'rw', default	=>	10 );
has 'version'		=> 	( isa => 'Str|Undef', is => 'rw', default	=>	"v1.0.4" );

# Objects
has 'conf'			=> ( isa => 'Conf::Yaml', is => 'rw', lazy => 1, builder => "setConf" );


method align ($uuid, $inputdir, $filename, $outputdir, $reference, $workdir, $version, $batchsize) {
	$self->logDebug("uuid", $uuid);
	$self->logDebug("inputdir", $inputdir);
	$self->logDebug("filename", $filename);
	$self->logDebug("outputdir", $outputdir);
	$self->logDebug("workdir", $workdir);
	$self->logDebug("version", $version);
	$self->logDebug("reference", $reference);

	#### SET VERSION
	$version	=	$self->version() if not defined $version;
	$self->logDebug("FINAL version", $version);
	
	#### GET EXECUTABLE
	my $package = $self->conf()->getKey("packages:pcap", undef);
	$self->logDebug("package", $package);
	my $installdir	=	$package->{$version}->{INSTALLDIR};
	$self->logDebug("installdir", $installdir);
	my $executable	=	 "$installdir/bin/bwa_mem.pl";

	#### GET INPUT FILES
	my $bamfiles	=	$self->getBamFiles($inputdir);
	$self->logDebug("bamfiles", $bamfiles);
	foreach my $bamfile ( @$bamfiles ) {
		$bamfile	=	"$inputdir/$bamfile";
	}

	#### SET FILE STUB
	my ($filestub)	=	$filename	=~ /^(.+)\.bam$/;
	
	#### SET THREADS	
	my $threads		=	$self->getCpus();
	print "threads: $threads\n";
	
	#### RUN
	$batchsize	=	$self->batchsize() if not defined $batchsize;
	$self->logDebug("batchsize", $batchsize);

	#### CREATE OUTPUTDIR
	`mkdir -p $outputdir` if not -d $outputdir;
	
	my $counter 	= 	1;
	while ( scalar(@$bamfiles) > 0 ) {
		my $batch;
		@$batch		=	splice(@$bamfiles, 0, $batchsize);
		$self->logDebug("batch", $batch);
		
		my $outfile	=	$filestub . "-$counter";
		my $command	= "$executable -r $reference -t $threads -o $outputdir -s $outfile @$batch -workdir $workdir";
		$self->logDebug("command", $command);
	
		print "NRC::App::Varscan    command: $command\n";
		
		`$command`;

		$counter++;
	}
}




	
}

