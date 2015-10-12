git.archive.3

<entry [Mon 2012:01:09 12:09:27 EST] AUTOMATIC BUILD NUMBERS>

http://wegnerdesign.com/filedrop/automatic-build-numbers-for-git-projects/

Automatic Build Numbers for Git Projects
March 22, 2011Joe Wegner
1 comment

Share
I was given an issue report the other day about no build numbers in file drop.  I originally thought that I would have to manually include this build number in a PHP footer file, my commit messages, and again remember it in my response to bug reports.  Simply put, I’m not that great at remembering numbers, so I decided to script the process.


Format

My first step was to figure out how to format my build numbers.  It’s a common trend to include a major version and a minor version in your build numbers, but that doesn’t portray enough information when I’m doing mutiple commits per day.  You can choose whatever format you like, but I finally decided on a format that would display the version, the date, and the number of revision for that day.  Specifically, the format was this

major.minor.date.revision
So a build number for fileDrop today would have looked like

0.1.0322.1
Increment the Revision Number

The first trouble I see is getting that revision number to increment with each commit, and reset to one at the beginning of the day.  The first script that I write will handle this problem.  I’m placing these files in the ./.git directory (You may need to enable ‘View Hidden Files’) of my project.

INCR_FILE=”./.git/incr.git”
#This should be the path to your increment file. This should work for most configurations.
NUM=$(cat $INCR_FILE)
#This will grab the current revision number from our file incr.git 
if [ -z $(find -mtime -1 -path $INCR_FILE) ]; then
#The find command above checks if our revision num file
#has been modified in the past day

echo 1 > $INCR_FILE
else
echo $(($NUM + 1)) > $INCR_FILE
fi

Create a file called incr.sh in your ./.git directory with the above code, and create a second file called incr.git .  Put a single character “1″ into incr.git.  You can test the script with the following command

sh init.sh | cat init.git
Format the Date

The next task is going to be getting the date into a usable format.  By default the date command will output the date in UDT format.  Lucky for us, the date command has an optional argument for a custom output format.  Here are some useful codes for the date command

%d – day of month
%H – hour  (01-24)
%I – hour (01-12)
%j – day of year(001 – 366)
%m – month
%u – day of week(1 – 7)
%U – week of year(00-53)
%y – year (01-99)

I need to get the two digit month and the two digit day of the month, so my code will look like this

date +”%m%d”

Get the Full Build Number

This seems like it should be pretty easy.  Hard code in your major and minor version, and put an echo at the end of your script, right?  Right.  Unless you ever need to access your build number without incrementing it.  This is actually a very probable situation – I’m going to need to update my footer file with that build number, and I don’t want to create a whole new revision number just for that.  To stop our script from always incrementing we will throw in an optional parameter.  I’ll also add a parameter for our major.minor build number, so we don’t have to edit the script with every new version.

INCR_FILE=”./.git/incr.git”
#$1 is our first parameter. We’ll use this as our major.minor build number
#$2 is our second parameter. The script will test if this equals “increment”
if [ "$2" = "increment" ]; then
NUM=$(cat $PATH) 
if [ -z $(find -mtime -1 -name $INCR_FILE) ]; then
echo 1 > $INCR_FILE
else
echo $(($NUM + 1)) > $INCR_FILE
fi

echo $1.$(date +”%m%d”).$(cat $INCR_FILE)

There we go!  Now if you type

sh incr.sh 0.1
You should get your build number.  If you use the increment flag

sh incr.sh 0.1 increment
You should get an incremented build number.

Tie it All Together

 

Your script is finished now.  The last step is to figure out how to use your new script to update your PHP files and your modify your git commits.  To make things easier, I’ve added an alias in my .bashrc file that looks like this – I added the sudo because my .git directories are locked

alias gitRevision=’sudo sh .git/incr.sh’
Now from your code directory you can run commands like these to update your build numbers

gitRevision 0.1 increment > revision.txt
git commit -a -m “My Commit Message $(gitRevision 0.1)”

0
saves
Save
If you enjoyed this post, please consider leaving a comment or subscribing to the RSS feed to have future articles delivered to your feed reader.
fileDrop, Toolsbash, build, fileDrop, git, revision, script, shell, version
Comments
Leave a comment
 
Trackback
 
Written by Scott Wegner about 10 months ago.Reply
I’m glad you got this working; this will make it easier to reference which build for beta testing and opening bugs. A couple notes/questions:
1. Ideally this script should be checked in, or even better run on the server-side on commit so there’s no manually process. This will be more important when you have multiple developers or extra branches.
2. If you do decide to check it in, you should consider a Windows or cross-platform verison as well 
3. You should re-consider how you’re checking on whether to reset the build number; currently it looks like you’re using modified time, which is a useful heuristic, but will lead to bugs. i.e. if you increment at 11 PM and 1 AM, your build number will be wrong.
4. Consider adding at least one 0-padding to your numbers, so that they will always sort correctly as strings.
5. Why not have our buildNumber always increment globally, rather than start over every day? For one I think that’s more useful, but also it might currently worry users to see build 1.0.0322.101 running in production 
    
</entry>
<entry [Sat 2011:12:31 22:20:47 EST] HOW TO SEARCH GIT HISTORY>

http://stackoverflow.com/questions/4468361/search-all-of-git-history-for-string

I have a code base which I want to push to github as open source. In this git-controlled source tree, I have certain configuration files which contain passwords. I made sure not to track this file and I also added it to the .gitignore file. However, I want to be absolutely positive that no sensitive information is going to be pushed, perhaps if something slipped in-between commits or something. I doubt I was careless enough to do this, but I want to be positive.

Is there a way to "grep" all of git? I know that sounds weird, but by "all" I guess I mean every version of very file that ever was. I guess if there is a command that dumps the diff file for every commit, that might work?

Thanks!

accepted

git rev-list --all | (
    while read revision; do
        git grep -F 'password' $revision
    done
)

    
</entry>
<entry [Mon 2011:12:05 15:46:44 EST] FIXED PROBLEM 'you are leaving 1 commit behind'>

PROBLEM:

WAS NOT CHECKED OUT AS MASTER, i.e.,

git checkout master

BEFORE I COMMITTED CHANGES TO apps AND WHEN I WENT TO CHANGE TO master GOT THIS ERROR:

git checkout master
    Warning: you are leaving 1 commit behind, not connected to
    any of your branches:
    
      e23c78a Added t moved from t/bin/apps and 65MB file 04-FilterSNP/dbfile/filtersnp.dbl.
    
    If you want to keep it by creating a new branch, this may be a good time
    to do so with:
    
     git branch new_branch_name e23c78ad29e242baa9ebfbb26e813dbf24990890
    
    Switched to branch 'master'


SOLUTION:

SAVED CHANGES AS stashed BRANCH, CHANGED TO master AND REBASED stashed ONTO master

syoung@syoung-Satellite-L355:/agua/0.6/apps  (master)$ git branch stashed e23c78ad29e242baa9ebfbb26e813dbf24990890

syoung@syoung-Satellite-L355:/agua/0.6/apps  (stashed)$ git checkout master
    Switched to branch 'master'
syoung@syoung-Satellite-L355:/agua/0.6/apps  (master)$ git rebase stashed
    First, rewinding head to replay your work on top of it...
    Applying: Added test to commit
    Applying: Added 'more' to TEST

syoung@syoung-Satellite-L355:/agua/0.6/apps  (master)$ git log --oneline
    dc52e9e Added 'more' to TEST
    258c4fc Added test to commit
    e23c78a Added t moved from t/bin/apps and 65MB file 04-FilterSNP/dbfile/filtersnp.dbl.
    c949c97 Moved bioaps-*** to apps.
    3562569 Moved README to README.apps-mod
    f5e9386 Added apps-mod README
    e124c27 Added apps README
    4922c8f Merge branch 'master' of github.com:syoung/private
    654001b First commit bioapps
    ec9a02f Added bioapps.
    syoung@syoung-Satellite-L355:/agua/0.6/apps  (master)$ 

    
</entry>
<entry [Mon 2011:11:21 18:07:00 EST] SET UP biorepository REPOSITORY ON LINODE>

ON LINODE:

mkdir /srv/git/biorepository
cd /srv/git/biorepository
git init


ON TOSHIBA:

git config --global user.name "Stuart Young"
git config --global user.email stuartpyoung@gmail.com

cd /repos/biorepository
git remote add linode ssh://root@173.230.142.248/srv/git/biorepository

SO THE NEW .git/config LOOKS LIKE THIS:

cat .git/config
    [core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
    [remote "origin"]
        fetch = +refs/heads/*:refs/remotes/origin/*
        url = git@github.com:syoung/biorepository
    [branch "master"]
        remote = origin
        merge = refs/heads/master
    [remote "linode"]
        url = ssh://root@173.230.142.248/srv/git/biorepository
        fetch = +refs/heads/*:refs/remotes/linode/*


3. PUSH FROM HP TO LINODE

cd /repos/biorepository
git push -u linode master
    OK


CHECKED CONFIG:

refs/heads/master
git config branch.master.remote
    linode

cd /repos/biorepository
git config branch.master.merge
    refs/heads/master


4. PULL FROM linode

mkdir /tmp/biorepository
cd /tmp/biorepository
git clone ssh://root@173.230.142.248/srv/git/biorepository

    OK


    
</entry>
<entry [Fri 2011:11:18 15:54:56 EST] SHOW CURRENT BRANCH/TAG ON COMMAND PROMPT>

http://www.livefirelabs.com/unix_tip_trick_shell_script/apr_2003/04212003.htm

THE PS1 ENVIRONMENT VARIABLE SPECIFIES THE PROMPT:

PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $'

WHICH GIVES THIS:

syoung@syoung-Satellite-L355:/agua $


ENABLED GIT BRANCH INFO BY ADDING TO .bash_profile:

PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(__git_ps1 " (%s)")\\$'
export GIT_PS1_SHOWDIRTYSTATE=true


syoung@syoung-Satellite-L355 apps:/agua/0.6 (master)$ echo "more" >> TEST
syoung@syoung-Satellite-L355 apps:/agua/0.6 (master *)$ git add .
syoung@syoung-Satellite-L355 apps:/agua/0.6 (master +)$ git commit -a
    [master 2357e69] Added 'more' to TEST
     1 files changed, 1 insertions(+), 0 deletions(-)

    
</entry>
<entry [Fri 2011:11:18 14:37:15 EST] SET UP apps REPO ON GITHUB>

CREATED

/agua/0.6/apps

ADDED FILES, DID git add . AND git commit -a

SET UP REMOTE:

git remote add github git@github.com:syoung/apps.git
git remote add linode ssh://root@173.230.142.248/srv/git/apps

CURRENT REMOTES: 
 
git remote -v

    github	git@github.com:syoung/apps.git (fetch)
    github	git@github.com:syoung/apps.git (push)
    linode	ssh://root@173.230.142.248/srv/git/apps (fetch)
    linode	ssh://root@173.230.142.248/srv/git/apps (push)


PUSHED TO GITHUB:

git push -u github master

    OK
    
    Counting objects: 232, done.
    Compressing objects: 100% (227/227), done.
    Writing objects: 100% (232/232), 492.30 KiB, done.
    Total 232 (delta 56), reused 0 (delta 0)
    To git@github.com:syoung/apps.git
     * [new branch]      master -> master
    Branch master set up to track remote branch master from github.


NB: WHEN COMMIT IN /agua/0.6 AM PROMPTED TO ADD apps:

    # Changes not staged for commit:
    #   (use "git add <file>..." to update what will be committed)
    #   (use "git checkout -- <file>..." to discard changes in working direct$
    #   (commit or discard the untracked or modified content in submodules)
    #
    #       modified:   apps (modified content)

    
</entry>
<entry [Sat 2011:11:12 03:53:48 EST] DELETE PREVIOUS COMMIT>


So it sounds like the bad commit was incorporated in a merge commit at some point. Has your merge commit been pulled yet? If yes, then you'll want to use git revert; you'll have to grit your teeth and work through the conflicts. If no, then you could conceivably either rebase or revert, but you can do so before the merge commit, then redo the merge.

There's not much help we can give you for the first case, really. After trying the revert, and finding that the automatic one failed, you have to examine the conflicts and fix them appropriately. This is exactly the same process as fixing merge conflicts; you can use git status to see where the conflicts are, edit the unmerged files, find the conflicted hunks, figure out how to resolve them, add the conflicted files, and finally commit. If you use git commit by itself (no -m <message>), the message that pops up in your editor should be the template message created by git revert; you can add a note about how you fixed the conflicts, then save and quit to commit.

For the second case, fixing the problem before your merge, there are two subcases, depending on whether you've done more work since the merge. If you haven't, you can simply git reset --hard HEAD^ to knock off the merge, do the revert, then redo the merge. But I'm guessing you have. So, you'll end up doing something like this:

create a temporary branch just before the merge, and check it out
do the revert (or use git rebase -i <something before the bad commit> <temporary branch> to remove the bad commit)
redo the merge
rebase your subsequent work back on: git rebase --onto <temporary branch> <old merge commit> <real branch>
remove the temporary branch

    
</entry>
<entry [Tue 2011:11:08 09:31:15 EST] git-annex FOR BINARY FILES>

HOMEPAGE
http://git-annex.branchable.com/

DOWNLOAD
http://hackage.haskell.org/packages/archive/git-annex/3.20111011/git-annex-3.20111011.tar.gz
FROM PAGE
http://hackage.haskell.org/package/git-annex
ALSO


REVIEW
http://stackoverflow.com/questions/540535/managing-large-binary-files-with-git

I discoverd git-annex recently which I find awesome. It was designed for managing large files efficiently. I use it for my photo/music (etc.) collections. The development of git-annex is very active. The content of the files can be removed from the git repo, only the tree hierarchy is tracked by git (through symlinks). However, to get the content of the file, a second step is necessary after pulling/pushing, e.g.:

$ git annex add mybigfile
$ git commit -m'add mybigfile'
$ git push myremote 
$ git annex copy --to myremote mybigfile ## this command copies the actual content to myremote 
$ git annex drop mybigfile ## remove content from local repo
...
$ git annex get mybigfile ## retrieve the content
## or to specify the remote from which to get:
$ git annex copy --from myremote mybigfile
There are many commands available, and there is a great documentation on the website. A package is available on debian.


GIT ANNEX HOMEPAGE

http://git-annex.branchable.com/



    
</entry>
<entry [Sat 2011:11:05 22:33:17 EST] USEFUL git log SYNTAX>

git log --oneline --decorate --graph

    
</entry>
<entry [Fri 2011:10:21 15:15:13 EST] USE GITOLITE TO SEARCH REPOSITORIES>

http://computercamp.cdwilson.us/git-gitolite-git-daemon-gitweb-setup-on-ubunt


NB: MASTER GITOLITE DOCS INDEX
http://sitaramc.github.com/gitolite/

NNB: GITOLITE WILDCARD REPOSITORIES:
http://sitaramc.github.com/gitolite/doc/wildcard-repositories.html



    
</entry>
<entry [Fri 2011:10:21 15:10:56 EST] CREATING YOUR OWN GIT SERVER>
http://alestic.com/2011/04/ec2-git-server
ALSO SAVED TO /home/syoung/notes/apps/git/gitolite-etc-on-ubuntu.11.10.html



December 31, 2010 git + gitolite + git-daemon + gitweb setup on Ubuntu 11.10 server
UPDATE – 10/17/2011
Updated everything to work on Ubuntu 11.10 server and fixed a couple wrong/missing steps in the process
UPDATE – 10/16/2011

(thanks to @Elena and @admin in comments for catching my goofs)

Fixed typo (changed chmod 666 /tmp/username.pub to chmod 644 /tmp/username.pub)
Replaced the bits about restarting
UPDATE – 5/8/2011

This works on Ubuntu Server 11.04 as well.

Fixed the section at the bottom about editing /etc/sv/git-daemon/run because I forgot to include the bits about changing the base-path and directory. Sorry bout that…

Added bits about setting gitweb owner and description

Added url rewrite bits

Added optional bits for /etc/gitweb.conf

Added gitweb theme

So here’s the skinny on getting git, gitolite, git-daemon, and gitweb set up on your Ubuntu 11.10 server using the packages from apt.

Make sure to read this entirely and follow every step!

git setup
Install git and doc:

sudo apt-get install git-core git-doc
Setup your username and email:

git config --global user.name "Your Name"
git config --global user.email your@email.com
gitolite setup
Copy over your pubkey from your local machine to the git server:

# FROM YOUR LOCAL MACHINE
scp ~/.ssh/id_rsa.pub git.server:/tmp/username.pub
Create gitolite group and gitolite user:

sudo addgroup gitolite
sudo adduser --disabled-password --home /home/gitolite --ingroup gitolite gitolite
Install gitolite:

sudo apt-get -y install gitolite
Append www-data to gitolite group so gitweb can access the repos:

sudo usermod -a -G gitolite www-data
and make sure that groups are updated for apache:

sudo service apache2 restart
Run the gitolite setup:

sudo su - gitolite
gl-setup /tmp/cwilson.pub
Setup will allow you to modify gitolite config umask settings so that new repos are given permissions to enable gitweb and git-daemon export:

# change $REPO_UMASK = 0077; to $REPO_UMASK = 0027; # gets you 'rwxr-x---'
Exit out of gitolite user session and return to your normal user account:

exit
If for some reason you weren’t able to edit .gitolite.rc during the gl-setup phase, edit .gitolite.rc and fix permissions so that gitolite group has read access to repositories:

sudo emacs /home/gitolite/.gitolite.rc
# change $REPO_UMASK = 0077; to $REPO_UMASK = 0027; # gets you 'rwxr-x---'
sudo chmod g+r /home/gitolite/projects.list
sudo chmod -R g+rx /home/gitolite/repositories
You should now be able to clone the gitolite-admin.git repository that’s created automatically by the gitolite setup script:

# FROM YOUR LOCAL MACHINE
git clone gitolite@git.server:gitolite-admin.git
Edit gitolite.conf to enable gitweb and git-daemon export for testing:

# FROM YOUR LOCAL MACHINE
cd gitolite-admin
emacs conf/gitolite.conf
# change to:
repo    testing
      RW+     =   @all
      R       =   daemon
testing "Owner" = "Test repo"
git add conf/gitolite.conf
git commit -m "Enabled gitweb and git-daemon export for testing repo"
git push
cd ..
Setting the repo owner and description automatically gives read access to gitweb so you don’t have to specify it explicitly.

Clone testing and add a file (so it’s not empty):

git clone gitolite@git.server:testing.git
cd testing
echo "README" > README
git add README
git commit -m "Added README"
git push origin master
gitweb setup


Install gitweb:

sudo apt-get install highlight gitweb
Change the gitweb configuration to use the gitolite repo paths:

sudo emacs /etc/gitweb.conf
# change $projectroot to /home/gitolite/repositories
# change $projects_list to /home/gitolite/projects.list
Now you should be able to see the testing repository in gitweb at:

http://git.server/gitweb/

git-daemon setup
sudo apt-get install git-daemon-run
Now we need to change the sv config for git-daemon so that it runs as the gitdaemon user and gitolite group (since gitolite group has read access to the repositories)

sudo emacs /etc/sv/git-daemon/run
Change:

#!/bin/sh
exec 2>&1
echo 'git-daemon starting.'
exec chpst -ugitdaemon \
  "$(git --exec-path)"/git-daemon --verbose --base-path=/var/cache /var/cache/git
to:

IMPORTANT: notice the change from -ugitdaemon to -ugitdaemon:gitolite

#!/bin/sh
exec 2>&1
echo 'git-daemon starting.'
exec chpst -ugitdaemon:gitolite \
  "$(git --exec-path)"/git-daemon --verbose --base-path=/var/lib/gitolite/repositories /var/lib/gitolite/repositories
Restart git-daemon:

sudo sv restart git-daemon
You should now be able to clone the testing repo via the git protocol:

git clone git://git.server/testing.git
Pretty URLs
To enable pretty gitweb urls (http://git.server instead of http://git.server/gitweb/ as explained in http://repo.or.cz/w/alt-git.git?a=blob_plain;f=gitweb/README):

Open /etc/apache2/conf.d/gitweb:

sudo emacs /etc/apache2/conf.d/gitweb
and comment out everything.

Enable rewrites in apache:

sudo a2enmod rewrite
sudo service apache2 restart
Add a new ‘git’ virtual host:

sudo emacs /etc/apache2/sites-available/git
and add the following:

<!--
<VirtualHost *:80>
    ServerName git.server
    ServerAdmin webmaster@git.server
    DocumentRoot /usr/share/gitweb

    <Directory /usr/share/gitweb>
        Options FollowSymLinks ExecCGI
        AddHandler cgi-script cgi
        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteCond %{REQUEST_FILENAME} !-d
        RewriteRule ^.* /index.cgi/$0 [L,PT]
    </Directory>
</VirtualHost>

-->

view rawgitThis Gist brought to you by GitHub.
Enable the new ‘git’ virtual host:

sudo a2ensite git
sudo service apache2 reload
Enable pretty urls in /etc/gitweb.conf:

sudo emacs /etc/gitweb.conf
and add the following:

# Enable PATH_INFO so the server can produce URLs of the
# form: http://git.cdwilson.us/project.git/xxx/xxx
# This allows for pretty URLs *within* the Git repository, where
# my Apache rewrite rules are not active.
$feature{'pathinfo'}{'default'} = [1];
gitweb extras
To enable other optional features of gitweb, add the following:

$projects_list_description_width = 100;

# Enable blame, pickaxe search, snapshop, search, and grep
# support, but still allow individual projects to turn them off.
# These are features that users can use to interact with your Git trees. They
# consume some CPU whenever a user uses them, so you can turn them off if you
# need to. Note that the 'override' option means that you can override the
# setting on a per-repository basis.
$feature{'blame'}{'default'} = [1];
$feature{'blame'}{'override'} = 1;

$feature{'pickaxe'}{'default'} = [1];
$feature{'pickaxe'}{'override'} = 1;

$feature{'snapshot'}{'default'} = [1];
$feature{'snapshot'}{'override'} = 1;

$feature{'search'}{'default'} = [1];

$feature{'grep'}{'default'} = [1];
$feature{'grep'}{'override'} = 1;

$feature{'show-sizes'}{'default'} = [1];
$feature{'show-sizes'}{'override'} = 1;

$feature{'avatar'}{'default'} = ['gravatar'];
$feature{'avatar'}{'override'} = 1;

$feature{'highlight'}{'default'} = [1];
$feature{'highlight'}{'override'} = 1;
Custom Theme
To add a customized theme (from http://kogakure.github.com/gitweb-theme/):

sudo mv /usr/share/gitweb/static/gitweb.js /usr/share/gitweb/static/gitweb.js.orig
sudo mv /usr/share/gitweb/static/gitweb.css /usr/share/gitweb/static/gitweb.css.orig
cd /tmp
git clone git://github.com/kogakure/gitweb-theme.git
cd gitweb-theme
sudo cp gitweb.css gitweb.js /usr/share/gitweb/static/

    
</entry>
<entry [Thu 2011:08:11 09:48:32 EST] PROBLEM WITH GITHUB FINGERPRINT>

The authenticity of host 'github.com (207.97.227.239)' can't be established.
RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)? yes

THEN SAW THIS ACTIVITY ON
netstat -a | grep tcp

tcp        0      0 *:sge_execd             *:*                     LISTEN     
tcp        0      0 Satellite-L355.lo:41576 a96-17-75-203.dep:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:37814 ec2-50-19-27-139.co:ssh ESTABLISHED
tcp        0      0 Satellite-L355.lo:48051 yw-in-f97.1e100.n:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:41572 a96-17-75-203.dep:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:54575 yu-in-f154.1e100.ne:www ESTABLISHED
tcp        0      0 Satellite-L355.lo:54574 yu-in-f154.1e100.ne:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:48454 beacon.newrelic.c:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:46019 yi-in-f120.1e100.ne:www ESTABLISHED
tcp        0      0 Satellite-L355.lo:39863 vw-in-f99.1e100.net:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:53072 qw-in-f105.1e100.ne:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:54576 yu-in-f154.1e100.ne:www TIME_WAIT  
tcp       96      0 Satellite-L355.lo:33344 ec2-50-19-27-139.co:ssh ESTABLISHED
tcp        0      0 Satellite-L355.lo:39862 vw-in-f99.1e100.net:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:44233 gx-in-f138.1e100.ne:www ESTABLISHED
tcp        0      0 Satellite-L355.lo:42003 yw-in-f167.1e100.ne:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:41574 a96-17-75-203.dep:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:49311 yu-in-f154.1e100.:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:42004 yw-in-f167.1e100.ne:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:37276 ec2-50-19-27-139.co:ssh ESTABLISHED
tcp        0      0 Satellite-L355.lo:41577 a96-17-75-203.dep:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:53074 qw-in-f105.1e100.ne:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:59047 vw-in-f103.1e100.ne:www ESTABLISHED
tcp        0      0 Satellite-L355.lo:53076 qw-in-f105.1e100.ne:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:59761 ec2-50-19-27-139.co:ssh ESTABLISHED
tcp        1      0 Satellite-L355.lo:33045 cpansearch1.solfo.c:www CLOSE_WAIT 
tcp        0      0 Satellite-L355.lo:49312 yu-in-f154.1e100.:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:53075 qw-in-f105.1e100.ne:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:41573 a96-17-75-203.dep:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:53073 qw-in-f105.1e100.ne:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:41575 a96-17-75-203.dep:https ESTABLISHED
tcp        0      0 Satellite-L355.lo:48956 gx-in-f113.1e100.ne:www TIME_WAIT  
tcp        0      0 Satellite-L355.lo:51717 gx-in-f101.1e100.ne:www ESTABLISHED
tcp        0      0 Satellite-L355.lo:42001 yw-in-f167.1e100.ne:www ESTABLISHED
tcp6       0      0 [::]:www                [::]:*                  LISTEN     
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN     
tcp6       0      0 Satellite-L355:ipp      [::]:*                  LISTEN     



</entry>
<entry [Wed 2011:08:03 06:49:32 EST] SET UP GITHUB TOKENS>

GITHUB TOKENS
=============

stuartpyoung GITHUB TOKEN:

a359152dd81fbd744a86128c0be5a764

syoung GITHUB TOKEN:

4416b765217a3c3de1ed99938ffe25e0


SET DEFAULT TOKEN
=================

Set the GitHub token for all git instances on the system

git config --global github.token 0123456789yourf0123456789token





Set your GitHub token.

Some tools connect to GitHub without SSH. To use these tools properly you need to find and configure your API Token.

*Note* If you ever change your GitHub password, a new token will be created and will need to be updated.


On the GitHub site: Account Settings --> Account Admin


the ones shown.

Set the GitHub username for all git instances on the system

$ git config --global github.user username

Set the GitHub token for all git instances on the system

$ git config --global github.token 0123456789yourf0123456789token


ALTERNATELY, USE env vars GITHUB_USER and GITHUB_TOKEN:
https://github.com/defunkt/gist

$ export GITHUB_USER="your-github-username"
$ export GITHUB_TOKEN="your-github-token"
$ gist ~/example

    
</entry>
<entry [Wed 2011:08:03 04:26:21 EST] HOW TO SET UP A GITHUB ACCOUNT>


http://mark-kirby.co.uk/2008/using-git-and-github-on-os-x/


    
</entry>
<entry [Wed 2011:08:03 04:26:00 EST] ROLL BACK LAST COMMIT>


Rolling back

To revert back to the state of the last commit, enter the following:

 
git reset --hard HEAD

    
</entry>
<entry [Wed 2011:08:03 00:32:21 EST] CREATED aquarius2: DUAL GITHUB ***AND*** EC2 PRIVATE KEY>

1. VERIFIED CURRENT GITHUB PRIVATE KEY

CURRENTLY, THE aguadev (RENAMED /home/syoung/.ssh/idents/id_rsa) KEYPAIR IS USED TO AUTHENTICATE TO GITHUB:

aguadev PUBLIC KEY:

ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAw1/yJsz5X/t+qRFYr6x4n92Yq2xjsqb/RdSupRRKROuIwWJ2fmyYvvRSYAtbGyZsxpXhrptknADwoqsfqhghD39vZHsSJqiKvP9ErGwTfit3YVngGXZuIbPFinQPSYKL3spAbLx1ssu5H1FbW0dhWa77+6LSkn22LDWlVfcn2XThNO1b+IIu5aiBLtHB1JsKd/XxdwzGgfHrWOD7huepoOM+xJQedBdvaXbvWE9GYwMhL+iD60Iu0ZFCJ3kfcM86pdgIhRzdMgV+iFTMCMFQ79RZOOJhd5UliOJKXUd4felxLk96GXTB/gKktdXnVLPrEjwBSbeKpxg2kjxuyGlpJw==

NB: REMOVED stuartyoung PUBLIC KEY, FOR WHICH THE PRIVATE COUNTERPART WAS ON HP LAPTOP (NOW DISCARDED) 


CONFIRMED THIS BY MOVING aguadev PRIVATE KEY AND TRYING TO git push:

mv /home/syoung/.ssh/idents/github.com/id_rsa /home/syoung/.ssh/idents/github.com/id_rsa.bkp

syoung@Satellite-L355:~/notes$ git push
Permission denied (publickey).
fatal: The remote end hung up unexpectedly

    OK!

MOVED BACK:

mv /home/syoung/.ssh/idents/github.com/id_rsa.bkp /home/syoung/.ssh/idents/github.com/id_rsa
    


2. DISABLED ROOT LOGIN ON UBUNTU LAPTOP

EDIT CONFIG:

emacs -nw /etc/ssh/sshd_config

    #PermitRootLogin yes
    PermitRootLogin no
    StrictModes yes

RESTART SSH:

/etc/init.d/ssh restart

    ssh stop/waiting
    ssh start/running, process 3363

RESTART AGAIN USING restart COMMAND:

restart ssh
ssh start/running, process 3385

    OK!
    
    
3. CREATED NEW PRIVATE KEY

http://ask-leo.com/how_do_i_create_and_use_public_keys_with_ssh.html

1. CREATED openSSH FORMAT PUBLIC KEY:

cd /home/syoung/22-agua/cloud/AWS/keypair/syoung
mkdir aquarius2
cd aquarius2

ssh-keygen -t rsa -C "stuartpyoung@gmail.com"


Enter file in which to save the key (/home/syoung/.ssh/id_rsa):

/home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa

Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa.
Your public key has been saved in /home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa.pub.
The key fingerprint is:
a0:0d:00:4b:2f:7d:61:07:a9:ec:13:33:fa:df:84:af stuartpyoung@gmail.com
The key's randomart image is:
+--[ RSA 2048]----+
|.o.  +o.         |
|..o...o          |
|...oo..          |
|  .*.+ .         |
|  o = . S        |
| . o  .          |
|  . .. .         |
|   .  +          |
|    .E.o         |
+-----------------+


aquarius2 PRIVATE KEY:

-----BEGIN RSA PRIVATE KEY-----
MIIEpgIBAAKCAQEA1vLhO49CjIakdmSzaYTihkaPMzjNkPPsqsH7A9R2FbRHw4af
RFfcOouKKJdWhvSiWQOyE+7n0BVjGK7RI3pWr+A9uCkhCc8aEr/ECf+rb6dsD6zt
gwcelwQzBxMcVU+eJ8juBYX6zXELdrJInFWW6THt8frbA9kDnDFiNWjCOCIjAA57
moF/vuYUTt9FNEElqcYXmXnZxIqNdrtPwkL2dRGenMrMPNs6BDzjn4fjhMVT/2Aa
OY+/fmYMG1EPa/naymnCPAnOK6CL5Cen7Hw3fZOmL711waldckXX+wDbWjC6DIMr
csz4dBZzi6k5vnu433urCrfk0rby2iwVFUFlNQIDAQABAoIBAQDTg8lTfJO2CMBJ
qKpLyXHHRCOh+eF/JCjdl2jUyfsxPGfp5c1PyU1zZuCbNOD2iEBBa7uOlecTAhiz
r0MpsDchdn4FfKOALYWwsXfNhwNCKfPSMQ6/gv/9ByrXaVzWLjSpXbWrRb4Y74ai
VKnS/P41luZY2csvLBu7VXUYrW+BH3hLLnVtstQDCLw9tULzIYrNg7ICWL4PdV0l
eEBhb3nTv1C7DgTRtzvfHgZneDmzLcLrP924H+MJA94QrX6Ozvm3BVabHtIWo8R3
qlfGOG9FCGZdxJLJeVW37TH1gCChVK1bM3HslfVKLHnKlU4AKWl4c8YQnYHwme4O
H7i1Dl7BAoGBAPT8C/ylhJvJry64F9faAkkgSY0mTfnd1hO98PIBFyYCAziK9RNU
NNdydlvEQHl2wLoZrZV5hvT2GDkSQ+FxzMQR9BjA+wNJeMQ66Rp3ooi6zf4agmB5
Ksk1tX3XD+aIZT1YdEXr3Gmtw6Iek1mGDoQXjPJd3Zt0JVjhfPfOCdVtAoGBAOCd
GUFXEWH6QsTSc77Git0k6Rh5brSPamRq6MANHkXbjjvrPUYj+r+v5bW7OdFUl4AE
828FQgc9cxIkWy9394darWuuFdyO6c1Q6tf80QXjTOVDCU1TbygHK0U92r/0VU0d
vemBKQ/FQrWkgTg8ls0acqEgPjEE96At/yuMwJnpAoGBAPJTpp/AMc3P0AMMgjk3
Im+nCloee58fObTJe15GidlEwF7bxNPbxXEffcgD9iqvtq/e2n8yeLYx/3/ke1Sz
NnLzt1oM+b4knNqt0wolMJbDASPKoRBAinwBLodNhiLo5AusRUcsqRe3k/329JXn
LtCmYvsSsjQkzRR/5xdPrRZ5AoGBAN+pL5vTwlho5pGs6lqew2ogNggL60Pax1uE
5Y1PwsRXM1PRE+vDKg40bi2/aHxcmpt80pbLiotBElOPZklnUVEz5xoheF1u5btw
BtnaQp11UH2+egXIvhgCw4CobinUeBhZNGHPHn84swvC6nWAR72mx1xQif0v8BBN
nRjViHf5AoGBAKy57uRYZUpJHBdux5N1JEnvYMp4V5eAgq3asrqX9Adx3+/b9qT3
vSKkEieCNjQZVbe0XAM9o928dJz6YsMgybcX3umzLzHfhCIxiaqan9CBt8P/Q+BH
JztMzzzlfLAmjKzFTYmtT1u5zAc+JfyH9bGbF2B8kLO3jbNh66VEbGio
-----END RSA PRIVATE KEY-----


aquarius2 PUBLIC KEY

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW8uE7j0KMhqR2ZLNphOKGRo8zOM2Q8+yqwfsD1HYVtEfDhp9EV9w6i4ool1aG9KJZA7IT7ufQFWMYrtEjelav4D24KSEJzxoSv8QJ/6tvp2wPrO2DBx6XBDMHExxVT54nyO4FhfrNcQt2skicVZbpMe3x+tsD2QOcMWI1aMI4IiMADnuagX++5hRO30U0QSWpxheZednEio12u0/CQvZ1EZ6cysw82zoEPOOfh+OExVP/YBo5j79+ZgwbUQ9r+drKacI8Cc4roIvkJ6fsfDd9k6YvvXXBqV1yRdf7ANtaMLoMgytyzPh0FnOLqTm+e7jfe6sKt+TStvLaLBUVQWU1 stuartpyoung@gmail.com



4. REPLACED aguadev PUBLIC KEY IN GITHUB SSH PUBLIC KEYS WITH aquarius2 PUBLIC KEY

https://github.com/account/sshlsof


GIT PUSH FAILS AS EXPECTED:

syoung@Satellite-L355:/agua/0.6/t$ git push
Permission denied (publickey).
fatal: The remote end hung up unexpectedly

    OK!



5. REPLACED aguadev PRIVATE KEY IN /home/syoung/.ssh/idents/github.com/id_rsa WITH aquarius2 PRIVATE KEY

mv /home/syoung/.ssh/idents/github.com/id_rsa /home/syoung/.ssh/idents/github.com/id_rsa.old.aguadev

cp /home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa /home/syoung/.ssh/idents/github.com/id_rsa


GIT PUSH NOW WORKS AGAIN:

syoung@Satellite-L355:/agua/0.6/t$ git push
Counting objects: 11, done.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 473 bytes, done.
Total 6 (delta 5), reused 0 (delta 0)
To git@github.com:syoung/aguatest.git
   7e4f2bf..6080f80  master -> master

    OK!


6. REGISTERED aquarius2 WITH EC2

NB: USE EXISTING JGILBERT KEYPAIR TO AUTHENTICATE

export AMAZON_USER_ID=558277860346
export AWS_ACCESS_KEY_ID=AKIAJWZIAB2ZZB7FHJIQ
export AWS_SECRET_ACCESS_KEY=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
export EC2_PRIVATE_KEY=/home/syoung/22-agua/cloud/AWS/keypair/jgilbert/pk-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem
export EC2_CERT=/home/syoung/22-agua/cloud/AWS/keypair/jgilbert/cert-QQN6FHMRVQPPCSNYWYZFI7EGBSUXJF5T.pem


NB: GITHUB PRIVATE KEY
/home/syoung/.ssh/idents/github.com/id_rsa

IS IDENTICAL TO aquarius2 PRIVATE KEY
/home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa


ec2-import-keypair \
--debug \
aquarius2 \
--public-key-file /home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa.pub \
-U https://ec2.amazonaws.com

    KEYPAIR	aquarius2	d7:6e:8c:bc:37:a4:de:75:cf:ca:23:8b:fc:b8:17:7b


ON HEADNODE, DESCRIBE CURRENT KEYPAIRS:


ec2dkey

    KEYPAIR	id_rsa-admin-key	d9:f4:e4:ce:5a:a0:6e:4e:dc:79:d9:7e:fd:47:d7:2e:6a:38:00:e2
    KEYPAIR	ec2-keypair1	48:18:33:d1:5a:4b:25:53:01:c6:c0:c9:d3:2a:ac:6c:0e:d1:f4:43
    KEYPAIR	aquarius2	d7:6e:8c:bc:37:a4:de:75:cf:ca:23:8b:fc:b8:17:7b
    KEYPAIR	aquarius	03:b7:c5:f0:a6:e7:6b:af:3d:8a:68:ff:ec:f1:d6:05
    KEYPAIR	id_rsa-jgilbert-key	cc:63:81:5b:c1:6a:00:4b:a8:e8:17:c8:7d:cb:68:4d:01:bf:07:71
    KEYPAIR	id_rsa-starcluster-1	cb:f9:77:bc:ed:c6:fb:91:3f:a2:12:a5:f0:ea:bc:ae:1a:a7:7c:41
    KEYPAIR	agua	0d:d8:03:2c:72:81:68:36:67:41:bf:db:28:a5:f1:33:9e:97:8b:02
    KEYPAIR	id_rsa-syoung-key	e1:1c:6f:04:27:b3:78:33:d0:45:96:c1:ff:6a:43:ed:f1:24:29:ca



7. REPLACE aquarius WITH aquarius2 

ON TOSHIBA
/home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius
IS IDENTICAL TO /home/syoung/.ssh/id_rsa

REPLACE IT WITH
/home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa

mv /home/syoung/.ssh/id_rsa /home/syoung/.ssh/id_rsa.old.aquarius
cp /home/syoung/22-agua/cloud/AWS/keypair/syoung/aquarius2/id_rsa /home/syoung/.ssh/id_rsa


TO ALLOW ACCESS TO HEADNODE USING aquarius2, ON HEADNODE, ADDED aquarius2 PUBLIC KEY TO /root/.ssh/authorized_keys:

sh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0ScMFs4YXrlijHyCbx9jAUKxmTix4EFCUq6qyr3H+y4aFeYG9x/BJob10o+t\
H0F2cUs/dvxctPXqUXgEEXX/ztu2ax78Ag0Pv15zSjTNWJQkUoHzb1X00R5SlnlxepFv/JqiFk37b1jhYGtIqd6Q7BiifBiV\
ns24Oi/dWo9DvzdlXv8P0m97qnk7FVRxGlPrpAf1dUQwC17XAq4IcG/WJI6xP7ytCiwdtvrgacH8MQJMzIQsNw7VFKqD3XVe\
WI7xVHP4Cm0494/XoFpgkFKdjQ3aXuXlkiV4lnF4UJsl4Ov5z3223xQVD2YPxAl9aGxJc+z7BoI70gqMZIDDDmT6dw== aqu\
arius
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW8uE7j0KMhqR2ZLNphOKGRo8zOM2Q8+yqwfsD1HYVtEfDhp9EV9w6i4oo\
l1aG9KJZA7IT7ufQFWMYrtEjelav4D24KSEJzxoSv8QJ/6tvp2wPrO2DBx6XBDMHExxVT54nyO4FhfrNcQt2skicVZbpMe3x\
+tsD2QOcMWI1aMI4IiMADnuagX++5hRO30U0QSWpxheZednEio12u0/CQvZ1EZ6cysw82zoEPOOfh+OExVP/YBo5j79+Zgwb\
UQ9r+drKacI8Cc4roIvkJ6fsfDd9k6YvvXXBqV1yRdf7ANtaMLoMgytyzPh0FnOLqTm+e7jfe6sKt+TStvLaLBUVQWU1 aqu\
arius2



8. LAUNCHED aquarius-8-starcluster.5 INSTANCE USING THIS KEYPAIR:

ec2-run-instances \
--key aquarius2 \
ami-3e19ef57 \
--instance-type t1.micro \
-z us-east-1a 

    RESERVATION     r-cb6813a1      558277860346    default
    INSTANCE        i-5c90a631      ami-3e19ef57                    pending aquarius        0      t1.micro 2010-12-13T00:17:30+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da           monitoring-disabled                                      ebs                                    paravirtual









NOTES
-----



GENERAL INFO
http://github.com/guides/providing-your-ssh-key

FOLLOWED THIS GUIDE
http://help.github.com/msysgit-key-setup/



GOT THIS ERROR USING private.pem AND public.pem
-----------------------------------------------


Caused by: java.lang.ClassNotFoundException: com.amazon.aes.webservices.client.cmd.ImportKeyPair not found in gnu.gcj.runtime.SystemClassLoader{urls=[file:./], parent=gnu.gcj.runtime.ExtensionClassLoader{urls=[], parent=null}}


export EC2_PRIVATE_KEY=/home/syoung/22-agua/cloud/AWS/keypair/jgilbert/private.pem
export EC2_CERT=/home/syoung/22-agua/cloud/AWS/keypair/jgilbert/public.pem

NB: THE ADMIN KEYPAIR FROM HEADNODE IS IDENTICAL TO THE private.pem AND public.pem IN THE keypair/jgilbert FOLDER:

/home/syoung/22-agua/cloud/AWS/keypair/jgilbert/private.pem

-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==
-----END PRIVATE KEY-----

/home/syoung/22-agua/cloud/AWS/keypair/jgilbert/public.pem

-----BEGIN CERTIFICATE-----
MIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlk C/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=
-----END CERTIFICATE-----



NB: HOW TO: FIRST aquarius KEY BELONGING TO JGILBERT
----------------------------------------------------

    SEE apps.ec2.archive.3
    [Tue Dec 14 00:00:04 EST 2010]
    USE ec2-import-keypair BEFORE RUNNING INSTANCE - SYOUNG



cd /root/base/apps/ec2/keypair/jgilbert

ssh-keygen -t rsa

    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa): /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa.
    Your public key has been saved in /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa.pub.
    The key fingerprint is:
    26:a7:64:3e:c2:8e:09:22:2f:94:83:0e:94:16:95:40 root@li182-248



cat /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa

    -----BEGIN RSA PRIVATE KEY-----
    MIIEogIBAAKCAQEA0ScMFs4YXrlijHyCbx9jAUKxmTix4EFCUq6qyr3H+y4aFeYG
    9x/BJob10o+tH0F2cUs/dvxctPXqUXgEEXX/ztu2ax78Ag0Pv15zSjTNWJQkUoHz
    b1X00R5SlnlxepFv/JqiFk37b1jhYGtIqd6Q7BiifBiVns24Oi/dWo9DvzdlXv8P
    0m97qnk7FVRxGlPrpAf1dUQwC17XAq4IcG/WJI6xP7ytCiwdtvrgacH8MQJMzIQs
    Nw7VFKqD3XVeWI7xVHP4Cm0494/XoFpgkFKdjQ3aXuXlkiV4lnF4UJsl4Ov5z322
    3xQVD2YPxAl9aGxJc+z7BoI70gqMZIDDDmT6dwIBIwKCAQEAoVii7QVjQcI2FJqQ
    gZveqTNzD8ymecvxVbnxd9Q7L3tV86LSLFpTLFl7zlGULg3tp9r2cbtddafDY2s2
    VpzbR84QYUPJuHB53MU0XdD2LmOm/dH2TpLELEqXe2T/xPPaDAJChjwoXTXvsMfK
    VygJZayamj7Z0kbtNDONgF/jzgTDLXfQ8gZJgxbRo9bXNDmBi/E6rSy8NRZyY02C
    F1yT6Sgdkjzif8Wvc6kcj+ORO9nQCgOhG5AP/+pZIUQQnaDVcCtFH4kgBYDPvpVV
    dnYy0XrPBiL2tzaGHlg/iJ8PVMkLbg5EmKzosZ+TZv81beExMBO0NUPt5Wq8UFaL
    lhneOwKBgQD9KcTLKZ6e8/z0nR99EEiGcEPY7cbevRapbUfRkSwQOLtp80oIaKMZ
    ImRsx+pNmDma3yXG+c3dhd+lTFixHvkNrPDACsK/qyE89sa2K/oRaBOPpV4DcmFU
    TVbbxB3rvJRn6FWKSFNcTwbMR2rT/+JHEIuC08NLe8lxDF43k+jT6QKBgQDTfwc/
    SSeG5qEQyb+kLqRn8CMcUauftCGZTY/2iBed44LVHRo8ppI9llxrDT7o2Wv5lIkZ
    IwF6hWutZf1VUM7h8C6u/LZZRUxd9OUMMxSpFW4O8/JDfh6l1eqWCst7mf2fh+ZF
    cgaBoTsSocWdCYKJvMMvx8WyeLa+7/41WRg/XwKBgA53alTAjLigOlce69tCwlDT
    NxO10NmHJd3LuvYIS6kn0DHwpSUNSyYB9xwork2Tq4UxUp2n3+DF0kP1u+zdMs2U
    2o6hh3iqsXEyrETskfJdt/mUa8Wuw7uspeCsHveHHmxWa0m6/XL9M5ak/spJIt99
    Scz2KGq2ncvyFAMtBf17AoGAGCvGUGAhxkY+Sw++IWRqj4kolYWtNtLCAuRK95qG
    Wy/xsfSyipaxoKN4Rr+vaxGIrs8lnHkHe7d6BTA6NaLV0K28MUFz7PH6GV3RCLVh
    cmjZYMtsJPh4h/swwLDGzEwc/EoLsCpJ4u3a3Y7UwX1uARzjG2dJy0D+8T//y5Un
    V7MCgYEAq9lVGi8JM3PuQMKiBSL8pNenmmxDd4vlS8HHB+68zLJfCblwa6sUYOnL
    ktGsUDJUw/67nRE2n0sGaBUyH1kn2QETz7VkyQMU6EL8ghRIkiEEUWyErYUa6P0S
    4Mm/54hYllmAcOPXD+W6RxrckTGzAve5iVaUrrBmq8DwVmzmJQ8=
    -----END RSA PRIVATE KEY-----


cat /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa.pub
 
    ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0ScMFs4YXrlijHyCbx9jAUKxmTix4EFCUq6qyr3H+y4aFeYG9x/BJob10o+tH0F2cUs/dvxctPXqUXgEEXX/ztu2ax78Ag0Pv15zSjTNWJQkUoHzb1X00R5SlnlxepFv/JqiFk37b1jhYGtIqd6Q7BiifBiVns24Oi/dWo9DvzdlXv8P0m97qnk7FVRxGlPrpAf1dUQwC17XAq4IcG/WJI6xP7ytCiwdtvrgacH8MQJMzIQsNw7VFKqD3XVeWI7xVHP4Cm0494/XoFpgkFKdjQ3aXuXlkiV4lnF4UJsl4Ov5z3223xQVD2YPxAl9aGxJc+z7BoI70gqMZIDDDmT6dw== root@li182-248 


PASS PUBLIC KEY TO AMAZON:

ec2-import-keypair \
--debug \
aquarius \
--public-key-file /root/base/apps/ec2/keypair/jgilbert/aquarius_rsa.pub \
-U https://ec2.amazonaws.com 

    KEYPAIR aquarius        03:b7:c5:f0:a6:e7:6b:af:3d:8a:68:ff:ec:f1:d6:05
    #KEYPAIR aquarius        08:a5:8c:fc:47:e4:9a:f4:8e:1e:e9:b6:22:aa:bb:6e



LAUNCH AQUARIUS-5 US
ING THIS KEYPAIR:

ec2-run-instances \
--key aquarius \
ami-3e19ef57 \
--instance-type t1.micro \
-z us-east-1a 

    RESERVATION     r-cb6813a1      558277860346    default
    INSTANCE        i-5c90a631      ami-3e19ef57                    pending aquarius        0      t1.micro 2010-12-13T00:17:30+0000        us-east-1a      aki-b51cf9dc    ari-b31cf9da           monitoring-disabled                                      ebs                                    paravirtual

    
</entry>
<entry [Fri 2011:07:29 05:24:17 EST] ROLL BACK FROM BAD COMMIT>

Rolling back
http://mark-kirby.co.uk/2008/using-git-and-github-on-os-x/

To revert back to the state of the last commit, enter the following:
 
git reset --hard HEAD
    
</entry>
<entry [Thu 2011:04:28 12:41:59 EST] SET UP komodo REPOSITORY ON LINODE>

1. CREATE komodo REMOTE GIT REPOSITORY ON LINODE

mkdir /srv/git/komodo
cd /srv/git/komodo
git init
    Initialized empty Git repository in .git/


2. ADD AS REMOTE REPO ON HP

git config --global user.name "Stuart Young"
git config --global user.email stuartpyoung@gmail.com

cd /home/syoung/.komodoedit/6.1/tools
git remote add linode ssh://root@173.230.142.248/srv/git/aguatest

SO THE NEW .git/config LOOKS LIKE THIS:

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
    [remote "linode"]
        url = ssh://root@173.230.142.248/srv/git/komodo
        fetch = +refs/heads/*:refs/remotes/linode/*


ENABLE SIMPLE git push

git config branch.master.remote origin
git config branch.master.merge refs/heads/master

3. PUSH FROM HP TO LINODE

cd /home/syoung/.komodoedit/6.1/tools
git push linode 

    OK


4. PULL FROM linode

mkdir -p /home/syoung/tmp/komodo
cd /home/syoung/tmp/komodo
git clone ssh://root@173.230.142.248/srv/git/komodo

    OK
    
</entry>


<entry [Thu 2011:04:28 12:41:59 EST] SET UP notes REPOSITORY ON LINODE>

1. CREATE notes REMOTE GIT REPOSITORY ON LINODE

mkdir /srv/git/notes
cd /srv/git/notes
git init
    Initialized empty Git repository in .git/


2. ADD AS REMOTE REPO ON HP

cd /home/syoung/notes
git remote add linode ssh://root@173.230.142.248/srv/git/notes

SO THE NEW .git/config LOOKS LIKE THIS:

cat .git/config

    ...
    [remote "linode"]
        url = ssh://root@173.230.142.248/srv/git/notes
        fetch = +refs/heads/*:refs/remotes/linode/*

3. PUSH FROM HP TO LINODE

cd /home/syoung/notes
git push linode master

    OK


4. PULL FROM linode

mkdir -p /home/syoung/tmp/notes
cd /home/syoung/tmp/notes
git clone ssh://root@173.230.142.248/srv/git/notes

    OK
    
</entry>


<entry [Thu 2011:04:28 12:41:59 EST] SET UP aguatest REPOSITORY ON LINODE>

LINODE IP:
ssh root@173.230.142.248

1. CREATE aguatest REMOTE GIT REPOSITORY ON LINODE

mkdir /srv/git/aguatest
cd /srv/git/aguatest
git init
    Initialized empty Git repository in .git/


2. ADD AS REMOTE REPO ON HP

cd /home/syoung/0.6/t
git remote add linode ssh://root@173.230.142.248/srv/git/aguatest

SO THE NEW .git/config LOOKS LIKE THIS:

cat .git/config

    ...
    [remote "linode"]
        url = ssh://root@173.230.142.248/srv/git/aguatest
        fetch = +refs/heads/*:refs/remotes/linode/*


3. PUSH FROM HP TO LINODE

cd /home/syoung/0.6/t
git push linode master

    OK


4. PULL FROM linode

cd /home/syoung/tmp/t
git clone ssh://root@173.230.142.248/srv/git/aguatest

    OK
    
</entry>

<entry [Thu 2011:04:28 12:41:59 EST] SET UP aguadev REPOSITORY ON LINODE>

LINODE IP:
ssh root@173.230.142.248

1. CREATE aguadev REMOTE GIT REPOSITORY ON LINODE


mkdir /srv/git/aguadev
cd /srv/git/aguadev
git init
    Initialized empty Git repository in .git/
git add .
git commit -m "empty first commit"
    nothing to commit (use "git add file1 file2" to include for commit)


2. ADD AS REMOTE REPO ON HP

cd /home/syoung/0.6
git remote add linode ssh://root@173.230.142.248/srv/git/aguadev

SO THE NEW .git/config LOOKS LIKE THIS:

cat .git/config

    [core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
    [remote "origin"]
        fetch = +refs/heads/*:refs/remotes/origin/*
        url = git@github.com:syoung/aguadev.git
    [branch "master"]
        remote = origin
        merge = refs/heads/master
    [remote "linode"]
        url = ssh://root@173.230.142.248/srv/git/aguadev
        fetch = +refs/heads/*:refs/remotes/linode/*


3. PUSH FROM HP TO LINODE

cd /home/syoung/0.6
git push linode master




4. PULL FROM linode

cd e:\0.5\tmp
git clone ssh://root@74.207.235.81/srv/git/agua

    

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



    
</entry>
<entry [Thu 2011:04:28 11:41:04 EST] RECOVER FROM CORRUPTED COMMIT - HOW TO DELETE A GIT COMMIT>

http://stackoverflow.com/questions/1338728/how-to-delete-a-git-commit

1. GET THE SHA-COMMIT-ID WITH git log

git log

commit c47b778097d54bcd5def6a9c600185c1927ffede
Author: Stuart Young < stuartpyoung@gmail.com>
Date:   Thu Apr 28 10:25:17 2011 -0400

    Removed corrupt .git-old directory

commit dc9f3a1828e748a7897d849daedb5997c6ba0605
Author: Stuart Young < stuartpyoung@gmail.com>
Date:   Thu Apr 28 10:11:21 2011 -0400

    Completed config.pl - set root mysql password, create Agua user and password

commit 9187363c588119b86308337910820b504c73ca6e
Author: Stuart Young < stuartpyoung@gmail.com>
Date:   Wed Apr 27 09:15:51 2011 -0400

    Onworking config.pl - to do: set mysql root password.

commit fcb8e0cbb11fe828e83840016f139b2c5822b660
Author: Stuart Young < stuartpyoung@gmail.com>
Date:   Tue Apr 26 04:45:15 2011 -0400


2. RESET HEAD TO THE PREVIOUS COMMIT

git reset --hard 9187363c588119b86308337910820b504c73ca6e

    OK


NOTES
-----

Assuming you are sitting on that commit, then this command will wack it...

git reset --hard HEAD~1

The HEAD~1 means the commit before head.

Or, you could look at the output of git log, find the commit id of the commit you want to back up to, and then do this:

git reset --hard < sha1-commit-id>
If you already pushed it, you will need to do a force push to get rid of it...

git push origin HEAD --force
However, if others may have pulled it, then you would be better off starting a new branch. Because when they pull, it will just merge it into their work, and you will get it pushed back up again.

If you already pushed, it may be better to use git revert, to create a "mirror image" commit that will undo the changes. However, both commits will both be in the log.

FYI -- git reset --hard HEAD is great if you want to get rid of WORK IN PROGRESS. It will reset you back to the most recent commit, and erase all the changes in your working tree and index.

Lastly, if you need to find a commit that you "deleted", it is typically present in git reflog unless you have garbage collected your repository.



1. GET THE COMMIT COUNT
git log --pretty=format:'' | wc -l
    42

AND THE SHORT SHA KEY:

git rev-parse --short HEAD
c47b778

OR:
git describe --tags

OR:
git shortlog

Stuart Young (42):
      First commit of agua 0.6 source tree
      First re-commit of agua 0.6 source tree
      Added .gitattributes containing ignore-exports to exclude files from export
      Added .gitignore for plugins dir
      Deleted jbrowse-old
      Added .gitignore for apps dir
      Removed tests dir
      Cleaned up duplicate dirs
      Edited .gitignore to exclude most files except built *.js files and related
      Expecting .gitignore settings to kick in
      Expecting .gitignore settings to kick in
      Commented out ignore 006-workflow-base
      Added test workflow-base.profile* files
      Uncommented 006-workflow-base
      Added 006-workflow-base-safe to ignored
      Removed 006-workflow-base-safe
      Completed draft workflow.html, onworking FileSelector default open workflow
      Fixed missing this.args in parameterRow's changeValue method
      onworking MooseX::Declare conversion of Agua::Monitor::SGE
      Onworking Moosification of TOPHAT.pm
      onworking refactor Monitor::SGE
      added notes.tar.gz as backup of corrupt repo
      TOPHAT.pl ok via cgi cmd. Onworking browser executeWorkflow
      Pre-discard old recheck method to find missing process id on submit
      fixed filemanager CSS - no dotted lines and proper sizing
      Removed App/* and App.pm. Onworking refactoring of Workflow.pm and Stage.pm
      Onworking executeWorkflow
      Moved Logic::Loop to Agua::Cluster::Loop. Onworking Stage to use Agua::Cluster
      Removed old cmd dir in bin/sql. Confirmed Runstages.js works OK. Onworking automation of testing Workflow combos - e.g., added getTable to Agua::Common::Base.
      Fixed bugs in Admin-Clusters pane. Implemented Agua::Stage::runLocally. Onworking Agua::Stage::runOnCluster.
      Updated package description
      Added password confirmation to Settings pane
      Fixed useradd for Ubuntu, commented out Redhat for now
      Cleaned out old files from cgi-bin after adding C workflow.cgi
      Onworking StarCluster launch instance and load balancer
      Onworking install.pl, populating required resources, added Install.pm with working CPAN installer
      Broke out 'required-perlmods.txt' from script, move Install.pm to Agua/Installer.pm
      Onworking install.pl, added more file resources - envvars, sites-available/default
      Onworking install.pl, final step: install mysql.
      Onworking config.pl - to do: set mysql root password.
      Completed config.pl - set root mysql password, create Agua user and password
      Removed corrupt .git-old directory

root (1):
      Added .gitignore for builds dir


2. START AN INTERACTIVE REBASE IN THE EDITOR

GOOD EXAMPLES
http://www.kernel.org/pub/software/scm/git/docs/git-rebase.html
REPLACE pick WITH edit TO STOP APPLYING AFTER THAT COMMIT 

git rebase --interactive HEAD~40

    pick be0aaf7 Added .gitattributes containing ignore-exports to exclude files from export
    pick 5a93d86 Added .gitignore for plugins dir
    pick 12579a5 Deleted jbrowse-old
    pick b89f07c Added .gitignore for apps dir
    pick 75320f0 Removed tests dir
    pick 1f7124c Cleaned up duplicate dirs
    pick bc57722 Edited .gitignore to exclude most files except built *.js files and related
    pick 9cd58b6 Expecting .gitignore settings to kick in
    pick 237cb9b Expecting .gitignore settings to kick in
    pick 73e62c4 Commented out ignore 006-workflow-base
    pick 1f7698d Added test workflow-base.profile* files
    pick 8fd077b Uncommented 006-workflow-base
    pick 67bd81c Added 006-workflow-base-safe to ignored
    pick a618f79 Removed 006-workflow-base-safe
    pick bf62871 Completed draft workflow.html, onworking FileSelector default open workflow
    pick 943c0be Fixed missing this.args in parameterRow's changeValue method
    pick 5fa7528 onworking MooseX::Declare conversion of Agua::Monitor::SGE
    pick 5ecf230 Onworking Moosification of TOPHAT.pm
    pick c625a4f onworking refactor Monitor::SGE
    pick d3b5750 added notes.tar.gz as backup of corrupt repo
    pick f17e454 TOPHAT.pl ok via cgi cmd. Onworking browser executeWorkflow
    pick 942e257 Pre-discard old recheck method to find missing process id on submit
    pick 8f11d71 fixed filemanager CSS - no dotted lines and proper sizing
    pick d6681b5 Removed App/* and App.pm. Onworking refactoring of Workflow.pm and Stage.pm
    pick 4fc605b Onworking executeWorkflow
    pick 585eda5 Moved Logic::Loop to Agua::Cluster::Loop. Onworking Stage to use Agua::Cluster
    pick 5d71770 Removed old cmd dir in bin/sql. Confirmed Runstages.js works OK. Onworking automation of testing Workflow combos - e.g., added getTable to Agua::Common::Base.
    pick 2dfd6a5 Fixed bugs in Admin-Clusters pane. Implemented Agua::Stage::runLocally. Onworking Agua::Stage::runOnCluster.
    pick 7dac5db Updated package description
    pick f1502da Added password confirmation to Settings pane
    pick 5511978 Fixed useradd for Ubuntu, commented out Redhat for now
    pick 7bab7ee Cleaned out old files from cgi-bin after adding C workflow.cgi
    pick d4f12a9 Onworking StarCluster launch instance and load balancer
    pick b300dea Onworking install.pl, populating required resources, added Install.pm with working CPAN installer
    pick f995985 Broke out 'required-perlmods.txt' from script, move Install.pm to Agua/Installer.pm
    pick 3eb5d9c Onworking install.pl, added more file resources - envvars, sites-available/default
    pick fcb8e0c Onworking install.pl, final step: install mysql.
    pick 9187363 Onworking config.pl - to do: set mysql root password.
    pick dc9f3a1 Completed config.pl - set root mysql password, create Agua user and password
    pick c47b778 Removed corrupt .git-old directory
    
    # Rebase 0322e88..c47b778 onto 0322e88
    #
    # Commands:
    #  p, pick = use commit
    #  r, reword = use commit, but edit the commit message
    #  e, edit = use commit, but stop for amending
    #  s, squash = use commit, but meld into previous commit
    #  f, fixup = like "squash", but discard this commit's log message
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    # However, if you remove everything, the rebase will be aborted.



By replacing the command "pick" with the command "edit", you can tell git rebase to stop after applying that commit, so that you can edit the files and/or the commit message, amend the commit, and continue rebasing.

If you just want to edit the commit message for a commit, replace the command "pick" with the command "reword".

If you want to fold two or more commits into one, replace the command "pick" for the second and subsequent commits with "squash" or "fixup". If the commits had different authors, the folded commit will be attributed to the author of the first commit. The suggested commit message for the folded commit is the concatenation of the commit messages of the first commit and of those with the "squash" command, but omits the commit messages of commits with the "fixup" command.

git rebase will stop when "pick" has been replaced with "edit" or when a command fails due to merge errors. When you are done editing and/or resolving conflicts you can continue with git rebase --continue.

For example, if you want to reorder the last 5 commits, such that what was HEAD~4 becomes the new HEAD. To achieve that, you would call git rebase like this:



git rebase --interactive COMMIT_ID
COMMIT_ID should be the one BEFORE you want to fiddle with




git rev-parse HEAD
or

git rev-parse --verify HEAD


Sidenote: If you want to turn references (branches and tags) into SHA-1, there is git-show-ref and git-for-each-ref.

    
</entry>

<entry [Fri 2011:04:15 14:07:02 EST] GET BUILD NUMBER WITH git describe --tags>

cd ~/0.6
git describe

    fatal: No annotated tags can describe '5d71770b68573c185c29f552f6f2fa51f96a0096'.
    However, there were unannotated tags: try --tags.

git describe --tags

    0.6-29-g5d71770

    
</entry>

