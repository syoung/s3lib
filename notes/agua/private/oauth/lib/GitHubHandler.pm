package GitHubHandler;
use parent 'OAuth::Lite2::Server::DataHandler';

my %CLIENTS;

sub init {
    my $self = shift;
    
    print "GitHubHandler::init\n";
    # template method
}


sub request {
    my $self = shift;
    return $self->{request};
}

sub add_client {
    my ($class, %args) = @_;
    $CLIENTS{ $args{id} } = {
        secret  => $args{secret},
        user_id => $args{user_id} || 0,
    };
}

1;