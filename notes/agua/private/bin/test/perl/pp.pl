#!/usr/bin/perl -w
use strict;

my $inputdir = $ARGV[0];
print "inputdir: $inputdir\n";
#opendir(DIR, $inputdir) or die "Can't open inputdir: $inputdir\n";
#my @files = grep { -f "$inputdir/$_" } readdir(DIR\n";
#closedir(DIR) or die "Can't close inputdir: $inputdir\n";
chdir($inputdir) or die "Can't chdir inputdir: $inputdir\n";
my @files = <*>;
print "files: @files\n";

