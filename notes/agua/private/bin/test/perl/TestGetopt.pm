package TestGetopt;
use Moose;

with 'MooseX::Getopt';
extends 'Conf::StarCluster';
#has 'out' => (is => 'rw', isa => 'Str', required => 1);
#has 'in'  => (is => 'rw', isa => 'Str', required => 1);

# ... rest of the class here

1;