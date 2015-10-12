bioapps.version



<entry [Fri 2014:10:10 16:39:53 EST] >

1. CONVERTED *.app FILES INTO YAML FROM JSON

cd aligner
app convert --format json --inputfile json/ELAND.app --outputfile ELAND.app
cd ..

cd converter
app convert --format json --inputfile json/bowtieIndex.app --outputfile bowtieIndex.app
app convert --format json --inputfile json/eland2ace.app --outputfile eland2ace.app
app convert --format json --inputfile json/elandHeader.app --outputfile elandHeader.app
app convert --format json --inputfile json/elandIndex.app --outputfile elandIndex.app
app convert --format json --inputfile json/maqIndex.app --outputfile maqIndex.app
app convert --format json --inputfile json/novoIndex.app --outputfile novoIndex.app
cd ..

cd expression
app convert --format json --inputfile json/TOPHAT.app --outputfile TOPHAT.app
cd ..
    
cd pipeline
app convert --format json --inputfile json/image2eland.app --outputfile image2eland.app
app convert --format json --inputfile json/MAQ.app --outputfile MAQ.app
app convert --format json --inputfile json/SAV.app --outputfile SAV.app
cd ..

cd test
app convert --format json --inputfile json/sleep.app --outputfile sleep.app
cd ..

cd report
app convert --format json --inputfile json/filterSNP.app --outputfile filterSNP.app
cd ..

cd utility
app convert --format json --inputfile json/chopfile.app --outputfile chopfile.app
app convert --format json --inputfile json/createRefDirs.app --outputfile createRefDirs.app
app convert --format json --inputfile json/FTP.app --outputfile FTP.app
app convert --format json --inputfile json/replaceString.app --outputfile replaceString.app
app convert --format json --inputfile json/splitace.app --outputfile splitace.app
app convert --format json --inputfile json/unzipFiles.app --outputfile unzipFiles.app
cd ..

cd view
app convert --format json --inputfile json/jbrowseFeatures.app  --outputfile jbrowseFeatures.app
cd ..



2. ZIPPED UP JBROWSE DATA AND UPLOADED TO S3

    "resources"         :   {
        "dataurl"       :   "https://s3-us-west-1.amazonaws.com/aguadev/jbrowse.tar.gz",
        "description"   :   "JBrowse feature data"
    }


3. REMOVED DATA VOLUME FROM bioapps.ops

LATER: RETRIEVE SNP SQLITE DB FILES AND SPIN OFF TO NEW PACKAGE

    "datavolume"         :   {
        "id"            :   "snap-6341b301",
        "name"          :   "aquarius-8",
        "description"   :   "Bioinformatics data volume: Bioapps SNP SQLite database, NextGen aligner reference sequences and JBrowse feature data"
    }







</entry>
<entry [Mon 2014:04:07 19:39:01 EST] BIOAPPS 3-4 [0.8.0-beta.1+build.8] Added gt and pancancer tools, moved t/bin and t/lib to t/unit>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-beta.1+build.8 \
--mode 3-4 \
--message "Added gt and pancancer tools, moved t/bin and t/lib to t/unit"

</entry>
<entry [Mon 2014:04:07 19:38:52 EST] BIOAPPS 2-3 [0.8.0-beta.1+build.8] Added gt and pancancer tools, moved t/bin and t/lib to t/unit>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-beta.1+build.8 \
--mode 2-3 \
--message "Added gt and pancancer tools, moved t/bin and t/lib to t/unit"

</entry>
<entry [Mon 2014:04:07 14:53:08 EST] BIOAPPS 1-2 [0.8.0-beta.1+build.8] Added gt and pancancer tools, moved t/bin and t/lib to t/unit>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-beta.1+build.8 \
--mode 1-2 \
--message "Added gt and pancancer tools, moved t/bin and t/lib to t/unit

* 2 minutes ago 14402ae -Mov t/bin,t/lib: Moved to t/unit/bin and t/unit/lib
"

</entry>
<entry [Mon 2014:04:07 14:53:08 EST] BIOAPPS 1-2 [0.8.0-beta.1+build.7] Added gt and pancancer tools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-beta.1+build.7 \
--mode 1-2 \
--message "Added gt and pancancer tools

* 6 hours ago e20ddbd -Del bin/bamtofastq.pl: Cleaned up
|  
* 7 hours ago b7ef27a -Fix bin/pancancer: Changed gt_download.sh and split_bams.sh to non-docker calls
|  
* 8 hours ago c8f3083 -Mov bin/gt: Moved from bin/gtrepo
|  
* 8 hours ago 78f4f3b +Add lib/PanCancer: Added libs for PanCancer
|  
* 9 hours ago dea3090 +Add bin,lib,t: Added gtrepo plus tests and pancancer repo
|  
* 7 days ago fda22ba +Add bin/logic,bin/utils,lib/Logic,lib/Web: Enabling Shepherd::Queue, added filegrowth util and Web::GetResources (site vaccum)
"

</entry>
<entry [Fri 2014:01:24 04:33:37 EST] BIOAPPS 3-4 [0.8.0-beta.1+build.6] Added Shepherd.pm job scheduler>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-beta.1+build.6 \
--mode 3-4 \
--message "Added Shepherd.pm job scheduler"

</entry>
<entry [Fri 2014:01:24 04:33:07 EST] BIOAPPS 2-3 [0.8.0-beta.1+build.6] Added Shepherd.pm job scheduler>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-beta.1+build.6 \
--mode 2-3 \
--message "Added Shepherd.pm job scheduler"


</entry>
<entry [Fri 2014:01:24 04:30:40 EST] BIOAPPS 1-2 [0.8.0-beta.1+build.6] Added Shepherd.pm job scheduler>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-beta.1+build.6 \
--mode 1-2 \
--message "Added Shepherd.pm job scheduler

* 10 minutes ago b65524d +Add bin,lib,t: Added Shepherd.pm with tests completed
* 10 minutes ago 43da53a +Add bin/aligners/BWA.pl: First commit, onworking
* 10 minutes ago c238dc3 +Add .gitignore: Exclude test logs
| * 4 months ago eee8a4e +Add conf/tsv/.dummy: Added placeholder to ensure conf/tsv in repo
* | 4 months ago ce2cc81 +Add conf/tsv/.dummy: Save conf/tsv into repo
"


* 6 minutes ago d15927c -Del bin/aligners/BWA.pl: Removed for inclusion in branch 'bwa'
|  
* 9 minutes ago b65524d +Add bin,lib,t: Added Shepherd.pm with tests completed
|  
* 9 minutes ago 43da53a +Add bin/aligners/BWA.pl: First commit, onworking
|  
* 9 minutes ago c238dc3 +Add .gitignore: Exclude test logs
|  
* 11 days ago 4b7efca -Fix bin/utils/pretty.pl,stager.conf: Changed from /aguadev to /mnt in stager.conf
|    
*   4 months ago bcfec16 Merge branch 'master' of github.com:syoung/bioappsdev
|\  
| |   
| * 4 months ago eee8a4e +Add conf/tsv/.dummy: Added placeholder to ensure conf/tsv in repo
| |   
* | 4 months ago ce2cc81 +Add conf/tsv/.dummy: Save conf/tsv into repo
| |   
* | 4 months ago b79b0d9 [0.8.0-alpha.1+build.5] Added conf/tsv/.dummy to ensure place for *.tsv files


</entry>
<entry [Sun 2014:01:12 23:27:38 EST] BIOAPPS 3-4 [0.8.0-beta.1+build.5] Added conf/tsv/.dummy to ensure place for *.tsv files>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-beta.1+build.5 \
--mode 3-4 \
--message "Added conf/tsv/.dummy to ensure place for *.tsv files"

</entry>
<entry [Sun 2014:01:12 23:21:24 EST] BIOAPPS 2-3 [0.8.0-beta.1+build.5] Added conf/tsv/.dummy to ensure place for *.tsv files>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-beta.1+build.5 \
--mode 2-3 \
--message "Added conf/tsv/.dummy to ensure place for *.tsv files"
    
</entry>
<entry [Mon 2013:10:07 04:42:52 EST] BIOAPPS 1-2 [0.8.0-alpha.1+build.5] Added conf/tsv/.dummy to ensure place for *.tsv files>

/aguadev/bin/scripts/stager.pl \
--stagefile /aguadev/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-alpha.1+build.5 \
--mode 1-2 \
--message "Added conf/tsv/.dummy to ensure place for *.tsv files"
    
</entry>
<entry [Wed 2012:11:14 15:19:56 EST] BIOAPPS 3-4 [0.8.0-alpha.1+build.4] Moved bioapps.conf from data volume to bioapps/conf>

sudo /agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-alpha.1+build.4 \
--mode 3-4 \
--message "Moved bioapps.conf from data volume to bioapps/conf" \
--SHOWLOG 4

</entry>
<entry [Wed 2012:11:14 15:19:56 EST] BIOAPPS 2-3 [0.8.0-alpha.1+build.4] Moved bioapps.conf from data volume to bioapps/conf>

sudo /agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-alpha.1+build.4 \
--mode 2-3 \
--message "Moved bioapps.conf from data volume to bioapps/conf" \
--SHOWLOG 4

</entry>
<entry [Wed 2012:11:14 15:19:56 EST] BIOAPPS 1-2 [0.8.0-alpha.1+build.4] Moved bioapps.conf from data volume to bioapps/conf>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-alpha.1+build.4 \
--mode 1-2 \
--message "Moved bioapps.conf from data volume to bioapps/conf

* 198ec4f +Fix bin/snp: Fixed line endings to single LF
* df38ae3 +Add conf: First commit bioapps.conf
* b8c092b -Fix all: Changed CR/LF line endings to LF only
* d3284ef +Fix stager.conf - changed apps to bioapps
* 0d44f31 +Add stager.conf and stager.pm first commit

" \
--SHOWLOG 4

</entry>
<entry [Wed 2012:11:14 15:19:56 EST] BIOAPPS 3-4 [0.8.0-alpha.1+build.3] Minor fixes (dbobject to db) and cleanup>

sudo /agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-alpha.1+build.3 \
--mode 3-4 \
--message "Minor fixes (dbobject to db) and cleanup

+Fix bin,t: Changed dbobject to db
-Del bin/aligners/sortHits*.pl

" \
--SHOWLOG 4

</entry>
<entry [Wed 2012:11:14 15:19:56 EST] BIOAPPS 2-3 [0.8.0-alpha.1+build.3] +Fix bin,t: Changed dbobject to db>

sudo /agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-alpha.1+build.3 \
--mode 2-3 \
--message "+Fix bin,t: Changed dbobject to db

+Fix bin,t: Changed dbobject to db
-Del bin/aligners/sortHits*.pl

" \
--SHOWLOG 4

</entry>
<entry [Wed 2012:11:14 15:19:56 EST] BIOAPPS 1-2 [0.8.0-alpha.1+build.3] -Del bin/aligners/sortHits*.pl>

sudo /agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-alpha.1+build.3 \
--mode 1-2 \
--message "-Del bin/aligners/sortHits*.pl" \
--SHOWLOG 4

</entry>
<entry [Fri 2012:10:26 18:42:24 EST] BIOAPPS 1-2 [0.8.0-alpha.1+build.2] -Fix bin,t/bin: Changed dbobject to db>

NB: NO build.2 IN bioapps BECAUSE NOT PUSHED BEFORE DISK LOSS

sudo /agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/bioappsdev/stager.pm \
--version 0.8.0-alpha.1+build.2 \
--mode 1-2 \
--message "-Fix bin,t/bin: Changed dbobject to db" \
--SHOWLOG 4


</entry>
<entry [Mon 2012:10:08 05:53:11 EST] BIOAPPS 2-3 (PUBLIC DEVEL) 0.8.0-alpha.1+build.1 +Add: Compatible with agua 0.8.0-alpha builds>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build.1 \
--sourcerepo /repos/private/syoung/bioapps \
--targetrepo /repos/public/agua/bioappsdev \
--description "+Add: Compatible with agua 0.8.0-alpha builds"

</entry>
<entry [Mon 2012:10:08 05:23:12 EST] BIOAPPS 1-2 (PRIVATE DEVEL) 0.8.0-alpha.1+build.1 +Add: Compatible with agua 0.8.0-alpha builds>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build.1 \
--sourcerepo /repos/private/syoung/bioappsdev \
--targetrepo /repos/private/syoung/bioapps \
--description "+Add: Compatible with agua 0.8.0-alpha builds"


COMPLETE LIST OF EXECUTABLES:

ls bin/*
bin/aligners:
bamCoverage.pl  bowtieRefList.pl    copySplitfiles.pl  elandHeader.pl  ELAND-simple.pl  lookupRead.pl  miniMAQ.pl         samHits.pl      sortHits-v2.pl
bamIdxstats.pl  checkInsertSize.pl  createRefDirs.pl   elandHits.pl    GSMAPPER.pl      MAQcheck.pl    moveDirs.pl        samindex.pl     splitFiles.pl
BOWTIEcheck.pl  cleanup.pl          editSam.pl         ELAND.pl        image2eland.pl   MAQfilter.pl   NOVOALIGNcheck.pl  sortHits.pl     testFilesize.pl
BOWTIE.pl       copyFiles.pl        ELANDcheck.pl      ELANDrerun.pl   insertSize.pl    MAQ.pl         NOVOALIGN.pl       sortHits-v1.pl  testRegex.pl

bin/converters:
bowtieIndex.pl  eland2ace.pl  elandIndex.pl  faToBfa.pl  gzipSamfile.pl  indexBam.pl  maqIndex.pl  novoIndex.pl  samToBam.pl  samToSnp.pl  samToTsv.pl  sortBam.pl

bin/expression:
CASAVA.pl  CUFFCOMPARE.pl  CUFFLINKS.pl  ERANGE.pl  TOPHAT.pl  TOPHATstats.pl

bin/filters:
blatFilter.pl  filterFile.pl  readFilter.pl  repeatMask.pl

bin/index:
getReads.pl  indexer_basic.pl  indexReads.pl  indexSnp.pl  indexVenn.pl  lookupRead.pl  mergeIndexes.pl  numberHits.pl  numberReads.pl  simpleVenn.pl  vennSimple.pl

bin/readprep:
averageQualities.pl  fastqQualityHeader.pl  fixedWidthFastqs.pl  nFilter.pl        printListFiles.pl  qualityMap.pl          simpleHeader.pl   testRegex.pl
averageQuality.pl    fastqToCsfasta.pl      mergeFiles.pl        polyAFilter.pl    printSubfile.pl    sampleReads.pl         simpleHeaders.pl  trimRead.pl
checkHeader.pl       fixedWidthFastq.pl     moveFile.pl          printListFile.pl  printSubfiles.pl   simpleHeaderPaired.pl  solidToFastq.pl   trimReads.pl

bin/snp:
bamToSnp.pl  createIntervalFiles.pl  cumulativeBam.bkp.pl  cumulativeSnp.pl  filterSnp.pl  realignBam.pl  snpCounts.pl  snpToSav.pl   unbin.pl     uniqueHeterozygotes.pl
binBam.pl    createIntervals.pl      cumulativeBam.pl      filterSav.pl      hitRange.pl   SAV.pl         snpFinder.pl  snpToVenn.pl  unbinSnp.pl  VENN.pl

bin/tsv:
app.tsv.csv  parameter.tsv.csv

bin/utils:
batchCluster.pl       clusterMerge.pl  complement.pl   coverage.cpp      gunzip.pl   modver.pl~       readLengths.pl       removeTop.pl      sortfile.pl     unzipFiles.pl
chopfile              columnFilter.pl  copySedFile.pl  createRefDirs.pl  lines       nospaces.pl      readQuality.pl       replaceAtQual.pl  sortMixed.pl
chopfile.pl           columnSplit.pl   countLines.pl   findMatch.pl      modules.pl  pretty.pl        reduceReads.pl       replaceString.pl  sortNumeric.pl
chromosomeSubdirs.sh  columnSplit.pl~  coverage.c      FTP.pl            modver.pl   qstatSummary.pl  removeDuplicates.pl  selectColumns.pl  splitace.pl

bin/venn:
collateVenn.pl  samVenn.pl  simpleVenn.pl  snpToVenn.pl  snpVenn.pl  SNPVENN.pl  snpVenn.pl-deprecated  transcriptsVenn.pl


</entry>