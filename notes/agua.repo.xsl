agua.repo


<entry [Thu 2012:01:26 02:03:50 EST] COMPLETED Package.t TO TEST Agua::Common::Package (Role)>

syoung
======
./Package.t \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--keyfile /root/.ssh/idents/github.com/id_rsa



NB: GET THIS ERROR WHEN NOT USING syoung LOGIN TOKEN:

stuartpyoung
============
./Package.t \
--login stuartpyoung \
--token a359152dd81fbd744a86128c0be5a764 \
--keyfile /root/.ssh/idents/github.com/id_rsa



2012-01-26 02:08:48	[DEBUG]   	Agua::Common::Workflow::_defaultWorkflows	587json: {
        'number' => 1,
        'project' => 'Project1',
        'name' => 'Workflow1'
    }

    {"error":"not defined: username","subroutine":"Agua::Common::Workflow::_addWorkflow","linenumber":"329","filename":"/agua/0.6/t/bin/Agua/Common/Package/../../../../../lib/Agua/Common/Workflow.pm","timestamp":"2012-01-26 02:08:48"}


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
<entry [Tue 2012:01:17 09:26:33 EST] PREPARATION FOR INSTALLING LATEST VERSIONS OF bioapps AND bioreposotory USING Installer.pm>

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
