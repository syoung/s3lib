/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/syoung/0.5/bin/apps/snp/filterSav.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-%REPLICATE%.sav \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/splitsav-%REPLICATE%.out \
--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/loop-splitsav.out 


