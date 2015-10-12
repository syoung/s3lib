#!/usr/bin/perl -w

use Data::Dumper;
use Net::RabbitMQ::Channel;

my $channel = Net::RabbitMQ::Channel->new(1, {
    hosts => {
        #"rabbit\@syoung-dev" => {user => 'guest', pass => 'guest'},
        rabbit1 => {user => 'guest', pass => 'guest'},
        rabbit2 => {user => 'guest', pass => 'guest'}
    }
});
print "publisher.pl    channel:\n";
print Dumper $channel;

my $exchange = $channel->exchange_declare (
        'test.x', 
        exchange_type => "topic",
);

my $publisher_key = 'test.*';

# publisher part
my $message = "you have mail";
$exchange->publish ($publisher_key, $message,
        app_id => 'test',
        timestamp => time
);

print "publisher.pl    published: $message\n";
