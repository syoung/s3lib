#### ELAND

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22/venn/sav-dbsnp-v-all/eland-dbsnp-vs-eland.tsv \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel eland-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%


#### BOWTIE

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22/venn/sav-dbsnp-v-all/bowtie-dbsnp-vs-bowtie.tsv \
--querylabel bowtie-%REPLICATE%-dbsnp \
--targetlabel bowtie-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%


#### BOWTIE-RF

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22/venn/sav-dbsnp-v-all/bowtie-rf-dbsnp-vs-bowtie-rf.tsv \
--querylabel bowtie-rf-%REPLICATE%-dbsnp \
--targetlabel bowtie-rf-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%


#### NOVOALIGN

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22/venn/sav-dbsnp-v-all/novoalign-dbsnp-vs-novoalign.tsv \
--querylabel novoalign-%REPLICATE%-dbsnp \
--targetlabel novoalign-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%


####  MAQ

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenn.pl \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22/venn/sav-dbsnp-v-all/maq-dbsnp-vs-maq.tsv \
--querylabel maq-%REPLICATE%-dbsnp \
--targetlabel maq-%REPLICATE% \
--suffix sav \
--replicates 1-%REPLICATE%
