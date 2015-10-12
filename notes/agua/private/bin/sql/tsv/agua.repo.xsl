agua.repo

<entry [Thu 2012:01:26 13:37:53 EST] DEFINED STANDARD APPS INSTALL DIR FOR USERS>

1. THE STANDARD APPS DIRECTORY IS DEFINED IN Agua::Common::Package::setInstallDir

			< userdir>/< username>/.repos/< private|public>/< name>/< owner>

			E.G., /nethome/syoung/.repos/private/bioapps/syoung
			
2. ADMIN USERS CAN INSTALL PUBLIC PACKAGES TO ANY LOCATION, E.G., bioapps AT /agua/0.6

3. INSTALLING PUBLIC PACKAGES ADDS ENTRIES TO THE package TABLE IDENTIFYING THE OWNER

4. THESE THREE VALUES ARE THE UNIQUE KEY FOR A PACKAGE: owner, package, installdir

    SO ANY PACKAGE NAME CLASSES ARE AVOIDED BY HAVING DISTINCT AND SEPARATE INSTALLDIRS
    
    FOR LOCAL AND PUBLIC PACKAGES 

5. A USER'S STANDARD PACKAGES DIRECTORY IS EMPTY TO BEGIN WITH 

6. CREATING A PACKAGE IN THE ADMIN Packages PANEL CREATES A SAME-NAME DIRECTORY INSIDE

    THE PACKAGES DIRECTORY
        
7. DELETING A PACKAGE IN THE ADMIN Packages PANEL DOES NOT AFFECT THE SAME-NAME DIRECTORY

8. A USER CAN MAKE HIS/HER PACKAGE PRIVATE|PUBLIC IN THE ADMIN Packages PANEL 

    -   PRIVATE PACKAGES WILL BE REMOVED FROM biorepository/username/apps/packages
    
    -   PUBLIC PACKAGES WILL BE ADDED TO biorepository/username/apps/packages
    
    -   A SYNC WILL BE PERFORMED TO UPDATE THE USER'S biorepository FORK ON GITHUB

9. A USER CAN USE THE ADMIN Packages PANEL TO INSTALL PUBLIC PACKAGES TO THEIR PACKAGES DIRECTORY
    
    BY DEFAULT, THE INSTALLATION DIRECTORY:
    
			< userdir>/< username>/.repos/public/< name>/< owner>

			E.G., /nethome/syoung/.repos/public/sharedPackageName/ownersGithubLogin
    


</entry>
<entry [Thu 2012:01:26 02:03:50 EST] COMPLETED Package.t TO TEST Agua::Common::Package (Role)>

stuartpyoung
============
./Package.t \
--login stuartpyoung \
--token a359152dd81fbd744a86128c0be5a764 \
--keyfile /root/.ssh/idents/github.com/id_rsa \
--owner syoung

syoung
======
./Package.t \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--keyfile /root/.ssh/idents/github.com/id_rsa \
--owner syoung


NB: FIXED THIS BY USING syoung LOGIN TOKEN:

2012-01-26 02:08:48	[DEBUG]   	Agua::Common::Workflow::_defaultWorkflows	587json: {
        'number' => 1,
        'project' => 'Project1',
        'name' => 'Workflow1'
    }

    {"error":"not defined: username","subroutine":"Agua::Common::Workflow::_addWorkflow","linenumber":"329","filename":"/agua/0.6/t/bin/Agua/Common/Package/../../../../../lib/Agua/Common/Workflow.pm","timestamp":"2012-01-26 02:08:48"}


</entry>
<entry [Tue 2012:01:24 08:58:39 EST] INSTALLED LATEST VERSION OF THE biorepsitory AND bioapps>


/agua/0.6/bin/scripts/install.pl


WHICH DOES

/agua/0.6/bin/scripts/../logic/ops.pl \
biorepository getRemoteTags syoung biorepository

    WHICH DOES:
     curl  https://github.com/api/v2/json/repos/show/syoung/biorepository/tags

    [
       {
          "sha" : "2f886d8f3de6af0cf945b2c842035d2a24296fe0",
          "name" : "0.6.0"
       }
    ]


THEN TAKES THE LAST VERSION AND INSTALLS IT:

/agua/0.6/bin/logic/ops.pl \
biorepository install \
--owner syoung \
--installdir /agua/0.6/repos/public \
--repository biorepository \
--logfile /tmp/agua-biorepository.install.log \
--database agua

    OK

    
/agua/0.6/bin/scripts/../logic/ops.pl \
bioapps install \
--owner syoung \
--installdir /agua/0.6/bioapps \
--repository bioapps \
--logfile /tmp/agua-bioapps.install.log \
--opsdir /agua/0.6/repos/public/biorepository/syoung/bioapps



</entry>
<entry [Mon 2012:01:23 03:57:50 EST] BLUEPRINT: VERSIONS>

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
    
    PRIMARY KEY  (owner, username, package, location)
);

ADDED THE PACKAGE PRIMARY KEYS (owner, package, installdir) TO THE app AND parameter TABLES:

    app.sql -   REPLACED location WITH installdir

CREATE TABLE IF NOT EXISTS app
(
    owner           VARCHAR(30) NOT NULL,    
    package         VARCHAR(40) NOT NULL,
    version         VARCHAR(40) NOT NULL,
    installdir      VARCHAR(255) NOT NULL,
    name            VARCHAR(40) NOT NULL,
    type            VARCHAR(40) NOT NULL,

    location        VARCHAR(255) NOT NULL default '',
    localonly       INT(1) NOT NULL default 0,
    executor        VARCHAR(40) NOT NULL default '',
    
    description     TEXT,
    notes           TEXT,
    url             TEXT,
    
    PRIMARY KEY  (owner, name, type, package, installdir)
);


    parameter.sql  - ADDED FIELDS

CREATE TABLE IF NOT EXISTS parameter
(
    owner           VARCHAR(30) NOT NULL,
    package         VARCHAR(40) NOT NULL,
    version         VARCHAR(40) NOT NULL,
    installdir      VARCHAR(255) NOT NULL,    

    appname         VARCHAR(40) NOT NULL,
    apptype         VARCHAR(40),    
    name            VARCHAR(40) NOT NULL,

    ordinal         INT(6) NOT NULL default 0,
    locked          INT(1) NOT NULL default 0,
    paramtype       VARCHAR(40) NOT NULL default '',  
    category        VARCHAR(40) NOT NULL default '',  
    valuetype       VARCHAR(20) NOT NULL default '',  
    argument        VARCHAR(40) NOT NULL default '',  
    value           TEXT,
    discretion      VARCHAR(10) NOT NULL default '',
    format          VARCHAR(40),                      
    description     TEXT, 
    args            TEXT,
    inputParams     TEXT,
    paramFunction   TEXT,

    PRIMARY KEY  (owner, appname, name, paramtype, ordinal)
);


2. APPLICATIONS ARE CLONED IF THEY DON'T EXIST, OR UPDATED IN THE EXISTING FOLDER

    -   THERE IS ONE PRINCIPAL FOLDER FOR bioapps, workflows, apps AND biorepository
    
    -   ALL UPGRADES ARE CARRIED OUT IN THE PRINCIPAL FOLDER

    -   MULTIPLE VERSIONS OF BIOAPPS CAN BE SPUN OFF INTO SUBFOLDERS BY INSTALLING
    
        USING ./install --mode installBioApps AND PROVIDING THE --target AND
        
        --installdir ARGUMENTS:

            ./install.pl \
            --installdir /data/apps/bioapps \
            --target 2.0.0 \
            --mode installBioApps
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

    5. THIRD PARTY APPLICATIONS
    
        USUALLY INSTALLED AS VERSION-NUMBERED SUBFOLDERS IN THE APPLICATION-NAMED
        
        FOLDER, E.G., TWO DIFFERENT VERSIONS OF BOWTIE
        
            /data/apps/bowtie/0.1.12
            /data/apps/bowtie/0.1.14
        
        WOULD HAVE TWO ENTRIES IN THE package TABLE (THE LATEST VERSION IS DETERMINED
        
        AND THEN USED TO SET THE INSTALLDIR) AND TWO CORRESPONDING ENTRIES IN default.conf
        
        [bowtie 0.1.12]
        INSTALLDIR      /data/apps/bowtie/0.1.12
        VERSION         0.1.12

        [bowtie 0.1.14]
        INSTALLDIR      /data/apps/bowtie/0.1.14
        VERSION         0.1.14

        

4. THE *.ops FILES PROVIDE INFORMATION ON DATA SOURCES WHICH IS THEN USED BY THE *.pm FILE TO CREATE VOLUMES:

    1. LOOKUP SNAPSHOT IN volume TABLE
    
    2. IF SNAPSHOT IS NOT PRESENT, LAUNCH VOLUME AND ATTACH HERE:
    
        /volumes/SNAPSHOTID
        
    3. ADD ENTRY TO default.conf SO THAT APPS CAN LOCATE VOLUME
    
        [bioapps2]
        SNP130DBFILE        /volumes/SNAPSHOTID/bioapps2/dbsnp/snp130.dbl
        


5. THE DIFFERENCE BETWEEN THE source AND volume TABLES

    1. THE source TABLE IS USER-DEFINED FOLDERS WITHIN AN EC2 VOLUME DESIGNATED AS ANNOTATED (NAME AND DESCRIPTION) DATA SOURCES TO BE SHARED WITH OTHER LOCAL USERS. WHEN A WORKFLOW IS SAVED, SOURCES USED BY THE WORKFLOW ARE SAVED AS EC2 SNAPSHOT IDS TO THE *.ops FILE FOR THE WORKFLOW.
    
CREATE TABLE source
(
    username        VARCHAR(30) NOT NULL,
    volumeid        VARCHAR(30) NOT NULL,
    snapshot        VARCHAR(30) NOT NULL,
    name            VARCHAR(30),
    description     TEXT,
    location        VARCHAR(255),
    
    PRIMARY KEY (username, name)
);


    2. USERS CAN UPDATE THE SNAPSHOTS (E.G., TO COPY A SNAPSHOT FOR A PUBLIC WORKFLOW OR TO UPDATE A SNAPSHOT AFTER CHANGES TO THE DATA)
    
        - THE NEW SNAPSHOT ID WILL BE PROMULGATED THROUGH THE source AND volume TABLES
        
        - USER MUST SYNC WORKFLOW TO UPDATE SNAPSHOT ID IN WORKFLOW *.ops FILE



    3. THE volume TABLE DEFINES ALL EC2 VOLUMES ATTACHED TO THE HEAD NODE
    
CREATE TABLE IF NOT EXISTS volume
(
    username        VARCHAR(30) NOT NULL,
    volumeid        VARCHAR(30) NOT NULL,
    volumesize      INT(6),
    instance        VARCHAR(30) NOT NULL,
    availabilityzone    VARCHAR(12) NOT NULL,
    mountpoint      VARCHAR(255) NOT NULL,
    device          VARCHAR(30) NOT NULL,
    snapshot        VARCHAR(30) NOT NULL,
    created         DATE,
    
    PRIMARY KEY (username, volumeid)
);

   
    
</entry>
<entry [Thu 2012:01:19 14:11:48 EST] CREATED AND ARCHIVED AGUA VERSION 0.7.3>

1. CREATED VERSION FILE AND SET VERSION TAG

/agua/0.6/bin/scripts/version.pl \
--repodir /agua/0.6 \
--versiontype patch \
--description "First public version"

    New version: 1.3.7+build.14


2. VERIFIED NEW TAG

git log --oneline --decorate --graph

    * 98218e9 (HEAD, master) [0.7.3] First public version
    * 435a22b (tag: 0.7.3, tag: 0.7.2, origin/master, origin/HEAD, linode/master) Cleaned out builds.
    * 952bc46 Cleaned up builds and added build dir.
    ...

... AND CONTENTS OF VERSION FILE:

cat /agua/0.6/VERSION
    0.7.3

    
3. CREATED ARCHIVE FILE FOR VERSION 0.7.3    
    
/agua/0.6/bin/scripts/archive.pl \
--name agua \
--repodir /agua/0.6 \
--outputdir /home/syoung/RELEASE

    git archive --format=tar --prefix=0.7.3/ HEAD | gzip > /home/syoung/RELEASE/0.7.3/agua.0.7.3-98218e9.tar.gz


    
</entry>
<entry [Wed 2012:01:18 05:57:17 EST] CREATED version.pl TO INCREMENT VERSIONS AND CREATE VERSION FILE FOR archive.pl>

1. THE CORRECT VERSION FILE IS REQUIRED BY install.pl TO SUCCESSFULLY COMPLETE INSTALLATION

2. 'BUILD' IS NOT THE NUMBER OF GIT COMMITS, RATHER IT IS THE NUMBER OF RELEASES

    E.G., A BUILD INCREMENT LIKE THIS REPRESENTS A NEW RELEASE WITH MINOR IMPROVEMENTS:
    
        0.7.2+build.1
        0.7.2+build.2
    

THE NOTES IN version.pl EXPLAIN THIS IN MORE DETAIL:

    ONLY USE THIS APPLICATION IF YOU WANT TO CREATE A NEW TAG TO RELEASE
    
    BUG FIXES (PATCH), NEW FEATURES (MINOR VERSION) OR API-RELATED CHANGES
    
    {MAJOR VERSION), OR TO MARK A PRE-RELEASE VERSION (RELEASE) OR A SMALL 
    
    INCREMENTAL IMPROVEMENT ON ANY OF THE ABOVE (BUILD).
    
    IF NONE OF THE ABOVE APPLY, DO NOT USE THIS APPLICATION. INSTEAD, TRACK
    
    CHANGES WITH 'git log' USING THE COMMIT ITERATION COUNTER, BUILD ID AND COMMENTS.
    

NNNB: THIS INFORMATION IS NOT NECESSARY FOR RELEASE VERSION CONTROL:

    DATETIME
    BUILD ID
    GLOBAL ITERATIONS




</entry>
<entry [Tue 2012:01:17 09:26:33 EST] PREPARATION FOR INSTALLING bioapps AND bioreposotory USING Installer.pm>

1. SET VERSION OF bioapps TO 0.7.0 IN DEVELOPMENT COPY:

/agua/0.6/bin/scripts/version.pl \
--repodir /agua/0.6/bioapps \
--description "First installed version of bioapps" \
--version "0.7.0"

/agua/0.6/bioapps  (master)$ gitlog
    * 9a236db (HEAD, tag: 0.7.0, master) [0.7.0] First installed version of bioapps
    * 33a01c5 (tag: 0.6.0, linode/master, github/master) Added tsv files.
    * dd4444a (bioapps/master) Added makefile.pl and changed Filter-SNP to Filter/SNP.

... AND UPLOADED TAG TO GITHUB:

git remote -v

    github	git@github.com:syoung/apps.git (fetch)
    github	git@github.com:syoung/apps.git (push)
    linode	ssh://root@173.230.142.248/srv/git/apps (fetch)
    linode	ssh://root@173.230.142.248/srv/git/apps (push)

git push --tags


2. SET VERSION TO 0.6.0 IN PRODUCTION COPY:

MADE GITHUB bioapps THE DEFAULT REMOTE FOR bioapps PRODUCTION:
SEE [Fri 2012:01:20 16:08:44 EST] SET PRODUCTION bioapps DEFAULT REMOTE TO GITHUB WITH git config

FETCHED TAGS TO BRING UP TO DATE WITH GITHUB bioapps:
cd /repos/public/bioapps
git fetch --tags
    remote: Counting objects: 480, done.
    remote: Compressing objects: 100% (296/296), done.
    remote: Total 480 (delta 169), reused 480 (delta 169)
    Receiving objects: 100% (480/480), 32.03 MiB | 160 KiB/s, done.
    Resolving deltas: 100% (169/169), done.
    From github.com:syoung/bioapps
     * [new tag]         0.6.0      -> 0.6.0

syoung@syoung-Satellite-L355:/repos/public/bioapps  (master)$ git tag
    0.6.0


3. COPIED FILES FROM DEVELOPMENT TO PRODUCTION:

mkdir ../temp
mv * ../temp
cp -r /agua/0.6/bioapps/* .


4. SET VERSION TO 0.7.0 IN PRODUCTION COPY AND AUTOMATICALLY UPLOAD TO GITHUB:

/agua/0.6/bin/scripts/version.pl \
--repodir /repos/public/bioapps \
--description "First installed version of bioapps" \
--version "0.7.0"


5. VERIFIED GITHUB bioapps VERSIONS ON COMMAND LINE

/agua/0.6/bin/logic/ops.pl apps getRemoteTags \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
syoung \
bioapps

    [
       {
          "sha" : "33a01c59e10cbeab0ebab301805eada7026cf49a",
          "name" : "0.6.0"
       },
       {
          "sha" : "2c173c767d66fd93a544b9d84b48abe44142eaa8",
          "name" : "0.7.0"
       }
    ]


WHICH DOES THIS COMMAND:

curl -F "login=syoung" -F "token=4416b765217a3c3de1ed99938ffe25e0" https://github.com/api/v2/json/repos/show/syoung/bioapps/tags


</entry>
<entry [Thu 2012:01:12 03:53:08 EST] RE-CREATED bioapps REPO ON GITHUB>

1. ADDED NEW REMOTE 
cd /agua/0.6/bioapps
git remote -v
    github	git@github.com:syoung/apps.git (fetch)
    github	git@github.com:syoung/apps.git (push)
    linode	ssh://root@173.230.142.248/srv/git/apps (fetch)
    linode	ssh://root@173.230.142.248/srv/git/apps (push)

git remote add bioapps git@github.com:syoung/bioapps.git
git remote -v
    bioapps	git@github.com:syoung/bioapps.git (fetch)
    bioapps	git@github.com:syoung/bioapps.git (push)
    github	git@github.com:syoung/apps.git (fetch)
    github	git@github.com:syoung/apps.git (push)
    linode	ssh://root@173.230.142.248/srv/git/apps (fetch)
    linode	ssh://root@173.230.142.248/srv/git/apps (push)

2. CREATED NEW PRIVATE bioapps REPO ON GITHUB

3. PUSHED LOCAL REPO TO bioapps

git push bioapps master
    Counting objects: 473, done.
    Compressing objects: 100% (458/458), done.

4. ADDED TAGS

git push bioapps --tags
    Counting objects: 5, done.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 665 bytes, done.
    Total 5 (delta 1), reused 0 (delta 0)
    To git@github.com:syoung/bioapps.git
     * [new tag]         0.1 -> 0.1
     * [new tag]         0.2 -> 0.2
     * [new tag]         0.3 -> 0.3
     * [new tag]         0.4 -> 0.4
     * [new tag]         0.5 -> 0.5

    
</entry>
<entry [Tue 2012:01:10 05:27:24 EST] SUCCESSFULLY COMPLETED FIRST WORKFLOW 'SYNC'>

git commit -a
[master 309aa93] Completed working Agua::Common::Package::syncWorkflows for all workflows. Todo: create separate 'private' repo for private projects, 'publish' private projects to public by copying files to 'biorepository/USERNAME' then sync. Created new dump file with 'status' field added to 'packages' table. Todo: implement 'syncing'/'ready' signalling in syncWorkflows, add syncApps and syncSources.
 21 files changed, 2100 insertions(+), 255 deletions(-)


[master 4b2917c] Almost completed cgi-bin/package/Package.t test for Agua::Common::Package::syncWorkflows. Todo: Verify workflow files are on remote repo, create tests for 'private' projects and 'publishing' private projects to public.

    
</entry>
<entry [Tue 2012:01:10 02:34:02 EST] DOWNLOAD WORKFLOWS SHARED ON biorepository BY OTHER USERS>


1. clone/pull SHARING USER'S biorepository FORK WITH THEIR LATEST WORKFLOWS AND APPS 

2. LOAD THE DOWNLOADED WORKFLOWS AND APPS INTO THE DATABASE WITH OWNER github-LOGIN

3. STORE PROVENANCE INFORMATION IN A SEPARATE FILE + RECORD OF TRANSACTION - PULL REQUEST?

    
</entry>
<entry [Tue 2012:01:10 01:53:34 EST] FOR A NEW INSTALLATION OF AGUA, DOWNLOAD EXISTING WORKFLOWS AND APPS FROM GITHUB>

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
<entry [Sun 2012:01:08 02:18:34 EST] THE Agua REPOS ARCHITECTURE>

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
<entry [Sun 2012:01:08 00:19:22 EST] THE agua DEVELOPMENT LIFE-CYCLE>

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
<entry [Sat 2012:01:07 23:49:44 EST] THE bioapps DEVELOPMENT LIFE-CYCLE>

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
<entry [Mon 2011:11:21 17:35:30 EST] ADDED t/cgi-bin/version/Package.t TO TEST Agua::Common::Version>

cd /agua/0.6/t/cgi-bin/version/ops

/agua/0.6/bin/logic/ops.pl testversion install  \
--version 0.2 \
--installdir /agua/0.6/t/cgi-bin/version/targetdir \
--logfile /agua/0.6/t/cgi-bin/version/targetdir/updateapp.log \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0


./Package.t \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--keyfile /root/.ssh/idents/github.com/id_rsa


#### MANUAL RUN OF AGUA apps UPDATE TO VERSION 0.2    

echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"upgrade","version":"0.2","application":"apps"}' | ./workflow.cgi

/agua/0.6/0.6/bin/logic/ops.pl apps install  \
--version 0.2 \
--installdir /agua/0.6/t/cgi-bin/version/targetdir/apps \
--logfile /var/www/html/agua/0.6/apps-upgradelog.html \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0


#### MANUAL RUN OF AGUA apps UPDATE TO LATEST VERSION

cd /agua/0.6/repos/biorepository/syoung/apps
/agua/0.6/bin/logic/ops.pl apps install \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--installdir /agua/0.6/apps \
--logfile /var/www/html/agua/0.6/log/apps-upgradelog.html 


    
</entry>
<entry [Tue 2011:11:15 02:23:50 EST] UPDATE apps AUTOMATICALLY AFTER USER CONFIRMATION>

UPDATE apps
===========

1. ON LOAD, getData CHECKS BUILD IN biorepository/syoung/bioapps AGAINST ENTRY IN repoversion TABLE

    -   USER CONFIRMS PROMPT TO UPDATE bioapps AND SENDS THIS REQUEST:
    

echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"upgradeApp","version":"0.2","application":"apps"}' | ./workflow.cgi

/agua/0.6/0.6/bin/logic/ops.pl apps install  \
--version 0.2 \
--installdir /agua/0.6 \
--logfile /var/www/html/agua/0.6/apps-upgradelog.html \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0

    -   Version.pm RUNS ops TO UPDATE apps IN PLACE

UPDATE TO VERSION 0.2    

cd /agua/0.6/repos/biorepository/syoung/apps
/agua/0.6/bin/logic/ops.pl apps install \
--version 0.2  \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--installdir /agua \
--aguaversion 0.6 \
--logfile /var/www/html/agua/0.6/log/apps-upgradelog.html 


UPDATE TO LATEST VERSION

cd /agua/0.6/repos/biorepository/syoung/apps
/agua/0.6/bin/logic/ops.pl apps install \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--installdir /agua/0.6/apps \
--logfile /var/www/html/agua/0.6/log/apps-upgradelog.html 


/agua/0.6/bin/logic/ops.pl apps install  \
--version 0.2 \
--installdir /agua/0.6/apps \
--logfile /var/www/html/agua/0.6/apps-upgradelog.html \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0


</entry>
<entry [Thu 2011:11:17 15:58:26 EST] SYNCING AGUA DATA TO private AND biorepository>


SEE agua.repo
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
<entry [Wed 2011:11:16 03:42:24 EST] agua UPDATE/UPGRADE SCENARIOS>


USE SCENARIOS: APPLICATIONS
=============

DEVELOPER:

    MAINTAIN A SEPARATE git REPOSITORY IN apps:

        -   E.G., WANT TO UPDATE bioapps SEPARATELY FROM agua
    
        -   EASIER FILE MANAGEMENT DUE TO PHYSICAL SEPARATION OF AGUA AND APPS ON FILESYSTEM

        -   EASIER VERSION MANAGEMENT DUE TO SEPARATE REPOSITORIES IN GITHUB


    agua REPOSITORY ALSO TRACKS CHANGES IN bioapps

        -   EASY PACKAGING WITH .gitignore TO SKIP bioapps/.git 
        

    bioapps UPDATES IN GITHUB REPO ARE DISCOVERED BY agua INSTALLATIONS: 
        
        -   USER CAN UPDATE APPS WITHOUT UPGRADING AGUA
        
        -   DEVELOPER INCREMENTS PATCH AND BUILD TO RELEASE FIXES/IMPROVEMENTS

        -   DEVELOPER INCREMENTS MINOR VERSION IF UPDATE DOES NOT CHANGE API (I.E., WEB JSON API)

        -   DEVELOPER INCREMENTS MAJOR VERSION IF UPDATE CHANGES API

ADMIN USER:

    THE ADMIN USER HAS TWO OPTIONS FOR BRINGING THE CODE UP TO DATE OR REVERTING TO EARLIER VERSIONS:
    
    UPGRADES :
    
        -   E.G.: agua
    
        -   ops install (USES git clone THEN git checkout *TAGNAME*)
        
        -   CREATES NEW INSTALLATION DIRECTORY

        -   MAJOR CHANGES (E.G., DATABASE CHANGES)

        -   USERS CAN RETAIN EARLIER VERSIONS OF APPS THAT WERE USED ON EARLIER DATA

        -   UPDATE repoversion TABLE AFTER INSTALL WITH current, VERSION/BUILD AND INSTALL DATE
        

    UPDATES : 

        -   E.G.: bioapps, t

        -   ops upgrade (USES git pull THEN git checkout *TAGNAME*)
        
        -   WRITES OVER EXISTING INSTALLATION
        
        -   BUG FIXES, TESTS, FEATURE ENHANCEMENTS, NO MAJOR CHANGES

        -   CAN REWIND TO EARLIER VERSIONS USING git checkout
        
        -   UPDATE repoversion TABLE AFTER INSTALL WITH current, VERSION/BUILD AND INSTALL DATE

        -   UPDATE app TABLE
        
    
    

USE SCENARIOS: WORKFLOWS, SOURCES, APPS (JSON)
=============

NON-ADMIN USERS:

    'ONCLICK' PUSH WORKFLOWS, SOURCES, APPS TO GITHUB private/biorepository 

        -   USER JUST CLICKS 'SYNC' BUTTON
        
        -   ALL DATA PRIVATE BY DEFAULT
        
        -   WHEN USER SHARES DATA, THE PROJECTS, APPS AND SOURCES ARE COPIED TO THE FOLLOWING FOLDERS:
        
            repos/biorepository/USERNAME/apps
            repos/biorepository/USERNAME/workflows
            repos/biorepository/USERNAME/sources
            


ADMIN USERS:
    
    RESTORE THE DATA FROM A DIFFERENT AGUA INSTALLATION:
    
        -   DATA ITEMS:
        
            -   USER apps, workflows AND sources
        
            -   MYSQL DATABASE DUMP (NB: CONTAINS PRIVATE KEY FILES)
            
            -   CONFIG FILE 

        -   CLONE biorepository AND FORKS
        
            cd /agua/0.6/repos/USERNAME/apps
            git clone www.github.com/USERNAME/apps.git


    
</entry>
<entry [Wed 2011:11:16 01:29:25 EST] TESTED LINKED (BAD) AND SUBDIR (GOOD) apps AS SUBMODULE OF agua (PUSHED TO GITHUB private)>

SUMMARY
=======

WORKS BOTH WAYS - WITH A LINKED DIRECTORY /bioapps AND WITH AN ADDED DIRECTORY /agua/0.6/apps-mod

1. INITIALISE git INSIDE DIRECTORY

2. ADD DIRECTORY AS SUBMODULE TO AGUA

3. ADD REMOTE TO private.git

4. PUSH/PULL AT WILL

NB: ADDED DIRECTORY ALLOWS AGUA TO INCLUDE ADDED FILES


UPLOAD EXISTING REPO
====================

Existing Git Repo?

cd existing_git_repo
git remote add origin git@github.com:syoung/biorepository.git



apps
====

USED A LINKED SUBDIR (SO NOT BACKED UP IN agua) AS A SUBMODULE (SO CAN PUSH IT TO A SEPARATE REPO - THE 'private' REPO ON GITHUB)

1. MOVED apps OUT OF agua

mv /agua/0.6/apps
/bioapps
ln -s /bioapps /agua/0.6/apps

cd /agua/0.6
    lrwxrwxrwx  1 root   root      8 2011-11-16 01:19 apps -> /bioapps/


2. INITIALISED GIT INSIDE apps DIRECTORY:

cd /agua/0.6/apps
git init


3. ADDED TO AGUA AS A SUBMODULE

cd /agua/0.6
git submodule add ./apps


4. ADDED FOLDERS TO apps

cd /agua/0.6/apps
git add bioapps bioapps-*
git commit -a

    [master (root-commit) 654001b] First commit bioapps
    
     Committer: root < root@Satellite-L355.(none)>
    Your name and email address were configured automatically based
    on your username and hostname. Please check that they are accurate.
    You can suppress this message by setting them explicitly:
    
        git config --global user.name "Your Name"
        git config --global user.email you@example.com
    
    After doing this, you may fix the identity used for this commit with:
    
        git commit --amend --reset-author
    
     202 files changed, 75538 insertions(+), 0 deletions(-)
     create mode 120000 bioapps
     create mode 100755 bioapps-000001-0.8/bin/aligners/BOWTIE.pl
    ...


5. SET UP REMOTE TO private ON GITHUB


git remote add origin git@github.com:syoung/private.git


INITIAL PUSH COMPLAINED ABOUT FAST FORWARD

git push -u origin master


    To git@github.com:syoung/private.git
     ! [rejected]        master -> master (non-fast-forward)
    error: failed to push some refs to 'git@github.com:syoung/private.git'
    To prevent you from losing history, non-fast-forward updates were rejected
    Merge the remote changes (e.g. 'git pull') before pushing again.  See the
    'Note about fast-forwards' section of 'git push --help' for details.


... SO DID GIT PULL FIRST:


git pull github master
    From github.com:syoung/private
     * branch            master     -> FETCH_HEAD
    Merge made by recursive.


AND THEN ADDED 'README' FILE:

em README 
git add .
git commit -a -m "Added apps README"
    [master e124c27] Added apps README
     Committer: root < root@Satellite-L355.(none)>
    Your name and email address were configured automatically based
    on your username and hostname. Please check that they are accurate.
    You can suppress this message by setting them explicitly:
    
        git config --global user.name "Your Name"
        git config --global user.email you@example.com
    
    After doing this, you may fix the identity used for this commit with:
    
        git commit --amend --reset-author
    
     1 files changed, 1 insertions(+), 0 deletions(-)
     create mode 100644 README
     create mode 100644 README~


... AND PUSHED TO GITHUB:

git push github master
    Counting objects: 9, done.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (8/8), 768 bytes, done.
    Total 8 (delta 1), reused 0 (delta 0)
    To git@github.com:syoung/private.git
       ec9a02f..e124c27  master -> master




apps-mod
========


1. CREATED apps-mod FOLDER

mkdir -p /agua/0.6/apps-mod

2. INITIALISED GIT INSIDE DIRECTORY

cd /agua/0.6/apps-mod
git init


3. ADDED TO AGUA AS A SUBMODULE

cd /agua/0.6
git submodule add ./apps-mod

4. ADDED FOLDERS

cp -r apps/bioapps-000001-0.8/ apps-mod/
git add .
git commit -a

    [master b737556] Added bioapps to apps-mod.
     Committer: root < root@Satellite-L355.(none)>
    Your name and email address were configured automatically based
    on your username and hostname. Please check that they are accurate.
    You can suppress this message by setting them explicitly:
    
        git config --global user.name "Your Name"
        git config --global user.email you@example.com
    
    After doing this, you may fix the identity used for this commit with:
    
        git commit --amend --reset-author
    
     201 files changed, 75537 insertions(+), 0 deletions(-)
     create mode 100755 apps-mod/bioapps-000001-0.8/bin/aligners/BOWTIE.pl
     create mode 100755 apps-mod/bioapps-000001-0.8/bin/aligners/BOWTIEcheck


5. SET github REMOTE AND PUSH TO IT

git remote add origin git@github.com:syoung/private.git

git push origin master

    OK




</entry>
<entry [Tue 2011:11:15 11:25:37 EST] ADVANCED TAGGING FUNCTIONALITY WITH git tag>

SUMMARY
=======

EDIT TAG

git tag -af "0.9" -m "Automatic backup of user data"

LIST TAG

git tag -ln




(SEE ALSO git tag --help)

<!--

git tag -h

usage: git tag [-a|-s|-u <key-id>] [-f] [-m <msg>|-F <file>] <tagname> [<head>]
   or: git tag -d <tagname>...
   or: git tag -l [-n[<num>]] [<pattern>]
   or: git tag -v <tagname>...

    -l                    list tag names
    -n[<n>]               print <n> lines of each tag message
    -d                    delete tags
    -v                    verify tags

Tag creation options
    -a                    annotated tag, needs a message
    -m <msg>              message for the tag
    -F <FILE>             message in a file
    -s                    annotated and GPG-signed tag
    -u <key-id>           use another key to sign the tag
    -f, --force           replace the tag if exists

Tag listing options
    --contains <commit>   print only tags that contain the commit

-->

CHANGE A TAG MESSAGE:

cd /repos/biorepository/syoung 
syoung@Satellite-L355:/repos/biorepository/syoung$ git tag -ln
    0.1             Biorepository version 1.0
    0.8             Added WRONG version - tag 0.8 (testing agua.pm)
    0.9             Message for tag 0.9


git tag -af "0.9" -m "Automatic backup of user data to GitHub private and shared (biorepository) repos"
    Updated tag '0.9' (was 57ac628)

git tag -ln
    0.1             Biorepository version 1.0
    0.8             Added WRONG version - tag 0.8 (testing agua.pm)
    0.9             Automatic backup of user data to GitHub private and shared (biorepository) repos

    
</entry>
<entry [Tue 2011:11:15 01:30:44 EST] AGUA BACKUP TO PRIVATE GITHUB REPO: MYSQL, PUBLIC AND PRIVATE REPOS>

ADMIN PANE Repos PANEL ADDITIONAL OPTION FOR ADMIN USER (PRESENT IF Agua.repos.agua EXISTS)


USER CREATES AGUA REPO
    
    -   CREATE A PRIVATE 'agua-backup' REPO USING ADMIN USER'S GITHUB KEY
    
        repos/private/USERNAME/agua-backup
        
    
    -   CREATE MYSQL DUMP AND COPY TO BACKUP REPO
        (SELECT INCLUDING/EXCLUDING aws KEY INFO AND GITHUB TOKEN)

            INSTALLDIR/VERSION/bin/dump/DATETIME-agua.dump
            
            AND
            
            repos/private/admin/agua-backup
            
            
    -   COPY CONFIG FILE TO BACKUP REPO
    
####    -   EDIT .gitignore FILE EXCLUDES LARGE DATA FILES, E.G., TEST INPUT FILES, SNP.pm INPUTS
####    
####    -   PUSH WHOLE INSTALLDIR/VERSION TO GITHUB
####

USER SYNCS AGUA REPO

    -   git add THE COMMIT ON WHOLE AGUA INSTALLATION

    
</entry>
<entry [Tue 2011:11:15 01:04:50 EST] ADMIN PANE Repo PANEL FOR MANAGING USER REPOSITORIES>

FUNCTIONALITY
=============

1. PERSONAL - ALLOW USERS TO SAVE APPS, WORKFLOWS AND SOURCES TO PRIVATE REPO

    THESE APPS CAN BE UPLOADED TO GITHUB AS A PRIVATE REPOSITORY


2. SHARED - ALLOW USERS TO PUBLISH APPS, WORKFLOWS AND SOURCES TO THE BIOREPOSITORY




LOCATION
========

PRIVATE REPOS

repos/private/username/apps/myApp.json
repos/private/username/workflows/Project1.json <=== A COMPLETE PROJECT
repos/private/username/sources/Source1.json

PUBLIC REPOS

repos/biorepository/username/apps
repos/biorepository/username/workflows/Project2
repos/biorepository/username/sources/Source2


USERS CAN GRANT INDIVIDUAL ACCESS TO THEIR PRIVATE REPOS USING THE GITHUB ACCOUNT MANAGEMENT TOOLS.



Repo PANEL USE CASES
====================

USER CREATES OR EDITS AN APP, WORKFLOW OR SOURCE:
    
    -   THE ENTITY IS ADDED TO app, workflow OR sources TABLE

    -   A JSON FILE FOR THE ENTITY IS PRINTED, E.G.:

        repos/private/username/apps/appname.json


USER 'PUBLISHES' AN APPLICATION FILE

    -   THE JSON FILE IS COPIED TO repos/biorepositories, E.G.:

        repos/biorepository/username/apps/appname.json
    

SYNCING TO A REPOSITORY FOR THE FIRST TIME

    -   THE REPOSITORY IS CREATED ON GITHUB
    
    -   IF IT'S A PRIVATE REPOSITORY:
    
            CREATE A NEW REPO WITH THE USER-SPECIFIED NAME
    
    -   IF IT'S PUBLIC:

            FORK biorepository AND ADD FOLDERS
            
                username/apps
                        /workflows
                        /sources
    
    -   git add AND COMMIT WITH USER'S MESSAGE IF AVAILABLE

    -   git push USING THE USER'S GITHUB SSH KEY TO UPLOAD REPOSITORY
    


    
</entry>
<entry [Tue 2011:11:15 00:54:58 EST] USE root FOR REPOSITORIES MANAGEMENT>

SEE SETUID POLICY
[Mon Jan 31 21:53:33 EST 2011]
FINISH REMAINING BLOCKERS


root PRIVILEGES ARE NEEDED TO INSTALL APPLICATIONS SYSTEM-WIDE

BY DEFAULT AGUA CARRIES OUT REPOSITORY INSTALLATIONS AS root

FOR THIS REASON, EXTREME CARE IS TAKEN TO INSPECT AND APPROVE PACKAGES BEFORE ADDING THEM TO THE biorepository MASTER. 

AGUA ADMINS SHOULD ONLY INSTALL biorepository FORKS FROM THEIR OWN OR TRUSTED SOURCES.

ALL BIOREPOSITORY COMPONENTS ARE TEXT FILES SO THEY CAN BE EASILY INSPECTED


</entry>
<entry [Sat 2011:11:12 01:14:01 EST] ENABLED CLONING PRIVATE REPOS: ADD PRIVATE KEY TO ~/.ssh/idents/github.com>


1. INSTALL biorepository REPOS AS ROOT

2. STORE USER'S GITHUB SSH KEY IN A ROOT-OWNED LOCATION

/root/.ssh/idents/github.com/id_rsa-LOGIN

1. CREATE SHELL SCRIPT TO ACCEPT

USE 'GIT_SSH' ENVIRONMENT VARIABLE TO push/fetch WITH CORRECT SSH KEYFILE 
http://stackoverflow.com/questions/3496037/how-to-specify-which-ssh-key-to-use-within-git-for-git-push-in-order-to-have-git


emacs -nw /root/.ssh/git-ssh.sh

    #!/bin/sh
    
    exec ssh -i $GITSSH_KEYFILE -o "StrictHostKeyChecking no" "$@"
    exit 0


2. SET 'GIT_SSH' AND 'GITSSH_KEYFILE':

export GIT_SSH=/root/.ssh/git-ssh.sh
export GITSSH_KEYFILE=/root/.ssh/idents/github.com/LOGIN

WHERE 'LOGIN' IS THE USER'S GITHUB ACCOUNT NAME


3. RUN git clone 

git clone git@github.com:syoung/agua.git
    OK




NOTES
=====

1. CAN'T USE SSH config BECAUSE GITHUB ONLY USES THE 'git' REMOTE USER, RATHER THAN THE ACCOUNT OWNER'S NAME

http://www.cyberspice.org.uk/blog/2010/07/23/using-multiple-public-keys-with-ssh/

2. THIS WON'T WORK EITHER BECAUSE git USES THE git USER WHEN CONNECTING:

emacs -nw ~/.ssh/config

    Host github.com
        User git
        Hostname github.com
        PreferredAuthentications publickey
        IdentityFile [local path to private key half of github public key you provided]git

3. SHORTCUT - COPY WHOLE .ssh DIR FROM syoung TO ROOT:

sudo cp /home/syoung/.ssh/config /root/.ssh
sudo cp /home/syoung/.ssh/idents /root/.ssh


</entry>
<entry [Sat 2011:11:12 00:36:54 EST] ADDED 0.7 TAG TO agua AND aguadev>

REQUIRED TO TEST agua.pm

git tag -a "0.7" -m "Pre-alpha build"
git tag
    0.6
    0.7

GET TAGS USING TOKEN:

curl -F "login=syoung" -F "token=4416b765217a3c3de1ed99938ffe25e0" http://github.com/api/v2/json/repos/show/syoung/aguadev/tags | pretty.pl 

    {
       "tags" : {
          "0.6" : "cdfdb8742e0404cce6336cb438ecadc0642a9b0d",
          "0.7" : "958a7c244fa6fa4215a5f415af7e4e8e1546fd84"
       }
    }

GET THE MESSAGE (DESCRIPTION) FOR A TAG:

https://api.github.com/repos/:user/:repo/git/tags/:sha



curl -F "login=syoung" -F "token=4416b765217a3c3de1ed99938ffe25e0" https://api.github.com/repos/syoung/aguadev/git/tags/958a7c244fa6fa4215a5f415af7e4e8e1546fd84


curl -F "login=syoung" -F "token=4416b765217a3c3de1ed99938ffe25e0" https://api.github.com/repos/syoung/apps/git/tags/de790db39ec65abc1eddbee965f312922a3ccecc



NB: WILL NOT WORK WITHOUT TOKEN:

curl http://github.com/api/v2/json/repos/show/syoung/aguadev/tags

    {"error":"Not Found"}


</entry>
<entry [Tue 2011:11:08 09:00:15 EST] GITHUB API: CREATE/DELETE REPOS AND SET PUBLIC/PRIVATE>

USING THE stuartpyoung ACCOUNT:

CREATE A REPO
=============

curl -F 'login=stuartpyoung' -F 'token=a359152dd81fbd744a86128c0be5a764' -F 'name=testcreate' http://github.com/api/v2/json/repos/create  | pretty.pl

{
   "repository" : {
      "has_downloads" : "true",
      "owner" : "stuartpyoung",
      "has_issues" : "true",
      "name" : "testcreate",
      "private" : "false",
      "has_wiki" : "true",
      "size" : 0,
      "forks" : 1,
      "watchers" : 1,
      "created_at" : "2011/11/08 06:12:08 -0800",
      "fork" : "false",
      "url" : "https://github.com/stuartpyoung/testcreate",
      "open_issues" : 0
   }
}



DELETE A REPO
=============

1. DELETE (RETURNS TOKEN)

curl -F 'login=stuartpyoung' -F 'token=a359152dd81fbd744a86128c0be5a764' https://github.com/api/v2/json/repos/delete/stuartpyoung/testcreate  | pretty.pl

{
   "delete_token" : "dckdbuhehp"
}

2. SUBMIT TOKEN

curl -F 'login=stuartpyoung' -F 'token=a359152dd81fbd744a86128c0be5a764' https://github.com/api/v2/json/repos/delete/stuartpyoung/testcreate -F 'delete_token=dckdbuhehp'   | pretty.pl

{
   "status" : "deleted"
}


SET PRIVATE REPO
================

curl -F 'login=stuartpyoung' -F 'token=a359152dd81fbd744a86128c0be5a764' https://github.com/api/v2/json/repos/set/private/stuartpyoung/testcreate  | pretty.pl


CONFIRM:

curl http://github.com/api/v2/json/repos/show/stuartpyoung/testcreate/network | pretty.pl

{
   "repository" : {
      "owner" : "stuartpyoung",
      "has_downloads" : "true",
      "has_issues" : "true",
      "name" : "testcreate",
      "private" : "true",
      "has_wiki" : "true",
      "size" : 0,
      "forks" : 0,
      "watchers" : 1,
      "created_at" : "2011/11/08 06:12:08 -0800",
      "fork" : "false",
      "url" : "https://github.com/stuartpyoung/testcreate",
      "open_issues" : 0
   }
}


SET PUBLIC REPO
===============

curl -F 'login=stuartpyoung' -F 'token=a359152dd81fbd744a86128c0be5a764' https://github.com/api/v2/json/repos/set/public/stuartpyoung/testcreate | pretty.pl

{
   "repository" : {
      "owner" : "stuartpyoung",
      "has_downloads" : "true",
      "has_issues" : "true",
      "name" : "testcreate",
      "private" : "false",
      "has_wiki" : "true",
      "size" : 0,
      "forks" : 1,
      "watchers" : 1,
      "created_at" : "2011/11/08 06:12:08 -0800",
      "fork" : "false",
      "url" : "https://github.com/stuartpyoung/testcreate",
      "open_issues" : 0
   }
}





NOTES
=====

http://develop.github.com/p/repo.html

Creating and Deleting Repositories
To create a new repository, hit this url

repos/create

with at least 'name' but it will take any of these as POST args

name => name of the repository. ex: "my-repo" or "other-user/my-repo" description => repo description homepage => homepage url public => 1 for public, 0 for private

You can also delete a repository with a POST to

repos/delete/:user/:repo
repos/delete/:repo (DEPRECATED)

which will give you back a token in the 'delete_token' field of the response, which you then have to post back to the same url again (in the 'delete_token' POST var) to complete the deletion.

Repository Visibility

To set a public repository private, you can POST while authenticated to

repos/set/private/:user/:repo
repos/set/private/:repo (DEPRECATED)


To make a private repo public, POST while authenticated to

repos/set/public/:user/:repo
repos/set/public/:repo (DEPRECATED)

    
</entry>
<entry [Mon 2011:11:07 22:34:06 EST] GET SHORT BUILD ID FROM SHA>

LOCAL GIT:
	git rev-parse --short HEAD
	857beb9
	git rev-parse HEAD
	857beb98f9108bace32e21e9d9d684c77caf2079


    
</entry>
<entry [Mon 2011:11:07 15:54:49 EST] ADDED 0.6 TAG TO agua AND aguadev>

cd /tmp
git clone git@github.com:syoung/agua.git

git tag -a "0.6" -m "Pre-release alpha version 0.6"
git push --tags
    Counting objects: 1, done.
    Writing objects: 100% (1/1), 176 bytes, done.
    Total 1 (delta 0), reused 0 (delta 0)
    To git@github.com:syoung/agua.git
     * [new tag]         0.6 -> 0.6

git tag
    0.6


ADDED README TO ENABLE ADD NEW TAG 0.7:

git tag -a "0.7" -m "Added version tag 0.7 to test agua.pm install of latest version"
git push --tags
    Counting objects: 11, done.
    Compressing objects: 100% (6/6), done.
    Writing objects: 100% (7/7), 773 bytes, done.
    Total 7 (delta 4), reused 0 (delta 0)
    To git@github.com:syoung/agua.git
     * [new tag]         0.7 -> 0.7
     
git tag
    0.6
    0.7


GET TAGS FROM GITHUB:

curl https://api.github.com/repos/syoung/agua/tags 

    [
        {
            "commit": {
              "url": "https://api.github.com/repos/syoung/agua/commits/f77c95b6fe5e8855fdd5f6984a0b99901086f235",
              "sha": "f77c95b6fe5e8855fdd5f6984a0b99901086f235"
        },
            "zipball_url": "https://github.com/syoung/agua/zipball/0.6",
            "name": "0.6",
            "tarball_url": "https://github.com/syoung/agua/tarball/0.6"
        },
        {
            "commit": {
              "url": "https://api.github.com/repos/syoung/agua/commits/55b17351c1415df15db2f5dab07ddc99e42b48e5",
              "sha": "55b17351c1415df15db2f5dab07ddc99e42b48e5"
            },
            "zipball_url": "https://github.com/syoung/agua/zipball/0.7",
            "name": "0.7",
            "tarball_url": "https://github.com/syoung/agua/tarball/0.7"
        }
    ]



REMOVING A TAG:

E.G., MISTAKENLY ADDED NEW TAG:

git tag -a "0.8" -m "Added WRONG version - tag 0.8 (testing agua.pm)"
git push --tags

REMOVE TAG 0.8:

git tag -d 0.8
    Deleted tag '0.8' (was fcbda59)


CONFIRM TAG 0.8 WAS REMOVED:
git tag
    0.1
    2.0

</entry>
<entry [Sat 2011:11:05 01:23:26 EST] BLUEPRINT FOR REPOS>

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
<entry [Sat 2011:11:05 01:22:26 EST] ADDED GitHub TO Ops.pm AND IMPLEMENTED AGUA UPGRADE WITH agua.pm>

NB: CAN INSTALL ON REMOTE HOST USING ops.pl WITH --hostname AND --privatekey ARGUMENTS

1. #### DONE #### ADDED Agua::Ops::GitHub TO Ops.pm 

    1. VERSIONS: GET TAG, SET TAG, SHOW TAGS
    
    2. FILES: DOWNLOAD A SPECIFIC VERSION FILE
    
    3. #### REPOS: CREATE, PRIVATE/PUBLIC, DELETE, SEARCH
    

    LATER: USE Pithub OR Net::GitHub TO DO GITHUB CALLS?
        


2.  #### DONE #### TESTING: INSTALL fastqc USING ops.pl

GENERATED fastqc.app FILE FROM fastqc SCRAPE

/agua/0.6/bin/apps/logic/flow.pl \
/agua/0.6/repos/biorepository/syoung/fastqc/fastqc.app \
loadScrape \
--scrapefile /agua/0.6/repos/biorepository/syoung/fastqc/fastqc.scrape \
--name fastqc
    OK

INSTALLED FASTQC ON REMOTE HOST USING ops.pl:

mkdir -p /agua/0.6/repos/biorepository/syoung/fastqc
cd /agua/0.6/repos/biorepository/syoung/fastqc
sudo /agua/0.6/bin/apps/logic/ops.pl \
fastqc install \
--keyfile /nethome/admin/.starcluster/id_rsa-admin-key \
--hosts ec2-184-73-22-214.compute-1.amazonaws.com \
--username root "0.9.3"



3. #### DONE #### COMPLETED IMPLEMENTATION OF agua.pm TO UPGRADE AGUA WITH ops

GENERATED install.app FILE FROM install.pl SCRAPE

/agua/0.6/bin/apps/logic/flow.pl \
/agua/0.6/repos/biorepository/syoung/agua/install.app \
loadScrape \
--scrapefile /agua/0.6/repos/biorepository/syoung/agua/install.scrape \
--name install.pl \
--location /agua/0.6/bin/scripts/install.pl \
--description "Install Agua or upgrade if already installed. Use latest version unless otherwise specified with '--version' option" 

    OK

UPGRADED AGUA LOCALLY USING ops.pl:

mkdir -p /agua/0.6/repos/biorepository/syoung/agua
cd /agua/0.6/repos/biorepository/syoung/agua
sudo /agua/0.6/bin/apps/logic/ops.pl agua install



agua.pm DOES THE FOLLOWING:


    1. #### DONE #### UPDATE agua FROM THE BIOREPOSITORY
    
        1. USE Ops.pm ON agua.pm TO RETRIEVE agua REPO AND INSTALL

            1. DOWNLOAD NEW OR SPECIFIED VERSION

                SETS /INSTALLDIR/VERSION LINK TO UPGRADED VERSION

            2. RUN install.pl (NB: NO RUN config.pl)

                LATER:
            
                    UPDATE install.pl FOR BACKWARDS COMPATIBILITY:
                    
                        REBUILD DATABASE TABLES IF INCOMPATIBLE
                        
                        ADD NEW DATABASE TABLES IF REQUIRED
                        
                        
        
    
    2. ADD UPDATE INFORMATION TO WEB PAGE HOME PANE
    
    

</entry>
