agua.repo.archive.2

<entry [Sun 2011:11:06 16:01:12 EST] INSTALLED Net::GitHub ON TOSHIBA>

NB: *** DID NOT USE Net::GitHub OR App::GitHub BECAUSE NOT FINE-GRAINED ENOUGH ***


http://search.cpan.org/~fayland/App-GitHub-0.11/lib/App/GitHub.pm

1. INSTALL libssl-dev FOR Crypt::SSLeay

TO AVOID THIS ERROR IN /home/syoung/.cpanm/build.log:

    It looks like this host is running Debian. Crypt::SSLeay needs
    to be compiled with C headers provided by the libssl-dev package.
    Please install that package before trying to build this module.
    (You can always deinstall the package afterwards, once
    Crypt::SSLeay has been built).

sudo apt-get install libssl-dev
sudo cpanm install Crypt::SSLeay
    OK

2. INSTALL Net::GitHub
    OK


    
</entry>
<entry [Sat 2011:11:05 23:00:55 EST] ADDED TAGS TO biorepository>


ADD TAG TO BIOREPOSITORY:

cd /agua/0.6/repos/biorepository/syoung/agua
git tag -a "1.0"
git commit -a

git log --oneline --decorate --graph

    * e70d7ee (HEAD, origin/master, master) Added 1.0 tag. Completed agua.app. Onworking agua.ops and agua.pm.
    * a61863b (tag: 0.1) Added syoung directory with test (fastqc) and develop (agua) filestubs.
    * d8ddc85 Update README
    * 8613f34 first commit



ADD A SECOND TAG:
cd /agua/0.6/repos/biorepository/syoung/
git tag -a "2.0"


GET TAGS FROM LOG:

git log --oneline --decorate --graph

    * b2501a3 (HEAD, origin/master, master) Added tag 2.0.
    * e70d7ee (tag: 2.0) Added 1.0 tag. Completed agua.app. Onworking agua.ops and agua.pm.
    * a61863b (tag: 0.1) Added syoung directory with test (fastqc) and develop (agua) filestubs.
    * d8ddc85 Update README
    * 8613f34 first commit



SHOW TAGS LOCALLY:

git tag
    0.1
    2.0



SHOW TAG INFO:

git show 0.1
    OK


ADD TAGS LATER:
tagging later

You can also tag commits after you’ve moved past them. If my commit history looks like this

    git log --pretty=oneline
    ...
    9fceb02d0ae598e95dc970b74767f19372d61af8 updated rakefile
    964f16d36dfccde844893cac5b347e7b3d44abbc commit the todo
    8a5cbc430f1a9c3d00faaeffd07798508422908a updated readme


To tag the ‘updated rakefile’ commit, you can just specify the commit checksum (or part of it) at the end of the command.

git tag -a v1.2 9fceb02
    OK


TRANSFER TAGS TO GITHUB:

By default, the ‘git push’ command will not transfer tags to remote servers. To do so, you have to explicitly add a –tags to the ‘git push’ command.

git push --tags

    Counting objects: 2, done.
    Compressing objects: 100% (2/2), done.
    Writing objects: 100% (2/2), 306 bytes, done.
    Total 2 (delta 0), reused 0 (delta 0)
    To git@github.com:syoung/biorepository.git
     * [new tag]         0.1 -> 0.1
     * [new tag]         2.0 -> 2.0



GET TAGS:

curl http://github.com/api/v2/json/repos/show/syoung/biorepository/tags | pretty.pl

{
   "tags" : {
      "2.0" : "e70d7ee04a6ec65a4f9c0239ec0587dc51705329",
      "0.1" : "a61863bc3c857ccc7bbfd2c0e4413496c64de98b"
   }
}



LIST DOWNLOADS OF UPLOADED FILES:

curl http://github.com/api/v2/json/repos/show/syoung/biorepository/downloads



DOWNLOAD TAG:

curl https://github.com/syoung/biorepository/tarball/0.1


    
</entry>
<entry [Thu 2011:11:03 15:52:00 EST] CREATED biorepository ON GITHUB>
    
    
Global setup:
 Set up git

  git config --global user.name "Stuart Young"
  git config --global user.email stuartpyoung@gmail.com

Next steps:

  mkdir biorepository
  cd biorepository
  git init
  touch README
  git add README
  git commit -m 'first commit'
  git remote add origin git@github.com:syoung/biorepository.git
  git push -u origin master
      
Existing Git Repo?
  cd existing_git_repo
  git remote add origin git@github.com:syoung/biorepository.git
  git push -u origin master
      
Importing a Subversion Repo?
  Click here
      
When you're done:
  Continue



## Search for repos
curl http://github.com/api/v2/json/repos/search/biorepository | pretty.pl 
{
   "repositories" : [
      {
         "size" : 140,
         "watchers" : 1,
         "created_at" : "2011/11/03 11:30:34 -0700",
         "url" : "https://github.com/syoung/biorepository",
         "followers" : 1,
         "open_issues" : 0,
         "has_downloads" : "true",
         "owner" : "syoung",
         "has_issues" : "true",
         "language" : "",
         "pushed" : "2011/11/03 11:33:56 -0700",
         "name" : "biorepository",
         "private" : "false",
         "has_wiki" : "true",
         "score" : 7.578462,
         "description" : "",
         "pushed_at" : "2011/11/03 11:33:56 -0700",
         "username" : "syoung",
         "forks" : 1,
         "homepage" : "",
         "created" : "2011/11/03 11:30:34 -0700",
         "fork" : "false",
         "type" : "repo"
      }
   ]
}


GET THE README FILE:


1. FIND IT ON THE TREE

curl https://api.github.com/repos/syoung/biorepository/git/trees/master
{
  "tree": [
    {
      "type": "blob",
      "url": "https://api.github.com/repos/syoung/biorepository/git/blobs/438b1d8401f9eefcd1d8a732aa8a3a08b6593e54",
      "size": 43,
      "sha": "438b1d8401f9eefcd1d8a732aa8a3a08b6593e54",
      "path": "README",
      "mode": "100644"
    }
  ],
  "url": "https://api.github.com/repos/syoung/biorepository/git/trees/master",
  "sha": "master"
}



2. GET IT WITH URL AND SPECIAL MIME TYPE

curl https://api.github.com/repos/syoung/biorepository/git/blobs/438b1d8401f9eefcd1d8a732aa8a3a08b6593e54 -H "Accept: application/vnd.github-blob.raw"

test entry for syoung biorepository README


NB: JUST DOING IT WITH THE STRAIGHT URL RETURNS A 64BASE ENCODED STRING FOR THE FILE CONTENTS:

curl https://api.github.com/repos/syoung/biorepository/git/blobs/438b1d8401f9eefcd1d8a732aa8a3a08b6593e54
{
  "content": "dGVzdCBlbnRyeSBmb3Igc3lvdW5nIGJpb3JlcG9zaXRvcnkgUkVBRE1FCg==\n",
  "url": "https://api.github.com/repos/syoung/biorepository/git/blobs/438b1d8401f9eefcd1d8a732aa8a3a08b6593e54",
  "size": 43,
  "sha": "438b1d8401f9eefcd1d8a732aa8a3a08b6593e54",
  "encoding": "base64"
}



FORK biorepository:

curl -F 'login=stuartpyoung' -F 'token=a359152dd81fbd744a86128c0be5a764' https://github.com/api/v2/json/repos/fork/syoung/biorepository

{
   "repository" : {
      "size" : 140,
      "watchers" : 1,
      "created_at" : "2011/11/03 12:53:36 -0700",
      "url" : "https://github.com/stuartpyoung/biorepository",
      "open_issues" : 0,
      "owner" : "stuartpyoung",
      "has_downloads" : "true",
      "has_issues" : "false",
      "private" : "false",
      "name" : "biorepository",
      "has_wiki" : "true",
      "description" : "",
      "pushed_at" : "2011/11/03 11:33:56 -0700",
      "homepage" : "",
      "forks" : 0,
      "fork" : "true"
   }
}


NB: CAN'T FORK OWN REPOSITORY

curl -F 'login=syoung' -F 'token=4416b765217a3c3de1ed99938ffe25e0' https://github.com/api/v2/json/repos/fork/syoung/biorepository
{"error":"invalid repository to fork"}


NOW SEARCH FOR biorepository REPOSITORIES:

curl http://github.com/api/v2/json/repos/search/biorepository | pretty.pl



GET ALL FORKERS (INCLUDING OWNER):

curl http://github.com/api/v2/json/repos/show/syoung/biorepository/network | pretty.pl 
{
   "network" : [
      {
         "owner" : "syoung",
         "has_downloads" : "true",
         "has_issues" : "true",
         "name" : "biorepository",
         "private" : "false",
         "has_wiki" : "true",
         "description" : "",
         "pushed_at" : "2011/11/03 11:33:56 -0700",
         "size" : 140,
         "forks" : 2,
         "homepage" : "",
         "watchers" : 2,
         "created_at" : "2011/11/03 11:30:34 -0700",
         "fork" : "false",
         "url" : "https://github.com/syoung/biorepository",
         "open_issues" : 0
      },
      {
         "owner" : "stuartpyoung",
         "has_downloads" : "true",
         "has_issues" : "false",
         "name" : "biorepository",
         "private" : "false",
         "has_wiki" : "true",
         "description" : "",
         "pushed_at" : "2011/11/03 11:33:56 -0700",
         "size" : 140,
         "forks" : 0,
         "homepage" : "",
         "watchers" : 1,
         "created_at" : "2011/11/03 12:53:36 -0700",
         "fork" : "true",
         "url" : "https://github.com/stuartpyoung/biorepository",
         "open_issues" : 0
      }
   ]
}


GET README CONTENT OF FORKS:

1. FIND README ON THE TREE

FIRST EDIT README, ADD THIS:

    TEST of README for stuartpyoung

NEXT GET SHA FOR README FILE:

#curl https://api.github.com/repos/USERNAME/biorepository/git/trees/master

curl https://api.github.com/repos/stuartpyoung/biorepository/git/trees/master
{
  "tree": [
    {
      "type": "blob",
      "url": "https://api.github.com/repos/stuartpyoung/biorepository/git/blobs/804ef405718c9b301863905de97e20ead477550d",
      "size": 31,
      "sha": "804ef405718c9b301863905de97e20ead477550d",
      "path": "README",
      "mode": "100644"
    }
  ],
  "url": "https://api.github.com/repos/stuartpyoung/biorepository/git/trees/master",
  "sha": "master"
}

2. GET README CONTENTS WITH URL AND SPECIAL MIME TYPE

curl https://api.github.com/repos/stuartpyoung/biorepository/git/blobs/804ef405718c9b301863905de97e20ead477550d -H "Accept: application/vnd.github-blob.raw"
TEST of README for stuartpyoung


GET INFO ON USER syoung:

## Search for users
curl http://github.com/api/v2/json/user/search/syoung | pretty.pl 
{
   "users" : [
      {
         "gravatar_id" : "61fd5d40af511575f9c620639e862a5f",
         "created_at" : "2010-05-17T07:11:56Z",
         "record" : null,
         "id" : "user-278943",
         "followers" : 1,
         "location" : "",
         "language" : "Perl",
         "followers_count" : 1,
         "pushed" : "2011-11-03T17:15:15.703Z",
         "name" : "Stuart Young",
         "score" : 5.068248,
         "public_repo_count" : 1,
         "username" : "syoung",
         "login" : "syoung",
         "created" : "2010-05-17T07:11:56Z",
         "repos" : 1,
         "fullname" : "Stuart Young",
         "type" : "user"
      }
   ]
}




</entry>
<entry [Thu 2011:11:03 15:56:56 EST] GITHUB BRANCHES>

http://help.github.com/fork-a-repo/

Branches are pretty easy to work with and will save you a lot of headaches, especially when working with multiple people. To create a branch and begin working in it, use the following script:

$ git branch mybranchCreates a new branch called "mybranch"
$ git checkout mybranchMakes "mybranch" the active branch
Alternatively, you can use the shortcut:

$ git checkout -b mybranchCreates a new branch called "mybranch" and makes it the active branch
To switch between branches, use checkout.

$ git checkout masterMakes "master" the active branch
$ git checkout mybranchMakes "mybranch" the active branch
Once you’re finished working on your branch and are ready to combine it back into the master branch, use merge.

$ git checkout masterMakes "master" the active branch
$ git merge mybranchMerges the commits from "mybranch" into "master"
$ git branch -d mybranch
    
</entry>
<entry [Thu 2011:11:03 15:43:25 EST] HOW TO FORK ON github>
    
http://help.github.com/fork-a-repo/

1. Fork the “Spoon-Knife ” repo

To fork this project, click the “Fork” button.


2. Set Up Your Local Repo

You’ve successfully forked the Spoon-Knife repo, but so far it only exists on GitHub. To be able to work on the project, you will need to clone it to your local machine.

git clone git@github.com:username/Spoon-Knife.git


3. Configure remotes

When a repo is cloned, it has a default remote called origin that points to your fork on GitHub, not the original repo it was forked from. To keep track of the original repo, you need to add another remote named upstream:


More about remotes
==================

Change the active directory in the prompt to the newly cloned "Spoon-Knife" directory
cd Spoon-Knife

Assign the original repo to a remote called "upstream"
git remote add upstream git://github.com/octocat/Spoon-Knife.git

Pull in changes not present in your local repository, without modifying your files
git fetch upstream


You’ve successfully forked a repo, but get a load of these other cool things you can do:

Push commits
============

Once you’ve made some commits to a forked repo and want to push it to your forked project, you do it the same way you would with a regular repo:


Push commits to your remote repo stored on GitHub
git push origin master

Pull in upstream changes
If the original repo you forked your project from gets updated, you can add those updates to your fork by running the following code:

Fetch any new changes from the original repo
git fetch upstream

Merge any changes fetched into your working files
git merge upstream/master



What is the difference between fetch and pull?
==============================================

There are two ways to get commits from a remote repo or branch: fetch and pull. While they might seem similar at first, there are distinct differences you should consider.

Pull

Pull commits from 'upstream' and adds them to the local repo
git pull upstream


When you use pull, Git tries to automatically do your work for you. It is context sensitive, so Git will merge any pulled commits into the branch you are currently working in. One thing to keep in mind is that pull automatically merges the commits without letting you review them first. If you don’t closely manage your branches you may run into frequent conflicts.

Fetch/Merge

Fetch any new commits from the original repo
git fetch upstream

Merge any commits fetched into your working files
git merge upstream/master

When you fetch, Git gathers any commits from the target branch that do not exist in your current branch and stores them in your local repo. However, it does not merge them with your current branch. This is particularly useful if you need to keep your repo up to date but are working on something that might break if you update your files. To integrate the commits into your master branch, you use merge. This combines the specified branches and prompts you if there are any conflicts.


Working with branches
=====================

Branching allows you to build new features or test out ideas without putting your main project at risk. A Git branch is a small file that references the commit it was spawned from. This makes Git branches very small and easy to work with.

How do I use branches?

Pull requests
If you are hoping to contribute back to the original fork, you can send the original author a pull request.

Unwatch the main repo
When you fork a particularly popular repo, you may find yourself with a lot of unwanted updates about it. To unsubscribe from updates to the main repo, click the “Unwatch” button on the main repo.




    
</entry>
<entry [Fri 2011:10:28 23:51:12 EST] CHAPMAN CLOUD BIOINFORMATICS GIST>

https://gist.github.com/382835


gist: 382835     
Public Clone URL:	git://gist.github.com/382835.git
Embed All Files:	show embed
aws_cloud_brainstorming # embed raw

Developing an open source community for cloud bioinformatics

- Main points
  = Developing open source code in biology especially difficult.
  = Most productive target for work is developer resources.
  = Community emerging to develop and maintain images.

- Open source background:
  = OpenBio, Bio* projects, Biopython
  = Grad school -- developed distributed system with BSP. Never reused: why
    later

- Work background:
  = Automated biological pipelines at startup.
  = Democratization of analysis in research/hospital setting.

- Filters in biology make finding open source developers hard 
  = Filter: belief that someone else might be working on problem.
  = Filter: interest in sharing and developing open source code.
  = Filter: working in same biological area.
  = Filter: your software intuitive enough to get started with
  = Filter: have technical capabilities.
  = How many people are left at the end? Not many.

- Academic rewards system does not encourage code reuse
  = Most successful software from research institutes
  = Community work not easy to recognize through publication system.

- Successful examples of community based bioinformatics work
  = BioPerl
  = Bioconductor
  = Aimed at developers, instead of end users.

- Other attributes of success
  = Easy to get running: Galaxy versus Gbrowse
  = Building blocks for specific, custom biological work: can publish

- Cloud lowers barriers (maybe too obvious; for cutting/quicky)
  = No installation; ready to try AMI
  = Common platform to scale with

- Developing community to provide bioinformatics images
  = Integrate existing work: 
    ^ biolinux
    ^ bioperl-max
    ^ MachetEC2
    ^ Debian Med
  = Software: http://github.com/chapmanb/bcbb/tree/master/ec2/biolinux/

- Provide ready to use biological data along with software
  = Data: http://github.com/chapmanb/bcbb/blob/master/galaxy/galaxy_fabfile.py

- Organize interested developers
  = CodeFest: http://www.open-bio.org/wiki/Codefest_2010

- Community goals
  = Easy to add new packages: plain text config file based
  = Inclusive but configurable. Aim to cover a wide scope of areas but make
    it easy to install only a few.
  = Aim at developers initially; bootstrap more contributors

  
</entry>
<entry [Fri 2011:10:28 23:33:27 EST] EXAMPLE OF PRECURSOR TO INSTALL SCRIPTS>

https://gist.github.com/407882
(SEE ALSO https://gist.github.com/798052)

gist: 407882     
Public Clone URL:	git://gist.github.com/407882.git
Embed All Files:	show embed


dnaa.sh # embed raw
sudo apt-get install libtool
git clone git://dnaa.git.sourceforge.net/gitroot/dnaa/dnaa dnaa-git
cd dnaa-git
# bfast required. see above gist
cp -r ../bfast-git ./bfast
# samtools require. see above gist.
cp -r ../samtools-svn/ ./samtools
sh autogen.sh && ./configure && make && sudo make install


fastqc.sh # embed raw
FASTQC_VERSION=0.9.3      
SRCDIR=/usr/local/src/
cd $SRCDIR  && mkdir -p fastqc  && cd fastqc
wget http://www.bioinformatics.bbsrc.ac.uk/projects/fastqc/fastqc_v${FASTQC_VERSION}.zip        
unzip fastqc_v${FASTQC_VERSION}.zip                                             cd FastQC && chmod a+x fastqc

freebayes.sh # embed raw
git clone git://github.com/ekg/freebayes.git freebayes-git
cd freebayes-git
make && sudo make install

gatk.sh # embed raw
svn co https://svn.broadinstitute.org/Sting/trunk gatk-svn
cd gatk-svn
env JAVA_HOME=/usr/lib/jvm/java-6-openjdk/ ant

gmap-gsnap.sh # embed raw
SRCDIR=/usr/local/src/
wget http://research-pub.gene.com/gmap/src/gmap-gsnap-2010-07-20.tar.gz
tar xzvf gmap*
cd gmap*
./configure
make -j4
sudo make install

hdf5.sh # embed raw
PREFIX=$HOME/local/
V=1.8.7
mkdir hdf5 && cd hdf5
wget http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-${V}.tar.gz
tar xzvf hdf5-${V}.tar.gz
cd hdf5-${V}/
./configure --prefix=$PREFIX && make -j6 && make install

# h5py requires: 
# python setup.py build --hdf5=$PREFIX
# python setup.py install

ngs.sh # embed raw
SRCDIR=/usr/local/src/
BOWTIE_VERSION=0.12.7
TOPHAT_VERSION=1.2.0
CUFFLINKS_VERSION=0.9.3
FASTX_VERSION=0.0.13

cd $SRCDIR

# samtools
svn co https://samtools.svn.sourceforge.net/svnroot/samtools/trunk/samtools samtools-svn
cd samtools-svn && make -j2

# install libs for tophat, cufflinks
sudo mkdir -p /usr/local/include/bam
sudo cp libbam.a /usr/local/lib/
sudo cp *.h /usr/local/include/bam
sudo cp samtools /usr/local/bin/


hg clone https://pysam.googlecode.com/hg/ pysam-hg
cd pysam-hg && python setup.py import ../ && sudo python setup.py install

cd $SRCDIR
# bowtie
mkdir -p bowtie && cd bowtie
wget http://downloads.sourceforge.net/project/bowtie-bio/bowtie/${BOWTIE_VERSION}/bowtie-${BOWTIE_VERSION}-src.zip
unzip bowtie-${BOWTIE_VERSION}-src.zip && cd bowtie-${BOWTIE_VERSION} && make

cd $SRCDIR
# tophat
mkdir -p tophat 
cd tophat
wget http://tophat.cbcb.umd.edu/downloads/tophat-${TOPHAT_VERSION}.tar.gz
tar xzvf tophat-${TOPHAT_VERSION}.tar.gz
cd tophat-${TOPHAT_VERSION}  && ./configure && make && sudo make install

# cufflinks ( requires libboost-dev, libboost-thread-dev libbam-dev )
# may have to add explicit char * cast at: src/hits.cpp:394)
# and see this: http://stackoverflow.com/questions/1253245/installing-libboost-1-38-on-ubuntu-8-10/1254884#1254884 on installing boost from src (cufflinks requires boost > 1.38)
cd $SRCDIR
mkdir -p cufflinks
cd cufflinks
wget http://cufflinks.cbcb.umd.edu/downloads/cufflinks-${CUFFLINKS_VERSION}.tar.gz
tar xzvf cufflinks-${CUFFLINKS_VERSION}.tar.gz
cd cufflinks-${CUFFLINKS_VERSION} && ./configure && make && sudo make install


cd $SRCDIR
mkdir -p supersplat
cd supersplat
wget http://supersplat.cgrb.oregonstate.edu/files/supersplat_source.tgz
tar xzvf supersplat_source.tgz
make


cd $SRCDIR
mkdir -p fastx
cd fastx
wget http://hannonlab.cshl.edu/fastx_toolkit/libgtextutils-0.6.tar.bz2
bunzip2 libgtextutils-0.6.tar.bz2 && tar xvf libgtextutils-0.6.tar
cd libgtextutils-0.6 && ./configure && make && sudo make install && sudo ldconfig
cd ../


sudo apt-get install pkg-config
wget http://hannonlab.cshl.edu/fastx_toolkit/fastx_toolkit-${FASTX_VERSION}.tar.bz2
bunzip2 fastx_toolkit-${FASTX_VERSION}.tar.bz2
tar xvf fastx_toolkit-${FASTX_VERSION}.tar
cd fastx_toolkit-${FASTX_VERSION} && ./configure && make && sudo make install

cd $SRCDIR
# BED Tools
git clone git://github.com/arq5x/bedtools.git bedtools-git
cd bedtools-git && make

# requires swig and cython
#cd $SRCDIR
#svn co https://htseq.svn.sourceforge.net/svnroot/htseq/trunk htseq-svn
#cd htseq-svn
#sudo python setup.py build install

# bfast aligner
sudo apt-get install libbz2-dev
cd $SRCDIR
# https://gist.github.com/795348
git clone git://bfast.git.sourceforge.net/gitroot/bfast/bfast bfast-git
cd bfast-git && sh autogen.sh && ./configure && make && sudo make install

picard.sh # embed raw
# this is required for command line tools
sudo apt-get install libbcel-java openjdk-6-jdk


svn co https://picard.svn.sourceforge.net/svnroot/picard/trunk picard-svn
cd picard-svn && svn up 
env JAVA_HOME=/usr/lib/jvm/java-6-openjdk/ ant sam-jar
env JAVA_HOME=/usr/lib/jvm/java-6-openjdk/ ant -lib lib/ant package-commands
# docs: http://picard.sourceforge.net/command-line-overview.shtml

smrna.sh # embed raw
git clone git://srma.git.sourceforge.net/gitroot/srma/srma srma-git
cd srma-git/c-code

# it requires samtools in the same dir.
svn co https://samtools.svn.sourceforge.net/svnroot/samtools/trunk/samtools
cd samtools && make; cd ..

sudo apt-get install automake
sh autogen.sh && ./configure && make && sudo make install

</entry>
<entry [Sat 2011:10:29 19:37:45 EST] OPS: OPEN PACKAGE SCHEMA>

OPS is a resource description format for installing software applications and data packages. OPS is implemented as a JSON *.ops file containing the following (all values are strings unless otherwise specified):

git:            clone url of github or private git repository containing *.ops file
name:           name of application or data package
version:        tagged identifier for latest version
build:          tagged identifier for latest build
history:        array of previous tagged version:build combinations
type:           package type - application, data, reference, workflow, etc.
author:         array of author objects
email           author's email address
defaults:       array of default parameter values
keywords:       array of keywords relating to the package
description:    description of the package
website:        URL of website for package
source:         SNAPSHOT, BUCKET, git, svn, ftp, url
type:           EC2, S3, GIT, SVN, FTP, HTTP
opsfile:        location of this *.ops file
parameterfile:  git url of JSON file containing array of parameters for one or more applications
installfile:    git url of fabric/ops deployment file
installtype:    ops, fabric, etc.
licensefile:    repository location of licence file
installparams:  array of installation parameters (name, argument, default, etc.)
publication:    array of paper/abstract/etc. objects
organisation:   array of organisation objects
ISA:            hash of experiment information conforming to ISA standard
acknowledgements: array of organisation objects
citations:      array of paper/abstract/etc. objects
meta:           hash of additional metadata



The 'installfile' entry in the *.ops file, together with the 'installtype' and the 'installparams' hash provide the information necessary to install the application.


EXAMPLE INSTALL FILE:

em /agua/0.6/repos/biorepository/syoung/fastqc.ops

{
    name:           "fastqc",
    version:        "0.9.3",
    build:          "",
    type:           "application",
    source:         "url",
    type:           "http",
    description:    "A quality control tool for high throughput sequence data",
    website :       "http://www.bioinformatics.bbsrc.ac.uk/projects/fastqc",
    opsfile:        "https://api.github.com/repos/syoung/biorepository/syoung/fastqc/fastqc.ops",
    parameterfile:  "https://api.github.com/repos/syoung/biorepository/syoung/fastqc/fastqc.params",
    installfile:    "https://api.github.com/repos/syoung/biorepository/syoung/fastqc/fastqc.pm",
    licensefile:    "https://api.github.com/repos/syoung/biorepository/syoung/fastqc/LICENSE",
    readmefile:     "https://api.github.com/repos/syoung/biorepository/syoung/fastqc/README",
    installparams: [
        {
            name:         "version",
            argument:     "",
            ordinal:      "",
            description;  "software version (can be letters and numbers)",
            default:      "0.9.3"
        },
        {
            name:           "installdir",
            argument:       "",
            ordinal:        "",
            description:    "Full path to install directory (final path: 'installdir/version'",
            default:        "/usr/local/src/fastqc"
        }
    ],
    installtype:    "ops",
    author:         [],
    publication:    [],
    organisation:   [],
    ISA:            {},
    acknowledgements: [],
    citations:      []
}


CREATE OPS FILE:

em /agua/0.6/repos/biorepository/syoung/fastqc.pm

use MooseX::Declare;
class fastq extends Agua::Ops {

sub install {
	my $self		=	shift;
	my $version		=	shift;
	my $installdir	=	shift;
	
	$version = "0.9.3" if not defined $version;
	$installdir = "/usr/local/src/fastqc" if not defined $installdir;

    $self->changeDir($installdir);
	$self->makeDir($version);
	$self->changeDir($version);
	$self->runCommand("wget http://www.bioinformatics.bbsrc.ac.uk/projects/fastqc/fastqc_v$version.zip");
	$self->runCommand("unzip fastqc_v$version.zip");
	$self->changeDir("FastQC");
	$self->runCommand("chmod a+x fastqc");	
}

}


RUN OPS FILE:

mkdir -p /agua/0.6/repos/biorepository/syoung/fastqc
cd /agua/0.6/repos/biorepository/syoung/fastqc

sudo /agua/0.6/bin/apps/logic/ops.pl fastqc install --keyfile /nethome/admin/.starcluster/id_rsa-admin-key --hosts ec2-184-73-22-214.compute-1.amazonaws.com --username root "0.9.3"


NB: REFACTORED Ops.pm TO USE Net::OpenSSH TO GET REMOTE COMMAND EXIT STATUS:
http://search.cpan.org/~salva/Net-OpenSSH-0.52/lib/Net/OpenSSH.pm




NOTES
=====

./fastqc -h

            FastQC - A high throughput sequence QC analysis tool

SYNOPSIS

	fastqc seqfile1 seqfile2 .. seqfileN

    fastqc [-o output dir] [--(no)extract] [-f fastq|bam|sam] 
           [-c contaminant file] seqfile1 .. seqfileN

DESCRIPTION

    FastQC reads a set of sequence files and produces from each one a quality
    control report consisting of a number of different modules, each one of 
    which will help to identify a different potential type of problem in your
    data.
    
    If no files to process are specified on the command line then the program
    will start as an interactive graphical application.  If files are provided
    on the commmand line then the program will run with no user interaction
    required.  In this mode it is suitable for inclusion into a standardised
    analysis pipeline.
    
    The options for the program as as follows:
    
    -h --help       Print this help file and exit
    
    -v --version    Print the version of the program and exit
    
    -o --outdir     Create all output files in the specified output directory.
                    Please note that this directory must exist as the program
                    will not create it.  If this option is not set then the 
                    output file for each sequence file is created in the same
                    directory as the sequence file which was processed.
                   
    --extract       If set then the zipped output file will be uncomressed in
                    the same directory after it has been created.  By default
                    this option will be set if fastqc is run in non-interactive
                    mode.
                   
    --noextract     Do not uncompress the output file after creating it.  You
                    should set this option if you do not wish to uncompress
                    the output when running in non-interactive mode.
                    
    --nogroup       Disable grouping of bases for reads >50bp. All reports will
                    show data for every base in the read.  WARNING: Using this
                    option will cause fastqc to crash and burn if you use it on
                    really long reads, and your plots may end up a ridiculous size.
                    You have been warned!
                    
    -f --format     Bypasses the normal sequence file format detection and
                    forces the program to use the specified format.  Valid
                    formats are bam,sam,bam_mapped,sam_mapped and fastq
                    
    -t --threads    Specifies the number of files which can be processed
                    simultaneously.  Each thread will be allocated 250MB of
                    memory so you shouldn't run more threads than your
                    available memory will cope with, and not more than
                    6 threads on a 32 bit machine
                  
    -c              Specifies a non-default file which contains the list of
    --contaminants  contaminants to screen overrepresented sequences against.
                    The file must contain sets of named contaminants in the
                    form name[tab]sequence.  Lines prefixed with a hash will
                    be ignored.
                    
   -q --quiet       Supress all progress messages on stdout and only report errors.
                    
BUGS

    Any bugs in fastqc should be reported either to simon.andrews@bbsrc.ac.uk
    or in www.bioinformatics.bbsrc.ac.uk/bugzilla/
                   



</entry>
<entry [Sat 2011:10:29 01:32:03 EST] SYNC WITH GITHUB - ALL PROJECTS BELONG TO SINGLE USER ACCOUNT>

HELP PANE:

    - WELCOME TO AGUA


PROJECT PANE:

    - RECENTLY ADDED
    
    - FAVOURITES
    
    - SYNC (GITHUB USERS ONLY)
    
    - EMAIL
    
    - SEARCH
    
        - GITHUB USING GISTS (NB: PROVENANCE VIA GIST/GIT VERSIONING)
        
        - MYEXPERIMENT: INSTALL USING TAVERNA-TO-AGUA
    
        - ALESTIC GITHUB WITH GIST-LIKE SEARCH VIA git grep


INSTALL
    
    - git CLONE OF MULTI-FILE GIST CONTAINING JSON FILES:
    
        - WORKFLOWS, STAGES, APPS AND PARAMETERS
        
            -> LOAD INTO DATABASE
            
        - INPUT/OUTPUT DATA
        
            -> IF SNAPSHOT, S3, ETC. POPULATED, CREATE AND ATTACH VOLUMES

            -> 

        - APPLICATION LOCATION/INSTALLATION
        
            -> LOAD INTO DATABASE
            
            -> IF NOT ALREADY INSTALLED, INSTALL USING Ops.pm
            
                (CURRENTLY apt-get, LATER yum)

    
</entry>
<entry [Sat 2011:10:29 00:11:22 EST] PYTHON FABRIC SIMILAR TO Ops.pm>

http://docs.fabfile.org/en/1.3.1/index.html
    
</entry>
<entry [Fri 2011:10:28 23:04:05 EST] OPEN PROVENANCE MODEL>

The Open Provenance Model is a model of provenance that is designed to meet the following requirements: (1) To allow provenance information to be exchanged between systems, by means of a compatibility layer based on a shared provenance model. (2) To allow developers to build and share tools that operate on such a provenance model. (3) To define provenance in a precise, technology-agnostic manner. (4) To support a digital representation of provenance for any 'thing', whether produced by computer systems or not. (5) To allow multiple levels of description to coexist. (6) To define a core set of rules that identify the valid inferences that can be made on provenance representation.


    
</entry>


