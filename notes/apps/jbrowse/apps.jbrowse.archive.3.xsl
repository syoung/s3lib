apps.jbrowse.archive.3

<entry [Thu 2011:03:03 21:25:59 EST] CREATED TESTS FOR Agua::JBrowse::addTrackdata AND Agua::JBrowse::removeTrackData>

Test::Differences WILL PRODUCE A DIFF-LIKE MINIREPORT OF ANY FILE DIFFERENCES 

   use Test;    ## Or use Test::More
   use Test::Differences;

   eq_or_diff $got,  "a\nb\nc\n",   "testing strings";
   eq_or_diff \@got, [qw( a b c )], "testing arrays";

   ## Passing options:
   eq_or_diff $got, $expected, $name, { context => 300 };  ## options

   ## Using with DBI-like data structures

   use DBI;

   ... open connection & prepare statement and @expected_... here...
   
   eq_or_diff $sth->fetchall_arrayref, \@expected_arrays  "testing DBI arrays";
   eq_or_diff $sth->fetchall_hashref,  \@expected_hashes, "testing DBI hashes";

   ## To force textual or data line numbering (text lines are numbered 1..):
   eq_or_diff_text ...;
   eq_or_diff_data ...;


NB: MUST RETAIN THE FOLLOWING FORMAT AFTER WRITE TO trackInfo.js

trackInfo = [
   {
      "url" : "data/tracks/{refseq}/cytoBand/trackData.json",
      "label" : "cytoBand",
      "type" : "FeatureTrack",
      "key" : "Chromosome Band"



use Text::Diff;
<!--
    ## Mix and match filenames, strings, file handles, producer subs,
    ## or arrays of records; returns diff in a string.
    ## WARNING: can return B< large > diffs for large files.
    my $diff = diff "file1.txt", "file2.txt", { STYLE => "Context" };
    my $diff = diff \$string1,   \$string2,   \%options;
    my $diff = diff \*FH1,       \*FH2;
    my $diff = diff \&reader1,   \&reader2;
    my $diff = diff \@records1,  \@records2;
-->
    ## May also mix input types:
    my $diff = diff \@records1,  "file_B.txt";

DESCRIPTION

http://kobesearch.cpan.org/htdocs/Text-Diff/Text/Diff.html 


diff() provides a basic set of services akin to the GNU diff utility. It is not anywhere near as feature complete as GNU diff, but it is better integrated with Perl and available on all platforms. It is often faster than shelling out to a system's diff executable for small files, and generally slower on larger files.

Relies on Algorithm::Diff for, well, the algorithm. This may not produce the same exact diff as a system's local diff executable, but it will be a valid diff and comprehensible by patch. We haven't seen any differences between Algorithm::Diff's logic and GNU diff's, but we have not examined them to make sure they are indeed identical.

Note: If you don't want to import the diff function, do one of the following:

   use Text::Diff ();

   require Text::Diff;

That's a pretty rare occurence, so diff() is exported by default. =head1 OPTIONS

diff() takes two parameters from which to draw input and a set of options to control it's output. The options are:

FILENAME_A, MTIME_A, FILENAME_B, MTIME_B
The name of the file and the modification time "files"

These are filled in automatically for each file when diff() is passed a filename, unless a defined value is passed in.

If a filename is not passed in and FILENAME_A and FILENAME_B are not provided or undef, the header will not be printed.

Unused on OldStyle diffs.

OFFSET_A, OFFSET_B
The index of the first line / element. These default to 1 for all parameter types except ARRAY references, for which the default is 0. This is because ARRAY references are presumed to be data structures, while the others are line oriented text.

STYLE
"Unified", "Context", "OldStyle", or an object or class reference for a class providing file_header(), hunk_header(), hunk(), hunk_footer() and file_footer() methods. The two footer() methods are provided for overloading only; none of the formats provide them.

Defaults to "Unified" (unlike standard diff, but Unified is what's most often used in submitting patches and is the most human readable of the three.

If the package indicated by the STYLE has no hunk() method, c< diff() > will load it automatically (lazy loading). Since all such packages should inherit from Text::Diff::Base, this should be marvy.

Styles may be specified as class names (STYLE = "Foo"), in which case they will be new()ed with no parameters, or as objects (STYLE = Foo->new>).

CONTEXT
How many lines before and after each diff to display. Ignored on old-style diffs. Defaults to 3.

OUTPUT
Examples and their equivalent subroutines:

    OUTPUT   => \*FOOHANDLE,   # like: sub { print FOOHANDLE shift() }
    OUTPUT   => \$output,      # like: sub { $output .= shift }
    OUTPUT   => \@output,      # like: sub { push @output, shift }
    OUTPUT   => sub { $output .= shift },

If no OUTPUT is supplied, returns the diffs in a string. If OUTPUT is a CODE ref, it will be called once with the (optional) file header, and once for each hunk body with the text to emit. If OUTPUT is an IO::Handle, output will be emitted to that handle.

FILENAME_PREFIX_A, FILENAME_PREFIX_B
The string to print before the filename in the header. Unused on OldStyle diffs. Defaults are "---", "+++" for Unified and "***", "+++" for Context.

KEYGEN, KEYGEN_ARGS
These are passed to traverse_sequences in Algorithm::Diff.

Note: if neither FILENAME_ option is defined, the header will not be printed. If at one is present, the other and both MTIME_ options must be present or "Use of undefined variable" warnings will be generated (except on OldStyle diffs, which ignores these options).

Formatting Classes

 




NOTES
-----

Test::Files DOESN'T SEEM TO WANT TO COOPERATE


use strict;
use warnings;
use Test::More tests => 5;
use Test::Files;
    
file_ok($file_name, "This is the\ntext\n",
    "file one contents");

compare_ok($file1, $file2, $name);
dir_contains_ok($dir, [qw(list files here)], $name);
dir_only_contains_ok($dir, [qw(list all files here)], $name);
compare_dirs_ok($test_built, $shipped, $name);
    # generates a separate diagnostic diff output for each pair of files that differs
    # lists files that are missing from either distribution
    # all of the separate failures only count as one failed test



    http://www.perl.com/pub/2005/12/08/test_files.html
Testing Files and Test Modules
By Phil Crow on December 8, 2005 12:00 AM
For the last several years, there has been more and more emphasis on automated testing. No self-respecting CPAN author can post a distribution without tests. Yet some things are hard to test. This article explains how writing Test::Files gave me a useful tool for validating one module's output and taught me a few things about the current state of Perl testing.

Introduction

My boss put me to work writing a moderately large suite in Perl. Among many other things, it needed to perform check out and commit operations on CVS repositories. In a quest to build quality tests for that module, I wrote Test::Files, which is now on CPAN. This article explains how to use that module and, perhaps more importantly, how it tests itself.

Using Test::Files

To use Test::Files, first use Test::More and tell it how many tests you want to run.

use strict;
use warnings;
use Test::More tests => 5;
use Test::Files;
After you use the module, there are four things it can help you do:

Compare one file to a string or to another file.
Make sure that directories have the files you expect them to have.
Compare all the files in one directory to all the files in another directory.
Exclude some things from consideration.
Single Files

In the simplest case, you have written a file. Now it is time to validate it. That could look like this:

file_ok($file_name, "This is the\ntext\n",
    "file one contents");
The file_ok function takes two (or optionally, and preferably, three) arguments. The first is the name of the file you want to validate. The second is a text string containing the text that should be in the file. The third is the name of the test. In the rush of writing, I'm likely to fail to mention the test names at some point, so let me say up front that all of the tests shown here take a name argument. Including a name makes finding the test easier.

If the file agrees with the string, the test passes with only an OK message. Otherwise, the test will fail and diagnostic messages will show where the two differed. The diagnostic output is really the reason to use Test::Files.

Some, including myself, prefer to check one file against another. I put one version in the distribution. The other one, my tests write. To compare two files, use:

compare_ok($file1, $file2, $name);
As with file_ok, if the files are the same, Test::Files only reports an OK message. Failure shows where the files differ.

Directory Structures

Sometimes, you need to validate that certain files are present in a directory. Other times, you need to make that check exclusive so that only known files are present. Finally, you might want to know that not only is the directory structure is the same, but that the files contain the same data.

To look for some files in a directory by name, write:

dir_contains_ok($dir, [qw(list files here)], $name);
This will succeed, even if the directory has some other files you weren't looking for.

To ensure that your list is exclusive, add only to the function name:

dir_only_contains_ok($dir, [qw(list all files here)], $name);
Both of these report a list of absent files if they fail due to them. The exclusive form also reports a list of unexpected files, if it sees any.

Directory Contents

If knowing that certain file names are present is not enough, use the compare_dirs_ok function to check the contents of all files in one directory against files in another directory. A typical module might build one directory during make test, with the other built ahead of time and shipped with the distribution.

compare_dirs_ok($test_built, $shipped, $name);
This will generate a separate diagnostic diff output for each pair of files that differs, in addition to listing files that are missing from either distribution. (If you need to know which files are missing from the built directory, either reverse the order of the directories or use dir_only_contains_ok in addition to compare_dirs_ok. This is a bug and might eventually be fixed.) Even though this could yield many diagnostic reports, all of those separate failures only count as one failed test.

There are many times when testing all files in the directories is just wrong. In these cases, it is best to use File::Find or an equivalent, putting an exclusion criterion at the top of your wanted function and a call to compare_ok at the bottom. This probably requires you to use no_plan with Test::More:

use Test::More qw(no_plan);
Test::More wants to know the exact number of tests you are about to run. If you tell it the wrong number, the test harness will think something is wrong with your test script, causing it to report failures. To avoid this confusion, use no_plan--but keep in mind that plans are there for a reason. If your test dies, the plan lets the harness know how many tests it missed. If you have no_plan, the harness doesn't always have enough information to keep score. Thus, you should put such tests in separate scripts, so that the harness can count your other tests properly.

</entry>


<entry [Thu 2011:03:03 19:54:23 EST] EXAMPLE OF trackData.json>


Agua::JBrowse::addTrackdata    trackdata: 
$VAR1 = {
          'headers' => [
                         'start',
                         'end',
                         'strand',
                         'id',
                         'name',
                         'type',
                         'alias'
                       ],
          'subfeatureClasses' => undef,
          'histogramMeta' => [
                               {
                                 'basesPerBin' => '5000',
                                 'arrayParams' => {
                                                    'length' => 50848,
                                                    'chunkSize' => 10000,
                                                    'urlTemplate' => 'hist-5000-{chunk}.json'
                                                  }
                               },
                               {
                                 'basesPerBin' => '50000',
                                 'arrayParams' => {
                                                    'length' => 5085,
                                                    'chunkSize' => 10000,
                                                    'urlTemplate' => 'hist-50000-{chunk}.json'
                                                  }
                               }
                             ],
          'histStats' => [
                           {
                             'bases' => 5000,
                             'max' => 67,
                             'mean' => '2.45929043423537'
                           },
                           {
                             'bases' => 10000,
                             'max' => 74,
                             'mean' => '3.88872718691001'
                           },
                           {
                             'bases' => 20000,
                             'max' => 86,
                             'mean' => '6.74921334172435'
                           },
                           {
                             'bases' => 50000,
                             'max' => 89,
                             'mean' => '15.3203539823009'
                           },
                           {
                             'bases' => 100000,
                             'max' => 141,
                             'mean' => '29.6075501376327'
                           },
                           {
                             'bases' => 200000,
                             'max' => 197,
                             'mean' => '58.1650943396226'
                           },
                           {
                             'bases' => 500000,
                             'max' => 387,
                             'mean' => '143.783889980354'
                           },
                           {
                             'bases' => 1000000,
                             'max' => 701,
                             'mean' => '285.996078431373'
                           },
                           {
                             'bases' => 2000000,
                             'max' => 1136,
                             'mean' => '568.75'
                           },
                           {
                             'bases' => 5000000,
                             'max' => 2705,
                             'mean' => '1425.94117647059'
                           },
                           {
                             'bases' => 10000000,
                             'max' => 5189,
                             'mean' => 2796
                           }
                         ],
          'key' => 'simpleRepeat',
          'featureNCList' => [
                               [
                                 -1,
                                 254235635,
                                 {
                                   'chunk' => 0
                                 }
                               ]
                             ],
          'sublistIndex' => 7,
          'lazyIndex' => 2,
          'featureCount' => 72671,
          'className' => 'feature2',
          'clientConfig' => undef,
          'arrowheadClass' => undef,
          'subfeatureHeaders' => [
                                   'start',
                                   'end',
                                   'strand',
                                   'type'
                                 ],
          'urlTemplate' => 'http://url/index?id={alias}',
          'type' => 'FeatureTrack',
          'label' => 'simpleRepeat',
          'lazyfeatureUrlTemplate' => 'lazyfeatures-{chunk}.json'
        };

    
</entry>

<entry [Thu 2011:03:03 12:54:23 EST] CREATED AGUA VERSION 0.6>
    
    CONTAINS MooseIFIED MODULES IN CORE AND OTHERS ARRANGED IN
    
    DIRECTORIES (MIRRORING THE bin/apps STRUCTURE):
    
    
Agua
    Cluster
        Checker.pm
        Cleanup.pm
        Convert.pm
        HitStats.pm
        Jobs.pm
        Loop.pm
        Merge.pm
        SNP.pm
        Sort.pm
        Usage.pm
        Util.pm
    
    JBrowse.pm
    
    Report.pm
    Report
        SNP.pm

Aligner
    BOWTIE.pm
    ELAND.pm
    MAQ.pm
    NOVOALIGN.pm

Converter.pm


Expression
    CUFFCOMPARE.pm
    CUFFLINKS.pm
    TOPHAT.pm
    ERANGE.pm
    
Filters

Index
    Read.pm  Snp.pm

Logic
    
Readprep
Snp
t
test
Util
    FileTools
Venn
    
    


    
</entry>


<entry [Thu Mar  3 03:02:33 EST 2011] FINAL STAGE OF VIEW: ENABLE DYNAMIC SWITCHING OF TRACKS IN USER VIEWS>
    
    Agua::View EXTENDS Agua::JBrowse TO PROVIDE THE  FOLLOWING FUNCTIONALITY.
    
    
	PACKAGE		View
	
	PURPOSE
	
		THIS MODULE ENABLES THE FOLLOWING USE SCENARIOS:

		1. USER GENERATES JBROWSE JSON FILES IN OWN FOLDER
	
			1.1 CREATE FEATURES FOLDER
			
				1.1.1 CREATE WORKFLOW-SPECIFIC FEATURES FOLDER
				
			   users/__username__/__project__/__workflow__/features
			
			   TO HOLD INDIVIDUAL FEATURE JSON FILE DIRECTORIES INPUT FILES, E.G.:
			
			   users/__username__/__project__/__workflow__/features/__feature_name__

			   ... GENERATED FROM INDIVIDUAL FEATURE FILES, E.G.:
			
			   users/__username__/__project__/__workflow__/somedir/__feature_name__.gff


			1.2 GENERATE JBrowse FEATURES IN PARALLEL ON A CLUSTER
			
				FOR EACH FEATURE:

					1.2.1 GENERATE A UNIQUE NAME FOR THIS PROJECT
					
						BY ADDING AN INCREMENTED DIGIT TO THE END OF THE FEATURE IN
						
						THE CASE OF DUPLICATE FEATURE NAMES IN THE SAME PROJECT OR
						
						WORKFLOW
						
					1.2.2 REGISTER FEATURE IN features TABLE
					
					1.2.3 GENERATE FEATURE IN FEATURES SUBFOLDER (Agua::JBrowse), E.G.:

					   users/__username__/__project__/__workflow__/features/__feature_name__


		2. USER CREATES A NEW VIEW

			2.1 CREATE A NEW USER- AND WORKFLOW-SPECIFIC FOLDER INSIDE
			
				THE JBROWSE ROOT FOLDER:
				
			   jbrowse/users/__username__/__project__/__workflow__/__viewname__


			2.2 LINK (ln -s) ALL STATIC FEATURE TRACK SUBFOLDERS TO THE
			
				VIEW FOLDER.
 			
				NB: LINK AT THE INDIVIDUAL STATIC FEATURE LEVEL, E.G.:
				
				jbrowse/species/__species__/__build__/data/tracks/chr*/FeatureDir 
				
				__NOT__ AT A HIGHER LEVEL BECAUSE WE WANT TO BE ABLE
				
				TO ADD/REMOVE DYNAMIC TRACKS IN THE USER'S VIEW FOLDER WITHOUT
				
				AFFECTING THE PARENT DIRECTORY OF THE STATIC TRACKS.
				
				THE STATIC TRACKS ARE MERELY INDIVIDUALLY 'BORROWED' AS IS.


		2. USER ADDS/REMOVES TRACKS TO/FROM VIEW
		
		    2.1 CREATE USER-SPECIFIC VIEW FOLDER:

		        plugins/view/jbrowse/users/__username__/__project__/__view__/data

			2.2 ADD/REMOVE FEATURE trackData.json INFORMATION TO/FROM data/trackInfo.js
			
			2.3 RERUN generate-names.pl AFTER EACH ADD/REMOVE

    
</entry>

<entry [Wed Mar  2 22:24:41 EST 2011] GENERATE HUMAN hg19 UCSC TRACKS FOR VERSION 1.2.6>
    

BASED ON:
[Sun Jun  6 23:35:17 EDT 2010] DO MOUSE FEATURES


1. DOWNLOADED GTF FILES

FROM
http://genome.ucsc.edu/cgi-bin/hgTables

TO HERE ON UBUNTU
/data/jbrowse/ucsc/human/hg19/gtf

TO HERE ON PEGASUS
/nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/gtf


COPY FILES TO pegasus:

scp /data/jbrowse/ucsc/human/hg19/* syoung@pegasus.ccs.miami.edu:/nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/gtf


2. GENERATE CHROMOSOME SIZES FILE

ON UBUNTU:

COPY HUMAN hg19 FASTA FILES
mkdir -p /data/sequence/human/hg19
scp -r syoung@pegasus.ccs.miami.edu:/nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta /data/sequence/human/hg19

CREATE CHROMOSOME SIZE FILE
/home/syoung/0.6/bin/apps/jbrowse/chromosomeSizes.pl \
--inputdir /data/sequence/human/hg19/fasta

COPY TO JBROWSE PROCESSING DIR
cp /data/sequence/human/hg19/fasta/chromosome-sizes.txt \
/data/jbrowse/ucsc/human/hg19

ON PEGASUS:

/nethome/syoung/0.6/bin/apps/jbrowse/chromosomeSizes.pl \
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

/home/syoung/0.6/bin/apps/jbrowse/jbrowseRefseq.pl \
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

/nethome/syoung/0.6/bin/apps/jbrowse/jbrowseRefseq.pl \
--chromofile /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/chromosome-sizes.txt \
--outputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19 \
--chunk 20000

    /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/refSeqs.js

    OK!


4. UNZIP AND SPLIT GTF FILES BY CHROMOSOME COLUMN INTO PER-CHROMOSOME FILES

ON UBUNTU:

/home/syoung/0.6/bin/apps/utils/columnSplit.pl \
--inputdir /data/jbrowse/ucsc/human/hg19 \
--column 1 \
--suffix gtf
    Run time: 00:15:05
    Completed /home/syoung/0.6/bin/apps/utils/columnSplit.pl
    5:57PM, 1 March 2011
    ****************************************

ON PEGASUS:

/nethome/syoung/0.6/bin/apps/utils/columnSplit.pl \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/gtf \
--column 1 \
--suffix gtf


5. CONVERT GTF TO GFF FILES

ON UBUNTU:

/home/syoung/0.6/bin/apps/jbrowse/gtfToGff.pl \
--refseqfile /data/jbrowse/ucsc/human/hg19/refSeqs.js \
--inputdir /data/jbrowse/ucsc/human/hg19/gtf/chr1 \
--outputdir /data/jbrowse/ucsc/human/hg19/gff/chr1

USE LOOP

/home/syoung/0.6/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop serial \
--executable /home/syoung/0.6/bin/apps/jbrowse/gtfToGff.pl \
--refseqfile /data/jbrowse/ucsc/human/hg19/refSeqs.js \
--inputdir /data/jbrowse/ucsc/human/hg19/gtf/chr%REPLICATE% \
--outputdir /data/jbrowse/ucsc/human/hg19/gff/chr%REPLICATE% \
&> /data/jbrowse/ucsc/human/hg19/gff/loop-gtftogff.out


6. GENERATE JBROWSE FEATURES

ON UBUNTU:

CREATE SAMTOOLS INDEX FILES
/home/syoung/0.6/bin/apps/aligners/samindex.pl \
--inputdir /data/sequence/human/hg19/fasta/ \
--outputdir /data/sequence/human/hg19/samtools
    Run time: 00:00:36
    Completed /home/syoung/0.6/bin/apps/aligners/samindex.pl
    3:30AM, 2 March 2011
    ****************************************

SET OWNERSHIP AND PERMISSIONS IN /data
find /data -type d -exec chown syoung:www-data {} \;
find /data -type d -exec chmod 0775 {} \;
find /data -type f -exec chmod 0664 {} \;

GENERATE FEATURES
/home/syoung/0.6/bin/apps/jbrowse/generateFeatures.pl \
--refseqfile /data/jbrowse/ucsc/human/hg19/refSeqs.js \
--inputdir /data/jbrowse/ucsc/human/hg19/gff/chr1 \
--outputdir /data/jbrowse/ucsc/human/hg19/jbrowse/chr1 \
--filetype gff \
--species human \
--build hg19 \
--configfile /data/jbrowse/ucsc/human/hg19/jbrowse.json


TEST OUTPUT:

COPY 
/data/jbrowse/ucsc/human/hg19/jbrowse/chr1/data/tracks/chr1/simpleRepeat

TO
/home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1


cp -r /data/jbrowse/ucsc/human/hg19/jbrowse/chr1/data/tracks/chr1/simpleRepeat \
/home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1






7. MERGE FEATURE NAMES FILES (names.json)
When you generate JSON for a track, if you specify "autocomplete" then a listing of all of the names/IDs from that track (along with the locations of the corresponding features) will also be generated.

<!--/data/apps/jbrowse/1.2.6/bin/generate-names.pl \
--dir /home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19
-->

TESTING addRemoveFeatures.pl
----------------------------

PURPOSE:

ADD TRACK INFO FROM FEATURE'S trackData.json FILE
/data/jbrowse/ucsc/human/hg19/jbrowse/chr1/data/tracks/chr1/simpleRepeat/trackData.json

{"histogramMeta":[{"basesPerBin":"5000","arrayParams":{"length":50848,"chunkSize":10000,"urlTemplate":"hist-5000-{chunk}.json"}},{"basesPerBin":"50000","arrayParams":{"length":5085,"chunkSize":10000,"urlTemplate":"hist-50000-{chunk}.json"}}],"subfeatureClasses":null,"headers":["start","end","strand","id","name","type","alias"],"histStats":[{"bases":5000,"max":67,"mean":2.45929043423537},{"bases":10000,"max":74,"mean":3.88872718691001},{"bases":20000,"max":86,"mean":6.74921334172435},{"bases":50000,"max":89,"mean":15.3203539823009},{"bases":100000,"max":141,"mean":29.6075501376327},{"bases":200000,"max":197,"mean":58.1650943396226},{"bases":500000,"max":387,"mean":143.783889980354},{"bases":1000000,"max":701,"mean":285.996078431373},{"bases":2000000,"max":1136,"mean":568.75},{"bases":5000000,"max":2705,"mean":1425.94117647059},{"bases":10000000,"max":5189,"mean":2796}],"featureNCList":[[-1,254235635,{"chunk":0}]],"key":"simpleRepeat","sublistIndex":7,"lazyIndex":2,"featureCount":72671,"className":"feature2","clientConfig":null,"arrowheadClass":null,"subfeatureHeaders":["start","end","strand","type"],"urlTemplate":"http://url/index?id={alias}","type":"FeatureTrack","label":"simpleRepeat","lazyfeatureUrlTemplate":"lazyfeatures-{chunk}.json"}


TO CHROMOSOME'S trackInfo.js FILE
/home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/data/trackInfo.js

    ...    
       },
       {
          "url" : "data/tracks/{refseq}/geneid/trackData.json",
          "label" : "geneid",
          "type" : "FeatureTrack",
          "key" : "Geneid Genes"
       },
       {
          "url" : "data/tracks/{refseq}/exoniphy/trackData.json",
          "type" : "FeatureTrack",
          "label" : "exoniphy",
          "key" : "Exoniphy"
       }
    ]


COPY FILES TO TEST DIR:

cp /data/jbrowse/ucsc/human/hg19/jbrowse/chr1/data/tracks/chr1/simpleRepeat/trackData.json \
/home/syoung/0.6/bin/apps/t/Agua/view/addTrackdata

cp /home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/data/trackInfo.js \
/home/syoung/0.6/bin/apps/t/Agua/view/addTrackdata

TEST addTrackdata METHOD

cd /home/syoung/0.6/bin/apps/t/Agua
./view.t


REMOVE trackData.json FROM THIS EXISTING FEATURE
/home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1/cytoBand/tracksData.json

FROM
/home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/data/trackInfo.js


cp /home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1/cytoBand/trackData.json \
/home/syoung/0.6/bin/apps/t/Agua/view/addTrackdata/trackData-remove.json



TROUBLESHOOTING generate-names.pl
---------------------------------

cd /home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19

/data/apps/jbrowse/1.2.6/bin/generate-names.pl \
-v /home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1/*/names.json
    ...
    subtree for              tr   has        396  in chunk,        396  total
    subtree for               t   has       1852  in chunk,       2969  total
    subtree for               u   has        596  in chunk,        596  total
    subtree for               v   has        317  in chunk,        317  total
    subtree for               w   has        440  in chunk,        440  total
    subtree for             zfp   has        531  in chunk,        531  total
    subtree for               z   has        466  in chunk,        997  total
    746258 total names, with 484 in the root chunk


<!--/nethome/syoung/base/apps/aqwa/0.4/html/plugins/view/jbrowse/bin/generate-names.pl \
-v /nethome/syoung/base/pipeline/jbrowse/ucsc/reference/chr1/data/tracks/*/*/names.json
-->


WHICH DID NOT CHANGE root.json IN THE names DIRECTORY:

COMPARE root.json AND root.bkp.json:

cd /home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/names
diff root.json root.bkp.json
    **NO DIFF OUTPUT **


... BECAUSE generate-names.pl READS THE trackInfo.js FILE TO GET THE NAMES OF THE TRACKS.

TEST THIS BY MOVING THE trackInfo.js FILE AND RUNNING generate-names.pl AGAIN:

cd /home/syoung/0.6/html/plugins/view/jbrowse/species/human/hg19/names





{ "histogramMeta": [ { "basesPerBin": "5000", "arrayParams": { "length": 50848, "chunkSize": 10000, "urlTemplate": "hist-5000-{chunk}.json" } }, { "basesPerBin": "50000", "arrayParams": { "length": 5085, "chunkSize": 10000, "urlTemplate": "hist-50000-{chunk}.json" } } ], "subfeatureClasses": "null", "headers": [ "start", "end", "strand", "id", "name", "type", "alias" ], "histStats": [ { "bases": 5000, "max": 67, "mean": 2.45929043423537 }, { "bases": 10000, "max": 74, "mean": 3.88872718691001 }, { "bases": 20000, "max": 86, "mean": 6.74921334172435 }, { "bases": 50000, "max": 89, "mean": 15.3203539823009 }, { "bases": 100000, "max": 141, "mean": 29.6075501376327 }, { "bases": 200000, "max": 197, "mean": 58.1650943396226 }, { "bases": 500000, "max": 387, "mean": 143.783889980354 }, { "bases": 1000000, "max": 701, "mean": 285.996078431373 }, { "bases": 2000000, "max": 1136, "mean": 568.75 }, { "bases": 5000000, "max": 2705, "mean": 1425.94117647059 }, { "bases": 10000000, "max": 5189, "mean": 2796 } ], "featureNCList": [ [ -1, 254235635, { "chunk": 0 } ] ], "key": "simpleRepeat", "sublistIndex": 7, "lazyIndex": 2, "featureCount": 72671, "className": "feature2", "clientConfig": null, "arrowheadClass": null, "subfeatureHeaders": [ "start", "end", "strand", "type" ], "urlTemplate": "http://url/index?id={alias}", "type": "FeatureTrack", "label": "simpleRepeat", "lazyfeatureUrlTemplate": "lazyfeatures-{chunk}.jso















./generate-names.pl -v
Can't find directory "data".
Run this program from a different working directory,
or specify the location of the output directory with
the --dir command line option.


generate-names.pl script collects those lists of names from all the tracks and combines them into one big tree that the client uses to search.

generate-names.pl -v

Visit in web browser, search for feature name: e.g.,

maker-scf1117875582023-snap-gene-0.3





/nethome/bioinfo/apps/agua/0.6/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.6/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.6/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.6/mouse/mm9/json \
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
    generateFeatures.pl    Run time: 00:07:56
    generateFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.6/bin/apps/generateFeatures.pl
    generateFeatures.pl    10-06-07 09:27:51
    generateFeatures.pl    ****************************************


</entry>


<entry [Wed Mar  2 11:35:28 EST 2011] COPY OF /data/jbrowse/ucsc/human/hg19/jbrowse.json>

{
    "description": "Agua Genomic Feature Database",
    "db_adaptor": "Bio::DB::SeqFeature::Store",
    "db_args": { "-adaptor": "memory",
                 "-dir": "docs/tutorial/data_files" },
    
    "TRACK DEFAULTS": {
      "class": "feature",
      "autocomplete": "all"
    },

    "tracks": [
    {
      "track": "match",
      "key": "Matches",
      "feature": ["match"],
      "autocomplete": "all",
      "subfeatures": true,
      "class": "generic_parent",
      "subfeature_classes": {
          "match_part": "match_part"
      "clientConfig": {
          "subfeatureScale": 20
      }
    },
    {
      "track": "ccdsGene",
      "feature": ["ccdsGene"],
      "class": "exon",
      "key": "ccdsGene"
      "category": "gene",
    },
    {
      "track": "cytoBand",
      "feature": ["cytoBand"],
      "class": "basic",
      "key": "cytoBand"
      "category": "topology",
    },
    {
      "track": "cytoBandIdeo",
      "feature": ["cytoBandIdeo"],
      "class": "basic",
      "key": "cytoBandIdeo"
      "category": "topology",
    },
    {
      "track": "cpgIslandExt",
      "feature": ["cpgIslandExt"],
      "class": "dblhelix",
      "key": "cpgIslandExt"
      "category": "topology",
    },
    {
      "track": "dgv",
      "feature": ["dgv"],
      "class": "triangle hgred",
      "key": "dgv"
      "category": "variation",
    },
    {
      "track": "ensGene",
      "feature": ["ensGene"],
      "class": "transcript",
      "key": "ensGene"
      "category": "gene",
    },
    {
      "track": "exoniphy",
      "feature": ["exonify"],
      "class": "exon",
      "key": "exoniphy"
      "category": "exon",
    },
    {
      "track": "gap",
      "feature": ["gap"],
      "class": "basic",
      "key": "gap"
      "category": "topology",
    },
    {
      "track": "gold",
      "feature": ["gold"],
      "class": "feature2",
      "key": "gold"
      "category": "assembly",
    },
    {
      "track": "geneid",
      "feature": ["geneid"],
      "class": "feature2",
      "key": "geneid"
      "category": "gene",
    },
    {
      "track": "genomicSuperDups",
      "feature": ["genomicSuperDups"],
      "class": "feature2",
      "key": "genomicSuperDups"
      "category": "topology",
    },
    {
      "track": "gwasCatalog",
      "feature": ["gwasCatalog"],
      "class": "feature2",
      "key": "gwasCatalog"
      "category": "variation",
    },
    {
      "track": "hgIkmc",
      "feature": ["hgIkmc"],
      "class": "feature2",
      "key": "hgIkmc"
      "category": "gene",
    },
    {
      "track": "hinv70Coding",
      "feature": ["hinv70Coding"],
      "class": "feature2",
      "key": "hinv70Coding"
      "category": "gene",
    },
    {
      "track": "hinv70NonCoding",
      "feature": ["hinv70NonCoding"],
      "class": "feature2",
      "key": "hinv70NonCoding"
      "category": "gene",
    },
    {
      "track": "hinv70PseudoGene",
      "feature": ["hinv70PseudoGene"],
      "class": "feature2",
      "key": "hinv70PseudoGene"
      "category": "gene",
    },
    {
      "track": "knownAlt",
      "feature": ["knownAlt"],
      "class": "feature2",
      "key": "knownAlt"
      "category": "gene",
    },
    {
      "track": "knownGene",
      "feature": ["knownGene"],
      "class": "feature2",
      "key": "knownGene"
      "category": "gene",
    },
    {
      "track": "microsat",
      "feature": ["microsat"],
      "class": "feature2",
      "key": "microsat"
      "category": "micro",
    },
    {
      "track": "nestedRepeats",
      "feature": ["nestedRepeats"],
      "class": "feature2",
      "key": "nestedRepeats"
      "category": "repeat",
    },
    {
      "track": "nscanGene",
      "feature": ["nscanGene"],
      "class": "feature2",
      "key": "nscanGene"
      "category": "gene",
    },
    {
      "track": "omimGene",
      "feature": ["omimGene"],
      "class": "feature2",
      "key": "omimGene"
      "category": "gene",
    },
    {
      "track": "pgNA12878",
      "feature": ["pgNA12878"],
      "class": "feature2",
      "key": "pgNA12878"
      "category": "variation",
    },
    {
      "track": "pgNA12891",
      "feature": ["pgNA12891"],
      "class": "feature2",
      "key": "pgNA12891"
      "category": "variation",
    },
    {
      "track": "pgNA12892",
      "feature": ["pgNA12892"],
      "class": "feature2",
      "key": "pgNA12892"
      "category": "variation",
    },
    {
      "track": "pgNA19240",
      "feature": ["pgNA19240"],
      "class": "feature2",
      "key": "pgNA19240"
      "category": "variation",
    },
    {
      "track": "pgYoruban3",
      "feature": ["pgYoruban3"],
      "class": "feature2",
      "key": "pgYoruban3"
      "category": "variation",
    },
    {
      "track": "pgYh1",
      "feature": ["pgYh1"],
      "class": "feature2",
      "key": "pgYh1"
      "category": "variation",
    },
    {
      "track": "pgSjk",
      "feature": ["pgSjk"],
      "class": "feature2",
      "key": "pgSjk"
      "category": "variation",
    },
    {
      "track": "refGene",
      "feature": ["refGene"],
      "class": "feature2",
      "key": "refGene"
      "category": "gene",
    },
    {
      "track": "rmsk",
      "feature": ["rmsk"],
      "class": "feature2",
      "key": "rmsk"
      "category": "repeat",
    },
    {
      "track": "sgpGene",
      "feature": ["sgpGene"],
      "class": "feature2",
      "key": "sgpGene"
      "category": "gene",
    },
    {
      "track": "simpleRepeat",
      "feature": ["simpleRepeat"],
      "class": "feature2",
      "key": "simpleRepeat"
      "category": "repeat",
    },
    {
      "track": "snp131",
      "feature": ["snp131"],
      "class": "feature2",
      "key": "snp131"
      "category": "variation",
    },
    {
      "track": "snp130",
      "feature": ["snp130"],
      "class": "feature2",
      "key": "snp130"
      "category": "variation",
    },
    {
      "track": "tRNAs",
      "feature": ["tRNAs"],
      "class": "feature2",
      "key": "tRNAs"
      "category": "rna",
    },
    {
      "track": "vegaGene",
      "feature": ["vegaGene"],
      "class": "feature2",
      "key": "vegaGene"
      "category": "gene",
    },
    {
      "track": "vegaPseudoGene",
      "feature": ["vegaPseudoGene"],
      "class": "feature2",
      "key": "vegaPseudoGene"
      "category": "gene",
    },
    {
      "track": "wgEGAutoV4",
      "feature": ["wgEGAutoV4"],
      "class": "feature2",
      "key": "wgEGAutoV4"
      "category": "gene",
    },
    {
      "track": "wgEGPolyaV4",
      "feature": ["wgEGPolyaV4"],
      "class": "feature2",
      "key": "wgEGPolyaV4"
      "category": "gene",
    },
    {
      "track": "wgEG2wayConsPseudoV4",
      "feature": ["wgEG2wayConsPseudoV4"],
      "class": "feature2",
      "key": "wgEG2wayConsPseudoV4"
      "category": "gene",
    },
    {
      "track": "wgRNA",
      "feature": ["wgRNA"],
      "class": "wgRNA",
      "key": "feature2"
      "category": "rna",
    },



    {
      "track": "ExampleFeatures",
      "key": "Example Features",
      "feature": ["remark"],
      "autocomplete": "all",
      "class": "feature2"
    },
    {
      "track": "NameTest",
      "feature": ["protein_coding_primary_transcript", "polypeptide"],
      "class": "feature2",
      "key": "Name test track"
    },
    {
      "track": "Motifs",
      "feature": ["polypeptide_domain"],
      "class": "feature3",
      "description": 1,
      "key": "Example motifs"
    },
    {
      "track": "Alignments",
      "feature": ["match"],
      "class": "feature4",
      "key": "Example alignments",
      "category": "Alignments"
    },
    {
      "track": "Genes",
      "feature": ["gene"],
      "class": "feature5",
      "key": "Protein-coding genes"
    },
    {
      "track": "ReadingFrame",
      "feature": ["mRNA"],
      "class": "dblhelix",
      "key": "Frame usage",
      "category": "Genes"
    },
    {
      "track": "CDS",
      "feature": ["CDS:predicted", "mRNA:exonerate"],
      "class": "cds",
      "phase": 1,
      "key": "Predicted genes",
      "category": "Genes"
    },
    {
      "track": "Transcript",
      "feature": ["mRNA:exonerate"],
      "description": 1,
      "class": "transcript",
      "subfeatures": true,
      "subfeature_classes": {
        "CDS": "transcript-CDS",
        "UTR": "transcript-UTR"
      },
      "arrowheadClass": "transcript-arrowhead",
      "key": "Exonerate predictions",
      "category": "Genes"
    },
    {
      "track": "Clones",
      "feature": ["BAC"],
      "class": "exon",
      "description": 1,
      "key": "Fingerprinted BACs"
    },
    {
      "track": "EST",
      "feature": ["EST_match:est"],
      "class": "est",
      "key": "ESTs"
    }

  ]
}



    
    
</entry>

<entry [Wed Mar  2 11:34:28 EST 2011] ADDED jbrowse.json FILE TO generateFeatures.pl>

FROM http://jbrowse.org/code/jbrowse-master/docs/featureglyphs.html
AND http://gmod.org/wiki/JBrowse_Tutorial
AND plugins/view/css/genome.css


ADD urlTemplate
---------------



//          "urlTemplate": "http://url/index?id={alias}", 
//          "extraData": {"alias": "sub {shift->attributes(\"load_id\");}"} 
          





JBROWSE CONFIG EXAMPLES
-----------------------

NB: The 'feature' values correspond to the 3rd column of the GFF file describing the line entry. 

"class" specifies the CSS class that describes how the feature should loo 

    {
      "track": "NameTest",
      "feature": ["protein_coding_primary_transcript", "polypeptide"],
      "class": "feature2",
      "key": "Name test track"
    },




Mariette Feb 23, 2011; 12:55pm [Gmod-ajax] extraData Reply | Threaded | More     

31 posts
Hi everyone, 
I have a jbrowse track where features have a urlTemplate, 
so my config file looks like this : 

{ 
  "description": "data", 
  "db_adaptor": "Bio::DB::SeqFeature::Store", 
  "db_args": { "-adaptor": "memory", 
               "-dir": "/path/" }, 

  "TRACK DEFAULTS": { 
    "class": "feature", 
    "autocomplete": "all" 
  }, 

  "tracks": [ 
    { 
      "track": "ncRNA", 
      "key": "ncRNA", 
      "feature": ["ncRNA"], 
      "class": "feature5", 
      "urlTemplate": "http://url/index?id={name}", 
    } 
  ] 
} 
what is working with a gff looking like this : 
sample    tRNAscan-SE    ncRNA    16995    17070    91.83    +    .     
Name=000002 
sample    tRNAscan-SE    ncRNA    17079    17163    67.63    +    .     
Name=000003 
... 

however, I'd like the display name is different than the link value ! So 
I change for this : 

  "tracks": [ 
    { 
      "track": "ncRNA", 
      "key": "ncRNA", 
      "feature": ["ncRNA"], 
      "class": "feature5", 
      "urlTemplate": "http://url/index?id={load_id}", 
      "extraData": {"load_id": "sub {shift->attributes(\"load_id\");}"} 
    } 
with this gff : 
sample    tRNAscan-SE    ncRNA    16995    17070    91.83    +    .     
Name=test1;load_id=000002 
sample    tRNAscan-SE    ncRNA    17079    17163    67.63    +    .     
Name=test2;load_id=000003 
... 


In the trackData.json, I do have the header looking like this : 
"headers":["start","end","strand","id","name","load_id"] 

but the values doesn't integrate the load_id ! I'm guessing the probleme 
is coming from the sub but I have no idea how to fixe this. 
any help, 
thx, 

Jerome 

_______________________________________________ 
Gmod-ajax mailing list 
[hidden email] 
https://lists.sourceforge.net/lists/listinfo/gmod-ajax
Mariette Feb 24, 2011; 04:05am Re: extraData Reply | Threaded | More     

31 posts

ok I use "alias" instead of "load_id" (which was used in a jbrowse exemple) 
and it's working just fine ! 

thx, 
Jerome 

    
</entry>

<entry [Tue Mar  1 14:11:27 EST 2011] COPY OF /home/young/0.6/html/pages/jbrowse-features.tsv>

Feature	Added	Type	Class	Description
ccdsGene	*	EXON	exon	
cytoBand		TOPOLOGY	basic	
cytoBandIdeo		TOPOLOGY	basic	
cpgIslandExt		TOPOLOGY	dblhelix	
dgv		VARIATION	triangle hgred	
ensGene	*	GENE	transcript	
exoniphy		EXON	exon	
gap		TOPOLOGY	basic	
gold		ASSEMBLY	feature2	  Schema for Assembly - Assembly from Fragments
geneid		GENE	transcript	
genomicSuperDups		TOPOLOGY	dblhelix	
gwasCatalog		VARIATION	triangle hgred	
hgIkmc		GENE	transcript	Schema for IKMC Genes Mapped - International Knockout Mouse Consortium Genes Mapped to Human Genome
hinv70Coding	*	GENE	transcript	Haemophilus influenzae
hinv70NonCoding	*	GENE	transcript	
hinv70PseudoGene	*	GENE	transcript	
knownAlt		GENE	transcript	
knownGene		GENE	transcript	
microsat	*	MICRO	triangle hgblue	
nestedRepeats	*	REPEAT	dblhelix	
nscanGene		GENE	transcript	
omimGene		GENE	transcript	
pgNA12878	*	VARIATION	triangle hgred	CEU daughter
pgNA12891	*	VARIATION	triangle hgred	CEU father
pgNA12892 (CEU mother)'	*	VARIATION	triangle hgred	CEU mother
pgNA19240 (YRI daugher)	*	VARIATION	triangle hgred	Personal genome variants
pgYoruban3 (YRI 18507)	*	VARIATION	triangle hgred	Personal genome variants
pgYh1 (YanHuang)	*	VARIATION	triangle hgred	Personal genome variants
pgSjk (SJK)	*	VARIATION	triangle hgred	Personal genome variants
refGene		GENE	transcript	
rmsk Repeat Masker	*	REPEAT	dblhelix	
sgpGene		GENE	transcript	SGP Gene Predictions Using Mouse/Human Homology
simpleRepeat	*	REPEAT	dblhelix	
snp131	*	VARIATION	triangle hgred	
snp130	*	VARIATION	triangle hgred	
tRNAs		RNA	triangle hgblue	
vegaGene		GENE	transcript	
vegaPseudoGene		GENE	transcript	
wgEncodeGencodeAutoV4		GENE	transcript	  Schema for Gencode Genes - ENCODE Gencode Gene Annotations
wgEncodeGencodePolyaV4		GENE	transcript	  Schema for Gencode Genes - ENCODE Gencode Gene Annotations
wgEncodeGencode2wayConsPseudoV4		GENE	transcript	  Schema for Gencode Genes - ENCODE Gencode Gene Annotations
wgRNA (sno/miRNA)		RNA	triangle hgblue	


  
    
</entry>

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

<entry [Wed Mar  2 21:26:48 EST 2011] DOWNLOADED GFF FILES>
  
ORDERED BY SIZE:

NOTE THAT THE SNP FILES ARE MUCH LARGER THAN THE OTHER ANNOTATION TYPES

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


  
    
</entry>


<entry [Wed Mar  2 21:25:48 EST 2011] BED format>
  	
 	
BED format provides a flexible way to define the data lines that are displayed in an annotation track. BED lines have three required fields and nine additional optional fields. The number of fields per line must be consistent throughout any single set of data in an annotation track. The order of the optional fields is binding: lower-numbered fields must always be populated if higher-numbered fields are used.

The first three required BED fields are:

chrom - The name of the chromosome (e.g. chr3, chrY, chr2_random) or scaffold (e.g. scaffold10671).
chromStart - The starting position of the feature in the chromosome or scaffold. The first base in a chromosome is numbered 0.
chromEnd - The ending position of the feature in the chromosome or scaffold. The chromEnd base is not included in the display of the feature. For example, the first 100 bases of a chromosome are defined as chromStart=0, chromEnd=100, and span the bases numbered 0-99.
The 9 additional optional BED fields are:

name - Defines the name of the BED line. This label is displayed to the left of the BED line in the Genome Browser window when the track is open to full display mode or directly to the left of the item in pack mode.
score - A score between 0 and 1000. If the track line useScore attribute is set to 1 for this annotation data set, the score value will determine the level of gray in which this feature is displayed (higher numbers = darker gray). This table shows the Genome Browser's translation of BED score values into shades of gray:
shade	 	 	 	 	 	 	 	 	 
score in range  	? 166	167-277	278-388	389-499	500-611	612-722	723-833	834-944	? 945
strand - Defines the strand - either '+' or '-'.
thickStart - The starting position at which the feature is drawn thickly (for example, the start codon in gene displays).
thickEnd - The ending position at which the feature is drawn thickly (for example, the stop codon in gene displays).
itemRgb - An RGB value of the form R,G,B (e.g. 255,0,0). If the track line itemRgb attribute is set to "On", this RBG value will determine the display color of the data contained in this BED line. NOTE: It is recommended that a simple color scheme (eight colors or less) be used with this attribute to avoid overwhelming the color resources of the Genome Browser and your Internet browser.
blockCount - The number of blocks (exons) in the BED line.
blockSizes - A comma-separated list of the block sizes. The number of items in this list should correspond to blockCount.
blockStarts - A comma-separated list of block starts. All of the blockStart positions should be calculated relative to chromStart. The number of items in this list should correspond to blockCount.
Example:
Here's an example of an annotation track that uses a complete BED definition:

track name=pairedReads description="Clone Paired Reads" useScore=1
chr22 1000 5000 cloneA 960 + 1000 5000 0 2 567,488, 0,3512
chr22 2000 6000 cloneB 900 - 2000 6000 0 2 433,399, 0,3601


BED detail format	
----------------- 	
This is an extension of BED format. BED detail uses the first 4 to 12 columns of BED format, plus 2 additional fields that are used to enhance the track details pages. The first additional field is an ID, which can be used in place of the name field for creating links from the details pages. The second additional field is a description of the item, which can be a long description and can consist of html, including tables and lists.

Requirements for BED detail custom tracks are: fields must be tab-separated, "type=bedDetail" must be included in the track line, and the name and position fields should uniquely describe items so that the correct ID and description will be displayed on the details pages.

Example:
This example uses the first 4 columns of BED format, but up to 12 may be used. Note that line breaks have been inserted into the track line in this example for documentation display purposes. Click here to view this track in the Genome Browser.

track name=HbVar type=bedDetail description="HbVar custom track" db=hg19 visibility=3
url="http://globin.bx.psu.edu/cgi-bin/hbvar/query_vars3?display_format=page&mode=output&id=$$"
chr11   5246919 5246920 Hb_North_York   2619    Hemoglobin variant
chr11   5255660 5255661 HBD c.1 G>A     2659    delta0 thalassemia
chr11   5247945 5247946 Hb Sheffield    2672    Hemoglobin variant
chr11   5255415 5255416 Hb A2-Lyon      2676    Hemoglobin variant
chr11   5248234 5248235 Hb Aix-les-Bains        2677    Hemoglobin variant

  
    
</entry>


<entry [Wed Mar  2 21:24:48 EST 2011] flatfile-to-json.pl OPTIONS>
  
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

flatfile-to-json USAGE
<!--
    print <<USAGE;
USAGE: $0 [--gff <gff3 file> | --gff2 <gff2 file> | --bed <bed file>] [--out <output directory>] --tracklabel <track identifier> --key <human-readable track name> [--cssClass <CSS class for displaying features>] [--autocomplete none|label|alias|all] [--getType] [--getPhase] [--getSubs] [--getLabel] [--urltemplate "http://example.com/idlookup?id={id}"] [--extraData <attribute>] [--subfeatureClasses <JSON-syntax subfeature class map>] [--clientConfig <JSON-syntax extra configuration for FeatureTrack>]

    --out: defaults to "data"
    --cssClass: defaults to "feature"
    --autocomplete: make these features searchable by their "label", by their "alias"es, both ("all"), or "none" (default).
    --getType: include the type of the features in the json
    --getPhase: include the phase of the features in the json
    --getSubs:  include subfeatures in the json
    --getLabel: include a label for the features in the json
    --urltemplate: template for a URL that clicking on a feature will navigate to
    --arrowheadClass: CSS class for arrowheads
    --subfeatureClasses: CSS classes for each subfeature type, in JSON syntax
        e.g. '{"CDS": "transcript-CDS", "exon": "transcript-exon"}'
    --clientConfig: extra configuration for the client, in JSON syntax
        e.g. '{"featureCss": "background-color: #668; height: 8px;", "histScale": 2}'
    --type: only process features of the given type
    --nclChunk: NCList chunk size; if you get "json text or perl structure exceeds maximum nesting level" errors, try setting this lower (default: $nclChunk)
    --extraData: a map of feature attribute names to perl subs that extract information from the feature object
        e.g. '{"protein_id" : "sub {shift->attributes(\"protein_id\");} "}'
    --compress: compress the output (requires some web server configuration)
    --sortMem: the amount of memory in bytes to use for sorting
USAGE

-->

  
    
</entry>
<entry [Mon Feb 28 22:44:25 EST 2011] clientConfig FEATURE OF JSON FEATURES>


emacs /home/syoung/0.5/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1/ccdsGene

{"histogramMeta":[{"basesPerBin":"500000","arrayParams":{"length":499,"chunkSize":10000,"urlTemplate":"data/tracks/chr1/ccdsGene/hist-500000-{chunk}.json"}}],"subfeatureClasses":{"CDS":"transcript-CDS","UTR":"transcript-UTR"},"headers":["start","end","strand","name","score","name2","cdsEndStat","exonFrames","cdsStartStat","subfeatures"],"lazyIndex":2,"featureCount":2513,"histStats":[{"bases":"500000","max":46,"mean":5.49298597194389},{"bases":1000000,"max":58,"mean":10.964},{"bases":2500000,"max":113,"mean":27.41},{"bases":5000000,"max":202,"mean":54.82},{"bases":10000000,"max":374,"mean":109.64},{"bases":25000000,"max":563,"mean":274.1},{"bases":50000000,"max":873,"mean":548.2},{"bases":100000000,"max":1233,"mean":913.666666666667}],"featureNCList":[[69090,20445992,{"chunk":"1"}],[20465920,38489301,{"chunk":"2"}],[38511059,67266905,{"chunk":"3"}],[67279812,113161736,{"chunk":"4"}],[113162466,154520187,{"chunk":"5"}],[154479379,168513203,{"chunk":"6"}],[168545875,207966941,{"chunk":"7"}],[207925557,249212563,{"chunk":"8"}]],"key":"CCDS","className":"generic_parent","clientConfig":{"featureCallback":"(function(feat, fields, div) {\n    if (fields.type) {\n        div.className = \"basic\";\n        switch (feat[fields.type]) {\n        case \"CDS\":\n        case \"thick\":\n            div.style.height = \"10px\";\n            div.style.marginTop = \"-3px\";\n            break;\n        case \"UTR\":\n        case \"thin\":\n   div.style.height = \"6px\";\n            div.style.marginTop = \"-1px\";\n            break;\n        }\n        div.style.backgroundColor = \"#0c780c\";\n    }\n}\n)"},"arrowheadClass":"transcript-arrowhead","subfeatureHeaders":["start","end","strand","type"],"label":"ccdsGene","type":"FeatureTrack","sublistIndex":10,"lazyfeatureUrlTemplate":"data/tracks/chr1/ccdsGene/lazyfeatures-{chunk}.json"}


EXTRACTED OUT clientConfig:

"clientConfig":{"featureCallback":"(function(feat, fields, div) {
    if (fields.type) {
        div.className = \"basic\";
        switch (feat[fields.type]) {
        case \"CDS\":
        case \"thick\":
            div.style.height = \"10px\";
            div.style.marginTop = \"-3px\";
            break;
        case \"UTR\":
        case \"thin\":
   div.style.height = \"6px\";
            div.style.marginTop = \"-1px\";
            break;
        }
        div.style.backgroundColor = \"#0c780c\";
    }
}
)"},"arrowheadClass":"transcript-arrowhead","subfeatureHeaders":["start","end","strand","type"],"label":"ccdsGene","type":"FeatureTrack","sublistIndex":10,"lazyfeatureUrlTemplate":"data/tracks/chr1/ccdsGene/lazyfeatures-{chunk}.json"}


WHICH APPEARS EXCLUSIVELY IN FeatureTrack.js:


LINE 52
FeatureTrack.prototype.loadSuccess = function(trackInfo) {
    var startTime = new Date().getTime();
    
LINE 89
    ...
    if (trackInfo.clientConfig) {
        var cc = trackInfo.clientConfig;
        var density = trackInfo.featureCount / this.refSeq.length;
        this.histScale = (cc.histScale ? cc.histScale : 4) * density;
        this.labelScale = (cc.labelScale ? cc.labelScale : 50) * density;
        this.subfeatureScale = (cc.subfeatureScale ? cc.subfeatureScale : 80)
                                   * density;
        if (cc.featureCss) this.featureCss = cc.featureCss;
        if (cc.histCss) this.histCss = cc.histCss;
        if (cc.featureCallback) {
            try {
                this.featureCallback = eval("(" + cc.featureCallback + ")");
            } catch (e) {
                console.log("eval failed for featureCallback on track " + this.name + ": " + cc.featureCallback);
            }
        }
    }
    //console.log((new Date().getTime() - startTime) / 1000);

    var fields = this.fields;
    if (! trackInfo.urlTemplate) {
        this.onFeatureClick = function(event) {
            event = event || window.event;
	    if (event.shiftKey) return;
	    var elem = (event.currentTarget || event.srcElement);
            //depending on bubbling, we might get the subfeature here
            //instead of the parent feature
            if (!elem.feature) elem = elem.parentElement;
            if (!elem.feature) return; //shouldn't happen; just bail if it does
            var feat = elem.feature;
	    alert("clicked on feature\nstart: " + feat[fields["start"]] +
	          ", end: " + feat[fields["end"]] +
	          ", strand: " + feat[fields["strand"]] +
	          ", label: " + feat[fields["name"]] +
	          ", ID: " + feat[fields["id"]]);
        };
    }

    this.setLoaded();
};




</entry>


<entry [Mon Feb 28 22:44:25 EST 2011] INSTALLED JBROWSE PERL DEPENDENCIES ON UBUNTU>


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



</entry>


<entry [Mon Feb 28 21:44:25 EST 2011] INSTALLED JBROWSE PERL DEPENDENCIES ON UBUNTU>


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


NOT SURE IF ITS COMPATIBLE WITH VERSION 1.2 (SEE ABOVE)

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



<entry [Wed Dec 22 19:40:31 EST 2010] JBROWSE hg19-min>

JBrowse tarball for hg19 human genome data
http://jbrowse.org/?p=111

Posted on November 11, 2010 by jbrowse
Something we get asked for a lot is data releases: tarballs of JBrowse JSON pre-generated from widely-used datasets, ready for you to plonk on your webserver, unzip, and serve to the world (perhaps after adding your own tracks, or making other modifications).

Data releases are good because they make it even easier to deploy JBrowse on your website, while illustrating what we consider best practices in using the JBrowse setup scripts.

Doing this right takes time, but it didn't seem fair in the meantime to deprive people of the JSON files we've generated to run our demos. Particularly the human genome demo  there have been several requests for the data files underpinning that.

So, without further ado, here is a tarball of the UCSC hg19 annotation tracks. At least, some of them: we've tried to keep this tarball small. It's 62 megabytes compressed; 330 megabytes uncompressed; it has the smallest 27 annotation tracks, and in order to keep the size down, we didn't include actual sequence (just the locations of features like genes).

This demo should not be considered a final-quality data release. Some things aren't set up as nicely as we'd like; for example, the outgoing links from features. However, if you're interested in exploring using JBrowse for human applications (e.g. like genomesunzipped), this might help get you started.

</entry>

<entry [Thurs Jun 17 01:45:02 EDT 2010] SAMPLE generateFeatures.pl RUN>



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
Job < 682572 > is submitted to queue < large >.
Job < 682573 > is submitted to queue < large >.
Job < 682574 > is submitted to queue < large >.
Job < 682575 > is submitted to queue < large >.
Job < 682576 > is submitted to queue < large >.
Job < 682577 > is submitted to queue < large >.
Job < 682578 > is submitted to queue < large >.
Job < 682579 > is submitted to queue < large >.
Job < 682580 > is submitted to queue < large >.
Job < 682581 > is submitted to queue < large >.
Job < 682582 > is submitted to queue < large >.
Job < 682583 > is submitted to queue < large >.
Job < 682584 > is submitted to queue < large >.
Job < 682585 > is submitted to queue < large >.
Job < 682586 > is submitted to queue < large >.
Job < 682587 > is submitted to queue < large >.
Job < 682588 > is submitted to queue < large >.
Job < 682589 > is submitted to queue < large >.
Job < 682590 > is submitted to queue < large >.
Job < 682591 > is submitted to queue < large >.
Job < 682592 > is submitted to queue < large >.
Job < 682593 > is submitted to queue < large >.
Cluster::runJobs    Completed generateFeatures at 10-06-07 00:03:47, duration: 00:00:34
Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
JBrowse::runFlatfileToJson    Completed conversion from SAM to TSV files
JBrowse::generateFeatures    Completed
generateFeatures.pl    Run time: 00:00:34
generateFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl
generateFeatures.pl    10-06-07 00:03:47
generateFeatures.pl    ****************************************




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

/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename allenbrain.gff \
--label allenbrain \
--key allenbrain \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename ccds.gff \
--label ccds \
--key ccds \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename microsatellite.gff \
--label microsatellite \
--key microsatellite \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename mrnas.gff \
--label mrnas \
--key mrnas \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/mouse/mm9/json \
--filetype gff \
--filename refseq.gff \
--label refseq \
--key refseq \
--queue large \
--cluster LSF

/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
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
    generateFeatures.pl    Run time: 00:37:46
    generateFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl
    generateFeatures.pl    10-06-07 01:16:02
    generateFeatures.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
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
    generateFeatures.pl    Run time: 00:03:04
    generateFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl
    generateFeatures.pl    10-06-07 09:23:53
    generateFeatures.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
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
    generateFeatures.pl    Run time: 04:16:33
    generateFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl
    generateFeatures.pl    10-06-07 05:02:04
    generateFeatures.pl    ****************************************



/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
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
    generateFeatures.pl    Run time: 00:07:56
    generateFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl
    generateFeatures.pl    10-06-07 09:27:51
    generateFeatures.pl    ****************************************



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

/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
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



/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-CpG.gff \
--label CpG \
--key CpG \
--queue large \
--cluster LSF


/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-refGene.gff \
--label refGene \
--key refGene \
--queue large \
--cluster LSF


/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-rgdQtl.gff \
--label rgdQtl \
--key rgdQtl \
--queue large \
--cluster LSF


/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
--refseqfile /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/refSeqs.js \
--inputdir /nethome/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/gff \
--outputdir /scratch/syoung/base/pipeline/jbrowse/ucsc/0.5/rat/rn4/json \
--filetype gff \
--filename rn4-snp125.gff \
--label snp125 \
--key snp125 \
--queue large \
--cluster LSF


/nethome/bioinfo/apps/agua/0.5/bin/apps/generateFeatures.pl \
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



