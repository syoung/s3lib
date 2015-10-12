perl /nethome/syoung/0.5/bin/apps/snp/cumulativeBam.pl \
--binlevel 1000000 \
--filename hit.bam \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novo-test/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novo-test/2 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novo-test/cumulative \
--species human \
--label novo-test-cumulative \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novo-test/cumulative/cumulative.out
