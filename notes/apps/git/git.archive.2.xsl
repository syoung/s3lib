git.archive.2


<entry [Wed 2011:04:13 10:30:11 EST] CREATED aguatest REPOSITORY AND SYNCED WITH github>
    
1. CONFIGURE GIT
cd /home/syoung/0.6/t
git config --global user.name "Stuart Young"
git config --global user.email stuartpyoung@gmail.com

2. INITIALISE aguadev REPOSITORY 
cd /home/syoung/0.6/t
git init
git add .
git commit -m "First commit"

3. FIRST TIME: ADD GITHUB REMOTE
git remote rm origin 
git remote add origin git@github.com:syoung/aguatest.git

    
</entry>
<entry [Tue 2011:04:12 10:58:37 EST FIX git commit: fatal: object XXXXXXX is corrupted>

http://programblings.com/2008/06/07/the-illustrated-guide-to-recovering-lost-commits-with-git/


PROBLEM:

git commit -a
    fatal: object 2a6beaae73b95b810aa59b22b586022c42d4691b is corrupted

SOLUTION:

~/notes$ grep -R 2a6beaae73b95b810aa59b22b586022c42d4691b  .git

    .git/logs/refs/heads/master:647dd526e50f72c45346799f547d1fc1724b875a 2a6beaae73b95b810aa59b22b586022c42d4691b Stuart Young < stuartpyoung@gmail.com> 1302363526 -0400	commit: onworking MooseX::Declare conversion of Agua::Monitor::SGE
    .git/logs/refs/remotes/notes/master:647dd526e50f72c45346799f547d1fc1724b875a 2a6beaae73b95b810aa59b22b586022c42d4691b Stuart Young < stuartpyoung@gmail.com> 1302363531 -0400	update by push
    .git/logs/HEAD:647dd526e50f72c45346799f547d1fc1724b875a 2a6beaae73b95b810aa59b22b586022c42d4691b Stuart Young < stuartpyoung@gmail.com> 1302363526 -0400	commit: onworking MooseX::Declare conversion of Agua::Monitor::SGE
    .git/refs/heads/master:2a6beaae73b95b810aa59b22b586022c42d4691b
    .git/refs/remotes/notes/master:2a6beaae73b95b810aa59b22b586022c42d4691b


The following commands will help you figure you way out of most bad situations:

git show
git fsck −−lost-found
git diff
And these ones will actually get out of these bad situations:

git rebase
git cherry-pick
git merge
git apply

As I think I demonstrated, Git gives you the ability to recover from most bad mistakes. The fact that any single commit can be cherry-picked, checked out, rebased or merged makes it really easy to recover from hairy situations.

The only case where you might actually lose information is when something has not been committed or stashed yet, which I think is perfectly reasonable.


GIT REBASE DOESN'T WORK:

git rebase l

    cannot rebase: you have unstaged changes
    M	apps.git.xsl
    D	convert-pending/Notes-apps-mysql.txt
    D	convert-pending/Notes-apps-sge.txt
    D	projects/agua/project22.agua.build.xsl


GIT SHOW DOESN'T WORK:

git show 2a6beaae73b95b810aa59b22b586022c42d4691b
fatal: object 2a6beaae73b95b810aa59b22b586022c42d4691b is corrupted




    
</entry>
<entry [Tue 2011:04:05 18:13:24 EST] ADDED .gitignore FOR workflow-base BUILD>

SEE projects.agua.build.xsl
[Tue 2011:04:05 12:40:50 EST] BUILD workflow-base FOR DEBUGGING

CHANGED .gitignore FOR BUILDS DIR:

emacs /home/syoung/0.6/html/builds/.gitignore
    
    # IGNORE THESE FILES AND DIRS
    005
    006
    006-workflow-base
    *.zip
    # EXCEPT THE LATEST BUILD FILES
    !006-workflow-base/dojo/workflow-base.js
    !006-workflow-base/dojo/workflow-base.js.uncompressed.js
    !006-workflow-base/dojo/dojo/dojo.js
    !006-workflow-base/dojo/dojo/dojo.js.uncompressed.js
    !006.agua.build.txt
    !006.workflow-base.build.txt
    # AND THE ANNOYING LOCALE FILES
    !006-workflow-base/dojo/dojo/nls/_en-gb.js
    !006-workflow-base/dojo/dojo/nls/_en-us.js
    !006-workflow-base/dojo/dijit/nls/en-us.js



</entry>

<entry [Tue 2011:04:05 12:37:49 EST] SETTING UP A DEVELOPMENT REPOSITORY>

http://wiki.opscode.com/display/chef/Working+with+git

SUMMARY

1. ALL DEVELOPMENT SHOULD BE DONE IN A BRANCH

2. REMOVE THE origin REMOTE AND USE THE BRANCH NAME INSTEAD


DETAILS

# Clone the repositories locally
git clone git@github.com:yourgithubusername/chef.git

# Enter the chef directory and add an opscode remote
cd chef/
git remote add opscode git://github.com/opscode/chef.git

# You'll be able to see if this is successful with git config:
git config --get-regexp "^remote\.opscode"

    remote.opscode.url git://github.com/opscode/chef.git
    remote.opscode.fetch +refs/heads/*:refs/remotes/opscode/*

# Adjust your branch to track the opscode master remote branch
# By default it'll track your origin remote's master:
git config --get-regexp "^branch\.master"

    branch.master.remote origin
    branch.master.merge refs/heads/master

# Change it with the following:

$ git config branch.master.remote opscode



NOTES
-----

http://wiki.opscode.com/display/chef/Working+with+git

Working with Git
Attachments:3 Added by Barry Steinglass, last edited by Tom Thomas on Apr 04, 2011  (view change) show comment


	Chef Project Development
This page describes the workflow used for working on the Chef and related projects (Ohai, mixlibs, etc) source code. To learn more about Git itself:
Git Documentation
Learn Git
Pro Git
To learn about working with git and cookbooks:

Working with Git and Cookbooks
Initial setup of development repository
Setup a github account
Fork the repositories

Clone the repositories locally
$ git clone git@github.com:yourgithubusername/chef.git
Enter the chef directory and add an opscode remote
$ cd chef/
$ git remote add opscode git://github.com/opscode/chef.git
You'll be able to see if this is successful with git config:
$ git config --get-regexp "^remote\.opscode"
remote.opscode.url git://github.com/opscode/chef.git
remote.opscode.fetch +refs/heads/*:refs/remotes/opscode/*
Adjust your branch to track the opscode master remote branch, by default it'll track your origin remote's master:
$ git config --get-regexp "^branch\.master"
branch.master.remote origin
branch.master.merge refs/heads/master
Change it with the following:
$ git config branch.master.remote opscode


</entry>

<entry [Tue 2011:04:05 12:25:05 EST] ENABLE SIMPLE git push GLOBALLY>

SET LOCALLY:
git config branch.master.remote origin
git config branch.master.merge refs/heads/master

INSERTS THIS IN .git/config
    
    [branch "master"]
            remote = origin
            merge = refs/heads/master


SET AS GLOBAL DEFAULT:

git config --global branch.master.remote origin
git config --global branch.master.merge refs/heads/master



NOTES
-----

http://stackoverflow.com/questions/658885/how-do-you-get-git-to-always-pull-from-a-specific-branch

If you prefer, you can set these options via the commmand line (instead of editing the config file) like so:

  $ git config branch.master.remote origin
  $ git config branch.master.merge refs/heads/master
Or, if you're like me, and want this to be the default across all of your projects, including those you might work on in the future, then add it as a global config setting:

  $ git config --global branch.master.remote origin
  $ git config --global branch.master.merge refs/heads/master
    
</entry>


<entry [Tue 2011:04:05 12:03:25 EST] CREATED komodo SETTINGS git REPOSITORY>
    
cd /home/syoung/.komodoedit/6.1/tools/.git/
git init

git config --global user.name "Stuart Young"
git config branch.master.merge refs/heads/master

git add . 
git commit -m "First commit of komodo settings"
git remote add origin git@github.com:syoung/komodo.git
git push origin master

    OK

ENABLE SIMPLE git push

git config branch.master.remote origin
git config branch.master.merge refs/heads/master

cat .git/config
    [core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
    [remote "origin"]
        url = git@github.com:syoung/komodo.git
        fetch = +refs/heads/*:refs/remotes/origin/*
    [branch "master"]
        remote = origin
        merge = refs/heads/master


NB: FROM NOW CAN ON JUST USE

    git push



</entry>
<entry [Mon 2011:04:04 12:37:49 EST] SET UP agua PUBLIC REPOSITORY WITH EXPORT FROM aguadev>

http://stackoverflow.com/questions/160608/how-to-do-a-git-export-like-svn-export

1. SET FILES AND DIRS TO BE IGNORED DURING EXPORT

emacs /home/syoung/0.6/.gitattributes
# DON'T EXPORT THESE FILES AND DIRS
/home/syoung/0.6/html/plugins/.gitignore export-ignore
/home/syoung/0.6/html/builds/.gitignore export-ignore
/home/syoung/0.6/bin/apps/t export-ignore
/home/syoung/0.6/html/plugins/view/jbrowse/.gitignore

cd /home/syoung/0.6
git add .
git commit -m 'Added .gitattributes containing ignore-exports to exclude files from export'
git push
    OK


#### 'git archive' (I.E., 'svn export') FRESH COPY TO RELEASE DIR FROM aguadev
rm -fr /home/syoung/RELEASE/0.6
mkdir -p /home/syoung/RELEASE/0.6
git archive --output /home/syoung/RELEASE/0.6/agua.0.6.tar HEAD



2. UPDATE agua WITH VERSION NUMBER

#### FIRST COMMIT: REGISTER WITH GITHUB
git init
git remote add agua git@github.com:stuartpyoung/agua.git

#### COMMIT RELEASE 0.6
cd /home/syoung/RELEASE/0.6
git add .
git tag 0.6
git commit -m 'Agua alpha version 0.6'

#### PUSH TO GIT HUB (AS syoung)
cd /home/syoung/RELEASE/0.6
git push -u agua master


NOTES
-----

CREATE A ZIP archive
git archive --format zip --output /full/path master 

HELP:
git help archive


</entry>


<entry [Mon 2011:04:04 12:27:13 EST] SET UP aguadev PRIVATE REPOSITORY>

git@github.com:syoung/aguadev.git

RENAMED agua TO aguadev ON GITHUB
    
Thank you for visiting the Github site of Agua, the NextGen bioinformatics workflow tool and genomic viewer. You'll find source code and development information here. To download the source code, click the 'Downloads' button on the right or download using git with the 'Git Read-Only' URL below. For information on how to install or use Agua, please click the following link:

http://www.aguadev.org

WIKI
Welcome to the Github repository of Agua, where you can find the source code, current progress-to-date and issue tracking.
For more information on how to use Agua and develop with it, please visit http://www.aguadev.org


1. CONFIGURE GIT
cd /home/syoung/0.6
git config --global user.name "Stuart Young"
git config --global user.email stuartpyoung@gmail.com

#### INITIALISE aguadev REPOSITORY 
cd /home/syoung/0.6
git init


2. ADD IGNORE .gitignore FILES
http://stackoverflow.com/questions/277077/why-is-git-telling-me-your-branch-is-ahead-of-origin-master-by-11-commits-an


build
-----
emacs /home/syoung/0.6/html/builds/.gitignore
# IGNORE THESE FILES AND DIRS
005
species
users
*.zip
# EXCEPT THE LATEST BUILD ZIP FILE (13 MB)
!006.zip
#### **** NB: TESTS ARE INCLUDED IN aguadev (170MB) BUT EXCLUDED FROM agua 
#### **** NB: TESTS ARE INCLUDED IN aguadev (170MB) BUT EXCLUDED FROM agua 
#### **** NB: TESTS ARE INCLUDED IN aguadev (170MB) BUT EXCLUDED FROM agua 

#### COMMIT
cd /home/syoung/0.6/html/builds
git add .gitignore
git commit -m "Added .gitignore for builds dir"


plugins
-------
emacs /home/syoung/0.6/html/plugins/.gitignore
# IGNORE FILES AND DIRS
species
users
DATA


#### COMMIT
cd /home/syoung/0.6/html/plugins
git add .gitignore
git commit -m "Added .gitignore for plugins dir"


apps
----

#### IGNORE t FOLDER IN bin/apps
emacs /home/syoung/0.6/bin/apps/.gitignore
t

cd /home/syoung/0.6/bin/apps
git add .gitignore
git commit -m "Added .gitignore for apps dir"
git push




3. COMMIT CHANGES TO LOCAL REPO

#### PREPARE TO COMMIT TO LOCAL REPO
cd /home/syoung/0.6
git add . 
git tag 0.6
    OK
    
#### COMMIT TO LOCAL REPO
git commit -m "First re-commit of agua 0.6 source tree"
# OR
git commit -m "Updated this and that"

#### FIRST TIME: ADD GITHUB REMOTE
git remote rm origin 
git remote add origin git@github.com:syoung/aguadev.git

#### PUSH TO GITHUB (FORCE WITH -f FOR FIRST PUSH)
git push -f

    Counting objects: 34106, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (32834/32834), done.
    Writing objects: 100% (34106/34106), 378.62 MiB | 501 KiB/s, done.
    Total 34106 (delta 3995), reused 0 (delta 0)
    To git@github.com:syoung/aguadev.git
     + b08429a...0322e88 master -> master (forced update)



#### REMOVE A REMOTE OR RENAME origin WITH 'git remote rm', E.G.:
git remote rm origin
git remote add origin git@spilth.unfuddle.com:spilth/geekfor.git


NOTES
-----

USEFUL INFO ON PUSHING AND MANAGING REMOTES
http://stackoverflow.com/questions/277077/why-is-git-telling-me-your-branch-is-ahead-of-origin-master-by-11-commits-an


ERROR: Account `stuartpyoung' is disabled. Please contact support@github.com or ask the owner to check their account.
fatal: The remote end hung up unexpectedly



</entry>


<entry [Mon 2011:04:04 12:23:19 EST] SET UP notes REPOSITORY>
    
git@github.com:stuartpyoung/notes.git

git config --global user.name "Stuart Young"
git config --global user.email stuartpyoung@gmail.com

cd /home/syoung/notes
git init
git add . 
git commit -m 'first commit of notes'
git remote add notes git@github.com:syoung/notes.git

(AS syoung)
cd /home/syoung/notes
git push -u notes master

    Counting objects: 278, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (265/265), done.
    Writing objects: 100% (278/278), 7.17 MiB | 469 KiB/s, done.
    Total 278 (delta 41), reused 0 (delta 0)
    To git@github.com:syoung/notes.git
     * [new branch]      master -> master
    error: could not lock config file .git/config: Permission denied


VERIFY MANUALLY USING A GIT GUI THAT ALL THE FILES ARE PRESENT
    OK

DOWNLOAD FILES FROM GITHUB AND VERIFY
    OK
    

SECOND COMMIT 
cd /home/syoung/notes
git add .
git commit -a -m 'Second commit including convert-pending (converted to xsl but file name unchanged) and convert-complete (copy of completed files to keep track of progess)'
git push -u notes master

git commit --amend --author='Stuart Young <stuartpyoung@gmail.com>'

EDIT LAST COMMIT MESSAGE (EDIT FILE: .git/COMMIT_EDITMSG)
git commit --amend

CONFIRM EDITS HAVE BEEN SAVED
git log

CHECK STATUS OF WORKING TREE
git status
    # Your branch is ahead of 'notes/master' by 1 commit.

    http://stackoverflow.com/questions/277077/why-is-git-telling-me-your-branch-is-ahead-of-origin-master-by-11-commits-an
    When you run git status, it checks if the remote is missing commits (compared to your local repository), and if so, by how many commits. If you push all your changes to "origin", both will be in sync, so you wont get that message

VIEW COMMIT HISTORY
git log


PUSH UPDATES TO REMOTE
git push -u notes master

    Counting objects: 338, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (332/332), done.
    Writing objects: 100% (333/333), 4.95 MiB | 1.08 MiB/s, done.
    Total 333 (delta 34), reused 0 (delta 0)
    To git@github.com:syoung/notes.git
       58cab61..355c8ed  master -> master
    Branch master set up to track remote branch master from notes.


CHECK WHAT YOU JUST DID
git log

CHECK WHAT YOU DID RECENTLY
git log --since='3 days ago'

CHECK HISTORY BY VERSION AND FILES, E.G.:
git log v2.43.. curses/




UNSTAGE/UNCOMMIT
cd /home/syoung/notes
git reset --soft HEAD^1 .


EDIT MULTIPLE COMMIT MESSAGES
CHANGE ANY OF THE LAST 3 COMMIT MESSAGE:
git rebase -i HEAD~3

**** Warning: every commit you see in this list will be re-written, whether you change the message or not.
**** Do not include any commits you have already pushed to a central server - it will mess other people up.
*

</entry>

<entry [Mon 2011:04:04 04:17:17 EST] CONSOLIDATED GITHUB ACCOUNT syoung, CREATED PRIVATE aguadev AND PUBLIC agua>

USER: syoung
PASS: R*asdjasdf
PRIVATE KEY: aguadev AND stuartpyoung
ACCOUNT: private $12/month, 1.3 GB

PRIVATE ACCOUNTS:

notes
aguadev
aguadev:opscode


PUBLIC ACCOUNTS:

agua


</entry>

<entry [Mon 2011:04:04 02:38:30 EST] SET MULTIPLE PRIVATE KEYS IN SSH CONFIG FILE>

1. SPECIFY POSSIBLE FILE PATHS BASED ON HOST IN .ssh/config FILE

~/.ssh$ cat config
# SSH config file

IdentityFile ~/.ssh/idents/%h/%u/id_rsa
IdentityFile ~/.ssh/idents/%h/%u/id_dsa

#### GITHUB
IdentityFile ~/.ssh/idents/%h/id_rsa
IdentityFile ~/.ssh/idents/%h/id_dsa
IdentityFile ~/.ssh/id_rsa

#### GENERAL AQUARIUS PRIVATE KEY
IdentityFile ~/.ssh/id_dsa


2. PUT KEY FILES IN SPECIFIED PATHS

syoung@hp:~/.ssh$ ll idents
total 12K
drwxr-xr-x 3 syoung syoung 4.0K 2011-04-04 03:56 .
drwx------ 3 syoung syoung 4.0K 2011-04-04 11:15 ..
drwxr-xr-x 2 syoung syoung 4.0K 2011-04-04 03:58 github.com
syoung@hp:~/.ssh$ ll idents/github.com
total 12K
drwxr-xr-x 2 syoung syoung 4.0K 2011-04-04 03:58 .
drwxr-xr-x 3 syoung syoung 4.0K 2011-04-04 03:56 ..
-rw------- 1 syoung syoung 1.7K 2011-04-04 03:58 id_rsa


Using multiple private keys with SSH
http://www.cyberspice.org.uk/blog/2010/07/23/using-multiple-public-keys-with-ssh/

ssh uses ~/.ssh/identity as the default filename for the private key when using version 1 of the ssh protocol and it uses ~/.ssh/id_rsa and ~/.ssh/id_dsa as the default filenames for the RSA and DSA private keys when using version 2 of the ssh protocol. 

The ssh config files:

    /etc/ssh/config
    ~/.ssh/config

emacs ~/.ssh/config
    # SSH config file                                                                           IdentityFile ~/.ssh/idents/%h/%u/id_rsa
    IdentityFile ~/.ssh/idents/%h/%u/id_dsa
    
    #### GITHUB                                                                                 IdentityFile ~/.ssh/idents/%h/id_rsa
    IdentityFile ~/.ssh/idents/%h/id_dsa
    IdentityFile ~/.ssh/id_rsa
    
    #### GENERAL AQUARIUS PRIVATE KEY                                                           IdentityFile ~/.ssh/id_dsa



THEN CREATE DIRECTORY AND id_rsa FILE FOR EACH PRIVATE KEY:

mkdir ~/.ssh/idents/github.com/id_rsa

So I have set up my config file as below. It basically tries ~/.ssh/idents/hostname/use~/.ssh/idents/github.comrname/id_* first, then ~/.ssh/idents/hostname/id_*, then the defaults before giving up.

The file name may use the tilde syntax to refer to a user's home directory or one of the following escape characters:

    %d	local user's home directory
    %u	local user name
    %l	local host name
    %h	remote host name
    %r	remote user name

JUST DROP IN A NEW HOSTNAME AND KEY COMBINATION WHEN NEEDED

This allows me to support a new server/key file combination just by putting the key file in the appropriate place in the ~/.ssh without having to edit config files.

COPY aguadev FILE TO id_rsa:

cd .ssh
mkdir -p .ssh/idents/github.com
emacs .ssh/idents/github.com/id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAw1/yJsz5X/t+qRFYr6x4n92Yq2xjsqb/RdSupRRKROuIwWJ2
fmyYvvRSYAtbGyZsxpXhrptknADwoqsfqhghD39vZHsSJqiKvP9ErGwTfit3YVng
GXZuIbPFinQPSYKL3spAbLx1ssu5H1FbW0dhWa77+6LSkn22LDWlVfcn2XThNO1b
+IIu5aiBLtHB1JsKd/XxdwzGgfHrWOD7huepoOM+xJQedBdvaXbvWE9GYwMhL+iD
60Iu0ZFCJ3kfcM86pdgIhRzdMgV+iFTMCMFQ79RZOOJhd5UliOJKXUd4felxLk96
GXTB/gKktdXnVLPrEjwBSbeKpxg2kjxuyGlpJwIBIwKCAQBqD4N0JiD5lyeAWd+v
0qfhwXAii0wQhoqTn1d+L5YIKBcJ5P5/JQJ2Sh4W4ZfbieNHO2vicZ0EOwZJrVpV
BcjN5hfmFuyYpKMWJCyYHWmq5GVgu8LL/nZMz036tAhMehFqUIlfmYG41P4YULyQ
oxeXFdk/daWCuUWi+Iz0JxWh7grcAod3qTMWMlsj1Cx6JYq+TqKjd/BG2/dYO0Gz
fMTZkVDDiFv3sXk9uUOSZ4pjk69KS81JDpLVJTsejfN9tS8fvNEH9MOJWK/GDSQ0
ZJs2p+V5BGVpB78QZEZfZTA5PwqELinGFaG5hHHP95K2cFfhNLDCQLVDlQ2saB7M
B5JbAoGBAOnU2qcn0TLVA3K7KuY/JyMpRg5lRlBomKYOef7RsmL6sp+BZC2m198G
hyiGxxtLwH6m+JzBRHyV3io2YWIxq9EMVSrJb5loX6WLFKL1e6R0cdk7F3HbiXgf
6LY/scJETE7yhuHnNmb5KETufUdtB3wdU24Znu3o+/rc8nMSKd4ZAoGBANXlvTSI
eU0dppx1BRBjmolpYmahR9ZuZcEGL7mS/pipnjLoeB73f2A0moA9GkccdfPXp6Lm
x+ce2ky4zuHDXGOiamomSLMq9QD8NW0ejFiq6dlHSZMd7+8iW88dA7u1Nnqmm/pn
CQivHErBgxhhtRBxAMbXvFxPFyKFK93tj+k/AoGBAOMmi0NLQEACIJtWu/Wcbyl4
jTKORE4cdwe2Sp/EZCWjE+tnwGbclzBsvc+Y3qzNPqbrV+i7vt9tA7P6T/j9DU67
he8M0s+J9oOOa9GAwUCrocu1vwDj5KCUBqJpwp91i/TrmPi0uIFJz1jnrOZMqC9s
8fXtAMnbA2i5YI0KVI6bAoGAdB2hOcZtvCYJ/SmVCOWdCMQuGnTPOeQom/wLR3uu
x+cMvIzTfoZbFvf8GbrFH0n243UR3BbhjBgQGwU9G3iufzrpT5EgJr+MUP3xHfqj
9Z6cNB9idG9WXT6JnFGUT/Soi7mH37RGu5JCjvtVy2g9uHfb2ahQT14igHQtwZ44
LikCgYEA1XNhSy2dGjx2AtS78AFvKBBoiuK7dSENJgor+OAg+GfhktA1oFF0foFJ
RHcoqtESTdt7mAXyaApBahPmUyaSZS2Vv5r+xZ4c2fAdCrsQtAYi8ycHtEHrr4rL
XPUxhGfnWiKBpjPowlKmg5+jBUXiYaJLDi+tbQDrGXNCA6HUsFc=
-----END RSA PRIVATE KEY-----











NB: aguadev.pub

ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAw1/yJsz5X/t+qRFYr6x4n92Yq2xjsqb/RdSupRRKROuIwWJ2fmyYvvRSY
AtbGyZsxpXhrptknADwoqsfqhghD39vZHsSJqiKvP9ErGwTfit3YVngGXZuIbPFinQPSYKL3spAbLx1ssu5H1FbW0dhWa77+6LSkn22LDWlVfcn2XThNO1b+IIu5aiBLtHB1JsKd/XxdwzGgfHrWOD7huepoOM+xJQedBdvaXbvWE9GYwMhL+iD60Iu0ZFCJ3kfcM86pdgIhRzdMgV+iFTMCMFQ79RZOOJhd5UliOJKXUd4felxLk96GXTB/gKktdXnVLPrEjwBSbeKpxg2kjxuyGlpJw==

stuartpyoung@gmail.com


NB: PREVIOUSLY ADDED TO github:

https://github.com/account#keys


CHECK KEY IS PROPERLY REGISTERED AT GITHUB:


ssh git@github.com

    OK
    Hi syoung! You've successfully authenticated, but GitHub does not provide shell access.
    Connection to github.com closed.


    
</entry>
<entry [Wed 2011:03:30 10:33:44 EST] RECREATED agua REPOSITORY ON REINSTALLED UBUNTU>
    
SAME AS [Mon 2011:03:07 22:07:38 EST] STARTED Agua 0.6 REPOSITORY ON UBUNTU


</entry>

<entry [Mon 2011:03:07 22:07:38 EST] STARTED Agua 0.6 REPOSITORY ON UBUNTU>
    
cd /home/syoung/0.6
git init

emacs /home/syoung/0.6/html/builds/.gitignore
# IGNORE THESE DIRECTORIES 
005

# IGNORE THESE FILES
*.zip

# EXCEPT THE LATEST BUILD
!006.zip

git config --global user.name "Stuart Young"
git config --global user.email stuarptyoung@gmail.com

cd /home/syoung/0.6/html/builds
git add .gitignore
git commit -m "Added .gitignore for builds dir"

cd /home/syoung/0.6
git add . 
git tag 0.6
git commit -m "First commit of agua 0.6 source tree"

    OK
    
</entry>


<entry [Tue Feb 22 14:22:49 EST 2011] STARTED agua 0.5 REPOSITORY ON UBUNTU>

git config --global user.name "Stuart Young"
git config --global user.email stuartpyoung@gmail.com
cd /home/syoung/0.5
git init


CREATE IGNORE FILES:

emacs /home/syoung/0.5/html/builds/.gitignore

# IGNORE THESE DIRECTORIES 
005

# IGNORE THESE FILES
*.zip

# EXCEPT THE LATEST BUILD
!006.zip


cd /home/syoung/0.5/html/builds
git add .gitignore
git commit -m "Added .gitignore for builds dir"

git add . 
git tag 0.5
git commit -m "First commit of agua 0.5 source tree"

    ...
    create mode 100644 starcluster/plugins/clustersetup.py
    create mode 100644 starcluster/plugins/ipcluster.py
    create mode 100644 starcluster/plugins/mysqlcluster.py
    create mode 100644 starcluster/plugins/packages.py


</entry>


<entry [Tue Feb 22 14:20:21 EST 2011] GIT COMMANDS>


Everyday GIT With 20 Commands Or So

[Individual Developer (Standalone)] commands are essential for anybody who makes a commit, even for somebody who works alone.

If you work with other people, you will need commands listed in the [Individual Developer (Participant)] section as well.

People who play the [Integrator] role need to learn some more commands in addition to the above.

[Repository Administration] commands are for system administrators who are responsible for the care and feeding of git repositories.

Individual Developer (Standalone)

A standalone individual developer does not exchange patches with other people, and works alone in a single repository, using the following commands.

git-init(1) to create a new repository.

git-show-branch(1) to see where you are.

git-log(1) to see what happened.

git-checkout(1) and git-branch(1) to switch branches.

git-add(1) to manage the index file.

git-diff(1) and git-status(1) to see what you are in the middle of doing.

git-commit(1) to advance the current branch.

ggit-reset(1) and git-checkout(1) (with pathname parameters) to undo changes.

git-merge(1) to merge between local branches.

git-rebase(1) to maintain topic branches.

git-tag(1) to mark known point.

Examples
Use a tarball as a starting point for a new repository.
$ tar zxf frotz.tar.gz
$ cd frotz
$ git init
$ git add . < 1 >
$ git commit -m "import of frotz source tree."
$ git tag v2.43 < 2 >
add everything under the current directory.

make a lightweight, unannotated tag.

Create a topic branch and develop.
$ git checkout -b alsa-audio < 1 >
$ edit/compile/test
$ git checkout -- curses/ux_audio_oss.c < 2 >
$ git add curses/ux_audio_alsa.c < 3 >
$ edit/compile/test
$ git diff HEAD < 4 >
$ git commit -a -s < 5 >
$ edit/compile/test
$ git reset --soft HEAD^ < 6 >
$ edit/compile/test
$ git diff ORIG_HEAD < 7 >
$ git commit -a -c ORIG_HEAD < 8 >
$ git checkout master < 9 >
$ git merge alsa-audio < 10 >
$ git log --since='3 days ago' < 11 >
$ git log v2.43.. curses/ < 12 >
create a new topic branch.

revert your botched changes in curses/ux_audio_oss.c.

you need to tell git if you added a new file; removal and modification will be caught if you do git commit -a later.

to see what changes you are committing.

commit everything as you have tested, with your sign-off.

take the last commit back, keeping what is in the working tree.

look at the changes since the premature commit we took back.

redo the commit undone in the previous step, using the message you originally wrote.

switch to the master branch.

merge a topic branch into your master branch.

review commit logs; other forms to limit output can be combined and include --max-count=10 (show 10 commits), --until=2005-12-10, etc.

view only the changes that touch what’s in curses/ directory, since v2.43 tag.

Individual Developer (Participant)

A developer working as a participant in a group project needs to learn how to communicate with others, and uses these commands in addition to the ones needed by a standalone developer.

git-clone(1) from the upstream to prime your local repository.

git-pull(1) and git-fetch(1) from "origin" to keep up-to-date with the upstream.

git-push(1) to shared repository, if you adopt CVS style shared repository workflow.

git-format-patch(1) to prepare e-mail submission, if you adopt Linux kernel-style public forum workflow.

Examples
Clone the upstream and work on it. Feed changes to upstream.
$ git clone git://git.kernel.org/pub/scm/.../torvalds/linux-2.6 my2.6
$ cd my2.6
$ edit/compile/test; git commit -a -s < 1 >
$ git format-patch origin < 2 >
$ git pull < 3 >
$ git log -p ORIG_HEAD.. arch/i386 include/asm-i386 < 4 >
$ git pull git://git.kernel.org/pub/.../jgarzik/libata-dev.git ALL < 5 >
$ git reset --hard ORIG_HEAD < 6 >
$ git gc < 7 >
$ git fetch --tags < 8 >
repeat as needed.

extract patches from your branch for e-mail submission.

git pull fetches from origin by default and merges into the current branch.

immediately after pulling, look at the changes done upstream since last time we checked, only in the area we are interested in.

fetch from a specific branch from a specific repository and merge.

revert the pull.

garbage collect leftover objects from reverted pull.

from time to time, obtain official tags from the origin and store them under .git/refs/tags/.

Push into another repository.
satellite$ git clone mothership:frotz frotz < 1 >
satellite$ cd frotz
satellite$ git config --get-regexp '^(remote|branch)\.' < 2 >
remote.origin.url mothership:frotz
remote.origin.fetch refs/heads/*:refs/remotes/origin/*
branch.master.remote origin
branch.master.merge refs/heads/master
satellite$ git config remote.origin.push \
           master:refs/remotes/satellite/master < 3 >
satellite$ edit/compile/test/commit
satellite$ git push origin < 4 >

mothership$ cd frotz
mothership$ git checkout master
mothership$ git merge satellite/master < 5 >
mothership machine has a frotz repository under your home directory; clone from it to start a repository on the satellite machine.

clone sets these configuration variables by default. It arranges git pull to fetch and store the branches of mothership machine to local remotes/origin/* remote-tracking branches.

arrange git push to push local master branch to remotes/satellite/master branch of the mothership machine.

push will stash our work away on remotes/satellite/master remote-tracking branch on the mothership machine. You could use this as a back-up method.

on mothership machine, merge the work done on the satellite machine into the master branch.

Branch off of a specific tag.
$ git checkout -b private2.6.14 v2.6.14 < 1 >
$ edit/compile/test; git commit -a
$ git checkout master
$ git format-patch -k -m --stdout v2.6.14..private2.6.14 |
  git am -3 -k < 2 >
create a private branch based on a well known (but somewhat behind) tag.

forward port all changes in private2.6.14 branch to master branch without a formal "merging".

Integrator

A fairly central person acting as the integrator in a group project receives changes made by others, reviews and integrates them and publishes the result for others to use, using these commands in addition to the ones needed by participants.

git-am(1) to apply patches e-mailed in from your contributors.

git-pull(1) to merge from your trusted lieutenants.

git-format-patch(1) to prepare and send suggested alternative to contributors.

git-revert(1) to undo botched commits.

git-push(1) to publish the bleeding edge.

Examples
My typical GIT day.
$ git status < 1 >
$ git show-branch < 2 >
$ mailx < 3 >
& s 2 3 4 5 ./+to-apply
& s 7 8 ./+hold-linus
& q
$ git checkout -b topic/one master
$ git am -3 -i -s -u ./+to-apply < 4 >
$ compile/test
$ git checkout -b hold/linus && git am -3 -i -s -u ./+hold-linus < 5 >
$ git checkout topic/one && git rebase master < 6 >
$ git checkout pu && git reset --hard next < 7 >
$ git merge topic/one topic/two && git merge hold/linus < 8 >
$ git checkout maint
$ git cherry-pick master~4 < 9 >
$ compile/test
$ git tag -s -m "GIT 0.99.9x" v0.99.9x < 10 >
$ git fetch ko && git show-branch master maint 'tags/ko-*' < 11 >
$ git push ko < 12 >
$ git push ko v0.99.9x < 13 >
see what I was in the middle of doing, if any.

see what topic branches I have and think about how ready they are.

read mails, save ones that are applicable, and save others that are not quite ready.

apply them, interactively, with my sign-offs.

create topic branch as needed and apply, again with my sign-offs.

rebase internal topic branch that has not been merged to the master, nor exposed as a part of a stable branch.

restart pu every time from the next.

and bundle topic branches still cooking.

backport a critical fix.

create a signed tag.

make sure I did not accidentally rewind master beyond what I already pushed out. ko shorthand points at the repository I have at kernel.org, and looks like this:

$ cat .git/remotes/ko
URL: kernel.org:/pub/scm/git/git.git
Pull: master:refs/tags/ko-master
Pull: next:refs/tags/ko-next
Pull: maint:refs/tags/ko-maint
Push: master
Push: next
Push: +pu
Push: maint
In the output from git show-branch, master should have everything ko-master has, and next should have everything ko-next has.

push out the bleeding edge.

push the tag out, too.

Repository Administration

A repository administrator uses the following tools to set up and maintain access to the repository by developers.

git-daemon(1) to allow anonymous download from repository.

git-shell(1) can be used as a restricted login shell for shared central repository users.

update hook howto has a good example of managing a shared central repository.

Examples
We assume the following in /etc/services
$ grep 9418 /etc/services
git             9418/tcp                # Git Version Control System
Run git-daemon to serve /pub/scm from inetd.
$ grep git /etc/inetd.conf
git     stream  tcp     nowait  nobody \
  /usr/bin/git-daemon git-daemon --inetd --export-all /pub/scm
The actual configuration line should be on one line.

Run git-daemon to serve /pub/scm from xinetd.
$ cat /etc/xinetd.d/git-daemon
# default: off
# description: The git server offers access to git repositories
service git
{
        disable = no
        type            = UNLISTED
        port            = 9418
        socket_type     = stream
        wait            = no
        user            = nobody
        server          = /usr/bin/git-daemon
        server_args     = --inetd --export-all --base-path=/pub/scm
        log_on_failure  += USERID
}
Check your xinetd(8) documentation and setup, this is from a Fedora system. Others might be different.

Give push/pull only access to developers.
$ grep git /etc/passwd < 1 >
alice:x:1000:1000::/home/alice:/usr/bin/git-shell
bob:x:1001:1001::/home/bob:/usr/bin/git-shell
cindy:x:1002:1002::/home/cindy:/usr/bin/git-shell
david:x:1003:1003::/home/david:/usr/bin/git-shell
$ grep git /etc/shells < 2 >
/usr/bin/git-shell
log-in shell is set to /usr/bin/git-shell, which does not allow anything but git push and git pull. The users should get an ssh access to the machine.

in many distributions /etc/shells needs to list what is used as the login shell.

CVS-style shared repository.
$ grep git /etc/group < 1 >
git:x:9418:alice,bob,cindy,david
$ cd /home/devo.git
$ ls -l < 2 >
  lrwxrwxrwx   1 david git    17 Dec  4 22:40 HEAD - > refs/heads/master
  drwxrwsr-x   2 david git  4096 Dec  4 22:40 branches
  -rw-rw-r--   1 david git    84 Dec  4 22:40 config
  -rw-rw-r--   1 david git    58 Dec  4 22:40 description
  drwxrwsr-x   2 david git  4096 Dec  4 22:40 hooks
  -rw-rw-r--   1 david git 37504 Dec  4 22:40 index
  drwxrwsr-x   2 david git  4096 Dec  4 22:40 info
  drwxrwsr-x   4 david git  4096 Dec  4 22:40 objects
  drwxrwsr-x   4 david git  4096 Nov  7 14:58 refs
  drwxrwsr-x   2 david git  4096 Dec  4 22:40 remotes
$ ls -l hooks/update < 3 >
  -r-xr-xr-x   1 david git  3536 Dec  4 22:40 update
$ cat info/allowed-users < 4 >
refs/heads/master       alice\|cindy
refs/heads/doc-update   bob
refs/tags/v[0-9]*       david
place the developers into the same git group.

and make the shared repository writable by the group.

use update-hook example by Carl from Documentation/howto/ for branch policy control.

alice and cindy can push into master, only bob can push into doc-update. david is the release manager and is the only person who can create and push version tags.

HTTP server to support dumb protocol transfer.
dev$ git update-server-info < 1 >
dev$ ftp user@isp.example.com < 2 >
ftp > cp -r .git /home/user/myproject.git
make sure your info/refs and objects/info/packs are up-to-date

upload to public HTTP server hosted by your ISP.





</entry>

<entry [Fri Dec 24 16:24:40 EST 2010] CREATED aguadev KEYPAIR FOR GITHUB syoung ACCOUNT (agua)>

E:/22-agua/cloud/AWS/keypair/syoung/aguadev
E:/22-agua/cloud/AWS/keypair/syoung/aguadev.pub


mkdir -p /e/22-agua/cloud/AWS/keypair/syoung/rsa
cd /e/22-agua/cloud/AWS/keypair/syoung/rsa
ssh-keygen -t rsa -C "stuartpyoung@gmail.com"

    Generating public/private rsa key pair.
    Enter file in which to save the key (/c/Documents and Settings/syoung/.ssh/id_rs
    a): /e/22-agua/cloud/AWS/keypair/syoung/aguadev
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /e/22-agua/cloud/AWS/keypair/syoung/aguadev.
    Your public key has been saved in /e/22-agua/cloud/AWS/keypair/syoung/aguadev.pub.
    The key fingerprint is:
    e7:cf:32:59:5c:71:d0:d8:4b:c4:43:03:24:3e:5a:55 stuartpyoung@gmail.com


aguadev

-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAw1/yJsz5X/t+qRFYr6x4n92Yq2xjsqb/RdSupRRKROuIwWJ2
fmyYvvRSYAtbGyZsxpXhrptknADwoqsfqhghD39vZHsSJqiKvP9ErGwTfit3YVng
GXZuIbPFinQPSYKL3spAbLx1ssu5H1FbW0dhWa77+6LSkn22LDWlVfcn2XThNO1b
+IIu5aiBLtHB1JsKd/XxdwzGgfHrWOD7huepoOM+xJQedBdvaXbvWE9GYwMhL+iD
60Iu0ZFCJ3kfcM86pdgIhRzdMgV+iFTMCMFQ79RZOOJhd5UliOJKXUd4felxLk96
GXTB/gKktdXnVLPrEjwBSbeKpxg2kjxuyGlpJwIBIwKCAQBqD4N0JiD5lyeAWd+v
0qfhwXAii0wQhoqTn1d+L5YIKBcJ5P5/JQJ2Sh4W4ZfbieNHO2vicZ0EOwZJrVpV
BcjN5hfmFuyYpKMWJCyYHWmq5GVgu8LL/nZMz036tAhMehFqUIlfmYG41P4YULyQ
oxeXFdk/daWCuUWi+Iz0JxWh7grcAod3qTMWMlsj1Cx6JYq+TqKjd/BG2/dYO0Gz
fMTZkVDDiFv3sXk9uUOSZ4pjk69KS81JDpLVJTsejfN9tS8fvNEH9MOJWK/GDSQ0
ZJs2p+V5BGVpB78QZEZfZTA5PwqELinGFaG5hHHP95K2cFfhNLDCQLVDlQ2saB7M
B5JbAoGBAOnU2qcn0TLVA3K7KuY/JyMpRg5lRlBomKYOef7RsmL6sp+BZC2m198G
hyiGxxtLwH6m+JzBRHyV3io2YWIxq9EMVSrJb5loX6WLFKL1e6R0cdk7F3HbiXgf
6LY/scJETE7yhuHnNmb5KETufUdtB3wdU24Znu3o+/rc8nMSKd4ZAoGBANXlvTSI
eU0dppx1BRBjmolpYmahR9ZuZcEGL7mS/pipnjLoeB73f2A0moA9GkccdfPXp6Lm
x+ce2ky4zuHDXGOiamomSLMq9QD8NW0ejFiq6dlHSZMd7+8iW88dA7u1Nnqmm/pn
CQivHErBgxhhtRBxAMbXvFxPFyKFK93tj+k/AoGBAOMmi0NLQEACIJtWu/Wcbyl4
jTKORE4cdwe2Sp/EZCWjE+tnwGbclzBsvc+Y3qzNPqbrV+i7vt9tA7P6T/j9DU67
he8M0s+J9oOOa9GAwUCrocu1vwDj5KCUBqJpwp91i/TrmPi0uIFJz1jnrOZMqC9s
8fXtAMnbA2i5YI0KVI6bAoGAdB2hOcZtvCYJ/SmVCOWdCMQuGnTPOeQom/wLR3uu
x+cMvIzTfoZbFvf8GbrFH0n243UR3BbhjBgQGwU9G3iufzrpT5EgJr+MUP3xHfqj
9Z6cNB9idG9WXT6JnFGUT/Soi7mH37RGu5JCjvtVy2g9uHfb2ahQT14igHQtwZ44
LikCgYEA1XNhSy2dGjx2AtS78AFvKBBoiuK7dSENJgor+OAg+GfhktA1oFF0foFJ
RHcoqtESTdt7mAXyaApBahPmUyaSZS2Vv5r+xZ4c2fAdCrsQtAYi8ycHtEHrr4rL
XPUxhGfnWiKBpjPowlKmg5+jBUXiYaJLDi+tbQDrGXNCA6HUsFc=
-----END RSA PRIVATE KEY-----

cd ..
aguadev.pub

ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAw1/yJsz5X/t+qRFYr6x4n92Yq2xjsqb/RdSupRRKROuIwWJ2fmyYvvRSYAtbGyZsxpXhrptknADwoqsfqhghD39vZHsSJqiKvP9ErGwTfit3YVngGXZuIbPFinQPSYKL3spAbLx1ssu5H1FbW0dhWa77+6LSkn22LDWlVfcn2XThNO1b+IIu5aiBLtHB1JsKd/XxdwzGgfHrWOD7huepoOM+xJQedBdvaXbvWE9GYwMhL+iD60Iu0ZFCJ3kfcM86pdgIhRzdMgV+iFTMCMFQ79RZOOJhd5UliOJKXUd4felxLk96GXTB/gKktdXnVLPrEjwBSbeKpxg2kjxuyGlpJw== stuartpyoung@gmail.com


ADDED TO github:

https://github.com/account#keys


CHECK KEY IS PROPERLY REGISTERED AT GITHUB:

cd E:\0.5
ssh -i /e/22-agua/cloud/AWS/keypair/syoung/aguadev git@github.com

    OK

    Hi syoung! You've successfully authenticated, but GitHub does not provide shell
    access.
    Connection to github.com closed.


COPIED TO .ssh DIRECTORY AND RENAMED:

aguadev TO C:/Documents and Settings/syoung/.ssh/id_rsa
aguadev.pub TO C:/Documents and Settings/syoung/.ssh/id_rsa.pub



PUSH agua TO GITHUB:

cd E:\0.5
git push --force github master

    Counting objects: 7561, done.
    Delta compression using up to 2 threads.
    Compressing objects: 100% (7180/7180), done.
    Writing objects: 100% (7561/7561), 44.37 MiB | 1.15 MiB/s, done.
    Total 7561 (delta 2380), reused 0 (delta 0)
    To git@github.com:syoung/agua.git
     + 8cd01f3...b08429a master -> master (forced update)




NOTES
-----


PROBLEM: PUSH agua TO GITHUB FAILS

cd E:\0.5
git push github master

    To git@github.com:syoung/agua.git
    ! [rejected]        master -> master (non-fast-forward)
   error: failed to push some refs to 'git@github.com:syoung/agua.git'
   To prevent you from losing history, non-fast-forward updates were rejected
   Merge the remote changes (e.g. 'git pull') before pushing again.  See the
   'Note about fast-forwards' section of 'git push --help' for details.


SOLUTION:

USE git push --force





</entry>

<entry [Thu Dec 23 13:36:03 EST 2010] CREATED FREE aquarius ACCOUNT ON GITHUB>

ACCOUNT INFO:

https://github.com/stuartpyoung/aquarius

ACCOUNT: stuartpyoung
EMAIL   : stuartpyoung@gmail.com
PASS    : *s*


DOWNLOADS:

SSH
git@github.com:stuartpyoung/aquarius.git

HTTP
https://stuartpyoung@github.com/stuartpyoung/aquarius.git

GIT READ-ONLY
git://github.com/stuartpyoung/aquarius.git


SETUP CHECKLIST:

Global setup:
 Download and install Git
  git config --global user.name stuartpyoung
  git config --global user.email stuartpyoung@gmail.com
  Add your public key
        
Next steps:
  mkdir aquarius
  cd aquarius
  git init
  touch README
  git add README
  git commit -m 'first commit'
  git remote add origin git@github.com:stuartpyoung/aquarius.git
  git push origin master
      
Existing Git Repo?
  cd existing_git_repo
  git remote add origin git@github.com:stuartpyoung/aquarius.git
  git push origin master
      
Importing a Subversion Repo?
  Click here
      
When you're done:
  Continue



CREATED aquarius KEYPAIR USING GITBASH ON WINDOWS
-------------------------------------------------
http://help.github.com/msysgit-key-setup/

mkdir -p /e/22-agua/cloud/AWS/keypair/syoung/rsa
cd /e/22-agua/cloud/AWS/keypair/syoung/rsa
ssh-keygen -t rsa -C "stuartpyoung@gmail.com"

    Generating public/private rsa key pair.
    Enter file in which to save the key (/c/Documents and Settings/syoung/.ssh/id_rs
    a): /e/22-agua/cloud/AWS/keypair/syoung/rsa
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /e/22-agua/cloud/AWS/keypair/syoung/rsa/id_r
    sa.
    Your public key has been saved in /e/22-agua/cloud/AWS/keypair/syoung/rsa/id_rsa.p
    ub.
    The key fingerprint is:
    9b:e5:43:e2:38:18:59:f1:44:ca:4c:59:12:21:30:07 stuartpyoung@gmail.com


id_rsa

-----BEGIN RSA PRIVATE KEY-----
MIIEoAIBAAKCAQEAs9kcarYnUNXOLNWnHpnIndM3P7uYbfMMD1VEGk0LSEfVzd9+
sFf4f582wN+C9IPwzkBS7RJuQQ5gXoszrKbkhLv883OTNA+YTTxu7GTzVBd8cn+X
bLgMiPMZ0Vjzo1et9PZlPo9NKD5m80FQw2Y/ni2AZsEmqw3APoYnjqgebecf+ig9
+TaxqYnt8aNQUlr2qFtA0mgArzW3XrkwE51RPTqaXWz7UE5Z/v9cm1WNmeWf5YfG
Vlh3PxDpVuH+tmZgYlQwoVT1ouS9HQH70QtfeBBVFgVtK+r/PUKYwk1kzEx3+Ea+
QQY4q63dx7PT5TfF/H5fp29ZwDlGOlZrXh/gOQIBIwKCAQBSN11ynGm+jaAUfu1P
0UXEfdAdIo7TLUdXd2+W/qYSaftWzJGvsy/FUBkHtqJD5ItW+NVzsKduMnUyiMcq
Wuwfa+FZWWfdSPUqn0imlIx+Np9KSPTD/F2AbyG+yZPy5kDlAux0XsQvp3+FJSw8
EXwrDXyGvrKXVr5Id9eRq/CnRFGCVze/rdUygxwLvXDtX6B7JQwevSn0M9gYf0kg
8gSMzIinoIUewAlkO8lj7eodxAu4lEtvdSFEO9vhket1XPBLsE1jvPlHPUNnhQ9+
fxuXKhQ9aZyjlT/MN17HUR9ZiOWRoEyLmSg0hXPb3vQ1Mff88Rk6atxyAh3TFMU3
KWdLAoGBAOGGt41/PwArqjgMJ+f7piOdx8hNbnf2PPQM4t1CyArgaVGnbbfyVMoa
ZvHYub7MONKFp3lM+NAZMrUSL9eSpZCCSKDgIpqJ2FsYkNdLfAlXzpkRd2cCEOl8
4RWCVoRAims7GMxNNuMaSSMS7qVSU//3VTUCru4i8tUfwWhdmHRvAoGBAMwmUeaG
q28fYOiLzQFPc6P9Mm4Bu7zyx1qcP+LYw9xo0d3HUCAqtXtZVaI4A16sj/O8G+gF
j25gm0NHQvQTBYI6eeZ3BPnNNl6R/hKg2UnFla++Nv+EA5oxqGPr9Wv35paOn0qC
cE2egM1DzXhehneL2cN09qlj4c/c15OX3NnXAoGAE1SwpbpzHUWSP1F/w21XYiN3
hjKFz8SmI4wTcg0J1QvrxSubsK5fCgJDVo7rWX84Egt0wUEcpB9qvxAv/IjpnqwU
2pbeZQSAQlKQEnQvNAA2R6JpUfjc4NAwjNCoVHqPhYi4+5GW/YXpAwGfbUGSK+H/
/Tq+iXC1un8Qk+rD7LkCgYBo/cO4YoQNQ1Zo93C+2Gdbpsl6Z0qbsA7A4qSDSuhi
uZCAr6WM4sO7x4sgOhBck0K33RWqhoRHZOIima1nlMEBJWNDUychYjk38093S2hv
FShpAr0y82+RINpCBFJUyKJ5UKmxSmWkQuMnvHhMiGJpXd20+lL4B3tyNw/IP3jl
DwKBgEnpiX9k0Zk7IWk+W6/BcDhv1gSc+wbhHwwjmfxGvlx/OJ4uXDiLzpB4BdHy
ZbWJShW0Lx+wSrVKcB0/q/plHEm/5NAgnqFZoI03iYoCUQcSpmLn8bXWwQRo679T
INg9ruoH7wAtWVLXqWb5k0SNvsWt5SWOD7GeqVs/ntRJII7m
-----END RSA PRIVATE KEY-----


id_rsa.pub

ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAs9kcarYnUNXOLNWnHpnIndM3P7uYbfMMD1VEGk0LSEfVzd9+sFf4f582wN+C9IPwzkBS7RJuQQ5gXoszrKbkhLv883OTNA+YTTxu7GTzVBd8cn+XbLgMiPMZ0Vjzo1et9PZlPo9NKD5m80FQw2Y/ni2AZsEmqw3APoYnjqgebecf+ig9+TaxqYnt8aNQUlr2qFtA0mgArzW3XrkwE51RPTqaXWz7UE5Z/v9cm1WNmeWf5YfGVlh3PxDpVuH+tmZgYlQwoVT1ouS9HQH70QtfeBBVFgVtK+r/PUKYwk1kzEx3+Ea+QQY4q63dx7PT5TfF/H5fp29ZwDlGOlZrXh/gOQ== stuartpyoung@gmail.com


ADD TO github:

https://github.com/account#keys


CHECK CONNECT:

ssh -i /e/22-agua/cloud/AWS/keypair/syoung/rsa/id_rsa git@github.com

    Hi stuartpyoung! You've successfully authenticated, but GitHub does not provide
    shell access.
    Connection to github.com closed.

  
  



</entry>

<entry [Sat Aug 28 00:28:45 EDT 2010] GITHUB CUSTOM DOMAINS AND jekyll BLOG AWARE FUNCTION>


http://pages.github.com/

Custom Domains
GitHub Pages allows you to direct a domain name of your choice at your Page.

Let’s say you own the domain name example.com. Furthermore, your GitHub username is “charlie” and you have published a User Page at http://charlie.github.com/. Now you’d like to load up http://example.com/ in your browser and have it show the content from http://charlie.github.com/.

Start by creating a file named CNAME in the root of your repository. It should contain your domain name like so:

example.com
Push this new file up to GitHub. The server will set your pages to be hosted at example.com, and create redirects from www.example.com and charlie.github.com to example.com.

Next, you’ll need to visit your domain registrar or DNS host and add a record for your domain name. For a sub-domain like www.example.com you would simply create a CNAME record pointing at charlie.github.com. If you are using a top-level domain like example.com, you must use an A record pointing to 207.97.227.245. Do not use a CNAME record with a top-level domain, it can have adverse side effects on other services like email. Many DNS services will let you set a CNAME on a TLD, even though you shouldn’t. Remember that it may take up to a full day for DNS changes to propagate, so be patient.

Real World Example: github.com/mojombo/mojombo.github.com → http://tom.preston-werner.com/.



Using Jekyll For Complex Layouts
In addition to supporting regular HTML content, GitHub Pages support Jekyll, a simple, blog aware static site generator written by our own Tom Preston-Werner. Jekyll makes it easy to create site-wide headers and footers without having to copy them across every page. It also offers intelligent blog support and other advanced templating features.

Every GitHub Page is run through Jekyll when you push content to your repo. Because a normal HTML site is also a valid Jekyll site, you don’t have to do anything special to keep your standard HTML files unchanged. Jekyll has a thorough README that covers its features and usage.

As of April 7, 2009, you can configure most Jekyll settings via your _config.yml file. Most notably, you can select your permalink style and choose to have your Markdown rendered with RDiscount instead of the default Maruku. The only options we override are as follows:

safe: true
source: < your pages repo>
destination: < the build dir>
lsi: false
pygments: true
If your Jekyll site is not transforming properly after you push it to GitHub, it’s useful to run the converter locally so you can see any parsing errors. In order to do this, you’ll want to use the same version that we use.

We currently use Jekyll 0.7.0 and run it with the equivalent command:

jekyll --pygments --safe
As of December 27, 2009, you can completely opt-out of Jekyll processing by creating a file named .nojekyll in the root of your pages repo and pushing that to GitHub. This should only be necessary if your site uses directories that begin with an underscore, as Jekyll sees these as special dirs and does not copy them to the final destination.

If there’s a feature you wish that Jekyll had, feel free to fork it and send a pull request. We’re happy to accept user contributions.

Real World Example: github.com/pages/pages.github.com → http://pages.github.com/.




</entry>

<entry [Sat Aug 28 00:28:45 EDT 2010] RESET linode REMOTE IP FOR agua REPOSITORY>

NEW IP: 173.230.142.248

RESET GIT FOR LINODE


1. REMOVE OLD IP

git remote rm linode 


2. ADD NEW IP

git remote add linode ssh://root@173.230.142.248/srv/git/agua


3. PUSH LOCAL master TO REMOTE

cd E:\0.5
git push linode master

    OK!


</entry>
<entry [Wed Jun 16 15:36:18 EDT 2010] MOVING A GITHUB REPO>


MOVING
------

Moving a repo
This guide details the process of moving a repo to another account. There are two ways to do this: manually cloning and pushing to a new repo, or forking the repo and changing the network’s root.


Forking and Rooting

The simplest route to transfer ownership is to make a fork and change the root. To do this:

Add the new owner as a collab if the repo is private
Fork the repo on the new owner’s account
Contact support from the email of the current owner’s account and request the new owner’s fork be made the root.
Note that if the repo is private the new owner will need a paid plan to support the repo. Issues, wikis, pages, commits comments and non-repo downloads will not be transferred to the new root. Make sure you do not delete your old repo if you have any of these you wish to keep.

Manual clone and push

This method is a bit more involved, but will create an exact mirror of the repo into the new repo. Forks, collaborators and non-repo data will not be transferred to the new repo, it will be a fresh mirror.

First, create a new repo on the target account. Next, create a mirror that includes all branches and tags. To do this you need to do a bare-clone followed by a mirror-push:

git clone --bare git@github.com:myaccount/my-old-repo.git
cd my-old-repo
git push --mirror git@github.com:mycompany/our-new-repo.git
cd ..
rm -rf my-old-repo


FORKING
-------

Forking a project
This guide will step you through the process of forking, pushing your changes, and pulling in changes from the upstream repo.

In this guide, we will use github-services as an example to fork, submit a change, and re-sync with the forked repo. All the examples on this page assume you’re working in the “master” branch.

Note that this works for pulling from a forked repository to the original, as well.

Setting up

Naturally, the first thing you must do is create your fork. To do this, you simply click the “fork” button on the project’s page. When the fork has completed, you will be presented with your new repo information.



Now you need to clone the fork. Make sure you use the Private URL and not the Public one.

$ git clone git@github.com:billyanyteen/github-services.git
Once the clone is complete your repo will have a remote named “origin” that points to your fork on github. Don’t let the name confuse you, this does not point to the original repo you forked from. To help you keep track of that repo we will add another remote named “upstream”

$ cd github-services
$ git remote add upstream git://github.com/pjhyett/github-services.git
$ git fetch upstream
Note that we used the public clone URL for upstream, so we can’t push changes directly to it. We probably don’t have permission to do that anyway, which is why we’re creating a fork in the first place. If the upstream repo is private, you must use its private URL.

Pushing your changes

Now that we’ve got our fork, we need to make a few changes and commit them locally. Once you’ve done this, it’s time to push your updated branch.

$ git push origin master
After you’ve pushed your commit(s) you need to inform the project owner of the changes so they can pull them into their repo. From your project’s page, click the “pull request” button. Fill in a note and pick who to send the request to. In large projects it is important that you do not send the request to every person who’s touched the project. Make sure you’re only sending to the people who care, the user(s) that manage the core project repo.

Note that some projects do not accept pull requests. Make sure you submit your request to the place they want it, or you will probably just be ignored.

Pulling in upstream changes

Some time has passed, the upstream repo has changed and you want to update your fork before you submit a new patch. There are two ways to do this:

$ git fetch upstream
$ git merge upstream/master
$ git pull upstream master
git pull is a more direct way, but the merge it performs can be confusing if the user doesn’t expect it and a merge conflict results. git fetch will also grab all branches, where git pull will only grab the one specified.

If you have local commits that are not in the upstream branch, a normal merge will occur. If your local commits are in the upstream branch, a fast-forward merge will be done, moving your local branch to the same commit as upstream/master. If both repos have edits to the same location in the same file, you may run into a merge conflict. Conflicts must be resolved by hand and a commit made to complete the merge.

Now that your local branch has been updated, you can commit, push, and send a pull request.

You may wish to do the fetch and merge manually, instead of letting git-pull do it for you. This can sometimes help avoid headaches caused by mysterious merge conflicts.

Deleting the forked repository

To remove the fork, just delete it like any repo: click the “Admin” button next to “Unwatch”, then at the bottom of the page there will be a “Delete This Repository…” link.



</entry>

<entry [Mon June  1 13:59:42 EDT 2010] CAN'T PUSH: failed to push ... non-fast-forward updates were rejected>


E:\>cd 0.5

E:\0.5>git push linode master

	root@74.207.235.81's password:
	To ssh://root@74.207.235.81/srv/git/agua
	 ! [rejected]        master -> master (non-fast-forward)
	error: failed to push some refs to 'ssh://root@74.207.235.81/srv/git/agua'
	To prevent you from losing history, non-fast-forward updates were rejected
	Merge the remote changes before pushing again.  See the 'Note about
	fast-forwards' section of 'git push --help' for details.
	
E:\0.5>git push github master

	Enter passphrase for key '/c/Documents and Settings/syoung/.ssh/id_rsa':
	To git@github.com:syoung/agua.git
	 ! [rejected]        master -> master (non-fast-forward)
	error: failed to push some refs to 'git@github.com:syoung/agua.git'
	To prevent you from losing history, non-fast-forward updates were rejected
	Merge the remote changes before pushing again.  See the 'Note about
	fast-forwards' section of 'git push --help' for details.


SOLUTION:

USE push --force

	OK!
	

E:\0.5>git push --force linode master

  root@74.207.235.81's password:
  Counting objects: 43, done.
  Delta compression using up to 2 threads.
  Compressing objects: 100% (24/24), done.
  Writing objects: 100% (25/25), 17.86 KiB, done.
  Total 25 (delta 18), reused 0 (delta 0)
  refs/heads/master: 5bf175d7b8ba571d490492ffa1239bbcff223e8f -> 004b65b8bfa832578
  7294abe7b81d2e6d8166c6d
  To ssh://root@74.207.235.81/srv/git/agua
   + 5bf175d...004b65b master -> master (forced update)





git-push(1) Manual Page
NAME

git-push - Update remote refs along with associated objects
SYNOPSIS
git push [--all | --mirror | --tags] [-n | --dry-run] [--receive-pack=< git-receive-pack>] [--repo=< repository>] [-f | --force] [-v | --verbose] [-u | --set-upstream] [< repository> < refspec>…]
DESCRIPTION

Updates remote refs using local refs, while sending objects necessary to complete the given refs.

You can make interesting things happen to a repository every time you push into it, by setting up hooks there. See documentation for git-receive-pack(1).
OPTIONS

< repository>

    The "remote" repository that is destination of a push operation. This parameter can be either a URL (see the section GIT URLS below) or the name of a remote (see the section REMOTES below).
< refspec>…

    The format of a < refspec> parameter is an optional plus +, followed by the source ref < src>, followed by a colon :, followed by the destination ref < dst>. It is used to specify with what < src> object the < dst> ref in the remote repository is to be updated.

    The < src> is often the name of the branch you would want to push, but it can be any arbitrary "SHA-1 expression", such as master~4 or HEAD (see git-rev-parse(1)).

    The < dst> tells which ref on the remote side is updated with this push. Arbitrary expressions cannot be used here, an actual ref must be named. If :< dst> is omitted, the same ref as < src> will be updated.

    The object referenced by < src> is used to update the < dst> reference on the remote side, but by default this is only allowed if the update can fast-forward < dst>. By having the optional leading +, you can tell git to update the < dst> ref even when the update is not a fast-forward. This does not attempt to merge < src> into < dst>. See EXAMPLES below for details.

    tag < tag> means the same as refs/tags/< tag>:refs/tags/< tag>.

    Pushing an empty < src> allows you to delete the < dst> ref from the remote repository.

    The special refspec : (or +: to allow non-fast-forward updates) directs git to push "matching" branches: for every branch that exists on the local side, the remote side is updated if a branch of the same name already exists on the remote side. This is the default operation mode if no explicit refspec is found (that is neither on the command line nor in any Push line of the corresponding remotes file---see below).
--all

    Instead of naming each ref to push, specifies that all refs under refs/heads/ be pushed.
--mirror

    Instead of naming each ref to push, specifies that all refs under refs/ (which includes but is not limited to refs/heads/, refs/remotes/, and refs/tags/) be mirrored to the remote repository. Newly created local refs will be pushed to the remote end, locally updated refs will be force updated on the remote end, and deleted refs will be removed from the remote end. This is the default if the configuration option remote.< remote>.mirror is set.
-n
--dry-run

    Do everything except actually send the updates.
--porcelain

    Produce machine-readable output. The output status line for each ref will be tab-separated and sent to stdout instead of stderr. The full symbolic names of the refs will be given.
--delete

    All listed refs are deleted from the remote repository. This is the same as prefixing all refs with a colon.
--tags

    All refs under refs/tags are pushed, in addition to refspecs explicitly listed on the command line.
--receive-pack=< git-receive-pack>
--exec=< git-receive-pack>

    Path to the git-receive-pack program on the remote end. Sometimes useful when pushing to a remote repository over ssh, and you do not have the program in a directory on the default $PATH.
-f
--force

    Usually, the command refuses to update a remote ref that is not an ancestor of the local ref used to overwrite it. This flag disables the check. This can cause the remote repository to lose commits; use it with care.
--repo=< repository>

    This option is only relevant if no < repository> argument is passed in the invocation. In this case, git push derives the remote name from the current branch: If it tracks a remote branch, then that remote repository is pushed to. Otherwise, the name "origin" is used. For this latter case, this option can be used to override the name "origin". In other words, the difference between these two commands

    git push public         #1
    git push --repo=public  #2

    is that #1 always pushes to "public" whereas #2 pushes to "public" only if the current branch does not track a remote branch. This is useful if you write an alias or script around git push.
-u
--set-upstream

    For every branch that is up to date or successfully pushed, add upstream (tracking) reference, used by argument-less git-pull(1) and other commands. For more information, see branch.< name>.merge in git-config(1).
--thin
--no-thin

    These options are passed to git-send-pack(1). A thin transfer significantly reduces the amount of sent data when the sender and receiver share many of the same objects in common. The default is --thin.
-v
--verbose

    Run verbosely.
-q
--quiet

    Suppress all output, including the listing of updated refs, unless an error occurs.

GIT URLS

One of the following notations can be used to name the remote repository:

    *

      rsync://host.xz/path/to/repo.git/
    *

      http://host.xz[:port]/path/to/repo.git/
    *

      https://host.xz[:port]/path/to/repo.git/
    *

      git://host.xz[:port]/path/to/repo.git/
    *

      git://host.xz[:port]/~user/path/to/repo.git/
    *

      ssh://[user@]host.xz[:port]/path/to/repo.git/
    *

      ssh://[user@]host.xz/path/to/repo.git/
    *

      ssh://[user@]host.xz/~user/path/to/repo.git/
    *

      ssh://[user@]host.xz/~/path/to/repo.git

SSH is the default transport protocol over the network. You can optionally specify which user to log-in as, and an alternate, scp-like syntax is also supported. Both syntaxes support username expansion, as does the native git protocol, but only the former supports port specification. The following three are identical to the last three above, respectively:

    *

      [user@]host.xz:/path/to/repo.git/
    *

      [user@]host.xz:~user/path/to/repo.git/
    *

      [user@]host.xz:path/to/repo.git

To sync with a local directory, you can use:

    *

      /path/to/repo.git/
    *

      file:///path/to/repo.git/

They are mostly equivalent, except when cloning. See git-clone(1) for details.

If there are a large number of similarly-named remote repositories and you want to use a different format for them (such that the URLs you use will be rewritten into URLs that work), you can create a configuration section of the form:

        [url "< actual url base>"]
                insteadOf = < other url base>

For example, with this:

        [url "git://git.host.xz/"]
                insteadOf = host.xz:/path/to/
                insteadOf = work:

a URL like "work:repo.git" or like "host.xz:/path/to/repo.git" will be rewritten in any context that takes a URL to be "git://git.host.xz/repo.git".

If you want to rewrite URLs for push only, you can create a configuration section of the form:

        [url "< actual url base>"]
                pushInsteadOf = < other url base>

For example, with this:

        [url "ssh://example.org/"]
                pushInsteadOf = git://example.org/

a URL like "git://example.org/path/to/repo.git" will be rewritten to "ssh://example.org/path/to/repo.git" for pushes, but pulls will still use the original URL.
REMOTES

The name of one of the following can be used instead of a URL as < repository> argument:

    *

      a remote in the git configuration file: $GIT_DIR/config,
    *

      a file in the $GIT_DIR/remotes directory, or
    *

      a file in the $GIT_DIR/branches directory.

All of these also allow you to omit the refspec from the command line because they each contain a refspec which git will use by default.
Named remote in configuration file

You can choose to provide the name of a remote which you had previously configured using git-remote(1), git-config(1) or even by a manual edit to the $GIT_DIR/config file. The URL of this remote will be used to access the repository. The refspec of this remote will be used by default when you do not provide a refspec on the command line. The entry in the config file would appear like this:

        [remote "< name>"]
                url = < url>
                pushurl = < pushurl>
                push = < refspec>
                fetch = < refspec>

The < pushurl> is used for pushes only. It is optional and defaults to < url>.
Named file in $GIT_DIR/remotes

You can choose to provide the name of a file in $GIT_DIR/remotes. The URL in this file will be used to access the repository. The refspec in this file will be used as default when you do not provide a refspec on the command line. This file should have the following format:

        URL: one of the above URL format
        Push: < refspec>
        Pull: < refspec>

Push: lines are used by git push and Pull: lines are used by git pull and git fetch. Multiple Push: and Pull: lines may be specified for additional branch mappings.
Named file in $GIT_DIR/branches

You can choose to provide the name of a file in $GIT_DIR/branches. The URL in this file will be used to access the repository. This file should have the following format:

        < url>#< head>

< url> is required; #< head> is optional.

Depending on the operation, git will use one of the following refspecs, if you don't provide one on the command line. < branch> is the name of this file in $GIT_DIR/branches and < head> defaults to master.

git fetch uses:

        refs/heads/< head>:refs/heads/< branch>

git push uses:

        HEAD:refs/heads/< head>

OUTPUT

The output of "git push" depends on the transport method used; this section describes the output when pushing over the git protocol (either locally or via ssh).

The status of the push is output in tabular form, with each line representing the status of a single ref. Each line is of the form:

 < flag> < summary> < from> -> < to> (< reason>)

If --porcelain is used, then each line of the output is of the form:

 < flag> \t < from>:< to> \t < summary> (< reason>)

The status of up-to-date refs is shown only if --porcelain or --verbose option is used.

flag

    A single character indicating the status of the ref:
    (space) 	for a successfully pushed fast-forward;
    + 	for a successful forced update;
    - 	for a successfully deleted ref;
    * 	for a successfully pushed new ref;
    ! 	for a ref that was rejected or failed to push; and
    = 	for a ref that was up to date and did not need pushing.
summary

    For a successfully pushed ref, the summary shows the old and new values of the ref in a form suitable for using as an argument to git log (this is < old>..< new> in most cases, and < old>…< new> for forced non-fast-forward updates). For a failed update, more details are given for the failure. The string rejected indicates that git did not try to send the ref at all (typically because it is not a fast-forward). The string remote rejected indicates that the remote end refused the update; this rejection is typically caused by a hook on the remote side. The string remote failure indicates that the remote end did not report the successful update of the ref (perhaps because of a temporary error on the remote side, a break in the network connection, or other transient error).
from

    The name of the local ref being pushed, minus its refs/< type>/ prefix. In the case of deletion, the name of the local ref is omitted.
to

    The name of the remote ref being updated, minus its refs/< type>/ prefix.
reason

    A human-readable explanation. In the case of successfully pushed refs, no explanation is needed. For a failed ref, the reason for failure is described.

Note about fast-forwards

When an update changes a branch (or more in general, a ref) that used to point at commit A to point at another commit B, it is called a fast-forward update if and only if B is a descendant of A.

In a fast-forward update from A to B, the set of commits that the original commit A built on top of is a subset of the commits the new commit B builds on top of. Hence, it does not lose any history.

In contrast, a non-fast-forward update will lose history. For example, suppose you and somebody else started at the same commit X, and you built a history leading to commit B while the other person built a history leading to commit A. The history looks like this:


      B
     /
 ---X---A

Further suppose that the other person already pushed changes leading to A back to the original repository you two obtained the original commit X.

The push done by the other person updated the branch that used to point at commit X to point at commit A. It is a fast-forward.

But if you try to push, you will attempt to update the branch (that now points at A) with commit B. This does _not_ fast-forward. If you did so, the changes introduced by commit A will be lost, because everybody will now start building on top of B.

The command by default does not allow an update that is not a fast-forward to prevent such loss of history.

If you do not want to lose your work (history from X to B) nor the work by the other person (history from X to A), you would need to first fetch the history from the repository, create a history that contains changes done by both parties, and push the result back.

You can perform "git pull", resolve potential conflicts, and "git push" the result. A "git pull" will create a merge commit C between commits A and B.


      B---C
     /   /
 ---X---A

Updating A with the resulting merge commit will fast-forward and your push will be accepted.

Alternatively, you can rebase your change between X and B on top of A, with "git pull --rebase", and push the result back. The rebase will create a new commit D that builds the change between X and B on top of A.


      B   D
     /   /
 ---X---A

Again, updating A with this commit will fast-forward and your push will be accepted.

There is another common situation where you may encounter non-fast-forward rejection when you try to push, and it is possible even when you are pushing into a repository nobody else pushes into. After you push commit A yourself (in the first picture in this section), replace it with "git commit --amend" to produce commit B, and you try to push it out, because forgot that you have pushed A out already. In such a case, and only if you are certain that nobody in the meantime fetched your earlier commit A (and started building on top of it), you can run "git push --force" to overwrite it. In other words, "git push --force" is a method reserved for a case where you do mean to lose history.
Examples

git push

    Works like git push < remote>, where < remote> is the current branch's remote (or origin, if no remote is configured for the current branch).
git push origin

    Without additional configuration, works like git push origin :.

    The default behavior of this command when no < refspec> is given can be configured by setting the push option of the remote.

    For example, to default to pushing only the current branch to origin use git config remote.origin.push HEAD. Any valid < refspec> (like the ones in the examples below) can be configured as the default for git push origin.
git push origin :

    Push "matching" branches to origin. See < refspec> in the OPTIONS section above for a description of "matching" branches.
git push origin master

    Find a ref that matches master in the source repository (most likely, it would find refs/heads/master), and update the same ref (e.g. refs/heads/master) in origin repository with it. If master did not exist remotely, it would be created.
git push origin HEAD

    A handy way to push the current branch to the same name on the remote.
git push origin master:satellite/master dev:satellite/dev

    Use the source ref that matches master (e.g. refs/heads/master) to update the ref that matches satellite/master (most probably refs/remotes/satellite/master) in the origin repository, then do the same for dev and satellite/dev.
git push origin HEAD:master

    Push the current branch to the remote ref matching master in the origin repository. This form is convenient to push the current branch without thinking about its local name.
git push origin master:refs/heads/experimental

    Create the branch experimental in the origin repository by copying the current master branch. This form is only needed to create a new branch or tag in the remote repository when the local name and the remote name are different; otherwise, the ref name on its own will work.
git push origin :experimental

    Find a ref that matches experimental in the origin repository (e.g. refs/heads/experimental), and delete it.
git push origin +dev:master

    Update the origin repository's master branch with the dev branch, allowing non-fast-forward updates. This can leave unreferenced commits dangling in the origin repository. Consider the following situation, where a fast-forward is not possible:

                o---o---o---A---B  origin/master
                         \
                          X---Y---Z  dev

    The above command would change the origin repository to

                          A---B  (unnamed branch)
                         /
                o---o---o---X---Y---Z  master

    Commits A and B would no longer belong to a branch with a symbolic name, and so would be unreachable. As such, these commits would be removed by a git gc command on the origin repository.

Author

Written by Junio C Hamano < gitster@pobox.com>, later rewritten in C by Linus Torvalds < torvalds@osdl.org>
Documentation

Documentation by Junio C Hamano and the git-list < git@vger.kernel.org>.
GIT

Part of the git(1) suite
Last updated 2010-02-19 09:57:45 UTC





++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

SET UP WEBDAV TO ENABLE GIT PUSH OVER HTTP


http://www.kernel.org/pub/software/scm/git/docs/howto/setup-git-server-over-http.txt


From: Rutger Nijlunsing < rutger@nospam.com>
Subject: Setting up a git repository which can be pushed into and pulled from over HTTP(S).
Date: Thu, 10 Aug 2006 22:00:26 +0200

Since Apache is one of those packages people like to compile
themselves while others prefer the bureaucrat's dream Debian, it is
impossible to give guidelines which will work for everyone. Just send
some feedback to the mailing list at git@vger.kernel.org to get this
document tailored to your favorite distro.


What's needed:

- Have an Apache web-server

  On Debian:
    $ apt-get install apache2
    To get apache2 by default started,
    edit /etc/default/apache2 and set NO_START=0

- can edit the configuration of it.

  This could be found under /etc/httpd, or refer to your Apache documentation.

  On Debian: this means being able to edit files under /etc/apache2

- can restart it.

  'apachectl --graceful' might do. If it doesn't, just stop and
  restart apache. Be warning that active connections to your server
  might be aborted by this.

  On Debian:
    $ /etc/init.d/apache2 restart
  or
    $ /etc/init.d/apache2 force-reload
    (which seems to do the same)
  This adds symlinks from the /etc/apache2/mods-enabled to
  /etc/apache2/mods-available.

- have permissions to chown a directory

- have git installed on the client, and

- either have git installed on the server or have a webdav client on
  the client.

In effect, this means you're going to be root, or that you're using a
preconfigured WebDAV server.


Step 1: setup a bare GIT repository
-----------------------------------

At the time of writing, git-http-push cannot remotely create a GIT
repository. So we have to do that at the server side with git. Another
option is to generate an empty bare repository at the client and copy
it to the server with a WebDAV client (which is the only option if Git
is not installed on the server).

Create the directory under the DocumentRoot of the directories served
by Apache. As an example we take /usr/local/apache2, but try "grep
DocumentRoot /where/ever/httpd.conf" to find your root:

    $ cd /usr/local/apache/htdocs
    $ mkdir my-new-repo.git

  On Debian:

    $ cd /var/www
    $ mkdir my-new-repo.git


Initialize a bare repository

    $ cd my-new-repo.git
    $ git --bare init


Change the ownership to your web-server's credentials. Use "grep ^User
httpd.conf" and "grep ^Group httpd.conf" to find out:

    $ chown -R www.www .

  On Debian:

    $ chown -R www-data.www-data .


If you do not know which user Apache runs as, you can alternatively do
a "chmod -R a+w .", inspect the files which are created later on, and
set the permissions appropriately.

Restart apache2, and check whether http://server/my-new-repo.git gives
a directory listing. If not, check whether apache started up
successfully.


Step 2: enable DAV on this repository
-------------------------------------

First make sure the dav_module is loaded. For this, insert in httpd.conf:

    LoadModule dav_module libexec/httpd/libdav.so
    AddModule mod_dav.c

Also make sure that this line exists which is the file used for
locking DAV operations:

  DAVLockDB "/usr/local/apache2/temp/DAV.lock"

  On Debian these steps can be performed with:

    Enable the dav and dav_fs modules of apache:
    $ a2enmod dav_fs
    (just to be sure. dav_fs might be unneeded, I don't know)
    $ a2enmod dav
    The DAV lock is located in /etc/apache2/mods-available/dav_fs.conf:
      DAVLockDB /var/lock/apache2/DAVLock

Of course, it can point somewhere else, but the string is actually just a
prefix in some Apache configurations, and therefore the _directory_ has to
be writable by the user Apache runs as.

Then, add something like this to your httpd.conf

<!--

  <Location /my-new-repo.git>
     DAV on
     AuthType Basic
     AuthName "Git"
     AuthUserFile /usr/local/apache2/conf/passwd.git
     Require valid-user
  </Location>

  On Debian:
    Create (or add to) /etc/apache2/conf.d/git.conf :

    <Location /my-new-repo.git>
       DAV on
       AuthType Basic
       AuthName "Git"
       AuthUserFile /etc/apache2/passwd.git
       Require valid-user
    </Location>

-->

    Debian automatically reads all files under /etc/apache2/conf.d.

The password file can be somewhere else, but it has to be readable by
Apache and preferably not readable by the world.

Create this file by
    $ htpasswd -c /usr/local/apache2/conf/passwd.git < user>

    On Debian:
      $ htpasswd -c /etc/apache2/passwd.git < user>

You will be asked a password, and the file is created. Subsequent calls
to htpasswd should omit the '-c' option, since you want to append to the
existing file.

You need to restart Apache.

Now go to http://< username>@< servername>/my-new-repo.git in your
browser to check whether it asks for a password and accepts the right
password.

On Debian:

   To test the WebDAV part, do:

   $ apt-get install litmus
   $ litmus http://< servername>/my-new-repo.git < username> < password>

   Most tests should pass.

A command line tool to test WebDAV is cadaver. If you prefer GUIs, for
example, konqueror can open WebDAV URLs as "webdav://..." or
"webdavs://...".

If you're into Windows, from XP onwards Internet Explorer supports
WebDAV. For this, do Internet Explorer -> Open Location ->
http://< servername>/my-new-repo.git [x] Open as webfolder -> login .


Step 3: setup the client
------------------------

Make sure that you have HTTP support, i.e. your git was built with
libcurl (version more recent than 7.10). The command 'git http-push' with
no argument should display a usage message.

Then, add the following to your $HOME/.netrc (you can do without, but will be
asked to input your password a _lot_ of times):

    machine < servername>
    login < username>
    password < password>

...and set permissions:
     chmod 600 ~/.netrc

If you want to access the web-server by its IP, you have to type that in,
instead of the server name.

To check whether all is OK, do:

   curl --netrc --location -v http://< username>@< servername>/my-new-repo.git/HEAD

...this should give something like 'ref: refs/heads/master', which is
the content of the file HEAD on the server.

Now, add the remote in your existing repository which contains the project
you want to export:

   $ git-config remote.upload.url \
       http://< username>@< servername>/my-new-repo.git/

It is important to put the last '/'; Without it, the server will send
a redirect which git-http-push does not (yet) understand, and git-http-push
will repeat the request infinitely.


Step 4: make the initial push
-----------------------------

From your client repository, do

   $ git push upload master

This pushes branch 'master' (which is assumed to be the branch you
want to export) to repository called 'upload', which we previously
defined with git-config.


Using a proxy:
--------------

If you have to access the WebDAV server from behind an HTTP(S) proxy,
set the variable 'all_proxy' to 'http://proxy-host.com:port', or
'http://login-on-proxy:passwd-on-proxy@proxy-host.com:port'. See 'man
curl' for details.


Troubleshooting:
----------------

If git-http-push says

   Error: no DAV locking support on remote repo http://...

then it means the web-server did not accept your authentication. Make sure
that the user name and password matches in httpd.conf, .netrc and the URL
you are uploading to.

If git-http-push shows you an error (22/502) when trying to MOVE a blob,
it means that your web-server somehow does not recognize its name in the
request; This can happen when you start Apache, but then disable the
network interface. A simple restart of Apache helps.

Errors like (22/502) are of format (curl error code/http error
code). So (22/404) means something like 'not found' at the server.

Reading /usr/local/apache2/logs/error_log is often helpful.

  On Debian: Read /var/log/apache2/error.log instead.

If you access HTTPS locations, git may fail verifying the SSL
certificate (this is return code 60). Setting http.sslVerify=false can
help diagnosing the problem, but removes security checks.


Debian References: http://www.debian-administration.org/articles/285

Authors
  Johannes Schindelin < Johannes.Schindelin@gmx.de>
  Rutger Nijlunsing < git@wingding.demon.nl>
  Matthieu Moy < Matthieu.Moy@imag.fr>

</entry>


<entry [Mon May 17 14:11:12 EDT 2010] SETUP GITHUB ACCOUNT>

username: syoung
pass: r*asicksn

Global setup:
-------------
 Download and install Git
  git config --global user.name "Stuart Young"
  git config --global user.email stuartpyoung@gmail.com

Add your public key:
--------------------
(You must have at least one SSH public key to push your git repo to GitHub)

http://ask-leo.com/how_do_i_create_and_use_public_keys_with_ssh.html

CREATED openSSH FORMAT PUBLIC KEY:

GENERAL INFO
http://github.com/guides/providing-your-ssh-key

FOLLOWED THIS GUIDE
http://help.github.com/msysgit-key-setup/

E:\0.5>ssh-keygen -t rsa -C "stuartpyoung@gmail.com"

    Generating public/private rsa key pair.
    Enter file in which to save the key (/c/Documents and Settings/syoung/.ssh/id_rs
    a): /e/id_rsa
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /e/id_rsa.
    Your public key has been saved in /e/id_rsa.pub.
    
    The key fingerprint is:
    31:41:10:ba:9c:50:9b:47:f3:3e:eb:ed:da:8d:40:3e stuartpyoung@gmail.com


COPIED TO E:/software/ssh/public-key AND PLACED IN DEFAULT LOCATION

C:/Documents and Settings/syoung/.ssh/id_rsa

id_rsa.pub CONTAINS PUBLIC KEY:

ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAlmY/AD+VOrmXk5vmUBcExIfYr/baJ9JTWobn0xPl+mNeSJeHuVye/4uWH8I35MMdwMtIIsP7W9xwPl2eIj+Sr+JMfU48Yx4Sz+dpwJw/vYTvbPy5nprirZ5NY0AF74ixtxzKiBCIYtNu1kaycZk4wMV5ytJ9pDbhzbROj0tqwlGVBVSwIO1eRZKOSuaOnhbuvtmfWo/48cgnkc9Y21pKUbyDK1EBScnp6tx1IgcpdnccCKSNXx4ascpfmcrBnsA2IVFqztDTi6mvChG5QlMxBbATLCFZ/Z+Bn1cXYVUGyMDxIPHy+JskCsZUco1Ir4SCF+EwcdiSlIhSSiOjuIW05w== stuartpyoung@gmail.com


NB: GITHUB'S RSA fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48



Next steps:
-----------

  mkdir agua
  cd agua
  git init
  touch README
  git add README
  git commit -m 'first commit'


cd E:\0.5
git remote add github git@github.com:syoung/agua.git
git push github master

OK!

    Enter passphrase for key '/c/Documents and Settings/syoung/.ssh/id_rsa':
    Counting objects: 2301, done.
    Delta compression using up to 2 threads.
    Compressing objects: 100% (2207/2207), done.
    Writing objects: 100% (2301/2301), 29.58 MiB | 1.39 MiB/s, done.
    Total 2301 (delta 559), reused 0 (delta 0)
    To git@github.com:syoung/agua.git
     * [new branch]      master -> master




SUMMARY - AGUA IS NOW AVAILABLE ON GITHUB:

PULL
git clone git@github.com:syoung/agua.git

PUSH
git push github master




Existing Git Repo?
------------------
  cd existing_git_repo
  git remote add origin git@github.com:syoung/agua.git
  git push origin master
      

Importing a Subversion Repo?
----------------------------
ONLY DOES REMOTE SUBVERSION REPOS, NOT LOCAL ONES








TROUBLESHOOTING
================

ERROR     Permission denied (publickey) ON ssh AND push
-------------------------------------------------------

E:\software\ssh\public-key>ssh -v git@github.com

    Permission denied (publickey).


DIAGNOSIS

OPENSSH IS LOOKING FOR id_rsa IN C:/Documents and Settings/syoung/.ssh

E:\software\ssh\public-key>ssh -v git@github.com

    OpenSSH_4.6p1, OpenSSL 0.9.8e 23 Feb 2007
    debug1: Connecting to github.com [207.97.227.239] port 22.
    debug1: Connection established.
    debug1: identity file /c/Documents and Settings/syoung/.ssh/identity type -1
    debug1: identity file /c/Documents and Settings/syoung/.ssh/id_rsa type -1
    debug1: identity file /c/Documents and Settings/syoung/.ssh/id_dsa type -1
    debug1: Remote protocol version 2.0, remote software version OpenSSH_5.1p1 Debia
    n-5github2
    debug1: match: OpenSSH_5.1p1 Debian-5github2 pat OpenSSH*
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_4.6
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: server->client aes128-cbc hmac-md5 none
    debug1: kex: client->server aes128-cbc hmac-md5 none
    debug1: SSH2_MSG_KEX_DH_GEX_REQUEST(1024< 1024< 8192) sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_GROUP
    debug1: SSH2_MSG_KEX_DH_GEX_INIT sent
    debug1: expecting SSH2_MSG_KEX_DH_GEX_REPLY
    debug1: Host 'github.com' is known and matches the RSA host key.
    debug1: Found key in /c/Documents and Settings/syoung/.ssh/known_hosts:3
    debug1: ssh_rsa_verify: signature correct
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: SSH2_MSG_SERVICE_REQUEST sent
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey
    debug1: Next authentication method: publickey
    debug1: Trying private key: /c/Documents and Settings/syoung/.ssh/identity
    debug1: Trying private key: /c/Documents and Settings/syoung/.ssh/id_rsa
    debug1: Trying private key: /c/Documents and Settings/syoung/.ssh/id_dsa
    debug1: No more authentication methods to try.
    Permission denied (publickey).

SOLUTION

COPY id_rsa AND id_rsa.pub TO C:/Documents and Settings/syoung/.ssh

E:\software\ssh\public-key>ssh git@github.com

    Enter passphrase for key '/c/Documents and Settings/syoung/.ssh/id_rsa':
    Enter passphrase for key '/c/Documents and Settings/syoung/.ssh/id_rsa':
    ERROR: Hi syoung! You've successfully authenticated, but GitHub does not provide
     shell access
    Connection to github.com closed.






</entry>

<entry [Sun May 16 22:40:31 EDT 2010] SETUP git ON LINODE>

1. INSTALL GIT ON linode
------------------------

yum erase subversion
yum install git
git --version

    git version 1.5.2.1


2. CREATE REMOTE GIT REPOSITORY ON linode
-----------------------------------------

ON linode:

mkdir /srv/git/agua
cd /srv/git/agua
git init
    Initialized empty Git repository in .git/
git add .
git commit -m "empty first commit"
    nothing to commit (use "git add file1 file2" to include for commit)



TEST:

mkdir /srv/git/test
cd /srv/git/test
git init
#    Initialized empty Git repository in .git/
git add .
git commit -m "empty first commit"


3. ENABLE PUSH AND PULL FROM WINDOWS
------------------------------------

1. ADD REMOTE REPO TO LOCAL config FILE

cd E:\0.5

git remote add linode ssh://root@74.207.235.81/srv/git/agua

WHICH CREATED A linode ENTRY IN E:\0.5\.git\config

    [core]
        repositoryformatversion = 0
        filemode = false
        bare = false
        logallrefupdates = true
        symlinks = false
        ignorecase = true
        hideDotFiles = dotGitOnly
    [remote "linode"]
        url = ssh://root@74.207.235.81/srv/git/agua
        fetch = +refs/heads/*:refs/remotes/agua/*

git remote add linode ssh://root@173.230.142.248/srv/git/agua



2. PUSH LOCAL master TO REMOTE

cd E:\0.5
git push linode master

    root@74.207.235.81's password:
    Counting objects: 2294, done.
    Delta compression using up to 2 threads.
    Compressing objects: 100% (2200/2200), done.
    Writing objects: 100% (2294/2294), 29.58 MiB | 2.03 MiB/s, done.
    Total 2294 (delta 555), reused 0 (delta 0)
    refs/heads/master: 0000000000000000000000000000000000000000 -> 57e331af454c2ce25557585fe77679079105f5d3
    To ssh://root@74.207.235.81/srv/git/agua
     * [new branch]      master -> master


WHICH CREATED THESE FILES ON linode (30 MB)

cd /srv/git/agua/.git/objects/pack
ll
    -r--r--r-- 1 root root  55K May 17 05:27 pack-7dd0be4d027ad263eed69290fc5f0b01d9a013db.idx
    -r--r--r-- 1 root root  30M May 17 05:27 pack-7dd0be4d027ad263eed69290fc5f0b01d9a013db.pack




3. PULL FROM linode

cd e:\0.5\tmp
git clone ssh://root@74.207.235.81/srv/git/agua

OK!


E:\tmp>git clone ssh://root@74.207.235.81/srv/git/agua

    Initialized empty Git repository in E:/tmp/agua/.git/
    root@74.207.235.81's password:
    remote: Generating pack...
    remote: Done counting 2299 objects.
    remote: Deltifying 2299 objects...
    remote:  100% (2299/2299) done
    remote: Total 2299 (delta 559), reused 2290 (delta 555)
    Receiving objects: 100% (2299/2299), 29.57 MiB | 795 KiB/s, done.
    Resolving deltas: 100% (559/559), done.
    Checking out files: 100% (2689/2689), done.





3. INSTALL gitPlugin
--------------------

DOWNLOADED

http://trac-hacks.org/changeset/latest/gitplugin?old_path=/&filename=gitplugin&format=zip

INSTALLED

cd /root/base/apps/git/gitplugin/gitplugin-r7956/gitplugin

ll 0.11-py2.4/

    drwxr-xr-x 4 root root 4.0K May 17 05:52 build
    -rw-r--r-- 1 root root  18K Sep 29  2006 COPYING
    -rw-r--r-- 1 root root   94 Sep 29  2006 README
    -rw-r--r-- 1 root root  762 Mar 23  2009 setup.py
    drwxr-xr-x 2 root root 4.0K May 17 05:52 temp
    drwxr-xr-x 3 root root 4.0K May 17 04:40 tracext
    drwxr-xr-x 2 root root 4.0K May 17 05:52 TracGit.egg-info

easy_install 0.11-py2.4/

    Processing 
    Running setup.py -q bdist_egg --dist-dir /root/base/apps/git/gitplugin/gitplugin-r7956/gitplugin/0.11-py2.4/egg-dist-tmp-ueRcbt
    warning: install_data: setup script did not provide a directory for 'COPYING' -- installing right in 'build/bdist.linux-x86_64/egg'
    warning: install_data: setup script did not provide a directory for 'README' -- installing right in 'build/bdist.linux-x86_64/egg'
    zip_safe flag not set; analyzing archive contents...
    Adding TracGit 0.11.0.2 to easy-install.pth file
    
    Installed /usr/lib/python2.4/site-packages/TracGit-0.11.0.2-py2.4.egg
    Processing dependencies for TracGit==0.11.0.2




4. CONFIGURE gitPlugin PLUGIN IN trac
-------------------------------------


1. BACKUP SUBVERSION AND GIT VERSIONS

cp /srv/trac/agua/conf/trac.ini /srv/trac/agua/conf/trac.ini-subversion
cp /srv/trac/agua/conf/trac.ini /srv/trac/agua/conf/trac.ini-git
emacs /srv/trac/agua/conf/trac.ini-git

    [trac]
    repository_dir = /srv/git/agua/.git
    repository_type = git

    
    [git]
    ## let Trac cache meta-data via CachedRepository wrapper; default: false
    cached_repository = true
    
    ## disable automatic garbage collection for in-memory commit-tree cache; default: false
    persistent_cache = true
    
    ## length revision sha-sums should be tried to be abbreviated to (must be >= 4 and <= 40); default: 7
    shortrev_len = 6
    
    ## executable file name (optionally with path) of git binary; default: 'git'
    git_bin = /usr/bin/git
    
    [components]
    # for plugin version 0.11.0.1+
    tracext.git.* = enabled 
    post-receive hook scripts



2. SET agua AS GIT VERSION

cp /srv/trac/agua/conf/trac.ini.git /srv/trac/agua/conf/trac.ini




3. PUT post-receive hook scripts INSIDE .git/hooks

cp /root/base/apps/git/gitplugin/trac-post-receive* /srv/git/agua/.git/hooks
ll /srv/git/agua/.git/hooks

    -rw-r--r-- 1 root root  441 May 17 04:57 applypatch-msg
    -rw-r--r-- 1 root root  781 May 17 04:57 commit-msg
    -rw-r--r-- 1 root root  152 May 17 04:57 post-commit
    -rw-r--r-- 1 root root  511 May 17 04:57 post-receive
    -rw-r--r-- 1 root root  207 May 17 04:57 post-update
    -rw-r--r-- 1 root root  388 May 17 04:57 pre-applypatch
    -rw-r--r-- 1 root root 1.7K May 17 04:57 pre-commit
    -rw-r--r-- 1 root root 4.2K May 17 04:57 pre-rebase
    -rw-r--r-- 1 root root 7.4K May 17 06:08 trac-post-receive-hook.2.py
    -rw-r--r-- 1 root root 7.6K May 17 06:08 trac-post-receive-hook.3.py
    -rw-r--r-- 1 root root 7.3K May 17 06:08 trac-post-receive-hook.py
    -rw-r--r-- 1 root root 2.0K May 17 04:57 update



5. UPGRADE TO ADD NEW PLUGIN TO TRAC SETTINGS 
---------------------------------------------

trac-admin /srv/trac/agua upgrade

    Database is up to date, no upgrade necessary.




6. RESTART APACHE
=================


/usr/sbin/apachectl -k restart


CHECK Admin->Plugins FOR TraFullBlogPlugin

OK!!



NOTES
=====

Simply point your Trac instance to a local git repository:

[trac]
repository_dir = /var/git/Test.git
repository_type = git

## the following is only for the 0.11 branch
[git]
## let Trac cache meta-data via CachedRepository wrapper; default: false
cached_repository = true

## disable automatic garbage collection for in-memory commit-tree cache; default: false
persistent_cache = true

## length revision sha-sums should be tried to be abbreviated to (must be >= 4 and <= 40); default: 7
shortrev_len = 6

## executable file name (optionally with path) of git binary; default: 'git'
git_bin = /usr/src/git-dev/git
/!\ NOTE: the Test.git above needs to be the .git repository directory (i.e. the one containing the file HEAD and config), not the working tree directory that holds the .git/ folder.

/!\ NOTE: If you are noticing a slow down in trac with a repository above 500 commits, try disabling the caching. It seems to bog things down as a repo grows.

If installed globally, don't forget to enable the plugin:

[components]
# for plugin version 0.10
gitplugin.* = enabled

# for plugin version 0.11.0.1+
tracext.git.* = enabled 
post-receive hook scripts

For Trac 0.11 see attachments below.







</entry>

<entry [Sun May 16 22:40:31 EDT 2010] CONVERT aqwa FROM SUBVERSION TO GIT ON NGSDEV>


DID NOT WORK ON WINDOWS BUT WORKS ON LINUX THOUGH ONLY OLD VERSION ON ngsdev...


http://pauldowman.com/2008/07/26/how-to-convert-from-subversion-to-git/

1. CREATE FILE authors.txt 

Create a text file that maps Subversion committers to Git authors so the names and email addresses will be correct in the history.

EXAMPLE
pdowman = Paul Dowman < paul@hellospambot.com>
svnuser2 = Another User < anotheruser@whatever.com>


GET CURRENT USERS
cat /srv/svn/agua.htpasswd

    syoung:$apr1$L5bCr...$NVAK2H8aY2Ig3NwwsqAQj0
    rloredo:$apr1$2KnG9/..$1hOGrs9xGpKIbcg8EnamK/
    lalachkar:$apr1$3lRCx...$Oa1p2IXywIIsgpc0R4Obe1
    krichards:$apr1$MMs0g/..$i0Zc8bBEm.F4RJYmUAufm1
    cvaldes:$apr1$0nTOp...$N1DqWO9A5i/5qfGMcB.dC/

CREATE authors.txt

mkdir /srv/git
emacs /srv/git/authors.txt

syoung = Stuart Young < stuartpyoung@gmail.com>


3. SET/RESET USER PASSWORD IN SUBVERSION

touch /srv/svn/agua.htpasswd
htpasswd -m /srv/svn/aqwa.htpasswd syoung
    New password: 
    Re-type new password: 
    Updating password for user syoung

4. CLONE THE SUBVERSION REPOSITORY INTO GIT
EXAMPLE
git svn clone < svn repo url> --no-metadata -A authors.txt -t tags -b branches -T trunk < destination dir name>

git svn clone http://ngsdev.ccs.miami.edu/svn/aqwa --no-metadata -A /srv/git/authors.txt -t tags -b branches -T trunk /srv/git/aqwa


OK!



Now running should show all your commit history with the correct authors.

git log 


5. CONVERT BRANCHES TO TAGS

. Convert branches to tags
There’s one more thing. All your tags are now remote branches, not tags, in your Git repo. So you’ll need to convert them manually (or write a script to do it if you have a lot, I’ll leave that as an exercise for the reader). For each Subversion tag (i.e. Git remote branch) you’ll add it as a Git tag, then delete the remote branch. List them with:

promp> git branch -r
Then for each tag listed do:

prompt> git tag tagname tags/tagname
prompt> git branch -r -d tags/tagname
You now have a local Git repository with all your history and tags. If you don’t need to share it with anyone else then you’re done.


6. PUSH TO PUBLIC REPO

5. Push to a public repo (optional)
If you want to publish to a public repository (for example Github), you’ll need to add it as a remote repo and then push to it.

prompt> git remote add origin git@github.com:userid/project.git
prompt> git push origin master --tags
You next stop should probably be the Git tutorial for Subversion users. Enjoy!




</entry>

<entry [Sun May 16 22:30:21 EDT 2010] REINSTALLED subversion AND INSTALL git ON ngsdev>


 yum erase subversion
Setting up Remove Process
Resolving Dependencies
--> Running transaction check
---> Package subversion.x86_64 0:1.5.5-0.1.el5.rf set to be erased
--> Processing Dependency: libsvn_delta-1.so.0()(64bit) for package: mod_dav_svn
--> Processing Dependency: libsvn_fs-1.so.0()(64bit) for package: mod_dav_svn
--> Processing Dependency: libsvn_repos-1.so.0()(64bit) for package: mod_dav_svn
--> Processing Dependency: libsvn_subr-1.so.0()(64bit) for package: mod_dav_svn
--> Processing Dependency: subversion = 1.5.5-0.1.el5.rf for package: mod_dav_svn
---> Package subversion.i386 0:1.4.2-2.el5 set to be erased
--> Running transaction check
---> Package mod_dav_svn.x86_64 0:1.5.5-0.1.el5.rf set to be erased
--> Finished Dependency Resolution

Dependencies Resolved

=============================================================================
 Package                 Arch       Version          Repository        Size 
=============================================================================
Removing:
 subversion              x86_64     1.5.5-0.1.el5.rf  installed          20 M
 subversion              i386       1.4.2-2.el5      installed         7.6 M
Removing for dependencies:
 mod_dav_svn             x86_64     1.5.5-0.1.el5.rf  installed         673 k

Transaction Summary
=============================================================================
Install      0 Package(s)         
Update       0 Package(s)         
Remove       3 Package(s)         

Is this ok [y/N]: y
Downloading Packages:
Running rpm_check_debug
Running Transaction Test
Finished Transaction Test
Transaction Test Succeeded
Running Transaction
  Erasing   : subversion                   ######################### [1/3] 
  Erasing   : subversion                   ######################### [2/3] 
  Erasing   : mod_dav_svn                  ######################### [3/3] 
warning: /etc/httpd/conf.d/subversion.conf saved as /etc/httpd/conf.d/subversion.conf.rpmsave

Removed: subversion.x86_64 0:1.5.5-0.1.el5.rf subversion.i386 0:1.4.2-2.el5
Dependency Removed: mod_dav_svn.x86_64 0:1.5.5-0.1.el5.rf
Complete!
[root@ngsdev yum.repos.d]# yum install git
Setting up Install Process
Parsing package install arguments
Resolving Dependencies
--> Running transaction check
---> Package git.x86_64 0:1.5.2.1-1.el5.rf set to be updated
--> Processing Dependency: rcs for package: git
--> Processing Dependency: perl(SVN::Core) for package: git
--> Processing Dependency: perl(Git) for package: git
--> Processing Dependency: perl(SVN::Delta) for package: git
--> Processing Dependency: perl(SVN::Ra) for package: git
--> Running transaction check
---> Package perl-Git.x86_64 0:1.5.2.1-1.el5.rf set to be updated
--> Processing Dependency: perl(Error) for package: perl-Git
---> Package subversion-perl.x86_64 0:1.6.11-0.1.el5.rf set to be updated
--> Processing Dependency: libsvn_delta-1.so.0()(64bit) for package: subversion-perl
--> Processing Dependency: libsvn_repos-1.so.0()(64bit) for package: subversion-perl
--> Processing Dependency: libsvn_diff-1.so.0()(64bit) for package: subversion-perl
--> Processing Dependency: libsvn_client-1.so.0()(64bit) for package: subversion-perl
--> Processing Dependency: libsvn_fs-1.so.0()(64bit) for package: subversion-perl
--> Processing Dependency: subversion = 1.6.11-0.1.el5.rf for package: subversion-perl
--> Processing Dependency: libsvn_subr-1.so.0()(64bit) for package: subversion-perl
--> Processing Dependency: libsvn_ra-1.so.0()(64bit) for package: subversion-perl
--> Processing Dependency: libsvn_wc-1.so.0()(64bit) for package: subversion-perl
---> Package rcs.x86_64 0:5.7-30.1 set to be updated
--> Running transaction check
---> Package subversion.x86_64 0:1.6.11-0.1.el5.rf set to be updated
---> Package perl-Error.noarch 0:0.17016-1.el5.rf set to be updated
--> Finished Dependency Resolution

Dependencies Resolved

=============================================================================
 Package                 Arch       Version          Repository        Size 
=============================================================================
Installing for dependencies:
 git                     x86_64     1.5.2.1-1.el5.rf  rpmforge           28 M
 perl-Error              noarch     0.17016-1.el5.rf  rpmforge           28 k
 perl-Git                x86_64     1.5.2.1-1.el5.rf  rpmforge           18 k
 rcs                     x86_64     5.7-30.1         base              349 k
 subversion              x86_64     1.6.11-0.1.el5.rf  rpmforge          6.8 M
 subversion-perl         x86_64     1.6.11-0.1.el5.rf  rpmforge          2.4 M

Transaction Summary
=============================================================================
Install      6 Package(s)         
Update       0 Package(s)         
Remove       0 Package(s)         

Total download size: 37 M
Is this ok [y/N]: y
Downloading Packages:
Running rpm_check_debug
Running Transaction Test
Finished Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing: rcs                          ######################### [1/6] 
  Installing: subversion                   ######################### [2/6] 
  Installing: subversion-perl              ######################### [3/6] 
  Installing: perl-Error                   ######################### [4/6] 
  Installing: git                          ######################### [5/6] 
  Installing: perl-Git                     ######################### [6/6] 

Dependency Installed: git.x86_64 0:1.5.2.1-1.el5.rf perl-Error.noarch 0:0.17016-1.el5.rf perl-Git.x86_64 0:1.5.2.1-1.el5.rf rcs.x86_64 0:5.7-30.1 subversion.x86_64 0:1.6.11-0.1.el5.rf subversion-perl.x86_64 0:1.6.11-0.1.el5.rf
Complete!



</entry>

<entry [Tue Apr 20 11:01:48 EDT 2010] DOWNLOAD jbrowse USING GIT>


git clone http://code.google.com/p/msysgit/downloads/list



</entry>

<entry [Tue Apr 20 11:00:48 EDT 2010] DOWNLOAD GIT BINARY>

BECAUSE SOURCE WON'T INSTALL:

[syoung@ngsdev git-1.7.0.5]$  make prefix=/usr all doc info ;# as yourself
/bin/sh: curl-config: command not found
GIT_VERSION = 1.7.0.5
/bin/sh: curl-config: command not found
make: Warning: File `GIT-VERSION-FILE' has modification time 99 s in the future
    * new build flags or prefix
    CC fast-import.o
    CC abspath.o
    ...
    remote-curl.c:488: error: ‘CURLE_OK’ undeclared (first use in this function)
remote-curl.c:490: error: ‘struct slot_results’ has no member named ‘curl_result’
remote-curl.c:490: error: ‘struct slot_results’ has no member named ‘http_code’
remote-curl.c:493: warning: implicit declaration of function ‘curl_slist_free_all’
make: *** [remote-curl.o] Error 1


DOWNLOAD GIT ON NGSDEV:

cd /nethome/syoung/base/apps/git

wget http://kernel.org/pub/software/scm/git/RPMS/x86_64/git-1.7.0.5-1.fc11.x86_64.rpm

wget http://kernel.org/pub/software/scm/git/RPMS/x86_64/git-all-1.7.0.5-1.fc11.x86_64.rpm

wget http://www.backports.org/debian/pool/main/g/git-core/git-core_1.6.5.orig.tar.gz

COULDNO 


DOWNLOAD GIT ON WINDOWS:

http://code.google.com/p/msysgit/downloads/list

AND INSTALLED OK!

</entry>

