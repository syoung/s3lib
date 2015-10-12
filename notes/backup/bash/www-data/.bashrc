if [ -f /share/apps/modules/global/profile.modules ]
then
	. /share/apps/modules/global/profile.modules
# put your own module loads here
	module load lsf
fi
# .bash_profile
# User specific aliases and functions

#### hot perms
hot() { find ./ -type d -exec chown $1 {} \;; find ./ -type d -exec chmod 0775 {} \;; find ./ -type f -exec chmod 0664 {} \; }


#### TURN ON FILE LISTING COLOURS
export CLICOLOR=1

#### VIEW
removeView() { echo 'echo {"project":"Project1","view":"View2","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeView"} | /var/www/cgi-bin/agua/0.6/view.cgi'; echo '{"project":"Project1","view":"View2","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeView"}' | /var/www/cgi-bin/agua/0.6/view.cgi; }

addView() { echo 'echo {"project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addView"} | /var/www/cgi-bin/agua/0.6/view.cgi'; echo '{"project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addView"}' | /var/www/cgi-bin/agua/0.6/view.cgi; }


#### VIEWFEATURE
# addViewFeature (ntHumChimp)
addViewFeature() { echo 'echo {"sourceproject":"Project1","sourceworkflow":"Workflow1","species":"human","build":"hg19","feature":"ntHumChimp","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"} | /var/www/cgi-bin/agua/0.6/view.cgi;'; echo '{"sourceproject":"Project1","sourceworkflow":"Workflow1","species":"human","build":"hg19","feature":"ntHumChimp","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"}' | /var/www/cgi-bin/agua/0.6/view.cgi; }

# addViewFeature (control1)
addViewFeature2 () { echo 'echo {"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control1","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"} | /var/www/cgi-bin/agua/0.6/view.cgi' ; echo '{"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control1","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"}' | /var/www/cgi-bin/agua/0.6/view.cgi; }

# addViewFeature (control2)
addViewFeature3 () { echo 'echo {"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control2","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"} | /var/www/cgi-bin/agua/0.6/view.cgi' ; echo '{"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control2","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"}' | /var/www/cgi-bin/agua/0.6/view.cgi; }

# removeViewFeature (control2)
removeViewFeature3 () { echo 'echo {"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control2","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeViewFeature"} | /var/www/cgi-bin/agua/0.6/view.cgi' ; echo '{"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control2","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeViewFeature"}' | /var/www/cgi-bin/agua/0.6/view.cgi; }

alias envars='export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36\
251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6;'


#### TEST Agua::Workflow                                                                        
getStatus () { echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getStatus","project":"Project1","workflow":"Workflow1"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getStatus","project":"Project1","workflow":"Workflow1"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }


alias fileSystem='/var/www/cgi-bin/agua/0.6/project.cgi "mode=fileSystem&username=syoung&sessionId=9999999999.9999.999&query=%22Project1%22&dojo.preventCache=1305597004588"'


#### TEST Agua::Common::Cluster                                                                 
addCluster () {  echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

removeCluster() { echo '{"cluster":"picocluster","instancetype":"t1.micro","amiid":"ami-d1c42db8","minnodes":"0","maxnodes":"1","description":"Small test cluster","notes":"Notes","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeCluster"}'; echo '{"cluster":"picocluster","instancetype":"t1.micro","amiid":"ami-d1c42db8","minnodes":"0","maxnodes":"1","description":"Small test cluster","notes":"Notes","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeCluster"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

#### RUN WORKFLOWS - PROJECT1 WORKFLOW1                                                                                                                                                             
alias work='cd /nethome/syoung/agua/Project1/Workflow1'

#### INIT                                                                                                                                                                                           
alias initlog='tail -f -n 30 /var/www/html/agua/0.6/initlog.html'

getData() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getData"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }




#### SUBDUED COLOURS
#export LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'


#### AGUA                                                                                                                                                                                   

changePassword () { echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"saveUser","data":{"username":"syoung","firstname":"s","lastname":"young","email":"stuartpyoung@gmail.com","oldpassword":"stuart","newpassword":"youngstuart"}}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"saveUser","data":{"username":"syoung","firstname":"s","lastname":"young","email":"stuartpyoung@gmail.com","oldpassword":"stuart","newpassword":"youngstuart"}}' | /var/www/cgi-bin/agua/0.6/agua; }

addCluster () {  echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

removeCluster() { echo '{"cluster":"picocluster","instancetype":"t1.micro","amiid":"ami-d1c42db8","minnodes":"0","maxnodes":"1","description":"Small test c\
luster","notes":"Notes","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeCluster"}'; echo '{"cluster":"picocluster","instancetype":"t1.micro","amiid":"ami-d1c42db8","minnodes":"0","maxnodes":"1","description":"Small test cluster","notes":"Notes","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeCluster"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }
        
medium () {  echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow2","cluster":"mediumcluster","mode":"saveClusterWorkflow"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow2","cluster":"mediumcluster","mode":"saveClusterWorkflow"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

small () {  echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"smallcluster","mode":"saveClusterWorkflow"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"smallcluster","mode":"saveClusterWorkflow"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

copy() { echo '{"sourceuser":"syoung","targetuser":"syoung","sourceworkflow":"Workflow1","sourceproject":"Project1","targetworkflow":"'$1'","targetproject":"Project1","copyfiles":0,"username":"syoung","sessionId":"9999999999.9999.999","mode":"copyWorkflow"}'; echo '{"sourceuser":"syoung","targetuser":"syoung","sourceworkflow":"Workflow1","sourceproject":"Project1","targetworkflow":"'$1'","targetproject":"Project1","copyfiles":0,"username":"syoung","sessionId":"9999999999.9999.999","mode":"copyWorkflow"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; } 

submit() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","cluster":"smallcluster","submit":"1","mode":"executeWorkflow","number":"2"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","cluster":"smallcluster","submit":"1","mode":"executeWorkflow","number":"2"}' |/var/www/cgi-bin/agua/0.6/workflow.cgi;}


execute() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"1","submit":"0","cluster":""}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"1","submit":"0","cluster":""}' |/var/www/cgi-bin/agua/0.6/workflow.cgi;}

getStatus() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getStatus"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

getTable() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","database":"aguatest","mode":"getTable","table":"'$1'"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

testData() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","database":"aguatest","mode":"getData"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

getData () { echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getData"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }


#### pegasus
alias peg='ssh syoung@pegasus.ccs.miami.edu'


# GRID ENGINE ENVIRONMENT VARIABLES
export SGE_ROOT=/var/lib/gridengine
export SGE_QMASTER_PORT=701
export SGE_EXECD_PORT=702


#### RUN TOPHAT
alias runtop='/home/syoung/0.6/bin/apps/expression/TOPHAT.pl --cpus 3 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --label yoruba --matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt --outputdir /nethome/syoung/agua/Project1/Workflow1 --queue default --reference /nethome/syoung/agua/Project1/Workflow1/chr22 --species human'

alias runt='/home/syoung/0.6/bin/apps/expression/TOPHAT.pl    arguments: --cpus 3 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --label yoruba --matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt --outputdir /nethome/syoung/agua/Project1/Workflow1 --reference /nethome/syoung/agua/Project1/Workflow1/chr22 --species human 1> /nethome/syoung/agua/Project1/Workflow1/.stdout/TOPHAT.stdout 2> /nethome/syoung/agua/Project1/Workflow1/.stderr/TOPHAT.stderr'


#### RUN WORKFLOW
alias run="echo '{\"username\":\"syoung\",\"sessionId\":\"9999999999.9999.999\",\"project\":\"Project1\",\"workflow\":\"Workflow1\",\"workflownumber\":1,\"mode\":\"executeWorkflow\",\"number\":\"1\",\"queue\":\"default\"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi"
alias status="echo '{\"username\":\"syoung\",\"sessionId\":\"9999999999.9999.999\",\"project\":\"Project1\",\"workflow\":\"Workflow1\",\"mode\":\"getStatus\"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi"

#### SET UID ALIASES
alias usr='cat /etc/passwd | cut -d: -f1'
alias grp='cat /etc/group |cut -d: -f1'
alias set='chmod 6755 ~'
alias unset='chmod 0755 ~'
setu() { echo $1; chown $1:$1 $2; chmod 6755 $2; }
rt() { chown root:root $1; chmod 6755 $1; echo `ls -al $1`; }
alias sy='chown syoung:syoung '
#sy() { echo $1; chown root:root $1; chmod 6755 $1; }

#sy() { echo $1; chown syoung:syoung $1; chmod 6755 $1; }


alias killperl='kill -9 `ps aux | grep perl | cut -c 10,11,12,13,14`'

#### AGUA
export PATH=/nethome/syoung/0.6/lib/external:$PATH

# python 2.7
export PATH=/nethome/syoung/base/apps/python/python/2.7/bin:$PATH

# samtools
alias samtools='/nethome/syoung/base/apps/samtools/0.1.8/samtools'

#### general
alias modver='/nethome/syoung/0.6/bin/apps/utils/modver.pl'

#### WORKFLOW
export PATH=/nethome/syoung/0.6/bin/apps/logic:$PATH

# PEGASUS ALIASES
alias flow='/nethome/syoung/0.6/bin/apps/logic/workflow.pl'
alias runs='cd /nethome/syoung/0.6/bin/workflows/cluster'
alias cumeland='cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative3/chr22'
alias cummaq='cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative3/chr22'
alias cumbow='cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie/cumulative3/chr22'
alias cumbowrf='cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/bowtie-rf/cumulative3/chr22'
alias cumnovo='cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/cumulative3/chr22'
alias 200='cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22'
alias lib2='cd /nethome/bioinfo/apps/agua/0.6/lib'
alias bin2='cd /nethome/bioinfo/apps/agua/0.6/bin'
alias nline='cd /ngs/bioinfo/syoung/base/pipeline'
alias EXIT='exit'
alias CD='cd'
alias PWD='pwd'
alias yum='/nethome/syoung/base/apps/yum/3.2.28/usr/bin/yum'
alias tophat='cd /scratch/syoung/base/pipeline/SRA/NA18507/tophat/t/100M-single'
alias eland='cd /scratch/syoung/base/pipeline/SRA/NA18507/eland/t/100M-single'
alias maq='cd /scratch/syoung/base/pipeline/SRA/NA18507/maq/t/100M-single'
alias novo='cd /scratch/syoung/base/pipeline/SRA/NA18507/novoalign/t/100M-single'
alias sra='cd /scratch/syoung/base/pipeline/SRA/NA18507'
alias m='emacs -nw'
alias t='cd /nethome/bioinfo/apps/agua/0.6/bin/apps/t/Cluster'
#alias eland='cd /scratch/syoung/base/pipeline/SRA/NA18507/eland/eland'
#alias eland='cd /scratch/syoung/base/pipeline/SRA/NA18507/eland/eland1'
#alias maq='cd /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq1'
#alias maq2='cd /scratch/syoung/base/pipeline/SRA/NA18507/maq/maq2'
alias bq='/nethome/syoung/base/bin/utils/bqueueser.pl'
alias b='/nethome/syoung/base/bin/utils/bjobser.pl'
alias bio='cd /nethome/bioinfo'
alias sline='cd /scratch/syoung/base/pipeline'
alias ag='cd /nethome/bioinfo/apps/agua/0.6'
alias bix='cd /scratch/syoung/base/pipeline/bixby/run1/tophat'
alias lem='cd /scratch/syoung/base/pipeline/lemmon'


# ADD bioinfo TOOLS TO PATH
export PATH=/home/bioinfo/apps/ngs/bin:$PATH
export PATH=/home/bioinfo/apps/ngs/bin/utils:$PATH
export PATH=/home/bioinfo/apps/ngs/bin/exome:$PATH
export PATH=/home/bioinfo/apps/ngs/bin/nextgen:$PATH

alias q='qstat'

# DATE
alias DATE='date'

# ADD ALTA-CYCLIC PERL MODS TO PATH
#export PATH=/home/apps/alta-cyclic/0.1.0/perlexternal:$PATH
#export PATH=/home/apps/alta-cyclic/0.1.0/perlmods/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto:$PATH

# ADD blat TO PATH
# export PATH=/home/apps/alta-cyclic/0.1.0/blat/bin/i386:$PATH

# ADD libsvm TO PATH
# export PATH=/home/apps/alta-cyclic/0.1.0/external.programs/libsvm-2.86:$PATH



#export LD_LIBRARY_PATH=/home/apps/alta-cyclic/0.1.0/gsl/lib:$LD_LIBRARY_PATH
#export PERL5LIB=/home/apps/alta-cyclic/0.1.0/perlmods/lib/perl5/site_perl/5.8.8:$PERL5LIB
#export PERL5LIB=/home/apps/alta-cyclic/0.1.0/perlmods/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/:$PERL5LIB


# QT environment variables
#QTDIR=/usr/local/qt
#PATH=$QTDIR/bin:$PATH
#MANPATH=$QTDIR/doc/man:$MANPATH
#LD_LIBRARY_PATH=$QTDIR/lib:/usr/lib:$LD_LIBRARY_PATH
#LD_LIBRARY_PATH_64=$QTDIR/lib:/usr/lib64:$LD_LIBRARY_PATH_64

#export QTDIR PATH MANPATH LD_LIBRARY_PATH

# ADD AMOS TO PATH
# export PATH=/home/syoung/base/apps/amos/bin:$PATH

# ADD nextgen BIN DIRECTORY TO PATH
# export PATH=/home/syoung/base/bin/nextgen:$PATH

# ADD UTILS DIRECTORY TO PATH
export PATH=/nethome/syoung/base/bin/utils:$PATH


# PVM environment variables
#PVM_ROOT=~/base/FUNNYBASE/dev/pvm/pvm3  
# export PVM_ROOT

# FIX DOS LINE ENDINGS
alias fle="perl -pi -e 's/\r//g' "
alias fle2="perl -pi -e 's/\r/\n/g' "

# turn on color file listing
export CLICOLOR=1

# ALIASES

alias penguin='ssh root@10.141.55.128'
alias penguin2='ssh root@10.141.60.249'

alias q='qstat'
alias sqlite='sqlite3'
alias agdb='cd /data/agua/0.6/bin/db; sqlite3 data.dbl'
alias aghome='cd ~/.agua'
alias killjobs='/usr/local/bin/qdel `/usr/local/bin/mshow | grep syoung | cut -c 1,2,3,4,5,6`'

alias clearjobs='/usr/local/bin/qdel `/usr/local/bin/mshow | grep syoung | grep Idle | cut -c 1,2,3,4,5,6`'

alias yor='cd /p/NGS/syoung/base/pipeline/SRA/NA18507'
alias dbg='msub -I -l nodes=1:ppn=8 -q gdebug'
alias com='cd /nethome/syoung/base/bin/comparison'
alias mihg='cd /p/NGS/syoung/base/pipeline'
alias migh='cd /p/NGS/syoung/base/pipeline'
alias jb='cd /var/www/html/jbrowse'
#alias ag='cd /data/agua/0.6'


alias now='date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"'

alias swiss='cd ~/base/bin/swissprot'
alias remotestop='sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -stop'
alias remotestart='sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent'
alias fire='/Applications/Firefox.app/Contents/MacOS/firefox-bin'
alias foxbat='cd ~/base/dev/firefox/foxbat'
alias psg='ps aux | grep'
alias llhg='ls -alh | grep'
alias llg='ls -al | grep'
alias lg='ls | grep'
alias learn='cd ~/base/bin/learning'
alias dtree='cd ~/base/bin/dtree'
alias c4='cd ~/base/dev/annotation/learning/decision.trees/'
alias inpara='cd /Users/young/dev/orthologues/inparanoid'
alias 384='cd /Users/young/bin/384'
alias abi='cd /Users/young/bin/abi'
alias iprtmp='cd /common/iprscan/tmp'
alias xpl='chmod 755 *.pl *.cgi *.t'
alias xupload='cd /var/www/cgi-bin/Xupload2'
alias svg2png='java -jar /Users/young/dev/gui/SVG/svg2png/Batik/batik-1.6/batik-rasterizer.jar -dpi 150 '
alias mountgems='sudo mount_nfs -T -s -i gems.rsmas.miami.edu:/Volumes/gemshd4/common /common'
alias dev='cd ~/base/dev'
alias svg='cd ~/base/dev/gui/SVG'
alias graph='cd ~/base/bin/graph'
alias syn='cd ~/base/bin/synonyms'
alias myper='~/base/bin/utils/mysql.permissions.pl'
alias ann='cd ~/base/bin/annotation'
alias ortho='cd ~/base/bin/orthologues'
alias plater='cd /var/www/html/plater10'
alias platerc='cd /var/www/cgi-bin/plater10'
alias plmods='cd ~/base/dev/plmods'
alias seq='cd /var/www/html/sequencer1'
alias seqc='cd /var/www/cgi-bin/sequencer1'
alias exam='cd ~/base/thesis/written.exam'
alias ext='cd ~/base/bin/external1'
alias down='cd /var/www/html/download'
alias sand='cd ~/base/html/sandbox10'
alias mods='cd ~/base/NOTES/plmods'
alias seek='cd ~/base/cgi-bin/fileseek1'
alias blog='cd ~/base/misc/blog'
alias misc='cd ~/base/misc'
alias mql='cd /usr/local/mysql/data'
alias ipr='cd /Users/young/bin/iprscan'
alias comp='cd /nethome/syoung/base/bin/comparison'
#alias pp='cd /Users/young/bin/pipeline3'
alias inq='cd /Users/young/NOTES/inquiry'
alias synt='cd /Users/young/pipeline/synteny'
alias synbin='cd /Users/young/bin/synteny'
alias fapps='cd /Users/young/apps'
alias plapps='cd ~/base/plapps'
alias ssg='ssh young@genomics.rsmas.miami.edu'
alias ssf='ssh douglascrawford@dlc-mac.rsmas.miami.edu'
# alias tests='cd ~/base/plapps/tests'
alias line='cd ~/base/pipeline'
alias clus='cd ~/base/clustering/CONTIG_LOAD_SCRIPTS'
alias fun='cd ~/base'
alias dat='cd ~/base/databases'
alias not='cd ~/base/notes'
alias bin='cd ~/base/bin'
alias usbin='cd ~/base/bin/us_them/dbEST.gbk'
alias lib='cd ~/base/lib'
# alias sge='cd /Users/young/apps/sge'
# alias gill='cd /var/www/html/pages/gill'
# alias all='cd /var/www/html/pages/all'
# alias eclipse='cd ~/base/apps/eclipse'
alias grid='cd /Users/gridman'
alias sgebin='cd /common/sge/bin/darwin'
# alias sgebin='cd /Users/young/apps/sge/bin/darwin'
# alias 384='cd /Volumes/Backup/young/384'
# alias bin384='cd /Users/young/bin/384'
alias mq='mysql -u root -p'

# keeps pico from line wrapping
alias pico="/usr/bin/pico -w"

# ADD PATH FOR tgicl
# PATH=$PATH:/Users/young/NOTES/tgicl/tgicl_linux/bin

# ADDED PATHS FOR BIOPERL
# paths to some bioinf applications
# PATH=$PATH:/usr/local/biotools/bin
# PATH=$PATH:/Applications/bioinf/phylip/exe
# PATH=$PATH:/Applications/bioinf/t_coffee
# PATH=$PATH:/usr/local/biotools/bin
# export PATH
# export BLASTDIR=/usr/local/biotools/bin
# export BLASTDB=/Users/YOURHOME/data/blast
# export MANPATH=$MANPATH:/usr/local/biotools/man
# export WISECONFIGDIR=/usr/local/biotools/wisecfg/
# export EMBOSS_ACDROOT=/usr/local/biotools/share/EMBOSS/acd

# X11 BINARIES
export PATH=/usr/X11R6/bin:$PATH

# CHECK GRID ENGINE DAEMONS ARE RUNNING
alias sged='ps aux | grep sge'
alias sgex='cd /Users/gridman/scripts'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# REMOTE DESKTOP
alias remotestop='sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -stop'
alias remotestart='sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent'

# BLAST ALIASES
alias blastn="/Users/gridman/apps/blast/blastn";
alias blastp="/Users/gridman/apps/blast/blastp";
alias blastx="/Users/gridman/apps/blast/blastx";
alias xdformat="/Users/gridman/apps/blast/xdformat";

# FUNNYBASE PATH VARIABLES
export PATH=~/base/bin:$PATH

# X-windows
alias xhost='/usr/X11R6/bin/xhost'

# ADD PATH FOR FINK
# test -r /sw/bin/init.sh && . /sw/bin/init.sh
export PATH=/sw/bin:$PATH
test -r /sw/bin/init.sh && . /sw/bin/init.sh

# ADD PATH FOR X11
# export PATH=/usr/X11R6/bin/:$PATH

# SSH
alias local='ssh local@129.171.101.102'
alias close='ssh young@129.171.101.102'
alias ssm='ssh root@24.106.223.61'
alias ssz='ssh root@152.1.89.109'
alias sss='ssh root@152.14.14.33'
alias genomics='ssh gridman@dlc-genomics.rsmas.miami.edu'  # GENOMICS
alias dlcg4='ssh gridman@dlcg4.rsmas.miami.edu'            # DLCG4
alias dlc-mac='ssh gridman@dlc-mac.rsmas.miami.edu'        # MAC NB
alias calendar='ssh gridman@calendar.rsmas.miami.edu'      # CALENDAR
alias bwana='ssh gridman@bwana.rsmas.miami.edu'            # BWANA


# CHANGE DIRECTORY
alias util='cd ~/base/bin/utils'
alias utils='cd ~/base/bin/utils'
alias phy='cd ~/base/bin/phylip'
alias self='cd ~/base/bin/selfblast'
alias 127='cd ~/base/bin/127library2'
alias inter='cd ~/base/bin/iprscan'
alias poly='cd ~/base/apps/polyphred'
alias emacs='emacs -nw'
alias em='emacs -nw'
alias me='emacs -nw'
alias gobash='emacs -nw ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias er='tail -f -n 100 /var/log/apache2/error.log'
alias myer='tail -100 /var/log/mysqld.log'
alias html='cd /var/www/html/agua/0.6'
alias cgi='cd /var/www/cgi-bin/agua/0.6'
alias gbrowse='cd /root/eclipse/Generic-Genome-Browser-1.62'
alias db='cd /var/www/html/gbrowse/databases'
alias ceph='cd ~/base/ceph'
alias dros='cd ~/base/dros'
alias cl='clear; ls; pwd'
alias 3d7='cd /root/plasmodb/P_falciparum_3D7/'
alias mal='cd /var/www/html/gbrowse/databases/Pfal_3D7'
alias app='cd ~/base/apps'
alias conf='cd ~/base/conf'
alias rmv='rm /etc/httpd/conf/gbrowse.conf/.#*'
alias plasmo='cd ~/base/plasmodb/'
alias apps='cd ~/base/apps'
alias 530='cd ~/base/530csc'
alias gviz='cd ~/base/apps/graphviz'
alias tk='cd ~/base/apps/tk'
alias webd='cd /var/www/cgi-bin/webdot'
alias chstu='chown -R stuyoung:stuyoung *'
alias chmy='chown -R mysql:mysql *'
alias gomy='cd /usr/local/mysql/data'
alias go='cd ~/base/apps/go/go_200504-utilities-src'
alias updb='updatedb'
alias locdbi='locate DBI | grep /usr/lib/perl5'
alias locdbd='locate DBD | grep /usr/lib/perl5'
alias parsego='cd ~/base/apps/parseGO'
alias perl5='cd /usr/lib/perl5'
alias tables='cd ~/base/apps/go/go_200505-seqdb-tables'
alias analysis='cd ~/base/apps/go/analysis'
alias amigo='cd /var/www/cgi-bin/amigo'
alias goR='cd ~/base/apps/R'
alias Rlib='cd /usr/lib/R/library'
alias genes='cd ~/base/genes'
alias kegg='cd ~/base/genes/kegg'
alias tools='cd ~/base/perlapps/tools'                         # GO TO TOOLS DIRECTORY

# TOOLS
alias getblast='~/base/bin/utils/get_blast_records.pl'    # GET BLAST RECORD FROM FILE
alias getfasta='~/base/bin/utils/get_fasta_records.pl'    # GET FASTA RECORD FROM FILE
alias chopfile='perl ~/base/bin/utils/chopfile.pl '       # CREATE SUBFILE FROM FILE
alias template='cp ~/base/perl_apps/template/template.pl ./'   # CREATE TEMPLATE BASIC PERL APP IN pwd
alias word='perl ~/base/bin/utils/find_line.pl'           # FIND LINE IN TEXT
alias tools='cd ~/base/bin/utils'                         # DISPLAY TOOL LIST
alias replace_string='perl ~/base/plapps/replace_string/replace_string.pl'  # REPLACE STRING IN FILE 
alias lines='perl ~/base/bin/utils/lines.pl'              # COUNT LINES IN FILE
alias files='perl ~/base/bin/utils/count_files.pl'        # COUNT FILES IN DIRECTORY
alias records='perl ~/base/bin/utils/records.pl'          # COUNT FASTA RECORDS IN FILE
alias lcg='perl ~/base/bin/utils/locate_grep.pl'          # locate USING OPTIONAL grep
#alias splitfasta='perl ~/base/bin/utils/splitfasta.pl'         # SPLIT FASTA FILE INTO SMALLER FILES
#alias randsplitfasta='perl ~/base/bin/utils/randsplitfasta.pl' # SPLIT FASTA FILE INTO SMALLER FILES
alias creamfile='perl ~/base/bin/utils/creamfile.pl'      # TRIM FIRST LINES FROM FILE
alias cleanfasta='perl ~/base/bin/utils/cleanfasta.pl'    # CLEAN " #..."  LINES FROM FILE
alias length='perl ~/base/bin/utils/filelength.pl'        # GET LENGTH OF SEQUENCE IN FILE (FASTA OR JUST SEQUENCE)

# ACTIONS
alias l='ls'
# alias lsdir='du -sh *'  # SUPERCEDED BY tools/lsdir.pl
alias df='df -ah'
alias myq='mysql -u root -p'
alias rm='rm -i'
## alias cp='cp -i'
alias mv='mv -i'
alias LL='ls -alh'
alias ll='ls -alh'
# -l = list view
# -a = all views, even hidden
# -h = human-readable sizes, e.g. 900B, 15K, 1.2MB
alias chbin='chmod 755 ~/base/bin/*'

# keeps pico from line wrapping
alias pico="/usr/bin/pico -w"

# COPY BASH FILE
# alias cpbash='cp /root/.bashrc ~/base/.bashrc; chown stuyoung:stuyoung ~/base/.bashrc'
# alias cpbash='cp /root/.bashrc ~/base/.bashrc; chown stuyoung:stuyoung ~/base/.bashrc'

# ENVIRONMENT VARIABLES
# export PATH=/usr/share/apps/komodo:$PATH
# export PATH=/usr/local/bin:$PATH
# export PATH=/usr/local/mysql/bin:$PATH

# export PATH=/usr/share/apps/ActiveTcl/bin:$PATH
# export MANPATH=/usr/share/apps/ActiveTcl/bin:$MANPATH
# export GO_ROOT=/go-dev/
# export CVSROOT=~/base/apps/cvs
# export PATH=/usr/lib/perl5/site_perl:$PATH
# export LD_LIBRARY_PATH=/usr/local/lib/graphviz
# export PATH=~/base/apps/cytoscape/PLUGINS:$PATH
# export ADOBE_SVG_VIEWER_PATH=/usr/local/adobesvg-3.01
# export DISPLAY=152.14.14.33:0



