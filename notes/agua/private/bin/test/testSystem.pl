#!/usr/bin/perl -w

my $command = "echo 'TEST SYSTEM' > /tmp/testSystem.txt";
print "command: $command\n";
system($command);

print "Completed $0\n";
