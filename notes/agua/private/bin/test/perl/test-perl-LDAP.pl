#!/usr/bin/perl -w
use strict;

#### EXTERNAL MODULES
use Net::LDAP;
use Data::Dumper;

#my $username = "syoung";
#my $passwd = $ARGV[0];
my $username = $ARGV[0];
my $passwd = $ARGV[1];
$username =~ s/\s+$//;
$passwd =~ s/\s+$//;
print "Username: *$username*\n";
print "Passwd: *$passwd*\n";


my $ldap = Net::LDAP->new ( "ldap.ccs.miami.edu" ) or die "$@";
my $message = $ldap->bind ( "uid=$username,ou=Users,dc=ccs,dc=miami,dc=edu",
                       password => "$passwd");
print "Message->code: " , $message->code(), "\n\n";

print "Completed\n";

