biorepository.version



<entry [Tue 2015:09:01 04:17:01 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.66] Enabled load 'samples21' in dnaseq>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.66 \
--mode 1-2  \
--log 4 \
--message "Enabled load 'samples21' in dnaseq"

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.66 \
--mode 2-3  \
--log 4 \
--message "Enabled load 'samples21' in dnaseq"
    
    
</entry>
<entry [Sat 2015:08:29 21:47:39 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.65] Added method installDependencies to s3lib>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.65 \
--mode 1-2  \
--log 4 \
--message "Added method installDependencies to s3lib"

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.65 \
--mode 2-3  \
--log 4 \
--message "Added method installDependencies to s3lib"
    
    
</entry>
<entry [Sat 2015:08:29 15:13:20 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.64] Added s3lib dependency to dnaseq>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.64 \
--mode 1-2  \
--log 4 \
--message "Added s3lib dependency to dnaseq"

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.64 \
--mode 2-3  \
--log 4 \
--message "Added s3lib dependency to dnaseq"
    
    
</entry>
<entry [Sat 2015:08:29 15:13:20 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.63] Added s3lib>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.63 \
--mode 1-2  \
--log 4 \
--message "Added s3lib"

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.63 \
--mode 2-3  \
--log 4 \
--message "Added s3lib"
    
    
</entry>
<entry [Sat 2015:08:29 15:13:20 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.62] Fixed additional commented sections in dnaseq.pm>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.62 \
--mode 1-2  \
--log 4 \
--message "Fixed additional commented sections in dnaseq.pm"	

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.62 \
--mode 2-3  \
--log 4 \
--message "Fixed additional commented sections in dnaseq.pm"	
    
    
</entry>
<entry [Sat 2015:08:29 10:02:48 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.61] Fixed commented sections in dnaseq.pm>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.61 \
--mode 1-2  \
--log 4 \
--message "Fixed commented sections in dnaseq.pm"	

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.61 \
--mode 2-3  \
--log 4 \
--message "Fixed commented sections in dnaseq.pm"	
    
    
</entry>
<entry [Sat 2015:08:29 08:12:07 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.60] Updated emboss URL, changed dnaseq URL to github>

1. UPDATED EMBOSS URL (ORIGINAL LINK NOT FOUND)

DOWNLOADED FROM HERE:

http://slackbuilds.org/repository/14.1/academic/EMBOSS/

THEN UPLOADED TO S3.

CHANGED FROM:

    "version"           :   "6.6.0",
	"url"				:	"ftp://emboss.open-bio.org/pub/EMBOSS/old/6.5.0/EMBOSS-$version.tar.gz"

TO:

	"version"			:	"6.6.0",
	"versions"			"	[ "6.5.7", "6.6.0" ],
	"url"				:	"https://s3.amazonaws.com/itmi.pipeline/software/emboss/EMBOSS-$version.tar.gz",


2. UPDATED BIOREPO


/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.60 \
--mode 1-2  \
--log 4 \
--message "Updated emboss URL, changed dnaseq URL to github"	

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.60 \
--mode 2-3  \
--log 4 \
--message "Updated emboss URL, changed dnaseq URL to github"	


    
</entry>
<entry [Fri 2015:05:15 15:43:48 EST] BIOREPOSITORY 2-3  [0.8.0-beta.1+build.59] Added dnaseqref to install Broad BP reference sequences>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.59 \
--mode 2-3  \
--log 4 \
--message "Added dnaseqref to install Broad BP reference sequences"	
  
  
</entry>
<entry [Fri 2015:05:15 15:43:27 EST] BIOREPOSITORY 1-2  [0.8.0-beta.1+build.59] Added dnaseqref to install Broad BP reference sequences>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.59 \
--mode 1-2  \
--log 4 \
--message "Added dnaseqref to install Broad BP reference sequences"	
  
  
</entry>
<entry [Mon 2015:05:11 14:00:47 EST] BIOREPOSITORY 2-3  [0.8.0-beta.1+build.58] Changed gatk from github to S3 download>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.58 \
--mode 2-3  \
--log 4 \
--message "Changed gatk from github to S3 download"	

  
  
</entry>
<entry [Mon 2015:05:11 13:50:43 EST] BIOREPOSITORY 1-2  [0.8.0-beta.1+build.58] Changed gatk from github to S3 download>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.58 \
--mode 1-2  \
--log 4 \
--message "Changed gatk from github to S3 download"	

  
  
</entry>
<entry [Sat 2015:05:09 19:07:54 EST] BIOREPOSITORY 1-2  [0.8.0-beta.1+build.57] Reduced stages to 1-3, added dnaseq, pythia and primer3>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.57 \
--mode 1-3  \
--log 4 \
--message "Reduced stages to 1-3, added dnaseq, pythia and primer3"	
  
</entry>
<entry [Tue 2014:08:26 14:52:56 EST] BIOREPOSITORY 1-4  [0.8.0-beta.1+build.56] Fixed SRA OS-specific zipfiles, renabled Biorepository staging 1-4>

/a/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.56 \
--mode 1-4  \
--log 4 \
--message "Fixed SRA OS-specific zipfiles, renabled Biorepository staging 1-4"	

* 55 seconds ago 5f68734 -Fix stager.pm: Reenable custom commit using mode 1-4
* 9 days ago 595f9da -Inc syoung/sra/sra.pm: Refactored sra.pm handling of ubuntu/centos/osx zipfiles
* 4 weeks ago 5f412b1 -Fix syoung/sra/sra.ops: Added asterisk to 'unzipped' to accomodate mac/centos different filenames

	
</entry>
<entry [Tue 2014:08:26 14:52:55 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.55] Added support for ubuntu and osx in sra package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.55 \
--mode 3-4  \
--log 4 \
--message "Fixed add support for ubuntu and osx in sra package"	

	
</entry>
<entry [Tue 2014:08:26 14:52:50 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.55] Fixed add support for ubuntu and osx in sra package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.55 \
--mode 1-3  \
--log 4 \
--message "Fixed add support for ubuntu and osx in sra package"	

* 35 seconds ago 2ac57cb -Inc syoung/sra/sra.pm: Added support for ubuntu and osx in sra package
	
</entry>
<entry [Tue 2014:08:26 14:50:55 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.54] Added support for ubuntu and osx in sra package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.54 \
--mode 3-4  \
--log 4 \
--message "Added support for ubuntu and osx in sra package"	

	
</entry>
<entry [Tue 2014:08:26 14:48:32 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.54] Added support for ubuntu and osx in sra package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.54 \
--mode 1-3  \
--log 4 \
--message "Added support for ubuntu and osx in sra package"	

* 35 seconds ago 2ac57cb -Inc syoung/sra/sra.pm: Added support for ubuntu and osx in sra package
	
</entry>
<entry [Sun 2014:08:24 23:52:30 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.53] Fixed nfsServer POSTDATA in cu package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.53 \
--mode 3-4  \
--log 4 \
--message "Fixed nfsServer POSTDATA in cu package"	
	
	
</entry>
<entry [Sun 2014:08:24 23:49:57 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.53] Fixed nfsServer POSTDATA in cu package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.53 \
--mode 1-3  \
--log 4 \
--message "Fixed nfsServer POSTDATA in cu package"	
	
	
</entry>
<entry [Mon 2014:08:18 07:35:06 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.52] Updated samtools.pm, corrected load RunTCGA project in cu.pm>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.52 \
--mode 3-4  \
--log 4 \
--message "Updated samtools.pm, corrected load RunTCGA project in cu.pm"	

* 61 seconds ago 3441893 -Fix syoung/cu/cu.pm: Corrected load RunTCGA project
* 2 minutes ago 88f8511 -Inc syoung/samtools/samtools.pm: Added install libcurses, etc. to package 'samtools'
	
	
</entry>
<entry [Mon 2014:08:18 07:31:01 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.52] Updated samtools.pm, corrected load RunTCGA project in cu.pm>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.52 \
--mode 1-3  \
--log 4 \
--message "Updated samtools.pm, corrected load RunTCGA project in cu.pm"	

* 61 seconds ago 3441893 -Fix syoung/cu/cu.pm: Corrected load RunTCGA project
* 2 minutes ago 88f8511 -Inc syoung/samtools/samtools.pm: Added install libcurses, etc. to package 'samtools'
	
	
</entry>
<entry [Wed 2014:08:13 02:11:42 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.51] Moved Extra to PreData and PostData in 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.51 \
--mode 3-4  \
--log 4 \
--message "Moved Extra to PreData and PostData in 'cu' package"	

* 29 seconds ago 9b9874b -Inc syoung/cu/cu.pm: Moved Extra to PreData and PostData
	
	
</entry>
<entry [Wed 2014:08:13 01:45:54 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.51] Moved Extra to PreData and PostData in 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.51 \
--mode 1-3  \
--log 4 \
--message "Moved Extra to PreData and PostData in 'cu' package"	

* 29 seconds ago 9b9874b -Inc syoung/cu/cu.pm: Moved Extra to PreData and PostData
	
</entry>
<entry [Tue 2014:08:12 16:09:05 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.50] Minor edit to .ops in 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.50 \
--mode 3-4  \
--log 4 \
--message "Minor edit to .ops in 'cu' package"

* 13 seconds ago 77ee474 -Dbg syoung/cu/cu.ops: Minor edit
	
	
</entry>
<entry [Tue 2014:08:12 16:03:13 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.50] Minor edit to .ops in 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.50 \
--mode 1-3  \
--log 4 \
--message "Minor edit to .ops in 'cu' package"

* 13 seconds ago 77ee474 -Dbg syoung/cu/cu.ops: Minor edit

</entry>
<entry [Mon 2014:08:11 07:24:11 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.49] Added set NFS server in 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.49 \
--mode 3-4  \
--log 4 \
--message "Added set NFS server in 'cu' package"

	
	
</entry>
<entry [Mon 2014:08:11 07:22:03 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.49] Added set NFS server in 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.49 \
--mode 1-3  \
--log 4 \
--message "Added set NFS server in 'cu' package"



* 37 seconds ago 61a188c -Inc syoung/cu/cu.pm: Added set NFS server IP in 'cu' package
* 12 hours ago a876814 -Inc syoung/cu/cu.pm: Added set queue:host to enable call to volume.pl in package 'cu'
	
	
</entry>
<entry [Sun 2014:08:10 19:31:39 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.48] Added set queue:host in config to enable volume.pl in package 'cu'>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.48 \
--mode 3-4  \
--log 4 \
--message "Added set queue:host in config to enable volume.pl in package 'cu'"
	
	
</entry>
<entry [Sun 2014:08:10 19:29:25 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.48] Added set queue:host in config to enable volume.pl in package 'cu'>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.48 \
--mode 1-3  \
--log 4 \
--message "Added set queue:host in config to enable volume.pl in package 'cu'"
	
	
</entry>
<entry [Sun 2014:08:10 19:10:54 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.48] Reenabled CU package install>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.48 \
--mode 3-4  \
--log 4 \
--message "Reenabled CU package install"

</entry>
<entry [Sun 2014:08:10 19:10:10 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.48] Reenabled CU package install>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.48 \
--mode 1-3  \
--log 4 \
--message "Reenabled CU package install"
		
</entry>
<entry [Sun 2014:08:10 19:08:44 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.47] Added to CU package authentication for RabbitMQ and Openstack>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.47 \
--mode 3-4  \
--log 4 \
--message "Added to CU package authentication for RabbitMQ and Openstack"
	
* 70 seconds ago 1ab9298 -Inc syoung/cu/cu.pm: Added setExtra with RabbitMQ and Openstack authentication
	
</entry>
<entry [Sun 2014:08:10 19:07:27 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.47] Added to CU package authentication for RabbitMQ and Openstack>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.47 \
--mode 1-3  \
--log 4 \
--message "Added to CU package authentication for RabbitMQ and Openstack"
	
* 70 seconds ago 1ab9298 -Inc syoung/cu/cu.pm: Added setExtra with RabbitMQ and Openstack authentication
	
</entry>
<entry [Sun 2014:08:03 12:52:28 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.46] Updated FreeBayes version to v9.9.13>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.46 \
--mode 3-4  \
--log 4 \
--message "Updated FreeBayes version to v9.9.13"
	
	
</entry>
<entry [Sun 2014:08:03 12:46:52 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.46] Updated FreeBayes version to v9.9.13>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.46 \
--mode 1-3  \
--log 4 \
--message "Updated FreeBayes version to v9.9.13"
	
* 2 minutes ago d7fd8c4 -Fix syoung/gatk-protected/gatkprotected.pm: Uncommented gitInstall call
* 3 minutes ago d732256 -Inc syoung/biorepository/versions.tsv: Updated freebayes version to v9.9.13
* 4 minutes ago f0c104c -Fix syoung/sra/sra.ops: Made description MySQL-safe
	
</entry>
<entry [Mon 2014:07:28 04:25:56 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.45] Added load data for SRA and TCGA>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.45 \
--mode 3-4  \
--log 4 \
--message "Added load data for SRA and TCGA"
	
	
</entry>
<entry [Mon 2014:07:28 03:58:06 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.45] Added load data for SRA and TCGA>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.45 \
--mode 1-3  \
--log 4 \
--message "Added load data for SRA and TCGA"
	
</entry>
<entry [Tue 2014:07:22 14:17:14 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.44] Fixed install PanCancer as private package with deploy key>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.44 \
--mode 3-4  \
--log 4 \
--message "Fixed install PanCancer as private package with deploy key"
	
	
</entry>
<entry [Tue 2014:07:22 14:15:57 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.44] Fixed install PanCancer as private package with deploy key>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.44 \
--mode 1-3  \
--log 4 \
--message "Fixed install PanCancer as private package with deploy key"

 29 seconds ago 6888aa6 -Inc syoung: Moved versions.tsv to agua/biorepository and updated versions
	
	
</entry>
<entry [Tue 2014:07:22 12:35:15 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.43] Moved versions.tsv file to agua/biorepository folder>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.43 \
--mode 3-4  \
--log 4 \
--message "Moved versions.tsv file to agua/biorepository folder"

 29 seconds ago 6888aa6 -Inc syoung: Moved versions.tsv to agua/biorepository and updated versions


	
</entry>
<entry [Tue 2014:07:22 12:32:33 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.43] Moved versions.tsv file to agua/biorepository folder>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.43 \
--mode 1-3  \
--log 4 \
--message "Moved versions.tsv file to agua/biorepository folder"

 29 seconds ago 6888aa6 -Inc syoung: Moved versions.tsv to agua/biorepository and updated versions

	
</entry>
<entry [Mon 2014:07:21 23:34:44 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.42] Added usage output to stderr and loadScript method to CLI tools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.42 \
--mode 3-4  \
--log 4 \
--message "Added usage output to stderr and loadScript method to CLI tools"

	
</entry>
<entry [Mon 2014:07:21 19:50:33 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.42] Added usage output to stderr and loadScript method to CLI tools>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.42 \
--mode 1-3  \
--log 4 \
--message "Added usage output to stderr and loadScript method to CLI tools"

* 49 seconds ago bc08f05 -Onw lib/Agua: Added usage to Stage.pm system call, onw CU SRA pipeline
* 7 days ago b7d405f -Inc lib/Agua/CLI/Project.pm,t/unit: Cleaned up Agua::CLI::Project JSON output, added complete test
* 7 days ago 98abb96 -Inc lib/Agua/CLI: Added loadScript to Project, Workflow, App and Parameter classes
	
</entry>
<entry [Tue 2014:07:15 17:42:31 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.41] Fixed 'aspera' package script file path>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.41 \
--mode 3-4  \
--log 4 \
--message "Fixed 'aspera' package script file path"

</entry>
<entry [Tue 2014:07:15 17:41:29 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.41] Fixed 'aspera' package script file path>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.41 \
--mode 1-3  \
--log 4 \
--message "Fixed 'aspera' package script file path"

* 43 seconds ago ccd7f56 -Fix syoung/aspera: Fixed script file path


</entry>
<entry [Tue 2014:07:15 17:24:14 EST] BIOREPOSITORY 3-4  [0.8.0-beta.1+build.40] Fixed 'aspera' package download>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.40 \
--mode 3-4  \
--log 4 \
--message "Fixed 'aspera' package download"

</entry>
<entry [Tue 2014:07:15 17:23:16 EST] BIOREPOSITORY 1-3  [0.8.0-beta.1+build.40] Fixed 'aspera' package download>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.40 \
--mode 1-3  \
--log 4 \
--message "Fixed 'aspera' package download"

</entry>
<entry [Tue 2014:07:15 17:15:23 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.39] Added 'aspera' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.39 \
--mode 3-4 \
--log 4 \
--message "Added 'aspera' package"

</entry>
<entry [Tue 2014:07:15 17:15:23 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.39] Added 'aspera' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.39 \
--mode 1-3 \
--log 4 \
--message "Added 'aspera' package"

* 46 seconds ago 897dd6d +Add syoung/aspera: Added 'aspera' package and confirmInstall test
* 2 minutes ago 2b59f3d -Inc syoung/sra/sra.ops: Added SRA Toolkit description


</entry>
<entry [Tue 2014:07:15 16:10:22 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.38] Added SRA toolkit package 'sra'>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.38  \
--mode 3-4 \
--log 4 \
--message "Added SRA toolkit package 'sra'"

* 2 minutes ago b2181a1 -Fix syoung/cu: Fixed 'already declared' in cu.pm, changed owner to root in cu.ops
\* 3 minutes ago 049ea1c +Add syoung/sra: Added Short Read Archive (SRA) package 'sra'

</entry>
<entry [Tue 2014:07:15 16:10:22 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.38] Added SRA toolkit package 'sra'>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.38  \
--mode 1-3 \
--log 4 \
--message "Added SRA toolkit package 'sra'"

* 2 minutes ago b2181a1 -Fix syoung/cu: Fixed 'already declared' in cu.pm, changed owner to root in cu.ops
\* 3 minutes ago 049ea1c +Add syoung/sra: Added Short Read Archive (SRA) package 'sra'

</entry>
<entry [Thu 2014:07:03 16:48:51 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.37] Changes after add deployment key to 'cu', 'moores' and 'pancancer' repos>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.37  \
--mode 3-4 \
--log 4 \
--message "Changes after add deployment key to 'cu', 'moores' and 'pancancer' repos"

</entry>
<entry [Thu 2014:07:03 16:48:51 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.37] Changes after add deployment key to 'cu', 'moores' and 'pancancer' repos>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.37  \
--mode 1-3 \
--log 4 \
--message "Changes after add deployment key to 'cu', 'moores' and 'pancancer' repos"

* 8 minutes ago 310f64a -Inc syoung/cu,syoung/moores,syoung/pancancer: Changed url to 'git@' format after add bcf-deploy key


</entry>
<entry [Thu 2014:07:03 16:50:41 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.36] Updated to enable '--version max' option>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.36  \
--mode 3-4 \
--log 4 \
--message "Updated to enable '--version max' option"

</entry>
<entry [Thu 2014:07:03 16:48:51 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.36] Updated to enable '--version max' option>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.36  \
--mode 1-3 \
--log 4 \
--message "Updated to enable '--version max' option"


</entry>
<entry [Wed 2014:07:02 17:25:38 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.35] Changed pancancer.pm to return 1>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.35  \
--mode 3-4 \
--log 4 \
--message "Changed pancancer.pm to return 1"


</entry>
<entry [Wed 2014:07:02 17:24:25 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.35] Changed pancancer.pm to return 1>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.35  \
--mode 1-3 \
--log 4 \
--message "Changed pancancer.pm to return 1"


</entry>
<entry [Wed 2014:07:02 16:36:31 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.34] Renabled gitInstall call in cu.pm>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.34  \
--mode 3-4 \
--log 4 \
--message "Renabled gitInstall call in cu.pm"


</entry>
<entry [Wed 2014:07:02 16:35:52 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.34] Renabled gitInstall call in cu.pm>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.34  \
--mode 1-3 \
--log 4 \
--message "Renabled gitInstall call in cu.pm"


</entry>
<entry [Wed 2014:07:02 15:39:46 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.33] Added to 'cu': autoload *work files, load project hierarchy>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.33  \
--mode 3-4 \
--log 4 \
--message "Added to 'cu': autoload *work files, load project hierarchy"

	
	
</entry>
<entry [Tue 2014:07:01 16:40:29 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.33] Added to 'cu': autoload *work files, load project hierarchy>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.33  \
--mode 1-3 \
--log 4 \
--message "Added to 'cu': autoload *work files, load project hierarchy"

* 43 seconds ago 1c343ec -Inc syoung/cu/cu.pm: Added autoload *work files, load project hierarchy to 'cu'


	
</entry>
<entry [Tue 2014:07:01 16:41:51 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.32] Enabled loadData method for 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.32  \
--mode 3-4 \
--log 4 \
--message "Enabled loadData method for 'cu' package"

* 45 seconds ago e90bf30 -Inc syoung/cu: Enabled loadData method for 'cu' package
	
</entry>
<entry [Tue 2014:07:01 16:40:29 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.32] Enabled loadData method for 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.32  \
--mode 1-3 \
--log 4 \
--message "Enabled loadData method for 'cu' package"

* 45 seconds ago e90bf30 -Inc syoung/cu: Enabled loadData method for 'cu' package
	
</entry>
<entry [Thu 2014:06:26 09:12:25 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.31] Removed default version from 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.31  \
--mode 3-4 \
--log 4 \
--message "Removed default version from 'cu' package"

	
</entry>
<entry [Thu 2014:06:19 18:04:30 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.31] Removed default version from 'cu' package>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.31  \
--mode 1-3 \
--log 4 \
--message "Removed default version from 'cu' package"
	
* 29 seconds ago 99af1fd -Inc syoung/cu: Removed default version

	
</entry>
<entry [Thu 2014:06:19 18:12:44 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.30] Fixed return 1 in skel template *.pm>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.30  \
--mode 3-4 \
--log 4 \
--message "Fixed return 1 in skel template *.pm"
	
* 2 minutes ago 9666027 -Inc syoung/biorepository,syoung/moores: Fixed return 1 in skel template, enabled install moores	
	
</entry>
<entry [Thu 2014:06:19 18:04:30 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.30] Fixed return 1 in skel template *.pm>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.30  \
--mode 1-3 \
--log 4 \
--message "Fixed return 1 in skel template *.pm"
	
* 2 minutes ago 9666027 -Inc syoung/biorepository,syoung/moores: Fixed return 1 in skel template, enabled install moores	
	
</entry>
<entry [Thu 2014:06:19 17:37:30 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.29] Moores Cancer Center unmapped virus NGS reads analysis>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.29  \
--mode 3-4 \
--log 4 \
--message "Moores Cancer Center unmapped virus NGS reads analysis"
	
</entry>
<entry [Thu 2014:06:19 17:36:17 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.29] Moores Cancer Center unmapped virus NGS reads analysis>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.29  \
--mode 1-3 \
--log 4 \
--message "Moores Cancer Center unmapped virus NGS reads analysis"
	

* 815d91b (HEAD, master) -Inc syoung: Various updates - bamtools, cu, freebayes, gatk*, libmause, mutect*, pancancer and pcap
* 163db57 +Add syoung/moores: Viral unmapped NGS reads analysis


</entry>
<entry [Thu 2014:06:12 15:51:43 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.28] GT Tools install reenabled>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.28  \
--mode 3-4 \
--log 4 \
--message "GT Tools install reenabled"

</entry>
<entry [Thu 2014:06:12 15:51:35 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.28] GT Tools install reenabled>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.28  \
--mode 1-3 \
--log 4 \
--message "GT Tools install reenabled"
	
* 15 seconds ago 9736f77 -Inc syoung/gt/gt.pm: Renabled GT Tools install

</entry>
<entry [Thu 2014:06:12 15:31:05 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.27] Fixed GT Tools install missing Makefile create step>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.27  \
--mode 3-4 \
--log 4 \
--message "Fixed GT Tools install missing Makefile create step"

</entry>
<entry [Thu 2014:06:12 15:30:32 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.27] Fixed GT Tools install missing Makefile create step>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.27  \
--mode 1-3 \
--log 4 \
--message "Fixed GT Tools install missing Makefile create step"
	
* 47 seconds ago 38b65ec -Inc syoung/gt/gt.pm: Added create Makefile step to GT Tools install

</entry>
<entry [Thu 2014:06:12 11:17:57 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.26] Populated GT Tools opsfile>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.26  \
--mode 3-4 \
--log 4 \
--message "Populated GT Tools opsfile"

</entry>
<entry [Thu 2014:06:12 11:17:49 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.26] Populated GT Tools opsfile>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.26  \
--mode 1-3 \
--log 4 \
--message "Populated GT Tools opsfile"

* 2 minutes ago b37db89 -Fix syoung/gt: Added return 1 to gt.pm, populated gt.ops


</entry>
<entry [Mon 2014:06:09 09:04:32 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.25] Added fix for FreeBayes makeInstall>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.25  \
--mode 3-4 \
--log 4 \
--message "Added fix for FreeBayes makeInstall"

</entry>
<entry [Mon 2014:06:09 09:04:32 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.25] Added fix for FreeBayes makeInstall>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.25  \
--mode 1-3 \
--log 4 \
--message "Added fix for FreeBayes makeInstall"

* 54 seconds ago 76905e6 -Fix syoung/cu,syoung/freebayes: Added fix for FreeBayes treeish 7e198dc makeInstall

</entry>
<entry [Mon 2014:06:09 09:04:32 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.24] Added skel option and packages: cu, gt, pancancer and pcap>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.24  \
--mode 3-4 \
--log 4 \
--message "Added skel option and packages: cu, gt, pancancer and pcap"

</entry>
<entry [Mon 2014:06:09 09:04:32 EST] BIOREPOSITORY 1-3 [0.8.0-beta.1+build.23] Added skel option and packages: cu, gt, pancancer and pcap>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.23  \
--mode 1-3 \
--log 4 \
--message "Added skel option and packages: cu, gt, pancancer and pcap"

* 46 seconds ago 452dee8 -Fix syoung/cu/cu.pm: Uncommented after debugging
* 2 minutes ago e9f5613 -Inc syoung/pcap: Enabled copy of template bwa_mem.pl
* 2 minutes ago bef72b3 +Add syoung/pcap/templates/bwa_mem.pl: Edited bwa_mem.pl with '--workdir' option to replace or
* 7 minutes ago 8c9d4d5 +Add syoung/cu,syoung/gt: Added 'cu' and 'gt' packages
* 13 days ago 2559153 -Onw syoung/pcap: Creating pcap installer
* 13 days ago 4540d87 -Inc syoung/versions.tsv: Added pancancer 0.0.1
* 13 days ago 53ba350 -Inc syoung/pancancer: Completed install PanCancer and load workflows
* 13 days ago 4e4c1a2 +Add syoung/biorepository/templates/skel.pm: Skeleton *.pm file
* 2 weeks ago edc3a8a +Add syoung/versions.tsv: List of packages and latest versions
* 2 weeks ago 9f4e040 +Add syoung/pcap: Stub created by 'deploy.pl --mode skel'
* 2 weeks ago 8af9d71 +Add syoung/pancancer: Stub created by 'deploy.pl --mode skel'

</entry>
<entry [Fri 2014:05:23 07:59:16 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.22] Updated biobambam to non-git install>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.22 \
--mode 3-4 \
--log 4 \
--message "Updated biobambam to non-git install"

</entry>
<entry [Fri 2014:05:23 07:59:06 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.22] Updated biobambam to non-git install>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.22 \
--mode 2-3 \
--log 4 \
--message "Updated biobambam to non-git install"

</entry>
<entry [Fri 2014:05:23 07:58:50 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.22] Updated biobambam to non-git install>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.22 \
--mode 1-2 \
--log 4 \
--message "Updated biobambam to non-git install"

</entry>
<entry [Mon 2014:03:31 02:46:40 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.21] Added biobambam and libmaus dependency>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.21 \
--mode 3-4 \
--log 4 \
--message "Fixed all biotools v5 installs"

</entry>
<entry [Mon 2014:03:31 02:46:40 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.21] Added biobambam and libmaus dependency>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.21 \
--mode 2-3 \
--log 4 \
--message "Fixed all biotools v5 installs"

</entry>
<entry [Mon 2014:03:31 02:38:02 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.21] Added biobambam and libmaus dependency>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.21 \
--mode 1-2 \
--log 4 \
--message "Fixed all biotools v5 installs

* 29 seconds ago 00b8dcc +Fix syoung: Fixed install of R, bedtools2, emboss, fastqc, mutect and picard
"

</entry>
<entry [Tue 2014:03:11 02:26:27 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.20] Added biobambam and libmaus dependency>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.20 \
--mode 3-4 \
--message "Added biobambam and libmaus dependency" \
--log 4

</entry>
<entry [Tue 2014:03:11 02:26:27 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.20] Added biobambam and libmaus dependency>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.20 \
--mode 2-3 \
--message "Added biobambam and libmaus dependency" \
--log 4

</entry>
<entry [Tue 2014:03:11 02:26:27 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.20] Added biobambam and libmaus dependency>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.20 \
--mode 1-2 \
--message "Added biobambam and libmaus dependency

* 30 seconds ago 6956e0c +Add syoung/biobambam,syoung/libmaus: Added biobambam with libmaus
" \
--log 4

</entry>
<entry [Tue 2014:03:11 02:29:37 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.19] Added mutect binary download>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.19 \
--mode 3-4 \
--message "Added mutect binary download" \
--log 4

</entry>
<entry [Tue 2014:03:11 02:29:32 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.19] Added mutect binary download>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.19 \
--mode 2-3 \
--message "Added mutect binary download" \
--log 4

</entry>
<entry [Tue 2014:03:11 02:26:27 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.19] Added mutect binary download>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.19 \
--mode 1-2 \
--message "Added mutect binary download

* 22 seconds ago 7fc16e6 -Fix syoung/mutect: Changed to downloadInstall of binar
* 40 seconds ago beb1d9b +Add syoung/mutectbuild: Build version of muTect
" \
--log 4

</entry>
<entry [Mon 2014:03:10 17:03:27 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.18] Fixed Ops::Install for biotools v4>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.18 \
--mode 3-4 \
--message "Fixed Ops::Install for biotools v4" \
--log 4

</entry>
<entry [Mon 2014:03:10 17:03:27 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.18] Fixed Ops::Install for biotools v4>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.18 \
--mode 2-3 \
--message "Fixed Ops::Install for biotools v4" \
--log 4

</entry>
<entry [Mon 2014:03:10 17:03:27 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.18] Fixed Ops::Install for biotools v4>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.18 \
--mode 1-2 \
--message "Fixed Ops::Install for biotools v4" \
--log 4

</entry>
<entry [Wed 2014:03:05 05:26:48 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.16] Enabled install all biotools v4 apps with tests>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.16 \
--mode 3-4 \
--message "Enabled install all biotools v4 apps with tests" \
--log 4

</entry>
<entry [Wed 2014:03:05 05:26:48 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.16] Enabled install all biotools v4 apps with tests>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.16 \
--mode 2-3 \
--message "Enabled install all biotools v4 apps with tests" \
--log 4

</entry>
<entry [Wed 2014:03:05 05:26:48 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.16] Enabled install all biotools v4 apps with tests>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.16 \
--mode 1-2 \
--message "Enabled install all biotools v4 apps with tests" \
--log 4

</entry>
<entry [Wed 2014:03:05 05:26:48 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.13] Enabled fuller dependencies in Aps::Ops>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.13 \
--mode 3-4 \
--message "Enabled fuller dependencies in Aps::Ops" \
--log 4

</entry>
<entry [Wed 2014:03:05 05:26:48 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.13] Enabled fuller dependencies in Aps::Ops>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.13 \
--mode 2-3 \
--message "Enabled fuller dependencies in Aps::Ops" \
--log 4

</entry>
<entry [Wed 2014:03:05 05:26:48 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.13] Enabled fuller dependencies in Aps::Ops>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.13 \
--mode 1-2 \
--message "Enabled fuller dependencies in Aps::Ops

* 72 seconds ago +Add t/unit/html/plugins/packages: Added with grunt and QUnit tests
* 5 days ago 85d61b2 +Add bin/install/resources/agua: Added biorepository.pm and *.ops
* 8 days ago 6474c2d +Add t/unit/html/plugins/apps/packages: Test Apps pane Packages panel
" \
--log 4

</entry>
<entry [Mon 2014:02:24 20:19:23 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.12] Enabled automatic installation with dependencies>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.12 \
--mode 3-4 \
--message "Enabled automatic installation with dependencies"
	
</entry>
<entry [Mon 2014:02:24 20:19:23 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.12] Enabled automatic installation with dependencies>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.12 \
--mode 2-3 \
--message "Enabled automatic installation with dependencies"
	
</entry>
<entry [Mon 2014:01:13 00:52:01 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.12] Enabled automatic installation with dependencies>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.12 \
--mode 1-2 \
--message "Enabled automatic installation with dependencies

+Add syoung: Added R, blat and rsem with tests
-Inc syoung/freebayes/freebayes.ops: Removed tophat dependency (used for testing)
+Add syoung: Added m4, mutect and samtools
-Inc syoung: Updates to bedtools, bwa, cmake, emboss and fastqc
+Add syoung/fastx,syoung/freebayes: Implemented freebayes with cmake dependency
-Del syoung/picard,syoung/tophat,syoung/varscan: Deleted usage.txt file
+Add syoung/fastqc: Updated and added output.txt test
+Add syoung: Added bedtools, bowtie2, bwa, cmake, picard and varscan.
| Updated cufflinks, emboss and tophat
+Del syoung/tophat,syoung/bowtie2: Clean up old files and tophat *.tar.gz file
-Inc syoung: Enabled install - bowtie2, cufflinks and tophat
+Add syoung/cufflinks: Added cufflinks
+Add syoung: Added biotools apps, completed tophat.pm w/o tests

" \
--log 4

</entry>
<entry [Mon 2014:01:13 00:54:01 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.11] Fixed bioapps.pm 'privacy' object method>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.11 \
--mode 3-4 \
--message "Enabled load of latest bioapps version" \
--log 4

</entry>
<entry [Mon 2014:01:13 00:53:01 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.11] Fixed bioapps.pm 'privacy' object method>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.11 \
--mode 2-3 \
--message "Enabled load of latest bioapps version" \
--log 4

</entry>
<entry [Mon 2014:01:13 00:52:01 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.11] Fixed bioapps.pm 'privacy' object method>

/aguadev/bin/scripts/stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.11 \
--mode 1-2 \
--message "Enabled load of latest bioapps version

3500d1b -Fix syoung/bioapps/bioapps.pm: Enabled load of latest bioapps version
Added 'mountpoint' object method to bioapps.pm
Added $self->login("agua") to preInstall method

" \
--log 4

</entry>
<entry [Sun 2014:01:12 23:23:39 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.10] Fixed bioapps.pm 'privacy' object method>

cd /agua/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.10 \
--mode 3-4 \
--message "Fixed bioapps.pm 'privacy' object method" \
--log 4

</entry>
<entry [Sun 2014:01:12 23:22:39 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.10] Fixed bioapps.pm 'privacy' object method>

cd /agua/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.10 \
--mode 2-3 \
--message "Fixed bioapps.pm 'privacy' object method" \
--log 4

</entry>
<entry [Sun 2014:01:12 23:21:39 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.10] Fixed bioapps.pm 'privacy' object method>

cd /agua/bin/scripts

./stager.pl \
--stagefile /mnt/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.10 \
--mode 1-2 \
--message "Fixed bioapps.pm 'privacy' object method" \
--log 4

</entry>
<entry [Fri 2012:10:26 01:56:04 EST] BIOREPOSITORY 3-4 [0.8.0-beta.1+build.1] -Onw bioapps.pm: TEST loadTsvFiles>

1. FIXED /nethome ENTRIES IN agua USER ProjectX

cd /mnt/repos/public/agua/biorepodev/agua/workflows/projects
perl -pi -e 's/\/nethome/\/home/g' ProjectX/*.proj
perl -pi -e 's/\/nethome/\/home/g' ProjectX/*.work
grep -c "/nethome" ProjectX/1-Workflow1.work 
    0
grep -c "/nethome" ProjectX/ProjectX.proj
    0

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.1 \
--mode 3-4 \
--message "First commit. Shadows agua 0.8.0-beta.1" \
--log 4

</entry>
<entry [Sun 2012:12:23 19:07:58 EST] BIOREPOSITORY 2-3 [0.8.0-beta.1+build.2] +Fix Changed /nethome entries in workflows to /home>

1. REMOVED ProjectX WORKFLOWS FOR TESTING PURPOSES

rm -fr /mnt/repos/private/syoung/biorepostage/syoung/workflows/projects/ProjectX

2. SET CHANGES IN VERSION

git rm -r /mnt/repos/private/syoung/biorepostage/syoung/workflows/projects/ProjectX
git commit --amend
    OK


3. RAN STAGER

ADJUSTED PERMISSIONS SO THAT syoung USER CAN ALTER agua:biorepodev
cd /agua/repos/public/agua/biorepodev
sudo chown -R syoung:syoung .
sudo chown -R syoung:syoung .git


/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.2 \
--mode 2-3 \
--message "+Fix Changed /nethome entries in workflows to /home" \
--log 4


4. agua:biorepodev DID NOT CONTAIN THE Project3 DIR FROM syoung

    TEST OK
    

</entry>
<entry [Sun 2012:12:23 19:07:58 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.2] +Fix Changed /nethome entries in workflows to /home>

1. FIXED /nethome ENTRIES IN WORKFLOWS

cd /mnt/repos/private/syoung/biorepodev/syoung/workflows/projects
perl -pi -e 's/\/nethome/\/home/g' */*.proj
perl -pi -e 's/\/nethome/\/home/g' */*.work
grep -c "/nethome" Project1/1-Workflow1.work 
    0
grep -c "/nethome" Project1/Project1.proj
    0


/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.2 \
--mode 1-2 \
--message "+Fix Changed /nethome entries in workflows to /home" \
--log 4


</entry>
<entry [Sun 2012:12:23 10:55:33 EST] BIOREPOSITORY 1-2 [0.8.0-beta.1+build.1] +Add First commit. Shadows agua 0.8.0-beta.1>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-beta.1+build.1 \
--mode 1-2 \
--message "+Add First commit. Shadows agua 0.8.0-beta.1

* cbe5bf5 +Add syoung/bioapps/bioapps.pm: Method loadFeatures and spun out loadApps.

" \
--log 4

</entry>

<entry [Sun 2012:12:23 10:55:33 EST] BIOREPOSITORY 1-2 [0.8.0-alpha.1+build.7] -Onw bioapps.pm: TEST loadTsvFiles>


/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-alpha.1+build.7 \
--mode 1-2 \
--message "-Onw bioapps.pm: TEST loadTsvFiles

* 2671d5d -Fix syoung/bioapps/bioapps.pm: Removed old mountpoint setter (getVolume call)

" \
--log 4

</entry>
<entry [Fri 2012:10:26 01:56:04 EST] BIOREPOSITORY 2-3 [0.8.0-alpha.1+build.6] +Fix Cleaned and updated using Stager>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-alpha.1+build.6 \
--mode 2-3 \
--message "+Fix Cleaned and updated using Stager

+Del aguatestdev using Stager
+Fix transfer syoung data to agua using Stager
" \
--log 4

</entry>
<entry [Thu 2012:10:25 19:13:03 EST] BIOREPOSITORY 1-2 [0.8.0-alpha.1+build.6] -Fix: TEST commit before tag>


/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-alpha.1+build.6 \
--mode 1-2 \
--message "-Fix: TEST commit before tag" \
--log 4

</entry>
<entry [Thu 2012:10:25 19:13:03 EST] BIOREPOSITORY 1-2 [0.8.0-alpha.1+build.5] -Fix: TEST setVersion without commit>


/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-alpha.1+build.5 \
--mode 1-2 \
--message "-Fix: TEST setVersion without commit" \
--log 4

</entry>
<entry [Thu 2012:10:25 18:27:31 EST] BIOREPOSITORY 1-2 [0.8.0-alpha.1+build.4] -Del aguatestdev: RETRY remove>


/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-alpha.1+build.4 \
--mode 1-2 \
--message "-Del aguatestdev: RETRY remove
" \
--log 4

</entry>
<entry [Thu 2012:10:25 18:01:27 EST] BIOREPOSITORY 1-2 [0.8.0-alpha.1+build.3] -Fix stager.conf REPODIR>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-alpha.1+build.3 \
--mode 1-2 \
--message "[0.8.0-alpha.1+build.3] -Fix stager.conf REPODIR

Changed from /repos to /agua/repos
" \
--log 4

</entry>
<entry [Sat 2012:10:13 23:07:07 EST] BIOREPOSITORY 2-3 0.8.0-alpha.1+build.2: +Add:Compatible with agua 0.8.0-alpha.1+build.37>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/biorepodev/stager.pm \
--version 0.8.0-alpha.1+build.2 \
--mode 2-3 \
--message "Compatible with agua 0.8.0-alpha.1+build.37

Add syoung/starcluster enables installStarCluster
Add Compatible with agua 0.8.0-alpha.1+build.37
Fix Added restart apache2 (FCGI processes)
Fix Move all conf dir files on upgrade" \
--log 4



</entry>
<entry [Sat 2012:10:13 23:07:07 EST] BIOREPOSITORY 2-3 (PUBLIC DEVEL) 0.8.0-alpha.1+build1: +Add:Compatible with agua 0.8.0-alpha.1+build.37>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build2 \
--sourcerepo /repos/private/syoung/biorepostage \
--targetrepo /repos/public/agua/biorepodev \
--versiontype build \
--description "+Add syoung/starcluster enables installStarCluster"



</entry>
<entry [Sat 2012:10:13 23:06:55 EST] BIOREPOSITORY 1-2 0.8.0-alpha.1+build2: +Add syoung/starcluster enables installStarCluster>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build2 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/private/syoung/biorepostage \
--versiontype build \
--description "+Add syoung/starcluster enables installStarCluster"


</entry>
<entry [Mon 2012:10:08 23:46:20 EST] BIOREPOSITORY 2-3 (PUBLIC DEVEL) 0.8.0-alpha.1+build1: +Add:Compatible with agua 0.8.0-alpha.1+build.37>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build1 \
--sourcerepo /repos/private/syoung/biorepostage \
--targetrepo /repos/public/agua/biorepodev \
--versiontype build \
--description "+Add:Compatible with agua 0.8.0-alpha.1+build.37"

    OK
    USED TO UPGRADE biorespository (AS biorepodev) ON ERIDANUS-0.8.0-alpha.1 !!


</entry>
<entry [Wed 2012:09:05 01:18:18 EST] BIOREPOSITORY 1-2 0.7.6+build13 +Fix: Install ok bioapps on agua 0.8.0-alpha.1+build23>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--version 0.7.6+build13 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/public/syoung/biorepository \
--description "+Fix: Install ok bioapps on 0.8.0-alpha.1+build23"

    OK
    
    
</entry>
<entry [Tue 2012:09:04 03:08:02 EST] BIOREPOSITORY 1-2 0.7.6+build.12 +Fix: Agua upgrade failure due to bug in Logger>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--version 0.7.6+build.12 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/public/syoung/biorepository \
--description "+Fix: Agua upgrade failure due to bug in Logger"

    OK
    
    
</entry>


<entry [Wed 2012:08:29 21:58:27 EST] BIOREPOSITORY 1-2 0.7.6+build.11 -Fix: agua.pm call to updateTable using owner>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--version 0.7.6+build.11 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/public/syoung/biorepository \
--description "-Fix: agua.pm call to updateTable using owner"


</entry>
<entry [Sat 2012:08:25 01:54:51 EST] BIOREPOSITORY 1-2 0.7.6+build.10 +Add: Install.pm call to terminalInstall>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--version 0.7.6+build.10 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/public/syoung/biorepository \
--description "+Add: Install.pm call to terminalInstall"


</entry>
<entry [Wed 2012:08:22 17:38:26 EST] BIOREPOSITORY 1-2 0.7.6+build9 -Fix: Added restart apache2 (FCGI processes)>
    
/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.7.6+build9 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/public/syoung/biorepository \
--description "-Fix: Added restart apache2 (FCGI processes)"

</entry>
<entry [Wed 2012:08:22 17:38:26 EST] BIOREPOSITORY 1-2 0.7.6+build8 -Fix: Removed call to deprocated method setConfFile>
    
/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.7.6+build8 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/public/syoung/biorepository \
--description "-Fix: Removed call to deprocated method setConfFile"

</entry>
<entry [Tue 2012:08:21 23:40:40 EST] BIOREPOSITORY 1-2 0.7.6+build7 -Fix: Added slots for confdir and tempdir>
    
/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.7.6+build7 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/public/syoung/biorepository \
--description "-Fix: Added slots for confdir and tempdir"

</entry>
<entry [Tue 2012:08:21 23:05:40 EST] BIOREPOSITORY 1-2 0.7.6+build6 +Fix: Move all  conf dir files on upgrade>
    
/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.7.6+build6 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/public/syoung/biorepository \
--description "+Fix: Move all  conf dir files on upgrade"


</entry>
<entry [Sun 2012:08:19 14:22:00 EST] BIOREPOSITORY 1-2 0.7.6+build5 +Add: Call updateConfig to add new entries to config>

/agua/bin/scripts/transfer.pl \
--repository agua \
--outputdir /home/syoung/RELEASE \
--version 0.7.6+build5 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/public/syoung/biorepository \
--description "+Add: Call updateConfig to add new entries to config"
    
    
</entry>
<entry [Sun 2012:03:11 13:41:57 EST] BIOREPOSITORY 1-2 0.8.0-alpha.1+build1: +Add:Compatible with agua 0.8.0-alpha.1+build.37>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build1 \
--sourcerepo /repos/private/syoung/biorepodev \
--targetrepo /repos/private/syoung/biorepostage \
--versiontype build \
--description "+Add:Compatible with agua 0.8.0-alpha.1+build.37"


</entry>
<entry [Sun 2012:03:11 13:41:57 EST] BIOREPOSITORY 1-2 0.7.6+build4: -Fix: Missing projectobjects in biorepository.pm>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--versiontype build \
--sourcerepo /agua/repos/public/agua/biorepository \
--targetrepo /repos/public/syoung/biorepository \
--versiontype build \
--description "-Fix: Missing projectobjects in biorepository.pm"

    Created new version: 0.7.6+build4

COPY TO /repos/public/agua/biorepository AND PUSH:

cd /repos/public/agua/biorepository
rm -fr /repos/public/agua/biorepository/*
cp -r /repos/public/syoung/biorepository/* /repos/public/agua/biorepository

git add .
git commit -a
    +Add: Enabled load Agua workflows


</entry>
<entry [Sun 2012:03:11 10:09:35 EST] BIOREPOSITORY 0.7.6+build3: +Add: Enabled load Agua workflows>

/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--versiontype build \
--sourcerepo /agua/repos/public/agua/biorepository \
--targetrepo /repos/public/syoung/biorepository \
--versiontype build \
--description "


Created new version: 0.7.6+build3

transfer.pl    repofile: /home/syoung/RELEASE/bioapps.0.7.6+build3-eb0793b.tar.gz
transfer.pl    version: 0.7.6+build3


FROM

/agua/repos/public/agua/biorepository

TO

/repos/public/syoung/biorepository


COPY TO /repos/public/agua/biorepository AND PUSH:

cd /repos/public/agua/biorepository
rm -fr /repos/public/agua/biorepository/*
cp -r /repos/public/syoung/biorepository/* /repos/public/agua/biorepository

git add .
git commit -a
    +Add: Enabled load Agua workflows

NOTES
=====

REMOVE REMOTE 

git tag -d 0.7.6+build1
git push github :refs/tags/0.7.6+build1

</entry>
<entry [Thu 2012:02:23 17:35:46 EST] TRANSFERRED biorepository DEVELOPMENT TO PRODUCTION>

COPIED FROM

/agua/repos/public/agua/biorepository

TO

/repos/public/syoung/biorepository


/agua/bin/scripts/transfer.pl \
--repository biorepository \
--outputdir /home/syoung/RELEASE \
--versiontype build \
--sourcerepo /agua/repos/public/agua/biorepository \
--targetrepo /repos/public/syoung/biorepository \
--desc "Fixed bioapps.pm print to logfile (post-reboot)"
    
    
COPY TO /repos/public/agua/biorepository AND PUSH:


    
    
</entry>
