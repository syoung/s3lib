/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--executable /nethome/syoung/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 1-33 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--species human \
--distance 200 \
--label bowtie-%REPLICATE% \
--maxjobs 2000 \
--walltime 24 \
--queue small \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--cluster LSF \
--params "--seedlen 32" \
--cpus 1 \
--reads 250000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/bowtie.out \
--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/loop-bowtie.out