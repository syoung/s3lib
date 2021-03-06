Notes-project52-parkinsons.txt

</entry>

<entry [Wed Jan 19 17:36:11 EST 2011] COPY PARKINSON DATA >

1. COPY FILES TO pdx-export
(ALL EXCEPT out.sam AND out.wig, THE LATTER OF WHICH WE WILL GENERATE)

/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop distributed \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.bam,out.bam.bai,transcripts.expr,transcripts.gtf,genes.expr \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/control/2/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.bam,out.bam.bai,transcripts.expr,transcripts.gtf,genes.expr \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/control/1/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.bam,out.bam.bai,transcripts.expr,transcripts.gtf,genes.expr \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/test/2/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.bam,out.bam.bai,transcripts.expr,transcripts.gtf,genes.expr \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/test/1/tophat/chr%REPLICATE%


2. COPY SAM FILES TO pdx-export

/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.sam \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/control/2/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.sam \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/control/1/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.sam \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/test/2/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.sam \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/test/1/tophat/chr%REPLICATE%



3. USE TOPHAT'S wiggles TO GENERATE out.wig FILE FOR EACH CHROMOSOME out.sam FILE


<!--

    wiggles v1.0.13
    ---------------------------------------
    Usage:   wiggles <accepted_hits.sam> <coverage.wig>

-->

NB: MUST DO ON CLUSTER AS MEMORY NOT SUFFICIENT ON PEGASUS USER NODE

COPY out.sam FILES TO /scratch

/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.sam \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr%REPLICATE% \
--target /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.sam \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr%REPLICATE% \
--target /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.sam \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr%REPLICATE% \
--target /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.sam \
--source /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr%REPLICATE% \
--target /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr%REPLICATE%



RUN AS DISTRIBUTED LOOP JOBS

/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop distributed \
--looplabel control-1 \
--outdir /nethome/syoung/base/pipeline/jvance/pdx/control/1/tophat \
--maxjobs 2000 \
--walltime 24 \
--queue small \
--cluster LSF \
--cpus 1 \
--executable /nethome/syoung/base/apps/tophat/1.0.13beta/src/wiggles \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr%REPLICATE%/out.sam \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr%REPLICATE%/out.wig


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop distributed \
--looplabel control-2 \
--outdir /nethome/syoung/base/pipeline/jvance/pdx/control/2/tophat \
--maxjobs 2000 \
--walltime 24 \
--queue small \
--cluster LSF \
--cpus 1 \
--executable /nethome/syoung/base/apps/tophat/1.0.13beta/src/wiggles \
/scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr%REPLICATE%/out.sam \
/scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr%REPLICATE%/out.wig


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop distributed \
--looplabel test-1 \
--outdir /nethome/syoung/base/pipeline/jvance/pdx/test/1/tophat \
--maxjobs 2000 \
--walltime 24 \
--queue small \
--cluster LSF \
--cpus 1 \
--executable /nethome/syoung/base/apps/tophat/1.0.13beta/src/wiggles \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr%REPLICATE%/out.sam \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr%REPLICATE%/out.wig


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop distributed \
--looplabel test-2 \
--outdir /nethome/syoung/base/pipeline/jvance/pdx/test/2/tophat \
--maxjobs 2000 \
--walltime 24 \
--queue small \
--cluster LSF \
--cpus 1 \
--executable /nethome/syoung/base/apps/tophat/1.0.13beta/src/wiggles \
/scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr%REPLICATE%/out.sam \
/scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr%REPLICATE%/out.wig



COPY COMPLETED out.wig FILES TO /ngs/bioinfo


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.wig \
--source /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/control/1/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.wig \
--source /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/control/2/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.wig \
--source /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/test/1/tophat/chr%REPLICATE%


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename out.wig \
--source /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr%REPLICATE% \
--target /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/test/2/tophat/chr%REPLICATE%



TOTAL FILE SIZES:

/ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export
cat du*

    11G     control/1
    13G     control/2
    2.7G    test/1
    3.1G    test/2


TEST
----

/nethome/syoung/base/apps/tophat/1.0.13beta/src/wiggles \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr2/out.sam \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr2/out.wig

    OK


/nethome/syoung/base/apps/tophat/1.0.13beta/src/wiggles \
/ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/test/1/tophat/chr1/out.sam \
/ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/test/1/tophat/chr1/out.wig

    OK


head /ngs/bioinfo/syoung/base/pipeline/jvance/pdx-export/test/1/tophat/chr1/out.wig
track type=bedGraph name="TopHat - read coverage"
chr1    0       10000   0
chr1    10000   10001   8
chr1    10001   10003   20
chr1    10003   10004   46
chr1    10004   10005   61
chr1    10005   10006   73
chr1    10006   10007   81
chr1    10007   10009   93
chr1    10009   10010   119


</entry>

<entry [Sun Jan  9 00:41:48 EST 2011] COPY BOWTIE REFERENCE FILES TO /data ON JGILBERT AQ-7>

ON PEGASUS, TAR UP HG19 BOWTIE CHROMOSOME DIRS:

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--dir \
--filename chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY \
--source /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--target /nethome/bioinfo/data/sequence/chromosomes/human/hg19/temp

ON PEGASUS, COPY TO JGILBERT AQ-7

scp -i test hg19-bowtie.tar.gz root@ec2-75-101-214-196.compute-1.amazonaws.com:

    bg
    [2]+ scp -i test hg19-bowtie.tar.gz root@ec2-75-101-214-196.compute-1.amazonaws.com:/data &
    [syoung@u02 temp]$ ps aux | grep 


</entry>

<entry [Sun Oct 10 09:34:37 EDT 2010] COPY ALL JBROWSE FILES TO NGSDEV>


ON PEGASUS

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/1
tar cvfz control2-jbrowse.tar.gz jbrowse
scp control1-jbrowse.tar.gz syoung@ngsdev.ccs.miami.edu:/data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/2
tar cvfz control2-jbrowse.tar.gz jbrowse
scp control2-jbrowse.tar.gz syoung@ngsdev.ccs.miami.edu:/data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/1
tar cvfz test2-jbrowse.tar.gz jbrowse
scp test1-jbrowse.tar.gz syoung@ngsdev.ccs.miami.edu:/data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/2
tar cvfz test2-jbrowse.tar.gz jbrowse
scp test2-jbrowse.tar.gz syoung@ngsdev.ccs.miami.edu:/data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19



ON NGSDEV

scp -r 






</entry>

<entry [Sat Oct  9 23:35:41 EDT 2010] CHECKED JSON FILE DIFFERENCE BETWEEN CONTROL 1 AND CONTROL 2, AND TEST 1 AND TEST 2>


CHECK INPUT FILES:


cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx
ll */*/*sequence.txt
    
    -rwxrwx---  1 syoung bioinfo 3.6G Aug 31 10:55 control/1/s_1_1.sequence.txt
    -rwxrwx---  1 syoung bioinfo 3.7G Aug 31 10:56 control/1/s_1_2.sequence.txt
    -rw-rw-rw-+ 1 syoung bioinfo  22G Oct  2 07:00 control/2/control2.sequence.txt
    -rw-rw-rw-+ 1 syoung bioinfo  20G Oct  2 07:02 test/1/test1.sequence.txt
    -rw-rw-rw-+ 1 syoung bioinfo  21G Oct  2 00:40 test/2/test2.sequence.txt


CHECK ALIGNMENT OUTPUT FILES:

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx
ll */*/tophat/chr1/*.bam

    -rw-r--r--+ 1 syoung bioinfo 359M Sep 29 09:32 control/1/tophat/chr1/out.bam
    -rw-r--r--+ 1 syoung bioinfo 222M Oct  3 07:21 control/2/tophat/chr1/out.bam
    -rw-r--r--+ 1 syoung bioinfo  46M Oct  3 10:27 test/1/tophat/chr1/out.bam
    -rw-r--r--+ 1 syoung bioinfo  52M Oct  3 07:05 test/2/tophat/chr1/out.bam
    

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx
ll */*/tophat/chr1/*.sam
        
    -rw-rw-rw-+ 1 syoung bioinfo 1.5G Sep 29 09:33 control/1/tophat/chr1/out.sam
    -rw-rw-rw-+ 1 syoung bioinfo 749M Oct  3 07:22 control/2/tophat/chr1/out.sam
    -rw-rw-rw-+ 1 syoung bioinfo 170M Oct  3 10:27 test/1/tophat/chr1/out.sam
    -rw-rw-rw-+ 1 syoung bioinfo 190M Oct  3 07:05 test/2/tophat/chr1/out.sam

tail -n 1 */*/tophat/chr1/*.sam


<!--
    ==> control/1/tophat/chr1/out.sam <==
    HWI-EAS185_0001:1:106:304:128#0 0       chr1    249240228       255     75M     *       0       0       GTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTCGGGTTAGGGT     a`aUaa_^a``\aX_Y__YR^[^`]V_Y_``_VSX\`_YYO]][Y]V]\Y]XTZ]\ROO[V[BBBBBBBBBBBBB     NM:i:1
    
    ==> control/2/tophat/chr1/out.sam <==
    control2:0:1287:2014:343#0      16      chr1    249240554       0       50M     *       0       0       GTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGT      %:26)4%-=)'/)93447/77:=>72+<>>2@-8>>:=>@;A>?BBB:AB      NM:i:0
    
    ==> test/1/tophat/chr1/out.sam <==
    test1:0:261:1927:1944#0 16      chr1    249240561       255     50M     *       0       0       TTAGTGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTTAGGGT      6'4,94?)+<A:60/<B,;51BA32298=,4;.8B4,9:@<:69<:=:92      NM:i:2
    
    ==> test/2/tophat/chr1/out.sam <==
    test2:0:1189:1141:1622#0        0       chr1    249240559       255     50M     *       0       0       GGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAGGGTTAAAA      B%?BBB=?B>@=A<?@=?A<>?=;>59A?4::9<<1?1;>@'+'97=%@=      NM:i:2




-->




</entry>

<entry [Fri Oct  1 20:23:29 EDT 2010] CONVERT transcript.gtf FILES INTO JBROWSE FEATURES>

SEE:
Tue Jun 29 14:32:15 EDT 2010
RUN jbrowseFeatures.pl AFTER REPLACED refseqfile ARGUMENT WITH species AND build



1. CREATE refSeqs.js FOR HUMAN hg19

mkdir -p /nethome/bioinfo/data/sequence/chromosomes/human/hg19/jbrowse
emacs /nethome/bioinfo/data/sequence/chromosomes/human/hg19/jbrowse/refSeqs.js

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
        
        ...
        
         "end" : 154913754,
         "start" : 0
        ,
        {
         "length" : 57772954,
         "name" : "chrY",
         "seqDir" : "data/seq/chrY",
         "seqChunkSize" : 20000,
         "end" : 57772954,
         "start" : 0
        }
    ]


2. RUN jbrowseFeatures


CONTROL 1
---------

screen -S jbrowse-control1

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowse/jbrowseFeatures.pl \
--build hg19 \
--cluster LSF \
--filename out.bam \
--filetype bam \
--inputdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat \
--key control1 \
--label control1 \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/jbrowse \
--queue large \
--species human \
--username jgilbert
    
    jbrowseFeatures.pl    Run time: 00:22:07
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowse/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-10-04 23:00:20
    jbrowseFeatures.pl    ****************************************

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/jbrowse/data/tracks/chr1/control1


CONTROL 2
---------

screen -S jbrowse-control2

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowse/jbrowseFeatures.pl \
--build hg19 \
--cluster LSF \
--filename out.bam \
--filetype bam \
--inputdir /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat \
--key control2 \
--label control2 \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/2/jbrowse \
--queue large \
--species human \
--username jgilbert

    jbrowseFeatures.pl    Run time: 00:18:34
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowse/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-10-04 22:56:31
    jbrowseFeatures.pl    ****************************************

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2/jbrowse/data/tracks/chr1/control2

    -rw-rw-rw- 1 syoung root   26454 Oct  4 22:42 lazyfeatures-996000.json
    -rw-rw-rw- 1 syoung root   26228 Oct  4 22:46 lazyfeatures-997000.json
    -rw-rw-rw- 1 syoung root   26305 Oct  4 22:46 lazyfeatures-998000.json
    -rw-rw-rw- 1 syoung root   26417 Oct  4 22:46 lazyfeatures-999000.json
    -rw-rw-rw- 1 syoung root  120508 Oct  4 22:50 trackData.json

TEST 1
------

screen -S jbrowse-test1

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowse/jbrowseFeatures.pl \
--build hg19 \
--cluster LSF \
--filename out.bam \
--filetype bam \
--inputdir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat \
--key test1 \
--label test1 \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/test/1/jbrowse \
--queue large \
--species human \
--username jgilbert
    
    jbrowseFeatures.pl    Run time: 00:06:24
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowse/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-10-04 22:45:55
    jbrowseFeatures.pl    ****************************************

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/jbrowse/data/tracks/chr1/test1

    ...    
    -rw-rw-rw- 1 syoung root  35K Oct  4 22:40 lazyfeatures-963963.json
    -rw-rw-rw- 1 syoung root  15K Oct  4 22:40 lazyfeatures-964964.json
    -rw-rw-rw- 1 syoung root 9.7K Oct  4 22:41 trackData.json


cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/1/jbrowse/data/tracks/chr1

TRANSFER TO NGSDEV

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/1/jbrowse/data/tracks/chr1
tar cvfz test1.tar.gz test1
scp test1.tar.gz syoung@ngsdev.ccs.miami.edu:/tmp

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/test/2/jbrowse/data/tracks/chr1
tar cvfz test2.tar.gz test2
scp test2.tar.gz syoung@ngsdev.ccs.miami.edu:/tmp


cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/1/jbrowse/data/tracks/chr1
tar cvfz control1.tar.gz control1
scp control1.tar.gz syoung@ngsdev.ccs.miami.edu:/tmp

cd /ngs/bioinfo/syoung/base/pipeline/jvance/pdx/control/2/jbrowse/data/tracks/chr1
tar cvfz control2.tar.gz control2
scp control2.tar.gz syoung@ngsdev.ccs.miami.edu:/tmp


ON NGSDEV:

cd /data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1
mv /tmp/test1.tar.gz ./
tar xvfz test1.tar.gz


cd /data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1
mv /tmp/test1.tar.gz ./
tar xvfz test1.tar.gz

cd /data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1
mv /tmp/test1.tar.gz ./
tar xvfz test1.tar.gz


cd /data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1
mv /tmp/test1.tar.gz ./
tar xvfz test1.tar.gz


AND EDIT trackInfo.js

emacs /data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/data/trackInfo.js


ADDING:


{
    "url" : "data/tracks/{refseq}/test1/trackData.json",
    "label" : "test1",
    "type" : "FeatureTrack",
    "key" : "test1"
},
{
    "url" : "data/tracks/{refseq}/test2/trackData.json",
    "label" : "test2",
    "type" : "FeatureTrack",
    "key" : "test2"
},
{
    "url" : "data/tracks/{refseq}/control1/trackData.json",
    "label" : "control1",
    "type" : "FeatureTrack",
    "key" : "control1"
},
{
    "url" : "data/tracks/{refseq}/control2/trackData.json",
    "label" : "control2",
    "type" : "FeatureTrack",
    "key" : "control2"
},




cd 


TEST 2
------

screen -S jbrowse-test2

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowse/jbrowseFeatures.pl \
--build hg19 \
--cluster LSF \
--filename out.bam \
--filetype bam \
--inputdir /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat \
--key test2 \
--label test2 \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/test/2/jbrowse \
--queue large \
--species human \
--username jgilbert

    jbrowseFeatures.pl    Run time: 00:06:36
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowse/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-10-04 22:46:25
    jbrowseFeatures.pl    ****************************************

cd /scratch/syoung/base/pipeline/jvance/pdx/test/2/jbrowse/data/tracks/chr1/test2
    
    -rw-rw-rw- 1 syoung root    6597 Oct  4 22:41 lazyfeatures-982000.json
    -rw-rw-rw- 1 syoung root   20214 Oct  4 22:41 lazyfeatures-983000.json
    -rw-rw-rw- 1 syoung root   14065 Oct  4 22:42 trackData.json


head trackData.json

    {"headers":["start","end","strand"],"histogramMeta":[{"basesPerBin":"1000","arrayParams":{"length":249241,"chunkSize":10000,"urlTemplate":"data/tracks/chr1/test2//hist-1000-{chunk}.json"}},{"basesPerBin":"100000","arrayParams":{"length":2493,"chunkSize":10000,"urlTemplate":"data/tracks/chr1/test2//hist-100000-{chunk}.json"}}],"lazyIndex":2,"featureCount":1221846,"histStats":[{"bases":"1000","max":247193,"mean":5.02512828948688},{"bases":2000,"max":252321,"mean":10.0502162556872},{"bases":5000,"max":331167,"mean":25.1252382194227},{"bases":10000,"max":354532,"mean":50.2494684052156},{"bases":20000,"max":355302,"mean":100.494904918559},{"bases":50000,"max":355302,"mean":251.247342026078},{"bases":100000,"max":355302,"mean":502.393902928199},{"bases":200000,"max":355307,"mean":1004.38492381716},{"bases":500000,"max":355465,"mean":2509.95591182365},{"bases":1000000,"max":355609,"mean":5009.872},{"bases":2000000,"max":355941,"mean":10019.744},{"bases":5000000,"max":356305,"mean":25049.36},{"bases":10000000,"max":357309,"mean":50098.72},{"bases":20000000,"max":511017,"mean":96343.6923076923},{"bases":50000000,"max":563418,"mean":250493.6},{"bases":100000000,"max":659883,"mean":417489.333333333},{"bases":200000000,"max":1133687,"mean":626234}],"key":"test2","featureNCList":[["10001",564929,{"chunk":"0"}],["564879",564930,{"chunk":"1000"}],
    ...
    ["249168446",249240608,{"chunk":"1221000"}]],"className":"feature","clientConfig":null,"arrowheadClass":null,"type":"FeatureTrack","label":"test2","sublistIndex":3,"lazyfeatureUrlTemplate":"data/tracks/chr1/test2//lazyfeatures-{chunk}.json"}



emacs lazyfeatures-983000.json

    [["173835800","173835849",-1],["173835800","173835849",-1],["173835800","173835849",-1],["173835800","173835849",-1],["173835800","173835849",-1],
    ...
    ["173835800","173835849",-1]]



TROUBLESHOOTING
---------------



PROBLEM

jbrowseFeatures.pl GIVES THIS ERROR WHEN RUNNING flatfile-to-json.pl

    No index file for /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr10/out.bam; try opening file with -autoindex at /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm line 1969
    
    flatfile-to-json.pl    Looking for refSeqs in data/refSeqs.js
    DOING db = Bio::DB::Sam->new('-bam' => /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr10/out.bam)


WHICH IS THE SAME AS THIS ENCOUNTERED EARLIER WHEN RUNNING flatfile-to-json.pl

    'No index file for .../out.bam' try opening file with -autoindex at ... /Bio/DB/Sam.pm line 1940


cd /nethome/syoung/.agua/Project1/Workflow1/jbrowse;
/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --bam /nethome/syoung/.agua/Project1/Workflow1/test1/chrY/out.bam --tracklabel test1 --key test1

	working on seq chrY
	No index file for /nethome/syoung/.agua/Project1/Workflow1/test1/chrY/out.bam; try opening file with -autoindex at /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm line 1940



DIAGNOSIS

emacs /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm

LINE 1940:

	sub bam_index {
		my $self = shift;
		return $self->{bai} ||= Bio::DB::Bam->index($self->{bam_path},$self->autoindex);
	}

SO NEED TO ADD THE -autoindex ARGUMENT DESCRIBED IN THE Sam.pm perldoc DOCUMENTATION

  -autoindex      Create a BAM index file if one does not exist
                   or the current one has a modification date
                   earlier than the BAM file.


SOLUTION

ADD -autoindex TO Bio::DB::Sam->new(args) CALL:

emacs /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl

EDIT LINE 144:

#print "DOING db = Bio::DB::Sam->new('-bam' => $bam)\n";
#    $db = Bio::DB::Sam->new('-bam' => $bam);
print "DOING db = Bio::DB::Sam->new('-bam' => $bam, '-autoindex' => 1)\n";
    $db = Bio::DB::Sam->new('-bam' => $bam, '-autoindex' => 1);



WHICH RAN:

cd /nethome/syoung/.agua/Project1/Workflow1/jbrowse;
/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --bam /nethome/syoung/.agua/Project1/Workflow1/test1/chrY/out.bam --tracklabel test1 --key test1


	...
	working on seq chrY
	[bam_index_build] creating index for /nethome/syoung/.agua/Project1/Workflow1/test1/chrY/out.bam


WHICH GENERATED *.json FILES IN

/nethome/syoung/.agua/Project1/Workflow1/jbrowse/data/tracks/chrY/test1/



LOCATIONS OF NECESSARY PACKAGES
-------------------------------

Bio/SeqFeature/Lite.pm
----------------------
/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8



JSON
-----
/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8


Bio/DB/Sam.pm
-------------
/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib


perl -e 'use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib"; use Bio::DB::Sam;'

perl -e 'use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8"; use Bio::DB::Sam;'


perl -e 'use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use Bio::DB::Sam;'


</entry>
<entry [Fri Oct  1 20:23:29 EDT 2010] COMPARE CONTROL 1 WITH LEMMON RUN 1 e31-2div >

TRANSCRIPTS GTF IS 23 MB FOR CONTROL 1, COMPARED TO 3.1 MB FOR THE LEMMON RUN

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr1

    -rwxrwxrwx  1 syoung root  948 Sep 29 09:32 bamToSam-chr1.sh
    -rw-rw-rw-  1 syoung root 1.6K Sep 29 09:33 bamToSam-chr1-stdout.txt
    -rwxrwxrwx  1 syoung root 1011 Sep 29 09:33 cufflinks-chr1.sh
    -rw-rw-rw-  1 syoung root 6.5M Sep 29 09:41 cufflinks-chr1-stdout.txt
    -rwxrwxrwx  1 syoung root 2.1K Sep 29 08:19 doBatchAlignment-chr1.sh
    -rw-rw-rw-  1 syoung root 3.2M Sep 29 09:41 genes.expr
    -rw-r--r--  1 syoung root 359M Sep 29 09:32 out.bam
    -rw-rw-rw-  1 syoung root 1.5G Sep 29 09:33 out.sam
    -rwxrwxrwx  1 syoung root  11K Sep 29 09:08 samToBam-chr1.sh
    -rw-rw-rw-  1 syoung root 2.8K Sep 29 09:10 samToBam-chr1-stdout.txt
    -rwxrwxrwx  1 syoung root 1.1K Sep 29 09:28 sortBam-chr1.sh
    -rw-rw-rw-  1 syoung root 1.6K Sep 29 09:32 sortBam-chr1-stdout.txt
    -rw-rw-rw-  1 syoung root 4.0M Sep 29 09:41 transcripts.expr
    -rw-rw-rw-  1 syoung root  23M Sep 29 09:41 transcripts.gtf


cd /nethome/bioinfo/data/sequence/labs/lemmon/run1/tophat/e31-2div/chr1

    -r--r--r--  1 syoung bioinfo 1016 Apr  8 06:42 bam2sam-chr1.sh
    -r--r--r--  1 syoung bioinfo 5.1K Apr  8 06:42 bam2sam-chr1-stdout.txt
    -r--r--r--  1 syoung bioinfo 2.1K Apr  8 06:42 chr1.sh
    -r--r--r--  1 syoung bioinfo 1.2K Apr  8 06:43 cufflinks-chr1.sh
    -r--r--r--  1 syoung bioinfo 2.2M Apr  8 06:43 cufflinks-chr1-stdout.txt
    -r--r--r--  1 syoung bioinfo  45K Apr  8 06:42 genes.expr
    -r--r--r--  1 syoung bioinfo 8.2K Apr  9 15:40 mergebam-chr1.sh
    -rw-------  1 syoung bioinfo 2.3K Apr  9 15:41 mergebam-chr1.sh.e251919
    -r--r--r--  1 syoung bioinfo 5.2K Apr  9 15:41 mergebam-chr1-stderr.txt
    -r--r--r--  1 syoung bioinfo  17K Apr  8 06:42 mergebam-chr1-stdout.txt
    -r--r--r--  1 syoung bioinfo    0 Apr  9 15:41 mergebam-chr1-usage.txt
    -r--r--r--  1 syoung bioinfo  13K Apr  8 06:42 sam2bam-chr1.sh
    -r--r--r--  1 syoung bioinfo 6.6K Apr  8 06:42 sam2bam-chr1-stdout.txt
    -r--r--r--  1 syoung bioinfo 126K Apr  8 06:42 transcripts.expr
    -r--r--r--  1 syoung bioinfo 3.1M Apr  8 06:42 transcripts.gtf



NB: MISSING EXPRESSION FILES FOR LEMBIX RUNS !!!

MISSING FOUR FROM RAT
---------------------

cd /nethome/lembix/data/tophat/rn4
ll
    
    drwxr-xr-x 66 root root 16384 May  1 21:07 drg0
    drwxr-xr-x 62 root root 16384 May  1 21:07 drg1
    drwxr-xr-x 76 root root 16384 Apr 30 14:13 drg3
    drwxr-xr-x 76 root root 16384 May  1 04:57 e27-16div
    drwxr-xr-x 77 root root 16384 May  1 05:04 e27-2div
    drwxr-xr-x 74 root root 16384 May  1 04:52 e31-16div
    drwxr-xr-x 63 root root 16384 May  1 21:09 e31-2div
    drwxr-xr-x 62 root root 16384 May  1 21:09 e41-2div
    
[lembix@u01 rn4]$ ll -h */chr1/transcripts.expr
    -rw-r--r-- 1 root root 160K Apr 30 13:03 drg3/chr1/transcripts.expr
    -rw-r--r-- 1 root root 122K May  1 03:51 e27-16div/chr1/transcripts.expr
    -rw-r--r-- 1 root root 119K May  1 03:45 e31-16div/chr1/transcripts.expr

[lembix@u01 rn4]$ ll -h */chr1/transcripts.gtf
    -rw-r--r-- 1 root root 3.7M Apr 30 13:03 drg3/chr1/transcripts.gtf
    -rw-r--r-- 1 root root 3.1M May  1 03:51 e27-16div/chr1/transcripts.gtf
    -rw-r--r-- 1 root root 3.0M May  1 03:46 e31-16div/chr1/transcripts.gtf




ALSO SOME MISSING FROM MOUSE
----------------------------

cd /nethome/lembix/data/tophat/mm9

ll
    drwxr-xr-x 37 root   root    16384 Apr 26 15:01 drg0
    drwxr-xr-x 39 root   root    16384 Apr 26 15:01 drg1
    drwxr-xr-x 37 root   root    16384 Apr 26 15:01 drg3
    drwxr-xr-x 37 root   root    16384 Apr 26 15:01 e27-16div
    drwxr-xr-x 37 root   root    16384 Apr 26 15:01 e27-2div
    drwxr-xr-x 37 root   root    16384 Apr 26 15:01 e31-16div
    drwxr-xr-x 75 syoung bioinfo 16384 Apr 26 15:01 e31-2div
    drwxr-xr-x 37 root   root    16384 Apr 26 15:01 e41-2div

ll -h */chr1/transcripts.expr

    -rw-r--r-- 1 root   root    150K Apr 20 14:07 drg0/chr1/transcripts.expr
    -rw-r--r-- 1 root   root    160K Apr 20 13:35 drg1/chr1/transcripts.expr
    -rw-r--r-- 1 root   root    160K Apr 19 03:36 drg3/chr1/transcripts.expr
    -rw-r--r-- 1 root   root    122K Apr 19 03:38 e27-16div/chr1/transcripts.expr
    -rw-r--r-- 1 root   root    119K Apr 19 03:40 e31-16div/chr1/transcripts.expr
    -rw-r--r-- 1 syoung bioinfo 126K Apr  8 01:15 e31-2div/chr1/transcripts.expr

ll -h */chr1/transcripts.gtf

    -rw-r--r-- 1 root   root    3.6M Apr 20 14:08 drg0/chr1/transcripts.gtf
    -rw-r--r-- 1 root   root    3.7M Apr 20 13:35 drg1/chr1/transcripts.gtf
    -rw-r--r-- 1 root   root    3.7M Apr 19 03:36 drg3/chr1/transcripts.gtf
    -rw-r--r-- 1 root   root    3.1M Apr 19 03:38 e27-16div/chr1/transcripts.gtf
    -rw-r--r-- 1 root   root    3.0M Apr 19 03:40 e31-16div/chr1/transcripts.gtf
    -rw-r--r-- 1 syoung bioinfo 3.1M Apr  8 01:15 e31-2div/chr1/transcripts.gtf

ll -h */chr1/genes.expr

    -rw-r--r-- 1 root   root    53K Apr 20 13:35 drg1/chr1/genes.expr
    -rw-r--r-- 1 root   root    52K Apr 19 03:36 drg3/chr1/genes.expr
    -rw-r--r-- 1 root   root    44K Apr 19 03:38 e27-16div/chr1/genes.expr
    -rw-r--r-- 1 root   root    44K Apr 19 03:40 e31-16div/chr1/genes.expr
    -rw-r--r-- 1 syoung bioinfo 45K Apr  8 01:15 e31-2div/chr1/genes.expr


NOTE: COPIES PRESENT IN /nethome/bioinfo/data/sequence/labs/lemmon
(WILL NOW ERASE)


cd /nethome/bioinfo/data/sequence/labs/lemmon
ll run*/tophat/*/chr1/genes.expr

-r--r--r-- 1 syoung bioinfo 45967 Apr  8 06:42 run1/tophat/e31-2div/chr1/genes.expr
-rw-r--r-- 1 syoung bioinfo 51766 Apr  8 10:53 run3/tophat/drg0/chr1/genes.expr
-rw-r--r-- 1 syoung bioinfo 53931 Apr  8 11:34 run3/tophat/drg1/chr1/genes.expr
-rw-r--r-- 1 syoung bioinfo 52326 Apr  9 16:23 run4/tophat/drg3/chr1/genes.expr
-rw-r--r-- 1 syoung bioinfo 44205 Apr  9 15:47 run4/tophat/e31-16div/chr1/genes.expr


ll run*/top*/*/chr1/transcripts.expr

-r--r--r-- 1 syoung bioinfo 128734 Apr  8 06:42 run1/tophat/e31-2div/chr1/transcripts.expr
-rw-r--r-- 1 syoung bioinfo 152789 Apr  8 10:53 run3/tophat/drg0/chr1/transcripts.expr
-rw-r--r-- 1 syoung bioinfo 162843 Apr  8 11:34 run3/tophat/drg1/chr1/transcripts.expr
-rw-r--r-- 1 syoung bioinfo 162857 Apr  9 16:22 run4/tophat/drg3/chr1/transcripts.expr
-rw-r--r-- 1 syoung bioinfo 121412 Apr  9 15:47 run4/tophat/e31-16div/chr1/transcripts.expr


ll run*/top*/*/chr1/transcripts.gtf

-r--r--r-- 1 syoung bioinfo 3249992 Apr  8 06:42 run1/tophat/e31-2div/chr1/transcripts.gtf
-rw-r--r-- 1 syoung bioinfo 3701014 Apr  8 10:53 run3/tophat/drg0/chr1/transcripts.gtf
-rw-r--r-- 1 syoung bioinfo 3839093 Apr  8 11:34 run3/tophat/drg1/chr1/transcripts.gtf
-rw-r--r-- 1 syoung bioinfo 3868147 Apr  9 16:22 run4/tophat/drg3/chr1/transcripts.gtf
-rw-r--r-- 1 syoung bioinfo 3103422 Apr  9 15:47 run4/tophat/e31-16div/chr1/transcripts.gtf


</entry>

<entry [Fri Oct  1 20:23:29 EDT 2010] RE-RUN TOPHAT WITH SEQUENCE CONVERTED TO FASTQ USING solidToFastq.pl (VERSION 0.02)>


CONTROL 2
---------

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat

screen -S control2

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat \
--label control2 \
--keep \
--cpus 4 \
--species human \
--cluster LSF \
--queue large \
--walltime 24 \
--clean \
&> /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/tophat.out

    TOPHAT.pl    Run time: 05:40:01
    TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    TOPHAT.pl    7:33AM, 3 October 2010
    TOPHAT.pl    ****************************************

    ####TOPHAT.pl    Run time: 02:22:41
    ####TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    ####TOPHAT.pl    2:48AM, 29 September 2010
    ####TOPHAT.pl    ****************************************


OUTPUT FILES OKAY:
    
    -rwxrwxrwx   1 syoung root  948 Oct  3 07:21 bamToSam-chr1.sh
    -rw-rw-rw-   1 syoung root 1.6K Oct  3 07:22 bamToSam-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root  967 Oct  3 07:23 cufflinks-chr1.sh
    -rw-rw-rw-   1 syoung root  23M Oct  3 07:32 cufflinks-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root 2.0K Sep 29 01:01 doBatchAlignment-chr1.sh
    -rw-rw-r--   1 syoung root 8.0M Oct  3 07:32 genes.expr
    -rw-r--r--   1 syoung root 222M Oct  3 07:21 out.bam
    -rw-rw-rw-   1 syoung root 749M Oct  3 07:22 out.sam
    -rwxrwxrwx   1 syoung root  44K Oct  3 06:16 samToBam-chr1.sh
    -rw-rw-rw-   1 syoung root 7.2K Oct  3 06:17 samToBam-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root 1.1K Oct  3 07:19 sortBam-chr1.sh
    -rw-rw-rw-   1 syoung root 1.6K Oct  3 07:21 sortBam-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root 2.0K Oct  3 03:34 tophatBatchAlignment-chr1.sh
    -rw-rw-r--   1 syoung root  10M Oct  3 07:32 transcripts.expr
    -rw-rw-r--   1 syoung root  54M Oct  3 07:32 transcripts.gtf

head -n 5 genes.expr

    gene_id bundle_id       chr     left    right   FPKM    FPKM_conf_lo    FPKM_conf_hi
    CUFF.1  304131  chr1    11013   11064   22.458  0       44.916
    CUFF.3  304129  chr1    10537   10602   26.4313 4.85024 48.0124
    CUFF.5  304133  chr1    11615   11668   43.2211 12.6592 73.783
    CUFF.7  304139  chr1    12657   12717   33.4063 8.1535  58.659


head -n 5 transcripts.expr

    trans_id        bundle_id       chr     left    right   FPKM    FMI     frac    FPKM_conf_lo    FPKM_conf_hi        coverage        length
    CUFF.1.1        304131  chr1    11013   11064   22.458  1       1       0       44.916  3.92157 51
    CUFF.3.1        304129  chr1    10537   10602   26.4313 1       1       4.85024 48.0124 4.61538 65
    CUFF.5.1        304133  chr1    11615   11668   43.2211 1       1       12.6592 73.783  7.54717 53
    CUFF.7.1        304139  chr1    12657   12717   33.4063 1       1       8.1535  58.659  5.83333 60

head -n 5 transcripts.gtf

    chr1    Cufflinks       transcript      11014   11064   1000    .       .       gene_id "CUFF.1"; transcript_id "CUFF.1.1"; FPKM "22.4579993316"; frac "1.000000"; conf_lo "0.000000"; conf_hi "44.915999"; cov "3.921569";
    chr1    Cufflinks       exon    11014   11064   1000    .       .       gene_id "CUFF.1"; transcript_id "CUFF.1.1"; exon_number "1"; FPKM "22.4579993316"; frac "1.000000"; conf_lo "0.000000"; conf_hi "44.915999"; cov "3.921569";
    chr1    Cufflinks       transcript      10538   10602   1000    .       .       gene_id "CUFF.3"; transcript_id "CUFF.3.1"; FPKM "26.4313376748"; frac "1.000000"; conf_lo "4.850241"; conf_hi "48.012435"; cov "4.615385";
    chr1    Cufflinks       exon    10538   10602   1000    .       .       gene_id "CUFF.3"; transcript_id "CUFF.3.1"; exon_number "1"; FPKM "26.4313376748"; frac "1.000000"; conf_lo "4.850241"; conf_hi "48.012435"; cov "4.615385";
    chr1    Cufflinks       transcript      11616   11668   1000    .       .       gene_id "CUFF.5"; transcript_id "CUFF.5.1"; FPKM "43.2210553173"; frac "1.000000"; conf_lo "12.659154"; conf_hi "73.782957"; cov "7.547170";



##DID CHOPFILE TEST - OKAY:
##
##chopfile /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.sequence.txt /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2-10000.sequence.txt 10000
##
##/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
##--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2-10000.sequence.txt \
##--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
##--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat \
##--label control2 \
##--keep \
##--cpus 4 \
##--species human \
##--cluster LSF \
##--queue large \
##--walltime 24 \
##--clean




TEST 1
------

NB: RERAN WITHOUT EXTRANEOUS --params "--mate-inner-dist 200" ARGUMENT AND GOT THE SAME RESULT

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat

screen -S test1

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat \
--label test1 \
--keep \
--cpus 4 \
--species human \
--cluster LSF \
--queue large \
--walltime 24 \
--clean \
&> /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/tophat.out


RUNNING
Sun Oct  3 08:10:39 EDT 2010
    
    TOPHAT.pl    Run time: 02:21:36
    TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    TOPHAT.pl    10:32AM, 3 October 2010
    TOPHAT.pl    ****************************************

    #TOPHAT.pl    Run time: 05:18:28
    #TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    #TOPHAT.pl    7:12AM, 3 October 2010
    #TOPHAT.pl    ****************************************

    ####TOPHAT.pl    Run time: 01:53:36
    ####TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    ####TOPHAT.pl    3:54AM, 29 September 2010
    ####TOPHAT.pl    ****************************************
    
    
OUTPUT FILES OKAY:

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr1

    -rwxrwxrwx   1 syoung root  936 Oct  3 07:10 bamToSam-chr1.sh
    -rw-rw-rw-   1 syoung root 1.6K Oct  3 07:10 bamToSam-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root  955 Oct  3 07:11 cufflinks-chr1.sh
    -rw-rw-rw-   1 syoung root 562K Oct  3 07:12 cufflinks-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root 2.1K Sep 29 02:31 doBatchAlignment-chr1.sh
    -rw-rw-rw-   1 syoung root 127K Oct  3 07:12 genes.expr
    -rw-r--r--   1 syoung root  46M Oct  3 07:09 out.bam
    -rw-rw-rw-   1 syoung root 170M Oct  3 07:10 out.sam
    -rwxrwxrwx   1 syoung root  42K Oct  3 06:13 samToBam-chr1.sh
    -rw-rw-rw-   1 syoung root 6.9K Oct  3 06:13 samToBam-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root 1.1K Oct  3 07:09 sortBam-chr1.sh
    -rw-rw-rw-   1 syoung root 1.5K Oct  3 07:09 sortBam-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root 2.0K Oct  3 03:32 tophatBatchAlignment-chr1.sh
    -rw-rw-rw-   1 syoung root 153K Oct  3 07:12 transcripts.expr
    -rw-rw-rw-   1 syoung root 873K Oct  3 07:12 transcripts.gtf


head genes.expr

    gene_id bundle_id       chr     left    right   FPKM    FPKM_conf_lo    FPKM_conf_hi
    CUFF.1  7357    chr1    19401   19451   48.3866 0       116.816
    CUFF.3  7355    chr1    16977   17027   72.5799 0       156.388
    CUFF.5  7361    chr1    23278   23328   145.16  26.6373 263.682
    CUFF.7  7483    chr1    717339  717389  193.546 56.6884 330.404
    CUFF.9  7493    chr1    804245  804313  44.4096 0       100.624
    CUFF.11 7511    chr1    1030489 1030539 120.967 12.7708 229.162
    CUFF.13 7513    chr1    1035000 1035129 103.15  40.9481 165.351
    CUFF.15 7519    chr1    1093277 1093327 48.3866 0       116.816
    CUFF.17 7531    chr1    1239459 1239509 193.546 56.6884 330.404


head transcripts.expr

    trans_id        bundle_id       chr     left    right   FPKM    FMI     frac    FPKM_conf_lo    FPKM_conf_hi        coverage        length
    CUFF.1.1        7357    chr1    19401   19451   48.3866 1       1       0       116.816 2       50
    CUFF.3.1        7355    chr1    16977   17027   72.5799 1       1       0       156.388 3       50
    CUFF.5.1        7361    chr1    23278   23328   145.16  1       1       26.6373 263.682 6       50
    CUFF.7.1        7483    chr1    717339  717389  193.546 1       1       56.6884 330.404 8       50
    CUFF.9.1        7493    chr1    804245  804313  44.4096 1       1       0       100.624 1.83562 68
    CUFF.11.1       7511    chr1    1030489 1030539 120.967 1       1       12.7708 229.162 5       50
    CUFF.13.1       7513    chr1    1035000 1035129 103.15  1       1       40.9481 165.351 4.26357 129
    CUFF.15.1       7519    chr1    1093277 1093327 48.3866 1       1       0       116.816 2       50
    CUFF.17.1       7531    chr1    1239459 1239509 193.546 1       1       56.6884 330.404 8       50


head transcripts.gtf

    chr1    Cufflinks       transcript      19402   19451   1000    .       .       gene_id "CUFF.1"; transcript_id "CUFF.1.1"; FPKM "48.3866126894"; frac "1.000000"; conf_lo "0.000000"; conf_hi "116.815617"; cov "2.000000";
    chr1    Cufflinks       exon    19402   19451   1000    .       .       gene_id "CUFF.1"; transcript_id "CUFF.1.1"; exon_number "1"; FPKM "48.3866126894"; frac "1.000000"; conf_lo "0.000000"; conf_hi "116.815617"; cov "2.000000";
    chr1    Cufflinks       transcript      16978   17027   1000    .       .       gene_id "CUFF.3"; transcript_id "CUFF.3.1"; FPKM "72.5799190341"; frac "1.000000"; conf_lo "0.000000"; conf_hi "156.387991"; cov "3.000000";
    chr1    Cufflinks       exon    16978   17027   1000    .       .       gene_id "CUFF.3"; transcript_id "CUFF.3.1"; exon_number "1"; FPKM "72.5799190341"; frac "1.000000"; conf_lo "0.000000"; conf_hi "156.387991"; cov "3.000000";
    chr1    Cufflinks       transcript      23279   23328   1000    .       .       gene_id "CUFF.5"; transcript_id "CUFF.5.1"; FPKM "145.1598380682"; frac "1.000000"; conf_lo "26.637327"; conf_hi "263.682350"; cov "6.000000";
    chr1    Cufflinks       exon    23279   23328   1000    .       .       gene_id "CUFF.5"; transcript_id "CUFF.5.1"; exon_number "1"; FPKM "145.1598380682"; frac "1.000000"; conf_lo "26.637327"; conf_hi "263.682350"; cov "6.000000";
    chr1    Cufflinks       transcript      717340  717389  1000    .       .       gene_id "CUFF.7"; transcript_id "CUFF.7.1"; FPKM "193.5464507576"; frac "1.000000"; conf_lo "56.688443"; conf_hi "330.404459"; cov "8.000000";
    chr1    Cufflinks       exon    717340  717389  1000    .       .       gene_id "CUFF.7"; transcript_id "CUFF.7.1"; exon_number "1"; FPKM "193.5464507576"; frac "1.000000"; conf_lo "56.688443"; conf_hi "330.404459"; cov "8.000000";
    chr1    Cufflinks       transcript      804246  804313  1000    .       .       gene_id "CUFF.9"; transcript_id "CUFF.9.1"; FPKM "44.4096298097"; frac "1.000000"; conf_lo "0.000000"; conf_hi "100.623920"; cov "1.835616";
    chr1    Cufflinks       exon    804246  804313  1000    .       .       gene_id "CUFF.9"; transcript_id "CUFF.9.1"; exon_number "1"; FPKM "44.4096298097"; frac "1.000000"; conf_lo "0.000000"; conf_hi "100.623920"; cov "1.835616";





TEST 2
------

cd /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat

screen -S test2

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/test/2/test2.sequence.txt \
--params "--mate-inner-dist 200" \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat \
--label test2 \
--keep \
--cpus 4 \
--species human \
--cluster LSF \
--queue large \
--clean \
--walltime 24 \
&> /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/tophat.out


    TOPHAT.pl    Run time: 05:13:36
    TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    TOPHAT.pl    7:08AM, 3 October 2010
    TOPHAT.pl    ****************************************

    ####TOPHAT.pl    Run time: 01:58:38
    ####TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    ####TOPHAT.pl    10:04AM, 29 September 2010
    ####TOPHAT.pl    ****************************************


OUTPUT FILES OKAY:
    
    -rwxrwxrwx   1 syoung root  936 Oct  3 07:05 bamToSam-chr1.sh
    -rw-rw-rw-   1 syoung root 1.6K Oct  3 07:05 bamToSam-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root  955 Oct  3 07:06 cufflinks-chr1.sh
    -rw-rw-rw-   1 syoung root 358K Oct  3 07:07 cufflinks-chr1-stdout.txt
    -rw-rw-rw-   1 syoung root  81K Oct  3 07:07 genes.expr
    -rw-r--r--   1 syoung root  52M Oct  3 07:05 out.bam
    -rw-rw-rw-   1 syoung root 190M Oct  3 07:05 out.sam
    -rwxrwxrwx   1 syoung root  43K Oct  3 05:49 samToBam-chr1.sh
    -rw-rw-rw-   1 syoung root 7.2K Oct  3 06:08 samToBam-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root 1.1K Oct  3 07:04 sortBam-chr1.sh
    -rw-rw-rw-   1 syoung root 1.6K Oct  3 07:05 sortBam-chr1-stdout.txt
    -rwxrwxrwx   1 syoung root 2.0K Oct  3 03:27 tophatBatchAlignment-chr1.sh
    -rw-rw-rw-   1 syoung root  97K Oct  3 07:07 transcripts.expr
    -rw-rw-rw-   1 syoung root 553K Oct  3 07:07 transcripts.gtf



head genes.expr
    gene_id bundle_id       chr     left    right   FPKM    FPKM_conf_lo    FPKM_conf_hi
    CUFF.1  4683    chr1    14574   14624   76.345  0       164.501
    CUFF.3  4687    chr1    23524   23574   152.69  28.0191 277.361
    CUFF.5  4689    chr1    29234   29284   76.345  0       164.501
    CUFF.7  4723    chr1    772932  772982  432.622 222.769 642.474
    CUFF.9  4725    chr1    804308  804358  203.587 59.6292 347.544
    CUFF.11 4733    chr1    962500  962550  356.277 165.839 546.715
    CUFF.13 4735    chr1    981098  981148  50.8967 0       122.875
    CUFF.15 4737    chr1    996515  996565  76.345  0       164.501
    CUFF.17 4745    chr1    1228863 1228913 50.8967 0       122.875

head transcripts.expr

    trans_id        bundle_id       chr     left    right   FPKM    FMI     frac    FPKM_conf_lo    FPKM_conf_hi        coverage        length
    CUFF.1.1        4683    chr1    14574   14624   76.345  1       1       0       164.501 3       50
    CUFF.3.1        4687    chr1    23524   23574   152.69  1       1       28.0191 277.361 6       50
    CUFF.5.1        4689    chr1    29234   29284   76.345  1       1       0       164.501 3       50
    CUFF.7.1        4723    chr1    772932  772982  432.622 1       1       222.769 642.474 17      50
    CUFF.9.1        4725    chr1    804308  804358  203.587 1       1       59.6292 347.544 8       50
    CUFF.11.1       4733    chr1    962500  962550  356.277 1       1       165.839 546.715 14      50
    CUFF.13.1       4735    chr1    981098  981148  50.8967 1       1       0       122.875 2       50
    CUFF.15.1       4737    chr1    996515  996565  76.345  1       1       0       164.501 3       50
    CUFF.17.1       4745    chr1    1228863 1228913 50.8967 1       1       0       122.875 2       50

head transcripts.gtf

    chr1    Cufflinks       transcript      14575   14624   1000    .       .       gene_id "CUFF.1"; transcript_id "CUFF.1.1"; FPKM "76.3450246119"; frac "1.000000"; conf_lo "0.000000"; conf_hi "164.500666"; cov "3.000000";
    chr1    Cufflinks       exon    14575   14624   1000    .       .       gene_id "CUFF.1"; transcript_id "CUFF.1.1"; exon_number "1"; FPKM "76.3450246119"; frac "1.000000"; conf_lo "0.000000"; conf_hi "164.500666"; cov "3.000000";
    chr1    Cufflinks       transcript      23525   23574   1000    .       .       gene_id "CUFF.3"; transcript_id "CUFF.3.1"; FPKM "152.6900492238"; frac "1.000000"; conf_lo "28.019146"; conf_hi "277.360952"; cov "6.000000";
    chr1    Cufflinks       exon    23525   23574   1000    .       .       gene_id "CUFF.3"; transcript_id "CUFF.3.1"; exon_number "1"; FPKM "152.6900492238"; frac "1.000000"; conf_lo "28.019146"; conf_hi "277.360952"; cov "6.000000";
    chr1    Cufflinks       transcript      29235   29284   1000    .       .       gene_id "CUFF.5"; transcript_id "CUFF.5.1"; FPKM "76.3450246119"; frac "1.000000"; conf_lo "0.000000"; conf_hi "164.500666"; cov "3.000000";
    chr1    Cufflinks       exon    29235   29284   1000    .       .       gene_id "CUFF.5"; transcript_id "CUFF.5.1"; exon_number "1"; FPKM "76.3450246119"; frac "1.000000"; conf_lo "0.000000"; conf_hi "164.500666"; cov "3.000000";
    chr1    Cufflinks       transcript      772933  772982  1000    .       .       gene_id "CUFF.7"; transcript_id "CUFF.7.1"; FPKM "432.6218061341"; frac "1.000000"; conf_lo "222.769406"; conf_hi "642.474206"; cov "17.000000";
    chr1    Cufflinks       exon    772933  772982  1000    .       .       gene_id "CUFF.7"; transcript_id "CUFF.7.1"; exon_number "1"; FPKM "432.6218061341"; frac "1.000000"; conf_lo "222.769406"; conf_hi "642.474206"; cov "17.000000";
    chr1    Cufflinks       transcript      804309  804358  1000    .       .       gene_id "CUFF.9"; transcript_id "CUFF.9.1"; FPKM "203.5867322984"; frac "1.000000"; conf_lo "59.629173"; conf_hi "347.544291"; cov "8.000000";
    chr1    Cufflinks       exon    804309  804358  1000    .       .       gene_id "CUFF.9"; transcript_id "CUFF.9.1"; exon_number "1"; FPKM "203.5867322984"; frac "1.000000"; conf_lo "59.629173"; conf_hi "347.544291"; cov "8.000000";
    

NOTES
-----


PROBLEM


CUFFLINKS GIVES THIS ERROR

    Error: cannot open SAM file control2 for reading

WHEN USING THIS RUN COMMAND


time /nethome/bioinfo/apps/CUFFLINKS/0.8.2/cufflinks \
--inner-dist-mean  \
--label control2 \
--num-threads 4 \
/scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr1/out.sam


DIAGNOSIS

1. HAVE TO REMOVE EMPTY --inner-dist-mean ARGUMENT

2. SOMETHING WRONG WITH CUFFLINKS INPUT BASED ON --label ARGUMENT??

/nethome/bioinfo/apps/CUFFLINKS/0.8.2/cufflinks
cufflinks v0.8.2
-----------------------------
Usage:   cufflinks <hits.sam>
Options:

-m/--inner-dist-mean         the average inner distance between mates              [ default:     45 ]
-s/--inner-dist-std-dev      the inner distance standard deviation                 [ default:     20 ]
-c/--collapse-rounds         rounds of pre-assembly alignment collapse             [ default:      1 ]
-F/--min-isoform-fraction    suppress transcripts below this abundance level       [ default:   0.15 ]
-f/--min-intron-fraction     Filter spliced alignments below this level            [ default:   0.05 ]
-j/--pre-mrna-fraction       suppress intra-intronic transcripts below this level  [ default:   0.15 ]
-I/--max-intron-length       ignore alignments with gaps longer than this          [ default: 300000 ]
-Q/--min-map-qual            ignore alignments with lower than this mapping qual   [ default:      0 ]
-L/--label                   all transcripts have this prefix in their IDs         [ default:   CUFF ]
-G/--GTF                     quantitate against reference transcript annotations                      
-p/--num-threads             number of threads used during assembly                [ default:      1 ]

Advanced Options:

--num-importance-samples     number of importance samples for MAP restimation      [ default:   1000 ]
--max-mle-iterations         maximum iterations allowed for MLE calculation        [ default:   5000 ]



SOLUTION

RUN WITHOUT --label ARGUMENT

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr1

time /nethome/bioinfo/apps/CUFFLINKS/0.8.2/cufflinks \
--inner-dist-mean  \
--num-threads 4 \
/scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr1/out.sam

    Counting hits in map
            Total map density: 46.607517
    Processing bundle [ chr1:566229-566279 ] with 1 non-redundant alignments
    Processing bundle [ chr1:566450-566500 ] with 1 non-redundant alignments
    Processing bundle [ chr1:566662-566712 ] with 1 non-redundant alignments
    Processing bundle [ chr1:567668-567718 ] with 1 non-redundant alignments
    ...
    
    OK!
    
    


</entry>

<entry [Fri Oct  1 20:23:29 EDT 2010] RE-CONVERT CSFASTA TO FASTQ WITH NEW solidToFastq.pl VERSION 0.02 >


TEST 1
------

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1
rm -fr test1.sh
emacs test1.sh
#!/bin/sh

#BSUB -W 24:00

/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/test/1/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt \
--label test1


RUN JOB

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1
chmod 755 test1.sh
bsub \
-e /scratch/syoung/base/pipeline/jvance/pdx/test/1/solidToFastq.err \
-o /scratch/syoung/base/pipeline/jvance/pdx/test/1/solidToFastq.out \
-q large \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sh ; date ; sleep 2; bjobs

    
    Job <1951340> is submitted to queue <large>.
    Sat Oct  2 03:02:18 EDT 2010    
    
    #Job <1951188> is submitted to queue <large>.
    #Fri Oct  1 20:39:35 EDT 2010
    #JOBID     USER    STAT  QUEUE      FROM_HOST   EXEC_HOST   JOB_NAME   SUBMIT_TIME
    #1951185   syoung  RUN   large      u01         n0254       *-chr22.sh Oct  1 20:37
    #1951188   syoung  RUN   large      u01         n0264       */test1.sh Oct  1 20:39
    
    
    #Run time: 06:17:19
    #Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl
    #7:56AM, 19 September 2010
    #****************************************


TEST 2
------

cd /scratch/syoung/base/pipeline/jvance/pdx/test/2
rm -fr test2.sh
emacs test2.sh
#!/bin/sh

#BSUB -W 24:00

/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/test/2/WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3.csfasta \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/test/1/test2.sequence.txt \
--label test2


RUN JOB

cd /scratch/syoung/base/pipeline/jvance/pdx/test/2
chmod 755 test2.sh
bsub \
-e /scratch/syoung/base/pipeline/jvance/pdx/test/2/solidToFastq.err \
-o /scratch/syoung/base/pipeline/jvance/pdx/test/2/solidToFastq.out \
-q large \
/scratch/syoung/base/pipeline/jvance/pdx/test/2/test2.sh ; date ; sleep 2; bjobs

    
    Job <1951339> is submitted to queue <large>.
    Sat Oct  2 03:01:29 EDT 2010
    
    #Run time: 05:07:03
    #Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl
    #6:48AM, 19 September 2010
    #****************************************


CONTROL 2
---------

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2
rm -fr control2.sh
emacs control2.sh
#!/bin/sh

#BSUB -W 24:00

/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.sequence.txt \
--label control2


RUN JOB

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2
chmod 755 control2.sh
bsub \
-e /scratch/syoung/base/pipeline/jvance/pdx/control/2/solidToFastq.err \
-o /scratch/syoung/base/pipeline/jvance/pdx/control/2/solidToFastq.out \
-q large \
/scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.sh ; date ; sleep 2; bjobs


    Job <1951338> is submitted to queue <large>.
    Sat Oct  2 03:00:30 EDT 2010

    #Job <1951190> is submitted to queue <large>.
    #Fri Oct  1 20:40:37 EDT 2010
    #JOBID     USER    STAT  QUEUE      FROM_HOST   EXEC_HOST   JOB_NAME   SUBMIT_TIME
    #1951185   syoung  RUN   large      u01         n0254       *-chr22.sh Oct  1 20:37
    #1951188   syoung  RUN   large      u01         n0264       */test1.sh Oct  1 20:39
    #1951189   syoung  RUN   large      u01         n0265       */test2.sh Oct  1 20:40
    #1951190   syoung  RUN   large      u01         n0265       *ntrol2.sh Oct  1 20:40
    
    #Run time: 05:47:03
    #Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl
    #7:28AM, 19 September 2010
    #****************************************





##ll /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt
##    -rw-rw-rw- 1 syoung root 21G Oct  2 00:39 /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt
##
##ll /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.sequence.txt
##    -rw-rw-rw- 1 syoung root 22G Oct  2 00:40 /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.sequence.txt
##
##ll /scratch/syoung/base/pipeline/jvance/pdx/test/1/test2.sequence.txt
##    -rw-rw-rw- 1 syoung root 21G Oct  2 00:40 /scratch/syoung/base/pipeline/jvance/pdx/test/1/test2.sequence.txt



##cd /scratch/syoung/base/pipeline/jvance/pdx
##ll */*/*sequence.txt
##
##    #-rw-rw-rw- 1 syoung root 27G Sep 19 07:28 control/2/control2.sequence.txt
##    #-rw-rw-rw- 1 syoung root 28G Sep 19 07:56 test/1/test1.sequence.txt
##    #-rw-rw-rw- 1 syoung root 23G Sep 19 06:48 test/1/test2.sequence.txt



</entry>

<entry [Fri Oct  1 15:15:01 EDT 2010] FASTQ TO CSFASTA CONVERTER>


http://seqanswers.com/forums/showthread.php?t=2360

I assume that the FASTQ qualities are in Sanger format and that the sequence is in color space (i.e adaptor + color calls).


use strict;
use warnings;

my $csfastq = shift;
die unless defined($csfastq);
my $csfasta = $csfastq; $csfasta =~ s/csfastq$/csfasta/;
die unless !($csfastq eq $csfasta);
my $qual = $csfastq; $qual =~ s/.csfastq$/_QV.qual/;
die unless !($csfastq eq $qual);

open(FHcsfastq, "$csfastq") || die;
open(FHcsfasta, ">$csfasta") || die;
open(FHqual, ">$qual") || die;
my $state = 0;
my ($n, $r, $q) = ("", "", "");
while(defined(my $line = <FHcsfastq>)) {
    chomp($line);
    if(0 == $state) {
        &print_out(\*FHcsfasta, \*FHqual, $n, $r, $q);
        $n = $line;
        $n =~ s/^\@/>/;
    }
    elsif(1 == $state) {
        $r = $line;
    }
    elsif(3 == $state) {
        $q = $line;
        # convert back from SANGER phred
        my $tmp_q = "";
        for(my $i=0;$i<length($q);$i++) {
            my $Q = ord(substr($q, $i, 1)) - 33;
            die unless (0 < $Q);
            if(0 < $i) {
                $tmp_q .= " ";
            }
            $tmp_q .= "$Q";
        }
        $q = $tmp_q;
    }
    $state = ($state+1)%4;
}
&print_out(\*FHcsfasta, \*FHqual, $n, $r, $q);
close(FHcsfasta);
close(FHcsfastq);
close(FHqual);

sub print_out {
    my ($FHcsfasta, $FHqual, $n, $r, $q) = @_;

    if(0 < length($n)) {
        print $FHcsfasta "$n\n$r\n";
        print $FHqual "$n\n$q\n";
    }
}


NOTES
-----

USE unpack AND pack TO CONVERT FASTER


perl -e 'my @arr = unpack("C*", "IIIIIIIIIIIIIIIIIIIIIIIIIII"); print @arr'
737373737373737373737373737373737373737373737373737373
$STRING = pack("C*", @ascii);


Converting Between ASCII Characters and Values
http://docstore.mik.ua/orelly/perl/cookbook/ch01_05.htm


Problem

You want to print out the number represented by a given ASCII character, or you want to print out an ASCII character given a number.

Solution

Use ord to convert a character to a number, or use chr to convert a number to a character:

$num  = ord($char);
$char = chr($num);
The %c format used in printf and sprintf also converts a number to a character:

$char = sprintf("%c", $num);                # slower than chr($num)
printf("Number %d is character %c\n", $num, $num);

Number 101 is character e

A C* template used with pack and unpack can quickly convert many characters.

@ASCII = unpack("C*", $string);
$STRING = pack("C*", @ascii);

Discussion

Unlike low-level, typeless languages like assembler, Perl doesn't treat characters and numbers interchangeably; it treats strings and numbers interchangeably. That means you can't just assign characters and numbers back and forth. Perl provides Pascal's chr and ord to convert between a character and its corresponding ordinal value:

$ascii_value = ord("e");    # now 101
$character   = chr(101);    # now "e"
If you already have a character, it's really represented as a string of length one, so just print it out directly using print or the %s format in printf and sprintf. The %c format forces printf or sprintf to convert a number into a character; it's not used for printing a character that's already in character format (that is, a string).

printf("Number %d is character %c\n", 101, 101);
The pack, unpack, chr, and ord functions are all faster than sprintf. Here are pack and unpack in action:

@ascii_character_numbers = unpack("C*", "sample");
print "@ascii_character_numbers\n";
115 97 109 112 108 101

$word = pack("C*", @ascii_character_numbers);
$word = pack("C*", 115, 97, 109, 112, 108, 101);   # same
print "$word\n";
sample
Here's how to convert from HAL to IBM:

$hal = "HAL";
@ascii = unpack("C*", $hal);
foreach $val (@ascii) {
    $val++;                 # add one to each ASCII value
}
$ibm = pack("C*", @ascii);
print "$ibm\n";             # prints "IBM"
The ord function can return numbers from 0 to 255. These correspond to C's unsigned char data type.





</entry>

<entry [Fri Oct  1 12:29:33 EDT 2010] CREATED VERSION 0.02 OF solidToFastq.pl USING 1ST-2ND BASE MAPPING>


1. CREATE INPUT FILES
(SEE: CONVERTED FROM *.sra FILE TO CSFASTQ
Fri Oct  1 12:45:26 EDT 2010
DOWNLOAD NA18507 DATA IN SRA FORMAT AND CONVERT INTO BOTH CSFASTA AND FASTQ)


cd /scratch/syoung/base/pipeline/jvance/pdx/solidtofastq


FASTQ

emacs SRR015374-short.fastq
@SRR015374.32 BARB_20071114_1_YorubanMP-BC4_1_12_520 length=25
CATACCAACCATGTGCATGTCTATG
+SRR015374.32 BARB_20071114_1_YorubanMP-BC4_1_12_520 length=25
*9('(''-7')5447%653%'45-/
@SRR015374.33 BARB_20071114_1_YorubanMP-BC4_1_12_580 length=25
ATATGTCAGATTGATAGGGTGTTTC
+SRR015374.33 BARB_20071114_1_YorubanMP-BC4_1_12_580 length=25
-(*%%%,1%-8<65''&%*/3.+8'
@SRR015374.34 BARB_20071114_1_YorubanMP-BC4_1_12_687 length=25
CTTTCATTATTCCACCCCACCTTCC
+SRR015374.34 BARB_20071114_1_YorubanMP-BC4_1_12_687 length=25
6<2'.'&..8-(&9'4*81+&/*87
@SRR015374.35 BARB_20071114_1_YorubanMP-BC4_1_12_1026 length=25
CGTTCCCGCAAAGGTCGCGAATGAA
+SRR015374.35 BARB_20071114_1_YorubanMP-BC4_1_12_1026 length=25
<<14;5:89;7<;/<<;8197;32)
@SRR015374.36 BARB_20071114_1_YorubanMP-BC4_1_12_1139 length=25
TTGAAACATTTTAAGTATGCAGTAT
+SRR015374.36 BARB_20071114_1_YorubanMP-BC4_1_12_1139 length=25
<<<9<<<:</:;<%33<<6;6:(5-


CSFASTA

emacs SRR015374-short_F3.csfasta
# Title: BARB_20071114_1_YorubanMP-BC4_
>SRR015374.32 1_12_520_F3
T2133101010131113131122331
>SRR015374.33 1_12_580_F3
T3333112122301233200111002
>SRR015374.34 1_12_687_F3
T2200213033020110001102020
>SRR015374.35 1_12_1026_F3
T2310200331002012333203120
>SRR015374.36 1_12_1139_F3
T0012001130003021331312133
>SRR015374.37 1_12_1563_F3
T3030022222222220021222320


QUAL

emacs SRR015374-short_F3_QV.qual
# Title: BARB_20071114_1_YorubanMP-BC4_
>SRR015374.32 1_12_520_F3
9 24 7 6 7 6 6 12 22 6 8 20 19 19 22 4 21 20 18 4 6 19 20 12 14 
>SRR015374.33 1_12_580_F3
12 7 9 4 4 4 11 16 4 12 23 27 21 20 6 6 5 4 9 14 18 13 10 23 6 
>SRR015374.34 1_12_687_F3
21 27 17 6 13 6 5 13 13 23 12 7 5 24 6 19 9 23 16 10 5 14 9 23 22 
>SRR015374.35 1_12_1026_F3
27 27 16 19 26 20 25 23 24 26 22 27 26 14 27 27 26 23 16 24 22 26 18 17 8 
>SRR015374.36 1_12_1139_F3
27 27 27 24 27 27 27 25 27 14 25 26 27 4 18 18 27 27 21 26 21 25 7 20 12 
>SRR015374.37 1_12_1563_F3
8 11 21 27 26 18 23 17 8 9 14 4 21 4 24 7 23 19 22 7 6 24 4 7 16 



2. CONVERT WITH solidToFastq.pl

cd /scratch/syoung/base/pipeline/jvance/pdx/solidtofastq

/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl \
--inputfile SRR015374-short_F3.csfasta \
--outputfile out.fastq \
--label solidToFastq



cat out.fastq 

    @solidToFastq:0:SRR015374.32 1:12:520#0
    CATACCAACCATGTGCATGTCTATG
    +solidToFastq:0:SRR015374.32 1:12:520#0
    *9('(''-7')5447%653%'45-/
    @solidToFastq:0:SRR015374.33 1:12:580#0
    ATATGTCAGATTGATAGGGTGTTTC
    +solidToFastq:0:SRR015374.33 1:12:580#0
    -(*%%%,1%-8<65''&%*/3.+8'
    @solidToFastq:0:SRR015374.34 1:12:687#0
    CTTTCATTATTCCACCCCACCTTCC
    +solidToFastq:0:SRR015374.34 1:12:687#0
    6<2'.'&..8-(&9'4*81+&/*87
    @solidToFastq:0:SRR015374.35 1:12:1026#0
    CGTTCCCGCAAAGGTCGCGAATGAA
    +solidToFastq:0:SRR015374.35 1:12:1026#0
    <<14;5:89;7<;/<<;8197;32)
    @solidToFastq:0:SRR015374.36 1:12:1139#0
    TTGAAACATTTTAAGTATGCAGTAT
    +solidToFastq:0:SRR015374.36 1:12:1139#0
    <<<9<<<:</:;<%33<<6;6:(5-
    @solidToFastq:0:SRR015374.37 1:12:1563#0
    AATTTCTCTCTCTCTTTCAGAGCTT
    +solidToFastq:0:SRR015374.37 1:12:1563#0


WHICH MATCHES PERFECTLY THE ORIGINAL FASTQ:

    @SRR015374.32 BARB_20071114_1_YorubanMP-BC4_1_12_520 length=25
    CATACCAACCATGTGCATGTCTATG
    +SRR015374.32 BARB_20071114_1_YorubanMP-BC4_1_12_520 length=25
    *9('(''-7')5447%653%'45-/
    @SRR015374.33 BARB_20071114_1_YorubanMP-BC4_1_12_580 length=25
    ATATGTCAGATTGATAGGGTGTTTC
    +SRR015374.33 BARB_20071114_1_YorubanMP-BC4_1_12_580 length=25
    -(*%%%,1%-8<65''&%*/3.+8'
    @SRR015374.34 BARB_20071114_1_YorubanMP-BC4_1_12_687 length=25
    CTTTCATTATTCCACCCCACCTTCC
    +SRR015374.34 BARB_20071114_1_YorubanMP-BC4_1_12_687 length=25
    6<2'.'&..8-(&9'4*81+&/*87
    @SRR015374.35 BARB_20071114_1_YorubanMP-BC4_1_12_1026 length=25
    CGTTCCCGCAAAGGTCGCGAATGAA
    +SRR015374.35 BARB_20071114_1_YorubanMP-BC4_1_12_1026 length=25
    <<14;5:89;7<;/<<;8197;32)
    @SRR015374.36 BARB_20071114_1_YorubanMP-BC4_1_12_1139 length=25
    TTGAAACATTTTAAGTATGCAGTAT
    +SRR015374.36 BARB_20071114_1_YorubanMP-BC4_1_12_1139 length=25
    <<<9<<<:</:;<%33<<6;6:(5-


NOTES
-----

FILES FOR TESTING SEQUENCE CONVERSION (NOT QUALITY)

CREATE *.csfastq FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sra/SRX000601/SRR003971
/nethome/syoung/base/apps/sra/sra_toolkit-1.0.0-b10/glibc.6/x86_64/fastq-dump -C -A SRR003971 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sra/SRX000601/SRR003971/SRR003971.sra

ll
    -rw-rw-r-- 1 syoung root 290M Oct  1 15:54 SRR003971_1.fastq
    -rw-rw-r-- 1 syoung root 290M Oct  1 15:54 SRR003971_2.fastq
    -rw-rw-r-- 1 syoung root  15M Oct  1 15:54 SRR003971.fastq
    -rw-rw-r-- 1 syoung root 1.4G Oct  1 15:48 SRR003971.sra

mv SRR003971_1.fastq SRR003971_1.csfastq
mv SRR003971_2.fastq SRR003971_2.csfastq



CREATE ORDINARY FASTQ FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sra/SRX000601/SRR003971
/nethome/syoung/base/apps/sra/sra_toolkit-1.0.0-b10/glibc.6/x86_64/fastq-dump -A SRR003971 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sra/SRX000601/SRR003971/SRR003971.sra
    
head SRR003971_1.fastq

    @SRR003971.1 FC20476AAXX_R1:8:1:199:368 length=36
    GAAAAGAAAAGAAGCTAGAGAGGGAAACATGGTTGC
    +SRR003971.1 FC20476AAXX_R1:8:1:199:368 length=36
    IIIIIIIIIIIIFIIIII1I.II?C3985?A9.15'
    @SRR003971.2 FC20476AAXX_R1:8:1:103:587 length=36
    GTAATTACGAAGCGTCCCACTGTGCTCATCTCAGGG
    +SRR003971.2 FC20476AAXX_R1:8:1:103:587 length=36
    IEIIIIIIIIIII0/I&A,;%I*$IC-#30%>1-,%
    @SRR003971.3 FC20476AAXX_R1:8:1:364:637 length=36
    GATGAGTTAAATTACCAAAATCAAAAGTGAAAGAAG

head SRR003971_2.fastq

    @SRR003971.1 FC20476AAXX_R1:8:1:199:368 length=36
    TTTTGCTGTTCCTTGAAGCATTCTCTTTATTGTGGA
    +SRR003971.1 FC20476AAXX_R1:8:1:199:368 length=36
    IIIIIIIIIIIIIF9+207.AI1F/I@A+B>*.)*#
    @SRR003971.2 FC20476AAXX_R1:8:1:103:587 length=36
    TCAATAAATTTGTGTTGCTTGAAGCCACTAAGTTTG
    +SRR003971.2 FC20476AAXX_R1:8:1:103:587 length=36
    1III.CIGIII,3@7IIG/I=,*/-74+&'&9(7/?
    @SRR003971.3 FC20476AAXX_R1:8:1:364:637


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sra/SRX000601/SRR003971
head *csfastq
    ==> SRR003971_1.csfastq <==
    @SRR003971.1 FC20476AAXX_R1:8:1:199:368 length=36
    T120002200022023232222200200113101013
    +SRR003971.1 FC20476AAXX_R1:8:1:199:368 length=36
    !IIIIIIIIIIIIFIIIII1I.II?C3985?A9.15'
    @SRR003971.2 FC20476AAXX_R1:8:1:103:587 length=36
    T113030313202331200112111322132221200
    +SRR003971.2 FC20476AAXX_R1:8:1:103:587 length=36
    !IEIIIIIIIIIII0/I&A,;%I*$IC-#30%>1-,%
    @SRR003971.3 FC20476AAXX_R1:8:1:364:637 length=36
    T123122103003031010003210002112002202
    
    ==> SRR003971_2.csfastq <==
    @SRR003971.1 FC20476AAXX_R1:8:1:199:368 length=36
    T000013211020201202313022220033011102
    +SRR003971.1 FC20476AAXX_R1:8:1:199:368 length=36
    !IIIIIIIIIIIIIF9+207.AI1F/I@A+B>*.)*#
    @SRR003971.2 FC20476AAXX_R1:8:1:103:587 length=36
    T021033003001111013201202301123021001
    +SRR003971.2 FC20476AAXX_R1:8:1:103:587 length=36
    !1III.CIGIII,3@7IIG/I=,*/-74+&'&9(7/?
    @SRR003971.3 FC20476AAXX_R1:8:1:364:637 length=36
    T010012232032000220033120000300000123


DOWNLOADED FASTQ FILES MATCH FASTQ FILES REGENERATED FROM *.sra FILE:


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/SRX000601
head *fastq
    ==> SRR003971_1.fastq <==
    @SRR003971.1 FC20476AAXX_R1:8:1:199:368
    GAAAAGAAAAGAAGCTAGAGAGGGAAACATGGTTGC
    +
    IIIIIIIIIIIIFIIIII1I.II?C3985?A9.15'
    @SRR003971.2 FC20476AAXX_R1:8:1:103:587
    GTAATTACGAAGCGTCCCACTGTGCTCATCTCAGGG
    +
    IEIIIIIIIIIII0/I&A,;%I*$IC-#30%>1-,%
    @SRR003971.3 FC20476AAXX_R1:8:1:364:637
    GATGAGTTAAATTACCAAAATCAAAAGTGAAAGAAG
    
    ==> SRR003971_2.fastq <==
    @SRR003971.1 FC20476AAXX_R1:8:1:199:368
    TTTTGCTGTTCCTTGAAGCATTCTCTTTATTGTGGA
    +
    IIIIIIIIIIIIIF9+207.AI1F/I@A+B>*.)*#
    @SRR003971.2 FC20476AAXX_R1:8:1:103:587
    TCAATAAATTTGTGTTGCTTGAAGCCACTAAGTTTG
    +
    1III.CIGIII,3@7IIG/I=,*/-74+&'&9(7/?
    @SRR003971.3 FC20476AAXX_R1:8:1:364:637
    TGGGTCTAGGCTTTTCTTTATGAAAAATTTTTTGAT







mkdir -p /scratch/syoung/base/pipeline/jvance/pdx/solidtofastq
cd /scratch/syoung/base/pipeline/jvance/pdx/solidtofastq

head -n 19 /scratch/syoung/base/pipeline/jvance/pdx/test/1/WT_GUNEYPD_20100219_solid0398_WT_57_F3_PD_04PM_F3.csfasta > WT_57_F3.csfasta
head -n 19 /scratch/syoung/base/pipeline/jvance/pdx/test/1/WT_GUNEYPD_20100219_solid0398_WT_57_F3_PD_04PM_F3_QV.qual > WT_57_F3_QV.qual



DOWNLOADED CLCBIO SOLID TEST FILES:

mkdir -p /scratch/syoung/base/pipeline/data/solid
cd /scratch/syoung/base/pipeline/data/solid
wget -c http://download.clcbio.com/testdata/raw_data/solid.zip
unzip *zip


DOWNLOADED SMALL RNA DATA SET FROM SOLiD

http://solidsoftwaretools.com/gf/project/srna/
Description
Total RNA was isolated from human tissue samples and subsequently fractionated using flashPAGE. The small RNA fraction was converted to double stranded DNA templates suitable for sequencing using the Applied Biosystems SOLiD� Small RNA Expression Kit. Subsequently small RNA libraries were clonally amplified by ePCR and run on a SOLiD� instrument. Each library generated between 40 and 45 million of 35 bp (colors) length reads for a total of 175 millions reads.


mkdir -p /scratch/syoung/base/pipeline/data/solid/mirna
cd /scratch/syoung/base/pipeline/data/solid/mirna
screen -S wget-mirna
wget http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3a_F3.csfasta.gz
wget http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3a_F3_QV.qual.gz

#wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3a_F3.csfasta.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3b_F3.csfasta.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3n_F3.csfasta.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC4a_F3.csfasta.gz
#wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3a_F3_QV.qual.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3b_F3_QV.qual.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3n_F3_QV.qual.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC4a_F3_QV.qual.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3a_F3.csfasta_extend.ma.35.2.all.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3b_F3.csfasta_extend.ma.35.2.all.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC3n_F3.csfasta_extend.ma.35.2.all.gz
wget -c http://download.solidsoftwaretools.com/srna/R1a007_20080206_1_ABNmi_BC4a_F3.csfasta_extend.ma.35.2.all.gz
wget -c




DOWNLOADED GEO RAW FILE (HOPEFULLY CONTAINS CSFASTA)

mkdir -p /scratch/syoung/base/pipeline/data/solid/geo
cd /scratch/syoung/base/pipeline/data/solid/geo
screen -S wget-geo
wget ftp://ftp.ncbi.nih.gov/pub/geo/DATA/supplementary/series/GSE20187/GSE20187_RAW.tar




2. CONVERT WITH BFAST'S solid2fastq

cd /scratch/syoung/base/pipeline/jvance/pdx/solidtofastq
/nethome/syoung/base/apps/bfast/0.6.4e/bin/solid2fastq WT_57_F3.csfasta WT_57_F3_QV.qual -o bfast-solidtofastq

    Usage: solid2fastq [options] <list of .csfasta files> <list of .qual files>
    
head bfast-solidtofastq.fastq

    @1_16_203
    T101..011.3.2.2..1..1..2.1320.22.0.230.......232..1
    +
    -<&!!'?)!)!8!'!!4!!&!!'!%1:&!)*!&!%6;!!!!!!!*,)!!%
    @1_16_249
    T311..211.3.2.0..2..3..0.0202.12.0.202.......222..0
    +
    (=)!!5%)!(!'!(!!&!!(!!)!00,'!''!+!'*&!!!!!!!('&!!(
    @1_16_328
    T233..111.0.1.1..1..3..2.0321.12.0.002.......001..1


WHAT??! DOESN'T CONVERT SEQUENCE INTO FASTQ..!




3. CONVERT WITH solidToFastq.pl

cd /scratch/syoung/base/pipeline/jvance/pdx/solidtofastq

/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl \
--inputfile WT_57_F3.csfasta \
--outputfile WT_57_F3.solidTofastq.fastq \
--label solidToFastq

    @solidToFastq:0:1:16:203#0
    ACNNACCNTNGNGNNCNNCNNGNCTGANGGNANGTANNNNNNNGTGNNC
    +solidToFastq:0:1:16:203#0
    <&!!'?)!)!8!'!!4!!&!!'!%1:&!)*!&!%6;!!!!!!!*,)!!%
    @solidToFastq:0:1:16:249#0
    CCNNGCCNTNGNANNGNNTNNANAGAGNCGNANGAGNNNNNNNGGGNNA
    +solidToFastq:0:1:16:249#0
    =)!!5%)!(!'!(!!&!!(!!)!00,'!''!+!'*&!!!!!!!('&!!(
    @solidToFastq:0:1:16:328#0
    TTNNCCCNANCNCNNCNNTNNGNATGCNCGNANAAGNNNNNNNAACNNC


4. CONVERT WITH BWA'S solid2fastq.pl

cd /scratch/syoung/base/pipeline/jvance/pdx/solidtofastq

/nethome/syoung/base/apps/bwa/0.5.0/solid2fastq.pl WT_57_ bwa-solid2fastq

    Usage: solid2fastq.pl <in.title> <out.prefix>

    Note: <in.title> is the string showed in the `# Title:' line of a
          ".csfasta" read file. Then <in.title>F3.csfasta is read sequence
          file and <in.title>F3_QV.qual is the quality file.


head bwa-solid2fastq.single.fastq 
@bwa-solid2fastq:1_16_203/1
ACNNACCNTNGNGNNCNNCNNGNCTGANGGNANGTANNNNNNNGTGNNC
+
<&-"-"'?)-")-"8-"'-"-"4-"-"&-"-"'-"%1:&-")*-"&-"%6;-"-"-"-"-"-"-"*,)-"-"%
@bwa-solid2fastq:1_16_249/1
CCNNGCCNTNGNANNGNNTNNANAGAGNCGNANGAGNNNNNNNGGGNNA
+
=)-"-"5%)-"(-"'-"(-"-"&-"-"(-"-")-"00,'-"''-"+-"'*&-"-"-"-"-"-"-"('&-"-"(
@bwa-solid2fastq:1_16_328/1
TTNNCCCNANCNCNNCNNTNNGNATGCNCGNANAAGNNNNNNNAACNNC


@control2:853_24_57/1
NNNNNNNNNGNNTAGNANNCNNNTTTTTNGGCNTNGNNANTTGTCCTNG
+
-"-"-"-"-"-"-"-"-"-"%-"-"%+.-"(-"-"&-"-"-"2+%''-"/.%-"%-"%-"-"%-"%1'1*,%-"%


COMPARED TO solidToFastq.pl VERSION 0.01

@control2:0:853:24:57#0
NNNNNNNNNGNNTAGNANNCNNNTTTTTNGGCNTNGNNANTTGTCCTNG
+control2:0:853:24:57#0
!!!!!!!!!%!!%+.!(!!&!!!2+%''!/.%!%!%!!%!%1'1*,%!%






NOTES
-----

BFAST'S solid2fastq USAGE:

/nethome/syoung/base/apps/bfast/0.6.4e/bin/solid2fastq 

    Usage: solid2fastq [options] <list of .csfasta files> <list of .qual files>
            -c              produce no output.
            -n      INT     number of reads per file.
            -o      STRING  output prefix.
            -j              input files are bzip2 compressed.
            -z              input files are gzip compressed.
            -J              output files are bzip2 compressed.
            -Z              output files are gzip compressed.
            -t      INT     trim INT bases from the 3' end of the reads.
            -b              Enable bwa output.
            -h              print this help message.


BWA'S solid2fastq.pl USAGE:

/nethome/syoung/base/apps/bwa/0.5.0/solid2fastq.pl 

    Usage: solid2fastq.pl <in.title> <out.prefix>
    
    Note: <in.title> is the string showed in the `# Title:' line of a
          ".csfasta" read file. Then <in.title>F3.csfasta is read sequence
          file and <in.title>F3_QV.qual is the quality file. If
          <in.title>R3.csfasta is present, this script assumes reads are
          paired; otherwise reads will be regarded as single-end.
    
          The read name will be <out.prefix>:panel_x_y/[12] with `1' for R3
          tag and `2' for F3. Usually you may want to use short <out.prefix>
          to save diskspace. Long <out.prefix> also causes troubles to maq.
      


PRELIMINARY DUMMY TEST SEQUENCES:


emacs solid.csfasta

>1
T2322312311312

emacs solid_QV.qual
>1
T2322312311312


EXPECTED BASE SEQUENCE:

A G C T C G T C G T G C A G



INPUT SEQUENCES FOR TEST FILES:


head -n 20 /scratch/syoung/base/pipeline/jvance/pdx/test/1/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta
# Sat Feb 27 17:12:12 2010 /share/apps/corona/bin/filter_fasta.pl --output=/data/results/solid0398/WT_GUNEYPD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379 --name=WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM --tag=F3 --minlength=50 --mincalls=25 --prefix=T /data/results/solid0398/WT_GUNEYPD_20100219_solid0398/WT_57_PD_04PM/jobs/postPrimerSetPrimary.2423/rawseq 
# Cwd: /home/pipeline
# Title: WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM
>1_16_203_F3
T101..011.3.2.2..1..1..2.1320.22.0.230.......232..1
>1_16_249_F3
T311..211.3.2.0..2..3..0.0202.12.0.202.......222..0
>1_16_328_F3
T233..111.0.1.1..1..3..2.0321.12.0.002.......001..1
>1_16_356_F3
T233..101.1.2.0..2..1..2.2101.32.0.000.......303..1
>1_16_455_F3
T101..011.3.2.0..1..1..0.1320.22.0.230.......032..1
>1_16_487_F3
T311..131.0.2.1..2..2..1.3211.21.0.201.......220..1
>1_16_502_F3
T233..011.0.1.1..3..3..2.0311.12.1.001.......011..1
>1_16_543_F3
T233..011.0.1.1..3..3..2.0311.12.1.022.......011..1
>1_17_27_F3

head -n 20 /scratch/syoung/base/pipeline/jvance/pdx/test/1/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3_QV.qual 
# Sat Feb 27 17:12:12 2010 /share/apps/corona/bin/filter_fasta.pl --output=/data/results/solid0398/WT_GUNEYPD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379 --name=WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM --tag=F3 --minlength=50 --mincalls=25 --prefix=T /data/results/solid0398/WT_GUNEYPD_20100219_solid0398/WT_57_PD_04PM/jobs/postPrimerSetPrimary.2423/rawseq 
# Cwd: /home/pipeline
# Title: WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM
>1_16_203_F3
12 27 5 -1 -1 6 30 8 -1 8 -1 23 -1 6 -1 -1 19 -1 -1 5 -1 -1 6 -1 4 16 25 5 -1 8 9 -1 5 -1 4 21 26 -1 -1 -1 -1 -1 -1 -1 9 11 8 -1 -1 4 
>1_16_249_F3
7 28 8 -1 -1 20 4 8 -1 7 -1 6 -1 7 -1 -1 5 -1 -1 7 -1 -1 8 -1 15 15 11 6 -1 6 6 -1 10 -1 6 9 5 -1 -1 -1 -1 -1 -1 -1 7 6 5 -1 -1 7 
>1_16_328_F3
25 29 8 -1 -1 5 11 8 -1 29 -1 7 -1 24 -1 -1 12 -1 -1 24 -1 -1 4 -1 26 26 6 13 -1 21 17 -1 4 -1 4 5 7 -1 -1 -1 -1 -1 -1 -1 11 9 8 -1 -1 6 
>1_16_356_F3
4 27 10 -1 -1 16 10 6 -1 13 -1 21 -1 4 -1 -1 13 -1 -1 16 -1 -1 4 -1 4 25 16 11 -1 9 10 -1 18 -1 6 13 5 -1 -1 -1 -1 -1 -1 -1 10 4 21 -1 -1 8 
>1_16_455_F3
23 27 4 -1 -1 18 30 12 -1 15 -1 19 -1 20 -1 -1 27 -1 -1 22 -1 -1 4 -1 17 27 22 7 -1 12 27 -1 4 -1 22 29 23 -1 -1 -1 -1 -1 -1 -1 12 17 10 -1 -1 4 
>1_16_487_F3
22 22 17 -1 -1 24 23 16 -1 14 -1 16 -1 11 -1 -1 12 -1 -1 5 -1 -1 4 -1 10 11 11 4 -1 6 26 -1 7 -1 4 23 18 -1 -1 -1 -1 -1 -1 -1 8 21 20 -1 -1 25 
>1_16_502_F3
25 27 13 -1 -1 27 19 6 -1 28 -1 19 -1 31 -1 -1 4 -1 -1 29 -1 -1 9 -1 27 29 12 22 -1 32 16 -1 4 -1 4 6 10 -1 -1 -1 -1 -1 -1 -1 9 4 5 -1 -1 14 
>1_16_543_F3
26 31 20 -1 -1 20 19 7 -1 31 -1 8 -1 31 -1 -1 8 -1 -1 31 -1 -1 21 -1 30 31 16 26 -1 29 27 -1 4 -1 4 8 10 -1 -1 -1 -1 -1 -1 -1 4 12 14 -1 -1 18 
>1_17_27_F3

head /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt

@test1:0:1:16:203#0
ACNNACCNTNGNGNNCNNCNNGNCTGANGGNANGTANNNNNNNGTGNNC
+test1:0:1:16:203#0
<&!!'?)!)!8!'!!4!!&!!'!%1:&!)*!&!%6;!!!!!!!*,)!!%
@test1:0:1:16:249#0
CCNNGCCNTNGNANNGNNTNNANAGAGNCGNANGAGNNNNNNNGGGNNA
+test1:0:1:16:249#0
=)!!5%)!(!'!(!!&!!(!!)!00,'!''!+!'*&!!!!!!!('&!!(
@test1:0:1:16:328#0
TTNNCCCNANCNCNNCNNTNNGNATGCNCGNANAAGNNNNNNNAACNNC



1ST-2ND BASE MAPPING FOR CSFASTA
--------------------------------

1ST
NUC     2ND NUC
    A   C   G   T
A   0   1   2   3
C   1   0   3   2
G   2   3   0   1
T   3   2   1   0


EXAMPLE

Sequence

Base   A G C T C G T C G T G C A G
Colour  2 3 2 2 3 1 2 3 1 1 3 1 2

Complement

Base   T C G A G C A G C A C G T C
Colour  2 3 2 2 3 1 2 3 1 1 3 1 2


DO tr CONVERSION

2322312311312

perl -e 'my $str = "2322312311312"; $str =~ tr/0123./ACGTN/; print $str'



emacs solid.csfasta
>1
T2322312311312


Sequence

Base   A G C T C G T C G T G C A G
Colour  2 3 2 2 3 1 2 3 1 1 3 1 2

Complement

Base   T C G A G C A G C A C G T C
Colour  2 3 2 2 3 1 2 3 1 1 3 1 2




emacs /scratch/syoung/base/pipeline/jvance/pdx/solidtofastq/test.csfasta

>853_24_57_F3
T..........2..302.0..1...33333.221.3.2..0.3323113.2
>853_24_185_F3
T..........0..002.2..0...03323.230.1.2..0.0110001.2



WHICH SHOULD GIVE THIS OUTPUT (BWA solid2fastq.pl):

@control2:853_24_57/1
NNNNNNNNNGNNTAGNANNCNNNTTTTTNGGCNTNGNNANTTGTCCTNG
+
-"-"-"-"-"-"-"-"-"-"%-"-"%+.-"(-"-"&-"-"-"2+%''-"/.%-"%-"%-"-"%-"%1'1*,%-"%



COMPARED TO solidToFastq.pl VERSION 0.01

@control2:0:853:24:57#0
NNNNNNNNNGNNTAGNANNCNNNTTTTTNGGCNTNGNNANTTGTCCTNG
+control2:0:853:24:57#0
!!!!!!!!!%!!%+.!(!!&!!!2+%''!/.%!%!%!!%!%1'1*,%!%




CONTENTS FOR TEST FILE TAKEN FROM:

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2/
head WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta

    # Sat Feb 27 17:12:12 2010 /share/apps/corona/bin/filter_fasta.pl --output=/data/results/solid0398/WT_GUNEYPD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379 --name=WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM --tag=F3 --minlength=50 --mincalls=25 --prefix=T /data/results/solid0398/WT_GUNEYPD_20100219_solid0398/WT_57_PD_04PM/jobs/postPrimerSetPrimary.2423/rawseq 
    # Cwd: /home/pipeline
    # Title: WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM
    >1_16_203_F3
    T101..011.3.2.2..1..1..2.1320.22.0.230.......232..1
    >1_16_249_F3
    T311..211.3.2.0..2..3..0.0202.12.0.202.......222..0
    >1_16_328_F3
    T233..111.0.1.1..1..3..2.0321.12.0.002.......001..1

 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3_QV.qual <==
# Thu Apr  8 14:30:12 2010 /share/apps/corona/bin/filter_fasta.pl --output=/data/results/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/primary.20100408201708800 --name=MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM --tag=F3 --minlength=50 --mincalls=25 --prefix=T /data/results/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/jobs/postPrimerSetPrimary.1447/rawseq 
# Cwd: /home/pipeline
# Title: MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM
>853_24_57_F3
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 4 -1 -1 4 10 13 -1 7 -1 -1 5 -1 -1 -1 17 10 4 6 6 -1 14 13 4 -1 4 -1 4 -1 -1 4 -1 4 16 6 16 9 11 4 -1 4 
>853_24_185_F3
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 7 -1 -1 6 18 19 -1 12 -1 -1 12 -1 -1 -1 21 23 21 6 20 -1 10 27 7 -1 13 -1 6 -1 -1 27 -1 17 21 23 30 28 25 13 -1 6 
>853_24_212_F3
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 27 -1 -1 25 30 31 -1 19 -1 -1 27 -1 -1 -1 16 25 13 6 17 -1 27 5 10 -1 5 -1 24 10 15 8 26 15 27 14 13 25 20 6 -1 11 
>853_24_278_F3


NOTE: THE COLOR SPACE SEQUENCE IS 2 BASES LONGER THAN THE QUALITY SEQUENCE

T101..011.3.2.2..1..1..2.1320.22.0.230.......232..1
*************************************************





</entry>

<entry [Wed Sep 29 01:59:03 EDT 2010] RE-RAN TOPHAT PIPELINE USING N-FILTERED DATA>


NB: MOVED FOLDERS FROM PREVIOUS RUN TO control1-failed, ETC.

mv /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat-failed
mv /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat-failed
mv /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat-failed
mv /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat-failed


CONTROL 1 (ILLUMINA/SOLEXA)
---------------------------

mv /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat-badformat

mkdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat
cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat

screen -S control1

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles "/scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1.nfilter.sequence.txt,/scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_2.nfilter.sequence.txt" \
--params "--mate-inner-dist 200 --solexa1.3-quals" \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat \
--label control1 \
--keep \
--cpus 4 \
--distance 200 \
--species human \
--cluster LSF \
--queue large \
--walltime 24

    TOPHAT::run    After printUsage       10-09-29 09:41:28
    TOPHAT.pl    Run time: 01:36:26
    TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    TOPHAT.pl    9:41AM, 29 September 2010
    TOPHAT.pl    ****************************************


cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat
ll */trans*

    -rw-rw-rw- 1 syoung root 2.4M Sep 29 09:35 chr10/transcripts.expr
    -rw-rw-rw- 1 syoung root  13M Sep 29 09:35 chr10/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.4M Sep 29 09:37 chr11/transcripts.expr
    -rw-rw-rw- 1 syoung root  14M Sep 29 09:37 chr11/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.4M Sep 29 09:37 chr12/transcripts.expr
    -rw-rw-rw- 1 syoung root  14M Sep 29 09:37 chr12/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.4M Sep 29 09:34 chr13/transcripts.expr
    -rw-rw-rw- 1 syoung root 7.2M Sep 29 09:34 chr13/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.6M Sep 29 09:35 chr14/transcripts.expr
    -rw-rw-rw- 1 syoung root 8.9M Sep 29 09:35 chr14/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.7M Sep 29 09:35 chr15/transcripts.expr
    -rw-rw-rw- 1 syoung root 9.4M Sep 29 09:35 chr15/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.0M Sep 29 09:37 chr16/transcripts.expr
    -rw-rw-rw- 1 syoung root  12M Sep 29 09:37 chr16/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.2M Sep 29 09:37 chr17/transcripts.expr
    -rw-rw-rw- 1 syoung root  13M Sep 29 09:37 chr17/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.1M Sep 29 09:40 chr18/transcripts.expr
    -rw-rw-rw- 1 syoung root 5.8M Sep 29 09:40 chr18/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.0M Sep 29 09:36 chr19/transcripts.expr
    -rw-rw-rw- 1 syoung root  13M Sep 29 09:36 chr19/transcripts.gtf
    -rw-rw-rw- 1 syoung root 4.0M Sep 29 09:41 chr1/transcripts.expr
    -rw-rw-rw- 1 syoung root  23M Sep 29 09:41 chr1/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.3M Sep 29 09:34 chr20/transcripts.expr
    -rw-rw-rw- 1 syoung root 7.0M Sep 29 09:34 chr20/transcripts.gtf
    -rw-rw-rw- 1 syoung root 734K Sep 29 09:34 chr21/transcripts.expr
    -rw-rw-rw- 1 syoung root 4.0M Sep 29 09:34 chr21/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.1M Sep 29 09:40 chr22/transcripts.expr
    -rw-rw-rw- 1 syoung root 6.2M Sep 29 09:40 chr22/transcripts.gtf
    -rw-rw-rw- 1 syoung root 3.5M Sep 29 09:40 chr2/transcripts.expr
    -rw-rw-rw- 1 syoung root  20M Sep 29 09:40 chr2/transcripts.gtf
    -rw-rw-rw- 1 syoung root 3.1M Sep 29 09:36 chr3/transcripts.expr
    -rw-rw-rw- 1 syoung root  18M Sep 29 09:36 chr3/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.3M Sep 29 09:36 chr4/transcripts.expr
    -rw-rw-rw- 1 syoung root  13M Sep 29 09:36 chr4/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.4M Sep 29 09:37 chr5/transcripts.expr
    -rw-rw-rw- 1 syoung root  13M Sep 29 09:37 chr5/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.5M Sep 29 09:36 chr6/transcripts.expr
    -rw-rw-rw- 1 syoung root  14M Sep 29 09:36 chr6/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.6M Sep 29 09:36 chr7/transcripts.expr
    -rw-rw-rw- 1 syoung root  15M Sep 29 09:36 chr7/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.1M Sep 29 09:38 chr8/transcripts.expr
    -rw-rw-rw- 1 syoung root  12M Sep 29 09:38 chr8/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.0M Sep 29 09:37 chr9/transcripts.expr
    -rw-rw-rw- 1 syoung root  12M Sep 29 09:37 chr9/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.7M Sep 29 09:36 chrX/transcripts.expr
    -rw-rw-rw- 1 syoung root 9.5M Sep 29 09:36 chrX/transcripts.gtf
    -rw-rw-rw- 1 syoung root 299K Sep 29 09:33 chrY/transcripts.expr
    -rw-rw-rw- 1 syoung root 1.7M Sep 29 09:33 chrY/transcripts.gtf


    OK!
    


CONTROL 2
---------

mv /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat-badformat

mkdir /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat
cd /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat

screen -S control2

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.nfilter.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat \
--label control2 \
--keep \
--cpus 4 \
--species human \
--cluster LSF \
--queue large \
--walltime 24 \
&> /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/tophat.out




ERROR:

VERY FEW HITS

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat



/scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.nfilter.sequence.txt


TEST 1
------


mv /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat-badformat

mkdir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat
cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat

screen -S test1


/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt \
--params "--mate-inner-dist 200" \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat \
--label test1 \
--keep \
--cpus 4 \
--distance 200 \
--species human \
--cluster LSF \
--queue large \
--walltime 24 \
&> /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/tophat.out
    
    TOPHAT.pl    Run time: 01:53:36
    TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    TOPHAT.pl    3:54AM, 29 September 2010
    TOPHAT.pl    ****************************************



    [Wed Sep 29 02:00:41 2010] Beginning TopHat run (v1.0.12)
    -----------------------------------------------
    [Wed Sep 29 02:00:41 2010] Preparing output location /scratch/syoung/base/pipeline/jvance/pdx/t\
    est/1/tophat/chrY/1/
    [Wed Sep 29 02:00:41 2010] Checking for Bowtie index files
    [Wed Sep 29 02:00:41 2010] Checking for reference FASTA file
    [Wed Sep 29 02:00:41 2010] Checking for Bowtie
            Bowtie version:          0.12.2.0
    [Wed Sep 29 02:00:41 2010] Checking reads
            seed length:     49bp
            format:          fastq
            quality scale:   --phred33-quals
    [Wed Sep 29 02:01:16 2010] Mapping reads against chrY with Bowtie
    [Wed Sep 29 02:02:27 2010] Joining segment hits
    [Wed Sep 29 02:02:28 2010] Searching for junctions via segment mapping
    Warning: junction database is empty!
    [Wed Sep 29 02:03:24 2010] Joining segment hits
    [Wed Sep 29 02:03:26 2010] Reporting output tracks
            [FAILED]
    Error: Report generation failed with err = 1
    Traceback (most recent call last):
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1518, in ?
        sys.exit(main())
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1490, in main
        params.gff_annotation)
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 936, in compile_reports
        exit(1)
    TypeError: 'str' object is not callable
    
    real    2m45.532s
    user    2m48.811s
    sys     0m1.967s
    

export PATH=/nethome/bioinfo/apps/BOWTIE/0.12.2:$PATH
export PATH=/nethome/bioinfo/apps/TOPHAT/0.1.12/bin:$PATH

time /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat \
--num-threads 1 \
--output-dir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt





GOT SAME ERROR WHEN RUN MANUALLY:




CHECKED LOGS:
    
cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/logs
ll -tr

    -rw-rw-rw- 1 syoung root    0 Sep 29 10:23 unspliced_bwt.log
    -rw-rw-rw- 1 syoung root   96 Sep 29 10:23 prep_reads.log
    -rw-rw-rw- 1 syoung root  743 Sep 29 10:24 segment_juncs.log
    -rw-rw-rw- 1 syoung root  337 Sep 29 10:24 long_spanning_reads.log
    -rw-rw-rw- 1 syoung root  104 Sep 29 10:24 reports.log
    -rw-rw-rw- 1 syoung root 4.1K Sep 29 10:24 run.log

    
tail *
    
    ==> long_spanning_reads.log <==
    long_spanning_reads v1.0.12
    --------------------------------------------
    Opening /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq for reading
    Opening /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads.bwtout for reading
    Loading spliced hits...done
    Loading junctions...done
    
    ==> prep_reads.log <==
    prep_reads v1.0.12
    ---------------------------
    5610 out of 1000000 reads have been filtered out
    
    ==> reports.log <==
    tophat_reports v1.0.12
    ---------------------------------------
    Error: cannot open map file  for reading
    
    ==> run.log <==
/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat --num-threads 1 --output-dir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1 /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt

/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/prep_reads -Q -q /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt > /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq


/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--phred33-quals -q \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq \
--max \
/dev/null -v 2 -p 1 -k 40 -m 40 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq \
| /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/fix_map_ordering \
--fastq /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq - > /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp/file64p5DA


# reads processed: 994390
# reads with at least one reported alignment: 0 (0.00%)
# reads that failed to align: 994390 (100.00%)
No alignments



TRY IT WITH JUST BOWTIE:

/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--phred33-quals -q \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq \
--max \
/dev/null -v 2 -p 1 -k 40 -m 40 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq

# reads processed: 994390
# reads with at least one reported alignment: 0 (0.00%)
# reads that failed to align: 994390 (100.00%)
No alignments



/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq \
-v 2 -p 1 -k 40 -m 40 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq


# reads processed: 994390
# reads with at least one reported alignment: 0 (0.00%)
# reads that failed to align: 994390 (100.00%)
No alignments


NOTE: READ FILE HAS STRANGE FASTQ HEADERS:

head /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq

    @101
    CCCAGACGTATATTNTAAGGNGGGATGCGGTGNCAGCTGANAAGGAAGG
    +test1:0:1:19:70#0
    %(%%%%&%%%%%%%!%%&%%!%%%%&%%%%%%!%(%%%%%!)'%%%(%'
    @104
    ATTGTCCATGGTAAGGTCGCGTAGGGTCTAAGNGATACACNAAGGTAAG
    +test1:0:1:19:131#0
    /&&'&9%7(%&&%%&7+,&%&%'%-9)&''%&!)(%,%(%!*5%('(%(
    @105
    TCCGCAAGCCGAGGAGTAGCACTGAATTTAGANATATATCNAAGGTAAG


WHICH THE UNPROCESSED READ FILE DOES NOT HAVE:


head /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt

    @test1:0:1:16:203#0
    ACNNACCNTNGNGNNCNNCNNGNCTGANGGNANGTANNNNNNNGTGNNC
    +test1:0:1:16:203#0
    <&!!'?)!)!8!'!!4!!&!!'!%1:&!)*!&!%6;!!!!!!!*,)!!%
    @test1:0:1:16:249#0
    CCNNGCCNTNGNANNGNNTNNANAGAGNCGNANGAGNNNNNNNGGGNNA
    +test1:0:1:16:249#0
    =)!!5%)!(!'!(!!&!!(!!)!00,'!''!+!'*&!!!!!!!('&!!(
    @test1:0:1:16:328#0
    TTNNCCCNANCNCNNCNNTNNGNATGCNCGNANAAGNNNNNNNAACNNC


head /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt
    
    @test1:0:1:16:203#0
    ACNNACCNTNGNGNNCNNCNNGNCTGANGGNANGTANNNNNNNGTGNNC
    +test1:0:1:16:203#0
    <&!!'?)!)!8!'!!4!!&!!'!%1:&!)*!&!%6;!!!!!!!*,)!!%
    @test1:0:1:16:249#0
    CCNNGCCNTNGNANNGNNTNNANAGAGNCGNANGAGNNNNNNNGGGNNA
    +test1:0:1:16:249#0
    =)!!5%)!(!'!(!!&!!(!!)!00,'!''!+!'*&!!!!!!!('&!!(
    @test1:0:1:16:328#0
    TTNNCCCNANCNCNNCNNTNNGNATGCNCGNANAAGNNNNNNNAACNNC



TRY IT WITHOUT THE READ PROCESSING:

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--phred33-quals -q \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq \
--max /dev/null \
-v 2 -p 1 -k 40 -m 40 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt

    
    test1:0:1:1126:1234#0   -       chrY    16292547        TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA  85:%)6<=%.(99%'/88&))2:%%'&6%')%1%%%)0%&))-%%('%!        2       4:T>G,5:T>G
    test1:0:1:1126:1234#0   -       chrY    27120786        TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA  85:%)6<=%.(99%'/88&))2:%%'&6%')%1%%%)0%&))-%%('%!        2       4:T>G,5:T>G
    test1:0:1:1126:1234#0   -       chrY    5505968 TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA       85:%)6<=%.(99%'/88&))2:%%'&6%')%1%%%)0%&))-%%('%!   2       4:T>G,5:T>G
    test1:0:1:1126:1234#0   +       chrY    14056462        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  !%'(%%-))&%0)%%%1%)'%6&'%%:2))&88/'%99(.%=<6)%:58        6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    17349376        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  !%'(%%-))&%0)%%%1%)'%6&'%%:2))&88/'%99(.%=<6)%:58        6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    25207820        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  !%'(%%-))&%0)%%%1%)'%6&'%%:2))&88/'%99(.%=<6)%:58        6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    26841566        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  !%'(%%-))&%0)%%%1%)'%6&'%%:2))&88/'%99(.%=<6)%:58        6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    5261696 TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !%'(%%-))&%0)%%%1%)'%6&'%%:2))&88/'%99(.%=<6)%:58   6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    22167960        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  !%'(%%-))&%0)%%%1%)'%6&'%%:2))&88/'%99(.%=<6)%:58        6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    15815334        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  !%'(%%-))&%0)%%%1%)'%6&'%%:2))&88/'%99(.%=<6)%:58        6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   -       chrY    14562320        TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA  85:%)6<=%.(99%'/88&))2:%%'&6%')%1%%%)0%&))-%%('%!        0       2:A>T,48:C>T
    # reads processed: 1000000
    # reads with at least one reported alignment: 1 (0.00%)
    # reads that failed to align: 999999 (100.00%)
    Reported 11 alignments to 1 output stream(s)




WITH SOLEXA QUALS:

  --phred33-quals    input quals are Phred+33 (default)
  --phred64-quals    input quals are Phred+64 (same as --solexa1.3-quals)
  --solexa-quals     input quals are from GA Pipeline ver. < 1.3
  --solexa1.3-quals  input quals are from GA Pipeline ver. >= 1.3

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--solexa-quals \
-q \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq \
--max /dev/null \
-v 2 -p 1 -k 40 -m 40 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt


    test1:0:1:1126:1234#0   -       chrY    27120786        TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA       "!"!!!"#!!!""!!!""!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!       2       4:T>G,5:T>G
    test1:0:1:1126:1234#0   -       chrY    5505968 TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA       "!"!!!"#!!!""!!!""!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!       2       4:T>G,5:T>G
    test1:0:1:1126:1234#0   -       chrY    16292547        TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA       "!"!!!"#!!!""!!!""!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!       2       4:T>G,5:T>G
    test1:0:1:1126:1234#0   +       chrY    15815334        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!""!!!""!!!#"!!!"!"       6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    14056462        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!""!!!""!!!#"!!!"!"       6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    17349376        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!""!!!""!!!#"!!!"!"       6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    25207820        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!""!!!""!!!#"!!!"!"       6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    26841566        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!""!!!""!!!#"!!!"!"       6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    5261696 TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!""!!!""!!!#"!!!"!"       6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   +       chrY    22167960        TCAACCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!""!!!""!!!#"!!!"!"       6       4:A>C,5:A>C
    test1:0:1:1126:1234#0   -       chrY    14562320        TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA       "!"!!!"#!!!""!!!""!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!       0       2:A>T,48:C>T
    # reads processed: 1000000
    # reads with at least one reported alignment: 1 (0.00%)
    # reads that failed to align: 999999 (100.00%)
    Reported 11 alignments to 1 output stream(s)




cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--solexa-quals \
-q \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq \
--max /dev/null \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt

    test1:0:1:1126:1234#0   -       chrY    21553391        TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA       "!"!!!"#!!!""!!!""!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!       0       0:C>A,37:C>T,38:G>T,39:G>T,40:A>T,41:C>T,42:A>T,43:G>T,44:A>T,46:C>T,47:G>T,48:G>T
    test1:0:1:1155:361#0    +       chrY    2198114 GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGCCGGGGGGGGGGG       %$"$#%$"#$"#!"$"!""!""""!$!!"""!!!!!!!"!!!!!#!!!"       0       21:A>G,25:A>G,29:A>G,31:A>G,33:A>G,35:A>G,36:G>C,37:A>C,39:A>G,41:A>G,43:A>G,45:A>G,47:A>G
    test1:0:1:1274:1257#0   -       chrY    7269590 TTTTTTTTCTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGTTTGCTCTTT       !!!!!!"!!!!"!!!!""!!!""!!!!!!!!!!!!!!!!!!!!!!!!!!       0       3:T>C,10:T>G,29:C>T,34:C>T,38:C>T,40:T>C,42:C>T,46:C>T
    test1:0:1:1504:1278#0   +       chrY    17647998        TAGCTTCAACTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!!!!!!!!!!!""!!!"!!       0       5:G>T,10:C>T,28:T>A,29:G>A,30:G>A,32:G>A,34:C>A,35:T>A,37:T>A,38:C>A,40:C>A,42:T>A,43:T>A,44:T>A,45:C>A,46:C>A,47:T>A,48:G>A
    test1:0:1:1771:1299#0   +       chrY    3073992 CAAGGAAAAAAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!""!!!""!!!"""!!#"!       0       14:G>A,28:C>A,36:C>A,38:C>A,39:T>A,41:C>A,42:C>A,43:C>A,44:T>A,45:T>A,46:T>A,47:C>A,48:C>A
    test1:0:1:1812:688#0    +       chrY    2442060 CGCGCGCGCGCGCGCGCGCGCCCGCGCACCCTCGCGCCGGCGGCCGGGC       $"""#""!!!#!!!""!"!!%!!!!"!!!!"!!!!"!!!!"!!!""!!!       0       17:A>G,21:A>C,29:A>C,30:T>C,31:A>T,32:T>C,34:T>C,35:A>G,36:T>C,37:G>C,38:T>G,40:T>C,42:C>G,43:A>C,44:T>C,46:C>G,47:A>G,48:T>C
    test1:0:2:294:219#0     +       chrY    2198114 GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGCCGGGCGG       !""#"##""$""!"""!!!!""""!"!!!"!"!!!!!"!!!!!!!!!!!       0       21:A>G,25:A>G,29:A>G,31:A>G,33:A>G,35:A>G,37:A>G,39:A>G,41:A>C,42:G>C,43:A>G,45:A>G,46:G>C,47:A>G
    test1:0:2:396:1166#0    +       chrY    16598666        TAAAAAATAGGAATAGAAAAAAAAAAAAAAAAAAGGAAAAAAAGGGAAG       "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       0       13:A>T,15:A>G,30:G>A,32:C>A,33:T>A,34:T>G,37:C>A,38:T>A,39:C>A,40:C>A,41:G>A,42:T>A,45:C>G,46:T>A,47:C>A,48:A>G
    test1:0:2:469:1449#0    -       chrY    27546102        TTTCTCTTTTTTTCTTTTTTTTTTTTTTTTTTTTTTTTCTTTTAATTTT       !!"!!!!"!!!!!!!!!"!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!       0       4:T>A,5:T>A,30:C>T,31:C>T,32:G>T,33:A>T,34:C>T,36:C>T,37:A>T,38:C>T,39:G>T,41:C>T,42:A>T,43:T>C,45:G>C,46:A>T,47:G>T
    test1:0:2:867:1543#0    -       chrY    1970680 TTTCTCTTTTTTTTTTTTTCGTTCTTTTTTTTTTCTTTCTTTTTGTTTC       !!"!!!!!!!!""!!!!"!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!!       0       4:T>G,10:T>C,28:T>G,29:T>C,30:C>T,34:A>T,35:G>T,37:G>T,39:C>T,40:C>T,42:G>T,43:G>C,44:A>T,47:A>T,48:A>T
    test1:0:2:984:1504#0    -       chrY    4021878 TTTTTCTTTTCTTTTTTTTCTTTTTTTTTTTTTCTTTTCTTTTCATTTT       !!!!!!"!!!!!!!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       0       1:C>T,4:T>A,28:G>T,29:T>C,30:G>T,31:G>T,32:G>T,35:C>T,36:A>T,37:G>T,38:T>C,42:C>T,44:A>T,45:G>T
    test1:0:2:1057:951#0    -       chrY    26286082        TTTTTTTTTTTTTTTTTTTTTTTATTTTATTTTATATTATTTTCATTTT       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       0       5:T>C,13:T>A,30:A>T,35:A>T,40:A>T,48:A>T
    test1:0:2:1097:1533#0   +       chrY    7645639 AAAAAGAAAAAAAAGAAAAAAAAAATAAAAAAAAAAAAAAAAAAAGAAA       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!"!!       0       22:G>A,25:A>T,28:G>A,33:C>A,35:G>A,39:T>A,40:G>A,43:G>A,45:A>G,46:G>A,47:G>A,48:G>A
    test1:0:2:1127:490#0    +       chrY    59084590        GGAACTAAAAGAAAATAAAATAAAATAAAAAAAAAAAAAAAAAAAAAAA       !!!!!#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       0       4:A>C,10:T>G,30:T>A,35:T>A,40:T>A,45:T>A
    test1:0:2:1398:1537#0   -       chrY    17895154        CTTCTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGCCTTTT       !!!!!!!!!!!!!!!!!"!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!       0       0:A>T,1:G>T,28:A>T,29:A>T,34:C>T,36:A>T,37:A>T,38:G>T,40:A>T,41:A>T,43:A>T,46:C>T,47:G>T,48:T>C
    test1:0:2:1482:1532#0   -       chrY    17431989        TTTTTCGTTTTTTTTTTTTTTTTTTTTTTTTTTATTTTTTTTGCTTTGC       !!"!!!!"!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       0       1:C>G,15:T>A,28:C>T,29:A>T,30:C>T,31:G>T,33:C>T,34:C>T,35:C>T,36:C>T,37:A>T,38:A>T,39:C>T,40:G>T,42:T>G,43:G>C,44:G>T,45:G>T,46:A>T,48:C>T
    test1:0:2:1528:949#0    -       chrY    16344525        CCCCTCCTTTCCCCCTCCTCCTCCTCCTCCTCCTCCTCCTCCTCCTCCT       "!!"!!"!!!""!##!"#"""!!"!#$!$"""$$$"!##""$"#$$$$"       0       19:T>C,32:T>C,35:T>C,36:T>C,38:T>C,40:C>T,41:C>T,42:T>C,45:T>C,47:T>C,48:T>C
    test1:0:2:1620:1622#0   -       chrY    20084455        CCCTTTCTTTTTTTCTTTTTTTTTTTTTTTTTTTCTTTCCTTTCTTTTT       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       0       19:C>T,24:C>T,29:C>T,39:C>T,42:T>C,44:C>T,46:T>C,47:T>C
    test1:0:2:1682:572#0    -       chrY    15971717        ATGTTTTTGTCTGTGATTATTTTGTTTGGTTTTTGTTTTTTTTGTTTTT       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"!!!!!       0       21:T>G,27:G>T,29:G>T,30:T>A,31:G>T,33:G>A,34:T>G,35:G>T,36:T>G,37:G>T,38:T>C,39:G>T,40:T>G,41:G>T,43:G>T,45:G>T,46:T>G,47:G>T,48:T>A
    test1:0:3:101:699#0     -       chrY    17203303        TTTTTTTTTTATTCTTTTTTTTTCTTTTTTTATTTTTTTTTTTTTCTGA       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       0       17:T>A,28:C>T,31:C>T,34:C>T,35:A>C,36:A>T,37:A>T,39:C>T,40:G>T,41:G>T,44:C>T,48:G>T
    test1:0:3:624:627#0     -       chrY    6091702 TTTCTTTTTTTTTCGATTTTTTTTTTGTTTTTTTATTTTTTTTTTTGCC       !!!!!!!!!!!!!!!!!!!!!!"!!!!"!!!""!!!!!!!!"$!"$$%#       0       14:T>A,22:T>G,31:A>T,32:C>T,34:C>G,38:C>T,42:A>T,43:C>T,44:A>T,45:T>C,46:G>T,47:G>T,48:A>T
    test1:0:3:899:380#0     -       chrY    24627844        CCGCGGGTATCCCTACGACGGAAATATGTCTAACGCACCGTGGTGCTTC       !!!"#!!!$#"!!!"#!!#$$!!$!$!!#""""$"#"!$!#$"#!""#$       0       10:T>C,20:G>T,28:A>G,29:A>G,30:A>C,32:T>G,33:T>C,34:C>A,35:G>T,36:T>C,38:T>C,39:G>T,41:G>T,43:T>G,45:A>C,46:A>G,47:T>C,48:G>C
    test1:0:3:1231:514#0    +       chrY    2442055 GCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGGCGGCGCG       $"""%#""#"$#!"$#!""$$#!!"#!"!"$!!!"#!!!""!!!"!!!!       0       22:A>G,26:A>G,32:A>G,34:A>G,35:T>C,36:A>G,37:T>C,39:T>C,40:A>G,41:T>G,42:G>C,43:T>G,45:T>C,48:A>G
    test1:0:3:1356:1232#0   -       chrY    2198095 GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGA       #!"##!!!#$%""#%%!!%$$###%$%$"#$%%!"$%%!#"%##"!#"!       0       4:A>G,8:A>G,30:C>G,33:C>G,34:A>G,36:A>G,38:A>G,40:A>G,41:C>G,43:A>G,44:A>G,46:A>G,48:A>G
    test1:0:3:1417:437#0    +       chrY    2442056 CGCGCGCGCGCGCGCGCGCGCGCGCGCGAGCGCGGGCGGGCGCGCGCGC       $##$"$"!$%%"""#%"""#$!!!!#!!!!"!!!!#!!!!#"!!"#!!!       0       21:A>G,25:A>G,28:C>A,31:A>G,33:A>G,34:T>G,35:A>G,36:T>C,38:T>G,39:A>G,40:T>C,42:T>C,44:T>C,47:A>G,48:T>C
    test1:0:3:1437:1412#0   -       chrY    659371  TTTTATTTTTTTTCCTTTACCTTTTTTTGCTTTTTTTTTTTTAACATAA       !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!""!!!"$"#!       0       6:T>A,20:T>G,28:T>C,29:G>C,31:A>T,33:A>T,36:G>T,37:A>T,39:C>T,46:A>T,47:G>T
    test1:0:3:1477:1286#0   +       chrY    2442056 CGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGGGGGCGCGCGGCG       %%%%#%"##$%##$%$#"##$"!$!""!!!"!!!!"!!!!#!!!!"!!!       0       21:A>G,25:A>G,31:A>G,33:A>G,34:T>C,35:A>G,36:T>G,38:T>G,39:A>G,40:T>C,42:T>C,44:T>C,46:C>G,47:A>C,48:T>G
    test1:0:3:1567:1231#0   +       chrY    2442055 GCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGCGGGGGCGGG       %"$$%$"$$"%"""""!""$#!!!!"!!!!$!!!#!!!"!!!!!!!!!!       0       22:A>G,26:A>G,32:A>G,34:A>G,35:T>C,36:A>G,37:T>C,39:T>C,40:A>G,41:T>G,43:T>G,45:T>C,47:C>G,48:A>G
    test1:0:3:1658:775#0    -       chrY    2198096 GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGAGGGGG       ""#""!"!""##"##$"####$$"#"""!"#""!""##!$!!%!!"!%!       0       1:A>G,9:A>G,31:C>G,34:C>G,35:A>G,37:A>G,39:A>G,41:A>G,42:C>G,44:A>G,45:A>G,47:A>G
    test1:0:4:732:1457#0    -       chrY    2198095 GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGAGGGT       #""$%"!"#%%#$$%%$"$$$%$$%%%%"$%%%!#$%%!!##%%$!!!!       0       0:A>T,8:A>G,30:C>G,33:C>G,34:A>G,36:A>G,38:A>G,40:A>G,41:C>G,43:A>G,44:A>G,46:A>G,48:A>G
    test1:0:4:1062:1696#0   -       chrY    2442035 CCCGCCCGCGCGCGCCCCCAGCGCGCGCGCGCGCGCGCGCGCGCGCACC       "!!!"!!!"!!!!!!!!!"!!!!#""!!#"!$#$!!#""$#$"$"$%""       0       0:G>C,6:A>G,29:T>A,30:G>C,31:T>C,32:G>C,33:T>C,34:G>C,35:T>G,36:G>C,37:T>G,38:G>C,39:T>G,40:G>C,41:T>G,42:G>C,43:T>C,44:G>C,45:T>G,46:G>C,47:T>C,48:G>C
    test1:0:4:1242:997#0    -       chrY    25883632        TTTGGTTTTTTCAGATCTTTTCTTTTTTTTTCTGTCCTTTTTTTTTTTA       !!!!!!"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       0       13:T>C,15:T>G,32:A>C,33:C>T,34:T>A,35:T>G,36:T>A,37:T>C,44:T>G,45:T>G
    test1:0:4:1711:1698#0   -       chrY    2198095 GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGA       !""$#!!"%$%!%%$#!"$%$#%$%$#$#%%$%!%%%%!!$%$!"#$#"       0       4:A>G,8:A>G,30:C>G,33:C>G,34:A>G,36:A>G,38:A>G,40:A>G,41:C>G,43:A>G,44:A>G,46:A>G,48:A>G
    test1:0:5:351:1796#0    -       chrY    2954847 TTTTCTGTGGTGTTGATGATCTGGTTCTGTTGTTGTTTACTTTGTTGCA       !!!#!!!!!!!!!!!!!!!!!!!""!!!"!!!!!!!!!!!!!!"!!!!"       0       13:C>T,25:T>G,30:C>A,31:T>G,33:C>A,35:A>T,36:C>T,37:A>G,38:C>T,40:T>G,41:C>T,42:T>G,45:G>T,46:A>T,47:C>T,48:A>T
    # reads processed: 1000000
    # reads with at least one reported alignment: 34 (0.00%)
    # reads that failed to align: 999966 (100.00%)
    Reported 34 alignments to 1 output stream(s)
    
    real    1m16.262s
    user    1m13.169s
    sys     0m0.813s





FAILED WITH SOLEXA 1.3 QUALS AND PHRED64-QUALS

  --phred33-quals    input quals are Phred+33 (default)
  --phred64-quals    input quals are Phred+64 (same as --solexa1.3-quals)
  --solexa-quals     input quals are from GA Pipeline ver. < 1.3
  --solexa1.3-quals  input quals are from GA Pipeline ver. >= 1.3


cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--solexa1.3-quals \
-q \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq \
--max /dev/null \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt

    Saw ASCII character 60 but expected 64-based Phred qual.
    Try not specifying --solexa1.3-quals/--phred64-quals.


cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--phred64-quals \
-q \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq \
--max /dev/null \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt

    Saw ASCII character 60 but expected 64-based Phred qual.
    Try not specifying --solexa1.3-quals/--phred64-quals.



USING --phred33-quals


cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--phred33-quals \
-q \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq \
--max /dev/null \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt
  
    test1:0:1:1126:1234#0   -       chrY    6092944 TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA       85:%)6<=%.(99%'/88&))2:%%'&6%')%1%%%)0%&))-%%('%!       0       0:G>A,4:C>G,45:C>T,46:G>T,47:G>T,48:A>T
    test1:0:1:1274:1257#0   -       chrY    7269590 TTTTTTTTCTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGTTTGCTCTTT       ()'%'280%-29+'%.8;%(+79%',45%(&&.%%)))%*))&%%%)%&       0       3:T>C,10:T>G,29:C>T,34:C>T,38:C>T,40:T>C,42:C>T,46:C>T
    test1:0:1:1771:1299#0   +       chrY    14075594        CAAGGAAAAAAGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA       (*)%%%).+'%'))&%.*1'%1*.&%<52&';81(%9;1)%<<7+%=94       0       2:T>A,11:A>G,43:G>A,44:G>A,45:G>A,47:C>A
    test1:0:2:396:1166#0    +       chrY    16598666        TAAAAAATAGGAATAGAAAAAAAAAAAAAAAAAAGGAAAAAAAGGGAAG       :%%%%%%%%!'%%%%+'%%%(%%%%%%%%%%(%%%%-%%%%1)%%%%&&       0       13:A>T,15:A>G,30:G>A,32:C>A,33:T>A,34:T>G,37:C>A,38:T>A,39:C>A,40:C>A,41:G>A,42:T>A,45:C>G,46:T>A,47:C>A,48:A>G
    test1:0:2:469:1449#0    -       chrY    19036700        TTTCTCTTTTTTTCTTTTTTTTTTTTTTTTTTTTTTTTCTTTTAATTTT       '2<%&%5:%%&13&((27%(028%%(-4%')'.%%%)2!%)'3&%1(+%       0       0:G>T,10:T>C,35:T>C,43:T>C,45:T>C,46:G>T,47:G>T,48:A>T
    test1:0:2:984:1504#0    +       chrY    14352995        AAAATGAAAAGAAAAGAAAAAAAAAAAAAGAAAAAAAAGAAAAGAAAAA       %&%%%%%'(%!*'%%%*&'&%,&(%%*.+%%7-+%%2'%%%37%%%4.(       0       4:A>T,20:G>A,28:G>A,29:A>G,32:G>A,36:C>A,38:A>G,40:C>A,43:A>G,45:G>A
    test1:0:2:1057:951#0    -       chrY    26286082        TTTTTTTTTTTTTTTTTTTTTTTATTTTATTTTATATTATTTTCATTTT       %&0%%%+1%%%%%%%%%'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       0       5:T>C,13:T>A,30:A>T,35:A>T,40:A>T,48:A>T
    test1:0:2:1097:1533#0   +       chrY    17919849        AAAAAGAAAAAAAAGAAAAAAAAAATAAAAAAAAAAAAAAAAAAAGAAA       %%&%%%&*'%%-)%%%*&'&%2)'%%45%(%,4*)%2/)+%:%%%%8.,       0       14:A>G,25:A>T,31:C>A,33:G>A,39:G>A,41:T>A,42:G>A,43:C>A,45:A>G,48:G>A
    test1:0:2:1127:490#0    +       chrY    59084590        GGAACTAAAAGAAAATAAAATAAAATAAAAAAAAAAAAAAAAAAAAAAA       -%%%%=%(%%%%(%%(%%%%)%%%%&%%%%(%&%%(%%&%+2,%%(2%%       0       4:A>C,10:T>G,30:T>A,35:T>A,40:T>A,45:T>A
    test1:0:2:1398:1537#0   -       chrY    7269590 CTTCTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGCCTTTT       %46%('54&0)41%%*39%%+37%%.14%'+%(%&%)%%'))%%%%&'%       0       4:T>C,29:C>T,34:C>T,38:C>T,42:C>T,45:T>C,46:C>T,48:T>C
    test1:0:2:1620:1622#0   -       chrY    20084455        CCCTTTCTTTTTTTCTTTTTTTTTTTTTTTTTTTCTTTCCTTTCTTTTT       '-%'-&%-141+%&&%(+)&-'3%+0'+(&.*,%%%)%!&*%&%%&)%%       0       19:C>T,24:C>T,29:C>T,39:C>T,42:T>C,44:C>T,46:T>C,47:T>C
    test1:0:3:101:699#0     -       chrY    17203303        TTTTTTTTTTATTCTTTTTTTTTCTTTTTTTATTTTTTTTTTTTTCTGA       %%'%%%('%%%%&%%%%%%%%%%%%%%%%%%%'%%%%%%%%%%.%!%%&       0       17:T>A,28:C>T,31:C>T,34:C>T,35:A>C,36:A>T,37:A>T,39:C>T,40:G>T,41:G>T,44:C>T,48:G>T
    test1:0:3:624:627#0     +       chrY    17731011        GGCAAAAAAAAAAATAAAAAAACAAAAAAAAAATCGAAAAAAAAAGAAA       >B@?9-@:6&%,(%%-<8(&%<'%%%:05&%&*%%%2)&%%.0%%%6(,       0       14:A>T,22:A>C,33:A>T,34:A>C,35:A>G,38:T>A,39:C>A,41:G>A,43:C>A,44:G>A,45:T>G,46:T>A,47:G>A,48:C>A
    test1:0:4:1242:997#0    -       chrY    25883632        TTTGGTTTTTTCAGATCTTTTCTTTTTTTTTCTGTCCTTTTTTTTTTTA       &'-%%%8%%(%&%%%%&'%%%%%%%%(%%%%)%%%%%%%%%(%%%%*%%       0       13:T>C,15:T>G,32:A>C,33:C>T,34:T>A,35:T>G,36:T>A,37:T>C,44:T>G,45:T>G
    # reads processed: 1000000
    # reads with at least one reported alignment: 14 (0.00%)
    # reads that failed to align: 999986 (100.00%)
    Reported 14 alignments to 1 output stream(s)
    
    real    1m17.134s
    user    1m14.174s
    sys     0m0.795s





TRY WITH ELAND
--------------

1. ADD PAIR INFORMATION TO AVOID THIS ERROR:

    ELAND_standalone.pl    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: single input-file specified, will do single read analysis
    ELAND_standalone.pl    DOING unpackInputFile(...)
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: deduced read length of 49 for data in /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt
    
    Could not identify pair information of the following line: test1:0:1:16:203#0 
    Please check your files.


sed -e 's/\(\#0\)/\1\/1/' < /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt > /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.simpleheader.1.txt

TEST

echo "test1:0:1:16:203#0"  | sed -e 's/\(\#0\)/\1\/1/'

    test1:0:1:16:203#0/1



screen -S eland-tophat

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1

/nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl \
--input-type fastq \
--multi \
--eland-genome /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chrY \
--input-file /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.simpleheader.1.txt











cd /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr22/1

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--un /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chr22/1/tmp//left_kept_reads_missing.fq \
-v 2 -p 1 -k 40 -m 40 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt


    test1:0:1:1126:1234#0   -       chr22   29460665        TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA  85:%)6<=%.(99%'/88&))2:%%'&6%')%1%%%)0%&))-%%('%!        0       2:A>T,5:T>G
    test1:0:1:1126:1234#0   -       chr22   46149258        TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGTTGA  85:%)6<=%.(99%'/88&))2:%%'&6%')%1%%%)0%&))-%%('%!        0       4:T>G,5:T>G
    # reads processed: 1000000
    # reads with at least one reported alignment: 1 (0.00%)
    # reads that failed to align: 999999 (100.00%)
    Reported 2 alignments to 1 output stream(s)




/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/long_spanning_reads --fastq --min-anchor 8 --splice-mismatches 0 --min-report-intron 50 --max-report-intron 500000 --min-isoform-fraction 0.15 --output-dir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/ --max-multihits 40 --segment-length 25 --segment-mismatches 2 --min-closure-exon 100 --min-closure-intron 50 --max-closure-intron 5000 --min-coverage-intron 50 --max-coverage-intron 20000 --min-segment-intron 50 --max-segment-intron 500000 --no-microexon-search /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq /dev/null /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads.bwtout  > /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp/file10q2iP

/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/segment_juncs --fastq --min-anchor 8 --splice-mismatches 0 --min-report-intron 50 --max-report-intron 500000 --min-isoform-fraction 0.15 --output-dir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/ --max-multihits 40 --segment-length 25 --segment-mismatches 2 --min-closure-exon 100 --min-closure-intron 50 --max-closure-intron 5000 --min-coverage-intron 50 --max-coverage-intron 20000 --min-segment-intron 50 --max-segment-intron 500000 --no-closure-search --no-microexon-search --ium-reads /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads_missing.fq /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chrY.fa /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//segment.juncs /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads.bwtout

/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/long_spanning_reads --fastq --min-anchor 8 --splice-mismatches 0 --min-report-intron 50 --max-report-intron 500000 --min-isoform-fraction 0.15 --output-dir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/ --max-multihits 40 --segment-length 25 --segment-mismatches 2 --min-closure-exon 100 --min-closure-intron 50 --max-closure-intron 5000 --min-coverage-intron 50 --max-coverage-intron 20000 --min-segment-intron 50 --max-segment-intron 500000 --no-closure-search --no-microexon-search /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq  /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/tmp//left_kept_reads.bwtout  > /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq.candidate_hits.sam

/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat_reports --fastq --min-anchor 8 --splice-mismatches 0 --min-report-intron 50 --max-report-intron 500000 --min-isoform-fraction 0.15 --output-dir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/ --max-multihits 40 --segment-length 25 --segment-mismatches 2 --min-closure-exon 100 --min-closure-intron 50 --max-closure-intron 5000 --min-coverage-intron 50 --max-coverage-intron 20000 --min-segment-intron 50 --max-segment-intron 500000 --no-closure-search --no-microexon-search junctions.bed accepted_hits.sam  /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/chrY/1/left_kept_reads.fq
    
    ==> segment_juncs.log <==
    Map covers 0 bases in sufficiently long segments
    Map contains 1 good islands
    0 are left looking bases
    0 are right looking bases
    Collecting potential splice sites in islands
    reporting synthetic splice junctions...
    Found 0 potential island-end pairing junctions
    done
    Reporting potential splice junctions...done
    Reported 0 total possible splices
    
    ==> unspliced_bwt.log <==





TEST 2
------


mv /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat-badformat
mkdir /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat
cd /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat

screen -S test2


/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/test/2/test2.sequence.txt \
--params "--mate-inner-dist 200" \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat \
--label test2 \
--keep \
--cpus 4 \
--distance 200 \
--species human \
--cluster LSF \
--queue large \
--walltime 24

    ...    
    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr2/doBatchAlignment-chr2.sh
    Job <1885699> is submitted to queue <large>.
    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr1/doBatchAlignment-chr1.sh
    Job <1885703> is submitted to queue <large>.
    Cluster::runJobs    Completed TOPHAT at 10-09-21 17:55:27, duration: 01:28:15
    
    
    
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    TOPHAT::run    After runTophat()   10-09-21 18:37:02
    TOPHAT::run    Doing STRATEGY 1: USE BAM FILE INTERMEDIARY
    TOPHAT::run    Doing subdirSamToBam     10-09-21 18:37:02
    Cluster::subdirSamToBam    DOING runJobs for 24 jobs
    Cluster::runJobs    Running 24 jobs
    Can't open script file: /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chrY/samToBam-chrY.sh

    TOPHAT.pl    Run time: 01:58:38
    TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
    TOPHAT.pl    10:04AM, 29 September 2010
    TOPHAT.pl    ****************************************



NOTES
-----


PROBLEM

CHECK MISSING TRANSCRIPT INFO: chr15, chr21, chr5, chr9:

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat
ll */trans*
    -rw-rw-rw- 1 syoung root 2.4M Sep 27 17:21 chr10/transcripts.expr
    -rw-rw-rw- 1 syoung root  13M Sep 27 17:21 chr10/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.4M Sep 27 17:23 chr11/transcripts.expr
    -rw-rw-rw- 1 syoung root  14M Sep 27 17:23 chr11/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.4M Sep 27 17:24 chr12/transcripts.expr
    -rw-rw-rw- 1 syoung root  14M Sep 27 17:24 chr12/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.4M Sep 27 17:20 chr13/transcripts.expr
    -rw-rw-rw- 1 syoung root 7.2M Sep 27 17:20 chr13/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.6M Sep 27 17:21 chr14/transcripts.expr
    -rw-rw-rw- 1 syoung root 8.9M Sep 27 17:21 chr14/transcripts.gtf
    -rw-rw-rw- 1 syoung root   90 Sep 27 17:19 chr15/transcripts.expr
    -rw-rw-rw- 1 syoung root    0 Sep 27 17:19 chr15/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.0M Sep 27 17:23 chr16/transcripts.expr
    -rw-rw-rw- 1 syoung root  12M Sep 27 17:23 chr16/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.2M Sep 27 17:23 chr17/transcripts.expr
    -rw-rw-rw- 1 syoung root  13M Sep 27 17:23 chr17/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.1M Sep 27 17:20 chr18/transcripts.expr
    -rw-rw-rw- 1 syoung root 5.8M Sep 27 17:20 chr18/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.0M Sep 27 17:23 chr19/transcripts.expr
    -rw-rw-rw- 1 syoung root  13M Sep 27 17:23 chr19/transcripts.gtf
    -rw-rw-rw- 1 syoung root 4.0M Sep 27 17:27 chr1/transcripts.expr
    -rw-rw-rw- 1 syoung root  23M Sep 27 17:27 chr1/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.3M Sep 27 17:21 chr20/transcripts.expr
    -rw-rw-rw- 1 syoung root 7.0M Sep 27 17:21 chr20/transcripts.gtf
    -rw-rw-rw- 1 syoung root   90 Sep 27 17:19 chr21/transcripts.expr
    -rw-rw-rw- 1 syoung root    0 Sep 27 17:19 chr21/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.1M Sep 27 17:21 chr22/transcripts.expr
    -rw-rw-rw- 1 syoung root 6.2M Sep 27 17:21 chr22/transcripts.gtf
    -rw-rw-rw- 1 syoung root 3.5M Sep 27 17:26 chr2/transcripts.expr
    -rw-rw-rw- 1 syoung root  20M Sep 27 17:26 chr2/transcripts.gtf
    -rw-rw-rw- 1 syoung root 3.1M Sep 27 17:22 chr3/transcripts.expr
    -rw-rw-rw- 1 syoung root  18M Sep 27 17:22 chr3/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.3M Sep 27 17:21 chr4/transcripts.expr
    -rw-rw-rw- 1 syoung root  13M Sep 27 17:21 chr4/transcripts.gtf
    -rw-rw-rw- 1 syoung root   90 Sep 27 17:19 chr5/transcripts.expr
    -rw-rw-rw- 1 syoung root    0 Sep 27 17:19 chr5/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.5M Sep 27 17:22 chr6/transcripts.expr
    -rw-rw-rw- 1 syoung root  14M Sep 27 17:22 chr6/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.6M Sep 27 17:22 chr7/transcripts.expr
    -rw-rw-rw- 1 syoung root  15M Sep 27 17:22 chr7/transcripts.gtf
    -rw-rw-rw- 1 syoung root 2.1M Sep 27 17:24 chr8/transcripts.expr
    -rw-rw-rw- 1 syoung root  12M Sep 27 17:24 chr8/transcripts.gtf
    -rw-rw-rw- 1 syoung root   90 Sep 27 17:19 chr9/transcripts.expr
    -rw-rw-rw- 1 syoung root    0 Sep 27 17:19 chr9/transcripts.gtf
    -rw-rw-rw- 1 syoung root 1.7M Sep 27 17:22 chrX/transcripts.expr
    -rw-rw-rw- 1 syoung root 9.5M Sep 27 17:22 chrX/transcripts.gtf
    -rw-rw-rw- 1 syoung root 299K Sep 27 17:19 chrY/transcripts.expr
    -rw-rw-rw- 1 syoung root 1.7M Sep 27 17:19 chrY/transcripts.gtf


SOLUTION

FIX WRONGLY LABELLED *fai FILES, E.G.:

cd /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools
head -n 1 chr15.fai

    ==> chr15.fai <==
    chr13   115169878       7       50      51

I.E., SHOULD BE 'chr15' INSIDE *.fai FILE


/nethome/bioinfo/apps/samtools/0.1.6/samtools faidx chr15.fa
mv chr15.fa.fai chr15.fai




</entry>

<entry [Tue Sep 28 23:39:27 EDT 2010] CHECK INSERT SIZE DISTRIBUTION OF CONTROL 1 WITH checkInsertSizes.pl>

1. TO PROVIDE '--mate-inner-dist' FOR TOPHAT.pl 

    E.G.: --params "--mate-inner-dist 200"

2. RUN ELAND_standalone.pl ON ONLY THE TOP --reads NUMBER OF READS FROM THE INPUT FILES



CONTROL 1
---------

mkdir -p /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland
cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland

/nethome/bioinfo/apps/agua/0.5/bin/apps/checkInsertSize.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1.nfilter.sequence.txt \
--matefile /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_2.nfilter.sequence.txt \
--genome /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland \
--lines 1000000

    
    Run time: 02:49:38
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/checkInsertSize.pl
    3:04AM, 29 September 2010
    ****************************************


/nethome/bioinfo/apps/agua/0.5/bin/apps/insertSize.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/reanalysis_1_export.txt \
--matefile /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/reanalysis_2_export.txt \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/insertsizes.txt \
--lines 100000


INSERT SIZE STATISTICS
----------------------
inputfile  : /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/reanalysis_1_export.txt
matefile   : /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/reanalysis_2_export.txt

median: 31
reads: 100000
mean: 182225
distance        count
21      1442
22      1401
23      1437
24      1528
25      1508
26      1533
27      1552
28      1510
29      1482
30      1575
31      1511
32      1433
33      1469
34      1346
35      1396
36      1355
37      1310
38      1182
39      1191
40      1204
41      1134




NOTES
-----

RUNNING checkInsertSize.pl WITH A SHORTENED INPUT FILE MITIGATES THE RISK OF FILES GOING MISSING WHILE ELAND IS RUNNING, AS HAPPENED HERE:



SCRIPT FILE
-----------
rm -fr /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/eland.sh
emacs /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/eland.sh
#!/bin/sh

#BSUB -W 48:00

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland

time /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl \
--input-type fastq \
--eland-genome /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland \
--input-file /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1.nfilter.sequence.txt \
--input-file /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_2.nfilter.sequence.txt \
&> /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/eland.out; date


tail /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/eland.out

    Successfully completed.
    
    Resource usage summary:
    
        CPU time   :  26667.13 sec.
        Max Memory :      2010 MB
        Max Swap   :      2241 MB
    
        Max Processes  :         6
        Max Threads    :         7







RUN SCRIPT
----------

chmod 755 /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/eland.sh

bsub -q small -e /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/eland.err -o /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/eland.out /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/eland.sh

    Job <1911739> is submitted to queue <small>.
    [syoung@u01 bowtie]$ date
    Mon Sep 27 23:44:54 EDT 2010
    [syoung@u01 bowtie]$ bjobs
    JOBID     USER    STAT  QUEUE      FROM_HOST   EXEC_HOST   JOB_NAME   SUBMIT_TIME
    1911516   syoung  RUN   large      u01         n0022       *9337_1.sh Sep 27 21:26
    1911518   syoung  RUN   large      u01         n0022       *9337_2.sh Sep 27 21:26
    1911521   syoung  RUN   large      u01         n0022       *2295_2.sh Sep 27 21:26
    1911522   syoung  RUN   large      u01         n0022       *2271_2.sh Sep 27 21:26
    1911739   syoung  PEND  small      u01                     */eland.sh Sep 27 23:44


FAILED WITH ERROR:

emacs /scratch/syoung/base/pipeline/jvance/pdx/control/1/eland/eland.out

    ...
    FileReader: unmapping 318 bytes of memory
    Scanning file /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chr10.fa:\
     User: 0s System: 0.007999s Actual: 0.007533s Efficiency: 106.186%
    Starting block: 16
    Error in FileReader: could not open file /nethome/bioinfo/data/sequence/chromosomes\
    /human/hg19/eland/chr10.fa.2bpb
    
    
    =======================================================================
    exit code: 256
    eland using ./reanalysis_2_eland_query.txt did not finish properly!
    
    Exiting...
    =======================================================================
    ...
    



BUT FILE EXISTS:

ll /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chr10.fa.2bpb

    -rwxr-xr-x 1 bioinfo bioinfo 33M Jun 30  2009 /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chr10.fa.2bpb







</entry>

<entry [Mon Sep 20 14:12:41 EDT 2010] CREATED polyAFilter.pl TO REMOVE POLY-A (MUST REMOVE IDENTICAL PAIRED READS)>


cd /scratch/syoung/base/pipeline/catfilter

/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/polyAFilter.pl \
--inputfile /scratch/syoung/base/pipeline/catfilter/srx001539-8.100reads.reads_1.fastq \
--outputfile /scratch/syoung/base/pipeline/catfilter//srx001539-8.100reads.nopolya.reads_1.fastq \
--rejectfile /scratch/syoung/base/pipeline/catfilter//srx001539-8.100reads.polya.reads_1.fastq

    Run time: 00:00:03
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/polyAFilter.pl
    12:38AM, 21 September 2010
    ****************************************


NOTES
-----

MAQ catfilter GIVES THIS ERRONEOUS OUTPUT WHEN IT COMES ACROSS A '@' INSIDE THE QUALITY VALUES

cd /scratch/syoung/base/pipeline/catfilter
/nethome/bioinfo/apps/maq/0.7.1/maq catfilter -1 srx001539-8.100reads.reads_2.fastq srx001539-8.100reads.reads_1.fastq

    ...
    FC20CMYAAXX:1:1:834:439III
    [seq_read_fastq] Inconsistent sequence name: IDE6I=/+=4E. Continue anyway.
    @IDE6I=/+=4E
    SRR.FCCMYAAXXAATATTCTAGGGTTTCATTCATTTTC
    +
    ...


ACTUAL READ:

@SRR005718.949 FC20CMYAAXX:1:1:786:83
TGTTCCTGAGCTTCAGTATGGAGAGA
+SRR005718.949 FC20CMYAAXX:1:1:786:83
IIIIH5IIAI?II@II88I=I4A3A2      <=============== HERE

@SRR005718.953 FC20CMYAAXX:1:1:929:646
TATAAACAATCTATCTGATCTCAATC
+SRR005718.953 FC20CMYAAXX:1:1:929:646
IIIIIIII=IIEIIIIIIIIIII;HF


USAGE

maq catfilter [-s] [-1 0] <in.fastq>\n

-s single read



PREPARE TEST FILE

mkdir -p /scratch/syoung/base/pipeline/catfilter
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/rerun/eland/SRX001539/10M
head -n 400 srx001539-8.reads_2.fastq > /scratch/syoung/base/pipeline/catfilter/srx001539-8.100reads.reads_2.fastq
head -n 400 srx001539-8.reads_1.fastq > /scratch/syoung/base/pipeline/catfilter/srx001539-8.100reads.reads_1.fastq


BACKUP

cd /scratch/syoung/base/pipeline/catfilter
cp srx001539-8.100reads.reads_2.fastq srx001539-8.100reads.reads_2.fastq-bkp
cp srx001539-8.100reads.reads_1.fastq srx001539-8.100reads.reads_1.fastq-bkp


cd /scratch/syoung/base/pipeline/catfilter
head *fastq
tail *fastq



[syoung@u02 catfilter]$ head *fastq

    ==> srx001539-8.100reads.reads_1.fastq <==
    @SRR005718.1 FC20CMYAAXX:1:1:697:785                        
    AAAAAAAAAAAAAAAAAAAAAAAAAA
    +SRR005718.1 FC20CMYAAXX:1:1:697:785                        
    IIIIIIIIIIIIIIIIIIIIIIIIII
    @SRR005718.13 FC20CMYAAXX:1:1:946:762                       
    GTTCTCTAAAATGGCTGCTCTGGAAG
    +SRR005718.13 FC20CMYAAXX:1:1:946:762                       
    IIIIIIIIIIIIIIIII:IEI.I/8;
    @SRR005718.25 FC20CMYAAXX:1:1:123:391                       
    TCCAAATAAATGTGTATTGTTTTATA
    
    ==> srx001539-8.100reads.reads_2.fastq <==
    @SRR005718.1 FC20CMYAAXX:1:1:697:785                        
    AAAAAAAAAAAAAAAAAAAAAAAAAA
    +SRR005718.1 FC20CMYAAXX:1:1:697:785                        
    IIIIIIIIIIIIIIIIIIIIIIIIII
    @SRR005718.13 FC20CMYAAXX:1:1:946:762                       
    TTAACATAGTAAGGGAAACAATATTC
    +SRR005718.13 FC20CMYAAXX:1:1:946:762                       
    IIIIIIIIIIIIIIIIIIIIIIIIII
    @SRR005718.25 FC20CMYAAXX:1:1:123:391                       
    AAACCTCCCTTATTACATTGAATACT


[syoung@u02 catfilter]$ tail *fastq

    ==> srx001539-8.100reads.reads_1.fastq <==
    +SRR005718.980 FC20CMYAAXX:1:1:834:439                      
    IIIIIIIIIIIIIIII?II=9I:I/0
    @SRR005718.985 FC20CMYAAXX:1:1:636:349                      
    GGCACATGTGAGCTGTTGGTAAACAA
    +SRR005718.985 FC20CMYAAXX:1:1:636:349                      
    II-IIIIIIIIIIII6III%I8II%7
    @SRR005718.1000 FC20CMYAAXX:1:1:367:199                     
    GGAGGCAGAGGTTGCAGTGAGCAGAG
    +SRR005718.1000 FC20CMYAAXX:1:1:367:199                     
    IIIIIIIIIIIIIIIIIIIIIIFI:I
    
    ==> srx001539-8.100reads.reads_2.fastq <==
    +SRR005718.980 FC20CMYAAXX:1:1:834:439                      
    IIIIIICIIHIICI@IDE6I=/+=4E
    @SRR005718.985 FC20CMYAAXX:1:1:636:349                      
    AATATTCTAGGGTTTCATTCATTTTC
    +SRR005718.985 FC20CMYAAXX:1:1:636:349                      
    <IIIIIDIIIIICIIE-I=H;1I:I*
    @SRR005718.1000 FC20CMYAAXX:1:1:367:199                     
    TTTCCACAGTCATTACAGGTATAAGG
    +SRR005718.1000 FC20CMYAAXX:1:1:367:199                     
    IIIIIIIIIIIIIIIIIIIIIIIIII



















</entry>

<entry [Sun Sep 19 23:28:18 EDT 2010] RAN nFilter.pl ON ALL SAMPLES>


TEST 1

screen -S test1
/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/nFilter.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.nfilter.sequence.txt \
--rejectfile /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.nfilter-reject.sequence.txt
        
    Run time: 01:32:43
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/nFilter.pl
    1:20PM, 21 September 2010
    ****************************************

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1
ls -alh test1.nfilter*txt
    -rw-rw-rw- 1 syoung root 1.4G Sep 21 13:20 test1.nfilter-reject.sequence.txt
    -rw-rw-rw- 1 syoung root  26G Sep 21 13:20 test1.nfilter.sequence.txt


TEST 2

screen -S test2
/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/nFilter.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/test/2/test2.sequence.txt \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/test/2/test2.nfilter.sequence.txt \
--rejectfile /scratch/syoung/base/pipeline/jvance/pdx/test/2/test2.nfilter-reject.sequence.txt
    
    ...
    160000000
    161000000

    Run time: 01:24:03
    Completed /nethome/bioinfo/apps/agua/0.5/bin/app
    s/readprep/nFilter.pl
    1:13PM, 21 September 2010
    ****************************************

    ##... 
    ##198000000


CONTROL 1

mv /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1_sequence.txt /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1.sequence.txt
mv /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_2_sequence.txt /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_2.sequence.txt

screen -S control1
/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/nFilter.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1.sequence.txt \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1.nfilter.sequence.txt \
--rejectfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1.nfilter-reject.sequence.txt \
--paired
    
    Run time: 00:19:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/nFilter.pl
    1:07PM, 21 September 2010
    ****************************************

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1
ll *sequence*
    
    -rw-rw-rw- 1 syoung root 208M Sep 21 13:07 s_1_1.nfilter-reject.sequence.txt
    -rw-rw-rw- 1 syoung root 3.4G Sep 21 13:07 s_1_1.nfilter.sequence.txt
    -rwxrwx--- 1 syoung root 3.6G Aug 31 10:55 s_1_1.sequence.txt
    -rw-rw-rw- 1 syoung root 212M Sep 21 13:07 s_1_2.nfilter-reject.sequence.txt
    -rw-rw-rw- 1 syoung root 3.5G Sep 21 13:07 s_1_2.nfilter.sequence.txt
    -rwxrwx--- 1 syoung root 3.7G Aug 31 10:56 s_1_2.sequence.txt


CONTROL 2

screen -S control2
/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/nFilter.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.sequence.txt \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.nfilter.sequence.txt \
--rejectfile /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.nfilter-reject.sequence.txt
    
    ...
    181000000
    182000000
    
    Run time: 01:30:56
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/nFilter.pl
    1:21PM, 21 September 2010
    ****************************************


cd /scratch/syoung/base/pipeline/jvance/pdx
ll */*/*sequence.txt
    
    -rw-rw-rw- 1 syoung root 208M Sep 21 13:07 control/1/s_1_1.nfilter-reject.sequence.txt
    -rw-rw-rw- 1 syoung root 3.4G Sep 21 13:07 control/1/s_1_1.nfilter.sequence.txt
    -rwxrwx--- 1 syoung root 3.6G Aug 31 10:55 control/1/s_1_1.sequence.txt
    -rw-rw-rw- 1 syoung root 212M Sep 21 13:07 control/1/s_1_2.nfilter-reject.sequence.txt
    -rw-rw-rw- 1 syoung root 3.5G Sep 21 13:07 control/1/s_1_2.nfilter.sequence.txt
    -rwxrwx--- 1 syoung root 3.7G Aug 31 10:56 control/1/s_1_2.sequence.txt
    -rwxrwx--- 1 syoung root 3.5G Sep 15 01:45 control/1.safe/s_1_2_sequence.txt
    -rw-rw-rw- 1 syoung root 207M Sep 21 13:21 control/2/control2.nfilter-reject.sequence.txt
    -rw-rw-rw- 1 syoung root  27G Sep 21 13:21 control/2/control2.nfilter.sequence.txt
    -rw-rw-rw- 1 syoung root  27G Sep 19 07:28 control/2/control2.sequence.txt
    -rw-rw-rw- 1 syoung root 1.4G Sep 21 13:20 test/1/test1.nfilter-reject.sequence.txt
    -rw-rw-rw- 1 syoung root  26G Sep 21 13:20 test/1/test1.nfilter.sequence.txt
    -rw-rw-rw- 1 syoung root  28G Sep 19 07:56 test/1/test1.sequence.txt
    -rw-rw-rw- 1 syoung root 286M Sep 21 13:13 test/2/test2.nfilter-reject.sequence.txt
    -rw-rw-rw- 1 syoung root  23G Sep 21 13:13 test/2/test2.nfilter.sequence.txt
    -rw-rw-rw- 1 syoung root  23G Sep 19 06:48 test/2/test2.sequence.txt
    
    ###-rw-rw-rw- 1 syoung root 208M Sep 20 12:45 control/1/s_1_1.nfilter-reject.sequence.txt
    ###-rw-rw-rw- 1 syoung root 3.4G Sep 20 12:45 control/1/s_1_1.nfilter.sequence.txt
    ###-rwxrwx--- 1 syoung root 3.6G Aug 31 10:55 control/1/s_1_1.sequence.txt
    ###-rw-rw-rw- 1 syoung root 208M Sep 20 12:45 control/1/s_1_2.nfilter-reject.sequence.txt
    ###-rw-rw-rw- 1 syoung root 3.5G Sep 20 12:45 control/1/s_1_2.nfilter.sequence.txt
    ###-rwxrwx--- 1 syoung root 3.7G Aug 31 10:56 control/1/s_1_2.sequence.txt
    ###-rwxrwx--- 1 syoung root 3.5G Sep 15 01:45 control/1.safe/s_1_2_sequence.txt
    ###
    ###-rw-rw-rw- 1 syoung root 207M Sep 20 13:11 control/2/control2.nfilter-reject.sequence.txt
    ###-rw-rw-rw- 1 syoung root  27G Sep 20 13:11 control/2/control2.nfilter.sequence.txt
    ###-rw-rw-rw- 1 syoung root  27G Sep 19 07:28 control/2/control2.sequence.txt
    ###
    ###-rw-rw-rw- 1 syoung root 1.4G Sep 20 13:10 test/1/test1.nfilter-reject.sequence.txt
    ###-rw-rw-rw- 1 syoung root  26G Sep 20 13:10 test/1/test1.nfilter.sequence.txt
    ###-rw-rw-rw- 1 syoung root  28G Sep 19 07:56 test/1/test1.sequence.txt
    ###-rw-rw-rw- 1 syoung root 286M Sep 20 13:07 test/2/test2.nfilter-reject.sequence.txt
    ###-rw-rw-rw- 1 syoung root  23G Sep 20 13:07 test/2/test2.nfilter.sequence.txt
    ###-rw-rw-rw- 1 syoung root  23G Sep 19 06:48 test/2/test2.sequence.txt








</entry>

<entry [Fri Sep 17 11:21:45 EDT 2010] RUN TRANSCRIPTOME PIPELINE (tophat)>


THIS RUN WAS HAMPERD BY LARGE-SCALE HARDWARE (I/O) FAILURES ON PEGASUS

PERHAPS AFFECTED BY THE HIHG SCHEDULES MAINTENANCE ON FRIDAY:

    
    -----Original Message-----
    From: HIHG Support 
    Sent: Friday, September 10, 2010 8:36 AM
    To: HIHGOutages
    Subject: FW: Friday, September 10th - Disk Storage outage
    Importance: High
    
    Reminder this is today......
    
    
    
    -----Original Message-----
    From: hpc@ccs.miami.edu [mailto:hpc@ccs.miami.edu] 
    Sent: Friday, September 03, 2010 4:07 PM
    To: Hulme, William
    Subject: Friday, September 10th - Disk Storage outage
    
    Greetings,
     
    In order to improve the service and allow future expansion of storage and equipment, next Friday, September 10th, is the scheduled date for the move of all storage systems from RSB2 to our co location facility NAP. For these reason, the following systems are going to be affected during working hours that day.
     
    Pegasus and Kronos clusters: HIHG storage is not going to be available, new jobs can?t be submitted, and running jobs have to finish before Friday 10th 8:00 am, otherwise such jobs still running will fail.
     
    All HIHG windows machines will not be able to access drives K: P: Q:, and R:
     
    All HIHG  linux/unix machines (mendels, darwins, Inti, solexa01, clio, crick) will not be able to access /q, /p, /k, /mihg/users, and /r  file systems
     
    Oracle databases plab, dlab, tlab, pclinc, dclinic, tclinic, and sclinic are going to remain down during the transfer.
     
    The move of the equipment will start Friday 10th at 8:00 am, and it will be extended through the day.
     
    Sorry for all the inconveniences this may produce, we will try to keep this outage to the minimum possible. If you have any question, please, don?t hesitate to contact hpc@ccs.miami.edu 
     
    Thank you for your understanding and cooperation
     
     
    HPC Team



CONTROL 1 (ILLUMINA/SOLEXA)
---------------------------

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1

	-rwxrwx--- 1 syoung root 3.6G Jun 15 14:58 s_1_1_sequence.txt
	-rwxrwx--- 1 syoung root 3.7G Jun 15 15:00 s_1_2_sequence.txt

mkdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat

screen -S control1

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles "/scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1_sequence.txt,/scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_2_sequence.txt" \
--params "--mate-inner-dist 200 --solexa1.3-quals" \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat \
--label control1 \
--keep \
--cpus 4 \
--distance 200 \
--species human \
--cluster LSF \
--queue large \
--walltime 24

    RUNNING
    Fri Sep 17 15:43:53 EDT 2010


WHICH RUNS

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21

export PATH=/nethome/bioinfo/apps/BOWTIE/0.12.2:$PATH
export PATH=/nethome/bioinfo/apps/TOPHAT/0.1.12/bin:$PATH

time /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat \
--num-threads 4 \
--mate-inner-dist 200 \
--solexa1.3-quals \
--output-dir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21 \
--mate-inner-dist 200 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1 \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21/control1_1.21.txt 



BUT THE RUN FAILED BECAUSE OF IO ERROR:

E.G.:

cat /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr1/1/doBatchAlignment-chr1-stdout.txt

    
    [Fri Sep 17 15:49:23 2010] Beginning TopHat run (v1.0.12)
    -----------------------------------------------
    [Fri Sep 17 15:49:23 2010] Preparing output location /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/1/
    [Fri Sep 17 15:49:23 2010] Checking for Bowtie index files
    [Fri Sep 17 15:49:23 2010] Checking for reference FASTA file
    [Fri Sep 17 15:49:23 2010] Checking for Bowtie
            Bowtie version:          0.12.2.0
    [Fri Sep 17 15:49:23 2010] Checking reads
            seed length:     75bp
            format:          fastq
            quality scale:   --solexa1.3-quals
    [Fri Sep 17 15:49:51 2010] Mapping reads against chr1 with Bowtie
    [Fri Sep 17 15:49:51 2010] Joining segment hits
    Traceback (most recent call last):
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1518, in ?
        sys.exit(main())
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1478, in main
        user_supplied_juncs)
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1281, in spliced_alignment
        segment_len)
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 971, in split_reads
        reads_file = open(reads_filename)
    IOError: [Errno 2] No such file or directory: '/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/1/tmp//left_kept_reads_missing.fq'
    
    real    0m29.957s
    user    0m20.991s
    sys     0m1.604s



CHECKED ALL OUTPUTS AND FOUND MOST SUBFILE RUNS HAD FAILED WITH I/O ERROR-RELATED MESSAGES:

LIKE
Error: Segment join failed with err = 1

AND

OSError: [Errno 2] No such file or directory: '/scratch/syoung/base/pipeline/jvance/pdx/control/1/t\
ophat/13/tmp//left_kept_reads.bwtout

AND

IOError: [Errno 116] Stale NFS file handle: '/scratch/syoung/base/pipeline/jvance/pdx/control/1/top\
hat/19/tmp/fileMUnfT8'



cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr1
tail -n 30 */doBatch*

    ==> 10/doBatchAlignment-chr1-stdout.txt <==
    -----------------------------------------------
    [Fri Sep 17 15:49:28 2010] Preparing output location /scratch/syoung/base/pipeline/jvance/pdx/contr\
    ol/1/tophat/10/
    [Fri Sep 17 15:49:28 2010] Checking for Bowtie index files
    [Fri Sep 17 15:49:28 2010] Checking for reference FASTA file
    [Fri Sep 17 15:49:28 2010] Checking for Bowtie
            Bowtie version:          0.12.2.0
    [Fri Sep 17 15:49:28 2010] Checking reads
            seed length:     75bp
            format:          fastq
            quality scale:   --solexa1.3-quals
    [Fri Sep 17 15:50:17 2010] Mapping reads against chr1 with Bowtie
    [Fri Sep 17 15:51:34 2010] Joining segment hits
            Splitting reads into 3 segments
    [Fri Sep 17 15:51:56 2010] Mapping reads against chr1 with Bowtie
    [Fri Sep 17 15:53:07 2010] Mapping reads against chr1 with Bowtie
    [Fri Sep 17 15:53:34 2010] Mapping reads against chr1 with Bowtie
    Traceback (most recent call last):
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1518, in ?
        sys.exit(main())
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1478, in main
        user_supplied_juncs)
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1295, in spliced_alignment
        seg)
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 767, in bowtie
        bowtie_proc = subprocess.Popen(bowtie_cmd, stdout=subprocess.PIPE, stderr=open(bwt_map+".log","\
    w"))
    IOError: [Errno 116] Stale NFS file handle: '/scratch/syoung/base/pipeline/jvance/pdx/control/1/top\
    hat/10/tmp/fileEbAoFV.log'
    
    real    4m7.005s
    user    9m31.040s
    sys     0m13.864s
    
    ==> 11/doBatchAlignment-chr1-stdout.txt <==
    
    [Fri Sep 17 15:49:35 2010] Beginning TopHat run (v1.0.12)
    -----------------------------------------------
    [Fri Sep 17 15:49:35 2010] Preparing output location /scratch/syoung/base/pipeline/jvance/pdx/contr\
    ol/1/tophat/11/
    [Fri Sep 17 15:49:47 2010] Checking for Bowtie index files
    [Fri Sep 17 15:49:48 2010] Checking for reference FASTA file
    [Fri Sep 17 15:49:48 2010] Checking for Bowtie
            Bowtie version:          0.12.2.0
    [Fri Sep 17 15:49:48 2010] Checking reads
            seed length:     75bp
            format:          fastq
            quality scale:   --solexa1.3-quals
    [Fri Sep 17 15:50:39 2010] Mapping reads against chr1 with Bowtie
    [Fri Sep 17 15:51:32 2010] Joining segment hits
            [FAILED]
    Error: Segment join failed with err = 1
    Traceback (most recent call last):
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1518, in ?
        sys.exit(main())
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1478, in main
        user_supplied_juncs)
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1256, in spliced_alignment
        unspliced_sam)
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1185, in join_mapped_segments
        exit(1)
    TypeError: 'str' object is not callable
    
    real    1m57.935s
    user    3m29.799s
    sys     0m2.399s



BUT FILE IS ACTUALLY THERE:


cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/1/tmp
ll *fq

    -rw-rw-rw- 1 syoung root 178M Sep 17 15:51 left_kept_reads_missing.fq






RAN MANUALLY TO CONFIRM THAT THE CONFIGURATION HAD NOT CAUSED A PROBLEM:


SUBFILE 21 IS OKAY 

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21
ll
    -rw-rw-rw-  1 syoung root  17K Sep 17 15:50 accepted_hits.sam
    -rw-rw-r--  1 syoung root  56K Sep 20 12:50 control1_1.21-1000.txt
    -rw-rw-rw-  1 syoung root 216M Sep 17 15:45 control1_1.21.txt
    -rw-rw-rw-  1 syoung root 4.1K Sep 17 15:50 coverage.wig
    -rw-rw-rw-  1 syoung root  458 Sep 17 15:50 junctions.bed
    -rw-rw-r--  1 syoung root 188M Sep 20 12:49 left_kept_reads.fq
    drwxrwxrwx  2 syoung root  197 Sep 17 15:50 logs
    drwxrwxr-x  2 syoung root   92 Sep 20 12:50 tmp



CONFIRM WITH CHOPFILE 1000 AGAINST CHR1

NOTE: MOVED THIS TO 21-ok AND RERAN CONFIRMATION WHICH THEN FAILED!!

mv /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000 /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000-ok

mkdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000

chopfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21/control1_1.21.txt /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/control1_1.21-1000.txt 1000

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000

export PATH=/nethome/bioinfo/apps/BOWTIE/0.12.2:$PATH
export PATH=/nethome/bioinfo/apps/TOPHAT/0.1.12/bin:$PATH

time /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat \
--num-threads 1 \
--solexa1.3-quals \
--output-dir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1 \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/control1_1.21-1000.txt 


    [Mon Sep 20 13:46:07 2010] Beginning TopHat run (v1.0.12)
    -----------------------------------------------
    [Mon Sep 20 13:46:07 2010] Preparing output location /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21/
    [Mon Sep 20 13:46:07 2010] Checking for Bowtie index files
    [Mon Sep 20 13:46:07 2010] Checking for reference FASTA file
    [Mon Sep 20 13:46:07 2010] Checking for Bowtie
            Bowtie version:          0.12.2.0
    [Mon Sep 20 13:46:07 2010] Checking reads
            seed length:     77bp
            format:          fastq
            quality scale:   --solexa1.3-quals
    [Mon Sep 20 13:46:07 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:46:07 2010] Joining segment hits
            Splitting reads into 3 segments
    [Mon Sep 20 13:46:07 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:46:08 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:46:08 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:46:09 2010] Searching for junctions via segment mapping
    [Mon Sep 20 13:46:22 2010] Retrieving sequences for splices
    ^[[B^[[B[Mon Sep 20 13:46:35 2010] Indexing splices
    [Mon Sep 20 13:46:35 2010] Mapping reads against segment_juncs with Bowtie
    [Mon Sep 20 13:46:36 2010] Mapping reads against segment_juncs with Bowtie
    [Mon Sep 20 13:46:36 2010] Mapping reads against segment_juncs with Bowtie
    [Mon Sep 20 13:46:36 2010] Joining segment hits
    [Mon Sep 20 13:46:36 2010] Reporting output tracks
    -----------------------------------------------
    Run complete [00:00:34 elapsed]
    
    real    0m34.813s
    user    0m28.866s
    sys     0m5.320s







BUT FAILS ON RERUN


tail logs/*log

==> logs/long_spanning_reads.log <==
long_spanning_reads v1.0.12
--------------------------------------------
Opening /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/left_kept_reads.fq for reading
Opening /dev/null for reading
Opening /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/tmp//left_kept_reads.bwtout for reading
Loading spliced hits...done
Loading junctions...done


==> logs/prep_reads.log <==
prep_reads v1.0.12
---------------------------
0 out of 0 reads have been filtered out



==> logs/run.log <==
/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat --num-threads 4 --mate-inner-dist 200 --solexa1.3-quals --output-dir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000 --mate-inner-dist 200 /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1 /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/control1_1.21-1000.txt
/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/prep_reads -Q -q /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/control1_1.21-1000.txt
bowtie --solexa1.3-quals -q --un /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/tmp//left_kept_reads_missing.fq --max /dev/null -v 2 -p 4 -k 40 -m 40 /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1 /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/left_kept_reads.fq | /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/fix_map_ordering --fastq /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/left_kept_reads.fq - > /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/tmp/filedjMDiC
/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/long_spanning_reads --fastq --min-anchor 8 --splice-mismatches 0 --min-report-intron 50 --max-report-intron 500000 --min-isoform-fraction 0.15 --output-dir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/ --max-multihits 40 --segment-length 25 --segment-mismatches 2 --min-closure-exon 100 --min-closure-intron 50 --max-closure-intron 5000 --min-coverage-intron 50 --max-coverage-intron 20000 --min-segment-intron 50 --max-segment-intron 500000 --inner-dist-mean 200 --inner-dist-std-dev 20 --no-microexon-search /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/left_kept_reads.fq /dev/null /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/tmp//left_kept_reads.bwtout  > /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/tmp/fileaQSUX2



==> logs/unspliced_bwt.log <==









BUT SUBFILE 3 GIVES ERROR AT CHOPFILE 100:

FIRST DO CHOPFILE 1O00 VS chr1

chopfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3/control1_1.3.txt /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3/control1_1.3-1000.txt 1000

cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3

export PATH=/nethome/bioinfo/apps/BOWTIE/0.12.2:$PATH
export PATH=/nethome/bioinfo/apps/TOPHAT/0.1.12/bin:$PATH

ll
time /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat \
--num-threads 4 \
--solexa1.3-quals \
--output-dir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1 \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3/control1_1.3-1000.txt 


    
    [Mon Sep 20 13:49:11 2010] Beginning TopHat run (v1.0.12)
    -----------------------------------------------
    [Mon Sep 20 13:49:11 2010] Preparing output location /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3/
    [Mon Sep 20 13:49:11 2010] Checking for Bowtie index files
    [Mon Sep 20 13:49:11 2010] Checking for reference FASTA file
    [Mon Sep 20 13:49:11 2010] Checking for Bowtie
            Bowtie version:          0.12.2.0
    [Mon Sep 20 13:49:11 2010] Checking reads
            seed length:     75bp
            format:          fastq
            quality scale:   --solexa1.3-quals
    [Mon Sep 20 13:49:11 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:49:11 2010] Joining segment hits
            Splitting reads into 3 segments
    [Mon Sep 20 13:49:11 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:49:12 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:49:12 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:49:12 2010] Searching for junctions via segment mapping
    [Mon Sep 20 13:49:26 2010] Retrieving sequences for splices
    [Mon Sep 20 13:49:39 2010] Indexing splices
    [Mon Sep 20 13:49:39 2010] Mapping reads against segment_juncs with Bowtie
    [Mon Sep 20 13:49:39 2010] Mapping reads against segment_juncs with Bowtie
    [Mon Sep 20 13:49:39 2010] Mapping reads against segment_juncs with Bowtie
    [Mon Sep 20 13:49:40 2010] Joining segment hits
    [Mon Sep 20 13:49:40 2010] Reporting output tracks
    -----------------------------------------------
    Run complete [00:00:35 elapsed]




CHOPFILE 100 VS chr1
mkdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr1/3-100/
cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr1/3-100/



chopfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3/control1_1.3.txt \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr1/3-100/control1_1.3-100.txt 100
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr1/3-100

export PATH=/nethome/bioinfo/apps/BOWTIE/0.12.2:$PATH
export PATH=/nethome/bioinfo/apps/TOPHAT/0.1.12/bin:$PATH

    time /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat \
    --num-threads 4 \
    --solexa1.3-quals \
    --output-dir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr1/3-100 \
    /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1 \
    /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/chr1/3-100/control1_1.3-100.txt 


    [Mon Sep 20 13:53:05 2010] Beginning TopHat run (v1.0.12)
    -----------------------------------------------
    [Mon Sep 20 13:53:05 2010] Preparing output location /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3-100/
    [Mon Sep 20 13:53:05 2010] Checking for Bowtie index files
    [Mon Sep 20 13:53:05 2010] Checking for reference FASTA file
    [Mon Sep 20 13:53:05 2010] Checking for Bowtie
            Bowtie version:          0.12.2.0
    [Mon Sep 20 13:53:05 2010] Checking reads
            seed length:     75bp
            format:          fastq
            quality scale:   --solexa1.3-quals
    [Mon Sep 20 13:53:05 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:53:05 2010] Joining segment hits
            Splitting reads into 3 segments
    [Mon Sep 20 13:53:05 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:53:06 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:53:06 2010] Mapping reads against chr1 with Bowtie
    [Mon Sep 20 13:53:06 2010] Searching for junctions via segment mapping
    Warning: junction database is empty!
    [Mon Sep 20 13:53:19 2010] Joining segment hits
    [Mon Sep 20 13:53:19 2010] Reporting output tracks
    -----------------------------------------------
    Run complete [00:00:19 elapsed]
    
    real    0m19.135s
    user    0m15.146s
    sys     0m3.696s



CHOPFILE 100 vs GENOME


mkdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3-100-genome
cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3-100-genome

chopfile /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3/control1_1.3.txt /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3-100-genome/control1_1.3-100.txt 100


cd /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3-100-genome

export PATH=/nethome/bioinfo/apps/BOWTIE/0.12.2:$PATH
export PATH=/nethome/bioinfo/apps/TOPHAT/0.1.12/bin:$PATH

time /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat \
--num-threads 4 \
--mate-inner-dist 200 \
--solexa1.3-quals \
--output-dir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3-100-genome \
--mate-inner-dist 200 \
/nethome/bioinfo/data/sequence/genomes/human/hg19/bowtie/hg19 \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3-100-genome/control1_1.3-100.txt 


    [Mon Sep 20 13:20:26 2010] Beginning TopHat run (v1.0.12)
    -----------------------------------------------
    [Mon Sep 20 13:20:26 2010] Preparing output location /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/3-100-genome/
    [Mon Sep 20 13:20:26 2010] Checking for Bowtie index files
    [Mon Sep 20 13:20:26 2010] Checking for reference FASTA file
    [Mon Sep 20 13:20:26 2010] Checking for Bowtie
            Bowtie version:          0.12.2.0
    [Mon Sep 20 13:20:26 2010] Checking reads
            seed length:     75bp
            format:          fastq
            quality scale:   --solexa1.3-quals
    [Mon Sep 20 13:20:26 2010] Mapping reads against hg19 with Bowtie
    [Mon Sep 20 13:21:03 2010] Joining segment hits
            Splitting reads into 3 segments
    [Mon Sep 20 13:21:03 2010] Mapping reads against hg19 with Bowtie
    [Mon Sep 20 13:21:08 2010] Mapping reads against hg19 with Bowtie
    [Mon Sep 20 13:21:12 2010] Mapping reads against hg19 with Bowtie
    [Mon Sep 20 13:21:17 2010] Searching for junctions via segment mapping
    Warning: junction database is empty!
    [Mon Sep 20 13:24:25 2010] Joining segment hits
    [Mon Sep 20 13:24:25 2010] Reporting output tracks
            [FAILED]
    Error: tophat_reports not found on this system
    Traceback (most recent call last):
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1518, in ?
        sys.exit(main())
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1490, in main
        params.gff_annotation)
      File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 963, in compile_reports
        exit(1)
    TypeError: 'str' object is not callable
    
    real    3m58.841s
    user    2m40.178s
    sys     0m31.041s




export PATH=/nethome/bioinfo/apps/BOWTIE/0.9.4:$PATH
export PATH=/nethome/bioinfo/apps/TOPHAT/0.1.12/bin:$PATH


export PATH=/nethome/bioinfo/apps/BOWTIE/0.12.2:$PATH
export PATH=/nethome/bioinfo/apps/TOPHAT/0.1.12/bin:$PATH


time /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat \
--num-threads 1 \
--solexa1.3-quals \
--output-dir
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1 \
/scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat/21-1000/control1_1.21-1000.txt




CONTROL 2
---------


screen -S control2

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.sequence.txt \
--params "--mate-inner-dist 200" \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat \
--label control2 \
--keep \
--cpus 4 \
--distance 200 \
--species human \
--cluster LSF \
--queue large \
--walltime 24



bash-3.2$ tail /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/tophat.out
Cluster::printUsage    usagefile absent
Cluster::printUsage    Printing USAGE file: /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/tophat-USAGE.txt
[Wed Sep 29 02:48:51 2010] TOPHAT.pl: Use of uninitialized value in concatenation (.) or string at /nethome/bioinfo/apps/agua/0.5/bin/apps/../../lib/Cluster.pm line 3740.
TOPHAT::run    After printUsage       10-09-29 02:48:52
TOPHAT.pl    Run time: 02:22:41
TOPHAT.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl
TOPHAT.pl    2:48AM, 29 September 2010
TOPHAT.pl    ****************************************


RUNS BUT NO PROPER OUTPUT:

 cd /scratch/syoung/base/pipeline/jvance/pdx/control/2/tophat/chr1/1
bash-3.2$ ls -al
total 282
drwxrwxrwx   3 syoung root  295 Sep 29 22:52 .
drwxrwxrwx 184 syoung root 2570 Sep 29 02:48 ..
-rw-r--r--   1 syoung root  381 Sep 29 01:11 accepted_hits.bam
-rw-r--r--   1 syoung root  793 Sep 29 01:39 accepted_hits.bam.merge.1
-rw-r--r--   1 syoung root 1076 Sep 29 01:55 accepted_hits.bam.merge.2
-rw-r--r--   1 syoung root 1512 Sep 29 02:08 accepted_hits.bam.merge.3
-rw-r--r--   1 syoung root 2680 Sep 29 02:36 accepted_hits.bam.merge.4
-rw-rw-rw-   1 syoung root 1135 Sep 29 01:05 accepted_hits.sam
-rw-rw-rw-   1 syoung root  897 Sep 29 01:05 coverage.wig
-rw-rw-rw-   1 syoung root 2874 Sep 29 01:05 doBatchAlignment-chr1-stdout.txt
-rw-rw-rw-   1 syoung root   52 Sep 29 01:05 junctions.bed
drwxrwxrwx   2 syoung root  149 Sep 29 01:05 logs




TEST 1
------


screen -S test1

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt \
--params "--mate-inner-dist 200" \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat \
--label test1 \
--keep \
--cpus 4 \
--distance 200 \
--species human \
--cluster LSF \
--queue large \
--walltime 24


time /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat \
--num-threads 4 \
--mate-inner-dist 200 \
--output-dir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1 \
--mate-inner-dist 200 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1 \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt



[Sun Sep 19 12:52:30 2010] Beginning TopHat run (v1.0.12)
-----------------------------------------------
[Sun Sep 19 12:52:30 2010] Preparing output location /scratch/syoung/base/pipeline/jvance/pdx/test/\
1/tophat/1/
[Sun Sep 19 12:52:30 2010] Checking for Bowtie index files
[Sun Sep 19 12:52:30 2010] Checking for reference FASTA file
[Sun Sep 19 12:52:30 2010] Checking for Bowtie
        Bowtie version:          0.12.2.0
[Sun Sep 19 12:52:30 2010] Checking reads
        seed length:     49bp
        format:          fastq
        quality scale:   --phred33-quals
[Sun Sep 19 12:53:14 2010] Mapping reads against chr1 with Bowtie
[Sun Sep 19 12:54:02 2010] Joining segment hits
[Sun Sep 19 12:54:05 2010] Searching for junctions via segment mapping
Warning: junction database is empty!
[Sun Sep 19 12:54:36 2010] Joining segment hits
[Sun Sep 19 12:54:36 2010] Reporting output tracks
        [FAILED]
Error: Report generation failed with err = 1
Traceback (most recent call last):
  File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1518, in ?
    sys.exit(main())
  File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 1490, in main
    params.gff_annotation)
  File "/nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat", line 936, in compile_reports
    exit(1)
TypeError: 'str' object is not callable

real    2m6.226s
user    3m4.756s
sys     0m3.196s



CHECK READ LENGTH:


head /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt

    @test1:0:1:16:203#0
    ACNNACCNTNGNGNNCNNCNNGNCTGANGGNANGTANNNNNNNGTGNNC
    +test1:0:1:16:203#0
    <&!!'?)!)!8!'!!4!!&!!'!%1:&!)*!&!%6;!!!!!!!*,)!!%
    @test1:0:1:16:249#0
    CCNNGCCNTNGNANNGNNTNNANAGAGNCGNANGAGNNNNNNNGGGNNA
    +test1:0:1:16:249#0
    =)!!5%)!(!'!(!!&!!(!!)!00,'!''!+!'*&!!!!!!!('&!!(
    @test1:0:1:16:328#0
    TTNNCCCNANCNCNNCNNTNNGNATGCNCGNANAAGNNNNNNNAACNNC


tail /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt

    +test1:0:5:1216:767#0
    :,:>4-00>>%,8><3.8@@3-9@@5*9=8%%&%/%'(.(%)%+%%(''
    @test1:0:5:1216:775#0
    AAGATCGTCGTAAGCCCGGCGTGGGCGGGATGTCTGCAAGCTCGTCCGC
    +test1:0:5:1216:775#0
    ?:=?/=2?,)>=:;?7<=7=?8>%=>.=7A?:?)@<,@+@>7;5A>1='
    @test1:0:5:1216:828#0
    CTCCTCGTCGCGACGCATGGAAGGGTCGCGACGCTACTCGGGGAACGCT
    +test1:0:5:1216:828#0
    29A2?<=?7>3%>:>:+A@A8=>@?<1>.@?/@?B@%49@7'>:?<0-+



SOLUTION

REMOVE  --mate-inner-dist 200  TERM:

export PATH=/nethome/bioinfo/apps/BOWTIE/0.12.2:$PATH

time /nethome/bioinfo/apps/TOPHAT/0.1.12/bin/tophat \
--num-threads 4 \
--output-dir /scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1 \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1 \
/scratch/syoung/base/pipeline/jvance/pdx/test/1/tophat/1/test1_1.1.txt




SEQANSWERS
http://seqanswers.com/forums/showthread.php?t=2707

Verify that your Bowtie index's record names contain no spaces:
(known interoperability bug between TopHat and Bowtie (which is fixed in the upcoming Bowtie 0.10.2) which results in behavior like this when the index has spaces in the names.)

/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie-inspect --names /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr1

    chr1

    OK


If your index has simple names, and you are still seeing this, can you email me your logs from the run?



/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie-inspect --names 


TEST 2
------


screen -S test2

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles /scratch/syoung/base/pipeline/jvance/pdx/test/2/test2.sequence.txt \
--params "--mate-inner-dist 200" \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat \
--label test2 \
--keep \
--cpus 4 \
--distance 200 \
--species human \
--cluster LSF \
--queue large \
--walltime 24

    
    ...    
    Job <1876081> is submitted to queue <large>.
    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr2/cufflinks-chr2.sh
    Job <1876082> is submitted to queue <large>.
    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr1/cufflinks-chr1.sh
    Job <1876083> is submitted to queue <large>.
    Cluster::runJobs    Completed CUFFLINKS at 10-09-19 18:24:55, duration: 00:00:42
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    FINISHED RUNNING CUFFLINKS
    TOPHAT::run    After runCufflinks     10-09-19 18:24:55
    TOPHAT::run    Doing printUsage       10-09-19 18:24:55
    Cluster::printUsage    usagefile absent
    Cluster::printUsage    Printing USAGE file: /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/tophat-USAGE.txt
    Use of uninitialized value in concatenation (.) or string at /nethome/bioinfo/apps/agua/0.5/bin/apps/../../lib/Cluster.pm line 3725.
    TOPHAT::run    After printUsage       10-09-19 18:24:55
    TOPHAT::run    Doing stats       10-09-19 18:24:55
    Method name TOPHAT::stats is not in the recognized form (get|set)_attribute
     at /nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl line 366





cd /scratch/syoung/base/pipeline/jvance/pdx/test/2/tophat/chr4
ll */acc*

    -rw-r--r-- 1 syoung root  187 Sep 20 16:41 123/accepted_hits.bam
    -rw-rw-rw- 1 syoung root  161 Sep 20 16:07 123/accepted_hits.sam
    -rw-r--r-- 1 syoung root  189 Sep 20 16:41 139/accepted_hits.bam
    -rw-rw-rw- 1 syoung root  161 Sep 20 16:06 139/accepted_hits.sam
    -rw-r--r-- 1 syoung root  247 Sep 20 16:41 156/accepted_hits.bam
    -rw-rw-rw- 1 syoung root  485 Sep 20 16:09 156/accepted_hits.sam
    -rw-r--r-- 1 syoung root  187 Sep 20 16:41 161/accepted_hits.bam
    -rw-rw-rw- 1 syoung root  160 Sep 20 16:06 161/accepted_hits.sam
    -rw-r--r-- 1 syoung root  332 Sep 20 16:41 33/accepted_hits.bam
    -rw-rw-rw- 1 syoung root 2.7K Sep 20 16:04 33/accepted_hits.sam
    -rw-r--r-- 1 syoung root  342 Sep 20 16:41 43/accepted_hits.bam
    -rw-rw-rw- 1 syoung root 2.7K Sep 20 16:07 43/accepted_hits.sam
    -rw-r--r-- 1 syoung root  336 Sep 20 16:41 48/accepted_hits.bam
    -rw-rw-rw- 1 syoung root 2.7K Sep 20 16:04 48/accepted_hits.sam
    -rw-r--r-- 1 syoung root  338 Sep 20 16:41 51/accepted_hits.bam
    -rw-rw-rw- 1 syoung root 2.7K Sep 20 16:05 51/accepted_hits.sam




I have the same problem with tophat. bowtie alone runs fine, so it is hard to believe that bowtie crashes silently. In any case, looks like the bowtie index was built for colorspace. When I rebuilt the bowtie index without -C option tophat ran fine.









</entry>

<entry [Fri Sep 17 02:33:12 EDT 2010] CONVERT CSFASTA TO FASTQ WITH solidToFastq.pl>

TEST 1

/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/test/1/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/test/1/test1.sequence.txt \
--label test1
    
    Run time: 06:17:19
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl
    7:56AM, 19 September 2010
    ****************************************

TEST 2

/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/test/2/WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3.csfasta \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/test/1/test2.sequence.txt \e
--label test2
    
    Run time: 05:07:03
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl
    6:48AM, 19 September 2010
    ****************************************

CONTROL 2

/nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl \
--inputfile /scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta \
--outputfile /scratch/syoung/base/pipeline/jvance/pdx/control/2/control2.sequence.txt \
--label control2
    
    Run time: 05:47:03
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/readprep/solidToFastq.pl
    7:28AM, 19 September 2010
    ****************************************


cd /scratch/syoung/base/pipeline/jvance/pdx
ll */*/*sequence.txt

    -rw-rw-rw- 1 syoung root 27G Sep 19 07:28 control/2/control2.sequence.txt
    -rw-rw-rw- 1 syoung root 28G Sep 19 07:56 test/1/test1.sequence.txt
    -rw-rw-rw- 1 syoung root 23G Sep 19 06:48 test/1/test2.sequence.txt



TEST FILE:

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2
head *csfasta

>853_24_57_F3
T..........2..302.0..1...33333.221.3.2..0.3323113.2
>853_24_185_F3
T..........0..002.2..0...03323.230.1.2..0.0110001.2


head *qual

>853_24_57_F3
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 4 -1 -1 4 10 13 -1 7 -1 -1 5 -1 -1 -1 17 10 4 6 6 -1 14 13 4 -1 4 -1 4 -1 -1 4 -1 4 16 6 16 9 11 4 -1 4 
>853_24_185_F3
-1 -1 -1 -1 -1 -1 -1 -1 -1 -1 7 -1 -1 6 18 19 -1 12 -1 -1 12 -1 -1 -1 21 23 21 6 20 -1 10 27 7 -1 13 -1 6 -1 -1 27 -1 17 21 23 30 28 25 13 -1 6


50 QUALITY VALUES

-1 -1 -1 -1 -1
-1 -1 -1 -1 -1
4 -1 -1 4 10
13 -1 7 -1 -1
5 -1 -1 -1 17
10 4 6 6 -1
14 13 4 -1 4
-1 4 -1 -1 4
-1 4 16 6 16
9 11 4 -1 4 





NB: STRANGE OUTPUT FROM BWA solid2fastq.pl

@control2:853_24_57/1
NNNNNNNNNGNNTAGNANNCNNNTTTTTNGGCNTNGNNANTTGTCCTNG
+
-"-"-"-"-"-"-"-"-"-"%-"-"%+.-"(-"-"&-"-"-"2+%''-"/.%-"%-"%-"-"%-"%1'1*,%-"%



COMPARED TO solidToFastq.pl


@control2:0:853:24:57#0
NNNNNNNNNGNNTAGNANNCNNNTTTTTNGGCNTNGNNANTTGTCCTNG
+control2:0:853:24:57#0
!!!!!!!!!%!!%+.!(!!&!!!2+%''!/.%!%!%!!%!%1'1*,%!%





Looks like you have (CS)FASTQ (colorspace FASTQ) files already . What you seem to want is the double-encoded FASTQ MAQ accepts for colorspace mapping.

You could just iterate through and apply the double encoding MAQ uses. Trim off the first two DNA bases, then 0=A,1=C,2=G,3=T



perl -p -e 'if(/^[TG]/) {$_ = substr($_, 2); tr/0123/ACGTN/; }' input.csfastq > output.de.fastq





solid2fastq.pl from the MAQ package. This question may help: http://seqanswers.com/forums/showthread.php?t=3730


cd /nethome/bioinfo/apps/maq/0.7.1




SEQANSWERS
http://i.seqanswers.com/question/67/converting-ab-solid-color-space-reads-to-fastq-format


Converting Color Alignment

AB decodes color sequence with a set of rules, but to me, using a dynamic programming is simpler and more straightforward. The dynamic programming takes a nucleotide reference sequence and an aligned color read as input and works by finding a decoding which minimizes color changes and nucleotide changes at the same time.

The decoding problem can be solved directly or reduced to find the shortest path on a DAG. 








screen -S solid2fastq2

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2
ll
    -rw-r--r-- 1 syoung root  12G Aug 31 11:38 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta
    -rw-r--r-- 1 syoung root  27G Aug 31 13:39 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3_QV.qual
    -rw-r--r-- 1 syoung root 204K Aug 31 12:05 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.stats



head WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta
# Sat Feb 27 17:12:12 2010 /share/apps/corona/bin/filter_fasta.pl --output=/data/results/solid0398/WT_GUNEYPD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379 --name=WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM --tag=F3 --minlength=50 --mincalls=25 --prefix=T /data/results/solid0398/WT_GUNEYPD_20100219_solid0398/WT_57_PD_04PM/jobs/postPrimerSetPrimary.2423/rawseq 
# Cwd: /home/pipeline
# Title: WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM
>1_16_203_F3
T101..011.3.2.2..1..1..2.1320.22.0.230.......232..1
>1_16_249_F3
T311..211.3.2.0..2..3..0.0202.12.0.202.......222..0
>1_16_328_F3
T233..111.0.1.1..1..3..2.0321.12.0.002.......001..1
>1_16_356_F3


RUN solid2fastq.pl


TEST 1
------

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1

rm -fr /scratch/syoung/base/pipeline/jvance/pdx/test/1/solid2fastq.sh
emacs /scratch/syoung/base/pipeline/jvance/pdx/test/1/solid2fastq.sh
#!/bin/sh

#BSUB -W 24:00

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1

/nethome/syoung/base/apps/bwa/0.5.0/solid2fastq.pl WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_ test1


RUN CONVERSION

chmod 755 /scratch/syoung/base/pipeline/jvance/pdx/test/1/solid2fastq.sh


bsub -q large -e /scratch/syoung/base/pipeline/jvance/pdx/test/1/solid2fastq.err -o /scratch/syoung/base/pipeline/jvance/pdx/test/1/solid2fastq.out /scratch/syoung/base/pipeline/jvance/pdx/test/1/solid2fastq.sh ; date; bjobs
    
    Job <1862915> is submitted to queue <large>.
    Fri Sep 17 15:54:10 EDT 2010


COMPLETED

    -rw-rw-r-- 1 syoung root  23G Sep 17 18:33 test1.single.fastq
    -r--r--r-- 1 syoung root  13G Sep 15 03:21 WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta
    -r--r--r-- 1 syoung root  29G Aug 31 13:47 WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3_QV.qual




screen -S control1

/nethome/bioinfo/apps/agua/0.5/bin/apps/TOPHAT.pl \
--inputfiles "/scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_1_sequence.txt,/scratch/syoung/base/pipeline/jvance/pdx/control/1/s_1_2_sequence.txt" \
--params "--mate-inner-dist 200 --solexa1.3-quals" \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/1/tophat \
--label control1 \
--keep \
--cpus 4 \
--distance 200 \
--species human \
--cluster LSF \
--queue large \
--walltime 24





TEST 2 (SOLiD) WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM
--------------

cd /scratch/syoung/base/pipeline/jvance/pdx/test/2

rm -fr /scratch/syoung/base/pipeline/jvance/pdx/test/2/solid2fastq.sh
emacs /scratch/syoung/base/pipeline/jvance/pdx/test/2/solid2fastq.sh
#!/bin/sh

#BSUB -W 24:00

cd /scratch/syoung/base/pipeline/jvance/pdx/test/2

/nethome/syoung/base/apps/bwa/0.5.0/solid2fastq.pl WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_ test2


RUN CONVERSION

chmod 755 /scratch/syoung/base/pipeline/jvance/pdx/test/2/solid2fastq.sh


bsub -q large -e /scratch/syoung/base/pipeline/jvance/pdx/test/2/solid2fastq.err -o /scratch/syoung/base/pipeline/jvance/pdx/test/2/solid2fastq.out /scratch/syoung/base/pipeline/jvance/pdx/test/2/solid2fastq.sh ; date;


    Job <1862916> is submitted to queue <large>.
    Fri Sep 17 15:55:15 EDT 2010


COMPLETED

    -rw-rw-r-- 1 syoung root  19G Sep 17 18:01 test2.single.fastq
    -rw-r--r-- 1 syoung root  11G Sep 15 02:17 WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3.csfasta
    -rw-r--r-- 1 syoung root  24G Sep 15 03:49 WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3_QV.qual





CONTROL 2
---------

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2

rm -fr /scratch/syoung/base/pipeline/jvance/pdx/control/2/solid2fastq.sh
emacs /scratch/syoung/base/pipeline/jvance/pdx/control/2/solid2fastq.sh
#!/bin/sh

#BSUB -W 24:00

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2

/nethome/syoung/base/apps/bwa/0.5.0/solid2fastq.pl MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_ control2


RUN CONVERSION

cd /scratch/syoung/base/pipeline/jvance/pdx/control/2
chmod 755 /scratch/syoung/base/pipeline/jvance/pdx/control/2/solid2fastq.sh


bsub -q large -e /scratch/syoung/base/pipeline/jvance/pdx/control/2/solid2fastq.err -o /scratch/syoung/base/pipeline/jvance/pdx/control/2/solid2fastq.out /scratch/syoung/base/pipeline/jvance/pdx/control/2/solid2fastq.sh ; date;

    Job <1862918> is submitted to queue <large>.
    Fri Sep 17 15:56:43 EDT 2010


COMPLETED

    -rw-rw-r-- 1 syoung root 23375415364 Sep 17 18:26 control2.single.fastq
    -rw-r--r-- 1 syoung root 12759519132 Sep 15 02:33 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta
    -rw-r--r-- 1 syoung root 28292786613 Sep 17 01:15 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3_QV.qual



ALL RUNNING
Fri Sep 17 15:58:01 EDT 2010

cd /scratch/syoung/base/pipeline/jvance/pdx

ll */*/*gz
    -rw-rw-r-- 1 syoung root  40M Sep 17 15:57 control/2/control2.single.fastq.gz
    -rw-rw-r-- 1 syoung root 139M Sep 17 15:57 test/1/test1.single.fastq.gz
    -rw-rw-r-- 1 syoung root 140M Sep 17 15:57 test/2/test2.single.fastq.gz



FINISHED:
Sat Sep 18 08:34:50 EDT 2010

-rw-rw-r-- 1 syoung root 9.5G Sep 17 18:26 control/2/control2.single.fastq.gz
-rw-rw-r-- 1 syoung root 9.8G Sep 17 18:33 test/1/test1.single.fastq.gz
-rw-rw-r-- 1 syoung root 7.7G Sep 17 18:01 test/2/test2.single.fastq.gz








USAGE


    Usage: solid2fastq.pl <in.title> <out.prefix>
    
    Note: <in.title> is the string showed in the `# Title:' line of a
          ".csfasta" read file. Then <in.title>F3.csfasta is read sequence
          file and <in.title>F3_QV.qual is the quality file. If
          <in.title>R3.csfasta is present, this script assumes reads are
          paired; otherwise reads will be regarded as single-end.
    
          The read name will be <out.prefix>:panel_x_y/[12] with `1' for R3
          tag and `2' for F3. Usually you may want to use short <out.prefix>
          to save diskspace. Long <out.prefix> also causes troubles to maq.








NOTES
-----












MAQ DOES COLORSPACE ALIGNMENT
http://maq.sourceforge.net/color.shtml

Color Space SNP Calling

MAQ is able to process SOLiD data. It does alignment in the color space, convert color alignment to nucleotide alignment and then do SNP calling in the nucleotide space. Suppose you have a nucleotide reference sequence ref.fasta, color read sequence file reads_F3.csfasta and its quality file reads_F3_QV.qual. You should run through the following commands to get the SNP calls.

1> solid2fastq.pl reads_ shortname
2> maq fastq2bfq shortname.fastq shortname.bfq
3> maq fasta2csfa ref.fasta > ref.csfa
4> maq fasta2bfa ref.csfa ref.csbfa
5> maq fasta2bfa ref.fasta ref.bfa
6> maq map -c aln.cs.map ref.csbfa shortname.bfq 2> aln.log
7> maq csmap2nt aln.map aln.nt.map ref.bfa aln.cs.map
8> maq assemble cns.cns ref.bfa aln.nt.map 2> cns.log
In this procedure, step 1 converts reads in the SOLiD format to the FASTQ format. The primer nucleotide base and the first color will be trimmed off. MAQ cannot use the first nucleotide in the alignment and this information will be missing in all the subsequent steps. Fortunately, simulation shows that even for 25bp reads, missing the first nucleotide will not greatly hurt the accuracy. Note that script solid2fastq.pl also works with paired end reads. In this case, three files will be generated, one of singletons and two for each end respectively. Step 6 does alignment in the color space. It correctly handles the orientation or color reads. Step 7 converts the color alignment to nucleotide alignment. The resulting reads will be one bp shorter as there is not much information for the first and the last color. If input reads are 25 characters in length, the reads will be 23bp after csmap2nt. Since this step, we will work in the nucleotide space. The color reference sequence and color alignment will not be used any more.






TOPHAT DOES NOT WORK WITH COLORSPACE - HAVE TO CONVERT TO FASTQ FIRST


http://tophat.cbcb.umd.edu/manual.html

What types of reads can I use TopHat with?

TopHat was designed to work with reads produced by the Illumina Genome Analyzer, although users have been successful in using TopHat with reads from other technologies. The software has been extended longer reads and paired end reads from the latest Illumina machines, and is optimized for reads 75bp or longer.
Currently, TopHat does not allow short (fewer than a few nucleotides) insertions and deletions in the alignments it reports. Support for insertions and deletions will eventually be added. TopHat also does not natively support Applied Biosystems' Colorspace format.
Finally, current versions of TopHat expect the reads to be the same length, and mixing runs with paired- and single- end reads together is not supported. If you have applied your own trimming procedure to Illumina reads, or if you are using TopHat with a sequencing technology that produces variable-length reads, please ensure that the reads input to TopHat are the same length. This limitation is an engineering rather than an algorithmic one and will be addressed in a future release.







</entry>

<entry [Tue Aug 31 23:10:37 EDT 2010] RAN BOWTIE ON PARKINSONS DATA>



1. DOWNLOADED PRE-BUILT COLORSPACE BOWTIE INDEX

mkdir -p /nethome/bioinfo/data/sequence/chromosomes/human/hg18/bowtie/colorspace
cd /nethome/bioinfo/data/sequence/chromosomes/human/hg18/bowtie/colorspace
wget ftp://ftp.cbcb.umd.edu/pub/data/bowtie_indexes/hg18_c.ebwt.zip



2. RUN BOWTIE



TEST 1 (SOLiD) 
--------------

cd /scratch/syoung/base/pipeline/jvance/pdx/test/1

WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM







CONTROL 2 (SOLiD)
-----------------

INPUT FILES:

ll /scratch/syoung/base/pipeline/jvance/pdx/control/2

    -rw-r--r-- 1 syoung root  12G Aug 31 11:38 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta
    -rw-r--r-- 1 syoung root  27G Aug 31 13:39 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3_QV.qual
    -rw-r--r-- 1 syoung root 204K Aug 31 12:05 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.stats


CREATE OUTPUT DIR:

mkdir -p /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie
cd /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie



BOWTIE COMMAND:


cd /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie

/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--color \
--sam \
-f \
-C \
--al /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie/aligned.sam \
--un /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie/unaligned.sam \
/nethome/bioinfo/data/sequence/chromosomes/human/hg18/bowtie/colorspace/hg18_c \
/scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3-400.csfasta 

    BUT GAVE AN ERROR:

    853_24_57_F3    4       *       0       0       *       *       0       0       NNNNNNNNNGNNTAGNANNCNNNTTTTTNGGCNTNGNNANTTGTCCTNG        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    853_24_185_F3   4       *       0       0       *       *       0       0       NNNNNNNNNANNAAGNGNNANNNATTGTNGTANCNGNNANACCAAACNG        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    853_24_212_F3   4       *       0       0       *       *       0       0       NNNNNNNNNGNNGCGNCNNCNNNGCATTNGCGNTNATAGTCTTTATGNG        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    853_24_278_F3   4       *       0       0       *       *       0       0       NNNNNNNNNGNNGACNGNNCNNNCCGACNGTANGNCNTCTCCACAGANC        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    853_24_285_F3   4       *       0       0       *       *       0       0       NNNNNNNNNCNNTGGNCNNTNNNTAAACNAAGNGNANNGNCTTTAAANG        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    853_24_317_F3   4       *       0       0       *       *       0       0       NNNNNNNNNGNNCACNGNNGNNNAACTCNGCANANANNANTCGAAGANG        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    853_24_335_F3   4       *       0       0       *       *       0       0       NNNNNNNNNANNTAGNANNCNNNGAGAANAGANTNTNNANCATTCTANG        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    ...
    853_26_1283_F3  4       *       0       0       *       *       0       0       NNNNNCNNNCNTATANANNTNATTAGGACCTANGAAAGACAGGTCAAGA        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    853_26_1297_F3  4       *       0       0       *       *       0       0       NNNNNTCNNANGCTGNTNCANGGCAATTAGTANATTCCAATAGGATAAC        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    853_26_1317_F3  4       *       0       0       *       *       0       0       NNNNNTCNGGNTTTGNCNGGNAAGGCTCGGCANGCCCCCGCCGGCCCAC        IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII       XM:i:0
    # reads processed: 198
    # reads with at least one reported alignment: 0 (0.00%)
    # reads that failed to align: 198 (100.00%)
    No alignments





PROBLEM:

/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--color \
--sam \
-f \
-C \
--al /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie/aligned.sam \
--un /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie/unaligned.sam \
/nethome/bioinfo/data/sequence/chromosomes/human/hg18/bowtie/colorspace/hg18_c \
/scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta \
/scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3_QV.qual \
> /scratch/syoung/base/pipeline/jvance/pdx/control/2/out.sam


    Error: reads file does not look like a FASTA file


NOTE: QUAL FILE IS EMPTY:

ll /scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3_QV.qual

    -rw-r--r-- 1 syoung root 0 Sep 15 01:36 /scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3_QV.qual




> -f /scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta \

Error: reads file does not look like a FASTA file




bowtie also handles input in the form of parallel .csfasta and _QV.qual files. Use -f to specify the .csfasta files and -Q (for unpaired reads) or --Q1/--Q2 (for paired-end reads) to specify the corresponding _QV.qual files. It is not necessary to first convert to FASTQ, though bowtie also handles FASTQ-formatted colorspace reads (with -q, the default).



All input formats (FASTA -f, FASTQ -q, raw -r, tab-delimited --12, command-line -c) are compatible with colorspace (-C). When -C is specified, read sequences are treated as colors. Colors may be encoded either as numbers (0=blue, 1=green, 2=orange, 3=red) or as characters A/C/G/T (A=blue, C=green, G=orange, T=red).



/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--color \
--al /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie/aligned.sam \
--un /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie/unaligned.sam \
/nethome/bioinfo/data/sequence/chromosomes/human/hg18/bowtie/colorspace/hg18_c \
-f /scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta \
-
/scratch/syoung/base/pipeline/jvance/pdx/control/2/out.sam


head /scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta


    # Cwd: /home/pipeline
    # Title: MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM
    >853_24_57_F3
    T..........2..302.0..1...33333.221.3.2..0.3323113.2
    >853_24_185_F3
    T..........0..002.2..0...03323.230.1.2..0.0110001.2
    >853_24_212_F3
    T..........2..212.1..1...21033.212.3.030231333032.2
    >853_24_278_F3



WHERE T IS THE FIRST PRIMER BASE


GIVES THIS ERROR

    Error: reads file does not look like a FASTQ file
    Command: /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie --sam -C --al /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie/aligned.sam --un /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie/aligned.sam /nethome/bioinfo/data/sequence/chromosomes/human/hg18/bowtie/colorspace/hg18_c /scratch/syoung/base/pipeline/jvance/pdx/control/2/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta /scratch/syoung/base/pipeline/jvance/pdx/control/2/out.sam






perl /nethome/bioinfo/apps/agua/0.4/bin/apps/BOWTIE.pl \
--inputfiles /nethome/bioinfo/data/sequence/labs/bixby/run1/s_1_sequence.txt,/nethome/bioinfo/data/sequence/labs/bixby/run1/s_2_sequence.txt \
--distance 200 \
--queue large \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg18/bowtie/colorspace \
--outputdir /scratch/syoung/base/pipeline/jvance/pdx/control/2/bowtie \
--keep \
--cluster LSF \
--cpus 4 \
--maxjobs 1000 \
--species mouse \
--label bowtie1+2






NOTES

Colorspace Alignment

As of version 0.12.0, bowtie can align colorspace reads against a colorspace index when -C is specified. Colorspace is the characteristic output format of Applied Biosystems' SOLiD system. In a colorspace read, each character is a color rather than a nucleotide, where a color encodes a class of dinucleotides. E.g. the color blue encodes any of the dinucleotides: AA, CC, GG, TT. Colorspace has the advantage of (often) being able to distinguish sequencing errors from SNPs once the read has been aligned. See ABI's Principles of Di-Base Sequencing document for details.

Colorspace reads

All input formats (FASTA -f, FASTQ -q, raw -r, tab-delimited --12, command-line -c) are compatible with colorspace (-C). When -C is specified, read sequences are treated as colors. Colors may be encoded either as numbers (0=blue, 1=green, 2=orange, 3=red) or as characters A/C/G/T (A=blue, C=green, G=orange, T=red).

Some reads include a primer base as the first character; e.g.:

>1_53_33_F3
T2213120002010301233221223311331
>1_53_70_F3
T2302111203131231130300111123220
...
Here, T is the primer base. bowtie detects and handles primer bases properly (i.e., the primer base and the adjacent color are both trimmed away prior to alignment) as long as the rest of the read is encoded as numbers.

bowtie also handles input in the form of parallel .csfasta and _QV.qual files. Use -f to specify the .csfasta files and -Q (for unpaired reads) or --Q1/--Q2 (for paired-end reads) to specify the corresponding _QV.qual files. It is not necessary to first convert to FASTQ, though bowtie also handles FASTQ-formatted colorspace reads (with -q, the default).

Building a colorspace index

A colorspace index is built in the same way as a normal index except that -C must be specified when running bowtie-build. If the user attempts to use bowtie without -C to align against an index that was built with -C (or vice versa), bowtie prints an error message and quits.

Decoding colorspace alignments

Once a colorspace read is aligned, Bowtie decodes the alignment into nucleotides and reports the decoded nucleotide sequence. A principled decoding scheme is necessary because many different possible decodings are usually possible. Finding the true decoding with 100% certainty requires knowing all variants (e.g. SNPs) in the subject's genome beforehand, which is usually not possible. Instead, bowtie employs the approximate decoding scheme described in the BWA paper. This scheme attempts to distinguish variants from sequencing errors according to their relative likelihood under a model that considers the quality values of the colors and the (configurable) global likelihood of a SNP.

Quality values are also "decoded" so that each reported quality value is a function of the two color qualities overlapping it. Bowtie again adopts the scheme described in the BWA paper, i.e., the decoded nucleotide quality is either the sum of the overlapping color qualities (when both overlapping colors correspond to bases that match in the alignment), the quality of the matching color minus the quality of the mismatching color, or 0 (when both overlapping colors correspond to mismatches).

For accurate decoding, --snpphred/--snpfrac should be set according to the user's best guess of the SNP frequency in the subject. The --snpphred parameter sets the SNP penalty directly (on the Phred quality scale), whereas --snpfrac allows the user to specify the fraction of sites expected to be SNPs; the fraction is then converted to a Phred quality internally. For the purpose of decoding, the SNP fraction is defined in terms of SNPs per haplotype base. Thus, if the genome is diploid, heterozygous SNPs have half the weight of homozygous SNPs

Note that in -S/--sam mode, the decoded nucleotide sequence is printed for alignments, but the original color sequence (with A=blue, C=green, G=orange, T=red) is printed for unaligned reads without any reported alignments. As always, the --un, --max and --al parameters print reads exactly as they appeared in the input file.

Paired-end colorspace alignment

Like other platforms, SOLiD supports generation of paired-end reads. When colorspace alignment is enabled, the default paired-end orientation setting is --ff. This is because most SOLiD datasets have that orientation.

Note that SOLiD-generated read files can have "orphaned" mates; i.e. mates without a correpsondingly-named mate in the other file. To avoid problems due to orphaned mates, SOLiD paired-end output should first be converted to .csfastq files with unpaired mates omitted. This can be accomplished using, for example, [Galaxy]'s conversion tool (click "NGS: QC and manipulation", then "SOLiD-to-FASTQ" in the left-hand sidebar).




</entry>

<entry [Tue Aug 31 10:31:55 EDT 2010] RECONSTITUTED PARKINSONS DISEASE DATA AFTER WIPE OF /scratch>


NB: NEED _qv.qual FILES AS WELL AS .csfasta
http://bowtie-bio.sourceforge.net/manual.shtml#colorspace-alignment


SOLiD FILES ON NEW GORDO 10.141.60.249
###NOT old penguin server 10.141.55.128


1. MAKE DIRECTORIES

TEST 1 (SOLiD) WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM
--------------
mkdir -p /scratch/syoung/base/pipeline/jvance/pdx/test/1


TEST 2 (SOLiD) WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM
--------------
mkdir -p /scratch/syoung/base/pipeline/jvance/pdx/test/2


CONTROL 1 (ILLUMINA/SOLEXA)
---------------------------
mkdir -p /scratch/syoung/base/pipeline/jvance/pdx/control/1


CONTROL 2 (SOLiD)
-----------------
mkdir -p /scratch/syoung/base/pipeline/jvance/pdx/control/2


REFERENCE hg18
-----------------
mkdir -p /scratch/syoung/base/pipeline/jvance/pdx/reference



2. TRANSFER DATA


TEST 1 (SOLiD)
--------------

WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta 

NB: NOT PAIRED AS SEEN BY THE LACK OF AN R3 FILE IN THIS DIR:

cd /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379/reads
[root@scyld reads]# ll
total 41G
-r--r--r-- 1 corona users 185K Feb 27  2010 WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.stats
-r--r--r-- 1 corona users  13G Feb 27  2010 WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta
-r--r--r-- 1 corona root   29G Apr  7 07:19 WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3_QV.qual


    -r--r--r-- 1 corona users 185K Feb 27  2010 /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379/reads/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.stats
    -r--r--r-- 1 corona users  13G Feb 27  2010 /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379/reads/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta
    -r--r--r-- 1 corona root   29G Apr  7 07:19 /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379/reads/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3_QV.qual




scp /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379/reads/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/test/1
scp /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379/reads/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.stats syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/test/1
scp /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379/reads/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3_QV.qual syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/test/1



scp /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379/reads/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.stats syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/test/1





TO DO:

scp /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM/results.F1B1/primary.20100227230039379/reads/WT_GUNEYPD_20100219_solid0398_WT_57_PD_04PM_F3.csfasta syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/test/1


TEST 2 (SOLiD)
--------------

ll /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_93_PD_04PM/results.F1B1/primary.20100227230039265/reads

    -r--r--r-- 1 corona users 11237051093 Feb 27  2010 WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3.csfasta
    -r--r--r-- 1 corona users 25154122211 Feb 27  2010 WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3_QV.qual
    -r--r--r-- 1 corona users      188609 Feb 27  2010 WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3.stats

scp /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_93_PD_04PM/results.F1B1/primary.20100227230039265/reads/WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3.csfasta   syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/test/2

scp /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_93_PD_04PM/results.F1B1/primary.20100227230039265/reads/WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3.stats  syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/test/2

scp /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_93_PD_04PM/results.F1B1/primary.20100227230039265/reads/WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3_QV.qual syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/test/2



CONTROL 1 (ILLUMINA/SOLEXA)
---------------------------

cp /q/solexa_xfer/M.Kohli_reads/solexa.data.091219_HWI-EAS185_0004_4311VAAXX/Intensities/BaseCalls/AD9/Read1/s_1_1_sequence.txt /scratch/syoung/base/pipeline/jvance/pdx/control/1
cp /q/solexa_xfer/M.Kohli_reads/solexa.data.091219_HWI-EAS185_0004_4311VAAXX/Intensities/BaseCalls/AD9/Read2/s_1_2_sequence.txt /scratch/syoung/base/pipeline/jvance/pdx/control/1


ll /scratch/syoung/base/pipeline/jvance/pdx/control/1

	-rwxrwx--- 1 syoung root 3.6G Jun 15 14:58 s_1_1_sequence.txt
	-rwxrwx--- 1 syoung root 3.7G Jun 15 15:00 s_1_2_sequence.txt



CONTROL 2 (SOLiD)
-----------------

ll /data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/primary.20100408201708800/reads

    -rw-rw-r-- 1 dhedges users  12G Apr  8 16:08 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta
    -rw-rw-r-- 1 dhedges users 204K Apr  8 16:08 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.stats
    -rw-rw-r-- 1 dhedges users  27G Apr  8 16:08 MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3_QV.qual

scp /data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/primary.20100408201708800/reads/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/control/2

scp /data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/primary.20100408201708800/reads/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.stats syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/control/2


scp /data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/primary.20100408201708800/reads/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3_QV.qual syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/control/2



NOTE: ALSO SOME PROCESSING RESULTS FILES:


du -hs /data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219170

    22G     /data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219170


/data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219170/gff3ToSam/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta.ma.50.6.annotated.gff3.sam
/data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219170/maToGff3/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta.ma.50.6.annotated.gff3
/data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219170/maToGff3/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta.ma.50.6.annotated.gff3.contig.range.txt
/data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_CT8_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219170/qvfiltered/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_CT8_04pM_06pM_F3.csfasta


du -hs /data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_D3_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219172
    23G     /data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_D3_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219172

/data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_D3_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219172/gff3ToSam/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_D3_04pM_06pM_F3.csfasta.ma.50.6.annotated.gff3.sam
/data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_D3_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219172/maToGff3/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_D3_04pM_06pM_F3.csfasta.ma.50.6.annotated.gff3
/data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_D3_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219172/maToGff3/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_D3_04pM_06pM_F3.csfasta.ma.50.6.annotated.gff3.contig.range.txt
/data/HIHG_data/solid0396/MartinAD_WT_CT8_D3_20100402_solid0396/Martin_D3_04pM_06pM/results.F1B1/libraries/defaultLibrary/secondary.F3.20100403012219172/qvfiltered/MartinAD_WT_CT8_D3_20100402_solid0396_Martin_D3_04pM_06pM_F3.csfasta





3. GET hg18 REFERENCE ON PENGUIN

ls /data/reference
    drwxrwxrwx 2 corona users 4.0K Oct 20  2009 hg18
    -rwxrwxrwx 1 corona users 1.6K Oct 20  2009 hg18.cmap
    -rwxrwxrwx 1 corona users 3.0G Oct 20  2009 hg18.fa
    -rwxrwxrwx 1 corona users 2.2M Feb 21  2010 raindance_targets.fa
    -rwxrwxrwx 1 corona users 236K Mar 24 12:11 hg18_filter.fa
    -rwxrwxrwx 1 corona users  61M Mar 24 12:15 hg18_exons.gtf
    -rwxrwxrwx 1 corona users 1.3K Apr 18 12:55 hg18.properties

du -hs /data/reference
    8.8G    /data/reference

scp -r /data/reference/* syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance/pdx/reference








NOTES
-----


Colorspace Alignment

As of version 0.12.0, bowtie can align colorspace reads against a colorspace index when -C is specified. Colorspace is the characteristic output format of Applied Biosystems' SOLiD system. In a colorspace read, each character is a color rather than a nucleotide, where a color encodes a class of dinucleotides. E.g. the color blue encodes any of the dinucleotides: AA, CC, GG, TT. Colorspace has the advantage of (often) being able to distinguish sequencing errors from SNPs once the read has been aligned. See ABI's Principles of Di-Base Sequencing document for details.

Colorspace reads

All input formats (FASTA -f, FASTQ -q, raw -r, tab-delimited --12, command-line -c) are compatible with colorspace (-C). When -C is specified, read sequences are treated as colors. Colors may be encoded either as numbers (0=blue, 1=green, 2=orange, 3=red) or as characters A/C/G/T (A=blue, C=green, G=orange, T=red).


Some reads include a primer base as the first character; e.g.:

>1_53_33_F3
T2213120002010301233221223311331
>1_53_70_F3
T2302111203131231130300111123220
...


Here, T is the primer base. bowtie detects and handles primer bases properly (i.e., the primer base and the adjacent color are both trimmed away prior to alignment) as long as the rest of the read is encoded as numbers.

bowtie also handles input in the form of parallel .csfasta and _QV.qual files. Use -f to specify the .csfasta files and -Q (for unpaired reads) or --Q1/--Q2 (for paired-end reads) to specify the corresponding _QV.qual files. It is not necessary to first convert to FASTQ, though bowtie also handles FASTQ-formatted colorspace reads (with -q, the default).


Building a colorspace index

A colorspace index is built in the same way as a normal index except that -C must be specified when running bowtie-build. If the user attempts to use bowtie without -C to align against an index that was built with -C (or vice versa), bowtie prints an error message and quits.

Decoding colorspace alignments

Once a colorspace read is aligned, Bowtie decodes the alignment into nucleotides and reports the decoded nucleotide sequence. A principled decoding scheme is necessary because many different possible decodings are usually possible. Finding the true decoding with 100% certainty requires knowing all variants (e.g. SNPs) in the subject's genome beforehand, which is usually not possible. Instead, bowtie employs the approximate decoding scheme described in the BWA paper. This scheme attempts to distinguish variants from sequencing errors according to their relative likelihood under a model that considers the quality values of the colors and the (configurable) global likelihood of a SNP.

Quality values are also "decoded" so that each reported quality value is a function of the two color qualities overlapping it. Bowtie again adopts the scheme described in the BWA paper, i.e., the decoded nucleotide quality is either the sum of the overlapping color qualities (when both overlapping colors correspond to bases that match in the alignment), the quality of the matching color minus the quality of the mismatching color, or 0 (when both overlapping colors correspond to mismatches).

For accurate decoding, --snpphred/--snpfrac should be set according to the user's best guess of the SNP frequency in the subject. The --snpphred parameter sets the SNP penalty directly (on the Phred quality scale), whereas --snpfrac allows the user to specify the fraction of sites expected to be SNPs; the fraction is then converted to a Phred quality internally. For the purpose of decoding, the SNP fraction is defined in terms of SNPs per haplotype base. Thus, if the genome is diploid, heterozygous SNPs have half the weight of homozygous SNPs

Note that in -S/--sam mode, the decoded nucleotide sequence is printed for alignments, but the original color sequence (with A=blue, C=green, G=orange, T=red) is printed for unaligned reads without any reported alignments. As always, the --un, --max and --al parameters print reads exactly as they appeared in the input file.

Paired-end colorspace alignment

Like other platforms, SOLiD supports generation of paired-end reads. When colorspace alignment is enabled, the default paired-end orientation setting is --ff. This is because most SOLiD datasets have that orientation.

Note that SOLiD-generated read files can have "orphaned" mates; i.e. mates without a correpsondingly-named mate in the other file. To avoid problems due to orphaned mates, SOLiD paired-end output should first be converted to .csfastq files with unpaired mates omitted. This can be accomplished using, for example, [Galaxy]'s conversion tool (click "NGS: QC and manipulation", then "SOLiD-to-FASTQ" in the left-hand sidebar).









RECAP OF DATA PROVENANCE
(Notes-project22-agua.txt
Tue Jun 15 15:09:42 EDT 2010
JEFF VANCE DATA ON PEGASUS)


SAMPLES - TWO PARKINSONS PATIENTS (SOLiD)
-----------------------------------------



TEST 1 (SOLiD)
--------------

SOURCE:

DATA IS ON THE OLD CLUSTER (PENGUIN)
ssh root@10.141.55.128

NOT ON THE NEW PENGUIN2
ssh root@10.141.60.249


ll /scratch/syoung/base/pipeline/jvance/tophat/test/1

	WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM






TEST 2 (SOLiD)
--------------

SOURCE:

DATA IS ON THE OLD CLUSTER (PENGUIN)
ssh root@10.141.55.128

NOT ON THE NEW PENGUIN2
ssh root@10.141.60.249

/scratch/syoung/base/pipeline/jvance/tophat/test/2

	WT_GUNEY_PD_20100219_solid0398/WT_93...





From: Hulme, William 
Sent: Thursday, May 13, 2010 5:10 PM
To: HIHG Support
Cc: Bademci, Guney
Subject: data transfer to ipar


Hello, We have two samples (with two files each) on the old offline cluster that we need transferred to the iPAR.  Notice we don�t know the exact name of the primary folder In the middle of the path name but there is only one primary folder in each location.

SOURCE
Old Cluster: (IP:10.141.55.128)

/data/results/solid0398/RaindanceDVLP_AgilentBO_20100318_solid0398/Sample_AG13_1pM/results/primary#########/reads/RaindanceDVLP_AgilentBO_20100318_solid0398_Sample_AG13_1pM_F3.csfasta
/data/results/solid0398/RaindanceDVLP_AgilentBO_20100318_solid0398/Sample_AG13_1pM/results/primary#########/reads/RaindanceDVLP_AgilentBO_20100318_solid0398_Sample_AG13_1pM_F3_QV.qual






CONTROLS - ONE HEALTHY INDIVIDUAL (SOLiD AND SOLEXA)
----------------------------------------------------





CONTROL 1 (ILLUMINA/SOLEXA)
---------------------------

SOURCE:

/q/solexa_xfer/M.Kohli_reads/solexa.data.091219_HWI-EAS185_0004_4311VAAXX/Intensities/BaseCalls/AD9/Read1/s_1_1_sequence.txt
/q/solexa_xfer/M.Kohli_reads/solexa.data.091219_HWI-EAS185_0004_4311VAAXX/Intensities/BaseCalls/AD9/Read2/s_1_2_sequence.txt

MOVED TO PEGASUS:

ll /scratch/syoung/base/pipeline/jvance/pdx/control/1

	-rwxrwx--- 1 syoung root 3.6G Jun 15 14:58 s_1_1_sequence.txt
	-rwxrwx--- 1 syoung root 3.7G Jun 15 15:00 s_1_2_sequence.txt




CONTROL 2 (SOLiD)
-----------------

SOURCE:

old penguin server 10.141.55.128

/data/results/tertiary/gordo_20100609120037_1/*

(chrystal: CT8.solid.bam - is the wt.sr.bam)




MOVED TO PEGASUS:

scp /data/results/tertiary/gordo_20100609120037_1/CT8.tar.gz syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance

ll /scratch/syoung/base/pipeline/jvance/pdx/control/2


USED hg18 REFERENCE ON PENGUIN:

/data/reference




If you do want the original CT8 (solid) files, I think it would be best to place them onto an external hard drive. I say this because

the .cfasta files is 12G
the .qual file is 27G and the .stats files is 204K and it would suck up all of my computer power to place them into the tmp directory. 








From: Humphries, Crystal 
Sent: Wednesday, June 16, 2010 2:43 PM
To: Young, Stuart
Subject: RE: PD and AZ data

It is the old penguin server 10.141.55.128. 

The location of the file is in the following location: /data/results/tertiary/gordo_20100609120037_1/output/mapping. 
I gave you the wt.sr.bam file.  

From: Young, Stuart 
Sent: Wednesday, June 16, 2010 2:31 PM
To: Humphries, Crystal
Subject: RE: PD and AZ data

Thanks, Crystal!

Just so I can keep tabs on the data�s provenance, could you tell me the location of the files on the Penguin server. Is it the old Penguin server or the new one?

Cheers,

Stuart.



From: Humphries, Crystal 
Sent: Wednesday, June 16, 2010 2:22 PM
To: Young, Stuart
Subject: RE: PD and AZ data

Sorry it took so long, but the solid sample is now in the tmp directory�CT8.solid.bam. 

Crystal Humphries

From: Young, Stuart 
Sent: Tuesday, June 15, 2010 3:07 PM
To: Humphries, Crystal
Subject: RE: PD and AZ data

I don�t have direct access to the Penguin cluster so it�d be great if you could download the files and put them here on Pegasus (pegasus.ccs.miami.edu) or Kronos, whichever is easier:

/tmp/CT8

If you have any difficulty putting the files in that folder, just send me the path to a location of your choice.

Btw, could you tell me the location of the files on the Penguin server. Is it the old Penguin server or the new one?

Cheers,

Stuart.





BACKED UP DB TO 0.5:


perl E:/0.5/bin/scripts/saveDb.pl --db agua --outputdir E:/0.5/bin/sql/0.5



RSS FEED
http://localhost/agua/0.5/dojo.1.4.2/dojox/widget/tests/test_PortletInGridContainer.html


SEQANSWERS RSS FEED
http://seqanswers.com/forums/showthread.php?t=56


USE FOR SPLASH SCREEN
http://localhost/agua/0.5/dojo.1.4.2/dojox/widget/tests/test_Standby.html


ZOOM CHART USING SLIDER
http://localhost/agua/0.5/dojo.1.4.2/dojox/widget/tests/test_PortletInGridContainer.html





</entry>

<entry [Wed Jun  9 12:02:03 EDT 2010] RECEIVED DATA FROM Guney: 470 GB OF DATA ON OLD SOLiD CLUSTER>



du -hs /data/results/solid0398/WT_GUNEY_PD_20100219_solid0398
    
    471G    WT_GUNEY_PD_20100219_solid0398


LL /data/HIHG_data/solid0398/WT_GUNEY_PD_20100219_solid0398/WT_93_PD_04PM/results.F1B1/primary.20100227230039265/reads/WT_GUNEYPD_20100219_solid0398_WT_93_PD_04PM_F3.csfasta