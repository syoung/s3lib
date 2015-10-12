#!/usr/bin/perl -w

use strict;

use threads qw(yield);
#use Thread;

#### FLUSH
$| = 1;



my $threads = [];

for (my $i = 0; $i < 5; $i++ )
{
    #my $thread = new Thread \&sub1;
    my $thread = threads->new(
        sub {
            sleep($i);
            #return "Printing in thread $i";
            return "Thread $i";
        }
    );
    push @$threads, $thread;
}


my $counter = 1;
foreach my $thread ( @$threads )
{
    my $message = $thread->join;
    print $message;
    print "\n";
}

print "Completed $0\n";

#### runs okay
#my $Param3 = "foo";
#my @ParamList = (1,2,3);
#my $thr1 = threads->new(\&sub1, "Param 1", "Param 2", $Param3);
#my $thr2 = threads->new(\&sub1, @ParamList);
#my $thr3 = threads->new(\&sub1, qw(Param1 Param2 Param3));
#
#sub sub1 {
#   my @InboundParameters = @_;
#   print "In the thread\n";
#   print "got parameters >", join("<>", @InboundParameters), "<\n";
#}
#yield();
#
##$thr1->join; ## Wait for thread 1 to finish
##$thr2->join; ## Wait for thread 2 to finish
##$thr3->join; ## Wait for thread 3 to finish
#
#print "completed $0\n";
#

__END__
C:\test>junk2
In the thread
got parameters >Param 1<>Param 2<>foo<
In the thread
got parameters ><
In the thread
got parameters >Param1<>Param2<>Param3<

## Create 5 threads:
#threads->create(sub { print "Hello from # $_[0]\n" }, $_ )
#  for 1...5;
#
## Then when you want to just let your threads work:
#$_->join foreach threads->list;
#
## Now the threads are done:
#print "threads are all done!";


#
#for (my $i = 0; $i < 5; $i++ )
#{
#    #my $thread = new Thread \&sub1;
#    my $thread = threads->new(
#        sub {
#            sleep($i);
#            return "Thread $i";
#        }
#    );
#    push @$threads, $thread;
#}
#
#my $counter = 1;
#foreach my $thread ( @$threads )
#{
#    my $message = $thread->join;
#    print $message;
#    print "\n";
#}
#print "Completed $0\n";
#
#
#
#sub sub1 {
#    my $number  =   shift;
#    
#    sleep($number);
#    return "Thread $number";
#}    
#
#

