#!/usr/bin/perl -w


my $input = <STDIN>;

my $outfile = "./OUT";
open(OUT, ">$outfile") or die "Can't open outfile: $outfile\n";
print OUT $input;
close(OUT) or die "Can't close outfile: $outfile\n";
