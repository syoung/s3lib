#!/usr/bin/perl -w
use strict;

####
my $DEBUG = 1;

=head2

    APPLICATION     test-Monitor-PBS
    
    PURPOSE
    
        TEST Monitor::PBS

    EXAMPLE
    
perl test-Monitor-PBS.pl checkJob 
        
=cut

#### EXTERNAL MODULES
use FindBin qw($Bin);
use lib "$Bin/../../lib";

use Monitor::PBS;
use Data::Dumper;

my $mode = $ARGV[0];
my $argumentsJSON = $ARGV[1];


#### GET CONF
my $configfile = "default.conf";
if ( $^O =~ /^MSWin32$/ )
{
    $configfile = "default-win32.conf";
}
my $conf = Conf::Agua->new(inputfile=>"$Bin/../../conf/$configfile", 0);
print "workflow.pl    Conf:\n" if $DEBUG;
print Dumper $conf if $DEBUG;

#### GET BIN DIRECTORY
my $qsub        = $conf->getKeyValue("cluster", 'QSUB');
my $qstat       = $conf->getKeyValue("cluster", 'QSTAT');
my $checkjob    = $conf->getKeyValue("agua", 'CHECKJOB');
my $sleep       =	$conf->getKeyValue("cluster", 'SLEEP');









print "Completed $0\n";

