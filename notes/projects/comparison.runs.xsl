project.comparison.runs



<entry [Thu 2011:03:10 12:37:21 EST] GENERATE WIGGLE FILES FROM BAM WITH BEDTOOLS>


genomeCoverageBed -split -bg -ibam accepted_hits.sorted.bam -g dm3.chrom.sizes > accepted_hits.bedgraph

wigToBigWig accepted_hits.bedgraph dm3.chrom.sizes myfile.bw
    
</entry>


<entry [Wed 2011:03:09 08:33:46 EST] REFACTORED SNP.pm TO INCLUDE chunks, RAN bamToSnp.pl TO COMPLETE NOVOALIGN>
    
TEST RUNS


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
 --replicates 28-33 \
 --loop parallel \
 --executable /nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative \
--maxdepth 500 \
--binlevel 500000 \
--filename hit.bam \
--species human \
--maxjobs 2000 \
--walltime 48 \
--queue small \
--cluster LSF \
--chunksize 10000 \
 --cluster LSF \
 --stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/bamtosnp.out \
 --loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/loop-bamtosnp.28-33.out 




FILE 27

/nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative \
--maxdepth 500 \
--binlevel 500000 \
--filename hit.bam \
--species human \
--maxjobs 2000 \
--walltime 48 \
--queue small \
--cluster LSF \
--chunksize 10000



FILE 26

/nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative \
--maxdepth 500 \
--binlevel 500000 \
--filename hit.bam \
--species human \
--maxjobs 2000 \
--walltime 48 \
--queue small \
--cluster LSF \
--chunksize 10000


NB: INVESTIGATE BIN 33, CHUNK 16

TOOK THE LONGEST TIME TO FINISH

    < output from stdout >>
    LS_JOBID: 
    LS_JOBPID:  29691
    LSB_JOBINDEX:  0
    LSB_JOBNAME:  /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/26/chr22/scripts/chunkCommand-chr22-indir26-bin33-chunk16.sh
    LSB_QUEUE:  small
    LSFUSER:  syoung
    LSB_JOB_EXECUSER:  syoung
    HOSTNAME:  n0051.pegasus.edu
    LSB_HOSTS:  n0051
    LSB_ERRORFILE: 
    LSB_JOBFILENAME:  /scratch/lsf_spool/1299743312.3444052
    LD_LIBRARY_PATH:  /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib
    [bam_sort_core] merging from 9 files...
    
    real	10m23.884s
    user	9m49.571s
    sys	0m9.884s
    
    real	0m25.970s
    user	0m25.197s
    sys	0m0.678s


... AND HAD ABOUT HALF THE ALIGNMENT HITS OF THE WHOLE BIN REGION:


    -rw-rw-rw-  1 syoung root 4.2M Mar 10 00:05 hit.binlevel500000.num33-26.chunk10.bam
    -rw-rw-rw-  1 syoung root  14M Mar 10 00:05 hit.binlevel500000.num33-26.chunk11.bam
    -rw-rw-rw-  1 syoung root  25M Mar 10 00:05 hit.binlevel500000.num33-26.chunk12.bam
    -rw-rw-rw-  1 syoung root 8.0M Mar 10 00:05 hit.binlevel500000.num33-26.chunk13.bam
    -rw-rw-rw-  1 syoung root  20M Mar 10 00:05 hit.binlevel500000.num33-26.chunk14.bam
    -rw-rw-rw-  1 syoung root 6.2M Mar 10 00:05 hit.binlevel500000.num33-26.chunk15.bam
==> -rw-rw-rw-  1 syoung root 1.4G Mar 10 00:11 hit.binlevel500000.num33-26.chunk16.bam
    -rw-rw-rw-  1 syoung root  23M Mar 10 00:06 hit.binlevel500000.num33-26.chunk17.bam
    -rw-rw-rw-  1 syoung root 9.9M Mar 10 00:05 hit.binlevel500000.num33-26.chunk18.bam
    -rw-rw-rw-  1 syoung root 7.8M Mar 10 00:05 hit.binlevel500000.num33-26.chunk19.bam
    -rw-rw-r--  1 syoung root  19M Mar 10 00:05 hit.binlevel500000.num33-26.chunk1.bam
    -rw-rw-rw-  1 syoung root  17M Mar 10 00:05 hit.binlevel500000.num33-26.chunk20.bam
    -rw-rw-rw-  1 syoung root  13M Mar 10 00:05 hit.binlevel500000.num33-26.chunk21.bam
    -rw-rw-rw-  1 syoung root  11M Mar 10 00:05 hit.binlevel500000.num33-26.chunk22.bam
    -rw-rw-rw-  1 syoung root  12M Mar 10 00:05 hit.binlevel500000.num33-26.chunk23.bam
    -rw-rw-rw-  1 syoung root 4.2M Mar 10 00:05 hit.binlevel500000.num33-26.chunk24.bam
    -rw-rw-rw-  1 syoung root  19M Mar 10 00:05 hit.binlevel500000.num33-26.chunk25.bam
    -rw-rw-rw-  1 syoung root  11M Mar 10 00:05 hit.binlevel500000.num33-26.chunk26.bam
    -rw-rw-rw-  1 syoung root 9.4M Mar 10 00:05 hit.binlevel500000.num33-26.chunk27.bam
    -rw-rw-rw-  1 syoung root 8.2M Mar 10 00:05 hit.binlevel500000.num33-26.chunk28.bam
    -rw-rw-rw-  1 syoung root 3.7M Mar 10 00:05 hit.binlevel500000.num33-26.chunk29.bam
    -rw-rw-rw-  1 syoung root  14M Mar 10 00:05 hit.binlevel500000.num33-26.chunk2.bam
    -rw-rw-rw-  1 syoung root  65M Mar 10 00:05 hit.binlevel500000.num33-26.chunk30.bam
    -rw-rw-rw-  1 syoung root  12M Mar 10 00:05 hit.binlevel500000.num33-26.chunk31.bam
    -rw-rw-rw-  1 syoung root 9.7M Mar 10 00:05 hit.binlevel500000.num33-26.chunk32.bam
    -rw-rw-rw-  1 syoung root 9.3M Mar 10 00:05 hit.binlevel500000.num33-26.chunk33.bam
    -rw-rw-rw-  1 syoung root 8.2M Mar 10 00:05 hit.binlevel500000.num33-26.chunk34.bam
    -rw-rw-rw-  1 syoung root  19M Mar 10 00:05 hit.binlevel500000.num33-26.chunk35.bam
    -rw-rw-rw-  1 syoung root 6.0M Mar 10 00:05 hit.binlevel500000.num33-26.chunk36.bam
    -rw-rw-rw-  1 syoung root  12M Mar 10 00:05 hit.binlevel500000.num33-26.chunk37.bam
    -rw-rw-rw-  1 syoung root 8.5M Mar 10 00:05 hit.binlevel500000.num33-26.chunk38.bam
    -rw-rw-rw-  1 syoung root  82M Mar 10 00:05 hit.binlevel500000.num33-26.chunk39.bam
    -rw-rw-rw-  1 syoung root 9.8M Mar 10 00:05 hit.binlevel500000.num33-26.chunk3.bam
    -rw-rw-rw-  1 syoung root  14M Mar 10 00:05 hit.binlevel500000.num33-26.chunk40.bam
    -rw-rw-rw-  1 syoung root 7.7M Mar 10 00:05 hit.binlevel500000.num33-26.chunk41.bam
    -rw-rw-rw-  1 syoung root  56M Mar 10 00:05 hit.binlevel500000.num33-26.chunk42.bam
    -rw-rw-rw-  1 syoung root  48M Mar 10 00:05 hit.binlevel500000.num33-26.chunk43.bam
    -rw-rw-rw-  1 syoung root 7.5M Mar 10 00:05 hit.binlevel500000.num33-26.chunk44.bam
    -rw-rw-rw-  1 syoung root 5.0K Mar 10 00:05 hit.binlevel500000.num33-26.chunk45.bam
    -rw-rw-rw-  1 syoung root 8.0M Mar 10 00:05 hit.binlevel500000.num33-26.chunk4.bam
    -rw-rw-rw-  1 syoung root 4.5M Mar 10 00:05 hit.binlevel500000.num33-26.chunk5.bam
    -rw-rw-rw-  1 syoung root 6.5M Mar 10 00:05 hit.binlevel500000.num33-26.chunk6.bam
    -rw-rw-rw-  1 syoung root  18M Mar 10 00:05 hit.binlevel500000.num33-26.chunk7.bam
    -rw-rw-rw-  1 syoung root  19M Mar 10 00:05 hit.binlevel500000.num33-26.chunk8.bam
    -rw-rw-rw-  1 syoung root 9.6M Mar 10 00:05 hit.binlevel500000.num33-26.chunk9.bam




TWO REMAINING JOBS:



<< output from stdout >>
LS_JOBID: 
LS_JOBPID:  16911
LSB_JOBINDEX:  0
LSB_JOBNAME:  /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/26/chr22/scripts/chunkCommand-chr22-indir26-bin33-chunk16.sh
LSB_QUEUE:  small
LSFUSER:  syoung
LSB_JOB_EXECUSER:  syoung
HOSTNAME:  n0138.pegasus.edu
LSB_HOSTS:  n0138
LSB_ERRORFILE: 
LSB_JOBFILENAME:  /scratch/lsf_spool/1299749410.3447699
LD_LIBRARY_PATH:  /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib
[bam_sort_core] merging from 9 files...

real	10m29.068s
user	9m47.732s
sys	0m7.772s

real	0m26.129s
user	0m25.173s
sys	0m0.843s




[syoung@u01 ~]$ bpeek 3447763
<< output from stdout >>
LS_JOBID: 
LS_JOBPID:  30860
LSB_JOBINDEX:  0
LSB_JOBNAME:  /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/26/chr22/scripts/chunkCommand-chr22-indir26-bin34-chunk35.sh
LSB_QUEUE:  small
LSFUSER:  syoung
LSB_JOB_EXECUSER:  syoung
HOSTNAME:  n0044.pegasus.edu
LSB_HOSTS:  n0044
LSB_ERRORFILE: 
LSB_JOBFILENAME:  /scratch/lsf_spool/1299749421.3447763
LD_LIBRARY_PATH:  /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib
[bam_sort_core] merging from 8 files...

real	8m45.128s
user	8m0.295s
sys	0m8.641s

real	0m21.456s
user	0m20.769s
sys	0m0.631s






\
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/bamtosnp-file26.out


    Cluster::runJobs    After printUsage       11-03-10 00:29:21
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    SAV::mergeChunks    Completed mergeChunk
    bamToSnp.pl    Run time: 00:24:19
    bamToSnp.pl    Completed /nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl
    bamToSnp.pl    0:29AM, 10 March 2011
    bamToSnp.pl    ****************************************

 

WHOLE RUN (FILES 26-33)


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
 --replicates 26-33 \
 --loop parallel \
 --executable /nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl \
 --inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
 --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22 \
 --maxdepth 500 \
 --binlevel 500000 \
 --filename hit.bam \
 --species human \
 --maxjobs 2000 \
 --walltime 48 \
 --queue small \
--chunksize 10000 \
 --cluster LSF \
 --stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/bamtosnp.out \
 --loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/loop-bamtosnp.26-33.out 




    RUNNING
    Thu Mar 10 03:39:20 EST 2011
    
    
    
tail -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/loop-bamtosnp.26-33.out


</entry>



<entry [Tue 2011:03:08 14:16:15 EST] RUN NOVOALIGN60>


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/syoung/0.5/bin/apps/aligners/NOVOALIGN.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign60/%REPLICATE% \
--threshold 60 \
--params "-r All 1" \
--distance 200 \
--deviation 50 \
--species human \
--label novoalign60-chr22-%REPLICATE% \
--maxjobs 1000 \
--queue large \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign60/%REPLICATE%/novoalign60.out 





/nethome/syoung/0.5/bin/apps/aligners/NOVOALIGN.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign60/1 \
--threshold 60 \
--params "-r All 1" \
--distance 200 \
--deviation 50 \
--species human \
--label novoalign60-chr22-1 \
--maxjobs 1000 \
--queue large \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--reads 1000000
    



<!--RERUN novoalign ALIGNMENT FILES 26-30

screen -S novo

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/NOVOALIGN.pl \
--replicates 26-30 \
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
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/novoalign.26-30.out 

    
    RUNNING Wed Nov 24 12:11:26 EST 2010
    
    Run time: 04:32:12
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:22PM, 24 November 2010
    ****************************************    
-->    
</entry>



<entry [Mon 2011:03:07 00:35:39 EST] REFACTORED SAV.pl TO IMPROVE PERFORMANCE>


/nethome/syoung/0.5/bin/apps/snp/SAV.pl \
--binlevel 500000 \
--filename hit.bam \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/snp130 \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 2000 \
--queue small \
--cluster LSF \
--walltime 24 \
--chunksize 50 




\
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/sav-26.out



PROBLEM: 

BIN 
Can't open snpfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/hit.binlevel500000.num33-26.snp


DIAGNOSIS:

ORIGINAL BAM FILES FOR FILE 26, chr22 ARE OKAY:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26/chr22/bins
    -rw-rw-rw- 1 syoung root 7.1M Jan 19 16:20 hit.binlevel500000.num100.bam
    -rw-rw-rw- 1 syoung root  12M Jan 19 16:20 hit.binlevel500000.num101.bam
    -rw-rw-rw- 1 syoung root  14M Jan 19 16:20 hit.binlevel500000.num102.bam
    -rw-rw-rw- 1 syoung root  14M Jan 19 16:20 hit.binlevel500000.num103.bam
    -rw-rw-rw- 1 syoung root  84M Jan 19 16:20 hit.binlevel500000.num33.bam
    -rw-rw-rw- 1 syoung root 101M Jan 19 16:20 hit.binlevel500000.num34.bam
    -rw-rw-rw- 1 syoung root  41M Jan 19 16:20 hit.binlevel500000.num35.bam
    ...


CUMULATIVE BAM FILES FOR FILE 26, chr22 ARE OKAY:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22
[syoung@u01 chr22]$ grep "hit.binlevel500000.num33-" ll.txt | grep bam
-rw-rw-rw-  1 syoung root   84M Jan 19 16:21 hit.binlevel500000.num33-1.bam
-rw-rw-rw-  1 syoung root  166M Jan 19 16:24 hit.binlevel500000.num33-2.bam
-rw-rw-rw-  1 syoung root  247M Jan 19 16:28 hit.binlevel500000.num33-3.bam
-rw-rw-rw-  1 syoung root  329M Jan 19 16:32 hit.binlevel500000.num33-4.bam
-rw-rw-rw-  1 syoung root  411M Jan 19 16:38 hit.binlevel500000.num33-5.bam
-rw-rw-rw-  1 syoung root  492M Jan 19 16:44 hit.binlevel500000.num33-6.bam
-rw-rw-rw-  1 syoung root  573M Jan 19 16:52 hit.binlevel500000.num33-7.bam
-rw-rw-rw-  1 syoung root  654M Jan 19 17:02 hit.binlevel500000.num33-8.bam
-rw-rw-rw-  1 syoung root  735M Jan 19 17:12 hit.binlevel500000.num33-9.bam
-rw-rw-rw-  1 syoung root  816M Jan 19 17:25 hit.binlevel500000.num33-10.bam
-rw-rw-rw-  1 syoung root  897M Jan 19 17:37 hit.binlevel500000.num33-11.bam
-rw-rw-rw-  1 syoung root  978M Jan 19 17:50 hit.binlevel500000.num33-12.bam
-rw-rw-rw-  1 syoung root  1.1G Jan 19 18:05 hit.binlevel500000.num33-13.bam
-rw-rw-rw-  1 syoung root  1.2G Jan 19 18:22 hit.binlevel500000.num33-14.bam
-rw-rw-rw-  1 syoung root  1.2G Jan 19 18:38 hit.binlevel500000.num33-15.bam
-rw-rw-rw-  1 syoung root  1.3G Jan 19 18:56 hit.binlevel500000.num33-16.bam
-rw-rw-rw-  1 syoung root  1.4G Jan 19 19:17 hit.binlevel500000.num33-17.bam
-rw-rw-rw-  1 syoung root  1.5G Jan 19 19:36 hit.binlevel500000.num33-18.bam
-rw-rw-rw-  1 syoung root  1.6G Jan 19 19:59 hit.binlevel500000.num33-19.bam
-rw-rw-rw-  1 syoung root  1.6G Jan 19 20:23 hit.binlevel500000.num33-20.bam
-rw-rw-rw-  1 syoung root  1.7G Jan 19 20:44 hit.binlevel500000.num33-21.bam
-rw-rw-rw-  1 syoung root  1.8G Jan 19 21:09 hit.binlevel500000.num33-22.bam
-rw-rw-rw-  1 syoung root  1.9G Jan 19 21:38 hit.binlevel500000.num33-23.bam
-rw-rw-rw-  1 syoung root  1.9G Jan 19 22:06 hit.binlevel500000.num33-24.bam
-rw-rw-rw-  1 syoung root  2.0G Jan 19 22:33 hit.binlevel500000.num33-25.bam
-rw-rw-rw-  1 syoung root  2.1G Jan 19 23:02 hit.binlevel500000.num33-26.bam
-rw-rw-rw-  1 syoung root  2.2G Jan 19 23:33 hit.binlevel500000.num33-27.bam
-rw-rw-rw-  1 syoung root  2.3G Jan 20 00:04 hit.binlevel500000.num33-28.bam
-rw-rw-rw-  1 syoung root  2.3G Jan 20 00:35 hit.binlevel500000.num33-29.bam
-rw-rw-rw-  1 syoung root  2.4G Jan 20 01:06 hit.binlevel500000.num33-30.bam
-rw-rw-rw-  1 syoung root  2.5G Jan 20 01:39 hit.binlevel500000.num33-31.bam
-rw-rw-rw-  1 syoung root  2.6G Jan 20 02:16 hit.binlevel500000.num33-32.bam
-rw-rw-rw-  1 syoung root  2.7G Jan 20 02:52 hit.binlevel500000.num33-33.bam


SOLUTION

RERUN bamToSnp.pl ON CUMULATIVE DATA:

/nethome/syoung/0.5/bin/apps/logic/flow.pl /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk run --start 5 --stop 5

    X::App::run    started application 'bamtosnp': 2011-03-07 03:24:46


/nethome/syoung/0.5/bin/apps/logic/flow.pl /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk wiki

	Application	5	bamtosnp
	/nethome/syoung/0.5/bin/apps/logic/loop.pl
	status: unknown
	locked: 0
	started: 2011-03-07 03:24:46
	stopped: 2011-03-08 04:02:12
	duration: 24 hrs 37 mins 26 secs

    
    


WHICH RUNS THIS COMMAND:

/nethome/syoung/0.5/bin/apps/logic/flow.pl /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk app command --ordinal 5

/nethome/syoung/0.5/bin/apps/logic/loop.pl \
 --replicates 1-33 \
 --loop parallel \
 --executable /nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl \
 --inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
 --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22 \
 --maxdepth 500 \
 --binlevel 500000 \
 --filename hit.bam \
 --species human \
 --maxjobs 2000 \
 --walltime 48 \
 --queue small \
 --cluster LSF \
 --stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/bamtosnp.out \
 --loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/loop-bamtosnp.out 




/nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl \
 --inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26 \
 --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22 \
 --maxdepth 500 \
 --binlevel 500000 \
 --filename hit.bam \
 --species human \
 --maxjobs 2000 \
 --walltime 48 \
 --queue small \
 --cluster LSF
 

</entry>

<entry [Sun 2011:03:06 23:51:48 EST] RUN ALL SAMPLES flow - BY STAGE>
                  
                  
1. ALIGN
--------

1. COPY/GENERATE SPLITFILES
2. ALIGN
3. CHECK ALIGNMENTS:

flow.pl align.wk loadCmd --cmdfile checkeland.cmd --type alignment --name checkeland --description "Check all alignment output files"
flow.pl align.wk loadCmd --cmdfile cleanup.cmd --type alignment --name cleanup --description "Remove all alignment subdirectories"
flow.pl align.wk run --outputdir run 


2. SNP
------

flow.pl snp.wk create --name snp 
flow.pl snp.wk loadCmd --cmdfile samtobam.cmd  --name samtobam --description "Convert chromosome .sam file into .bam file"
flow.pl snp.wk loadCmd --cmdfile binbam.cmd  --name binbam --description "Bin a .bam file into smaller .bam files covering UCSC bins or user-defined genomic intervals"
flow.pl snp.wk loadCmd --cmdfile cumulativebam.cmd  --name cumulativebam --description "Cumulatively merge .bam files, can use UCSC bins or user-defined genomic intervals"
flow.pl snp.wk loadCmd --cmdfile bamtosnp.cmd --type snp --name bamtosnp --description "Call SNPs from .bam files using samtools"


3. SAV
------

flow.pl sav.wk  loadCmd --cmdfile collatevenndbsnp.cmd --type snp --name snptosav --description "Do Venn analysis of dbSNP SNPs with increasing read depth"
flow.pl sav.wk  loadCmd --cmdfile collatevennnondbsnp.cmd --type snp --name snptosav --description "Do Venn analysis of non-dbSNP SNPs with increasing read depth"


flow.pl sav.wk create --name sav 
flow.pl sav.wk loadCmd --cmdfile snptosav.cmd --type snp --name snptosav --description "Annotate SNPs, including coincidence with dbSNP"
flow.pl sav.wk  loadCmd --cmdfile filtersav.cmd --type snp --name filtersav --description "Filter out dbSNP and non-dbSNP SNPs"
flow.pl sav.wk  loadCmd --cmdfile venndbsnp.cmd --type snp --name vendbsnp --description "Do Venn analysis of dbSNP SNPs with increasing read depth"
flow.pl sav.wk  loadCmd --cmdfile vennnondbsnp.cmd --type snp --name vennnondbsnp --description "Do Venn analysis of non-dbSNP SNPs with increasing read depth"



4. VENN (SAV)
-------------

cd E:\0.5\bin\workflows\cluster\venn\sav
cd /nethome/syoung/0.5/bin/workflows/cluster/venn/sav
flow.pl savvenndbsnp.wk create --name savvenn
flow.pl savvenndbsnp.wk loadCmd --cmdfile savvenn-elandbowtie-dbsnp.cmd --name savvenn-elandbowtie-dbsnp
#FINISHED 'savvenn-elandbowtie-dbsnp': 2011-01-30 18:59:58, duration: 0 hrs 2 mins 27 secs
flow.pl savvenndbsnp.wk loadCmd --cmdfile collatesavvenn-elandbowtie-dbsnp.cmd --name collatesavvenn-elandbowtie-dbsnp
#FINISHED 'collatesavvenn-elandbowtie-dbsnp' 2011-01-30 20:22:43, duration: 0 hrs 0 mins 26 secs

flow.pl savvenndbsnp.wk loadCmd --cmdfile elandnovoalign.cmd --name elandnovoalign
flow.pl savvenndbsnp.wk loadCmd --cmdfile bowtienovoalign.cmd --name bowtienovoalign
flow.pl savvenndbsnp.wk loadCmd --cmdfile elandeland.cmd --name elandeland --description "Venn comparison between two samples of binned SNP predictions"
flow.pl savvenndbsnp.wk loadCmd --cmdfile bowtiebowtie.cmd --name bowtiebowtie 
flow.pl savvenndbsnp.wk loadCmd --cmdfile novoalignnovoalign.cmd --name novoalignnovoalign


flow.pl venn.wk run --start 1 --stop 1






5. VENN (SNP)
-------------

cd E:\0.5\bin\workflows\cluster\venn\snp
cd /nethome/syoung/0.5/bin/workflows/cluster/venn/snp
flow.pl snp.wk create --name snp
flow.pl venn.wk loadCmd --cmdfile elandbowtie.cmd --name elandbowtie --description "Venn comparison between two samples of binned SNP predictions"

flow.pl venn.wk loadCmd --cmdfile elandnovoalign.cmd --name elandnovoalign
flow.pl venn.wk loadCmd --cmdfile bowtienovoalign.cmd --name bowtienovoalign
flow.pl venn.wk loadCmd --cmdfile elandeland.cmd --name elandeland --description "Venn comparison between two samples of binned SNP predictions"
flow.pl venn.wk loadCmd --cmdfile bowtiebowtie.cmd --name bowtiebowtie 
flow.pl venn.wk loadCmd --cmdfile novoalignnovoalign.cmd --name novoalignnovoalign


flow.pl venn.wk run --start 1 --stop 1



6. REALIGN
----------


createIntervalFiles.pl      COMPLETED
realignBam.pl               RUNNING Mon Dec  6 00:12:24 EST 2010
                            COMPLETED Mon Dec  6 01:09:38 EST 2010



7. REPEAT 1-4 ON REALIGNED
--------------------------


snpCounts.pl
bamCoverage.pl              



</entry>

<entry [Sun 2011:0206 23:51:48 EST] RUN ALL SAMPLES flow - BY SAMPLE>

ELAND
-----

align

cd E:\0.5\bin\workflows\cluster\eland\align
flow.pl align.wk create --name align 
flow.pl align.wk loadCmd --cmdfile splitfiles.cmd --type alignment --name splitfiles --description "Split input files into subfiles and print list of subfiles to file splitfile.txt in target directory"
flow.pl align.wk loadCmd --cmdfile eland.cmd --type alignment --name eland --description "Concurrent loop through 1-33 files doing ELAND alignment with split read input files"
SEE 'ALIGN'

snp

cd /nethome/syoung/0.5/bin/workflows/cluster/eland/snp

sav

cd /nethome/syoung/0.5/bin/workflows/cluster/eland/sav
flow.pl sav.wk  run --start 2 --stop 2


ELAND24
-------

cd /nethome/syoung/0.5/bin/workflows/cluster/eland24/align

cd E:\0.5\bin\workflows\cluster\eland\align
flow.pl align.wk create --name align 
flow.pl align.wk loadCmd --cmdfile splitfiles.cmd --type alignment --name splitfiles --description "Split input files into subfiles and print list of subfiles to file splitfile.txt in target directory"
flow.pl align.wk loadCmd --cmdfile eland.cmd --type alignment --name eland --description "Concurrent loop through 1-33 files doing ELAND alignment with split read input files"
SEE 'ALIGN'

    RUNNING Wed Feb  9 12:19:05 EST 2011

snp

cd /nethome/syoung/0.5/bin/workflows/cluster/eland/snp

sav

cd /nethome/syoung/0.5/bin/workflows/cluster/eland/sav
flow.pl sav.wk  run --start 2 --stop 2



BOWTIE
------

align

cd /nethome/syoung/0.5/bin/workflows/cluster/bowtie/align
flow.pl align.wk create --name align 
flow.pl align.wk loadCmd --cmdfile copysplit.cmd --name copysplit 
flow.pl align.wk loadCmd --cmdfile bowtie.cmd --name bowtie 

flow.pl align.wk run --start 1 --stop 4


snp

cd /nethome/syoung/0.5/bin/workflows/cluster/bowtie/snp
flow.pl snp.wk run --start 3 --stop 3    #FINISHED Fri Jan 28 13:58:44 EST 2011
flow.pl snp.wk run --start 4 --stop 4


sav

cd /nethome/syoung/0.5/bin/workflows/cluster/bowtie/sav
/nethome/syoung/0.5/bin/apps/logic/flow.pl sav.wk run --start 1 --stop 1

flow.pl sav.wk run --start 1 --stop 1
#FINISHED 'snptosav' 2011-01-29 02:38:01, duration: 12 hrs 7 mins 17 secs
flow.pl sav.wk run --start 2 --stop 2
#FINISHED 'filtersav' 2011-01-29 21:34:12, duration: 0 hrs 0 mins 35 secs
flow.pl sav.wk run --start 3 --stop 3
#FINISHED 'venndbsnp' 2011-01-30 18:23:45, duration: 0 hrs 0 mins 36 secs
flow.pl sav.wk run --start 4 --stop 4
#FINISHED 'vennnondbsnp' 2011-01-30 18:44:42, duration: 0 hrs 0 mins 36 secs



BOWTIE32
--------

cd /nethome/syoung/0.5/bin/workflows/cluster/bowtie32/align
flow.pl align.wk create --name align 
flow.pl align.wk loadCmd --cmdfile copysplit.cmd --name copysplit 
flow.pl align.wk loadCmd --cmdfile bowtie32.cmd --name bowtie32 


/nethome/syoung/0.5/bin/apps/logic/workflow.pl align.wk run --start 2 --stop 4
# FINISHED 3:42PM, 27 January 2011, Run time: 02:01:09


snp

cd /nethome/syoung/0.5/bin/workflows/cluster/bowtie32/snp


sav

cd /nethome/syoung/0.5/bin/workflows/cluster/bowtie32/sav




BOWTIE24
---------

align

cd /nethome/syoung/0.5/bin/workflows/cluster/bowtie24/align
flow.pl align.wk create --name align 
flow.pl align.wk loadCmd --cmdfile copysplit.cmd --name copysplit 
flow.pl align.wk loadCmd --cmdfile bowtie24.cmd --name bowtie24 


/nethome/syoung/0.5/bin/apps/logic/workflow.pl align.wk run --start 2 --stop 4
	RUNNING Mon Jan 24 15:40:55 EST 2011
    

snp

cd E:\0.5\bin\workflows\cluster\bowtie24\snp


sav

cd E:\0.5\bin\workflows\cluster\bowtie24\sav



NOVOALIGN
---------

align

flow.pl align.wk loadCmd --cmdfile copysplit.cmd --name copysplit --description "Link split file subdirectories and generate splitfile.txt file in target directory"
flow.pl align.wk loadCmd --cmdfile novo.cmd --name novo --description "Concurrent loop through 1-33 files doing NOVOALIGN alignment with split read input files"

cleanup.pl
    Cluster.pl    Run time: 00:00:34
    Cluster.pl    11-02-09 02:54:28

snp

cd E:\0.5\bin\workflows\cluster\novoalign\snp


sav

cd E:\0.5\bin\workflows\cluster\novoalign\sav



NOVOALIGN60
-----------


</entry>


<entry [Sun 2011:0106 23:51:48 EST] RUN ALL SAMPLES flow - PEGASUS ISSUES>

PEGASUS JOB SUBMISSION FAILURE

BOWTIE FILE 26 HAS ONLY TWO CUMULATIVE sav FILES
------------------------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ll hit.binlevel500000.*-26.sav

    -rw-rw-rw- 1 syoung root 186K Jan 28 16:51 hit.binlevel500000.num33-26.sav
    -rw-rw-rw- 1 syoung root 313K Jan 28 18:58 hit.binlevel500000.num34-26.sav

WHEREAS FILES 25 AND 27 HAVE THE FULL COMPLEMENT OF 71 OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ll hit.binlevel500000.*-25.sav

    -rw-rw-rw- 1 syoung root 281K Jan 28 21:21 hit.binlevel500000.num100-25.sav
    -rw-rw-rw- 1 syoung root 199K Jan 28 21:35 hit.binlevel500000.num101-25.sav
    ...
    -rw-rw-rw- 1 syoung root 236K Jan 28 21:05 hit.binlevel500000.num98-25.sav
    -rw-rw-rw- 1 syoung root 320K Jan 28 22:12 hit.binlevel500000.num99-25.sav


TRACE BACKWARDS TO snp FILES AND bam FILES

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ll hit.binlevel500000.*-26.snp

ONLY 2 FILES DATED JAN 15:

    -rw-rw-rw- 1 syoung root 140K Jan 15 03:12 hit.binlevel500000.num33-26.snp
    -rw-rw-rw- 1 syoung root 242K Jan 15 03:13 hit.binlevel500000.num34-26.snp

WHEREAS FILE 26 HAS 71 FILES DATED JAN 28:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ll hit.binlevel500000.*-25.snp

    -rw-rw-rw- 1 syoung root  178K Jan 28 13:04 hit.binlevel500000.num100-25.snp
    -rw-rw-rw- 1 syoung root  171K Jan 28 13:04 hit.binlevel500000.num101-25.snp
    -rw-rw-rw- 1 syoung root  195K Jan 28 13:04 hit.binlevel500000.num102-25.snp
    ...

THE *bam FILES FOR FILE 26 ARE FINE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ll hit.binlevel500000.*-26.bam

71 FILES:

    -rw-rw-rw- 1 syoung root  31M Jan 27 14:53 hit.binlevel500000.num100-26.bam
    -rw-rw-rw- 1 syoung root  46M Jan 27 14:53 hit.binlevel500000.num101-26.bam
    -rw-rw-rw- 1 syoung root  51M Jan 27 14:53 hit.binlevel500000.num102-26.bam
    ...
    -rw-rw-rw- 1 syoung root  30M Jan 27 14:53 hit.binlevel500000.num98-26.bam
    -rw-rw-rw- 1 syoung root 147M Jan 27 14:54 hit.binlevel500000.num99-26.bam



DIAGNOSIS

THE ARRAY JOB FOR FILE 26 WAS NOT ACTUALLY EXECUTED!

GET INFO ON ALL JOBS THAT EXITED (DID NOT COMPLETE NORMALLY) AND PARSE:

cd /nethome/syoung
bacct -e -l > 110130.exited-jobs.txt

bacct -l > exited-jobs-110128-30.txt

SHOWS THAT FILE 26 (binBamToSnp-26*) JOBS WERE NOT SUBMITTED ON JAN 28
WHEREAS ALL OTHER FILES 1-33 WERE SUBMITTED ON JAN 28.


cd /nethome/syoung
emacs exited-jobs-110128-30.txt
SEARCH:
binBamToSnp-26*



SOLUTION:

RERUN bamToSnp.pl FOR BOWTIE FILE 26 ONLY

/nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/26 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22 \
--maxdepth 500 \
--binlevel 500000 \
--filename hit.bam \
--species human \
--maxjobs 2000 \
--walltime 48 \
--queue small \
--cluster LSF \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/26/bamtosnp.out


RERUN SAV.pl FOR BOWTIE FILE 26 ONLY

/nethome/syoung/0.5/bin/apps/snp/SAV.pl \
--binlevel 500000 \
--filename hit.bam \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/26 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/snp130 \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 2000 \
--queue small \
--cluster LSF \
--walltime 24 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/sav-26.out


RERUN filterSav.pl FOR BOWTIE FILE 26 ONLY


/nethome/syoung/0.5/bin/apps/snp/filterSav.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-26.sav \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/splitsav-26.out

    Cluster.pl    Run time: 00:00:00
    Cluster.pl    Completed /nethome/syoung/0.5/bin/apps/snp/filterSav.pl
    Cluster.pl    11-01-30 23:24:29
    Cluster.pl    ****************************************

OUTPUT FILES:

    -rw-rw-rw- 1 syoung root 258428 Jan 30 23:24 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-26-dbsnp.sav
    -rw-rw-rw- 1 syoung root 253590 Jan 30 23:24 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-26-non-dbsnp.sav
    -rw-rw-rw- 1 syoung root 509874 Jan 19 17:41 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-26.sav


THEN RERUN savvenn-elandbowtie-dbsnp.cmd








BIG DISCREPANCY BETWEEN COMPLETION TIMES ON PEGASUS
---------------------------------------------------

-rw-rw-rw- 1 syoung root 37K Jan 21 10:13 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/stdout/hit.binlevel500000.num52-26.sav-stdout.txt


grep "\[" /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/stdout/hit.binlevel500000.num52-26.sav-stdout.txt
0 [total 2587] 11-01-21 03:32:49
100 [total 2587] 11-01-21 03:48:59
200 [total 2587] 11-01-21 04:04:04
300 [total 2587] 11-01-21 04:20:35
400 [total 2587] 11-01-21 04:37:22
500 [total 2587] 11-01-21 04:54:02
600 [total 2587] 11-01-21 05:08:28
700 [total 2587] 11-01-21 05:21:50
800 [total 2587] 11-01-21 05:37:20
900 [total 2587] 11-01-21 05:54:17
1000 [total 2587] 11-01-21 06:12:18
1100 [total 2587] 11-01-21 06:29:26
1200 [total 2587] 11-01-21 06:46:35
1300 [total 2587] 11-01-21 07:03:16
1400 [total 2587] 11-01-21 07:20:39
1500 [total 2587] 11-01-21 07:38:34
1600 [total 2587] 11-01-21 07:55:35
1700 [total 2587] 11-01-21 08:12:24
1800 [total 2587] 11-01-21 08:26:37
1900 [total 2587] 11-01-21 08:40:24
2000 [total 2587] 11-01-21 08:55:09
2100 [total 2587] 11-01-21 09:08:38
2200 [total 2587] 11-01-21 09:20:15
2300 [total 2587] 11-01-21 09:36:12
2400 [total 2587] 11-01-21 09:52:26
2500 [total 2587] 11-01-21 10:05:15


-rw-rw-rw- 1 syoung root 2.6K Jan 30 22:50 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/stdout/hit.binlevel500000.num52-26.sav-stdout.txt

[syoung@u02 ~]$ grep "\[" /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/stdout/hit.binlevel500000.num52-26.sav-stdout.txt
0 [total 2026] 11-01-30 22:02:23
100 [total 2026] 11-01-30 22:05:20
200 [total 2026] 11-01-30 22:08:08
300 [total 2026] 11-01-30 22:11:09
400 [total 2026] 11-01-30 22:14:36
500 [total 2026] 11-01-30 22:17:14
600 [total 2026] 11-01-30 22:19:55
700 [total 2026] 11-01-30 22:22:22
800 [total 2026] 11-01-30 22:24:44
900 [total 2026] 11-01-30 22:26:55
1000 [total 2026] 11-01-30 22:28:52
1100 [total 2026] 11-01-30 22:30:42
1200 [total 2026] 11-01-30 22:32:19
1300 [total 2026] 11-01-30 22:34:02
1400 [total 2026] 11-01-30 22:35:52
1500 [total 2026] 11-01-30 22:37:41
1600 [total 2026] 11-01-30 22:40:02
1700 [total 2026] 11-01-30 22:42:25
1800 [total 2026] 11-01-30 22:44:36
1900 [total 2026] 11-01-30 22:47:07
2000 [total 2026] 11-01-30 22:49:28






ELAND filterSav.pl
------------------
Wed Jan 26 01:43:49 EST 2011

INPUT FILE
-rw-rw-rw- 1 syoung root 3.0M Jan 21 13:32 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-3.sav

OUTPUTFILES

    -rw-rw-rw- 1 syoung root 516K Jan 25 12:29 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-3-dbsnp.sav
    -rw-rw-rw- 1 syoung root 2.5M Jan 25 12:29 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-3-non-dbsnp.sav




NOVOALIGN DURATIONS
-------------------

novo, binbam, cumulativebam

	flow.pl    Run time: 07:45:30
	flow.pl    Date: 9:31PM, 14 January 2011
	flow.pl    Command:
	flow.pl    flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo/run
	flow.pl
	flow.pl    ****************************************

cleanup

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign \
--references chr22

	Cluster.pl    Run time: 00:17:59
	Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
	Cluster.pl    11-01-22 03:31:06
	Cluster.pl    ****************************************


checknovo

	NOVOALIGN.pl    Run time: 00:04:27
	NOVOALIGN.pl    Completed /nethome/syoung/0.5/bin/apps/aligners/NOVOALIGNcheck.pl
	NOVOALIGN.pl    11:45AM, 24 January 2011
	NOVOALIGN.pl    ****************************************


bamtosnp

	Run time: 00:02:41
	Completed loop.pl
	3:14AM, 15 January 2011
	****************************************

#snptosav
#
#	flow.pl    Run time: 07:45:50
#	flow.pl    Date: 10:05AM, 17 January 2011
#	flow.pl    Command:
#	flow.pl    flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo/run --start 5 --stop 5
#	flow.pl
#	flow.pl    ****************************************






DISC USAGE
----------

Fri Jan 21 12:01:35 EST 2011
cat du.txt 

	377G    bowtie
	1.1G    bowtie-test
	62G     bowtie-test-100M
	1.5K    du.txt
	3.5T    eland
	228G    eland-ok
	73M     eland-test
	642K    exited-jobs.txt
	2.7T    novoalign
	72M     novo-test
	35G     rebowtie
	35G     rebowtie-rf
	14G     reeland
	108G    remaq
	33G     renovoalign
	4.9G    venn
	499M    venn-dbsnp






</entry>

<entry [Sun 2011:0106 23:51:48 EST] RUN ALL SAMPLES flow - ELAND 1-33>



ELAND MANUAL CHECK RUN & DURATIONS
----------------------------------

CHECK RUNS COMPLETED

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland
ll */chr22/check/
grep -n incomplete */chr22/check/*/check.log 


CLEAN UP

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland \
--references chr22

	RUNNING Sun Jan 23 12:48:13 EST 2011
	Cluster.pl    Run time: 00:35:15
	Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
	Cluster.pl    11-01-23 13:23:25
	Cluster.pl    ****************************************


DURATIONS

snptosav

	tail /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/loop-sav.out

	Run time: 02:42:56
	Completed loop.pl
	6:17PM, 20 January 2011
	****************************************


unbin

	bash-3.2$ time flow.pl /nethome/syoung/0.5/bin/workflows/cluster/eland/elandsnp.wk run --outputdir /nethome/syoung/0.5/bin/workflows/cluster/eland/run --start 7 --stop 7; date

	
	[Fri Jan 21 13:34:42 2011] unbin.pl: Use of uninitialized value in concatenation (.) or string at /nethome/syoung/0.5/bin/apps/snp/../../../lib/Cluster.pm line 5399, < FILE > line 66.
	[Fri Jan 21 13:34:42 2011] unbin.pl: Use of uninitialized value in string eq at /nethome/syoung/0.5/bin/apps/snp/../../../lib/Cluster.pm line 5409, < FILE > line 66.
	X::App::run    in while loop. message: Job label 'unbin' completion signal: 0 unbin
	
	
	
	real    2m42.757s
	user    0m5.827s
	sys     0m3.130s
	Fri Jan 21 13:34:43 EST 2011




</entry>

<entry [Sun 2011:0106 23:51:48 EST] RUN ALL SAMPLES flow - BOWTIE 1-33>


BOWTIE MANUAL RUN & DURATIONS
-----------------------------


1) ALIGNMENT + SNPS

CREATE APPS

####flow.pl E:\0.5\bin\workflows\cluster\bowtie\splitfiles.app app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\splitfiles.cmd type util --name splitfiles --description "Split input files into subfiles and print list of subfiles to file splitfile.txt in target directory"

flow.pl E:\0.5\bin\workflows\cluster\bowtie\copysplit.app app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\copysplit.cmd type util --name copysplit --description "Link split file subdirectories and generate splitfile.txt file in target directory"

flow.pl E:\0.5\bin\workflows\cluster\bowtie\bowtie.app app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\bowtie.cmd --type aligner --name bowtie --description "Concurrent loop through 1-33 files doing Bowtie alignment with split read input files"

flow.pl E:\0.5\bin\workflows\cluster\bowtie\binbam.app app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\binbam.cmd --type binner --name binbam --description "Bin a .bam file into smaller .bam files covering UCSC bins or user-defined genomic intervals"

flow.pl E:\0.5\bin\workflows\cluster\bowtie\cumulativebam.app app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\cumulativebam.cmd --type binner --name cumulativebam --description "Cumulatively merge .bam files, can use UCSC bins or user-defined genomic intervals"

flow.pl E:\0.5\bin\workflows\cluster\bowtie\bamtosnp.app app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\bamtosnp.cmd --type snp --name bamtosnp --description "Call SNPs from .bam files using samtools"

flow.pl E:\0.5\bin\workflows\cluster\bowtie\snptosav.app app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\sav.cmd --type snp --name snptosav --description "Annotate SNPs, including coincidence with dbSNP"


CREATE WORKFLOW

flow.pl E:\0.5\bin\workflows\cluster\bowtiesnp.wk create --name bowtiesnp 


ADD APPS

####flow.pl E:\0.5\bin\workflows\cluster\bowtie\bowtiesnp.wk addApp --appfile E:\0.5\bin\workflows\cluster\bowtie\splitfiles.app

flow.pl E:\0.5\bin\workflows\cluster\bowtie\bowtiesnp.wk addApp --appfile E:\0.5\bin\workflows\cluster\bowtie\copysplit.app

flow.pl E:\0.5\bin\workflows\cluster\bowtie\bowtiesnp.wk addApp --appfile E:\0.5\bin\workflows\cluster\bowtie\bowtie.app

flow.pl E:\0.5\bin\workflows\cluster\bowtie\bowtiesnp.wk addApp --appfile E:\0.5\bin\workflows\cluster\bowtie\binbam.app

flow.pl E:\0.5\bin\workflows\cluster\bowtie\bowtiesnp.wk addApp --appfile E:\0.5\bin\workflows\cluster\bowtie\cumulativesnp.app

flow.pl E:\0.5\bin\workflows\cluster\bowtie\bowtiesnp.wk addApp --appfile E:\0.5\bin\workflows\cluster\bowtie\bamtosnp.app

flow.pl E:\0.5\bin\workflows\cluster\bowtie\bowtiesnp.wk addApp --appfile E:\0.5\bin\workflows\cluster\bowtie\snptosav.app


RUN

flow.pl /nethome/syoung/0.5/bin/workflows/cluster/bowtie/bowtiesnp.wk run --outputdir /nethome/syoung/0.5/bin/workflows/cluster/bowtie/run --start 7 --stop 7


Workflow:       bowtiesnp

        Application     1       copysplit
        loop.pl


        Application     2       bowtie
        loop.pl


        Application     3       binbam
        loop.pl


        Application     4       cumulativebam
        perl /nethome/syoung/0.5/bin/apps/snp/cumulativeBam.pl


        Application     5       bamtosnp
        loop.pl


        Application     6       snptosav
        loop.pl


        Application     7       unbinsav
        perl /nethome/syoung/0.5/bin/apps/snp/unbin.pl
		

CHECK COMPLETE:
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/check/
grep -n incomplete */chr22/check/*/check.log 

CLEAN UP

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie \
--references chr22
		
		Cluster.pl    Run time: 00:29:20
		Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
		Cluster.pl    11-01-14 17:51:49
		Cluster.pl    ****************************************


DURATIONS

bowtie

	BOWTIE.pl    Run time: 04:57:41
	BOWTIE.pl    Completed /nethome/syoung/0.5/bin/apps/aligners/BOWTIE.pl
	BOWTIE.pl    7:48AM, 14 January 2011
	BOWTIE.pl    ****************************************

bowtiecheck

	BOWTIEcheck.pl    Run time: 00:05:34
	BOWTIEcheck.pl    Completed /nethome/syoung/0.5/bin/apps/aligners/BOWTIEcheck.pl /nethome/syoung/0.5/bin/apps/aligners/BOWTIEcheck.pl --replicates 1-33 --paired --distance 200 --params --seedlen 32 --label BOWTIE --referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie --min 0.5 --max 2 --stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/bowtiecheck.out
	BOWTIEcheck.pl    11:05AM, 24 January 2011
	BOWTIEcheck.pl    ****************************************

binbam

	Run time: 00:10:24
	Completed loop.pl
	8:02AM, 14 January 2011
	****************************************

cumulativebam

	cumulativeBam.pl    Run time: 02:02:33
	cumulativeBam.pl    Completed /nethome/syoung/0.5/bin/apps/snp/cumulativeBam.pl
	cumulativeBam.pl    10:04AM, 14 January 2011
	cumulativeBam.pl    ****************************************

bamtosnp

	Run time: 00:02:41
	Completed loop.pl
	3:14AM, 15 January 2011
	****************************************

snptosav

	flow.pl    Run time: 07:57:47
	flow.pl    Date: 10:01AM, 17 January 2011
	flow.pl    Command:
	flow.pl    flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/bowtie/bowtiesnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/bowtie/run --start 5 --stop 5
	flow.pl    ****************************************





</entry>

<entry [Sun 2011:0106 23:51:48 EST] RUN ALL SAMPLES flow - NOVOALIGN>


NOVALIGN: TOOK 16 HOURS TO RUN binBamToSnp
------------------------------------------

/nethome/syoung/0.5/bin/apps/logic/flow.pl /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk run --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo/run --start 2 --stop 7

RUNNING
Tue Jan 18 15:55:07 EST 2011

STILL RUNNING
Fri Jan 21 01:11:32 EST 2011

bjobs

		JOBID     USER    STAT  QUEUE      FROM_HOST   EXEC_HOST   JOB_NAME   SUBMIT_TIME
		3277087   syoung  RUN   small      u03         4*n0191     *r22-33.sh Jan 20 02:58
		3277119   syoung  RUN   small      u03         4*n0099     *r22-33.sh Jan 20 02:58
		3277133   syoung  RUN   small      u03         1*n0152     *r22-33.sh Jan 20 02:58
													   3*n0177
		3277149   syoung  RUN   small      u03         2*n0141     *r22-33.sh Jan 20 02:59
													   2*n0148
		3277174   syoung  RUN   small      u03         2*n0169     *r22-33.sh Jan 20 02:59
													   2*n0349
		3277193   syoung  RUN   small      u03         1*n0148     *r22-33.sh Jan 20 02:59
													   1*n0201
													   2*n0200
		3277213   syoung  RUN   small      u03         4*n0338     *r22-33.sh Jan 20 02:59
		3277214   syoung  RUN   small      u03         4*n0043     *r22-33.sh Jan 20 02:59
		3277216   syoung  RUN   small      u03         3*n0161     *r22-33.sh Jan 20 02:59
                                               1*n0162


NOTE: bamtosnp TOOK A LONG TIME:

		tail /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/ovoalign/19/bamtosnp.out
		Cluster::printUsage    batchstats[0]: 
		Cluster::printUsage    Printing USAGE file: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/usage/binBamToSnp-usage.txt
		Cluster::runJobs    After printUsage       11-01-20 19:24:00
		Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
		bamToSnp.pl    Run time: 16:25:34
		bamToSnp.pl    Completed /nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl
		bamToSnp.pl    7:24PM, 20 January 2011
		bamToSnp.pl    ****************************************


NOVOALIGN bamToSnp.pl JOBS FINISHED, NOW RUNNING snpToSav.pl (VIA SAV.pl)
Fri Jan 21 11:23:36 EST 2011

	JOBID     USER    STAT  QUEUE      FROM_HOST   EXEC_HOST   JOB_NAME   SUBMIT_TIME
	3296862   syoung  RUN   small      u03         n0264       *2-1-35.sh Jan 21 03:28
	3296843   syoung  RUN   small      u03         n0262       *2-1-35.sh Jan 21 03:28
	3296926   syoung  RUN   small      u03         n0041       *2-1-33.sh Jan 21 03:28
	3296938   syoung  RUN   small      u03         n0037       *2-1-35.sh Jan 21 03:28
	3297142   syoung  RUN   small      u03         n0271       *2-1-35.sh Jan 21 03:28
	3297185   syoung  RUN   small      u03         n0278       *2-1-46.sh Jan 21 03:28
	3297227   syoung  RUN   small      u03         n0100       *2-1-35.sh Jan 21 03:28
	3297318   syoung  RUN   small      u03         n0104       *2-1-33.sh Jan 21 03:28
	3297476   syoung  RUN   small      u03         n0189       *2-1-48.sh Jan 21 03:29
	3297543   syoung  RUN   small      u03         n0240       *2-1-48.sh Jan 21 03:29
	3297817   syoung  RUN   small      u03         n0066       *2-1-35.sh Jan 21 03:30
	3297818   syoung  RUN   small      u03         n0066       *2-1-34.sh Jan 21 03:30
	3297820   syoung  RUN   small      u03         n0066       *2-1-33.sh Jan 21 03:30
	3297821   syoung  RUN   small      u03         n0066       *2-1-33.sh Jan 21 03:30
	3297822   syoung  RUN   small      u03         n0066       *2-1-33.sh Jan 21 03:30
	3297833   syoung  RUN   small      u03         n0068       *2-1-35.sh Jan 21 03:30
	3298152   syoung  RUN   small      u03         n0097       *2-1-48.sh Jan 21 03:31
	3298169   syoung  RUN   small      u03         n0088       *2-1-48.sh Jan 21 03:32
	3298211   syoung  RUN   small      u03         n0046       *2-1-48.sh Jan 21 03:32



CHECK COMPLETED - OK

ALIGNMENTS OK:
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
grep incomplete */chr22/check/NOVOALIGN/check.log
	< NONE >

CHECK FILE 22 binBam AND FILE 33 samToBam:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/check/
grep -n incomplete */chr22/check/*/check.log 

	22/chr22/check/binBam-sort/check.log:1:incomplete       -       -       /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22/chr22/lock/binbam-sort-chr22-lock.txt
	33/chr22/check/samToBam/check.log:1:incomplete  -       -       /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33/chr22/lock/samToBam-chr22-lock.txt


LOCK FILES NOT PRESENT NOW SO MUST BE SOME LAG BETWEEN THEIR unlink AND ACTUAL REMOVAL:

	ls: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22/chr22/lock/binbam-sort-chr22-lock.txt: No such file or directory

	ls: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33/chr22/lock/samToBam-chr22-lock.txt: No such file or directory

RUN

/nethome/syoung/0.5/bin/apps/logic/flow.pl /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk run --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo/run --start 2 --stop 7

RUNNING
Tue Jan 18 15:55:07 EST 2011

STILL RUNNING
Fri Jan 21 01:11:32 EST 2011

bjobs

		JOBID     USER    STAT  QUEUE      FROM_HOST   EXEC_HOST   JOB_NAME   SUBMIT_TIME
		3277087   syoung  RUN   small      u03         4*n0191     *r22-33.sh Jan 20 02:58
		3277119   syoung  RUN   small      u03         4*n0099     *r22-33.sh Jan 20 02:58
		3277133   syoung  RUN   small      u03         1*n0152     *r22-33.sh Jan 20 02:58
													   3*n0177
		3277149   syoung  RUN   small      u03         2*n0141     *r22-33.sh Jan 20 02:59
													   2*n0148
		3277174   syoung  RUN   small      u03         2*n0169     *r22-33.sh Jan 20 02:59
													   2*n0349
		3277193   syoung  RUN   small      u03         1*n0148     *r22-33.sh Jan 20 02:59
													   1*n0201
													   2*n0200
		3277213   syoung  RUN   small      u03         4*n0338     *r22-33.sh Jan 20 02:59
		3277214   syoung  RUN   small      u03         4*n0043     *r22-33.sh Jan 20 02:59
		3277216   syoung  RUN   small      u03         3*n0161     *r22-33.sh Jan 20 02:59
                                               1*n0162


NOTE: bamtosnp TOOK A LONG TIME:

		tail /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/ovoalign/19/bamtosnp.out
		Cluster::printUsage    batchstats[0]: 
		Cluster::printUsage    Printing USAGE file: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/usage/binBamToSnp-usage.txt
		Cluster::runJobs    After printUsage       11-01-20 19:24:00
		Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
		bamToSnp.pl    Run time: 16:25:34
		bamToSnp.pl    Completed /nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl
		bamToSnp.pl    7:24PM, 20 January 2011
		bamToSnp.pl    ****************************************


NOVOALIGN bamToSnp.pl JOBS FINISHED, NOW RUNNING snpToSav.pl (VIA SAV.pl)
Fri Jan 21 11:23:36 EST 2011

	JOBID     USER    STAT  QUEUE      FROM_HOST   EXEC_HOST   JOB_NAME   SUBMIT_TIME
	3296862   syoung  RUN   small      u03         n0264       *2-1-35.sh Jan 21 03:28
	3296843   syoung  RUN   small      u03         n0262       *2-1-35.sh Jan 21 03:28
	3296926   syoung  RUN   small      u03         n0041       *2-1-33.sh Jan 21 03:28
	3296938   syoung  RUN   small      u03         n0037       *2-1-35.sh Jan 21 03:28
	3297142   syoung  RUN   small      u03         n0271       *2-1-35.sh Jan 21 03:28
	3297185   syoung  RUN   small      u03         n0278       *2-1-46.sh Jan 21 03:28
	3297227   syoung  RUN   small      u03         n0100       *2-1-35.sh Jan 21 03:28
	3297318   syoung  RUN   small      u03         n0104       *2-1-33.sh Jan 21 03:28
	3297476   syoung  RUN   small      u03         n0189       *2-1-48.sh Jan 21 03:29
	3297543   syoung  RUN   small      u03         n0240       *2-1-48.sh Jan 21 03:29
	3297817   syoung  RUN   small      u03         n0066       *2-1-35.sh Jan 21 03:30
	3297818   syoung  RUN   small      u03         n0066       *2-1-34.sh Jan 21 03:30
	3297820   syoung  RUN   small      u03         n0066       *2-1-33.sh Jan 21 03:30
	3297821   syoung  RUN   small      u03         n0066       *2-1-33.sh Jan 21 03:30
	3297822   syoung  RUN   small      u03         n0066       *2-1-33.sh Jan 21 03:30
	3297833   syoung  RUN   small      u03         n0068       *2-1-35.sh Jan 21 03:30
	3298152   syoung  RUN   small      u03         n0097       *2-1-48.sh Jan 21 03:31
	3298169   syoung  RUN   small      u03         n0088       *2-1-48.sh Jan 21 03:32
	3298211   syoung  RUN   small      u03         n0046       *2-1-48.sh Jan 21 03:32



CHECK COMPLETED - OK

ALIGNMENTS OK:
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
grep incomplete */chr22/check/NOVOALIGN/check.log
	< NONE >

CHECK FILE 22 binBam AND FILE 33 samToBam:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/check/
grep -n incomplete */chr22/check/*/check.log 

	22/chr22/check/binBam-sort/check.log:1:incomplete       -       -       /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22/chr22/lock/binbam-sort-chr22-lock.txt
	33/chr22/check/samToBam/check.log:1:incomplete  -       -       /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33/chr22/lock/samToBam-chr22-lock.txt


LOCK FILES NOT PRESENT NOW SO MUST BE SOME LAG BETWEEN THEIR unlink AND ACTUAL REMOVAL:

	ls: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22/chr22/lock/binbam-sort-chr22-lock.txt: No such file or directory

	ls: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33/chr22/lock/samToBam-chr22-lock.txt: No such file or directory




FIXED ELAND unbin RUN ETERNAL LOOP ERROR in App.pm AND Workflow.pm
------------------------------------------------------------------

flow.pl E:/0.5/bin/workflows/cluster/checkrun/checkrun.wk create --name checkrun

flow.pl E:/0.5/bin/workflows/cluster/checkrun/checkrun.wk loadCmd --cmdfile E:/0.5/bin/workflows/cluster/checkrun/signalsuccess.cmd --name signalsuccess

flow.pl E:/0.5/bin/workflows/cluster/checkrun/checkrun.wk loadCmd --cmdfile E:/0.5/bin/workflows/cluster/checkrun/signalfailure.cmd --name signalfailure

flow.pl E:/0.5/bin/workflows/cluster/checkrun/checkrun.wk loadCmd --cmdfile E:/0.5/bin/workflows/cluster/checkrun/signalsuccess.cmd --name signalsuccess


flow.pl checkrun.wk concise

Workflow:       checkrun

        Application     1       signalsuccess
        /nethome/syoung/0.5/bin/apps/logic/signalSuccess.pl


        Application     2       signalfailure
        /nethome/syoung/0.5/bin/apps/logic/signalFailure.pl


        Application     3       signalsuccess
        /nethome/syoung/0.5/bin/apps/logic/signalSuccess.pl


ADDED flow ALIAS TO flow.pl

flow checkrun.wk run


	...	
	[app 1 signalsuccess]
	2011-01-21 13:29:57
	
	  Application:
	  name           signalsuccess
	  owner          anonymous
	  location       /nethome/syoung/0.5/bin/apps/logic/signalSuccess.pl
	  ordinal        1
	  outputfile     1-signalsuccess.app.bkp
	
		Parameters:
		subjob2,subjob4,subjob6
		succeeded      
	
	Command:
	
	/nethome/syoung/0.5/bin/apps/logic/signalSuccess.pl \
	 succeeded \
	 subjob2,subjob4,subjob6 
	
	
	Output:
	
			#### SEND JOB COMPLETION SIGNAL
	------------------------------------------------------------
	---[completed succeeded: complete subjob2,subjob4,subjob6]---
	------------------------------------------------------------
	
	
	X::App::run    completed: complete
	X::App::run    label: succeeded
	Job label 'succeeded' completion signal: complete subjob2,subjob4,subjob6
	
	[app 2 signalfailure]
	2011-01-21 13:29:57
	
	  Application:
	  name           signalfailure
	  owner          anonymous
	  location       /nethome/syoung/0.5/bin/apps/logic/signalFailure.pl
	  ordinal        2
	  outputfile     2-signalfailure.app.bkp
	
		Parameters:
		failed         
		subjob1,subjob3,subjob5
	
	Command:
	
	/nethome/syoung/0.5/bin/apps/logic/signalFailure.pl \
	 failed \
	 subjob1,subjob3,subjob5 
	
	
	Output:
	
			#### SEND JOB COMPLETION SIGNAL
	------------------------------------------------------------
	---[completed failed: incomplete subjob1,subjob2]---
	------------------------------------------------------------
	
	
	X::App::run    completed: incomplete
	X::App::run    label: failed
	Job label 'failed' completion signal: incomplete subjob1,subjob2
	
	X::App::run    Quitting due to incomplete job
	X::Workflow::run    App did not complete. Please check the logfile: checkrun.wk.log



REDID copySplit.pl
------------------

SO THAT IT CAN BE RUN USING loop.pl, DOING EACH FILE DIRECTORY SEPARATELY IN PARALLEL

/nethome/syoung/0.5/bin/apps/aligners/copySplitfiles.pl \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1 \
--mode link



NOVOALIGN 1-33
--------------

RERUN NOVOALIGN ALIGNMENTS: Tue Jan 18 14:51:16 EST 2011


DUE TO ACCIDENTAL REMOVAL OF bowtie INPUT FILES, TO WHICH novoalign INPUT FILES WERE LINKED:

	CLEAN UP
	
	/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
	--mode subdirs,splitfiles \
	--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie \
	--references chr22
	
		RUNNING
		Fri Jan 14 17:22:35 EST 2011


SO novoalign WAS ONLY RUN COMPLETELY ON THE FIRST 9 FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/hit.bam

	-rw-rw-rw- 1 syoung root 1.1G Jan 14 19:43 1/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 1.1G Jan 14 19:44 2/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 1.1G Jan 14 19:44 3/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 1.1G Jan 14 19:44 4/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 1.1G Jan 14 19:43 5/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 1.1G Jan 15 03:38 6/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 1.1G Jan 14 19:44 7/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 1.1G Jan 14 19:44 8/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 1.1G Jan 14 19:44 9/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 20/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 21/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 8.1M Jan 14 19:36 22/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 23/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 24/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 25/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 26/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 27/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 28/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 7.5M Jan 14 19:36 29/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 996M Jan 14 19:43 10/chr22/hit.bam
	-rw-rw-rw- 1 syoung root  18M Jan 14 19:36 11/chr22/hit.bam
	-rw-rw-rw- 1 syoung root  16M Jan 14 19:36 12/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 8.4M Jan 14 19:36 13/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 14/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 267K Jan 14 19:36 15/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 5.1M Jan 14 19:36 16/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 17/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 18/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 19/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 30/chr22/hit.bam
	-rw-rw-rw- 1 syoung root  13M Jan 14 19:36 31/chr22/hit.bam
	-rw-rw-rw- 1 syoung root   76 Jan 14 19:36 32/chr22/hit.bam
	-rw-rw-rw- 1 syoung root 8.4M Jan 14 19:36 33/chr22/hit.bam


I.E., FILE 14 SAM FILES HAVE NO ALIGNMENTS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14/chr22/

head 1/out.sam
@HD     VN:1.0  SO:unsorted
@PG     ID:novoalign    VN:V2.05.33     CL:novoalign -o SAM -r All 1 -i 200 50 -d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14/1/novoalign-14_1.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14/1/novoalign-14_2.1.txt

ll */out.sam
    
    -rw-rw-rw- 1 syoung root 401 Jan 14 17:47 100/out.sam
    -rw-rw-rw- 1 syoung root 401 Jan 14 17:47 101/out.sam
    -rw-rw-rw- 1 syoung root 401 Jan 14 17:47 102/out.sam
    ...




    


ELAND 1-33
----------

flow.pl    Run time: 01:10:32
flow.pl    Date: 4:15AM, 18 January 2011
flow.pl    Command:
flow.pl    /nethome/syoung/0.5/bin/apps/logic/flow.pl /nethome/syoung/0.5/bin/workflows/cluster/eland/elandsnp.wk run --outputdir /nethome/syoung/0.5/bin/workflows/cluster/eland/run --start 1 --stop 1
flow.pl
flow.pl    ****************************************



</entry>

<entry [Sun 2011:0106 23:51:48 EST] RUN ALL SAMPLES flow - ELAND TEST>



flow.pl E:\0.5\bin\workflows\cluster\eland\splitfiles.app app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\eland\splitfiles.cmd type util --name splitfiles --description "Split input files into subfiles and print list of subfiles to file splitfile.txt in target directory"

	Run time: 00:17:44
	Completed /nethome/syoung/0.5/bin/apps/logic/loop.pl
	6:53PM, 17 January 2011
	****************************************


NOVOALIGN FILES 1-33
--------------------

1) ALIGNMENT + SNPS

CREATE APPS

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\novo\novo.cmd --outputfile E:\0.5\bin\workflows\cluster\novo\novo.app --type aligner --name novo --description "Concurrent loop through 1-33 files doing NOVOALIGN alignment with split read input files"

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\novo\binbam.cmd --outputfile E:\0.5\bin\workflows\cluster\novo\binbam.app --type binner --name binbam --description "Bin a .bam file into smaller .bam files covering UCSC bins or user-defined genomic intervals"

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\novo\cumulativebam.cmd --outputfile E:\0.5\bin\workflows\cluster\novo\cumulativebam.app --type binner --name cumulativebam --description "Cumulatively merge .bam files, can use UCSC bins or user-defined genomic intervals"


CREATE WORKFLOW

flow.pl create --name novosnp --wkfile E:\0.5\bin\workflows\cluster\novo\novosnp.wk

ADD APPS

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\novo\novosnp.wk --appfile E:\0.5\bin\workflows\cluster\novo\novo.app

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\novo\novosnp.wk --appfile E:\0.5\bin\workflows\cluster\novo\binbam.app

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\novo\novosnp.wk --appfile E:\0.5\bin\workflows\cluster\novo\cumulativebam.app


RUN Novoalign 1-3

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo/run

	flow.pl    Run time: 07:45:30
	flow.pl    Date: 9:31PM, 14 January 2011
	flow.pl    Command:
	flow.pl    /nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo/run
	flow.pl
	flow.pl    ****************************************


AND ALL COMPLETE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/check/

	
grep -n incomplete */chr22/check/*/check.log 

	6/chr22/check/binBam-sort/check.log	
	incomplete        -       -       /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6/chr22/lock/binbam-sort-chr22-lock.txt


BUT LOCK FILE IS NOT THERE:

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6/chr22/lock/binbam-sort-chr22-lock.txt

	ls: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6/chr22/lock/binbam-sort-chr22-lock.txt: No such file or directory


CLEAN UP

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs,splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie \
--references chr22

	RUNNING
	Fri Jan 14 17:22:35 EST 2011


2) SNPs

bamtosnp
--------

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\novo\bamtosnp.cmd --outputfile E:\0.5\bin\workflows\cluster\novo\bamtosnp.app --type snp --name bamtosnp --description "Call SNPs from .bam files using samtools"

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\novo\novosnp.wk --appfile E:\0.5\bin\workflows\cluster\novo\bamtosnp.app
	
	Run time: 00:02:41
	Completed /nethome/syoung/0.5/bin/apps/logic/loop.pl
	3:14AM, 15 January 2011
	****************************************


RUN Novoalign 4

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo/run --start 4 --stop 4

	flow.pl
	flow.pl    Run time: 04:55:18
	flow.pl    Date: 0:55AM, 16 January 2011
	flow.pl    Command:
	flow.pl    /nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo/run --start 4 --stop 4
	flow.pl
	flow.pl    ****************************************


NB: OUTPUT ERRORS IN Cluster::parseUsagefile PROBABLY DUE TO DELAY IN SCHEDULER OUTPUT FILE CREATION:

	Use of uninitialized value in open at /nethome/syoung/0.5/bin/apps/snp/../../../lib/Cluster.pm line 3930, < FILE > line 2.
	Use of uninitialized value in concatenation (.) or string at /nethome/syoung/0.5/bin/apps/snp/../../../lib/Cluster.pm line 3943, < FILE > line 2.

BUT CONFIRMED THAT ALL JOBS COMPLETED IN check.log

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/check/binBamToSnp
emacs check.log
	
	
snptosav
--------

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\novo\snptosav.cmd --outputfile E:\0.5\bin\workflows\cluster\novo\snptosav.app --type snp --name snptosav --description "Annotate SNPs, including coincidence with dbSNP"

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\novo\novosnp.wk --appfile E:\0.5\bin\workflows\cluster\novo\snptosav.app
	

RUN NOVOALIGN 5

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/novo/novosnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo/run --start 5 --stop 5


</entry>

<entry [Sun 2011:0106 23:51:48 EST] RUN ALL SAMPLES flow - NOVO TEST>


/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--executable /nethome/syoung/0.5/bin/apps/aligners/NOVOALIGN.pl \
--replicates 1-2 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.10000.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.10000.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novo-test/%REPLICATE% \
--params "-r All 1" \
--distance 200 \
--deviation 50 \
--species human \
--label novo-test-chr22-%REPLICATE% \
--maxjobs 2000 \
--queue large \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--clean \
--reads 1000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novo-test/%REPLICATE%/novo-test.out \
--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novo-test/loop-novo-test.out

	Run time: 00:04:09
	Completed /nethome/syoung/0.5/bin/apps/logic/loop.pl
	11:49AM, 14 January 2011
	****************************************

CREATE APPS

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\novo-test\novo.cmd --outputfile E:\0.5\bin\workflows\cluster\novo-test\novo.app --type aligner --name novo --description "Concurrent loop through files doing NOVOALIGN alignment with split read input files" --notes "TEST - files 1 and 2 only"

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\novo-test\binbam.cmd --outputfile E:\0.5\bin\workflows\cluster\novo-test\binbam.app --type binner --name binbam --description "Bin a .bam file into smaller .bam files covering UCSC bins or user-defined genomic intervals"

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\novo-test\cumulativebam.cmd --outputfile E:\0.5\bin\workflows\cluster\novo-test\cumulativebam.app --type binner --name cumulativebam --description "Cumulatively merge .bam files, can use UCSC bins or user-defined genomic intervals"


CREATE WORKFLOW

flow.pl create --name novosnp --wkfile E:\0.5\bin\workflows\cluster\novo-test\novosnp.wk

ADD APPS

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\novo-test\novosnp.wk --appfile E:\0.5\bin\workflows\cluster\novo-test\novo.app

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\novo-test\novosnp.wk --appfile E:\0.5\bin\workflows\cluster\novo-test\binbam.app

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\novo-test\novosnp.wk --appfile E:\0.5\bin\workflows\cluster\novo-test\cumulativebam.app



RUN WORKFLOW ON PEGASUS

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/novo-test/novosnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo-test/run

	flow.pl    Run time: 00:17:16
	flow.pl    Date: 12:14AM, 14 January 2011
	flow.pl    Command:
	flow.pl    /nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/novo-test/novosnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/novo-test/run
	flow.pl
	flow.pl    ****************************************



</entry>


<entry [Sun 2011:0106 23:51:48 EST] RUN ALL SAMPLES flow - BOWTIE 1-33>
 

CREATE APPS

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\bowtie.cmd --outputfile E:\0.5\bin\workflows\cluster\bowtie\bowtie.app --type aligner --name bowtie --description "Concurrent loop through 1-33 files doing Bowtie alignment with split read input files"

	BOWTIE::run    Completed STRATEGY 2: SORT MERGED SAM FILE
	BOWTIE.pl    Run time: 04:57:41
	BOWTIE.pl    Completed /nethome/syoung/0.5/bin/apps/aligners/BOWTIE.pl
	BOWTIE.pl    7:48AM, 14 January 2011
	BOWTIE.pl    ****************************************

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\binbam.cmd --outputfile E:\0.5\bin\workflows\cluster\bowtie\binbam.app --type binner --name binbam --description "Bin a .bam file into smaller .bam files covering UCSC bins or user-defined genomic intervals"

	Run time: 00:10:24
	Completed /nethome/syoung/0.5/bin/apps/logic/loop.pl
	8:02AM, 14 January 2011
	****************************************

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\cumulativebam.cmd --outputfile E:\0.5\bin\workflows\cluster\bowtie\cumulativebam.app --type binner --name cumulativebam --description "Cumulatively merge .bam files, can use UCSC bins or user-defined genomic intervals"

	Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
	cumulativeBam.pl    Run time: 02:02:33
	cumulativeBam.pl    Completed /nethome/syoung/0.5/bin/apps/snp/cumulativeBam.pl
	cumulativeBam.pl    10:04AM, 14 January 2011
	cumulativeBam.pl    ****************************************



WHOLE WORKFLOW TOOK 7 HOURS:

	flow.pl
	flow.pl    Run time: 07:13:23
	flow.pl    Date: 10:04AM, 14 January 2011
	flow.pl    Command:
	flow.pl    /nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/bowtie/bowtiesnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/bowtie/run
	flow.pl
	flow.pl    ****************************************


AND ALL COMPLETE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/check/
	...
	drwxrwxrwx   2 syoung root   80 Jan 14 07:54 binBam-index
	drwxrwxrwx   2 syoung root   80 Jan 14 07:55 binBam-range
	drwxrwxrwx   2 syoung root   78 Jan 14 07:54 binBam-sort
	drwxrwxrwx   2 syoung root   19 Jan 14 06:57 BOWTIE
	drwxrwxrwx   2 syoung root   19 Jan 14 07:21 mergeSam
	drwxrwxrwx   2 syoung root   72 Jan 14 07:48 samToBam
	drwxrwxrwx   2 syoung root   19 Jan 14 07:46 sortSam
	drwxrwxrwx   2 syoung root   19 Jan 14 07:18 subdirSamHits
	...
	
grep -n incomplete */chr22/check/*/check.log 
	
	OK


bamtosnp
--------
flow.pl E:\0.5\bin\workflows\cluster\bowtie\bamtosnp.app app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\bamtosnp.cmd --type snp --name bamtosnp --description "Call SNPs from .bam files using samtools"

flow.pl E:\0.5\bin\workflows\cluster\bowtie\bowtiesnp.wk addApp --appfile E:\0.5\bin\workflows\cluster\bowtie\bamtosnp.app
	
	Run time: 00:02:41
	Completed /nethome/syoung/0.5/bin/apps/logic/loop.pl
	3:14AM, 15 January 2011
	****************************************

RUN

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/bowtie/bowtiesnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/bowtie/run --start 4 --stop 4



snptosav
--------

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie\sav.cmd --outputfile E:\0.5\bin\workflows\cluster\bowtie\snptosav.app --type snp --name snptosav --description "Annotate SNPs, including coincidence with dbSNP"

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\bowtie\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\bowtie\snptosav.app
	

RUN

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/bowtie/bowtiesnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/bowtie/run --start 5 --stop 5







DESC APPS

flow.pl app desc --appfile E:\0.5\bin\workflows\cluster\bowtie.app


CREATE WORKFLOW

flow.pl create --name bowtiesnp --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\bowtie.app

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\binbam.app

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\cumulativesnp.app


RUN WORKFLOW ON PEGASUS

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/bowtie/bowtiesnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/bowtie/run






BOWTIE FILE 10
--------------

flow.pl app param edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --param inputfiles --field value --value /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-10.reads_1.sequence.txt

flow.pl app param edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --param matefiles --field value --value /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-10.reads_2.sequence.txt

flow.pl app param edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --param outputdir --field value --value /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1


/nethome/syoung/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-10.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-10.reads_2.sequence.txt \
--species human \
--distance 200 \
--label bowtie-1 \
--maxjobs 1000 \
--walltime 24 \
--clean \
--queue small \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/1 \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--cluster LSF \
--cpus 1 \
--reads 100000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/1/bowtie.out

	Cluster::printUsage    usagefile absent
	Cluster::printUsage    Printing USAGE file: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/1/bowtie-USAGE.txt
	BOWTIE::run    After printUsage       11-01-13 14:52:16
	BOWTIE.pl    Run time: 00:53:22
	BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
	BOWTIE.pl    2:52PM, 13 January 2011
	BOWTIE.pl    ****************************************






BOWTIE TEST
-----------

CREATE APPS

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie-test\bowtie.cmd --outputfile E:\0.5\bin\workflows\cluster\bowtie-test\bowtie.app --type aligner --name bowtie --description "Concurrent loop through files doing Bowtie alignment with split read input files" --notes "TEST - files 1 and 2 only"

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie-test\binbam.cmd --outputfile E:\0.5\bin\workflows\cluster\bowtie-test\binbam.app --type binner --name binbam --description "Bin a .bam file into smaller .bam files covering UCSC bins or user-defined genomic intervals"

flow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\bowtie-test\cumulativebam.cmd --outputfile E:\0.5\bin\workflows\cluster\bowtie-test\cumulativebam.app --type binner --name cumulativebam --description "Cumulatively merge .bam files, can use UCSC bins or user-defined genomic intervals"






CREATE WORKFLOW

flow.pl create --name bowtiesnp --wkfile E:\0.5\bin\workflows\cluster\bowtie-test\bowtiesnp.wk

ADD APPS

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\bowtie-test\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\bowtie-test\bowtie.app

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\bowtie-test\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\bowtie-test\binbam.app

flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\bowtie-test\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\bowtie-test\cumulativebam.app



RUN WORKFLOW ON PEGASUS

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/bowtie-test/bowtiesnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/bowtie-test/run

	flow.pl    
	flow.pl    Run time: 00:03:20
	flow.pl    Date: 2:22AM, 14 January 2011
	flow.pl    Command: 
	flow.pl    /nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/bowtie-test/bowtiesnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/bowtie-test/run
	flow.pl    
	flow.pl    ****************************************



flow.pl addApp --wkfile E:\0.5\bin\workflows\cluster\bowtie-test\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\bowtie-test\sav.app

RUN

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/bowtie-test/bowtiesnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/bowtie-test/run --start 5 --stop 5
	
	SAV::run    END binSnpToSav()       11-01-15 23:57:45
	SAV.pl    Run time: 00:01:12
	SAV.pl    Completed /nethome/syoung/0.5/bin/apps/snp/SAV.pl
	SAV.pl    11-01-15 23:57:45
	SAV.pl    ****************************************






TEST INPUT FILES (40,000 LINES, 10,000 READS):

FILES

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader
ll *1000*
	-rw-rw-r-- 1 syoung root 1.4M Jan 14 01:44 yoruba1-1.reads_1.10000.sequence.txt
	-rw-rw-r-- 1 syoung root 1.4M Jan 14 01:44 yoruba1-1.reads_2.10000.sequence.txt
	-rw-rw-r-- 1 syoung root 1.4M Jan 14 01:44 yoruba1-2.reads_1.10000.sequence.txt
	-rw-rw-r-- 1 syoung root 1.4M Jan 14 01:44 yoruba1-2.reads_2.10000.sequence.txt

FILE 1:

INPUTFILES
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.10000.sequence.txt

MATEFILES
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.10000.sequence.txt

FILE 2:	

INPUTFILES
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-2.reads_1.10000.sequence.txt

MATEFILES
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-2.reads_2.10000.sequence.txt


OUTPUTDIRS
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/1
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/2



RUN

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/bowtiesnp.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/runs/bowtiesnp --start 1 --stop 1


/nethome/syoung/0.5/bin/apps/aligners/BOWTIE.pl \
 --inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-10.reads_1.10000.sequence.txt \
 --matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-10.reads_2.10000.sequence.txt \
 --species human \
 --distance 200 \
 --label bowtie-test \
 --maxjobs 1000 \
 --walltime 24 \
 --queue small \
 --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/1 \
 --reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
 --cluster LSF \
 --cpus 1 \
 --reads 1000 \
 --stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/1/bowtie.out 
		
		BOWTIE.pl    Run time: 00:00:41
		BOWTIE.pl    Completed /nethome/syoung/0.5/bin/apps/aligners/BOWTIE.pl
		BOWTIE.pl    9:19PM, 13 January 2011
		BOWTIE.pl    ****************************************



SET location, name AND description
----------------------------------

flow.pl app edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --field location --value /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl

flow.pl app edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --field name --value bowtie

flow.pl app edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --field description --value "Run Bowtie aligner with split read files"

TEST ADDITIONS - OK


flow.pl app param edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --param inputfiles --field value --value /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-10.reads_1.10000.sequence.txt

flow.pl app param edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --param matefiles --field value --value /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-10.reads_2.10000.sequence.txt

flow.pl app param edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --param outputdir --field value --value /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/1


 
/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl  \
--binlevel 2500000 \
--filename hit.bam \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/33 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3 \
--species human \
--label eland-cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000
 



SLEEP TEST
----------

/nethome/syoung/0.5/bin/apps/logic/flow.pl run --wkfile /nethome/syoung/0.5/bin/workflows/cluster/sleep.wk --outputdir /nethome/syoung/0.5/bin/workflows/cluster/run/sleep

	OK
	

</entry>

<entry [Tue Jan 25 00:23:35 EST 2011] ANALYSIS WORKFLOWS>


                  PREVIOUS    BOWTIE     NOVOALIGN     ELAND
APPLICATION		 DURATIONS	 DURATIONS   DURATIONS   DURATIONS

#### align

ALIGNER.pl	     4-30 HOURS   2 HOURS     4 HOURS    2 HOURS

#### snp

binBam.pl          10 MINS   10 MINS    10 MINS      5 MINS
cumulativeBam.pl 9-30 HOURS	  2 HOURS    2 HOURS     1 HOUR
bamToSnp.pl         3 HOURS   5 MINS     5 MINS      5 MINS
snpVenn.pl       1-10 HOURS   5 MINS     5 MINS      5 MINS
snpCounts.pl
collateVenn.pl   	2 MINS    2 MINS     2 MINS      2 MINS    

#### sav

SAV.pl           8-25 HOURS   5 HOURS    5 HOURS     5 HOURS   
snpVenn.pl       1-10 HOURS   5 MINS     5 MINS      5 MINS
collateVenn.pl   	2 MINS    2 MINS     2 MINS      2 MINS    

#### venn (sav)

snpVenn.pl       1-10 HOURS   5 MINS     5 MINS      5 MINS
collateVenn.pl   	2 MINS    2 MINS     2 MINS      2 MINS    

#### coverage

unbin.pl       		2 MINS    2 MINS     2 MINS      2 MINS
bamCoverage.pl              




</entry>




<entry [Fri Jan 21 14:10:23 EST 2011] CREATED VENN.pl TO RUN snpToVenn.pl ON BINNED FILES>

/nethome/syoung/0.5/bin/apps/snp/VENN.pl \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22 \
--querylabel eland \
--targetlabel bowtie \
--binlevel 500000 \
--suffix "-1.sav" \
--filename hit.bam \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/2 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24


WHICH RUNS:

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-2.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-2.sav \
--querylabel eland-2 \
--targetlabel bowtie-2 \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie





</entry>



<entry [Wed Dec  8 12:31:18 EST 2010] RUN STATUS SUMMARY>

                  
SAV.pl                      8-25 HOURS
unbinSnp.pl                 2 MINS  
snpVenn.pl                  1-10 HOURS
createIntervalFiles.pl      1 MIN
realignBam.pl               1-2.5 HOURS
bamToSnp.pl                 3 HOURS
snpVenn.pl                  1-3 HOURS
collateVenn.pl              1-2 MINS


ELAND
-----
binBam.pl                   COMPLETED
cumulativeSnp.pl            COMPLETED
snpVenn.pl                  RUNNING Tue Nov 30 15:00:09 EST 2010
                            COMPLETED
SAV.pl                      RUNNING Fri Dec  3 07:58:49 EST 2010
                            COMPLETED Fri Dec  3 23:23:49 EST 2010
SAV.pl (cumulative4)        RUNNING Sat Dec  4 11:23:26 EST 2010
unbin.pl                    COMPLETED Sat Dec  4 01:33:49 EST 2010
                            RE-RUNNING Tue Dec  7 01:47:22 EST 2010

unbinSnp.pl                 COMPLETED Mon Dec  6 11:43:24 EST 2010
snpVenn.pl *sav             RUNNING Mon Dec  6 13:15:16 EST 2010
snpVenn.pl *snp             RUNNING Tue Dec  7 10:53:18 EST 2010
                            COMPLETED Tue Dec  7 11:15:18 EST 2010
collateVenn.pl *sav         COMPLETED Tue Dec  7 23:45:04 EST 2010
collateVenn.pl *snp         COMPLETED Tue Dec  7 23:22:04 EST 2010



MAQ
---
MAQ.pl FILES 1 TO 33        RUNNING Tue Nov 30 10:23:02 EST 2010
                            COMPLETED
binBam.pl                   RUNNING Tue Nov 30 17:21:15 EST 2010
                            COMPLETED
cumulativeSnp.pl            FILE 11 Wed Dec  1 01:23:24 EST 2010
                            COMPLETED Sun Dec  5 12:44:24 EST 2010
SAV.pl (cumulative4)        RUNNING Fri Dec  3 07:58:49 EST 2010
                            RERAN FILES 29-33  Sun Dec  5 16:44:27 EST 2010
                            COMPLETED Mon Dec  6 08:04:27 EST 2010
                            RE-RERAN FILES 29-33 Mon Dec  6 22:55:58 EST 2010
                            COMPLETED Mon Dec  6 23:09:58 EST 2010
unbin.pl *sav               RE-RUNNING Tue Dec  7 01:47:22 EST 2010

unbinSnp.pl *snp            COMPLETED Mon Dec  6 11:43:24 EST 2010
snpVenn.pl *sav             RUNNING Mon Dec  6 13:15:16 EST 2010
snpVenn.pl *snp             RUNNING Tue Dec  7 10:53:18 EST 2010
collateVenn.pl *sav         
collateVenn.pl *snp         


BOWTIE
------
BOWTIE.pl FILES 2 TO 12     RUNNING Mon Nov 29 22:26:33 EST 2010
binBam.pl                   COMPLETED
cumulativeSnp.pl            RUNNING Tue Nov 30 01:33:37 EST 2010
                            FILE 30 Tue Nov 30 09:56:56 EST 2010
                            COMPLETED
SAV.pl                      RUNNING Fri Dec  3 07:58:49 EST 2010
                            COMPLETED    
unbin.pl *sav               COMPLETED Mon Dec  6 09:54:24 EST 2010
                            RE-RUNNING Tue Dec  7 01:47:22 EST 2010
                            
unbinSnp.pl *snp            COMPLETED Mon Dec  6 11:43:24 EST 2010
snpVenn.pl *sav             RUNNING Mon Dec  6 13:15:16 EST 2010
                            RE-RUNNING Tue Dec  7 02:21:00 EST 2010
snpVenn.pl *snp             RUNNING Tue Dec  7 02:21:00 EST 2010
                            COMPLETED Tue Dec  7 11:27:57 EST 2010
collateVenn.pl *sav         
collateVenn.pl *snp         COMPLETED Tue Dec  7 21:05:11 EST 2010
snpCounts.pl                FAILED - MIGHT EXPLAIN ERRATIC FILES
bamCoverage.pl              



BOWTIE-RF
---------
FILE 4 bowtie-rf            RUNNING Mon Nov 29 22:52:53 EST 2010
binBam.pl                   COMPLETED
cumulativeSnp.pl            RUNNING Tue Nov 30 00:18:55 EST 2010
                            FILE 4 Tue Nov 30 00:27:35 EST 2010                   
                            FILE 33 Tue Nov 30 10:07:41 EST 2010
                            COMPLETED
unbin.pl *sav               COMPLETED Mon Dec  6 09:55:24 EST 2010
                            RE-RUNNING Tue Dec  7 01:47:22 EST 2010

unbinSnp.pl                 COMPLETED Mon Dec  6 11:43:24 EST 2010
SAV.pl                      RUNNING
                            COMPLETED
snpVenn.pl *sav             RUNNING Mon Dec  6 13:15:16 EST 2010
snpVenn.pl *snp             RUNNING Tue Dec  7 10:53:18 EST 2010
                            COMPLETED Tue Dec  7 17:31:18 EST 2010
collateVenn.pl *sav         
collateVenn.pl *snp         
snpCounts.pl                COMPLETED 
bamCoverage.pl              


NOVOALIGN
---------
binBam.pl                   COMPLETED
cumulativeSnp.pl            RUNNING Mon Nov 29 23:06:18 EST 2010
                            FILE 6  Tue Nov 30 00:22:59 EST 2010
                            FILE 8  Tue Nov 30 01:20:04 EST 2010
                            FILE 16 Tue Nov 30 10:02:18 EST 2010
                            FILE 17 Tue Nov 30 11:11:21 EST 2010
                            FILE 19 Tue Nov 30 15:07:54 EST 2010
                            FILE 20 Tue Nov 30 17:14:15 EST 2010
                            FILE 20 Wed Dec  1 01:25:15 EST 2010
                            FILE 20 Wed Dec  1 11:40:56 EST 2010 (STALLED)
                            RE-RUNNING FROM FILE 20 Mon Nov 29 23:06:18 EST 2010
                            FILE 21 Wed Dec  1 13:50:40 EST 2010
                            FILE 25 Wed Dec  1 23:29:32 EST 2010
                            FILE 27 Thu Dec  2 05:15:05 EST 2010
                            FILE 28 Thu Dec  2 08:19:39 EST 2010
                            FILE 29 Thu Dec  2 11:32:49 EST 2010
                            FILE 30 Thu Dec  2 14:56:32 EST 2010
                            FILE 31 Thu Dec  2 18:30:05 EST 2010
SAV.pl                      RUNNING Fri Dec  3 07:58:49 EST 2010
                            COMPLETED BUT MISSING FILES 32 AND 33
                            RUNNING FILES 32 AND 33
                            COMPLETED Mon Dec  6 10:31:24 EST 2010
unbin.pl *sav               COMPLETED Mon Dec  6 10:34:24 EST 2010
unbinSnp.pl                 COMPLETED Mon Dec  6 11:43:24 EST 2010
snpVenn.pl *sav             RUNNING Mon Dec  6 13:15:16 EST 2010
                            COMPLETED Mon Dec  6 16:28:16 EST 2010
snpVenn.pl *snp             RUNNING Tue Dec  7 10:53:18 EST 2010
                    
collateVenn.pl *sav         
collateVenn.pl *snp         



COMPARISON (*sav)
----------

snpVenn.pl eland v maq              COMPLETED Mon Dec  6 15:24:57 EST 2010 (BAD MAQ)
snpVenn.pl eland v bowtie           COMPLETED Mon Dec  6 15:24:57 EST 2010
snpVenn.pl eland v bowtie-rf        COMPLETED Mon Dec  6 15:24:57 EST 2010
snpVenn.pl eland v novoalign        COMPLETED Mon Dec  6 15:24:57 EST 2010
snpVenn.pl bowtie v novoalign       RUNNING Tue Dec  7 03:48:32 EST 2010


collateVenn.pl eland v maq          COMPLETED Mon Dec  6 13:24:57 EST 2010
collateVenn.pl eland v bowtie       COMPLETED Mon Dec  6 13:24:57 EST 2010   
collateVenn.pl eland v bowtie-rf    COMPLETED Mon Dec  6 13:24:57 EST 2010   
collateVenn.pl eland v novoalign    COMPLETED Mon Dec  6 13:24:57 EST 2010
collateVenn.pl bowtie v novoalign   RUNNING Tue Dec  7 10:53:18 EST 2010
                                    COMPLETED Tue Dec  7 07:44:28 EST 2010
    

COMPARISON (*snp)
----------

snpVenn.pl eland v maq              COMPLETED Tue Dec  7 02:25:57 EST 2010
snpVenn.pl eland v bowtie           COMPLETED Tue Dec  7 02:41:49 EST 2010
snpVenn.pl eland v bowtie-rf        COMPLETED Tue Dec  7 01:53:11 EST 2010
snpVenn.pl eland v novoalign        COMPLETED Tue Dec  7 01:40:18 EST 2010
snpVenn.pl bowtie v novoalign       COMPLETED Tue Dec  7 21:21:32 EST 2010


collateVenn.pl eland v maq          
collateVenn.pl eland v bowtie       
collateVenn.pl eland v bowtie-rf    
collateVenn.pl eland v novoalign    
collateVenn.pl bowtie v novoalign       




REALIGNED
---------

ELAND
-----
createIntervalFiles.pl      COMPLETED
realignBam.pl               RUNNING Sat Dec  4 23:54:24 EST 2010
                            COMPLETED Sun Dec  5 00:09:38 EST 2010
bamToSnp.pl                 
SAV.pl                      
unbin.pl *sav                
unbinSnp.pl *snp                
snpVenn.pl *sav             
snpVenn.pl *snp             
collateVenn.pl *sav         
collateVenn.pl *snp         
snpCounts.pl
bamCoverage.pl              


MAQ
---
REALIGN:
createIntervalFiles.pl      COMPLETED
realignBam.pl               RUNNING Mon Dec  6 12:16:41 EST 2010
                            COMPLETED Mon Dec  6 14:03:41 EST 2010
bamToSnp.pl
SAV.pl                      
unbin.pl *sav                
unbinSnp.pl *snp                
snpVenn.pl *sav             
snpVenn.pl *snp             
collateVenn.pl *sav         
collateVenn.pl *snp         
snpCounts.pl
bamCoverage.pl              


BOWTIE
------

createIntervalFiles.pl      COMPLETED
realignBam.pl               RUNNING Mon Dec  6 00:12:24 EST 2010
                            COMPLETED Mon Dec  6 02:33:38 EST 2010
bamToSnp.pl
SAV.pl                      
unbin.pl *sav                
unbinSnp.pl *snp                
snpVenn.pl *sav             RUNNING Tue Dec  7 02:21:00 EST 2010 ??

snpVenn.pl *snp             
collateVenn.pl *sav         
collateVenn.pl *snp         
snpCounts.pl
bamCoverage.pl              


BOWTIE-RF
---------

createIntervalFiles.pl      COMPLETED
realignBam.pl               RUNNING Mon Dec  6 00:12:24 EST 2010
                            COMPLETED Mon Dec  6 02:32:24 EST 2010
bamToSnp.pl
SAV.pl                      
unbin.pl *sav                
unbinSnp.pl *snp                
snpVenn.pl *sav             
snpVenn.pl *snp             
collateVenn.pl *sav         
collateVenn.pl *snp         
snpCounts.pl
bamCoverage.pl              


NOVOALIGN
---------


REALIGN:
createIntervalFiles.pl      COMPLETED
realignBam.pl               RUNNING Mon Dec  6 00:12:24 EST 2010
                            COMPLETED Mon Dec  6 01:09:38 EST 2010
bamToSnp.pl
SAV.pl                      
unbin.pl *sav                
unbinSnp.pl *snp                
snpVenn.pl *sav             
snpVenn.pl *snp             
collateVenn.pl *sav         
collateVenn.pl *snp         
snpCounts.pl
bamCoverage.pl              

                  
</entry>


<entry [Mon Jan 10 16:21:28 EST 2011] WORKFLOW STATUS TO DATE>



**aligner**
binBam.pl                   COMPLETED
cumulativeSnp.pl            COMPLETED
snpVenn.pl                  RUNNING Tue Nov 30 15:00:09 EST 2010
SAV.pl                      RUNNING Fri Dec  3 07:58:49 EST 2010
unbin.pl     *sav           COMPLETED Sat Dec  4 01:33:49 EST 2010
unbinSnp.pl  *snp           COMPLETED Mon Dec  6 11:43:24 EST 2010
snpVenn.pl *sav             RUNNING Mon Dec  6 13:15:16 EST 2010
snpVenn.pl *snp             RUNNING Tue Dec  7 10:53:18 EST 2010
collateVenn.pl *sav         COMPLETED Tue Dec  7 23:45:04 EST 2010
collateVenn.pl *snp         COMPLETED Tue Dec  7 23:22:04 EST 2010


Workflows
---------

1) alignment + snp

CREATE APPS
perl workflow.pl app loadCmd --inputfile E:\0.5\bin\workflows\cluster\files\bowtie.txt --outputfile E:\0.5\bin\workflows\cluster\bowtie.app --type aligner

perl workflow.pl app loadCmd --name binbam --inputfile E:\0.5\bin\workflows\cluster\files\binbam.txt --outputfile E:\0.5\bin\workflows\cluster\binbam.app --type aligner

perl workflow.pl app loadCmd --name cumulatievsnp --inputfile E:\0.5\bin\workflows\cluster\files\cumulativesnp.txt --outputfile E:\0.5\bin\workflows\cluster\cumulativesnp.app --type snp

DESC APPS

perl workflow.pl app desc --appfile E:\0.5\bin\workflows\cluster\bowtie.app


CREATE WORKFLOW

perl workflow.pl work create --name bowtiesnp --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk

ADD APPS

perl workflow.pl work addApp --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --appfile E:\0.5\b
in\workflows\cluster\bowtie.app

perl workflow.pl work addApp --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\binbam.app

perl workflow.pl work addApp --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --appfile E:\0.5\bin\workflows\cluster\cumulativesnp.app


RUN WORKFLOW

perl workflow.pl work run E:\0.5\bin\workflows\cluster\bowtiesnp.wk


2) snpvenn

perl workflow.pl app loadCmd --name unbinsnp --inputfile E:\0.5\bin\workflows\cluster\files\unbinsnp.txt --outputfile E:\0.5\bin\workflows\cluster\unbinsnp.app --type cluster

perl workflow.pl app loadCmd --name snpvenn --inputfile E:\0.5\bin\workflows\cluster\files\snpvenn.txt --outputfile E:\0.5\bin\workflows\cluster\snpvenn.app --type cluster

perl workflow.pl app loadCmd --name collatesnpvenn --inputfile E:\0.5\bin\workflows\cluster\files\collatesnpvenn.txt --outputfile E:\0.5\bin\workflows\cluster\collatesnpvenn.app --type cluster


3) savvenn

perl workflow.pl app loadCmd --name sav --inputfile E:\0.5\bin\workflows\cluster\files\sav.txt --outputfile E:\0.5\bin\workflows\cluster\sav.app --type cluster

perl workflow.pl app loadCmd --name unbinsav --inputfile E:\0.5\bin\workflows\cluster\files\unbinsav.txt --outputfile E:\0.5\bin\workflows\cluster\unbinsav.app --type cluster

perl workflow.pl app loadCmd --name savvenn --inputfile E:\0.5\bin\workflows\cluster\files\savvenn.txt --outputfile E:\0.5\bin\workflows\cluster\savvenn.app --type cluster

perl workflow.pl app loadCmd --name collatesavvenn --inputfile E:\0.5\bin\workflows\cluster\files\collatesavvenn.txt --outputfile E:\0.5\bin\workflows\cluster\collatesavvenn.app --type cluster



TEST
----


*LOAD PARAMS FROM TSV FILE

perl workflow.pl param loadTsv --tsvfile E:\0.5\bin\sql\tsvfiles\parameter.tsv --outputdir E:\0.5\bin\workflows\cluster


CREATE PARAMS

perl workflow.pl param create --paramfile E:\0.5\bin\workflows\cluster\sleep.param --type logic --name sleep


COPY PARAMETER

perl workflow.pl param copy --paramfile E:\0.5\bin\workflows\cluster\sleep.param --outputfile E:\0.5\bin\workflows\cluster\sleep.copy.param


perl workflow.pl param copy --paramfile E:\0.5\bin\workflows\cluster\sleep.param --outputfile E:\0.5\bin\workflows\cluster\sleep.copy.param


REPLACE STRING IN PARAMETER

perl workflow.pl param replace E:\0.5\bin\workflows\cluster\sleep.copy.param --from sleep --to awake


REPLACE STRING IN PARAMETER

perl workflow.pl param replace --paramfile E:\0.5\bin\workflows\cluster\sleep.copy.param --from sleep --to awake




CREATE APP

perl workflow.pl app create --appfile E:\0.5\bin\workflows\cluster\sleep.app --type logic --name sleep

CREATE APP FROM CMD FILE

perl workflow.pl app loadCmd --cmdfile E:\0.5\bin\workflows\cluster\files\sleep.txt --appfile E:\0.5\bin\workflows\cluster\sleep.app --type cluster --name sleep


DESC APP

perl workflow.pl app desc --appfile E:\0.5\bin\workflows\cluster\sleep.app


REPLACE STRING IN ALL PARAMETERS IN APP

perl workflow.pl app replace --appfile E:\0.5\bin\workflows\cluster\sleep.app --from sleep --to awake

EDIT APP

perl workflow.pl work app edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --ordinal 1 --field name --value bowtieX



CREATE WORKFLOW
perl workflow.pl work create --name sleep --wkfile E:\0.5\bin\workflows\cluster\sleep.wk

perl workflow.pl work addApp --wkfile E:\0.5\bin\workflows\cluster\sleep.wk --appfile E:\0.5\bin\workflows\cluster\sleep.app


COPY WORKFLOW

perl workflow.pl work copy --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --outputfile E:\0.5\bin\workflows\cluster\elandsnp.wk


EDIT WORKFLOW

perl workflow.pl work edit --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --field name --value bowtiesnp


REPLACE STRING IN ALL PARAMETERS IN ALL APPS IN WORKFLOW

perl workflow.pl work app replace --appfile E:\0.5\bin\workflows\cluster\sleepsnp.wk --from sleep --to awake

perl workflow.pl work app replace --wkfile E:\0.5\bin\workflows\cluster\bowtiesnp.wk --from elandX --to bowtie



RUN WORKFLOW

perl workflow.pl work run --wkfile E:\0.5\bin\workflows\cluster\sleep.wk --outputdir E:\0.5\bin\workflows\cluster\sleep\runs\sleep1







</entry>




<entry [Tue Jan  4 01:21:28 EST 2011] CREATED workflow.pl, stage.pl AND workflow.pl USING MooseX::Declare>
                  
WORKFLOWS
---------

CREATE WORKFLOW AND SAVE TO JSON FILE

perl workflow.pl work create --name Alignment --outputfile E:\0.5\bin\workflows\cluster\alignment.wkf


EDIT WORKFLOW FIELD

perl workflow.pl work edit --inputfile E:\0.5\bin\workflows\cluster\alignment.wkf --field notes --value "NGS alignment"


DESC WORKFLOW 

perl workflow.pl work desc --inputfile E:\0.5\bin\workflows\cluster\alignment.wkf 


DESC WORKFLOW FIELD

perl workflow.pl work desc --inputfile E:\0.5\bin\workflows\cluster\alignment.wkf --field notes


ADD APP TO WORKFLOW

perl workflow.pl work addApp --inputfile E:\0.5\bin\workflows\cluster\alignment.wkf --appfile E:\0.5\bin\workflows\cluster\starcluster.json


ADD APP TO WORKFLOW

perl workflow.pl work addApp --inputfile E:\0.5\bin\workflows\cluster\alignment.wkf --appfile E:\0.5\bin\workflows\cluster\starcluster.json




APPS
----

CREATE APP FROM COMMAND FILE AND SAVE TO JSON FILE

perl workflow.pl app loadCmd --name bowtie --inputfile E:\0.5\bin\workflows\cluster\bowtie-1.txt --outputfile E:\0.5\bin\workflows\cluster\bowtie.app --type cluster


perl workflow.pl app loadCmd \
--name bowtie \
--inputfile ~/0.5/bin/workflows/cluster/bowtie-1.txt \
--outputfile ~/0.5/bin/workflows/cluster/bowtie.app \
--type cluster


CREATE APP AND SAVE TO JSON FILE

perl workflow.pl app create --name starcluster --location E:\0.5\bin\cluster\starcluster.pl --outputfile E:\0.5\bin\workflows\cluster\starcluster.json --type cluster


EDIT APP FIELD AND SAVE TO JSON FILE

perl workflow.pl edit --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --field notes --value "Notes for this application"

DESCRIBE APP FIELD

perl workflow.pl app desc --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --field notes 


COPY APP AND SAVE TO JSON FILE

perl workflow.pl copy --name starcluster --location E:\0.5\bin\cluster\starcluster.pl --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --type cluster --outputfile E:\0.5\bin\workflows\cluster\starcluster2.json



CREATE APP AND SAVE TO JSON FILE:

perl workflow.pl createApp --name starcluster --location E:\0.5\bin\cluster\starcluster.pl --outputfile E:\0.5\bin\workflows\cluster\starcluster.json --type cluster


PARAMS
------

ADD PARAMETER TO APP

perl workflow.pl addParam --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param inputfile	--type input--category inputfile --type file	--argument "\-\-inputfile" --discretion essential --format file



DELETE PARAMETER FROM APP

perl workflow.pl deleteParam --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param inputfile


ADD BOWTIE.pl PARAMETERS TO starcluster.pl 

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \

perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param inputfiles --argument '--inputfiles'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param matefiles --argument '--matefiles'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param species --argument '--species'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param distance --argument '--distance'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param label --argument '--label'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param maxjobs --argument '--maxjobs'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param walltime --argument '--walltime'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param clean --argument '--clean'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param queue --argument '--queue'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param outputdir --argument '--outputdir'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param reference --argument '--reference'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param cluster --argument '--cluster'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param cpus --argument '--cpus'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param reads --argument '--reads'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --param stdout --argument '--stdout'
perl workflow.pl addParam --name starcluster --inputfile E:\0.5\bin\workflows\cluster\starcluster.json 


COPY starcluster.pl TO BOWTIE.pl:

perl workflow.pl copy --inputfile E:\0.5\bin\workflows\cluster\starcluster.json --outputfile E:\0.5\bin\workflows\cluster\BOWTIE.json



/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.sequence.txt \
--species human \
--distance 200 \
--label bowtie-1 \
--maxjobs 1000 \
--walltime 24 \
--clean \
--queue small \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1 \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--cluster LSF \
--cpus 1 \
--reads 500000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/bowtie.out







admin	clusterMAQ	pipeline	outputdir	input	outputdir	directory	--outputdir	%project%/%workflow%	essential	dir	Absolute path to directory containing reference_sequences.2bpb, .idx and .vld files	inputs.acefile.value	acefile	var outputdir = acefile; outputdir = outputdir.replace(//[/]+$/, ""); return outputdir;
admin	clusterMAQ	pipeline	referencefile	input	referencefile	file	--referencefile		required					
admin	clusterMAQ	pipeline	sortedfile	output	sortedfile	file		%project%/%workflow%/s_1_1_sorted.txt	required					
admin	deepvac.pl	utility	downloaddir	input	downloaddir	directory	--downloaddir	%project%/%workflow%/download	required		Files are downloaded to this directory			
admin	deepvac.pl	utility	filter	input	filter	string	--filter		optional		Download only filenames containing this name fragment			
admin	deepvac.pl	utility	regex	input	regex	string	--regex		optional		Download only filenames matching this regex			
admin	deepvac.pl	utility	url	input	url	string	--url		required		URL of FTP site or link to file on web page			
admin	ELAND	alignment	clean	input	clean	flag	--clean		optional		Clean run (remove old splitfile)



</entry>


<entry [Mon Jan 10 16:18:28 EST 2011] RUN PROGRESS LIST BY APPLICATION>
                  

#### RUN cumulativeSnp.pl ON ALL
ELAND       #### DONE 
ELAND-2     #### DONE
BOWTIE      #### DONE. cumulative2 ALSO DONE BUT HAS MISSED FILES.
BOWTIE-rf   #### DONE   MISSING FILE 1. cumulative2 GOFEV
MAQ         #### RERUNNING AS cumulative2
                 STARTED Fri Nov 12 13:52:57 EST 2010
                 FILE 21 Mon Nov 15 01:01:05 EST 2010
                 
NOVOALIGN   #### RERUNNING AS cumulative2
                 STARTED Mon Nov 15 01:32:18 EST 2010
                 FILE 21, Tue Nov 16 13:49:30 EST 2010
                 CURTAILED DUE TO SYSTEM FAILURE.
                 RESTARTED FROM FILE 26 Mon Nov 22 23:56:01 EST 2010


#### RUN snpVenn.pl on all CUMULATIVE hit.snp FILES (ALL, dbSNP, non-dbSNP)
xcELAND       #### DONE
BOWTIE      #### ONWORKING
MAQ         
NOVOALIGN
ELAND2      
BOWTIE-rf   


#### RUN bamCoverage.pl ON ALL CUMULATIVE merged.bam-N FILES
ELAND       #### DONE Fri Nov  5 01:29:06 EDT 2010
BOWTIE      #### RUNNING Mon Nov  8 23:54:47 EST 2010 
MAQ         #### PARTIAL (1-10)
NOVOALIGN   


#### RUN SAV.pl ON ALL CUMULATIVE hit.snp FILES
ELAND       #### DONE
BOWTIE      #### RUNNING (03, FILE 32) Tue Nov  9 12:41:46 EST 2010 
MAQ         #### PARTIAL (1-10 ONLY, WAITING FOR cumulativeSnp.pl TO FINISH)
NOVOALIGN   #### 


#### RERAN ELAND AS eland
#### RUN samVenn.pl eland VS eland     #### RUNNING Tue Nov  9 12:12:28 EST 2010
#### NB: MANUAL TEST (FILE 10 hit.sam) SHOWED IDENTICAL EXCEPT FOR AS:i:0 TAG IN eland
#### (COMPARE FILE 1 hit.sam FILES)




#### RERUN MAQ WITH 'SOLE BEST HIT' OPTION   #### DONE Wed Nov  3 18:27:34 EDT 2010
#### CHECK MAQ RUNS #### DONE Wed Nov  3 18:27:34 EDT 2010
#### - SNP CALLING FAILURES DUE TO FAILED sam SORT JOBS (CLUSTER NODE FAILURES?)
#### - FIXED BY RERUNNING AND USING bam INTERMEDIARY
#### - RERAN SNP CALLS 


#### RERUN NOVOALIGN WITH '-r All 1' OPTION   #### DONE Fri Nov  5 08:40:42 EDT 2010


#### RUN BOWTIE WITH '-fr' OPTION       #### DONE Fri Nov  5 11:25:42 EDT 2010
#### FIX BOWTIE SNPS #### CONCLUSION: ERRORS DUE TO JOB FAILURES
#### BOWTIE FILE 9: SNP PREDICTION COMPLETED
#### BOWTIE FILE 1: RERAN ALIGNMENT
#### BOWTIE FILE 1: SNP PREDICTION COMPLETED

#### RERUN BOWTIE WITH '-rf' OPTION       #### DONE Fri Nov  5 19:05:42 EDT 2010
#### RERUN FILE 1    #### RUNNING Tue Nov  9 11:34:32 EST 2010 - DONE ####
#### RERUN FILE 9    #### RUNNING Tue Nov  9 11:34:32 EST 2010 - DONE ####


#### RERUN ELAND AS eland              #### DONE Sat Nov  6 11:16:42 EDT 2010


                  
</entry>