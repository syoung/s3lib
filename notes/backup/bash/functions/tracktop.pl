#!/usr/bin/perl -w

my $outputfile	=	$ARGV[0];
print "No output file provided. Exiting\n" if not defined $outputfile;
my $sleep		=	$ARGV[1];