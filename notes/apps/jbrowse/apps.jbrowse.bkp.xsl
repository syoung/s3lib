apps.jbrowse


<entry [Tue Mar  1 14:10:27 EST 2011] ENABLED MULTIPLE BROWSERS>

1. REMOVED 'trackAvail' ID FROM Browser.js   

    //createTrackList = function(parent, params) {
    createTrackList : function(parent, params) {
    
    //	var leftPane = document.createElement("div");
    //	leftPane.style.cssText="width: 10em";
    //	parent.appendChild(leftPane);
        var leftPane = this.leftPane.containerNode;
    
    //	var leftWidget = new dijit.layout.ContentPane({region: "left", splitter: true}, leftPane);
        var leftWidget = this.leftPane;
        var trackListDiv = document.createElement("div");
        //trackListDiv.id = "tracksAvail";


*** NB ***: LATER FIX THIS IN touchJBrowse.js

function checkAvatarPosition(first) {
      var leftPane = document.getElementById("tracksAvail"),
          rigthPane = document.getElementById("container");


2. REMOVED REFERENCE TO 'overview' ID IN GenomeView.js:

    //    this.overview = dojo.byId("overview");
        this.overview = browser.overview;	

  
    
</entry>

<entry [Mon Feb 28 22:43:26 EST 2011] GENERATE HUMAN hg19 UCSC TRACKS FOR VERSION 1.2.6>
    

flatfile-to-json.pl OPTIONS:

Options("gff=s" => \$gff,
           "gff2=s" => \$gff2,
           "bed=s" => \$bed,
           "bam=s" => \$bam,
           "out=s" => \$outdir,
           "tracklabel=s" => \$trackLabel,
           "key=s" => \$key,
           "cssClass=s" => \$cssClass,
           "autocomplete=s" => \$autocomplete,
           "getType" => \$getType,
           "getPhase" => \$getPhase,
           "getSubs" => \$getSubs,
           "getLabel" => \$getLabel,
           "urltemplate=s" => \$urlTemplate,
           "extraData=s" => \$extraData,
           "arrowheadClass=s" => \$arrowheadClass,
           "subfeatureClasses=s" => \$subfeatureClasses,
           "clientConfig=s" => \$clientConfig,
           "thinType=s" => \$thinType,
           "thicktype=s" => \$thickType,
           "type=s@" => \$types,
           "nclChunk=i" => \$nclChunk,
           "compress" => \$compress,
           "sortMem=i" =>\$sortMem);



/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/human/hg19/gtf


BASED ON [Sun Jun  6 23:35:17 EDT 2010] DO MOUSE FEATURES


1. DOWNLOADED GTF FILES


FROM
http://genome.ucsc.edu/cgi-bin/hgTables

TO HERE ON UBUNTU
/data/jbrowse/ucsc/human/hg19/gtf

TO HERE ON PEGASUS
/nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/gtf



*ccdsGene
cytoBand
cytoBandIdeo
cpgIslandExt
dgv
*ensGene
exoniphy
gap
gold
geneid
genomicSuperDups
gwasCatalog
hgIkmc
*hinv70Coding
hinv70NonCoding
hinv70PseudoGene
knownAlt
knownGene
*microsat
*nestedRepeats
nscanGene
omimGene
pgNA12878 (CEU daughter)
pgNA12891 (CEU father)
pgNA12892 (CEU mother)'
pgNA19240 (YRI daugher)
*pgYoruban3 (YRI 18507)
*pgYh1 (YanHuang)
*pgSjk (SJK)
refGene
*rmsk Repeat Masker
sgpGene SGP Gene Predictions Using Mouse/Human Homology
*simpleRepeat
*snp131
*snp130
tRNAs
vegaGene
vegaPseudoGene
wgEncodeGencodeAutoV4
wgEncodeGencodePolyaV4
wgEncodeGencode2wayConsPseudoV4
wgRNA (sno/miRNA)


ORDERED BY SIZE:

-rw-r--r-- 1 syoung syoung 335M 2011-03-01 12:36 snp131.gz
-rw-r--r-- 1 syoung syoung 235M 2011-03-01 12:35 snp130.gz
-rw-r--r-- 1 syoung syoung  83M 2011-03-01 12:41 rmsk.gz
-rw-r--r-- 1 syoung syoung  57M 2011-03-01 12:34 hapmapSnpsYRI.gz
-rw-r--r-- 1 syoung syoung  57M 2011-03-01 12:35 hapmapSnpsCEU.gz
-rw-r--r-- 1 syoung syoung  56M 2011-03-01 12:37 hapmapSnpsJPT.gz
-rw-r--r-- 1 syoung syoung  56M 2011-03-01 12:36 hapmapSnpsCHB.gz
-rw-r--r-- 1 syoung syoung  53M 2011-03-01 12:39 hapmapAllelesChimp.gz
-rw-r--r-- 1 syoung syoung  49M 2011-03-01 12:40 hapmapAllelesMacaque.gz
-rw-r--r-- 1 syoung syoung  41M 2011-03-01 12:41 nestedRepeats.gz
-rw-r--r-- 1 syoung syoung  36M 2011-03-01 12:29 pgYoruban3.gz
-rw-r--r-- 1 syoung syoung  32M 2011-03-01 13:26 pgNA19240.gz
-rw-r--r-- 1 syoung syoung  31M 2011-03-01 12:30 pgSjk.gz
-rw-r--r-- 1 syoung syoung  28M 2011-03-01 12:05 hinv70Coding.gz
-rw-r--r-- 1 syoung syoung  27M 2011-03-01 12:29 pgYh1.gz
-rw-r--r-- 1 syoung syoung  27M 2011-03-01 13:24 pgNA12878.gz
-rw-r--r-- 1 syoung syoung  27M 2011-03-01 13:26 pgNA12892.gz
-rw-r--r-- 1 syoung syoung  27M 2011-03-01 13:25 pgNA12891.gz
-rw-r--r-- 1 syoung syoung  23M 2011-03-01 12:33 hapmapSnpsASW.gz
-rw-r--r-- 1 syoung syoung  23M 2011-03-01 12:37 hapmapSnpsMKK.gz
-rw-r--r-- 1 syoung syoung  23M 2011-03-01 12:36 hapmapSnpsLWK.gz
-rw-r--r-- 1 syoung syoung  21M 2011-03-01 12:37 hapmapSnpsTSI.gz
-rw-r--r-- 1 syoung syoung  21M 2011-03-01 12:37 hapmapSnpsMEX.gz
-rw-r--r-- 1 syoung syoung  21M 2011-03-01 12:35 hapmapSnpsGIH.gz
-rw-r--r-- 1 syoung syoung  19M 2011-03-01 12:35 hapmapSnpsCHD.gz
-rw-r--r-- 1 syoung syoung  13M 2011-03-01 12:10 ensGene.gz
-rw-r--r-- 1 syoung syoung  12M 2011-03-01 13:20 simpleRepeat.gz
-rw-r--r-- 1 syoung syoung 9.6M 2011-03-01 11:58 nscanGene.gz
-rw-r--r-- 1 syoung syoung 8.8M 2011-03-01 11:48 knownGene.gz
-rw-r--r-- 1 syoung syoung 8.3M 2011-03-01 11:49 vegaGene.gz
-rw-r--r-- 1 syoung syoung 7.5M 2011-03-01 13:22 chainSelf.gz
-rw-r--r-- 1 syoung syoung 7.1M 2011-03-01 12:04 exonify.gz
-rw-r--r-- 1 syoung syoung 5.3M 2011-03-01 11:56 refGene.gz
-rw-r--r-- 1 syoung syoung 4.9M 2011-03-01 13:30 wgEncodeGencodeAutoV4.gz
-rw-r--r-- 1 syoung syoung 4.0M 2011-03-01 13:29 sgpGene.gz
-rw-r--r-- 1 syoung syoung 3.8M 2011-03-01 12:00 geneid.gz
-rw-r--r-- 1 syoung syoung 3.7M 2011-03-01 11:55 ccdsGene.gz
-rw-r--r-- 1 syoung syoung 3.1M 2011-03-01 12:22 cpgIslandExt
-rw-r--r-- 1 syoung syoung 1.3M 2011-03-01 12:39 dgv.gz
-rw-r--r-- 1 syoung syoung 1.1M 2011-03-01 11:51 knownAlt.gz
-rw-r--r-- 1 syoung syoung 930K 2011-03-01 12:05 hinv70NonCoding.gz
-rw-r--r-- 1 syoung syoung 769K 2011-03-01 12:31 genomicSuperDups.gz
-rw-r--r-- 1 syoung syoung 546K 2011-03-01 13:20 microsat.gz
-rw-r--r-- 1 syoung syoung 539K 2011-03-01 12:07 hgIkmc.gz
-rw-r--r-- 1 syoung syoung 483K 2011-03-01 13:28 gold.gz
-rw-r--r-- 1 syoung syoung 385K 2011-03-01 13:31 wgEncodeGencodePolyaV4.gz
-rw-r--r-- 1 syoung syoung 316K 2011-03-01 11:50 vegaPseudoGene.gz
-rw-r--r-- 1 syoung syoung 255K 2011-03-01 12:19 omimGene.gz
-rw-r--r-- 1 syoung syoung 151K 2011-03-01 13:31 wgEncodeGencode2wayConsPseudoV4.gz
-rw-r--r-- 1 syoung syoung  84K 2011-03-01 12:05 hinv70PseudoGene.gz
-rw-r--r-- 1 syoung syoung  65K 2011-03-01 12:20 gwasCatalog.gz
-rw-r--r-- 1 syoung syoung  22K 2011-03-01 12:08 wgRna.gz
-rw-r--r-- 1 syoung syoung  11K 2011-03-01 12:03 tRNAs.gz
-rw-r--r-- 1 syoung syoung 9.2K 2011-03-01 11:44 cytoBandIdeo.gz
-rw-r--r-- 1 syoung syoung 9.1K 2011-03-01 11:46 cytoBand.gz
-rw-r--r-- 1 syoung syoung 7.4K 2011-03-01 13:28 gap.gz
-rw-r--r-- 1 syoung syoung 6.7K 2011-03-01 12:15 gc5Base.bed.gz
-rw-r--r-- 1 syoung syoung 6.6K 2011-03-01 12:12 gc5Base.max100K.bed.gz

SOME DESCRIPTIONS:

CCDS Exome
Chromosome Band
Alt Events
Assembly
Chromosome Band (Ideogram)
CpG Islands
DGV Struct Var
Exoniphy
Gap
Gencode Auto
Gencode PolyA
Gencode Pseudo
Geneid Genes
GWAS Catalog
H-Inv non-coding
H-Inv pseudo-genes
IKMC Genes Mapped
N-SCAN
OMIM Genes
RefSeq Genes
Segmental Dups
SGP Genes
tRNA Genes
UCSC Genes
Vega Pseudogenes


COPY FILES TO pegasus:

scp /data/jbrowse/ucsc/human/hg19/* syoung@pegasus.ccs.miami.edu:/nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/gtf


/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/human/hg19/gtf


2. GENERATE CHROMOSOME SIZES FILE

ON UBUNTU:

COPY HUMAN hg19 FASTA FILES
mkdir -p /data/sequence/human/hg19
scp -r syoung@pegasus.ccs.miami.edu:/nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta /data/sequence/human/hg19

CREATE CHROMOSOME SIZE FILE
/home/syoung/0.5/bin/apps/jbrowse/chromosomeSizes.pl \
--inputdir /data/sequence/human/hg19/fasta

COPY TO JBROWSE PROCESSING DIR
cp /data/sequence/human/hg19/fasta/chromosome-sizes.txt \
/data/jbrowse/ucsc/human/hg19

ON PEGASUS:

/nethome/syoung/0.5/bin/apps/jbrowse/chromosomeSizes.pl \
--inputdir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta

    chr2	254235636	502298998	248063362
    chr3	502298999	704281879	201982880
    ...
    chrX	2938654006	3097029979	158375973
    chrY	3097029980	3157591019	60561039

    /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chromosome-sizes.txt

MOVE TO HOME DIR
mv /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chromosome-sizes.txt \
/nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/chromosome-sizes.txt



3. GENERATE refSeqs.js FILE (USING CHROMOSOME SIZES FILE)


ON UBUNTU:

/home/syoung/0.5/bin/apps/jbrowse/jbrowseRefseq.pl \
--chromofile /data/sequence/human/hg19/fasta/chromosome-sizes.txt \
--outputdir /data/jbrowse/ucsc/human/hg19 \
--chunk 20000

    OK
cat /data/jbrowse/ucsc/human/hg19/refSeqs.js
    
    ...
    {
         "length" : "60561039",
         "name" : "chrY",
         "seqDir" : "data/seq/chrY",
         "start" : 0,
         "end" : "60561039",
         "seqChunkSize" : 20000
      }
   ]


ON PEGASUS:

/nethome/syoung/0.5/bin/apps/jbrowse/jbrowseRefseq.pl \
--chromofile /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/chromosome-sizes.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19 \
--chunk 20000

    /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/refSeqs.js

    OK!


4. UNZIP AND SPLIT GTF FILES BY CHROMOSOME COLUMN INTO PER-CHROMOSOME FILES

ON UBUNTU:

/home/syoung/0.5/bin/apps/utils/columnSplit.pl \
--inputdir /data/jbrowse/ucsc/human/hg19 \
--column 1 \
--suffix gtf
    Run time: 00:15:05
    Completed /home/syoung/0.5/bin/apps/utils/columnSplit.pl
    5:57PM, 1 March 2011
    ****************************************

ON PEGASUS:

/nethome/syoung/0.5/bin/apps/utils/columnSplit.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/gtf \
--column 1 \
--suffix gtf




5. CONVERT GTF TO GFF FILES

ON UBUNTU:

/home/syoung/0.5/bin/apps/jbrowse/gtfToGff.pl \
--refseqfile /data/jbrowse/ucsc/human/hg19/refSeqs.js \
--inputdir /data/jbrowse/ucsc/human/hg19/gtf/chr1 \
--outputdir /data/jbrowse/ucsc/human/hg19/gff/chr1

USE LOOP

/home/syoung/0.5/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop serial \
--executable /home/syoung/0.5/bin/apps/jbrowse/gtfToGff.pl \
--refseqfile /data/jbrowse/ucsc/human/hg19/refSeqs.js \
--inputdir /data/jbrowse/ucsc/human/hg19/gtf/chr%REPLICATE% \
--outputdir /data/jbrowse/ucsc/human/hg19/gff/chr%REPLICATE% \
&> /data/jbrowse/ucsc/human/hg19/gff/loop-gtftogff.out



6. GENERATE JBROWSE FEATURES

CREATE SAMTOOLS INDEX FILES:
/home/syoung/0.5/bin/apps/aligners/samindex.pl \
--inputdir /data/sequence/human/hg19/fasta/ \
--outputdir /data/sequence/human/hg19/samtools
    Run time: 00:00:36
    Completed /home/syoung/0.5/bin/apps/aligners/samindex.pl
    3:30AM, 2 March 2011
    ****************************************

SET OWNERSHIP AND PERMISSIONS IN /data
find /data -type d -exec chown syoung:www-data {} \;
find /data -type d -exec chmod 0775 {} \;
find /data -type f -exec chmod 0664 {} \;

GENERATE FEATURES:
/home/syoung/0.5/bin/apps/jbrowse/jbrowseFeatures.pl \
--refseqfile /data/jbrowse/ucsc/human/hg19/refSeqs.js \
--inputdir /data/jbrowse/ucsc/human/hg19/gff/chr1 \
--outputdir /data/jbrowse/ucsc/human/hg19/jbrowse/chr1 \
--filetype gff \
--species human \
--build hg19 \
--configfile /home/syoung




cd /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename allenbrain.gff \
--label allenbrain \
--key allenbrain \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename ccds.gff \
--label ccds \
--key ccds \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename microsatellite.gff \
--label microsatellite \
--key microsatellite \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename mrnas.gff \
--label mrnas \
--key mrnas \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename refseq.gff \
--label refseq \
--key refseq \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename rmsk.gff \
--label rmsk \
--key rmsk \
--queue large \
--cluster LSF
    
    Cluster::runJobs    Completed generateFeatures at 10-06-07 01:15:57, duration: 00:37:41
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
    JBrowse::generateFeatures    Completed
    jbrowseFeatures.pl    Run time: 00:37:46
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-06-07 01:16:02
    jbrowseFeatures.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename simplerepeat.gff \
--label simplerepeat \
--key simplerepeat \
--queue large \
--cluster LSF

    Cluster::runJobs    Completed generateFeatures at 10-06-07 09:23:52, duration: 00:03:03
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
    JBrowse::generateFeatures    Completed
    jbrowseFeatures.pl    Run time: 00:03:04
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-06-07 09:23:53
    jbrowseFeatures.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename snp128.gff \
--label snp128 \
--key snp128 \
--queue large \
--cluster LSF
    
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
    JBrowse::generateFeatures    Completed
    jbrowseFeatures.pl    Run time: 04:16:33
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-06-07 05:02:04
    jbrowseFeatures.pl    ****************************************



/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename transcriptome.gff \
--label transcriptome \
--key transcriptome \
--queue large \
--cluster LSF
    
    Cluster::runJobs    Completed generateFeatures at 10-06-07 09:27:49, duration: 00:07:53
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
    JBrowse::generateFeatures    Completed
    jbrowseFeatures.pl    Run time: 00:07:56
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-06-07 09:27:51
    jbrowseFeatures.pl    ****************************************



INSTALLED JBROWSE PERL DEPENDENCIES ON UBUNTU
---------------------------------------------

From CPAN:

BioPerl (version 1.6)
JSON (version 2)
JSON::XS (optional, for speed)
Heap::Simple
Heap::Simple::Perl
Heap::Simple::XS
PerlIO::gzip
Devel::Size


PerlIO::gzip FOR flatfile-to-json.pl
-----------------------------------

MISSING zlib.h FILE

install PerlIO::gzip

    gzip.xs:16: fatal error: zlib.h: No such file or directory


apt-get install zlib1g-dev


CPAN:
install PerlIO::gzip

    OK


ALSO INSTALLED Heap::Sort AND ?::Simple



UCSC via Perl software -- NOPE
------------------------------

Jennifer Jackson jen at soe.ucsc.edu 
Wed Oct 14 11:33:52 PDT 2009
Previous message: [Genome] Query UCSC via Perl software
Next message: [Genome] Re. Failing to perform batch downloads of chromosome segments using a script pipeline
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
Hello Danny,

Accessing the public mySQL database directly (no http queries) using perl with the DBI module is an option. There is no set of tools provided for this, but here is the access info:  http://genome.ucsc.edu/FAQ/FAQdownloads#download29

However, a better may be to work with the data in flat file format from the start. On our Downloads page, every mySQL table is represented in plain text format (same name as in DB, .txt.gz is the data, .sql is the schema). Use the Table browser to find out which tables/files are associated with which tracks and the common keys to join on ("view schema" button). On Downloads there is also data not contained in the database as a track (chromosome files, other specially formatted data). The best way to understand this is to navigate the web page and examine the REAME docs.

The Table browser could also be used to create your own flat files, but this usually not a good solution if the data is dense and genome-wide. Using the files on Downloads is both faster and would not require you to break up the data (there is a 100k line limit on Table browser output, we normally recommend breaking large data down by chromosome.

Here are some help pages about the Table browser and Downloads:
http://hgdownload.cse.ucsc.edu/downloads.html
http://genome.ucsc.edu/cgi-bin/hgTables
http://genome.ucsc.edu/FAQ/FAQdownloads#download32

Thanks,
Jennifer

------------------------------------------------ 
Jennifer Jackson 
UCSC Genome Bioinformatics Group


    
</entry>


<entry [Mon Feb 28 20:44:25 EST 2011] FIXED HISTOGRAM URL IN FeatureTrack.js>

LINE 28:

//    this.trackBaseUrl = (this.baseUrl + url).match(/^.+\//);
    this.trackBaseUrl = this.baseUrl;
  
    
</entry>

<entry [Sat Feb 26 01:31:29 EST 2011] DOWNLOADED JBROWSE 1.2 RELEASED FEB 11 2011 AND LATEST GITHUB 1.2.6>

NB: HAVE TO REGENERATE ALL JSON FILES from the original FASTA/GFF/BED/WIG files

flatfile-to-json, biodb-to-json, wig-to-json
   
 
JBROWSE LOCATIONS:

DATA
/data/jbrowse/species/human/hg19

APPLICATIONS
/data/apps/jbrowse/1.2


INSTALLATION ON UBUNTU
----------------------

1A. INSTALL graphviz ON UBUNTU
-----------------------------

apt-get install graphviz

    Setting up libgvpr1 (2.26.3-4) ...
    Setting up graphviz (2.26.3-4) ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place

    OK


2A. INSTALL PERL GRAPHVIZ MODULE ON UBUNTU
-----------------------------------------
CPAN:

install LBROCARD/GraphViz-2.04.tar.gz

    ...
    Appending installation info to /usr/local/lib/perl/5.10.1/perllocal.pod
      LBROCARD/GraphViz-2.04.tar.gz
      /usr/bin/make install  -- OK


NB: JSON::XS IS ALREADY INSTALLED:
CPAN>
install JSON::XS
    JSON::XS is up to date (2.3).


3A. INSTALL BioPerl ON UBUNTU
-----------------------------

CPAN:
install CJFIELDS/BioPerl-1.6.0.tar.gz

    ...
    Installing /usr/local/bin/bp_seqfeature_delete.pl
    Writing /usr/local/lib/perl/5.10.1/auto/Bio/.packlist
    Will try to install symlinks to /usr/local/bin
      CJFIELDS/BioPerl-1.6.0.tar.gz
      ./Build install  -- OK


4A. INSTALL jbrowse ON UBUNTU
-----------------------------

1. DOWNLOAD JBROWSE 1.2.6
http://localhost/jbrowse/1.2.6/docs/tutorial/#Download_install

STABLE RELEASE 1.2
http://jbrowse.org/releases/jbrowse-1.2.zip

DEVELOPMENT RELEASE 1.2.6 FROM GITHUB
http://github.com/jbrowse/jbrowse/tree/master







INSTALLATION ON CENTOS
----------------------


1B. INSTALL graphviz ON FEDORA
------------------------------

1. INSTALL graphviz

yum install graphviz

    Installed:
      graphviz.x86_64 0:2.26.3-1.el5                                                                      

2B. INSTALL PERL GRAPHVIZ MODULE ON FEDORA
-----------------------------------------
CPAN:

install LBROCARD/GraphViz-2.04.tar.gz

    ...
    Appending installation info to /usr/local/lib/perl/5.10.1/perllocal.pod
      LBROCARD/GraphViz-2.04.tar.gz
      /usr/bin/make install  -- OK


install JSON::XS


3B. INSTALL BioPerl ON FEDORA
-----------------------------

CPAN:

force install CJFIELDS/BioPerl-1.6.0.tar.gz

    ...    
    Installing /usr/bin/bp_meta_gff.pl
    Installing /usr/bin/bp_load_gff.pl
    Installing /usr/bin/bp_split_seq.pl
    Writing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/.packlist
    Will try to install symlinks to /usr/bin
      CJFIELDS/BioPerl-1.6.0.tar.gz
      ./Build install  -- OK
    Failed during this command:
     CJFIELDS/BioPerl-1.6.0.tar.gz                : make_test FAILED but failure ignored because 'force' in effect


    OK


4B. INSTALL jbrowse ON FEDORA
-----------------------------

1. DOWNLOAD JBROWSE 1.2.6
http://localhost/jbrowse/1.2.6/docs/tutorial/#Download_install

STABLE RELEASE 1.2
http://jbrowse.org/releases/jbrowse-1.2.zip

DEVELOPMENT RELEASE 1.2.6 FROM GITHUB
http://github.com/jbrowse/jbrowse/tree/master









INSTALL RPM-PYTHON FOR smart TO WORK
-------------------------------------
http://www.python.org/pyvault/SRPMS/repodata/repoview/rpm-python-0-4.4.2.4-1.html

The rpm-python package contains a module that permits applications written in the Python programming language to use the interface supplied by the RPM Package Manager libraries. This package should be installed if you want to develop Python programs that will manipulate RPM packages and databases.

CHECK EXISTING RPMS TO SEE IF rpm-python AND rpm-python-devel ARE INSTALLED:

rpm -qa | grep python

    python-2.4.3-27.el5
    libxml2-python-2.6.26-2.1.2.8
    audit-libs-python-1.7.17-3.el5
    gamin-python-0.1.7-8.el5
    python-elementtree-1.2.6-5
    python-urlgrabber-3.1.0-5.el5
    dbus-python-0.70-9.el5_4
    rpm-python-4.4.2.3-18.el5
    rrdtool-python-1.2.27-4
    python-sqlite-1.1.7-1.2.1
    python-devel-2.4.3-27.el5
    python-iniparse-0.2.3-4.el5
    python-devel-2.4.3-27.el5
    libselinux-python-1.33.4-5.5.el5


SO NEED TO DOWNLOAD rpm-python-4.4.2.3-18.el5


DOWNLOAD RPM-PYTHON RPMS:

http://www.python.org/download/releases/2.4/rpms/
http://www.python.org/pyvault/SRPMS/
http://www.graphviz.org/Download_linux_rhel.php   -- GOOD

RPM-PYTHON IS AVAILABLE HERE:
wget http://www.python.org/pyvault/SRPMS/rpm-python-4.4.2.4-1.src.rpm


BUT NOT RPM-DEVEL, WHICH IS AVAILABLE HERE BUT WRONG VERSION?

http://www.rpmfind.net/linux/rpm2html/search.php?query=rpm-devel


mkdir /data/apps/smart/dependencies/rpm-python
cd /data/apps/smart/dependencies/rpm-python



THIS POST SUGGESTS THE VERSIONS ARE OUT OF SYNC:
Your rpm and rpm-python versions have gotten out of sync. This can happen if you've built your own rpm but not the Python bindings, or vice versa. Run rpm -q rpm rpm-python and compare the returned versions, and then rpm -V rpm rpm-python to verify the integrity of the packages' files.


rpm -q rpm rpm-python

    rpm-4.4.2.3-18.el5
    rpm-python-4.4.2.3-18.el5

rpm -V rpm rpm-python
    
    ___NONE___




    SO TRIED DOWNLOADING THE FILES AND REINSTALLING/UPDATING WITH THE -U FLAG:

rpm -Uvh --force ftp://ftp.muug.mb.ca/mirror/centos/5.5/os/x86_64/CentOS/rpm-python-4.4.2.3-18.el5.x86_64.rpm

rpm-python-4.4.2.3-18.el5.x86_64.rpm

cd /data/apps/smart/dependencies/rpm-python
wget ftp://ftp.muug.mb.ca/mirror/centos/5.5/os/x86_64/CentOS/rpm-python-4.4.2.3-18.el5.x86_64.rpm

rpm -Uvh rpm-python-4.4.2.3-18.el5.x86_64.rpm

    ___HANGS___


AND DOWNLOADED THE DEVEL PACKAGE:
http://zid-lux1.uibk.ac.at/linux/rpm2html/centos/5/os/x86_64/CentOS/rpm-devel-4.4.2.3-18.el5.x86_64.html
This package contains the RPM C library and header files. These
development files will simplify the process of writing programs that
manipulate RPM packages and databases. These files are intended to
simplify the process of creating graphical package managers or any
other tools that need an intimate knowledge of RPM packages in order
to function.

This package should be installed if you want to develop programs that
will manipulate RPM packages and databases.


cd /data/apps/smart/dependencies/rpm-python
wget ftp://zid-lux1.uibk.ac.at/pub/dist/centos/5/os/x86_64/CentOS/rpm-devel-4.4.2.3-18.el5.x86_64.rpm


AND TRIED INSTALLING AT THE SAME TIME:

cd /data/apps/smart/dependencies/rpm-python
rpm -Uvh rpm-python-4.4.2.3-18.el5.x86_64.rpm rpm-devel-4.4.2.3-18.el5.x86_64.rpm

BUT IT GAVE UNSATISFIED DEPENDENCIES:



AND WAS STILL HANGING SO DID A REBOOT



THEN DOWNLOADED THE BUILD PACKAGE:

cd /data/apps/smart/dependencies/rpm-python
wget ftp://ftp.muug.mb.ca/mirror/centos/5.5/os/x86_64/CentOS/rpm-build-4.4.2.3-18.el5.x86_64.rpm

AND TRIED INSTALLING AT THE SAME TIME:

cd /data/apps/smart/dependencies/rpm-python
rpm -Uvh rpm-python-4.4.2.3-18.el5.x86_64.rpm rpm-devel-4.4.2.3-18.el5.x86_64.rpm rpm-build-4.4.2.3-18.el5.x86_64.rpm


error: Failed dependencies:

	elfutils-libelf-devel is needed by rpm-devel-4.4.2.3-18.el5.x86_64
	nss-devel is needed by rpm-devel-4.4.2.3-18.el5.x86_64
	sqlite-devel is needed by rpm-devel-4.4.2.3-18.el5.x86_64


SO TRIED AGAIN TO INSTALL WITH YUM AND IT WORKED:

yum install graphviz

Installed:
  graphviz.x86_64 0:2.26.3-1.el5                                                                      
    ...
    Dependency Installed:
      audiofile.x86_64 1:0.2.6-5                       avahi-glib.x86_64 0:0.6.16-9.el5_5                 
      esound.x86_64 1:0.2.36-3                         freeglut.x86_64 0:2.4.0-7.1.el5                    
      gnome-keyring.x86_64 0:0.6.0-1.fc6               gnome-mime-data.x86_64 0:2.4.2-3.1                 
      gnome-mount.x86_64 0:0.5-3.el5                   gnome-vfs2.x86_64 0:2.16.2-6.el5_5.1               
      gtkglext-libs.x86_64 0:1.2.0-6.el5               gts.x86_64 0:0.7.6-11.el5                          
      libXaw.x86_64 0:1.0.2-8.1                        libbonobo.x86_64 0:2.16.0-1.1.el5_5.1              
      libbonoboui.x86_64 0:2.16.0-1.fc6                libcroco.x86_64 0:0.6.1-2.1                        
      libglade2.x86_64 0:2.6.0-2                       libgnome.x86_64 0:2.16.0-6.el5                     
      libgnomecanvas.x86_64 0:2.14.0-4.1               libgnomeui.x86_64 0:2.16.0-5.el5                   
      libgsf.x86_64 0:1.14.1-6.1                       librsvg2.x86_64 0:2.16.1-1.el5                     
      libxslt.x86_64 0:1.1.17-2.el5_2.2                mesa-libGLU.x86_64 0:6.5.1-7.8.el5                 
      netpbm.x86_64 0:10.35.58-8.el5                   shared-mime-info.x86_64 0:0.19-5.el5               
      urw-fonts.noarch 0:2.3-6.1.1                    
    
    Complete!




link|edit|flag
answered Jun 9 '10 at 1:38
Ignacio Vazquez-Abrams
14.7k1615
The first shows: rpm-4.4.2-48.el5 rpm-python-4.4.2.3-18.el5 and the second: .M.....T c /etc/cron.daily/rpm Unsatisfied dependencies for rpm-python-4.4.2.3-18.el5.i386: popt = 1.10.2.3-18.el5, rpm = 4.4.2.3-18.el5, rpm-libs = 4.4.2.3-18.el5 ? mike Jun 10 '10 at 0:54
1	  
And there you have it. Your system is half-updated from an older version. Download and run rpm -Uvh against all of these at once: mirror.centos.org/centos/5/os/i386/CentOS/? mirror.centos.org/centos/5/os/i386/CentOS/? mirror.centos.org/centos/5/os/i386/CentOS/? ? Ignacio Vazquez-Abrams Jun 10 '10 at 2:01
when trying to install those packages, I get: rpm = 4.4.2-48.el5 is needed by (installed) rpm-build-4.4.2-48.el5.i386 rpm = 4.4.2-48.el5 is needed by (installed) rpm-devel-4.4.2-48.el5.i386 - So i try installing them and I get another list of dependencies. Can I just downgrade something? ? mike Jun 11 '10 at 0:06
If you can force those three packages in then you can use yum to update all the others. Since forcing a package is a bad thing to do in the general case, you'll need to refer to the man page on how to do it. ? Ignacio Vazquez-Abrams Jun 11 '10 at 0:18
Thank you very much! That second comment (upgrading packages) did it for me and saved a bunch of time searching. ? Benjamin Manns Jul 1 '10 at 13:39


TRIED TO INSTALL RPM BUT IT'S LOOKING FOR USER jeff:

rpm -i rpm-python-4.4.2.4-1.src.rpm

    warning: rpm-python-4.4.2.4-1.src.rpm: Header V3 DSA signature: NOKEY, key ID 4ad653e1


rpm -q rpm-python

    rpm-python-4.4.2.3-18.el5





USE SMART TO WORK AROUND YUM MEMORY HANG

1. ADD repositories for fedora core 4 to the smart

DOWNLOAD THIS:
http://www.graphviz.org/graphviz-rhel.repo

TO HERE:
/etc/yum.repos.d/


2. copy all the packages downloaded by yum to one directory
3. open this direcotry
4. run the smart with:
 
smart install ./*.rpm





rpm-python-devel


NOTES
-----


Quantitative tracks

If you want to browse quantitative ("wiggle") tracks in JBrowse, you need to do a bit more work.

Prerequisites:

    * libpng

Compile the wiggle-processing program by running configure and then make in the JBrowse root directory

$ ./configure
$ make

System-specific:

    * Apple OS X:

      You need libpng and a C++ compiler; you can get these from MacPorts or Fink.

      Once you have those installed, you need to compile the JBrowse wiggle-processing program. JBrowse includes a makefile to do this, but you may need to add the paths for libpng and png.h to your compiler's library and include paths. For example, if libpng is in /usr/X11, you can run configure like this:

      $ ./configure CXXFLAGS=-I/usr/X11/include LDFLAGS=-L/usr/X11/lib

      Depending on which OS X you have (and whether you're using MacPorts/fink/etc.), libpng might be somewhere other than /usr/X11, like /opt/local for example. To find where libpng is, try locate libpng

    * Red Hat/CentOS/Fedora:
      install the libpng and libpng-devel packages. (The rest should just work)

    * Ubuntu:
      install the libpng12 and libpng12-dev packages. (The rest should just work) 

Once wig2png is compiled, you run it via a wrapper script:

$ bin/wig-to-json.pl --wig docs/tutorial/data_files/volvox_microarray.wig



NOT ENOUGH MEMORY ON micro INSTANCE
----------------------------------

INSTALL GRAPHVIZ
ftp://ftp.uni-hannover.de/pub/mirror/bsd/NetBSD/packages/distfiles/GraphViz-2.04.tar.gz

INSTALL THE EASY WAY
http://www.graphviz.org/Download_linux_rhel.php

DOWNLOAD THIS:
http://www.graphviz.org/graphviz-rhel.repo

TO HERE:
/etc/yum.repos.d/

THEN AS ROOT:

yum list available 'graphviz*'
yum install 'graphviz*'

    ...
    --> Finished Dependency Resolution
    graphviz-php-2.16-1.el5.x86_64 from graphviz-stable has depsolving problems
      --> Missing Dependency: graphviz = 2.16-1.el5 is needed by package graphviz-php-2.16-1.el5.x86_64 (graphviz-stable)
    graphviz-php-2.16-1.el5.x86_64 from graphviz-stable has depsolving problems
      --> Missing Dependency: libgvc.so.4()(64bit) is needed by package graphviz-php-2.16-1.el5.x86_64 (graphviz-stable)
    Error: Missing Dependency: libgvc.so.4()(64bit) is needed by package graphviz-php-2.16-1.el5.x86_64 (graphviz-stable)
    Error: Missing Dependency: graphviz = 2.16-1.el5 is needed by package graphviz-php-2.16-1.el5.x86_64 (graphviz-stable)

 You could try using --skip-broken to work around the problem
 You could try running: package-cleanup --problems
                        package-cleanup --dupes
                        rpm -Va --nofiles --nodigest

SO RAN WITH --skip-broken


yum install 'graphviz*' --skip-broken 


TO AVOID THIS ERROR:

root@hplaptop:/data/apps/jbrowse/dependencies/GraphViz-2.04# perl Makefile.PL
Scalar value @ENV{PATH} better written as $ENV{PATH} at Makefile.PL line 37.
Scalar value @ENV{PATH} better written as $ENV{PATH} at Makefile.PL line 40.
Looking for dot... didn't find it
****************************************************************
GraphViz.pm has not been able to find the graphviz program 'dot'
GraphViz.pm needs graphviz to function
Please install graphviz first: http://www.graphviz.org/


BUT HANGS USING ALL MEMORY:

    ...
    Total                                                                 8.7 MB/s |  59 MB     00:06     
    Running rpm_check_debug
    Running Transaction Tes
    
    top - 02:56:37 up 54 days, 22:06,  2 users,  load average: 0.00, 0.00, 0.00
    Tasks: 176 total,   1 running, 172 sleeping,   3 stopped,   0 zombie
    Cpu(s):  0.0%us,  0.0%sy,  0.0%ni, 99.2%id,  0.8%wa,  0.0%hi,  0.0%si,  0.0%st
    Mem:    637480k total,   630680k used,     6800k free,    20612k buffers
    Swap:  1048568k total,    36004k used,  1012564k free,   392684k cached



SO INSTALLED SMART:

http://labix.org/smart
smart can manage the rest of work, if you can install the smart and add
the repositories for fedora core 4 to the smart, then copy all the packages
downloaded by yum to one directory, open this direcotry and run the smart with:

smart install ./*.rpm

wget http://launchpad.net/smart/trunk/1.3.1/+download/smart-1.3.1.tar.bz2
cd /data/apps/smart/1.3.1
python setup.py install
    OK


TRIED STRAIGHT install COMMAND:

smart install graphviz

    error: 'rpm' python module is not available


BUT rpm SEEMS TO BE INSTALLED:

rpm -q python-elementtree python-sqlite rpm-python urlgrabber yum-metadata-parser

    python-elementtree-1.2.6-5
    python-sqlite-1.1.7-1.2.1
    rpm-python-4.4.2.3-18.el5
    package urlgrabber is not installed
    yum-metadata-parser-1.1.2-3.el5.centos


rpm -U --nodeps --force rpm-devel-4.4.2-46.fc7.x86_64.rpm rpm-python-4.4.2-46.fc7.x86_64.rpm rpm-build-4.4.2-46.fc7.x86_64.rpm


TRIED TO INSTALL rpm-python WITH YUM BUT HITS MEMORY LIMIT AGAIN:

yum search rpm-python
-- if it finds it then --
yum install rpm-python rpm-python-devel
    
    Running Transaction Test
    
http://www.cyberciti.biz/faq/yum-downloadonly-plugin/
DOWNLOADED RPMS USING YUM

mkdir -p /data/apps/smart/1.3.1/dependencies/rpm-python

yum install rpm-python rpm-python-devel \
--downloadonly \
--downloaddir=/data/apps/smart/1.3.1/dependencies/rpm-python


How do I install yum-downloadonly plugin?

Type the following command to install plugin, enter:
# yum install yum-downloadonly


LOOKED FOR DOWNLOADED RPMS:

Downloading Packages:
rpm-python-4.4.2.3-20.el5_5.1.x86_64.rpm
popt-1.10.2.3-20.el5_5.1.x86_64.rpm
rpm-build-4.4.2.3-20.el5_5.1.x86_64.rpm
rpm-libs-4.4.2.3-20.el5_5.1.x86_64.rpm
rpm-4.4.2.3-20.el5_5.1.x86_64.rpm



1. ADD repositories for fedora core 4 to the smart
2. copy all the packages downloaded by yum to one directory
3. open this direcotry
4. run the smart with:
 
smart install ./*.rpm



rpm -qR yum
/usr/bin/python  
config(yum) = 3.2.22-20.el5.centos
python >= 2.4
python(abi) = 2.4
python-elementtree  
python-iniparse  
python-sqlite  
rpm >= 0:4.4.2
rpm-python  
rpmlib(CompressedFileNames) <= 3.0.4-1
rpmlib(PayloadFilesHavePrefix) <= 4.0-1
rpmlib(VersionedDependencies) <= 3.0.3-1
urlgrabber >= 3.1.0
yum-fastestmirror  
yum-metadata-parser >= 1.1.0



INSTALL LBROCARD/GraphViz-2.04.tar.gz DEPENDENCY MANUALLY

DOWNLOADED TO:
/data/apps/jbrowse/dependencies


perl -MCPAN -e shell
install CJFIELDS/BioPerl-1.6.0.tar.gz

    Failed during this command:
     LBROCARD/GraphViz-2.04.tar.gz                : writemakefile NO '/usr/bin/perl Makefile.PL INSTALLDIRS=site' returned status 512
     PERIGRIN/XML-SAX-Writer-0.53.tar.gz          : make_test NO
     TJMATHER/XML-DOM-1.44.tar.gz                 : make_test NO
     MIROD/XML-DOM-XPath-0.14.tar.gz              : make_test NO
     CJFIELDS/BioPerl-1.6.0.tar.gz                : make_test NO 3 dependencies missing (GraphViz,XML::SAX::Writer,XML::DOM::XPath)




JBROWSE 1.1 RELEASE NOTES
-------------------------


JBrowse 1.1 release
Posted on September 9, 2010 by jbrowse

JBrowse version 1.1 is released! You can find the code here:
http://jbrowse.org/releases/jbrowse-1.1.zip

Release notes and screenshots below the fold.

JBrowse release notes, version 1.1, September 2010.

These notes document JBrowse developments in the period from July 2009 (online publication of the first JBrowse paper in Genome Research, the de facto ?version 1.0?) up to September 2010 (the first in a planned series of quarterly releases).

New features in this release:

    * Scalability. JBrowse can now handle very large data tracks, including human EST/SNP tracks, or tracks of next-gen sequence reads. Large datasets are broken into smaller chunks, so there is no loading delay for big tracks.
    * Extensibility. A Perl module (ImageTrackRenderer.pm) for creating user-drawn image tracks is now available, based on the CPAN GD.pm module. An example program is provided, draw-basepair-track.pl, that uses this module to draw arcs over a sequence representing the base-pairing interactions of RNA secondary structure.
    * Bug fixes. Numerous display glitches have been fixed, including issues with wide-screen monitors and long mostly-offscreen features.

Known issues/limitations with this release:

    * No JSON-level backward compatibility. If you are upgrading from an older version of JBrowse, you will have to regenerate all the JSON files on your server. This means wiping your jbrowse/data directory and re-running all server scripts (flatfile-to-json, biodb-to-json, wig-to-json, etc.) to regenerate your data from the original FASTA/GFF/BED/WIG files.
    * Next-gen sequence display is currently restricted to the co-ordinates of the outermost region to which a single read is mapped. There is no support (yet) for displaying pairing between reads, sequences of reads, alignment of read to reference sequence (e.g. splicing), or mismatches between read and reference.
    * Processing SAM/BAM next-gen sequence files takes a lot of memory (about 500 megabytes per million features).
    * Numerical (as opposed to comparative) readout of the data in Wiggle tracks, e.g. via a y-axis label or mouseover popup, is still unsupported.



JBROWSE 1.2 RELEASE NOTES
-------------------------

Release Notes:

version 1.2, Febrary 2011

These notes document changes since release 1.1 in September 2010.
(Release Notes for 1.1 are here.)

Most of the work in this release went into making JBrowse handle large
amounts of feature data better.  Before, the amount of memory used
when processing BAM files was more than 10 times the size of the file;
now, the amount of memory required is fixed.

Other new features in this release:

    * Import of UCSC database dumps. A ucsc-to-json.pl script is now provided for taking database dumps from UCSC and creating a JBrowse instance using them.  The ?genePred? and ?bed? track types are currently supported; ?psl? tracks are not yet supported.
    * Touch. Juan Aguilar?s code for using JBrowse on an iOS device (iPhone, iPod touch, iPad) is now integrated.  As of the current release, users wanting to use JBrowse on those devices have to navigate to a separate HTML page (touch.html) rather than the default index.html; i.e. the code does not currently detect touchscreen devices automatically.
    * Bug fixes. A number of bugs have also been fixed, including one that restricted the placement of the ?data? directory, and a bug in wiggle rendering that caused spurious peaks or troughs at tile boundaries.

Known issues/limitations with this release:

    * Some additional CPAN modules are now required:

PerlIO::gzip
Heap::Simple
Devel::Size

    * No JSON-level backward compatibility. If you are upgrading from an older version of JBrowse, you will have to regenerate all the JSON files on your server. This means wiping your jbrowse/data directory and re-running all server scripts (flatfile-to-json, biodb-to-json, wig-to-json, etc.) to regenerate your data from the original FASTA/GFF/BED/WIG files. We apologize for the inconvenience of this, but it is inevitable sometimes; we do aim to minimize the number of releases which are backwardly-incompatible in this way.

    
</entry>


<entry [Sat Feb 26 01:30:29 EST 2011] DOWNLOADED MINI HUMAN DATA>


NOT SURE IF ITS COMPATIVLE WITH VERSION 1.2 (SEE ABOVE)

DOWNLOADED MINI HUMAN DATA
http://jbrowse.org/releases/data/ucsc/hg19mini-2.tar.gz

EXAMPLE OF chr1
/data/jbrowse/human/hg19/hg19mini-2/data/tracks/chr1# du -hs *

    1.3M	ccdsGene
    540K	cpgIslandExt
    24K	cytoBand
    24K	cytoBandIdeo
    2.0M	dgv
    4.8M	exoniphy
    12K	gap
    1.3M	geneid
    1.9M	genomicSuperDups
    172K	gold
    192K	gwasCatalog
    1.2M	hgIkmc
    344K	hinv70NonCoding
    60K	hinv70PseudoGene
    1.8M	knownAlt
    3.0M	knownGene
    4.4M	nscanGene
    268K	omimGene
    2.0M	refGene
    1.4M	sgpGene
    72K	tRNAs
    5.8M	vegaGene
    412K	vegaPseudoGene
    272K	wgEncodeGencode2wayConsPseudoV4
    2.1M	wgEncodeGencodeAutoV4
    828K	wgEncodeGencodePolyaV4

cd cytoBand
root@hplaptop:/data/jbrowse/human/hg19/hg19mini-2/data/tracks/chr1/cytoBand# ll
total 28K
drwxrwxr-x  2 500 500 4.0K 2010-11-24 01:28 .
drwxrwxr-x 28 500 500 4.0K 2010-11-05 17:50 ..
-rw-rw-r--  1 500 500  501 2010-10-10 00:36 hist-1000000-0.json
-rw-rw-r--  1 500 500 4.3K 2010-11-24 01:28 names.json
-rw-rw-r--  1 500 500 3.4K 2010-10-10 00:36 names.json.old
-rw-rw-r--  1 500 500 3.2K 2010-10-10 00:36 trackData.json

  
    
</entry>

<entry [Thurs Jun 17 01:45:02 EDT 2010] SAMPLE jbrowseFeatures.pl RUN>



command: /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chr17/miRNA.gff --tracklabel miRNA --key miRNA
JBrowse::runFlatfileToJson    reference chr18
JBrowse::runFlatfileToJson    inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chr18/miRNA.gff
command: /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chr18/miRNA.gff --tracklabel miRNA --key miRNA
JBrowse::runFlatfileToJson    reference chr19
JBrowse::runFlatfileToJson    inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chr19/miRNA.gff
command: /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chr19/miRNA.gff --tracklabel miRNA --key miRNA
JBrowse::runFlatfileToJson    reference chr20
JBrowse::runFlatfileToJson    inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chr20/miRNA.gff
command: /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chr20/miRNA.gff --tracklabel miRNA --key miRNA
JBrowse::runFlatfileToJson    reference chrM
JBrowse::runFlatfileToJson    inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chrM/miRNA.gff
command: /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chrM/miRNA.gff --tracklabel miRNA --key miRNA
JBrowse::runFlatfileToJson    reference chrX
JBrowse::runFlatfileToJson    inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chrX/miRNA.gff
command: /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --gff /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff/chrX/miRNA.gff --tracklabel miRNA --key miRNA
JBrowse::runFlatfileToJson    No. jobs: 22
JBrowse::runFlatfileToJson    Running pileupToSnp
Cluster::runJobs    Running 22 jobs
Job <682572> is submitted to queue <large>.
Job <682573> is submitted to queue <large>.
Job <682574> is submitted to queue <large>.
Job <682575> is submitted to queue <large>.
Job <682576> is submitted to queue <large>.
Job <682577> is submitted to queue <large>.
Job <682578> is submitted to queue <large>.
Job <682579> is submitted to queue <large>.
Job <682580> is submitted to queue <large>.
Job <682581> is submitted to queue <large>.
Job <682582> is submitted to queue <large>.
Job <682583> is submitted to queue <large>.
Job <682584> is submitted to queue <large>.
Job <682585> is submitted to queue <large>.
Job <682586> is submitted to queue <large>.
Job <682587> is submitted to queue <large>.
Job <682588> is submitted to queue <large>.
Job <682589> is submitted to queue <large>.
Job <682590> is submitted to queue <large>.
Job <682591> is submitted to queue <large>.
Job <682592> is submitted to queue <large>.
Job <682593> is submitted to queue <large>.
Cluster::runJobs    Completed generateFeatures at 10-06-07 00:03:47, duration: 00:00:34
Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
JBrowse::generateFeatures    Completed
jbrowseFeatures.pl    Run time: 00:00:34
jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
jbrowseFeatures.pl    10-06-07 00:03:47
jbrowseFeatures.pl    ****************************************




1. LOAD STATIC TRACKS FOR HUMAN HG19 DATA:

plugins.view.jbrowse.species.human.hg19.data.trackInfo

    trackInfo = 
    [
        {
            "url" : "data/tracks/{refseq}/PolyA/trackData.json",
            "label" : "PolyA",
            "type" : "FeatureTrack",
            "key" : "PolyA"
        },




2. LOAD DYNAMIC TRACKS GENERATED BY USER:




3. COPY FILES TO 


**** LATER: DYNAMICALLY CHANGE URL INFO IN trackInfo.js FILE

/data/aqwa/0.4/bin/apps/trackInfo.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/trackInfo.js \
--path "plugins/view/jbrowse"

TO CHANGE THIS

      "url" : "data/seq/{refseq}/",

TO THIS

      "url" : "plugins/view/jbrowse/data/seq/{refseq}/",

WITH THIS FILE FORMAT

trackInfo = 
[
   {
      "url" : "data/seq/{refseq}/",
      "args" : {
         "chunkSize" : 20000
      },
      "label" : "DNA",
      "type" : "SequenceTrack",
      "key" : "DNA"
   },

 
SO THAT LOADED URLS WILL CHANGE FROM

http://localhost/aqwa/0.4/data/tracks/chr1/exon/trackData.json

TO

http://localhost/aqwa/0.4/plugins/view/jbrowse/data/tracks/chr1/exon/trackData.json




</entry>

<entry [Wed Jun 16 01:45:02 EDT 2010] GENERATE names/root.json FILE WITH jbrowseNames.pl>



/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseNames.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/refSeqs.js \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/reference \
--queue psmall \
--cluster PBS


HAVE TO USE THIS:

/nethome/syoung/base/apps/jbrowse/100511




</entry>

<entry [Sun Jun  6 23:35:17 EDT 2010] DO MOUSE FEATURES>

1. DOWNLOAD GTF FILES FROM http://genome.ucsc.edu/cgi-bin/hgTables AND UNZIP TO

/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gtf

2. GENERATE CHROMOSOME SIZES FILE

chmod 755 /nethome/bioinfo/apps/agua/0.5/bin/apps/chromosomeSizes.pl

/nethome/bioinfo/apps/agua/0.5/bin/apps/chromosomeSizes.pl \
--inputdir /nethome/bioinfo/data/sequence/chromosomes/mouse/mm9/fasta

    OK!

cat /nethome/bioinfo/data/sequence/chromosomes/mouse/mm9/fasta/chromosome-sizes.txt

chr1    0       201139342       201139342
chr2    201139343       386522393       185383050
chr3    386522394       549314174       162791780
chr4    549314175       708056899       158742724
chr5    708056900       863644906       155588006
chr6    863644907       1016152286      152507379
chr7    1016152287      1171727333      155575046
chr8    1171727334      1306100984      134373650
chr9    1306100985      1432658682      126557697
chr10   1432658683      1565251805      132593122
chr11   1565251806      1689532541      124280735
chr12   1689532542      1813215224      123682682
chr13   1813215225      1935905225      122690000
chr14   1935905226      2063603989      127698763
chr15   2063603990      2169168865      105564875
chr16   2169168866      2269454400      100285534
chr17   2269454401      2366632507      97178106
chr18   2366632508      2459219981      92587473
chr19   2459219982      2521789262      62569280
chrM    2521789263      2521805889      16626
chrX    2521805890      2691789193      169983303
chrY    2691789194      2708009802      16220608



3. GENERATE refSeqs.js FILE (USING CHROMOSOME SIZES FILE)

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseRefseq.pl \
--chromofile /nethome/bioinfo/data/sequence/chromosomes/mouse/mm9/fasta/chromosome-sizes.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9 \
--chunk 20000

    /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js

    OK!



4. UNZIP AND SPLIT GTF FILES BY CHROMOSOME COLUMN INTO PER-CHROMOSOME FILES

mm9-allenbrain
mm9-microsatellite
mm9-refseq
mm9-simplerepeat
mm9-transcriptome
mm9-ccds
mm9-mrnas
mm9-rmsk
mm9-snp128


/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnSplit.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gtf/mm9-allenbrain \
--column 1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gtf \
--outputfile allenbrain.gtf



    OK!



5. CONVERT GTF TO GFF FILES


allenbrain.gtf
ccds.gtf
microsatellite.gtf
mrnas.gtf
refseq.gtf
rmsk.gtf
simplerepeat.gtf
snp128.gtf
transcriptome.gtf


/nethome/bioinfo/apps/agua/0.5/bin/apps/gtfToGff.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gtf \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--feature allenbrain \
--inputfile allenbrain.gtf


6. GENERATE JBROWSE FEATURES


cd /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename allenbrain.gff \
--label allenbrain \
--key allenbrain \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename ccds.gff \
--label ccds \
--key ccds \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename microsatellite.gff \
--label microsatellite \
--key microsatellite \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename mrnas.gff \
--label mrnas \
--key mrnas \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename refseq.gff \
--label refseq \
--key refseq \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename rmsk.gff \
--label rmsk \
--key rmsk \
--queue large \
--cluster LSF
    
    Cluster::runJobs    Completed generateFeatures at 10-06-07 01:15:57, duration: 00:37:41
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
    JBrowse::generateFeatures    Completed
    jbrowseFeatures.pl    Run time: 00:37:46
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-06-07 01:16:02
    jbrowseFeatures.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename simplerepeat.gff \
--label simplerepeat \
--key simplerepeat \
--queue large \
--cluster LSF

    Cluster::runJobs    Completed generateFeatures at 10-06-07 09:23:52, duration: 00:03:03
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
    JBrowse::generateFeatures    Completed
    jbrowseFeatures.pl    Run time: 00:03:04
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-06-07 09:23:53
    jbrowseFeatures.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename snp128.gff \
--label snp128 \
--key snp128 \
--queue large \
--cluster LSF
    
    Job <682977> is submitted to queue <large>.
    Cluster::runJobs    Completed generateFeatures at 10-06-07 05:01:44, duration: 04:16:13
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
    JBrowse::generateFeatures    Completed
    jbrowseFeatures.pl    Run time: 04:16:33
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-06-07 05:02:04
    jbrowseFeatures.pl    ****************************************



/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename transcriptome.gff \
--label transcriptome \
--key transcriptome \
--queue large \
--cluster LSF
    
    Cluster::runJobs    Completed generateFeatures at 10-06-07 09:27:49, duration: 00:07:53
    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
    JBrowse::generateFeatures    Completed
    jbrowseFeatures.pl    Run time: 00:07:56
    jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
    jbrowseFeatures.pl    10-06-07 09:27:51
    jbrowseFeatures.pl    ****************************************



</entry>

<entry [Sun Jun  6 02:10:59 EDT 2010] bioinfo GROUP QUOTA MAXED OUT ON KRONOS /nethome>


/usr/lpp/mmfs/bin/mmlsquota -g bioinfo

Disk quotas for group bioinfo (gid 1072):
                         Block Limits                                    |     File Limits
Filesystem type             KB      quota      limit   in_doubt    grace |    files   quota    limit in_doubt    grace  Remarks
homelv     GRP      3037467456 3100639232 3208642560  155284000     none |  1927934       0        0       78     none




</entry>

<entry [Fri Jun  4 03:27:44 EDT 2010] DOWNLOADED RAT GTF FILES FROM UCSC AND GENERATED FEATURES>


1. DOWNLOAD GTF FILES MANUALLY FROM UCSC
http://genome.ucsc.edu/cgi-bin/hgTables

TO HERE:

/nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf


GTF 

    rn4-CpG.gz
    rn4-miRNA.gz
    rn4-refGene.gz
    rn4-rgdQtl.gz
    rn4-snp125.gz
    rn4-tRNAs.gz


OTHER


    rn4-microsat.gz
    rn4-simpleRepeat.gz
    rn4-rmsk.gz
    rn4-phastCons9way.gz
    rn4-conserved.gz
    rn4-gc5Base-bed.gz
    rn4-gc5Base.gz




2. COPY RAT REFERENCE TO t/Cluster DIR FOR TESTING

cp /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/fasta/chr20.fa /nethome/bioinfo/apps/agua/0.5/bin/apps/t/Cluster/reference/rat/rn4/fasta



3. GENERATE RAT CHROMOSOME SUBDIRS

CREATE MAQ BINARIES AND SUBDIRS

/nethome/bioinfo/apps/agua/0.5/bin/apps/maqIndex.pl \
--inputdir /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/fasta \
--outputdir /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/maq

/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/bfaSubdirs.sh /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/maq "\.bfa"

    OK!

CREATE BOWTIE BINARIES AND SUBDIRS

cp -r /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/fasta /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/bowtie

/nethome/bioinfo/apps/agua/0.5/bin/apps/bowtieIndex.pl \
--inputdir /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/bowtie

/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/bfaSubdirs.sh /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/bowtie "\.bfa"



4. GENERATE CHROMOSOME SIZES

chmod 755 /nethome/bioinfo/apps/agua/0.5/bin/apps/chromosomeSizes.pl

/nethome/bioinfo/apps/agua/0.5/bin/apps/chromosomeSizes.pl \
--inputdir /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/fasta

    OK!

cat /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/fasta/chromosome-sizes.txt

    chr1    0       273269105       273269105
    chr2    273269106       536640798       263371692
    chr3    536640799       711125402       174484603
    chr4    711125403       901993930       190868527
    chr5    901993931       1078552066      176558135
    chr6    1078552067      1229141420      150589353
    chr7    1229141421      1375004257      145862836
    chr8    1375004258      1506626905      131622647
    chr9    1506626906      1622336180      115709274
    chr10   1622336181      1735269407      112933226
    chr11   1735269408      1824784389      89514981
    chr12   1824784390      1872502331      47717941
    chr13   1872502332      1985880342      113378010
    chr14   1985880343      2100318566      114438223
    chr15   2100318567      2212272591      111954024
    chr16   2212272592      2304316148      92043556
    chr17   2304316149      2403558441      99242292
    chr18   2403558442      2492568839      89010397
    chr19   2492568840      2552971676      60402836
    chr20   2552971677      2609345326      56373649
    chrM    2609345327      2609361954      16627
    chrX    2609361955      2773275320      163913365



5. GENERATE refSeqs.js FILE (USING CHROMOSOME SIZES FILE)

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseRefseq.pl \
--chromofile /nethome/bioinfo/data/sequence/chromosomes/rat/rn4/fasta/chromosome-sizes.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4 \
--chunk 20000

    /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js

    OK!



6. UNZIP AND SPLIT GTF FILES BY CHROMOSOME COLUMN INTO PER-CHROMOSOME FILES

rn4-CpG
rn4-miRNA
rn4-refGene
rn4-rgdQtl
rn4-snp125
rn4-tRNAs


/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnSplit.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf/rn4-CpG \
--column 1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputfile rn4-CpG.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnSplit.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf/rn4-miRNA \
--column 1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputfile rn4-miRNA.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnSplit.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf/rn4-refGene \
--column 1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputfile rn4-refGene.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnSplit.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf/rn4-rgdQtl \
--column 1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputfile rn4-rgdQtl.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnSplit.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf/rn4-snp125 \
--column 1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputfile rn4-snp125.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/utils/columnSplit.pl \
--inputfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf/rn4-tRNAs \
--column 1 \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputfile rn4-tRNAs.gtf

    OK!



7. CONVERT GTF TO GFF FILES


rn4-CpG
rn4-miRNA
rn4-refGene
rn4-rgdQtl
rn4-snp125
rn4-tRNAs


/nethome/bioinfo/apps/agua/0.5/bin/apps/gtfToGff.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--feature CpG \
--inputfile rn4-CpG.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/gtfToGff.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--feature miRNA \
--inputfile rn4-miRNA.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/gtfToGff.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--feature refGene \
--inputfile rn4-refGene.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/gtfToGff.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--feature rgdQtl \
--inputfile rn4-rgdQtl.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/gtfToGff.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--feature snp125 \
--inputfile rn4-snp125.gtf

/nethome/bioinfo/apps/agua/0.5/bin/apps/gtfToGff.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gtf \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--feature tRNAs \
--inputfile rn4-tRNAs.gtf


NB: REFACTORED gtfToGff.pl:

    - MOVED CORE METHOD TO JBrowse.pm

    - REQUIRES refSeqs.js FILE (GENERATED BY jbrowseRefseq.pl)
    
    - DON'T NEED JSON FILE

        {
            "description": "Human Chromosome 1",
            "db_adaptor": "Bio::DB::SeqFeature::Store",
            "db_args": {
                            "-adaptor": "memory",
                            "-dir": "/nethome/syoung/base/pipeline/jbrowse/ucsc/gff"
                        },
                
            "TRACK DEFAULTS": {
              "class": "feature",
              "autocomplete": "all"
            },
                
            "features":
            {
                "affy-exon-probes" :
                {
                    "feature": [ "affy_exon_probes" ],
                    "track": "Affy_Exon_Probes",
                    "key": "Affy Exon Probes",
                    "class": "exon"
                },
                "alt-events" :
                {
                    "feature": [ "alt_events" ],
                    "track": "Alt_Events",
                    "key": "Alt Events",
                    "class": "exon"
                },
                ...
            }
        }


6. GENERATE JBROWSE FEATURES


CpG
miRNA
refGene
rgdQtl
snp125
tRNAs


cd /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json

/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-miRNA.gff \
--label miRNA \
--key miRNA \
--queue large \
--cluster LSF


NB: SEEMS LIKE OUTPUT FILES TOO FEW BUT PROBABLY DUE TO GTF FILE LACKING LINES IN RAT:

ll /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json/data/tracks/chr1

    drwxrwxrwx  2 syoung root  53 Jun  7 00:12 miRNA

ll /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json/data/tracks/chr1/miRNA

    -rw-rw-rw- 1 syoung root  551 Jun  7 00:12 hist-1000000-0.json
    -rw-rw-rw- 1 syoung root 3.1K Jun  7 00:12 trackData.json



/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-CpG.gff \
--label CpG \
--key CpG \
--queue large \
--cluster LSF


/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-refGene.gff \
--label refGene \
--key refGene \
--queue large \
--cluster LSF


/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-rgdQtl.gff \
--label rgdQtl \
--key rgdQtl \
--queue large \
--cluster LSF


/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-snp125.gff \
--label snp125 \
--key snp125 \
--queue large \
--cluster LSF


/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-tRNAs.gff \
--label tRNAs \
--key tRNAs \
--queue large \
--cluster LSF




</entry>



