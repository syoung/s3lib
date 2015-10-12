biolinux



<entry [Wed 2013:07:03 16:05:32 EST] BIOLOGICAL DATABASES - NUCLEIC ACIDS RESEARCH>

ANNUAL COMPENDIUM OF BIOLOGICAL DATABASES
http://nar.oxfordjournals.org/content/41/D1.toc

SEARCH 'disease'

    
</entry>
<entry [Wed 2013:07:03 16:04:38 EST] EMBOSS WEB UIs (SRSWWW: QUICK BLAST SEARCH INTERFACE)>




wEMBOSS
http://wemboss.sourceforge.net/

SRSWWW
http://srs.ebi.ac.uk/srsbin/cgi-bin/wgetz?-page+srsq2+-noSession

    
</entry>
<entry [Wed 2013:07:03 16:00:54 EST] EMBOSS PACKAGES>

EMBOSS key features

There have been tens of thousands of unique downloads in the short time it has been available including site-wide installations by administrators catering for hundreds or even thousands of users.

The uses and interfaces to EMBOSS have long grown beyond our ability to keep track of them. EMBOSS is used extensively in production environments rather than being the sort of "research project" code that gets presented at conferences, but never actually deployed.

EMBOSS has several important advantages:

    A properly constructed toolkit for creating robust bioinformatics applications or workflows.
    A comprehensive set of sequence analysis programs.
    All sequence and many alignment and structural formats are handled.
    Extensive programming library for common sequence analysis tasks.
    Additional programming libraries for many other areas including string handling, pattern-matching, list processing and database indexing.
    It is free-of-charge.
    It is an open-source project.
    It runs on practically every UNIX you can think of and some that you can't, plus MS Windows and MacOS.
    Each application has the same style of interface so master one and you've mastered them all.
    The consistent user interface facillitates GUI designers and developers.
    It integrates other popular publicly available packages.
    It is free of arbitrary size limits: there are no limits on the amount of data that can be processed.
    For the programmer, memory management for objects such as sequences and arrays is simplified. 

EMBOSS is mature and stable. A major new version of EMBOSS is released each year. You can download the current version .

What can I use EMBOSS for?

Within EMBOSS you will find around hundreds of programs (applications) covering areas such as:

    Sequence alignment,
    Rapid database searching with sequence patterns,
    Protein motif identification, including domain analysis,
    Nucleotide sequence pattern analysis---for example to identify CpG islands or repeats,
    Codon usage analysis for small genomes,
    Rapid identification of sequence patterns in large scale sequence sets,
    Presentation tools for publication,

and much more.

Popular applications include:
prophet 	Gapped alignment for profiles.
infoseq 	Displays some simple information about sequences.
water 	Smith-Waterman local alignment.
pepstats 	Protein statistics.
showfeat 	Show features of a sequence.
palindrome 	Looks for inverted repeats in a nucleotide sequence.
eprimer3 	Picks PCR primers and hybridization oligos.
profit 	Scan a sequence or database with a matrix or profile.
extractseq 	Extract regions from a sequence.
marscan 	Finds MAR/SAR sites in nucleic sequences.
tfscan 	Scans DNA sequences for transcription factors.
patmatmotifs 	Compares a protein sequence to the PROSITE motif database.
showdb 	Displays information on the currently available databases.
wossname 	Finds programs by keywords in their one-line documentation.
abiview 	Reads ABI file and display the trace.
tranalign 	Align nucleic coding regions given the aligned proteins.
    
</entry>
<entry [Wed 2013:07:03 14:03:01 EST] TOTAL ADDITIONS TO /etc/apt/sources.list>

#### BIOLINUX
deb http://distro.ibiblio.org/bio-linux/packages/ unstable bio-linux
deb http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main
deb-src http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main

#### R
deb http://http://cran.cnr.Berkeley.edu/bin/linux/ubuntu raring/

    
</entry>
<entry [Wed 2013:07:03 13:59:34 EST] INSTALL R WITH APT-GET>

http://cran.r-project.org/bin/linux/ubuntu/README

INSTALLATION

To obtain the latest R packages, EDIT FILE:


/etc/apt/sources.list file


ADD:

deb http://http://cran.cnr.Berkeley.edu/bin/linux/ubuntu raring/


FROM:

<!--   
   deb http://<my.favorite.cran.mirror>/bin/linux/ubuntu raring/

-->


WHERE list of CRAN mirrors:

http://cran.r-project.org/mirrors.html



To install the complete R system, use

   sudo apt-get update
   sudo apt-get install r-base
   
    
</entry>
<entry [Fri 2013:04:19 01:46:12 EST] INSTALLED GALAXY IN BIOLINUX>


1. INSTALL DEPENDENCIES

DOWNLOAD AND INSTALL libboost FOR CUFFLINKS

http://www.ubuntuupdates.org/package/core/precise/universe/base/libboost-thread1.48.0
dpkg -i libboost-thread1.48.0_1.48.0-3_amd64.deb 
    OK

INSTALL CUFFLINKS
apt-get install cufflinks
apt-get install tophat
    OK

2. INSTALL ucsc-tools-non-free
# NB: DOES NOT WORK: apt-get install ucsc-tools-non-free

mkdir -p /mnt/home/syoung/software/biolinux/ucsc-tools
cd /mnt/home/syoung/software/biolinux/ucsc-tools
wget http://nebc.nerc.ac.uk/downloads/bio-linux/ucsc-tools-non-free_3.1-2_amd64.deb
sudo dpkg -i ucsc-tools-non-free_3.1-2_amd64.deb
    OK
    

4. INSTALL GALAXY

apt-get install galaxy-server-all
    OK




NOTES
-----

Installation of Galaxy & (many) dependencies on Ubuntu / Biolinux
https://gist.github.com/cbergman/3146037


# Follow steps 1-4 on Ubuntu or 2-4 on Biolinux
 
1. Add repositories to your machine configuration
 
a. Bio-Linux
$ sudo add-apt-repository “deb http://nebc.nerc.ac.uk/bio-linux/ unstable bio-linux”
$ sudo apt-get update
$ sudo apt-get install bio-linux-keyring
 
b. CRAN
Switch to using the CRAN version of R for Ubuntu. Bio-Linux uses an up-to-date version of R from the CRAN repository whereas default Ubuntu uses an older version of R. We are currently testing on the CRAN version and are not sure whether the final Galaxy packaging will require the CRAN version or not.
 
sudo add-apt-repository "deb http://www.stats.bris.ac.uk/R/bin/linux/ubuntu lucid/"
sudo add-apt-repository "deb-src http://www.stats.bris.ac.uk/R/bin/linux/ubuntu lucid/"
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
 
2. Install UCSC packages
 
Download ucsc-tools-non-free:
wget http://nebc.nerc.ac.uk/downloads/bio-linux/ucsc-tools-non-free_3.1-2_amd64.deb
sudo dpkg -i ucsc-tools-non-free_3.1-2_amd64.deb
 
3. Install and run Galaxy with all the dependencies
 
Open a terminal and type the following commands
$ sudo apt-get update
$ sudo apt-get install galaxy-server-all
 
4. Open galaxy web interface
 
Go to: Applications ⇒ Bioinformatics ⇒ Galaxy


galaxy-server-all:
 Depends: cufflinks but it is not going to be installed
 Depends: tophat but it is not going to be installed
 Recommends: ucsc-tools-non-free  but it is not installable
 Recommends: laj  but it is not installable

galaxy-server       A web-based analysis environment
galaxy-server-test  Test and demo data for Galaxy server
galaxy-server-all   Galaxy server with all recommended tools

apt-get install galaxy-server-all





    
</entry>
<entry [Wed 2013:04:17 14:49:29 EST] ONLINE PACKAGE DOCUMENTATION>


EXTERNAL LINKS BY APPLICATION NAME:

http://nebc.nerc.ac.uk/bioinformatics/docs/aaindexextract.html?select_app=aaindexextract&cat=
http://nebc.nerc.ac.uk/bioinformatics/docs/acdtrace.html?select_app=acdtrace&cat=


    
</entry>
<entry [Sun 2013:04:14 14:49:12 EST] DOWNLOADED AND INSTALLED BIOLINUX>

CLOUD BIOLINUX
https://github.com/chapmanb/cloudbiolinux


USE GIT

https://github.com/chapmanb/cloudbiolinux.git



USE apt-get TO INSTALL INDIVIDUAL PACKAGES

1. EDIT FILE /etc/apt/sources.list

ADD

deb http://distro.ibiblio.org/bio-linux/packages/ unstable bio-linux
deb http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main
deb-src http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main


2. DOWNLOAD Bio-Linux Software Package List

sudo apt-get update
sudo apt-get install bio-linux-keyring

CONFIRM:

dpkg -p bio-linux-keyring
    Package: bio-linux-keyring
    Priority: important
    Section: misc
    Maintainer: Tim Booth < helpdesk@nebc.nerc.ac.uk >
    Architecture: all
    Version: 5
    Size: 3942
    Description: Public key package for the Bio-Linux package repository
     Ensures that further packages can be installed without warnings.
     Also adds the key for the official NEBC Launchpad PPA, and CRAN.


3. INSTALL BIOLINUX SHARED/REQUIRED PACKAGES

apt-get install bio-linux-shared        # MENUS AND ICONS
apt-get install  bio-linux-assembly-conversion-tools


4. INSTALL SYNAPTIC

sudo apt-get install synaptic && synaptic


5. INSTALL BIOLINUX PACKAGES USING SYNAPTIC

LIST OF DOWNLOADABLE PACKAGES
https://launchpad.net/~nebc/+archive/bio-linux/+packages
SOME SOURCES USE THEIR OWN NAMES, OTHERS USE BIOLINUX WRAPPERS

SELECT ALL BIOLINUX PACKAGES
Click the reload button in the top left hand of the synaptic panel.
Click the search button in the top right hand corner of the synaptic panel.
In the search box type bio-linux.
A list of over 50 packages should appear.
Click on the package name of the top entry with the left mouse button (most likely bio-linux-act). Note - it is best not to click in the checkbox to the left of the name at this point.
Use the scrollbar to scroll to the last entry in the packages list in the main Synaptic window.
Hold down the shift key and left-click on the name of the final entry (most likely bio-linux-yamap).
All package names should now be highlighted.


DESELECT
bio-linux arb
bio-linux-blast # (CONFLICTS WITH bio-linux-blast+)
bio-linux-big-blast
bio-linux-biocode
bio-linux-mira
bio-linux-qiime



bio-linux-glimmer
Scroll to find bio-linux-glimmer and bio-linux-glimmer3,only one of these packages is required, bio-linux-glimmer contains glimmer version 2 and bio-linux-glimmer3 contains glimmer version 3. You should deselect the version that is not required (by holding down the control key and left click the name of the package you do not want. 
Right-click on the highlighted area.

INSTALL PACKAGES
Select Mark for installation  in the menu that appears.
You may then get a message that this action affects other packages as well. Click the Mark button.
Click the Apply button.
If a Summary window pops-up, click the Apply button again.
The bio-linux packages should now install. This will take some time.

... WHICH INSTALLED THE APPS TO HERE:

/usr/local/bioinf

BUT GOT AN ERROR:

    Selecting previously unselected package libbio-samtools-perl.
    (Reading database ... 213830 files and directories currently installed.)
    Unpacking libbio-samtools-perl (from .../libbio-samtools-perl_1.33-1_amd64.deb) ...
    Processing triggers for man-db ...

    Setting up bio-linux-cdbfasta (1:20100722bl-3) ...

    Finished installing Bio-Linux package : bio-linux-cdbfasta
    /var/lib/dpkg/info/bio-linux-cdbfasta.postinst: 3: /var/lib/dpkg/info/bio-linux-cdbfasta.postinst: /usr/bin/update-menus: not found
    dpkg: error processing bio-linux-cdbfasta (--configure):
     subprocess installed post-installation script returned error exit status 127
    dpkg: dependency problems prevent configuration of bio-linux-chimeraslayer:
     bio-linux-chimeraslayer depends on bio-linux-cdbfasta; however:
      Package bio-linux-cdbfasta is not configured yet.
    
    dpkg: error processing bio-linux-chimeraslayer (--configure):
     dependency problems - leaving unconfigured
    Setting up libbio-samtools-perl (1.33-1) ...
    No apport report written because the error message indicates its a followup error from a previous failure.
                              Errors were encountered while processing:
     bio-linux-cdbfasta
     bio-linux-chimeraslayer
    E: Sub-process /usr/bin/dpkg returned an error code (1)
    A package failed to install.  Trying to recover:
    Setting up bio-linux-cdbfasta (1:20100722bl-3) ...
    Finished installing Bio-Linux package : bio-linux-cdbfasta
    /var/lib/dpkg/info/bio-linux-cdbfasta.postinst: 3: /var/lib/dpkg/info/bio-linux-cdbfasta.postinst: /usr/bin/update-menus: not found
    dpkg: error processing bio-linux-cdbfasta (--configure):
     subprocess installed post-installation script returned error exit status 127
    dpkg: dependency problems prevent configuration of bio-linux-chimeraslayer:
     bio-linux-chimeraslayer depends on bio-linux-cdbfasta; however:
      Package bio-linux-cdbfasta is not configured yet.
    
    dpkg: error processing bio-linux-chimeraslayer (--configure):
     dependency problems - leaving unconfigured
    Errors were encountered while processing:
     bio-linux-cdbfasta
     bio-linux-chimeraslayer


DID SECOND INSTALL WHERE REMOVED

bio-linux-cdbfasta
bio-linux-chimeraslayer

AND INSTALLED

bio-linux-blast+
TO
bio-linux-cd-hit    
    
    (Reading database ... 213864 files and directories currently installed.)
    Removing bio-linux-chimeraslayer ...
    Removing bio-linux-cdbfasta ...
    About to remove Bio-Linux package : bio-linux-cdbfasta
    Finished removing Bio-Linux package: bio-linux-cdbfasta
    /var/lib/dpkg/info/bio-linux-cdbfasta.postrm: 3: /var/lib/dpkg/info/bio-linux-cdbfasta.postrm: /usr/bin/update-menus: not found
    dpkg: error processing bio-linux-cdbfasta (--remove):
     subprocess installed post-removal script returned error exit status 127
    No apport report written because MaxReports is reached already
                                                                  Errors were encountered while processing:
     bio-linux-cdbfasta
    E: Sub-process /usr/bin/dpkg returned an error code (1)
    A package failed to install.  Trying to recover:

SO COMMENTED OUT CALL TO update-menus IN THIS FILE:

em /var/lib/dpkg/info/bio-linux-cdbfasta.postrm

    #!/bin/sh                                                                               
    echo "Finished removing Bio-Linux package: bio-linux-cdbfasta"
    #/usr/bin/update-menus

AND PURGED cdbfasta WITH

apt-get -f install



bio-linux-bldp-files
contains files which install to a folder called /var/www/bioinformatics

Many packages install software to

/usr/local/bioinf

and create symlinks

/usr/local/bin

Other packages install files to more standard Debian/Ubuntu locations.


THEMES

bio-linux-themes-v7
bio-linux-plymouth-theme
The customisations in the bio-linux-themes-v7 package will mostly only apply to new accounts you set up.

Z-SHELL

bio-linux-zsh

CONTAINS THE BIOLINUX standard configuration options for ZSH.  If you want to follow our standard tutorials we suggest you install this package and switch to ZSH.

INSTALL DEPENDENCIES FOR PACKAGES
R
Bioconductor
BioPerl
BioJava
BioPython
BioRuby

USE standard repositories (e.g., APT-GET).


THE *.iso FILE CONTAINS standard firewall settings and SSH security settings.



NOTES
-----

http://nebc.nerc.ac.uk/tools/bio-linux/other-bl-docs/package-repository

Installing Bio-Linux Software

Downloading and installing Bio-Linux packages

Key Bio-Linux package notes

Getting key Bio-Linux functionality

Bio-Linux packages can be installed on 64 bit Ubuntu, Debian or Debian variants. With Bio-Linux 7, the packages are split between those hosted on our local repository and on launchpad.net.  At this time, to get full use out of the Bio-Linux packages, you should add both repositories to your system before installing software.

Please note that packages held in the local NEBC package repository are not core Debian packages and do not confirm to Debian or Ubuntu packaging standards.  For further information on this, please see our Bio-Linux Environment webpage. 

Downloading and installing Bio-Linux packages

If you wish to use the Bio-Linux repository directly from within the Ubuntu Software Centre, apt or Synaptic, you need to add the two Bio-Linux repositories to the list of package repositories your system knows about.  The first site to add to your sources list is either our main UK server (nebc.nerc.ac.uk) or the Ibiblio mirror - the latter is highly recommended for user in North America.  You also need to add the PPA area from launchpad.net.

To add the information manually to your /etc/apt/sources.list file, the complete set of lines to add is: 

deb http://nebc.nerc.ac.uk/bio-linux/ unstable bio-linux

deb http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main
deb-src http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main


or, with the iBiblio mirror


deb http://distro.ibiblio.org/bio-linux/packages/ unstable bio-linux
deb http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main
deb-src http://ppa.launchpad.net/nebc/bio-linux/ubuntu precise main


Do not add an extra deb-src line for the first repository.  It will not work.

If you wish to install software from our repository right away, you will need to run the command: 

sudo apt-get update

then

sudo apt-get install bio-linux-keyring

Your system will then download the Bio-Linux Software Package List from our server.

After the download you may install any of the packages from our repository.

Note:
You may see a warning about "GPG error ... signatures couldn't be verified". This is only a warning, not an error, but to resolve the issue, please install the bio-linux-keyring package.

After you have added the Bio-Linux package repository to your sources list, you can list and install all of the Bio-Linux  packages using any of the package management tools available. Please note that while the Ubuntu Software Centre is a lovely graphical interface to use, if you plan to install many packages, you would be better off using Synaptic. 

There are over 100 packages the are listed if you search for the term "bio-linux" among the packages available to you.  Some of these are wrappers which add some extra docs or functionality to a base package.  Some packages in the Launchpad repository have no bio-linux- wrapper and you should just install the base package.  See the list here:https://launchpad.net/~nebc/+archive/bio-linux/+packages


Key Bio-Linux package notes
Some packages have a dependency on the bio-linux-shared package, as this sorts out some of the menus and icons that are used by more than one package.  There is also a bio-linux-themes-v7 package and a bio-linux-plymouth-theme package that will try to make your Ubuntu look like Bio-Linux, and these are entirely optional.

Warning:
The bio-linux-bldp-files package contains files which install to a folder called /var/www/bioinformatics

Thus, please ensure that you do not have a directory on your system with this name, or that, at the very least, you are not concerned with overwriting any index.html  file in the already existing directory.

Many packages install software to the directories under /usr/local/bioinf  and create symlinks in /usr/local/bin. Other packages install files to more standard Debian/Ubuntu locations.  We try to follow the standard conventions for all new packages.

The bio-linux-zsh package collects our standard configuration options for ZSH.  If you want to follow our standard tutorials we suggest you install this package and switch to ZSH.
Getting key Bio-Linux functionality

If you have an Ubuntu or Debian based installation, you can get access to most of the bioinformatics functionality of Bio-Linux by following the instructions above. There are a few differences between a system installed this way and a "full" Bio-Linux system:

Bio-Linux uses standard packages for R, Bioconductor, BioPerl, BioJava, BioPython and BioRuby. You need to install these on your system yourself from standard repositories (ie. the default system repository or CRAN).
The customisations in the bio-linux-themes-v7 package will mostly only apply to new accounts you set up.

Some customisations you get from the ISO, like the standard firewall settings and SSH security settings, are not available through packages.


</entry>