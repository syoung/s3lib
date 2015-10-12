git




<entry [Sat 2015:08:29 10:01:30 EST] DELETED agua2 FROM GITHUB agua ACCOUNT>

agua2
7c:7e:58:40:1d:52:52:34:4b:d0:5e:e9:a2:2d:43:8e

    
</entry>
<entry [Sat 2015:08:29 09:51:13 EST] ADDED siphon1 KEY TO BITBUCKET dnaseq AND GITHUB aguadev>

1. CREATED siphon1

inova/keys/siphon/siphon1/id_rsa

2. ADDED TO dnaseq/data/sh/userdata.sh

3. ADDED AS DEPLOY KEY TO bitbucket AND github

git clone git@bitbucket.org:stuartpyoung/dnaseq
git clone git@github.com:syoung/aguadev


TO DO:

    1. ADD < SSHKEY > PORTION TO userdata.sh TEMPLATE
    
    2. ADD LOGIC IN Virtual::Aws::printUserDataFile TO LOOKUP aws:KEYFILE IN config.yaml
    
    3. IF KEYFILE, PRESENT REPLACE < SSHKEY > WITH
    
        #### CREATE PRIVATE KEY FILE
        FILE=/root/.ssh/id_rsa
        echo "Creating id_rsa file: $FILE"
        rm -fr $FILE
        cat <<EOT >> $FILE
        -----BEGIN RSA PRIVATE KEY-----
        ...
        -----END RSA PRIVATE KEY-----
        EOT
        chmod 400 $FILE
    
    4. PLACE THE ABOVE CODE IN A FUNCTION

    
</entry>
<entry [Sat 2015:08:29 08:51:59 EST] ADDED KEYS agua3, aguadev2 AND aguadev3>

agua3
Github - agua SSH key

TO COMMIT:
source ~/notes/backup/bash/functions/common.sh
source ~/notes/backup/bash/functions/sshkey.sh

aguadev2
Github - aguadev SSH key

aguadev3
Github - Deploy key on aguadev/biorepository



</entry>
<entry [Tue 2015:02:17 11:20:01 EST] REMOVE LARGE FILES FROM PREVIOUS COMMITS>

https://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/

http://stackoverflow.com/questions/1904860/how-to-remove-unreferenced-blobs-from-my-git-repo


1. BACKUP REPO

cp -r cytools cytools.bkp


2. RUN git gc (CLEANUP)

git gc


3. CREATE SCRIPT TO FIND LARGE FILES

cd ~/cytools
emacs bin/gitbigfiles.sh

	#!/bin/bash
	#set -x 
	 
	# Shows you the largest objects in your repo's pack file.
	# Written for osx.
	#
	# @see https://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/
	# @author Antony Stubbs
	 
	# set the internal field spereator to line break, so that we can iterate easily over the verify-pack output
	IFS=$'\n';
	 
	# list all objects including their size, sort by size, take top 10
	objects=`git verify-pack -v .git/objects/pack/pack-*.idx | grep -v chain | sort -k3nr | head`
	 
	echo "All sizes are in kB's. The pack column is the size of the object, compressed, inside the pack file."
	 
	output="size,pack,SHA,location"
	for y in $objects
	do
		# extract the size in bytes
		size=$((`echo $y | cut -f 5 -d ' '`/1024))
		# extract the compressed size in bytes
		compressedSize=$((`echo $y | cut -f 6 -d ' '`/1024))
		# extract the SHA
		sha=`echo $y | cut -f 1 -d ' '`
		# find the objects location in the repository tree
		other=`git rev-list --all --objects | grep $sha`
		#lineBreak=`echo -e "\n"`
		output="${output}\n${size},${compressedSize},${other}"
	done
	 
	echo -e $output | column -t -s ', '


4. RUN SCRIPT

cd ~/cytools
bin/gitbigfiles.sh

	All sizes are in kB's. The pack column is the size of the object, compressed, inside the pack file.
	y:  5ea1d92102bf4ebc60deacb72e097c7c61b2351c blob   7067930 754552 20922
	rawsize:  7067930
	y:  37c606daa1fb8181eb88fce4d271a9d5020ab09d blob   73728 10334 10159
	rawsize:  73728
	y:  10e51acff4a2d6b8b2521a2374f03c2bb6d2768e blob   8017 2471 5703
	rawsize:  8017
	y:  dbe9fded74b411a45929b84015537859e39518c1 blob   4072 1271 3187
	rawsize:  4072
	y:  0a49b4266648189e8397597ec521ac97c90ce89a blob   3598 1245 4458
	rawsize:  3598
	y:  4532dfdcc05b9477bc2cc73204ba9fc487bdeb06 blob   2553 918 777150
	rawsize:  2553
	y:  6ef2a626ffd3cd784184a1d382dc4cc39d08f45f blob   2453 962 1781
	rawsize:  2453
	y:  a17f2e5fa4257a3424490a5231e15d310aae543f blob   1927 410 8643
	rawsize:  1927
	y:  3238ec43c933ef0fa4cd65d9d9db63b97fb344a8 blob   1901 544 9355
	rawsize:  1901
	y:  3f9f07e0d654fddd59fa316fa9b6ecd5846c5e9b blob   1844 858 775474
	rawsize:  1844
	size  pack  SHA                                       location
	6902  736   5ea1d92102bf4ebc60deacb72e097c7c61b2351c  t/unit/bin/Profiler/outputs/test.log
	72    10    37c606daa1fb8181eb88fce4d271a9d5020ab09d  t/unit/bin/Profiler/inputs/leftshift.prof
	7     2     10e51acff4a2d6b8b2521a2374f03c2bb6d2768e  lib/VCFTools.pm
	3     1     dbe9fded74b411a45929b84015537859e39518c1  lib/Profiler.pm
	3     1     0a49b4266648189e8397597ec521ac97c90ce89a  lib/TestUtil.pm
	2     0     4532dfdcc05b9477bc2cc73204ba9fc487bdeb06  t/unit/lib/Test/Profiler.pm
	2     0     6ef2a626ffd3cd784184a1d382dc4cc39d08f45f  bin/seekseq.py
	1     0     a17f2e5fa4257a3424490a5231e15d310aae543f  t/unit/bin/Profiler/inputs/cold-collapse_variant.txt
	1     0     3238ec43c933ef0fa4cd65d9d9db63b97fb344a8  t/unit/bin/Profiler/inputs/hot-get_next_lines.txt
	1     0     3f9f07e0d654fddd59fa316fa9b6ecd5846c5e9b  t/unit/bin/Profiler/test.t


5. REMOVE LARGE FILES FROM PREVIOUS COMMITS

VERIFY FILE IS INCLUDED

cd /mnt/repos/private/syoung/cytools
git ls-files t/unit/bin/Profiler/outputs/test.log
t/unit/bin/Profiler/outputs/test.log

git filter-branch --index-filter \
'git rm --cached --ignore-unmatch t/unit/bin/Profiler/outputs/test.log' \
--tag-name-filter cat -- --all

DELETE BACKUPS TO DECREASE FILE SIZE
filter-branch keeps backups too, so the size of the repo won't decrease immediately unless you expire the reflogs and garbage collect:

rm -Rf .git/refs/original       # careful
git gc --aggressive --prune=now # danger


VERIFY FILE IS REMOVED

git ls-files t/unit/bin/Profiler/outputs/test.log
	EMPTY


6. IF UNREFERENCED BLOBS ARE PRESENT, RUN git gc TO REMOVE THEM

git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 -c gc.rerereresolved=0 \
-c gc.rerereunresolved=0 -c gc.pruneExpire=now gc "$@"


THEN RERUN SCRIPT TO VERIFY BLOBS ARE GONE

	
</entry>
<entry [Tue 2015:02:17 10:24:11 EST] EXCLUDE BRANCH-SPECIFIC (dev VS dev-leftshift) CONFIG FILES FROM MERGE>

http://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes


1. DESIRED DIFFERENCES IN phaistos.conf BETWEEN BRANCHES

dev-leftshift

#HG_PATH=/home/refdata/Human_Annotation
HG_PATH=/data/cypher/data
HG_TYPE=hg19


dev

HG_PATH=/home/refdata/Human_Annotation
#HG_PATH=/data/cypher/data
HG_TYPE=hg19


2. ADD LINE TO .gitattributes

emacs .gitattributes

phaistos.conf merge=ours


3. DEFINE DUMMY ours MERGE STRATEGY

git config --global merge.ours.driver true


4. MERGE dev-leftshift INTO dev

git checkout dev
git merge dev-leftshift

If you merge in the other branch, instead of having merge conflicts with the phaistos.conf file, you see something like this:

<!--git merge topic
Auto-merging phaistos.conf
Merge made by recursive.
-->

5. VERIFY DIFFERENT VERSIONS OF phaistos.conf

git checkout dev
tail -n 4 phaistos.conf

git checkout dev-leftshift
tail -n 4 phaistos.conf

	
</entry>
<entry [Fri 2014:10:31 00:08:05 EST] LIST OF GIT TOOLS>

FROM ATLASSIAN WORKSHOP SURVEY

 GitHub
 GitHub Enterprise
 Git Lab
 Gerrit
 Gitolite
 Bitbucket
 Stash
 SourceTree
 GitTower
 TortoiseGit
 Other
	
</entry>
<entry [Tue 2014:07:08 13:03:15 EST] CREATED bcf-deploy DEPLOYMENT KEY>

1. CREATE KEY

cd ~/notes/agua/keypair/annai/bcf-deploy

ssh-keygen

	OK
	
	Your identification has been saved in ./id_rsa.
	Your public key has been saved in ./id_rsa.pub.
	The key fingerprint is:
	9e:88:a7:c4:35:5b:1b:bc:b7:3e:0c:d9:9a:ef:c6:2a syoung@comp2
	The key's randomart image is:
	+--[ RSA 2048]----+
	|                 |
	|                 |
	|                 |
	|       .         |
	|      o So       |
	|   . o *o=.      |
	|    + + =*.      |
	|   . oE o.=.     |
	|    .  ..*=.     |
	+-----------------+
	

id_rsa

-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAvSscy33K5X2AYfBIG3qD+Q9lYLJg+R0hm8l9kbertYTFn2OD
Fd9+PMrBA87hY2I17e2OHDQ57gO8wH4dQRn6rbFLKfYUa+i8UjTYGaxs78Uu7hK1
bMZK1xHMVD7hs8/FzpDwiM5RinQ6olw3MxDf3KYzDK9KcXXZizO5e6UqB6j1/3D0
Qp/jKxzDcgq7ZDNUJfoVwylr3mK2UIEpIoZ0LiUjrrM1w8MLZCjPNFvlOGbPK2SZ
dBWJQZNp9fC6VopM+YpMJT+VFjPFZ3z/uLtGnuE/zbzEZM9QDrQKCSLWjt3gw45S
W/ImWRGd5aZbca6p4ImtBWhE0UIIoRSH8/a1swIDAQABAoIBAQCXvunOYw5Loa1G
41U0lccgF7WfJ/iaXUAElFFifxADAIr3HQCenzXI1myW/XHYI4RXZGTHQy3lPKJB
V+lnu8tXYg2Fj506IuxOlY10qtiIToki+WcH5tlKRUC/o+GyOE3ZMnOBit/mTO5s
J8Uv9a1edwQkfMke0wa7n7Z+9TMOCJ45Tk9vFchZ5pgxImYrdTcM7P6i6vgcc3Tx
jueTE9XfB4z6aWUeRpeYTy48n6Wlrx3MKVql4gSrWiHHUqxnJN8OarYShv4f4ZaR
t1+ZAIzCRjkK3nWOW8ihkj5kWAooJ+s+xovqao6SNMkmNhSP0J8Te3r5X+FXT+M5
0n8XdtKhAoGBAOaxRP58y6tYd7tYQaotSYJV5F6056R0MiEiae/0KBKZ932q2Msm
gOmlQiwQVRO6+/xJoex7RHn7ZtC9vpWrC7QtrWnetkldy32bKc7NAmcyTicQbFKU
vj050/uIP5aqLCHohTw3jJCN1s6+Mj9SLfhVLZjKAQ24x8VlC2M9r613AoGBANHr
sCdqX6UJrN8A3EGqtp56TaOACjZ7QTDS/hxTEXUt5GQ6Zk9itW7JZ9KhEQiCSHeN
haMjpUeyArIa+gJDR99Pcqrur2REppQsyk/8h+9w2GIlnyJCq0RHmz2qrP20urBZ
zzRAJBhZ/MtSYw2VTNkug81i3wzo++9kha59fVilAoGBAK5CX+ygljTDagYxf8Ct
3uY+PXiwzH30a92Nolpoo1CRz1q1EHg8iIp1lAu29p0l1KzZbiA1aR9/oUWy3uEt
yHR9QI5Fdorq+AjUiXs2b0dGv7RQepLS2vVi1lcdr3L+7sFaZDJ9f4e+LPIUx93/
FMyOgxf0F2GnH/hjAHwhn6+3AoGAE1ZHqsnUt6o1f3Ff2Li2C9EuV7JSvoQKFEpL
WCaaxBWPJWBvzj5EgkkRREjL/eGqdUDXH5kH/5u5PdjYUN8Lvtldsbs88tqUEbAy
jr2vc/IMLLZUe15y0l5aQYr4VoKQc/BB8wk5ifi4Ha6gKz8mjhcH0yKZc2H+2yWC
Xvl2U3UCgYEAh7RUYJMqcK+Y34SuNPG/ssJtt48L1wmJ92zEkmHQXdCCeoGmyKps
nTC4B1vsxUP+lKMwTtRcm00whayOwJAM00jiUNOVxZKRpioFaqUvCUngxQCJPxu7
t5h6lj4rig2J+aQPZLxjjuj4hsd3rXYOgErZhYMgD6AgGeOLNxrGRVM=
-----END RSA PRIVATE KEY-----


id_rsa.pub

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9KxzLfcrlfYBh8EgbeoP5D2VgsmD5HSGbyX2Rt6u1hMWfY4MV3348ysEDzuFjYjXt7Y4cNDnuA7zAfh1BGfqtsUsp9hRr6LxSNNgZrGzvxS7uErVsxkrXEcxUPuGzz8XOkPCIzlGKdDqiXDczEN/cpjMMr0pxddmLM7l7pSoHqPX/cPRCn+MrHMNyCrtkM1Ql+hXDKWveYrZQgSkihnQuJSOuszXDwwtkKM80W+U4Zs8rZJl0FYlBk2n18LpWikz5ikwlP5UWM8VnfP+4u0ae4T/NvMRkz1AOtAoJItaO3eDDjlJb8iZZEZ3lpltxrqngia0FaETRQgihFIfz9rWz syoung@comp2


2. ADD AS DEPLOYMENT KEY ON BITBUCKET: cu, moores, pancancer


GO TO PROJECT --> CLICK 'COG' --> Deployment keys



3. ADD id_rsa KEY TO worker.v11 IMAGE

chmod 600 /root/.ssh/id_rsa


4. CHANGE URL IN INSTALL SCRIPT

FROM https TO git@



	
</entry>
<entry [Fri 2014:04:04 14:32:15 EST] CREATE BRANCH>

git checkout -b newBranch

OR
git branch newBranch
git checkout newBranch
	
</entry>
<entry [Fri 2014:04:04 14:29:37 EST] CLONE A BRANCH WITHOUT CLONING THE OTHER BRANCHES>

http://stackoverflow.com/questions/1911109/git-clone-a-specific-branch

To clone a branch without fetching other branches:

mkdir $BRANCH
cd $BRANCH
git init
git remote add -t $BRANCH -f origin $REMOTE_REPO
git checkout $BRANCH
	
</entry>
<entry [Fri 2014:04:04 12:43:27 EST] GIT submodules UPDATE>

THE PARENT DOESN'T STORE THE SUBMODULES, RATHER IT KNOWS THE PAST AND CURRENT COMMITS OF THE SUBMODULE

UPDATE TO LATEST VERSIONS OF ALL SUBMODULES

git submodule foreach --recursive 'echo `git checkout master`'
git submodule foreach --recursive 'echo `git pull`'
Assuming you want all the submodules to be at the master branch.

	
</entry>
<entry [Fri 2014:04:04 03:53:19 EST] STRANGE annai KEY AUTHENTICATES TO arlomltb>

syoung@comp2:~/.ssh$ sshkey annai
syoung@comp2:~/.ssh$ sshv 66
-bash-4.1$ echo "$SSH_AUTH_SOCK"
/tmp/ssh-HDEaV12308/agent.12308
-bash-4.1$ ssh -T git@github.com
The authenticity of host 'github.com (192.30.252.128)' can't be established.
RSA key fingerprint is 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,192.30.252.128' (RSA) to the list of known hosts.
Hi arlomltb! You've successfully authenticated, but GitHub does not provide shell access.
	
</entry>
<entry [Fri 2014:02:14 15:27:35 EST] FIX MERGES FROM REMOTE TO macbook>

Stuarts-MacBook-Pro:annai syoung$ git pull git master
From github.com:syoung/annai
 * branch            master     -> FETCH_HEAD
Performing inexact rename detection: 100% (1400/1400), done.
warning: Cannot merge binary files: projects/custom/custom-analysis-estimates-v2.xls (HEAD vs. 390c8441d38a6027ce3604d68f9e8e8a799d1540)
warning: Cannot merge binary files: projects/custom/custom-analysis-estimates-v1.xls (HEAD vs. 390c8441d38a6027ce3604d68f9e8e8a799d1540)
warning: Cannot merge binary files: projects/2kgenomes/2kgenomes-analysis-v3.xls (HEAD vs. 390c8441d38a6027ce3604d68f9e8e8a799d1540)
warning: Cannot merge binary files: projects/2kgenomes/2kgenomes-analysis-v2.xls (HEAD vs. 390c8441d38a6027ce3604d68f9e8e8a799d1540)
warning: Cannot merge binary files: projects/2kgenomes/2kgenomes-analysis-v1.xls (HEAD vs. 390c8441d38a6027ce3604d68f9e8e8a799d1540)
warning: Cannot merge binary files: conferences/bigdata/Big-Data-conference-Stuart-Young-speaker-abstract-v2.docx (HEAD vs. 390c8441d38a6027ce3604d68f9e8e8a799d1540)
warning: Cannot merge binary files: conferences/bigdata/Big-Data-conference-Stuart-Young-speaker-abstract-v1.docx (HEAD vs. 390c8441d38a6027ce3604d68f9e8e8a799d1540)
Auto-merging request.xsl
CONFLICT (content): Merge conflict in request.xsl
Auto-merging projects/pancancer.xsl
CONFLICT (add/add): Merge conflict in projects/pancancer.xsl
Auto-merging projects/custom/custom-analysis-estimates-v2.xls
CONFLICT (add/add): Merge conflict in projects/custom/custom-analysis-estimates-v2.xls
Auto-merging projects/custom/custom-analysis-estimates-v1.xls
CONFLICT (add/add): Merge conflict in projects/custom/custom-analysis-estimates-v1.xls
Auto-merging projects/2kgenomes/2kgenomes-analysis-v3.xls
CONFLICT (add/add): Merge conflict in projects/2kgenomes/2kgenomes-analysis-v3.xls
Auto-merging projects/2kgenomes/2kgenomes-analysis-v2.xls
CONFLICT (add/add): Merge conflict in projects/2kgenomes/2kgenomes-analysis-v2.xls
Auto-merging projects/2kgenomes/2kgenomes-analysis-v1.xls
CONFLICT (add/add): Merge conflict in projects/2kgenomes/2kgenomes-analysis-v1.xls
Auto-merging metadata.xsl
CONFLICT (add/add): Merge conflict in metadata.xsl
Auto-merging gnos.xsl
CONFLICT (add/add): Merge conflict in gnos.xsl
Auto-merging genetorrent.xsl
CONFLICT (add/add): Merge conflict in genetorrent.xsl
Auto-merging conferences/bigdata/Big-Data-conference-Stuart-Young-speaker-abstract-v2.docx
CONFLICT (add/add): Merge conflict in conferences/bigdata/Big-Data-conference-Stuart-Young-speaker-abstract-v2.docx
Auto-merging conferences/bigdata/Big-Data-conference-Stuart-Young-speaker-abstract-v1.docx
CONFLICT (add/add): Merge conflict in conferences/bigdata/Big-Data-conference-Stuart-Young-speaker-abstract-v1.docx
Auto-merging biotools.xsl
CONFLICT (add/add): Merge conflict in biotools.xsl
Auto-merging bcf2.xsl
CONFLICT (add/add): Merge conflict in bcf2.xsl
Auto-merging bcf1.xsl
CONFLICT (add/add): Merge conflict in bcf1.xsl
Auto-merging bcf.xsl
Auto-merging bcf.quickref.xsl
CONFLICT (content): Merge conflict in bcf.quickref.xsl
Auto-merging bcf.instances.xsl
CONFLICT (content): Merge conflict in bcf.instances.xsl
Auto-merging aws.xsl
Removing annaisystems-request-88332759495e.tar.gz
Auto-merging access.xsl
CONFLICT (add/add): Merge conflict in access.xsl
Automatic merge failed; fix conflicts and then commit the result.
    
</entry>
<entry [Fri 2014:02:28 11:50:59 EST] INSTALLED meld>

1. INSTALL ON UBUNTU

sudo apt-get update && sudo apt-get install meld


2. CREATED git-diff.sh FILE

emacs -nw /usr/local/bin/git-diff.sh

	#!/bin/bash
	meld "$2" "$5" > /dev/null 2>&1

3. MAKE IT EXECUTABLE

chmod 755 /usr/local/bin/git-diff.sh


4. ADD ENTRY TO $HOME/.gitconfig FILE
	[diff]
			external = /usr/local/bin/git-diff.sh


5. USE meld


TYPE

git diff

The next time you type git diff in a Git project with changes, Meld will be launched showing you a split-pane diff viewer. Note that you are required to close the open instance of meld before the next diff viewer is opened.
	
</entry>
<entry [Fri 2014:02:28 11:01:24 EST] MERGE CONFLICTS IN annai PULLING FROM REMOTE TO ALIEN AFTER PUSH FROM MACBOOK>

Auto-merging request.xsl
CONFLICT (content): Merge conflict in request.xsl
Auto-merging projects/pancancer/keys/riken/riken.pem
CONFLICT (add/add): Merge conflict in projects/pancancer/keys/riken/riken.pem
Auto-merging projects/pancancer.xsl
CONFLICT (content): Merge conflict in projects/pancancer.xsl
Auto-merging projects/cloudpilot.xsl
CONFLICT (add/add): Merge conflict in projects/cloudpilot.xsl
Auto-merging gnos.xsl
Auto-merging conferences/bigdata.xsl
CONFLICT (content): Merge conflict in conferences/bigdata.xsl
Auto-merging biotools.xsl
CONFLICT (content): Merge conflict in biotools.xsl
Auto-merging bcf2.xsl
CONFLICT (content): Merge conflict in bcf2.xsl
Auto-merging annai.xsl
CONFLICT (content): Merge conflict in annai.xsl
Auto-merging access.xsl
Automatic merge failed; fix conflicts and then commit the result.

	
</entry>
<entry [Fri 2014:02:14 08:58:13 EST] DELETED LARGE FILES IN annai ON ALIEN>

1. DELETE FILES FROM REPO

git filter-branch --force --index-filter \
'git rm --cached --ignore-unmatch projects/gdc/hdsit_130769.zip' \
--prune-empty --tag-name-filter cat -- --all

git filter-branch --force --index-filter \
'git rm --cached --ignore-unmatch people/hannahcarter/tgapipe/tmp/progs/snpEff/data/GRCh37.71/snpEffectPredictor.bin' \
--prune-empty --tag-name-filter cat -- --all

git filter-branch --force --index-filter \
'git rm --cached --ignore-unmatch bcf/bcf1.0/tgapipe' \
--prune-empty --tag-name-filter cat -- --all



2. PURGE FROM REPO

rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now


3. PUSH TO REMOTE

git push ill master --force



	
</entry>
<entry [Sun 2014:02:09 12:42:08 EST] FIXED: LARGE FILES BLOCKS GITHUB PUSH>


Total 1467 (delta 390), reused 1 (delta 0)
remote: warning: File people/hannahcarter/tgapipe/tmp/progs/snpEff/data/GRCh37.71/snpEffectPredictor.bin is 87.49 MB; this is larger than GitHub's recommended maximum file size of 50 MB

remote: error: GH001: Large files detected.
remote: error: Trace: 5863c28c1c5c28c58806eab3939f7ec0
remote: error: See http://git.io/iEPt8g for more information.
remote: error: File projects/gdc/hdsit_130769.zip is 894.68 MB; this exceeds GitHub's file size limit of 100 MB
To git@github.com:syoung/annai
 ! [remote rejected] master -> master (pre-receive hook declined)
error: failed to push some refs to 'git@github.com:syoung/annai'
Everything up-to-date


	
</entry>
<entry [Sun 2014:01:12 04:59:50 EST] CREATED NEW agua SSH KEY: agua2>
	
ssh -i /home/syoung/.ssh/agua/github/id_rsa git@github.com -T

	Hi agua! You've successfully authenticated, but GitHub does not provide shell access.


</entry>
<entry [Sun 2014:01:05 11:24:59 EST] RESET agua GITHUB PASSWORD, SET SSH KEY IS aquarius5>

GITHUB LOGIN

agua
@*********2


SSH KEY IS aquarius5

ssh -i /home/syoung/notes/agua/keypair/syoung/aquarius5/id_rsa git@github.com -T
	Hi syoung! You've successfully authenticated, but GitHub does not provide shell access.

	
</entry>
<entry [Tue 2013:11:12 15:11:43 EST] RESTORED DELETED object FILES>

PROBLEM 

DELETED OBJECT FILES AND NOW CAN'T PUSH TO REMOTE

syoung@comp2:/mnt/repos/public/agua/aguadev$ git push git master
Counting objects: 35618, done.
error: unable to find a3de65e7dbcf51087c4ee01ee2688645bf687054
Delta compression using up to 8 threads.
Compressing objects: 100% (33930/33930), done.
fatal: unable to read a3de65e7dbcf51087c4ee01ee2688645bf687054  
remote: fatal: early EOF
error: failed to push some refs to 'git@github.com:aguadev/aguadev'

DELETED object FILES

./.git/objects/a3/de65e7dbcf51087c4ee01ee2688645bf687054
./.git/objects/bd/01dc3ca965e2f89abd4e98e3e4736b53106c04
    


SOLUTION

DELETE AND START ANEW



*** DIDN'T WORK ***

CLONE TO ANOTHER REPO

git clone aguadev aguadev.new

RENAME OLD

mv aguadev aguadev.broken
mv aguadev.new aguadev




NOTES
-----

http://stackoverflow.com/questions/10050861/go-back-in-history-to-an-undamaged-version

You might try cloning that repository. Cloning should only take the "necessary" objects into a new repo, so as long as that loose object is really "unnecessary" for your clone, you might have a corruption-free repo in your clone. –  Mark Rushakoff Apr 7 '12 at 5:32
    
</entry>
<entry [Mon 2013:11:11 11:54:24 EST] FIXED GITHUB LARGE FILE LIMIT EXCEEDED>

PROBLEM

git push -u git master

    Counting objects: 40507, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (37123/37123), done.
    Writing objects: 100% (40507/40507), 482.13 MiB | 1.64 MiB/s, done.
    Total 40507 (delta 11024), reused 7478 (delta 1397)
    remote: warning: File html/dojo-1.8.3/util/.git.bkp/objects/pack/pack-25defd57ffd31122cd4e74fc9cd1893fc1e92cc6.pack is 65.52 MB; this is larger than GitHub's recommended maximum file size of 50 MB
    remote: error: GH001: Large files detected.
    remote: error: Trace: 91d4c57f2174feab2e941836fe9f8a59
    remote: error: See http://git.io/iEPt8g for more information.
    remote: error: File bin/install/resources/sge/sge6.tar.gz is 105.22 MB; this exceeds GitHub's file size limit of 100 MB
    To git@github.com:aguadev/aguadev
     ! [remote rejected] master -> master (pre-receive hook declined)
    error: failed to push some refs to 'git@github.com:aguadev/aguadev'


SOLUTION

The messages on push tell you which files are causing problems:

# remote: warning: Large files detected.
# remote: warning: File big_file is 55.00 MB; this is larger than GitHub's recommended maximum file size of 50 MB
The push with big_file is received and saved into the repository on GitHub, but you should consider removing the file and the commit entirely.

# remote: warning: Large files detected.
# remote: error: File giant_file is 123.00 MB; this exceeds GitHub's file size limit of 100 MB
This push was rejected by GitHub because of giant_file. The commits pushed are not saved into the repository on GitHub.


NOTES
-----


Fixing the problem

To fix the problem, you'll first want to remove the large file from git:

git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch giant_file' \
  --prune-empty --tag-name-filter cat -- --all
# Rewrite 48dc599c80e20527ed902928085e7861e6b3cbe6 (266/266)
# Ref 'refs/heads/master' was rewritten
# Wipe out our giant file from Git

git commit --amend -CHEAD
# Amend the previous commit with your change
# Simply making a new commit won't work, as you need
# to remove the file from the unpushed history as well

git push
# Push our rewritten, smaller commit
We won't remove any excessively large files that have already been pushed to your GitHub repositories. However, if you update any of these files locally, you won't be able to push the update.

Alternatives

    
</entry>
<entry [Mon 2013:10:07 04:35:21 EST] FIXED ERROR (ADVANCED) 'Everything up-to-date' EVEN THOUGH CHANGED>

http://stackoverflow.com/questions/277077/why-is-git-telling-me-your-branch-is-ahead-of-origin-master-by-11-commits-a

PROBLEM

My working directory was ahead of origin by X commits but the git pull was resulting in:

'Everything up-to-date'


SOLUTION

Basic fix:

git push {remote} {localbranch}:{remotebranch}

Where the words in brackets should be replaced by your remote name, your local branch name and your remote branch name. e.g.

git push origin master:master


ADVANCED FIX:

git reset --hard HEAD

...MAKE CHANGES, COMMIT AND GIT PUSH!





    
    
</entry>
<entry [Sun 2013:06:02 15:03:49 EST] FIXED ERROR ON PUSH 'warning: push.default is unset'>

PROBLEM

ON PUSH GET THIS MESSAGE:

git push 

print Dumper ;    warning: push.default is unset; its implicit value is changing in
    Git 2.0 from 'matching' to 'simple'. To squelch this message
    and maintain the current behavior after the default changes, use:
    
      git config --global push.default matching
    
    To squelch this message and adopt the new behavior now, use:
    
      git config --global push.default simple
    
    See 'git help config' and search for 'push.default' for further information.
    (the 'simple' mode was introduced in Git 1.7.11. Use the similar mode
    'current' instead of 'simple' if you sometimes use older versions of Git)
    
    Counting objects: 17748, done.
    Delta compression using up to 2 threads.
    Compressing objects: 100% (16954/16954), done.
    Writing objects: 100% (17661/17661), 294.54 MiB | 118 KiB/s, done.
    Total 17661 (delta 4459), reused 198 (delta 13)
    To git@github.com:syoung/aguadev
       e37a2fc..bef83c4  master -> master


SOLUTION

USE DEFAULT TO PUSH ALL BRANCHES THAT HAVE THE SAME NAME AT BOTH ENDS:

git config --global push.default matching




NOTES


http://stackoverflow.com/questions/11872984/what-is-the-difference-between-git-push-default-current-and-push-default-upstrea

The man page for git-config lists these options for push.default:

nothing - do not push anything.
matching - push all matching branches. All branches having the same name in both ends are considered to be matching. This is the default.
upstream - push the current branch to its upstream branch.
tracking - deprecated synonym for upstream.
current - push the current branch to a branch of the same name.

In most cases I would assume that pushing to a branch's upstream branch would be the same as pushing to a branch of the same name, since the upstream branch would normally have the same name, and since the branch of the same name ("current") would normally (or always, by definition?) be upstream. So what's the difference?

git git-branch git-push
share|improve this question
asked Aug 8 '12 at 20:52


ANSWER

for developers it's indeed annoying to differ these, so 'simple' is introduced, and will be the default bahavior for git-push. actually it's appeared in git 1.7.11 – xhl_will Dec 27 '12 at 9:21
5	  
For more on the recent git warning push.default is unset; its implicit value is changing in Git 2.0 and about matching vs simple see stackoverflow.com/questions/13148066/… – Nate Feb 11 at 17:30
2 Answers activeoldestvotes
up vote
27
down vote
accepted
You've summarized the difference in your question. upstream pushes to the configured upstream branch, current assumes the upstream branch has the same name, and pushes to that specific name. In reality, there's no reason to assume a local branch's upstream tracking branch has the same name as the local branch itself.

For example, if you work in multiple repositories or across many shared developer remotes, you often end up tracking different forks of the same branch, such as allen-master or susan-master, both of which track the master branch in Allen and Susan's repos, respectively. In this case, current would be the incorrect setting, because those branch names don't exist on their remotes. upstream, however, would work just fine.

A more practical example might be tracking both a development and production repository. Your workflow might use a different mainline branch for each, but that might get confusing. Suppose you were a code integrator and wanted to track both repositories' master branches separately.

git checkout -b production --track production/master
git checkout -b development --track development/master
Now you've got two branches that track their respective repositories, neither of which use the master naming convention at all. There's little confusion about the branch names: They explicitly describe what they track. Nevertheless, push.default = current wouldn't make any sense as neither remote contains a development or production branch.

share|improve this answer
edited Aug 9 '12 at 0:35

answered Aug 8 '12 at 21:23

Christopher
6,02811024

up vote
1
down vote
current will push the current branch to a branch with the same name on the remote repo.

upstream will push the current branch to the upstream branch.

The upstream branch is a branch which has been explicitly or implicitly defined as being upstream from your current branch. That means that push and pull by default will sync with this branch. The upstream branch may be in the same repo as the current branch itself. You can do interesting things like set up your local master branch as upstream from your local feature (topic) branch, and push and pull between them.

Implicit upstream setup is done through the branch.autosetupmerge config value. You can find documentation in the git config help page. Explicit upstream setup is done with the -u option to the git branch command. See the help page for details.
    
</entry>
<entry [Sun 2013:06:02 01:00:07 EST] CREATED NEW GITHUB CREDENTIALS FOR agua>
    
1. CREATE SSH KEYS

mkdir -p /home/syoung/notes/agua/keypair/agua/agua1
cd /home/syoung/notes/agua/keypair/agua/agua1
ssh-keygen -t rsa -f id_rsa -q -N ''
chmod 400 id_rsa

2. VERIFY KEY FILES


-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEA3NodrXv8+mjgMeM5HArrZHjMiSWw/kORbrWV/3r/nksOcWMQ
kHzxrNsSoj9QX1XTJdB/YCuL+HU3zgcYL+ud/CgSFuXHK01kuntWd5fKAiG9pEo6
2rfGvF1Vd6a1i290kGJTPi3EtJl8kDZ14KC//SkgZOLOCt5YGz6GQ9dINQzw64EA
Hdx+AADDJiiOpzveY050Cio7aDPLNLvYo6ysMjyfj7iJmPw0zokYqtqYwpNNBTPG
OlIAS3f/bhLc7OOGn9wl3pOwIu+wDLbGKDGnALsA+64YqN3eUL/dOa8Mk7zebg/d
+DUpEBAvPFv8g+9TDfHb3KcLbbM6PFkMUY7IlQIDAQABAoIBADoCWJU+4f3sGidA
ZbnF7HpheGf1rH28xbBspc+LQSUU1eBWgv1QtDIRAN34/2VrJ6DhGPPrvEIwl83X
8zRzEPYwmD/Hbv8ivvh0eQvEpNzWe/dxP/A/IUZMxaw976WGSvm5ud+1Kdu+DQfc
Ji4wSv12Ffop0LDuIfpV+/JJ07+K/6ZOttTKLRNWD7lMZW8cUGH4g6SmEsoLl6kd
Z2KyN7KzQFsK8XWVHieAN+2RTvZZJnR9zP6JT/DNphY1vUYpgK5NRSv229tUPxLr
ipGVD6irsXGCPU4FAqzSENBA0acbcqac5Th7IqW4C+9AxvnegYpJ/jGu9Onv5sT6
60FUV+kCgYEA9p8TbeApySxpumuzB9+CjG3h5Qxc9boxKFf9wwGDIWfuj7ZBC2dQ
QojSsaHaj+5pcBY1szpDsgLKvsOoSRSLyAHIRzwi+Do5NMOLiHBHWujVKDlOKD8p
YPsxx3Yo/dSpulqjJPlcOxQt7bk8bspGCR/MfMMcPlyJmEfxg8ib/mMCgYEA5UAr
G6HjVqqtFnqwFHv4vYGH9TOcj6Y92/0OvZ8qAx4jETaabwwCFjFkcEnaC2RMLL1v
uxL/bVWILeZZ/QxhwWqQJQxTZOww9U4RQMuFgjrisTZwBKJrspO8srbMjOsUEQoP
9LqrrGMr9vxvcMaEn8mCXxMo93e0heTLOqnZsqcCgYEAiejazI6Vz1FurjibnMN4
FV88+wC22xKLeqv505p84alk1ihspxvW3d31NC/2MJZ5j5xb2yWxxVGaXqK68GL0
55tXi74tL/IfG0peNKXUwRmCWUPyWL85PGo7o/aHZaoOX49fu8VVthPKuyzihnHG
SEPn7byNhrHon6dbfv4nfVECgYEA2NNdMlBmddUNyoIVwfoTJCG8FpVPEaqZPVVW
ONCuaq55WlF7tWX1H0puBapD+ZxOU86EO7rXLXDFUSxalnS8jLQeS3wh8AVYtNq2
hMM5rhfFyviC8E8yb3897QXp56p7mzYaK0zXDD/sGDlfqZmJXJu5m/TCPXTRoAXq
lbyJ82cCgYEA7lrygdxQ5s5+FizjuJ2/KYH14wOb9axaDPWgBvx85Ky2tGUIqyEn
V2IxssFkuWlm4JrhINC3iFTs7UYwN4yUlNKmh2EmfPMNVi6Zmrz23/0n+af2WF0/
51fLTKTtvN9HRPdN97c2FeOkjT0tgfhO/ndeh9aCTUSibeoMJvTXL8Q=
-----END RSA PRIVATE KEY-----

cd /home/syoung/notes/agua/keypair/agua/agua1
cat id_rsa.pub

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDc2h2te/z6aOAx4zkcCutkeMyJJbD+Q5FutZX/ev+eSw5xYxCQfPGs2xKiP1BfVdMl0H9gK4v4dTfOBxgv6538KBIW5ccrTWS6e1Z3l8oCIb2kSjrat8a8XVV3prWLb3SQYlM+LcS0mXyQNnXgoL/9KSBk4s4K3lgbPoZD10g1DPDrgQAd3H4AAMMmKI6nO95jTnQKKjtoM8s0u9ijrKwyPJ+PuImY/DTOiRiq2pjCk00FM8Y6UgBLd/9uEtzs44af3CXek7Ai77AMtsYoMacAuwD7rhio3d5Qv905rwyTvN5uD934NSkQEC88W/yD71MN8dvcpwttszo8WQxRjsiV syoung@computer1


3. UPLOAD KEY TO GITHUB

agua1 (0e:cc:10:21:e7:e0:bc:f5:8d:21:54:43:91:d1:ec:c6)


4. COPY TO .ssh/agua/github

mkdir -p ~/.ssh/agua/github
cp /home/syoung/notes/agua/keypair/agua/agua1/id_rsa* ~/.ssh/agua/github



</entry>
<entry [Sun 2013:06:02 01:00:07 EST] CREATED NEW GITHUB CREDENTIALS FOR aguadev>
    
1. CREATE SSH KEYS

mkdir -p /home/syoung/notes/agua/keypair/aguadev/aguadev1
cd /home/syoung/notes/agua/keypair/aguadev/aguadev1
ssh-keygen -t rsa -f id_rsa -q -N ''
chmod 400 id_rsa

2. VERIFY KEY FILES

cd /home/syoung/notes/agua/keypair/aguadev/aguadev1
cat id_rsa

-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAwXAu2ssmuBMsuu5RjavL0BtZgTJdWvCJCpyteLIolzd8/FLj
rEeA2/DaCtawW/bN1sTZgptK919o2n+Pe4SReqjcP7QmItguk6N/Ac+cDsalS+RU
HkOiT/BJc//HkOfQqI+KVDC9YBIsyfO3st4rjwFmcE7EaJyjwTiDUzrConZ1ilRo
nYHFsKX3EuBOF9hUL8f9eGlAiq51oSdk8pazcjGscyHaUscuT2kMMI3XOt2aCUsD
3gZwRFyZXhc1W8jDn4/cuay8AIRvdTvWCXQJaNY6XtgZ125/uP5JKh6pQvFc0eMs
3PTgH4DoSg0lJjk6OjVUq7J2ylBdMeLZ4Vve/wIDAQABAoIBAHeA/vFcoEcIUZIK
uYd0oy2mN92BZ/tOrttHgEQYjMsfFLAt5UoBwrIeUhZwG/Q0vWX5pwbxOZcp8nVK
aTI97EKDH86bVRQhymSblVNhF2BpiKUiInWwAw6vvDFVy8zR6i64vxTUJ6q6j8EU
OGDgsLhgfRDVGLIoU2KDr14z5xrGUAXyutajTuaZmDW0LrznI56vvUawEuESvM65
fko14b8zUw9n5GuY/O/js80i9wDKJ4vvYKECVyJoJgtMOGzGsJUtd7Hcdn2ZCIC1
1MF3MWvRntKaIZF7Mx7mL3+sx8sMUGKukInH85w/ngR3mcjSsfZj+3W75+X40e8Q
eku5ikECgYEA9TipgVPnhVGPG+l3jW/DMYRkOrDG8E+LoKW8OOx/8I3ytVT7Wjeu
Mvt9DPEo7ov+7QoVP4zMSkZMtSiYmfNOi1DgouoZCZgz8nS1U/zsvxf4I7IYKvm/
2vAtZQUGvOoupaFzyBwTO9Nzcd8i9tIjweBe0OWchuuG1VJaqff55gMCgYEAyfDV
pBrTOS02H7S8vh7dVtWN+PbLRo/6h+JxAgQ91juSDwa2O5g0mLx4/7KUR2auRAys
ADR6L3jUzsplcZ7PHV9wkspXMpJNHHqXq++e5O3BpPARzOboohccKy1CxTJXnCI6
XMJYYFZzxwVcAOb/s62D2cD7F6rIkf2QHrzLgFUCgYEAu+fWY6aSs2Mi4UWOec/Z
Z9lGIH8TglPB77DwQUJga0mqYO8kyCYAk0qIsWEed2TJTIQ8cf0HEic6YlsgTF/X
oQOxjsUJuINr0u9Bf4FBPNE2MMwons3QCQmgD1fBqQNeCUdlfEKfLmnCfdB5b17p
TYgLv9Eil3RlVpOLq9C8KlcCgYEAhxwjVJC+Eds2AzCht3JfFOH9Az3b83IRZSkU
Aw1jchqZNoR/GJBVYHt5WVrZ6ovAvLbdvaVeurRVbaXtCX//gt+AKjZG8QcBoLRF
FjxUS0bn8LrOrhEwRILBzgGSUu3DwCsGcVl2V75/6ACl9dSX8Fd/iAmd9c/GMic8
bdRTM6ECgYBCyOT4QPBvh0I7Aj0E9BdQLgOnpfJIz2SjNlDusdFIOZUb3LY/4jYv
vEML8/IVabhkB4nvbg6jdb4wffdg6pXMPDvWK3FqSnU/ZKh+2z7El3P1JX/FP7nn
G61DtOCrxQ55oHU6O2kwzNaTLdDy3yWFJXJ7rv0JIEygmR7PGq+EXQ==
-----END RSA PRIVATE KEY-----

cd /home/syoung/notes/agua/keypair/aguadev/aguadev1
cat id_rsa.pub

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBcC7ayya4Eyy67lGNq8vQG1mBMl1a8IkKnK14siiXN3z8UuOsR4Db8NoK1rBb9s3WxNmCm0r3X2jaf497hJF6qNw/tCYi2C6To38Bz5wOxqVL5FQeQ6JP8Elz/8eQ59Coj4pUML1gEizJ87ey3iuPAWZwTsRonKPBOINTOsKidnWKVGidgcWwpfcS4E4X2FQvx/14aUCKrnWhJ2TylrNyMaxzIdpSxy5PaQwwjdc63ZoJSwPeBnBEXJleFzVbyMOfj9y5rLwAhG91O9YJdAlo1jpe2BnXbn+4/kkqHqlC8VzR4yzc9OAfgOhKDSUmOTo6NVSrsnbKUF0x4tnhW97/ syoung@computer1



3. UPLOAD KEY TO GITHUB

aguadev1 (bd:6a:23:2c:49:e2:a4:b0:bf:b3:3c:ee:38:6b:69:7d)



4. COPY TO .ssh/aguadev/github

mkdir -p ~/.ssh/aguadev/github
cp /home/syoung/notes/agua/keypair/aguadev/aguadev1/id_rsa* ~/.ssh/aguadev/github


  
</entry>
<entry [Sat 2013:06:01 03:35:46 EST] MERGES AFTER PULL dev-backend BRANCH TO infusiondev>


html/dojo-1.8.3/dgrid/List.js: needs merge
html/plugins/core/Agua.js: needs merge
html/plugins/exchange/Exchange.js: needs merge
html/plugins/infusion/Data.js: needs merge
html/plugins/infusion/Dialog/Project.js: needs merge
html/plugins/infusion/Filter.js: needs merge
html/plugins/infusion/Infusion.js: needs merge
html/plugins/infusion/Lists.js: needs merge
html/plugins/infusion/templates/infusion.html: needs merge
html/plugins/infusion/templates/lists.html: needs merge
t/html/plugins/infusion/lists/runTests.js: needs merge
t/html/plugins/infusion/lists/test.html: needs merge


    
</entry>
<entry [Sat 2013:06:01 00:54:35 EST] ADDED .bash_profile FUNCTION TO SET SSH KEYS>

USAGE:

SET GITHUB AND BITBUCKET KEYS

setkey syoung
setkey illuminadev
setkey agua
setkey aguadev



1. CREATE CONFIG FILE FOR EACH USER

em ~/.ssh/config-syoung 
    # syoung GITHUB
    Host github.com
     User syoung
     HostName github.com
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/syoung/github/id_rsa
     
    # syoung BITBUCKET
    Host bitbucket.org
     User syoung
     HostName bitbucket.org
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/syoung/bitbucket/id_rsa
    


em ~/.ssh/config-illuminatest 
    # illuminatest GITHUB
    Host github.com
     User illuminatest
     HostName github.com
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/illuminatest/github/id_rsa
     
    # illuminatest BITBUCKET
    Host bitbucket.org
     User illuminatest
     HostName bitbucket.org
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/illuminatest/bitbucket/id_rsa


em ~/.ssh/config-aguadev 
    # aguadev GITHUB
    Host github.com
     User aguadev
     HostName github.com
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/aguadev/github/id_rsa
     
    # aguadev BITBUCKET
    Host bitbucket.org
     User aguadev
     HostName bitbucket.org
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/aguadev/bitbucket/id_rsa


em ~/.ssh/config-agua 
    # agua GITHUB
    Host github.com
     User agua
     HostName github.com
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/agua/github/id_rsa
     
    # agua BITBUCKET
    Host bitbucket.org
     User agua
     HostName bitbucket.org
     PreferredAuthentications publickey
     IdentityFile ~/.ssh/agua/bitbucket/id_rsa


2. CREATE BASH FUNCTION TO SET SSH KEYS


source /home/syoung/notes/bash/functions/setkey.sh

setkey() {
    username=${1}
    echo "doRepos    username: $username"

    if [ $username != "syoung" ] && [ $username != "illuminadev" ] && [ $username != "agua" ] && [ $username != "aguadev" ] ; then
        echo "doRepos    Username $username not recognised"
        return
    fi
        
    cp ~/.ssh/config-$username ~/.ssh/config ;
    ssh-add "/home/syoung/.ssh/$username/github/id_rsa";
    ssh-add "/home/syoung/.ssh/$username/bitbucket/id_rsa";    
}


    
</entry>
<entry [Sat 2013:06:01 00:46:40 EST] CREATED NEW GITHUB CREDENTIALS FOR illuminatest>
    
1. CREATE SSH KEYS

mkdir -p /home/syoung/notes/agua/keypair/illuminatest/illumina3
cd /home/syoung/notes/agua/keypair/illuminatest/illumina3
ssh-keygen -t rsa -f id_rsa -q -N ''


2. VERIFY KEY FILES

cd /home/syoung/notes/agua/keypair/illuminatest/illumina3
cat id_rsa

cat id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAvTbj9MnwG4XLLxdxmMmDdbKP6rBCNx5LMMSK1I8Xp7lDKiOO
i3OuUYVVj1dXtoZxX9mcH2cTfwkAJ7kHWJ1tRLaKeS7nx4m8CPtglRPATo1nAAes
zvt4L6m7erAysSNZCE7sDL7CEiAy/RhhrFjPmu/+N1v+qjJ0UO/HKShlA1ZL0MK7
WNaNUvzEgS1R5TWhSTPEdunJ8JcEeIV7c0/UbIndte/oKdq5NL7xvM6bDsDLbtNR
rcsgN+NUrnvLA0RpN1H3kiNpAObS/6/kGDkEJ8PQOglfC1byE9fPlKmT7g7on49n
lLYYuuMQpbhl8k4sgTqcJXCJnViOKkdNjmTJqQIDAQABAoIBAGu3XOyVLYCtmS8U
3JGLXrBZV/7WGswADfQUX6iEUYYlPKw3k8WltH4qNrwkkAWT4eUcH/nslzfBqvny
JtF2xabReGFmp4J70bUXTjNwDBFsBFALDoDCvff8W4OL3T/kjKHjNBRJYHgrJnvZ
LnmMEZv1tjZTw9WmZXtSFYJDwcW0lyxf4zgmn0tvuPe5ZbC9Zd4xGIkNmK+ydey8
vLzwxOOeLxzn1J20GGjW10LeqYtx4BKxcbOfgAYWP47u2xRa8HO3QWtUAWZ6m4pW
bp36Aezmo1Bn1tm3ZMIAuwZ4YprhWNUlOyHvfI+iawgId9sGfldtOvVJxn6P/Ic3
K9RirvUCgYEA5Lx+AoaVJphqseduiZFecXtePqbnejUQZ7Nu8NXPen1t9ygB/bKE
NHf5/jQBNSPhOkMSqqZW8Fw0277rmR+9p7gm1rCa5vlQBSa/4uVhfW6nKbfWublf
EQgqMsqhotPKONpbqPYzdpYIdHSx2NhH9gw/Zk9iGuftWcZUkQRIX4sCgYEA08R0
Jvh2R9ukugOYzPcLIcEXoR7o6xyd3nYsyJdwZ/TdiYfnvmPtrdpFxwZrH4tEfbNa
590y2mLFaci7BKRPaVBKu2vP/LuKr7RoDkmqjI5cNUVjn0q4gkGs/OQ/Fo0uG2Qx
MnEtnxU1qMCE5RWy9U50zWYY5BvMMWW6N5B+4hsCgYEAk+H1yiY+2fQizyBki9aL
a+0p8nGwKIeUMqeEq3pgqL3dUbTxDJfU96M14o621Sd8X1GsCN6ASOgkWIooAhjO
Ylgh7B3EGF7JyHrUBprsm87ljohH8E2T1AwmVC5DsGUjUfyC1EtQ3HOFxd0Ierzi
UYZ7mubp86FNCAS8+gD91Z8CgYAxptAtCviApKkczBcZh5rekS1/I4YtCgqhzEd3
yLocRbdjta/KXheuOY0+uuyG+tpWNqVL0/tGZP4wbVYcIoJUCPVcuEyNz1MXG0+C
ehc42XAZNWnEQXq9X7S1nraEDRoQZg966jpuIETyiiEerVXGWlzcg+G2KiZYNqfQ
u1pknQKBgQDD6b7TOAUYEI3KmtRw4gDp/oeXuAodvTjBpep2sn6Ve4IvxAM9rxs3
ETOGGg8qq2gxCFpdy52z8GdihSPhiE85dfWrk0g2+d7noSqPpN6mEZytRFCr1wEG
oXOqI0HkqBGeIbdI7jGE71odnQm2NerzXycLElsj7TZ4+W3rxJ/6Pg==
-----END RSA PRIVATE KEY-----


cd /home/syoung/notes/agua/keypair/illuminatest/illumina3
cat id_rsa.pub

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9NuP0yfAbhcsvF3GYyYN1so/qsEI3HkswxIrUjxenuUMqI46Lc65RhVWPV1e2hnFf2ZwfZxN/CQAnuQdYnW1Etop5LufHibwI+2CVE8BOjWcAB6zO+3gvqbt6sDKxI1kITuwMvsISIDL9GGGsWM+a7/43W/6qMnRQ78cpKGUDVkvQwrtY1o1S/MSBLVHlNaFJM8R26cnwlwR4hXtzT9Rsid217+gp2rk0vvG8zpsOwMtu01GtyyA341Sue8sDRGk3UfeSI2kA5tL/r+QYOQQnw9A6CV8LVvIT18+UqZPuDuifj2eUthi64xCluGXyTiyBOpwlcImdWI4qR02OZMmp syoung@computer1


3. UPLOAD KEY TO GITHUB


illumina3 (7b:de:53:ff:3a:e9:62:19:d0:04:7d:4d:f7:ad:2f:2d)


4. COPY TO .ssh/illuminadev/github

mkdir -p ~/.ssh/illuminadev/github
cp /home/syoung/notes/agua/keypair/illuminatest/illumina3/id_rsa* ~/.ssh/illuminadev/github


  
</entry>
<entry [Fri 2013:05:31 03:14:38 EST] CREATED NEW GITHUB CREDENTIALS FOR syoung>

1. CREATE SSH KEYS

mkdir /home/syoung/notes/agua/keypair/syoung/aquarius5
cd /home/syoung/notes/agua/keypair/syoung/aquarius5
ssh-keygen -t rsa -f id_rsa -q -N ''


2. VERIFY KEY FILES

cd /home/syoung/notes/agua/keypair/syoung/aquarius5
cat id_rsa

-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAva2Q3Vz31RsGnHv7kRiTVKWvyGdFmxHxDe4Gw7AfESYbmvM8
/qOnpLK28zRLQlAc5fG60PEEJ6YRNsxp9jDHxPPYwUEZgyQtk2Duz9FknwndHaHb
jrWEnttFk6AdgUiySawv6dLLWmiovlvb4A5zouf/2v1dab94zWcaWUxLMCECzbVi
cQOLQlcWFZR/6OXy877Yo2xOXxKvgpjzoj5SATzNliRpWXnQZtm1TMnex6sbdnY/
wBlgl101MnOh3C/hBqRx63faSdiK2NTIcVLEuk5vcyf8AEeFZLQiHSp2NE4798A7
I7zEX3/1rlnIV7nkj7ckmnaAIQVO9EgOrTY8eQIDAQABAoIBAFdCsDCGgqWRh1sa
VsOLsMvyZYomqIkMmf80j/wa3FABXhXM7TSgiZFlfnEoj670ODc5HB7fom+zIJw7
MkxGaMEdBYzyrA/+5tC0eWk2Bbp8yTLGscFXlKmYasvdj3VYwlzOUESb612uZGMe
02qie2RoovZWNVFe+u5UDnUiejyrR1X8BKZ3rcglok3awHyH4kArTlLHnBKBemmg
MNkWGFy0HdTXSg14Twow87wQaLPjMAGe7qREE5MMqP9xx2zzj4+wsPrl7pDcb23d
72njdNaQyjWUTzAQgEnjSGvS3W+Je6MHCIk9kh68PKvsDELcfiVVQh6HMoGTGrzg
aek4EWECgYEA9AZESzHc/h/CKZCj+sVhh+HhtO6+9uaMM/N9RwAIt04esLHPMtKN
3cNESouUr+XHTxP/aJZNrgHqVsVPEN8p2KBnPZr1mFUruEW3kdTGDFzrqWFjvumH
708qmZQxzoSpE8MBbdmGQgAIsx1GlQUkGgwB1Dt+HMa0Q5Peu7r8LQUCgYEAxvyI
P6ALs3biVwQoa87cLF9oAxmeBFO/JJpg/Weup6q91rcVfWcG4GV25sOMzXBEDUgz
1AdIXK40xCM/pRastFQ8fEUJ09s1/6z3OzK2RLOsXbae/boMMB9ShtyHEgFnjeNy
rSh4IdiTpD6STrCBPA5V3Tgwkmtv/+FPZzVjy+UCgYEAh3aXINsMX/IHWgWWUhaS
XtlQ75z9W5h+SjSn3esx63gtZ089w2vJH0tPtMYpgz/eVZK3XTra4nbjvMmJa8dG
tp/M0BEetzLIs2HYVtc0HhbTJ9MNiSSgtoNPFbSDta5FIdhGCdIQSsE0EyJ0VTNm
aCM0PLnN93GDDmSe574UUXUCgYAK/b/447pBu3tdGxmwesimms5//VZBHu8b8nsR
BD0dfczmo05IkvxKQNCEhqCsaFsZ8LcMKyrQE79OZjQJxmrbuxtsMdQNI7qj2MX/
OxneSZ5nvsKheTlbHx/L2zqKwBEcQUgAUI/yLqhZFiu2tQEudAxCH+xu6ghRtfxQ
0x4kEQKBgHS8mLu7hhBwtQm2YX2uZBG/0XcHbJ+zvE2KFWIrNPZ2fiORWIolw8MO
KeRca2MuPYRnHjjPSVzfuFTT5Sfc9DMsvmRYMzWn/bk8OJDQvm2bEtGUT60nYdbX
3ZwtBgnJpdsU+KiBhBVAHrDlQGjr/jbKTLVzqaDMd6DlcBm3zywf
-----END RSA PRIVATE KEY-----


cd /home/syoung/notes/agua/keypair/syoung/aquarius5
cat id_rsa.pub 

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9rZDdXPfVGwace/uRGJNUpa/IZ0WbEfEN7gbDsB8RJhua8zz+o6eksrbzNEtCUBzl8brQ8QQnphE2zGn2MMfE89jBQRmDJC2TYO7P0WSfCd0doduOtYSe20WToB2BSLJJrC/p0staaKi+W9vgDnOi5//a/V1pv3jNZxpZTEswIQLNtWJxA4tCVxYVlH/o5fLzvtijbE5fEq+CmPOiPlIBPM2WJGlZedBm2bVMyd7Hqxt2dj/AGWCXXTUyc6HcL+EGpHHrd9pJ2IrY1MhxUsS6Tm9zJ/wAR4VktCIdKnY0Tjv3wDsjvMRff/WuWchXueSPtySadoAhBU70SA6tNjx5 syoung@computer1


3. PASTE IN id_rsa.pub TO GITHUB SSH KEY

    ok
    

4. COPY TO .ssh

    OK
    
5. CREATE TOKEN AND ADD TO curl.txt


cat /home/syoung/notes/agua/keypair/syoung/testagua/curl.txt

    header = "Authorization: token 3b30695c9768c03731abfe78c9c66227e55d8e9a"


    
</entry>
<entry [Sat 2013:05:11 19:15:39 EST] REMOVED envars~>
    
1. ADD TO .gitignore

    t/bin/Infusion/Common/Login/envars~


2. PURGE FROM REPO
    
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch t/bin/Infusion/Common/Login/envars~' \
  --prune-empty --tag-name-filter cat -- --all


3. FORCE PUSH TO REMOTE

git push ill master --force


4. PURGE FROM LOCAL REPO

rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now



</entry>
<entry [Fri 2013:05:10 05:16:23 EST] HOW TO REMOVE SENSITIVE DATA THAT HAS BEEN ACCIDENTALLY COMMITED>

PURGE FILE FROM REPO

1. ADD TO .gitignore

    t/bin/Infusion/Common/Login/envars


2. PURGE FROM REPO
    
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch t/bin/Infusion/Common/Login/envars' \
  --prune-empty --tag-name-filter cat -- --all


3. FORCE PUSH TO REMOTE

git push ill master --force


4. PURGE FROM LOCAL REPO

rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now


https://help.github.com/articles/remove-sensitive-data

1. CHANGE PASSWORD

2. REMOVE FILE FROM HISTORY

Now that the password is changed, you want to remove the file from history and add it to the .gitignore to ensure it is not accidentally re-committed. For our examples, we're going to remove Rakefile from the GitHub gem repo.

$ git clone https://github.com/defunkt/github-gem.git
# Initialized empty Git repository in /Users/tekkub/tmp/github-gem/.git/
# remote: Counting objects: 1301, done.
# remote: Compressing objects: 100% (769/769), done.
# remote: Total 1301 (delta 724), reused 910 (delta 522)
# Receiving objects: 100% (1301/1301), 164.39 KiB, done.
# Resolving deltas: 100% (724/724), done.

$ cd github-gem

$ git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch Rakefile' \
  --prune-empty --tag-name-filter cat -- --all
# Rewrite 48dc599c80e20527ed902928085e7861e6b3cbe6 (266/266)
# Ref 'refs/heads/master' was rewritten
This command will run the entire history of every branch and tag, changing any commit that involved the file Rakefile, and any commits afterwards. Commits that are empty afterwards (because they only changed the Rakefile) are removed entirely. Now that we've erased the file from history, let's ensure that we don't accidentally commit it again.

Please note that this will overwrite your existing tags.

$ echo "Rakefile" >> .gitignore

$ git add .gitignore

$ git commit -m "Add Rakefile to .gitignore"
# [master 051452f] Add Rakefile to .gitignore
#  1 files changed, 1 insertions(+), 0 deletions(-)
This would be a good time to double-check that you've removed everything that you wanted to from the history. If you're happy with the state of the repo, you need to force-push the changes to overwrite the remote repo.

$ git push origin master --force
# Counting objects: 1074, done.
# Delta compression using 2 threads.
# Compressing objects: 100% (677/677), done.
# Writing objects: 100% (1058/1058), 148.85 KiB, done.
# Total 1058 (delta 590), reused 602 (delta 378)
# To https://github.com/defunkt/github-gem.git
#  + 48dc599...051452f master -> master (forced update)
You will need to run this for every branch and tag that was changed. The --all and --tags flags may help make that easier.

Purge files that have been moved

As a special note: if you need to purge a file that has been moved since creation, you need to also run the filter-branch step on all former paths.

Cleanup and reclaiming space

While git filter-branch rewrites the history for you, the objects will remain in your local repo until they've been dereferenced and garbage collected. If you are working in your main repo you might want to force these objects to be purged.

$ rm -rf .git/refs/original/

$ git reflog expire --expire=now --all

$ git gc --prune=now
# Counting objects: 2437, done.
# Delta compression using up to 4 threads.
# Compressing objects: 100% (1378/1378), done.
# Writing objects: 100% (2437/2437), done.
# Total 2437 (delta 1461), reused 1802 (delta 1048)

$ git gc --aggressive --prune=now
# Counting objects: 2437, done.
# Delta compression using up to 4 threads.
# Compressing objects: 100% (2426/2426), done.
# Writing objects: 100% (2437/2437), done.
# Total 2437 (delta 1483), reused 0 (delta 0)
Note that pushing the branch to a new or empty GitHub repo and then making a fresh clone from GitHub will have the same effect.

Dealing with collaborators

You may have collaborators that pulled your tainted branch and created their own branches off of it. After they fetch your new branch, they will need to use git rebase on their own branches to rebase them on top of the new one. The collab should also ensure that their branch doesn't reintroduce the file, as this will override the .gitignore file. Make sure your collab uses rebase and not merge, otherwise he will just reintroduce the file and the entire tainted history... and likely encounter some merge conflicts.

Cached data on GitHub

Be warned that force-pushing does not erase commits on the remote repo, it simply introduces new ones and moves the branch pointer to point to them. If you are worried about users accessing the bad commits directly via SHA1, you will have to delete the repo and recreate it. If the commits were viewed online the pages may also be cached. Check for cached pages after you recreate the repo, if you find any open a ticket on GitHub Support and provide links so staff can purge them from the cache.

Avoiding accidental commits in the future

There are a few simple tricks to avoid committing things you don't want committed. The first, and simplest, is to use a visual program like GitHub for Mac or gitx to make your commits. This lets you see exactly what you're committing, and ensure that only the files you want are added to the repo. If you're working from the command line, avoid the catch-all commands git add . and git commit -a, instead use git add filename and git rm filename to individually stage files. You can also use git add --interactive to review each changed file and stage it, or part of it, for commit. If you're working from the command line, you can also use git diff --cached to see what changes you have staged for commit. This is the exact diff that your commit will have as long as you commit without the -a flag.


    
</entry>
<entry [Wed 2013:05:01 17:55:47 EST] GIT SHORTCUTS>

ADDED TO .bash_profile:

<!--
gitadded() { git log --format=%aD --follow -- <FILE> | tail -1; }
-->

Git Show the Date When a File Was First Added to a Git Repo »	

<!--
git log --format=%aD --follow -- <FILE> | tail -1
-->

bash Piping Two Inputs into a Linux Shell Command »	

diff <(git log --oneline origin) <(git log --oneline)

Git Clear the Index of Stage Files »	

git reset HEAD

Git Removing the Working Tree from a Repo (Making it “Bare”) »	

# Repo in myRepo/
mv myRepo/.git myRepo.git
rm -fr myRepo
cd myRepo.git
git config core.bare true

Git Delete a remote branch in Git »

Basically, push "nothing" to the branch....

git push origin :branch-to-delete

Git Find a dangling commit and reset current branch to it »

Useful if you want to undo a `git reset --hard...

$ git fsck --lost-found
dangling commit e7e3a2e82abd4f7160618b7f60b9e141b69fb153

# or...

$ git reflog
fdc6198 HEAD@{0}: cherry-pick: Adds additional DEBUG macros...
ab67f92 HEAD@{1}: checkout: moving from ARC-version to master
e7e3a2e HEAD@{2}: an undone commit i want to get back

# then
$ git reset --hard e7e3a2e
Git Checkout a file from a previous commit into a new filename in the current tree »	
git show HEAD^^:Full/Path/To/File.txt > Dest/Path/File2.txt
Git Useful Git aliases »
Credits:...
# .gitconfig in your repo, user or system folder
[alias]
ci = commit
cim = commit -m 
st = status
commit-all = !git add -A && git commit   # long version
cia = !git add -A && git commit          # add/update everything and commit
ciam = !git add -A && git commit -m      
add-all = add -A
aa = add -A
this = !git init && git add . && git commit -m \"initial commit\"    #
unstage = reset HEAD --   # Unstage a specific file
last = log -1 HEAD        # Show last commit
lg = log --oneline -20    # Show last 20 logs as one liners without pagination.
copy-out = !sh -c 'git show $0:"$1" > "$2"' # Checkout a file from a previous commit into a new filename
Git Update latest commit with some things you forgot (or update the commit message) »	
# Add the new files / prep the stage as you'd like it to be
git commit --amend
    
</entry>
<entry [Tue 2013:04:09 21:32:37 EST] INCOMPLETE MERGE ERROR MESSAGE>

PROBLEM

DOING git commit -a GET THIS ERROR:

Merge commit 'stash@{1}' into dev-ajax

Conflicts:
        html/plugins/infusion/Filter.js
        html/plugins/infusion/Infusion.js
        html/plugins/infusion/templates/infusion.html
#
# It looks like you may be committing a merge.
# If this is not correct, please remove the file
#       .git/MERGE_HEAD
# and try again.


SOLUTION

1. MOVED FILES IN QUESTION TO SAFE LOCATION:

mkdir ~/dev-ajax-merge
cp html/plugins/infusion/Filter.js ~/dev-ajax-merge
cp html/plugins/infusion/Infusion.js ~/dev-ajax-merge
cp html/plugins/infusion/templates/infusion.html ~/dev-ajax-merge

2. REMOVED .git/MERGE_HEAD FILE

rm -fr .git/MERGE_HEAD


3. CAN NOW COMMIT NORMALLY!!



</entry>

<entry [Fri 2013:03:29 00:54:00 EST] FIXED ERROR 'insufficient permission for adding an object to repository database ./objects'>

http://parizek.com/2011/05/git-insufficient-permission-for-adding-an-object-to-repository-database-objects/

git insufficient permission for adding an object to repository database ./objects

This could be caused by one of the following:

The repository isn't configured to be a shared repository (see core.sharedRepository in git help config). If the output of:

git config core.sharedRepository
is not group or true or 1 or some mask, try running:

git config core.sharedRepository group

and then re-run the recursive chmod and chown.

The operating system doesn't interpret a setgid bit on directories as "all new files and subdirectories should inherit the group owner".

When core.sharedRepository is true or group, Git relies on a feature of GNU operating systems (e.g., every Linux distribution) to ensure that newly created subdirectories are owned by the correct group (the group that all of the repository's users are in). This feature is documented in the GNU coreutils documentation:

... [If] a directory's set-group-ID bit is set, newly created subfiles inherit the same group as the directory, and newly created subdirectories inherit the set-group-ID bit of the parent directory. ... [This mechanism lets] users share files more easily, by lessening the need to use chmod or chown to share new files.

However, not all operating systems have this feature (NetBSD is one example). For those operating systems, you should make sure that all of your Git users have the same default group. Alternatively, you can make the repository world-writable by running git config core.sharedRepository world (but be careful—this is less secure).

The file system doesn't support the setgid bit (e.g., FAT). ext2, ext3, ext4 all support the setgid bit. As far as I know, the file systems that don't support the setgid bit also don't support the concept of group ownership so all files and directories will be owned by the same group anyway (which group is a mount option). In this case, make sure all Git users are in the group that owns all the files in the file system.
Not all of the Git users are in the same group that owns the repository directories. Make sure the group owner on the directories is correct and that all users are in that group.

</entry>
<entry [Mon 2013:03:25 17:42:07 EST] FIXED ERROR: 'change merge.renamelimit variable to at least 16949'>

git config merge.renamelimit 9999999

    
</entry>
<entry [Wed 2013:03:20 14:08:27 EST] FIXED GIT ERROR: 'Updating the following directories would lose untracked files in it'>

PROBLEM:

git checkout dev

error: Updating the following directories would lose untracked files in it:
	html/dojo-1.8.3/dijit
	html/dojo-1.8.3/docs
	html/dojo-1.8.3/dojo
	html/dojo-1.8.3/dojox
	html/dojo-1.8.3/dwb
	html/dojo-1.8.3/util


SOLUTION:

1. (OPTIONAL) REMOVE FILES

git rm -fr html/dojo-1.8.3/dijit    #### FIRST REMOVE FILES
git add html/dojo-1.8.3/dijit       #### THEN ADD FILES BACK -- VERY IMPORTANT
git pull                            #### LASTLY, PULL AGAIN


/saffrondev$ git checkout dev
error: Updating the following directories would lose untracked files in it:
	html/dojo-1.8.3/dojo
	html/dojo-1.8.3/dojox
	html/dojo-1.8.3/dwb
	html/dojo-1.8.3/util

cd /saffrondev
git add html/dojo-1.8.3/dojo
syoung@syoung-dev:/saffrondev$ git checkout dev
error: Updating the following directories would lose untracked files in it:
	html/dojo-1.8.3/dojox
	html/dojo-1.8.3/dwb
	html/dojo-1.8.3/util


	html/dojo-1.8.3/dojox
	html/dojo-1.8.3/dwb
	html/dojo-1.8.3/util

 
</entry>
<entry [Fri 2013:03:15 10:05:54 EST] GIT BRANCHING AND MERGING>

http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging


1. GET A CLEAN SLATE

Before you create a new branch, you should commit all of your current changes and, optionally, make sure you have a working state. This is because git won't let you switch branches if your working directory has uncommitted changes that conflict with the branch you’re checking out.

#### CHANGE TO THE REPOSITORY BASE DIRECTORY (CONTAINING THE .git DIRECTORY)
cd /repository/base/dir 

#### ADD ALL CHANGED FILES
git add .

#### COMMIT ALL CHANGES TO THE REPOSITORY
git commit -a

WHAT IF I HAVE ALREADY MADE SOME CHANGES?

Stash and merge - See 'Merge back Stashed Changes' below. 


2. SWITCH TO YOUR MASTER BRANCH

git checkout master


3. CREATE THE dev BRANCH

git checkout -b dev


4. MERGE BACK STASHED CHANGES

For example, while working in the 'dev' branch you have already made some changes which you realize should be best placed in a branch 'dev-ajax' offshoot from a new 'dev' branch from the 'master' branch. The following commands will allow you to save the changes you have made and transfer them to a newly-created 'dev-ajax' branch.

#### STASH YOUR CHANGES AS 'dev-ajax'
git stash save dev-ajax-changes

#### CREATE THE dev-ajax BRANCH AND MOVE TO IT
git checkout -b dev-ajax

#### LIST SAVED STASHES
git stash list
    stash@{0}: On master: dev-ajax-changes

#### MERGE STASHED dev-ajax-changes TO dev-ajax BRANCH
git merge stash@{0}

#### CHANGE BACK TO dev BRANCH
git checkout dev


</entry>
<entry [Thu 2013:03:14 20:13:32 EST] INSTALL GITOLITE ON UBUNTU>

http://andmag.se/2012/04/hosting-your-own-git-repo-with-gitolite/

Hosting your own git repo with Gitolite
April 4, 2012
After using CVS (A.K.A. “Crappy Versions System”) for way to long we decided to enter the twentieth century and move our code to Git. We had used private Github repos for some smaller projects, but were reluctant to move the whole organizations code to Github, so we started to look for alternatives. We have a lot of consultants, partners and short term employees working with our code so we needed a good way of controlling access to the repos and preferrably without giving each of them a unix user on the server where the repo is hosted. And guess what, Gitolite gives us all that.


What is Gitolite?

Gitolite is basically an access layer that sits on top of Git. Users are granted access to repos via a simple config file and you as an admin only needs the users public SSH key and a username from the user. Gitolite uses this to grant or deny access to your Git repositories. Gitolite is quite feature rich once you get to know it, but I will only cover the basic stuff here. The user guide is pretty good so make sure you check it out: http://sitaramc.github.com/gitolite/.

Installing Gitolite

First create a unix user called “git”, then copy your SSH public key (from your workstation) to the server. Then, run these commands:

git clone git://github.com/sitaramc/gitolite
gitolite/src/gl-system-install
gl-setup -q ~/YourName.pub
Gitolite should now be installed on the server. I recommend setting up a separate domain name for the repo in case you want to move it later on, we chose “git.ourserver.com”.

Now you need to clone Gitolite to your own workstation:

git clone git@git.yourdomain.no:gitolite-admin.git
The admin is very simple, there are basically two things you need to relate to: keydir/ and conf/gitolite.conf

Keydir

This is where Gitolite store all the users public keys. And as you can understand by now, most problems you are going to have with Gitolite is to get users to find/create and send you their SSH public key. Github currently has the best doc of how to do this. The filename of the public key is going to be the username of the user so make sure you pick something that identifies the user in your organization. Here are some example users:

/keydir/anders.pub
/keydir/employee.pub
/keydir/consultant.pub
The config

When you have the public key setup you need to create repos and give access to the users. The config file is located in conf/gitolite.conf. There are basically three concepts here, groups, users and repos. A group is prefixed with @ and a repo is prefixed with “repo “. Check out the following example config.

# /conf/gitolite.conf
 
@admin       =  anders
@employees   = @admin employee1 employee2 employee3
@consultants = @admin @employees consultant1 consultant2
 
repo gitolite-admin
        RW+      =  @admin
repo internal-project
        RW+      =  @employees
repo comsultant-project
        RW+      =  @consultants

In the config above, we have 3 groups: admin, employees and consultants. I chose to give access to groups instead of to individuals, but this simple file is actually quite powerful and gives you many ways of controlling access. It’s also possible to only grant read access (R) and to not give users the possibility to rewind a branch (RW). RW+ gives full access.

Commit and push!

Next step is to commit and push the changes to the Gitolite admin. Gitolite will create the users and repos for you.

git add .
git commit -m "Smart commit message goes here"
git push
If all goes well you should see a message from Gitolite that it has created the users and repos.

Create a new repo

So now you need to push your code to the new repo. If you do not already have a git repo locally that you want to upload, you need to create a new one:

git init
Then run git status to see the changes that are going to be commited. Make sure you have a sensible .gitignore file set up to filter out IDE files, OS files and files from other versioning control systems. Then run git add . and git commit -m “commit message” to commit stuff to your local repo. But in order to commit to your Gitolite repo you need to first specify an origin:

git remote add origin git@git.yourserver.com:projectname.git
Makes sure the project name matches the name in conf/gitolite.conf. Then you need to commit to the new origin:

git push origin master
And that’s it. The next (and maybe the hardest) step is to learn your users and employees how to send you their public key and to learn them Git… Good luck with that and happy coding!


ALSO:
----

http://silas.sewell.org/blog/2011/01/08/setup-gitolite-on-ubuntu/


Below is a quick guide to installing Gitolite on Ubuntu.

Create an SSH public/private key pair

[silas@client]$ ssh-keygen -t rsa
Upload the public key to the server

[silas@client]$ scp ~/.ssh/id_rsa.pub user@server.example.org:/tmp/user.pub
SSH to the server and become root

[silas@client]$ ssh user@server.example.org
[silas@server]$ sudo su -
Install gitolite

[root@server]# apt-get install gitolite
Switch to the gitolite user

[root@server]# su - gitolite
Run the Gitolite setup script

[gitolite@server]$ gl-setup /tmp/user.pub
From your client computer clone the gitolite-admin repository

[silas@client]$ git clone gitolite@server.example.org:gitolite-admin
Cloning into gitolite-admin...
remote: Counting objects: 6, done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 6 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (6/6), done.
Switch to the gitolite-admin directory

[silas@client]$ cd gitolite-admin
Create a test repository

[silas@client]$ vim conf/gitolite.conf
[silas@client]$ git commit -a -m "Add test repository"
[master 507045a] Add test repository
 1 files changed, 3 insertions(+), 0 deletions(-)
[silas@client]$ git push
Counting objects: 7, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 376 bytes, done.
Total 4 (delta 1), reused 0 (delta 0)
remote: Already on 'master'
remote: creating test...
remote: Initialized empty Git repository in /var/lib/gitolite/repositories/test.git/
To gitolite@server.example.org:gitolite-admin
   87cc470..507045a  master -> master
Clone the test repository

[silas@client]$ git clone gitolite@server.example.org:test
Cloning into test...
warning: You appear to have cloned an empty repository.
Add a README file to the test repository

[silas@client]$ echo "Test Repo" > README
[silas@client]$ git commit -a -m "Initial commit"
[master (root-commit) 4a49ee0] Initial commit
 1 files changed, 1 insertions(+), 0 deletions(-)
 create mode 100644 README
Push the changes to the server

[silas@client]$ git push origin master
Counting objects: 3, done.
Writing objects: 100% (3/3), 218 bytes, done.
Total 3 (delta 0), reused 0 (delta 0)
To gitolite@server.example.org:test
 * [new branch]      master -> master
Check out the Gitolite wiki for more documentation.

    
</entry>
<entry [Thu 2013:03:14 20:05:14 EST] SETTING UP A GITHUB-LIKE git@host:repository.git SERVER>

http://stackoverflow.com/questions/10888300/gitosis-vs-gitolite

INSTALL GITHUB-LIKE SERVER

1. Create a user named git

2. Add your and your team's public keys to the git user's .ssh/authorized_keys file

3. Change the git user's shell to be git-shell

4. Create repos on the server

5. start git pull/pushing to git@yourserver.com

The only difference between using a dedicated git user and not, is that if you setup the git user to use git-shell it won't allow itself to do anything else. In terms of acting as a git server though, it's identical to the no-install solution


NOTES
-----

I am looking for installing a git server to share projects with my team.

You can just use git.

To have a git server the only thing you need on the remote server is git. If you don't require fine-grained permissions (sharing with only your team suggests that's a possibility) or any extra features, you don't need gitolite, or similar.

The no-install solution

If git is available on the remote server, you can do what you're asking right now, without doing anything

ssh [user@]server
cd repos/are/here/
mkdir project.git
cd project.git
git init --bare
Locally:

cd projects/are/here/project
git remote add origin [user@]server:repos/are/here/project.git
git push -u origin master
Setting up a git server is easy.

If you want to do things with a dedicated git user, the docs for setting up a git server are short - because it really is quite easy to do.


    
</entry>
<entry [Wed 2012:12:19 18:23:09 EST] CREATED jobs GIT REPO>

cd /home/syoung/jobs
git init
git add .
git commit -m "first commit"
git remote add github git@github.com:syoung/jobs.git
git push -u github master


    
</entry>
<entry [Wed 2012:11:21 01:47:37 EST] USE git config tar.deploy.command TO EXTRACT git archive -- NB: DOES HONOUR .gitattributes>

git config tar.deploy.command "tar -x -C /path/to/target -f -"

CODE: lib/Agua/Ops/Stager.pm

method sourceToTarget ($package, $sourcerepo, $targetrepo, $branch) {
	$self->logDebug("");
	
	#### CHECKOUT TARGET BRANCH
	$self->checkoutBranch($targetrepo, $branch);
	$self->logDebug("AFTER checkoutBranch($targetrepo, $branch)");

	#### CHECKOUT SOURCE BRANCH
	$self->checkoutBranch($sourcerepo, $branch);
	$self->logDebug("AFTER checkoutBranch($sourcerepo, $branch)");

	#### DELETE FILES FROM TARGET (EXCEPT .git DIR)
	my $command = "rm -fr $targetrepo/*";
	$self->logDebug("command", $command);
	$self->runCommand($command);

	#### ARCHIVE SOURCE TO TARGET DIRS

# INSTEAD OF THIS:
#	$command = "cd $sourcerepo; git checkout-index -f -a --prefix=$targetrepo/";

# DO THIS:
	$command = qq{git config tar.deploy.command "tar -x -C $targetrepo -f -"};
	$self->logDebug("command", $command);
	my $archive = "cd $sourcerepo; git archive --format=tar HEAD";
	$self->logDebug("command", $command);
}

    
</entry>
<entry [Wed 2012:11:21 00:54:05 EST] EXPORT REPO (OR FILE) -- NB: DOES NOT HONOUR .gitattributes>

USE git checkout-index (INSTEAD OF git archive)

1. EXPORT REPO

The checkout-index command copies everything on your index into a different folder:

git checkout-index -f -a --prefix=/path/to/folder/

The -f option overwrites files, and the -a option means all files and folders.

Don’t forget the trailing slash on the --prefix option, as it’s very important! Omitting it will make the command think you want to prefix every file name with that argument instead.


2. EXPORT SUBDIRS OR FILES

If you wanted to just export a specific file or folder (in this case everything in the bin/ folder and the readme):

git checkout-index -f --prefix=/path/to/folder/ bin/* README.textile


You can also chain this command with 'find' to export a subdirectory of the repo:

find some-path -type f -print0 | xargs -0 git checkout-index -f --prefix=/some/other/path/

Daniel Schierbeck has wrapped this process up into a little script called git-export that is worth a look if you need to do this often.

NB: There is also a git bundle that can export references and objects.


</entry>
<entry [Fri 2012:10:26 05:38:33 EST] BRANCHES IN GIT>


NICE IMAGES
http://www.gitguys.com/topics/merging-branches-without-a-conflict/



</entry>
<entry [Fri 2012:10:26 04:34:05 EST] FIXED ERROR 'Everything up-to-date' EVEN THOUGH CHANGE HAVE BEEN MADE>

http://stackoverflow.com/questions/277077/why-is-git-telling-me-your-branch-is-ahead-of-origin-master-by-11-commits-a

PROBLEM

I had a problem that was similar to this where my working directory was ahead of origin by X commits but the git pull was resulting in Everything up-to-date. I did manage to fix it by following this advice. I'm posting this here in case it helps someone else with a similar problem.

SOLUTION

The basic fix is as follows:

git push {remote} {localbranch}:{remotebranch}


Where the words in brackets should be replaced by your remote name, your local branch name and your remote branch name. e.g.


git push origin master:master

    
</entry>
<entry [Sun 2012:10:14 19:07:06 EST] MULTILINE COMMIT>

--cleanup=< mode>
This option sets how the commit message is cleaned up. The < mode> can be one of verbatim, whitespace, strip, and default. The default mode will strip leading and trailing empty lines and #commentary from the commit message only if the message is to be edited. Otherwise only whitespace removed. The verbatim mode does not change message at all, whitespace removes just leading/trailing whitespace lines and strip removes both whitespace and commentary.


"$(echo -e 'TESTING MULTILINE\nonce again\n\nand more.')"

</entry>
<entry [Sat 2012:10:13 11:54:56 EST] INSTALL starcluster ON ERIDANUS>

PROBLEM

CLONE STARCLUSTER FAILS ON ERIDANUS

root@ip-10-120-247-49:/agua/apps# git clone git@github.com:agua/agua.git starcluster 
Cloning into starcluster...
Permission denied (publickey).
fatal: The remote end hung up unexpectedly
root@ip-10-120-247-49:/agua/apps# exit
logout
There are stopped jobs.

    
... BUT WORKS ON LAPTOP:


syoung@syoung-Satellite-C675D:/tmp$ git clone git@github.com:agua/agua.git starcluster 
Cloning into 'starcluster'...
^X^C
syoung@syoung-Satellite-C675D:/tmp$ suu
root@syoung-Satellite-C675D:/tmp# git clone git@github.com:agua/agua.git starcluster 
Cloning into 'starcluster'...
remote: Counting objects: 9452, done.
^Z
[1]+  Stopped                 git cl


DIAGNOSIS

USING git@github.com: INSTEAD OF git://github.com/


SOLUTION

CHANGED Ops/GitHub.pm TO USE git://github.com/ WHEN REPO IS PUBLIC (I.E., NO SSH ACCREDITATION)

    
</entry>
<entry [Sat 2012:10:13 03:53:51 EST] FIXED master VERSUS github/master PROBLEM WITH STARCLUSTER>

PROBLEM

cd /repos/private/syoung/starclusterdev
git checkout master

    Previous HEAD position was 2c149cb... Merge branch 'hotfix-0.92rc2'
    Switched to branch 'master'
    Your branch and 'github/master' have diverged,
    and have 1 and 1 different commit each, respectively.


SOLUTION

CHECKOUT MASTER AND THEN REBASE:

git pull --rebase syoung/starclusterdev


</entry>
<entry [Sat 2012:10:13 03:22:56 EST] HOW TO REVIEW A PULL REQUEST AND APPLY IT>

http://defunkt.io/hub/


# check out a pull request for review
$ git checkout https://github.com/defunkt/hub/pull/134
→ (creates a new branch with the contents of the pull request)

# directly apply all commits from a pull request to the current branch
$ git am -3 https://github.com/defunkt/hub/pull/134



As an open-source maintainer

Maintaining a project is easier when you can easily fetch from other forks, review pull requests and cherry-pick URLs. You can even create a new repo for your next thing.

# fetch from multiple trusted forks, even if they don't yet exist as remotes
$ git fetch mislav,cehoffman
→ git remote add mislav git://github.com/mislav/hub.git
→ git remote add cehoffman git://github.com/cehoffman/hub.git
→ git fetch --multiple mislav cehoffman

# check out a pull request for review
$ git checkout https://github.com/defunkt/hub/pull/134
→ (creates a new branch with the contents of the pull request)

# directly apply all commits from a pull request to the current branch
$ git am -3 https://github.com/defunkt/hub/pull/134

# cherry-pick a GitHub URL
$ git cherry-pick http://github.com/xoebus/hub/commit/177eeb8
→ git remote add xoebus git://github.com/xoebus/hub.git
→ git fetch xoebus
→ git cherry-pick 177eeb8

# `am` can be better than cherry-pick since it doesn't create a remote
$ git am http://github.com/xoebus/hub/commit/177eeb8

# open the GitHub compare view between two releases
$ git compare v0.9..v1.0

# put compare URL for a topic branch to clipboard
$ git compare -u feature | pbcopy

# create a repo for a new project
$ git init
$ git add . && git commit -m "It begins."
$ git create -d "My new thing"
→ (creates a new project on GitHub with the name of current directory)
$ git push -u origin master


One who uses GitHub for work

Save time at work by opening pull requests for code reviews and pushing to multiple remotes at once. Even GitHub Enterprise is supported.

# whitelist your GitHub Enterprise hostname
$ git config --global --add hub.host my.example.org

# open a pull request for a branch, put its URL to the clipboard
$ git push -u origin feature
$ git pull-request | pbcopy
→ (URL ready for pasting in a chat room)

# push to multiple remotes
$ git push production,staging
    
</entry>
<entry [Fri 2012:10:12 22:42:45 EST] FORKED jtriley/StarCluster TO agua/StarCluster>


1. FORKED jtriley/StarCluster

FROM:

https://github.com/jtriley/StarCluster

TO:

https://github.com/agua/StarCluster/



2. CLONED FORKED STARCLUSTER

FROM:

git@github.com:agua/StarCluster.git

TO:

/repos/public/agua/starclusterdev


cd /repos/public/agua
git clone git@github.com:agua/StarCluster.git starclusterdev
cd starclusterdev



3. CHECKOUT MASTER AND RESET TO 0.92rc2

git checkout master
git reset --hard 0.92rc2
    HEAD is now at 2c149cb... Merge branch 'hotfix-0.92rc2'
gitwhich
    refs/heads/master    
gitlog
    *   2c149cb (HEAD, tag: 0.92rc2, master) Merge branch 'hotfix-0.92rc2'

    

4. REMOVED LOCAL AND REMOTE TAGS (EXCEPT FOR 0.92.0-rc2)

LOCAL TAGS

git tag -d 0.92rc2 0.92rc1 0.92 StarCluster-0.91 StarCluster-0.9 0.92.1 0.93 0.93.1 0.93.2 0.93.3 


REMOTE TAGS

git push github :refs/tags/0.92rc2
git push github :refs/tags/0.92rc1
git push github :refs/tags/0.92
git push github :refs/tags/StarCluster-0.91
git push github :refs/tags/StarCluster-0.9
git push github :refs/tags/0.92.1
git push github :refs/tags/0.93
git push github :refs/tags/0.93.1
git push github :refs/tags/0.93.2
git push github :refs/tags/0.93.3




5. COPIED OVER PATCHED VERSION TO STAGE 1 syoung:starclusterdev

cd /repos/private/syoung/starclusterdev
rm -fr *
cp -r /data/starcluster/0.92rc2/* .
gitadd
git commit -a -m "First commit of patched StarCluster 0.92rc2"

git status
    #	modified:   bin/starcluster
    #	new file:   bin/starcluster.EDITED
    #	modified:   check.py
    #	modified:   clean.py
    #	modified:   docs/epydoc/build.sh
    #	modified:   docs/sphinx/make.bat
    #	new file:   jtriley-StarCluster-dca702e/.gitignore
    #	modified:   starcluster/balancers/sge/__init__.py
    #	modified:   starcluster/cli.py
    #	modified:   starcluster/cluster.py
    #	modified:   starcluster/clustersetup.py
    #	modified:   starcluster/commands/loadbalance.py
    #	modified:   starcluster/commands/start.py
    #	modified:   starcluster/config.py
    #	modified:   starcluster/logger.py
    #	modified:   utils/gitlog2changelog.py
    #	modified:   utils/s3mount.py
    #	modified:   utils/webserver.py



6. ADDED STARCLUSTER-VERSION FILE
(USED BY starcluster.pm TO RUN PYTHON easy_install:
easy_install -m StarCluster==0.92rc2)

em /repos/private/syoung/starclusterdev/STARCLUSTER-VERSION
    0.92rc2

gitadd
git commit -a -m "+Add: STARCLUSTER-VERSION file - version 0.92rc"



7. COPIED DIRS

cp -r /repos/public/agua/starclusterdev /repos/private/syoung/starcluster
cp -r /repos/public/agua/starclusterdev /repos/private/syoung/starclusterdev
cp -r /repos/public/agua/starclusterdev /repos/public/agua/starcluster


   
8. ADD upstream REMOTE TO TRACK UPDATES TO ORIGINAL STARCLUSTER REPO

#### Assigns the original repo to a remote called "upstream"
git remote add upstream https://github.com/jtriley/StarCluster.git


LATER: FETCH CHANGES TO ORIGINAL REPO (WITHOUT MODIFYING YOUR FILES)

# Pulls in changes not present in your local repository
# Will not modify your files
git fetch upstream



NOTES
-----

FORGOT TO CHECKOUT MASTER BEFORE COPY PATCHED VERSION, ETC. SO HAD TO MERGE CHANGES TO MASTER

git checkout master
    Warning: you are leaving 2 commits behind, not connected to
    any of your branches:
    
      4690b59 +Add: STARCLUSTER-VERSION file - version 0.92rc
      8536c8e +Add: First commit of patched StarCluster 0.92rc2
    
    If you want to keep them by creating a new branch, this may be a good time
    to do so with:
    
     git branch new_branch_name 4690b59704c64afea28921be390f9a19c3754bc7

    Branch master set up to track remote branch master from origin.
    Switched to a new branch 'master'


git branch agua 4690b59704c64afea28921be390f9a19c3754bc7
git checkout master
git merge -X theirs agua

    Auto-merging starcluster/logger.py
    Auto-merging starcluster/config.py
    Auto-merging starcluster/commands/start.py
    Auto-merging starcluster/commands/loadbalance.py
    Auto-merging starcluster/clustersetup.py
    Auto-merging starcluster/cluster.py
    Auto-merging starcluster/cli.py
    Auto-merging starcluster/balancers/sge/__init__.py
    Auto-merging check.py
    Merge made by the 'recursive' strategy.
     STARCLUSTER-VERSION                    |    1 +
     bin/starcluster                        |    5 ++
     bin/starcluster.EDITED                 |   13 +++
     jtriley-StarCluster-dca702e/.gitignore |    9 +++
     starcluster/balancers/sge/__init__.py  |  136 ++++++++++++++++++++++----------
     starcluster/cli.py                     |   45 +++++++++++
     starcluster/cluster.py                 |    6 +-
     starcluster/clustersetup.py            |   73 ++++++++++++++++-
     starcluster/commands/loadbalance.py    |    5 ++
     starcluster/commands/start.py          |   20 ++++-
     starcluster/config.py                  |    8 +-
     starcluster/logger.py                  |    2 +
     12 files changed, 269 insertions(+), 54 deletions(-)
     create mode 100644 STARCLUSTER-VERSION
     create mode 100644 bin/starcluster.EDITED
     mode change 100755 => 100644 check.py
     mode change 100755 => 100644 clean.py
     mode change 100755 => 100644 docs/epydoc/build.sh
     mode change 100644 => 100755 docs/sphinx/make.bat
     create mode 100644 jtriley-StarCluster-dca702e/.gitignore
     mode change 100755 => 100644 utils/gitlog2changelog.py
     mode change 100755 => 100644 utils/s3mount.py
     mode change 100755 => 100644 utils/webserver.py

     
     

    
</entry>
<entry [Tue 2012:09:11 03:59:00 EST] git diff EXAMPLES>

http://www.kernel.org/pub/software/scm/git/docs/git-diff.html

Various ways to check your working tree
    git diff            # [1]
    git diff --cached   # [2]
    git diff HEAD       # [3]
Changes in the working tree not yet staged for the next commit.

Changes between the index and your last commit; what you would be committing if you run "git commit" without "-a" option.

Changes in the working tree since your last commit; what you would be committing if you run "git commit -a"

Comparing with arbitrary commits
    git diff test            # [1]
    git diff HEAD -- ./test  # [2]
    git diff HEAD^ HEAD      # [3]


Instead of using the tip of the current branch, compare with the tip of "test" branch.

Instead of comparing with the tip of "test" branch, compare with the tip of the current branch, but limit the comparison to the file "test".

Compare the version before the last commit and the last commit.

Comparing branches
    git diff topic master    # [1]
    git diff topic..master   # [2]
    git diff topic...master  # [3]
Changes between the tips of the topic and the master branches.

Same as above.

Changes that occurred on the master branch since when the topic branch was started off it.

Limiting the diff output
    git diff --diff-filter=MRC            # [1]
    git diff --name-status                # [2]
    git diff arch/i386 include/asm-i386   # [3]
Show only modification, rename and copy, but not addition nor deletion.

Show only names and the nature of change, but not actual diff output.

Limit diff output to named subtrees.

Munging the diff output
    git diff --find-copies-harder -B -C  # [1]
    git diff -R                          # [2]
Spend extra cycles to find renames, copies and complete rewrites (very expensive).

Output diff in reverse.


    
</entry>
<entry [Fri 2012:07:27 13:21:38 EST] REVIEW OF GITHUB CREATE/REMOVE OAUTH TOKENS>

CREATE OAUTH TOKEN
------------------

REQUIRED: LOGIN AND PASSWORD (***CLIENT ID NOT NEEDED***)

OPTIONAL: SCOPES AND NAME

curl -K /tmp/curl.9125.txt https://api.github.com/authorizations -d '{"note":"agua","scopes":["public_repo","repo","delete_repo"]}'

    {
      "updated_at": "2012-07-27T17:18:47Z",
      "note_url": null,
      "note": "agua",
      "scopes": [
        "public_repo",
        "repo",
        "delete_repo"
      ],
      "url": "https://api.github.com/authorizations/536652",
      "created_at": "2012-07-27T17:18:47Z",
      "token": "78a6f440d57ca9996d19500d2480a1ff35ac990b",
      "app": {
        "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
        "name": "agua (API)"
      },
      "id": 536652
    }


REMOVE OAUTH TOKEN
------------------

REQUIRES LOGIN, PASSWORD ***AND TOKEN ID***




    
    
</entry>
<entry [Thu 2012:07:26 21:49:08 EST] SEARCH FOR FILES IN PREVIOUS COMMITS>


git ls-files "*hub-remove.tsv"

git ls-files | grep 'name you're looking for'



    
</entry>
<entry [Thu 2012:07:26 21:25:32 EST] GET FILE CONTENTS FROM PREVIOUS COMMITS WITH git show OR git checkout>

NB: git checkout OVERWRITES THE EXISTING FILE!!!!

INSTEAD, USE REDIRECT WITH git show TO PRINT TO FILE. 


git show
--------
<!--
git show <treeish>:<file>
-->

PRINT TO STDOUT THE CONTENTS OF index.html FOUR COMMITS BACK FROM HEAD:

git show HEAD~4:index.html



git checkout
------------
<!--
git checkout <treeish> <file>
-->

***REPLACE*** FILE index.html WITH VERSION FOUR COMMITS BACK FROM HEAD:


git checkout HEAD html/agua.html


OR USE '--' TO MAKE SURE FILENAME DOESN'T LOOK LIKE A BRANCH OR TAG:

git checkout HEAD -- html/agua.html


EXAMPLES:

git checkout v1.2.3 -- filename         # tag v1.2.3
git checkout stable -- filename         # stable branch
git checkout origin/master -- filename  # upstream master
git checkout HEAD -- filename           # the version from the most recent commit
git checkout HEAD^ -- filename          # the version before the most recent commit



NOTES
-----

http://gitready.com/intermediate/2009/02/27/get-a-file-from-a-specific-revision.html    
git ready
learn git one commit at a time
by Nick Quaranto

get a file from a specific revision
committed 27 Feb 2009

If you know how Git stores data through blobs, trees, and commits hopefully it should make sense why it’s a bit annoying to get a file from a specific revision out of your repository. What you want is inside of a blob from whichever commit, so simply saying I want to see this commit won’t cut it. Now, you could reset the working directory back to the commit you want to see then look at the file, but that’s lame.
Enter git show, which is an awesome tool for this job. This command is quite versatile and deserves several tips on what it can do, but let’s stick to the task at hand: we want to pull a file’s contents out from a specific revision. Usually the command would be done like so:


<!--

git show <treeish>:<file>

-->

So let’s say we want to go back four commits from our current HEAD, and we want the index.html file.

<!--

git show HEAD~4:index.html

-->

You could of course pass any valid treeish into the command. It will accept the actual SHA1 of the blob as well, but that’s pretty unlikely for most use cases. Probably the best use of this command is to see what the file looked like and perhaps write its contents out to a new file (or replace the old one!) if so desired.
Check out some of the other uses of this command at its manpage, and of course if you have other useful hints with it, let us know by submitting a tip!

</entry>
<entry [Thu 2012:07:19 21:10:00 EST] CHANGE FILES IN PREVIOUS COMMIT WITH git rebase>
    
http://stackoverflow.com/questions/1186535/how-to-modify-a-specified-commit

You can use git rebase, for example, if you want to modify commit bbc643cd, run

$ git rebase bbc643cd^ --interactive
In the default editor, modify 'pick' to 'edit' in the line whose commit you want to modify. Make your changes and then stage them with

$ git add FILEPATTER
Now you can use

$ git commit --amend
to modify the commit, and after that

$ git rebase --continue
to return back to the previous head commit


</entry>
<entry [Thu 2012:07:19 00:51:00 EST] ADDED ssh-rsa KEY TO aguadev GITHUB ACCOUNT (TO RUN TESTS)>

NEEDED TO PUSH REPO TO testversion DURING RUNNING OF Upgrade.t


1. GENERATED id_rsa AND id_rsa.pub

cd /agua/conf/aguadev
ssh-keygen -t rsa -f id_rsa -q -N ''

cat id_rsa

-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAnqN76mZhdnRAcRM4siQwIYOXoxhZVWkDDPIkIn6a3SWHEEv/
DI2aMp0KTU63K0iSxJK4V2sqGOpTaJlbCuKGc06mGBo6FzSNyHllizZtJIGutd0p
DdbZQnCPTk3IT0ByHBYV6AtODd9blF2z66n1X09matlLS8fLemR3oluXudURZmLP
8IxA5XwJCBLNrTHvzuK7vYUizOlqMSFejcZ3MDQCWjPfPGpE6D0Jrg9/e3KkfZ+U
Oc0e70wJwGr6Fs2GPwQCzrZdLwRyevkacvPH/kSXdCi9geK9kPGNeDDIN4s7+C9g
VkkCwrPwWq6OITJEtMgI8LdZeQiZL0Rh+OpiuwIDAQABAoIBAFY5W6/Sx+SfWStc
nDNPMg31PWU7ZcrjkfHmZreNAtVygU/dTppfGNGrw56zSyGuh39qk+GH8NCsBHvU
5sQqzZM8y1BMaQiV2v585TFeesId7n0Q4TCRd3MCRRH1ewuAZsVXR77g7iLiJR+m
MpXDwgd026D1zFQ7GyDCHLhVeklZZ6HpdaK0Mt6EPMufnxwJha1DCL1JLCorZT9Q
b333UboHYHYRY1+bIbGNyvVD5ibRP++I47I0f4qBG/Bco9iR2sijdxaKfQ8bNSD0
rIw/W62cQwJOeA/IcZzCy/JijHX4P0LmyH6Ga2NSrspbqZs5TeDxGp+YV4n48KzL
4EQ2ESkCgYEA0iPbBgBLNYtXWulo0WzJJOnnnKut7HWUX6s4e8LjonqPf3TyXNQh
JVQK6x9MMjDD38gz1qHSAa+eKa2//Bggtyddu3kuYcBRvEXcwADd1u681IHUZUTw
BBFoy6qMPaDUitEg/Dl3yKYmkF7ZYJA4H+UGMvKwcIw9izbTcd5LRAcCgYEAwUJV
8dLrOuxksMP4nE2vmxqeLpkW04rJE2LvGL93ttpqpaedtJBa/qTooYWUSHbZhjbM
Yvtv7+LFaKWeb3VEH7ecZEDuBACAXAqCTR1gO1m9yYaNnuADKkOsMnY5+h3TuZML
WSSx0kk9NKeFfcdYf4kcgApo+O9RyZrHeS8Qxq0CgYAlcdovYZIFQoUYYAsbdkUJ
XNy2oCjnv7PmsD3qX7nsU+aKEa62N96IJkejyfnr36CnmacTEda4EjEewCU7qJj7
yfn71AYdyQVHhTNmy0C8ceIYA+JzASu7rdZ8pDFFMgltiwJTr3HWwTSR+TTG7ivy
Ev9dyL0D8RluWyCmY7QJtQKBgCsRam/KzktCVSojcir7ERBivS+rRC/+dNMSMDB2
suoYAL5L/VQ4+15WR9V/HE2N1uoXGjNQz2BJTC8HAajbHERpObwJ0EEqD3Dzkpg2
3LQ9SpM3niXyzCHGFQDl4gPAU+e+QkAqckpnsfEjCBfArhM17hkGuOAJDVP9X0i9
WWK9AoGAL5vtYIoLbQAl8uKjyZzdr/CNp38sCOFN91/o1vMJke/5fpODr6ACkotJ
DoLcv9AMn5mlBSm51y9Wc1H+CjiJaigT5EjdmMjwFH+fbC0lniYcQNCNtw3V8mXe
IOzVSFF6Efyi0XvaDUuNoyIe4C711by8W8tpPfnAvCbuOeWL6co=
-----END RSA PRIVATE KEY-----


cat id_rsa.pub 

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeo3vqZmF2dEBxEziyJDAhg5ejGFlVaQMM8iQifprdJYcQS/8MjZoynQpNTrcrSJLEkrhXayoY6lNomVsK4oZzTqYYGjoXNI3IeWWLNm0kga613SkN1tlCcI9OTchPQHIcFhXoC04N31uUXbPrqfVfT2Zq2UtLx8t6ZHeiW5e51RFmYs/wjEDlfAkIEs2tMe/O4ru9hSLM6WoxIV6NxncwNAJaM988akToPQmuD397cqR9n5Q5zR7vTAnAavoWzYY/BALOtl0vBHJ6+Rpy88f+RJd0KL2B4r2Q8Y14MMg3izv4L2BWSQLCs/Baro4hMkS0yAjwt1l5CJkvRGH46mK7 root@syoung-Satellite-C675D



2. SET PERMISSIONS

chmod 600 /agua/conf/aguadev/id_rsa


3. UPDATED envars.sh FILE

cat /agua/conf/aguadev/envars.sh
    #!/bin/sh
    
    export login=aguadev
    export password=rst2agua
    export token=196327016219a918ab68ee368a1f56024a1494f0
    export keyfile=/agua/conf/aguadev/id_rsa
    export curlfile=/agua/conf/aguadev/curl.txt


4. ADDED id_rsa TO aguadev GITHUB KEYS

    OK

    
</entry>
<entry [Wed 2012:07:18 06:19:25 EST] FIXED ERROR 'up to date' WHEN CHANGES PRESENT>
    
http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging


PROBLEM

TRY TO ADD + COMMIT BUT GET 'up to date' MESSAGE DESPITE CHANGES


DIAGNOSIS

DETACHED HEAD


SOLUTION

1. CREATE A BRANCH IN THE DETACHED STATE

2. STASH ANY UNCOMMITED CHANGES IN master BEFORE THE HEAD DETACHED

3. MERGE BRANCH INTO MASTER


DETAILS

1. CREATE A BRANCH IN THE DETACHED STATE

git checkout master

    Warning: you are leaving 15 commits behind, not connected to
    any of your branches:
    
      d62aa1f -Fix: Sync.t call to Sync::_syncApps ok
      8e0cded Pushed by syoung, Wed Jul 18 01:33:21 EDT 2012
      8038280 Pushed by syoung, Tue Jul 17 21:53:22 EDT 2012
      7a89b16 Pushed by syoung, Tue Jul 17 21:49:16 EDT 2012
     ... and 11 more.
    
    If you want to keep them by creating a new branch, this may be a good time
    to do so with:
    
     git branch new_branch_name d62aa1f880262968524f725a44efd146763525f2
    
    Switched to branch 'master'


git branch syncok d62aa1f880262968524f725a44efd146763525f2



git merge syncok
error: The following untracked working tree files would be overwritten by merge:
	bin/Agua/Common/Logger/inputs/exists/.dummy
Please move or remove them before you can merge.
Aborting
syoung@syoung-Satellite-C675D:/agua/t$ rm -fr bin/Agua/Common/Logger/inputs/exists/.dummy
rm: cannot remove `bin/Agua/Common/Logger/inputs/exists/.dummy': Permission denied
syoung@syoung-Satellite-C675D:/agua/t$ sudo rm -fr bin/Agua/Common/Logger/inputs/exists/.dummy
syoung@syoung-Satellite-C675D:/agua/t$ git merge syncokerror: unable to create file bin/Agua/Common/Logger/inputs/exists/.dummy (Permission denied)
syoung@syoung-Satellite-C675D:/agua/t$ sudo chown -R syoung:syoung *
syoung@syoung-Satellite-C675D:/agua/t$ git merge syncok


2. STASH ANY UNCOMMITED CHANGES IN master BEFORE THE HEAD DETACHED

git stash save pre-syncok

    Saved working directory and index state On master: pre-syncok
    HEAD is now at 0db1c9b -Fix: EXITLABEL in Upgrade.t & GIT_SSH for push


3. MERGE BRANCH INTO MASTER

git merge syncok
    ...
    Auto-merging Makefile
    CONFLICT (content): Merge conflict in Makefile
    Automatic merge failed; fix conflicts and then commit the result.


REMOVE LOG FILES

rm -fr bin/*/outputs/*.log
rm -fr bin/*/*/outputs/*.log
rm -fr bin/*/*/*/outputs/*.log
rm -fr bin/*/*/*/*/outputs/*.log
rm -fr bin/*/*/*/*/*/outputs/*.log

git merge syncok
    OK
    
    
</entry>
<entry [Wed 2012:07:18 04:16:09 EST] NOTE: ERROR WITH GITHUB API CREATING REPO USING OAUTH TOKEN>

IF YOU USE "private":0, THE API WILL TREAT IT AS 'PRIVATE':
    
curl -X POST -K /agua/conf/aguadev/curl.txt  https://api.github.com/user/repos -d '{"name":"biorepository","description": "biorepository","private":0}'

    {
      "errors": [
        {
          "code": "custom",
          "resource": "Repository",
          "message": "name can't be private. You are over your quota.",
          "field": "name"
        }
      ],
      "message": "Validation Failed"
    }

    
OMITTING THE "private":0 PARAMETER 

curl -X POST -K /agua/conf/aguadev/curl.txt  https://api.github.com/user/repos -d '{"name":"biorepository","description": "biorepository"}'

    {
      "permissions": {
        "pull": true,
        "push": true,
        "admin": true
      },
      "open_issues": 0,
      "mirror_url": null,
      "clone_url": "https://github.com/aguadev/biorepository.git",
      "git_url": "git://github.com/aguadev/biorepository.git",
      "homepage": null,
      "owner": {
        "login": "aguadev",
        "avatar_url": "https://secure.gravatar.com/avatar/be892368e18041fb06dc97e53b75d527?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
        "id": 1383046,
        "url": "https://api.github.com/users/aguadev",
        "gravatar_id": "be892368e18041fb06dc97e53b75d527"
      },
      "ssh_url": "git@github.com:aguadev/biorepository.git",
      "master_branch": "master",
      "has_issues": true,
      "has_downloads": true,
      "description": "biorepository",
      "pushed_at": "2012-07-18T08:15:13Z",
      "forks": 1,
      "size": 0,
      "fork": false,
      "svn_url": "https://github.com/aguadev/biorepository",
      "created_at": "2012-07-18T08:15:13Z",
      "full_name": "aguadev/biorepository",
      "has_wiki": true,
      "watchers": 1,
      "name": "biorepository",
      "language": null,
      "private": false,
      "id": 5093426,
      "html_url": "https://github.com/aguadev/biorepository",
      "updated_at": "2012-07-18T08:15:13Z",
      "url": "https://api.github.com/repos/aguadev/biorepository"
    }

    
</entry>
<entry [Mon 2012:07:16 19:36:01 EST] USE GITHUB ORGANISATIONS FOR READ-ONLY ACCESS TO PRIVATE REPOS>


https://github.com/blog/674-introducing-organizations

Introducing Organizations
kneath June 29, 2010

Today we're introducing Organizations. Organizations simplify management of group-owned repositories (for example: your company's code), expand on our permissions system, and help focus your GitHub workflow for business and large open source projects.

If you've ever had to manage multiple GitHub accounts, desired a company-specific dashboard, wanted to add read-only collaborators, or needed to give someone else administrative control over one of your repositories, you're going to love Organizations.

And just like the rest of GitHub, Organizations are free for open source.
A home for your organization's code

Creating an organization helps you centralize your organization's code. All repositories live under the organization, and billing goes through a central organization account.

Any owner of an organization may edit that organization's settings, from profile details to billing information.
Next generation permissions control

Teams give people access to the organization's code, making it easy to add or remove people to many repositories at once.

Here are all the teams in the dolores organization:

Each team has one of three levels of permission:

    Pull Only - This new permission level is useful when you want to give people access to see the code, participate in private issues/wikis, or work in their private fork. These members may not push to the organization owned repository.

    Pull+Push - This is the default permission that collaborators have on GitHub right now. These members can participate in the project and push code, but they may not change the repository's meta data (name, private/public status, teams, service hooks).

    Pull+Push+Administrative - This new permission level allows you to grant participatory, push and administrative permissions. These members can do anything a repository owner can do.

Both users and repositories may be added to teams by owners, and you can make as many teams as you want.
    
    
    
</entry>
<entry [Mon 2012:07:16 08:11:16 EST] REBASE REMOVE ALL ACCIDENTAL TEST COMMITS>

#!/bin/sh

# detach head and move to D commit
git checkout $2

# move HEAD to A, but leave the index and working tree as for D
git reset --soft $1

# Redo the D commit re-using the commit message, but now on top of A
git commit -C $2

# Re-apply everything from the old D onwards onto this new place 
git rebase --onto HEAD $2 master



    * 250e9b8 (HEAD, master) -Fix: EXITLABEL in Upgrade.t & GIT_SSH for push
D    * 889a09c Commit 0.5.0
    * fe3b83d Commit 0.4.0
    ... 40 LINES OF COMMITS
    * acaf281 Commit 0.1.0
A   * 1c0769c Pushed by syoung, Wed Jul 11 18:35:31 EDT 2012
    
# detach head and move to D commit
git checkout 889a09c

# move HEAD to A, but leave the index and working tree as for D
git reset --soft 1c0769c

# Redo the D commit re-using the commit message, but now on top of A
git commit -C 889a09c

# Re-apply everything from the old D onwards onto this new place 
git rebase --onto HEAD 889a09c master
    
</entry>
<entry [Mon 2012:07:16 06:36:19 EST] USED git rebase TO UNDO ACCIDENTAL TEST COMMITS>



SUMMARY
-------
<!--
# detach head and move to D commit
#git checkout <SHA1-for-D>

# move HEAD to A, but leave the index and working tree as for D
#git reset --soft <SHA1-for-A>

# Redo the D commit re-using the commit message, but now on top of A
# git commit -C <SHA1-for-D>

# Re-apply everything from the old D onwards onto this new place 
# git rebase --onto HEAD <SHA1-for-D> master

-->
PROCEDURE
---------

1. CHECK LOG FOR SHA'S

gitlog

    * 0db1c9b (HEAD, origin/master, origin/HEAD, master) -Fix: EXITLABEL in Upgrade.t & GIT_SSH for push
D    * 1504ebf Commit 0.5.0 
    * 7073980 Commit 0.4.0
    * 40c44a9 Commit 0.3.0
    * 2921ad9 Commit 0.2.0
    * 8deb532 Commit 0.1.0
    * d41adbf Commit 0.5.0
A    * fe3b83d Commit 0.4.0
    * f94a61e Commit 0.3.0

    
2. DO THE FOUR-STEP REBASE
<!--
# detach head and move to D commit
# git checkout <SHA1-for-D>
git checkout 1504ebf
    HEAD is now at 1504ebf... Commit 0.5.0

# move HEAD to A, but leave the index and working tree as for D
#git reset --soft <SHA1-for-A>
git reset --soft fe3b83d
    OK

# Redo the D commit re-using the commit message, but now on top of A
# git commit -C <SHA1-for-D>
git commit -C 1504ebf

    [detached HEAD 889a09c] Commit 0.5.0
     Author: root <root@syoung-Satellite-L355.(none)>
     Committer: root <root@syoung-Satellite-C675D.(none)>
    ...
     8 files changed, 392 insertions(+), 419 deletions(-)
     create mode 100644 bin/Agua/Common/Package/Upgrade/outputs/source/0.5.0

# Re-apply everything from the old D onwards onto this new place 
# git rebase --onto HEAD <SHA1-for-D> master
git rebase --onto HEAD 1504ebf master

    First, rewinding head to replay your work on top of it...
    Applying: -Fix: EXITLABEL in Upgrade.t & GIT_SSH for push

-->

3. CHECK LOG

gitlog

    250e9b8 (HEAD, master) -Fix: EXITLABEL in Upgrade.t & GIT_SSH for push
D'    * 889a09c Commit 0.5.0
A    * fe3b83d Commit 0.4.0
    * f94a61e Commit 0.3.0
    * fab5fe3 Commit 0.2.0
    * 77f1159 Commit 0.1.0
    * 7d95fd3 Commit 0.5.0
    * 07305fc Commit 0.4.0



NOTES
-----

http://stackoverflow.com/questions/495345/git-removing-selected-commit-log-entries-for-a-repository


I would like to remove selected commit log entries from a linear commit tree, so that the entries do not show in the commit log.

My commit tree looks something like:

R--A--B--C--D--E--HEAD
I would like to remove the B and C entries; So that they do not show in the commit log, but changes from A to D should be preserved. Maybe by introducing a single commit, so that B and C become BC and the tree looks like.

R--A--BC--D--E--HEAD
Or, ideally, after A comes D directly. D' representing changes from A to B, B to C and C to D.

R--A--D'--E--HEAD
Is this possible? if yes, how?


<!--

# detach head and move to D commit
git checkout <SHA1-for-D>

# move HEAD to A, but leave the index and working tree as for D
git reset --soft <SHA1-for-A>

# Redo the D commit re-using the commit message, but now on top of A
git commit -C <SHA1-for-D>

# Re-apply everything from the old D onwards onto this new place 
git rebase --onto HEAD <SHA1-for-D> master
-->


NOTES
-----

http://web.archive.org/web/20100213104931/http://blog.madism.org/index.php/2007/09/09/138-git-awsome-ness-git-rebase-interactive

With the last git release, git-rebase gained a new option: --interactive.

If you already had the feeling that in a patch series of yours you should have ordered patches differently, or merged some, then this command is what you dreamed of. Here is how it works…

Let's pretend you want to rework your last 10 patches, you'll run:

   $ git rebase -i HEAD~10
It will launch your $EDITOR and you'll see something like:

   # Rebasing 16d3800..14f3d11 onto 16d3800 
   # 
   # Commands: 
   #  pick = use commit 
   #  edit = use commit, but stop for amending 
   #  squash = use commit, but meld into previous commit 
   # 
   # If you remove a line here THAT COMMIT WILL BE LOST. 
   # 
   pick 6270640 Simplify write_tree using strbuf's. 
   pick 27c528a Further strbuf re-engineering. 
   pick fd82c9a Eradicate yet-another-buffer implementation in buitin-rerere.c 
   pick eee488f More strbuf uses in cache-tree.c. 
   pick 16878b5 Add strbuf_rtrim and strbuf_insert. 
   pick e9081af Change semantics of interpolate to work like snprintf. 
   pick 99c3ef5 Rework pretty_print_commit to use strbufs instead of custom buffers. 
   pick 203db5d Use strbuf_read in builtin-fetch-tool.c. 
   pick a20d939 Use strbufs to in read_message (imap-send.c), custom buffer--. 
   pick 14f3d11 Replace all read_fd use with strbuf_read, and get rid of it.
   ~
   ~
   ~
   ~
   ~
   ~[1]
Then you can rewrite "pick" into "edit" if you want to change something in a commit, or "squash" if you want to merge it with the one from the line before.

What the small help doesn't say is that you can actually reorder your commits, and it will do what you expect it to do. I used it 10 minutes ago, because I have this string buffer module I extend on a regular basis, I squashed every API extension of that module in one commit using that.

Each time one change needs you to edit anything because either you asked for it, or that one of the change you asked for generated a conflict, then as usual the rebase will stop. You will be prompted to make the change, or fix the conflict, or merge comments (in case of a squash), and when all is in order, you just need to:

   $ git rebase --continue
This is just awsomely simple and intuitive



</entry>
<entry [Sat 2012:07:14 19:40:55 EST] GOOD DIAGRAMS OF GIT MODELS + checkout VERSUS reset>
    
http://sitaramc.github.com/gcs/index.html


the confusion about checkout versus reset

The basic difference is very simple:

checkout changes what your current branch is (i.e., it changes where HEAD is pointing to)
reset changes which commit the current branch is pointing to


Please note that this section completely ignores the myriad options available to both these commands, especially the ones that pertain to the index and the working tree. All we're trying to do is show what the commands do to the branch and HEAD, nothing else. As such, this is not a complete discussion of those two commands, but only about one aspect of them.

In fact, the major reason these two sometimes get confused is that people eventually learn that git checkout -f and git reset --hard do the same thing, and then extrapolate that to other options. Just remember that both those are specific cases of two quite different commands that just happen to "meet" there, in some sense.

    
</entry>
<entry [Sat 2012:07:14 19:38:11 EST] UNDO BAD git rebase>

USE git reflog
--------------

git reflog

    6b424fb HEAD@{0}: commit: -Fix: Onw stabilise upgrade report floating pane
    61a61fd HEAD@{1}: commit: -Fix: Package table missing 'privacy' field
    73cf241 HEAD@{2}: commit: -Fix: Reenabled mysql 'data load' in Installer::installMysql
    0cf1322 HEAD@{3}: commit: -Fix: Onw openLocation to directory not file


to reset the current branch to it (with the usual caveats about being absolutely sure before reseting with the --hard option).

# IF the old commit was HEAD@{5} in the ref log


git reset HEAD@{5}


NB: DON'T USE --hard IF YOU HAVE CHANGED FILES AFTER THE LAST COMMIT:

git reset --hard HEAD@{5}



NB: CAN USE 'ORIG_HEAD' IF HAVEN'T DONE ANY COMMANDS SINCE THE REBASE
(reset, rebase and merge all save your original HEAD pointer into ORIG_HEAD)

git reset --hard ORIG_HEAD



USE git rebase --abort
----------------------

git rebase --abort

    
</entry>
<entry [Thu 2012:07:12 06:51:43 EST] USE EMACS AS DEFAULT GIT EDITOR FOR 'git commit -a'>


git config core.editor "emacs -nw" --global

    
</entry>
<entry [Sun 2012:07:01 15:24:35 EST] GIT - UNDOING THINGS>

http://git-scm.com/book/en/Git-Basics-Undoing-Things

2.4 Git Basics - Undoing Things

Undoing Things
At any stage, you may want to undo something. Here, we’ll review a few basic tools for undoing changes that you’ve made. Be careful, because you can’t always revert some of these undos. This is one of the few areas in Git where you may lose some work if you do it wrong.

Changing Your Last Commit
One of the common undos takes place when you commit too early and possibly forget to add some files, or you mess up your commit message. If you want to try that commit again, you can run commit with the --amend option:

$ git commit --amend
This command takes your staging area and uses it for the commit. If you’ve made no changes since your last commit (for instance, you run this command immediately after your previous commit), then your snapshot will look exactly the same and all you’ll change is your commit message.

The same commit-message editor fires up, but it already contains the message of your previous commit. You can edit the message the same as always, but it overwrites your previous commit.

As an example, if you commit and then realize you forgot to stage the changes in a file you wanted to add to this commit, you can do something like this:

$ git commit -m 'initial commit'
$ git add forgotten_file
$ git commit --amend

After these three commands, you end up with a single commit — the second commit replaces the results of the first.

Unstaging a Staged File

The next two sections demonstrate how to wrangle your staging area and working directory changes. The nice part is that the command you use to determine the state of those two areas also reminds you how to undo changes to them. For example, let’s say you’ve changed two files and want to commit them as two separate changes, but you accidentally type git add * and stage them both. How can you unstage one of the two? The git status command reminds you:

$ git add .
$ git status
# On branch master
# Changes to be committed:
#   (use "git reset HEAD < file>..." to unstage)
#
#       modified:   README.txt
#       modified:   benchmarks.rb
#

Right below the “Changes to be committed” text, it says "use git reset HEAD < file>... to unstage". So, let’s use that advice to unstage the benchmarks.rb file:

$ git reset HEAD benchmarks.rb
benchmarks.rb: locally modified

$ git status
# On branch master
# Changes to be committed:
#   (use "git reset HEAD < file>..." to unstage)
#
#       modified:   README.txt
#
# Changed but not updated:
#   (use "git add < file>..." to update what will be committed)
#   (use "git checkout -- < file>..." to discard changes in working directory)
#
#       modified:   benchmarks.rb
#

The command is a bit strange, but it works. The benchmarks.rb file is modified but once again unstaged.

Unmodifying a Modified File

What if you realize that you don’t want to keep your changes to the benchmarks.rb file? How can you easily unmodify it — revert it back to what it looked like when you last committed (or initially cloned, or however you got it into your working directory)? Luckily, git status tells you how to do that, too. In the last example output, the unstaged area looks like this:

# Changed but not updated:
#   (use "git add < file>..." to update what will be committed)
#   (use "git checkout -- < file>..." to discard changes in working directory)
#
#       modified:   benchmarks.rb
#

It tells you pretty explicitly how to discard the changes you’ve made (at least, the newer versions of Git, 1.6.1 and later, do this — if you have an older version, we highly recommend upgrading it to get some of these nicer usability features). Let’s do what it says:

$ git checkout -- benchmarks.rb
$ git status
# On branch master
# Changes to be committed:
#   (use "git reset HEAD < file>..." to unstage)
#
#       modified:   README.txt
#

You can see that the changes have been reverted. You should also realize that this is a dangerous command: any changes you made to that file are gone — you just copied another file over it. Don’t ever use this command unless you absolutely know that you don’t want the file. If you just need to get it out of the way, we’ll go over stashing and branching in the next chapter; these are generally better ways to go.

Remember, anything that is committed in Git can almost always be recovered. Even commits that were on branches that were deleted or commits that were overwritten with an --amend commit can be recovered (see Chapter 9 for data recovery). However, anything you lose that was never committed is likely never to be seen again.
    
</entry>
<entry [Sun 2012:07:01 14:30:55 EST] SHOW STASH IN PATCH FORM>

VIEW THE SECOND MOST RECENT STASH IN PATCH FORM

git stash show -p stash@{1}



</entry>
<entry [Sun 2012:07:01 14:08:37 EST] FIXED ERROR: 'Permission to syoung/biorepository.git denied to agua.'>

PROBLEM

cd /repos/public/syoung/biorepository
git push
    ERROR: Permission to syoung/biorepository.git denied to agua.
    fatal: The remote end hung up unexpectedly

    
SOLUTION

REMOVE ALL SSH KEYS ADDED IN .bash_profile WITH ssh-add


ssh-add -D


OPEN NEW TERMINAL WINDOW

cd /agua/t
git push

    OK

    
    
</entry>
<entry [Fri 2012:06:29 18:54:48 EST] VISUAL GIT GUIDE>

http://marklodato.github.com/visual-git-guide/index-en.html


</entry>
<entry [Fri 2012:06:29 18:25:40 EST] TESTED OVERWRITE LOCAL REPO WITH bioapps>

1. VERIFY HISTORY OF LOCAL REPOS

cd /repos/public/syoung/bioapps
gitlog
    * 2ce6d76 (HEAD, master) [0.7.3] Third patch increment
    * 61cf33c (tag: 0.7.3) Added .gitignore file.
    * ffb73a4 (github/master) [0.7.2] Second patch increment
    * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    * c578455 (tag: 0.7.1) [0.7.0] First commit
    * 4c22ea9 (tag: 0.7.0) First commit.

cd /repos/public/agua/bioapps
gitlog
    * b99300a (HEAD, linode/master, github/master, master) Test commit.
    *   dac6066 Merge branch 'master' of github.com:agua/bioapps
    |\  
    | * ffb73a4 [0.7.2] Second patch increment
    | * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    | * c578455 (tag: 0.7.1) [0.7.0] First commit
    | * 4c22ea9 (tag: 0.7.0) First commit.
    * 1cd3561 First commit.


2. VERIFY CLONES OF LOCAL REPOS

cd /repos/private/syoung
git clone git@github.com:syoung/bioapps bioapps-syoung
cd /repos/private/syoung/bioapps-syoung
gitlog
    * 1b00db9 (HEAD, origin/master, origin/HEAD, master) Moved filtersnp.dbl to /data/bioapps/dbfile.
    * 2c173c7 (tag: 0.7.0) [0.7.0] First installed version of bioapps
    * c9abd00 First commit of bioapps

    *** ??? DOES NOT CORRESPOND TO LOCAL REPO ***
    
cd /repos/private/agua
git clone git@github.com:agua/bioapps bioapps-agua
cd /repos/private/agua/bioapps-agua
gitlog
    * b99300a (HEAD, origin/master, origin/HEAD, master) Test commit.
    *   dac6066 Merge branch 'master' of github.com:agua/bioapps
    |\  
    | * ffb73a4 [0.7.2] Second patch increment
    | * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    | * c578455 (tag: 0.7.1) [0.7.0] First commit
    | * 4c22ea9 (tag: 0.7.0) First commit.
    * 1cd3561 First commit.

    
3. VERIFY FILES DIFFERENT

diff -r /repos/private/syoung/bioapps-syoung /repos/private/agua/bioapps-agua/
    ...
    Only in /repos/private/agua/bioapps-agua/: test
    diff -r /repos/private/syoung/bioapps-syoung/VERSION /repos/private/agua/bioapps-agua/VERSION
    1c1
    < 0.7.0
    \ No newline at end of file
    ---
    > 0.7.2


4. COPY FIRST CLONES AND OVERWRITE WITH SECOND REMOTE

cp -r /repos/private/syoung/bioapps-syoung /repos/private/syoung/bioapps-test
cd /repos/private/syoung/bioapps-test
git remote rm origin
git remote add origin git@github.com:agua/bioapps
git fetch origin master 
git reset --hard FETCH_HEAD 

NOTE:

BEFORE git reset FILESYSTEM AND GIT LOG HAVE NOT CHANGED:

cd /mnt/repos/private/syoung/bioapps-test
ll
    drwxrwxr-x 12 syoung syoung 4.0K Jun 29 18:28 bin
    drwxrwxr-x  2 syoung syoung 4.0K Jun 29 18:36 docs
    drwxrwxr-x  8 syoung syoung 4.0K Jun 29 18:36 .git
    drwxrwxr-x  8 syoung syoung 4.0K Jun 29 18:36 lib
    drwxrwxr-x  4 syoung syoung 4.0K Jun 29 18:36 t
    -rw-r--r--  1 root   root      0 Jun 29 18:36 test
    -rw-r--r--  1 root   root      6 Jun 29 18:36 VERSION

gitlog
    * 1b00db9 (HEAD, master) Moved filtersnp.dbl to /data/bioapps/dbfile.
    * 2c173c7 (tag: 0.7.0) [0.7.0] First installed version of bioapps
    * c9abd00 First commit of bioapps

    
AFTER git reset FILESYSTEM AND LOG ARE NOW SET TO REMOTE:
    
git reset --hard FETCH_HEAD 
    HEAD is now at b99300a Test commit.

cd /mnt/repos/private/syoung/bioapps-test    
ll
    drwxrwxr-x 12 syoung syoung 4.0K Jun 29 18:28 bin
    drwxrwxr-x  2 syoung syoung 4.0K Jun 29 18:36 docs
    drwxrwxr-x  8 syoung syoung 4.0K Jun 29 18:36 .git
    drwxrwxr-x  8 syoung syoung 4.0K Jun 29 18:36 lib
    drwxrwxr-x  4 syoung syoung 4.0K Jun 29 18:36 t
    -rw-r--r--  1 root   root      0 Jun 29 18:36 test
    -rw-r--r--  1 root   root      6 Jun 29 18:36 VERSION

gitlog

    * b99300a (HEAD, master) Test commit.
    *   dac6066 Merge branch 'master' of github.com:agua/bioapps
    |\  
    | * ffb73a4 [0.7.2] Second patch increment
    | * c8b7ab7 [0.7.1] First patch increment
    | * c578455 [0.7.0] First commit
    | * 4c22ea9 First commit.
    * 1cd3561 First commit.


5. OVERWRITE WITH FIRST REMOTE

cd /repos/private/syoung/bioapps-test
git remote rm origin
git remote add origin git@github.com:syoung/bioapps
git fetch origin master
 
    From github.com:syoung/bioapps
     * branch            master     -> FETCH_HEAD

ll
    drwxrwxr-x 12 syoung syoung 4096 Jun 29 18:28 bin/
    drwxrwxr-x  2 syoung syoung 4096 Jun 29 18:36 docs/
    drwxrwxr-x  8 syoung syoung 4096 Jun 29 18:42 .git/
    drwxrwxr-x  8 syoung syoung 4096 Jun 29 18:36 lib/
    drwxrwxr-x  4 syoung syoung 4096 Jun 29 18:36 t/
    -rw-r--r--  1 root   root      0 Jun 29 18:36 test
    -rw-r--r--  1 root   root      6 Jun 29 18:36 VERSION

gitlog
    * b99300a (HEAD, master) Test commit.
    *   dac6066 Merge branch 'master' of github.com:agua/bioapps
    |\  
    | * ffb73a4 [0.7.2] Second patch increment
    | * c8b7ab7 [0.7.1] First patch increment
    | * c578455 [0.7.0] First commit
    | * 4c22ea9 First commit.
    * 1cd3561 First commit.

git reset --hard FETCH_HEAD 
    
    HEAD is now at 1b00db9 Moved filtersnp.dbl to /data/bioapps/dbfile.

gitlog
    * 1b00db9 (HEAD, master) Moved filtersnp.dbl to /data/bioapps/dbfile.
    * 2c173c7 (tag: 0.7.0) [0.7.0] First installed version of bioapps
    * c9abd00 First commit of bioapps


    
6. UPDATE FIRST REMOTE FROM FIRST LOCAL REPO


WON'T DO IT WITHOUT FORCE

cd /repos/public/syoung/bioapps

git push -u github master
    To git@github.com:agua/bioapps
     ! [rejected]        master -> master (non-fast-forward)
    error: failed to push some refs to 'git@github.com:agua/bioapps'
    To prevent you from losing history, non-fast-forward updates were rejected
    Merge the remote changes (e.g. 'git pull') before pushing again.  See the
    'Note about fast-forwards' section of 'git push --help' for details.

    
USING --force

cd /repos/public/syoung/bioapps
git push -u github master --force
    Counting objects: 11, done.
    Compressing objects: 100% (6/6), done.
    Writing objects: 100% (9/9), 850 bytes, done.
    Total 9 (delta 2), reused 0 (delta 0)
    To git@github.com:agua/bioapps
     + b99300a...2ce6d76 master -> master (forced update)
    Branch master set up to track remote branch master from github.

    
CHECK LOG OF PUSHED REMOTE REPO:

cd /repos/public/syoung
git clone git@github.com:syoung/bioapps bioapps-check

cd /repos/public/syoung/bioapps-check
gitlog
    * 2ce6d76 (HEAD, origin/master, origin/HEAD, master) [0.7.3] Third patch increment
    * 61cf33c Added .gitignore file.
    * ffb73a4 [0.7.2] Second patch increment
    * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    * c578455 (tag: 0.7.1) [0.7.0] First commit
    * 4c22ea9 (tag: 0.7.0) First commit.

WHICH MIRRORS THE LOCAL REPO:

cd /repos/public/agua/bioapps
gitlog
   * b99300a (HEAD, linode/master, github/master, master) Test commit.
    *   dac6066 Merge branch 'master' of github.com:agua/bioapps
    |\  
    | * ffb73a4 [0.7.2] Second patch increment
    | * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    | * c578455 (tag: 0.7.1) [0.7.0] First commit
    | * 4c22ea9 (tag: 0.7.0) First commit.
    * 1cd3561 First commit. 
    
    
    
NOTE: TWO LOCAL REPOS WERE PUSHING TO THE SAME REMOTE! FIXED BY CHANGING syoung/bioapps TO PUSH TO REMOTE syoung/bioapps (INSTEAD OF TO REMOTE agua/bioapps)



cd /repos/public/syoung/bioapps
gitlog
    * 2ce6d76 (HEAD, github/master, master) [0.7.3] Third patch increment
    * 61cf33c (tag: 0.7.3) Added .gitignore file.
    * ffb73a4 [0.7.2] Second patch increment
    * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    * c578455 (tag: 0.7.1) [0.7.0] First commit
    * 4c22ea9 (tag: 0.7.0) First commit.

git remote -v
    github	git@github.com:agua/bioapps (fetch)
    github	git@github.com:agua/bioapps (push)


CHANGED TO:

/repos/public/syoung/bioapps$ git remote -v
    github	git@github.com:syoung/bioapps (fetch)
    github	git@github.com:syoung/bioapps (push)


NOW UPDATE FIRST REMOTE WITH FIRST LOCAL REPO:

cd /repos/private/syoung/bioapps
git push -u github master --force


VERIFIED UPDATED REMOTE syoung/bioapps:

cd /repos/private/syoung
git clone git@github.com:syoung/bioapps bioapps-syoung2
cd bioapps-syoung2
gitlog
cd /repos/private/syoung/bioapps-syoung2
gitlog
    * 2ce6d76 (HEAD, origin/master, origin/HEAD, master) [0.7.3] Third patch increme
    * 61cf33c (tag: 0.7.3) Added .gitignore file.
    * ffb73a4 [0.7.2] Second patch increment
    * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    * c578455 (tag: 0.7.1) [0.7.0] First commit
    * 4c22ea9 First commit.



7. AGAIN OVERWRITE WITH FIRST REMOTE

cd /repos/private/syoung/bioapps-test
gitlog
    * 1b00db9 (HEAD, master) Moved filtersnp.dbl to /data/bioapps/dbfile.
    * 2c173c7 (tag: 0.7.0) [0.7.0] First installed version of bioapps
    * c9abd00 First commit of bioapps

git remote rm origin
git remote add origin git@github.com:syoung/bioapps
git fetch origin master    
    remote: Counting objects: 239, done.
    remote: Compressing objects: 100% (178/178), done.
    remote: Total 239 (delta 56), reused 239 (delta 56)
    Receiving objects: 100% (239/239), 535.86 KiB | 644 KiB/s, done.
    Resolving deltas: 100% (56/56), done.
    From github.com:syoung/bioapps
     * branch            master     -> FETCH_HEAD

BUT CLONE NOT UPDATED: 
    
gitlog
    * 1b00db9 (HEAD, master) Moved filtersnp.dbl to /data/bioapps/dbfile.
    * 2c173c7 (tag: 0.7.0) [0.7.0] First installed version of bioapps
    * c9abd00 First commit of bioapps


USING FORCE DIDN'T WORK:

git fetch origin master --force
    From github.com:syoung/bioapps
     * branch            master     -> FETCH_HEAD

NOR DID USING --tags: 

git fetch origin master --tags
    remote: Counting objects: 242, done.
    remote: Compressing objects: 100% (181/181), done.
    remote: Total 242 (delta 56), reused 242 (delta 56)
    Receiving objects: 100% (242/242), 536.27 KiB | 678 KiB/s, done.
    Resolving deltas: 100% (56/56), done.
    From github.com:syoung/bioapps
     * branch            master     -> FETCH_HEAD
     * [new tag]         0.7.1      -> 0.7.1
     * [new tag]         0.7.2      -> 0.7.2
     * [new tag]         0.7.3      -> 0.7.3


gitlog
    * 1b00db9 (HEAD, master) Moved filtersnp.dbl to /data/bioapps/dbfile.
    * 2c173c7 (tag: 0.7.0) [0.7.0] First installed version of bioapps
    * c9abd00 First commit of bioapps


CONFIRMED THAT OLD (0.7.0) VERSION FILE PRESENT:

cat VERSION 
    0.7.0
    
BUT FIXED AFTER USED reset:

git reset --hard FETCH_HEAD 
    HEAD is now at 2ce6d76 [0.7.3] Third patch increment

cat VERSION 
    0.7.3

gitlog
    * 2ce6d76 (HEAD, master) [0.7.3] Third patch increment
    * 61cf33c (tag: 0.7.3) Added .gitignore file.
    * ffb73a4 [0.7.2] Second patch increment
    * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    * c578455 (tag: 0.7.1) [0.7.0] First commit
    * 4c22ea9 First commit.


NOTE: test FILE FROM SECOND REMOTE IS REMOVED 



7. AGAIN OVERWRITE WITH SECOND REMOTE

cd /repos/private/syoung/bioapps-test
git remote rm origin
git remote add origin git@github.com:agua/bioapps
git fetch origin master
    From github.com:agua/bioapps
     * branch            master     -> FETCH_HEAD

gitlog
    * 2ce6d76 (HEAD, master) [0.7.3] Third patch increment
    * 61cf33c (tag: 0.7.3) Added .gitignore file.
    * ffb73a4 [0.7.2] Second patch increment
    * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    * c578455 (tag: 0.7.1) [0.7.0] First commit
    * 4c22ea9 First commit.

cat VERSION
    0.7.3

git reset --hard FETCH_HEAD 
    HEAD is now at b99300a Test commit.

gitlog
    * b99300a (HEAD, master) Test commit.
    *   dac6066 Merge branch 'master' of github.com:agua/bioapps
    |\  
    | * ffb73a4 [0.7.2] Second patch increment
    | * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    | * c578455 (tag: 0.7.1) [0.7.0] First commit
    | * 4c22ea9 First commit.
    * 1cd3561 First commit.


... WHICH HAS THE CORRECT VERSION:

cat VERSION 
    0.7.2
    
    
8. DO IT AGAIN WITH STASHED CHANGES

cd /repos/private/syoung/bioapps-test
echo 'EXTRA' > EXTRA

BUT GIT STASH NOT WORKING:

git stash
    No local changes to save


SO DID A NORMAL COMMIT:

git add .
git commit -a
    [master 6ed9223] extra
     1 file changed, 1 insertion(+)
     create mode 100644 EXTRA

AND THEN REDID FETCH:

git fetch origin master


COMMIT REMAINED IN THE LOG AND THE FILES WERE STILL PRESENT:

gitlog
    * b99300a (HEAD, master) Test commit.
    *   dac6066 Merge branch 'master' of github.com:agua/bioapps
    |\  
    | * ffb73a4 [0.7.2] Second patch increment
    | * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    | * c578455 (tag: 0.7.1) [0.7.0] First commit
    | * 4c22ea9 First commit.
    * 1cd3561 First commit.

ll
    drwxrwxr-x 12 syoung syoung 4096 Jun 29 18:28 bin/
    drwxrwxr-x  2 syoung syoung 4096 Jun 29 18:36 docs/
    drwxrwxr-x  8 syoung syoung 4096 Jun 30 04:30 .git/
    drwxrwxr-x  8 syoung syoung 4096 Jun 29 18:36 lib/
    -rw-rw-r--  1 syoung syoung    5 Jun 30 04:11 STASH
    drwxrwxr-x  4 syoung syoung 4096 Jun 30 04:30 t/
    -rw-rw-r--  1 syoung syoung    0 Jun 30 04:30 test
    -rw-rw-r--  1 syoung syoung    6 Jun 30 04:30 VERSION


9. THIRD FETCH FROM FIRST REMOTE (AFTER CREATING 'STASH' FILE)

'STASH' FILE REMAINS BUT 'STASH' COMMIT NOT PRESENT:


cd /repos/private/syoung/bioapps-test
git remote rm origin
git remote add origin git@github.com:syoung/bioapps
git fetch origin master
git reset --hard FETCH_HEAD 
    HEAD is now at 2ce6d76 [0.7.3] Third patch increment


gitlog
    * 2ce6d76 (HEAD, master) [0.7.3] Third patch increment
    * 61cf33c (tag: 0.7.3) Added .gitignore file.
    * ffb73a4 [0.7.2] Second patch increment
    * c8b7ab7 (tag: 0.7.2) [0.7.1] First patch increment
    * c578455 (tag: 0.7.1) [0.7.0] First commit
    * 4c22ea9 First commit.


ll
    drwxrwxr-x 12 syoung syoung 4096 Jun 29 18:28 bin/
    drwxrwxr-x  2 syoung syoung 4096 Jun 29 18:36 docs/
    drwxrwxr-x  8 syoung syoung 4096 Jun 30 04:33 .git/
    -rw-rw-r--  1 syoung syoung   22 Jun 30 04:33 .gitignore
    drwxrwxr-x  8 syoung syoung 4096 Jun 29 18:36 lib/
    -rw-rw-r--  1 syoung syoung    5 Jun 30 04:11 STASH
    -rw-rw-r--  1 syoung syoung    5 Jun 30 04:33 VERSION


git status SHOWS 'STASH' FILE IS PRESENT AND UNTRACKED:

git status
    # On branch master
    # Untracked files:
    #   (use "git add < file>..." to include in what will be committed)
    #
    #	STASH
    nothing added to commit but untracked files present (use "git add" to track)

    
    
    
</entry>
<entry [Fri 2012:06:29 17:59:19 EST] OVERWRITE THE LOCAL REPO WITH A DIFFERENT REMOTE REPO>

SET ALL FILES IN LOCAL TO BE IDENTICAL TO REMOTE:

git fetch origin master
git reset --hard FETCH_HEAD 
git clean -df  # REMOVE ALL UNTRACKED FILES


REMOVE ALL UNCOMMITTED OR UNTRACKED LOCAL FILES:

http://stackoverflow.com/questions/1125968/force-git-to-overwrite-local-files-on-pull

  git fetch --all
  git reset --hard origin/master
git fetch downloads the latest from remote without trying to merge or rebase anything. Then the git reset resets the master branch to what you just fetched.

1	  
This is the correct answer, that will properly make the local repository exactly match the remote tracking branch. – Ether Feb 17 at 17:25
Armand: I think that's the point here. Anyway, this worked great for me. Thanks! – Lee Francis Mar 20 at 9:33
Watch out! If you have local unpushed commits this will remove them from your branch! This solution keeps untracked files not in the repository intact, but overwrites everything else. – Matthijs P May 17 at 8:18
I can confirm that this is likely what you want when you've totally hosed your local repository and don't care about any local commits and you just want whatever was in your remote because you know it's good. – seaneshbaugh Jun 14 at 5:58

NOTES
-----

http://stackoverflow.com/questions/9589814/git-force-a-pull-to-overwrite-everything-on-every-pull?rq=1

I have a CENTRAL bare repo that has 3 developer repositories pulling and pushing to it normally.

I also have 2 other repositories that pull from the CENTRAL bare repo: one is the live server and the other is a test/stage server, each pulling their own respective branch.

The scenario is this: i have a post-update hook script on the CENTRAL repo that automatically accesses the test and live repos and runs a pull command on each. this updates both test and live servers, all depending on what branch has new commits. This all works great.

The problem is this: there may be times in an emergency that files may be directly updated on the server (via ftp or whatever) and the CENTRAL post-update script will then fail since merge/overwrite conflicts will occur. There is no way to avoid this scenario and it is eventual.

What i would like to have happen is this: I want the pull from the live and test sites to ALWAYS overwrite/merge on pull. ALWAYS. These repos will be pull-only as they are not for development.

In all my research, i cannot find a good solution to have a pull ALWAYS force an overwrite of the local files. Is this at all possible? It would make for a great development scenario if so.

Thanks in advance!


Really the ideal way to do this is to not use pull at all, but instead fetch and reset:

git fetch origin master
git reset --hard FETCH_HEAD
git clean -df
(Altering master to whatever branch you want to be following.)

pull is designed around merging changes together in some way, whereas reset is designed around simply making your local copy match a specific commit.

You may want to consider slightly different options to clean depending on your system's needs.
    
</entry>
<entry [Fri 2012:06:29 15:19:16 EST] EDIT COMMIT MESSAGE>

EDIT LAST COMMIT MESSAGE
------------------------

git commit --amend -m "your new message"


EDIT PREVIOUS COMMIT MESSAGES
-----------------------------

http://darrinholst.com/post/359817782.html

$ git rebase --interactive e24b57d
Which will open up your editor with…

pick b6a0a9f we want to change this message
pick 6119426 third commit

# Rebase e24b57d..6119426 onto e24b57d
#
# Commands:
#  p, pick = use commit
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#
# If you remove a line here THAT COMMIT WILL BE LOST.
# However, if you remove everything, the rebase will be aborted.
#
Change “pick” to “edit” for those that you want to edit and save that file

edit b6a0a9f we want to change this message
pick 6119426 third commit

# Rebase e24b57d..6119426 onto e24b57d
#
# Commands:
#  p, pick = use commit
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#
# If you remove a line here THAT COMMIT WILL BE LOST.
# However, if you remove everything, the rebase will be aborted.
#
Now amend that commit

$ git commit --amend -m "some other message"
Then continue the rebase

$ git rebase --continue
$ git lg





http://stackoverflow.com/questions/179123/how-do-i-edit-an-incorrect-commit-message-in-git

If the commit you want to fix isn’t the most recent one:

git rebase --interactive $parent_of_flawed_commit

If you want to fix several flawed commits, pass the parent of the oldest one of them.

An editor will come up, with a list of all commits since the one you gave.

Change pick to reword (or on old versions of Git, to edit) in front of any commits you want to fix.
Once you save, git will replay the listed commits. 

Git will drop back you into your editor for every commit you said you want to reword, and into the shell for every commit you wanted to edit.

If you’re in the shell:

Change the commit in any way you like.
git commit --amend
git rebase --continue
Most of this sequence will be explained to you by the output of the various commands as you go. It’s very easy, you don’t need to memorise it – just remember that git rebase --interactive lets you correct commits no matter how long ago they were.

Note that you will not want to change commits that you have already pushed. Or maybe you do, but in that case you will have to take great care to communicate with everyone who may have pulled your commits and done work on top of them.

NOTES
-----

http://stackoverflow.com/questions/4084868/how-do-i-recover-resynchronise-after-someone-pushes-a-rebase-or-a-reset-to-a-pub

How do I recover/resynchronise after someone pushes a rebase or a reset to a published branch?
    
Getting back in synch after a pushed rebase is really not that complicated in most cases.

git checkout foo
git branch old-foo origin/foo # BEFORE fetching!!
git fetch
git rebase --onto origin/foo old-foo foo
git branch -D old-foo
Ie. first you set up a bookmark for where the remote branch originally was, then you use that to replay your local commits from that point onward onto rebased remote branch.

Rebasing is like violence: if it doesn’t solve your problem, you just need more of it. ☺

You can do this without the bookmark of course, if you look up the pre-rebase origin/foo commit ID, and use that.

This is also how you deal with the situation where you forgot to make a bookmark before fetching. Nothing is lost – you just need to check the reflog for the remote branch:

git reflog show origin/foo | awk '
    PRINT_NEXT==1 { print $1; exit }
    /fetch: forced-update/ { PRINT_NEXT=1 }'
This will print the commit ID that origin/foo pointed to before the most recent fetch that changed its history.

You can then simply

git rebase --onto origin/foo $commit foo


Quick note: I think it's pretty intuitive, but if you don't know awk well... that one-liner is just looking through the output of git reflog show origin/foo for the first line saying "fetch: forced-update"; that's what git records when a fetch causes the remote branch to do anything but fast-forward. (You could just do it by hand, too - the forced update is probably the most recent thing.) – Jefromi Nov 3 '10 at 22:35
4	  
+1 for `Rebasing is like violence: if it doesn’t solve your problem, you just need more of it. ☺` – sehe Nov 30 '11 at 8:57


</entry>
<entry [Thu 2012:06:28 01:04:03 EST] GET TAG MESSAGES USING tags API>

GET /repos/:user/:repo/git/tags/:sha

curl https://api.github.com/repos/agua/biorepository/git/tags/d5b271a4b641dc18144d9a0ae2f35c9db047b514


... DOESN'T WORK...



NOTES
-----

http://developer.github.com/v3/git/tags/

Get a Tag

GET /repos/:user/:repo/git/tags/:sha

Response

Status: 200 OK
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4999
{
  "tag": "v0.0.1",
  "sha": "940bd336248efae0f9ee5bc7b2d5c985887b16ac",
  "url": "https://api.github.com/repos/octocat/Hello-World/git/tags/940bd336248efae0f9ee5bc7b2d5c985887b16ac",
  "message": "initial version\n",
  "tagger": {
    "name": "Scott Chacon",
    "email": "schacon@gmail.com",
    "date": "2011-06-17T14:53:35-07:00"
  },
  "object": {
    "type": "commit",
    "sha": "c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c",
    "url": "https://api.github.com/repos/octocat/Hello-World/git/commits/c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c"
  }
}
Create a Tag Object

Note that creating a tag object does not create the reference that makes a tag in Git. If you want to create an annotated tag in Git, you have to do this call to create the tag object, and then create the refs/tags/[tag] reference. If you want to create a lightweight tag, you simply have to create the reference - this call would be unnecessary.

POST /repos/:user/:repo/git/tags
Parameters

tag
String of the tag
message
String of the tag message
object
String of the SHA of the git object this is tagging
type
String of the type of the object we’re tagging. Normally this is a commit but it can also be a tree or a blob.
tagger.name
String of the name of the author of the tag
tagger.email
String of the email of the author of the tag
tagger.date
Timestamp of when this object was tagged
Response

Status: 201 Created
Location: https://api.github.com/repos/:user/:repo/git/tags/:sha
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4999
{
  "tag": "v0.0.1",
  "sha": "940bd336248efae0f9ee5bc7b2d5c985887b16ac",
  "url": "https://api.github.com/repos/octocat/Hello-World/git/tags/940bd336248efae0f9ee5bc7b2d5c985887b16ac",
  "message": "initial version\n",
  "tagger": {
    "name": "Scott Chacon",
    "email": "schacon@gmail.com",
    "date": "2011-06-17T14:53:35-07:00"
  },
  "object": {
    "type": "commit",
    "sha": "c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c",
    "url": "https://api.github.com/repos/octocat/Hello-World/git/commits/c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c"
  }
}
    
</entry>
<entry [Sun 2012:06:24 14:30:28 EST] SEARCH FOR OTHER USER INFO BY KEYWORD>

This API is deprecated. Check out API v3 for the latest documentation.
Users API

API for accessing and modifying user information.

Searching for Users

The route for user searching is:

/user/search/:search

For instance, you would search for users with 'chacon' in their name like this:


</entry>
<entry [Sun 2012:06:24 14:30:16 EST] GET OWN USER INFO WITH OAUTH KEY>

Getting User Information

You can then get extended information on users by their username. The url format is:

/user/show/:username [GET]
so the following command

    
    
</entry>
<entry [Sun 2012:06:24 14:06:20 EST] SEARCH REPOS FOR KEYWORD>

http://developer.github.com/v3/search/#search-repositories

Find repositories by keyword.

GET /legacy/repos/search/:keyword


</entry>
<entry [Sun 2012:06:24 12:36:57 EST] GITHUB HELP PAGES - ADD SSH KEY>

HELP
http://brilliantfantastic.com/blog/posts/28744089
https://help.github.com/


ADD SSH KEY
https://help.github.com/articles/generating-ssh-keys
https://github.com/heinek/ITimeU/wiki/Getting-started


ADD PASSPHRASE WITH SSH-AGENT
http://ufz.github.com/help/ssh-key-passphrases/

    
</entry>
<entry [Sat 2012:06:23 22:03:48 EST] REST ERROR CODES - '422 Unprocessable Entity'>

http://restpatterns.org/HTTP_Status_Codes/422_-_Unprocessable_Entity

422 - Unprocessable Entity

Modified 23:29, 6 Oct 2008 by SteveB | Page History

The 422 (Unprocessable Entity) status code means the server understands the content type of the request entity (hence a 415(Unsupported Media Type) status code is inappropriate), and the syntax of the request entity is correct (thus a 400 (Bad Request) status code is inappropriate) but was unable to process the contained instructions. For example, this error condition may occur if an XML request body contains well-formed (i.e., syntactically correct), but semantically erroneous, XML instructions.
    
</entry>
<entry [Sat 2012:06:23 08:05:02 EST] aguadev OAUTH TOKEN>

Client ID
1791d4aa9b701a234b4e

Secret
fd6eec582b8909688d5a94360bacf94cc650899b

OAUTH ACCESS TOKEN
e8710ff995ac78c1340315f12e4e9e478e366b76


CREATE OAUTH TOKEN USING PASSWORD

curl -u aguadev https://api.github.com/authorizations -d '{"note":"aguatest","scopes":["repo","public_repo", "delete_repo"]}' 
Enter host password for user 'aguadev':
{
  "updated_at": "2012-07-28T04:23:31Z",
  "note_url": null,
  "note": "aguatest",
  "scopes": [
    "repo",
    "public_repo",
    "delete_repo"
  ],
  "url": "https://api.github.com/authorizations/537585",
  "created_at": "2012-07-28T04:23:31Z",
  "token": "e8710ff995ac78c1340315f12e4e9e478e366b76",
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "aguatest (API)"
  },
  "id": 537585
}


###
###curl -i -u "aguadev"   https://api.github.com/authorizations   -d '{"scopes":["repo"]}'
###
###    {
###      "app": {
###        "name": "GitHub API",
###        "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api"
###      },
###      "note": null,
###      "token": "196327016219a918ab68ee368a1f56024a1494f0",
###      "scopes": [
###        "repo"
###      ],
###      "created_at": "2012-07-18T07:56:24Z",
###      "id": 514208,
###      "updated_at": "2012-07-18T07:56:24Z",
###      "note_url": null,
###      "url": "https://api.github.com/authorizations/514208"
###    }
###
ADDED DELETE-REPO PERMISSION:


curl -i -u "aguadev" https://api.github.com/authorizations/514208 -X PATCH --data "{\"add_scopes\":[\"delete_repo\"]}"

    {
      "note": null,
      "app": {
        "name": "GitHub API",
        "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api"
      },
      "token": "196327016219a918ab68ee368a1f56024a1494f0",
      "scopes": [
        "repo",
        "delete_repo"
      ],
      "created_at": "2012-07-18T07:56:24Z",
      "updated_at": "2012-07-19T08:08:52Z",
      "note_url": null,
      "id": 514208,
      "url": "https://api.github.com/authorizations/514208"
    }

CONFIRM OAUTH TOKEN WORKS:

curl -H "Authorization: token 196327016219a918ab68ee368a1f56024a1494f0" https://api.github.com/user

    {
        "following": 0,
        "type": "User",
        "login": "aguadev",
        "created_at": "2012-01-26T20:00:39Z",
        "followers": 0,
        "gravatar_id": "be892368e18041fb06dc97e53b75d527",
        "html_url": "https://github.com/aguadev",
        "avatar_url": "https://secure.gravatar.com/avatar/be892368e18041fb06dc97e53b75d527?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
        "public_gists": 0,
        "id": 1383046,
        "public_repos": 0,
        "url": "https://api.github.com/users/aguadev"
    }
    
</entry>
<entry [Sat 2012:06:23 07:41:27 EST] GITHUB ACCOUNTS SUMMARY>

agua    s*****
aguadev r****a
syoung  r*****
stuartpyoung s*****

    
</entry>
<entry [Sat 2012:06:23 00:41:08 EST] CREATE A FORK WITH OAUTH TOKEN>

http://developer.github.com/v3/repos/forks/

Create a fork for the authenticated user.

POST /repos/:user/:repo/forks


FORK agua's TEST REPO:

curl -X POST -H 'Authorization: token ded526622a10cfaaea0134662696b748ff666696' https://api.github.com/repos/agua/test/forks
    OK

    
</entry>
<entry [Sat 2012:06:23 00:41:07 EST] DELETE REPO USING OAUTH ACCESS TOKEN>

curl -X DELETE -H 'Authorization: token 21a393b182705f3d5faea967496b465cbacbff8b' https://api.github.com/repos/syoung/test-private

</entry>
<entry [Sat 2012:06:23 00:40:40 EST] EDIT REPO WITH OAUTH ACCESS TOKEN>

curl -X PATCH -H 'Authorization: token 21a393b182705f3d5faea967496b465cbacbff8b' https://api.github.com/repos/syoung/test-private -d '{"name":"test-public", "private":false,"description": "My public repository"}'


</entry>
<entry [Sat 2012:06:23 00:40:07 EST] CREATE REPO USING OAUTH ACCESS TOKEN>
curl -X POST -H 'Authorization: token 21a393b182705f3d5faea967496b465cbacbff8b' https://api.github.com/user/repos -d '{"name":"test-private","private": true}'
    OK    

<!--{
  "clone_url": "https://github.com/syoung/test-private.git",
  "ssh_url": "git@github.com:syoung/test-private.git",
  "git_url": "git://github.com/syoung/test-private.git",
  "created_at": "2012-06-23T01:53:47Z",
  "watchers": 1,
  "description": "",
  "owner": {
    "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
    "url": "https://api.github.com/users/syoung",
    "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "id": 278943,
    "login": "syoung"
  },
  "open_issues": 0,
  "full_name": "syoung/test-private",
  "updated_at": "2012-06-23T01:53:47Z",
  "master_branch": "master",
  "mirror_url": null,
  "has_downloads": true,
  "permissions": {
    "push": true,
    "admin": true,
    "pull": true
  },
  "has_issues": true,
  "size": 0,
  "fork": false,
  "svn_url": "https://github.com/syoung/test-private",
  "html_url": "https://github.com/syoung/test-private",
  "language": null,
  "pushed_at": "2012-06-23T01:53:47Z",
  "name": "test-private",
  "url": "https://api.github.com/repos/syoung/test-private",
  "forks": 1,
  "homepage": null,
  "private": false,
  "id": 4757804,
  "has_wiki": true
}
-->
   
</entry>
<entry [Fri 2012:06:22 21:48:09 EST] USE ***ARRAY*** TO CONFER scopes VALUES USING login AND password>

NB: "scopes":["public_repo,repo,delete_repo"] WILL BE ACCEPTED BUT THE TOKEN WON'T WORK:

curl -K curl.txt https://api.github.com/authorizations/387886 -X PATCH --data '{"scopes":["public_repo,repo,delete_repo"]}'


MUST USE "scopes":["public_repo","repo","delete_repo"]:

curl -K curl.txt https://api.github.com/authorizations/387886 -X PATCH --data '{"scopes":["public_repo","repo","delete_repo"]}'

    {
      "app": {
        "url": "http://ec2-50-19-18-44.compute-1.amazonaws.com",
        "name": "agua"
      },
      "token": "21a393b182705f3d5faea967496b465cbacbff8b",
      "scopes": [
        "public_repo",
        "repo",
        "delete_repo"
      ],
      "created_at": "2012-06-01T18:19:40Z",
      "note_url": null,
      "url": "https://api.github.com/authorizations/387886",
      "id": 387886,
      "updated_at": "2012-06-23T01:47:57Z",
      "note": "public"
    }

    


</entry>
<entry [Fri 2012:06:22 19:22:24 EST] DELETE REPO WITH OAUTH delete_repo TOKEN>

curl -X DELETE -H 'Authorization: token ded526622a10cfaaea0134662696b748ff666696' https://api.github.com/repos/syoung/test-public
    OK
    (NO OUTPUT)
    
</entry>
<entry [Fri 2012:06:22 19:15:00 EST] CREATE REPO WITH OAUTH repo TOKEN>
    
NB: CAN'T CREATE WITH repo,delete_repo OAUTH TOKEN - SCOPE MUST BE repo OR public_repo

OAUTH TOKENS:

PUBLIC

application : agua
scope       : public_repo
access_token: 21a393b182705f3d5faea967496b465cbacbff8b 
id          : 387886

PRIVATE

application : agua2
scope       : public_repo,repo
access_token: efe7c3660f0b60602562b21f8ee2824d09a73caa
id          : 405779

DELETE

application : agua3 
scope       : public_repo,repo,delete_repo
access_token: ded526622a10cfaaea0134662696b748ff666696
id          : 423774


CREATE REPO FAILS WITH agua3 OAUTH TOKEN (SCOPE: repo,delete_repo):

curl -X POST -H 'Authorization: token ded526622a10cfaaea0134662696b748ff666696' https://api.github.com/user/repos -d '{"name":"test-public","description": "","scope":"user"}'
    {
      "message": "Not Found"
    }


BUT CREATE REPO SUCCEEDS WITH agua2 OAUTH TOKEN (SCOPE: repo):

curl -X POST -H 'Authorization: token efe7c3660f0b60602562b21f8ee2824d09a73caa' https://api.github.com/user/repos -d '{"name":"test-public","description": "","scope":"user"}

{
  "created_at": "2012-06-22T23:14:10Z",
  "ssh_url": "git@github.com:syoung/test-public.git",
  "pushed_at": "2012-06-22T23:14:11Z",
  "master_branch": "master",
  "permissions": {
    "pull": true,
    "admin": true,
    "push": true
  },
  "forks": 1,
  "homepage": null,
  "html_url": "https://github.com/syoung/test-public",
  "has_downloads": true,
  "updated_at": "2012-06-22T23:14:11Z",
  "mirror_url": null,
  "has_issues": true,
  "svn_url": "https://github.com/syoung/test-public",
  "fork": false,
  "has_wiki": true,
  "size": 0,
  "private": false,
  "clone_url": "https://github.com/syoung/test-public.git",
  "owner": {
    "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
    "login": "syoung",
    "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "id": 278943,
    "url": "https://api.github.com/users/syoung"
  },
  "name": "test-public",
  "language": null,
  "watchers": 1,
  "description": "",
  "git_url": "git://github.com/syoung/test-public.git",
  "id": 4756924,
  "open_issues": 0,
  "full_name": "syoung/test-public",
  "url": "https://api.github.com/repos/syoung/test-public"
}
    
</entry>
<entry [Fri 2012:06:22 18:58:00 EST] GITHUB API I/O>


http://apis.io/GitHub

    
</entry>
<entry [Fri 2012:06:22 18:54:08 EST] FAILS: DELETE A TAG ON GITHUB>

DELETE TAG:


git tag -d :tag
git push origin :refs/tags/:tag


NB: CANNOT DELETE TAG USING API, E.G.:

curl -X DELETE -i -u 'myuser:mypassword' https://api.github.com/repos/:user/:repo/git/refs/tags/ben-test-310

    FAILS
    
    
</entry>
<entry [Fri 2012:06:22 15:25:35 EST] FAILS: DELETE REPO USING SCOPE repo ACCESS TOKEN>
    
http://developer.github.com/v3/repos/

Delete a Repository

Deleting a repository requires admin access. If OAuth is used, the delete_repo scope is required.

DELETE /repos/:user/:repo
Response

    Status: 204 No Content
    X-RateLimit-Limit: 5000
    X-RateLimit-Remaining: 4999


curl -X DELETE -H 'Authorization: token ded526622a10cfaaea0134662696b748ff666696' https://api.github.com/repos/syoung/test-public

    {
      "message": "Not Found"
    }
        
curl -X DELETE https://api.github.com/repos/syoung/test-public?access_token=ded526622a10cfaaea0134662696b748ff666696

    {
      "message": "Not Found"
    }
    

    	my $command = qq{curl -X POST -H 'Authorization: token $token' $apiroot/user/repos -d '{"name":"$repository","description": "","scope":"user"}'};



</entry>
<entry [Fri 2012:06:22 14:43:18 EST] CREATE REPO USING SCOPE repo ACCESS TOKEN>

http://stackoverflow.com/questions/7870680/github-v3-api-create-a-repo

curl -X POST -H 'Authorization: token efe7c3660f0b60602562b21f8ee2824d09a73caa' https://api.github.com/user/repos -d '{"name":"test-public","description": "","scope":"user"}'


    
</entry>
<entry [Sun 2012:06:17 03:01:01 EST] TESTED VARIOUS PERL OAUTH MODULES>
  
BUT STILL CAN'T FIX PROBLEM OF NO code WHEN USING curl

NB: GET code WHEN USING login AND password 

  
LWP::Authen::OAuth
------------------

cpanm install LWP::Authen::OAuth


Net::OAuth::All
---------------

cpanm install Net::OAuth::All


FIREFOX - OK
-------
https://github.com/login/oauth/authorize?response_type=code&client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi

PARAMS
client_id	96580e0b6f984bb8b64d
redirect_uri	http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi
response_type	code
scope	public_repo

REQUEST HEADERS

Accept	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Encoding	gzip, deflate
Connection	keep-alive
Cookie	_gh_sess=BAh7CzoMY29udGV4dCIGLzoPc2Vzc2lvbl9pZCIlYzljZjEwY2RiMTA2ZTA3ZDM4N2ZhZDZhNmYxMTliMDA6EGZpbmdlcnByaW50IiUzMWMxMDI1ZGRlNmQwZmJiMjczMTM4YmMwMzFhYmE0ZDoJdXNlcmkDn0EEOg5yZXR1cm5fdG8iAYEvbG9naW4vb2F1dGgvYXV0aG9yaXplP2NsaWVudF9pZD03NjM3YmUzMTFkZjMyNzdmNDQ4ZCZyZWRpcmVjdF91cmk9aHR0cHMlM0ElMkYlMkZjbGllbnQuZXhhbXBsZS5jb20lMkZyZWRpcmVjdCZyZXNwb25zZV90eXBlPWNvZGU6EF9jc3JmX3Rva2VuIjEvRiszRzhqbU5EYkdFR1RoYlpzaHRhRnlKekE3ZENESUZ5SHYrMnpZcitzPQ%3D%3D--7d8bbe7c46e21801ef6d3861236184e0447d751c; __utma=1.1184510383.1336360857.1338622433.1338623027.5; __utmz=1.1338623027.5.2.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=%22%20url%20must%20be%20absolute%20%22%20oauth; _gauges_unique_year=1; _gauges_unique=1
Host	github.com
User-Agent	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:12.0) Gecko/20100101 Firefox/12.0


OAUTH-LITE2
-----------

http://search.cpan.org/~lyokato/OAuth-Lite2-0.01_04/lib/OAuth/Lite2/Client/WebServer.pm


1. INSTALL Oauth::Lite

sudo su
apt-get install libxml2-dev
cpanm install XML::LibXML
cpanm install OAuth::Lite2::Client::WebServer
cpanm install OAuth::Lite2::Client::Agent::Dump



$VAR1 = bless( {
    'last_response' => undef,
    'authorize_uri' => 'https://github.com/login/oauth/authorize',
    'response_parser' => bless( {}, 'OAuth::Lite2::Client::TokenResponseParser' ),
    'secret' => 'a9fc1c5af531172dee286fa158cb03391be10ab7',
    'access_token_uri' => 'https://github.com/login/oauth/access_token',
    'refresh_token_uri' => undef,
    'format' => 'json',
    'last_request' => undef,
    'agent' => bless( {
        'max_redirect' => 7,
        'ssl_opts' => {
                        'verify_hostname' => 1
                      },
        'protocols_forbidden' => undef,
        'show_progress' => undef,
        'handlers' => {
            'response_header' => bless( [
            {
              'owner' => 'LWP::UserAgent::parse_head',
              'callback' => sub { "DUMMY" },
              'm_media_type' => 'html',
              'line' => '/usr/local/share/perl/5.14.2/LWP/UserAgent.pm:683'
            }
          ], 'HTTP::Config' )
        },
        'no_proxy' => [],
        'protocols_allowed' => undef,
        'local_address' => undef,
        'use_eval' => 1,
        'requests_redirectable' => [
            'GET',
            'HEAD'
        ],
        'timeout' => 180,
        'def_headers' => bless( {
            'user-agent' => 'OAuth::Lite2::Client::WebServer/0.01_14'
        }, 'HTTP::Headers' ),
        'proxy' => {},
        'max_size' => undef
      }, 'LWP::UserAgent' ),
    'id' => '96580e0b6f984bb8b64d'
  }, 'OAuth::Lite2::Client::WebServer' );



NO Login AND password:

reset; curl -L --verbose /tmp/curl.out -i https://github.com/login/oauth/authorize?client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi

RESPONSE LACKS BASIC AUTHENTICATION:

#### * Server auth using Basic with user 'syoung'
> GET /login/oauth/authorize?client_id=96580e0b6f984bb8b64d HTTP/1.1
#### > Authorization: Basic c3lvdW5nOnJzdDJnaXRodWI=
> User-Agent: curl/7.19.7 (x86_64-pc-linux-gnu) libcurl/7.19.7 OpenSSL/0.9.8k zlib/1.2.3.3 libidn/1.15
> Host: github.com
> Accept: */*



< Content-Length: 18024
Content-Length: 18024
< Set-Cookie: _gh_sess=BAh7BzoPc2Vzc2lvbl9pZCIlZmZkYWVlMDk3ZGY2NTg1YmFkMWM5ZmI4NTI1MGYwMmU6EF9jc3JmX3Rva2VuIjF5UXh0RVJ0YU44OGo5U08yMkJzZkV6K2M3YVRTdmEyQkYyQzFXT1lLcVRVPQ%3D%3D--ee57c2e50109ccee777130c66389a8a9dd632578; path=/; expires=Sat, 01-Jan-2022 00:00:00 GMT; secure; HttpOnly
Set-Cookie: _gh_sess=BAh7BzoPc2Vzc2lvbl9pZCIlZmZkYWVlMDk3ZGY2NTg1YmFkMWM5ZmI4NTI1MGYwMmU6EF9jc3JmX3Rva2VuIjF5UXh0RVJ0YU44OGo5U08yMkJzZkV6K2M3YVRTdmEyQkYyQzFXT1lLcVRVPQ%3D%3D--ee57c2e50109ccee777130c66389a8a9dd632578; path=/; expires=Sat, 01-Jan-2022 00:00:00 GMT; secure; HttpOnly
< Cache-Control: private, max-age=0, must-revalidate
Cache-Control: private, max-age=0, must-revalidate
< Strict-Transport-Security: max-age=2592000
Strict-Transport-Security: max-age=2592000








OMIGA

Can you please send the complete HTTP request and response headers
you get so we can check?

If you have access to tool such as wget (http://www.gnu.org/software/wget/)
or curl (http://curl.haxx.se/), you can construct the post request
manually with either of the following commands:


wget -S -d https://api.login.yahoo.com/oauth/v2/get_request_token --post-data="oauth_version=1.0&oauth_nonce=8c76a87ffd3e4f48b53ed4b669b0b35f&oauth_timestamp=1268432350&oauth_consumer_key=dj0yJmk9TUJETmxhUG9WbDlPJmQ9WVdrOWR6Um9kRkl3TXpRbWNHbzlNVGszTVRBM05USXhOQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD02MQ--&oauth_signature_method=PLAINTEXT&oauth_signature=821ce9362da7d3d441265e77469a1339c42097612526&oauth_callback=oob"



curl https://api.login.yahoo.com/oauth/v2/get_request_token -d "oauth_version=1.0&oauth_nonce=8c76a87ffd3e4f48b53ed4b669b0b35f&oauth_timestamp=1268432350&oauth_consumer_key=dj0yJmk9TUJETmxhUG9WbDlPJmQ9WVdrOWR6Um9kRkl3TXpRbWNHbzlNVGszTVRBM05USXhOQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD02MQ--&oauth_signature_method=PLAINTEXT&oauth_signature=821ce9362da7d3d441265e77469a1339c42097612526&oauth_callback=oob" -v







./testauth2.cgi

uri: https://github.com/login/oauth/authorize
REQUEST: 
$VAR1 = bless( {
                 'version' => '1.0',
                 'request_method' => 'GET',
                 'client_secret' => 'a9fc1c5af531172dee286fa158cb03391be10ab7',
                 'client_id' => '96580e0b6f984bb8b64d',
                 'consumer_key' => '96580e0b6f984bb8b64d',
                 'request_url' => bless( do{\(my $o = 'https://github.com/login/oauth/authorize')}, 'URI::https' ),
                 'token_secret' => '',
                 'signature_method' => 'HMAC-SHA1',
                 'signature' => 'yKxauCz8WCl871YTzQuxyVRdL7Y=',
                 'timestamp' => 1339746382,
                 'redirect_uri' => 'http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi',
                 'nonce' => 3926752478,
                 'consumer_secret' => 'a9fc1c5af531172dee286fa158cb03391be10ab7',
                 'extra_params' => {},
                 'token' => ''
               }, 'Net::OAuth::ProtectedResourceRequest' );

  
</entry>
<entry [Sat 2012:06:16 17:29:30 EST] BITBUCKET OAUTH AUTHENTICATION>

We also support OAuth 1.0a across the API. The 3 important URLs you need to know to get started are:

Request token: https://bitbucket.org/api/1.0/oauth/request_token/
Authenticate: https://bitbucket.org/api/1.0/oauth/authenticate/
Access token: https://bitbucket.org/api/1.0/oauth/access_token/

    
</entry>
<entry [Sat 2012:06:16 17:27:53 EST] BITBUCKET API BASIC AUTHENTICATION>

curl https://bitbucket.org/api/1.0/repositories/jespern/bitbucket/issues/ --user admin:admin
    
</entry>
<entry [Fri 2012:06:15 20:49:13 EST] CURL MAN PAGE>

http://curl.haxx.se/docs/manpage.html
    
</entry>
<entry [Fri 2012:06:15 18:11:47 EST] WGET TIPS>
    
http://www.editcorp.com/Personal/Lars_Appel/wget/wget_7.html

WRITE LOG
wget -t 45 -o log

You would like to read the list of URLs from a file? Not a problem with that:
wget -i file
If you specify `-' as file name, the URLs will be read from standard input.

Create a mirror image of GNU WWW site (with the same directory structure the original has) with only one try per document, saving the log of the activities to `gnulog':
wget -r -t1 http://www.gnu.ai.mit.edu/ -o gnulog

Retrieve the first layer of yahoo links:
wget -r -l1 http://www.yahoo.com/

Retrieve the index.html of `www.lycos.com', showing the original server headers:
wget -S http://www.lycos.com/

Save the server headers with the file:
wget -s http://www.lycos.com/
more index.html

Retrieve the first two levels of `wuarchive.wustl.edu', saving them to /tmp.
wget -P/tmp -l2 ftp://wuarchive.wustl.edu/

You want to download all the GIFs from an HTTP directory. `wget http://host/dir/*.gif' doesn't work, since HTTP retrieval does not support globbing. In that case, use:
wget -r -l1 --no-parent -A.gif http://host/dir/

It is a bit of a kludge, but it works. `-r -l1' means to retrieve recursively (See section Recursive Retrieval), with maximum depth of 1. `--no-parent' means that references to the parent directory are ignored (See section Directory-Based Limits), and `-A.gif' means to download only the GIF files. `-A "*.gif"' would have worked too.

Suppose you were in the middle of downloading, when Wget was interrupted. Now you do not want to clobber the files already present. It would be:
wget -nc -r http://www.gnu.ai.mit.edu/

If you want to encode your own username and password to HTTP or FTP, use the appropriate URL syntax (See section URL Format).
wget ftp://hniksic:mypassword@jagor.srce.hr/.emacs

If you do not like the default retrieval visualization (1K dots with 10 dots per cluster and 50 dots per line), you can customize it through dot settings (See section Wgetrc Commands). For example, many people like the "binary" style of retrieval, with 8K dots and 512K lines:
wget --dot-style=binary ftp://prep.ai.mit.edu/pub/gnu/README

You can experiment with other styles, like:
wget --dot-style=mega ftp://ftp.xemacs.org/pub/xemacs/xemacs-20.4/xemacs-20.4.tar.gz
wget --dot-style=micro http://fly.cc.fer.hr/

To make these settings permanent, put them in your `.wgetrc', as described before (See section Sample Wgetrc).
Guru Usage


If you wish Wget to keep a mirror of a page (or FTP subdirectories), use `--mirror' (`-m'), which is the shorthand for `-r -N'. You can put Wget in the crontab file asking it to recheck a site each Sunday:
crontab
0 0 * * 0 wget --mirror ftp://ftp.xemacs.org/pub/xemacs/ -o /home/me/weeklog

You may wish to do the same with someone's home page. But you do not want to download all those images--you're only interested in HTML.
wget --mirror -A.html http://www.w3.org/

But what about mirroring the hosts networkologically close to you? It seems so awfully slow because of all that DNS resolving. Just use `-D' (See section Domain Acceptance).
wget -rN -Dsrce.hr http://www.srce.hr/

Now Wget will correctly find out that `regoc.srce.hr' is the same as `www.srce.hr', but will not even take into consideration the link to `www.mit.edu'.

You have a presentation and would like the dumb absolute links to be converted to relative? Use `-k':
wget -k -r URL

You would like the output documents to go to standard output instead of to files? OK, but Wget will automatically shut up (turn on `--quiet') to prevent mixing of Wget output and the retrieved documents.
wget -O - http://jagor.srce.hr/ http://www.srce.hr/

You can also combine the two options and make weird pipelines to retrieve the documents from remote hotlists:
wget -O - http://cool.list.com/ | wget --force-html -i -
    
</entry>
<entry [Thu 2012:06:14 23:57:04 EST] WEB OAUTH ACCESS KEY HANDSHAKE>

1. USE GITHUB CALLBACK TO SEND CODE TO callback.cgi

#### NB: INSTEAD OF USING login AND password
#### curl -K curl.txt https://github.com/login/oauth/authorize?client_id=96580e0b6f984bb8b64d

WORKS IN BROWSER:

https://github.com/login/oauth/authorize?response_type=code&client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi


*** BUT DOESN'T WORK ON COMMAND LINE (ON MASTER OR ON HEADNODE):


curl https://github.com/login/oauth/authorize?response_type=code&client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi




/var/www/cgi-bin/agua/oauth-init.cgi 

    Doing request->sign()
    http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi?oauth_consumer_key=96580e0b6f984bb8b64d&oauth_nonce=s2A0hVZuPVFLzHIYRGiUdVbP15rAvpPL&oauth_signature=wGMcMVjKjLHTFhKEzIXfk%2BUzMLM%3D&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1339743011&oauth_version=1.0
    
    Parameter oauth_signature not valid for a message of type Net::OAuth::RequestTokenResponse at ./oauth-init.cgi line 33.


/var/www/cgi-bin/agua$ ./oauth-init.cgi 
Doing request->sign()
http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi?oauth_consumer_key=96580e0b6f984bb8b64d&oauth_nonce=s2A0hVZuPVFLzHIYRGiUdVbP15rAvpPL&oauth_signature=wGMcMVjKjLHTFhKEzIXfk%2BUzMLM%3D&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1339743011&oauth_version=1.0
Parameter oauth_signature not valid for a message of type Net::OAuth::RequestTokenResponse at ./oauth-init.cgi line 33.



wget https://github.com/login/oauth/authorize?response_type=code&client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http%3A%2F%2Fec2-50-19-18-44.compute-1.amazonaws.com%2Fcgi-bin%2Fagua%2Fcallback.cgi

curl https://github.com/login/oauth/authorize?response_type=code&client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http%3A%2F%2Fec2-50-19-18-44.compute-1.amazonaws.com%2Fcgi-bin%2Fagua%2Fcallback.cgi

curl -L https://github.com/login/oauth/authorize?response_type=code&client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi

curl https://github.com/login/oauth/authorize?response_type=code&client_id=96580e0b6f984bb8b64d&scope=public_repo&redirect_uri=http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi



2. GET CODE FROM /tmp FILE PRINTED BY callback.cgi

cat /tmp/Fri-Jun-15-03-56-06-UTC-2012 

<!--    date:
    Fri Jun 15 03:56:06 UTC 2012
    SCRIPT_NAME	/cgi-bin/agua/callback.cgi
    SERVER_NAME	ec2-50-19-18-44.compute-1.amazonaws.com
    SERVER_ADMIN	webmaster@localhost
    HTTP_ACCEPT_ENCODING	gzip, deflate
    HTTP_CONNECTION	keep-alive
    REQUEST_METHOD	GET
    HTTP_ACCEPT	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
    SCRIPT_FILENAME	/var/www/cgi-bin/agua/callback.cgi
    SERVER_SOFTWARE	Apache/2.2.14 (Ubuntu)
    QUERY_STRING	code=1166160ce0398a7a1d16
    REMOTE_PORT	50375
    HTTP_USER_AGENT	Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:12.0) Gecko/20100101 Firefox/12.0
    SERVER_PORT	80
    SERVER_SIGNATURE	<address>Apache/2.2.14 (Ubuntu) Server at ec2-50-19-18-44.compute-1.amazonaws.com Port 80</address>
    
    HTTP_ACCEPT_LANGUAGE	en-us,en;q=0.5
    REMOTE_ADDR	76.110.77.97
    SERVER_PROTOCOL	HTTP/1.1
    PATH	/usr/local/bin:/usr/bin:/bin
    REQUEST_URI	/cgi-bin/agua/callback.cgi?code=1166160ce0398a7a1d16
    GATEWAY_INTERFACE	CGI/1.1
    SERVER_ADDR	10.126.45.222
    DOCUMENT_ROOT	/var/www/html
    HTTP_HOST	ec2-50-19-18-44.compute-1.amazonaws.com
-->


2. USE THE CODE TO GET THE OAUTH ACCESS TOKEN

curl --data "client_id=96580e0b6f984bb8b64d" --data "client_secret=a9fc1c5af531172dee286fa158cb03391be10ab7" --data "code=1166160ce0398a7a1d16" https://github.com/login/oauth/access_token

    access_token=21a393b182705f3d5faea967496b465cbacbff8b&token_type=bearer



    
</entry>
<entry [Thu 2012:06:14 14:05:11 EST] ADD/REMOVE/SET SCOPES WITH login AND password>


ADD SCOPES:

curl -K curl.txt https://api.github.com/authorizations/405779 -X PATCH --data "{\"add_scopes\":[\"delete_repo\"]}"
{
  "note": "agua2",
  "note_url": null,
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "agua2 (API)"
  },
  "created_at": "2012-06-14T17:49:17Z",
  "token": "efe7c3660f0b60602562b21f8ee2824d09a73caa",
  "url": "https://api.github.com/authorizations/405779",
  "scopes": [
    "repo",
    "delete_repo"
  ],
  "updated_at": "2012-06-14T18:02:50Z",
  "id": 405779
}



REMOVE SCOPES:

curl -K curl.txt https://api.github.com/authorizations/405779 -X PATCH --data "{\"remove_scopes\":[\"delete_repo\"]}"
{
  "note_url": null,
  "note": "agua2",
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "agua2 (API)"
  },
  "created_at": "2012-06-14T17:49:17Z",
  "token": "efe7c3660f0b60602562b21f8ee2824d09a73caa",
  "url": "https://api.github.com/authorizations/405779",
  "scopes": [
    "repo"
  ],
  "updated_at": "2012-06-14T18:02:58Z",
  "id": 405779
}

SET SCOPES:

curl -K curl.txt https://api.github.com/authorizations/405779 -X PATCH --data "{\"scopes\":[\"public_repo\"]}"
{
  "note": "agua2",
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "agua2 (API)"
  },
  "created_at": "2012-06-14T17:49:17Z",
  "token": "efe7c3660f0b60602562b21f8ee2824d09a73caa",
  "url": "https://api.github.com/authorizations/405779",
  "scopes": [
    "public_repo"
  ],
  "note_url": null,
  "updated_at": "2012-06-14T18:03:20Z",
  "id": 405779
}

    
</entry>
<entry [Thu 2012:06:14 03:59:21 EST] CREATE AND RENAME OAUTH ACCESS KEY WITH login AND password>

CREATE ACCESS TOKEN:

curl -K curl.txt https://api.github.com/authorizations -d '{"scopes":["repo"]}' 

<!--{
  "note_url": null,
  "note": null,
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "GitHub API"
  },
  "created_at": "2012-06-14T17:49:17Z",
  "token": "efe7c3660f0b60602562b21f8ee2824d09a73caa",
  "url": "https://api.github.com/authorizations/405779",
  "scopes": [
    "repo"
  ],
  "updated_at": "2012-06-14T17:49:17Z",
  "id": 405779
}
-->


RENAME ACCESS TOKEN:

curl -K curl.txt https://api.github.com/authorizations/405779 -X PATCH --data "{\"note\":\"agua2\"}"

<!--{
  "note_url": null,
  "note": "agua2",
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "agua2 (API)"
  },
  "created_at": "2012-06-14T17:49:17Z",
  "token": "efe7c3660f0b60602562b21f8ee2824d09a73caa",
  "url": "https://api.github.com/authorizations/405779",
  "scopes": [
    "repo"
  ],
  "updated_at": "2012-06-14T17:55:23Z",
  "id": 405779
}
-->


</entry>
<entry [Wed 2012:06:13 03:01:19 EST] REFACTOR Agua::Ops::Github TO USE OAUTH>

createRepo

curl -X POST -H 'Authorization: token $token' $apiroot/user/repos -d '{"name":"$repository","description": "","scope":"user"}'


deleteRepo

curl -X DELETE -H 'Authorization: token $token' $apiroot/repos/$login/$repository";

    
setCredentials

curl -H 'Authorization: token $token'  ...


getRemoteTags




getRemoteTagsTimeout


    
</entry>
<entry [Thu 2012:06:14 03:01:19 EST] DOWNLOAD ARCHIVE USING OAUTH ACCESS TOKEN>

http://developer.github.com/v3/repos/contents/

Repo Contents API

Get archive link

This method will return a 302 to a URL to download a tarball or zipball archive for a repository. Please make sure your HTTP framework is configured to follow redirects or you will need to use the Location header to make a second GET request.

Note: For private repositories, these links are temporary and expire quickly.

GET /repos/:user/:repo/:archive_format/:ref
Parameters

archive_format
Either tarball or zipball
ref (optional)
Optional valid Git reference, defaults to master
Response

Status: 
Location: http://github.com/me/myprivate/tarball/master?SSO=thistokenexpires
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4999
To follow redirects with curl, use the -L switch:

curl -L https://api.github.com/repos/pengwynn/octokit/tarball > octokit.tar.gz
   
    
</entry>
<entry [Wed 2012:06:13 23:59:18 EST] USE MIME TYPE TO GET RAW TEXT>

http://developer.github.com/v3/mime/

GitHub Mime Types

Custom mime types are used in the API to let consumers choose the format of the data they wish to receive. *** This is done by adding one or more of the following types to the Accept header when you make a request *** . Mime types are specific to resources, allowing them to change independently and support formats that other resources don’t.

Comment Body Properties

The body of a comment can be written in GitHub Flavored Markdown. Issues, Issue Comments, Pull Request Comments, and Gist Comments all accept these same mime types:

Raw
Return the raw markdown body. Response will include body. This is the default if you do not pass any specific mime type.

application/vnd.github.VERSION.raw+json


Text
Return a text only representation of the markdown body. Response will include body_text.

application/vnd.github.VERSION.text+json


</entry>
<entry [Wed 2012:06:13 23:41:43 EST] GET THE CONTENTS OF A FILE>


GET syoung BIOREPOSITORY workflows.pm FILE CONTENTS:

curl -H "Accept: application/vnd.github.beta.raw+json"  https://api.github.com/repos/syoung/biorepository/contents/aguatest/workflows.pm

    use MooseX::Declare;
    class workflows extends Agua::Ops {
    }

ACTUAL FILE CONTENTS:

    use MooseX::Declare;
    class workflows extends Agua::Ops {
    }


NB: WITHOUT MIME TYPE 'Accept' HEADER, GET 64-BIT ENCODED CONTENTS:

curl https://api.github.com/repos/syoung/biorepository/contents/aguatest/workflows.pm

{
  "type": "file",
  "_links": {
    "html": "https://github.com/syoung/biorepository/blob/master/aguatest/workflows.pm",
    "git": "https://api.github.com/repos/syoung/biorepository/git/blobs/2604a3e19be61a6feacbf8da5db5bdfbccef7ea1",
    "self": "https://api.github.com/repos/syoung/biorepository/contents/aguatest/workflows.pm"
  },
  "sha": "2604a3e19be61a6feacbf8da5db5bdfbccef7ea1",
  "content": "CnVzZSBNb29zZVg6OkRlY2xhcmU7CmNsYXNzIHdvcmtmbG93cyBleHRlbmRz\nIEFndWE6Ok9wcyB7Cn0=\n",
  "size": 59,
  "encoding": "base64",
  "name": "aguatest/workflows.pm",
  "path": "aguatest/workflows.pm"
}


GET agua AGUA README:

curl -H "Accept: application/vnd.github.beta.raw+json" https://api.github.com/repos/agua/agua/readme
    OK

    README
    ======
    
    This documentation is composed of the following main sections:
    
    1. Introduction
    2. Installation
    3. Resources
    4. For Developers
    5. License
    ...
    

NOTES
=====

http://developer.github.com/v3/repos/contents/

Repo Contents API
These API methods let you retrieve the contents of files within a repository as Base64 encoded content. See Mime types for requesting raw or other formats.

GET FILE CONTENTS:

This method returns the contents of any file or directory in a repository.

GET /repos/:user/:repo/contents/:path

GET README:

GET /repos/:user/:repo/readme


</entry>

<entry [Wed 2012:06:13 23:35:52 EST] LIST TAGS WITH OAUTH ACCESS TOKEN>

FORMAT:
curl https://api.github.com/repos/:user/:repo/tags


PUBLIC REPO (DOESN'T REQUIRE OAUTH ACCESS TOKEN):

curl  https://api.github.com/repos/syoung/biorepository/tags?access_token=21a393b182705f3d5faea967496b465cbacbff8b

OR:

curl -H "Authorization: token 21a393b182705f3d5faea967496b465cbacbff8b" https://api.github.com/repos/syoung/biorepository/tags

<!--
[
  {
    "commit": {
      "url": "https://api.github.com/repos/syoung/biorepository/commits/601143ff5739458c337c3a698b9f49e44515fae8",
      "sha": "601143ff5739458c337c3a698b9f49e44515fae8"
    },
    "name": "0.7.6+build1",
    "zipball_url": "https://github.com/syoung/biorepository/zipball/0.7.6+build1",
    "tarball_url": "https://github.com/syoung/biorepository/tarball/0.7.6+build1"
  },
  {
    "commit": {
      "url": "https://api.github.com/repos/syoung/biorepository/commits/2f886d8f3de6af0cf945b2c842035d2a24296fe0",
      "sha": "2f886d8f3de6af0cf945b2c842035d2a24296fe0"
    },
    "name": "0.6.0",
    "zipball_url": "https://github.com/syoung/biorepository/zipball/0.6.0",
    "tarball_url": "https://github.com/syoung/biorepository/tarball/0.6.0"
  }
]
-->


PRIVATE REPO (REQUIRES OAUTH ACCESS TOKEN):

curl  https://api.github.com/repos/syoung/biorepodev/tags
{
  "message": "Not Found"
}


curl -H "Authorization: token f9dafe768811126a94890c2500e15b219275be77"  https://api.github.com/repos/syoung/biorepodev/tags
Enter host password for user 'syoung':
[

]



 
</entry>
<entry [Wed 2012:06:13 23:16:53 EST] GET FORKS WITH OAUTH ACCESS TOKEN>

http://developer.github.com/v3/repos/forks/


DON'T NEED ACCESS TOKEN FOR PUBLIC REPO:
curl -K curl.txt https://api.github.com/repos/syoung/biorepository/forks

... BUT NEED ACCESS TOKEN FOR PRIVATE REPO:
curl  https://api.github.com/repos/syoung/biorepodev/forks
{
  "message": "Not Found"
}

curl -H "Authorization: token c1defa4fa3ee6bc2ec7c7e21e544464f6c629753"  https://api.github.com/repos/syoung/biorepodev/forks
[

]

curl -H "Authorization: token c1defa4fa3ee6bc2ec7c7e21e544464f6c629753"  https://api.github.com/repos/syoung/aguadev/forks
[

]


curl -H "Authorization: token c1defa4fa3ee6bc2ec7c7e21e544464f6c629753"  https://api.github.com/repos/syoung/agua/forks
[

]

NB: AUTHORIZATION FOR THE WRONG USER DOESN'T INTERFERE WITH PUBLIC REPOS:

curl -H "Authorization: token c1defa4fa3ee6bc2ec7c7e21e544464f6c629753"  https://api.github.com/repos/agua/agua/forks
[

]

    
</entry>
<entry [Wed 2012:06:13 21:49:38 EST] DELETE AUTHORISATION WITH login AND password>

DELETE AN AUTHORISATION WITH login AND password:

curl -K curl.txt https://api.github.com/authorizations/404669 -X DELETE

    OK


CONFIRM DELETE:

curl -K curl.txt https://api.github.com/authorizations    

[
  {
    "note_url": null,
    "url": "https://api.github.com/authorizations/387886",
    "scopes": [
      "public_repo"
    ],
    "created_at": "2012-06-01T18:19:40Z",
    "app": {
      "url": "http://ec2-50-19-18-44.compute-1.amazonaws.com",
      "name": "agua"
    },
    "token": "21a393b182705f3d5faea967496b465cbacbff8b",
    "updated_at": "2012-06-14T02:05:56Z",
    "note": null,
    "id": 387886
  },
  {
    "note_url": null,
    "url": "https://api.github.com/authorizations/402889",
    "scopes": [
      "repo"
    ],
    "created_at": "2012-06-13T01:39:26Z",
    "app": {
      "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
      "name": "syoung dev staging (API)"
    },
    "token": "f9dafe768811126a94890c2500e15b219275be77",
    "updated_at": "2012-06-13T22:21:09Z",
    "note": "syoung dev staging",
    "id": 402889
  }
]

    

    
NB: MUST USE login AND password ... CANNOT DELETE repo SCOPE AUTHORISATION WITH OAUTH ACCESS TOKEN:

curl -H "Authorization: token f9dafe768811126a94890c2500e15b219275be77" https://api.github.com/authorizations/402889 -X DELETE
    
    {
      "message": "Not Found"
    }





</entry>
<entry [Wed 2012:06:13 18:04:33 EST] EDIT AUTHORISATION WITH login AND password>

NOTE: MUST USE login AND password. OAUTH ACCESS TOKEN DOES NOT WORK!!

curl -K curl.txt https://api.github.com/authorizations/402889 -X PATCH --data "{\"scopes\":[\"repo\"]}"
    OK
<!--{
  "note": null,
  "note_url": null,
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "GitHub API"
  },
  "created_at": "2012-06-13T01:39:26Z",
  "token": "f9dafe768811126a94890c2500e15b219275be77",
  "url": "https://api.github.com/authorizations/402889",
  "scopes": [
    "repo"
  ],
  "updated_at": "2012-06-13T22:18:21Z",
  "id": 402889
}
-->

curl -K curl.txt https://api.github.com/authorizations/402889 -X PATCH --data "{\"note\":\"syoung dev staging\"}"
    OK
<!--{
  "note": "syoung dev staging",
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "syoung dev staging (API)"
  },
  "created_at": "2012-06-13T01:39:26Z",
  "token": "f9dafe768811126a94890c2500e15b219275be77",
  "url": "https://api.github.com/authorizations/402889",
  "scopes": [
    "repo"
  ],
  "updated_at": "2012-06-13T22:21:09Z",
  "id": 402889,
  "note_url": null
}
-->



*** SEE BELOW FOR MORE authorizations OPTIONS ***


OAuth Authorizations API
------------------------

There is an API for users to manage their own tokens. You can only access your own tokens, and only through Basic Authentication
    
curl -K curl.txt https://api.github.com/authorizations

<!--[
  {
    "note": null,
    "app": {
      "url": "http://ec2-50-19-18-44.compute-1.amazonaws.com",
      "name": "agua"
    },
    "created_at": "2012-06-01T18:19:40Z",
    "token": "21a393b182705f3d5faea967496b465cbacbff8b",
    "url": "https://api.github.com/authorizations/387886",
    "scopes": [
      "public_repo"
    ],
    "updated_at": "2012-06-13T05:18:42Z",
    "note_url": null,
    "id": 387886
  },
  {
    "note": null,
    "app": {
      "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
      "name": "GitHub API"
    },
    "created_at": "2012-06-13T01:39:26Z",
    "token": "f9dafe768811126a94890c2500e15b219275be77",
    "url": "https://api.github.com/authorizations/402889",
    "scopes": [
      "repo"
    ],
    "updated_at": "2012-06-13T01:39:26Z",
    "note_url": null,
    "id": 402889
  }
]
-->

Update an existing authorization

PATCH /authorizations/:id
Input

scopes
Optional array - Replaces the authorization scopes with these.
add_scopes
Optional array - A list of scopes to add to this authorization.
remove_scopes
Optional array - A list of scopes to remove from this authorization.
note
Optional string - A note to remind you what the OAuth token is for.
note_url
Optional string - A URL to remind you what app the OAuth token is for.

NB: You can only send one of these scope keys at a time.

{
  "add_scopes": [
    "repo"
  ],
  "note": "admin script"
}

    
</entry>
<entry [Wed 2012:06:13 17:57:45 EST] syoung OAUTH ACCESS TOKENS>

OAUTH ACCESS TOKENS

 curl -K login.txt https://api.github.com/authorizations
[
  {
    "scopes": [
      "public_repo"
    ],
    "created_at": "2012-06-01T18:19:40Z",
    "token": "21a393b182705f3d5faea967496b465cbacbff8b",
    "note_url": null,
    "updated_at": "2012-06-23T03:12:53Z",
    "note": "public",
    "url": "https://api.github.com/authorizations/387886",
    "app": {
      "url": "http://ec2-50-19-18-44.compute-1.amazonaws.com",
      "name": "agua"
    },
    "id": 387886
  },
  {
    "scopes": [
      "public_repo",
      "repo"
    ],
    "created_at": "2012-06-14T17:49:17Z",
    "token": "efe7c3660f0b60602562b21f8ee2824d09a73caa",
    "note_url": null,
    "updated_at": "2012-06-23T03:13:28Z",
    "note": "private",
    "url": "https://api.github.com/authorizations/405779",
    "app": {
      "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
      "name": "private (API)"
    },
    "id": 405779
  },
  {
    "scopes": [
      "public_repo",
      "repo",
      "delete_repo"
    ],
    "created_at": "2012-06-22T20:05:24Z",
    "token": "ded526622a10cfaaea0134662696b748ff666696",
    "note_url": null,
    "updated_at": "2012-06-23T03:13:28Z",
    "note": "delete",
    "url": "https://api.github.com/authorizations/423774",
    "app": {
      "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
      "name": "delete (API)"
    },
    "id": 423774
  },
  {
    "scopes": [
      "public_repo",
      "repo",
      "delete_repo"
    ],
    "token": "c121e1e8769a8a3ba8cd033e189ab3efdb6bcae9",
    "note_url": null,
    "updated_at": "2012-07-27T00:30:41Z",
    "note": null,
    "url": "https://api.github.com/authorizations/535242",
    "app": {
      "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
      "name": "GitHub API"
    },
    "id": 535242
  },
  {
    "scopes": [
      "public_repo",
      "repo"
    ],
    "created_at": "2012-07-29T14:16:20Z",
    "token": "c521bb306277d1444c3986f3de758af50853d7fb",
    "note_url": null,
    "updated_at": "2012-08-21T03:53:37Z",
    "note": "539130",
    "url": "https://api.github.com/authorizations/539596",
    "app": {
      "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
      "name": "539130 (API)"
    },
    "id": 539596
  }
]


OLD INFO
========

PUBLIC

application : agua
scope       : public_repo
access_token: 21a393b182705f3d5faea967496b465cbacbff8b 
id          : 387886

PRIVATE

application : agua2
scope       : public_repo,repo
access_token: efe7c3660f0b60602562b21f8ee2824d09a73caa
id          : 405779

PRIVATE + DELETE

application : agua3 
scope       : public_repo,repo,delete_repo
access_token: ded526622a10cfaaea0134662696b748ff666696
id          : 423774


SET SCOPES

curl -K curl.txt https://api.github.com/authorizations/387886 -X PATCH --data '{"scopes":["public_repo"]}'

curl -K curl.txt https://api.github.com/authorizations/405779 -X PATCH --data '{"scopes":["public_repo","repo"]}'

curl -K curl.txt https://api.github.com/authorizations/423774 -X PATCH --data '{"scopes":["public_repo","repo","delete_repo"]}'


CREATE agua3:

cd /agua/conf
curl -K curl.txt https://api.github.com/authorizations -d '{"scopes":["repo, delete_repo"], "note":"agua3"}'
    {
      "created_at": "2012-06-22T20:05:24Z",
      "note_url": null,
      "updated_at": "2012-06-22T20:05:24Z",
      "app": {
        "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
        "name": "agua3 (API)"
      },
      "token": "ded526622a10cfaaea0134662696b748ff666696",
      "note": "agua3",
      "url": "https://api.github.com/authorizations/423774",
      "id": 423774,
      "scopes": [
        "repo, delete_repo"
      ]
    }
    

CHANGE NAMES:

cd /agua/conf
curl -K curl.txt https://api.github.com/authorizations/387886 -X PATCH --data "{\"note\":\"public\"}"
curl -K curl.txt https://api.github.com/authorizations/405779 -X PATCH --data "{\"note\":\"private\"}"
curl -K curl.txt https://api.github.com/authorizations/423774 -X PATCH --data "{\"note\":\"delete\"}"


LOAD repoaccess:

insert into repoaccess values ('syoung', 'syoung', 'github', 'efe7c3660f0b60602562b21f8ee2824d09a73caa','');


SET SCOPE FOR agua2:

cd /agua/conf
curl -K curl.txt https://api.github.com/authorizations/405779 -X PATCH --data "{\"scopes\":[\"repo\"]}"


SET SCOPE FOR agua3:

cd /agua/conf
curl -K curl.txt https://api.github.com/authorizations/423774 -X PATCH --data "{\"scopes\":[\"delete_repo\"]}"


GET AUTHORISATIONS
curl -K curl.txt https://api.github.com/authorizations
[
    {
      "note": null,
      "url": "https://api.github.com/authorizations/387886",
      "note_url": null,
      "scopes": [
        "public_repo"
      ],
      "created_at": "2012-06-01T18:19:40Z",
      "app": {
        "url": "http://ec2-50-19-18-44.compute-1.amazonaws.com",
        "name": "agua"
      },
      "token": "21a393b182705f3d5faea967496b465cbacbff8b",
      "updated_at": "2012-06-17T07:06:49Z",
      "id": 387886
    },
    {
      "note": "agua2",
      "url": "https://api.github.com/authorizations/405779",
      "note_url": null,
      "scopes": [
          "repo",
          "delete_repo"
      ],
      "created_at": "2012-06-14T17:49:17Z",
      "app": {
        "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
        "name": "agua2 (API)"
      },
      "token": "efe7c3660f0b60602562b21f8ee2824d09a73caa",
      "updated_at": "2012-06-17T07:31:03Z",
      "id": 405779
    },
    {
      "created_at": "2012-06-22T20:05:24Z",
      "note_url": null,
      "updated_at": "2012-06-22T20:05:24Z",
      "app": {
        "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
        "name": "agua3 (API)"
      },
      "token": "ded526622a10cfaaea0134662696b748ff666696",
      "note": "agua3",
      "url": "https://api.github.com/authorizations/423774",
      "id": 423774,
      "scopes": [
        "delete_repo"
      ]
    }
  
]


<!--application : GitHub API
scope       : repo
access_token: c1defa4fa3ee6bc2ec7c7e21e544464f6c629753
id          : 404669
-->


</entry>
<entry [Wed 2012:06:13 13:55:35 EST] GET REPO INFO USING OAUTH ACCESS TOKEN>

CONFIRM THAT TOKEN WORKS:

curl  https://api.github.com/user
    { "message": "Requires authentication"  }


curl  https://api.github.com/user?access_token=21a393b182705f3d5faea967496b465cbacbff8b
    OK
<!--{
  "type": "User",
  "hireable": false,
  "login": "syoung",
  "followers": 1,
  "email": "stuartpyoung@gmail.com",
  "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
  "company": null,
  "bio": null,
  "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
  "following": 1,
  "html_url": "https://github.com/syoung",
  "created_at": "2010-05-17T07:11:56Z",
  "location": null,
  "public_gists": 1,
  "blog": "www.stuartpyoung.com",
  "url": "https://api.github.com/users/syoung",
  "name": "Stuart Young",
  "public_repos": 1,
  "id": 278943
}
-->

ACCESS TOKEN NOT NEEDED FOR PUBLIC REPO:

curl https://api.github.com/repos/syoung/biorepository

OR

curl https://api.github.com/repos/syoung/biorepository?access_token=21a393b182705f3d5faea967496b465cbacbff8b 

<!--{
  "open_issues": 0,
  "svn_url": "https://github.com/syoung/biorepository",
  "pushed_at": "2012-06-12T01:09:33Z",
  "language": "Perl",
  "description": "A public repository of life sciences software and data sources.",
  "full_name": "syoung/biorepository",
  "has_downloads": true,
  "watchers": 1,
  "fork": false,
  "clone_url": "https://github.com/syoung/biorepository.git",
  "ssh_url": "git@github.com:syoung/biorepository.git",
  "created_at": "2012-01-10T08:47:48Z",
  "mirror_url": null,
  "url": "https://api.github.com/repos/syoung/biorepository",
  "size": 448,
  "homepage": "www.aguadev.org",
  "private": false,
  "updated_at": "2012-06-12T01:09:33Z",
  "owner": {
    "login": "syoung",
    "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
    "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "url": "https://api.github.com/users/syoung",
    "id": 278943
  },
  "name": "biorepository",
  "permissions": {
    "pull": true,
    "admin": true,
    "push": true
  },
  "has_wiki": true,
  "has_issues": true,
  "git_url": "git://github.com/syoung/biorepository.git",
  "html_url": "https://github.com/syoung/biorepository",
  "id": 3143880,
  "forks": 1
}
-->

public_repo ACCESS TOKEN DOESN'T WORK FOR PRIVATE REPO:

curl https://api.github.com/repos/syoung/NewRepoName?access_token=21a393b182705f3d5faea967496b465cbacbff8b 
    {   "message": "Not Found"    }

    
BUT repo ACCESS TOKEN DOES WORK:

curl https://api.github.com/repos/syoung/NewRepoName?access_token=f9dafe768811126a94890c2500e15b219275be77
    OK
<!--{
  "mirror_url": null,
  "ssh_url": "git@github.com:syoung/NewRepoName.git",
  "git_url": "git://github.com/syoung/NewRepoName.git",
  "url": "https://api.github.com/repos/syoung/NewRepoName",
  "has_downloads": true,
  "watchers": 1,
  "clone_url": "https://github.com/syoung/NewRepoName.git",
  "language": null,
  "fork": false,
  "description": null,
  "permissions": {
    "admin": true,
    "pull": true,
    "push": true
  },
  "has_wiki": true,
  "has_issues": true,
  "created_at": "2012-06-11T22:40:57Z",
  "full_name": "syoung/NewRepoName",
  "forks": 0,
  "size": 0,
  "html_url": "https://github.com/syoung/NewRepoName",
  "private": true,
  "owner": {
    "url": "https://api.github.com/users/syoung",
    "login": "syoung",
    "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
    "id": 278943
  },
  "name": "NewRepoName",
  "open_issues": 0,
  "homepage": null,
  "svn_url": "https://github.com/syoung/NewRepoName",
  "updated_at": "2012-06-13T17:52:53Z",
  "id": 4630931,
  "pushed_at": "2012-06-11T22:40:57Z"
}
-->

    
</entry>
<entry [Wed 2012:06:13 13:51:02 EST] EDIT REPO WITH 'PATCH' USING login AND password>

GET REPO INFO:

curl -K curl.txt https://api.github.com/repos/syoung/newrepo 
{
  "ssh_url": "git@github.com:syoung/newrepo.git",
  "url": "https://api.github.com/repos/syoung/newrepo",
  "git_url": "git://github.com/syoung/newrepo.git",
  "has_downloads": true,
  "watchers": 1,
  "clone_url": "https://github.com/syoung/newrepo.git",
  "html_url": "https://github.com/syoung/newrepo",
  "mirror_url": null,
  "language": null,
  "fork": false,
  "description": null,
  "permissions": {
    "admin": true,
    "pull": true,
    "push": true
  },
  "has_wiki": true,
  "has_issues": true,
  "created_at": "2012-06-11T22:40:57Z",
  "full_name": "syoung/newrepo",
  "forks": 1,
  "size": 0,
  "private": false,
  "owner": {
    "url": "https://api.github.com/users/syoung",
    "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "login": "syoung",
    "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
    "id": 278943
  },
  "name": "newrepo",
  "open_issues": 0,
  "homepage": null,
  "svn_url": "https://github.com/syoung/newrepo",
  "updated_at": "2012-06-11T22:40:57Z",
  "id": 4630931,
  "pushed_at": "2012-06-11T22:40:57Z"
}


EDIT REPO name WITH PATCH:

curl -K curl.txt https://api.github.com/repos/syoung/newrepo -X PATCH --data "{\"name\":\"NewRepoName\"}"
<!--{
  "ssh_url": "git@github.com:syoung/NewRepoName.git",
  "git_url": "git://github.com/syoung/NewRepoName.git",
  "url": "https://api.github.com/repos/syoung/NewRepoName",
  "has_downloads": true,
  "watchers": 1,
  "clone_url": "https://github.com/syoung/NewRepoName.git",
  "mirror_url": null,
  "language": null,
  "fork": false,
  "description": null,
  "permissions": {
    "admin": true,
    "pull": true,
    "push": true
  },
  "has_wiki": true,
  "has_issues": true,
  "created_at": "2012-06-11T22:40:57Z",
  "full_name": "syoung/NewRepoName",
  "forks": 1,
  "size": 0,
  "private": false,
  "owner": {
    "url": "https://api.github.com/users/syoung",
    "login": "syoung",
    "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
    "id": 278943
  },
  "name": "NewRepoName",
  "open_issues": 0,
  "homepage": null,
  "svn_url": "https://github.com/syoung/NewRepoName",
  "updated_at": "2012-06-13T17:50:29Z",
  "id": 4630931,
  "html_url": "https://github.com/syoung/NewRepoName",
  "pushed_at": "2012-06-11T22:40:57Z"
}
-->

CHANGE TO PRIVATE REPO:

curl -K curl.txt https://api.github.com/repos/syoung/NewRepoName -X PATCH --data "{\"private\":\"true\"}"
<!--{
  "created_at": "2012-06-11T22:40:57Z",
  "owner": {
    "login": "syoung",
    "url": "https://api.github.com/users/syoung",
    "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
    "id": 278943,
    "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png"
  },
  "has_downloads": true,
  "watchers": 1,
  "description": null,
  "clone_url": "https://github.com/syoung/NewRepoName.git",
  "git_url": "git://github.com/syoung/NewRepoName.git",
  "html_url": "https://github.com/syoung/NewRepoName",
  "full_name": "syoung/NewRepoName",
  "updated_at": "2012-06-13T17:52:53Z",
  "url": "https://api.github.com/repos/syoung/NewRepoName",
  "language": null,
  "has_wiki": true,
  "has_issues": true,
  "mirror_url": null,
  "forks": 0,
  "size": 0,
  "fork": false,
  "permissions": {
    "admin": true,
    "push": true,
    "pull": true
  },
  "name": "NewRepoName",
  "open_issues": 0,
  "svn_url": "https://github.com/syoung/NewRepoName",
  "ssh_url": "git@github.com:syoung/NewRepoName.git",
  "private": true,
  "id": 4630931,
  "homepage": null,
  "pushed_at": "2012-06-11T22:40:57Z"
}
-->

NB: MUST PUT QUOTES AROUND "true":

root@syoung-Satellite-L355:/agua/conf# curl -K curl.txt https://api.github.com/repos/syoung/NewRepoName -X PATCH --data "{\"private\":true}"{
  "message": "Validation Failed",
  "errors": [
    {
      "message": "name is too short (minimum is 1 characters)",
      "field": "name",
      "resource": "Repository",
      "code": "custom"
    }
  ]
}

    
</entry>
<entry [Wed 2012:06:13 12:51:09 EST] CREATE OAUTH ACCESS TOKEN WITH login AND password>

SEE TIP HERE:
https://github.com/iangreenleaf/githubot/commit/a9a8f62287992e57c797d492b27f8d0e740e9d83


SHOW CURRENT AUTHORISATIONS:

curl -K curl.txt https://api.github.com/authorizations 
<!--
[
    {
        "note": null,
        "note_url": null,
        "app": {
            "url": "http://ec2-50-19-18-44.compute-1.amazonaws.com",
            "name": "agua"
        },
        "created_at": "2012-06-01T18:19:40Z",
        "token": "21a393b182705f3d5faea967496b465cbacbff8b",
        "url": "https://api.github.com/authorizations/387886",
        "scopes": [
            "public_repo"
        ],
        "updated_at": "2012-06-13T05:18:42Z",
        "id": 387886
    },
    {
        "note": null,
        "note_url": null,
        "app": {
            "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
            "name": "GitHub API"
        },
        "created_at": "2012-06-13T01:39:26Z",
        "token": "f9dafe768811126a94890c2500e15b219275be77",
        "url": "https://api.github.com/authorizations/402889",
        "scopes": [
            "repo"
        ],
        "updated_at": "2012-06-13T01:39:26Z",
        "id": 402889
    }
]
-->


CREATE NEW AUTHORISATION:

curl -K curl.txt https://api.github.com/authorizations -d '{"scopes":["repo"]}' 
<!--{
  "url": "https://api.github.com/authorizations/404669",
  "scopes": [
    "repo"
  ],
  "created_at": "2012-06-14T01:21:55Z",
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "GitHub API"
  },
  "token": "c1defa4fa3ee6bc2ec7c7e21e544464f6c629753",
  "updated_at": "2012-06-14T01:21:55Z",
  "note": null,
  "id": 404669,
  "note_url": null
}-->


SHOW NEW AUTHORISATION:

curl -H "Authorization: bearer c1defa4fa3ee6bc2ec7c7e21e544464f6c629753" https://api.github.com/users/syoung 

<!--
{
  "following": 1,
  "type": "User",
  "url": "https://api.github.com/users/syoung",
  "login": "syoung",
  "email": "stuartpyoung@gmail.com",
  "hireable": false,
  "public_repos": 1,
  "public_gists": 1,
  "created_at": "2010-05-17T07:11:56Z",
  "blog": "www.stuartpyoung.com",
  "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
  "html_url": "https://github.com/syoung",
  "bio": null,
  "name": "Stuart Young",
  "company": null,
  "location": null,
  "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
  "followers": 1,
  "id": 278943
}
-->



</entry>
<entry [Wed 2012:06:13 12:46:33 EST] GET OAUTH ACCESS TOKEN WITH login AND password>

https://gist.github.com/2288960

0. CREATE CLIENT ID

LOGIN TO GitHub --> Edit Your Profile --> Applications --> Register New Application:

Application name:   agua
Main URL        :   http://www.dummy.com
Callback URL    :   http://www.dummy.com

--> Register Application


IT WILL APPEAR IN THE Developer Applications LIST


1. CREATE LOGIN FILE FOR curl WITH login AND password

em curl.txt
    user = syoung:XXXXXXX
chmod 600 curl.txt



2. USE LOGIN FILE TO GET code FOR OAUTH TOKEN

curl -K curl.txt https://github.com/login/oauth/authorize?client_id=96580e0b6f984bb8b64d

<!--
    <html><body>You are being <a href="http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi?code=8ae1b395ac65e8489946">redirected</a>.</body></html>
-->


3. USE code TO GET OAUTH ACCESS TOKEN

curl --data "C=96580e0b6f984bb8b64d" --data "client_secret=a9fc1c5af531172dee286fa158cb03391be10ab7" --data "code=8ae1b395ac65e8489946" https://github.com/login/oauth/access_token

    access_token=21a393b182705f3d5faea967496b465cbacbff8b&token_type=bearer

    
NB: NO code PRODUCED WITHOUT LOGIN FILE:
curl https://github.com/login/oauth/authorize?client_id=96580e0b6f984bb8b64d
<!--
<html><body>You are being <a href="https://github.com/login?return_to=%2Flogin%2Foauth%2Fauthorize%3Fclient_id%3D96580e0b6f984bb8b64d">redirected</a>.</body></html>
-->


4. TEST OAUTH ACCESS TOKEN

GET https://api.github.com/user?access_token=...

curl https://github.com/user?access_token=21a393b182705f3d5faea967496b465cbacbff8b

curl -H "Authorization: token 21a393b182705f3d5faea967496b465cbacbff8b" https://github.com/user


</entry>
<entry [Wed 2012:06:13 12:46:32 EST] GET GISTS WITH login AND password>


WITHOUT LOGIN FILE JUST GET A LONG LIST OF GISTS:

curl https://api.github.com/gists 

    LONG LIST OF GISTS


USE LOGIN FILE TO GET USER-SPECIFIC LIST OF GISTS:

curl -K curl.txt https://api.github.com/gists 
[
  {
    "user": {
      "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
      "login": "syoung",
      "url": "https://api.github.com/users/syoung",
      "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
      "id": 278943
    },
    "files": {
      "myapp.ops": {
        "type": "text/plain",
        "language": null,
        "size": 13,
        "filename": "myapp.ops",
        "raw_url": "https://gist.github.com/raw/1337061/475ee1ad1ca8210d6d04ed7cb4a5154736eb63cc/myapp.ops"
      }
    },
    "description": "myAppXXX",
    "created_at": "2011-11-03T17:04:33Z",
    "public": true,
    "updated_at": "2011-11-03T17:06:25Z",
    "url": "https://api.github.com/gists/1337061",
    "comments": 0,
    "html_url": "https://gist.github.com/1337061",
    "git_pull_url": "git://gist.github.com/1337061.git",
    "id": "1337061",
    "git_push_url": "git@gist.github.com:1337061.git"
  }
]

</entry>
<entry [Tue 2012:06:12 22:40:59 EST] USING curl WITH GITHUB API>

https://gist.github.com/2288960

Introduction

An introduction to curl using GitHub's API

The Basics
Makes a basic GET request to the specifed URI

curl https://api.github.com/users/caspyin
Includes HTTP-Header information in the output

curl --include https://api.github.com/users/caspyin
Pass user credential to basic auth to access protected resources like a users starred gists, or private info associated with their profile

curl --user "caspyin:PASSWD" https://api.github.com/gists/starred
curl --user "caspyin:PASSWD" https://api.github.com/users/caspyin

Passing just the username without the colon(:) will cause you to be prompted for your account password. This avoids having your password in your command line history

curl --user "caspyin" https://api.github.com/users/caspyin


POST

Use the --request (-X) flag along with --data (-d) to POST data

curl --user "caspyin" --request POST --data '{"description":"Created via API","public":"true","files":{"file1.txt":{"content":"Demo"}}' https://api.github.com/gists

curl --user "caspyin" -X POST --data '{"description":"Created via API","public":"true","files":{"file1.txt":{"content":"Demo"}}' https://api.github.com/gists

Of course --data implies POST so you don't have to also specify the --request flag

curl --user "caspyin" --data '{"description":"Created via API","public":"true","files":{"file1.txt":{"content":"Demo"}}' https://api.github.com/gists

Here is an example that uses the old GitHub API (v2). You can use multiple --data flags

curl --data "login=caspyin" --data "token=TOKEN" https://github.com/api/v2/json/user/show/caspyin

The post data gets combined into one so you can also just combine them yourself into a single --data flag

curl --data "login=caspyin&token=TOKEN" https://github.com/api/v2/json/user/show/caspyin


You can tell curl to read from a file (@) to POST data

curl --user "caspyin" --data @data.txt https://api.github.com/gists 


Or it can read from STDIN (@-)

curl --user "caspyin" --data @- https://api.github.com/gists
{
  "description":"Test",
  "public":false,
  "files": {
    "file1.txt": {
      "content":"Demo"
    }
  }
}
end with ctrl+d


</entry>
<entry [Tue 2012:06:12 13:51:14 EST] CURL -K CONFIG OPTION>


-K, --config < config file>

Specify  which  config file to read curl arguments from. The config file is a text file in which command line arguments can be written which then will be used as if they were written on the actual command line. Options and their parameters must be specified  on  the  same config file line, separated by whitespace, colon, the equals sign or any combination thereof (how‐ ever, the preferred separator is the equals sign). If the parameter  is  to  cont
ain  whitespace,  the  parameter  must  be enclosed  within  quotes.  Within double quotes, the following escape sequences are available: \\, \", \t, \n, \r and \v. A backslash preceding any other letter is ignored. If the first column of a config line is a '#' character, the rest  of  the line will be treated as a comment. Only write one option per physical line in the config file.

Specify the filename to -K, --config as '-' to make curl read the file from stdin.

Note that to be able to specify a URL in the config file, you need to specify it using the --url option, and not by simply writing the URL on its own line. So, it could look similar to this:

url = "http://curl.haxx.se/docs/"

Long option names can optionally be given in the config file without the initial double dashes.

When curl is invoked, it always (unless -q is used) checks for a default config file and uses it if found. The default con‐
fig file is checked for in the following places in this order:

1)  curl  tries  to find the "home dir": It first checks for the CURL_HOME and then the HOME environment variables. Failing that, it uses getpwuid() on UNIX-like systems (which returns the home dir given the current user in your system).  On  Windows, it then checks for the APPDATA variable, or as a last resort the '%USERPROFILE%\Application Data'.

2)  On  windows,  if  there  is  no  _curlrc file in the home dir, it checks for one in the same dir the curl executable is placed. On UNIX-like systems, it will simply try to load .curlrc from the determined home dir.

# --- Example file ---
# this is a comment
url = "curl.haxx.se"
output = "curlhere.html"
user-agent = "superagent/1.0"

# and fetch another URL too
url = "curl.haxx.se/docs/manpage.html" -O referer = "http://nowhereatall.com/"
# --- End of example file ---

This option can be used multiple times to load multiple config files.

</entry>
<entry [Tue 2012:06:12 13:51:13 EST] COMPREHENSIVE LIST OF GITHUB v3 API COMMANDS>

http://developer.github.com/v3/repos/#get


USER
curl https://api.github.com/repos/:user

REPO
curl https://api.github.com/repos/:user/:repo

TAGS
curl https://api.github.com/repos/:user/:repo/tags

BRANCHES
curl https://api.github.com/repos/:user/:repo/branches

TEAMS
curl https://api.github.com/repos/:user/:repo/teams

LANGUAGES
curl https://api.github.com/repos/:user/:repo/languages

ORGANISATIONS
List repositories for the specified org.
GET /orgs/:org/repos


PARAMETERS FOR COMMANDS:

REPO
List your own repos.

GET /user/repos

Parameters

type
all, owner, public, private, member. Default: all.
sort
created, updated, pushed, full_name, default: created.
direction
asc or desc, default: when using full_name: asc, otherwise desc.
List user repositories


PUBLIC REPOS
List public repositories for any specified user.

GET /users/:user/repos

Parameters

type
all, owner, member. Default: all.
List organization repositories.


EDIT AN EXISTING REPO

PATCH /repos/:user/:repo

Input

name
Required string
description
Optional string
homepage
Optional string
private
Optional boolean - true makes the repository private, and false makes it public.
has_issues
Optional boolean - true to enable issues for this repository, false to disable them. Default is true.
has_wiki
Optional boolean - true to enable the wiki for this repository, false to disable it. Default is true.
has_downloads
Optional boolean - true to enable downloads for this repository, false to disable them. Default is true.

{
  "name": "Hello-World",
  "description": "This is your first repo",
  "homepage": "https://github.com",
  "public": true,
  "has_issues": true,
  "has_wiki": true,
  "has_downloads": true
}
    
</entry>
<entry [Tue 2012:06:12 13:24:03 EST] MANUALLY CREATED GITHUB OAUTH TOKEN USING login AND password: f9dafe768811126a94890c2500e15b219275be77>

curl -i -u "yourusername"   https://api.github.com/authorizations   -d '{"scopes":["repo"]}'

curl -i -u "syoung"   https://api.github.com/authorizations   -d '{"scopes":["repo"]}'
    Enter host password for user 'syoung':
    HTTP/1.1 201 Created
    Server: nginx/1.0.13
    Date: Wed, 13 Jun 2012 01:39:26 GMT
    Content-Type: application/json; charset=utf-8
    Connection: keep-alive
    Status: 201 Created
    X-RateLimit-Limit: 5000
    ETag: "ac2965a43cda3c377191bd654bd2d6d1"
    Location: https://api.github.com/authorizations/402889
    X-RateLimit-Remaining: 4999
    Content-Length: 395
    
    {
      "url": "https://api.github.com/authorizations/402889",
      "note_url": null,
      "scopes": [
        "repo"
      ],
      "created_at": "2012-06-13T01:39:26Z",
      "app": {
        "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
        "name": "GitHub API"
      },
      "updated_at": "2012-06-13T01:39:26Z",
      "note": null,
      "token": "f9dafe768811126a94890c2500e15b219275be77",
      "id": 402889
    }



2. GET ACCESS TOKEN

ACCESS TOKEN IS THE 'token' VALUE IN THE JSON OUTPUT, E.G.:
 
{
  "app": {
    "url": "http://developer.github.com/v3/oauth/#oauth-authorizations-api",
    "name": "GitHub API"
  },
  "note_url": null,
  "token": "260d993a48d9295536290b2a63bd2aa46f2789ce", <====== HERE ****
  "scopes": [
    "repo"
  ],
  "created_at": "2012-06-24T02:08:07Z",
  "url": "https://api.github.com/authorizations/425601",
  "id": 425601,
  "updated_at": "2012-06-24T02:08:07Z",
  "note": null
}

 

NB: DOES NOT WORK WITH -u "syoung/token:4416b765217a3c3de1ed99938ffe25e0" 


GET https://github.com/login/oauth/authorize?\
client_id=96580e0b6f984bb8b64d&\
redirect_uri=

EXAMPLE:

curl -u "syoung/token:4416b765217a3c3de1ed99938ffe25e0" https://api.github.com/login/oauth/authorize?client_id=96580e0b6f984bb8b64d -H "Origin: http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi"

    {
      "message": "Bad credentials"
    }


NOTES
=====
 
The first thing to know is that your API Token (found in https://github.com/settings/admin) is not the same token used by OAuth. They are different tokens and you will need to generate an OAuth token to be authorized.

Follow the API's instructions at http://developer.github.com/v3/oauth/ under the sections "Non-Web Application Flow" and "Create a new authorization" to become authorized.

Note: Use Basic Auth once to create an OAuth2 token http://developer.github.com/v3/oauth/#oauth-authorizations-api

curl https://api.github.com/authorizations \
--user "caspyin" \
--data '{"scopes":["gist"],"note":"Demo"}'


This will prompt you for your GitHub password and return your OAuth token in the response. It will also create a new Authorized application in your account settings https://github.com/settings/applications

Now that you have the OAuth token there are two ways to use the token to make requests that require authentication (replace "OAUTH-TOKEN" with your actual token)

curl https://api.github.com/gists/starred?access_token=OAUTH-TOKEN
curl -H "Authorization: token OAUTH-TOKEN" https://api.github.com/gists/starred
List the authorizations you already have

curl --user "caspyin" https://api.github.com/authorizations




</entry>
<entry [Tue 2012:06:12 13:24:03 EST] GITHUB OAUTH WEB APPLICATION FLOW>

http://develop.github.com/p/oauth.html

Web Application Flow

This is a description of the OAuth flow from 3rd party web sites.

1. Redirect users to a this link to request GitHub access.

GET https://github.com/login/oauth/authorize?
   client_id=...&
   redirect_uri=http://www.example.com/oauth_redirect


2. If the user accepts your request, GitHub redirects back to your site with a temporary code in a code parameter. Exchange this for an access token:

 POST https://github.com/login/oauth/access_token?
   client_id=...&
   redirect_uri=http://www.example.com/oauth_redirect&
   client_secret=...&
   code=...

 RESPONSE:
 access_token=...

3. You have the access token, so now you can make requests on the user's behalf:

 GET https://github.com/api/v2/json/user/show?
   access_token=...
   

</entry>
<entry [Tue 2012:06:12 13:24:04 EST] LIST TAGS WITH login AND password>

PUBLIC REPO:

curl --user "syoung" https://api.github.com/repos/syoung/biorepository/tags
<!--Enter host password for user 'syoung':
[
  {
    "commit": {
      "url": "https://api.github.com/repos/syoung/biorepository/commits/601143ff5739458c337c3a698b9f49e44515fae8",
      "sha": "601143ff5739458c337c3a698b9f49e44515fae8"
    },
    "name": "0.7.6+build1",
    "zipball_url": "https://github.com/syoung/biorepository/zipball/0.7.6+build1",
    "tarball_url": "https://github.com/syoung/biorepository/tarball/0.7.6+build1"
  },
  {
    "commit": {
      "url": "https://api.github.com/repos/syoung/biorepository/commits/2f886d8f3de6af0cf945b2c842035d2a24296fe0",
      "sha": "2f886d8f3de6af0cf945b2c842035d2a24296fe0"
    },
    "name": "0.6.0",
    "zipball_url": "https://github.com/syoung/biorepository/zipball/0.6.0",
    "tarball_url": "https://github.com/syoung/biorepository/tarball/0.6.0"
  }
]

-->


PRIVATE REPO:

curl  https://api.github.com/repos/syoung/biorepodev/tags
{
  "message": "Not Found"
}



curl --user "syoung"  https://api.github.com/repos/syoung/biorepodev/tags
Enter host password for user 'syoung':
[

]


</entry>
<entry [Tue 2012:06:12 13:24:03 EST] LIST REPO INFO WITH login AND password>

FORMAT:
curl --user "username" https://api.github.com/repos/:user/:repo

PUBLIC REPO:

curl --user "syoung" https://api.github.com/repos/syoung/biorepository
<!-- Enter host password for user 'syoung':
{
  "git_url": "git://github.com/syoung/biorepository.git",
  "has_downloads": true,
  "watchers": 1,
  "clone_url": "https://github.com/syoung/biorepository.git",
  "language": "Perl",
  "description": "A public repository of life sciences software and data sources.",
  "ssh_url": "git@github.com:syoung/biorepository.git",
  "created_at": "2012-01-10T08:47:48Z",
  "full_name": "syoung/biorepository",
  "permissions": {
    "pull": true,
    "push": true,
    "admin": true
  },
  "mirror_url": null,
  "has_wiki": true,
  "has_issues": true,
  "fork": false,
  "forks": 1,
  "updated_at": "2012-06-12T01:09:33Z",
  "url": "https://api.github.com/repos/syoung/biorepository",
  "size": 448,
  "homepage": "www.aguadev.org",
  "private": false,
  "open_issues": 0,
  "svn_url": "https://github.com/syoung/biorepository",
  "html_url": "https://github.com/syoung/biorepository",
  "owner": {
    "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
    "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
    "login": "syoung",
    "url": "https://api.github.com/users/syoung",
    "id": 278943
  },
  "name": "biorepository",
  "pushed_at": "2012-06-12T01:09:33Z",
  "id": 3143880
}

-->
    

</entry>
<entry [Tue 2012:06:12 13:13:22 EST] GITHUB OAUTH AUTHENTICATION>

http://developer.github.com/v3/

There are two ways to authenticate through GitHub API v3:

Basic Authentication:

$ curl -u "username:PASSWORD" https://api.github.com
OAuth2 Token (sent in a header):

$ curl -H "Authorization: token OAUTH-TOKEN" https://api.github.com
OAuth2 Token (sent as a parameter):

$ curl https://api.github.com?access_token=OAUTH-TOKEN


</entry>
<entry [Tue 2012:06:12 13:13:22 EST] TESTED -h "Origin: ..." CURL PARAMETER>

FORMAT:

curl  https://api.github.com -H "Origin: http://calendaraboutnothing.com"

EXAMPLE

curl  https://api.github.com -H "Origin: http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi"

    NO /tmp FILE PRINTED...


</entry>
<entry [Tue 2012:06:12 12:49:27 EST] CREATED OAUTH callback.cgi>

CALLBACK URL:

http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi

CALLBACK SCRIPT:
    
<!--    

#!/usr/bin/perl -w

use strict;

use CGI;
my $cgi = CGI->new();

print $cgi->header();
print $cgi->start_html();

print "<pre>";

my $oldout;
open($oldout, ">&STDOUT") or die "Can't set stdout\n";
my $olderr;
open($olderr, ">&STDERR") or die "Can't set stderr\n";

my $logfile = "/tmp/" . `date`;
$logfile =~ s/\s+$//;
$logfile =~ s/[\s:]+/-/g;
print "logfile: $logfile\n";
open (STDOUT, ">$logfile") or die "Can't redirect STDOUT to logfile: $logfile\n";

print "date:\n";
print `date`;

foreach my $key (keys %ENV) {
    print "$key\t$ENV{$key}\n";
}

open STDERR, ">&", $olderr;
open STDOUT, ">&", $oldout;

print `cat $logfile`;

print $cgi->end_html();

-->    

</entry>
<entry [Tue 2012:06:12 12:24:44 EST] GITHUB v3 API - TAGS>

curl --user "syoung" https://api.github.com/authorizations

curl -H "Authorization: token OAUTH-TOKEN" https://api.github.com
    
</entry>
<entry [Tue 2012:06:12 12:21:11 EST] GITHUB v2 API HAS BEEN DISABLED>

PROBLEM:

CREATE CALL FAILS

curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' -F 'name=newrepo' http://github.com/api/v2/json/repos/create

    400 ERROR PAGE

AND OTHER PREVIOUSLY WORKING CALLS ALSO FAIL


DIAGNOSIS:

v2 API IS DISABLED

  
</entry>
<entry [Mon 2012:06:11 21:29:39 EST] RECONFIRM GITHUB v2 API WORKS>


CREATE
======
curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' -F 'name=newrepo' http://github.com/api/v2/json/repos/create
    
    {"repository":{"watchers":1,"has_downloads":true,"created_at":"2012-06-11T15:40:57-07:00","fork":false,"has_issues":true,"has_wiki":true,"url":"https://github.com/syoung/newrepo","forks":1,"size":0,"private":false,"name":"newrepo","owner":"syoung","open_issues":0,"pushed_at":"2012-06-11T15:40:57-07:00"}}

    
TAGS
====
curl http://github.com/api/v2/json/repos/show/syoung/newrepo/tags
    {"tags":{}}

curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' http://github.com/api/v2/json/repos/show/syoung/biorepodev/tags
    {"tags":{}}


SET PRIVATE
===========

curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' https://github.com/api/v2/json/repos/set/private/syoung/newrepo


network STATUS
==============
curl http://github.com/api/v2/json/repos/show/syoung/newrepo/network
    {"network":[{"watchers":1,"has_downloads":true,"created_at":"2012-06-11T15:40:57-07:00","fork":false,"has_issues":true,"has_wiki":true,"url":"https://github.com/syoung/newrepo","forks":1,"size":0,"private":false,"name":"newrepo","owner":"syoung","open_issues":0,"pushed_at":"2012-06-11T15:40:57-07:00"}]}
    

curl http://github.com/api/v2/json/repos/show/syoung/aguadev/network
    NOT FOUND
curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' http://github.com/api/v2/json/repos/show/syoung/aguadev/network
{"network":[{"url":"https://github.com/syoung/aguadev","has_issues":true,"has_wiki":true,"forks":0,"language":"JavaScript","created_at":"2010-05-17T00:14:15-07:00","description":"Thank you for visiting the Github site of Agua, the NextGen bioinformatics workflow tool and genomic viewer. You'll find source code and development information here. To download the source code, click the 'Downloads' button on the right or download using git with the 'Git Read-Only' URL below. For information on how to install or use Agua, please click the following link:","fork":false,"open_issues":14,"pushed_at":"2012-06-08T00:42:51-07:00","size":730676,"private":true,"name":"aguadev","owner":"syoung","homepage":"http://www.aguadev.org","watchers":1,"has_downloads":true}]}


curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' http://github.com/api/v2/json/repos/show/syoung/biorepodev/network
    
    {"network":[{"watchers":1,"has_downloads":true,"description":"Development arm of biorepository.","created_at":"2012-02-24T08:57:04-08:00","fork":false,"has_issues":true,"has_wiki":true,"url":"https://github.com/syoung/biorepodev","forks":0,"homepage":"www.aguadev.rog","size":0,"private":true,"name":"biorepodev","owner":"syoung","open_issues":0}]}
    
SET PUBLIC REPO
===============

curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' https://github.com/api/v2/json/repos/set/public/syoung/newrepo



DELETE
======
curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' https://github.com/api/v2/json/repos/delete/syoung/newrepo  

curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' https://github.com/api/v2/json/repos/delete/syoung/newrepo -F 'delete_token=dckdbuhehp'  


</entry>
<entry [Mon 2012:06:11 21:29:38 EST] USER INFO  AND SEARCH REPOS, EMAILS USING OAUTH ACCESS TOKEN>

https://gist.github.com/fdebc7c08101c3246ee2

GET USER INFO USING OAUTH TOKEN

curl  https://api.github.com/user?access_token=21a393b182705f3d5faea967496b465cbacbff8b

{
  "html_url": "https://github.com/syoung",
  "type": "User",
  "company": null,
  "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
  "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
  "login": "syoung",
  "email": "stuartpyoung@gmail.com",
  "hireable": false,
  "created_at": "2010-05-17T07:11:56Z",
  "location": null,
  "bio": null,
  "public_gists": 1,
  "following": 1,
  "url": "https://api.github.com/users/syoung",
  "public_repos": 1,
  "followers": 1,
  "name": "Stuart Young",
  "blog": "www.stuartpyoung.com",
  "id": 278943
}




SEARCH ISSUES IN A REPO

GET https://api.github.com/legacy/issues/search/:owner/:repository/:state/:keyword

Sample:
curl https://api.github.com/legacy/issues/search/technoweenie/faraday/open/xml

curl https://api.github.com/legacy/issues/search/syoung/biorepository/open/json
    {
      "issues": [
    
      ]
    }

SEARCH REPOS BY KEYWORD

GET https://api.github.com/legacy/repos/search/:keyword

Sample:
curl https://api.github.com/legacy/repos/search/zeromq
curl https://api.github.com/legacy/user/search/techno



SEARCH EMAILS

GET https://api.github.com/legacy/user/email/:email

This API call is added for compatibility reasons only. There's no guarantee that full email searches will always be available.



NOTES
------



GET v2 TOKEN

GET https://api.github.com/legacy/token

This requires you to login with your login and password. OAuth is not supported. API tokens will not work on API v3.

curl -u syoung https://api.github.com/legacy/token

Enter host password for user 'syoung':
{
  "token": "4416b765217a3c3de1ed99938ffe25e0"
}


TAGS v2

curl \
-F "login=syoung" \
-F "token=4416b765217a3c3de1ed99938ffe25e0 " \
https://github.com/api/v2/json/repos/show/syoung/biorepodev/tags

    {"tags":{}}


TAGS LEGACY - NOT SUPPORTED
    
curl \
-F "login=syoung" \
-F "token=4416b765217a3c3de1ed99938ffe25e0 " \
https://api.github.com/legacy/json/repos/show/syoung/biorepodev/tags
{
  "message": "Not Found"
}



</entry>
