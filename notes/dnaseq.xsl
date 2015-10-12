dnaseq



<entry [Fri 2015:08:07 09:14:03 EST] ERSA DOWNLOAD AND MANUAL>

http://www.hufflab.org/software/ersa/

ERSA (Estimation of Recent Shared Ancestry) estimates recent shared ancestry between pairs of individuals based on the number and lengths of chromosomal segments that they share identically-by-descent through common ancestors (IBD segments).

Prior to ERSA, established methods were capable of accurately estimating kinship for first-degree through third-degree relatives.

ERSA is accurate to within one degree of relationship for 97% of first-degree through fifth-degree relatives and 80% of sixth-degree and seventh-degree relatives, greatly expanding the range of relationships that can be estimated from genetic data.


... whole-genome sequencing introduces new complexities that must be addressed in order to achieve these improvements.

We developed new methods in ERSA 2.0 to identify and mask genomic regions with excess IBD information in whole-genome sequencing data.

With ERSA 2.0, whole-genome sequencing provides a 5% to 15% increase in relationship detection power relative to high-density microarray data.

We also introduced improvements in ERSA 2.0 to increase relationship detection accuracy for full sibling, avuncular, and direct ancestor-descendant relationships and to provide support for detecting consanguinity.

    
</entry>
<entry [Fri 2015:08:07 09:06:24 EST] Gustavo's ISCA-ERSA>

COMMENT ON WIKI
https://atlassian-itmi.inova.org/confluence/display/BIOIN/QC+results

Jared Roach:

Sure. The particular question is about pairwise relationship detection/estimation, right? We are using ISCA-ERSA for that. We automatically run all Study#101 through our workflow. It is easy to query a particular family. We can also add Study#102 to our list - we were waiting to do that until we had made sure the workflow was bulletproof. We have been mostly looking at relationships between parents, figuring that all parent-child relationships were previously verified (or would otherwise become apparent during result analysis!). But it is also easy to add in parent-child. For our main PTB-association analysis, we are using ISCA-ERSA to get the best sensitivity and accuracy for estimated relationships. So it is "overkill" for detecting first-degree relationships. But it works fine for that purpose as long as there are not more than many thousand comparisons to do. If we were to reach towards a hundred thousand pairwise comparisons, it might be a load even for the SGI.

We can also run our de novo mutation detection tool - ISCA automatically does this for quartets, but we are not saving results. I figured between you and Christian there was no need for me to keep tabs on the MIEs.
For quartets, we are tabulating SCEs. I may have those results as early as today. I have been updating legacy code that was a bit stale. I think I got it all updated yesterday, but have not had time to test it.
The SGI has been a bit busy this last week. Denise Mauldin has been launching a lot of these jobs. They may be complete now.


ISCA-ERSA PAPER

http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3907355/

Relationship Estimation from Whole-Genome Sequence Data
Hong Li,1 Gustavo Glusman,1 Hao Hu,2 Shankaracharya,2 Juan Caballero,1 Robert Hubley,1 David Witherspoon,3 Stephen L. Guthery,4 Denise E. Mauldin,1 Lynn B. Jorde,3 Leroy Hood,1 Jared C. Roach,1 and Chad D. Huff2,*
Peter M. Visscher, Editor

PLoS Genet. 2014 Jan; 10(1): e1004144.
Published online 2014 Jan 30. doi:  10.1371/journal.pgen.1004144
PMCID: PMC3907355

Software

The relationship identification methods described above are implemented in the software package ERSA 2.0, which is freely available for academic use

www.hufflab.org

The software for ISCA is available at

http://familygenomics.systemsbiology.net/software

The pedigree simulation programs are available in

http://caballero.github.io/FakeFamily


</entry>
<entry [Fri 2015:08:07 08:47:59 EST] shantanusharma/vcftools SCRIPT>

Fork of vcftools SourceForge project: vcftools.sourceforge.net

https://github.com/shantanusharma/vcftools/blob/master/trunk/cpp/variant_file_output.cpp

    
</entry>
<entry [Fri 2015:08:07 08:35:27 EST] KING PAPER AND relatedness2 THRESHOLDS>

Relationship	phi	Inference criteria		pi	Interference criteria	
Monozygotic twin	0.50	>	0.3535533906	0	<	0.1
Parent-offspring	0.25	0.1767766953	0.3535533906	0	<	0.1
Full sib	0.25	0.1767766953	0.3535533906	0.25	0.1	0.365
2nd Degree	0.125	0.0883883476	0.1767766953	0.5	0.365	0.6464466094
3rd Degree	0.0625	0.0441941738	0.0883883476	0.75	0.6464466094	0.8232233047
Unrelated	0	<	0.0441941738	1	>	0.8232233047


Manichaikul et al., Bioinformatics 2010 (doi:10.1093/bioinformatics/btq559)


Robust relationship inference in genome-wide association studies.
Manichaikul A1, Mychaleckyj JC, Rich SS, Daly K, Sale M, Chen WM.
Bioinformatics. 2010 Nov 15;26(22):2867-73. doi: 10.1093/bioinformatics/btq559. Epub 2010 Oct 5.


FULL TEXT
http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3025716/


Abstract

MOTIVATION:

Genome-wide association studies (GWASs) have been widely used to map loci contributing to variation in complex traits and risk of diseases in humans. Accurate specification of familial relationships is crucial for family-based GWAS, as well as in population-based GWAS with unknown (or unrecognized) family structure. The family structure in a GWAS should be routinely investigated using the SNP data prior to the analysis of population structure or phenotype. Existing algorithms for relationship inference have a major weakness of estimating allele frequencies at each SNP from the entire sample, under a strong assumption of homogeneous population structure. This assumption is often untenable.

RESULTS:

Here, we present a rapid algorithm for relationship inference using high-throughput genotype data typical of GWAS that allows the presence of unknown population substructure. The relationship of any pair of individuals can be precisely inferred by robust estimation of their kinship coefficient, independent of sample composition or population structure (sample invariance). We present simulation experiments to demonstrate that the algorithm has sufficient power to provide reliable inference on millions of unrelated pairs and thousands of relative pairs (up to 3rd-degree relationships). Application of our robust algorithm to HapMap and GWAS datasets demonstrates that it performs properly even under extreme population stratification, while algorithms assuming a homogeneous population give systematically biased results. Our extremely efficient implementation performs relationship inference on millions of pairs of individuals in a matter of minutes, dozens of times faster than the most efficient existing algorithm known to us.

AVAILABILITY:

Our robust relationship inference algorithm is implemented in a freely available software package, KING, available for download at

http://people.virginia.edu/~wc9c/KING/index.html
http://people.virginia.edu/~wc9c/KING/manual.html


</entry>
<entry [Fri 2015:08:07 08:30:33 EST] KINSHIP SCRIPT>

https://github.com/AshKernow/VariantFilterScripts/blob/master/xExmCheckKinship.sh

SAVED TO

clinical/scripts/xExmCheckKinship.sh
    
</entry>
<entry [Fri 2015:08:07 00:01:09 EST] QC APPLICATION COMMANDS>


Hi Stuart,
 
   Below are the commands (highlighted) and some verbose and outputs:
 
1) flagstat command and/or outputs:
 
/usr/bin/time -o ./flagstat.usage -f "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k" \
/a/apps/samtools/0.1.19/samtools flagstat /hpv-results/Unaligned_20groups/Project_TestRunHPV6-10/Sample_FX100ng_16pM/FX100ng_16pM_CTTGTA_L001_R1a2_001.aln-pe.sorted.bam > FX100ng_16pM_CTTGTA_L001_R1a2_001_flagstat.txt
 
ubuntu@ip-10-231-194-243:/hpv-results/Unaligned_20groups/Project_TestRunHPV6-10/Sample_FX100ng_16pM$ cat flagstat.usage
39.31user 0.49system 0:39.84elapsed 99%CPU (0text+0data 1116max)k
 

ubuntu@ip-10-231-194-243:/hpv-results/Unaligned_20groups/Project_TestRunHPV6-10/Sample_FX100ng_16pM$ cat FX
100ng_16pM_CTTGTA_L001_R1a2_001_flagstat.txt
43321345 + 0 in total (QC-passed reads + QC-failed reads)
0 + 0 duplicates
43060409 + 0 mapped (99.40%:-nan%)
43321345 + 0 paired in sequencing
21629250 + 0 read1
21692095 + 0 read2
40873784 + 0 properly paired (94.35%:-nan%)
43009622 + 0 with itself and mate mapped
50787 + 0 singletons (0.12%:-nan%)
1682412 + 0 with mate mapped to a different chr
1072763 + 0 with mate mapped to a different chr (mapQ>=5)
 

2) CollectAlignmentSummaryMetrics command and/or outputs:
 
/usr/bin/time -o ./ColAliSumMet.usage -f "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k" \
java -Xmx4g -Xms4g -jar /a/apps/picard/1.103/CollectAlignmentSummaryMetrics.jar \
METRIC_ACCUMULATION_LEVEL=ALL_READS \
INPUT=./FX100ng_16pM_CTTGTA_L001_R1a2_001.aln-pe.sorted.bam \
OUTPUT=dtCASM.txt \
REFERENCE_SEQUENCE=/data/reference/hpv/ucsc.hg19.hpv16.indexed.fasta \
VALIDATION_STRINGENCY=LENIENT
 
ubuntu@ip-10-231-194-243:/hpv-results/Unaligned_20groups/Project_TestRunHPV6-10/Sample_FX100ng_16pM$ cat ColAliSumMet.usage
378.31user 23.14system 5:32.56elapsed 120%CPU (0text+0data 4168696max)k
 
3) CollectInsertSizeMetrics command and/or outputs:
 
/usr/bin/time -o ./ColInsSizMet.usage -f "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k" \
java -Xmx4g -jar /a/apps/picard/1.103/CollectInsertSizeMetrics.jar \
VALIDATION_STRINGENCY=LENIENT \
HISTOGRAM_FILE= FX100ng_16pM_CTTGTA_L001_R1a2_001.aln-pe.sorted.bam_picard_insert_size_plot.pdf \
INPUT= FX100ng_16pM_CTTGTA_L001_R1a2_001.aln-pe.sorted.bam \
OUTPUT= FX100ng_16pM_CTTGTA_L001_R1a2_001.aln-pe.sorted.bam_picard_insert_size_metrics.txt
 
ubuntu@ip-10-231-194-243:/hpv-results/Unaligned_20groups/Project_TestRunHPV6-10/Sample_FX100ng_16pM$ cat ColInsSizMet.usage
122.03user 3.94system 1:58.40elapsed 106%CPU (0text+0data 1411112max)k
 

 
 
4) vcfhethomratio command and/or outputs:
 
Without ‘sudo’:
ubuntu@ip-10-231-194-243:/a/apps/vcflib/latest/bin$ /a/apps/vcflib/latest/bin/vcfhethomratio /data/bam/WGSQC20150004/WGSQC20150004.haplotypecaller.snps.indels.vcf
GP1
0.901704
 
5) TsTv-summary command and/or outputs:
 
ubuntu@ip-10-231-194-243:/data/bam/WGSQC20150004$ /usr/bin/time -o /a/apps/TsTv.usage -f "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k" sudo /a/apps/vcftools/latest/bin/vcftools --vcf WGSQC20150004.haplotypecaller.snps.indels.vcf --TsTv-summary --out WGSQC20150004.haplotypecaller.snps.indels
 
ubuntu@ip-10-231-194-243:/data/bam/WGSQC20150004$ cat TsTv.usage
0.75user 0.01system 0:00.77elapsed 100%CPU (0text+0data 2212max)k
 
6) converting SAM to BAM:
 
/a/apps/samtools/0.1.19/samtools view -bT /data/reference/hpv/ucsc.hg19.hpv16.indexed.fasta  GS_09_100ng_AGTTCC_L1to8_R1a2_001.aln-pe.sam >  GS_09_100ng_AGTTCC_L1to8_R1a2_001.aln-pe.bam
 
7) sorting a BAM file:
 
/usr/bin/time -o ./sortbam.usage -f "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k" \
/a/apps/samtools/0.1.19/samtools sort GS_09_100ng_AGTTCC_L1to8_R1a2_001.aln-pe.bam GS_09_100ng_AGTTCC_L1to8_R1a2_001.aln-pe.sorted
 
ubuntu@ip-10-231-194-243:/hpv-results2/Unaligned_2015-07-17_HPV1-10ARun4/Project_DefaultProject/Sample_GS_09_100ng$ cat sortbam.usage
936.75user 66.80system 16:44.82elapsed 99%CPU (0text+0data 1213720max)k
 
8) indexing a sorted BAM file:
 
/usr/bin/time -o ./indexbam.usage -f "%Uuser %Ssystem %Eelapsed %PCPU (%Xtext+%Ddata %Mmax)k" \
/a/apps/samtools/0.1.19/samtools index GS_09_100ng_AGTTCC_L1to8_R1a2_001.aln-pe.sorted.bam
 
ubuntu@ip-10-231-194-243:/hpv-results2/Unaligned_2015-07-17_HPV1-10ARun4/Project_DefaultProject/Sample_GS_09_100ng$ cat indexbam.usage
51.42user 0.89system 0:52.32elapsed 99%CPU (0text+0data 18272max)k
 
9) select aligned reads based on flags from a sorted BAM file:
 
/a/apps/samtools/0.1.19/samtools view –f 0x800 GS_09_100ng_AGTTCC_L1to8_R1a2_001.aln-pe.sorted.bam
 
10) Need to 'make' and 'export' every new automated install package:
 
sudo /a/bin/cli/biorepo --mode install --package plink --log 4
sudo make
export PATH=$PATH:/a/apps/plink/plink-1.07-x86_64
putting ‘export’ as above should work in the ~.profile file, since it works on the command line.
 
Installed blink from source plink-1.07-src.zip , linux binary plink-1.07-x86_64.zip, and debian [plink_1.07-6.debian.tar.xz], and plink_1.07-6_amd64 amd64.  Only the plink-1.07-x86_64 works.  The source compilation gives error.  The debian no install or make file at all; some issue with name clashing.
 
11) --mendel:
 
  523  sudo /a/apps/vcftools/latest/bin/vcftools --vcf ./test_trios.vcf --mendel ./test_trios.manifest2.ped
 
 
Use summary(data.table object) to summarize counts of MIE snps from  --mendel. 
 
> x <- read.table("/mendel/MendelFiles/out.mendel"
+ )
> summary(x)
       V1                  V2                V3               V4
chr1   : 271761   90758054 :     11   C      :858049   T      :798201
chr2   : 258463   107563618:     10   G      :845400   A      :797045
chr4   : 243251   10799849 :     10   A      :746376   C      :724184
chr3   : 219175   119565218:     10   T      :745814   G      :721809
chr6   : 210732   120838903:     10   CT     :  5359   C,A    : 10224
chr5   : 205924   122297925:     10   CA     :  5285   A,T    :  9622
(Other):1926916   (Other)  :3336161   (Other):129939   (Other):275137
                                                     V5
LP6005644-DNA_F03_LP6005644-DNA_E03_LP6005644-DNA_D03:1507971
LP6005599-DNA_A02_LP6005599-DNA_H01_LP6005599-DNA_A01:1303573
LP6005599-DNA_B09_LP6005599-DNA_A09_LP6005599-DNA_H08:  70363
LP6005599-DNA_D02_LP6005599-DNA_C02_LP6005599-DNA_B02:  66592
LP6005599-DNA_A08_LP6005599-DNA_H07_LP6005599-DNA_G07:  66165
LP6005599-DNA_B12_LP6005599-DNA_A12_LP6005599-DNA_H11:  66128
(Other)                                              : 255430
       V6                V7                V8
0/1    :1799007   0/0    :1933932   0/0    :2046652
0/0    : 698321   1/1    : 839793   1/1    : 943337
1/1    : 689059   0/1    : 428604   0/1    : 237875
2/2    :  42849   2/2    :  41011   2/2    :  29315
0/2    :  35553   0/2    :  25114   0/2    :  16718
0/3    :  11110   0/3    :  10389   1/2    :  16026
(Other):  60323   (Other):  57379   (Other):  46299
> 
 
--mendel filter for MIE snps and list them.  Above is summary.
 
12) --relatedness and --relatedness2
 
630  export PATH=$PATH:/a/apps/vcftools/latest
 
    660  sudo /a/apps/vcftools/latest/bin/vcftools --vcf test_trios.vcf --relatedness  --out test_trios
  661  sudo /a/apps/vcftools/latest/bin/vcftools --vcf test_trios.vcf --relatedness2  --out test_trios
 
--relatedness2 does NOT need a ped file!!  May work with non-merged gvcf??  Does NOT need the genotype quality (PL) field like MendelChecker.
 
--relatedness does NOT need ped file either!!
 
13) MendelChecker command and/or output:
 
ubuntu@ip-10-232-153-103:/mendel/MendelFiles$ /a/apps/mendelchecker/MendelChecker/MendelChecker --vcf gatk_test_trios.snps.vcf --ped test_trios.manifest4.ped --sexPrior 0.05
 
Inputs:
VCF file : gatk_test_trios.snps.vcf
Pedigree file : test_trios.manifest4.ped
Genotype probability : PL
Sex-prior alpha : 0.05
Uniform prior : false
Memory allocated for buffer : 1GB
Phred score based genotype quality : true
 
Outputs:
Pedigree likelihoods : gatk_test_trios.snps.vcf.pedigreelikelihoods
SNP scores : gatk_test_trios.snps.vcf.snpScores
 
Compute time :  1990.94 seconds
 
 
ubuntu@ip-10-232-153-103:/mendel/MendelFiles$ head -n 300 gatk_test_trios.snps.vcf > gatk_test_trios.snps300.vcf
ubuntu@ip-10-232-153-103:/mendel/MendelFiles$ /a/apps/mendelchecker/MendelChecker/MendelChecker --vcf gatk_test_trios.snps300.vcf --ped test_trios.manifest4.ped --sexPrior 0.05
 
Inputs:
VCF file : gatk_test_trios.snps300.vcf
Pedigree file : test_trios.manifest4.ped
Genotype probability : PL
Sex-prior alpha : 0.05
Uniform prior : false
Memory allocated for buffer : 1GB
Phred score based genotype quality : true
 
Outputs:
Pedigree likelihoods : gatk_test_trios.snps300.vcf.pedigreelikelihoods
SNP scores : gatk_test_trios.snps300.vcf.snpScores
 
Compute time :  1.24322 seconds
 
 
    
</entry>
<entry [Thu 2015:08:06 04:18:41 EST] ADDED APP FILES AND LOADED USING biorepo>

1. ADDED APP FILES

conf/apps
.
├── align
│   ├── aligncopy.app
│   ├── bwa.app
│   ├── realign.app
│   └── realigntarget.app
├── converter
│   ├── addreadgroups.app
│   ├── baserecalibration.app
│   ├── fixmates.app
│   └── sort.app
├── filter
│   ├── filterreads.app
│   ├── markduplicates.app
│   └── qualityfilter.app
├── index
│   └── indexbam.app
├── printreads
│   └── printreads.app
├── qc
│   └── fastqc.app
└── variant
    └── haplotypecaller.app


2. LOADED WITH biorepo

/a/bin/cli/biorepo --mode install --package dnaseq --log 4 --pmfile /mnt/repos/private/syoung/biorepodev/syoung/dnaseq/dnaseq.pm  --opsfile /mnt/repos/private/syoung/biorepodev/syoung/dnaseq/dnaseq.ops


3. VERIFIED LOADED

select package, count(distinct name) from parameter group by package;
+---------+----------------------+
| package | count(distinct name) |
+---------+----------------------+
| dnaseq  |                   47 |
| emboss  |                  649 |
+---------+----------------------+
2 rows in set (0.01 sec)


select owner, package, count(distinct name) from app group by package;
+-------+---------+----------------------+
| owner | package | count(distinct name) |
+-------+---------+----------------------+
| agua  | dnaseq  |                   15 |
| agua  | emboss  |                  251 |
+-------+---------+----------------------+


    
</entry>
<entry [Sat 2014:09:20 00:08:58 EST] PLAYTERM - LOAD DATA AND RUN VariantSra PROJECT>
    
Project 1  - SRA data, variant calling


export VERSION=0.0.1
cd /a/apps/dnaseq/$VERSION/conf/sra/variant
/a/bin/cli/flow deleteProject --project VariantSra --username admin
/a/bin/cli/flow addProject --project VariantSra --username admin
/a/bin/cli/flow addWorkflow --project VariantSra --wkfile 1-Aspera.work --username admin
/a/bin/cli/flow addWorkflow --project VariantSra --wkfile 2-SraToBam.work --username admin
/a/bin/cli/flow addWorkflow --project VariantSra --wkfile 3-IndexBam.work --username admin
/a/bin/cli/flow addWorkflow --project VariantSra --wkfile 4-FreeBayes.work --username admin



    
</entry>
<entry [Wed 2014:09:17 15:01:46 EST] DOWNLOAD SRA FILE WITH wget>

SRA MANUAL FTP SITE:

ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads



ASPERA COMMAND

/agua/apps/aspera/3.3.3.81344/bin/ascp -i /agua/apps/aspera/3.3.3.81344/etc/asperaweb_id_dsa.openssh  -l200m anonftp@ftp-private.ncbi.nlm.nih.gov:sra/sra-instant/reads/ByRun/sra/SRR/SRR645/SRR645668/SRR645668.sra  /data/sra/aspera/SRR645668/SRR645668.sra

WGET COMMAND

Cancer

wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR645/SRR645665/SRR645665.sra
wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR645/SRR645666/SRR645666.sra
wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR645/SRR645667/SRR645667.sra


Normal

wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR645/SRR645668/SRR645668.sra
wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR645/SRR645669/SRR645669.sra
wget ftp://ftp-trace.ncbi.nih.gov/sra/sra-instant/reads/ByRun/sra/SRR/SRR645/SRR645670/SRR645670.sra
    
</entry>
<entry [Wed 2014:09:17 12:11:19 EST] ADDED cleardb COMMAND TO .profile>

mq -NBe "delete from workflow"
mq -NBe "delete from project"
mq -NBe "delete from stage"
mq -NBe "delete from stageparameter"
mq -NBe "delete from cluster"
mq -NBe "delete from clusterworkflow"
mq -NBe "delete from instancetype"
mq -NBe "delete from clustervars"

    
</entry>
<entry [Tue 2014:09:16 21:42:15 EST] SRA SMALLEST SAMPLES>


syoung	RunSRA	LoadSamples	1	SRR645665	SAMN01882268	WXS	B80_Cancer	SRS383295	HUMistXENAAAPEI-9	432	270	completed
syoung	RunSRA	LoadSamples	1	SRR645666	SAMN01882268	WXS	B80_Cancer	SRS383295	HUMistXENAAAPEI-9	2828	1765	completed
syoung	RunSRA	LoadSamples	1	SRR645667	SAMN01882268	WXS	B80_Cancer	SRS383295	HUMistXENAAAPEI-9	2357	1399	completed
syoung	RunSRA	LoadSamples	1	SRR645668	SAMN01882269	WXS	B80_Normal	SRS383296	HUMistXEMAAAPEI-8	658	411	completed
syoung	RunSRA	LoadSamples	1	SRR645669	SAMN01882269	WXS	B80_Normal	SRS383296	HUMistXEMAAAPEI-8	3854	2387	completed
syoung	RunSRA	LoadSamples	1	SRR645670	SAMN01882269	WXS	B80_Normal	SRS383296	HUMistXEMAAAPEI-8	3181	1858	completed


    
</entry>
<entry [Tue 2014:09:16 19:51:58 EST] TOOK SMALLEST TWO SAMPLES FROM LIST OF TCGA 10 SMALLEST SAMPLES>

1. TCGA 10 SMALLEST SAMPLES

0cab7a33-7a92-4f6b-85bb-31d2d80bbe6b	C500.TCGA-FD-A5BR-10A-01D-A26K-08.5.bam	4641428249
43eb46f0-ede5-4870-82a7-16f27872ac7f	C500.TCGA-FD-A43Y-10A-01D-A26K-08.3.bam	4715481967
### f14c68e9-4721-43a2-bb98-2a2c419d0338	C500.TCGA-E7-A519-01A-11D-A26M-08.4.bam	4822749956
bdcb1d7c-06b6-4e67-957a-85d8aa705a53	C500.TCGA-FD-A5BS-01A-21D-A26M-08.4.bam	4827637613
42103adc-f82e-48af-be2b-8addc02e5da6	C500.TCGA-K4-A4AC-01A-21D-A26M-08.4.bam	4842790057
023d2318-c291-4a37-823c-7fb3d15f65e9	C500.TCGA-CF-A47S-01A-11D-A23U-08.5.bam	4842853786
1bf522c5-1a53-441a-91ff-bc7494d587c4	C500.TCGA-HQ-A2OF-10B-01D-A26K-08.3.bam	4885271217
261667e2-bd8b-4972-9507-089097f98211	C500.TCGA-MV-A51V-10A-01D-A26K-08.6.bam	4939335760
124f6aaa-d9f1-4c60-a54b-f967942064de	C500.TCGA-BT-A42E-01A-11D-A23U-08.5.bam	4971556516
1ed49b35-ad21-4af5-be59-b2fc91a7a0c6	C500.TCGA-FD-A5BV-01A-11D-A26M-08.3.bam	5051621451


2. EXTRACT INFO FOR SMALLEST TWO SAMPLES USING GT Tools query

query --querystring "analysis_id=0cab7a33-7a92-4f6b-85bb-31d2d80bbe6b" --outputfile /tmp/0cab7a33-7a92-4f6b-85bb-31d2d80bbe6b.tsv
query --querystring "participant_id=dfdaebd6-e0ab-49d1-9ae9-3a57b3c318b5&library_strategy=WXS" --outputfile /tmp/dfdaebd6-e0ab-49d1-9ae9-3a57b3c318b5.tsv

query --querystring "analysis_id=43eb46f0-ede5-4870-82a7-16f27872ac7f" --outputfile /tmp/43eb46f0-ede5-4870-82a7-16f27872ac7f.tsv 
query --querystring "participant_id=d349fae0-dd40-4292-908c-ac86a9938240&library_strategy=WXS" --outputfile /tmp/d349fae0-dd40-4292-908c-ac86a9938240.tsv


3. MERGE INTO tcgasample.tsv

/a/apps/dnaseq/0.0.1/data/tcga/tsv$ cat tcgasample.tsv 

43eb46f0-ede5-4870-82a7-16f27872ac7f	10	d349fae0-dd40-4292-908c-ac86a9938240	WXS	C500.TCGA-FD-A43Y-10A-01D-A26K-08.3.bam	4715481967
c7e15e30-f722-4bce-85e0-a2e821a2742b	01	d349fae0-dd40-4292-908c-ac86a9938240	WXS	C500.TCGA-FD-A43Y-01A-21D-A26M-08.3.bam	5430278674
2448aea6-3231-4e88-a7d7-6d86b7f30b1e	01	dfdaebd6-e0ab-49d1-9ae9-3a57b3c318b5	WXS	C500.TCGA-FD-A5BR-01A-11D-A26M-08.5.bam	7646169134
0cab7a33-7a92-4f6b-85bb-31d2d80bbe6b	10	dfdaebd6-e0ab-49d1-9ae9-3a57b3c318b5	WXS	C500.TCGA-FD-A5BR-10A-01D-A26K-08.5.bam	4641428249


4. ALSO GENERATE brcasample.tsv FILE

query --querystring "disease_abbr=BRCA&library_strategy=WXS" --outputfile /tmp/brcasample.tsv --log 1



</entry>
<entry [Tue 2014:09:16 02:54:57 EST] BREAST CANCER SAMPLES>

FULL OUTPUT

cd /agua/apps/dnaseq/0.0.1/data/tsv
cgquery  -s https://cghub.ucsc.edu  "disease_abbr=BRCA&library_strategy=WXS" > brca-wxs.txt



SAMPLE COUNTS

cgquery -I -s https://cghub.ucsc.edu -n "disease_abbr=BRCA&library_strategy=WXS"
    Matching Objects                 : 2198


FILE DETAILS

cgquery -I -s https://cghub.ucsc.edu  "disease_abbr=BRCA&library_strategy=WGS"

        downloadable_file_count      : 1106
        downloadable_file_size (TB)  : 62.01
        state_count
            redacted                 : 1
            live                     : 553
            suppressed               : 8
            uploading                : 3
            submitted                : 24

    
</entry>
