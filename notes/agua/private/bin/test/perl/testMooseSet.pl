#!/usr/bin/perl

use TestSet;


print "BEFORE TEST SET\n";

my $setter = TestSet->new();
my $result = $setter->setIt();
print "testMooseSet.pl    result: $result\n";