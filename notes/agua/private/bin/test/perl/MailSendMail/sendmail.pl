#!/usr/bin/perl -w

use Mail::Sendmail;

my %mail = (
	To      => 'stuartpyoung@gmail.com',
	From    => 'stuartpyoung@gmail.com',
	Message => "Mail::Sendmail    TEST 1 from aguanoreply",
	Smtp	=>	"smtp.gmail.com",
	Port	=>	465,
	Auth	=> {
		login		=>	"aguanoreply\@gmail.com",
        password	=>	"norepagua",
		method		=>	"DIGEST-MD5",
		required	=>	0
	},
	Debug	=>	6
);

print "BEFORE sendmail\n";
Mail::Sendmail::sendmail(%mail) or die $Mail::Sendmail::error;
print "AFTER sendmail\n";

print "OK. Log says:\n", $Mail::Sendmail::log;