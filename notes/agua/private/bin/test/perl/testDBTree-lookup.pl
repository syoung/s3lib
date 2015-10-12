#!/usr/bin/perl -w


use strict ;
use Data::Dumper;
use DB_File ;
$DB_File::DB_BTREE->{cachesize} = 10_000_000; # 10meg cache
$DB_File::DB_BTREE->{psize} = 32*1024; # 32k pages
use Fcntl;      				#### Needed for DB_File
use Fcntl qw(O_RDWR O_CREAT);	#### import the O_CREAT and O_RDWR constants


our (%h, $k, $v) ;
my $filename = $ARGV[0];

tie %h, "DB_File", $filename, O_RDWR|O_CREAT, 0666, $DB_File::DB_BTREE
    or die "Cannot open file 'fruit': $!\n";

print "hash h:\n";
print Dumper %h;

print "printing contents of file: $filename\n";
# print the contents of the file
while (($k, $v) = each %h)
  { print "$k -> $v\n" }
  
untie %h ;