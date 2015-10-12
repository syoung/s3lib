#!/usr/bin/perl -w

use strict;
use warnings;

use Data::Dumper;
use Email::Send::SMTP::Gmail;

my ($mail,$error)=Email::Send::SMTP::Gmail->new(
	-smtp	=>	'smtp.gmail.com',
	-login	=>	'aguanoreply@gmail.com',
	-pass	=>	'norepagua'
);

print "mail:\n";
print Dumper $mail;
print "\n";
print "session error: $error" unless ($mail!=-1);

$mail->send(
	-to				=>	'stuartpyoung@gmail.com',
	-subject		=>	'Hello!',
	-body			=>	'TESTING',
	-attachments	=>	'full_path_to_file'
);

$mail->bye;