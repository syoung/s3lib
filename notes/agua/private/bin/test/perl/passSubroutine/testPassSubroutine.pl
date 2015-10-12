#!/usr/bin/perl -w
use strict;

use TestPassSubroutine;

my $test = TestPassSubroutine->new();

my $input = "HAIRY";
my $output = $test->testSub($input);
print "output: $output\n";
