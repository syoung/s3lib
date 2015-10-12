#!/usr/bin/perl -w

# jsonToRow

# EXTRACT JSON ROW ENTRIES INTO ROWS WITH HEADER LINE

#### LIBS
use Term::ANSIColor qw(:constants);
use Getopt::Long;
use JSON;
use Data::Dumper;
use Test::More;

#### GET OPTIONS
my $inputfile;
my $headerfile;
my $outputfile;
my $max;
my $help;
GetOptions (
    'inputfile=s' 	=> \$inputfile,
    'headerfile=s' 	=> \$headerfile,
    'outputfile=s' 	=> \$outputfile,
    'max=i' 		=> \$max,
    'help' 			=> \$help             
) or die "No options specified. Use --help for usage\n";
usage() if defined $help;

#### CHECK INPUTS
die "inputfile is not defined (use --help for options)\n" if not defined $inputfile;
die "headerfile is not defined (use --help for options)\n" if not defined $headerfile;
die "outputfile is not defined (use --help for options)\n" if not defined $outputfile;
die "Can't find inputfile: $inputfile\n" if not -f $inputfile;
die "Can't find headerfile: $headerfile\n" if not -f $headerfile;
die "inputfile is empty: $inputfile\n" if -z $inputfile;

my $parser	=	JSON->new();
my $rows	=	getJson($parser, $inputfile);
my $headers	=	getJson($parser, $headerfile);
#print "headers:\n";
#print Dumper $headers;

my $outputrows	=	getOutputRows($parser, $rows, $headers, $max);
#print "outputrows: $outputrows\n";
#print "outputrows[0]: $$outputrows[0]\n";
#print Dumper $$outputrows[0];
#print "outputrows[1]: $$outputrows[1]\n";
#print Dumper $$outputrows[1];

printOutFile($parser, $outputfile, $outputrows);

print "printed outputfile:\n\n$outputfile\n\n";

sub printOutFile {
	my $parser		=	shift;
	my $outfile		=	shift;
	my $data		=	shift;

	my $json	=	$parser->encode($data);
	open(OUT, ">$outfile") or die "Can't open outfile: $outfile\n";
	print OUT $json;
	close(OUT) or die "Can't close outfile: $outfile\n";

}



#my $fields	= [
#	"Source",

sub getOutputRows {
	my $outfile		=	shift;
	my $rows		=	shift;
	my $headers		=	shift;
	my $max			=	shift;

	my $outputrows	=	[];
	
	#### PRINT HEADERS
	push @$outputrows, $headers; 
	
	#### PRINT ROWS
	my $numberrows	=	scalar(@$rows);
	my $stop = $numberrows;
	$stop = $max if defined $max;
	$stop = $numberrows if $numberrows < $max;
	for ( my $i = 0; $i < $stop; $i++ ) {
		my $row	=	$$rows[$i];
		my $outputrow	=	[];
		for my $key ( @$headers ) {
			if ( $row->{$key}) {
				push @$outputrow, $row->{$key};
			}
			else {
				push @$outputrow, "";
			}
		}
		push @$outputrows, $outputrow;
	}
	
	return $outputrows;
}

sub printRows {
	my $outfile		=	shift;
	my $rows		=	shift;
	my $headers		=	shift;

	open(OUT, ">$outfile") or die "Can't open outfile: $outfile\n";
	
	#### PRINT HEADERS
	for ( my $i = 0; $i < @$headers; $i++ ) {
		if ( $i == (scalar(@$headers) - 1) ) {
			print OUT $$headers[$i]; 
		}
		else {
			print OUT $$headers[$i];
			print OUT "\t";
		}
	}
	print OUT "\n";
	
	#### PRINT ROWS
	for my $row ( @$rows  ) {
		for my $key ( @$headers ) {
			if ( $row->{$key}) {
				print OUT $row->{$key};
			}
			else {
				print OUT "";
			}
			print OUT "\t";
		}
		print OUT "\n";
	}

	close(OUT) or die "Can't close outfile: $outfile\n";
}

sub getJson  {
	my ($parser, $file)	= @_;
	
	#### OPEN INPUTFILE
	open(FILE, $file) or die "Can't open inputfile: $file\n";
	$/ = undef;
	my $json =  <FILE>;
	$/ = "\n";
	
	return $parser->decode($json);
}

sub usage
{
	print GREEN;
	print `perldoc $0`;
	print RESET;
	exit;
}


