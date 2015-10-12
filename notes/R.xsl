R

<entry [Wed 2011:07:06 05:26:05 EST] INSTALL R ON DATA VOLUME: /data/apps/R>
  
./configure --with-libpng --with-jpeglib --with-x=no --prefix=/nethome/syoung/base/apps/R/2.8.1



  
</entry>
<entry [Tue Sep 14 16:30:47 EDT 2010] Bioconductor packages for HTS>
  
  
Biostrings
BSGenome
ShortRead
TileQC
GenomeGraphs
HilbertVis
TileQC
ChipSeq
edgeR



R is now configured for x86_64-redhat-linux-gnu

  Source directory:          .
  Installation directory:    /usr

  C compiler:                gcc -m64 -std=gnu99  -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic
  Fortran 77 compiler:       gfortran -m64  -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic -I/usr/lib64/gfortran/modules

  C++ compiler:              g++ -m64  -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic
  Fortran 90/95 compiler:    gfortran -m64 -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic
  Obj-C compiler:	     gcc -g -O2

  Interfaces supported:      X11, tcltk
  External libraries:        readline, ICU
  Additional capabilities:   PNG, JPEG, TIFF, NLS, cairo
  Options enabled:           shared R library, shared BLAS, R profiling, Java

  Recommended packages:      yes


TileQC IN CLUSTER R ON PEGASUS (U01)


module load mihg
which R

    /k/analysis/bin/R

R

 capabilities()
    jpeg      png     tiff    tcltk      X11     aqua http/ftp  sockets 
    TRUE     TRUE     TRUE     TRUE    FALSE    FALSE     TRUE     TRUE 
  libxml     fifo   cledit    iconv      NLS  profmem    cairo 
    TRUE     TRUE     TRUE     TRUE     TRUE    FALSE     TRUE 


source("http://science.oregonstate.edu/~dolanp/tileqc/tileQC.R")
biocLite("tileQC")

    Loading tileQC...
            Loading RMySQL...
    Loading required package: DBI
            Loading Configuration data...
            Searching memory for g.qc...
            Not found in memory.
            Searching for file QC.rde in working directory...
            Unable to locate configuration file QC.rde
            You will be asked to either locate the file, or to designate a directory in which to create it.
            If this is your first time configuring tileQC be certain to choose a directory
            for which you have write and read permission
    
    1: Choose location of existing QC.rde
    2: Choose directory in which to create QC.rde
    3: Cancel
    
    Selection: biocLite("tileQC")
    Enter an item from the menu, or 0 to exit
    Selection:


mkdir -p /nethome/syoung/base/apps/rmysql
mkdir -p /nethome/syoung/base/apps/rmysql-cache


2
/nethome/syoung/base/apps/rmysql


(Warning-- Entering a relative path will result in a cache directory
 that changes with the working directory)
Cache directory: Cache directory (choose file in desired directory)Enter file name: 

/nethome/syoung/base/apps/rmysql-cache
    





library("PIQA")
type_of_data="fastq"; in_d="/nethome/syoung/base/pipeline/piqa/s_1_sequence.txt"; out_d="/nethome/syoung/base/pipeline/piqa" ;lane=1;
PIQA_rpt(type_of_data,in_d,out_d,lane)
    

</entry>

<entry [Tue Sep 14 16:30:47 EDT 2010] INSTALL R 2.8.1 AND RUN PIQA ON linode>

OLDER VERSIONS OF R ARE HERE:

http://cran.ms.unimelb.edu.au/src/base/R-2/



1. DOWNLOAD AND INSTALL R 2.8.1

mkdir -p /root/base/apps/R/2.8.1
cd /root/base/apps/R
wget http://cran.ms.unimelb.edu.au/src/base/R-2/R-2.8.1.tar.gz
tar xvfz *gz
cd /root/base/apps/R/R-2.8.1


./configure --with-libpng --with-jpeglib --with-x=no --prefix=/nethome/syoung/base/apps/R/2.8.1

    config.status: creating po/Makefile
    config.status: executing stamp-h commands
    
    R is now configured for x86_64-unknown-linux-gnu
    
      Source directory:          .
      Installation directory:    /nethome/syoung/base/apps/R/2.8.1
    
      C compiler:                gcc -std=gnu99  -g -O2
      Fortran 77 compiler:       gfortran  -g -O2
    
      C++ compiler:              g++  -g -O2
      Fortran 90/95 compiler:    gfortran -g -O2
      Obj-C compiler:             
    
      Interfaces supported:      
      External libraries:        readline
      Additional capabilities:   PNG, iconv, MBCS, NLS
      Options enabled:           shared BLAS, R profiling
    
      Recommended packages:      yes
    
    configure: WARNING: you cannot build info or HTML versions of the R manuals
    configure: WARNING: I could not determine a PDF viewer

make




PROBLEM:

./configure --with-libpng --with-jpeglib --prefix=/nethome/syoung/base/apps/R/2.8.1


configure: error: --with-x=yes (default) and X11 headers/libs are not available

emacs config.log

    ...
    configure:34364: checking whether putenv("FOO=") can unset an environment variable
    configure:34404: gcc -std=gnu99 -o conftest -g -O2  -I/usr/local/include  -L/usr/local/lib64\
     conftest.c -ldl -lm  >&5
    configure:34407: $? = 0
    configure:34413: ./conftest
    configure:34416: $? = 1
    configure: program exited with status 1
    configure: failed program was:
    | /* confdefs.h.  */
    ...





[root@li182-248 R-2.8.1]# yum install libpng-devel
Loaded plugins: allowdowngrade, fastestmirror
Loading mirror speeds from cached hostfile
 * rpmforge: apt.sw.be
 * base: mirror.raystedman.net
 * updates: mirrors.netdna.com
 * addons: mirrors.netdna.com
 * extras: mirror.skiplink.com
Setting up Install Process
Parsing package install arguments
Resolving Dependencies
--> Running transaction check
---> Package libpng-devel.x86_64 2:1.2.10-7.1.el5_5.3 set to be updated
---> Package libpng-devel.i386 2:1.2.10-7.1.el5_5.3 set to be updated
--> Finished Dependency Resolution

Dependencies Resolved

=============================================================================================
 Package               Arch            Version                        Repository        Size
=============================================================================================
Installing:
 libpng-devel          i386            2:1.2.10-7.1.el5_5.3           updates          181 k
 libpng-devel          x86_64          2:1.2.10-7.1.el5_5.3           updates          184 k

Transaction Summary
=============================================================================================
Install      2 Package(s)         
Update       0 Package(s)         
Remove       0 Package(s)         

Total download size: 366 k
Is this ok [y/N]: y
Downloading Packages:
(1/2): libpng-devel-1.2.10-7.1.el5_5.3.i386.rpm                       | 181 kB     00:00     
(2/2): libpng-devel-1.2.10-7.1.el5_5.3.x86_64.rpm                     | 184 kB     00:00     
---------------------------------------------------------------------------------------------
Total                                                         11 MB/s | 366 kB     00:00     
Running rpm_check_debug
Running Transaction Test
Finished Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing     : libpng-devel                                      [1/2] 
  Installing     : libpng-devel                                      [2/2] 

Installed: libpng-devel.i386 2:1.2.10-7.1.el5_5.3 libpng-devel.x86_64 2:1.2.10-7.1.el5_5.3
Complete!
[root@li182-248 R-2.8.1]# yum install libpng-devel



PROBLEM

error: --with-readline=yes (default) and headers/libs are not available


SOLUTION

yum install readline-devel




PROBLEM

configure: error: --with-x=yes (default) and X11 headers/libs are not available


SOLUTION

yum install libX11-devel

####configure --with-x=no




loCFLAGS= -I/home3/fa/faga001/vol/readline-5.1/include \
-L/home3/fa/faga001/vol/readline-5.1/lib


FIND LOCATION OF readline ON SYSTEM
locate readline

    /root/.cpan/build/IO-Socket-SSL-1.31/t/readline.t
    /root/.cpan/build/Term-ReadLine-Perl-1.0303/ReadLine/readline.pm
    /root/.cpan/build/Term-ReadLine-Perl-1.0303/blib/lib/Term/ReadLine/readline.pm
    /usr/include/mysql/readline.h
    /usr/lib/libreadline.so.5
    /usr/lib/libreadline.so.5.1
    /usr/lib/perl5/site_perl/5.8.8/Term/ReadLine/readline.pm
    /usr/lib64/libreadline.so.5
    /usr/lib64/libreadline.so.5.1
    /usr/lib64/python2.4/lib-dynload/readline.so
    /usr/share/info/readline.info.gz
    /usr/share/man/man3/readline.3.gz
    /usr/share/vim/vim70/ftplugin/readline.vim
    /usr/share/vim/vim70/indent/readline.vim
    /usr/share/vim/vim70/syntax/readline.vim





1. INSTALL PIQA

R CMD INSTALL PIQA_1.0_R_x86_64-redhat-linux-gnu.tar.gz

    * installing to library ‘/usr/lib/R/library’
    * installing *binary* package ‘PIQA’ ...
    * DONE (PIQA)


2. COPIED PIQA EXAMPLE DATA TO

/root/base/pipeline/piqa/s_1_sequence.txt 



3. RAN PIQA EXAMPLE FASTQ FILE
http://bioinfo.uh.edu/PIQA/

AT R PROMPT:

library("PIQA")
type_of_data="fastq"; in_d="/root/base/pipeline/piqa/s_1_sequence.txt"; out_d="/root/base/pipeline/piqa" ;lane=1;
PIQA_rpt(type_of_data,in_d,out_d,lane)

    do_fastq --> Loading data...
    do_fastq --> Writing data into a file...
    do_fastq --> qtyRpt.csv created in /nethome/syoung/base/apps/R/2.9.0/
    Error in X11(paste("png::", filename, sep = ""), width, height, pointsize,  : 


library("PIQA")
    Error: package 'PIQA' was built for x86_64-redhat-linux-gnu
    In addition: Warning message:
    package 'PIQA' was built under R version 2.8.1 and help may not work correctly 

type_of_data="fastq"; in_d="/root/base/pipeline/piqa/s_1_sequence.txt"; out_d="/root/base/pipeline/piqa" ;lane=1;

PIQA_rpt(type_of_data,in_d,out_d,lane)

    Error: could not find function "PIQA_rpt"









R VERSION 2.9.0 DID NOT INSTALL

./configure --with-libpng --with-jpeglib --prefix=/nethome/syoung/base/apps/R/2.9.0 




./configure --with-libpng --with-jpeglib --with-x=no --prefix=/nethome/syoung/base/apps/R/2.9.0 


    ...
    config.status: creating po/Makefile
    config.status: executing stamp-h commands
    
    R is now configured for x86_64-unknown-linux-gnu
    
      Source directory:          .
      Installation directory:    /nethome/syoung/base/apps/R/2.9.0
    
      C compiler:                gcc -std=gnu99  -g -O2
      Fortran 77 compiler:       gfortran  -g -O
    
      C++ compiler:              g++  -g -O2
      Fortran 90/95 compiler:    gfortran -g -O
      Obj-C compiler:             
    
      Interfaces supported:      
      External libraries:        readline
      Additional capabilities:   iconv, MBCS, NLS
      Options enabled:           shared BLAS, R profiling
    
      Recommended packages:      yes
    
    configure: WARNING: you cannot build info or HTML versions of the R manuals
    configure: WARNING: I could not determine a PDF viewer

make
    
    ...
    make[4]: Leaving directory `/root/base/apps/R/R-2.9.0/src/modules/lapack'
    make[4]: Entering directory `/root/base/apps/R/R-2.9.0/src/modules/lapack'
    gcc -std=gnu99 -I. -I../../../src/include -I../../../src/include -I/usr/local/include -DHAVE_CONFIG_H   -fpic  -g -O2 -c Lapack.c -o Lapack.o
    gcc -std=gnu99 -shared -L/usr/local/lib64 -o lapack.so  Lapack.o    -L../../../lib -lRlapack -L../../../lib -lRblas -lgfortran -lm
    make[5]: Entering directory `/root/base/apps/R/R-2.9.0/src/modules/lapack'
    /root/base/apps/R/R-2.9.0/modules/lapack.so is unchanged
    /root/base/apps/R/R-2.9.0/lib/libRlapack.so is unchanged
    make[5]: Leaving directory `/root/base/apps/R/R-2.9.0/src/modules/lapack'
    make[4]: Leaving directory `/root/base/apps/R/R-2.9.0/src/modules/lapack'
    make[3]: Leaving directory `/root/base/apps/R/R-2.9.0/src/modules/lapack'
    make[3]: Entering directory `/root/base/apps/R/R-2.9.0/src/modules/vfonts'
    making g_alab_her.d from g_alab_her.c
    making g_cntrlify.d from g_cntrlify.c
    making g_fontdb.d from g_fontdb.c
    making g_her_glyph.d from g_her_glyph.c
    make[4]: Entering directory `/root/base/apps/R/R-2.9.0/src/modules/vfonts'
    make[4]: `Makedeps' is up to date.
    make[4]: Leaving directory `/root/base/apps/R/R-2.9.0/src/modules/vfonts'
    make[4]: Entering directory `/root/base/apps/R/R-2.9.0/src/modules/vfonts'
    gcc -std=gnu99 -I. -I../../../src/include -I../../../src/include -I/usr/local/include -DHAVE_CONFIG_H   -fpic  -g -O2 -c g_alab_her.c -o g_alab_her.o
    gcc -std=gnu99 -I. -I../../../src/include -I../../../src/include -I/usr/local/include -DHAVE_CONFIG_H   -fpic  -g -O2 -c g_cntrlify.c -o g_cntrlify.o
    gcc -std=gnu99 -I. -I../../../src/include -I../../../src/include -I/usr/local/include -DHAVE_CONFIG_H   -fpic  -g -O2 -c g_fontdb.c -o g_fontdb.o
    gcc -std=gnu99 -I. -I../../../src/include -I../../../src/include -I/usr/local/include -DHAVE_CONFIG_H   -fpic  -g -O2 -c g_her_glyph.c -o g_her_glyph.o
    gcc -std=gnu99 -shared -L/usr/local/lib64 -o vfonts.so g_alab_her.o g_cntrlify.o g_fontdb.o g_her_glyph.o  -lm 
    make[5]: Entering directory `/root/base/apps/R/R-2.9.0/src/modules/vfonts'
    /root/base/apps/R/R-2.9.0/modules/vfonts.so is unchanged
    make[5]: Leaving directory `/root/base/apps/R/R-2.9.0/src/modules/vfonts'
    make[4]: Leaving directory `/root/base/apps/R/R-2.9.0/src/modules/vfonts'
    make[3]: Leaving directory `/root/base/apps/R/R-2.9.0/src/modules/vfonts'
    make[3]: Entering directory `/root'
    make[3]: *** No rule to make target `R'.  Stop.
    make[3]: Leaving directory `/root'
    make[2]: *** [R] Error 1
    make[2]: Leaving directory `/root/base/apps/R/R-2.9.0/src/modules'
    make[1]: *** [R] Error 1
    make[1]: Leaving directory `/root/base/apps/R/R-2.9.0/src'
    make: *** [R] Error 1


</entry>



<entry [Tue Sep 14 15:30:47 EDT 2010] REQUEST TO INSTALL R MODULE PIQA ON PEGASUS>





PLEASE INSTALL THIS R MODULE:

R CMD INSTALL /nethome/syoung/base/apps/piqa/PIQA_1.0_R_x86_64-redhat-linux-gnu.tar.gz




</entry>



<entry [Tue Sep 14 15:29:47 EDT 2010] INSTALLED R WITH RPM ON PEGASUS>




SYNTAX:

    rpm -ivh --prefix=[destination_directory] PACKAGE.i586.rpm


cd /nethome/syoung/base/apps/R/rpm
wget http://cran.r-project.org/bin/linux/redhat/fedora11/x86_64/R-2.10.0-2.fc11.x86_64.rpm
mkdir  /nethome/syoung/base/apps/R/2.10.0-2


rpm -ivh --prefix /nethome/syoung/base/apps/R/2.10.0-2 R-2.10.0-2.fc11.x86_64.rpm


    warning: R-2.10.0-2.fc11.x86_64.rpm: Header V3 DSA signature: NOKEY, key ID 97d3544e
error: package R is not relocatable


rpm -qp --queryformat "%{defaultprefix}\n" R-2.10.0-2.fc11.x86_64.rpm 

    warning: R-2.10.0-2.fc11.x86_64.rpm: Header V3 DSA signature: NOKEY, key ID 97d3544e
error: incorrect format: unknown tag




INSTALLED R WITH yum ON pegasus
-------------------------------

INSTALL YUM LOCALLY

mkdir -p /nethome/syoung/base/apps/yum/3.2.28
cd /nethome/syoung/base/apps/yum
wget http://yum.baseurl.org/download/3.2/yum-3.2.28.tar.gz


for file in \
    gmp-4.1.4-10.el5.x86_64.rpm \
    readline-5.1-3.el5.x86_64.rpm \
    python-2.4.3-27.el5.x86_64.rpm \
    libxml2-2.6.26-2.1.8.x86_64.rpm \
    libxml2-python-2.6.26-2.1.8.i386.rpm \
    expat-1.95.8-8.3.el5_4.2.i386.rpm \
    python-elementtree-1.2.6-5.x86_64.rpm \
    sqlite-3.3.6-5 .x86_64.rpm \
    python-sqlite-1.1.7-1.2.1.x86_64.rpm \
    elfutils-0.137-3.el5.x86_64.rpm \
    rpm-python-4.4.2.3-18.el5.x86_64.rpm \
    m2crypto-0.16-6.el5.6.x86_64.rpm \
    python-urlgrabber-3.1.0-5.el5.noarch.rpm \
    yum-3.2.22-26.el5.centos.noarch.rpm

    do     wget http://isoredirect.centos.org/centos/5/os/x86_64/CentOS/$file;    

    #rpm -Uvh --prefix=/nethome/syoung/base/apps/yum/3.2.28 http://isoredirect.centos.org/centos/5/os/x86_64/CentOS/$file;
    
done




http://isoredirect.centos.org/centos/5/os/x86_64/CentOS/gmp-4.1.4-10.el5.x86_64.rpm
http://isoredirect.centos.org/centos/5/os/x86_64/CentOS/gmp-4.1.4-10.el5.x86_64.rpm



####for file in \
####    gmp-4.1.4-10.el5.i386.rpm \
####    readline-5.1-1.1.i386.rpm \
####    python-2.4.3-19.el5.i386.rpm \
####    libxml2-2.6.26-2.1.2.i386.rpm \
####    libxml2-python-2.6.26-2.1.2.i386.rpm \
####    expat-1.95.8-8.2.1.i386.rpm \
####    python-elementtree-1.2.6-5.i386.rpm \
####    sqlite-3.3.6-2.i386.rpm \
####    python-sqlite-1.1.7-1.2.1.i386.rpm \
####    elfutils-0.125-3.el5.i386.rpm \
####    rpm-python-4.4.2-37.el5.i386.rpm \
####    m2crypto-0.16-6.el5.1.i386.rpm \
####    python-urlgrabber-3.1.0-2.noarch.rpm \
####    yum-3.0.5-1.el5.centos.2.noarch.rpm
####  do rpm -Uvh --prefix=/nethome/syoung/base/apps/yum/3.2.28 http://isoredirect.centos.org/centos/5/os/x86_64/CentOS/$file;
####done




</entry>
<entry [Wed 2011:07:06 05:27:51 EST] INSTALLED R ON linode USING yum>
  
http://koolinus.wordpress.com/2008/12/23/how-to-install-r-on-centos/



1. CREATE FILE R.repo

mkdir -p /nethome/syoung/base/apps/yum/
emacs /nethome/syoung/base/apps/yum/R.repo

[R-project]
name=R project for Statistical Computing repository
baseurl=http://rm.mirror.garr.it/mirrors/CRAN/bin/linux/redhat/el5/i386
failovermethod=priority
enabled=1
gpgcheck=0
priority=15


2. COPY TO /etc/yum.repos.d/

cp /nethome/syoung/base/apps/yum/R.repo /etc/yum.repos.d/


3. FIND R IF AVAILABLE:

yum list available  R

    R-project                 100% |=========================| 1.0 kB    00:00     
    primary.xml.gz            100% |=========================| 2.9 kB    00:00     
    R-project : ################################################## 5/5
    Available Packages
    R.i386                                   2.10.0-2.el5           R-project 


yum install R


    --> Processing Dependency: libSM.so.6 for package: R-core
    --> Processing Dependency: libgobject-2.0.so.0 for package: R-core
    --> Processing Dependency: libtiff.so.3 for package: R-core
    --> Processing Dependency: libtk8.4.so for package: R-core
    --> Processing Dependency: libcairo.so.2 for package: R-core
    --> Processing Dependency: xdg-utils for package: R-core
    --> Processing Dependency: libjpeg.so.62 for package: R-core
    --> Processing Dependency: perl(File::Copy::Recursive) for package: R-core
    --> Processing Dependency: libXt.so.6 for package: R-core
    --> Processing Dependency: libpng12.so.0 for package: R-core
    --> Processing Dependency: libgmodule-2.0.so.0 for package: R-core
    --> Processing Dependency: libXmu.so.6 for package: R-core
    ---> Package tk-devel.x86_64 0:8.4.13-5.el5_1.1 set to be updated
    --> Processing Dependency: libtk8.4.so()(64bit) for package: tk-devel
    --> Running transaction check
    ---> Package libpng.i386 2:1.2.10-7.1.el5_5.3 set to be updated
    ---> Package libXt.x86_64 0:1.0.2-3.2.el5 set to be updated
    ---> Package pango.i386 0:1.14.9-8.el5.centos set to be updated
    --> Processing Dependency: libXft.so.2 for package: pango
    --> Processing Dependency: libfontconfig.so.1 for package: pango
    --> Processing Dependency: bitstream-vera-fonts for package: pango
    --> Processing Dependency: libfreetype.so.6 for package: pango
    --> Processing Dependency: libXft for package: pango
    ---> Package cups.x86_64 1:1.3.7-18.el5_5.7 set to be updated
    --> Processing Dependency: cups-libs = 1:1.3.7-18.el5_5.7 for package: cups
    --> Processing Dependency: dbus >= 0.90 for package: cups
    --> Processing Dependency: paps >= 0.6.6-9 for package: cups
    --> Processing Dependency: libgnutls.so.13(GNUTLS_1_3)(64bit) for package: cups
    --> Processing Dependency: poppler-utils for package: cups
    --> Processing Dependency: tmpwatch for package: cups
    --> Processing Dependency: libcupsimage.so.2()(64bit) for package: cups
    --> Processing Dependency: libdbus-1.so.3()(64bit) for package: cups
    --> Processing Dependency: libdns_sd.so.1()(64bit) for package: cups
    --> Processing Dependency: libcups.so.2()(64bit) for package: cups
    --> Processing Dependency: libgnutls.so.13()(64bit) for package: cups
    ---> Package libjpeg.i386 0:6b-37 set to be updated
    ---> Package perl-File-Copy-Recursive.noarch 0:0.38-1.el5.rf set to be updated
    ---> Package tk.x86_64 0:8.4.13-5.el5_1.1 set to be updated
    ---> Package libstdc++-devel.x86_64 0:4.1.2-48.el5 set to be updated
    filelists.xml.gz                                                                                                              | 8.5 kB     00:00     
    ---> Package libSM.i386 0:1.0.1-3.1 set to be updated
    ---> Package xorg-x11-proto-devel.i386 0:7.1-13.el5 set to be updated
    --> Processing Dependency: mesa-libGL-devel for package: xorg-x11-proto-devel
    ---> Package netpbm-progs.x86_64 0:10.35.58-8.el5 set to be updated
    --> Processing Dependency: netpbm = 10.35.58-8.el5 for package: netpbm-progs
    --> Processing Dependency: ghostscript for package: netpbm-progs
    --> Processing Dependency: libnetpbm.so.10()(64bit) for package: netpbm-progs
    ---> Package tetex.x86_64 0:3.0-33.8.el5_5.5 set to be updated
    --> Processing Dependency: tetex-fonts = 3.0 for package: tetex
    --> Processing Dependency: desktop-file-utils >= 0.9 for package: tetex
    --> Processing Dependency: dialog for package: tetex
    --> Processing Dependency: ed for package: tetex
    --> Processing Dependency: libgd.so.2()(64bit) for package: tetex
    ---> Package libgfortran.i386 0:4.1.2-48.el5 set to be updated
    ---> Package libICE.i386 0:1.0.1-2.1 set to be updated
    ---> Package cairo.i386 0:1.2.4-5.el5 set to be updated
    ---> Package bzip2-libs.i386 0:1.0.3-4.el5_2 set to be updated
    ---> Package tcl.x86_64 0:8.4.13-4.el5 set to be updated
    ---> Package libstdc++.x86_64 0:4.1.2-48.el5 set to be updated
    ---> Package libstdc++.i386 0:4.1.2-48.el5 set to be updated
    ---> Package libXdmcp-devel.x86_64 0:1.0.1-2.1 set to be updated
    ---> Package tk.i386 0:8.4.13-5.el5_1.1 set to be updated
    ---> Package tetex-dvips.x86_64 0:3.0-33.8.el5_5.5 set to be updated
    --> Processing Dependency: psutils for package: tetex-dvips
    ---> Package libtiff.x86_64 0:3.8.2-7.el5_5.5 set to be updated
    ---> Package pcre.i386 0:6.6-2.el5_1.7 set to be updated
    ---> Package glib2.i386 0:2.12.3-4.el5_3.1 set to be updated
    ---> Package gcc.x86_64 0:4.1.2-48.el5 set to be updated
    --> Processing Dependency: cpp = 4.1.2-48.el5 for package: gcc
    --> Processing Dependency: libgcc >= 4.1.2-48.el5 for package: gcc
    ---> Package libXt.i386 0:1.0.2-3.2.el5 set to be updated
    ---> Package libtiff.i386 0:3.8.2-7.el5_5.5 set to be updated
    ---> Package libgfortran.x86_64 0:4.1.2-48.el5 set to be updated
    ---> Package xdg-utils.noarch 0:1.0.2-2.el5.rf set to be updated
    ---> Package vim-minimal.x86_64 2:7.0.109-6.el5 set to be updated
    ---> Package libXmu.i386 0:1.0.2-5 set to be updated
    ---> Package bzip2.x86_64 0:1.0.3-4.el5_2 set to be updated
    ---> Package libpng.x86_64 2:1.2.10-7.1.el5_5.3 set to be updated
    ---> Package tcl.i386 0:8.4.13-4.el5 set to be updated
    --> Running transaction check
    ---> Package libXft.i386 0:2.1.10-1.1 set to be updated
    ---> Package freetype.x86_64 0:2.2.1-26.el5_5 set to be updated
    ---> Package ghostscript.x86_64 0:8.15.2-9.11.el5 set to be updated
    --> Processing Dependency: urw-fonts >= 1.1 for package: ghostscript
    --> Processing Dependency: ghostscript-fonts for package: ghostscript
    ---> Package cups-libs.x86_64 1:1.3.7-18.el5_5.7 set to be updated
    ---> Package ed.x86_64 0:0.2-39.el5_2 set to be updated
    ---> Package dialog.x86_64 0:1.0.20051107-1.2.2 set to be updated
    ---> Package avahi-compat-libdns_sd.x86_64 0:0.6.16-9.el5_5 set to be updated
    --> Processing Dependency: avahi = 0.6.16 for package: avahi-compat-libdns_sd
    --> Processing Dependency: libavahi-common.so.3()(64bit) for package: avahi-compat-libdns_sd
    --> Processing Dependency: libavahi-client.so.3()(64bit) for package: avahi-compat-libdns_sd
    ---> Package gd.x86_64 0:2.0.33-9.4.el5_4.2 set to be updated
    ---> Package tetex-fonts.x86_64 0:3.0-33.8.el5_5.5 set to be updated
    ---> Package libgcc.x86_64 0:4.1.2-48.el5 set to be updated
    ---> Package netpbm.x86_64 0:10.35.58-8.el5 set to be updated
    ---> Package desktop-file-utils.x86_64 0:0.10-7 set to be updated
    ---> Package dbus.x86_64 0:1.1.2-14.el5 set to be updated
    --> Processing Dependency: dbus-libs = 1.1.2-14.el5 for package: dbus
    ---> Package cpp.x86_64 0:4.1.2-48.el5 set to be updated
    ---> Package mesa-libGL-devel.i386 0:6.5.1-7.8.el5 set to be updated
    --> Processing Dependency: mesa-libGL = 6.5.1-7.8.el5 for package: mesa-libGL-devel
    --> Processing Dependency: libGL.so.1 for package: mesa-libGL-devel
    ---> Package fontconfig.i386 0:2.4.1-7.el5 set to be updated
    ---> Package psutils.x86_64 0:1.17-26.1 set to be updated
    ---> Package bitstream-vera-fonts.noarch 0:1.10-7 set to be updated
    ---> Package dropbox.x86_64 0:0.7.110-1.el5.rf set to be updated
    --> Processing Dependency: libXcomposite.so.1()(64bit) for package: dropbox
    --> Processing Dependency: libgtk-x11-2.0.so.0()(64bit) for package: dropbox
    --> Processing Dependency: libgdk-x11-2.0.so.0()(64bit) for package: dropbox
    --> Processing Dependency: libXcursor.so.1()(64bit) for package: dropbox
    --> Processing Dependency: libgdk_pixbuf-2.0.so.0()(64bit) for package: dropbox
    --> Processing Dependency: libXdamage.so.1()(64bit) for package: dropbox
    --> Processing Dependency: libatk-1.0.so.0()(64bit) for package: dropbox
    --> Processing Dependency: libpango-1.0.so.0()(64bit) for package: dropbox
    --> Processing Dependency: libXfixes.so.3()(64bit) for package: dropbox
    ---> Package paps.x86_64 0:0.6.6-19.el5 set to be updated
    ---> Package libgcc.i386 0:4.1.2-48.el5 set to be updated
    ---> Package tmpwatch.x86_64 0:2.9.7-1.1.el5.2 set to be updated
    ---> Package freetype.i386 0:2.2.1-26.el5_5 set to be updated
    ---> Package gnutls.x86_64 0:1.4.1-3.el5_4.8 set to be updated
    --> Processing Dependency: libgcrypt >= 1.2.2 for package: gnutls
    --> Processing Dependency: libgcrypt.so.11(GCRYPT_1.2)(64bit) for package: gnutls
    --> Processing Dependency: libgcrypt.so.11()(64bit) for package: gnutls
    --> Processing Dependency: libgpg-error.so.0()(64bit) for package: gnutls
    ---> Package poppler-utils.x86_64 0:0.5.4-4.4.el5_5.13 set to be updated
    --> Processing Dependency: poppler = 0.5.4-4.4.el5_5.13 for package: poppler-utils
    --> Processing Dependency: libpoppler.so.1()(64bit) for package: poppler-utils
    --> Processing Dependency: libcairo.so.2()(64bit) for package: poppler-utils
    --> Running transaction check
    ---> Package avahi.x86_64 0:0.6.16-9.el5_5 set to be updated
    --> Processing Dependency: dbus-python for package: avahi
    --> Processing Dependency: libdaemon for package: avahi
    --> Processing Dependency: libdaemon.so.0()(64bit) for package: avahi
    ---> Package libXdamage.x86_64 0:1.0.3-2.1 set to be updated
    ---> Package libgcrypt.x86_64 0:1.4.4-5.el5 set to be updated
    ---> Package mesa-libGL.x86_64 0:6.5.1-7.8.el5 set to be updated
    --> Processing Dependency: libdrm.so.2()(64bit) for package: mesa-libGL
    --> Processing Dependency: libXxf86vm.so.1()(64bit) for package: mesa-libGL
    ---> Package dbus-libs.x86_64 0:1.1.2-14.el5 set to be updated
    ---> Package ghostscript-fonts.noarch 0:5.50-13.1.1 set to be updated
    ---> Package cairo.x86_64 0:1.2.4-5.el5 set to be updated
    ---> Package poppler.x86_64 0:0.5.4-4.4.el5_5.13 set to be updated
    ---> Package urw-fonts.noarch 0:2.3-6.1.1 set to be updated
    ---> Package atk.x86_64 0:1.12.2-1.fc6 set to be updated
    ---> Package pango.x86_64 0:1.14.9-8.el5.centos set to be updated
    --> Processing Dependency: libXft.so.2()(64bit) for package: pango
    ---> Package libgpg-error.x86_64 0:1.4-2 set to be updated
    ---> Package mesa-libGL.i386 0:6.5.1-7.8.el5 set to be updated
    --> Processing Dependency: libXxf86vm.so.1 for package: mesa-libGL
    --> Processing Dependency: libdrm.so.2 for package: mesa-libGL
    ---> Package libXfixes.x86_64 0:4.0.1-2.1 set to be updated
    ---> Package gtk2.x86_64 0:2.10.4-20.el5 set to be updated
    --> Processing Dependency: hicolor-icon-theme for package: gtk2
    ---> Package libXcomposite.x86_64 0:0.3-5.1 set to be updated
    ---> Package libXcursor.x86_64 0:1.1.7-1.1 set to be updated
    --> Running transaction check
    ---> Package libXxf86vm.x86_64 0:1.0.1-3.1 set to be updated
    ---> Package libXxf86vm.i386 0:1.0.1-3.1 set to be updated
    ---> Package libXft.x86_64 0:2.1.10-1.1 set to be updated
    ---> Package dbus-python.x86_64 0:0.70-9.el5_4 set to be updated
    ---> Package libdaemon.x86_64 0:0.10-5.el5 set to be updated
    ---> Package libdrm.x86_64 0:2.0.2-1.1 set to be updated
    ---> Package libdrm.i386 0:2.0.2-1.1 set to be updated
    ---> Package hicolor-icon-theme.noarch 0:0.9-2.1 set to be updated
    --> Finished Dependency Resolution
    
    Dependencies Resolved
    
    =====================================================================================================================================================
     Package                                     Arch                      Version                                    Repository                    Size
    =====================================================================================================================================================
    Installing:
     R                                           i386                      2.10.0-2.el5                               R-project                     14 k
    Updating:
     cpp                                         x86_64                    4.1.2-48.el5                               base                         2.9 M
     freetype                                    x86_64                    2.2.1-26.el5_5                             updates                      310 k
     gcc                                         x86_64                    4.1.2-48.el5                               base                         5.3 M
     libXt                                       x86_64                    1.0.2-3.2.el5                              base                         181 k
     libgcc                                      x86_64                    4.1.2-48.el5                               base                          98 k
     libgcc                                      i386                      4.1.2-48.el5                               base                          95 k
     libpng                                      x86_64                    2:1.2.10-7.1.el5_5.3                       updates                      234 k
     libstdc++                                   i386                      4.1.2-48.el5                               base                         362 k
     libstdc++                                   x86_64                    4.1.2-48.el5                               base                         352 k
     libtiff                                     x86_64                    3.8.2-7.el5_5.5                            updates                      313 k
     tcl                                         x86_64                    8.4.13-4.el5                               base                         954 k
    Installing for dependencies:
     R-core                                      i386                      2.10.0-2.el5                               R-project                     31 M
     R-devel                                     i386                      2.10.0-2.el5                               R-project                     87 k
     atk                                         x86_64                    1.12.2-1.fc6                               base                         224 k
     avahi                                       x86_64                    0.6.16-9.el5_5                             updates                      257 k
     avahi-compat-libdns_sd                      x86_64                    0.6.16-9.el5_5                             updates                       24 k
     bitstream-vera-fonts                        noarch                    1.10-7                                     base                         343 k
     bzip2                                       x86_64                    1.0.3-4.el5_2                              base                          49 k
     bzip2-devel                                 i386                      1.0.3-4.el5_2                              base                          38 k
     bzip2-libs                                  i386                      1.0.3-4.el5_2                              base                          37 k
     cairo                                       i386                      1.2.4-5.el5                                base                         394 k
     cairo                                       x86_64                    1.2.4-5.el5                                base                         386 k
     cups                                        x86_64                    1:1.3.7-18.el5_5.7                         updates                      3.1 M
     cups-libs                                   x86_64                    1:1.3.7-18.el5_5.7                         updates                      194 k
     dbus                                        x86_64                    1.1.2-14.el5                               base                         233 k
     dbus-libs                                   x86_64                    1.1.2-14.el5                               base                         122 k
     dbus-python                                 x86_64                    0.70-9.el5_4                               base                         186 k
     desktop-file-utils                          x86_64                    0.10-7                                     base                          62 k
     dialog                                      x86_64                    1.0.20051107-1.2.2                         base                         165 k
     dropbox                                     x86_64                    0.7.110-1.el5.rf                           rpmforge                      13 M
     ed                                          x86_64                    0.2-39.el5_2                               base                          49 k
     fontconfig                                  i386                      2.4.1-7.el5                                base                         174 k
     freetype                                    i386                      2.2.1-26.el5_5                             updates                      311 k
     gcc-c++                                     x86_64                    4.1.2-48.el5                               base                         3.8 M
     gcc-gfortran                                x86_64                    4.1.2-48.el5                               base                         3.5 M
     gd                                          x86_64                    2.0.33-9.4.el5_4.2                         base                         155 k
     ghostscript                                 x86_64                    8.15.2-9.11.el5                            base                         5.9 M
     ghostscript-fonts                           noarch                    5.50-13.1.1                                base                         801 k
     glib2                                       i386                      2.12.3-4.el5_3.1                           base                         674 k
     gnutls                                      x86_64                    1.4.1-3.el5_4.8                            updates                      364 k
     gtk2                                        x86_64                    2.10.4-20.el5                              base                         6.5 M
     hicolor-icon-theme                          noarch                    0.9-2.1                                    base                          25 k
     libICE                                      i386                      1.0.1-2.1                                  base                          54 k
     libRmath                                    i386                      2.10.0-2.el5                               R-project                     93 k
     libRmath-devel                              i386                      2.10.0-2.el5                               R-project                    120 k
     libSM                                       i386                      1.0.1-3.1                                  base                          27 k
     libX11-devel                                i386                      1.0.3-11.el5                               base                         661 k
     libXcomposite                               x86_64                    0.3-5.1                                    base                          12 k
     libXcursor                                  x86_64                    1.1.7-1.1                                  base                          32 k
     libXdamage                                  x86_64                    1.0.3-2.1                                  base                          11 k
     libXdmcp-devel                              x86_64                    1.0.1-2.1                                  base                         7.5 k
     libXfixes                                   x86_64                    4.0.1-2.1                                  base                          15 k
     libXft                                      i386                      2.1.10-1.1                                 base                          44 k
     libXft                                      x86_64                    2.1.10-1.1                                 base                          44 k
     libXmu                                      i386                      1.0.2-5                                    base                          62 k
     libXt                                       i386                      1.0.2-3.2.el5                              base                         173 k
     libXxf86vm                                  x86_64                    1.0.1-3.1                                  base                          14 k
     libXxf86vm                                  i386                      1.0.1-3.1                                  base                          14 k
     libdaemon                                   x86_64                    0.10-5.el5                                 base                          24 k
     libdrm                                      x86_64                    2.0.2-1.1                                  base                          19 k
     libdrm                                      i386                      2.0.2-1.1                                  base                          19 k
     libgcrypt                                   x86_64                    1.4.4-5.el5                                base                         233 k
     libgfortran                                 x86_64                    4.1.2-48.el5                               base                         243 k
     libgfortran                                 i386                      4.1.2-48.el5                               base                         231 k
     libgpg-error                                x86_64                    1.4-2                                      base                          60 k
     libjpeg                                     i386                      6b-37                                      base                         139 k
     libpng                                      i386                      2:1.2.10-7.1.el5_5.3                       updates                      241 k
     libstdc++-devel                             x86_64                    4.1.2-48.el5                               base                         2.8 M
     libtiff                                     i386                      3.8.2-7.el5_5.5                            updates                      308 k
     mesa-libGL                                  x86_64                    6.5.1-7.8.el5                              base                         8.7 M
     mesa-libGL                                  i386                      6.5.1-7.8.el5                              base                         9.6 M
     mesa-libGL-devel                            i386                      6.5.1-7.8.el5                              base                         461 k
     netpbm                                      x86_64                    10.35.58-8.el5                             base                         836 k
     netpbm-progs                                x86_64                    10.35.58-8.el5                             base                         2.0 M
     pango                                       i386                      1.14.9-8.el5.centos                        updates                      335 k
     pango                                       x86_64                    1.14.9-8.el5.centos                        updates                      339 k
     paps                                        x86_64                    0.6.6-19.el5                               base                          33 k
     pcre                                        i386                      6.6-2.el5_1.7                              base                         112 k
     pcre-devel                                  i386                      6.6-2.el5_1.7                              base                         176 k
     perl-File-Copy-Recursive                    noarch                    0.38-1.el5.rf                              rpmforge                      22 k
     poppler                                     x86_64                    0.5.4-4.4.el5_5.13                         updates                      3.0 M
     poppler-utils                               x86_64                    0.5.4-4.4.el5_5.13                         updates                       75 k
     psutils                                     x86_64                    1.17-26.1                                  base                          90 k
     tcl                                         i386                      8.4.13-4.el5                               base                         956 k
     tcl-devel                                   i386                      8.4.13-4.el5                               base                         1.0 M
     tetex                                       x86_64                    3.0-33.8.el5_5.5                           updates                      8.7 M
     tetex-dvips                                 x86_64                    3.0-33.8.el5_5.5                           updates                      570 k
     tetex-fonts                                 x86_64                    3.0-33.8.el5_5.5                           updates                       29 M
     tetex-latex                                 x86_64                    3.0-33.8.el5_5.5                           updates                      4.1 M
     tk                                          i386                      8.4.13-5.el5_1.1                           base                         888 k
     tk                                          x86_64                    8.4.13-5.el5_1.1                           base                         901 k
     tk-devel                                    x86_64                    8.4.13-5.el5_1.1                           base                         808 k
     tmpwatch                                    x86_64                    2.9.7-1.1.el5.2                            base                          19 k
     urw-fonts                                   noarch                    2.3-6.1.1                                  base                         4.5 M
     vim-minimal                                 x86_64                    2:7.0.109-6.el5                            base                         333 k
     xdg-utils                                   noarch                    1.0.2-2.el5.rf                             rpmforge                      51 k
     xorg-x11-proto-devel                        i386                      7.1-13.el5                                 base                         247 k
    
    Transaction Summary
    =====================================================================================================================================================
    Install     87 Package(s)         
    Update      11 Package(s)         
    Remove       0 Package(s)         
    
    Total download size: 167 M
    Is this ok [y/N]: y
    Downloading Packages:
    (1/98): libXdmcp-devel-1.0.1-2.1.x86_64.rpm                                                                                   | 7.5 kB     00:00     
    (2/98): libXdamage-1.0.3-2.1.x86_64.rpm                                                                                       |  11 kB     00:00     
    (3/98): libXcomposite-0.3-5.1.x86_64.rpm                                                                                      |  12 kB     00:00     
    (4/98): libXxf86vm-1.0.1-3.1.i386.rpm                                                                                         |  14 kB     00:00     
    (5/98): libXxf86vm-1.0.1-3.1.x86_64.rpm                                                                                       |  14 kB     00:00     
    (6/98): R-2.10.0-2.el5.i386.rpm                                                                                               |  14 kB     00:00     
    (7/98): libXfixes-4.0.1-2.1.x86_64.rpm                                                                                        |  15 kB     00:00     
    (8/98): tmpwatch-2.9.7-1.1.el5.2.x86_64.rpm                                                                                   |  19 kB     00:00     
    (9/98): libdrm-2.0.2-1.1.i386.rpm                                                                                             |  19 kB     00:00     
    (10/98): libdrm-2.0.2-1.1.x86_64.rpm                                                                                          |  19 kB     00:00     
    (11/98): perl-File-Copy-Recursive-0.38-1.el5.rf.noarch.rpm                                                                    |  22 kB     00:00     
    (12/98): libdaemon-0.10-5.el5.x86_64.rpm                                                                                      |  24 kB     00:00     
    (13/98): avahi-compat-libdns_sd-0.6.16-9.el5_5.x86_64.rpm                                                                     |  24 kB     00:00     
    (14/98): hicolor-icon-theme-0.9-2.1.noarch.rpm                                                                                |  25 kB     00:00     
    (15/98): libSM-1.0.1-3.1.i386.rpm                                                                                             |  27 kB     00:00     
    (16/98): libXcursor-1.1.7-1.1.x86_64.rpm                                                                                      |  32 kB     00:00     
    (17/98): paps-0.6.6-19.el5.x86_64.rpm                                                                                         |  33 kB     00:00     
    (18/98): bzip2-libs-1.0.3-4.el5_2.i386.rpm                                                                                    |  37 kB     00:00     
    (19/98): bzip2-devel-1.0.3-4.el5_2.i386.rpm                                                                                   |  38 kB     00:00     
    (20/98): libXft-2.1.10-1.1.x86_64.rpm                                                                                         |  44 kB     00:00     
    (21/98): libXft-2.1.10-1.1.i386.rpm                                                                                           |  44 kB     00:00     
    (22/98): bzip2-1.0.3-4.el5_2.x86_64.rpm                                                                                       |  49 kB     00:00     
    (23/98): ed-0.2-39.el5_2.x86_64.rpm                                                                                           |  49 kB     00:00     
    (24/98): xdg-utils-1.0.2-2.el5.rf.noarch.rpm                                                                                  |  51 kB     00:00     
    (25/98): libICE-1.0.1-2.1.i386.rpm                                                                                            |  54 kB     00:00     
    (26/98): libgpg-error-1.4-2.x86_64.rpm                                                                                        |  60 kB     00:00     
    (27/98): desktop-file-utils-0.10-7.x86_64.rpm                                                                                 |  62 kB     00:00     
    (28/98): libXmu-1.0.2-5.i386.rpm                                                                                              |  62 kB     00:00     
    (29/98): poppler-utils-0.5.4-4.4.el5_5.13.x86_64.rpm                                                                          |  75 kB     00:00     
    (30/98): R-devel-2.10.0-2.el5.i386.rpm                                                                                        |  87 kB     00:00     
    (31/98): psutils-1.17-26.1.x86_64.rpm                                                                                         |  90 kB     00:00     
    (32/98): libRmath-2.10.0-2.el5.i386.rpm                                                                                       |  93 kB     00:00     
    (33/98): libgcc-4.1.2-48.el5.i386.rpm                                                                                         |  95 kB     00:01     
    (34/98): libgcc-4.1.2-48.el5.x86_64.rpm                                                                                       |  98 kB     00:01     
    (35/98): pcre-6.6-2.el5_1.7.i386.rpm                                                                                          | 112 kB     00:01     
    (36/98): libRmath-devel-2.10.0-2.el5.i386.rpm                                                                                 | 120 kB     00:00     
    (37/98): dbus-libs-1.1.2-14.el5.x86_64.rpm                                                                                    | 122 kB     00:01     
    (38/98): libjpeg-6b-37.i386.rpm                                                                                               | 139 kB     00:01     
    (39/98): gd-2.0.33-9.4.el5_4.2.x86_64.rpm                                                                                     | 155 kB     00:01     
    (40/98): dialog-1.0.20051107-1.2.2.x86_64.rpm                                                                                 | 165 kB     00:01     
    (41/98): libXt-1.0.2-3.2.el5.i386.rpm                                                                                         | 173 kB     00:02     
    (42/98): fontconfig-2.4.1-7.el5.i386.rpm                                                                                      | 174 kB     00:02     
    (43/98): pcre-devel-6.6-2.el5_1.7.i386.rpm                                                                                    | 176 kB     00:02     
    (44/98): libXt-1.0.2-3.2.el5.x86_64.rpm                                                                                       | 181 kB     00:02     
    (45/98): dbus-python-0.70-9.el5_4.x86_64.rpm                                                                                  | 186 kB     00:02     
    (46/98): cups-libs-1.3.7-18.el5_5.7.x86_64.rpm                                                                                | 194 kB     00:00     
    (47/98): atk-1.12.2-1.fc6.x86_64.rpm                                                                                          | 224 kB     00:02     
    (48/98): libgfortran-4.1.2-48.el5.i386.rpm                                                                                    | 231 kB     00:02     
    (49/98): libgcrypt-1.4.4-5.el5.x86_64.rpm                                                                                     | 233 kB     00:02     
    (50/98): dbus-1.1.2-14.el5.x86_64.rpm                                                                                         | 233 kB     00:02     
    (51/98): libpng-1.2.10-7.1.el5_5.3.x86_64.rpm                                                                                 | 234 kB     00:00     
    (52/98): libpng-1.2.10-7.1.el5_5.3.i386.rpm                                                                                   | 241 kB     00:00     
    (53/98): libgfortran-4.1.2-48.el5.x86_64.rpm                                                                                  | 243 kB     00:02     
    (54/98): xorg-x11-proto-devel-7.1-13.el5.i386.rpm                                                                             | 247 kB     00:02     
    (55/98): avahi-0.6.16-9.el5_5.x86_64.rpm                                                                                      | 257 kB     00:00     
    (56/98): libtiff-3.8.2-7.el5_5.5.i386.rpm                                                                                     | 308 kB     00:00     
    (57/98): freetype-2.2.1-26.el5_5.x86_64.rpm                                                                                   | 310 kB     00:00     
    (58/98): freetype-2.2.1-26.el5_5.i386.rpm                                                                                     | 311 kB     00:00     
    (59/98): libtiff-3.8.2-7.el5_5.5.x86_64.rpm                                                                                   | 313 kB     00:00     
    (60/98): vim-minimal-7.0.109-6.el5.x86_64.rpm                                                                                 | 333 kB     00:03     
    (61/98): pango-1.14.9-8.el5.centos.i386.rpm                                                                                   | 335 kB     00:00     
    (62/98): pango-1.14.9-8.el5.centos.x86_64.rpm                                                                                 | 339 kB     00:00     
    (63/98): bitstream-vera-fonts-1.10-7.noarch.rpm                                                                               | 343 kB     00:03     
    (64/98): libstdc++-4.1.2-48.el5.x86_64.rpm                                                                                    | 352 kB     00:04     
    (65/98): libstdc++-4.1.2-48.el5.i386.rpm                                                                                      | 362 kB     00:04     
    (66/98): gnutls-1.4.1-3.el5_4.8.x86_64.rpm                                                                                    | 364 kB     00:00     
    (67/98): cairo-1.2.4-5.el5.x86_64.rpm                                                                                         | 386 kB     00:04     
    (68/98): cairo-1.2.4-5.el5.i386.rpm                                                                                           | 394 kB     00:04     
    (69/98): mesa-libGL-devel-6.5.1-7.8.el5.i386.rpm                                                                              | 461 kB     00:04     
    (70/98): tetex-dvips-3.0-33.8.el5_5.5.x86_64.rpm                                                                              | 570 kB     00:00     
    (71/98): libX11-devel-1.0.3-11.el5.i386.rpm                                                                                   | 661 kB     00:06     
    (72/98): glib2-2.12.3-4.el5_3.1.i386.rpm                                                                                      | 674 kB     00:08     
    (73/98): ghostscript-fonts-5.50-13.1.1.noarch.rpm                                                                             | 801 kB     00:09     
    (74/98): tk-devel-8.4.13-5.el5_1.1.x86_64.rpm                                                                                 | 808 kB     00:10     
    (75/98): netpbm-10.35.58-8.el5.x86_64.rpm                                                                                     | 836 kB     00:10     
    (76/98): tk-8.4.13-5.el5_1.1.i386.rpm                                                                                         | 888 kB     00:10     
    (77/98): tk-8.4.13-5.el5_1.1.x86_64.rpm                                                                                       | 901 kB     00:09     
    (78/98): tcl-8.4.13-4.el5.x86_64.rpm                                                                                          | 954 kB     00:10     
    (79/98): tcl-8.4.13-4.el5.i386.rpm                                                                                            | 956 kB     00:11     
    (80/98): tcl-devel-8.4.13-4.el5.i386.rpm                                                                                      | 1.0 MB     00:12     
    (81/98): netpbm-progs-10.35.58-8.el5.x86_64.rpm                                                                               | 2.0 MB     00:27     
    (82/98): libstdc++-devel-4.1.2-48.el5.x86_64.rpm                                                                              | 2.8 MB     00:38     
    (83/98): cpp-4.1.2-48.el5.x86_64.rpm                                                                                          | 2.9 MB     00:36     
    (84/98): poppler-0.5.4-4.4.el5_5.13.x86_64.rpm                                                                                | 3.0 MB     00:00     
    (85/98): cups-1.3.7-18.el5_5.7.x86_64.rpm                                                                                     | 3.1 MB     00:00     
    (86/98): gcc-gfortran-4.1.2-48.el5.x86_64.rpm                                                                                 | 3.5 MB     00:41     
    (87/98): gcc-c++-4.1.2-48.el5.x86_64.rpm                                                                                      | 3.8 MB     00:40     
    (88/98): tetex-latex-3.0-33.8.el5_5.5.x86_64.rpm                                                                              | 4.1 MB     00:00     
    (89/98): urw-fonts-2.3-6.1.1.noarch.rpm                                                                                       | 4.5 MB     00:48     
    (90/98): gcc-4.1.2-48.el5.x86_64.rpm                                                                                          | 5.3 MB     00:48     
    (91/98): ghostscript-8.15.2-9.11.el5.x86_64.rpm                                                                               | 5.9 MB     00:47     
    (92/98): gtk2-2.10.4-20.el5.x86_64.rpm                                                                                        | 6.5 MB     00:44     
    (93/98): mesa-libGL-6.5.1-7.8.el5.x86_64.rpm                                                                                  | 8.7 MB     00:55     
    (94/98): tetex-3.0-33.8.el5_5.5.x86_64.rpm                                                                                    | 8.7 MB     00:00     
    (95/98): mesa-libGL-6.5.1-7.8.el5.i386.rpm                                                                                    | 9.6 MB     00:55     
    (96/98): dropbox-0.7.110-1.el5.rf.x86_64.rpm                                                                                  |  13 MB     00:03     
    (97/98): tetex-fonts-3.0-33.8.el5_5.5.x86_64.rpm                                                                              |  29 MB     00:03     
    (98/98): R-core-2.10.0-2.el5.i386.rpm                                                                                         |  31 MB     00:10     
    -----------------------------------------------------------------------------------------------------------------------------------------------------
    Total                                                                                                                249 kB/s | 167 MB     11:27     
    Running rpm_check_debug
    Running Transaction Test
    Finished Transaction Test
    Transaction Test Succeeded
    Running Transaction
      Updating       : libgcc                                        [  1/109] 
      Updating       : libstdc++                                     [  2/109] 
      Updating       : freetype                                      [  3/109] 
      Installing     : libXfixes                                     [  4/109] 
      Updating       : tcl                                           [  5/109] 
      Updating       : libgcc                                        [  6/109] 
      Updating       : libstdc++                                     [  7/109] 
      Installing     : glib2                                         [  8/109] 
      Installing     : freetype                                      [  9/109] 
      Updating       : libXt                                         [ 10/109] 
      Installing     : tetex-fonts                                   [ 11/109] 
      Installing     : libXcursor                                    [ 12/109] 
      Installing     : atk                                           [ 13/109] 
      Installing     : libgpg-error                                  [ 14/109] 
      Installing     : desktop-file-utils                            [ 15/109] 
      Installing     : tmpwatch                                      [ 16/109] 
      Installing     : fontconfig                                    [ 17/109] 
      Installing     : libICE                                        [ 18/109] 
      Installing     : tcl                                           [ 19/109] 
      Installing     : libSM                                         [ 20/109] 
      Installing     : libXt                                         [ 21/109] 
      Installing     : libXft                                        [ 22/109] 
      Installing     : libjpeg                                       [ 23/109] 
      Installing     : libtiff                                       [ 24/109] 
      Installing     : bzip2-libs                                    [ 25/109] 
      Installing     : bzip2                                         [ 26/109] 
      Installing     : libXft                                        [ 27/109] 
      Installing     : libgcrypt                                     [ 28/109] 
      Installing     : tk                                            [ 29/109] 
      Installing     : libXdamage                                    [ 30/109] 
      Installing     : libXcomposite                                 [ 31/109] 
      Installing     : vim-minimal                                   [ 32/109] 
      Installing     : libgfortran                                   [ 33/109] 
      Updating       : cpp                                           [ 34/109] 
      Installing     : psutils                                       [ 35/109] 
      Installing     : tetex-dvips                                   [ 36/109] 
      Installing     : libdaemon                                     [ 37/109] 
      Installing     : ed                                            [ 38/109] 
      Installing     : libdrm                                        [ 39/109] 
      Installing     : netpbm                                        [ 40/109] 
      Installing     : libXxf86vm                                    [ 41/109] 
      Installing     : dialog                                        [ 42/109] 
      Installing     : libXmu                                        [ 43/109] 
      Installing     : tk                                            [ 44/109] 
      Installing     : pcre                                          [ 45/109] 
      Installing     : libgfortran                                   [ 46/109] 
      Installing     : libXxf86vm                                    [ 47/109] 
      Installing     : libdrm                                        [ 48/109] 
      Installing     : mesa-libGL                                    [ 49/109] 
      Installing     : libRmath                                      [ 50/109] 
      Installing     : mesa-libGL                                    [ 51/109] 
      Installing     : tcl-devel                                     [ 52/109] 
      Installing     : bitstream-vera-fonts                          [ 53/109] 
      Installing     : libRmath-devel                                [ 54/109] 
      Installing     : pcre-devel                                    [ 55/109] 
      Installing     : bzip2-devel                                   [ 56/109] 
      Installing     : urw-fonts                                     [ 57/109] 
      Installing     : xdg-utils                                     [ 58/109] 
      Installing     : libstdc++-devel                               [ 59/109] 
      Installing     : perl-File-Copy-Recursive                      [ 60/109] 
      Installing     : hicolor-icon-theme                            [ 61/109] 
      Updating       : gcc                                           [ 62/109] 
      Installing     : gcc-c++                                       [ 63/109] 
      Installing     : gcc-gfortran                                  [ 64/109] 
      Updating       : libtiff                                       [ 65/109] 
      Installing     : xorg-x11-proto-devel                          [ 66/109] 
      Installing     : libX11-devel                                  [ 67/109] 
      Installing     : tk-devel                                      [ 68/109] 
      Installing     : mesa-libGL-devel                              [ 69/109] 
      Installing     : libXdmcp-devel                                [ 70/109] 
      Updating       : libpng                                        [ 71/109] 
      Installing     : cairo                                         [ 72/109] 
      Installing     : pango                                         [ 73/109] 
      Installing     : libpng                                        [ 74/109] 
      Installing     : dropbox                                       [ 75/109] 
    /usr/bin/chcon: can't apply partial context to unlabeled file /etc/init.d/dropbox
    /usr/bin/chcon: can't apply partial context to unlabeled file /etc/sysconfig/dropbox
    error: %post(dropbox-0.7.110-1.el5.rf.x86_64) scriptlet failed, exit status 1
      Installing     : cairo                                         [ 76/109] 
      Installing     : pango                                         [ 77/109] 
      Installing     : dbus                                          [ 78/109] 
      Installing     : gnutls                                        [ 79/109] 
      Installing     : cups-libs                                     [ 80/109] 
      Installing     : gtk2                                          [ 81/109] 
      Installing     : poppler                                       [ 82/109] 
      Installing     : poppler-utils                                 [ 83/109] 
      Installing     : paps                                          [ 84/109] 
      Installing     : dbus-python                                   [ 85/109] 
      Installing     : avahi                                         [ 86/109] 
      Installing     : avahi-compat-libdns_sd                        [ 87/109] 
      Installing     : cups                                          [ 88/109] 
      Installing     : dbus-libs                                     [ 89/109] 
      Installing     : gd                                            [ 90/109] 
      Installing     : tetex                                         [ 91/109] 
      Installing     : ghostscript                                   [ 92/109] 
      Installing     : netpbm-progs                                  [ 93/109] 
      Installing     : tetex-latex                                   [ 94/109] 
      Installing     : ghostscript-fonts                             [ 95/109] 
      Installing     : R-core                                        [ 96/109] 
      Installing     : R-devel                                       [ 97/109] 
      Installing     : R                                             [ 98/109] 
      Cleanup        : libgcc                                        [ 99/109] 
      Cleanup        : tcl                                           [100/109] 
      Cleanup        : freetype                                      [101/109] 
      Cleanup        : libtiff                                       [102/109] 
      Cleanup        : libpng                                        [103/109] 
      Cleanup        : gcc                                           [104/109] 
      Cleanup        : libXt                                         [105/109] 
      Cleanup        : libstdc++                                     [106/109] 
      Cleanup        : libstdc++                                     [107/109] 
      Cleanup        : libgcc                                        [108/109] 
      Cleanup        : cpp                                           [109/109] 
    
    Installed: R.i386 0:2.10.0-2.el5
    Dependency Installed: R-core.i386 0:2.10.0-2.el5 R-devel.i386 0:2.10.0-2.el5 atk.x86_64 0:1.12.2-1.fc6 avahi.x86_64 0:0.6.16-9.el5_5 avahi-compat-libdns_sd.x86_64 0:0.6.16-9.el5_5 bitstream-vera-fonts.noarch 0:1.10-7 bzip2.x86_64 0:1.0.3-4.el5_2 bzip2-devel.i386 0:1.0.3-4.el5_2 bzip2-libs.i386 0:1.0.3-4.el5_2 cairo.i386 0:1.2.4-5.el5 cairo.x86_64 0:1.2.4-5.el5 cups.x86_64 1:1.3.7-18.el5_5.7 cups-libs.x86_64 1:1.3.7-18.el5_5.7 dbus.x86_64 0:1.1.2-14.el5 dbus-libs.x86_64 0:1.1.2-14.el5 dbus-python.x86_64 0:0.70-9.el5_4 desktop-file-utils.x86_64 0:0.10-7 dialog.x86_64 0:1.0.20051107-1.2.2 dropbox.x86_64 0:0.7.110-1.el5.rf ed.x86_64 0:0.2-39.el5_2 fontconfig.i386 0:2.4.1-7.el5 freetype.i386 0:2.2.1-26.el5_5 gcc-c++.x86_64 0:4.1.2-48.el5 gcc-gfortran.x86_64 0:4.1.2-48.el5 gd.x86_64 0:2.0.33-9.4.el5_4.2 ghostscript.x86_64 0:8.15.2-9.11.el5 ghostscript-fonts.noarch 0:5.50-13.1.1 glib2.i386 0:2.12.3-4.el5_3.1 gnutls.x86_64 0:1.4.1-3.el5_4.8 gtk2.x86_64 0:2.10.4-20.el5 hicolor-icon-theme.noarch 0:0.9-2.1 libICE.i386 0:1.0.1-2.1 libRmath.i386 0:2.10.0-2.el5 libRmath-devel.i386 0:2.10.0-2.el5 libSM.i386 0:1.0.1-3.1 libX11-devel.i386 0:1.0.3-11.el5 libXcomposite.x86_64 0:0.3-5.1 libXcursor.x86_64 0:1.1.7-1.1 libXdamage.x86_64 0:1.0.3-2.1 libXdmcp-devel.x86_64 0:1.0.1-2.1 libXfixes.x86_64 0:4.0.1-2.1 libXft.i386 0:2.1.10-1.1 libXft.x86_64 0:2.1.10-1.1 libXmu.i386 0:1.0.2-5 libXt.i386 0:1.0.2-3.2.el5 libXxf86vm.x86_64 0:1.0.1-3.1 libXxf86vm.i386 0:1.0.1-3.1 libdaemon.x86_64 0:0.10-5.el5 libdrm.x86_64 0:2.0.2-1.1 libdrm.i386 0:2.0.2-1.1 libgcrypt.x86_64 0:1.4.4-5.el5 libgfortran.x86_64 0:4.1.2-48.el5 libgfortran.i386 0:4.1.2-48.el5 libgpg-error.x86_64 0:1.4-2 libjpeg.i386 0:6b-37 libpng.i386 2:1.2.10-7.1.el5_5.3 libstdc++-devel.x86_64 0:4.1.2-48.el5 libtiff.i386 0:3.8.2-7.el5_5.5 mesa-libGL.x86_64 0:6.5.1-7.8.el5 mesa-libGL.i386 0:6.5.1-7.8.el5 mesa-libGL-devel.i386 0:6.5.1-7.8.el5 netpbm.x86_64 0:10.35.58-8.el5 netpbm-progs.x86_64 0:10.35.58-8.el5 pango.i386 0:1.14.9-8.el5.centos pango.x86_64 0:1.14.9-8.el5.centos paps.x86_64 0:0.6.6-19.el5 pcre.i386 0:6.6-2.el5_1.7 pcre-devel.i386 0:6.6-2.el5_1.7 perl-File-Copy-Recursive.noarch 0:0.38-1.el5.rf poppler.x86_64 0:0.5.4-4.4.el5_5.13 poppler-utils.x86_64 0:0.5.4-4.4.el5_5.13 psutils.x86_64 0:1.17-26.1 tcl.i386 0:8.4.13-4.el5 tcl-devel.i386 0:8.4.13-4.el5 tetex.x86_64 0:3.0-33.8.el5_5.5 tetex-dvips.x86_64 0:3.0-33.8.el5_5.5 tetex-fonts.x86_64 0:3.0-33.8.el5_5.5 tetex-latex.x86_64 0:3.0-33.8.el5_5.5 tk.i386 0:8.4.13-5.el5_1.1 tk.x86_64 0:8.4.13-5.el5_1.1 tk-devel.x86_64 0:8.4.13-5.el5_1.1 tmpwatch.x86_64 0:2.9.7-1.1.el5.2 urw-fonts.noarch 0:2.3-6.1.1 vim-minimal.x86_64 2:7.0.109-6.el5 xdg-utils.noarch 0:1.0.2-2.el5.rf xorg-x11-proto-devel.i386 0:7.1-13.el5
    Updated: cpp.x86_64 0:4.1.2-48.el5 freetype.x86_64 0:2.2.1-26.el5_5 gcc.x86_64 0:4.1.2-48.el5 libXt.x86_64 0:1.0.2-3.2.el5 libgcc.x86_64 0:4.1.2-48.el5 libgcc.i386 0:4.1.2-48.el5 libpng.x86_64 2:1.2.10-7.1.el5_5.3 libstdc++.i386 0:4.1.2-48.el5 libstdc++.x86_64 0:4.1.2-48.el5 libtiff.x86_64 0:3.8.2-7.el5_5.5 tcl.x86_64 0:8.4.13-4.el5
    Complete!



capabilities(what=NULL)
    jpeg      png     tiff    tcltk      X11     aqua http/ftp  sockets 
    TRUE     TRUE     TRUE     TRUE    FALSE    FALSE     TRUE     TRUE 
  libxml     fifo   cledit    iconv      NLS  profmem    cairo 
    TRUE     TRUE     TRUE     TRUE     TRUE    FALSE     TRUE 


    OK!


</entry>
<entry [Wed 2011:07:06 05:28:19 EST] INSTALL BIOCONDUCTOR>
  
  
source("http://bioconductor.org/biocLite.R")
biocLite()



Biostrings
----------

source("http://bioconductor.org/biocLite.R")
biocLite("Biostrings")

    ...    
    *** installing help indices
    ** building package indices ...
    * DONE (Biostrings)
    
    The downloaded packages are in
            ‘/tmp/RtmpJanuYi/downloaded_packages’
    Updating HTML index of packages in '.Library'


    OK!
    
    

ERROR WHEN glibc-devel IS NOT INSTALLED:

    * installing *source* package ‘IRanges’ ...
    ** libs
    gcc -m32 -std=gnu99 -I/usr/include/R  -I/usr/local/include    -fpic  -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i386 -mtune=generic -fasynchronous-unwind-tables -c AEbufs.c -o AEbufs.o
    In file included from /usr/include/features.h:352,
                     from /usr/include/string.h:26,
                     from /usr/include/R/R_ext/RS.h:24,
                     from /usr/include/R/Rdefines.h:26,
                     from ../inst/include/IRanges_defines.h:18,
                     from IRanges.h:1,
                     from AEbufs.c:9:
    /usr/include/gnu/stubs.h:7:27: error: gnu/stubs-32.h: No such file or directory
    make: *** [AEbufs.o] Error 1
    ERROR: compilation failed for package ‘IRanges’
    * removing ‘/usr/lib/R/library/IRanges’



ITS LOOKING FOR THE 32-BIT VERSION, NOT THE 64 BIT:

ll /usr/include/gnu/

    -rw-r--r--  1 root root 1.4K Jul 27 14:40 libc-version.h
    -rw-r--r--  1 root root 2.9K Jul 27 14:40 lib-names.h
    -rw-r--r--  1 root root  775 Jul 27 14:41 stubs-64.h
    -rw-r--r--  1 root root  315 Jul 27 14:40 stubs.h


CONFIRM THAT LINODE IS 64-BIT

uname -a
    
    Linux li182-248 2.6.18.8-x86_64-linode10 #1 SMP Tue Nov 10 16:29:17 UTC 2009 x86_64 x86_64 x86_64 GNU/Linux


SOLUTION


INSTALL glibc-devel
http://ubuntuforums.org/archive/index.php/t-370114.html

yum install glibc-devel

    Installed: glibc-devel.i386 0:2.5-49.el5_5.4
    Updated: glibc.x86_64 0:2.5-49.el5_5.4 glibc.i686 0:2.5-49.el5_5.4 glibc-common.x86_64 0:2.5-49.el5_5.4 glibc-devel.x86_64 0:2.5-49.el5_5.4 glibc-headers.x86_64 0:2.5-49.el5_5.4
    Complete!


ll /usr/include/gnu/

    -rw-r--r--  1 root root 1.4K Jul 27 14:40 libc-version.h
    -rw-r--r--  1 root root 2.9K Jul 27 14:40 lib-names.h
    -rw-r--r--  1 root root  647 Jul 27 14:44 stubs-32.h
    -rw-r--r--  1 root root  775 Jul 27 14:41 stubs-64.h
    -rw-r--r--  1 root root  315 Jul 27 14:40 stubs.h


OTHER:

http://ubuntuforums.org/archive/index.php/t-370114.html

Solution was simple: set CFLAGS to -m64 before configure.

Strange, as the previously installed gcc produced 64 bit execs by default.


</entry>
<entry [Wed 2011:07:06 05:29:11 EST] RMYSQL>

INSTALL MYSQL-DEVEL
yum install mysql-devel

DOWNLOAD RMYSQL

mkdir -p /root/base/apps/R/RMySQL
cd /root/base/apps/R/RMySQL
wget http://biostat.mc.vanderbilt.edu/wiki/pub/Main/RMySQL/RMySQL_0.7-5.tar.gz


BUT INSTALL GIVES incompatible libmysqlient.so ERROR:


R CMD INSTALL RMySQL_0.7-5.tar.gz

    ...
    gcc -m32 -std=gnu99 -I/usr/include/R -I/usr/include/mysql -I/usr/local/include    -fpic  -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i386 -mtune=generic -fasynchronous-unwind-tables -c RS-DBI.c -o RS-DBI.o
    RS-DBI.c: In function ‘RS_DBI_makeSQLNames’:
    RS-DBI.c:1197: warning: implicit declaration of function ‘isalpha’
    gcc -m32 -std=gnu99 -I/usr/include/R -I/usr/include/mysql -I/usr/local/include    -fpic  -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i386 -mtune=generic -fasynchronous-unwind-tables -c RS-MySQL.c -o RS-MySQL.o
    gcc -m32 -std=gnu99 -shared -L/usr/local/lib -o RMySQL.so RS-DBI.o RS-MySQL.o -L/usr/lib64/mysql -lmysqlclient -lz -L/usr/lib/R/lib -lR
    /usr/bin/ld: skipping incompatible /usr/lib64/mysql/libmysqlclient.so when searching for -lmysqlclient
    /usr/bin/ld: skipping incompatible /usr/lib64/mysql/libmysqlclient.a when searching for -lmysqlclient
    /usr/bin/ld: cannot find -lmysqlclient
    collect2: ld returned 1 exit status
    make: *** [RMySQL.so] Error 1
    ERROR: compilation failed for package ‘RMySQL’
    * removing ‘/usr/lib/R/library/RMySQL’





THE RMYSQL SITE GIVES SOME INFO ON REQUIREMENTS

http://cran.r-project.org/web/packages/RMySQL/INSTALL

<!--


R CMD INSTALL [-l<alternate-dir>] RMySQL_<version>.tar.gz

During installation, RMySQL looks for the MySQL headers and libraries
in the system directories.  If these are not installed in system-wide
directories (or if you want to use an alternate MySQL distribution),
you may specify which MySQL directory(ies) to use through one of the
following:

   1. The shell variables PKG_CPPFLAGS and PKG_LIBS (using Bourne shell)

       export PKG_CPPFLAGS="-I<include-dir>"
       export PKG_LIBS="-L<library-dir> -lmysqlclient"

       For instance, on some 64 systems (e.g., Linux) you may need to set

       export PKG_CPPFALGS="-I/usr/include/mysql"
       export PKG_LIBS="-L/usr/lib64/mysql -lmysqlclient"

or  2. Use the RMySQL configuration shell variables

           export MYSQL_INC=<include directory>"
           export MYSQL_LIB=<library directory>"

       You may also specify the base directory (this is the directory
       that has sub-directories "lib/mysql" and "include/mysql" directories)

           export MYSQL_DIR="<base directory>"

or 3. Use the --with-mysql-* RMySQL configuration arguments

          --with-mysql-dir=<base dir>
          --with-mysql-inc=<include dir>
          --with-mysql-lib=<library dir>

     e.g.,

          R CMD INSTALL --configure-args="--with-mysql-dir=$HOME/mysql" ...


-->

Also, besure that RMySQL can find the non-system libraries at run-time. This is typically managed by an environment variable (LD_LIBRARY_PATH or DYLD_LIBRARY_PATH for OSX) or the /etc/ld.so.cache.

S/W Requirements:
-----------------

   MySQL client library ("libmysqlclient.so") and header files
   (see www.mysql.com).  For Linux/intel you may use the binary rpms 
   client+devel+shared, and make sure you also have the header files, 
   they are *NOT* included in the following

	MySQL-client-4.1.7-1.i386.rpm
	MySQL-shared-4.1.7-1.i386.rpm

   but they are included in the latest 4.1.7 rpm versions.

   The library libz.  This is a standard library on many (but not all)
   systems.  Under Red Hat, it's included in the rpm zlib-devel.
   I've been told that on debian it's in the zlib1g-dev package.



CHECKED mysql-devel IS INSTALLED AND ITS VERSION


yum list | grep mysql

    mysql.x86_64                               5.0.77-4.el5_5.3            installed
    mysql-devel.x86_64                         5.0.77-4.el5_5.3            installed
    mysql-server.x86_64                        5.0.77-4.el5_5.3            installed
    php-mysql.x86_64                           5.1.6-23.2.el5_3            installed
    apr-util-mysql.x86_64                      1.2.7-11.el5                base     
    bytefx-data-mysql.x86_64                   1.2.4-2.el5.centos          extras   
    freeradius-mysql.x86_64                    1.1.3-1.6.el5               base     
    freeradius2-mysql.x86_64                   2.1.7-7.el5                 base     
    libdbi-dbd-mysql.x86_64                    0.8.1a-1.2.2                base     
    lighttpd-mod_mysql_vhost.x86_64            1.4.28-1.el5.rf             rpmforge 
    mod_auth_mysql.x86_64                      1:3.0.0-3.2.el5_3           base     
    mysql.i386                                 5.0.77-4.el5_5.3            updates  
    mysql-bench.x86_64                         5.0.77-4.el5_5.3            updates  
    mysql-connector-odbc.x86_64                3.51.26r1127-1.el5          base     
    mysql-devel.i386                           5.0.77-4.el5_5.3            updates  
    mysql-test.x86_64                          5.0.77-4.el5_5.3            updates  
    pdns-backend-mysql.x86_64                  2.9.21-4.el5.centos         extras   
    perl-Class-DBI-mysql.noarch                1.00-1.el5.rf               rpmforge 
    perl-DBD-mysql.x86_64                      4.014-1.el5.rf              rpmforge 
    php-mysql.x86_64                           5.1.6-27.el5                base     
    php-pear-MDB2-Driver-mysql.noarch          1.4.1-3.el5.centos          extras   
    php-pecl-session_mysql.x86_64              1.9-2.el5.rf                rpmforge 
    proftpd-mysql.x86_64                       1.3.2-1.el5.rf              rpmforge 
    qt4-mysql.x86_64                           4.2.1-1                     base     
    rsyslog-mysql.x86_64                       3.22.1-3.el5                base   
    

yum install mysql-devel

    Loaded plugins: allowdowngrade, fastestmirror
    Loading mirror speeds from cached hostfile
    * rpmforge: apt.sw.be
    * base: ftp.usf.edu
    * updates: centos.corenetworks.net
    * addons: ftp.usf.edu
    * extras: mirror.sanctuaryhost.com
    R-project                                                                                                                         | 1.0 kB     00:00     
    rpmforge                                                                                                                          | 1.1 kB     00:00     
    base                                                                                                                              | 2.1 kB     00:00     
    updates                                                                                                                           | 1.9 kB     00:00     
    primary.sqlite.bz2                                                                                                                | 658 kB     00:00     
    addons                                                                                                                            |  951 B     00:00     
    extras                                                                                                                            | 2.1 kB     00:00     
    Setting up Install Process
    Parsing package install arguments
    Package mysql-devel-5.0.77-4.el5_5.3.x86_64 already installed and latest version
    Package mysql-devel-5.0.77-4.el5_5.3.i386 already installed and latest version
    Nothing to do



CHECKED MYSQL VERSION ON LINODE:

mysql --version
    mysql  Ver 14.12 Distrib 5.0.77, for redhat-linux-gnu (x86_64) using readline 5.1



SEE IF THERE'S ANY MENTION OF THE MYSQL VERSION IN RMYSQL:


Package: RMySQL
Version: 0.7-5
Date: 2010-07-13
Title: R interface to the MySQL database
Author: David A. James and Saikat DebRoy
Maintainer: Jeffrey Horner < jeffrey.horner@gmail.com>
Description: Database interface and MySQL driver for R.
   This version complies with the database interface
   definition as implemented in the package DBI 0.2-2.
LazyLoad: true
Depends: R (>= 2.8.0), methods, DBI (>= 0.2-2), utils
License: GPL-2
URL: http://biostat.mc.vanderbilt.edu/RMySQL
Collate:  S4R.R zzz.R MySQLSupport.R dbObjectId .R MySQL.R
Packaged: 2010-07-14 15:13:55 UTC; hornerj



CHECK CONFIG INFO FOR RMYSQL:

emacs configure.in

    1. If PKG_CPPFLAGS and PKG_LIBS are defined, use them (as suggested in
   dnl    Section 1.2.1 in the "Writing R Extensions, 1.3.0). Ditto for
   dnl    MYSQL_DIR, MYSQL_INC, MYSQL_LIB.
   dnl
   dnl 2. We check for mysql.h and -lmysqlclient in system directories, and if
   dnl    found, we use these (provide the user does not explicitly request
   dnl    another version, see below).  Notice that the MySQL source distribution
   dnl    installs by default to /usr/local/lib/mysql and /usr/local/include/mysql
   dnl
   dnl 3. Alternatively, if the user specifies explicitly a particular MySQL
   dnl    installation we use that version. This can be requested through
   dnl         --with-mysql-dir=DIR

   dnl         --with-mysql-inc=< include-DIR>

   dnl    or   --with-mysql-lib=< library-DIR>

   dnl

   dnl    (these are equivent to setting and exporting MYSQL_{DIR,INC,LIB})

   dnl    In the first case, DIR is assumed to include the lib and include

   dnl    subdirectories;  individual locations of these two may be

   dnl    specified independently through < include-inc> and < library-dir>,

   dnl    respectively.  If we found these, we exit.

   dnl

   dnl 4. We check for the GNU implementation of getopt_long and set the

   dnl    C preprocessor macro HAVE_GETOPT_LONG accordingly.  On windows

   dnl    (including MinGW) should be false.

   dnl

   dnl Global variables: The following variables may be set and exported

   dnl prior to running configure:

   dnl    PKG_CPPFLAGS, PKG_LIBS, MYSQL_DIR, MYSQL_INC, MYSQL_LIB

   dnl


</entry>
<entry [Wed 2011:07:06 05:30:45 EST] TRIED TO INSTALL RMYSQL IN R PROMPT>

install.packages('RMySQL',type='source')

    ...

    /usr/bin/ld: skipping incompatible /usr/lib64/mysql/libmysqlclient.so when searching for -lmysqlclient

    /usr/bin/ld: skipping incompatible /usr/lib64/mysql/libmysqlclient.a when searching for -lmysqlclient

    /usr/bin/ld: cannot find -lmysqlclient

    collect2: ld returned 1 exit status

    make: *** [RMySQL.so] Error 1

    ERROR: compilation failed for package ‘RMySQL’

    * removing ‘/usr/lib/R/library/RMySQL’

    

    The downloaded packages are in

            ‘/tmp/RtmpTGVnXl/downloaded_packages’

    Updating HTML index of packages in '.Library'

    Warning message:

    In install.packages("RMySQL", type = "source") :

      installation of package 'RMySQL' had non-zero exit status
    >



LOOKS BY DEFAULT IN /usr/local/lib/mysql FOR MYSQL *.so FILES

BUT THEY ARE ACTUALLY HERE

ll /usr/lib/mysql/

    -rw-r--r--  1 root root 1.5K May 28 01:10 libdbug.a
    -rw-r--r--  1 root root  50K May 28 01:10 libheap.a
    -rw-r--r--  1 root root 370K May 28 01:10 libmyisam.a
    -rw-r--r--  1 root root  31K May 28 01:10 libmyisammrg.a
    -rw-r--r--  1 root root 1.6M May 28 01:10 libmysqlclient.a
    -rw-r--r--  1 root root 1.6M May 28 01:10 libmysqlclient_r.a
    lrwxrwxrwx  1 root root   26 Sep 15 16:19 libmysqlclient_r.so -> libmysqlclient_r.so.15.0.0
    lrwxrwxrwx  1 root root   26 Sep 15 16:19 libmysqlclient_r.so.15 -> libmysqlclient_r.so.15.0.0
    -rwxr-xr-x  1 root root 1.4M May 28 01:10 libmysqlclient_r.so.15.0.0
    lrwxrwxrwx  1 root root   24 Sep 15 16:19 libmysqlclient.so -> libmysqlclient.so.15.0.0
    lrwxrwxrwx  1 root root   24 Sep 15 16:19 libmysqlclient.so.15 -> libmysqlclient.so.15.0.0
    -rwxr-xr-x  1 root root 1.4M May 28 01:10 libmysqlclient.so.15.0.0
    -rw-r--r--  1 root root 1.4M May 28 01:10 libmystrings.a
    -rw-r--r--  1 root root 323K May 28 01:10 libmysys.a
    -rw-r--r--  1 root root  14K May 28 01:10 libvio.a
    -rwxr-xr-x  1 root root  13K May 28 01:10 mysqlbug
    -rwxr-xr-x  1 root root 6.1K May 28 01:10 mysql_config


ll /usr/lib64/mysql/

    -rw-r--r--  1 root root 2.0K May 28 01:08 libdbug.a
    -rw-r--r--  1 root root  68K May 28 01:08 libheap.a
    -rw-r--r--  1 root root 443K May 28 01:08 libmyisam.a
    -rw-r--r--  1 root root  41K May 28 01:08 libmyisammrg.a
    -rw-r--r--  1 root root 1.8M May 28 01:08 libmysqlclient.a
    -rw-r--r--  1 root root 1.8M May 28 01:08 libmysqlclient_r.a
    lrwxrwxrwx  1 root root   26 Sep 15 16:19 libmysqlclient_r.so -> libmysqlclient_r.so.15.0.0
    lrwxrwxrwx  1 root root   26 Sep 15 16:19 libmysqlclient_r.so.15 -> libmysqlclient_r.so.15.0.0
    -rwxr-xr-x  1 root root 1.5M May 28 01:08 libmysqlclient_r.so.15.0.0
    lrwxrwxrwx  1 root root   24 Sep 15 16:19 libmysqlclient.so -> libmysqlclient.so.15.0.0
    lrwxrwxrwx  1 root root   24 Sep 15 16:19 libmysqlclient.so.15 -> libmysqlclient.so.15.0.0
    -rwxr-xr-x  1 root root 1.5M May 28 01:08 libmysqlclient.so.15.0.0
    -rw-r--r--  1 root root 1.5M May 28 01:08 libmystrings.a
    -rw-r--r--  1 root root 424K May 28 01:08 libmysys.a
    -rw-r--r--  1 root root  19K May 28 01:08 libvio.a
    -rwxr-xr-x  1 root root  13K May 28 01:07 mysqlbug
    -rwxr-xr-x  1 root root 6.1K May 28 01:07 mysql_config


ll /usr/include/mysql

    -rw-r--r--  1 root root 4.6K May 28 01:10 chardefs.h
    -rw-r--r--  1 root root 4.0K May 28 01:10 decimal.h
    -rw-r--r--  1 root root 3.8K May 28 01:10 errmsg.h
    -rw-r--r--  1 root root  10K May 28 01:10 history.h
    -rw-r--r--  1 root root 6.7K May 28 01:10 keycache.h
    -rw-r--r--  1 root root 3.5K May 28 01:10 keymaps.h
    -rw-r--r--  1 root root  21K May 28 01:10 m_ctype.h
    -rw-r--r--  1 root root 8.0K May 28 01:10 m_string.h
    -rw-r--r--  1 root root 1.8K May 28 01:10 my_alloc.h
    -rw-r--r--  1 root root 1.9K May 28 01:10 my_attribute.h
    -rw-r--r--  1 root root  816 May 28 01:10 my_config.h
    -rw-r--r--  1 root root  30K May 28 01:10 my_config_i386.h
    -rw-r--r--  1 root root  30K May 28 01:07 my_config_x86_64.h
    -rw-r--r--  1 root root 4.5K May 28 01:10 my_dbug.h
    -rw-r--r--  1 root root 3.4K May 28 01:10 my_dir.h
    -rw-r--r--  1 root root 2.9K May 28 01:10 my_getopt.h
    -rw-r--r--  1 root root  43K May 28 01:10 my_global.h
    -rw-r--r--  1 root root 1.5K May 28 01:10 my_list.h
    -rw-r--r--  1 root root 3.8K May 28 01:10 my_net.h
    -rw-r--r--  1 root root 1.7K May 28 01:10 my_no_pthread.h
    -rw-r--r--  1 root root  27K May 28 01:10 my_pthread.h
    -rw-r--r--  1 root root  17K May 28 01:10 mysql_com.h
    -rw-r--r--  1 root root  17K May 28 01:10 mysqld_ername.h
    -rw-r--r--  1 root root  17K May 28 01:10 mysqld_error.h
    -rw-r--r--  1 root root 1.2K May 28 01:10 mysql_embed.h
    -rw-r--r--  1 root root  33K May 28 01:10 mysql.h
    -rw-r--r--  1 root root 2.1K May 28 01:10 mysql_time.h
    -rw-r--r--  1 root root  821 May 28 01:10 mysql_version.h
    -rw-r--r--  1 root root  37K May 28 01:10 my_sys.h
    -rw-r--r--  1 root root 2.0K May 28 01:10 my_xml.h
    -rw-r--r--  1 root root 5.7K May 28 01:10 raid.h
    -rw-r--r--  1 root root  34K May 28 01:10 readline.h
    -rw-r--r--  1 root root 5.1K May 28 01:10 rlmbutil.h
    -rw-r--r--  1 root root  13K May 28 01:10 rlprivate.h
    -rw-r--r--  1 root root 1.4K May 28 01:10 rlshell.h
    -rw-r--r--  1 root root 3.0K May 28 01:10 rltypedefs.h
    -rw-r--r--  1 root root 1.9K May 28 01:10 sql_common.h
    -rw-r--r--  1 root root  11K May 28 01:10 sql_state.h
    -rw-r--r--  1 root root 1006 May 28 01:10 sslopt-case.h
    -rw-r--r--  1 root root 2.2K May 28 01:10 sslopt-longopts.h
    -rw-r--r--  1 root root 1.1K May 28 01:10 sslopt-vars.h
    -rw-r--r--  1 root root 3.1K May 28 01:10 tilde.h
    -rw-r--r--  1 root root 1.3K May 28 01:10 typelib.h
    -rw-r--r--  1 root root 1.5K May 28 01:10 xmalloc.h








I'm not familiar with the "R CMD INSTALL" command, but it might be looking for the mysql socket rather than the mysql command itself. Or it might be examining the /etc/my.cnf file.

Most likely, the R CMD INSTALL command untars the tarball, runs the configure program and then make && make install.
If that is the case, use the:
--with-mysql-dir=MYSQL_DIR specifies an existing MySQL base dir

--with-mysql-inc=MYSQL_INC specifies an existing MySQL include dir

--with-mysql-lib=MYSQL_LIB specifies an existing MySQL lib dir

options.



From the configure.in file:

Code:

dnl 2. We check for mysql.h and -lmysqlclient in system directories, and if

dnl    found, we use these (provide the user does not explicitly request

dnl    another version, see below).  Notice that the MySQL source distribution

dnl    installs by default to /usr/local/lib/mysql and /usr/local/include/mysql

dnl

dnl 3. Alternatively, if the user specifies explicitly a particular MySQL

dnl    installation we use that version. This can be requested through

dnl         --with-mysql-dir=DIR

dnl         --with-mysql-inc=< include-DIR>

dnl    or   --with-mysql-lib=< library-DIR>

dnl

dnl    (these are equivent to setting and exporting MYSQL_{DIR,INC,LIB})

dnl    In the first case, DIR is assumed to include the lib and include

dnl    subdirectories;  individual locations of these two may be

dnl    specified independently through < include-inc> and < library-dir>,

dnl    respectively.  If we found these, we exit.

dnl

dnl 4. We check for the GNU implementation of getopt_long and set the

dnl    C preprocessor macro HAVE_GETOPT_LONG accordingly.  On windows

dnl    (including MinGW) should be false.

dnl

dnl Global variables: The following variables may be set and exported

dnl prior to running configure:

dnl    PKG_CPPFLAGS, PKG_LIBS, MYSQL_DIR, MYSQL_INC, MYSQL_LIB

You could first enter:

Code:

MYSQL_LIB=/usr/lib/mysql    ( or /usr/lib64/mysql depending on your architecture )

MYSQL_DIR=/usr/bin          ( I think it should be the directory where the mysql* commands are located )

export MYSQL_LIB MYSQL_DIR

And then give your "R CMD INSTALL" command another whirl.



I don't know about MYSQL_INC, That one sounds like it would be from the mysql source.

 	  	





 08-03-2006, 02:21 PM	   #3

PB0711

Member

 

Registered: Aug 2004

Location: London, UK

Distribution: ubuntu lucid, mac OSX snow, M$ windoze

Posts: 257



Original Poster 

Rep: 

So an R package is just like a CPAN package for Perl. I guess I should call it a module/library. R being a statiscial programming language.



I tried the

Quote:

You could first enter:

Code:



MYSQL_LIB=/usr/lib/mysql 

MYSQL_DIR=/usr/bin 

export MYSQL_LIB MYSQL_DIR

However, I'm still getting the same install problem asking me to define the directory.

I am sorry I didn't get back earlier, I was away from the internet.  



I don't know or see what I am doing wrong. I'm on a x86 and everything is standard so it should all work!?!?!?

 	  	

 08-03-2006, 02:25 PM	   #4

PB0711

Member

 

Registered: Aug 2004

Location: London, UK

Distribution: ubuntu lucid, mac OSX snow, M$ windoze

Posts: 257



Original Poster 

Rep: 

Umm maybe this will help?

Code:





dios:~ # R CMD INSTALL RMySQL_0.5-7.tar.gz

* Installing *source* package 'RMySQL' ...

creating cache ./config.cache

checking how to run the C preprocessor... cc -E

checking for compress in -lz... yes

checking for getopt_long in -lc... yes

checking for mysql_init in -lmysqlclient... no

checking for mysql.h... no

checking for /usr/local/include/mysql/mysql.h... no

checking for /usr/include/mysql/mysql.h... no

checking for /usr/local/mysql/include/mysql/mysql.h... no

checking for /opt/include/mysql/mysql.h... no

checking for /include/mysql/mysql.h... no





Configuration error:

  could not find the MySQL installation include and/or library

  directories.  Manually specify the location of the MySQL

  libraries and the header files and re-run R CMD INSTALL.



INSTRUCTIONS:



1. Define and export the 2 shell variables PKG_CPPFLAGS and

   PKG_LIBS to include the directory for header files (*.h)

   and libraries, for example (using Bourne shell syntax):



      export PKG_CPPFLAGS="-I< MySQL-include-dir>"

      export PKG_LIBS="-L< MySQL-lib-dir> -lmysqlclient"



   Re-run the R INSTALL command:



      R CMD INSTALL RMySQL_< version>.tar.gz



2. Alternatively, you may pass the configure arguments

      --with-mysql-dir=< base-dir> (distribution directory)

   or

      --with-mysql-inc=< base-inc> (where MySQL header files reside)

      --with-mysql-lib=< base-lib> (where MySQL libraries reside)

   in the call to R INSTALL --configure-args='...'



   R CMD INSTALL --configure-args='--with-mysql-dir=DIR' RMySQL_< version>.tar.gz



ERROR: configuration failed for package 'RMySQL'

** Removing '/usr/lib/R/library/RMySQL'







 07-18-2010, 11:18 AM	   #5

PB0711









Member

 

Registered: Aug 2004

Location: London, UK

Distribution: ubuntu lucid, mac OSX snow, M$ windoze

Posts: 257



Original Poster 

Rep: 

I love comming back to my old threads and seeing what I did wrong. Well if anyone stumbles across this and doesn't know what to do you probably didn't install the mysql dbi library. In ubuntu/debian this would be:



Code:

sudo apt-get install libdbd-mysql libmysqlclient16-dev

In suse just find the libdbd-mysql package in yum or YaST







CHECK FOR libmysqlclient MODULE AVAILABILITY AND MYSQL VERSIONS WITH yum:

    

yum list | grep mysql



    mysql.i386                                 5.0.77-4.el5_5.3            installed

    mysql.x86_64                               5.0.77-4.el5_5.3            installed

    mysql-devel.i386                           5.0.77-4.el5_5.3            installed

    mysql-devel.x86_64                         5.0.77-4.el5_5.3            installed

    mysql-server.x86_64                        5.0.77-4.el5_5.3            installed

    php-mysql.x86_64                           5.1.6-23.2.el5_3            installed

    apr-util-mysql.x86_64                      1.2.7-11.el5                base     

    bytefx-data-mysql.x86_64                   1.2.4-2.el5.centos          extras   

    freeradius-mysql.x86_64                    1.1.3-1.6.el5               base     

    freeradius2-mysql.x86_64                   2.1.7-7.el5                 base     

    libdbi-dbd-mysql.x86_64                    0.8.1a-1.2.2                base     
    lighttpd-mod_mysql_vhost.x86_64            1.4.28-1.el5.rf             rpmforge 
    mod_auth_mysql.x86_64                      1:3.0.0-3.2.el5_3           base     
    mysql-bench.x86_64                         5.0.77-4.el5_5.3            updates  
    mysql-connector-odbc.x86_64                3.51.26r1127-1.el5          base     
    mysql-test.x86_64                          5.0.77-4.el5_5.3            updates  
    pdns-backend-mysql.x86_64                  2.9.21-4.el5.centos         extras   
    perl-Class-DBI-mysql.noarch                1.00-1.el5.rf               rpmforge 
    perl-DBD-mysql.x86_64                      4.014-1.el5.rf              rpmforge 
    php-mysql.x86_64                           5.1.6-27.el5                base     
    php-pear-MDB2-Driver-mysql.noarch          1.4.1-3.el5.centos          extras   
    php-pecl-session_mysql.x86_64              1.9-2.el5.rf                rpmforge 
    proftpd-mysql.x86_64                       1.3.2-1.el5.rf              rpmforge 
    qt4-mysql.x86_64                           4.2.1-1                     base     
    rsyslog-mysql.x86_64                       3.22.1-3.el5                base     



MYSQL CONFIGURE OPTIONS:

mysql_config --libs

    mysql_config --include
    -rdynamic -L/usr/lib64/mysql -lmysqlclient -lz -lcrypt -lnsl -lm -L/usr/lib64 -lssl -lcrypto


mysql_config --include
    
    -I/usr/include/mysql



ERASED i386 VERSION OF mysql-devel ON linode

yum erase mysql-devel.i386

    Removed: mysql-devel.i386 0:5.0.77-4.el5_5.3
    Complete!


yum install mysql-devel

    
    
    Loaded plugins: allowdowngrade, fastestmirror
    Loading mirror speeds from cached hostfile
     * rpmforge: apt.sw.be
     * base: ftp.usf.edu
     * updates: centos.corenetworks.net
     * addons: ftp.usf.edu
     * extras: mirror.sanctuaryhost.com
    R-project                                                                                                                         | 1.0 kB     00:00     
    rpmforge                                                                                                                          | 1.1 kB     00:00     
    base                                                                                                                              | 2.1 kB     00:00     
    updates                                                                                                                           | 1.9 kB     00:00     
    primary.sqlite.bz2                                                                                                                | 658 kB     00:00     
    addons                                                                                                                            |  951 B     00:00     
    extras                                                                                                                            | 2.1 kB     00:00     
    Setting up Install Process
    Parsing package install arguments
    Package mysql-devel-5.0.77-4.el5_5.3.x86_64 already installed and latest version
    Package mysql-devel-5.0.77-4.el5_5.3.i386 already installed and latest version
    Nothing to do



R CMD INSTALL --configure-args="--with-mysql-dir=$HOME/mysql" ...

ENSURE RMySQL can find the non-system libraries at run-time.:

This is typically managed by an environment variable (LD_LIBRARY_PATH or DYLD_LI\
BRARY_PATH for OSX) or the /etc/ld.so.cache.













TileQC
------

source("http://science.oregonstate.edu/~dolanp/tileqc/tileQC.R")
biocLite("tileQC")






ShortRead
---------

source("http://bioconductor.org/biocLite.R")
biocLite("ShortRead")
    
    ...
    ** help
    *** installing help indices
    ** building package indices ...
    * DONE (ShortRead)
    
    The downloaded packages are in
            ‘/tmp/RtmpJanuYi/downloaded_packages’
    Updating HTML index of packages in '.Library'
    
    OK!





NB: ERROR CAUSED BY glibc-devel NOT BEING INSTALLED:

source("http://bioconductor.org/biocLite.R")
biocLite("ShortRead")
    
    gcc -m32 -std=gnu99 -I/usr/include/R  -I/usr/local/include    -fpic  -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i386 -mtune=generic -fasynchronous-unwind-tables -c Biostrings_stubs.c -o Biostrings_stubs.o

    Biostrings_stubs.c:1:31: error: _Biostrings_stubs.c: No such file or directory
    

</entry>
<entry [Wed 2011:07:06 05:32:39 EST] INSTALL TileQC FROM INSIDE R>
  
  
source("http://science.oregonstate.edu/~dolanp/tileqc/tileQC.R")
biocLite("tileQC")


</entry>
<entry [Wed 2011:07:06 05:32:06 EST] ADDING PACKAGES IN R>

Packages

Packages are collections of R functions, data, and compiled code in a well-defined format. The directory where packages are stored is called the library. R comes with a standard set of packages. Others are available for download and installation. Once installed, they have to be loaded into the session to be used.

.libPaths() # get library location 
library()   # see all packages installed 
search()    # see packages currently loaded

ADDING PACKAGES

You can expand the types of analyses you do be adding other packages. A complete list of contributed packages is available from CRAN.

Follow these steps:

Download and install a package (you only need to do this once).
To use the package, invoke the library(package) command to load it into the current session. (You need to do this once in each session, unless you customize your environment to automatically load it each time.)
On MS Windows:

Choose Install Packages from the Packages menu.
Select a CRAN Mirror. (e.g. Norway)
Select a package. (e.g. boot)
Then use the library(package) function to load it for use. (e.g. library(boot))
On Linux:

Download the package of interest as a compressed file.
At the command prompt, install it using 
R CMD INSTALL [options] [l-lib] pkgs
Use the library(package) function within R to load it for use in the session.
CREATING YOUR OWN PACKAGES

To create your own packages look at Writing R Extensions (the definitive guide) and Simple Generation of R Packages Under Windows (just what it says).

 
  
</entry>
