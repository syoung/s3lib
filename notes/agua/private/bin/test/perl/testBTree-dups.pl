#!/usr/bin/perl -w


use strict ;

use DB_File ;

# Enable duplicate records
$DB_BTREE->{'flags'} = R_DUP ;

my ($filename, $x, %h, $status, $key, $value) ;
$filename = "tree" ;

unlink $filename ;


$x = tie %h, "DB_File", $filename, O_RDWR|O_CREAT, 0666, $DB_BTREE 
or die "Cannot open $filename: $!\n";
# Add some key/value pairs to the file
$h{'Wall'} = 'Larry' ;
$h{'Wall'} = 'Brick' ; # Note the duplicate key
$h{'Wall'} = 'Brick' ; # Note the duplicate key and value
$h{'Smith'} = 'John' ;
$h{'mouse'} = 'mickey' ;
# iterate through the btree using seq
# and print each key/value pair.
$key = $value = 0 ;
for ($status = $x->seq($key, $value, R_FIRST) ;
     $status == 0 ;
     $status = $x->seq($key, $value, R_NEXT) )
  {  print "$key -> $value\n" }
undef $x ;
untie %h ;