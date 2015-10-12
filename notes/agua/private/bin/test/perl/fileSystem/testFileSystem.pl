#!/usr/bin/perl -w

use strict;

use JSON;

my $jsonparser = JSON->new();

my $json = qq{{"name":"run3",
"path":"run3",
"total":"2",
"items":   [{
        "name":"run3-s_1_sequence.10000.txt",
        "path":"/data/sequence/demo/runs/run3/run3-s_1_sequence.10000.txt",
        "parentPath":"/data/sequence/demo/runs/run3",
        "parentDir":"/data/sequence/demo/runs/run3",
        "directory":"false",
        "modified":1358547292,
        "sample":"\@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;\@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
        "size":"13957202",
        "bytes":"200"
    }]

}};
$json =~ s/\\/\\\\/g;

my $object = $jsonparser->decode($json);		
print "object: $object\n";
use Data::Dumper;
print Dumper $object;

# "sample":"@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\X\XZ\&#93;&#93;X\\_\\W_\\\\Y\&#91;X`\XYTRQ&#91;\&#93;`Y^&nbsp;@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",

#### OK
#         "sample":"\@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\\\\X\\\\XZ\\\\&#93;&#93;X\\\\\\\\_\\\\\\\\W_\\\\\\\\\\\\\\\\Y\\\\&#91;X`\\\\XYTRQ&#91;\\\\&#93;`Y^&nbsp;\@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",


#        "sample":"\@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\\X\\XZ\\&#93;&#93;X\\\\_\\\\W_\\\\\\\\Y\\&#91;X`\\XYTRQ&#91;\\&#93;`Y^&nbsp;\@HWI-EAS185:1:17:18:533#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",


#### OK
#         "sample":"\@HWI-EAS185:1:17:17:481#0/1&nbsp;NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;+HWI-EAS185:1:17:17:481#0/1&nbsp;DW&#93;\\\\X",


my $contents = qq{Script started on Wed 13 Apr 2011 04:59:47 PM EDT
]0;root\@hp: /nethome/syoung/agua/Project1/Workflow1/chr22root\@hp:/nethome/syoung/agua/Project1/Workflow1/chr22# exitchown -R syoung:syoung *exit[Ksc[K[K[K[K[K[Kcd scripts/
]0;root\@hp: /nethome/syoung/agua/Project1/Workflow1/chr22/scriptsroot\@hp:/nethome/syoung/agua/Project1/Workflow1/chr22/scripts# ll
total 116};

