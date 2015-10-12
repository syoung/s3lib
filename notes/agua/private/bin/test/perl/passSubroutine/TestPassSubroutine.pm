use MooseX::Declare;
use Method::Signatures::Simple;

class TestPassSubroutine {

use FindBin qw($Bin);
use Data::Dumper;

####////}}}}

method BUILD ($hash) {
	print "BUILD\n";
	
}

#### SYNC WORKFLOWS
method passedSub ($input) {
	print "receivingSub    input: $input\n";

	return $input . "PASSED";
}

method receivingSub ($input, $subroutine) {
	print "receivingSub    input: $input\n";
	print "receivingSub    subroutine:\n";
	print Dumper $subroutine;

	return $self->$subroutine($input);
}

method testSub ($input) {
	print "testSub    input: $input\n";

	my $sub = \&passedSub;
	return $self->receivingSub($input, $sub);
}



}