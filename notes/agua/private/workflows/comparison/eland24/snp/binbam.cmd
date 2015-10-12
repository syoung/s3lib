/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/syoung/0.5/bin/apps/snp/binBam.pl \
--inputdirs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland24/%REPLICATE% \
--binlevel 500000 \
--reference chr22 \
--maxjobs 2000 \
--walltime 48 \
--queue small \
--cluster LSF \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland24/%REPLICATE%/binbam.out \
--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland24/loop-binbam.out


