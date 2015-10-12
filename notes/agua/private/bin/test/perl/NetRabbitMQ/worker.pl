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

### NO CONFIGURABLE PARAMETERS BELOW THIS LINE #########################
my $mq      = Net::RabbitMQ->new() ;
my $chanID  = nextchan() ;

#$mq->connect($host, { user => "guest", password => "guest" });
my %qparms = (
    user => "guest",
    password => "guest",
    host    =>  $host,
    vhost   =>  "/",
    port    =>  5672
);
$mq->connect($host, \%qparms);

$mq->channel_open($chanID);

$mq->basic_qos($chanID,{ prefetch_count => 1 });

my %declare_opts = (
    durable => 1,
    auto_delete => 0
) ;

$mq->queue_declare($chanID, $qname, \%declare_opts) ;

#### IMPORTANT: REQUIRED TO CONNECT TO chat FANOUT
$mq->queue_bind($chanID, $qname, "chat", "",);

my %consume_opts = (
    exchange => "chat",
    routing_key =>  ""
);
$mq->consume($chanID, $qname, \%consume_opts);

# NOTE THAT recv() is BLOCKING!!! get wasn't!
while ( my $payload = $mq->recv() ) {
    print "payload\n";
    last if not defined $payload ;
    my $body  = $payload->{body} ;
    my $dtag  = $payload->{delivery_tag} ;
    
    #print "Message received (dtag: $dtag): $body\n";
    my ($sec) = ( $body =~ /(\d+)/ );
    print STDERR qq{Worker $$: Received from queue $qname: $body\n} ;
    print STDERR qq{Worker $$: sleeping $sec seconds\n} ;
    
    sleep $sec ;

    $mq->ack($chanID,$dtag,) ;
    print STDERR qq{Worker $$: Completed\n} ;
}