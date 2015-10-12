#!/usr/bin/perl -w


use strict ;
use DB_File ;

our (%h, $k, $v) ;
my $filename = $ARGV[0];
#my $filename = "fruit";
tie %h, "DB_File", $filename, O_RDWR|O_CREAT, 0666, $DB_HASH
    or die "Cannot open file 'fruit': $!\n";

print "printing contents of file: $filename\n";
# print the contents of the file
while (($k, $v) = each %h)
  { print "$k -> $v\n" }
  
untie %h ;