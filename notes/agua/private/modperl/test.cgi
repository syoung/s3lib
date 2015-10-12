#!/usr/bin/perl -w

use strict;

print "Content-type: text/html\n\n";

print "MOD_PERL WORKS!\n";

print "MOD_PERL WORKS!\n";

print "MOD_PERL WORKS!\n";

print "$ENV{'MOD_PERL'}:" , $ENV{"MOD_PERL"} , "\n";


use lib "/agua/lib";
use Agua::Workflow;