samtools.quickref.xsl

<entry [Fri 2011:08:12 10:13:03 EST] INSTALL SAMTOOLS WITH -fPIC FLAG>
1. DOWNLOAD SAMTOOLS

2. EDIT Makefile 

ADD "-fPIC" to the CFLAGS line:

  CFLAGS=       -g -Wall -O2 -fPIC #-m64 #-arch ppc

... AND SET -D_CURSES_LIB TO ZERO:

DFLAGS=         -D_FILE_OFFSET_BITS=64 -D_USE_KNETFILE -D_CURSES_LIB=0

3. DO MAKE

make clean
make
   
</entry>
<entry [Fri 2011:08:12 10:01:24 EST] VIEW BAM FILES>
    
samtools view -X aln.bam | less -S

-X 	Show string FLAG
    
</entry>

