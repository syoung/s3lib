app.jbrowse.2.xsl


<entry [Thu May 27 21:30:54 EDT 2010] COMPLETED JBrowse.pm TO GENERATE JBrowse FEATURES ON CLUSTER>

PURPOSE:

    1. RUN FEATURE GENERATION FOR ALL CHROMOSOMES IN PARALLEL
    
        (WITHOUT USING A BATCH FILE AS IN batchCluster.pl)
        
        (I.E., OBJECTIFY batchCluster.pl AND run-flatfile-to-json.pl)

    2. RUN flatfile-to-json.pl
    
    3. USE GFF OR BAM INPUT FILES
    

RUN ON PEGASUS:

chmod 755 /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl

cd /scratch/syoung/base/pipeline/jbrowse/agua/0.5/maq1

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/refSeqs.js \
--outputdir /scratch/syoung/base/pipeline/jbrowse/agua/0.5/maq1 \
--inputdir /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1 \
--filetype bam \
--filename "out.bam" \
--label maq1 \
--key maq1 \
--queue large \
--cluster LSF


WHICH RUNS THIS:

cd /scratch/syoung/base/pipeline/jbrowse/agua/0.5/maq1

TEST WITH CHROMOSOME 1 .bam FILE
--------------------------------


#cd /scratch/syoung/base/pipeline/jbrowse/agua/0.5/maq1
#
/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl \
--bam /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.bam \
--tracklabel maq1 \
--key maq1


GENERATE 100-LINE FILE:

1. SHORTEN SAM FILE AND PLACE IN t/Cluster

chopfile /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.sam /nethome/bioinfo/apps/agua/0.5/bin/apps/t/Cluster/maq/chr1/out.sam 100
    
    SRR003963.3509635       35      chr1    12      0       36M     *       0       42      CTAACCCTAACCCTAACCCTAACCCTAACCCTAACC    FC3003UAAXX_R1:5:39:1320:1041IIIIIII    MF:i:18 AM:i:0  SM:i:0  NM:i:0  UQ:i:0  H0:i:23 H1:i:2
    SRR003963.3509635       19      chr1    18      0       36M     *       0       -42     CTAAACATAACCCTAACCCTAACCCTAACCCTAACC    IIIIIII1401:0231:93:5:1R_XXAAU3003CF    MF:i:18 AM:i:0  SM:i:0  NM:i:2  UQ:i:60 H0:i:20 H1:i:0

2. CONVERT SAM TO BAM

/nethome/bioinfo/apps/samtools/0.1.6/samtools view \
-bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr1.fai -o \
/nethome/bioinfo/apps/agua/0.5/bin/apps/t/Cluster/maq/chr1/out.bam \
/nethome/bioinfo/apps/agua/0.5/bin/apps/t/Cluster/maq/chr1/out.sam

3. SORT AND INDEX BAM

cd /nethome/bioinfo/apps/agua/0.5/bin/apps/t/Cluster/maq/chr1
/nethome/bioinfo/apps/samtools/0.1.6/samtools sort out.bam out
/nethome/bioinfo/apps/samtools/0.1.6/samtools index out.bam


4. GENERATE FEATURES

cd /scratch/syoung/base/pipeline/jbrowse/agua/0.5/maq1

/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl \
--bam /nethome/bioinfo/apps/agua/0.5/bin/apps/t/Cluster/maq/chr1/out.bam \
--tracklabel maq1 \
--key maq1

    flatfile-to-json.pl    Looking for refSeqs in data/refSeqs.js
    DOING db = Bio::DB::Sam->new('-bam' => /nethome/bioinfo/apps/agua/0.5/bin/apps/t/Cluster/maq/chr1/out.bam)
    
    working on seq chr1
    Bio::DB::Sam::fetch(region, callback)
    fetch    region:
    $VAR1 = 'chr1:0';
    Bio::DB::Sam::_fetch(region, callback)
    _fetch    region:
    $VAR1 = 'chr1:0';
    _fetch    seqid: 0
    _fetch    start: 0
    _fetch    end: 536870912
    _fetch    index: Bio::DB::Bam::Index=SCALAR(0x698fb80)
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    
    ... <total 300 lines>
    
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start    self->unmapped
    $VAR1 = bless( do{\(my $o = 110711520)}, 'Bio::DB::Bam::Alignment' );
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    Bam::Alignment::start
    chr1    100 features
    JsonGenerator::generateTrack(outDir, subfeatureLimit, featureLimit, refStart, refEnd)
    JsonGenerator::generateTrack    outDir: data/tracks/chr1/maq1/
    JsonGenerator::generateTrack    subfeatureLimit: 1000
    JsonGenerator::generateTrack    featureLimit: 1000
    JsonGenerator::generateTrack    refStart: 0
    JsonGenerator::generateTrack    refEnd: 247249719
    Use of uninitialized value in division (/) at /nethome/syoung/base/apps/jbrowse/100511/bin/../lib/JsonGenerator.pm line 384.
    Use of uninitialized value in numeric lt (<) at /nethome/syoung/base/apps/jbrowse/100511/bin/../lib/NCList.pm line 55.



OFFENDING LINE 91:


SRR003962.5938993       21      chr1    23527   0       *       *       0       0       GAGACATTTTAGCAAATACATAGTGAATTTGATGAA    27F:?:II6541:373:56:4:1R_XXAAU3003CF    MF:i:192


DOES NOT HAVE AM, SM, NM, etc. VALUES LIKE THE SUBSEQUENT LINE:

SRR003963.5276884       35      chr1    23615   0       36M     *       0       230     CACCTATGAGTGAGAATATGCAGTGTTTGGTTTTCT    FC3003UAAXX_R1:5:58:1661:391IIIII>II    MF:i:18 AM:i:0  SM:i:0  NM:i:0  UQ:i:0  H0:i:68 H1:i:85




DIAGNOSIS:

THE NON-MATCHING READS IN THE SAM FILE MESS UP flatfile-to-json.pl'S PROCESSING VIA JsonGenerator.pm



SOLUTION 1: CLEAN SAM FILE FOR NON-MATCHED AND RECREATED BAM FILE


LINUX TERMINAL COMMANDS:

    grep -n "0      \*      \*"  /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.sam > /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.sam.nomatch
    mv /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.sam.nomatch /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.nomatch.sam
    grep -v "0      \*      \*"  /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.sam > /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.match.sam
    grep -n "0      \*      \*"  /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.match.sam


ll /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.nomatch.sam
    -rw-rw-r-- 1 syoung root 136M Jun  4 00:51 /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.nomatch.sam

ll /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.match.sam
    -rw-rw-r-- 1 syoung root 367M Jun  4 00:51 /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.match.sam

ll /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.sam
    -rw-rw-rw- 1 syoung root 495M May 12 08:57 /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr1/out.sam


CREATED SUBROUTINE threshSam IN Cluster.pm THAT SEPARATES FROM out.sam INTO out.sam AND unmatched.sam

    -   USE THIS AFTER RUNNING maqToSam (WHICH AUTOMATICALLY INCLUDES THE NON-MATCHED READS)
    
    -   OTHER ANALYSES FOR UNMATCHED READS:
    
        - CHECK FOR SIMILARITY BETWEEN READS WITH Velvet OR OTHER AB INITIO ALIGNER

        - IDENTIFY COMMON MOTIFS WITH MEME/MAST




SOLUTION 2: IGNORE READS THAT DO NOT MATCH


ADAPTED JsonGenerator.pm AND NCList.pm TO IGNORE READS WITH NO start OR end


    OK!
    
    
    


RUNNING BUT GET ERROR REPEATED MANY TIMES:


Use of uninitialized value in subtraction (-) at /nethome/syoung/base/apps/jbrowse/100511/bin/../lib/JsonGenerator.pm line 25.


    'bai' => bless( do{\(my $o = 406942880)}, 'Bio::DB::Bam::Index' )
 

OCCURS IN USE OF featMap, WHEN THE start AND end VALUES FOR A Bio::DB::Bam::AlignWrapper OBJECT ARE EMPTY

WHICH IS DUE TO THE READ REGISTERING IN Bam::Alignment AS NOT BEING MAPPED

LINE 369:

    =item $is_unmapped = $align->unmapped                                                              Return true if the read failed to align.


AND THUS RETURNING NULL IN LINES 467 AND 478:
    
    sub start {
        my $self = shift;
    
        print "Bam::Alignment::start    self->unmapped\n" if $self->unmapped;
        use Data::Dumper;
        print Dumper $self if $self->unmapped;
    
        return if $self->unmapped;
        return $self->pos+1;
    }
    
    sub end {
        my $self = shift;
        return if $self->unmapped;
        return $self->calend;
    }


LOOKING FOR FILE CONTAINING Bam::Index IN auto:


/nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam/Bam.so



FOUND REFERENCE TO IT AND OTHER LOW LEVEL API METHODS IN Bam.so FILE:


Bio::DB::Sam::Index AND OTHER METHODS ARE FOUND IN THE Sam.xs FILE:

    E:\base\apps\samtools\biosamtools\1.19\Bio-SamTools-1.19\Bio-SamTools-1.19\lib\Bio\DB\Sam.xs


THE DECLARATION FOR Bio::DB::Bam::Index IS ON LINE 297:

    Bio::DB::Bam::Index
    bam_index_open(packname="Bio::DB::Bam", filename)
          char * packname
          char * filename
        PROTOTYPE: $$
        CODE:
        RETVAL = bam_index_load(filename);
        OUTPUT:
        RETVAL

NOTE THIS CALLS bam_index_load WHICH IS FOUND IN bam.h LINE 553:


WHICH IS INCLUDED ON LINE 20 OF Sam.xs:

    #include "bam.h"


THE LOW LEVEL API METHODS ARE DESCRIBED IN Sam.pm LINE 195:

=head2 The low-level API

    The low-level API closely mirrors that of the libbam library. It
    provides the ability to open TAM and BAM files, read and write to
    them, build indexes, and perform searches across them. There is less
    overhead to using the API because there is very little Perl memory
    management, but the functions are less convenient to use. Some
    operations, such as writing BAM files, are only available through the
    low-level API.

    The classes you will be interacting with in the low-level API are as follows:
    
     * Bio::DB::Tam            -- Methods that read and write TAM (text SAM) files.
     * Bio::DB::Bam            -- Methods that read and write BAM (binary SAM) files.
     * Bio::DB::Bam::Header    -- Methods for manipulating the BAM file header.
     * Bio::DB::Bam::Index     -- Methods for retrieving data from indexed BAM files.
     * Bio::DB::Bam::Alignment -- Methods for manipulating alignment data.
     * Bio::DB::Bam::Pileup    -- Methods for manipulating the pileup data structure.
     * Bio::DB::Sam::Fai       -- Methods for creating and reading from indexed Fasta files
 




TEST WITH GFF
-------------

/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr2/hapmap-snp-chr2.gff --tracklabel Hapmap_SNP --key Hapmap SNP

    OK! LOOKS LIKE ITS LOADING OKAY
    
    
TEST WITH GOOD .bam FILE
------------------------


cd /scratch/syoung/base/pipeline/jbrowse/agua/0.5/maq1

/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --bam /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1/chr22/out.bam --tracklabel maq1 --key maq1



TEST WITH SHORT .bam FILE
-------------------------

cd /scratch/syoung/base/pipeline/jbrowse/agua/0.5/maq1

/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl \
--bam /nethome/bioinfo/apps/agua/0.5/bin/apps/t/Cluster/maq/chrY/out.bam \
--tracklabel maq1 \
--key maq1

    OK!



DEBUGGING
---------


emacs /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm 






REMOTE BAM FILE
---------------

emacs /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm

    B<Remote access> to BAM files located on an HTTP or FTP server is                                  possible when using the Samtools library version 0.1.6 or                                          higher. Simply replace the path to the BAM file with the appropriate                               URL. Note that incorrect URLs may lead to a core dump





ANOTHER USE OF fetch IN Sam.pm
------------------------------

LINE 79


my $callback = sub {                                                                               
     my $alignment = shift;                                                                         
     my $start       = $alignment->start;                                                           
     my $end         = $alignment->end;                                                             
     my $seqid       = $target_names->[$alignment->tid];                                            
     print $alignment->qname," aligns to $seqid:$start..$end\n";                                    
 }    
 my $header = $index->header;                                                                       
 $index->fetch($bam,$header->parse_region('seq2'),$callback);
 
 
... WHERE Bio::DB::Sam's FETCH SUBROUTINE IS:


Sam.pm LINE 1226:

item ($tid,$start,$end) = $header->parse_region("seq_id:start-end")

Given a string in the format "seqid:start-end" (using a human-readable
seq_id and 1-based start and end coordinates), parse the string and
return the target ID and start and end positions in 0-based
coordinates. If the range is omitted, then the start and end
coordinates of the entire sequence is returned. If only the end
position is omitted, then the end of the sequence is assumed.



sub fetch {

    my $self     = shift;
    my $region   = shift;
    my $callback = shift;

    my $code     = sub {

        my ($align,$self) = @_;

        $callback->(Bio::DB::Bam::AlignWrapper->new($align,$self));
    };

    $self->_fetch($region,$code);
}



sub _fetch {

    my $self     = shift;
    my $region   = shift;
    my $callback = shift;

    my $header              = $self->{bam}->header;
    $region                 =~ s/\.\.|,/-/;

    my ($seqid,$start,$end) = $header->parse_region($region);

    return unless defined $seqid;
    my $index  = $self->bam_index;
    
    $index->fetch($self->{bam},$seqid,$start,$end,$callback,$self);
}


  




ERROR:


flatfile-to-json.pl    Looking for refSeqs in data/refSeqs.js

run prepare-refseqs.pl first to supply information about your reference sequences at /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl line 89.

SOLUTION:

MOVE TO OUTPUT DIR CONTAINING data DIR



PREPARATION
-----------

1. ADD 'use lib' OF PATH TO Bio-SamTools TO PROVIDE Bio::DB::Bam (I.E., NOT IN BioPerl)

emacs /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl


use lib "$Bin/../lib";
use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8";
use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/li\
b/perl5/site_perl/5.8.8";

    #use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib";
    use lib "/nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";



2. ADD 'use lib' OF PATH TO Bio/SeqFeature/Lite.pm TO Bio/DB/Sam.pm


emacs /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/Bio/DB/Sam.pm

use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8";


TO AVOID THIS ERROR:



 perl -e 'use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib"; use Bio::DB::Sam;'
Can't locate Bio/SeqFeature/Lite.pm in @INC (@INC contains: /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.8 /usr/lib64/perl5/site_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.5 /usr/lib/perl5/site_perl /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.8 /usr/lib64/perl5/vendor_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.5 /usr/lib/perl5/vendor_perl /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/5.8.8 .) at /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/Bio/DB/Sam.pm line 1200.
BEGIN failed--compilation aborted at /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/Bio/DB/Sam.pm line 1200.
Compilation failed in require at -e line 1.



3. COMPILE Bio-SamTools TO CREATE LOADABLE OBJECT

TO AVOID THIS ERROR:

perl -e 'use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib"; use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use Bio::SeqFeature::Lite; use Bio::DB::Sam;'


Can't locate loadable object for module Bio::DB::Sam in @INC (@INC contains: /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8 /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.8 /usr/lib64/perl5/site_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.5 /usr/lib/perl5/site_perl /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.8 /usr/lib64/perl5/vendor_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.5 /usr/lib/perl5/vendor_perl /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/5.8.8 .) at -e line 1
Compilation failed in require at -e line 1.




cd /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19
ls

    drwxrwxr-x 5 syoung bioinfo 2.0K May 17 10:19 .
    drwxr-xr-x 3 syoung bioinfo 2.0K May 28 02:39 ..
    drwxrwxr-x 2 syoung bioinfo 2.0K May 17 10:19 bin
    -r--r--r-- 1 syoung bioinfo 3.1K May 17 10:19 Build.PL
    -r--r--r-- 1 syoung bioinfo 4.6K May 17 10:19 Changes
    -r--r--r-- 1 syoung bioinfo 1.2K May 17 10:19 DISCLAIMER
    drwxrwxr-x 3 syoung bioinfo 2.0K May 17 10:19 lib
    -r--r--r-- 1 syoung bioinfo  24K May 17 10:19 LICENSE
    -r--r--r-- 1 syoung bioinfo  527 May 17 10:19 MANIFEST
    -r--r--r-- 1 syoung bioinfo 1.5K May 17 10:19 META.yml
    -r--r--r-- 1 syoung bioinfo 2.0K May 17 10:19 README
    drwxrwxr-x 3 syoung bioinfo 2.0K May 17 10:19 t
    -r--r--r-- 1 syoung bioinfo  224 May 17 10:19 typemap

NB: ADD THIS TO Build.PL SO THAT IT FINDS Module::Build

emacs Build.PL

    use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/perl5/site_perl/5.8.8";




cd /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19
perl Build.PL --prefix /nethome/syoung/base/apps/samtools/biosamtools/1.19 --cflags=-fPIC


/nethome/syoung/base/apps/samtools/0.1.6

    This module requires samtools 0.1.4 or higher (samtools.sourceforge.net).
    Please enter the location of the bam.h and compiled libbam.a files: /nethome/syoung/base/apps/samtools/0.1.6
        
    Found /nethome/syoung/base/apps/samtools/0.1.6/bam.h and /nethome/syoung/base/apps/samtools/0.1.6/libbam.a.
    Creating new 'MYMETA.yml' with configuration results
    Creating new 'Build' script for 'Bio-SamTools' version '1.19'

./Build

    Building Bio-SamTools
    gcc -shared -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic -o blib/arch/auto/Bio/DB/Sam/Sam.so lib/Bio/DB/Sam.o -L/nethome/syoung/base/apps/samtools/0.1.6 -lbam -lz


./Build test
    
    t/01sam....ok 1/104[fai_load] build FASTA index.                             
    t/01sam....ok                                                                
    All tests successful.
    Files=1, Tests=104,  1 wallclock secs ( 1.36 cusr +  0.15 csys =  1.51 CPU)

    OK!
    
./Build install

    Building Bio-SamTools
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam/Sam.bs
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam/Sam.so
    Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/Pileup.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/AlignWrapper.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/PileupWrapper.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/Alignment.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/Target.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/ReadIterator.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/FetchIterator.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/Query.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam/Constants.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam/Segment.pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Sam::Constants.3pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Bam::Target.3pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Bam::AlignWrapper.3pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Bam::Alignment.3pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Sam.3pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Bam::PileupWrapper.3pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Bam::Pileup.3pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Bam::Query.3pm
    Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/bin/bamToGBrowse.pl
    Writing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/SamTools/.packlist

    OK!
    



SOLUTION:

IN README FILE:

    If you encounter problems during compiling, you may need to edit
    Build.PL so that extra_compiler_flags matches the CFLAGS and DFLAGS
    settings in the Samtools Makefile.  Here are some common problems:
    
    1. When building this module, you get an error like the following:
    relocation R_X86_64_32 against `a local symbol' can not be used when
    making a shared object; recompile with -fPIC
    
    To fix this, edit the Makefile in the Samtools distribution by adding
    "-fPIC" to the CFLAGS line. It should look like this:
    
      CFLAGS=       -g -Wall -O2 -fPIC #-m64 #-arch ppc
    
    Then do "make clean; make" in the Samtools directory to recompile the
    library. After this you should be able to build this module without
    errors.
    
    2. When building this module, you get an error about a missing math
    library.
    
    To fix this, follow the recipe in (1) except add -m64 to CFLAGS so it
    looks like this:
    
      CFLAGS=       -g -Wall -O2 -fPIC #-m64 #-arch ppc
    



emacs /nethome/syoung/base/apps/samtools/0.1.6/Makefile

    CFLAGS=         -g -Wall -O2 -fPIC #-m64 #-arch ppc

cd /nethome/syoung/base/apps/samtools/0.1.6
make clean;
make

    OK!


THEN REDO Bio-SamTools INSTALLATION:

cd /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19
ETC.




INSTALLED LOCALLY ON /tmp/ ON ngsdev

cp -r /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19 /tmp
cd /tmp/Bio-SamTools-1.19

[root@ngsdev Bio-SamTools-1.19]# perl Build.PL
This module requires samtools 0.1.4 or higher (samtools.sourceforge.net).
Please enter the location of the bam.h and compiled libbam.a files: /nethome/syoung/base/apps/samtools/0.1.6

That didn't seem to be right.
Try again, or hit <enter> to cancel: /nethome/syoung/base/apps/samtools/0.1.6

That didn't seem to be right.
Try again, or hit <enter> to cancel: /data/base/apps/samtools/0.1.6

Found /data/base/apps/samtools/0.1.6/bam.h and /data/base/apps/samtools/0.1.6/libbam.a.
Checking whether your kit is complete...
Looks good

Checking prerequisites...
Looks good

Deleting Build
Removed previous script 'Build'

Creating new 'Build' script for 'Bio-SamTools' version '1.19'
[root@ngsdev Bio-SamTools-1.19]# ./Build
gcc -shared -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic -o blib/arch/auto/Bio/DB/Sam/Sam.so lib/Bio/DB/Sam.o -L/data/base/apps/samtools/0.1.6 -lbam -lz
Copying bin/bamToGBrowse.pl -> blib/script/bamToGBrowse.pl
Deleting blib/script/bamToGBrowse.pl.bak
Manifying blib/lib/Bio/DB/Sam/Constants.pm -> blib/libdoc/Bio::DB::Sam::Constants.3pm
Manifying blib/lib/Bio/DB/Bam/Target.pm -> blib/libdoc/Bio::DB::Bam::Target.3pm
Manifying blib/lib/Bio/DB/Bam/AlignWrapper.pm -> blib/libdoc/Bio::DB::Bam::AlignWrapper.3pm
Manifying blib/lib/Bio/DB/Bam/Alignment.pm -> blib/libdoc/Bio::DB::Bam::Alignment.3pm
Manifying blib/lib/Bio/DB/Sam.pm -> blib/libdoc/Bio::DB::Sam.3pm
Manifying blib/lib/Bio/DB/Bam/Pileup.pm -> blib/libdoc/Bio::DB::Bam::Pileup.3pm
Manifying blib/lib/Bio/DB/Bam/PileupWrapper.pm -> blib/libdoc/Bio::DB::Bam::PileupWrapper.3pm
Manifying blib/lib/Bio/DB/Bam/Query.pm -> blib/libdoc/Bio::DB::Bam::Query.3pm
[root@ngsdev Bio-SamTools-1.19]# ./Build test
t/01sam.t .. 1/104 [fai_load] build FASTA index.
t/01sam.t .. ok       
All tests successful.
Files=1, Tests=104,  4 wallclock secs ( 0.05 usr  0.05 sys +  1.90 cusr  0.89 csys =  2.89 CPU)
Result: PASS
[root@ngsdev Bio-SamTools-1.19]# ./Build install
Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam/Sam.bs
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam/Sam.so
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam/Constants.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam/Segment.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/ReadIterator.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/PileupWrapper.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/Pileup.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/Alignment.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/AlignWrapper.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/FetchIterator.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/Target.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Bam/Query.pm
Installing /usr/share/man/man3/Bio::DB::Bam::Pileup.3pm
Installing /usr/share/man/man3/Bio::DB::Bam::PileupWrapper.3pm
Installing /usr/share/man/man3/Bio::DB::Bam::Target.3pm
Installing /usr/share/man/man3/Bio::DB::Bam::AlignWrapper.3pm
Installing /usr/share/man/man3/Bio::DB::Bam::Alignment.3pm
Installing /usr/share/man/man3/Bio::DB::Sam::Constants.3pm
Installing /usr/share/man/man3/Bio::DB::Sam.3pm
Installing /usr/share/man/man3/Bio::DB::Bam::Query.3pm
Installing /usr/bin/bamToGBrowse.pl
Writing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/SamTools/.packlist
[root@ngsdev Bio-SamTools-1.19]# 



WHICH ADDED THE Bio/DB/Sam/Sam.bs AND Bio/DB/Sam/Sam.so FILES THAT WERE MISSING IN THE ORIGINAL INSTALLATION ('S auto DIR) THAT GAVE THE 'Can't locate loadable object for module Bio::DB::Sam' ERROR MESSAGE


ll -R /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/Bio/DB
    Bio/DB:
    total 628K
    drwxr-xr-x 4 syoung bioinfo 2.0K May 28 02:50 .
    drwxr-xr-x 3 syoung bioinfo 2.0K May 28 02:26 ..
    drwxr-xr-x 2 syoung bioinfo 2.0K May 28 02:26 Bam
    drwxr-xr-x 2 syoung bioinfo 2.0K May 28 02:26 Sam
    -rw-r--r-- 1 syoung bioinfo  62K May 28 02:26 Sam.c
    -rw-r--r-- 1 syoung bioinfo 399K May 28 02:26 Sam.o
    -rw-r--r-- 1 syoung bioinfo  64K May 28 02:50 Sam.pm
    -rw-r--r-- 1 syoung bioinfo  64K May 28 02:26 Sam.pm~
    -r--r--r-- 1 syoung bioinfo  20K May 28 02:26 Sam.xs
    
    Bio/DB/Bam:
    total 60K
    drwxr-xr-x 2 syoung bioinfo 2.0K May 28 02:26 .
    drwxr-xr-x 4 syoung bioinfo 2.0K May 28 02:50 ..
    -r--r--r-- 1 syoung bioinfo  16K May 28 02:26 Alignment.pm
    -r--r--r-- 1 syoung bioinfo 6.7K May 28 02:26 AlignWrapper.pm
    -r--r--r-- 1 syoung bioinfo  335 May 28 02:26 FetchIterator.pm
    -r--r--r-- 1 syoung bioinfo 2.4K May 28 02:26 Pileup.pm
    -r--r--r-- 1 syoung bioinfo 2.0K May 28 02:26 PileupWrapper.pm
    -r--r--r-- 1 syoung bioinfo 4.4K May 28 02:26 Query.pm
    -r--r--r-- 1 syoung bioinfo  322 May 28 02:26 ReadIterator.pm
    -r--r--r-- 1 syoung bioinfo  267 May 28 02:26 Target.pm
    
    Bio/DB/Sam:
    total 16K
    drwxr-xr-x 2 syoung bioinfo 2.0K May 28 02:26 .
    drwxr-xr-x 4 syoung bioinfo 2.0K May 28 02:50 ..
    -r--r--r-- 1 syoung bioinfo 2.4K May 28 02:26 Constants.pm
    -r--r--r-- 1 syoung bioinfo 1.8K May 28 02:26 Segment.pm



THE blib STRUCTURE ON ngsdev IS AS FOLLOWS:

cd /tmp/Bio-SamTools-1.19

[root@ngsdev Bio-SamTools-1.19]# ls -R blib/lib/Bio/DB

    blib/lib/Bio/DB:
    Bam  Sam  Sam.pm
    
    blib/lib/Bio/DB/Bam:
    Alignment.pm     FetchIterator.pm  PileupWrapper.pm  ReadIterator.pm
    AlignWrapper.pm  Pileup.pm         Query.pm          Target.pm
    
    blib/lib/Bio/DB/Sam:
    Constants.pm  Segment.pm

[root@ngsdev Bio-SamTools-1.19]# ls -R blib/arch
    blib/arch:
    auto
    
    blib/arch/auto:
    Bio
    
    blib/arch/auto/Bio:
    DB
    
    blib/arch/auto/Bio/DB:
    Sam
    
    blib/arch/auto/Bio/DB/Sam:
    Sam.bs  Sam.so


COPY THE WHOLE FILESYSTEM OF Bio/DB FROM ngsdev TO pegasus

ON pegasus:

COPY FIRST TO A SAFE LOCATION:

mkdir -p /nethome/syoung/base/apps/samtools/1.19-ngsdev
cd /nethome/syoung/base/apps/samtools/1.19-ngsdev
scp -r syoung@ngsdev.ccs.miami.edu:/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio ./

    Constants.pm                                                     100% 2358     2.3KB/s   00:00
    Segment.pm                                                       100% 2284     2.2KB/s   00:00
    ReadIterator.pm                                                  100%  402     0.4KB/s   00:00
    PileupWrapper.pm                                                 100% 1993     2.0KB/s   00:00
    Pileup.pm                                                        100% 2499     2.4KB/s   00:00
    Alignment.pm                                                     100%   17KB  16.7KB/s   00:00
    AlignWrapper.pm                                                  100%   11KB  10.8KB/s   00:00
    FetchIterator.pm                                                 100%  335     0.3KB/s   00:00
    Target.pm                                                        100% 1026     1.0KB/s   00:00
    Query.pm                                                         100% 4571     4.5KB/s   00:00
    Sam.pm                                                           100%   71KB  71.1KB/s   00:00


mkdir -p /nethome/syoung/base/apps/samtools/1.19-ngsdev/auto
cd /nethome/syoung/base/apps/samtools/1.19-ngsdev/auto
scp -r syoung@ngsdev.ccs.miami.edu:/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio ./

    .packlist                                                        100% 1464     1.4KB/s   00:00
    .packlist                                                        100%   92KB  92.5KB/s   00:00
    Sam.bs                                                           100%    0     0.0KB/s   00:00
    Sam.so                                                           100%  695KB 694.7KB/s   00:00




NOW COPY BOTH TO Bio::DB IN BIOPERL 


COPY MODULE FILES:

cd /nethome/syoung/base/apps/samtools
scp -r syoung@ngsdev.ccs.miami.edu:/tmp/Bio-SamTools-1.19 ./

cd /nethome/syoung/base/apps/samtools/Bio-SamTools-1.19/blib/lib
perl -e 'use Bio::DB::Sam';


WHICH NO LONGER GIVES loadable object ERROR BUT GIVES THIS ERROR:


Can't locate Bio/SeqFeature/Lite.pm in @INC (@INC contains: /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.8 /usr/lib64/perl5/site_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.5 /usr/lib/perl5/site_perl /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.8 /usr/lib64/perl5/vendor_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.5 /usr/lib/perl5/vendor_perl /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/5.8.8 .) at Bio/DB/Sam.pm line 1306.
BEGIN failed--compilation aborted at Bio/DB/Sam.pm line 1306.
Compilation failed in require at -e line 1.
BEGIN failed--compilation aborted at -e line 1.
[syoung@u01 lib]$ 


BUT USING THE CORRECT LIB FOR BIO/SEQFEATURE/LITE:

cd /nethome/syoung/base/apps/samtools/Bio-SamTools-1.19/blib/lib
perl -e 'use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.19/blib/lib"; use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8"; use Bio::DB::Sam';


... GIVES THE OLD ERROR:

    Can't locate loadable object for module Bio::DB::Sam in @INC (@INC contains: /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8 /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8 /nethome/syoung/base/apps/samtools/Bio-SamTools-1.19/blib/lib /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.8 /usr/lib64/perl5/site_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.5 /usr/lib/perl5/site_perl /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.8 /usr/lib64/perl5/vendor_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.5 /usr/lib/perl5/vendor_perl /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/5.8.8 .) at -e line 1





COPY auto FILES:


cd /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/

cp -r /nethome/syoung/base/apps/samtools/1.19-ngsdev/auto/Bio ./

###scp -r syoung@ngsdev.ccs.miami.edu:/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB ./
###
###cd /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/Bio



perl -e 'use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib"; use Bio::DB::Sam'




ORIGINALLY NO Bio DIRECTORY IN auto DIR:

ll /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/
    
    drwxr-xr-x  2 syoung bioinfo 2.0K May 28 01:59 CPAN
    drwxr-xr-x  2 syoung bioinfo 2.0K May 28 01:59 Cwd
    drwxr-xr-x  3 syoung bioinfo 2.0K May 28 01:59 Data
    drwxr-xr-x  3 syoung bioinfo 2.0K May 28 01:59 ExtUtils
    drwxr-xr-x  3 syoung bioinfo 2.0K May 28 01:59 File
    drwxr-xr-x  3 syoung bioinfo 2.0K May 28 01:59 List
    drwxr-xr-x  2 syoung bioinfo 2.0K May 28 01:59 Net
    drwxr-xr-x  4 syoung bioinfo 2.0K May 28 01:59 Test




BUT IT APPEARS THAT THIS IS NOT THE CORRECT auto DIR:










NB: NO Sam.so FILE IN auto SUBDIRS INSIDE BIOPERL:


ls -R /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8 | grep auto

    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/CPAN:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Cwd:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Data:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Data/Dumper:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/ExtUtils:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/ExtUtils/MakeMaker:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/File:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/File/Temp:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/List:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/List/Util:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Net:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Test:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Test/Harness:
    ./lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Test/Simple:
    auto
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Archive:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Archive/Zip:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/common:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/common/sense:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Compress:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Compress/Raw:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Compress/Raw/Bzip2:
    autosplit.ix
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Compress/Raw/Zlib:
    autosplit.ix
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Digest:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Digest/SHA:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/ExtUtils:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/ExtUtils/CBuilder:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/ExtUtils/ParseXS:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/File:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/File/HomeDir:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/IPC:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/IPC/Run3:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/JSON:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/JSON/XS:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Module:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Module/Build:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Package:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Package/Constants:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Parse:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Parse/CPAN:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Parse/CPAN/Meta:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Probe:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Probe/Perl:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Term:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Term/ReadKey:
    autosplit.ix
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Term/ReadLine:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Text:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Text/Glob:
    ./lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/YAML:



... AND NO Sam.so FILE IN auto SUBDIRS INSIDE SAM-BIOTOOLS:

ls -R /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01 | grep auto
    
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/blib/arch/auto:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/blib/arch/auto/Bio:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/blib/arch/auto/Bio/DB:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/blib/arch/auto/Bio/DB/Sam:
    auto_features
    auto

    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/cd/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/cd/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/cd/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/cd/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/cd/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/SamTools:
    auto
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto:
    cd :
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/ExtUtils:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/ExtUtils/CBuilder:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Module:
    /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Module/Build:


... NOR IN THE LATER VERSION OF BIO-SAMTOOLS 

ll -R /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19 | grep auto
    
    drwxrwxr-x 3 syoung bioinfo 2.0K May 28 03:01 auto
    /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19/blib/arch/auto:
    /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19/blib/arch/auto/Bio:
    /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19/blib/arch/auto/Bio/DB:
    /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19/blib/arch/auto/Bio/DB/Sam:
    -rw-rw-r-- 1 syoung bioinfo   21 May 28 03:00 auto_features

ll /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19/blib/arch/auto/Bio/DB/Sam

    -rw-rw-r-- 1 syoung bioinfo    0 May 28 03:01 Sam.bs





Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam/Sam.bs
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam/Sam.so
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam/Constants.pm
Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam/Segment.pm




cd /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/Bio/DB
ls

    Ace.pm         Expression.pm       GFF.pm            RandomAccessI.pm  SwissProt.pm
    Biblio         Failover.pm         HIV               ReferenceI.pm     Taxonomy
    BiblioI.pm     Fasta.pm            HIV.pm            RefSeq.pm         Taxonomy.pm
    BioFetch.pm    FileCache.pm        InMemoryCache.pm  Registry.pm       TFBS
    CUTG.pm        Flat                LocationI.pm      SeqFeature        TFBS.pm
    DBFetch.pm     Flat.pm             MeSH.pm           SeqFeature.pm     Universal.pm
    EMBL.pm        GenBank.pm          NCBIHelper.pm     SeqHound.pm       UpdateableSeqI.pm
    EntrezGene.pm  GenericWebAgent.pm  Qual.pm           SeqI.pm           WebDBSeqI.pm
    EUtilities.pm  GenPept.pm          Query             SeqVersion
    Expression     GFF                 QueryI.pm         SeqVersion.pm



mkdir -p /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6
mkdir -p /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/source
cd /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/source


wget http://search.cpan.org/CPAN/authors/id/C/CJ/CJFIELDS/BioPerl-1.6.0.tar.gz
tar xvfz *gz
cd *





NB: ADD THIS TO Build.PL FOR BioPerl SO THAT IT FINDS Module::Build

emacs /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/source/Bioperl-1.6.0/Build.PL

    use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/perl5/site_perl/5.8.8";




perl Build.PL --prefix /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6
./Build
./Build test
./Build install








###chmod 755 /nethome/bioinfo/apps/agua/0.4/bin/apps/jbrowseFeatures.pl
###
###/nethome/bioinfo/apps/agua/0.4/bin/apps/jbrowseFeatures.pl \
###--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/runs/flatfile \
###--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff \
###--refseqsfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/refSeqs.js \
###--queue large \
###--species human 






</entry>

<entry [Fri May 14 01:56:33 EDT 2010] COPIED JBROWSE FEATURES TO /data/jbrowse2 ON ngsdev>


1. CREATE DIRECTORY

mkdir -p /data/jbrowse2/data/tracks



2. COPY FEATURE FILES

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference
DIRS="chr*"
for DIR in $DIRS; do cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/$DIR/data/tracks/$DIR /data/jbrowse2/data/tracks/$DIR; done

/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/chr1/data/tracks/chr1/Affy_Exon_Probes


3. LINK TO HTML

LINKED TO /var/www/html/jbrowse/0.2/data

ln -s /data/jbrowse2/data /var/www/html/jbrowse/0.2/data




NOTES
-----

DIRS[0]="chr1";
DIRS[1]="chr2";


DIRS=( zero one two three four )
echo ${DIRS[0]}
echo ${DIRS[1]}
echo ${DIRS[2]}

DIRS=chr1 chr0;
for index in $DIRS; do echo ${DIRS[index]}; done

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference
DIRS="chr*"
for DIR in $DIRS; do ls /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/$DIR/data/tracks/$DIR; done

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference
DIRS="chr*"
for DIR in $DIRS; do echo /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/$DIR/data/tracks/$DIR; done

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference
DIRS="chr*"
for DIR in $DIRS; do echo $DIR; done




</entry>

<entry [Fri May 14 00:56:33 EDT 2010] REGENERATED HUMAN hg19 FEATURES FOR ALL CHROMOSOMES ON BIG MEMORY NODES ON kronos>

reference2 (psmall QUEUE)
=========================


1. CREATED DIRECTORIES FOR OUTPUT FILES AND COPIED refSeqs.js TO EACH SUB DIRECTORY


mkdir -p /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference2

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference
DIRS="chr*"
echo $DIRS
for DIR in $DIRS; do mkdir -p /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference2/$DIR/data; cp /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/refSeqs.js /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference2/$DIR/data; done

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference2




2. RAN batchCluster.pl

screen -S reference2

/nethome/syoung/base/apps/agua/0.5/bin/apps/utils/batchCluster.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/conf/flatfile-batchfile2.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/runs/flatfile \
--columns "--executable,--inputdir,--outputdir,--jsonfile" \
--application /nethome/syoung/base/apps/agua/0.5/bin/apps/run-flatfile-to-json.pl \
--queue "-q psmall"






reference (pbigmem QUEUE)
=========================

chmod 755 /nethome/syoung/base/apps/agua/0.5/bin/apps/utils/batchCluster.pl


screen -S flatfile-to-json


/nethome/syoung/base/apps/agua/0.5/bin/apps/utils/batchCluster.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/conf/flatfile-batchfile.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/runs/flatfile \
--columns "--executable,--inputdir,--outputdir,--jsonfile" \
--application /nethome/syoung/base/apps/agua/0.5/bin/apps/run-flatfile-to-json.pl \
--queue "-q pbigmem"



    QUEUED

    Tue May 11 16:03:03 EDT 2010
    
    257696             mcastill       Idle    14  6:00:00:00  Sun May  9 19:45:24
    258148               syoung       Idle     1  3:00:00:01  Tue May 11 16:01:53
    258149               syoung       Idle     1  3:00:00:01  Tue May 11 16:01:59
    258150               syoung       Idle     1  3:00:00:01  Tue May 11 16:01:59
    258151               syoung       Idle     1  3:00:00:01  Tue May 11 16:01:59
    258152               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:00
    258153               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:00
    258154               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:01
    258155               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:01
    258156               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:01
    258157               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:02
    258158               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:02
    258159               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:08
    258160               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:12
    258161               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:12
    258162               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:13
    258163               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:13
    258164               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:13
    258165               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:14
    258166               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:14
    258167               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:15
    258168               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:15
    258169               syoung       Idle     1  3:00:00:01  Tue May 11 16:02:15
    257743               sgupta       Idle    16  5:00:00:00  Mon May 10 09:57:30
    258107             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258108             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258104             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258111             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258112             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258113             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258110             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258114             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258109             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258115             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258116             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258117             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258118             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258119             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258121             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258122             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258123             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258120             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:28
    258124             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258125             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    
    57 eligible jobs   
    
    blocked jobs-----------------------
    JOBID              USERNAME      STATE PROCS     WCLIMIT            QUEUETIME
    
    256562                 anaj  BatchHold     1  1:00:00:00  Thu May  6 16:47:56
    256564                 anaj  BatchHold     1  1:00:00:00  Thu May  6 16:52:41
    256759             epowell1  BatchHold     1  1:00:00:00  Fri May  7 09:29:26
    258126             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258127             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258129             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258128             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258130             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258131             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258132             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258133             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258134             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258135             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258136             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258137             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258138             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258139             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258140             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258141             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258142             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258143             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258144             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258145             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258146             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    258147             echaussa       Idle     1  1:00:00:00  Tue May 11 11:25:30
    
    25 blocked jobs   
    
    Total jobs:  132
    
    [syoung@u01 0.5]$ qstat
    date
    Job id                    Name             User            Time Use S Queue
    ------------------------- ---------------- --------------- -------- - -----
    258148.kronos             STDIN            syoung                 0 Q pbigmem        
    258149.kronos             STDIN            syoung                 0 Q pbigmem        
    258150.kronos             STDIN            syoung                 0 Q pbigmem        
    258151.kronos             STDIN            syoung                 0 Q pbigmem        
    258152.kronos             STDIN            syoung                 0 Q pbigmem        
    258153.kronos             STDIN            syoung                 0 Q pbigmem        
    258154.kronos             STDIN            syoung                 0 Q pbigmem        
    258155.kronos             STDIN            syoung                 0 Q pbigmem        
    258156.kronos             STDIN            syoung                 0 Q pbigmem        
    258157.kronos             STDIN            syoung                 0 Q pbigmem        
    258158.kronos             STDIN            syoung                 0 Q pbigmem        
    258159.kronos             STDIN            syoung                 0 Q pbigmem        
    258160.kronos             STDIN            syoung                 0 Q pbigmem        
    258161.kronos             STDIN            syoung                 0 Q pbigmem        
    258162.kronos             STDIN            syoung                 0 Q pbigmem        
    258163.kronos             STDIN            syoung                 0 Q pbigmem        
    258164.kronos             STDIN            syoung                 0 Q pbigmem        
    258165.kronos             STDIN            syoung                 0 Q pbigmem        
    258166.kronos             STDIN            syoung                 0 Q pbigmem        
    258167.kronos             STDIN            syoung                 0 Q pbigmem        
    258168.kronos             STDIN            syoung                 0 Q pbigmem        
    258169.kronos             STDIN            syoung                 0 Q pbigmem        






n29

23943 syoung    25   0  523m 422m 2444 R  100  0.7 144:26.19 perl
24126 syoung    25   0  416m 315m 2444 R  100  0.5  77:27.95 perl
28879 him       25   0  248m  78m 4148 S  100  0.1   1489:41 main.out
28254 dkinnamo  25   0  143m  98m 3232 R  100  0.2   5297:06 rvassocsims
28877 him       25   0  248m  78m 4036 R  100  0.1   1489:49 main.out
28878 him       25   0  248m  78m 4176 R  100  0.1   1489:56 main.out


n30
 5983 dkinnamo  25   0  219m 173m 3232 R  101  0.3   5302:02 rvassocsims
 5984 dkinnamo  25   0  219m 174m 3232 R  101  0.3   5302:56 rvassocsims
 5986 dkinnamo  25   0  219m 174m 3232 R  101  0.3   5303:00 rvassocsims
 7480 him       25   0  249m  80m 3976 R  101  0.1   1492:31 main.out
 7481 him       25   0  250m  80m 4008 R  101  0.1   1492:36 main.out
 7680 pgallins  25   0 1225m 1.2g 1144 R  101  1.9   1389:52 mach
 5985 dkinnamo  25   0  143m  98m 3232 R   99  0.2   5302:49 rvassocsims



ON n29

Wed May 12 18:15:32 EDT 2010

ps aux | grep syoung

    syoung   23893  0.0  0.0  65912  1300 ?        Ss   May11   0:00 -bash
    syoung   23920  0.0  0.0  63828  1080 ?        S    May11   0:00 /bin/sh /var/spool/torque/mom_priv/jobs/258237.kron.SC
    syoung   23922  0.0  0.0  94116  7988 ?        S    May11   0:00 /usr/bin/perl -w? /nethome/syoung/base/apps/agua/0.5/bin/apps/run-flatfile-to-json.pl --executable /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1 --outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/chr1 --jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json
    syoung   24469  0.0  0.0  65912  1300 ?        Ss   May11   0:00 -bash
    syoung   24496  0.0  0.0  63828  1080 ?        S    May11   0:00 /bin/sh /var/spool/torque/mom_priv/jobs/258238.kron.SC
    syoung   24498  0.0  0.0  94116  7988 ?        S    May11   0:00 /usr/bin/perl -w? /nethome/syoung/base/apps/agua/0.5/bin/apps/run-flatfile-to-json.pl --executable /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr2 --outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/chr2 --jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json
    syoung   26194 99.9  1.0 773408 670196 ?       R    12:33 341:09 perl /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr2/hapmap-snp-chr2.gff --tracklabel Hapmap_SNP --key Hapmap SNP
    syoung   26635 99.9  0.5 432604 329412 ?       R    16:48  86:22 perl /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1/intrrepts327-chr1.gff --tracklabel Intrrepts327 --key Intrrepts327




TEST
====


/nethome/syoung/base/apps/agua/0.5/bin/apps/run-flatfile-to-json.pl \
--executable /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1 \
--outputdir  /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/chr1 \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json 

    ...
    command: /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1/polyA-chr1.gff --tracklabel PolyA --key PolyA
    run prepare-refseqs.pl first to supply information about your reference sequences at /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl line 87
    ...


/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl \
/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1 \
/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/chr1 \
/nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json


The --tracklabel parameter is required
You must supply either a --gff, -gff2, --bed, or --bam parameter
USAGE: /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl [--gff <gff3 file> | --gff2 <gff2 file> | --bed <bed file> | --bam <bam file>] [--out <output directory>] --tracklabel <track identifier> --key <human-readable track name> [--cssclass <CSS class for displaying features>] [--autocomplete none|label|alias|all] [--getType] [--getPhase] [--getSubs] [--getLabel] [--urltemplate "http://example.com/idlookup?id={id}"] [--subfeatureClasses <JSON-syntax subfeature class map>] [--clientConfig <JSON-syntax extra configuration for FeatureTrack>]

    --out: defaults to "data"
    --cssclass: defaults to "feature"
    --autocomplete: make these features searchable by their "label", by their "alias"es, both ("all"), or "none" (default).
    --getType: include the type of the features in the json
    --getPhase: include the phase of the features in the json
    --getSubs:  include subfeatures in the json
    --getLabel: include a label for the features in the json
    --urltemplate: template for a URL that clicking on a feature will navigate to
    --arrowheadClass: CSS class for arrowheads
    --subfeatureClasses: CSS classes for each subfeature type, in JSON syntax
        e.g. '{"CDS": "transcript-CDS", "exon": "transcript-exon"}'
    --clientConfig: extra configuration for the client, in JSON syntax
        e.g. '{"css": "background-color: black;", "histScale": 5}'
    --type: only process features of the given type
    --nclChunk: NCList chunk size; if you get "json text or perl structure exceeds maximum nesting level" errors, try setting this lower (default: 1000)
    
    

PREPARATION
===========


1. CREATED DIRECTORIES FOR OUTPUT FILES AND COPIED refSeqs.js TO EACH SUB DIRECTORY


mkdir -p /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference
DIRS="chr*"
echo $DIRS
for DIR in $DIRS; do mkdir -p /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/$DIR/data; cp /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/refSeqs.js /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/$DIR/data; done

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference



2. COPIED conf/flatfile-batchfile.txt INPUT FILE FOR batchCluster.pl

mkdir -p /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/conf



3. COPIED LAZY FEATURES flatfile-to-json.pl IN bin

FROM

E:\base\pipeline\jbrowse\lazyfeatures\100511-8a84e62

TO

/nethome/syoung/base/apps/jbrowse/100511


4. COPIED run-flatfile-to-json.pl IN bin

FROM

/nethome/syoung/base/apps/aqwa/0.4

TO

/nethome/syoung/base/apps/agua/0.5



5. INSTALLED LOCALLY BioPerl 1.6 (FOR BAM FILE SUPPORT)

mkdir -p /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6
mkdir -p /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/source
cd /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/source
wget http://search.cpan.org/CPAN/authors/id/C/CJ/CJFIELDS/BioPerl-1.6.0.tar.gz
tar xvfz *gz
cd *



NB: ADD THIS TO Build.PL FOR BioPerl SO THAT IT FINDS Module::Build:

emacs /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/source/Bioperl-1.6.0/Build.PL

    use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/perl5/site_perl/5.8.8";



perl Build.PL --prefix /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6
./Build
./Build test
./Build install


    ...    
    ## Differing versions of Bio/Variation/SeqDiff.pm found. You might like to
    rm /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/perl5/site_perl/5.8.8/Bio/Variation/SeqDiff.pm
    rm /usr/lib/perl5/site_perl/5.8.5/Bio/Variation/SeqDiff.pm
    ## Differing versions of Bio/Variation/VariantI.pm found. You might like to
    rm /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/perl5/site_perl/5.8.8/Bio/Variation/VariantI.pm
    rm /usr/lib/perl5/site_perl/5.8.5/Bio/Variation/VariantI.pm
    ## Differing versions of Bio/WebAgent.pm found. You might like to
    rm /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/perl5/site_perl/5.8.8/Bio/WebAgent.pm
    rm /usr/lib/perl5/site_perl/5.8.5/Bio/WebAgent.pm
    ## Running 'make install UNINST=1' will unlink all those files for you.


MEANING THAT THERE ARE TWO VERSIONS OF BIOPERL INSTALLED:

ONE IN /usr/lib/perl5/site_perl/5.8.5

AND THE OTHER IN /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/perl5/site_perl/5.8.8

rm /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib/perl5/site_perl/5.8.8/Bio/Variation/VariantI.pm
rm /usr/lib/perl5/site_perl/5.8.5/Bio/Variation/VariantI.pm



... IN ADDITION TO THE ONE JUST INSTALLED:

cd /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/Bio

ls -al

    drwxr-xr-x 44 syoung bioinfo 16384 May 11 13:28 .
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 ..
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Align
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 AlignIO
    -r--r--r--  1 syoung bioinfo 14228 May 11 13:22 AlignIO.pm
    -r--r--r--  1 syoung bioinfo 22291 May 11 13:22 AnalysisI.pm
    -r--r--r--  1 syoung bioinfo  4670 May 11 13:22 AnalysisParserI.pm
    -r--r--r--  1 syoung bioinfo  6106 May 11 13:22 AnalysisResultI.pm
    -r--r--r--  1 syoung bioinfo  2619 May 11 13:22 AnnotatableI.pm
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Annotation
    -r--r--r--  1 syoung bioinfo  6136 May 11 13:22 AnnotationCollectionI.pm
    -r--r--r--  1 syoung bioinfo  5152 May 11 13:22 AnnotationI.pm
    drwxr-xr-x  4 syoung bioinfo 16384 May 11 13:28 Assembly
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 Biblio
    -r--r--r--  1 syoung bioinfo 10495 May 11 13:22 Biblio.pm
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Cluster
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 ClusterIO
    -r--r--r--  1 syoung bioinfo  7366 May 11 13:22 ClusterIO.pm
    -r--r--r--  1 syoung bioinfo  3775 May 11 13:22 ClusterI.pm
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 CodonUsage
    -r--r--r--  1 syoung bioinfo  6444 May 11 13:22 ConfigData.pm
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 Coordinate
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Das
    -r--r--r--  1 syoung bioinfo 13381 May 11 13:22 DasI.pm
    drwxr-xr-x 12 syoung bioinfo 16384 May 11 13:28 DB
    -r--r--r--  1 syoung bioinfo  2437 May 11 13:22 DBLinkContainerI.pm
    -r--r--r--  1 syoung bioinfo  2683 May 11 13:22 DescribableI.pm
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Event
    drwxr-xr-x  4 syoung bioinfo 16384 May 11 13:28 Expression
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Factory
    -r--r--r--  1 syoung bioinfo  6735 May 11 13:22 FeatureHolderI.pm
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 FeatureIO
    -r--r--r--  1 syoung bioinfo 13355 May 11 13:22 FeatureIO.pm
    -r--r--r--  1 syoung bioinfo  7105 May 11 13:22 HandlerBaseI.pm
    -r--r--r--  1 syoung bioinfo  2337 May 11 13:22 IdCollectionI.pm
    -r--r--r--  1 syoung bioinfo  4840 May 11 13:22 IdentifiableI.pm
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Index
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 LiveSeq
    -r--r--r--  1 syoung bioinfo 18374 May 11 13:22 LocatableSeq.pm
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Location
    -r--r--r--  1 syoung bioinfo 11897 May 11 13:22 LocationI.pm
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Map
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 MapIO
    -r--r--r--  1 syoung bioinfo  4861 May 11 13:22 MapIO.pm
    drwxr-xr-x  4 syoung bioinfo 16384 May 11 13:28 Matrix
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 MolEvol
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 Ontology
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 OntologyIO
    -r--r--r--  1 syoung bioinfo  9126 May 11 13:22 OntologyIO.pm
    -r--r--r--  1 syoung bioinfo  6710 May 11 13:22 ParameterBaseI.pm
    -r--r--r--  1 syoung bioinfo 16843 May 11 13:22 Perl.pm
    drwxr-xr-x  4 syoung bioinfo 16384 May 11 13:28 Phenotype
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 PhyloNetwork
    -r--r--r--  1 syoung bioinfo 44728 May 11 13:22 PhyloNetwork.pm
    drwxr-xr-x  4 syoung bioinfo 16384 May 11 13:28 PopGen
    -r--r--r--  1 syoung bioinfo 23739 May 11 13:22 PrimarySeqI.pm
    -r--r--r--  1 syoung bioinfo 25805 May 11 13:22 PrimarySeq.pm
    -r-xr-xr-x  1 syoung bioinfo 19511 May 11 13:22 PullParserI.pm
    -r--r--r--  1 syoung bioinfo 18430 May 11 13:22 RangeI.pm
    -r--r--r--  1 syoung bioinfo  8303 May 11 13:22 Range.pm
    drwxr-xr-x  4 syoung bioinfo 16384 May 11 13:28 Restriction
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 Root
    drwxr-xr-x  6 syoung bioinfo 16384 May 11 13:28 Search
    -r--r--r--  1 syoung bioinfo  5105 May 11 13:22 SearchDist.pm
    drwxr-xr-x  4 syoung bioinfo 16384 May 11 13:28 SearchIO
    -r--r--r--  1 syoung bioinfo 15630 May 11 13:22 SearchIO.pm
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 Seq
    -r--r--r--  1 syoung bioinfo  3125 May 11 13:22 SeqAnalysisParserI.pm
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 SeqEvolution
    drwxr-xr-x  5 syoung bioinfo 16384 May 11 13:28 SeqFeature
    -r--r--r--  1 syoung bioinfo 19675 May 11 13:22 SeqFeatureI.pm
    drwxr-xr-x  5 syoung bioinfo 16384 May 11 13:28 SeqIO
    -r--r--r--  1 syoung bioinfo 21711 May 11 13:22 SeqIO.pm
    -r--r--r--  1 syoung bioinfo  6111 May 11 13:22 SeqI.pm
    -r--r--r--  1 syoung bioinfo 36917 May 11 13:22 Seq.pm
    -r--r--r--  1 syoung bioinfo 24449 May 11 13:22 SeqUtils.pm
    -r--r--r--  1 syoung bioinfo 86306 May 11 13:22 SimpleAlign.pm
    -r--r--r--  1 syoung bioinfo  7323 May 11 13:22 SimpleAnalysisI.pm
    -r--r--r--  1 syoung bioinfo 15723 May 11 13:22 Species.pm
    drwxr-xr-x  4 syoung bioinfo 16384 May 11 13:28 Structure
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Symbol
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 Taxonomy
    -r--r--r--  1 syoung bioinfo 11437 May 11 13:22 Taxonomy.pm
    -r-xr-xr-x  1 syoung bioinfo 22905 May 11 13:22 Taxon.pm
    drwxr-xr-x 15 syoung bioinfo 16384 May 11 13:28 Tools
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 Tree
    drwxr-xr-x  2 syoung bioinfo 16384 May 11 13:28 TreeIO
    -r--r--r--  1 syoung bioinfo  7966 May 11 13:22 TreeIO.pm
    -r--r--r--  1 syoung bioinfo  3083 May 11 13:22 UpdateableSeqI.pm
    drwxr-xr-x  3 syoung bioinfo 16384 May 11 13:28 Variation
    -r--r--r--  1 syoung bioinfo  4756 May 11 13:22 WebAgent.pm



6. INSTALLED LOCALLY JSON AND JSON::XS


######## required
perl -MCPAN -e shell
o conf makepl_arg PREFIX=/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8

o conf mbuildpl_arg "--prefix /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"

o conf commit

install JSON

OK!


######## (optional, for speed)

#### install JSON::XS   
#### requires common::sense

perl -MCPAN -e shell
o conf makepl_arg PREFIX=/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8

o conf mbuildpl_arg "--prefix /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"

o conf commit


install common::sense

install JSON::XS


OK!
 




7. ADDED 'use lib' TO flatfile-to-json.pl



emacs /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl

    use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8";
    use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8";





8. COPIED batchfile

FROM

E:\base\pipeline\jbrowse\lazyfeatures\ucsc\conf

TO

/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/conf



head /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/conf/flatfile-batchfile.txt

#### flatfile-batchfile.txt 
#### --executable   --inputdir  --outputdir --jsonfile --jsonfile
/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1	/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/chr1	/nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json
/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr2	/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/chr2	/nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json






TROUBLESHOOTING

ERROR Can't locate Bio/DB/SeqFeature/Store.pm 

    /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl \/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1 \/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference/chr1 \/nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json
    
    Can't locate Bio/DB/SeqFeature/Store.pm in @INC (@INC contains: /home/syoung/base/apps/agua/0.5/bin/../lib /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi /usr/lib64/perl5/site_perl/5.8.7/x86_64-linux-thread-multi /usr/lib64/perl5/site_perl/5.8.6/x86_64-linux-thread-multi /usr/lib64/perl5/site_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.8 /usr/lib/perl5/site_perl/5.8.7 /usr/lib/perl5/site_perl/5.8.6 /usr/lib/perl5/site_perl/5.8.5 /usr/lib/perl5/site_perl /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi /usr/lib64/perl5/vendor_perl/5.8.7/x86_64-linux-thread-multi /usr/lib64/perl5/vendor_perl/5.8.6/x86_64-linux-thread-multi /usr/lib64/perl5/vendor_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.8 /usr/lib/perl5/vendor_perl/5.8.7 /usr/lib/perl5/vendor_perl/5.8.6 /usr/lib/perl5/vendor_perl/5.8.5 /usr/lib/perl5/vendor_perl /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/5.8.8 .) at /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl line 10.
    BEGIN failed--compilation aborted at /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl line 10.

DIAGNOSIS

BioPerl 1.6 NOT INSTALLED


SOLUTION

INSTALL IT LOCALLY




</entry>

<entry [Tue May 11 12:09:42 EDT 2010] DOWNLOADED JBROWSE LAZYFEATURES >

DOWNLOADED TO:

E:\base\pipeline\jbrowse\lazyfeatures\jbrowse-jbrowse-8a84e62\jbrowse-jbrowse-8a84e62

ls -al
    total 28
    drwxr-xr-x   11 syoung   Administ        0 May 11 12:07 .
    drwxr-xr-x    3 syoung   Administ        0 May 11 12:07 ..
    -rw-r--r--    1 syoung   Administ       46 Mar 30 20:07 .gitignore
    -rw-r--r--    1 syoung   Administ       94 Mar 30 20:07 .gitmodules
    -rw-r--r--    1 syoung   Administ    33634 Mar 30 20:07 LICENSE
    -rw-r--r--    1 syoung   Administ      346 Mar 30 20:07 Makefile
    drwxr-xr-x    2 syoung   Administ        0 May 11 12:09 bin
    -rw-r--r--    1 syoung   Administ      326 Mar 30 20:07 closedhand.cur
    drwxr-xr-x    4 syoung   Administ        0 May 11 12:07 docs
    -rw-r--r--    1 syoung   Administ    13388 Mar 30 20:07 genome.css
    drwxr-xr-x    2 syoung   Administ        0 May 11 12:07 img
    -rw-r--r--    1 syoung   Administ     2854 Mar 30 20:07 index.html
    drwxr-xr-x    2 syoung   Administ        0 May 11 12:07 js
    drwxr-xr-x    4 syoung   Administ        0 May 11 12:07 jslib
    drwxr-xr-x    3 syoung   Administ        0 May 11 12:07 lib
    -rw-r--r--    1 syoung   Administ      326 Mar 30 20:07 openhand.cur
    drwxr-xr-x    2 syoung   Administ        0 May 11 12:07 src
    drwxr-xr-x    3 syoung   Administ        0 May 11 12:07 tests
    drwxr-xr-x    3 syoung   Administ        0 May 11 12:07 twiki



FROM:

http://github.com/jbrowse/jbrowse/tree/lazyfeatures#


NB: WITH BAM FILE SUPPORT!!

E:\base\pipeline\jbrowse\lazyfeatures\jbrowse-jbrowse-8a84e62\jbrowse-jbrowse-8a84e62\bin\flatfile-to-json.pl


my $hasSamTools = 1;
eval { require Bio::DB::Sam; };
if ($@) {
    $hasSamTools = 0;
}



COPIED TO ngsdev:

/data/jbrowse/100511-8a84e62






</entry>

<entry [Sun Apr 25 01:44:00 EDT 2010] COMPARE OLD AND NEW VERSIONS OF JBROWSE>

NEW VERSION
E:\base\pipeline\jbrowse\jbrowse-100401-b620a49\jbrowse-jbrowse-b620a49\js


OLD VERSION
E:\0.4\html\plugins\view\jbrowse-old\js\FeatureTrack.js

</entry>

<entry [Sun Apr 25 01:44:00 EDT 2010] REPLY FROM MITCH SKINNER>

1. DOWNLOAD PAGE

http://github.com/jbrowse/jbrowse/commit/b620a492703fd506578069bf15099819d39f4e95

CLICK 'Download Source'

2. COPIED OVER FROM E:/base/pipeline/jbrowse TO ngsdev /data/jbrowse

ll /data/jbrowse/jbrowse-jbrowse-b620a49

    drwxr-xr-x 2 root root  4096 Apr  1 09:51 bin
    -rw-r--r-- 1 root root   326 Apr  1 09:51 closedhand.cur
    drwxr-xr-x 4 root root  4096 Apr  1 09:51 docs
    -rw-r--r-- 1 root root 13387 Apr  1 09:51 genome.css
    drwxr-xr-x 2 root root  4096 Apr  1 09:51 img
    -rw-r--r-- 1 root root  2723 Apr  1 09:51 index.html
    drwxr-xr-x 2 root root  4096 Apr  1 09:51 js
    drwxr-xr-x 4 root root  4096 Apr  1 09:51 jslib
    drwxr-xr-x 3 root root  4096 Apr  1 09:51 lib
    -rw-r--r-- 1 root root 33634 Apr  1 09:51 LICENSE
    -rw-r--r-- 1 root root   346 Apr  1 09:51 Makefile
    -rw-r--r-- 1 root root   326 Apr  1 09:51 openhand.cur
    drwxr-xr-x 2 root root  4096 Apr  1 09:51 src
    drwxr-xr-x 3 root root  4096 Apr  1 09:51 twiki

LINK TO html DIRECTORY

ln -s /data/jbrowse/jbrowse-jbrowse-b620a49 /var/www/html/jbrowse/0.2

DOWNLOADED LATEST (April 1st) VERSION CONTAINING LAZY FEATURES


 cd /data/jbrowse
[syoung@ngsdev jbrowse]$ ll
total 20K
drwxr-xr-x  4 root   root    4.0K Apr 20 09:22 .
drwxrwxrwx 12 root   root    4.0K Feb 23 10:28 ..
drwxr-xr-x  5 syoung bioinfo 4.0K Apr 19  2009 data
drwxr-xr-x  2 root   root    4.0K Apr 20 09:22 lazy



LATEST VERSION OF GIT ON ngsdev:

/nethome/syoung/base/apps/git/git-1.7.0.5


NB: GIT IS ALSO INSTALLED ON PEGASUS

nethome/syoung/base/apps/git/git-1.6.2.3



</entry>

<entry [Sun Apr 19 01:44:00 EDT 2010] REPLY FROM MITCH SKINNER>



Mitch Skinner <mitch_skinner@berkeley.edu>
CC: ihh@berkeley.edu

Re: JBrowse - whole human genome & NGS support

Mitch Skinner wrote:
> On 04/18/2010 03:12 PM, Mitch Skinner wrote:
>> To your specific points:
>> 1) In the lazyfeatures branch, feature tracks do get sliced into smaller chunks.  Options for setting chunk size are partially implemented, but the defaults should be pretty good most of the time.  This is in contrast to the master branch, where an entire chromosome/track is loaded at the same time.  For zoomed-out views, the server pre-generates a density histogram at multiple zoom levels, and that histogram data is also split into chunks, now (that's recent work).
>
> Reading that again, I think it was a little unclear; the last sentence applies to the "lazyfeatures" branch and not the master branch.
>
> In other words, in the master branch, the feature data for a particular track/chromosome is all in one big json file, and the lazyfeatures branch is all about breaking that file into smaller pieces so that JBrowse can handle large numbers of features.
>
>> So, for the use-case where you have your own BAM files, then I think flatfile-to-json.pl currently does what you need it to do.  The proxy use-case is where there are a large number of BAM files spread out at different places on the internet and downloading them and processing them with flatfile-to-json.pl is impractical.  In that case, I think it should be possible to take the BAM index and generate a top-level lazy-loaded NCList for JBrowse, and then when someone actually views the track you could use the boundaries from the top-level NCList to query the remote BAM file.
>
> I think that may also have been a little cryptic.  From your email, I wasn't sure if you actually needed or wanted to have a proxy; the JBrowse javascript client can't access BAM files directly, but in the lazyfeatures branch of JBrowse, the client *can* access BAM file data if you run flatfile-to-json.pl on it first.  If there's a remote BAM file somewhere else on the internet, you should even be able to run flatfile-to-json.pl on the url of the file (I haven't tested that and it might require some small changes to flatfile-to-json, but it should be straightforward).  The proxy would only be necessary if that's impractical.
>
> Given that, if you're still interested in tackling a proxy, then I have ideas about how that could work that I could write more about.
>
> And yes, I'm always interested in having more people test, especially if their bug reports include good test cases :)  While I've been chasing down JBrowse bugs, I've been using the same BAM file for all my tests so far, so having people throw their own data at it would be helpful.
>
> Mitch
>



4/18/2010 6:12 PM
Mitch Skinner <mitch_skinner@berkeley.edu>
CC: ihh@berkeley.edu
Re: JBrowse - whole human genome & NGS support

Mitch Skinner wrote:

> I've been working on exactly this, but it's not yet merged into the "master" branch, because there are still a few bugs.  However, the remaining bugs are probably less annoying than the things you've listed here, so I recommend trying out the "lazyfeatures" branch.  Unfortunately, you'll have to re-generate all your feature track json when you switch.
>
> To your specific points:
> 1) In the lazyfeatures branch, feature tracks do get sliced into smaller chunks.  Options for setting chunk size are partially implemented, but the defaults should be pretty good most of the time.  This is in contrast to the master branch, where an entire chromosome/track is loaded at the same time.  For zoomed-out views, the server pre-generates a density histogram at multiple zoom levels, and that histogram data is also split into chunks, now (that's recent work).
>
> 2) In the lazyfeatures branch, the density histogram does get automatically scaled to 100 pixels (currently hardcoded, but making it configurable is a to-do).  Also, if the mean is less than 1% of the max, the histogram switches to a log scale.  Showing a y-axis scale is currently a to-do.
>
> 3) In the lazyfeatures branch, flatfile-to-json.pl does process BAM files.  Current related to-dos are: a) in FeatureTrack.js, highlighting mismatches to the reference sequence, and b) showing an ellipsis if the display is taller than some amount (on the assumption that a display that's 3000 features tall isn't very useful; if you do know of a situation where someone would want to see that I'd like to know)
>
> What kind of NGS data do you have?  Is it for expression analysis, or resequencing, or ...?
>
> So, for the use-case where you have your own BAM files, then I think flatfile-to-json.pl currently does what you need it to do.  The proxy use-case is where there are a large number of BAM files spread out at different places on the internet and downloading them and processing them with flatfile-to-json.pl is impractical.  In that case, I think it should be possible to take the BAM index and generate a top-level lazy-loaded NCList for JBrowse, and then when someone actually views the track you could use the boundaries from the top-level NCList to query the remote BAM file.
>
> Some background on how the feature lazy-loading works in JBrowse is here:
> http://biowiki.org/view/JBrowse/LazyFeatureLoading
>
> As far as what you can do, I'm always interested in user testing, because a lot of JBrowse users are pretty distant from me.  Do you work closely with the people who are using your system?  If you get the chance to watch them using it, I'd be interested to know what kinds of difficulties they run into, and what kinds of questions they're investigating when they're using JBrowse.
>
> Also, you clearly have a set of needs of your own that you understand well, so I think those would be good things to work on; just talk with us about what problems you're interested in and we'll discuss how to tackle them.
>
> And lastly, if you're interested in the full list of to-dos for jbrowse, there's the issue tracker list here:
> http://jbrowse.lighthouseapp.com/projects/23792-jbrowse/tickets
>
> Tickets 4,8,9,34,40,44,46 are currently being worked on, so I'd stay away from those, but the rest are fair game.
>
> Mitch
>
> On 04/17/2010 10:24 PM, Stuart Young wrote:
>> Dear Mitch & Ian,
>>
>> I'm building a Next Generation Sequencing workflow web application which allows the user to configure and run NGS analysis on HPC clusters and incorporates JBrowse as the genomic feature visualization tool. I'm really impressed with the speed and performance of JBrowse, and its design. I'd really like to develop its role inside my web application. So I was wondering if you could help me with two problems I'm having in implementing JBrowse and a question about NGS support:
>>
>> 1) Whole human genome
>> I've generated 30 tracks using your tools and data downloaded from UCSC for each human chromosome. The smaller chromosomes (e.g., chrY, chr22) load feature tracks quickly but with the larger chromosomes (e.g., chr1, chr2) it can take several minutes to load a single feature track and some feature tracks with many features per chromosome (e.g., snp130) won't load. Is there a way around this, e.g., increasing chunk size (if so what is the optimum chunk size for chr1)?
>>
>> 2) Feature bars too tall on zoom out
>> The feature bars become larger and larger as I zoom out which, in the case of tracks with many features, eventually results in one feature track monopolizing the whole screen. I'd prefer it if all features had the same, preset max height. Is there some way to configure this?
>>
>> 3) NGS file support
>> Is there an alpha version of JBrowse available with BAM file direct access support? I noticed that you had some 'BAM test' features in your recent talks and I was hoping you'd like someone to test it and give you detailed feedback! In your PAG VIII talk you mentioned that JBrowse javascript client can't use NGS files directly but could access them through a proxy. Could you let me know what kind of proxy you had in mind or if one has already been implemented?
>>
>> Lastly, I was wondering if there's some way I could contribute directly to your project? I have a fair bit of Javascript experience (my web application is built on Dojo) and would like to make a contribution however small.
>>
>> Thanks and best regards,
>>
>> Stuart.
>>
>>
>> Stuart Young
>> Post Doctoral Research Associate
>> Center for Computational Sciences
>> University of Miami
>> 1120 NW 14th St, Miami, FL
>> 305-781-2286
>
>







</entry>

<entry [Sun Mar 28 23:21:00 EST 2010] LOAD ANALYSIS DATA ON-THE-FLY USING flatfile-to-json.pl TO GENERATE trackInfo.js AND trackData.json FILES >


1. GENERATE *.gff FILE FROM ANALYSIS DATA

maq2gff.pl 


2. GENERATE trackInfo.js AND trackData.json FILES 

time /home/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl  \
--gff /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-exon-probes-chrY.gff \
--tracklabel affy_exon_probes \
--key "Affy Exon Probes"


3. ALTER brwsr.baseUrl IN Browser.js TO POINT TO NEW FOLDER

OLD URL FILEPATH

/data/agua/0.4/html/plugins/view/jbrowse/data


NEW URL FILEPATH

/data/agua/0.4/html/plugins/view/jbrowse/data



</entry>

<entry [Sun Mar 28 21:33:00 EST 2010] LOADED ALL HUMAN CHROMOSOMES INTO jbrowse ON ngsdev AGUA 0.4>


NB: LATER GENERATE QUANTITATIVE ("wiggle") TRACKS, E.G.:
    
    cd /var/www/html/jbrowse
    bin/wig-to-json.pl --wig docs/tutorial/data_files/volvox_microarray.wig
    
        working on seq ctgA


1. MERGE THE refSeqs INFO FOR ALL CHROMOSOMES INTO ONE FILE
===========================================================


cat /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/refSeqs.js 
refSeqs = 
[
   {
      "length" : 247249719,
      "name" : "chr1",
      "seqDir" : "data/seq/chr1",
      "seqChunkSize" : 20000,
      "end" : 247249719,
      "start" : 0
   }

TO CREATE ONE refSeqs.js FILE:

cat /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/*/data/refSeqs.js >  /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/refSeqs.js


cat /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/refSeqs.js

    
    refSeqs = 
    [
       {
          "length" : 135374737,
          "name" : "chr10",
          "seqDir" : "data/seq/chr10",
          "seqChunkSize" : 20000,
          "end" : 135374737,
          "start" : 0
       }
    ]refSeqs = 
    [
       {
          "length" : 134452384,
          "name" : "chr11",
          "seqDir" : "data/seq/chr11",
          "seqChunkSize" : 20000,
          "end" : 134452384,
          "start" : 0
       }
    ]refSeqs = 
    [
    ...
    
WHICH I EDITED MANUALLY TO THIS FORM:

    refSeqs = 
    [
       {
          "length" : 247249719,
          "name" : "chr1",
          "seqDir" : "data/seq/chr1",
          "seqChunkSize" : 20000,
          "end" : 247249719,
          "start" : 0
       }
       ,
       {
          "length" : 242951149,
          "name" : "chr2",
          "seqDir" : "data/seq/chr2",
          "seqChunkSize" : 20000,
          "end" : 242951149,
          "start" : 0
       }
       ,
       {
          "length" : 199501827,
          "name" : "chr3",
          "seqDir" : "data/seq/chr3",
          "seqChunkSize" : 20000,
          "end" : 199501827,
          "start" : 0
       }
       ,
       {



BACKED UP OLD refSeqs.js FILE:

mv /data/agua/0.4/html/plugins/view/jbrowse/data/refSeqs.js /data/agua/0.4/html/plugins/view/jbrowse/data/refSeqs.bkp.js


COPIED NEW refSeqs.js FILE TO data DIRECTORY:

cp /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/refSeqs.js /data/agua/0.4/html/plugins/view/jbrowse/data/


CHECKED OKAY:

head /data/agua/0.4/html/plugins/view/jbrowse/data/refSeqs.js

    refSeqs = 
    [
       {
          "length" : 247249719,
          "name" : "chr1",
          "seqDir" : "data/seq/chr1",
          "seqChunkSize" : 20000,
          "end" : 247249719,
          "start" : 0
       }


ALSO EDITED trackInfo.js FILE TO CONTAIN LONG 'key' NAMES, WHICH APPEAR ON THE TRACK LABELS:

head /data/agua/0.4/html/plugins/view/jbrowse/data/trackInfo.js

    trackInfo = 
    [
       {
          "args" : {
             "chunkSize" : 20000
          },
          "url" : "plugins/view/jbrowse/data/seq/{refseq}/",
          "type" : "SequenceTrack",
          "label" : "DNA",
          "key" : "DNA"
       },
       {
          "url" : "plugins/view/jbrowse/data/tracks/{refseq}/Affy_Exon_Probes/trackData.json",
          "label" : "Affy_Exon_Probes",
          "type" : "FeatureTrack",
          "key" : "Affy_Exon_Probes"
       },




2. LINK THE FEATURE seq AND track DIRECTORIES TO jbrowse
========================================================

1. BACKUP OLD data DIRECTORY

mv /data/agua/0.4/html/plugins/view/jbrowse/data /data/agua/0.4/html/plugins/view/jbrowse/data.safe3

2. CREATE NEW data DIRECTORY

mkdir -p /data/agua/0.4/html/plugins/view/jbrowse/data/seq

mkdir -p /data/agua/0.4/html/plugins/view/jbrowse/data/tracks

3. COPY NEW refSeqs.js TO NEW data DIRECTORY

cp /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/refSeqs.js /data/agua/0.4/html/plugins/view/jbrowse/data/

4. COPY FEATURE trackInfo.js TO NEW data DIRECTORY

cp /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/trackInfo.js /data/agua/0.4/html/plugins/view/jbrowse/data/

5. COPY  tracks FOLDERS TO NEW data DIRECTORY

cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr1;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr2/data/tracks/chr2 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr2;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr3;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr4/data/tracks/chr4 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr4;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr5/data/tracks/chr5 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr5;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr6/data/tracks/chr6 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr6;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr7/data/tracks/chr7 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr7;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr8/data/tracks/chr8 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr8;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr9/data/tracks/chr9 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr9;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr10/data/tracks/chr10 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr10;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr11/data/tracks/chr11 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr11;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr12/data/tracks/chr12 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr12;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr13/data/tracks/chr13 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr13;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr14/data/tracks/chr14 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr14;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15/data/tracks/chr15 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr15;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16/data/tracks/chr16 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr16;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr17/data/tracks/chr17 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr17;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr18/data/tracks/chr18 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr18;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr19/data/tracks/chr19 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr19;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr20/data/tracks/chr20 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr20;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr21/data/tracks/chr21 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr21;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr22/data/tracks/chr22 /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chr22;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrX/data/tracks/chrX /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chrX;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/data/tracks/chrY /data/agua/0.4/html/plugins/view/jbrowse/data/tracks/chrY;


6. COPY seq FOLDERS TO NEW data DIRECTORY

cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/seq/chr1 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr1;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr2/data/seq/chr2 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr2;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/seq/chr1 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr3;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr4/data/seq/chr4 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr4;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr5/data/seq/chr5 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr5;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr6/data/seq/chr6 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr6;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr7/data/seq/chr7 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr7;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr8/data/seq/chr8 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr8;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr9/data/seq/chr9 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr9;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr10/data/seq/chr10 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr10;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr11/data/seq/chr11 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr11;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr12/data/seq/chr12 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr12;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr13/data/seq/chr13 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr13;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr14/data/seq/chr14 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr14;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15/data/seq/chr15 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr15;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16/data/seq/chr16 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr16;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr17/data/seq/chr17 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr17;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr18/data/seq/chr18 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr18;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr19/data/seq/chr19 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr19;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr20/data/seq/chr20 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr20;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr21/data/seq/chr21 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr21;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr22/data/seq/chr22 /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chr22;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrX/data/seq/chrX /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chrX;
cp -r /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/data/seq/chrY /data/agua/0.4/html/plugins/view/jbrowse/data/seq/chrY;


DIRECTORY SIZES:

[syoung@ngsdev Broad_Histone]$ du -hs /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/*/data/tracks/*
    52M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr10/data/tracks/chr10
    55M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr11/data/tracks/chr11
    51M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr12/data/tracks/chr12
    35M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr13/data/tracks/chr13
    34M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr14/data/tracks/chr14
    32M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15/data/tracks/chr15
    36M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16/data/tracks/chr16
    36M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr17/data/tracks/chr17
    27M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr18/data/tracks/chr18
    16M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr19/data/tracks/chr19
    57M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1
    26M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr20/data/tracks/chr20
    11M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr21/data/tracks/chr21
    17M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr22/data/tracks/chr22
    76M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr2/data/tracks/chr2
    72M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr3/data/tracks/chr3
    63M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr4/data/tracks/chr4
    64M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr5/data/tracks/chr5
    62M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr6/data/tracks/chr6
    53M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr8/data/tracks/chr8
    51M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr9/data/tracks/chr9
    43M     /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrX/data/tracks/chrX
    6.7M    /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/data/tracks/chrY




REM: THE LOCATION OF THE PROCESSED UCSC FEATURE DATA:


ls /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1

    Affy_Exon_Probes  Cytoband           Genome_Variant       Microsatellite
    CCDS              Cytoband_Ideogram  Hapmap_LD_Phased     Repeat_Masker
    Conrad_Deletion   Encode_Common_CNV  Hapmap_SNP           Segmental_duplication
    CpG_Island        Exapted_Repeats    Interrupted_Repeats
    cytoband          exon               Intrrepts327


ls /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data

    names       seq         trackInfo.js   trackInfo.js.bak  tracks
    refSeqs.js  seq.tar.gz  trackInfo.js~  trackInfo.js.bkp  tracks.bkp


ls /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1

    chr1.fa     data        names
    

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference
du -hs *

    692M    chr1
    264M    chr10
    265M    chr11
    258M    chr12
    214M    chr13
    201M    chr14
    189M    chr15
    175M    chr16
    160M    chr17
    146M    chr18
    116M    chr19
    456M    chr2
    123M    chr20
    84M     chr21
    95M     chr22
    385M    chr3
    362M    chr4
    348M    chr5
    330M    chr6
    249M    chr7
    282M    chr8
    270M    chr9
    286M    chrX
    118M    chrY
    800K    trackinfo.safe





</entry>

<entry [Sun Mar 28 21:33:00 EST 2010] MODIFIED Browser.js TO ACCOMODATE THE FORMAT OF THE CURRENT FEATURE DATA AND MODIFIED genome.css>


Browser.prototype.navigateTo = function(loc) {

    ...

	// IF THE loc STRING MATCHES CORRECTLY
    if (matches) {
		
		// SET this.refSeq.name AS THE CURRENT LOCATION SEQUENCE
		if ( matches[2] )
		{
			console.log("Browser.navigateTo    loc MATCHES. matches[1]: " + matches[1]);
			console.log("Browser.navigateTo    loc MATCHES. matches[2]: " + matches[2]);

			//if ( matches[1] )
			//	this.refSeq = matches[1] + matches[2];
			//else this.refSeq = matches[2];
			
			this.refSeq.name = matches[2];
			console.log("Browser.navigateTo    loc MATCHES. this.refSeq.name: " + this.refSeq.name);
		}


MODIFIED genome.css TO STACK TRACK LABELS MORE TIGHTLY


LINE 197, CHANGED:


div.tracklist-container {
    padding: 5px;
    margin-top: -3px;
    margin-bottom: -3px;
}


TO:


div.tracklist-container {
    padding: 2px;
    /*margin-top: -3px;*/
    /*margin-bottom: -3px;*/
}





</entry>

<entry [Wed Feb 17 01:37:00 EST 2010] GENERATE names.json INDEX FILE AND UPDATE trackInfo.js FILE WITH generate-names.pl>


RECAP:

GENERATED trackInfo.js AND trackData.json FILES USING flatfile-to-json.pl

time /home/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl  \
--gff /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-exon-probes-chrY.gff \
--tracklabel affy_exon_probes \
--key "Affy Exon Probes"


NOW WE WANT TO GENERATE lazy-<PREFIX>.json FILES TO ACT AS INDEXES BY FEATURE NAME AND ID





1. ADDED plugins/view/jbrowse TO URL IN TRACKINFO FILE:

emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/trackInfo.js

trackInfo =
[
   {
      "args" : {
         "chunkSize" : 20000
      },
      "url" : "plugins/view/jbrowse/plugins/view/jbrowse/data/seq/{refseq}/",
      "type" : "SequenceTrack",
      "label" : "DNA",
      "key" : "DNA"
   },
   {
      "url" : "plugins/view/jbrowse/data/tracks/{refseq}/Affy_Exon_Probes/trackData.json",
      "label" : "Affy_Exon_Probes",
      "type" : "FeatureTrack",
      "key" : "Affy"
   },
   ...



2. BACKED UP PREVIOUS AFFY_EXON_PROBES RUN

mv /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1/Affy_Exon_Probes/trackData.json /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1/Affy_Exon_Probes/trackData.json.bkp



3. MADE A LIST OF THE ALREADY-GENERATED names.json FILES

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1
[syoung@ngsdev chr1]$ ll */*names.json*
-rw-rw-rw- 1 syoung bioinfo  26K Dec 10 08:58 Conrad_Deletion/names.json
-rw-r--r-- 1 syoung bioinfo  26K Dec 22 20:52 Conrad_Deletion/names.json.bkp
-rw-rw-rw- 1 syoung bioinfo 187K Dec 10 08:59 CpG_Island/names.json
-rw-r--r-- 1 syoung bioinfo 187K Dec 22 20:52 CpG_Island/names.json.bkp
-rw-rw-rw- 1 syoung bioinfo 4.3K Dec 10 08:59 Cytoband_Ideogram/names.json
-rw-r--r-- 1 syoung bioinfo 4.3K Dec 22 20:52 Cytoband_Ideogram/names.json.bkp
-rw-r--r-- 1 syoung bioinfo 3.7K Dec 10 02:14 cytoband/names.json
-rw-rw-rw- 1 syoung bioinfo 3.7K Dec 10 08:58 Cytoband/names.json
-rw-r--r-- 1 syoung bioinfo 3.7K Dec 22 20:52 cytoband/names.json.bkp
-rw-r--r-- 1 syoung bioinfo 3.7K Dec 22 20:52 Cytoband/names.json.bkp
-rw-r--r-- 1 syoung bioinfo 3.5K Dec  8 03:24 exon/names.json
-rw-r--r-- 1 syoung bioinfo 3.5K Dec 22 20:52 exon/names.json.bkp


CHECK root.json

ll /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/names

   -rw-r--r-- 1 syoung bioinfo 3.5K Dec  8 08:23 root.json
   -rw-r--r-- 1 syoung bioinfo 3.5K Dec 22 20:40 root.json.bkp

[syoung@u01 names]$ diff root.json.bkp  root.json

[syoung@u01 names]$ head root.json
[["exon"],null,["chr1",[[0,"chr1","chr1",-1,247249719,1]]],["p",null,["1",null,["1.",null,["1",[[0,"p11.1","chr1",121100000,124300000,69]]],["2",[[0,"p11.2","chr1",120700000,121100000,67]]]],["2",[[0,"p12","chr1",11760


4. RAN generate-names.pl ON AFFY EXON PROBES ALONE AGAINST CHROMOSOME 1

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1

/nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/generate-names.pl \
-v /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1/Affy_Exon_Probes/trackData.json

   subtree for          cpg: 1   has        698  in chunk,        698  total
   subtree for          cpg: 2   has        567  in chunk,        567  total
   subtree for          cpg: 3   has        338  in chunk,        338  total
   subtree for          cpg: 4   has        303  in chunk,        303  total
   subtree for          cpg: 5   has        203  in chunk,        203  total
   subtree for          cpg: 6   has        202  in chunk,        202  total
   subtree for           cpg:    has        480  in chunk,       2791  total
   2791 total names, with 0 in the root chunk
   [syoung@u01 chr1]$ 


AS PREVIOUSLY, THIS 
WHICH CREATED THE data/names DIRECTORY INSIDE THE data DIRECTORY:

ll /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data

   drwxr-xr-x 3 syoung bioinfo  16K Dec  7 14:25 seq
   -rw-r--r-- 1 syoung bioinfo  182 Dec  7 14:29 refSeqs.js
   drwxr-xr-x 3 syoung bioinfo  16K Dec  8 02:11 tracks.bkp
   drwxr-xr-x 3 syoung bioinfo  16K Dec  8 02:26 tracks
   -rw-r--r-- 1 syoung bioinfo 248M Dec 10 09:15 seq.tar.gz
   -rw-r--r-- 1 syoung bioinfo  192 Dec 15 11:06 trackInfo.js.bak
   drwxr-xr-x 4 syoung bioinfo  16K Dec 21 10:57 ..
   -rw-rw-rw- 1 syoung bioinfo 2.4K Dec 22 04:57 trackInfo.js
   -rw-r--r-- 1 syoung bioinfo 2.4K Dec 22 20:41 trackInfo.js.bkp
   drwxr-xr-x 6 syoung bioinfo  16K Dec 22 20:54 .
   drwxr-xr-x 2 syoung bioinfo  16K Dec 22 20:54 names


AND THESE NEW FILES IN IT:


ll /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/names

    -rw-r--r-- 1 syoung bioinfo 35K Dec 22 20:54 lazy-cpg: 1.json
    -rw-r--r-- 1 syoung bioinfo 29K Dec 22 20:54 lazy-cpg: 2.json
    -rw-r--r-- 1 syoung bioinfo 18K Dec 22 20:54 lazy-cpg: 3.json
    -rw-r--r-- 1 syoung bioinfo 16K Dec 22 20:54 lazy-cpg: 4.json
    -rw-r--r-- 1 syoung bioinfo 11K Dec 22 20:54 lazy-cpg: 5.json
    -rw-r--r-- 1 syoung bioinfo 11K Dec 22 20:54 lazy-cpg: 6.json
    -rw-r--r-- 1 syoung bioinfo 25K Dec 22 20:54 lazy-cpg: .json
    -rw-r--r-- 1 syoung bioinfo  36 Dec 22 20:54 root.json





/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/








THIS IS WHAT THE OUTPUT FILE LOOKS LIKE:


emacs  /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1/Affy_Exon_Probes/trackData.json
  
   {"headers":["start","end","strand","id"],"subfeatureClasses":null,"featureCount":125753,"key":"Affy","featureNCList":[[-1,247249719,0,1,[[1787,2030,1,229],[2082,2122,-1,231],[2519,2555,1,233],[2926,2958,1,235],[3018,3132,-1,237],[3228,3751,1,239],[3994,4024,-1,241],[4012,4231,1,243],[4232,4266,-1,245],[4275,4343,-1,247],[4461,4528,-1,249],[4612,4691,-1,251],[4630,4920,1,253,[[4742,4768,-1,255],[4832,4870,-1,257],[4870,4901,-1,259]]],[5017,5053,1,261],[5191,5383,-1,263],[5683,5713,-1,265],[5716,5752,-1,267],[5754,5789,-1,269],[6272
   ...
   


ll /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1/Affy_Exon_Probes/trackData.json 
   -rw-rw-rw- 1 syoung bioinfo 3.7M Dec 20 03:31 /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1/Affy_Exon_Probes/trackData.json



/nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/generate-names.pl \
-v /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/*/*/names.json






THE trackInfo.js FILES HAS TO BE EDITED TO INCLUDE:

plugins/view/jbrowse/


SO THIS:


trackInfo = 
[
   {
      "args" : {
         "chunkSize" : 20000
      },
      "url" : "data/seq/{refseq}/",
      "type" : "SequenceTrack",
      "label" : "DNA",
      "key" : "DNA"
   },
   {
      "url" : "data/tracks/{refseq}/exon/trackData.json",
      "type" : "FeatureTrack",
      "label" : "exon",
      "key" : "Cytoband"
   }
]


 
SHOULD READ LIKE THIS:

trackInfo = 
[
   {
      "args" : {
         "chunkSize" : 20000
      },
      "url" : "plugins/view/jbrowse/data/seq/{refseq}/",
      "type" : "SequenceTrack",
      "label" : "DNA",
      "key" : "DNA"
   },
   {
      "url" : "plugins/view/jbrowse/data/tracks/{refseq}/exon/trackData.json",
      "type" : "FeatureTrack",
      "label" : "exon",
      "key" : "Cytoband"
   }
]



</entry>

<entry [Tues Dec 22 01:22:44 EDT 2009] GENERATE names.json INDEX FILE AND UPDATE trackInfo.js FILE WITH generate-names.pl>

To enable JBrowse to search on name and/or ID, run bin/generate-names.pl to collect the names/IDs from each track into one big dictionary:

    1. GENERATES lazy-*.js FILES TO ALLOW JBROWSE TO SEARCH AGAINST name OR id?)
    
    2. MUST RUN bin/generate-names.pl EVERY TIME YOU ADD NEW FEATURES TO JBrowse.


BACKUP OLD names/root.json AND data/trackInfo.js:
---------------------------------------

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1
cp names/root.json  names/root.json.bkp
cp data/trackInfo.js  data/trackInfo.js.bkp

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1/
ls */names.json

    -rw-rw-rw- 1 syoung bioinfo  26K Dec 10 08:58 Conrad_Deletion/names.json
    -rw-rw-rw- 1 syoung bioinfo 187K Dec 10 08:59 CpG_Island/names.json
    -rw-rw-rw- 1 syoung bioinfo 4.3K Dec 10 08:59 Cytoband_Ideogram/names.json
    -rw-r--r-- 1 syoung bioinfo 3.7K Dec 10 02:14 cytoband/names.json
    -rw-rw-rw- 1 syoung bioinfo 3.7K Dec 10 08:58 Cytoband/names.json
    -rw-r--r-- 1 syoung bioinfo 3.5K Dec  8 03:24 exon/names.json

cp Conrad_Deletion/names.json Conrad_Deletion/names.json.bkp
cp CpG_Island/names.json CpG_Island/names.json.bkp
cp Cytoband_Ideogram/names.json Cytoband_Ideogram/names.json.bkp
cp cytoband/names.json cytoband/names.json.bkp
cp Cytoband/names.json Cytoband/names.json.bkp
cp exon/names.json exon/names.json.bkp



RUN generate-names.pl
---------------------

1. MOVE TO DIRECTORY CONTAINING 'data' SUBDIR:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1


2. CHECK 'data' DIR IS THERE:

ls /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1
    chr1.fa  data  names

ll -tr /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data

    drwxr-xr-x 3 syoung bioinfo  16K Dec  7 14:25 seq
    -rw-r--r-- 1 syoung bioinfo  182 Dec  7 14:29 refSeqs.js
    drwxr-xr-x 3 syoung bioinfo  16K Dec  8 02:11 tracks.bkp
    drwxr-xr-x 3 syoung bioinfo  16K Dec  8 02:26 tracks
    -rw-r--r-- 1 syoung bioinfo 248M Dec 10 09:15 seq.tar.gz
    -rw-r--r-- 1 syoung bioinfo  192 Dec 15 11:06 trackInfo.js.bak
    drwxr-xr-x 4 syoung bioinfo  16K Dec 21 10:57 ..
    -rw-rw-rw- 1 syoung bioinfo 2.4K Dec 22 04:57 trackInfo.js
    -rw-r--r-- 1 syoung bioinfo 2.4K Dec 22 20:41 trackInfo.js.bkp
    drwxr-xr-x 6 syoung bioinfo  16K Dec 22 20:54 .
    drwxr-xr-x 2 syoung bioinfo  16K Dec 22 20:54 names


ls /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1


    Affy_Exon_Probes  Conrad_Deletion  cytoband  Cytoband_Ideogram  Exapted_Repeats  Genome_Variant    Hapmap_SNP           Intrrepts327    Repeat_Masker
CCDS              CpG_Island       Cytoband  Encode_Common_CNV  exon             Hapmap_LD_Phased  Interrupted_Repeats  Microsatellite  Segmental_duplication

ll */names.json

    -rw-rw-rw- 1 syoung bioinfo  26K Dec 10 08:58 Conrad_Deletion/names.json
    -rw-rw-rw- 1 syoung bioinfo 187K Dec 10 08:59 CpG_Island/names.json
    -rw-rw-rw- 1 syoung bioinfo 4.3K Dec 10 08:59 Cytoband_Ideogram/names.json
    -rw-r--r-- 1 syoung bioinfo 3.7K Dec 10 02:14 cytoband/names.json
    -rw-rw-rw- 1 syoung bioinfo 3.7K Dec 10 08:58 Cytoband/names.json
    -rw-r--r-- 1 syoung bioinfo 3.5K Dec  8 03:24 exon/names.json




3. GENERATE NAMES

/nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/generate-names.pl \
-v /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/*/*/names.json


    subtree for          cpg: 1   has        698  in chunk,        698  total
    subtree for          cpg: 2   has        567  in chunk,        567  total
    subtree for          cpg: 3   has        338  in chunk,        338  total
    subtree for          cpg: 4   has        303  in chunk,        303  total
    subtree for          cpg: 5   has        203  in chunk,        203  total
    subtree for          cpg: 6   has        202  in chunk,        202  total
    subtree for           cpg:    has        480  in chunk,       2791  total
    2791 total names, with 0 in the root chunk





WHICH CREATED THE data/names DIRECTORY INSIDE THE data DIRECTORY:

ll /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data

   drwxr-xr-x 3 syoung bioinfo  16K Dec  7 14:25 seq
   -rw-r--r-- 1 syoung bioinfo  182 Dec  7 14:29 refSeqs.js
   drwxr-xr-x 3 syoung bioinfo  16K Dec  8 02:11 tracks.bkp
   drwxr-xr-x 3 syoung bioinfo  16K Dec  8 02:26 tracks
   -rw-r--r-- 1 syoung bioinfo 248M Dec 10 09:15 seq.tar.gz
   -rw-r--r-- 1 syoung bioinfo  192 Dec 15 11:06 trackInfo.js.bak
   drwxr-xr-x 4 syoung bioinfo  16K Dec 21 10:57 ..
   -rw-rw-rw- 1 syoung bioinfo 2.4K Dec 22 04:57 trackInfo.js
   -rw-r--r-- 1 syoung bioinfo 2.4K Dec 22 20:41 trackInfo.js.bkp
   drwxr-xr-x 6 syoung bioinfo  16K Dec 22 20:54 .
   drwxr-xr-x 2 syoung bioinfo  16K Dec 22 20:54 names


AND THESE NEW FILES IN IT:


ll /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/names

    -rw-r--r-- 1 syoung bioinfo 35K Dec 22 20:54 lazy-cpg: 1.json
    -rw-r--r-- 1 syoung bioinfo 29K Dec 22 20:54 lazy-cpg: 2.json
    -rw-r--r-- 1 syoung bioinfo 18K Dec 22 20:54 lazy-cpg: 3.json
    -rw-r--r-- 1 syoung bioinfo 16K Dec 22 20:54 lazy-cpg: 4.json
    -rw-r--r-- 1 syoung bioinfo 11K Dec 22 20:54 lazy-cpg: 5.json
    -rw-r--r-- 1 syoung bioinfo 11K Dec 22 20:54 lazy-cpg: 6.json
    -rw-r--r-- 1 syoung bioinfo 25K Dec 22 20:54 lazy-cpg: .json
    -rw-r--r-- 1 syoung bioinfo  36 Dec 22 20:54 root.json
























CHECK FEATURES INSIDE CHR1 DIRECTORY:

ls /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1


    Affy_Exon_Probes  Conrad_Deletion  cytoband  Cytoband_Ideogram  Exapted_Repeats  Genome_Variant    Hapmap_SNP           Intrrepts327    Repeat_Masker
    CCDS              CpG_Island       Cytoband  Encode_Common_CNV  exon             Hapmap_LD_Phased  Interrupted_Repeats  Microsatellite  Segmental_duplication

ll /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/chr1





    64 total names, with 64 in the root chunk
    couldn't rename /tmp/Clmjy4VMp6 to names: Invalid cross-device link at /var/www/html/jbrowse/bin/generate-names.pl line 91.


emacs /tmp/Clmjy4VMp6/root.json

    [["exon"],null,["chr1",[[0,"chr1","chr1",-1,247249719,1]]],["p",null,["1",null,["1.",null,["1",[[0,"p11.1","chr1",121100000,124300000,69]]],["2",[[0,"p11.2","chr1",120700000,121100000,67]]]],["2",[[0, ...


FIXED THE ERROR BY USING File::Copy::Recursive

emacs /var/www/html/jbrowse/bin/generate-names.pl

LINE 81:

    # race condition here, probably we should only have one generate-names.pl                     # running at a time (loop the rename instead? or version?)                                    
    # rename $outDir, $destDir                                                                    #  or die "couldn't rename $outDir to $destDir: $!";                                          
    use File::Copy::Recursive;
    File::Copy::Recursive::rcopy($outDir, $destDir)
      or die "couldn't rename $outDir to $destDir: $!";








</entry>

