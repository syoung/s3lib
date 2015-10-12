#!/usr/bin/perl -w

# paty soleil 1 : Enjoying Life
# If you can't explain it simply, you don't understand it well enough. Albert Einstein

my $text = "Ajsj;bjc;oSbvd;sudbv;isbdv;osjdbv'ozjsnvo;/sdinv ;obnd vo;sbndbv o;snd oivzknd;so bvnzsidv b;uzsidvub;o'widnc;osidnvi;osidnv oisdknv s;zodvn ;zsjdv ;zsidv ;osdnv ;izsnd vlisunviwdv u;wdv n;sidn v;isdv ;sid vivd";

#for ( 0 .. 26 ) {
#    my $alphabet = "abcdefghijklmnopqrstuvwxyz";
#    my $shift = substr($alphabet, $_, 26 - $_);
#    $text =~ tr/abcdefghijklmnopqrstuvwxyz/$shift/;
#}

$text =~ tr/dfghjkl;'as/asdfghjkl;'/;
$text =~ tr/xcvbnm,\.\/z/zxcvbnm,.\//;
print "text:\n\n";
print "$text\n";