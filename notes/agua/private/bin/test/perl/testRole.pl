#!/usr/bin/perl -w

use TestRoleUser;
use Data::Dumper;

my $object = TestRoleUser->new();
#print "object:\n";
#print Dumper $object;

$object->test("IT WORKS");
$object->test();
$object->test2("IT WORKS TOO");