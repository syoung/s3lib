#!/usr/bin/perl

use strict ;
use warnings ;

use Net::RabbitMQ ;

{
    # closure to return a new channel ID every time we call nextchan
    my $nextchan = 1 ;
    sub nextchan { return $nextchan++ } ;
}

### BEGIN CONFIGURABLE PARAMETERS ######################################
my $host    = q{localhost} ;
my $qname   = q{chat} ;
my $count   = $ARGV[0] ;
#print "count: $count\n";
### NO CONFIGURABLE PARAMETERS BELOW THIS LINE #########################

my $mq      = Net::RabbitMQ->new() ;
my $chanID  = nextchan() ;

my %qparms = (
    user => "guest",
    password => "guest",
    host    =>  $host,
    vhost   =>  "/",
    port    =>  5672
);
$mq->connect($host, \%qparms) ;

$mq->channel_open($chanID) ;

my %declare_opts = (
    durable => 1,
    auto_delete => 0
);
$mq->queue_declare($chanID, $qname, \%declare_opts,) ;

print "Sending tasks:\n";
for (my $i = 1 ; $i <= $count ; $i++) {
    my $sec     = 1+int(rand(10)) ;
    my $message = qq{This task will last for $sec seconds} ;

    $mq->publish($chanID, $qname, $message,{
        exchange => "chat",
        routing_key =>  ""
    },) ;

    print STDERR qq{\tMessage "$message" sent to queue $qname\n} ;
}

$mq->disconnect ;