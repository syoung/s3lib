package Remember;

sub TIESCALAR {
    my $class = shift;
    my $filename = shift;

    open(my $handle, ">", $filename)
         or die "Cannot open $filename: $!\n";
    print $handle "The Start\n";
    bless {FH => $handle, VALUE => 0}, $class;
}

sub comment {
    my $self = shift;
    my $message = shift;
    my $handle = $self->{FH};
    print $handle $message, "\n";
}

#sub FETCH {
#    my $self = shift;
#    return $self->{VALUE};
#}

sub STORE {
    my $self = shift;
    my $value = shift;
    my $handle = $self->{FH};
    print $handle "$value\n";
    $self->{VALUE} = $value;
}

sub DESTROY {
    my $self = shift;
    my $handle = $self->{FH};
    print $handle "The End\n";
    close $handle;
}

1;