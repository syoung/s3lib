#!/usr/bin/perl -w

my $input = $ARGV[0];
my $file = "./workflow.out";
open(OUT, ">$file") or die "Can't open file: $file\n";
print OUT $input;
close(OUT);