#!/usr/bin/perl -w

use strict;

my $command = 'perl C:\\DATA\\base\\html\\agua\\bin\\apps\\splitace.pl --o C:\\DATA\\base\\html\\agua\\home\\syoung\\.agua\\Project1\\Workflow1 -i C:\\DATA\\base\\html\\agua\\home\\syoung\\.agua\\Project1\\Workflow1\\454Contigs-short.ace';

my @command = (
    'C:\\\\DATA\\\\base\\\\html\\\\agua\\\\bin\\\\apps\\\\splitace.pl',
    '--outputdir C:\\\\DATA\\\\base\\\\html\\\\agua\\\\home\\\\syoung\\\\.agua\\\\Project1\\\\Workflow1',
    '--inputfile C:\\\\DATA\\\\base\\\\html\\\\agua\\\\home\\\\syoung\\\\.agua\\\\Project1\\\\Workflow1\\\\454Contigs-short.ace'
);

my $executor = "wperl";
print "Doing system call: $executor @command\n";
my $result = system($executor, @command);
print "result: $result\n";
print "Completed $0\n";

