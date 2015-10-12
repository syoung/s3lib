/nethome/syoung/0.5/bin/apps/snp/bamToSnp.pl \
--binlevel 1000000 \
--filename hit.bam \
--species human \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/cumulative/chr22 \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/2 \
--maxjobs 2000 \
--queue small \
--cluster LSF \
--walltime 24
