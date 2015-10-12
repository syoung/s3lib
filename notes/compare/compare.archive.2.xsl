
<entry [Tue Nov  9 12:27:10 EST 2010] COMPARE ELAND AND ELAND2>



SAME HEAD AND TAIL BUT SAM FILES ARE NOT IDENTICAL. E.G., ELAND2 IS 415 MB AND
ELAND IS 397 MB:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp

    -rw-rw-rw- 1 syoung root 397M Oct 13 14:43 autochr22/eland/10/chr22/hit.sam

    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/10/chr22/hit.sam


DIFFERENCE IS THAT ELAND2 SAM FILE ENTRIES HAVE AN ADDITIONAL TAG: AS:i:0

DIFF OF IDS SHOWS THAT hit.sam FILES ARE IDENTICAL IN TERMS OF READ IS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
cut -f 1 autochr22/eland/10/chr22/hit.sam > autochr22/eland/10/chr22/hit.sam.ids

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
cut -f 1 chr22/eland/10/chr22/hit.sam > chr22/eland/10/chr22/hit.sam.ids


head -n 5 chr22/eland/10/chr22/hit.sam.ids

    SRR003846.2664345:4:131:814:828
    SRR002309.569323:1:10:696:1673
    SRR004122.2068068:3:110:207:114
    SRR006553.6449241:3:301:107:503
    SRR002272.14669740:4:48:483:618

head -n 5 autochr22/eland/10/chr22/hit.sam.ids

    SRR003846.2664345:4:131:814:828
    SRR002309.569323:1:10:696:1673
    SRR004122.2068068:3:110:207:114
    SRR006553.6449241:3:301:107:503
    SRR002272.14669740:4:48:483:618


diff autochr22/eland/10/chr22/hit.sam.ids chr22/eland/10/chr22/hit.sam.ids
    <NO DIFF>



SAM FILES
---------


SORT SAM FILES ON u03:

screen -S sort-eland

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
time sort -c -k 3,3 -k 4,4n autochr22/eland/10/chr22/hit.sam
    
    real    0m47.237s
    user    0m45.938s
    sys     0m0.973s


screen -S sort-eland

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
time sort -c -k 3,3 -k 4,4n chr22/eland/10/chr22/hit.sam

    real    0m48.726s
    user    0m47.510s
    sys     0m1.027s


CHECK SAM FILE ENTRIES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
ll autochr22/eland/*/chr22/hit.sam

    -rw-rw-rw- 1 syoung root 397M Oct 13 14:43 autochr22/eland/10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:02 autochr22/eland/11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:21 autochr22/eland/12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:42 autochr22/eland/13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 398M Oct 13 16:05 autochr22/eland/14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 16:30 autochr22/eland/15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 16:57 autochr22/eland/16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 17:25 autochr22/eland/17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 17:56 autochr22/eland/18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 18:29 autochr22/eland/19/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 596M Oct 13 13:41 autochr22/eland/1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 19:04 autochr22/eland/20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 19:40 autochr22/eland/21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 396M Oct 13 20:20 autochr22/eland/22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 21:01 autochr22/eland/23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 21:44 autochr22/eland/24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 22:29 autochr22/eland/25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 23:17 autochr22/eland/26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 00:07 autochr22/eland/27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 398M Oct 14 00:57 autochr22/eland/28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 01:50 autochr22/eland/29/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 397M Oct 13 13:42 autochr22/eland/2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 02:45 autochr22/eland/30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 03:42 autochr22/eland/31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 04:42 autochr22/eland/32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 05:45 autochr22/eland/33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:43 autochr22/eland/3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:48 autochr22/eland/4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:48 autochr22/eland/5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:55 autochr22/eland/6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:04 autochr22/eland/7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:15 autochr22/eland/8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:28 autochr22/eland/9/chr22/hit.sam


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
ll chr22/eland/*/chr22/hit.sam

    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 chr22/eland/11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:11 chr22/eland/12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:09 chr22/eland/15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:08 chr22/eland/1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:13 chr22/eland/20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:11 chr22/eland/22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:13 chr22/eland/24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:12 chr22/eland/25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:10 chr22/eland/26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:08 chr22/eland/2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 chr22/eland/30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:12 chr22/eland/33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:10 chr22/eland/3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 chr22/eland/4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:06 chr22/eland/5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:09 chr22/eland/7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/9/chr22/hit.sam




head -n 5  autochr22/eland/10/chr22/hit.sam

    SRR003846.2664345:4:131:814:828 97      chr22   16050003        97      36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    ++++++++++++++++++++&++%++++++++&$+!       MD:Z:33A2       SM:i:97
    SRR002309.569323:1:10:696:1673  97      chr22   16050088        76      36M     =       16050239        187     GCCTCCTCTCGGGACTGGTATGGGGACGGTCCTGCA    +++++++++++++!!+++!++++++""++"&!+("!       MD:Z:31A4       SM:i:76
    SRR004122.2068068:3:110:207:114 161     chr22   16050110        29      36M     =       16050288        214     GGGACGGTCATGCAATCTGGACAACATTCACCTTTA    +++)'++++&#+(!&+$$)%!#!!"!!"!!!!"!!!       MD:Z:36 SM:i:29
    SRR006553.6449241:3:301:107:503 153     chr22   16050110        9       36M     *       0       0       GGGACGGTCATGCATTCTGGACAACATTCACCTTTA    !!!!!!!!!!!!!"!!#!!'""+"*+!!$(#+!&++       MD:Z:21T14      SM:i:9
    SRR002272.14669740:4:48:483:618 89      chr22   16050111        83      36M     *       0       0       GGACGGTCATGCAATCTGGACAACATTCACCTTTAA    !!"*""!++%'+++(+++*+++++++++$+++++++       MD:Z:36 SM:i:83


head -n 5  chr22/eland/10/chr22/hit.sam

    SRR003846.2664345:4:131:814:828 97      chr22   16050003        97      36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    ++++++++++++++++++++&++%++++++++&$+!       XD:Z:33A2       SM:i:97 AS:i:0
    SRR002309.569323:1:10:696:1673  97      chr22   16050088        76      36M     =       16050239        187     GCCTCCTCTCGGGACTGGTATGGGGACGGTCCTGCA    +++++++++++++!!+++!++++++""++"&!+("!       XD:Z:31A4       SM:i:76 AS:i:0
    SRR004122.2068068:3:110:207:114 161     chr22   16050110        29      36M     =       16050288        214     GGGACGGTCATGCAATCTGGACAACATTCACCTTTA    +++)'++++&#+(!&+$$)%!#!!"!!"!!!!"!!!       XD:Z:36 SM:i:29 AS:i:0
    SRR006553.6449241:3:301:107:503 153     chr22   16050110        9       36M     *       0       0       GGGACGGTCATGCATTCTGGACAACATTCACCTTTA    !!!!!!!!!!!!!"!!#!!'""+"*+!!$(#+!&++       XD:Z:14A21      SM:i:9  AS:i:0
    SRR002272.14669740:4:48:483:618 89      chr22   16050111        83      36M     *       0       0       GGACGGTCATGCAATCTGGACAACATTCACCTTTAA    !!"*""!++%'+++(+++*+++++++++$+++++++       XD:Z:36 SM:i:83 AS:i:0

tail -n 5  autochr22/eland/10/chr22/hit.sam

    SRR003840.2658677:7:128:690:971 81      chr22   51244510        44      36M     =       51244344        -202    GCTGTCAGCCTGCCTGGTATGGCGGGAAGGAGGCTG    !!!!!!!!!!!!!!!#%%+#++++++++++++++++       MD:Z:36 SM:i:44
    SRR004842.3990076:6:55:510:947  73      chr22   51244512        69      36M     *       0       0       TGTCAGCCTGCCTGGTATGGCGGGGAGGAGGCTGGG    ++++++++++++++++++++&+(+!!!%!*&!!!!!       MD:Z:24A10T     SM:i:69
    SRR002272.32284887:8:41:461:347 73      chr22   51244516        29      36M     *       0       0       AGCCTGCCTGGTATGGCGGGGAGGAGGCTGGTGCCA    ++++&++++++%"#++$+%!!!"!!!!!!!!!!!!!       MD:Z:20A15      SM:i:29
    SRR002283.13629790:4:81:903:669 145     chr22   51244520        94      36M     =       51244330        -226    TGCGTGGTATGGCGGGAAGGAGGCTGGTGCCAGAGT    ++"!++++++++"++++++++++"++++++%+++++       MD:Z:32G3       SM:i:94
    SRR002314.3171775:1:146:938:748 81      chr22   51244531        24      36M     =       51244358        -209    GCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGATT    !!!!!!"!!!!!$!!"!!""++%+&+++$!++++#+       MD:Z:36 SM:i:24

tail -n 5  chr22/eland/10/chr22/hit.sam

    SRR003840.2658677:7:128:690:971 81      chr22   51244510        44      36M     =       51244344        -202    GCTGTCAGCCTGCCTGGTATGGCGGGAAGGAGGCTG    !!!!!!!!!!!!!!!#%%+#++++++++++++++++       XD:Z:36 SM:i:44 AS:i:0
    SRR004842.3990076:6:55:510:947  73      chr22   51244512        69      36M     *       0       0       TGTCAGCCTGCCTGGTATGGCGGGGAGGAGGCTGGG    ++++++++++++++++++++&+(+!!!%!*&!!!!!       XD:Z:24A10T     SM:i:69 AS:i:0
    SRR002272.32284887:8:41:461:347 73      chr22   51244516        29      36M     *       0       0       AGCCTGCCTGGTATGGCGGGGAGGAGGCTGGTGCCA    ++++&++++++%"#++$+%!!!"!!!!!!!!!!!!!       XD:Z:20A15      SM:i:29 AS:i:0
    SRR002283.13629790:4:81:903:669 145     chr22   51244520        94      36M     =       51244330        -226    TGCGTGGTATGGCGGGAAGGAGGCTGGTGCCAGAGT    ++"!++++++++"++++++++++"++++++%+++++       XD:Z:3C32       SM:i:94 AS:i:0
    SRR002314.3171775:1:146:938:748 81      chr22   51244531        24      36M     =       51244358        -209    GCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGATT    !!!!!!"!!!!!$!!"!!""++%+&+++$!++++#+       XD:Z:36 SM:i:24 AS:i:0



diff autochr22/eland/10/chr22/hit.sam  chr22/eland/10/chr22/hit.sam > diff
ll diff

    -rw-rw-r-- 1 syoung root 822M Nov  9 11:51 diff

head diff

    1,2617141c1,2617141
    < SRR003846.2664345:4:131:814:828       97      chr22   16050003        97      36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    ++++++++++++++++++++&++%++++++++&$+!       MD:Z:33A2       SM:i:97
    < SRR002309.569323:1:10:696:1673        97      chr22   16050088        76      36M     =       16050239        187     GCCTCCTCTCGGGACTGGTATGGGGACGGTCCTGCA    +++++++++++++!!+++!++++++""++"&!+("!       MD:Z:31A4       SM:i:76
    < SRR004122.2068068:3:110:207:114       161     chr22   16050110        29      36M     =       16050288        214     GGGACGGTCATGCAATCTGGACAACATTCACCTTTA    +++)'++++&#+(!&+$$)%!#!!"!!"!!!!"!!!       MD:Z:36 SM:i:29
    < SRR006553.6449241:3:301:107:503       153     chr22   16050110        9       36M     *       0       0       GGGACGGTCATGCATTCTGGACAACATTCACCTTTA    !!!!!!!!!!!!!"!!#!!'""+"*+!!$(#+!&++       MD:Z:21T14      SM:i:9




</entry>



<entry [Tue Nov  9 11:25:36 EST 2010] RERUN BOWTIE-RF FILES 1 AND 9>



1. SAVE OLD RUNS 1 AND 9, AND RERUN:


FILE 1
------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/

screen -S bowtie-rf-1

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1 \
--params " --rf " \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-1 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/bowtie-200bp-chr22-1.out 


    RUNNING
    Fri Nov 12 13:58:15 EST 2010

    BOWTIE.pl    Run time: 01:56:13
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    3:54PM, 12 November 2010
    BOWTIE.pl    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1
ls -alh

    ...
    -rw-rw-rw-  1 syoung root  52M Nov 12 15:53 hit.bam
    -rw-rw-rw-  1 syoung root 2.3M Nov 12 15:54 hit.filter
    -rw-rw-rw-  1 syoung root 9.7M Nov 12 15:54 hit.raw
    -rw-rw-rw-  1 syoung root 150M Nov 12 15:52 hit.sam
    -rw-rw-rw-  1 syoung root 1.1M Nov 12 15:54 hit.snp
    ...


FILE 9
------

screen -S bowtie-rf-9

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-9.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-9.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9 \
--params " --rf " \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-9 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/bowtie-200bp-chr22-9.out 



RUNNING
Tue Nov  9 11:34:32 EST 2010

DONE

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/9/chr22
ll *

    ...
    -rw-rw-rw-  1 syoung root 299M Nov  5 18:45 hit.bam
    -rw-rw-rw-  1 syoung root 8.6M Nov  5 18:47 hit.filter
    -rw-rw-rw-  1 syoung root  20M Nov  5 18:47 hit.raw
    -rw-rw-rw-  1 syoung root 888M Nov  5 18:41 hit.sam
    -rw-rw-rw-  1 syoung root 4.8M Nov  5 18:47 hit.snp
    ...



</entry>



<entry [Mon Nov  8 23:49:46 EST 2010] RUN snpVenn.pl ON BOWTIE>




mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn

ON u02:

screen -S eland-vennsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn \
--replicates 1-33 \
--loop distributed \
--label eland-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/loop-vennsav.out
    
    Run time: 00:04:04
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    0:02AM, 9 November 2010
    ****************************************
    

OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn    
lines *snp


**** PROBLEM: TOTAL SNPS DO NOT ADD UP TO ACTUAL SNPS IN hit.snp FILES


    hit-10-snp-NOT-hit-33-snp: 87
    hit-11-snp-NOT-hit-33-snp: 87
    hit-12-snp-NOT-hit-33-snp: 83
    hit-13-snp-NOT-hit-33-snp: 214
    hit-14-snp-NOT-hit-33-snp: 214
    hit-15-snp-NOT-hit-33-snp: 210
    hit-16-snp-NOT-hit-33-snp: 213
    hit-17-snp-NOT-hit-33-snp: 213
    hit-18-snp-NOT-hit-33-snp: 209
    hit-19-snp-NOT-hit-33-snp: 206
    hit-20-snp-NOT-hit-33-snp: 202
    hit-22-snp-NOT-hit-33-snp: 615
    hit-23-snp-NOT-hit-33-snp: 44
    hit-24-snp-NOT-hit-33-snp: 124
    hit-25-snp-NOT-hit-33-snp: 113
    hit-26-snp-NOT-hit-33-snp: 97
    hit-27-snp-NOT-hit-33-snp: 82
    hit-28-snp-NOT-hit-33-snp: 67
    hit-29-snp-NOT-hit-33-snp: 56
    hit-31-snp-NOT-hit-33-snp: 44
    hit-32-snp-NOT-hit-33-snp: 90
    hit-33-snp-AND-hit-10-snp: 71
    hit-33-snp-AND-hit-11-snp: 71
    hit-33-snp-AND-hit-12-snp: 74
    hit-33-snp-AND-hit-13-snp: 77
    hit-33-snp-AND-hit-14-snp: 78
    hit-33-snp-AND-hit-15-snp: 80
    hit-33-snp-AND-hit-16-snp: 80
    hit-33-snp-AND-hit-17-snp: 82
    hit-33-snp-AND-hit-18-snp: 81
    hit-33-snp-AND-hit-19-snp: 87
    hit-33-snp-AND-hit-20-snp: 88
    hit-33-snp-AND-hit-22-snp: 221
    hit-33-snp-AND-hit-23-snp: 76
    hit-33-snp-AND-hit-24-snp: 92
    hit-33-snp-AND-hit-25-snp: 103
    hit-33-snp-AND-hit-26-snp: 119
    hit-33-snp-AND-hit-27-snp: 134
    hit-33-snp-AND-hit-28-snp: 149
    hit-33-snp-AND-hit-29-snp: 160
    hit-33-snp-AND-hit-31-snp: 171
    hit-33-snp-AND-hit-32-snp: 842
    hit-33-snp-AND-hit-33-snp: 933
    hit-33-snp-AND-hit-3-snp: 62
    hit-33-snp-AND-hit-5-snp: 54
    hit-33-snp-AND-hit-7-snp: 60
    hit-33-snp-AND-hit-8-snp: 74
    hit-33-snp-AND-hit-9-snp: 67
    hit-33-snp-NOT-hit-10-snp: 863
    hit-33-snp-NOT-hit-11-snp: 862
    hit-33-snp-NOT-hit-12-snp: 859
    hit-33-snp-NOT-hit-13-snp: 856
    hit-33-snp-NOT-hit-14-snp: 855
    hit-33-snp-NOT-hit-15-snp: 854
    hit-33-snp-NOT-hit-16-snp: 854
    hit-33-snp-NOT-hit-17-snp: 852
    hit-33-snp-NOT-hit-18-snp: 852
    hit-33-snp-NOT-hit-19-snp: 847
    hit-33-snp-NOT-hit-20-snp: 846
    hit-33-snp-NOT-hit-22-snp: 713
    hit-33-snp-NOT-hit-23-snp: 857
    hit-33-snp-NOT-hit-24-snp: 842
    hit-33-snp-NOT-hit-25-snp: 831
    hit-33-snp-NOT-hit-26-snp: 815
    hit-33-snp-NOT-hit-27-snp: 800
    hit-33-snp-NOT-hit-28-snp: 785
    hit-33-snp-NOT-hit-29-snp: 774
    hit-33-snp-NOT-hit-31-snp: 762
    hit-33-snp-NOT-hit-32-snp: 92
    hit-33-snp-NOT-hit-33-snp: 0
    hit-33-snp-NOT-hit-3-snp: 875
    hit-33-snp-NOT-hit-5-snp: 881
    hit-33-snp-NOT-hit-7-snp: 876
    hit-33-snp-NOT-hit-8-snp: 862
    hit-33-snp-NOT-hit-9-snp: 866
    hit-3-snp-NOT-hit-33-snp: 994
    hit-5-snp-NOT-hit-33-snp: 278
    hit-7-snp-NOT-hit-33-snp: 647
    hit-8-snp-NOT-hit-33-snp: 633
    hit-9-snp-NOT-hit-33-snp: 91


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22

lines *snp

    hit-10.snp: 142036
    hit-11.snp: 140782
    hit-12.snp: 139260
    hit-13.snp: 136750
    hit-14.snp: 134620
    hit-15.snp: 131973
    hit-16.snp: 131973
    hit-17.snp: 129394
    hit-18.snp: 129394
    hit-19.snp: 126675
    hit-1.snp: 77385
    hit-20.snp: 124208
    hit-21.snp: 121730
    hit-22.snp: 121730
    hit-23.snp: 119446
    hit-24.snp: 117181
    hit-25.snp: 115018
    hit-26.snp: 112829
    hit-27.snp: 110803
    hit-28.snp: 108589
    hit-29.snp: 106653
    hit-2.snp: 106305
    hit-31.snp: 104736
    hit-32.snp: 102890
    hit-33.snp: 100846
    hit-3.snp: 122804
    hit-5.snp: 132842
    hit-7.snp: 138307
    hit-8.snp: 141259
    hit-9.snp: 142117



</entry>



<entry [Mon Nov  8 23:49:46 EST 2010] RUN SAV.pl ON BOWTIE>



INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/
ll hit*snp

    -rw-rw-rw- 1 syoung root 4.8M Nov  5 13:44 hit-1.snp
    -rw-rw-rw- 1 syoung root 7.1M Nov  5 13:54 hit-2.snp
    -rw-rw-rw- 1 syoung root 8.9M Nov  5 14:07 hit-3.snp
    -rw-rw-rw- 1 syoung root  11M Nov  5 14:25 hit-5.snp
    -rw-rw-rw- 1 syoung root  12M Nov  5 14:46 hit-7.snp
    -rw-rw-rw- 1 syoung root  12M Nov  5 15:11 hit-8.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 15:38 hit-9.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 16:09 hit-10.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 16:44 hit-11.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 17:22 hit-12.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 18:43 hit-13.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 19:27 hit-14.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 20:13 hit-15.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 20:15 hit-16.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 21:05 hit-17.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 21:07 hit-18.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 22:07 hit-19.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 23:06 hit-20.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 00:11 hit-21.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 00:13 hit-22.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 01:20 hit-23.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 02:31 hit-24.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 03:48 hit-25.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 05:38 hit-26.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 07:01 hit-27.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 08:23 hit-28.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 09:48 hit-29.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 11:31 hit-31.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 13:05 hit-32.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 14:42 hit-33.snp



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative


ON u03:

screen -S bowtie-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--replicates 1-33 \
--loop distributed \
--label bowtie-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/loop-sav.out
    

RUNNING 
Mon Nov  8 23:54:47 EST 2010


NB: FILE 2 MISSING

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ll *sav

    -rw-rw-rw- 1 syoung root 8.9M Nov  9 09:30 hit-1.sav
    -rw-rw-rw- 1 syoung root  16M Nov  9 08:32 hit-3.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 22:21 hit-5.sav
    -rw-rw-rw- 1 syoung root  19M Nov  9 13:37 hit-7.sav
    -rw-rw-rw- 1 syoung root  20M Nov  9 13:53 hit-8.sav
    -rw-rw-rw- 1 syoung root  20M Nov 11 02:26 hit-9.sav
    -rw-rw-rw- 1 syoung root  21M Nov 11 02:26 hit-10.sav
    -rw-rw-rw- 1 syoung root  21M Nov 11 02:21 hit-11.sav
    -rw-rw-rw- 1 syoung root  21M Nov 11 02:15 hit-12.sav
    -rw-rw-rw- 1 syoung root  21M Nov 10 06:31 hit-13.sav
    -rw-rw-rw- 1 syoung root  21M Nov 10 06:20 hit-14.sav
    -rw-rw-rw- 1 syoung root  21M Nov 10 06:06 hit-15.sav
    -rw-rw-rw- 1 syoung root  21M Nov 10 06:06 hit-16.sav
    -rw-rw-rw- 1 syoung root  20M Nov 10 05:52 hit-17.sav
    -rw-rw-rw- 1 syoung root  20M Nov 10 05:52 hit-18.sav
    -rw-rw-rw- 1 syoung root  20M Nov 10 05:29 hit-19.sav
    -rw-rw-rw- 1 syoung root  20M Nov 10 05:03 hit-20.sav
    -rw-rw-rw- 1 syoung root  20M Nov  9 10:13 hit-22.sav
    -rw-rw-rw- 1 syoung root  19M Nov 10 23:46 hit-23.sav
    -rw-rw-rw- 1 syoung root  19M Nov 11 01:38 hit-24.sav
    -rw-rw-rw- 1 syoung root  19M Nov 10 23:41 hit-25.sav
    -rw-rw-rw- 1 syoung root  19M Nov 10 22:50 hit-26.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 21:51 hit-27.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 21:16 hit-28.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 20:47 hit-29.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 19:52 hit-31.sav
    -rw-rw-rw- 1 syoung root  18M Nov  9 09:20 hit-32.sav
    -rw-rw-rw- 1 syoung root  17M Nov  9 09:11 hit-33.sav



</entry>



<entry [Mon Nov  8 23:35:07 EST 2010] RUN bamCoverage.pl ON BOWTIE>




INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/
ll merged.bam*

    -rw-r--r-- 1 syoung root 299M Nov  5 13:44 merged.bam-1
    -rw-r--r-- 1 syoung root 588M Nov  5 13:53 merged.bam-2
    -rw-r--r-- 1 syoung root 875M Nov  5 14:06 merged.bam-3
    -rw-r--r-- 1 syoung root 1.2G Nov  5 14:22 merged.bam-4
    -rw-r--r-- 1 syoung root 1.2G Nov  5 14:23 merged.bam-5
    -rw-r--r-- 1 syoung root 1.5G Nov  5 14:43 merged.bam-6
    -rw-r--r-- 1 syoung root 1.5G Nov  5 14:44 merged.bam-7
    -rw-r--r-- 1 syoung root 1.7G Nov  5 15:09 merged.bam-8
    -rw-r--r-- 1 syoung root 2.0G Nov  5 15:35 merged.bam-9
    -rw-r--r-- 1 syoung root 2.3G Nov  5 16:06 merged.bam-10
    -rw-r--r-- 1 syoung root 2.6G Nov  5 16:40 merged.bam-11
    -rw-r--r-- 1 syoung root 2.8G Nov  5 17:18 merged.bam-12
    -rw-r--r-- 1 syoung root 3.1G Nov  5 18:38 merged.bam-13
    -rw-r--r-- 1 syoung root 3.4G Nov  5 19:21 merged.bam-14
    -rw-r--r-- 1 syoung root 2.0G Nov  5 20:07 merged.bam-15
    -rw-r--r-- 1 syoung root 3.6G Nov  5 20:09 merged.bam-16
    -rw-rw-rw- 1 syoung root 3.1G Nov  5 20:59 merged.bam-17
    -rw-rw-rw- 1 syoung root 3.9G Nov  5 21:01 merged.bam-18
    -rw-rw-rw- 1 syoung root 4.2G Nov  5 21:59 merged.bam-19
    -rw-rw-rw- 1 syoung root 4.5G Nov  5 22:59 merged.bam-20
    -rw-rw-rw- 1 syoung root 4.2G Nov  6 00:03 merged.bam-21
    -rw-rw-rw- 1 syoung root 4.7G Nov  6 00:05 merged.bam-22
    -rw-rw-rw- 1 syoung root 5.0G Nov  6 01:11 merged.bam-23
    -rw-rw-rw- 1 syoung root 5.3G Nov  6 02:21 merged.bam-24
    -rw-rw-rw- 1 syoung root 5.5G Nov  6 03:37 merged.bam-25
    -rw-rw-rw- 1 syoung root 5.8G Nov  6 05:21 merged.bam-26
    -rw-rw-rw- 1 syoung root 6.1G Nov  6 06:49 merged.bam-27
    -rw-rw-rw- 1 syoung root 6.3G Nov  6 08:10 merged.bam-28
    -rw-rw-rw- 1 syoung root 6.6G Nov  6 09:35 merged.bam-29
    -rw-rw-rw- 1 syoung root 6.9G Nov  6 11:09 merged.bam-30
    -rw-rw-rw- 1 syoung root 6.9G Nov  6 11:17 merged.bam-31
    -rw-rw-rw- 1 syoung root 7.1G Nov  6 12:50 merged.bam-32
    -rw-rw-rw- 1 syoung root 7.4G Nov  6 14:26 merged.bam-33



1. INDEX BAM FILES

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--loop distributed \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/indexBam.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/merged.bam-%REPLICATE%.bai \
--label bamIndex \
--cluster LSF \
--maxjobs 1000 \
--queue small


    screen -S bow-index
    RUNNING Mon Nov  8 23:48:44 EST 2010
    
    Run time: 00:24:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    0:09AM, 9 November 2010
    ****************************************


    #Run time: 00:12:34
    #Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    #0:51AM, 5 November 2010
    #****************************************




2. RUN bamCoverage.pl ON BOWTIE

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative

ON u02:
------

screen -S bowtie-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/merged.bam-%REPLICATE%.coverage \
--replicates 1-33 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/bamCoverage.out


    RUNNING
    Tue Nov  9 12:49:52 EST 2010
    
    Run time: 00:55:37
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:45PM, 9 November 2010
    ****************************************

COVERAGES FROM *coverage FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22

    1	 3.727890
    2	 7.455688
    3	 11.183353
    4	 14.911706
    5	 14.911706
    6	 18.638961
    7	 18.638961
    8	 22.367925
    9	 26.096812
    10	 29.819974
    11	 33.545705
    12	 37.271978
    13	 41.001346
    14	 44.727550
    15	 26.079758
    16	 48.455376
    17	 41.792664
    18	 52.183249
    19	 55.910635
    20	 59.640799
    21	 56.709501
    22	 63.365502
    23	 67.095555
    24	 70.826948
    25	 74.561562
    26	 78.289272
    27	 82.018202
    28	 85.749972
    29	 89.480562
    30	 93.207338
    31	 93.207338
    32	 96.935742
    33	 100.668568


</entry>



<entry [Sat Nov  6 01:54:03 EDT 2010] RERUN ELAND.pl TO CONFIRM READ HITS>




ALL FILES 1-33
--------------

mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland

screen -S loop-eland-chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/ELAND.pl \
--replicates 1-33 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--inputtype fastq \
--species human \
--label eland-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chr22 \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%/eland-chr22-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/loop-eland-chr.stdout
    
    ALIGNMENT ONLY

    Run time: 04:41:29
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:34AM, 6 November 2010
    ****************************************


    POST-ALIGNMENT

    Run time: 00:43:17
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:16AM, 6 November 2010
    ****************************************


COMPARE RESULTING hit.sam FILES WITH FIRST ELAND RUN (eland):

FIRST RUN:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ll */chr22/hit.sam

    -rw-rw-r-- 1 syoung root 596M Oct 13 13:41 1/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 397M Oct 13 13:42 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:43 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:48 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:48 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:55 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:04 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:15 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:28 9/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:43 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:02 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:21 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:42 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 398M Oct 13 16:05 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 16:30 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 16:57 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 17:25 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 17:56 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 18:29 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 19:04 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 19:40 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 396M Oct 13 20:20 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 21:01 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 21:44 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 22:29 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 23:17 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 00:07 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 398M Oct 14 00:57 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 01:50 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 02:45 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 03:42 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 04:42 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 05:45 33/chr22/hit.sam


SECOND RUN (eland):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland
ll */chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:08 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:08 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:10 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:06 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:09 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 9/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:11 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:09 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:13 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:11 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:13 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:12 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:10 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:12 33/chr22/hit.sam

ll */chr22/hit.snp

    -rw-rw-rw- 1 syoung root 704K Nov  6 11:14 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 702K Nov  6 11:12 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 695K Nov  6 11:14 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 701K Nov  6 11:13 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 700K Nov  6 11:14 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 698K Nov  6 11:13 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 694K Nov  6 11:16 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 701K Nov  6 11:16 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 699K Nov  6 11:16 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 692K Nov  6 11:16 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 691K Nov  6 11:11 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 696K Nov  6 11:16 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 699K Nov  6 11:15 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 706K Nov  6 11:15 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 700K Nov  6 11:16 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 706K Nov  6 11:16 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 702K Nov  6 11:16 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 695K Nov  6 11:13 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 703K Nov  6 11:14 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 702K Nov  6 11:14 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 703K Nov  6 11:16 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 700K Nov  6 11:11 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 701K Nov  6 11:13 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 697K Nov  6 11:16 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 693K Nov  6 11:14 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 701K Nov  6 11:05 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 697K Nov  6 11:14 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 702K Nov  6 11:13 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 699K Nov  6 11:09 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 689K Nov  6 11:14 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 698K Nov  6 11:13 7/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 693K Nov  6 11:13 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 709K Nov  6 11:14 9/chr22/hit.snp




COMPARE FILE 1 hit.sam BETWEEN eland AND eland


ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

head -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
head -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

tail -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
tail -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam


ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
    
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:08 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

    -rw-rw-r-- 1 syoung root 596M Oct 13 13:41 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam


head -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam

    SRR004823.14378:3:1:253:207     97      chr22   16050016        74      36M     =       16050195        215     AGGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTC  ++++++++++++++&++++++++"+++++!!+!""!     XD:Z:20A15      SM:i:74 AS:i:0
    SRR002304.7863377:1:90:544:448  97      chr22   16050031        30      36M     =       16050192        197     CTGTGCGACCTTGGCCAAGTCACTTCCCCCTTCAGG  +++++++++++++&!+#!#!+++!!!!!!"!!!"!!     XD:Z:5A21T8     SM:i:30 AS:i:0
    SRR002301.2006530:3:94:327:904  97      chr22   16050036        44      36M     =       16050211        211     CGACCTTGGCCAAGTCACTTCCTCCTTCAGGAACAT  ++++++++++++++++++++&!!"$$!"!"!!!!!%     XD:Z:A35        SM:i:44 AS:i:0
    SRR006554.5571971:2:259:467:605 73      chr22   16050041        9       36M     *       0       0       TTGGCCAAGTCACTTCCTCCTTCAGGAACATTGCAG    +++++"!#'$!!#''"!&!%!$!!!"!!!!!"!!!!   XD:Z:36 SM:i:9  AS:i:0
    SRR002319.5673218:1:61:1847:1157        89      chr22   16050048        34      36M     *       0       0       AGTCACTTCCTCCTTCAGGAACATTGCAGTGGGCCT  '!!(!+"!")!"+!!++!!%+++#"!++!$!"!+++     XD:Z:36 SM:i:34 AS:i:0

head -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

    SRR005734.12612956:4:39:1116:140        153     chr22   16050009        81      36M     *       0       0       AAGTCCCAGGACTTCAGAAGAGCTCTGTGACCTTGG  )+!"++++++++++++++++++++++++++++++++     MD:Z:8T2C24     SM:i:81
    SRR005735.1021891:1:16:1497:601 89      chr22   16050009        87      36M     *       0       0       AAGTCCCAGGACTTCAGAAGAGCTGTGCGACCTTGG    ++*%++++"+%++!++++++++++++++++++++++   MD:Z:8T27       SM:i:87
    SRR005720.9831257:3:235:581:574 153     chr22   16050017        27      36M     *       0       0       GGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTCA    !!!!!!!""&$#!%)!#!"+*!&+!+++++++++++   MD:Z:16T19      SM:i:27
    SRR005735.21683701:4:59:929:555 73      chr22   16050023        113     36M     *       0       0       CAGAAGAGCTGTGAGACCTTGGCCAAGTCACTTCCT    +++++++++++++++++++++++++&++++++++++   MD:Z:36 SM:i:113
    SRR005718.21685282:4:313:915:176        137     chr22   16050025        30      36M     *       0       0       GAAGAGCTGTGAGACCTTGGCCAAGTCACTTCCTCC  +#&+!+!++!+++++""(++!!"!"!!!!!!!"!!!     MD:Z:36 SM:i:30

tail -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam

    SRR004871.3855306:8:174:104:929 81      chr22   51244531        74      36M     =       51244346        -221    GCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGATT  #!!!"""$%+(&+!)+++++++++++++++++++++     XD:Z:36 SM:i:74 AS:i:0
    SRR006550.2370763:4:122:601:946 145     chr22   51244531        5       36M     =       51244362        -205    GCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGTATT  !!!!!!!!!!!!!!!!"!!!!"&!!$(+'+++)++"     XD:Z:32G3       SM:i:5  AS:i:0
    SRR002295.7188026:2:78:968:939  73      chr22   51244534        91      36M     *       0       0       GGAAGGAGGCTGGTGCCAGAGTGGATTCGGATTTAT    +++++++++++++++++*+)+*+++++!#*!(+!!%   XD:Z:33NNN      SM:i:91 AS:i:0
    SRR002307.7032921:2:87:309:1550 73      chr22   51244535        28      36M     *       0       0       GAAGGAGGCTGGTGCCAGAGTGGAGGCGGATTGAGC    +"*++!++!++++"#$++!!!++!!!!!$!!!$!!!   XD:Z:24TT6NNNN  SM:i:28 AS:i:0
    SRR003852.5377630:3:267:930:51  137     chr22   51244535        24      36M     *       0       0       GAAGGAGGCTGGTGCCAGAGTGGATTCGGATTGATC    ++++++++!&++!+!!!%!"!!%!!!!!!!!"!!!!   XD:Z:32NNNN     SM:i:24 AS:i:0


tail -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

    SRR005734.8715020:3:41:157:166  153     chr22   51244527        115     36M     *       0       0       TATGGCGGGAAGGAGGCTGGTGCCAGAGTGGATTCG    ++++++++++++++++++++++++++++++++++++   MD:Z:36 SM:i:115
    SRR005718.8179590:2:176:348:845 137     chr22   51244528        69      36M     *       0       0       ATGGCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGG    ++++++++""++)++++++#+)+!+!+!%+!%"!!+   MD:Z:36 SM:i:69
    SRR005718.19181891:4:171:25:300 97      chr22   51244529        77      36M     =       51242930        -1563   TGGCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGA  ++++++++++++++++++%+%"++(+!++#"$!#*!     MD:Z:36 SM:i:77
    SRR005719.7077536:3:143:149:601 97      chr22   51244530        43      36M     =       51242420        -2074   GGCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGAT  +++++++++++++!)++!)!!!!!"!"!!!!!!!!!     MD:Z:36 SM:i:43
    SRR005718.1445461:1:82:765:909  161     chr22   51244532        63      36M     =       51243049        -1447   CGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGGTTG  +++++++++++++++!+++$+!+!&#!*+$+++!%!     MD:Z:32A2N      SM:i:63


READS MATCHED IN eland FILE 1 ARE NOT FOUND IN eland FILE 1:
(TOTALLY DIFFERENT INPUT FILES?)

grep -n SRR005734.12612956:4:39:1116:140 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
grep -n SRR005735.1021891:1:16:1497:601 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
grep -n SRR005720.9831257:3:235:581:574 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
grep -n SRR005735.21683701:4:59:929:555 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam    
grep -n SRR005718.21685282:4:313:915:176 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam




DO samVenn.pl TO CONFIRM:

ON u04:

screen -S eland-samvenn


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn

rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn/samvenn.sh
emacs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn/samvenn.sh
#!/bin/sh

#BSUB -J eland-samVenn
#BSUB -W 24:00
#BSUB -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn/samVenn.out
#BSUB -e /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn/samVenn.err

echo "Comparing FILE 1 hit.sam from eland and eland alignments"

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn \
--querylabel eland \
--targetlabel eland 

echo "Completed samVenn.pl"


RUN

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn
bsub -q small < samvenn.sh


RUNNING

    bsub -q small < samvenn.sh
    Job <2258539> is submitted to queue <small>.
    Tue Nov  9 12:12:28 EST 2010



NOTES
-----

PROBLEM:

/nethome/bioinfo/apps/samtools/0.1.8/export2sam.pl: No such file or directory

SOLUTION:

ADJUST LOCATION OF export2sam.pl DEPENDING ON THE VERSION OF SAMTOOLS



</entry>



<entry [Fri Nov  5 08:53:03 EDT 2010] RUN snpVenn.pl ON ELAND SNPS (LAST-AGAINST-ALL)>



INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ll hit*.snp

-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-10.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-11.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-12.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-13.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-14.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-15.snp
-rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-16.snp
-rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-17.snp
-rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-18.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-19.snp
-rw-rw-r-- 1 syoung root 1.5M Oct 21 12:51 hit-1.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-20.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-21.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-22.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-23.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-24.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-25.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-26.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-27.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-28.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-29.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-30.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-31.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-32.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-33.snp
-rw-rw-r-- 1 syoung root 1.4M Oct 21 12:51 hit-3.snp
-rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-4.snp
-rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-5.snp
-rw-rw-r-- 1 syoung root 2.0M Oct 21 12:51 hit-6.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-7.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-8.snp
-rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-9.snp


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ll hit*.sav

-rw-rw-rw- 1 syoung root 3.9M Oct 27 06:19 hit-10.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 06:31 hit-11.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 06:30 hit-12.sav
-rw-rw-rw- 1 syoung root 4.0M Oct 27 06:30 hit-13.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 06:29 hit-14.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 09:17 hit-15.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 09:14 hit-16.sav
-rw-rw-rw- 1 syoung root 3.8M Oct 27 09:11 hit-17.sav
-rw-rw-rw- 1 syoung root 3.8M Oct 27 09:06 hit-18.sav
-rw-rw-rw- 1 syoung root 3.7M Oct 27 09:03 hit-19.sav
-rw-rw-rw- 1 syoung root 2.9M Oct 27 14:49 hit-1.sav
-rw-rw-rw- 1 syoung root 3.7M Oct 27 09:01 hit-20.sav
-rw-rw-rw- 1 syoung root 3.7M Oct 27 08:58 hit-21.sav
-rw-rw-rw- 1 syoung root 3.6M Oct 27 08:53 hit-22.sav
-rw-rw-rw- 1 syoung root 3.6M Oct 27 06:07 hit-23.sav
-rw-rw-rw- 1 syoung root 3.5M Oct 27 06:06 hit-24.sav
-rw-rw-rw- 1 syoung root 3.5M Oct 27 06:04 hit-25.sav
-rw-rw-rw- 1 syoung root 3.4M Oct 27 06:04 hit-26.sav
-rw-rw-rw- 1 syoung root 3.4M Oct 27 06:03 hit-27.sav
-rw-rw-rw- 1 syoung root 3.4M Oct 27 06:01 hit-28.sav
-rw-rw-rw- 1 syoung root 3.4M Oct 27 06:00 hit-29.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 05:57 hit-30.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 05:03 hit-31.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 05:01 hit-32.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 05:00 hit-33.sav
-rw-rw-rw- 1 syoung root 2.4M Oct 27 05:19 hit-3.sav
-rw-rw-rw- 1 syoung root 2.9M Oct 27 05:52 hit-4.sav
-rw-rw-rw- 1 syoung root 2.9M Oct 27 05:52 hit-5.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 06:04 hit-6.sav
-rw-rw-rw- 1 syoung root 3.5M Oct 27 06:11 hit-7.sav
-rw-rw-rw- 1 syoung root 3.7M Oct 27 06:15 hit-8.sav
-rw-rw-rw- 1 syoung root 3.8M Oct 27 06:18 hit-9.sav



1. ALL SNPS
-----------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn

ON u03:

screen -S eland-vennsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--replicates 2-33 \
--loop distributed \
--label eland-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/loop-vennsav.out
    
    Run time: 00:16:49
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    4:10PM, 5 November 2010
    ****************************************




OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn
lines *-snp

    hit-1-snp-NOT-hit-33-snp	20720
    hit-3-snp-NOT-hit-33-snp	14918
    hit-4-snp-NOT-hit-33-snp	16801
    hit-5-snp-NOT-hit-33-snp	16801
    hit-6-snp-NOT-hit-33-snp	17261
    hit-7-snp-NOT-hit-33-snp	17119
    hit-8-snp-NOT-hit-33-snp	16585
    hit-9-snp-NOT-hit-33-snp	15968
    hit-10-snp-NOT-hit-33-snp	15236
    hit-11-snp-NOT-hit-33-snp	14457
    hit-12-snp-NOT-hit-33-snp	13645
    hit-13-snp-NOT-hit-33-snp	12815
    hit-14-snp-NOT-hit-33-snp	12058
    hit-15-snp-NOT-hit-33-snp	11233
    hit-16-snp-NOT-hit-33-snp	10415
    hit-17-snp-NOT-hit-33-snp	9724
    hit-18-snp-NOT-hit-33-snp	8918
    hit-19-snp-NOT-hit-33-snp	8238
    hit-20-snp-NOT-hit-33-snp	7610
    hit-21-snp-NOT-hit-33-snp	7111
    hit-22-snp-NOT-hit-33-snp	6456
    hit-23-snp-NOT-hit-33-snp	5882
    hit-24-snp-NOT-hit-33-snp	5244
    hit-25-snp-NOT-hit-33-snp	4600
    hit-26-snp-NOT-hit-33-snp	4142
    hit-27-snp-NOT-hit-33-snp	3651
    hit-28-snp-NOT-hit-33-snp	3136
    hit-29-snp-NOT-hit-33-snp	2606
    hit-30-snp-NOT-hit-33-snp	2046
    hit-31-snp-NOT-hit-33-snp	1482
    hit-32-snp-NOT-hit-33-snp	843


    hit-33-snp-AND-hit-10-snp	10093
    hit-33-snp-AND-hit-11-snp	10960
    hit-33-snp-AND-hit-12-snp	11693
    hit-33-snp-AND-hit-13-snp	12433
    hit-33-snp-AND-hit-14-snp	13027
    hit-33-snp-AND-hit-15-snp	13593
    hit-33-snp-AND-hit-16-snp	14108
    hit-33-snp-AND-hit-17-snp	14562
    hit-33-snp-AND-hit-18-snp	14936
    hit-33-snp-AND-hit-19-snp	15360
    hit-33-snp-AND-hit-1-snp	3563
    hit-33-snp-AND-hit-20-snp	15727
    hit-33-snp-AND-hit-21-snp	16033
    hit-33-snp-AND-hit-22-snp	16383
    hit-33-snp-AND-hit-23-snp	16728
    hit-33-snp-AND-hit-24-snp	17016
    hit-33-snp-AND-hit-25-snp	17329
    hit-33-snp-AND-hit-26-snp	17672
    hit-33-snp-AND-hit-27-snp	18004
    hit-33-snp-AND-hit-28-snp	18277
    hit-33-snp-AND-hit-29-snp	18614
    hit-33-snp-AND-hit-30-snp	18953
    hit-33-snp-AND-hit-31-snp	19333
    hit-33-snp-AND-hit-32-snp	19775
    hit-33-snp-AND-hit-33-snp	20467
    hit-33-snp-AND-hit-3-snp	3331
    hit-33-snp-AND-hit-4-snp	4404
    hit-33-snp-AND-hit-5-snp	4404
    hit-33-snp-AND-hit-6-snp	5634
    hit-33-snp-AND-hit-7-snp	6961
    hit-33-snp-AND-hit-8-snp	8090
    hit-33-snp-AND-hit-9-snp	9160


    hit-33-snp-NOT-hit-10-snp	10374
    hit-33-snp-NOT-hit-11-snp	9507
    hit-33-snp-NOT-hit-12-snp	8774
    hit-33-snp-NOT-hit-13-snp	8034
    hit-33-snp-NOT-hit-14-snp	7440
    hit-33-snp-NOT-hit-15-snp	6874
    hit-33-snp-NOT-hit-16-snp	6359
    hit-33-snp-NOT-hit-17-snp	5905
    hit-33-snp-NOT-hit-18-snp	5531
    hit-33-snp-NOT-hit-19-snp	5107
    hit-33-snp-NOT-hit-1-snp	16904
    hit-33-snp-NOT-hit-20-snp	4740
    hit-33-snp-NOT-hit-21-snp	4434
    hit-33-snp-NOT-hit-22-snp	4084
    hit-33-snp-NOT-hit-23-snp	3739
    hit-33-snp-NOT-hit-24-snp	3451
    hit-33-snp-NOT-hit-25-snp	3138
    hit-33-snp-NOT-hit-26-snp	2795
    hit-33-snp-NOT-hit-27-snp	2463
    hit-33-snp-NOT-hit-28-snp	2190
    hit-33-snp-NOT-hit-29-snp	1853
    hit-33-snp-NOT-hit-30-snp	1514
    hit-33-snp-NOT-hit-31-snp	1134
    hit-33-snp-NOT-hit-32-snp	692
    hit-33-snp-NOT-hit-33-snp	0
    hit-33-snp-NOT-hit-3-snp	17136
    hit-33-snp-NOT-hit-4-snp	16063
    hit-33-snp-NOT-hit-5-snp	16063
    hit-33-snp-NOT-hit-6-snp	14833
    hit-33-snp-NOT-hit-7-snp	13506
    hit-33-snp-NOT-hit-8-snp	12377
    hit-33-snp-NOT-hit-9-snp	11307




GET TOTAL LINES PER SNP:


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/
ll *snp

    hit-1.snp	24284
    hit-3.snp	18250
    hit-4.snp	21206
    hit-5.snp	21206
    hit-6.snp	22896
    hit-7.snp	24081
    hit-8.snp	24676
    hit-9.snp	25129
    hit-10.snp	25330
    hit-11.snp	25418
    hit-12.snp	25339
    hit-13.snp	25249
    hit-14.snp	25086
    hit-15.snp	24827
    hit-16.snp	24524
    hit-17.snp	24287
    hit-18.snp	23855
    hit-19.snp	23599
    hit-20.snp	23338
    hit-21.snp	23145
    hit-22.snp	22840
    hit-23.snp	22611
    hit-24.snp	22261
    hit-25.snp	21930
    hit-26.snp	21815
    hit-27.snp	21656
    hit-28.snp	21414
    hit-29.snp	21221
    hit-30.snp	21000
    hit-31.snp	20816
    hit-32.snp	20619
    hit-33.snp	20468



DO FILE 2 VS FILE 33 MANUALLY:

PROBLEM:

MISSING ELAND FILE 2 CUMULATIVE *.sav FILE

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-2.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--querylabel hit-33-sav \
--targetlabel hit-2-sav

    Can't open target file: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-2.sav



DIAGNOSIS:

ELAND FILE 2 hit.sam FILE IS PRESENT BUT hit.snp FILE IS MISSING:
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/2/chr22
ll
    drwxrwxr-x 2 syoung root  445 Oct 29 16:47 .
    drwxrwxr-x 3 syoung root   15 Oct 13 13:23 ..
    -rw-rw-rw- 1 syoung root 2.2K Oct 29 16:45 eland-chr22-indexBam-2.out
    -rw-rw-rw- 1 syoung root  769 Oct 29 13:42 eland-chr22-samToBam-2.out
    -rw-rw-rw- 1 syoung root 1.7K Oct 29 14:55 eland-chr22-sortBam-2.out
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 hit.bam
    -rw-rw-r-- 1 syoung root 397M Oct 13 13:42 hit.sam
    -rw-rw-r-- 1 syoung root 119M Oct 13 13:23 hit.sam.gz
    -rw-rw-r-- 1 syoung root 1.5K Oct 13 13:23 hit.sam.head
    -rw-rw-r-- 1 syoung root 1.6K Oct 13 13:23 hit.sam.tail
    -rw-r--r-- 1 syoung root 128M Oct 29 14:55 hit.sorted.bam
    -rw-rw-rw- 1 syoung root  96K Oct 29 16:44 hit.sorted.bam.bai
    -rw-rw-rw- 1 syoung root   17 Oct 30 02:39 hit.sorted.bam.genome-coverage
    -rwxrwxrwx 1 syoung root 1.1K Oct 29 16:44 indexBam.sh
    -rw-rw-rw- 1 syoung root 1.7K Oct 29 16:44 indexBam-stdout.txt
    -rwxrwxrwx 1 syoung root 1.1K Oct 29 13:41 samToBam.sh
    -rw-rw-rw- 1 syoung root 1.7K Oct 29 13:42 samToBam-stdout.txt
    -rwxrwxrwx 1 syoung root 1.1K Oct 29 14:54 sortBam.sh
    -rw-rw-rw- 1 syoung root 1.7K Oct 29 14:55 sortBam-stdout.txt


SOLUTION:

RERUN cumulativeSnp.pl ON ELAND2


screen -S eland-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/cumulativeSnp.out


STOPPED AT FILE 9:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22

ll merged.bam*

    -rw-rw-rw- 1 syoung root 1.1G Nov  9 13:02 merged.bam
    -rw-rw-rw- 1 syoung root 128M Nov  9 11:23 merged.bam-1
    -rw-rw-rw- 1 syoung root 250M Nov  9 11:29 merged.bam-2
    -rw-rw-rw- 1 syoung root 369M Nov  9 11:36 merged.bam-3
    -rw-rw-rw- 1 syoung root 486M Nov  9 11:45 merged.bam-4
    -rw-rw-rw- 1 syoung root 602M Nov  9 11:57 merged.bam-5
    -rw-rw-rw- 1 syoung root 717M Nov  9 12:10 merged.bam-6
    -rw-rw-rw- 1 syoung root 831M Nov  9 12:26 merged.bam-7
    -rw-rw-rw- 1 syoung root 945M Nov  9 12:43 merged.bam-8
    -rw-rw-rw- 1 syoung root 1.1G Nov  9 13:02 merged.bam-9
    -rw-rw-rw- 1 syoung root 1.1G Nov  9 12:51 merged.bam.temp

ll hit*.snp

    -rw-rw-rw- 1 syoung root 691K Nov  9 11:24 hit-1.snp
    -rw-rw-rw- 1 syoung root 1.2M Nov  9 11:30 hit-2.snp
    -rw-rw-rw- 1 syoung root 1.5M Nov  9 11:37 hit-3.snp
    -rw-rw-rw- 1 syoung root 1.8M Nov  9 11:47 hit-4.snp
    -rw-rw-rw- 1 syoung root 2.0M Nov  9 11:58 hit-5.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov  9 12:12 hit-6.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov  9 12:28 hit-7.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov  9 12:45 hit-8.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov  9 13:05 hit-9.snp


NB: COMPARED TO ORIGINAL eland CUMULATIVE SNPS (MISSING FILE 2):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ll hit*.snp

    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-10.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-11.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-12.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-13.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-14.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-15.snp
    -rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-16.snp
    -rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-17.snp
    -rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-18.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-19.snp
    -rw-rw-r-- 1 syoung root 1.5M Oct 21 12:51 hit-1.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-20.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-21.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-22.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-23.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-24.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-25.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-26.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-27.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-28.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-29.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-30.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-31.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-32.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-33.snp
    -rw-rw-r-- 1 syoung root 1.4M Oct 21 12:51 hit-3.snp
    -rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-4.snp
    -rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-5.snp
    -rw-rw-r-- 1 syoung root 2.0M Oct 21 12:51 hit-6.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-7.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-8.snp
    -rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-9.snp

RESTART FROM FILE 10:





screen -S eland-cum

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/33 \
--start 10 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/cumulativeSnp.out2


    RUNNING
    Fri Nov 12 11:07:27 EST 2010


tail /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/cumulativeSnp.out2

    cumulativeSNP.pl    Run time: 20:20:35
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    7:27AM, 13 November 2010
    cumulativeSNP.pl    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22
ll merged*

    -rw-rw-rw- 1 syoung root 128M Nov  9 11:23 merged.bam-1
    -rw-rw-rw- 1 syoung root 250M Nov  9 11:29 merged.bam-2
    -rw-rw-rw- 1 syoung root 369M Nov  9 11:36 merged.bam-3
    -rw-rw-rw- 1 syoung root 486M Nov  9 11:45 merged.bam-4
    -rw-rw-rw- 1 syoung root 602M Nov  9 11:57 merged.bam-5
    -rw-rw-rw- 1 syoung root 717M Nov  9 12:10 merged.bam-6
    -rw-rw-rw- 1 syoung root 831M Nov  9 12:26 merged.bam-7
    -rw-rw-rw- 1 syoung root 945M Nov  9 12:43 merged.bam-8
    -rw-rw-rw- 1 syoung root 1.1G Nov  9 13:02 merged.bam-9
    -rw-rw-rw- 1 syoung root 1.2G Nov 12 11:27 merged.bam-10
    -rw-rw-rw- 1 syoung root 1.3G Nov 12 11:51 merged.bam-11
    -rw-rw-rw- 1 syoung root 1.4G Nov 12 12:16 merged.bam-12
    -rw-rw-rw- 1 syoung root 1.5G Nov 12 12:46 merged.bam-13
    -rw-rw-rw- 1 syoung root 1.6G Nov 12 13:18 merged.bam-14
    -rw-rw-rw- 1 syoung root 1.7G Nov 12 13:52 merged.bam-15
    -rw-rw-rw- 1 syoung root 1.8G Nov 12 16:07 merged.bam-16
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 16:43 merged.bam-17
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 16:45 merged.bam-18
    -rw-rw-rw- 1 syoung root 2.1G Nov 12 17:33 merged.bam-19
    -rw-rw-rw- 1 syoung root 2.2G Nov 12 18:26 merged.bam-20
    -rw-rw-rw- 1 syoung root 2.3G Nov 12 19:14 merged.bam-21
    -rw-rw-rw- 1 syoung root 2.4G Nov 12 20:03 merged.bam-22
    -rw-rw-rw- 1 syoung root 2.5G Nov 12 20:54 merged.bam-23
    -rw-rw-rw- 1 syoung root 2.6G Nov 12 21:48 merged.bam-24
    -rw-rw-rw- 1 syoung root 2.7G Nov 12 22:45 merged.bam-25
    -rw-rw-rw- 1 syoung root 2.8G Nov 12 23:44 merged.bam-26
    -rw-rw-rw- 1 syoung root 2.9G Nov 13 00:55 merged.bam-27
    -rw-rw-rw- 1 syoung root 3.0G Nov 13 01:53 merged.bam-28
    -rw-rw-rw- 1 syoung root 3.1G Nov 13 02:52 merged.bam-29
    -rw-rw-rw- 1 syoung root 3.2G Nov 13 03:54 merged.bam-30
    -rw-rw-rw- 1 syoung root 3.3G Nov 13 04:59 merged.bam-31
    -rw-rw-rw- 1 syoung root 3.5G Nov 13 06:07 merged.bam-32
    -rw-rw-rw- 1 syoung root 3.6G Nov 13 07:17 merged.bam-33


    OK!







TEST AGAINST FILE 1:

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-1-snp


    samVenn::Snp.pl    Run time: 00:29:04
    samVenn::Snp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl
    samVenn::Snp.pl    3:04PM, 5 November 2010
    samVenn::Snp.pl    ****************************************






hit-1-snp-NOT-hit-33-snp: 20720
hit-33-snp-AND-hit-1-snp: 3563
hit-33-snp-NOT-hit-1-snp: 16904
[syoung@u01 venn]$ lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav: 24283
[syoung@u01 venn]$ lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav: 24283
[syoung@u01 venn]$ lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav: 20467




2. dbSNP ONLY
-------------


mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp

ON u03:

screen -S eland-vennsav-dbsnp

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp \
--replicates 1-33 \
--loop distributed \
--label eland-venn-dbsnpsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.dbSNP.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-%REPLICATE%.dbSNP.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp \
--querylabel hit-33-dbsnp \
--targetlabel hit-%REPLICATE%-dbsnp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp/loop-venn-dbsnp-sav.out


OUTPUT FILES:



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp
lines *dbsnp



/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
[syoung@u03 chr22]$ lines *dbSNP* | grep -v non

hit-1.dbSNP.sav: 5398
hit-3.dbSNP.sav: 4765
hit-4.dbSNP.sav: 5970
hit-5.dbSNP.sav: 5970
hit-6.dbSNP.sav: 7215
hit-7.dbSNP.sav: 8368
hit-8.dbSNP.sav: 9410
hit-9.dbSNP.sav: 10279
hit-10.dbSNP.sav: 11019
hit-11.dbSNP.sav: 11733
hit-12.dbSNP.sav: 12302
hit-13.dbSNP.sav: 12844
hit-14.dbSNP.sav: 13302
hit-15.dbSNP.sav: 13653
hit-16.dbSNP.sav: 13984
hit-17.dbSNP.sav: 14270
hit-18.dbSNP.sav: 14450
hit-19.dbSNP.sav: 14637
hit-20.dbSNP.sav: 14807
hit-21.dbSNP.sav: 14969
hit-22.dbSNP.sav: 15072
hit-23.dbSNP.sav: 15186
hit-24.dbSNP.sav: 15260
hit-25.dbSNP.sav: 15329
hit-26.dbSNP.sav: 15487
hit-27.dbSNP.sav: 15576
hit-28.dbSNP.sav: 15654
hit-29.dbSNP.sav: 15702
hit-30.dbSNP.sav: 15762
hit-31.dbSNP.sav: 15801
hit-32.dbSNP.sav: 15839
hit-33.dbSNP.sav: 15901





VENN LINES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp

HIT X NOT hit 33
-----------------

hit-1-dbsnp-NOT-hit-33-dbsnp: 2678
hit-3-dbsnp-NOT-hit-33-dbsnp: 2218
hit-4-dbsnp-NOT-hit-33-dbsnp: 2498
hit-5-dbsnp-NOT-hit-33-dbsnp: 2498
hit-6-dbsnp-NOT-hit-33-dbsnp: 2693
hit-7-dbsnp-NOT-hit-33-dbsnp: 2762
hit-8-dbsnp-NOT-hit-33-dbsnp: 2801
hit-9-dbsnp-NOT-hit-33-dbsnp: 2762
hit-10-dbsnp-NOT-hit-33-dbsnp: 2695
hit-11-dbsnp-NOT-hit-33-dbsnp: 2653
hit-12-dbsnp-NOT-hit-33-dbsnp: 2596
hit-13-dbsnp-NOT-hit-33-dbsnp: 2520
hit-14-dbsnp-NOT-hit-33-dbsnp: 2481
hit-15-dbsnp-NOT-hit-33-dbsnp: 2360
hit-16-dbsnp-NOT-hit-33-dbsnp: 2266
hit-17-dbsnp-NOT-hit-33-dbsnp: 2177
hit-18-dbsnp-NOT-hit-33-dbsnp: 2067
hit-19-dbsnp-NOT-hit-33-dbsnp: 1941
hit-20-dbsnp-NOT-hit-33-dbsnp: 1824
hit-21-dbsnp-NOT-hit-33-dbsnp: 1749
hit-22-dbsnp-NOT-hit-33-dbsnp: 1628
hit-23-dbsnp-NOT-hit-33-dbsnp: 1511
hit-24-dbsnp-NOT-hit-33-dbsnp: 1375
hit-25-dbsnp-NOT-hit-33-dbsnp: 1240
hit-26-dbsnp-NOT-hit-33-dbsnp: 1163
hit-27-dbsnp-NOT-hit-33-dbsnp: 1067
hit-28-dbsnp-NOT-hit-33-dbsnp: 949
hit-29-dbsnp-NOT-hit-33-dbsnp: 796
hit-30-dbsnp-NOT-hit-33-dbsnp: 653
hit-31-dbsnp-NOT-hit-33-dbsnp: 472
hit-32-dbsnp-NOT-hit-33-dbsnp: 282




HIT X AND hit 33
-----------------

hit-33-dbsnp-AND-hit-1-dbsnp: 2720
hit-33-dbsnp-AND-hit-3-dbsnp: 2547
hit-33-dbsnp-AND-hit-4-dbsnp: 3472
hit-33-dbsnp-AND-hit-5-dbsnp: 3472
hit-33-dbsnp-AND-hit-6-dbsnp: 4522
hit-33-dbsnp-AND-hit-7-dbsnp: 5606
hit-33-dbsnp-AND-hit-8-dbsnp: 6609
hit-33-dbsnp-AND-hit-9-dbsnp: 7517
hit-33-dbsnp-AND-hit-10-dbsnp: 8324
hit-33-dbsnp-AND-hit-11-dbsnp: 9080
hit-33-dbsnp-AND-hit-12-dbsnp: 9706
hit-33-dbsnp-AND-hit-13-dbsnp: 10324
hit-33-dbsnp-AND-hit-14-dbsnp: 10821
hit-33-dbsnp-AND-hit-15-dbsnp: 11293
hit-33-dbsnp-AND-hit-16-dbsnp: 11718
hit-33-dbsnp-AND-hit-17-dbsnp: 12093
hit-33-dbsnp-AND-hit-18-dbsnp: 12383
hit-33-dbsnp-AND-hit-19-dbsnp: 12696
hit-33-dbsnp-AND-hit-20-dbsnp: 12983
hit-33-dbsnp-AND-hit-21-dbsnp: 13220
hit-33-dbsnp-AND-hit-22-dbsnp: 13444
hit-33-dbsnp-AND-hit-23-dbsnp: 13675
hit-33-dbsnp-AND-hit-24-dbsnp: 13885
hit-33-dbsnp-AND-hit-25-dbsnp: 14089
hit-33-dbsnp-AND-hit-26-dbsnp: 14324
hit-33-dbsnp-AND-hit-27-dbsnp: 14509
hit-33-dbsnp-AND-hit-28-dbsnp: 14705
hit-33-dbsnp-AND-hit-29-dbsnp: 14906
hit-33-dbsnp-AND-hit-30-dbsnp: 15109
hit-33-dbsnp-AND-hit-31-dbsnp: 15329
hit-33-dbsnp-AND-hit-32-dbsnp: 15557
hit-33-dbsnp-AND-hit-33-dbsnp: 15901




HIT 33 NOT hit X
----------------

hit-33-dbsnp-NOT-hit-1-dbsnp: 13181
hit-33-dbsnp-NOT-hit-3-dbsnp: 13354
hit-33-dbsnp-NOT-hit-4-dbsnp: 12429
hit-33-dbsnp-NOT-hit-5-dbsnp: 12429
hit-33-dbsnp-NOT-hit-6-dbsnp: 11379
hit-33-dbsnp-NOT-hit-7-dbsnp: 10295
hit-33-dbsnp-NOT-hit-8-dbsnp: 9292
hit-33-dbsnp-NOT-hit-9-dbsnp: 8384
hit-33-dbsnp-NOT-hit-10-dbsnp: 7577
hit-33-dbsnp-NOT-hit-11-dbsnp: 6821
hit-33-dbsnp-NOT-hit-12-dbsnp: 6195
hit-33-dbsnp-NOT-hit-13-dbsnp: 5577
hit-33-dbsnp-NOT-hit-14-dbsnp: 5080
hit-33-dbsnp-NOT-hit-15-dbsnp: 4608
hit-33-dbsnp-NOT-hit-16-dbsnp: 4183
hit-33-dbsnp-NOT-hit-17-dbsnp: 3808
hit-33-dbsnp-NOT-hit-18-dbsnp: 3518
hit-33-dbsnp-NOT-hit-19-dbsnp: 3205
hit-33-dbsnp-NOT-hit-20-dbsnp: 2918
hit-33-dbsnp-NOT-hit-21-dbsnp: 2681
hit-33-dbsnp-NOT-hit-22-dbsnp: 2457
hit-33-dbsnp-NOT-hit-23-dbsnp: 2226
hit-33-dbsnp-NOT-hit-24-dbsnp: 2016
hit-33-dbsnp-NOT-hit-25-dbsnp: 1812
hit-33-dbsnp-NOT-hit-26-dbsnp: 1577
hit-33-dbsnp-NOT-hit-27-dbsnp: 1392
hit-33-dbsnp-NOT-hit-28-dbsnp: 1196
hit-33-dbsnp-NOT-hit-29-dbsnp: 995
hit-33-dbsnp-NOT-hit-30-dbsnp: 792
hit-33-dbsnp-NOT-hit-31-dbsnp: 572
hit-33-dbsnp-NOT-hit-32-dbsnp: 344
hit-33-dbsnp-NOT-hit-33-dbsnp: 0






3. NON-dbSNP ONLY
-----------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp


ON u03:

screen -S eland-vennsav-non-dbsnp

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp \
--replicates 1-33 \
--loop distributed \
--label eland-venn-non-dbsnpsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.non-dbSNP.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-%REPLICATE%.non-dbSNP.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp \
--querylabel hit-33-non-dbsnp \
--targetlabel hit-%REPLICATE%-non-dbsnp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp/loop-venn-non-dbsnp-sav.out

    
    Run time: 00:07:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:38AM, 6 November 2010
    ****************************************




ORIGINAL NUMBER OF LINES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
[syoung@u03 chr22]$ lines *non-dbSNP*

hit-1.non-dbSNP.sav: 18885
hit-3.non-dbSNP.sav: 13484
hit-4.non-dbSNP.sav: 15235
hit-5.non-dbSNP.sav: 15235
hit-6.non-dbSNP.sav: 15680
hit-7.non-dbSNP.sav: 15712
hit-8.non-dbSNP.sav: 15265
hit-9.non-dbSNP.sav: 14849
hit-10.non-dbSNP.sav: 14310
hit-11.non-dbSNP.sav: 13684
hit-12.non-dbSNP.sav: 13036
hit-13.non-dbSNP.sav: 12404
hit-14.non-dbSNP.sav: 11783
hit-15.non-dbSNP.sav: 11173
hit-16.non-dbSNP.sav: 10539
hit-17.non-dbSNP.sav: 10016
hit-18.non-dbSNP.sav: 9404
hit-19.non-dbSNP.sav: 8961
hit-20.non-dbSNP.sav: 8530
hit-21.non-dbSNP.sav: 8175
hit-22.non-dbSNP.sav: 7767
hit-23.non-dbSNP.sav: 7424
hit-24.non-dbSNP.sav: 7000
hit-25.non-dbSNP.sav: 6600
hit-26.non-dbSNP.sav: 6327
hit-27.non-dbSNP.sav: 6079
hit-28.non-dbSNP.sav: 5759
hit-29.non-dbSNP.sav: 5518
hit-30.non-dbSNP.sav: 5237
hit-31.non-dbSNP.sav: 5014
hit-32.non-dbSNP.sav: 4779
hit-33.non-dbSNP.sav: 4566






VENN LINES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp
lines *

hit X NOT hit 33
----------------

hit-1-non-dbsnp-NOT-hit-33-non-dbsnp: 18042
hit-3-non-dbsnp-NOT-hit-33-non-dbsnp: 12700
hit-4-non-dbsnp-NOT-hit-33-non-dbsnp: 14303
hit-5-non-dbsnp-NOT-hit-33-non-dbsnp: 14303
hit-6-non-dbsnp-NOT-hit-33-non-dbsnp: 14568
hit-7-non-dbsnp-NOT-hit-33-non-dbsnp: 14357
hit-8-non-dbsnp-NOT-hit-33-non-dbsnp: 13784
hit-9-non-dbsnp-NOT-hit-33-non-dbsnp: 13206
hit-10-non-dbsnp-NOT-hit-33-non-dbsnp: 12541
hit-11-non-dbsnp-NOT-hit-33-non-dbsnp: 11804
hit-12-non-dbsnp-NOT-hit-33-non-dbsnp: 11049
hit-13-non-dbsnp-NOT-hit-33-non-dbsnp: 10295
hit-14-non-dbsnp-NOT-hit-33-non-dbsnp: 9577
hit-15-non-dbsnp-NOT-hit-33-non-dbsnp: 8873
hit-16-non-dbsnp-NOT-hit-33-non-dbsnp: 8149
hit-17-non-dbsnp-NOT-hit-33-non-dbsnp: 7547
hit-18-non-dbsnp-NOT-hit-33-non-dbsnp: 6851
hit-19-non-dbsnp-NOT-hit-33-non-dbsnp: 6297
hit-20-non-dbsnp-NOT-hit-33-non-dbsnp: 5786
hit-21-non-dbsnp-NOT-hit-33-non-dbsnp: 5362
hit-22-non-dbsnp-NOT-hit-33-non-dbsnp: 4828
hit-23-non-dbsnp-NOT-hit-33-non-dbsnp: 4371
hit-24-non-dbsnp-NOT-hit-33-non-dbsnp: 3869
hit-25-non-dbsnp-NOT-hit-33-non-dbsnp: 3360
hit-26-non-dbsnp-NOT-hit-33-non-dbsnp: 2979
hit-27-non-dbsnp-NOT-hit-33-non-dbsnp: 2584
hit-28-non-dbsnp-NOT-hit-33-non-dbsnp: 2187
hit-29-non-dbsnp-NOT-hit-33-non-dbsnp: 1810
hit-30-non-dbsnp-NOT-hit-33-non-dbsnp: 1393
hit-31-non-dbsnp-NOT-hit-33-non-dbsnp: 1010
hit-32-non-dbsnp-NOT-hit-33-non-dbsnp: 561
hit-33-non-dbsnp-NOT-hit-33-non-dbsnp: 0




hit X AND hit 33
----------------


hit-33-non-dbsnp-AND-hit-1-non-dbsnp: 843
hit-33-non-dbsnp-AND-hit-3-non-dbsnp: 784
hit-33-non-dbsnp-AND-hit-4-non-dbsnp: 932
hit-33-non-dbsnp-AND-hit-5-non-dbsnp: 932
hit-33-non-dbsnp-AND-hit-6-non-dbsnp: 1112
hit-33-non-dbsnp-AND-hit-7-non-dbsnp: 1355
hit-33-non-dbsnp-AND-hit-8-non-dbsnp: 1481
hit-33-non-dbsnp-AND-hit-9-non-dbsnp: 1643
hit-33-non-dbsnp-AND-hit-10-non-dbsnp: 1769
hit-33-non-dbsnp-AND-hit-11-non-dbsnp: 1880
hit-33-non-dbsnp-AND-hit-12-non-dbsnp: 1987
hit-33-non-dbsnp-AND-hit-13-non-dbsnp: 2109
hit-33-non-dbsnp-AND-hit-14-non-dbsnp: 2206
hit-33-non-dbsnp-AND-hit-15-non-dbsnp: 2300
hit-33-non-dbsnp-AND-hit-16-non-dbsnp: 2390
hit-33-non-dbsnp-AND-hit-17-non-dbsnp: 2469
hit-33-non-dbsnp-AND-hit-18-non-dbsnp: 2553
hit-33-non-dbsnp-AND-hit-19-non-dbsnp: 2664
hit-33-non-dbsnp-AND-hit-20-non-dbsnp: 2744
hit-33-non-dbsnp-AND-hit-21-non-dbsnp: 2813
hit-33-non-dbsnp-AND-hit-22-non-dbsnp: 2939
hit-33-non-dbsnp-AND-hit-23-non-dbsnp: 3053
hit-33-non-dbsnp-AND-hit-24-non-dbsnp: 3131
hit-33-non-dbsnp-AND-hit-25-non-dbsnp: 3240
hit-33-non-dbsnp-AND-hit-26-non-dbsnp: 3348
hit-33-non-dbsnp-AND-hit-27-non-dbsnp: 3495
hit-33-non-dbsnp-AND-hit-28-non-dbsnp: 3572
hit-33-non-dbsnp-AND-hit-29-non-dbsnp: 3708
hit-33-non-dbsnp-AND-hit-30-non-dbsnp: 3844
hit-33-non-dbsnp-AND-hit-31-non-dbsnp: 4004
hit-33-non-dbsnp-AND-hit-32-non-dbsnp: 4218
hit-33-non-dbsnp-AND-hit-33-non-dbsnp: 4566




hit 33 NOT hit X
----------------

hit-33-non-dbsnp-NOT-hit-1-non-dbsnp: 3723
hit-33-non-dbsnp-NOT-hit-3-non-dbsnp: 3782
hit-33-non-dbsnp-NOT-hit-4-non-dbsnp: 3634
hit-33-non-dbsnp-NOT-hit-5-non-dbsnp: 3634
hit-33-non-dbsnp-NOT-hit-6-non-dbsnp: 3454
hit-33-non-dbsnp-NOT-hit-7-non-dbsnp: 3211
hit-33-non-dbsnp-NOT-hit-8-non-dbsnp: 3085
hit-33-non-dbsnp-NOT-hit-9-non-dbsnp: 2923
hit-33-non-dbsnp-NOT-hit-10-non-dbsnp: 2797
hit-33-non-dbsnp-NOT-hit-11-non-dbsnp: 2686
hit-33-non-dbsnp-NOT-hit-12-non-dbsnp: 2579
hit-33-non-dbsnp-NOT-hit-13-non-dbsnp: 2457
hit-33-non-dbsnp-NOT-hit-14-non-dbsnp: 2360
hit-33-non-dbsnp-NOT-hit-15-non-dbsnp: 2266
hit-33-non-dbsnp-NOT-hit-16-non-dbsnp: 2176
hit-33-non-dbsnp-NOT-hit-17-non-dbsnp: 2097
hit-33-non-dbsnp-NOT-hit-18-non-dbsnp: 2013
hit-33-non-dbsnp-NOT-hit-19-non-dbsnp: 1902
hit-33-non-dbsnp-NOT-hit-20-non-dbsnp: 1822
hit-33-non-dbsnp-NOT-hit-21-non-dbsnp: 1753
hit-33-non-dbsnp-NOT-hit-22-non-dbsnp: 1627
hit-33-non-dbsnp-NOT-hit-23-non-dbsnp: 1513
hit-33-non-dbsnp-NOT-hit-24-non-dbsnp: 1435
hit-33-non-dbsnp-NOT-hit-25-non-dbsnp: 1326
hit-33-non-dbsnp-NOT-hit-26-non-dbsnp: 1218
hit-33-non-dbsnp-NOT-hit-27-non-dbsnp: 1071
hit-33-non-dbsnp-NOT-hit-28-non-dbsnp: 994
hit-33-non-dbsnp-NOT-hit-29-non-dbsnp: 858
hit-33-non-dbsnp-NOT-hit-30-non-dbsnp: 722
hit-33-non-dbsnp-NOT-hit-31-non-dbsnp: 562
hit-33-non-dbsnp-NOT-hit-32-non-dbsnp: 348
hit-33-non-dbsnp-NOT-hit-33-non-dbsnp: 0




PREVIOUS ELAND RESULTS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ls -al *sav

    -rw-rw-rw- 1 syoung root 2971027 Oct 27 14:49 hit-1.sav
    -rw-rw-rw- 1 syoung root 2461296 Oct 27 05:19 hit-3.sav
    -rw-rw-rw- 1 syoung root 2999457 Oct 27 05:52 hit-4.sav
    -rw-rw-rw- 1 syoung root 2999457 Oct 27 05:52 hit-5.sav
    -rw-rw-rw- 1 syoung root 3365448 Oct 27 06:04 hit-6.sav
    -rw-rw-rw- 1 syoung root 3639572 Oct 27 06:11 hit-7.sav
    -rw-rw-rw- 1 syoung root 3817133 Oct 27 06:15 hit-8.sav
    -rw-rw-rw- 1 syoung root 3953000 Oct 27 06:18 hit-9.sav
    -rw-rw-rw- 1 syoung root 4029762 Oct 27 06:19 hit-10.sav
    -rw-rw-rw- 1 syoung root 4076685 Oct 27 06:31 hit-11.sav
    -rw-rw-rw- 1 syoung root 4082162 Oct 27 06:30 hit-12.sav
    -rw-rw-rw- 1 syoung root 4101417 Oct 27 06:30 hit-13.sav
    -rw-rw-rw- 1 syoung root 4082584 Oct 27 06:29 hit-14.sav
    -rw-rw-rw- 1 syoung root 4047891 Oct 27 09:17 hit-15.sav
    -rw-rw-rw- 1 syoung root 3993105 Oct 27 09:14 hit-16.sav
    -rw-rw-rw- 1 syoung root 3961442 Oct 27 09:11 hit-17.sav
    -rw-rw-rw- 1 syoung root 3887990 Oct 27 09:06 hit-18.sav
    -rw-rw-rw- 1 syoung root 3849241 Oct 27 09:03 hit-19.sav
    -rw-rw-rw- 1 syoung root 3810648 Oct 27 09:01 hit-20.sav
    -rw-rw-rw- 1 syoung root 3784737 Oct 27 08:58 hit-21.sav
    -rw-rw-rw- 1 syoung root 3731077 Oct 27 08:53 hit-22.sav
    -rw-rw-rw- 1 syoung root 3695723 Oct 27 06:07 hit-23.sav
    -rw-rw-rw- 1 syoung root 3630856 Oct 27 06:06 hit-24.sav
    -rw-rw-rw- 1 syoung root 3572375 Oct 27 06:04 hit-25.sav
    -rw-rw-rw- 1 syoung root 3558462 Oct 27 06:04 hit-26.sav
    -rw-rw-rw- 1 syoung root 3541431 Oct 27 06:03 hit-27.sav
    -rw-rw-rw- 1 syoung root 3513592 Oct 27 06:01 hit-28.sav
    -rw-rw-rw- 1 syoung root 3483657 Oct 27 06:00 hit-29.sav
    -rw-rw-rw- 1 syoung root 3455017 Oct 27 05:57 hit-30.sav
    -rw-rw-rw- 1 syoung root 3430026 Oct 27 05:03 hit-31.sav
    -rw-rw-rw- 1 syoung root 3405596 Oct 27 05:01 hit-32.sav
    -rw-rw-rw- 1 syoung root 3390775 Oct 27 05:00 hit-33.sav


ls -al *snp

    -rw-rw-r-- 1 syoung root 1558623 Oct 21 12:51 hit-1.snp
    -rw-rw-r-- 1 syoung root 1406106 Oct 21 12:51 hit-3.snp
    -rw-rw-r-- 1 syoung root 1766831 Oct 21 12:51 hit-4.snp
    -rw-rw-r-- 1 syoung root 1766831 Oct 21 12:51 hit-5.snp
    -rw-rw-r-- 1 syoung root 2025766 Oct 21 12:51 hit-6.snp
    -rw-rw-r-- 1 syoung root 2228059 Oct 21 12:51 hit-7.snp
    -rw-rw-r-- 1 syoung root 2361291 Oct 21 12:51 hit-8.snp
    -rw-rw-r-- 1 syoung root 2465950 Oct 21 12:51 hit-9.snp
    -rw-rw-r-- 1 syoung root 2526065 Oct 21 12:51 hit-10.snp
    -rw-rw-r-- 1 syoung root 2558285 Oct 21 12:51 hit-11.snp
    -rw-rw-r-- 1 syoung root 2574577 Oct 21 12:51 hit-12.snp
    -rw-rw-r-- 1 syoung root 2581167 Oct 21 12:51 hit-13.snp
    -rw-rw-r-- 1 syoung root 2569012 Oct 21 12:51 hit-14.snp
    -rw-rw-r-- 1 syoung root 2543482 Oct 21 12:51 hit-15.snp
    -rw-rw-r-- 1 syoung root 2505558 Oct 21 12:51 hit-16.snp
    -rw-rw-r-- 1 syoung root 2481172 Oct 21 12:51 hit-17.snp
    -rw-rw-r-- 1 syoung root 2425856 Oct 21 12:51 hit-18.snp
    -rw-rw-r-- 1 syoung root 2398419 Oct 21 12:51 hit-19.snp
    -rw-rw-r-- 1 syoung root 2367421 Oct 21 12:51 hit-20.snp
    -rw-rw-r-- 1 syoung root 2351475 Oct 21 12:51 hit-21.snp
    -rw-rw-r-- 1 syoung root 2317096 Oct 21 12:51 hit-22.snp
    -rw-rw-r-- 1 syoung root 2292648 Oct 21 12:51 hit-23.snp
    -rw-rw-r-- 1 syoung root 2247855 Oct 21 12:51 hit-24.snp
    -rw-rw-r-- 1 syoung root 2206548 Oct 21 12:51 hit-25.snp
    -rw-rw-r-- 1 syoung root 2202167 Oct 21 12:51 hit-26.snp
    -rw-rw-r-- 1 syoung root 2192724 Oct 21 12:51 hit-27.snp
    -rw-rw-r-- 1 syoung root 2171684 Oct 21 12:51 hit-28.snp
    -rw-rw-r-- 1 syoung root 2153289 Oct 21 12:51 hit-29.snp
    -rw-rw-r-- 1 syoung root 2136618 Oct 21 12:51 hit-30.snp
    -rw-rw-r-- 1 syoung root 2123681 Oct 21 12:51 hit-31.snp
    -rw-rw-r-- 1 syoung root 2110788 Oct 21 12:51 hit-32.snp
    -rw-rw-r-- 1 syoung root 2101703 Oct 21 12:51 hit-33.snp



NOTES
-----

PARSE *sav FILES TO SEPARATE OUT dbSNP AND NON-dbSNP ENTRIES


SAVDIR=/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
cd $SAVDIR
FILES="*"
for FILE in $FILES;
do
    if [ -f `pwd`/$FILE ]; then

        SAVFILE=$(echo $FILE | egrep "^hit-[0-9XY]+.sav" ); 
        if [ "$SAVFILE" != "" ]; then
    
            NUMBER=${SAVFILE/hit-/};
            NUMBER=${NUMBER/.sav/};
            echo $NUMBER;

            grep rs \
            hit-$NUMBER.sav \
            > hit-$NUMBER.dbSNP.sav
            
            grep -v rs \
            hit-$NUMBER.sav \
            > hit-$NUMBER.non-dbSNP.sav
        fi;
    fi;
done;




OUTPUT FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ll *33*

    -rw-rw-r-- 1 syoung root 2.3M Nov  6 02:17 hit-33.dbSNP.sav
    -rw-rw-r-- 1 syoung root 979K Nov  6 02:17 hit-33.non-dbSNP.sav
    -rw-rw-rw- 1 syoung root 3.3M Oct 27 05:00 hit-33.sav
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-33.snp
    -rw-r--r-- 1 syoung root 3.4G Nov  4 13:36 merged.bam-33
    -rw-rw-rw- 1 syoung root 109K Nov  5 00:41 merged.bam-33.bai
    -rw-rw-r-- 1 syoung root 109K Nov  5 00:37 merged.bam-33.bai2
    -rw-rw-rw- 1 syoung root   18 Nov  5 01:04 merged.bam-33.coverage
    -rw-r--r-- 1 syoung root  24M Oct 27 01:30 snp130-chr22-33.dbl

TEST SINGLE FILE

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22

grep rs \
hit-33.sav \
> hit-33.dbSNP.sav

grep -v rs \
hit-33.sav \
> hit-33.non-dbSNP.sav

head -n 10 hit-33*sav | cut -f 1,2,11

    ==> hit-33.dbSNP.sav <==
    chr22   16050612        rs2186463
    chr22   16053659        rs915675
    chr22   16054740        rs2844885
    chr22   16055003        rs2844886
    chr22   16055396        rs71256249
    chr22   16055570        rs1359599
    chr22   16055913        rs6518433
    chr22   16055942        rs72613661
    chr22   16058852        rs2843241
    chr22   16060239        rs2495299
    
    ==> hit-33.non-dbSNP.sav <==
    chr22   16074772
    chr22   16086163
    chr22   16086164
    chr22   16095936
    chr22   16133514
    chr22   16133515
    chr22   16156491
    chr22   16157967
    chr22   16173235
    chr22   16217029
    
    ==> hit-33.sav <==
    chr22   16050612        rs2186463
    chr22   16053659        rs915675
    chr22   16054740        rs2844885
    chr22   16055003        rs2844886
    chr22   16055396        rs71256249
    chr22   16055570        rs1359599
    chr22   16055913        rs6518433
    chr22   16055942        rs72613661
    chr22   16058852        rs2843241
    chr22   16060239        rs2495299





mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbSNP
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbSNP

ON u03:

screen -S eland-venn-dbSNPsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbSNP \
--replicates 2-33 \
--loop distributed \
--label eland-venn-dbSNPsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbSNP \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/loop-venn-dbSNPsav.out






</entry>



<entry [Fri Nov  5 08:53:03 EDT 2010] COMPARE hit.snp AND hit.sam FILE SIZES>




            hit.snp     hit.sam
ELAND       
MAQ         1.1 MB
BOWTIE (fr) 5.0 MB
BOWTIE (rf) 5.0 MB
NOVOALIGN   1.4 MB   



hit.snp FILES
*************


MAQ
---
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.snp

-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 1/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 2/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 3/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 4/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 5/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 6/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 7/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 8/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 9/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 10/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 11/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 12/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 13/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 14/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 15/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 16/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 17/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 18/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 19/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 20/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 21/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 22/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 23/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 24/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 25/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 26/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 27/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 28/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 29/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 30/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 31/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:21 32/chr22/hit.snp
-rw-rw-rw- 1 syoung root 420K Nov  4 11:18 33/chr22/hit.snp


BOWTIE
------
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/hit.snp

-rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 17/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 18/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 12:27 19/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 20/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 21/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 22/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 23/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 24/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 25/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 26/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 27/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 28/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 29/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 12:28 30/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 31/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 32/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 33/chr22/hit.snp



BOWTIE (--fr)
------------
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.snp
    
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:57 1/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 2/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 19:02 3/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 4/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:03 5/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 6/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 19:04 7/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:59 8/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:47 9/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 10/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:49 11/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 12/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 13/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:48 14/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 18:53 15/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:05 16/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 17/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 18/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 19:01 19/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:05 20/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 21/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 22/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 23/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 24/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:55 25/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 26/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 27/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:03 28/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 29/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 19:01 30/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 31/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 32/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:58 33/chr22/hit.snp


    # bowtie-rf:
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp



NOVOALIGN
---------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/hit.snp


-rw-rw-rw- 1 syoung root 1.4M Nov  4 16:23 1/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 2/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 3/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 4/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 5/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 6/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:26 7/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 8/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 9/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 10/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 11/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:29 12/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:22 13/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 14/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 15/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 16/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 17/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 18/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 19/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:44 20/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 21/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 22/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 23/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 24/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:44 25/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 26/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 27/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:47 28/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 29/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 30/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 31/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:45 32/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:42 33/chr22/hit.snp



ELAND
-----

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ll */chr22/hit.snp





hit.sam FILES
*************


MAQ
---
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.snp


BOWTIE (rf)
-----------

COMMANDS USED FOR BOWTIE -rf RUN:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1
em bowtie-autochr22-1.out
 
/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--sam \
--threads 1 \
--rf \
--al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/$LSB_JOBINDEX/aligned.txt \
--un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/$LSB_JOBINDEX/unaligned.txt \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
-1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/$LSB_JOBINDEX/bowtie-autochr22-1_1.$LSB_JOBINDEX.txt \
-2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/$LSB_JOBINDEX/bowtie-autochr22-1_2.$LSB_JOBINDEX.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/$LSB_JOBINDEX/out.sam



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf
ll */chr22/hit.sam

-rw-rw-r-- 1 syoung root 154M Nov  5 13:14 1/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:19 2/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:23 3/chr22/hit.sam
-rw-rw-r-- 1 syoung root 908M Nov  5 13:25 4/chr22/hit.sam
-rw-rw-r-- 1 syoung root 925M Nov  5 13:25 5/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:25 6/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:26 7/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:26 8/chr22/hit.sam
-rw-rw-r-- 1 syoung root 6.1G Nov  5 13:28 9/chr22/hit.sam
-rw-rw-r-- 1 syoung root 886M Nov  5 13:15 10/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:15 11/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:15 12/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:16 13/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:16 14/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:17 15/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:17 16/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:17 17/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:18 18/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:18 19/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:19 20/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:19 21/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:20 22/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:20 23/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:20 24/chr22/hit.sam
-rw-rw-r-- 1 syoung root 889M Nov  5 13:21 25/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:21 26/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:22 27/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:22 28/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:22 29/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:23 30/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:23 31/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:24 32/chr22/hit.sam
-rw-rw-r-- 1 syoung root 889M Nov  5 13:24 33/chr22/hit.sam




BOWTIE (--fr)
-------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1
emacs bowtie-200bp-chr22-1.out

    bowtie command:
    
    time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
    --sam \
    --threads 1 \
     --fr  \
    --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/$LSB_JOBINDEX/aligned.txt \
    --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/$LSB_JOBINDEX/unaligned.txt \
    /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
    -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/$LSB_JOBINDEX/bowtie-200bp-chr22-1_1.$LSB_JOBINDEX.txt \
    -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/$LSB_JOBINDEX/bowtie-200bp-chr22-1_2.$LSB_JOBINDEX.txt \
    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/$LSB_JOBINDEX/out.sam


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.sam
    
    -rw-rw-rw- 1 syoung root 886M Nov  5 18:57 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:44 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:58 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:52 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:43 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:48 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:57 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:53 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:52 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:51 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:56 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:53 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:54 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:55 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 889M Nov  5 18:49 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:56 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:54 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:55 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:52 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:54 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 889M Nov  5 18:51 33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:56 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:57 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:58 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:52 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:41 9/chr22/hit.sam



BOWTIE (default)
----------------


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10
emacs bowtie-200bp-chr22-10.out

    bowtie command:
    
    time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
    --sam \
    --threads 1 \
    --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/chr22/$LSB_JOBINDEX/aligned.txt \
    --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/chr22/$LSB_JOBINDEX/unaligned.txt \
    /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
    -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/$LSB_JOBINDEX/bowtie-200bp-chr22-10_1.$LSB_JOBINDEX.txt \
    -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/$LSB_JOBINDEX/bowtie-200bp-chr22-10_2.$LSB_JOBINDEX.txt \
    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/chr22/$LSB_JOBINDEX/out.sam



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.sam


-rw-rw-rw- 1 syoung root 886M Nov  4 16:25 10/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:23 11/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:28 12/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:26 13/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:26 14/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:28 15/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:25 16/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:06 17/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:13 18/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:16 19/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 14:33 1/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:17 20/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:19 21/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:13 22/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:11 23/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:13 24/chr22/hit.sam
-rw-rw-rw- 1 syoung root 889M Nov  5 11:18 25/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:18 26/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:20 27/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:10 28/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:17 29/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:24 2/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:19 30/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:17 31/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:16 32/chr22/hit.sam
-rw-rw-rw- 1 syoung root 889M Nov  5 11:19 33/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:27 3/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:27 4/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:24 5/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:26 6/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:27 7/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:28 8/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:17 9/chr22/hit.sam



NOVOALIGN
---------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/hit.sam

-rw-rw-rw- 1 syoung root 874M Nov  4 16:17 1/chr22/hit.sam
-rw-rw-rw- 1 syoung root 869M Nov  5 06:14 2/chr22/hit.sam
-rw-rw-rw- 1 syoung root 874M Nov  5 06:19 3/chr22/hit.sam
-rw-rw-rw- 1 syoung root 871M Nov  5 06:16 4/chr22/hit.sam
-rw-rw-rw- 1 syoung root 870M Nov  5 06:19 5/chr22/hit.sam
-rw-rw-rw- 1 syoung root 860M Nov  5 06:17 6/chr22/hit.sam
-rw-rw-rw- 1 syoung root 873M Nov  5 06:15 7/chr22/hit.sam
-rw-rw-rw- 1 syoung root 876M Nov  5 06:17 8/chr22/hit.sam
-rw-rw-rw- 1 syoung root 860M Nov  5 06:18 9/chr22/hit.sam
-rw-rw-rw- 1 syoung root 864M Nov  5 06:19 10/chr22/hit.sam
-rw-rw-rw- 1 syoung root 873M Nov  5 06:17 11/chr22/hit.sam
-rw-rw-rw- 1 syoung root 875M Nov  5 06:19 12/chr22/hit.sam
-rw-rw-rw- 1 syoung root 876M Nov  5 06:12 13/chr22/hit.sam
-rw-rw-rw- 1 syoung root 858M Nov  5 06:17 14/chr22/hit.sam
-rw-rw-rw- 1 syoung root 875M Nov  5 06:19 15/chr22/hit.sam
-rw-rw-rw- 1 syoung root 875M Nov  5 06:17 16/chr22/hit.sam
-rw-rw-rw- 1 syoung root 863M Nov  5 06:35 17/chr22/hit.sam
-rw-rw-rw- 1 syoung root 842M Nov  5 06:34 18/chr22/hit.sam
-rw-rw-rw- 1 syoung root 837M Nov  5 06:34 19/chr22/hit.sam
-rw-rw-rw- 1 syoung root 864M Nov  5 06:38 20/chr22/hit.sam
-rw-rw-rw- 1 syoung root 868M Nov  5 06:43 21/chr22/hit.sam
-rw-rw-rw- 1 syoung root 863M Nov  5 06:45 22/chr22/hit.sam
-rw-rw-rw- 1 syoung root 869M Nov  5 06:44 23/chr22/hit.sam
-rw-rw-rw- 1 syoung root 875M Nov  5 06:42 24/chr22/hit.sam
-rw-rw-rw- 1 syoung root 873M Nov  5 06:39 25/chr22/hit.sam
-rw-rw-rw- 1 syoung root 877M Nov  5 06:45 26/chr22/hit.sam
-rw-rw-rw- 1 syoung root 868M Nov  5 06:45 27/chr22/hit.sam
-rw-rw-rw- 1 syoung root 867M Nov  5 06:39 28/chr22/hit.sam
-rw-rw-rw- 1 syoung root 864M Nov  5 06:42 29/chr22/hit.sam
-rw-rw-rw- 1 syoung root 865M Nov  5 06:44 30/chr22/hit.sam
-rw-rw-rw- 1 syoung root 869M Nov  5 06:45 31/chr22/hit.sam
-rw-rw-rw- 1 syoung root 872M Nov  5 06:39 32/chr22/hit.sam
-rw-rw-rw- 1 syoung root 852M Nov  5 06:36 33/chr22/hit.sam


ELAND
-----

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ll */chr22/hit.sam


-rw-rw-rw- 1 syoung root 397M Oct 13 14:43 10/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 15:02 11/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 15:21 12/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 15:42 13/chr22/hit.sam
-rw-rw-rw- 1 syoung root 398M Oct 13 16:05 14/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 16:30 15/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 16:57 16/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 17:25 17/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 17:56 18/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 18:29 19/chr22/hit.sam
-rw-rw-r-- 1 syoung root 596M Oct 13 13:41 1/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 19:04 20/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 19:40 21/chr22/hit.sam
-rw-rw-rw- 1 syoung root 396M Oct 13 20:20 22/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 21:01 23/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 21:44 24/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 22:29 25/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 23:17 26/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 00:07 27/chr22/hit.sam
-rw-rw-rw- 1 syoung root 398M Oct 14 00:57 28/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 01:50 29/chr22/hit.sam
-rw-rw-r-- 1 syoung root 397M Oct 13 13:42 2/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 02:45 30/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 03:42 31/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 04:42 32/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 05:45 33/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 13:43 3/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 13:48 4/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 13:48 5/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 13:55 6/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 14:04 7/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 14:15 8/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 14:28 9/chr22/hit.sam





NOTES
-----


COPY BOWTIE (rf) hit.sam FILES FROM /ngs/bioinfo TO /scratch
------------------------------------------------------------


RENAME SCRATCH bowtie TO bowtie-rf:

cd /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22
mv bowtie bowtie-rf



COPY hit.sam FILES:

screen -S cp-sam

NGSDIR=/ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie-rf
SCRATCHDIR=/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf
mkdir -p $SCRATCHDIR
cd $NGSDIR
DIRS="*"
echo $DIRS
for DIR in $DIRS;
do
    if [ -d `pwd`/$DIR ]; then

        FILEDIR=$(echo $DIR | egrep "^[0-9]+" ); 

        if [ "$FILEDIR" != "" ]; then
    
            echo $FILEDIR
            echo "mkdir $SCRATCHDIR/$FILEDIR/chr22"
            mkdir -p $SCRATCHDIR/$FILEDIR/chr22
            echo "cp -f $NGSDIR/$FILEDIR/chr22/hit.sam $SCRATCHDIR/$FILEDIR/chr22/hit.sam"
            cp -f $NGSDIR/$FILEDIR/chr22/hit.sam $SCRATCHDIR/$FILEDIR/chr22/hit.sam
        fi;
    fi;
done;




</entry>



<entry [Thu Nov  4 12:29:48 EDT 2010] RERUN BOWTIE chr22 USING '-fr' FLAG>



CONTINUATION OF:
[
Thu Nov  4 12:29:48 EDT 2010
RERUN BOWTIE chr22 WITH DEFAULTS
]

PROBLEM: BOWTIE RUN WITH --rf OPTION ON 3.3 BILLION READS PRODUCED SMALL hit.sam FILE

CONCLUSION: MUST RERUN BOWTIE FLAG WITH 3.3 BILLION READS USING '--fr' FLAG

FIRST RUN DEFAULT FOR COMPARISON. NOW RUN WITH --fr FLAG


ONE ROUND (1-33)
---------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr

ON u04:
screen -S loop-bowtie

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 1-33 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/%REPLICATE% \
--params " --fr " \
--loop parallel \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/%REPLICATE%/bowtie-200bp-chr22-%REPLICATE%.out 

    Run time: 04:38:28
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    7:05PM, 5 November 2010
    ****************************************

    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.snp
    
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:49 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:48 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 18:53 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:05 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 19:01 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:57 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:05 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:55 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:03 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 19:01 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:58 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 19:02 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:03 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 19:04 7/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:59 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:47 9/chr22/hit.snp

    # bowtie-rf:
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.sam
    
    -rw-rw-rw- 1 syoung root 886M Nov  5 18:57 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:44 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:58 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:52 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:43 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:48 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:57 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:53 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:52 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:51 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:56 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:53 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:54 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:55 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 889M Nov  5 18:49 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:56 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:54 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:55 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:52 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:54 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 889M Nov  5 18:51 33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:56 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:57 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:58 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:52 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:41 9/chr22/hit.sam


THIS bowtie-fr ALIGNMENT IS IDENTICAL TO THE DEFAULT bowtie ALIGNMENT:


diff \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/1//aligned_1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22/1/aligned_1.txt 

    <no difference>
    
diff \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22/hit.sam 
    
    <no difference>




AND bowtie-fr IS TOTALLY DIFFERENT FROM bowtie-rf:


1. BOWTIE RUN WITH --fr HAS MANY MORE HITS THAN WITH --rf

ls -alh /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:51 hit.sam

ls -alh /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 154M Nov  5 13:14 hit.sam


2. THE HITS ARE DIFFERENT


/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn \
--querylabel bowtie-fr \
--targetlabel bowtie-rf 




THIS HUNG ON PEGASUS PROBABLY DUE TO LACK OF MEMORY:

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl --queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam --targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn --querylabel bowtie-fr --targetlabel bowtie-rf
samVenn::Sam.pl    arguments: --queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam --targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn --querylabel bowtie-fr --targetlabel bowtie-rf
Venn::Sam::setOutputfiles    queryonly: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn/bowtie-fr-NOT-bowtie-rf
Venn::Sam::setOutputfiles    targetonly: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn/bowtie-rf-NOT-bowtie-fr
Venn::Sam::setOutputfiles    both: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn/bowtie-fr-AND-bowtie-rf

[1]+  Stopped                 /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl --queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam --targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn --querylabel bowtie-fr --targetlabel bowtie-rf






RERUN LATER...






--fr
----

head /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam

    SRR004823.14378:3:1:253:207#0   99      chr22   16050016        255     36M     =       16050195       215      AGGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTC    IIIIIIIIIIIIIIDIIIIIIII8IIIII33I,78)    XA:i:1  MD:Z:20A15      NM:i:1
    SRR002304.7863377:1:90:544:448#0        99      chr22   16050031        255     36M     =       1605019197      CTGTGCGACCTTGGCCAAGTCACTTCCCCCTTCAGG    IIIIIIIIIIIIIC4I>(=)III.+4+&(:*//83+    XA:i:2  MD:Z:5A21T8     NM:i:2
    SRR002301.2006530:3:94:327:904#0        99      chr22   16050036        255     36M     =       1605021211      CGACCTTGGCCAAGTCACTTCCTCCTTCAGGAACAT    IIIIIIIIIIIIIIIIIIIID3/;??/<,:002+2A    XA:i:1  MD:Z:0A35       NM:i:1
    SRR006554.5571971:2:259:467:605#0       99      chr22   16050041        255     36M     =       1605022220      TTGGCCAAGTCACTTCCTCCTTCAGGAACATTGCAG    IIIII;3>E?66=EE8/C,A0?+).7+/+-57.+'&    XA:i:0  MD:Z:36NM:i:0
    SRR004850.5452648:4:56:158:1670#0       163     chr22   16050115        255     36M     =       1605028205      GGTCATGCAATCTGGACAACATTCACCTTTAAAAGT    IIAI4IIIIIIIIII3IIAIEIICIII<IC+4-0?,    XA:i:0  MD:Z:36NM:i:0
    SRR004860.9862481:6:98:511:367#0        163     chr22   16050127        255     36M     =       1605031223      TGGACAACATTCACCTTTAAAAGTTTATTGATCTTT    <II6;GI'2E82-E:I499(-4D#I+2?9I,I+I<6    XA:i:0  MD:Z:36NM:i:0
    SRR003870.1056177:4:49:412:676#0        99      chr22   16050128        255     36M     =       1605028194      GGACAACATTCACCTTTAAAAGTTTATTGATTTTTT    II@IIII5IIG>I9C4>3-1+;0E6+A8.(15=?56    XA:i:0  MD:Z:31C4       NM:i:1
    SRR002283.6606116:3:42:881:433#0        99      chr22   16050137        255     36M     =       1605031213      TCACCTTTAAAAGTTTATTGATCTTTTGTGACATGC    IIIIIIIIIBIII7II<GBDGIIII53=3+2@?1.;    XA:i:0  MD:Z:36NM:i:0
    SRR002304.7863377:1:90:544:448#0        147     chr22   16050192        255     36M     =       1605003-197     AGAAACTAAAGGGTCGCAGGCCGGTTTCTGCTAATT    >99E",$97+?/D,III-4<II+DI8DEIIIIIIIH    XA:i:0  MD:Z:36NM:i:0
    SRR004823.14378:3:1:253:207#0   147     chr22   16050195        255     36M     =       16050016       -215     AACTAAAGGGTCGCAGTCCGGTTTCTGCTAATTTCT    5*H'8'1&&#+G&BH(%I=%(II?II=IIIIIIIII    XA:i:1  MD:Z:16G19      NM:i:1



grep SRR002271.923:1:1:772:358#0 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam
SRR002271.923:1:1:772:358#0     99      chr22   39613521        255     36M     =       39613697       212      GCAAAGCTGGAGGCATCATGCTACCTGACTTCAAAC    IIIIIIIIIIIIIIIIIIIIIIIIIICIIIII7=I.    XA:i:1  MD:Z:0A35       NM:i:1
SRR002271.923:1:1:772:358#0     147     chr22   39613697        255     36M     =       39613521       -212     AAGAAACGGGGAAAGGATTCCCTATTTAATAAATGG    II>IIIIBIGIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:6A4G24     NM:i:2


--rf
----

head /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam

    SRR002271.923:1:1:772:358#0     99      chr22   39613521        255     36M     =       39613697       212     GCAAAGCTGGAGGCATCATGCTACCTGACTTCAAAC    IIIIIIIIIIIIIIIIIIIIIIIIIICIIIII7=I.  XA:i:1   MD:Z:0A35       NM:i:1
    SRR002271.923:1:1:772:358#0     147     chr22   39613697        255     36M     =       39613521       -212    AAGAAACGGGGAAAGGATTCCCTATTTAATAAATGG    II>IIIIBIGIIIIIIIIIIIIIIIIIIIIIIIIII  XA:i:1   MD:Z:6A4G24     NM:i:2
    SRR002271.1398:1:1:532:128#0    99      chr22   16441194        255     36M     =       16441397       239     GAGTTAGGGAGGATTCCCTCTTTTTCTATTGATAGG    IIIIIIIIIIIIFIIIIIIIIIIIIIIIII,0I/*2  XA:i:1   MD:Z:6C26T2     NM:i:2
    SRR002271.1398:1:1:532:128#0    147     chr22   16441397        255     36M     =       16441194       -239    CTTGGGAGGGTGTATGTGTCAAGGAATTTATCCATT    F+4II77;III1IIIII=IIIIIIIIIIIIIIIIII  XA:i:0   MD:Z:36 NM:i:0
    SRR002271.4568:1:1:621:965#0    99      chr22   32639520        255     36M     =       32639692       208     TAGGAATAACAATATACAGGGAAGGATCAGTTTAAA    IIIIIIIIIIIIIIIIIIIGI;IAI.4:,74<I6CI  XA:i:1   MD:Z:25C10      NM:i:1
    SRR002271.4568:1:1:621:965#0    147     chr22   32639692        255     36M     =       32639520       -208    TAACAATTTCAAATAGTTAAAAACATATGAGAGACA    :II/III<+IIII=III5IIIIIII3IIIIIIIIII  XA:i:0   MD:Z:36 NM:i:0
    SRR002271.4897:1:1:420:124#0    163     chr22   16551290        255     36M     =       16551476       222     TGTTCTGGAATCCTATGTGAGGGACAAACATTCAGA    IIIIIIIIIIIIIIIIIIIEIIII8C9%/+ID%4:)  XA:i:2   MD:Z:8G15A11    NM:i:2
    SRR002271.4897:1:1:420:124#0    83      chr22   16551476        255     36M     =       16551290       -222    AACAGTGTTCTGGAATCCTATGTGAGGGAGAAGCAT    <B%'6I3DI+2;:II;IIIIIIGIIIIIIIIIIIII  XA:i:1   MD:Z:1G1T28A3   NM:i:3
    SRR002271.5667:1:1:261:529#0    163     chr22   33569308        255     36M     =       33569484       212     AAGCCTGCCTTACAAAAGCTCCTGAAGGAAGCATTA    IIIIIIIIIII4I81IIIIIIIII7&IH,IIB(II(  XA:i:0   MD:Z:36 NM:i:0
    SRR002271.5667:1:1:261:529#0    83      chr22   33569484        255     36M     =       33569308       -212    CCTTAAATGTAAATGGACTAAATGCCCCAATTAAAA    )./8III1IIIIIII?EFIIIIAIIIIIIIIIIIII  XA:i:0   MD:Z:36 NM:i:0

grep SRR004823.14378:3:1:253:207#0 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam
    <NO MATCH>
    


</entry>



<entry [Fri Nov  5 11:24:00 EDT 2010] RAN BOWTIE (DEFAULT) AND NOVOALIGN CUMULATIVE SNPS>





BOWTIE
------

INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/hit.snp

    
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 12:27 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 12:28 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp



RUN cumulativeSnp.pl:


screen -S bowtie-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/cumulativeSnp.out
    
    cumulativeSNP.pl    Run time: 24:59:42
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    2:42PM, 6 November 2010
    cumulativeSNP.pl    ****************************************



OUTPUT FILES:

merged.bam-4 IS THE SAME AS merged.bam-5
merged.bam-6 IS THE SAME AS merged.bam-7

MISSING FILES

    hit-4.snp
    hit-6.snp

PROBLEM WITH 15 < 14, SAME WITH 17 < 16

diff merged.bam-4 merged.bam-5
    <NO DIFFERENCE> 

diff merged.bam-6 merged.bam-7
    <NO DIFFERENCE> 


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ls -al  merged.bam*

    -rw-rw-rw- 1 syoung root 7904044194 Nov  6 14:23 merged.bam
    -rw-r--r-- 1 syoung root  313122729 Nov  5 13:44 merged.bam-1
    -rw-r--r-- 1 syoung root  616350940 Nov  5 13:53 merged.bam-2
    -rw-r--r-- 1 syoung root  917106299 Nov  5 14:06 merged.bam-3
    -rw-r--r-- 1 syoung root 1216529421 Nov  5 14:22 merged.bam-4
    -rw-r--r-- 1 syoung root 1216529421 Nov  5 14:23 merged.bam-5
    -rw-r--r-- 1 syoung root 1514373575 Nov  5 14:43 merged.bam-6
    -rw-r--r-- 1 syoung root 1514373575 Nov  5 14:44 merged.bam-7
    -rw-r--r-- 1 syoung root 1811020002 Nov  5 15:09 merged.bam-8
    -rw-r--r-- 1 syoung root 2106449126 Nov  5 15:35 merged.bam-9
    -rw-r--r-- 1 syoung root 2400277889 Nov  5 16:06 merged.bam-10
    -rw-r--r-- 1 syoung root 2693376979 Nov  5 16:40 merged.bam-11
    -rw-r--r-- 1 syoung root 2985616602 Nov  5 17:18 merged.bam-12
    -rw-r--r-- 1 syoung root 3277392847 Nov  5 18:38 merged.bam-13
    -rw-r--r-- 1 syoung root 3568354920 Nov  5 19:21 merged.bam-14
    -rw-r--r-- 1 syoung root 2058698752 Nov  5 20:07 merged.bam-15
    -rw-r--r-- 1 syoung root 3859044812 Nov  5 20:09 merged.bam-16
    -rw-rw-rw- 1 syoung root 3303489536 Nov  5 20:59 merged.bam-17
    -rw-rw-rw- 1 syoung root 4149291043 Nov  5 21:01 merged.bam-18
    -rw-rw-rw- 1 syoung root 4439057881 Nov  5 21:59 merged.bam-19
    -rw-rw-rw- 1 syoung root 4728854749 Nov  5 22:59 merged.bam-20
    -rw-rw-rw- 1 syoung root 4491788288 Nov  6 00:03 merged.bam-21
    -rw-rw-rw- 1 syoung root 5017947615 Nov  6 00:05 merged.bam-22
    -rw-rw-rw- 1 syoung root 5307236443 Nov  6 01:11 merged.bam-23
    -rw-rw-rw- 1 syoung root 5596403497 Nov  6 02:21 merged.bam-24
    -rw-rw-rw- 1 syoung root 5885620847 Nov  6 03:37 merged.bam-25
    -rw-rw-rw- 1 syoung root 6174118275 Nov  6 05:21 merged.bam-26
    -rw-rw-rw- 1 syoung root 6462658749 Nov  6 06:49 merged.bam-27
    -rw-rw-rw- 1 syoung root 6751220825 Nov  6 08:10 merged.bam-28
    -rw-rw-rw- 1 syoung root 7039488566 Nov  6 09:35 merged.bam-29
    -rw-rw-rw- 1 syoung root 7327549289 Nov  6 11:09 merged.bam-30
    -rw-rw-rw- 1 syoung root 7327549289 Nov  6 11:17 merged.bam-31
    -rw-rw-rw- 1 syoung root 7615614461 Nov  6 12:50 merged.bam-32
    -rw-rw-rw- 1 syoung root 7904044194 Nov  6 14:26 merged.bam-33
    -rw-rw-rw- 1 syoung root 7904044206 Nov  6 13:30 merged.bam.temp

GB UNITS:
    
    -rw-rw-rw- 1 syoung root 7.4G Nov  6 14:23 merged.bam
    -rw-r--r-- 1 syoung root 299M Nov  5 13:44 merged.bam-1
    -rw-r--r-- 1 syoung root 588M Nov  5 13:53 merged.bam-2
    -rw-r--r-- 1 syoung root 875M Nov  5 14:06 merged.bam-3
    -rw-r--r-- 1 syoung root 1.2G Nov  5 14:22 merged.bam-4
    -rw-r--r-- 1 syoung root 1.2G Nov  5 14:23 merged.bam-5
    -rw-r--r-- 1 syoung root 1.5G Nov  5 14:43 merged.bam-6
    -rw-r--r-- 1 syoung root 1.5G Nov  5 14:44 merged.bam-7
    -rw-r--r-- 1 syoung root 1.7G Nov  5 15:09 merged.bam-8
    -rw-r--r-- 1 syoung root 2.0G Nov  5 15:35 merged.bam-9
    -rw-r--r-- 1 syoung root 2.3G Nov  5 16:06 merged.bam-10
    -rw-r--r-- 1 syoung root 2.6G Nov  5 16:40 merged.bam-11
    -rw-r--r-- 1 syoung root 2.8G Nov  5 17:18 merged.bam-12
    -rw-r--r-- 1 syoung root 3.1G Nov  5 18:38 merged.bam-13
    -rw-r--r-- 1 syoung root 3.4G Nov  5 19:21 merged.bam-14
    -rw-r--r-- 1 syoung root 2.0G Nov  5 20:07 merged.bam-15
    -rw-r--r-- 1 syoung root 3.6G Nov  5 20:09 merged.bam-16
    -rw-rw-rw- 1 syoung root 3.1G Nov  5 20:59 merged.bam-17
    -rw-rw-rw- 1 syoung root 3.9G Nov  5 21:01 merged.bam-18
    -rw-rw-rw- 1 syoung root 4.2G Nov  5 21:59 merged.bam-19
    -rw-rw-rw- 1 syoung root 4.5G Nov  5 22:59 merged.bam-20
    -rw-rw-rw- 1 syoung root 4.2G Nov  6 00:03 merged.bam-21
    -rw-rw-rw- 1 syoung root 4.7G Nov  6 00:05 merged.bam-22
    -rw-rw-rw- 1 syoung root 5.0G Nov  6 01:11 merged.bam-23
    -rw-rw-rw- 1 syoung root 5.3G Nov  6 02:21 merged.bam-24
    -rw-rw-rw- 1 syoung root 5.5G Nov  6 03:37 merged.bam-25
    -rw-rw-rw- 1 syoung root 5.8G Nov  6 05:21 merged.bam-26
    -rw-rw-rw- 1 syoung root 6.1G Nov  6 06:49 merged.bam-27
    -rw-rw-rw- 1 syoung root 6.3G Nov  6 08:10 merged.bam-28
    -rw-rw-rw- 1 syoung root 6.6G Nov  6 09:35 merged.bam-29
    -rw-rw-rw- 1 syoung root 6.9G Nov  6 11:09 merged.bam-30
    -rw-rw-rw- 1 syoung root 6.9G Nov  6 11:17 merged.bam-31
    -rw-rw-rw- 1 syoung root 7.1G Nov  6 12:50 merged.bam-32
    -rw-rw-rw- 1 syoung root 7.4G Nov  6 14:26 merged.bam-33
    -rw-rw-rw- 1 syoung root 7.4G Nov  6 13:30 merged.bam.temp



OUTPUT *snp FILES:
    
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 13:44 hit-1.snp
    -rw-rw-rw- 1 syoung root 7.1M Nov  5 13:54 hit-2.snp
    -rw-rw-rw- 1 syoung root 8.9M Nov  5 14:07 hit-3.snp
    -rw-rw-rw- 1 syoung root  11M Nov  5 14:25 hit-5.snp
    -rw-rw-rw- 1 syoung root  12M Nov  5 14:46 hit-7.snp
    -rw-rw-rw- 1 syoung root  12M Nov  5 15:11 hit-8.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 15:38 hit-9.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 16:09 hit-10.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 16:44 hit-11.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 17:22 hit-12.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 18:43 hit-13.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 19:27 hit-14.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 20:13 hit-15.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 20:15 hit-16.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 21:05 hit-17.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 21:07 hit-18.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 22:07 hit-19.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 23:06 hit-20.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 00:11 hit-21.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 00:13 hit-22.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 01:20 hit-23.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 02:31 hit-24.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 03:48 hit-25.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 05:38 hit-26.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 07:01 hit-27.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 08:23 hit-28.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 09:48 hit-29.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 11:31 hit-31.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 13:05 hit-32.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 14:42 hit-33.snp




NOVOALIGN
---------


INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/hit.snp


    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:29 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:22 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  4 16:23 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:44 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:44 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:47 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:45 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:42 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:26 7/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 9/chr22/hit.snp



RUN cumulativeSnp.pl:


mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative

screen -S novo-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/cumulativeSnp.out


DIED BECAUSE OF PEGASUS SHUTDOWN:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/cumulativeSnp.out
cumulativeSNP.pl    Printing STDOUT to stdoutfile:


screen STDOUT:

    LSF daemon (LIM) not responding ... still trying
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Can't exec "bjobs": No such file or directory at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 582.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Use of uninitialized value in split at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 586.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Can't exec "bjobs": No such file or directory at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 582.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Use of uninitialized value in split at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 586.
    Command 'bsub' not found in /sw/bin, /nethome/syoung/base/bin, /usr/X11R6/bin, /nethome/syoung/base/bin/utils, /home/syoung/base/bin/nextgen, /home/syoung/base/apps/amos/bin, /home/apps/alta-cyclic/0.1.0/external.programs/libsvm-2.86, /home/apps/alta-cyclic/0.1.0/blat/bin/i386, /home/bioinfo/apps/ngs/bin/nextgen, /home/bioinfo/apps/ngs/bin/exome, /home/bioinfo/apps/ngs/bin/utils, /home/bioinfo/apps/ngs/bin, /nethome/syoung/base/apps/python/python/2.7/bin, /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/etc, /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/bin, /usr/kerberos/bin, /usr/local/bin, /bin, /usr/bin at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/external/LSF.pm line 62


RESTART FROM FILE 18:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22
ls -al merged.bam*

    -rw-r--r-- 1 syoung root 1700244587 Nov  7 07:13 merged.bam
    -rw-r--r-- 1 syoung root  298737689 Nov  5 13:28 merged.bam-1
    -rw-r--r-- 1 syoung root 2566930861 Nov  5 21:16 merged.bam-10
    -rw-r--r-- 1 syoung root 1890140160 Nov  5 23:33 merged.bam-11
    -rw-r--r-- 1 syoung root 2847110086 Nov  5 23:35 merged.bam-12
    -rw-r--r-- 1 syoung root 3127078856 Nov  6 02:13 merged.bam-13
    -rw-r--r-- 1 syoung root 3400646391 Nov  6 05:23 merged.bam-14
    -rw-r--r-- 1 syoung root 3679162106 Nov  6 08:48 merged.bam-15
    -rw-r--r-- 1 syoung root 3956869897 Nov  6 12:36 merged.bam-16
    -rw-r--r-- 1 syoung root 4230385119 Nov  6 16:39 merged.bam-17
    -rw-r--r-- 1 syoung root 1700244587 Nov  7 07:13 merged.bam-18
    -rw-r--r-- 1 syoung root  588597724 Nov  5 13:39 merged.bam-2
    -rw-r--r-- 1 syoung root  295408851 Nov  6 20:46 merged.bam-20
    -rw-r--r-- 1 syoung root  878073339 Nov  5 14:01 merged.bam-3
    -rw-r--r-- 1 syoung root 1164628504 Nov  5 14:34 merged.bam-4
    -rw-r--r-- 1 syoung root 1445389739 Nov  5 15:21 merged.bam-5
    -rw-r--r-- 1 syoung root 1445389739 Nov  5 15:23 merged.bam-6
    -rw-r--r-- 1 syoung root 1729019503 Nov  5 16:24 merged.bam-7
    -rw-r--r-- 1 syoung root 2012313044 Nov  5 17:42 merged.bam-8
    -rw-r--r-- 1 syoung root 2289335846 Nov  5 19:21 merged.bam-9
    -rw-rw-rw- 1 syoung root 4503959632 Nov  7 07:08 merged.bam.temp




RERUN FROM 18:

screen -S novo-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--start 18 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/cumulativeSnp.out




RUNNING:

    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/cumulativeSnp-chr22-18.sh
    Job <2246563> is submitted to queue <large>.
    Mon Nov  8 12:06:58 EST 2010


COMPLETED BUT INTERRUPTED:

    cumulativeSNP.pl    Run time: 20:21:38
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    8:28AM, 9 November 2010
    cumulativeSNP.pl    ****************************************


    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/
ll merged.bam*

    -rw-r--r-- 1 syoung root 5.3G Nov  9 05:26 merged.bam
    -rw-r--r-- 1 syoung root 285M Nov  5 13:28 merged.bam-1
    -rw-r--r-- 1 syoung root 562M Nov  5 13:39 merged.bam-2
    -rw-r--r-- 1 syoung root 838M Nov  5 14:01 merged.bam-3
    -rw-r--r-- 1 syoung root 1.1G Nov  5 14:34 merged.bam-4
    -rw-r--r-- 1 syoung root 1.4G Nov  5 15:21 merged.bam-5
    -rw-r--r-- 1 syoung root 1.4G Nov  5 15:23 merged.bam-6
    -rw-r--r-- 1 syoung root 1.7G Nov  5 16:24 merged.bam-7
    -rw-r--r-- 1 syoung root 1.9G Nov  5 17:42 merged.bam-8
    -rw-r--r-- 1 syoung root 2.2G Nov  5 19:21 merged.bam-9
    -rw-r--r-- 1 syoung root 2.4G Nov  5 21:16 merged.bam-10
    -rw-r--r-- 1 syoung root 1.8G Nov  5 23:33 merged.bam-11
    -rw-r--r-- 1 syoung root 2.7G Nov  5 23:35 merged.bam-12
    -rw-r--r-- 1 syoung root 3.0G Nov  6 02:13 merged.bam-13
    -rw-r--r-- 1 syoung root 3.2G Nov  6 05:23 merged.bam-14
    -rw-r--r-- 1 syoung root 3.5G Nov  6 08:48 merged.bam-15
    -rw-r--r-- 1 syoung root 3.7G Nov  6 12:36 merged.bam-16
    -rw-r--r-- 1 syoung root 4.0G Nov  6 16:39 merged.bam-17
    -rw-r--r-- 1 syoung root 4.2G Nov  8 13:08 merged.bam-18
    -rw-r--r-- 1 syoung root 4.1G Nov  8 16:57 merged.bam-19
    -rw-r--r-- 1 syoung root 4.5G Nov  8 16:59 merged.bam-20

    -rw-r--r-- 1 syoung root 3.3G Nov  8 21:02 merged.bam-21
    -rw-r--r-- 1 syoung root 4.7G Nov  8 21:05 merged.bam-22
    -rw-r--r-- 1 syoung root 5.0G Nov  9 01:26 merged.bam-32
    -rw-r--r-- 1 syoung root 5.3G Nov  9 05:29 merged.bam-33
    -rw-rw-rw- 1 syoung root 5.3G Nov  9 04:47 merged.bam.temp




NB: FILE merged.bam-5 IS THE SAME AS FILE merged.bam-6 

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/
diff merged.bam-5 merged.bam-6

    <NO DIFFERENCE>

AND hit-5.snp IS MISSING:

    -rw-rw-rw- 1 syoung root 1.5M Nov  5 13:31 hit-1.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov  5 13:49 hit-2.snp
    -rw-rw-rw- 1 syoung root 3.0M Nov  5 14:19 hit-3.snp
    -rw-rw-rw- 1 syoung root 3.5M Nov  5 15:04 hit-4.snp
    -rw-rw-rw- 1 syoung root 4.0M Nov  5 16:05 hit-6.snp
    -rw-rw-rw- 1 syoung root 4.4M Nov  5 17:20 hit-7.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 18:53 hit-8.snp
    -rw-rw-rw- 1 syoung root 5.1M Nov  5 20:48 hit-9.snp
    -rw-rw-rw- 1 syoung root 5.4M Nov  5 23:01 hit-10.snp
    -rw-rw-rw- 1 syoung root 5.7M Nov  6 01:37 hit-11.snp
    -rw-rw-rw- 1 syoung root 5.7M Nov  6 01:39 hit-12.snp
    -rw-rw-rw- 1 syoung root 6.0M Nov  6 04:41 hit-13.snp
    -rw-rw-rw- 1 syoung root 6.2M Nov  6 08:09 hit-14.snp
    -rw-rw-rw- 1 syoung root 6.5M Nov  6 11:55 hit-15.snp
    -rw-rw-rw- 1 syoung root 3.5M Nov  7 09:55 hit-18.snp
    -rw-rw-rw- 1 syoung root    0 Nov  6 20:46 hit-20.snp




SO SURMISE THAT merged.bam-5 FAILED. CHANGED PROCESS SO THAT THE SAME INTERMEDIATE FILE IS NOT USED FOR ALL STEPS.


RERAN AS novo-cum2




INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/
ll */chr22/hit.sam

    -rw-rw-rw- 1 syoung root 864M Nov  5 06:19 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 873M Nov  5 06:17 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:19 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 876M Nov  5 06:12 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 858M Nov  5 06:17 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:19 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:17 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 863M Nov  5 06:35 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 842M Nov  5 06:34 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 837M Nov  5 06:34 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 874M Nov  4 16:17 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 864M Nov  5 06:38 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 868M Nov  5 06:43 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 863M Nov  5 06:45 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 869M Nov  5 06:44 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:42 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 873M Nov  5 06:39 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 877M Nov  5 06:45 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 868M Nov  5 06:45 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 867M Nov  5 06:39 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 864M Nov  5 06:42 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 869M Nov  5 06:14 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 865M Nov  5 06:44 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 869M Nov  5 06:45 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 872M Nov  5 06:39 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 852M Nov  5 06:36 33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 874M Nov  5 06:19 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 871M Nov  5 06:16 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 870M Nov  5 06:19 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 860M Nov  5 06:17 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 873M Nov  5 06:15 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 876M Nov  5 06:17 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 860M Nov  5 06:18 9/chr22/hit.sam



RERUN cumulativeSnp.pl


screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label novo-cum2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.out


    RUNNING FILE 1
    Mon Nov 15 01:32:18 EST 2010

    AT FILE 21, Tue Nov 16 13:49:30 EST 2010





PROBLEM WITH LSF AT Mon Nov 15 13:53:00 EST 2010 BUT STILL RUNNING

    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.out
    
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying




NOTICED 'SLIPPAGE' AT FILES 8 AND 9 IN cumulative2 (COMPARED TO FILES 5 AND 6 IN cumulative):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll -tr merged.bam*

    -rw-r--r-- 1 syoung root 285M Nov 15 01:33 merged.bam-1
    -rw-rw-rw- 1 syoung root 562M Nov 15 01:44 merged.bam-2
    -rw-rw-rw- 1 syoung root 838M Nov 15 02:04 merged.bam-3
    -rw-rw-rw- 1 syoung root 1.1G Nov 15 02:38 merged.bam-4
    -rw-rw-rw- 1 syoung root 1.4G Nov 15 03:27 merged.bam-5
    -rw-rw-rw- 1 syoung root 1.7G Nov 15 04:28 merged.bam-6
    -rw-rw-rw- 1 syoung root 1.9G Nov 15 05:46 merged.bam-7
    -rw-rw-rw- 1 syoung root 2.2G Nov 15 07:26 merged.bam-9
    -rw-rw-rw- 1 syoung root 2.2G Nov 15 07:26 merged.bam-8
    -rw-rw-rw- 1 syoung root 2.4G Nov 15 09:20 merged.bam-10
    -rw-rw-rw- 1 syoung root 2.4G Nov 15 09:22 merged.bam-11
    -rw-rw-rw- 1 syoung root 2.7G Nov 15 11:38 merged.bam-12
    -rw-rw-rw- 1 syoung root 3.0G Nov 15 14:15 merged.bam-13
    -rw-rw-rw- 1 syoung root 3.0G Nov 15 14:16 merged.bam-14
    -rw-rw-rw- 1 syoung root 3.2G Nov 15 17:17 merged.bam-15
    -rw-rw-rw- 1 syoung root 3.5G Nov 15 20:43 merged.bam-17
    -rw-rw-rw- 1 syoung root 3.5G Nov 15 20:43 merged.bam-16
    -rw-rw-rw- 1 syoung root 3.7G Nov 16 00:30 merged.bam-18
    -rw-rw-rw- 1 syoung root 4.0G Nov 16 04:32 merged.bam-19
    -rw-rw-rw- 1 syoung root 4.2G Nov 16 08:36 merged.bam-20
    -rw-rw-rw- 1 syoung root 4.5G Nov 16 12:05 merged.bam.temp
    -rw-rw-rw- 1 syoung root 4.5G Nov 16 12:37 merged.bam
    -rw-rw-rw- 1 syoung root 4.5G Nov 16 12:39 merged.bam-21

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll -tr ../../cumulative/chr22/merged.bam*

    -rw-r--r-- 1 syoung root 285M Nov  5 13:28 ../../cumulative/chr22/merged.bam-1
    -rw-r--r-- 1 syoung root 562M Nov  5 13:39 ../../cumulative/chr22/merged.bam-2
    -rw-r--r-- 1 syoung root 838M Nov  5 14:01 ../../cumulative/chr22/merged.bam-3
    -rw-r--r-- 1 syoung root 1.1G Nov  5 14:34 ../../cumulative/chr22/merged.bam-4
    -rw-r--r-- 1 syoung root 1.4G Nov  5 15:21 ../../cumulative/chr22/merged.bam-5
    -rw-r--r-- 1 syoung root 1.4G Nov  5 15:23 ../../cumulative/chr22/merged.bam-6
    -rw-r--r-- 1 syoung root 1.7G Nov  5 16:24 ../../cumulative/chr22/merged.bam-7
    -rw-r--r-- 1 syoung root 1.9G Nov  5 17:42 ../../cumulative/chr22/merged.bam-8
    -rw-r--r-- 1 syoung root 2.2G Nov  5 19:21 ../../cumulative/chr22/merged.bam-9
    -rw-r--r-- 1 syoung root 2.4G Nov  5 21:16 ../../cumulative/chr22/merged.bam-10
    -rw-r--r-- 1 syoung root 1.8G Nov  5 23:33 ../../cumulative/chr22/merged.bam-11
    -rw-r--r-- 1 syoung root 2.7G Nov  5 23:35 ../../cumulative/chr22/merged.bam-12
    -rw-r--r-- 1 syoung root 3.0G Nov  6 02:13 ../../cumulative/chr22/merged.bam-13
    -rw-r--r-- 1 syoung root 3.2G Nov  6 05:23 ../../cumulative/chr22/merged.bam-14
    -rw-r--r-- 1 syoung root 3.5G Nov  6 08:48 ../../cumulative/chr22/merged.bam-15
    -rw-r--r-- 1 syoung root 3.7G Nov  6 12:36 ../../cumulative/chr22/merged.bam-16
    -rw-r--r-- 1 syoung root 4.0G Nov  6 16:39 ../../cumulative/chr22/merged.bam-17
    -rw-r--r-- 1 syoung root 4.2G Nov  8 13:08 ../../cumulative/chr22/merged.bam-18
    -rw-r--r-- 1 syoung root 4.1G Nov  8 16:57 ../../cumulative/chr22/merged.bam-19
    -rw-r--r-- 1 syoung root 4.5G Nov  8 16:59 ../../cumulative/chr22/merged.bam-20
    -rw-r--r-- 1 syoung root 3.3G Nov  8 21:02 ../../cumulative/chr22/merged.bam-21
    -rw-r--r-- 1 syoung root 4.7G Nov  8 21:05 ../../cumulative/chr22/merged.bam-22
    -rw-r--r-- 1 syoung root 5.0G Nov  9 01:26 ../../cumulative/chr22/merged.bam-32
    -rw-rw-rw- 1 syoung root 5.3G Nov  9 04:47 ../../cumulative/chr22/merged.bam.temp
    -rw-r--r-- 1 syoung root 5.3G Nov  9 05:26 ../../cumulative/chr22/merged.bam
    -rw-r--r-- 1 syoung root 5.3G Nov  9 05:29 ../../cumulative/chr22/merged.bam-33



MANUAL MERGE OF FILE 9 IN cumulative2

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22


time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.sam;

    [sam_header_read2] 1 sequences loaded.
    
    real    1m18.149s
    user    1m9.454s
    sys     0m5.360s


EXTRA STEP: COPY LAST merged.bam FILE TO merged.bam
cp -r merged.bam-8 merged.bam


screen -S cum2

REDUCED THIS CODE:

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam;


    real    8m59.867s
    user    8m40.331s
    sys     0m15.837s

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit;

time mv -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam;

time cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam-9;



TO A MORE DIRECT APPROACH IN THIS CODE:

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-9.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam;

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-9.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged-9;

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22;


FOLLOWED BY SNP CALLING:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22;

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam | tee hit-9.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-9.filter;

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-9.filter > hit-9.snp





RE-RE-RERUN FROM BEGINNING
--------------------------

screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label novo-cum2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.out

    
    cumulativeSNP.pl    Run time: 01:28:51
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    1:47AM, 17 November 2010
    cumulativeSNP.pl    ****************************************




SNP::bamSnps    COMMANDS:

time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10/chr22/hit.sam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10.bam | tee hit-10.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-10.filter

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-10.filter > hit-10.snp



RAN FINE FOR 4 FILES THEN FAILED AT FILE 5:


emacs cumulativeSnp-chr22-5-stdout.txt

    ...
    [sam_header_read2] 1 sequences loaded.
    
    real    1m2.485s
    user    0m57.448s
    sys     0m3.174s
    open: No such file or directory
    [bam_merge_core] fail to open file /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam
    ...


EVEN THOUGH THE FILE IS QUESTION IS PRESENT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam

    -rw-rw-rw- 1 syoung root 1.1G Nov 17 01:21 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll cumulativeSnp-chr22-5-stdout.txt

    -rw-rw-rw- 1 syoung root 2.4K Nov 17 01:11 cumulativeSnp-chr22-5-stdout.txt



NOTE: THE FILE IN QUESTION IS DATED LATER THAN THE END OF THE OUTPUT FILE!!






RE-RE-RE-RERUN FROM FILE 5
--------------------------

screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--start 5 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label novo-cum2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.out



    cumulativeSNP.pl    Run time: 66:55:59
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    9:14AM, 21 November 2010
    cumulativeSNP.pl    ****************************************



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22
ll -tr hit*snp

    -rw-rw-rw- 1 syoung root    0 Nov 12 15:37 hit-1.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov 12 15:39 hit-2.snp
    -rw-rw-rw- 1 syoung root 7.2M Nov 12 15:49 hit-3.snp
    -rw-rw-rw- 1 syoung root 7.9M Nov 12 15:58 hit-4.snp
    -rw-rw-rw- 1 syoung root 9.6M Nov 12 16:11 hit-5.snp
    -rw-rw-rw- 1 syoung root  11M Nov 12 16:30 hit-7.snp
    -rw-rw-rw- 1 syoung root  12M Nov 12 16:52 hit-8.snp
    -rw-rw-rw- 1 syoung root  12M Nov 12 17:14 hit-9.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 17:39 hit-10.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 18:07 hit-11.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 18:40 hit-12.snp
    -rw-rw-rw- 1 syoung root  14M Nov 12 19:19 hit-13.snp
    -rw-rw-rw- 1 syoung root  14M Nov 12 20:01 hit-14.snp
    -rw-rw-rw- 1 syoung root  14M Nov 12 20:56 hit-15.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 21:59 hit-16.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 23:03 hit-17.snp
    -rw-rw-rw- 1 syoung root 2.0M Nov 12 23:27 hit-19.snp
    -rw-rw-rw- 1 syoung root 2.0M Nov 12 23:33 hit-18.snp
    -rw-rw-rw- 1 syoung root 5.7M Nov 13 03:42 hit-21.snp
    -rw-rw-rw- 1 syoung root 7.6M Nov 13 04:03 hit-23.snp
    -rw-rw-rw- 1 syoung root 8.9M Nov 13 04:25 hit-24.snp
    -rw-rw-rw- 1 syoung root 9.8M Nov 13 04:52 hit-26.snp
    -rw-rw-rw- 1 syoung root 9.8M Nov 13 04:52 hit-25.snp
    -rw-rw-rw- 1 syoung root  11M Nov 13 05:24 hit-27.snp
    -rw-rw-rw- 1 syoung root  11M Nov 13 05:57 hit-28.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 06:36 hit-29.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 06:36 hit-30.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 07:18 hit-31.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 08:02 hit-32.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 08:50 hit-33.snp


NOTE: FILE 1 merged.bam FILE IS MUCH SMALLER THAN EXPECTED

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22

    -rw-rw-rw- 1 syoung root   54314137 Nov 19 10:07 merged-1.bam
    -rw-rw-rw- 1 syoung root  367662929 Nov 19 10:22 merged-2.bam
    -rw-rw-rw- 1 syoung root  671362697 Nov 19 10:40 merged-3.bam
    -rw-rw-rw- 1 syoung root  774027622 Nov 19 10:59 merged-4.bam
    -rw-rw-rw- 1 syoung root 1076452433 Nov 19 11:22 merged-5.bam
    -rw-rw-rw- 1 syoung root 1375669775 Nov 19 11:49 merged-6.bam
    -rw-rw-rw- 1 syoung root 1673205685 Nov 19 12:18 merged-7.bam
    -rw-rw-rw- 1 syoung root 1969431981 Nov 19 12:51 merged-8.bam
    -rw-rw-rw- 1 syoung root 2014878689 Nov 19 13:25 merged-9.bam
    -rw-rw-rw- 1 syoung root 2309361554 Nov 19 14:02 merged-10.bam
    -rw-rw-rw- 1 syoung root 2602956914 Nov 19 14:43 merged-11.bam






NOTES
-----

RESTART AT FILE 17


SNP::bamSnps    COMMANDS:

time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit.sam

time cp merged.bam-17 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit

time mv -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam

time cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam-18

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam | tee hit-18.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-18.filter

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-18.filter > hit-18.snp





</entry>



<entry [Fri Nov  5 01:45:59 EDT 2010] RUN SAV.pl ON MAQ 3.3 BILLION READS SNPS>



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative

screen -S maq-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--replicates 1-33 \
--loop distributed \
--label maq-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/loop-sav.out
    
    Run time: 03:47:13
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    5:44AM, 5 November 2010
    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative
ls -al *sav

    -rw-rw-rw- 1 syoung root 1894786 Nov  5 05:17 hit-1.sav
    -rw-rw-rw- 1 syoung root 2622141 Nov  5 05:44 hit-2.sav
    -rw-rw-rw- 1 syoung root 2249006 Nov  5 05:24 hit-3.sav
    -rw-rw-rw- 1 syoung root 1361217 Nov  5 04:00 hit-4.sav
    -rw-rw-rw- 1 syoung root 1035973 Nov  5 03:31 hit-5.sav
    -rw-rw-rw- 1 syoung root  776917 Nov  5 03:04 hit-6.sav


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative
ls -al *snp

    -rw-rw-rw- 1 syoung root 1116781 Nov  4 14:32 hit-1.snp
    -rw-rw-rw- 1 syoung root 1562854 Nov  4 13:06 hit-2.snp
    -rw-rw-rw- 1 syoung root 1468170 Nov  4 19:32 hit-3.snp
    -rw-rw-rw- 1 syoung root 1113761 Nov  4 20:38 hit-4.snp
    -rw-rw-rw- 1 syoung root 1048679 Nov  4 22:09 hit-5.snp
    -rw-rw-rw- 1 syoung root 1012187 Nov  4 23:59 hit-6.snp
    -rw-rw-rw- 1 syoung root  979568 Nov  5 02:13 hit-7.snp
    -rw-rw-rw- 1 syoung root  980441 Nov  5 04:31 hit-8.snp
    -rw-rw-rw- 1 syoung root 1008297 Nov  5 07:06 hit-9.snp









</entry>



<entry [Thu Nov  4 14:19:57 EDT 2010] RUN bamCoverage.pl ON ELAND CUMULATIVELY MERGED BAM FILES>




1. COPIED merged.bam-N FILES FROM /ngs/bioinfo TO /scratch

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22

NOTE: PROBLEM WITH 2-3 TRANSITION AND 4-5 TRANSITION

ls -al merged.bam*

    -rw-r--r-- 1 syoung root  178443232 Nov  4 13:17 merged.bam-1
    -rw-r--r-- 1 syoung root  216918872 Nov  4 13:23 merged.bam-2
    -rw-r--r-- 1 syoung root  216918872 Nov  4 13:31 merged.bam-3
    -rw-r--r-- 1 syoung root  344605293 Nov  4 13:36 merged.bam-4
    -rw-r--r-- 1 syoung root  344605293 Nov  4 13:36 merged.bam-5
    -rw-r--r-- 1 syoung root  468927373 Nov  4 13:36 merged.bam-6
    -rw-r--r-- 1 syoung root  591296764 Nov  4 13:37 merged.bam-7
    -rw-r--r-- 1 syoung root  712410526 Nov  4 13:37 merged.bam-8
    -rw-r--r-- 1 syoung root  832639592 Nov  4 13:37 merged.bam-9
    -rw-r--r-- 1 syoung root  952113778 Nov  4 13:18 merged.bam-10
    -rw-r--r-- 1 syoung root 1070777742 Nov  4 13:18 merged.bam-11
    -rw-r--r-- 1 syoung root 1188799709 Nov  4 13:18 merged.bam-12
    -rw-r--r-- 1 syoung root 1306482150 Nov  4 13:19 merged.bam-13
    -rw-r--r-- 1 syoung root 1423967574 Nov  4 13:19 merged.bam-14
    -rw-r--r-- 1 syoung root 1540688744 Nov  4 13:20 merged.bam-15
    -rw-r--r-- 1 syoung root 1657113893 Nov  4 13:21 merged.bam-16
    -rw-r--r-- 1 syoung root 1773270440 Nov  4 13:21 merged.bam-17
    -rw-r--r-- 1 syoung root 1889197821 Nov  4 13:22 merged.bam-18
    -rw-r--r-- 1 syoung root 2004974876 Nov  4 13:22 merged.bam-19
    -rw-r--r-- 1 syoung root 2120509050 Nov  4 13:23 merged.bam-20
    -rw-r--r-- 1 syoung root 2235977834 Nov  4 13:24 merged.bam-21
    -rw-r--r-- 1 syoung root 2351019951 Nov  4 13:25 merged.bam-22
    -rw-r--r-- 1 syoung root 2466067804 Nov  4 13:26 merged.bam-23
    -rw-r--r-- 1 syoung root 2581127799 Nov  4 13:26 merged.bam-24
    -rw-r--r-- 1 syoung root 2695985987 Nov  4 13:27 merged.bam-25
    -rw-r--r-- 1 syoung root 2810611918 Nov  4 13:28 merged.bam-26
    -rw-r--r-- 1 syoung root 2925308495 Nov  4 13:29 merged.bam-27
    -rw-r--r-- 1 syoung root 3039937621 Nov  4 13:30 merged.bam-28
    -rw-r--r-- 1 syoung root 3154262034 Nov  4 13:31 merged.bam-29
    -rw-r--r-- 1 syoung root 3268626202 Nov  4 13:33 merged.bam-30
    -rw-r--r-- 1 syoung root 3382741560 Nov  4 13:34 merged.bam-31
    -rw-r--r-- 1 syoung root 3496983991 Nov  4 13:35 merged.bam-32
    -rw-r--r-- 1 syoung root 3611070880 Nov  4 13:36 merged.bam-33




2. INDEX BAM FILES
------------------


/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative \
--loop distributed \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/indexBam.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-%REPLICATE%.bai \
--label bamIndex \
--cluster LSF \
--maxjobs 1000 \
--queue small

    
    Run time: 00:12:34
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    0:51AM, 5 November 2010
    ****************************************




3. RUN bamCoverage.pl ON ALL merged.bam-N FILES
-----------------------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative

ON u02:
------

screen -S eland-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-%REPLICATE%.coverage \
--replicates 1-33 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small

    Run time: 00:16:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:12AM, 5 November 2010
    ****************************************

1	2.741045
2	3.247491
3	3.247491
4	5.082651
5	5.082651
6	6.917666
7	8.751204
8	10.586130
9	12.422666
10	14.259093
11	16.093735
12	17.927492
13	19.763257
14	21.601560
15	23.434835
16	25.267585
17	27.100272
18	28.933352
19	30.767292
20	32.601366
21	34.436576
22	36.268196
23	38.102003
24	39.937946
25	41.773484
26	43.606847
27	45.442986
28	47.280553
29	49.113945
30	50.950272
31	52.784406
32	54.620388
33	56.455139










NOTES
-----

TEST THE merged.bam-1 FILE
--------------------------

/nethome/bioinfo/apps/samtools/0.1.6/samtools view \
-o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged-1.sam \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-1

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged-1.sam
    -rw-rw-r-- 1 syoung root 596M Nov  4 16:23 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged-1.sam
    
[syoung@u01 chr22]$ head /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged-1.sam

    SRR005734.12612956:4:39:1116:140        153     chr22   16050009        81      36M     *       0       0       AAGTCCCAGGACTTCAGAAGAGCTCTGTGACCTTGG    )+!"++++++++++++++++++++++++++++++++    MD:Z:8T2C24     SM:i:81
    SRR005735.1021891:1:16:1497:601 89      chr22   16050009        87      36M     *       0       0       AAGTCCCAGGACTTCAGAAGAGCTGTGCGACCTTGG   ++*%++++"+%++!++++++++++++++++++++++     MD:Z:8T27       SM:i:87
    ...
    

/nethome/bioinfo/apps/samtools/0.1.6/samtools idxstats \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-1

    
    
    


</entry>



<entry [Thu Nov  4 12:29:48 EDT 2010] RERUN BOWTIE chr22 WITH DEFAULTS>




PROBLEM: BOWTIE RUN WITH --rf OPTION ON 3.3 BILLION READS PRODUCED SMALL hit.sam FILE

CONCLUSION: MUST RERUN BOWTIE FLAG WITH 3.3 BILLION READS USING '--fr' FLAG

BUT FIRST RUN DEFAULT FOR COMPARISON:


FIRST ROUND (2-16)
-----------------

(RAN FILE 1 FIRST TO TEST)
    
    BOWTIE.pl    Run time: 01:04:59
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    2:45PM, 4 November 2010
    BOWTIE.pl    ****************************************

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie


screen -S loop-bowtie


/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 2-16 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--params " --fr "
--loop parallel \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/bowtie-200bp-chr22-%REPLICATE%.out 

    
    BOWTIE.pl    Run time: 02:42:52
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    4:38PM, 4 November 2010
    BOWTIE.pl    ****************************************
    
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/hit.snp

    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp


head 8/chr22/hit.snp

    chr22   16050036        a       C       36      36      60      3       CCC     &II
    chr22   16050252        A       W       26      26      60      5       ,.T,T   IABII
    chr22   16050612        c       G       36      36      60      3       ggG     I+I
    chr22   16051107        c       A       36      36      60      3       aAa     I':
    chr22   16051209        a       G       12      39      60      5       gGG,g   I=I?I
    chr22   16051966        c       S       77      77      60      16      GgGG.G......GG.%@'E43I2II;IIII/
    chr22   16051998        c       Y       27      27      60      17      TTTT.TTTtA.TT,..,       ,$%'&,7*<..1'%GI&
    chr22   16052239        a       G       39      39      60      4       G$gg^~g )I+&
    chr22   16052513        g       S       36      60      60      7       cc.,c,C I;BII.0
    chr22   16052531        c       M       34      69      60      6       a.a..A  I-IIDI


head 9/chr22/hit.snp

    chr22   16050612        c       G       8       21      60      4       .Ggt    @I,$
    chr22   16050678        c       Y       30      30      60      4       T,t.    >III
    chr22   16051107        c       M       1       37      60      4       Aa.A    I*II
    chr22   16051209        a       G       25      36      60      4       g.GG    ,.-I
    chr22   16051241        c       T       5       42      60      7       T.TTt.T 3++C)CI
    chr22   16051255        c       T       30      39      60      5       TTt.T   ):9+I
    chr22   16051882        C       T       36      36      60      3       Ttt     (<.
    chr22   16051966        c       S       69      69      60      14      G.GGG...GG..G^~&%66,?IFII+II*
    chr22   16051998        c       Y       2       74      60      19      T$,TTTTTtTTT,TTtT.T.    0(6*&/IH+0A*//+EI<C
    chr22   16052120        t       A       14      21      60      6       ag,ggg  I-&&%%




SECOND ROUND (2-16)
------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie


screen -S loop-bowtie


/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 17-33 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--loop parallel \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/bowtie-200bp-chr22-%REPLICATE%.out 

    Run time: 02:44:55
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:25AM, 5 November 2010
    ****************************************




PROBLEM:


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/hit.snp

    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:10 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:19 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:19 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 10:51 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:19 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:15 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:00 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp


ERROR IN STDOUT:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/bamToSnp-chr22.sh: line 22: /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl: No such file or directory

DIAGNOSIS:

samtools.pl IS NOW LOCATED IN THE samtools/misc FOLDER

SOLUTION:

1. CHANGED TO $samtools/misc/samtools.pl IN Cluster.pm.

2. RAN samToSnp.pl


mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/samToSnp
screen -S bowtie-samtosnp

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 17-33 \
--loop distributed \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/samToSnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToSnp.pl \
--reference chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--species human \
--samfile hit.sam \
--label samToSnp \
--keep \
--queue large \
--cluster LSF \
--cpus 1 \
--maxjobs 1000 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/samToSnp/samToSnp.stdout

    OK!

OUTPUT FILES:
    
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 12:27 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 12:28 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp


NB: ALSO COPIED OVER FROM 0.1.6 AND WORKED FINE:

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.bam | tee /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.filter

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.filter
    -rw-rw-rw- 1 syoung root 8.7M Nov  5 12:10 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.filter














NOTES
-----

TEST SINGLE RUN
---------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1 \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-1 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000



TEST OF -rf, -fr AND -ff PARAMS
---------------------------------
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params

ll */out.sam

    -rw-rw-r-- 1 syoung root 251M Nov  4 13:13 ff/out.sam
    -rw-rw-r-- 1 syoung root 250M Nov  4 12:34 fr/out.sam
    -rw-rw-r-- 1 syoung root  91M Nov  4 12:29 rf/out.sam

ll */hit.sam
    
    -rw-rw-r-- 1 syoung root 3.8M Nov  4 13:19 ff/hit.sam
    -rw-rw-r-- 1 syoung root 1.2M Nov  4 12:41 fr/hit.sam
    -rw-rw-r-- 1 syoung root 303K Nov  4 12:41 rf/hit.sam

tail */hit.sam


NB: ALTHOUGH THE '-ff' FLAG RETURNS MORE HITS THAN '-fr', THEY ARE OVERWHELMINGLY 'AAAAAAAAAAAAAAAA'

 head */hit.sam
==> ff/hit.sam <==
@SQ     SN:chr22        LN:51304566
@PG     ID:Bowtie       VN:0.12.2       CL:"/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie --sam --threads 1 --ff --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/aligned.txt --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/unaligned.txt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/out.sam"
SRR005718.279:1:1:57:614#0      67      chr22   33583908        255     36M     =       33583911        39      AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:36       NM:i:0
SRR005718.279:1:1:57:614#0      131     chr22   33583911        255     36M     =       33583908        -39     AAAAAAAAAAAAAAAAAAAAAAAAAACAACAAAACA    II,IIIIIIIIIII)I7III8IIIII4I)GIIIA(I    XA:i:1  MD:Z:26A2A4A1 NM:i:3
SRR005718.333:1:1:188:110#0     179     chr22   22566394        255     36M     =       22566503        145     TGGTTTCCAGCTTCATCCATGTCCCTACAAAGGATA    IA7?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:6T27C1   NM:i:2
SRR005718.333:1:1:188:110#0     115     chr22   22566503        255     36M     =       22566394        -145    ACAATGAGAACACATGGACACAGGAAGGGGAACATC    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:2  MD:Z:28A1G5   NM:i:2
SRR005718.373:1:1:21:747#0      67      chr22   45861465        255     36M     =       45861468        39      AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:36       NM:i:0
SRR005718.373:1:1:21:747#0      131     chr22   45861468        255     36M     =       45861465        -39     AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:34C0T0   NM:i:2
SRR005718.568:1:1:366:41#0      67      chr22   49430399        255     36M     =       49430406        43      AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:36       NM:i:0
SRR005718.568:1:1:366:41#0      131     chr22   49430406        255     36M     =       49430399        -43     AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:32C2T0   NM:i:2

==> fr/hit.sam <==
@SQ     SN:chr22        LN:51304566
@PG     ID:Bowtie       VN:0.12.2       CL:"/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie --sam --threads 1 --fr --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/aligned.txt --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/unaligned.txt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/out.sam"
SRR005718.291:1:1:786:596#0     99      chr22   16850116        255     36M     =       16850155        75      GCATGGAATCATCATCAAATGGAATCGAATGGAATC    IIIIIIIIIIIIIIIIII:IIIH@IIIG?III+@<;    XA:i:1  MD:Z:1A33T0   NM:i:2
SRR005718.291:1:1:786:596#0     147     chr22   16850155        255     36M     =       16850116        -75     GAATGCAATCGAATAGAATCATCGAATGGACTCGAA    17D'1(/I00:EIFIIII4II4IIIIIIIIIDIIII    XA:i:1  MD:Z:5G27T2   NM:i:2
SRR005718.333:1:1:188:110#0     99      chr22   17114574        255     36M     =       17114681        143     GATGTTCCCCTTCCTGTGTCCATGTGTTCTCATTGT    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:2  MD:Z:22A1G11  NM:i:2
SRR005718.333:1:1:188:110#0     147     chr22   17114681        255     36M     =       17114574        -143    TGGTTTCCAGCTTCATCCATGTCCCTACAAAGGATA    IA7?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:34C1     NM:i:1
SRR005718.518:1:1:569:673#0     163     chr22   35587840        255     36M     =       35587915        111     GCAATGCTGCGATCTCAGCTCACTGCAACCTCCACC    IIIIIIIIIIIIIIIIIIIIIIIIII:.IIIBI4I?    XA:i:2  MD:Z:6G0C28   NM:i:2
SRR005718.518:1:1:569:673#0     83      chr22   35587915        255     36M     =       35587840        -111    TAGCTGGGATTACAGGCACCCACCATCATGCCTGGC    &AF9:FI;I?=IIIHII=IIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:32C3     NM:i:1
SRR005718.961:1:1:702:350#0     99      chr22   18085747        255     36M     =       18085951        240     GAGTGTCGCTCTGTTGCCCAGGCTCGAGTGCAGTGG    IIIIIIIIIIIIIIIIIIHB?IIIII/I?C0-2/10    XA:i:2  MD:Z:4C19G11  NM:i:2
SRR005718.961:1:1:702:350#0     147     chr22   18085951        255     36M     =       18085747        -240    TTTTGACTGCCTGCCTCGGCCTCCCAAAGTGCTGGG    .:-%*4C.1;I24I3=I:IIIIAIIIIIIIIIIIII    XA:i:0  MD:Z:0A0G1G0A0T30     NM:i:5

==> rf/hit.sam <==
@SQ     SN:chr22        LN:51304566
@PG     ID:Bowtie       VN:0.12.2       CL:"/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie --sam --threads 1 --rf --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/aligned.txt --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/unaligned.txt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/out.sam"
SRR005718.291:1:1:786:596#0     147     chr22   16862343        255     36M     =       16862425        118     GAATGCAATCGAATAGAATCATCGAATGGACTCGAA    17D'1(/I00:EIFIIII4II4IIIIIIIIIDIIII    XA:i:0  MD:Z:5G30     NM:i:1
SRR005718.291:1:1:786:596#0     99      chr22   16862425        255     36M     =       16862343        -118    GCATGGAATCATCATCAAATGGAATCGAATGGAATC    IIIIIIIIIIIIIIIIII:IIIH@IIIG?III+@<;    XA:i:1  MD:Z:1A26G7   NM:i:2
SRR005718.1074:1:1:743:283#0    147     chr22   16859569        255     36M     =       16859621        88      GTCGAATGGAATCATCATCGAATGGAGTCGAATGGA    *253IIC9:II5II;II:IIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:0A4C20A9 NM:i:3
SRR005718.1074:1:1:743:283#0    99      chr22   16859621        255     36M     =       16859569        -88     GAATGGAATCATCAAATGGAATCTAATGGAATCATC    IIIIIIIIIDIIIIICIII;HIIII:III8II67I:    XA:i:1  MD:Z:23G6G5   NM:i:2
SRR005718.1657:1:1:540:700#0    147     chr22   25187051        255     36M     =       25187200        185     GCCTGTAATCCCAGCTACTCAGGAGGCTGAGGCGGG    0,474:72,GIIIIIDDI.IIIEIIII@IIIIIIII    XA:i:1  MD:Z:0A6G25A2 NM:i:3
SRR005718.1657:1:1:540:700#0    99      chr22   25187200        255     36M     =       25187051        -185    GTGGCACGAGCCTGTAATCCCAGCTACTCAGGAGGC    IIII/IIIIIIIII?9@I5=6:CI<0AA9338+54)    XA:i:1  MD:Z:8T26T0   NM:i:2
SRR005718.2570:1:1:169:57#0     83      chr22   17075495        255     36M     =       17075497        38      TTCAAGCAATTATCCTGCCTCAGCCTCCTGAGTAGC    H'4IA0IIIIIIAIII<IIIIIIIIIIIIIIIIIII    XA:i:2  MD:Z:11C2T21  NM:i:2
SRR005718.2570:1:1:169:57#0     163     chr22   17075497        255     36M     =       17075495        -38     CAAGCAATTCTCTTGCCCCAGCCTCCTGAGTAGCTG    IIIIIIIIIIIIIIIIIIIIIIIIIIII-I>IIIII    XA:i:1  MD:Z:17T18    NM:i:1






TEST USING -rf, -fr AND -ff ON 3.3 BILLION READS
------------------------------------------------

TESTS
-----
(NB: MUST RUN ON EXECUTION NODES BECAUSE OF MEMORY LIMIT ON USER NODES)

mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params
mkdir rf fr ff 

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params

-rf 
---

rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/bowtie.sh

emacs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/bowtie.sh
#!/bin/sh

#BSUB -J maq-rf
#BSUB -W 24:00
#BSUB -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/bowtie.out
#BSUB -e /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/bowtie.err

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--sam \
--threads 1 \
--rf \
--al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/aligned.txt \
--un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/unaligned.txt \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
-1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt \
-2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/out.sam


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf
bsub -q large bowtie.sh 

    Job <2225059> is submitted to queue <large>.
    Thu Nov  4 12:36:59 EDT 2010




-fr 
---

rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.sh

emacs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.sh
#!/bin/sh

#BSUB -J maq-fr
#BSUB -W 24:00
#BSUB -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.out
#BSUB -e /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.err

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--sam \
--threads 1 \
--fr \
--al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/aligned.txt \
--un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/unaligned.txt \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
-1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt \
-2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/out.sam \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.out

tail -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.out
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr

bsub -q large bowtie.sh 

    Job <2225078> is submitted to queue <large>.
    Thu Nov  4 12:59:22 EDT 2010



-ff 
---

rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.sh

emacs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.sh
#!/bin/sh

#BSUB -J maq-ff
#BSUB -W 24:00
#BSUB -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.out
#BSUB -e /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.err

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--sam \
--threads 1 \
--ff \
--al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/aligned.txt \
--un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/unaligned.txt \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
-1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt \
-2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/out.sam \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.out



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff
bsub -q large bowtie.sh 

    Job <2225079> is submitted to queue <large>.
    Thu Nov  4 12:59:51 EDT 2010



tail -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.out



</entry>



<entry [Sun Oct 31 01:36:20 EDT 2010] RAN snpVenn.pl ON ELAND CUMULATIVE hit.snp FILES: 1) ALL AGAINST LAST, AND 2) NEIGHBOURS>




1. ALL AGAINST LAST

mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/snpvenn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/elan d/cumulative-5/snpvenn

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/snpvenn \
--querylabel eland \
--targetlabel bowtie








</entry>



<entry [Sun Oct 31 01:35:20 EDT 2010] RERUN NOVOALIGN WITH '-r All 1' SETTING TO REPORT ONLY SINGLE BEST HIT>




NB: Li Heng APPROVES OF NOVOALIGN AS 'MOST ACCURATE ALIGNER TO DATE':
http://lh3lh3.users.sourceforge.net/NGSalign.shtml



FIRST ROUND (2-16) (1 ALREADY DONE IN TEST ABOVE)
-------------------------------------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign

screen -S loop1-novo

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/NOVOALIGN.pl \
--replicates 2-16 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
--loop parallel \
--params "-r All 1" \
--distance 200 \
--deviation 50 \
--species human \
--label novoalign-chr22-%REPLICATE% \
--maxjobs 1000 \
--queue large \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/novoalign.out 
    
    Run time: 06:23:35
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:29AM, 5 November 2010
    ****************************************


time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/16/novoalign-chr22-16_1.16.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp\
/chr22/novoalign/1/16/novoalign-chr22-16_2.16.txt  > /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16/chr22/16/out.sam





FIRST ROUND (17-33) (1 ALREADY DONE IN TEST ABOVE)
-------------------------------------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign

screen -S loop2-novo

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/NOVOALIGN.pl \
--replicates 17-33 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
--loop parallel \
--params "-r All 1" \
--distance 200 \
--deviation 50 \
--species human \
--label novoalign-chr22-%REPLICATE% \
--maxjobs 1000 \
--queue large \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/novoalign.out 

    
    Run time: 06:41:40
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:53AM, 5 November 2010
    ****************************************








TEST PARAMETERS
---------------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM -r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/out.sam

