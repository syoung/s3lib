#!/usr/bin/perl -w

#$SIG{__WARN__}
#$SIG{__DIE__}
##If the Ctrl+C key sequence is pressed anytime after the hash assignment is made, the WARN_handler function is called instead of the default handler.

#Note In theory, you could remove the exit() call from the signal handler function, and the script should start executing from wherever it left off. However, this feature is not working on several platforms. If you want to test your platform, run the following small program:

my $logfile = "/tmp/sighandler.log";
open(LOG, ">$logfile") or die "Can't open logfile: $logfile\n";

sub WARN_handler {
    my($signal) = @_;
    my ($package, $filename, $linenumber) = caller;
    my $timestamp = logTimestamp();
	my $callingsub = (caller 1)[3] || '';
	my $line = "$timestamp\t[WARN]   \t$callingsub\t$linenumber\t$signal";
    print $line;
    print LOG $line;
}

sub DIE_handler {
    my($signal) = @_;

    my ($package, $filename, $linenumber) = caller;
    my $timestamp = logTimestamp();
	my $callingsub = (caller 1)[3] || '';
	my $line = "$timestamp\t[DIE]   \t$callingsub\t$linenumber\t$signal";
    print $line;
    print LOG $line;
}


sub logTimestamp {
    my ($self) = @_;
    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
    return sprintf "%4d-%02d-%02d %02d:%02d:%02d",
        $year+1900,$mon+1,$mday,$hour,$min,$sec;
}


sub sendToLogfile {
    my(@array) = @_;

    my ($package, $filename, $linenumber) = caller;
    my $timestamp = logTimestamp();
	my $callingsub = (caller 1)[3] || '';
	my $line = "$timestamp\t[WARN]   \t$callingsub\t$linenumber\t@array\n";
    print "LINE: $line\n";


    #open(LOGFILE, ">>program.log");
    print LOG (@array);
    #close(LOGFILE);
}

print "Setting SIG{'Warn'} to WARN_handler\n";
$SIG{__WARN__} = 'WARN_handler';
$SIG{__DIE__}  = 'DIE_handler';

sub run {
for ($x = 0; $x < 5; $x++) {
    warn "warning $x";
    sleep 1;
} 
chdir('/doesnotexist') or warn($!);
chdir('/doesnotexist') or die($!);
    
}

run();

print "THIS SHOULD NOT APPEAR IN STDOUT\n";

close(LOG) or die "Can't close logfile: $logfile\n";
