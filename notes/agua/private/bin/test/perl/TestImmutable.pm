use FindBin qw($Bin);
use Scalar::Util qw(weaken);

use lib "$Bin/external";
use lib "$Bin";
BEGIN {
    unshift @INC, "/nethome/syoung/base/pipeline/moose/tmp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";    
}



package TestImmutable;


use Moose;


__PACKAGE__->meta->make_immutable( inline_constructor => 0 );
no Moose;

1;