
<entry [Tue Nov 30 12:56:42 EST 2010] RUN cumulativeSnp.pl FOR ALL RUNS>




ELAND
-----

ON u02

screen -S eland-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--species human \
--label eland-cumulative \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/cumulativeSnp.binlevel2.out

    cumulativeSNP.pl    Run time: 04:49:47
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    7:23PM, 29 November 2010
    cumulativeSNP.pl    ****************************************


CHECKED OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22
ll hit*15-*.bam

    -rw-rw-r-- 1 syoung root 2.0M Nov 29 14:33 hit.binlevel2.num15-1.bam
    -rw-rw-rw- 1 syoung root 3.8M Nov 29 14:34 hit.binlevel2.num15-2.bam
    -rw-rw-rw- 1 syoung root 5.6M Nov 29 14:35 hit.binlevel2.num15-3.bam
    -rw-rw-rw- 1 syoung root 7.3M Nov 29 14:37 hit.binlevel2.num15-4.bam
    -rw-rw-rw- 1 syoung root 9.1M Nov 29 14:39 hit.binlevel2.num15-5.bam
    -rw-rw-rw- 1 syoung root  11M Nov 29 14:41 hit.binlevel2.num15-6.bam
    -rw-rw-rw- 1 syoung root  13M Nov 29 14:44 hit.binlevel2.num15-7.bam
    -rw-rw-rw- 1 syoung root  15M Nov 29 14:48 hit.binlevel2.num15-8.bam
    -rw-rw-rw- 1 syoung root  16M Nov 29 14:53 hit.binlevel2.num15-9.bam
    -rw-rw-rw- 1 syoung root  18M Nov 29 14:58 hit.binlevel2.num15-10.bam
    -rw-rw-rw- 1 syoung root  19M Nov 29 15:03 hit.binlevel2.num15-11.bam
    -rw-rw-rw- 1 syoung root  21M Nov 29 15:09 hit.binlevel2.num15-12.bam
    -rw-rw-rw- 1 syoung root  23M Nov 29 15:17 hit.binlevel2.num15-13.bam
    -rw-rw-rw- 1 syoung root  25M Nov 29 15:26 hit.binlevel2.num15-14.bam
    -rw-rw-rw- 1 syoung root  26M Nov 29 15:34 hit.binlevel2.num15-15.bam
    -rw-rw-rw- 1 syoung root  28M Nov 29 15:42 hit.binlevel2.num15-16.bam
    -rw-rw-rw- 1 syoung root  30M Nov 29 15:50 hit.binlevel2.num15-17.bam
    -rw-rw-rw- 1 syoung root  31M Nov 29 15:59 hit.binlevel2.num15-18.bam
    -rw-rw-rw- 1 syoung root  33M Nov 29 16:08 hit.binlevel2.num15-19.bam
    -rw-rw-rw- 1 syoung root  34M Nov 29 16:18 hit.binlevel2.num15-20.bam
    -rw-rw-rw- 1 syoung root  36M Nov 29 16:28 hit.binlevel2.num15-21.bam
    -rw-rw-rw- 1 syoung root  38M Nov 29 16:38 hit.binlevel2.num15-22.bam
    -rw-rw-rw- 1 syoung root  39M Nov 29 16:50 hit.binlevel2.num15-23.bam
    -rw-rw-rw- 1 syoung root  41M Nov 29 17:02 hit.binlevel2.num15-24.bam
    -rw-rw-rw- 1 syoung root  43M Nov 29 17:14 hit.binlevel2.num15-25.bam
    -rw-rw-rw- 1 syoung root  44M Nov 29 17:26 hit.binlevel2.num15-26.bam
    -rw-rw-rw- 1 syoung root  46M Nov 29 17:39 hit.binlevel2.num15-27.bam
    -rw-rw-rw- 1 syoung root  47M Nov 29 17:52 hit.binlevel2.num15-28.bam
    -rw-rw-rw- 1 syoung root  49M Nov 29 18:06 hit.binlevel2.num15-29.bam
    -rw-rw-rw- 1 syoung root  51M Nov 29 18:22 hit.binlevel2.num15-30.bam
    -rw-rw-rw- 1 syoung root  52M Nov 29 18:37 hit.binlevel2.num15-31.bam
    -rw-rw-rw- 1 syoung root  54M Nov 29 18:52 hit.binlevel2.num15-32.bam
    -rw-rw-rw- 1 syoung root  55M Nov 29 19:08 hit.binlevel2.num15-33.bam


ll hit*-1.bam

    -rw-rw-rw- 1 syoung root 8.3M Nov 29 14:33 hit.binlevel2.num10-1.bam
    -rw-rw-rw- 1 syoung root  31M Nov 29 14:34 hit.binlevel2.num11-1.bam
    -rw-rw-rw- 1 syoung root  26M Nov 29 14:34 hit.binlevel2.num12-1.bam
    -rw-rw-rw- 1 syoung root  26M Nov 29 14:34 hit.binlevel2.num13-1.bam
    -rw-rw-rw- 1 syoung root  19M Nov 29 14:33 hit.binlevel2.num14-1.bam
    -rw-rw-r-- 1 syoung root 2.0M Nov 29 14:33 hit.binlevel2.num15-1.bam
    -rw-rw-r-- 1 syoung root   76 Nov 29 14:33 hit.binlevel2.num9-1.bam


ll hit*-2.bam

    -rw-rw-rw- 1 syoung root  17M Nov 29 14:34 hit.binlevel2.num10-2.bam
    -rw-rw-rw- 1 syoung root  60M Nov 29 14:35 hit.binlevel2.num11-2.bam
    -rw-rw-rw- 1 syoung root  51M Nov 29 14:35 hit.binlevel2.num12-2.bam
    -rw-rw-rw- 1 syoung root  50M Nov 29 14:35 hit.binlevel2.num13-2.bam
    -rw-rw-rw- 1 syoung root  36M Nov 29 14:34 hit.binlevel2.num14-2.bam
    -rw-rw-rw- 1 syoung root 3.8M Nov 29 14:34 hit.binlevel2.num15-2.bam
    -rw-rw-rw- 1 syoung root   76 Nov 29 14:34 hit.binlevel2.num9-2.bam


ll hit*-3.bam

    -rw-rw-rw- 1 syoung root  25M Nov 29 14:35 hit.binlevel2.num10-3.bam
    -rw-rw-rw- 1 syoung root  88M Nov 29 14:36 hit.binlevel2.num11-3.bam
    -rw-rw-rw- 1 syoung root  74M Nov 29 14:36 hit.binlevel2.num12-3.bam
    -rw-rw-rw- 1 syoung root  74M Nov 29 14:36 hit.binlevel2.num13-3.bam
    -rw-rw-rw- 1 syoung root  53M Nov 29 14:36 hit.binlevel2.num14-3.bam
    -rw-rw-rw- 1 syoung root 5.6M Nov 29 14:35 hit.binlevel2.num15-3.bam
    -rw-rw-rw- 1 syoung root   76 Nov 29 14:35 hit.binlevel2.num9-3.bam


NOTE THAT ORIGINAL BAM FILES ARE APPROXIMATELY THE SAME SIZE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland
ll */chr22/hit.bam
    -rw-rw-rw- 1 syoung root 110M Nov 29 12:34 ../../1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 111M Nov 29 12:35 ../../2/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 110M Nov 29 12:34 ../../3/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 110M Nov 29 12:34 ../../4/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 110M Nov 29 12:34 ../../5/chr22/hit.bam
    ...




MAQ
---


screen -S maq-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--label eland-cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/cumulativeSnp.binlevel2.out


    FAILED AT FILE 29

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22
        
    -rw-rw-rw- 1 syoung root  8.7G Dec  3 06:02 hit.binlevel2.num12-28.bam
    -rw-rw-rw- 1 syoung root    76 Dec  3 09:12 hit.binlevel2.num9-29.bam
    -rw-rw-rw- 1 syoung root  210M Dec  3 09:14 hit.binlevel2.num15-29.bam
    -rw-rw-rw- 1 syoung root  4.7G Dec  3 10:06 hit.binlevel2.num14-29.bam
    -rw-rw-rw- 1 syoung root  5.4G Dec  3 10:12 hit.binlevel2.num10-29.bam
    -rw-rw-rw- 1 syoung root  6.4G Dec  3 10:22 hit.binlevel2.num11-29.bam
    -rw-rw-rw- 1 syoung root  7.3G Dec  3 10:36 hit.binlevel2.num13-29.bam
    -rw-rw-rw- 1 syoung root  9.0G Dec  3 10:55 hit.binlevel2.num12-29.bam

    #cumulative3SNP.pl    Run time: 04:49:47
    #cumulative3SNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    #cumulative3SNP.pl    7:23PM, 29 November 2010
    #cumulative3SNP.pl    ****************************************



screen -S maq-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--start 29 \
--binlevel 2 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--species human \
--label eland-cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/cumulativeSnp.binlevel2.29-33.out


    RUNNING Sat Dec  4 15:58:03 EST 2010

    cumulativeSnp.pl    Run time: 20:47:03
    cumulativeSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSnp.pl    12:44AM, 5 December 2010
    cumulativeSnp.pl    ****************************************



PROBLEM:    LAST BIN FAILED (bin15) FOR ALL SAMPLES
DIAGNOSIS:  IT WAS RUN WITH OLD VERSION OF SNP.pm THAT DIDN'T ACCOUNT FOR THE HITS ENDING LEFT OF THE BIN START.
SOLUTION:   RUN bamToSnp.pl FOR ALL SAMPLES

screen -S binsnp-maq

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/bamToSnp.pl \
--binlevel 2 \
--filename hit.bam \
--species human \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
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
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/binToSnp-stdout.txt

    OK


ALL OUTPUT WAS FINE EXCEPT BIN 15 WAS MISSING. DID THE FOLLOWING CHECKS:

CHECK BIN 15 FILE SIZE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22
    ll hit.binlevel2.num15-23*bam
    -rw-rw-rw- 1 syoung root 163M Dec  2 06:32 hit.binlevel2.num15-23.bam
    
GET ERROR WHEN VIEWING *bam FILE:

samtools view -X hit.binlevel2.num15-23.bam
    Segmentation fault


HIT RANGE ENDS LONG BEFORE END OF BIN:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22
cat ../../1/chr22/*range
    
    #reads  #start  #stop
    23235867        14430000        49591399


HIT RANGE IS SAME IN *sam FILE:    

tail -n 1  ../../1/chr22/hit.sam

    SRR002316.5590787:1:221:678:141#0       147     chr22   49591399        69      36M     *       0  -212     GGGAAGGAGGCTGGTGCCAGAGTGGATTCGTATTGA    #('-%'.*>$)$,+.-)$*6/?/F<I+IIIII@II;    MF:i:130   AM:i:69  SM:i:0  NM:i:1  UQ:i:40 H0:i:0  H1:i:0 PWD


TRY SORTING BAM:

samtools index hit.binlevel2.num15-23.bam
samtools sort hit.binlevel2.num15-23.bam hit.binlevel2.num15-23.sorted
samtools view -X hit.binlevel2.num15-23.sorted.bam | less -S


SO PROBLEM WITH USE OF COMMAND WHEN BAM IS UNSORTED?

samtools pileup -vcf $samtools_index/$referencefile $mergedfile | tee $rawfile | $samtools/samtools.pl varFilter -D100 > $filterfile



chr22:49591434-59677289



BOWTIE
------



2. cumulativeSnp.pl 

screen -S bowtie-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--label eland-cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/cumulativeSnp.binlevel2.out
    
    cumulativeSNP.pl    Run time: 10:13:56
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    11:47AM, 30 November 2010
    cumulativeSNP.pl    ****************************************



BOWTIE-RF
---------

screen -S bowtie-rf-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--label eland-cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/cumulativeSnp.binlevel2.out

    cumulativeSNP.pl    Run time: 10:00:13
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    10:18AM, 30 November 2010
    cumulativeSNP.pl    ****************************************





NOVOALIGN
---------


ON u01

screen -S novoalign-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--label novoalign-cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/cumulativeSnp.binlevel2.out


    RUNNING Mon Nov 29 23:06:18 EST 2010



RERUN AFTER STALLED ON FILE 20

ON u01

screen -S novo-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--start 20 \
--binlevel 2 \
--filename hit.bam \
--inputdirs \
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
--label novoalign-cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/cumulativeSnp.binlevel2.20-33.out


RUNNING




CHECKED FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22

    -rw-rw-rw- 1 syoung root  69M Nov 29 23:05 hit.binlevel2.num13-1.bam
    -rw-rw-rw- 1 syoung root 135M Nov 29 23:08 hit.binlevel2.num13-2.bam
    -rw-rw-rw- 1 syoung root 202M Nov 29 23:17 hit.binlevel2.num13-3.bam
    -rw-rw-rw- 1 syoung root 267M Nov 29 23:27 hit.binlevel2.num13-4.bam
    -rw-rw-rw- 1 syoung root 332M Nov 29 23:43 hit.binlevel2.num13-5.bam
    -rw-rw-rw- 1 syoung root 396M Nov 30 00:08 hit.binlevel2.num13-6.bam
    -rw-rw-rw- 1 syoung root 460M Nov 30 00:31 hit.binlevel2.num13-7.bam
    -rw-rw-rw- 1 syoung root 524M Nov 30 01:01 hit.binlevel2.num13-8.bam
    -rw-rw-rw- 1 syoung root 587M Nov 30 01:37 hit.binlevel2.num13-9.bam
    -rw-rw-rw- 1 syoung root 650M Nov 30 02:26 hit.binlevel2.num13-10.bam
    -rw-rw-rw- 1 syoung root 714M Nov 30 03:22 hit.binlevel2.num13-11.bam
    -rw-rw-rw- 1 syoung root 777M Nov 30 04:20 hit.binlevel2.num13-12.bam
    -rw-rw-rw- 1 syoung root 841M Nov 30 05:26 hit.binlevel2.num13-13.bam
    -rw-rw-rw- 1 syoung root 903M Nov 30 06:37 hit.binlevel2.num13-14.bam
    -rw-rw-rw- 1 syoung root 966M Nov 30 08:02 hit.binlevel2.num13-15.bam
    -rw-rw-rw- 1 syoung root 1.1G Nov 30 09:34 hit.binlevel2.num13-16.bam
    -rw-rw-rw- 1 syoung root 1.1G Nov 30 11:14 hit.binlevel2.num13-17.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 13:19 hit.binlevel2.num13-18.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 15:16 hit.binlevel2.num13-19.bam
    -rw-rw-rw- 1 syoung root 1.3G Dec  1 11:58 hit.binlevel2.num13-20.bam
    -rw-rw-rw- 1 syoung root 1.4G Dec  1 14:05 hit.binlevel2.num13-21.bam
    -rw-rw-rw- 1 syoung root 1.4G Dec  1 16:16 hit.binlevel2.num13-22.bam
    -rw-rw-rw- 1 syoung root 1.5G Dec  1 18:37 hit.binlevel2.num13-23.bam
    -rw-rw-rw- 1 syoung root 1.5G Dec  1 21:13 hit.binlevel2.num13-24.bam
    -rw-rw-rw- 1 syoung root 1.6G Dec  1 23:47 hit.binlevel2.num13-25.bam
    -rw-rw-rw- 1 syoung root 1.7G Dec  2 02:35 hit.binlevel2.num13-26.bam
    -rw-rw-rw- 1 syoung root 1.7G Dec  2 05:33 hit.binlevel2.num13-27.bam
    -rw-rw-rw- 1 syoung root 1.8G Dec  2 08:38 hit.binlevel2.num13-28.bam
    -rw-rw-rw- 1 syoung root 1.8G Dec  2 11:52 hit.binlevel2.num13-29.bam



TWO JOBS 'NOT YET STARTED' AT FILE 31:


[syoung@u01 chr22]$ bjobs

    JOBID     USER    STAT  QUEUE      FROM_HOST   EXEC_HOST   JOB_NAME   SUBMIT_TIME
    2319540   syoung  RUN   small      u01         n0081       *-31-14.sh Dec  2 18:30
    2319541   syoung  RUN   small      u01         n0081       *-31-15.sh Dec  2 18:30
    2319624   syoung  RUN   small      u02         n0067       *2-1-11.sh Dec  3 03:15
    2319625   syoung  RUN   small      u02         n0067       *2-1-12.sh Dec  3 03:15
    2319606   syoung  RUN   small      u04         n0133       *-27-10.sh Dec  2 23:11
    2319623   syoung  RUN   small      u02         n0062       *2-1-10.sh Dec  3 03:15

[syoung@u01 chr22]$ bpeek 2319540
Job <2319540> : Not yet started.
[syoung@u01 chr22]$ bpeek 2319541
Job <2319541> : Not yet started.
[syoung@u01 chr22]$ bkill 2319541
Job <2319541> is being terminated
[syoung@u01 chr22]$ bkill 2319540
Job <2319540> is being terminated


SO RAN THE TWO 'NOT YET STARTED' JOBS MANUALLY:


ON u01

screen -S novo-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--start 32 \
--binlevel 2 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3 \
--species human \
--label novoalign-cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/cumulativeSnp.binlevel2.32-33.out







</entry>



<entry [Tue Nov 30 12:55:42 EST 2010] RUN binBam.pl FOR ALL RUNS>




ELAND
-----


MAQ
---

screen -S maq-binbam

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
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
--binlevel 2 \
--reference chr22 \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF 

    binBam.pl    Run time: 00:25:34
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    5:45PM, 30 November 2010
    binBam.pl    ****************************************




BOWTIE
------

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
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
--binlevel 2 \
--reference chr22 \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF 
    
    binBam.pl    Run time: 00:06:20
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    1:31AM, 30 November 2010
    binBam.pl    ****************************************


BOWTIE-RF
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
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
--binlevel 2 \
--reference chr22 \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF 
    
    binBam.pl    Run time: 00:09:02
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    0:16AM, 30 November 2010
    binBam.pl    ****************************************
    


NOVOALIGN
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
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
--binlevel 2 \
--reference chr22 \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF 

    binBam.pl    Run time: 00:06:02
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    11:03PM, 29 November 2010
    binBam.pl    ****************************************




</entry>



<entry [Tue Nov 30 12:54:42 EST 2010] COMPLETE ALIGNMENT FOR ALL RUNS>



ELAND
-----

CLEANUP FILES:

ON u03

screen -S clean-eland

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs,splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland \
--references chr22

    Cluster.pl    Run time: 00:36:58
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-12-02 02:25:02
    Cluster.pl    ****************************************





MAQ
---

INPUT FILES MISSING hit.bam: FILE 33, FILES 2 TO 9. REDO:


-rw-r--r-- 1 syoung root 1.2G Nov 24 00:33 1/chr22/hit.bam

-rw-rw-rw- 1 syoung root 1.2G Nov 24 11:16 10/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 15:15 11/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 19:15 12/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 01:19 13/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 01:36 14/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 01:53 15/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 02:10 16/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 02:28 17/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 02:28 18/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 06:29 19/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 24 10:29 20/chr22/hit.bam
-rw-r--r-- 1 syoung root 1.2G Nov 15 10:58 21/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 15 14:58 22/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 15 19:00 23/chr22/hit.bam
-rw-rw-rw- 1 syoung root 1.2G Nov 15 23:00 24/chr22/hit.bam
-rw-r--r-- 1 syoung root 1.2G Nov 16 03:01 25/chr22/hit.bam
-rw-r--r-- 1 syoung root 1.2G Nov 16 07:00 26/chr22/hit.bam
-rw-r--r-- 1 syoung root 1.2G Nov 16 07:02 27/chr22/hit.bam
-rw-r--r-- 1 syoung root 1.2G Nov 16 11:03 28/chr22/hit.bam
-rw-r--r-- 1 syoung root 1.2G Nov 16 11:05 29/chr22/hit.bam
-rw-r--r-- 1 syoung root 1.2G Nov 16 15:05 30/chr22/hit.bam
-rw-r--r-- 1 syoung root 1.2G Nov 16 19:05 31/chr22/hit.bam
-rw-r--r-- 1 syoung root 1.2G Nov 16 23:06 32/chr22/hit.bam
-rw-rw-rw- 1 syoung root   76 Nov 17 03:00 33/chr22/hit.bam

ON u04

screen -S maq

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/MAQ.pl \
--replicates 1-33 \
--loop parallel \
--params "-C 1" \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--species human \
--label maq-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue small \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/maq-200bp-chr22-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/maq.1-33.loop.out

    RUNNING     Tue Nov 30 01:50:10 EST 2010
    
    Run time: 04:12:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:00AM, 30 November 2010
    ****************************************
    

    RERUNNING FROM subdirMapToSam   Tue Nov 30 10:23:02 EST 2010

    Run time: 02:38:23
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:00PM, 30 November 2010
    ****************************************    




REMOVE SUBDIRS AND SPLIT FILES:

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs,splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq \
--references chr22

    RUNNING Wed Dec  1 14:50:30 EST 2010

    Cluster.pl    Run time: 00:12:16
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-12-01 15:02:12
    Cluster.pl    ****************************************



ON u02

REMOVING OLD cumulative AND cumulative2 FOLDERS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq

screen -S rm-maq
rm -fr cumulative cumulative2


    RUNNING Thu Dec  2 12:44:08 EST 2010


    cat du.txt 
    7.5G    1
    8.6G    10
    12G     11
    8.6G    12
    8.6G    13
    8.6G    14
    8.6G    15
    8.6G    16
    8.6G    17
    8.6G    18
    12G     19
    12G     2
    7.7G    20
    8.6G    21
    8.6G    22
    8.6G    23
    8.6G    24
    8.6G    25
    10G     26
    8.6G    27
    8.6G    28
    8.6G    29
    8.6G    3
    8.6G    30
    11G     31
    8.6G    32
    8.6G    33
    8.6G    4
    8.6G    5
    8.6G    6
    8.6G    7
    8.6G    8
    11G     9
    1.8G    chr22-old
    1.6T    cumulative
    796G    cumulative2
    1.1T    cumulative3
    1.7M    indexes
    98K     maq.1-33.loop.out
    26K     maq.2-9.loop.out
    26K     maq-chr22-loop.out
    122K    MAQ-USAGE.txt
    77K     realign
    1.8M    samToSnp
    50K     splitfile.txt
    286M    venn




OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/
ll -tr */chr22/hit.bam

    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:08 18/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:12 11/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:12 19/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:12 12/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:13 9/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:15 31/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:15 2/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:15 26/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:16 22/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:16 20/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:17 1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:19 15/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:19 27/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:19 6/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:20 17/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:20 29/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:20 21/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:20 7/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:20 5/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:20 24/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:20 8/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:22 13/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:24 16/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:25 4/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:25 14/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:25 3/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:25 10/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:26 33/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:26 28/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:50 25/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:50 23/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:51 30/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 12:51 32/chr22/hit.bam






BOWTIE
------

MISSING FILES 2 TO 12

ON u03

screen -S bowtie

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
    --replicates 2-12 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--species human \
--distance 200 \
--label bowtie-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--clean \
--queue large \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/bowtie-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/bowtie.2-12.stdout

    RUNNING Mon Nov 29 22:26:33 EST 2010
    
    Run time: 06:17:22
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    4:42AM, 30 November 2010
    ****************************************


OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie

    -rw-rw-rw- 1 syoung root 299M Nov 24 12:15 1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:46 2/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:44 3/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:42 4/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:43 5/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:44 6/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:43 7/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:44 8/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:42 9/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:42 10/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:45 11/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:41 12/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:37 13/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:13 14/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:35 15/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:36 16/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:48 17/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:55 18/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:49 19/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:50 20/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:49 21/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 292M Nov 27 23:48 22/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:35 23/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:48 24/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 300M Nov 27 23:50 25/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:54 26/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:45 27/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:36 28/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:50 29/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:49 30/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:37 31/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:25 32/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 23:50 33/chr22/hit.bam



/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs,splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie \
--references chr22


    RUNNING Wed Dec  1 12:02:44 EST 2010
    
    Cluster.pl    Run time: 00:24:15
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-12-01 12:25:38
    Cluster.pl    ****************************************




BOWTIE-RF
---------

FILE 4 IS SMALL, REDO:

    -rw-rw-rw- 1 syoung root 299M Nov 27 01:27 bowtie-rf/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 01:29 bowtie-rf/2/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 27 01:38 bowtie-rf/3/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 103M Nov 27 01:49 bowtie-rf/4/chr22/hit.bam
    ...
mkdi
ON u01

screen -S bowtie-rf-4

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-4.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-4.reads_2.sequence.txt \
--species human \
--distance 200 \
--label bowtie-rf-4 \
--maxjobs 1000 \
--walltime 24 \
--clean \
--queue large \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/4 \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/4/bowtie-rf-4.out 

    RUNNING Mon Nov 29 22:52:53 EST 2010
        
    BOWTIE.pl    Run time: 00:53:14
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    11:45PM, 29 November 2010
    BOWTIE.pl    ****************************************

    OK
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf

    -rw-rw-rw- 1 syoung root 299M Nov 29 23:43 4/chr22/hit.bam


CLEAN UP FILES:

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs,splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf \
--references chr22

screen -S clean-bowtie-rf

    Cluster.pl    Run time: 00:02:26
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-12-01 14:54:31
    Cluster.pl    ****************************************



NOVOALIGN
---------

NO REALIGNMENTS NEEDED.



</entry>



<entry [Sat Nov 27 23:20:41 EST 2010] UPDATED cumulativeSnp.pl TO RUN BINS IN PARALLEL>



    - ADDED binlevel ARGUMENT - GRANULARITY OF BINS
    
    - ADDED bindir ARGUMENT - LOCATION OF BINNED *bam FILES
    
    - USES UCSCBin.pm TO GENERATE LIST OF BINS USING binlevel,
        AND HENCE FIND THE BINNED *bam FILES


screen -S eland-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--binlevel 2 \
--filename hit.bam \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/2 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--species human \
--label cumulative-1 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--bindir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/bins

    cumulativeSNP.pl    Run time: 00:17:19
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    1:2 PM, 29 November 2010
    cumulativeSNP.pl    ****************************************





</entry>



<entry [Sat Nov 27 23:19:41 EST 2010] USE UCSC BINNING TO REDUCE CUMULATIVE MERGE TIMES>




CREATED binBam.pl TO BIN *bam FILE HITS ACCORDING TO UCSC BINNING SYSTEM

    -   DIVIDE UP hit.bam FILES INTO BINS BY CHROMOSOMAL POSITION
    
    -   WIDTH OF THE BINS IS DEFINED BY THE SPECIFIED BIN LEVEL

    -   USE BIN LEVEL 2 (8 Mbp BINS) FOR ALL CHROMOSOMES

    -   ADD binlevel, binnumber AND totalbins TO BINNED *bam FILE NAME


/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
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
--binlevel 2 \
--reference chr22 \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF 

    binBam.pl    Run time: 00:03:19
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    12:37AM, 29 November 2010
    binBam.pl    ****************************************



NOTE: HUMAN CHROMOSOME SIZES

cd /nethome/bioinfo/data/sequence/chromosomes/human/hg18/fasta
cat chromosome_positions.txt

    chromo  start           stop            size
    chr1    0               252194715       252194715
    chr2    252194716       500004889       247810173
    chr3    500004890       703496755       203491865
    chr4    703496756       898595282       195098526
    chr5    898595283       1083070308      184475025
    chr6    1083070309      1257388302      174317993
    chr7    1257388303      1419386157      161997854
    chr8    1419386158      1568586482      149200324
    chr9    1568586483      1711665202      143078719
    chr10   1711665203      1849747436      138082233
    chr11   1849747437      1986888870      137141433
    chr12   1986888871      2121885397      134996526
    chr13   2121885398      2238311239      116425841
    chr14   2238311240      2346807198      108495958
    chr15   2346807199      2449152894      102345695
    chr16   2449152895      2539756696      90603801
    chr17   2539756697      2620106935      80350238
    chr18   2620106936      2697746434      77639498
    chr19   2697746435      2762834321      65087886
    chr20   2762834322      2826519007      63684685
    chr21   2826519008      2874402219      47883211
    chr22   2874402220      2925087482      50685262
    chrX    2925087483      3083099514      158012031
    chrY    3083099515      3142027930      58928415


SO AT BINLEVEL 2:

    CHROMOSOME 1 : 31 BINS
    ...
    CHROMOSOME 22:  7 BINS



TEST BINBAM WITH ADDED hitRange SUBROUTINE:

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1 \
--binlevel 2 \
--reference chr22 \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF 

    binBam.pl    Run time: 00:04:31
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    12:35AM, 1 December 2010
    binBam.pl    ****************************************


LAST BIN:

    {
      'stop' => 58720256,
      'number' => 15,
      'start' => 50331649
    }


IDXSTATS OF *bam FILE:

samtools idxstats hit.binlevel2.num15.bam
chr22   51304566        37921   0




NOTES
-----

UCSC binning
http://genomewiki.ucsc.edu/index.php/Bin_indexing_system
Kent & al. The Human Genome Browser at UCSC", doi: 10.1101/gr.229102 . Genome Res. 2002. 12:996-1006

Initial implementation


Used when chromEnd is less than or equal to 536,870,912 = 2**29

 	bin numbers	bin

level	#bins	start	end	    size
0	    1	    0	    0	    512 Mb
1	    8	    1	    8	    64 Mb
2	    64	    9	    72	    8 Mb
3	    512	    73	    584	    1 Mb
4	    4096	585	    4680	128 kb


Extended implementation

Used when chromEnd is greater than 536,870,912 = 229 and less than 2,147,483,647 = 231 - 1
 	bin numbers	bin

level	#bins	start	end	size
0	1	4691	4691	2 Gb
1	8	4683	4685	512 Mb
2	64	4698	4721	64 Mb
3	512	4818	5009	8 Mb
4	4,096	5778	7313	1 Mb
5	32,768	13458	25745	128 kb



Initial implementation C code

/* This file is copyright 2002 Jim Kent, but license is hereby
 * granted for all use - public, private or commercial. */

static int binOffsets[] = {512+64+8+1, 64+8+1, 8+1, 1, 0};
#define _binFirstShift 17       /* How much to shift to get to finest bin. */
#define _binNextShift 3         /* How much to shift to get to next larger bin.

static int binFromRangeStandard(int start, int end)
/* Given start,end in chromosome coordinates assign it
 * a bin.   There's a bin for each 128k segment, for each
 * 1M segment, for each 8M segment, for each 64M segment,
 * and for each chromosome (which is assumed to be less than
 * 512M.)  A range goes into the smallest bin it will fit in. */
{
int startBin = start, endBin = end-1, i;
startBin >>= _binFirstShift;
endBin >>= _binFirstShift;
for (i=0; i<ArraySize(binOffsets); ++i)
    {
    if (startBin == endBin)
        return binOffsets[i] + startBin;
    startBin >>= _binNextShift;
    endBin >>= _binNextShift;
    }
errAbort("start %d, end %d out of range in findBin (max is 512M)", start, end);
return 0;
}
Extended implementation C code

/* This file is copyright 2002 Jim Kent, but license is hereby
 * granted for all use - public, private or commercial. */

/* add one new level to get coverage past chrom sizes of 512 Mb
 *      effective limit is now the size of an integer since chrom start
 *      and end coordinates are always being used in int's == 2Gb-1 */
static int binOffsetsExtended[] =
        {4096+512+64+8+1, 512+64+8+1, 64+8+1, 8+1, 1, 0};

static int binFromRangeExtended(int start, int end)
/* Given start,end in chromosome coordinates assign it
 * a bin.   There's a bin for each 128k segment, for each
 * 1M segment, for each 8M segment, for each 64M segment,
 * for each 512M segment, and one top level bin for 4Gb.
 *      Note, since start and end are int's, the practical limit
 *      is up to 2Gb-1, and thus, only four result bins on the second
 *      level.
 * A range goes into the smallest bin it will fit in. */
{
int startBin = start, endBin = end-1, i;
startBin >>= _binFirstShift;
endBin >>= _binFirstShift;
for (i=0; i<ArraySize(binOffsetsExtended); ++i)
    {
    if (startBin == endBin)
        return _binOffsetOldToExtended + binOffsetsExtended[i] + startBin;
    startBin >>= _binNextShift;
    endBin >>= _binNextShift;
    }
errAbort("start %d, end %d out of range in findBin (max is 2Gb)", start, end);
return 0;
}





JAVA VERSION OF EXTENDED VERSION

http://plindenbaum.blogspot.com/2010/05/binning-genome.html




/** Given start,end in chromosome coordinates assign it
* a bin. A range goes into the smallest bin it will fit in. */
public int getBin(int chromStart,int chromEnd)
 {
 int genomicLength=getMaxGenomicLengthLevel();
 return calcBin(chromStart,chromEnd,0,0,0,0,1,0,genomicLength);
 }

/** length for level 0 */
protected int getMaxGenomicLengthLevel() { return 536870912;/* 2^29 */}
/** maximum level in Jim Kent's algorithm */
protected int getMaxLevel() { return 4;}
/** how many children for one node ? */
protected int getChildrenCount() { return 8;}

private int calcBin(
 final int chromStart,
 final int chromEnd,
 int binId,
 int level,
 int binRowStart,
 int rowIndex,
 int binRowCount,
 int genomicPos,
 int genomicLength
 )
 {

 if(
  chromStart>=genomicPos &&
  chromEnd<= (genomicPos+genomicLength))
  {
  if(level>=getMaxLevel()) return binId;

  int childLength=genomicLength/getChildrenCount();
  int childBinRowCount=binRowCount*getChildrenCount();
  int childRowBinStart=binRowStart+binRowCount;
  int firstChildIndex=rowIndex*getChildrenCount();
  int firstChildBin=childRowBinStart+firstChildIndex;
  for(int i=0;i< getChildrenCount();++i)
   {
   int n= calcBin(
     chromStart,
     chromEnd,
     firstChildBin+i,
     level+1,
     childRowBinStart,
     firstChildIndex+i,
     childBinRowCount,
     genomicPos+i*childLength,
     childLength
     );
   if(n!=-1)
    {
    return n;
    }
   }
  return binId;
  }

 return -1;
 }
 
 



PERL VERSION
------------

3.9. Shift Operators
http://docstore.mik.ua/orelly/perl2/prog/ch03_09.htm

The bit-shift operators (<< and >>) return the value of the left argument shifted to the left (<<) or to the right (>>) by the number of bits specified by the right argument. The arguments should be integers. For example:

1 << 4;     # returns 16
32 >> 4;    # returns 2
Be careful, though. Results on large (or negative) numbers may vary depending on the number of bits your machine uses to represent integers.




http://www.cs.cf.ac.uk/Dave/PERL/node36.html



The Bitwise Operators

The bitwise operators are similar to the logical operators, except that they work on a smaller scale -- binary representations of data.

The following operators are available:

op1 & op2 -- The AND operator compares two bits and generates a result of 1 if both bits are 1; otherwise, it returns 0.
op1 | op2 -- The OR operator compares two bits and generates a result of 1 if the bits are complementary; otherwise, it returns 0.
op1^ op2 -- The EXCLUSIVE-OR operator compares two bits and returns 1 if either of the bits are 1 and it gives 0 if both bits are 0 or 1.
~op1 -- The COMPLEMENT operator is used to invert all of the bits of the operand.
op1 >> op2 -- The SHIFT RIGHT operator moves the bits to the right, discards the far right bit, and assigns the leftmost bit a value of 0. Each move to the right effectively divides op1 in half.
op1 << op2 -- The SHIFT LEFT operator moves the bits to the left, discards the far left bit, and assigns the rightmost bit a value of 0. Each move to the left effectively multiplies op1 by 2.
Note Both operands associated with the bitwise operator must be integers.

Bitwise operators are used to change individual bits in an operand. A single byte of computer memory-when viewed as 8 bits-can signify the true/false status of 8 flags because each bit can be used as a boolean variable that can hold one of two values: true or false. A flag variable is typically used to indicate the status of something. For instance, computer files can be marked as read-only. So you might have a $fReadOnly variable whose job would be to hold the read-only status of a file. This variable is called a flag variable because when $fReadOnly has a true value, it's equivalent to a football referee throwing a flag. The variable says, "Whoa! Don't modify this file."

When you have more than one flag variable, it might be more efficient to use a single variable to indicate the value of more than one flag. The next example shows you how to do this.

Example: Using the &, |, and ^ Operators

The first step to using bitwise operators to indicate more than one flag in a single variable is to define the meaning of the bits that you'd like to use. Figure 5.1 shows an example of 8 bits that could be used to control the attributes of text on a display.

 
The bit definition of a text attribute control variable

If you assume that $textAttr is used to control the text attributes, then you could set the italic attribute by setting $textAttr equal to 128 like this:

$textAttr = 128;
because the bit pattern of 128 is 10000000. The bit that is turned on corresponds to the italic position in $textAttr.

Now let's set both the italic and underline attributes on at the same time. The underline value is 16, which has a bit pattern of 00010000. You already know the value for italic is 128. So we call on the OR operator to combine the two values.

$textAttr = 128 | 16;
or using the bit patterns (this is just an example-you can't do this in Perl)

$textAttr = 10000000 | 00010000;
You will see that $textAttr gets assigned a value of 144 (or 10010000 as a bit pattern). This will set both italic and underline attributes on.

The next step might be to turn the italic attribute off. This is done with the EXCLUSIVE-OR operator, like so:

$textAttr = $textAttr ^ 128;

Example: Using the >> and << Operators

The bitwise shift operators are used to move all of the bits in the operand left or right a given number of times. They come in quite handy when you need to divide or multiply integer values.

This example will divide by 4 using the >> operator.

$firstVar = 128;

$secondVar = $firstVar >> 2;

print("$secondVar\n");
Here we

Assign a value of 128 to the $firstVar variable.
Shift the bits inside $firstVar two places to the right and
assign the new value to $secondVar .
Print the $secondVart variable.
The program produces the following output:

32
Let's look at the bit patterns of the variables before and after the shift operation. First, $firstVar is assigned 128 or 10000000. Then, the value in $firstVar is shifted left by two places. So the new value is 00100000 or 32, which is assigned to $secondVar.

The rightmost bit of a value is lost when the bits are shifted right. You can see this in the next example.

The next example will multiply 128 by 8.

$firstVar = 128;

$secondVar = $firstVar << 3;

print $secondVar;
The program produces the following output:
1024
The value of 1024 is beyond the bounds of the 8 bits that the other examples used. This was done to show you that the number of bits available for your use is not limited to one byte. You are really limited by however many bytes Perl uses for one scalar variable (probably 4). You'll need to read the Perl documentation that came with the interpreter to determine how many bytes your scalar variables use.




</entry>



<entry [Wed Nov 24 11:18:38 EST 2010] cumulativeSnp.pl FAILURES DUE TO HARDWARE ISSUES>




PROBLEM:

cumulativeSnp.pl OCCASIONALLY DOES NOT INCORPORATE AN INPUT hit.bam FILE SUCH THAT THERE ARE TWO CONSECUTIVE merged-N.bam FILES WITH EXACTLY THE SAME SIZE AND COMPOSITION

cumulativeSnp.pl MERGES CONSECUTIVELY ALL OF THE hit.bam FILES FOR ALL 1-33 SAMPLES (EACH IS 100M READS, TOTAL 3.3 BILLION READS) AND THEN CALLS SNPS AT EACH STAGE



DIAGNOSIS:

THERE APPEARS TO BE A DELAY BETWEEN WHEN MERGE OUTPUT FILES ARE COMPLETED AND WHEN THEY BECOME 'AVAILABLE' ON THE FILE SYSTEM 

FOR EXAMPLE, RUNNING cumulativeSnp.pl ON NOVOALIGN hit.bam FILES, MERGING CUMULATIVELY RAN FINE FOR 4 FILES THEN FAILED AT FILE 5 BECAUSE THE PREVIOUS MERGED FILE WAS MISSING:

emacs cumulativeSnp-chr22-5-stdout.txt

    ...
    [bam_merge_core] fail to open file /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam
    ...

HOWEVER, THE merged-4.bam FILE IS ACTUALLY PRESENT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll merged-4.bam

    -rw-rw-rw- 1 syoung root 1.1G Nov 17 01:21 merged-4.bam


BUT THE merged-4.bam FILE WAS LAST WRITTEN TO AFTER THE APPLICATION HAD TERMINATED. I.E., THE merged-4.bam FILE IS DATED LATER THAN THE OUTPUT FILE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll cumulativeSnp-chr22-5-stdout.txt

    -rw-rw-rw- 1 syoung root 2.4K Nov 17 01:11 cumulativeSnp-chr22-5-stdout.txt


SOLUTION:

INTRODUCE A 25-MINUTE DELAY BETWEEN MERGE STEPS TO ALLOW FOR THE FILES BECOME AVAILABLE ON THE FILE SYSTEM





</entry>



<entry [Tue Nov 23 00:06:01 EST 2010] DELETED ALIGNMENT SUBDIRS ON PEGASUS>



bowtie     
    cumulative
    cumulative2

bowtie-rf  
    cumulative
    cumulative2

eland     
    cumulative

maq        
    cumulative
    cumulative2

novoalign  
    cumulative
    cumulative2



</entry>



<entry [Tue Nov 23 23:46:36 EST 2010] RERUN cumulativeSnp.pl WITH INCREASED SLEEP (25 MINS)>




SUMMARY
=======

eland FROM FILE 17 (cumulative)
--------------------------------
RUNNING Wed Nov 24 00:06:40 EST 2010
RERUN FROM FILE 18 (DELETED hit.sam)


bowtie FROM FILE 13 (cumulative2)
---------------------------------
RUNNING Wed Nov 24 00:32:02 EST 2010
RERUNNING BOWTIE ALIGNMENT FROM FILE 13


bowtie-rf FROM FILE 1 (cumulative2)
-----------------------------------
RERUNNING bowtie-rf ALIGNMENTS 18-33 Wed Nov 24 11:44:52 EST 2010


novoalign FROM FILE 26 (cumulative2)
------------------------------------
FILE 18 Sat Nov 27 20:48:35 EST 2010


maq FROM FILE 14 (cumulative)
-----------------------------
RUNNING Wed Nov 24 00:21:41 EST 2010


maq FROM FILE 10 (cumulative2)
------------------------------
FILE 15 Sat Nov 27 20:49:34 EST 2010





RUNS
====


eland FROM FILE 17 (cumulative)
--------------------------------

cp merged.bam-17 merged.bam-17.old
cp merged.bam-18 merged.bam-18.old


RERUN eland ALIGNMENTS FOR FILES 18 to 33

    ON u02



screen -S eland

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
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/eland.1-33.stdout

    Run time: 01:58:48
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:04PM, 28 November 2010
    ****************************************
    
    FROM MERGE SAM ONLY:
    
    Run time: 00:16:09
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    12:23AM, 29 November 2010
    ****************************************


PROBLEM: MISSING *export.txt FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/4/chr22/1
em ELAND-chr22-stdout.txt

    ...
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: pickBestPair succeded
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: About to run /nethome/syoung/ba\
    se/apps/casava/1.6.0/bin/../bin/buildExport.pl --paired --symbolic ./reanalysis_1_calsaf.txt ./\
    reanalysis_1_qseq.txt > ./reanalysis_1_export.txt
    
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: buildExport succeded
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: About to run /nethome/syoung/ba\
    se/apps/casava/1.6.0/bin/../bin/buildExport.pl --paired --symbolic ./reanalysis_2_calsaf.txt ./\
    reanalysis_2_qseq.txt > ./reanalysis_2_export.txt
    
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: buildExport succeded

SUCCEEDED BUT NO *export FILES.


    ##on u02
    ##RUNNING Fri Nov 26 02:05:33 EST 2010
    ##
    ##Run time: 03:26:51
    ##Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    ##3:57AM, 27 November 2010
    ##****************************************


SOLUTION:

RERUN FROM mergeSam

    OK
    
    


eland binBam.pl
----------------




eland cumulativeSnp.pl
------------------------

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
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--species human \
--label eland-cumulative \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/cumulativeSnp.out

    
    RUNNING Thu Nov 25 11:45:06 EST 2010
    FILE 19 AT  Thu Nov 25 12:58:39 EST 2010

    
    
    
    
    

bowtie FROM FILE 13 (cumulative2)
-------------------

cp merged.bam-13 merged.bam-13.old
cp merged.bam-14 merged.bam-14.old


RERUN bowtie ALIGNMENTS FROM FILE 13 TO 33

ON u01

screen -S bowtie

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 13-33 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--species human \
--distance 200 \
--label bowtie-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--clean \
--queue large \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/bowtie-chr22-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/bowtie.18-33.stdout

    RUNNING Sat Nov 27 21:22:42 EST 2010
    
    
    
    ##RUNNING Thu Nov 25 00:59:52 EST 2010

    Run time: 07:00:25
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    8:06AM, 25 November 2010
    ****************************************




RERUN cumulativeSnp.pl FROM FILE 13


ON u02

screen -S bowtie-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
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
--start 13 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2 \
--species human \
--label bowtie-cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/cumulativeSnp.out


    RUNNING Fri Nov 26 01:54:29 EST 2010

    cumulativeSNP.pl    Run time: 14:13:37
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    4:07PM, 26 November 2010
    cumulativeSNP.pl    ****************************************




bowtie-rf FROM FILE 1 (cumulative2)
----------------------------------

FILE 1 ONLY (SMALL hit.sam FILE)
--------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22
mv hit.sam hit.sam.bkp

ON u04

screen -S bowtie-rf-1

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1 \
--species human \
--distance 200 \
--label bowtie-rf-1 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--clean \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/bowtie-rf.out 

    RUNNING Wed Nov 24 11:44:52 EST 2010
    
    BOWTIE.pl    Run time: 00:39:07
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    12:21AM, 24 November 2010
    BOWTIE.pl    ****************************************
    
OUTPUT FILE IS NORMAL:
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf

    -rw-rw-rw- 1 syoung root 852M Nov 24 12:39 1/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 154M Nov  5 13:14 1-old/chr22/hit.sam



FILE 9 ONLY (LARGE hit.sam FILE)
--------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/chr22
mv hit.sam hit.sam.bkp

ON u04

screen -S bowtie-rf-9

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-9.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-9.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9 \
--species human \
--distance 200 \
--label bowtie-rf-9 \
--maxjobs 1000 \
--walltime 24 \cd 
--queue large \
--clean \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/bowtie-rf.out 
    
    RUNNING Wed Nov 24 11:44:52 EST 2010
    
    BOWTIE.pl    Run time: 01:03:44
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    12:46AM, 24 November 2010
    BOWTIE.pl    ****************************************


OUTPUT FILE IS NORMAL:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf
    
    -rw-rw-rw- 1 syoung root 815M Nov 24 12:41 9/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 126M Nov  9 12:16 nine/chr22/hit.sam



FILE 4 BAM IS SMALL:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf

    -rw-rw-rw- 1 syoung root 103M Nov 19 10:52 4/chr22/hit.bam



RERUN cumulativeSnp.pl FROM FILE 1 AS cumulative3

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3

ON u03

screen -S bowtie-rf-cum3

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3 \
--species human \
--label bowtie-rf-cumulative \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/cumulativeSnp.out


    RUNNING Sat Nov 27 01:27:14 EST 2010



novoalign FROM FILE 26 (cumulative2)
------------------------------------

RERUN novoalign ALIGNMENT FILES 26-30

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


screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
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
--start 14 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.14-33.out

    
    RUNNING Sat Nov 27 01:23:25 EST 2010


    
    ###RUNNING Fri Nov 26 00:46:14 EST 2010
    ###
    ###cumulativeSNP.pl    Run time: 20:03:37
    ###cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    ###cumulativeSNP.pl    8:48PM, 26 November 2010
    ###cumulativeSNP.pl    ****************************************


JOBS CURTAILED - STARTS TO KILL AT FILE 14 WHEN RUNNING TIME EXCEEDS 4 HOURS (DEFAULT WALLTIME).

IT TURNS OUT THAT THE large QUEUE HAS A MAX WALLTIME OF 24 HOURS AND THE SCHEDULER WILL IGNORE THE:

-W 48:00

IN THE SCRIPT FILE AND INSTEAD JUST SET WALLTIME TO THE DEFAULT:
    
    
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
[syoung@u04 chr22]$ grep "job killed" *txt
cumulativeSnp-chr22-14-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-15-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-16-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-17-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-18-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-19-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-20-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-21-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-22-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-23-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-24-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-25-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-26-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-27-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-28-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-29-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-30-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-31-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
[syoung@u04 chr22]$



SOLUTION:

RERUN FROM FILE 14 IN small QUEUE WHICH HAS MAX WALLTIME 168 HOURS AND DEFAULT WALLTIME 24 HOURS







cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll -tr merge* | grep -v snp | grep -v temp

    -rw-r--r-- 1 syoung root 285M Nov 17 00:19 merged-1.bam
    -rw-rw-rw- 1 syoung root 562M Nov 17 00:30 merged-2.bam
    -rw-rw-rw- 1 syoung root 838M Nov 17 00:50 merged-3.bam
    -rw-rw-rw- 1 syoung root 1.1G Nov 17 01:21 merged-4.bam
    -rw-rw-rw- 1 syoung root 1.4G Nov 18 14:34 merged-5.bam
    -rw-rw-rw- 1 syoung root 1.7G Nov 18 15:44 merged-6.bam
    -rw-rw-rw- 1 syoung root 1.9G Nov 18 17:12 merged-7.bam
    -rw-rw-rw- 1 syoung root 2.2G Nov 18 18:58 merged-8.bam
    -rw-rw-rw- 1 syoung root 2.4G Nov 18 21:04 merged-9.bam
    -rw-rw-rw- 1 syoung root 2.5G Nov 18 23:27 merged-10.bam
    -rw-rw-rw- 1 syoung root 2.7G Nov 19 02:03 merged-11.bam
    -rw-rw-rw- 1 syoung root 3.0G Nov 19 05:01 merged-12.bam
    -rw-rw-rw- 1 syoung root 3.3G Nov 19 08:28 merged-13.bam
    -rw-rw-rw- 1 syoung root 3.5G Nov 19 12:17 merged-14.bam
    -rw-rw-rw- 1 syoung root 3.8G Nov 19 16:20 merged-15.bam
    -rw-rw-rw- 1 syoung root 4.0G Nov 19 20:23 merged-16.bam
    -rw-rw-rw- 1 syoung root 4.3G Nov 20 00:26 merged-17.bam
    -rw-rw-rw- 1 syoung root 4.5G Nov 20 04:29 merged-18.bam
    -rw-rw-rw- 1 syoung root 4.8G Nov 20 08:32 merged-19.bam
    -rw-rw-rw- 1 syoung root 5.0G Nov 20 12:34 merged-20.bam
    -rw-rw-rw- 1 syoung root 5.3G Nov 20 16:38 merged-21.bam
    -rw-rw-rw- 1 syoung root 5.5G Nov 20 20:40 merged-22.bam
    -rw-rw-rw- 1 syoung root 5.8G Nov 21 00:43 merged-23.bam
    -rw-rw-rw- 1 syoung root 6.1G Nov 21 04:46 merged-24.bam
    -rw-rw-rw- 1 syoung root 6.3G Nov 21 08:49 merged-25.bam
    -rw-rw-rw- 1 syoung root 6.6G Nov 26 01:55 merged-26.bam
    -rw-rw-rw- 1 syoung root 6.8G Nov 26 05:58 merged-27.bam
    -rw-rw-rw- 1 syoung root 7.0G Nov 26 10:01 merged-28.bam
    -rw-rw-rw- 1 syoung root 7.3G Nov 26 14:18 merged-29.bam
    -rw-rw-rw- 1 syoung root 7.5G Nov 26 18:05 merged-30.bam
    -rw-rw-rw- 1 syoung root 7.8G Nov 26 22:08 merged-31.bam



RESTART TO COMPLETE FILES 32 AND 33:

screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--start 32 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.32-33.out




maq FROM FILE 14 (cumulative)
-----------------------------

cp merged.bam-13 merged.bam-13.old
cp merged.bam-14 merged.bam-14.old


screen -S maq-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
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
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.14-33.out

    #### MISSING merged-13.bam
    ##
    ##RUNNING Fri Nov 26 01:10:23 EST 2010
    ##
    ##cumulativeSNP.pl    Run time: 05:27:43
    ##cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    ##cumulativeSNP.pl    6:36AM, 26 November 2010
    ##cumulativeSNP.pl    ****************************************


    RUNNING Sat Nov 27 01:18:45 EST 2010

    cumulativeSNP.pl    Run time: 53:03:14
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    6:21AM, 29 November 2010
    cumulativeSNP.pl    ****************************************



ll -tr merged-*.bam
-rw-r--r-- 1 syoung root 3.6G Nov  4 14:39 merged-13-sorted.bam
-rw-r--r-- 1 syoung root  13G Nov 26 01:05 merged-12.bam
-rw-r--r-- 1 syoung root 1.2G Nov 27 01:19 merged-1.bam
-rw-rw-rw- 1 syoung root 2.4G Nov 27 01:53 merged-2.bam
-rw-rw-rw- 1 syoung root 3.6G Nov 27 02:48 merged-3.bam
-rw-rw-rw- 1 syoung root  14G Nov 27 07:20 merged-13.bam
-rw-rw-rw- 1 syoung root  15G Nov 27 12:57 merged-14.bam
-rw-rw-rw- 1 syoung root  16G Nov 27 19:11 merged-15.bam
-rw-rw-rw- 1 syoung root  18G Nov 28 01:54 merged-16.bam
-rw-rw-rw- 1 syoung root  19G Nov 28 09:00 merged-17.bam
-rw-rw-rw- 1 syoung root  20G Nov 28 17:10 merged-18.bam
-rw-rw-rw- 1 syoung root  21G Nov 29 01:21 merged-19.bam
-rw-rw-rw- 1 syoung root  21G Nov 29 10:02 merged-20.bam




cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/chr22
ls -altr merged*bam  | grep -v merged-20

    -rw-r--r-- 1 syoung root  1282727303 Nov 12 15:45 merged.bam-1
    -rw-r--r-- 1 syoung root  2531495026 Nov 12 16:27 merged.bam-2
    -rw-rw-rw- 1 syoung root  3766110602 Nov 12 17:41 merged.bam-3
    -rw-rw-rw- 1 syoung root  4992744759 Nov 12 19:16 merged.bam-4
    -rw-rw-rw- 1 syoung root  6213708762 Nov 12 21:05 merged.bam-5
    -rw-rw-rw- 1 syoung root  7429919804 Nov 12 23:28 merged.bam-6
    -rw-rw-rw- 1 syoung root  8642421971 Nov 13 02:13 merged.bam-7
    -rw-rw-rw- 1 syoung root  9852504179 Nov 13 05:17 merged.bam-8
    -rw-rw-rw- 1 syoung root 11060502267 Nov 13 08:49 merged.bam-9
    -rw-rw-rw- 1 syoung root  2004434944 Nov 13 12:42 merged.bam-10
    -rw-rw-rw- 1 syoung root 12266036389 Nov 13 12:46 merged.bam-11
    -rw-rw-rw- 1 syoung root 13469994218 Nov 13 17:00 merged.bam-12
    -rw-rw-rw- 1 syoung root 14672384912 Nov 13 21:23 merged.bam-13
    -rw-rw-rw- 1 syoung root 15873270400 Nov 14 01:24 merged.bam-14
    -rw-rw-rw- 1 syoung root 17073236383 Nov 14 05:36 merged.bam-15
    -rw-rw-rw- 1 syoung root 18272243767 Nov 14 09:48 merged.bam-16
    -rw-rw-rw- 1 syoung root 19470267243 Nov 14 13:59 merged.bam-17
    -rw-rw-rw- 1 syoung root  5006114816 Nov 14 18:15 merged.bam-18
    -rw-rw-rw- 1 syoung root 21863294371 Nov 14 22:29 merged.bam-20
    -rw-r--r-- 1 syoung root  5533155328 Nov 15 10:37 merged.bam-23
    -rw-rw-rw- 1 syoung root 23059233661 Nov 16 12:09 merged.bam.temp
    -rw-r--r-- 1 syoung root 23059274733 Nov 16 14:49 merged.bam
    -rw-r--r-- 1 syoung root  5866209280 Nov 16 14:55 merged.bam-33
    -rw-rw-r-- 1 syoung root 19470267243 Nov 16 19:39 merged-17.bam
    -rw-r--r-- 1 syoung root  1282727303 Nov 19 17:27 merged-1.bam
    -rw-rw-rw- 1 syoung root 20667202947 Nov 24 03:35 merged-18.bam.temp
    -rw-rw-rw- 1 syoung root 20667203319 Nov 24 05:58 merged-18.bam
    -rw-rw-rw- 1 syoung root 21863352834 Nov 24 07:38 merged-19.bam.temp
    -rw-rw-rw- 1 syoung root 21863352797 Nov 24 10:11 merged-19.bam
    -rw-rw-r-- 1 syoung root 11060502267 Nov 24 10:41 merged-9.bam
    -rw-rw-rw- 1 syoung root 21863352797 Nov 24 10:43 merged.bam-19
    -rw-rw-rw- 1 syoung root 12265783956 Nov 24 11:56 merged-10.bam.temp
    -rw-rw-rw- 1 syoung root 12265784109 Nov 24 13:26 merged-10.bam
    -rw-rw-rw- 1 syoung root 13469577911 Nov 24 15:59 merged-11.bam.temp
    -rw-rw-rw- 1 syoung root 13469577978 Nov 24 17:33 merged-11.bam
    -rw-rw-rw- 1 syoung root 14672076187 Nov 24 20:02 merged-12.bam.temp
    -rw-rw-rw- 1 syoung root 14672076307 Nov 24 21:46 merged-12.bam




maq FROM FILE 10 (cumulative2)
------------------------------

screen -S maq-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
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
--start 10 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--species human \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/cumulativeSnp.out


    RUNNING Sat Nov 27 01:21:33 EST 2010

    FILE 15 Sat Nov 27 20:49:34 EST 2010
    
    cumulativeSNP.pl    Run time: 34:13:37
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    11:34AM, 28 November 2010
    cumulativeSNP.pl    ****************************************

    ### QUEUE LARGE
    ###RUNNING Fri Nov 26 01:10:23 EST 2010
    ###
    ###FILE 18 AT Sat Nov 27 00:33:55 EST 2010
    
    
BUT OUTPUT FILES NOT COMPLETE:
    
    -rw-r--r-- 1 syoung root 1.2G Nov 19 17:27 merged-1.bam
    -rw-rw-r-- 1 syoung root  11G Nov 24 10:41 merged-9.bam
    -rw-rw-rw- 1 syoung root  20G Nov 27 00:08 merged-18.bam
    -rw-rw-rw- 1 syoung root  12G Nov 27 03:31 merged-10.bam
    -rw-rw-rw- 1 syoung root  21G Nov 27 04:21 merged-19.bam
    -rw-rw-rw- 1 syoung root  22G Nov 27 04:37 merged-20.bam
    -rw-rw-rw- 1 syoung root  13G Nov 27 07:42 merged-11.bam
    -rw-rw-rw- 1 syoung root  14G Nov 27 12:21 merged-12.bam
    -rw-rw-rw- 1 syoung root  11G Nov 27 17:48 merged-14.bam
    -rw-rw-rw- 1 syoung root  15G Nov 27 17:49 merged-13.bam
    -rw-rw-rw- 1 syoung root  12G Nov 27 22:37 merged-15.bam
    -rw-rw-rw- 1 syoung root  14G Nov 28 03:32 merged-16.bam
    -rw-rw-r-- 1 syoung root  15G Nov 28 08:43 merged-17.bam




</entry>



<entry [Tue Nov 23 23:45:36 EST 2010] PROGRESS OF CUMULATIVE SNP CALLS>



eland (autochr22, cumulative)
-----

DONE
    
    -rw-r--r-- 1 syoung root  171M Nov  4 13:17 merged.bam-1
    -rw-r--r-- 1 syoung root  207M Nov  4 13:23 merged.bam-2
    -rw-r--r-- 1 syoung root  207M Nov  4 13:31 merged.bam-3
    -rw-r--r-- 1 syoung root  329M Nov  4 13:36 merged.bam-4
    -rw-r--r-- 1 syoung root  329M Nov  4 13:36 merged.bam-5
    -rw-r--r-- 1 syoung root  448M Nov  4 13:36 merged.bam-6
    -rw-r--r-- 1 syoung root  564M Nov  4 13:37 merged.bam-7
    -rw-r--r-- 1 syoung root  680M Nov  4 13:37 merged.bam-8
    -rw-r--r-- 1 syoung root  795M Nov  4 13:37 merged.bam-9
    -rw-r--r-- 1 syoung root  909M Nov  4 13:18 merged.bam-10
    -rw-r--r-- 1 syoung root 1022M Nov  4 13:18 merged.bam-11
    -rw-r--r-- 1 syoung root  1.2G Nov  4 13:18 merged.bam-12
    -rw-r--r-- 1 syoung root  1.3G Nov  4 13:19 merged.bam-13
    -rw-r--r-- 1 syoung root  1.4G Nov  4 13:19 merged.bam-14
    -rw-r--r-- 1 syoung root  1.5G Nov  4 13:20 merged.bam-15
    -rw-r--r-- 1 syoung root  1.6G Nov  4 13:21 merged.bam-16
    -rw-r--r-- 1 syoung root  1.7G Nov  4 13:21 merged.bam-17
    -rw-r--r-- 1 syoung root  1.8G Nov  4 13:22 merged.bam-18
    -rw-r--r-- 1 syoung root  1.9G Nov  4 13:22 merged.bam-19
    -rw-r--r-- 1 syoung root  2.0G Nov  4 13:23 merged.bam-20
    -rw-r--r-- 1 syoung root  2.1G Nov  4 13:24 merged.bam-21
    -rw-r--r-- 1 syoung root  2.2G Nov  4 13:25 merged.bam-22
    -rw-r--r-- 1 syoung root  2.3G Nov  4 13:26 merged.bam-23
    -rw-r--r-- 1 syoung root  2.5G Nov  4 13:26 merged.bam-24
    -rw-r--r-- 1 syoung root  2.6G Nov  4 13:27 merged.bam-25
    -rw-r--r-- 1 syoung root  2.7G Nov  4 13:28 merged.bam-26
    -rw-r--r-- 1 syoung root  2.8G Nov  4 13:29 merged.bam-27
    -rw-r--r-- 1 syoung root  2.9G Nov  4 13:30 merged.bam-28
    -rw-r--r-- 1 syoung root  3.0G Nov  4 13:31 merged.bam-29
    -rw-r--r-- 1 syoung root  3.1G Nov  4 13:33 merged.bam-30
    -rw-r--r-- 1 syoung root  3.2G Nov  4 13:34 merged.bam-31
    -rw-r--r-- 1 syoung root  3.3G Nov  4 13:35 merged.bam-32
    -rw-r--r-- 1 syoung root  3.4G Nov  4 13:36 merged.bam-33


eland (cumulative)
------

(DIFFERENCE WITH eland/cumulative DUE TO USE OF NEWER VERSION OF SAMTOOLS FOR CONVERSION OF *export TO *sam)

FILES 17 AND 18

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



bowtie (cumulative 2)
------

FILES 13 AND 14

    -rw-r--r-- 1 syoung root 299M Nov 12 13:41 merged.bam-1
    -rw-rw-rw- 1 syoung root 588M Nov 12 13:50 merged.bam-2
    -rw-rw-rw- 1 syoung root 875M Nov 12 15:49 merged.bam-3
    -rw-rw-rw- 1 syoung root 1.2G Nov 12 16:04 merged.bam-4
    -rw-rw-rw- 1 syoung root 1.5G Nov 12 16:23 merged.bam-5
    -rw-rw-rw- 1 syoung root 1.7G Nov 12 16:46 merged.bam-6
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 17:14 merged.bam-7
    -rw-rw-rw- 1 syoung root 2.3G Nov 12 17:45 merged.bam-8
    -rw-rw-rw- 1 syoung root 2.6G Nov 12 18:21 merged.bam-9
    -rw-rw-rw- 1 syoung root 2.8G Nov 12 18:57 merged.bam-10
    -rw-rw-rw- 1 syoung root 3.1G Nov 12 19:37 merged.bam-11
    -rw-rw-rw- 1 syoung root 3.4G Nov 12 20:23 merged.bam-12
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 21:17 merged.bam-13
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 21:17 merged.bam-14
    -rw-rw-rw- 1 syoung root 3.9G Nov 12 22:12 merged.bam-15
    -rw-rw-rw- 1 syoung root 4.2G Nov 12 23:11 merged.bam-16
    -rw-rw-rw- 1 syoung root 4.5G Nov 13 00:15 merged.bam-17
    -rw-rw-rw- 1 syoung root 4.7G Nov 13 01:17 merged.bam-18
    -rw-rw-rw- 1 syoung root 5.0G Nov 13 02:21 merged.bam-19
    -rw-rw-rw- 1 syoung root 5.3G Nov 13 03:28 merged.bam-20
    -rw-rw-rw- 1 syoung root 5.5G Nov 13 04:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 5.8G Nov 13 05:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 6.1G Nov 13 07:18 merged.bam-23
    -rw-rw-rw- 1 syoung root 6.3G Nov 13 08:42 merged.bam-24
    -rw-rw-rw- 1 syoung root 6.6G Nov 13 10:08 merged.bam-25
    -rw-rw-rw- 1 syoung root 6.9G Nov 13 11:39 merged.bam-26
    -rw-rw-rw- 1 syoung root 7.1G Nov 13 13:11 merged.bam-27
    -rw-rw-rw- 1 syoung root 7.4G Nov 13 14:47 merged.bam-28
    -rw-rw-rw- 1 syoung root 7.7G Nov 13 16:27 merged.bam-29
    -rw-rw-rw- 1 syoung root 7.9G Nov 13 18:13 merged.bam-30
    -rw-rw-rw- 1 syoung root 8.2G Nov 13 20:07 merged.bam-31
    -rw-rw-rw- 1 syoung root 8.5G Nov 13 22:38 merged.bam-32
    -rw-rw-rw- 1 syoung root 8.8G Nov 14 00:34 merged.bam-33


bowtie-rf (cumulative 2)
---------

MISSING FILE 1

    -rw-rw-rw- 1 syoung root  313116630 Nov 12 15:39 merged.bam-2
    -rw-rw-rw- 1 syoung root  616246625 Nov 12 15:48 merged.bam-3
    -rw-rw-rw- 1 syoung root  718927149 Nov 12 15:57 merged.bam-4
    -rw-rw-rw- 1 syoung root 1021068986 Nov 12 16:10 merged.bam-5
    -rw-rw-rw- 1 syoung root 1320238909 Nov 12 16:27 merged.bam-6
    -rw-rw-rw- 1 syoung root 1320238909 Nov 12 16:28 merged.bam-7
    -rw-rw-rw- 1 syoung root 1617915983 Nov 12 16:49 merged.bam-8
    -rw-rw-rw- 1 syoung root 1664554804 Nov 12 17:11 merged.bam-9
    -rw-rw-rw- 1 syoung root 1960260687 Nov 12 17:35 merged.bam-10
    -rw-rw-rw- 1 syoung root 2254969873 Nov 12 18:03 merged.bam-11
    -rw-rw-rw- 1 syoung root 2548632773 Nov 12 18:36 merged.bam-12
    -rw-rw-rw- 1 syoung root 2841653920 Nov 12 19:14 merged.bam-13
    -rw-rw-rw- 1 syoung root 3133451449 Nov 12 19:55 merged.bam-14
    -rw-rw-rw- 1 syoung root 3424865819 Nov 12 20:48 merged.bam-15
    -rw-rw-rw- 1 syoung root 3715722282 Nov 12 21:46 merged.bam-16
    -rw-rw-rw- 1 syoung root 4006436294 Nov 12 22:53 merged.bam-17
    -rw-rw-rw- 1 syoung root  817626867 Nov 12 23:30 merged.bam-18
    -rw-rw-rw- 1 syoung root  817626867 Nov 12 23:26 merged.bam-19
    -rw-rw-rw- 1 syoung root 1126743473 Nov 13 03:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 1427848985 Nov 13 03:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 1427848985 Nov 13 04:00 merged.bam-23
    -rw-rw-rw- 1 syoung root 1727119401 Nov 13 04:22 merged.bam-24
    -rw-rw-rw- 1 syoung root 1250377728 Nov 13 04:48 merged.bam-25
    -rw-rw-rw- 1 syoung root 2024751357 Nov 13 04:48 merged.bam-26
    -rw-rw-rw- 1 syoung root 2321065799 Nov 13 05:19 merged.bam-27
    -rw-rw-rw- 1 syoung root 2616254587 Nov 13 05:52 merged.bam-28
    -rw-rw-rw- 1 syoung root 2910243405 Nov 13 06:31 merged.bam-29
    -rw-rw-rw- 1 syoung root 2910243405 Nov 13 06:32 merged.bam-30
    -rw-rw-rw- 1 syoung root 3203003805 Nov 13 07:12 merged.bam-31
    -rw-rw-rw- 1 syoung root 3495086782 Nov 13 07:55 merged.bam-32
    -rw-rw-rw- 1 syoung root 3786905249 Nov 13 08:42 merged.bam-33



novoalign (cumulative-2)
------------------------

UP TO FILE 25

    -rw-r--r-- 1 syoung root 285M Nov 17 00:19 merged-1.bam
    -rw-rw-rw- 1 syoung root 562M Nov 17 00:30 merged-2.bam
    -rw-rw-rw- 1 syoung root 838M Nov 17 00:50 merged-3.bam
    -rw-rw-rw- 1 syoung root 1.1G Nov 17 01:21 merged-4.bam
    -rw-rw-rw- 1 syoung root 1.4G Nov 18 14:34 merged-5.bam
    -rw-rw-rw- 1 syoung root 1.7G Nov 18 15:44 merged-6.bam
    -rw-rw-rw- 1 syoung root 1.9G Nov 18 17:12 merged-7.bam
    -rw-rw-rw- 1 syoung root 2.2G Nov 18 18:58 merged-8.bam
    -rw-rw-rw- 1 syoung root 2.4G Nov 18 21:04 merged-9.bam
    -rw-rw-rw- 1 syoung root 2.5G Nov 18 23:27 merged-10.bam
    -rw-rw-rw- 1 syoung root 2.7G Nov 19 02:03 merged-11.bam
    -rw-rw-rw- 1 syoung root 3.0G Nov 19 05:01 merged-12.bam
    -rw-rw-rw- 1 syoung root 3.3G Nov 19 08:28 merged-13.bam
    -rw-rw-rw- 1 syoung root 3.5G Nov 19 12:17 merged-14.bam
    -rw-rw-rw- 1 syoung root 3.8G Nov 19 16:20 merged-15.bam
    -rw-rw-rw- 1 syoung root 4.0G Nov 19 20:23 merged-16.bam
    -rw-rw-rw- 1 syoung root 4.3G Nov 20 00:26 merged-17.bam
    -rw-rw-rw- 1 syoung root 4.5G Nov 20 04:29 merged-18.bam
    -rw-rw-rw- 1 syoung root 4.8G Nov 20 08:32 merged-19.bam
    -rw-rw-rw- 1 syoung root 5.0G Nov 20 12:34 merged-20.bam
    -rw-rw-rw- 1 syoung root 5.3G Nov 20 16:38 merged-21.bam
    -rw-rw-rw- 1 syoung root 5.5G Nov 20 20:40 merged-22.bam
    -rw-rw-rw- 1 syoung root 5.8G Nov 21 00:43 merged-23.bam
    -rw-rw-rw- 1 syoung root 6.1G Nov 21 04:46 merged-24.bam
    -rw-rw-rw- 1 syoung root 6.3G Nov 21 08:49 merged-25.bam


maq (cumulative)
---

FILES 14 AND 15, FILES 20 AND 21

    -rw-r--r-- 1 syoung root  21G Nov 17 06:51 merged.bam
    -rw-r--r-- 1 syoung root 1.2G Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root 2.4G Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root 3.4G Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root 3.6G Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root 4.7G Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root 5.9G Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root 7.0G Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root 8.2G Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root 9.3G Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root  11G Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root  12G Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root  13G Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root  14G Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root  16G Nov  6 03:49 merged.bam-16
    -rw-r--r-- 1 syoung root  18G Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root  19G Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root  20G Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root  21G Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root  21G Nov 15 14:03 merged.bam-21
    -rw-r--r-- 1 syoung root 1.2G Nov  6 21:48 merged.bam-22
    -rw-r--r-- 1 syoung root 4.3G Nov  9 00:11 merged.bam-24
    -rw-r--r-- 1 syoung root 475M Nov 15 10:47 merged.bam-25
    -rw-r--r-- 1 syoung root 5.4G Nov 16 10:55 merged.bam-26
    -rw-r--r-- 1 syoung root 8.6G Nov 16 10:56 merged.bam-27
    -rw-r--r-- 1 syoung root  20G Nov 16 18:54 merged.bam-30
    -rw-r--r-- 1 syoung root 5.1G Nov 16 22:59 merged.bam-31
    -rw-r--r-- 1 syoung root  21G Nov 17 06:59 merged.bam-33
    -rw-r--r-- 1 syoung root  21G Nov 17 04:11 merged.bam.temp
    
ALSO:


merged:

FILES 12 AND 13

    -rw-r--r-- 1 syoung root 1.2G Nov  8 10:55 merged.bam-1
    -rw-r--r-- 1 syoung root 2.4G Nov  8 12:12 merged.bam-2
    -rw-r--r-- 1 syoung root 3.4G Nov  8 12:25 merged.bam-3
    -rw-r--r-- 1 syoung root 3.6G Nov  8 12:27 merged.bam-4
    -rw-r--r-- 1 syoung root 4.7G Nov  8 12:29 merged.bam-5
    -rw-r--r-- 1 syoung root 5.9G Nov  8 12:32 merged.bam-6
    -rw-r--r-- 1 syoung root 7.0G Nov  8 12:35 merged.bam-7
    -rw-r--r-- 1 syoung root 8.2G Nov  8 12:39 merged.bam-8
    -rw-r--r-- 1 syoung root 9.3G Nov  8 12:44 merged.bam-9
    -rw-r--r-- 1 syoung root  11G Nov  8 11:00 merged.bam-10
    -rw-r--r-- 1 syoung root  12G Nov  8 11:06 merged.bam-11
    -rw-r--r-- 1 syoung root  13G Nov  8 11:13 merged.bam-12
    -rw-r--r-- 1 syoung root  14G Nov  8 11:20 merged.bam-13
    -rw-r--r-- 1 syoung root  15G Nov  8 11:27 merged.bam-14
    -rw-r--r-- 1 syoung root  15G Nov  8 11:35 merged.bam-15
    -rw-r--r-- 1 syoung root  16G Nov  8 11:43 merged.bam-16
    -rw-r--r-- 1 syoung root  18G Nov  8 11:52 merged.bam-17
    -rw-r--r-- 1 syoung root  19G Nov  8 12:01 merged.bam-18
    -rw-r--r-- 1 syoung root  20G Nov  8 12:11 merged.bam-19
    -rw-r--r-- 1 syoung root  21G Nov  8 12:23 merged.bam-20
    -rw-r--r-- 1 syoung root 1.2G Nov  8 12:23 merged.bam-22

maq (cumulative2)
---

BROKEN AFTER FILE 9

    -rw-r--r-- 1 syoung root 1.2G Nov 12 15:45 merged.bam-1
    -rw-r--r-- 1 syoung root 2.4G Nov 12 16:27 merged.bam-2
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 17:41 merged.bam-3
    -rw-rw-rw- 1 syoung root 4.7G Nov 12 19:16 merged.bam-4
    -rw-rw-rw- 1 syoung root 5.8G Nov 12 21:05 merged.bam-5
    -rw-rw-rw- 1 syoung root 7.0G Nov 12 23:28 merged.bam-6
    -rw-rw-rw- 1 syoung root 8.1G Nov 13 02:13 merged.bam-7
    -rw-rw-rw- 1 syoung root 9.2G Nov 13 05:17 merged.bam-8
    -rw-rw-rw- 1 syoung root  11G Nov 13 08:49 merged.bam-9

    -rw-rw-rw- 1 syoung root 1.9G Nov 13 12:42 merged.bam-10

    -rw-rw-rw- 1 syoung root  12G Nov 13 12:46 merged.bam-11
    -rw-rw-rw- 1 syoung root  13G Nov 13 17:00 merged.bam-12
    -rw-rw-rw- 1 syoung root  14G Nov 13 21:23 merged.bam-13
    -rw-rw-rw- 1 syoung root  15G Nov 14 01:24 merged.bam-14
    -rw-rw-rw- 1 syoung root  16G Nov 14 05:36 merged.bam-15
    -rw-rw-rw- 1 syoung root  18G Nov 14 09:48 merged.bam-16
    -rw-rw-rw- 1 syoung root  19G Nov 14 13:59 merged.bam-17
    -rw-rw-rw- 1 syoung root 4.7G Nov 14 18:15 merged.bam-18
    -rw-rw-rw- 1 syoung root  20G Nov 14 18:24 merged.bam-19
    -rw-rw-rw- 1 syoung root  21G Nov 14 22:29 merged.bam-20
    -rw-r--r-- 1 syoung root 5.2G Nov 15 10:37 merged.bam-23
    -rw-r--r-- 1 syoung root 5.5G Nov 16 14:55 merged.bam-33





</entry>



<entry [Tue Nov 23 00:06:01 EST 2010] DID TRIAGE ON ALIGNMENTS AND DELETED ALIGNMENT SUBDIRS ON PEGASUS>



bowtie     
    cumulative
    cumulative2

bowtie-rf  
    cumulative
    cumulative2

eland     
    cumulative

maq        
    cumulative
    cumulative2

novoalign  
    cumulative
    cumulative2








ALIGNMENT DIRS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22

drwxrwxrwx 39 syoung root   460 Nov 12 13:39 bowtie
drwxrwxr-x 35 syoung root   387 Nov  5 14:27 bowtie-fr
drwxrwxr-x 39 syoung root   458 Nov 12 13:44 bowtie-rf
drwxrwxr-x 37 syoung root   500 Nov  9 11:21 eland
drwxrwxrwx 40 syoung root   477 Nov 15 11:21 maq
drwxrwxr-x 53 syoung root  2641 Nov 22 00:35 maq3
-rw-rw-r--  1 syoung root 86275 Nov 22 23:52 merged
drwxrwxr-x 38 syoung root   444 Nov 15 01:29 novoalign


BOWTIE
------

NB: PROBLEM WITH MERGED FILES 13 AND 14
    -rw-rw-rw- 1 syoung root 3859221748 Nov 12 21:17 merged.bam-13 <=== IDENTICAL
    -rw-rw-rw- 1 syoung root 3859221748 Nov 12 21:17 merged.bam-14 <=== IDENTICAL


screen -S cleanup

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
    OK
    

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie \
--references chr22





BOWTIE-RF
---------

screen -S bowtie-rf-cleanup

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf
    
    Cluster.pl    Run time: 00:00:20
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 10:37:58
    Cluster.pl    ****************************************
    

OOPS  REMOVED THESE DIRS:

subdir: 9
subfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/37
subfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/19
...
subfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/16


/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf




BOWTIE-FR
---------

screen -S rm-bowtie-fr

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr \
--references chr22

    Cluster.pl    Run time: 00:28:58
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:31:58
    Cluster.pl    ****************************************






MAQ
---

screen -S rm-maq

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
    
    Cluster.pl    Run time: 00:17:01
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 00:59:09
    Cluster.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq \
--references chr22
    
    NOTE WEIRD ERROR MESSAGES:
    
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/4
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/41
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/43
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/43': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/22
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/22': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/10
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/10': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/29
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/29': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/1
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/1': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/49
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/49': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/38
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/38': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/33
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/31
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/47
    Cluster.pl    Run time: 00:11:24
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:20:38
    Cluster.pl    ***************************************



MAQ-3
-----

screen -S rm-maq-3

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
    
    Cluster.pl    Run time: 00:17:01
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 00:59:09
    Cluster.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq \
--references chr22
        
    Cluster.pl    Run time: 00:10:23
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:20:38
    Cluster.pl    ****************************************




ELAND-2
-------

screen -S rm-eland

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland \
--references chr22

    Cluster.pl    Run time: 00:43:54
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:50:18
    Cluster.pl    ****************************************

PROBLEM WITH FILES 17 AND 18

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22
ll merged.bam*
    
    -rw-rw-rw- 1 syoung root 3769640811 Nov 13 07:15 merged.bam
    -rw-rw-rw- 1 syoung root  134035392 Nov  9 11:23 merged.bam-1
    -rw-rw-rw- 1 syoung root  261407213 Nov  9 11:29 merged.bam-2
    -rw-rw-rw- 1 syoung root  386048869 Nov  9 11:36 merged.bam-3
    -rw-rw-rw- 1 syoung root  508951572 Nov  9 11:45 merged.bam-4
    -rw-rw-rw- 1 syoung root  630573401 Nov  9 11:57 merged.bam-5
    -rw-rw-rw- 1 syoung root  751236141 Nov  9 12:10 merged.bam-6
    -rw-rw-rw- 1 syoung root  871035613 Nov  9 12:26 merged.bam-7
    -rw-rw-rw- 1 syoung root  990276539 Nov  9 12:43 merged.bam-8
    -rw-rw-rw- 1 syoung root 1109034499 Nov  9 13:02 merged.bam-9
    -rw-rw-rw- 1 syoung root 1227269825 Nov 12 11:27 merged.bam-10
    -rw-rw-rw- 1 syoung root 1345029642 Nov 12 11:51 merged.bam-11
    -rw-rw-rw- 1 syoung root 1462296572 Nov 12 12:16 merged.bam-12
    -rw-rw-rw- 1 syoung root 1579406988 Nov 12 12:46 merged.bam-13
    -rw-rw-rw- 1 syoung root 1696338738 Nov 12 13:18 merged.bam-14
    -rw-rw-rw- 1 syoung root 1812712165 Nov 12 13:52 merged.bam-15
    -rw-rw-rw- 1 syoung root 1928813360 Nov 12 16:07 merged.bam-16
    -rw-rw-rw- 1 syoung root 2044821360 Nov 12 16:43 merged.bam-17 <==== IDENTICAL
    -rw-rw-rw- 1 syoung root 2044821360 Nov 12 16:45 merged.bam-18 <==== IDENTICAL
    -rw-rw-rw- 1 syoung root 2160588640 Nov 12 17:33 merged.bam-19
    -rw-rw-rw- 1 syoung root 2276310330 Nov 12 18:26 merged.bam-20
    -rw-rw-rw- 1 syoung root 2391905475 Nov 12 19:14 merged.bam-21
    -rw-rw-rw- 1 syoung root 2507035329 Nov 12 20:03 merged.bam-22
    -rw-rw-rw- 1 syoung root 2622205954 Nov 12 20:54 merged.bam-23
    -rw-rw-rw- 1 syoung root 2737414958 Nov 12 21:48 merged.bam-24
    -rw-rw-rw- 1 syoung root 2852502856 Nov 12 22:45 merged.bam-25
    -rw-rw-rw- 1 syoung root 2967307488 Nov 12 23:44 merged.bam-26
    -rw-rw-rw- 1 syoung root 3082266441 Nov 13 00:55 merged.bam-27
    -rw-rw-rw- 1 syoung root 3197112370 Nov 13 01:53 merged.bam-28
    -rw-rw-rw- 1 syoung root 3311662588 Nov 13 02:52 merged.bam-29
    -rw-rw-rw- 1 syoung root 3426257145 Nov 13 03:54 merged.bam-30
    -rw-rw-rw- 1 syoung root 3540624185 Nov 13 04:59 merged.bam-31
    -rw-rw-rw- 1 syoung root 3655205850 Nov 13 06:07 merged.bam-32
    -rw-rw-rw- 1 syoung root 3769640811 Nov 13 07:17 merged.bam-33
    -rw-rw-rw- 1 syoung root 3769640671 Nov 13 06:38 merged.bam.temp




NOVOALIGN

REACHED FILE 25 - RERAN FROM FILE 26 (SEE ABOVE)

screen -S rm-novo

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign \
--references chr22

    Cluster.pl    Run time: 00:09:15
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:17:25
    Cluster.pl    ****************************************


/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign



hit.sam FILES SEEM OKAY:


/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2
[syoung@u01 cumulative2]$ cd ..
[syoung@u01 novoalign]$ ll */chr22/hit.sam
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



</entry>



<entry [Tue Nov 23 00:05:01 EST 2010] GENOTYPES IN pileup OUTPUT>



http://sourceforge.net/apps/mediawiki/samtools/index.php?title=SAM_FAQ]

GENOTYPE IS 4TH COLUMN:

genotype where heterozygotes are encoded in the IUB code: M=A/C, R=A/G, W=A/T, S=C/G, Y=C/T and K=G/T; indels are indicated by, for example, */+A, -A/* or +CC/-C. There is no difference between */+A or +A/*.



</entry>



<entry [Tue Nov 23 00:04:01 EST 2010] SNP CALLING ALGORITHMS>




GENOMICS PIPELINE DEFAULT SNP PREDICTION SETTINGS (SNP.pm):

#### GET RAW VARIANT CALLS AND FILTER VARIANT CALLS
samtools pileup -vcf samtools_index/referencefile mergedfile > rawfile
samtools.pl varFilter -D100 rawfile > filterfile

#### QUALITY FILTER VARIANTS TO GENERATE SNP FILE
awk '(\3=="*"&&\6>=50)||(\3!="*"&&\6>=20)' filterfile > snpfile



    SAMTOOLS SNP FILTER

The resultant output should be further filtered by:

samtools.pl varFilter raw.pileup | awk '$6>=20' > final.pileup  
to rule out error-prone variant calls caused by factors not considered in the statistical model.

PILEUP FORMAT:

An example of the ten-column pileup format:
 1         2      3   4   5    6   7   8       9       10
chrM  412  A  A  75   0  25  2       .,       II
chrM  413  G  G  72   0  25  4     ..t,     IIIH
chrM  414  C  C  75   0  25  4     ...a     III2
chrM  415  C  T  75  75  25  4     TTTt     III7

Column  Definition
    1   Chromosome
    2   Position (1-based)
    3   Reference base at that position
    4   Consensus bases
    5   Consensus quality
    6   SNP quality
    7   Maximum mapping quality
    8   Coverage (# reads aligning over that position)
    9   Read bases
   10   Base quality values (phred33 scale)






BOWTIE PAPER (VS MAQ AND SOAP)
http://genomebiology.com/2009/10/3/R25



PAIRED END ALIGNMENT DIFFERENCES
http://seqanswers.com/forums/showthread.php?t=1600


Li Heng: NovoAlign is the most accurate aligner mainly because it sees many suboptimal hits and achieves highest pairing fraction.


 04-27-2009, 12:45 PM	   #5
lh3
Senior Member
 
Join Date: Feb 2008
Location: Boston
Posts: 391

Actually there are a lot to say about paired-end mapping. This is where the accuracy of different aligners differs. The algorithms can be classified into four groups.

a) Eland-like strategy. Eland finds up to 10 equally best hits first and then check which pair (10x10 in total) is consistent. SSAHA2 uses a similar strategy, but seeing more top hits.

b) SOAP-like strategy. SOAP finds almost all the hits and then pair them. I do not know whether it may map a read to a suboptimal position if its mate is hanging around. I am sure SOAP-2.0.1 and BWA do this if necessary. You can say a) and b) are essentially the same, but only b) is useful to anchor reads in repeats.

c) MAQ-like strategy. MAQ does not find all the single-end hits first. It pairs the reads while doing the alignment. For programs indexing reads, this strategy is more effective and efficient than collecting all the single-end hits first.

d) We can map one end first and then do local alignment around the region pointed by the mapped reads. This strategy is usually combined with the previous. I believe NovoAlign/MAQ/BWA use this strategy as a complement to other strategies.

For short reads, proper pairing increases the coverage of the genome and substantially reduce false alignments.




 04-27-2009, 12:54 PM	   #6
nilshomer
Moderator
 
Join Date: Nov 2008
Location: Los Angeles, CA, USA
Posts: 715

Quote:
Originally Posted by lh3  
For short reads, proper pairing increases the coverage of the genome and substantially reduce false alignments.
The above is exactly right, although it may depend on the exact experiment. For example cancer sequencing we expect many translocations, or large-scale rearrangements, and preferring "paired reads" may reduce our power.

In general, if an aligner produces all hits for each end, any post-alignment filtering is possible (all the above classes). Of course some limit must be placed on the number of hits returned (thousands is overkill), since my 4 petabyte array of solid state hard drives has yet to arrive in the mail.


 04-27-2009, 12:54 PM	   #6
nilshomer
Moderator
 
Join Date: Nov 2008
Location: Los Angeles, CA, USA
Posts: 715

Quote:
Originally Posted by lh3  
For short reads, proper pairing increases the coverage of the genome and substantially reduce false alignments.
The above is exactly right, although it may depend on the exact experiment. For example cancer sequencing we expect many translocations, or large-scale rearrangements, and preferring "paired reads" may reduce our power.

In general, if an aligner produces all hits for each end, any post-alignment filtering is possible (all the above classes). Of course some limit must be placed on the number of hits returned (thousands is overkill), since my 4 petabyte array of solid state hard drives has yet to arrive in the mail.



 04-27-2009, 01:15 PM	   #7
lh3
Senior Member
 
Join Date: Feb 2008
Location: Boston
Posts: 391

On the contrary, my experience is detecting structural variations (SVs) particularly presses for highly effective pairing. In the real world, abnormal pairs are most likely to be caused by false alignments rather than true SVs, which is also true for cancer genomes. And if a read can be paired with its mate, the alignment tends to be correct. I know several groups on detecting SVs put a lot of effort on getting more reads paired.

Whether keeping all hits is a debate. Surely we can recover anything, but the cost is considerable. How to use them effectively for SV detection is also an open question, I think. In addition, for effective pairing, keeping thousands of hits or keeping equally best hits only is not good enough. It is important to see sufficient suboptimal hits. NovoAlign is the most accurate aligner mainly because it sees many suboptimal hits and achieves highest pairing fraction.

Alignment accuracy is no so important for resequencing, but it is one of the most important factors for SV detection.




 04-27-2009, 01:46 PM	   #9
nilshomer
Moderator
 
Join Date: Nov 2008
Location: Los Angeles, CA, USA
Posts: 715

What I don't follow is if you align each end separately you will get the highest pairing fraction, since you are the very sensitive in this case (fewer constraints, in fact no constraints between each end). Furthermore, using one end to infer hits for the other can also increase sensitivity.

In my own experience, if one is sensitive enough, potentially false SVs (due to mapping) can be eliminated since by examining the secondary hits for each end, and seeing if there exists a pair of alignments for each end that fall within the expected insert size distribution that are not too much worse than the "best pair". Is this what you are talking about? If so, then we agree.

I would take exception to Novoalign being the most accurate, since this is conditional on sensitivity, as well as the many definitions of "accuracy".

Finally, I think you and I have a fundamental disagreement between what an aligner should do. I think it should return all hits for a given read that it can find (sensitivity), and let the user filter/choose the best alignment or alignment pair based on their experiment. I would prefer gapped smith-waterman, but this could vary based on experiment. Given this, I agree to disagree.

The aligner is but one step in the whole process, and everything shouldn't be lumped into the alignment algorithm.





SEQUENCE VARIANT ANALYZER (DUKE)

THREE POINTS:

1. DEPTH THRESHOLD > 10X FOR 99.30% HOMOZYGOUS SNP CORRECT CALLING

2. 'Gene Prioritization' = LIST OF TRUNCATED/NON-SYN PROTEINS PRIORITIZED BY PROPORTION TEST/CONTROL RATIO

3. 'intolerable' NON-SYNONYMOUS SNPs PREDICTED USING MAPP 
http://mendel.stanford.edu/SidowLab/downloads/MAPP/index.html




http://people.genome.duke.edu/~dg48/sva/inputs.php



SVA users need to prepare four (4) types of input files for an SVA project. All these files, except for type 3, can be generated from a pileup file, a format first used by Tony Cox and Zemin Ning at the Sanger Institute. This pileup file can be generated from software tools, for example, SAMtools, in a next-generation sequencing study. However, please note that the specific pileup format we used here is a bit different from the default SAMtools output format described here. Later in this page I will include detailed information and programs to generate those files.

These 4 types of files are:

A list of identified single nucleotide variants (SNVs) in a specific pileup format - text file with file name extension .samtools;
A list of identified insertion/deletion s(INDELs) in a specific pileup format - text file with file name extension .samtoolsindels;
(Optional) A list of structural variations (SVs) in HMMCNV output format - text file with file name extension .events;
A chromosome-wise coverage and quality control data file, generated from SAMtools pileup output.- binary file with file name extension .bco
In addition, there is an optional pedinf file for an SVA project. This file lists the subjects in a linkage format. This file is not necessary for SVA annotation tasks, but is necessary for some SVA analysis and exporting functions.

Optional pedinf file :

pedinf file: listing the subjects in a linkage format, consisting of six columns, seperated by space or tab:

Family ID, Individual ID, Father ID, Mother ID, Gender (1=male, 2=female), Affected status (1=control, 2=case, -9=unknown) 

Here is an example for this file.

hemo0001 hemo0001 0 0 1 2
hemo0004 hemo0004 0 0 1 2
hemo0005 hemo0005 0 0 1 2
hemo0006 hemo0006 0 0 1 2
hemo0007 hemo0007 0 0 1 2
hemo0011 hemo0011 0 0 1 2
hemo0017 hemo0017 0 0 1 2
hemo0019 hemo0019 0 0 1 2
hemo0020 hemo0020 0 0 1 2
hemo0022 hemo0022 0 0 1 2
control1 control1 0 0 1 1
control2 control2 0 0 1 1
control3 control3 0 0 1 1
control4 control4 0 0 1 1
control5 control5 0 0 1 1
control6 control6 0 0 1 1
control7 control7 0 0 1 1
control8 control8 0 0 1 1
control9 control9 0 0 1 1
control10 control10 0 0 1 1



Using SVA Analysis functions - Gene Prioritization
http://people.genome.duke.edu/~dg48/sva/analysis_genepri.php


The 'Gene Prioritization' function produces a list of protein coding genes that are 'knocked out' by homozygous variants in case genomes. This analysis prioritizes genes by the number of cases containing homozygous protein truncating or non-synonymous genetic variants, absent in control genomes. By this definition, different variants in the same gene are allowed and contribute equally to the ranking of this gene. In other words, this analysis tries to answer this simple question: do you see enrichment of protein-truncating (optionally, or non-synonymous) variants in any gene in the cases, when compared to control genomes?

Your SVA project must contain at least one case and one control for this function to work. Your SVA project must contain at least two cases for this function to reliably prioritize knocked out genes (with only one case, all homozygous knock out variants are listed but they all have the same liklihood of impacting case phenotype).



Function of genetic variant

This section allows you to select the types of 'knock out' variants you wish to include. The three options are:
'Protein truncation only'. This is the default setting and includes all homozygous variants that result in a premature trunction of a protein. Protein truncating mutations will always be included in the output.
'Including non-synonymous SNPs'. This setting includes both protein truncating variants and homozygous SNPs resulting in the change of an amino acid residue in the resulting protein.
'For non-synonymous SNPs: including only intolerable NS change'. This setting is supplementary to option number #2. When checked, an additional filter is applied to the non-synonymous SNPs by eliminating any 'tolerable' non-synonymous SNPs. Note: The status of an 'intolerable' non-synonymous SNP is determined using the MAPP software (http://mendel.stanford.edu/SidowLab/downloads/MAPP/index.html).



Criteria for homozygous variants

This section allows you to adjust the coverage you want to require for a homozygous variant. This will impact the number of variants that show up on your gene prioritization output. If you do not care about coverage (i.e. confidence) of the homozygous variants, you can uncheck 'Minimum coverage for a homozygous variant'. Otherwise the default parameters are set as follows: 
 	Number of sequencing reads
Autosomes (case):	10
Sex chromosomes (case):	5
Autosomes (control):	10
Sex chromosomes (control):	5


A brief explanation of default parameters for homozygous variants: 

In order to determine reliable default parameters, a number of whole genome sequence samples were analyzed for the coverage (read depth) distribution for confident 'homozygous' SNPs called by SAMtools. The coverage data was compared to the 1 million SNP chip data for the same sample. This analysis revealed the following:

Mistakenly called homozygous SNPs (defined by mismatch with 1M chip), had an average read depth of 7.03, with a median of 5.
Correctly called homozygous SNPs (defined by match with 1M chip), had an average read depth of 23.48, with a median of 24.
When a read depth threshold is not specified, 97.2% homozygous SNPs can be correctly called.
When a read depth threshold of >=10X is specified, then 99.30% homozygous SNPs can be correctly called.
These data suggest that a read depth threshold needs to be considered when you define a SNP as homozygous.  
If you want a lower false negative, but a relatively higher false positive (sensitivity is high), then use a lower threshold in cases but higher threshold in controls.
If you want a higher false negative, but a relatively lower false positive (specificity is high), then use a higher threshold in cases but lower threshold in controls.
Genetic model

This section allows you to select the genotype of the variant (heterozygous or homozygous) that you will allow to be present in your control genomes. The target variations in your cases are unaffected by this setting (still homozygous knock out variants).
'Recessive model (allowing for heterozygotes in controls)'. This is the default setting. This setting allows for any target variant to be present in control genomes in heterozygous form.
Alternately, you have an option to specify a model 'not allowing heterozygotes' in control genomes. This means that only target variants for which the control genomes are homozygous for the reference allele will appear on the Gene Prioritization output.
Control genomes

If 'check control samples for reference sequence' is unchecked, then all homozygous variants are listed, not just those unique to the cases. This function is disabled since you always want this function to check control samples for the reference sequence.
You may choose to 'Treat Venter's sequence as a control genome' by clicking the check box next to this option.




RICHARD DURBIN'S glfprogs WITH GENOTYPING PRIORS

http://maq.sourceforge.net/glfProgs.shtml



FASTQ FORMAT PAPER

http://ukpmc.ac.uk/articles/PMC2847217;jsessionid=B7ED82A1835DDBEAA28205A653F8CCD9.jvm4


BAM FORMAT

(FROM SAMTOOLS PAPER)

Binary Alignment/Map (BAM) format To improve the performance,
we designed a companion format BAM, which is the binary representation of
SAM and keeps exactly the same information as SAM. BAM is compressed
by the BGZF library, a generic library developed by us to achieve fast
random access in a zlib-compatible compressed file. An example alignment
of 112Gbp of Illumina GA data requires 116GB of disk space (1.0 byte per
input base), including sequences, base qualities and all the meta information
generated by MAQ. Most of this space is used to store the base qualities.
Sorting and indexing A SAM/BAM file can be unsorted, but sorting
by coordinate is used to streamline data processing and to avoid loading
extra alignments into memory.

A position-sorted BAM file can be indexed.
We combine the UCSC binning scheme (Kent et al., 2002) and simple
linear indexing to achieve fast random retrieval of alignments overlapping
a specified chromosomal region.


In most cases, only one seek call is needed
to retrieve alignments in a region.


NB: LINEAR INDEXING IS A SIMPLE LOOKUP USING SUBSETS TO REDUCE TIME
http://blogs.mathworks.com/steve/2008/02/08/linear-indexing/


3 CONCLUSION
We designed and implemented a generic alignment format, SAM,
which is simple to work with and flexible enough to keep most
information from various sequencing platforms and read aligners.
The equivalent binary representation, BAM, is compact in size and
supports fast retrieval of alignments in specified regions. Using
positional sorting and indexing, applications can perform streambased
processing on specific genomic regions without loading the
entire file into memory. The SAM/BAM format, together with
SAMtools, separates the alignment step from downstream analyses,
enabling a generic and modular approach to the analysis of genomic
sequencing data.



</entry>



<entry [Mon Nov 22 21:11:23 EST 2010] MAQ AND SAMTOOLS SNP CALLING>



Shen et al 2009
A SNP discovery method to assess variant allele probability from next-generation resequencing data


Currently, there are several methods available for detecting SNPs from NGS data, including Pyrobayes (Quinlan et al. 2008), POLYBAYES (Marth et al. 1999), MAQ (Li et al. 2008), SOAP (Li et al. 2009), VarScan (Ley et al. 2008; Koboldt et al. 2009), and other largely heuristic approaches (Wheeler et al. 2008). Pyrobayes-POLYBAYES recalibrates base-calling of all nucleotide positions from raw data, and then takes a Bayesian approach that incorporates the population polymorphism rates as priors to identify polymorphic sites.

**** MAQ uses the consensus of the aligned reads to identify SNPs. While MAQ is able to achieve high sensitivity, it can result in an expected high false-positive rate due to intrinsic high probabilities of sequencing errors in NGS data (Li et al. 2008).

VarScan and other available heuristic approaches that apply empirical covariate cutoffs can work well for specific projects, but become problematic with applications even with slight differences in underlying data.



MAQ SNP CALLING

from the PDF manual/published paper: maq for indels needs paired end reads. maps read 1, then does gapped alignment of read 2. maq indelpe will list the indels called from the read2 gapped alignment.


http://seqanswers.com/forums/showthread.php?t=554
try novocraft software if you want more indels from single end or paired end reads.



How are SNPs and indels called and filtered by SAMtools?
http://sourceforge.net/apps/mediawiki/samtools/index.php?title=SAM_FAQ


By default, SNPs are called with a Bayesian model identical to the one used in MAQ. A simplified SOAPsnp model is implemented, too. Indels are called with a simple Bayesian model. The caller does local realignment to recover indels that occur at the end of a read but appear to be contiguous mismatches. For an example, see this picture.

http://samtools.sourceforge.net/images/seq2-156.png


The varFilter filters SNPs/indels in the following order:
d: low depth
D: high depth
W: too many SNPs in a window (SNP only)
G: close to a high-quality indel (SNP only)
Q: low root-mean-square (RMS) mapping quality (SNP only)
g: close to another indel with more evidence (indel only)
The first letter indicates the reason why SNPs/indels are filtered when you invoke varFilter with the `-p' option. A SNP/indel filtered by a rule higher in the list will not be tested against other rules.


I see `*' in the pileup sequence column. What are they?

A star at the sequence column represents a deletion. It is a place holder to make sure the number of bases at that column matches the read depth column. Simply ignore `*' if you do not use this information.




I only want to use a subset of alignments in pileup.

If you want to filter on mapping quality, flags, one read group or one library, you may just use the view command. If want to apply more complex filters, you may write an awk command for SAM. For example, I only want to use alignment with two or fewer differences (mismatches+gaps):
samtools view -h aln.bam | perl -ne 'print if (/^@/||(/NM:i:(\d+)/&&$1<=2))' | samtools pileup -S - > out.txt
or exclude all gapped alignments:
samtools view -h aln.bam | awk '$6!~/[ID]/' | samtools pileup -S -




I want to get `unique' alignments from SAM/BAM.

We prefer to say an alignment is `reliable' rather than `unique' as `uniqueness' is not well defined in general cases. You can get reliable alignments by setting a threshold on mapping quality:
samtools view -bq 1 aln.bam > aln-reliable.bam
You may want to set a more stringent threshold to get more reliable alignments.




MAQ PAPER
http://genome.cshlp.org/content/18/11/1851.long
Mapping short DNA sequencing reads and calling variants using mapping quality scores

ITERATIVE MAPPING:

At the alignment stage, we should set the minimum base error probability as the rate of differences between the reference and the reads. However, this strategy is an approximation.

When there are differences between the reference and reads, the
best position might consistently give wrong alignments even if
there are no sequencing errors, which can invalidate the calculation
of mapping qualities.

It would be possible in an iterative
scheme to update the reference with an estimate of the new
sample sequence from the first mapping and then remap to the
updated reference.



DESCRIPTION OF COMPETITORS:


We also introduce a new statistical model for consensus genotype
calling and subsequent SNP calling. For capillary reads,
two different approaches have previously been taken to calling
SNPs. The first type of approach works on PCR resequencing data
from diploid samples. These algorithms directly examine chromatogram
trace files and detect variants by extracting or comparing
signals in the peaks of traces. The most widely used software
includes PolyPhred (Stephens et al. 2006), SNPdetector
(Zhang et al. 2005), and novoSNP (Weckx et al. 2005), each of
which can call the genotype of the sample as well as detect variants.
The second type of approach works for clone-based data.
They are usually built upon phred base calls and detect variants by
detecting base-pair differences between a read from a single haplotype
and the reference sequence. Two representative software
of this type are ssahaSNP (Ning et al. 2001) and PolyBayes (Marth
et al. 1999). While ssahaSNP uses a heuristic rule known as the
neighborhood quality standard (NQS) (Altshuler et al. 2000),
PolyBayes develops an explicit statistical framework to model
variants.

All new sequencing technologies are shotgun methods that
give sequences derived from a single molecule sampled from a
larger population. (Current methods amplify the starting template
by some form of PCR, but true single molecule methods are
expected in the future.) This means the methods for calling variants
from new technology data are most closely related to the
second group described above, including ssahaSNP and Poly-
Bayes. However, because of sampling and error rate, we need to
combine data from multiple reads. In practice, errors at a particular
site are correlated, and we must take this correlation into
account. This is analogous to calling a consensus from a sequence
assembly, and we propose a Bayesian approach to this issue that
is related to that used in assembly software CAP3 (Huang and
Madan 1999).

In summary, this article presents methods and software for
mapping short sequence reads to a reference genome, calculating
the probability of a read alignment being correct, and consensus
genotype calling with a model that incorporates correlated errors
and diploid sampling. The applicability and accuracy of the
methods are evaluated based on both real data from the bacterium
Salmonella paratyphi and simulated data from the diploid
human X chromosome.



MAQ OVERVIEW

Overview of MAQ algorithms

MAQ is a program that rapidly aligns short reads to the reference
genome and accurately infers variants, including SNPs and short
indels, from the alignment.

At the alignment stage, MAQ first searches for the ungapped
match with lowest mismatch score, defined as the sum of qualities
at mismatching bases. To speed up the alignment, MAQ only
considers positions that have two or fewer mismatches in the
first 28 bp (default parameters). Sequences that fail to reach a
mismatch score threshold but whose mate pair is mapped are
searched with a gapped alignment algorithm in the regions defined
by the mate pair.


To evaluate the reliability of alignments,
MAQ assigns each individual alignment a phred-scaled quality
score (capped at 99), which measures the probability that the true
alignment is not the one found by MAQ.

**** MAQ always reports a
single alignment, and if a read can be aligned equally well to
multiple positions, MAQ will randomly pick one position and
give it a mapping quality zero.

**** Because their mapping score is set
to zero, reads that are mapped equally well to multiple positions
will not contribute to variant calling. However, they do give information
on copy number of repetitive sequences and on the
fraction of reads that can be aligned to the genome, and can
easily be filtered out for downstream analysis if desired.


**** Mapping quality scores and mapping all reads that match the genome
even if repetitive are where MAQ differs from most other alignment
programs.

MAQ fully utilizes the mate-pair information of paired
reads. It is able to use this information to correct wrong alignments,
to add confidence to correct alignments, and to accurately
map a read to repetitive sequences if its mate is confidently
aligned. With paired-end reads, MAQ also finds short insertions/
deletions (indels) from the gapped alignment described above.

At the SNP calling stage, MAQ produces a consensus genotype
sequence from the alignment. The consensus sequence is
inferred from a Bayesian statistical model, and each consensus
genotype is associated with a phred quality that measures the
probability that the consensus genotype is incorrect.

Potential SNPs are detected by comparing the consensus sequence to the
reference and can be further filtered by a set of predefined rules.

These rules are designed to achieve the best performance on deep
human resequencing data and aim to compensate for simplifications
and assumptions used in the statistical model (e.g., treating
neighbor positions independently).




MAQ PAPER DISCUSSION


The reliability of short read alignments

The reliability of read alignments can substantially affect the accuracy
of the detection of variations. Knowing which alignment
is reliable is key to the subsequent analyses.

*** The most convenient way to measure the reliability is to define uniqueness: A read is
said to be uniquely mapped if its second best hit contains
more mismatches than its best hit.


Generally this simple criterion
works well, but potential difficulties are illustrated by the
following scenarios:
(1) a read has two one-mismatch hits, one
with a Q30 mismatch and the other with a Q3 mismatch;
(2) a read has one perfect hit and 100 one-mismatch hits;
(3) a read has a perfect hit and a Q3-mismatch hit.

In the first case,
although the read is not unique, the hit with a Q30 mismatch may
still be reliable. In the remaining two cases, although the read can
be uniquely aligned, the alignments are not reliable. For the human
genome, these types of scenarios may happen at times due
to the large fraction of repetitive sequences.

*** In our view, it is better to regard the position a read is
mapped to as a random variable, and the reliability of an alignment
can be naturally interpreted as the likelihood of the read
being mapped to the correct position. At this point, mapping
quality directly measures the reliability. It considers the repeat
structure of the reference and the base quality of read sequences,
which is implied in Equation 1 (see Methods), and can easily
handle the three cases shown above.




MAQ FALSE NEGATIVE AND FALSE POSITIVE

Unlike in an alignment, both FP and FN of SNPs on real data
can be estimated from other sources of data. FP can be evaluated
by capillary resequencing or genotyping a small subset of SNP
calls. FN can be estimated by comparing SNP calls to the wholegenome
chip-genotyping results. The fraction of chipgenotyping
polymorphic sites that are not found is the FN. It
should be noted that such a fraction is only the FN on the sites
where probes can be designed for the genotyping microarray.
These sites tend to be unique in the reference genome and are
usually easier to find by short-read resequencing. The overall FN
across the whole genome is higher.

In resequencing, it is also a good idea to explicitly define the
resequenceable regions (or the regions where SNPs can be confidently
called). We want to distinguish low SNP-density regions
from hard-to-resequence regions. Using MAQ, the fraction of the
human genome that is resequenceable with 35-bp reads is ?85%,
and with read pairs separated by 170 bp it is ?93%. Achieving
higher coverage would require a mixture of varying insert sizes
and longer reads.




MAQ PAIRED END ALIGNMENT ALGORITHM:


Methods

Single end read mapping
To map reads efficiently, MAQ first indexes read sequences and
scans the reference genome sequence to identify hits that are
extended and scored. With the Eland-like (A.J. Cox, unpubl.)
hashing technique, MAQ, by default, guarantees to find alignments
with up to two mismatches in the first 28 bp of the reads.
MAQ maps a read to a position that minimizes the sum of quality
values of mismatched bases.

**** If there are multiple equally
best positions, then one of them is chosen at random.


Paired-end read alignment
MAQ jointly aligns the two reads in a read pair and fully utilizes
the mate-pair information in the alignment.
In the paired-end alignment mode, MAQ will by default
build six hash tables for each end (12 tables in total).

**** In one round of indexing, MAQ indexes the first end with two templates
and the second end also with two templates. Four hash tables,
two for each end, will be put in memory at a time.

***** In the scan of the reference, when a hit of a read is found on the forward strand
of the reference sequence, MAQ appends its position to a queue
that always keeps the last two hits of this read on the forward
strand. When a hit of a read is found on the reverse strand, MAQ
checks the queue of its mate and tests whether its mate has a hit
on the forward strand within a maximum allowed distance ahead
of the current read. If there is one, MAQ will mark the two ends
as a pair. In this way, MAQ jointly maps the reads without independently
storing all the potential hits of each end.


****** For each end, MAQ will only hold in memory two hash
tables corresponding to two complementary templates (e.g.,
11110000 and 00001111 for 8-bp reads). This strategy guarantees
that any hit with no more than one mismatch can be always
found in each round of the scan. Holding more hash tables in
memory would help to find pairs containing more mismatches,
but doing this would also increase memory footprint.
Paired-end mapping qualities are derived from single end
mapping qualities.


********* There are two different cases when a pair can
be wrongly mapped.

In the first case, one of the two ends is
wrongly aligned and the other is correct. This scenario may happen
if a repetitive sequence appear twice or more in a short region.

In the second instance, a pair is wrong because both ends
are wrong at the same time.


In MAQ, if there is a unique pair mapping in which both
ends hit consistently (i.e., in the right orientation within the
proper distance), we give the mapping quality Qp = Qs1+Qs2 to
both reads, assuming independent errors. If there are multiple
consistent hit pairs, we take their single end mapping qualities as
the final mapping qualities.


Detecting short indels

MAQ first aligns reads with the ungapped alignment algorithm
described above and then finds short indels by utilizing matepair
information. Given a pair of reads, if one end can be mapped
with confidence but the other end is unmapped, a possible scenario
is that a potential indel interrupts the alignment of the
unmapped read. For this unmapped read, we can apply a standard
Smith-Waterman gapped alignment (Smith and Waterman
1981) in a region determined by the aligned read. The coordinate
and the size of the region is estimated from the distribution of all
the aligned reads by taking the mean separation of read pairs plus
or minus twice the standard deviation. As Smith-Waterman will
only be applied to a small fraction of reads in short regions,
efficiency is not a serious issue.




Consensus genotype calling
By default, MAQ assumes the sample is diploid. It calculates the
posterior distribution of genotypes and calls the genotype that
maximizes the posterior probability.
Before consensus calling, MAQ first combines mapping
quality and base quality. If a read is incorrectly mapped, any
sequence differences inferred from the read cannot be reliable.
Therefore, the base quality used in SNP calling cannot exceed the
mapping quality of the read. MAQ reassigns the quality of each
base as the smaller value between the read mapping quality and
the raw sequencing base quality.
We first calculate the probability of data given each possible
genotype. In consensus calling, if there are no sequencing errors,
at most two different nucleotides can be legitimately seen. Therefore,
we can consider only the two most frequent nucleotides at
any position and ignore others as errors. Assume we are observing
data D which consist of k nucleotides b and n-k nucleotides
b' with b,b'?{A,C,G,T} and b ' b'. Then the three possible genotypes
are ?b,b?, ?b,b'?, and ?b',b'?. If the true genotype is ?b,b?, we
have n-k errors from n bases. Let the probability of observing

these errors be alpha n,n-k, and therefore P(D|?b,b?) = alpha n,n-k. Similarly we
have P(D|?b',b'?) = alpha nk. If the true genotype is ?b,b'?, the probability
can be approximated with a binomial distribution:
P(D|?b,b'?) = (nk
)/2n.
If we further assume the prior of genotypes is
P(?b,b?) = P(?b',b'?) = (1 - r)/2 and P(?b,b'?) = r, we can calculate
the posterior probability P(g|D) of genotype g given the observation
D. Then the estimated genotype is g = argmaxgP(g|D) with a
quality Qg = -10log10[1 - P(g|D)]. Here r is the probability of
observing a heterozygote. We usually use r = 0.001 for the discovery
of new SNPs and r = 0.2 for inferring genotypes at known
SNP sites. In principle, a site-specific r can be used given known
allele frequencies.

The real difficulty is to calculate alpha nk, the probability of k
errors observed from n nucleotides. If errors arise independently
and error rates are identical for all bases, alpha nk can be calculated
with a binomial distribution. When errors are correlated and not
identical, MAQ approximates alpha nk by

ank ? cnk theta i=0
k?1
epsilon i+1
 theta i . (2)

Where epsilon i is the ith smallest base error probability and c'nk is a
function of epsilon i but varies little with epsilon i.


**** The only unknown parameter is  theta , which controls the dependency of errors.

The deduction
of this equation and the calculation of c'nk will be presented in
the Supplemental material.


Taking a form like Equation 2 is inspired by CAP3 (Huang
and Madan, 1999), where  theta  is arbitrarily set to 0.5. In principle,  theta 
can be estimated from real data. In practice, however, the estimate
is complicated by the requirement of large data set where
SNPs are known, by the inaccuracy of sequencing qualities, by
the dependencies of mapping qualities, and also by the approximation
made to derive the equation. To estimate  theta , we just tried
different values and selected the one that was giving the best
final genotype calls.


**** We found  theta  = 0.85 is a reasonable value for
Illumina Genetic Analyzer data.
Simulating diploid genomes and short



http://maq.sourceforge.net/maq-manpage.shtml

cns2snp	maq cns2snp in.cns > out.snp
Extract SNP sites. Each line consists of chromosome, position, reference base, consensus base, Phred-like consensus quality, read depth, the average number of hits of reads covering this position, the highest mapping quality of the reads covering the position, the minimum consensus quality in the 3bp flanking regions at each side of the site (6bp in total), the second best call, log likelihood ratio of the second best and the third best call, and the third best call.

The 5th column is the key criterion when you judge the reliability of a SNP. However, as this quality is only calculated assuming site independency, you should also consider other columns to get more accurate SNP calls. Script command maq.pl SNPfilter is designed for this (see below).

The 7th column implies whether the site falls in a repetitive region. If no read covering the site can be mapped with high mapping quality, the flanking region is possibly repetitive or in the lack of good reads. A SNP at such site is usually not reliable.

The 8th column roughly gives the copy number of the flanking region in the reference genome. In most cases, this number approaches 1.00, which means the region is about unique. Sometimes you may see non-zero read depth but 0.00 at the 7th column. This indicates that all the reads covering the position have at least two mismatches. Maq only counts the number of 0- and 1-mismatch hits to the reference. This is due to a complex technical issue.

The 9th column gives the neighbouring quality. Filtering on this column is also required to get reliable SNPs. This idea is inspired by NQS, although NQS is initially designed for a single read instead of a consensus.



MAQ snpFilter (USES -D ARGUMENT)


SNPfilter	maq.pl SNPfilter [-d minDep] [-D maxDep] [-Q maxMapQ] [-q minCnsQ] [-w indelWinSize] [-n minNeiQ] [-F in.indelpe] [-f in.indelsoa] [-s minScore] [-m maxAcross] [-a] [-N maxWinSNP] [-W densWinSize] in.cns2snp.snp > out.filtered.snp

Rule out SNPs that are covered by few reads (specified by -d), by too many reads (specified by -D), near (specified by -w) to a potential indel, falling in a possible repetitve region (characterized by -Q), or having low-quality neighbouring bases (specified by -n). If maxWinSNP or more SNPs appear in any densWinSize window, they will also be filtered out together.

    OPTIONS:
    -d INT	 Minimum read depth required to call a SNP [3]
    -D INT	 Maximum read depth required to call a SNP (<255, otherwise ignored) [256]
    -Q INT	 Required maximum mapping quality of reads covering the SNP [40]
    -q INT	 Minimum consensus quality [20]
    -n INT	 Minimum adjacent consensus quality [20]
    -w INT	 Size of the window around the potential indels. SNPs that are close to indels will be suppressed [3]
    -F FILE	 The indelpe output [null]
    -f FILE	 The indelsoa output [null]
    -s INT	 Minimum score for a soa-indel to be considered [3]
    -m INT	 Maximum number of reads that can be mapped across a soa-indel [1]
    -a	 Alternative filter for single end alignment






FEJES SNP CALLING

http://www.fejes.ca/2008/07/snp-calling-from-maq.html




INDEL CALLING - CLUSTERED SNPS REMOVED BY REALIGNMENT
http://www.broadinstitute.org/files/shared/mpg/nextgen2010/nextgen_sivachenko.pdf
NGS Analysis and Visualization Workshop
February 4, 2010
Andrey Sivachenko, Eric Banks


The magnitude of the problem
SNP Calling: Bayesian SNP caller on 10Mb of merged pilot 1
(low coverage) reads for CEU individuals
 There were 74,363 total SNPs called in the region
 Of those SNPS, 36,438 (49%) occurred in clusters
(cluster = 2 or more SNPs within 10bp)
 About half the SNP calls are ignored with naïve filtering!
 Nearby clusters (i.e. less than a read length away) were merged
 There were 3,356 total clusters a/er merging
 30% of the SNP clusters were removed by realignment



GATK Realignment Pipeline Implementation



where:
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





CASAVA/ILLUMINA SNP CALLER

http://www.illumina.com/Documents/products/technotes/technote_snp_caller_sequencing.pdf

CASAVA ALGORITHM:

USES ONLY THESE READ PAIRS:

    NORMAL READS (NO ANOMALOUS PAIRS OR UNPAIRED 'ORPHAN' READS)
    WITHIN 3 STANDARD DEVIATIONS OF EXPECTED GAP SIZE
    CORRECT ORIENTATION
    MINIMUM ALIGNMENT SCORE = 6


CALCULATE ALLELE SCORE 

    1. FOR ALL BASES, CALCULATE E.G. FOR A = log10 P(observed base| no "As" present) 
    2. SUBTRACT LOWEST SCORE FROM OTHER THREE
    3. CONVERT TO LOG-ODDS SCORE, SCORE OF 3 =  PHRED SCORE OF 30
    
SNP CALLING

CALL SNP IF ALLELE SCORE > 10 AND COVERAGES < 3 TIMES CHROMOSOMAL AVERAGE
DEFINED AS HETERZYGOT IF BOTH ALLELES HAVE ALLELE SCORE > 10 AND RATIO OF THEIR SCORES <= 3




CASAVA DRAWBACKS

SNP CALLER NEEDS 30X COVERAGE OR MORE (15X PER HAPLOID ALLELE)

INDELS THAT ARE MISCALLED AS SNPS CAN BE RECOGNIZED BY A DROP IN COVERAGE (ELAND CAN'T DEAL WITH GAPS)

CASAVA 1.0 ONLY USES GENOME REFERENCE FOR SNP CALLING SO ALLELE FREQUENCIES FOR RNA SNPS CLOSE TO SPLICE SITE MAY BE INACCURATE

BY DEFAULT, CASAVA 1.0 DOES NOT CALL SNPS IN HIGH COPY REGIONS (NOT DESIRABLE IN SAY CANCER RESEARCH)



NOTES
-----



http://i.seqanswers.com/question/209/samtools-pileup-snp-quality-distribution

I'll take a stab at this, but I've only briefly looked at the supplemental data in the original MAQ paper (this is the same method for SNP calling used by samtools pileup).

The SNP quality is determined using an estimate of the probabilities. Their estimation only has a certain amount of resolution (because nucleotide counts are always integers), so this is not a continuous function. The phred-like score is likewise not continuous (it gets rounded to an integer), but the number of nucleotides and the SNP quality will be on different scales, resulting in the "divisible by 3" feature you noticed. If the SNP quality and nucleotide counts could be fractional that would likely be pretty smooth. As far as the spikes at 228 and 30, I'm not entirely sure where those come from. With the kind of probability estimation they're using there are often edge cases (when both have equal numbers of reads, when one has exactly one read, when there's only two reads total, etc.) and it's possible that those edge cases get rounded to those particular scores, resulting in their over-representation. I would look to see if the SNPs generating those scores have anything in common.



Samtools pileup SNP quality distribution

The docs say the SNP quality column contains the:

Phred-scaled likelihood that the genotype is identical to the reference, which is also called `SNP quality'. Suppose the reference base is A and in alignment we see 17 G and 3 A. We will get a low consensus quality because it is difficult to distinguish an A/G heterozygote from a G/G homozygote. We will get a high SNP quality, though, because the evidence of a SNP is very strong.






</entry>



<entry [Mon Nov 22 11:19:01 EST 2010] Moose IS INSTALLED ON PEGASUS>



LIBRARY IS HERE:

use lib "/k/local/perl5.x64/site_perl/5.8.8/x86_64-linux-thread-multi";


TO USE:

module load mihg


PRINT OUT 'module load mihg' ENVIRONMENT VARIABLES:

perl -e 'print join "\n", %ENV'

    SSH_CLIENT
    10.150.190.170 3586 22
    SSH_ASKPASS
    /usr/libexec/openssh/gnome-ssh-askpass
    CVS_RSH
    ssh
    LSF_ENVDIR
    /share/apps/lsf/conf
    SGE_QMASTER_PORT
    701
    LESSOPEN
    |/usr/bin/lesspipe.sh %s
    PWD
    /k/local/perl5.x64/5.8.8/x86_64-linux-thread-multi
    LANG
    en_US.UTF-8
    USER
    syoung
    CLICOLOR
    1
    G_BROKEN_FILENAMES
    1
    LOGNAME
    syoung
    SHLVL
    1
    INPUTRC
    /etc/inputrc
    PATH
    /k/analysis/bin:/k/analysis/scripts:/sw/bin:/nethome/syoung/base/bin:/usr/X11R6/bin:/nethome/syoung/base/bin/utils:/home/bioinfo/apps/ngs/bin/nextgen:/home/bioinfo/apps/ngs/bin/exome:/home/bioinfo/apps/ngs/bin/utils:/home/bioinfo/apps/ngs/bin:/nethome/syoung/base/apps/python/python/2.7/bin:/share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/etc:/share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin
    PERL5LIB
    /k/local/perl5.x64/site_perl/5.8.5:/k/local/perl5.x64/site_perl/5.8.6:/k/local/perl5.x64/site_perl/5.8.7:/k/local/perl5.x64/site_perl/5.8.8:/k/local/perl5.i686/site_perl/5.8.5:/k/local/perl5.i686/site_perl/5.8.6:/k/local/perl5.i686/site_perl/5.8.7:/k/local/perl5.i686/site_perl/5.8.8:/k/local/perl5.x64/vendor_perl/5.8.5:/k/local/perl5.x64/vendor_perl/5.8.6:/k/local/perl5.x64/vendor_perl/5.8.7:/k/local/perl5.x64/vendor_perl/5.8.8:/k/local/perl5.i686/vendor_perl/5.8.5:/k/local/perl5.i686/vendor_perl/5.8.6:/k/local/perl5.i686/vendor_perl/5.8.7:/k/local/perl5.i686/vendor_perl/5.8.8:/k/local/perl5.x64:/k/local/perl5.i686
    MODULEPATH
    /share/apps/modules/Modules/versions:/share/apps/modules/Modules/$MODULE_VERSION/modulefiles:/share/apps/modules/Modules/modulefiles:/nethome/sagebase/modulefiles
    MODULE_VERSION_STACK
    3.2.7
    HISTSIZE
    1000
    TERM
    vt100
    LSF_SERVERDIR
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/etc
    SSH_TTY
    /dev/pts/16
    HOME
    /nethome/syoung
    SSH_CONNECTION
    10.150.190.170 3586 10.141.226.121 22
    LD_LIBRARY_PATH
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib
    MANPATH
    /share/apps/lsf/7.0/man:/usr/share/man:
    MODULESHOME
    /share/apps/modules/Modules/3.2.7
    MODULE_VERSION
    3.2.7
    MAIL
    /var/spool/mail/syoung
    module
    () {  eval `/share/apps/modules/Modules/$MODULE_VERSION/bin/modulecmd bash $*`
    }
    LOADEDMODULES
    lsf:mihg
    HOSTNAME
    u01
    SGE_EXECD_PORT
    702
    LSF_BINDIR
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/bin
    OLDPWD
    /k/local/perl5.x64/5.8.8
    LSF_LIBDIR
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib
    _
    /usr/bin/perl
    LS_COLORS
    no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:
    SHELL
    /bin/bash
    XLSF_UIDDIR
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib/uid
    SGE_ROOT
    /common/sge
    _LMFILES_
    /share/apps/modules/Modules/3.2.7/modulefiles/lsf:/share/apps/modules/Modules/3.2.7/modulefiles/mihg






PERL5LIB

/k/local/perl5.x64/site_perl/5.8.8

/k/local/perl5.x64/vendor_perl/5.8.8


    
    
    



</entry>



<entry [Fri Nov 19 14:59:47 EST 2010] RUN collateVenns.pl ON ALL snpVenn.pl RUNS>




ELAND 
-----

INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn
lines *-snp

    hit-1-snp-NOT-hit-33-snp	20720
    hit-3-snp-NOT-hit-33-snp	14918
    hit-4-snp-NOT-hit-33-snp	16801
    hit-5-snp-NOT-hit-33-snp	16801
    hit-6-snp-NOT-hit-33-snp	17261


/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--replicates 1-33

    16904   3563    20720
    0       0       0
    17136   3331    14918
    16063   4404    16801
    16063   4404    16801
    14833   5634    17261
    13506   6961    17119
    12377   8090    16585
    11307   9160    15968
    10374   10093   15236
    9507    10960   14457
    8774    11693   13645
    8034    12433   12815
    7440    13027   12058
    6874    13593   11233
    6359    14108   10415
    5905    14562   9724
    5531    14936   8918
    5107    15360   8238
    4740    15727   7610
    4434    16033   7111
    4084    16383   6456
    3739    16728   5882
    3451    17016   5244
    3138    17329   4600
    2795    17672   4142
    2463    18004   3651
    2190    18277   3136
    1853    18614   2606
    1514    18953   2046
    1134    19333   1482
    692     19775   843
    0       20467   0


    collateVenns.pl    Run time: 00:00:01
    collateVenns.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl
    collateVenns.pl    4:00PM, 19 November 2010
    collateVenns.pl    ****************************************




BOWTIE
------

INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn
lines *-snp
    
    hit-10-snp-NOT-hit-33-snp: 36165
    hit-11-snp-NOT-hit-33-snp: 34399
    hit-12-snp-NOT-hit-33-snp: 33194
    hit-13-snp-NOT-hit-33-snp: 32831
    hit-14-snp-NOT-hit-33-snp: 32219
    hit-15-snp-NOT-hit-33-snp: 41382
    ...

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--replicates 1-33
        
    0       0       0       0       0
    12824   1098    38538   13922   39636
    13063   852     38804   13915   39656
    13319   775     38881   14094   39656
    13229   872     38787   14101   39659
    13150   957     38727   14107   39684
    12954   1001    38667   13955   39668
    12465   1298    38373   13763   39671
    12192   1774    37908   13966   39682
    36165   23841   17494   60006   41335
    34399   25531   15773   59930   41304
    33194   27309   13909   60503   41218
    32831   29289   12066   62120   41355 <== SAME NUMBER OF UNIQUE SNPs
    32219   29289   11886   61508   41175 <== SAME NUMBER OF UNIQUE SNPs
    41382   32571   8647    73953   41218
    40631   33305   7864    73936   41169
    39580   33877   7142    73457   41019
    39023   34373   6594    73396   40967
    11870   17379   22909   29249   40288
    11015   18295   21979   29310   40274
    10090   19065   21193   29155   40258
    9190    19853   20440   29043   40293
    8333    20695   19490   29028   40185
    7573    21520   18624   29093   40144
    6778    22292   17847   29070   40139
    5990    22980   17139   28970   40119
    6815    32318   7966    39133   40284
    5781    33275   6989    39056   40264
    4762    34242   5971    39004   40213
    3738    35285   4881    39023   40166
    2752    36311   3837    39063   40148
    1968    37544   2544    39512   40088
    1184    38872   1184    40056   40056


    collateVenns.pl    Run time: 00:00:04
    collateVenns.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl
    collateVenns.pl    4:05PM, 19 November 2010
    collateVenns.pl    ****************************************


GET INPUT FILE LINES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
lines hit-*.sav


hit-1.sav: 17091
hit-2.sav: 16607
hit-3.sav: 16606
hit-4.sav: 16607
hit-5.sav: 16607
hit-6.sav: 16606
hit-7.sav: 16607
hit-8.sav: 16607
hit-9.sav: 16606
hit-10.sav: 71883
hit-11.sav: 71883
hit-12.sav: 71913
hit-13.sav: 71881
hit-14.sav: 71882
hit-15.sav: 78274
hit-16.sav: 78270
hit-17.sav: 78272
hit-18.sav: 78274
hit-19.sav: 35748
hit-20.sav: 35743
hit-21.sav: 35747
hit-22.sav: 35747
hit-23.sav: 35750
hit-24.sav: 35751
hit-25.sav: 35751
hit-26.sav: 35749
hit-27.sav: 48648
hit-28.sav: 48650
hit-29.sav: 48652
hit-30.sav: 48653
hit-31.sav: 48653
hit-32.sav: 48653
hit-33.sav: 48652


BAM FILES LOOK OKAY:


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
ls -al merged.bam*
    
    -rw-rw-rw- 1 syoung root 9347649654 Nov 14 00:31 merged.bam
    -rw-r--r-- 1 syoung root  313122729 Nov 12 13:41 merged.bam-1
    -rw-rw-rw- 1 syoung root  616350940 Nov 12 13:50 merged.bam-2
    -rw-rw-rw- 1 syoung root  917106299 Nov 12 15:49 merged.bam-3
    -rw-rw-rw- 1 syoung root 1216636814 Nov 12 16:04 merged.bam-4
    -rw-rw-rw- 1 syoung root 1514479277 Nov 12 16:23 merged.bam-5
    -rw-rw-rw- 1 syoung root 1811352014 Nov 12 16:46 merged.bam-6
    -rw-rw-rw- 1 syoung root 2106575603 Nov 12 17:14 merged.bam-7
    -rw-rw-rw- 1 syoung root 2400963738 Nov 12 17:45 merged.bam-8
    -rw-rw-rw- 1 syoung root 2694264543 Nov 12 18:21 merged.bam-9
    -rw-rw-rw- 1 syoung root 2986225695 Nov 12 18:57 merged.bam-10
    -rw-rw-rw- 1 syoung root 3277803992 Nov 12 19:37 merged.bam-11
    -rw-rw-rw- 1 syoung root 3568763254 Nov 12 20:23 merged.bam-12
    -rw-rw-rw- 1 syoung root 3859221748 Nov 12 21:17 merged.bam-13 <=== IDENTICAL
    -rw-rw-rw- 1 syoung root 3859221748 Nov 12 21:17 merged.bam-14 <=== IDENTICAL
    -rw-rw-rw- 1 syoung root 4149376183 Nov 12 22:12 merged.bam-15
    -rw-rw-rw- 1 syoung root 4439275769 Nov 12 23:11 merged.bam-16
    -rw-rw-rw- 1 syoung root 4729085080 Nov 13 00:15 merged.bam-17
    -rw-rw-rw- 1 syoung root 5018430742 Nov 13 01:17 merged.bam-18
    -rw-rw-rw- 1 syoung root 5307459520 Nov 13 02:21 merged.bam-19
    -rw-rw-rw- 1 syoung root 5596600974 Nov 13 03:28 merged.bam-20
    -rw-rw-rw- 1 syoung root 5885544472 Nov 13 04:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 6173854437 Nov 13 05:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 6462412593 Nov 13 07:18 merged.bam-23
    -rw-rw-rw- 1 syoung root 6750940312 Nov 13 08:42 merged.bam-24
    -rw-rw-rw- 1 syoung root 7039611709 Nov 13 10:08 merged.bam-25
    -rw-rw-rw- 1 syoung root 7327685431 Nov 13 11:39 merged.bam-26
    -rw-rw-rw- 1 syoung root 7615889244 Nov 13 13:11 merged.bam-27
    -rw-rw-rw- 1 syoung root 7904151078 Nov 13 14:47 merged.bam-28
    -rw-rw-rw- 1 syoung root 8192549633 Nov 13 16:27 merged.bam-29
    -rw-rw-rw- 1 syoung root 8480941481 Nov 13 18:13 merged.bam-30
    -rw-rw-rw- 1 syoung root 8769355101 Nov 13 20:07 merged.bam-31
    -rw-rw-rw- 1 syoung root 9058184194 Nov 13 22:38 merged.bam-32
    -rw-rw-rw- 1 syoung root 9347649654 Nov 14 00:34 merged.bam-33
    -rw-rw-rw- 1 syoung root 9347649660 Nov 13 23:28 merged.bam.temp




AND AS A RESULT THE *sav FILES ARE IDENTICAL

-rw-rw-rw- 1 syoung root 21032835 Nov 20 03:34 hit-13.sav
-rw-rw-rw- 1 syoung root 21032835 Nov 20 03:34 hit-14.sav


AND THE *snp FILES ARE IDENTICAL

-rw-rw-rw- 1 syoung root 13391081 Nov 12 21:24 hit-13.snp
-rw-rw-rw- 1 syoung root 13391081 Nov 12 21:24 hit-14.snp



CHECK BAM FILES:


FILE 13

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22

samtools index merged.bam-13
samtools idxstats merged.bam-13

# reference_sequence sequence length  #mapped_reads #unmapped_reads

chr22   51304566        69059615        0
*       0       0       0

samtools view -X merged.bam-13 | less -S
SRR003824.2824748:7:166:260:598#0       pPR2    chr22   16050002        255     36M     =       16050163        197     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    8:6A80A86<08'11?-10-..)(+++%+%&-&*)*    XA:i:0  MD:Z:34A1       NM:i:1
SRR004835.893408:3:12:200:1108#0        pPR2    chr22   16050002        255     36M     =       16050193        227     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    =IIIIIIIFIIIBI2II34II5-IB8E,7+03B4&D    XA:i:0  MD:Z:34A1       NM:i:1
SRR003863.5582694:3:283:160:482#0       pPR1    chr22   16050002        255     36M     =       16050185        219     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    IIIIIIIIIIIGII5II91I7>712%>14029-0(0    XA:i:0  MD:Z:34A1       NM:i:1
SRR003846.2664345:4:131:814:828#0       pPR1    chr22   16050003        255     36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    IIIIIIIIIIIIIIIIIIIICIIBIIIIIIIIC@I6    XA:i:0  MD:Z:33A2       NM:i:1
SRR002291.25589721:6:180:266:39#0       pPR1    chr22   16050003        255     36M     =       16050168        201     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    IIIIIIIIIIIIIIIG65IA10;,29*6,112(&&&    XA:i:0  MD:Z:33A2       NM:i:1
SRR004818.4409747:7:227:238:554#0       pPR1    chr22   16050005        255     36M     =       16050193        224     TGATAAGTCCCAGGACTTCAGAAGAGCTGTGAGACC    IIIIIIIIIIFIIIIA?42/+6F2+.+1+($+-+&&    XA:i:0  MD:Z:36 NM:i:0
SRR004861.4407997:7:44:216:948#0        pPR2    chr22   16050006        255     36M     =       16050173        203     GATAAGTCCCAGGACTTCAGAAGAGCTGTGCGACCT    II2II@8I&DIF@I95%II09I4:3+13&1,4+/+(    XA:i:0  MD:Z:30A5       NM:i:1
SRR004853.4269253:3:67:1850:1511#0      pPR2    chr22   16050007        255     36M     =       16050187        216     ATAAGTCCCAGGACTTCAGAAGAGCTGTGCGACCTT    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:29A6       NM:i:1


cat cumulativeSnp-chr22-13.sh
    
time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit.sam;
time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam;
time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit;
time mv -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam;
time cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam-13;
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22;
/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam | tee hit-13.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-13.filter;

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-13.filter > hit-13.snp

[syoung@u02 chr22]$


FILE 14

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22

samtools index merged.bam-14
samtools idxstats merged.bam-14

# reference_sequence sequence length  #mapped_reads #unmapped_reads

    chr22   51304566        69059615        0
    *       0       0       0

samtools view -X merged.bam-14 | less -S
SRR003824.2824748:7:166:260:598#0       pPR2    chr22   16050002        255     36M     =       16050163        197     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    8:6A80A86<08'11?-10-..)(+++%+%&-&*)*    XA:i:0  MD:Z:34A1       NM:i:1
SRR004835.893408:3:12:200:1108#0        pPR2    chr22   16050002        255     36M     =       16050193        227     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    =IIIIIIIFIIIBI2II34II5-IB8E,7+03B4&D    XA:i:0  MD:Z:34A1       NM:i:1
SRR003863.5582694:3:283:160:482#0       pPR1    chr22   16050002        255     36M     =       16050185        219     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    IIIIIIIIIIIGII5II91I7>712%>14029-0(0    XA:i:0  MD:Z:34A1       NM:i:1
SRR003846.2664345:4:131:814:828#0       pPR1    chr22   16050003        255     36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    IIIIIIIIIIIIIIIIIIIICIIBIIIIIIIIC@I6    XA:i:0  MD:Z:33A2       NM:i:1
SRR002291.25589721:6:180:266:39#0       pPR1    chr22   16050003        255     36M     =       16050168        201     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    IIIIIIIIIIIIIIIG65IA10;,29*6,112(&&&    XA:i:0  MD:Z:33A2       NM:i:1
SRR004818.4409747:7:227:238:554#0       pPR1    chr22   16050005        255     36M     =       16050193        224     TGATAAGTCCCAGGACTTCAGAAGAGCTGTGAGACC    IIIIIIIIIIFIIIIA?42/+6F2+.+1+($+-+&&    XA:i:0  MD:Z:36 NM:i:0
SRR004861.4407997:7:44:216:948#0        pPR2    chr22   16050006        255     36M     =       16050173        203     GATAAGTCCCAGGACTTCAGAAGAGCTGTGCGACCT    II2II@8I&DIF@I95%II09I4:3+13&1,4+/+(    XA:i:0  MD:Z:30A5       NM:i:1
SRR004853.4269253:3:67:1850:1511#0      pPR2    chr22   16050007        255     36M     =       16050187        216     ATAAGTCCCAGGACTTCAGAAGAGCTGTGCGACCTT    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:29A6       NM:i:1




</entry>



<entry [Fri Nov 19 14:19:47 EST 2010] RUN snpVenn.pl ON ALL AVAILABLE CUMULATIVE SNPs>



ELAND       #### DONE
ELAND-2     #### DONE
BOWTIE      #### DONE. cumulative2 ALSO DONE (GOOD).
BOWTIE-rf   #### DONE BUT MISSING FILE 1 AGAIN
MAQ         #### RERUNNING AS cumulative2 (FILE 21, Mon Nov 15 01:01:05 EST 2010)
NOVOALIGN   #### RERUNNING (FILE 14, Fri Nov 19 14:45:24 EST 2010)





VENN - BETWEEN
--------------

ELAND VS BOWTIE





RUN VENN-SELF (NEIGHBOUR)
-------------------------

ELAND

BOWTIE





RUN VENN-SELF (ALL VS ONE)
--------------------------

ELAND
BOWTIE



ELAND - DONE
-----

OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn
lines *-snp

    hit-1-snp-NOT-hit-33-snp	20720
    hit-3-snp-NOT-hit-33-snp	14918
    hit-4-snp-NOT-hit-33-snp	16801
    hit-5-snp-NOT-hit-33-snp	16801
    hit-6-snp-NOT-hit-33-snp	17261
    ...


ELAND-2     RUNNING Fri Nov 19 14:18:06 EST 2010
-------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn


screen -S eland-vennsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn \
--replicates 2-33 \
--loop distributed \
--label eland-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/loop-vennsav.out

    Run time: 00:15:51
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:33PM, 19 November 2010
    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn
ll *snp
    
    -rw-rw-rw- 1 syoung root 2592121 Nov 19 14:33 hit-10-snp-NOT-hit-33-snp
    -rw-rw-rw- 1 syoung root 2478946 Nov 19 14:32 hit-11-snp-NOT-hit-33-snp
    -rw-rw-rw- 1 syoung root 2353023 Nov 19 14:32 hit-12-snp-NOT-hit-33-snp
    -rw-rw-rw- 1 syoung root 2219145 Nov 19 14:32 hit-13-snp-NOT-hit-33-snp
    -rw-rw-rw- 1 syoung root 2091319 Nov 19 14:31 hit-14-snp-NOT-hit-33-snp
    ...
    


BOWTIE (CUM-2)      RUNNING     Fri Nov 19 14:27:30 EST 2010
--------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn


screen -S bowtie-vennsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--replicates 2-33 \
--loop distributed \
--label vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/loop-vennsav.out

    cumulativeSNP.pl    Run time: 35:15:25
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    0:55AM, 14 November 2010
    cumulativeSNP.pl    ****************************************


DO MISSING FILE 1 VENN:

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-1.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-1-snp
    
    samVenn::Snp.pl    Run time: 02:33:19
    samVenn::Snp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl
    samVenn::Snp.pl    1:31PM, 23 November 2010
    samVenn::Snp.pl    ****************************************


COLLATE VENNS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--replicates 1-33


collateVenns.pl    Run time: 00:00:18
collateVenns.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl
collateVenns.pl    1:35PM, 23 November 2010
collateVenns.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn
cat collate-hit-33-snp-hit-%REPLICATE%-snp-1-33.tsv
    
    hit-33-snp      hit-1-snp       27227   1944    81505   29171   83449
    hit-33-snp      hit-2-snp       12824   1098    38538   13922   39636
    hit-33-snp      hit-3-snp       13063   852     38804   13915   39656
    hit-33-snp      hit-4-snp       13319   775     38881   14094   39656
    hit-33-snp      hit-5-snp       13229   872     38787   14101   39659
    hit-33-snp      hit-6-snp       13150   957     38727   14107   39684
    hit-33-snp      hit-7-snp       12954   1001    38667   13955   39668
    hit-33-snp      hit-8-snp       12465   1298    38373   13763   39671
    hit-33-snp      hit-9-snp       12192   1774    37908   13966   39682
    hit-33-snp      hit-10-snp      36165   23841   17494   60006   41335
    hit-33-snp      hit-11-snp      34399   25531   15773   59930   41304
    hit-33-snp      hit-12-snp      33194   27309   13909   60503   41218
    hit-33-snp      hit-13-snp      32831   29289   12066   62120   41355
    hit-33-snp      hit-14-snp      32219   29289   11886   61508   41175
    hit-33-snp      hit-15-snp      41382   32571   8647    73953   41218
    hit-33-snp      hit-16-snp      40631   33305   7864    73936   41169
    hit-33-snp      hit-17-snp      39580   33877   7142    73457   41019
    hit-33-snp      hit-18-snp      39023   34373   6594    73396   40967
    hit-33-snp      hit-19-snp      11870   17379   22909   29249   40288
    hit-33-snp      hit-20-snp      11015   18295   21979   29310   40274
    hit-33-snp      hit-21-snp      10090   19065   21193   29155   40258
    hit-33-snp      hit-22-snp      9190    19853   20440   29043   40293
    hit-33-snp      hit-23-snp      8333    20695   19490   29028   40185
    hit-33-snp      hit-24-snp      7573    21520   18624   29093   40144
    hit-33-snp      hit-25-snp      6778    22292   17847   29070   40139
    hit-33-snp      hit-26-snp      5990    22980   17139   28970   40119
    hit-33-snp      hit-27-snp      6815    32318   7966    39133   40284
    hit-33-snp      hit-28-snp      5781    33275   6989    39056   40264
    hit-33-snp      hit-29-snp      4762    34242   5971    39004   40213
    hit-33-snp      hit-30-snp      3738    35285   4881    39023   40166
    hit-33-snp      hit-31-snp      2752    36311   3837    39063   40148
    hit-33-snp      hit-32-snp      1968    37544   2544    39512   40088
    hit-33-snp      hit-33-snp      1184    38872   1184    40056   40056


/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn/hit-19-snp-NOT-hit-33-snp



/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-33.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-33-snp




CHECK WHY BOWTIE FILE 1 CUMULATIVE SNP IS EMPTY
-----------------------------------------------

BAM FILE LOOKS NORMAL:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
samtools view -X merged.bam-1 | less -S

    SRR004823.14378:3:1:253:207#0   pPR1    chr22   16050016        255     36M     =       16050195        215     AGGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTC    IIIIIIIIIIIIIIDIIIIIIII8IIIII33I,78)    XA:i:1  MD:Z:20A15      NM:i:1
    SRR002304.7863377:1:90:544:448#0        pPR1    chr22   16050031        255     36M     =       16050192        197     CTGTGCGACCTTGGCCAAGTCACTTCCCCCTTCAGG    IIIIIIIIIIIIIC4I>(=)III.+4+&(:*//83+    XA:i:2  MD:Z:5A21T8     NM:i:2
    SRR002301.2006530:3:94:327:904#0        pPR1    chr22   16050036        255     36M     =       16050211        211     CGACCTTGGCCAAGTCACTTCCTCCTTCAGGAACAT    IIIIIIIIIIIIIIIIIIIID3/;??/<,:002+2A    XA:i:1  MD:Z:0A35       NM:i:1
    SRR006554.5571971:2:259:467:605#0       pPR1    chr22   16050041        255     36M     =       16050225        220     TTGGCCAAGTCACTTCCTCCTTCAGGAACATTGCAG    IIIII;3>E?66=EE8/C,A0?+).7+/+-57.+'&    XA:i:0  MD:Z:36 NM:i:0
    SRR004850.5452648:4:56:158:1670#0       pPR2    chr22   16050115        255     36M     =       16050284        205     GGTCATGCAATCTGGACAACATTCACCTTTAAAAGT    IIAI4IIIIIIIIII3IIAIEIICIII<IC+4-0?,    XA:i:0  MD:Z:36 NM:i:0
    SRR004860.9862481:6:98:511:367#0        pPR2    chr22   16050127        255     36M     =       16050314        223     TGGACAACATTCACCTTTAAAAGTTTATTGATCTTT    <II6;GI'2E82-E:I499(-4D#I+2?9I,I+I<6    XA:i:0  MD:Z:36 NM:i:0
    SRR003870.1056177:4:49:412:676#0        pPR1    chr22   16050128        255     36M     =       16050286        194     GGACAACATTCACCTTTAAAAGTTTATTGATTTTTT    II@IIII5IIG>I9C4>3-1+;0E6+A8.(15=?56    XA:i:0  MD:Z:31C4       NM:i:1
    


SAM FILE IS IDENTICAL TO BAM FILE:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22
head hit.sam

    SRR004823.14378:3:1:253:207#0   99      chr22   16050016        255     36M     =       16050195        215     AGGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTC    IIIIIIIIIIIIIIDIIIIIIII8IIIII33I,78)    XA:i:1  MD:Z:20A15      NM:i:1
    SRR002304.7863377:1:90:544:448#0        99      chr22   16050031        255     36M     =       16050192        197     CTGTGCGACCTTGGCCAAGTCACTTCCCCCTTCAGG    IIIIIIIIIIIIIC4I>(=)III.+4+&(:*//83+    XA:i:2  MD:Z:5A21T8     NM:i:2
    SRR002301.2006530:3:94:327:904#0        99      chr22   16050036        255     36M     =       16050211        211     CGACCTTGGCCAAGTCACTTCCTCCTTCAGGAACAT    IIIIIIIIIIIIIIIIIIIID3/;??/<,:002+2A    XA:i:1  MD:Z:0A35       NM:i:1
    SRR006554.5571971:2:259:467:605#0       99      chr22   16050041        255     36M     =       16050225        220     TTGGCCAAGTCACTTCCTCCTTCAGGAACATTGCAG    IIIII;3>E?66=EE8/C,A0?+).7+/+-57.+'&    XA:i:0  MD:Z:36 NM:i:0
    SRR004850.5452648:4:56:158:1670#0       163     chr22   16050115        255     36M     =       16050284        205     GGTCATGCAATCTGGACAACATTCACCTTTAAAAGT    IIAI4IIIIIIIIII3IIAIEIICIII<IC+4-0?,    XA:i:0  MD:Z:36 NM:i:0
    SRR004860.9862481:6:98:511:367#0        163     chr22   16050127        255     36M     =       16050314        223     TGGACAACATTCACCTTTAAAAGTTTATTGATCTTT    <II6;GI'2E82-E:I499(-4D#I+2?9I,I+I<6    XA:i:0  MD:Z:36 NM:i:0
    SRR003870.1056177:4:49:412:676#0        99      chr22   16050128        255     36M     =       16050286        194     GGACAACATTCACCTTTAAAAGTTTATTGATTTTTT    II@IIII5IIG>I9C4>3-1+;0E6+A8.(15=?56    XA:i:0  MD:Z:31C4       NM:i:1
    SRR002283.6606116:3:42:881:433#0        99      chr22   16050137        255     36M     =       16050314        213     TCACCTTTAAAAGTTTATTGATCTTTTGTGACATGC    IIIIIIIIIBIII7II<GBDGIIII53=3+2@?1.;    XA:i:0  MD:Z:36 NM:i:0
    SRR002304.7863377:1:90:544:448#0        147     chr22   16050192        255     36M     =       16050031        -197    AGAAACTAAAGGGTCGCAGGCCGGTTTCTGCTAATT    >99E",$97+?/D,III-4<II+DI8DEIIIIIIIH    XA:i:0  MD:Z:36 NM:i:0
    SRR004823.14378:3:1:253:207#0   147     chr22   16050195        255     36M     =       16050016        -215    AACTAAAGGGTCGCAGTCCGGTTTCTGCTAATTTCT    5*H'8'1&&#+G&BH(%I=%(II?II=IIIIIIIII    XA:i:1  MD:Z:16G19      NM:i:1







NOTES
-----




NB: COLLATION RESULTS FOR cumulative (I.E., NOT cumulative2)

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--replicates 1-33


/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn/collate-hit-33-snp-hit-%REPLICATE%-snp-1-33.tsv

    collateVenns.pl    Run time: 00:00:02
    collateVenns.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl
    collateVenns.pl    1:49AM, 21 November 2010
    collateVenns.pl    ****************************************


cat /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn/collate-hit-33-snp-hit-%REPLICATE%-snp-1-33.tsv

    0       0       0       0       0
    0       0       0       0       0
    994     62      875     1056    937
    0       0       0       0       0
    278     54      881     332     935
    0       0       0       0       0
    647     60      876     707     936
    633     74      862     707     936
    91      67      866     158     933
    87      71      863     158     934
    87      71      862     158     933
    83      74      859     157     933
    214     77      856     291     933
    214     78      855     292     933
    210     80      854     290     934
    213     80      854     293     934
    213     82      852     295     934
    209     81      852     290     933
    206     87      847     293     934
    202     88      846     290     934
    0       0       0       0       0
    615     221     713     836     934
    44      76      857     120     933
    124     92      842     216     934
    113     103     831     216     934
    97      119     815     216     934
    82      134     800     216     934
    67      149     785     216     934
    56      160     774     216     934
    0       0       0       0       0
    44      171     762     215     933
    90      842     92      932     934
    0       933     0       933     933




</entry>



<entry [Fri Nov 19 17:33:47 EST 2010] FIX BOWTIE FILE 1 PROBLEM IN cumulativeSnp.pl>




THE FILE 1 hit.sap IS 5.3 MB:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22
ll hit.snp
    
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp

lines 1/chr22/hit.snp
    
    1/chr22/hit.snp: 81835


BUT THE FIRST FILE IN THE CUMULATIVE SNPS (WHICH SHOULD BE IDENTICAL TO FILE 1 hit.snp)
IS 4.8 MB AND HAS LESS LINES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ll hit-1.snp

    -rw-rw-rw- 1 syoung root 4.8M Nov  5 13:44 hit-1.snp

lines  hit-1.snp 

    hit-1.snp: 77385



RAN snpVenn.pl TO COMPARE FILE 1 hit.snp WITH CUMULATIVE hit-1.snp


mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/venn

screen -S snpvenn

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22/hit.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-1.snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/venn \
--querylabel bowtie-1 \
--targetlabel bowtie-cum 

    
    samVenn::Snp.pl    Run time: 03:36:23
    samVenn::Snp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl
    samVenn::Snp.pl    2:48AM, 20 November 2010
    samVenn::Snp.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/venn
lines *

    bowtie-1-AND-bowtie-cum: 74148
    bowtie-1-NOT-bowtie-cum: 7687
    bowtie-cum-NOT-bowtie-1: 3237









</entry>



<entry [Fri Nov 19 17:33:47 EST 2010] RERUN MAQ.pl AS maq3>




mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3

screen -S maq3

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/MAQ.pl \
--replicates 1-33 \
--loop parallel \
--params "-C 1" \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3 \
--species human \
--label maq3-chr22 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3/%REPLICATE%/maq3-chr22-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3/maq3-chr22-loop.out

    
    Run time: 30:32:24
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:49AM, 21 November 2010
    ****************************************




</entry>



<entry [Fri Nov 19 14:19:47 EST 2010] RUN SAV.pl ON ALL AVAILABLE CUMULATIVE SNPs>



COMPLETED: ELAND, ELAND-2, BOWTIE, BOWTIE-RF (MISSING FILE 1)

RUNNING: MAQ, NOVOALIGN

ELAND       #### DONE
ELAND-2     #### DONE
BOWTIE      #### DONE. cumulative2 ALSO DONE (GOOD).
BOWTIE-rf   #### DONE BUT MISSING FILE 1 AGAIN
MAQ         #### RERUNNING AS cumulative2 (STARTED Fri Nov 12 13:52:57 EST 2010, (FILE 21 Mon Nov 15 01:01:05 EST 2010)
NOVOALIGN   #### RERUNNING AS cumulative2 (ONLY FIRST 12 FILES DONE)


OUTPUT FILES
------------


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22
ll */cumulative*/chr22/hit-1.sav

    -rw-rw-rw- 1 syoung root 1.6M Nov 19 13:38 bowtie/cumulative2/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 8.9M Nov  9 09:30 bowtie/cumulative/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.3M Nov 19 10:27 eland/cumulative/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.8M Nov 19 13:38 maq/cumulative2/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.9M Nov  5 05:17 maq/cumulative/chr22/hit-1.sav

ll */cumulative*/chr22/hit-1.sav

    -rw-rw-rw- 1 syoung root 1.6M Nov 19 13:38 bowtie/cumulative2/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 8.9M Nov  9 09:30 bowtie/cumulative/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.3M Nov 19 10:27 eland/cumulative/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.8M Nov 19 13:38 maq/cumulative2/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.9M Nov  5 05:17 maq/cumulative/chr22/hit-1.sav

[syoung@u01 chr22]$ ll */cumulative*/chr22/hit-10.sav

    -rw-rw-rw- 1 syoung root 8.1M Nov 19 13:41 bowtie/cumulative2/chr22/hit-10.sav
    -rw-rw-rw- 1 syoung root  21M Nov 11 02:26 bowtie/cumulative/chr22/hit-10.sav
    -rw-rw-rw- 1 syoung root 3.8M Nov 19 09:02 eland/cumulative/chr22/hit-10.sav

[syoung@u01 chr22]$ ll */cumulative*/chr22/hit-33.sav

    -rw-rw-rw- 1 syoung root 6.4M Nov 19 13:41 bowtie/cumulative2/chr22/hit-33.sav
    -rw-rw-rw- 1 syoung root  17M Nov  9 09:11 bowtie/cumulative/chr22/hit-33.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 08:33 eland/cumulative/chr22/hit-33.sav



RUN CUMULATIVE SAV.pl
---------------------



ELAND-2     RUNNING Fri Nov 19 03:48:20 EST 2010
-------

screen -S eland-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--replicates 1-33 \
--loop distributed \
--label eland-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/loop-sav.out


    Run time: 22:15:44
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:03AM, 20 November 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22
    
    -rw-rw-rw- 1 syoung root 1.3M Nov 19 10:27 hit-1.sav
    -rw-rw-rw- 1 syoung root 2.0M Nov 19 15:56 hit-2.sav
    -rw-rw-rw- 1 syoung root 2.5M Nov 19 20:56 hit-3.sav
    -rw-rw-rw- 1 syoung root 2.9M Nov 19 23:26 hit-4.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 20 00:41 hit-5.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 20 01:32 hit-6.sav
    -rw-rw-rw- 1 syoung root 3.6M Nov 20 02:03 hit-7.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 08:58 hit-8.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 09:01 hit-9.sav
    -rw-rw-rw- 1 syoung root 3.8M Nov 19 09:02 hit-10.sav
    -rw-rw-rw- 1 syoung root 3.8M Nov 19 09:02 hit-11.sav
    -rw-rw-rw- 1 syoung root 3.8M Nov 19 09:00 hit-12.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 08:59 hit-13.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 08:56 hit-14.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 08:54 hit-15.sav
    -rw-rw-rw- 1 syoung root 3.6M Nov 20 00:41 hit-16.sav
    -rw-rw-rw- 1 syoung root 3.6M Nov 20 00:30 hit-18.sav
    -rw-rw-rw- 1 syoung root 3.5M Nov 20 00:18 hit-19.sav
    -rw-rw-rw- 1 syoung root 3.5M Nov 20 00:09 hit-20.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 19 23:56 hit-21.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 19 23:47 hit-22.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 19 08:06 hit-23.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:04 hit-24.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:03 hit-25.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:02 hit-26.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:02 hit-27.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:00 hit-28.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 07:59 hit-29.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 07:58 hit-30.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 08:36 hit-31.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 08:34 hit-32.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 08:33 hit-33.sav


    OK


BOWTIE (CUMUL-2)
----------------

screen -S bowtie2-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2 \
--replicates 1-33 \
--loop distributed \
--label bowtie-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/loop-sav.out
    
    Run time: 24:00:36
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    3:50AM, 20 November 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
    
    -rw-rw-rw- 1 syoung root  20M Nov 20 03:50 hit-10.sav
    -rw-rw-rw- 1 syoung root  21M Nov 20 03:50 hit-11.sav
    -rw-rw-rw- 1 syoung root  21M Nov 20 03:49 hit-12.sav
    -rw-rw-rw- 1 syoung root  21M Nov 20 03:34 hit-13.sav
    -rw-rw-rw- 1 syoung root  21M Nov 20 03:34 hit-14.sav
    -rw-rw-rw- 1 syoung root  20M Nov 20 02:23 hit-15.sav
    -rw-rw-rw- 1 syoung root  20M Nov 20 02:03 hit-16.sav
    -rw-rw-rw- 1 syoung root  20M Nov 20 01:46 hit-17.sav
    -rw-rw-rw- 1 syoung root  20M Nov 20 01:26 hit-18.sav
    -rw-rw-rw- 1 syoung root 9.7M Nov 20 03:50 hit-19.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 20 03:50 hit-1.sav
    -rw-rw-rw- 1 syoung root 9.8M Nov 20 03:50 hit-20.sav
    -rw-rw-rw- 1 syoung root 9.9M Nov 20 03:50 hit-21.sav
    -rw-rw-rw- 1 syoung root 9.9M Nov 20 03:50 hit-22.sav
    -rw-rw-rw- 1 syoung root  10M Nov 20 03:50 hit-23.sav
    -rw-rw-rw- 1 syoung root  11M Nov 20 03:50 hit-24.sav
    -rw-rw-rw- 1 syoung root  11M Nov 20 03:50 hit-25.sav
    -rw-rw-rw- 1 syoung root  11M Nov 20 03:50 hit-26.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-27.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-28.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-29.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 20 03:50 hit-2.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-30.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-31.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-32.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-33.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 20 03:50 hit-3.sav
    -rw-rw-rw- 1 syoung root 3.9M Nov 20 03:50 hit-4.sav
    -rw-rw-rw- 1 syoung root 4.1M Nov 20 03:50 hit-5.sav
    -rw-rw-rw- 1 syoung root 4.3M Nov 20 03:50 hit-6.sav
    -rw-rw-rw- 1 syoung root 4.4M Nov 20 03:50 hit-7.sav
    -rw-rw-rw- 1 syoung root 4.5M Nov 20 03:50 hit-8.sav
    -rw-rw-rw- 1 syoung root 4.7M Nov 20 03:50 hit-9.sav




NOVOALIGN (CUMUL-2) FILES 1-12
------------------------------

screen -S novoalign-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--replicates 1-12 \
--loop distributed \
--label novoalign-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/loop-sav.out
    
    Run time: 00:01:08
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:01AM, 19 November 2010
    ****************************************



MAQ (CUMUL-2)
-------------

FIRST ROUND:

screen -S maq-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--replicates 1-12 \
--loop distributed \
--label maq-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/loop-sav.out



SECOND ROUND (CONCURRENT):

screen -S maq-sav2

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--replicates 13-33 \
--loop distributed \
--label maq-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/loop-sav.out
    
    Run time: 00:01:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:05AM, 19 November 2010
    ****************************************



BOWTIE-rf       PENDING (RE-RUNNING CUMULATIVE SNP   Fri Nov 19 10:07:37 EST 2010)
---------


    
    





</entry>



<entry [Fri Nov 12 13:40:10 EST 2010] MAQ snpFilter CRITERIA>




MAQ (Multiple Alignments with Qualities) produces a highly-filtered output file of SNP predictions called 'out.SNPfilter'. 

The file columns in the out.SNPfilter file are as follows:

{quote}
# Chromosome
# Position
# Reference base
# Consensus base
# Consensus quality
(A Phred-like quality value. Considered the key criterion for judging the reliability of a SNP.)
# Read depth
# Repetitive region
(Average number of hits of reads covering this position. Indicates whether the site falls in a repetitive region. If no read 
covering the site can be mapped with high mapping quality, the flanking region is possibly repetitive or in the lack of good 
reads. A SNP at such site is usually not reliable.)
# Highest mapping quality
(Highest mapping quality of the reads covering the position. Roughly gives the copy number of the flanking region in the 
reference genome. In most cases, this number approaches 1.00, which means the region is about unique. Sometimes you may see 
non-zero read depth but 0.00 at the 7th column. This indicates that all the reads covering the position have at least two 
mismatches. Maq only counts the number of 0- and 1-mismatch hits to the reference. This is due to a complex technical issue.)
# Min. flanking quality
(Minimum consensus quality in the 3bp flanking regions at each side of the site (6bp in total). This gives the neighbouring 
quality. Filtering on this column is also required to get reliable SNPs. This idea is inspired by NQS, although NQS is 
initially designed for a single read instead of a consensus.)
# Second best call
# Log likelihood ratio of the second best and the third best call 
# Third best call
{quote}



</entry>



<entry [Fri Nov 12 13:39:10 EST 2010] RERUN MAQ cumulativeSnp.pl AS cumulative2>




mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2

screen -S maq-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--species human \
--zipped gzip \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/cumulativeSnp.out

    
    RUNNING
    Fri Nov 12 13:52:57 EST 2010





mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2

screen -S maq-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--species human \
--zipped gzip \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/cumulativeSnp.out




</entry>



<entry [Fri Nov 12 13:39:10 EST 2010] RERUN BOWTIE-RF cumulativeSnp.pl AS cumulative2>



AFTER FAILED AT FILE 1:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative/chr22
    -rwxrwxrwx 1 syoung root 2.1K Nov  9 11:26 cumulativeSnp-chr22-1.sh
    -rw-rw-rw- 1 syoung root 2.6K Nov  9 11:27 cumulativeSnp-chr22-1-stdout.txt
    -rwxrwxrwx 1 syoung root 2.8K Nov  9 11:27 cumulativeSnp-chr22-2.sh
    -rw-rw-rw- 1 syoung root 2.1K Nov  9 11:33 cumulativeSnp-chr22-2-stdout.txt
    -rw-rw-rw- 1 syoung root    0 Nov  9 11:27 hit-1.filter
    -rw-rw-rw- 1 syoung root   36 Nov  9 11:27 hit-1.raw
    -rw-rw-rw- 1 syoung root    0 Nov  9 11:27 hit-1.snp
    -rw-rw-rw- 1 syoung root 9.4M Nov  9 11:33 hit-2.filter
    -rw-rw-rw- 1 syoung root  21M Nov  9 11:33 hit-2.raw
    -rw-rw-rw- 1 syoung root 5.3M Nov  9 11:33 hit-2.snp
    -rw-rw-rw- 1 syoung root 349M Nov  9 11:32 merged.bam
    -rw-rw-rw- 1 syoung root  56M Nov  9 11:27 merged.bam-1
    -rw-rw-rw- 1 syoung root 349M Nov  9 11:32 merged.bam-2
    -rw-rw-rw- 1 syoung root 355M Nov  9 11:29 merged.bam.temp


RUN cumulativeSnp.pl:

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2

screen -S bowtie-rf-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2 \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/cumulativeSnp.out

    
    RUNNING
    Fri Nov 12 13:44:26 EST 2010
    
    cumulativeSNP.pl    Run time: 19:05:40
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    8:50AM, 13 November 2010
    cumulativeSNP.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22
ll merged*

    MISSING FILE 1!

    -rw-rw-rw- 1 syoung root 299M Nov 12 15:39 merged.bam-2
    -rw-rw-rw- 1 syoung root 588M Nov 12 15:48 merged.bam-3
    -rw-rw-rw- 1 syoung root 686M Nov 12 15:57 merged.bam-4
    -rw-rw-rw- 1 syoung root 974M Nov 12 16:10 merged.bam-5
    -rw-rw-rw- 1 syoung root 1.3G Nov 12 16:27 merged.bam-6
    -rw-rw-rw- 1 syoung root 1.3G Nov 12 16:28 merged.bam-7
    -rw-rw-rw- 1 syoung root 1.6G Nov 12 16:49 merged.bam-8
    -rw-rw-rw- 1 syoung root 1.6G Nov 12 17:11 merged.bam-9
    -rw-rw-rw- 1 syoung root 1.9G Nov 12 17:35 merged.bam-10
    -rw-rw-rw- 1 syoung root 2.2G Nov 12 18:03 merged.bam-11
    -rw-rw-rw- 1 syoung root 2.4G Nov 12 18:36 merged.bam-12
    -rw-rw-rw- 1 syoung root 2.7G Nov 12 19:14 merged.bam-13
    -rw-rw-rw- 1 syoung root 3.0G Nov 12 19:55 merged.bam-14
    -rw-rw-rw- 1 syoung root 3.2G Nov 12 20:48 merged.bam-15
    -rw-rw-rw- 1 syoung root 3.5G Nov 12 21:46 merged.bam-16
    -rw-rw-rw- 1 syoung root 3.8G Nov 12 22:53 merged.bam-17
    -rw-rw-rw- 1 syoung root 780M Nov 12 23:30 merged.bam-18
    -rw-rw-rw- 1 syoung root 780M Nov 12 23:26 merged.bam-19
    -rw-rw-rw- 1 syoung root 1.1G Nov 13 03:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 1.4G Nov 13 03:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 1.4G Nov 13 04:00 merged.bam-23
    -rw-rw-rw- 1 syoung root 1.7G Nov 13 04:22 merged.bam-24
    -rw-rw-rw- 1 syoung root 1.2G Nov 13 04:48 merged.bam-25
    -rw-rw-rw- 1 syoung root 1.9G Nov 13 04:48 merged.bam-26
    -rw-rw-rw- 1 syoung root 2.2G Nov 13 05:19 merged.bam-27
    -rw-rw-rw- 1 syoung root 2.5G Nov 13 05:52 merged.bam-28
    -rw-rw-rw- 1 syoung root 2.8G Nov 13 06:31 merged.bam-29
    -rw-rw-rw- 1 syoung root 2.8G Nov 13 06:32 merged.bam-30
    -rw-rw-rw- 1 syoung root 3.0G Nov 13 07:12 merged.bam-31
    -rw-rw-rw- 1 syoung root 3.3G Nov 13 07:55 merged.bam-32
    -rw-rw-rw- 1 syoung root 3.6G Nov 13 08:42 merged.bam-33



CHECK STDOUT FOR FILE 1:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2

cat cumulativeSnp-chr22-1-stdout.txt

Sender: LSF System <lsfadmin@n0139.pegasus.edu>
Subject: Job 2294450: </scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/cumulativeSnp-chr22-1.sh> Done

Job </scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/cumulativeSnp-chr22-1.sh> was submitted from host <u03> by user <syoung> in cluster <lsfcluster>.
Job was executed on host(s) <n0139.pegasus.edu>, in queue <large>, as user <syoung> in cluster <lsfcluster>.
</nethome/syoung> was used as the home directory.
</scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22> was used as the working directory.
Started at Fri Nov 12 15:37:24 2010
Results reported at Fri Nov 12 15:37:28 2010

Your job looked like:

------------------------------------------------------------
# LSBATCH: User input
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/cumulativeSnp-chr22-1.sh
------------------------------------------------------------

Successfully completed.

Resource usage summary:

    CPU time   :      0.08 sec.
    Max Memory :         2 MB
    Max Swap   :        23 MB

    Max Processes  :         1
    Max Threads    :         1

The output (if any) follows:

LS_JOBID: 
LS_JOBPID:  15988
LSB_JOBINDEX:  0
LSB_JOBNAME:  /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/cumulativeSnp-chr22-1.sh
LSB_QUEUE:  large
LSFUSER:  syoung
LSB_JOB_EXECUSER:  syoung
HOSTNAME:  n0139.pegasus.edu
LSB_HOSTS:  n0139
LSB_ERRORFILE: 
LSB_JOBFILENAME:  /scratch/lsf_spool/1289587463.2294450
LD_LIBRARY_PATH:  /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib
[main_samview] fail to open file for reading.

real    0m0.145s
user    0m0.002s
sys     0m0.001s
cp: cannot stat `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.bam': No such file or directory

real    0m0.242s
user    0m0.000s
sys     0m0.005s
cp: cannot stat `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/merged.bam': No such file or directory

real    0m0.081s
user    0m0.001s
sys     0m0.003s
open: No such file or directory
[bam_pileup] fail to read the header: non-exisiting file or wrong format.





RE-RERUN BOWTIE-RF CUMULATIVE SNP:


screen -S bowtie-rf-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
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
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2 \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/cumulativeSnp.out



    RUNNING
    Fri Nov 19 10:07:37 EST 2010
    
    FINISHED
    cumulativeSNP.pl    Run time: 21:31:50
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    7:38AM, 20 November 2010
    cumulativeSNP.pl    ****************************************



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2
    
    -rw-rw-rw- 1 syoung root 1.1M Nov 19 10:07 merged-1.snp
    -rw-rw-rw- 1 syoung root 5.7M Nov 19 10:22 merged-2.snp
    -rw-rw-rw- 1 syoung root 7.9M Nov 19 10:41 merged-3.snp
    -rw-rw-rw- 1 syoung root 8.6M Nov 19 11:01 merged-4.snp
    -rw-rw-rw- 1 syoung root  11M Nov 19 11:24 merged-5.snp
    -rw-rw-rw- 1 syoung root  12M Nov 19 11:51 merged-6.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 12:21 merged-7.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 12:54 merged-8.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 13:28 merged-9.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 14:06 merged-10.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 14:47 merged-11.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 15:31 merged-12.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 16:18 merged-13.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 17:09 merged-14.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 18:05 merged-15.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 19:03 merged-16.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 20:05 merged-17.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 21:10 merged-18.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 22:19 merged-19.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 23:32 merged-20.snp
    -rw-rw-rw- 1 syoung root  13M Nov 20 00:48 merged-21.snp
    -rw-rw-rw- 1 syoung root  13M Nov 20 02:07 merged-22.snp
    -rw-rw-rw- 1 syoung root  13M Nov 20 03:30 merged-23.snp
    -rw-rw-rw- 1 syoung root  13M Nov 20 04:57 merged-24.snp
    -rw-rw-rw- 1 syoung root  12M Nov 20 06:27 merged-25.snp
    -rw-rw-rw- 1 syoung root  12M Nov 20 08:01 merged-26.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 06:40 merged-27.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 06:51 merged-28.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:02 merged-29.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:04 merged-30.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:15 merged-31.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:17 merged-32.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:28 merged-33.snp







</entry>



<entry [Fri Nov 12 13:39:10 EST 2010] RERUN cumulativeSnp.pl AS cumulative2>




mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2

screen -S bowtie-cum2

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
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2 \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/cumulativeSnp.out



    RUNNING
    Fri Nov 12 13:40:36 EST 2010
    
    cumulativeSNP.pl    Run time: 35:15:25
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    0:55AM, 14 November 2010
    cumulativeSNP.pl    ****************************************

    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
ll merged*

    -rw-r--r-- 1 syoung root 299M Nov 12 13:41 merged.bam-1
    -rw-rw-rw- 1 syoung root 588M Nov 12 13:50 merged.bam-2
    -rw-rw-rw- 1 syoung root 875M Nov 12 15:49 merged.bam-3
    -rw-rw-rw- 1 syoung root 1.2G Nov 12 16:04 merged.bam-4
    -rw-rw-rw- 1 syoung root 1.5G Nov 12 16:23 merged.bam-5
    -rw-rw-rw- 1 syoung root 1.7G Nov 12 16:46 merged.bam-6
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 17:14 merged.bam-7
    -rw-rw-rw- 1 syoung root 2.3G Nov 12 17:45 merged.bam-8
    -rw-rw-rw- 1 syoung root 2.6G Nov 12 18:21 merged.bam-9
    -rw-rw-rw- 1 syoung root 2.8G Nov 12 18:57 merged.bam-10
    -rw-rw-rw- 1 syoung root 3.1G Nov 12 19:37 merged.bam-11
    -rw-rw-rw- 1 syoung root 3.4G Nov 12 20:23 merged.bam-12
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 21:17 merged.bam-13
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 21:17 merged.bam-14
    -rw-rw-rw- 1 syoung root 3.9G Nov 12 22:12 merged.bam-15
    -rw-rw-rw- 1 syoung root 4.2G Nov 12 23:11 merged.bam-16
    -rw-rw-rw- 1 syoung root 4.5G Nov 13 00:15 merged.bam-17
    -rw-rw-rw- 1 syoung root 4.7G Nov 13 01:17 merged.bam-18
    -rw-rw-rw- 1 syoung root 5.0G Nov 13 02:21 merged.bam-19
    -rw-rw-rw- 1 syoung root 5.3G Nov 13 03:28 merged.bam-20
    -rw-rw-rw- 1 syoung root 5.5G Nov 13 04:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 5.8G Nov 13 05:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 6.1G Nov 13 07:18 merged.bam-23
    -rw-rw-rw- 1 syoung root 6.3G Nov 13 08:42 merged.bam-24
    -rw-rw-rw- 1 syoung root 6.6G Nov 13 10:08 merged.bam-25
    -rw-rw-rw- 1 syoung root 6.9G Nov 13 11:39 merged.bam-26
    -rw-rw-rw- 1 syoung root 7.1G Nov 13 13:11 merged.bam-27
    -rw-rw-rw- 1 syoung root 7.4G Nov 13 14:47 merged.bam-28
    -rw-rw-rw- 1 syoung root 7.7G Nov 13 16:27 merged.bam-29
    -rw-rw-rw- 1 syoung root 7.9G Nov 13 18:13 merged.bam-30
    -rw-rw-rw- 1 syoung root 8.2G Nov 13 20:07 merged.bam-31
    -rw-rw-rw- 1 syoung root 8.5G Nov 13 22:38 merged.bam-32
    -rw-rw-rw- 1 syoung root 8.8G Nov 14 00:34 merged.bam-33




</entry>



<entry [Tue Nov  9 15:56:35 EST 2010] RUN indexReads.pl ON NOVOALIGN, MAQ AND ELAND>




NOVOALIGN
---------


INPUT FILES

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22
ll *sam

    -rw-rw-r-- 1 syoung root 86M Nov  4 11:00 hit.r-all-1.sam
    -rw-rw-rw- 1 syoung root 19M Nov  4 15:49 hit.sam
    -rw-rw-rw- 1 syoung root 51M Nov  4 15:49 miss.sam
    -rw-rw-r-- 1 syoung root 69M Nov  4 15:47 out.sam

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1
ll out.sam

    -rw-rw-r-- 1 syoung root 308M Nov  3 17:13 out.sam


CONVERT out.sam INTO hit.sam

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samHits.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/out.sam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam \
--missfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/miss.sam
    

hit.sam FILE TOTAL HITS: 425926

lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam
    
    hit.sam: 425926



LOAD INDEX FILES FOR OLD hit.sam FILE AND NEW hit.r-all-1.sam FILES:


time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.r-all-1.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.r-all-1.sam.db

    IndexRead::buildIndex   VALUES:
    IndexRead::buildIndex   SRR002271.10000002:3:54:798:123#0/1 -> chr22,40243183,163
    IndexRead::buildIndex   SRR002271.10000002:3:54:798:123#0/2 -> chr22,40243375,83
    ...
    IndexReads::count of keys: 425926
    
    real    0m23.716s
    user    0m22.396s
    sys     0m0.489s

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam.db
    

    IndexReads::indexFile    Finished processing inputfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam
    IndexRead::buildIndex   SRR002271.1000262:1:49:603:315#0/0 -> chr22,16212682,101
    IndexRead::buildIndex   SRR002271.1000262:1:49:603:315#0/1 -> chr22,16212682,153
    ...
    IndexReads::count of keys: 93552
    IndexRead::buildIndex    Completed
    
    real    0m5.384s
    user    0m5.045s
    sys     0m0.121s


OUTPUT FILES:

ll *db
    
    -rw-rw-rw- 1 syoung root 51M Nov  9 13:39 hit.r-all-1.sam.db
    -rw-rw-rw- 1 syoung root 12M Nov  9 13:31 hit.sam.db




NO READS HAVE MULTIPLE HITS BECAUSE NUMBER OF (UNIQUE) READ ID KEYS IS THE SAME
AS THE NUMBER OF INPUT READS:



time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.r-all-1.sam.db

    IndexRead::numberReads    Printing sample entries
    SRR002271.10000002:3:54:798:123#0/1  -> chr22,40243183,163
    SRR002271.10000002:3:54:798:123#0/2  -> chr22,40243375,83
    ...
    IndexRead::numberReads    counter: 425926
    
    real    0m3.930s
    user    0m3.406s
    sys     0m0.317s



time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam.db
    
    93552
    
    real    0m0.895s
    user    0m0.681s
    sys     0m0.152s






MAQ
---


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq


MAQ  **** DID NOT LOAD -- RERUN THIS MANUALLY TO CHECK LOADING
---

1. LOOP THROUGH ALL MAQ (3.3 BILLION READS) VS chr22 hit.sam FILES (3.9GB EACH)

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/indexes
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/indexes

screen -S maq-indexreads

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


    4 HOURS
    
RUNNING
Wed Nov  3 14:20:31 EDT 2010

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.db
    
    -rw-rw-rw- 1 syoung root 311M Nov  3 17:15 10/chr22/hit.db
    -rw-rw-rw- 1 syoung root 383M Nov  3 17:15 11/chr22/hit.db
    -rw-rw-rw- 1 syoung root 315M Nov  3 17:15 12/chr22/hit.db





ELAND
-----



/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/2000bp/autogenome/1/eland/chr1/hit.db 

IndexRead::numberReads    Printing sample entries
SRR005718.10000031:2:309:340:271/1  -> chr1,218932313,161
SRR005718.10000031:2:309:340:271/2  -> chr1,218932660,81
SRR005718.10000056:2:309:267:727/1  -> chr1,79992964,73
SRR005718.10000063:2:309:787:700/1  -> chr1,175441376,73
...
memory usage BEFORE counter:
  RSS    VSZ
1758456 1915536

IndexRead::numberReads    counter: 8553206
memory usage @ counter:
  RSS    VSZ
1758460 1915536

Elapsed time: 31736 milliseconds
8553206




TESTS
-----


indexVenn.pl
------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db

NB: DUPLICATE KEY:

SRR005734.15335768:6:14:197:412#0

LINE 100:

    SRR005734.15335768:6:14:197:412#0       147     chr22   16113947        255     36M     =       16114060        148     TGTCTCTACTAAAAA\
TACAAAAATTAGCCAGGAGTG    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:0C31C3     NM:i:2

LINE 200:
    
    SRR005734.15335768:6:14:197:412#0       147     chr22   16113948        255     36M     =       16114060        148     TGTCTCTACTAAAAA\
TACAAAAATTAGCCAGGAGTG    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:0C31C3     NM:i:2



/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22 \
--querylabel hit-100 \
--targetlabel hit-200



    Target does not contain key: SRR005735.10209055:2:56:577:1311#0/1       chr22,16051962,163
    IndexRead::getReads    dups:
    $VAR1 = 0;



/nethome/bioinfo/apps/agua/0.5/bin/apps/index/getReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db \
--readname SRR005735.10209055:2:56:577:1311#0/1 



/nethome/bioinfo/apps/agua/0.5/bin/apps/index/getReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db


--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-double-dups.db



mergeIndexes.pl
---------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/mergeIndexes.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-double-dups.db

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-double-dups.db




cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/mergeIndexes.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100-200.db

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100-200.db


/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db




indexReads.pl
-------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db

    OK!
    

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db




/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db


lookupReads.pl
--------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/lookupRead.pl --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db --readname SRR005734.15335768:6:14:197:412#0/1 --mode count

    IndexRead::lookupRead    readname: SRR005734.15335768:6:14:197:412#0/1
    IndexRead::lookupRead    dbfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db
    IndexRead::lookupRead   readname SRR005734.15335768:6:14:197:412#0/1 entries: chr22,16113947,147
    IndexRead::lookupRead   scalar = get_dup(SRR005734.15335768:6:14:197:412#0/1, 1)
    2


/nethome/bioinfo/apps/agua/0.5/bin/apps/index/lookupRead.pl --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db --readname SRR005734.15335768:6:14:197:412#0/1 --mode array

    IndexRead::lookupRead    readname: SRR005734.15335768:6:14:197:412#0/1
    IndexRead::lookupRead    dbfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db
    IndexRead::lookupRead   readname SRR005734.15335768:6:14:197:412#0/1 entries: chr22,16113947,147
    IndexRead::lookupRead   array = get_dup(SRR005734.15335768:6:14:197:412#0/1):
    
    chr22,16113947,147
    chr22,16113948,147


/nethome/bioinfo/apps/agua/0.5/bin/apps/index/lookupRead.pl --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db --readname SRR005734.15335768:6:14:197:412#0/1 --mode hash

    IndexRead::lookupRead    readname: SRR005734.15335768:6:14:197:412#0/1
    IndexRead::lookupRead    dbfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db
    IndexRead::lookupRead   readname SRR005734.15335768:6:14:197:412#0/1 entries: chr22,16113947,147
    IndexRead::lookupRead   hash = get_dup(SRR005734.15335768:6:14:197:412#0/1, 1):
    
    $VAR1 = {
              'chr22,16113947,147' => 1,
              'chr22,16113948,147' => 1
            };



numberReads.pl
--------------

time /nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db
    
    1
    
    real    0m0.124s
    user    0m0.103s
    sys     0m0.019s



time /nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit.db

    256562
    
    real    0m1.690s
    user    0m1.593s
    sys     0m0.086s








</entry>




