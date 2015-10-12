#!/usr/bin/perl -w

#### DEBUG
my $DEBUG = 0;
#$DEBUG = 1;

#### TIME
my $time = time();

=head2

    APPLICATION     testNetEc
	    
    VERSION         0.01

    PURPOSE
  
        TEST Net::Amazon::EC2 MODULE

    INPUT

        
    OUTPUT

    USAGE

    ./testNetEc.pl 
    
    ###./testNetEc.pl <--inputfile String> <--outputfile String> <--referencefile String> [--help]
    
		###--inputfile				:   /full/path/to/readfile.fastq
		###--outputfile				:   /full/path/to/output_directory
		###--referencefile			:   /full/path/to/squashed_genome_files
		###--help                 	:   print help info

    EXAMPLES


###chmod 755 /nethome/bioinfo/apps/agua/0.4/bin/apps/testNetEc.pl
###
###/nethome/bioinfo/apps/agua/0.4/bin/apps/testNetEc.pl \
###--inputfile /nethome/syoung/base/pipeline/benchmark/data/duan/run12/s_1_1_sequence.fastq \
###--referencefile /nethome/bioinfo/data/sequence/chromosomes/human-sq \
###--outputfile /nethome/syoung/base/pipeline/benchmark/eland/
###
=cut

use strict;

#### EXTERNAL MODULES
use Term::ANSIColor qw(:constants);
use Data::Dumper;
use Getopt::Long;
use FindBin qw($Bin);

#### USE LIBRARY
use lib "$Bin/../../../lib";	
use lib "$Bin/../../../lib/external";	

use Net::Amazon::EC2;

#### INTERNAL MODULES
use Timer;
use Util;
use Conf::Agua;

#### GET OPTIONS
my $inputfile;
my $referencefile;
my $outputfile;
my $help;
if ( not GetOptions (
    'inputfile=s' 	=> \$inputfile,
    'referencefile=s' 	=> \$referencefile,
    'outputfile=s' 	=> \$outputfile,
    'help' 			=> \$help
) )
{ print "testNetEc.pl    Use option --help for usage instructions.\n";  exit;    };

#### PRINT HELP
if ( defined $help )	{	usage();	}

##### CHECK INPUTS
#die "Input file not defined (Use --help for usage)\n" if not defined $inputfile;
#die "Output directory not defined (Use --help for usage)\n" if not defined $outputfile;
#die "Reference file not defined (Use --help for usage)\n" if not defined $referencefile;
#print "testNetEc.pl    inputfile: $inputfile\n";
#print "testNetEc.pl    referencefile: $referencefile\n" if defined $referencefile;
#print "testNetEc.pl    outputfile: $outputfile\n";
#

my $ec2 = Net::Amazon::EC2->new(
       AWSAccessKeyId => 'AKIAIZXZ6S7ARZ44TTHQ', 
       SecretAccessKey => '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');


# Start 1 new instance from AMI: ami-XXXXXXXX
my $instance = $ec2->run_instances(
    InstanceType => 'm1.large',
    ImageId => 'ami-0a59bb63',
	MinCount => 1,
	MaxCount => 1);

	#### 32-bit
    #ImageId => 'ami-0859bb61',

print "instance: \n";
print Dumper $instance;
my $running_instances = $ec2->describe_instances;

foreach my $reservation (@$running_instances) {
   foreach my $instance ($reservation->instances_set) {
       print "instance->instance_id: " , $instance->instance_id . "\n";
   }
}

my $instance_id = $instance->instances_set->[0]->instance_id;

print "instance_id: $instance_id\n";

# Terminate instance

my $result = $ec2->terminate_instances(InstanceId => $instance_id);

#### PRINT RUN TIME
my $runtime = Timer::runtime( $time, time() );
print "\nRun time: $runtime\n";
print "Completed $0\n";
print Timer::datetime(), "\n";
print "****************************************\n\n\n";
exit;

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#									SUBROUTINES
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


=head2

	SUBROUTINE		set_parameter
	
	PURPOSE
	
		SET THE VALUE OF A PARAMETER IN arguments

=cut

sub set_parameter
{	
	my $arguments		=	shift;
	my $parameter			=	shift;
	my $value			=	shift;

	#my $DEBUG = 1;
	print "testNetEc.pl::set_parameter    testNetEc.pl::set_parameter(arguments, parameter, value)\n" if $DEBUG;
	print "testNetEc.pl::set_parameter    parameter: $parameter\n" if $DEBUG;
	print "testNetEc.pl::set_parameter    value: $value\n" if $DEBUG;
	
	for ( my $i = 0; $i < @$arguments; $i++ )
	{
		if ( "--$parameter" eq $$arguments[$i] )
		{
			$$arguments[$i + 1] = $value;
			return $arguments;
		}	
	}
	
	return $arguments;
}



=head2

	SUBROUTINE		fill_in
	
	PURPOSE
	
		SUBSTITUTE counter FOR ONE OR MORE '%COUNTER%' STRINGS IN ALL ARGUMENTS

=cut

sub fill_in
{	
	my $arguments		=	shift;
	my $pattern			=	shift;
	my $value			=	shift;
	
	#my $DEBUG = 1;
	print "testNetEc.pl::fill_in    testNetEc.pl::fill_in(arguments, value)\n" if $DEBUG;
	print "testNetEc.pl::fill_in    arguments:\n" if $DEBUG;
	print join "\n", @$arguments if $DEBUG;
	print "\n";
	print "testNetEc.pl::fill_in    value: $value\n" if $DEBUG;
	
	foreach my $argument ( @$arguments )
	{
		$argument =~ s/$pattern/$value/ig;
	}

	return $arguments;
}


=head2

	SUBROUTINE		get_argument
	
	PURPOSE
	
		EXTRACT AN ARGUMENT FROM THE ARGUMENT ARRAY AND RETURN IT 

=cut

sub get_argument
{	
	my $arguments		=	shift;
	my $name			=	shift;

#my $DEBUG = 1;
print "testNetEc.pl::get_argument    testNetEc.pl::get_argument(arguments, name)\n" if $DEBUG;
print "testNetEc.pl::get_argument    arguments:\n" if $DEBUG;
print join "\n", @$arguments if $DEBUG;
print "\n";
print "testNetEc.pl::get_argument    name: $name\n" if $DEBUG;

	
	my $argument;
	for ( my $i = 0; $i < @$arguments; $i++ )
	{
		if ( "--$name" eq $$arguments[$i] )
		{
			$argument = $$arguments[$i + 1];
			splice @$arguments, $i, 2;
			return $argument;
		}
	}
	
	return;
}



sub usage
{
	print GREEN;
	print `perldoc $0`;
	print RESET;
	exit;
}


