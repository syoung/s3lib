#!/usr/bin/perl -w

use strict;

my $filename = $ARGV[0];

open(OUT, ">$filename") or die "Can't open filename: $filename\n";
print OUT `date`;

my $times = $ARGV[1];
my $counter = 0;
while ( $counter < $times )
{
    print OUT "$counter:  ";
    print OUT `date`;
    $counter++;
    
    sleep(5);
}
close(OUT) or die "Can't close filename: $filename\n";
print "Completed $0\n";