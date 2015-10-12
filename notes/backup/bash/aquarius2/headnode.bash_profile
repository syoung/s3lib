# .bash_profile
# User specific aliases and functions
#

#### STARCLUSTER
alias listc='`pwd`/starcluster -c /nethome/admin/.starcluster/syoung-microcluster.config listclusters'

#### PYTHONBREW
source /root/.pythonbrew/etc/bashrc

#### AGUA
alias hg='cd /data/sequence/reference/human/hg19'
alias plug='cd /agua/0.6/html/plugins'
alias bin='cd /agua/0.6/bin'
alias home='cd /nethome/syoung/agua'
alias home1='cd /nethome/syoung/agua/Project1/Workflow1'
alias cgiw='cd /var/www/cgi-bin/agua/0.6; su www-data'

#### DUMP MYSQL
alias dumpdb='/agua/0.6/bin/scripts/dumpDb.pl --db agua --outputdir /agua/0.6/bin/sql/dump'
alias dumpagua='/agua/0.6/bin/scripts/dumpDb.pl --db agua --outputdir /agua/0.6/bin/sql/dump --dumpfile /agua/0.6/sql/dump/agua.dump'


export PATH=/opt/sge6/bin/lx24-amd64/:/opt/sge6/util:/opt/sge6/utilbin/lx24-amd64:$PATH

alias ersge="echo 'tail -n 100 /opt/sge6/syoung-smallcluster/spool/qmaster/messages'; tail -n 100 /opt/sge6/syoung-smallcluster/spool/qmaster/messages; echo 'tail -n 100 /opt/sge6/syoung-smallcluster/spool/exec_spool_local/master/messages'; tail -n 100 /opt/sge6/syoung-smallcluster/spool/exec_spool_local/master/messages; echo 'tail -n 100 /tmp/sge_messages'; tail -n 100 /tmp/sge_messages; "

#### TEST Agua::Workflow
alias q='/agua/0.6/bin/scripts/qstatSummary.pl'
alias scplug='cd /nethome/admin/.starcluster/plugins'
alias work='cd /nethome/syoung/agua/Project1/Workflow1'
alias sc='/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config ';

bump () {
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-184-72-75-178.compute-1.amazonaws.com "export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6;/opt/sge6/bin/lx24-amd64/qconf -ke all";
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-184-72-75-178.compute-1.amazonaws.com "export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6;/opt/sge6/bin/lx24-amd64/qconf -km";
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-184-72-75-178.compute-1.amazonaws.com "export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6;/opt/sge6/bin/lx24-amd64/sge_qmaster";
ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ec2-184-72-75-178.compute-1.amazonaws.com "export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6;/opt/sge6/bin/lx24-amd64/sge_execd";
}

alias envars='export SGE_CELL=syoung-smallcluster; export SGE_QMASTER_PORT=36251; export SGE_EXECD_PORT=36252; export SGE_ROOT=/opt/sge6;'

alias listc='starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config listclusters'

submit() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","cluster":"syoung-smallcluster","submit":"1","mode":"executeWorkflow","number":"1"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","cluster":"syoung-smallcluster","submit":"1","mode":"executeWorkflow","number":"1"}' |/var/www/cgi-bin/agua/0.6/workflow.cgi; }

#### TEST Agua::Common::Cluster

addCluster () {  echo '{"availzone":"us-east-1a","username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","availzone":"us-east-1a","cluster":"smallcluster","clustername":"smallcluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-b07985d9","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}'; echo '{"username":"syoung","availzone":"us-east-1a","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"smallcluster","clustername":"smallcluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-b07985d9","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

removeCluster() { echo '{"cluster":"smallcluster","availzone":"us-east-1a","instancetype":"t1.micro","amiid":"ami-b07985d9","minnodes":"0","maxnodes":"1","description":"Small test cluster","notes":"Notes","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeCluster"}'; echo '{"cluster":"smallcluster","availzone":"us-east-1a","instancetype":"t1.micro","amiid":"ami-b07985d9","minnodes":"0","maxnodes":"1","description":"Small test cluster","notes":"Notes","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeCluster"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }


#alias work='cd /nethome/admin/agua/Project1/Workflow1'

#### www
alias ssm='/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config sshmaster syoung-smallcluster'
alias ssn='/data/starcluster/110202bal/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config sshnode syoung-smallcluster' 

alias ww='cd /var/www/cgi-bin/agua/0.6; su www-data'
ex() {
    echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"1"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi;
}


#### mysql
alias px='ps aux | grep '
killm () { kill `ps aux | grep mysql | awk -F" " '{print \$2}'`; }


#### INIT
alias initlog='tail -f -n 30 /var/www/html/agua/0.6/initlog.html'

#### MOUNTS
rpc () { rpcinfo -p | awk -F " " '{print $3 "\t" $4 "\t" $5}' | sort | uniq | grep -v proto; }

#### STARCLUSTER
#alias sc='starcluster -c /nethome/admin/.starcluster/config sshmaster smallcluster'
alias stail=' echo >>  /tmp/starcluster-debug-root.log ; echo >>  /tmp/starcluster-debug-root.log ; date >>  /tmp/starcluster-debug-root.log ; echo >>  /tmp/starcluster-debug-root.log ; tail -f /tmp/starcluster-debug-root.log;'

#### AGUA
PATH=/agua/bin/apps/logic:$PATH
alias flow='/agua/bin/apps/logic/workflow.pl'

### SGE
export SGE_EXECD_PORT=63232;
export SGE_QMASTER_PORT=63231
export SGE_ROOT=/opt/sge6
export PATH=/opt/sge6/utilbin/lx24-amd64:$PATH
export PATH=/opt/sge6/bin/lx24-amd64:$PATH



#### ec2
export PATH=/usr/bin:$PATH
export EC2_HOME=/usr/
export JAVA_HOME=/usr
export EC2_PRIVATE_KEY=/agua/0.6/conf/admin/.keypairs/private.pem
export EC2_CERT=/agua/0.6/conf/admin/.keypairs/public.pem
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
#alias q='qstat'
alias sqlite='sqlite3'
alias mod='chmod 755 *'
alias now='date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"'
alias psg='ps aux | grep'
alias llhg='ls -alh | grep'
alias llg='ls -al | grep'
alias lg='ls | grep'
alias xpl='chmod 755 *.pl *.cgi *.t'
alias mq='mysql -u root -popen4root agua'

alias em='emacs -nw'
alias me='emacs -nw'
alias gobash='emacs -nw ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias er='tail -f -n 100 /var/log/apache2/error.log'
alias myer='tail -100 /var/log/mysqld.log'
alias html='cd /var/www/html/agua/0.6'
alias cgi='cd /var/www/cgi-bin/agua/0.6'
alias cl='clear; ls; pwd'
alias apps='cd /data/apps'
alias updb='updatedb'

alias l='ls'
alias df='df -ah'
alias rm='rm -i'
alias mv='mv -i'
alias LL='ls -alh'
alias ll='ls -alh'
# -l = list view
# -a = all views, even hidden
# -h = human-readable sizes, e.g. 900B, 15K, 1.2MB

# keeps pico from line wrapping
alias pico="/usr/bin/pico -w"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
