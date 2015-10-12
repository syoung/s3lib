#!/usr/bin/perl -w

use strict;

use FindBin qw($Bin);
print "Bin: $Bin\n";
use lib "$Bin/../lib";

use FindPath;
print "OK\n";