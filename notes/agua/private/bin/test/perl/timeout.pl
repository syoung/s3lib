#!/usr/bin/perl

my $alarm = 5;
my $duration = 10;

#eval {
    local %SIG;
    $SIG{ALRM}=	sub{ print "timeout reached, after $alarm seconds!\n"; };
    alarm $alarm;
    print "sleeping for $duration seconds\n";
    sleep $duration; # This is where to put your code, between the alarms
    alarm 0;
#};
#alarm 0;
if($@) { print "Error: $@\n"; }

print "Completed $0\n";
exit(0);
