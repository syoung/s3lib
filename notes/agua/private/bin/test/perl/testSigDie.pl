#!/usr/bin/perl -w

sub DIE_handler {
    print("Don't Interrupt!\n");
}

print "Setting SIG{'Warn'} to DIE_handler\n";
$SIG{'DIE'} = 'DIE_handler';

for ($x = 0; $x < 10; $x++) {
    print("$x\n");
    warn "warning $x";
    sleep 1;
} 
