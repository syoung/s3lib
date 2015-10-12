Notes-project04-comparison.txt





CREATED binBam.pl TO BIN *bam FILE HITS ACCORDING TO UCSC BINNING SYSTEM

    -   DIVIDE UP hit.bam FILES INTO BINS BY CHROMOSOMAL POSITION
    
    -   WIDTH OF THE BINS IS DEFINED BY THE SPECIFIED BIN LEVEL

    -   USE BIN LEVEL 2 (8 Mbp BINS) FOR ALL CHROMOSOMES

    -   ADD binlevel, binnumber AND totalbins TO BINNED *bam FILE NAME


/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/33 \
--binlevel 2 \
--reference chr22 \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF 

    binBam.pl    Run time: 00:03:19
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    12:37AM, 29 November 2010
    binBam.pl    ****************************************



NOTE: HUMAN CHROMOSOME SIZES

cd /nethome/bioinfo/data/sequence/chromosomes/human/hg18/fasta
cat chromosome_positions.txt

    chromo  start           stop            size
    chr1    0               252194715       252194715
    chr2    252194716       500004889       247810173
    chr3    500004890       703496755       203491865
    chr4    703496756       898595282       195098526
    chr5    898595283       1083070308      184475025
    chr6    1083070309      1257388302      174317993
    chr7    1257388303      1419386157      161997854
    chr8    1419386158      1568586482      149200324
    chr9    1568586483      1711665202      143078719
    chr10   1711665203      1849747436      138082233
    chr11   1849747437      1986888870      137141433
    chr12   1986888871      2121885397      134996526
    chr13   2121885398      2238311239      116425841
    chr14   2238311240      2346807198      108495958
    chr15   2346807199      2449152894      102345695
    chr16   2449152895      2539756696      90603801
    chr17   2539756697      2620106935      80350238
    chr18   2620106936      2697746434      77639498
    chr19   2697746435      2762834321      65087886
    chr20   2762834322      2826519007      63684685
    chr21   2826519008      2874402219      47883211
    chr22   2874402220      2925087482      50685262
    chrX    2925087483      3083099514      158012031
    chrY    3083099515      3142027930      58928415


SO AT BINLEVEL 2:

    CHROMOSOME 1 : 31 BINS
    ...
    CHROMOSOME 22:  7 BINS



TEST BINBAM WITH ADDED hitRange SUBROUTINE:

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1 \
--binlevel 2 \
--reference chr22 \
--maxjobs 1000 \
--walltime 48 \
--queue small \
--cluster LSF 

    binBam.pl    Run time: 00:04:31
    binBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/binBam.pl
    binBam.pl    12:35AM, 1 December 2010
    binBam.pl    ****************************************


LAST BIN:

    {
      'stop' => 58720256,
      'number' => 15,
      'start' => 50331649
    }


IDXSTATS OF *bam FILE:

samtools idxstats hit.binlevel2.num15.bam
chr22   51304566        37921   0




NOTES
-----

UCSC binning
http://genomewiki.ucsc.edu/index.php/Bin_indexing_system
Kent & al. The Human Genome Browser at UCSC", doi: 10.1101/gr.229102 . Genome Res. 2002. 12:996-1006

Initial implementation


Used when chromEnd is less than or equal to 536,870,912 = 2**29

 	bin numbers	bin

level	#bins	start	end	    size
0	    1	    0	    0	    512 Mb
1	    8	    1	    8	    64 Mb
2	    64	    9	    72	    8 Mb
3	    512	    73	    584	    1 Mb
4	    4096	585	    4680	128 kb


Extended implementation

Used when chromEnd is greater than 536,870,912 = 229 and less than 2,147,483,647 = 231 - 1
 	bin numbers	bin

level	#bins	start	end	size
0	1	4691	4691	2 Gb
1	8	4683	4685	512 Mb
2	64	4698	4721	64 Mb
3	512	4818	5009	8 Mb
4	4,096	5778	7313	1 Mb
5	32,768	13458	25745	128 kb



Initial implementation C code

/* This file is copyright 2002 Jim Kent, but license is hereby
 * granted for all use - public, private or commercial. */

static int binOffsets[] = {512+64+8+1, 64+8+1, 8+1, 1, 0};
#define _binFirstShift 17       /* How much to shift to get to finest bin. */
#define _binNextShift 3         /* How much to shift to get to next larger bin.

static int binFromRangeStandard(int start, int end)
/* Given start,end in chromosome coordinates assign it
 * a bin.   There's a bin for each 128k segment, for each
 * 1M segment, for each 8M segment, for each 64M segment,
 * and for each chromosome (which is assumed to be less than
 * 512M.)  A range goes into the smallest bin it will fit in. */
{
int startBin = start, endBin = end-1, i;
startBin >>= _binFirstShift;
endBin >>= _binFirstShift;
for (i=0; i<ArraySize(binOffsets); ++i)
    {
    if (startBin == endBin)
        return binOffsets[i] + startBin;
    startBin >>= _binNextShift;
    endBin >>= _binNextShift;
    }
errAbort("start %d, end %d out of range in findBin (max is 512M)", start, end);
return 0;
}
Extended implementation C code

/* This file is copyright 2002 Jim Kent, but license is hereby
 * granted for all use - public, private or commercial. */

/* add one new level to get coverage past chrom sizes of 512 Mb
 *      effective limit is now the size of an integer since chrom start
 *      and end coordinates are always being used in int's == 2Gb-1 */
static int binOffsetsExtended[] =
        {4096+512+64+8+1, 512+64+8+1, 64+8+1, 8+1, 1, 0};

static int binFromRangeExtended(int start, int end)
/* Given start,end in chromosome coordinates assign it
 * a bin.   There's a bin for each 128k segment, for each
 * 1M segment, for each 8M segment, for each 64M segment,
 * for each 512M segment, and one top level bin for 4Gb.
 *      Note, since start and end are int's, the practical limit
 *      is up to 2Gb-1, and thus, only four result bins on the second
 *      level.
 * A range goes into the smallest bin it will fit in. */
{
int startBin = start, endBin = end-1, i;
startBin >>= _binFirstShift;
endBin >>= _binFirstShift;
for (i=0; i<ArraySize(binOffsetsExtended); ++i)
    {
    if (startBin == endBin)
        return _binOffsetOldToExtended + binOffsetsExtended[i] + startBin;
    startBin >>= _binNextShift;
    endBin >>= _binNextShift;
    }
errAbort("start %d, end %d out of range in findBin (max is 2Gb)", start, end);
return 0;
}





JAVA VERSION OF EXTENDED VERSION

http://plindenbaum.blogspot.com/2010/05/binning-genome.html




/** Given start,end in chromosome coordinates assign it
* a bin. A range goes into the smallest bin it will fit in. */
public int getBin(int chromStart,int chromEnd)
 {
 int genomicLength=getMaxGenomicLengthLevel();
 return calcBin(chromStart,chromEnd,0,0,0,0,1,0,genomicLength);
 }

/** length for level 0 */
protected int getMaxGenomicLengthLevel() { return 536870912;/* 2^29 */}
/** maximum level in Jim Kent's algorithm */
protected int getMaxLevel() { return 4;}
/** how many children for one node ? */
protected int getChildrenCount() { return 8;}

private int calcBin(
 final int chromStart,
 final int chromEnd,
 int binId,
 int level,
 int binRowStart,
 int rowIndex,
 int binRowCount,
 int genomicPos,
 int genomicLength
 )
 {

 if(
  chromStart>=genomicPos &&
  chromEnd<= (genomicPos+genomicLength))
  {
  if(level>=getMaxLevel()) return binId;

  int childLength=genomicLength/getChildrenCount();
  int childBinRowCount=binRowCount*getChildrenCount();
  int childRowBinStart=binRowStart+binRowCount;
  int firstChildIndex=rowIndex*getChildrenCount();
  int firstChildBin=childRowBinStart+firstChildIndex;
  for(int i=0;i< getChildrenCount();++i)
   {
   int n= calcBin(
     chromStart,
     chromEnd,
     firstChildBin+i,
     level+1,
     childRowBinStart,
     firstChildIndex+i,
     childBinRowCount,
     genomicPos+i*childLength,
     childLength
     );
   if(n!=-1)
    {
    return n;
    }
   }
  return binId;
  }

 return -1;
 }
 
 



PERL VERSION
------------

3.9. Shift Operators
http://docstore.mik.ua/orelly/perl2/prog/ch03_09.htm

The bit-shift operators (<< and >>) return the value of the left argument shifted to the left (<<) or to the right (>>) by the number of bits specified by the right argument. The arguments should be integers. For example:

1 << 4;     # returns 16
32 >> 4;    # returns 2
Be careful, though. Results on large (or negative) numbers may vary depending on the number of bits your machine uses to represent integers.




http://www.cs.cf.ac.uk/Dave/PERL/node36.html



The Bitwise Operators

The bitwise operators are similar to the logical operators, except that they work on a smaller scale -- binary representations of data.

The following operators are available:

op1 & op2 -- The AND operator compares two bits and generates a result of 1 if both bits are 1; otherwise, it returns 0.
op1 | op2 -- The OR operator compares two bits and generates a result of 1 if the bits are complementary; otherwise, it returns 0.
op1^ op2 -- The EXCLUSIVE-OR operator compares two bits and returns 1 if either of the bits are 1 and it gives 0 if both bits are 0 or 1.
~op1 -- The COMPLEMENT operator is used to invert all of the bits of the operand.
op1 >> op2 -- The SHIFT RIGHT operator moves the bits to the right, discards the far right bit, and assigns the leftmost bit a value of 0. Each move to the right effectively divides op1 in half.
op1 << op2 -- The SHIFT LEFT operator moves the bits to the left, discards the far left bit, and assigns the rightmost bit a value of 0. Each move to the left effectively multiplies op1 by 2.
Note Both operands associated with the bitwise operator must be integers.

Bitwise operators are used to change individual bits in an operand. A single byte of computer memory-when viewed as 8 bits-can signify the true/false status of 8 flags because each bit can be used as a boolean variable that can hold one of two values: true or false. A flag variable is typically used to indicate the status of something. For instance, computer files can be marked as read-only. So you might have a $fReadOnly variable whose job would be to hold the read-only status of a file. This variable is called a flag variable because when $fReadOnly has a true value, it's equivalent to a football referee throwing a flag. The variable says, "Whoa! Don't modify this file."

When you have more than one flag variable, it might be more efficient to use a single variable to indicate the value of more than one flag. The next example shows you how to do this.

Example: Using the &, |, and ^ Operators

The first step to using bitwise operators to indicate more than one flag in a single variable is to define the meaning of the bits that you'd like to use. Figure 5.1 shows an example of 8 bits that could be used to control the attributes of text on a display.

 
The bit definition of a text attribute control variable

If you assume that $textAttr is used to control the text attributes, then you could set the italic attribute by setting $textAttr equal to 128 like this:

$textAttr = 128;
because the bit pattern of 128 is 10000000. The bit that is turned on corresponds to the italic position in $textAttr.

Now let's set both the italic and underline attributes on at the same time. The underline value is 16, which has a bit pattern of 00010000. You already know the value for italic is 128. So we call on the OR operator to combine the two values.

$textAttr = 128 | 16;
or using the bit patterns (this is just an example-you can't do this in Perl)

$textAttr = 10000000 | 00010000;
You will see that $textAttr gets assigned a value of 144 (or 10010000 as a bit pattern). This will set both italic and underline attributes on.

The next step might be to turn the italic attribute off. This is done with the EXCLUSIVE-OR operator, like so:

$textAttr = $textAttr ^ 128;

Example: Using the >> and << Operators

The bitwise shift operators are used to move all of the bits in the operand left or right a given number of times. They come in quite handy when you need to divide or multiply integer values.

This example will divide by 4 using the >> operator.

$firstVar = 128;

$secondVar = $firstVar >> 2;

print("$secondVar\n");
Here we

Assign a value of 128 to the $firstVar variable.
Shift the bits inside $firstVar two places to the right and
assign the new value to $secondVar .
Print the $secondVart variable.
The program produces the following output:

32
Let's look at the bit patterns of the variables before and after the shift operation. First, $firstVar is assigned 128 or 10000000. Then, the value in $firstVar is shifted left by two places. So the new value is 00100000 or 32, which is assigned to $secondVar.

The rightmost bit of a value is lost when the bits are shifted right. You can see this in the next example.

The next example will multiply 128 by 8.

$firstVar = 128;

$secondVar = $firstVar << 3;

print $secondVar;
The program produces the following output:
1024
The value of 1024 is beyond the bounds of the 8 bits that the other examples used. This was done to show you that the number of bits available for your use is not limited to one byte. You are really limited by however many bytes Perl uses for one scalar variable (probably 4). You'll need to read the Perl documentation that came with the interpreter to determine how many bytes your scalar variables use.




</entry>

<entry [Wed Nov 24 11:18:38 EST 2010] cumulativeSnp.pl FAILURES DUE TO HARDWARE ISSUES>


PROBLEM:

cumulativeSnp.pl OCCASIONALLY DOES NOT INCORPORATE AN INPUT hit.bam FILE SUCH THAT THERE ARE TWO CONSECUTIVE merged-N.bam FILES WITH EXACTLY THE SAME SIZE AND COMPOSITION

cumulativeSnp.pl MERGES CONSECUTIVELY ALL OF THE hit.bam FILES FOR ALL 1-33 SAMPLES (EACH IS 100M READS, TOTAL 3.3 BILLION READS) AND THEN CALLS SNPS AT EACH STAGE



DIAGNOSIS:

THERE APPEARS TO BE A DELAY BETWEEN WHEN MERGE OUTPUT FILES ARE COMPLETED AND WHEN THEY BECOME 'AVAILABLE' ON THE FILE SYSTEM 

FOR EXAMPLE, RUNNING cumulativeSnp.pl ON NOVOALIGN hit.bam FILES, MERGING CUMULATIVELY RAN FINE FOR 4 FILES THEN FAILED AT FILE 5 BECAUSE THE PREVIOUS MERGED FILE WAS MISSING:

emacs cumulativeSnp-chr22-5-stdout.txt

    ...
    [bam_merge_core] fail to open file /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam
    ...

HOWEVER, THE merged-4.bam FILE IS ACTUALLY PRESENT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll merged-4.bam

    -rw-rw-rw- 1 syoung root 1.1G Nov 17 01:21 merged-4.bam


BUT THE merged-4.bam FILE WAS LAST WRITTEN TO AFTER THE APPLICATION HAD TERMINATED. I.E., THE merged-4.bam FILE IS DATED LATER THAN THE OUTPUT FILE:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll cumulativeSnp-chr22-5-stdout.txt

    -rw-rw-rw- 1 syoung root 2.4K Nov 17 01:11 cumulativeSnp-chr22-5-stdout.txt


SOLUTION:

INTRODUCE A 25-MINUTE DELAY BETWEEN MERGE STEPS TO ALLOW FOR THE FILES BECOME AVAILABLE ON THE FILE SYSTEM





</entry>

<entry [Tue Nov 23 00:06:01 EST 2010] DELETED ALIGNMENT SUBDIRS ON PEGASUS>

bowtie     
    cumulative
    cumulative2

bowtie-rf  
    cumulative
    cumulative2

eland     
    cumulative

maq        
    cumulative
    cumulative2

novoalign  
    cumulative
    cumulative2



</entry>

<entry [Tue Nov 23 23:46:36 EST 2010] RERUN cumulativeSnp.pl WITH INCREASED SLEEP (25 MINS)>


SUMMARY
=======

eland FROM FILE 17 (cumulative)
--------------------------------
RUNNING Wed Nov 24 00:06:40 EST 2010
RERUN FROM FILE 18 (DELETED hit.sam)


bowtie FROM FILE 13 (cumulative2)
---------------------------------
RUNNING Wed Nov 24 00:32:02 EST 2010
RERUNNING BOWTIE ALIGNMENT FROM FILE 13


bowtie-rf FROM FILE 1 (cumulative2)
-----------------------------------
RERUNNING bowtie-rf ALIGNMENTS 18-33 Wed Nov 24 11:44:52 EST 2010


novoalign FROM FILE 26 (cumulative2)
------------------------------------
FILE 18 Sat Nov 27 20:48:35 EST 2010


maq FROM FILE 14 (cumulative)
-----------------------------
RUNNING Wed Nov 24 00:21:41 EST 2010


maq FROM FILE 10 (cumulative2)
------------------------------
FILE 15 Sat Nov 27 20:49:34 EST 2010





RUNS
====


eland FROM FILE 17 (cumulative)
--------------------------------

cp merged.bam-17 merged.bam-17.old
cp merged.bam-18 merged.bam-18.old


RERUN eland ALIGNMENTS FOR FILES 18 to 33

    ON u02



screen -S eland

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/ELAND.pl \
--replicates 1-33 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--inputtype fastq \
--species human \
--label eland-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chr22 \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%/eland-chr22-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/eland.1-33.stdout

    Run time: 01:58:48
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:04PM, 28 November 2010
    ****************************************
    
    FROM MERGE SAM ONLY:
    
    Run time: 00:16:09
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    12:23AM, 29 November 2010
    ****************************************


PROBLEM: MISSING *export.txt FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/4/chr22/1
em ELAND-chr22-stdout.txt

    ...
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: pickBestPair succeded
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: About to run /nethome/syoung/ba\
    se/apps/casava/1.6.0/bin/../bin/buildExport.pl --paired --symbolic ./reanalysis_1_calsaf.txt ./\
    reanalysis_1_qseq.txt > ./reanalysis_1_export.txt
    
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: buildExport succeded
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: About to run /nethome/syoung/ba\
    se/apps/casava/1.6.0/bin/../bin/buildExport.pl --paired --symbolic ./reanalysis_2_calsaf.txt ./\
    reanalysis_2_qseq.txt > ./reanalysis_2_export.txt
    
    /nethome/syoung/base/apps/casava/1.6.0/bin/ELAND_standalone.pl: buildExport succeded

SUCCEEDED BUT NO *export FILES.


    ##on u02
    ##RUNNING Fri Nov 26 02:05:33 EST 2010
    ##
    ##Run time: 03:26:51
    ##Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    ##3:57AM, 27 November 2010
    ##****************************************


SOLUTION:

RERUN FROM mergeSam

    OK
    
    


eland binBam.pl
----------------




eland cumulativeSnp.pl
------------------------

screen -S eland-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/33 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--species human \
--label eland-cumulative \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/cumulativeSnp.out

    
    RUNNING Thu Nov 25 11:45:06 EST 2010
    FILE 19 AT  Thu Nov 25 12:58:39 EST 2010

    
    
    
    
    

bowtie FROM FILE 13 (cumulative2)
-------------------

cp merged.bam-13 merged.bam-13.old
cp merged.bam-14 merged.bam-14.old


RERUN bowtie ALIGNMENTS FROM FILE 13 TO 33

ON u01

screen -S bowtie

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 13-33 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--species human \
--distance 200 \
--label bowtie-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--clean \
--queue large \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/bowtie-chr22-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/bowtie.18-33.stdout

    RUNNING Sat Nov 27 21:22:42 EST 2010
    
    
    
    ##RUNNING Thu Nov 25 00:59:52 EST 2010

    Run time: 07:00:25
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    8:06AM, 25 November 2010
    ****************************************




RERUN cumulativeSnp.pl FROM FILE 13


ON u02

screen -S bowtie-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/33 \
--start 13 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2 \
--species human \
--label bowtie-cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/cumulativeSnp.out


    RUNNING Fri Nov 26 01:54:29 EST 2010

    cumulativeSNP.pl    Run time: 14:13:37
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    4:07PM, 26 November 2010
    cumulativeSNP.pl    ****************************************




bowtie-rf FROM FILE 1 (cumulative2)
----------------------------------

FILE 1 ONLY (SMALL hit.sam FILE)
--------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22
mv hit.sam hit.sam.bkp

ON u04

screen -S bowtie-rf-1

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1 \
--species human \
--distance 200 \
--label bowtie-rf-1 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--clean \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/bowtie-rf.out 

    RUNNING Wed Nov 24 11:44:52 EST 2010
    
    BOWTIE.pl    Run time: 00:39:07
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    12:21AM, 24 November 2010
    BOWTIE.pl    ****************************************
    
OUTPUT FILE IS NORMAL:
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf

    -rw-rw-rw- 1 syoung root 852M Nov 24 12:39 1/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 154M Nov  5 13:14 1-old/chr22/hit.sam



FILE 9 ONLY (LARGE hit.sam FILE)
--------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/chr22
mv hit.sam hit.sam.bkp

ON u04

screen -S bowtie-rf-9

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-9.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-9.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9 \
--species human \
--distance 200 \
--label bowtie-rf-9 \
--maxjobs 1000 \
--walltime 24 \cd 
--queue large \
--clean \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/bowtie-rf.out 
    
    RUNNING Wed Nov 24 11:44:52 EST 2010
    
    BOWTIE.pl    Run time: 01:03:44
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    12:46AM, 24 November 2010
    BOWTIE.pl    ****************************************


OUTPUT FILE IS NORMAL:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf
    
    -rw-rw-rw- 1 syoung root 815M Nov 24 12:41 9/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 126M Nov  9 12:16 nine/chr22/hit.sam



FILE 4 BAM IS SMALL:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf

    -rw-rw-rw- 1 syoung root 103M Nov 19 10:52 4/chr22/hit.bam



RERUN cumulativeSnp.pl FROM FILE 1 AS cumulative3

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3

ON u03

screen -S bowtie-rf-cum3

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3 \
--species human \
--label bowtie-rf-cumulative \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/cumulativeSnp.out


    RUNNING Sat Nov 27 01:27:14 EST 2010



novoalign FROM FILE 26 (cumulative2)
------------------------------------

RERUN novoalign ALIGNMENT FILES 26-30

screen -S novo

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/NOVOALIGN.pl \
--replicates 26-30 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
--loop parallel \
--params "-r All 1" \
--distance 200 \
--deviation 50 \
--species human \
--label novoalign-chr22-%REPLICATE% \
--maxjobs 1000 \
--queue large \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/novoalign.26-30.out 

    
    RUNNING Wed Nov 24 12:11:26 EST 2010
    
    Run time: 04:32:12
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:22PM, 24 November 2010
    ****************************************


screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--start 14 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.14-33.out

    
    RUNNING Sat Nov 27 01:23:25 EST 2010


    
    ###RUNNING Fri Nov 26 00:46:14 EST 2010
    ###
    ###cumulativeSNP.pl    Run time: 20:03:37
    ###cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    ###cumulativeSNP.pl    8:48PM, 26 November 2010
    ###cumulativeSNP.pl    ****************************************


JOBS CURTAILED - STARTS TO KILL AT FILE 14 WHEN RUNNING TIME EXCEEDS 4 HOURS (DEFAULT WALLTIME).

IT TURNS OUT THAT THE large QUEUE HAS A MAX WALLTIME OF 24 HOURS AND THE SCHEDULER WILL IGNORE THE:

-W 48:00

IN THE SCRIPT FILE AND INSTEAD JUST SET WALLTIME TO THE DEFAULT:
    
    
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
[syoung@u04 chr22]$ grep "job killed" *txt
cumulativeSnp-chr22-14-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-15-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-16-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-17-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-18-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-19-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-20-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-21-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-22-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-23-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-24-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-25-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-26-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-27-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-28-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-29-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-30-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
cumulativeSnp-chr22-31-stdout.txt:TERM_RUNLIMIT: job killed after reaching LSF run time limit.
[syoung@u04 chr22]$



SOLUTION:

RERUN FROM FILE 14 IN small QUEUE WHICH HAS MAX WALLTIME 168 HOURS AND DEFAULT WALLTIME 24 HOURS







cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll -tr merge* | grep -v snp | grep -v temp

    -rw-r--r-- 1 syoung root 285M Nov 17 00:19 merged-1.bam
    -rw-rw-rw- 1 syoung root 562M Nov 17 00:30 merged-2.bam
    -rw-rw-rw- 1 syoung root 838M Nov 17 00:50 merged-3.bam
    -rw-rw-rw- 1 syoung root 1.1G Nov 17 01:21 merged-4.bam
    -rw-rw-rw- 1 syoung root 1.4G Nov 18 14:34 merged-5.bam
    -rw-rw-rw- 1 syoung root 1.7G Nov 18 15:44 merged-6.bam
    -rw-rw-rw- 1 syoung root 1.9G Nov 18 17:12 merged-7.bam
    -rw-rw-rw- 1 syoung root 2.2G Nov 18 18:58 merged-8.bam
    -rw-rw-rw- 1 syoung root 2.4G Nov 18 21:04 merged-9.bam
    -rw-rw-rw- 1 syoung root 2.5G Nov 18 23:27 merged-10.bam
    -rw-rw-rw- 1 syoung root 2.7G Nov 19 02:03 merged-11.bam
    -rw-rw-rw- 1 syoung root 3.0G Nov 19 05:01 merged-12.bam
    -rw-rw-rw- 1 syoung root 3.3G Nov 19 08:28 merged-13.bam
    -rw-rw-rw- 1 syoung root 3.5G Nov 19 12:17 merged-14.bam
    -rw-rw-rw- 1 syoung root 3.8G Nov 19 16:20 merged-15.bam
    -rw-rw-rw- 1 syoung root 4.0G Nov 19 20:23 merged-16.bam
    -rw-rw-rw- 1 syoung root 4.3G Nov 20 00:26 merged-17.bam
    -rw-rw-rw- 1 syoung root 4.5G Nov 20 04:29 merged-18.bam
    -rw-rw-rw- 1 syoung root 4.8G Nov 20 08:32 merged-19.bam
    -rw-rw-rw- 1 syoung root 5.0G Nov 20 12:34 merged-20.bam
    -rw-rw-rw- 1 syoung root 5.3G Nov 20 16:38 merged-21.bam
    -rw-rw-rw- 1 syoung root 5.5G Nov 20 20:40 merged-22.bam
    -rw-rw-rw- 1 syoung root 5.8G Nov 21 00:43 merged-23.bam
    -rw-rw-rw- 1 syoung root 6.1G Nov 21 04:46 merged-24.bam
    -rw-rw-rw- 1 syoung root 6.3G Nov 21 08:49 merged-25.bam
    -rw-rw-rw- 1 syoung root 6.6G Nov 26 01:55 merged-26.bam
    -rw-rw-rw- 1 syoung root 6.8G Nov 26 05:58 merged-27.bam
    -rw-rw-rw- 1 syoung root 7.0G Nov 26 10:01 merged-28.bam
    -rw-rw-rw- 1 syoung root 7.3G Nov 26 14:18 merged-29.bam
    -rw-rw-rw- 1 syoung root 7.5G Nov 26 18:05 merged-30.bam
    -rw-rw-rw- 1 syoung root 7.8G Nov 26 22:08 merged-31.bam



RESTART TO COMPLETE FILES 32 AND 33:

screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--start 32 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.32-33.out




maq FROM FILE 14 (cumulative)
-----------------------------

cp merged.bam-13 merged.bam-13.old
cp merged.bam-14 merged.bam-14.old


screen -S maq-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.14-33.out

    #### MISSING merged-13.bam
    ##
    ##RUNNING Fri Nov 26 01:10:23 EST 2010
    ##
    ##cumulativeSNP.pl    Run time: 05:27:43
    ##cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    ##cumulativeSNP.pl    6:36AM, 26 November 2010
    ##cumulativeSNP.pl    ****************************************


    RUNNING Sat Nov 27 01:18:45 EST 2010

    cumulativeSNP.pl    Run time: 53:03:14
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    6:21AM, 29 November 2010
    cumulativeSNP.pl    ****************************************



ll -tr merged-*.bam
-rw-r--r-- 1 syoung root 3.6G Nov  4 14:39 merged-13-sorted.bam
-rw-r--r-- 1 syoung root  13G Nov 26 01:05 merged-12.bam
-rw-r--r-- 1 syoung root 1.2G Nov 27 01:19 merged-1.bam
-rw-rw-rw- 1 syoung root 2.4G Nov 27 01:53 merged-2.bam
-rw-rw-rw- 1 syoung root 3.6G Nov 27 02:48 merged-3.bam
-rw-rw-rw- 1 syoung root  14G Nov 27 07:20 merged-13.bam
-rw-rw-rw- 1 syoung root  15G Nov 27 12:57 merged-14.bam
-rw-rw-rw- 1 syoung root  16G Nov 27 19:11 merged-15.bam
-rw-rw-rw- 1 syoung root  18G Nov 28 01:54 merged-16.bam
-rw-rw-rw- 1 syoung root  19G Nov 28 09:00 merged-17.bam
-rw-rw-rw- 1 syoung root  20G Nov 28 17:10 merged-18.bam
-rw-rw-rw- 1 syoung root  21G Nov 29 01:21 merged-19.bam
-rw-rw-rw- 1 syoung root  21G Nov 29 10:02 merged-20.bam




cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/chr22
ls -altr merged*bam  | grep -v merged-20

    -rw-r--r-- 1 syoung root  1282727303 Nov 12 15:45 merged.bam-1
    -rw-r--r-- 1 syoung root  2531495026 Nov 12 16:27 merged.bam-2
    -rw-rw-rw- 1 syoung root  3766110602 Nov 12 17:41 merged.bam-3
    -rw-rw-rw- 1 syoung root  4992744759 Nov 12 19:16 merged.bam-4
    -rw-rw-rw- 1 syoung root  6213708762 Nov 12 21:05 merged.bam-5
    -rw-rw-rw- 1 syoung root  7429919804 Nov 12 23:28 merged.bam-6
    -rw-rw-rw- 1 syoung root  8642421971 Nov 13 02:13 merged.bam-7
    -rw-rw-rw- 1 syoung root  9852504179 Nov 13 05:17 merged.bam-8
    -rw-rw-rw- 1 syoung root 11060502267 Nov 13 08:49 merged.bam-9
    -rw-rw-rw- 1 syoung root  2004434944 Nov 13 12:42 merged.bam-10
    -rw-rw-rw- 1 syoung root 12266036389 Nov 13 12:46 merged.bam-11
    -rw-rw-rw- 1 syoung root 13469994218 Nov 13 17:00 merged.bam-12
    -rw-rw-rw- 1 syoung root 14672384912 Nov 13 21:23 merged.bam-13
    -rw-rw-rw- 1 syoung root 15873270400 Nov 14 01:24 merged.bam-14
    -rw-rw-rw- 1 syoung root 17073236383 Nov 14 05:36 merged.bam-15
    -rw-rw-rw- 1 syoung root 18272243767 Nov 14 09:48 merged.bam-16
    -rw-rw-rw- 1 syoung root 19470267243 Nov 14 13:59 merged.bam-17
    -rw-rw-rw- 1 syoung root  5006114816 Nov 14 18:15 merged.bam-18
    -rw-rw-rw- 1 syoung root 21863294371 Nov 14 22:29 merged.bam-20
    -rw-r--r-- 1 syoung root  5533155328 Nov 15 10:37 merged.bam-23
    -rw-rw-rw- 1 syoung root 23059233661 Nov 16 12:09 merged.bam.temp
    -rw-r--r-- 1 syoung root 23059274733 Nov 16 14:49 merged.bam
    -rw-r--r-- 1 syoung root  5866209280 Nov 16 14:55 merged.bam-33
    -rw-rw-r-- 1 syoung root 19470267243 Nov 16 19:39 merged-17.bam
    -rw-r--r-- 1 syoung root  1282727303 Nov 19 17:27 merged-1.bam
    -rw-rw-rw- 1 syoung root 20667202947 Nov 24 03:35 merged-18.bam.temp
    -rw-rw-rw- 1 syoung root 20667203319 Nov 24 05:58 merged-18.bam
    -rw-rw-rw- 1 syoung root 21863352834 Nov 24 07:38 merged-19.bam.temp
    -rw-rw-rw- 1 syoung root 21863352797 Nov 24 10:11 merged-19.bam
    -rw-rw-r-- 1 syoung root 11060502267 Nov 24 10:41 merged-9.bam
    -rw-rw-rw- 1 syoung root 21863352797 Nov 24 10:43 merged.bam-19
    -rw-rw-rw- 1 syoung root 12265783956 Nov 24 11:56 merged-10.bam.temp
    -rw-rw-rw- 1 syoung root 12265784109 Nov 24 13:26 merged-10.bam
    -rw-rw-rw- 1 syoung root 13469577911 Nov 24 15:59 merged-11.bam.temp
    -rw-rw-rw- 1 syoung root 13469577978 Nov 24 17:33 merged-11.bam
    -rw-rw-rw- 1 syoung root 14672076187 Nov 24 20:02 merged-12.bam.temp
    -rw-rw-rw- 1 syoung root 14672076307 Nov 24 21:46 merged-12.bam




maq FROM FILE 10 (cumulative2)
------------------------------

screen -S maq-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--start 10 \
--samfile hit.bam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--species human \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue small \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/cumulativeSnp.out


    RUNNING Sat Nov 27 01:21:33 EST 2010

    FILE 15 Sat Nov 27 20:49:34 EST 2010
    
    cumulativeSNP.pl    Run time: 34:13:37
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    11:34AM, 28 November 2010
    cumulativeSNP.pl    ****************************************

    ### QUEUE LARGE
    ###RUNNING Fri Nov 26 01:10:23 EST 2010
    ###
    ###FILE 18 AT Sat Nov 27 00:33:55 EST 2010
    
    
BUT OUTPUT FILES NOT COMPLETE:
    
    -rw-r--r-- 1 syoung root 1.2G Nov 19 17:27 merged-1.bam
    -rw-rw-r-- 1 syoung root  11G Nov 24 10:41 merged-9.bam
    -rw-rw-rw- 1 syoung root  20G Nov 27 00:08 merged-18.bam
    -rw-rw-rw- 1 syoung root  12G Nov 27 03:31 merged-10.bam
    -rw-rw-rw- 1 syoung root  21G Nov 27 04:21 merged-19.bam
    -rw-rw-rw- 1 syoung root  22G Nov 27 04:37 merged-20.bam
    -rw-rw-rw- 1 syoung root  13G Nov 27 07:42 merged-11.bam
    -rw-rw-rw- 1 syoung root  14G Nov 27 12:21 merged-12.bam
    -rw-rw-rw- 1 syoung root  11G Nov 27 17:48 merged-14.bam
    -rw-rw-rw- 1 syoung root  15G Nov 27 17:49 merged-13.bam
    -rw-rw-rw- 1 syoung root  12G Nov 27 22:37 merged-15.bam
    -rw-rw-rw- 1 syoung root  14G Nov 28 03:32 merged-16.bam
    -rw-rw-r-- 1 syoung root  15G Nov 28 08:43 merged-17.bam




</entry>

<entry [Tue Nov 23 23:45:36 EST 2010] PROGRESS OF CUMULATIVE SNP CALLS>

eland (autochr22, cumulative)
-----

DONE
    
    -rw-r--r-- 1 syoung root  171M Nov  4 13:17 merged.bam-1
    -rw-r--r-- 1 syoung root  207M Nov  4 13:23 merged.bam-2
    -rw-r--r-- 1 syoung root  207M Nov  4 13:31 merged.bam-3
    -rw-r--r-- 1 syoung root  329M Nov  4 13:36 merged.bam-4
    -rw-r--r-- 1 syoung root  329M Nov  4 13:36 merged.bam-5
    -rw-r--r-- 1 syoung root  448M Nov  4 13:36 merged.bam-6
    -rw-r--r-- 1 syoung root  564M Nov  4 13:37 merged.bam-7
    -rw-r--r-- 1 syoung root  680M Nov  4 13:37 merged.bam-8
    -rw-r--r-- 1 syoung root  795M Nov  4 13:37 merged.bam-9
    -rw-r--r-- 1 syoung root  909M Nov  4 13:18 merged.bam-10
    -rw-r--r-- 1 syoung root 1022M Nov  4 13:18 merged.bam-11
    -rw-r--r-- 1 syoung root  1.2G Nov  4 13:18 merged.bam-12
    -rw-r--r-- 1 syoung root  1.3G Nov  4 13:19 merged.bam-13
    -rw-r--r-- 1 syoung root  1.4G Nov  4 13:19 merged.bam-14
    -rw-r--r-- 1 syoung root  1.5G Nov  4 13:20 merged.bam-15
    -rw-r--r-- 1 syoung root  1.6G Nov  4 13:21 merged.bam-16
    -rw-r--r-- 1 syoung root  1.7G Nov  4 13:21 merged.bam-17
    -rw-r--r-- 1 syoung root  1.8G Nov  4 13:22 merged.bam-18
    -rw-r--r-- 1 syoung root  1.9G Nov  4 13:22 merged.bam-19
    -rw-r--r-- 1 syoung root  2.0G Nov  4 13:23 merged.bam-20
    -rw-r--r-- 1 syoung root  2.1G Nov  4 13:24 merged.bam-21
    -rw-r--r-- 1 syoung root  2.2G Nov  4 13:25 merged.bam-22
    -rw-r--r-- 1 syoung root  2.3G Nov  4 13:26 merged.bam-23
    -rw-r--r-- 1 syoung root  2.5G Nov  4 13:26 merged.bam-24
    -rw-r--r-- 1 syoung root  2.6G Nov  4 13:27 merged.bam-25
    -rw-r--r-- 1 syoung root  2.7G Nov  4 13:28 merged.bam-26
    -rw-r--r-- 1 syoung root  2.8G Nov  4 13:29 merged.bam-27
    -rw-r--r-- 1 syoung root  2.9G Nov  4 13:30 merged.bam-28
    -rw-r--r-- 1 syoung root  3.0G Nov  4 13:31 merged.bam-29
    -rw-r--r-- 1 syoung root  3.1G Nov  4 13:33 merged.bam-30
    -rw-r--r-- 1 syoung root  3.2G Nov  4 13:34 merged.bam-31
    -rw-r--r-- 1 syoung root  3.3G Nov  4 13:35 merged.bam-32
    -rw-r--r-- 1 syoung root  3.4G Nov  4 13:36 merged.bam-33


eland (cumulative)
------

(DIFFERENCE WITH eland/cumulative DUE TO USE OF NEWER VERSION OF SAMTOOLS FOR CONVERSION OF *export TO *sam)

FILES 17 AND 18

    -rw-rw-rw- 1 syoung root 128M Nov  9 11:23 merged.bam-1
    -rw-rw-rw- 1 syoung root 250M Nov  9 11:29 merged.bam-2
    -rw-rw-rw- 1 syoung root 369M Nov  9 11:36 merged.bam-3
    -rw-rw-rw- 1 syoung root 486M Nov  9 11:45 merged.bam-4
    -rw-rw-rw- 1 syoung root 602M Nov  9 11:57 merged.bam-5
    -rw-rw-rw- 1 syoung root 717M Nov  9 12:10 merged.bam-6
    -rw-rw-rw- 1 syoung root 831M Nov  9 12:26 merged.bam-7
    -rw-rw-rw- 1 syoung root 945M Nov  9 12:43 merged.bam-8
    -rw-rw-rw- 1 syoung root 1.1G Nov  9 13:02 merged.bam-9
    -rw-rw-rw- 1 syoung root 1.2G Nov 12 11:27 merged.bam-10
    -rw-rw-rw- 1 syoung root 1.3G Nov 12 11:51 merged.bam-11
    -rw-rw-rw- 1 syoung root 1.4G Nov 12 12:16 merged.bam-12
    -rw-rw-rw- 1 syoung root 1.5G Nov 12 12:46 merged.bam-13
    -rw-rw-rw- 1 syoung root 1.6G Nov 12 13:18 merged.bam-14
    -rw-rw-rw- 1 syoung root 1.7G Nov 12 13:52 merged.bam-15
    -rw-rw-rw- 1 syoung root 1.8G Nov 12 16:07 merged.bam-16
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 16:43 merged.bam-17
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 16:45 merged.bam-18
    -rw-rw-rw- 1 syoung root 2.1G Nov 12 17:33 merged.bam-19
    -rw-rw-rw- 1 syoung root 2.2G Nov 12 18:26 merged.bam-20
    -rw-rw-rw- 1 syoung root 2.3G Nov 12 19:14 merged.bam-21
    -rw-rw-rw- 1 syoung root 2.4G Nov 12 20:03 merged.bam-22
    -rw-rw-rw- 1 syoung root 2.5G Nov 12 20:54 merged.bam-23
    -rw-rw-rw- 1 syoung root 2.6G Nov 12 21:48 merged.bam-24
    -rw-rw-rw- 1 syoung root 2.7G Nov 12 22:45 merged.bam-25
    -rw-rw-rw- 1 syoung root 2.8G Nov 12 23:44 merged.bam-26
    -rw-rw-rw- 1 syoung root 2.9G Nov 13 00:55 merged.bam-27
    -rw-rw-rw- 1 syoung root 3.0G Nov 13 01:53 merged.bam-28
    -rw-rw-rw- 1 syoung root 3.1G Nov 13 02:52 merged.bam-29
    -rw-rw-rw- 1 syoung root 3.2G Nov 13 03:54 merged.bam-30
    -rw-rw-rw- 1 syoung root 3.3G Nov 13 04:59 merged.bam-31
    -rw-rw-rw- 1 syoung root 3.5G Nov 13 06:07 merged.bam-32
    -rw-rw-rw- 1 syoung root 3.6G Nov 13 07:17 merged.bam-33



bowtie (cumulative 2)
------

FILES 13 AND 14

    -rw-r--r-- 1 syoung root 299M Nov 12 13:41 merged.bam-1
    -rw-rw-rw- 1 syoung root 588M Nov 12 13:50 merged.bam-2
    -rw-rw-rw- 1 syoung root 875M Nov 12 15:49 merged.bam-3
    -rw-rw-rw- 1 syoung root 1.2G Nov 12 16:04 merged.bam-4
    -rw-rw-rw- 1 syoung root 1.5G Nov 12 16:23 merged.bam-5
    -rw-rw-rw- 1 syoung root 1.7G Nov 12 16:46 merged.bam-6
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 17:14 merged.bam-7
    -rw-rw-rw- 1 syoung root 2.3G Nov 12 17:45 merged.bam-8
    -rw-rw-rw- 1 syoung root 2.6G Nov 12 18:21 merged.bam-9
    -rw-rw-rw- 1 syoung root 2.8G Nov 12 18:57 merged.bam-10
    -rw-rw-rw- 1 syoung root 3.1G Nov 12 19:37 merged.bam-11
    -rw-rw-rw- 1 syoung root 3.4G Nov 12 20:23 merged.bam-12
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 21:17 merged.bam-13
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 21:17 merged.bam-14
    -rw-rw-rw- 1 syoung root 3.9G Nov 12 22:12 merged.bam-15
    -rw-rw-rw- 1 syoung root 4.2G Nov 12 23:11 merged.bam-16
    -rw-rw-rw- 1 syoung root 4.5G Nov 13 00:15 merged.bam-17
    -rw-rw-rw- 1 syoung root 4.7G Nov 13 01:17 merged.bam-18
    -rw-rw-rw- 1 syoung root 5.0G Nov 13 02:21 merged.bam-19
    -rw-rw-rw- 1 syoung root 5.3G Nov 13 03:28 merged.bam-20
    -rw-rw-rw- 1 syoung root 5.5G Nov 13 04:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 5.8G Nov 13 05:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 6.1G Nov 13 07:18 merged.bam-23
    -rw-rw-rw- 1 syoung root 6.3G Nov 13 08:42 merged.bam-24
    -rw-rw-rw- 1 syoung root 6.6G Nov 13 10:08 merged.bam-25
    -rw-rw-rw- 1 syoung root 6.9G Nov 13 11:39 merged.bam-26
    -rw-rw-rw- 1 syoung root 7.1G Nov 13 13:11 merged.bam-27
    -rw-rw-rw- 1 syoung root 7.4G Nov 13 14:47 merged.bam-28
    -rw-rw-rw- 1 syoung root 7.7G Nov 13 16:27 merged.bam-29
    -rw-rw-rw- 1 syoung root 7.9G Nov 13 18:13 merged.bam-30
    -rw-rw-rw- 1 syoung root 8.2G Nov 13 20:07 merged.bam-31
    -rw-rw-rw- 1 syoung root 8.5G Nov 13 22:38 merged.bam-32
    -rw-rw-rw- 1 syoung root 8.8G Nov 14 00:34 merged.bam-33


bowtie-rf (cumulative 2)
---------

MISSING FILE 1

    -rw-rw-rw- 1 syoung root  313116630 Nov 12 15:39 merged.bam-2
    -rw-rw-rw- 1 syoung root  616246625 Nov 12 15:48 merged.bam-3
    -rw-rw-rw- 1 syoung root  718927149 Nov 12 15:57 merged.bam-4
    -rw-rw-rw- 1 syoung root 1021068986 Nov 12 16:10 merged.bam-5
    -rw-rw-rw- 1 syoung root 1320238909 Nov 12 16:27 merged.bam-6
    -rw-rw-rw- 1 syoung root 1320238909 Nov 12 16:28 merged.bam-7
    -rw-rw-rw- 1 syoung root 1617915983 Nov 12 16:49 merged.bam-8
    -rw-rw-rw- 1 syoung root 1664554804 Nov 12 17:11 merged.bam-9
    -rw-rw-rw- 1 syoung root 1960260687 Nov 12 17:35 merged.bam-10
    -rw-rw-rw- 1 syoung root 2254969873 Nov 12 18:03 merged.bam-11
    -rw-rw-rw- 1 syoung root 2548632773 Nov 12 18:36 merged.bam-12
    -rw-rw-rw- 1 syoung root 2841653920 Nov 12 19:14 merged.bam-13
    -rw-rw-rw- 1 syoung root 3133451449 Nov 12 19:55 merged.bam-14
    -rw-rw-rw- 1 syoung root 3424865819 Nov 12 20:48 merged.bam-15
    -rw-rw-rw- 1 syoung root 3715722282 Nov 12 21:46 merged.bam-16
    -rw-rw-rw- 1 syoung root 4006436294 Nov 12 22:53 merged.bam-17
    -rw-rw-rw- 1 syoung root  817626867 Nov 12 23:30 merged.bam-18
    -rw-rw-rw- 1 syoung root  817626867 Nov 12 23:26 merged.bam-19
    -rw-rw-rw- 1 syoung root 1126743473 Nov 13 03:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 1427848985 Nov 13 03:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 1427848985 Nov 13 04:00 merged.bam-23
    -rw-rw-rw- 1 syoung root 1727119401 Nov 13 04:22 merged.bam-24
    -rw-rw-rw- 1 syoung root 1250377728 Nov 13 04:48 merged.bam-25
    -rw-rw-rw- 1 syoung root 2024751357 Nov 13 04:48 merged.bam-26
    -rw-rw-rw- 1 syoung root 2321065799 Nov 13 05:19 merged.bam-27
    -rw-rw-rw- 1 syoung root 2616254587 Nov 13 05:52 merged.bam-28
    -rw-rw-rw- 1 syoung root 2910243405 Nov 13 06:31 merged.bam-29
    -rw-rw-rw- 1 syoung root 2910243405 Nov 13 06:32 merged.bam-30
    -rw-rw-rw- 1 syoung root 3203003805 Nov 13 07:12 merged.bam-31
    -rw-rw-rw- 1 syoung root 3495086782 Nov 13 07:55 merged.bam-32
    -rw-rw-rw- 1 syoung root 3786905249 Nov 13 08:42 merged.bam-33



novoalign (cumulative-2)
------------------------

UP TO FILE 25

    -rw-r--r-- 1 syoung root 285M Nov 17 00:19 merged-1.bam
    -rw-rw-rw- 1 syoung root 562M Nov 17 00:30 merged-2.bam
    -rw-rw-rw- 1 syoung root 838M Nov 17 00:50 merged-3.bam
    -rw-rw-rw- 1 syoung root 1.1G Nov 17 01:21 merged-4.bam
    -rw-rw-rw- 1 syoung root 1.4G Nov 18 14:34 merged-5.bam
    -rw-rw-rw- 1 syoung root 1.7G Nov 18 15:44 merged-6.bam
    -rw-rw-rw- 1 syoung root 1.9G Nov 18 17:12 merged-7.bam
    -rw-rw-rw- 1 syoung root 2.2G Nov 18 18:58 merged-8.bam
    -rw-rw-rw- 1 syoung root 2.4G Nov 18 21:04 merged-9.bam
    -rw-rw-rw- 1 syoung root 2.5G Nov 18 23:27 merged-10.bam
    -rw-rw-rw- 1 syoung root 2.7G Nov 19 02:03 merged-11.bam
    -rw-rw-rw- 1 syoung root 3.0G Nov 19 05:01 merged-12.bam
    -rw-rw-rw- 1 syoung root 3.3G Nov 19 08:28 merged-13.bam
    -rw-rw-rw- 1 syoung root 3.5G Nov 19 12:17 merged-14.bam
    -rw-rw-rw- 1 syoung root 3.8G Nov 19 16:20 merged-15.bam
    -rw-rw-rw- 1 syoung root 4.0G Nov 19 20:23 merged-16.bam
    -rw-rw-rw- 1 syoung root 4.3G Nov 20 00:26 merged-17.bam
    -rw-rw-rw- 1 syoung root 4.5G Nov 20 04:29 merged-18.bam
    -rw-rw-rw- 1 syoung root 4.8G Nov 20 08:32 merged-19.bam
    -rw-rw-rw- 1 syoung root 5.0G Nov 20 12:34 merged-20.bam
    -rw-rw-rw- 1 syoung root 5.3G Nov 20 16:38 merged-21.bam
    -rw-rw-rw- 1 syoung root 5.5G Nov 20 20:40 merged-22.bam
    -rw-rw-rw- 1 syoung root 5.8G Nov 21 00:43 merged-23.bam
    -rw-rw-rw- 1 syoung root 6.1G Nov 21 04:46 merged-24.bam
    -rw-rw-rw- 1 syoung root 6.3G Nov 21 08:49 merged-25.bam


maq (cumulative)
---

FILES 14 AND 15, FILES 20 AND 21

    -rw-r--r-- 1 syoung root  21G Nov 17 06:51 merged.bam
    -rw-r--r-- 1 syoung root 1.2G Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root 2.4G Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root 3.4G Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root 3.6G Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root 4.7G Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root 5.9G Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root 7.0G Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root 8.2G Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root 9.3G Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root  11G Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root  12G Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root  13G Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root  14G Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root  16G Nov  6 03:49 merged.bam-16
    -rw-r--r-- 1 syoung root  18G Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root  19G Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root  20G Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root  21G Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root  21G Nov 15 14:03 merged.bam-21
    -rw-r--r-- 1 syoung root 1.2G Nov  6 21:48 merged.bam-22
    -rw-r--r-- 1 syoung root 4.3G Nov  9 00:11 merged.bam-24
    -rw-r--r-- 1 syoung root 475M Nov 15 10:47 merged.bam-25
    -rw-r--r-- 1 syoung root 5.4G Nov 16 10:55 merged.bam-26
    -rw-r--r-- 1 syoung root 8.6G Nov 16 10:56 merged.bam-27
    -rw-r--r-- 1 syoung root  20G Nov 16 18:54 merged.bam-30
    -rw-r--r-- 1 syoung root 5.1G Nov 16 22:59 merged.bam-31
    -rw-r--r-- 1 syoung root  21G Nov 17 06:59 merged.bam-33
    -rw-r--r-- 1 syoung root  21G Nov 17 04:11 merged.bam.temp
    
ALSO:


merged:

FILES 12 AND 13

    -rw-r--r-- 1 syoung root 1.2G Nov  8 10:55 merged.bam-1
    -rw-r--r-- 1 syoung root 2.4G Nov  8 12:12 merged.bam-2
    -rw-r--r-- 1 syoung root 3.4G Nov  8 12:25 merged.bam-3
    -rw-r--r-- 1 syoung root 3.6G Nov  8 12:27 merged.bam-4
    -rw-r--r-- 1 syoung root 4.7G Nov  8 12:29 merged.bam-5
    -rw-r--r-- 1 syoung root 5.9G Nov  8 12:32 merged.bam-6
    -rw-r--r-- 1 syoung root 7.0G Nov  8 12:35 merged.bam-7
    -rw-r--r-- 1 syoung root 8.2G Nov  8 12:39 merged.bam-8
    -rw-r--r-- 1 syoung root 9.3G Nov  8 12:44 merged.bam-9
    -rw-r--r-- 1 syoung root  11G Nov  8 11:00 merged.bam-10
    -rw-r--r-- 1 syoung root  12G Nov  8 11:06 merged.bam-11
    -rw-r--r-- 1 syoung root  13G Nov  8 11:13 merged.bam-12
    -rw-r--r-- 1 syoung root  14G Nov  8 11:20 merged.bam-13
    -rw-r--r-- 1 syoung root  15G Nov  8 11:27 merged.bam-14
    -rw-r--r-- 1 syoung root  15G Nov  8 11:35 merged.bam-15
    -rw-r--r-- 1 syoung root  16G Nov  8 11:43 merged.bam-16
    -rw-r--r-- 1 syoung root  18G Nov  8 11:52 merged.bam-17
    -rw-r--r-- 1 syoung root  19G Nov  8 12:01 merged.bam-18
    -rw-r--r-- 1 syoung root  20G Nov  8 12:11 merged.bam-19
    -rw-r--r-- 1 syoung root  21G Nov  8 12:23 merged.bam-20
    -rw-r--r-- 1 syoung root 1.2G Nov  8 12:23 merged.bam-22

maq (cumulative2)
---

BROKEN AFTER FILE 9

    -rw-r--r-- 1 syoung root 1.2G Nov 12 15:45 merged.bam-1
    -rw-r--r-- 1 syoung root 2.4G Nov 12 16:27 merged.bam-2
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 17:41 merged.bam-3
    -rw-rw-rw- 1 syoung root 4.7G Nov 12 19:16 merged.bam-4
    -rw-rw-rw- 1 syoung root 5.8G Nov 12 21:05 merged.bam-5
    -rw-rw-rw- 1 syoung root 7.0G Nov 12 23:28 merged.bam-6
    -rw-rw-rw- 1 syoung root 8.1G Nov 13 02:13 merged.bam-7
    -rw-rw-rw- 1 syoung root 9.2G Nov 13 05:17 merged.bam-8
    -rw-rw-rw- 1 syoung root  11G Nov 13 08:49 merged.bam-9

    -rw-rw-rw- 1 syoung root 1.9G Nov 13 12:42 merged.bam-10

    -rw-rw-rw- 1 syoung root  12G Nov 13 12:46 merged.bam-11
    -rw-rw-rw- 1 syoung root  13G Nov 13 17:00 merged.bam-12
    -rw-rw-rw- 1 syoung root  14G Nov 13 21:23 merged.bam-13
    -rw-rw-rw- 1 syoung root  15G Nov 14 01:24 merged.bam-14
    -rw-rw-rw- 1 syoung root  16G Nov 14 05:36 merged.bam-15
    -rw-rw-rw- 1 syoung root  18G Nov 14 09:48 merged.bam-16
    -rw-rw-rw- 1 syoung root  19G Nov 14 13:59 merged.bam-17
    -rw-rw-rw- 1 syoung root 4.7G Nov 14 18:15 merged.bam-18
    -rw-rw-rw- 1 syoung root  20G Nov 14 18:24 merged.bam-19
    -rw-rw-rw- 1 syoung root  21G Nov 14 22:29 merged.bam-20
    -rw-r--r-- 1 syoung root 5.2G Nov 15 10:37 merged.bam-23
    -rw-r--r-- 1 syoung root 5.5G Nov 16 14:55 merged.bam-33





</entry>

<entry [Tue Nov 23 00:06:01 EST 2010] DID TRIAGE ON ALIGNMENTS AND DELETED ALIGNMENT SUBDIRS ON PEGASUS>

bowtie     
    cumulative
    cumulative2

bowtie-rf  
    cumulative
    cumulative2

eland     
    cumulative

maq        
    cumulative
    cumulative2

novoalign  
    cumulative
    cumulative2








ALIGNMENT DIRS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22

drwxrwxrwx 39 syoung root   460 Nov 12 13:39 bowtie
drwxrwxr-x 35 syoung root   387 Nov  5 14:27 bowtie-fr
drwxrwxr-x 39 syoung root   458 Nov 12 13:44 bowtie-rf
drwxrwxr-x 37 syoung root   500 Nov  9 11:21 eland
drwxrwxrwx 40 syoung root   477 Nov 15 11:21 maq
drwxrwxr-x 53 syoung root  2641 Nov 22 00:35 maq3
-rw-rw-r--  1 syoung root 86275 Nov 22 23:52 merged
drwxrwxr-x 38 syoung root   444 Nov 15 01:29 novoalign


BOWTIE
------

NB: PROBLEM WITH MERGED FILES 13 AND 14
    -rw-rw-rw- 1 syoung root 3859221748 Nov 12 21:17 merged.bam-13 <=== IDENTICAL
    -rw-rw-rw- 1 syoung root 3859221748 Nov 12 21:17 merged.bam-14 <=== IDENTICAL


screen -S cleanup

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
    OK
    

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie \
--references chr22





BOWTIE-RF
---------

screen -S bowtie-rf-cleanup

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf
    
    Cluster.pl    Run time: 00:00:20
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 10:37:58
    Cluster.pl    ****************************************
    

OOPS  REMOVED THESE DIRS:

subdir: 9
subfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/37
subfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/19
...
subfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/16


/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf




BOWTIE-FR
---------

screen -S rm-bowtie-fr

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr \
--references chr22

    Cluster.pl    Run time: 00:28:58
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:31:58
    Cluster.pl    ****************************************






MAQ
---

screen -S rm-maq

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
    
    Cluster.pl    Run time: 00:17:01
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 00:59:09
    Cluster.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq \
--references chr22
    
    NOTE WEIRD ERROR MESSAGES:
    
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/4
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/41
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/43
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/43': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/22
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/22': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/10
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/10': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/29
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/29': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/1
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/1': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/49
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/49': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/38
    rm: cannot remove directory `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/38': No such file or directory
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/33
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/31
    rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31/chr22/47
    Cluster.pl    Run time: 00:11:24
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:20:38
    Cluster.pl    ***************************************



MAQ-3
-----

screen -S rm-maq-3

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode splitfiles \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
    
    Cluster.pl    Run time: 00:17:01
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 00:59:09
    Cluster.pl    ****************************************

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq \
--references chr22
        
    Cluster.pl    Run time: 00:10:23
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:20:38
    Cluster.pl    ****************************************




ELAND-2
-------

screen -S rm-eland

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland \
--references chr22

    Cluster.pl    Run time: 00:43:54
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:50:18
    Cluster.pl    ****************************************

PROBLEM WITH FILES 17 AND 18

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22
ll merged.bam*
    
    -rw-rw-rw- 1 syoung root 3769640811 Nov 13 07:15 merged.bam
    -rw-rw-rw- 1 syoung root  134035392 Nov  9 11:23 merged.bam-1
    -rw-rw-rw- 1 syoung root  261407213 Nov  9 11:29 merged.bam-2
    -rw-rw-rw- 1 syoung root  386048869 Nov  9 11:36 merged.bam-3
    -rw-rw-rw- 1 syoung root  508951572 Nov  9 11:45 merged.bam-4
    -rw-rw-rw- 1 syoung root  630573401 Nov  9 11:57 merged.bam-5
    -rw-rw-rw- 1 syoung root  751236141 Nov  9 12:10 merged.bam-6
    -rw-rw-rw- 1 syoung root  871035613 Nov  9 12:26 merged.bam-7
    -rw-rw-rw- 1 syoung root  990276539 Nov  9 12:43 merged.bam-8
    -rw-rw-rw- 1 syoung root 1109034499 Nov  9 13:02 merged.bam-9
    -rw-rw-rw- 1 syoung root 1227269825 Nov 12 11:27 merged.bam-10
    -rw-rw-rw- 1 syoung root 1345029642 Nov 12 11:51 merged.bam-11
    -rw-rw-rw- 1 syoung root 1462296572 Nov 12 12:16 merged.bam-12
    -rw-rw-rw- 1 syoung root 1579406988 Nov 12 12:46 merged.bam-13
    -rw-rw-rw- 1 syoung root 1696338738 Nov 12 13:18 merged.bam-14
    -rw-rw-rw- 1 syoung root 1812712165 Nov 12 13:52 merged.bam-15
    -rw-rw-rw- 1 syoung root 1928813360 Nov 12 16:07 merged.bam-16
    -rw-rw-rw- 1 syoung root 2044821360 Nov 12 16:43 merged.bam-17 <==== IDENTICAL
    -rw-rw-rw- 1 syoung root 2044821360 Nov 12 16:45 merged.bam-18 <==== IDENTICAL
    -rw-rw-rw- 1 syoung root 2160588640 Nov 12 17:33 merged.bam-19
    -rw-rw-rw- 1 syoung root 2276310330 Nov 12 18:26 merged.bam-20
    -rw-rw-rw- 1 syoung root 2391905475 Nov 12 19:14 merged.bam-21
    -rw-rw-rw- 1 syoung root 2507035329 Nov 12 20:03 merged.bam-22
    -rw-rw-rw- 1 syoung root 2622205954 Nov 12 20:54 merged.bam-23
    -rw-rw-rw- 1 syoung root 2737414958 Nov 12 21:48 merged.bam-24
    -rw-rw-rw- 1 syoung root 2852502856 Nov 12 22:45 merged.bam-25
    -rw-rw-rw- 1 syoung root 2967307488 Nov 12 23:44 merged.bam-26
    -rw-rw-rw- 1 syoung root 3082266441 Nov 13 00:55 merged.bam-27
    -rw-rw-rw- 1 syoung root 3197112370 Nov 13 01:53 merged.bam-28
    -rw-rw-rw- 1 syoung root 3311662588 Nov 13 02:52 merged.bam-29
    -rw-rw-rw- 1 syoung root 3426257145 Nov 13 03:54 merged.bam-30
    -rw-rw-rw- 1 syoung root 3540624185 Nov 13 04:59 merged.bam-31
    -rw-rw-rw- 1 syoung root 3655205850 Nov 13 06:07 merged.bam-32
    -rw-rw-rw- 1 syoung root 3769640811 Nov 13 07:17 merged.bam-33
    -rw-rw-rw- 1 syoung root 3769640671 Nov 13 06:38 merged.bam.temp




NOVOALIGN

REACHED FILE 25 - RERAN FROM FILE 26 (SEE ABOVE)

screen -S rm-novo

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl \
--mode subdirs \
--directory /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign \
--references chr22

    Cluster.pl    Run time: 00:09:15
    Cluster.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/cleanup.pl
    Cluster.pl    10-11-23 16:17:25
    Cluster.pl    ****************************************


/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign



hit.sam FILES SEEM OKAY:


/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2
[syoung@u01 cumulative2]$ cd ..
[syoung@u01 novoalign]$ ll */chr22/hit.sam
    -rw-rw-rw- 1 syoung root 864M Nov  5 06:19 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 873M Nov  5 06:17 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:19 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 876M Nov  5 06:12 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 858M Nov  5 06:17 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:19 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:17 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 863M Nov  5 06:35 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 842M Nov  5 06:34 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 837M Nov  5 06:34 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 874M Nov  4 16:17 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 864M Nov  5 06:38 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 868M Nov  5 06:43 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 863M Nov  5 06:45 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 869M Nov  5 06:44 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:42 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 873M Nov  5 06:39 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 877M Nov  5 06:45 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 868M Nov  5 06:45 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 867M Nov  5 06:39 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 864M Nov  5 06:42 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 869M Nov  5 06:14 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 865M Nov  5 06:44 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 869M Nov  5 06:45 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 872M Nov  5 06:39 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 852M Nov  5 06:36 33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 874M Nov  5 06:19 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 871M Nov  5 06:16 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 870M Nov  5 06:19 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 860M Nov  5 06:17 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 873M Nov  5 06:15 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 876M Nov  5 06:17 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 860M Nov  5 06:18 9/chr22/hit.sam




RAN FINE FOR 4 FILES THEN FAILED AT FILE 5:


emacs cumulativeSnp-chr22-5-stdout.txt

    ...
    [sam_header_read2] 1 sequences loaded.
    
    real    1m2.485s
    user    0m57.448s
    sys     0m3.174s
    open: No such file or directory
    [bam_merge_core] fail to open file /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam
    ...


EVEN THOUGH THE FILE IS QUESTION IS PRESENT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam

    -rw-rw-rw- 1 syoung root 1.1G Nov 17 01:21 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll cumulativeSnp-chr22-5-stdout.txt

    -rw-rw-rw- 1 syoung root 2.4K Nov 17 01:11 cumulativeSnp-chr22-5-stdout.txt



NOTE: THE FILE IN QUESTION IS DATED LATER THAN THE END OF THE OUTPUT FILE!!



</entry>

<entry [Tue Nov 23 00:05:01 EST 2010] GENOTYPES IN pileup OUTPUT>

http://sourceforge.net/apps/mediawiki/samtools/index.php?title=SAM_FAQ]

GENOTYPE IS 4TH COLUMN:

genotype where heterozygotes are encoded in the IUB code: M=A/C, R=A/G, W=A/T, S=C/G, Y=C/T and K=G/T; indels are indicated by, for example, */+A, -A/* or +CC/-C. There is no difference between */+A or +A/*.



</entry>

<entry [Tue Nov 23 00:04:01 EST 2010] SNP CALLING ALGORITHMS>


GENOMICS PIPELINE DEFAULT SNP PREDICTION SETTINGS (SNP.pm):

#### GET RAW VARIANT CALLS AND FILTER VARIANT CALLS
samtools pileup -vcf samtools_index/referencefile mergedfile > rawfile
samtools.pl varFilter -D100 rawfile > filterfile

#### QUALITY FILTER VARIANTS TO GENERATE SNP FILE
awk '(\3=="*"&&\6>=50)||(\3!="*"&&\6>=20)' filterfile > snpfile



    SAMTOOLS SNP FILTER

The resultant output should be further filtered by:

samtools.pl varFilter raw.pileup | awk '$6>=20' > final.pileup  
to rule out error-prone variant calls caused by factors not considered in the statistical model.

PILEUP FORMAT:

An example of the ten-column pileup format:
 1         2      3   4   5    6   7   8       9       10
chrM  412  A  A  75   0  25  2       .,       II
chrM  413  G  G  72   0  25  4     ..t,     IIIH
chrM  414  C  C  75   0  25  4     ...a     III2
chrM  415  C  T  75  75  25  4     TTTt     III7

Column  Definition
    1   Chromosome
    2   Position (1-based)
    3   Reference base at that position
    4   Consensus bases
    5   Consensus quality
    6   SNP quality
    7   Maximum mapping quality
    8   Coverage (# reads aligning over that position)
    9   Read bases
   10   Base quality values (phred33 scale)






BOWTIE PAPER (VS MAQ AND SOAP)
http://genomebiology.com/2009/10/3/R25



PAIRED END ALIGNMENT DIFFERENCES
http://seqanswers.com/forums/showthread.php?t=1600


Li Heng: NovoAlign is the most accurate aligner mainly because it sees many suboptimal hits and achieves highest pairing fraction.


 04-27-2009, 12:45 PM	   #5
lh3
Senior Member
 
Join Date: Feb 2008
Location: Boston
Posts: 391

Actually there are a lot to say about paired-end mapping. This is where the accuracy of different aligners differs. The algorithms can be classified into four groups.

a) Eland-like strategy. Eland finds up to 10 equally best hits first and then check which pair (10x10 in total) is consistent. SSAHA2 uses a similar strategy, but seeing more top hits.

b) SOAP-like strategy. SOAP finds almost all the hits and then pair them. I do not know whether it may map a read to a suboptimal position if its mate is hanging around. I am sure SOAP-2.0.1 and BWA do this if necessary. You can say a) and b) are essentially the same, but only b) is useful to anchor reads in repeats.

c) MAQ-like strategy. MAQ does not find all the single-end hits first. It pairs the reads while doing the alignment. For programs indexing reads, this strategy is more effective and efficient than collecting all the single-end hits first.

d) We can map one end first and then do local alignment around the region pointed by the mapped reads. This strategy is usually combined with the previous. I believe NovoAlign/MAQ/BWA use this strategy as a complement to other strategies.

For short reads, proper pairing increases the coverage of the genome and substantially reduce false alignments.




 04-27-2009, 12:54 PM	   #6
nilshomer
Moderator
 
Join Date: Nov 2008
Location: Los Angeles, CA, USA
Posts: 715

Quote:
Originally Posted by lh3  
For short reads, proper pairing increases the coverage of the genome and substantially reduce false alignments.
The above is exactly right, although it may depend on the exact experiment. For example cancer sequencing we expect many translocations, or large-scale rearrangements, and preferring "paired reads" may reduce our power.

In general, if an aligner produces all hits for each end, any post-alignment filtering is possible (all the above classes). Of course some limit must be placed on the number of hits returned (thousands is overkill), since my 4 petabyte array of solid state hard drives has yet to arrive in the mail.


 04-27-2009, 12:54 PM	   #6
nilshomer
Moderator
 
Join Date: Nov 2008
Location: Los Angeles, CA, USA
Posts: 715

Quote:
Originally Posted by lh3  
For short reads, proper pairing increases the coverage of the genome and substantially reduce false alignments.
The above is exactly right, although it may depend on the exact experiment. For example cancer sequencing we expect many translocations, or large-scale rearrangements, and preferring "paired reads" may reduce our power.

In general, if an aligner produces all hits for each end, any post-alignment filtering is possible (all the above classes). Of course some limit must be placed on the number of hits returned (thousands is overkill), since my 4 petabyte array of solid state hard drives has yet to arrive in the mail.



 04-27-2009, 01:15 PM	   #7
lh3
Senior Member
 
Join Date: Feb 2008
Location: Boston
Posts: 391

On the contrary, my experience is detecting structural variations (SVs) particularly presses for highly effective pairing. In the real world, abnormal pairs are most likely to be caused by false alignments rather than true SVs, which is also true for cancer genomes. And if a read can be paired with its mate, the alignment tends to be correct. I know several groups on detecting SVs put a lot of effort on getting more reads paired.

Whether keeping all hits is a debate. Surely we can recover anything, but the cost is considerable. How to use them effectively for SV detection is also an open question, I think. In addition, for effective pairing, keeping thousands of hits or keeping equally best hits only is not good enough. It is important to see sufficient suboptimal hits. NovoAlign is the most accurate aligner mainly because it sees many suboptimal hits and achieves highest pairing fraction.

Alignment accuracy is no so important for resequencing, but it is one of the most important factors for SV detection.




 04-27-2009, 01:46 PM	   #9
nilshomer
Moderator
 
Join Date: Nov 2008
Location: Los Angeles, CA, USA
Posts: 715

What I don't follow is if you align each end separately you will get the highest pairing fraction, since you are the very sensitive in this case (fewer constraints, in fact no constraints between each end). Furthermore, using one end to infer hits for the other can also increase sensitivity.

In my own experience, if one is sensitive enough, potentially false SVs (due to mapping) can be eliminated since by examining the secondary hits for each end, and seeing if there exists a pair of alignments for each end that fall within the expected insert size distribution that are not too much worse than the "best pair". Is this what you are talking about? If so, then we agree.

I would take exception to Novoalign being the most accurate, since this is conditional on sensitivity, as well as the many definitions of "accuracy".

Finally, I think you and I have a fundamental disagreement between what an aligner should do. I think it should return all hits for a given read that it can find (sensitivity), and let the user filter/choose the best alignment or alignment pair based on their experiment. I would prefer gapped smith-waterman, but this could vary based on experiment. Given this, I agree to disagree.

The aligner is but one step in the whole process, and everything shouldn't be lumped into the alignment algorithm.





SEQUENCE VARIANT ANALYZER (DUKE)

THREE POINTS:

1. DEPTH THRESHOLD > 10X FOR 99.30% HOMOZYGOUS SNP CORRECT CALLING

2. 'Gene Prioritization' = LIST OF TRUNCATED/NON-SYN PROTEINS PRIORITIZED BY PROPORTION TEST/CONTROL RATIO

3. 'intolerable' NON-SYNONYMOUS SNPs PREDICTED USING MAPP 
http://mendel.stanford.edu/SidowLab/downloads/MAPP/index.html




http://people.genome.duke.edu/~dg48/sva/inputs.php



SVA users need to prepare four (4) types of input files for an SVA project. All these files, except for type 3, can be generated from a pileup file, a format first used by Tony Cox and Zemin Ning at the Sanger Institute. This pileup file can be generated from software tools, for example, SAMtools, in a next-generation sequencing study. However, please note that the specific pileup format we used here is a bit different from the default SAMtools output format described here. Later in this page I will include detailed information and programs to generate those files.

These 4 types of files are:

A list of identified single nucleotide variants (SNVs) in a specific pileup format - text file with file name extension .samtools;
A list of identified insertion/deletion s(INDELs) in a specific pileup format - text file with file name extension .samtoolsindels;
(Optional) A list of structural variations (SVs) in HMMCNV output format - text file with file name extension .events;
A chromosome-wise coverage and quality control data file, generated from SAMtools pileup output.- binary file with file name extension .bco
In addition, there is an optional pedinf file for an SVA project. This file lists the subjects in a linkage format. This file is not necessary for SVA annotation tasks, but is necessary for some SVA analysis and exporting functions.

Optional pedinf file :

pedinf file: listing the subjects in a linkage format, consisting of six columns, seperated by space or tab:

Family ID, Individual ID, Father ID, Mother ID, Gender (1=male, 2=female), Affected status (1=control, 2=case, -9=unknown) 

Here is an example for this file.

hemo0001 hemo0001 0 0 1 2
hemo0004 hemo0004 0 0 1 2
hemo0005 hemo0005 0 0 1 2
hemo0006 hemo0006 0 0 1 2
hemo0007 hemo0007 0 0 1 2
hemo0011 hemo0011 0 0 1 2
hemo0017 hemo0017 0 0 1 2
hemo0019 hemo0019 0 0 1 2
hemo0020 hemo0020 0 0 1 2
hemo0022 hemo0022 0 0 1 2
control1 control1 0 0 1 1
control2 control2 0 0 1 1
control3 control3 0 0 1 1
control4 control4 0 0 1 1
control5 control5 0 0 1 1
control6 control6 0 0 1 1
control7 control7 0 0 1 1
control8 control8 0 0 1 1
control9 control9 0 0 1 1
control10 control10 0 0 1 1



Using SVA Analysis functions - Gene Prioritization
http://people.genome.duke.edu/~dg48/sva/analysis_genepri.php


The 'Gene Prioritization' function produces a list of protein coding genes that are 'knocked out' by homozygous variants in case genomes. This analysis prioritizes genes by the number of cases containing homozygous protein truncating or non-synonymous genetic variants, absent in control genomes. By this definition, different variants in the same gene are allowed and contribute equally to the ranking of this gene. In other words, this analysis tries to answer this simple question: do you see enrichment of protein-truncating (optionally, or non-synonymous) variants in any gene in the cases, when compared to control genomes?

Your SVA project must contain at least one case and one control for this function to work. Your SVA project must contain at least two cases for this function to reliably prioritize knocked out genes (with only one case, all homozygous knock out variants are listed but they all have the same liklihood of impacting case phenotype).



Function of genetic variant

This section allows you to select the types of 'knock out' variants you wish to include. The three options are:
'Protein truncation only'. This is the default setting and includes all homozygous variants that result in a premature trunction of a protein. Protein truncating mutations will always be included in the output.
'Including non-synonymous SNPs'. This setting includes both protein truncating variants and homozygous SNPs resulting in the change of an amino acid residue in the resulting protein.
'For non-synonymous SNPs: including only intolerable NS change'. This setting is supplementary to option number #2. When checked, an additional filter is applied to the non-synonymous SNPs by eliminating any 'tolerable' non-synonymous SNPs. Note: The status of an 'intolerable' non-synonymous SNP is determined using the MAPP software (http://mendel.stanford.edu/SidowLab/downloads/MAPP/index.html).



Criteria for homozygous variants

This section allows you to adjust the coverage you want to require for a homozygous variant. This will impact the number of variants that show up on your gene prioritization output. If you do not care about coverage (i.e. confidence) of the homozygous variants, you can uncheck 'Minimum coverage for a homozygous variant'. Otherwise the default parameters are set as follows: 
 	Number of sequencing reads
Autosomes (case):	10
Sex chromosomes (case):	5
Autosomes (control):	10
Sex chromosomes (control):	5


A brief explanation of default parameters for homozygous variants: 

In order to determine reliable default parameters, a number of whole genome sequence samples were analyzed for the coverage (read depth) distribution for confident 'homozygous' SNPs called by SAMtools. The coverage data was compared to the 1 million SNP chip data for the same sample. This analysis revealed the following:

Mistakenly called homozygous SNPs (defined by mismatch with 1M chip), had an average read depth of 7.03, with a median of 5.
Correctly called homozygous SNPs (defined by match with 1M chip), had an average read depth of 23.48, with a median of 24.
When a read depth threshold is not specified, 97.2% homozygous SNPs can be correctly called.
When a read depth threshold of >=10X is specified, then 99.30% homozygous SNPs can be correctly called.
These data suggest that a read depth threshold needs to be considered when you define a SNP as homozygous.  
If you want a lower false negative, but a relatively higher false positive (sensitivity is high), then use a lower threshold in cases but higher threshold in controls.
If you want a higher false negative, but a relatively lower false positive (specificity is high), then use a higher threshold in cases but lower threshold in controls.
Genetic model

This section allows you to select the genotype of the variant (heterozygous or homozygous) that you will allow to be present in your control genomes. The target variations in your cases are unaffected by this setting (still homozygous knock out variants).
'Recessive model (allowing for heterozygotes in controls)'. This is the default setting. This setting allows for any target variant to be present in control genomes in heterozygous form.
Alternately, you have an option to specify a model 'not allowing heterozygotes' in control genomes. This means that only target variants for which the control genomes are homozygous for the reference allele will appear on the Gene Prioritization output.
Control genomes

If 'check control samples for reference sequence' is unchecked, then all homozygous variants are listed, not just those unique to the cases. This function is disabled since you always want this function to check control samples for the reference sequence.
You may choose to 'Treat Venter's sequence as a control genome' by clicking the check box next to this option.




RICHARD DURBIN'S glfprogs WITH GENOTYPING PRIORS

http://maq.sourceforge.net/glfProgs.shtml



FASTQ FORMAT PAPER

http://ukpmc.ac.uk/articles/PMC2847217;jsessionid=B7ED82A1835DDBEAA28205A653F8CCD9.jvm4


BAM FORMAT

(FROM SAMTOOLS PAPER)

Binary Alignment/Map (BAM) format To improve the performance,
we designed a companion format BAM, which is the binary representation of
SAM and keeps exactly the same information as SAM. BAM is compressed
by the BGZF library, a generic library developed by us to achieve fast
random access in a zlib-compatible compressed file. An example alignment
of 112Gbp of Illumina GA data requires 116GB of disk space (1.0 byte per
input base), including sequences, base qualities and all the meta information
generated by MAQ. Most of this space is used to store the base qualities.
Sorting and indexing A SAM/BAM file can be unsorted, but sorting
by coordinate is used to streamline data processing and to avoid loading
extra alignments into memory.

A position-sorted BAM file can be indexed.
We combine the UCSC binning scheme (Kent et al., 2002) and simple
linear indexing to achieve fast random retrieval of alignments overlapping
a specified chromosomal region.


In most cases, only one seek call is needed
to retrieve alignments in a region.


NB: LINEAR INDEXING IS A SIMPLE LOOKUP USING SUBSETS TO REDUCE TIME
http://blogs.mathworks.com/steve/2008/02/08/linear-indexing/


3 CONCLUSION
We designed and implemented a generic alignment format, SAM,
which is simple to work with and flexible enough to keep most
information from various sequencing platforms and read aligners.
The equivalent binary representation, BAM, is compact in size and
supports fast retrieval of alignments in specified regions. Using
positional sorting and indexing, applications can perform streambased
processing on specific genomic regions without loading the
entire file into memory. The SAM/BAM format, together with
SAMtools, separates the alignment step from downstream analyses,
enabling a generic and modular approach to the analysis of genomic
sequencing data.



</entry>

<entry [Mon Nov 22 21:11:23 EST 2010] MAQ AND SAMTOOLS SNP CALLING>

Shen et al 2009
A SNP discovery method to assess variant allele probability from next-generation resequencing data


Currently, there are several methods available for detecting SNPs from NGS data, including Pyrobayes (Quinlan et al. 2008), POLYBAYES (Marth et al. 1999), MAQ (Li et al. 2008), SOAP (Li et al. 2009), VarScan (Ley et al. 2008; Koboldt et al. 2009), and other largely heuristic approaches (Wheeler et al. 2008). Pyrobayes-POLYBAYES recalibrates base-calling of all nucleotide positions from raw data, and then takes a Bayesian approach that incorporates the population polymorphism rates as priors to identify polymorphic sites.

**** MAQ uses the consensus of the aligned reads to identify SNPs. While MAQ is able to achieve high sensitivity, it can result in an expected high false-positive rate due to intrinsic high probabilities of sequencing errors in NGS data (Li et al. 2008).

VarScan and other available heuristic approaches that apply empirical covariate cutoffs can work well for specific projects, but become problematic with applications even with slight differences in underlying data.



MAQ SNP CALLING

from the PDF manual/published paper: maq for indels needs paired end reads. maps read 1, then does gapped alignment of read 2. maq indelpe will list the indels called from the read2 gapped alignment.


http://seqanswers.com/forums/showthread.php?t=554
try novocraft software if you want more indels from single end or paired end reads.



How are SNPs and indels called and filtered by SAMtools?
http://sourceforge.net/apps/mediawiki/samtools/index.php?title=SAM_FAQ


By default, SNPs are called with a Bayesian model identical to the one used in MAQ. A simplified SOAPsnp model is implemented, too. Indels are called with a simple Bayesian model. The caller does local realignment to recover indels that occur at the end of a read but appear to be contiguous mismatches. For an example, see this picture.

http://samtools.sourceforge.net/images/seq2-156.png


The varFilter filters SNPs/indels in the following order:
d: low depth
D: high depth
W: too many SNPs in a window (SNP only)
G: close to a high-quality indel (SNP only)
Q: low root-mean-square (RMS) mapping quality (SNP only)
g: close to another indel with more evidence (indel only)
The first letter indicates the reason why SNPs/indels are filtered when you invoke varFilter with the `-p' option. A SNP/indel filtered by a rule higher in the list will not be tested against other rules.


I see `*' in the pileup sequence column. What are they?

A star at the sequence column represents a deletion. It is a place holder to make sure the number of bases at that column matches the read depth column. Simply ignore `*' if you do not use this information.




I only want to use a subset of alignments in pileup.

If you want to filter on mapping quality, flags, one read group or one library, you may just use the view command. If want to apply more complex filters, you may write an awk command for SAM. For example, I only want to use alignment with two or fewer differences (mismatches+gaps):
samtools view -h aln.bam | perl -ne 'print if (/^@/||(/NM:i:(\d+)/&&$1<=2))' | samtools pileup -S - > out.txt
or exclude all gapped alignments:
samtools view -h aln.bam | awk '$6!~/[ID]/' | samtools pileup -S -




I want to get `unique' alignments from SAM/BAM.

We prefer to say an alignment is `reliable' rather than `unique' as `uniqueness' is not well defined in general cases. You can get reliable alignments by setting a threshold on mapping quality:
samtools view -bq 1 aln.bam > aln-reliable.bam
You may want to set a more stringent threshold to get more reliable alignments.




MAQ PAPER
http://genome.cshlp.org/content/18/11/1851.long
Mapping short DNA sequencing reads and calling variants using mapping quality scores

ITERATIVE MAPPING:

At the alignment stage, we should set the minimum base error probability as the rate of differences between the reference and the reads. However, this strategy is an approximation.

When there are differences between the reference and reads, the
best position might consistently give wrong alignments even if
there are no sequencing errors, which can invalidate the calculation
of mapping qualities.

It would be possible in an iterative
scheme to update the reference with an estimate of the new
sample sequence from the first mapping and then remap to the
updated reference.



DESCRIPTION OF COMPETITORS:


We also introduce a new statistical model for consensus genotype
calling and subsequent SNP calling. For capillary reads,
two different approaches have previously been taken to calling
SNPs. The first type of approach works on PCR resequencing data
from diploid samples. These algorithms directly examine chromatogram
trace files and detect variants by extracting or comparing
signals in the peaks of traces. The most widely used software
includes PolyPhred (Stephens et al. 2006), SNPdetector
(Zhang et al. 2005), and novoSNP (Weckx et al. 2005), each of
which can call the genotype of the sample as well as detect variants.
The second type of approach works for clone-based data.
They are usually built upon phred base calls and detect variants by
detecting base-pair differences between a read from a single haplotype
and the reference sequence. Two representative software
of this type are ssahaSNP (Ning et al. 2001) and PolyBayes (Marth
et al. 1999). While ssahaSNP uses a heuristic rule known as the
neighborhood quality standard (NQS) (Altshuler et al. 2000),
PolyBayes develops an explicit statistical framework to model
variants.

All new sequencing technologies are shotgun methods that
give sequences derived from a single molecule sampled from a
larger population. (Current methods amplify the starting template
by some form of PCR, but true single molecule methods are
expected in the future.) This means the methods for calling variants
from new technology data are most closely related to the
second group described above, including ssahaSNP and Poly-
Bayes. However, because of sampling and error rate, we need to
combine data from multiple reads. In practice, errors at a particular
site are correlated, and we must take this correlation into
account. This is analogous to calling a consensus from a sequence
assembly, and we propose a Bayesian approach to this issue that
is related to that used in assembly software CAP3 (Huang and
Madan 1999).

In summary, this article presents methods and software for
mapping short sequence reads to a reference genome, calculating
the probability of a read alignment being correct, and consensus
genotype calling with a model that incorporates correlated errors
and diploid sampling. The applicability and accuracy of the
methods are evaluated based on both real data from the bacterium
Salmonella paratyphi and simulated data from the diploid
human X chromosome.



MAQ OVERVIEW

Overview of MAQ algorithms

MAQ is a program that rapidly aligns short reads to the reference
genome and accurately infers variants, including SNPs and short
indels, from the alignment.

At the alignment stage, MAQ first searches for the ungapped
match with lowest mismatch score, defined as the sum of qualities
at mismatching bases. To speed up the alignment, MAQ only
considers positions that have two or fewer mismatches in the
first 28 bp (default parameters). Sequences that fail to reach a
mismatch score threshold but whose mate pair is mapped are
searched with a gapped alignment algorithm in the regions defined
by the mate pair.


To evaluate the reliability of alignments,
MAQ assigns each individual alignment a phred-scaled quality
score (capped at 99), which measures the probability that the true
alignment is not the one found by MAQ.

**** MAQ always reports a
single alignment, and if a read can be aligned equally well to
multiple positions, MAQ will randomly pick one position and
give it a mapping quality zero.

**** Because their mapping score is set
to zero, reads that are mapped equally well to multiple positions
will not contribute to variant calling. However, they do give information
on copy number of repetitive sequences and on the
fraction of reads that can be aligned to the genome, and can
easily be filtered out for downstream analysis if desired.


**** Mapping quality scores and mapping all reads that match the genome
even if repetitive are where MAQ differs from most other alignment
programs.

MAQ fully utilizes the mate-pair information of paired
reads. It is able to use this information to correct wrong alignments,
to add confidence to correct alignments, and to accurately
map a read to repetitive sequences if its mate is confidently
aligned. With paired-end reads, MAQ also finds short insertions/
deletions (indels) from the gapped alignment described above.

At the SNP calling stage, MAQ produces a consensus genotype
sequence from the alignment. The consensus sequence is
inferred from a Bayesian statistical model, and each consensus
genotype is associated with a phred quality that measures the
probability that the consensus genotype is incorrect.

Potential SNPs are detected by comparing the consensus sequence to the
reference and can be further filtered by a set of predefined rules.

These rules are designed to achieve the best performance on deep
human resequencing data and aim to compensate for simplifications
and assumptions used in the statistical model (e.g., treating
neighbor positions independently).




MAQ PAPER DISCUSSION


The reliability of short read alignments

The reliability of read alignments can substantially affect the accuracy
of the detection of variations. Knowing which alignment
is reliable is key to the subsequent analyses.

*** The most convenient way to measure the reliability is to define uniqueness: A read is
said to be uniquely mapped if its second best hit contains
more mismatches than its best hit.


Generally this simple criterion
works well, but potential difficulties are illustrated by the
following scenarios:
(1) a read has two one-mismatch hits, one
with a Q30 mismatch and the other with a Q3 mismatch;
(2) a read has one perfect hit and 100 one-mismatch hits;
(3) a read has a perfect hit and a Q3-mismatch hit.

In the first case,
although the read is not unique, the hit with a Q30 mismatch may
still be reliable. In the remaining two cases, although the read can
be uniquely aligned, the alignments are not reliable. For the human
genome, these types of scenarios may happen at times due
to the large fraction of repetitive sequences.

*** In our view, it is better to regard the position a read is
mapped to as a random variable, and the reliability of an alignment
can be naturally interpreted as the likelihood of the read
being mapped to the correct position. At this point, mapping
quality directly measures the reliability. It considers the repeat
structure of the reference and the base quality of read sequences,
which is implied in Equation 1 (see Methods), and can easily
handle the three cases shown above.




MAQ FALSE NEGATIVE AND FALSE POSITIVE

Unlike in an alignment, both FP and FN of SNPs on real data
can be estimated from other sources of data. FP can be evaluated
by capillary resequencing or genotyping a small subset of SNP
calls. FN can be estimated by comparing SNP calls to the wholegenome
chip-genotyping results. The fraction of chipgenotyping
polymorphic sites that are not found is the FN. It
should be noted that such a fraction is only the FN on the sites
where probes can be designed for the genotyping microarray.
These sites tend to be unique in the reference genome and are
usually easier to find by short-read resequencing. The overall FN
across the whole genome is higher.

In resequencing, it is also a good idea to explicitly define the
resequenceable regions (or the regions where SNPs can be confidently
called). We want to distinguish low SNP-density regions
from hard-to-resequence regions. Using MAQ, the fraction of the
human genome that is resequenceable with 35-bp reads is ?85%,
and with read pairs separated by 170 bp it is ?93%. Achieving
higher coverage would require a mixture of varying insert sizes
and longer reads.




MAQ PAIRED END ALIGNMENT ALGORITHM:


Methods

Single end read mapping
To map reads efficiently, MAQ first indexes read sequences and
scans the reference genome sequence to identify hits that are
extended and scored. With the Eland-like (A.J. Cox, unpubl.)
hashing technique, MAQ, by default, guarantees to find alignments
with up to two mismatches in the first 28 bp of the reads.
MAQ maps a read to a position that minimizes the sum of quality
values of mismatched bases.

**** If there are multiple equally
best positions, then one of them is chosen at random.


Paired-end read alignment
MAQ jointly aligns the two reads in a read pair and fully utilizes
the mate-pair information in the alignment.
In the paired-end alignment mode, MAQ will by default
build six hash tables for each end (12 tables in total).

**** In one round of indexing, MAQ indexes the first end with two templates
and the second end also with two templates. Four hash tables,
two for each end, will be put in memory at a time.

***** In the scan of the reference, when a hit of a read is found on the forward strand
of the reference sequence, MAQ appends its position to a queue
that always keeps the last two hits of this read on the forward
strand. When a hit of a read is found on the reverse strand, MAQ
checks the queue of its mate and tests whether its mate has a hit
on the forward strand within a maximum allowed distance ahead
of the current read. If there is one, MAQ will mark the two ends
as a pair. In this way, MAQ jointly maps the reads without independently
storing all the potential hits of each end.


****** For each end, MAQ will only hold in memory two hash
tables corresponding to two complementary templates (e.g.,
11110000 and 00001111 for 8-bp reads). This strategy guarantees
that any hit with no more than one mismatch can be always
found in each round of the scan. Holding more hash tables in
memory would help to find pairs containing more mismatches,
but doing this would also increase memory footprint.
Paired-end mapping qualities are derived from single end
mapping qualities.


********* There are two different cases when a pair can
be wrongly mapped.

In the first case, one of the two ends is
wrongly aligned and the other is correct. This scenario may happen
if a repetitive sequence appear twice or more in a short region.

In the second instance, a pair is wrong because both ends
are wrong at the same time.


In MAQ, if there is a unique pair mapping in which both
ends hit consistently (i.e., in the right orientation within the
proper distance), we give the mapping quality Qp = Qs1+Qs2 to
both reads, assuming independent errors. If there are multiple
consistent hit pairs, we take their single end mapping qualities as
the final mapping qualities.


Detecting short indels

MAQ first aligns reads with the ungapped alignment algorithm
described above and then finds short indels by utilizing matepair
information. Given a pair of reads, if one end can be mapped
with confidence but the other end is unmapped, a possible scenario
is that a potential indel interrupts the alignment of the
unmapped read. For this unmapped read, we can apply a standard
Smith-Waterman gapped alignment (Smith and Waterman
1981) in a region determined by the aligned read. The coordinate
and the size of the region is estimated from the distribution of all
the aligned reads by taking the mean separation of read pairs plus
or minus twice the standard deviation. As Smith-Waterman will
only be applied to a small fraction of reads in short regions,
efficiency is not a serious issue.




Consensus genotype calling
By default, MAQ assumes the sample is diploid. It calculates the
posterior distribution of genotypes and calls the genotype that
maximizes the posterior probability.
Before consensus calling, MAQ first combines mapping
quality and base quality. If a read is incorrectly mapped, any
sequence differences inferred from the read cannot be reliable.
Therefore, the base quality used in SNP calling cannot exceed the
mapping quality of the read. MAQ reassigns the quality of each
base as the smaller value between the read mapping quality and
the raw sequencing base quality.
We first calculate the probability of data given each possible
genotype. In consensus calling, if there are no sequencing errors,
at most two different nucleotides can be legitimately seen. Therefore,
we can consider only the two most frequent nucleotides at
any position and ignore others as errors. Assume we are observing
data D which consist of k nucleotides b and n-k nucleotides
b' with b,b'?{A,C,G,T} and b ' b'. Then the three possible genotypes
are ?b,b?, ?b,b'?, and ?b',b'?. If the true genotype is ?b,b?, we
have n-k errors from n bases. Let the probability of observing

these errors be alpha n,n-k, and therefore P(D|?b,b?) = alpha n,n-k. Similarly we
have P(D|?b',b'?) = alpha nk. If the true genotype is ?b,b'?, the probability
can be approximated with a binomial distribution:
P(D|?b,b'?) = (nk
)/2n.
If we further assume the prior of genotypes is
P(?b,b?) = P(?b',b'?) = (1 - r)/2 and P(?b,b'?) = r, we can calculate
the posterior probability P(g|D) of genotype g given the observation
D. Then the estimated genotype is gˆ = argmaxgP(g|D) with a
quality Qg = -10log10[1 - P(gˆ|D)]. Here r is the probability of
observing a heterozygote. We usually use r = 0.001 for the discovery
of new SNPs and r = 0.2 for inferring genotypes at known
SNP sites. In principle, a site-specific r can be used given known
allele frequencies.

The real difficulty is to calculate alpha nk, the probability of k
errors observed from n nucleotides. If errors arise independently
and error rates are identical for all bases, alpha nk can be calculated
with a binomial distribution. When errors are correlated and not
identical, MAQ approximates alpha nk by

ank ? c’nk theta i=0
k?1
epsilon i+1
 theta i . (2)

Where epsilon i is the ith smallest base error probability and c'nk is a
function of epsilon i but varies little with epsilon i.


**** The only unknown parameter is  theta , which controls the dependency of errors.

The deduction
of this equation and the calculation of c'nk will be presented in
the Supplemental material.


Taking a form like Equation 2 is inspired by CAP3 (Huang
and Madan, 1999), where  theta  is arbitrarily set to 0.5. In principle,  theta 
can be estimated from real data. In practice, however, the estimate
is complicated by the requirement of large data set where
SNPs are known, by the inaccuracy of sequencing qualities, by
the dependencies of mapping qualities, and also by the approximation
made to derive the equation. To estimate  theta , we just tried
different values and selected the one that was giving the best
final genotype calls.


**** We found  theta  = 0.85 is a reasonable value for
Illumina Genetic Analyzer data.
Simulating diploid genomes and short



http://maq.sourceforge.net/maq-manpage.shtml

cns2snp	maq cns2snp in.cns > out.snp
Extract SNP sites. Each line consists of chromosome, position, reference base, consensus base, Phred-like consensus quality, read depth, the average number of hits of reads covering this position, the highest mapping quality of the reads covering the position, the minimum consensus quality in the 3bp flanking regions at each side of the site (6bp in total), the second best call, log likelihood ratio of the second best and the third best call, and the third best call.

The 5th column is the key criterion when you judge the reliability of a SNP. However, as this quality is only calculated assuming site independency, you should also consider other columns to get more accurate SNP calls. Script command ‘maq.pl SNPfilter’ is designed for this (see below).

The 7th column implies whether the site falls in a repetitive region. If no read covering the site can be mapped with high mapping quality, the flanking region is possibly repetitive or in the lack of good reads. A SNP at such site is usually not reliable.

The 8th column roughly gives the copy number of the flanking region in the reference genome. In most cases, this number approaches 1.00, which means the region is about unique. Sometimes you may see non-zero read depth but 0.00 at the 7th column. This indicates that all the reads covering the position have at least two mismatches. Maq only counts the number of 0- and 1-mismatch hits to the reference. This is due to a complex technical issue.

The 9th column gives the neighbouring quality. Filtering on this column is also required to get reliable SNPs. This idea is inspired by NQS, although NQS is initially designed for a single read instead of a consensus.



MAQ snpFilter (USES -D ARGUMENT)


SNPfilter	maq.pl SNPfilter [-d minDep] [-D maxDep] [-Q maxMapQ] [-q minCnsQ] [-w indelWinSize] [-n minNeiQ] [-F in.indelpe] [-f in.indelsoa] [-s minScore] [-m maxAcross] [-a] [-N maxWinSNP] [-W densWinSize] in.cns2snp.snp > out.filtered.snp

Rule out SNPs that are covered by few reads (specified by -d), by too many reads (specified by -D), near (specified by -w) to a potential indel, falling in a possible repetitve region (characterized by -Q), or having low-quality neighbouring bases (specified by -n). If maxWinSNP or more SNPs appear in any densWinSize window, they will also be filtered out together.

    OPTIONS:
    -d INT	 Minimum read depth required to call a SNP [3]
    -D INT	 Maximum read depth required to call a SNP (<255, otherwise ignored) [256]
    -Q INT	 Required maximum mapping quality of reads covering the SNP [40]
    -q INT	 Minimum consensus quality [20]
    -n INT	 Minimum adjacent consensus quality [20]
    -w INT	 Size of the window around the potential indels. SNPs that are close to indels will be suppressed [3]
    -F FILE	 The indelpe output [null]
    -f FILE	 The indelsoa output [null]
    -s INT	 Minimum score for a soa-indel to be considered [3]
    -m INT	 Maximum number of reads that can be mapped across a soa-indel [1]
    -a	 Alternative filter for single end alignment






FEJES SNP CALLING

http://www.fejes.ca/2008/07/snp-calling-from-maq.html




INDEL CALLING - CLUSTERED SNPS REMOVED BY REALIGNMENT
http://www.broadinstitute.org/files/shared/mpg/nextgen2010/nextgen_sivachenko.pdf
NGS Analysis and Visualization Workshop
February 4, 2010
Andrey Sivachenko, Eric Banks


The magnitude of the problem
SNP Calling: Bayesian SNP caller on 10Mb of merged pilot 1
(low coverage) reads for CEU individuals
• There were 74,363 total SNPs called in the region
• Of those SNPS, 36,438 (49%) occurred in clusters
(cluster = 2 or more SNPs within 10bp)
• About half the SNP calls are ignored with naïve filtering!
• Nearby clusters (i.e. less than a read length away) were merged
• There were 3,356 total clusters a/er merging
• 30% of the SNP clusters were removed by realignment



GATK Realignment Pipeline Implementation



where:
JAVA_CMD = java –Xmx4096m –jar <path to GenomeAnalysisTK.jar>
REF = reference fasta file
(e.g. /seq/references/Homo_sapiens_assembly18/v0/Homo_sapiens_assembly18.fasta)


1. Determine small intervals to clean

JAVA_CMD \
-T RealignerTargetCreator \
-R REF \
–I <my_reads.recal.bam> \
-o <target.intervals>


2. Realignment

JAVA_CMD -R REF \
-l INFO \
-T IntervalCleaner \
–I <my_reads.recal.bam> \
-L <target.intervals> \
-O <cleaned.bam> \
-cleanedOnly [-compress 1]


3. Reconstitute original BAM

JAVA_CMD
-T CleanedReadInjector \
-R REF \
–I <my_reads.recal.bam> \
--cleaned_reads <cleaned.bam> \
--output_bam <final.cleaned.bam> \
[-compress 1]





CASAVA/ILLUMINA SNP CALLER

http://www.illumina.com/Documents/products/technotes/technote_snp_caller_sequencing.pdf

CASAVA ALGORITHM:

USES ONLY THESE READ PAIRS:

    NORMAL READS (NO ANOMALOUS PAIRS OR UNPAIRED 'ORPHAN' READS)
    WITHIN 3 STANDARD DEVIATIONS OF EXPECTED GAP SIZE
    CORRECT ORIENTATION
    MINIMUM ALIGNMENT SCORE = 6


CALCULATE ALLELE SCORE 

    1. FOR ALL BASES, CALCULATE E.G. FOR A = log10 P(observed base| no "As" present) 
    2. SUBTRACT LOWEST SCORE FROM OTHER THREE
    3. CONVERT TO LOG-ODDS SCORE, SCORE OF 3 =  PHRED SCORE OF 30
    
SNP CALLING

CALL SNP IF ALLELE SCORE > 10 AND COVERAGES < 3 TIMES CHROMOSOMAL AVERAGE
DEFINED AS HETERZYGOT IF BOTH ALLELES HAVE ALLELE SCORE > 10 AND RATIO OF THEIR SCORES <= 3




CASAVA DRAWBACKS

SNP CALLER NEEDS 30X COVERAGE OR MORE (15X PER HAPLOID ALLELE)

INDELS THAT ARE MISCALLED AS SNPS CAN BE RECOGNIZED BY A DROP IN COVERAGE (ELAND CAN'T DEAL WITH GAPS)

CASAVA 1.0 ONLY USES GENOME REFERENCE FOR SNP CALLING SO ALLELE FREQUENCIES FOR RNA SNPS CLOSE TO SPLICE SITE MAY BE INACCURATE

BY DEFAULT, CASAVA 1.0 DOES NOT CALL SNPS IN HIGH COPY REGIONS (NOT DESIRABLE IN SAY CANCER RESEARCH)



NOTES
-----



http://i.seqanswers.com/question/209/samtools-pileup-snp-quality-distribution

I'll take a stab at this, but I've only briefly looked at the supplemental data in the original MAQ paper (this is the same method for SNP calling used by samtools pileup).

The SNP quality is determined using an estimate of the probabilities. Their estimation only has a certain amount of resolution (because nucleotide counts are always integers), so this is not a continuous function. The phred-like score is likewise not continuous (it gets rounded to an integer), but the number of nucleotides and the SNP quality will be on different scales, resulting in the "divisible by 3" feature you noticed. If the SNP quality and nucleotide counts could be fractional that would likely be pretty smooth. As far as the spikes at 228 and 30, I'm not entirely sure where those come from. With the kind of probability estimation they're using there are often edge cases (when both have equal numbers of reads, when one has exactly one read, when there's only two reads total, etc.) and it's possible that those edge cases get rounded to those particular scores, resulting in their over-representation. I would look to see if the SNPs generating those scores have anything in common.



Samtools pileup SNP quality distribution

The docs say the SNP quality column contains the:

Phred-scaled likelihood that the genotype is identical to the reference, which is also called `SNP quality'. Suppose the reference base is A and in alignment we see 17 G and 3 A. We will get a low consensus quality because it is difficult to distinguish an A/G heterozygote from a G/G homozygote. We will get a high SNP quality, though, because the evidence of a SNP is very strong.






</entry>

<entry [Mon Nov 22 11:19:01 EST 2010] Moose IS INSTALLED ON PEGASUS>

LIBRARY IS HERE:

use lib "/k/local/perl5.x64/site_perl/5.8.8/x86_64-linux-thread-multi";


TO USE:

module load mihg


PRINT OUT 'module load mihg' ENVIRONMENT VARIABLES:

perl -e 'print join "\n", %ENV'

    SSH_CLIENT
    10.150.190.170 3586 22
    SSH_ASKPASS
    /usr/libexec/openssh/gnome-ssh-askpass
    CVS_RSH
    ssh
    LSF_ENVDIR
    /share/apps/lsf/conf
    SGE_QMASTER_PORT
    701
    LESSOPEN
    |/usr/bin/lesspipe.sh %s
    PWD
    /k/local/perl5.x64/5.8.8/x86_64-linux-thread-multi
    LANG
    en_US.UTF-8
    USER
    syoung
    CLICOLOR
    1
    G_BROKEN_FILENAMES
    1
    LOGNAME
    syoung
    SHLVL
    1
    INPUTRC
    /etc/inputrc
    PATH
    /k/analysis/bin:/k/analysis/scripts:/sw/bin:/nethome/syoung/base/bin:/usr/X11R6/bin:/nethome/syoung/base/bin/utils:/home/bioinfo/apps/ngs/bin/nextgen:/home/bioinfo/apps/ngs/bin/exome:/home/bioinfo/apps/ngs/bin/utils:/home/bioinfo/apps/ngs/bin:/nethome/syoung/base/apps/python/python/2.7/bin:/share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/etc:/share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin
    PERL5LIB
    /k/local/perl5.x64/site_perl/5.8.5:/k/local/perl5.x64/site_perl/5.8.6:/k/local/perl5.x64/site_perl/5.8.7:/k/local/perl5.x64/site_perl/5.8.8:/k/local/perl5.i686/site_perl/5.8.5:/k/local/perl5.i686/site_perl/5.8.6:/k/local/perl5.i686/site_perl/5.8.7:/k/local/perl5.i686/site_perl/5.8.8:/k/local/perl5.x64/vendor_perl/5.8.5:/k/local/perl5.x64/vendor_perl/5.8.6:/k/local/perl5.x64/vendor_perl/5.8.7:/k/local/perl5.x64/vendor_perl/5.8.8:/k/local/perl5.i686/vendor_perl/5.8.5:/k/local/perl5.i686/vendor_perl/5.8.6:/k/local/perl5.i686/vendor_perl/5.8.7:/k/local/perl5.i686/vendor_perl/5.8.8:/k/local/perl5.x64:/k/local/perl5.i686
    MODULEPATH
    /share/apps/modules/Modules/versions:/share/apps/modules/Modules/$MODULE_VERSION/modulefiles:/share/apps/modules/Modules/modulefiles:/nethome/sagebase/modulefiles
    MODULE_VERSION_STACK
    3.2.7
    HISTSIZE
    1000
    TERM
    vt100
    LSF_SERVERDIR
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/etc
    SSH_TTY
    /dev/pts/16
    HOME
    /nethome/syoung
    SSH_CONNECTION
    10.150.190.170 3586 10.141.226.121 22
    LD_LIBRARY_PATH
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib
    MANPATH
    /share/apps/lsf/7.0/man:/usr/share/man:
    MODULESHOME
    /share/apps/modules/Modules/3.2.7
    MODULE_VERSION
    3.2.7
    MAIL
    /var/spool/mail/syoung
    module
    () {  eval `/share/apps/modules/Modules/$MODULE_VERSION/bin/modulecmd bash $*`
    }
    LOADEDMODULES
    lsf:mihg
    HOSTNAME
    u01
    SGE_EXECD_PORT
    702
    LSF_BINDIR
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/bin
    OLDPWD
    /k/local/perl5.x64/5.8.8
    LSF_LIBDIR
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib
    _
    /usr/bin/perl
    LS_COLORS
    no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:
    SHELL
    /bin/bash
    XLSF_UIDDIR
    /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib/uid
    SGE_ROOT
    /common/sge
    _LMFILES_
    /share/apps/modules/Modules/3.2.7/modulefiles/lsf:/share/apps/modules/Modules/3.2.7/modulefiles/mihg






PERL5LIB

/k/local/perl5.x64/site_perl/5.8.8

/k/local/perl5.x64/vendor_perl/5.8.8


    
    
    



</entry>

<entry [Fri Nov 19 14:59:47 EST 2010] RUN collateVenns.pl ON ALL snpVenn.pl RUNS>


ELAND 
-----

INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn
lines *-snp

    hit-1-snp-NOT-hit-33-snp	20720
    hit-3-snp-NOT-hit-33-snp	14918
    hit-4-snp-NOT-hit-33-snp	16801
    hit-5-snp-NOT-hit-33-snp	16801
    hit-6-snp-NOT-hit-33-snp	17261


/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--replicates 1-33

    16904   3563    20720
    0       0       0
    17136   3331    14918
    16063   4404    16801
    16063   4404    16801
    14833   5634    17261
    13506   6961    17119
    12377   8090    16585
    11307   9160    15968
    10374   10093   15236
    9507    10960   14457
    8774    11693   13645
    8034    12433   12815
    7440    13027   12058
    6874    13593   11233
    6359    14108   10415
    5905    14562   9724
    5531    14936   8918
    5107    15360   8238
    4740    15727   7610
    4434    16033   7111
    4084    16383   6456
    3739    16728   5882
    3451    17016   5244
    3138    17329   4600
    2795    17672   4142
    2463    18004   3651
    2190    18277   3136
    1853    18614   2606
    1514    18953   2046
    1134    19333   1482
    692     19775   843
    0       20467   0


    collateVenns.pl    Run time: 00:00:01
    collateVenns.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl
    collateVenns.pl    4:00PM, 19 November 2010
    collateVenns.pl    ****************************************




BOWTIE
------

INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn
lines *-snp
    
    hit-10-snp-NOT-hit-33-snp: 36165
    hit-11-snp-NOT-hit-33-snp: 34399
    hit-12-snp-NOT-hit-33-snp: 33194
    hit-13-snp-NOT-hit-33-snp: 32831
    hit-14-snp-NOT-hit-33-snp: 32219
    hit-15-snp-NOT-hit-33-snp: 41382
    ...

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--replicates 1-33
        
    0       0       0       0       0
    12824   1098    38538   13922   39636
    13063   852     38804   13915   39656
    13319   775     38881   14094   39656
    13229   872     38787   14101   39659
    13150   957     38727   14107   39684
    12954   1001    38667   13955   39668
    12465   1298    38373   13763   39671
    12192   1774    37908   13966   39682
    36165   23841   17494   60006   41335
    34399   25531   15773   59930   41304
    33194   27309   13909   60503   41218
    32831   29289   12066   62120   41355 <== SAME NUMBER OF UNIQUE SNPs
    32219   29289   11886   61508   41175 <== SAME NUMBER OF UNIQUE SNPs
    41382   32571   8647    73953   41218
    40631   33305   7864    73936   41169
    39580   33877   7142    73457   41019
    39023   34373   6594    73396   40967
    11870   17379   22909   29249   40288
    11015   18295   21979   29310   40274
    10090   19065   21193   29155   40258
    9190    19853   20440   29043   40293
    8333    20695   19490   29028   40185
    7573    21520   18624   29093   40144
    6778    22292   17847   29070   40139
    5990    22980   17139   28970   40119
    6815    32318   7966    39133   40284
    5781    33275   6989    39056   40264
    4762    34242   5971    39004   40213
    3738    35285   4881    39023   40166
    2752    36311   3837    39063   40148
    1968    37544   2544    39512   40088
    1184    38872   1184    40056   40056


    collateVenns.pl    Run time: 00:00:04
    collateVenns.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl
    collateVenns.pl    4:05PM, 19 November 2010
    collateVenns.pl    ****************************************


GET INPUT FILE LINES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
lines hit-*.sav


hit-1.sav: 17091
hit-2.sav: 16607
hit-3.sav: 16606
hit-4.sav: 16607
hit-5.sav: 16607
hit-6.sav: 16606
hit-7.sav: 16607
hit-8.sav: 16607
hit-9.sav: 16606
hit-10.sav: 71883
hit-11.sav: 71883
hit-12.sav: 71913
hit-13.sav: 71881
hit-14.sav: 71882
hit-15.sav: 78274
hit-16.sav: 78270
hit-17.sav: 78272
hit-18.sav: 78274
hit-19.sav: 35748
hit-20.sav: 35743
hit-21.sav: 35747
hit-22.sav: 35747
hit-23.sav: 35750
hit-24.sav: 35751
hit-25.sav: 35751
hit-26.sav: 35749
hit-27.sav: 48648
hit-28.sav: 48650
hit-29.sav: 48652
hit-30.sav: 48653
hit-31.sav: 48653
hit-32.sav: 48653
hit-33.sav: 48652


BAM FILES LOOK OKAY:


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
ls -al merged.bam*
    
    -rw-rw-rw- 1 syoung root 9347649654 Nov 14 00:31 merged.bam
    -rw-r--r-- 1 syoung root  313122729 Nov 12 13:41 merged.bam-1
    -rw-rw-rw- 1 syoung root  616350940 Nov 12 13:50 merged.bam-2
    -rw-rw-rw- 1 syoung root  917106299 Nov 12 15:49 merged.bam-3
    -rw-rw-rw- 1 syoung root 1216636814 Nov 12 16:04 merged.bam-4
    -rw-rw-rw- 1 syoung root 1514479277 Nov 12 16:23 merged.bam-5
    -rw-rw-rw- 1 syoung root 1811352014 Nov 12 16:46 merged.bam-6
    -rw-rw-rw- 1 syoung root 2106575603 Nov 12 17:14 merged.bam-7
    -rw-rw-rw- 1 syoung root 2400963738 Nov 12 17:45 merged.bam-8
    -rw-rw-rw- 1 syoung root 2694264543 Nov 12 18:21 merged.bam-9
    -rw-rw-rw- 1 syoung root 2986225695 Nov 12 18:57 merged.bam-10
    -rw-rw-rw- 1 syoung root 3277803992 Nov 12 19:37 merged.bam-11
    -rw-rw-rw- 1 syoung root 3568763254 Nov 12 20:23 merged.bam-12
    -rw-rw-rw- 1 syoung root 3859221748 Nov 12 21:17 merged.bam-13 <=== IDENTICAL
    -rw-rw-rw- 1 syoung root 3859221748 Nov 12 21:17 merged.bam-14 <=== IDENTICAL
    -rw-rw-rw- 1 syoung root 4149376183 Nov 12 22:12 merged.bam-15
    -rw-rw-rw- 1 syoung root 4439275769 Nov 12 23:11 merged.bam-16
    -rw-rw-rw- 1 syoung root 4729085080 Nov 13 00:15 merged.bam-17
    -rw-rw-rw- 1 syoung root 5018430742 Nov 13 01:17 merged.bam-18
    -rw-rw-rw- 1 syoung root 5307459520 Nov 13 02:21 merged.bam-19
    -rw-rw-rw- 1 syoung root 5596600974 Nov 13 03:28 merged.bam-20
    -rw-rw-rw- 1 syoung root 5885544472 Nov 13 04:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 6173854437 Nov 13 05:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 6462412593 Nov 13 07:18 merged.bam-23
    -rw-rw-rw- 1 syoung root 6750940312 Nov 13 08:42 merged.bam-24
    -rw-rw-rw- 1 syoung root 7039611709 Nov 13 10:08 merged.bam-25
    -rw-rw-rw- 1 syoung root 7327685431 Nov 13 11:39 merged.bam-26
    -rw-rw-rw- 1 syoung root 7615889244 Nov 13 13:11 merged.bam-27
    -rw-rw-rw- 1 syoung root 7904151078 Nov 13 14:47 merged.bam-28
    -rw-rw-rw- 1 syoung root 8192549633 Nov 13 16:27 merged.bam-29
    -rw-rw-rw- 1 syoung root 8480941481 Nov 13 18:13 merged.bam-30
    -rw-rw-rw- 1 syoung root 8769355101 Nov 13 20:07 merged.bam-31
    -rw-rw-rw- 1 syoung root 9058184194 Nov 13 22:38 merged.bam-32
    -rw-rw-rw- 1 syoung root 9347649654 Nov 14 00:34 merged.bam-33
    -rw-rw-rw- 1 syoung root 9347649660 Nov 13 23:28 merged.bam.temp




AND AS A RESULT THE *sav FILES ARE IDENTICAL

-rw-rw-rw- 1 syoung root 21032835 Nov 20 03:34 hit-13.sav
-rw-rw-rw- 1 syoung root 21032835 Nov 20 03:34 hit-14.sav


AND THE *snp FILES ARE IDENTICAL

-rw-rw-rw- 1 syoung root 13391081 Nov 12 21:24 hit-13.snp
-rw-rw-rw- 1 syoung root 13391081 Nov 12 21:24 hit-14.snp



CHECK BAM FILES:


FILE 13

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22

samtools index merged.bam-13
samtools idxstats merged.bam-13

# reference_sequence sequence length  #mapped_reads #unmapped_reads

chr22   51304566        69059615        0
*       0       0       0

samtools view -X merged.bam-13 | less -S
SRR003824.2824748:7:166:260:598#0       pPR2    chr22   16050002        255     36M     =       16050163        197     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    8:6A80A86<08'11?-10-..)(+++%+%&-&*)*    XA:i:0  MD:Z:34A1       NM:i:1
SRR004835.893408:3:12:200:1108#0        pPR2    chr22   16050002        255     36M     =       16050193        227     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    =IIIIIIIFIIIBI2II34II5-IB8E,7+03B4&D    XA:i:0  MD:Z:34A1       NM:i:1
SRR003863.5582694:3:283:160:482#0       pPR1    chr22   16050002        255     36M     =       16050185        219     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    IIIIIIIIIIIGII5II91I7>712%>14029-0(0    XA:i:0  MD:Z:34A1       NM:i:1
SRR003846.2664345:4:131:814:828#0       pPR1    chr22   16050003        255     36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    IIIIIIIIIIIIIIIIIIIICIIBIIIIIIIIC@I6    XA:i:0  MD:Z:33A2       NM:i:1
SRR002291.25589721:6:180:266:39#0       pPR1    chr22   16050003        255     36M     =       16050168        201     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    IIIIIIIIIIIIIIIG65IA10;,29*6,112(&&&    XA:i:0  MD:Z:33A2       NM:i:1
SRR004818.4409747:7:227:238:554#0       pPR1    chr22   16050005        255     36M     =       16050193        224     TGATAAGTCCCAGGACTTCAGAAGAGCTGTGAGACC    IIIIIIIIIIFIIIIA?42/+6F2+.+1+($+-+&&    XA:i:0  MD:Z:36 NM:i:0
SRR004861.4407997:7:44:216:948#0        pPR2    chr22   16050006        255     36M     =       16050173        203     GATAAGTCCCAGGACTTCAGAAGAGCTGTGCGACCT    II2II@8I&DIF@I95%II09I4:3+13&1,4+/+(    XA:i:0  MD:Z:30A5       NM:i:1
SRR004853.4269253:3:67:1850:1511#0      pPR2    chr22   16050007        255     36M     =       16050187        216     ATAAGTCCCAGGACTTCAGAAGAGCTGTGCGACCTT    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:29A6       NM:i:1


cat cumulativeSnp-chr22-13.sh
    
time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit.sam;
time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam;
time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit;
time mv -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam;
time cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam-13;
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22;
/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/merged.bam | tee hit-13.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-13.filter;

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-13.filter > hit-13.snp

[syoung@u02 chr22]$


FILE 14

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22

samtools index merged.bam-14
samtools idxstats merged.bam-14

# reference_sequence sequence length  #mapped_reads #unmapped_reads

    chr22   51304566        69059615        0
    *       0       0       0

samtools view -X merged.bam-14 | less -S
SRR003824.2824748:7:166:260:598#0       pPR2    chr22   16050002        255     36M     =       16050163        197     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    8:6A80A86<08'11?-10-..)(+++%+%&-&*)*    XA:i:0  MD:Z:34A1       NM:i:1
SRR004835.893408:3:12:200:1108#0        pPR2    chr22   16050002        255     36M     =       16050193        227     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    =IIIIIIIFIIIBI2II34II5-IB8E,7+03B4&D    XA:i:0  MD:Z:34A1       NM:i:1
SRR003863.5582694:3:283:160:482#0       pPR1    chr22   16050002        255     36M     =       16050185        219     ATCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCG    IIIIIIIIIIIGII5II91I7>712%>14029-0(0    XA:i:0  MD:Z:34A1       NM:i:1
SRR003846.2664345:4:131:814:828#0       pPR1    chr22   16050003        255     36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    IIIIIIIIIIIIIIIIIIIICIIBIIIIIIIIC@I6    XA:i:0  MD:Z:33A2       NM:i:1
SRR002291.25589721:6:180:266:39#0       pPR1    chr22   16050003        255     36M     =       16050168        201     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    IIIIIIIIIIIIIIIG65IA10;,29*6,112(&&&    XA:i:0  MD:Z:33A2       NM:i:1
SRR004818.4409747:7:227:238:554#0       pPR1    chr22   16050005        255     36M     =       16050193        224     TGATAAGTCCCAGGACTTCAGAAGAGCTGTGAGACC    IIIIIIIIIIFIIIIA?42/+6F2+.+1+($+-+&&    XA:i:0  MD:Z:36 NM:i:0
SRR004861.4407997:7:44:216:948#0        pPR2    chr22   16050006        255     36M     =       16050173        203     GATAAGTCCCAGGACTTCAGAAGAGCTGTGCGACCT    II2II@8I&DIF@I95%II09I4:3+13&1,4+/+(    XA:i:0  MD:Z:30A5       NM:i:1
SRR004853.4269253:3:67:1850:1511#0      pPR2    chr22   16050007        255     36M     =       16050187        216     ATAAGTCCCAGGACTTCAGAAGAGCTGTGCGACCTT    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:29A6       NM:i:1




</entry>

<entry [Fri Nov 19 14:19:47 EST 2010] RUN snpVenn.pl ON ALL AVAILABLE CUMULATIVE SNPs>

ELAND       #### DONE
ELAND-2     #### DONE
BOWTIE      #### DONE. cumulative2 ALSO DONE (GOOD).
BOWTIE-rf   #### DONE BUT MISSING FILE 1 AGAIN
MAQ         #### RERUNNING AS cumulative2 (FILE 21, Mon Nov 15 01:01:05 EST 2010)
NOVOALIGN   #### RERUNNING (FILE 14, Fri Nov 19 14:45:24 EST 2010)





VENN - BETWEEN
--------------

ELAND VS BOWTIE





RUN VENN-SELF (NEIGHBOUR)
-------------------------

ELAND

BOWTIE





RUN VENN-SELF (ALL VS ONE)
--------------------------

ELAND
BOWTIE



ELAND - DONE
-----

OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn
lines *-snp

    hit-1-snp-NOT-hit-33-snp	20720
    hit-3-snp-NOT-hit-33-snp	14918
    hit-4-snp-NOT-hit-33-snp	16801
    hit-5-snp-NOT-hit-33-snp	16801
    hit-6-snp-NOT-hit-33-snp	17261
    ...


ELAND-2     RUNNING Fri Nov 19 14:18:06 EST 2010
-------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn


screen -S eland-vennsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn \
--replicates 2-33 \
--loop distributed \
--label eland-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/loop-vennsav.out

    Run time: 00:15:51
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:33PM, 19 November 2010
    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/venn
ll *snp
    
    -rw-rw-rw- 1 syoung root 2592121 Nov 19 14:33 hit-10-snp-NOT-hit-33-snp
    -rw-rw-rw- 1 syoung root 2478946 Nov 19 14:32 hit-11-snp-NOT-hit-33-snp
    -rw-rw-rw- 1 syoung root 2353023 Nov 19 14:32 hit-12-snp-NOT-hit-33-snp
    -rw-rw-rw- 1 syoung root 2219145 Nov 19 14:32 hit-13-snp-NOT-hit-33-snp
    -rw-rw-rw- 1 syoung root 2091319 Nov 19 14:31 hit-14-snp-NOT-hit-33-snp
    ...
    


BOWTIE (CUM-2)      RUNNING     Fri Nov 19 14:27:30 EST 2010
--------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn


screen -S bowtie-vennsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--replicates 2-33 \
--loop distributed \
--label vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/loop-vennsav.out

    cumulativeSNP.pl    Run time: 35:15:25
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    0:55AM, 14 November 2010
    cumulativeSNP.pl    ****************************************


DO MISSING FILE 1 VENN:

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-1.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-1-snp
    
    samVenn::Snp.pl    Run time: 02:33:19
    samVenn::Snp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl
    samVenn::Snp.pl    1:31PM, 23 November 2010
    samVenn::Snp.pl    ****************************************


COLLATE VENNS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--replicates 1-33


collateVenns.pl    Run time: 00:00:18
collateVenns.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl
collateVenns.pl    1:35PM, 23 November 2010
collateVenns.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn
cat collate-hit-33-snp-hit-%REPLICATE%-snp-1-33.tsv
    
    hit-33-snp      hit-1-snp       27227   1944    81505   29171   83449
    hit-33-snp      hit-2-snp       12824   1098    38538   13922   39636
    hit-33-snp      hit-3-snp       13063   852     38804   13915   39656
    hit-33-snp      hit-4-snp       13319   775     38881   14094   39656
    hit-33-snp      hit-5-snp       13229   872     38787   14101   39659
    hit-33-snp      hit-6-snp       13150   957     38727   14107   39684
    hit-33-snp      hit-7-snp       12954   1001    38667   13955   39668
    hit-33-snp      hit-8-snp       12465   1298    38373   13763   39671
    hit-33-snp      hit-9-snp       12192   1774    37908   13966   39682
    hit-33-snp      hit-10-snp      36165   23841   17494   60006   41335
    hit-33-snp      hit-11-snp      34399   25531   15773   59930   41304
    hit-33-snp      hit-12-snp      33194   27309   13909   60503   41218
    hit-33-snp      hit-13-snp      32831   29289   12066   62120   41355
    hit-33-snp      hit-14-snp      32219   29289   11886   61508   41175
    hit-33-snp      hit-15-snp      41382   32571   8647    73953   41218
    hit-33-snp      hit-16-snp      40631   33305   7864    73936   41169
    hit-33-snp      hit-17-snp      39580   33877   7142    73457   41019
    hit-33-snp      hit-18-snp      39023   34373   6594    73396   40967
    hit-33-snp      hit-19-snp      11870   17379   22909   29249   40288
    hit-33-snp      hit-20-snp      11015   18295   21979   29310   40274
    hit-33-snp      hit-21-snp      10090   19065   21193   29155   40258
    hit-33-snp      hit-22-snp      9190    19853   20440   29043   40293
    hit-33-snp      hit-23-snp      8333    20695   19490   29028   40185
    hit-33-snp      hit-24-snp      7573    21520   18624   29093   40144
    hit-33-snp      hit-25-snp      6778    22292   17847   29070   40139
    hit-33-snp      hit-26-snp      5990    22980   17139   28970   40119
    hit-33-snp      hit-27-snp      6815    32318   7966    39133   40284
    hit-33-snp      hit-28-snp      5781    33275   6989    39056   40264
    hit-33-snp      hit-29-snp      4762    34242   5971    39004   40213
    hit-33-snp      hit-30-snp      3738    35285   4881    39023   40166
    hit-33-snp      hit-31-snp      2752    36311   3837    39063   40148
    hit-33-snp      hit-32-snp      1968    37544   2544    39512   40088
    hit-33-snp      hit-33-snp      1184    38872   1184    40056   40056


/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn/hit-19-snp-NOT-hit-33-snp



/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/hit-33.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-33-snp




CHECK WHY BOWTIE FILE 1 CUMULATIVE SNP IS EMPTY
-----------------------------------------------

BAM FILE LOOKS NORMAL:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
samtools view -X merged.bam-1 | less -S

    SRR004823.14378:3:1:253:207#0   pPR1    chr22   16050016        255     36M     =       16050195        215     AGGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTC    IIIIIIIIIIIIIIDIIIIIIII8IIIII33I,78)    XA:i:1  MD:Z:20A15      NM:i:1
    SRR002304.7863377:1:90:544:448#0        pPR1    chr22   16050031        255     36M     =       16050192        197     CTGTGCGACCTTGGCCAAGTCACTTCCCCCTTCAGG    IIIIIIIIIIIIIC4I>(=)III.+4+&(:*//83+    XA:i:2  MD:Z:5A21T8     NM:i:2
    SRR002301.2006530:3:94:327:904#0        pPR1    chr22   16050036        255     36M     =       16050211        211     CGACCTTGGCCAAGTCACTTCCTCCTTCAGGAACAT    IIIIIIIIIIIIIIIIIIIID3/;??/<,:002+2A    XA:i:1  MD:Z:0A35       NM:i:1
    SRR006554.5571971:2:259:467:605#0       pPR1    chr22   16050041        255     36M     =       16050225        220     TTGGCCAAGTCACTTCCTCCTTCAGGAACATTGCAG    IIIII;3>E?66=EE8/C,A0?+).7+/+-57.+'&    XA:i:0  MD:Z:36 NM:i:0
    SRR004850.5452648:4:56:158:1670#0       pPR2    chr22   16050115        255     36M     =       16050284        205     GGTCATGCAATCTGGACAACATTCACCTTTAAAAGT    IIAI4IIIIIIIIII3IIAIEIICIII<IC+4-0?,    XA:i:0  MD:Z:36 NM:i:0
    SRR004860.9862481:6:98:511:367#0        pPR2    chr22   16050127        255     36M     =       16050314        223     TGGACAACATTCACCTTTAAAAGTTTATTGATCTTT    <II6;GI'2E82-E:I499(-4D#I+2?9I,I+I<6    XA:i:0  MD:Z:36 NM:i:0
    SRR003870.1056177:4:49:412:676#0        pPR1    chr22   16050128        255     36M     =       16050286        194     GGACAACATTCACCTTTAAAAGTTTATTGATTTTTT    II@IIII5IIG>I9C4>3-1+;0E6+A8.(15=?56    XA:i:0  MD:Z:31C4       NM:i:1
    


SAM FILE IS IDENTICAL TO BAM FILE:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22
head hit.sam

    SRR004823.14378:3:1:253:207#0   99      chr22   16050016        255     36M     =       16050195        215     AGGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTC    IIIIIIIIIIIIIIDIIIIIIII8IIIII33I,78)    XA:i:1  MD:Z:20A15      NM:i:1
    SRR002304.7863377:1:90:544:448#0        99      chr22   16050031        255     36M     =       16050192        197     CTGTGCGACCTTGGCCAAGTCACTTCCCCCTTCAGG    IIIIIIIIIIIIIC4I>(=)III.+4+&(:*//83+    XA:i:2  MD:Z:5A21T8     NM:i:2
    SRR002301.2006530:3:94:327:904#0        99      chr22   16050036        255     36M     =       16050211        211     CGACCTTGGCCAAGTCACTTCCTCCTTCAGGAACAT    IIIIIIIIIIIIIIIIIIIID3/;??/<,:002+2A    XA:i:1  MD:Z:0A35       NM:i:1
    SRR006554.5571971:2:259:467:605#0       99      chr22   16050041        255     36M     =       16050225        220     TTGGCCAAGTCACTTCCTCCTTCAGGAACATTGCAG    IIIII;3>E?66=EE8/C,A0?+).7+/+-57.+'&    XA:i:0  MD:Z:36 NM:i:0
    SRR004850.5452648:4:56:158:1670#0       163     chr22   16050115        255     36M     =       16050284        205     GGTCATGCAATCTGGACAACATTCACCTTTAAAAGT    IIAI4IIIIIIIIII3IIAIEIICIII<IC+4-0?,    XA:i:0  MD:Z:36 NM:i:0
    SRR004860.9862481:6:98:511:367#0        163     chr22   16050127        255     36M     =       16050314        223     TGGACAACATTCACCTTTAAAAGTTTATTGATCTTT    <II6;GI'2E82-E:I499(-4D#I+2?9I,I+I<6    XA:i:0  MD:Z:36 NM:i:0
    SRR003870.1056177:4:49:412:676#0        99      chr22   16050128        255     36M     =       16050286        194     GGACAACATTCACCTTTAAAAGTTTATTGATTTTTT    II@IIII5IIG>I9C4>3-1+;0E6+A8.(15=?56    XA:i:0  MD:Z:31C4       NM:i:1
    SRR002283.6606116:3:42:881:433#0        99      chr22   16050137        255     36M     =       16050314        213     TCACCTTTAAAAGTTTATTGATCTTTTGTGACATGC    IIIIIIIIIBIII7II<GBDGIIII53=3+2@?1.;    XA:i:0  MD:Z:36 NM:i:0
    SRR002304.7863377:1:90:544:448#0        147     chr22   16050192        255     36M     =       16050031        -197    AGAAACTAAAGGGTCGCAGGCCGGTTTCTGCTAATT    >99E",$97+?/D,III-4<II+DI8DEIIIIIIIH    XA:i:0  MD:Z:36 NM:i:0
    SRR004823.14378:3:1:253:207#0   147     chr22   16050195        255     36M     =       16050016        -215    AACTAAAGGGTCGCAGTCCGGTTTCTGCTAATTTCT    5*H'8'1&&#+G&BH(%I=%(II?II=IIIIIIIII    XA:i:1  MD:Z:16G19      NM:i:1







NOTES
-----




NB: COLLATION RESULTS FOR cumulative (I.E., NOT cumulative2)

/nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--replicates 1-33


/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn/collate-hit-33-snp-hit-%REPLICATE%-snp-1-33.tsv

    collateVenns.pl    Run time: 00:00:02
    collateVenns.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/venn/collateVenns.pl
    collateVenns.pl    1:49AM, 21 November 2010
    collateVenns.pl    ****************************************


cat /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn/collate-hit-33-snp-hit-%REPLICATE%-snp-1-33.tsv

    0       0       0       0       0
    0       0       0       0       0
    994     62      875     1056    937
    0       0       0       0       0
    278     54      881     332     935
    0       0       0       0       0
    647     60      876     707     936
    633     74      862     707     936
    91      67      866     158     933
    87      71      863     158     934
    87      71      862     158     933
    83      74      859     157     933
    214     77      856     291     933
    214     78      855     292     933
    210     80      854     290     934
    213     80      854     293     934
    213     82      852     295     934
    209     81      852     290     933
    206     87      847     293     934
    202     88      846     290     934
    0       0       0       0       0
    615     221     713     836     934
    44      76      857     120     933
    124     92      842     216     934
    113     103     831     216     934
    97      119     815     216     934
    82      134     800     216     934
    67      149     785     216     934
    56      160     774     216     934
    0       0       0       0       0
    44      171     762     215     933
    90      842     92      932     934
    0       933     0       933     933




</entry>

<entry [Fri Nov 19 17:33:47 EST 2010] FIX BOWTIE FILE 1 PROBLEM IN cumulativeSnp.pl>


THE FILE 1 hit.sap IS 5.3 MB:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22
ll hit.snp
    
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp

lines 1/chr22/hit.snp
    
    1/chr22/hit.snp: 81835


BUT THE FIRST FILE IN THE CUMULATIVE SNPS (WHICH SHOULD BE IDENTICAL TO FILE 1 hit.snp)
IS 4.8 MB AND HAS LESS LINES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ll hit-1.snp

    -rw-rw-rw- 1 syoung root 4.8M Nov  5 13:44 hit-1.snp

lines  hit-1.snp 

    hit-1.snp: 77385



RAN snpVenn.pl TO COMPARE FILE 1 hit.snp WITH CUMULATIVE hit-1.snp


mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/venn

screen -S snpvenn

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22/hit.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-1.snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/venn \
--querylabel bowtie-1 \
--targetlabel bowtie-cum 

    
    samVenn::Snp.pl    Run time: 03:36:23
    samVenn::Snp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl
    samVenn::Snp.pl    2:48AM, 20 November 2010
    samVenn::Snp.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/venn
lines *

    bowtie-1-AND-bowtie-cum: 74148
    bowtie-1-NOT-bowtie-cum: 7687
    bowtie-cum-NOT-bowtie-1: 3237









</entry>

<entry [Fri Nov 19 17:33:47 EST 2010] RERUN MAQ.pl AS maq3>


mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3

screen -S maq3

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/MAQ.pl \
--replicates 1-33 \
--loop parallel \
--params "-C 1" \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3 \
--species human \
--label maq3-chr22 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3/%REPLICATE%/maq3-chr22-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq3/maq3-chr22-loop.out

    
    Run time: 30:32:24
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:49AM, 21 November 2010
    ****************************************




</entry>

<entry [Fri Nov 19 14:19:47 EST 2010] RUN SAV.pl ON ALL AVAILABLE CUMULATIVE SNPs>

COMPLETED: ELAND, ELAND-2, BOWTIE, BOWTIE-RF (MISSING FILE 1)

RUNNING: MAQ, NOVOALIGN

ELAND       #### DONE
ELAND-2     #### DONE
BOWTIE      #### DONE. cumulative2 ALSO DONE (GOOD).
BOWTIE-rf   #### DONE BUT MISSING FILE 1 AGAIN
MAQ         #### RERUNNING AS cumulative2 (STARTED Fri Nov 12 13:52:57 EST 2010, (FILE 21 Mon Nov 15 01:01:05 EST 2010)
NOVOALIGN   #### RERUNNING AS cumulative2 (ONLY FIRST 12 FILES DONE)


OUTPUT FILES
------------


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22
ll */cumulative*/chr22/hit-1.sav

    -rw-rw-rw- 1 syoung root 1.6M Nov 19 13:38 bowtie/cumulative2/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 8.9M Nov  9 09:30 bowtie/cumulative/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.3M Nov 19 10:27 eland/cumulative/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.8M Nov 19 13:38 maq/cumulative2/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.9M Nov  5 05:17 maq/cumulative/chr22/hit-1.sav

ll */cumulative*/chr22/hit-1.sav

    -rw-rw-rw- 1 syoung root 1.6M Nov 19 13:38 bowtie/cumulative2/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 8.9M Nov  9 09:30 bowtie/cumulative/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.3M Nov 19 10:27 eland/cumulative/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.8M Nov 19 13:38 maq/cumulative2/chr22/hit-1.sav
    -rw-rw-rw- 1 syoung root 1.9M Nov  5 05:17 maq/cumulative/chr22/hit-1.sav

[syoung@u01 chr22]$ ll */cumulative*/chr22/hit-10.sav

    -rw-rw-rw- 1 syoung root 8.1M Nov 19 13:41 bowtie/cumulative2/chr22/hit-10.sav
    -rw-rw-rw- 1 syoung root  21M Nov 11 02:26 bowtie/cumulative/chr22/hit-10.sav
    -rw-rw-rw- 1 syoung root 3.8M Nov 19 09:02 eland/cumulative/chr22/hit-10.sav

[syoung@u01 chr22]$ ll */cumulative*/chr22/hit-33.sav

    -rw-rw-rw- 1 syoung root 6.4M Nov 19 13:41 bowtie/cumulative2/chr22/hit-33.sav
    -rw-rw-rw- 1 syoung root  17M Nov  9 09:11 bowtie/cumulative/chr22/hit-33.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 08:33 eland/cumulative/chr22/hit-33.sav



RUN CUMULATIVE SAV.pl
---------------------



ELAND-2     RUNNING Fri Nov 19 03:48:20 EST 2010
-------

screen -S eland-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--replicates 1-33 \
--loop distributed \
--label eland-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/loop-sav.out


    Run time: 22:15:44
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:03AM, 20 November 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22
    
    -rw-rw-rw- 1 syoung root 1.3M Nov 19 10:27 hit-1.sav
    -rw-rw-rw- 1 syoung root 2.0M Nov 19 15:56 hit-2.sav
    -rw-rw-rw- 1 syoung root 2.5M Nov 19 20:56 hit-3.sav
    -rw-rw-rw- 1 syoung root 2.9M Nov 19 23:26 hit-4.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 20 00:41 hit-5.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 20 01:32 hit-6.sav
    -rw-rw-rw- 1 syoung root 3.6M Nov 20 02:03 hit-7.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 08:58 hit-8.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 09:01 hit-9.sav
    -rw-rw-rw- 1 syoung root 3.8M Nov 19 09:02 hit-10.sav
    -rw-rw-rw- 1 syoung root 3.8M Nov 19 09:02 hit-11.sav
    -rw-rw-rw- 1 syoung root 3.8M Nov 19 09:00 hit-12.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 08:59 hit-13.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 08:56 hit-14.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 19 08:54 hit-15.sav
    -rw-rw-rw- 1 syoung root 3.6M Nov 20 00:41 hit-16.sav
    -rw-rw-rw- 1 syoung root 3.6M Nov 20 00:30 hit-18.sav
    -rw-rw-rw- 1 syoung root 3.5M Nov 20 00:18 hit-19.sav
    -rw-rw-rw- 1 syoung root 3.5M Nov 20 00:09 hit-20.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 19 23:56 hit-21.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 19 23:47 hit-22.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 19 08:06 hit-23.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:04 hit-24.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:03 hit-25.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:02 hit-26.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:02 hit-27.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 08:00 hit-28.sav
    -rw-rw-rw- 1 syoung root 3.3M Nov 19 07:59 hit-29.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 07:58 hit-30.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 08:36 hit-31.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 08:34 hit-32.sav
    -rw-rw-rw- 1 syoung root 3.2M Nov 19 08:33 hit-33.sav


    OK


BOWTIE (CUMUL-2)
----------------

screen -S bowtie2-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2 \
--replicates 1-33 \
--loop distributed \
--label bowtie-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/loop-sav.out
    
    Run time: 24:00:36
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    3:50AM, 20 November 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
    
    -rw-rw-rw- 1 syoung root  20M Nov 20 03:50 hit-10.sav
    -rw-rw-rw- 1 syoung root  21M Nov 20 03:50 hit-11.sav
    -rw-rw-rw- 1 syoung root  21M Nov 20 03:49 hit-12.sav
    -rw-rw-rw- 1 syoung root  21M Nov 20 03:34 hit-13.sav
    -rw-rw-rw- 1 syoung root  21M Nov 20 03:34 hit-14.sav
    -rw-rw-rw- 1 syoung root  20M Nov 20 02:23 hit-15.sav
    -rw-rw-rw- 1 syoung root  20M Nov 20 02:03 hit-16.sav
    -rw-rw-rw- 1 syoung root  20M Nov 20 01:46 hit-17.sav
    -rw-rw-rw- 1 syoung root  20M Nov 20 01:26 hit-18.sav
    -rw-rw-rw- 1 syoung root 9.7M Nov 20 03:50 hit-19.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 20 03:50 hit-1.sav
    -rw-rw-rw- 1 syoung root 9.8M Nov 20 03:50 hit-20.sav
    -rw-rw-rw- 1 syoung root 9.9M Nov 20 03:50 hit-21.sav
    -rw-rw-rw- 1 syoung root 9.9M Nov 20 03:50 hit-22.sav
    -rw-rw-rw- 1 syoung root  10M Nov 20 03:50 hit-23.sav
    -rw-rw-rw- 1 syoung root  11M Nov 20 03:50 hit-24.sav
    -rw-rw-rw- 1 syoung root  11M Nov 20 03:50 hit-25.sav
    -rw-rw-rw- 1 syoung root  11M Nov 20 03:50 hit-26.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-27.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-28.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-29.sav
    -rw-rw-rw- 1 syoung root 3.4M Nov 20 03:50 hit-2.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-30.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-31.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-32.sav
    -rw-rw-rw- 1 syoung root  15M Nov 20 03:50 hit-33.sav
    -rw-rw-rw- 1 syoung root 3.7M Nov 20 03:50 hit-3.sav
    -rw-rw-rw- 1 syoung root 3.9M Nov 20 03:50 hit-4.sav
    -rw-rw-rw- 1 syoung root 4.1M Nov 20 03:50 hit-5.sav
    -rw-rw-rw- 1 syoung root 4.3M Nov 20 03:50 hit-6.sav
    -rw-rw-rw- 1 syoung root 4.4M Nov 20 03:50 hit-7.sav
    -rw-rw-rw- 1 syoung root 4.5M Nov 20 03:50 hit-8.sav
    -rw-rw-rw- 1 syoung root 4.7M Nov 20 03:50 hit-9.sav




NOVOALIGN (CUMUL-2) FILES 1-12
------------------------------

screen -S novoalign-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--replicates 1-12 \
--loop distributed \
--label novoalign-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/loop-sav.out
    
    Run time: 00:01:08
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:01AM, 19 November 2010
    ****************************************



MAQ (CUMUL-2)
-------------

FIRST ROUND:

screen -S maq-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--replicates 1-12 \
--loop distributed \
--label maq-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/loop-sav.out



SECOND ROUND (CONCURRENT):

screen -S maq-sav2

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--replicates 13-33 \
--loop distributed \
--label maq-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/loop-sav.out
    
    Run time: 00:01:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:05AM, 19 November 2010
    ****************************************



BOWTIE-rf       PENDING (RE-RUNNING CUMULATIVE SNP   Fri Nov 19 10:07:37 EST 2010)
---------


    
    





</entry>

<entry [Fri Nov 12 13:40:10 EST 2010] MAQ snpFilter CRITERIA>


MAQ (Multiple Alignments with Qualities) produces a highly-filtered output file of SNP predictions called 'out.SNPfilter'. 

The file columns in the out.SNPfilter file are as follows:

{quote}
# Chromosome
# Position
# Reference base
# Consensus base
# Consensus quality
(A Phred-like quality value. Considered the key criterion for judging the reliability of a SNP.)
# Read depth
# Repetitive region
(Average number of hits of reads covering this position. Indicates whether the site falls in a repetitive region. If no read 
covering the site can be mapped with high mapping quality, the flanking region is possibly repetitive or in the lack of good 
reads. A SNP at such site is usually not reliable.)
# Highest mapping quality
(Highest mapping quality of the reads covering the position. Roughly gives the copy number of the flanking region in the 
reference genome. In most cases, this number approaches 1.00, which means the region is about unique. Sometimes you may see 
non-zero read depth but 0.00 at the 7th column. This indicates that all the reads covering the position have at least two 
mismatches. Maq only counts the number of 0- and 1-mismatch hits to the reference. This is due to a complex technical issue.)
# Min. flanking quality
(Minimum consensus quality in the 3bp flanking regions at each side of the site (6bp in total). This gives the neighbouring 
quality. Filtering on this column is also required to get reliable SNPs. This idea is inspired by NQS, although NQS is 
initially designed for a single read instead of a consensus.)
# Second best call
# Log likelihood ratio of the second best and the third best call 
# Third best call
{quote}



</entry>

<entry [Fri Nov 12 13:39:10 EST 2010] RERUN MAQ cumulativeSnp.pl AS cumulative2>


mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2

screen -S maq-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--species human \
--zipped gzip \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/cumulativeSnp.out

    
    RUNNING
    Fri Nov 12 13:52:57 EST 2010





mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2

screen -S maq-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2 \
--species human \
--zipped gzip \
--label cumulative2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative2/cumulativeSnp.out




</entry>

<entry [Fri Nov 12 13:39:10 EST 2010] RERUN BOWTIE-RF cumulativeSnp.pl AS cumulative2>

AFTER FAILED AT FILE 1:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative/chr22
    -rwxrwxrwx 1 syoung root 2.1K Nov  9 11:26 cumulativeSnp-chr22-1.sh
    -rw-rw-rw- 1 syoung root 2.6K Nov  9 11:27 cumulativeSnp-chr22-1-stdout.txt
    -rwxrwxrwx 1 syoung root 2.8K Nov  9 11:27 cumulativeSnp-chr22-2.sh
    -rw-rw-rw- 1 syoung root 2.1K Nov  9 11:33 cumulativeSnp-chr22-2-stdout.txt
    -rw-rw-rw- 1 syoung root    0 Nov  9 11:27 hit-1.filter
    -rw-rw-rw- 1 syoung root   36 Nov  9 11:27 hit-1.raw
    -rw-rw-rw- 1 syoung root    0 Nov  9 11:27 hit-1.snp
    -rw-rw-rw- 1 syoung root 9.4M Nov  9 11:33 hit-2.filter
    -rw-rw-rw- 1 syoung root  21M Nov  9 11:33 hit-2.raw
    -rw-rw-rw- 1 syoung root 5.3M Nov  9 11:33 hit-2.snp
    -rw-rw-rw- 1 syoung root 349M Nov  9 11:32 merged.bam
    -rw-rw-rw- 1 syoung root  56M Nov  9 11:27 merged.bam-1
    -rw-rw-rw- 1 syoung root 349M Nov  9 11:32 merged.bam-2
    -rw-rw-rw- 1 syoung root 355M Nov  9 11:29 merged.bam.temp


RUN cumulativeSnp.pl:

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2

screen -S bowtie-rf-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2 \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/cumulativeSnp.out

    
    RUNNING
    Fri Nov 12 13:44:26 EST 2010
    
    cumulativeSNP.pl    Run time: 19:05:40
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    8:50AM, 13 November 2010
    cumulativeSNP.pl    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22
ll merged*

    MISSING FILE 1!

    -rw-rw-rw- 1 syoung root 299M Nov 12 15:39 merged.bam-2
    -rw-rw-rw- 1 syoung root 588M Nov 12 15:48 merged.bam-3
    -rw-rw-rw- 1 syoung root 686M Nov 12 15:57 merged.bam-4
    -rw-rw-rw- 1 syoung root 974M Nov 12 16:10 merged.bam-5
    -rw-rw-rw- 1 syoung root 1.3G Nov 12 16:27 merged.bam-6
    -rw-rw-rw- 1 syoung root 1.3G Nov 12 16:28 merged.bam-7
    -rw-rw-rw- 1 syoung root 1.6G Nov 12 16:49 merged.bam-8
    -rw-rw-rw- 1 syoung root 1.6G Nov 12 17:11 merged.bam-9
    -rw-rw-rw- 1 syoung root 1.9G Nov 12 17:35 merged.bam-10
    -rw-rw-rw- 1 syoung root 2.2G Nov 12 18:03 merged.bam-11
    -rw-rw-rw- 1 syoung root 2.4G Nov 12 18:36 merged.bam-12
    -rw-rw-rw- 1 syoung root 2.7G Nov 12 19:14 merged.bam-13
    -rw-rw-rw- 1 syoung root 3.0G Nov 12 19:55 merged.bam-14
    -rw-rw-rw- 1 syoung root 3.2G Nov 12 20:48 merged.bam-15
    -rw-rw-rw- 1 syoung root 3.5G Nov 12 21:46 merged.bam-16
    -rw-rw-rw- 1 syoung root 3.8G Nov 12 22:53 merged.bam-17
    -rw-rw-rw- 1 syoung root 780M Nov 12 23:30 merged.bam-18
    -rw-rw-rw- 1 syoung root 780M Nov 12 23:26 merged.bam-19
    -rw-rw-rw- 1 syoung root 1.1G Nov 13 03:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 1.4G Nov 13 03:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 1.4G Nov 13 04:00 merged.bam-23
    -rw-rw-rw- 1 syoung root 1.7G Nov 13 04:22 merged.bam-24
    -rw-rw-rw- 1 syoung root 1.2G Nov 13 04:48 merged.bam-25
    -rw-rw-rw- 1 syoung root 1.9G Nov 13 04:48 merged.bam-26
    -rw-rw-rw- 1 syoung root 2.2G Nov 13 05:19 merged.bam-27
    -rw-rw-rw- 1 syoung root 2.5G Nov 13 05:52 merged.bam-28
    -rw-rw-rw- 1 syoung root 2.8G Nov 13 06:31 merged.bam-29
    -rw-rw-rw- 1 syoung root 2.8G Nov 13 06:32 merged.bam-30
    -rw-rw-rw- 1 syoung root 3.0G Nov 13 07:12 merged.bam-31
    -rw-rw-rw- 1 syoung root 3.3G Nov 13 07:55 merged.bam-32
    -rw-rw-rw- 1 syoung root 3.6G Nov 13 08:42 merged.bam-33



CHECK STDOUT FOR FILE 1:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2

cat cumulativeSnp-chr22-1-stdout.txt

Sender: LSF System <lsfadmin@n0139.pegasus.edu>
Subject: Job 2294450: </scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/cumulativeSnp-chr22-1.sh> Done

Job </scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/cumulativeSnp-chr22-1.sh> was submitted from host <u03> by user <syoung> in cluster <lsfcluster>.
Job was executed on host(s) <n0139.pegasus.edu>, in queue <large>, as user <syoung> in cluster <lsfcluster>.
</nethome/syoung> was used as the home directory.
</scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22> was used as the working directory.
Started at Fri Nov 12 15:37:24 2010
Results reported at Fri Nov 12 15:37:28 2010

Your job looked like:

------------------------------------------------------------
# LSBATCH: User input
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/cumulativeSnp-chr22-1.sh
------------------------------------------------------------

Successfully completed.

Resource usage summary:

    CPU time   :      0.08 sec.
    Max Memory :         2 MB
    Max Swap   :        23 MB

    Max Processes  :         1
    Max Threads    :         1

The output (if any) follows:

LS_JOBID: 
LS_JOBPID:  15988
LSB_JOBINDEX:  0
LSB_JOBNAME:  /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/cumulativeSnp-chr22-1.sh
LSB_QUEUE:  large
LSFUSER:  syoung
LSB_JOB_EXECUSER:  syoung
HOSTNAME:  n0139.pegasus.edu
LSB_HOSTS:  n0139
LSB_ERRORFILE: 
LSB_JOBFILENAME:  /scratch/lsf_spool/1289587463.2294450
LD_LIBRARY_PATH:  /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/lib
[main_samview] fail to open file for reading.

real    0m0.145s
user    0m0.002s
sys     0m0.001s
cp: cannot stat `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.bam': No such file or directory

real    0m0.242s
user    0m0.000s
sys     0m0.005s
cp: cannot stat `/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22/merged.bam': No such file or directory

real    0m0.081s
user    0m0.001s
sys     0m0.003s
open: No such file or directory
[bam_pileup] fail to read the header: non-exisiting file or wrong format.





RE-RERUN BOWTIE-RF CUMULATIVE SNP:


screen -S bowtie-rf-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2 \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/cumulativeSnp.out



    RUNNING
    Fri Nov 19 10:07:37 EST 2010
    
    FINISHED
    cumulativeSNP.pl    Run time: 21:31:50
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    7:38AM, 20 November 2010
    cumulativeSNP.pl    ****************************************



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2
    
    -rw-rw-rw- 1 syoung root 1.1M Nov 19 10:07 merged-1.snp
    -rw-rw-rw- 1 syoung root 5.7M Nov 19 10:22 merged-2.snp
    -rw-rw-rw- 1 syoung root 7.9M Nov 19 10:41 merged-3.snp
    -rw-rw-rw- 1 syoung root 8.6M Nov 19 11:01 merged-4.snp
    -rw-rw-rw- 1 syoung root  11M Nov 19 11:24 merged-5.snp
    -rw-rw-rw- 1 syoung root  12M Nov 19 11:51 merged-6.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 12:21 merged-7.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 12:54 merged-8.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 13:28 merged-9.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 14:06 merged-10.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 14:47 merged-11.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 15:31 merged-12.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 16:18 merged-13.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 17:09 merged-14.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 18:05 merged-15.snp
    -rw-rw-rw- 1 syoung root  14M Nov 19 19:03 merged-16.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 20:05 merged-17.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 21:10 merged-18.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 22:19 merged-19.snp
    -rw-rw-rw- 1 syoung root  13M Nov 19 23:32 merged-20.snp
    -rw-rw-rw- 1 syoung root  13M Nov 20 00:48 merged-21.snp
    -rw-rw-rw- 1 syoung root  13M Nov 20 02:07 merged-22.snp
    -rw-rw-rw- 1 syoung root  13M Nov 20 03:30 merged-23.snp
    -rw-rw-rw- 1 syoung root  13M Nov 20 04:57 merged-24.snp
    -rw-rw-rw- 1 syoung root  12M Nov 20 06:27 merged-25.snp
    -rw-rw-rw- 1 syoung root  12M Nov 20 08:01 merged-26.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 06:40 merged-27.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 06:51 merged-28.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:02 merged-29.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:04 merged-30.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:15 merged-31.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:17 merged-32.snp
    -rw-rw-rw- 1 syoung root    0 Nov 20 07:28 merged-33.snp







</entry>

<entry [Fri Nov 12 13:39:10 EST 2010] RERUN cumulativeSnp.pl AS cumulative2>


mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2

screen -S bowtie-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2 \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/cumulativeSnp.out



    RUNNING
    Fri Nov 12 13:40:36 EST 2010
    
    cumulativeSNP.pl    Run time: 35:15:25
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    0:55AM, 14 November 2010
    cumulativeSNP.pl    ****************************************

    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative2/chr22
ll merged*

    -rw-r--r-- 1 syoung root 299M Nov 12 13:41 merged.bam-1
    -rw-rw-rw- 1 syoung root 588M Nov 12 13:50 merged.bam-2
    -rw-rw-rw- 1 syoung root 875M Nov 12 15:49 merged.bam-3
    -rw-rw-rw- 1 syoung root 1.2G Nov 12 16:04 merged.bam-4
    -rw-rw-rw- 1 syoung root 1.5G Nov 12 16:23 merged.bam-5
    -rw-rw-rw- 1 syoung root 1.7G Nov 12 16:46 merged.bam-6
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 17:14 merged.bam-7
    -rw-rw-rw- 1 syoung root 2.3G Nov 12 17:45 merged.bam-8
    -rw-rw-rw- 1 syoung root 2.6G Nov 12 18:21 merged.bam-9
    -rw-rw-rw- 1 syoung root 2.8G Nov 12 18:57 merged.bam-10
    -rw-rw-rw- 1 syoung root 3.1G Nov 12 19:37 merged.bam-11
    -rw-rw-rw- 1 syoung root 3.4G Nov 12 20:23 merged.bam-12
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 21:17 merged.bam-13
    -rw-rw-rw- 1 syoung root 3.6G Nov 12 21:17 merged.bam-14
    -rw-rw-rw- 1 syoung root 3.9G Nov 12 22:12 merged.bam-15
    -rw-rw-rw- 1 syoung root 4.2G Nov 12 23:11 merged.bam-16
    -rw-rw-rw- 1 syoung root 4.5G Nov 13 00:15 merged.bam-17
    -rw-rw-rw- 1 syoung root 4.7G Nov 13 01:17 merged.bam-18
    -rw-rw-rw- 1 syoung root 5.0G Nov 13 02:21 merged.bam-19
    -rw-rw-rw- 1 syoung root 5.3G Nov 13 03:28 merged.bam-20
    -rw-rw-rw- 1 syoung root 5.5G Nov 13 04:40 merged.bam-21
    -rw-rw-rw- 1 syoung root 5.8G Nov 13 05:58 merged.bam-22
    -rw-rw-rw- 1 syoung root 6.1G Nov 13 07:18 merged.bam-23
    -rw-rw-rw- 1 syoung root 6.3G Nov 13 08:42 merged.bam-24
    -rw-rw-rw- 1 syoung root 6.6G Nov 13 10:08 merged.bam-25
    -rw-rw-rw- 1 syoung root 6.9G Nov 13 11:39 merged.bam-26
    -rw-rw-rw- 1 syoung root 7.1G Nov 13 13:11 merged.bam-27
    -rw-rw-rw- 1 syoung root 7.4G Nov 13 14:47 merged.bam-28
    -rw-rw-rw- 1 syoung root 7.7G Nov 13 16:27 merged.bam-29
    -rw-rw-rw- 1 syoung root 7.9G Nov 13 18:13 merged.bam-30
    -rw-rw-rw- 1 syoung root 8.2G Nov 13 20:07 merged.bam-31
    -rw-rw-rw- 1 syoung root 8.5G Nov 13 22:38 merged.bam-32
    -rw-rw-rw- 1 syoung root 8.8G Nov 14 00:34 merged.bam-33




</entry>

<entry [Tue Nov  9 15:56:35 EST 2010] RUN indexReads.pl ON NOVOALIGN, MAQ AND ELAND>


NOVOALIGN
---------


INPUT FILES

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22
ll *sam

    -rw-rw-r-- 1 syoung root 86M Nov  4 11:00 hit.r-all-1.sam
    -rw-rw-rw- 1 syoung root 19M Nov  4 15:49 hit.sam
    -rw-rw-rw- 1 syoung root 51M Nov  4 15:49 miss.sam
    -rw-rw-r-- 1 syoung root 69M Nov  4 15:47 out.sam

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1
ll out.sam

    -rw-rw-r-- 1 syoung root 308M Nov  3 17:13 out.sam


CONVERT out.sam INTO hit.sam

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samHits.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/out.sam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam \
--missfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/miss.sam
    

hit.sam FILE TOTAL HITS: 425926

lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam
    
    hit.sam: 425926



LOAD INDEX FILES FOR OLD hit.sam FILE AND NEW hit.r-all-1.sam FILES:


time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.r-all-1.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.r-all-1.sam.db

    IndexRead::buildIndex   VALUES:
    IndexRead::buildIndex   SRR002271.10000002:3:54:798:123#0/1 -> chr22,40243183,163
    IndexRead::buildIndex   SRR002271.10000002:3:54:798:123#0/2 -> chr22,40243375,83
    ...
    IndexReads::count of keys: 425926
    
    real    0m23.716s
    user    0m22.396s
    sys     0m0.489s

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam.db
    

    IndexReads::indexFile    Finished processing inputfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam
    IndexRead::buildIndex   SRR002271.1000262:1:49:603:315#0/0 -> chr22,16212682,101
    IndexRead::buildIndex   SRR002271.1000262:1:49:603:315#0/1 -> chr22,16212682,153
    ...
    IndexReads::count of keys: 93552
    IndexRead::buildIndex    Completed
    
    real    0m5.384s
    user    0m5.045s
    sys     0m0.121s


OUTPUT FILES:

ll *db
    
    -rw-rw-rw- 1 syoung root 51M Nov  9 13:39 hit.r-all-1.sam.db
    -rw-rw-rw- 1 syoung root 12M Nov  9 13:31 hit.sam.db




NO READS HAVE MULTIPLE HITS BECAUSE NUMBER OF (UNIQUE) READ ID KEYS IS THE SAME
AS THE NUMBER OF INPUT READS:



time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.r-all-1.sam.db

    IndexRead::numberReads    Printing sample entries
    SRR002271.10000002:3:54:798:123#0/1  -> chr22,40243183,163
    SRR002271.10000002:3:54:798:123#0/2  -> chr22,40243375,83
    ...
    IndexRead::numberReads    counter: 425926
    
    real    0m3.930s
    user    0m3.406s
    sys     0m0.317s



time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/hit.sam.db
    
    93552
    
    real    0m0.895s
    user    0m0.681s
    sys     0m0.152s






MAQ
---


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq


MAQ  **** DID NOT LOAD -- RERUN THIS MANUALLY TO CHECK LOADING
---

1. LOOP THROUGH ALL MAQ (3.3 BILLION READS) VS chr22 hit.sam FILES (3.9GB EACH)

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/indexes
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/indexes

screen -S maq-indexreads

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--replicates 1-33 \
--loop distributed \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/chr22/hit.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/chr22/hit.db \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/indexes \
--label maq-chr22-indexReads \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 


    4 HOURS
    
RUNNING
Wed Nov  3 14:20:31 EDT 2010

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.db
    
    -rw-rw-rw- 1 syoung root 311M Nov  3 17:15 10/chr22/hit.db
    -rw-rw-rw- 1 syoung root 383M Nov  3 17:15 11/chr22/hit.db
    -rw-rw-rw- 1 syoung root 315M Nov  3 17:15 12/chr22/hit.db





ELAND
-----



/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/2000bp/autogenome/1/eland/chr1/hit.db 

IndexRead::numberReads    Printing sample entries
SRR005718.10000031:2:309:340:271/1  -> chr1,218932313,161
SRR005718.10000031:2:309:340:271/2  -> chr1,218932660,81
SRR005718.10000056:2:309:267:727/1  -> chr1,79992964,73
SRR005718.10000063:2:309:787:700/1  -> chr1,175441376,73
...
memory usage BEFORE counter:
  RSS    VSZ
1758456 1915536

IndexRead::numberReads    counter: 8553206
memory usage @ counter:
  RSS    VSZ
1758460 1915536

Elapsed time: 31736 milliseconds
8553206




TESTS
-----


indexVenn.pl
------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db

NB: DUPLICATE KEY:

SRR005734.15335768:6:14:197:412#0

LINE 100:

    SRR005734.15335768:6:14:197:412#0       147     chr22   16113947        255     36M     =       16114060        148     TGTCTCTACTAAAAA\
TACAAAAATTAGCCAGGAGTG    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:0C31C3     NM:i:2

LINE 200:
    
    SRR005734.15335768:6:14:197:412#0       147     chr22   16113948        255     36M     =       16114060        148     TGTCTCTACTAAAAA\
TACAAAAATTAGCCAGGAGTG    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:0C31C3     NM:i:2



/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22 \
--querylabel hit-100 \
--targetlabel hit-200



    Target does not contain key: SRR005735.10209055:2:56:577:1311#0/1       chr22,16051962,163
    IndexRead::getReads    dups:
    $VAR1 = 0;



/nethome/bioinfo/apps/agua/0.5/bin/apps/index/getReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db \
--readname SRR005735.10209055:2:56:577:1311#0/1 



/nethome/bioinfo/apps/agua/0.5/bin/apps/index/getReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db


--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-double-dups.db



mergeIndexes.pl
---------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/mergeIndexes.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-double-dups.db

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-double-dups.db




cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/mergeIndexes.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100-200.db

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100-200.db


/nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db




indexReads.pl
-------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-200.db

    OK!
    

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-100.db




/nethome/bioinfo/apps/agua/0.5/bin/apps/index/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db


lookupReads.pl
--------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/index/lookupRead.pl --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db --readname SRR005734.15335768:6:14:197:412#0/1 --mode count

    IndexRead::lookupRead    readname: SRR005734.15335768:6:14:197:412#0/1
    IndexRead::lookupRead    dbfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db
    IndexRead::lookupRead   readname SRR005734.15335768:6:14:197:412#0/1 entries: chr22,16113947,147
    IndexRead::lookupRead   scalar = get_dup(SRR005734.15335768:6:14:197:412#0/1, 1)
    2


/nethome/bioinfo/apps/agua/0.5/bin/apps/index/lookupRead.pl --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db --readname SRR005734.15335768:6:14:197:412#0/1 --mode array

    IndexRead::lookupRead    readname: SRR005734.15335768:6:14:197:412#0/1
    IndexRead::lookupRead    dbfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db
    IndexRead::lookupRead   readname SRR005734.15335768:6:14:197:412#0/1 entries: chr22,16113947,147
    IndexRead::lookupRead   array = get_dup(SRR005734.15335768:6:14:197:412#0/1):
    
    chr22,16113947,147
    chr22,16113948,147


/nethome/bioinfo/apps/agua/0.5/bin/apps/index/lookupRead.pl --dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db --readname SRR005734.15335768:6:14:197:412#0/1 --mode hash

    IndexRead::lookupRead    readname: SRR005734.15335768:6:14:197:412#0/1
    IndexRead::lookupRead    dbfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db
    IndexRead::lookupRead   readname SRR005734.15335768:6:14:197:412#0/1 entries: chr22,16113947,147
    IndexRead::lookupRead   hash = get_dup(SRR005734.15335768:6:14:197:412#0/1, 1):
    
    $VAR1 = {
              'chr22,16113947,147' => 1,
              'chr22,16113948,147' => 1
            };



numberReads.pl
--------------

time /nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit-dups.db
    
    1
    
    real    0m0.124s
    user    0m0.103s
    sys     0m0.019s



time /nethome/bioinfo/apps/agua/0.5/bin/apps/index/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/hit.db

    256562
    
    real    0m1.690s
    user    0m1.593s
    sys     0m0.086s








</entry>

<entry [Tue Nov  9 12:27:10 EST 2010] COMPARE ELAND AND ELAND2>

SAME HEAD AND TAIL BUT SAM FILES ARE NOT IDENTICAL. E.G., ELAND2 IS 415 MB AND
ELAND IS 397 MB:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp

    -rw-rw-rw- 1 syoung root 397M Oct 13 14:43 autochr22/eland/10/chr22/hit.sam

    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/10/chr22/hit.sam


DIFFERENCE IS THAT ELAND2 SAM FILE ENTRIES HAVE AN ADDITIONAL TAG: AS:i:0

DIFF OF IDS SHOWS THAT hit.sam FILES ARE IDENTICAL IN TERMS OF READ IS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
cut -f 1 autochr22/eland/10/chr22/hit.sam > autochr22/eland/10/chr22/hit.sam.ids

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
cut -f 1 chr22/eland/10/chr22/hit.sam > chr22/eland/10/chr22/hit.sam.ids


head -n 5 chr22/eland/10/chr22/hit.sam.ids

    SRR003846.2664345:4:131:814:828
    SRR002309.569323:1:10:696:1673
    SRR004122.2068068:3:110:207:114
    SRR006553.6449241:3:301:107:503
    SRR002272.14669740:4:48:483:618

head -n 5 autochr22/eland/10/chr22/hit.sam.ids

    SRR003846.2664345:4:131:814:828
    SRR002309.569323:1:10:696:1673
    SRR004122.2068068:3:110:207:114
    SRR006553.6449241:3:301:107:503
    SRR002272.14669740:4:48:483:618


diff autochr22/eland/10/chr22/hit.sam.ids chr22/eland/10/chr22/hit.sam.ids
    <NO DIFF>



SAM FILES
---------


SORT SAM FILES ON u03:

screen -S sort-eland

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
time sort -c -k 3,3 -k 4,4n autochr22/eland/10/chr22/hit.sam
    
    real    0m47.237s
    user    0m45.938s
    sys     0m0.973s


screen -S sort-eland

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
time sort -c -k 3,3 -k 4,4n chr22/eland/10/chr22/hit.sam

    real    0m48.726s
    user    0m47.510s
    sys     0m1.027s


CHECK SAM FILE ENTRIES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
ll autochr22/eland/*/chr22/hit.sam

    -rw-rw-rw- 1 syoung root 397M Oct 13 14:43 autochr22/eland/10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:02 autochr22/eland/11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:21 autochr22/eland/12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:42 autochr22/eland/13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 398M Oct 13 16:05 autochr22/eland/14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 16:30 autochr22/eland/15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 16:57 autochr22/eland/16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 17:25 autochr22/eland/17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 17:56 autochr22/eland/18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 18:29 autochr22/eland/19/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 596M Oct 13 13:41 autochr22/eland/1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 19:04 autochr22/eland/20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 19:40 autochr22/eland/21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 396M Oct 13 20:20 autochr22/eland/22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 21:01 autochr22/eland/23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 21:44 autochr22/eland/24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 22:29 autochr22/eland/25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 23:17 autochr22/eland/26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 00:07 autochr22/eland/27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 398M Oct 14 00:57 autochr22/eland/28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 01:50 autochr22/eland/29/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 397M Oct 13 13:42 autochr22/eland/2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 02:45 autochr22/eland/30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 03:42 autochr22/eland/31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 04:42 autochr22/eland/32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 05:45 autochr22/eland/33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:43 autochr22/eland/3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:48 autochr22/eland/4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:48 autochr22/eland/5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:55 autochr22/eland/6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:04 autochr22/eland/7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:15 autochr22/eland/8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:28 autochr22/eland/9/chr22/hit.sam


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
ll chr22/eland/*/chr22/hit.sam

    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 chr22/eland/11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:11 chr22/eland/12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:09 chr22/eland/15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:08 chr22/eland/1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:13 chr22/eland/20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:11 chr22/eland/22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:13 chr22/eland/24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:12 chr22/eland/25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:10 chr22/eland/26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:08 chr22/eland/2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 chr22/eland/30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 chr22/eland/31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:12 chr22/eland/33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:10 chr22/eland/3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 chr22/eland/4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:06 chr22/eland/5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:09 chr22/eland/7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 chr22/eland/8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 chr22/eland/9/chr22/hit.sam




head -n 5  autochr22/eland/10/chr22/hit.sam

    SRR003846.2664345:4:131:814:828 97      chr22   16050003        97      36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    ++++++++++++++++++++&++%++++++++&$+!       MD:Z:33A2       SM:i:97
    SRR002309.569323:1:10:696:1673  97      chr22   16050088        76      36M     =       16050239        187     GCCTCCTCTCGGGACTGGTATGGGGACGGTCCTGCA    +++++++++++++!!+++!++++++""++"&!+("!       MD:Z:31A4       SM:i:76
    SRR004122.2068068:3:110:207:114 161     chr22   16050110        29      36M     =       16050288        214     GGGACGGTCATGCAATCTGGACAACATTCACCTTTA    +++)'++++&#+(!&+$$)%!#!!"!!"!!!!"!!!       MD:Z:36 SM:i:29
    SRR006553.6449241:3:301:107:503 153     chr22   16050110        9       36M     *       0       0       GGGACGGTCATGCATTCTGGACAACATTCACCTTTA    !!!!!!!!!!!!!"!!#!!'""+"*+!!$(#+!&++       MD:Z:21T14      SM:i:9
    SRR002272.14669740:4:48:483:618 89      chr22   16050111        83      36M     *       0       0       GGACGGTCATGCAATCTGGACAACATTCACCTTTAA    !!"*""!++%'+++(+++*+++++++++$+++++++       MD:Z:36 SM:i:83


head -n 5  chr22/eland/10/chr22/hit.sam

    SRR003846.2664345:4:131:814:828 97      chr22   16050003        97      36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    ++++++++++++++++++++&++%++++++++&$+!       XD:Z:33A2       SM:i:97 AS:i:0
    SRR002309.569323:1:10:696:1673  97      chr22   16050088        76      36M     =       16050239        187     GCCTCCTCTCGGGACTGGTATGGGGACGGTCCTGCA    +++++++++++++!!+++!++++++""++"&!+("!       XD:Z:31A4       SM:i:76 AS:i:0
    SRR004122.2068068:3:110:207:114 161     chr22   16050110        29      36M     =       16050288        214     GGGACGGTCATGCAATCTGGACAACATTCACCTTTA    +++)'++++&#+(!&+$$)%!#!!"!!"!!!!"!!!       XD:Z:36 SM:i:29 AS:i:0
    SRR006553.6449241:3:301:107:503 153     chr22   16050110        9       36M     *       0       0       GGGACGGTCATGCATTCTGGACAACATTCACCTTTA    !!!!!!!!!!!!!"!!#!!'""+"*+!!$(#+!&++       XD:Z:14A21      SM:i:9  AS:i:0
    SRR002272.14669740:4:48:483:618 89      chr22   16050111        83      36M     *       0       0       GGACGGTCATGCAATCTGGACAACATTCACCTTTAA    !!"*""!++%'+++(+++*+++++++++$+++++++       XD:Z:36 SM:i:83 AS:i:0

tail -n 5  autochr22/eland/10/chr22/hit.sam

    SRR003840.2658677:7:128:690:971 81      chr22   51244510        44      36M     =       51244344        -202    GCTGTCAGCCTGCCTGGTATGGCGGGAAGGAGGCTG    !!!!!!!!!!!!!!!#%%+#++++++++++++++++       MD:Z:36 SM:i:44
    SRR004842.3990076:6:55:510:947  73      chr22   51244512        69      36M     *       0       0       TGTCAGCCTGCCTGGTATGGCGGGGAGGAGGCTGGG    ++++++++++++++++++++&+(+!!!%!*&!!!!!       MD:Z:24A10T     SM:i:69
    SRR002272.32284887:8:41:461:347 73      chr22   51244516        29      36M     *       0       0       AGCCTGCCTGGTATGGCGGGGAGGAGGCTGGTGCCA    ++++&++++++%"#++$+%!!!"!!!!!!!!!!!!!       MD:Z:20A15      SM:i:29
    SRR002283.13629790:4:81:903:669 145     chr22   51244520        94      36M     =       51244330        -226    TGCGTGGTATGGCGGGAAGGAGGCTGGTGCCAGAGT    ++"!++++++++"++++++++++"++++++%+++++       MD:Z:32G3       SM:i:94
    SRR002314.3171775:1:146:938:748 81      chr22   51244531        24      36M     =       51244358        -209    GCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGATT    !!!!!!"!!!!!$!!"!!""++%+&+++$!++++#+       MD:Z:36 SM:i:24

tail -n 5  chr22/eland/10/chr22/hit.sam

    SRR003840.2658677:7:128:690:971 81      chr22   51244510        44      36M     =       51244344        -202    GCTGTCAGCCTGCCTGGTATGGCGGGAAGGAGGCTG    !!!!!!!!!!!!!!!#%%+#++++++++++++++++       XD:Z:36 SM:i:44 AS:i:0
    SRR004842.3990076:6:55:510:947  73      chr22   51244512        69      36M     *       0       0       TGTCAGCCTGCCTGGTATGGCGGGGAGGAGGCTGGG    ++++++++++++++++++++&+(+!!!%!*&!!!!!       XD:Z:24A10T     SM:i:69 AS:i:0
    SRR002272.32284887:8:41:461:347 73      chr22   51244516        29      36M     *       0       0       AGCCTGCCTGGTATGGCGGGGAGGAGGCTGGTGCCA    ++++&++++++%"#++$+%!!!"!!!!!!!!!!!!!       XD:Z:20A15      SM:i:29 AS:i:0
    SRR002283.13629790:4:81:903:669 145     chr22   51244520        94      36M     =       51244330        -226    TGCGTGGTATGGCGGGAAGGAGGCTGGTGCCAGAGT    ++"!++++++++"++++++++++"++++++%+++++       XD:Z:3C32       SM:i:94 AS:i:0
    SRR002314.3171775:1:146:938:748 81      chr22   51244531        24      36M     =       51244358        -209    GCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGATT    !!!!!!"!!!!!$!!"!!""++%+&+++$!++++#+       XD:Z:36 SM:i:24 AS:i:0



diff autochr22/eland/10/chr22/hit.sam  chr22/eland/10/chr22/hit.sam > diff
ll diff

    -rw-rw-r-- 1 syoung root 822M Nov  9 11:51 diff

head diff

    1,2617141c1,2617141
    < SRR003846.2664345:4:131:814:828       97      chr22   16050003        97      36M     =       16050195        228     TCTGATAAGTCCCAGGACTTCAGAAGAGCTGTGCGA    ++++++++++++++++++++&++%++++++++&$+!       MD:Z:33A2       SM:i:97
    < SRR002309.569323:1:10:696:1673        97      chr22   16050088        76      36M     =       16050239        187     GCCTCCTCTCGGGACTGGTATGGGGACGGTCCTGCA    +++++++++++++!!+++!++++++""++"&!+("!       MD:Z:31A4       SM:i:76
    < SRR004122.2068068:3:110:207:114       161     chr22   16050110        29      36M     =       16050288        214     GGGACGGTCATGCAATCTGGACAACATTCACCTTTA    +++)'++++&#+(!&+$$)%!#!!"!!"!!!!"!!!       MD:Z:36 SM:i:29
    < SRR006553.6449241:3:301:107:503       153     chr22   16050110        9       36M     *       0       0       GGGACGGTCATGCATTCTGGACAACATTCACCTTTA    !!!!!!!!!!!!!"!!#!!'""+"*+!!$(#+!&++       MD:Z:21T14      SM:i:9




</entry>

<entry [Tue Nov  9 11:25:36 EST 2010] RERUN BOWTIE-RF FILES 1 AND 9>

1. SAVE OLD RUNS 1 AND 9, AND RERUN:


FILE 1
------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/

screen -S bowtie-rf-1

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1 \
--params " --rf " \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-1 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/bowtie-200bp-chr22-1.out 


    RUNNING
    Fri Nov 12 13:58:15 EST 2010

    BOWTIE.pl    Run time: 01:56:13
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    3:54PM, 12 November 2010
    BOWTIE.pl    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1
ls -alh

    ...
    -rw-rw-rw-  1 syoung root  52M Nov 12 15:53 hit.bam
    -rw-rw-rw-  1 syoung root 2.3M Nov 12 15:54 hit.filter
    -rw-rw-rw-  1 syoung root 9.7M Nov 12 15:54 hit.raw
    -rw-rw-rw-  1 syoung root 150M Nov 12 15:52 hit.sam
    -rw-rw-rw-  1 syoung root 1.1M Nov 12 15:54 hit.snp
    ...


FILE 9
------

screen -S bowtie-rf-9

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-9.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-9.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9 \
--params " --rf " \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-9 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/9/bowtie-200bp-chr22-9.out 



RUNNING
Tue Nov  9 11:34:32 EST 2010

DONE

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/9/chr22
ll *

    ...
    -rw-rw-rw-  1 syoung root 299M Nov  5 18:45 hit.bam
    -rw-rw-rw-  1 syoung root 8.6M Nov  5 18:47 hit.filter
    -rw-rw-rw-  1 syoung root  20M Nov  5 18:47 hit.raw
    -rw-rw-rw-  1 syoung root 888M Nov  5 18:41 hit.sam
    -rw-rw-rw-  1 syoung root 4.8M Nov  5 18:47 hit.snp
    ...



</entry>

<entry [Mon Nov  8 23:49:46 EST 2010] RUN snpVenn.pl ON BOWTIE>


mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn

ON u02:

screen -S eland-vennsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn \
--replicates 1-33 \
--loop distributed \
--label eland-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/loop-vennsav.out
    
    Run time: 00:04:04
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    0:02AM, 9 November 2010
    ****************************************
    

OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/venn    
lines *snp


**** PROBLEM: TOTAL SNPS DO NOT ADD UP TO ACTUAL SNPS IN hit.snp FILES


    hit-10-snp-NOT-hit-33-snp: 87
    hit-11-snp-NOT-hit-33-snp: 87
    hit-12-snp-NOT-hit-33-snp: 83
    hit-13-snp-NOT-hit-33-snp: 214
    hit-14-snp-NOT-hit-33-snp: 214
    hit-15-snp-NOT-hit-33-snp: 210
    hit-16-snp-NOT-hit-33-snp: 213
    hit-17-snp-NOT-hit-33-snp: 213
    hit-18-snp-NOT-hit-33-snp: 209
    hit-19-snp-NOT-hit-33-snp: 206
    hit-20-snp-NOT-hit-33-snp: 202
    hit-22-snp-NOT-hit-33-snp: 615
    hit-23-snp-NOT-hit-33-snp: 44
    hit-24-snp-NOT-hit-33-snp: 124
    hit-25-snp-NOT-hit-33-snp: 113
    hit-26-snp-NOT-hit-33-snp: 97
    hit-27-snp-NOT-hit-33-snp: 82
    hit-28-snp-NOT-hit-33-snp: 67
    hit-29-snp-NOT-hit-33-snp: 56
    hit-31-snp-NOT-hit-33-snp: 44
    hit-32-snp-NOT-hit-33-snp: 90
    hit-33-snp-AND-hit-10-snp: 71
    hit-33-snp-AND-hit-11-snp: 71
    hit-33-snp-AND-hit-12-snp: 74
    hit-33-snp-AND-hit-13-snp: 77
    hit-33-snp-AND-hit-14-snp: 78
    hit-33-snp-AND-hit-15-snp: 80
    hit-33-snp-AND-hit-16-snp: 80
    hit-33-snp-AND-hit-17-snp: 82
    hit-33-snp-AND-hit-18-snp: 81
    hit-33-snp-AND-hit-19-snp: 87
    hit-33-snp-AND-hit-20-snp: 88
    hit-33-snp-AND-hit-22-snp: 221
    hit-33-snp-AND-hit-23-snp: 76
    hit-33-snp-AND-hit-24-snp: 92
    hit-33-snp-AND-hit-25-snp: 103
    hit-33-snp-AND-hit-26-snp: 119
    hit-33-snp-AND-hit-27-snp: 134
    hit-33-snp-AND-hit-28-snp: 149
    hit-33-snp-AND-hit-29-snp: 160
    hit-33-snp-AND-hit-31-snp: 171
    hit-33-snp-AND-hit-32-snp: 842
    hit-33-snp-AND-hit-33-snp: 933
    hit-33-snp-AND-hit-3-snp: 62
    hit-33-snp-AND-hit-5-snp: 54
    hit-33-snp-AND-hit-7-snp: 60
    hit-33-snp-AND-hit-8-snp: 74
    hit-33-snp-AND-hit-9-snp: 67
    hit-33-snp-NOT-hit-10-snp: 863
    hit-33-snp-NOT-hit-11-snp: 862
    hit-33-snp-NOT-hit-12-snp: 859
    hit-33-snp-NOT-hit-13-snp: 856
    hit-33-snp-NOT-hit-14-snp: 855
    hit-33-snp-NOT-hit-15-snp: 854
    hit-33-snp-NOT-hit-16-snp: 854
    hit-33-snp-NOT-hit-17-snp: 852
    hit-33-snp-NOT-hit-18-snp: 852
    hit-33-snp-NOT-hit-19-snp: 847
    hit-33-snp-NOT-hit-20-snp: 846
    hit-33-snp-NOT-hit-22-snp: 713
    hit-33-snp-NOT-hit-23-snp: 857
    hit-33-snp-NOT-hit-24-snp: 842
    hit-33-snp-NOT-hit-25-snp: 831
    hit-33-snp-NOT-hit-26-snp: 815
    hit-33-snp-NOT-hit-27-snp: 800
    hit-33-snp-NOT-hit-28-snp: 785
    hit-33-snp-NOT-hit-29-snp: 774
    hit-33-snp-NOT-hit-31-snp: 762
    hit-33-snp-NOT-hit-32-snp: 92
    hit-33-snp-NOT-hit-33-snp: 0
    hit-33-snp-NOT-hit-3-snp: 875
    hit-33-snp-NOT-hit-5-snp: 881
    hit-33-snp-NOT-hit-7-snp: 876
    hit-33-snp-NOT-hit-8-snp: 862
    hit-33-snp-NOT-hit-9-snp: 866
    hit-3-snp-NOT-hit-33-snp: 994
    hit-5-snp-NOT-hit-33-snp: 278
    hit-7-snp-NOT-hit-33-snp: 647
    hit-8-snp-NOT-hit-33-snp: 633
    hit-9-snp-NOT-hit-33-snp: 91


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22

lines *snp

    hit-10.snp: 142036
    hit-11.snp: 140782
    hit-12.snp: 139260
    hit-13.snp: 136750
    hit-14.snp: 134620
    hit-15.snp: 131973
    hit-16.snp: 131973
    hit-17.snp: 129394
    hit-18.snp: 129394
    hit-19.snp: 126675
    hit-1.snp: 77385
    hit-20.snp: 124208
    hit-21.snp: 121730
    hit-22.snp: 121730
    hit-23.snp: 119446
    hit-24.snp: 117181
    hit-25.snp: 115018
    hit-26.snp: 112829
    hit-27.snp: 110803
    hit-28.snp: 108589
    hit-29.snp: 106653
    hit-2.snp: 106305
    hit-31.snp: 104736
    hit-32.snp: 102890
    hit-33.snp: 100846
    hit-3.snp: 122804
    hit-5.snp: 132842
    hit-7.snp: 138307
    hit-8.snp: 141259
    hit-9.snp: 142117



</entry>

<entry [Mon Nov  8 23:49:46 EST 2010] RUN SAV.pl ON BOWTIE>

INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/
ll hit*snp

    -rw-rw-rw- 1 syoung root 4.8M Nov  5 13:44 hit-1.snp
    -rw-rw-rw- 1 syoung root 7.1M Nov  5 13:54 hit-2.snp
    -rw-rw-rw- 1 syoung root 8.9M Nov  5 14:07 hit-3.snp
    -rw-rw-rw- 1 syoung root  11M Nov  5 14:25 hit-5.snp
    -rw-rw-rw- 1 syoung root  12M Nov  5 14:46 hit-7.snp
    -rw-rw-rw- 1 syoung root  12M Nov  5 15:11 hit-8.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 15:38 hit-9.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 16:09 hit-10.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 16:44 hit-11.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 17:22 hit-12.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 18:43 hit-13.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 19:27 hit-14.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 20:13 hit-15.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 20:15 hit-16.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 21:05 hit-17.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 21:07 hit-18.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 22:07 hit-19.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 23:06 hit-20.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 00:11 hit-21.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 00:13 hit-22.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 01:20 hit-23.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 02:31 hit-24.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 03:48 hit-25.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 05:38 hit-26.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 07:01 hit-27.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 08:23 hit-28.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 09:48 hit-29.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 11:31 hit-31.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 13:05 hit-32.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 14:42 hit-33.snp



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative


ON u03:

screen -S bowtie-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--replicates 1-33 \
--loop distributed \
--label bowtie-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/loop-sav.out
    

RUNNING 
Mon Nov  8 23:54:47 EST 2010


NB: FILE 2 MISSING

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ll *sav

    -rw-rw-rw- 1 syoung root 8.9M Nov  9 09:30 hit-1.sav
    -rw-rw-rw- 1 syoung root  16M Nov  9 08:32 hit-3.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 22:21 hit-5.sav
    -rw-rw-rw- 1 syoung root  19M Nov  9 13:37 hit-7.sav
    -rw-rw-rw- 1 syoung root  20M Nov  9 13:53 hit-8.sav
    -rw-rw-rw- 1 syoung root  20M Nov 11 02:26 hit-9.sav
    -rw-rw-rw- 1 syoung root  21M Nov 11 02:26 hit-10.sav
    -rw-rw-rw- 1 syoung root  21M Nov 11 02:21 hit-11.sav
    -rw-rw-rw- 1 syoung root  21M Nov 11 02:15 hit-12.sav
    -rw-rw-rw- 1 syoung root  21M Nov 10 06:31 hit-13.sav
    -rw-rw-rw- 1 syoung root  21M Nov 10 06:20 hit-14.sav
    -rw-rw-rw- 1 syoung root  21M Nov 10 06:06 hit-15.sav
    -rw-rw-rw- 1 syoung root  21M Nov 10 06:06 hit-16.sav
    -rw-rw-rw- 1 syoung root  20M Nov 10 05:52 hit-17.sav
    -rw-rw-rw- 1 syoung root  20M Nov 10 05:52 hit-18.sav
    -rw-rw-rw- 1 syoung root  20M Nov 10 05:29 hit-19.sav
    -rw-rw-rw- 1 syoung root  20M Nov 10 05:03 hit-20.sav
    -rw-rw-rw- 1 syoung root  20M Nov  9 10:13 hit-22.sav
    -rw-rw-rw- 1 syoung root  19M Nov 10 23:46 hit-23.sav
    -rw-rw-rw- 1 syoung root  19M Nov 11 01:38 hit-24.sav
    -rw-rw-rw- 1 syoung root  19M Nov 10 23:41 hit-25.sav
    -rw-rw-rw- 1 syoung root  19M Nov 10 22:50 hit-26.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 21:51 hit-27.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 21:16 hit-28.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 20:47 hit-29.sav
    -rw-rw-rw- 1 syoung root  18M Nov 10 19:52 hit-31.sav
    -rw-rw-rw- 1 syoung root  18M Nov  9 09:20 hit-32.sav
    -rw-rw-rw- 1 syoung root  17M Nov  9 09:11 hit-33.sav



</entry>

<entry [Mon Nov  8 23:35:07 EST 2010] RUN bamCoverage.pl ON BOWTIE>


INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/
ll merged.bam*

    -rw-r--r-- 1 syoung root 299M Nov  5 13:44 merged.bam-1
    -rw-r--r-- 1 syoung root 588M Nov  5 13:53 merged.bam-2
    -rw-r--r-- 1 syoung root 875M Nov  5 14:06 merged.bam-3
    -rw-r--r-- 1 syoung root 1.2G Nov  5 14:22 merged.bam-4
    -rw-r--r-- 1 syoung root 1.2G Nov  5 14:23 merged.bam-5
    -rw-r--r-- 1 syoung root 1.5G Nov  5 14:43 merged.bam-6
    -rw-r--r-- 1 syoung root 1.5G Nov  5 14:44 merged.bam-7
    -rw-r--r-- 1 syoung root 1.7G Nov  5 15:09 merged.bam-8
    -rw-r--r-- 1 syoung root 2.0G Nov  5 15:35 merged.bam-9
    -rw-r--r-- 1 syoung root 2.3G Nov  5 16:06 merged.bam-10
    -rw-r--r-- 1 syoung root 2.6G Nov  5 16:40 merged.bam-11
    -rw-r--r-- 1 syoung root 2.8G Nov  5 17:18 merged.bam-12
    -rw-r--r-- 1 syoung root 3.1G Nov  5 18:38 merged.bam-13
    -rw-r--r-- 1 syoung root 3.4G Nov  5 19:21 merged.bam-14
    -rw-r--r-- 1 syoung root 2.0G Nov  5 20:07 merged.bam-15
    -rw-r--r-- 1 syoung root 3.6G Nov  5 20:09 merged.bam-16
    -rw-rw-rw- 1 syoung root 3.1G Nov  5 20:59 merged.bam-17
    -rw-rw-rw- 1 syoung root 3.9G Nov  5 21:01 merged.bam-18
    -rw-rw-rw- 1 syoung root 4.2G Nov  5 21:59 merged.bam-19
    -rw-rw-rw- 1 syoung root 4.5G Nov  5 22:59 merged.bam-20
    -rw-rw-rw- 1 syoung root 4.2G Nov  6 00:03 merged.bam-21
    -rw-rw-rw- 1 syoung root 4.7G Nov  6 00:05 merged.bam-22
    -rw-rw-rw- 1 syoung root 5.0G Nov  6 01:11 merged.bam-23
    -rw-rw-rw- 1 syoung root 5.3G Nov  6 02:21 merged.bam-24
    -rw-rw-rw- 1 syoung root 5.5G Nov  6 03:37 merged.bam-25
    -rw-rw-rw- 1 syoung root 5.8G Nov  6 05:21 merged.bam-26
    -rw-rw-rw- 1 syoung root 6.1G Nov  6 06:49 merged.bam-27
    -rw-rw-rw- 1 syoung root 6.3G Nov  6 08:10 merged.bam-28
    -rw-rw-rw- 1 syoung root 6.6G Nov  6 09:35 merged.bam-29
    -rw-rw-rw- 1 syoung root 6.9G Nov  6 11:09 merged.bam-30
    -rw-rw-rw- 1 syoung root 6.9G Nov  6 11:17 merged.bam-31
    -rw-rw-rw- 1 syoung root 7.1G Nov  6 12:50 merged.bam-32
    -rw-rw-rw- 1 syoung root 7.4G Nov  6 14:26 merged.bam-33



1. INDEX BAM FILES

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--loop distributed \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/indexBam.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/merged.bam-%REPLICATE%.bai \
--label bamIndex \
--cluster LSF \
--maxjobs 1000 \
--queue small


    screen -S bow-index
    RUNNING Mon Nov  8 23:48:44 EST 2010
    
    Run time: 00:24:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    0:09AM, 9 November 2010
    ****************************************


    #Run time: 00:12:34
    #Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    #0:51AM, 5 November 2010
    #****************************************




2. RUN bamCoverage.pl ON BOWTIE

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative

ON u02:
------

screen -S bowtie-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/merged.bam-%REPLICATE%.coverage \
--replicates 1-33 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22/bamCoverage.out


    RUNNING
    Tue Nov  9 12:49:52 EST 2010
    
    Run time: 00:55:37
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:45PM, 9 November 2010
    ****************************************

COVERAGES FROM *coverage FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22

    1	 3.727890
    2	 7.455688
    3	 11.183353
    4	 14.911706
    5	 14.911706
    6	 18.638961
    7	 18.638961
    8	 22.367925
    9	 26.096812
    10	 29.819974
    11	 33.545705
    12	 37.271978
    13	 41.001346
    14	 44.727550
    15	 26.079758
    16	 48.455376
    17	 41.792664
    18	 52.183249
    19	 55.910635
    20	 59.640799
    21	 56.709501
    22	 63.365502
    23	 67.095555
    24	 70.826948
    25	 74.561562
    26	 78.289272
    27	 82.018202
    28	 85.749972
    29	 89.480562
    30	 93.207338
    31	 93.207338
    32	 96.935742
    33	 100.668568


</entry>

<entry [Sat Nov  6 01:54:03 EDT 2010] RERUN ELAND.pl TO CONFIRM READ HITS>


ALL FILES 1-33
--------------

mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland

screen -S loop-eland-chr22

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/ELAND.pl \
--replicates 1-33 \
--loop parallel \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--inputtype fastq \
--species human \
--label eland-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE% \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/eland/chr22 \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%/eland-chr22-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/loop-eland-chr.stdout
    
    ALIGNMENT ONLY

    Run time: 04:41:29
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:34AM, 6 November 2010
    ****************************************


    POST-ALIGNMENT

    Run time: 00:43:17
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:16AM, 6 November 2010
    ****************************************


COMPARE RESULTING hit.sam FILES WITH FIRST ELAND RUN (eland):

FIRST RUN:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ll */chr22/hit.sam

    -rw-rw-r-- 1 syoung root 596M Oct 13 13:41 1/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 397M Oct 13 13:42 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:43 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:48 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:48 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 13:55 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:04 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:15 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:28 9/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 14:43 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:02 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:21 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 15:42 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 398M Oct 13 16:05 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 16:30 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 16:57 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 17:25 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 17:56 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 18:29 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 19:04 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 19:40 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 396M Oct 13 20:20 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 21:01 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 21:44 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 22:29 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 13 23:17 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 00:07 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 398M Oct 14 00:57 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 01:50 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 02:45 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 03:42 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 04:42 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 397M Oct 14 05:45 33/chr22/hit.sam


SECOND RUN (eland):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland
ll */chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:08 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:08 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:10 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:06 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:09 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 9/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:11 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:09 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:13 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:11 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:13 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:12 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:10 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:10 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:09 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:12 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:11 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 415M Nov  6 11:12 33/chr22/hit.sam

ll */chr22/hit.snp

    -rw-rw-rw- 1 syoung root 704K Nov  6 11:14 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 702K Nov  6 11:12 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 695K Nov  6 11:14 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 701K Nov  6 11:13 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 700K Nov  6 11:14 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 698K Nov  6 11:13 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 694K Nov  6 11:16 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 701K Nov  6 11:16 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 699K Nov  6 11:16 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 692K Nov  6 11:16 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 691K Nov  6 11:11 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 696K Nov  6 11:16 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 699K Nov  6 11:15 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 706K Nov  6 11:15 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 700K Nov  6 11:16 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 706K Nov  6 11:16 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 702K Nov  6 11:16 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 695K Nov  6 11:13 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 703K Nov  6 11:14 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 702K Nov  6 11:14 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 703K Nov  6 11:16 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 700K Nov  6 11:11 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 701K Nov  6 11:13 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 697K Nov  6 11:16 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 693K Nov  6 11:14 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 701K Nov  6 11:05 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 697K Nov  6 11:14 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 702K Nov  6 11:13 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 699K Nov  6 11:09 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 689K Nov  6 11:14 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 698K Nov  6 11:13 7/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 693K Nov  6 11:13 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 709K Nov  6 11:14 9/chr22/hit.snp




COMPARE FILE 1 hit.sam BETWEEN eland AND eland


ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

head -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
head -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

tail -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
tail -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam


ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
    
    -rw-rw-rw- 1 syoung root 414M Nov  6 11:08 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

    -rw-rw-r-- 1 syoung root 596M Oct 13 13:41 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam


head -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam

    SRR004823.14378:3:1:253:207     97      chr22   16050016        74      36M     =       16050195        215     AGGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTC  ++++++++++++++&++++++++"+++++!!+!""!     XD:Z:20A15      SM:i:74 AS:i:0
    SRR002304.7863377:1:90:544:448  97      chr22   16050031        30      36M     =       16050192        197     CTGTGCGACCTTGGCCAAGTCACTTCCCCCTTCAGG  +++++++++++++&!+#!#!+++!!!!!!"!!!"!!     XD:Z:5A21T8     SM:i:30 AS:i:0
    SRR002301.2006530:3:94:327:904  97      chr22   16050036        44      36M     =       16050211        211     CGACCTTGGCCAAGTCACTTCCTCCTTCAGGAACAT  ++++++++++++++++++++&!!"$$!"!"!!!!!%     XD:Z:A35        SM:i:44 AS:i:0
    SRR006554.5571971:2:259:467:605 73      chr22   16050041        9       36M     *       0       0       TTGGCCAAGTCACTTCCTCCTTCAGGAACATTGCAG    +++++"!#'$!!#''"!&!%!$!!!"!!!!!"!!!!   XD:Z:36 SM:i:9  AS:i:0
    SRR002319.5673218:1:61:1847:1157        89      chr22   16050048        34      36M     *       0       0       AGTCACTTCCTCCTTCAGGAACATTGCAGTGGGCCT  '!!(!+"!")!"+!!++!!%+++#"!++!$!"!+++     XD:Z:36 SM:i:34 AS:i:0

head -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

    SRR005734.12612956:4:39:1116:140        153     chr22   16050009        81      36M     *       0       0       AAGTCCCAGGACTTCAGAAGAGCTCTGTGACCTTGG  )+!"++++++++++++++++++++++++++++++++     MD:Z:8T2C24     SM:i:81
    SRR005735.1021891:1:16:1497:601 89      chr22   16050009        87      36M     *       0       0       AAGTCCCAGGACTTCAGAAGAGCTGTGCGACCTTGG    ++*%++++"+%++!++++++++++++++++++++++   MD:Z:8T27       SM:i:87
    SRR005720.9831257:3:235:581:574 153     chr22   16050017        27      36M     *       0       0       GGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTCA    !!!!!!!""&$#!%)!#!"+*!&+!+++++++++++   MD:Z:16T19      SM:i:27
    SRR005735.21683701:4:59:929:555 73      chr22   16050023        113     36M     *       0       0       CAGAAGAGCTGTGAGACCTTGGCCAAGTCACTTCCT    +++++++++++++++++++++++++&++++++++++   MD:Z:36 SM:i:113
    SRR005718.21685282:4:313:915:176        137     chr22   16050025        30      36M     *       0       0       GAAGAGCTGTGAGACCTTGGCCAAGTCACTTCCTCC  +#&+!+!++!+++++""(++!!"!"!!!!!!!"!!!     MD:Z:36 SM:i:30

tail -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam

    SRR004871.3855306:8:174:104:929 81      chr22   51244531        74      36M     =       51244346        -221    GCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGATT  #!!!"""$%+(&+!)+++++++++++++++++++++     XD:Z:36 SM:i:74 AS:i:0
    SRR006550.2370763:4:122:601:946 145     chr22   51244531        5       36M     =       51244362        -205    GCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGTATT  !!!!!!!!!!!!!!!!"!!!!"&!!$(+'+++)++"     XD:Z:32G3       SM:i:5  AS:i:0
    SRR002295.7188026:2:78:968:939  73      chr22   51244534        91      36M     *       0       0       GGAAGGAGGCTGGTGCCAGAGTGGATTCGGATTTAT    +++++++++++++++++*+)+*+++++!#*!(+!!%   XD:Z:33NNN      SM:i:91 AS:i:0
    SRR002307.7032921:2:87:309:1550 73      chr22   51244535        28      36M     *       0       0       GAAGGAGGCTGGTGCCAGAGTGGAGGCGGATTGAGC    +"*++!++!++++"#$++!!!++!!!!!$!!!$!!!   XD:Z:24TT6NNNN  SM:i:28 AS:i:0
    SRR003852.5377630:3:267:930:51  137     chr22   51244535        24      36M     *       0       0       GAAGGAGGCTGGTGCCAGAGTGGATTCGGATTGATC    ++++++++!&++!+!!!%!"!!%!!!!!!!!"!!!!   XD:Z:32NNNN     SM:i:24 AS:i:0


tail -n 5 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam

    SRR005734.8715020:3:41:157:166  153     chr22   51244527        115     36M     *       0       0       TATGGCGGGAAGGAGGCTGGTGCCAGAGTGGATTCG    ++++++++++++++++++++++++++++++++++++   MD:Z:36 SM:i:115
    SRR005718.8179590:2:176:348:845 137     chr22   51244528        69      36M     *       0       0       ATGGCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGG    ++++++++""++)++++++#+)+!+!+!%+!%"!!+   MD:Z:36 SM:i:69
    SRR005718.19181891:4:171:25:300 97      chr22   51244529        77      36M     =       51242930        -1563   TGGCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGA  ++++++++++++++++++%+%"++(+!++#"$!#*!     MD:Z:36 SM:i:77
    SRR005719.7077536:3:143:149:601 97      chr22   51244530        43      36M     =       51242420        -2074   GGCGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGAT  +++++++++++++!)++!)!!!!!"!"!!!!!!!!!     MD:Z:36 SM:i:43
    SRR005718.1445461:1:82:765:909  161     chr22   51244532        63      36M     =       51243049        -1447   CGGGAAGGAGGCTGGTGCCAGAGTGGATTCGGGTTG  +++++++++++++++!+++$+!+!&#!*+$+++!%!     MD:Z:32A2N      SM:i:63


READS MATCHED IN eland FILE 1 ARE NOT FOUND IN eland FILE 1:
(TOTALLY DIFFERENT INPUT FILES?)

grep -n SRR005734.12612956:4:39:1116:140 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
grep -n SRR005735.1021891:1:16:1497:601 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
grep -n SRR005720.9831257:3:235:581:574 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam
grep -n SRR005735.21683701:4:59:929:555 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam    
grep -n SRR005718.21685282:4:313:915:176 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam




DO samVenn.pl TO CONFIRM:

ON u04:

screen -S eland-samvenn


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn

rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn/samvenn.sh
emacs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn/samvenn.sh
#!/bin/sh

#BSUB -J eland-samVenn
#BSUB -W 24:00
#BSUB -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn/samVenn.out
#BSUB -e /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn/samVenn.err

echo "Comparing FILE 1 hit.sam from eland and eland alignments"

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1/chr22/hit.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn \
--querylabel eland \
--targetlabel eland 

echo "Completed samVenn.pl"


RUN

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/venn
bsub -q small < samvenn.sh


RUNNING

    bsub -q small < samvenn.sh
    Job <2258539> is submitted to queue <small>.
    Tue Nov  9 12:12:28 EST 2010



NOTES
-----

PROBLEM:

/nethome/bioinfo/apps/samtools/0.1.8/export2sam.pl: No such file or directory

SOLUTION:

ADJUST LOCATION OF export2sam.pl DEPENDING ON THE VERSION OF SAMTOOLS



</entry>

<entry [Fri Nov  5 08:53:03 EDT 2010] RUN snpVenn.pl ON ELAND SNPS (LAST-AGAINST-ALL)>

INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ll hit*.snp

-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-10.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-11.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-12.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-13.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-14.snp
-rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-15.snp
-rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-16.snp
-rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-17.snp
-rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-18.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-19.snp
-rw-rw-r-- 1 syoung root 1.5M Oct 21 12:51 hit-1.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-20.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-21.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-22.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-23.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-24.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-25.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-26.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-27.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-28.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-29.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-30.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-31.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-32.snp
-rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-33.snp
-rw-rw-r-- 1 syoung root 1.4M Oct 21 12:51 hit-3.snp
-rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-4.snp
-rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-5.snp
-rw-rw-r-- 1 syoung root 2.0M Oct 21 12:51 hit-6.snp
-rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-7.snp
-rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-8.snp
-rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-9.snp


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ll hit*.sav

-rw-rw-rw- 1 syoung root 3.9M Oct 27 06:19 hit-10.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 06:31 hit-11.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 06:30 hit-12.sav
-rw-rw-rw- 1 syoung root 4.0M Oct 27 06:30 hit-13.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 06:29 hit-14.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 09:17 hit-15.sav
-rw-rw-rw- 1 syoung root 3.9M Oct 27 09:14 hit-16.sav
-rw-rw-rw- 1 syoung root 3.8M Oct 27 09:11 hit-17.sav
-rw-rw-rw- 1 syoung root 3.8M Oct 27 09:06 hit-18.sav
-rw-rw-rw- 1 syoung root 3.7M Oct 27 09:03 hit-19.sav
-rw-rw-rw- 1 syoung root 2.9M Oct 27 14:49 hit-1.sav
-rw-rw-rw- 1 syoung root 3.7M Oct 27 09:01 hit-20.sav
-rw-rw-rw- 1 syoung root 3.7M Oct 27 08:58 hit-21.sav
-rw-rw-rw- 1 syoung root 3.6M Oct 27 08:53 hit-22.sav
-rw-rw-rw- 1 syoung root 3.6M Oct 27 06:07 hit-23.sav
-rw-rw-rw- 1 syoung root 3.5M Oct 27 06:06 hit-24.sav
-rw-rw-rw- 1 syoung root 3.5M Oct 27 06:04 hit-25.sav
-rw-rw-rw- 1 syoung root 3.4M Oct 27 06:04 hit-26.sav
-rw-rw-rw- 1 syoung root 3.4M Oct 27 06:03 hit-27.sav
-rw-rw-rw- 1 syoung root 3.4M Oct 27 06:01 hit-28.sav
-rw-rw-rw- 1 syoung root 3.4M Oct 27 06:00 hit-29.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 05:57 hit-30.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 05:03 hit-31.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 05:01 hit-32.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 05:00 hit-33.sav
-rw-rw-rw- 1 syoung root 2.4M Oct 27 05:19 hit-3.sav
-rw-rw-rw- 1 syoung root 2.9M Oct 27 05:52 hit-4.sav
-rw-rw-rw- 1 syoung root 2.9M Oct 27 05:52 hit-5.sav
-rw-rw-rw- 1 syoung root 3.3M Oct 27 06:04 hit-6.sav
-rw-rw-rw- 1 syoung root 3.5M Oct 27 06:11 hit-7.sav
-rw-rw-rw- 1 syoung root 3.7M Oct 27 06:15 hit-8.sav
-rw-rw-rw- 1 syoung root 3.8M Oct 27 06:18 hit-9.sav



1. ALL SNPS
-----------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn

ON u03:

screen -S eland-vennsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--replicates 2-33 \
--loop distributed \
--label eland-vennsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/loop-vennsav.out
    
    Run time: 00:16:49
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    4:10PM, 5 November 2010
    ****************************************




OUTPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn
lines *-snp

    hit-1-snp-NOT-hit-33-snp	20720
    hit-3-snp-NOT-hit-33-snp	14918
    hit-4-snp-NOT-hit-33-snp	16801
    hit-5-snp-NOT-hit-33-snp	16801
    hit-6-snp-NOT-hit-33-snp	17261
    hit-7-snp-NOT-hit-33-snp	17119
    hit-8-snp-NOT-hit-33-snp	16585
    hit-9-snp-NOT-hit-33-snp	15968
    hit-10-snp-NOT-hit-33-snp	15236
    hit-11-snp-NOT-hit-33-snp	14457
    hit-12-snp-NOT-hit-33-snp	13645
    hit-13-snp-NOT-hit-33-snp	12815
    hit-14-snp-NOT-hit-33-snp	12058
    hit-15-snp-NOT-hit-33-snp	11233
    hit-16-snp-NOT-hit-33-snp	10415
    hit-17-snp-NOT-hit-33-snp	9724
    hit-18-snp-NOT-hit-33-snp	8918
    hit-19-snp-NOT-hit-33-snp	8238
    hit-20-snp-NOT-hit-33-snp	7610
    hit-21-snp-NOT-hit-33-snp	7111
    hit-22-snp-NOT-hit-33-snp	6456
    hit-23-snp-NOT-hit-33-snp	5882
    hit-24-snp-NOT-hit-33-snp	5244
    hit-25-snp-NOT-hit-33-snp	4600
    hit-26-snp-NOT-hit-33-snp	4142
    hit-27-snp-NOT-hit-33-snp	3651
    hit-28-snp-NOT-hit-33-snp	3136
    hit-29-snp-NOT-hit-33-snp	2606
    hit-30-snp-NOT-hit-33-snp	2046
    hit-31-snp-NOT-hit-33-snp	1482
    hit-32-snp-NOT-hit-33-snp	843


    hit-33-snp-AND-hit-10-snp	10093
    hit-33-snp-AND-hit-11-snp	10960
    hit-33-snp-AND-hit-12-snp	11693
    hit-33-snp-AND-hit-13-snp	12433
    hit-33-snp-AND-hit-14-snp	13027
    hit-33-snp-AND-hit-15-snp	13593
    hit-33-snp-AND-hit-16-snp	14108
    hit-33-snp-AND-hit-17-snp	14562
    hit-33-snp-AND-hit-18-snp	14936
    hit-33-snp-AND-hit-19-snp	15360
    hit-33-snp-AND-hit-1-snp	3563
    hit-33-snp-AND-hit-20-snp	15727
    hit-33-snp-AND-hit-21-snp	16033
    hit-33-snp-AND-hit-22-snp	16383
    hit-33-snp-AND-hit-23-snp	16728
    hit-33-snp-AND-hit-24-snp	17016
    hit-33-snp-AND-hit-25-snp	17329
    hit-33-snp-AND-hit-26-snp	17672
    hit-33-snp-AND-hit-27-snp	18004
    hit-33-snp-AND-hit-28-snp	18277
    hit-33-snp-AND-hit-29-snp	18614
    hit-33-snp-AND-hit-30-snp	18953
    hit-33-snp-AND-hit-31-snp	19333
    hit-33-snp-AND-hit-32-snp	19775
    hit-33-snp-AND-hit-33-snp	20467
    hit-33-snp-AND-hit-3-snp	3331
    hit-33-snp-AND-hit-4-snp	4404
    hit-33-snp-AND-hit-5-snp	4404
    hit-33-snp-AND-hit-6-snp	5634
    hit-33-snp-AND-hit-7-snp	6961
    hit-33-snp-AND-hit-8-snp	8090
    hit-33-snp-AND-hit-9-snp	9160


    hit-33-snp-NOT-hit-10-snp	10374
    hit-33-snp-NOT-hit-11-snp	9507
    hit-33-snp-NOT-hit-12-snp	8774
    hit-33-snp-NOT-hit-13-snp	8034
    hit-33-snp-NOT-hit-14-snp	7440
    hit-33-snp-NOT-hit-15-snp	6874
    hit-33-snp-NOT-hit-16-snp	6359
    hit-33-snp-NOT-hit-17-snp	5905
    hit-33-snp-NOT-hit-18-snp	5531
    hit-33-snp-NOT-hit-19-snp	5107
    hit-33-snp-NOT-hit-1-snp	16904
    hit-33-snp-NOT-hit-20-snp	4740
    hit-33-snp-NOT-hit-21-snp	4434
    hit-33-snp-NOT-hit-22-snp	4084
    hit-33-snp-NOT-hit-23-snp	3739
    hit-33-snp-NOT-hit-24-snp	3451
    hit-33-snp-NOT-hit-25-snp	3138
    hit-33-snp-NOT-hit-26-snp	2795
    hit-33-snp-NOT-hit-27-snp	2463
    hit-33-snp-NOT-hit-28-snp	2190
    hit-33-snp-NOT-hit-29-snp	1853
    hit-33-snp-NOT-hit-30-snp	1514
    hit-33-snp-NOT-hit-31-snp	1134
    hit-33-snp-NOT-hit-32-snp	692
    hit-33-snp-NOT-hit-33-snp	0
    hit-33-snp-NOT-hit-3-snp	17136
    hit-33-snp-NOT-hit-4-snp	16063
    hit-33-snp-NOT-hit-5-snp	16063
    hit-33-snp-NOT-hit-6-snp	14833
    hit-33-snp-NOT-hit-7-snp	13506
    hit-33-snp-NOT-hit-8-snp	12377
    hit-33-snp-NOT-hit-9-snp	11307




GET TOTAL LINES PER SNP:


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/
ll *snp

    hit-1.snp	24284
    hit-3.snp	18250
    hit-4.snp	21206
    hit-5.snp	21206
    hit-6.snp	22896
    hit-7.snp	24081
    hit-8.snp	24676
    hit-9.snp	25129
    hit-10.snp	25330
    hit-11.snp	25418
    hit-12.snp	25339
    hit-13.snp	25249
    hit-14.snp	25086
    hit-15.snp	24827
    hit-16.snp	24524
    hit-17.snp	24287
    hit-18.snp	23855
    hit-19.snp	23599
    hit-20.snp	23338
    hit-21.snp	23145
    hit-22.snp	22840
    hit-23.snp	22611
    hit-24.snp	22261
    hit-25.snp	21930
    hit-26.snp	21815
    hit-27.snp	21656
    hit-28.snp	21414
    hit-29.snp	21221
    hit-30.snp	21000
    hit-31.snp	20816
    hit-32.snp	20619
    hit-33.snp	20468



DO FILE 2 VS FILE 33 MANUALLY:

PROBLEM:

MISSING ELAND FILE 2 CUMULATIVE *.sav FILE

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-2.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--querylabel hit-33-sav \
--targetlabel hit-2-sav

    Can't open target file: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-2.sav



DIAGNOSIS:

ELAND FILE 2 hit.sam FILE IS PRESENT BUT hit.snp FILE IS MISSING:
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/2/chr22
ll
    drwxrwxr-x 2 syoung root  445 Oct 29 16:47 .
    drwxrwxr-x 3 syoung root   15 Oct 13 13:23 ..
    -rw-rw-rw- 1 syoung root 2.2K Oct 29 16:45 eland-chr22-indexBam-2.out
    -rw-rw-rw- 1 syoung root  769 Oct 29 13:42 eland-chr22-samToBam-2.out
    -rw-rw-rw- 1 syoung root 1.7K Oct 29 14:55 eland-chr22-sortBam-2.out
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 hit.bam
    -rw-rw-r-- 1 syoung root 397M Oct 13 13:42 hit.sam
    -rw-rw-r-- 1 syoung root 119M Oct 13 13:23 hit.sam.gz
    -rw-rw-r-- 1 syoung root 1.5K Oct 13 13:23 hit.sam.head
    -rw-rw-r-- 1 syoung root 1.6K Oct 13 13:23 hit.sam.tail
    -rw-r--r-- 1 syoung root 128M Oct 29 14:55 hit.sorted.bam
    -rw-rw-rw- 1 syoung root  96K Oct 29 16:44 hit.sorted.bam.bai
    -rw-rw-rw- 1 syoung root   17 Oct 30 02:39 hit.sorted.bam.genome-coverage
    -rwxrwxrwx 1 syoung root 1.1K Oct 29 16:44 indexBam.sh
    -rw-rw-rw- 1 syoung root 1.7K Oct 29 16:44 indexBam-stdout.txt
    -rwxrwxrwx 1 syoung root 1.1K Oct 29 13:41 samToBam.sh
    -rw-rw-rw- 1 syoung root 1.7K Oct 29 13:42 samToBam-stdout.txt
    -rwxrwxrwx 1 syoung root 1.1K Oct 29 14:54 sortBam.sh
    -rw-rw-rw- 1 syoung root 1.7K Oct 29 14:55 sortBam-stdout.txt


SOLUTION:

RERUN cumulativeSnp.pl ON ELAND2


screen -S eland-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/cumulativeSnp.out


STOPPED AT FILE 9:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22

ll merged.bam*

    -rw-rw-rw- 1 syoung root 1.1G Nov  9 13:02 merged.bam
    -rw-rw-rw- 1 syoung root 128M Nov  9 11:23 merged.bam-1
    -rw-rw-rw- 1 syoung root 250M Nov  9 11:29 merged.bam-2
    -rw-rw-rw- 1 syoung root 369M Nov  9 11:36 merged.bam-3
    -rw-rw-rw- 1 syoung root 486M Nov  9 11:45 merged.bam-4
    -rw-rw-rw- 1 syoung root 602M Nov  9 11:57 merged.bam-5
    -rw-rw-rw- 1 syoung root 717M Nov  9 12:10 merged.bam-6
    -rw-rw-rw- 1 syoung root 831M Nov  9 12:26 merged.bam-7
    -rw-rw-rw- 1 syoung root 945M Nov  9 12:43 merged.bam-8
    -rw-rw-rw- 1 syoung root 1.1G Nov  9 13:02 merged.bam-9
    -rw-rw-rw- 1 syoung root 1.1G Nov  9 12:51 merged.bam.temp

ll hit*.snp

    -rw-rw-rw- 1 syoung root 691K Nov  9 11:24 hit-1.snp
    -rw-rw-rw- 1 syoung root 1.2M Nov  9 11:30 hit-2.snp
    -rw-rw-rw- 1 syoung root 1.5M Nov  9 11:37 hit-3.snp
    -rw-rw-rw- 1 syoung root 1.8M Nov  9 11:47 hit-4.snp
    -rw-rw-rw- 1 syoung root 2.0M Nov  9 11:58 hit-5.snp
    -rw-rw-rw- 1 syoung root 2.2M Nov  9 12:12 hit-6.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov  9 12:28 hit-7.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov  9 12:45 hit-8.snp
    -rw-rw-rw- 1 syoung root 2.4M Nov  9 13:05 hit-9.snp


NB: COMPARED TO ORIGINAL eland CUMULATIVE SNPS (MISSING FILE 2):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ll hit*.snp

    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-10.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-11.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-12.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-13.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-14.snp
    -rw-rw-r-- 1 syoung root 2.5M Oct 21 12:51 hit-15.snp
    -rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-16.snp
    -rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-17.snp
    -rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-18.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-19.snp
    -rw-rw-r-- 1 syoung root 1.5M Oct 21 12:51 hit-1.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-20.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-21.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-22.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-23.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-24.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-25.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-26.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-27.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-28.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-29.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-30.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-31.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-32.snp
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-33.snp
    -rw-rw-r-- 1 syoung root 1.4M Oct 21 12:51 hit-3.snp
    -rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-4.snp
    -rw-rw-r-- 1 syoung root 1.7M Oct 21 12:51 hit-5.snp
    -rw-rw-r-- 1 syoung root 2.0M Oct 21 12:51 hit-6.snp
    -rw-rw-r-- 1 syoung root 2.2M Oct 21 12:51 hit-7.snp
    -rw-rw-r-- 1 syoung root 2.3M Oct 21 12:51 hit-8.snp
    -rw-rw-r-- 1 syoung root 2.4M Oct 21 12:51 hit-9.snp

RESTART FROM FILE 10:





screen -S eland-cum

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/33 \
--start 10 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/cumulativeSnp.out2


    RUNNING
    Fri Nov 12 11:07:27 EST 2010


tail /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/cumulativeSnp.out2

    cumulativeSNP.pl    Run time: 20:20:35
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    7:27AM, 13 November 2010
    cumulativeSNP.pl    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative/chr22
ll merged*

    -rw-rw-rw- 1 syoung root 128M Nov  9 11:23 merged.bam-1
    -rw-rw-rw- 1 syoung root 250M Nov  9 11:29 merged.bam-2
    -rw-rw-rw- 1 syoung root 369M Nov  9 11:36 merged.bam-3
    -rw-rw-rw- 1 syoung root 486M Nov  9 11:45 merged.bam-4
    -rw-rw-rw- 1 syoung root 602M Nov  9 11:57 merged.bam-5
    -rw-rw-rw- 1 syoung root 717M Nov  9 12:10 merged.bam-6
    -rw-rw-rw- 1 syoung root 831M Nov  9 12:26 merged.bam-7
    -rw-rw-rw- 1 syoung root 945M Nov  9 12:43 merged.bam-8
    -rw-rw-rw- 1 syoung root 1.1G Nov  9 13:02 merged.bam-9
    -rw-rw-rw- 1 syoung root 1.2G Nov 12 11:27 merged.bam-10
    -rw-rw-rw- 1 syoung root 1.3G Nov 12 11:51 merged.bam-11
    -rw-rw-rw- 1 syoung root 1.4G Nov 12 12:16 merged.bam-12
    -rw-rw-rw- 1 syoung root 1.5G Nov 12 12:46 merged.bam-13
    -rw-rw-rw- 1 syoung root 1.6G Nov 12 13:18 merged.bam-14
    -rw-rw-rw- 1 syoung root 1.7G Nov 12 13:52 merged.bam-15
    -rw-rw-rw- 1 syoung root 1.8G Nov 12 16:07 merged.bam-16
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 16:43 merged.bam-17
    -rw-rw-rw- 1 syoung root 2.0G Nov 12 16:45 merged.bam-18
    -rw-rw-rw- 1 syoung root 2.1G Nov 12 17:33 merged.bam-19
    -rw-rw-rw- 1 syoung root 2.2G Nov 12 18:26 merged.bam-20
    -rw-rw-rw- 1 syoung root 2.3G Nov 12 19:14 merged.bam-21
    -rw-rw-rw- 1 syoung root 2.4G Nov 12 20:03 merged.bam-22
    -rw-rw-rw- 1 syoung root 2.5G Nov 12 20:54 merged.bam-23
    -rw-rw-rw- 1 syoung root 2.6G Nov 12 21:48 merged.bam-24
    -rw-rw-rw- 1 syoung root 2.7G Nov 12 22:45 merged.bam-25
    -rw-rw-rw- 1 syoung root 2.8G Nov 12 23:44 merged.bam-26
    -rw-rw-rw- 1 syoung root 2.9G Nov 13 00:55 merged.bam-27
    -rw-rw-rw- 1 syoung root 3.0G Nov 13 01:53 merged.bam-28
    -rw-rw-rw- 1 syoung root 3.1G Nov 13 02:52 merged.bam-29
    -rw-rw-rw- 1 syoung root 3.2G Nov 13 03:54 merged.bam-30
    -rw-rw-rw- 1 syoung root 3.3G Nov 13 04:59 merged.bam-31
    -rw-rw-rw- 1 syoung root 3.5G Nov 13 06:07 merged.bam-32
    -rw-rw-rw- 1 syoung root 3.6G Nov 13 07:17 merged.bam-33


    OK!







TEST AGAINST FILE 1:

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn \
--querylabel hit-33-snp \
--targetlabel hit-1-snp


    samVenn::Snp.pl    Run time: 00:29:04
    samVenn::Snp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl
    samVenn::Snp.pl    3:04PM, 5 November 2010
    samVenn::Snp.pl    ****************************************






hit-1-snp-NOT-hit-33-snp: 20720
hit-33-snp-AND-hit-1-snp: 3563
hit-33-snp-NOT-hit-1-snp: 16904
[syoung@u01 venn]$ lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav: 24283
[syoung@u01 venn]$ lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.sav: 24283
[syoung@u01 venn]$ lines /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav: 20467




2. dbSNP ONLY
-------------


mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp

ON u03:

screen -S eland-vennsav-dbsnp

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp \
--replicates 1-33 \
--loop distributed \
--label eland-venn-dbsnpsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.dbSNP.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-%REPLICATE%.dbSNP.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp \
--querylabel hit-33-dbsnp \
--targetlabel hit-%REPLICATE%-dbsnp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp/loop-venn-dbsnp-sav.out


OUTPUT FILES:



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp
lines *dbsnp



/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
[syoung@u03 chr22]$ lines *dbSNP* | grep -v non

hit-1.dbSNP.sav: 5398
hit-3.dbSNP.sav: 4765
hit-4.dbSNP.sav: 5970
hit-5.dbSNP.sav: 5970
hit-6.dbSNP.sav: 7215
hit-7.dbSNP.sav: 8368
hit-8.dbSNP.sav: 9410
hit-9.dbSNP.sav: 10279
hit-10.dbSNP.sav: 11019
hit-11.dbSNP.sav: 11733
hit-12.dbSNP.sav: 12302
hit-13.dbSNP.sav: 12844
hit-14.dbSNP.sav: 13302
hit-15.dbSNP.sav: 13653
hit-16.dbSNP.sav: 13984
hit-17.dbSNP.sav: 14270
hit-18.dbSNP.sav: 14450
hit-19.dbSNP.sav: 14637
hit-20.dbSNP.sav: 14807
hit-21.dbSNP.sav: 14969
hit-22.dbSNP.sav: 15072
hit-23.dbSNP.sav: 15186
hit-24.dbSNP.sav: 15260
hit-25.dbSNP.sav: 15329
hit-26.dbSNP.sav: 15487
hit-27.dbSNP.sav: 15576
hit-28.dbSNP.sav: 15654
hit-29.dbSNP.sav: 15702
hit-30.dbSNP.sav: 15762
hit-31.dbSNP.sav: 15801
hit-32.dbSNP.sav: 15839
hit-33.dbSNP.sav: 15901





VENN LINES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbsnp

HIT X NOT hit 33
-----------------

hit-1-dbsnp-NOT-hit-33-dbsnp: 2678
hit-3-dbsnp-NOT-hit-33-dbsnp: 2218
hit-4-dbsnp-NOT-hit-33-dbsnp: 2498
hit-5-dbsnp-NOT-hit-33-dbsnp: 2498
hit-6-dbsnp-NOT-hit-33-dbsnp: 2693
hit-7-dbsnp-NOT-hit-33-dbsnp: 2762
hit-8-dbsnp-NOT-hit-33-dbsnp: 2801
hit-9-dbsnp-NOT-hit-33-dbsnp: 2762
hit-10-dbsnp-NOT-hit-33-dbsnp: 2695
hit-11-dbsnp-NOT-hit-33-dbsnp: 2653
hit-12-dbsnp-NOT-hit-33-dbsnp: 2596
hit-13-dbsnp-NOT-hit-33-dbsnp: 2520
hit-14-dbsnp-NOT-hit-33-dbsnp: 2481
hit-15-dbsnp-NOT-hit-33-dbsnp: 2360
hit-16-dbsnp-NOT-hit-33-dbsnp: 2266
hit-17-dbsnp-NOT-hit-33-dbsnp: 2177
hit-18-dbsnp-NOT-hit-33-dbsnp: 2067
hit-19-dbsnp-NOT-hit-33-dbsnp: 1941
hit-20-dbsnp-NOT-hit-33-dbsnp: 1824
hit-21-dbsnp-NOT-hit-33-dbsnp: 1749
hit-22-dbsnp-NOT-hit-33-dbsnp: 1628
hit-23-dbsnp-NOT-hit-33-dbsnp: 1511
hit-24-dbsnp-NOT-hit-33-dbsnp: 1375
hit-25-dbsnp-NOT-hit-33-dbsnp: 1240
hit-26-dbsnp-NOT-hit-33-dbsnp: 1163
hit-27-dbsnp-NOT-hit-33-dbsnp: 1067
hit-28-dbsnp-NOT-hit-33-dbsnp: 949
hit-29-dbsnp-NOT-hit-33-dbsnp: 796
hit-30-dbsnp-NOT-hit-33-dbsnp: 653
hit-31-dbsnp-NOT-hit-33-dbsnp: 472
hit-32-dbsnp-NOT-hit-33-dbsnp: 282




HIT X AND hit 33
-----------------

hit-33-dbsnp-AND-hit-1-dbsnp: 2720
hit-33-dbsnp-AND-hit-3-dbsnp: 2547
hit-33-dbsnp-AND-hit-4-dbsnp: 3472
hit-33-dbsnp-AND-hit-5-dbsnp: 3472
hit-33-dbsnp-AND-hit-6-dbsnp: 4522
hit-33-dbsnp-AND-hit-7-dbsnp: 5606
hit-33-dbsnp-AND-hit-8-dbsnp: 6609
hit-33-dbsnp-AND-hit-9-dbsnp: 7517
hit-33-dbsnp-AND-hit-10-dbsnp: 8324
hit-33-dbsnp-AND-hit-11-dbsnp: 9080
hit-33-dbsnp-AND-hit-12-dbsnp: 9706
hit-33-dbsnp-AND-hit-13-dbsnp: 10324
hit-33-dbsnp-AND-hit-14-dbsnp: 10821
hit-33-dbsnp-AND-hit-15-dbsnp: 11293
hit-33-dbsnp-AND-hit-16-dbsnp: 11718
hit-33-dbsnp-AND-hit-17-dbsnp: 12093
hit-33-dbsnp-AND-hit-18-dbsnp: 12383
hit-33-dbsnp-AND-hit-19-dbsnp: 12696
hit-33-dbsnp-AND-hit-20-dbsnp: 12983
hit-33-dbsnp-AND-hit-21-dbsnp: 13220
hit-33-dbsnp-AND-hit-22-dbsnp: 13444
hit-33-dbsnp-AND-hit-23-dbsnp: 13675
hit-33-dbsnp-AND-hit-24-dbsnp: 13885
hit-33-dbsnp-AND-hit-25-dbsnp: 14089
hit-33-dbsnp-AND-hit-26-dbsnp: 14324
hit-33-dbsnp-AND-hit-27-dbsnp: 14509
hit-33-dbsnp-AND-hit-28-dbsnp: 14705
hit-33-dbsnp-AND-hit-29-dbsnp: 14906
hit-33-dbsnp-AND-hit-30-dbsnp: 15109
hit-33-dbsnp-AND-hit-31-dbsnp: 15329
hit-33-dbsnp-AND-hit-32-dbsnp: 15557
hit-33-dbsnp-AND-hit-33-dbsnp: 15901




HIT 33 NOT hit X
----------------

hit-33-dbsnp-NOT-hit-1-dbsnp: 13181
hit-33-dbsnp-NOT-hit-3-dbsnp: 13354
hit-33-dbsnp-NOT-hit-4-dbsnp: 12429
hit-33-dbsnp-NOT-hit-5-dbsnp: 12429
hit-33-dbsnp-NOT-hit-6-dbsnp: 11379
hit-33-dbsnp-NOT-hit-7-dbsnp: 10295
hit-33-dbsnp-NOT-hit-8-dbsnp: 9292
hit-33-dbsnp-NOT-hit-9-dbsnp: 8384
hit-33-dbsnp-NOT-hit-10-dbsnp: 7577
hit-33-dbsnp-NOT-hit-11-dbsnp: 6821
hit-33-dbsnp-NOT-hit-12-dbsnp: 6195
hit-33-dbsnp-NOT-hit-13-dbsnp: 5577
hit-33-dbsnp-NOT-hit-14-dbsnp: 5080
hit-33-dbsnp-NOT-hit-15-dbsnp: 4608
hit-33-dbsnp-NOT-hit-16-dbsnp: 4183
hit-33-dbsnp-NOT-hit-17-dbsnp: 3808
hit-33-dbsnp-NOT-hit-18-dbsnp: 3518
hit-33-dbsnp-NOT-hit-19-dbsnp: 3205
hit-33-dbsnp-NOT-hit-20-dbsnp: 2918
hit-33-dbsnp-NOT-hit-21-dbsnp: 2681
hit-33-dbsnp-NOT-hit-22-dbsnp: 2457
hit-33-dbsnp-NOT-hit-23-dbsnp: 2226
hit-33-dbsnp-NOT-hit-24-dbsnp: 2016
hit-33-dbsnp-NOT-hit-25-dbsnp: 1812
hit-33-dbsnp-NOT-hit-26-dbsnp: 1577
hit-33-dbsnp-NOT-hit-27-dbsnp: 1392
hit-33-dbsnp-NOT-hit-28-dbsnp: 1196
hit-33-dbsnp-NOT-hit-29-dbsnp: 995
hit-33-dbsnp-NOT-hit-30-dbsnp: 792
hit-33-dbsnp-NOT-hit-31-dbsnp: 572
hit-33-dbsnp-NOT-hit-32-dbsnp: 344
hit-33-dbsnp-NOT-hit-33-dbsnp: 0






3. NON-dbSNP ONLY
-----------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp


ON u03:

screen -S eland-vennsav-non-dbsnp

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp \
--replicates 1-33 \
--loop distributed \
--label eland-venn-non-dbsnpsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.non-dbSNP.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-%REPLICATE%.non-dbSNP.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp \
--querylabel hit-33-non-dbsnp \
--targetlabel hit-%REPLICATE%-non-dbsnp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp/loop-venn-non-dbsnp-sav.out

    
    Run time: 00:07:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:38AM, 6 November 2010
    ****************************************




ORIGINAL NUMBER OF LINES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
[syoung@u03 chr22]$ lines *non-dbSNP*

hit-1.non-dbSNP.sav: 18885
hit-3.non-dbSNP.sav: 13484
hit-4.non-dbSNP.sav: 15235
hit-5.non-dbSNP.sav: 15235
hit-6.non-dbSNP.sav: 15680
hit-7.non-dbSNP.sav: 15712
hit-8.non-dbSNP.sav: 15265
hit-9.non-dbSNP.sav: 14849
hit-10.non-dbSNP.sav: 14310
hit-11.non-dbSNP.sav: 13684
hit-12.non-dbSNP.sav: 13036
hit-13.non-dbSNP.sav: 12404
hit-14.non-dbSNP.sav: 11783
hit-15.non-dbSNP.sav: 11173
hit-16.non-dbSNP.sav: 10539
hit-17.non-dbSNP.sav: 10016
hit-18.non-dbSNP.sav: 9404
hit-19.non-dbSNP.sav: 8961
hit-20.non-dbSNP.sav: 8530
hit-21.non-dbSNP.sav: 8175
hit-22.non-dbSNP.sav: 7767
hit-23.non-dbSNP.sav: 7424
hit-24.non-dbSNP.sav: 7000
hit-25.non-dbSNP.sav: 6600
hit-26.non-dbSNP.sav: 6327
hit-27.non-dbSNP.sav: 6079
hit-28.non-dbSNP.sav: 5759
hit-29.non-dbSNP.sav: 5518
hit-30.non-dbSNP.sav: 5237
hit-31.non-dbSNP.sav: 5014
hit-32.non-dbSNP.sav: 4779
hit-33.non-dbSNP.sav: 4566






VENN LINES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-non-dbsnp
lines *

hit X NOT hit 33
----------------

hit-1-non-dbsnp-NOT-hit-33-non-dbsnp: 18042
hit-3-non-dbsnp-NOT-hit-33-non-dbsnp: 12700
hit-4-non-dbsnp-NOT-hit-33-non-dbsnp: 14303
hit-5-non-dbsnp-NOT-hit-33-non-dbsnp: 14303
hit-6-non-dbsnp-NOT-hit-33-non-dbsnp: 14568
hit-7-non-dbsnp-NOT-hit-33-non-dbsnp: 14357
hit-8-non-dbsnp-NOT-hit-33-non-dbsnp: 13784
hit-9-non-dbsnp-NOT-hit-33-non-dbsnp: 13206
hit-10-non-dbsnp-NOT-hit-33-non-dbsnp: 12541
hit-11-non-dbsnp-NOT-hit-33-non-dbsnp: 11804
hit-12-non-dbsnp-NOT-hit-33-non-dbsnp: 11049
hit-13-non-dbsnp-NOT-hit-33-non-dbsnp: 10295
hit-14-non-dbsnp-NOT-hit-33-non-dbsnp: 9577
hit-15-non-dbsnp-NOT-hit-33-non-dbsnp: 8873
hit-16-non-dbsnp-NOT-hit-33-non-dbsnp: 8149
hit-17-non-dbsnp-NOT-hit-33-non-dbsnp: 7547
hit-18-non-dbsnp-NOT-hit-33-non-dbsnp: 6851
hit-19-non-dbsnp-NOT-hit-33-non-dbsnp: 6297
hit-20-non-dbsnp-NOT-hit-33-non-dbsnp: 5786
hit-21-non-dbsnp-NOT-hit-33-non-dbsnp: 5362
hit-22-non-dbsnp-NOT-hit-33-non-dbsnp: 4828
hit-23-non-dbsnp-NOT-hit-33-non-dbsnp: 4371
hit-24-non-dbsnp-NOT-hit-33-non-dbsnp: 3869
hit-25-non-dbsnp-NOT-hit-33-non-dbsnp: 3360
hit-26-non-dbsnp-NOT-hit-33-non-dbsnp: 2979
hit-27-non-dbsnp-NOT-hit-33-non-dbsnp: 2584
hit-28-non-dbsnp-NOT-hit-33-non-dbsnp: 2187
hit-29-non-dbsnp-NOT-hit-33-non-dbsnp: 1810
hit-30-non-dbsnp-NOT-hit-33-non-dbsnp: 1393
hit-31-non-dbsnp-NOT-hit-33-non-dbsnp: 1010
hit-32-non-dbsnp-NOT-hit-33-non-dbsnp: 561
hit-33-non-dbsnp-NOT-hit-33-non-dbsnp: 0




hit X AND hit 33
----------------


hit-33-non-dbsnp-AND-hit-1-non-dbsnp: 843
hit-33-non-dbsnp-AND-hit-3-non-dbsnp: 784
hit-33-non-dbsnp-AND-hit-4-non-dbsnp: 932
hit-33-non-dbsnp-AND-hit-5-non-dbsnp: 932
hit-33-non-dbsnp-AND-hit-6-non-dbsnp: 1112
hit-33-non-dbsnp-AND-hit-7-non-dbsnp: 1355
hit-33-non-dbsnp-AND-hit-8-non-dbsnp: 1481
hit-33-non-dbsnp-AND-hit-9-non-dbsnp: 1643
hit-33-non-dbsnp-AND-hit-10-non-dbsnp: 1769
hit-33-non-dbsnp-AND-hit-11-non-dbsnp: 1880
hit-33-non-dbsnp-AND-hit-12-non-dbsnp: 1987
hit-33-non-dbsnp-AND-hit-13-non-dbsnp: 2109
hit-33-non-dbsnp-AND-hit-14-non-dbsnp: 2206
hit-33-non-dbsnp-AND-hit-15-non-dbsnp: 2300
hit-33-non-dbsnp-AND-hit-16-non-dbsnp: 2390
hit-33-non-dbsnp-AND-hit-17-non-dbsnp: 2469
hit-33-non-dbsnp-AND-hit-18-non-dbsnp: 2553
hit-33-non-dbsnp-AND-hit-19-non-dbsnp: 2664
hit-33-non-dbsnp-AND-hit-20-non-dbsnp: 2744
hit-33-non-dbsnp-AND-hit-21-non-dbsnp: 2813
hit-33-non-dbsnp-AND-hit-22-non-dbsnp: 2939
hit-33-non-dbsnp-AND-hit-23-non-dbsnp: 3053
hit-33-non-dbsnp-AND-hit-24-non-dbsnp: 3131
hit-33-non-dbsnp-AND-hit-25-non-dbsnp: 3240
hit-33-non-dbsnp-AND-hit-26-non-dbsnp: 3348
hit-33-non-dbsnp-AND-hit-27-non-dbsnp: 3495
hit-33-non-dbsnp-AND-hit-28-non-dbsnp: 3572
hit-33-non-dbsnp-AND-hit-29-non-dbsnp: 3708
hit-33-non-dbsnp-AND-hit-30-non-dbsnp: 3844
hit-33-non-dbsnp-AND-hit-31-non-dbsnp: 4004
hit-33-non-dbsnp-AND-hit-32-non-dbsnp: 4218
hit-33-non-dbsnp-AND-hit-33-non-dbsnp: 4566




hit 33 NOT hit X
----------------

hit-33-non-dbsnp-NOT-hit-1-non-dbsnp: 3723
hit-33-non-dbsnp-NOT-hit-3-non-dbsnp: 3782
hit-33-non-dbsnp-NOT-hit-4-non-dbsnp: 3634
hit-33-non-dbsnp-NOT-hit-5-non-dbsnp: 3634
hit-33-non-dbsnp-NOT-hit-6-non-dbsnp: 3454
hit-33-non-dbsnp-NOT-hit-7-non-dbsnp: 3211
hit-33-non-dbsnp-NOT-hit-8-non-dbsnp: 3085
hit-33-non-dbsnp-NOT-hit-9-non-dbsnp: 2923
hit-33-non-dbsnp-NOT-hit-10-non-dbsnp: 2797
hit-33-non-dbsnp-NOT-hit-11-non-dbsnp: 2686
hit-33-non-dbsnp-NOT-hit-12-non-dbsnp: 2579
hit-33-non-dbsnp-NOT-hit-13-non-dbsnp: 2457
hit-33-non-dbsnp-NOT-hit-14-non-dbsnp: 2360
hit-33-non-dbsnp-NOT-hit-15-non-dbsnp: 2266
hit-33-non-dbsnp-NOT-hit-16-non-dbsnp: 2176
hit-33-non-dbsnp-NOT-hit-17-non-dbsnp: 2097
hit-33-non-dbsnp-NOT-hit-18-non-dbsnp: 2013
hit-33-non-dbsnp-NOT-hit-19-non-dbsnp: 1902
hit-33-non-dbsnp-NOT-hit-20-non-dbsnp: 1822
hit-33-non-dbsnp-NOT-hit-21-non-dbsnp: 1753
hit-33-non-dbsnp-NOT-hit-22-non-dbsnp: 1627
hit-33-non-dbsnp-NOT-hit-23-non-dbsnp: 1513
hit-33-non-dbsnp-NOT-hit-24-non-dbsnp: 1435
hit-33-non-dbsnp-NOT-hit-25-non-dbsnp: 1326
hit-33-non-dbsnp-NOT-hit-26-non-dbsnp: 1218
hit-33-non-dbsnp-NOT-hit-27-non-dbsnp: 1071
hit-33-non-dbsnp-NOT-hit-28-non-dbsnp: 994
hit-33-non-dbsnp-NOT-hit-29-non-dbsnp: 858
hit-33-non-dbsnp-NOT-hit-30-non-dbsnp: 722
hit-33-non-dbsnp-NOT-hit-31-non-dbsnp: 562
hit-33-non-dbsnp-NOT-hit-32-non-dbsnp: 348
hit-33-non-dbsnp-NOT-hit-33-non-dbsnp: 0




PREVIOUS ELAND RESULTS:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ls -al *sav

    -rw-rw-rw- 1 syoung root 2971027 Oct 27 14:49 hit-1.sav
    -rw-rw-rw- 1 syoung root 2461296 Oct 27 05:19 hit-3.sav
    -rw-rw-rw- 1 syoung root 2999457 Oct 27 05:52 hit-4.sav
    -rw-rw-rw- 1 syoung root 2999457 Oct 27 05:52 hit-5.sav
    -rw-rw-rw- 1 syoung root 3365448 Oct 27 06:04 hit-6.sav
    -rw-rw-rw- 1 syoung root 3639572 Oct 27 06:11 hit-7.sav
    -rw-rw-rw- 1 syoung root 3817133 Oct 27 06:15 hit-8.sav
    -rw-rw-rw- 1 syoung root 3953000 Oct 27 06:18 hit-9.sav
    -rw-rw-rw- 1 syoung root 4029762 Oct 27 06:19 hit-10.sav
    -rw-rw-rw- 1 syoung root 4076685 Oct 27 06:31 hit-11.sav
    -rw-rw-rw- 1 syoung root 4082162 Oct 27 06:30 hit-12.sav
    -rw-rw-rw- 1 syoung root 4101417 Oct 27 06:30 hit-13.sav
    -rw-rw-rw- 1 syoung root 4082584 Oct 27 06:29 hit-14.sav
    -rw-rw-rw- 1 syoung root 4047891 Oct 27 09:17 hit-15.sav
    -rw-rw-rw- 1 syoung root 3993105 Oct 27 09:14 hit-16.sav
    -rw-rw-rw- 1 syoung root 3961442 Oct 27 09:11 hit-17.sav
    -rw-rw-rw- 1 syoung root 3887990 Oct 27 09:06 hit-18.sav
    -rw-rw-rw- 1 syoung root 3849241 Oct 27 09:03 hit-19.sav
    -rw-rw-rw- 1 syoung root 3810648 Oct 27 09:01 hit-20.sav
    -rw-rw-rw- 1 syoung root 3784737 Oct 27 08:58 hit-21.sav
    -rw-rw-rw- 1 syoung root 3731077 Oct 27 08:53 hit-22.sav
    -rw-rw-rw- 1 syoung root 3695723 Oct 27 06:07 hit-23.sav
    -rw-rw-rw- 1 syoung root 3630856 Oct 27 06:06 hit-24.sav
    -rw-rw-rw- 1 syoung root 3572375 Oct 27 06:04 hit-25.sav
    -rw-rw-rw- 1 syoung root 3558462 Oct 27 06:04 hit-26.sav
    -rw-rw-rw- 1 syoung root 3541431 Oct 27 06:03 hit-27.sav
    -rw-rw-rw- 1 syoung root 3513592 Oct 27 06:01 hit-28.sav
    -rw-rw-rw- 1 syoung root 3483657 Oct 27 06:00 hit-29.sav
    -rw-rw-rw- 1 syoung root 3455017 Oct 27 05:57 hit-30.sav
    -rw-rw-rw- 1 syoung root 3430026 Oct 27 05:03 hit-31.sav
    -rw-rw-rw- 1 syoung root 3405596 Oct 27 05:01 hit-32.sav
    -rw-rw-rw- 1 syoung root 3390775 Oct 27 05:00 hit-33.sav


ls -al *snp

    -rw-rw-r-- 1 syoung root 1558623 Oct 21 12:51 hit-1.snp
    -rw-rw-r-- 1 syoung root 1406106 Oct 21 12:51 hit-3.snp
    -rw-rw-r-- 1 syoung root 1766831 Oct 21 12:51 hit-4.snp
    -rw-rw-r-- 1 syoung root 1766831 Oct 21 12:51 hit-5.snp
    -rw-rw-r-- 1 syoung root 2025766 Oct 21 12:51 hit-6.snp
    -rw-rw-r-- 1 syoung root 2228059 Oct 21 12:51 hit-7.snp
    -rw-rw-r-- 1 syoung root 2361291 Oct 21 12:51 hit-8.snp
    -rw-rw-r-- 1 syoung root 2465950 Oct 21 12:51 hit-9.snp
    -rw-rw-r-- 1 syoung root 2526065 Oct 21 12:51 hit-10.snp
    -rw-rw-r-- 1 syoung root 2558285 Oct 21 12:51 hit-11.snp
    -rw-rw-r-- 1 syoung root 2574577 Oct 21 12:51 hit-12.snp
    -rw-rw-r-- 1 syoung root 2581167 Oct 21 12:51 hit-13.snp
    -rw-rw-r-- 1 syoung root 2569012 Oct 21 12:51 hit-14.snp
    -rw-rw-r-- 1 syoung root 2543482 Oct 21 12:51 hit-15.snp
    -rw-rw-r-- 1 syoung root 2505558 Oct 21 12:51 hit-16.snp
    -rw-rw-r-- 1 syoung root 2481172 Oct 21 12:51 hit-17.snp
    -rw-rw-r-- 1 syoung root 2425856 Oct 21 12:51 hit-18.snp
    -rw-rw-r-- 1 syoung root 2398419 Oct 21 12:51 hit-19.snp
    -rw-rw-r-- 1 syoung root 2367421 Oct 21 12:51 hit-20.snp
    -rw-rw-r-- 1 syoung root 2351475 Oct 21 12:51 hit-21.snp
    -rw-rw-r-- 1 syoung root 2317096 Oct 21 12:51 hit-22.snp
    -rw-rw-r-- 1 syoung root 2292648 Oct 21 12:51 hit-23.snp
    -rw-rw-r-- 1 syoung root 2247855 Oct 21 12:51 hit-24.snp
    -rw-rw-r-- 1 syoung root 2206548 Oct 21 12:51 hit-25.snp
    -rw-rw-r-- 1 syoung root 2202167 Oct 21 12:51 hit-26.snp
    -rw-rw-r-- 1 syoung root 2192724 Oct 21 12:51 hit-27.snp
    -rw-rw-r-- 1 syoung root 2171684 Oct 21 12:51 hit-28.snp
    -rw-rw-r-- 1 syoung root 2153289 Oct 21 12:51 hit-29.snp
    -rw-rw-r-- 1 syoung root 2136618 Oct 21 12:51 hit-30.snp
    -rw-rw-r-- 1 syoung root 2123681 Oct 21 12:51 hit-31.snp
    -rw-rw-r-- 1 syoung root 2110788 Oct 21 12:51 hit-32.snp
    -rw-rw-r-- 1 syoung root 2101703 Oct 21 12:51 hit-33.snp



NOTES
-----

PARSE *sav FILES TO SEPARATE OUT dbSNP AND NON-dbSNP ENTRIES


SAVDIR=/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
cd $SAVDIR
FILES="*"
for FILE in $FILES;
do
    if [ -f `pwd`/$FILE ]; then

        SAVFILE=$(echo $FILE | egrep "^hit-[0-9XY]+.sav" ); 
        if [ "$SAVFILE" != "" ]; then
    
            NUMBER=${SAVFILE/hit-/};
            NUMBER=${NUMBER/.sav/};
            echo $NUMBER;

            grep rs \
            hit-$NUMBER.sav \
            > hit-$NUMBER.dbSNP.sav
            
            grep -v rs \
            hit-$NUMBER.sav \
            > hit-$NUMBER.non-dbSNP.sav
        fi;
    fi;
done;




OUTPUT FILES:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22
ll *33*

    -rw-rw-r-- 1 syoung root 2.3M Nov  6 02:17 hit-33.dbSNP.sav
    -rw-rw-r-- 1 syoung root 979K Nov  6 02:17 hit-33.non-dbSNP.sav
    -rw-rw-rw- 1 syoung root 3.3M Oct 27 05:00 hit-33.sav
    -rw-rw-r-- 1 syoung root 2.1M Oct 21 12:51 hit-33.snp
    -rw-r--r-- 1 syoung root 3.4G Nov  4 13:36 merged.bam-33
    -rw-rw-rw- 1 syoung root 109K Nov  5 00:41 merged.bam-33.bai
    -rw-rw-r-- 1 syoung root 109K Nov  5 00:37 merged.bam-33.bai2
    -rw-rw-rw- 1 syoung root   18 Nov  5 01:04 merged.bam-33.coverage
    -rw-r--r-- 1 syoung root  24M Oct 27 01:30 snp130-chr22-33.dbl

TEST SINGLE FILE

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22

grep rs \
hit-33.sav \
> hit-33.dbSNP.sav

grep -v rs \
hit-33.sav \
> hit-33.non-dbSNP.sav

head -n 10 hit-33*sav | cut -f 1,2,11

    ==> hit-33.dbSNP.sav <==
    chr22   16050612        rs2186463
    chr22   16053659        rs915675
    chr22   16054740        rs2844885
    chr22   16055003        rs2844886
    chr22   16055396        rs71256249
    chr22   16055570        rs1359599
    chr22   16055913        rs6518433
    chr22   16055942        rs72613661
    chr22   16058852        rs2843241
    chr22   16060239        rs2495299
    
    ==> hit-33.non-dbSNP.sav <==
    chr22   16074772
    chr22   16086163
    chr22   16086164
    chr22   16095936
    chr22   16133514
    chr22   16133515
    chr22   16156491
    chr22   16157967
    chr22   16173235
    chr22   16217029
    
    ==> hit-33.sav <==
    chr22   16050612        rs2186463
    chr22   16053659        rs915675
    chr22   16054740        rs2844885
    chr22   16055003        rs2844886
    chr22   16055396        rs71256249
    chr22   16055570        rs1359599
    chr22   16055913        rs6518433
    chr22   16055942        rs72613661
    chr22   16058852        rs2843241
    chr22   16060239        rs2495299





mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbSNP
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbSNP

ON u03:

screen -S eland-venn-dbSNPsav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbSNP \
--replicates 2-33 \
--loop distributed \
--label eland-venn-dbSNPsav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.sav \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-%REPLICATE%.sav \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/venn-dbSNP \
--querylabel hit-33-snp \
--targetlabel hit-%REPLICATE%-snp \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/loop-venn-dbSNPsav.out






</entry>

<entry [Fri Nov  5 08:53:03 EDT 2010] COMPARE hit.snp AND hit.sam FILE SIZES>


            hit.snp     hit.sam
ELAND       
MAQ         1.1 MB
BOWTIE (fr) 5.0 MB
BOWTIE (rf) 5.0 MB
NOVOALIGN   1.4 MB   



hit.snp FILES
*************


MAQ
---
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.snp

-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 1/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 2/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 3/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 4/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 5/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 6/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 7/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 8/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 9/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 10/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 11/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 12/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 13/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 14/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 15/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 16/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 17/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 18/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 19/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 20/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 21/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 22/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 23/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 24/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 25/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 26/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 27/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 28/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 29/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 30/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 31/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.1M Nov  4 11:21 32/chr22/hit.snp
-rw-rw-rw- 1 syoung root 420K Nov  4 11:18 33/chr22/hit.snp


BOWTIE
------
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/hit.snp

-rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 17/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 18/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 12:27 19/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 20/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 21/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 22/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 23/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 24/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 25/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 26/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 27/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 28/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 29/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 12:28 30/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 31/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 32/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 33/chr22/hit.snp



BOWTIE (--fr)
------------
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.snp
    
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:57 1/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 2/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 19:02 3/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 4/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:03 5/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 6/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 19:04 7/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:59 8/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:47 9/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 10/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:49 11/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 12/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 13/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:48 14/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 18:53 15/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:05 16/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 17/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 18/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 19:01 19/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:05 20/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 21/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 22/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 23/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 24/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:55 25/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 26/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 27/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:03 28/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 29/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.7M Nov  5 19:01 30/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 31/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 32/chr22/hit.snp
-rw-rw-rw- 1 syoung root 4.8M Nov  5 18:58 33/chr22/hit.snp


    # bowtie-rf:
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp



NOVOALIGN
---------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/hit.snp


-rw-rw-rw- 1 syoung root 1.4M Nov  4 16:23 1/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 2/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 3/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 4/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 5/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 6/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:26 7/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 8/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 9/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 10/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 11/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:29 12/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:22 13/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 14/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 15/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 16/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 17/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 18/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 19/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:44 20/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 21/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 22/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 23/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 24/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:44 25/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 26/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 27/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:47 28/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 29/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 30/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 31/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:45 32/chr22/hit.snp
-rw-rw-rw- 1 syoung root 1.4M Nov  5 06:42 33/chr22/hit.snp



ELAND
-----

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ll */chr22/hit.snp





hit.sam FILES
*************


MAQ
---
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.snp


BOWTIE (rf)
-----------

COMMANDS USED FOR BOWTIE -rf RUN:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1
em bowtie-autochr22-1.out
 
/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--sam \
--threads 1 \
--rf \
--al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/$LSB_JOBINDEX/aligned.txt \
--un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/$LSB_JOBINDEX/unaligned.txt \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
-1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/$LSB_JOBINDEX/bowtie-autochr22-1_1.$LSB_JOBINDEX.txt \
-2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/$LSB_JOBINDEX/bowtie-autochr22-1_2.$LSB_JOBINDEX.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/$LSB_JOBINDEX/out.sam



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf
ll */chr22/hit.sam

-rw-rw-r-- 1 syoung root 154M Nov  5 13:14 1/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:19 2/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:23 3/chr22/hit.sam
-rw-rw-r-- 1 syoung root 908M Nov  5 13:25 4/chr22/hit.sam
-rw-rw-r-- 1 syoung root 925M Nov  5 13:25 5/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:25 6/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:26 7/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:26 8/chr22/hit.sam
-rw-rw-r-- 1 syoung root 6.1G Nov  5 13:28 9/chr22/hit.sam
-rw-rw-r-- 1 syoung root 886M Nov  5 13:15 10/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:15 11/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:15 12/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:16 13/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:16 14/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:17 15/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:17 16/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:17 17/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:18 18/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:18 19/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:19 20/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:19 21/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:20 22/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:20 23/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:20 24/chr22/hit.sam
-rw-rw-r-- 1 syoung root 889M Nov  5 13:21 25/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:21 26/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:22 27/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:22 28/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:22 29/chr22/hit.sam
-rw-rw-r-- 1 syoung root 888M Nov  5 13:23 30/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:23 31/chr22/hit.sam
-rw-rw-r-- 1 syoung root 887M Nov  5 13:24 32/chr22/hit.sam
-rw-rw-r-- 1 syoung root 889M Nov  5 13:24 33/chr22/hit.sam




BOWTIE (--fr)
-------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1
emacs bowtie-200bp-chr22-1.out

    bowtie command:
    
    time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
    --sam \
    --threads 1 \
     --fr  \
    --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/$LSB_JOBINDEX/aligned.txt \
    --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/$LSB_JOBINDEX/unaligned.txt \
    /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
    -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/$LSB_JOBINDEX/bowtie-200bp-chr22-1_1.$LSB_JOBINDEX.txt \
    -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/$LSB_JOBINDEX/bowtie-200bp-chr22-1_2.$LSB_JOBINDEX.txt \
    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/$LSB_JOBINDEX/out.sam


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.sam
    
    -rw-rw-rw- 1 syoung root 886M Nov  5 18:57 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:44 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:58 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:52 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:43 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:48 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:57 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:53 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:52 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:51 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:56 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:53 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:54 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:55 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 889M Nov  5 18:49 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:56 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:54 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:55 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:52 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:54 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 889M Nov  5 18:51 33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:56 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:57 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:58 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:52 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:41 9/chr22/hit.sam



BOWTIE (default)
----------------


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10
emacs bowtie-200bp-chr22-10.out

    bowtie command:
    
    time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
    --sam \
    --threads 1 \
    --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/chr22/$LSB_JOBINDEX/aligned.txt \
    --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/chr22/$LSB_JOBINDEX/unaligned.txt \
    /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
    -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/$LSB_JOBINDEX/bowtie-200bp-chr22-10_1.$LSB_JOBINDEX.txt \
    -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/$LSB_JOBINDEX/bowtie-200bp-chr22-10_2.$LSB_JOBINDEX.txt \
    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10/chr22/$LSB_JOBINDEX/out.sam



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.sam


-rw-rw-rw- 1 syoung root 886M Nov  4 16:25 10/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:23 11/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:28 12/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:26 13/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:26 14/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:28 15/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:25 16/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:06 17/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:13 18/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:16 19/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 14:33 1/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:17 20/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:19 21/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:13 22/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:11 23/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:13 24/chr22/hit.sam
-rw-rw-rw- 1 syoung root 889M Nov  5 11:18 25/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:18 26/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:20 27/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:10 28/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:17 29/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:24 2/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  5 11:19 30/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:17 31/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  5 11:16 32/chr22/hit.sam
-rw-rw-rw- 1 syoung root 889M Nov  5 11:19 33/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:27 3/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:27 4/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:24 5/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:26 6/chr22/hit.sam
-rw-rw-rw- 1 syoung root 887M Nov  4 16:27 7/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:28 8/chr22/hit.sam
-rw-rw-rw- 1 syoung root 888M Nov  4 16:17 9/chr22/hit.sam



NOVOALIGN
---------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/hit.sam

-rw-rw-rw- 1 syoung root 874M Nov  4 16:17 1/chr22/hit.sam
-rw-rw-rw- 1 syoung root 869M Nov  5 06:14 2/chr22/hit.sam
-rw-rw-rw- 1 syoung root 874M Nov  5 06:19 3/chr22/hit.sam
-rw-rw-rw- 1 syoung root 871M Nov  5 06:16 4/chr22/hit.sam
-rw-rw-rw- 1 syoung root 870M Nov  5 06:19 5/chr22/hit.sam
-rw-rw-rw- 1 syoung root 860M Nov  5 06:17 6/chr22/hit.sam
-rw-rw-rw- 1 syoung root 873M Nov  5 06:15 7/chr22/hit.sam
-rw-rw-rw- 1 syoung root 876M Nov  5 06:17 8/chr22/hit.sam
-rw-rw-rw- 1 syoung root 860M Nov  5 06:18 9/chr22/hit.sam
-rw-rw-rw- 1 syoung root 864M Nov  5 06:19 10/chr22/hit.sam
-rw-rw-rw- 1 syoung root 873M Nov  5 06:17 11/chr22/hit.sam
-rw-rw-rw- 1 syoung root 875M Nov  5 06:19 12/chr22/hit.sam
-rw-rw-rw- 1 syoung root 876M Nov  5 06:12 13/chr22/hit.sam
-rw-rw-rw- 1 syoung root 858M Nov  5 06:17 14/chr22/hit.sam
-rw-rw-rw- 1 syoung root 875M Nov  5 06:19 15/chr22/hit.sam
-rw-rw-rw- 1 syoung root 875M Nov  5 06:17 16/chr22/hit.sam
-rw-rw-rw- 1 syoung root 863M Nov  5 06:35 17/chr22/hit.sam
-rw-rw-rw- 1 syoung root 842M Nov  5 06:34 18/chr22/hit.sam
-rw-rw-rw- 1 syoung root 837M Nov  5 06:34 19/chr22/hit.sam
-rw-rw-rw- 1 syoung root 864M Nov  5 06:38 20/chr22/hit.sam
-rw-rw-rw- 1 syoung root 868M Nov  5 06:43 21/chr22/hit.sam
-rw-rw-rw- 1 syoung root 863M Nov  5 06:45 22/chr22/hit.sam
-rw-rw-rw- 1 syoung root 869M Nov  5 06:44 23/chr22/hit.sam
-rw-rw-rw- 1 syoung root 875M Nov  5 06:42 24/chr22/hit.sam
-rw-rw-rw- 1 syoung root 873M Nov  5 06:39 25/chr22/hit.sam
-rw-rw-rw- 1 syoung root 877M Nov  5 06:45 26/chr22/hit.sam
-rw-rw-rw- 1 syoung root 868M Nov  5 06:45 27/chr22/hit.sam
-rw-rw-rw- 1 syoung root 867M Nov  5 06:39 28/chr22/hit.sam
-rw-rw-rw- 1 syoung root 864M Nov  5 06:42 29/chr22/hit.sam
-rw-rw-rw- 1 syoung root 865M Nov  5 06:44 30/chr22/hit.sam
-rw-rw-rw- 1 syoung root 869M Nov  5 06:45 31/chr22/hit.sam
-rw-rw-rw- 1 syoung root 872M Nov  5 06:39 32/chr22/hit.sam
-rw-rw-rw- 1 syoung root 852M Nov  5 06:36 33/chr22/hit.sam


ELAND
-----

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ll */chr22/hit.sam


-rw-rw-rw- 1 syoung root 397M Oct 13 14:43 10/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 15:02 11/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 15:21 12/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 15:42 13/chr22/hit.sam
-rw-rw-rw- 1 syoung root 398M Oct 13 16:05 14/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 16:30 15/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 16:57 16/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 17:25 17/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 17:56 18/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 18:29 19/chr22/hit.sam
-rw-rw-r-- 1 syoung root 596M Oct 13 13:41 1/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 19:04 20/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 19:40 21/chr22/hit.sam
-rw-rw-rw- 1 syoung root 396M Oct 13 20:20 22/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 21:01 23/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 21:44 24/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 22:29 25/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 23:17 26/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 00:07 27/chr22/hit.sam
-rw-rw-rw- 1 syoung root 398M Oct 14 00:57 28/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 01:50 29/chr22/hit.sam
-rw-rw-r-- 1 syoung root 397M Oct 13 13:42 2/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 02:45 30/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 03:42 31/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 04:42 32/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 14 05:45 33/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 13:43 3/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 13:48 4/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 13:48 5/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 13:55 6/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 14:04 7/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 14:15 8/chr22/hit.sam
-rw-rw-rw- 1 syoung root 397M Oct 13 14:28 9/chr22/hit.sam





NOTES
-----


COPY BOWTIE (rf) hit.sam FILES FROM /ngs/bioinfo TO /scratch
------------------------------------------------------------


RENAME SCRATCH bowtie TO bowtie-rf:

cd /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22
mv bowtie bowtie-rf



COPY hit.sam FILES:

screen -S cp-sam

NGSDIR=/ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie-rf
SCRATCHDIR=/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf
mkdir -p $SCRATCHDIR
cd $NGSDIR
DIRS="*"
echo $DIRS
for DIR in $DIRS;
do
    if [ -d `pwd`/$DIR ]; then

        FILEDIR=$(echo $DIR | egrep "^[0-9]+" ); 

        if [ "$FILEDIR" != "" ]; then
    
            echo $FILEDIR
            echo "mkdir $SCRATCHDIR/$FILEDIR/chr22"
            mkdir -p $SCRATCHDIR/$FILEDIR/chr22
            echo "cp -f $NGSDIR/$FILEDIR/chr22/hit.sam $SCRATCHDIR/$FILEDIR/chr22/hit.sam"
            cp -f $NGSDIR/$FILEDIR/chr22/hit.sam $SCRATCHDIR/$FILEDIR/chr22/hit.sam
        fi;
    fi;
done;




</entry>

<entry [Thu Nov  4 12:29:48 EDT 2010] RERUN BOWTIE chr22 USING '-fr' FLAG>

CONTINUATION OF:
[
Thu Nov  4 12:29:48 EDT 2010
RERUN BOWTIE chr22 WITH DEFAULTS
]

PROBLEM: BOWTIE RUN WITH --rf OPTION ON 3.3 BILLION READS PRODUCED SMALL hit.sam FILE

CONCLUSION: MUST RERUN BOWTIE FLAG WITH 3.3 BILLION READS USING '--fr' FLAG

FIRST RUN DEFAULT FOR COMPARISON. NOW RUN WITH --fr FLAG


ONE ROUND (1-33)
---------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr

ON u04:
screen -S loop-bowtie

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 1-33 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/%REPLICATE% \
--params " --fr " \
--loop parallel \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/%REPLICATE%/bowtie-200bp-chr22-%REPLICATE%.out 

    Run time: 04:38:28
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    7:05PM, 5 November 2010
    ****************************************

    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.snp
    
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:49 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:48 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 18:53 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:05 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 19:01 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:57 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:05 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:55 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:04 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:03 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 19:01 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:02 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:58 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 19:02 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:00 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:03 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 19:01 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 19:04 7/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:59 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 18:47 9/chr22/hit.snp

    # bowtie-rf:
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    #-rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr
ll */chr22/hit.sam
    
    -rw-rw-rw- 1 syoung root 886M Nov  5 18:57 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:44 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:58 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:52 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:43 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:48 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:57 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:53 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:52 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:51 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:56 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:53 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:54 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:55 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 889M Nov  5 18:49 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:56 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:57 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:54 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:55 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:52 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:54 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 889M Nov  5 18:51 33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:56 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:57 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:53 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:58 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:52 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 888M Nov  5 18:41 9/chr22/hit.sam


THIS bowtie-fr ALIGNMENT IS IDENTICAL TO THE DEFAULT bowtie ALIGNMENT:


diff \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/1//aligned_1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22/1/aligned_1.txt 

    <no difference>
    
diff \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1/chr22/hit.sam 
    
    <no difference>




AND bowtie-fr IS TOTALLY DIFFERENT FROM bowtie-rf:


1. BOWTIE RUN WITH --fr HAS MANY MORE HITS THAN WITH --rf

ls -alh /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 887M Nov  5 18:51 hit.sam

ls -alh /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam
    -rw-rw-r-- 1 syoung root 154M Nov  5 13:14 hit.sam


2. THE HITS ARE DIFFERENT


/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn \
--querylabel bowtie-fr \
--targetlabel bowtie-rf 




THIS HUNG ON PEGASUS PROBABLY DUE TO LACK OF MEMORY:

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl --queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam --targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn --querylabel bowtie-fr --targetlabel bowtie-rf
samVenn::Sam.pl    arguments: --queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam --targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn --querylabel bowtie-fr --targetlabel bowtie-rf
Venn::Sam::setOutputfiles    queryonly: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn/bowtie-fr-NOT-bowtie-rf
Venn::Sam::setOutputfiles    targetonly: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn/bowtie-rf-NOT-bowtie-fr
Venn::Sam::setOutputfiles    both: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn/bowtie-fr-AND-bowtie-rf

[1]+  Stopped                 /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl --queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam --targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam --outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/venn --querylabel bowtie-fr --targetlabel bowtie-rf






RERUN LATER...






--fr
----

head /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam

    SRR004823.14378:3:1:253:207#0   99      chr22   16050016        255     36M     =       16050195       215      AGGACTTCAGAAGAGCTGTGCGACCTTGGCCAAGTC    IIIIIIIIIIIIIIDIIIIIIII8IIIII33I,78)    XA:i:1  MD:Z:20A15      NM:i:1
    SRR002304.7863377:1:90:544:448#0        99      chr22   16050031        255     36M     =       1605019197      CTGTGCGACCTTGGCCAAGTCACTTCCCCCTTCAGG    IIIIIIIIIIIIIC4I>(=)III.+4+&(:*//83+    XA:i:2  MD:Z:5A21T8     NM:i:2
    SRR002301.2006530:3:94:327:904#0        99      chr22   16050036        255     36M     =       1605021211      CGACCTTGGCCAAGTCACTTCCTCCTTCAGGAACAT    IIIIIIIIIIIIIIIIIIIID3/;??/<,:002+2A    XA:i:1  MD:Z:0A35       NM:i:1
    SRR006554.5571971:2:259:467:605#0       99      chr22   16050041        255     36M     =       1605022220      TTGGCCAAGTCACTTCCTCCTTCAGGAACATTGCAG    IIIII;3>E?66=EE8/C,A0?+).7+/+-57.+'&    XA:i:0  MD:Z:36NM:i:0
    SRR004850.5452648:4:56:158:1670#0       163     chr22   16050115        255     36M     =       1605028205      GGTCATGCAATCTGGACAACATTCACCTTTAAAAGT    IIAI4IIIIIIIIII3IIAIEIICIII<IC+4-0?,    XA:i:0  MD:Z:36NM:i:0
    SRR004860.9862481:6:98:511:367#0        163     chr22   16050127        255     36M     =       1605031223      TGGACAACATTCACCTTTAAAAGTTTATTGATCTTT    <II6;GI'2E82-E:I499(-4D#I+2?9I,I+I<6    XA:i:0  MD:Z:36NM:i:0
    SRR003870.1056177:4:49:412:676#0        99      chr22   16050128        255     36M     =       1605028194      GGACAACATTCACCTTTAAAAGTTTATTGATTTTTT    II@IIII5IIG>I9C4>3-1+;0E6+A8.(15=?56    XA:i:0  MD:Z:31C4       NM:i:1
    SRR002283.6606116:3:42:881:433#0        99      chr22   16050137        255     36M     =       1605031213      TCACCTTTAAAAGTTTATTGATCTTTTGTGACATGC    IIIIIIIIIBIII7II<GBDGIIII53=3+2@?1.;    XA:i:0  MD:Z:36NM:i:0
    SRR002304.7863377:1:90:544:448#0        147     chr22   16050192        255     36M     =       1605003-197     AGAAACTAAAGGGTCGCAGGCCGGTTTCTGCTAATT    >99E",$97+?/D,III-4<II+DI8DEIIIIIIIH    XA:i:0  MD:Z:36NM:i:0
    SRR004823.14378:3:1:253:207#0   147     chr22   16050195        255     36M     =       16050016       -215     AACTAAAGGGTCGCAGTCCGGTTTCTGCTAATTTCT    5*H'8'1&&#+G&BH(%I=%(II?II=IIIIIIIII    XA:i:1  MD:Z:16G19      NM:i:1



grep SRR002271.923:1:1:772:358#0 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-fr/1/chr22/hit.sam
SRR002271.923:1:1:772:358#0     99      chr22   39613521        255     36M     =       39613697       212      GCAAAGCTGGAGGCATCATGCTACCTGACTTCAAAC    IIIIIIIIIIIIIIIIIIIIIIIIIICIIIII7=I.    XA:i:1  MD:Z:0A35       NM:i:1
SRR002271.923:1:1:772:358#0     147     chr22   39613697        255     36M     =       39613521       -212     AAGAAACGGGGAAAGGATTCCCTATTTAATAAATGG    II>IIIIBIGIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:6A4G24     NM:i:2


--rf
----

head /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam

    SRR002271.923:1:1:772:358#0     99      chr22   39613521        255     36M     =       39613697       212     GCAAAGCTGGAGGCATCATGCTACCTGACTTCAAAC    IIIIIIIIIIIIIIIIIIIIIIIIIICIIIII7=I.  XA:i:1   MD:Z:0A35       NM:i:1
    SRR002271.923:1:1:772:358#0     147     chr22   39613697        255     36M     =       39613521       -212    AAGAAACGGGGAAAGGATTCCCTATTTAATAAATGG    II>IIIIBIGIIIIIIIIIIIIIIIIIIIIIIIIII  XA:i:1   MD:Z:6A4G24     NM:i:2
    SRR002271.1398:1:1:532:128#0    99      chr22   16441194        255     36M     =       16441397       239     GAGTTAGGGAGGATTCCCTCTTTTTCTATTGATAGG    IIIIIIIIIIIIFIIIIIIIIIIIIIIIII,0I/*2  XA:i:1   MD:Z:6C26T2     NM:i:2
    SRR002271.1398:1:1:532:128#0    147     chr22   16441397        255     36M     =       16441194       -239    CTTGGGAGGGTGTATGTGTCAAGGAATTTATCCATT    F+4II77;III1IIIII=IIIIIIIIIIIIIIIIII  XA:i:0   MD:Z:36 NM:i:0
    SRR002271.4568:1:1:621:965#0    99      chr22   32639520        255     36M     =       32639692       208     TAGGAATAACAATATACAGGGAAGGATCAGTTTAAA    IIIIIIIIIIIIIIIIIIIGI;IAI.4:,74<I6CI  XA:i:1   MD:Z:25C10      NM:i:1
    SRR002271.4568:1:1:621:965#0    147     chr22   32639692        255     36M     =       32639520       -208    TAACAATTTCAAATAGTTAAAAACATATGAGAGACA    :II/III<+IIII=III5IIIIIII3IIIIIIIIII  XA:i:0   MD:Z:36 NM:i:0
    SRR002271.4897:1:1:420:124#0    163     chr22   16551290        255     36M     =       16551476       222     TGTTCTGGAATCCTATGTGAGGGACAAACATTCAGA    IIIIIIIIIIIIIIIIIIIEIIII8C9%/+ID%4:)  XA:i:2   MD:Z:8G15A11    NM:i:2
    SRR002271.4897:1:1:420:124#0    83      chr22   16551476        255     36M     =       16551290       -222    AACAGTGTTCTGGAATCCTATGTGAGGGAGAAGCAT    <B%'6I3DI+2;:II;IIIIIIGIIIIIIIIIIIII  XA:i:1   MD:Z:1G1T28A3   NM:i:3
    SRR002271.5667:1:1:261:529#0    163     chr22   33569308        255     36M     =       33569484       212     AAGCCTGCCTTACAAAAGCTCCTGAAGGAAGCATTA    IIIIIIIIIII4I81IIIIIIIII7&IH,IIB(II(  XA:i:0   MD:Z:36 NM:i:0
    SRR002271.5667:1:1:261:529#0    83      chr22   33569484        255     36M     =       33569308       -212    CCTTAAATGTAAATGGACTAAATGCCCCAATTAAAA    )./8III1IIIIIII?EFIIIIAIIIIIIIIIIIII  XA:i:0   MD:Z:36 NM:i:0

grep SRR004823.14378:3:1:253:207#0 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/1/chr22/hit.sam
    <NO MATCH>
    


</entry>

<entry [Fri Nov  5 11:24:00 EDT 2010] RAN BOWTIE (DEFAULT) AND NOVOALIGN CUMULATIVE SNPS>



BOWTIE
------

INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/hit.snp

    
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 12:27 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 12:28 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp



RUN cumulativeSnp.pl:


screen -S bowtie-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/cumulativeSnp.out
    
    cumulativeSNP.pl    Run time: 24:59:42
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    2:42PM, 6 November 2010
    cumulativeSNP.pl    ****************************************



OUTPUT FILES:

merged.bam-4 IS THE SAME AS merged.bam-5
merged.bam-6 IS THE SAME AS merged.bam-7

MISSING FILES

    hit-4.snp
    hit-6.snp

PROBLEM WITH 15 < 14, SAME WITH 17 < 16

diff merged.bam-4 merged.bam-5
    <NO DIFFERENCE> 

diff merged.bam-6 merged.bam-7
    <NO DIFFERENCE> 


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative/chr22
ls -al  merged.bam*

    -rw-rw-rw- 1 syoung root 7904044194 Nov  6 14:23 merged.bam
    -rw-r--r-- 1 syoung root  313122729 Nov  5 13:44 merged.bam-1
    -rw-r--r-- 1 syoung root  616350940 Nov  5 13:53 merged.bam-2
    -rw-r--r-- 1 syoung root  917106299 Nov  5 14:06 merged.bam-3
    -rw-r--r-- 1 syoung root 1216529421 Nov  5 14:22 merged.bam-4
    -rw-r--r-- 1 syoung root 1216529421 Nov  5 14:23 merged.bam-5
    -rw-r--r-- 1 syoung root 1514373575 Nov  5 14:43 merged.bam-6
    -rw-r--r-- 1 syoung root 1514373575 Nov  5 14:44 merged.bam-7
    -rw-r--r-- 1 syoung root 1811020002 Nov  5 15:09 merged.bam-8
    -rw-r--r-- 1 syoung root 2106449126 Nov  5 15:35 merged.bam-9
    -rw-r--r-- 1 syoung root 2400277889 Nov  5 16:06 merged.bam-10
    -rw-r--r-- 1 syoung root 2693376979 Nov  5 16:40 merged.bam-11
    -rw-r--r-- 1 syoung root 2985616602 Nov  5 17:18 merged.bam-12
    -rw-r--r-- 1 syoung root 3277392847 Nov  5 18:38 merged.bam-13
    -rw-r--r-- 1 syoung root 3568354920 Nov  5 19:21 merged.bam-14
    -rw-r--r-- 1 syoung root 2058698752 Nov  5 20:07 merged.bam-15
    -rw-r--r-- 1 syoung root 3859044812 Nov  5 20:09 merged.bam-16
    -rw-rw-rw- 1 syoung root 3303489536 Nov  5 20:59 merged.bam-17
    -rw-rw-rw- 1 syoung root 4149291043 Nov  5 21:01 merged.bam-18
    -rw-rw-rw- 1 syoung root 4439057881 Nov  5 21:59 merged.bam-19
    -rw-rw-rw- 1 syoung root 4728854749 Nov  5 22:59 merged.bam-20
    -rw-rw-rw- 1 syoung root 4491788288 Nov  6 00:03 merged.bam-21
    -rw-rw-rw- 1 syoung root 5017947615 Nov  6 00:05 merged.bam-22
    -rw-rw-rw- 1 syoung root 5307236443 Nov  6 01:11 merged.bam-23
    -rw-rw-rw- 1 syoung root 5596403497 Nov  6 02:21 merged.bam-24
    -rw-rw-rw- 1 syoung root 5885620847 Nov  6 03:37 merged.bam-25
    -rw-rw-rw- 1 syoung root 6174118275 Nov  6 05:21 merged.bam-26
    -rw-rw-rw- 1 syoung root 6462658749 Nov  6 06:49 merged.bam-27
    -rw-rw-rw- 1 syoung root 6751220825 Nov  6 08:10 merged.bam-28
    -rw-rw-rw- 1 syoung root 7039488566 Nov  6 09:35 merged.bam-29
    -rw-rw-rw- 1 syoung root 7327549289 Nov  6 11:09 merged.bam-30
    -rw-rw-rw- 1 syoung root 7327549289 Nov  6 11:17 merged.bam-31
    -rw-rw-rw- 1 syoung root 7615614461 Nov  6 12:50 merged.bam-32
    -rw-rw-rw- 1 syoung root 7904044194 Nov  6 14:26 merged.bam-33
    -rw-rw-rw- 1 syoung root 7904044206 Nov  6 13:30 merged.bam.temp

GB UNITS:
    
    -rw-rw-rw- 1 syoung root 7.4G Nov  6 14:23 merged.bam
    -rw-r--r-- 1 syoung root 299M Nov  5 13:44 merged.bam-1
    -rw-r--r-- 1 syoung root 588M Nov  5 13:53 merged.bam-2
    -rw-r--r-- 1 syoung root 875M Nov  5 14:06 merged.bam-3
    -rw-r--r-- 1 syoung root 1.2G Nov  5 14:22 merged.bam-4
    -rw-r--r-- 1 syoung root 1.2G Nov  5 14:23 merged.bam-5
    -rw-r--r-- 1 syoung root 1.5G Nov  5 14:43 merged.bam-6
    -rw-r--r-- 1 syoung root 1.5G Nov  5 14:44 merged.bam-7
    -rw-r--r-- 1 syoung root 1.7G Nov  5 15:09 merged.bam-8
    -rw-r--r-- 1 syoung root 2.0G Nov  5 15:35 merged.bam-9
    -rw-r--r-- 1 syoung root 2.3G Nov  5 16:06 merged.bam-10
    -rw-r--r-- 1 syoung root 2.6G Nov  5 16:40 merged.bam-11
    -rw-r--r-- 1 syoung root 2.8G Nov  5 17:18 merged.bam-12
    -rw-r--r-- 1 syoung root 3.1G Nov  5 18:38 merged.bam-13
    -rw-r--r-- 1 syoung root 3.4G Nov  5 19:21 merged.bam-14
    -rw-r--r-- 1 syoung root 2.0G Nov  5 20:07 merged.bam-15
    -rw-r--r-- 1 syoung root 3.6G Nov  5 20:09 merged.bam-16
    -rw-rw-rw- 1 syoung root 3.1G Nov  5 20:59 merged.bam-17
    -rw-rw-rw- 1 syoung root 3.9G Nov  5 21:01 merged.bam-18
    -rw-rw-rw- 1 syoung root 4.2G Nov  5 21:59 merged.bam-19
    -rw-rw-rw- 1 syoung root 4.5G Nov  5 22:59 merged.bam-20
    -rw-rw-rw- 1 syoung root 4.2G Nov  6 00:03 merged.bam-21
    -rw-rw-rw- 1 syoung root 4.7G Nov  6 00:05 merged.bam-22
    -rw-rw-rw- 1 syoung root 5.0G Nov  6 01:11 merged.bam-23
    -rw-rw-rw- 1 syoung root 5.3G Nov  6 02:21 merged.bam-24
    -rw-rw-rw- 1 syoung root 5.5G Nov  6 03:37 merged.bam-25
    -rw-rw-rw- 1 syoung root 5.8G Nov  6 05:21 merged.bam-26
    -rw-rw-rw- 1 syoung root 6.1G Nov  6 06:49 merged.bam-27
    -rw-rw-rw- 1 syoung root 6.3G Nov  6 08:10 merged.bam-28
    -rw-rw-rw- 1 syoung root 6.6G Nov  6 09:35 merged.bam-29
    -rw-rw-rw- 1 syoung root 6.9G Nov  6 11:09 merged.bam-30
    -rw-rw-rw- 1 syoung root 6.9G Nov  6 11:17 merged.bam-31
    -rw-rw-rw- 1 syoung root 7.1G Nov  6 12:50 merged.bam-32
    -rw-rw-rw- 1 syoung root 7.4G Nov  6 14:26 merged.bam-33
    -rw-rw-rw- 1 syoung root 7.4G Nov  6 13:30 merged.bam.temp



OUTPUT *snp FILES:
    
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 13:44 hit-1.snp
    -rw-rw-rw- 1 syoung root 7.1M Nov  5 13:54 hit-2.snp
    -rw-rw-rw- 1 syoung root 8.9M Nov  5 14:07 hit-3.snp
    -rw-rw-rw- 1 syoung root  11M Nov  5 14:25 hit-5.snp
    -rw-rw-rw- 1 syoung root  12M Nov  5 14:46 hit-7.snp
    -rw-rw-rw- 1 syoung root  12M Nov  5 15:11 hit-8.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 15:38 hit-9.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 16:09 hit-10.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 16:44 hit-11.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 17:22 hit-12.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 18:43 hit-13.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 19:27 hit-14.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 20:13 hit-15.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 20:15 hit-16.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 21:05 hit-17.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 21:07 hit-18.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 22:07 hit-19.snp
    -rw-rw-rw- 1 syoung root  13M Nov  5 23:06 hit-20.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 00:11 hit-21.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 00:13 hit-22.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 01:20 hit-23.snp
    -rw-rw-rw- 1 syoung root  13M Nov  6 02:31 hit-24.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 03:48 hit-25.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 05:38 hit-26.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 07:01 hit-27.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 08:23 hit-28.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 09:48 hit-29.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 11:31 hit-31.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 13:05 hit-32.snp
    -rw-rw-rw- 1 syoung root  12M Nov  6 14:42 hit-33.snp




NOVOALIGN
---------


INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign
ll */chr22/hit.snp


    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:29 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:22 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:41 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  4 16:23 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:44 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:44 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:47 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:50 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:53 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:45 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:42 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:28 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:26 7/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:24 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.4M Nov  5 06:27 9/chr22/hit.snp



RUN cumulativeSnp.pl:


mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative

screen -S novo-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/cumulativeSnp.out


DIED BECAUSE OF PEGASUS SHUTDOWN:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/cumulativeSnp.out
cumulativeSNP.pl    Printing STDOUT to stdoutfile:


screen STDOUT:

    LSF daemon (LIM) not responding ... still trying
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Can't exec "bjobs": No such file or directory at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 582.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Use of uninitialized value in split at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 586.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Can't exec "bjobs": No such file or directory at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 582.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Use of uninitialized value in split at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 586.
    Command 'bsub' not found in /sw/bin, /nethome/syoung/base/bin, /usr/X11R6/bin, /nethome/syoung/base/bin/utils, /home/syoung/base/bin/nextgen, /home/syoung/base/apps/amos/bin, /home/apps/alta-cyclic/0.1.0/external.programs/libsvm-2.86, /home/apps/alta-cyclic/0.1.0/blat/bin/i386, /home/bioinfo/apps/ngs/bin/nextgen, /home/bioinfo/apps/ngs/bin/exome, /home/bioinfo/apps/ngs/bin/utils, /home/bioinfo/apps/ngs/bin, /nethome/syoung/base/apps/python/python/2.7/bin, /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/etc, /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/bin, /usr/kerberos/bin, /usr/local/bin, /bin, /usr/bin at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/external/LSF.pm line 62


RESTART FROM FILE 18:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22
ls -al merged.bam*

    -rw-r--r-- 1 syoung root 1700244587 Nov  7 07:13 merged.bam
    -rw-r--r-- 1 syoung root  298737689 Nov  5 13:28 merged.bam-1
    -rw-r--r-- 1 syoung root 2566930861 Nov  5 21:16 merged.bam-10
    -rw-r--r-- 1 syoung root 1890140160 Nov  5 23:33 merged.bam-11
    -rw-r--r-- 1 syoung root 2847110086 Nov  5 23:35 merged.bam-12
    -rw-r--r-- 1 syoung root 3127078856 Nov  6 02:13 merged.bam-13
    -rw-r--r-- 1 syoung root 3400646391 Nov  6 05:23 merged.bam-14
    -rw-r--r-- 1 syoung root 3679162106 Nov  6 08:48 merged.bam-15
    -rw-r--r-- 1 syoung root 3956869897 Nov  6 12:36 merged.bam-16
    -rw-r--r-- 1 syoung root 4230385119 Nov  6 16:39 merged.bam-17
    -rw-r--r-- 1 syoung root 1700244587 Nov  7 07:13 merged.bam-18
    -rw-r--r-- 1 syoung root  588597724 Nov  5 13:39 merged.bam-2
    -rw-r--r-- 1 syoung root  295408851 Nov  6 20:46 merged.bam-20
    -rw-r--r-- 1 syoung root  878073339 Nov  5 14:01 merged.bam-3
    -rw-r--r-- 1 syoung root 1164628504 Nov  5 14:34 merged.bam-4
    -rw-r--r-- 1 syoung root 1445389739 Nov  5 15:21 merged.bam-5
    -rw-r--r-- 1 syoung root 1445389739 Nov  5 15:23 merged.bam-6
    -rw-r--r-- 1 syoung root 1729019503 Nov  5 16:24 merged.bam-7
    -rw-r--r-- 1 syoung root 2012313044 Nov  5 17:42 merged.bam-8
    -rw-r--r-- 1 syoung root 2289335846 Nov  5 19:21 merged.bam-9
    -rw-rw-rw- 1 syoung root 4503959632 Nov  7 07:08 merged.bam.temp




RERUN FROM 18:

screen -S novo-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--start 18 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative \
--species human \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/cumulativeSnp.out




RUNNING:

    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/cumulativeSnp-chr22-18.sh
    Job <2246563> is submitted to queue <large>.
    Mon Nov  8 12:06:58 EST 2010


COMPLETED BUT INTERRUPTED:

    cumulativeSNP.pl    Run time: 20:21:38
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    8:28AM, 9 November 2010
    cumulativeSNP.pl    ****************************************


    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/
ll merged.bam*

    -rw-r--r-- 1 syoung root 5.3G Nov  9 05:26 merged.bam
    -rw-r--r-- 1 syoung root 285M Nov  5 13:28 merged.bam-1
    -rw-r--r-- 1 syoung root 562M Nov  5 13:39 merged.bam-2
    -rw-r--r-- 1 syoung root 838M Nov  5 14:01 merged.bam-3
    -rw-r--r-- 1 syoung root 1.1G Nov  5 14:34 merged.bam-4
    -rw-r--r-- 1 syoung root 1.4G Nov  5 15:21 merged.bam-5
    -rw-r--r-- 1 syoung root 1.4G Nov  5 15:23 merged.bam-6
    -rw-r--r-- 1 syoung root 1.7G Nov  5 16:24 merged.bam-7
    -rw-r--r-- 1 syoung root 1.9G Nov  5 17:42 merged.bam-8
    -rw-r--r-- 1 syoung root 2.2G Nov  5 19:21 merged.bam-9
    -rw-r--r-- 1 syoung root 2.4G Nov  5 21:16 merged.bam-10
    -rw-r--r-- 1 syoung root 1.8G Nov  5 23:33 merged.bam-11
    -rw-r--r-- 1 syoung root 2.7G Nov  5 23:35 merged.bam-12
    -rw-r--r-- 1 syoung root 3.0G Nov  6 02:13 merged.bam-13
    -rw-r--r-- 1 syoung root 3.2G Nov  6 05:23 merged.bam-14
    -rw-r--r-- 1 syoung root 3.5G Nov  6 08:48 merged.bam-15
    -rw-r--r-- 1 syoung root 3.7G Nov  6 12:36 merged.bam-16
    -rw-r--r-- 1 syoung root 4.0G Nov  6 16:39 merged.bam-17
    -rw-r--r-- 1 syoung root 4.2G Nov  8 13:08 merged.bam-18
    -rw-r--r-- 1 syoung root 4.1G Nov  8 16:57 merged.bam-19
    -rw-r--r-- 1 syoung root 4.5G Nov  8 16:59 merged.bam-20

    -rw-r--r-- 1 syoung root 3.3G Nov  8 21:02 merged.bam-21
    -rw-r--r-- 1 syoung root 4.7G Nov  8 21:05 merged.bam-22
    -rw-r--r-- 1 syoung root 5.0G Nov  9 01:26 merged.bam-32
    -rw-r--r-- 1 syoung root 5.3G Nov  9 05:29 merged.bam-33
    -rw-rw-rw- 1 syoung root 5.3G Nov  9 04:47 merged.bam.temp




NB: FILE merged.bam-5 IS THE SAME AS FILE merged.bam-6 

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/
diff merged.bam-5 merged.bam-6

    <NO DIFFERENCE>

AND hit-5.snp IS MISSING:

    -rw-rw-rw- 1 syoung root 1.5M Nov  5 13:31 hit-1.snp
    -rw-rw-rw- 1 syoung root 2.3M Nov  5 13:49 hit-2.snp
    -rw-rw-rw- 1 syoung root 3.0M Nov  5 14:19 hit-3.snp
    -rw-rw-rw- 1 syoung root 3.5M Nov  5 15:04 hit-4.snp
    -rw-rw-rw- 1 syoung root 4.0M Nov  5 16:05 hit-6.snp
    -rw-rw-rw- 1 syoung root 4.4M Nov  5 17:20 hit-7.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 18:53 hit-8.snp
    -rw-rw-rw- 1 syoung root 5.1M Nov  5 20:48 hit-9.snp
    -rw-rw-rw- 1 syoung root 5.4M Nov  5 23:01 hit-10.snp
    -rw-rw-rw- 1 syoung root 5.7M Nov  6 01:37 hit-11.snp
    -rw-rw-rw- 1 syoung root 5.7M Nov  6 01:39 hit-12.snp
    -rw-rw-rw- 1 syoung root 6.0M Nov  6 04:41 hit-13.snp
    -rw-rw-rw- 1 syoung root 6.2M Nov  6 08:09 hit-14.snp
    -rw-rw-rw- 1 syoung root 6.5M Nov  6 11:55 hit-15.snp
    -rw-rw-rw- 1 syoung root 3.5M Nov  7 09:55 hit-18.snp
    -rw-rw-rw- 1 syoung root    0 Nov  6 20:46 hit-20.snp




SO SURMISE THAT merged.bam-5 FAILED. CHANGED PROCESS SO THAT THE SAME INTERMEDIATE FILE IS NOT USED FOR ALL STEPS.


RERAN AS novo-cum2




INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/
ll */chr22/hit.sam

    -rw-rw-rw- 1 syoung root 864M Nov  5 06:19 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 873M Nov  5 06:17 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:19 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 876M Nov  5 06:12 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 858M Nov  5 06:17 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:19 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:17 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 863M Nov  5 06:35 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 842M Nov  5 06:34 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 837M Nov  5 06:34 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 874M Nov  4 16:17 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 864M Nov  5 06:38 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 868M Nov  5 06:43 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 863M Nov  5 06:45 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 869M Nov  5 06:44 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 875M Nov  5 06:42 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 873M Nov  5 06:39 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 877M Nov  5 06:45 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 868M Nov  5 06:45 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 867M Nov  5 06:39 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 864M Nov  5 06:42 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 869M Nov  5 06:14 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 865M Nov  5 06:44 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 869M Nov  5 06:45 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 872M Nov  5 06:39 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 852M Nov  5 06:36 33/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 874M Nov  5 06:19 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 871M Nov  5 06:16 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 870M Nov  5 06:19 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 860M Nov  5 06:17 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 873M Nov  5 06:15 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 876M Nov  5 06:17 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 860M Nov  5 06:18 9/chr22/hit.sam



RERUN cumulativeSnp.pl


screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label novo-cum2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.out


    RUNNING FILE 1
    Mon Nov 15 01:32:18 EST 2010

    AT FILE 21, Tue Nov 16 13:49:30 EST 2010





PROBLEM WITH LSF AT Mon Nov 15 13:53:00 EST 2010 BUT STILL RUNNING

    /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.out
    
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying




NOTICED 'SLIPPAGE' AT FILES 8 AND 9 IN cumulative2 (COMPARED TO FILES 5 AND 6 IN cumulative):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll -tr merged.bam*

    -rw-r--r-- 1 syoung root 285M Nov 15 01:33 merged.bam-1
    -rw-rw-rw- 1 syoung root 562M Nov 15 01:44 merged.bam-2
    -rw-rw-rw- 1 syoung root 838M Nov 15 02:04 merged.bam-3
    -rw-rw-rw- 1 syoung root 1.1G Nov 15 02:38 merged.bam-4
    -rw-rw-rw- 1 syoung root 1.4G Nov 15 03:27 merged.bam-5
    -rw-rw-rw- 1 syoung root 1.7G Nov 15 04:28 merged.bam-6
    -rw-rw-rw- 1 syoung root 1.9G Nov 15 05:46 merged.bam-7
    -rw-rw-rw- 1 syoung root 2.2G Nov 15 07:26 merged.bam-9
    -rw-rw-rw- 1 syoung root 2.2G Nov 15 07:26 merged.bam-8
    -rw-rw-rw- 1 syoung root 2.4G Nov 15 09:20 merged.bam-10
    -rw-rw-rw- 1 syoung root 2.4G Nov 15 09:22 merged.bam-11
    -rw-rw-rw- 1 syoung root 2.7G Nov 15 11:38 merged.bam-12
    -rw-rw-rw- 1 syoung root 3.0G Nov 15 14:15 merged.bam-13
    -rw-rw-rw- 1 syoung root 3.0G Nov 15 14:16 merged.bam-14
    -rw-rw-rw- 1 syoung root 3.2G Nov 15 17:17 merged.bam-15
    -rw-rw-rw- 1 syoung root 3.5G Nov 15 20:43 merged.bam-17
    -rw-rw-rw- 1 syoung root 3.5G Nov 15 20:43 merged.bam-16
    -rw-rw-rw- 1 syoung root 3.7G Nov 16 00:30 merged.bam-18
    -rw-rw-rw- 1 syoung root 4.0G Nov 16 04:32 merged.bam-19
    -rw-rw-rw- 1 syoung root 4.2G Nov 16 08:36 merged.bam-20
    -rw-rw-rw- 1 syoung root 4.5G Nov 16 12:05 merged.bam.temp
    -rw-rw-rw- 1 syoung root 4.5G Nov 16 12:37 merged.bam
    -rw-rw-rw- 1 syoung root 4.5G Nov 16 12:39 merged.bam-21

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll -tr ../../cumulative/chr22/merged.bam*

    -rw-r--r-- 1 syoung root 285M Nov  5 13:28 ../../cumulative/chr22/merged.bam-1
    -rw-r--r-- 1 syoung root 562M Nov  5 13:39 ../../cumulative/chr22/merged.bam-2
    -rw-r--r-- 1 syoung root 838M Nov  5 14:01 ../../cumulative/chr22/merged.bam-3
    -rw-r--r-- 1 syoung root 1.1G Nov  5 14:34 ../../cumulative/chr22/merged.bam-4
    -rw-r--r-- 1 syoung root 1.4G Nov  5 15:21 ../../cumulative/chr22/merged.bam-5
    -rw-r--r-- 1 syoung root 1.4G Nov  5 15:23 ../../cumulative/chr22/merged.bam-6
    -rw-r--r-- 1 syoung root 1.7G Nov  5 16:24 ../../cumulative/chr22/merged.bam-7
    -rw-r--r-- 1 syoung root 1.9G Nov  5 17:42 ../../cumulative/chr22/merged.bam-8
    -rw-r--r-- 1 syoung root 2.2G Nov  5 19:21 ../../cumulative/chr22/merged.bam-9
    -rw-r--r-- 1 syoung root 2.4G Nov  5 21:16 ../../cumulative/chr22/merged.bam-10
    -rw-r--r-- 1 syoung root 1.8G Nov  5 23:33 ../../cumulative/chr22/merged.bam-11
    -rw-r--r-- 1 syoung root 2.7G Nov  5 23:35 ../../cumulative/chr22/merged.bam-12
    -rw-r--r-- 1 syoung root 3.0G Nov  6 02:13 ../../cumulative/chr22/merged.bam-13
    -rw-r--r-- 1 syoung root 3.2G Nov  6 05:23 ../../cumulative/chr22/merged.bam-14
    -rw-r--r-- 1 syoung root 3.5G Nov  6 08:48 ../../cumulative/chr22/merged.bam-15
    -rw-r--r-- 1 syoung root 3.7G Nov  6 12:36 ../../cumulative/chr22/merged.bam-16
    -rw-r--r-- 1 syoung root 4.0G Nov  6 16:39 ../../cumulative/chr22/merged.bam-17
    -rw-r--r-- 1 syoung root 4.2G Nov  8 13:08 ../../cumulative/chr22/merged.bam-18
    -rw-r--r-- 1 syoung root 4.1G Nov  8 16:57 ../../cumulative/chr22/merged.bam-19
    -rw-r--r-- 1 syoung root 4.5G Nov  8 16:59 ../../cumulative/chr22/merged.bam-20
    -rw-r--r-- 1 syoung root 3.3G Nov  8 21:02 ../../cumulative/chr22/merged.bam-21
    -rw-r--r-- 1 syoung root 4.7G Nov  8 21:05 ../../cumulative/chr22/merged.bam-22
    -rw-r--r-- 1 syoung root 5.0G Nov  9 01:26 ../../cumulative/chr22/merged.bam-32
    -rw-rw-rw- 1 syoung root 5.3G Nov  9 04:47 ../../cumulative/chr22/merged.bam.temp
    -rw-r--r-- 1 syoung root 5.3G Nov  9 05:26 ../../cumulative/chr22/merged.bam
    -rw-r--r-- 1 syoung root 5.3G Nov  9 05:29 ../../cumulative/chr22/merged.bam-33



MANUAL MERGE OF FILE 9 IN cumulative2

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22


time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.sam;

    [sam_header_read2] 1 sequences loaded.
    
    real    1m18.149s
    user    1m9.454s
    sys     0m5.360s


EXTRA STEP: COPY LAST merged.bam FILE TO merged.bam
cp -r merged.bam-8 merged.bam


screen -S cum2

REDUCED THIS CODE:

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam;


    real    8m59.867s
    user    8m40.331s
    sys     0m15.837s

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit;

time mv -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam;

time cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam-9;



TO A MORE DIRECT APPROACH IN THIS CODE:

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-9.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam;

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-9.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged-9;

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22;


FOLLOWED BY SNP CALLING:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22;

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged.bam | tee hit-9.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-9.filter;

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-9.filter > hit-9.snp





RE-RE-RERUN FROM BEGINNING
--------------------------

screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label novo-cum2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.out

    
    cumulativeSNP.pl    Run time: 01:28:51
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    1:47AM, 17 November 2010
    cumulativeSNP.pl    ****************************************




SNP::bamSnps    COMMANDS:

time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10/chr22/hit.sam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-10.bam | tee hit-10.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-10.filter

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-10.filter > hit-10.snp



RAN FINE FOR 4 FILES THEN FAILED AT FILE 5:


emacs cumulativeSnp-chr22-5-stdout.txt

    ...
    [sam_header_read2] 1 sequences loaded.
    
    real    1m2.485s
    user    0m57.448s
    sys     0m3.174s
    open: No such file or directory
    [bam_merge_core] fail to open file /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam
    ...


EVEN THOUGH THE FILE IS QUESTION IS PRESENT:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam

    -rw-rw-rw- 1 syoung root 1.1G Nov 17 01:21 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22/merged-4.bam


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/chr22
ll cumulativeSnp-chr22-5-stdout.txt

    -rw-rw-rw- 1 syoung root 2.4K Nov 17 01:11 cumulativeSnp-chr22-5-stdout.txt



NOTE: THE FILE IN QUESTION IS DATED LATER THAN THE END OF THE OUTPUT FILE!!






RE-RE-RE-RERUN FROM FILE 5
--------------------------

screen -S novo-cum2

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/33 \
--start 5 \
--samfile hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2 \
--species human \
--label novo-cum2 \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative2/cumulativeSnp.out



    cumulativeSNP.pl    Run time: 66:55:59
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    9:14AM, 21 November 2010
    cumulativeSNP.pl    ****************************************



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22
ll -tr hit*snp

    -rw-rw-rw- 1 syoung root    0 Nov 12 15:37 hit-1.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov 12 15:39 hit-2.snp
    -rw-rw-rw- 1 syoung root 7.2M Nov 12 15:49 hit-3.snp
    -rw-rw-rw- 1 syoung root 7.9M Nov 12 15:58 hit-4.snp
    -rw-rw-rw- 1 syoung root 9.6M Nov 12 16:11 hit-5.snp
    -rw-rw-rw- 1 syoung root  11M Nov 12 16:30 hit-7.snp
    -rw-rw-rw- 1 syoung root  12M Nov 12 16:52 hit-8.snp
    -rw-rw-rw- 1 syoung root  12M Nov 12 17:14 hit-9.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 17:39 hit-10.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 18:07 hit-11.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 18:40 hit-12.snp
    -rw-rw-rw- 1 syoung root  14M Nov 12 19:19 hit-13.snp
    -rw-rw-rw- 1 syoung root  14M Nov 12 20:01 hit-14.snp
    -rw-rw-rw- 1 syoung root  14M Nov 12 20:56 hit-15.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 21:59 hit-16.snp
    -rw-rw-rw- 1 syoung root  13M Nov 12 23:03 hit-17.snp
    -rw-rw-rw- 1 syoung root 2.0M Nov 12 23:27 hit-19.snp
    -rw-rw-rw- 1 syoung root 2.0M Nov 12 23:33 hit-18.snp
    -rw-rw-rw- 1 syoung root 5.7M Nov 13 03:42 hit-21.snp
    -rw-rw-rw- 1 syoung root 7.6M Nov 13 04:03 hit-23.snp
    -rw-rw-rw- 1 syoung root 8.9M Nov 13 04:25 hit-24.snp
    -rw-rw-rw- 1 syoung root 9.8M Nov 13 04:52 hit-26.snp
    -rw-rw-rw- 1 syoung root 9.8M Nov 13 04:52 hit-25.snp
    -rw-rw-rw- 1 syoung root  11M Nov 13 05:24 hit-27.snp
    -rw-rw-rw- 1 syoung root  11M Nov 13 05:57 hit-28.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 06:36 hit-29.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 06:36 hit-30.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 07:18 hit-31.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 08:02 hit-32.snp
    -rw-rw-rw- 1 syoung root  12M Nov 13 08:50 hit-33.snp


NOTE: FILE 1 merged.bam FILE IS MUCH SMALLER THAN EXPECTED

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative2/chr22

    -rw-rw-rw- 1 syoung root   54314137 Nov 19 10:07 merged-1.bam
    -rw-rw-rw- 1 syoung root  367662929 Nov 19 10:22 merged-2.bam
    -rw-rw-rw- 1 syoung root  671362697 Nov 19 10:40 merged-3.bam
    -rw-rw-rw- 1 syoung root  774027622 Nov 19 10:59 merged-4.bam
    -rw-rw-rw- 1 syoung root 1076452433 Nov 19 11:22 merged-5.bam
    -rw-rw-rw- 1 syoung root 1375669775 Nov 19 11:49 merged-6.bam
    -rw-rw-rw- 1 syoung root 1673205685 Nov 19 12:18 merged-7.bam
    -rw-rw-rw- 1 syoung root 1969431981 Nov 19 12:51 merged-8.bam
    -rw-rw-rw- 1 syoung root 2014878689 Nov 19 13:25 merged-9.bam
    -rw-rw-rw- 1 syoung root 2309361554 Nov 19 14:02 merged-10.bam
    -rw-rw-rw- 1 syoung root 2602956914 Nov 19 14:43 merged-11.bam






NOTES
-----

RESTART AT FILE 17


SNP::bamSnps    COMMANDS:

time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit.sam

time cp merged.bam-17 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit

time mv -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/18/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam

time cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam-18

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative/chr22/merged.bam | tee hit-18.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-18.filter

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-18.filter > hit-18.snp





</entry>

<entry [Fri Nov  5 01:45:59 EDT 2010] RUN SAV.pl ON MAQ 3.3 BILLION READS SNPS>

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative

screen -S maq-sav

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--replicates 1-33 \
--loop distributed \
--label maq-sav \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/SAV.pl \
--tempfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/snp130-chr22-%REPLICATE%.dbl \
--inputfile hit-%REPLICATE%.snp \
--outputfile hit-%REPLICATE%.sav \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/fasta/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--dbsnp snp130 \
--species human \
--maxjobs 1000 \
--queue small \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/sav-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/loop-sav.out
    
    Run time: 03:47:13
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    5:44AM, 5 November 2010
    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative
ls -al *sav

    -rw-rw-rw- 1 syoung root 1894786 Nov  5 05:17 hit-1.sav
    -rw-rw-rw- 1 syoung root 2622141 Nov  5 05:44 hit-2.sav
    -rw-rw-rw- 1 syoung root 2249006 Nov  5 05:24 hit-3.sav
    -rw-rw-rw- 1 syoung root 1361217 Nov  5 04:00 hit-4.sav
    -rw-rw-rw- 1 syoung root 1035973 Nov  5 03:31 hit-5.sav
    -rw-rw-rw- 1 syoung root  776917 Nov  5 03:04 hit-6.sav


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative
ls -al *snp

    -rw-rw-rw- 1 syoung root 1116781 Nov  4 14:32 hit-1.snp
    -rw-rw-rw- 1 syoung root 1562854 Nov  4 13:06 hit-2.snp
    -rw-rw-rw- 1 syoung root 1468170 Nov  4 19:32 hit-3.snp
    -rw-rw-rw- 1 syoung root 1113761 Nov  4 20:38 hit-4.snp
    -rw-rw-rw- 1 syoung root 1048679 Nov  4 22:09 hit-5.snp
    -rw-rw-rw- 1 syoung root 1012187 Nov  4 23:59 hit-6.snp
    -rw-rw-rw- 1 syoung root  979568 Nov  5 02:13 hit-7.snp
    -rw-rw-rw- 1 syoung root  980441 Nov  5 04:31 hit-8.snp
    -rw-rw-rw- 1 syoung root 1008297 Nov  5 07:06 hit-9.snp









</entry>

<entry [Thu Nov  4 14:19:57 EDT 2010] RUN bamCoverage.pl ON ELAND CUMULATIVELY MERGED BAM FILES>


1. COPIED merged.bam-N FILES FROM /ngs/bioinfo TO /scratch

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22

NOTE: PROBLEM WITH 2-3 TRANSITION AND 4-5 TRANSITION

ls -al merged.bam*

    -rw-r--r-- 1 syoung root  178443232 Nov  4 13:17 merged.bam-1
    -rw-r--r-- 1 syoung root  216918872 Nov  4 13:23 merged.bam-2
    -rw-r--r-- 1 syoung root  216918872 Nov  4 13:31 merged.bam-3
    -rw-r--r-- 1 syoung root  344605293 Nov  4 13:36 merged.bam-4
    -rw-r--r-- 1 syoung root  344605293 Nov  4 13:36 merged.bam-5
    -rw-r--r-- 1 syoung root  468927373 Nov  4 13:36 merged.bam-6
    -rw-r--r-- 1 syoung root  591296764 Nov  4 13:37 merged.bam-7
    -rw-r--r-- 1 syoung root  712410526 Nov  4 13:37 merged.bam-8
    -rw-r--r-- 1 syoung root  832639592 Nov  4 13:37 merged.bam-9
    -rw-r--r-- 1 syoung root  952113778 Nov  4 13:18 merged.bam-10
    -rw-r--r-- 1 syoung root 1070777742 Nov  4 13:18 merged.bam-11
    -rw-r--r-- 1 syoung root 1188799709 Nov  4 13:18 merged.bam-12
    -rw-r--r-- 1 syoung root 1306482150 Nov  4 13:19 merged.bam-13
    -rw-r--r-- 1 syoung root 1423967574 Nov  4 13:19 merged.bam-14
    -rw-r--r-- 1 syoung root 1540688744 Nov  4 13:20 merged.bam-15
    -rw-r--r-- 1 syoung root 1657113893 Nov  4 13:21 merged.bam-16
    -rw-r--r-- 1 syoung root 1773270440 Nov  4 13:21 merged.bam-17
    -rw-r--r-- 1 syoung root 1889197821 Nov  4 13:22 merged.bam-18
    -rw-r--r-- 1 syoung root 2004974876 Nov  4 13:22 merged.bam-19
    -rw-r--r-- 1 syoung root 2120509050 Nov  4 13:23 merged.bam-20
    -rw-r--r-- 1 syoung root 2235977834 Nov  4 13:24 merged.bam-21
    -rw-r--r-- 1 syoung root 2351019951 Nov  4 13:25 merged.bam-22
    -rw-r--r-- 1 syoung root 2466067804 Nov  4 13:26 merged.bam-23
    -rw-r--r-- 1 syoung root 2581127799 Nov  4 13:26 merged.bam-24
    -rw-r--r-- 1 syoung root 2695985987 Nov  4 13:27 merged.bam-25
    -rw-r--r-- 1 syoung root 2810611918 Nov  4 13:28 merged.bam-26
    -rw-r--r-- 1 syoung root 2925308495 Nov  4 13:29 merged.bam-27
    -rw-r--r-- 1 syoung root 3039937621 Nov  4 13:30 merged.bam-28
    -rw-r--r-- 1 syoung root 3154262034 Nov  4 13:31 merged.bam-29
    -rw-r--r-- 1 syoung root 3268626202 Nov  4 13:33 merged.bam-30
    -rw-r--r-- 1 syoung root 3382741560 Nov  4 13:34 merged.bam-31
    -rw-r--r-- 1 syoung root 3496983991 Nov  4 13:35 merged.bam-32
    -rw-r--r-- 1 syoung root 3611070880 Nov  4 13:36 merged.bam-33




2. INDEX BAM FILES
------------------


/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative \
--loop distributed \
--replicates 1-33 \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/indexBam.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-%REPLICATE%.bai \
--label bamIndex \
--cluster LSF \
--maxjobs 1000 \
--queue small

    
    Run time: 00:12:34
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    0:51AM, 5 November 2010
    ****************************************




3. RUN bamCoverage.pl ON ALL merged.bam-N FILES
-----------------------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative

ON u02:
------

screen -S eland-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-%REPLICATE%.coverage \
--replicates 1-33 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small

    Run time: 00:16:10
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:12AM, 5 November 2010
    ****************************************

1	2.741045
2	3.247491
3	3.247491
4	5.082651
5	5.082651
6	6.917666
7	8.751204
8	10.586130
9	12.422666
10	14.259093
11	16.093735
12	17.927492
13	19.763257
14	21.601560
15	23.434835
16	25.267585
17	27.100272
18	28.933352
19	30.767292
20	32.601366
21	34.436576
22	36.268196
23	38.102003
24	39.937946
25	41.773484
26	43.606847
27	45.442986
28	47.280553
29	49.113945
30	50.950272
31	52.784406
32	54.620388
33	56.455139










NOTES
-----

TEST THE merged.bam-1 FILE
--------------------------

/nethome/bioinfo/apps/samtools/0.1.6/samtools view \
-o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged-1.sam \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-1

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged-1.sam
    -rw-rw-r-- 1 syoung root 596M Nov  4 16:23 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged-1.sam
    
[syoung@u01 chr22]$ head /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged-1.sam

    SRR005734.12612956:4:39:1116:140        153     chr22   16050009        81      36M     *       0       0       AAGTCCCAGGACTTCAGAAGAGCTCTGTGACCTTGG    )+!"++++++++++++++++++++++++++++++++    MD:Z:8T2C24     SM:i:81
    SRR005735.1021891:1:16:1497:601 89      chr22   16050009        87      36M     *       0       0       AAGTCCCAGGACTTCAGAAGAGCTGTGCGACCTTGG   ++*%++++"+%++!++++++++++++++++++++++     MD:Z:8T27       SM:i:87
    ...
    

/nethome/bioinfo/apps/samtools/0.1.6/samtools idxstats \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/merged.bam-1

    
    
    


</entry>

<entry [Thu Nov  4 12:29:48 EDT 2010] RERUN BOWTIE chr22 WITH DEFAULTS>


PROBLEM: BOWTIE RUN WITH --rf OPTION ON 3.3 BILLION READS PRODUCED SMALL hit.sam FILE

CONCLUSION: MUST RERUN BOWTIE FLAG WITH 3.3 BILLION READS USING '--fr' FLAG

BUT FIRST RUN DEFAULT FOR COMPARISON:


FIRST ROUND (2-16)
-----------------

(RAN FILE 1 FIRST TO TEST)
    
    BOWTIE.pl    Run time: 01:04:59
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    2:45PM, 4 November 2010
    BOWTIE.pl    ****************************************

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie


screen -S loop-bowtie


/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 2-16 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--params " --fr "
--loop parallel \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/bowtie-200bp-chr22-%REPLICATE%.out 

    
    BOWTIE.pl    Run time: 02:42:52
    BOWTIE.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl
    BOWTIE.pl    4:38PM, 4 November 2010
    BOWTIE.pl    ****************************************
    
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/hit.snp

    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp


head 8/chr22/hit.snp

    chr22   16050036        a       C       36      36      60      3       CCC     &II
    chr22   16050252        A       W       26      26      60      5       ,.T,T   IABII
    chr22   16050612        c       G       36      36      60      3       ggG     I+I
    chr22   16051107        c       A       36      36      60      3       aAa     I':
    chr22   16051209        a       G       12      39      60      5       gGG,g   I=I?I
    chr22   16051966        c       S       77      77      60      16      GgGG.G......GG.%@'E43I2II;IIII/
    chr22   16051998        c       Y       27      27      60      17      TTTT.TTTtA.TT,..,       ,$%'&,7*<..1'%GI&
    chr22   16052239        a       G       39      39      60      4       G$gg^~g )I+&
    chr22   16052513        g       S       36      60      60      7       cc.,c,C I;BII.0
    chr22   16052531        c       M       34      69      60      6       a.a..A  I-IIDI


head 9/chr22/hit.snp

    chr22   16050612        c       G       8       21      60      4       .Ggt    @I,$
    chr22   16050678        c       Y       30      30      60      4       T,t.    >III
    chr22   16051107        c       M       1       37      60      4       Aa.A    I*II
    chr22   16051209        a       G       25      36      60      4       g.GG    ,.-I
    chr22   16051241        c       T       5       42      60      7       T.TTt.T 3++C)CI
    chr22   16051255        c       T       30      39      60      5       TTt.T   ):9+I
    chr22   16051882        C       T       36      36      60      3       Ttt     (<.
    chr22   16051966        c       S       69      69      60      14      G.GGG...GG..G^~&%66,?IFII+II*
    chr22   16051998        c       Y       2       74      60      19      T$,TTTTTtTTT,TTtT.T.    0(6*&/IH+0A*//+EI<C
    chr22   16052120        t       A       14      21      60      6       ag,ggg  I-&&%%




SECOND ROUND (2-16)
------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie


screen -S loop-bowtie


/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--replicates 17-33 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--loop parallel \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE%/bowtie-200bp-chr22-%REPLICATE%.out 

    Run time: 02:44:55
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:25AM, 5 November 2010
    ****************************************




PROBLEM:


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie
ll */chr22/hit.snp

    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:10 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:19 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:19 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 10:51 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:19 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:15 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:24 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:22 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root    0 Nov  5 11:00 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp


ERROR IN STDOUT:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/bamToSnp-chr22.sh: line 22: /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl: No such file or directory

DIAGNOSIS:

samtools.pl IS NOW LOCATED IN THE samtools/misc FOLDER

SOLUTION:

1. CHANGED TO $samtools/misc/samtools.pl IN Cluster.pm.

2. RAN samToSnp.pl


mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/samToSnp
screen -S bowtie-samtosnp

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 17-33 \
--loop distributed \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/samToSnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToSnp.pl \
--reference chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/%REPLICATE% \
--species human \
--samfile hit.sam \
--label samToSnp \
--keep \
--queue large \
--cluster LSF \
--cpus 1 \
--maxjobs 1000 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/samToSnp/samToSnp.stdout

    OK!

OUTPUT FILES:
    
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:36 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.2M Nov  4 16:39 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 12:27 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 14:44 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:28 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:35 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.7M Nov  5 12:28 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 4.8M Nov  5 12:27 33/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:37 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:38 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:39 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 5.3M Nov  4 16:30 9/chr22/hit.snp


NB: ALSO COPIED OVER FROM 0.1.6 AND WORKED FINE:

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.bam | tee /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.filter

ll /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.filter
    -rw-rw-rw- 1 syoung root 8.7M Nov  5 12:10 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/18/chr22/hit.filter














NOTES
-----

TEST SINGLE RUN
---------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/BOWTIE.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-1.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/1 \
--species human \
--distance 200 \
--label bowtie-200bp-chr22-1 \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--keep \
--cluster LSF \
--cpus 1 \
--reads 1000000



TEST OF -rf, -fr AND -ff PARAMS
---------------------------------
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params

ll */out.sam

    -rw-rw-r-- 1 syoung root 251M Nov  4 13:13 ff/out.sam
    -rw-rw-r-- 1 syoung root 250M Nov  4 12:34 fr/out.sam
    -rw-rw-r-- 1 syoung root  91M Nov  4 12:29 rf/out.sam

ll */hit.sam
    
    -rw-rw-r-- 1 syoung root 3.8M Nov  4 13:19 ff/hit.sam
    -rw-rw-r-- 1 syoung root 1.2M Nov  4 12:41 fr/hit.sam
    -rw-rw-r-- 1 syoung root 303K Nov  4 12:41 rf/hit.sam

tail */hit.sam


NB: ALTHOUGH THE '-ff' FLAG RETURNS MORE HITS THAN '-fr', THEY ARE OVERWHELMINGLY 'AAAAAAAAAAAAAAAA'

 head */hit.sam
==> ff/hit.sam <==
@SQ     SN:chr22        LN:51304566
@PG     ID:Bowtie       VN:0.12.2       CL:"/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie --sam --threads 1 --ff --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/aligned.txt --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/unaligned.txt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/out.sam"
SRR005718.279:1:1:57:614#0      67      chr22   33583908        255     36M     =       33583911        39      AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:36       NM:i:0
SRR005718.279:1:1:57:614#0      131     chr22   33583911        255     36M     =       33583908        -39     AAAAAAAAAAAAAAAAAAAAAAAAAACAACAAAACA    II,IIIIIIIIIII)I7III8IIIII4I)GIIIA(I    XA:i:1  MD:Z:26A2A4A1 NM:i:3
SRR005718.333:1:1:188:110#0     179     chr22   22566394        255     36M     =       22566503        145     TGGTTTCCAGCTTCATCCATGTCCCTACAAAGGATA    IA7?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:6T27C1   NM:i:2
SRR005718.333:1:1:188:110#0     115     chr22   22566503        255     36M     =       22566394        -145    ACAATGAGAACACATGGACACAGGAAGGGGAACATC    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:2  MD:Z:28A1G5   NM:i:2
SRR005718.373:1:1:21:747#0      67      chr22   45861465        255     36M     =       45861468        39      AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:36       NM:i:0
SRR005718.373:1:1:21:747#0      131     chr22   45861468        255     36M     =       45861465        -39     AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:34C0T0   NM:i:2
SRR005718.568:1:1:366:41#0      67      chr22   49430399        255     36M     =       49430406        43      AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:36       NM:i:0
SRR005718.568:1:1:366:41#0      131     chr22   49430406        255     36M     =       49430399        -43     AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:0  MD:Z:32C2T0   NM:i:2

==> fr/hit.sam <==
@SQ     SN:chr22        LN:51304566
@PG     ID:Bowtie       VN:0.12.2       CL:"/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie --sam --threads 1 --fr --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/aligned.txt --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/unaligned.txt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/out.sam"
SRR005718.291:1:1:786:596#0     99      chr22   16850116        255     36M     =       16850155        75      GCATGGAATCATCATCAAATGGAATCGAATGGAATC    IIIIIIIIIIIIIIIIII:IIIH@IIIG?III+@<;    XA:i:1  MD:Z:1A33T0   NM:i:2
SRR005718.291:1:1:786:596#0     147     chr22   16850155        255     36M     =       16850116        -75     GAATGCAATCGAATAGAATCATCGAATGGACTCGAA    17D'1(/I00:EIFIIII4II4IIIIIIIIIDIIII    XA:i:1  MD:Z:5G27T2   NM:i:2
SRR005718.333:1:1:188:110#0     99      chr22   17114574        255     36M     =       17114681        143     GATGTTCCCCTTCCTGTGTCCATGTGTTCTCATTGT    IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:2  MD:Z:22A1G11  NM:i:2
SRR005718.333:1:1:188:110#0     147     chr22   17114681        255     36M     =       17114574        -143    TGGTTTCCAGCTTCATCCATGTCCCTACAAAGGATA    IA7?IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:34C1     NM:i:1
SRR005718.518:1:1:569:673#0     163     chr22   35587840        255     36M     =       35587915        111     GCAATGCTGCGATCTCAGCTCACTGCAACCTCCACC    IIIIIIIIIIIIIIIIIIIIIIIIII:.IIIBI4I?    XA:i:2  MD:Z:6G0C28   NM:i:2
SRR005718.518:1:1:569:673#0     83      chr22   35587915        255     36M     =       35587840        -111    TAGCTGGGATTACAGGCACCCACCATCATGCCTGGC    &AF9:FI;I?=IIIHII=IIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:32C3     NM:i:1
SRR005718.961:1:1:702:350#0     99      chr22   18085747        255     36M     =       18085951        240     GAGTGTCGCTCTGTTGCCCAGGCTCGAGTGCAGTGG    IIIIIIIIIIIIIIIIIIHB?IIIII/I?C0-2/10    XA:i:2  MD:Z:4C19G11  NM:i:2
SRR005718.961:1:1:702:350#0     147     chr22   18085951        255     36M     =       18085747        -240    TTTTGACTGCCTGCCTCGGCCTCCCAAAGTGCTGGG    .:-%*4C.1;I24I3=I:IIIIAIIIIIIIIIIIII    XA:i:0  MD:Z:0A0G1G0A0T30     NM:i:5

==> rf/hit.sam <==
@SQ     SN:chr22        LN:51304566
@PG     ID:Bowtie       VN:0.12.2       CL:"/nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie --sam --threads 1 --rf --al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/aligned.txt --un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/unaligned.txt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 -1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt -2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/out.sam"
SRR005718.291:1:1:786:596#0     147     chr22   16862343        255     36M     =       16862425        118     GAATGCAATCGAATAGAATCATCGAATGGACTCGAA    17D'1(/I00:EIFIIII4II4IIIIIIIIIDIIII    XA:i:0  MD:Z:5G30     NM:i:1
SRR005718.291:1:1:786:596#0     99      chr22   16862425        255     36M     =       16862343        -118    GCATGGAATCATCATCAAATGGAATCGAATGGAATC    IIIIIIIIIIIIIIIIII:IIIH@IIIG?III+@<;    XA:i:1  MD:Z:1A26G7   NM:i:2
SRR005718.1074:1:1:743:283#0    147     chr22   16859569        255     36M     =       16859621        88      GTCGAATGGAATCATCATCGAATGGAGTCGAATGGA    *253IIC9:II5II;II:IIIIIIIIIIIIIIIIII    XA:i:1  MD:Z:0A4C20A9 NM:i:3
SRR005718.1074:1:1:743:283#0    99      chr22   16859621        255     36M     =       16859569        -88     GAATGGAATCATCAAATGGAATCTAATGGAATCATC    IIIIIIIIIDIIIIICIII;HIIII:III8II67I:    XA:i:1  MD:Z:23G6G5   NM:i:2
SRR005718.1657:1:1:540:700#0    147     chr22   25187051        255     36M     =       25187200        185     GCCTGTAATCCCAGCTACTCAGGAGGCTGAGGCGGG    0,474:72,GIIIIIDDI.IIIEIIII@IIIIIIII    XA:i:1  MD:Z:0A6G25A2 NM:i:3
SRR005718.1657:1:1:540:700#0    99      chr22   25187200        255     36M     =       25187051        -185    GTGGCACGAGCCTGTAATCCCAGCTACTCAGGAGGC    IIII/IIIIIIIII?9@I5=6:CI<0AA9338+54)    XA:i:1  MD:Z:8T26T0   NM:i:2
SRR005718.2570:1:1:169:57#0     83      chr22   17075495        255     36M     =       17075497        38      TTCAAGCAATTATCCTGCCTCAGCCTCCTGAGTAGC    H'4IA0IIIIIIAIII<IIIIIIIIIIIIIIIIIII    XA:i:2  MD:Z:11C2T21  NM:i:2
SRR005718.2570:1:1:169:57#0     163     chr22   17075497        255     36M     =       17075495        -38     CAAGCAATTCTCTTGCCCCAGCCTCCTGAGTAGCTG    IIIIIIIIIIIIIIIIIIIIIIIIIIII-I>IIIII    XA:i:1  MD:Z:17T18    NM:i:1






TEST USING -rf, -fr AND -ff ON 3.3 BILLION READS
------------------------------------------------

TESTS
-----
(NB: MUST RUN ON EXECUTION NODES BECAUSE OF MEMORY LIMIT ON USER NODES)

mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params
mkdir rf fr ff 

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params

-rf 
---

rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/bowtie.sh

emacs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/bowtie.sh
#!/bin/sh

#BSUB -J maq-rf
#BSUB -W 24:00
#BSUB -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/bowtie.out
#BSUB -e /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/bowtie.err

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--sam \
--threads 1 \
--rf \
--al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/aligned.txt \
--un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/unaligned.txt \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
-1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt \
-2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf/out.sam


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/rf
bsub -q large bowtie.sh 

    Job <2225059> is submitted to queue <large>.
    Thu Nov  4 12:36:59 EDT 2010




-fr 
---

rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.sh

emacs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.sh
#!/bin/sh

#BSUB -J maq-fr
#BSUB -W 24:00
#BSUB -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.out
#BSUB -e /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.err

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--sam \
--threads 1 \
--fr \
--al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/aligned.txt \
--un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/chr22/1/unaligned.txt \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
-1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt \
-2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/out.sam \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.out

tail -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr/bowtie.out
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/fr

bsub -q large bowtie.sh 

    Job <2225078> is submitted to queue <large>.
    Thu Nov  4 12:59:22 EDT 2010



-ff 
---

rm -fr /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.sh

emacs /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.sh
#!/bin/sh

#BSUB -J maq-ff
#BSUB -W 24:00
#BSUB -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.out
#BSUB -e /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.err

time /nethome/bioinfo/apps/BOWTIE/0.12.2/bowtie \
--sam \
--threads 1 \
--ff \
--al /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/aligned.txt \
--un /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/unaligned.txt \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/bowtie/chr22/chr22 \
-1 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_1.1.txt \
-2 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/1/1/bowtie-autochr22-1_2.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/out.sam \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.out



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff
bsub -q large bowtie.sh 

    Job <2225079> is submitted to queue <large>.
    Thu Nov  4 12:59:51 EDT 2010



tail -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/params/ff/bowtie.out



</entry>

<entry [Sun Oct 31 01:36:20 EDT 2010] RAN snpVenn.pl ON ELAND CUMULATIVE hit.snp FILES: 1) ALL AGAINST LAST, AND 2) NEIGHBOURS>


1. ALL AGAINST LAST

mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/snpvenn
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/elan d/cumulative-5/snpvenn

/nethome/bioinfo/apps/agua/0.5/bin/apps/snp/snpVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-1.snp \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/chr22/hit-33.snp \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/snpvenn \
--querylabel eland \
--targetlabel bowtie








</entry>

<entry [Sun Oct 31 01:35:20 EDT 2010] RERUN NOVOALIGN WITH '-r All 1' SETTING TO REPORT ONLY SINGLE BEST HIT>


NB: Li Heng APPROVES OF NOVOALIGN AS 'MOST ACCURATE ALIGNER TO DATE':
http://lh3lh3.users.sourceforge.net/NGSalign.shtml



FIRST ROUND (2-16) (1 ALREADY DONE IN TEST ABOVE)
-------------------------------------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign

screen -S loop1-novo

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/NOVOALIGN.pl \
--replicates 2-16 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
--loop parallel \
--params "-r All 1" \
--distance 200 \
--deviation 50 \
--species human \
--label novoalign-chr22-%REPLICATE% \
--maxjobs 1000 \
--queue large \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/novoalign.out 
    
    Run time: 06:23:35
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:29AM, 5 November 2010
    ****************************************


time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/16/novoalign-chr22-16_1.16.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp\
/chr22/novoalign/1/16/novoalign-chr22-16_2.16.txt  > /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/16/chr22/16/out.sam





FIRST ROUND (17-33) (1 ALREADY DONE IN TEST ABOVE)
-------------------------------------------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign

screen -S loop2-novo

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/NOVOALIGN.pl \
--replicates 17-33 \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--reference /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE% \
--loop parallel \
--params "-r All 1" \
--distance 200 \
--deviation 50 \
--species human \
--label novoalign-chr22-%REPLICATE% \
--maxjobs 1000 \
--queue large \
--cluster LSF \
--walltime 24 \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/%REPLICATE%/novoalign.out 

    
    Run time: 06:41:40
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:53AM, 5 November 2010
    ****************************************








TEST PARAMETERS
---------------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM -r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/out.sam




CREATE 1000 READ CHOPFILE AND TEST WITH DIFFERENT PARAMETERS
------------------------------------------------------------

INPUTFILES

chopfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_1.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt 1000

chopfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_2.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt 1000

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1
ll *1000*txt

    -rw-rw-r-- 1 syoung root 34K Nov  3 17:42 novoalign-chr22-1-1000_1.1.txt
    -rw-rw-r-- 1 syoung root 34K Nov  3 17:42 novoalign-chr22-1-1000_2.1.txt


CREATE OUTPUT DIR
-----------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params

default
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.default.sam

    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 1,875s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m2.557s
    user    0m2.011s
    sys     0m0.455s

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.default.sam

    out.default.sam: 253




r-all-1 (Reports at most 1 randomly selected alignment.)
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.r-all-1.sam

    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 2,047s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m21.967s
    user    0m2.146s
    sys     0m1.179s

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.r-all-1.sam

    253


-r Random
---------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r Random \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.r-random-1.sam

    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 1,916s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m2.658s
    user    0m2.070s
    sys     0m0.559s

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.r-random-1.sam

    253


-r All (Reports all alignments with a score within 5 points of the best alignment.)
------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.r-all.sam

    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 1,996s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m2.961s
    user    0m2.117s
    sys     0m0.515s


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.r-all.sam

    363


-r None
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r None \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.r-none.sam
    
    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 1,922s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m2.501s
    user    0m2.037s
    sys     0m0.403s


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.r-none.sam

    out.r-none.sam: 253



CONVERT ALL TO hit.default.sam FILES



FILE                  HITS
out.default.sam       253
out.r-all-1.sam       253
out.r-random-1.sam    253
out.r-all.sam         363
out.r-none.sam        253


FILE                  HITS
hit.default.sam        12
hit.r-all-1.sam        30
hit.r-random-1.sam     30
hit.r-all.sam         140
hit.r-none.sam         12



grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 > hit.default.sam

    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222

grep SRR out.r-all-1.sam  | grep chr22 | cut -f 1,3,4 > hit.r-all-1.sam
    
    SRR002271.570:1:1:779:826#0/1   chr22   38259792
    SRR002271.923:1:1:772:358#0/1   chr22   47742952
    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.1398:1:1:532:128#0/1  chr22   16695934
    SRR002271.1955:1:1:591:206#0/1  chr22   41959955
    SRR002271.2189:1:1:155:490#0/1  chr22   28951565
    SRR002271.2368:1:1:802:857#0/1  chr22   25600436
    SRR002271.2883:1:1:413:806#0/1  chr22   33339112
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3445:1:1:604:502#0/1  chr22   42877487
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.3943:1:1:72:114#0/1   chr22   34682734
    SRR002271.4085:1:1:647:369#0/1  chr22   28987010
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4485:1:1:381:110#0/1  chr22   32567764
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.4897:1:1:420:124#0/1  chr22   16584291
    SRR002271.5098:1:1:851:448#0/1  chr22   36468412
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5799:1:1:525:262#0/1  chr22   46489509
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7687:1:1:584:597#0/1  chr22   25587389
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222
    SRR002271.8237:1:1:828:242#0/1  chr22   50005573
    SRR002271.8419:1:1:867:234#0/1  chr22   22633911
    SRR002271.8554:1:1:827:210#0/1  chr22   28785897

grep SRR out.r-random-1.sam  | grep chr22 | cut -f 1,3,4 > hit.r-random-1.sam

    SRR002271.570:1:1:779:826#0/1   chr22   26241205
    SRR002271.923:1:1:772:358#0/1   chr22   22407093
    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.1398:1:1:532:128#0/1  chr22   28785350
    SRR002271.1955:1:1:591:206#0/1  chr22   21911927
    SRR002271.2189:1:1:155:490#0/1  chr22   28951565
    SRR002271.2368:1:1:802:857#0/1  chr22   25748980
    SRR002271.2883:1:1:413:806#0/1  chr22   17142920
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3445:1:1:604:502#0/1  chr22   18590959
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.3943:1:1:72:114#0/1   chr22   34682734
    SRR002271.4085:1:1:647:369#0/1  chr22   39328110
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4485:1:1:381:110#0/1  chr22   32567764
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.4897:1:1:420:124#0/1  chr22   16548698
    SRR002271.5098:1:1:851:448#0/1  chr22   32897734
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5799:1:1:525:262#0/1  chr22   19826236
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7687:1:1:584:597#0/1  chr22   29289752
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222
    SRR002271.8237:1:1:828:242#0/1  chr22   41296466
    SRR002271.8419:1:1:867:234#0/1  chr22   34948411
    SRR002271.8554:1:1:827:210#0/1  chr22   28785897

grep SRR out.r-all.sam  | grep chr22 | cut -f 1,3,4 > hit.r-all.sam

    SRR002271.570:1:1:779:826#0/1   chr22   38259792
    SRR002271.570:1:1:779:826#0/1   chr22   26241205
    SRR002271.923:1:1:772:358#0/1   chr22   47742952
    SRR002271.923:1:1:772:358#0/1   chr22   22528592
    SRR002271.923:1:1:772:358#0/1   chr22   28564372
    SRR002271.923:1:1:772:358#0/1   chr22   39613521
    SRR002271.923:1:1:772:358#0/1   chr22   22407093
    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.1398:1:1:532:128#0/1  chr22   16695934
    SRR002271.1398:1:1:532:128#0/1  chr22   28483107
    SRR002271.1398:1:1:532:128#0/1  chr22   28732346
    SRR002271.1398:1:1:532:128#0/1  chr22   17144848
    SRR002271.1398:1:1:532:128#0/1  chr22   16996076
    SRR002271.1398:1:1:532:128#0/1  chr22   28785350
    SRR002271.1398:1:1:532:128#0/1  chr22   28436183
    SRR002271.1398:1:1:532:128#0/1  chr22   32693160
    SRR002271.1398:1:1:532:128#0/1  chr22   49384097
    SRR002271.1398:1:1:532:128#0/1  chr22   22633695
    SRR002271.1398:1:1:532:128#0/1  chr22   35565255
    SRR002271.1398:1:1:532:128#0/1  chr22   28433113
    SRR002271.1398:1:1:532:128#0/1  chr22   29062745
    SRR002271.1398:1:1:532:128#0/1  chr22   28563269
    SRR002271.1398:1:1:532:128#0/1  chr22   35188286
    SRR002271.1398:1:1:532:128#0/1  chr22   34948195
    SRR002271.1398:1:1:532:128#0/1  chr22   35216377
    SRR002271.1955:1:1:591:206#0/1  chr22   41959955
    SRR002271.1955:1:1:591:206#0/1  chr22   21911927
    SRR002271.2189:1:1:155:490#0/1  chr22   28951565
    SRR002271.2189:1:1:155:490#0/1  chr22   32433701
    SRR002271.2368:1:1:802:857#0/1  chr22   25600436
    SRR002271.2368:1:1:802:857#0/1  chr22   25748980
    SRR002271.2883:1:1:413:806#0/1  chr22   33339112
    SRR002271.2883:1:1:413:806#0/1  chr22   29060816
    SRR002271.2883:1:1:413:806#0/1  chr22   35214446
    SRR002271.2883:1:1:413:806#0/1  chr22   17481976
    SRR002271.2883:1:1:413:806#0/1  chr22   16442427
    SRR002271.2883:1:1:413:806#0/1  chr22   34950121
    SRR002271.2883:1:1:413:806#0/1  chr22   17248528
    SRR002271.2883:1:1:413:806#0/1  chr22   35146060
    SRR002271.2883:1:1:413:806#0/1  chr22   25739275
    SRR002271.2883:1:1:413:806#0/1  chr22   22635623
    SRR002271.2883:1:1:413:806#0/1  chr22   49386026
    SRR002271.2883:1:1:413:806#0/1  chr22   35563328
    SRR002271.2883:1:1:413:806#0/1  chr22   28787277
    SRR002271.2883:1:1:413:806#0/1  chr22   17142920
    SRR002271.2883:1:1:413:806#0/1  chr22   47745748
    SRR002271.2883:1:1:413:806#0/1  chr22   32695089
    SRR002271.2883:1:1:413:806#0/1  chr22   40238189
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3445:1:1:604:502#0/1  chr22   42877487
    SRR002271.3445:1:1:604:502#0/1  chr22   18590959
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.3943:1:1:72:114#0/1   chr22   34682734
    SRR002271.3943:1:1:72:114#0/1   chr22   43707514
    SRR002271.3943:1:1:72:114#0/1   chr22   16984517
    SRR002271.3943:1:1:72:114#0/1   chr22   29212200
    SRR002271.4085:1:1:647:369#0/1  chr22   28987010
    SRR002271.4085:1:1:647:369#0/1  chr22   39328110
    SRR002271.4085:1:1:647:369#0/1  chr22   29527533
    SRR002271.4085:1:1:647:369#0/1  chr22   31020030
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4485:1:1:381:110#0/1  chr22   32567764
    SRR002271.4485:1:1:381:110#0/1  chr22   36524009
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.4897:1:1:420:124#0/1  chr22   16584291
    SRR002271.4897:1:1:420:124#0/1  chr22   16516478
    SRR002271.4897:1:1:420:124#0/1  chr22   16549321
    SRR002271.4897:1:1:420:124#0/1  chr22   16548698
    SRR002271.5098:1:1:851:448#0/1  chr22   36468412
    SRR002271.5098:1:1:851:448#0/1  chr22   46169601
    SRR002271.5098:1:1:851:448#0/1  chr22   32897734
    SRR002271.5098:1:1:851:448#0/1  chr22   43441580
    SRR002271.5098:1:1:851:448#0/1  chr22   21268241
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5799:1:1:525:262#0/1  chr22   46489509
    SRR002271.5799:1:1:525:262#0/1  chr22   22779525
    SRR002271.5799:1:1:525:262#0/1  chr22   41248001
    SRR002271.5799:1:1:525:262#0/1  chr22   27525796
    SRR002271.5799:1:1:525:262#0/1  chr22   32760553
    SRR002271.5799:1:1:525:262#0/1  chr22   19853990
    SRR002271.5799:1:1:525:262#0/1  chr22   37528028
    SRR002271.5799:1:1:525:262#0/1  chr22   28993970
    SRR002271.5799:1:1:525:262#0/1  chr22   24702129
    SRR002271.5799:1:1:525:262#0/1  chr22   28934330
    SRR002271.5799:1:1:525:262#0/1  chr22   30426972
    SRR002271.5799:1:1:525:262#0/1  chr22   19826236
    SRR002271.5799:1:1:525:262#0/1  chr22   35532347
    SRR002271.5799:1:1:525:262#0/1  chr22   38107314
    SRR002271.5799:1:1:525:262#0/1  chr22   30507203
    SRR002271.5799:1:1:525:262#0/1  chr22   43112092
    SRR002271.5799:1:1:525:262#0/1  chr22   24393120
    SRR002271.5799:1:1:525:262#0/1  chr22   41580107
    SRR002271.5799:1:1:525:262#0/1  chr22   45137492
    SRR002271.5799:1:1:525:262#0/1  chr22   29564051
    SRR002271.5799:1:1:525:262#0/1  chr22   20949782
    SRR002271.5799:1:1:525:262#0/1  chr22   39000912
    SRR002271.5799:1:1:525:262#0/1  chr22   36698422
    SRR002271.5799:1:1:525:262#0/1  chr22   45239437
    SRR002271.5799:1:1:525:262#0/1  chr22   40904242
    SRR002271.5799:1:1:525:262#0/1  chr22   43571948
    SRR002271.5799:1:1:525:262#0/1  chr22   34852363
    SRR002271.5799:1:1:525:262#0/1  chr22   18558166
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7687:1:1:584:597#0/1  chr22   25587389
    SRR002271.7687:1:1:584:597#0/1  chr22   29289752
    SRR002271.7687:1:1:584:597#0/1  chr22   30927428
    SRR002271.7687:1:1:584:597#0/1  chr22   23713813
    SRR002271.7687:1:1:584:597#0/1  chr22   38095814
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222
    SRR002271.8237:1:1:828:242#0/1  chr22   50005573
    SRR002271.8237:1:1:828:242#0/1  chr22   45609747
    SRR002271.8237:1:1:828:242#0/1  chr22   45019110
    SRR002271.8237:1:1:828:242#0/1  chr22   19151903
    SRR002271.8237:1:1:828:242#0/1  chr22   31117070
    SRR002271.8237:1:1:828:242#0/1  chr22   44562116
    SRR002271.8237:1:1:828:242#0/1  chr22   16454089
    SRR002271.8237:1:1:828:242#0/1  chr22   41296466
    SRR002271.8237:1:1:828:242#0/1  chr22   42162021
    SRR002271.8237:1:1:828:242#0/1  chr22   42055815
    SRR002271.8419:1:1:867:234#0/1  chr22   22633911
    SRR002271.8419:1:1:867:234#0/1  chr22   49384313
    SRR002271.8419:1:1:867:234#0/1  chr22   29062529
    SRR002271.8419:1:1:867:234#0/1  chr22   16359304
    SRR002271.8419:1:1:867:234#0/1  chr22   17508407
    SRR002271.8419:1:1:867:234#0/1  chr22   28785566
    SRR002271.8419:1:1:867:234#0/1  chr22   28482891
    SRR002271.8419:1:1:867:234#0/1  chr22   17144632
    SRR002271.8419:1:1:867:234#0/1  chr22   28432900
    SRR002271.8419:1:1:867:234#0/1  chr22   17250241
    SRR002271.8419:1:1:867:234#0/1  chr22   34948411
    SRR002271.8419:1:1:867:234#0/1  chr22   28563052
    SRR002271.8554:1:1:827:210#0/1  chr22   28785897
    SRR002271.8554:1:1:827:210#0/1  chr22   47744598
    SRR002271.8554:1:1:827:210#0/1  chr22   25737891
    SRR002271.8554:1:1:827:210#0/1  chr22   16480575
    SRR002271.8554:1:1:827:210#0/1  chr22   24008213

grep SRR out.r-none.sam  | grep chr22 | cut -f 1,3,4 > hit.r-none.sam

    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222



COMPARE OUTPUT FILES WITH samVenn.pl

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.default.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel default 


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-all-1.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel r-all-1 


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-random-1.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel r-random-1 


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-all.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel r-all 



perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.default.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel default 



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params

lines venn/*

    none-AND-r-all-1: 12
    none-NOT-r-all-1: 0
    r-all-1-NOT-none: 18

    none-AND-r-random-1: 12
    none-NOT-r-random-1: 0
    r-random-1-NOT-none: 18

    none-AND-r-all: 12
    none-NOT-r-all: 0
    r-all-NOT-none: 128


RUN 'none' IS IDENTICAL TO DEFAULT NOVOALIGN SETTINGS:

    none-AND-default: 12
    none-NOT-default: 0
    default-NOT-none: 0


lines hit*sam

    hit.r-all-1.sam: 30
    hit.r-all.sam: 140
    hit.r-none.sam: 12
    hit.r-random-1.sam: 30


lines out*sam

out.r-all-1.sam: 253
out.r-all.sam: 363
out.r-exhaustive-1.sam: 0
out.r-exhaustive-t-1.sam: 0
out.r-none.sam: 253
out.r-random-1.sam: 253




REPEATED ABOVE BUT WITH BOTH PAIRED FILES
-----------------------------------------


CREATE OUTPUT DIR
-----------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired


default
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.default.sam


    #       Paired Reads:      250
    #      Pairs Aligned:       16
    #     Read Sequences:      500
    #            Aligned:       68
    #   Unique Alignment:       32
    #   Gapped Alignment:        2
    #     Quality Filter:        1
    # Homopolymer Filter:        0
    #       Elapsed Time: 25,048s
    # Fragment Length Distribution
    #       From    To      Count
    #       110     119     1
    #       120     129     0
    #       130     139     0
    #       140     149     0
    #       150     159     0
    #       160     169     0
    #       170     179     0
    #       180     189     2
    #       190     199     1
    #       200     209     1
    #       210     219     4
    #       220     229     0
    #       230     239     1
    # Mean   198, Std Dev  31.3
    # Done.
    
    real    0m25.418s
    user    0m25.141s
    sys     0m0.252s


r-all-1 (Reports at most 1 'randomly selected' alignment.)
-------

'randomly selected' ACCORDING TO:

http://www.novocraft.com/wiki/tiki-index.php?page=Reporting+Multiple+Alignments+per+Read&structure=Novocraft+Technologies&page_ref_id=41


time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.r-all-1.sam

    
    #       Paired Reads:      250
    #      Pairs Aligned:       16
    #     Read Sequences:      500
    #            Aligned:       68
    #   Unique Alignment:       32
    #   Gapped Alignment:        4
    #     Quality Filter:        1
    # Homopolymer Filter:        0
    #       Elapsed Time: 24,995s
    # Fragment Length Distribution
    #       From    To      Count
    #       110     119     1
    #       120     129     0
    #       130     139     0
    #       140     149     0
    #       150     159     0
    #       160     169     0
    #       170     179     0
    #       180     189     2
    #       190     199     1
    #       200     209     1
    #       210     219     4
    #       220     229     0
    #       230     239     1
    # Mean   198, Std Dev  31.3
    # Done.
    
    real    0m25.335s
    user    0m25.077s
    sys     0m0.239s
    

-r Random (Reports at most 1 randomly selected alignment.)
---------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r Random \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.r-random.sam
    
    #       Paired Reads:      250
    #      Pairs Aligned:       16
    #     Read Sequences:      500
    #            Aligned:       68
    #   Unique Alignment:       32
    #   Gapped Alignment:        4
    #     Quality Filter:        1
    # Homopolymer Filter:        0
    #       Elapsed Time: 24,945s
    # Fragment Length Distribution
    #       From    To      Count
    #       110     119     1
    #       120     129     0
    #       130     139     0
    #       140     149     0
    #       150     159     0
    #       160     169     0
    #       170     179     0
    #       180     189     2
    #       190     199     1
    #       200     209     1
    #       210     219     4
    #       220     229     0
    #       230     239     1
    # Mean   198, Std Dev  31.3
    # Done.
    
    real    0m25.330s
    user    0m25.027s
    sys     0m0.269s


-r All
------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.r-all.sam
        
    #       Paired Reads:      250
    #      Pairs Aligned:       16
    #     Read Sequences:      500
    #            Aligned:       68
    #   Unique Alignment:       32
    #   Gapped Alignment:       12
    #     Quality Filter:        1
    # Homopolymer Filter:        0
    #       Elapsed Time: 24,997s
    # Fragment Length Distribution
    #       From    To      Count
    #       110     119     1
    #       120     129     0
    #       130     139     0
    #       140     149     0
    #       150     159     0
    #       160     169     0
    #       170     179     0
    #       180     189     2
    #       190     199     1
    #       200     209     1
    #       210     219     4
    #       220     229     0
    #       230     239     1
    # Mean   198, Std Dev  31.3
    # Done.
    
    real    0m25.352s
    user    0m25.099s
    sys     0m0.242s

-r None
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r None \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.r-none.sam






CONVERT ALL TO hit.default.sam FILES

grep SRR out.default.sam  | grep chr22 > hit.default.sam
grep SRR out.r-all-1.sam  | grep chr22 > hit.r-all-1.sam
grep SRR out.r-all.sam  | grep chr22 > hit.r-all.sam
grep SRR out.r-random.sam  | grep chr22 > hit.r-random.sam
grep SRR out.r-none.sam  | grep chr22 > hit.r-none.sam



grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 
grep SRR out.r-all-1.sam  | grep chr22 | cut -f 1,3,4 
grep SRR out.r-all.sam  | grep chr22 | cut -f 1,3,4 
grep SRR out.r-random.sam  | grep chr22 | cut -f 1,3,4 
grep SRR out.r-none.sam  | grep chr22 | cut -f 1,3,4 



FILE                HITS
hit.default.sam		 42
hit.r-all-1.sam		 92
hit.r-all.sam		602
hit.r-none.sam		 42
hit.r-random.sam	 92



grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 > hit.default.sam
 

LARGE DEGREE OF READ RECRUITMENT IN HITS USING PAIRED ENDS:

grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 

    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222

cd paired
grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 

    SRR002271.570:1:1:779:826#0     chr22   49326746
    SRR002271.570:1:1:779:826#0     chr22   49326746
    SRR002271.1015:1:1:347:652#0    chr22   24362133
    SRR002271.1015:1:1:347:652#0    chr22   24362133
    SRR002271.1140:1:1:518:934#0    chr22   16849425
    SRR002271.1140:1:1:518:934#0    chr22   16849499
    SRR002271.1398:1:1:532:128#0    chr22   35565255
    SRR002271.1398:1:1:532:128#0    chr22   35565052
    SRR002271.2368:1:1:802:857#0    chr22   29618288
    SRR002271.2368:1:1:802:857#0    chr22   29618288
    SRR002271.2972:1:1:499:509#0    chr22   16859449
    SRR002271.2972:1:1:499:509#0    chr22   16859449
    SRR002271.3072:1:1:927:744#0    chr22   49980091
    SRR002271.3072:1:1:927:744#0    chr22   49979916
    SRR002271.3768:1:1:989:778#0    chr22   45840188
    SRR002271.3768:1:1:989:778#0    chr22   45840035
    SRR002271.4204:1:1:815:322#0    chr22   51081732
    SRR002271.4204:1:1:815:322#0    chr22   51081732
    SRR002271.4298:1:1:551:636#0    chr22   30487586
    SRR002271.4298:1:1:551:636#0    chr22   30487586
    SRR002271.4485:1:1:381:110#0    chr22   21074772
    SRR002271.4485:1:1:381:110#0    chr22   21074772
    SRR002271.4568:1:1:621:965#0    chr22   32639520
    SRR002271.4568:1:1:621:965#0    chr22   32639692
    SRR002271.4876:1:1:955:648#0    chr22   35633792
    SRR002271.4876:1:1:955:648#0    chr22   35633975
    SRR002271.5667:1:1:261:529#0    chr22   33569484
    SRR002271.5667:1:1:261:529#0    chr22   33569308
    SRR002271.5734:1:1:777:616#0    chr22   34915214
    SRR002271.5734:1:1:777:616#0    chr22   34915391
    SRR002271.5945:1:1:271:919#0    chr22   31903728
    SRR002271.5945:1:1:271:919#0    chr22   44008877
    SRR002271.6539:1:1:687:954#0    chr22   42458296
    SRR002271.6539:1:1:687:954#0    chr22   42458296
    SRR002271.7729:1:1:448:497#0    chr22   37659425
    SRR002271.7729:1:1:448:497#0    chr22   37659425
    SRR002271.7991:1:1:412:23#0     chr22   32449222
    SRR002271.7991:1:1:412:23#0     chr22   32449060
    SRR002271.8085:1:1:810:933#0    chr22   38739159
    SRR002271.8085:1:1:810:933#0    chr22   38739159
    SRR002271.8554:1:1:827:210#0    chr22   47744598
    SRR002271.8554:1:1:827:210#0    chr22   47744445





NOTES
-----



TEST RUN NOVOALIGN ON USER NODE
-------------------------------

screen -S test-novo

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_1.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_2.1.txt \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/out.sam



TOOK 24 HOURS TO COMPLETE!!!

    
    #       Paired Reads:  1000000
    #      Pairs Aligned:    98744
    #     Read Sequences:  2000000
    #            Aligned:   320587
    #   Unique Alignment:   183009
    #   Gapped Alignment:     7517
    #     Quality Filter:    38641
    # Homopolymer Filter:      548
    #       Elapsed Time: 86286,422s
    # Fragment Length Distribution
    #       From    To      Count
    #       30      39      323
    #       40      49      730
    #       50      59      470
    #       60      69      201
    #       70      79      152
    #       80      89      163
    #       90      99      131
    #       100     109     118
    #       110     119     130
    #       120     129     178
    #       130     139     208
    #       140     149     172
    #       150     159     226
    #       160     169     274
    #       170     179     677
    #       180     189     3362
    #       190     199     10613
    #       200     209     15173
    #       210     219     13673
    #       220     229     9330
    #       230     239     3651
    #       240     249     805
    #       250     259     321
    #       260     269     188
    #       270     279     132
    #       280     289     147
    #       290     299     137
    #       300     309     114
    #       310     319     104
    #       320     329     94
    #       330     339     83
    #       340     349     70
    #       350     359     87
    #       360     369     111
    #       370     379     107
    #       380     389     82
    #       390     399     86
    #       400     409     97
    #       410     419     89
    #       420     429     20
    #       430     439     33
    #       440     449     15
    #       450     459     2
    #       460     469     28
    #       470     479     9
    #       480     489     46
    #       490     499     57
    # Mean   207, Std Dev  42.6
    # Done.
    
    real    1438m12.220s
    user    1434m10.055s
    sys     2m18.045s



SAM FILE READ PAIR INFO IN FLAG FIELD
-------------------------------------


E.G.: NOVOALIGN hit.sam FILE ENTRIES CONTAIN READ PAIR NUMBER INFORMATION IN THE FLAG FIELD (2nd COLUMN)

head -n 100 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/out.sam

    ... 
    SRR002271.1398:1:1:532:128#0    83      chr22   35565255        12      36M     =       35565052 -239     CCTATCAATAGAAAAAGAGGGAATCCTCCCTAACTC    2*/I0,IIIIIIIIIIIIIIIIIFIIIIIIIIIIII    PG:Z:novoalign    AS:i:21 UQ:i:21 NM:i:1  MD:Z:2A33       PQ:i:21 SM:i:0  AM:i:0
    SRR002271.1398:1:1:532:128#0    163     chr22   35565052        12      36M     =       35565255 239      AATGGATAAATTCCTTGACACATACACCCTCCCAAG    IIIIIIIIIIIIIIIIII=IIIII1III;77II4+F    PG:Z:novoalign    AS:i:0  UQ:i:0  NM:i:0  MD:Z:36 PQ:i:21 SM:i:0  AM:i:0
    ... 



SAM FORMAT
----------


The alignment section consists of multiple TAB-delimited lines with each line describing an alignment. Each line is:

    <QNAME> <FLAG> <RNAME> <POS> <MAPQ> <CIGAR> <MRNM> <MPOS> <ISIZE> <SEQ> <QUAL> \
    [<TAG>:<VTYPE>:<VALUE> [...]]

The format of each field is explained in the following table. More detailed descriptions are given in the sections below.

Field Regular expression Range Description

    QNAME [^ \t\n\r]+ Query pair NAME if paired; or Query NAME if unpaired 2
    FLAG [0-9]+ [0,216-1] bitwise FLAG (Section 2.2.2)
    RNAME [^ \t\n\r@=]+ Reference sequence NAME 3
    POS [0-9]+ [0,229-1] 1-based leftmost POSition/coordinate of the clipped sequence
    MAPQ [0-9]+ [0,28-1] MAPping Quality (phred-scaled posterior probability that the mapping
    position of this read is incorrect) 4
    CIGAR ([0-9]+[MIDNSHP])+|\* extended CIGAR string
    MRNM [^ \t\n\r@]+ Mate Reference sequence NaMe; “=” if the same as <RNAME> 3
    MPOS [0-9]+ [0,229-1] 1-based leftmost Mate POSition of the clipped sequence
    ISIZE -?[0-9]+ [-229,229] inferred Insert SIZE 5
    SEQ [acgtnACGTN.=]+|\* query SEQuence; “=” for a match to the reference; n/N/. for ambiguity;
    cases are not maintained 6,7
    QUAL [!-~]+|\* [0,93] query QUALity; ASCII-33 gives the Phred base quality 6,7
    TAG [A-Z][A-Z0-9] TAG
    VTYPE [AifZH] Value TYPE
    VALUE [^\t\n\r]+ match <VTYPE> (space allowed)

Notes:

1. QNAME and FLAG are required for all alignments. If the mapping position of the query is not available, RNAME and
CIGAR are set as “*”, and POS and MAPQ as 0. If the query is unpaired or pairing information is not available, MRNM
equals “*”, and MPOS and ISIZE equal 0. SEQ and QUAL can both be absent, represented as a star “*”. If QUAL is
not a star, it must be of the same length as SEQ.
2. The name of a pair/read is required to be unique in the SAM file, but one pair/read may appear multiple times in
different alignment records, representing multiple or split hits. The maximum string length is 254.
3. If SQ is present in the header, RNAME and MRNM must appear in an SQ header record.
4. Field MAPQ considers pairing in calculation if the read is paired. Providing MAPQ is recommended. If such a
calculation is difficult, 255 should be applied, indicating the mapping quality is not available.
5. If the two reads in a pair are mapped to the same reference, ISIZE equals the difference between the coordinate of
the 5?-end of the mate and of the 5?-end of the current read; otherwise ISIZE equals 0 (by the “5?-end” we mean the
5?-end of the original read, so for Illumina short-insert paired end reads this calculates the difference in mapping
coordinates of the outer edges of the original sequenced fragment). ISIZE is negative if the mate is mapped to a
smaller coordinate than the current read.
6. Color alignments are stored as normal nucleotide alignments with additional tags describing the raw color
sequences, qualities and color-specific properties (see also Note 5 in section 2.2.4).
7. All mapped reads are represented on the forward genomic strand. The bases are reverse complemented from the
unmapped read sequence and the quality scores and cigar strings are recorded consistently with the bases. This
applies to information in the mate tags (R2, Q2, S2, etc.) and any other tags that are strand sensitive. The strand
bits in the flag simply indicates whether this reverse complement transform was applied from the original read
sequence to obtain the bases listed in the SAM file.



2.2.2. The <flag> field
Field <flag> is a bitwise flag. The meaning of predefined bits is shown in the following table:


Flag Description

0x0001 the read is paired in sequencing, no matter whether it is mapped in a pair
0x0002 the read is mapped in a proper pair (depends on the protocol, normally inferred during alignment) 1
0x0004 the query sequence itself is unmapped
0x0008 the mate is unmapped 1
0x0010 strand of the query (0 for forward; 1 for reverse strand)
0x0020 strand of the mate 1
0x0040 the read is the first read in a pair 1,2
0x0080 the read is the second read in a pair 1,2
0x0100 the alignment is not primary (a read having split hits may have multiple primary alignment records)
0x0200 the read fails platform/vendor quality checks
0x0400 the read is either a PCR duplicate or an optical duplicate

Notes:
1. Flag 0x02, 0x08, 0x20, 0x40 and 0x80 are only meaningful when flag 0x01 is present.
2. If in a read pair the information on which read is the first in the pair is lost in the upstream analysis, flag 0x01 should
be present and 0x40 and 0x80 are both zero.


SAM TAGS
--------

What are TAGs?
TAGs are optional fields on a SAM/BAM Alignment. A TAG is comprised of a two character TAG key, they type of the value, and the value:

[A-Za-z][A-za-z]:[AifZH]:.*

The types, A, i, f, Z, H are used to indicate the type of value stored in the tag.

		Type	Description
		A	character
		i	signed 32-bit integer
		f	single-precision float
		Z	string
		H	hex string

There are a set of predefined tags that are general used in Alignments. They are documented in the SAM Specification.

Predefined tags have been specified for storing information about the read or alignment. Examples of things stored in predefined tags:

Previous settings for various fields if they have been updated due to additional processing
Mappings from the alignment to Header values, used to match to a read group or program.

Additional information which may already be in the header like library and platform.

A user can also use any additional tags to store any information they want. TAGs starting with X, Y, or Z are reserved to be user defined.



Examples:

XT:A:U  - user defined tag called XT.  It holds a character.  The value associated with this tag is 'U'.
NM:i:2  - predefined tag NM means: Edit distance to the reference (number of changes necessary to make this equal the reference, excluding clipping)




SAM TAGS:

AM	i	Smaller single-end mapping quality of the two reads in a pair
AS	i	Alignment score generated by aligner
CC	Z	Reference name of the next hit; “=” for the same chromosome
CM	i	Number of color differences 2
CP	i	Leftmost coordinate of the next hit
CQ	Z	Color read quality on the same strand as the reference; encoded in the same way as <QUAL> 4
CS	Z	Color read sequence on the same strand as the reference 4
E2	Z	The 2nd most likely base base call.
H0	i	Number of perfect hits 2
H1	i	Number of 1-difference hits (an in/del counted as a difference) 2
H2	i	Number of 2-difference hits (an in/del counted as a difference) 2
HI	i	"Query hit index, indicating the alignment record is the i-th one stored in SAM"
IH	i	Number of stored alignments in SAM that contains the query in the current record
LB	Z	Library. Value should be consistent with the header RG-LB tag if @RG is present.
MD	Z	"String for mismatching positions in the format of [0-9]+(([ACGTN]|\^[ACGTN]+)[0-9]+)* 2,3"
MF	i	MAQ pair flag (MAQ specific)
MQ	i	The mapping quality score the mate alignment
NH	i	Number of reported alignments that contains the query in the current record
NM	i	Number of nucleotide differences (i.e. edit distance to the reference sequence) 2
OQ	Z	Original base quality. Encoded in the same wasy as QUAL.
PG	Z	Program that generates the alignment; match the header PG-ID tag if @PG is present.
PQ	i	"Phred likelihood of the read pair, conditional on both the mapping locations being correct 5"
PU	Z	Platform unit. Value should be consistent with the header RG-PU tag if @RG is present.
Q2	Z	Phred quality for the mate (encoding is the same as <QUAL>).
R2	Z	Sequence of the mate.
RG	Z	Read group. Value matches the header RG-ID tag if @RG is present in the header.
S2	H	Encoded base probabilities for the other 3 bases for the mate-pair read. Same encoding as SQ 1
SA	M	TAGS:
SM	i	Mapping quality if the read is mapped as a single read rather than as a read pair
SQ	H	Encoded base probabilities for the suboptimal bases at each position (deprecated by E2 and U2) 1
Ta	g	Type Description
U2	Z	Phred-scaled log-lk ratio of the 2nd to the 3rd most likely base calls. Encoding is the same as QUAL.
UQ	i	"Phred likelihood of the read sequence, conditional on the mapping location being correct 5"
X?	?	Reserved fields for end users (together with Y? and Z?)



What Information is in the SAM/BAM Header

The SAM/BAM header is not required, but if it is there, it contains generic information for the SAM/BAM file.
The header may contain the version information for the SAM/BAM file and information regarding whether or not and how the file is sorted.
It also contains supplemental information for alignment records like information about the reference sequences, the processing that was used to generate the various reads in the file, and the programs that have been used to process the different reads. The alignment records may then point to this supplemental information identifying which ones the specific alignment is associated with.
For example, a group of reads in the SAM/BAM file may all be assigned to the same reference sequence. Rather than every alignment containing information about the reference sequence, this information is put in the header, and the alignment "points" to the appropriate reference sequence in the header via the RNAME field. The header contains generic information about this reference like its length.

The SAM/BAM Header also may contain comments which are free-form text lines that can contain any information.

Header lines start with an '@'.

Example SAM

Example Header Lines
@HD	VN:1.0	SO:coordinate
@SQ	SN:1	LN:249250621	AS:NCBI37	UR:file:/data/local/ref/GATK/human_g1k_v37.fasta	M5:1b22b98cdeb4a9304cb5d48026a85128
@SQ	SN:2	LN:243199373	AS:NCBI37	UR:file:/data/local/ref/GATK/human_g1k_v37.fasta	M5:a0d9851da00400dec1098a9255ac712e
@SQ	SN:3	LN:198022430	AS:NCBI37	UR:file:/data/local/ref/GATK/human_g1k_v37.fasta	M5:fdfd811849cc2fadebc929bb925902e5
@RG	ID:UM0098:1	PL:ILLUMINA	PU:HWUSI-EAS1707-615LHAAXX-L001	LB:80	DT:2010-05-05T20:00:00-0400	SM:SD37743	CN:UMCORE
@RG	ID:UM0098:2	PL:ILLUMINA	PU:HWUSI-EAS1707-615LHAAXX-L002	LB:80	DT:2010-05-05T20:00:00-0400	SM:SD37743	CN:UMCORE
@PG	ID:bwa	VN:0.5.4
@PG	ID:GATK TableRecalibration	VN:1.0.3471	CL:Covariates=[ReadGroupCovariate, QualityScoreCovariate, CycleCovariate, DinucCovariate, TileCovariate], default_read_group=null, default_platform=null, force_read_group=null, force_platform=null, solid_recal_mode=SET_Q_ZERO, window_size_nqs=5, homopolymer_nback=7, exception_if_no_tile=false, ignore_nocall_colorspace=false, pQ=5, maxQ=40, smoothing=1
In the alignment examples below, you will see that the 2nd alignment maps back to the RG line with ID UM0098.1, and all of the alignments point back to the SQ line with SN:1 because their RNAME is 1.

Example Alignments
This is what the alignment section of a SAM file looks like:
1:497:R:-272+13M17D24M	113	1	497	37	37M	15	100338662	0	CGGGTCTGACCTGAGGAGAACTGTGCTCCGCCTTCAG	0;==-==9;>>>>>=>>>>>>>>>>>=>>>>>>>>>>	XT:A:U	NM:i:0	SM:i:37	AM:i:0	X0:i:1	X1:i:0	XM:i:0	XO:i:0	XG:i:0	MD:Z:37
19:20389:F:275+18M2D19M	99	1	17644	0	37M	=	17919	314	TATGACTGCTAATAATACCTACACATGTTAGAACCAT	>>>>>>>>>>>>>>>>>>>><<>>><<>>4::>>:<9	RG:Z:UM0098:1	XT:A:R	NM:i:0	SM:i:0	AM:i:0	X0:i:4	X1:i:0	XM:i:0	XO:i:0	XG:i:0	MD:Z:37
19:20389:F:275+18M2D19M	147	1	17919	0	18M2D19M	=	17644	-314	GTAGTACCAACTGTAAGTCCTTATCTTCATACTTTGT	;44999;499<8<8<<<8<<><<<<><7<;<<<>><<	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:4	X1:i:0	XM:i:0	XO:i:1	XG:i:2	MD:Z:18^CA19
9:21597+10M2I25M:R:-209	83	1	21678	0	8M2I27M	=	21469	-244	CACCACATCACATATACCAAGCCTGGCTGTGTCTTCT	<;9<<5><<<<><<<>><<><>><9>><>>>9>>><>	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:5	X1:i:0	XM:i:0	XO:i:1	XG:i:2	MD:Z:35
In this example, the fields are:
Field	Alignment 1	Alignment 2	Alignment 3	Alignment 4
QNAME	1:497:R:-272+13M17D24M	19:20389:F:275+18M2D19M	19:20389:F:275+18M2D19M	9:21597+10M2I25M:R:-209
FLAG	113	99	147	83
RNAME	1	1	1	1
POS	497	17644	17919	21678
MAPQ	37	0	0	0
CIGAR	37M	37M	18M2D19M	8M2I27M
MRNM/RNEXT	15	=	=	=
MPOS/PNEXT	100338662	17919	17644	21469
ISIZE/TLEN	0	314
SEQ	CGGGTCTGACCTGAGGAGAACTGTGCTCCGCCTTCAG	TATGACTGCTAATAATACCTACACATGTTAGAACCAT	GTAGTACCAACTGTAAGTCCTTATCTTCATACTTTGT	CACCACATCACATATACCAAGCCTGGCTGTGTCTTCT
QUAL	0;==-==9;>>>>>=>>>>>>>>>>>=>>>>>>>>>>	>>>>>>>>>>>>>>>>>>>><<>>><<>>4::>>:<9	;44999;499<8<8<<<8<<><<<<><7<;<<<>><<	<;9<<5><<<<><<<>><<><>><9>><>>>9>>><>
TAGs	XT:A:U	NM:i:0	SM:i:37	AM:i:0	X0:i:1	X1:i:0	XM:i:0	XO:i:0 XG:i:0	MD:Z:37	RG:Z:UM0098:1	XT:A:R	NM:i:0	SM:i:0	AM:i:0	X0:i:4 X1:i:0	XM:i:0	XO:i:0	XG:i:0	MD:Z:37	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:4	X1:i:0	XM:i:0 XO:i:1	XG:i:2	MD:Z:18^CA19	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:5	X1:i:0	XM:i:0	XO:i:1 XG:i:2	MD:Z:35

You should now be a SAM expert :-)





CHECK INSERT SIZE AND STANDARD DEVIATION
----------------------------------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/insertSize.pl \
--inputfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/reanalysis_1_export.txt \
--matefile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/reanalysis_2_export.txt \
--outputfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/insertsize.txt \
--lines 1000

    
    INSERT SIZE STATISTICS
    ----------------------
    inputfile  : /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/reanalysis_1_export.txt
    matefile   : /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/reanalysis_2_export.txt
    
    median: 1797
    sample standard deviation: 4976798.39148946
    reads: 10000
    mean: 1344462
    distance        count
    700     0
    800     0
    900     0
    1000    0
    1100    0
    1200    3
    1300    4
    1400    0
    1500    0
    1600    4
    1700    9
    1800    18
    1900    12
    2000    12
    2100    6
    2200    2
    2300    1
    2400    0
    2500    0
    2600    0
    2700    0






NOVOALIGN OPTIONS
-----------------


http://www.novocraft.com/wiki/tiki-index.php?page=Reporting+Multiple+Alignments+per+Read&structure=Novocraft+Technologies&page_ref_id=41

BY DEFAULT, NOVOALIGN DOES NOT REPORT ANY ALIGNMENT OTHER THAN THE BEST ALIGNMENT


http://www.novocraft.com/wiki/tiki-index.php?page=Novoalign%20command%20line%20Options

Options for reporting:

-o format	Specifies the report format. Native, Pairwise & SAM. Default is Native.

-R 99	Sets score difference between best and second best alignment for calling a repeat. Default 5.

-r strategy [limit]	Sets strategy for reporting repeats. 'None', 'Random', 'All', 'Exhaustive', or a posterior probability limit. Default None.
        An optional limit on the maximum number of alignments to report can also be set. Default is no limit. 
        When using the 'Exhaustive' option a limit and an alignment threshold must be set.

-Q 99	Sets lower limit on alignment quality for reporting. Default 0.

-e 999	Sets a limit on number of alignments for a single read. This limit applies to the number of alignments with score equal to that of the best alignment. Alignment process will stop when the limit is reached. Default 1000 in default report mode, off for other modes.

-q 9	Sets number of decimal places for quality score. Default zero.

-K [file]	Collects mismatch statistics for quality calibration by position in the read and called base quality. Mismatch counts are written to the named file after all reads are processed. When used with -k option the mismatch counts include any read from the input quality calibration file.




NOVOALIGN
Reporting Multiple Alignments per Read

http://www.novocraft.com/wiki/tiki-index.php?page=Reporting+Multiple+Alignments+per+Read&structure=Novocraft+Technologies&page_ref_id=41
      

Novoalign is quite flexible when it comes to reporting reads that have multiple alignment loci.

The default option is to report no locus if the posterior alignment probability of the best alignment is less than 0.7.
Other options are:
Randomly selecting a single alignment locus from the set loci. The probability of a locus being chosen is equal to it's posterior alignment probability. Behaviour is similar to MAQ & BWA.
Reporting all alignments where alignment score is within a certain range of the best alignment.
Reporting all alignments below a score threshold.
Reporting all alignment loci with posterior alignment probability over a user defined limit.

For above options that report multiple alignments you can also set a limit on the maximum number of alignment loci to report.

Command Line Options


-r method [limit] [-t threshold]


Sets the rules for handling of reads with multiple alignment locations.


Values are:-

Method	Limit	-t threshold	Description
None	NA	Optional	No alignments will be reported. The read will be reported as a type R with no alignment locations. A reporting "limit" should not be set.
Random	NA	Optional	A single alignment location is randomly chosen from amongst all the alignment results. A reporting "limit" should not be set.
All	Optional	Optional	All alignment locations are reported. The 'All' method can optionally specify a limit for the number of lines reported. e.g. '-r All 10' will report at most 10 randomly selected alignments.
Exhaustive	Required	Required	Reports all alignments with a alignment score, P(R|Ai) , less than or equal to the threshold. The 'Exhaustive' method requires that a limit for the number of lines reported. e.g. '-r E 10' will report at most 10 randomly selected alignments per read. This is to avoid situations where high copy number repeats result in reporting millions of alignments for a read. The alignment threshold (-t option) must be set when using the -r Exhaustive option.
0.99	NA	Optional	Posterior probability threshold. All alignments with posterior probability greater than the set value will be reported.


-R "99"


Specifies a score difference between first two alignments for reporting repeats. If the difference is less than this then the read is treated as aligning to a repeat and '-r method' applies. If the score difference is greater than this then the higher scoring alignment is reported as a unique alignment. Default is 5 and corresponds approximately to first alignment having a probability of 0.75 and the second a probability of 0.25.

The following table shows approximate alignment probabilities for different settings in case when two alignments have been found. If the posterior alignment probability of the first alignment is below the P(1st) value then the alignment will be classed as a repeat.

Score Difference	P(1st)	P(2nd)
5	0.760	0.240
10	0.909	0.091
20	0.990	0.010
30	0.999	0.001



Examples

novoalign -r Ex 10 -t 180 -d ...	 Reports up to 10 alignments per read having alignment score less than 180. If more than 10 alignments found then they are chosen randomly from the lowest scoring alignments.
novoalign -r All -d ...	            Reports all alignments with a score within 5 points of the best alignment.
novoalign -r All -R 30 -d ...	    Reports all alignments with a score within 30 points of the best alignment.
novoalign -r All 20 -R 30 -d ...	Reports no more than 20 alignments with a score within 30 points of the best alignment.
novoalign -r Random -R30 -d ...	    Reports a randomly selected alignment from all alignments with a score within 30 points of the best alignment. The probability of an alignment being selected is proportional to its posterior alignment probability.
novoalign -d ...	                Default reporting option is to report only unique alignments. A unique alignment has a posterior probability > 0.75
novoalign -r 0.05	                Reports all alignments with a posterior alignment probability greater than 0.05. This option is quite different in effect to the other options, if a read aligns to, say, 50 locations with same score then each will have a posterior probability of 0.02 and no alignments are reported. However, if it aligned to 10 locations with the same score then they would each have a probability of 0.1 and they would all be reported.



</entry>

<entry [Sun Oct 31 01:35:20 EDT 2010] RERUN MAQ WITH -C 1 SETTING>


ELAND -- ALREADY DONE (REPORTS UNIQUE HITS ONLY BY DEFAULT - *_export.txt)

BOWTIE -- ALREADY DONE (REPORTS UNIQUE HITS ONLY BY DEFAULT)
-k <int>
Report up to <int> valid alignments per read or pair (default: 1). Validity of alignments is determined by the alignment policy (combined effects of -n, -v, -l, and -e). If more than one valid alignment exists and the --best and --strata options are specified, then only those alignments belonging to the best alignment "stratum" will be reported. Bowtie is designed to be very fast for small -k but bowtie can become significantly slower as -k increases. 

MAQ -- RUNNING WITH -C 1 SETTING TO REPORT ONLY THE BEST HIT

Usage:   maq map [options] <out.map> <chr.bfa> <reads_1.bfq> [reads_2.bfq]

    -C INT      max number of hits to output. >512 for all 01 hits. [250]



COMPARE HITS:

MAQ WITH '-C 1'

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1
emacs -nw maq-chr22-stdout.txt

Running MAQ: time /nethome/bioinfo/apps/maq/0.7.1/maq match -C 1 /scratch/syoung/base/pipeline/SRA/\
NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/out.map /nethome/bioinfo/data/sequence/chromoso\
mes/human/hg19/maq/chr22/chr22.bfa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200b\
p/chr22/maq/1/1/maq-200bp-chr22-1_1.1.bfq /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampl\
ed/200bp/chr22/maq/1/1/maq-200bp-chr22-1_2.1.bfq  &> /scratch/syoung/base/pipeline/SRA/NA18507/SRP0\
00239/sampled/200bp/chr22/maq/1/chr22/1/maq-chr22-outerr.txt

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1
ll
    -rw-rw-rw-  1 syoung root  85M Oct 28 15:40 hit.sam

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1
head hit.sam
    
    SRR002272.6137443:2:77:867:590#0        85      chr22   14431654        0       *       *       0  GCTGCCTAGACAGAGCTGATTTATCAAGAAAGAGAT     &+'.&$+7511I4E+*.2.,4+I1D6IEIII;5IGI    MF:i:192
    SRR002272.6137443:2:77:867:590#0        153     chr22   14431654        0       36M     *       0  GCTCTGAATCCTGCTACCTGGAGGCTTCATCTACAT     "'%&)+%)"/+++-,-2(*10,2-'.628/I5I?I4    MF:i:64 AM:i:0  SM:i:0      NM:i:3  UQ:i:32 H0:i:0  H1:i:0
    SRR002272.203817:1:10:390:446#0 85      chr22   14431708        0       *       *       0       0  AGTTATGTTAACAGAGATTCTTTATAGAGGCAAATT     -+++6/04/I,5,;?+F<5D4II;IIFI?IIIIIII    MF:i:192
    SRR002272.203817:1:10:390:446#0 153     chr22   14431708 



MAQ DEFAULT 


cd /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1

Running MAQ: time /nethome/bioinfo/apps/maq/0.7.1/maq match /scratch/syoung/base/pipeline/SRA/NA1\
8507/SRP000239/sampled/200bp/autochr22/maq/1/chr22/1/out.map /nethome/bioinfo/data/sequence/chrom\
osomes/human/hg19/maq/chr22/chr22.bfa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled\
/200bp/autochr22/maq/1/1/maq-200bp-autochr22-1_1.1.bfq /scratch/syoung/base/pipeline/SRA/NA18507/\
SRP000239/sampled/200bp/autochr22/maq/1/1/maq-200bp-autochr22-1_2.1.bfq  &> /scratch/syoung/base/\
pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/1/chr22/1/maq-chr22-outerr.txt

cd /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1
ll

    -rw-rw-rw-+  1 syoung bioinfo  85M Oct  8 00:52 hit.sam

cd /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1
head hit.sam

    RR002271.11543377:3:120:694:964#0       69      chr22   14431781        0       *       *       0TTTATTTGGCTACAGTTAAGGATGTGCCCATGACAC     IIIIIIIIIDI<?8E&B3*BA)-6$&#%&&(%%&&%    MF:i:192
    RR002271.11543377:3:120:694:964#0       137     chr22   14431781        10      36M     *       0TGTTTAAATCTACCTATGATCTGGAAGTCCCTGCTT     :5;II<569*6-+51&0'%2.&')%&(&(&*(+'%*    MF:i:64 AM:i:0  SM:i:10   NM:i:4  UQ:i:39 H0:i:0  H1:i:0



CHECK INTERSECTION BETWEEN HITS:

MAQ WITH '-C 1'

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam.db
    
    indexReads.pl    Reads indexed: 499443
    bowtieIndex.pl    Run time: 00:01:48
    bowtieIndex.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl
    bowtieIndex.pl    11:20AM, 15 November 2010
    bowtieIndex.pl    ****************************************

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam.db
    
    499443
    
    real    0m4.535s
    user    0m3.026s
    sys     0m0.227s



MAQ WITH DEFAULT

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--inputfiles /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam \
--dbfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam.db
    
    indexReads.pl    Reads indexed: 499443
    bowtieIndex.pl    Run time: 00:01:51
    bowtieIndex.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl
    bowtieIndex.pl    11:20AM, 15 November 2010
    bowtieIndex.pl    ****************************************

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam.db

    499443
    
    real    0m3.307s
    user    0m3.044s
    sys     0m0.171s



MERGE DB FILES (WILL RESULT IN DUPLICATES IF THE HITS MATCH TO DIFFERENT LOCATIONS):

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit


/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/mergeIndexes.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam.db,/ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam.db \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit/1-hit.sam.merged.db

    mergeIndexes.pl    Run time: 00:00:18
    mergeIndexes.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/mergeIndexes.pl
    mergeIndexes.pl    12:14AM, 15 November 2010
    mergeIndexes.pl    ****************************************


CHECK NUMBER READS IN MERGED DB FILE:

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit/1-hit.sam.merged.db
    
    535864
    
    real    0m3.967s
    user    0m3.458s
    sys     0m0.258s




ALSO TRIED TO USE samVenn.pl BUT IT HUNG (SHORTAGE OF MEMORY MOST LIKELY):

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit \
--querylabel default \
--targetlabel onehit



SO CREATED indexVenn.pl:

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam.db \
--targetfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam.db \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit \
--querylabel default \
--targetlabel onehit









KILL ALREADY TERMINATED PROCESSES ON PEGASUS
--------------------------------------------


ps ax | awk ‘{ if ($NF == “”) print $1 }’ | xargs kill -9

PREVIOUS RUN
------------

PREVIOUS RUN OF 10 FILES GENERATED hit.sam FILES

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.sam

    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:06 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:08 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:03 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:08 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:05 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:01 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:07 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 9/chr22/hit.sam



SECOND ROUND
------------

screen -S loop-maq-1

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/MAQ.pl \
--replicates 26-33 \
--loop serial \
--params "-C 1" \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--species human \
--label maq-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/maq-200bp-chr22-%REPLICATE%.out 

    Run time: 17:49:07
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:10PM, 2 November 2010
    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.sam

    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:08 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:03 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:08 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:05 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:01 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:07 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 9/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:06 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 31 04:35 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 31 07:13 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 31 09:25 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 31 10:27 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 01:46 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 04:08 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 06:14 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 08:18 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 10:26 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 12:42 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 02:29 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 04:55 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 07:12 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 09:41 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 11:54 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 02:03 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 04:12 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 06:35 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 09:04 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 10:09 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 12:29 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 15:00 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 17:26 33/chr22/hit.sam



APPROXIMATELY 23 MILLION READS HAD HITS AGAINST chr22

lines 1/chr22/hit.sam

    1/chr22/hit.sam: 23,235,818



gzip SAM FILES
--------------

screen -S maq-gzip

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/gzipSamfile.pl \
--replicates 2-33 \
--loop distributed \
--reference chr22 \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--samfile hit.sam \
--label gzipSamfile \
--queue large \
--cluster LSF \
--cpus 1 \
--maxjobs 1000
        
    Run time: 00:17:22
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:30AM, 4 November 2010
    ****************************************


TEST SINGLE

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/gzipSamfile.pl \
--reference chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1 \
--samfile hit.sam \
--label maq-gzipSamfile \
--keep \
--queue small \
--cluster LSF \
--cpus 1 \
--maxjobs 1000 \
--clean




CALL SNPS
---------


mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/samToSnp
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/samToSnp

screen -S maq-snp

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop distributed \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/samToSnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToSnp.pl \
--reference chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--species human \
--samfile hit.sam \
--label samToSnp \
--keep \
--queue large \
--cluster LSF \
--cpus 1 \
--maxjobs 1000 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/samToSnp/samToSnp.stdout

    Run time: 00:12:43
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:27AM, 4 November 2010
    ****************************************


SINGLE TEST

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/samToSnp.pl \
--reference chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1 \
--species human \
--samfile hit.sam \
--label msq-samToSnp \
--keep \
--queue small \
--cluster LSF \
--cpus 1 \
--maxjobs 1000 \
--clean

    samToSnp.pl    Run time: 00:06:41
    samToSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/samToSnp.pl
    samToSnp.pl    10:27AM, 4 November 2010
    samToSnp.pl    ****************************************

    OK


OUTPUT FILES (NOTE FILE 33 IS SHORT):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.snp

    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 7/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 9/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:21 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 420K Nov  4 11:18 33/chr22/hit.snp



CUMULATIVE SNPS
---------------


mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative

screen -S maq-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--species human \
--zipped gzip \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out



STOPPED AT FILE 23 BECAUSE OF PEGASUS SHUTDOWN:

tail /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out

    ....
    cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22
    
    /nethome/bioinfo/apps/samtools/0.1.6/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam | tee hit-23.raw | /nethome/bioinfo/apps/samtools/0.1.6/samtools.pl varFilter -D100 > hit-23.filter
    
    awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-23.filter > hit-23.snp
    
    SNP::bamSnps    Running jobs:
    Cluster::runJobs    Running 1 jobs
    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/cumulativeSnp-chr22-23.sh
    ...
    LSF daemon (LIM) not responding ... still trying
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Can't exec "bjobs": No such file or directory at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 582.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Use of uninitialized value in split at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 586.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Can't exec "bjobs": No such file or directory at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 582.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Use of uninitialized value in split at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 586.
    Command 'bsub' not found in /sw/bin, /nethome/syoung/base/bin, /usr/X11R6/bin, /nethome/syoung/base/bin/utils, /home/syoung/base/bin/nextgen, /home/syoung/base/apps/amos/bin, /home/apps/alta-cyclic/0.1.0/external.programs/libsvm-2.86, /home/apps/alta-cyclic/0.1.0/blat/bin/i386, /home/bioinfo/apps/ngs/bin/nextgen, /home/bioinfo/apps/ngs/bin/exome, /home/bioinfo/apps/ngs/bin/utils, /home/bioinfo/apps/ngs/bin, /nethome/syoung/base/apps/python/python/2.7/bin, /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/etc, /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/bin, /usr/kerberos/bin, /usr/local/bin, /bin, /usr/bin at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/external/LSF.pm line 62
    


RESTART FROM FILE 21:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22
ll -tr merged.bam*

    -rw-r--r-- 1 syoung root 21982038328 Nov  7 07:16 merged.bam
    -rw-r--r-- 1 syoung root  1282710843 Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root  2533489401 Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root  3557956611 Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root  3766914960 Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root  5012929458 Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root  6248472223 Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root  7475737176 Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root  8697784380 Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root  9916179435 Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root 11130666225 Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root 12342392588 Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root 13552077173 Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root 14760336362 Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root 15967045340 Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root 15967045340 Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root 17172343011 Nov  6 03:49 merged.bam-16
        -rw-r--r-- 1 syoung root 18376289972 Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root 19579349912 Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root 20781074219 Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root 21982038328 Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root  1283128386 Nov  6 21:48 merged.bam-22 <=== DIED HERE SO RESTART FROM FILE 21





RERUN FROM 21:


screen -S maq-cum


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--start 21 \
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--species human \
--zipped gzip \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out


RUNNING:

    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/cumulativeSnp-chr22-21.sh
    Job <2246564> is submitted to queue <large>.
    Mon Nov  8 12:08:35 EST 2010

COMPLETED BUT INTERRUPTED:

    cumulativeSNP.pl    Run time: 12:19:43
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    0:28AM, 9 November 2010
    cumulativeSNP.pl    ****************************************


ll merged.bam* | grep -v bai | grep -v cover

    -rw-r--r-- 1 syoung root  21G Nov  9 00:08 merged.bam
    -rw-r--r-- 1 syoung root 1.2G Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root 2.4G Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root 3.4G Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root 3.6G Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root 4.7G Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root 5.9G Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root 7.0G Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root 8.2G Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root 9.3G Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root  11G Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root  12G Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root  13G Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root  14G Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root  16G Nov  6 03:49 merged.bam-16
    -rw-r--r-- 1 syoung root  18G Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root  19G Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root  20G Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root  21G Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root 1.2G Nov  6 21:48 merged.bam-22
    -rw-r--r-- 1 syoung root 4.3G Nov  9 00:11 merged.bam-24
    -rw-r--r-- 1 syoung root  22G Nov  8 21:33 merged.bam.temp


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22
ll merged.bam* | grep -v bai | grep -v cov

    -rw-r--r-- 1 syoung root  21G Nov  9 00:08 merged.bam
    -rw-r--r-- 1 syoung root 1.2G Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root  11G Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root  12G Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root  13G Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root  14G Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root  16G Nov  6 03:49 merged.bam-16
    -rw-r--r-- 1 syoung root  18G Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root  19G Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root  20G Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root 2.4G Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root  21G Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root 1.2G Nov  6 21:48 merged.bam-22
    -rw-r--r-- 1 syoung root 4.3G Nov  9 00:11 merged.bam-24
    -rw-r--r-- 1 syoung root 3.4G Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root 3.6G Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root 4.7G Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root 5.9G Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root 7.0G Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root 8.2G Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root 9.3G Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root  22G Nov  8 21:33 merged.bam.temp

ll *snp

    -rw-rw-rw- 1 syoung root 1007K Nov  5 10:10 hit-10.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  5 13:16 hit-11.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  5 16:41 hit-12.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  5 20:33 hit-13.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  4 14:32 hit-1.snp
    -rw-rw-rw- 1 syoung root     0 Nov  6 21:48 hit-22.snp
    -rw-rw-rw- 1 syoung root  1.5M Nov  4 13:06 hit-2.snp
    -rw-rw-rw- 1 syoung root  1.5M Nov  4 19:32 hit-3.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  4 20:38 hit-4.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  4 22:09 hit-5.snp
    -rw-rw-rw- 1 syoung root  989K Nov  4 23:59 hit-6.snp
    -rw-rw-rw- 1 syoung root  957K Nov  5 02:13 hit-7.snp
    -rw-rw-rw- 1 syoung root  958K Nov  5 04:31 hit-8.snp
    -rw-rw-rw- 1 syoung root  985K Nov  5 07:06 hit-9.snp






SNP::bamSnps    COMMANDS:

time zcat /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.sam.gz > /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.sam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.sam

time cp merged.bam-20 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit

time mv -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam

time cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-21

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam | tee hit-21.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-21.filter

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-21.filter > hit-21.snp




RE-RESTART FROM 21:
Mon Nov 15 10:59:10 EST 2010

screen -S maq-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--start 21 \
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--species human \
--zipped gzip \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out

RUNNING
Mon Nov 15 10:18:00 EST 2010

PROBLEM WITH LSF AT Mon Nov 15 13:53:37 EST 2010:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out

    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying

    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    cumulativeSNP.pl    Run time: 44:08:28
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    7:00AM, 17 November 2010
    cumulativeSNP.pl    ****************************************


MISSING FILES 22-25, 28, 29:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22
ls -al -tr merged.bam-* | grep -v bai | grep -v cov


    -rw-r--r-- 1 syoung root  2533489401 Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root  1282710843 Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root  3557956611 Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root  3766914960 Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root  5012929458 Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root  6248472223 Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root  7475737176 Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root  8697784380 Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root  9916179435 Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root 11130666225 Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root 12342392588 Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root 13552077173 Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root 14760336362 Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root 15967045340 Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root 15967045340 Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root 17172343011 Nov  6 03:49 merged.bam-16
    -rw-r--r-- 1 syoung root 18376289972 Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root 19579349912 Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root 20781074219 Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root  1283128386 Nov  6 21:48 merged.bam-22
    -rw-r--r-- 1 syoung root 21982038328 Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root  4511973376 Nov  9 00:11 merged.bam-24
    -rw-r--r-- 1 syoung root   497738713 Nov 15 10:47 merged.bam-25
    -rw-r--r-- 1 syoung root 21982038328 Nov 15 14:03 merged.bam-21
    -rw-r--r-- 1 syoung root  5741588480 Nov 16 10:55 merged.bam-26
    -rw-r--r-- 1 syoung root  9159262208 Nov 16 10:56 merged.bam-27
    -rw-r--r-- 1 syoung root 20857972154 Nov 16 18:54 merged.bam-30
    -rw-r--r-- 1 syoung root  5452152832 Nov 16 22:59 merged.bam-31
    -rw-r--r-- 1 syoung root 22065249521 Nov 17 06:59 merged.bam-33


HOWEVER, THE SORTED FILES FROM FILE 21 ONWARD APPEAR NORMAL AS HOPED:

ls -al merged*.bam | grep -v "\.0"

    -rw-r--r-- 1 syoung root  3770934242 Nov  4 14:39 merged-13-sorted.bam
    -rw-r--r-- 1 syoung root 22065249521 Nov 17 06:51 merged.bam
    -rw-rw-rw- 1 syoung root 16095604736 Nov 15 14:50 merged.sorted-21.bam
    -rw-rw-rw- 1 syoung root 17178046464 Nov 15 18:52 merged.sorted-22.bam
    -rw-rw-rw- 1 syoung root 17095139328 Nov 15 22:53 merged.sorted-23.bam
    -rw-rw-rw- 1 syoung root 14985842688 Nov 16 02:53 merged.sorted-24.bam
    -rw-rw-rw- 1 syoung root 21155708928 Nov 16 06:54 merged.sorted-25.bam
    -rw-rw-rw- 1 syoung root 20357452082 Nov 16 10:39 merged.sorted-26.bam
    -rw-rw-rw- 1 syoung root 20357452082 Nov 16 10:40 merged.sorted-27.bam
    -rw-rw-rw- 1 syoung root 21566006866 Nov 16 14:45 merged.sorted-28.bam
    -rw-rw-rw- 1 syoung root 21566006866 Nov 16 14:44 merged.sorted-29.bam
    -rw-rw-rw- 1 syoung root 20857972154 Nov 16 18:35 merged.sorted-30.bam
    -rw-rw-rw- 1 syoung root 22065242230 Nov 16 22:48 merged.sorted-31.bam
    -rw-rw-rw- 1 syoung root 22848372736 Nov 17 03:00 merged.sorted-32.bam
    -rw-rw-rw- 1 syoung root 22065249521 Nov 17 06:42 merged.sorted-33.bam


SOLUTION

RERUN AS cumulativ3:








FALSE START

time \
/nethome/bioinfo/apps/samtools/0.1.8/samtools \
merge \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam.temp \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.bam \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam


NOW RUNNING

time \
/nethome/bioinfo/apps/samtools/0.1.8/samtools \
merge \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam.temp \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25/chr22/hit.bam \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam





bamCoverage.pl
--------------


FIRST RUN (1-10)
---------------

screen -S maq-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-%REPLICATE%.coverage \
--replicates 1-10 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small

    Run time: 00:23:17
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:45AM, 5 November 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/

    merged.bam-1.coverage	average 11.250360
    merged.bam-2.coverage	average 22.507861
    merged.bam-3.coverage	average 35.137527
    merged.bam-4.coverage	average 46.395830
    merged.bam-5.coverage	average 57.654539
    merged.bam-6.coverage	average 68.911185
    merged.bam-7.coverage	average 80.165655
    merged.bam-8.coverage	average 91.422721
    merged.bam-9.coverage	average 102.681961


--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out
cumulativeSNP.pl    Printing STDOUT to stdoutfile:



SECOND RUN (11-20)
-----------------

screen -S maq-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-%REPLICATE%.coverage \
--replicates 11-20 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small

    
    Run time: 01:00:59
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:35AM, 8 November 2010
    ****************************************


    merged.bam-1.coverage	average 11.250360
    merged.bam-2.coverage	average 22.507861
    merged.bam-3.coverage	average 35.137527
    merged.bam-4.coverage	average 46.395830
    merged.bam-5.coverage	average 57.654539
    merged.bam-6.coverage	average 68.911185
    merged.bam-7.coverage	average 80.165655
    merged.bam-8.coverage	average 91.422721
    merged.bam-9.coverage	average 102.681961


==> merged.bam-10.coverage <==
average 113.932965

==> merged.bam-11.coverage <==
average 125.188901

==> merged.bam-12.coverage <==
average 136.445745

==> merged.bam-13.coverage <==
average 147.703428

==> merged.bam-14.coverage <==
average 158.958967

==> merged.bam-15.coverage <==
average 158.958967

==> merged.bam-16.coverage <==
average 170.217974

==> merged.bam-17.coverage <==
average 181.477059

==> merged.bam-18.coverage <==
average 192.730847

==> merged.bam-19.coverage <==
average 203.984893





NOTES
-----

MAQ OPTIONS
-----------

/nethome/bioinfo/apps/maq/0.7.1/maq match 

Usage:   maq map [options] <out.map> <chr.bfa> <reads_1.bfq> [reads_2.bfq]

Options: -1 INT      length of the first read (<=127) [0]
         -2 INT      length of the second read (<=127) [0]
         -m FLOAT    rate of difference between reads and references [0.001]
         -e INT      maximum allowed sum of qualities of mismatches [70]
         -d FILE     adapter sequence file [null]
         -a INT      max distance between two paired reads [250]
         -A INT      max distance between two RF paired reads [0]
         -n INT      number of mismatches in the first 24bp [2]
         -M c|g      methylation alignment mode [null]
         -u FILE     dump unmapped and poorly aligned reads to FILE [null]
         -H FILE     dump multiple/all 01-mismatch hits to FILE [null]
         -C INT      max number of hits to output. >512 for all 01 hits. [250]
         -s INT      seed for random number generator [random]
         -W          disable Smith-Waterman alignment
         -t          trim all reads (usually not recommended)
         -c          match in the colorspace
         


ELAND OPTIONS
-------------

http://bioit.dbi.udel.edu/manuals/GAPipeline/Whole_genome_alignments_using_ELAND

Running ELAND as a standalone program

	This has changed for 0.4
The eland_extended and eland_pair modes introduced in Pipeline version 0.3 share a common 'export' file format. The intention of this file is to combine all the important information for a lane into one file (or two files in the case of a paired read run). These scripts:

Bring in the base quality value information
Use the base quality values to pick the best alignment (taking into account read-pairing if relevant)
Give a quality score to the alignment
You do not get these files just by running the ELAND executable, the export files are generated by running several scripts to postprocess the raw ELAND output.
There seems to be an increasingly common requirement to run this set of scripts in a 'standalone' fashion. This can be done via the script Pipeline/Eland/ELAND_standalone.pl. Minimal usage:

./Pipeline/Eland/ELAND_standalone.pl -if read1.fastq -if read2.fastq -it fastq
-eg /lustre/data01/Mondas_software/Genomes/E_coli_ELAND
Full list of options:

option	short form	Description
--input-file	-if	must specify at least one file, specify two for paired analysis
--input-type	-it	type of input file: fastq, fasta or export
--read-length	-rl	will work it out from input file(s) if not specified
--seed-length	-sl	length of read used for ELAND alignment - default is to min of read-length and 32
--eland-genome	-eg	full path of a squashed genome directory
--output-prefix	-op	will produce a set of output files whose names prefixed by this - defaults to 'reanalysis'
--pipeline-dir	-pd	path of pipeline installation to call - by default, looks in same dir as executable is found
--base-quality	-bq	in fasta mode assume all bases have this quality (TBD)
--pair-params	-pp	paired read analysis parameters to pass to pickBestPair - multiple arguments must go in quotes - defaults to '--circular' - treats all chromosomes as circular
NB: for a paired read analysis, both reads must share same
input-type, read-length and seed-length


TBDs:

As of today (5.3.8), -it fasta doesn't work. You'll have to fake a fastq file with a constant base quality value of your choice.
I want to add in a partial reanalysis capability to do things like varying the filtering without having to do the whole realignment.
It doesn't do quality value recalibration at the moment (5.3.8), because that code is subject to change. It will do 'soon.'
For a paired-read run, the ELAND alignment of the two reads could be run in parallel to halve the time to result (assuming you have at least 2 cores free, as even your iPod probably does these days). It doesn't do this yet, it could.

ELAND_standalone is meant for:

Quickly testing effect of different filter parameters
Quickly testing alignment targets (e.g. align to genome + contaminants to check for contaminants).
Testing applications that read export files.
Quickly testing pipeline components (for internal use)
If you want to e.g. produce a set of export files for submission then it is probably best to re-run GERALD part of the pipeline to get a 'proper' analysis.

Pitfall:
It uses 'our' fastq encoding scheme (ASCII character = quality value + 64) rather than the more standard ASCII character = quality value + 32

A quick and dirty conversion from 'rest of the world' to 'us' can be done by

 
cat file.fastq | perl -lane '{ if ($l=~/^\+/) { s/(.)/chr(ord($1)+32)/eg;} print; $l=$_ }' > new.fastq
I propose to make ELAND_standalone.pl part of the 0.4 release as several of our informed external users have asked for it and it can't break the existing pipeline code to do so.





</entry>

<entry [Fri Oct 29 13:44:22 EDT 2010] DISC USAGE, SHIFT autochr22/maq AND hiseq TO /ngs/bioinfo>



screen -S mv-hiseq

RUNNING Sun Oct 31 02:13:08 EDT 2010



screen -S mv-maq

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22

mv maq /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq 




ON /ngs/bioinfo
---------------

/ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22
-rw-rw-r--+  1 syoung bioinfo 31 Oct 28 11:41 du.txt

    bash-3.2$ cat du.txt
    579G    bowtie
    678G    eland
    22M     maq
    bash-3.2$ pwd
    
    
ON SCRATCH
-----------
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
-rw-rw-r-- 1 syoung root   95 Oct 28 12:43 du.txt

    bash-3.2$ cat du.txt
    575G    100M
    2.6T    autochr22
    1.5K    du.txt
    8.1G    SRX000600
    31G     SRX000601
    123G    SRX000602
    55G     SRX000603
        
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled

-rw-rw-r--  1 syoung root   63 Oct 28 13:19 du.txt

    bash-3.2$ cat du.txt .
    298G    2000bp
    3.3T    200bp
    1.5K    du.txt
    20G     SRX001539
    37G     SRX001540

  
/scratch/syoung/base/pipeline/SRA/NA18507
-rw-rw-r--  1 syoung root  45 Oct 28 13:19 du.txt

    bash-3.2$ cat du.txt 
    4.4T    SRP000239
    121G    SRP000726
    448M    SRS000101
    bash-3.2$ pwd
    
/scratch/syoung/base/pipeline
-rw-rw-r--  1 syoung root  99 Oct 28 12:49 du.txt

    bash-3.2$ cat du.txt
    3.3M    casava
    566K    catfilter
    26G     data
    1.5K    du.txt
    379G    hiseq
    155M    lemmon
    204K    lsf
    947M    piqa
    4.6T    SRA
    





</entry>

<entry [Fri Oct 29 13:43:22 EDT 2010] RUN bamCoverage.pl ON ALL ELAND 100M READ FILE HITS AND CUMULATIVELY MERGED BAM FILES>


1. USE samToBam.pl TO CONVERT ALL eland/*/chr22/hit.sam FILES TO BAM FILES
--------------------------------------------------------------------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToBam.pl \
--replicates 1-33 \
--concurrent \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.bam \
--reference chr22 \
--species human \
--walltime 24 \
--queue small \
--cluster LSF \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/eland-chr22-samToBam-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/loop-samToBam.out

    Run time: 00:02:38
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:43PM, 29 October 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ll */chr22/hit.bam

    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 10/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 11/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 12/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 13/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 14/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 15/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 16/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 17/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 18/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 19/chr22/hit.bam
    -rw-r--r-- 1 syoung root 171M Oct 29 13:42 1/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 20/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 21/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 22/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 23/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 24/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 25/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 26/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 27/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 28/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 29/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 2/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 30/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 31/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 32/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 33/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 3/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 4/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 5/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 6/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 7/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 8/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 9/chr22/hit.bam


2. SORT BAM FILES
-----------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl \
--replicates 1-33 \
--concurrent \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.bam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam \
--walltime 24 \
--queue small \
--cluster LSF \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/eland-chr22-sortBam-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/loop-sortBam.out
    
    Run time: 00:02:54
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:56PM, 29 October 2010
    ****************************************


OUTPUT FILES HAVE THE SAME SIZE AS INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ls -al */chr22/hit*bam

    -rw-r--r-- 1 syoung root 133569477 Oct 29 13:42 10/chr22/hit.bam
    -rw-r--r-- 1 syoung root 133569477 Oct 29 14:55 10/chr22/hit.sorted.bam
    -rw-r--r-- 1 syoung root 133415726 Oct 29 13:42 11/chr22/hit.bam
    -rw-r--r-- 1 syoung root 133415726 Oct 29 14:55 11/chr22/hit.sorted.bam
    -rw-r--r-- 1 syoung root 133364351 Oct 29 13:42 12/chr22/hit.bam
    -rw-r--r-- 1 syoung root 133364351 Oct 29 14:55 12/chr22/hit.sorted.bam
    -rw-r--r-- 1 syoung root 133518481 Oct 29 13:43 13/chr22/hit.bam
    ...



3. RUN indexBam.pl TO INDEX BAM FILES
-------------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/indexBam.pl \
--replicates 1-33 \
--concurrent \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam.bai \
--walltime 24 \
--queue small \
--cluster LSF \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/eland-chr22-indexBam-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/loop-indexBam.out
    
    Run time: 00:01:34
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    4:45PM, 29 October 2010
    ****************************************



4. RUN bamCoverage.pl ON ALL BAM FILES
--------------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/cumulative-5

screen -S eland-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam.genome-coverage \
--replicates 1-33 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small


OUTPUT FILES:

NOTE: FILE 1 hit.bam APPEARS TO HAVE AN EXCESSIVE NUMBER OF HITS


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
head */chr22/*coverage
    
    ==> 1/chr22/hit.sorted.bam.genome-coverage <==
    average 2.741045
    
    ==> 2/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834721
    
    ==> 30/chr22/hit.sorted.bam.genome-coverage <==
    average 1.836326
    
    ==> 3/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834348
    
    ==> 4/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835051
    
    ==> 5/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835160
    
    ==> 6/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835015
    
    ==> 7/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833538
    
    ==> 8/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834927
    
    ==> 9/chr22/hit.sorted.bam.genome-coverage <==
    average 1.836536

    ==> 10/chr22/hit.sorted.bam.genome-coverage <==
    average 1.836427
    
    ==> 11/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834642
    
    ==> 12/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833757
    
    ==> 13/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835765
    
    ==> 14/chr22/hit.sorted.bam.genome-coverage <==
    average 1.838303
    
    ==> 15/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833275
    
    ==> 16/chr22/hit.sorted.bam.genome-coverage <==
    average 1.832750
    
    ==> 17/chr22/hit.sorted.bam.genome-coverage <==
    average 1.832687
    
    ==> 18/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833080
    
    ==> 19/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833941
    
    ==> 20/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834073
    
    ==> 21/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835210
    
    ==> 22/chr22/hit.sorted.bam.genome-coverage <==
    average 1.831621
    
    ==> 23/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833807
    
    ==> 24/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835943
    
    ==> 25/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835538
    
    ==> 26/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833362
    
    ==> 27/chr22/hit.sorted.bam.genome-coverage <==
    average 1.836140
    
    ==> 28/chr22/hit.sorted.bam.genome-coverage <==
    average 1.837566
    
    ==> 29/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833393
    
    ==> 31/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834134
    
    ==> 32/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835982
    
    ==> 33/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834751
    



WHICH RUNS:

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam.genome-coverage

    average 0.641921



NOTES
-----


TEST SINGLE RUN OF indexBam.pl

/nethome/bioinfo/apps/agua/0.5/bin/apps/converters/indexBam.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--cluster LSF \
--queue small
    


TEST SINGLE RUN OF sortBam.pl

/nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.bam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--cluster LSF \
--queue small
    
    sortBam.pl    Run time: 00:01:57
    sortBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl
    sortBam.pl    10-10-29 14:14:58
    sortBam.pl    ****************************************



NB: sortBam.pl TAKES ABOUT THE SAME TIME TO SORT ALREADY SORTED BAMFILE:

/nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--cluster LSF \
--queue small
    
    sortBam.pl    Run time: 00:02:13
    sortBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl
    sortBam.pl    10-10-29 14:21:02
    sortBam.pl  


TEST SINGLE RUN OF samToBam.pl

/nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToBam.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.bam \
--reference chr22 \
--species human \
--cluster LSF \
--queue large

    OK
    
    samToBam.pl    Run time: 00:02:02
    samToBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToBam.pl
    samToBam.pl    10-10-29 13:25:24
    samToBam.pl    ****************************************
    
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/
ll 
    -rw-r--r-- 1 syoung root 171M Oct 29 13:24 hit.bam
    -rw-rw-r-- 1 syoung root 596M Oct 13 13:41 hit.sam
    ...



