use Moose;
use MooseX::Declare;

class TestSet {
    
has 'setme'	=> ( isa => 'Str|Undef', is => 'rw', default => '' );

method setIt () {
    
    my $value = $self->setme('1');
    print "value: $value\n";
    $value = $self->setme('2');
    print "value: $value\n";
    
    return $value;
}



}

