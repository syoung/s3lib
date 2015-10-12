bowtie

<entry [Fri Oct  1 03:10:51 EDT 2010] COPIED mm9.fa TO BOWTIE DIR FOR DALE>

DOWNLOADED 2bit FROM UCSC AND CONVERTED TO FASTA

mkdir /nethome/bioinfo/data/sequence/genomes/mouse/mm9/2bit
mkdir /nethome/bioinfo/data/sequence/genomes/mouse/mm9/fasta
mkdir /nethome/bioinfo/data/sequence/genomes/mouse/mm9/bowtie
cd /nethome/bioinfo/data/sequence/genomes/mouse/mm9/2bit
wget http://hgdownload.cse.ucsc.edu/goldenPath/mm9/bigZips/mm9.2bit
/nethome/syoung/bin/x86_64/twoBitToFa mm9.2bit mm9.fa
mv mm9.fa ../fasta
cp ../fasta/mm9.fa ../bowtie


_____________________________________________
From: Hedges, Dale 
Sent: Thursday, September 30, 2010 3:09 PM
To: Young, Stuart
Subject: mm9.fa

stuart, it seems like bowtie also needs a copy of the mm9.fa file in addition to the pre-built bowtie indexes. 

When I trie to run tophat it fails, saying that it could not find mm9.fa.  Could you put a copy of mm9.fa 

in the indexes folder (/nethome/apps/ccsngs/apps/bowtie/0.12.7/indexes)  when you get a chance?

thanks,
Dale

</entry>
<entry [Fri Jan 15 15:59:06 EST 2010] INSTALLED NEWEST VERSON OF BOWTIE>

SEE ALSO BOWTIE MANUAL
http://bowtie-bio.sourceforge.net/manual.shtml


Langmead et al., 2009 BOWTIE PAPER


Parallel performance
Alignment can be parallelized by distributing reads across
concurrent search threads. Bowtie allows the user to specify a
desired number of threads (option -p); Bowtie then launches
the specified number of threads using the pthreads library.
Bowtie threads synchronize with each other when fetching
reads, outputting results, switching between indices, and performing
various forms of global bookkeeping, such as marking
a read as 'done'. Otherwise, threads are free to operate in
parallel, substantially speeding up alignment on computers
with multiple processor cores. The memory image of the
index is shared by all threads, and so the footprint does not
increase substantially when multiple threads are used. Table
4 shows performance results for running Bowtie v0.9.6 on the
four-core server with one, two, and four threads.



Bowtie makes a number of compromises to achieve this
speed, but these trade-offs are reasonable within the context
of mammalian re-sequencing projects. If one or more exact
matches exist for a read, then Bowtie is guaranteed to report
one, but if the best match is an inexact one then Bowtie is not
guaranteed in all cases to find the highest quality alignment.
With its highest performance settings, Bowtie may fail to
align a small number of reads with valid alignments, if those
reads have multiple mismatches. If the stronger guarantees
are desired, Bowtie supports options that increase accuracy at
the cost of some performance.

Phased Maq-like search
Bowtie allows the user to select the number of mismatches
permitted (default: two) in the high-quality end of a read
(default: the first 28 bases) as well as the maximum acceptable
quality distance of the overall alignment (default: 70).
Quality values are assumed to follow the definition in PHRED
[24], where p is the probability of error and Q = -10log p.
Both the read and its reverse complement are candidates for
alignment to the reference.


For clarity, this discussion considers
only the forward orientation. See Additional data file 1
(Supplementary Discussion 2) for an explanation of how the
reverse complement is incorporated.
The first 28 bases on the high-quality end of the read are
termed the 'seed'. The seed consists of two halves: the 14 bp
on the high-quality end (usually the 5' end) and the 14 bp on
the low-quality end, termed the 'hi-half' and the 'lo-half',
respectively. Assuming the default policy (two mismatches
permitted in the seed), a reportable alignment will fall into
one of four cases: no mismatches in seed (case 1); no mismatches
in hi-half, one or two mismatches in lo-half (case 2);
no mismatches in lo-half, one or two mismatches in hi-half
(case 3); and one mismatch in hi-half, one mismatch in lohalf
(case 4).
All cases allow any number of mismatches in the nonseed part
of the read and all cases are also subject to the quality distance
constraint. bowbo

The time required to build the Bowtie index was not included
in the Bowtie running times. Unlike competing tools, Bowtie
can reuse a pre-computed index for the reference genome
across many alignment runs. We anticipate most users will
simply download such indices from a public repository. The
Bowtie site [25] provides indices for current builds of the
human, chimp, mouse, dog, rat, and Arabidopsis thaliana
genomes, as well as many others.



</entry>



<entry [Sat Jun  6 23:30:00 EDT 2009] DOWNLOAD AND INSTALL BOWTIE>



1. DOWNLOAD BOWTIE

http://bowtie-bio.sourceforge.net/manual.shtml#whis

2. INSTALL BOWTIE (JUST RUN make)

tar xvfz *
cd bowtie-0.9.4
make

    OK

CREATED FILES:

    -rwxr-xr-x 1 syoung bioinfo 197402 Jun  6 22:28 bowtie-build
    -rwxr-xr-x 1 syoung bioinfo 199592 Jun  6 22:29 bowtie-build-packed
    -rwxr-xr-x 1 syoung bioinfo 272738 Jun  6 22:29 bowtie
    -rwxr-xr-x 1 syoung bioinfo  40890 Jun  6 22:29 bowtie-convert



3. RUN BOWTIE
[SEE Notes-project04-comparison.txt]

NB: USE bowtie-convert TO CONVERT TO MAQ out.map FOR SNP CALCULATION

<!--
/nethome/syoung/base/apps/bowtie/0.9.4/bowtie -q -unfa 

--unfa <filename>  	 Write all reads that fail to align to a FASTA file with name <filename>. Paire


./bowtie
No input sequence, query, or output file specified!

Usage: bowtie [options]* <ebwt_base> <query_in> [<hit_outfile>]
  <ebwt_base>        ebwt filename minus trailing .1.ebwt/.2.ebwt
  <query_in>         comma-separated list of files containing query reads
                     (or the sequences themselves, if -c is specified)
  <hit_outfile>      file to write hits to (default: stdout)
Options:
  -q                 query input files are FASTQ .fq/.fastq (default)
  -f                 query input files are (multi-)FASTA .fa/.mfa
  -r                 query input files are raw one-sequence-per-line
  -c                 query sequences given on command line (as <query_in>)
  -e/--maqerr <int>  max sum of mismatch quals (rounds like maq; default: 70)
  -l/--seedlen <int> seed length (default: 28)
  -n/--seedmms <int> max mismatches in seed (can be 0-3, default: 2)
  -v <int>           report end-to-end hits w/ <=v mismatches; ignore qualities
  -5/--trim5 <int>   trim <int> bases from 5' (left) end of reads
  -3/--trim3 <int>   trim <int> bases from 3' (right) end of reads
  -u/--qupto <int>   stop after the first <int> reads
  -t/--time          print wall-clock time taken by search phases
  --solexa-quals     convert FASTQ qualities from solexa-scaled to phred
  --ntoa             Ns in reads become As; default: Ns match nothing
  --concise          write hits in a concise format
  --maxns <int>      skip reads w/ >n no-confidence bases (default: no limit)
  -o/--offrate <int> override offrate of Ebwt; must be <= value in index
  --seed <int>       seed for random number generator
  --verbose          verbose output (for debugging)
  --version          print version information and quit


alignment:  	
-n/--seedmms <int> 	The maximum number of mismatches permitted in the "seed", which is the first 28 base pairs of the read by default (see -l/--seedlen). This may be 0, 1, 2 or 3 and the default is 2.

--unfa <filename>  	 Write all reads that fail to align to a FASTA file with name <filename>. Paired-end reads will be written to two parallel files with "_1" and "_2" inserted in the filename, e.g., if <filename> is unaligned.fa, the #1 and #2 mates that fail to align will be written to unaligned_1.fa and unaligned_2.fa respectively. Unless --maxfa is also specified, reads with a number of valid alignments exceeding the limit set with the -m  option are also written to <filename>.


-->

https://sourceforge.net/project/downloading.php?group_id=236897&use_mirror=internap&filename=bowtie-0.9.4-src.zip&15702576

</entry>