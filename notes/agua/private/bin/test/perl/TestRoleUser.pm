use MooseX::Declare;

class TestRoleUser with TestRole {

use Data::Dumper;

method test2 ($string) {
    print "TestRoleUser::test2    string: $string\n";
}

	
}
