#!/usr/bin/perl -w

#$SIG{__WARN__}
#$SIG{__DIE__}
##If the Ctrl+C key sequence is pressed anytime after the hash assignment is made, the WARN_handler function is called instead of the default handler.

#Note In theory, you could remove the exit() call from the signal handler function, and the script should start executing from wherever it left off. However, this feature is not working on several platforms. If you want to test your platform, run the following small program:

my $logfile = "/tmp/sigwarn.log";
open(LOG, ">$logfile") or die "Can't open logfile: $logfile\n";

sub WARN_handler {
    print("Don't Interrupt!\n");
    print LOG "warning: @_";
    print "@_\n";    
}

print "Setting SIG{'Warn'} to WARN_handler\n";
$SIG{'__WARN__'} = 'WARN_handler';


for ($x = 0; $x < 5; $x++) {
    print("$x\n");
    warn "warning $x";
    sleep 1;
} 

close(LOG) or die "Cant' close logfile: $logfile\n";