#!/usr/bin/perl -w

use Net::RabbitMQ;

my $mq = Net::RabbitMQ->new();
$mq->connect("localhost", { user => "guest", password => "guest" });
$mq->channel_open(1);
$mq->publish(1, "queuename", "Hi there!");
$mq->disconnect();

# GIVES THIS RESULT
=INFO REPORT==== 19-Apr-2013::03:21:43 ===
accepting AMQP connection <0.987.0> (127.0.0.1:58586 -> 127.0.0.1:5672)

=INFO REPORT==== 19-Apr-2013::03:21:43 ===
closing AMQP connection <0.987.0> (127.0.0.1:58586 -> 127.0.0.1:5672)
