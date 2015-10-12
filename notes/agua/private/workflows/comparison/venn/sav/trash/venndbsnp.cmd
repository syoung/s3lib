/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/syoung/0.5/bin/apps/venn/SNPVENN.pl \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%/chr22/hit.bam \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn \
--querylabel eland-dbsnp \
--targetlabel eland-33-dbsnp \
--binlevel 500000 \
--suffix "-%REPLICATE%.sav" \
--filename hit.bam \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24




/nethome/syoung/0.5/bin/apps/venn/SNPVENN.pl \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn \
--querylabel eland-1-dbsnp \
--targetlabel eland-33-dbsnp \
--binlevel 500000 \
--suffix "-1.sav" \
--filename hit.bam \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24


--loopout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/savvenn/eland/savvenn.out





eland-vs-bowtie
---------------

/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/syoung/0.5/bin/apps/venn/SNPVENN.pl \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%/chr22/hit.bam \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/elandbowtie \
--querylabel eland \
--targetlabel bowtie \
--binlevel 500000 \
--suffix "-%REPLICATE%.sav" \
--filename hit.bam \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24




/nethome/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop parallel \
--executable /nethome/syoung/0.5/bin/apps/venn/SNPVENN.pl \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/elandbowtie \
--querylabel eland-%REPLICATE%-dbsnp \
--targetlabel bowtie-%REPLICATE%-dbsnp \
--binlevel 500000 \
--suffix sav \
--queryindex %REPLICATE% \
--targetindex %REPLICATE% \
--filename hit.bam \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24



/nethome/syoung/0.5/bin/apps/venn/SNPVENN.pl \
--bamfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.bam \
--querydir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22 \
--targetdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/venn/sav/elandbowtie \
--querylabel eland-1-dbsnp \
--targetlabel bowtie-1-dbsnp \
--binlevel 500000 \
--suffix sav \
--queryindex 1 \
--targetindex 1 \
--filename hit.bam \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24




/nethome/syoung/0.5/bin/apps/venn/snpToVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-1.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-33.sav \
--querylabel eland-1-dbsnp \
--targetlabel eland-33-dbsnp \
--prefix hit.binlevel500000.num44. \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn






CORRECT CALL:

/nethome/syoung/0.5/bin/apps/venn/snpToVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-1.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit.binlevel500000.num44-33.sav \
--querylabel eland-1-dbsnp \
--targetlabel eland-33-dbsnp \
--prefix hit.binlevel500000.num44. \
--suffix sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn


OUTPUT:

    
    Venn::Snp::compare    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn/hit.binlevel500000.num44.eland-1-dbsnp-NOT-eland-33-dbsnp.sav
    Venn::Snp::compare    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn/hit.binlevel500000.num44.eland-33-dbsnp-NOT-eland-1-dbsnp.sav
    Venn::Snp::compare    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn/hit.binlevel500000.num44.eland-1-dbsnp-AND-eland-33-dbsnp.sav




--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/savvenn/stdout/hit.binlevel500000.num103-1.sav.stdout.txt \

 
