git.quickref


git filter-branch --index-filter \
'git rm --cached --ignore-unmatch agua/keypair/syoung/aquarius8/id_rsa' \
--tag-name-filter cat -- --all
rm -Rf .git/refs/original       # careful
git gc --aggressive --prune=now # danger


<entry [Mon 2015:08:10 21:39:13 EST] LIST FILES CHANGED IN RECENT COMMITS>

git log --name-status -10 path/to/dir

shows the file status:

Added (A), Copied (C), Deleted (D), Modified (M), Renamed (R), and others.

OPTIONS:

-10 refers to the past 10 commits
-p will give you the full patch
--stat (numbers of changed lines
--numstat (like --stat but machine-readable)
--name-only (just the filenames).
    
</entry>
<entry [Sat 2015:08:08 08:28:46 EST] FIND STRING IN PREVIOUS COMMITS>

git grep -l --all-match -e "getSubroutine"

    
</entry>
<entry [Thu 2014:12:18 18:13:22 EST] WORKFLOW TO MOVE ALL RECENT CHANGES TO A DEV BRANCH>

1. STASH CHANGES AND CREATE dev BRANCH

git stash save changes
git checkout -b dev
git fetch origin dev


2. REVERT master AND dev

git checkout master
gitlog
git reset --hard d6affea
git checkout dev
gitlog
git reset --hard d6affea


3. CREATE BRANCH dev-leftshift

git checkout -b dev-leftshift


4. POP STASH AND SAVE INTO dev-leftshift

git stash pop
gitadd
gitcom


5. PUSH dev-leftshift TO REMOTE

gitadd
gitcom
git push -u origin dev-leftshift

	
</entry>
<entry [Thu 2014:12:18 18:04:31 EST] CLONE ADDITIONAL BRANCHES OF REPO>

1. CLONE MASTER

git clone ssh://git@stash.cyphergenomics.com:7999/man/capdgen.git


2. CREATE dev BRANCH

git checkout -b dev


3. FETCH RELEASE BRANCH

git fetch origin dev

	OK

</entry>
<entry [Thu 2014:12:18 18:02:59 EST] CLONE SINGLE BRANCH OF REPO>

git clone ssh://git@stash.cyphergenomics.com:7999/man/cap.git \
--branch dev \
--single-branch dev
	
</entry>
<entry [Thu 2014:12:18 15:53:30 EST] SHOW CONFLICTS ONLY>

git diff --name-only --diff-filter=U

	
</entry>
<entry [Sat 2014:08:09 09:14:23 EST] ATLASSIAN GIT WORKFLOWS>

https://www.atlassian.com/git/workflows/?utm_source=stackoverflow&utm_medium=display&utm_campaign=git-theme_git-workflows&utm_content=gitmicro_en_GitflowFeatureBranchForking_728x90

	
</entry>
<entry [Sat 2014:08:09 09:11:38 EST] FIND A DELETED FILE WITH UNKNOWN FILEPATH>

Get a list of the deleted files and copy the full path of the deleted file

git log --diff-filter=D --summary | grep delete
Execute the next command to find commit id of that commit and copy the commit id

git log --all -- FILEPATH
Show diff of deleted file

git show COMMIT_ID -- FILE_PATH
Remember, you can write output to a file using > like

git show COMMIT_ID -- FILE_PATH > deleted.diff
	

	
</entry>
<entry [Sat 2014:08:09 08:59:19 EST] FIND A DELETED FILE WITH KNOWN FILEPATH>

1. IF YOU KNOW THE FILE PATH

# git log --all -- PATH/TO/FILE

E.G., Manager.pm

cd /agua
git log --all -- lib/Queue/Manager.pm
	
	commit 17546423b59c88e8189fb2161b59d13ac8ee03c1
	Author: Stuart Young < stuartpyoung@gmail.com>
	Date:   Mon May 5 20:34:42 2014 -0700
	
		-Mov bin/daemon,bin/install/resources/agua,lib/Queue: Moved manager -> maste
	
	commit 78c80493b856ea742f5c8333af60b81ad8699a36
	Author: Stuart Young < stuartpyoung@gmail.com>
	Date:   Mon May 5 11:21:41 2014 -0700
	
		[0.8.0-beta.1+build.40] Enabled job scheduler and feedback reporting channel
	
	commit 94cd6d8351542aa7980d7af49c286dce5337117c
	Author: Stuart Young < stuartpyoung@gmail.com>
	Date:   Mon May 5 05:23:38 2014 -0700
	
		-Inc bin/sql/provenance.sql,lib,t/unit/bin/Queue/Task: Enabled all automated
	


USE git checkout TO RETRIEVE Manager.pm

mkdir lib/Exchange
git checkout 78c80493b856ea742f5c8333af60b81ad8699a36 -- lib/Queue/Manager.pm 
mv lib/Queue/Manager.pm lib/Exchange

NB: git show WILL ONLY PROVIDE THE DIFF

git show 78c80493b856ea742f5c8333af60b81ad8699a36 -- lib/Queue/Manager.pm 

	commit 78c80493b856ea742f5c8333af60b81ad8699a36
	Author: Stuart Young < stuartpyoung@gmail.com>
	Date:   Mon May 5 11:21:41 2014 -0700
	
		[0.8.0-beta.1+build.40] Enabled job scheduler and feedback reporting channels
	
	diff --git a/lib/Queue/Manager.pm b/lib/Queue/Manager.pm
	index 20237eb..9c13d77 100644
	--- a/lib/Queue/Manager.pm
	+++ b/lib/Queue/Manager.pm
	@@ -195,6 +195,19 @@ method handleTopic ($json) {
		my $data = $self->jsonparser()->decode($json);
		#$self->logDebug("data", $data);
	 
	+	my $mode =	$data->{mode};
	+	$self->logDebug("mode", $mode);
	+	
	+	if ( $mode eq "hostStatus" ) {
	+		$self->updateHostStatus($data);
	+	}
	+	else {
	+		$self->updateTaskStatus($data);
	+	}
	+}
	+


This should show a list of commits in all branches which touched that file. Then, you can find the version of the file you want, and display it with...

git show TREEISH -- PATH/TO/FILE

(or restore it into your working copy with git checkout TREEISH -- PATH/TO/FILE)
	

</entry>
<entry [Fri 2014:07:25 10:48:15 EST] REMOVE A BIG FILE FROM THE LAST github COMMIT>

git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch HUGEFILE' --prune-empty --tag-name-filter cat -- --all
git commit --amend -CHEAD
git push


</entry>
<entry [Thu 2014:02:13 21:45:11 EST] FIXED CAN'T PULL FROM REMOTE>

http://stackoverflow.com/questions/10067930/why-is-git-is-rejecting-my-pull-simply-because-i-have-a-commit-on-my-local-branc


PROBLEM

git pull git masterFrom github.com:syoung/annai
	* branch            master     -> FETCH_HEAD
   Already up-to-date.

git pull git master:master
	From github.com:syoung/annai
	 ! [rejected]        master     -> master  (non-fast-forward)


SOLUTION

git pull git master:temp
	From github.com:syoung/annai
	 * [new branch]      master     -> temp
	Already up-to-date.

git branch
	* master
	  temp

git merge temp
	Already up-to-date.

git push origin master:master
	
</entry>
<entry [Thu 2014:02:13 20:07:06 EST] COUNT NUMBER OF OBJECTS>

git count-objects -v

	
</entry>
<entry [Wed 2014:02:12 23:38:45 EST] REMOVE A FILE FROM A PREVIOUS COMMIT>

EXAMPLE:


git filter-branch --index-filter \
'git rm --cached --ignore-unmatch projects/hitachi/bladder/metadata.xml' \
--tag-name-filter cat -- --all
rm -Rf .git/refs/original       # careful
git gc --aggressive --prune=now # danger




1. BACKUP REPO

cp -r repo repo.bkp


2. REMOVE FILE FROM ALL PREVIOUS COMMITS

git filter-branch --index-filter \
'git rm --cached --ignore-unmatch path/to/mylarge_50mb_file' \
--tag-name-filter cat -- --all

3. DELETE BACKUPS TO DECREASE FILE SIZE

filter-branch keeps backups too, so the size of the repo won't decrease immediately unless you expire the reflogs and garbage collect:

rm -Rf .git/refs/original       # careful
git gc --aggressive --prune=now # danger

	
</entry>
<entry [Thu 2014:01:16 19:02:56 EST] AMEND COMMIT WITH NAME OF AUTHOR>

If the identity used for this commit is wrong, you can fix it with:

    git commit --amend --author='Your Name < you@example.com>'


OR:

git config --global user.name "Your Name"
git config --global user.email you@example.com


	
</entry>
<entry [Wed 2013:10:23 18:50:13 EST] USE reset TO FIX GIT ERROR: "error: unable to index file">

1. MOVE FILE/DIR OUT

mv html/t ..


2. RESET FILE/DIR

git reset html/t


3. REMOVE FILE/DIR

git rm -fr html/t


4. MOVE FILE/DIR BACK

mv ../t html


5. RE-ADD TO GIT

git add html/t
git commit html/t

</entry>
<entry [Mon 2013:06:24 04:31:57 EST]  SEARCH FOR FILES IN PREVIOUS COMMITS>


git ls-files "*hub-remove.tsv"

git ls-files | grep 'name you're looking for'


</entry>
<entry [Thu 2013:02:07 04:14:03 EST] DIFF SINGLE FILE IN STASH>

A stash is represented as a commit whose tree records the state of the working directory, and its first parent is the commit at HEAD when the stash was created.

So you can treat stash (e.g. stash@{0} is first / topmost stash) as a merge commit, and use:

<!--

git diff stash@{0}^1 stash@{0} -- <filename>

-->

Explanation: stash@{0}^1 shortcut means first parent of given stash, which as stated in explanation above is commit at which changes were stashed away. We use this form of "git diff" (with two commits) because stash@{0} / refs/stash is a merge commit, and we have to tell git which parent we diff againts. More cryptic:

<!--

git diff stash@{0}^! -- <filename>

-->
should also work (see git rev-parse manpage for explanation of rev^! syntax, in "Specifying ranges" section).


    
</entry>
<entry [Thu 2013:02:07 04:13:35 EST] CHECKOUT SINGLE FILE FROM STASH>


git show stash@{0}:html/plugins/files/TitlePane.js > newfile

OR

git checkout stash@{0} -- html/plugins/files/TitlePane.js


you can use git checkout to check a single file out of the stash:

<!--

git checkout stash@{0} -- <filename>

-->
or to save it under another filename:

<!--

git show stash@{0}:<full filename>  >  <newfile>


(note that here <full filename> is full pathname of a file relative to top directory of a project (think: relative to stash@{0})).

-->    

</entry>
<entry [Sat 2012:11:17 23:54:58 EST] RENAME A TAG>


git checkout old
git tag new
git tag -d old
git push origin :refs/tags/old

    
</entry>
<entry [Sat 2012:10:27 11:15:32 EST] BASH FUNCTION TO SET ALL GIT REMOTES AT ONCE>

#!/bin/sh

#### AUTOMATE REPO GENERATION
doRepos () {
    user=${1}
#    echo "doRepos    user: $user"

    #### CHECK IS ROOT USER IF username IS AGUA
    if [ $whoami != "root" ] && [ $user = "agua" ]; then
        echo "doRepos    Must be 'root' to clone agua repos. Returning"
        return;
    fi

    repos=(agua aguatest aguatestdev bioapps bioappsdev biorepo biorepodev starcluster starclusterdev)

    for repo in ${repos[@]};
    do
        #### CLONE IT
        if [ -d $repo ]; then
            echo "clone    Repo exists already: $repo"
            echo "clone    Skipping clone"
            continue
        fi

        clone $user $repo;
        remote $user $repo;
    done;
}

clone () {
    user=${1}
    repo=${2}
#    echo "clone    user: $user"
#    echo "clone    repo: $repo"    

    whoami=`whoami`

    #### CHECK IS ROOT USER IF username IS AGUA
    if [ $whoami != "root" ] && [ $user = "agua" ]; then
        echo "clone    Must be 'root' to clone agua repos. Returning"
        return;
    fi
    
    #### SKIP IF DIRECTORY ALREADY EXISTS
    if [ -d $repo ]; then
        echo "clone    Repo exists already: $repo"
        echo "clone    Skipping clone"
        return
    fi

    #### CLONE IT
    echo "git clone 'git@github.com:$user/$repo'"
    git clone "git@github.com:$user/$repo"
}

remote () {
    user=${1}
    repo=${2}
#    echo "remote user: $user"
#    echo "remote repo: $repo"

    #### SKIP IF DIRECTORY IS MISSING
    if [ ! -d $repo ]; then
        echo "clone    Can't find repo: $repo"
        echo "clone    Skipping set remotes"
        return
    fi

    #### CHECK IS ROOT USER IF username IS AGUA
    if [ $whoami != "root" ] && [ $user = "agua" ]; then
        echo "remote    Must be 'root' to clone agua repos. Returning"
        return;
    fi

    #### UP DIR
    echo "cd $repo"
    cd $repo

    #### REMOVE ORIGIN
    echo "git remote rm origin"
    git remote rm origin

    if [ $user = "agua" ]; then

        #echo "remote    CHECKING USER AGUA";

        #### SPECIAL CASES: STARCLUSTER AND STARCLUSTERDEV
        if [ $repo = "starclusterdev" ]; then
            echo "git remote add github git@github.com:agua/StarClusterDev"
            git remote add github "git@github.com:agua/StarClusterDev"
            echo "git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/starclusterdev"
            git remote add lin "ssh://root@173.230.142.248/srv/git/public/agua/starclusterdev"
            echo "git remote add bit ssh://git@bitbucket.org/aguadev/starclusterdev.git"
            git remote add bit "ssh://git@bitbucket.org/aguadev/starclusterdev.git"
        elif [ $repo = "starcluster" ]; then
            echo "git remote add github git@github.com:agua/StarCluster"
            git remote add "github git@github.com:agua/StarCluster"
            echo "git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/starcluster"
            git remote add "lin ssh://root@173.230.142.248/srv/git/public/agua/starcluster"
            echo "git remote add bit ssh://git@bitbucket.org/agua/starcluster.git"
            git remote add bit "ssh://git@bitbucket.org/agua/starcluster.git"
        else
            echo "git remote add github git@github.com:agua/$repo"
            echo "git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/$repo"
            echo "git remote add bit ssh://git@bitbucket.org/aguadev/$repo.git"
            git remote add github "git@github.com:agua/$repo"
            git remote add lin "ssh://root@173.230.142.248/srv/git/public/agua/$repo"
            git remote add bit "ssh://git@bitbucket.org/aguadev/$repo.git"
        fi

    elif [ $user = "syoung" ]; then

        #echo "remote    CHECKING USER SYOUNG";

        echo "git remote add bit ssh://git@bitbucket.org/stuartpyoung/$repo.git"
        git remote add bit "ssh://git@bitbucket.org/stuartpyoung/$repo.git"
        echo "git remote add github git@github.com:syoung/$repo"
        git remote add github "git@github.com:syoung/$repo"
        echo "git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/$repo"
        git remote add lin "ssh://root@173.230.142.248/srv/git/private/syoung/$repo"
        
    fi

    #### DOWN DIR
    echo "cd .."
    cd ..
}        

#### SET REMOTES ONLY (NO CLONE)
remotes () {
    user=${1}
    echo "remotes user: $user"
    if [ ! $user ]; then
        echo "user not defined. Returning"
        return;
    fi

    repos=(agua aguadev aguatest aguatestdev bioapps bioappsdev biorepo biorepodev starcluster starclusterdev)

    for repo in ${repos[@]};
    do
        remote $user $repo;
    done;
}

#### TO DO:
#
#runCommand() {}
#
#isRoot () {
#    echo "DOING isRoot"
#    whoami=`whoami`
#    echo "whoami: $whoami"
#    if [ $whoami != "root" ] && [ $user = "agua" ]; then
#        return 1;
#    fi
#    
#    return 0;
#}


    
</entry>
<entry [Thu 2012:10:25 02:58:49 EST] USE EMACS AS DEFAULT EDITOR>

git config core.editor "emacs -nw" --global

    
</entry>
<entry [Sat 2012:10:13 05:01:34 EST] GET TAGS BY DATE>


gittags() { git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags; }

    
</entry>
<entry [Sat 2012:10:13 03:08:20 EST] GIT TIPS - git diff>

http://mislav.uniqpath.com/2010/07/git-tips/


# Diff by highlighting inline word changes instead of whole lines
git diff --word-diff


    
</entry>
<entry [Sat 2012:10:13 03:03:17 EST] MERGE TO master FROM BRANCH AND OVERWRITE FILES>

git checkout master
git merge -X theirs BRANCH


OR

git merge -s recursive -X theirs agua

    
</entry>
<entry [Sat 2012:10:13 02:52:40 EST] FIND OUT WHAT BRANCH YOU ARE ON: 'git symbolic-ref --short -q HEAD'>

git symbolic-ref --short -q HEAD
    
    refs/heads/master


- This won't return anything at all if you are detached.
- Omit the -q to get an error when detached.


OR:

git rev-parse --symbolic-full-name --abbrev-ref HEAD

if you currently aren't on a branch, it simply replies with "HEAD".

    
</entry>
<entry [Mon 2012:09:24 02:42:38 EST] RESET AUTHOR/EMAIL>

git config --global user.name "Stuart Young"
git config --global user.email aguadev@gmail.com

</entry>
<entry [Mon 2012:08:20 23:40:39 EST] OAUTH TOKEN COMMANDS>

CREATE login.txt LOGIN FILE
em login.txt
    user = syoung:XXXXXXX
chmod 600 login.txt

GET AUTHORISATIONS
curl -K login.txt https://api.github.com/authorizations

CREATE OAUTH TOKENS WITH PASSWORD
curl -K login.txt https://api.github.com/authorizations -d '{"scopes":["repo, delete_repo"], "note":"agua3"}'


CREATE curl.txt OAUTH TOKEN FILE
em curl.txt
    header = "Authorization: token ded526622a10cfaaea0134662696b748ff666696"
chmod 600 curl.txt

SET OAUTH TOKEN SCOPE
curl -K curl.txt https://api.github.com/authorizations/387886 -X PATCH --data '{"scopes":["public_repo"]}'

CHANGE OAUTH TOKEN NAME
curl -K curl.txt https://api.github.com/authorizations/387886 -X PATCH --data "{\"note\":\"public\"}"

    
</entry>
<entry [Sat 2012:07:14 17:27:28 EST] DELETE MULTIPLE REMOTE TAGS>

LOCAL DELETE
git tag -d 0.7.5+build6

REMOTE DELETE
git push github :refs/tags/0.7.5+build6

GET REMOTE TAGS
curl -K curl.txt https://api.github.com/repos/syoung/aguatestdev/tags

BASH PARSE JSON

curl -s -K curl.txt https://api.github.com/repos/syoung/aguatestdev/tags |  grep name

55 LINES:
    "name": "12.0.0-rc.1"
    "name": "9.0.0"
    "name": "4.0.0-rc.1"

curl -s -K curl.txt https://api.github.com/repos/syoung/aguatestdev/tags |  grep name | sed -e 's/name":/''/g' 

55 LINES:
    " "1.1.1"
    " "1.1.0"
    " "1.0.0"
    " "6.0.0-rc.1"

curl -s -K curl.txt https://api.github.com/repos/syoung/aguatestdev/tags |  grep name | sed -e 's/name":/''/g' | sed -e 's/"/''/g'
     1.1.1
     1.1.0
     1.0.0

REMOVE LEADING WHITESPACE:

curl -s -K /agua/curl.txt https://api.github.com/repos/syoung/aguatestdev/tags |  grep name | sed -e 's/name":/''/g' | sed -e 's/"/''/g' | sed 's/ /''/g'

8.0.0-rc.1
4.0.0-alpha.1
6.0.0-beta.1


GET ALL TAGS **NOT** BEGINNING WITH '0':

curl -s -K /agua/curl.txt https://api.github.com/repos/syoung/aguatestdev/tags |  grep name | sed -e 's/name":/''/g' | sed -e 's/"/''/g' | sed 's/ /''/g' | egrep -v -e "^0"

11.1.1+build.1
1.1.1+build.1
1.0.0


COMBINE WITH XARGS TO REMOVE ALL TAGS NOT BEGINNING WITH 0:

mkdir /tmp/t
cd /tmp/t
git init

curl -s -K /agua/curl.txt https://api.github.com/repos/syoung/aguatestdev/tags |  grep name | sed -e 's/name":/''/g' | sed -e 's/"/''/g' | sed 's/ /''/g' | egrep -v -e "^0" | xargs -L1 -ITAG git push git@github.com:syoung/aguatestdev :refs/tags/TAG


    OK
    
    
SHOW REMAINING TAGS

curl -s -K /agua/curl.txt https://api.github.com/repos/syoung/aguatestdev/tags |  grep name | sed -e 's/name":/''/g' | sed -e 's/"/''/g' | sed 's/ /''/g' 
0.8.0-alpha.1+build7
0.8.0-alpha+build9
0.8.0-alpha+build10




    
</entry>
<entry [Fri 2012:06:29 18:54:12 EST] VISUAL GIT GUIDE>

http://marklodato.github.com/visual-git-guide/index-en.html

    
</entry>
<entry [Fri 2012:04:27 22:35:40 EST] git checkout AND git status OUTPUT FORMAT>

man git-status:

M = modified
A = added
D = deleted
R = renamed
C = copied
U = updated but unmerged
    
</entry>
<entry [Fri 2012:04:27 22:17:44 EST] GIT STASH USAGE EXAMPLE>

# ... hack hack hack ...
$ git stash
$ edit emergency fix
$ git commit -a -m "Fix in a hurry"
$ git stash pop
# ... continue hacking ...

    
</entry>
<entry [Fri 2012:02:24 17:35:39 EST] GIT LOG --date EXAMPLES>

git log --date

...
--date=(relative|local|default|iso|rfc|short|raw)

    Only takes effect for dates shown in human-readable format, such as when using "--pretty".
    
    'log.date' config variable sets a default value for log command’s --date option.


    --date=relative shows dates relative to the current time, e.g. "2 hours ago".

    --date=local shows timestamps in user’s local timezone.

    --date=iso (or --date=iso8601) shows timestamps in ISO 8601 format.

    --date=rfc (or --date=rfc2822) shows timestamps in RFC 2822 format, often found in E-mail messages.

    --date=short shows only date but not time, in YYYY-MM-DD format.

    --date=raw shows the date in the internal raw git format %s %z format.

    --date=default shows timestamps in the original timezone (either committer’s or author’s).


There is no built-in way that I know of to create a custom format, but you can do some shell magic.

timestamp=`git log -n1 --format="%at"`
my_date=`perl -e "print scalar localtime ($timestamp)"
git -n1 --pretty=format:"Blah-blah $my_date"
link|improve this answer
answered Oct 21 '11 at 18:26


</entry>
<entry [Fri 2012:02:24 17:33:22 EST] git loG EXAMPLES>

git log --no-merges
    Show the whole commit history, but skip any merges

git log v2.6.12.. include/scsi drivers/scsi
    Show all commits since version v2.6.12 that changed any file in the include/scsi or drivers/scsi subdirectories

git log --since="2 weeks ago" -- gitk
    Show the changes during the last two weeks to the file gitk. The "--" is necessary to avoid confusion with the branch named gitk

git log --name-status release..test
    Show the commits that are in the "test" branch but not yet in the "release" branch, along with the list of paths each commit modifies.

git log --follow builtin-rev-list.c
    Shows the commits that changed builtin-rev-list.c, including those commits that occurred before the file was given its present name.

git log --branches --not --remotes=origin
    Shows all commits that are in any of local branches but not in any of remote-tracking branches for origin (what you have that origin doesn’t).

git log master --not --remotes=*/master
    Shows all commits that are in local master but not in any remote repository master branches.

git log -p -m --first-parent
    Shows the history including change diffs, but only from the "main branch" perspective, skipping commits that come from merged branches, and
    showing full diffs of changes introduced by the merges. This makes sense only when following a strict policy of merging all topic branches when
    staying on a single integration branch.

    
</entry>
<entry [Wed 2012:02:22 14:50:28 EST] FIXED 'refusing to update' ERROR ON LINODE>

PROBLEM:

remote: error: refusing to update checked out branch: refs/heads/master


SOLUTION:

git config --bool core.bare true



</entry>
<entry [Wed 2012:02:22 14:50:04 EST] SET github AND master TO ENABLE SIMPLE git push>

ENABLE SIMPLE COMMAND 'git push' TO GITHUB

git push -u github master

OR

git config branch.master.remote github;
git config branch.master.merge refs/heads/master

</entry>
<entry [Tue 2012:02:21 14:32:08 EST] REMOVE REMOTE TAG>

git tag -d 0.7.5+build6
git push github :refs/tags/0.7.5+build6

    
</entry>

