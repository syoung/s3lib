agua.blueprint.archive.1


<entry [Wed 2012:02:08 23:43:49 EST] BLUEPRINT: IMPLEMENTED DEVELOPMENT/PRODUCTION REPOSITORY PLAN (CHANGED)>

SEE [Wed 2012:02:08 22:48:56 EST] BLUEPRINT: PRODUCTION AND DEVELOPMENT REPOSITORIES


1. DEVELOPMENT REPOSITORIES (PRIVATE)

    -2  syoung:aguadev (commits)
        Builds of Agua (Transfer to private repo syoung:agua for testing)
        /repos/private/syoung/aguadev --> /agua
        
        git remote add github git@github.com:syoung/aguadev
        git remote add linode ssh://root@173.230.142.248/srv/git/private/syoung/aguadev

    -1   syoung:agua (builds - testing on remote)
        Development (unstable) code for Agua cloud workflow platform (For stable code, see: www.github.com/agua/agua)
        /repos/private/agua/agua
   
        git remote add github git@github.com:agua/aguadev
        git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/aguadev

    0   agua:aguadev (major, minor, patch - testing on remote)
        Development (unstable) code for Agua cloud workflow platform (For stable code, see: www.github.com/agua/agua)
        /repos/public/agua/aguadev
   
        git remote add github git@github.com:agua/aguadev
        git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/aguadev

    1   agua:agua (major, minor, patch - production)
        Stable release of Agua cloud workflow platform 
        /repos/public/agua/aguadev
   
        git remote add github git@github.com:agua/aguadev
        git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/aguadev

    2   syoung:bioapps                     
        /agua/bioapps --> /repos/private/syoung/bioapps
    
        git remote add github git@github.com:syoung/bioappsdev
        git remote add linode ssh://root@173.230.142.248/srv/git/private/syoung/bioapps

    3   syoung:biorepository
        /agua/repos/private/syoung/biorepository --> /repos/private/syoung/biorepository

        git remote add github git@github.com:syoung/biorepodev
        git remote add linode ssh://root@173.230.142.248/srv/git/private/syoung/biorepository

        NB: MERGED CONCEPTS OF 'PRIVATE' AND 'DEVELOPMENT' REPOS
            git@github.com:syoung/private CHANGED TO git@github.com:syoung/biorepodev
        
    4   agua:biorepository
        /agua/repos/public/agua/biorepository --> /repos/private/agua/biorepository
    
        git remote add github git@github.com:syoung/biorepodev-agua
        git remote add linode ssh://root@173.230.142.248/srv/git/private/agua/biorepository

    5   syoung:aguatest
        Tests for Agua cloud workflow platform
        /agua/t --> /repos/private/syoung/aguatest
    
        git remote add github git@github.com:syoung/aguatest
        git remote add linode ssh://root@173.230.142.248/srv/git/private/syoung/aguatest
        git remote add bit ssh://git@bitbucket.org/stuartpyoung/aguatest.git
        
2. PRODUCTION REPOSITORIES (PUBLIC)
    
    0   agua:agua-nightly                OK
        To be created: Nightly build of Agua with results of automatic tests
        /repos/public/agua/agua-nightly
 
        git remote add github git@github.com:agua/agua-nightly
        git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/agua-nightly

    1   agua:agua                        OK
        /repos/public/agua/agua
 
        git remote add github git@github.com:agua/agua
        git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/agua
       
    2   agua:bioapps                     OK
        /repos/public/agua/bioapps  

        git remote add github git@github.com:agua/bioapps
        git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/bioapps
    
    3   syoung:biorepo    OK    
        (syoung's public repository of life sciences software and data sources)
        /agua/repos/public/syoung/biorepository --> /repos/public/syoung/biorepository

        #### MOVED FROM DEV TO PRODUCTION 
        ###git remote add github git@github.com:syoung/biorepository
        ###git remote add linode ssh://root@173.230.142.248/srv/git/biorepository
        
        git remote add github git@github.com:syoung/biorepository
        git remote add linode ssh://root@173.230.142.248/srv/git/public/syoung/biorepository
    
    4   biorepositories (agua)      OK
        (A public repository of life sciences software and data sources)
        /repos/public/agua/biorepository

        git remote add github git@github.com:agua/biorepository
        git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/biorepository
    
    5   aguatest (agua)
        Tests for Agua cloud workflow platform
        /repos/public/agua/aguatest
    
        git remote add github git@github.com:agua/aguatest
        git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/aguatest


NOTES
=====

TOOK 20 MINS TO UPLOAD agua/agua

/repos/public/agua/agua# git push github master
Counting objects: 9267, done.
Compressing objects: 100% (8807/8807), done.
Writing objects:   2% (261/9267), 4.66 MiB | 19 KiB/s     
Writing objects:  63% (5839/9267), 23.53 MiB | 18 KiB/s   
Writing objects: 100% (9267/9267), 37.28 MiB | 15 KiB/s, done.
Total 9267 (delta 1364), reused 0 (delta 0)
To git@github.com:agua/agua
 * [new branch]      master -> master



</entry>
<entry [Wed 2012:02:08 22:48:56 EST] BLUEPRINT: PRODUCTION AND DEVELOPMENT REPOSITORIES PLAN>
    
1. DEVELOPMENT REPOSITORIES

    -   agua                    --> REMOTE www.github.com/syoung/aguadev
    
        /agua

    -   bioapps                 --> REMOTE www.github.com/syoung/bioapps
    
        /agua/bioapps --> /repos/private/syoung/bioapps
        
    -   biorepository (agua)    -->  REMOTE www.github.com/syoung/biorepository
        
        /agua/repos/public/agua/biorepository --> /repos/public/agua/biorepo

    -   biorepository (syoung)  -->  REMOTE www.github.com/syoung/biorepo
        
        /agua/repos/public/syoung/biorepository

    -   private                 -->  REMOTE www.github.com/syoung/private
    
        /agua/repos/private
        /agua/repos/private/agua/biorepository
        /agua/repos/private/syoung/biorepository

    
2. PRODUCTION REPOSITORIES
    
    -   agua            --> REMOTE www.github.com/agua/agua

        /repos/public/agua/agua
        
    -   bioapps         --> REMOTE www.github.com/agua/bioapps
    
        /repos/public/agua/bioapps
    
    -   biorepositories (agua)
    
        /repos/public/agua/biorepository
        (A public repository of life sciences software and data sources.)

        git remote add github git@github.com:agua/biorepository
        git remote add linode ssh://root@173.230.142.248/srv/git/biorepository-agua

    -   biorepositories (syoung) --> REMOTE www.github.com/syoung/biorepository
    
        /repos/public/syoung/biorepository
    

    
</entry>
<entry [Mon 2012:02:06 04:17:38 EST] BLUEPRINT: THE default.conf FILE AND PACKAGES>
    
THREE RELATED USAGE SCENARIOS INVOLVING default.conf FILE ENTRIES FOR PACKAGE APPLICATIONS


USAGE SCENARIO 1
================

1. ADMIN USER INSTALLS A PACKAGE WITH APPLICATIONS THAT DEPEND ON DATA IN A SNAPSHOT

2. THERE ARE MULTIPLE VOLUMES (E.G., DATA, APPLICATIONS, OUTPUT) ATTACHED SO NEED TO UNIQUELY IDENTIFY CORRECTLY

3. CONF FILE MUST CONTAIN THE NEW FILEPATH TO RESOURCES IN THE ATTACHED VOLUME

4. ATTACHED VOLUMES ARE MOUNTED IN THE ROOT DIR DUE TO NFS SENSITIVITIES


SOLUTION:

    1. CHECK FOR PRESENCE OF VOLUME WHEN INSTALLING (I.E., IF package TABLE ENTRY EXISTS)
    
    2. CREATE VOLUME IF NOT EXISTS
    
    3. EXTRACT OPSDIR/conf/packagename.conf CONF FILE CONTENTS TO default.conf
    
    4. SET PATHS OF ENTRIES IN default.conf OF VOLUME RESOURCES TO INCLUDE MOUNT DIR

    

USAGE SCENARIO 2
================

1. WANT TO RUN APPLICATION WITH DIFFERENT VERSIONS OF A THIRD-PARTY APP

    SOLUTION:
    
        - USE DIFFERENT CONF FILE KEYS FOR DIFFERENT VERSIONS
    
            E.G., RETRIEVE THIS ENTRY:
                
            [applications   aquarius-8]
            BOWTIE_1.2.3            /data/apps/bowtie/1.2.3/bowtie
    
            USING THIS COMMAND:    
    
            conf->getKey("applications", "BOWTIE_1.2.3")
    
        -   THE PACKAGE OWNER SPECIFIES A UNIQUE VERSION NAME TO BE USED FOR EACH BINARY VERSION

        -   LEGACY: AN ALL NON-NUMERIC NAME REPRESENTS THE LATEST VERSION
        
            [applications   aquarius-8]
            BOWTIE                  /data/apps/bowtie/0.12.2
            CASAVA                  /data/apps/casava/1.6.0/bin
            CROSSMATCH              /data/apps/crossmatch/0.990329/cross_match


USAGE SCENARIO 3
================

1. RUN A PACKAGE APPLICATION E.G., BOWTIE.pl IN bioapps PACKAGE

2. APPLICATION NEEDS TO LOCATE OTHER THIRD-PARTY APPS, E.G., bowtie BINARY

3. INSTALLATON DIRECTORY OF PACKAGE IS DETERMINED AT INSTALL TIME

4. MOUNT POINT OF DATA VOLUME IS DETERMINED AT INSTALL TIME 


SOLUTION:

    1. SNAPSHOTS HAVE A UNIQUE NAME, WHICH IS USED AS THE *.conf SECTION VALUE:
    
        -   AN EASY-TO-REMEMBER NAME SAVES PROGRAMMER HAVING TO REMEMBER SNAPSHOT ID

        -   SNAPSHOT ID IS STORED AS 'SNAPSHOT' KEY VALUE
        
            [applications    aquarius-8.0.0]
            SNAPSHOT        snap-6341b301
            
            [data   aquarius-8.0.0]
            SNAPSHOT        snap-6341b301


    2. EACH VERSION OF A PACKAGE USES ONLY ONE SNAPSHOT
    

    3. MULTIPLE VERSIONS CAN USE THE SAME SNAPSHOT
    

    4. INSTALL/UPGRADE A PACKAGE --> THE SNAPSHOT IS CHECKED AND VOLUME IS MOUNTED IF MISSING
    

    5. THE DATA PACKAGE INSIDE THE SNAPSHOT HAS A SHORT (< 20 CHARACTERS) UNIQUE NAME 
    

    6. THE DATA PACKAGE OWNER MUST PROVIDE A UNIQUE NAME FOR THEIR SNAPSHOT
        
        -   PACKAGE 'VERSION' IS SEMVER-COMPLIANT
    
        -   NAME + 'VERSION' PROVIDED IN PACKAGE INFORMATION
    
    
    7. APPLICATIONS IN A PACKAGE LOOK UP THE default.conf ENTRIES USING THE UNIQUE SNAPSHOT NAME
    
        E.G., THIS LINE:
        
        my $velvet = $self->conf()->getKey("applications:aquarius-8", "VELVET_1.3.4")
        
        WILL RETRIEVE THE ADJUSTED PATH TO VELVET v1.3.4 FROM THIS CONF SECTION:
        
        [applications aquarius-8]
        VELVET_1.3.4                  /data2/apps/velvet/velvet/1.3.4
        VELVET_1.3.6                  /data2/apps/velvet/velvet/1.3.6
        VELVET_1.3.9                  /data2/apps/velvet/velvet/1.3.9
    
    
        WHERE THE /data2 PATH IS:
    
            -   THE MOUNT POINT FOR THE VOLUME CREATED FROM THE SNAPSHOT
    
            -   THE mountpoint FIELD FOR THE SNAPSHOT IN THE volume TABLE
            
            -   DECIDED AUTOMATICALLY ON CREATION OF A NEW VOLUME (INCREMENT OF /dataN)
        

    8. EACH PACKAGE MAY CONTAIN A CONFIG FILE WHOSE CONTENTS ARE TO BE ADDED TO default.conf
        
        -   ini FORMAT JUST LIKE default.conf
    
        -   Agua::Conf CAN PARSE PACKAGE CONF FILE 


    9. app TABLE STORES APPLICATION LOCATION IN installdir AND location FIELDS
            
        SELECT * FROM app LIMIT 1\G

             owner: admin
           package: bioapps
           version: 0.6.0
        installdir: /agua/0.6/bioapps
              name: eland2ace
              type: converter
          location: /agua/0.6/bioapps/bin/apps/eland2ace.pl
         localonly: 0
          executor: /usr/bin/perl
       description: Convert Eland output sorted.txt file into an .ace file
             notes:  
               url: http://www.aguadev.org/confluence/display/howto/Bioapps+API


    10. volume TABLE STORES SNAPSHOT ID AND MOUNT POINT
    
        SELECT * FROM volume \G
    
               username: admin
               volumeid: vol-5bffe631
             volumesize: 200
               instance: i-b34d25d2
       availabilityzone: us-east-1a
             mountpoint: /data
                 device: /dev/sdl
               snapshot: snap-6341b301
                created: 2012-01-22 01:01:32



NOTES
=====

'UNIQUE NAME' PROBLEM

    - VOLUMES
    
        -   ATTACHED VOLUMES ARE MOUNTED IN THE ROOT DIR DUE TO NFS SENSITIVITIES
        
        -   DIFFERENT USERS COULD CREATE PACKAGES WITH THE SAME NAME

    - BIOREPOSITORY PACKAGE NAMES
    

POSSIBLE SOLUTIONS:

    1) 'SNAPSHOTID' ENVIRONMENT VARIABLE TO AVOID NECESSITY FOR EXPLICIT NAMING INSIDE APPLICATIONS

        - WHEN RUNNING AN APPLICATION, CREATE A 'SNAPSHOTID' ENVIRONMENT VARIABLE
        
        - ADD IT AUTOMATICALLY IN Conf::Agua TO THE SECTION VALUE IF PRESENT
        

    === OR ===


    
    2) UNIQUE NAME CONTROL BY AUTOMATED PULL FROM FORK TO biorepository-STAGING:
        
        -   BY DEFAULT, USERS CAN ONLY MOUNT DATA PACKAGES THAT ARE IN THE AGUA biorepository
    
            -   THE VOLUME IS A PACKAGE IN ITS OWN RIGHT WITHIN THE AGUA biorepository
            
            -   CONTRIBUTED BY A PULL FROM A FORKER WHO CHOSE THE NAME BECAUSE IT'S UNIQUE
            
            -   PRECONDITION OF FIRST PULL IS THAT ITS A UNIQUE NAME
            
                (IT DOESN'T EXIST ALREADY IN THE biorepository)
            
            -   UNIQUE VERSION NUMBER COMPLETES THE IDENTIFICATION
        
        -   USER MUST MANAGE OWN UNIQUE NAMES IF THEY MOUNT DATA PACKAGES FROM OWN biorepository
        
            -   CHOOSE UNIQUE NAMES FOR OWN DATA
            
            -   CHECK NAMES USED BY OTHER USERS FOR CLASHES
            


SEE [Mon 2012:01:23 03:57:50 EST]
BLUEPRINT: VERSIONS USING package, app AND parameters TABLES


4. THE *.ops FILES PROVIDE INFORMATION ON DATA SOURCES WHICH IS THEN USED BY THE *.pm FILE TO CREATE VOLUMES:

    1. LOOKUP SNAPSHOT IN volume TABLE
    
    2. IF SNAPSHOT IS NOT PRESENT, LAUNCH VOLUME AND ATTACH HERE:
    
        /volumes/SNAPSHOTID

***** OKAY BUT NOT IN /volumes BECAUSE OF NFS ISSUES WITH NON-ROOT FOLDERS 

        INSTEAD, USE: /PACKAGENAME-SNAPSHOTID
*****

    3. ADD ENTRY TO default.conf SO THAT APPS CAN LOCATE VOLUME
    
        [bioapps2]
        SNP130DB        /volumes/SNAPSHOTID/bioapps2/dbsnp/snp130.dbl
        
***** BECAUSE OF NFS ISSUES WITH NON-ROOT FOLDERS, AND THE FACT THAT MULTIPLE PACKAGE VERSIONS MAY USE THE SAME VOLUME:

        [bioapps2]
        SNP130DB        /bioapps-SNAPSHOTID/dbsnp/snp130.dbl
*****


</entry>
<entry [Sun 2012:02:05 18:56:49 EST] BLUEPRINT: OPS FILES AND USER REPOS DIRECTORY STRUCTURE>  
    
#### OPS FILES REPOSITORY:

/agua/0.6/repo
    
    #### PRIVATE OPS FILES:
    
    private
        biorepository
            username
                apps
                myPackage
                workflows

    #### PUBLIC OPS FILES:
    
    public
        biorepository
            username
                apps
                myPackage
                workflows


#### USER HOME DIRECTORY

/nethome/username    

    #### INSTALLED PACKAGES (USER'S OWN SOFTWARE, FORKS OF bioapps/agua, THIRD-PARTY PACKAGES, ETC.)

    .repos      

        mypackage
            bin
            lib
            etc.
                
        mypackageDEV
            bin
            lib
            etc.
    
    
</entry>
<entry [Thu 2012:02:02 15:37:30 EST] BLUEPRINT: HANDLE POSSIBLE SYNC DATA LOSS: REMOVE ALL PULLED APP FILES AND CREATE ANEW>

PROBLEM:

DURING SYNC, PULLED WORKFLOWS OR APPS MAY CONTAIN *.work OR *.app FILES THAT ARE NOT PRESENT IN THE LOCAL VERSION BECAUSE OF TWO REASONS:

1. THE WORKFLOW OR APP WAS DELETED LOCALLY

2. THE WORKFLOW OR APP WAS SAVED BY ANOTHER AGUA INSTANCE OR IN ANOTHER WINDOW

THERE IS NO TRIVIAL WAY OF DIFFERENTIATING BETWEEN THE TWO


SOLUTION:

1. DON'T PULL ANYTHING, JUST REGENERATE THE *.app FILES FROM THE DATABASE ENTRIES AND UPLOAD TO GITHUB

I.E., IGNORE THE EXISTING LOCAL AND REMOTE *.app FILES BY DELETING ALL *.app FILES BEFORE CREATING THEM ANEW

2. DO THE SAME FOR THE *.wrk FILES

3. ANY LEGITIMATELY 'LOST' FILES CAN BE RESTORED BY USING 'DEJA VU' (SEE agua.todo)

E.G., TO RESTORE THE FILE myWorkflow.work:

    git checkout HEAD^ /path/to/myWorkflow.work

    
</entry>
<entry [Tue 2012:01:31 22:27:58 EST] BLUEPRINT: LOCATION AND CONTENTS OF PUBLIC AND PRIVATE OPSREPOS>

PUBLIC OPSREPO (CONTAINS OPS FILES, ETC.):

ll /agua/0.6/repos/public/biorepository/

    drwxr-xr-x  4 root   root   4.0K 2012-01-29 14:09 aguatest
    drwxrwxr-x  8 syoung syoung 4.0K 2012-01-21 13:28 .git
    drwxrwxr-x  6 syoung syoung 4.0K 2012-01-21 03:11 syoung
    drwxr-xr-x  4 root   root   4.0K 2012-01-28 00:49 testuser

ll /agua/0.6/repos/public/biorepository/syoung

    drwxrwxr-x 2 syoung syoung 4.0K 2012-01-21 04:13 agua
    drwxrwxr-x 2 syoung syoung 4.0K 2012-01-30 02:29 bioapps
    drwxrwxr-x 2 syoung syoung 4.0K 2012-01-21 04:13 fastqc
    drwxrwxr-x 3 syoung syoung 4.0K 2012-01-21 03:11 workflows


PRIVATE OPSREPO:

ll /repos/private/biorepository/syoung/

    drwxr-xr-x 4 syoung syoung 4.0K 2011-11-15 23:04 bioapps

ll /repos/public/biorepository/syoung/

    drwxr-xr-x 2 syoung syoung 4.0K 2012-01-07 15:27 agua
    drwxr-xr-x 2 syoung syoung 4.0K 2012-01-07 23:46 bioapps
    drwxr-xr-x 2 syoung syoung 4.0K 2011-11-15 09:16 fastqc
    drwxrwxr-x 2 syoung syoung 4.0K 2012-01-08 01:54 myPackage
    drwxrwxr-x 3 syoung syoung 4.0K 2012-01-17 17:19 workflows


    
</entry><entry [Thu 2012:01:26 13:37:53 EST] BLUEPRINT: DEFINED STANDARD APPS INSTALL DIR FOR USERS>

1. THE STANDARD APPS DIRECTORY IS DEFINED IN Agua::Common::Package::setInstallDir

			< userdir>/< username>/repos/< private|public>/< name>/< owner>

			E.G., /nethome/syoung/repos/private/bioapps/syoung
			
2. ADMIN USERS CAN INSTALL PUBLIC PACKAGES TO ANY LOCATION, E.G., /agua/bioapps

3. INSTALLING PUBLIC PACKAGES ADDS ENTRIES TO THE package TABLE IDENTIFYING THE OWNER

4. THESE THREE VALUES ARE THE UNIQUE KEY FOR A PACKAGE: owner, package, installdir

PACKAGE NAME CLASHES ARE AVOIDED BY HAVING DISTINCT AND SEPARATE INSTALLDIRS FOR LOCAL AND PUBLIC PACKAGES 

5. A USER'S STANDARD PACKAGES DIRECTORY IS EMPTY TO BEGIN WITH 

6. CLICKING 'New Package' IN THE ADMIN Packages PANEL DOES THE FOLLOWING:

-   CREATES A SAME-NAME DIRECTORY INSIDE THE USER'S BIOREPOSITORY DIRECTORY

-   CREATES AN apps SUBDIR TO STORE THE *.app FILES FOR EACH OF THE PACKAGE'S APPLICATIONS

-   CREATES SKELETON *.ops AND *.pm FILES

    PUBLIC:
    biorepository/username/myPackage
    biorepository/username/myPackage/apps
    biorepository/username/myPackage/myPackage.ops
    biorepository/username/myPackage/myPackage.pm

    PRIVATE:
    private/username/myPackage
    private/username/myPackage/apps
    private/username/myPackage/myPackage.ops
    private/username/myPackage/myPackage.pm
    

7. DELETING A PACKAGE IN THE ADMIN Packages PANEL DOES NOT AFFECT THE SAME-NAME DIRECTORY

8. A USER CAN MAKE HIS/HER PACKAGE PRIVATE|PUBLIC IN THE ADMIN Packages PANEL 

    -   PRIVATE PACKAGES WILL BE REMOVED FROM private/username/myPackage
    
    -   PUBLIC PACKAGES WILL BE ADDED TO biorepository/username/myPackage
    
    -   A SYNC WILL BE PERFORMED TO UPDATE THE USER'S private AND biorepository REPOS ON GITHUB

9. A USER CAN USE THE ADMIN Packages PANEL TO INSTALL PUBLIC PACKAGES TO THEIR PACKAGES DIRECTORY
    
    BY DEFAULT, THE INSTALLATION DIRECTORY IS:
    
        < userdir>/< username>/repos/< name>/< owner>

        E.G., /nethome/syoung/repos/sharedPackageName/ownersGithubLogin
    


</entry>
<entry [Mon 2012:01:23 03:57:50 EST] BLUEPRINT: VERSIONS USING package, app AND parameters TABLES>

1. FIXED package, app AND parameter TABLES

THE package TABLE CONTAINS ALL THE INFORMATION REQUIRED TO LOCATE AN APPLICATION

CREATE TABLE IF NOT EXISTS package
(
    owner           VARCHAR(30) NOT NULL,
    username        VARCHAR(30) NOT NULL,
    package         VARCHAR(40) NOT NULL,
    status          VARCHAR(40) NOT NULL,
    version         VARCHAR(40) NOT NULL,
    opsdir          VARCHAR(255),
    installdir      VARCHAR(255) NOT NULL,
    description     TEXT,
    notes           TEXT,
    url             TEXT,
    datetime        DATETIME NOT NULL,
    
    PRIMARY KEY  (owner, package, installdir)
);

THE app AND parameter TABLES HOLD THE CORRESPONDING KEYS FOR 

...AND FIXED app AND parameter TABLES:

    app.sql -   REPLACED location WITH installdir


    paramter.sql  - ADDED FIELDS (I.E., THE KEY OF )

    package         VARCHAR(40) NOT NULL,
    version         VARCHAR(40) NOT NULL,
    installdir      VARCHAR(255) NOT NULL,    



2. APPLICATIONS ARE CLONED IF THEY DON'T EXIST, OR UPDATED TO THE EXISTING FOLDER

    -   THERE IS ONE PRINCIPAL FOLDER FOR bioapps, workflows, apps AND biorepository
    
    -   ALL UPGRADES ARE CARRIED OUT IN THE PRINCIPAL FOLDER

    -   MULTIPLE VERSIONS OF BIOAPPS CAN BE SPUN OFF INTO SUBFOLDERS BY INSTALLING
    
        USING ./install --mode installBioApps AND PROVIDING THE --package AND
        
        --installdir ARGUMENTS:

            ./install.pl \
            --installdir /data/apps/bioapps \
            --package 2.0.0 \
            --mode installBioApps \
            --version 2.0.0

    SIMILARLY, 
        
        ./install.pl --installdir /data/apps/alignerX --version 1.2.3 --target 1.2.3
        ./install.pl --installdir /data/apps/alignerX --version 1.2.4 --target 1.2.4
        ./install.pl --installdir /data/apps/bowtie --opsdir /agua/0.6/repos/public/biorepository/syoung/bowtie 
    
            BOWTIE                  /data/apps/bowtie/0.12.2


sudo install.pl --installdir /path/to/installdir

sudo install.pl --mode installBioApps --version 2.0.0 --target 2.0.0 --installdir /agua/0.8

FOLLOWED BY ADDING A NEW SECTION FOR bioapps2 IN default.conf:
    
    [bioapps2]
    VERSION     2.0.0
    INSTALLDIR  /agua/0.6/bioapps2

        OR
        
        Agua::Ops::GitHub::install
        
  
NB: KEPT installdir FIELD (RATHER THAN REPLACE WITH location FIELD)
  
  
E.G., ADMIN INSTALLS LATEST VERSION USING
    
    install.pl --mode installBioApps --target bioapps2
    
OR IN THE ADMIN Packages PANEL:
    
    1. SELECT syoung:bioapps FROM BIOREPOSITORY APPS
    
    2. ENTER INSTALLDIR VALUE /agua/0.6/bioapps2
    
    3. SUBMIT TO SERVER AS upgrade
    
    4. Agua::Package::upgrade USES self->ops() TO INSTALL BY PROVIDING
    
        APP'S BIOREPOSITORY OPSDIR TO LOCATE *.pm FILE WITH preInstall AND
        
        postInstall METHODS FOR UPDATING PACKAGE TABLE 


3. THE package TABLE CONTAINS INFO ON INSTALLED PACKAGES:

    1. bioapps
    
    2. biorepository
    
    3. workflows
        NON-ROOT USERS INSTALLDIR: Agua::Common::Package::setInstallDir
            "$userdir/$username/agua/.repos/$type/$package/$owner"

        ROOT USER INSTALLDIR:
            "/agua/0.6/apps/$owner"    

    4. apps


4. THE *.ops FILES PROVIDE INFORMATION ON DATA SOURCES WHICH IS THEN USED BY THE *.pm FILE TO CREATE VOLUMES:

    1. LOOKUP SNAPSHOT IN volume TABLE
    
    2. IF SNAPSHOT IS NOT PRESENT, LAUNCH VOLUME AND ATTACH HERE:
    
        /volumes/SNAPSHOTID

    3. ADD ENTRY TO default.conf SO THAT APPS CAN LOCATE VOLUME
    
        [bioapps2]
        SNP130DB        /volumes/SNAPSHOTID/bioapps2/dbsnp/snp130.dbl
        

5. THE DIFFERENCE BETWEEN THE source AND volume TABLES

    1. THE source TABLE IS USER-DEFINED FOLDERS TO BE SHARED WITH OTHER LOCAL USERS

    2. THE volume TABLE DEFINES ACTUAL EC2 VOLUMES ATTACHED TO THE HEAD NODE
    
    
    
</entry>
<entry [Tue 2012:01:10 23:56:26 EST] BLUEPRINT: THE Agua DIRECTORY STRUCTURE>


THE /nethome VOLUME CONTAINS THE FOLLOWING:

MYSQL DATA FILES:

/nethome/mysql/lib/mysql/agua/
        access.frm
        access.MYD
        access.MYI
        ami.frm
        ...


USER Agua HOME DIRECTORIES, E.G.:

/nethome/USERNAME/agua/


EACH USER Agua HOME DIRECTORY CONTAINS THE FOLLOWING FOLDERS:

.cluster/
    syoung-microcluster-jobscheduler.log
    syoung-microcluster-loadbalancer.out
    
    
.sge/conf/
    queue-Project1-Workflow1.conf
    queue-syoung-BOWTIE-alignment.conf


.starcluster

apps

    bin/aligners/

    
</entry>
<entry [Tue 2012:01:10 01:53:34 EST] BLUEPRINT: FIRST SYNC OF WORKFLOWS AND APPS IN NEW INSTALLATION>

SUMMARY

FOR A NEW INSTALLATION OF AGUA, DOWNLOAD EXISTING WORKFLOWS AND APPS FROM GITHUB


PROBLEM:

SAME PROBLEM AS WHEN SYNCING WORKFLOWS - USER MAY BE CREATING NEW WORKFLOWS ON MORE THAN ONE AGUA INSTANCE OR MANUALLY UPLOADING, ETC. SO NEED TO ENSURE THAT ALL OF THE CONTENTS (WORKFLOWS, APPS, PROJECTS, SOURCES, ETC.) ARE DOWNLOADED FROM GITHUB BEFORE ADDING ANY CHANGES (E.G., REMOVE ALL WORKFLOWS AND REPRINT THEM)

SOLUTION:

1. pull LATEST VERSION DOWN FROM GITHUB BEFORE ADDING UPDATED WORKFLOWS AND PUSHING UP TO GITHUB.

SO, AUTOMATICALLY AT EVERY SYNC:

    -   SET package STATUS TO 'syncing'
    
    -   pull DOWN LATEST VERSION FROM GITHUB biorepository REPO
    
    -   REMOVE ALL WORKFLOW FILES AND PRINT NEW WORKFLOW FILES (OR APP, SOURCE, ETC.)
    
    -   COMMIT AND PUSH UP TO GITHUB biorepository REPO

    -   SET package STATUS TO 'ready'


2. FOR THE FIRST SYNC ON A NEW INSTALLATION, LOAD THE DOWNLOADED WORKFLOWS AND APPS INTO THE DATABASE

</entry>
<entry [Sun 2012:01:08 02:18:34 EST] BLUEPRINT: THE Agua REPOS ARCHITECTURE>

1. THE PUBLIC biorepository (www.biorepo.org) IS CONTINUALLY UPDATED WITH ALL OF THE USER FORKS

    ON GITHUB SO USERS CAN SELECT FROM THE LATEST WORKFLOWS AND APPLICATIONS

2. agua AND bioapps ARE IN THE ORIGINAL biorepository REPO BY USER syoung

3. EACH USER AUTOMATICALLY HAS THE FOLDERS apps AND workflows

4. apps FOLDER CONTAINS ALL THE INFORMATION NEEDED TO INSTALL AND USE THE USER'S PUBLIC APPLICATIONS

    THE USER'S OWN APPS ARE HERE BY DEFAULT:
    
        /nethome/USERNAME/agua/apps/USERNAME

5. workflows FOLDER CONTAINS ALL THE USER'S PUBLIC WORKFLOWS
    
6. sources FOLDER CONTAINS ALL THE INFORMATION NEEDED TO ACCESS THE USER'S PUBLIC DATA SOURCES


USAGE SCENARIO 1: USER SYNCS WORKFLOWS TO PRIVATE biorepository REPO
====================================================================

1. IN WORKFLOW PANE, USER HITS 'SYNC' BUTTON

2. PRINT .wk FILES TO repos/private/biorepository/USERNAME/workflows FOLDER

3. GIT COMMIT AND PUSH TO GITHUB



USAGE SCENARIO 2: USER RETRIEVES WORKFLOWS FROM PRIVATE biorepository REPO TO AGUA
==================================================================================

1. IN WORKFLOW PANE, USER SELECTS VERSION NUMBER FOR WORKFLOWS AND HITS 'RETRIEVE'

2. AS A BACKUP, COMMIT EXISTING WORKFLOWS TO LOCAL biorepository REPO

3. PULL GITHUB USERNAME/biorepository.git TO LOCAL biorepository AND DIAL TO DESIRED VERSION



USAGE SCENARIO 2: USER CREATES A NEW PACKAGE 
============================================


1. IN ADMIN PANE'S Package PANEL, USER SELECTS NAME AND LOCATION, E.G., myNewPackage, /files/r/here

2. USER PLACES PACKAGE FILES IN THE SPECIFIED LOCATION, E.G. /files/r/here/application.pl

3. GENERATE NEW GIT REPO, E.G., /files/r/here/.git

4. COMMIT AND PUSH TO GITHUB, E.G., github.com/USERNAME/myNewPackage.git

5. CREATE *.ops AND *.pm FILES IN private/biorepository/USERNAME/myNewPackage


NB: THE ADMIN USER CAN EDIT CONF FILE agua|OPSREPO VALUE TO CHANGE FROM biorepository

    TO SAY physics SO THAT FILES ARE PLACED HERE:

        private/physics/USERNAME/myNewPackage
    
    AND FORKS FROM THE physics REPOSITORY WILL BE USED INSTEAD OF THOSE OF THE biorepository



USAGE SCENARIO 3: ADMIN USER INSTALLS ANOTHER USERS' PUBLIC APPS
================================================================

1. THE INSTALLDIR IS
    
    /agua/0.6/apps/OWNER
   
2. THE INSTALLATION IS ACCESSIBLE TO Agua

3. MANAGED BY THE ADMIN USER

4. APPLICATION INFORMATION IS LOADED WITH owner 'OWNER' INTO THE app TABLE

5. PACKAGE INFORMATION IS LOADED WITH owner 'OWNER' INTO package TABLE

6. provenence FIELD PRESERVES THE PROVENANCE INFORMATION FOUND IN THE *.ops FILE



USAGE SCENARIO 4: NON-ADMIN USER INSTALLS ANOTHER USERS' PUBLIC APPS (UNSAFE WITHOUT SETUID)
============================================================================================

1. THE INSTALLDIR IS
        
    /nethome/USERNAME/agua/repos/public/apps/OWNER

2. THE INSTALLATION IS ACCESSIBLE TO Agua

3. MANAGED BY THE 'ORDINARYUSER'

4. APPLICATION INFORMATION IS LOADED WITH owner 'ORDINARYUSER' INTO THE app TABLE

5. THE app TABLE'S provenence FIELD PRESERVES THE ORIGINAL OWNER'S INFORMATION FOUND IN THE *.ops FILE

6. EACH SUCCESSIVE DEVELOPMENT OF THE APPLICATION PUSHES THE NEW OWNER'S INFORMATION 


    
</entry>
<entry [Sun 2012:01:08 00:19:22 EST] BLUEPRINT: THE agua DEVELOPMENT LIFE-CYCLE>

1. USER INSTALLS VERSION 0.8.0 IN /agua/0.8.0

2. DEVELOPER MAKES CHANGES, COMMITS TO GIT AND PUSHES TO PRIVATE GIT REPO. REPEAT.

3. DEVELOPER DECIDES TO RELEASE, PUSHES LATEST COMMIT WITH NEW VERSION NUMBER TO GITHUB
    
4. USER IS NOTIFIED OF NEW VERSION VIA AGUA AND CHOOSES TO UPGRADE

5. BACKWARDS COMPATIBLE API CHANGES: MINOR, PATCH OR BUILD INCREMENT

    EXISTING WORKFLOWS ARE OK
    
6. NON-BACKWARDS COMPATIBLE API CHANGES: MAJOR INCREMENT    

    NEW agua2 DATABASE CONVERTED FROM EXISTING DATABASE

    EXISTING WORKFLOWS  -   MAYBE NOT OK --> CREATE FORWARD CONVERSION TOOL

    EXISTING DATA       -   MAYBE NOT OK --> REDOWNLOAD 


NB: You cannot use the previous and new databases in the same Agua installation.
    
    if you need this functionality, upgrade Agua and run two versions of Agua concurrently


    
</entry>
<entry [Sat 2012:01:07 23:49:44 EST] BLUEPRINT: THE bioapps DEVELOPMENT LIFE-CYCLE>

1. USER INSTALLS VERSION 1.8.0 IN /agua/0.6/bioapps/current --> /agua/0.6/bioapps/1.8.0

2. DEVELOPER MAKES CHANGES, COMMITS TO GIT AND PUSHES TO PRIVATE GIT REPO. REPEAT.

3. DEVELOPER DECIDES TO RELEASE, PUSHES LATEST COMMIT WITH NEW VERSION NUMBER TO GITHUB

4. USER IS NOTIFIED OF NEW VERSION VIA AGUA AND CHOOSES TO UPGRADE

5. BACKWARDS COMPATIBLE API CHANGES: MINOR, PATCH OR BUILD INCREMENT

    INSTALLED TO E.G., /agua/0.6/bioapps/1.8.1

    REPLACE VERSION AND LOCATION IN package DATABASE TABLE
    
    EXISTING WORKFLOWS  -   OK
    
    EXISTING DATA       -   OK


6. NON-BACKWARDS COMPATIBLE API CHANGES: MAJOR VERSION INCREMENT

    INSTALLED TO /agua/0.6/bioapps/2.0.0

    ADD NEW VERSION AND LOCATION IN package DATABASE TABLE

    EXISTING WORKFLOWS  -   OK, SIMPLY USE OLD OR NEW VERSIONS OF SCRIPTS

    EXISTING DATA       -   OK, DOWNLOAD NEW DATA IF NECESSARY



</entry>
<entry [Sat 2011:12:31 21:57:16 EST] BLUEPRINT: ADOPTED SEMANTIC VERSIONING>

http://semver.org/


1. Software using Semantic Versioning MUST declare a public API. This API could be declared in the code itself or exist strictly in documentation.

2. A normal version number MUST take the form X.Y.Z where
    X is the major version - backwards incompatible changes are introduced to the public API
    Y is the minor version - new, backwards compatible functionality and bug fixes
    Z is the patch version - backwards compatible bug fixes

    Increase by increments of one. For instance: 1.9.0 -> 1.10.0 -> 1.11.0.

3. When a major version number is incremented, the minor version and patch version MUST be reset to zero. When a minor version number is incremented, the patch version MUST be reset to zero.

    For instance: 1.1.3 -> 2.0.0 and 2.1.7 -> 2.2.0.

4. Major version zero (0.y.z) is for initial development. Anything may change at any time. The public API should not be considered stable.

5. Version 1.0.0 defines the public API. The way in which the version number is incremented after this release is dependent on this public API and how it changes.

6. Pre-release version has a lower precedence than the associated normal version:
    Examples: 1.0.0-alpha  < 1.0.0-alpha.1 < 1.0.0 

7. Build version has a higher precedence than the associated normal version:
    Examples: 1.0.0 < 1.0.0+build.1, 1.3.7+build.11.e0f985a.

8. Precedence is calculated as follows:

    build > major > minor > patch > pre-release

    Numeric identifiers always have lower precedence than non-numeric identifiers:

    Example: 1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0-rc.1+build.1 < 1.0.0 < 1.0.0+0.3.7 < 1.3.7+build < 1.3.7+build.2.b8f12d7 < 1.3.7+build.11.e0f985a.


NOTES
=====

Semantic Versioning 2.0.0-rc.1

In the world of software management there exists a dread place called "dependency hell." The bigger your system grows and the more packages you integrate into your software, the more likely you are to find yourself, one day, in this pit of despair.

In systems with many dependencies, releasing new package versions can quickly become a nightmare. If the dependency specifications are too tight, you are in danger of version lock (the inability to upgrade a package without having to release new versions of every dependent package). If dependencies are specified too loosely, you will inevitably be bitten by version promiscuity (assuming compatibility with more future versions than is reasonable). Dependency hell is where you are when version lock and/or version promiscuity prevent you from easily and safely moving your project forward.

As a solution to this problem, I propose a simple set of rules and requirements that dictate how version numbers are assigned and incremented. For this system to work, you first need to declare a public API. This may consist of documentation or be enforced by the code itself. Regardless, it is important that this API be clear and precise. Once you identify your public API, you communicate changes to it with specific increments to your version number. Consider a version format of X.Y.Z (Major.Minor.Patch). Bug fixes not affecting the API increment the patch version, backwards compatible API additions/changes increment the minor version, and backwards incompatible API changes increment the major version.

I call this system "Semantic Versioning." Under this scheme, version numbers and the way they change convey meaning about the underlying code and what has been modified from one version to the next.

Semantic Versioning Specification (SemVer)

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119.

Software using Semantic Versioning MUST declare a public API. This API could be declared in the code itself or exist strictly in documentation. However it is done, it should be precise and comprehensive.

A normal version number MUST take the form X.Y.Z where X, Y, and Z are non-negative integers. X is the major version, Y is the minor version, and Z is the patch version. Each element MUST increase numerically by increments of one. For instance: 1.9.0 -> 1.10.0 -> 1.11.0.

When a major version number is incremented, the minor version and patch version MUST be reset to zero. When a minor version number is incremented, the patch version MUST be reset to zero. For instance: 1.1.3 -> 2.0.0 and 2.1.7 -> 2.2.0.

Once a versioned package has been released, the contents of that version MUST NOT be modified. Any modifications must be released as a new version.

Major version zero (0.y.z) is for initial development. Anything may change at any time. The public API should not be considered stable.

Version 1.0.0 defines the public API. The way in which the version number is incremented after this release is dependent on this public API and how it changes.

Patch version Z (x.y.Z | x > 0) MUST be incremented if only backwards compatible bug fixes are introduced. A bug fix is defined as an internal change that fixes incorrect behavior.

Minor version Y (x.Y.z | x > 0) MUST be incremented if new, backwards compatible functionality is introduced to the public API. It MUST be incremented if any public API functionality is marked as deprecated. It MAY be incremented if substantial new functionality or improvements are introduced within the private code. It MAY include patch level changes. Patch version MUST be reset to 0 when minor version is incremented.

Major version X (X.y.z | X > 0) MUST be incremented if any backwards incompatible changes are introduced to the public API. It MAY include minor and patch level changes. Patch and minor version MUST be reset to 0 when major version is incremented.

A pre-release version MAY be denoted by appending a dash and a series of dot separated identifiers immediately following the patch version. Identifiers MUST be comprised of only ASCII alphanumerics and dash [0-9A-Za-z-]. Pre-release versions satisfy but have a lower precedence than the associated normal version. Examples: 1.0.0-alpha, 1.0.0-alpha.1, 1.0.0-0.3.7, 1.0.0-x.7.z.92.

A build version MAY be denoted by appending a plus sign and a series of dot separated identifiers immediately following the patch version or pre-release version. Identifiers MUST be comprised of only ASCII alphanumerics and dash [0-9A-Za-z-]. Build versions satisfy and have a higher precedence than the associated normal version. Examples: 1.0.0+build.1, 1.3.7+build.11.e0f985a.

Precedence MUST be calculated by separating the version into major, minor, patch, pre-release, and build identifiers in that order. Major, minor, and patch versions are always compared numerically. Pre-release and build version precedence MUST be determined by comparing each dot separated identifier as follows: identifiers consisting of only digits are compared numerically and identifiers with letters or dashes are compared lexically in ASCII sort order. Numeric identifiers always have lower precedence than non-numeric identifiers. Example: 1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0-rc.1+build.1 < 1.0.0 < 1.0.0+0.3.7 < 1.3.7+build < 1.3.7+build.2.b8f12d7 < 1.3.7+build.11.e0f985a.

Why Use Semantic Versioning?

This is not a new or revolutionary idea. In fact, you probably do something close to this already. The problem is that "close" isn't good enough. Without compliance to some sort of formal specification, version numbers are essentially useless for dependency management. By giving a name and clear definition to the above ideas, it becomes easy to communicate your intentions to the users of your software. Once these intentions are clear, flexible (but not too flexible) dependency specifications can finally be made.

A simple example will demonstrate how Semantic Versioning can make dependency hell a thing of the past. Consider a library called "Firetruck." It requires a Semantically Versioned package named "Ladder." At the time that Firetruck is created, Ladder is at version 3.1.0. Since Firetruck uses some functionality that was first introduced in 3.1.0, you can safely specify the Ladder dependency as greater than or equal to 3.1.0 but less than 4.0.0. Now, when Ladder version 3.1.1 and 3.2.0 become available, you can release them to your package management system and know that they will be compatible with existing dependent software.

As a responsible developer you will, of course, want to verify that any package upgrades function as advertised. The real world is a messy place; there's nothing we can do about that but be vigilant. What you can do is let Semantic Versioning provide you with a sane way to release and upgrade packages without having to roll new versions of dependent packages, saving you time and hassle.

If all of this sounds desirable, all you need to do to start using Semantic Versioning is to declare that you are doing so and then follow the rules. Link to this website from your README so others know the rules and can benefit from them.

FAQ

How should I deal with revisions in the 0.y.z initial development phase?

The simplest thing to do is start your initial development release at 0.1.0 and then increment the minor version for each subsequent release.

How do I know when to release 1.0.0?

If your software is being used in production, it should probably already be 1.0.0. If you have a stable API on which users have come to depend, you should be 1.0.0. If you're worrying a lot about backwards compatibility, you should probably already be 1.0.0.

Doesn't this discourage rapid development and fast iteration?

Major version zero is all about rapid development. If you're changing the API every day you should either still be in version 0.x.x or on a separate development branch working on the next major version.

If even the tiniest backwards incompatible changes to the public API require a major version bump, won't I end up at version 42.0.0 very rapidly?

This is a question of responsible development and foresight. Incompatible changes should not be introduced lightly to software that has a lot of dependent code. The cost that must be incurred to upgrade can be significant. Having to bump major versions to release incompatible changes means you'll think through the impact of your changes, and evaluate the cost/benefit ratio involved.

Documenting the entire public API is too much work!

It is your responsibility as a professional developer to properly document software that is intended for use by others. Managing software complexity is a hugely important part of keeping a project efficient, and that's hard to do if nobody knows how to use your software, or what methods are safe to call. In the long run, Semantic Versioning, and the insistence on a well defined public API can keep everyone and everything running smoothly.

What do I do if I accidentally release a backwards incompatible change as a minor version?

As soon as you realize that you've broken the Semantic Versioning spec, fix the problem and release a new minor version that corrects the problem and restores backwards compatibility. Remember, it is unacceptable to modify versioned releases, even under this circumstance. If it's appropriate, document the offending version and inform your users of the problem so that they are aware of the offending version.

What should I do if I update my own dependencies without changing the public API?

That would be considered compatible since it does not affect the public API. Software that explicitly depends on the same dependencies as your package should have their own dependency specifications and the author will notice any conflicts. Determining whether the change is a patch level or minor level modification depends on whether you updated your dependencies in order to fix a bug or introduce new functionality. I would usually expect additional code for the latter instance, in which case it's obviously a minor level increment.

What should I do if the bug that is being fixed returns the code to being compliant with the public API (i.e. the code was incorrectly out of sync with the public API documentation)?

Use your best judgment. If you have a huge audience that will be drastically impacted by changing the behavior back to what the public API intended, then it may be best to perform a major version release, even though the fix could strictly be considered a patch release. Remember, Semantic Versioning is all about conveying meaning by how the version number changes. If these changes are important to your users, use the version number to inform them.

How should I handle deprecating functionality?

Deprecating existing functionality is a normal part of software development and is often required to make forward progress. When you deprecate part of your public API, you should do two things: (1) update your documentation to let users know about the change, (2) issue a new minor release with the deprecation in place. Before you completely remove the functionality in a new major release there should be at least one minor release that contains the deprecation so that users can smoothly transition to the new API.

About

The Semantic Versioning specification is authored by Tom Preston-Werner, inventor of Gravatars and cofounder of GitHub.

If you'd like to leave feedback, please open an issue on GitHub.

License

Creative Commons - CC BY 3.0 http://creativecommons.org/licenses/by/3.0/
    
</entry>
<entry [Thu 2011:11:17 15:58:26 EST] BLUEPRINT: SYNCING AGUA DATA TO private AND biorepository>


SEE agua
[Sat 2011:11:05 01:23:26 EST] BLUEPRINT FOR REPOS

NOTE: TWO REPOS ARE USED TO MAINTAIN SEPARATION OF THE CONTROL FILES (*.ops, *.app) FROM THE EXECUTABLES (*.pl) (MOTIVATION: REDUCE RISK OF DATA LOSS, SEPARATION OF CONCERNS). THE LATTER IS UPDATED USING THE FORMER. BOTH HAVE VERSION CONTROL AND HENCE A PAPER TRAIL.


SYNC AGUA DATA TO GITHUB PRIVATE REPO
=====================================

SYNC WORKFLOWS, apps TO PRIVATE GITHUB REPO

0. QUIT IF USER DOES NOT HAVE BOTH GITHUB CREDENTIALS AND SSHKEY

1. #### DONE #### CREATE NEW private REPO IF NOT EXISTS

    www.github.com/USERNAME/private


2. #### DONE #### CLONE/INITIALIZE AND SET REMOTE TO private

    CLONE private REPO

    cd /agua/0.6/repos/private/USERNAME
    git clone www.github.com/USERNAME/private.git
    git remote add github git@github.com:USERNAME/private.git


3. POPULATE private REPO:

    1. COPY *.pm FILES

        cp /agua/0.6/repos/admin/private/workflows/flow.pm \
        /agua/0.6/repos/USERNAME/private/workflows/myWORKFLOW.pm

        cp /agua/0.6/repos/admin/private/apps/app.pm \
        /agua/0.6/repos/USERNAME/private/apps/myAPP.pm

        cp /agua/0.6/repos/admin/private/sources/source.pm \
        /agua/0.6/repos/USERNAME/private/sources/mySOURCE.pm

        
        NB: EACH *.pm FILE HANDLES THE DEFAULT INSTALLATION ON AGUA

            USER CAN EDIT+


    2. GENERATE *.ops FILES

        /agua/0.6/repos/USERNAME/private/apps/myAPP.ops
        /agua/0.6/repos/USERNAME/private/workflows/myPROJECT.ops
        /agua/0.6/repos/USERNAME/private/sources/mySOURCE.ops

        NB: USER MUST SPECIFY A LOCATION FOR APPS AND SOURCES

            -   AN EC2 SNAPSHOT OR S3 BUCKET 

            -   THEIR OWN GIT REPO 

                www.github.com/USERNAME/myAPP
                www.github.com/USERNAME/mySOURCE
                
            -   ADD IT TO THE biorepository
            
                www.github.com/USERNAME/biorepository/myAPP
                www.github.com/USERNAME/biorepository/mySOURCE

    
    3. GENERATE *.flow FILES   

        /agua/0.6/repos/USERNAME/private/workflows/PROJECTNAME.flow


    4. GENERATE *.app FILES
        
        /agua/0.6/repos/USERNAME/private/apps/myAPP.app


        NB: ACTUAL APP EXECUTABLES ARE IN apps REPO WHICH IS AUTOMATICALLY UPLOADED TO GITHUB
        
        /nethome/USERNAME/agua/apps/path/to/myAPP.pl
        

        LATER: ALLOW USER TO SPECIFY NEW PACKAGES:
        
        /nethome/USERNAME/agua/apps/repos
        
        www.github.com/USERNAME/myAPP


    5. GENERATE *.source FILES
    
    

    
4. UPLOAD private TO GITHUB
    cd /agua/0.6/repos/USERNAME/private
    git add .
    git commit -a -m "USERNAME DATETIME"
    git push
    git tag -a "INCREMENTED_IDENTIFIER"
    git push --tags



PUBLISH TO PUBLIC REPO
======================

PUBLISH APPS, WORKFLOWS AND SOURCES TO biorepository

1. FORK PUBLIC biorepository (SKIP IF ALREADY FORKED)

    /agua/0.6/repos/biorepository/USERNAME/workflows

2. CLONE PUBLIC biorepository REPO IN repos:

    cd /agua/0.6/repos/biorepository/USERNAME/workflows
    git clone www.github.com/USERNAME/biorepository/workflows.git

3. AS ABOVE

4. AS ABOVE



ADMIN PANE Repository PANEL
===========================

THE Repository PANEL PROVIDES THE FOLLOWING FUNCTIONALITY:

1. DISPLAY SHARED WORKFLOWS, APPS AND SOURCES

    LOAD ON BOOT OR IF 'REFRESH' BUTTON CLICKED IN Admin BioRepository PANEL:
        
        1. REFRESH MASTER biorepository AND ALL FORKS IN MYSQL
    
            DISPLAY USER'S OWN PRIVATE AND PUBLIC REPOS
            
                - APPS, WORKFLOWS, SOURCES WITH VERSIONS AND TAGS
             
            DISPLAY ALL SHARED PACKAGES AND SHARERS' INFORMATION
        
            DISPLAY ALL SHARED WORKFLOWS AND SHARERS' INFORMATION 

        2. ALERT USER TO UPDATED VERSIONS
        
        3. DISPLAY GIT TAG (I.E., BRIEF RELEASE NOTES/CHANGELOG)
        
        4. LINK TO README? WITH MORE INFORMATION

 
   
2. PROVIDE SEARCH OF biorepository



3. GET WORKFLOWS FROM ANOTHER USER WITH Ops.pm

        - UPDATE/CLONE USER'S FORK OF biorepository TO biorepo/
     
        - *.pm FILE LOADS WORKFLOWS INTO DATABASE
    

4. UPDATE/UPGRADE PACKAGES/DATA/WORKFLOWS FROM ANOTHER USER WITH Ops.pm

    GITHUB
    
        - UPDATE/DOWNLOAD biorepository FILES FROM USER'S FORK
     
        - *.pm FILE LOADS WORKFLOWS INTO DATABASE
    
    EC2/S3
        
        - CREATE AND ATTACH VOLUME
    

    IF APPLICATION: LOAD *.app FILES INTO MYSQL

    IF WORKFLOW: LOAD *.flow FILES INTO MYSQL

    IF DATA: LOAD *.source FILES INTO MYSQL

    


</entry>
<entry [Sat 2011:11:05 01:23:26 EST] BLUEPRINT: BLUEPRINT FOR REPOS>

SUMMARY:

AUTOMATICALLY GENERATE FILES: *.ops 
    
    1. SYNC WORKFLOWS TO PRIVATE GITHUB REPO

        1. CREATE NEW workflows REPO IF NOT EXISTS
        
            www.github.com/USERNAME/workflows


        2. CLONE workflows REPO IN repos:
        
            cd /agua/0.6/repos/USERNAME/workflows
            git clone www.github.com/USERNAME/workflows.git


        3. POPULATE workflows REPO:
      
            1. COPY flow.pm FILE

                cp /agua/0.6/repos/admin/workflows/flow.pm \
                /agua/0.6/repos/USERNAME/workflows/flow.pm

            2. GENERATE *.ops FILE

                /agua/0.6/repos/USERNAME/workflows/PROJECTNAME.ops
            
            3. GENERATE *.flow FILES   

                /agua/0.6/repos/USERNAME/workflows/PROJECTNAME.flow
        
        
        4. UPLOAD WORKFLOWS TO GITHUB
            cd /agua/0.6/repos/USERNAME/workflows
            git add .
            git commit -a -m "USERNAME DATETIME"
            git push
            git tag -a "INCREMENTED_IDENTIFIER"
            git push --tags



    2. SYNC APPLICATIONS WITH PRIVATE GITHUB REPO

        1. CREATE NEW apps REPO IF NOT EXISTS
        
            www.github.com/USERNAME/apps

            LATER: ALLOW SEPARATE USER-SPECIFIED REPO FOR EACH APP
        
            www.github.com/USERNAME/myAPP
        

        2. CLONE REPO IN repos:
        
            cd /agua/0.6/repos/USERNAME/apps
            git clone www.github.com/USERNAME/apps.git

        3. AS ABOVE
        4. AS ABOVE



    3. PUBLISH WORKFLOWS TO biorepository

        1. FORK PUBLIC biorepository IF NOT FORKED

            /agua/0.6/repos/biorepository/USERNAME/workflows
        
        2. CLONE PUBLIC biorepository REPO IN repos
        
            cd /agua/0.6/repos/biorepository/USERNAME/workflows
            git clone www.github.com/USERNAME/biorepository/workflows.git

        3. AS ABOVE
        4. AS ABOVE
        


    4. PUBLISH APPLICATIONS TO biorepository


        1. FORK biorepository IF NOT ALREADY FORKED
            /agua/0.6/repos/biorepository/USERNAME/workflows
        
        2. CLONE REPO IN repos:
        
            cd /agua/0.6/repos/biorepository/USERNAME/workflows
            git clone www.github.com/USERNAME/biorepository/workflows.git

        3. AS ABOVE
        4. AS ABOVE


   
    5. DISPLAY SHARED WORKFLOWS AND APPLICATION/DATA REPOSITORIES

        ON BOOT OR IF 'REFRESH' BUTTON CLICKED IN Admin BioRepository PANEL:
            
            1. REFRESH MASTER biorepository AND ALL FORKS IN MYSQL
        
            2. ALERT USER TO NEW AGUA VERSION
            
            3. DISPLAY RELEASE NOTES/CHANGELOG

        DISPLAY USER'S OWN PRIVATE AND PUBLIC PACKAGES/WORKFLOWS

        DISPLAY ALL SHARED PACKAGES AND SHARERS' INFORMATION

        DISPLAY ALL SHARED WORKFLOWS AND SHARERS' INFORMATION 
        
        ALLOW SEARCH OF biorepository



    6. ENABLE INSTALL PACKAGES/DATA/WORKFLOWS WITH Ops.pm
    
        GITHUB
        
            - DOWNLOAD biorepository FILES FOR PACKAGE
         
            - RUN package.pm TO INSTALL
        
        EC2/S3
            
            - CREATE AND ATTACH VOLUME
        

        IF APPLICATION: LOAD *.app FILES INTO MYSQL
    
        IF WORKFLOW: LOAD *.flow FILES INTO MYSQL

        IF DATA: LOAD *.source FILES INTO MYSQL
    
    

    
</entry>
