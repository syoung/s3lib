/nethome/syoung/0.5/bin/apps/venn/collateVenn.pl \
--replicates 1-33 \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel novoalign-%REPLICATE%-dbsnp \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22 \
--queryindex  %REPLICATE% \
--targetindex %REPLICATE% \
--suffix sav \
--binlevel 500000 \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/elandnovoalign/eland-dbsnp-vs-novoalign-dbsnp.tsv
