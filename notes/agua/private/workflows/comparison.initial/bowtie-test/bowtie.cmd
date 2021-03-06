/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--executable /nethome/syoung/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 1-2 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.10000.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.10000.sequence.txt \
--species human \
--distance 200 \
--label bowtie-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--clean \
--queue small \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/%REPLICATE% \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--cluster LSF \
--cpus 1 \
--reads 2000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/%REPLICATE%/bowtie.out \
--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-test/loop-bowtie.out
