# User specific aliases and functions
#

#### PERL TEST NODE
PATH=/home/syoung/notes/agua/private/bin/test/perl/NetRabbitFoot:$PATH
#### RUN NODE SERVICES
alias rabbit='node /aguadev/apps/node-amqp/node_modules/rabbit.js/example/socketio/https.js'
alias https='node /home/syoung/notes/agua/private/bin/test/node/https/https.js'

#### FIX PYTHON INSTALLATION ERROR
unset -f command_not_found_handle

#### NETSTAT
alias ng='netstat -ntulp | grep '

#### AGUA
login() {
	echo '{"mode":"submitLogin","module":"Agua::Workflow","password":"aaa","username":"admin","SHOWLOG":4}' | /aguadev/cgi-bin/agua.pl
}

#### NETWORK
alias np='netstat -ntulp | grep'

#### VAGRANT
alias vag='cd /data2/vagrant'
alias vagc='cd /data2/vagrant/centos'
alias vagu='cd /data2/vagrant/ubuntu'
alias vau='vagrant up'
alias vah='vagrant halt'
alias vas='vagrant ssh'

#### PACKER
export PATH=/usr/local/bin/packer:$PATH

#### KILL A NODE PROCESS
if [ -f /home/syoung/notes/backup/bash/functions/killnode.sh ]; then source /home/syoung/notes/backup/bash/functions/killnode.sh; fi

#### KILL A PROCESS RUNNING IN netstat BY PORT NUMBER
function killp() { 
    if [ -z "$1" ]; then 
	exit; 
    fi

    pid=$(netstat -ntulp | grep $1 | xargs -n 1 | grep node | sed "s/\/node//");

    if [ "$pid" != "" ]; then 
	echo "DOING kill -9 " $pid
	kill -9 $pid;
    fi
}



#### TESTING
alias testenv='source /home/syoung/notes/agua/private/conf/envars.sh'
alias testenv-aguadev='source /home/syoung/notes/agua/private/conf/envars-aguadev.sh'

#### NODE
knode() { echo `ps aux | grep "node server.js"` | kill -9 `awk '{print $2}'`;  }

#### HOSTS
export svdev='10.14.152.132'
export sydev='10.14.154.120'
alias gosvdev='ssh syoung1@10.14.152.132'
alias gosydev='ssh syoung@10.14.154.120'
alias gocp='ssh syoung1@uscp-prd-lndt.illumina.com'
ushw='ushw-dev-lngt01.illumina.com'
ussd='ussd-prd-lndt.illumina.com'
uscp='uscp-prd-lndt.illumina.com'


#### SERVICES
alias bini='cd /infusiondev/bin'
alias libi='cd /infusiondev/lib'
alias cgii='cd /infusiondev/cgi-bin'
alias htmli='cd /infusiondev/html'
alias ti='cd /infusiondev/t'
alias inf='cd /infusiondev'
alias plugi='cd /infusiondev/html/plugins'


#### SERVICES
alias serv='cd /repos/private/illuminadev/services'
alias saff='cd /repos/private/illuminadev/saffrondev'
alias soft='cd /home/syoung/software'
alias jobs='cd /home/syoung/jobs'

aguadev() { export EC2_PRIVATE_KEY=~/notes/aguadev/keypair/aguadevdev/pk-ABUIOJUST7NT7LIPAH6UK5ZSZMJBINBL.pem; export EC2_CERT=~/notes/aguadev/keypair/aguadevdev/cert-ABUIOJUST7NT7LIPAH6UK5ZSZMJBINBL.pem; }

#### VOLUMES
alias killvols='ec2dvol | grep available | cut -f 2 | xargs -n 1 ec2-delete-volume'

#### BIOAPPS UTILS
alias bioapps='cd /aguadev/apps/bioapps'
PATH=/aguadev/apps/bioapps/bin/utils:$PATH

#### MINECRAFT
alias minecraft='cd /usr/bin; java -Xmx1024M -Xms512M -cp minecraft.jar net.minecraft.LauncherFrame'

#### IPTABLES
blockip() { /sbin/iptables -I INPUT -s $1 -j DROP; }

#### EC2
getExternal () { ec2din $1 | grep INSTANCE | cut -f 4; }

#### HEADNODE 1
export head=i-cf86f0b2
export HEADIP=ec2-184-72-155-64.compute-1.amazonaws.com
alias hn='ssh root@$HEADIP'

#### HEADNODE 2
export head2=i-dda13aa0
export HEADIP2=ec2-67-202-19-143.compute-1.amazonaws.com
alias hn2='ssh root@$HEADIP2'


sf () { scp $1 root@$HEADIP:`pwd`/$1; }
sd () { scp -r $1 root@$HEADIP:`pwd`/$1; }
getfile () { scp root@$HEADIP:`pwd`/$1 .; }
getdir () { scp -r root@$HEADIP:`pwd`/$1 .; }
sf2 () { scp $1 root@$HEADIP2:`pwd`/$1; }
sd2 () { scp -r $1 root@$HEADIP2:`pwd`/$1; }
getfile2 () { scp root@$HEADIP2:`pwd`/$1 .; }
getdir2 () { scp -r root@$HEADIP2:`pwd`/$1 .; }
sf3 () { scp $1 root@$HEADIP3:`pwd`/$1; }
sd3 () { scp -r $1 root@$HEADIP3:`pwd`/$1; }
getfile3 () { scp root@$HEADIP3:`pwd`/$1 .; }
getdir3 () { scp -r root@$HEADIP3:`pwd`/$1 .; }

#### GIT
if [ -f /aguadev/bin/scripts/repos.sh ]; then source /aguadev/bin/scripts/repos.sh; fi
alias gitrem='git remote '
alias gitlock='rm -fr ./.git/index.lock'
alias gitstat='git status'
alias gitdiff='git diff --name-status'
alias gitdif='git diff HEAD'
alias gitcom='git commit'
alias gitcomm='git commit -a'
alias gitdesc='git describe --abbrev=0 --tags'
alias gitlog='git log --decorate --graph --oneline'
alias gitstatus='git status -sb'
alias gitwhich='git symbolic-ref -q HEAD'
gittags() { git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags; }


alias private='cd /aguadev/private'
alias logic='cd /aguadev/bin/logic'
alias shrd='shred -f -v -z -u'
alias modin='ec2-modify-instance-attribute --instance-type '
alias llH='ls -alh | egrep -v -e "\s+\.\S*$"'
alias sas='service apache2 restart; killall /usr/bin/perl;'
alias nserv='node /aguadev/apps/node-amqp/node_modules/rabbit.js/example/socketio/server.js &'
alias rab='rabbitmqctl stop_app; rabbitmqctl reset; rabbitmqctl start_app;'
alias se='service apache2 stop'
alias sb='service apache2 restart'
alias pg='ps aux | grep '
alias master='sc sshmaster admin-smallcluster'
alias p='ps auxf'
alias scrip='cd /aguadev/bin/scripts'
alias lig='cd /aguadev/lib/Agua'
alias lib='cd /aguadev/lib'
alias lic='cd /aguadev/lib/aguadev/Common'
alias ag='cd /aguadev'



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


#### GET DATA
getData() { echo '{"username":"'$1'","sessionid":"9999999999.9999.999","mode":"getData","module":"Agua::Workflow"} | /var/www/cgi-bin/aguadev/agua.pl;' ; echo '{"username":"'$1'","sessionid":"9999999999.9999.999","mode":"getData","module":"Agua::Workflow"}' | /var/www/cgi-bin/aguadev/agua.pl; }

getTable () { echo '{"username":"'$2'","sessionid":"9999999999.9999.999","database":"aguadev","mode":"getTable","table":"'$1'","module":"Agua::Workflow"} | /var/www/cgi-bin/aguadev/agua.pl'; echo '{"username":"'$2'","sessionid":"9999999999.9999.999","database":"aguadev","mode":"getTable","table":"'$1'","module":"Agua::Workflow"}' | /var/www/cgi-bin/aguadev/agua.pl; }

testit() { echo 'git push; git push --tags; git push bit; git push --tags bit; git push lin; git push --tags lin;' ; git push; git push --tags; git push bit; git push --tags bit; git push lin; git push --tags lin; }


#### MULTIPLE GITHUB SSH KEYS
ssh-add ~/.ssh/idents/github.com/syoung/id_rsa &> /dev/null
#ssh-add ~/.ssh/idents/github.com/aguadev/id_rsa &> /dev/null


#### EC2 ELASTIC LOAD BALANCING
export AWS_ELB_HOME=/data/apps/ec2/loadbal/1.0.14.3

clr () { for ((  i = 0 ;  i <= 50;  i++  )) do    echo "";  done; }

#### ALIASES
alias gitpush='git push lin; git push lin --tags; git push; git push --tags; git push bit; git push bit --tags; '
alias gitpushtags='git push lin --tags; git push --tags; git push bit --tags;'
alias gitadd='git add --ignore-errors .'
alias priv='cd /aguadev/private'
alias p='ps auxf'
alias pgp='ps aux | grep '
alias gitdesc='git describe --abbrev=0 --tag'
alias biorepo='cd /mnt/repos/public/agua/biorepository'
alias pepo='cd /mnt/repos/public/agua'
alias repo='cd /mnt/repos/private/syoung'
alias aguarepo='cd /aguadev/repos/public/agua/biorepository/aguadev/'

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
alias gitlog='git log --decorate --graph --oneline'
gitbash() {

HOMEDIR=`expr "/home/stuarty" : '\([\/a-zA-Z0-9]*\)/\([^\/]*\)'`;
echo "sshkey    USER HOMEDIR: $HOMEDIR/$username";
cp /root/.bash_profile /home/syoung/notes/backup/bash/root/.bash_profile;
cp /home/syoung/.bash_profile /home/syoung/notes/backup/bash/syoung/.bash_profile;
cp /var/www/.bash_profile /home/syoung/notes/backup/bash/www-data/.bash_profile;

#cd /home/syoung/notes/bash;
#git add .;
#git commit -a -m "$1"
#git push;
#git push linode;
}


#### GIT-AWARE


#### LINODE
alias linode='ssh root@173.230.142.248'

#### AGUA SHORTCUTS
alias suu='sudo su'
alias app='cd /aguadev/bioapps'
alias plug='cd /aguadev/html/plugins'
alias scrip='cd /aguadev/bin/scripts'
alias bin='cd /aguadev/bin'
alias conf='cd /aguadev/conf'
alias t='cd /aguadev/t'
alias html='cd /var/www/html/aguadev'
alias cgi='cd /var/www/cgi-bin/aguadev'
alias lig='cd /aguadev/lib/Agua'
alias lip='cd /aguadev/lib/Agua/Common/Package'
alias lic='cd /aguadev/lib/Agua/Common'
alias lio='cd /aguadev/lib/Agua/Ops'
alias lib='cd /aguadev/lib'
alias notes='cd /home/syoung/notes'
alias ww='cd /var/www/cgi-bin/aguadev; sudo su www-data -'
alias ag='cd /aguadev'


#### KOMODO
export PATH="/home/syoung/software/komodo/7.1.1-10623/bin:$PATH"
#export PATH="/home/syoung/software/komodo/6.1.3-8844/bin:$PATH"


#### MOUNTS
rpc () { rpcinfo -p | awk -F " " '{print $3 "\t" $4 "\t" $5}' | sort | uniq | grep -v proto; }


#### STARCLUSTER
alias sc='starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster'
alias stail=' echo >>  /tmp/starcluster-debug-root.log ; echo >>  /tmp/starcluster-debug-root.log ; date >>  /tmp/starcluster-debug-root.log ; echo >>  /tmp/starcluster-debug-root.log ; tail -f /tmp/starcluster-debug-root.log;'

#### AGUA
PATH=/aguadev/bin/apps/logic:$PATH
alias flow='/aguadev/bin/apps/logic/workflow.pl'

### SGE
export SGE_EXECD_PORT=63232;
export SGE_QMASTER_PORT=63231
export SGE_ROOT=/opt/sge6
export PATH=/opt/sge6/bin/lx24-amd64:$PATH

#### ec2
export PATH=/usr/bin:$PATH
export EC2_HOME=/usr/
export JAVA_HOME=/usr
export EC2_PRIVATE_KEY=/aguadev/conf/.ec2/admin/private.pem
export EC2_CERT=/aguadev/conf/.ec2/admin/public.pem
alias listec2='ls $EC2_HOME/bin/ec2-* | grep -v cmd'

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
alias mq='mysql -u root -p1234 aguadev'

alias em='emacs -nw'
alias me='emacs -nw'
alias gobash='emacs -nw ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias er='tail -f -n 100 /var/log/apache2/error.log'
alias ac='tail -f -n 100 /var/log/apache2/access.log'
alias myer='tail -100 /var/log/mysqld.log'
alias cl='clear; ls; pwd'
alias apps='cd /data/apps'
alias updb='updatedb'

alias l='ls'
alias df='df -ah'
alias rm='rm -i'
alias mv='mv -i'
alias LL='ls -alh'
alias ll='ls -alh'
alias llh='ls -alh'
# -l = list view
# -a = all views, even hidden
# -h = human-readable sizes, e.g. 900B, 15K, 1.2MB

# keeps pico from line wrapping
alias pico="/usr/bin/pico -w"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias suu='sudo su'
alias em='emacs -nw'
alias gobash='em ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias LL='ls -al'
alias ll='ls -al'
