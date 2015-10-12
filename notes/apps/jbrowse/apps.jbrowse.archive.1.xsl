<entry [Sun Dec 20 01:22:44 EDT 2009] LOCATION OF PBS LIBRARIES ON KRONOS>


On Wed Dec 16 10:34:54 2009, zhu wrote:
> pbs (torque) is installed to its default location, /usr/local. Please try
> /usr/local/lib, /usr/local/include.
>
> On Tue Dec 15 22:21:45 2009, syoung wrote:
> > Hi Zongjun,
> >
> > Could you tell me where the PBS libraries/headers are located on kronos?
> >
> > Cheers,
> >
> > Stuart.




</entry>

<entry [Sun Dec 20 01:22:44 EDT 2009] RERUN ON BIG MEMORY NODES>

screen -S bigmem

chmod 755 /nethome/syoung/base/bin/utils/batchCluster.pl;

/nethome/syoung/base/bin/utils/batchCluster.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/flatfile-batchfile.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile \
--columns "--executable,--inputdir,--outputdir,--jsonfile" \
--application /nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-flatfile-to-json.pl \
--queue "-q pbigmem" \
--stdout /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batchrun.6/flatfile-stdout \
&> /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batch-flatfile.out


RUNNING:

    [syoung@kronos ~]$ qstat
    Job id                    Name             User            Time Use S Queue
    ------------------------- ---------------- --------------- -------- - -----
    175177.kronos             STDIN            syoung          00:00:00 C pbigmem        
    175178.kronos             STDIN            syoung          00:01:42 C pbigmem        
    175196.kronos             STDIN            syoung          00:01:10 R pbigmem        
    175197.kronos             STDIN            syoung          00:01:06 R pbigmem        
    175198.kronos             STDIN            syoung          00:00:59 R pbigmem        
    175199.kronos             STDIN            syoung          00:00:55 R pbigmem        
    175200.kronos             STDIN            syoung          00:00:51 R pbigmem        
    175201.kronos             STDIN            syoung          00:00:44 R pbigmem        
    175202.kronos             STDIN            syoung          00:00:00 C pbigmem        
    175203.kronos             STDIN            syoung          00:00:28 R pbigmem        
    175204.kronos             STDIN            syoung          00:00:00 R pbigmem        
    175205.kronos             STDIN            syoung          00:00:54 R pbigmem        
    175206.kronos             STDIN            syoung          00:00:50 R pbigmem        
    175207.kronos             STDIN            syoung          00:00:45 R pbigmem        
    175208.kronos             STDIN            syoung          00:00:38 R pbigmem        
    175209.kronos             STDIN            syoung          00:00:33 R pbigmem        
    175210.kronos             STDIN            syoung          00:00:29 R pbigmem        
    175211.kronos             STDIN            syoung          00:00:22 R pbigmem        
    175212.kronos             STDIN            syoung          00:00:18 R pbigmem        
    175213.kronos             STDIN            syoung                 0 Q pbigmem        
    175214.kronos             STDIN            syoung                 0 Q pbigmem        
    175215.kronos             STDIN            syoung                 0 Q pbigmem        
    175216.kronos             STDIN            syoung                 0 Q pbigmem        
    175217.kronos             STDIN            syoung                 0 Q pbigmem        
    [syoung@kronos ~]$ date
    Sun Dec 20 01:55:56 EST 2009
    [syoung@kronos ~]$ 


    
NB: THE SHELL SCRIPTS ARE IN batchrun.8 BUT THE STDOUT IS IN batchrun.6:

tail -f /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batchrun.6/flatfile-stdout.1


STATUS AT Mon Dec 21 13:43:47 EST 2009:



Last login: Mon Dec 21 12:05:58 2009 from 10.136.60.145
[syoung@ngsdev ~]$ qstat
Job id                    Name             User            Time Use S Queue
------------------------- ---------------- --------------- -------- - -----
175196.kronos             STDIN            syoung          35:47:20 R pbigmem        
175197.kronos             STDIN            syoung          35:46:38 R pbigmem        
175198.kronos             STDIN            syoung          35:46:39 R pbigmem        
175199.kronos             STDIN            syoung          35:46:38 R pbigmem        
175200.kronos             STDIN            syoung          35:46:25 R pbigmem        
175201.kronos             STDIN            syoung          33:35:56 R pbigmem        
175214.kronos             STDIN            syoung          24:07:43 R pbigmem        
[syoung@ngsdev ~]$ line
[syoung@ngsdev pipeline]$ cd jbrowse/ucsc/reference/
[syoung@ngsdev reference]$ ls chr*/data/tracks/chr*
chr10/data/tracks/chr10:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes      Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vienna_RNAz
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vista_Enhancer

chr11/data/tracks/chr11:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr12/data/tracks/chr12:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes      Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vienna_RNAz
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vista_Enhancer

chr13/data/tracks/chr13:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr14/data/tracks/chr14:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes      Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vienna_RNAz
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vista_Enhancer

chr15/data/tracks/chr15:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr16/data/tracks/chr16:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr17/data/tracks/chr17:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Yale_TFBS
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Recomb_Rate     Self_Chain             sno_miRNA         tajima_D_SNPs         UCSC_Genes

chr18/data/tracks/chr18:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Yale_TFBS
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz

chr19/data/tracks/chr19:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication

chr1/data/tracks/chr1:
Affy_Exon_Probes  CCDS  Conrad_Deletion  CpG_Island  cytoband  Cytoband  Cytoband_Ideogram  Encode_Common_CNV  Exapted_Repeats  exon  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats

chr20/data/tracks/chr20:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Yale_TFBS
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz

chr21/data/tracks/chr21:
Affy_Exon_Probes  CCDS  CpG_Island  dbSNP_129  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP

chr22/data/tracks/chr22:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr2/data/tracks/chr2:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats

chr3/data/tracks/chr3:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite

chr4/data/tracks/chr4:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication

chr5/data/tracks/chr5:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication

chr6/data/tracks/chr6:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication

chr8/data/tracks/chr8:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep     Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Recomb_Rate     Self_Chain             sno_miRNA         tajima_D_SNPs         UCSC_Genes      Vista_Enhancer

chr9/data/tracks/chr9:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chrX/data/tracks/chrX:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127   Interrupted_Repeats  N_scan          PolyA        Repeat_Masker          SIB_alt_splicing  Structural_Variation  TS_miRNA     Vienna_RNAz     Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq  Intrrepts327         Omim_Genes      Pseudogenes  Segmental_duplication  Simple_Repeat     Switchgear_TSS        UCSC_Genes   Vista_Enhancer
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_SNP       Microsatellite       Open_Chromatin  Recomb_Rate  Self_Chain             sno_miRNA         TFBS_Conserved        Uva_DNA_Rep  Wiki_Track

chrY/data/tracks/chrY:
Affy_Exon_Probes  CCDS  CpG_Island  dbSNP_129  Exapted_Repeats  Genome_Variant  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication



FINAL STATUS (CHR 1, CHR19, ETC. NOT COMPLETED):

[syoung@ngsdev reference]$ ls chr*/data/tracks/chr*
chr10/data/tracks/chr10:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes      Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vienna_RNAz
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vista_Enhancer

chr11/data/tracks/chr11:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr12/data/tracks/chr12:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes      Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vienna_RNAz
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vista_Enhancer

chr13/data/tracks/chr13:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr14/data/tracks/chr14:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes      Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vienna_RNAz
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vista_Enhancer

chr15/data/tracks/chr15:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr16/data/tracks/chr16:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr17/data/tracks/chr17:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Yale_TFBS
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Recomb_Rate     Self_Chain             sno_miRNA         tajima_D_SNPs         UCSC_Genes

chr18/data/tracks/chr18:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Yale_TFBS
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz

chr19/data/tracks/chr19:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication

chr1/data/tracks/chr1:
Affy_Exon_Probes  Conrad_Deletion  cytoband  Cytoband_Ideogram  Exapted_Repeats  Genome_Variant    Hapmap_SNP           Intrrepts327    Repeat_Masker
CCDS              CpG_Island       Cytoband  Encode_Common_CNV  exon             Hapmap_LD_Phased  Interrupted_Repeats  Microsatellite  Segmental_duplication

chr20/data/tracks/chr20:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Yale_TFBS
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz

chr21/data/tracks/chr21:
Affy_Exon_Probes  CCDS  CpG_Island  dbSNP_129  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP

chr22/data/tracks/chr22:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr2/data/tracks/chr2:
Affy_Exon_Probes  CpG_Island         Exapted_Repeats  Hapmap_LD_Phased     Intrrepts327    Omim_Genes      Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_SNP           Microsatellite  Open_Chromatin  Repeat_Masker          SIB_alt_splicing  Structural_Variation  UCSC_Genes
CCDS              Eponine            haib-methyl127   Interrupted_Repeats  N_scan          PolyA           Segmental_duplication  Simple_Repeat     Switchgear_TSS        Wiki_Track

chr3/data/tracks/chr3:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Recomb_Rate     Self_Chain             sno_miRNA         tajima_D_SNPs         UCSC_Genes      Yale_TFBS

chr4/data/tracks/chr4:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes      Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Vienna_RNAz
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vista_Enhancer

chr5/data/tracks/chr5:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chr6/data/tracks/chr6:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Yale_TFBS
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz

chr8/data/tracks/chr8:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep     Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Recomb_Rate     Self_Chain             sno_miRNA         tajima_D_SNPs         UCSC_Genes      Vista_Enhancer

chr9/data/tracks/chr9:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chrX/data/tracks/chrX:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127   Interrupted_Repeats  N_scan          PolyA        Repeat_Masker          SIB_alt_splicing  Structural_Variation  TS_miRNA     Vienna_RNAz     Yale_TFBS
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq  Intrrepts327         Omim_Genes      Pseudogenes  Segmental_duplication  Simple_Repeat     Switchgear_TSS        UCSC_Genes   Vista_Enhancer
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_SNP       Microsatellite       Open_Chromatin  Recomb_Rate  Self_Chain             sno_miRNA         TFBS_Conserved        Uva_DNA_Rep  Wiki_Track

chrY/data/tracks/chrY:
Affy_Exon_Probes  CCDS  CpG_Island  dbSNP_129  Exapted_Repeats  Genome_Variant  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication




</entry>

<entry [Wed Dec 16 22:10:44 EDT 2009] RERUN run-flatfile-to-json.pl IN BATCH CLUSTER MODE FOR ALL EXCEPT chr21 AND chrY>

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile

1. REMOVE dbSNP GFF FILES FROM chromosome-gff/chr* FOLDERS:


cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff
mkdir dbSNP
cd dbSNP
mkdir chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrYl


NB: chr7 IS MISSING!!!


mv ../chr1/dbsnp*	chr1
mv ../chr2/dbsnp*	chr2
mv ../chr3/dbsnp*	chr3
mv ../chr4/dbsnp*	chr4
mv ../chr5/dbsnp*	chr5
mv ../chr6/dbsnp*	chr6
mv ../chr7/dbsnp*	chr7
mv ../chr8/dbsnp*	chr8
mv ../chr9/dbsnp*	chr9
mv ../chr10/dbsnp*	chr10
mv ../chr11/dbsnp*	chr11
mv ../chr12/dbsnp*	chr12
mv ../chr13/dbsnp*	chr13
mv ../chr14/dbsnp*	chr14
mv ../chr15/dbsnp*	chr15
mv ../chr16/dbsnp*	chr16
mv ../chr17/dbsnp*	chr17
mv ../chr18/dbsnp*	chr18
mv ../chr19/dbsnp*	chr19
mv ../chr20/dbsnp*	chr20
mv ../chr21/dbsnp*	chr21
mv ../chr22/dbsnp*	chr22
mv ../chrX/dbsnp*	chrX
mv ../chrY/dbsnp*	chrY



screen -S batch-flatfile

chmod 755 /nethome/syoung/base/bin/utils/batchCluster.pl; /nethome/syoung/base/bin/utils/batchCluster.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/flatfile-batchfile.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile \
--columns "--executable,--inputdir,--outputdir,--jsonfile" \
--application /nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-flatfile-to-json.pl \
&> /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batch-flatfile.out


tail -f /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batch-flatfile.out


    Run time: 04:11:27
    Completed /nethome/syoung/base/bin/utils/batchCluster.pl
    2:20AM, 17 December 2009
    ****************************************


ll -hs /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batch-flatfile.out

    20M -rw-r--r-- 1 syoung bioinfo 20M Dec 17 02:21 /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batch-flatfile.out

emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batch-flatfile.out


DISCOVERED THAT flatfile-to-json.pl RUNS STOPPED DUE TO A COMBINATION OF LARGE INPUT FILE SIZE AND LARGE CHROMOSOME SIZE:


ls /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr*/data/tracks/chr*

chr1/data/tracks/chr1:
Affy_Exon_Probes  CCDS  Conrad_Deletion  CpG_Island  cytoband  Cytoband  Cytoband_Ideogram  Encode_Common_CNV  Exapted_Repeats  exon

chr2/data/tracks/chr2:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats

chr3/data/tracks/chr3:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats

chr4/data/tracks/chr4:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats

chr5/data/tracks/chr5:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats

chr6/data/tracks/chr6:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats

chr8/data/tracks/chr8:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant

chr9/data/tracks/chr9:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant

chr10/data/tracks/chr10:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant

chr11/data/tracks/chr11:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant

chr12/data/tracks/chr12:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased

chr13/data/tracks/chr13:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP

chr14/data/tracks/chr14:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats

chr15/data/tracks/chr15:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite

chr16/data/tracks/chr16:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite

chr17/data/tracks/chr17:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite

chr18/data/tracks/chr18:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite

chr19/data/tracks/chr19:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication

chr20/data/tracks/chr20:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication

chr21/data/tracks/chr21:
Affy_Exon_Probes  CCDS  CpG_Island  dbSNP_129  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_LD_Phased  Hapmap_SNP

chr22/data/tracks/chr22:
Affy_Exon_Probes  CCDS               Eponine          haib-methyl127    Hapmap_SNP           Microsatellite  Open_Chromatin  Recomb_Rate            Self_Chain        sno_miRNA             tajima_D_SNPs   UCSC_Genes   Vista_Enhancer
Alt_Events        CpG_Island         Exapted_Repeats  haib-methyl-seq   Interrupted_Repeats  N_scan          PolyA           Repeat_Masker          SIB_alt_splicing  Structural_Variation  TFBS_Conserved  Uva_DNA_Rep  Wiki_Track
Broad_Histone     Encode_Common_CNV  Genome_Variant   Hapmap_LD_Phased  Intrrepts327         Omim_Genes      Pseudogenes     Segmental_duplication  Simple_Repeat     Switchgear_TSS        TS_miRNA        Vienna_RNAz  Yale_TFBS

chrX/data/tracks/chrX:
Affy_Exon_Probes  CCDS  CpG_Island  Encode_Common_CNV  Exapted_Repeats  Genome_Variant  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite

chrY/data/tracks/chrY:
Affy_Exon_Probes  CCDS  CpG_Island  dbSNP_129  Exapted_Repeats  Genome_Variant  Hapmap_SNP  Interrupted_Repeats  Intrrepts327  Microsatellite  Repeat_Masker  Segmental_duplication



CHECKED CHROMOSOME ONE RUN:

emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batchrun.3/1/STDIN.o171630 


    hostname:
    c23
    
    Doing file 1: affy-exon-probes-chr1.gff
    command: /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1/affy-exon-probes-chr1.gff --tracklabel Affy_Exon_Probes --key Affy Exon\
     Probes
    
    working on seq chr1
    chr1    125753
    Doing file 2: ccds-chr1.gff
    command: /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1/ccds-chr1.gff --tracklabel CCDS --key Conservative CDS
    
    working on seq chr1
    chr1    45504
    Doing file 3: cpg-islands-chr1.gff
    command: /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1/cpg-islands-chr1.gff --tracklabel CpG_Island --key CpG Island
    
    working on seq chr1
    chr1    2464
    Doing file 4: encode-common-cnv-chr1.gff
    command: /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1/encode-common-cnv-chr1.gff --tracklabel Encode_Common_CNV --key Encode \
    Common CNV
    
    working on seq chr1
    chr1    42
    Doing file 5: exapted-repeats-chr1.gff
    command: /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1/exapted-repeats-chr1.gff --tracklabel Exapted_Repeats --key Exapted Rep\
    eats
    
    working on seq chr1
    chr1    912
    Doing file 6: genome-variants-chr1.gff
    command: /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1/genome-variants-chr1.gff --tracklabel Genome_Variant --key Genome Varia\
    nt
    Epilogue Args:
    Job ID: 171630.kronos.ccs.miami.edu
    User ID: syoung
    Group ID: bioinfo
    Job Name: STDIN
    Session ID: 24791
    Resource List: nodes=1
    Resources Used: cput=03:52:16,mem=389368kb,vmem=706124kb,walltime=04:09:58
    Queue Name: default
    Account String:






</entry>

<entry [Wed Dec 16 00:46:44 EDT 2009] RUN run-flatfile-to-json.pl IN BATCH CLUSTER MODE>

SUBMITTED FROM NEW NGSDEV IP:204.68.94.222

( CONFIRMED IP ADDRESS: emacs /etc/sysconfig/network-scripts/ifcfg-eth0 )


mkdir /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile

screen -S batch-flatfile

chmod 755 /nethome/syoung/base/bin/utils/batchCluster.pl; /nethome/syoung/base/bin/utils/batchCluster.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/flatfile-batchfile.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile \
--columns "--executable,--inputdir,--outputdir,--jsonfile" \
--application /nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-flatfile-to-json.pl \
&> /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/batch-flatfile.out



BUT ALL EXCEPT CHR 21 AND CHR Y FAILED AT THE dbSNP STAGE.


cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference
ls chr*/data/tracks/chr*

    ...
    chr21/data/tracks/chr21:
    Affy_Exon_Probes  CpG_Island  Encode_Common_CNV  Genome_Variant    Hapmap_SNP
    CCDS              dbSNP_129   Exapted_Repeats    Hapmap_LD_Phased
    
    chr22/data/tracks/chr22:
    Affy_Exon_Probes  CCDS  CpG_Island
    
    chr2/data/tracks/chr2:
    Affy_Exon_Probes  CCDS  CpG_Island
    
    chr3/data/tracks/chr3:
    Affy_Exon_Probes  CCDS  CpG_Island
    
    chr4/data/tracks/chr4:
    Affy_Exon_Probes  CCDS  CpG_Island
    
    chr5/data/tracks/chr5:
    Affy_Exon_Probes  CCDS  CpG_Island
    
    chr6/data/tracks/chr6:
    Affy_Exon_Probes  CCDS  CpG_Island
    
    chr8/data/tracks/chr8:
    Affy_Exon_Probes  CCDS  CpG_Island
    
    chr9/data/tracks/chr9:
    Affy_Exon_Probes  CCDS  CpG_Island
    
    chrX/data/tracks/chrX:
    Affy_Exon_Probes  CCDS  CpG_Island
    
    chrY/data/tracks/chrY:
    Affy_Exon_Probes  CpG_Island  Exapted_Repeats  Hapmap_SNP           Intrrepts327    Repeat_Masker
    CCDS              dbSNP_129   Genome_Variant   Interrupted_Repeats  Microsatellite  Segmental_duplication




RUNNING OKAY EXCEPT FOR JOB NUMBER 170939 (file 7, i.e., chromosome 8):


    
    [syoung@ngsdev utils]$ qstat
    Job id                    Name             User            Time Use S Queue
    ------------------------- ---------------- --------------- -------- - -----
    170933.kronos             STDIN            syoung          00:01:43 R default        
    170934.kronos             STDIN            syoung          00:01:40 R default        
    170935.kronos             STDIN            syoung          00:00:57 R default        
    170936.kronos             STDIN            syoung          00:00:53 R default        
    170937.kronos             STDIN            syoung          00:00:50 R default        
    170938.kronos             STDIN            syoung          00:00:45 R default        
    170939.kronos             STDIN            syoung          00:00:00 C default        
    170940.kronos             STDIN            syoung          00:00:30 R default        
    170941.kronos             STDIN            syoung          00:00:23 R default        
    170942.kronos             STDIN            syoung          00:00:14 R default        
    170943.kronos             STDIN            syoung          00:00:07 R default        
    170944.kronos             STDIN            syoung                 0 R default        
    170945.kronos             STDIN            syoung                 0 R default        
    170946.kronos             STDIN            syoung                 0 R default        
    170947.kronos             STDIN            syoung                 0 R default        
    170948.kronos             STDIN            syoung                 0 R default        
    170949.kronos             STDIN            syoung                 0 R default        
    170950.kronos             STDIN            syoung                 0 R default        
    170951.kronos             STDIN            syoung                 0 R default        
    170952.kronos             STDIN            syoung                 0 R default        
    170953.kronos             STDIN            syoung                 0 R default        
    170954.kronos             STDIN            syoung                 0 R default        
    170955.kronos             STDIN            syoung                 0 R default        
    170956.kronos             STDIN            syoung                 0 R default









CHECK CHROMOSOME 8 JOB:

checkjob 170939





job 170939

AName: STDIN
State: Completed 
Complete Time:  Wed Dec 16 01:14:07
  Completion Code: 0
Creds:  user:syoung  group:bioinfo  account:bioinfo  class:default
WallTime:   00:00:00 of 4:00:00
SubmitTime: Wed Dec 16 01:14:06
  (Time Queued  Total: 00:02:32  Eligible: 00:00:00)

Total Requested Tasks: 1

Req[0]  TaskCount: 1  Partition: base  
Memory >= 0  Disk >= 0  Swap >= 0

Allocated Nodes:
[n26:1]

IWD:            $HOME/base/pipeline/jbrowse/ucsc/runs/flatfile/batchrun.2/7
Executable:     /opt/moab/spool/moab.job.t11lVO

Execution Partition:  base
StartPriority:  0






qstat -f 170939

Job Id: 170939.kronos.ccs.miami.edu
    Job_Name = STDIN
    Job_Owner = syoung@kronos.ccs.miami.edu
    resources_used.cput = 00:00:00
    resources_used.mem = 0kb
    resources_used.vmem = 0kb
    resources_used.walltime = 00:00:00
    job_state = C
    queue = default
    server = kronos.ccs.miami.edu
    Checkpoint = u
    ctime = Wed Dec 16 01:14:06 2009
    Error_Path = kronos.ccs.miami.edu:/home/syoung/base/pipeline/jbrowse/ucsc/
        runs/flatfile/batchrun.2/7/STDIN.e170939
    exec_host = n26/6
    Hold_Types = n
    Join_Path = oe
    Keep_Files = n
    Mail_Points = a
    mtime = Wed Dec 16 01:14:17 2009
    Output_Path = kronos.ccs.miami.edu:/home/syoung/base/pipeline/jbrowse/ucsc
        /runs/flatfile/batchrun.2/7/STDIN.o170939
    Priority = 0
    qtime = Wed Dec 16 01:14:06 2009
    Rerunable = False
    Resource_List.nodect = 1
    Resource_List.nodes = 1
    session_id = 19718
    Variable_List = PBS_O_HOME=/nethome/syoung,PBS_O_LOGNAME=syoung,
        PBS_O_PATH=/sbin:/usr/sbin:/bin:/usr/bin,PBS_O_SHELL=/bin/bash,
        PBS_SERVER=kronos.ccs.miami.edu,PBS_O_HOST=kronos.ccs.miami.edu,
        PBS_O_WORKDIR=/home/syoung/base/pipeline/jbrowse/ucsc/runs/flatfile/b
        atchrun.2/7,PBS_O_QUEUE=default
    etime = Wed Dec 16 01:14:06 2009
    exit_status = 0




</entry>

<entry [Tues Dec 15 23:59:44 EDT 2009] CREATED run-flatfile-to-json.pl TO REPLACE run-biodb-to-json.pl>


/nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-flatfile-to-json.pl \
--executable /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chrY \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json


    Using lib /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/../lib
    hostname:
    u01
    
    Doing file 1: affy-exon-probes-chrY.gff
    command: /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chrY/affy-exon-probes-chrY.gff --tracklabel Affy_Exon_Probes --key Affy Exon Probes
    
    working on seq chrY
    chrY    7635
    
    Run time: 00:00:11
    Completed /nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-flatfile-to-json.pl
    0:38AM, 16 December 2009
    ****************************************



11 SECONDS FOR 7639 LINES:

    lines /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chrY/affy-exon-probes-chrY.gff 
    /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chrY/affy-exon-probes-chrY.gff: 7639



TAKES THE SAME TIME WITH THE SHORTENED JSON FILE:


/nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-flatfile-to-json.pl \
--executable /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chrY \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-dummy.json


    working on seq chrY
    chrY    7635
    
    Run time: 00:00:11
    Completed /nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-flatfile-to-json.pl
    0:39AM, 16 December 2009
    ****************************************




**** NB: MUST cd INTO THE DIRECTORY WITH THE 'data' FOLDER INSIDE IT __AND__ THE 'data' FOLDER MUST CONTAIN A refSeqs.js FILE

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/

time /home/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl  \
--gff /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-exon-probes-chrY.gff \
--tracklabel affy_exon_probes \
--key "Affy Exon Probes"






</entry>

<entry [Tues Dec 15 23:55:44 EDT 2009] UPDATED JBROWSE AND COMPARED NEW flatfile-to-json.pl SCRIPT TO biodb-to-json.pl>

flatfile WINS BECAUSE IT'S FAST (0.5 secs versus 10 secs) AND SIMPLE (no cryptic error messages)



**** NB: MUST cd INTO THE DIRECTORY WITH THE 'data' FOLDER INSIDE IT __AND__ THE 'data' FOLDER MUST CONTAIN A refSeqs.js FILE


THE SCRIPTS' OUTPUT FILES ARE IDENTICAL:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy

diff data/tracks/chrY/affy_exon_probes/trackData.json data-biodb/tracks/chrY/affy_exon_probes/trackData.json 


RUN flatfile-to-json.pl
-----------------------

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/

time /home/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/flatfile-to-json.pl  \
--gff /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-exon-probes-chrY.gff \
--tracklabel affy_exon_probes \
--key "Affy Exon Probes"

OK!
    
    working on seq chrY
    chrY    97

real    0m0.501s
user    0m0.303s
sys     0m0.057s




WHICH UPDATED

/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/data/trackInfo.js

BY ADDING THE 'Affy Exon Probes' TRACK:

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
          "url" : "data/tracks/{refseq}/affy_exon_probes/trackData.json",
          "label" : "affy_exon_probes",
          "type" : "FeatureTrack",
          "key" : "Affy Exon Probes"
       }
    ]


/home/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/biodb-to-json.pl \
--conf /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-dummy.json


#### NB: MUST SET THE -dir VALUE TO THE LOCATION OF DIRECTORY CONTAINING THE GFF FILES
#### ___AND___ MUST MOVE TO A DIRECTORY CONTAINING THE 'data' DIR


I.E., CHANGE THIS

                        "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc/gff"

TO THIS:

                        "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy"

/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy


AND ADDED 'tracks' ARRAY IN .json FILE






RUN biodb-to-json.pl
--------------------

time /home/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/temp2.json

    Loading segs...
    Completed loading segs.
    total segs: 1
    Doing tracks for segment type: chrY:..57772954
    
    working on refseq chrY
    working on track Affy_Exon_Probes
    got 7635 features for Affy_Exon_Probes
    Can't use string ("Affy_Exon_Probes") as a HASH ref while "strict refs" in use at /home/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/../lib/JsonGenerator.pm line 269.
    
    real    0m9.892s
    user    0m9.577s
    sys     0m0.092s


NO DATA GENERATED:

data/tracks/chrY/affy_exon_probes/trackData.json: No such file or directory


run-biodb-to-json.pl COMMAND:


/nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-biodb-to-json.pl \
--executable /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/biodb-to-json.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-dummy.json





USAGE FOR BOTH SCRIPTS:


./biodb-to-json.pl --conf <conf file> [--ref <ref seq names> | --refid <ref seq ids>] [--track <track name>] [--out <output directory>]

    <conf file>: path to the configuration file
    <ref seq names>: comma-separated list of reference sequence names
        ./biodb-to-json.pl will process features on these ref seqs
        default: all of the ref seqs that prepare-refseqs.pl has seen
    <ref seq ids>: comma-separated list of reference sequence ids
        ./biodb-to-json.pl will process features on these ref seqs
        default: all of the ref seqs that prepare-refseqs.pl has seen
    <output directory>: directory where output should go
        default: data



./flatfile-to-json.pl 
USAGE: ./flatfile-to-json.pl [--gff <gff3 file> | --gff2 <gff2 file> | --bed <bed file>] [--out <output directory>] --tracklabel <track identifier> --key <human-readable track name> [--cssclass <CSS class for displaying features>] [--autocomplete none|label|alias|all] [--getType] [--getPhase] [--getSubs] [--getLabel] [--urltemplate "http://example.com/idlookup?id={id}"] [--subfeatureClasses <JSON-syntax subfeature class map>] [--clientConfig <JSON-syntax extra configuration for FeatureTrack>]

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




</entry>

<entry [Mon Dec 14 14:55:44 EDT 2009] RUN WRAPPER FOR biodb-to-json.pl AS BATCH >


CREATED DUMMY .JSON FILE:

/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-dummy.json

    {
        "description": "Human Chromosome 1",
        "db_adaptor": "Bio::DB::SeqFeature::Store",
        "db_args": {
                        "-adaptor": "memory",
                        "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy"
                    },
      
        "TRACK DEFAULTS": {
          "class": "feature",
          "autocomplete": "all"
        },
        
        "features":
        {
            "affy-exon-probes" :
            {
                "feature": [ "affy_exon_probes" ],
                "track": "Affy_Exon_Probes",
                "key": "Affy Exon Probes",
                "class": "exon"
            }
        },
        
        "tracks" :
        [
            {
               "feature" : [
                  "affy_exon_probes"
               ],
               "track" : "Affy_Exon_Probes",
               "class" : "exon",
               "key" : "Affy Exon Probes"
            } 
        ]
        
    }





CREATED DUMMY INPUT GFF FILE:

 chopfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/runbiodb/090538/affy
-exon-probes-chrY.gff /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-exon-probes-chrY.gff 100


OUTPUTFILE /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-exon-probes-chrY.gff CREATED (100 LINES)

head /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-exon-probes-chrY.gff

    ### /nethome/syoung/base/apps/aqwa/0.4/bin/apps/gtf2gff.pl --configfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/data/refSeqs.js --inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/chrY --outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chrY --jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json
    ####8:15PM, 15 December 2009
    
    chrY    refseq  refseq  0       57772954        .       .       .       Name=chrY
    chrY    hg18_affyAllExonProbes  affy_exon_probes        57671669        57671755        300     +       .Name=4032768|full
    chrY    hg18_affyAllExonProbes  affy_exon_probes        14024637        14024964        700     -       .Name=4035089|extended
    chrY    hg18_affyAllExonProbes  affy_exon_probes        15859578        15859753        300     +       .Name=4030502|full
    chrY    hg18_affyAllExonProbes  affy_exon_probes        19398616        19398694        300     -       .Name=4035754|full
    chrY    hg18_affyAllExonProbes  affy_exon_probes        86253   86543   700     -       .       Name=4032867|extended
    chrY    hg18_affyAllExonProbes  affy_exon_probes        86429   86500   300     +       .       Name=4027



TEST run-biodb-to-json.pl:



/nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-biodb-to-json.pl \
--executable /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/biodb-to-json.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy/affy-dummy.json


CHECK RESULTING data DIR:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/dummy











/nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-biodb-to-json.pl \
--executable /nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/biodb-to-json.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chrY \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json









NB: CONSOLIDATED ALL SCRIPTS TO THESE TWO LOCATIONS:

/nethome/syoung/base/bin/utils
/nethome/syoung/base/apps/aqwa/0.4/bin
/nethome/syoung/base/apps/aqwa/0.5/plugins/view/jbrowse/bin

I.E., NO LONGER USING

/nethome/syoung/base/jbrowse/bin



BATCH MODE ON CLUSTER

mkdir /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/biodb
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/biodb

ON ngsdev:

screen -S bcluster-biodb

chmod 755 /nethome/syoung/base/bin/utils/batchCluster.pl; /nethome/syoung/base/bin/utils/batchCluster.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/chromosome-gff-biodb-to-json-batchfile.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/biodb \
--columns "--executable,--inputdir,--outputdir,--jsonfile" \
--application /nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-biodb-to-json.pl \
&> /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/biodb/batch-biodb.out



OUTPUT GOES HERE:

tail -f /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/biodb/batch-biodb.out


AND IT RUNS:

/nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-biodb-to-json.pl \
--executable "/nethome/syoung/base/apps/jbrowse/bin/biodb-to-json.pl" \
--inputdir "/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chrY" \
--outputdir "/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY" \
--jsonfile "/nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json"




BATCH MODE

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/runs

rm -fr batch-biodb.sh
emacs batch-biodb.sh

#!/bin/sh


#PBS -j oe
#PBS -m bea
#PBS -M syoung@med.miami.edu

echo "Running run-dbiodb-to-json.pl in BATCH MODE"


cd /nethome/syoung/base/apps/jbrowse/bin


/nethome/syoung/base/bin/utils/batch.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/chromosome-gff-biodb-to-json-batchfile.txt \
--columns "--executable,--inputdir,--outputdir,--jsonfile" \
--application /nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-biodb-to-json.pl \
&> /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/batch-biodb.out

echo "Completed"
#### END OF SCRIPT


cd /nethome/syoung/base/pipeline/jbrowse/ucsc/runs

qsub -q psmall batch-biodb.sh ; date ; sleep 2; qstat


    170383.kronos.ccs.miami.edu
    Tue Dec 15 13:56:55 EST 2009
    170383.kronos             batch-biodb.sh   syoung                 0 R psmall         






SINGLE DIRECTORY MODE ON CLUSTER (ngsdev HAS 1GB OF MEMORY, CLUSTER NODES HAVE 12GB)



cd /nethome/syoung/base/pipeline/jbrowse/ucsc/runs

rm -fr single-biodb.sh
emacs single-biodb.sh

#!/bin/sh

#PBS -j oe
#PBS -m bea
#PBS -M syoung@med.miami.edu

echo "Running run-dbiodb-to-json.pl in SINGLE DIRECTORY MODE"

cd /nethome/syoung/base/apps/jbrowse/perlmods/BioPerl-1.6.0

echo "Changed directory to: /nethome/syoung/base/apps/jbrowse/perlmods/BioPerl-1.6.0"

/nethome/syoung/base/apps/aqwa/0.4/bin/apps/run-biodb-to-json.pl \
--executable /nethome/syoung/base/apps/jbrowse/bin/biodb-to-json.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1 \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json \
&> /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/single-biodb.out

echo "Completed"
#### END OF SCRIPT


qsub -q psmall single-biodb.sh






WHICH RUNS biodb-to-json.pl WITH ONE INPUT GFF FILE AT A TIME, E.G.:

/var/www/html/jbrowse/bin/biodb-to-json.pl \
--conf /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/runbiodb/123456/temp.json


WHERE THE .json FILE CONTAINS THE DIRECTORY LOCATION

    "-dir": "/nethome/syoung/base/pipeline/jbrowse/chr1/runbiodb/123456"


AND THE DIRECTORY CONTAINS A SINGLE GFF FILE:

/nethome/syoung/base/pipeline/jbrowse/chr1/runbiodb/123456/hs-conrad-dels-chr1.gff





REQUIRED INPUTS


1. refSeqs.js FILE

emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2/data/refSeqs.js 

    refSeqs =
    [
       {
          "length" : 247249719,
          "name" : "chr1",
          "seqDir" : "view/plugins/jbrowse/data/seq/chr1",
          "seqChunkSize" : 20000,
          "end" : 247249719,
          "start" : 0
       }
    ]


NB: EACH CHROMOSOME STARTS AT ZERO, E.G. CHROMOSOME 2:

    refSeqs = 
    [
       {
          "length" : 242951149,
          "name" : "chr2",
          "seqDir" : "view/plugins/jbrowse/data/seq/chr2",
          "seqChunkSize" : 20000,
          "end" : 242951149,
          "start" : 0
       }
    ]



NOTES
-----


INSTALLED JSON IN jbrowse/lib BECAUSE IT WAS MISSING FROM site_perl ON CLUSTER NODES

SIMPLE COPY FROM

E:\0.4\lib\5.8.8\x86_64-linux-thread-multi\JSON
E:\0.4\lib\5.8.8\x86_64-linux-thread-multi\JSON.pm

TO

/nethome/syoung/base/apps/jbrowse/lib




ADDED THESE 'USE' LINES TO biodb-to-json.pl

emacs /nethome/syoung/base/apps/jbrowse/bin/biodb-to-json.pl

use lib "/nethome/syoung/base/apps/jbrowse/perlmods/BioPerl-1.6.0";
use lib "/nethome/syoung/base/apps/jbrowse/lib";





</entry>

<entry [Mon Dec 14 13:55:44 EDT 2009] BATCH EDIT trackInfo.js BY ADDING 'plugins/view/jbrowse/' TO URL ENTRIES>



        ***** NOTE: DO THIS AFTER RUNNING biodb-to-json.pl  *****



/nethome/syoung/base/bin/utils/batch.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/reference-editTrackInfo-batchfile.txt \
--columns "--inputfile,--path" \
--application /data/aqwa/0.4/bin/apps/trackInfo.pl


    Run time: 00:00:09
    Completed /nethome/syoung/base/bin/utils/batch.pl
    11:07AM, 15 December 2009
    ****************************************


WHICH PRODUCED FILES LIKE THIS:

cat /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15/data/trackInfo.js
trackInfo = 
[
   {
      "args" : {
         "chunkSize" : 20000
      },
      "url": "plugins/view/jbrowse/data/seq/{refseq}/",
      "type" : "SequenceTrack",
      "label" : "DNA",
      "key" : "DNA"
   }
]


THE BATCH FILE:

emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/reference-editTrackInfo-batchfile.txt

/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr2/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr3/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr4/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr5/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr6/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr7/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr8/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr9/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr10/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr11/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr12/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr13/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr14/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr17/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr18/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr19/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr20/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr21/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr22/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrX/data/trackInfo.js	plugins/view/jbrowse
/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chrY/data/trackInfo.js	plugins/view/jbrowse



WHICH DOES THIS PER CHROMOSOME DIRECTORY:

/data/aqwa/0.4/bin/apps/trackInfo.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/trackInfo.js \
--path "plugins/view/jbrowse"


WHICH CHANGES THIS

      "url" : "data/seq/{refseq}/",

TO THIS

      "url" : "plugins/view/jbrowse/data/seq/{refseq}/",

WITH THIS FILE FORMAT

trackInfo = 
[
   {
      "url" : "data/seq/{refseq}/",
      "args" : {
         "chunkSize" : 20000
      },
      "label" : "DNA",
      "type" : "SequenceTrack",
      "key" : "DNA"
   },

 
SO THAT LOADED URLS WILL CHANGE FROM

http://localhost/aqwa/0.4/data/tracks/chr1/exon/trackData.json

TO

http://localhost/aqwa/0.4/plugins/view/jbrowse/data/tracks/chr1/exon/trackData.json





RESTORE trackInfo.js FILES:

cp trackinfo.safe/trackInfo.js chr1/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr2/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr3/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr4/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr5/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr6/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr7/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr8/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr9/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr10/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr11/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr12/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr13/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr14/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr15/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr16/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr17/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr18/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr19/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr20/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr21/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chr22/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chrX/data/trackInfo.js
cp trackinfo.safe/trackInfo.js chrY/data/trackInfo.js






</entry>

<entry [Mon Dec 14 13:00:44 EDT 2009] RUN gtf2gff.pl ON ALL chromosome-gtf FILES WITH batch.pl>



RUN gtf2gff.pl ON ALL chromosome-gtf FILES WITH batch.pl


1. CREATE CHROMOSOME DIRECTORIES:

mkdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff

mkdir chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrYl



2. BACKUP reference/chr*/data/trackInfo.js FILES

SINCE THE FILES ARE IDENTICAL, JUST COPY ONE 

mkdir -p /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/trackinfo.safe

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference
cp chr2/data/trackInfo.js trackinfo.safe/trackInfo.js

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
   }
]


AND COPY OVER A PRISTINE trackInfo.js FILE TO DIRECTORY chr1/data

cp chr2/data/trackInfo.js chr1/data

cat chr1/data/trackInfo.js

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
       }
    ]

TO WIPE OUT PREVIOUS VERSIONS LIKE:

    cat /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/trackInfo.js
    trackInfo = 
    [
       {
          "url": "plugins/view/jbrowse/data/seq/{refseq}/",
          "args" : {
             "chunkSize" : 20000
          },
          "label" : "DNA",
          "type" : "SequenceTrack",
          "key" : "DNA"
       },
       {
          "url": "plugins/view/jbrowse/data/tracks/{refseq}/exon/trackData.json",
          "label" : "exon",
          "type" : "FeatureTrack",
          "key" : "Cytoband"
       },
       {
          "url": "plugins/view/jbrowse/data/tracks/{refseq}/cytoband/trackData.json",
          "type" : "FeatureTrack",
          "label" : "cytoband",
          "key" : "Cytoband"
       },
       {
          "url": "plugins/view/jbrowse/data/tracks/{refseq}/Cytoband/trackData.json",
          "label" : "Cytoband",
          "type" : "FeatureTrack",
          "key" : "Cytoband"
       },
       {
          "url": "plugins/view/jbrowse/data/tracks/{refseq}/Conrad_Deletion/trackData.json",
          "type" : "FeatureTrack",
          "label" : "Conrad_Deletion",
          "key" : "Conrad deletions"
       },
       {
          "url": "plugins/view/jbrowse/data/tracks/{refseq}/CpG_Island/trackData.json",
          "label" : "CpG_Island",
          "type" : "FeatureTrack",
          "key" : "CpG Island"
       },
       {
          "url": "plugins/view/jbrowse/data/tracks/{refseq}/Cytoband_Ideogram/trackData.json",
          "type" : "FeatureTrack",
          "label" : "Cytoband_Ideogram",
          "key" : "Cytoband Ideogram"
       }
    ]




3. RUN gtf2gff.pl


SINGLE DIRECTORY MODE

/nethome/syoung/base/apps/aqwa/0.4/bin/apps/gtf2gff.pl \
--configfile "/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/refSeqs.js" \
--inputdir "/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/chr1" \
--outputdir "/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1" \
--jsonfile "/nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json"


BATCH MODE ON CLUSTER BIG MEMORY NODE 

mkdir /nethome/syoung/base/pipeline/jbrowse/ucsc/runs
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/runs

emacs batch-gtf2gff.sh

#!/bin/sh

#PBS -j oe
#PBS -m bea
#PBS -M syoung@med.miami.edu

echo "Running batch on gtf2gff.pl"

/nethome/syoung/base/bin/utils/batch.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/genome-gtf-gtf2gff-batchfile.txt \
--columns "--configfile,--inputdir,--outputdir,--jsonfile" \
--application /nethome/syoung/base/apps/aqwa/0.4/bin/apps/gtf2gff.pl \
&> /nethome/syoung/base/pipeline/jbrowse/ucsc/runs/batch-gtf2gff.out

echo "Completed"
#### END OF SCRIPT


cd /nethome/syoung/base/pipeline/jbrowse/ucsc/runs
qsub -q psmall batch-gtf2gff.sh


RUNNING:


        170318.kronos.ccs.miami.edu
        
        Tue Dec 15 03:09:32 EST 2009
        [syoung@ngsdev runs]$ qstat
        Job id                    Name             User            Time Use S Queue
        ------------------------- ---------------- --------------- -------- - -----
        170314.kronos             batch-gtf2gff.sh syoung                 0 Q pbigmem        
        170317.kronos             batch-gtf2gff.sh syoung                 0 Q gbigmem        
        170318.kronos             batch-gtf2gff.sh syoung                 0 R psmall         
        [syoung@ngsdev runs]$ 



    Run time: 00:22:50
    Completed /nethome/syoung/base/bin/utils/batch.pl
    4:28AM, 15 December 2009
    ****************************************






THE GFF DIRECTORY IS MISSING FOUR FILES:

alt-events-chr1.gff                                           <
haib-methyl-chr1.gff                                          <
ts-mirna-chr1.gff                                             <
uva-dna-rep-chr1.gff                                          <


MISSING FROM ucsc-gff.json FILE -- NOW ADDED TO FILE:

alt-events 
ts-mirna 
uva-dna-rep

AND CHANGED haib-methyl-seq TO haib-methl

AND RERAN


cd /nethome/syoung/base/pipeline/jbrowse/ucsc/runs
qsub -q psmall batch-gtf2gff.sh

    170890.kronos.ccs.miami.edu
    Tue Dec 15 19:49:02 EST 2009
    170890.kronos             batch-gtf2gff.sh syoung                 0 R psmall 

    Run time: 00:26:41
    Completed /nethome/syoung/base/bin/utils/batch.pl
    8:15PM, 15 December 2009
    ****************************************

OK!


[syoung@u01 ucsc]$ diff -y chr1-gtf chr1-gff 

affy-exon-probes-chr1.gff                                       affy-exon-probes-chr1.gff
*** alt-events-chr1.gff                                           <
broad-histone-chr1.gff                                          broad-histone-chr1.gff
ccds-chr1.gff                                                   ccds-chr1.gff
cpg-islands-chr1.gff                                            cpg-islands-chr1.gff
dbsnp129-chr1.gff                                               dbsnp129-chr1.gff
encode-common-cnv-chr1.gff                                      encode-common-cnv-chr1.gff
eponine-tss-chr1.gff                                            eponine-tss-chr1.gff
exapted-repeats-chr1.gff                                        exapted-repeats-chr1.gff
genome-variants-chr1.gff                                        genome-variants-chr1.gff
haib-methyl127-chr1.gff                                         haib-methyl127-chr1.gff
*** haib-methyl-chr1.gff                                          <
hapmap-ld-phased-chr1.gff                                       hapmap-ld-phased-chr1.gff
hapmap-snp-chr1.gff                                             hapmap-snp-chr1.gff
interrupted-repeats-chr1.gff                                    interrupted-repeats-chr1.gff
intrrepts327-chr1.gff                                           intrrepts327-chr1.gff
microsatellite-chr1.gff                                         microsatellite-chr1.gff
n-scan-chr1.gff                                                 n-scan-chr1.gff
omim-genes-chr1.gff                                             omim-genes-chr1.gff
open-chromatin-chr1.gff                                         open-chromatin-chr1.gff
polyA-chr1.gff                                                  polyA-chr1.gff
pseudogenes-chr1.gff                                            pseudogenes-chr1.gff
recomb-rate-chr1.gff                                            recomb-rate-chr1.gff
repeatmasker-chr1.gff                                           repeatmasker-chr1.gff
repmask327-chr1.gffgff                                        | repmask327-chr1.gtfgtf
segmental-dups-chr1.gff                                         segmental-dups-chr1.gff
self-chain-chr1.gff                                             self-chain-chr1.gff
sib-alt-splicing-chr1.gff                                       sib-alt-splicing-chr1.gff
simple-repeats-chr1.gff                                         simple-repeats-chr1.gff
sno-mirna-chr1.gff                                              sno-mirna-chr1.gff
structural-variation-chr1.gff                                   structural-variation-chr1.gff
switchgear-tss-chr1.gff                                         switchgear-tss-chr1.gff
tajima-D-snps-chr1.gff                                          tajima-D-snps-chr1.gff
tfbs-conserved-chr1.gff                                         tfbs-conserved-chr1.gff
*** ts-mirna-chr1.gff                                             <
ucsc-geneschr1.gff                                              ucsc-geneschr1.gff
*** uva-dna-rep-chr1.gff                                          <
vienna-rnaz-chr1.gff                                            vienna-rnaz-chr1.gff
vista-enhancers-chr1.gff                                        vista-enhancers-chr1.gff
wiki-track-chr1.gff                                             wiki-track-chr1.gff
yale-tfbs-chr1.gff                                              yale-tfbs-chr1.gff






    
BUT THIS WON'T RUN EVEN THOUGH BOTH BIGMEM NODES ARE IDLE:
**** BIG MEM NODES WERE RESERVED BY YVONNE ****

qsub -q pbigmem batch-gtf2gff.sh

OR

qsub -q gbigmem batch-gtf2gff.sh



    Job id                    Name             User            Time Use S Queue
    ------------------------- ---------------- --------------- -------- - -----
    170314.kronos             batch-gtf2gff.sh syoung                 0 Q pbigmem        
    170317.kronos             batch-gtf2gff.sh syoung                 0 Q gbigmem
        
        
BOTH JOBS GIVE THE SAME ERROR:

checkjob 170314

    job 170314
    
    AName: batch-gtf2gff.sh
    State: Idle 
    Creds:  user:syoung  group:bioinfo  account:bioinfo  class:pbigmem
    WallTime:   00:00:00 of 3:00:00:01
    SubmitTime: Tue Dec 15 02:36:13
      (Time Queued  Total: 00:20:38  Eligible: 00:19:57)
    
    Total Requested Tasks: 1
    
    Req[0]  TaskCount: 1  Partition: ALL  
    Memory >= 0  Disk >= 0  Swap >= 0
    
    
    
    BypassCount:    2
    Flags:          RESTARTABLE
    Attr:           checkpoint
    StartPriority:  2019
    NOTE:  job cannot run in partition base (idle procs do not meet requirements : 0 of 1 procs found)
    idle procs: 193  feasible procs:   0
    
    Node Rejection Summary: [Class: 24][State: 7][Reserved: 2]









NOTES
-----

MYSQL ADAPTOR FOR Bio::DB::SeqFeature::Store REQUIRES THE GFF DATA TO BE ALREADY LOADED INTO THE MYSQL DATABASE:

http://search.cpan.org/~birney/bioperl-1.2.3/scripts/Bio-DB-GFF/bulk_load_gff.pl

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1

bp_bulk_load_gff.pl -d jbrowse -u aqwa -p open4aqwa affy-exon-probes-chr1.gff


    This operation will delete all existing data in database jbrowse.  Continue? y
    Unknown table 'fdna' at /usr/lib/perl5/site_perl/5.8.8/Bio/DB/GFF/Adaptor/dbi.pm line 1135.
    Unknown table 'fdata' at /usr/lib/perl5/site_perl/5.8.8/Bio/DB/GFF/Adaptor/dbi.pm line 1135.
    Unknown table 'fattribute' at /usr/lib/perl5/site_perl/5.8.8/Bio/DB/GFF/Adaptor/dbi.pm line 1135.
    Unknown table 'fmeta' at /usr/lib/perl5/site_perl/5.8.8/Bio/DB/GFF/Adaptor/dbi.pm line 1135.
    Unknown table 'fattribute_to_feature' at /usr/lib/perl5/site_perl/5.8.8/Bio/DB/GFF/Adaptor/dbi.pm line 1135.
    Unknown table 'ftype' at /usr/lib/perl5/site_perl/5.8.8/Bio/DB/GFF/Adaptor/dbi.pm line 1135.
    Unknown table 'fgroup' at /usr/lib/perl5/site_perl/5.8.8/Bio/DB/GFF/Adaptor/dbi.pm line 1135.
    $ref is null.  source = , method = , group = 
    Total parse time  0.09s
    Loading feature data and analyzing tables.  You may see RDBMS messages here...
    ERROR 1045 (28000) at line 1: Access denied for user 'aqwa'@'localhost' (using password: YES)
    Total load time  0.00s
    done...
    Analyzing/optimizing tables. You will see database messages...
    Optimization time time  0.00s
    FAILURE: Please see standard error for details


head affy-exon-probes-chr1.gff 

    ### /data/aqwa/0.4/bin/apps/gtf2gff.pl --configfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/refSeqs.js --inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/chr1 --outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gff/chr1 --jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json
    ####1:14AM, 15 December 2009
    
    chr1    refseq  refseq  1       247249720       .       .       .       Name=chr1
    chr1    hg18_affyAllExonProbes          184549260       184549379       700     +       .       Name=2372128|extended
    chr1    hg18_affyAllExonProbes          2096947 2097186 300     +       .       Name=2316306|full
    chr1    hg18_affyAllExonProbes          19922582        19923067        700     -       .       Name=2399930|extended



locate bulk_load
/data/jbrowse1/perlmods/BioPerl-1.6.0/blib/bindoc/bp_bulk_load_gff.pl.1
/data/jbrowse1/perlmods/BioPerl-1.6.0/blib/script/bp_bulk_load_gff.pl
/data/jbrowse1/perlmods/BioPerl-1.6.0/scripts/Bio-DB-GFF/bulk_load_gff.PLS
/usr/bin/bp_bulk_load_gff.pl
/usr/bin/bp_pg_bulk_load_gff.pl
/usr/share/man/man1/bp_bulk_load_gff.pl.1
/var/www/html/jbrowse/perlmods/BioPerl-1.6.0/blib/bindoc/bp_bulk_load_gff.pl.1
/var/www/html/jbrowse/perlmods/BioPerl-1.6.0/blib/script/bp_bulk_load_gff.pl
/var/www/html/jbrowse/perlmods/BioPerl-1.6.0/scripts/Bio-DB-GFF/bulk_load_gff.PLS




CREATE SUBDIRECTORIES

mkdir chr1 chr2 chr3 chr4 chr5 chr6 chr7 chr8 chr9 chr10 chr11 chr12 chr13 chr14 chr15 chr16 chr17 chr18 chr19 chr20 chr21 chr22 chrX chrY

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference

cp chr1/data/trackInfo.js trackinfo.safe/chr1/trackInfo.js
cp chr2/data/trackInfo.js trackinfo.safe/chr2/trackInfo.js
cp chr3/data/trackInfo.js trackinfo.safe/chr3/trackInfo.js
cp chr4/data/trackInfo.js trackinfo.safe/chr4/trackInfo.js
cp chr5/data/trackInfo.js trackinfo.safe/chr5/trackInfo.js
cp chr6/data/trackInfo.js trackinfo.safe/chr6/trackInfo.js
cp chr7/data/trackInfo.js trackinfo.safe/chr7/trackInfo.js
cp chr8/data/trackInfo.js trackinfo.safe/chr8/trackInfo.js
cp chr9/data/trackInfo.js trackinfo.safe/chr9/trackInfo.js
cp chr10/data/trackInfo.js trackinfo.safe/chr10/trackInfo.js
cp chr11/data/trackInfo.js trackinfo.safe/chr11/trackInfo.js
cp chr11/data/trackInfo.js trackinfo.safe/chr11/trackInfo.js
cp chr12/data/trackInfo.js trackinfo.safe/chr12/trackInfo.js
cp chr13/data/trackInfo.js trackinfo.safe/chr13/trackInfo.js
cp chr14/data/trackInfo.js trackinfo.safe/chr14/trackInfo.js
cp chr15/data/trackInfo.js trackinfo.safe/chr15/trackInfo.js
cp chr16/data/trackInfo.js trackinfo.safe/chr16/trackInfo.js
cp chr17/data/trackInfo.js trackinfo.safe/chr17/trackInfo.js
cp chr18/data/trackInfo.js trackinfo.safe/chr18/trackInfo.js
cp chr19/data/trackInfo.js trackinfo.safe/chr19/trackInfo.js
cp chr20/data/trackInfo.js trackinfo.safe/chr20/trackInfo.js
cp chr21/data/trackInfo.js trackinfo.safe/chr21/trackInfo.js
cp chr22/data/trackInfo.js trackinfo.safe/chr22/trackInfo.js
cp chrX/data/trackInfo.js trackinfo.safe/chrX/trackInfo.js
cp chrY/data/trackInfo.js trackinfo.safe/chrY/trackInfo.js



</entry>

<entry [Sun Dec 13 23:56:44 EDT 2009] SPLIT COMPLETE DOWNLOADED UCSC FILES IN BATCH MODE>


BATCH RUN USING subdir OPTION TO SPLIT DOWNLOADED FILES INTO PER-CHROMOSOME FILES

mkdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf

/nethome/syoung/base/bin/utils/batch.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/genome-gtf-columnSplit-batchfile.txt \
--columns "--inputfile,--column,--outputdir,--prefix,--suffix,--subdir" \
--application /nethome/syoung/base/bin/utils/columnSplit.pl


    Run time: 00:35:47
    Completed /nethome/syoung/base/bin/utils/batch.pl
    0:55AM, 15 December 2009
    ****************************************




CONTENTS OF BATCH FILE

emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/genome-gtf-columnSplit-batchfile.txt

#### DOWNLOADED THESE FILES FIRST
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/ccds-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	ccds-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/chromoband-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	chromoband-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/chromoband-ideogram-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	chromoband-ideogram-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/cpg-islands-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	cpg-islands-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/dbsnp129-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	dbsnp129-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/encode-common-cnv-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	encode-common-cnv-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/exapted-repeats-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	exapted-repeats-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/gad-view-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	gad-view-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/genome-variants-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	genome-variants-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/hapmap-ld-phased-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	hapmap-ld-phased-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/hapmap-snp-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	hapmap-snp-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/interrrupted-repeats-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	interrupted-repeats-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/intrrepts327-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	intrrepts327-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/microsatellite-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	microsatellite-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encode-yale-rna-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	yale-rna-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/refseq-genes-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	refseq-genes-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/repeatmasker-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	repeatmasker-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/repmask327-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	repmask327-	gffgff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/segmental-dups-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	segmental-dups-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/self-chain-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	self-chain-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/simple-repeats-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	simple-repeats-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/tajima-D-snps-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	tajima-D-snps-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/ucsc-genes-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	ucsc-genes	gff	
	
	
#### NEWLY DOWNLOADED FILES START HERE
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/rgd-human-qtl-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	rgd-human-qtl-  gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/sno-mirna-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	sno-mirna-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/gap-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	gap-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/recomb-rate-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	recomb-rate-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/wiki-track-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	wiki-track-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/alt-events-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	alt-events-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/n-scan-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	n-scan-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/polyA-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	polyA-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/sib-alt-splicing-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	sib-alt-splicing-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/structural-variation-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	structural-variation-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/uva-dna-rep-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	uva-dna-rep-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/affy-exon-probes-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	affy-exon-probes-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/omim-genes-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	omim-genes-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/broad-histone-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	broad-histone-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/eponine-tss-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	eponine-tss-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/haib-methyl127-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	haib-methyl127-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/haib-methyl-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	haib-methyl-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/haib-tfbs-gtf		/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	haib-tfbs-	gff	
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/open-chromatin-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	open-chromatin-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/switchgear-tss-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	switchgear-tss-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/tfbs-conserved-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	tfbs-conserved-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/ts-mirna-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	ts-mirna-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/vista-enhancers-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	vista-enhancers-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/yale-tfbs-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	yale-tfbs-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encode-pseudogenes-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	pseudogenes-	gff	
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encode-vienna-rnaz-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	vienna-rnaz-	gff	
	
### DATA/BED	
### /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/helicos-rna-seq-bed	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	helicos-rna-seq-	gff	
### /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/gc-percent-bed	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	gc-percent-	gff	
### /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/primate-conserved-bed	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	primate-conserved-	gff	
### /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encodeaffy-rna-signal-bed	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf	affy-rna-	gff	
	
### DATA/BED FILES
### /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/helicos-rna-seq-bed	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	helicos-rna-seq-	gff
### /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/gc-percent-bed	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	gc-percent-	gff
### /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/primate-conserved-bed	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	primate-conserved-	gff
### /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encodeaffy-rna-signal-bed	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	affy-rna-	gff





THIS CREATED CHROMOSOME GTF FILES:

ll /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/chr1
total 535M
drwxr-xr-x  2 syoung bioinfo   16K Dec 15 00:56 .
drwxr-xr-x 86 syoung bioinfo   17M Dec 15 00:51 ..
-rw-rw-rw-  1 syoung bioinfo   16M Dec 15 00:51 affy-exon-probes-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo 1019K Dec 15 00:49 alt-events-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  341K Dec 15 00:52 broad-histone-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  4.7M Dec 15 00:21 ccds-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  265K Dec 15 00:21 cpg-islands-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  128M Dec 15 00:22 dbsnp129-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  5.3K Dec 15 00:28 encode-common-cnv-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  522K Dec 15 00:52 eponine-tss-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   95K Dec 15 00:28 exapted-repeats-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   25M Dec 15 00:28 genome-variants-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  1.2M Dec 15 00:52 haib-methyl127-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  1.1M Dec 15 00:52 haib-methyl-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   24M Dec 15 00:30 hapmap-ld-phased-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   32M Dec 15 00:31 hapmap-snp-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   28M Dec 15 00:33 interrupted-repeats-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   32M Dec 15 00:34 intrrepts327-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  316K Dec 15 00:36 microsatellite-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   18M Dec 15 00:49 n-scan-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  157K Dec 15 00:52 omim-genes-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  1.4M Dec 15 00:52 open-chromatin-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  303K Dec 15 00:51 polyA-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   411 Dec 15 00:56 pseudogenes-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   26K Dec 15 00:49 recomb-rate-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   41M Dec 15 00:36 repeatmasker-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   45M Dec 15 00:39 repmask327-chr1.gtfgtf
-rw-rw-rw-  1 syoung bioinfo  552K Dec 15 00:41 segmental-dups-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   52M Dec 15 00:41 self-chain-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  501K Dec 15 00:51 sib-alt-splicing-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  4.9M Dec 15 00:46 simple-repeats-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  9.1K Dec 15 00:49 sno-mirna-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   38K Dec 15 00:51 structural-variation-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  1.5M Dec 15 00:52 switchgear-tss-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   13M Dec 15 00:47 tajima-D-snps-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   38M Dec 15 00:53 tfbs-conserved-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  548K Dec 15 00:56 ts-mirna-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   15M Dec 15 00:48 ucsc-geneschr1.gtf
-rw-rw-rw-  1 syoung bioinfo   103 Dec 15 00:51 uva-dna-rep-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  7.8K Dec 15 00:56 vienna-rnaz-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo  4.7K Dec 15 00:56 vista-enhancers-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   355 Dec 15 00:49 wiki-track-chr1.gtf
-rw-rw-rw-  1 syoung bioinfo   36K Dec 15 00:56 yale-tfbs-chr1.gtf






</entry>

<entry [Sun Dec 13 23:55:44 EDT 2009] COMPLETE LIST OF UCSC DOWNLOADS>


KEY
1. GROUPED BY SECTION
1. FOR EACH NAME IN A SECTION, THE TOP TABLE IN THE LIST WAS DOWNLOADED
2. '..' MEANS .bed FILE


#### Mapping and Sequencing Tracks
Chromosome Band
Chromosome Band (Ideogram)
Recomb Rate
Gap
GC Percent
Wiki Track

#### Phenotype and Disease Associations
GAD View
OMIM Genes
RGD Human QTL

#### Genes and gene prediction tracks
UCSC Genes
Alt Events
CCDS
RefSeq Genes
N-SCAN
sno/miRNA

#### mRNA and EST Tracks
Poly(A)
SIB Alt-Splicing

#### Expression
 ... DATA Affy Exon Tissues
Affy Exon Probes
 ??? Helicos RNA-seq
Structural Variation

#### Regulation
Broad Histone
CpG Islands
Eponine TSS
HAIB Methyl-seq
HAIB Methyl127
HAIB TFBS
Open Chromatin
Switchgear TSS
TFBS Conserved
Vista Enhancers
Yale TFBS

#### Comparative Genomics
Conservation (primate conserved) ???

#### Variation and Repeats
Common Cell CNV
** dbSNP 130
dbSNP 129
Hapmap SNPs
Tajima's D SNPs
Segmental Dups
** Structural Variation
Exapted Repeats
RepeatMasker
RepMask 3.2.7
Interrupted Rpts
Intr Rpts 3.2.7
Simple Repeats
Microsatellite
Self Chain
Genome Variants

#### Pilot ENCODE Regions and Genes
#### EMPTY: Gencode Genes Mar07
Pseudogenes
Vienna RNAz

#### Pilot ENCODE Transcription
 .. Affy RNA Signal
 
#### Pilot ENCODE Chromatin Structure
** Uva DNA Rep




FILE SIZES (BY SIZE):

-rw-r--r--  1 syoung bioinfo 1.9G Dec 14 00:15 dbspn130-gtf
-rw-r--r--  1 syoung bioinfo 1.6G Dec 11 14:09 dbsnp129-gtf
-rw-r--r--  1 syoung bioinfo 837M Dec 11 14:10 self-chain-gtf
-rw-r--r--  1 syoung bioinfo 542M Dec 11 14:10 repmask327-gtf
-rw-r--r--  1 syoung bioinfo 495M Dec 11 14:09 repeatmasker-gtf
-rw-r--r--  1 syoung bioinfo 440M Dec 14 00:16 tfbs-conserved-gtf
-rw-r--r--  1 syoung bioinfo 409M Dec 11 14:09 hapmap-snp-gtf
-rw-r--r--  1 syoung bioinfo 389M Dec 11 14:09 intrrepts327-gtf
-rw-r--r--  1 syoung bioinfo 339M Dec 11 14:09 interrrupted-repeats-gtf
-rw-r--r--  1 syoung bioinfo 316M Dec 11 14:09 genome-variants-gtf
-rw-r--r--  1 syoung bioinfo 301M Dec 11 14:09 hapmap-ld-phased-gtf
-rw-r--r--  1 syoung bioinfo 172M Dec 14 00:15 n-scan-gtf
-rw-r--r--  1 syoung bioinfo 168M Dec 14 00:12 affy-exon-probes-gtf
-rw-r--r--  1 syoung bioinfo 147M Dec 11 14:10 tajima-D-snps-gtf
-rw-r--r--  1 syoung bioinfo 143M Dec 10 13:40 ucsc-genes-gtf
-rw-r--r--  1 syoung bioinfo  65M Dec 11 14:10 simple-repeats-gtf
-rw-r--r--  1 syoung bioinfo  43M Dec 14 00:36 ccds-gtf
-rw-r--r--  1 syoung bioinfo  16M Dec 14 00:16 switchgear-tss-gtf
-rw-r--r--  1 syoung bioinfo  15M Dec 14 00:15 open-chromatin-gtf
-rw-r--r--  1 syoung bioinfo  13M Dec 14 00:15 haib-methyl-gtf
-rw-r--r--  1 syoung bioinfo  11M Dec 14 00:15 haib-methyl127-gtf
-rw-r--r--  1 syoung bioinfo  11M Dec 14 00:12 alt-events-gtf
-rw-r--r--  1 syoung bioinfo 9.3M Dec 11 14:09 refseq-genes-gtf
-rw-r--r--  1 syoung bioinfo 6.3M Dec 11 14:10 segmental-dups-gtf
-rw-r--r--  1 syoung bioinfo 6.3M Dec 14 00:15 eponine-gtf
-rw-r--r--  1 syoung bioinfo 6.0M Dec 14 00:16 ts-mirna-gtf
-rw-r--r--  1 syoung bioinfo 5.2M Dec 14 00:16 sib-alt-splicing-gtf
-rw-r--r--  1 syoung bioinfo 4.1M Dec 11 14:09 microsatellite-gtf
-rw-r--r--  1 syoung bioinfo 3.4M Dec 14 00:12 broad-histone-gtf
-rw-r--r--  1 syoung bioinfo 2.9M Dec 14 00:15 polyA-gtf
-rw-r--r--  1 syoung bioinfo 1.8M Dec 11 14:09 pilot-encode-yale-rna-gtf
-rw-r--r--  1 syoung bioinfo 1.8M Dec 11 14:09 pilot-encodeaffy-rna-signal-gtf
-rw-r--r--  1 syoung bioinfo 1.6M Dec 14 00:15 omim-genes-gtf
-rw-r--r--  1 syoung bioinfo 1.6M Dec 11 14:09 cpg-islands-gtf
-rw-r--r--  1 syoung bioinfo 1.4M Dec 11 14:09 primate-conserved-gtf
-rw-r--r--  1 syoung bioinfo 1.4M Dec 11 14:09 gc-percent-gtf
-rw-r--r--  1 syoung bioinfo 1.3M Dec 11 14:09 helicos-rna-seq-gtf
-rw-r--r--  1 syoung bioinfo 1.1M Dec 11 14:09 exapted-repeats-gtf
-rw-r--r--  1 syoung bioinfo 405K Dec 14 00:16 yale-tfbs-gtf
-rw-r--r--  1 syoung bioinfo 384K Dec 14 00:16 vienna-rnaz-gtf
-rw-r--r--  1 syoung bioinfo 327K Dec 14 00:15 haib-tfbs-gtf
-rw-r--r--  1 syoung bioinfo 318K Dec 14 00:15 recomb-rate-gtf
-rw-r--r--  1 syoung bioinfo 290K Dec 14 00:16 structural-variation-gtf
-rw-r--r--  1 syoung bioinfo 129K Dec 14 00:15 pseudogenes-gtf
-rw-r--r--  1 syoung bioinfo 126K Dec 11 14:09 pilot-encode-vienna-rnaz-gtf
-rw-r--r--  1 syoung bioinfo 116K Dec 14 00:16 sno-mirna-gtf
-rw-r--r--  1 syoung bioinfo  65K Dec 11 14:09 encode-common-cnv-gtf
-rw-r--r--  1 syoung bioinfo  56K Dec 11 14:09 gad-view-gtf
-rw-r--r--  1 syoung bioinfo  51K Dec 14 00:16 vista-enhancers-gtf
-rw-r--r--  1 syoung bioinfo  36K Dec 14 00:15 goldenpath-gaps-gtf
-rw-r--r--  1 syoung bioinfo  31K Dec 11 14:09 chromoband-gtf
-rw-r--r--  1 syoung bioinfo  31K Dec 11 14:09 chromoband-ideogram-gtf
-rw-r--r--  1 syoung bioinfo  26K Dec 11 14:09 pilot-encode-pseudogenes-gtf
-rw-r--r--  1 syoung bioinfo  26K Dec 14 00:21 uva-dna-rep-gtf
-rw-r--r--  1 syoung bioinfo  25K Dec 14 00:15 rgd-human-qtl-gtf
drwxr-xr-x  4 syoung bioinfo  16K Dec 14 00:36 .
drwxr-xr-x 15 syoung bioinfo  16K Dec 13 16:44 ..
drwxr-xr-x  2 syoung bioinfo  16K Dec 13 22:48 gtf
drwxr-xr-x  2 syoung bioinfo  16K Dec 14 00:07 trash
-rw-r--r--  1 syoung bioinfo 2.7K Dec 14 00:16 wiki-track-gtf




FILE SIZES (ALPHABETICAL):

-rw-r--r--  1 syoung bioinfo 168M Dec 14 00:12 affy-exon-probes-gtf
-rw-r--r--  1 syoung bioinfo  11M Dec 14 00:12 alt-events-gtf
-rw-r--r--  1 syoung bioinfo 3.4M Dec 14 00:12 broad-histone-gtf
-rw-r--r--  1 syoung bioinfo  43M Dec 14 00:36 ccds-gtf
-rw-r--r--  1 syoung bioinfo  31K Dec 11 14:09 chromoband-gtf
-rw-r--r--  1 syoung bioinfo  31K Dec 11 14:09 chromoband-ideogram-gtf
-rw-r--r--  1 syoung bioinfo 1.6M Dec 11 14:09 cpg-islands-gtf
-rw-r--r--  1 syoung bioinfo 1.6G Dec 11 14:09 dbsnp129-gtf
-rw-r--r--  1 syoung bioinfo 1.9G Dec 14 00:15 dbspn130-gtf
-rw-r--r--  1 syoung bioinfo  65K Dec 11 14:09 encode-common-cnv-gtf
-rw-r--r--  1 syoung bioinfo 6.3M Dec 14 00:15 eponine-gtf
-rw-r--r--  1 syoung bioinfo 1.1M Dec 11 14:09 exapted-repeats-gtf
-rw-r--r--  1 syoung bioinfo  56K Dec 11 14:09 gad-view-gtf
-rw-r--r--  1 syoung bioinfo 1.4M Dec 11 14:09 gc-percent-gtf
-rw-r--r--  1 syoung bioinfo 316M Dec 11 14:09 genome-variants-gtf
-rw-r--r--  1 syoung bioinfo  36K Dec 14 00:15 goldenpath-gaps-gtf
drwxr-xr-x  2 syoung bioinfo  16K Dec 13 22:48 gtf
-rw-r--r--  1 syoung bioinfo  11M Dec 14 00:15 haib-methyl127-gtf
-rw-r--r--  1 syoung bioinfo  13M Dec 14 00:15 haib-methyl-gtf
-rw-r--r--  1 syoung bioinfo 327K Dec 14 00:15 haib-tfbs-gtf
-rw-r--r--  1 syoung bioinfo 301M Dec 11 14:09 hapmap-ld-phased-gtf
-rw-r--r--  1 syoung bioinfo 409M Dec 11 14:09 hapmap-snp-gtf
-rw-r--r--  1 syoung bioinfo 1.3M Dec 11 14:09 helicos-rna-seq-gtf
-rw-r--r--  1 syoung bioinfo 339M Dec 11 14:09 interrrupted-repeats-gtf
-rw-r--r--  1 syoung bioinfo 389M Dec 11 14:09 intrrepts327-gtf
-rw-r--r--  1 syoung bioinfo 4.1M Dec 11 14:09 microsatellite-gtf
-rw-r--r--  1 syoung bioinfo 172M Dec 14 00:15 n-scan-gtf
-rw-r--r--  1 syoung bioinfo 1.6M Dec 14 00:15 omim-genes-gtf
-rw-r--r--  1 syoung bioinfo  15M Dec 14 00:15 open-chromatin-gtf
-rw-r--r--  1 syoung bioinfo 1.8M Dec 11 14:09 pilot-encodeaffy-rna-signal-gtf
-rw-r--r--  1 syoung bioinfo  26K Dec 11 14:09 pilot-encode-pseudogenes-gtf
-rw-r--r--  1 syoung bioinfo 126K Dec 11 14:09 pilot-encode-vienna-rnaz-gtf
-rw-r--r--  1 syoung bioinfo 1.8M Dec 11 14:09 pilot-encode-yale-rna-gtf
-rw-r--r--  1 syoung bioinfo 2.9M Dec 14 00:15 polyA-gtf
-rw-r--r--  1 syoung bioinfo 1.4M Dec 11 14:09 primate-conserved-gtf
-rw-r--r--  1 syoung bioinfo 129K Dec 14 00:15 pseudogenes-gtf
-rw-r--r--  1 syoung bioinfo 318K Dec 14 00:15 recomb-rate-gtf
-rw-r--r--  1 syoung bioinfo 9.3M Dec 11 14:09 refseq-genes-gtf
-rw-r--r--  1 syoung bioinfo 495M Dec 11 14:09 repeatmasker-gtf
-rw-r--r--  1 syoung bioinfo 542M Dec 11 14:10 repmask327-gtf
-rw-r--r--  1 syoung bioinfo  25K Dec 14 00:15 rgd-human-qtl-gtf
-rw-r--r--  1 syoung bioinfo 6.3M Dec 11 14:10 segmental-dups-gtf
-rw-r--r--  1 syoung bioinfo 837M Dec 11 14:10 self-chain-gtf
-rw-r--r--  1 syoung bioinfo 5.2M Dec 14 00:16 sib-alt-splicing-gtf
-rw-r--r--  1 syoung bioinfo  65M Dec 11 14:10 simple-repeats-gtf
-rw-r--r--  1 syoung bioinfo 116K Dec 14 00:16 sno-mirna-gtf
-rw-r--r--  1 syoung bioinfo 290K Dec 14 00:16 structural-variation-gtf
-rw-r--r--  1 syoung bioinfo  16M Dec 14 00:16 switchgear-tss-gtf
-rw-r--r--  1 syoung bioinfo 147M Dec 11 14:10 tajima-D-snps-gtf
-rw-r--r--  1 syoung bioinfo 440M Dec 14 00:16 tfbs-conserved-gtf
drwxr-xr-x  2 syoung bioinfo  16K Dec 14 00:07 trash
-rw-r--r--  1 syoung bioinfo 6.0M Dec 14 00:16 ts-mirna-gtf
-rw-r--r--  1 syoung bioinfo 143M Dec 10 13:40 ucsc-genes-gtf
-rw-r--r--  1 syoung bioinfo  26K Dec 14 00:21 uva-dna-rep-gtf
-rw-r--r--  1 syoung bioinfo 384K Dec 14 00:16 vienna-rnaz-gtf
-rw-r--r--  1 syoung bioinfo  51K Dec 14 00:16 vista-enhancers-gtf
-rw-r--r--  1 syoung bioinfo 2.7K Dec 14 00:16 wiki-track-gtf
-rw-r--r--  1 syoung bioinfo 405K Dec 14 00:16 yale-tfbs-gtf




++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Sun Dec 13 04:00:44 EDT 2009


SET UP MYSQL FOR USE WITH biodb-to-json.pl

1. RESET THE ROOT PASSWORD

   1. Stop mysqld and restart it with the skip-grant-tables options

sudo su
mysqladmin shutdown
mysqld_safe -skip-grant &
   

   2. Connect to the mysqld server with this command:

mysql -u root

   3. Issue the following statements in the mysql client:
        
UPDATE mysql.user SET Password=PASSWORD('o*m*r') WHERE User='root';
FLUSH PRIVILEGES;

    OK!


2. CREATE USER AND DATABASE

AS ROOT IN MYSQL:

CREATE DATABASE jbrowse;

GRANT ALL PRIVILEGES ON jbrowse.* TO 'aqwa'@'localhost'
IDENTIFIED BY 'open4aqwa' WITH GRANT OPTION;




NOTES
-----


ALSO COPIED /data/aqwa/0.4 OVER TO /nethome/syoung/apps DIRECTORY




</entry>

<entry [Sat Dec 12 01:00:44 EDT 2009] SPLIT DOWNLOADED FILES INTO PER-CHROMOSOME FILES>

mkdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf

SINGLE FILE:

/nethome/syoung/base/bin/utils/columnSplit.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/dbsnp129-gtf \
--column 1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf \
--prefix "dbsnp129-" \
--suffix "gtf"

    Run time: 00:04:53
    Completed /nethome/syoung/base/bin/utils/columnSplit.pl
    2:14PM, 12 December 2009
    ****************************************


BATCH RUN:

/nethome/syoung/base/bin/utils/batch.pl \
--batchfile /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/batchfile.txt \
--columns inputfile,column,outputdir,prefix,suffix \
--application /nethome/syoung/base/bin/utils/columnSplit.pl

    Run time: 01:41:59
    Completed /nethome/syoung/base/bin/utils/batch.pl
    9:15PM, 12 December 2009
    ****************************************


BATCH FILE CONTENTS:


emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/batchfile.txt

/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/ccds-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	ccds-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/chromoband-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	chromoband-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/chromoband-ideogram-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	chromoband-ideogram-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/cpg-islands-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	cpg-islands-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/dbsnp129-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	dbsnp129-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/encode-common-cnv-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	encode-common-cnv-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/exapted-repeats-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	exapted-repeats-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/gad-view-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	gad-view-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/genome-variants-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	genome-variants-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/hapmap-ld-phased-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	hapmap-ld-phased-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/hapmap-snp-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	hapmap-snp-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/interrrupted-repeats-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	interrupted-repeats-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/intrrepts327-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	intrrepts327-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/microsatellite-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	microsatellite-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encode-yale-rna-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	yale-rna-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/primate-conserved-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	primate-conserved-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/refseq-genes-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	refseq-genes-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/repeatmasker-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	repeatmasker-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/repmask327-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	repmask327-	gffgff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/segmental-dups-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	segmental-dups-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/self-chain-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	self-chain-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/simple-repeats-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	simple-repeats-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/tajima-D-snps-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	tajima-D-snps-	gff
/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/ucsc-genes-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	ucsc-genes-	gff

#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/affy-exon-probes-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	affy-exon-probes-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/broad-histone-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	broad-histone-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/eponine-tss-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	eponine-tss-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/gc-percent-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	gc-percent-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/haib-methyl127-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	haib-methyl127-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/haib-methyl-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	haib-methyl-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/haib-tfbs-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	haib-tfbs-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/helicos-rna-seq-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	helicos-rna-seq-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/omim-genes-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	omim-genes-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/open-chromatin-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	open-chromatin-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encode-pseudogenes-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	pseudogenes-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encode-vienna-rnaz-gtf	2	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	vienna-rnaz-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encodeaffy-rna-signal-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	affy-rna-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/pilot-encode-gencode-genes-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	gencode-genes-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/rgd-human-qtl-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	rgd-human-qtl-  gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/sno-mirna-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	sno-mirna-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/switchgear-tss-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	switchgear-tss-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/tfbs-conserved-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	tfbs-conserved-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/ts-mirna-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	ts-mirna-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/vista-enhancers-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	vista-enhancers-	gff
#/nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/yale-tfbs-gtf	1	/nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf/	yale-tfbs-	gff




/nethome/syoung/base/bin/utils/columnSplit.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/genome-gtf/ucsc-genes-gtf \
--column 1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/chromosome-gtf \
--prefix "ucsc-genes-" \
--suffix "gtf"





</entry>

<entry [Thurs Dec 10 01:00:44 EDT 2009] GBROWSE - AN EXAMPLE OF CPAN PAGE >


http://search.cpan.org/~lds/GBrowse-1.992/

MODULES

    MyModule::SubModule

DOCUMENTATION

    application.pl

OTHER FILES

    help.html


</entry>

<entry [Thurs Dec 10 00:00:44 EDT 2009] DOWNLOADED REMAINING HUMAN CHROMOSOME gff FILES FROM UCSC>




ORIGINALLY DOWNLOADED FROM UCSC GENOME TABLES PAGE

http://genome.ucsc.edu/cgi-bin/hgTables

E.G.: GOT CCDS GTF FILES USING THESE SETTINGS:

region:  position   chr1, chr2, ETC. IN SEPARATE DOWNLOADS
output format: GTF - gene transfer format




FTP DOWNLOAD SITES:

WHOLE-GENOME DATABASE .SQL AND .TSV FILES ARE HERE
ftp://hgdownload.cse.ucsc.edu/goldenPath/hg18/database/

WHOLE-GENOME MYSQL TABLES
ftp://hgdownload.cse.ucsc.edu/mysql/hg19/

GENE INFO BUT NO GFF
ftp://hgdownload.cse.ucsc.edu/goldenPath/

ENCODE PROJECT BUT NO GFF
http://genome.ucsc.edu/ENCODE/downloads.html
http://hgdownload.cse.ucsc.edu/goldenPath/hg18/encodeDCC/wgEncodeChromatinMap/






NOTES
-----

POSSIBLE SOLUTION:

DOWNLOAD TABLE FILES AND CONVERT WITH GBrowse-1.998 MODULE FROM CPAN

http://search.cpan.org/~lds/GBrowse-1.992/bin/ucsc_genes2gff.pl

PROBLEM:

This script massages the gene files available from the "tables" link of the UCSC genome browser (genome.ucsc.edu) into a form suitable for loading of gbrowse. Warning: it only works with the gene tables. Other tables, such as EST alignments, contours and repeats, have their own formats which will require other scripts to parse.


INSTALL USING CPAN SHELL TO CUSTOM DIRECTORY

NB: PREREQUISITES:

YAML
ExtUtils::CBuilder


MAKE TEST DIRECTORY

mkdir /data/test


INSIDE CPAN SHELL

o conf makepl_arg PREFIX=/data/test


OR

o conf makepl_arg LIB=/data/test

(The LIB argument lets you install binary components locally as well.)


THEN

install LDS/GBrowse-1.988.tar.gz

BUT FAILS


Files=8, Tests=13,  4 wallclock secs ( 0.13 usr  0.20 sys +  3.33 cusr  0.53 csys =  4.19 CPU)
Result: FAIL
Failed 6/8 test programs. 0/13 subtests failed.
make: *** [test] Error 255
  LDS/GBrowse-1.988.tar.gz
  /usr/bin/make test -- NOT OK
//hint// to see the cpan-testers results for installing this module, try:
  reports LDS/GBrowse-1.988.tar.gz
Running make install
  make test had returned bad status, won't install without force
Failed during this command:
 LDS/GD-2.44.tar.gz                           : writemakefile NO '/usr/bin/perl Makefile.PL LIB=/data/test' returned status 512
 LDS/Bio-Graphics-1.993.tar.gz                : make_test NO
 LDS/CGI.pm-3.48.tar.gz                       : make_test NO
 LDS/GBrowse-1.988.tar.gz                     : make_test NO


SO DO IT MANUALLY:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/software

wget http://search.cpan.org/CPAN/authors/id/L/LD/LDS/GBrowse-1.992.tar.gz

tar xvfz *
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/software/GBrowse-1.992


perl Makefile.PL PREFIX=/data/test

    # running Build.PL --prefix /data/test
    /usr/bin/perl Build.PL --prefix /data/test
    Checking whether your kit is complete...
    Looks good
    
    Checking prerequisites...
     - ERROR: CGI::Session is not installed
     - ERROR: Bio::Graphics is not installed
     - ERROR: GD is not installed
     * Optional prerequisite GD::SVG is not installed
     * Optional prerequisite Safe::World is not installed
     * Optional prerequisite File::NFSLock is not installed
     * Optional prerequisite DBD::Pg is not installed
     * Optional prerequisite DB_File::Lock is not installed
     * Optional prerequisite FCGI is not installed
    
    ERRORS/WARNINGS FOUND IN PREREQUISITES.  You may wish to install the versions
    of the modules indicated above before proceeding with this installation
    
    Creating new 'Build' script for 'GBrowse' version '1.992'
    Now run:
      ./Build test
      ./Build demo          (optional)
      ./Build install       (as superuser/administrator)
            -or-
      ./Build install_slave (optional, for slave installations)
    
    Other useful targets:
      ./Build reconfig      (to reconfigure install locations)
      ./Build demostop      (to stop the demo)




</entry>

<entry [Wed Dec 9 21:00:44 EDT 2009] DOWNLOADED screengrab FIREFOX ADDON FOR SCREEN PRINT>


https://addons.mozilla.org/en-US/firefox/addon/1146

NB: FF 3.5 REQUIRES THE MOST RECENT VERSION

http://outgoing.mozilla.org/v1/58ca3274f96d3342fff816092777d9b10edc283b/https%3A//addons.mozilla.org/en-US/firefox/downloads/file/59229/screengrab-0.96.2-fx.xpi



</entry>

<entry [Wed Dec 9 13:00:44 EDT 2009] SCALED UP gtf2gff.pl AND ADDED feature ARGUMENT>


1) RUN gtf2gff
--------------

SINGLE FILE MODE

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/gff

/data/aqwa/0.4/bin/apps/gtf2gff.pl \
--configfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/refSeqs.js \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/gtf/hs-dbsnp129-chr1-gtf \
--outputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/gff/hs-dbsnp129-chr1.gff \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json


DIRECTORY FILES MODE

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/gff

/data/aqwa/0.4/bin/apps/gtf2gff.pl \
--configfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/gtf \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/gff \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json




EDIT trackInfo.js BY ADDING 'plugins/view/jbrowse/' TO URL ENTRIES:

/data/aqwa/0.4/bin/apps/trackInfo.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/trackInfo.js \
--path "plugins/view/jbrowse"


TO CHANGE THIS

      "url" : "data/seq/{refseq}/",

TO THIS

      "url" : "plugins/view/jbrowse/data/seq/{refseq}/",

WITH THIS FILE FORMAT

trackInfo = 
[
   {
      "url" : "data/seq/{refseq}/",
      "args" : {
         "chunkSize" : 20000
      },
      "label" : "DNA",
      "type" : "SequenceTrack",
      "key" : "DNA"
   },

 
SO THAT LOADED URLS WILL CHANGE FROM

http://localhost/aqwa/0.4/data/tracks/chr1/exon/trackData.json

TO

http://localhost/aqwa/0.4/plugins/view/jbrowse/data/tracks/chr1/exon/trackData.json


OUTPUT FILES:


ll /nethome/syoung/base/pipeline/jbrowse/ucsc/gff

    -rw-rw-rw-  1 syoung bioinfo  27K Dec  9 21:17 hs-conrad-dels-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 185K Dec  9 21:17 hs-cpg-islands-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 4.4K Dec  9 21:17 hs-cytoBand-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 4.9K Dec  9 21:17 hs-cytoBandIdeo-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  82M Dec  9 21:18 hs-dbsnp129-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 9.3M Dec  9 21:17 hs-ensemble-genes-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  468 Dec  9 21:08 hs-gc-percent-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 407K Dec  9 21:17 hs-genomic-superdups-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  22M Dec  9 21:17 hs-hapmap-ceu-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  22M Dec  9 21:17 hs-hapmap-chb-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  22M Dec  9 21:18 hs-hapmap-jpt-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  22M Dec  9 21:19 hs-hapmap-yri-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 1.6K Dec  9 21:18 hs-lafrate-cnps-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  21M Dec  9 21:18 hs-nested-repeats-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 192K Dec  9 21:18 hs-polyA-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  586 Dec  9 21:15 hs-primate-conserved-chr1-bed
    -rw-rw-rw-  1 syoung bioinfo  30M Dec  9 21:19 hs-repeat-masker-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 270K Dec  9 21:20 hs-segmental-dups-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 8.4K Dec  9 21:19 hs-segmental-dups-conrad2-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  37M Dec  9 21:19 hs-self-chain-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo 3.7M Dec  9 21:19 hs-simple-repeats-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  19M Dec  9 21:19 hs-variants-venter-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  12M Dec  9 21:19 hs-variants-watson-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  17M Dec  9 21:20 hs-variants-yan-huang-chr1.gff
    -rw-rw-rw-  1 syoung bioinfo  23M Dec  9 21:20 hs-variants-yri-na18507-chr1.gff




2. RUN WRAPPER FOR biodb-to-json.pl
-----------------------------------

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1

/data/aqwa/0.4/bin/apps/run-biodb-to-json.pl \
--executable /var/www/html/jbrowse/bin/biodb-to-json.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/gff \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1 \
--jsonfile /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json


WHICH RUNS biodb-to-json.pl WITH ONE INPUT GFF FILE AT A TIME, E.G.:

/var/www/html/jbrowse/bin/biodb-to-json.pl \
--conf /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/runbiodb/123456/temp.json


WHERE THE .json FILE CONTAINS THE DIRECTORY LOCATION

    "-dir": "/nethome/syoung/base/pipeline/jbrowse/chr1/runbiodb/123456"


AND THE DIRECTORY CONTAINS ONE GFF FILE:

/nethome/syoung/base/pipeline/jbrowse/chr1/runbiodb/123456/hs-conrad-dels-chr1.gff





REQUIRED INPUTS


1. refSeqs.js FILE

emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2/data/refSeqs.js 

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
    ]

NB: THIS FILE HAS CHROMOSOME-SPECIFIC INDEXING, I.E., EACH CHROMOSOME STARTS AT '0'

    refSeqs = 
    [
       {
          "length" : 242951149,
          "name" : "chr2",
          "seqDir" : "data/seq/chr2",
          "seqChunkSize" : 20000,
          "end" : 242951149,
          "start" : 0
       }
    ]



2. *.json FILE 


rm -fr /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json
emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc-gff.json

{
    "header":
    {
        "description": "Human Chromosome 1",
        "db_adaptor": "Bio::DB::SeqFeature::Store",
        "db_args": {
                        "-adaptor": "memory",
                        "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc/gff"
                    },
      
        "TRACK DEFAULTS": {
          "class": "feature",
          "autocomplete": "all"
        }
    },
    
    "features":
    {
        "hs-conrad-dels-chr1-gtf" :
        {
            "feature": "conrad_del",
            "track" : "Conrad_Deletion",
            "key": "Conrad deletions",
            "class": "transcript"
        },

        "hs-cpg-islands-chr1-gtf" :
        {
            "feature": "cpg_island",
            "track" : "CpG_Island",
            "key": "CpG Island",
            "class": "transcript"
        },
        
        "hs-cytoBand-chr1-gtf" :
        {
            "feature": "cytoband",
            "track" : "Cytoband",
            "key": "Cytoband",
            "class": "transcript"
        },
        
        "hs-cytoBandIdeo-chr1-gtf":
        {
            "feature": "cytoband_ideo",
            "track" : "Cytoband_Ideogram",
            "key": "Cytoband Ideogram",
            "class": "transcript"
        },
        
        "hs-dbsnp129-chr1-gtf":
        {
            "feature": "dbsnp129",
            "track" : "dbSNP_129",
            "key": "dbSNP 129",
            "class": "transcript"
        },

        "hs-ensemble-genes-chr1-gtf":
        {
            "feature": "ensemble_gene",
            "track" : "Ensemble_Gene",
            "key": "Ensemble gene",
            "class": "transcript"
        },

        "hs-genomic-superdups-chr1-gtf":
        {
            "feature": "genomic_superdup",
            "track" : "Genomic_Superdup",
            "key": "Genomic superdup",
            "class": "transcript"
        },

        "hs-hapmap-ceu-chr1-gtf":
        {
            "feature": "hapmap_ceu",
            "track" : "Hapmap_CEU",
            "key": "Hapmap CEU",
            "class": "transcript"
        },

        "hs-hapmap-chb-chr1-gtf":
        {
            "feature": "hapmap_chb",
            "track" : "Hapmap_CHB",
            "key": "Hapmap CHB",
            "class": "transcript"
        },

        "hs-hapmap-jpt-chr1-gtf":
        {
            "feature": "hapmap_jpt",
            "track" : "Hapmap_JPT",
            "key": "Hapmap JPT",
            "class": "transcript"
        },

        "hs-hapmap-yri-chr1-gtf":
        {
            "feature": "hapmap_yri",
            "track" : "Hapmap_YRI",
            "key": "Hapmap YRI",
            "class": "transcript"
        },

        "hs-lafrate-cnps-chr1-gtf":
        {
            "feature": "lafrate_cnp",
            "track" : "Lafrate_CNP",
            "key": "Lafrate CNP",
            "class": "transcript"
        },

        "hs-nested-repeats-chr1-gtf":
        {
            "feature": "nested_repeat",
            "track" : "Nested_repeat",
            "key": "Nested repeat",
            "class": "transcript"
        },
        
        "hs-polyA-chr1-gtf":
        {
            "feature": "polyA",
            "track" : "PolyA",
            "key": "PolyA",
            "class": "transcript"
        },

        "hs-primate-conserved-chr1-bed":
        {
            "feature": "primate_conserved",
            "track" : "Primate_conserved",
            "key": "Primate conserved",
            "class": "transcript"
        },

        "hs-repeat-masker-chr1-gtf":
        {
            "feature": "repeat_masker",
            "track" : "Repeat_Masker",
            "key": "Repeat masker",
            "class": "transcript"
        },

        "hs-segmental-dups-chr1-gtf":
        {
            "feature": "segmental_dup",
            "track" : "Segmental_duplication",
            "key": "Segmental duplication",
            "class": "transcript"
        },

        "hs-segmental-dups-conrad2-chr1-gtf":
        {
            "feature": "segmental_dups_conrad",
            "track" : "Conrad_Segmental_dupl",
            "key": "Conrad segmental dupl",
            "class": "transcript"
        },

        "hs-self-chain-chr1-gtf":
        {
            "feature": "self_chain",
            "track" : "Self_Chain",
            "key": "Self chain",
            "class": "transcript"
        },

        "hs-simple-repeats-chr1-gtf":
        {
            "feature": "simple_repeat",
            "track" : "Simple_Repeat",
            "key": "Simple repeat",
            "class": "transcript"
        },

        "hs-variants-venter-chr1-gtf":
        {
            "feature": "variant_venter",
            "track" : "Variant_Venter",
            "key": "Variant Venter",
            "class": "transcript"
        },

        "hs-variants-watson-chr1-gtf":
        {
            "feature": "variant_watson",
            "track" : "Variant_Watson",
            "key": "Variant Watson",
            "class": "transcript"
        },

        "hs-variants-yan-huang-chr1-gtf":
        {
            "feature": "variant_yanhuang",
            "track" : "Variant_Yanhuang",
            "key": "Variant Yanhuang",
            "class": "transcript"
        },

        "hs-variants-yri-na18507-chr1-gtf":
        {
            "feature": "variant_yri_NA18507",
            "track" : "Variant_YRI_NA18507",
            "key": "Variant YRI NA18507",
            "class": "transcript"
        }
    }
}




NB: WIGGLE TRACKS CAN BE CONSTRUCTED FROM THIS FORMAT FILE:

head /nethome/syoung/base/pipeline/jbrowse/ucsc/gtf/hs-gc-percent-chr1-gtf

    track type=wiggle_0 name="GC Percent" description="GC Percent in 5-Base Windows"
    #       output date: 2009-05-04 01:52:56 UTC
    #       chrom specified: chr1
    #       position specified: 1-247249719
    #       This data has been compressed with a minor loss in resolution.
    #       (Worst case: 0.78125)
    variableStep chrom=chr1 span=5
    1       39.3701
    6       39.3701
    11      39.3701




3. INPUT FILE OR INPUT DIRECTORY

ll /nethome/syoung/base/pipeline/jbrowse/ucsc/gtf

-rw-r--r--  1 syoung bioinfo 2.6K Dec  9 16:09 argsfile.txt
-rw-r--r--  1 syoung bioinfo  12K Apr 29  2009 directory.index
-rw-r--r--  1 syoung bioinfo  38K May  3  2009 hs-conrad-dels-chr1-gtf
-rw-r--r--  1 syoung bioinfo 265K May  3  2009 hs-cpg-islands-chr1-gtf
-rw-r--r--  1 syoung bioinfo 2.3K May  3  2009 hs-cytoBand-chr1
-rw-r--r--  1 syoung bioinfo 6.0K May  3  2009 hs-cytoBand-chr1-gtf
-rw-r--r--  1 syoung bioinfo 2.3K May  3  2009 hs-cytoBandIdeo-chr1
-rw-r--r--  1 syoung bioinfo 6.3K May  3  2009 hs-cytoBandIdeo-chr1-gtf
-rw-r--r--  1 syoung bioinfo 128M May  3  2009 hs-dbsnp129-chr1-gtf
-rw-r--r--  1 syoung bioinfo 1.4K May  3  2009 hs-ensemble-genes-chr1-bed
-rw-r--r--  1 syoung bioinfo 1.4M May  3  2009 hs-ensemble-genes-chr1-data
-rw-r--r--  1 syoung bioinfo  14M May  3  2009 hs-ensemble-genes-chr1-gtf
-rw-r--r--  1 syoung bioinfo 1.4M May  3  2009 hs-gc-percent-chr1-gtf
-rw-r--r--  1 syoung bioinfo 552K May  3  2009 hs-genomic-superdups-chr1-gtf
-rw-r--r--  1 syoung bioinfo  32M May  3  2009 hs-hapmap-ceu-chr1-gtf
-rw-r--r--  1 syoung bioinfo  33M May  3  2009 hs-hapmap-chb-chr1-gtf
-rw-r--r--  1 syoung bioinfo  33M May  3  2009 hs-hapmap-jpt-chr1-gtf
-rw-r--r--  1 syoung bioinfo  32M May  3  2009 hs-hapmap-yri-chr1-gtf
-rw-r--r--  1 syoung bioinfo 1.8K May  3  2009 hs-lafrate-cnps-chr1-gtf
-rw-r--r--  1 syoung bioinfo  28M May  3  2009 hs-nested-repeats-chr1-gtf
-rw-r--r--  1 syoung bioinfo 303K May  3  2009 hs-polyA-chr1-gtf
-rw-r--r--  1 syoung bioinfo 104K May  3  2009 hs-primate-conserved-chr1-bed
-rw-r--r--  1 syoung bioinfo  41M May  3  2009 hs-repeat-masker-chr1-gtf
-rw-r--r--  1 syoung bioinfo 890K May  3  2009 hs-segmental-dups-chr1-gtf
-rw-r--r--  1 syoung bioinfo 9.6K May  3  2009 hs-segmental-dups-conrad2-chr1-gtf
-rw-r--r--  1 syoung bioinfo  52M May  3  2009 hs-self-chain-chr1-gtf
-rw-r--r--  1 syoung bioinfo 4.9M May  3  2009 hs-simple-repeats-chr1-gtf
-rw-r--r--  1 syoung bioinfo  25M May  3  2009 hs-variants-venter-chr1-gtf
-rw-r--r--  1 syoung bioinfo  16M May  3  2009 hs-variants-watson-chr1-gtf
-rw-r--r--  1 syoung bioinfo  22M May  3  2009 hs-variants-yan-huang-chr1-gtf
-rw-r--r--  1 syoung bioinfo  28M May  3  2009 hs-variants-yri-na18507-chr1-gtf


4. OUTPUT FILE OR OUTPUT DIRECTORY

E.G.: /nethome/syoung/base/pipeline/jbrowse/ucsc/gff










</entry>

<entry [Tues Dec 8 23:00:44 EDT 2009] FIX ERROR ON LOAD OF GENERATED SEQUENCES>

1. THE CONTENT PANE WAS NOT RENDERING PROPERLY

SO USED .resize({w: 100, h: 500}) TO RENDER IT


2. STILL SOME ERRORS IN THE JAVASCRIPT

OBJECT 'a is undefined' ERROR IN LazyPatricia.binarySearch:

LazyPatricia.findNode jbrowse.lib.LazyPatricie.findNode(query, callback)
LazyPatricia.findNode query: chr1:98899887 .. 148349831
LazyPatricia.findPath jbrowse.lib.LazyPatricie.findPath(query, callback)
LazyPatricia.findPath query: chr1:98899887 .. 148349831
LazyPatricia.findPath DOING binarySearch(node, query.charAt(qStart))
LazyPatricia.findPath node: undefined
LazyPatricia.findPath query.charAt(0): c
LazyPatricia.binarySearch jbrowse.lib.LazyPatricie.binarySearch(query, callback)
a is undefined

anonymous(Object name=a, "c")LazyPatricia.js (line 208)
anonymous("chr1:98899887 .. 148349831", function())LazyPatricia.js (line 164)
anonymous("chr1:98899887 .. 148349831", function())LazyPatricia.js (line 136)
anonymous("chr1:98899887 .. 148349831", function())LazyPatricia.js (line 124)
anonymous("chr1:98899887 .. 148349831")Browser.js (line 343)
anonymous()Browser.js (line 130)
anonymous()loader.js (line 145)
anonymous()loader.js (line 252)
anonymous()loader.js (line 154)
anonymous()loader.js (line 252)
anonymous()loader.js (line 154)
anonymous()loader.js (line 252)
anonymous()loader.js (line 233)


PROBLEM IN THE binarySearch METHOD OF LazyPatricia:

this.root IS UNDEFINED

SOLUTION:

ADDED

sync: true


TO THE dojo.xhrGet IN FUNCTION LazyTrie(baseURL, rootURL) ON LINE 61



CONVERT BACK TO COMMENTED DEBUGS:


cd E:\0.4\bin\scripts

perl comment.pl --inputdir E:\0.4\html\plugins\view\jbrowse\js  --outputdir E:\0.4\html\plugins\view\jbrowse\js-commented --action comment --type js











</entry>

<entry [Mon Dec 7 01:00:44 EDT 2009] DO REFERENCE SEQUENCES: HUMAN CHROMOSOMES (BUILD 36) ON ngsdev>

THREE STAGES:

    1) BREAK REFERENCE SEQUENCE INTO CHUNKS WITH prepare-refseqs.pl
    
    2) CONVERT ANNOTATION GFF INTO JSON WITH biodb-to-json.pl (OR flatfile-to-json.pl)
    
    3) BUILD A NAME INDEX OF THE TRACKS WITH generate-names.pl
    

1) BREAK REFERENCE SEQUENCE INTO CHUNKS WITH prepare-refseqs.pl


1. LINK CHROMOSOME FILES TO jbrowse/ucsc/chr* DIRECTORIES

ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr1.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/chr1.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr2.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2/chr2.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr3.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr3/chr3.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr4.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr4/chr4.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr5.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr5/chr5.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr6.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr6/chr6.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr7.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr7/chr7.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr8.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr8/chr8.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr9.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr9/chr9.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr10.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr10/chr10.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr11.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr11/chr11.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr12.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr12/chr12.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr13.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr13/chr13.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr14.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr14/chr14.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr15.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15/chr15.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr16.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16/chr16.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr17.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr17/chr17.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr18.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr18/chr18.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr19.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr19/chr19.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr20.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr20/chr20.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr21.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr21/chr21.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chr22.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr22/chr22.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chrX.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chrX/chrX.fa
ln -s /nethome/syoung/base/pipeline/human-chr-fa/chrY.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chrY/chrY.fa



2. RUN prepare-refseqs.pl TO GENERATE data/seq/chr* DIRECTORIES

NB: CANNOT RUN prepare-refseqs.pl ON THE WHOLE GENOME:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/human-genome-fa/genome.fa

    Out of memory!

... SO HAVE TO RUN IT ON EACH INDIVIDUAL CHROMOSOME:


cd /nethome/syoung/base/pipeline/jbrowse/ucsc/
emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/prepare-chromosomes.sh

#!/bin/sh

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/chr1.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2/chr2.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr3;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr3/chr3.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr4;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr4/chr4.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr5;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr5/chr5.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr6;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr6/chr6.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr7;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr7/chr7.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr8;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr8/chr8.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr9;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr9/chr9.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr10;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr10/chr10.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr11;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr11/chr11.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr12;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr12/chr12.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr13;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr13/chr13.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr14;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr14/chr14.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15/chr15.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16/chr16.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr17;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr17/chr17.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr18;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr18/chr18.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr19;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr19/chr19.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr20;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr20/chr20.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr21;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr21/chr21.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chr22;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr22/chr22.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chrX;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chrX/chrX.fa;
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/chrY;
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chrY/chrY.fa;


   
RUN prepare-refseqs.pl WITH THE SHELL FILE:


cd /nethome/syoung/base/pipeline/jbrowse/ucsc/
./prepare-chromosomes.sh &> prep-chromo.out


WHICH PRODUCES THIS OUTPUT:
    
cat prep-chromo.out 
    
    real    4m28.636s
    user    0m7.719s
    sys     0m30.415s
    
    real    4m12.751s
    user    0m7.324s
    sys     0m30.247s
    
    real    3m30.213s
    user    0m6.065s
    sys     0m20.301s

    ...
    
    real    0m7.380s
    user    0m1.277s
    sys     0m4.273s
    
    real    0m45.757s
    user    0m1.357s
    sys     0m4.515s
    
    real    3m24.470s
    user    0m4.624s
    sys     0m15.869s
    
    real    1m3.560s
    user    0m1.572s
    sys     0m5.069s



AND CREATES CHROMOSOME DIRECTORIES HERE:

/nethome/syoung/base/pipeline/jbrowse/ucsc/data/seq/chr1
/nethome/syoung/base/pipeline/jbrowse/ucsc/data/seq/chr2
/nethome/syoung/base/pipeline/jbrowse/ucsc/data/seq/chr3
...


/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/seq/chr1
/nethome/syoung/base/pipeline/jbrowse/ucsc/chr2/data/seq/chr2
/nethome/syoung/base/pipeline/jbrowse/ucsc/chr3/data/seq/chr3
...

AND A refSeqs.js AND A trackInfo.js FILE IN EACH data DIRECTORY:

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
    ]


cat /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/trackInfo.js 

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
       }
    ]
    

cat /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2/data/refSeqs.js 

    refSeqs = 
    [
       {
          "length" : 242951149,
          "name" : "chr2",
          "seqDir" : "data/seq/chr2",
          "seqChunkSize" : 20000,
          "end" : 242951149,
          "start" : 0
       }
    ]

   

ETC...







2) CONVERT ANNOTATION GFF INTO JSON WITH biodb-to-json.pl (OR flatfile-to-json.pl)


1. CONVERT INPUT FILE FROM gtk (DOWNLOADED FROM UCSC) TO gff


cd /nethome/syoung/base/pipeline/jbrowse/ucsc/gff

/data/aqwa/0.4/bin/apps/gtf2gff.pl \
--configfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/refSeqs.js \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/gtf/hs-cytoBand-chr1.gtf \
--outputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/gff/hs-cytoBand-chr1.gff


WHICH PRODUCES THIS OUTPUT FILE:

head /nethome/syoung/base/pipeline/jbrowse/ucsc/gff/hs-cytoBand-chr1.gff

	### /data/aqwa/0.4/bin/apps/gtf2gff.pl --configfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/refSeqs.js --inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/gtf/hs-cytoBand-chr1-gtf --outputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/gff/hs-cytoBand-chr1.gff
	####3:23AM, 8 December 2009
	
	chr1    hg18_cytoBand   exon    0       247249719       .       .       .       Name=chr1
	chr1    hg18_cytoBand   exon    1       2300000 0       .       .       Name=p36.33
	chr1    hg18_cytoBand   exon    2300001 5300000 0       .       .       Name=p36.32
	chr1    hg18_cytoBand   exon    5300001 7100000 0       .       .       Name=p36.31
	chr1    hg18_cytoBand   exon    7100001 9200000 0       .       .       Name=p36.23
	chr1    hg18_cytoBand   exon    9200001 12600000        0       .       .       Name=p36.22
	chr1    hg18_cytoBand   exon    12600001        16100000        0       .       .       Name=p36.21


WHICH WORKS AS INPUT FOR biodb-to-json.pl:

cd /jbrowse/ucsc/conf/ucsc.json
/var/www/html/jbrowse/bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc.json

	working on refseq chr1
	working on track exon
	got 64 features for exon



2. CREATE A .json FILE CONTAINING A TRACK FOR EACH FEATURE


emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc.json
{
    "description": "Volvox Example Database",
    "db_adaptor": "Bio::DB::SeqFeature::Store",
    "db_args": {
        "-adaptor": "memory",
        "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc/gff"
    },
    
    "TRACK DEFAULTS": {
        "class": "feature",
        "autocomplete": "all"
    },
    
    "tracks": [
        {
            "track": "exon",
            "feature": ["exon"],
            "description": 1,
            "class": "transcript",
            "key": "Cytoband",
            "category": "Genes"
        }    
    ]
}


NB: THERE WERE RUN PROBLEMS WITH biodb-to-json.pl BUT THIS .json FILE FORMAT IS FINE!
IT WAS THE .gff FILE THAT HAD FORMAT PROBLEMS:

    - REMOVED ALL "s
    
    - FIRST LINE MUST HAVE THIS FORMAT
    
        chr1	hg18_cytoBand	exon	1	2300000	.	.	.	Name=chr1
    
        (NOTE: IT'S 'Name' MUST BE THE SAME AS THE FIRST COLUMN)
    
    - ALSO FIXED THESE (NOT BLOCKING MISFORMATS, I.E., biodb-to-json.pl WILL STILL RUN) 
    
        - CHANGED 0.000000 TO .
        
        - CHANGED . TO + FOR STRAND


cat /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/refSeqs.js


seqInfo: $VAR1 = {
          'length' => 247249719,
          'name' => 'chr1',
          'seqDir' => 'data/seq/chr1',
          'start' => 0,
          'end' => 247249719,
          'seqChunkSize' => 20000
        };
Bio::DB::SeqFeature::Store::memory=HASH(0x12321f80)->segment(-name => chr1): 

segs: 


CHECK OUT segment SUB OF

emacs /usr/lib/perl5/site_perl/5.8.8/Bio/DB/SeqFeature/Store.pm



cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1

/var/www/html/jbrowse/bin/biodb-to-json.pl \
--conf /nethome/syoung/base/pipeline/jbrowse/ucsc/conf/ucsc.json







3) BUILD A NAME INDEX OF THE TRACKS WITH generate-names.pl


GENERATE lazy-*.js FILES TO ALLOW JBROWSE TO SEARCH AGAINST name OR id


To enable JBrowse to search on name and/or ID, run bin/generate-names.pl to collect the names/IDs from each track into one big dictionary:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1

/var/www/html/jbrowse/bin/generate-names.pl \
-v /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/*/*/names.json

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





THIS GENERATES THE names.json FILE AND UPDATES THE trackInfo.js FILE

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






MOVING ON TO NEXT PROBLEM - LOADS BUT IMAGES DON'T APPEAR AND GET ERRORS IN JAVASCRIPT: SEE ABOVE






TEST THIS LATER:



{
    "description": "Volvox Example Database",
    "db_adaptor": "Bio::DB::SeqFeature::Store",
    "db_args": {
        "-adaptor": "memory",
        "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc/ucsc/gff"
    },
    
    "TRACK DEFAULTS": {
        "class": "feature",
        "autocomplete": "all"
    },
    
    "tracks": [
        {
            "track": "CDS",
            "feature": ["CDS"],
            "description": 1,
            "class": "transcript",
            "subfeatures": true,
            "subfeature_classes": {
                "exon": "transcript-CDS",
                "start_codon": "transcript-UTR"
            },
            "arrowheadClass": "transcript-arrowhead",
            "key": "CCDS genes",
            "category": "Genes"
        }    
    ]
}




    {
      "track": "Clones",
      "feature": ["BAC"],
      "class": "exon",
      "description": 1,
      "key": "Fingerprinted BACs"
    },





cd /nethome/syoung/base/pipeline/jbrowse/ucsc

/var/www/html/jbrowse/bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/ucsc/ucsc.json






time /var/www/html/jbrowse/bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/conf/chr1.json


/nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/conf/chr1.json


/nethome/syoung/base/pipeline/jbrowse/ucsc/chr2/conf/chr2.json








TEST IT OUT ON ORIGINAL SAMPLE DATA

1. GET THE REF SEQ

mkdir /nethome/syoung/base/pipeline/jbrowse/original/reference
cp /var/www/html/jbrowse/docs/tutorial/data_files/*.fa /nethome/syoung/base/pipeline/jbrowse/original/reference


2. GENERATE REF SEQ INFO:

cd /nethome/syoung/base/pipeline/jbrowse/original
/var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/original/reference/volvox.fa

CREATES THREE 20 KB SEQUENCE CHUNK FILES AND THE refSeqs.js FILE:

cat /nethome/syoung/base/pipeline/jbrowse/original/data/refSeqs.js 

refSeqs = 
[
   {
      "length" : 50001,
      "name" : "ctgA",
      "seqDir" : "data/seq/ctgA",
      "seqChunkSize" : 20000,
      "end" : 50001,
      "start" : 0
   }
]


3. GENERATE JSON FEATURES FROM GFF

mkdir /nethome/syoung/base/pipeline/jbrowse/original/gff
cp /var/www/html/jbrowse/docs/tutorial/data_files/*gff* /nethome/syoung/base/pipeline/jbrowse/original/gff


head /var/www/html/jbrowse/docs/tutorial/data_files/*gff3

    ##gff-version 3
    ##Note: See http://song.sourceforge.net
    
    ctgA    example contig  1       50000   .       .       .       Name=ctgA
    ctgA    example remark  1659    1984    .       +       .       Name=f07;Note=This is an example
    ctgA    example remark  3014    6130    .       +       .       Name=f06;Note=This is another example
    ctgA    example remark  4715    5968    .       -       .       Name=f05;Note=Ok! Ok! I get the message.
    ctgA    example remark  13280   16394   .       +       .       Name=f08
    ctgA    example remark  15329   15533   .       +       .       Name=f10
    ctgA    example remark  19157   22915   .       -       .       Name=f13


mkdir /nethome/syoung/base/pipellline/jbrowse/original/conf
cp /var/www/html/jbrowse/docs/tutorial/conf_files/* /nethome/syoung/base/pipeline/jbrowse/original/conf


EDIT -dir LOCATION:

emacs /nethome/syoung/base/pipeline/jbrowse/original/conf/volvox.json
{
  "description": "Volvox Example Database",
  "db_adaptor": "Bio::DB::SeqFeature::Store",
  "db_args": { "-adaptor": "memory",
               "-dir": "/nethome/syoung/base/pipeline/jbrowse/original/gff" },

  "TRACK DEFAULTS": {
    "class": "feature",
    "autocomplete": "all"
  },

  "tracks": [
    {
      "track": "ExampleFeatures",
      "key": "Example Features",
      "feature": ["remark"],
      "autocomplete": "all",
      "class": "feature2"
    },
    {
      "track": "NameTest",
      "feature": ["protein_coding_primary_transcript", "polypeptide"],
      "class": "feature2",
      "key": "Name test track"
    },
    {
      "track": "Motifs",
      "feature": ["polypeptide_domain"],
      "class": "feature3",
      "description": 1,
      "key": "Example motifs"
    },
    {
      "track": "Alignments",
      "feature": ["match"],
      "class": "feature4",
      "key": "Example alignments",
      "category": "Alignments"
    },
    {
      "track": "Genes",
      "feature": ["gene"],
      "class": "feature5",
      "key": "Protein-coding genes"
    },
    {
      "track": "ReadingFrame",
      "feature": ["mRNA"],
      "class": "dblhelix",
      "key": "Frame usage",
      "category": "Genes"
    },
    {
      "track": "CDS",
      "feature": ["CDS:predicted", "mRNA:exonerate"],
      "class": "cds",
      "phase": 1,
      "key": "Predicted genes",
      "category": "Genes"
    },
    {
      "track": "Transcript",
      "feature": ["mRNA:exonerate"],
      "description": 1,
      "class": "transcript",
      "subfeatures": true,
      "subfeature_classes": {
        "CDS": "transcript-CDS",
        "UTR": "transcript-UTR"
      },
      "arrowheadClass": "transcript-arrowhead",
      "key": "Exonerate predictions",
      "category": "Genes"
    },
    {
      "track": "Clones",
      "feature": ["BAC"],
      "class": "exon",
      "description": 1,
      "key": "Fingerprinted BACs"
    },
    {
      "track": "EST",
      "feature": ["EST_match:est"],
      "class": "est",
      "key": "ESTs"
    }
  ]
}


#cd /nethome/syoung/base/pipeline/jbrowse/original
#emacs /nethome/syoung/base/pipeline/jbrowse/original/chr1.json
#
#{
#    "description": "Volvox Example Database",
#    "db_adaptor": "Bio::DB::SeqFeature::Store",
#    "db_args": {
#        "-adaptor": "memory",
#        "-dir": "/nethome/syoung/base/pipeline/jbrowse/original/gff"
#    },
#    
#    "TRACK DEFAULTS": {
#        "class": "feature",
#        "autocomplete": "all"
#    },
#    
#    "tracks": [
#        {
#            "track": "CDS",
#            "feature": ["CDS"],
#            "description": 1,
#            "class": "transcript",
#            "subfeatures": true,
#            "subfeature_classes": {
#                "exon": "transcript-CDS",
#                "start_codon": "transcript-UTR"
#            },
#            "arrowheadClass": "transcript-arrowhead",
#            "key": "CCDS genes",
#            "category": "Genes"
#        }    
#    ]
#}


cd /nethome/syoung/base/pipeline/jbrowse/original

/var/www/html/jbrowse/bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/original/conf/volvox.json


WHICH GENERATED THESE FILES IN THE data/tracks DIRECTORY:

cd /nethome/syoung/base/pipeline/jbrowse/original/data
ls tracks/ctgA/

    Alignments  CDS  Clones  EST  ExampleFeatures  Genes  Motifs  NameTest  ReadingFrame  Transcript

ls tracks/ctgA/*

    tracks/ctgA/Alignments:
    names.json  trackData.json
    
    tracks/ctgA/CDS:
    names.json  trackData.json
    
    tracks/ctgA/Clones:
    names.json  trackData.json
    
    tracks/ctgA/EST:
    names.json  trackData.json
    
    tracks/ctgA/ExampleFeatures:
    names.json  trackData.json
    
    tracks/ctgA/Genes:
    names.json  trackData.json
    
    tracks/ctgA/Motifs:
    names.json  trackData.json
    
    tracks/ctgA/NameTest:
    names.json  trackData.json
    
    tracks/ctgA/ReadingFrame:
    names.json  trackData.json
    
    tracks/ctgA/Transcript:
    names.json  subfeatures-1.json  trackData.json








3) BUILD A NAME INDEX OF THE TRACKS WITH generate-names.pl














</entry>

<entry [Wed Apr 29 01:00:44 EDT 2009] GENERATE ALL HUMAN CHROMOSOME DATA FOR jbrowse>

1. REGISTER ALL CHROMOSOMES IN /nethome/syoung/base/pipeline/jbrowse/ucsc

cd /nethome/syoung/base/pipeline/jbrowse/ucsc

INSTEAD OF COPY, LINK ALL THE CHROMOSOME FILES FROM /nethome/syoung/base/pipeline/human-genome:

ln -s /mihg/data/NGS/syoung/human-genome/chr1.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr2.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr3.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr3.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr4.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr4.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr5.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr5.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr6.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr6.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr7.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr7.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr8.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr8.fa
ln -s /mihg/data/NGS/syoung/human-genome/chrX.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chrX.fa
ln -s /mihg/data/NGS/syoung/human-genome/chrY.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chrY.fa

cp /nethome/syoung/base/pipeline/human-genome/chr*.fa /nethome/syoung/base/pipeline/jbrowse/ucsc
ln -s /nethome/syoung/base/pipeline/human-genome/chr2.fa /nethome/syoung/base/pipeline/jbrowse/chr2.fa

RUN SHELL SCRIPT TO GENERATE chr* DIRECTORIES IN /var/www/html/jbrowse/data/tracks:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/
emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/prepare-chromosomes.sh

#!/bin/sh

time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr3.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr4.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr5.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr6.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr7.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr8.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr9.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr10.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr11.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr12.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr13.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr14.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr17.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr18.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr19.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr20.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr21.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr22.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chrX.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chrY.fa


   
RUN THE SCRIPT:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/
./prepare-chromosomes.sh &> prep-chromo.out


WHICH CREATED CHROMOSOME DIRECTORIES HERE:

/nethome/syoung/base/pipeline/jbrowse/ucsc/data/seq/chr1
/nethome/syoung/base/pipeline/jbrowse/ucsc/data/seq/chr2
/nethome/syoung/base/pipeline/jbrowse/ucsc/data/seq/chr3
...



CREATE chr*.json FILES FOR EACH CHROMOSOME



emacs /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json

{
  "description": "Volvox Example Database",
  "db_adaptor": "Bio::DB::SeqFeature::Store",
  "db_args": { "-adaptor": "memory",
               "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc" },

  "TRACK DEFAULTS": {
    "class": "feature",
    "autocomplete": "all"
  },

  "tracks": [

    {
      "track": "CDS",
      "feature": ["CDS"],
      "description": 1,
      "class": "transcript",
      "subfeatures": true,
      "subfeature_classes": {
        "exon": "transcript-CDS",
        "start_codon": "transcript-UTR"
      },
      "arrowheadClass": "transcript-arrowhead",
      "key": "CCDS genes",
      "category": "Genes"
    }

  ]
}





</entry>

<entry [Tues Apr 28 15:57:45 EDT 2009] WIGGLE FILE FORMAT>

http://genome.ucsc.edu/goldenPath/help/wiggle.html



</entry>

<entry [Mon Apr 27 01:00:44 EDT 2009] GENERATE human chr1 DATA FOR jbrowse>

DOWNLOADED CCDS GTF FILES FROM:
http://genome.ucsc.edu/cgi-bin/hgTables

WITH THESE SETTINGS:

region:  position   chr1, chr2, ETC. IN SEPARATE DOWNLOADS
output format: GTF - gene transfer format


5. REGISTER Reference Sequences

Tell JBrowse about your reference sequences with bin/prepare-refseqs.pl
(it's convenient to run the JBrowse scripts from within the JBrowse root directory)

COPY chr1 TO FOLDER
mkdir /nethome/syoung/base/pipeline/jbrowse
cd /nethome/syoung/base/pipeline/jbrowse
cp /nethome/syoung/base/pipeline/human-genome/chr1.fa /nethome/syoung/base/pipeline/jbrowse


cd /var/www/html/jbrowse
time bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1.
fa



    OK

THIS CREATED A NEW DIRECTORY

/var/www/html/jbrowse/data/seq/chr1
files /var/www/html/jbrowse/data/seq/chr1
    
    FILES: 12363 (data/seq/chr1)

AND CHANGED THE data/refSeqs.json FILE FROM:

refSeqs = 
[
   {
      "length" : 50001,
      "name" : "ctgA",
      "seqDir" : "data/seq/ctgA",
      "seqChunkSize" : 20000,
      "end" : 50001,
      "start" : 0
   }
]


TO:

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
]





</entry>

<entry [Wed Apr 29 01:00:44 EDT 2009] ADD GENOMIC FEATURES DOWNLOADED FROM UCSC>

FEATURES:

hs-conrad-dels-chr1-gtf
hs-cpg-islands-chr1-gtf
hs-cytoBand-chr1-gtf
hs-cytoBandIdeo-chr1-gtf
hs-dbsnp129-chr1-gtf
hs-ensemble-genes-chr1-bed
hs-ensemble-genes-chr1-data
hs-ensemble-genes-chr1-gtf
hs-gc-percent-chr1-gtf
hs-genomic-superdups-chr1-gtf
hs-hapmap-ceu-chr1-gtf
hs-hapmap-chb-chr1-gtf
hs-hapmap-jpt-chr1-gtf
hs-hapmap-yri-chr1-gtf
hs-lafrate-cnps-chr1-gtf
hs-nested-repeats-chr1-gtf
hs-polyA-chr1-gtf
hs-primate-conserved-chr1-bed
hs-repeat-masker-chr1-gtf
hs-segmental-dups-chr1-gtf
hs-segmental-dups-conrad2-chr1-gtf
hs-self-chain-chr1-gtf
hs-simple-repeats-chr1-gtf
hs-variants-venter-chr1-gtf
hs-variants-watson-chr1-gtf
hs-variants-yan-huang-chr1-gtf
hs-variants-yri-na18507-chr1-gtf


INFORMATION ON THE 'VARIANT'-TYPE FEATURES AT THE Database of Genomic Variants:

http://projects.tcag.ca/variation/tableview.asp?table=DGV_Content_Summary.txt


ADD FEATURE:

1. USE gtf2gff.pl TO CONVERT gtf FILE TO GFF

cd /nethome/syoung/base/html/Bioptic0.2.5/bin

./gtf2gff.pl --inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/ucsc/hs-cytoBand-chr1-gtf --outputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/ucsc/gff/hs-cytoBand-chr1.gff

head /nethome/syoung/base/pipeline/jbrowse/ucsc/ucsc/gff/hs-cytoBand-chr1.gff
    chr1    hg18_cytoBand   exon    1       2300000 0.000000        .       .       gene_id="p36.33";transcript_id="p36.33";
    chr1    hg18_cytoBand   exon    2300001 5300000 0.000000        .       .       gene_id="p36.32";transcript_id="p36.32";
    chr1    hg18_cytoBand   exon    5300001 7100000 0.000000        .       .       gene_id="p36.31";transcript_id="p36.31";
    chr1    hg18_cytoBand   exon    7100001 9200000 0.000000        .       .       gene_id="p36.23";transcript_id="p36.23";
    chr1    hg18_cytoBand   exon    9200001 12600000        0.000000        .       .       gene_id="p36.22";transcript_id="p36.22";
    chr1    hg18_cytoBand   exon    12600001        16100000        0.000000        .       .       gene_id="p36.21";transcript_id="p36.21";
    chr1    hg18_cytoBand   exon    16100001        20300000        0.000000        .       .       gene_id="p36.13";transcript_id="p36.13";
    chr1    hg18_cytoBand   exon    20300001        23800000        0.000000        .       .       gene_id="p36.12";transcript_id="p36.12";
    chr1    hg18_cytoBand   exon    23800001        27800000        0.000000        .       .       gene_id="p36.11";transcript_id="p36.11";
    chr1    hg18_cytoBand   exon    27800001        30000000        0.000000        .       .       gene_id="p35.3";transcript_id="p35.3";


2. LOAD GFF FILE INTO JBROWSE

emacs /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json

{
  "description": "Volvox Example Database",
  "db_adaptor": "Bio::DB::SeqFeature::Store",
  "db_args": { "-adaptor": "memory",
               "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc/ucsc/gff" },

  "TRACK DEFAULTS": {
    "class": "feature",
    "autocomplete": "all"
  },

  "tracks": [

    {
        "track": "CDS",
        "feature": ["CDS"],
        "description": 1,
        "class": "transcript",
        "subfeatures": true,
        "subfeature_classes": {
            "exon": "transcript-CDS",
            "start_codon": "transcript-UTR"
        },
        "arrowheadClass": "transcript-arrowhead",
        "key": "CCDS genes",
        "category": "Genes"
    },

    {
        "track": "ExampleFeatures",
        "key": "Example Features",
        "feature": ["hg18_cytoBand"],
        "autocomplete": "all",
        "class": "feature2"
    }

  ]
}





</entry>

<entry [Wed Apr 29 01:00:44 EDT 2009] GENERATE ALL HUMAN CHROMOSOME DATA FOR jbrowse>

1. REGISTER ALL CHROMOSOMES IN /nethome/syoung/base/pipeline/jbrowse/ucsc

cd /nethome/syoung/base/pipeline/jbrowse/ucsc

INSTEAD OF COPY, LINK ALL THE CHROMOSOME FILES FROM /nethome/syoung/base/pipeline/human-genome:

ln -s /mihg/data/NGS/syoung/human-genome/chr1.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr2.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr3.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr3.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr4.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr4.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr5.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr5.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr6.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr6.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr7.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr7.fa
ln -s /mihg/data/NGS/syoung/human-genome/chr8.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chr8.fa
ln -s /mihg/data/NGS/syoung/human-genome/chrX.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chrX.fa
ln -s /mihg/data/NGS/syoung/human-genome/chrY.fa /nethome/syoung/base/pipeline/jbrowse/ucsc/chrY.fa

cp /nethome/syoung/base/pipeline/human-genome/chr*.fa /nethome/syoung/base/pipeline/jbrowse/ucsc
ln -s /nethome/syoung/base/pipeline/human-genome/chr2.fa /nethome/syoung/base/pipeline/jbrowse/chr2.fa

RUN SHELL SCRIPT TO GENERATE chr* DIRECTORIES IN /var/www/html/jbrowse/data/tracks:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/
emacs /nethome/syoung/base/pipeline/jbrowse/ucsc/prepare-chromosomes.sh

#!/bin/sh

#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr2.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr3.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr4.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr5.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr6.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr7.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr8.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr9.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr10.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr11.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr12.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr13.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr14.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr15.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr16.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr17.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr18.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr19.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr20.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr21.fa
#time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chr22.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chrX.fa
time /var/www/html/jbrowse/bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/chrY.fa


RUN THE SCRIPT:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc/
./prepare-chromosomes.sh &> prep-chromo.out



CREATE chr*.json FILES FOR EACH CHROMOSOME



emacs /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json

{
  "description": "Volvox Example Database",
  "db_adaptor": "Bio::DB::SeqFeature::Store",
  "db_args": { "-adaptor": "memory",
               "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc" },

  "TRACK DEFAULTS": {
    "class": "feature",
    "autocomplete": "all"
  },

  "tracks": [

    {
      "track": "CDS",
      "feature": ["CDS"],
      "description": 1,
      "class": "transcript",
      "subfeatures": true,
      "subfeature_classes": {
        "exon": "transcript-CDS",
        "start_codon": "transcript-UTR"
      },
      "arrowheadClass": "transcript-arrowhead",
      "key": "CCDS genes",
      "category": "Genes"
    }

  ]
}





</entry>

<entry [Tues Apr 28 15:57:45 EDT 2009] WIGGLE FILE FORMAT>

http://genome.ucsc.edu/goldenPath/help/wiggle.html



</entry>

<entry [Mon Apr 27 01:00:44 EDT 2009] GENERATE human chr1 DATA FOR jbrowse>

DOWNLOADED CCDS GTF FILES FROM:
http://genome.ucsc.edu/cgi-bin/hgTables

WITH THESE SETTINGS:

region:  position   chr1, chr2, ETC. IN SEPARATE DOWNLOADS
output format: GTF - gene transfer format


5. REGISTER Reference Sequences

Tell JBrowse about your reference sequences with bin/prepare-refseqs.pl
(it's convenient to run the JBrowse scripts from within the JBrowse root directory)

COPY chr1 TO FOLDER
mkdir /nethome/syoung/base/pipeline/jbrowse
cd /nethome/syoung/base/pipeline/jbrowse
cp /nethome/syoung/base/pipeline/human-genome/chr1.fa /nethome/syoung/base/pipeline/jbrowse


cd /var/www/html/jbrowse
time bin/prepare-refseqs.pl --fasta /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1.
fa



    OK

THIS CREATED A NEW DIRECTORY

/var/www/html/jbrowse/data/seq/chr1
files /var/www/html/jbrowse/data/seq/chr1
    
    FILES: 12363 (data/seq/chr1)

AND CHANGED THE data/refSeqs.json FILE FROM:

refSeqs = 
[
   {
      "length" : 50001,
      "name" : "ctgA",
      "seqDir" : "data/seq/ctgA",
      "seqChunkSize" : 20000,
      "end" : 50001,
      "start" : 0
   }
]


TO:

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
]



6. REGISTER Features

Tell JBrowse about your features with bin/biodb-to-json.pl:

COPY volvox.json AND ADAPT TO chr1.json:

mdkir /nethome/syoung/base/pipeline/jbrowse/conf
cd /nethome/syoung/base/pipeline/jbrowse/conf
emacs chr1.json

{
  "description": "Volvox Example Database",
  "db_adaptor": "Bio::DB::SeqFeature::Store",
  "db_args": { "-adaptor": "memory",
               "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc" },

  "TRACK DEFAULTS": {
    "class": "feature",
    "autocomplete": "all"
  },
    ...
    {
      "track": "EST",
      "feature": ["EST_match:est"],
      "class": "est",
      "key": "ESTs"
    }
  ]
}

NB: THE ORDER IS IMPORTANT

GOT THIS CORRECT OUTPUT:


cd /nethome/syoung/base/pipeline/jbrowse/conf
/var/www/html/jbrowse/bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json

    working on refseq chr1
    working on track Start Codon
    got 3 features for Start Codon
    working on track CDS
    got 3 features for CDS
    working on track Exons
    got 3 features for Exons
    

... FROM RUNNING ON /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json

emacs /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json

{
  "description": "Volvox Example Database",
  "db_adaptor": "Bio::DB::SeqFeature::Store",
  "db_args": { "-adaptor": "memory",
               "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc" },

  "TRACK DEFAULTS": {
    "class": "feature",
    "autocomplete": "all"
  },

  "tracks": [

    {
      "track": "CDS",
      "feature": ["CDS"],
      "description": 1,
      "class": "transcript",
      "subfeatures": true,
      "subfeature_classes": {
        "exon": "transcript-CDS",
        "start_codon": "transcript-UTR"
      },
      "arrowheadClass": "transcript-arrowhead",
      "key": "CCDS genes",
      "category": "Genes"
    }

  ]
}


####{
####  "description": "Volvox Example Database",
####  "db_adaptor": "Bio::DB::SeqFeature::Store",
####  "db_args": { "-adaptor": "memory",
####               "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc" },
####
####  "TRACK DEFAULTS": {
####    "class": "feature",
####    "autocomplete": "all"
####  },
####
####  "tracks": [
####    {
####      "track": "Start Codon",
####      "feature": ["start_codon"],
####      "class": "feature2",
####      "description": 1,
####      "key": "Start Codon"
####    },
####    {
####      "track": "CDS",
####      "feature": ["CDS", "CDS:predicted", "mRNA:exonerate"],
####      "class": "cds",
####      "phase": 1,
####      "key": "Predicted genes",
####      "category": "Genes"
####    },
####    {
####      "track": "Exons",
####      "feature": ["exon"],
####      "class": "exon",
####      "description": 1,
####      "key": "Exons"
####    }
####
####  ]
####}
####

WHERE THE DATA IS HERE:


head /nethome/syoung/base/pipeline/jbrowse/ucsc/ccds-short.gff3 
    chr1    example contig  1       247249718       .       .       .       Name=chr1
    chr1    hg18_ccdsGene   start_codon     58954   58956   0.000000        +       .       gene_id="CCDS30547.1";transcript_id="CCDS30547.1";
    chr1    hg18_ccdsGene   CDS     58954   59871   0.000000        +       0       gene_id="CCDS30547.1";transcript_id="CCDS30547.1";
    chr1    hg18_ccdsGene   exon    58954   59871   0.000000        +       .       gene_id="CCDS30547.1";transcript_id="CCDS30547.1";
    chr1    hg18_ccdsGene   start_codon     357522  357524  0.000000        +       .       gene_id="CCDS41220.1";transcript_id="CCDS41220.1";
    chr1    hg18_ccdsGene   CDS     357522  358460  0.000000        +       0       gene_id="CCDS41220.1";transcript_id="CCDS41220.1";
    chr1    hg18_ccdsGene   exon    357522  358460  0.000000        +       .       gene_id="CCDS41220.1";transcript_id="CCDS41220.1";
    chr1    hg18_ccdsGene   CDS     610959  611897  0.000000        -       0       gene_id="CCDS41221.1";transcript_id="CCDS41221.1";
    chr1    hg18_ccdsGene   start_codon     611895  611897  0.000000        -       .       gene_id="CCDS41221.1";transcript_id="CCDS41221.1";
    chr1    hg18_ccdsGene   exon    610959  611897  0.000000        -       .       gene_id="CCDS41221.1";transcript_id="CCDS41221.1";[syoung@ngsdev data]$ po
    


NB: MUST MAKE SURE THAT ALL SPACES ARE IN FACT TABS, PARTICULARLY IN FIRST LINE


cd /var/www/html/jbrowse
time bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json

    working on refseq chr1
    working on track CDS
    got 21792 features for CDS
    
    real    7m42.688s
    user    8m31.013s
    sys     0m5.416s



COPY VOLVOX GFF FILE TO JBROWSE DATA DIR:

cp /var/www/html/jbrowse/docs/tutorial/data_files/volvox.gff3 /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1.gff3
cd /nethome/syoung/base/pipeline/jbrowse/ucsc



CHANGED THE GFF FILE TO REFER TO CHR1 INSTEAD OF VOLVOX:

##gff-version 3
##Note: See http://song.sourceforge.net

chr1    example contig  1       247249718       .       .       .       Name=chr1
chr1    example remark  1659    1984    .       +       .       Name=f07;Note=This is an example
chr1    example remark  3014    6130    .       +       .       Name=f06;Note=This is another example
chr1    example remark  4715    5968    .       -       .       Name=f05;Note=Ok! Ok! I get the message.
chr1    example remark  13280   16394   .       +       .       Name=f08
chr1    example remark  15329   15533   .       +       .       Name=f10
chr1    example remark  19157   22915   .       -       .       Name=f13

    
cd /var/www/html/jbrowse
bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json

    working on refseq ctgA
    working on track ExampleFeatures
    got 16 features for ExampleFeatures
    working on track NameTest
    got 4 features for NameTest
    working on track Motifs
    got 15 features for Motifs
    working on track Alignments
    got 15 features for Alignments
    working on track Genes
    got 1 features for Genes
    working on track ReadingFrame
    got 4 features for ReadingFrame
    working on track CDS
    got 3 features for CDS
    working on track Transcript
    got 1 features for Transcript
    working on track Clones
    got 1 features for Clones
    working on track EST
    got 6 features for EST


WHICH CREATED THE directory.index FILE:

cd /nethome/syoung/base/pipeline/jbrowse/ucsc
ll
    -rw-r--r-- 1 syoung bioinfo 241M Apr 26 21:24 chr1.fa
    -rw-r--r-- 1 syoung bioinfo  15K Apr 26 22:14 chr1.gff3
    -rw-r--r-- 1 syoung bioinfo  12K Apr 26  2009 directory.index
    

...AND THE chr1 DIRECTORY IN THE data/tracks FOLDER:

ll /var/www/html/jbrowse/data/tracks/chr1

    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 Alignments
    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 CDS
    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 Clones
    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 EST
    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 ExampleFeatures
    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 Genes
    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 Motifs
    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 NameTest
    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 ReadingFrame
    drwxr-xr-x  2 syoung bioinfo 4.0K Apr 26 22:21 Transcript

ll /var/www/html/jbrowse/data/tracks/chr1/Alignments

    -rw-r--r--  1 syoung bioinfo  823 Apr 26 22:21 names.json
    -rw-r--r--  1 syoung bioinfo  751 Apr 26 22:21 trackData.json



REDID biodb-to-json.pl WITH DOWNLOADED UCSC dbSNP (IN GTF FORMAT):

cd /nethome/syoung/base/pipeline/jbrowse/ucsc
ll
    -rw-r--r-- 1 syoung bioinfo 4.7M Apr 27  2009 ccds-ucsc.gtf
    -rw-r--r-- 1 syoung bioinfo 241M Apr 26 21:24 chr1.fa
    -rw-r--r-- 1 syoung bioinfo  15K Apr 26 22:26 chr1.gff3

cd /nethome/syoung/base/pipeline/jbrowse/ucsc
head ccds-ucsc.gtf

    #### ADDED MANUALLY THIS FIRST LINE BELOW
    chr1    example contig  1       247249718       .       .       .       Name=chr1
    chr1    hg18_ccdsGene   start_codon     58954   58956   0.000000        +       .       gene_id "CCDS30547.1"; transcript_id "CCDS30547.1"; 
    chr1    hg18_ccdsGene   CDS     58954   59871   0.000000        +       0       gene_id "CCDS30547.1"; transcript_id "CCDS30547.1"; 
    chr1    hg18_ccdsGene   exon    58954   59871   0.000000        +       .       gene_id "CCDS30547.1"; transcript_id "CCDS30547.1"; 
    chr1    hg18_ccdsGene   start_codon     357522  357524  0.000000        +       .       gene_id "CCDS41220.1"; transcript_id "CCDS41220.1"; 
    chr1    hg18_ccdsGene   CDS     357522  358460  0.000000        +       0       gene_id "CCDS41220.1"; transcript_id "CCDS41220.1"; 
    chr1    hg18_ccdsGene   exon    357522  358460  0.000000        +       .       gene_id "CCDS41220.1"; transcript_id "CCDS41220.1"; 

cd /nethome/syoung/base/pipeline/jbrowse/ucsc
mv ccds-ucsc.gtf ccds-ucsc.gff3


CHANGED COLUMN 9 ENTRY FORMAT TO INCLUDE "=":

FROM:

chr1    hg18_ccdsGene   start_codon     58954   58956   0.000000        +       .       gene_id "CCDS30547.1"; transcript_id "CCDS30547.1";

TO:

chr1    hg18_ccdsGene   start_codon     58954   58956   0.000000        +       .       gene_id="CCDS30547.1"; transcript_id="CCDS30547.1";

LIKE:

head chr1.gff3
    ##gff-version 3
    ##Note: See http://song.sourceforge.net
    
    chr1    example contig  1       247249718       .       .       .       Name=chr1
    chr1    example remark  1659    1984    .       +       .       Name=f07;Note=This is an example
    chr1    example remark  3014    6130    .       +       .       Name=f06;Note=This is another example
    chr1    example remark  4715    5968    .       -       .       Name=f05;Note=Ok! Ok! I get the message.



cd /nethome/syoung/base/pipeline/jbrowse/ucsc
perl -pi -e 's/gene_id\s+"/gene_id="/g' ccds-ucsc.gff3
perl -pi -e 's/transcript_id\s+"/transcript_id="/g' ccds-ucsc.gff3
perl -pi -e 's/\s+$/\n/g' ccds-ucsc.gff3


head ccds-ucsc.gff3 

    head ccds-ucsc.gff3 
    chr1    example contig  1       247249718       .       .       .       Name=chr1
    chr1    hg18_ccdsGene   start_codon     58954   58956   0.000000        +       .       gene_id="CCDS30547.1";transcript_id="CCDS30547.1"; 
    chr1    hg18_ccdsGene   CDS     58954   59871   0.000000        +       0       gene_id="CCDS30547.1";transcript_id="CCDS30547.1"; 


ADD CHR1 AT TOP OF GFF3 FILE:

emacs ccds-ucsc.gff3 

    chr1    example contig  1       247249718       .       .       .       Name=chr1


SO ITS THE SAME AS chr1.gff3:

head /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1.gff3

    ##gff-version 3
    ##Note: See http://song.sourceforge.net
    
    chr1    example contig  1       247249718       .       .       .       Name=chr1
    chr1    example remark  1659    1984    .       +       .       Name=f07;Note=This is an example
    chr1    example remark  3014    6130    .       +       .       Name=f06;Note=This is another example
    chr1    example remark  4715    5968    .       -       .       Name=f05;Note=Ok! Ok! I get the message.



ADD THESE FEATURES TO chr1.json ('CDS' ONE EXISTED ALREADY): 

    {
      "track": "CDS",
      "feature": ["CDS:predicted", "mRNA:exonerate"],
      "class": "cds",
      "phase": 1,
      "key": "Predicted genes",
      "category": "Genes"
    },

    {
      "track": "Exons",
      "feature": ["exon"],
      "class": "exon",
      "description": 1,
      "key": "Exons"
    },

    {
      "track": "Start Codon",
      "feature": ["start_codon"],
      "class": "feature2",
      "description": 1,
      "key": "Start Codon"
    },





RERUN biodb-to-json.pl:

cd /var/www/html/jbrowse

time bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json
    
    real    7m22.265s
    user    8m13.335s
    sys     0m5.694s


USING ccds-short.gff3 (100 LINES):

time bin/biodb-to-json.pl --conf /nethome/syoung/base/pipeline/jbrowse/conf/chr1.json 
real    0m2.046s
user    0m1.149s
sys     0m0.195s


BEFORE:

cd /var/www/html/jbrowse/data
du -hs  tracks/chr1/*
    12K     tracks/chr1/Alignments
    12K     tracks/chr1/CDS
    12K     tracks/chr1/Clones
    12K     tracks/chr1/EST
    12K     tracks/chr1/ExampleFeatures
    12K     tracks/chr1/Genes
    12K     tracks/chr1/Motifs
    12K     tracks/chr1/NameTest
    12K     tracks/chr1/ReadingFrame
    16K     tracks/chr1/Transcript


AFTER:





For more information about the configuration file, see docs/config.html.

You can also use bin/gff-to-json.pl to prepare GFF files for use with JBrowse. If all of your features are in GFF files, and you have one GFF file per track, then bin/gff-to-json.pl may be all you need. On the other hand, you may find it more convenient to specify all the track details once in a configuration file and use bin/biodb-to-json.pl instead.

If you run bin/gff-to-json.pl without any arguments, it'll show you a list of its command line arguments. Most of those arguments correspond to track settings in the config file, so see the track settings section in the config file documentation for more details.
Names



7. GENERATE lazy-*.js FILES TO ALLOW JBROWSE TO SEARCH AGAINST name OR id

To enable JBrowse to search on name and/or ID, run bin/generate-names.pl to collect the names/IDs from each track into one big dictionary:

cd /var/www/html/jbrowse
bin/generate-names.pl -v data/tracks/*/*/names.json

    67 total names, with 67 in the root chunk


You need to run bin/generate-names.pl again every time you add new features to JBrowse.
And that's all, for basic usage.


8. GENERATE Quantitative tracks

If you want to browse quantitative ("wiggle") tracks in JBrowse, you need to do a bit more work.

cd /var/www/html/jbrowse
bin/wig-to-json.pl --wig docs/tutorial/data_files/volvox_microarray.wig

    working on seq ctgA





NB: DIFFERENCES BETWEEN GTF AND GFF3 FORMAT
-------------------------------------------

http://genome.ucsc.edu/FAQ/FAQformat#format3

GTF format 	
  	

GTF (Gene Transfer Format) is a refinement to GFF that tightens the specification. The first eight GTF fields are the same as GFF. The group field has been expanded into a list of attributes. Each attribute consists of a type/value pair. Attributes must end in a semi-colon, and be separated from any following attribute by exactly one space.

The attribute list must begin with the two mandatory attributes:

    * gene_id value - A globally unique identifier for the genomic source of the sequence.
    * transcript_id value - A globally unique identifier for the predicted transcript. 

Example:
Here is an example of the ninth field in a GTF data line:

    gene_id "Em:U62317.C22.6.mRNA"; transcript_id "Em:U62317.C22.6.mRNA"; exon_number 1

For more information on this format, see http://genes.cse.wustl.edu/GTF2.html.

The Genome Browser groups together GTF lines that have the same transcript_id value. It only looks at features of type exon and CDS.
	





</entry>

<entry [Tue Apr 14 21:38:44 EDT 2009] INSTALLED JBROWSE ON ngsdev AND devx>

http://204.68.94.156/jbrowse/docs/tutorial/

NB: Did not install on ngsdev because of conflicts with subversion. Could have
'erased' subversion and reinstalled but decided not to risk any dependency issues:

yum erase subversion
yum install subversion


SUMMARY
-------

1. INSTALL git (ON devx ONLY TO DOWNLOAD jbrowse)

sudo su
yum install git

2.DOWNLOAD jbrowse

git clone git://github.com/jbrowse/jbrowse.git
    OK

3. TRANSFER TO ngsdev

scp -r syoung@devx.ccs.miami.edu:jbrowse /var/www/html


4. INSTALL PERL MODULES USING CPAN

#### BioPerl 1.6
install C/CJ/CJFIELDS/BioPerl-1.6.0.tar.gz
    FAILED
#### INSTALLED FROM .tar.gz

sudo su
perl Build.PL
./Build test
    OK ON ngsdev
    ....
    t/Variation/Variation_IO.t ................... ok     
    All tests successful.
    Files=318, Tests=15033, 185 wallclock secs ( 5.55 usr  8.69 sys + 143.64 cusr 23.71 csys = 181.59 CPU)
    Result: PASS

./Build install

    OK ON ngsdev
    ...
    Installing /usr/bin/bp_search2alnblocks.pl
    Writing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/.packlist
    /usr/bin/perl maintenance/symlink_script.pl
    Will try to install symlinks to /usr/bin

perl -e 'use Bio::Seq'

    OK


#### required
perl -MCPAN -e shell
install JSON

#### (optional, for speed)
perl -MCPAN -e shell
install JSON::XS 


5. REGISTER Reference Sequences


Tell JBrowse about your reference sequences with bin/prepare-refseqs.pl
(it's convenient to run the JBrowse scripts from within the JBrowse root directory)

cd /var/www/html/jbrowse
bin/prepare-refseqs.pl --fasta docs/tutorial/data_files/volvox.fa

    OK

6. REGISTER Features


Tell JBrowse about your features with bin/biodb-to-json.pl:


cd /var/www/html/jbrowse
bin/biodb-to-json.pl --conf docs/tutorial/conf_files/volvox.json

    working on refseq ctgA
    working on track ExampleFeatures
    got 16 features for ExampleFeatures
    working on track NameTest
    got 4 features for NameTest
    working on track Motifs
    got 15 features for Motifs
    working on track Alignments
    got 15 features for Alignments
    working on track Genes
    got 1 features for Genes
    working on track ReadingFrame
    got 4 features for ReadingFrame
    working on track CDS
    got 3 features for CDS
    working on track Transcript
    got 1 features for Transcript
    working on track Clones
    got 1 features for Clones
    working on track EST
    got 6 features for EST

For more information about the configuration file, see docs/config.html.

You can also use bin/gff-to-json.pl to prepare GFF files for use with JBrowse. If all of your features are in GFF files, and you have one GFF file per track, then bin/gff-to-json.pl may be all you need. On the other hand, you may find it more convenient to specify all the track details once in a configuration file and use bin/biodb-to-json.pl instead.

If you run bin/gff-to-json.pl without any arguments, it'll show you a list of its command line arguments. Most of those arguments correspond to track settings in the config file, so see the track settings section in the config file documentation for more details.
Names





7. GENERATE lazy-*.js FILES TO ALLOW JBROWSE TO SEARCH AGAINST name OR id

To enable JBrowse to search on name and/or ID, run bin/generate-names.pl to collect the names/IDs from each track into one big dictionary:

cd /var/www/html/jbrowse
bin/generate-names.pl -v data/tracks/*/*/names.json

    67 total names, with 67 in the root chunk


You need to run bin/generate-names.pl again every time you add new features to JBrowse.
And that's all, for basic usage.




8. GENERATE Quantitative tracks

If you want to browse quantitative ("wiggle") tracks in JBrowse, you need to do a bit more work.

Prerequisites:

    * libpng


cd /var/www/html/jbrowse
mkdir libpng
cd libpng
wget http://downloads.sourceforge.net/libpng/libpng-1.2.29.tar.bz2
tar xfvj libpng-1.2.29.tar.bz2
cd libpng-1.2.29
./configure
make
sudo su
make install
    ...
    make[2]: Entering directory `/var/www/html/jbrowse/libpng/libpng-1.2.29'
    cd /usr/local/include; rm -f png.h pngconf.h
    cd /usr/local/include; ln -s libpng12/png.h png.h
    cd /usr/local/include; ln -s libpng12/pngconf.h pngconf.h
    cd /usr/local/lib/pkgconfig; rm -f libpng.pc
    cd /usr/local/lib/pkgconfig; ln -s libpng12.pc libpng.pc
    make[2]: Leaving directory `/var/www/html/jbrowse/libpng/libpng-1.2.29'
    make[1]: Leaving directory `/var/www/html/jbrowse/libpng/libpng-1.2.29'

INSTALL libpng:


Compile the wiggle-processing program by running make in the JBrowse root directory

make
g++   -O3 -lpng -o bin/wig2png src/wig2png.cc

    OK
    

System-specific:

    * Apple OS X:

      You need libpng and a C++ compiler; you can get these from MacPorts or Fink.

      Once you have those installed, you need to compile the JBrowse wiggle-processing program. JBrowse includes a makefile to do this, but you may need to add the paths for libpng and png.h to your compiler's library and include paths. e.g.:

      $ make GCC_LIB_ARGS=-L/opt/local/lib GCC_INC_ARGS=-I/opt/local/include

      libpng might be somewhere other than /opt/local, like /usr/X11R6 for example. To find where libpng is, try locate libpng

    * Red Hat/CentOS/Fedora:
      install the libpng and libpng-devel packages. (The rest should just work)

    * Ubuntu:
      install the libpng12 and libpng12-dev packages. (The rest should just work) 


Once wig2png is compiled, you run it via a wrapper script:


cd /var/www/html/jbrowse
bin/wig-to-json.pl --wig docs/tutorial/data_files/volvox_microarray.wig

    working on seq ctgA

