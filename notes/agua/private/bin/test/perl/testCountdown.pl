#!/usr/bin/perl -w

$| = 1;

my $maxlength = 20;
print "countdown started\n";
print "\n";
for ( 0 .. 10 ) {
    sleep(1);
    print "\b" x $maxlength;
    my $text = "progress $_";
    my $spaces = " " x ($maxlength - length($text));
    print "$text$spaces";
}
print "Completed $0\n";