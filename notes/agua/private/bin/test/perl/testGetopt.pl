#!/usr/bin/perl


#### In your class
##package TestGetopt;
##use Moose;
##
##with 'MooseX::Getopt';
##
##has 'out' => (is => 'rw', isa => 'Str', required => 1);
##has 'in'  => (is => 'rw', isa => 'Str', required => 1);
##
### ... rest of the class here

# in your script

#### USE LIBS
use FindBin qw($Bin);
use lib "$Bin/../../../lib/";
use lib "$Bin/../../../lib/external";

use TestGetopt;

my $app = TestGetopt->new_with_options();
#print "app->out(): " , $app->out(), "\n";
#print "app->in(): " , $app->in(), "\n";

print "Completed $0\n";
# ... rest of the script here

# on the command line
