bioapps



<entry [Sun 2013:01:13 01:41:48 EST] REFACTOR: REMOVE use lib "... external/lib" ENTRIES IN ALL *.pl FILES>

110 FILES:

/agua/apps/bioapps/bin/aligners/ELANDrerun.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/aligners/ELANDrerun.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
/agua/apps/bioapps/bin/aligners/ELANDrerun.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/aligners/ELANDrerun.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";    
/agua/apps/bioapps/bin/aligners/samHits.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/aligners/moveDirs.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/insertSize.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/aligners/copySplitfiles.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/MAQcheck.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/elandHits.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/checkInsertSize.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/aligners/copyFiles.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/MAQ.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/NOVOALIGNcheck.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/cleanup.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/ELANDcheck.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/BOWTIE.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/splitFiles.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/BOWTIEcheck.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/NOVOALIGN.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/aligners/MAQfilter.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/checkHeader.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/simpleHeader.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/trimReads.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/readprep/solidToFastq.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/mergeFiles.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/moveFile.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/readprep/simpleHeaderPaired.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/trimRead.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/fixedWidthFastqs.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/readprep/fastqToCsfasta.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/printSubfiles.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/readprep/fastqQualityHeader.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/averageQuality.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/printListFile.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/printSubfile.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/readprep/averageQualities.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/readprep/nFilter.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/simpleHeaders.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/readprep/qualityMap.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/fixedWidthFastq.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/polyAFilter.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/readprep/printListFiles.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/snpCounts.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/snpToSav.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/snp/snpToSav.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/snp/snpToSav.pl:#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
/agua/apps/bioapps/bin/snp/snpToSav.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/snp/snpToSav.pl:#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";   
/agua/apps/bioapps/bin/snp/bamToSnp.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/createIntervals.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/unbinSnp.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/VENN.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/snpToVenn.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/snp/snpToVenn.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/snp/snpToVenn.pl:#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
/agua/apps/bioapps/bin/snp/snpToVenn.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/snp/snpToVenn.pl:#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";   
/agua/apps/bioapps/bin/snp/unbin.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/SAV.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/binBam.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/cumulativeBam.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/hitRange.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/filterSav.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/cumulativeSnp.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/cumulativeBam.bkp.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/createIntervalFiles.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/snp/realignBam.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/filters/readFilter.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/filters/filterFile.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/filters/repeatMask.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/venn/snpVenn.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external";
/agua/apps/bioapps/bin/venn/snpVenn.pl:	use lib "/nethome/syoung/0.5/lib/external";	
/agua/apps/bioapps/bin/venn/snpVenn.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/venn/SNPVENN.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external";
/agua/apps/bioapps/bin/venn/SNPVENN.pl:	use lib "/nethome/syoung/0.5/lib/external";	
/agua/apps/bioapps/bin/venn/SNPVENN.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/venn/snpToVenn.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/venn/simpleVenn.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/venn/collateVenn.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/venn/samVenn.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/venn/transcriptsVenn.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/venn/snpVenn.pl-deprecated:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/utils/copySedFile.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/utils/copySedFile.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/utils/columnSplit.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/utils/clusterMerge.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/utils/clusterMerge.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/utils/sortfile.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/utils/removeTop.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/utils/replaceString.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/utils/selectColumns.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/utils/columnSplit.pl~:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/utils/removeDuplicates.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/expression/ERANGE.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/expression/CUFFCOMPARE.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/expression/TOPHATstats.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/expression/TOPHATstats.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/expression/TOPHAT.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/expression/CASAVA.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/expression/CUFFLINKS.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/index/indexVenn.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/index/simpleVenn.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/index/vennSimple.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/converters/sortBam.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/converters/samToTsv.pl:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/converters/samToBam.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/converters/indexBam.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/converters/faToBfa.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/converters/samToSnp.pl:use lib "$Bin/../../../lib/external";	
/agua/apps/bioapps/bin/converters/gzipSamfile.pl:use lib "$Bin/../../../lib/external";	



CLEANED UP ALL ../lib/external FILES, LEAVING 18 FILES TO DO:

/agua/apps/bioapps/bin/aligners/ELANDrerun.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
/agua/apps/bioapps/bin/aligners/ELANDrerun.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/aligners/ELANDrerun.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";    
/agua/apps/bioapps/bin/snp/snpToSav.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/snp/snpToSav.pl:#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
/agua/apps/bioapps/bin/snp/snpToSav.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/snp/snpToSav.pl:#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";   
/agua/apps/bioapps/bin/snp/snpToVenn.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/snp/snpToVenn.pl:#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
/agua/apps/bioapps/bin/snp/snpToVenn.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/snp/snpToVenn.pl:#    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";   
/agua/apps/bioapps/bin/venn/snpVenn.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external";
/agua/apps/bioapps/bin/venn/snpVenn.pl:	use lib "/nethome/syoung/0.5/lib/external";	
/agua/apps/bioapps/bin/venn/SNPVENN.pl:    unshift @INC, "/nethome/syoung/0.5/lib/external";
/agua/apps/bioapps/bin/venn/SNPVENN.pl:	use lib "/nethome/syoung/0.5/lib/external";	
/agua/apps/bioapps/bin/utils/copySedFile.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/utils/clusterMerge.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
/agua/apps/bioapps/bin/utils/columnSplit.pl~:use lib "$Bin/../../../lib/external";
/agua/apps/bioapps/bin/expression/TOPHATstats.pl:use lib "$Bin/../../../lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";





</entry>