#!/usr/bin/perl -w

use strict;

use CGI;
my $cgi = CGI->new();

print $cgi->header();
print $cgi->start_html();

print "<pre>";

my $oldout;
open($oldout, ">&STDOUT") or die "Can't set stdout\n";
my $olderr;
open($olderr, ">&STDERR") or die "Can't set stderr\n";

my $logfile = "/tmp/" . `date`;
$logfile =~ s/\s+$//;
$logfile =~ s/[\s:]+/-/g;
print "logfile: $logfile\n";
open (STDOUT, ">$logfile") or die "Can't redirect STDOUT to logfile: $logfile\n";

print "date:\n";
print `date`;

foreach my $key (keys %ENV) {
    print "$key\t$ENV{$key}\n";
}

open STDERR, ">&", $olderr;
open STDOUT, ">&", $oldout;

print `cat $logfile`;

print $cgi->end_html();