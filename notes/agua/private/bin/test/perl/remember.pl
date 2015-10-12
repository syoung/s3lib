#!/usr/bin/perl -w

use strict;
use Remember;

my $fred;

my $x = tie $fred, "Remember", "camel.log";
$fred = 1;
$fred = 4;
comment $x "changing...";
$fred = 5;

#### AVOID THIS ERROR:
#### 'untie attempted while 1 inner references still exist'
undef $x;
untie $fred;
system "cat camel.log";
