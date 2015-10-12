<entry [Sat Dec  4 10:09:43 EST 2010] RUN indexReads.pl ON ALL SAMPLES>




ELAND2
------

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--replicates 1-33 \
--loop distributed \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.bam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.bam.db \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/dbs \
--label eland-chr22-indexReads \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 


MAQ
---

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--replicates 1-33 \
--loop distributed \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/chr22/hit.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/chr22/hit.db \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/indexes \
--label maq-chr22-indexReads \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 


BOWTIE
------

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--replicates 1-33 \
--loop distributed \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/chr22/hit.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/chr22/hit.db \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/indexes \
--label bowtie-chr22-indexReads \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 


BOWTIE-RF
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--replicates 1-33 \
--loop distributed \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/%REPLICATE%/chr22/hit.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/%REPLICATE%/chr22/hit.db \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/indexes \
--label bowtie-rf-chr22-indexReads \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 



NOVOALIGN
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--replicates 1-33 \
--loop distributed \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/chr22/hit.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/chr22/hit.db \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/indexes \
--label novoalign-chr22-indexReads \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 





</entry>



<entry [Sat Dec  4 10:09:43 EST 2010] RERUN 'cumulative4': SAV.pl ON ALL SAMPLES (tempfile IS NOW A REQUIRED ARGUMENT)>




ELAND
-----

COPY FILES:

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative4/chr22
cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/*snp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative4/chr22

screen -S eland-sav4

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2 \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative4 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative4/snp130-%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24


    RUNNING Sat Dec  4 11:33:26 EST 2010
    
    SAV.pl    Run time: 13:38:13
    SAV.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl
    SAV.pl    10-12-05 00:50:52
    SAV.pl    ****************************************



MAQ
---

ON u02

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative4/chr22
cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/*snp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative4/chr22

screen -S maq-sav4

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2 \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative4 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative4/snp130-%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24

    RUNNING Sat Dec  4 11:33:26 EST 2010
    
    Run time: 21:59:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    9:27AM, 5 December 2010
    ****************************************


BUT MISSING FILES 29 TO 33, AS cumulativeSnp.pl WAS NOT COMPLETE, SO RERAN FOR THESE FILES AFTER RUNNING cumulativeSnp.pl FOR FILES 19 TO 33:


CUMULATIVE 4

screen -S maq-sav4-19-33

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2 \
--replicates 29-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative4 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative4/snp130-%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative4/sav.29-33.out


    RUNNING     Sun Dec  5 16:44:27 EST 2010



CUMULATIVE 3

ON u01

screen -S maq-sav3-19-33

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2 \
--replicates 29-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/snp130-%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \cd 
--queue small \
--cluster LSF \
--walltime 24 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/sav.29-33.out


    RUNNING     Sun Dec  5 16:44:27 EST 2010
    COMPLETED   mon Dec  6 08:04:27 EST 2010




BOWTIE
------

ON u03

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative4/chr22
cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/*snp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative4/chr22

screen -S bowtie-sav4

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2 \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative4 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative4/snp130-%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24

    RUNNING Sat Dec  4 11:33:26 EST 2010

    
    Run time: 24:01:17
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:30AM, 5 December 2010
    ****************************************

OUTPUT FILES:
    
    ...
    -rw-rw-rw- 1 syoung root  2.5M Dec  5 11:30 hit.binlevel2.num13-26.sav
    -rw-rw-rw- 1 syoung root  2.7M Dec  5 11:30 hit.binlevel2.num11-31.sav
    -rw-rw-rw- 1 syoung root  2.6M Dec  5 11:30 hit.binlevel2.num12-30.sav
    -rw-rw-rw- 1 syoung root  3.6M Dec  5 11:30 hit.binlevel2.num14-28.sav
    -rw-rw-rw- 1 syoung root  3.1M Dec  5 11:30 hit.binlevel2.num14-32.sav
    -rw-rw-rw- 1 syoung root  3.7M Dec  5 11:30 hit.binlevel2.num14-33.sav



BOWTIE-RF
---------

ON u03

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative4/chr22
cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/*snp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative4/chr22

screen -S bowtie-rf-sav4

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2 \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative4 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative4/snp130-%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24


    RUNNING Sat Dec  4 11:33:26 EST 2010

    Run time: 24:25:17
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:54AM, 5 December 2010
    ****************************************
    
    ...
    -rw-rw-rw- 1 syoung root  2.6M Dec  5 11:31 hit.binlevel2.num12-33.sav
    -rw-rw-rw- 1 syoung root  3.1M Dec  5 11:32 hit.binlevel2.num13-30.sav
    -rw-rw-rw- 1 syoung root  3.0M Dec  5 11:32 hit.binlevel2.num13-31.sav
    -rw-rw-rw- 1 syoung root  2.7M Dec  5 11:40 hit.binlevel2.num13-32.sav
    -rw-rw-rw- 1 syoung root  2.4M Dec  5 11:53 hit.binlevel2.num14-29.sav
    -rw-rw-rw- 1 syoung root  2.7M Dec  5 11:54 hit.binlevel2.num14-31.sav


BUT DID NOT APPEAR COMPLETED WHEN CHECKED screen - WAS STILL RUNNING JOBS AT 5PM, FIVE HOURS AFTER IT ACTUALLY ENDED!!!




NOVOALIGN
---------

ON u04

screen -S novoalign-sav4

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative4/chr22
cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/*snp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative4/chr22


screen -S novoalign-sav4

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2 \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative4 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative4/snp130-%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24
    
    SAV.pl    Run time: 19:34:28
    SAV.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl
    SAV.pl    10-12-05 07:04:35
    SAV.pl    ****************************************

OUTPUT FILES:
    
    ...
    -rw-rw-rw- 1 syoung root 2064164 Dec  5 11:22 hit.binlevel2.num13-18.sav
    -rw-rw-rw- 1 syoung root 1996855 Dec  5 11:22 hit.binlevel2.num14-17.sav
    -rw-rw-rw- 1 syoung root 2064414 Dec  5 11:22 hit.binlevel2.num13-22.sav
    -rw-rw-rw- 1 syoung root 2163616 Dec  5 11:22 hit.binlevel2.num11-26.sav
    -rw-rw-rw- 1 syoung root 2138366 Dec  5 11:22 hit.binlevel2.num11-23.sav



</entry>



<entry [Sat Dec  4 03:11:10 EST 2010] RUN collateVenns.pl *sav ON ALL SAMPLES>




ELAND v MAQ
-----------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq/eland-vs-maq.tsv \
--querylabel eland-%REPLICATE% \
--targetlabel maq-%REPLICATE% \
--suffix sav \
--replicates 1-33
    
    collateVenn.pl    Run time: 00:00:14
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq/eland-vs-maq.tsv --querylabel eland-%REPLICATE% --targetlabel maq-%REPLICATE% --suffix sav --replicates 1-33
    collateVenn.pl    3:12AM, 7 December 2010
    collateVenn.pl    ****************************************


    
cat /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq/eland-vs-maq.tsv

    eland-1 maq-1   19336   3       9329    19339   9332
    eland-2 maq-2   26643   5       1928    26648   1933
    eland-3 maq-3   20036   14      17528   20050   17542
    eland-4 maq-4   12566   10      19690   12576   19700
    eland-5 maq-5   7548    6       21444   7554    21450
    eland-6 maq-6   4622    1       22653   4623    22654
    eland-7 maq-7   3115    1       23741   3116    23742
    eland-8 maq-8   2316    0       24437   2316    24437
    eland-9 maq-9   1962    0       24904   1962    24904
    eland-10        maq-10  1711    0       25021   1711    25021
    eland-11        maq-11  1611    0       25186   1611    25186
    eland-12        maq-12  1531    1       25431   1532    25432
    eland-13        maq-13  1549    2       25255   1551    25257
    eland-14        maq-14  1544    0       25011   1544    25011
    eland-15        maq-15  1570    0       24833   1570    24833
    eland-16        maq-16  1593    0       24624   1593    24624
    eland-17        maq-17  1514    0       24411   1514    24411
    eland-18        maq-18  1644    0       24200   1644    24200
    eland-19        maq-19  1640    1       24098   1641    24099
    eland-20        maq-20  1674    0       23850   1674    23850
    eland-21        maq-21  1770    0       23557   1770    23557
    eland-22        maq-22  1664    0       23330   1664    23330
    eland-23        maq-23  1779    0       23189   1779    23189
    eland-24        maq-24  1805    0       22957   1805    22957
    eland-25        maq-25  1942    2       22609   1944    22611
    eland-26        maq-26  1912    0       22398   1912    22398
    eland-27        maq-27  1897    0       22207   1897    22207
    eland-28        maq-28  2036    1       21990   2037    21991
    eland-29        maq-29  1924    0       21808   1924    21808
    eland-30        maq-30  1916    0       21610   1916    21610
    eland-31        maq-31  1868    0       21543   1868    21543
    eland-32        maq-32  1856    0       21346   1856    21346
    eland-33        maq-33  1898    1       21288   1899    21289




ELAND v BOWTIE
--------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie/eland-vs-bowtie.tsv \
--querylabel eland-%REPLICATE% \
--targetlabel bowtie-%REPLICATE% \
--suffix sav \
--replicates 1-33

    collateVenn.pl    Run time: 00:00:40
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie/eland-vs-bowtie.tsv --querylabel eland-%REPLICATE% --targetlabel bowtie-%REPLICATE% --suffix sav --replicates 1-33
    collateVenn.pl    2:57AM, 7 December 2010
    collateVenn.pl    ****************************************


cat /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie/eland-vs-bowtie.tsv

    eland-1 bowtie-1        72317   3731    5601    76048   9332
    eland-2 bowtie-2        98997   1566    366     100563  1932
    eland-3 bowtie-3        99612   7203    10339   106815  17542
    eland-4 bowtie-4        81104   7283    12417   88387   19700
    eland-5 bowtie-5        75660   7700    13750   83360   21450
    eland-6 bowtie-6        111775  10637   12017   122412  22654
    eland-7 bowtie-7        88364   9778    13964   98142   23742
    eland-8 bowtie-8        66151   8656    15781   74807   24437
    eland-9 bowtie-9        50761   7622    17282   58383   24904
    eland-10        bowtie-10       87751   11524   13497   99275   25021
    eland-11        bowtie-11       65919   9222    15964   75141   25186
    eland-12        bowtie-12       71842   11103   14329   82945   25432
    eland-13        bowtie-13       63120   13014   12243   76134   25257
    eland-14        bowtie-14       104035  15005   10006   119040  25011
    eland-15        bowtie-15       70349   12565   12268   82914   24833
    eland-16        bowtie-16       84423   13186   11438   97609   24624
    eland-17        bowtie-17       45857   8296    16114   54153   24410
    eland-18        bowtie-18       44149   8148    16052   52297   24200
    eland-19        bowtie-19       39935   7622    16477   47557   24099
    eland-20        bowtie-20       46284   9674    14176   55958   23850
    eland-21        bowtie-21       69631   11964   11593   81595   23557
    eland-22        bowtie-22       48542   8697    14633   57239   23330
    eland-23        bowtie-23       42317   8946    14243   51263   23189
    eland-24        bowtie-24       51610   10344   12613   61954   22957
    eland-25        bowtie-25       48013   9714    12897   57727   22611
    eland-26        bowtie-26       85516   16943   5455    102459  22398
    eland-27        bowtie-27       75465   14938   7269    90403   22207
    eland-28        bowtie-28       59511   12730   9261    72241   21991
    eland-29        bowtie-29       57170   12073   9735    69243   21808
    eland-30        bowtie-30       54242   12496   9114    66738   21610
    eland-31        bowtie-31       66506   8644    7636    75150   16280
    eland-32        bowtie-32       58523   14782   6563    73305   21345
    eland-33        bowtie-33       75606   10822   3538    86428   14360


ELAND v BOWTIE-RF
-----------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie-rf/eland-vs-bowtie-rf.tsv \
--querylabel eland-%REPLICATE% \
--targetlabel bowtie-rf-%REPLICATE% \
--suffix sav \
--replicates 1-33
    
    collateVenn.pl    Run time: 00:00:35
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie-rf/eland-vs-bowtie-rf.tsv --querylabel eland-%REPLICATE% --targetlabel bowtie-rf-%REPLICATE% --suffix sav --replicates 1-33
    collateVenn.pl    3:00AM, 7 December 2010
    collateVenn.pl    ****************************************

cat /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie-rf/eland-vs-bowtie-rf.tsv

    eland-1 bowtie-rf-1     52566   3034    6298    55600   9332
    eland-2 bowtie-rf-2     49589   1566    367     51155   1933
    eland-3 bowtie-rf-3     60635   5527    12015   66162   17542
    eland-4 bowtie-rf-4     60838   6180    13520   67018   19700
    eland-5 bowtie-rf-5     62036   6787    14663   68823   21450
    eland-6 bowtie-rf-6     62073   7272    15382   69345   22654
    eland-7 bowtie-rf-7     72073   8777    14965   80850   23742
    eland-8 bowtie-rf-8     76775   9453    14984   86228   24437
    eland-9 bowtie-rf-9     70834   9613    15291   80447   24904
    eland-10        bowtie-rf-10    54705   8151    16870   62856   25021
    eland-11        bowtie-rf-11    77576   10080   15106   87656   25186
    eland-12        bowtie-rf-12    51197   8157    17275   59354   25432
    eland-13        bowtie-rf-13    64690   10126   15131   74816   25257
    eland-14        bowtie-rf-14    67133   10643   14368   77776   25011
    eland-15        bowtie-rf-15    56092   9411    15422   65503   24833
    eland-16        bowtie-rf-16    72762   11639   12985   84401   24624
    eland-17        bowtie-rf-17    77728   12497   11914   90225   24411
    eland-18        bowtie-rf-18    54807   10027   14173   64834   24200
    eland-19        bowtie-rf-19    62333   11408   12691   73741   24099
    eland-20        bowtie-rf-20    57764   10744   13106   68508   23850
    eland-21        bowtie-rf-21    61957   11658   11899   73615   23557
    eland-22        bowtie-rf-22    52595   10568   12762   63163   23330
    eland-23        bowtie-rf-23    61932   12737   10452   74669   23189
    eland-24        bowtie-rf-24    72347   14403   8554    86750   22957
    eland-25        bowtie-rf-25    65884   13253   9358    79137   22611
    eland-26        bowtie-rf-26    66037   13453   8945    79490   22398
    eland-27        bowtie-rf-27    74422   14932   7275    89354   22207
    eland-28        bowtie-rf-28    62341   14206   7785    76547   21991
    eland-29        bowtie-rf-29    56600   12862   8946    69462   21808
    eland-30        bowtie-rf-30    60418   14430   7180    74848   21610
    eland-31        bowtie-rf-31    67218   15451   6092    82669   21543
    eland-32        bowtie-rf-32    66380   15611   5735    81991   21346
    eland-33        bowtie-rf-33    55082   12579   8710    67661   21289



ELAND v NOVOALIGN
-----------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-novoalign/eland-vs-novoalign.tsv \
--querylabel eland-%REPLICATE% \
--targetlabel novoalign-%REPLICATE% \
--suffix sav \
--replicates 1-33

    collateVenn.pl    Run time: 00:01:20
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-novoalign/eland-vs-novoalign.tsv --querylabel eland-%REPLICATE% --targetlabel novoalign-%REPLICATE% --suffix sav --replicates 1-33
    collateVenn.pl    3:01AM, 7 December 2010
    collateVenn.pl    ****************************************


cat /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-novoalign/eland-vs-novoalign.tsv

    eland-1 novoalign-1     18916   3931    5401    22847   9332
    eland-2 novoalign-2     32822   1200    733     34022   1933
    eland-3 novoalign-3     33303   8050    9492    41353   17542
    eland-4 novoalign-4     38157   9001    10699   47158   19700
    eland-5 novoalign-5     42249   9800    11650   52049   21450
    eland-6 novoalign-6     40599   9353    13301   49952   22654
    eland-7 novoalign-7     48485   11091   12651   59576   23742
    eland-8 novoalign-8     51167   11596   12841   62763   24437
    eland-9 novoalign-9     47680   10766   14138   58446   24904
    eland-10        novoalign-10    49352   11087   13934   60439   25021
    eland-11        novoalign-11    55584   12260   12926   67844   25186
    eland-12        novoalign-12    50823   11340   14092   62163   25432
    eland-13        novoalign-13    51773   11541   13716   63314   25257
    eland-14        novoalign-14    58852   12944   12067   71796   25011
    eland-15        novoalign-15    60039   13198   11635   73237   24833
    eland-16        novoalign-16    55792   12223   12401   68015   24624
    eland-17        novoalign-17    49349   10712   13699   60061   24411
    eland-18        novoalign-18    54885   12207   11993   67092   24200
    eland-19        novoalign-19    47567   10408   13691   57975   24099
    eland-20        novoalign-20    67999   15331   8519    83330   23850
    eland-21        novoalign-21    68101   15414   8143    83515   23557
    eland-22        novoalign-22    61175   13643   9687    74818   23330
    eland-23        novoalign-23    58703   13088   10101   71791   23189
    eland-24        novoalign-24    59987   13023   9934    73010   22957
    eland-25        novoalign-25    55846   12287   10324   68133   22611
    eland-26        novoalign-26    63722   14516   7882    78238   22398
    eland-27        novoalign-27    59358   13514   8693    72872   22207
    eland-28        novoalign-28    60638   14031   7960    74669   21991
    eland-29        novoalign-29    71921   15998   5810    87919   21808
    eland-30        novoalign-30    67150   14609   7001    81759   21610
    eland-31        novoalign-31    67119   14641   6902    81760   21543
    eland-32        novoalign-32    57310   12519   8827    69829   21346
    eland-33        novoalign-33    60634   13902   7387    74536   21289




BOWTIE v NOVOALIGN
------------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/bowtie-novoalign/bowtie-vs-novoalign.tsv \
--querylabel bowtie-%REPLICATE% \
--targetlabel novoalign-%REPLICATE% \
--suffix sav \
--replicates 1-33



cat /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/bowtie-novoalign/bowtie-vs-novoalign.tsv
    
    bowtie-1        novoalign-1     15382   7465    68583   22847   76048
    bowtie-2        novoalign-2     22802   11122   89303   33924   100425
    bowtie-3        novoalign-3     28678   13237   93854   41915   107091
    bowtie-4        novoalign-4     34811   12347   76040   47158   88387
    bowtie-5        novoalign-5     39293   13903   70041   53196   83944
    bowtie-6        novoalign-6     33445   17584   105373  51029   122957
    bowtie-7        novoalign-7     44133   15443   82699   59576   98142
    bowtie-8        novoalign-8     48779   13984   60823   62763   74807
    bowtie-9        novoalign-9     45608   12838   45545   58446   58383
    bowtie-10       novoalign-10    42417   18041   81238   60458   99279
    bowtie-11       novoalign-11    52650   15927   59569   68577   75496
    bowtie-12       novoalign-12    45448   16542   66223   61990   82765
    bowtie-13       novoalign-13    43901   19898   84787   63799   104685
    bowtie-14       novoalign-14    50478   21791   97489   72269   119280
    bowtie-15       novoalign-15    53326   19911   75284   73237   95195
    bowtie-16       novoalign-16    47926   20062   77511   67988   97573
    bowtie-17       novoalign-17    46170   13891   40262   60061   54153
    bowtie-18       novoalign-18    53592   13500   38797   67092   52297
    bowtie-19       novoalign-19    45382   12553   34927   57935   47480
    bowtie-20       novoalign-20    66971   16320   39561   83291   55881
    bowtie-21       novoalign-21    62962   20553   61042   83515   81595
    bowtie-22       novoalign-22    59296   15522   41717   74818   57239
    bowtie-23       novoalign-23    55557   16234   35029   71791   51263
    bowtie-24       novoalign-24    54286   18724   43230   73010   61954
    bowtie-25       novoalign-25    52327   15806   41921   68133   57727
    bowtie-26       novoalign-26    50600   27638   74821   78238   102459
    bowtie-27       novoalign-27    49533   23339   67064   72872   90403
    bowtie-28       novoalign-28    51018   23651   48590   74669   72241
    bowtie-29       novoalign-29    65115   22804   46439   87919   69243
    bowtie-30       novoalign-30    58895   22864   43874   81759   66738
    bowtie-31       novoalign-31    57631   24107   42399   81738   66506
    bowtie-32       novoalign-32    45610   24219   49086   69829   73305
    bowtie-33       novoalign-33    46985   27551   59255   74536   86806



ELAND 
-----

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/eland-33-vs-eland-1-33.tsv \
--querylabel eland-33 \
--targetlabel eland-%REPLICATE% \
--replicates 1-33 \
--suffix sav

    (RERAN BECAUSE MISSING FILES 17 TO 24)
    
    collateVenn.pl    Run time: 00:00:10
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/eland-33-vs-eland-1-33.tsv --querylabel eland-33 --targetlabel eland-%REPLICATE% --replicates 1-33 --suffix sav
    collateVenn.pl    8:02AM, 7 December 2010
    collateVenn.pl    ****************************************
    



MAQ
---

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-%REPLICATE%.sav \
--replicates 1-33




BOWTIE
------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/bowtie-33-vs-bowtie-1-33.tsv \
--querylabel bowtie-33 \
--targetlabel bowtie-%REPLICATE% \
--replicates 1-33 \
--suffix sav \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/bowtie-collatevenn.out
    
    collateVenn.pl    Run time: 00:00:25
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/bowtie-33-vs-bowtie-1-33.tsv --querylabel bowtie-33 --targetlabel bowtie-%REPLICATE% --replicates 1-33 --suffix sav
    collateVenn.pl    0:25AM, 8 December 2010
    collateVenn.pl    ****************************************


BOWTIE-RF
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn/bowtie-rf-33-vs-bowtie-rf-1-33.tsv \
--querylabel bowtie-rf-33 \
--targetlabel bowtie-rf-%REPLICATE% \
--replicates 1-33 \
--suffix sav \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn/bowtie-rf-collatevenn.out

    collateVenn.pl    Run time: 00:00:13
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn/bowtie-rf-33-vs-bowtie-rf-1-33.tsv --querylabel bowtie-rf-33 --targetlabel bowtie-rf-%REPLICATE% --replicates 1-33 --suffix sav
    collateVenn.pl    8:44PM, 9 December 2010
    collateVenn.pl    ****************************************



NOVOALIGN
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/novoalign-33-vs-novoalign-1-33.tsv \
--querylabel novoalign-33 \
--targetlabel novoalign-%REPLICATE% \
--replicates 1-33 \
--suffix sav \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/novoalign-collatevenn.out


    collateVenn.pl    Run time: 00:00:14
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/novoalign-33-vs-novoalign-1-33.tsv --querylabel novoalign-33 --targetlabel novoalign-%REPLICATE% --replicates 1-33 --suffix sav
    collateVenn.pl    9:12AM, 10 December 2010
    collateVenn.pl    ****************************************




</entry>



<entry [Sat Dec  4 03:11:10 EST 2010] RUN snpVenn.pl *sav ON ALL SAMPLES>




ELAND vs MAQ
------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq

screen -S elandmaq-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq \
--replicates 1-33 \
--loop distributed \
--label elandmaq-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-%REPLICATE%.sav \
--querylabel eland-%REPLICATE% \
--targetlabel maq-%REPLICATE% \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq/elandmaq-snpvenn.out
    

    RUNNING Mon Dec  6 13:24:57 EST 2010
    Run time: 01:00:36
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:25PM, 6 December 2010
    ****************************************


SURPRISINGLY LOW CONCORDANCE BETWEEN ELAND AND MAQ SNPS PARTLY DUE TO THE FACT THAT THE MAQ *snp FILES ARE MAINLY INDELS!!!! 



ELAND vs BOWTIE
---------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie

screen -S elandbowtie-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie \
--replicates 1-33 \
--loop distributed \
--label elandbowtie-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%.sav \
--querylabel eland-%REPLICATE% \
--targetlabel bowtie-%REPLICATE% \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie/elandbowtie-snpvenn.out

    Run time: 02:55:49
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:41AM, 7 December 2010
    ****************************************

    OK

PREVIOUS RUN: REPEATED ERROR IN STDOUT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie
em elandbowtie-vennsnp-1-stdout.txt

    Snp.pm line 273, <QUERY> line 1476.
    Use of uninitialized value in string eq at /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/../../../lib/Venn/Snp.pm line 275, <QUERY> line 1476.


GET COMMAND:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie
cat elandbowtie-vennsnp-1.sh




/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-2.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-2.sav \
--querylabel eland-2 \
--targetlabel bowtie-2 \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie


100
200
300
400
500
600
700
800
900
1000
1100
1200
1300
1400
queryposition not defined for line:     T$T$TttTTT,Ttt  %++%+!++++!!            0.786   CCDS13742.1302      exon    1       -       ATT     AAT     I       N       missense


CHECK FOR ENTRY IN QUERY FILE:

emacs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-2.sav

FOUND BAD ENTRY AT LINE 1476:

    chr22	16697693	t	C	40	40	46	20	Cc.cCc,ccc.CC,c,,,,,	!+++!''+++"++!+!!#!!		0.550	CCDS13742.1	1791	intron	3	-					
    
    chr22	16697737	c	T	28	28	27	14	ttttttt..TT.,t	++&+!"!"++++!!		0.714	CCDS13742.1	1791	intron	3	-					
    
        T$T$TttTTT,Ttt	%++%+!++++!!		0.786	CCDS13742.1	302	exon	1	-	ATT	AAT	I	N	missense
    
    chr22	16668836	C	T	33	33	38	11	,.t.tTtTttT	+!+!&+!+"!+		0.727	CCDS13742.1	302	exon	1	-	ATT	AAT	I	N	missense
    
    chr22	16668894	C	T	30	30	40	14	.$T.tt..TTTTa.,	!!!++!&!+++!+!		0.467	CCDS13742.1	302	exon	1	-	ATT	AAT	I	N	missense


TRACED BAD LINE BACK TO BIN SAV:

hit.binlevel2.num10-2.sav:1476: T$T$TttTTT,Ttt  %++%+!++++!!            0.786   CCDS13742.1     302     exon    1       -       ATT     AAT     I       N       missense



CHECK IF BAD LINE WITH $T$TttTTT,Ttt FOUND IN BIN SNP:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22
emacs hit.binlevel2.num10-2.snp


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22
emacs hit.binlevel2.num10-2.snp


THE SNP FILE ENDS AT LINE 1476, BEFORE THE BAD LINE

T$T$TttTTT,Ttt



DIAGNOSIS:

THE hit.*snp FILE HAS BEEN WRITTEN TO BY TWO INSTANCES OF AT THE SAME TIME, WHICH MESSES UP THE FORMAT OF THE LINES CONTAINED IN IT AND WILL CAUSE snpVenn.pl CRASH.




SOLUTION:

1. RECREATE THE bowtie SNP FILES WITH unbinSnp.pl AND RERUN SAV.pl ON FILE 2 AND POSSIBLE OTHERS (DO 1-33 TO BE SURE)

2. IGNORE FOR NOW AND RERUN LATER






ELAND vs BOWTIE-RF
------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie-rf

screen -S elandbowtie-rf-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie-rf \
--replicates 1-33 \
--loop distributed \
--label elandbowtie-rf-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-%REPLICATE%.sav \
--querylabel eland-%REPLICATE% \
--targetlabel bowtie-rf-%REPLICATE% \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie-rf \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie-rf/elandbowtie-rf-snpvenn.out

    
    Run time: 01:59:11
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:53AM, 7 December 2010
    ****************************************

OUTPUT FILES:

-rw-rw-rw- 1 syoung root 8.4M Dec  7 01:19 bowtie-rf-10-NOT-eland-10.sav
-rw-rw-rw- 1 syoung root  12M Dec  7 01:52 bowtie-rf-11-NOT-eland-11.sav
-rw-rw-rw- 1 syoung root 8.1M Dec  7 01:13 bowtie-rf-12-NOT-eland-12.sav
-rw-rw-rw- 1 syoung root 9.2M Dec  7 01:36 bowtie-rf-13-NOT-eland-13.sav
-rw-rw-rw- 1 syoung root 9.8M Dec  7 01:34 bowtie-rf-14-NOT-eland-14.sav
-rw-rw-rw- 1 syoung root 7.3M Dec  7 01:22 bowtie-rf-15-NOT-eland-15.sav
-rw-rw-rw- 1 syoung root  12M Dec  7 01:44 bowtie-rf-16-NOT-eland-16.sav
-rw-rw-rw- 1 syoung root  11M Dec  7 01:48 bowtie-rf-17-NOT-eland-17.sav
-rw-rw-rw- 1 syoung root 7.7M Dec  7 01:15 bowtie-rf-18-NOT-eland-18.sav
-rw-rw-rw- 1 syoung root  11M Dec  7 01:26 bowtie-rf-19-NOT-eland-19.sav
-rw-rw-rw- 1 syoung root 5.4M Dec  7 00:22 bowtie-rf-1-NOT-eland-1.sav
-rw-rw-rw- 1 syoung root 9.1M Dec  7 01:20 bowtie-rf-20-NOT-eland-20.sav
-rw-rw-rw- 1 syoung root  11M Dec  7 01:25 bowtie-rf-21-NOT-eland-21.sav
-rw-rw-rw- 1 syoung root 8.6M Dec  7 01:10 bowtie-rf-22-NOT-eland-22.sav
-rw-rw-rw- 1 syoung root 8.5M Dec  7 01:21 bowtie-rf-23-NOT-eland-23.sav
-rw-rw-rw- 1 syoung root  12M Dec  7 01:35 bowtie-rf-24-NOT-eland-24.sav
-rw-rw-rw- 1 syoung root  11M Dec  7 01:24 bowtie-rf-25-NOT-eland-25.sav
-rw-rw-rw- 1 syoung root  11M Dec  7 01:23 bowtie-rf-26-NOT-eland-26.sav
-rw-rw-rw- 1 syoung root  12M Dec  7 01:34 bowtie-rf-27-NOT-eland-27.sav
-rw-rw-rw- 1 syoung root  11M Dec  7 01:19 bowtie-rf-28-NOT-eland-28.sav
-rw-rw-rw- 1 syoung root 9.4M Dec  7 01:12 bowtie-rf-29-NOT-eland-29.sav
-rw-rw-rw- 1 syoung root 5.9M Dec  6 23:58 bowtie-rf-2-NOT-eland-2.sav
-rw-rw-rw- 1 syoung root  11M Dec  7 01:18 bowtie-rf-30-NOT-eland-30.sav
-rw-rw-rw- 1 syoung root  12M Dec  7 01:22 bowtie-rf-31-NOT-eland-31.sav
-rw-rw-rw- 1 syoung root  12M Dec  7 01:21 bowtie-rf-32-NOT-eland-32.sav
-rw-rw-rw- 1 syoung root  10M Dec  7 01:07 bowtie-rf-33-NOT-eland-33.sav
-rw-rw-rw- 1 syoung root 7.6M Dec  7 01:01 bowtie-rf-3-NOT-eland-3.sav
-rw-rw-rw- 1 syoung root 7.9M Dec  7 01:08 bowtie-rf-4-NOT-eland-4.sav
-rw-rw-rw- 1 syoung root 8.1M Dec  7 01:13 bowtie-rf-5-NOT-eland-5.sav
-rw-rw-rw- 1 syoung root 8.7M Dec  7 01:21 bowtie-rf-6-NOT-eland-6.sav
-rw-rw-rw- 1 syoung root  11M Dec  7 01:38 bowtie-rf-7-NOT-eland-7.sav
-rw-rw-rw- 1 syoung root  12M Dec  7 01:46 bowtie-rf-8-NOT-eland-8.sav
-rw-rw-rw- 1 syoung root  11M Dec  7 01:42 bowtie-rf-9-NOT-eland-9.sav
-rw-rw-rw- 1 syoung root 1.2M Dec  7 01:19 eland-10-AND-bowtie-rf-10.sav
-rw-rw-rw- 1 syoung root 2.7M Dec  7 01:19 eland-10-NOT-bowtie-rf-10.sav
-rw-rw-rw- 1 syoung root 1.4M Dec  7 01:52 eland-11-AND-bowtie-rf-11.sav
-rw-rw-rw- 1 syoung root 2.5M Dec  7 01:52 eland-11-NOT-bowtie-rf-11.sav
-rw-rw-rw- 1 syoung root 1.3M Dec  7 01:13 eland-12-AND-bowtie-rf-12.sav
-rw-rw-rw- 1 syoung root 2.6M Dec  7 01:13 eland-12-NOT-bowtie-rf-12.sav
-rw-rw-rw- 1 syoung root 1.4M Dec  7 01:36 eland-13-AND-bowtie-rf-13.sav
-rw-rw-rw- 1 syoung root 2.3M Dec  7 01:36 eland-13-NOT-bowtie-rf-13.sav
-rw-rw-rw- 1 syoung root 1.4M Dec  7 01:34 eland-14-AND-bowtie-rf-14.sav
-rw-rw-rw- 1 syoung root 2.4M Dec  7 01:34 eland-14-NOT-bowtie-rf-14.sav
-rw-rw-rw- 1 syoung root 1.1M Dec  7 01:22 eland-15-AND-bowtie-rf-15.sav
-rw-rw-rw- 1 syoung root 2.5M Dec  7 01:22 eland-15-NOT-bowtie-rf-15.sav
-rw-rw-rw- 1 syoung root 1.7M Dec  7 01:44 eland-16-AND-bowtie-rf-16.sav
-rw-rw-rw- 1 syoung root 2.2M Dec  7 01:44 eland-16-NOT-bowtie-rf-16.sav
-rw-rw-rw- 1 syoung root 1.5M Dec  7 01:48 eland-17-AND-bowtie-rf-17.sav
-rw-rw-rw- 1 syoung root 2.1M Dec  7 01:48 eland-17-NOT-bowtie-rf-17.sav
-rw-rw-rw- 1 syoung root 1.3M Dec  7 01:15 eland-18-AND-bowtie-rf-18.sav
-rw-rw-rw- 1 syoung root 2.4M Dec  7 01:15 eland-18-NOT-bowtie-rf-18.sav
-rw-rw-rw- 1 syoung root 1.7M Dec  7 01:26 eland-19-AND-bowtie-rf-19.sav
-rw-rw-rw- 1 syoung root 2.2M Dec  7 01:26 eland-19-NOT-bowtie-rf-19.sav
-rw-rw-rw- 1 syoung root 285K Dec  7 00:22 eland-1-AND-bowtie-rf-1.sav
-rw-rw-rw- 1 syoung root 693K Dec  7 00:22 eland-1-NOT-bowtie-rf-1.sav
-rw-rw-rw- 1 syoung root 1.6M Dec  7 01:20 eland-20-AND-bowtie-rf-20.sav
-rw-rw-rw- 1 syoung root 2.2M Dec  7 01:20 eland-20-NOT-bowtie-rf-20.sav
-rw-rw-rw- 1 syoung root 1.8M Dec  7 01:25 eland-21-AND-bowtie-rf-21.sav
-rw-rw-rw- 1 syoung root 2.0M Dec  7 01:25 eland-21-NOT-bowtie-rf-21.sav
-rw-rw-rw- 1 syoung root 1.6M Dec  7 01:10 eland-22-AND-bowtie-rf-22.sav
-rw-rw-rw- 1 syoung root 2.2M Dec  7 01:10 eland-22-NOT-bowtie-rf-22.sav
-rw-rw-rw- 1 syoung root 1.6M Dec  7 01:21 eland-23-AND-bowtie-rf-23.sav
-rw-rw-rw- 1 syoung root 1.9M Dec  7 01:21 eland-23-NOT-bowtie-rf-23.sav
-rw-rw-rw- 1 syoung root 2.0M Dec  7 01:35 eland-24-AND-bowtie-rf-24.sav
-rw-rw-rw- 1 syoung root 1.6M Dec  7 01:35 eland-24-NOT-bowtie-rf-24.sav
-rw-rw-rw- 1 syoung root 1.9M Dec  7 01:24 eland-25-AND-bowtie-rf-25.sav
-rw-rw-rw- 1 syoung root 1.7M Dec  7 01:24 eland-25-NOT-bowtie-rf-25.sav
-rw-rw-rw- 1 syoung root 2.0M Dec  7 01:23 eland-26-AND-bowtie-rf-26.sav
-rw-rw-rw- 1 syoung root 1.6M Dec  7 01:23 eland-26-NOT-bowtie-rf-26.sav
-rw-rw-rw- 1 syoung root 2.1M Dec  7 01:34 eland-27-AND-bowtie-rf-27.sav
-rw-rw-rw- 1 syoung root 1.4M Dec  7 01:34 eland-27-NOT-bowtie-rf-27.sav
-rw-rw-rw- 1 syoung root 2.2M Dec  7 01:19 eland-28-AND-bowtie-rf-28.sav
-rw-rw-rw- 1 syoung root 1.5M Dec  7 01:19 eland-28-NOT-bowtie-rf-28.sav
-rw-rw-rw- 1 syoung root 1.9M Dec  7 01:12 eland-29-AND-bowtie-rf-29.sav
-rw-rw-rw- 1 syoung root 1.6M Dec  7 01:12 eland-29-NOT-bowtie-rf-29.sav
-rw-rw-rw- 1 syoung root 173K Dec  6 23:58 eland-2-AND-bowtie-rf-2.sav
-rw-rw-rw- 1 syoung root  40K Dec  6 23:58 eland-2-NOT-bowtie-rf-2.sav
-rw-rw-rw- 1 syoung root 2.3M Dec  7 01:18 eland-30-AND-bowtie-rf-30.sav
-rw-rw-rw- 1 syoung root 1.4M Dec  7 01:18 eland-30-NOT-bowtie-rf-30.sav
-rw-rw-rw- 1 syoung root 2.5M Dec  7 01:22 eland-31-AND-bowtie-rf-31.sav
-rw-rw-rw- 1 syoung root 1.2M Dec  7 01:22 eland-31-NOT-bowtie-rf-31.sav
-rw-rw-rw- 1 syoung root 2.6M Dec  7 01:21 eland-32-AND-bowtie-rf-32.sav
-rw-rw-rw- 1 syoung root 1.1M Dec  7 01:21 eland-32-NOT-bowtie-rf-32.sav
-rw-rw-rw- 1 syoung root 2.1M Dec  7 01:07 eland-33-AND-bowtie-rf-33.sav
-rw-rw-rw- 1 syoung root 1.5M Dec  7 01:07 eland-33-NOT-bowtie-rf-33.sav
-rw-rw-rw- 1 syoung root 713K Dec  7 01:01 eland-3-AND-bowtie-rf-3.sav
-rw-rw-rw- 1 syoung root 1.7M Dec  7 01:01 eland-3-NOT-bowtie-rf-3.sav
-rw-rw-rw- 1 syoung root 833K Dec  7 01:08 eland-4-AND-bowtie-rf-4.sav
-rw-rw-rw- 1 syoung root 2.0M Dec  7 01:08 eland-4-NOT-bowtie-rf-4.sav
-rw-rw-rw- 1 syoung root 890K Dec  7 01:13 eland-5-AND-bowtie-rf-5.sav
-rw-rw-rw- 1 syoung root 2.2M Dec  7 01:13 eland-5-NOT-bowtie-rf-5.sav
-rw-rw-rw- 1 syoung root 1.1M Dec  7 01:21 eland-6-AND-bowtie-rf-6.sav
-rw-rw-rw- 1 syoung root 2.3M Dec  7 01:21 eland-6-NOT-bowtie-rf-6.sav
-rw-rw-rw- 1 syoung root 1.3M Dec  7 01:38 eland-7-AND-bowtie-rf-7.sav
-rw-rw-rw- 1 syoung root 2.3M Dec  7 01:38 eland-7-NOT-bowtie-rf-7.sav
-rw-rw-rw- 1 syoung root 1.4M Dec  7 01:46 eland-8-AND-bowtie-rf-8.sav
-rw-rw-rw- 1 syoung root 2.4M Dec  7 01:46 eland-8-NOT-bowtie-rf-8.sav
-rw-rw-rw- 1 syoung root 1.4M Dec  7 01:42 eland-9-AND-bowtie-rf-9.sav
-rw-rw-rw- 1 syoung root 2.4M Dec  7 01:42 eland-9-NOT-bowtie-rf-9.sav


ELAND v NOVOALIGN
-----------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-novoalign

screen -S elandnovo-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-novoalign \
--replicates 1-33 \
--loop distributed \
--label elandnovoalign-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%.sav \
--querylabel eland-%REPLICATE% \
--targetlabel novoalign-%REPLICATE% \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-novoalign \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-novoalign/elandnovoalign-snpvenn.out

    
    Run time: 01:45:25
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:40AM, 7 December 2010
    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-novoalign

    eland-10-AND-novoalign-10.sav: 11087
    eland-10-NOT-novoalign-10.sav: 13934
    eland-11-AND-novoalign-11.sav: 12260
    eland-11-NOT-novoalign-11.sav: 12926
    eland-12-AND-novoalign-12.sav: 11340
    eland-12-NOT-novoalign-12.sav: 14092
    eland-13-AND-novoalign-13.sav: 11541
    eland-13-NOT-novoalign-13.sav: 13716
    eland-14-AND-novoalign-14.sav: 12944
    eland-14-NOT-novoalign-14.sav: 12067
    eland-15-AND-novoalign-15.sav: 13198
    eland-15-NOT-novoalign-15.sav: 11635
    eland-16-AND-novoalign-16.sav: 12223
    eland-16-NOT-novoalign-16.sav: 12401
    eland-17-AND-novoalign-17.sav: 10712
    eland-17-NOT-novoalign-17.sav: 13699
    eland-18-AND-novoalign-18.sav: 12207
    eland-18-NOT-novoalign-18.sav: 11993
    eland-19-AND-novoalign-19.sav: 10408
    eland-19-NOT-novoalign-19.sav: 13691
    eland-1-AND-novoalign-1.sav: 3931




BOWTIE v NOVOALIGN
------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/bowtie-novoalign

screen -S bowtienovo-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/bowtie-novoalign \
--replicates 1-33 \
--loop distributed \
--label bowtienovoalign-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%.sav \
--querylabel bowtie-%REPLICATE% \
--targetlabel novoalign-%REPLICATE% \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/bowtie-novoalign \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/bowtie-novoalign/bowtienovoalign-snpvenn.out

    Run time: 10:26:55
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    9:21PM, 7 December 2010
    ****************************************



ELAND 
-----

screen -S eland-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn \
--replicates 1-33 \
--loop distributed \
--label eland-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn \
--querylabel eland-33 \
--targetlabel eland-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/snpvenn-2.out

Run time: 00:25:57
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
11:23AM, 7 December 2010
****************************************   

    
    -rw-rw-rw- 1 syoung root  2.6M Dec  6 13:39 eland-6-NOT-eland-33.sav
    -rw-rw-rw- 1 syoung root  2.7M Dec  6 13:40 eland-7-NOT-eland-33.sav
    -rw-rw-rw- 1 syoung root  2.7M Dec  6 13:40 eland-8-NOT-eland-33.sav
    -rw-rw-rw- 1 syoung root  2.7M Dec  6 13:40 eland-9-NOT-eland-33.sav


RERUN FILES 17 TO 24:

screen -S eland-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn \
--replicates 17-24 \
--loop distributed \
--label eland-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn \
--querylabel eland-33 \
--targetlabel eland-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/snpvenn.17-24.out
    
    Run time: 00:22:03
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    3:27AM, 7 December 2010
    ****************************************


MAQ
---

screen -S maq-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn \
--replicates 1-33 \
--loop distributed \
--label maq-savvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir c \
--querylabel maq-33 \
--targetlabel maq-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/loop-savvenn.out

    RUNNING Mon Dec  6 13:28:49 EST 2010
    Run time: 00:44:13
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:12PM, 6 December 2010
    ****************************************
    

OUTPUT MISSING FILES 2 to 9 and FILES 29 TO 33:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn
ll  *sav

    -rw-rw-rw- 1 syoung root 1.7M Dec  6 13:34 maq-1-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 324K Dec  6 13:28 maq-10-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 333K Dec  6 13:28 maq-11-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 327K Dec  6 13:28 maq-12-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 348K Dec  6 13:28 maq-13-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 355K Dec  6 13:28 maq-14-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 380K Dec  6 13:28 maq-15-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 396K Dec  6 13:28 maq-16-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 378K Dec  6 13:28 maq-17-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 429K Dec  6 13:28 maq-18-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 426K Dec  6 13:28 maq-19-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 443K Dec  6 13:28 maq-20-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 472K Dec  6 13:28 maq-21-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 442K Dec  6 13:28 maq-22-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 477K Dec  6 13:28 maq-23-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 479K Dec  6 13:28 maq-24-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 518K Dec  6 13:28 maq-25-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 502K Dec  6 13:28 maq-26-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 495K Dec  6 13:28 maq-27-NOT-maq-33.sav
    -rw-rw-rw- 1 syoung root 520K Dec  6 13:28 maq-28-NOT-maq-33.sav

    -rw-rw-rw- 1 syoung root  195 Dec  6 13:34 maq-33-AND-maq-1.sav
    -rw-rw-rw- 1 syoung root 2.5K Dec  6 13:28 maq-33-AND-maq-10.sav
    -rw-rw-rw- 1 syoung root 1.7K Dec  6 13:28 maq-33-AND-maq-11.sav
    -rw-rw-rw- 1 syoung root 2.2K Dec  6 13:28 maq-33-AND-maq-12.sav
    -rw-rw-rw- 1 syoung root 2.7K Dec  6 13:28 maq-33-AND-maq-13.sav
    -rw-rw-rw- 1 syoung root 3.4K Dec  6 13:28 maq-33-AND-maq-14.sav
    -rw-rw-rw- 1 syoung root 2.4K Dec  6 13:28 maq-33-AND-maq-15.sav
    -rw-rw-rw- 1 syoung root 3.2K Dec  6 13:28 maq-33-AND-maq-16.sav
    -rw-rw-rw- 1 syoung root 3.4K Dec  6 13:28 maq-33-AND-maq-17.sav
    -rw-rw-rw- 1 syoung root 3.1K Dec  6 13:28 maq-33-AND-maq-18.sav
    -rw-rw-rw- 1 syoung root 3.8K Dec  6 13:28 maq-33-AND-maq-19.sav
    -rw-rw-rw- 1 syoung root 5.5K Dec  6 13:28 maq-33-AND-maq-20.sav
    -rw-rw-rw- 1 syoung root 6.7K Dec  6 13:28 maq-33-AND-maq-21.sav
    -rw-rw-rw- 1 syoung root 6.8K Dec  6 13:28 maq-33-AND-maq-22.sav
    -rw-rw-rw- 1 syoung root 8.0K Dec  6 13:28 maq-33-AND-maq-23.sav
    -rw-rw-rw- 1 syoung root  13K Dec  6 13:28 maq-33-AND-maq-24.sav
    -rw-rw-rw- 1 syoung root  17K Dec  6 13:28 maq-33-AND-maq-25.sav
    -rw-rw-rw- 1 syoung root  23K Dec  6 13:28 maq-33-AND-maq-26.sav
    -rw-rw-rw- 1 syoung root  30K Dec  6 13:28 maq-33-AND-maq-27.sav
    -rw-rw-rw- 1 syoung root  44K Dec  6 13:28 maq-33-AND-maq-28.sav

    -rw-rw-rw- 1 syoung root 532K Dec  6 13:34 maq-33-NOT-maq-1.sav
    -rw-rw-rw- 1 syoung root 528K Dec  6 13:28 maq-33-NOT-maq-10.sav
    -rw-rw-rw- 1 syoung root 529K Dec  6 13:28 maq-33-NOT-maq-11.sav
    -rw-rw-rw- 1 syoung root 529K Dec  6 13:28 maq-33-NOT-maq-12.sav
    -rw-rw-rw- 1 syoung root 528K Dec  6 13:28 maq-33-NOT-maq-13.sav
    -rw-rw-rw- 1 syoung root 527K Dec  6 13:28 maq-33-NOT-maq-14.sav
    -rw-rw-rw- 1 syoung root 529K Dec  6 13:28 maq-33-NOT-maq-15.sav
    -rw-rw-rw- 1 syoung root 528K Dec  6 13:28 maq-33-NOT-maq-16.sav
    -rw-rw-rw- 1 syoung root 528K Dec  6 13:28 maq-33-NOT-maq-17.sav
    -rw-rw-rw- 1 syoung root 528K Dec  6 13:28 maq-33-NOT-maq-18.sav
    -rw-rw-rw- 1 syoung root 527K Dec  6 13:28 maq-33-NOT-maq-19.sav
    -rw-rw-rw- 1 syoung root 525K Dec  6 13:28 maq-33-NOT-maq-20.sav
    -rw-rw-rw- 1 syoung root 524K Dec  6 13:28 maq-33-NOT-maq-21.sav
    -rw-rw-rw- 1 syoung root 524K Dec  6 13:28 maq-33-NOT-maq-22.sav
    -rw-rw-rw- 1 syoung root 523K Dec  6 13:28 maq-33-NOT-maq-23.sav
    -rw-rw-rw- 1 syoung root 518K Dec  6 13:28 maq-33-NOT-maq-24.sav
    -rw-rw-rw- 1 syoung root 513K Dec  6 13:28 maq-33-NOT-maq-25.sav
    -rw-rw-rw- 1 syoung root 506K Dec  6 13:28 maq-33-NOT-maq-26.sav
    -rw-rw-rw- 1 syoung root 500K Dec  6 13:28 maq-33-NOT-maq-27.sav
    -rw-rw-rw- 1 syoung root 485K Dec  6 13:28 maq-33-NOT-maq-28.sav



RERUNNING FILES 2 TO 9 AND 29 TO 33:


screen -S maq-venn-2-9

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn \
--replicates 2-9 \
--loop distributed \
--label maq-savvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn \
--querylabel maq-33 \
--targetlabel maq-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/loop-savvenn.2-9.out


STRANGE ERROR LOOKING FOR EXTRA DOUBLE QUOTE:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn/maq-savvenn-2.sh: line 23: unexpected EOF while looking for matching `"'
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn/maq-savvenn-2.sh: line 24: syntax error: unexpected end of file


LINES 22 AND 23:

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl "--queryfile" "/scratch/syoung/base/pipel\
ine/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-33.sav" "--targetfile" "/\
scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-\
31.sav" "--outputdir" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/ma\
q/cumulative3/chr22/venn" "--querylabel" "maq-33" "--targetlabel" "maq-31" "--suffix" "sav"


AND RUNNING THE COMMAND MANUALLY WORKS FINE:

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl "--queryfile" "/scratch/syoung/base/pipel\
ine/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-33.sav" "--targetfile" "/\
scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-\
31.sav" "--outputdir" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/ma\
q/cumulative3/chr22/venn" "--querylabel" "maq-33" "--targetlabel" "maq-31" "--suffix" "sav"

    snpVenn.pl    Run time: 00:00:12
    snpVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl
    snpVenn.pl    7:34PM, 6 December 2010
    snpVenn.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn
ll *-31-*


screen -S maq-venn-29-33

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn \
--replicates 29-33 \
--loop distributed \
--label maq-savvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn \
--querylabel maq-33 \
--targetlabel maq-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/loop-savvenn.29-33.out

    Run time: 00:01:02
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:58PM, 6 December 2010
    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22

ll *sav
    ...
    -rw-rw-rw- 1 syoung root 431K Dec  6 18:57 maq-33-NOT-maq-30.sav
    -rw-rw-rw- 1 syoung root 371K Dec  6 19:34 maq-33-NOT-maq-31.sav
    -rw-rw-rw- 1 syoung root 251K Dec  6 18:57 maq-33-NOT-maq-32.sav
    -rw-rw-rw- 1 syoung root    0 Dec  6 18:57 maq-33-NOT-maq-33.sav
    


BOWTIE
------

screen -S bowtie-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn \
--replicates 1-33 \
--loop distributed \
--label bowtie-venn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn \
--querylabel bowtie-33 \
--targetlabel bowtie-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/loop-savvenn.out
    
    Run time: 09:06:57
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:27AM, 7 December 2010
    ****************************************


TEST:

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-1.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn \
--querylabel bowtie-33 \
--targetlabel bowtie-1 \
--suffix sav

    OK


BOWTIE-RF
---------

screen -S bowtie-rf-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn \
--replicates 1-33 \
--loop distributed \
--label bowtie-rf-savvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn \
--querylabel bowtie-rf-33 \
--targetlabel bowtie-rf-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/loop-savvenn-ok.out
        
    Run time: 03:15:44
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    4:54PM, 6 December 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn
    
    ...
    -rw-rw-rw- 1 syoung root 7.5M Dec  6 16:23 bowtie-rf-6-NOT-bowtie-rf-33.sav
    -rw-rw-rw- 1 syoung root 8.8M Dec  6 16:54 bowtie-rf-7-NOT-bowtie-rf-33.sav
    -rw-rw-rw- 1 syoung root 8.8M Dec  6 16:46 bowtie-rf-8-NOT-bowtie-rf-33.sav
    -rw-rw-rw- 1 syoung root 8.5M Dec  6 16:39 bowtie-rf-9-NOT-bowtie-rf-33.sav



NOVOALIGN
---------

screen -S novoalign-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn \
--replicates 1-33 \
--loop distributed \
--label novoalign-savvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn \
--querylabel novoalign-33 \
--targetlabel novoalign-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/loop-savvenn.out

    Run time: 04:25:46
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:10PM, 9 December 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn
lines *sav

    novoalign-10-NOT-novoalign-33.sav: 28667
    novoalign-11-NOT-novoalign-33.sav: 35399
    novoalign-12-NOT-novoalign-33.sav: 27828
    novoalign-13-NOT-novoalign-33.sav: 26745
    ...





NOTES
-----

 
TEST snpVenn.pl USING simpleVenn.pl
-----------------------------------

TWO INPUT FILES CONTAIN A SINGLE COLUMN EACH OF SNP POSITIONS:

hit2.txt
hit33.txt


MAQ FILE 2 AND MAQ FILE 33
--------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/simpleVenn.pl \
--queryfile hit2.txt \
--targetfile hit33.txt \
--querylabel hit2 \
--targetlabel hit33 \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22
    
    queryonly: 26647
    targetonly: 1899
    both: 0
    simpleVenn.pl    Run time: 00:00:00
    simpleVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/simpleVenn.pl
    simpleVenn.pl    9:43PM, 6 December 2010
    simpleVenn.pl    ****************************************


MAQ FILE 2 AND MAQ FILE 2
-------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/simpleVenn.pl \
--queryfile hit2.txt \
--targetfile hit2.txt \
--querylabel hit2 \
--targetlabel hit2 \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22

    queryonly: 0
    targetonly: 0
    both: 26647
    simpleVenn.pl    Run time: 00:00:00
    simpleVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/simpleVenn.pl
    simpleVenn.pl    9:47PM, 6 December 2010
    simpleVenn.pl    ****************************************



ELAND FILE 33 AND MAQ FILE 33
-----------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq-33

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/simpleVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-33.txt \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-33.txt \
--querylabel eland-33 \
--targetlabel maq-33 \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq-33


eland
-----

screen -S venn-eland

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-1.sav \
--querylabel hit-33.sav \
--targetlabel hit-1.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn \
--suffix sav
    
    OK


eland-maq
---------


/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-1.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-1.sav \
--querylabel eland-1 \
--targetlabel maq-1 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq \
--suffix sav
    
    snpVenn.pl    Run time: 00:11:04
    snpVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl
    snpVenn.pl    9:25AM, 5 December 2010
    snpVenn.pl    ****************************************

    OK

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq
ll
    -rw-rw-rw- 1 syoung root  234 Dec  5 09:25 eland-1-AND-maq-1.sav
    -rw-rw-rw- 1 syoung root 1.1M Dec  5 09:25 eland-1-NOT-maq-1.sav
    -rw-rw-rw- 1 syoung root 1.7M Dec  5 09:25 maq-1-NOT-eland-1.sav




TROUBLESHOOTING BOWTIE-RF
-------------------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-1.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn \
--querylabel bowtie-rf-33 \
--targetlabel bowtie-rf-1 \
--suffix sav

Use of uninitialized value in string eq at /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/../../../lib/Venn/Snp.pm line 263, <QUERY> line 5.
Use of uninitialized value in string eq at /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/../../../lib/Venn/Snp.pm line 265, <QUERY> line 5.


TURNS OUT THERE ARE SOLITARY 'e' LINES IN THE *sav FILE:

em /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-1.sav 

    chr22   16697737        c       T       9       42      60      7       ttttt,, IIII<:1         0.714
    chr22   16697819        c       M       29      29      60      6       ,a,a,,  IIII'(          0.000
    e
    chr22   16477408        a       R       25      80      60      12      G$Gg.,GgG.ggG   /II+I=+IIF)I            0.000   CCDS13745.1     4819    intron  2       -       GTG     RTG     V               missense
    chr22   16477415        a       G       12      51      60      10      .,GgGGggGG      &II;I;9.II              0.800   CCDS13745.1     4812    intron  2       -       GTG     RTG     V               missense
    chr22   16477441        c       A       35      54      60      10      a$A$AAAA,AAA    I.683I7III              0.750   CCDS13745.1     4786    intron  2       -       GTG     RTG     V               missense
    chr22   16477443        t       C       35      54      60      10      CCCC,CCCC^~C    ,D/I7IIIHI      rs7287720       0.900   CCDS13745.1     4784    intron  2       -       GTG     RTG     V               missense
    chr22   16477568        t       Y       59      59      60      15      ,$...,..C,,CC.CC        IBBIID=&6<IIIII         0.000   CCDS13745.1     4659    intron  2       -       GTG     RTG     V               missense
    chr22   16477580        c       Y       48      48      60      23      TT.,,..T.......,,..T^~.^~T^~T   B0&II73:>IE;III&*III3II         0.000   CCDS13745.1     4647    intron  2       -       GTG     RTG     V               missense
    chr22   16477595        t       W       106     106     60      33      A$.G..AAACa,A..AA.Ag.,AAA..A..,A^~.^~.  *::II/I+=59I3I.8HIII1II)IIEII+III               0.000   CCDS13745.1     4632    intron  2       -       GTG     RTG     V               missens\
    e
    chr22   16477621        c       Y       100     101     60      23      .....t.TT,.Tt.tt.,.TT., &+&)*5117I9I>5(<;4IIIH$         0.000   CCDS13745.1     4606    intron  2       -       GTG     RTG     V               missense
    chr22   16477640        g       R       60      114     60      15      AAA.aa.,aA,,a.a )I,7B7I,I124<I@         0.000   CCDS13745.1     4587    intron  2       -       GTG     RTG     V               missense


em /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-1.snp

chr22   16697819        c       M       29      29      60      6       ,a,a,,  IIII'(
chr22   16847903        t       A       35      45      60      7       AAAGAA^~A       9FI.II7
...
chr22   16477393        t       A       8       45      60      7       A$,AAAaA        &II,IIB
chr22   16477408        a       R       25      80      60      12      G$Gg.,GgG.ggG   /II+I=+IIF)I
chr22   16477415        a       G       12      51      60      10      .,GgGGggGG      &II;I;9.II



WHICH CAUSES THIS PROBLEM IN snpToSav.pl (Filter::SNP):

Use of uninitialized value in string eq at /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/../../../lib/Venn/Snp.pm line 274, <QUERY> line 6.
Use of uninitialized value in string eq at /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/../../../lib/Venn/Snp.pm line 276, <QUERY> line 6.
Use of uninitialized value in substitution (s///) at /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/../../../lib/Venn/Snp.pm line 262, <QUERY> line 9.
targetposition not defined for target: e

targets [5930 - 1]: chr22       16697819        c       M       29      29      60      6       ,a,a,,  IIII'(          0.000

targets [5930]: e

targets [5930 + 1]: chr22       16477408        a       R       25      80      60      12      G$Gg.,GgG.ggG   /II+I=+IIF)I            0.000   CCDS13745.1     4819    intron  2       -       GTG     RTG     V               missense



THE PROBLEM IS PROBABLY DUE TO THE FILE BEING WRITTEN TO CONCURRENTLY BY TWO PROCESSES

ALTERNATELY, THE PRESENCE OF ")" AND "(" IN A COLUMN MIGHT MESS UP PARSING OF THE ENTRIES, E.G., IN THE addVariantFreq SUBROUTINE OF Filter::SNP:

    sub addVariantFreq
    {
        my $self            =   shift;
        my $feature         =   shift;
        my $variant_base    =   shift;
        my $read_bases      =   shift;
    
    #my $DEBUG = 1;
        print "Filter::SNP::addVariantFreq    Filter::SNP::addVariantFreq(feature, variant_base, read_bases)\n" if $DEBUG;
        print "Filter::SNP::addVariantFreq    variant_base: $variant_base\n" if $DEBUG;
        print "Filter::SNP::addVariantFreq    BEFORE read_bases: $read_bases\n" if $DEBUG;
        
        #### REMOVE ANY QUALITY VALUES
        $read_bases =~ s/\^.//g;
        print "Filter::SNP::addVariantFreq    AFTER read_bases: $read_bases\n" if $DEBUG;
    
        my $length = length($read_bases);
        my ($count) = $read_bases =~ s/$variant_base//gi;
    
        print "Filter::SNP::addVariantFreq    length: $length\n" if $DEBUG;
        print "Filter::SNP::addVariantFreq    count: $count\n" if $DEBUG;
        
        my $variant_frequency = sprintf "%.3f", ($count / $length);
        print "Filter::SNP::addVariantFreq    variant_frequency: $variant_frequency\n" if $DEBUG;
    
        $self->get_fieldvalues()->{variantfrequency} = $variant_frequency if defined $variant_frequency;
    })




</entry>



<entry [Tue Nov 30 14:55:20 EST 2010] RUN unbin.pl ON ALL SAMPLES>




ELAND
-----

screen -S eland-unbin

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl \
--filename hit.bam \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3 \
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
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/unbin.out


    RUNNING Tue Dec  7 01:47:22 EST 2010
    
    unbin.pl    Run time: 00:01:02
    unbin.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl
    unbin.pl    1:42AM, 7 December 2010
    unbin.pl    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22

    -rw-rw-rw- 1 syoung root 1.1M Dec  7 01:41 hit-1.sav
    -rw-rw-rw- 1 syoung root 212K Dec  7 01:41 hit-2.sav
    -rw-rw-rw- 1 syoung root 2.4M Dec  7 01:41 hit-3.sav
    -rw-rw-rw- 1 syoung root 2.8M Dec  7 01:41 hit-4.sav
    -rw-rw-rw- 1 syoung root 3.1M Dec  7 01:41 hit-5.sav
    -rw-rw-rw- 1 syoung root 3.3M Dec  7 01:41 hit-6.sav
    -rw-rw-rw- 1 syoung root 3.5M Dec  7 01:41 hit-7.sav
    -rw-rw-rw- 1 syoung root 3.7M Dec  7 01:41 hit-8.sav
    -rw-rw-rw- 1 syoung root 3.8M Dec  7 01:41 hit-9.sav
    -rw-rw-rw- 1 syoung root 3.8M Dec  7 01:41 hit-10.sav
    -rw-rw-rw- 1 syoung root 3.8M Dec  7 01:41 hit-11.sav
    -rw-rw-rw- 1 syoung root 3.7M Dec  7 01:41 hit-12.sav
    -rw-rw-rw- 1 syoung root 3.6M Dec  7 01:41 hit-13.sav
    -rw-rw-rw- 1 syoung root 3.8M Dec  7 01:41 hit-14.sav
    -rw-rw-rw- 1 syoung root 3.8M Dec  7 01:41 hit-15.sav
    -rw-rw-rw- 1 syoung root 3.8M Dec  7 01:41 hit-16.sav
    -rw-rw-rw- 1 syoung root 3.8M Dec  7 01:41 hit-17.sav
    -rw-rw-rw- 1 syoung root 3.7M Dec  7 01:41 hit-18.sav
    -rw-rw-rw- 1 syoung root 3.7M Dec  7 01:41 hit-19.sav
    -rw-rw-rw- 1 syoung root 3.7M Dec  7 01:41 hit-20.sav
    -rw-rw-rw- 1 syoung root 3.6M Dec  7 01:41 hit-21.sav
    -rw-rw-rw- 1 syoung root 3.6M Dec  7 01:41 hit-22.sav
    -rw-rw-rw- 1 syoung root 3.6M Dec  7 01:41 hit-23.sav
    -rw-rw-rw- 1 syoung root 3.5M Dec  7 01:41 hit-24.sav
    -rw-rw-rw- 1 syoung root 3.5M Dec  7 01:41 hit-25.sav
    -rw-rw-rw- 1 syoung root 3.4M Dec  7 01:41 hit-26.sav
    -rw-rw-rw- 1 syoung root 3.4M Dec  7 01:41 hit-27.sav
    -rw-rw-rw- 1 syoung root 3.4M Dec  7 01:41 hit-28.sav
    -rw-rw-rw- 1 syoung root 3.4M Dec  7 01:41 hit-29.sav
    -rw-rw-rw- 1 syoung root 3.3M Dec  7 01:41 hit-30.sav
    -rw-rw-rw- 1 syoung root 3.3M Dec  7 01:41 hit-31.sav
    -rw-rw-rw- 1 syoung root 3.3M Dec  7 01:41 hit-32.sav
    -rw-rw-rw- 1 syoung root 3.3M Dec  7 01:41 hit-33.sav


MAQ
---

screen -S maq-unbin

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl \
--filename hit.bam \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2
    
    
    RUNNING Tue Dec  7 01:47:22 EST 2010
    
    unbin.pl    Run time: 00:00:58
    unbin.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl
    unbin.pl    1:43AM, 7 December 2010
    unbin.pl    ****************************************

    

OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22
ll  hit-*sav

    -rw-rw-rw- 1 syoung root 1.7M Dec  7 01:42 hit-1.sav
    -rw-rw-rw- 1 syoung root 2.5M Dec  7 01:42 hit-2.sav
    -rw-rw-rw- 1 syoung root 1.9M Dec  7 01:42 hit-3.sav
    -rw-rw-rw- 1 syoung root 1.3M Dec  7 01:42 hit-4.sav
    -rw-rw-rw- 1 syoung root 801K Dec  7 01:42 hit-5.sav
    -rw-rw-rw- 1 syoung root 536K Dec  7 01:42 hit-6.sav
    -rw-rw-rw- 1 syoung root 392K Dec  7 01:42 hit-7.sav
    -rw-rw-rw- 1 syoung root 341K Dec  7 01:42 hit-8.sav
    -rw-rw-rw- 1 syoung root 333K Dec  7 01:42 hit-9.sav
    -rw-rw-rw- 1 syoung root 327K Dec  7 01:42 hit-10.sav
    -rw-rw-rw- 1 syoung root 334K Dec  7 01:42 hit-11.sav
    -rw-rw-rw- 1 syoung root 329K Dec  7 01:42 hit-12.sav
    -rw-rw-rw- 1 syoung root 351K Dec  7 01:42 hit-13.sav
    -rw-rw-rw- 1 syoung root 359K Dec  7 01:42 hit-14.sav
    -rw-rw-rw- 1 syoung root 382K Dec  7 01:42 hit-15.sav
    -rw-rw-rw- 1 syoung root 399K Dec  7 01:42 hit-16.sav
    -rw-rw-rw- 1 syoung root 381K Dec  7 01:42 hit-17.sav
    -rw-rw-rw- 1 syoung root 432K Dec  7 01:42 hit-18.sav
    -rw-rw-rw- 1 syoung root 430K Dec  7 01:42 hit-19.sav
    -rw-rw-rw- 1 syoung root 448K Dec  7 01:42 hit-20.sav
    -rw-rw-rw- 1 syoung root 479K Dec  7 01:42 hit-21.sav
    -rw-rw-rw- 1 syoung root 448K Dec  7 01:42 hit-22.sav
    -rw-rw-rw- 1 syoung root 485K Dec  7 01:42 hit-23.sav
    -rw-rw-rw- 1 syoung root 491K Dec  7 01:42 hit-24.sav
    -rw-rw-rw- 1 syoung root 535K Dec  7 01:42 hit-25.sav
    -rw-rw-rw- 1 syoung root 525K Dec  7 01:42 hit-26.sav
    -rw-rw-rw- 1 syoung root 525K Dec  7 01:42 hit-27.sav
    -rw-rw-rw- 1 syoung root 563K Dec  7 01:42 hit-28.sav
    -rw-rw-rw- 1 syoung root 531K Dec  7 01:42 hit-29.sav
    -rw-rw-rw- 1 syoung root 394K Dec  7 01:42 hit-30.sav
    -rw-rw-rw- 1 syoung root 519K Dec  7 01:42 hit-31.sav
    -rw-rw-rw- 1 syoung root 518K Dec  7 01:42 hit-32.sav
    -rw-rw-rw- 1 syoung root 533K Dec  7 01:42 hit-33.sav




BOWTIE
------

screen -S bowtie-unbin

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl \
--filename hit.bam \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3 \
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
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/unbin.out
    
    
    unbin.pl    Run time: 00:01:04
    unbin.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl
    unbin.pl    1:48AM, 7 December 2010
    unbin.pl    ****************************************


OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22
ll hit-*sav

    -rw-rw-rw- 1 syoung root 8.4M Dec  7 01:45 hit-1.sav
    -rw-rw-rw- 1 syoung root  11M Dec  7 01:45 hit-2.sav
    -rw-rw-rw- 1 syoung root  13M Dec  7 01:45 hit-3.sav
    -rw-rw-rw- 1 syoung root 9.7M Dec  7 01:45 hit-4.sav
    -rw-rw-rw- 1 syoung root  11M Dec  7 01:45 hit-5.sav
    -rw-rw-rw- 1 syoung root  17M Dec  7 01:45 hit-6.sav
    -rw-rw-rw- 1 syoung root  14M Dec  7 01:45 hit-7.sav
    -rw-rw-rw- 1 syoung root  11M Dec  7 01:45 hit-8.sav
    -rw-rw-rw- 1 syoung root 8.8M Dec  7 01:45 hit-9.sav
    -rw-rw-rw- 1 syoung root  14M Dec  7 01:45 hit-10.sav
    -rw-rw-rw- 1 syoung root  11M Dec  7 01:45 hit-11.sav
    -rw-rw-rw- 1 syoung root  13M Dec  7 01:45 hit-12.sav
    -rw-rw-rw- 1 syoung root  16M Dec  7 01:45 hit-13.sav
    -rw-rw-rw- 1 syoung root  19M Dec  7 01:45 hit-14.sav
    -rw-rw-rw- 1 syoung root  15M Dec  7 01:45 hit-15.sav
    -rw-rw-rw- 1 syoung root  16M Dec  7 01:45 hit-16.sav
    -rw-rw-rw- 1 syoung root 8.7M Dec  7 01:45 hit-17.sav
    -rw-rw-rw- 1 syoung root 8.4M Dec  7 01:45 hit-18.sav
    -rw-rw-rw- 1 syoung root 7.8M Dec  7 01:45 hit-19.sav
    -rw-rw-rw- 1 syoung root 9.0M Dec  7 01:45 hit-20.sav
    -rw-rw-rw- 1 syoung root  14M Dec  7 01:45 hit-21.sav
    -rw-rw-rw- 1 syoung root 9.4M Dec  7 01:45 hit-22.sav
    -rw-rw-rw- 1 syoung root 8.4M Dec  7 01:45 hit-23.sav
    -rw-rw-rw- 1 syoung root  11M Dec  7 01:45 hit-24.sav
    -rw-rw-rw- 1 syoung root 9.7M Dec  7 01:45 hit-25.sav
    -rw-rw-rw- 1 syoung root  17M Dec  7 01:45 hit-26.sav
    -rw-rw-rw- 1 syoung root  16M Dec  7 01:45 hit-27.sav
    -rw-rw-rw- 1 syoung root  13M Dec  7 01:45 hit-28.sav
    -rw-rw-rw- 1 syoung root  12M Dec  7 01:45 hit-29.sav
    -rw-rw-rw- 1 syoung root  12M Dec  7 01:45 hit-30.sav
    -rw-rw-rw- 1 syoung root  12M Dec  7 01:45 hit-31.sav
    -rw-rw-rw- 1 syoung root  13M Dec  7 01:45 hit-32.sav
    -rw-rw-rw- 1 syoung root  16M Dec  7 01:45 hit-33.sav

lines hit-*.sav

    hit-1.sav: 76048
    hit-2.sav: 100425
    hit-3.sav: 107091
    hit-4.sav: 88387
    hit-5.sav: 83944
    hit-6.sav: 122957
    hit-7.sav: 98142
    hit-8.sav: 74807
    hit-9.sav: 58383
    hit-10.sav: 99279
    hit-11.sav: 75497
    hit-12.sav: 82765
    hit-13.sav: 104686
    hit-14.sav: 119280
    hit-15.sav: 95195
    hit-16.sav: 97573
    hit-17.sav: 54153
    hit-18.sav: 52297
    hit-19.sav: 47480
    hit-20.sav: 55881
    hit-21.sav: 81595
    hit-22.sav: 57239
    hit-23.sav: 51263
    hit-24.sav: 61954
    hit-25.sav: 57727
    hit-26.sav: 102459
    hit-27.sav: 90403
    hit-28.sav: 72241
    hit-29.sav: 69243
    hit-30.sav: 66738
    hit-31.sav: 66506
    hit-32.sav: 73305
    hit-33.sav: 86806


lines hit-*.snp

    hit-1.snp: 77385
    hit-2.snp: 106305
    hit-3.snp: 122804
    hit-4.snp: 132957
    hit-5.snp: 138301
    hit-6.snp: 141062
    hit-7.snp: 142191
    hit-8.snp: 142162
    hit-9.snp: 140984
    hit-10.snp: 139480
    hit-11.snp: 137175
    hit-12.snp: 134847
    hit-13.snp: 132199
    hit-14.snp: 129500
    hit-15.snp: 126684
    hit-16.snp: 124021
    hit-17.snp: 121673
    hit-18.snp: 119253
    hit-19.snp: 117079
    hit-20.snp: 115067
    hit-21.snp: 112849
    hit-22.snp: 110687
    hit-23.snp: 108577
    hit-24.snp: 106702
    hit-25.snp: 104785
    hit-26.snp: 102840
    hit-27.snp: 101017
    hit-28.snp: 99184
    hit-29.snp: 97425
    hit-30.snp: 95719
    hit-31.snp: 94044
    hit-32.snp: 92440
    hit-33.snp: 90941



BOWTIE-RF
---------

screen -S bowtie-rf-unbin

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl \
--filename hit.bam \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/33 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/unbin.out
    


    RUNNING Tue Dec  7 01:47:22 EST 2010



    #unbin.pl    Run time: 00:00:43
    #unbin.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl
    #unbin.pl    9:55AM, 6 December 2010
    #unbin.pl    ****************************************



OUTPUT FILES *sav FILES:
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22

    -rw-rw-rw- 1 syoung root 5.7M Dec  6 09:55 hit-1.sav
    -rw-rw-rw- 1 syoung root 6.0M Dec  6 09:55 hit-2.sav
    -rw-rw-rw- 1 syoung root 8.3M Dec  6 09:55 hit-3.sav
    -rw-rw-rw- 1 syoung root 8.8M Dec  6 09:55 hit-4.sav
    -rw-rw-rw- 1 syoung root 9.1M Dec  6 09:55 hit-5.sav
    -rw-rw-rw- 1 syoung root 9.7M Dec  6 09:55 hit-6.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 09:55 hit-7.sav
    -rw-rw-rw- 1 syoung root  13M Dec  6 09:55 hit-8.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 09:55 hit-9.sav
    -rw-rw-rw- 1 syoung root 9.5M Dec  6 09:55 hit-10.sav
    -rw-rw-rw- 1 syoung root  13M Dec  6 09:55 hit-11.sav
    -rw-rw-rw- 1 syoung root 9.3M Dec  6 09:55 hit-12.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 09:55 hit-13.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 09:55 hit-14.sav
    -rw-rw-rw- 1 syoung root 8.5M Dec  6 09:55 hit-15.sav
    -rw-rw-rw- 1 syoung root  14M Dec  6 09:55 hit-16.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 09:55 hit-17.sav
    -rw-rw-rw- 1 syoung root 8.9M Dec  6 09:55 hit-18.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 09:55 hit-19.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 09:55 hit-20.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 09:55 hit-21.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 09:55 hit-22.sav
    -rw-rw-rw- 1 syoung root  10M Dec  6 09:55 hit-23.sav
    -rw-rw-rw- 1 syoung root  14M Dec  6 09:55 hit-24.sav
    -rw-rw-rw- 1 syoung root  13M Dec  6 09:55 hit-25.sav
    -rw-rw-rw- 1 syoung root  13M Dec  6 09:55 hit-26.sav
    -rw-rw-rw- 1 syoung root  14M Dec  6 09:55 hit-27.sav
    -rw-rw-rw- 1 syoung root  13M Dec  6 09:55 hit-28.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 09:55 hit-29.sav
    -rw-rw-rw- 1 syoung root  13M Dec  6 09:55 hit-30.sav
    -rw-rw-rw- 1 syoung root  15M Dec  6 09:55 hit-31.sav
    -rw-rw-rw- 1 syoung root  15M Dec  6 09:55 hit-32.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 09:55 hit-33.sav

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22
lines hit-*sav

    hit-1.sav: 55860
    hit-2.sav: 51225
    hit-3.sav: 66162
    hit-4.sav: 67018
    hit-5.sav: 69411
    hit-6.sav: 69345
    hit-7.sav: 80853
    hit-8.sav: 86238
    hit-9.sav: 80461
    hit-10.sav: 62854
    hit-11.sav: 87656
    hit-12.sav: 59186
    hit-13.sav: 75028
    hit-14.sav: 77846
    hit-15.sav: 65713
    hit-16.sav: 84364
    hit-17.sav: 90372
    hit-18.sav: 64875
    hit-19.sav: 73663
    hit-20.sav: 68431
    hit-21.sav: 73615
    hit-22.sav: 63163
    hit-23.sav: 74669
    hit-24.sav: 86750
    hit-25.sav: 79137
    hit-26.sav: 79490
    hit-27.sav: 89354
    hit-28.sav: 76547
    hit-29.sav: 69462
    hit-30.sav: 74848
    hit-31.sav: 82651
    hit-32.sav: 81991
    hit-33.sav: 67661

lines hit-*snp
    
    hit-1.snp: 77385
    hit-2.snp: 106305
    hit-3.snp: 122804
    hit-4.snp: 132957
    hit-5.snp: 138863
    hit-6.snp: 141418
    hit-7.snp: 142335
    hit-8.snp: 142240
    hit-9.snp: 141220
    hit-10.snp: 139674
    hit-11.snp: 137400
    hit-12.snp: 134982
    hit-13.snp: 132394
    hit-14.snp: 129652
    hit-15.snp: 126874
    hit-16.snp: 124269
    hit-17.snp: 121838
    hit-18.snp: 119475
    hit-19.snp: 117257
    hit-20.snp: 115224
    hit-21.snp: 113005
    hit-22.snp: 110745
    hit-23.snp: 108649
    hit-24.snp: 106743
    hit-25.snp: 104839
    hit-26.snp: 102906
    hit-27.snp: 101076
    hit-28.snp: 99233
    hit-29.snp: 97458
    hit-30.snp: 95753
    hit-31.snp: 94096
    hit-32.snp: 92528
    hit-33.snp: 90970

NOVOALIGN
---------

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl \
--filename hit.bam \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/2,\
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
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2

    unbin.pl    Run time: 00:00:46
    unbin.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl
    unbin.pl    10:34AM, 6 December 2010
    unbin.pl    ****************************************
    
OUTPUT FILES *sav FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22
    
    -rw-rw-rw- 1 syoung root 2.2M Dec  6 10:33 hit-1.sav
    -rw-rw-rw- 1 syoung root 3.9M Dec  6 10:33 hit-2.sav
    -rw-rw-rw- 1 syoung root 3.9M Dec  6 10:33 hit-3.sav
    -rw-rw-rw- 1 syoung root 4.7M Dec  6 10:33 hit-4.sav
    -rw-rw-rw- 1 syoung root 6.0M Dec  6 10:33 hit-5.sav
    -rw-rw-rw- 1 syoung root 5.7M Dec  6 10:33 hit-6.sav
    -rw-rw-rw- 1 syoung root 7.5M Dec  6 10:33 hit-7.sav
    -rw-rw-rw- 1 syoung root 8.0M Dec  6 10:33 hit-8.sav
    -rw-rw-rw- 1 syoung root 6.8M Dec  6 10:33 hit-9.sav
    -rw-rw-rw- 1 syoung root 7.8M Dec  6 10:33 hit-10.sav
    -rw-rw-rw- 1 syoung root 8.9M Dec  6 10:33 hit-11.sav
    -rw-rw-rw- 1 syoung root 8.2M Dec  6 10:33 hit-12.sav
    -rw-rw-rw- 1 syoung root 8.4M Dec  6 10:33 hit-13.sav
    -rw-rw-rw- 1 syoung root 8.3M Dec  6 10:33 hit-14.sav
    -rw-rw-rw- 1 syoung root 8.5M Dec  6 10:33 hit-15.sav
    -rw-rw-rw- 1 syoung root 9.3M Dec  6 10:34 hit-16.sav
    -rw-rw-rw- 1 syoung root 7.2M Dec  6 10:33 hit-17.sav
    -rw-rw-rw- 1 syoung root 8.4M Dec  6 10:33 hit-18.sav
    -rw-rw-rw- 1 syoung root 8.1M Dec  6 10:33 hit-19.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:34 hit-20.sav
    -rw-rw-rw- 1 syoung root 9.6M Dec  6 10:33 hit-21.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:33 hit-22.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:34 hit-23.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:34 hit-24.sav
    -rw-rw-rw- 1 syoung root 9.7M Dec  6 10:34 hit-25.sav
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:34 hit-26.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:34 hit-27.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:34 hit-28.sav
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:34 hit-29.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:34 hit-30.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:34 hit-31.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:33 hit-32.sav
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:33 hit-33.sav


lines hit-*sav

    hit-1.sav: 22847
    hit-2.sav: 33923
    hit-3.sav: 41353
    hit-4.sav: 47158
    hit-5.sav: 52049
    hit-6.sav: 49952
    hit-7.sav: 59576
    hit-8.sav: 62763
    hit-9.sav: 58446
    hit-10.sav: 60437
    hit-11.sav: 67844
    hit-12.sav: 61990
    hit-13.sav: 63259
    hit-14.sav: 71796
    hit-15.sav: 73237
    hit-16.sav: 67980
    hit-17.sav: 60061
    hit-18.sav: 67092
    hit-19.sav: 57935
    hit-20.sav: 83291
    hit-21.sav: 83515
    hit-22.sav: 74818
    hit-23.sav: 71791
    hit-24.sav: 73010
    hit-25.sav: 68133
    hit-26.sav: 78238
    hit-27.sav: 72872
    hit-28.sav: 74669
    hit-29.sav: 87919
    hit-30.sav: 81759
    hit-31.sav: 81738
    hit-32.sav: 69829
    hit-33.sav: 74536



</entry>



<entry [Tue Nov 30 14:55:20 EST 2010] RUN SAV.pl ON ALL SAMPLES>




ELAND
-----

ON u01

screen -S eland-hitrange

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3 \
--replicates 1-33 \
--loop distributed \
--label eland-hitrange \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/hitRange.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%/chr22/hit.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%/chr22/hit.bam.range \
--cluster LSF \
--maxjobs 1000 \
--queue small

Run time: 00:01:02
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
4:20AM, 3 December 2010
****************************************

ON u01

screen -S eland-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2 \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/snp130-chr22-%REPLICATE%.dbl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24


    TOOK 13 HOURS!

    RUNNING Fri Dec  3 09:52:49 EST 2010
    
    COMPLETED Fri Dec  3 23:23:49 EST 2010

    ...
    -rw-rw-rw- 1 syoung root  895K Dec  3 22:20 hit.binlevel2.num11-30.sav
    -rw-rw-rw- 1 syoung root  1.2M Dec  3 22:57 hit.binlevel2.num11-11.sav
    -rw-rw-rw- 1 syoung root  884K Dec  3 23:23 hit.binlevel2.num14-29.sav


MAQ
---

ON u02

screen -S maq-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--replicates 1-33 \
--loop distributed \
--label maq-hitrange \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/hitRange.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/chr22/hit.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/chr22/hit.bam.range \
--cluster LSF \
--maxjobs 1000 \
--queue small

    Run time: 00:03:45
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    7:46AM, 3 December 2010
    ****************************************

screen -S maq-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--binlevel 2 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/snp130-chr22-%REPLICATE%.dbl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24


RAN OKAY BUT MISSING FILES 29 TO 33 BECAUSE cumulativeSnp.pl FAILED TO PRODUCE THEM.

RERAN SAV.pl

screen -S maq-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--binlevel 2 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/snp130-chr22-%REPLICATE%.dbl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24


ERROR IN STDOUT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3
ll ../maq-sav-30-stdout.txt

    -rw-rw-rw- 1 syoung root 5.4K Dec  3 07:50 ../maq-sav-30-stdout.txt

em maq-sav-30-stdout.txt

    SNP::annotateSnpBins    Can't find snpfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit.binlevel2.num10-31.snp



BUT THE FILE IS NOW PRESENT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22
ll hit.binlevel2.num10*snp

    -rw-rw-rw- 1 syoung root 19K Dec  5 20:56 hit.binlevel2.num10-10.snp
    -rw-rw-rw- 1 syoung root 18K Dec  5 21:06 hit.binlevel2.num10-11.snp
    -rw-rw-rw- 1 syoung root 22K Dec  5 21:13 hit.binlevel2.num10-12.snp
    -rw-rw-rw- 1 syoung root 20K Dec  5 21:23 hit.binlevel2.num10-13.snp
    -rw-rw-rw- 1 syoung root 21K Dec  5 21:30 hit.binlevel2.num10-14.snp
    -rw-rw-rw- 1 syoung root 22K Dec  5 21:40 hit.binlevel2.num10-15.snp
    -rw-rw-rw- 1 syoung root 24K Dec  5 21:48 hit.binlevel2.num10-16.snp
    -rw-rw-rw- 1 syoung root 21K Dec  5 21:57 hit.binlevel2.num10-17.snp
    -rw-rw-rw- 1 syoung root 22K Dec  5 22:07 hit.binlevel2.num10-18.snp
    -rw-rw-rw- 1 syoung root 22K Dec  5 22:16 hit.binlevel2.num10-19.snp
    -rw-rw-rw- 1 syoung root 18K Dec  5 20:02 hit.binlevel2.num10-1.snp
    -rw-rw-rw- 1 syoung root 26K Dec  5 22:28 hit.binlevel2.num10-20.snp
    -rw-rw-rw- 1 syoung root 27K Dec  5 22:37 hit.binlevel2.num10-21.snp
    -rw-rw-rw- 1 syoung root 26K Dec  5 22:46 hit.binlevel2.num10-22.snp
    -rw-rw-rw- 1 syoung root 29K Dec  5 22:57 hit.binlevel2.num10-23.snp
    -rw-rw-rw- 1 syoung root 29K Dec  5 23:07 hit.binlevel2.num10-24.snp
    -rw-rw-rw- 1 syoung root 33K Dec  5 23:20 hit.binlevel2.num10-25.snp
    -rw-rw-rw- 1 syoung root 29K Dec  5 23:27 hit.binlevel2.num10-26.snp
    -rw-rw-rw- 1 syoung root 28K Dec  5 23:40 hit.binlevel2.num10-27.snp
    -rw-rw-rw- 1 syoung root 32K Dec  5 23:48 hit.binlevel2.num10-28.snp
    -rw-rw-rw- 1 syoung root 32K Dec  6 00:07 hit.binlevel2.num10-29.snp
    -rw-rw-rw- 1 syoung root 27K Dec  5 20:05 hit.binlevel2.num10-2.snp
    -rw-rw-rw- 1 syoung root 28K Dec  6 00:09 hit.binlevel2.num10-30.snp
    -rw-rw-rw- 1 syoung root 28K Dec  6 00:20 hit.binlevel2.num10-31.snp
    -rw-rw-rw- 1 syoung root 28K Dec  6 00:40 hit.binlevel2.num10-32.snp
    -rw-rw-rw- 1 syoung root 31K Dec  6 00:52 hit.binlevel2.num10-33.snp
    -rw-rw-rw- 1 syoung root 22K Dec  5 20:10 hit.binlevel2.num10-3.snp
    -rw-rw-rw- 1 syoung root 18K Dec  5 20:14 hit.binlevel2.num10-4.snp
    -rw-rw-rw- 1 syoung root 14K Dec  5 20:21 hit.binlevel2.num10-5.snp
    -rw-rw-rw- 1 syoung root 15K Dec  5 20:27 hit.binlevel2.num10-6.snp
    -rw-rw-rw- 1 syoung root 15K Dec  5 20:34 hit.binlevel2.num10-7.snp
    -rw-rw-rw- 1 syoung root 16K Dec  5 20:41 hit.binlevel2.num10-8.snp
    -rw-rw-rw- 1 syoung root 16K Dec  5 20:48 hit.binlevel2.num10-9.snp


SO RE-RERUN SAV.pl FROM FILES 29 TO 33:

screen -S maq-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 29-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--binlevel 2 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/snp130-chr22-%REPLICATE%.dbl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/sav.29-33.out


    RUNNING Mon Dec  6 22:55:58 EST 2010

    Run time: 00:14:54
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:09PM, 6 December 2010
    ****************************************


CONFIRMED OUTPUT FILES ARE PRESENT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22

    ...
    -rw-rw-rw- 1 syoung root 151K Dec  6 23:03 hit.binlevel2.num12-29.sav
    -rw-rw-rw- 1 syoung root  99K Dec  6 23:04 hit.binlevel2.num14-31.sav
    -rw-rw-rw- 1 syoung root 134K Dec  6 23:08 hit.binlevel2.num11-32.sav
    -rw-rw-rw- 1 syoung root 136K Dec  6 23:08 hit.binlevel2.num13-31.sav
    -rw-rw-rw- 1 syoung root 5.3K Dec  6 23:11 hit.binlevel2.num11-30.sav



BOWTIE
------

ON u03

screen -S bowtie-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3 \
--replicates 1-33 \
--loop distributed \
--label bowtie-hitrange \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/hitRange.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/chr22/hit.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/chr22/hit.bam.range \
--cluster LSF \
--maxjobs 1000 \
--queue small
    
    Run time: 00:01:19
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    7:45AM, 3 December 2010
    ****************************************

ON u03

screen -S bowtie-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--binlevel 2 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/snp130-chr22-%REPLICATE%.dbl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24

    RUNNING Fri Dec  3 10:02:49 EST 2010

    COMPLETED Sat Dec  4 10:00:02 EST 2010

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22

    ...
    -rw-rw-rw- 1 syoung root  2.9M Dec  4 10:00 hit.binlevel2.num13-27.sav
    -rw-rw-rw- 1 syoung root  2.8M Dec  4 10:00 hit.binlevel2.num14-27.sav
    -rw-rw-rw- 1 syoung root  3.0M Dec  4 10:00 hit.binlevel2.num11-28.sav
    -rw-rw-rw- 1 syoung root  4.6M Dec  4 10:00 hit.binlevel2.num11-33.sav



BOWTIE-RF
---------

ON u03

screen -S bowtie-rf-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3 \
--replicates 1-33 \
--loop distributed \
--label bowtie-rf-hitrange \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/hitRange.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/%REPLICATE%/chr22/hit.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/%REPLICATE%/chr22/hit.bam.range \
--cluster LSF \
--maxjobs 1000 \
--queue small

    Run time: 00:01:13
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    7:51AM, 3 December 2010
    ****************************************

ON u03

screen -S bowtie-rf-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--binlevel 2 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/snp130-chr22-%REPLICATE%.dbl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24

    RUNNING Fri Dec  3 1:58:49 EST 2010

    COMPLETED Sat Dec  4 10:02:41 EST 2010

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22

    ...
    -rw-rw-rw- 1 syoung root  3.0M Dec  4 10:02 hit.binlevel2.num13-32.sav
    -rw-rw-rw- 1 syoung root  2.8M Dec  4 10:02 hit.binlevel2.num14-27.sav
    -rw-rw-rw- 1 syoung root  2.8M Dec  4 10:02 hit.binlevel2.num14-29.sav
    -rw-rw-rw- 1 syoung root  3.0M Dec  4 10:02 hit.binlevel2.num13-31.sav



NOVOALIGN
---------

ON u04

screen -S novoalign-hitrange

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3 \
--replicates 1-33 \
--loop distributed \
--label novoalign-hitrange \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/hitRange.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/chr22/hit.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/chr22/hit.bam.range \
--cluster LSF \
--maxjobs 1000 \
--queue small
    
    Run time: 00:01:56
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:05AM, 3 December 2010
    ****************************************


ON u04

screen -S novoalign-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--binlevel 2 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/snp130-chr22-%REPLICATE%.dbl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24

    RUNNING Fri Dec  3 10:16:16 EST 2010

    COMPLETED Sat Dec  4 10:16:18 EST 2010
    
    -rw-rw-rw- 1 syoung root  2.4M Dec  4 10:16 hit.binlevel2.num14-31.sav
    -rw-rw-rw- 1 syoung root  2.4M Dec  4 10:16 hit.binlevel2.num14-29.sav
    -rw-rw-rw- 1 syoung root  2.4M Dec  4 10:16 hit.binlevel2.num14-28.sav
    -rw-rw-rw- 1 syoung root  2.4M Dec  4 10:16 hit.binlevel2.num14-30.sav




COPY OVER hit.binlevel2.num*-32.sav AND hit.binlevel2.num*-33.sav FILES 32 AND 33, WHICH WERE MISSING FROM INITIAL OUTPUT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative4/chr22
cp hit.binlevel2.num*-32.sav ../../cumulative3/chr22
cp hit.binlevel2.num*-33.sav ../../cumulative3/chr22



CONFIRMED ALL OUTPUT FILES NOW PRESENT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22

    ...
    -rw-rw-rw- 1 syoung root  174K Dec  3 13:17 hit.binlevel2.num15-30.sav
    -rw-rw-rw- 1 syoung root  173K Dec  3 13:17 hit.binlevel2.num15-31.sav
    -rw-rw-r-- 1 syoung root  172K Dec  6 10:30 hit.binlevel2.num15-32.sav
    -rw-rw-r-- 1 syoung root  171K Dec  6 10:31 hit.binlevel2.num15-33.sav
    -rw-rw-rw- 1 syoung root   86K Dec  3 12:04 hit.binlevel2.num15-3.sav
    -rw-rw-rw- 1 syoung root  104K Dec  3 12:16 hit.binlevel2.num15-4.sav
    -rw-rw-rw- 1 syoung root  120K Dec  3 12:13 hit.binlevel2.num15-5.sav
    -rw-rw-rw- 1 syoung root  138K Dec  3 12:23 hit.binlevel2.num15-6.sav
    -rw-rw-rw- 1 syoung root  152K Dec  3 13:25 hit.binlevel2.num15-7.sav
    -rw-rw-rw- 1 syoung root  165K Dec  3 11:52 hit.binlevel2.num15-8.sav
    -rw-rw-rw- 1 syoung root  175K Dec  3 14:24 hit.binlevel2.num15-9.sav





TEST
----



/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--binlevel 2 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/snp130-chr22-1.dbl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24
    
    SAV.pl    Run time: 00:42:16
    SAV.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl
    SAV.pl    10-12-03 03:57:29
    SAV.pl    ****************************************






</entry>



<entry [Thu Dec  2 12:44:08 EST 2010] CLEAN UP autochr ON /scratch AND SHIFT TO /ngs/bioinfo>





MAQ
---

REMOVE SUBDIRS AND SPLIT FILES:

ON uo2

screen -S rm-maq-auto
rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq

    OK

screen -S mv-auto
mv /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/* /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22

    RUNNING Thu Dec  2 13:33:08 EST 2010


NOVOALIGN
---------

REMOVE SEQUENCE FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1

screen -S clean-novo

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign \
--references chr22

    Cluster.pl    Run time: 00:05:00
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-12-02 13:12:24
    Cluster.pl    ****************************************







</entry>



<entry [Sat Dec  4 20:00:48 EST 2010] CONFIRMED NOVOALIGN IS INDEED PROVIDING ONE, BEST HIT FOR EACH READ>





TEST
----

NOTE: INCORRECT INSERT SIZE OF 2000 BP FOR autochr22 RUN WHICH WAS GENERATED THIS NOVOALIGN COMMAND:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/novoalign/1
em novoalign.out

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-i 2000 300 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/novoalign/1/$LSB_JOBINDE\
X/novoalign-autochr22-1_1.$LSB_JOBINDEX.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled\
/200bp/autochr22/novoalign/1/$LSB_JOBINDEX/novoalign-autochr22-1_2.$LSB_JOBINDEX.txt  > /scratch/syoung\
/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/novoalign/1/chr22/$LSB_JOBINDEX/out.sam

autochr22 SAM FILE SIZE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/novoalign/1/chr22

    -rw-rw-r--  1 syoung root 399M Oct 21 07:53 hit.sam


VERSUS THIS SAM FILE SIZE (874 MB):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22

    -rw-rw-rw-  1 syoung root 874M Nov  4 16:17 hit.sam

GENERATED WITH THIS COMMAND:

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/$LSB_JO\
BINDEX/novoalign-chr22-1_1.$LSB_JOBINDEX.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP0002\
39/sampled/200bp/chr22/novoalign/1/$LSB_JOBINDEX/novoalign-chr22-1_2.$LSB_JOBINDEX.txt  > /scr\
atch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/$LSB_JOB\
INDEX/out.sam



BUILD INDEX FILE:

COPY

cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/hit.bam.bkp

screen -S index-novo

time /nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/hit.bam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/hit.bam.db


    ...
    4200000
    4300000
    indexReads.pl    Reads indexed: 4385784
    indexReads.pl    Run time: 00:28:16
    indexReads.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl
    indexReads.pl    7:33PM, 4 December 2010
    indexReads.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22
/nethome/syoung/base/apps/samtools/0.1.8/samtools view -X hit.bam | less -S
[syoung@u02 chr22]$ samtools view -X hit.bam | cut -f 3 | grep -v chr22
^[[D[syoung@u02 chr2samtools idxstats /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/hit.bam
chr22   51304566        3241966 1143818
*       0       0       0
[syoung@u02 chr22]$ lines hit.sam
hit.sam: 4385784
[syoung@u02 chr22]$ 


time /nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/hit.bam.db


    4385784

    indexVenn.pl    Run time: 00:00:29
    indexVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl
    indexVenn.pl    7:45PM, 4 December 2010
    indexVenn.pl    ****************************************


CONFIRMED: NOVOALIGN IS PROVIDING ONE UNIQUE HIT PER READ





</entry>



<entry [Tue Nov 30 14:55:20 EST 2010] GENOMICS PIPELINE SNP PREDICTION >




USES samtools pileup DEFAULT ARGUMENTS:

        -f FILE   reference sequence file is in FASTA format
        -c        output the SOAPsnp consensus sequence
        -v        print variants only (for -c)

NB:

USE -A TO USE MAQ CONSENSUS ALGORITHM

USE -c TO USE SOAPsnp CONSENSUS ALGORITHM

http://soap.genomics.org.cn/soapsnp.html
SOAPsnp uses a method based on Bayes theorem (the reverse probability model) to call consensus genotype by carefully considering the data quality, alignment, and recurring experimental errors. All these kinds of information was integrated into a single quality score for each base in PHRED scale to measure the accuracy of consensus calling. Currently, it supports the alignment format of SOAPaligner.




</entry>



<entry [Tue Nov 30 15:00:09 EST 2010] CREATED SCRIPTS FOR LOCAL REALIGNMENT AROUND SNPS USING GATK>




createIntervalFiles.pl  RUN createIntervals.pl

createIntervals.pl      USE *bam TO CREATE INTERVALS AROUND SNPS AS INPUT FOR realignBam.pl

realignBam.pl           REALIGN *bam FILES USING GATK IndelRealigner AND *intervals FILES CREATED ABOVE 




RAN createIntervals.pl ON ALL SAMPLES
-------------------------------------


eland
------

ON u01

screen -S inter-eland

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl \
--window 50 \
--mode pileup \
--binlevel 2 \
--filename hit.bam \
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
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3 \
--species human \
--label eland-realign \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000
    
    createIntervalFiles.pl    Run time: 00:03:15
    createIntervalFiles.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl
    createIntervalFiles.pl    3:59PM, 3 December 2010
    createIntervalFiles.pl    ****************************************

MAQ
---

ON u02

screen -S inter-maq

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl \
--window 50 \
--mode pileup \
--binlevel 2 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--species human \
--label maq-realign \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000

    
    createIntervalFiles.pl    Run time: 00:02:08
    createIntervalFiles.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl
    createIntervalFiles.pl    3:52PM, 3 December 2010
    createIntervalFiles.pl    ****************************************



BOWTIE
------

ON u03

screen -S inter-bowtie

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl \
--window 50 \
--mode pileup \
--binlevel 2 \
--filename hit.bam \
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
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3 \
--species human \
--label bowtie-realign \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000

    createIntervalFiles.pl    Run time: 00:03:18
    createIntervalFiles.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl
    createIntervalFiles.pl    4:00PM, 3 December 2010
    createIntervalFiles.pl    ****************************************


BOWTIE-RF
---------

ON u03

screen -S inter-bowtie-rf

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl \
--window 50 \
--mode pileup \
--binlevel 2 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/33 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3 \
--species human \
--label bowtie-rf-realign \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000

    createIntervalFiles.pl    Run time: 00:02:54
    createIntervalFiles.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl
    createIntervalFiles.pl    4:02PM, 3 December 2010
    createIntervalFiles.pl    ****************************************

NOVOALIGN
---------

ON u04

screen -S inter-novoalign

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl \
--window 50 \
--mode pileup \
--binlevel 2 \
--filename hit.bam \
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
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3 \
--species human \
--label novoalign-realign \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000

    createIntervalFiles.pl    Run time: 00:02:59
    createIntervalFiles.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl
    createIntervalFiles.pl    4:01PM, 3 December 2010
    createIntervalFiles.pl    ****************************************





TEST
----

ON u02


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl \
--window 50 \
--mode pileup \
--binlevel 2 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--species human \
--label maq-realign \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000

    
    createIntervalFiles.pl    Run time: 00:00:45
    createIntervalFiles.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervalFiles.pl
    createIntervalFiles.pl    3:40PM, 3 December 2010
    createIntervalFiles.pl    ****************************************


WHICH RUNS:


/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/createIntervals.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit.binlevel2.num10-1.snp \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/1/chr22/realign/hit.binlevel2.num10.bam.intervals \
--window 50


CHECK OUTPUT FILES:

lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit.binlevel2.num10-1.snp

    426
    
lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/1/chr22/realign/hit.binlevel2.num10.bam.intervals

    302
    

head /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/1/chr22/realign/hit.binlevel2.num10.bam.intervals

    chr22:16059884-16059935
    chr22:16060144-16060245
    chr22:16062511-16062611
    chr22:16069669-16069769
    chr22:16076149-16076249
    chr22:16078689-16078790
    chr22:16079592-16079692
    chr22:16081690-16081791
    chr22:16083077-16083211
    chr22:16083454-16083554



screen -S realign-maq


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl \
--binlevel 2 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/realign \
--species human \
--label maq-realign \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000

    realignBam.pl    Run time: 01:25:48
    realignBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl
    realignBam.pl    5:00PM, 2 December 2010
    realignBam.pl    ****************************************



OUTPUT FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/realign/1/chr22

    -rw-rw-r-- 1 syoung root 218M Dec  2 15:41 hit.binlevel2.num10.bam
    -rw-rw-rw- 1 syoung root 245K Dec  2 15:23 hit.binlevel2.num10.bam.intervals
    -rw-rw-rw- 1 syoung root 256M Dec  2 16:33 hit.binlevel2.num11.bam
    -rw-rw-rw- 1 syoung root 481K Dec  2 15:22 hit.binlevel2.num11.bam.intervals
    -rw-rw-rw- 1 syoung root 361M Dec  2 17:00 hit.binlevel2.num12.bam
    -rw-rw-rw- 1 syoung root 533K Dec  2 15:22 hit.binlevel2.num12.bam.intervals
    -rw-rw-rw- 1 syoung root 289M Dec  2 16:49 hit.binlevel2.num13.bam
    -rw-rw-rw- 1 syoung root 575K Dec  2 15:23 hit.binlevel2.num13.bam.intervals
    -rw-rw-rw- 1 syoung root 188M Dec  2 16:23 hit.binlevel2.num14.bam
    -rw-rw-rw- 1 syoung root 368K Dec  2 15:23 hit.binlevel2.num14.bam.intervals

head hit.binlevel2.num10.bam.intervals

    chr22:14430048-14430071
    chr22:14430128-14430161
    chr22:14430195-14430203
    chr22:14430427-14430472
    chr22:14430744-14430779
    chr22:14430979-14431114
    chr22:14431140-14431231
    chr22:14431235-14431296
    chr22:14431330-14431331
    chr22:14431368-14431419





TEST OUTPUT
-----------

LAST READ ALIGNMENT STARTS AT THIS POSITION:

    49676289


UCSCBin::setBinsByRange    rangefile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/hit.bam.range

bins BEFORE: 

        [
          {
            'stop' => 8388608,
            'number' => 9,
            'start' => 1
          },
          {
            'stop' => 16777216,
            'number' => 10,
            'start' => 8388609
          },
          {
            'stop' => 25165824,
            'number' => 11,
            'start' => 16777217
          },
          {
            'stop' => 33554432,
            'number' => 12,
            'start' => 25165825
          },
          {
            'stop' => 41943040,
            'number' => 13,
            'start' => 33554433
          },
          {
            'stop' => 50331648,
            'number' => 14,
            'start' => 41943041
          },
          {
            'stop' => 58720256,
            'number' => 15,
            'start' => 50331649
          }
        ];

bins AFTER:

        [
          {
            'stop' => 16777216,
            'number' => 10,
            'start' => 14430000
          },
          {
            'stop' => 25165824,
            'number' => 11,
            'start' => 16777217
          },
          {
            'stop' => 33554432,
            'number' => 12,
            'start' => 25165825
          },
          {
            'stop' => 41943040,
            'number' => 13,
            'start' => 33554433
          },
          {
            'stop' => 49591399,
            'number' => 14,
            'start' => 41943041
          }
        ];


TEST BY TRYING TO RUN samtools view ON FILE USING NEW BIN START/STOP POSITIONS:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/hit.bam


REM: LAST ALIGNMENT IS HERE
49676289

samtools view -h /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/hit.bam chr22:41943041-49591399

    OK!


###\
###--clean \
###--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/realign/realignBam.binlevel2.out


WHICH RUNS

time /usr/local/java/bin/java \
-jar /nethome/syoung/base/apps/gatk/1.0.4705/GenomeAnalysisTK.jar \
-T RealignerTargetCreator \
-I /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2/chr22/bins/hit.binlevel2.num15.bam \
-R /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22.fa \
-o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/realign/chr22/hit.binlevel2.num15.bam.intervals \
-U \
-S SILENT 


ERROR:

net.sf.samtools.SAMFormatException: Invalid record length: 21840194
        at net.sf.samtools.BAMRecordCodec.decode(BAMRecordCodec.java:167)


FULL OUTPUT:

    INFO  20:13:50,807 HelpFormatter - --------------------------------------------------------------------------- 
    INFO  20:13:50,809 HelpFormatter - The Genome Analysis Toolkit (GATK) v1.0.4705, Compiled 2010/11/18 14:06:00 
    INFO  20:13:50,810 HelpFormatter - Copyright (c) 2010 The Broad Institute 
    INFO  20:13:50,810 HelpFormatter - Please view our documentation at http://www.broadinstitute.org/gsa/wiki 
    INFO  20:13:50,810 HelpFormatter - For support, please view our support site at http://getsatisfaction.com/gsa 
    INFO  20:13:50,810 HelpFormatter - Program Args: -T RealignerTargetCreator -I /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2/chr22/bins/hit.binlevel2.num15.bam -R /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22.fa -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/realign/chr22/hit.binlevel2.num15.bam.intervals -U -S SILENT  
    INFO  20:13:50,811 HelpFormatter - Date/Time: 2010/11/30 20:13:50 
    INFO  20:13:50,811 HelpFormatter - --------------------------------------------------------------------------- 
    INFO  20:13:50,811 HelpFormatter - --------------------------------------------------------------------------- 
    INFO  20:13:50,814 AbstractGenomeAnalysisEngine - Strictness is SILENT 
    INFO  20:13:50,992 GATKRunReport - Aggregating data for run report 
    ##### ERROR ------------------------------------------------------------------------------------------
    ##### ERROR stack trace 
    net.sf.samtools.SAMFormatException: Invalid record length: 21840194
            at net.sf.samtools.BAMRecordCodec.decode(BAMRecordCodec.java:167)
            at net.sf.samtools.BAMFileReader$BAMFileIterator.getNextRecord(BAMFileReader.java:466)
            at net.sf.samtools.BAMFileReader$BAMFileIterator.advance(BAMFileReader.java:440)
            at net.sf.samtools.BAMFileReader$BAMFileIterator.<init>(BAMFileReader.java:413)
            at net.sf.samtools.BAMFileReader$BAMFileIterator.<init>(BAMFileReader.java:403)
            at net.sf.samtools.BAMFileReader.getIterator(BAMFileReader.java:206)
            at net.sf.samtools.SAMFileReader.iterator(SAMFileReader.java:287)
            at org.broadinstitute.sting.gatk.datasources.simpleDataSources.SAMDataSource.seekMonolithic(SAMDataSource.java:480)
            at org.broadinstitute.sting.gatk.datasources.simpleDataSources.SAMDataSource.seek(SAMDataSource.java:396)
            at org.broadinstitute.sting.gatk.executive.MicroScheduler.getReadIterator(MicroScheduler.java:150)
            at org.broadinstitute.sting.gatk.executive.LinearMicroScheduler.execute(LinearMicroScheduler.java:56)
            at org.broadinstitute.sting.gatk.GenomeAnalysisEngine.execute(GenomeAnalysisEngine.java:103)
            at org.broadinstitute.sting.gatk.CommandLineExecutable.execute(CommandLineExecutable.java:97)
            at org.broadinstitute.sting.commandline.CommandLineProgram.start(CommandLineProgram.java:244)
            at org.broadinstitute.sting.gatk.CommandLineGATK.main(CommandLineGATK.java:87)
    ##### ERROR ------------------------------------------------------------------------------------------
    ##### ERROR A GATK RUNTIME ERROR has occurred (version 1.0.4705):
    ##### ERROR
    ##### ERROR Please visit to wiki to see if this is a known problem
    ##### ERROR If not, please post the error, with stack trace, to the GATK forum
    ##### ERROR Visit our wiki for extensive documentation http://www.broadinstitute.org/gsa/wiki
    ##### ERROR Visit our forum to view answers to commonly asked questions http://getsatisfaction.com/gsa
    ##### ERROR
    ##### ERROR MESSAGE: Invalid record length: 21840194
    ##### ERROR ------------------------------------------------------------------------------------------






UPDATE GATK
-----------

wget ftp://ftp.broadinstitute.org/pub/gsa/GenomeAnalysisTK/GenomeAnalysisTK-latest.tar.bz2

INSTALLED TO HERE:
/nethome/syoung/base/apps/gatk/1.0.4705

VIEW CONTENTS OF GATK:
t   print a table of contents
f   indicates that your are reading from a file

cd /nethome/syoung/base/apps/gatk/1.0.4705
/nethome/syoung/base/apps/java/jdk/1.6.0_22/bin/jar tf /nethome/syoung/base/apps/java/jdk/1.6.0_22/bin/


#
#INSTALL JAVA JRE + SDK
#----------------------
#
#DOWNLOAD PAGE
#http://java.sun.com/javase/downloads/index.jsp
#
#JDK INSTALLED HERE
#/nethome/syoung/base/apps/java/jdk/1.6.0_22
#
#JRE INSTALLED HERE
#/nethome/syoung/base/apps/java/jre/1.6.0_22


EXPORT ENVIRONMENT VARIABLES
----------------------------

export GATK='/nethome/syoung/base/apps/java/jdk/1.6.0_22/bin/java jar /nethome/syoung/base/apps/gatk/1.0.4705/GenomeAnalysisTK.jar'
export REF=/nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22/chr22.fa



PREPARE INPUT *bam FILE
-----------------------

mkdir -p /scratch/syoung/base/pipeline/gatk
cd /scratch/syoung/base/pipeline/gatk

cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam aln.bam



RUN GATK
--------

##1. CREATE HEADER-ONLY FILE (hsRef.dict)
##
##samtools view -H aln.bam | grep ^@SQ > hsRef.dict;
##
##head hsRef.dict 
##
##    @SQ     SN:chr22        LN:51304566
##
##    OK

1. CREATE INDEL INTERVALS FILE
Emit intervals for the Local Indel Realigner to target for cleaning.

/usr/local/java/bin/java \
-jar /nethome/syoung/base/apps/gatk/1.0.4705/GenomeAnalysisTK.jar \
-T RealignerTargetCreator \
-h

time /usr/local/java/bin/java \
-jar /nethome/syoung/base/apps/gatk/1.0.4705/GenomeAnalysisTK.jar \
-I aln.bam \
-R $REF \
-T RealignerTargetCreator \
-U \
-S SILENT \
-o realignTargets.intervals

    INFO  13:30:21,682 HelpFormatter - --------------------------------------------------------...
    INFO  13:30:21,713 AbstractGenomeAnalysisEngine - Strictness is SILENT 
    INFO  13:30:21,721 ReferenceDataSource - Index file /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22/chr22.fa.fai does not exist. Trying to create it now. 
    INFO  13:30:23,928 ReferenceDataSource - Dict file /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22/chr22.dict does not exist. Trying to create it now. 
    [Tue Nov 30 13:30:24 EST 2010] net.sf.picard.sam.CreateSequenceDictionary REFERENCE=/nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22/chr22.fa OUTPUT=/nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22/dict1420901572562735073.tmp    TRUNCATE_NAMES_AT_WHITESPACE=true NUM_SEQUENCES=2147483647 TMP_DIR=/tmp/syoung VERBOSITY=INFO QUIET=false VALIDATION_STRINGENCY=STRICT COMPRESSION_LEVEL=5 MAX_RECORDS_IN_RAM=500000 CREATE_INDEX=false CREATE_MD5_FILE=false
    [Tue Nov 30 13:30:24 EST 2010] net.sf.picard.sam.CreateSequenceDictionary done.
    Runtime.totalMemory()=158269440
    INFO  13:30:25,149 TraversalEngine - [INITIALIZATION COMPLETE; TRAVERSAL STARTING] 
    INFO  13:30:28,394 TraversalEngine - [PROGRESS] Traversed to chr22:1000000, processing 1,000,000 sites in 3.46 secs (3.46 secs per 1M sites) 
    ...
    INFO  13:33:55,668 TraversalEngine - [PROGRESS] Traversed to chr22:50999710, processing 51,000,000 sites in 210.75 secs (4.13 secs per 1M sites) 
    INFO  13:33:57,134 TraversalEngine - [PROGRESS] Traversed 51,304,860 sites in 212.21 secs (4.14 secs per 1M sites) 
    INFO  13:33:57,147 TraversalEngine - Total runtime 212.22 secs, 3.54 min, 0.06 hours 
    INFO  13:33:57,148 TraversalEngine - 0 reads were filtered out during traversal out of 2234909 total (0.00%) 
    INFO  13:33:57,175 GATKRunReport - Aggregating data for run report


head realignTargets.intervals

    chr22:16050994-16051000
    chr22:16051217-16051222
    chr22:16051270-16051277
    chr22:16051546-16051555
    chr22:16051609-16051617
    chr22:16051662-16051724
    chr22:16051777-16051778
    chr22:16051819-16051820
    chr22:16051880-16051889
    chr22:16052201-16052205




2. REALIGN READS IN MERGED INTERVALS
Perform local realignment of reads based on misalignments due to the presence of indels. Unlike most mappers, this  walker uses the full alignment context to determine whether an appropriate alternate reference (i.e. indel) exists and updates SAMRecords accordingly.


time /usr/local/java/bin/java \
-jar /nethome/syoung/base/apps/gatk/1.0.4705/GenomeAnalysisTK.jar \
-I aln.bam \
-R $REF \
-T IndelRealigner \
-targetIntervals realignTargets.intervals \
--out realigned.bam \
-U \
-S SILENT

    INFO  14:51:37,756 HelpFormatter - --------------------------------------------------------------------------- 
    INFO  14:51:37,759 HelpFormatter - The Genome Analysis Toolkit (GATK) v1.0.4705, Compiled 2010/11/18 14:06:00 
    INFO  14:51:37,759 HelpFormatter - Copyright (c) 2010 The Broad Institute 
    INFO  14:51:37,759 HelpFormatter - Please view our documentation at http://www.broadinstitute.org/gsa/wiki 
    INFO  14:51:37,760 HelpFormatter - For support, please view our support site at http://getsatisfaction.com/gsa 
    INFO  14:51:37,760 HelpFormatter - Program Args: -I aln.bam -R /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22/chr22.fa -T IndelRealigner -targetIntervals realignTargets.intervals --out realigned.bam -U -S SILENT  
    INFO  14:51:37,760 HelpFormatter - Date/Time: 2010/11/30 14:51:37 
    INFO  14:51:37,760 HelpFormatter - --------------------------------------------------------------------------- 
    INFO  14:51:37,761 HelpFormatter - --------------------------------------------------------------------------- 
    INFO  14:51:37,773 AbstractGenomeAnalysisEngine - Strictness is SILENT 
    INFO  14:51:38,432 TraversalEngine - [INITIALIZATION COMPLETE; TRAVERSAL STARTING] 
    INFO  14:52:10,416 TraversalEngine - [PROGRESS] Traversed to chr22:16212893, processing 59,670 reads in 32.12 secs (538.29 secs per 1M reads) 
    INFO  14:52:40,411 TraversalEngine - [PROGRESS] Traversed to chr22:16300004, processing 129,740 reads in 62.13 secs (478.87 secs per 1M reads) 
    INFO  14:53:11,244 TraversalEngine - [PROGRESS] Traversed to chr22:16493667, processing 164,488 reads in 92.96 secs (565.16 secs per 1M reads)     
    ...
    INFO  15:30:43,246 TraversalEngine - [PROGRESS] Traversed to chr22:50817611, processing 2,209,589 reads in 2344.96 secs (1061.27 secs per 1M reads) 
    INFO  15:31:06,323 TraversalEngine - [PROGRESS] Traversed 2,234,909 reads in 2368.04 secs (1059.57 secs per 1M reads) 
    INFO  15:31:06,335 TraversalEngine - Total runtime 2368.04 secs, 39.47 min, 0.66 hours 
    INFO  15:31:06,354 TraversalEngine - 0 reads were filtered out during traversal out of 2234909 total (0.00%) 
    INFO  15:31:41,472 GATKRunReport - Aggregating data for run report 
    
    real    40m6.195s
    user    40m5.181s
    sys     0m40.498s


THIS START CAUSES A SEGMENTATION FAULT:

49676289


LAST ENTRY:

samtools view -h /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2/chr22/hit.sorted.bam chr22:49591434-59677289

@SQ     SN:chr22        LN:51304566
SRR004111.4889312:6:241:761:529#0       83      chr22   49591399        50      36M     *       0-198     GGGAAGGAGGCTGGTGCCAGAGTGGATTCGGATTGA    21689383/6?,8E=G3I;B?IIIIIIIIEIIIIII    MF:i:130 AM:i:50  SM:i:0  NM:i:0  UQ:i:0  H0:i:0  H1:i:0


LAST ENTRY WITH FLAG AS TEXT:

samtools view -h -X /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2/chr22/hit.sorted.bam chr22:49591434-59677289

@SQ     SN:chr22        LN:51304566
SRR004111.4889312:6:241:761:529#0       pPr1    chr22   49591399        50      36M     *       0-198     GGGAAGGAGGCTGGTGCCAGAGTGGATTCGGATTGA    21689383/6?,8E=G3I;B?IIIIIIIIEIIIIII    MF:i:130 AM:i:50  SM:i:0  NM:i:0  UQ:i:0  H0:i:0  H1:i:0


LAST LINE OF SAM FILE:

tail -n 1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2/chr22/1/hit.sam
SRR002271.1210699:1:58:783:805#0        133     chr22   49591390        0       *       *       0TTTTATTTTGGATTTCTTCACATTCCTGCTTCTGTC     IIII0AHHF8H)<C?*FD+)(&?4+,0&+$4+5*+%    MF:i:192


SO THE PROBLEM IS THAT samtools view FAILS WITH A SEGMENTATION FAULT WHEN YOU ASK IT TO SHOW READS FROM A REGION THAT STARTS AFTER (MORE RIGHTWARD OF) THE LAST ALIGNED HIT.

AND IT APPEARS THERE'S NO EASY WAY TO EXTRACT THE LAST, MOST RIGHTWARD READ FROM *bam FILE.

E.G., THIS LOW LEVEL AND STILL NO ACCESS TO IT:

http://samtools.sourceforge.net/samtools/bam/CompositePage.html#//apple_ref/doc/compositePage/c/func/bam_calend


SAMTOOLS view DOES NOT PROVIDE THIS FUNCTIONALITY EITHER:

samtools view -?

Usage:   samtools view [options] <in.bam>|<in.sam> [region1 [...]]

Options: -b       output BAM
         -h       print header for the SAM output
         -H       print header only (no alignments)
         -S       input is SAM
         -u       uncompressed BAM output (force -b)
         -x       output FLAG in HEX (samtools-C specific)
         -X       output FLAG in string (samtools-C specific)
         -t FILE  list of reference names and lengths (force -S) [null]
         -T FILE  reference sequence file (force -S) [null]
         -o FILE  output file name [stdout]
         -R FILE  list of read groups to be outputted [null]
         -f INT   required flag, 0 for unset [0]
         -F INT   filtering flag, 0 for unset [0]
         -q INT   minimum mapping quality [0]
         -l STR   only output reads in library STR [null]
         -r STR   only output reads in read group STR [null]
         -?       longer help

Notes:

  1. By default, this command assumes the file on the command line is in
     the BAM format and it prints the alignments in SAM. If `-t' is
     applied, the input file is assumed to be in the SAM format. The
     file supplied with `-t' is SPACE/TAB delimited with the first two
     fields of each line consisting of the reference name and the
     corresponding sequence length. The `.fai' file generated by `faidx'
     can be used here. This file may be empty if reads are unaligned.

  2. SAM->BAM conversion: `samtools view -bT ref.fa in.sam.gz'.

  3. BAM->SAM conversion: `samtools view in.bam'.

  4. A region should be presented in one of the following formats:
     `chr1', `chr2:1,000' and `chr3:1000-2,000'. When a region is
     specified, the input alignment file must be an indexed BAM file.

  5. Option `-u' is preferred over `-b' when the output is piped to
     another samtools command.

  6. In a string FLAG, each character represents one bit with
     p=0x1 (paired), P=0x2 (properly paired), u=0x4 (unmapped),
     U=0x8 (mate unmapped), r=0x10 (reverse), R=0x20 (mate reverse)
     1=0x40 (first), 2=0x80 (second), s=0x100 (not primary), 
     f=0x200 (failure) and d=0x400 (duplicate). Note that `-x' and
     `-X' are samtools-C specific. Picard and older samtools do not
     support HEX or string flags.



SOLUTION:

1. PRE-CALCULATE RANGE AND PRINT TO hit.bam.range FILE

2. ADD setBinByRange METHOD TO UCSCBin.pm TO FILTER THE BINS ACCORDINGLY

3. alignReads.pl AND binBam.pl (THROUGH SNP.pm) CAN ACCESS A 'SAFE' SET OF BINS USING A UCSCBin INSTANCE


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/hitRange.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2/chr22/hit.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2/chr22/hit.bam.range







NOTES
-----


RealignerTargetCreator
----------------------
Emits intervals for the Local Indel Realigner to target for cleaning.  Ignores 454 and MQ0 reads.

time /usr/local/java/bin/java \
> -jar /nethome/syoung/base/apps/gatk/1.0.4705/GenomeAnalysisTK.jar \
> -T RealignerTargetCreator -h

    Arguments for RealignerTargetCreator:
     -o,--out <out>                                     An output file presented to the walker.  Will overwrite contents if 
                                                        file exists.
     -window,--windowSize <windowSize>                  window size for calculating entropy or SNP clusters
     -mismatch,--mismatchFraction <mismatchFraction>    fraction of base qualities needing to mismatch for a position to 
                                                        have high entropy; to disable set to <= 0 or > 1
     -minReads,--minReadsAtLocus <minReadsAtLocus>      minimum reads at a locus to enable using the entropy calculation
     -maxInterval,--maxIntervalSize <maxIntervalSize>   maximum interval size
     --realignReadsWithBadMates                         Should we try to realign paired-end reads whose mates map to other 
                                                        chromosomes?
    
IndelRealigner
--------------
Performs local realignment of reads based on misalignments due to the presence of indels. Unlike most mappers, this  walker uses the full alignment context to determine whether an appropriate alternate reference (i.e. indel) exists and updates SAMRecords accordingly.


Arguments for IndelRealigner:

 -targetIntervals,--targetIntervals <targetIntervals>          intervals file output from RealignerTargetCreator
 -LOD,--LODThresholdForCleaning <LODThresholdForCleaning>      LOD threshold above which the cleaner will clean
 -entropy,--entropyThreshold <entropyThreshold>                percentage of mismatches at a locus to be considered 
                                                               having high entropy
 -o,--out <out>                                                Output bam
 -compress,--bam_compression <bam_compression>                 Compression level to use for writing BAM files
 --index_output_bam_on_the_fly <index_output_bam_on_the_fly>   Create a BAM index on-the-fly while writing the resulting 
                                                               file.
 -knownsOnly,--useOnlyKnownIndels                              Don't run 'Smith-Waterman' to generate alternate 
                                                               consenses; use only known indels provided as RODs for 
                                                               constructing the alternate references.
 -maxInRam,--maxReadsInRam <maxReadsInRam>                     max reads allowed to be kept in memory at a time by the 
                                                               SAMFileWriter. If too low, the tool may run out of system 
                                                               file descriptors needed to perform sorting; if too high, 
                                                               the tool may run out of memory.
 -maxConsensuses,--maxConsensuses <maxConsensuses>             max alternate consensuses to try (necessary to improve 
                                                               performance in deep coverage)
 -greedy,--maxReadsForConsensuses <maxReadsForConsensuses>     max reads used for finding the alternate consensuses 
                                                               (necessary to improve performance in deep coverage)
 -maxReads,--maxReadsForRealignment <maxReadsForRealignment>   max reads allowed at an interval for realignment; if this 
                                                               value is exceeded, realignment is not attempted and the 
                                                               reads are passed to the output file(s) as-is
 --sortInCoordinateOrderEvenThoughItIsHighlyUnsafe             Should we sort the final bam in coordinate order even 
                                                               though it will be malformed because mate pairs of 
                                                               realigned reads will contain inaccurate information?
 --realignReadsWithBadMates                                    Should we try to realign paired-end reads whose mates map 
                                                               to other chromosomes?
 -noPG,--noPGTag                                               Don't output the usual PG tag in the realigned bam file 
                                                               header. FOR DEBUGGING PURPOSES ONLY. This option is 
                                                               required in order to pass integration tests.
 -noTags,--noOriginalAlignmentTags                             Don't output the original cigar or alignment start tags 
                                                               for each realigned read in the output bam.
 -targetNotSorted,--targetIntervalsAreNotSorted                This tool assumes that the target interval list is 
                                                               sorted; if the list turns out to be unsorted, it will 
                                                               throw an exception.  Use this argument when your interval 
                                                               list is not sorted to instruct the Realigner to first 
                                                               sort it in memory.



GATK help
---------


/usr/local/java/bin/java -jar /nethome/syoung/base/apps/gatk/1.0.4705/GenomeAnalysisTK.jar -h
---------------------------------------------------------------------------
The Genome Analysis Toolkit (GATK) v1.0.4705, Compiled 2010/11/18 14:06:00
Copyright (c) 2010 The Broad Institute
Please view our documentation at http://www.broadinstitute.org/gsa/wiki
For support, please view our support site at http://getsatisfaction.com/gsa
---------------------------------------------------------------------------
---------------------------------------------------------------------------
usage: java -jar GenomeAnalysisTK.jar -T <analysis_type> [-I <input_file>] [-SM <sample_metadata>] [-rbs <read_buffer_size>] 
       [-et <phone_home>] [-rf <read_filter>] [-L <intervals>] [-XL <excludeIntervals>] [-R <reference_sequence>] [-B 
       <rodBind>] [-BTI <rodToIntervalTrackName>] [-BTIMR <BTI_merge_rule>] [-D <DBSNP>] [-dt <downsampling_type>] [-dfrac 
       <downsample_to_fraction>] [-dcov <downsample_to_coverage>] [-OQ] [-S <validation_strictness>] [-U <unsafe>] [-nt 
       <num_threads>] [-im <interval_merging>] [-rgbl <read_group_black_list>] [-l <logging_level>] [-log <log_to_file>] 
       [-quiet] [-debug] [-h]

 -T,--analysis_type <analysis_type>                         Type of analysis to run
 -I,--input_file <input_file>                               SAM or BAM file(s)
 -SM,--sample_metadata <sample_metadata>                    Sample file(s) in JSON format
 -rbs,--read_buffer_size <read_buffer_size>                 Number of reads per SAM file to buffer in memory
 -et,--phone_home <phone_home>                              What kind of GATK run report should we generate?  Standard 
                                                            is the default, can be verbose or NO_ET so nothing is posted 
                                                            to the run repository (NO_ET|STANDARD|DEV|STDOUT)
 -rf,--read_filter <read_filter>                            Specify filtration criteria to apply to each read 
                                                            individually.
 -L,--intervals <intervals>                                 A list of genomic intervals over which to operate. Can be 
                                                            explicitly specified on the command line or in a file.
 -XL,--excludeIntervals <excludeIntervals>                  A list of genomic intervals to exclude from processing. Can 
                                                            be explicitly specified on the command line or in a file.
 -R,--reference_sequence <reference_sequence>               Reference sequence file
 -B,--rodBind <rodBind>                                     Bindings for reference-ordered data, in the form 
                                                            <name>,<type>,<file>
 -BTI,--rodToIntervalTrackName <rodToIntervalTrackName>     Indicates that the named track should be converted into an 
                                                            interval list, to drive the traversal
 -BTIMR,--BTI_merge_rule <BTI_merge_rule>                   Indicates the merging approach the interval parser should 
                                                            use to combine the BTI track with other -L options (UNION|
                                                            INTERSECTION)
 -D,--DBSNP <DBSNP>                                         DBSNP file
 -dt,--downsampling_type <downsampling_type>                Type of reads downsampling to employ at a given locus. 
                                                             Reads will be selected randomly to be removed from the pile 
                                                            based on the method described here. (NONE|ALL_READS|
                                                            BY_SAMPLE)
 -dfrac,--downsample_to_fraction <downsample_to_fraction>   Fraction [0.0-1.0] of reads to downsample to
 -dcov,--downsample_to_coverage <downsample_to_coverage>    Coverage [integer] to downsample to at any given locus; note 
                                                            that downsampled reads are randomly selected from all 
                                                            possible reads at a locus
 -OQ,--useOriginalQualities                                 If set, use the original base quality scores from the OQ tag 
                                                            when present instead of the standard scores
 -S,--validation_strictness <validation_strictness>         How strict should we be with validation (STRICT|LENIENT|
                                                            SILENT)
 -U,--unsafe <unsafe>                                       If set, enables unsafe operations: nothing will be checked 
                                                            at runtime.  For expert users only who know what they are 
                                                            doing.  We do not support usage of this argument. 
                                                            (ALLOW_UNINDEXED_BAM|ALLOW_EMPTY_INTERVAL_LIST|
                                                            ALLOW_UNSET_BAM_SORT_ORDER|NO_READ_ORDER_VERIFICATION|
                                                            ALLOW_SEQ_DICT_INCOMPATIBILITY|ALL)
 -nt,--num_threads <num_threads>                            How many threads should be allocated to running this 
                                                            analysis.
 -im,--interval_merging <interval_merging>                  What interval merging rule should we use. (ALL|
                                                            OVERLAPPING_ONLY)
 -rgbl,--read_group_black_list <read_group_black_list>      Filters out read groups matching <TAG>:<STRING> or a .txt 
                                                            file containing the filter strings one per line.
 -l,--logging_level <logging_level>                         Set the minimum level of logging, i.e. setting INFO get's 
                                                            you INFO up to FATAL, setting ERROR gets you ERROR and FATAL 
                                                            level logging.
 -log,--log_to_file <log_to_file>                           Set the logging location
 -quiet,--quiet_output_mode                                 Set the logging to quiet mode, no output to stdout
 -debug,--debug_mode                                        Set the logging file string to include a lot of debugging 
                                                            information (SLOW!)
 -h,--help                                                  Generate this help message

Available analyses:
 analyzeannotations                  
   AnalyzeAnnotations                Takes variant calls as .vcf files and creates plots of truth metrics as a function 
                                     of the various annotations found in the INFO field.
                                     
 annotator                           
   VariantAnnotator                  Annotates variant calls with context information.
                                     
 beagle                              
   BeagleOutputToVCF                 Takes files produced by Beagle imputation engine and creates a vcf with modified 
                                     annotations.
   ProduceBeagleInput                Produces an input file to Beagle imputation engine, listing genotype likelihoods 
                                     for each sample in input variant file
                                     
 coverage                            
   CallableLoci                      Emits a data file containing information about callable, uncallable, poorly mapped, 
                                     and other parts of the genome
   CoarseCoverage                    Computes the coverage per every <granularity> bases on the reference, or on the 
                                     subset of the reference specified by the intervals provided.
   CompareCallableLoci               Test routine for new VariantContext object
   DepthOfCoverage                   A parallelizable walker designed to quickly aggregate relevant coverage statistics 
                                     across samples in the input file.
                                     
 fasta                               
   FastaAlternateReferenceMaker      Generates an alternative reference sequence over the specified interval.
   FastaReferenceMaker               Renders a new reference in FASTA format consisting of only those loci provided in 
                                     the input data set.
                                     
 filters                             
   VariantFiltration                 Filters variant calls using a number of user-selectable, parameterizable criteria.
                                     
 genomicannotator                    
   GenomicAnnotator                  Annotates variant calls with information from user-specified tabular files.
   TranscriptToGenomicInfo           Takes a table of transcripts (eg.
                                     
 genotyper                           
   BatchedCallsMerger                A walker that merges multiple batches of calls, by calling into the Genotyper to 
                                     fill in sites that were called in one batch but not another.
   CreateTriggerTrack                Creates a bed-format trigger-track for the Unified Genotyper based on input variant 
                                     files.
   UnifiedGenotyper                  A variant caller which unifies the approaches of several disparate callers.
                                     
 indels                              
   IndelGenotyperV2                  This is a simple, counts-and-cutoffs based tool for calling indels from aligned 
                                     (preferrably MSA cleaned) sequencing data.
   IndelRealigner                    Performs local realignment of reads based on misalignments due to the presence of 
                                     indels.
   LeftAlignIndels                   Left aligns indels in reads.
   RealignerTargetCreator            Emits intervals for the Local Indel Realigner to target for cleaning.
                                     
 phasing                             
   MergeSegregatingAlternateAlleles  Walks along all variant ROD loci, and merges consecutive sites if they segregate in 
                                     all samples in the ROD.
   ReadBackedPhasing                 Walks along all variant ROD loci, caching a user-defined window of VariantContext 
                                     sites, and then finishes phasing them when they go out of range (using upstream and 
                                     downstream reads).
                                     
 qc                                  
   CountLoci                         Walks over the input data set, calculating the total number of covered loci for 
                                     diagnostic purposes.
   CountPairs                        Counts the number of read pairs encountered in a file sorted in query name order.
   CountReads                        Walks over the input data set, calculating the number of reads seen for diagnostic 
                                     purposes.
   CountRod                          Prints out counts of the number of reference ordered data objects are each locus 
                                     for debugging RodWalkers.
   CountRodByRef                     Prints out counts of the number of reference ordered data objects are each locus 
                                     for debugging RefWalkers.
   CycleQuality                      Walks over the input data set, calculating the number of reads seen for diagnostic 
                                     purposes.
   PrintLocusContext                 At each locus in the input data set, prints the reference base, genomic location, 
                                     and all aligning reads in a compact but human-readable form.
   ReadClippingStats                 Walks over the input reads, printing out statistics about the read length, number 
                                     of clipping events, and length of the clipping to the output stream.
   ReadValidation                    Checks all reads passed through the system to ensure that the same read is not 
                                     passed to the walker multiple consecutive times.
   ValidatingPileup                  At every locus in the input set, compares the pileup data (reference base, aligned 
                                     base from each overlapping read, and quality score) to the reference pileup data 
                                     generated by samtools.
                                     
 recalibration                       
   CountCovariates                   First pass of the recalibration. Generates recalibration table based on various 
                                     user-specified covariates (such as reported quality score, cycle, and 
                                     dinucleotide).
   TableRecalibration                Second pass of the recalibration. Uses the table generated by CountCovariates to 
                                     update the base quality scores of the input bam file using a sequential table 
                                     calculation making the base quality scores more accurately reflect the actual 
                                     quality of the bases as mesaured by reference mismatch rate.
                                     
 sequenom                            
   CreateSequenomMask                Create a mask for use with the PickSequenomProbes walker.
   PickSequenomProbes                Generates Sequenom probe information given a single variant track.
                                     
 varianteval                         
   VariantEval                       General-purpose tool for variant evaluation (% in dbSNP, genotype concordance, 
                                     Ts/Tv ratios, and a lot more)
                                     
 variantrecalibration                
   ApplyVariantCuts                  Applies cuts to the input vcf file (by adding filter lines) to achieve the desired 
                                     novel FDR levels which were specified during VariantRecalibration
   GenerateVariantClusters           Takes variant calls as .vcf files, learns a Gaussian mixture model over the variant 
                                     annotations producing calibrated variant cluster parameters which can be applied to 
                                     other datasets
   VariantRecalibrator               Applies calibrated variant cluster parameters to variant calls to produce an 
                                     accurate and informative variant quality score
                                     
 variantutils                        
   CombineVariants                   Combines VCF records from different sources; supports both full merges and set 
                                     unions.
   FilterLiftedVariants              Filters a lifted-over VCF file for ref bases that have been changed.
   LeftAlignVariants                 Left-aligns indels from a variants file.
   LiftoverVariants                  Lifts a VCF file over from one build to another.
   SelectVariants                    Takes a VCF file, selects variants based on sample(s) in which it was found and/or 
                                     on various annotation criteria, recompute the value of certain annotations based on 
                                     the new sample set, and output a new VCF with the results.
   ValidateVariants                  Validates a variants file.
   VariantsToTable                   Emits specific fields as dictated by the user from one or more VCF files.
   VariantValidationAssessor         Converts Sequenom files to a VCF annotated with QC metrics (HW-equilibrium, % 
                                     failed probes)
                                     
 walkers                             Runs the desired analysis on the smallest meaningful subset of the dataset.
   ClipReads                         This ReadWalker provides simple, yet powerful read clipping capabilities.
   FlagStat                          A reimplementation of the 'samtools flagstat' subcommand in the GATK.
   Pileup                            Prints the alignment in the pileup format.
   PrintReads                        Renders, in SAM/BAM format, all reads from the input data set in the order in which 
                                     they appear in the input file.
   PrintRODs                         Prints out all of the RODs in the input data set.
   SplitSamFile                      Divides the input data set into separate BAM files, one for each sample in the 
                                     input data set.
   VariantsToVCF                     Converts variants from other file formats to VCF format.
   


TROUBLESHOOTING BAM COVERAGE
----------------------------



http://www.broadinstitute.org/gsa/wiki/index.php/Frequently_Asked_Questions#How_can_I_tell_if_my_BAM_file_has_read_group_and_sample_information.3F





How can I tell if my BAM file has read group and sample information?
A quick Unix command using Samtools will do the trick:
$ samtools view -H /path/to/my.bam | grep '^@RG'
@RG	ID:0	PL:solid	PU:Solid0044_20080829_1_Pilot1_Ceph_12414_B_lib_1_2Kb_MP_Pilot1_Ceph_12414_B_lib_1_2Kb_MP	LB:Lib1	PI:2750	DT:2008-08-28T20:00:00-0400	SM:NA12414	CN:bcm
@RG	ID:1	PL:solid	PU:0083_BCM_20080719_1_Pilot1_Ceph_12414_B_lib_1_2Kb_MP_Pilot1_Ceph_12414_B_lib_1_2Kb_MP	LB:Lib1	PI:2750	DT:2008-07-18T20:00:00-0400	SM:NA12414	CN:bcm
@RG	ID:2	PL:LS454	PU:R_2008_10_02_06_06_12_FLX01080312_retry	LB:HL#01_NA11881	PI:0	SM:NA11881	CN:454MSC
@RG	ID:3	PL:LS454	PU:R_2008_10_02_06_07_08_rig19_retry	LB:HL#01_NA11881	PI:0	SM:NA11881	CN:454MSC
@RG	ID:4	PL:LS454	PU:R_2008_10_02_17_50_32_FLX03080339_retry	LB:HL#01_NA11881	PI:0	SM:NA11881	CN:454MSC
...
The presence of the '@RG' tags indicate the presence of read groups. Each read group has a "SM" tag, indicating the sample from which the reads belonging to that read group originate.
In addition to the presence of a read group in the header, each read must belong to one and only one read group. Given the following example reads,
$ samtools view /path/to/my.bam | grep '^@RG'
EAS139_44:2:61:681:18781	35	1	1	0	51M	=	9	59	TAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA	B<>;==?=?<==?=?=>>?>><=<?=?8<=?>?<:=?>?<==?=>:;<?:=	RG:Z:4	MF:i:18	Aq:i:0	NM:i:0	UQ:i:0	H0:i:85	H1:i:31
EAS139_44:7:84:1300:7601	35	1	1	0	51M	=	12	62	TAACCCTAAGCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA	G<>;==?=?&=>?=?<==?>?<>>?=?<==?>?<==?>?1==@>?;<=><;	RG:Z:3	MF:i:18	Aq:i:0	NM:i:1	UQ:i:5	H0:i:0	H1:i:85
EAS139_44:8:59:118:13881	35	1	1	0	51M	=	2	52	TAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA	@<>;<=?=?==>?>?<==?=><=>?-?;=>?:><==?7?;<>?5?<<=>:;	RG:Z:1	MF:i:18	Aq:i:0	NM:i:0	UQ:i:0	H0:i:85	H1:i:31
EAS139_46:3:75:1326:2391	35	1	1	0	51M	=	12	62	TAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAACCCTAA	@<>==>?>@???B>A>?>A?A>??A?@>?@A?@;??A>@7>?>>@:>=@;@	RG:Z:0	MF:i:18	Aq:i:0	NM:i:0	UQ:i:0	H0:i:85	H1:i:31
...
membership in a read group is specified by the 'RG:Z:*' tag. For instance, the first read belongs to read group 4 (sample NA11881), while the last read shown here belongs to read group 2 (sample NA12414).
My BAM file doesn't have read group and sample information. Do I really need it?
Yes! Many algorithms in the GATK need to know that certain reads were sequenced together on a specific lane, as they attempt to compensate for variability from one sequencing run to the next. Others need to know that the data represents not just one, but many samples. Without the read group and sample information, the GATK has no way of determining this critical information.
My BAM file doesn't have read group and sample information. How do I add it?
See this post on our help forum for information on how to add read group information to a file where it is absent.


POST
http://getsatisfaction.com/gsa/topics/the_unified_genotyper_complains_about_a_missing_read_group


ADD THIS TO BAM HEADER:

@RG ID:SRR001101 PL:LS454 PU:2008-04-12.1300-FLX10070255 LB:4WG_HSAP.TG_001A PI:2750 SM:NA12878 CN:BCM

ADD THIS TO READS:
RG:Z:SRR001101



Ginger replied 7 months ago
Hi,

I downloaded 2 samples from 1000 genomes: NA12878.chrom21.LS454.ssaha2.SRP000032.20091216.bam
NA18615.chrom21.LS454.ssaha2.SRP000033.20091216.bam

Yesterday I ran UnifiedGenotyper successfully with NA18615 by adding 
@HD VN:1.0
@SQ SN:21 LN:48129895
@RG ID:SRR006049 SM:NA18615
and every read has RG tag. Then I tried to do the same thing for NA12878, I found that each read has different read group in NA12878 while in NA18615 all read has same RG tag which is SRR006049. So I use SRR003175 which is the read group of the first read to put in for @RG ID: and ran UnifiedGenotyper.


Eric Banks, Official Rep, replied 7 months ago
Hi Ginger,

You need to have an @RG tag for each read group in the bam.

1. It fails for NA12878 because you've only added the RG tag for one read group.
2. It's probably not a different read group for each read, but only looks that way. It is possible that the bam is a merge from many, many different lanes.
3. Yes; or you can just use "--assume_single_sample_reads NA12878"
4. See #1.

Good luck!



GATK PIPELINE EXAMPLE
---------------------

JAVA_CMD = java Xmx4096m jar <path to GenomeAnalysisTK.jar>
REF = reference fasta file
(e.g. /seq/references/Homo_sapiens_assembly18/v0/Homo_sapiens_assembly18.fasta)


1. Determine small intervals to clean

JAVA_CMD \
-T RealignerTargetCreator \
-R REF \
I <my_reads.recal.bam> \
-o <target.intervals>


2. Realignment

JAVA_CMD -R REF \
-l INFO \
-T IntervalCleaner \
I <my_reads.recal.bam> \
-L <target.intervals> \
-O <cleaned.bam> \
-cleanedOnly [-compress 1]


3. Reconstitute original BAM

JAVA_CMD
-T CleanedReadInjector \
-R REF \
I <my_reads.recal.bam> \
--cleaned_reads <cleaned.bam> \
--output_bam <final.cleaned.bam> \
[-compress 1]



Support Protocol 2: Local Realignment
http://sourceforge.net/apps/mediawiki/samtools/index.php?title=SAM_protocol#Support_Protocol_2:_Local_Realignment

Samtools calls short indels with local realignment, but it does not write a modified BAM file after the realignment. The GATK though provides such a tool that realigns reads in regions with suspected indel artifacts and generates a BAM with cleaned alignments.

Collect regions around potential indels and clusters of mismatches:

samtools view -H aln.bam | grep ^@SQ > hsRef.dict;
java -jar GenomeAnalysisTK.jar -I aln.bam -R hsRef.fa -T IndelIntervals -U -S SILENT -o indelIntv.txt;
java -jar GenomeAnalysisTK.jar -I aln.bam -R hsRef.fa -T MismatchIntervals -U -S SILENT -o mmIntv.txt

Merge intervals:

java -jar GenomeAnalysisTK.jar -I aln.bam -R hsRef.fa -T IntervalMerger -U -S SILENT \
          --intervalsToMerge indelIntv.txt --intervalsToMerge mmIntv.txt -o mergedIntv.txt

Realign reads overlapping specified regions:
java -jar GenomeAnalysisTK.jar -I aln.bam -R hsRef.fa -T IntervalCleaner -L mergedIntv.txt -U -S SILENT \
          --OutputCleanedReadsOnly --OutputCleaned cleaned.bam --OutputIndels rawIndel.txt
Write the cleaned alignment file:
java -jar GenomeAnalysisTK.jar -I aln.bam -R hsRef.fa -T CleanedReadInjector --cleaned_reads cleaned.bam \
          -U -S SILENT --output_bam alnReAln.bam






</entry>



<entry [Tue Nov 30 13:20:01 EST 2010] FIXED MAQ::cumulativeMergeSam BY LINKING TO maq2sam-long IN misc DIR>




cd /nethome/bioinfo/apps/samtools/0.1.8
ln -s misc/maq2sam-long maq2sam-long
ln -s misc/maq2sam-short maq2sam-short


</entry>



<entry [Tue Nov 30 12:58:42 EST 2010] COPY FILES TO /ngs/bioinfo>




ELAND
-----

4. COPY TO /ngs/bioinfo

screen -S cp-eland
mkdir -p /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22
cp -r /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/* /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22

    
    


MAQ
---

screen -S cp-maq
mkdir -p /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22
cp -r /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/*bam /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22

    
    RUNNING Wed Dec  1 12:02:44 EST 2010


BOWTIE
------

screen -S cp-bowtie
mkdir -p /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22
cp -r /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/* ll

    OK


BOWTIE-RF
---------

screen -S cp-bowtie-rf
mkdir -p /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22
cp -r /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/* /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22

    OK


NOVOALIGN
---------

screen -S cp-novoalign
mkdir -p /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22
cp -r /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/* /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22

    OK




</entry>



<entry [Tue Nov 30 12:57:42 EST 2010] RUN unbinSnp.pl FOR ALL RUNS>



- CONCATENATE MERGED BAM SNP FILES INTO hit-N.snp FILE

ELAND
-----

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl \
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
--filename hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2
    
    unbinSnp.pl    Run time: 00:00:40
    unbinSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl
    unbinSnp.pl    11:43AM, 6 December 2010
    unbinSnp.pl    ****************************************


OUTPUT FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22
ll hit-*snp

    -rw-rw-rw- 1 syoung root 635K Nov 29 20:12 hit-1.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov 29 20:12 hit-2.snp
    -rw-rw-rw- 1 syoung root 1.5M Nov 29 20:12 hit-3.snp
    -rw-rw-rw- 1 syoung root 1.7M Nov 29 20:12 hit-4.snp
    -rw-rw-rw- 1 syoung root 1.9M Nov 29 20:12 hit-5.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-6.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov 29 20:12 hit-7.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-8.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-9.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-10.snp
    -rw-rw-rw- 1 syoung root 2.5M Nov 29 20:12 hit-11.snp
    -rw-rw-rw- 1 syoung root 2.5M Nov 29 20:12 hit-12.snp
    -rw-rw-rw- 1 syoung root 2.5M Nov 29 20:12 hit-13.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-14.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-15.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-16.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-17.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-18.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-19.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-20.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-21.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-22.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov 29 20:12 hit-23.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov 29 20:12 hit-24.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov 29 20:12 hit-25.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-26.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-27.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-28.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-29.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-30.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-31.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-32.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-33.snp


WHICH ARE IDENTICAL TO cumulative SNP FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22
ll hit-*snp


    -rw-rw-rw- 1 syoung root 635K Nov 29 20:12 hit-1.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov 29 20:12 hit-2.snp
    -rw-rw-rw- 1 syoung root 1.5M Nov 29 20:12 hit-3.snp
    -rw-rw-rw- 1 syoung root 1.7M Nov 29 20:12 hit-4.snp
    -rw-rw-rw- 1 syoung root 1.9M Nov 29 20:12 hit-5.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-6.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov 29 20:12 hit-7.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-8.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-9.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-10.snp
    -rw-rw-rw- 1 syoung root 2.5M Nov 29 20:12 hit-11.snp
    -rw-rw-rw- 1 syoung root 2.5M Nov 29 20:12 hit-12.snp
    -rw-rw-rw- 1 syoung root 2.5M Nov 29 20:12 hit-13.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-14.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-15.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-16.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov 29 20:12 hit-17.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-18.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-19.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-20.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-21.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov 29 20:12 hit-22.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov 29 20:12 hit-23.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov 29 20:12 hit-24.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov 29 20:12 hit-25.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-26.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-27.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-28.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-29.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-30.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-31.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-32.snp
    -rw-rw-rw- 1 syoung root 2.1M Nov 29 20:12 hit-33.snp


NOTE THAT AUTOCHR22 OUTPUT FILES ARE MESSED UP: 

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ll hit-*snp

    -rw-rw-r-- 1 syoung root 1.5M Oct 21 12:51 hit-1.snp
    
    -rw-rw-r-- 1 syoung root 1.4M Oct 21 12:51 hit-3.snp
    -rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-4.snp
    -rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-5.snp
    -rw-rw-r-- 1 syoung root 2.0M Oct 21 12:51 hit-6.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-7.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-8.snp
    -rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-9.snp
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




MAQ
---

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--filename hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2
    
    unbinSnp.pl    Run time: 00:00:42
    unbinSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl
    unbinSnp.pl    10:51AM, 6 December 2010
    unbinSnp.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22
ll hit-*snp

    -rw-rw-rw- 1 syoung root  974K Dec  6 10:50 hit-10.snp
    -rw-rw-rw- 1 syoung root 1018K Dec  6 10:50 hit-11.snp
    -rw-rw-rw- 1 syoung root  1.1M Dec  6 10:50 hit-12.snp
    -rw-rw-rw- 1 syoung root  1.1M Dec  6 10:50 hit-13.snp
    -rw-rw-rw- 1 syoung root  1.2M Dec  6 10:50 hit-14.snp
    -rw-rw-rw- 1 syoung root  1.2M Dec  6 10:50 hit-15.snp
    -rw-rw-rw- 1 syoung root  1.2M Dec  6 10:50 hit-16.snp
    -rw-rw-rw- 1 syoung root  1.2M Dec  6 10:50 hit-17.snp
    -rw-rw-rw- 1 syoung root  1.3M Dec  6 10:50 hit-18.snp
    -rw-rw-rw- 1 syoung root  1.3M Dec  6 10:50 hit-19.snp
    -rw-rw-rw- 1 syoung root  1.1M Dec  6 10:50 hit-1.snp
    -rw-rw-rw- 1 syoung root  1.3M Dec  6 10:50 hit-20.snp
    -rw-rw-rw- 1 syoung root  1.4M Dec  6 10:50 hit-21.snp
    -rw-rw-rw- 1 syoung root  1.4M Dec  6 10:50 hit-22.snp
    -rw-rw-rw- 1 syoung root  1.4M Dec  6 10:50 hit-23.snp
    -rw-rw-rw- 1 syoung root  1.4M Dec  6 10:50 hit-24.snp
    -rw-rw-rw- 1 syoung root  1.5M Dec  6 10:50 hit-25.snp
    -rw-rw-rw- 1 syoung root  1.5M Dec  6 10:50 hit-26.snp
    -rw-rw-rw- 1 syoung root  1.5M Dec  6 10:50 hit-27.snp
    -rw-rw-rw- 1 syoung root  1.5M Dec  6 10:50 hit-28.snp
    -rw-rw-rw- 1 syoung root  1.5M Dec  6 10:50 hit-29.snp
    -rw-rw-rw- 1 syoung root  1.5M Dec  6 10:50 hit-2.snp
    -rw-rw-rw- 1 syoung root  1.5M Dec  6 10:50 hit-30.snp
    -rw-rw-rw- 1 syoung root  1.5M Dec  6 10:50 hit-31.snp
    -rw-rw-rw- 1 syoung root  1.5M Dec  6 10:50 hit-32.snp
    -rw-rw-rw- 1 syoung root  1.6M Dec  6 10:50 hit-33.snp
    -rw-rw-rw- 1 syoung root  1.3M Dec  6 10:50 hit-3.snp
    -rw-rw-rw- 1 syoung root  1.1M Dec  6 10:50 hit-4.snp
    -rw-rw-rw- 1 syoung root  955K Dec  6 10:50 hit-5.snp
    -rw-rw-rw- 1 syoung root  902K Dec  6 10:50 hit-6.snp
    -rw-rw-rw- 1 syoung root  884K Dec  6 10:50 hit-7.snp
    -rw-rw-rw- 1 syoung root  899K Dec  6 10:50 hit-8.snp
    -rw-rw-rw- 1 syoung root  941K Dec  6 10:50 hit-9.snp


BOWTIE
------

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl \
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
--filename hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2
    
    unbinSnp.pl    Run time: 00:14:05
    unbinSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl
    unbinSnp.pl    11:07AM, 6 December 2010
    unbinSnp.pl    ****************************************




cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/
ll hit-*snp
    
    -rw-rw-rw- 1 syoung root 4.8M Dec  6 10:53 hit-1.snp
    -rw-rw-rw- 1 syoung root 7.1M Dec  6 10:53 hit-2.snp
    -rw-rw-rw- 1 syoung root 8.9M Dec  6 10:53 hit-3.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:53 hit-4.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-5.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-6.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:53 hit-7.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:53 hit-8.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:53 hit-9.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:53 hit-10.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:53 hit-11.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:10 hit-12.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:10 hit-13.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:10 hit-14.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:10 hit-15.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:10 hit-16.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:10 hit-17.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:10 hit-18.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:10 hit-19.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-20.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-21.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-22.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-23.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-24.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-25.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-26.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-27.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-28.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:53 hit-29.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:53 hit-30.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:53 hit-31.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:53 hit-32.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:53 hit-33.snp



BOWTIE-RF
---------

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/33 \
--filename hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2

    unbinSnp.pl    Run time: 00:00:42
    unbinSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl
    unbinSnp.pl    10:55AM, 6 December 2010
    unbinSnp.pl    ****************************************


OUTPUT FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22
ll hit-*snp

    -rw-rw-rw- 1 syoung root 4.8M Dec  6 10:55 hit-1.snp
    -rw-rw-rw- 1 syoung root 7.1M Dec  6 10:55 hit-2.snp
    -rw-rw-rw- 1 syoung root 8.9M Dec  6 10:55 hit-3.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:55 hit-4.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-5.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-6.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-7.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-8.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-9.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-10.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-11.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-12.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-13.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-14.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-15.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-16.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-17.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-18.snp
    -rw-rw-rw- 1 syoung root  13M Dec  6 10:55 hit-19.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-20.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-21.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-22.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-23.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-24.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-25.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-26.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-27.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-28.snp
    -rw-rw-rw- 1 syoung root  12M Dec  6 10:55 hit-29.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:55 hit-30.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:55 hit-31.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:55 hit-32.snp
    -rw-rw-rw- 1 syoung root  11M Dec  6 10:55 hit-33.snp


NOVOALIGN
---------


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl \
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
--filename hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--binlevel 2
    
    unbinSnp.pl    Run time: 00:00:43
    unbinSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbinSnp.pl
    unbinSnp.pl    10:55AM, 6 December 2010
    unbinSnp.pl    ****************************************


OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22
    
    -rw-rw-rw- 1 syoung root 1.5M Dec  6 10:55 hit-1.snp
    -rw-rw-rw- 1 syoung root 2.3M Dec  6 10:55 hit-2.snp
    -rw-rw-rw- 1 syoung root 3.0M Dec  6 10:55 hit-3.snp
    -rw-rw-rw- 1 syoung root 3.5M Dec  6 10:55 hit-4.snp
    -rw-rw-rw- 1 syoung root 4.0M Dec  6 10:55 hit-5.snp
    -rw-rw-rw- 1 syoung root 4.4M Dec  6 10:55 hit-6.snp
    -rw-rw-rw- 1 syoung root 4.7M Dec  6 10:55 hit-7.snp
    -rw-rw-rw- 1 syoung root 5.1M Dec  6 10:55 hit-8.snp
    -rw-rw-rw- 1 syoung root 5.4M Dec  6 10:55 hit-9.snp
    -rw-rw-rw- 1 syoung root 5.7M Dec  6 10:55 hit-10.snp
    -rw-rw-rw- 1 syoung root 6.0M Dec  6 10:55 hit-11.snp
    -rw-rw-rw- 1 syoung root 6.3M Dec  6 10:55 hit-12.snp
    -rw-rw-rw- 1 syoung root 6.5M Dec  6 10:55 hit-13.snp
    -rw-rw-rw- 1 syoung root 6.7M Dec  6 10:55 hit-14.snp
    -rw-rw-rw- 1 syoung root 6.9M Dec  6 10:55 hit-15.snp
    -rw-rw-rw- 1 syoung root 7.1M Dec  6 10:55 hit-16.snp
    -rw-rw-rw- 1 syoung root 7.3M Dec  6 10:55 hit-17.snp
    -rw-rw-rw- 1 syoung root 7.4M Dec  6 10:55 hit-18.snp
    -rw-rw-rw- 1 syoung root 7.6M Dec  6 10:55 hit-19.snp
    -rw-rw-rw- 1 syoung root 7.7M Dec  6 10:55 hit-20.snp
    -rw-rw-rw- 1 syoung root 7.8M Dec  6 10:55 hit-21.snp
    -rw-rw-rw- 1 syoung root 8.0M Dec  6 10:55 hit-22.snp
    -rw-rw-rw- 1 syoung root 8.1M Dec  6 10:55 hit-23.snp
    -rw-rw-rw- 1 syoung root 8.2M Dec  6 10:55 hit-24.snp
    -rw-rw-rw- 1 syoung root 8.3M Dec  6 10:55 hit-25.snp
    -rw-rw-rw- 1 syoung root 8.4M Dec  6 10:55 hit-26.snp
    -rw-rw-rw- 1 syoung root 8.4M Dec  6 10:55 hit-27.snp
    -rw-rw-rw- 1 syoung root 8.5M Dec  6 10:55 hit-28.snp
    -rw-rw-rw- 1 syoung root 8.5M Dec  6 10:55 hit-29.snp
    -rw-rw-rw- 1 syoung root 8.6M Dec  6 10:55 hit-30.snp
    -rw-rw-rw- 1 syoung root 8.6M Dec  6 10:55 hit-31.snp
    -rw-rw-rw- 1 syoung root 8.7M Dec  6 10:55 hit-32.snp
    -rw-rw-rw- 1 syoung root 8.7M Dec  6 10:55 hit-33.snp



</entry>



