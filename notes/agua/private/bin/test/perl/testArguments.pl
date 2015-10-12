#!/usr/bin/perl -w

$| = 1;

use Test::More qw(no_plan);
use Data::Dumper;

use FindBin qw($Bin);
use lib "/agua/0.6/lib";
use lib "/agua/0.6/t/lib";

use MooseX::Declare;

class Test with Agua::Common::Logger {
    
sub test {
    print "length \@_: ", $#_, "\n";
    my ($one, $two) = @_;
    print "one: $one\n";
    print "two: $two\n" if defined $two;
    
}

}

my $object = new Test(
    logfile     =>  "./testarguments.log",
    SHOWLOG     =>  2,
    PRINTLOG    =>  5
);


my $var = { test =>     1};
my $undef = undef;
ok($object->logDebug("one arg") =~ /one arg$/, "one arg");
ok($object->logDebug("two args, defined", $var) =~ /two\s+args,\s+defined:\s+{\s+'test'\s+=>\s+1\s+}\s*$/ms, "two args");
ok($object->logDebug("two args, undefined", $undef) =~ /two args, undefined: undef$/, "two args, undef");

ok(! $object->logObject(undef), "logObject    undef");
ok(! $object->logObject(), "logObject    missing");
ok(! $object->logObject(''), "logObject    empty string");
ok(! $object->logObject(''), "logObject    one argument");


#my $result = $object->logObject('');
#print "result:\n";
#print Dumper  $result;