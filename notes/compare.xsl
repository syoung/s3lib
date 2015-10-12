compare

<entry [Sat 2011:08:20 04:21:05 EST] COPY BACKUPS OF comparison TO CONSOLIDATE>


sudo rsync -tv \
--remove-source-files \
/media/LaCie/u10.10/syoung/comparison/* \
/media/LaCie/u10.10/syoung-110324/comparison

    
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
<entry [Tue Feb  1 09:58:46 EST 2011] REMOVE autochr22 ALIGNMENT DIRS ON /ngs/bioinfo AND ROTATE IN RECENT RUNS IN /scratch>

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs,splitfiles \
--directory /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland \
--references chr22


</entry>
<entry [Tue Feb  1 09:58:45 EST 2011] NOVOALIGN SETTINGS>

http://www.novocraft.com/wiki/tiki-view_forum_thread.php?forumId=1&comments_parentId=316&topics_offset=9&topics_sort_mode=lastPost_desc


</entry>
<entry [Thu Jan 27 12:10:09 EST 2011] REFACTORED collate IN Venn::Snp TO USE BINNED FILES IF binlevel IS SUPPLIED>

ELAND V BOWTIE

/nethome/syoung/0.5/bin/apps/venn/collateVenn.pl \
--replicates 1-33 \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel bowtie-%REPLICATE%-dbsnp \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22 \
--queryindex  %REPLICATE% \
--targetindex %REPLICATE% \
--suffix sav \
--binlevel 500000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/elandbowtie/eland-dbsnp-vs-bowtie-dbsnp.tsv

    OK!


</entry>
<entry [Sun Jan 23 12:46:23 EST 2011] REFACTORED Venn::Snp TO USE BINNED FILES>

SOLUTION: RERUN binbam->cumulativebam->bamtosnp->snptosav ON bowtie (eland AND novoalign ARE FINE)

    X::App::run    started: 2011-01-27 12:33:47


PROBLEM: BOWTIE CUMULATIVE BAM FILES DISAPPEAR AS ITERATIONS PROGRESS

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/


ll *33.bam
    -rw-rw-rw- 1 syoung root 413M Jan 14 10:02 hit.binlevel500000.num33-33.bam
    -rw-rw-rw- 1 syoung root 599M Jan 14 10:04 hit.binlevel500000.num34-33.bam
ll *14.bam
    -rw-rw-rw- 1 syoung root 179M Jan 14 08:28 hit.binlevel500000.num33-14.bam
    -rw-rw-rw- 1 syoung root 258M Jan 14 08:30 hit.binlevel500000.num34-14.bam
    -rw-rw-rw- 1 syoung root 186M Jan 14 08:29 hit.binlevel500000.num35-14.bam
    -rw-rw-rw- 1 syoung root  96M Jan 14 08:28 hit.binlevel500000.num36-14.bam
    -rw-rw-rw- 1 syoung root  57M Jan 14 08:27 hit.binlevel500000.num37-14.bam
    -rw-rw-rw- 1 syoung root  43M Jan 14 08:27 hit.binlevel500000.num38-14.bam
    -rw-rw-rw- 1 syoung root  29M Jan 14 08:27 hit.binlevel500000.num39-14.bam
    -rw-rw-rw- 1 syoung root  25M Jan 14 08:27 hit.binlevel500000.num40-14.bam
    -rw-rw-rw- 1 syoung root  19M Jan 14 08:27 hit.binlevel500000.num41-14.bam
    -rw-rw-rw- 1 syoung root  30M Jan 14 08:27 hit.binlevel500000.num42-14.bam
    -rw-rw-rw- 1 syoung root  33M Jan 14 08:27 hit.binlevel500000.num43-14.bam
    -rw-rw-rw- 1 syoung root  29M Jan 14 08:27 hit.binlevel500000.num44-14.bam
ll *12.bam
    -rw-rw-rw- 1 syoung root 154M Jan 14 08:23 hit.binlevel500000.num33-12.bam
    -rw-rw-rw- 1 syoung root 222M Jan 14 08:24 hit.binlevel500000.num34-12.bam
    -rw-rw-rw- 1 syoung root 160M Jan 14 08:23 hit.binlevel500000.num35-12.bam
    -rw-rw-rw- 1 syoung root  83M Jan 14 08:22 hit.binlevel500000.num36-12.bam
    -rw-rw-rw- 1 syoung root  49M Jan 14 08:22 hit.binlevel500000.num37-12.bam
    -rw-rw-rw- 1 syoung root  37M Jan 14 08:22 hit.binlevel500000.num38-12.bam
    -rw-rw-rw- 1 syoung root  25M Jan 14 08:22 hit.binlevel500000.num39-12.bam
    -rw-rw-rw- 1 syoung root  22M Jan 14 08:22 hit.binlevel500000.num40-12.bam
    -rw-rw-rw- 1 syoung root  16M Jan 14 08:22 hit.binlevel500000.num41-12.bam
    -rw-rw-rw- 1 syoung root  26M Jan 14 08:22 hit.binlevel500000.num42-12.bam
    -rw-rw-rw- 1 syoung root  28M Jan 14 08:22 hit.binlevel500000.num43-12.bam
    -rw-rw-rw- 1 syoung root  25M Jan 14 08:22 hit.binlevel500000.num44-12.bam
    -rw-rw-rw- 1 syoung root  46M Jan 14 08:22 hit.binlevel500000.num45-12.bam
    -rw-rw-rw- 1 syoung root 124M Jan 14 08:23 hit.binlevel500000.num46-12.bam
    -rw-rw-rw- 1 syoung root  38M Jan 14 08:22 hit.binlevel500000.num47-12.bam
    -rw-rw-rw- 1 syoung root  21M Jan 14 08:22 hit.binlevel500000.num48-12.bam
    -rw-rw-rw- 1 syoung root  51M Jan 14 08:22 hit.binlevel500000.num49-12.bam
    -rw-rw-rw- 1 syoung root  53M Jan 14 08:22 hit.binlevel500000.num50-12.bam
    -rw-rw-rw- 1 syoung root  31M Jan 14 08:22 hit.binlevel500000.num51-12.bam
    -rw-rw-rw- 1 syoung root  48M Jan 14 08:22 hit.binlevel500000.num52-12.bam
    -rw-rw-rw- 1 syoung root  21M Jan 14 08:22 hit.binlevel500000.num53-12.bam
    -rw-rw-rw- 1 syoung root  30M Jan 14 08:22 hit.binlevel500000.num54-12.bam
    -rw-rw-rw- 1 syoung root  21M Jan 14 08:22 hit.binlevel500000.num55-12.bam
    -rw-rw-rw- 1 syoung root  27M Jan 14 08:22 hit.binlevel500000.num56-12.bam
    -rw-rw-rw- 1 syoung root  81M Jan 14 08:22 hit.binlevel500000.num57-12.bam
    -rw-rw-rw- 1 syoung root 168M Jan 14 08:23 hit.binlevel500000.num58-12.bam
    -rw-rw-rw- 1 syoung root 125M Jan 14 08:23 hit.binlevel500000.num59-12.bam
    -rw-rw-rw- 1 syoung root  30M Jan 14 08:22 hit.binlevel500000.num60-12.bam
    -rw-rw-rw- 1 syoung root  32M Jan 14 08:22 hit.binlevel500000.num61-12.bam
    -rw-rw-rw- 1 syoung root  21M Jan 14 08:22 hit.binlevel500000.num62-12.bam
    -rw-rw-rw- 1 syoung root  48M Jan 14 08:22 hit.binlevel500000.num63-12.bam
    -rw-rw-rw- 1 syoung root  34M Jan 14 08:22 hit.binlevel500000.num64-12.bam
    -rw-rw-rw- 1 syoung root  36M Jan 14 08:22 hit.binlevel500000.num65-12.bam
    -rw-rw-rw- 1 syoung root  94M Jan 14 08:22 hit.binlevel500000.num66-12.bam
    -rw-rw-rw- 1 syoung root  45M Jan 14 08:22 hit.binlevel500000.num67-12.bam
    -rw-rw-rw- 1 syoung root  40M Jan 14 08:22 hit.binlevel500000.num68-12.bam
    -rw-rw-rw- 1 syoung root  37M Jan 14 08:22 hit.binlevel500000.num69-12.bam
    -rw-rw-rw- 1 syoung root  95M Jan 14 08:22 hit.binlevel500000.num70-12.bam
    -rw-rw-rw- 1 syoung root 179M Jan 14 08:23 hit.binlevel500000.num71-12.bam
    -rw-rw-rw- 1 syoung root  46M Jan 14 08:22 hit.binlevel500000.num72-12.bam
    -rw-rw-rw- 1 syoung root  59M Jan 14 08:22 hit.binlevel500000.num73-12.bam



AFTER FIXED RERUN:

INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 10/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 11/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 12/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:37 13/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:37 14/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 15/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 16/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 17/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 18/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:37 19/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 1/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:37 20/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 21/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 22/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:37 23/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:37 24/chr22/hit.bam
-rw-rw-rw- 1 syoung root 300M Jan 27 12:37 25/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:37 26/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 27/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 28/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 29/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 2/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 30/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 31/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 32/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 33/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 3/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 4/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 5/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 6/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 7/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 8/chr22/hit.bam
-rw-rw-rw- 1 syoung root 299M Jan 27 12:36 9/chr22/hit.bam



OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/
ll *33.bam

    -rw-rw-rw- 1 syoung root  40M Jan 27 15:36 hit.binlevel500000.num100-33.bam
    -rw-rw-rw- 1 syoung root  58M Jan 27 15:36 hit.binlevel500000.num101-33.bam
    -rw-rw-rw- 1 syoung root  65M Jan 27 15:36 hit.binlevel500000.num102-33.bam
    -rw-rw-rw- 1 syoung root 152M Jan 27 15:37 hit.binlevel500000.num103-33.bam
    -rw-rw-rw- 1 syoung root 413M Jan 27 15:40 hit.binlevel500000.num33-33.bam
    -rw-rw-rw- 1 syoung root 599M Jan 27 15:42 hit.binlevel500000.num34-33.bam
    -rw-rw-rw- 1 syoung root 430M Jan 27 15:40 hit.binlevel500000.num35-33.bam
    -rw-rw-rw- 1 syoung root 223M Jan 27 15:38 hit.binlevel500000.num36-33.bam
    -rw-rw-rw- 1 syoung root 132M Jan 27 15:36 hit.binlevel500000.num37-33.bam
    -rw-rw-rw- 1 syoung root  98M Jan 27 15:36 hit.binlevel500000.num38-33.bam
    -rw-rw-rw- 1 syoung root  66M Jan 27 15:36 hit.binlevel500000.num39-33.bam
    -rw-rw-rw- 1 syoung root  57M Jan 27 15:36 hit.binlevel500000.num40-33.bam
    -rw-rw-rw- 1 syoung root  43M Jan 27 15:36 hit.binlevel500000.num41-33.bam
    -rw-rw-rw- 1 syoung root  69M Jan 27 15:36 hit.binlevel500000.num42-33.bam
    -rw-rw-rw- 1 syoung root  75M Jan 27 15:36 hit.binlevel500000.num43-33.bam
    -rw-rw-rw- 1 syoung root  68M Jan 27 15:36 hit.binlevel500000.num44-33.bam
    -rw-rw-rw- 1 syoung root 124M Jan 27 15:36 hit.binlevel500000.num45-33.bam
    -rw-rw-rw- 1 syoung root 332M Jan 27 15:39 hit.binlevel500000.num46-33.bam
    -rw-rw-rw- 1 syoung root 100M Jan 27 15:36 hit.binlevel500000.num47-33.bam
    -rw-rw-rw- 1 syoung root  55M Jan 27 15:36 hit.binlevel500000.num48-33.bam
    -rw-rw-rw- 1 syoung root 137M Jan 27 15:37 hit.binlevel500000.num49-33.bam
    -rw-rw-rw- 1 syoung root 143M Jan 27 15:37 hit.binlevel500000.num50-33.bam
    -rw-rw-rw- 1 syoung root  83M Jan 27 15:36 hit.binlevel500000.num51-33.bam
    -rw-rw-rw- 1 syoung root 131M Jan 27 15:37 hit.binlevel500000.num52-33.bam
    -rw-rw-rw- 1 syoung root  55M Jan 27 15:36 hit.binlevel500000.num53-33.bam
    -rw-rw-rw- 1 syoung root  79M Jan 27 15:36 hit.binlevel500000.num54-33.bam
    -rw-rw-rw- 1 syoung root  57M Jan 27 15:36 hit.binlevel500000.num55-33.bam
    -rw-rw-rw- 1 syoung root  73M Jan 27 15:36 hit.binlevel500000.num56-33.bam
    -rw-rw-rw- 1 syoung root 217M Jan 27 15:38 hit.binlevel500000.num57-33.bam
    -rw-rw-rw- 1 syoung root 453M Jan 27 15:40 hit.binlevel500000.num58-33.bam
    -rw-rw-rw- 1 syoung root 338M Jan 27 15:39 hit.binlevel500000.num59-33.bam
    -rw-rw-rw- 1 syoung root  81M Jan 27 15:37 hit.binlevel500000.num60-33.bam
    -rw-rw-rw- 1 syoung root  87M Jan 27 15:37 hit.binlevel500000.num61-33.bam
    -rw-rw-rw- 1 syoung root  56M Jan 27 15:36 hit.binlevel500000.num62-33.bam
    -rw-rw-rw- 1 syoung root 130M Jan 27 15:37 hit.binlevel500000.num63-33.bam
    -rw-rw-rw- 1 syoung root  91M Jan 27 15:37 hit.binlevel500000.num64-33.bam
    -rw-rw-rw- 1 syoung root  95M Jan 27 15:37 hit.binlevel500000.num65-33.bam
    -rw-rw-rw- 1 syoung root 252M Jan 27 15:39 hit.binlevel500000.num66-33.bam
    -rw-rw-rw- 1 syoung root 122M Jan 27 15:37 hit.binlevel500000.num67-33.bam
    -rw-rw-rw- 1 syoung root 108M Jan 27 15:37 hit.binlevel500000.num68-33.bam
    -rw-rw-rw- 1 syoung root 100M Jan 27 15:37 hit.binlevel500000.num69-33.bam
    -rw-rw-rw- 1 syoung root 255M Jan 27 15:39 hit.binlevel500000.num70-33.bam
    -rw-rw-rw- 1 syoung root 483M Jan 27 15:41 hit.binlevel500000.num71-33.bam
    -rw-rw-rw- 1 syoung root 123M Jan 27 15:37 hit.binlevel500000.num72-33.bam
    -rw-rw-rw- 1 syoung root 158M Jan 27 15:37 hit.binlevel500000.num73-33.bam
    -rw-rw-rw- 1 syoung root  87M Jan 27 15:37 hit.binlevel500000.num74-33.bam
    -rw-rw-rw- 1 syoung root  49M Jan 27 15:36 hit.binlevel500000.num75-33.bam
    -rw-rw-rw- 1 syoung root  49M Jan 27 15:36 hit.binlevel500000.num76-33.bam
    -rw-rw-rw- 1 syoung root  84M Jan 27 15:37 hit.binlevel500000.num77-33.bam
    -rw-rw-rw- 1 syoung root 140M Jan 27 15:37 hit.binlevel500000.num78-33.bam
    -rw-rw-rw- 1 syoung root  79M Jan 27 15:37 hit.binlevel500000.num79-33.bam
    -rw-rw-rw- 1 syoung root  97M Jan 27 15:37 hit.binlevel500000.num80-33.bam
    -rw-rw-rw- 1 syoung root 109M Jan 27 15:37 hit.binlevel500000.num81-33.bam
    -rw-rw-rw- 1 syoung root  73M Jan 27 15:36 hit.binlevel500000.num82-33.bam
    -rw-rw-rw- 1 syoung root  92M Jan 27 15:37 hit.binlevel500000.num83-33.bam
    -rw-rw-rw- 1 syoung root  88M Jan 27 15:37 hit.binlevel500000.num84-33.bam
    -rw-rw-rw- 1 syoung root  92M Jan 27 15:37 hit.binlevel500000.num85-33.bam
    -rw-rw-rw- 1 syoung root  63M Jan 27 15:36 hit.binlevel500000.num86-33.bam
    -rw-rw-rw- 1 syoung root  85M Jan 27 15:37 hit.binlevel500000.num87-33.bam
    -rw-rw-rw- 1 syoung root  56M Jan 27 15:36 hit.binlevel500000.num88-33.bam
    -rw-rw-rw- 1 syoung root  76M Jan 27 15:37 hit.binlevel500000.num89-33.bam
    -rw-rw-rw- 1 syoung root  49M Jan 27 15:36 hit.binlevel500000.num90-33.bam
    -rw-rw-rw- 1 syoung root  70M Jan 27 15:37 hit.binlevel500000.num91-33.bam
    -rw-rw-rw- 1 syoung root  76M Jan 27 15:37 hit.binlevel500000.num92-33.bam
    -rw-rw-rw- 1 syoung root  43M Jan 27 15:36 hit.binlevel500000.num93-33.bam
    -rw-rw-rw- 1 syoung root  71M Jan 27 15:37 hit.binlevel500000.num94-33.bam
    -rw-rw-rw- 1 syoung root  68M Jan 27 15:37 hit.binlevel500000.num95-33.bam
    -rw-rw-rw- 1 syoung root 146M Jan 27 15:37 hit.binlevel500000.num96-33.bam
    -rw-rw-rw- 1 syoung root  52M Jan 27 15:36 hit.binlevel500000.num97-33.bam
    -rw-rw-rw- 1 syoung root  38M Jan 27 15:36 hit.binlevel500000.num98-33.bam
    -rw-rw-rw- 1 syoung root 186M Jan 27 15:38 hit.binlevel500000.num99-33.bam





ELAND V BOWTIE
--------------

INPUT FILES TO SNPVENN.pl

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-33.sav

    -rw-rw-rw- 1 syoung root 14K Jan 20 15:59 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-33.sav

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit.binlevel500000.num44-1.sav

    -rw-rw-rw- 1 syoung root 101K Jan 17 04:29 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit.binlevel500000.num44-1.sav


RUN LOOP:

/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/syoung/0.5/bin/apps/venn/SNPVENN.pl \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/elandbowtie \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel bowtie-%REPLICATE%-dbsnp \
--binlevel 500000 \
--suffix sav \
--queryindex %REPLICATE% \
--targetindex %REPLICATE% \
--filename hit.bam \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24


LOOP REPLICATE 1:

/nethome/syoung/0.5/bin/apps/venn/SNPVENN.pl \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/elandbowtie \
--querylabel eland-1-dbsnp \
--targetlabel bowtie-1-dbsnp \
--binlevel 500000 \
--suffix sav \
--queryindex 1 \
--targetindex 1 \
--filename hit.bam \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24



WHICH RUNS:

/nethome/syoung/0.5/bin/apps/venn/snpToVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-1.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-33.sav \
--querylabel eland-1-dbsnp \
--targetlabel eland-33-dbsnp \
--prefix hit.binlevel500000.num44. \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn


OUTPUT:

    
    Venn::Snp::compare    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn/hit.binlevel500000.num44.eland-1-dbsnp-NOT-eland-33-dbsnp.sav
    Venn::Snp::compare    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn/hit.binlevel500000.num44.eland-33-dbsnp-NOT-eland-1-dbsnp.sav
    Venn::Snp::compare    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn/hit.binlevel500000.num44.eland-1-dbsnp-AND-eland-33-dbsnp.sav

    OK!!!
    


</entry>
<entry [Sun Jan 23 12:46:23 EST 2011] CREATED ELANDcheck.pl, MAQcheck.pl, BOWTIEcheck.pl AND NOVOALIGNcheck.pl TO CHECK FOR MISSING OR DUBIOUS OUTPUT FILES>

/nethome/syoung/0.5/bin/apps/aligners/ELANDcheck.pl \
--replicates 1-33 \
--inputtype fastq \
--label eland \
--cluster LSF \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland \
--min 0.5 \
--max 2

    ------------------------------------------------------------
    ---[completed eland: 1 ]---
    32 dubious files:
    lowerbound      upperbound      sizemultiple    averagesize     filesize        location
    62704655(3 SDs) 64212360 (3 SDs)        1.01325751962898        63458507        64299810        /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/2/chr22/42/out.sam
    62704798(3 SDs) 64211514 (3 SDs)        1.01319286987336        63458156        64295352        /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/3/chr22/42/out.sam
    ...
    62705141(3 SDs) 64213752 (3 SDs)        1.01345594666347        63459447        64313354        /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/33/chr22/42/out.sam
    
    ------------------------------------------------------------
    


</entry>
<entry [Mon Jan 17 00:26:47 EST 2011] FIXED ERROR RUNNING bamToSav.pl ERROR DUE TO VERSION MISMATCH BETWEEN DBI AND DBD::SQLite>

PROBLEM: 'Can't locate loadable object for module DBD::SQLite' ERROR WHEN DOING use DBD::SQLite ON PEGASUS


SOLUTION:

1. use lib IN bamToSav.pl WITH PATH TO DBI v1.609

use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";

***AND*** INSERT BEGIN BLOCK INTO bamToSav.pl WITH PATH TO DBI v1.609 

BEGIN {    
    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
}


2. RUN bamToSav.pl

/nethome/syoung/0.5/bin/apps/snp/SAV.pl "--binlevel" "500000" "--filename" "hit.bam" "--inputdirs" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1" "--outputdir" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative" "--tempfile" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/snp130" "--referencedir" "/nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22" "--dbsnp" "snp130" "--species" "human" "--maxjobs" "2000" "--queue" "small" "--cluster" "LSF" "--walltime" "24" "--stdout" "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/sav-1.out"

	OK


PROCESSES 100 SNPs PER MINUTE:

tail -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/stdout/hit.binlevel500000.num35-1.sav-stdout.txt

	Filter::SNP::annotate    dbsnp: snp130
	Filter::SNP::annotate    dbsnp: snp130
	Filter::SNP::annotate    dbsnp: snp130
	Filter::SNP::annotate    dbsnp: snp130
	Filter::SNP::annotate    dbsnp: snp130
	Filter::SNP::annotate    dbsnp: snp130
	Filter::SNP::annotate    dbsnp: snp130
	800 [total 4236] 11-01-17 01:50:09
	900 [total 4236] 11-01-17 01:51:08
	1000 [total 4236] 11-01-17 01:52:04
	1100 [total 4236] 11-01-17 01:52:55


	

NOTES
-----


TEST SCRIPT: testSQLite.pl

	use strict;
	
	use FindBin qw($Bin);
	use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
	
	#### USE LIBS                                                                                   
	use lib "$Bin/../../../lib";use lib "$Bin/../../../lib/external";
	use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
	
	BEGIN {
	#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";                 
	unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-mu\
	lti";
	#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";                           
	}
	
	use DBD::SQLite;
	
	print "Completed $0\n";


./testSQLite.pl 

	Completed ./testSQLite.pl




USED DBI v1.609 IN COPY OF /usr/lib64/perl5/site_perl WITH WORKING INSTALLATION OF DBD::SQLite


ON AQ-7:

cd /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
perl -e 'use DBD::SQLite'


ON PEGASUS:

cd /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi
perl -e 'use DBD::SQLite'

	DBI version 1.57 required--this is only version 1.52 at DBD/SQLite.pm line 5.
	BEGIN failed--compilation aborted at DBD/SQLite.pm line 5.
	Compilation failed in require at -e line 1.
	BEGIN failed--compilation aborted at -e line 1.



ADDED PATH TO v1.609 IN lib64/site_perl AND CHECKED DBI VERSION:

cd /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi

perl -e 'unshift @INC, "/nethome/syoung/0.5/lib/exte/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi"; require DBI; print DBI->VERSION'
1.609


BUT WHEN DO use DBD::SQLite **FOLLOWING** DBI->VERSION, GET DBI VERSION IS 1.52;

cd /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi

perl -e 'unshift @INC, "/nethome/syoung/0.5/lib/ext/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi"; use DBI; print DBI->VERSION; use DBD::SQLite'

	1.52



CHECKED VERSION OF DBI INSIDE external/perl5-64/site_perl

perl -e 'require DBI; print DBI->VERSION'

	1.52



ADDED PATH TO *-64/site_perl IN BEGIN BLOCK IN snpToSav.pl IN ORDER TO MAKE IT READ v1.609 OF DBI

BEGIN {    
#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";   
}


BUT STILL GOT ERROR



perl -e 'unshift @INC, "/nethome/syoung/0.5/lib/ext/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi"; require DBI; print DBI->VERSION'

	1.609
	


BUT WHEN ALSO ADDED use lib OF THIS PATH, IT WORKED!!



TEST ON COMMAND LINE
--------------------

ADDING JUST THE use lib OR ADDED PATH TO THE FRONT OF @INC GIVES THE SAME ERROR:

cd /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi

perl -e 'unshift @INC, "/nethome/syoung/0.5/lib/ext/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi"; require DBI; print DBI->VERSION; use DBD::SQLite'

	DBI version 1.57 required--this is only version 1.52 at DBD/SQLite.pm line 5.
	BEGIN failed--compilation aborted at DBD/SQLite.pm line 5.
	Compilation failed in require at -e line 1.
	BEGIN failed--compilation aborted at -e line 1.


BUT WHEN USE BEGIN BLOCK, THE RIGHT VERSION 1.609 OF DBI IS FOUND:

perl -e 'use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
BEGIN {  unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi"; } require DBI; print DBI->VERSION; use DBD::SQLite'

1.609


</entry>
<entry [Fri Jan 14 09:06:13 EST 2011] CREATED copySplitfiles.pl TO COPY/LINK TO EXISTING SPLITFILES>

GENERATES splitfile.txt AND SPLIT FILE SUBDIRS IN TARGET DIRECTORY

/nethome/syoung/0.5/bin/apps/aligners/copySplitfiles.pl \
--source /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie \
--target /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign \
--mode link

    Cluster.pl    Run time: 00:04:39
    Cluster.pl    Completed /nethome/syoung/0.5/bin/apps/aligners/copySplitfiles.pl
    Cluster.pl    11-01-14 11:03:10
    Cluster.pl    ****************************************


NOTE: WHEN YOU RUN ALIGNMENTS USING THIS YOU HAVE TO MAKE SURE THAT THE --label ARGUMENT
IS THE SAME.

I.E., IF THE SOURCE USES:

--label bowtie-%REPLICATE% \

THEN THE TARGET MUST USE:

--label novoalign-%REPLICATE% \


</entry>
<entry [Fri Jan 14 09:06:13 EST 2011] LOCK FILES TO HANDLE PROBLEM OF MISSING OUTPUT FILES (EMPTY ALIGNMENT DIRECTORIES) >

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/ELAND.pl \
--check \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.sequence.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chrX \
--outputdir /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1 \
--inputtype fastq \
--species human \
--label eland-200bp-1 \
--maxjobs 1000 \
--walltime 24 \
--queue small \
--cluster LSF \
--cpus 1 \
--reads 1000000



SOLUTION:

    1) USE LOCKFILES TO DETERMINE WHETHER FILES ARE STILL BEING WRITTEN TO

    2) GET bacct FOR FAILED JOBS WHERE NO OUTPUT FILES ARE FOUND




1. LOCK FILES
-------------

ADD A LOCK FILE IN *sh SCRIPT BEFORE JOB PROCESSING AND REMOVE AFTER COMPLETED

NB: THIS DOES NOT GUARANTEE THAT THE JOB ACTUALLY FULLY COMPLETED PROCESSING, ONLY THAT IT STOPPED



2. JOB ACCOUNTING FOR MISSING FILES
-----------------------------------


GET INFO ON ALL JOBS THAT EXITED (DID NOT COMPLETE NORMALLY) AND PARSE:

bacct -e -l > exited-jobs.txt



OR JUST LOOK UP bacct INFO FOR A PARTICULAR JOB:


    Accounting information about this job:
         Share group charged < /syoung>
         CPU_T     WAIT     TURNAROUND   STATUS     HOG_FACTOR    MEM    SWAP
          0.01        7              8     exit         0.0011     2M     23M
    ------------------------------------------------------------------------------
    
    Job < 2342851[24]>, Job Name < ELAND-chrX[24]>, User < syoung>, Project < default>,
                         Status < EXIT>, Queue < small>, Command < /scratch/syoung/bas
                         e/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland
                         X/19/chrX/ELAND-chrX.sh>, Share group charged < /syoung>
    Fri Dec 10 14:55:51: Submitted from host < u01>, CWD < /scratch/syoung/base/pipel
                         ine/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX/19/ch
                         rX>, Output File < /scratch/syoung/base/pipeline/SRA/NA1850
                         7/SRP000239/sampled/200bp/chr22/elandX/19/chrX/%I/ELAND-ch
                         rX-stdout.txt>;
    Fri Dec 10 14:55:54:  [24] dispatched to < n0081>;
    Sat Dec 11 15:06:15: Completed < exit>; TERM_RUNLIMIT: job killed after reaching
                          LSF run time limit.





3. CHECK IF FILE IS BEING WRITTEN TO
------------------------------------

flock DOESN'T WORK, NO OTHER PORTABLE WAYS


http://www.perlmonks.org/?node_id=457440

QUESTION: Are there any modules or else that can check if a file is being written to, without using flock ?

ANSWER: There's no good portable way to check if a file is being modified by someone else, especially if you're dealing with network mounted filesystems of any flavor. (And no, lsof isn't a good portable way, but you might check its man page if it's available anyway.)

The most secure method would be to centralize all read-write responsibilities to one process, such as a daemon. That's what databases are: one process that can manipulate the files in a centralized way.

Barring that, you'll have to erect some systems involving baling wire and twine. Er, I mean chmod, rename and/or creating/unlinking auxiliary files. The only benefit to these operations is that they are, for the most part, atomic on all useful filesystems.

As for flock(), it's not even guaranteed to work. It's a "suggestion" or "advisory" and not a stable effective lock. If it works, great, but don't count on it working in all situations.



4. stat
-------

http://www.perlmonks.org/bare/?node_id=70173

If you think the file is being written to as you work with it, you can always use stat to get the modify time of a file before and after some point in time; if it's different, you know the file's been written to.

But if the other program has the file opened, but is idling and not writing anything, you won't be able to detect this.


5. lsof
-------

CAN'T USE lsof TO DETERMINE OPEN FILES OVER NFS

lsof MAN PAGE
http://www.netadmintools.com/html/lsof.man.html

Generally lsof can only report on locks held by local processes on local files. When a local process sets a lock on a remotely mounted (e.g., NFS) file, the remote server host usually records the lock state. 







MAQ MANUAL GIVES TIMINGS FOR 1 MILLION PAIRS OF READS (2 MILLION READS)
----------------------------------------------------------------------

http://maq.sourceforge.net/maq-manpage.shtml

    Fast align Illumina/SOLiD reads to the reference genome.
    With the default options, one million pairs of reads can be mapped to the
    human genome in about 10 CPU hours with less than 1G memory.


DESCRIPTION

Maq is a software that builds mapping assemblies from short reads generated by the next-generation sequencing machines. It is particularly designed for Illumina-Solexa 1G Genetic Analyzer, and has a preliminary functionality to handle AB SOLiD data.
With Maq you can:
o	 Fast align Illumina/SOLiD reads to the reference genome. With the default options, one million pairs of reads can be mapped to the human genome in about 10 CPU hours with less than 1G memory.
o	 Accurately measure the error probability of the alignment of each individual read.
o	 Call the consensus genotypes, including homozygous and heterozygous polymorphisms, with a Phred probabilistic quality assigned to each base.
o	 Find short indels with paired end reads.
o	 Accurately find large scale genomic deletions and translocations with paired end reads.
o	 Discover potential CNVs by checking read depth.
o	 Evaluate the accuracy of raw base qualities from sequencers and help to check the systematic errors.
However, Maq can NOT:
o	 Do de novo assembly. (Maq can only call the consensus by mapping reads to a known reference.)
o	 Map shorts reads against themselves. (Maq can only find complete overlap between reads.)
o	 Align capillary reads or 454 reads to the reference. (Maq cannot align reads longer than 63bp.)


MAQ MANUAL ALSO MENTIONS NEED 40X COVERAGE TO USE RECOMMENDED INDEL FILTER:

indelsoa	maq indelsoa in.ref.bfa in.aln.map > out.indelsoa

Call potential homozygous indels and break points by detecting the abnormal alignment pattern around indels and break points. The output is also TAB delimited with each line consisting of chromosome, approximate coordinate, length of the abnormal region, number of reads mapped across the position, number of reads on the left-hand side of the position and number of reads on the right-hand side. The last column can be ignored.

The output contains many false positives. A recommended filter could be:

  awk ’$5+$6-$4 >= 3 && $4 < = 1’ in.indelsoa

Note that this command does not aim to be an accurate indel detector, but mainly helps to avoid some false positives in substitution calling. In addition, it only works well given deep depth (~40X for example); otherwise the false negative rate would be very high.




< /entry>



<entry [Thu Jan 13 13:09:44 EST 2011] PROBLEM: LSF::Job MODULE GAVE THIS ERROR>

[Thu Jan 13 13:03:58 2011] BOWTIE.pl: Use of uninitialized value in print at /nethome/syoung/0.5/bin/apps/aligners/../../../lib/external/LSF/Job.pm line 68, <FILE> line 20.

SOLUTION:

EDIT AS FOLLOWS:

emacs /nethome/syoung/0.5/bin/apps/aligners/../../../lib/external/LSF/Job.pm

    #$idx = 1 if $self->LSF =~ /^4/;   
    $idx = 1 if defined $self->LSF and $self->LSF =~ /^4/;


ALSO, FOR REFACTORING OF Monitor::LSF (PUT PBS-RELATED CODE INTO Monitor::PBS), CHECK USE OF JOB ENVIRONMENT VARIABLES (FOR JOB NUMBER AND NUMBER OF TASKS) ON COMMAND LINE:

PBS_TASKNUM
PBS_ARRAYID


NB: NOT SURE IF PBS_ARRAYID WORKED ON KRONOS!!!



LATER: DO SOMETHING ABOUT USAGE - JUST IN CASE CAN'T RELY
UPON SYSTEM SETTINGS TO OUTPUT USAGE STATS AT END OF RUN

print SHFILE qq{
	/usr/bin/printenv
};

   # NB: bhist OUTPUT TOO BASIC:
   #print SHFILE qq{`bhist \$LSB_JOBID > $usagefile`;


NOTES
-----

PBS ARRAY JOB ENVIRONMENT VARIABLES
http://www.clusterresources.com/torquedocs21/2.1jobsubmission.shtml

2.1.6 Exported Batch Environment Variables
When a batch job is started, a number of variables are introduced into the job's environment that can be used by the batch script in making decisions, creating output files, and so forth. These variables are listed in the following table:

Variable	Description
PBS_JOBNAME	user specified jobname
PBS_ARRAYID	zero-based value of job array index for this job (in version 2.2.0 and later)
PBS_O_WORKDIR	job's submission directory
PBS_ENVIRONMENT	N/A
PBS_TASKNUM	number of tasks requested
PBS_O_HOME	home directory of submitting user
PBS_MOMPORT	active port for mom daemon
PBS_O_LOGNAME	name of submitting user
PBS_O_LANG	language variable for job
PBS_JOBCOOKIE	job cookie
PBS_NODENUM	node offset number
PBS_O_SHELL	script shell
PBS_O_JOBID	unique pbs job id
PBS_O_HOST	host on which job script is currently running
PBS_QUEUE	job queue
PBS_NODEFILE	file containing line delimited list on nodes allocated to the job
PBS_O_PATH	path variable used to locate executables within job script


</entry>
<entry [Mon Dec 13 21:49:32 EST 2010] RUN MISSING FILES IN BOWTIE-NOVOALIGN AND BOWTIE-ELAND snpVenn.pl>

RERUNNING ELAND-BOWTIE snpVenn.pl

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-2.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-2.sav \
--querylabel eland-2 \
--targetlabel bowtie-2 \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/eland-bowtie
    
    snpVenn.pl    Run time: 01:20:07
    snpVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl
    snpVenn.pl    0:43AM, 14 December 2010
    snpVenn.pl    ****************************************



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/snp/bowtie-novoalign


CLEANUP ELAND X:


/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs,splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/elandX \
--references chrX



MOVING FOLDERS TO /ngs/bioinfo

ON u03

FOLDER      RUNNING
maq         Wed Dec 15 15:18:52 EST 2010
bowtie-rf   Wed Dec 15 15:18:52 EST 2010
eland(cum4) DONE 
elandX      DONE


</entry>
<entry [Mon Dec 13 11:25:35 EST 2010] RUN SAV.pl AND unbin.pl ON ELAND FILE 2>

screen -S eland-sav-2

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--binlevel 2 \
--filename hit.bam \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/2 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3 \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/snp130-2 \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24

    SAV.pl    Run time: 00:19:29
    SAV.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl
    SAV.pl    10-12-13 12:38:44
    SAV.pl    ****************************************



perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl \
--binlevel 2 \
--suffix sav \
--filename hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3 \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/2 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000

    unbin.pl    Run time: 00:00:34
    unbin.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/unbin.pl
    unbin.pl    8:21PM, 13 December 2010
    unbin.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22

    -rw-rw-rw- 1 syoung root  1.9M Dec 13 20:20 hit-2.sav


WHICH ARE MUCH LARGER THAN THE PREVIOUS hit-2.sav FILE:

ll -tr *sav.bkp

    -rw-rw-r-- 1 syoung root 212K Dec 13 11:18 hit-2.sav.bkp




NOTES
-----

CUMULATIVE hit-2.sav FILE MUCH SMALLER THAN EXPECTED SO PROBABLY TRUNCATED DUE TO FORMAT ERROF IN hit*-2.snp FILE (DUE TO MULTIPLE PROCESSES WRITING TO FILE AT ONCE?)

c
-rw-rw-rw- 1 syoung root 1.1M Dec  7 01:41 hit-1.sav
-rw-rw-rw- 1 syoung root 212K Dec  7 01:41 hit-2.sav
-rw-rw-rw- 1 syoung root 2.4M Dec  7 01:41 hit-3.sav


NB: CUMULATIVE hit*-2.snp FILE APPEARS NORMAL:

    -rw-rw-r-- 1 syoung root  13K Dec  5 19:09 hit.binlevel2.num15-1.snp
    -rw-rw-rw- 1 syoung root  24K Dec  5 19:09 hit.binlevel2.num15-2.snp
    -rw-rw-rw- 1 syoung root  34K Nov 29 14:35 hit.binlevel2.num15-3.snp
    -rw-rw-rw- 1 syoung root  40K Nov 29 14:37 hit.binlevel2.num15-4.snp
    -rw-rw-rw- 1 syoung root  44K Nov 29 14:39 hit.binlevel2.num15-5.snp
    -rw-rw-rw- 1 syoung root  44K Nov 29 14:41 hit.binlevel2.num15-6.snp
    -rw-rw-rw- 1 syoung root  42K Nov 29 14:44 hit.binlevel2.num15-7.snp
    -rw-rw-rw- 1 syoung root  43K Nov 29 14:48 hit.binlevel2.num15-8.snp
    -rw-rw-rw- 1 syoung root  41K Nov 29 14:53 hit.binlevel2.num15-9.snp
    -rw-rw-rw- 1 syoung root  41K Nov 29 14:58 hit.binlevel2.num15-10.snp
    -rw-rw-rw- 1 syoung root  40K Nov 29 15:03 hit.binlevel2.num15-11.snp
    -rw-rw-rw- 1 syoung root  40K Nov 29 15:09 hit.binlevel2.num15-12.snp
    -rw-rw-rw- 1 syoung root  40K Nov 29 15:18 hit.binlevel2.num15-13.snp
    -rw-rw-rw- 1 syoung root  40K Nov 29 15:26 hit.binlevel2.num15-14.snp
    -rw-rw-rw- 1 syoung root  41K Nov 29 15:35 hit.binlevel2.num15-15.snp
    -rw-rw-rw- 1 syoung root  41K Nov 29 15:42 hit.binlevel2.num15-16.snp
    -rw-rw-rw- 1 syoung root  43K Nov 29 15:50 hit.binlevel2.num15-17.snp
    -rw-rw-rw- 1 syoung root  44K Nov 29 15:59 hit.binlevel2.num15-18.snp
    -rw-rw-rw- 1 syoung root  43K Nov 29 16:08 hit.binlevel2.num15-19.snp
    -rw-rw-rw- 1 syoung root  42K Nov 29 16:18 hit.binlevel2.num15-20.snp
    -rw-rw-rw- 1 syoung root  42K Nov 29 16:28 hit.binlevel2.num15-21.snp
    -rw-rw-rw- 1 syoung root  41K Nov 29 16:39 hit.binlevel2.num15-22.snp
    -rw-rw-rw- 1 syoung root  39K Nov 29 16:50 hit.binlevel2.num15-23.snp
    -rw-rw-rw- 1 syoung root  37K Nov 29 17:02 hit.binlevel2.num15-24.snp
    -rw-rw-rw- 1 syoung root  38K Nov 29 17:14 hit.binlevel2.num15-25.snp
    -rw-rw-rw- 1 syoung root  38K Nov 29 17:26 hit.binlevel2.num15-26.snp
    -rw-rw-rw- 1 syoung root  37K Nov 29 17:39 hit.binlevel2.num15-27.snp
    -rw-rw-rw- 1 syoung root  37K Nov 29 17:53 hit.binlevel2.num15-28.snp
    -rw-rw-rw- 1 syoung root  38K Nov 29 18:06 hit.binlevel2.num15-29.snp
    -rw-rw-rw- 1 syoung root  38K Nov 29 18:22 hit.binlevel2.num15-30.snp
    -rw-rw-rw- 1 syoung root  40K Nov 29 18:37 hit.binlevel2.num15-31.snp
    -rw-rw-rw- 1 syoung root  40K Nov 29 18:52 hit.binlevel2.num15-32.snp
    -rw-rw-rw- 1 syoung root  41K Nov 29 19:08 hit.binlevel2.num15-33.snp


NB: CUMULATIVE hit*-2.bam FILE APPEARS NORMAL:

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


</entry>
<entry [Mon Dec 13 01:57:14 EST 2010] RUN collateVenn.pl ON ALL SAMPLES AGAINST CORRESPONDING dbSNP SAMPLES>

ELAND
-----

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/sav-dbsnp-v-all/eland-dbsnp-vs-eland.tsv \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel eland-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%


BOWTIE
------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp-v-all/bowtie-dbsnp-vs-bowtie.tsv \
--querylabel bowtie-%REPLICATE%-dbsnp \
--targetlabel bowtie-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%


BOWTIE-RF
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn/sav-dbsnp-v-all/bowtie-rf-dbsnp-vs-bowtie-rf.tsv \
--querylabel bowtie-rf-%REPLICATE%-dbsnp \
--targetlabel bowtie-rf-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%


NOVOALIGN
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp-v-all/novoalign-dbsnp-vs-novoalign.tsv \
--querylabel novoalign-%REPLICATE%-dbsnp \
--targetlabel novoalign-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%


MAQ
---

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn/sav-dbsnp-v-all/maq-dbsnp-vs-maq.tsv \
--querylabel maq-%REPLICATE%-dbsnp \
--targetlabel maq-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%


</entry>
<entry [Mon Dec 13 01:57:14 EST 2010] RUN collateVenn.pl ON ALL dbSNP SAMPLES>

ELAND V MAQ
-----------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-maq/eland-dbsnp-vs-maq-dbsnp.tsv \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel --%REPLICATE%-dbsnp \
--suffix sav \
--replicates 1-33



ELAND v BOWTIE
--------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie/eland-dbsnp-vs-bowtie-dbsnp.tsv \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel bowtie-%REPLICATE%-dbsnp \
--suffix sav \
--replicates 1-33

    
    collateVenn.pl    Run time: 00:00:02
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie/eland-vs-bowtie.tsv --querylabel eland-%REPLICATE%-dbsnp --targetlabel bowtie-%REPLICATE%-dbsnp --suffix sav --replicates 1-33
    collateVenn.pl    1:01PM, 13 December 2010
    collateVenn.pl    ****************************************


ELAND v BOWTIE-RF
-----------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-bowtie-rf/eland-dbsnp-vs-bowtie-rf-dbsnp.tsv \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel bowtie-rf-%REPLICATE%-dbsnp \
--suffix sav \
--replicates 1-33
    

ELAND v NOVOALIGN
-----------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-novoalign/eland-dbsnp-vs-novoalign-dbsnp.tsv \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel novoalign-%REPLICATE%-dbsnp \
--suffix sav \
--replicates 1-33

    collateVenn.pl    Run time: 00:00:01
    collateVenn.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl --outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn-dbsnp/eland-novoalign/eland-dbsnp-vs-novoalign-dbsnp.tsv --querylabel eland-%REPLICATE%-dbsnp --targetlabel novoalign-%REPLICATE%-dbsnp --suffix sav --replicates 1-33
    collateVenn.pl    1:03PM, 13 December 2010
    collateVenn.pl    ****************************************


ELAND
-----

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn-dbsnp/sav-dbsnp/eland-dbsnp-vs-eland-33-dbsnp.tsv \
--querylabel eland-33-dbsnp \
--targetlabel eland-%REPLICATE%-dbsnp \
--suffix sav \
--replicates 1-33


BOWTIE
------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn-dbsnp/sav-dbsnp/bowtie-dbsnp-vs-bowtie-33-dbsnp.tsv \
--querylabel bowtie-33-dbsnp \
--targetlabel bowtie-%REPLICATE%-dbsnp \
--suffix sav \
--replicates 1-33


BOWTIE-RF
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn-dbsnp/sav-dbsnp/bowtie-rf-dbsnp-vs-bowtie-rf-33-dbsnp.tsv \
--querylabel bowtie-rf-33-dbsnp \
--targetlabel bowtie-rf-%REPLICATE%-dbsnp \
--suffix sav \
--replicates 1-33


NOVOALIGN
---------

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn-dbsnp/sav-dbsnp/novoalign-dbsnp-vs-novoalign-33-dbsnp.tsv \
--querylabel novoalign-33-dbsnp \
--targetlabel novoalign-%REPLICATE%-dbsnp \
--suffix sav \
--replicates 1-33


MAQ
---

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn-dbsnp/sav-dbsnp/maq-dbsnp-vs-maq-33-dbsnp.tsv \
--querylabel maq-33-dbsnp \
--targetlabel maq-%REPLICATE%-dbsnp \
--suffix sav \
--replicates 1-33


</entry>
<entry [Mon Dec 13 01:57:14 EST 2010] RUN snpVenn.pl ON ALL SAMPLES AGAINST CORRESPONDING dbSNP SAMPLES>

ELAND
-----

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/sav-dbsnp-v-all

screen -S eland-dbsnp-v-all

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/sav-dbsnp-v-all \
--replicates 1-33 \
--loop distributed \
--label eland-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/sav-dbsnp-v-all \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel eland-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/sav-dbsnp-v-all/vennsav.out

    Run time: 00:18:13
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:18AM, 13 December 2010
    ****************************************


BOWTIE
------

u03

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp-v-all

screen -S bowtie-dbsnp-v-all

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp-v-all \
--replicates 1-33 \
--loop distributed \
--label bowtie-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp-v-all \
--querylabel bowtie-%REPLICATE%-dbsnp \
--targetlabel bowtie-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp-v-all/vennsav.out

    Run time: 04:05:07
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    3:05PM, 13 December 2010
    ****************************************



NOVOALIGN
---------

u03

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp-v-all

screen -S novo-dbsnp-v-all

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp-v-all \
--replicates 1-33 \
--loop distributed \
--label novoalign-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp-v-all \
--querylabel novoalign-%REPLICATE%-dbsnp \
--targetlabel novoalign-%REPLICATE% \
--suffix sav \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp-v-all/vennsav.out
    
    Run time: 01:49:17
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    12:50AM, 13 December 2010
    ****************************************


</entry>




