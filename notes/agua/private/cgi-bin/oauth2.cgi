#!/usr/bin/perl -w

use strict;

use CGI qw(fatalsToBrowser);

my $cgi = CGI->new();
print $cgi->header();
print $cgi->start_html();

my $accesstoken = $cgi->param("access_token");

print "access token: $accesstoken\n";


print $cgi->end_html();