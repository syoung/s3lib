/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/syoung/0.5/bin/apps/converters/samToBam.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/%REPLICATE%/chr22/hit.sam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/%REPLICATE%/chr22/hit.bam \
--reference chr22 \
--species human \
--maxjobs 2000 \
--walltime 24 \
--queue small \
--cluster LSF \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/%REPLICATE%/chr22/samtobam-%REPLICATE%.out \
--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie32/cumulative/loop-samtobam.out


