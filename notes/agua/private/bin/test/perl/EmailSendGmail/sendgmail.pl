#!/usr/bin/perl

use strict;
use warnings;
use Email::Send;
use Email::Send::Gmail;
use Email::Simple::Creator;

my $from	=	"aguanoreply\@gmail.com";
my $to 		= "stuartpyoung\@gmail.com";

my $email = Email::Simple->create(
	header => [
		From    => 	$from,
		To      => 	$to,
		Subject => 	"Email::Send::Gmail TEST 2 from $from to $to",
	],
	body => 'Test email',
);

my $sender = Email::Send->new(
	{
		mailer      => 'Gmail',
		mailer_args => [
			username => 'aguanoreply',
			password => 'norepagua',
		]
	}
);
eval { $sender->send($email) };
die "Error sending email: $@" if $@;