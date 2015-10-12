Notes-apps-maq.txt

<entry [Sat 2011:08:13 05:42:43 EST] REMOVED OLD SUBROUTINES FROM MAQ.pm>


=head2

	SUBROUTINE		mapcheck
	
	PURPOSE
			
		GET STATISTICS ABOUT MAQ ALIGNMENTS FOR EACH INPUT FILE CHUNK

		 NB: WATCH THIS: MOVED TO align SUBROUTINE EARLIER BECAUSE GOT 
		 SEGMENTATION FAULT WITH MAP FILE OF 331 MB

=cut

sub mapcheck
{
	my $self			=	shift;
	
my $DEBUG = 1;

	my $splitfiles		=	shift;
	my $referencedir	=	shift;
	my $outputdir		=	shift;

my $DEBUG = 1;
	print "MAQ::maqSnps    MAQ::maqSnps(splitfiles, referencedir, outputdir)\n" if $DEBUG;

	#### SET TIMER
	my $current_time = time();

	#### GET REFERENCE FILES
	my $referencefiles = $self->listReferenceFiles($referencedir, "\*.bfa");
	
	#### GET COMMANDS TO MERGE MAPS AND PREDICT SNPS AND INDELS
	my $snp_jobs = [];
	for my $referencefile ( @$referencefiles )
	{
		my $command =  "time $maq/maq mapcheck $referencefile out.map > mapcheck.txt";
		my $job = $self->setJob( [$command], )
	}
}


    
</entry>

<entry [Fri Feb 12 09:59:25 EST 2010] CREATED MAQ.pl WRAPPER SCRIPT TO RUN MAQ WHILE MANAGING MEMORY DEMANDS>




mkdir -p /p/NGS/syoung/base/pipeline/maq/sample1
cd /p/NGS/syoung/base/pipeline/maq/sample1

perl /nethome/bioinfo/apps/agua/0.4/bin/apps/MAQ.pl \
--convert \
--outputdir /p/NGS/syoung/base/pipeline/maq/sample1 \
--matefile /nethome/bioinfo/data/sequence/demo/maq/inputs/s_1_2_sequence.100000.txt \
--inputfile /nethome/bioinfo/data/sequence/demo/maq/inputs/s_1_1_sequence.100000.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-bfa \
--jobs 30 \
--reads 10000



cd /mihg/users/yedwards/.aqwa/Project1/Workflow1/sample1

perl /nethome/bioinfo/apps/agua/0.4/bin/apps/MAQ.pl \
--convert \
--outputdir /mihg/users/yedwards/.aqwa/Project1/Workflow1/sample1 \
--matefile /nethome/bioinfo/data/sequence/demo/maq/inputs/s_1_2_sequence.100000.txt \
--inputfile /nethome/bioinfo/data/sequence/demo/maq/inputs/s_1_1_sequence.100000.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-bfa \
--jobs 30 \
--reads 10000




</entry>



<entry [Mon Sept 21 20:59:23 EDT 2009] maq export2maq (CONVERT ELAND EXPORT FILE TO out.map) AND maq map (DUMP UNMAPPED READS)>



http://maq.sourceforge.net/maq-manpage.shtml

maq map

-u FILE 	Dump unmapped reads and reads containing more than nmis mismatches to a separate file [null]



export2maq 	maq export2maq [-1 read1len] [-2 read2len] [-a maxdist] [-n] out.map in.list in.export

Convert Illumina’s Export format to Maq’s .map format. Export format is a new alignment format since SolexaPipeline-0.3.0 which also calculates mapping qualities like maq. The resultant file can be used to call consensus genotypes as most of necessary information is available for maq to do this accurately.

OPTIONS:
-1 INT 	Length of the first read [0]
-2 INT 	Length of the second read [0]
-a INT 	Maximum outer distance for a correct read pair [250]
-n 	Retain filtered reads




</entry>



<entry [Sun Jun  7 20:59:23 EDT 2009] FIXED ERROR 'error while loading shared libraries: libstdc++.so.5'`>



PROBLEM:

time /nethome/syoung/base/apps/maq/maq fasta2bfa /nethome/syoung/base/pipeline/comparison/CCDS_nucleotide.20080430.fa /nethome/syoung/base/pipeline/comparison/CCDS_nucleotide.20080430.bfa
/nethome/syoung/base/apps/maq/maq: error while loading shared libraries: libstdc++.so.5: cannot open shared object file: No such file or directory
Command exited with non-zero status 127
0.00user 0.00system 0:00.12elapsed 4%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (4major+45minor)pagefaults 0swaps

DIAGNOSIS:

HIGHER VERSION OF libstdc INSTALLED (v6.0.8)

[syoung@ngsdev comparison]$ ll /usr/local/lib | grep libst
[syoung@ngsdev comparison]$ ll /usr/lib | grep libst
lrwxrwxrwx   1 root root   34 Mar  4 09:34 libstartup-notification-1.so.0 -> libstartup-notification-1.so.0.0.0
-rwxr-xr-x   1 root root  34K Jan  6  2007 libstartup-notification-1.so.0.0.0
lrwxrwxrwx   1 root root   18 Mar  4 09:33 libstdc++.so.6 -> libstdc++.so.6.0.8
-rwxr-xr-x   1 root root 915K May 26  2008 libstdc++.so.6.0.8


SOLUTION:

INSTALLED MAQ 0.7.1


</entry>



<entry [Sat Jan 10 01:39:54 EST 2009] Barbazuk et al 2007 ACHIEVED 85% VALIDATED SNP PREDICTIONS>



Barbazuk 2007 SNP discovery via 454 transcriptome sequencing
http://www3.interscience.wiley.com/cgi-bin/fulltext/118488674/HTMLSTART



Identification of B73 reference sequences for 454 ESTs

Mo17 454 ESTs were initially mapped to a specific contig or singleton (217 773 total) from the MAGI 3.1 partial genome assembly of the maize inbred line B73 (Fu et al., 2005) using best BLASTN matches (minimum E-value 1e-8). Although 'best hit' criteria were used, it is possible that some 454 ESTs align to paralogous genomic fragments, especially given the partial nature of the MAGI assembly. To compensate, we used POLYBAYES (see below), which includes an internal paralog filter and should identify and discard these instances. These ESTs were also aligned to MAGIs using GeneSeqer (http://deepc2.psi.iastate.edu/cgi-bin/gs.cgi) and its maize-specific splice models (Usuka et al., 2000) for display on the MAGI website (http://magi.plantgenomics.iastate.edu). Only alignments consisting of at least 50 bp in length and with identity ? 95% over at least 80% of the length of the 454 EST were used to annotate genomic sequences.
 
 
Multiple sequence alignments and SNP detection of 454 sequence data

Custom PERL scripts were written to create a pipeline to process MAGI 3.1 anchor sequences and their associated B73 and Mo17 454 EST sequences for detecting SNPs. Anchored MSAs were produced by CROSS_MATCH with the following parameters: -discrep_lists -tags -masklevel 5 -gap_init -1 -gap_ext -1. Low initiation (-gap_init) and gap extension (-gap_ext) were used to increase alignment tolerance between the short 454 ESTs and the unplaced MAGI 3.1 genomic anchors. Sequence polymorphisms were detected by POLYBAYES using the following parameters:

    * -

      anchorBaseQualityDefault 34 memberBaseQualityDefault 18
    * -

      maskAmbiguousMatches nofilterParalogs -priorParalog 0.03 -thresholdNative 0.75 -screenSnps -considerAnchor -noconsiderTemplateConsensus -prescreenSnps -priorPoly 0.01 -thresholdSnp 0.5.

Default anchor quality values (34) were based on a previous assessment of sequence error rates within the MAGI 3.1 assembly (Fu et al., 2005). Default quality values of 18 were assigned to the 454 reads. This corresponds to an error rate of approximately 1/65, which over-compensates for the error rate observed for current 454 sequencing (Emrich et al., 2007a; Margulies et al., 2005). Although each base within the 454 sequence reads is given a quality score, these scores are only reliable when confirmed within independent sequences covering the same region. Because CROSS_MATCH aligns each sequence individually to the anchor during MSA construction, and POLYBAYES assesses base quality on an individual basis, use of a stringent default rather than the base quality information provided by 454 Life Sciences is expected to increase the accuracy of polymorphism detection.
 
 
SNP parsing

Mo17 and B73 are inbred lines, and thus should be mono-allelic at every base position. Custom PERL scripts were written to parse the POLYBAYES output (see Results). POLYBAYES identifies indel polymorphisms. Because indels are a common form of 454 sequencing error, only base substitutions were considered during this analysis. MAGI 3.1 assemblies contain a low frequency of base substitutions propagated during shotgun sequencing of the high-Cot selected maize genomic DNA (Fu et al., 2004). High-Cot selected maize DNA sequences account for only a portion of the MAGI 3.1 assembly sequence, but unidentified base substitutions within these regions could increase the number of false polymorphisms detected. Strict parsing rules (see Results) ensured that potential MAGI 3.1 sequence errors were avoided when B73 454 EST sequences are present in the multiple alignment. In cases where B73 454 ESTs are not present in the multiple alignment, SNPs called within regions of the MAGI 3.1 assemblies containing high-Cot selected DNA were avoided.


</entry>



<entry [Fri Jan  9 00:31:24 EST 2009] RUN runmaq.pl ON NIMBLEGEN DEMO DATA>



1. CREATE FOLDER AND TRANSFER EXOME SEQUENCES

    mkdir -p /home/syoung/base/pipeline/nimblegen-maq
    cd /home/syoung/base/pipeline/nimblegen-maq
    cp /home/syoung/base/pipeline/exome/ccds/sequence/CCDS_nucleotide.20080430.fna CCDS_nucleotide.20080430.fa

2. COPY READS TO FOLDER
    
    cd /home/syoung/base/pipeline/nimblegen-maq

    #### COPY run_1
    cp /home/syoung/base/pipeline/exome/nimblegen-demo-data/demo_data_fa/run_1/1.TCA.454Reads.fna run1-1.TCA.454Reads.fna
    cp /home/syoung/base/pipeline/exome/nimblegen-demo-data/demo_data_fa/run_1/1.TCA.454Reads.qual run1-1.TCA.454Reads.qual
    cp /home/syoung/base/pipeline/exome/nimblegen-demo-data/demo_data_fa/run_1/2.TCA.454Reads.fna run1-2.TCA.454Reads.fna
    cp /home/syoung/base/pipeline/exome/nimblegen-demo-data/demo_data_fa/run_1/2.TCA.454Reads.qual run1-2.TCA.454Reads.qual


    #### COPY run_2
    cp /home/syoung/base/pipeline/exome/nimblegen-demo-data/demo_data_fa/run_2/1.TCA.454Reads.fna run2-1.TCA.454Reads.fna
    cp /home/syoung/base/pipeline/exome/nimblegen-demo-data/demo_data_fa/run_2/1.TCA.454Reads.qual run2-1.TCA.454Reads.qual
    cp /home/syoung/base/pipeline/exome/nimblegen-demo-data/demo_data_fa/run_2/2.TCA.454Reads.fna run2-2.TCA.454Reads.fna
    cp /home/syoung/base/pipeline/exome/nimblegen-demo-data/demo_data_fa/run_2/2.TCA.454Reads.qual run2-2.TCA.454Reads.qual

    ll
    

3. CONVERT .fasta AND .qual FILES TO .fastq

RUN 1
-----

    cd /home/syoung/base/pipeline/nimblegen-maq
    screen -S nimblegen-maq-fasta2fastq
    fasta2fastq.pl --fastafile /home/syoung/base/pipeline/nimblegen-maq/run1-1.TCA.454Reads.fna --qualfile /home/syoung/base/pipeline/nimblegen-maq/run1-1.TCA.454Reads.qual --outputfile /home/syoung/base/pipeline/nimblegen-maq/run1-1.TCA.454Reads.fastq

        /home/syoung/base/pipeline/nimblegen-maq/run1-1.TCA.454Reads.fastq
            
        Run time: 00:19:07
        Completed /home/syoung/base/bin/nextgen/fasta2fastq.pl
        3:35PM, 17 January 2009
        ****************************************

    screen -S nimblegen-maq-fasta2fastq-2
    fasta2fastq.pl --fastafile /home/syoung/base/pipeline/nimblegen-maq/run1-2.TCA.454Reads.fna --qualfile /home/syoung/base/pipeline/nimblegen-maq/run1-2.TCA.454Reads.qual --outputfile /home/syoung/base/pipeline/nimblegen-maq/run1-2.TCA.454Reads.fastq
        
        /home/syoung/base/pipeline/nimblegen-maq/run1-2.TCA.454Reads.fastq
        
        Run time: 00:17:42
        Completed /home/syoung/base/bin/nextgen/fasta2fastq.pl
        3:36PM, 17 January 2009
        ****************************************
        

RUN 2
-----

    screen -S fasta2fastq-3
    fasta2fastq.pl --fastafile /home/syoung/base/pipeline/nimblegen-maq/run2-1.TCA.454Reads.fna --qualfile /home/syoung/base/pipeline/nimblegen-maq/run2-1.TCA.454Reads.qual --outputfile /home/syoung/base/pipeline/nimblegen-maq/run2-1.TCA.454Reads.fastq

        /home/syoung/base/pipeline/nimblegen-maq/run2-1.TCA.454Reads.fastq    
        
        Run time: 00:17:51
        Completed /home/syoung/base/bin/nextgen/fasta2fastq.pl
        3:37PM, 17 January 2009
        ****************************************
        

    screen -S fasta2fastq-4
    fasta2fastq.pl --fastafile /home/syoung/base/pipeline/nimblegen-maq/run2-2.TCA.454Reads.fna --qualfile /home/syoung/base/pipeline/nimblegen-maq/run2-2.TCA.454Reads.qual --outputfile /home/syoung/base/pipeline/nimblegen-maq/run2-2.TCA.454Reads.fastq

    /home/syoung/base/pipeline/nimblegen-maq/run2-2.TCA.454Reads.fastq
        
    Run time: 00:19:45
    Completed /home/syoung/base/bin/nextgen/fasta2fastq.pl
    3:40PM, 17 January 2009
    ****************************************



4. RUN MAQ ASSEMBLY
ll
    cd /home/syoung/base/pipeline/nimblegen-maq
    runmaq.pl -d ~/base/pipeline/nimblegen-maq -i run1-1.TCA.454Reads.fastq,run1-2.TCA.454Reads.fastq,run2-1.TCA.454Reads.fastq,run2-2.TCA.454Reads.fastq -r CCDS_nucleotide.20080430.fa &> maq-runlog.txt
    





</entry>



<entry [Mon Jan 5 19:59:26 EDT 2009] TEST MAQ: human1, human2 AGAINST human-cDNA, human-chr1, human-genome, E.coli, herpes AND phix>



human1 vs cDNA
==============

1. COPY HUMAN cDNA TO FOLDER

    mkdir -p /home/syoung/base/pipeline/human1-maq
    cd /home/syoung/base/pipeline/human1-maq    
    cp /home/syoung/base/pipeline/human-cdna-embl/Homo_sapiens.NCBI36.49.cdna.known.fas ./

2. COPY READS TO FOLDER
    
    cd /home/syoung/base/pipeline/human1-maq
    cp /home/syoung/base/pipeline/human1/data/human1_sequence_in.solexa human1.fastq   
    ll
        -rwxr-xr-x  1 syoung users 120M Jan  5 10:34 Homo_sapiens.NCBI36.49.cdna.known.fas
        -rw-r--r--  1 syoung users 685M Jan  5 10:40 human1.fastq

3. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/human1-maq
    runmaq.pl -d ~/base/pipeline/human1-maq -i human1.fastq -r Homo_sapiens.NCBI36.49.cdna.known.fas &> runlog.txt


    Run time: 00:58:11
    Completed /home/syoung/base/bin/nextgen/runmaq.pl
    11:39AM, 5 January 2009
    ****************************************

    [syoung@solexa01 human1-maq]$ ll
    total 2372384
    -rw-rw-rw- 1 syoung users  22367268 Jan  5 11:38 align.map
    -rw-rw-rw- 1 syoung users   2430693 Jan  5 11:04 assemble.log
    -rw-rw-rw- 1 syoung users 243514549 Jan  5 11:05 cns.fq
    -rw-rw-rw- 1 syoung users   5182433 Jan  5 11:06 cns.snp
    -rw-rw-rw- 1 syoung users  72342465 Jan  5 11:04 consensus.cns
    -rw-rw-rw- 1 syoung users  61220228 Jan  5 10:43 Homo_sapiens.NCBI36.49.cdna.known.bfa
    -rwxr-xr-x 1 syoung users 125265637 Jan  5 10:34 Homo_sapiens.NCBI36.49.cdna.known.fas
    -rw-rw-rw- 1 syoung users  87038751 Jan  5 10:43 human1.bfq
    -rw-r--r-- 1 syoung users 718019332 Jan  5 10:40 human1.fastq
    -rw-r--r-- 1 syoung users 354253372 Jan  4 23:44 human1.seq
    -rw-r--r-- 1 syoung users 669133428 Jan  4 23:44 human1.seq.qual
    -rw-rw-rw- 1 syoung users       538 Jan  5 11:02 mapcheck.txt
    -rw-rw-rw- 1 syoung users         0 Jan  5 11:38 out.indelpe
    -rw-rw-rw- 1 syoung users      2033 Jan  5 11:39 out.indelsoa
    -rw-rw-rw- 1 syoung users       518 Jan  5 11:39 out.indelsoa.filter
    -rw-rw-rw- 1 syoung users  23873873 Jan  5 11:02 out.map
    -rw-rw-rw- 1 syoung users  23873873 Jan  5 11:38 out.rmdup
    -rw-rw-rw- 1 syoung users    672149 Jan  5 11:39 out.SNPfilter
    -rw-r--r-- 1 syoung users  17559456 Jan  5 11:39 runlog.txt


human2 vs cDNA
==============

1. COPY HUMAN cDNA TO FOLDER

    mkdir -p /home/syoung/base/pipeline/human2-maq
    cd /home/syoung/base/pipeline/human2-maq    
    cp /home/syoung/base/pipeline/human-cdna-embl/Homo_sapiens.NCBI36.49.cdna.known.fas ./

2. COPY READS TO FOLDER
    
    cd /home/syoung/base/pipeline/human2-maq
    cp /home/syoung/base/pipeline/human2/data/human2_sequence_in.solexa human2.fastq   
    ll
        -rwxr-xr-x  1 syoung users 120M Jan  5 10:34 Homo_sapiens.NCBI36.49.cdna.known.fas
        -rw-r--r--  1 syoung users 685M Jan  5 10:40 human2.fastq

3. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/human2-maq
    screen -S human2-cdna-maq
    runmaq.pl -d ~/base/pipeline/human2-maq -i human2.fastq -r Homo_sapiens.NCBI36.49.cdna.known.fas &> runlog.txt

    FAILED WITH ERROR IN runlog.txt:

    ...    
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the first read as 35.
    [ma_load_reads] 31939318*2 reads loaded.
    [ma_longread2read] encoding reads... maq: read.cc:106: match_info_t* ma_longread2read(\
    const longreads_t*): Assertion `matches' failed.
    Command terminated by signal 6
    ...
    
    COMPARED TO SUCCESSFUL RUN WITH human1 AGAINST human cDNA:
    
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the first read as 35.
    [ma_load_reads] 4756221*2 reads loaded.
    [ma_longread2read] encoding reads... 9512442 sequences processed.
    [ma_match] set the minimum insert size as 36.
    [match_core] round 1/3...



        Run time: 00:22:14
        Completed /home/syoung/base/bin/nextgen/runmaq.pl
        6:08PM, 17 January 2009
        ****************************************





human1 vs chr1
==============

1. COPY HUMAN CHROMOSOME 1 TO FOLDER

    mkdir -p /home/syoung/base/pipeline/human1-chr1-maq
    cd /home/syoung/base/pipeline/human1-chr1-maq    
    cp /home/syoung/base/pipeline/human-genome/chr1.fa ./

2. COPY READS TO FOLDER
    
    cd /home/syoung/base/pipeline/human1-chr1-maq
    cp /home/syoung/base/pipeline/human1/data/human1_sequence_in.solexa human1.fastq   
    ll
        -rw-r--r--  1 syoung users 241M Jan  5 11:06 chr1.fa
        -rw-r--r--  1 syoung users 685M Jan  5 11:06 human1.fastq

3. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/human1-chr1-maq
    runmaq.pl -d ~/base/pipeline/human1-chr1-maq -i human1.fastq -r chr1.fa &> runlog.txt

        tail runlog.txt 
        real    0m1.840s
        user    0m1.688s
        sys     0m0.027s
        
        Run time: 07:05:14
        Completed /home/syoung/base/bin/nextgen/runmaq.pl
        3:37AM, 6 January 2009
        ****************************************


human1 vs genome
================

1. COPY HUMAN CHROMOSOME 1 TO FOLDER

    mkdir -p /home/syoung/base/pipeline/human1-genome-maq
    cd /home/syoung/base/pipeline/human1-genome-maq    
    cp /home/syoung/base/pipeline/human-genome/genome.fa ./

2. COPY READS TO FOLDER
    
    cd /home/syoung/base/pipeline/human1-genome-maq
    cp /home/syoung/base/pipeline/human1/data/human1_sequence_in.solexa human1.fastq   
    ll
        -rw-r--r--  1 syoung users 241M Jan  5 11:06 genome.fa
        -rw-r--r--  1 syoung users 685M Jan  5 11:06 human1.fastq

3. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/human1-genome-maq
    screen -S human1-genome-maq
    runmaq.pl -d ~/base/pipeline/human1-genome-maq -i human1.fastq -r genome.fa &> runlog.txt


*** RUNNING Sat Jan 17 17:53:32 EST 2009



human2 vs genome
================

1. COPY HUMAN GENOME TO FOLDER

    mkdir -p /home/syoung/base/pipeline/human2-genome-maq
    cd /home/syoung/base/pipeline/human2-genome-maq    
    cp /home/syoung/base/pipeline/human-genome/genome.fa ./

2. COPY READS TO FOLDER
    
    cd /home/syoung/base/pipeline/human2-genome-maq
    cp /home/syoung/base/pipeline/human2/data/human2_sequence_in.solexa human2.fastq   
    ll
        -rw-r--r--  1 syoung users 241M Jan  5 11:06 genome.fa
        -rw-r--r--  1 syoung users 685M Jan  5 11:06 human2.fastq


3. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/human2-genome-maq
    screen -S human2-genome-maq
    runmaq.pl -d ~/base/pipeline/human2-genome-maq -i human2.fastq -r genome.fa &> runlog.txt


    FAILED WITH ERROR IN runlog.txt
    
    ...    
    Converting solexa Sanger fastq files to MAQ binary fastq (.bfq) files...
    maq fastq2bfq human2.fastq human2.bfq
    -- finish writing file 'human2.bfq'
    -- 31939318 sequences were loaded.
    time maq fasta2bfa genome.fa genome.bfa
    -- 24 sequences have been converted.
    169.10user 13.31system 5:04.06elapsed 59%CPU (0avgtext+0avgdata 0maxresident)k
    0inputs+0outputs (0major+436679minor)pagefaults 0swaps
    time maq match out.map genome.bfa human2.bfq
    -- maq-0.6.8
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the first read as 35.
    [ma_load_reads] 31939318*2 reads loaded.
    [ma_longread2read] encoding reads... maq: read.cc:106: match_info_t* ma_longread2read(const longreads_t*): Assertion `matches' failed.
    Command terminated by signal 6
    ...
    
    
    

E. coli
=======

1. COPY REFERENCE TO FOLDER

    mkdir -p /home/syoung/base/pipeline/ecoli-maq
    cd /home/syoung/base/pipeline/ecoli-maq    
    cp /home/syoung/base/pipeline/ecoli/data/ecoli-genome.fasta ./

2. COPY READS TO FOLDER
    
    cd /home/syoung/base/pipeline/ecoli-maq
    cp /home/syoung/base/pipeline/ecoli/data/ecoli_in.solexa.fasta  ecoli.fasta   
    cp /home/syoung/base/pipeline/ecoli/data/ecoli_in.solexa.fasta.qual  ecoli.fasta.qual
    ll
        -rw-r--r-- 1 syoung users 336958758 Jan 17 13:09 ecoli.fasta
        -rw-r--r-- 1 syoung users 685369208 Jan 17 13:09 ecoli.fasta.qual
        -rw-r--r-- 1 syoung users   4706025 Jan  9 00:35 ecoli-genome.fasta

3. CONVERT .fasta and .fasta.qual TO .fastq

    fasta2fastq.pl --fastafile /home/syoung/base/pipeline/ecoli-maq/ecoli.fasta \
    --qualfile /home/syoung/base/pipeline/ecoli-maq/ecoli.fasta.qual \
    --outputfile /home/syoung/base/pipeline/ecoli-maq/ecoli.fastq

        Run time: 01:38:23
        Completed /home/syoung/base/bin/nextgen/fasta2fastq.pl
        7:08PM, 17 January 2009
        ****************************************

4. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/ecoli-maq
    screen -S ecoli-maq
    runmaq.pl -d ~/base/pipeline/ecoli-maq -i ecoli.fastq -r ecoli-genome.fasta &> runlog.txt

        Run time: 00:12:56
        Completed /home/syoung/base/bin/nextgen/runmaq.pl
        7:24PM, 17 January 2009
        ****************************************


Herpes
======

NB: SEQUENCE LENGTH = 30bp

head herpes.fastq
>READ_1
CTTTAGATTCTTGGCGCTCAGCCGCAGATA
>READ_1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>READ_2
TCTTTCCGCAGCGTCAATTTTTGCTTTGGA
>READ_2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. COPY REFERENCE TO FOLDER

    mkdir -p /home/syoung/base/pipeline/herpes-maq
    cd /home/syoung/base/pipeline/herpes-maq
    cp /home/syoung/base/pipeline/herpes/data/Herpesvirus_3.60kb.reference.fa herpes-genome.fasta

2. COPY READS TO FOLDER
    
    cd /home/syoung/base/pipeline/herpes-maq
    cp /home/syoung/base/pipeline/herpes/data/Herpesvirus_3.60kb.reads.fa  herpes.fasta   
    ll
        -rw-r--r-- 1 syoung users 336958758 Jan 17 13:09 herpes.fasta
        -rw-r--r-- 1 syoung users 685369208 Jan 17 13:09 herpes.fasta.qual
        -rw-r--r-- 1 syoung users   4706025 Jan  9 00:35 herpes-genome.fasta

3. CONVERT .fasta and .fasta.qual TO .fastq

    ./dummyfasta2fastq.pl \
    --fastafile /home/syoung/base/pipeline/herpes-maq/herpes.fasta \
    --quality 30 \
    --outputfile /home/syoung/base/pipeline/herpes-maq/herpes.fastq
    
        Run time: 00:01:45
        Completed ./dummyfasta2fastq.pl
        2:47PM, 17 January 2009
        ****************************************

4. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/herpes-maq
    screen -S herpes-maq
    runmaq.pl -d ~/base/pipeline/herpes-maq -i herpes.fastq -r herpes-genome.fasta
    
        ...
        [match_core] processing sequence gi|9625875|ref|NC_001348.1|_human_herpesvirus_3,_complete_genome:41500-101500 (60000 bp)...
        [match_core] round 3/3...
        [match_core] making index...
        [match_core] processing sequence gi|9625875|ref|NC_001348.1|_human_herpesvirus_3,_complete_genome:41500-101500 (60000 bp)...
        [match_core] sorting the hits and dumping the results...
        [ma_load_reads] loading reads...
        [ma_load_reads] 99977*2 reads loaded.
        [mapping_count_single] 37, 39, 42, 49
        [maq_indel_pe] the indel detector only works with short-insert mate-pair reads.
        [match_data2mapping] 99754 out of 199954 raw reads are mapped with 0 in pairs.
        -- (total, isPE, mapped, paired) = (99977, 0, 99754, 0)
        3.11user 0.47system 0:03.58elapsed 99%CPU (0avgtext+0avgdata 0maxresident)k
        0inputs+0outputs (0major+114866minor)pagefaults 0swaps
        time maq rmdup out.rmdup out.map
        [maq_rmdup_core] processing reference gi|9625875|ref|NC_001348.1|_human_herpesvirus_3,_complete_genome:41500-101500...
        [maq_rmdup_core] 0 / 0 = nan
        1.09user 0.00system 0:01.10elapsed 99%CPU (0avgtext+0avgdata 0maxresident)k
        0inputs+0outputs (0major+417minor)pagefaults 0swaps
        time maq indelpe herpes-genome.bfa out.rmdup > out.indelpe
        
        real    0m0.147s
        user    0m0.129s
        sys     0m0.018s
        time maq indelsoa herpes-genome.bfa align.map > out.indelsoa
        
        real    0m0.161s
        user    0m0.158s
        sys     0m0.002s
        awk '$5+$6-$4 >= 3 && $4 <= 1' out.indelsoa > out.indelsoa.filter
        time maq.pl SNPfilter -d 1 -s out.indelsoa -F out.indelpe cns.snp &> out.SNPfilter
        
        real    0m0.043s
        user    0m0.034s
        sys     0m0.010s
        
        Run time: 00:00:14
        Completed /home/syoung/base/bin/nextgen/runmaq.pl
        3:21PM, 17 January 2009
        ****************************************


PhiX
====

1. COPY HUMAN GENOME TO FOLDER

    mkdir -p /home/syoung/base/pipeline/phix-maq
    cd /home/syoung/base/pipeline/phix-maq    
    cp /home/syoung/base/pipeline/phix/phiFasta.fa phix-genome.fasta

2. COPY READS TO FOLDER
    
    cd /home/syoung/base/pipeline/phix-maq
    cp /home/syoung/base/pipeline/phix-eland/data/s_4_sequence_in.solexa.fasta phix.fasta   
    ll
        -rw-r--r-- 1 syoung users 336958758 Jan 17 13:09 phix.fasta
        -rw-r--r-- 1 syoung users 685369208 Jan 17 13:09 phix.fasta.qual
        -rw-r--r-- 1 syoung users   4706025 Jan  9 00:35 phix-genome.fasta

3. CONVERT .fasta and .fasta.qual TO .fastq

dummyfasta2fastq.pl --fastafile /home/syoung/base/pipeline/phix-maq/phix.fasta \
--quality 20 \
--outputfile /home/syoung/base/pipeline/phix-maq/phix.fastq
    
    Run time: 01:34:49
    Completed /home/syoung/base/bin/nextgen/dummyfasta2fastq.pl
    7:15PM, 17 January 2009
    ****************************************

4. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/phix-maq
    screen -S phix-maq
    runmaq.pl -d ~/base/pipeline/phix-maq -i phix.fastq -r phix-genome.fasta &> runlog.txt
        
        Run time: 00:08:16
        Completed /home/syoung/base/bin/nextgen/runmaq.pl
        7:24PM, 17 January 2009
        ****************************************



</entry>



<entry [Mon Sep 22 19:59:26 EDT 2008] maq INSTALL INSTRUCTIONS>



1. DOWNLOAD THIS FILE

maq-0.6.8_i686-linux.tar.bz2

FROM

http://maq.sourceforge.net/

2. MOVE FILE TO INTENDED INSTALL DIRECTORY

cd /store/home/syoung/base/apps/maq
cp ~/maq-0.6.8_i686-linux.tar.bz2 /store/home/syoung/base/apps/maq
    
[syoung@solexa01 maq]$ ll
    -rw-r--r--  1 syoung users 262K Aug  8 00:40 maq-0.6.8_i686-linux.tar.bz2
    
[syoung@solexa01 maq]$ tar xvfj maq-0.6.8_i686-linux.tar.bz2 
    maq-0.6.8_i686-linux/
    maq-0.6.8_i686-linux/asub
    maq-0.6.8_i686-linux/maq
    maq-0.6.8_i686-linux/maq.1
    maq-0.6.8_i686-linux/maq.pdf
    maq-0.6.8_i686-linux/maq.pl
    maq-0.6.8_i686-linux/maq_eval.pl
    maq-0.6.8_i686-linux/paf_utils.pl


3. COPY maq, maq.pl AND maq_eval.pl TO THE INSTALL DIRECTORY

    cd /store/home/syoung/base/apps/maq
    cp maq-0.6.8_i686-linux/maq ./
    cp maq-0.6.8_i686-linux/maq.pl ./
    cp maq-0.6.8_i686-linux/maq_eval.pl ./

It sort of worked out of the box but there are a lot of different tools and configurations. I've set up a plain-vanilla maq pipeline script that you can run from here:

/home/syoung/base/bin/nextgen/runmaq.pl

NB: You could add the directory to your path in your .bash_profile so you can call it with just 'runmaq.pl':

export PATH=/home/syoung/base/bin/nextgen/:$PATH


You can get the usage info with:

runmaq.pl -h 

You can use s_N_sequence.txt solexa-format sequence files or .fastq or .bfq (binary fastq) files as read input files and the reference sequence should be in .fasta format. You could try the 'run2-laneX...' directories:

cd /home/syoung/base/pipeline
ls

There's more info on the Wiki:

http://zion.ccs.miami.edu/dokuwiki/doku.php?id=mtdna_analysis

Cheers,

Stuart.








</entry>



<entry [Sun Sep 21 05:03:48 EDT 2008] USE runmaq.pl TO RUN MAQ WITH HUMAN cDNA REFERENCE>



RUN 2 LANE 7
============

1. COPY HUMAN cDNA TO FOLDER

    mkdir -p /home/syoung/base/pipeline/run2-lane7-mtdna-maq/cdna
    cd /home/syoung/base/pipeline/run2-lane7-mtdna-maq/cdna    
    cp /home/syoung/base/pipeline/human-cdna-embl/Homo_sapiens.NCBI36.49.cdna.known.fas ./

2. COPY READS TO FOLDER
    
        cd /home/syoung/base/pipeline/run2-lane7-mtdna-maq/cdna
        cp /home/syoung/base/pipeline/run2-human-mitochondria/data/s_7_*_sequence.txt ./    

3. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/run2-lane7-mtdna-maq/cdna
    runmaq.pl -d ~/base/pipeline/run2-lane7-mtdna-maq/assembly -i s_7_1_sequence.txt,s_7_2_sequence.txt -r Homo_sapiens.NCBI36.49.cdna.known.fas &> runlog.txt
    


RUN 2 LANE 8
============

1. COPY HUMAN cDNA TO FOLDER

    mkdir -p /home/syoung/base/pipeline/run2-lane8-mtdna-maq/cdna
    cd /home/syoung/base/pipeline/run2-lane8-mtdna-maq/cdna    
    cp /home/syoung/base/pipeline/human-cdna-embl/Homo_sapiens.NCBI36.49.cdna.known.fas ./

2. COPY READS TO FOLDER
    
        cd /home/syoung/base/pipeline/run2-lane8-mtdna-maq/cdna
        cp /home/syoung/base/pipeline/run2-human-mitochondria/data/s_8_*_sequence.txt ./    

3. RUN MAQ ASSEMBLY

    cd /home/syoung/base/pipeline/run2-lane8-mtdna-maq/cdna

    screen -S run2-lane6-mtdna-maq

    runmaq.pl -d ~/base/pipeline/run2-lane8-mtdna-maq/cdna -i s_8_1_sequence.txt,s_8_2_sequence.txt -r Homo_sapiens.NCBI36.49.cdna.known.fas &> runlog.txt



</entry>



<entry [Sat Sep 20 06:29:04 EDT 2008] MESSAGE STEPHAN: SNPS, indels and breakpoints for mtDNA (lanes 6, 7 and 8)>



Hi Stephan,

Here are the SNP, indel and breakpoint predictions for the mtDNA samples aligned against the mitochondrial genome (run 2, lanes 6, 7 and 8) attached (including reformatted data from the previous batch I sent you).

Please note: the additional '*-breakpoints-filter.xls' files are filtered to reduce false positives.

Here's a list of the attached files:

run 2 lane 6

run2-lane6-mtdna-maq-SNPs.xls
run2-lane6-mtdna-maq-indels.xls
run2-lane6-mtdna-maq-breakpoints.xls
run2-lane6-mtdna-maq-breakpoints-filtered.xls

run 2 lane 7

run2-lane7-mtdna-maq-SNPs.xls
run2-lane7-mtdna-maq-indels.xls
run2-lane7-mtdna-maq-breakpoints.xls
run2-lane7-mtdna-maq-breakpoints-filtered.xls

run2 lane 8

run2-lane8-mtdna-maq-SNPs.xls
run2-lane8-mtdna-maq-indels.xls
run2-lane8-mtdna-maq-breakpoints.xls
run2-lane8-mtdna-maq-breakpoints-filtered.xls


Here are detailed descriptions of the column headings for each table:

Predicted break points
(Potential homozygous indels and break points predicted by detecting abnormal alignment patterns around the prospective indels and break points)

1. Chromosome
2. Position
3. Length of the abnormal region
4. Number of reads mapped across the position
5. Number of reads on the left-hand side of the position and number of reads on the right-hand side

Predicted indels

1. Chromosome
2. Start position
3. Type of the indel
    A star indicates the indel is confirmed by reads from both strands, a plus means the indel is hit by at least two reads but from the same strand, a minus shows the indel is only found on one read, and a dot means the indel is too close to another indel and is filtered out.
4. Number of reads across the indel
5. Size of the indel and inserted/deleted nucleotides (separated by colon)
6. Number of indels on the reverse strand
7. Number of indels on the forward strand
8. 5’ sequence ahead of the indel
9. 3’ sequence following the indel
10. Number of reads aligned without indels

Predicted SNPs

1. Chromosome
2. Position
3. Reference base
4. Consensus base
5. Consensus quality
    A Phred-like quality value. Considered the key criterion for judging the reliability of a SNP.
6. Read depth
7. Repetitive region
    Average number of hits of reads covering this position. Indicates whether the site falls in a repetitive region. If no read covering the site can be mapped with high mapping quality, the flanking region is possibly repetitive or in the lack of good reads. A SNP at such site is usually not reliable.
8. Highest mapping quality
    Highest mapping quality of the reads covering the position. Roughly gives the copy number of the flanking region in the reference genome. In most cases, this number approaches 1.00, which means the region is about unique. Sometimes you may see non-zero read depth but 0.00 at the 7th column. This indicates that all the reads covering the position have at least two mismatches. Maq only counts the number of 0- and 1-mismatch hits to the reference. This is due to a complex technical issue.
9. Min. flanking quality
    Minimum consensus quality in the 3bp flanking regions at each side of the site (6bp in total). This gives the neighbouring quality. Filtering on this column is also required to get reliable SNPs. This idea is inspired by NQS, although NQS is initially designed for a single read instead of a consensus.
10. Second best call
11. Log likelihood ratio of the second best and the third best call
12. Third best call


The reference sequences I used were:

mtDNA: gi|115315570|ref|AC_000021.2|
cDNA: RefSeq NCBI 36 (43,367 cDNAs)

I'll send you the collated data for all three lanes of the mtDNA samples aligned against the RefSeq cDNA asap.



Here are some MAQ-related webpages:

MAQ (Mapping and Assembly with Qualities) Introduction

http://maq.sourceforge.net/

FAQ

http://maq.sourceforge.net/faq.shtml

Manuals

http://maq.sourceforge.net/maq-man.shtml

http://maq.sourceforge.net/maq-manpage.shtml

http://maq.sourceforge.net/qual.shtml



Cheers,

Stuart.




</entry>



<entry [Fri Sep 19 17:27:41 EDT 2008] RUN 2 LANE 8 MAQ ASSEMBLY - SNPS AND INDELS>



WORKFLOW
========

1. PREPARE INPUT FILES

    COPY mtDNA TO FOLDER

    mkdir -p /home/syoung/base/pipeline/run2-lane8-mtdna-maq/data
    cd /home/syoung/base/pipeline/run2-lane8-mtdna-maq/data
    cp /home/syoung/base/pipeline/human-mtdna/human-mtDNA-AC_000021.fasta ./

    CONVERT REFERENCE TO .bfa FORMAT
    
    maq fasta2bfa human-mtDNA-AC_000021.fasta human-mtDNA-AC_000021.bfa

    COPY READS TO FOLDER

    cd /home/syoung/base/pipeline/run2-lane8-mtdna-maq/data
    cp /home/syoung/base/pipeline/run2-human-mitochondria/data/s_8_*sequence.txt ./    

    CONVERT SOLEXA QUALITY VALUES TO SANGER FASTQ QUALITY VALUES:
    
    maq sol2sanger s_8_1_sequence.txt s_8_1_sequence.fastq
    maq sol2sanger s_8_2_sequence.txt s_8_2_sequence.fastq
    
    CONVERT FASTQ FILE TO BFQ FILE FORMAT:
    
    maq fastq2bfq s_8_1_sequence.fastq s_8_1_sequence.bfq
    maq fastq2bfq s_8_2_sequence.fastq s_8_2_sequence.bfq


2. RUN ASSEMBLY

    1. Convert the reference sequences to the binary fasta format
    time maq fasta2bfa human-mtDNA-AC_000021.fasta human-mtDNA-AC_000021.bfa
    
OK    
    
    2. Convert the reads to the binary fastq format
    #### SKIP THIS    time maq fastq2bfq reads.fastq reads-1.bfq
    
    3. Align the reads to the reference
 
    time maq match out.map human-mtDNA-AC_000021.bfa s_8_1_sequence.bfq s_8_2_sequence.bfq

    -- maq-0.6.8
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the first read as 28.
    [ma_load_reads] set length of the second read as 28.
    ^A^A[ma_load_reads] 2515596*2 reads loaded.
    [ma_longread2read] encoding reads... 5031192 sequences processed.
    [ma_match] set the minimum insert size as 29.
    [match_core] round 1/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 2/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 3/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] sorting the hits and dumping the results...
    [ma_load_reads] loading reads...
    [ma_load_reads] 2515596*2 reads loaded.
    [mapping_count_single] 42, 42, 42, 42
    [match_data2mapping] 12 pairs are added afterwards.
    [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
    [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
    [cal_insert_size] 5838 read pairs counted. insert size: 128.373929 +/- 10.883203
    [maq_indel_pe] 986 candidates for alignment
    [align_candidate] gi|115315570|ref|AC_000021.2|: (13, 35, 557) out of 986
    [maq_indel_pe] CPU time: 0.350 sec
    [match_data2mapping] 24552 out of 5031192 raw reads are mapped with 24087 in pairs.
    -- (total, isPE, mapped, paired) = (5031192, 1, 24552, 24087)
    
    real    1m8.201s
    user    1m5.818s
    sys     0m2.371s
    
    4. Statistics from the alignment
    time maq mapcheck human-mtDNA-AC_000021.fasta out.map > mapcheck.txt

OK

    5. Build the mapping assembly
    time maq assemble consensus.cns human-mtDNA-AC_000021.bfa out.map 2> assemble.log    

OK

    6. Extract consensus sequences and qualities
    time maq cns2fq consensus.cns > cns.fq

OK

    7. Extract list of SNPs 
    time maq cns2snp consensus.cns > cns.snp

OK 

3. DO SNP PREDICTION

    1. Assemble with 'map' to create 'align.map' binary file
    
    time maq map -1 25 align.map human-mtDNA-AC_000021.bfa s_8_1_sequence.bfq s_8_2_sequence.bfq

      -- maq-0.6.8
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the second read as 28.
    [ma_load_reads] 2515596*2 reads loaded.
    [ma_longread2read] encoding reads... 5031192 sequences processed.
    [ma_match] set the minimum insert size as 29.
    [match_core] round 1/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 2/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 3/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] sorting the hits and dumping the results...
    [ma_load_reads] loading reads...
    [ma_load_reads] 2515596*2 reads loaded.
    [mapping_count_single] 43, 43, 43, 43
    [match_data2mapping] 9 pairs are added afterwards.
    [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
    [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
    [cal_insert_size] 5901 read pairs counted. insert size: 128.380444 +/- 10.950451
    [maq_indel_pe] 905 candidates for alignment
    [align_candidate] gi|115315570|ref|AC_000021.2|: (14, 32, 457) out of 905
    [maq_indel_pe] CPU time: 0.330 sec
    [match_data2mapping] 24656 out of 5031192 raw reads are mapped with 24170 in pairs.
    -- (total, isPE, mapped, paired) = (5031192, 1, 24656, 24170)
    
    real    1m7.536s
    user    1m5.156s
    sys     0m2.368s
  

    2. rmdup       remove pairs with identical outer coordinates (PE)
    
        time maq rmdup out.rmdup out.map

        [maq_rmdup_core] processing reference gi|115315570|ref|AC_000021.2|...
        [maq_rmdup_core] 8126 / 11895 = 0.6831
        
        real    0m0.231s
        user    0m0.213s
        sys     0m0.018s

    3. indelpe     indel calling (PAIRED READS ONLY)
    
        time maq indelpe human-mtDNA-AC_000021.bfa out.rmdup > out.indelpe

OK

    4. indelsoa    state-of-art homozygous indel detection
        
        time maq indelsoa human-mtDNA-AC_000021.bfa align.map > out.indelsoa

        awk '$5+$6-$4 >= 3 && $4 <= 1' out.indelsoa
        gi|115315570|ref|AC_000021.2|   3106    1       0       11      1       12
        gi|115315570|ref|AC_000021.2|   15465   1       1       7       7       13


OK

    5. SNPfilter    filter SNP predictions
    
        time maq.pl SNPfilter -d 1 -s out.indelsoa -F out.indelpe cns.snp &> out.SNPfilter

OK
        emacs out.SNPfilter

        -- 1 potential pe-indels pass the filter.
        gi|115315570|ref|AC_000021.2|   73      A       G       120     31      1.00    63      62      N       255     N
        gi|115315570|ref|AC_000021.2|   263     A       G       91      33      1.00    63      62      K       246     T
        gi|115315570|ref|AC_000021.2|   309     C       Y       60      21      1.00    63      38      C       70      T
        gi|115315570|ref|AC_000021.2|   310     T       C       90      21      1.00    63      38      N       226     N
        gi|115315570|ref|AC_000021.2|   750     A       G       123     32      1.00    63      62      N       255     N
        ...





</entry>



<entry [Fri Sep 19 12:26:38 EDT 2008] RUN MAQ ON RUN 2 LANE 7 mtDNA PAIRED END DATA WITH HUMAN mtDNA REFERENCE>



RUN WORKFLOW
============

1. PREPARE INPUT FILES

    COPY mtDNA TO FOLDER

    mkdir -p /home/syoung/base/pipeline/run2-lane7-mtdna-maq/data
    cd /home/syoung/base/pipeline/run2-lane7-mtdna-maq/data
    cp /home/syoung/base/pipeline/human-mtdna/human-mtDNA-AC_000021.fasta ./

    CONVERT REFERENCE TO .bfa FORMAT
    
    maq fasta2bfa human-mtDNA-AC_000021.fasta human-mtDNA-AC_000021.bfa

    COPY READS TO FOLDER

    cd /home/syoung/base/pipeline/run2-lane7-mtdna-maq/data
    cp /home/syoung/base/pipeline/run2-human-mitochondria/data/s_7_*sequence.txt ./    

    CONVERT SOLEXA QUALITY VALUES TO SANGER FASTQ QUALITY VALUES:
    
    maq sol2sanger s_7_1_sequence.txt s_7_1_sequence.fastq
    maq sol2sanger s_7_2_sequence.txt s_7_2_sequence.fastq
    
    CONVERT FASTQ FILE TO BFQ FILE FORMAT:
    
    maq fastq2bfq s_7_1_sequence.fastq s_7_1_sequence.bfq
    maq fastq2bfq s_7_2_sequence.fastq s_7_2_sequence.bfq


2. RUN ASSEMBLY

    1. Convert the reference sequences to the binary fasta format
    time maq fasta2bfa human-mtDNA-AC_000021.fasta human-mtDNA-AC_000021.bfa
    
    2. Convert the reads to the binary fastq format
    #### SKIP THIS    time maq fastq2bfq reads.fastq reads-1.bfq
    
    3. Align the reads to the reference
 
    time maq match out.map human-mtDNA-AC_000021.bfa s_7_1_sequence.bfq s_7_2_sequence.bfq
 
    -- maq-0.6.8
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the first read as 28.
    [ma_load_reads] set length of the second read as 28.
    [ma_load_reads] 2043289*2 reads loaded.
    [ma_longread2read] encoding reads... 4086578 sequences processed.
    [ma_match] set the minimum insert size as 29.
    [match_core] round 1/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 2/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 3/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] sorting the hits and dumping the results...
    [ma_load_reads] loading reads...
    [ma_load_reads] 2043289*2 reads loaded.
    [mapping_count_single] 39, 39, 39, 39
    [match_data2mapping] 8 pairs are added afterwards.
    [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
    [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
    [cal_insert_size] 2408 read pairs counted. insert size: 135.156977 +/- 9.698928
    [maq_indel_pe] 849 candidates for alignment
    [align_candidate] gi|115315570|ref|AC_000021.2|: (11, 7, 301) out of 849
    [maq_indel_pe] CPU time: 0.270 sec
    [match_data2mapping] 11626 out of 4086578 raw reads are mapped with 10978 in pairs.
    -- (total, isPE, mapped, paired) = (4086578, 1, 11626, 10978)
    
    real    0m56.207s
    user    0m52.612s
    sys     0m1.935s

    
    4. Statistics from the alignment
    time maq mapcheck human-mtDNA-AC_000021.fasta out.map > mapcheck.txt

OK

    5. Build the mapping assembly
    time maq assemble consensus.cns human-mtDNA-AC_000021.bfa out.map 2> assemble.log    

OK

    6. Extract consensus sequences and qualities
    time maq cns2fq consensus.cns > cns.fq

OK

    7. Extract list of SNPs 
    time maq cns2snp consensus.cns > cns.snp

OK


4. DO SNP PREDICTION

    1. Assemble with 'map' to create 'align.map' binary file
    
    time maq map -1 25 align.map human-mtDNA-AC_000021.bfa s_7_1_sequence.bfq s_7_2_sequence.bfq

    -- maq-0.6.8
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the second read as 28.
    [ma_load_reads] 2043289*2 reads loaded.
    [ma_longread2read] encoding reads... 4086578 sequences processed.
    [ma_match] set the minimum insert size as 29.
    [match_core] round 1/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 2/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 3/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] sorting the hits and dumping the results...
    [ma_load_reads] loading reads...
    [ma_load_reads] 2043289*2 reads loaded.
    [mapping_count_single] 39, 39, 39, 39
    [match_data2mapping] 6 pairs are added afterwards.
    [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
    [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
    [cal_insert_size] 2445 read pairs counted. insert size: 135.137423 +/- 9.672084
    [maq_indel_pe] 826 candidates for alignment
    [align_candidate] gi|115315570|ref|AC_000021.2|: (15, 6, 263) out of 826
    [maq_indel_pe] CPU time: 0.270 sec
    [match_data2mapping] 11710 out of 4086578 raw reads are mapped with 11048 in pairs.
    -- (total, isPE, mapped, paired) = (4086578, 1, 11710, 11048)
    
    real    0m54.220s
    user    0m52.194s
    sys     0m2.016s
    

    2. rmdup       remove pairs with identical outer coordinates (PE)
    
        time maq rmdup out.rmdup out.map

        [maq_rmdup_core] 4343 / 5281 = 0.8224
        
        real    0m0.095s
        user    0m0.086s
        sys     0m0.010s

    3. indelpe     indel calling (PAIRED READS ONLY)
    
        time maq indelpe human-mtDNA-AC_000021.bfa out.rmdup > out.indelpe

OK

    4. indelsoa    state-of-art homozygous indel detection
        
        time maq indelsoa human-mtDNA-AC_000021.bfa align.map > out.indelsoa
            
        awk '$5+$6-$4 >= 3 && $4 <= 1' out.indelsoa
        gi|115315570|ref|AC_000021.2|   1035    5       0       1       5       6
        gi|115315570|ref|AC_000021.2|   2307    -1      0       12      12      24
        gi|115315570|ref|AC_000021.2|   4087    -1      0       6       6       12
        gi|115315570|ref|AC_000021.2|   8037    -1      0       7       7       14
        gi|115315570|ref|AC_000021.2|   9097    -1      0       8       9       17
        gi|115315570|ref|AC_000021.2|   10778   4       0       1       2       3
        gi|115315570|ref|AC_000021.2|   10962   -1      0       6       6       12
        gi|115315570|ref|AC_000021.2|   11023   -1      0       2       2       4
        gi|115315570|ref|AC_000021.2|   11201   -1      0       8       8       16
        gi|115315570|ref|AC_000021.2|   12307   4       0       5       3       8
        gi|115315570|ref|AC_000021.2|   13780   -1      0       3       3       6
        gi|115315570|ref|AC_000021.2|   14655   -3      0       2       1       3
        gi|115315570|ref|AC_000021.2|   14680   4       0       1       2       3
        gi|115315570|ref|AC_000021.2|   15324   2       0       1       2       3
        gi|115315570|ref|AC_000021.2|   15497   -1      0       4       4       8
        [syoung@solexa01 data]$ pwd
        /home/syoung/base/pipeline/run2-lane7-mtdna-maq/data


    5. SNPfilter    filter SNP predictions
    
        time maq.pl SNPfilter -d 1 -s out.indelsoa -F out.indelpe cns.snp &> out.SNPfilter

OK

        emacs out.SNPfilter

        -- 0 potential pe-indels pass the filter.
        gi|115315570|ref|AC_000021.2|   73      A       G       133     43      1.00    63      62      K       255     T
        gi|115315570|ref|AC_000021.2|   263     A       G       81      18      1.00    63      62      N       255     N
        gi|115315570|ref|AC_000021.2|   310     T       Y       41      12      1.00    63      62      T       105     C
        gi|115315570|ref|AC_000021.2|   701     G       K       49      26      1.00    63      62      G       248     T
        gi|115315570|ref|AC_000021.2|   709     G       K       106     31      1.00    63      62      G       183     T
        gi|115315570|ref|AC_000021.2|   750     A       G       78      17      1.00    63      62      N       161     N
        ...



</entry>



<entry [Thu Sep 18 22:14:58 EDT 2008] MAQ - RUN 2 LANE 6 mtDNA PAIRED END DATA WITH HUMAN cDNA REFERENCE>



WORKFLOW
========

1. COPY HUMAN cDNA TO FOLDER

    mkdir -p /home/syoung/base/pipeline/run2-lane6-mtdna-maq/data
    cd /home/syoung/base/pipeline/run2-lane6-mtdna-maq/data
    cp /home/syoung/base/pipeline/human-cdna-embl/Homo_sapiens.NCBI36.49.cdna.known.fas ./
    ll

        -rwxr-xr-x 1 syoung users 120M Sep 18 22:24 Homo_sapiens.NCBI36.49.cdna.known.fas

2. COPY READS TO FOLDER

    cd /home/syoung/base/pipeline/run2-lane6-mtdna-maq/data
    cp /home/syoung/base/pipeline/run2-lane6-mtdna-maq/data/s_6_*bfq ./    
    ll

        -rwxr-xr-x 1 syoung users 120M Sep 18 22:24 Homo_sapiens.NCBI36.49.cdna.known.fas
        -rw-r--r-- 1 syoung users  52M Sep 18 22:25 s_6_1_sequence.bfq
        -rw-r--r-- 1 syoung users  61M Sep 18 22:25 s_6_2_sequence.bfq


3. RUN ASSEMBLY

    1. Convert the reference sequences to the binary fasta format
    time maq fasta2bfa Homo_sapiens.NCBI36.49.cdna.known.fas Homo_sapiens.NCBI36.49.cdna.known.bfa
    
        -- 43367 sequences have been converted.

        real    0m7.953s
        user    0m7.397s
        sys     0m0.433s

    2. Convert the reads to the binary fastq format
    #### SKIP THIS    time maq fastq2bfq reads.fastq reads-1.bfq
    
    3. Align the reads to the reference
    time maq match out.map Homo_sapiens.NCBI36.49.cdna.known.fas s_6_1_sequence.bfq s_6_2_sequence.bfq
    
        [match_core] sorting the hits and dumping the results...
        [ma_load_reads] loading reads...
        [ma_load_reads] 3339151*2 reads loaded.
        [mapping_count_single] 0, 0, 0, 0
        [match_data2mapping] 0 pairs are added afterwards.
        [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
        [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
        [cal_insert_size] too few reads mapped as pairs. Skip Smith-Waterman alignment.
        [match_data2mapping] 0 out of 6678302 raw reads are mapped with 0 in pairs.
        -- (total, isPE, mapped, paired) = (6678302, 1, 0, 0)
        
        real    2m49.976s
        user    2m9.925s
        sys     0m9.385s

        ll -t
        -rw-r--r-- 1 syoung users  25967522 Sep 19 04:43 out.map
        -rw-r--r-- 1 syoung users  61220228 Sep 18 22:30 Homo_sapiens.NCBI36.49.cdna.known.bfa
        -rw-r--r-- 1 syoung users  63424830 Sep 18 22:25 s_6_2_sequence.bfq
        -rw-r--r-- 1 syoung users  54476752 Sep 18 22:25 s_6_1_sequence.bfq
        -rwxr-xr-x 1 syoung users 125265637 Sep 18 22:24 Homo_sapiens.NCBI36.49.cdna.known.fas

    
    4. Statistics from the alignment
    time maq mapcheck Homo_sapiens.NCBI36.49.cdna.known.fas out.map > mapcheck.txt

        real    33m11.099s
        user    0m1.867s
        sys     0m3.018s

OK
    
    5. Build the mapping assembly
    time maq assemble consensus.cns Homo_sapiens.NCBI36.49.cdna.known.bfa out.map 2> assemble.log    
OK
    
    6. Extract consensus sequences and qualities
    time maq cns2fq consensus.cns > cns.fq

OK

    7. Extract list of SNPs 
    time maq cns2snp consensus.cns > cns.snp

OK

4. DO SNP PREDICTION

    1. Assemble with 'map' to create 'align.map' binary file
    
    time maq map -1 25 align.map Homo_sapiens.NCBI36.49.cdna.known.bfa s_6_1_sequence.bfq s_6_2_sequence.bfq

        [align_candidate] ENST00000329291: (0, 0, 0) out of 0
        [align_candidate] ENST00000355360: (0, 0, 0) out of 5
        [maq_indel_pe] CPU time: 5.150 sec
        [match_data2mapping] 2199072 out of 6678302 raw reads are mapped with 1362794 in pairs.
        -- (total, isPE, mapped, paired) = (6678302, 1, 2199072, 1362794)
        
        real    55m21.707s
        user    55m14.019s
        sys     0m6.538s

    
    2. rmdup       remove pairs with identical outer coordinates (PE)
    
        time maq rmdup out.rmdup out.map

        [maq_rmdup_core] 0 / 0 = nan
        
        real    0m46.076s
        user    0m45.602s
        sys     0m0.258s


    3. indelpe     indel calling (PAIRED READS ONLY)
    
        time maq indelpe Homo_sapiens.NCBI36.49.cdna.known.bfa out.rmdup > out.indelpe
OK
    
    4. indelsoa    state-of-art homozygous indel detection
        
        time maq indelsoa Homo_sapiens.NCBI36.49.cdna.known.bfa align.map > out.indelsoa
            
OK

    5.  filter the indels
    
        awk '$5+$6-$4 >= 3 && $4 <= 1' out.indelsoa > out.indelsoa.filter
    
OK        
        
    6. SNPfilter    filter SNP predictions
    
        time maq.pl SNPfilter -d 1 -s out.indelsoa -F out.indelpe cns.snp &> out.SNPfilter

OK

    ll
    total 395880
    -rw-r--r-- 1 syoung users  48144828 Sep 21 04:14 align.map
    -rw-r--r-- 1 syoung users      8632 Sep 21 03:10 assemble.log
    -rw-r--r-- 1 syoung users         0 Sep 21 03:10 cns.fq
    -rw-r--r-- 1 syoung users         0 Sep 21 03:10 cns.snp
    -rw-r--r-- 1 syoung users        20 Sep 21 03:10 consensus.cns
    -rw-r--r-- 1 syoung users  61220228 Sep 18 22:30 Homo_sapiens.NCBI36.49.cdna.known.bfa
    -rwxr-xr-x 1 syoung users 125265637 Sep 18 22:24 Homo_sapiens.NCBI36.49.cdna.known.fas
    -rw-r--r-- 1 syoung users       538 Sep 21 03:07 mapcheck.txt
    -rw-r--r-- 1 syoung users         0 Sep 21 04:58 out.indelpe
    -rw-r--r-- 1 syoung users    274620 Sep 21 04:59 out.indelsoa
    -rw-r--r-- 1 syoung users     82981 Sep 21 04:59 out.indelsoa.filter
    -rw-r--r-- 1 syoung users  25967522 Sep 19 04:43 out.map
    -rw-r--r-- 1 syoung users  25967522 Sep 21 04:58 out.rmdup
    -rw-r--r-- 1 syoung users        42 Sep 21 04:59 out.SNPfilter
    -rw-r--r-- 1 syoung users  54476752 Sep 18 22:25 s_6_1_sequence.bfq
    -rw-r--r-- 1 syoung users  63424830 Sep 18 22:25 s_6_2_sequence.bfq


</entry>



<entry [Thu Sep 18 14:32:47 EDT 2008] RECURSIVE ASSEMBLY WITH SUBREADS>



http://maq.wiki.sourceforge.net/Important+Notes


Several groups are trimming reads recursively: trim the unmapped reads, redo the alignemnt again and repeat this procedure until the remaining reads become too short. I have not really tried this method. If you are using this strategy and think it really works well, please contact me and I may build this function in maq. Thank you.

</entry>



<entry [Thu Sep 18 13:32:47 EDT 2008] CHECK THAT map OUTPUT align.map IS THE SAME AS match OUTPUT out.map>



    cd /home/syoung/base/pipeline/run2-lane6-mtdna-maq/data

    time maq map -1 25 align.map human-mtDNA-AC_000021.bfa s_6_1_sequence.bfq s_6_2_sequence.bfq

    -- maq-0.6.8
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the second read as 26.
    [ma_load_reads] 3339151*2 reads loaded.
    [ma_longread2read] encoding reads... 6678302 sequences processed.
    [ma_match] set the minimum insert size as 27.
    [match_core] round 1/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 2/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 3/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] sorting the hits and dumping the results...
    [ma_load_reads] loading reads...
    [ma_load_reads] 3339151*2 reads loaded.
    [mapping_count_single] 55, 55, 55, 39
    [match_data2mapping] 120 pairs are added afterwards.
    [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
    [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
    [cal_insert_size] 89326 read pairs counted. insert size: 150.518572 +/- 14.150999
    [maq_indel_pe] 45865 candidates for alignment
    [align_candidate] gi|115315570|ref|AC_000021.2|: (92, 572, 22701) out of 45865
    [maq_indel_pe] CPU time: 2.580 sec
    [match_data2mapping] 445566 out of 6678302 raw reads are mapped with 420659 in pairs.
    -- (total, isPE, mapped, paired) = (6678302, 1, 445566, 420659)
    
    real    1m28.788s
    user    1m24.920s
    sys     0m2.684s


COMPARED TO:

time /home/syoung/base/apps/maq/maq match out.map human-mtDNA-AC_000021.bfa s_6_1_sequence.bfq s_6_2_sequence.bfq

    -- maq-0.6.8
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the first read as 26.
    [ma_load_reads] set length of the second read as 26.
    [ma_load_reads] 3339151*2 reads loaded.
    [ma_longread2read] encoding reads... 6678302 sequences processed.
    [ma_match] set the minimum insert size as 27.
    [match_core] round 1/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 2/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 3/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] sorting the hits and dumping the results...
    [ma_load_reads] loading reads...
    [ma_load_reads] 3339151*2 reads loaded.
    [mapping_count_single] 55, 55, 55, 55
    [match_data2mapping] 133 pairs are added afterwards.
    [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
    [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
    [cal_insert_size] 89304 read pairs counted. insert size: 150.520346 +/- 14.148522
    [maq_indel_pe] 45794 candidates for alignment
    [align_candidate] gi|115315570|ref|AC_000021.2|: (88, 589, 22674) out of 45794
    [maq_indel_pe] CPU time: 2.580 sec
    [match_data2mapping] 445280 out of 6678302 raw reads are mapped with 420458 in pairs.
    -- (total, isPE, mapped, paired) = (6678302, 1, 445280, 420458)
    
    real    1m33.988s
    user    1m31.497s
    sys     0m2.458s

THE DIFFERENCES ARE:

ls -al align.map 
    -rw-r--r-- 1 syoung users 8001735 Sep 18 14:37 align.map
ls -al out.map
    -rw-r--r-- 1 syoung users 8035313 Sep 12 16:46 out.map

map (OUTPUT: align.map)

    [match_data2mapping] 120 pairs are added afterwards.
    [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
    [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
    [cal_insert_size] 89326 read pairs counted. insert size: 150.518572 +/- 14.150999
    [maq_indel_pe] 45865 candidates for alignment
    [align_candidate] gi|115315570|ref|AC_000021.2|: (92, 572, 22701) out of 45865
    [maq_indel_pe] CPU time: 2.580 sec
    [match_data2mapping] 445566 out of 6678302 raw reads are mapped with 420659 in pairs.
    -- (total, isPE, mapped, paired) = (6678302, 1, 445566, 420659)


match (OUTPUT: out.map)

    [match_data2mapping] 133 pairs are added afterwards.
    [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
    [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
    [cal_insert_size] 89304 read pairs counted. insert size: 150.520346 +/- 14.148522
    [maq_indel_pe] 45794 candidates for alignment
    [align_candidate] gi|115315570|ref|AC_000021.2|: (88, 589, 22674) out of 45794
    [maq_indel_pe] CPU time: 2.580 sec
    [match_data2mapping] 445280 out of 6678302 raw reads are mapped with 420458 in pairs.
    -- (total, isPE, mapped, paired) = (6678302, 1, 445280, 420458)




++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Thu Sep 18 02:52:07 EDT 2008


Version: 0.6.8
Contact: Heng Li <lh3@sanger.ac.uk>

Usage:   maq <command> [options]

Key commands:
    fasta2bfa   convert FASTA to BFA format
    fastq2bfq   convert FASTQ to BFQ format
    map         map reads to the reference
    mapmerge    merge several alignments
    rmdup       remove pairs with identical outer coordinates (PE)
    indelpe     indel calling (PAIRED READS ONLY)
    indelsoa    state-of-art homozygous indel detection
    assemble    call the consensus
    glfgen      generate .glz consensus

Format converting:
    sol2sanger  convert Solexa FASTQ to standard/Sanger FASTQ
    mapass2maq  convert mapass2's map format to maq's map format
    bfq2fastq   convert BFQ to FASTQ format

Information extracting:
    mapview     view the mapping alignment
    mapstat     statistics about a .map file
    mapcheck    a QC command
    pileup      view the alignment in a 'pileup' like format
    cns2fq      extract the consensus sequences from a CNS file
    cns2snp     extract details from a CNS file at the SNP sites
    snpreg      calculate the length of regions where SNPs can be called
    cns2view    extract details from a CNS file at all sites
    cns2ref     extract the reference sequences from a CNS file
    cns2win     extract details in a window

SOLiD related commands:
    fasta2csfa  convert FASTA to colour-sp    FASTA
    csmap2nt    convert colour-space .map to nucleotide .map

Simulation related commands:
    fakemut     simulate references: randomly generate mutations
    simutrain   train parameters for simulation
    simulate    simulate reads: randomly generate sequencing errors
    simucns     evaluate consensus based on simulation
    simustat    evaluate alignment based on simulation

Miscellaneous/advanced utilities:
    submap      extract a region from a map file
    map validate a .map file
    subpos      extract a subset of positions
    eland2maq   convert eland alignment to maq
    export2maq  convert Solexa's export alignment to maq


Program: maq.pl (helper script for maq)
Version: 0.4.7
Contact: Heng Li <lh3@sanger.ac.uk>

Usage:   maq.pl <command> [options] <input> [...]

Command: easyrun      simple pipeline for small dataset
         demo         demonstration of maq functionalities (for SE only)
         SNPfilter    filter SNPs
         statmap      extract statistics from the error output of 'maq map'
         chrpt2snp    convert dbSNP's chr_rpt file to .snp file
         ucsc2snp     convert UCSC's SNP dump to .snp file
         fastq2bfq    convert fastq in batch
         cat2pair     convert paired end reads format
         sv           call structural variations
         indelpe      post-processing indelpe output


Usage:   maq.pl SNPfilter [options] <cns2snp.snp>

Options: -d INT        minimum depth to call a SNP [3]
         -D INT        maximum depth (<=254), otherwise ignored [256]
         -n INT        minimum neighbouring quality [20]
         -Q INT        required max mapping quality of the reads covering the SNP [40]
         -q INT        minimum consensus quality [20]
         -w INT        size of the window in which SNPs should be filtered out [5]
         -S FILE       splitread output [null]
         -F FILE       indelpe output [null]
         -f FILE       indelsoa output [null]
         -s INT        indelsoa score (= left_clip + right_clip - across) [3]
         -m INT        indelsoa: max number of reads mapped across the indel [1]
         -W INT        window size for filtering dense SNPs [10]
         -N INT        maximum number of SNPs in a window [2]
         -a            alternative filter for single end reads


indelpe 	maq indelpe in.ref.bfa in.aln.map > out.indelpe

Call consistent indels from paired end reads.   The output is TAB delimited with each line consisting of chromosome, start position, type of the indel, number of reads across the indel, size of the indel and inserted/deleted nucleotides (separated by colon), number of indels on the reverse strand, number of indels on the forward strand, 5’ sequence ahead of the indel, 3’ sequence following the indel, number of reads aligned without indels and three additional columns for filters.

At the 3rd column, type of the indel, a star indicates the indel is confirmed by reads from both strands, a plus means the indel is hit by at least two reads but from the same strand, a minus shows the indel is only found on one read, and a dot means the indel is too close to another indel and is filtered out.


indelsoa 	maq indelsoa in.ref.bfa in.aln.map > out.indelsoa

Call potential homozygous indels and break points by detecting the abnormal alignment pattern around indels and break points. The output is also TAB delimited with each line consisting of chromosome, approximate coordinate, length of the abnormal region, number of reads mapped across the position, number of reads on the left-hand side of the position and number of reads on the right-hand side. The last column can be ignored.

The output contains many false positives. A recommended filter could be:



  awk ’$5+$6-$4 >= 3 && $4 <= 1’ in.indelsoa



Note that this command does not aim to be an accurate indel detector, but mainly helps to avoid some false positives in substitution calling. In addition, it only works well given deep depth (~40X for example); otherwise the false negative rate would be very high.


cns2snp 	maq cns2snp in.cns > out.snp

Extract SNP sites. Each line consists of chromosome, position, reference base, consensus base, Phred-like consensus quality, read depth, the average number of hits of reads covering this position, the highest mapping quality of the reads covering the position, the minimum consensus quality in the 3bp flanking regions at each side of the site (6bp in total), the second best call, log likelihood ratio of the second best and the third best call, and the third best call.

The 5th column is the key criterion when you judge the reliability of a SNP. However, as this quality is only calculated assuming site independency, you should also consider other columns to get more accurate SNP calls. Script command ‘maq.pl SNPfilter’ is designed for this (see below).

The 7th column implies whether the site falls in a repetitive region. If no read covering the site can be mapped with high mapping quality, the flanking region is possibly repetitive or in the lack of good reads. A SNP at such site is usually not reliable.

The 8th column roughly gives the copy number of the flanking region in the reference genome. In most cases, this number approaches 1.00, which means the region is about unique. Sometimes you may see non-zero read depth but 0.00 at the 7th column. This indicates that all the reads covering the position have at least two mismatches. Maq only counts the number of 0- and 1-mismatch hits to the reference. This is due to a complex technical issue.

The 9th column gives the neighbouring quality. Filtering on this column is also required to get reliable SNPs. This idea is inspired by NQS, although NQS is initially designed for a single read instead of a consensus.


    

1. rmdup       remove pairs with identical outer coordinates (PE)

    maq rmdup <output.map> <input.map>

    maq rmdup out.rmdup out.map

    [maq_rmdup_core] processing reference gi|115315570|ref|AC_000021.2|...
    [maq_rmdup_core] 42003 / 200187 = 0.2098


2. indelpe     indel calling (PAIRED READS ONLY)
Usage: maq indelpe <in.ref.bfa> <in.aln.map>

    cd /home/syoung/base/pipeline/run2-lane6-mtdna-maq/data
    maq indelpe human-mtDNA-AC_000021.bfa out.rmdup > out.indelpe

    cut -f 1-10 out.indelpe
    gi|115315570|ref|AC_000021.2|   207     -       380     -1:G    1       0       AATATTACAGGCGAACATACTTACTAAAGTGT        GTTAATTAATTAATGCTTGTAGGACATAATAA        255
    gi|115315570|ref|AC_000021.2|   298     -       219     1:C     1       0       TTCCACACAGACATCATAACAAAAAATTTCCA        CCAAACCCCCCCTCCCCCGCTTCTGGCCACAG        203
    gi|115315570|ref|AC_000021.2|   301     .       195     1:G     1       0       CACACAGACATCATAACAAAAAATTTCCACCA        AACCCCCCCTCCCCCGCTTCTGGCCACAGCAC        167
    gi|115315570|ref|AC_000021.2|   302     .       187     1:C     3       0       ACACAGACATCATAACAAAAAATTTCCACCAA        ACCCCCCCTCCCCCGCTTCTGGCCACAGCACT        154
    gi|115315570|ref|AC_000021.2|   303     +       181     1:C     6       0       CACAGACATCATAACAAAAAATTTCCACCAAA        CCCCCCCTCCCCCGCTTCTGGCCACAGCACTT        141
    ...
    

3. indelsoa    state-of-art homozygous indel detection

    Usage: maq indelsoa <ref.bfa> <align.map>
    
    maq indelsoa human-mtDNA-AC_000021.bfa align.map > out.indelsoa

    gi|115315570|ref|AC_000021.2|   4       5       0       3       6       9
    gi|115315570|ref|AC_000021.2|   309     1       57      61      67      71
    gi|115315570|ref|AC_000021.2|   3106    1       66      255     63      252


4. SNPfilter    filter SNP predictions

    maq.pl SNPfilter -s out.indelsoa -F out.indelpe cns.snp &> out.SNPfilter
    
    -- 9 potential pe-indels pass the filter.
    gi|115315570|ref|AC_000021.2|   73      A       G       255     255     1.00    63      62      T       255     K
    gi|115315570|ref|AC_000021.2|   263     A       G       222     242     1.00    63      62      T       255     K
    gi|115315570|ref|AC_000021.2|   750     A       G       255     255     1.00    63      62      A       255     R
    gi|115315570|ref|AC_000021.2|   1438    A       G       255     255     1.00    63      62      T       255     K
    gi|115315570|ref|AC_000021.2|   2706    A       G       255     255     1.00    63      62      T       255     K
    ...
    
Usage:   maq.pl SNPfilter [options] <cns2snp.snp>

Options: -d INT        minimum depth to call a SNP [3]
         -D INT        maximum depth (<=254), otherwise ignored [256]
         -n INT        minimum neighbouring quality [20]
         -Q INT        required max mapping quality of the reads covering the SNP [40]
         -q INT        minimum consensus quality [20]
         -w INT        size of the window in which SNPs should be filtered out [5]
         -S FILE       splitread output [null]
         -F FILE       indelpe output [null]
         -f FILE       indelsoa output [null]
         -s INT        indelsoa score (= left_clip + right_clip - across) [3]
         -m INT        indelsoa: max number of reads mapped across the indel [1]
         -W INT        window size for filtering dense SNPs [10]
         -N INT        maximum number of SNPs in a window [2]
         -a            alternative filter for single end reads







</entry>



<entry [Fri Sep 12 14:15:06 EDT 2008] RUN MAQ ON HUMAN MITOCHONDRIAL DATA>



SEE

http://maq.sourceforge.net/maq-man.shtml#workflow


SUMMARY

    1. Convert the reference sequences to the binary fasta format
    maq fasta2bfa ref.fasta ref.bfa
    
    2. Convert the reads to the binary fastq format
    maq fastq2bfq reads.fastq reads-1.bfq
    
    3. Align the reads to the reference
    maq match reads-1.map ref.bfa reads-1.bfq
    
    4. Statistics from the alignment
    maq mapcheck ref.bfa reads-1.map >mapcheck.txt
    
    5. Build the mapping assembly
    maq assemble consensus.cns ref.bfa reads-1.map 2>assemble.log
    
    6. Extract consensus sequences and qualities
    maq cns2fq consensus.cns >cns.fq
    
    7. Extract list of SNPs 
    maq cns2snp consensus.cns >cns.snp


1. CONVERT REFERENCE SEQUENCES TO BINARY FASTA .bfa FORMAT

    (NB: Command fasta2bfa converts the file into the BFA format: Like all the binary files generated from maq, the output ref.bfa is endianness sensitive. This means, for example, the binary file generated in x86/Linux cannot be read in powerpc/AIX.)

cd /home/syoung/base/pipeline/run2-lane6-mtdna-maq/data

/home/syoung/base/apps/maq/maq fasta2bfa human-mtDNA-AC_000021.fasta human-mtDNA-AC_000021.bfa

    -- 1 sequences have been converted.



2. CONVERT .fastq READS FILE TO .bfq FORMAT

    Before doing the alignment, maq needs to convert read sequences into the BFQ.
    Given reads in a FASTQ file 'reads.fastq', command fastq2bfq achieves this function:
    
        maq fastq2bfq reads.fastq reads.bfq
    
    The output reads.bfq is compressed by zlib.


CONVERT SOLEXA QUALITY VALUES TO SANGER FASTQ QUALITY VALUES:

/home/syoung/base/apps/maq/maq sol2sanger s_6_1_sequence.txt s_6_1_sequence.fastq
/home/syoung/base/apps/maq/maq sol2sanger s_6_2_sequence.txt s_6_2_sequence.fastq

CONVERT FASTQ FILE TO BFQ FILE FORMAT:

/home/syoung/base/apps/maq/maq fastq2bfq s_6_1_sequence.fastq s_6_1_sequence.bfq
/home/syoung/base/apps/maq/maq fastq2bfq s_6_2_sequence.fastq s_6_2_sequence.bfq

    [syoung@solexa01 data]$ ll
    total 2.4G
    drwxr-xr-x 2 syoung users 4.0K Sep 12 15:40 .
    drwxr-xr-x 4 syoung users 4.0K Sep 12 15:19 ..
    -rw-r--r-- 1 syoung users 8.2K Sep 12 15:19 human-mtDNA-AC_000021.bfa
    -rw-r--r-- 1 syoung users  17K Sep 12 15:18 human-mtDNA-AC_000021.fasta
    -rw-r--r-- 1 syoung users  52M Sep 12 15:37 s_6_1_sequence.bfq
    -rw-r--r-- 1 syoung users 445M Sep 12 15:28 s_6_1_sequence.fastq
    -rw-r--r-- 1 syoung users 704M Sep 12 15:21 s_6_1_sequence.txt
    -rw-r--r-- 1 syoung users  61M Sep 12 15:42 s_6_2_sequence.bfq
    -rw-r--r-- 1 syoung users 445M Sep 12 15:30 s_6_2_sequence.fastq
    -rw-r--r-- 1 syoung users 704M Sep 12 15:22 s_6_2_sequence.txt


3. MATCH READS TO THE REFERENCE

NB: [match_data2mapping] 445280 out of 6678302 raw reads are mapped with 420458 in pairs.
    

time /home/syoung/base/apps/maq/maq match out.map human-mtDNA-AC_000021.bfa s_6_1_sequence.bfq s_6_2_sequence.bfq

    -- maq-0.6.8
    [ma_load_reads] loading reads...
    [ma_load_reads] set length of the first read as 26.
    [ma_load_reads] set length of the second read as 26.
    [ma_load_reads] 3339151*2 reads loaded.
    [ma_longread2read] encoding reads... 6678302 sequences processed.
    [ma_match] set the minimum insert size as 27.
    [match_core] round 1/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 2/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] round 3/3...
    [match_core] making index...
    [match_core] processing sequence gi|115315570|ref|AC_000021.2| (16569 bp)...
    [match_core] sorting the hits and dumping the results...
    [ma_load_reads] loading reads...
    [ma_load_reads] 3339151*2 reads loaded.
    [mapping_count_single] 55, 55, 55, 55
    [match_data2mapping] 133 pairs are added afterwards.
    [match_data2mapping] (0, 0) reads are moved to meet paired-end requirement.
    [match_data2mapping] quality counts of the first reads: (0, 0); second reads (0, 0)
    [cal_insert_size] 89304 read pairs counted. insert size: 150.520346 +/- 14.148522
    [maq_indel_pe] 45794 candidates for alignment
    [align_candidate] gi|115315570|ref|AC_000021.2|: (88, 589, 22674) out of 45794
    [maq_indel_pe] CPU time: 2.580 sec
    [match_data2mapping] 445280 out of 6678302 raw reads are mapped with 420458 in pairs.
    -- (total, isPE, mapped, paired) = (6678302, 1, 445280, 420458)
    
    real    1m33.988s
    user    1m31.497s
    sys     0m2.458s
    
    The match command aligns reads in the BFQ format to the reference in the BFA format. If only one read file reads.bfq is provided, match command will do single-end alignment:
    
    maq match out.map ref.bfa reads.bfq
    
    If two read files, reads1.bfq and reads2.bfq for example, are provided, paired-end alignment will be performed:
    
        maq match out.map ref.bfa reads1.bfq reads2.bfq

    And in this paired-end case, reads1.bfq and reads2.bfq must consist of the same number of reads, and the name of the n-th sequence in the first file must be identical to the n-th one in the second file. Minimum or maximum insert size can be adjusted on the command line by providing -i or -a options, respectively. More options are presented in the reference manual.

    Maq usually performs better if the number of reads is around 2 million, which is about the number of reads in one lane of Solexa output. Too few or too many reads will likely yield bad efficiency.
        
    The output out.map is a compressed binary file. It stores the sequences, qualities, positions of the mapped reads and related information such as the number of mismatches and the mapping quality. The positions are sorted to faciliate subsequent steps.



4. GET STATISTICS FROM THE ALIGNMENT

/home/syoung/base/apps/maq/maq em human-mtDNA-AC_000021.bfa out.map > mapcheck.txt

    [ma_mapcheck] processing gi|115315570|ref|AC_000021.2|...

head mapcheck.txt 

    Number of reference sequences: 1
    Length of reference sequences exlcuding gaps: 16568
    Length of gaps in the reference sequences: 1
    Length of non-gap regions covered by reads: 16568
    Length of 24bp unique regions of the reference: 16568
    Reference nucleotide composition: A: 30.93%, C: 31.27%, G: 13.09%, T: 24.71%
    Reads nucleotide composition:     A: 30.40%, C: 31.52%, G: 13.39%, T: 24.69%
    Average depth across all non-gap regions: 626.220
    Average depth across 24bp unique regions: 626.220


5. BUILD THE MAPPING ASSEMBLY

/home/syoung/base/apps/maq/maq assemble consensus.cns human-mtDNA-AC_000021.bfa out.map 2> assemble.log

ll
    total 2475292
    -rw-r--r-- 1 syoung users      8709 Sep 12 16:54 assemble.log
    -rw-r--r-- 1 syoung users     24212 Sep 12 16:54 consensus.cns
    -rw-r--r-- 1 syoung users      8330 Sep 12 15:19 human-mtDNA-AC_000021.bfa
    -rw-r--r-- 1 syoung users     16880 Sep 12 15:18 human-mtDNA-AC_000021.fasta
    -rw-r--r-- 1 syoung users      3216 Sep 12 16:52 mapcheck.txt
    -rw-r--r-- 1 syoung users   8035313 Sep 12 16:46 out.map
    -rw-r--r-- 1 syoung users  54476752 Sep 12 15:37 s_6_1_sequence.bfq
    -rw-r--r-- 1 syoung users 465576949 Sep 12 15:28 s_6_1_sequence.fastq
    -rw-r--r-- 1 syoung users 737483140 Sep 12 15:21 s_6_1_sequence.txt
    -rw-r--r-- 1 syoung users  63424830 Sep 12 15:42 s_6_2_sequence.bfq
    -rw-r--r-- 1 syoung users 465576949 Sep 12 15:30 s_6_2_sequence.fastq
    -rw-r--r-- 1 syoung users 737483140 Sep 12 15:22 s_6_2_sequence.txt


6. EXTRACT CONSENSUS SEQUENCES AND QUALITIES

/home/syoung/base/apps/maq/maq cns2fq consensus.cns > cns.fq

    head cns.fq
    @gi|115315570|ref|AC_000021.2|
    gatCACAGGTCTATCACCCTATTAACCACTCACGGGAGCTCTCCATGCATTTGGTATTTT
    CGTCTGGGGGGTGTGCACGCGATAGCATTGCGAGACGCTGGAGCCGGAGCACCCTATGTC
    GCAGTATCTGTCTTTGATTCCTGCCTCATCCTATTATTTATCGCACCTACGTTCAATATT
    ACAGGCGAACATACTTACTAAAGTGTGTTAATTAATTAATGCTTGTAGGACATAATAATA
    ACAATTGAATGTCTGCACAGCCGCTTTCCACACAGACATCATAACAAAAAATTTCCACCA
    AACCCCCCYCCCCCCGCTTCTGGCCACAGCACTTAAACACATCTCTGCCAAACCCCAAAA
    ACAAAGAACCCTAACACCAGCCTAACCAGATTTCAAATTTTATCTTTTGGCGGTATGCAC
    TTTTAACAGTCACCCCCCAACTAACACATTATTTTCCCCTCCCACTCCCATACTACTAAT
    CTCATCAATACAACCCCCGCCCATCCTACCCAGCACACACACACCGCTGCTAACCCCATA


7. EXTRACT LIST OF SNPs

/home/syoung/base/apps/maq/maq cns2snp consensus.cns > cns.snp

head cns.snp

    gi|115315570|ref|AC_000021.2|   73      A       G       255     255     1.00    63      62      T       255     K
    gi|115315570|ref|AC_000021.2|   263     A       G       222     242     1.00    63      62      T       255     K
    gi|115315570|ref|AC_000021.2|   309     C       Y       65      130     1.00    63      62      C       53      T
    gi|115315570|ref|AC_000021.2|   310     T       C       181     142     1.00    63      62      A       232     M
    gi|115315570|ref|AC_000021.2|   750     A       G       255     255     1.00    63      62      A       255     R
    gi|115315570|ref|AC_000021.2|   1438    A       G       255     255     1.00    63      62      T       255     K
    gi|115315570|ref|AC_000021.2|   2706    A       G       255     255     1.00    63      62      T       255     K
    gi|115315570|ref|AC_000021.2|   3107    N       T       76      140     1.00    63      44      Y       67      C
    gi|115315570|ref|AC_000021.2|   3109    T       Y       79      176     1.00    63      44      T       32      C
    gi|115315570|ref|AC_000021.2|   3110    C       M       44      175     1.00    63      62      C       51      A


http://maq.sourceforge.net/maq-man.shtml#easyout

cns2snp 	maq cns2snp in.cns > out.snp

Extract SNP sites. Each line consists of chromosome, position, reference base, consensus base, Phred-like consensus quality, read depth, the average number of hits of reads covering this position, the highest mapping quality of the reads covering the position, the minimum consensus quality in the 3bp flanking regions at each side of the site (6bp in total), the second best call, log likelihood ratio of the second best and the third best call, and the third best call.

The 5th column is the key criterion when you judge the reliability of a SNP. However, as this quality is only calculated assuming site independency, you should also consider other columns to get more accurate SNP calls. Script command ‘maq.pl SNPfilter’ is designed for this (see below).

The 7th column implies whether the site falls in a repetitive region. If no read covering the site can be mapped with high mapping quality, the flanking region is possibly repetitive or in the lack of good reads. A SNP at such site is usually not reliable.

The 8th column roughly gives the copy number of the flanking region in the reference genome. In most cases, this number approaches 1.00, which means the region is about unique. Sometimes you may see non-zero read depth but 0.00 at the 7th column. This indicates that all the reads covering the position have at least two mismatches. Maq only counts the number of 0- and 1-mismatch hits to the reference. This is due to a complex technical issue.

The 9th column gives the neighbouring quality. Filtering on this column is also required to get reliable SNPs. This idea is inspired by NQS, although NQS is initially designed for a single read instead of a consensus.


XXXXXXXXXXXXXXXX DIDN'T DO THE REST (SEE ABOVE)

9. Run "maq.pl SNPfilter" to further filter out false SNPs. 

/home/syoung/base/apps/maq/maq SNPfilter cns.snp > filter.snp
    



8. VIEW THE READ ALIGNMENT mapview

/home/syoung/base/apps/maq/maq mapview out.map > out.alignments

head out.alignments 
all_Medium_read2_JH:6:84:698:602/1     gi|115315570|ref|AC_000021.2|   1       +       151     18      99      80      74      0       0       1       0       26      gatcacaggtctatcaccctattaac        55555555555555555555555555
all_Medium_read2_JH:6:154:356:284/1     gi|115315570|ref|AC_000021.2|   1       +       0       64      80      80      0       0       0       1       0       26      gatcacaggtctatcaccctattaac        55555555555555555555555555
all_Medium_read2_JH:6:154:356:284/2     gi|115315570|ref|AC_000021.2|   1       +       0       192     0       0       0       0       0       0       0       26      cgcgccacgcacccccgcccgctccc        777''7'7''7'7'''7''7-''--'
all_Medium_read2_JH:6:200:474:750/1     gi|115315570|ref|AC_000021.2|   1       +       0       64      59      59      0       1       13      0       1       26      gatcacaggcctatcaccctattaac        ....................%%%%%%
all_Medium_read2_JH:6:200:474:750/2     gi|115315570|ref|AC_000021.2|   1       +       0       192     0       0       0       0       0       0       0       26      ctatcgcgtgcccacccccttcccgg        777777'777777'7'7''7'''-''


    The read sequences together with the positions can be extracted from out.map with command mapview:
    
          maq mapview out.map
    
    The information will be printed on the screen, delimited by TAB. The format is explained in the maq reference manual.
    




8. mapmerge: Merge Read Alignments
==================================   
    
    As described above, match usually takes 2 million reads as input. What about large scale resequencing where 100 million reads will be generated? The preferred way is to divide reads into 50 batches with each batch containing about 2 million reads. After the alignment of 50 batches, we can merge the results with the mapmerge command. This command merge several alignments together and output one alignment in the same format as the input. For example:
    


          maq mapmerge out.map in1.map in2.map in3.map
    
    where out.map is the output.
    
    In theory, mapmerge can merge unlimited number of alignments. However, as mapmerge will be reading all the inputs at the same time, it may hit the OS limit of the maximum number of opening files. At present, this has to be manually solved by endusers.
    assemble: Build Mapping Assemblies
    
    The ultimate goal of maq is to give reliable SNPs. Command assemble achieve this by taking the alignment file as the input:
    
          maq assemble out.cns ref.bfa in.map
    

    Some basic statistics will be output in the error output. Consensus sequences and qualities will be stored in out.cns, a compressed binary file. We will provide a Perl script to extract detailed information from this file.
    
    Other Commands: Extract Information from Binary Files
    
    Command cns2ref extract the reference sequences from the consensus file and cns2fq extract the consensus sequences and their qualities.
    
    Command cns2snp directly gives the list of SNPs and additional information at the SNP sites. The format is explained in the maq reference manual.
    
    



</entry>



<entry [Wed Aug 27 01:15:49 EDT 2008] Mapass2 Paired End Alignment>




http://maq.wiki.sourceforge.net/Mapass2+Paired+End+Alignment


Mapass2 Paired End Alignment

Mapass2 is able to do paired end alignment. The algorithm behind differs from aligning reads independently. To implement paired end alignment is one of the main reasons that I stopped the development of mapass, the legacy version, one month ago.

To my experience, the paired end alignment can greatly increase the accuracy of read mapping. It should be used whenever possible.


</entry>



<entry [Friday Aug  08:05:37 EDT 2008] DOWNLOAD AND INSTALL maq>




1. DOWNLOAD

http://maq.sourceforge.net/

    Introduction
    
    Maq stands for Mapping and Assembly with Quality It builds assembly by mapping short reads to reference sequences. Maq is a project hosted by SourceForge.net. The project page is available at http://sourceforge.net/projects/maq/. Maq is previously known as mapass2.
    Run Maq Now
    
    Follow these steps to try Maq. All you need is a reference sequence file in the FASTA format.
    
       1. Prepare a reference sequence (ref.fasta). Better a bacterial genome.
       2. Download maq, maq-data and maqview at the download page.
       3. Copy maq, maq.pl and maq_eval.pl to the $PATH or to the same directory.
       4. Simulate diploid reference and read sequences, map reads, call variants and evaluate the results in one go:
    
                maq.pl demo ref.fasta calib-30.dat
    
          where calib-30.dat is contained in maq-data.
       5. View the alignment:
    
                cd maqdemo/easyrun;
                maqindex -i -c consensus.cns all.map;
                maqview -c consensus.cns all.map
    
    Even for advanced maq users, running `maq.pl demo' is recommended. You may find something helpful.


2. INSTALL


    cd /store/home/syoung/base/apps/maq
    
    [syoung@solexa01 maq]$ ll
        -rw-r--r--  1 syoung users 262K Aug  8 00:40 maq-0.6.8_i686-linux.tar.bz2
        -rw-r--r--  1 syoung users 1.4M Aug  8 00:41 maq-data-20070905.tar.bz2
        -rw-r--r--  1 syoung users 235K Aug  8 00:41 maqview-0.2.3_i686-linux.tar.bz2
    
    [syoung@solexa01 maq]$ tar xvfj maq-0.6.8_i686-linux.tar.bz2 
        maq-0.6.8_i686-linux/
        maq-0.6.8_i686-linux/asub
        maq-0.6.8_i686-linux/maq
        maq-0.6.8_i686-linux/maq.1
        maq-0.6.8_i686-linux/maq.pdf
        maq-0.6.8_i686-linux/maq.pl
        maq-0.6.8_i686-linux/maq_eval.pl
        maq-0.6.8_i686-linux/paf_utils.pl

    [syoung@solexa01 maq]$ tar xvfj maq-data-20070905.tar.bz2 
        maq-data-20070905/
        maq-data-20070905/calib-25.dat
        maq-data-20070905/calib-30.dat
        maq-data-20070905/raw-36.dat
        maq-data-20070905/raw-51.dat

    [syoung@solexa01 maq]$ tar xvfj maqview-0.2.3_i686-linux.tar.bz2 
        maqview-0.2.3_i686-linux/
        maqview-0.2.3_i686-linux/maqindex
        maqview-0.2.3_i686-linux/maqview
        maqview-0.2.3_i686-linux/maqview.1
        maqview-0.2.3_i686-linux/maqview.pdf
        maqview-0.2.3_i686-linux/zrio

    [syoung@solexa01 maq]$ ll
        total 2.0M
        drwxr-xr-x  5 syoung users 4.0K Aug  8 00:42 .
        drwxr-xr-x 22 syoung users 4.0K Aug  8 00:41 ..
        drwxr-xr-x  2 syoung users 4.0K Jul 27 14:21 maq-0.6.8_i686-linux
        -rw-r--r--  1 syoung users 262K Aug  8 00:40 maq-0.6.8_i686-linux.tar.bz2
        drwxr-xr-x  2 syoung users 4.0K Sep  5  2007 maq-data-20070905
        -rw-r--r--  1 syoung users 1.4M Aug  8 00:41 maq-data-20070905.tar.bz2
        drwxr-xr-x  2 syoung users 4.0K Mar 17 10:21 maqview-0.2.3_i686-linux
        -rw-r--r--  1 syoung users 235K Aug  8 00:41 maqview-0.2.3_i686-linux.tar.bz2


3. COPY maq, maq.pl AND maq_eval.pl to the $PATH or to the same directory.

    cd /store/home/syoung/base/apps/maq
    cp maq-0.6.8_i686-linux/maq ./
    cp maq-0.6.8_i686-linux/maq.pl ./
    cp maq-0.6.8_i686-linux/maq_eval.pl ./

    cp maq-data-20070905/calib-30.dat ./




    COPY .FASTQ DATA FILES:
    
    cp /home/syoung/base/pipeline/human1/data/human1_sequence_in.solexa ./    
    cp /home/syoung/base/pipeline/human1/data/human1_sequence_in.solexa.fasta ./    
    cp /home/syoung/base/pipeline/human1/data/human1_sequence_in.solexa.fasta.qual ./    
    cp /home/syoung/base/pipeline/human-cdna/embl/Homo_sapiens.NCBI36.49.cdna.known.fas ./    

4. RUN maq.pl

    [syoung@solexa01 maq]$ ./maq.pl demo
    
    Usage:   maq.pl demo [-N npairs] [-d outdir] [-h] <in.fa> <in.simudat>
    
    Options: -N INT    number of read pairs [1000000]
             -d DIR    output directory [maqdemo]
             -s        single-end mode in alignment
             -h        haploid mode in simulation


    DID DEMO BUT FAILED:

        NB: Simulate diploid reference and read sequences, map reads, call variants and evaluate the results in one go:
    
            ./maq.pl demo ref.fasta calib-30.dat
            
        where calib-30.dat is contained in maq-data.
    
    
        ./maq.pl demo human1_sequence_in.solexa Homo_sapiens.NCBI36.49.cdna.known.fas

    
            -- CMD: mkdir -p maqdemo
            -- CMD: /store/home/syoung/base/apps/maq/maq simulate -N 1000000 maqdemo/r1.fq maqdemo/r2.fq human1_sequence_in.solexa.fasta Homo_sapiens.NCBI36.49.cdna.known.fas > maqdemo/true.snp
            -- 4756220 sequences, total length: 161711480
            [maq_simulate_core] Each reference sequence should be longer than dist+2*stddev. Abort!
            ** fail to run command '/store/home/syoung/base/apps/maq/maq simulate -N 1000000 maqdemo/r1.fq maqdemo/r2.fq human1_sequence_in.solexa.fasta Homo_sapiens.NCBI36.49.cdna.known.fas > maqdemo/true.snp' at ./maq.pl line 842.


5. RUN IN STEPS WITH DIFFERENT MAQ COMMANDS

fasta2bfa: Convert Reference Sequences
======================================

    ./maq fasta2bfa Homo_sapiens.NCBI36.49.cdna.known.fas Homo_sapiens.NCBI36.49.cdna.known.bfa

        -- 43367 sequences have been converted.

        ll
        -rw-r--r--  1 syoung users 166K Aug  8 00:51 calib-30.dat
        -rw-r--r--  1 syoung users  59M Aug  8 01:16 Homo_sapiens.NCBI36.49.cdna.known.bfa
        -rw-r--r--  1 syoung users 120M Aug  8 00:59 Homo_sapiens.NCBI36.49.cdna.known.fas
        -rw-r--r--  1 syoung users 338M Aug  8 00:59 human1_sequence_in.solexa.fasta
        ...


    Given reference sequences in a fasta file ref.fasta, command fasta2bfa converts the file into the BFA format:
        maq fasta2bfa ref.fasta ref.bfa
    
    Like all the binary files generated from maq, the output ref.bfa is endianness sensitive. This means, for example, the binary file generated in x86/Linux cannot be read in powerpc/AIX.


fastq2bfq: Convert Reads
========================

./maq fastq2bfq human1_sequence_in.solexa human1_sequence_in.solexa.bfq

    -- finish writing file 'human1_sequence_in.solexa.bfq'
    -- 4756221 sequences were loaded.


    Before doing the alignment, maq needs to convert read sequences into the BFQ.
    Given reads in a FASTQ file 'reads.fastq', command fastq2bfq achieves this function:
    
        maq fastq2bfq reads.fastq reads.bfq
    
    The output reads.bfq is compressed by zlib.



6. MATCH LONG READS TO THE REFERENCE
====================================

./maq match out.map Homo_sapiens.NCBI36.49.cdna.known.bfa human1_sequence_in.solexa.bfq

    ...
    [match_core] processing sequence ENST00000391820 (458 bp)...
    [match_core] processing sequence ENST00000329291 (1973 bp)...
    [match_core] processing sequence ENST00000355360 (2078 bp)...
    [match_core] sorting the hits and dumping the results...
    [ma_load_reads] loading reads...
    [ma_load_reads] 4756221*2 reads loaded.
    [mapping_count_single] 1, 17, 24, 59
    [maq_indel_pe] the indel detector only works with short-insert mate-pair reads.
    [match_data2mapping] 1085426 out of 9512442 raw reads are mapped with 0 in pairs.
    -- (total, isPE, mapped, paired) = (4756221, 0, 1085426, 0)

    ll
        -rw-r--r--  1 syoung users  23M Aug  8 01:45 out.map




        The match command aligns reads in the BFQ format to the reference in the BFA format. If only one read file reads.bfq is provided, match command will do single-end alignment:
    
        maq match out.map ref.bfa reads.bfq
    
        If two read files, reads1.bfq and reads2.bfq for example, are provided, paired-end alignment will be performed:
        
              maq match out.map ref.bfa reads1.bfq reads2.bfq
        
        And in this paired-end case, reads1.bfq and reads2.bfq must consist of the same number of reads, and the name of the n-th sequence in the first file must be identical to the n-th one in the second file. Minimum or maximum insert size can be adjusted on the command line by providing -i or -a options, respectively. More options are presented in the reference manual.
        
        Maq usually performs better if the number of reads is around 2 million, which is about the number of reads in one lane of Solexa output. Too few or too many reads will likely yield bad efficiency.
        
        The output out.map is a compressed binary file. It stores the sequences, qualities, positions of the mapped reads and related information such as the number of mismatches and the mapping quality. The positions are sorted to faciliate subsequent steps.
    
[syoung@solexa01 maq]$ head out.alignments 
    I-EAS185_1_JIA_cDNA_JH:3:29:554:263     ENST00000361390 1       -       0       0       0       0       0       0       0       2       0       35      ATACCCATGGCCAACCTCCTACTCCTCATTGTACC     NNNNNSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    -EAS185_1_JIA_cDNA_JH:3:247:814:690     ENST00000361390 1       -       0       0       0       0       0       0       0       2       0       35      ATACCCATGGCCAACCTCCTACTCCTCATTGTACC     NNNNNSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    -EAS185_1_JIA_cDNA_JH:3:218:958:271     ENST00000361390 2       +       0       0       0       0       0       0       0       2       0       35      TACCCATGGCCAACCTCCTACTCCTCATTGTACCC     SSSSSSSSSSSSSSSSSSSSSSSSSSSSSJNNNNN
    I-EAS185_1_JIA_cDNA_JH:3:23:379:710     ENST00000361390 2       -       0       0       0       0       0       0       0       2       0       35      TACCCATGGCCAACCTCCTACTCCTCATTGTACCC     NNNNNSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    WI-EAS185_1_JIA_cDNA_JH:3:34:355:56     ENST00000361390 2       -       0       0       0       0       0       0       0       2       0       35      TACCCATGGCCAACCTCCTACTCCTCATTGTACCC     GNNNNSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    -EAS185_1_JIA_cDNA_JH:3:184:673:638     ENST00000361390 2       -       0       0       0       0       0       1       30      2       0       35      aACCCATGGCCAACCTCCTACTCCTCATTGTACCC     +NNNNSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    -EAS185_1_JIA_cDNA_JH:3:238:767:581     ENST00000361390 2       -       0       0       0       0       0       0       0       2       0       35      TACCCATGGCCAACCTCCTACTCCTCATTGTACCC     NNNNNSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    I-EAS185_1_JIA_cDNA_JH:3:47:616:950     ENST00000361390 3       -       0       0       0       0       0       1       30      2       0       35      ACCCAGGGCCAACCTCCTACTCCTCATTGTACCCA     ENNNNASSNISSSSSSSSSSSSSSSSSSSSSSSSS
    -EAS185_1_JIA_cDNA_JH:3:300:363:253     ENST00000361390 3       -       0       0       0       0       0       0       0       2       0       35      ACCCATGGCCAACCTCCTACTCCTCATTGTACCCA     HNNNNSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
    I-EAS185_1_JIA_cDNA_JH:3:258:69:721     ENST00000361390 4       -       0       0       0       0       0       0       0       2       0       35      CCCATGGCCAACCTCCTACTCCTCATTGTACCCAT     NNNNNSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS


#
#5. View the alignment
#=====================
#
#./maqindex -i -c consensus.cns out.map;
#
#    -- Indexing the alignment file 'out.map' ... DONE!
#    -- Indexing the consensus file 'consensus.cns' ... Segmentation fault
#
#./maqview -c consensus.cns out.map
#    
#    FAILED TO DISPLAY (LIKELY BECAUSE OF SEGMENTATON FAULT ABOVE)


Statistics from the alignment
=============================

./maq mapcheck Homo_sapiens.NCBI36.49.cdna.known.bfa out.map > mapcheck.txt

[syoung@solexa01 maq]$ head mapcheck.txt 

    Number of reference sequences: 43367
    Length of reference sequences exlcuding gaps: 119335011
    Length of gaps in the reference sequences: 27
    Length of non-gap regions covered by reads: 12428619
    Length of 24bp unique regions of the reference: 4165597
    Reference nucleotide composition: A: 26.00%, C: 24.65%, G: 24.99%, T: 24.36%
    Reads nucleotide composition:     A: 30.53%, C: 21.61%, G: 21.47%, T: 26.39%
    Average depth across all non-gap regions: 0.318
    Average depth across 24bp unique regions: 0.363


Build the mapping assembly
==========================

./maq assemble consensus.cns Homo_sapiens.NCBI36.49.cdna.known.bfa out.map 2> assemble.log

ll
    total 2229112
    drwxr-xr-x 6 syoung users      4096 Aug  8 14:03 archive
    -rw-r--r-- 1 syoung users   2430693 Aug  8 02:54 assemble.log
    -rw-r--r-- 1 syoung users    169471 Aug  8 00:51 calib-30.dat
    -rw-r--r-- 1 syoung users  72348371 Aug  8 02:54 consensus.cns
    -rw-r--r-- 1 syoung users  61220228 Aug  8 01:16 Homo_sapiens.NCBI36.49.cdna.known.bfa
    -rw-r--r-- 1 syoung users 125265637 Aug  8 00:59 Homo_sapiens.NCBI36.49.cdna.known.fas
    -rw-r--r-- 1 syoung users 718019332 Aug  8 01:20 human1_sequence_in.solexa
    -rw-r--r-- 1 syoung users  87038751 Aug  8 01:25 human1_sequence_in.solexa.bfq
    -rw-r--r-- 1 syoung users 354253372 Aug  8 00:59 human1_sequence_in.solexa.fasta
    -rw-r--r-- 1 syoung users 669133428 Aug  8 01:03 human1_sequence_in.solexa.fasta.qual
    -rw-r--r-- 1 syoung users      4999 Aug  8 02:51 mapcheck.txt
    -rwxr-xr-x 1 syoung users    198196 Aug  8 00:51 maq
    -rwxr-xr-x 1 syoung users     10995 Aug  8 01:00 maq_eval.pl
    -rwxr-xr-x 1 syoung users     28813 Aug  8 00:51 maq.pl
    -rw-r--r-- 1 syoung users 166218096 Aug  8 02:38 out.alignments
    -rw-r--r-- 1 syoung users  23877135 Aug  8 01:45 out.map



Extract consensus sequences and qualities
=========================================

./maq cns2fq consensus.cns >cns.fq

ll 
    drwxr-xr-x 6 syoung users      4096 Aug  8 14:03 archive
    -rw-r--r-- 1 syoung users 243514549 Aug  8 14:04 cns.fq
    -rw-r--r-- 1 syoung users  72348371 Aug  8 02:54 consensus.cns-rw-r--r-- 1 syoung users  61220228 Aug  8 01:16 Homo_sapiens.NCBI36.49.cdna.known.bfa-rw-r--r-- 1 syoung users 125265637 Aug  8 00:59 Homo_sapiens.NCBI36.49.cdna.known.fas
    -rw-r--r-- 1 syoung users 718019332 Aug  8 01:20 human1_sequence_in.solexa
    -rw-r--r-- 1 syoung users  87038751 Aug  8 01:25 human1_sequence_in.solexa.bfq
    -rw-r--r-- 1 syoung users 354253372 Aug  8 00:59 human1_sequence_in.solexa.fasta-rw-r--r-- 1 syoung users 669133428 Aug  8 01:03 human1_sequence_in.solexa.fasta.qual
    -rw-r--r-- 1 syoung users      4999 Aug  8 02:51 mapcheck.txt
    -rwxr-xr-x 1 syoung users    198196 Aug  8 00:51 maq
    -rwxr-xr-x 1 syoung users     10995 Aug  8 01:00 maq_eval.pl
    -rwxr-xr-x 1 syoung users     28813 Aug  8 00:51 maq.pl
    -rw-r--r-- 1 syoung users 166218096 Aug  8 02:38 out.alignments
    -rw-r--r-- 1 syoung users  23877135 Aug  8 01:45 out.map

Extract list of SNPs 
====================

./maq cns2snp consensus.cns >cns.snp

[syoung@solexa01 maq]$ ll
    drwxr-xr-x 6 syoung users      4096 Aug  8 14:03 archive
    -rw-r--r-- 1 syoung users   2430693 Aug  8 02:54 assemble.log
    -rw-r--r-- 1 syoung users    169471 Aug  8 00:51 calib-30.dat
    -rw-r--r-- 1 syoung users 243514549 Aug  8 14:04 cns.fq
    -rw-r--r-- 1 syoung users   5189229 Aug  8 15:13 cns.snp
    -rw-r--r-- 1 syoung users  72348371 Aug  8 02:54 consensus.cns-rw-r--r-- 1 syoung users  61220228 Aug  8 01:16 Homo_sapiens.NCBI36.49.cdna.known.bfa-rw-r--r-- 1 syoung users 125265637 Aug  8 00:59 Homo_sapiens.NCBI36.49.cdna.known.fas
    -rw-r--r-- 1 syoung users 718019332 Aug  8 01:20 human1_sequence_in.solexa
    -rw-r--r-- 1 syoung users  87038751 Aug  8 01:25 human1_sequence_in.solexa.bfq
    -rw-r--r-- 1 syoung users 354253372 Aug  8 00:59 human1_sequence_in.solexa.fasta-rw-r--r-- 1 syoung users 669133428 Aug  8 01:03 human1_sequence_in.solexa.fasta.qual
    -rw-r--r-- 1 syoung users      4999 Aug  8 02:51 mapcheck.txt
    -rwxr-xr-x 1 syoung users    198196 Aug  8 00:51 maq
    -rwxr-xr-x 1 syoung users     10995 Aug  8 01:00 maq_eval.pl
    -rwxr-xr-x 1 syoung users     28813 Aug  8 00:51 maq.pl
    -rw-r--r-- 1 syoung users 166218096 Aug  8 02:38 out.alignments
    -rw-r--r-- 1 syoung users  23877135 Aug  8 01:45 out.map

head cns.snp

    ENST00000361390 240     C       A       19      7       2.00    0       6       N       29      N
    ENST00000361390 882     A       G       21      28      2.00    0       20      N       91      N
    ENST00000391565 240     C       A       22      8       2.00    0       18      N       29      N
    ENST00000391565 882     A       G       22      22      2.00    0       20      N       71      N
    ENST00000391565 958     G       R       12      2       1.00    63      30      G       5       A
    ENST00000391565 962     T       A       10      1       1.00    63      0       N       20      N
    ENST00000391565 1057    T       Y       42      8       1.00    63      48      T       141     C
    ENST00000391565 1334    C       A       14      41      2.00    0       2       N       137     N
    ENST00000361453 171     C       A       10      37      2.00    0       2       N       129     N
    ENST00000391564 53      T       Y       54      4       1.00    63      38      T       7       C


7. mapview: View the Read Alignment
===================================

./maq mapview out.map > out.alignments


    The read sequences together with the positions can be extracted from out.map with command mapview:
    
          maq mapview out.map
    
    The information will be printed on the screen, delimited by TAB. The format is explained in the maq reference manual.
    



8. mapmerge: Merge Read Alignments
==================================   
    
    As described above, match usually takes 2 million reads as input. What about large scale resequencing where 100 million reads will be generated? The preferred way is to divide reads into 50 batches with each batch containing about 2 million reads. After the alignment of 50 batches, we can merge the results with the mapmerge command. This command merge several alignments together and output one alignment in the same format as the input. For example:
    


          maq mapmerge out.map in1.map in2.map in3.map
    
    where out.map is the output.
    
    In theory, mapmerge can merge unlimited number of alignments. However, as mapmerge will be reading all the inputs at the same time, it may hit the OS limit of the maximum number of opening files. At present, this has to be manually solved by endusers.
    assemble: Build Mapping Assemblies
    
    The ultimate goal of maq is to give reliable SNPs. Command assemble achieve this by taking the alignment file as the input:
    
          maq assemble out.cns ref.bfa in.map
    

    Some basic statistics will be output in the error output. Consensus sequences and qualities will be stored in out.cns, a compressed binary file. We will provide a Perl script to extract detailed information from this file.
    
    Other Commands: Extract Information from Binary Files
    
    Command cns2ref extract the reference sequences from the consensus file and cns2fq extract the consensus sequences and their qualities.
    
    Command cns2snp directly gives the list of SNPs and additional information at the SNP sites. The format is explained in the maq reference manual.






</entry>



<entry [Friday Aug  06:05:37 EDT 2008] THE MAQ MANPAGE>




Manual Reference Pages  - MAQ (1)
NAME

    Maq - Mapping and Assembly with Qualities 

CONTENTS

    Synopsis
    Description
    Maq Commands
         Key Commands
         Format Converting
         Information Extracting
         Simulation Related
         SOLiD Related
         Miscellaneous/Advanced Commands
    Maq-perl Commands
    Examples
    License
    Availability
    Author

SYNOPSIS

    maq command [options] arguments

    maq.pl command [options] arguments 

DESCRIPTION

    Maq is a software that builds mapping assemblies from short reads generated by the next-generation sequencing machines. It is particularly designed for Illumina-Solexa 1G Genetic Analyzer, and has a preliminary functionality to handle AB SOLiD data.

    With Maq you can:
    o 	Fast align Illumina/SOLiD reads to the reference genome. With the default options, one million pairs of reads can be mapped to the human genome in about 10 CPU hours with less than 1G memory.
    o 	Accurately measure the error probability of the alignment of each individual read.
    o 	Call the consensus genotypes, including homozygous and heterozygous polymorphisms, with a Phred probabilistic quality assigned to each base.
    o 	Find short indels with paired end reads.
    o 	Accurately find large scale genomic deletions and translocations with paired end reads.
    o 	Discover potential CNVs by checking read depth.
    o 	Evaluate the accuracy of raw base qualities from sequencers and help to check the systematic errors.
    However, Maq can NOT:
    o 	Do de novo assembly. (Maq can only call the consensus by mapping reads to a known reference.)
    o 	Map shorts reads against themselves. (Maq can only find complete overlap between reads.)
    o 	Align capillary reads or 454 reads to the reference. (Maq cannot align reads longer than 63bp.)

MAQ COMMANDS

Key Commands

    fasta2bfa 	maq fasta2bfa in.ref.fasta out.ref.bfa

    Convert sequences in FASTA format to Maq’s BFA (binary FASTA) format.
    fastq2bfq 	maq fastq2bfq [-n nreads] in.read.fastq out.read.bfq|out.prefix

    Convert reads in FASTQ format to Maq’s BFQ (binary FASTQ) format.

    OPTIONS:
    -n INT 	number of reads per file [not specified]
    map 	maq map [-n nmis] [-a maxins] [-c] [-1 len1] [-2 len2] [-d adap3] [-m mutrate] [-u unmapped] [-e maxerr] [-M c|g] [-N] [-H allhits] [-C maxhits] out.aln.map in.ref.bfa in.read1.bfq [in.read2.bfq] 2> out.map.log

    Map reads to the reference sequences.

    OPTIONS:
    -n INT 	Number of maximum mismatches that can always be found [2]
    -a INT 	Maximum outer distance for a correct read pair [250]
    -A INT 	Maximum outer distance of two RF paied read (0 for disable) [0]
    -c 	Map reads in the colour space (for SOLiD only)
    -1 INT 	Read length for the first read, 0 for auto [0]
    -2 INT 	Read length for the second read, 0 for auto [0]
    -m FLOAT 	Mutation rate between the reference sequences and the reads [0.001]
    -d FILE 	Specify a file containing a single line of the 3’-adapter sequence [null]
    -u FILE 	Dump unmapped reads and reads containing more than nmis mismatches to a separate file [null]
    -e INT 	Threshold on the sum of mismatching base qualities [70]
    -H FILE 	Dump multiple/all 01-mismatch hits to FILE [null]
    -C INT 	Maximum number of hits to output. Unlimited if larger than 512. [250]
    -M c|g 	methylation alignment mode. All C (or G) on the forward strand will be changed to T (or A). This option is for testing only.
    -N 	store the mismatch position in the output file out.aln.map. When this option is in use, the maximum allowed read length is 55bp.

    NOTE:
    * 	Paired end reads should be prepared in two files, one for each end, with reads are sorted in the same order. This means the k-th read in the first file is mated with the k-th read in the second file. The corresponding read names must be identical up to the tailing ‘/1’ or ‘/2’. For example, such a pair of read names are allowed: ‘EAS1_1_5_100_200/1’ and ‘EAS1_1_5_100_200/2’. The tailing ‘/[12]’ is usually generated by the GAPipeline to distinguish the two ends in a pair.
    * 	The output is a compressed binary file. It is affected by the endianness.
    * 	The best way to run this command is to provide about 1 to 3 million reads as input. More reads consume more memory.
    * 	Option -n controls the sensitivity of the alignment. By default, a hit with up to 2 mismatches can be always found. Higher -n finds more hits and also improves the accuracy of mapping qualities. However, this is done at the cost of speed.
    * 	Alignments with many high-quality mismatches should be discarded as false alignments or possible contaminations. This behaviour is controlled by option -e. The -e threshold is only calculated approximately because base qualities are divided by 10 at a certain stage of the alignment. The -Q option in the assemble command precisely set the threshold.
    * 	A pair of reads are said to be correctly paired if and only if the orientation is FR and the outer distance of the pair is no larger than maxins. There is no limit on the minimum insert size. This setting is determined by the paired end alignment algorithm used in Maq. Requiring a minimum insert size will lead to some wrong alignments with highly overestimated mapping qualities.
    * 	Currently, read pairs from Illumina/Solexa long-insert library have RF read orientation. The maximum insert size is set by option -A. However, long-insert library is also mixed with a small fraction of short-insert read pairs. -a should also be set correctly.
    * 	Sometimes 5’-end or even the entire 3’-adapter sequence may be sequenced. Providing -d renders Maq to eliminate the adapter contaminations.
    * 	Given 2 million reads as input, maq usually takes 800MB memory.
    
    
    mapmerge 	maq mapmerge out.aln.map in.aln1.map in.aln2.map [...]

    Merge a batch of read alignments together.

    NOTE:
    * 	In theory, this command can merge unlimited number of alignments. However, as mapmerge will be reading all the inputs at the same time, it may hit the limit of the maximum number of opening files set by the OS. At present, this has to be manually solved by endusers.
    * 	Command mapmerge can be used to merge alignment files with different read lengths. All the subsequent analyses do not assume fixed length any more.
    rmdup 	maq rmdup out.rmdup.map in.ori.map

    Remove pairs with identical outer coordinates. In principle, pairs with identical outer coordinates should happen rarely. However, due to the amplification in sample preparation, this occurs much more frequently than by chance. Practical analyses show that removing duplicates helps to improve the overall accuracy of SNP calling.
    
    
    assemble 	maq assemble [-sp] [-m maxmis] [-Q maxerr] [-r hetrate] [-t coef] [-q minQ] [-N nHap] out.cns in.ref.bfa in.aln.map 2> out.cns.log

    Call the consensus sequences from read mapping.

    OPTIONS:
    -t FLOAT 	Error dependency coefficient [0.93]
    -r FLOAT 	Fraction of heterozygotes among all sites [0.001]
    -s 	Take single end mapping quality as the final mapping quality; otherwise paired end mapping quality will be used
    -p 	Discard paired end reads that are not mapped in correct pairs
    -m INT 	Maximum number of mismatches allowed for a read to be used in consensus calling [7]
    -Q INT 	Maximum allowed sum of quality values of mismatched bases [60]
    -q INT 	Minimum mapping quality allowed for a read to be used in consensus calling [0]
    -N INT 	Number of haplotypes in the pool (>=2) [2]

    NOTE:
    * 	Option -Q sets a limit on the maximum sum of mismatching base qualities. Reads containing many high-quality mismatches should be discarded.
    * 	Option -N sets the number of haplotypes in a pool. It is designed for resequencing of samples by pooling multiple strains/individuals together. For diploid genome resequencing, this option equals 2.
    
    
    indelpe 	maq indelpe in.ref.bfa in.aln.map > out.indelpe

    Call consistent indels from paired end reads. The output is TAB delimited with each line consisting of chromosome, start position, type of the indel, number of reads across the indel, size of the indel and inserted/deleted nucleotides (separated by colon), number of indels on the reverse strand, number of indels on the forward strand, 5’ sequence ahead of the indel, 3’ sequence following the indel, number of reads aligned without indels and three additional columns for filters.

    At the 3rd column, type of the indel, a star indicates the indel is confirmed by reads from both strands, a plus means the indel is hit by at least two reads but from the same strand, a minus shows the indel is only found on one read, and a dot means the indel is too close to another indel and is filtered out.

    Users are recommended to run through ‘maq.pl indelpe’ to correct the number of reads mapped without indels. For more details, see the ‘maq.pl indelpe’ section.
    
    
    indelsoa 	maq indelsoa in.ref.bfa in.aln.map > out.indelsoa

    Call potential homozygous indels and break points by detecting the abnormal alignment pattern around indels and break points. The output is also TAB delimited with each line consisting of chromosome, approximate coordinate, length of the abnormal region, number of reads mapped across the position, number of reads on the left-hand side of the position and number of reads on the right-hand side. The last column can be ignored.

    The output contains many false positives. A recommended filter could be:



awk "$5+$6-$4 >= 3 && $4 <= 1" out.indelsoa

awk '$5+$6-$4 >= 3 && $4 <= 1' out.indelsoa


    Note that this command does not aim to be an accurate indel detector, but mainly helps to avoid some false positives in substitution calling. In addition, it only works well given deep depth (~40X for example); otherwise the false negative rate would be very high.

Format Converting

    sol2sanger 	maq sol2sanger in.sol.fastq out.sanger.fastq

    Convert Solexa FASTQ to standard/Sanger FASTQ format.
    bfq2fastq 	maq bfq2fastq in.read.bfq out.read.fastq

    Convert Maq’s BFQ format to standard FASTQ format.
    mapass2maq 	maq mapass2maq in.mapass2.map out.maq.map

    Convert obsolete mapass2’s map format to Maq’s map format. The old format does not contain read names.

Information Extracting

    mapview 	maq mapview [-bN] in.aln.map > out.aln.txt

    Display the read alignment in plain text. For reads aligned before the Smith-Waterman alignment, each line consists of read name, chromosome, position, strand, insert size from the outer coorniates of a pair, paired flag, mapping quality, single-end mapping quality, alternative mapping quality, number of mismatches of the best hit, sum of qualities of mismatched bases of the best hit, number of 0-mismatch hits of the first 24bp, number of 1-mismatch hits of the first 24bp on the reference, length of the read, read sequence and its quality. Alternative mapping quality always equals to mapping quality if the reads are not paired. If reads are paired, it equals to the smaller mapping quality of the two ends. This alternative mapping quality is actually the mapping quality of an abnormal pair.

    The fifth column, paired flag, is a bitwise flag. Its lower 4 bits give the orientation: 1 stands for FF, 2 for FR, 4 for RF, and 8 for RR, where FR means that the read with smaller coordinate is on the forward strand, and its mate is on the reverse strand. Only FR is allowed for a correct pair. The higher bits of this flag give further information. If the pair meets the paired end requirement, 16 will be set. If the two reads are mapped to different chromosomes, 32 will be set. If one of the two reads cannot be mapped at all, 64 will be set. The flag for a correct pair always equals to 18.

    For reads aligned by the Smith-Waterman alignment afterwards, the flag is always 130. A line consists of read name, chromosome, position, strand, insert size, flag (always 130), position of the indel on the read (0 if no indel), length of the indels (positive for insertions and negative for deletions), mapping quality of its mate, number of mismatches of the best hit, sum of qualities of mismatched bases of the best hit, two zeros, length of the read, read sequence and its quality. The mate of a 130-flagged read always gets a flag 18.

    Flag 192 indicates that the read is not mapped but its mate is mapped. For such a read pair, one read has flag 64 and the other has 192.

    OPTIONS:
    -b 	do not display the read sequence and the quality
    -N 	display the positions where mismatches occur. This flag only works with a .map file generated by ‘maq map -N’.
    mapcheck 	maq mapcheck [-s] [-m maxmis] [-q minQ] in.ref.bfa in.aln.map > out.mapcheck

    Read quality check. The mapcheck first reports the composition and the depth of the reference. After that there is a form. The first column indicates the position on a read. Following four columns which show the nucleotide composition, substitution rates between the reference and reads will be given. These rates and the numbers in the following columns are scaled to 999 and rounded to nearest integer. The next group of columns show the distribution of base qualities along the reads at a quality interval of 10. A decay in quality can usually be observed, which means bases at the end of read are less accurate. The last group of columns present the fraction of substitutions for read bases at a quality interval. This measures the accuracy of base quality estimation. Idealy, we expect to see 1 in the 3? column, 10 in the 2? column and 100 in the 1? column.

    OPTIONS:
    -s 	Take single end mapping quality as the final mapping quality
    -m INT 	Maximum number of mismatahces allowed for a read to be counted [4]
    -q INT 	Minimum mapping quality allowed for a read to be counted [30]
    pileup 	maq pileup [-spvP] [-m maxmis] [-Q maxerr] [-q minQ] [-l sitefile] in.ref.bfa in.aln.map > out.pileup

    Display the alignment in a ‘pileup’ text format. Each line consists of chromosome, position, reference base, depth and the bases on reads that cover this position. If -v is added on the command line, base qualities and mapping qualities will be presented in the sixth and seventh columns in order.

    The fifth column always starts with ‘@’. In this column, read bases identical to the reference are showed in comma ‘,’ or dot ‘.’, and read bases different from the reference in letters. A comma or a upper case indicates that the base comes from a read aligned on the forward strand, while a dot or a lower case on the reverse strand.

    This command is for users who want to develop their own SNP callers.

    OPTIONS:
    -s 	Take single end mapping quality as the final mapping quality
    -p 	Discard paired end reads that are not mapped as correct pairs
    -v 	Output verbose information including base qualities and mapping qualities
    -m INT 	Maximum number of mismatches allowed for a read to be used [7]
    -Q INT 	Maximum allowed number of quality values of mismatches [60]
    -q INT 	Minimum mapping quality allowed for a read to be used [0]
    -l FILE 	File containing the sites at which pileup will be printed out. In this file the first column gives the names of the reference and the second the coordinates. Additional columns will be ignored. [null]
    -P 	also output the base position on the read
    cns2fq 	maq cns2fq [-Q minMapQ] [-n minNeiQ] [-d minDepth] [-D maxDepth] in.cns > out.cns.fastq

    Extract the consensus sequences in FASTQ format. In the sequence lines, bases in lower case are essentially repeats or do not have sufficient coverage; bases in upper case indicate regions where SNPs can be reliably called. In the quality lines, ASCII of a character minus 33 gives the PHRED quality.

    OPTIONS:
    -Q INT 	Minimum mapping quality [40]
    -d INT 	Minimum read depth [3]
    -n INT 	Minimum neighbouring quality [20]
    -D INT 	Maximum read dpeth. >=255 for unlimited. [255]
    cns2snp 	maq cns2snp in.cns > out.snp

    Extract SNP sites. Each line consists of chromosome, position, reference base, consensus base, Phred-like consensus quality, read depth, the average number of hits of reads covering this position, the highest mapping quality of the reads covering the position, the minimum consensus quality in the 3bp flanking regions at each side of the site (6bp in total), the second best call, log likelihood ratio of the second best and the third best call, and the third best call.

    The 5th column is the key criterion when you judge the reliability of a SNP. However, as this quality is only calculated assuming site independency, you should also consider other columns to get more accurate SNP calls. Script command ‘maq.pl SNPfilter’ is designed for this (see below).

    The 7th column implies whether the site falls in a repetitive region. If no read covering the site can be mapped with high mapping quality, the flanking region is possibly repetitive or in the lack of good reads. A SNP at such site is usually not reliable.

    The 8th column roughly gives the copy number of the flanking region in the reference genome. In most cases, this number approaches 1.00, which means the region is about unique. Sometimes you may see non-zero read depth but 0.00 at the 7th column. This indicates that all the reads covering the position have at least two mismatches. Maq only counts the number of 0- and 1-mismatch hits to the reference. This is due to a complex technical issue.

    The 9th column gives the neighbouring quality. Filtering on this column is also required to get reliable SNPs. This idea is inspired by NQS, although NQS is initially designed for a single read instead of a consensus.
    cns2view 	maq cns2view in.cns > out.view

    Show detailed information at all sites. The output format is identical to cns2snp report.
    cns2ref 	maq cns2ref in.cns > out.ref.fasta

    Extract the reference sequence.
    cns2win 	maq cns2win [-w winsize] [-c chr] [-b begin] [-e end] [-q minQ] in.cns > out.win

    Extract information averaged in a tilling window. The output is TAB delimited, which consists of reference name, coordinate divided by 1,000,000, SNP rate, het rate, raw read depth, read depth in approximately unique regions, the average number of hits of reads in the window and percent GC.

    OPTIONS:
    -w INT 	Size of a window [1000]
    -c STR 	Destinated reference sequence; otherwise all references will be used [null]
    -b INT 	Start position, 0 for no constraint [0]
    -e INT 	End position, 0 for no constraint [0]
    -q INT 	Minimum consensus quality of the sites to be used [0]

Simulation Related

    fakemut 	maq fakemut [-r mutrate] [-R indelfrac] in.ref.fasta > out.fakeref.fasta 2> out.fake.snp

    Randomly introduce substitutions and indels to the reference. Substitutions and sinlge base-pair indels can be added.

    OPTIONS:
    -r FLOAT 	Mutation rate [0.001]
    -R FLOAT 	Fraction of mutations to be indels [0.1]
    simutrain 	maq simutrain out.simupars.dat in.read.fastq

    Estimate/train parameters for read simulation.
    simulate 	maq simulate [-d insize] [-s stdev] [-N nReads] [-1 readLen1] [-2 readLen2] [-r mutRate] [-R indelFrac] [-h] out.read1.fastq out.read2.fastq in.ref.fasta in.simupars.dat

    Simulate paired end reads. File in.simupars.dat determines the read lengths and quality distribution. It is generated from simutrain, or can be downloaded from Maq website. In the output read files, a read name consists of the reference sequence name and the outer coordinates of the pair of simulated reads. By default, simulate assumes reads come from a diploid sequence which is generated by adding two different sets of mutations, including one base-pair indels, to in.ref.fasta.

    OPTIONS:
    -d INT 	mean of the outer distance of insert sizes [170]
    -s INT 	standard deviation of insert sizes [20]
    -N INT 	number of pairs of reads to be generated [1000000]
    -1 INT 	length of the first read [set by in.simupars.dat]
    -2 INT 	length of the second read [set by in.simupars.dat]
    -r FLOAT 	mutation rate [0.001]
    -R FLOAT 	fraction of 1bp indels [0.1]
    -h 	add all mutations to in.ref.fasta and generate reads from the single mutated sequence (haploid mode)

    NOTE:
    * 	Reads generated from this command are independent, which deviates from the truth. Whereas alignment evaluation is less affected by this, evaluation on SNP calling should be performed with caution. Error dependency may be one of the major causes of wrong SNP calls.
    simustat 	maq simustat in.simu-aln.map > out.simustat

    Evaluate mapping qualities from simulated reads.

SOLiD Related

    fasta2csfa 	maq fasta2csfa in.nucl-ref.fasta > out.colour-ref.fasta

    Convert nucleotide FASTA to colour-coded FASTA. Flag -c should be then applied to map command. In the output, letter ‘A’ stands for color 0, ‘C’ for 1, ‘G’ for 2 and ‘T’ for 3. Each sequence in the output is 1bp shorter than the input.
    csmap2nt 	maq csmap2nt out.nt.map in.ref.nt.bfa in.cs.map

    Convert color alignment to nucleotide alignment. The input in.ref.nt.bfa is the nucleotide binary FASTA reference file. It must correspond to the original file from which the color reference is converted. Nucleotide consensus can be called from the resultant alignment.

Miscellaneous/Advanced Commands

    submap 	maq submap [-q minMapQ] [-Q maxSumErr] [-m maxMM] [-p] out.map in.map

    Filter bad alignments in in.map. Command-line options are described in the ‘assemble’ command.
    eland2maq 	maq eland2maq [-q defqual] out.map in.list in.eland

    Convert eland alignment to maq’s .map format. File in.list consists of the sequence names that appear at the seventh column of the eland alignment file in.eland and the name you expect to see in maq alignment. The following is an example:



      cX.fa chrX
      c1.fa chr1
      c2.fa chr2



    If you are aligning reads in several batches using eland, it is important to use the same in.list for the conversion. In addition, maq will load all the alignments and sort them in the memory. If you have concatenate several eland outputs into one huge file, you should separate it into smaller files to prevent maq from eating all your machine memory.

    This command actually aims to show Eland alignment in Maqview. As no quality information is available, the resultant maq alignment file should not be used to call consensus genotypes.
    export2maq 	maq export2maq [-1 read1len] [-2 read2len] [-a maxdist] [-n] out.map in.list in.export

    Convert Illumina’s Export format to Maq’s .map format. Export format is a new alignment format since SolexaPipeline-0.3.0 which also calculates mapping qualities like maq. The resultant file can be used to call consensus genotypes as most of necessary information is available for maq to do this accurately.

    OPTIONS:
    -1 INT 	Length of the first read [0]
    -2 INT 	Length of the second read [0]
    -a INT 	Maximum outer distance for a correct read pair [250]
    -n 	Retain filtered reads

MAQ-PERL COMMANDS

    demo 	maq.pl demo [-h] [-s] [-N nPairs] [-d outDir] in.fasta in.simudat

    Demonstrate the use of maq and its companion scripts. This command will simulate reads from a FASTA file in.fasta. The sequence length and qualities are determined by in.simudat which is generated from maq simutrain or can be downloaded from Maq website. The simulated reads will then be mapped with maq.pl easyrun. The alignment accuracy is evaluated by maq simustat, the consensus accuracy by maq simucns, and the SNP accuracy by maq_eval.pl.

    By default, paired end reads will be simulated and a diploid sequence will be generated from the input by adding mutations to either haploid type. The insert size and mutation rate are controlled by maq simulate.

    OPTIONS:
    -h 	simulate a haploid sequence instead of a diploid sequence
    -s 	use single-end mode to align reads instead of paired-end mode
    -N INT 	number of pairs of reads to be simulated [1000000]
    -d DIR 	output directory [maqdemo]

    NOTE:
    * 	The output files from maq_eval.pl have not been documented, but you may make a good guess at some of these files.
    * 	This command just demonstrates the use of the maq suite. The accuracy on real data is almost always lower than what you see from pure simulation.
    easyrun 	maq.pl easyrun [-1 read1Len] [-d out.dir] [-n nReads] [-A 3adapter] [-e minDep] [-q minCnsQ] [-p] [-2 read2Len] [-a maxIns] [-S] [-N] in.ref.fasta in1.fastq [in2.fastq]

    Analyses pipeline for small genomes. Easyrun command will run most of analyses implemented in maq. By default, easyrun assumes all the input read sequences files are single-end and independent; when -p is specified, two read sequence files are required, one for each end.

    Several files will be generated in out.dir, among which the following files are the key output:
    cns.final.snp 	final SNP calls with low quality ones filtered out
    cns.fq 	consensus sequences and qualities in the FASTQ format

    OPTIONS:
    -d DIR 	output directory [easyrun]
    -n INT 	number of reads/pairs in one batch of alignment [2000000]
    -S 	apply split-read analysis of short indels (maybe very slow)
    -N INT 	number of haplotypes/strains in the pool (>=2) [2]
    -A FILE 	file for 3’-adapter. The file should contain a single line of sequence [null]
    -1 INT 	length of the first read, 0 for auto [0]
    -e INT 	minimum read depth required to call a SNP (for SNPfilter) [3]
    -q INT 	minimum consensus quality for SNPs in cns.final.snp [30]
    -p 	switch to paired end alignment mode
    -2 INT 	length of the second read when -p is applied [0]
    -a INT 	maximum insert size when -p is applied [250]

    NOTES:
    * 	For SNP calling on pooled samples, users should set correct ‘-N’ as well as ‘-E 0’.
    * 	The input file can be maq’s binary format. maq.pl will automatically detect the file format.
    SNPfilter 	maq.pl SNPfilter [-d minDep] [-D maxDep] [-Q maxMapQ] [-q minCnsQ] [-w indelWinSize] [-n minNeiQ] [-F in.indelpe] [-f in.indelsoa] [-s minScore] [-m maxAcross] [-a] [-N maxWinSNP] [-W densWinSize] in.cns2snp.snp > out.filtered.snp

    Rule out SNPs that are covered by few reads (specified by -d), by too many reads (specified by -D), near (specified by -w) to a potential indel, falling in a possible repetitve region (characterized by -Q), or having low-quality neighbouring bases (specified by -n). If maxWinSNP or more SNPs appear in any densWinSize window, they will also be filtered out together.

    OPTIONS:
    -d INT 	Minimum read depth required to call a SNP [3]
    -D INT 	Maximum read depth required to call a SNP (<255, otherwise ignored) [256]
    -Q INT 	Required maximum mapping quality of reads covering the SNP [40]
    -q INT 	Minimum consensus quality [20]
    -n INT 	Minimum adjacent consensus quality [20]
    -w INT 	Size of the window around the potential indels. SNPs that are close to indels will be suppressed [3]
    -F FILE 	The indelpe output [null]
    -f FILE 	The indelsoa output [null]
    -s INT 	Minimum score for a soa-indel to be considered [3]
    -m INT 	Maximum number of reads that can be mapped across a soa-indel [1]
    -a 	Alternative filter for single end alignment
    indelpe 	maq.pl indelpe in.indelpe > out.indelpe

    Correct the number of reads mapped without indels for homopolymer tracts. This command modify the 4th, 10th and the last three columns of in.indelpe and output the result in out.indelpe. After the correction, the following awk command gives putative homozygous indels:



      awk ’($3=="*"||$3=="+") && $6+$7>=3 && ($6+$7)/$4>=0.75’



    and the following gives heterozygotes:



      awk ’($3=="*"||$3=="+") && $6+$7>=3 && ($6+$7)/$4<0.75’



    Please note that this indelpe command just implements several heuristic rules. It does not correct for impure homopolymer runs or di-nucleotide/triplet repeats. Consequently, the two awk commands only give approximate hom/het indels.

EXAMPLES

    o 	Easyrun script:
    maq.pl easyrun -d easyrun ref.fasta part1.fastq part2.fastq
    o 	Key commands behind easyrun:
    maq fasta2bfa ref.fasta ref.bfa;
    maq fastq2bfq part1.fastq part1.bfq;
    maq fastq2bfq part2.fastq part2.bfq;
    maq map part1.map ref.bfa part1.bfq;
    maq map part2.map ref.bfa part2.bfq;
    maq mapmerge aln.map part1.map part2.map;
    maq assemble cns.cns ref.bfa aln.map;

LICENSE

    GNU General Public License, version 3 (GPLv3) 

AVAILABILITY

    <http://maq.sourceforge.net> 

AUTHOR

    Heng Li <lh3@sanger.ac.uk> 

maq-0.6.8 	MAQ (1) 	2008-07-27
Generated by manServer 1.07-lh3 from ./maq.1 using man macros. 