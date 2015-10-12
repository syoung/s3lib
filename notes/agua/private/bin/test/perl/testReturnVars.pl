#!/usr/bin/perl -w

my ($var, $trash) = returnVars();
print "var: $var\n";

sub returnVars {
    return 1, 2;
}

