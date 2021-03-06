/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/savvenn/eland \
--replicates 1-33 \
--loop distributed \
--looplabel eland-savvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-%REPLICATE%-non-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-33-non-dbsnp.sav \
--querylabel eland-%REPLICATE%-non-dbsnp \
--targetlabel eland-33-non-dbsnp \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/savvenn/eland \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/savvenn/eland/savvenn.out
