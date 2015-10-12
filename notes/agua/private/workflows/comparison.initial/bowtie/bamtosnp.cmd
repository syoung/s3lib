/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/bamToSnp.pl \
--binlevel 500000 \
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