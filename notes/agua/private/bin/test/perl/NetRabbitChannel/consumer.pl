#!/usr/bin/perl -w

use Net::RabbitMQ::Channel;

my $channel = Net::RabbitMQ::Channel->new (1, {
        hosts => {
                rabbit1 => {user => 'guest', pass => 'guest'},
                rabbit2 => {user => 'guest', pass => 'guest'}
        }
});

my $exchange = $channel->exchange_declare (
        'test.x', 
        exchange_type => "topic",
);

my $publisher_key = 'test.*';

# consumer part
my $queue = $channel->queue_declare (
        'test.q',
        exclusive => 0,
);

$queue->bind ($exchange, $publisher_key);

# consumer part
my $message = $queue->get;
print "consumer.pl    message: $message\n";