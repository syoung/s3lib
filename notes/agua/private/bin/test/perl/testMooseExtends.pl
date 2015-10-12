#!/usr/bin/perl -w

use MooseX::Declare;

class Person {

has 'first_name' => (is => 'rw', isa => 'Str');
has 'last_name'  => (is => 'rw', isa => 'Str');

    method BUILD ($hash) { 
        print "INSIDE Person BUILD\n";
    }

}

class Boss extends Person {

    has 'position' => (is => 'rw', isa => 'Str');

    method BUILD ($hash) {
        my $args = shift;
        print "INSIDE Boss BUILD\n";
    }
}



my $boss = Boss->new();

