/nethome/syoung/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--querylabel hit-33-dbsnp \
--targetlabel hit-%REPLICATE%-dbsnp \
--replicates 1-33 \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--suffix sav \
--binlevel 500000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/elandbowtie/eland-dbsnp-vs-bowtie-dbsnp.tsv \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22 \
--queryindex  33 \
--targetindex %REPLICATE%




INPUT FILES TO SNPVENN.pl

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-33.sav

    -rw-rw-rw- 1 syoung root 14K Jan 20 15:59 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-33.sav

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit.binlevel500000.num44-1.sav

    -rw-rw-rw- 1 syoung root 101K Jan 17 04:29 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit.binlevel500000.num44-1.sav


OUTPUT FILES FROM SNPVENN.pl






/nethome/syoung/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn/eland-1-dbsnp-vs-eland-33-dbsnp.tsv \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--querylabel hit-33-dbsnp \
--targetlabel hit-%REPLICATE%-dbsnp \
--replicates 1-33 \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--binlevel 500000 \
--suffix sav \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22


\
--queryindex  33 \
--targetindex %REPLICATE%






