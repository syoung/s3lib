use AnyEvent::RabbitMQ;
 
my $cv = AnyEvent->condvar;
 
my $ar = AnyEvent::RabbitMQ->new->load_xml_spec()->connect(
    host       => 'localhost',
    port       => 5672,
    user       => 'guest',
    pass       => 'guest',
    vhost      => '/',
    timeout    => 1,
    tls        => 0, # Or 1 if you'd like SSL
    tune       => { heartbeat => 30, channel_max => $whatever, frame_max = $whatever },
    on_success => sub {
        $ar->open_channel(
            on_success => sub {
                my $channel = shift;
                $channel->declare_exchange(
                    exchange   => 'test_exchange',
                    on_success => sub {
                        $cv->send('Declared exchange');
                    },
                    on_failure => $cv,
                );
            },
            on_failure => $cv,
            on_close   => sub {
                my $method_frame = shift->method_frame;
                die $method_frame->reply_code, $method_frame->reply_text;
            }
        );
    },
    on_failure => $cv,
    on_read_failure => sub {die @_},
    on_return  => sub {
        my $frame = shift;
        die "Unable to deliver ", Dumper($frame);
    }
    on_close   => sub {
        my $method_frame = shift->method_frame;
        die $method_frame->reply_code, $method_frame->reply_text;
    },
);
 
print $cv->recv, "\n";