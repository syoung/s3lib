#!/usr/bin/perl -w

print "Setting SIG{'Warn'} to INT_handler\n";
$SIG{'INT'} = 'INT_handler';

#If the Ctrl+C key sequence is pressed anytime after the hash assignment is made, the INT_handler function is called instead of the default handler.

#Note In theory, you could remove the exit() call from the signal handler function, and the script should start executing from wherever it left off. However, this feature is not working on several platforms. If you want to test your platform, run the following small program:

sub INT_handler {
    print("Don't Interrupt!\n");
}

$SIG{'INT'} = 'INT_handler';

for ($x = 0; $x < 10; $x++) {
    print("$x\n");
    sleep 1;
} 
