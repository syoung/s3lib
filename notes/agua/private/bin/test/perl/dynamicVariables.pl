#!/usr/bin/perl -w

$test = "test";

$varname = "test";
$$varname = "new test";

print "test: $test\n";

$frequency2 = 10;
$var_name = "frequency2";
print $$var_name, "\n";
