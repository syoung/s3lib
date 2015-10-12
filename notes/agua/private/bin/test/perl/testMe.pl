#!/usr/bin/perl -w

use strict;

print "testMe.pl\n";

use lib "../../lib";


#use TestMe;
if ( eval "require TestMe" )
{
    print "Successful require\n";
    TestMe::test();    
}
else
{
    print "Can't require Testme\n";
}

print "Completed $0\n";


