/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/savvenn/bowtie \
--replicates 1-2 \
--loop distributed \
--looplabel bowtie-savvenn \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-%REPLICATE%-dbsnp.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/hit-%REPLICATE%-dbsnp.sav \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel maq-%REPLICATE%-dbsnp \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/savvenn/bowtie \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/savvenn/bowtie/bowtie-savvenn.out
    
