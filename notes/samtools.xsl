apps.samtools.xsl

<entry [Fri 2011:08:12 09:37:31 EST] INSTALLED SAMTOOLS 0.1.17 AND Bio::DB::Sam 1.29 ON aquarius-8f2>

FOR RUNNING JBROWSE NEED Bio::DB::Sam. PUTTING LATEST VERSION OF Bio-SamTools IN PATH DIDN'T WORK:

export PATH=/data/apps/samtools/Bio-SamTools-1.19/lib:$PATH

RUN JBROWSE:

    install Bio::DB::Sam in order to use BAM files at /data/apps/jbrowse/100511/bin/flatfile-to-json.pl line 140.
    flatfile-to-json.pl    Looking for refSeqs in data/refSeqs.js

    
REM: MUST USE -fPIC TO COMPILE

SAMTOOLS 0.1.16
---------------
1. INSTALL NCURSES AND zlib
sudo apt-get install libncurses5-dev
sudo apt-get install zlib1g-dev

2. DOWNLOAD SAMTOOLS, EDIT MAKEFILE TO ADD -fPIC

mkdir -p /data/apps/samtools/archive
cd /data/apps/samtools/archive
wget http://sourceforge.net/projects/samtools/files/samtools/0.1.17/samtools-0.1.17.tar.bz2
tar xvfj samtools-0.1.17.tar.bz2
mv samtools-0.1.17 ../0.1.17
cd /data/apps/samtools/0.1.17

3. EDIT Makefile 

ADD "-fPIC" to the CFLAGS line:

  CFLAGS=       -g -Wall -O2 -fPIC #-m64 #-arch ppc

AND SET -D_CURSES_LIB TO ZERO:

DFLAGS=         -D_FILE_OFFSET_BITS=64 -D_USE_KNETFILE -D_CURSES_LIB=0

AND COMMENT OUT -lcurses:

#LIBCURSES=      -lcurses # -lXCurses
LIBCURSES=      # -lcurses # -lXCurses 


4. DO MAKE

make clean
make


NOTES
------

NO samtools EXECUTABLE PRESENT DUE TO THIS ERROR:

make[2]: Nothing to be done for `lib'.
make[2]: Leaving directory `/data/apps/samtools/0.1.17/misc'
gcc -g -Wall -O2 -fPIC  -o samtools bam_tview.o bam_plcmd.o sam_view.o bam_rmdup.o bam_rmdupse.o bam_mate.o bam_stat.o bam_color.o bamtk.o kaln.o bam2bcf.o bam2bcf_indel.o errmod.o sample.o cut_target.o phase.o bam2depth.o -Lbcftools  libbam.a -lbcf -lcurses  -lm -lz
/usr/bin/ld: cannot find -lcurses
collect2: ld returned 1 exit status
make[1]: *** [samtools] Error 1
make[1]: Leaving directory `/data/apps/samtools/0.1.17'
make: *** [all-recur] Error 1

SOLUTION:

EDIT Makefile:


CFLAGS=       -g -Wall -O2 -fPIC #-m64 #-arch ppc                                                                                                                                 

#DFLAGS=                -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -D_USE_KNETFILE -D_CURSES_LIB=1                                                                              
DFLAGS=         -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -D_USE_KNETFILE -D_CURSES_LIB=0

KNETFILE_O=     knetfile.o
LOBJS=          bgzf.o kstring.o bam_aux.o bam.o bam_import.o sam.o bam_index.o \
                        bam_pileup.o bam_lpileup.o bam_md.o razf.o faidx.o bedidx.o \
                        $(KNETFILE_O) bam_sort.o sam_header.o bam_reheader.o kprobaln.o bam_cat.o
AOBJS=          bam_tview.o bam_plcmd.o sam_view.o      \
                        bam_rmdup.o bam_rmdupse.o bam_mate.o bam_stat.o bam_color.o     \
                        bamtk.o kaln.o bam2bcf.o bam2bcf_indel.o errmod.o sample.o \
                        cut_target.o phase.o bam2depth.o
PROG=           samtools
INCLUDES=       -I.
SUBDIRS=        . bcftools misc
LIBPATH=
#LIBCURSES=      -lcurses # -lXCurses                                                                                                                                             
LIBCURSES=      # -lcurses # -lXCurses 



Bio::DB::Sam 1.29 
-----------------

INSTALLED USING CPAN:

install Bio::DB::Sam

    ...
    This module requires samtools 0.1.9 or higher (samtools.sourceforge.net).
Please enter the location of the bam.h and compiled libbam.a files: /data/apps/samtools/0.1.17
    ...
    Creating new 'Build' script for 'Bio-SamTools' version '1.29'
    CPAN: Module::Build loaded ok (v0.38)
    Building Bio-SamTools
    cc -I/data/apps/samtools/0.1.17 -I/usr/lib/perl/5.10/CORE -DXS_VERSION="1.29" -DVERSION="1.29" -fPIC -D_IOLIB=2 -D_FILE_OFFSET_BITS=64 -Wformat=0 -c -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fno-strict-aliasing -pipe -fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g -o lib/Bio/DB/Sam.o lib/Bio/DB/Sam.c
    ExtUtils::Mkbootstrap::Mkbootstrap('blib/arch/auto/Bio/DB/Sam/Sam.bs')
    cc -shared -O2 -g -L/usr/local/lib -fstack-protector -o blib/arch/auto/Bio/DB/Sam/Sam.so lib/Bio/DB/Sam.o -L/data/apps/samtools/0.1.17 -lbam -lz
      LDS/Bio-SamTools-1.29.tar.gz
      ./Build -- OK
    Running Build test
    t/01sam.t .. 1/112 [fai_load] build FASTA index.
    [bam_parse_region] fail to determine the sequence name.
    t/01sam.t .. ok       
    All tests successful.
    Files=1, Tests=112,  2 wallclock secs ( 0.02 usr  0.00 sys +  0.92 cusr  0.14 csys =  1.08 CPU)
    Result: PASS
      LDS/Bio-SamTools-1.29.tar.gz
      ./Build test -- OK
    Running Build install
    Prepending /root/.cpan/build/Bio-SamTools-1.29-zuW4Ok/blib/arch /root/.cpan/build/Bio-SamTools-1.29-zuW4Ok/blib/lib to PERL5LIB for 'install'
    Building Bio-SamTools
    Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
    Installing /usr/local/lib/perl/5.10.1/auto/Bio/DB/Sam/Sam.so
    Installing /usr/local/lib/perl/5.10.1/auto/Bio/DB/Sam/Sam.bs
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Sam.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Bam/ReadIterator.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Bam/AlignWrapper.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Bam/FetchIterator.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Bam/Target.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Bam/PileupWrapper.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Bam/Pileup.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Bam/Query.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Bam/Alignment.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Sam/Segment.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Sam/SamToGBrowse.pm
    Installing /usr/local/lib/perl/5.10.1/Bio/DB/Sam/Constants.pm
    Installing /usr/local/man/man3/Bio::DB::Bam::Alignment.3pm
    Installing /usr/local/man/man3/Bio::DB::Bam::Query.3pm
    Installing /usr/local/man/man3/Bio::DB::Bam::Pileup.3pm
    Installing /usr/local/man/man3/Bio::DB::Sam::Constants.3pm
    Installing /usr/local/man/man3/Bio::DB::Sam.3pm
    Installing /usr/local/man/man3/Bio::DB::Bam::Target.3pm
    Installing /usr/local/man/man3/Bio::DB::Bam::PileupWrapper.3pm
    Installing /usr/local/man/man3/Bio::DB::Bam::AlignWrapper.3pm
    Installing /usr/local/bin/genomeCoverageBed.pl
    Installing /usr/local/bin/bamToGBrowse.pl
      LDS/Bio-SamTools-1.29.tar.gz
      ./Build install  -- OK


</entry>

<entry [Wed 2011:05:25 01:16:17 EST] INSTALLED SAMTOOLS 0.1.16 AND Bio::DB::Sam 1.28 ON HP>

SAMTOOLS 0.1.16
---------------
1. INSTALL NCURSES AND zlib
sudo apt-get install libncurses5-dev
sudo apt-get install zlib1g-dev

2. DOWNLOAD SAMTOOLS, EDIT MAKEFILE TO ADD -fPIC

mkdir -p /data/apps/samtools/archive
cd /data/apps/samtools/archive
wget http://sourceforge.net/projects/samtools/files/samtools/0.1.16/samtools-0.1.16.tar.bz2
tar xvfj *
mv samtools-0.1.16 ../0.1.16
cd /data/apps/samtools/0.1.16

3. EDIT Makefile 

ADD "-fPIC" to the CFLAGS line:

  CFLAGS=       -g -Wall -O2 -fPIC #-m64 #-arch ppc

... AND SET -D_CURSES_LIB TO ZERO:

DFLAGS=         -D_FILE_OFFSET_BITS=64 -D_USE_KNETFILE -D_CURSES_LIB=0

4. DO MAKE

make clean
make

    OK



Bio::DB::Sam 1.28 
-----------------
1. DOWNLOAD 
cd /data/apps/jbrowse/perlmods
wget http://search.cpan.org/CPAN/authors/id/L/LD/LDS/Bio-SamTools-1.28.tar.gz

cd /data/apps/jbrowse/perlmods/Bio-SamTools-1.28
perl Build.PL --prefix /usr

USE PATH TO libbam.a AND bam.h:
/data/apps/samtools/0.1.16

./Build
./Build test
./Build install

    Building Bio-SamTools
    Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
    Installing /usr/lib/perl/5.10.1/auto/Bio/DB/Sam/Sam.bs
    Installing /usr/lib/perl/5.10.1/auto/Bio/DB/Sam/Sam.so
    Installing /usr/lib/perl/5.10.1/Bio/DB/Sam.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Sam/SamToGBrowse.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Sam/Constants.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Sam/Segment.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Bam/FetchIterator.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Bam/Alignment.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Bam/Target.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Bam/Pileup.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Bam/ReadIterator.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Bam/Query.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Bam/AlignWrapper.pm
    Installing /usr/lib/perl/5.10.1/Bio/DB/Bam/PileupWrapper.pm
    Installing /usr/man/man3/Bio::DB::Bam::PileupWrapper.3pm
    Installing /usr/man/man3/Bio::DB::Bam::AlignWrapper.3pm
    Installing /usr/man/man3/Bio::DB::Sam::Constants.3pm
    Installing /usr/man/man3/Bio::DB::Bam::Alignment.3pm
    Installing /usr/man/man3/Bio::DB::Bam::Pileup.3pm
    Installing /usr/man/man3/Bio::DB::Bam::Target.3pm
    Installing /usr/man/man3/Bio::DB::Bam::Query.3pm
    Installing /usr/man/man3/Bio::DB::Sam.3pm
    Installing /usr/bin/genomeCoverageBed.pl
    Installing /usr/bin/bamToGBrowse.pl

</entry>
<entry [Tue 2011:05:24 09:56:11 EST] INSTALLED SAMTOOLS 0.1.16 ON 8e>

1. DOWNLOADED VERSION 1.28

/data/apps/samtools/0.1.16

2. EDITED MAKEFILE TO ADD -fPIC

Edit the Makefile in the Samtools distribution by adding
"-fPIC" to the CFLAGS line. It should look like this:

  CFLAGS=       -g -Wall -O2 -fPIC #-m64 #-arch ppc


3. ALSO EDIT Makefile AND CHANGE THIS:

DFLAGS=         -D_FILE_OFFSET_BITS=64 -D_USE_KNETFILE -D_CURSES_LIB=1

TO THIS:

DFLAGS=         -D_FILE_OFFSET_BITS=64 -D_USE_KNETFILE -D_CURSES_LIB=0

4. DO MAKE CLEAN

make clean


5. INSTALL NCURSES

sudo apt-get install libncurses5-dev


6. DO MAKE

make

    OK
    

    
</entry>

