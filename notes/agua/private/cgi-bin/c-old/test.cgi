#!/usr/bin/perl -w

print "Content-type: text/html\n\n";

print "<html><head><title>test.cgi</title></head>\n";
print "<body>\n";
print "<PRE>\n";

$ENV{'SGE_QMASTER_PORT'} = 701;
$ENV{'SGE_EXECD_PORT'} = 702;

print "SGE_QMASTER_PORT:\n";
print `echo \$SGE_QMASTER_PORT`;

print "SGE_EXECD_PORT:\n";
print `echo \$SGE_EXECD_PORT`;

foreach my $var (sort(keys(%ENV))) {
    $val = $ENV{$var};
    $val =~ s|\n|\\n|g;
    $val =~ s|"|\\"|g;
    print "${var}=\"${val}\"\n";
}
#print `printenv`;

print "</body>\n";
print "</html>\n";
exit;
