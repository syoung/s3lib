use FindBin qw($Bin);
use Scalar::Util qw(weaken);
use lib "$Bin/external";
use lib "$Bin";
BEGIN {
    unshift @INC, "/$Bin/external/base/pipeline/moose/tmp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
    unshift @INC, "/$Bin/external/0.5/lib/external/perl5-32/site_perl/5.8.8";
    unshift @INC, "/$Bin/external/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
    unshift @INC, "/$Bin/external/0.5/lib/external/perl5-32/5.8.8";    
}

#### STARTING REDIRECT STDERR TO AVOID THIS WARNING:
#### Not inlining a constructor for TestCluster since it defines its own constructor.
#### If you are certain you don't need to inline your constructor, specify
#### inline_constructor => 0 in your call to TestCluster->meta->make_immutable
#### Not inlining a destructor for TestCluster since it defines its own destructor.
#my $olderr;
#open $olderr, ">&STDERR";	
#open(STDERR, ">/dev/null") or die "Can't redirect STDERR to /dev/null\n";

use MooseX::Declare;
use Moose::Util::TypeConstraints;
use Cluster::Jobs;
use Cluster::Checker;
use Moose::Role;

class TestCluster with (Cluster::Jobs, Cluster::Checker, Cluster::Usage) {
    
    use FindBin qw($Bin);

has 'queryfile'	    => ( isa => 'Str|Undef', is => 'rw', default => '' );
has 'targetfile'	=> ( isa => 'Str|Undef', is => 'rw', default => '' );
has 'querylabel'	=> ( isa => 'Str|Undef', is => 'rw', default => '' );
has 'targetlabel'	=> ( isa => 'Str|Undef', is => 'rw', default => '' );
has 'queryindex'	=> ( isa => 'Str|Undef', is => 'rw', default => '' );
has 'targetindex'	=> ( isa => 'Str|Undef', is => 'rw', default => '' );
has 'outputdir'	    => ( isa => 'Str|Undef', is => 'rw', default => '' );
has 'maxjobs'	    => ( isa => 'Str|Undef', is => 'rw', default => '2000' );

    method BUILD ($) { 
        #print "TestCluster::BUILD    TestCluster::BUILD()\n";    
        #use Data::Dumper;
        #print Dumper $self;
    }

    method sleepJob () {

use Data::Dumper;
print "TestCluster::sleepJob    self:\n";
print Dumper $self;

        print "TestCluster::sleepJob    self->maxjobs(): ", $self->maxjobs(), "\n";
        my $sleep = 3;
        my $outdir = "$Bin/sleep";
        my $checkfile = "$outdir/sleep.out";
        my $command = qq{sleep $sleep; rm -fr $checkfile; date > $checkfile};
        my $label = "Sleep";
        my $job = $self->setJob( [$command], $label, $outdir );
        $job->{checkfile} = $checkfile;
        $self->runJobs([$job], "sleepJob");    
    }
}

#### ENDING REDIRECT STDERR TO AVOID THIS WARNING:
#### Not inlining a constructor for TestCluster since it defines its own constructor.
#### If you are certain you don't need to inline your constructor, specify
#### inline_constructor => 0 in your call to TestCluster->meta->make_immutable
#### Not inlining a destructor for TestCluster since it defines its own destructor.
#open STDERR, ">&", $olderr;

print "TestCluster    Loaded\n";


no Moose;
