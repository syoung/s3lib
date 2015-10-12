package TestRole;
use Moose::Role;
use Method::Signatures::Simple;

use Data::Dumper;

method test ($string) {
    print "TestRole::test    string: $string\n" if defined $string;
    print "TestRole::test    string is not defined\n" if not defined $string;
}


1;