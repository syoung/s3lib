#!/usr/bin/perl -w


use strict ;

use DB_File;
$DB_File::DB_BTREE->{cachesize} = 10_000_000; # 10meg cache
$DB_File::DB_BTREE->{psize} = 32*1024; # 32k pages
use Fcntl;      				#### Needed for DB_File
use Fcntl qw(O_RDWR O_CREAT);	#### import the O_CREAT and O_RDWR constants


my $filename = $ARGV[0];
unlink($filename);

my $hash;
tie(%$hash, 'DB_File', $filename, O_RDWR|O_CREAT, 0666, $DB_BTREE)
	or die "Can't tie file: $filename: $!";
	

# Add a few key/value pairs to the file
$hash->{"apple"} = pack "A*","red\tred" ;
$hash->{"orange"} = pack "A*","orange\torangeand allthe rest overthe hills and to the horizon xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz-----------------------------......" ;
$hash->{"banana"} = pack "A*","yellow\tyellow" ;
$hash->{"tomato"} = pack "A*","red\tred" ;


# Check for existence of a key
print "Banana Exists\n\n" if $hash->{"banana"} ;
# Delete a key/value pair.
delete $hash->{"apple"} ;

foreach ( keys %$hash )
{
    #### NB: ALSO WORKS WITHOUT unpack
    #print "$_\t$hash->{$_}\n";
    print "$_\t";
    print unpack ("A*", $hash->{$_});
    print "\n"
}
	
untie %$hash ;