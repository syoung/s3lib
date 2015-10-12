#!/usr/bin/perl -w

use strict;

#### TEST PBS MODULE ON KRONOS
#### INSTALLED FIRST IN PIPELINE/PERLMODS
#### THEN COPIED TO /nethome/syoung/base/apps/agua/0.4/lib/external
=head2

REPLACED 

    LIBS              => ['-L/usr/local/lib -lpbs'], # e.g., '-lm'
    
WITH

    LIBS              => ['-L/usr/local/lib -lpbs'], # e.g., '-llibtorque'   

TO MATCH

[syoung@u01 PBS-0.03]$ ll /usr/local/lib
total 2.3M
drwxr-xr-x  2 root root 4.0K Sep 25 15:43 .
drwxr-xr-x 14 root root 4.0K Sep 25 15:46 ..
-rw-r--r--  1 root root 1.6M Feb 20  2008 libtorque.a
-rwxr-xr-x  1 root root  804 Feb 20  2008 libtorque.la
lrwxrwxrwx  1 root root   18 Sep 25 15:43 libtorque.so -> libtorque.so.2.0.0
lrwxrwxrwx  1 root root   18 Sep 25 15:43 libtorque.so.2 -> libtorque.so.2.0.0
-rwxr-xr-x  1 root root 663K Feb 20  2008 libtorque.so.2.0.0





        COULD NOT INSTALL BECAUSE COULD NOT FIND LOCATION OF PBS libs/headers



=cut

use FindBin qw($Bin);
use lib "$Bin/../lib";

use PBS;
use PBS::Status;
use PBS::Attr();

my $pbs = PBS->new();
$pbs->connect() || die $pbs->error(), "\n";

my $stat = $pbs->stat_queue("queue_name");
        or
my $stat = $pbs->stat_node("node_name");
        or
my $stat = $pbs->stat_job("job_id");
     
foreach my $s (@$stat) {
    print $s->{'name'}, " ", $s->{'text'}, "\n";
    my $attrs = $s->{'attributes'};
    my $attr_list = $attrs->get();
    foreach my $a (@$attr_list) {
        print $a->{'name'}, "=", $a->{'value'}, "\n";
    }
}    
    
$pbs->disconnect();