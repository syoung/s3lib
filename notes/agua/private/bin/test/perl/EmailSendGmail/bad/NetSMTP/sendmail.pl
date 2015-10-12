#!/usr/bin/perl -w

use Net::SMTP;
use Data::Dumper;


$smtp = Net::SMTP->new('smtp.gmail.com');
print "smtp:\n";
print Dumper $smtp;

my $from 	=	"stuartpyoung\@gmail.com";
my $to		=	"aguadev\@gmail.com";

$smtp->mail($from);
$smtp->to($to);

$smtp->data();
$smtp->datasend("To: aguadev\n");
$smtp->datasend("\n");
$smtp->datasend("A simple test message\n");
$smtp->dataend();

$smtp->quit;
