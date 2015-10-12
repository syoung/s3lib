
#### CONFLUENCE
#### JAVA_HOME
export JAVA_HOME=/usr/share/jdk1.7.0_40


#### GIT
alias gitpush='git push bit; git push bit --tags; git push git; git push git --tags;'
alias gitpushtags='bit push --tags; git push bit --tags;'
alias gitadd='git add --ignore-errors .'
alias gitdesc='git describe --abbrev=0 --tag'
alias gitmatch='git config --global push.default matching'
alias gitedit='git config core.editor "emacs -nw" --global'
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

#### GENERAL COMMANDS
alias priv='cd /agua/private'
alias p='ps auxf'
alias pgp='ps aux | grep 'alias shrd='shred -f -v -z -u'
alias modin='ec2-modify-instance-attribute --instance-type '
alias llH='ls -alh | egrep -v -e "\s+\.\S*$"'
alias sas='service apache2 restart; killall /usr/bin/perl;'
alias se='service apache2 stop'
alias sb='service apache2 restart'
alias pg='ps aux | grep '
alias master='sc sshmaster admin-smallcluster'
alias pf='ps auxf'
alias soft='cd ~/software'


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
cp /root/.bash_profile /home/syoung/notes/bash/root/.bash_profile;
cp /home/syoung/.bash_profile /home/syoung/notes/bash/syoung/.bash_profile;
cp /var/www/.bash_profile /home/syoung/notes/bash/www-data/.bash_profile;
cd /home/syoung/notes/bash;
git add .;
git commit -a -m "$1"
git push;
git push linode;
}


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
alias mq='mysql -u root -ptest3 aguadev'

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
