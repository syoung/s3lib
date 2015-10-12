#### SIGNET
export PATH=~/.vip/bin:$PATH



#### INOVA
export BIOINFO='~/.ssh/inova/bioinfo1/id_rsa'
STUART=54.166.226.185
alias stuart='echo "ssh -i $BIOINFO ubuntu@$STUART"; ssh -i $BIOINFO ubuntu@$STUART'
DZUNG=54.81.126.90
alias dzung='echo "ssh -i ~/.ssh/inova/bioinfo1/id_rsa ubuntu@$DZUNG"; ssh -i ~/.ssh/inova/bioinfo1/id_rsa ubuntu@$DZUNG'
SUMA=54.159.83.240
alias suma='echo "ssh -i ~/.ssh/inova/bioinfo1/id_rsa ubuntu@$SUMA"; ssh -i ~/.ssh/inova/bioinfo1/id_rsa ubuntu@$SUMA'
alias cli='cd /a/bin/cli'
alias ino='cd /mnt/repos/private/syoung/inova'
alias dna='cd /mnt/repos/private/syoung/dnaseq'


#### BERG
alias mnt='cd /mnt/repos/private/syoung/mountain'
alias dosql='cat create/*sql  > create.sql; rm -fr insert.sql; files=`ls insert`; for file in $files; do cat insert/$file >> insert.sql; echo >> insert.sql ;  done; cat keys/*sql  > keys.sql'
alias berg='cd /mnt/repos/private/syoung/jobs/dataart/berg'


#### agua
alias killagua='ps aux | grep agua | grep -v grep | xargs -n 14 | cut -d " " -f 2 | xargs -L1 kill -9'

#### RABBITMQ
alias rmq='rabbitmqctl'
alias rl='tail -f /var/log/upstart/rabbitjs.log'
alias rlq='echo "rabbitmqctl list_queues name messages messages_ready memory"; rabbitmqctl list_queues name messages messages_ready memory'
alias rlqq='echo "rabbitmqctl list_queues name durable auto_delete arguments policy pid exclusive_consumer_pid exclusive_consumer_tag messages_ready messages consumers  memory slave_pids synchronised_slave_pids status"; rabbitmqctl list_queues name durable auto_delete arguments policy pid exclusive_consumer_pid exclusive_consumer_tag messages_ready messages consumers  memory slave_pids synchronised_slave_pids status'

alias rle='echo "rabbitmqctl list_exchanges name type durable auto_delete internal arguments policy"; rabbitmqctl list_exchanges name type durable auto_delete internal arguments policy'


#### PYTHON
alias runtests='ls *py | xargs -L1 python'

#### HISTORY
export PROMPT_COMMAND='history -a'

# PURPOSE:
#
# Print first 10 lines after a pattern found in any file at the specified location
#
# INPUTS:
# location
# pattern
# 
# EXAMPLE:
#
# getlines ../../src/vcf/leftshift/* get_regex 10
#
getlines(){
    location=${1}; 
    pattern=${2}
    echo "location $location, pattern: $pattern"
    
    grep -n "def $pattern" $location/* | perl -lne 'my ($file, $number) = $_ =~ /^(.+?):(\d+)/; print "$file line $number"; my $lines = 10; my $head = $number + $lines; print `head -n $head $file | tail -n $lines`; '
    
}


#### EDIT
xc(){
    echo $1
    $1 | xclip;
}

#### ZSH
export PATH=$PATH:$HOME/.rvm/bin

#### VCFTOOLS
export PATH=/a/apps/vcftools/0.1.12a/bin:$PATH
export PERL5LIB=/a/apps/vcftools/0.1.12a/lib/perl5/site_perl
export PATH=/a/apps/tabix/0.2.6:$PATH

#### START SSH-AGENT
alias startssh='eval "$(ssh-agent -s)"'

#### gsutil
export PATH=/a/apps/gsutil/4.7:$PATH

#### POD
getpod(){
    scp -r -i ${HOME}/cypher/keys/cypher1/id_rsa syoung@192.41.74.122:$1 $2;
}
pushpod(){
    scp -r -i ${HOME}/cypher/keys/cypher1/id_rsa $1 syoung@192.41.74.122:$2;
}

#### AWS PIPE
AGUA=54.191.201.149
DEVAGUA=10.2.6.21
alias pipe='ssh -i ${HOME}/cypher/keys/agua1/agua.pem ubuntu@$AGUA'
alias dpipe='ssh -i ${HOME}/cypher/keys/agua1/agua.pem ubuntu@$DEVAGUA'
pushpipe() {
    echo "scp -r -i ${HOME}/cypher/keys/agua1/agua.pem `pwd`/ubuntu@$AGUA:`pwd`/$1"
    scp -r -i ${HOME}/cypher/keys/agua1/agua.pem `pwd`/$1 ubuntu@$AGUA:`pwd`/$1;
}
getpipe() {
    echo "scp -r -i ${HOME}/cypher/keys/agua1/agua.pem ubuntu@$AGUA:`pwd`/$1 `pwd`:$1"
    scp -r -i ${HOME}/cypher/keys/agua1/agua.pem ubuntu@$AGUA:`pwd`/$1 `pwd`:$1;
}

alias sec='cd /mnt/repos/private/syoung/secondary-analysis'
alias mantis='cd /mnt/repos/private/syoung/mantis'
alias cws='cd /mnt/repos/private/syoung/mantis/cws'
alias bastion='ssh -i ~/cypher/keys/agua1/agua.pem ec2-user@54.186.181.23'
alias cyt='cd /mnt/repos/private/syoung/cytools'
alias a='cd /a'
alias pha='cd /mnt/repos/private/syoung/phaistos'
alias repo='cd /mnt/repos/private/syoung'
alias suu='sudo su -'
alias cy='cd ${HOMEDIR}/cypher'

alias gobash='emacs -nw /Users/syoung/.profile'
alias sobash='source /Users/syoung/.profile'

#### CYPHER
alias ann='cd /mnt/repos/private/syoung/mantis/annot'
alias brd='cd /a/apps/broadbp'
alias broad='cd /a/apps/broadbp'
alias capd='cd /mnt/repos/private/syoung/mantis/capdgen'
alias pha='cd /mnt/repos/private/syoung/mantis/phaistos'
alias cy='cd /mnt/repos/private/syoung/cypher'

#### CYPHER SERVERS
export CCM1=10.177.138.238
export POD=192.41.74.122
alias ccm1='ssh stuart@$CCM1'
alias pod='ssh -i ${HOME}/cypher/keys/cypher1/id_rsa syoung@$POD'
pushpod() {
    echo "scp -r -i ${HOME}/cypher/keys/agua1/agua.pem `pwd`/syoung@$POD:`pwd`/$1"
    scp -r -i ${HOME}/cypher/keys/agua1/agua.pem `pwd`/$1 syoung@$POD:`pwd`/$1;
}
getpod() {
    echo "scp -r -i ${HOME}/cypher/keys/agua1/agua.pem syoung@$POD:`pwd`/$1 `pwd`:$1"
    scp -r -i ${HOME}/cypher/keys/agua1/agua.pem syoung@$POD:`pwd`/$1 `pwd`:$1;
}

#### INTELLIJ
PATH=${HOME}/software/intellij/idea-IU-139.225.3/bin:$PATH

#### DAEMONS
alias http='node /a/html/exchange/https/http.js'


#### SELENIUM + INTERN
alias sel=' java -jar ${HOME}/software/selenium/selenium-server-standalone-2.44.0.jar'
export PATH=${HOME}/software/chromedriver:$PATH
export PATH=${HOME}/software/java/1.8.0-25/bin:$PATH

#### JAVA
export JAVA_HOME=${HOME}/software/java/1.8.0-25

alias nmq='cd /mnt/repos/private/syoung/notes/agua/private/bin/test/perl/NetRabbitMQ'

export PATH=${HOME}/software/java/jdk1.7.0_67:$PATH

alias config='emacs -nw /a/conf/config.yaml'
alias vgc='cd /data/vagrant/centos'
alias vgu='cd /data/vagrant/ubuntu'
alias vu='vagrant up'
alias vs='vagrant ssh'
alias vh='vagrant halt'

alias gt='cd /a/apps/gt/0.0.8'
#alias dna='cd /a/apps/dnaseq/0.0.1'
#alias rna='cd /a/apps/rnaseq/0.0.1'
alias packages='mysql -u root -p1234 agua -NBe "select package,version from package"'
alias cu='cd /a/apps/cu/0.0.11'
alias mql='mq -NBe'
alias mqt='mysql -u testuser -p12345678 testdatabase'


cleardb(){
mq -NBe "delete from workflow"
mq -NBe "delete from project"
mq -NBe "delete from stage"
mq -NBe "delete from stageparameter"
mq -NBe "delete from cluster"
mq -NBe "delete from clusterworkflow"
mq -NBe "delete from instancetype"
mq -NBe "delete from clustervars"
}

#### INSTALL DIR PATH
export PATH=/a/bin/install:$PATH
export PATH=/a/bin/cli:$PATH
export PATH=/a/apps/gt/0.0.8/bin:$PATH

#### SET HOMEDIR
USER_HOME=$(eval echo ~${SUDO_USER})
HOMEDIR=`expr $USER_HOME : '\([\/a-zA-Z0-9]*\)/\([^\/]*\)'`
#echo "HOMEDIR: $HOMEDIR"

#### NETSTAT
alias ng='netstat -ntulp | grep '

#### AVOID ERROR: ImportError: No module named 'CommandNotFound'
#unset -f command_not_found_handle


#### NODE
alias testnode='cd ${HOME}/notes/a/private/bin/test/perl/NetRabbitFoot'

killscreen(){
    screen -S $1 -p 0 -X quit
}

#### NETWORK
alias np='netstat -ntulp | grep'

#### PACKER
export PATH=/usr/local/bin/packer:$PATH

#### VAGRANT
alias vg='cd /data2/vagrant'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant ssh'

#### TESTING
#alias testenv='source $HOMEDIR/syoung/notes/a/private/conf/envars.sh'
#alias testenv-aguadev='source $HOMEDIR/syoung/notes/a/private/conf/envars-aguadev.sh'
#export installdir=/agua

#### XY
alias mqx='mysql -u xy -p1234 xy'
alias xy='cd /xy'
alias htmlx='cd /xy/html'
alias plugx='cd /xy/html/plugins'
alias binx='cd /xy/bin'
alias libx='cd /xy/lib'
alias cgix='cd /xy/cgi-bin'
alias confx='cd /xy/conf'

##### BASH FUNCTIONS
#if  [ -d $HOMEDIR/syoung/notes/backup/bash ]; then
#    source $HOMEDIR/syoung/notes/backup/bash/functions/common.sh
#    source $HOMEDIR/syoung/notes/backup/bash/functions/sshkey.sh
#    source $HOMEDIR/syoung/notes/backup/bash/functions/repos.sh
#    source $HOMEDIR/syoung/notes/backup/bash/functions/ec2key.sh
#fi;


#### VOLUMES
alias killvols='ec2dvol | grep available | cut -f 2 | xargs -n 1 ec2-delete-volume'

#### ec2
export PATH=/usr/bin:$PATH
export EC2_HOME=/usr/
export JAVA_HOME=/usr
alias listec2='ls $EC2_HOME/bin/ec2-* | grep -v cmd'

#### 
#alias ipython='ipython --profile=default'

#### nodeJS
knode() { echo `ps aux | grep "node server.js"` | kill -9 `awk '{print $2}'`;  }

#### DEVTOOLS-SAVE/DEPOT TOOLS
export PATH=$PATH:$HOMEDIR/syoung/software/depottools/depot_tools

#### MINECRAFT
alias minecraft='cd /usr/bin; java -Xmx1024M -Xms512M -cp minecraft.jar net.minecraft.LauncherFrame'

#### IPTABLES
blockip() { /sbin/iptables -I INPUT -s $1 -j DROP; }


#### GIT
if [ -f /a/bin/scripts/repos.sh ]; then source /a/bin/scripts/repos.sh; fi
alias gitmatch='git config --global push.default matching'
alias gitedit='git config --global core.editor "emacs -nw"'
alias gitinit='git init; git config --bool core.bare true'
alias gitrem='git remote '
alias gitlock='rm -fr ./.git/index.lock'
alias gitstat='git status'
alias gitdiff='git diff --name-status'
alias gitdif='git diff HEAD'
alias gitcom='git commit'
alias gitcomm='git commit -a'
alias gitdesc='git describe --abbrev=0 --tags'
alias gitlog='git log --format=format:"%ar %h %s%n%b" --graph --decorate'
#alias gitlog='git log --decorate --graph --oneline'
alias gitstatus='git status -sb'
alias gitwhich='git symbolic-ref -q HEAD'
gittags() { git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags; }
gittrack() { git ls-files $1 --error-unmatch; }


alias shrd='shred -f -v -z -u'
alias modin='ec2-modify-instance-attribute --instance-type '
alias llH='ls -alh | egrep -v -e "\s+\.\S*$"'
alias sas='service apache2 restart; killall /usr/bin/perl;'
alias se='service apache2 stop'
alias sb='service apache2 restart'
alias pg='ps aux | grep '
alias master='sc sshmaster admin-smallcluster'
alias pf='ps auxf'
alias soft='cd ~/software'
alias lsdir='ll | egrep -e "^d"'
alias llHdir='ls -alh | egrep -v "\s+\.\S*$" | egrep -e "^d"'

#### PERL DEV KIT
export PATH=/opt/pdk/bin:$PATH


#### TURN ON COLOURS
export CLICOLOR=1

#### CONVERT IMAGES
convertImages () {
echo "Changing to directory: $1";
cd $1;                     
for img in *.png
 do
    echo "BEFORE img:  $img"
     img=${img//.png/}

     echo "AFTER img: $img"
     convert "$img.png" "$img.jpg"
 done

}


#### MULTIPLE GITHUB SSH KEYS
setkey() { ssh-add ~/.ssh/$1/github/id_rsa; ssh-add ~/.ssh/$1/bitbucket/id_rsa; cp ~/.ssh/config-$1 ~/.ssh/config; }

#### GIT
alias gitpull='git pull git master'
alias gitpush='git push bit; git push bit --tags; git push git; git push git --tags;'
alias gitpull='git pull git master'
alias gitpushtags='bit push --tags; git push bit --tags;'
alias gitadd='git add --ignore-errors --all .'
alias priv='cd ~/notes/a/private/bin/test'
alias p='ps auxf'
alias pgp='ps aux | grep '
alias gitdesc='git describe --abbrev=0 --tag'

#### SUBDUED COLOURS
export LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'

#### HOT PERMISSIONS
#alias hot='find ./ -type d -exec chown syoung:www-data {} \;; find ./ -type d -exec chmod 0775 {} \;; find ./ -type f -exec chmod 0664 {} \;'
enableExec() { find ./ -type f -name $1 -exec chmod 0755 {} \;; }
hot() { find ./ -type d -exec chmod 0777 {} \;; find ./ -type f -exec chmod 0666 {} \;; }
warm() { find ./ -type d -exec chmod 0775 {} \;; find ./ -type f -exec chmod 0664 {} \;; }
cold() { find ./ -type d -exec chmod 0755 {} \;; find ./ -type f -exec chmod 0644 {} \;; }
freeze() { find ./ -type d -exec chmod 0555 {} \;; find ./ -type f -exec chmod 0444 {} \;; }
zero()  { find ./ -type d -exec chmod 0500 {} \;; find ./ -type f -exec chmod 0400 {} \;; }

#### git
gitbash() {
HOMEDIR=`expr "$HOMEDIR/stuarty" : '\([\/a-zA-Z0-9]*\)/\([^\/]*\)'`;
echo "sshkey    USERDIR: $HOMEDIR/$username";
cp /root/.profile $HOMEDIR/syoung/notes/backup/bash/root/.profile;
cp $HOMEDIR/syoung/.profile $HOMEDIR/syoung/notes/backup/bash/syoung/.profile;
cp /var/www/.profile $HOMEDIR/syoung/notes/backup/bash/www-data/.profile;
#cd $HOMEDIR/syoung/notes/backup/bash;
#git add .;
#git commit -a -m "$1"
#git push;
#git push linode;
}

#### AGUA SHORTCUTS
alias suu='sudo su'
alias plug='cd /a/html/plugins'
alias scrip='cd /a/bin/scripts'
alias apps='cd /a/apps'
alias bin='cd /a/bin'
alias conf='cd /a/conf'
alias t='cd /a/t'
alias html='cd /a/html'
alias cgi='cd /a/cgi-bin'
alias lig='cd /a/lib/Agua'
alias lip='cd /a/lib/a/Common/Package'
alias lic='cd /a/lib/a/Common'
alias lio='cd /a/lib/a/Ops'
alias lib='cd /a/lib'
alias notes='cd $HOMEDIR/syoung/notes'
alias jobs='cd $HOMEDIR/syoung/jobs'
alias misc='cd $HOMEDIR/syoung/misc'
alias ww='cd /var/www/cgi-bin/agua; sudo su www-data -'
#alias ag='cd /agua'

#### MOUNTS
rpc () { rpcinfo -p | awk -F " " '{print $3 "\t" $4 "\t" $5}' | sort | uniq | grep -v proto; }


# DATE
alias DATE='date'

# FIX DOS LINE ENDINGS
alias fle="perl -pi -e 's/\r//g' "
alias fle2="perl -pi -e 's/\r/\n/g' "

# turn on color file listing
export CLICOLOR=1

# ALIASES
alias perlenv="perl -e 'foreach my $key(sort keys(%ENV)){print qq|$key = $ENV{$key}\n|;}'"
alias pl='perl Makefile.PL'
alias tx='tar xvfz'
alias mk='make; make install'
alias perl='/usr/bin/perl'
alias q='qstat'
alias sqlite='sqlite3'
alias mod='chmod 755 *'
alias now='date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"'
alias psg='ps aux | grep'
alias llhg='ls -alh | grep'
alias llg='ls -al | grep'
alias lg='ls | grep'
alias xpl='chmod 755 *.pl *.cgi *.t'

alias mq='mysql -u root -p1234 agua'
alias mqt='mysql -u root -p1234 aguatest'


alias cpus='cat /proc/cpuinfo | grep processor | wc -l'
alias em='emacs -nw'
alias emacs='emacs -nw'
alias me='emacs -nw'
alias gobash='emacs -nw ~/.profile'
alias sobash='source ~/.profile'
alias er='tail -f -n 100 /var/log/apache2/error.log'
alias ac='tail -f -n 100 /var/log/apache2/access.log'
alias myer='tail -100 /var/log/mysqld.log'
alias cl='clear; ls; pwd'
alias updb='updatedb'

alias l='ls'
alias df='df -ah'
alias rm='rm -i'
alias mv='mv -i'
alias LL='ls -alh'
alias ll='ls -al'
alias llh='ls -alh'
# -l = list view
# -a = all views, even hidden
# -h = human-readable sizes, e.g. 900B, 15K, 1.2MB

# keeps pico from line wrapping
alias pico="/usr/bin/pico -w"

#### PROPRIETARY

#### STARCLUSTER
alias sc='starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster'
alias stail=' echo >>  /tmp/starcluster-debug-root.log ; echo >>  /tmp/starcluster-debug-root.log ; date >>  /tmp/starcluster-debug-root.log ; echo >>  /tmp/starcluster-debug-root.log ; tail -f /tmp/starcluster-debug-root.log;'


### SGE
#export SGE_EXECD_PORT=63232;
#export SGE_QMASTER_PORT=63231
#export SGE_ROOT=/opt/sge6
#export PATH=/opt/sge6/bin/lx24-amd64:$PATH

#### GET DATA
getData() { echo '{"username":"'$1'","sessionid":"9999999999.9999.999","mode":"getData","module":"Agua::Workflow"} | /var/www/cgi-bin/a/agua.pl;' ; echo '{"username":"'$1'","sessionid":"9999999999.9999.999","mode":"getData","module":"Agua::Workflow"}' | /var/www/cgi-bin/a/agua.pl; }

getTable () { echo '{"username":"'$2'","sessionId":"9999999999.9999.999","database":"agua","mode":"getTable","table":"'$1'","module":"Agua::Workflow"} | /var/www/cgi-bin/a/agua.pl'; echo '{"username":"admin","sessionId":"9999999999.9999.999","database":"agua","mode":"getTable","table":"'$1'","module":"Agua::Workflow"}' | /var/www/cgi-bin/a/agua.pl; }

testit() { echo 'git push; git push --tags; git push bit; git push --tags bit; git push lin; git push --tags lin;' ; git push; git push --tags; git push bit; git push --tags bit; git push lin; git push --tags lin; }


#### DIGITAL OCEAN
alias digi='ssh vesi@107.170.219.63'
alias digi2='ssh -i ${HOME}/.ssh/id_rsa.aquarius7 vesi@192.241.223.100'



#### GIT-AWARE


#### LINODE
export linodeip=173.230.142.248
alias linode='ssh root@$linodeip'


#### AGUADEV
alias pepo='cd /mnt/repos/public/agua'
alias repo='cd /mnt/repos/private/syoung'
alias scrip='cd /a/bin/scripts'
alias lig='cd /a/lib/Agua'
alias lib='cd /a/lib'
alias lic='cd /a/lib/Agua/Common'
alias ag='cd /a'
alias a='cd /a'

#### INFUSIONDEV
alias bini='cd /infusiondev/bin'
alias libi='cd /infusiondev/lib'
alias cgii='cd /infusiondev/cgi-bin'
alias htmli='cd /infusiondev/html'
alias ti='cd /infusiondev/t'
alias inf='cd /infusiondev'
alias plugi='cd /infusiondev/html/plugins'

#### BIOAPPS UTILS
alias bioapps='cd /a/apps/bioapps'
PATH=/a/apps/bioapps/bin/utils:$PATH

#### EC2
ec2env() {  env | egrep -e "(EC2|AWS)"; }
getExternal () { ec2din $1 | grep INSTANCE | cut -f 4; }
ec2syoung() { source $HOMEDIR/syoung/notes/a/keypair/syoung/ec2/exports.sh; }
ec2invasionmoo() { source $HOMEDIR/syoung/notes/a/keypair/invasionmoo/ec2/exports.sh; }

#### MOORES
alias sshm='ssh -i ${HOME}/annai/projects/moores/keypairs/mooresvm.pem centos@132.249.227.79'


clearhost(){
    ssh-keygen -f "${HOME}/.ssh/known_hosts" -R 132.249.227.$1
}


#### TEST SERVER
alias ssht='ssh stuarty@207.8.121.242'

#### HEADNODE 1
export head=i-a20527cb
#i-cf86f0b2
export HEADIP=ec2-54-211-93-247.compute-1.amazonaws.com
alias hn='ssh ec2_user@$HEADIP'

#### HEADNODE 2
#export head2=i-dda13aa0
#export HEADIP2=ec2-67-202-19-143.compute-1.amazonaws.com
#alias hn2='ssh root@$HEADIP2'

sf () { scp $1 root@$HEADIP:`pwd`/$1; }
sd () { scp -r $1 root@$HEADIP:`pwd`/$1; }
getfile () { scp root@$HEADIP:`pwd`/$1 .; }
getdir () { scp -r root@$HEADIP:`pwd`/$1 .; }

sf2 () { scp $1 root@$HEADIP2:`pwd`/$1; }
sd2 () { scp -r $1 root@$HEADIP2:`pwd`/$1; }
getfile2 () { scp root@$HEADIP2:`pwd`/$1 .; }
getdir2 () { scp -r root@$HEADIP2:`pwd`/$1 .; }


