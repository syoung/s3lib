/nethome/syoung/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/chr22/venn \
--querylabel hit-%REPLICATE%-dbsnp \
--targetlabel hit-33-dbsnp \
--replicates 1-33 \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/1/chr22/hit.bam \
--suffix sav \
--binlevel 500000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/bowtie32bowtie32/bowtie32-dbsnp-vs-bowtie32-33-dbsnp.tsv \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/chr22 \
--queryindex  %REPLICATE% \
--targetindex 33



/nethome/syoung/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/bowtie32bowtie32/bowtie32-1-dbsnp-vs-bowtie32-33-dbsnp.tsv \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/chr22 \
--querylabel hit-33-dbsnp \
--targetlabel hit-%REPLICATE%-dbsnp \
--replicates 1-33 \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/1/chr22/hit.bam \
--binlevel 500000 \
--suffix sav \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/chr22


\
--queryindex  33 \
--targetindex %REPLICATE%





/nethome/syoung/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/savvenn/bowtie32-1-dbsnp-vs-bowtie32-33-dbsnp.tsv \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/chr22 \
--querylabel hit-33-dbsnp \
--targetlabel hit-%REPLICATE%-dbsnp \
--replicates 1-1 \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/1/chr22/hit.bam \
--binlevel 500000 \
--suffix sav \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/chr22 \
--queryindex  33 \
--targetindex %REPLICATE%


