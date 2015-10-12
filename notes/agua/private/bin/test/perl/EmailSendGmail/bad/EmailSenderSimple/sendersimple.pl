#!/usr/bin/perl -wc

use strict;
use Email::Sender::Simple qw(sendmail);
use Email::Simple;
use Email::Simple::Creator;

my $email = Email::Simple->create(
  header => [
	To      => '"Xavier Q. Ample" <stuartpyoung@gmail.com>',
	From    => '"Email::Sender::Simple" <noaddress@gmail.com>',
	Subject => "Email::Sender::Simple TEST 1 from noaddress to stuartpyoung",
  ],
  body => "TEST message\n",
);

sendmail($email);


# Please install an MTA on this system if you want to use sendmail!