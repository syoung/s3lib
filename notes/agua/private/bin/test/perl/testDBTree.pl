#!/usr/bin/perl -w


use strict ;

use DB_File;
$DB_File::DB_BTREE->{cachesize} = 10_000_000; # 10meg cache
$DB_File::DB_BTREE->{psize} = 32*1024; # 32k pages
use Fcntl;      				#### Needed for DB_File
use Fcntl qw(O_RDWR O_CREAT);	#### import the O_CREAT and O_RDWR constants


my $filename = $ARGV[0];
unlink($filename);

our (%h, $k, $v) ;

tie(%h, 'DB_File', $filename, O_RDWR|O_CREAT, 0666, $DB_BTREE)
		or die "Can't tie file: $filename: $!";
	
# Add a few key/value pairs to the file
$h{"apple"} = "red\tred" ;
$h{"orange"} = "orange\torange" ;
$h{"banana"} = "yellow\tyellow" ;
$h{"tomato"} = "red\tred" ;

# Check for existence of a key
print "Banana Exists\n\n" if $h{"banana"} ;
# Delete a key/value pair.
delete $h{"apple"} ;

# print the contents of the file
while (($k, $v) = each %h)
  { print "$k -> $v\n" }
  
untie %h ;