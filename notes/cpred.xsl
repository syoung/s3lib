cpred

<entry [Sun 2015:03:15 09:17:24 EST] DOWNLOAD AND INSTALL>

mkdir -p /a/apps/cpred
cd /a/apps/cpred
wget ftp://ftp.nhgri.nih.gov/pub/outgoing/cdpred/cdpred.tar.gz


README

---------------------------------------

|  Intstalling and Running CDPred     |

---------------------------------------



----------------------------------------------------------------------------------------------------

REQUIREMENTS

----------------------------------------------------------------------------------------------------

CDPred should function on any standard 64bit Linux environment. Though the scripts 

themselves don't need much physical memory, the CDD database and domain models require 

a good amount (~16GB for a single version, eg. CDD V2.14).



- Scripts / libraries / example data (~200MB)

- CDD Database files (~16GB)

- Temporary directory needs to be determined and needs attention for removal of temporary files

- Make sure all the required perl modules are installed

	- Bio::SearchIO::blast ( Download from : http://search.cpan.org/~cjfields/BioPerl-1.6.0/Bio/SearchIO/blast.pm)

	- POSIX ( Download from : http://perldoc.perl.org/POSIX.html)

	- Getopt::Long

	- Pod::Usage

	- Data::Dumper

	- Config::YAML

	- File::Spec::Functions

- Make sure that these and your currently installed lib directories are in the PERL5LIB path 





----------------------------------------------------------------------------------------------------

DOWNLOAD AND INSTALL

----------------------------------------------------------------------------------------------------

- Download the tarball from FTP-site and move to the directory where you want to install CDPred



- In the directory where the tar-ball is located,just type

> tar -zxvf cdpred.tar.gz



- Make install and compile "rpsblast" and "formatrpsdb" (from NCBI) on your local machine 



- Download the CDD database files from NCBI FTP site

	- ** BEFORE YOU DO THIS STEP, SETUP THE ENVIRONMENTAL VARIABLE $CDDHOME 



	= CDDHOME='/path/where/you'd/want/to/install/CDD-database'



	- Run the shell script : sh.UpdateCDD (takes version of CDD as argument ($1). example V2.14

		Just type in (cdpred)/bin directory 

		>./sh.UpdateCDD V2.14



	- The above script FTPs the CDD database from NCBI FTP site and compiles the library

	

	- ** IT IS CRITICAL TO HAVE formatrpsdb INSTALLED FOR THE COMPILATION OF CDD LIBRARY





- Add the following Environment Variables to your .bashrc file

	- BLASTDB='/path/to/the/CDD/database/for/rpsBLAST/to/search'

		example : export BLASTDB='/home/cherukur/NCBI/cdd/v2.14/rpsblast/' (the version numbers, eg. V2.14 change)

					  this will be : $CDDHOME/cdd/v2.14/rpsblast



	- CDDOASIS='/path/to/CDD/models/' # acd and smp files

		example : export CDDOASIS='/home/cherukur/NCBI/cdd/v2.14/oasis' (the version numbers, eg. V2.14 change)

					   this will be : $CDDHOME/cdd/v2.14/oasis



	- CDPBIN='/path/to/your/current/installation/of/CDPred/bin-directory/'

		example : export CDPBIN='/home/cherukur/projectCDPred/CDP_V1.01/bin'



	- TMPDIR='/path/to/tmp/directory'

		example : export TMPDIR='/home/cherukur/tmp'



	- RPSBLAST='/path/to/rpsblast'

		example : export RPSBLAST='/usr/bin'



	- CDPREDHOME='/path/to/the/base-directory/for/CDPred'

		example : export CDPREDHOME='/home/cherukur/projectCDPred'





----------------------------------------------------------------------------------------------------

REQUIRED INPUT FILES FOR CDPRED

----------------------------------------------------------------------------------------------------



- CDPred is currently available only as a standalone version for linux/unix platforms



- CDPred expects the following 3 files as input



	- 1. Protein Fasta (or multi-Fasta) file, with query sequences (-f option) 

		See example file : data/example_data/*.fa



	- 2. Mutations or Variation file. This file is a tab delimited-file with the following columns (-m option)

		column 1 = sequence name [**ABSOLUTELY ESSENTIAL THAT THIS MATCHES THE NAME IN FASTA FILE]

		column 2 = reference amino acid / wild-type amino acid (make sure this matches in fasta file); single letter code

		column 3 = position of amino acid

		column 4 = mutant or variant amino acid; single letter code 

		See example file : data/example_data/*.mut



	- 3. BLOSUM file; preferred file is BLOSUM62. The different variations of BLOSUM files are in data/blosum_matrices

		- BLOSUM45  BLOSUM50  BLOSUM62  BLOSUM80  BLOSUM90



	- 4. cddid.tbl file; this is located in the current version directory of CDD database install; example $CDDHOME/<version>/cddid.tbl





----------------------------------------------------------------------------------------------------

RUNNING CDPRED

----------------------------------------------------------------------------------------------------

> perl /path-to-CDPRED/cdpred.pl -f <fasta.file> -m <mutation/variation.file> --blosumfile <BLOSUM62.file> -c <cddid.tbl>



Example:

	

	> perl $CDPBIN/cdpred.pl -f $CDPREDHOME/CDP_V1.01/data/example_data/test_sequence.fa  -m $CDPREDHOME/CDP_V1.01/data/example_data/test_sequence.mut   --blosumfile $CDPREDHOME/CDP_V1.01/data/blosum_matrices/BLOSUM62   -c /home/cherukur/NCBI/cdd/v2.14/cddid.tbl



Output :

	

	gi|4504975|ref|NP_000518.1	A	50	S	pfam00057	26	0	-1	-1	9e-08	25	58	1	34

	gi|4504975|ref|NP_000518.1	C	27	*	pfam00057	3	X	X	-30	9e-08	25	58	1	34

	gi|4504975|ref|NP_000518.1	N	591	K	pfam00058	20	5	0	-5	2e-10	573	614	1	41

	gi|4504975|ref|NP_000518.1	Y	188	*	ND	ND	ND	ND	-30	ND	ND	ND	ND	ND



 ND = No domain Annotation in the location of mutation; defaults to BLOSUM matrix used (above BLOSUM62)

 X = The Refn and Mut Scores are not applicable when the resulting mutation is a Stop. Defaults to -30 



----------------

 Output Columns:

----------------

 1. Protein Name

 2. Refn / Wild-type / Major Allele

 3. Position on protein sequence

 4. Mutant / Variant / Minor Allele

 5. CDD Domain Name 

 6. Position in Domain

 7. Refn Score

 8. Mutant Score

 9. Delta Score

 10. E-value

 11. Protein From (beginning of domain mapping / alignment on protein)

 12. Protein To (end of domain mapping / alignment on protein)

 13. Domain From (beginning of domain's coordinate in model from alignment data )

 13. Domain To (end of domain's coordinate in model from alignment data )

	

----------------------------------------------------------------------------------------------------

CONTACT FOR FURTHER INFORMATION

----------------------------------------------------------------------------------------------------

Praveen F. Cherukuri (cherukur@mail.nih.gov) 

Jim C. Mullikin (mullikin@mail.nih.gov)



--------------------------------------------------

Public Domain Notice

--------------------------------------------------



 This software/database is either a United States Government Work or was made under contract for the United States Government.

 In either case the public may use the software/database on a worldwide and royalty-free basis for any purpose and may reproduce

 and prepare derivative works without limitation. Although all reasonable efforts have been taken to ensure the accuracy and

 reliability of the software/database and associated data, the National Human Genome Research Institute (NHGRI),

 National Institutes of Health (NIH) and the U.S. Government do not and cannot warrant the performance or results that may be

 obtained by using this software/database or data. NHGRI, NIH and the U.S. Government disclaim all warranties as to performance,

 merchantability or fitness for any particular purpose.



 In any work or product derived from this material, proper attribution of the authors as the source of the software/database

 or data should be made, using the following citation: "Massively parallel sequencing of exons on the X chromosome identify RBM10

 as the gene that causes a syndromic form of cleft palate." (2010) Johnston JJ, Teer JK, Cherukuri PF, Hansen NF, Loftus SK,

 NISC, Chong K, Mullikin JC, Biesecker LG. The American Journal of Human Genetics (In Press).





</entry>