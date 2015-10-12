
<entry [Mon Dec 13 01:57:14 EST 2010] RUN snpVenn.pl ON ALL dbSNP SAMPLES>




ELAND vs MAQ
------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-maq

screen -S elandmaq-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-maq \
--replicates 1-33 \
--loop distributed \
--label elandmaq-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel maq-%REPLICATE%-dbsnp \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-maq \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-maq/elandmaq-snpvenn.out
    

ELAND vs BOWTIE
---------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie

screen -S elandbowtie-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie \
--replicates 1-33 \
--loop distributed \
--label elandbowtie-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel bowtie-%REPLICATE%-dbsnp \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie/elandbowtie-snpvenn.out

    Run time: 00:37:40
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:48AM, 13 December 2010
    ****************************************



ELAND vs BOWTIE-RF
------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie-rf

screen -S elandbowtie-rf-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie-rf \
--replicates 1-33 \
--loop distributed \
--label elandbowtie-rf-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/eland-%REPLICATE%-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/bowtie-%REPLICATE%-dbsnp.sav \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel bowtie-rf-%REPLICATE%-dbsnp \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie-rf \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie-rf/elandbowtie-rf-snpvenn.out



ELAND v NOVOALIGN
-----------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-novoalign

screen -S elandnovo-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-novoalign \
--replicates 1-33 \
--loop distributed \
--label elandnovoalign-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel novoalign-%REPLICATE%-dbsnp \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-novoalign \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-novoalign/elandnovoalign-snpvenn.out
    
    Run time: 00:19:44
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:31AM, 13 December 2010
    ****************************************
    

BOWTIE v NOVOALIGN
------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/bowtie-novoalign

screen -S bowtienovo-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/bowtie-novoalign \
--replicates 1-33 \
--loop distributed \
--label bowtienovoalign-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--querylabel bowtie-%REPLICATE%-dbsnp \
--targetlabel novoalign-%REPLICATE%-dbsnp \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/bowtie-novoalign \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/bowtie-novoalign/bowtienovoalign-snpvenn.out

    Run time: 01:01:43
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    12:13AM, 13 December 2010
    ****************************************


ELAND
-----

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/sav-dbsnp \
--replicates 1-33 \
--loop distributed \
--label eland-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-33-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/sav-dbsnp \
--querylabel eland-33-dbsnp \
--targetlabel eland-%REPLICATE%-dbsnp \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/sav-dbsnp/vennsav.out

    Run time: 00:09:53
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:06AM, 13 December 2010
    ****************************************
    

BOWTIE
------

u03
mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp

screen -S bowtie-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp \
--replicates 1-33 \
--loop distributed \
--label bowtie-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-33-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp \
--querylabel bowtie-33-dbsnp \
--targetlabel bowtie-%REPLICATE%-dbsnp \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp/vennsav.out

    Run time: 01:41:38
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:48AM, 13 December 2010
    ****************************************
    
    #snpVenn.pl    Run time: 01:04:13
    #snpVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl
    #snpVenn.pl    11:11AM, 13 December 2010
    #snpVenn.pl    ****************************************



NOVOALIGN
---------
uo3

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp

screen -S novo-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp \
--replicates 1-33 \
--loop distributed \
--label novoalign-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-33-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp \
--querylabel novoalign-33-dbsnp \
--targetlabel novoalign-%REPLICATE%-dbsnp \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp/vennsav.out
    
    Run time: 00:34:47
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:41AM, 13 December 2010
    ****************************************




</entry>



<entry [Mon Dec 13 01:24:22 EST 2010] CONVERT *sav FILES TO *dbsnp.sav FOR ALL SAMPLES>




ELAND
-----
/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnFilter.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--column 11 \
--operator regex \
--threshold "^rs"
    
    Run time: 00:00:34
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:48AM, 13 December 2010
    ****************************************

BOWTIE
------
/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnFilter.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--column 11 \
--operator regex \
--threshold "^rs"

    Run time: 00:00:34
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:49AM, 13 December 2010
    ****************************************


BOWTIE
------
/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnFilter.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--column 11 \
--operator regex \
--threshold "^rs"

    Run time: 00:00:34
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:49AM, 13 December 2010
    ****************************************


BOWTIE-RF
---------
/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnFilter.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--column 11 \
--operator regex \
--threshold "^rs"
    
    Run time: 00:00:34
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    12:40AM, 13 December 2010
    ****************************************


NOVOALIGN
---------
/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnFilter.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--column 11 \
--operator regex \
--threshold "^rs"

    Run time: 00:00:34
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:54AM, 13 December 2010
    ****************************************





</entry>



<entry [Wed Dec  8 14:37:12 EST 2010] RERUN ELAND ON chrX AND COMPARE SNPS WITH Bentley PAPER>




Bentley et al. PREDICTED 92,500 SNPs:

    We identified 92,485 candidate SNPs in the X chromosome using
    ELAND (Supplementary Fig. 6). Most calls (85%) match previous
    entries in the public database dbSNP. Heterozygosity (p) in this data
    set is 4.331024 (that is, one substitution per 2.3 kb), close to a
    previously published X chromosome estimate (4.731024)12. Using
    MAQwe obtained 104,567 SNPs, most of which were common to the
    results of the ELAND analysis. The differences between the two sets of
    SNP calls are largely the consequence of different properties of the
    alignments as described earlier. For example, most of the SNPs found
    only by the MAQ-based analysis were at positions of low or zero
    sequence depth in the ELAND alignment (Supplementary Fig. 6c).


Bentley et al. AVERAGE READ DEPTH IS 43X

    We obtained comprehensive coverage of the X chromosome from
    both analyses. With MAQ, 204 million reads aligned to 99.94% of the
    X chromosome at an average depth of 43X. With ELAND, 192 million
    reads covered 91% of the reference sequence, showing what can
    be covered by unique best alignments. These results were obtained
    after excluding reads aligning to non-X sequence (impurities of flow
    sorting) and apparently duplicated read pairs (Supplementary Table 2).
    We reasoned that these duplicates (,10% of the total) arose during
    initial sample amplification.

    The sampling of sequence fragments from the X chromosome is
    close to random. This is evident from the distribution of mapped
    read depth in the MAQ alignment in regions where the reference is
    unique (Fig. 2a): the variance of this distribution is only 2.26 times
    that of a Poisson distribution (the theoretical minimum). Half of this
    excess variance can be accounted for by a dependence on GC content.
    However, the average mapped read depth only falls below 10X
    in regions with G1C content less than 4% or greater than 76%,
    comprising in total just 1% of unique chromosome sequence and
    3% of coding sequence (Fig. 2b).


ELAND.pl
------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX

screen -S elandX

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/ELAND.pl \
--replicates 1-33 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chrX \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/%REPLICATE% \
--inputtype fastq \
--species human \
--label elandX-200bp-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue small \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/%REPLICATE%/elandX-200bp-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/elandX.1-33.loop.out
        
    Run time: 28:11:29
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    3:40PM, 11 December 2010
    ****************************************
    
    
u01 screen MOVING TO  /ngs/bioinfo
Mon Dec 13 15:50:44 EST 2010



[syoung@u01 ~]$ date
Fri Dec 10 20:08:30 EST 201
    
tail /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/elandX.1-33.loop.out

    Loop::run    CONCURRENT: /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/ELAND.pl "--inputfiles" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-33.reads_1.sequence.txt" "--matefiles" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-33.reads_2.sequence.txt" "--referencedir" "/nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chrX" "--outputdir" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/33" "--inputtype" "fastq" "--species" "human" "--label" "elandX-200bp-33" "--maxjobs" "1000" "--walltime" "24" "--queue" "small" "--cluster" "LSF" "--cpus" "1" "--reads" "1000000" "--stdout" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/33/elandX-200bp-33.out"
    LSF daemon (LIM) not responding ... still trying
    


CHECKED IN FOLDER TO VERIFY THAT THE JOBS ARE INDEED FINISHED (I.E., NO MORE WRITING TO DISK GOING ON):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX
ll -tr

    ...
    drwxrwxrwx  2 syoung root  479 Dec 10 15:49 4
    drwxrwxrwx  2 syoung root  479 Dec 10 15:49 6
    drwxrwxrwx  2 syoung root  479 Dec 10 15:49 7
    drwxrwxrwx  2 syoung root  479 Dec 10 15:49 8


MAIN STDOUT FILE LAST WRITTEN TO AT 4:26PM:


ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/elandX.1-33.loop.out

    -rw-rw-r-- 1 syoung root 28K Dec 10 16:26 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/elandX.1-33.loop.out


CURRENT STATE OF THE QUEUE (TWO HOURS AFTER THE LAST JOB ENDED):


QUEUE_NAME      PRIO STATUS          MAX JL/U JL/P JL/H NJOBS  PEND   RUN  SUSP 
debug           200  Open:Active       -    -    -    -     0     0     0     0
small           100  Open:Active       -    -    -    -   714   128   586     0
medium           90  Open:Active       -    -    -    -     0     0     0     0
large            80  Open:Active       -    -    -    -     0     0     0     0
xlarge           70  Open:Active       -    -    -    -     0     0     0     0
longrun          60  Open:Active       -    -    -    -     0     0     0     0
ngs              60  Open:Active       -    -    -    -     0     0     0     0
amd              60  Open:Active       -    -    -    -   510     0   510     0
eris             60  Open:Active       -    -    -    -     0     0     0     0
hermes           60  Open:Active       -    -    -    -     2     0     2     0
atlas            60  Open:Active       -    -    -    -     0     0     0     0
resv             60  Open:Active       -    -    -    -     0     0     0     0

Fri Dec 10 19:45:40 EST 2010
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



CHECKED THE STDOUT FILES FOR THE INDIVIDUAL ALIGNMENT JOBS AND FOUND THAT THE STDOUT FILE FOR FILE 19 IS CURTAILED:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/19
[syoung@u01 19]$ em elandX-200bp-19.out


    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl \
    --input-type fastq \
    --eland-genome /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chrX/chrX \
    --input-file /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/\
    19/$LSB_JOBINDEX/elandX-200bp-19_1.$LSB_JOBINDEX.txt \
    --input-file /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/\
    19/$LSB_JOBINDEX/elandX-200bp-19_2.$LSB_JOBINDEX.txt \
    
    
    Eland::doBatchAlignment    No. jobs: 1
    Cluster::runJobs    Running 1 jobs
    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/\
    200bp/chr22/elandX/19/chrX/ELAND-chrX.sh
    Job <2342851> is submitted to queue <small>.



NOTE THAT SEVERAL OF THE 50 JOBS FOR INPUT FILE 19 SEEM TO HAVE FAILED:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/19/chrX

[syoung@u01 chrX]$ ll
total 1.2M
drwxrwxrwx 52 syoung root  614 Dec 10 14:55 .
drwxrwxrwx 53 syoung root  657 Dec 10 14:55 ..
drwxrwxrwx  2 syoung root  479 Dec 10 15:25 1
drwxrwxrwx  2 syoung root  479 Dec 10 15:27 10
drwxrwxrwx  2 syoung root  479 Dec 10 15:27 11
drwxrwxrwx  2 syoung root  479 Dec 10 15:27 12
drwxrwxrwx  2 syoung root  479 Dec 10 15:27 13
drwxrwxrwx  2 syoung root  479 Dec 10 15:27 14
drwxrwxrwx  2 syoung root  479 Dec 10 15:27 15
drwxrwxrwx  2 syoung root  479 Dec 10 15:27 16
drwxrwxrwx  2 syoung root    0 Dec 10 14:55 17
drwxrwxrwx  2 syoung root    0 Dec 10 14:55 18
drwxrwxrwx  2 syoung root    0 Dec 10 14:55 19
drwxrwxrwx  2 syoung root  479 Dec 10 15:39 2
drwxrwxrwx  2 syoung root    0 Dec 10 14:55 20
drwxrwxrwx  2 syoung root    0 Dec 10 14:55 21
drwxrwxrwx  2 syoung root    0 Dec 10 14:55 22
drwxrwxrwx  2 syoung root    0 Dec 10 14:55 23
drwxrwxrwx  2 syoung root    0 Dec 10 14:55 24
drwxrwxrwx  2 syoung root  479 Dec 10 15:21 25
drwxrwxrwx  2 syoung root  479 Dec 10 15:21 26
drwxrwxrwx  2 syoung root  479 Dec 10 15:19 27
drwxrwxrwx  2 syoung root  479 Dec 10 15:21 28
drwxrwxrwx  2 syoung root  479 Dec 10 15:23 29
drwxrwxrwx  2 syoung root  479 Dec 10 15:39 3
drwxrwxrwx  2 syoung root  479 Dec 10 15:23 30
drwxrwxrwx  2 syoung root  479 Dec 10 15:23 31
drwxrwxrwx  2 syoung root  479 Dec 10 15:23 32
drwxrwxrwx  2 syoung root  479 Dec 10 15:21 33
drwxrwxrwx  2 syoung root  479 Dec 10 15:21 34
drwxrwxrwx  2 syoung root  479 Dec 10 15:30 35
drwxrwxrwx  2 syoung root  479 Dec 10 15:25 36
drwxrwxrwx  2 syoung root  479 Dec 10 15:30 37
drwxrwxrwx  2 syoung root  479 Dec 10 15:30 38
drwxrwxrwx  2 syoung root  479 Dec 10 15:30 39
drwxrwxrwx  2 syoung root  479 Dec 10 15:49 4
drwxrwxrwx  2 syoung root  479 Dec 10 15:30 40
drwxrwxrwx  2 syoung root  479 Dec 10 15:14 41
drwxrwxrwx  2 syoung root  479 Dec 10 15:15 42
drwxrwxrwx  2 syoung root  479 Dec 10 15:15 43
drwxrwxrwx  2 syoung root  479 Dec 10 15:15 44
drwxrwxrwx  2 syoung root  479 Dec 10 15:15 45
drwxrwxrwx  2 syoung root  479 Dec 10 15:19 46
drwxrwxrwx  2 syoung root  479 Dec 10 15:20 47
drwxrwxrwx  2 syoung root  479 Dec 10 15:20 48
drwxrwxrwx  2 syoung root  479 Dec 10 15:20 49
drwxrwxrwx  2 syoung root  479 Dec 10 15:39 5
drwxrwxrwx  2 syoung root  479 Dec 10 15:17 50
drwxrwxrwx  2 syoung root  479 Dec 10 15:49 6
drwxrwxrwx  2 syoung root  479 Dec 10 15:49 7
drwxrwxrwx  2 syoung root  479 Dec 10 15:49 8
drwxrwxrwx  2 syoung root  479 Dec 10 15:27 9
-rwxrwxrwx  1 syoung root 2.7K Dec 10 14:55 ELAND-chrX.sh


E.G., SUBDIRECTORY 20 IS EMPTY AND THERE IS NO ERROR OUTPUT:

[syoung@u01 chrX]$ ll 20
total 27K
drwxrwxrwx  2 syoung root   0 Dec 10 14:55 .
drwxrwxrwx 52 syoung root 614 Dec 10 14:55 ..


... COMPARED TO WHAT IS EXPECTED:


[syoung@u01 chrX]$ ll 25
total 1.2G
drwxrwxrwx  2 syoung root  479 Dec 10 15:21 .
drwxrwxrwx 52 syoung root  614 Dec 10 14:55 ..
-rw-rw-rw-  1 syoung root  33K Dec 10 15:21 ELAND-chrX-stdout.txt
-rw-rw-rw-  1 syoung root  45M Dec 10 15:18 reanalysis_1_calsaf.txt
-rw-rw-rw-  1 syoung root  87M Dec 10 15:05 reanalysis_1_eland_extended.txt
-rw-rw-rw-  1 syoung root  75M Dec 10 14:58 reanalysis_1_eland_query.txt
-rw-rw-rw-  1 syoung root 122M Dec 10 15:19 reanalysis_1_export.txt
-rw-rw-rw-  1 syoung root 108M Dec 10 14:56 reanalysis_1_qseq.txt
-rw-rw-rw-  1 syoung root  44M Dec 10 15:18 reanalysis_2_calsaf.txt
-rw-rw-rw-  1 syoung root  87M Dec 10 15:14 reanalysis_2_eland_extended.txt
-rw-rw-rw-  1 syoung root  75M Dec 10 15:08 reanalysis_2_eland_query.txt
-rw-rw-rw-  1 syoung root 121M Dec 10 15:21 reanalysis_2_export.txt
-rw-rw-rw-  1 syoung root 108M Dec 10 15:06 reanalysis_2_qseq.txt
-rw-rw-rw-  1 syoung root 199M Dec 10 15:18 reanalysis_anomaly.txt
-rw-rw-rw-  1 syoung root   56 Dec 10 15:14 reanalysis_genomesize.xml
-rw-rw-rw-  1 syoung root 7.5K Dec 10 15:18 reanalysis_pair.xml








ALL elandX OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX
ls -altrh */chrX/hit.bam

    -rw-rw-rw- 1 syoung root 1283434145 Dec  8 19:46 4/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283732283 Dec  8 19:53 23/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1282989784 Dec  8 19:58 31/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283635072 Dec  8 19:58 2/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283391388 Dec  8 19:58 27/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283173265 Dec  8 19:58 22/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283623952 Dec  8 20:00 16/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283441961 Dec  8 20:00 17/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283176319 Dec  8 20:00 14/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283152953 Dec  8 20:00 20/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283319672 Dec  8 20:01 28/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283760526 Dec  8 20:01 9/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283381339 Dec  8 20:02 8/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283209088 Dec  8 20:02 19/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283334106 Dec  8 20:02 11/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1282707213 Dec  8 20:03 1/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283225241 Dec  8 20:03 26/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283062919 Dec  8 20:03 7/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1282820263 Dec  8 20:04 32/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283185403 Dec  8 20:04 3/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283222693 Dec  8 20:05 18/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283481710 Dec  8 20:08 5/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283360674 Dec  8 20:08 21/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283442579 Dec  8 20:08 25/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283508143 Dec  8 20:09 12/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283471769 Dec  8 20:13 13/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283069634 Dec  8 20:15 10/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283418340 Dec  8 20:16 15/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283195293 Dec  8 20:20 6/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283086973 Dec  8 20:21 30/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283915903 Dec  8 20:21 24/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283054222 Dec  8 20:21 29/chrX/hit.bam
    -rw-rw-rw- 1 syoung root 1283918418 Dec  8 20:22 33/chrX/hit.bam




INDEX 1/chrX/hit.bam AND GET NUMBER OF UNIQUE READS
---------------------------------------------------

BIN hit.bam INTO 2,500,000 BASE CHUNKS



screen -S index-eland



time /nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/1/chrX/hit.bam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/1/chrX/hit.bam.db



    RUNNING Fri Dec 10 10:49:58 EST 2010



/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chrX/eland/1/chrX/hit.bam



binBam.pl
---------

screen -S eland-binbam

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/1,\
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
--binlevel 2500000 \
--reference chrX \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/binbam.out

    binBam.pl    Run time: 00:02:47
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    0:24AM, 10 December 2010
    binBam.pl    ****************************************


##binBam.pl    Run time: 00:17:27
##binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
##binBam.pl    9:06PM, 9 December 2010
##binBam.pl    ****************************************


OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/33/chrX/bins

    -rw-rw-rw-  1 syoung root  73M Dec 10 00:23 hit.binlevel2500000.num10.bam
    -rw-rw-rw-  1 syoung root 100M Dec 10 00:23 hit.binlevel2500000.num11.bam
    -rw-rw-rw-  1 syoung root  82M Dec 10 00:23 hit.binlevel2500000.num12.bam
    -rw-rw-rw-  1 syoung root 102M Dec 10 00:23 hit.binlevel2500000.num13.bam
    -rw-rw-rw-  1 syoung root 115M Dec 10 00:23 hit.binlevel2500000.num14.bam
    -rw-rw-rw-  1 syoung root  72M Dec 10 00:23 hit.binlevel2500000.num15.bam
    -rw-rw-rw-  1 syoung root  83M Dec 10 00:23 hit.binlevel2500000.num16.bam
    -rw-rw-rw-  1 syoung root  78M Dec 10 00:24 hit.binlevel2500000.num17.bam
    -rw-rw-rw-  1 syoung root  62M Dec 10 00:23 hit.binlevel2500000.num18.bam
    -rw-rw-rw-  1 syoung root  52M Dec 10 00:24 hit.binlevel2500000.num19.bam
    -rw-rw-rw-  1 syoung root  50M Dec 10 00:24 hit.binlevel2500000.num20.bam
    -rw-rw-rw-  1 syoung root  56M Dec 10 00:23 hit.binlevel2500000.num6.bam
    -rw-rw-rw-  1 syoung root 163M Dec 10 00:24 hit.binlevel2500000.num7.bam
    -rw-rw-rw-  1 syoung root  60M Dec 10 00:23 hit.binlevel2500000.num8.bam
    -rw-rw-rw-  1 syoung root  84M Dec 10 00:24 hit.binlevel2500000.num9.bam
    -rw-rw-rw-  1 syoung root 198M Dec  9 21:05 hit.binlevel2.num10.bam
    -rw-rw-rw-  1 syoung root 240M Dec  9 21:05 hit.binlevel2.num11.bam
    -rw-rw-rw-  1 syoung root 337M Dec  9 21:06 hit.binlevel2.num12.bam
    -rw-rw-rw-  1 syoung root 275M Dec  9 21:06 hit.binlevel2.num13.bam
    -rw-rw-rw-  1 syoung root 177M Dec  9 21:05 hit.binlevel2.num14.bam



cumulativeSnp.pl AND snpVenn.pl                  
-------------------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3

screen -S eland-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--binlevel 2500000 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/1,\
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
--maxjobs 1000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3/cumulative3.binlevel2.out

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3



/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2500000 \
--replicates 1-33 \
--loop parallel \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/%REPLICATE% \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative4 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative4/snp130-%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chrX \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl \
--binlevel 2500000 \
--suffix sav \
--filename hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3 \
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
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3/unbin.out
    

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3/chrX/venn/sav \
--replicates 1-33 \
--loop distributed \
--label eland-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3/chrX/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3/chrX/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3/chrX/venn/sav \
--querylabel eland-33 \
--targetlabel eland-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/cumulative3/chrX/venn/sav/vennsav.out




</entry>



<entry [Wed Dec  8 13:58:50 EST 2010] TO DO LIST>



##############
#### ONWORKING
##############

dbSnp.pl            FILTER dbSNP-ONLY SNPs INTO NEW FILES AND DO snpVenn.pl

** MAQ: RUN indexReads.pl --> numberReads.pl ON MAQ ALIGNMENT FILES
    TO VERIFY MAQ PRODUCES A SINGLE UNIQUE READ FOR EACH HIT

** RUN WORKFLOW ON chrX

** RUN MAQ ON BOWTIE PAPER DATA SET (ELAND WORKED OKAY) TO VERIFY ALIGNMENTS

** DOCUMENT SCRIPTS ** on Wiki

** RUN SAV.pl ON ALL REALIGNED SAMPLES

indexVenn.pl        COMPARE DB FILES GENERATED FROM *bam FILES

snpReadVenn.pl      COMPARE READS IN SNP REGIONS

mergeIndexes.pl     MERGE ALL INDEX DB FILES INTO A SINGLE FILE



##############
#### COMPLETED
##############

VENN.pl    VENN ANALYSIS OF BINNED SNP DATA

ELANDcheck.pl       |   CHECK ALIGNMENT OUTPUT FILES - SIGNAL 'completed: 0' IF MISSING
BOWTIEcheck.pl      |   OR OUTSIDE GIVEN DEVIATION RANGE
NOVOALIGNcheck.pl   |
MAQcheck.pl         |


#### DONE Wed Dec  8 12:25:28 EST 2010
collateVenn.pl      COLLATE RESULTS OF snpVenn.pl INTO REPORT

#### DONE Fri Dec  3 13:58:18 EST 2010
createIntervals.pl CREATE INTERVALS AROUND SNPS AS INPUT FOR GATK Realign

#### DONE Fri Dec  3 13:58:18 EST 2010
realignBam.pl      LOCAL REALIGNMENT AROUND SNPS USING GATK     

    DE NOVO SNPS (VELVET, LOCAL REALIGNMENT) vs 3.3 billion read-depth SNPs
    http://www.broadinstitute.org/gsa/wiki/index.php/Local_realignment_around_indels
    
    LOCAL REALIGNMENT WITH GATK
    http://sourceforge.net/apps/mediawiki/samtools/index.php?title=SAM_protocol#Support_Protocol_2:_Local_Realignment    

#### FAST READ HIT LOOKUP TOOL
#### DONE Fri Nov 12 11:22:11 EDT 2010
indexReads.pl       LOAD hit.sam FILES INTO B-TREE DB FILES (QUICK LOOKUP)
lookupRead.pl       TEST lookupRead SUBROUTINE OF IndexRead.pm
numberReads.pl      COUNT THE NUMBER OF UNIQUE READS IN A DB FILE
numberHits.pl       COUNT THE NUMBER OF UNIQUE HITS (I.E., ENTRIES) IN A DB FILE

#### DONE Mon Oct 25 16:49:50 EDT 2010
#### COVERAGE (C or pl SCRIPT)  
CREATED bamCoverage.pl
http://picard.sourceforge.net/command-line-overview.shtml#CompareSAMs
http://www.broadinstitute.org/gsa/wiki/index.php/Running_the_GATK_for_the_first_time
pysam
http://wwwfgu.anat.ox.ac.uk/~andreas/documentation/samtools/api.html

#### DONE  Fri Oct 22 11:22:11 EDT 2010
#### DISTRIBUTED SAV.pl     
(threaded Loop.pm, copy sqlite db file to outdir):
    - including dbSNP with 3.3 billion-read SNPs

#### DONE Wed Oct 20 12:54:25 EDT 2010
#### FIX NOVOALIGN.pl USAGE  





</entry>



<entry [Wed Dec  8 14:37:12 EST 2010] RERUN MAQ.pl PIPELINE ONLY (MAQ MATCHES IN THE FIRST 24bp)>



MAQ.pl
------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2

screen -S maq

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/MAQ.pl \
--replicates 1-33 \
--loop parallel \
--params "-C 1" \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/%REPLICATE% \
--species human \
--label maq-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue small \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/%REPLICATE%/maq-200bp-chr22-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/maq.1-33.loop.out
    
    Run time: 29:36:11
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    8:15PM, 9 December 2010
    ****************************************


/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs,splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2 \
--references chr22



MAQ MATCHES IN THE FIRST 24bp
http://maq.sourceforge.net/faq.shtml

I am using the default option to run `maq map'. I see hits containing a lot of mismatches. Is this a bug?
No, it is not. By default, maq guarantees that all hits with up to 2 mismatches in the first 24bp can be found, and can also find part of hits with 3 or 4 mismatches in the first 24bp. There is no explicit cut off on the mismatches across the whole read. Nonetheless, hits with a lot of high-quality mismatches will be discarded.



CONFIRMED CORRECT SETTINGS USED TO RUN MAQ:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1/chr22
emacs -nw maq-chr22.sh

    ...
    time /nethome/bioinfo/apps/maq/0.7.1/maq match -C 1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1/chr22/$LSB_JOBINDEX/out.map /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chr22/chr22.bfa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1/$LSB_JOBINDEX/maq-200bp-chr22-1_1.$LSB_JOBINDEX.bfq /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1/$LSB_JOBINDEX/maq-200bp-chr22-1_2.$LSB_JOBINDEX.bfq  &> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1/chr22/$LSB_JOBINDEX/maq-chr22-outerr.txt


/nethome/bioinfo/apps/maq/0.7.1/maq match 

Usage:   maq map [options] <out.map> <chr.bfa> <reads_1.bfq> [reads_2.bfq]

Options: -1 INT      length of the first read (<=127) [0]
         -2 INT      length of the second read (<=127) [0]
         -m FLOAT    rate of difference between reads and references [0.001]
         -e INT      maximum allowed sum of qualities of mismatches [70]
         -d FILE     adapter sequence file [null]
         -a INT      max distance between two paired reads [250]
         -A INT      max distance between two RF paired reads [0]
         -n INT      number of mismatches in the first 24bp [2]
         -M c|g      methylation alignment mode [null]
         -u FILE     dump unmapped and poorly aligned reads to FILE [null]
         -H FILE     dump multiple/all 01-mismatch hits to FILE [null]
         -C INT      max number of hits to output. >512 for all 01 hits. [250]
         -s INT      seed for random number generator [random]
         -W          disable Smith-Waterman alignment
         -t          trim all reads (usually not recommended)
         -c          match in the colorspace



COMPLETED OKAY BUT OUTPUT FILES STILL LARGE LIKE 'maq' RUN:


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22
ll */1/chr22/hit.bam

ll -alS */1/chr22/hit.bam

    -rw-rw-rw- 1 syoung root 1.2G Dec 10 00:13 maq2/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:32 maq/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Dec  8 14:19 remaq/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 01:27 bowtie/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov  5 18:56 bowtie-fr/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Nov 30 00:09 bowtie-rf/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Dec  8 14:19 rebowtie/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 299M Dec  8 14:19 rebowtie-rf/1/chr22/hit.bam
    -rw-r--r-- 1 syoung root 285M Nov 29 22:59 novoalign/1/chr22/hit.bam
    -rw-r--r-- 1 syoung root 285M Dec  8 14:19 renovoalign/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 110M Nov 29 12:34 eland/1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 110M Dec  8 14:17 reeland/1/chr22/hit.bam


ALL maq2 OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2
ls -altr */chr22/hit.bam

    -rw-rw-rw- 1 syoung root 1283434145 Dec  8 19:46 4/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283732283 Dec  8 19:53 23/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1282989784 Dec  8 19:58 31/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283635072 Dec  8 19:58 2/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283391388 Dec  8 19:58 27/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283173265 Dec  8 19:58 22/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283623952 Dec  8 20:00 16/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283441961 Dec  8 20:00 17/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283176319 Dec  8 20:00 14/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283152953 Dec  8 20:00 20/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283319672 Dec  8 20:01 28/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283760526 Dec  8 20:01 9/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283381339 Dec  8 20:02 8/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283209088 Dec  8 20:02 19/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283334106 Dec  8 20:02 11/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1282707213 Dec  8 20:03 1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283225241 Dec  8 20:03 26/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283062919 Dec  8 20:03 7/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1282820263 Dec  8 20:04 32/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283185403 Dec  8 20:04 3/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283222693 Dec  8 20:05 18/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283481710 Dec  8 20:08 5/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283360674 Dec  8 20:08 21/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283442579 Dec  8 20:08 25/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283508143 Dec  8 20:09 12/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283471769 Dec  8 20:13 13/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283069634 Dec  8 20:15 10/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283418340 Dec  8 20:16 15/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283195293 Dec  8 20:20 6/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283086973 Dec  8 20:21 30/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283915903 Dec  8 20:21 24/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283054222 Dec  8 20:21 29/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1283918418 Dec  8 20:22 33/chr22/hit.bam


INDEX 1/chr22/hit.bam AND GET NUMBER OF UNIQUE READS:

screen -S index-maq2

time /nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1/chr22/hit.bam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1/chr22/hit.bam.db

    23100000
    23200000
    IndexRead::buildIndex    Reads loaded: 23235868
    indexReads.pl    Reads indexed: 23235868
    indexReads.pl    Run time: 08:17:29
    indexReads.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl
    indexReads.pl    7:04PM, 10 December 2010
    indexReads.pl    ****************************************




time /nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1/chr22/hit.bam.db

memory usage BEFORE tie:
  RSS    VSZ
 9720 102828

Elapsed time (milliseconds): 32.409
memory usage AFTER tie:
  RSS    VSZ
10308 103244

Elapsed time (milliseconds): 22.781
memory usage AFTER count:
  RSS    VSZ
10352 103244

0
indexVenn.pl    Run time: 00:00:01
indexVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl
indexVenn.pl    8:39PM, 10 December 2010
indexVenn.pl    ****************************************





samtools view /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1/chr22/hit.bam



binBam.pl
---------

screen -S maq-binbam

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/33 \
--binlevel 2500000 \
--reference chr22 \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF 

    binBam.pl    Run time: 00:02:47
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    0:24AM, 10 December 2010
    binBam.pl    ****************************************


##binBam.pl    Run time: 00:17:27
##binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
##binBam.pl    9:06PM, 9 December 2010
##binBam.pl    ****************************************


OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/33/chr22/bins

    -rw-rw-rw-  1 syoung root  73M Dec 10 00:23 hit.binlevel2500000.num10.bam
    -rw-rw-rw-  1 syoung root 100M Dec 10 00:23 hit.binlevel2500000.num11.bam
    -rw-rw-rw-  1 syoung root  82M Dec 10 00:23 hit.binlevel2500000.num12.bam
    -rw-rw-rw-  1 syoung root 102M Dec 10 00:23 hit.binlevel2500000.num13.bam
    -rw-rw-rw-  1 syoung root 115M Dec 10 00:23 hit.binlevel2500000.num14.bam
    -rw-rw-rw-  1 syoung root  72M Dec 10 00:23 hit.binlevel2500000.num15.bam
    -rw-rw-rw-  1 syoung root  83M Dec 10 00:23 hit.binlevel2500000.num16.bam
    -rw-rw-rw-  1 syoung root  78M Dec 10 00:24 hit.binlevel2500000.num17.bam
    -rw-rw-rw-  1 syoung root  62M Dec 10 00:23 hit.binlevel2500000.num18.bam
    -rw-rw-rw-  1 syoung root  52M Dec 10 00:24 hit.binlevel2500000.num19.bam
    -rw-rw-rw-  1 syoung root  50M Dec 10 00:24 hit.binlevel2500000.num20.bam
    -rw-rw-rw-  1 syoung root  56M Dec 10 00:23 hit.binlevel2500000.num6.bam
    -rw-rw-rw-  1 syoung root 163M Dec 10 00:24 hit.binlevel2500000.num7.bam
    -rw-rw-rw-  1 syoung root  60M Dec 10 00:23 hit.binlevel2500000.num8.bam
    -rw-rw-rw-  1 syoung root  84M Dec 10 00:24 hit.binlevel2500000.num9.bam
    -rw-rw-rw-  1 syoung root 198M Dec  9 21:05 hit.binlevel2.num10.bam
    -rw-rw-rw-  1 syoung root 240M Dec  9 21:05 hit.binlevel2.num11.bam
    -rw-rw-rw-  1 syoung root 337M Dec  9 21:06 hit.binlevel2.num12.bam
    -rw-rw-rw-  1 syoung root 275M Dec  9 21:06 hit.binlevel2.num13.bam
    -rw-rw-rw-  1 syoung root 177M Dec  9 21:05 hit.binlevel2.num14.bam



cumulativeSnp.pl AND snpVenn.pl                  
-------------------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/cumulative3

screen -S maq-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--binlevel 2500000 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/33 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/cumulative3 \
--species human \
--label maq-cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/cumulative3/cumulative3.binlevel2.out

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/cumulative3



/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--binlevel 2500000 \
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


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl \
--binlevel 2500000 \
--suffix sav \
--filename hit.bam \
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
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/unbin.out
    

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/cumulative3/chr22/venn/sav \
--replicates 1-33 \
--loop distributed \
--label maq-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/cumulative3/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/cumulative3/chr22/venn/sav \
--querylabel maq-33 \
--targetlabel maq-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq2/cumulative3/chr22/venn/sav/vennsav.out













NOTES
-----

ERROR IN SHELL SCRIPT: PARAMS PASSED TO echo BUT NOT TO RUN COMMAND:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22
emacs maq-chr22.sh

    echo "Running MAQ: time /nethome/bioinfo/apps/maq/0.7.1/maq match -C 1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/$LSB_JOBINDEX/out.map /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chr22/chr22.bfa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/$LSB_JOBINDEX/maq-200bp-chr22-1_1.$LSB_JOBINDEX.bfq /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/$LSB_JOBINDEX/maq-200bp-chr22-1_2.$LSB_JOBINDEX.bfq  &> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/$LSB_JOBINDEX/maq-chr22-outerr.txt"
    time /nethome/bioinfo/apps/maq/0.7.1/maq match /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/$LSB_JOBINDEX/out.map /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chr22/chr22.bfa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/$LSB_JOBINDEX/maq-200bp-chr22-1_1.$LSB_JOBINDEX.bfq /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/$LSB_JOBINDEX/maq-200bp-chr22-1_2.$LSB_JOBINDEX.bfq  &> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/$LSB_JOBINDEX/maq-chr22-outerr.txt



</entry>



<entry [Wed Dec  8 14:42:03 EST 2010] RUN numberReads.pl TO GET THE MAX NUMBER OF HITS PER READ PRODUCED BY MAQ>









</entry>



<entry [Wed Dec  8 12:22:12 EST 2010] MOVED 'RUN STATUS SUMMARY'>



*** MOVED TO Notes-project04-runs.txt ***


</entry>



<entry [Wed Dec  8 09:19:35 EST 2010] RUN bamToSnp.pl ON ALL REALIGNED SAMPLES>



INPUT FILES:

syoung


1. MOVE INPUT DIRECTORIES TO NEW BASE DIRS
2. COPY hit.bam FILES TO re*/*/chr22 DIRECTORIES
3. COPY hit.binlevel*.bam FILES TO bins DIRECTORY
4. RUN bamToSnp.pl



1. MOVE INPUT DIRECTORIES TO NEW BASE DIRS
------------------------------------------

#### ALL COMPLETED


# ELAND

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/moveDirs.pl \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland \
--mode numeric 

# MAQ

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/moveDirs.pl \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/remaq \
--mode numeric 

# BOWTIE

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/moveDirs.pl \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/rebowtie \
--mode numeric 

# BOWTIE-RF

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/moveDirs.pl \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/rebowtie-rf \
--mode numeric 

# NOVOALIGN

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/moveDirs.pl \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/renovoalign \
--mode numeric 




2. COPY hit.bam FILES TO re*/*/chr22 DIRECTORIES
------------------------------------------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename hit.bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/%REPLICATE%/chr22


WHICH RUNS

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename hit.bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/1/chr22


# ELAND

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename hit.bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/%REPLICATE%/chr22

Run time: 00:02:14
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
2:19PM, 8 December 2010
****************************************


# MAQ

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename hit.bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/remaq/%REPLICATE%/chr22

# BOWTIE

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename hit.bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/rebowtie/%REPLICATE%/chr22

Run time: 00:08:49
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
2:27PM, 8 December 2010
****************************************


# BOWTIE-RF

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename hit.bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/rebowtie-rf/%REPLICATE%/chr22

Run time: 00:08:52
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
2:28PM, 8 December 2010
****************************************


# NOVOALIGN

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--filename hit.bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/renovoalign/%REPLICATE%/chr22


Run time: 00:06:04
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
2:25PM, 8 December 2010
****************************************



3. COPY hit.binlevel*.bam FILES TO bins DIRECTORY
-------------------------------------------------

TEST
----
/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--mode regex \
--filename hit.binlevel.+bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/1/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/1/chr22/bins


# ELAND

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--mode regex \
--filename hit.binlevel.+bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/%REPLICATE%/chr22/bins

Run time: 00:02:43
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
1:24PM, 8 December 2010
****************************************

# MAQ

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--mode regex \
--filename hit.binlevel.+bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/remaq/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/remaq/%REPLICATE%/chr22/bins


Run time: 00:17:52
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
1:41PM, 8 December 2010
****************************************

# BOWTIE

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--mode regex \
--filename hit.binlevel.+bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/rebowtie/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/rebowtie/%REPLICATE%/chr22/bins

Run time: 00:09:36
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
1:34PM, 8 December 2010
****************************************

# BOWTIE-RF

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--mode regex \
--filename hit.binlevel.+bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/rebowtie-rf/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/rebowtie-rf/%REPLICATE%/chr22/bins

Run time: 00:09:42
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
1:35PM, 8 December 2010
****************************************

# NOVOALIGN

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--loop serial \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/copyFiles.pl \
--mode regex \
--filename hit.binlevel.+bam \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/renovoalign/%REPLICATE%/chr22 \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/renovoalign/%REPLICATE%/chr22/bins

Run time: 00:07:09
Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
1:32PM, 8 December 2010
****************************************



4. RUN bamToSnp.pl
------------------


ELAND
-----

screen -S eland-bamsnp

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/bamToSnp.pl \
--binlevel 2 \
--filename hit.bam \
--species human \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/cumulative \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/reeland/2 \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24



\
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/bamsnp-eland.txt

    
    #bamToSnp.pl    Run time: 00:01:05
    #bamToSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/bamToSnp.pl
    #bamToSnp.pl    7:10PM, 5 December 2010
    #bamToSnp.pl    ****************************************


MAQ
---

screen -S bamsnp-maq

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
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/bamToSnp-stdout.txt







</entry>



<entry [Tue Dec  7 11:36:46 EST 2010] RUN snpCounts.pl ON ALL SAMPLES>




ELAND
-----

screen -S eland-counts

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl \
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
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/snpcounts-eland\.txt
    
    
    SNP::snpCounts    Can't find savfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit.binlevel2.num11-2.sav.lines
    SNP::snpCounts    Can't find savfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit.binlevel2.num12-2.sav.lines
    SNP::snpCounts    Can't find savfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit.binlevel2.num13-2.sav.lines
    SNP::snpCounts    Can't find savfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit.binlevel2.num14-2.sav.lines



MAQ
---

screen -S maq-counts

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl \
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
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/snpcounts-maq.txt

    snpCounts.pl    Completed snp->snpCounts()
    snpCounts.pl    Run time: 00:05:23
    snpCounts.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl
    snpCounts.pl    6:19PM, 7 December 2010
    snpCounts.pl    ****************************************



BOWTIE
------

screen -S bowtie-counts

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl \
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
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/snpcounts-bowtie.txt
    
    snpCounts.pl    Run time: 00:08:15
    snpCounts.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl
    snpCounts.pl    2:29PM, 8 December 2010
    snpCounts.pl    ****************************************

    ###FAILED
    ###... 
    ###Job <2329507> is submitted to queue <small>.
    ###Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/printLineCounts-22-chr22-11.sh
    ###Failed in an LSF library call: LIM is down; try later. Job not submitted.
    ###



BOWTIE-RF
---------

screen -S bowtie-rf-counts

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl \
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
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/snpcounts-bowtie-rf.txt
    
    snpCounts.pl    Completed snp->snpCounts()
    snpCounts.pl    Run time: 00:05:44
    snpCounts.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl
    snpCounts.pl    6:22PM, 7 December 2010
    snpCounts.pl    ****************************************


NOVOALIGN
---------

screen -S novoalign-counts

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl \
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
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/snpcounts-novo.txt

    snpCounts.pl    Completed snp->snpCounts()
    snpCounts.pl    Run time: 00:05:28
    snpCounts.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl
    snpCounts.pl    6:22PM, 7 December 2010
    snpCounts.pl    ****************************************








NOTES
-----


    APPLICATION     snpCounts

    PURPOSE
  
		FOR EVERY REFERENCE CHROMOSOME IN EACH INPUT DIRECTORY:
		
            1. COUNT NUMBER OF READ HITS IN *bam FILES USING samtools idxstats
            
            2. COUNT NUMBER OF RAW (*snp) SNPs
            
            3. COUNT NUMBER OF ANNOTATED (*sav) SNPs

            4. PRINT TO OUTPUT FILE

    EXAMPLE


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpCounts.pl \
--binlevel 2 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/snpcounts.txt

--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/snpcounts/snpcounts.out


MANUAL COUNT OF *bam FILE READS
-------------------------------

COUNT FROM BINNED *bam FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22
cat *idxstats | cut -f 3
2807289
3071030
4497345
3395005
2261794

perl -e 'print 2807289 + 3071030 + 4497345 + 3395005 + 2261794'

    16032463

GET MISSES:

[syoung@u04 chr22]$ cat bins/*idxstats | cut -f 4
1108225
1442704
1849649
1742570
1060260

perl -e 'print 1108225 + 1442704 + 1849649 + 1742570 + 1060260'

    7203408

WHICH BOTH MATCH THE COUNTS FROM THE ORIGINAL *bam FILE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22
samtools idxstats hit.bam

    chr22   51304566        16032460        7203408
    *       0       0       0





WHICH RUNS bamIdxstats.pl:

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamIdxstats.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam.idxstats 


AND countLines.pl TO GET LINE COUNTS OF *snp AND *sav FILES:

/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/countLines.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-1.snp \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-1.snp.count 






</entry>



<entry [Mon Dec  6 22:55:58 EST 2010] SNP SUMMARY>




FILE 33 LINE COUNTS
-------------------

cumeland
lines hit-33.s*
    hit-33.sav: 21289
    hit-33.snp: 21404
grep -c rs hit-33.sav
    16325

cummaq
lines hit-33.s*
    hit-33.snp: 23400
    hit-33.sav: 1899
grep -c rs hit-33.sav
    25

cumbow
lines hit-33.s*
    hit-33.sav: 86806
    hit-33.snp: 90941
grep -c rs hit-33.sav
    52312


cumbowrf
lines hit-33.s*
    hit-33.sav: 67661
    hit-33.snp: 90970
grep -c rs hit-33.sav
    39026

cumnovo
lines hit-33.s*
    hit-33.sav: 74536
    hit-33.snp: 102149
grep -c rs hit-33.sav
    26065


RUN ALL FILES LINE COUNTS
-------------------------


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22

lines hit-*.sav

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
    hit-1.sav: 76048
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
    hit-2.sav: 100425
    hit-30.sav: 66738
    hit-31.sav: 66506
    hit-32.sav: 73305
    hit-33.sav: 86806
    hit-3.sav: 107091
    hit-4.sav: 88387
    hit-5.sav: 83944
    hit-6.sav: 122957
    hit-7.sav: 98142
    hit-8.sav: 74807
    hit-9.sav: 58383

[syoung@u03 chr22]$ lines hit-*.snp
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
hit-1.snp: 77385
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
hit-2.snp: 106305
hit-30.snp: 95719
hit-31.snp: 94044
hit-32.snp: 92440
hit-33.snp: 90941
hit-3.snp: 122804
hit-4.snp: 132957
hit-5.snp: 138301
hit-6.snp: 141062
hit-7.snp: 142191
hit-8.snp: 142162
hit-9.snp: 140984




NOTES
-----

MAQ SNP vs SOAP SNP
-------------------

samtools pileup 

Usage:  samtools pileup [options] <in.bam>|<in.sam>

Option: -s        simple (yet incomplete) pileup format
        -S        the input is in SAM
        -A        use the MAQ model for SNP calling
        -2        output the 2nd best call and quality
        -i        only show lines/consensus with indels
        -m INT    filtering reads with bits in INT [1796]
        -M INT    cap mapping quality at INT [60]
        -d INT    limit maximum depth for indels [unlimited]
        -t FILE   list of reference sequences (force -S)
        -l FILE   list of sites at which pileup is output
        -f FILE   reference sequence in the FASTA format

        -c        output the SOAPsnp consensus sequence
        -v        print variants only (for -c)
        -g        output in the GLFv3 format (suppressing -c/-i/-s)
        -T FLOAT  theta in maq consensus calling model (for -c/-g) [0.850000]
        -N INT    number of haplotypes in the sample (for -c/-g) [2]
        -r FLOAT  prior of a difference between two haplotypes (for -c/-g) [0.001000]
        -G FLOAT  prior of an indel between two haplotypes (for -c/-g) [0.000150]
        -I INT    phred prob. of an indel in sequencing/prep. (for -c/-g) [40]


http://sourceforge.net/apps/mediawiki/samtools/index.php?title=SAM_FAQ


Does samtools generate the consensus sequence like Maq?
*******************************************************

Yes. Try this:

samtools pileup -cf ref.fa aln.bam | samtools.pl pileup2fq -D100 > cns.fastq

Again, remember to set -D according to your read depth. Note that pileup2fq applies fewer filters in comparison to varFilter, and you may see tiny inconsistency between the two outputs.

In repetitive regions, SAMtools call all bases as 'A' although there are no 'A' bases in reads.
**********************************************************************************
This is due to a floating underflow in the MAQ SNP calling model used by default and only happens in repetitive regions. These calls are always filtered out. However, if you are uncomfortable with this, you may use the simplified SOAPsnp model with:

samtools -avcf ref.fa aln.bam > raw.txt


The MAQ model and SOAPsnp model usually deliver very similar SNP calls.


How are SNPs and indels called and filtered by SAMtools?
********************************************************

By default, SNPs are called with a Bayesian model identical to the one used in MAQ. A simplified SOAPsnp model is implemented, too. Indels are called with a simple Bayesian model. The caller does local realignment to recover indels that occur at the end of a read but appear to be contiguous mismatches. For an example, see this picture.

The varFilter filters SNPs/indels in the following order:

d: low depth
D: high depth
W: too many SNPs in a window (SNP only)
G: close to a high-quality indel (SNP only)
Q: low root-mean-square (RMS) mapping quality (SNP only)
g: close to another indel with more evidence (indel only)

The first letter indicates the reason why SNPs/indels are filtered when you invoke varFilter with the '-p' option. A SNP/indel filtered by a rule higher in the list will not be tested against other rules.




I want to get `unique' alignments from SAM/BAM.
***********************************************
We prefer to say an alignment is `reliable' rather than `unique' as `uniqueness' is not well defined in general cases. You can get reliable alignments by setting a threshold on mapping quality:

samtools view -bq 1 aln.bam > aln-reliable.bam

You may want to set a more stringent threshold to get more reliable alignments.



</entry>



<entry [Mon Dec  6 10:59:03 EST 2010] CHECK DISC USAGE ON /scratch>




cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
cat du.txt 

    575G    100M
    95G     autochr22
    5.4T    chr22
    932M    diff
    1.5K    du.txt
    8.1G    SRX000600
    31G     SRX000601
    123G    SRX000602
    55G     SRX000603



</entry>



<entry [Mon Dec  6 12:30:42 EST 2010] CREATED indexVenn.pl TO CROSS-CHECK snpVenn.pl>



- USES DBIndex::Snp DB FILES


eland
-----
/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexSnp.pl --inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-1.sav --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-1.sav.db

    DBIndex::Snp::buildIndex    Snps loaded: 9332
    indexSnp.pl    Reads indexed: 9332
    indexSnp.pl    Run time: 00:00:00
    indexSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexSnp.pl
    indexSnp.pl    11:06AM, 5 December 2010
    indexSnp.pl    ****************************************

maq
---
/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexSnp.pl --inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-1.sav --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-1.sav.db
    
    DBIndex::Snp::buildIndex    Snps loaded: 19339
    indexSnp.pl    Reads indexed: 19339
    indexSnp.pl    Run time: 00:00:01
    indexSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexSnp.pl
    indexSnp.pl    11:06AM, 5 December 2010
    indexSnp.pl    ****************************************


VENN OF eland AND maq
---------------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-1.sav.db \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-1.sav.db \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-maq \
--querylabel eland-1 \
--targetlabel maq-1





</entry>



<entry [Tue Dec  7 10:48:59 EST 2010] RUN snpVenn.pl *snp ON ALL SAMPLES>




ELAND vs MAQ
------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-maq

screen -S elandmaq-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-maq \
--replicates 1-33 \
--loop distributed \
--label elandmaq-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-%REPLICATE%.snp \
--querylabel eland-%REPLICATE% \
--targetlabel maq-%REPLICATE% \
--suffix snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-maq \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-maq/elandmaq-snpvenn.out
    
    Run time: 00:31:03
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:22AM, 7 December 2010
    ****************************************


OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-maq
ll *snp
    
    OK



ELAND vs BOWTIE
---------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie

screen -S elandbowtie-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie \
--replicates 1-33 \
--loop distributed \
--label elandbowtie-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%.snp \
--querylabel eland-%REPLICATE% \
--targetlabel bowtie-%REPLICATE% \
--suffix snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie/elandbowtie-snpvenn.out
    
    Run time: 02:56:36
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:48PM, 7 December 2010
    ****************************************


OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie
ll *snp



ELAND vs BOWTIE-RF
------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie-rf

screen -S elandbowtie-rf-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie-rf \
--replicates 1-33 \
--loop distributed \
--label elandbowtie-rf-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-%REPLICATE%.snp \
--querylabel eland-%REPLICATE% \
--targetlabel bowtie-rf-%REPLICATE% \
--suffix snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie-rf \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie-rf/elandbowtie-rf-snpvenn.out

    Run time: 02:57:59
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:53PM, 7 December 2010
    ****************************************



OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-bowtie-rf
ll *snp



ELAND v NOVOALIGN
-----------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-novoalign

screen -S elandnovo-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-novoalign \
--replicates 1-33 \
--loop distributed \
--label elandnovoalign-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%.snp \
--querylabel eland-%REPLICATE% \
--targetlabel novoalign-%REPLICATE% \
--suffix snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-novoalign \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-novoalign/elandnovoalign-snpvenn.out

    Run time: 02:00:43
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    12:56AM, 7 December 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/eland-novoalign
ll *snp



BOWTIE v NOVOALIGN
------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/bowtie-novoalign

screen -S bowtienovo-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/bowtie-novoalign \
--replicates 1-33 \
--loop distributed \
--label bowtienovoalign-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%.snp \
--querylabel bowtie-%REPLICATE% \
--targetlabel novoalign-%REPLICATE% \
--suffix snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/bowtie-novoalign \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/bowtie-novoalign/bowtienovoalign-snpvenn.out
    
    Run time: 10:26:55
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    9:21PM, 7 December 2010
    ****************************************




ELAND 
-----

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/snp

screen -S eland-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/snp \
--replicates 1-33 \
--loop distributed \
--label eland-vennsnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-33.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/snp \
--querylabel eland-33 \
--targetlabel eland-%REPLICATE% \
--suffix snp \
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





MAQ
---

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn/snp

screen -S maq-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn/snp \
--replicates 1-33 \
--loop distributed \
--label maq-snpvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-33.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/hit-%REPLICATE%.snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn/snp \
--querylabel maq-33 \
--targetlabel maq-%REPLICATE% \
--suffix snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn/snp/snpvenn.out


    Run time: 00:44:41
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:42AM, 7 December 2010
    ****************************************

    ####Run time: 00:25:57
    ####Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    ####11:23AM, 7 December 2010
    ####****************************************






BOWTIE
------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/snp

screen -S bowtie-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/snp \
--replicates 1-33 \
--loop distributed \
--label bowtie-venn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-33.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%.snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/snp \
--querylabel bowtie-33 \
--targetlabel bowtie-%REPLICATE% \
--suffix snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/snp/snpvenn.out
        
    
    Run time: 09:06:57
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:27AM, 7 December 2010
    ****************************************




BOWTIE-RF
---------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn/snp

screen -S bowtie-rf-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn/snp \
--replicates 1-33 \
--loop distributed \
--label bowtie-rf-snpvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-33.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/hit-%REPLICATE%.snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn/snp \
--querylabel bowtie-rf-33 \
--targetlabel bowtie-rf-%REPLICATE% \
--suffix snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn/snp/snpvenn.out
    
    Run time: 11:05:26
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:05PM, 7 December 2010
    *************************************


NOVOALIGN
---------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/snp

screen -S novoalign-venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/snp \
--replicates 1-33 \
--loop distributed \
--label novoalign-snpvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-33.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%.snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/snp \
--querylabel bowtie-rf-33 \
--targetlabel bowtie-rf-%REPLICATE% \
--suffix snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/snp/snpvenn.out

    Run time: 06:30:14
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    5:31PM, 7 December 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/snp
lines *snp







</entry>



<entry [Sat Dec  4 10:09:43 EST 2010] RERUN realignBam.pl ON ALL SAMPLES>




ELAND
-----

u01

screen -S realign-eland

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl \
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

    realignBam.pl    Run time: 00:15:34
    realignBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl
    realignBam.pl    12:02AM, 5 December 2010
    realignBam.pl    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/1/chr22
ll *bam

    -rw-rw-r-- 1 syoung root 8.3M Dec  5 23:29 hit.binlevel2.num10.bam
    -rw-rw-rw- 1 syoung root  35M Dec  5 11:59 hit.binlevel2.num11.bam
    -rw-rw-rw- 1 syoung root  28M Dec  5 11:55 hit.binlevel2.num12.bam
    -rw-rw-rw- 1 syoung root  28M Dec  5 11:57 hit.binlevel2.num13.bam
    -rw-rw-rw- 1 syoung root  20M Dec  5 11:53 hit.binlevel2.num14.bam
    -rw-rw-rw- 1 syoung root 2.1M Dec  5 11:47 hit.binlevel2.num15.bam



MAQ
---

screen -S realign-maq

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl \
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
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/realign-stdout.txt


NB: HAD TO CHECK REASON FOR MISSING hit.binlevel2.num15*intervals FILES - TURNS OUT THAT THE READS ALIGNED WITH MAQ STOP BEFORE BIN 15, UNLIKE WITH ALL THE OTHER ALIGNERS WHICH ALL HAVE HITS IN BIN 15

    realignBam.pl    Run time: 01:47:28
    realignBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl
    realignBam.pl    2:03PM, 6 December 2010
    realignBam.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/1/chr22
ll *bam

    -rw-rw-rw- 1 syoung root 218M Dec  6 12:19 hit.binlevel2.num10.bam
    -rw-rw-rw- 1 syoung root 256M Dec  6 12:29 hit.binlevel2.num11.bam
    -rw-rw-rw- 1 syoung root 361M Dec  6 12:34 hit.binlevel2.num12.bam
    -rw-rw-rw- 1 syoung root 289M Dec  6 12:30 hit.binlevel2.num13.bam
    -rw-rw-rw- 1 syoung root 188M Dec  6 12:26 hit.binlevel2.num14.bam


INPUT FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/1/chr22
ll ../../../*/chr22/hit.bam

    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:34 ../../../10/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:34 ../../../11/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:31 ../../../12/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../13/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../14/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../15/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../16/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:32 ../../../17/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:32 ../../../18/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../19/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:32 ../../../1/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../20/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:35 ../../../21/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:35 ../../../22/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../23/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../24/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:36 ../../../25/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:36 ../../../26/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../27/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../28/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:36 ../../../29/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../2/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:36 ../../../30/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../31/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../32/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:34 ../../../33/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:32 ../../../3/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:33 ../../../4/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:31 ../../../5/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:31 ../../../6/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:35 ../../../7/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:35 ../../../8/chr22/hit.bam
    -rw-rw-rw- 1 syoung root 1.2G Nov 30 17:35 ../../../9/chr22/hit.bam



BOWTIE
------

screen -S realign-bowtie

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl \
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
--maxjobs 1000 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/realign-stdout.txt
    
    realignBam.pl    Run time: 02:33:01
    realignBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl
    realignBam.pl    3:02AM, 6 December 2010
    realignBam.pl    **********************************




BOWTIE-RF
---------

screen -S realign-bowtie-rf

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl \
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
--maxjobs 1000 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/realign-stdout.txt

    realignBam.pl    Run time: 02:32:50
    realignBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl
    realignBam.pl    3:06AM, 6 December 2010
    realignBam.pl    ****************************************





NOVOALIGN
---------

screen -S realign-novoalign

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl \
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
--maxjobs 1000 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/realign-stdout.txt

    realignBam.pl    Run time: 01:09:25
    realignBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl
    realignBam.pl    1:44AM, 6 December 2010
    realignBam.pl    ****************************************






TEST
----


INFO ON IndelRealigner

/usr/local/java/bin/java \
-jar /nethome/syoung/base/apps/gatk/1.0.4705/GenomeAnalysisTK.jar \
-T IndelRealigner -h



RAN ON ELAND FILE 1:

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/realignBam.pl \
--binlevel 2 \
--filename hit.bam \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3 \
--species human \
--label eland-realign \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000



REALIGNED OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/1/chr22
    
    -rw-rw-r-- 1 syoung root 9.6M Dec  5 11:50 hit.binlevel2.num10.bam
    -rw-rw-rw- 1 syoung root  35M Dec  5 11:59 hit.binlevel2.num11.bam
    -rw-rw-rw- 1 syoung root  28M Dec  5 11:55 hit.binlevel2.num12.bam
    -rw-rw-rw- 1 syoung root  28M Dec  5 11:57 hit.binlevel2.num13.bam
    -rw-rw-rw- 1 syoung root  20M Dec  5 11:53 hit.binlevel2.num14.bam
    -rw-rw-rw- 1 syoung root 2.1M Dec  5 11:47 hit.binlevel2.num15.bam


ORIGINAL *bam FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22
    
    -rw-rw-rw- 1 syoung root 8.3M Dec  1 12:35 hit.binlevel2.num10.bam
    -rw-rw-rw- 1 syoung root  31M Dec  1 12:35 hit.binlevel2.num11.bam
    -rw-rw-rw- 1 syoung root  26M Dec  1 12:35 hit.binlevel2.num12.bam
    -rw-rw-rw- 1 syoung root  26M Dec  1 12:35 hit.binlevel2.num13.bam
    -rw-rw-rw- 1 syoung root  19M Dec  1 12:35 hit.binlevel2.num14.bam
    -rw-rw-rw- 1 syoung root 2.0M Dec  1 12:35 hit.binlevel2.num15.bam


MANUALLY CHECKED SOME INTERVALS USING samtools view <in.bam> chr:start-stop:


FIRST 3 SNP REGIONS HAVE IDENTICAL ALIGNMENTS IN REALIGNED *bam FILE USING THIS COMMAND

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/1/chr22/realign
samtools view hit.binlevel2.num10.bam chr22:16056373-16056473 > realign.view
samtools view ../../../1/chr22/bins/hit.binlevel2.num10.bam chr22:16056373-16056473 > orig.view
diff realign.view orig.view
    <NO DIFFERENCE>


SAMPLE FIRST INTERVALS FOR THIS FILE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/1/chr22
head realign/hit.binlevel2.num10.bam.intervals

    chr22:16050036-16050086
    chr22:16051674-16051774
    chr22:16056373-16056473
    chr22:16056638-16056738
    chr22:16058461-16058572
    chr22:16059770-16059870
    chr22:16061836-16061936
    chr22:16062411-16062712
    chr22:16062800-16062900
    chr22:16063190-16063290



realignBam.pl WORKS BY RUNNING GATK IndelAligner:


time /usr/local/java/bin/java \
-jar /nethome/syoung/base/apps/gatk/1.0.4705/GenomeAnalysisTK.jar \
-T IndelRealigner \
-I /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/bins/hit.binlevel2.num10.bam \
-R /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22.fa \
-targetIntervals /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/1/chr22/realign/hit.binlevel2.num10.bam.intervals \
--out /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/realign/1/chr22/hit.binlevel2.num10.bam \
-U \
-S SILENT





</entry>

