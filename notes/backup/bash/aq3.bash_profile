# .bash_profile
# User specific aliases and functions

#### ec2
export PATH=/home/ec2/bin:$PATH
export EC2_HOME=/home/ec2
export JAVA_HOME=/usr
export EC2_PRIVATE_KEY=/agua/home/admin/.keypairs/privatekey.pem
export EC2_CERT=/agua/home/admin/.keypairs/publickey.pem
export PATH=/home/ec2/bin:$PATH

# DATE
alias DATE='date'

# FIX DOS LINE ENDINGS
alias fle="perl -pi -e 's/\r//g' "
alias fle2="perl -pi -e 's/\r/\n/g' "

# turn on color file listing
export CLICOLOR=1

# ALIASES
alias q='qstat'
alias sqlite='sqlite3'
alias mod='chmod 755 *'
alias now='date "+DATE: %m/%d/%y%nTIME: %H:%M:%S"'
alias psg='ps aux | grep'
alias llhg='ls -alh | grep'
alias llg='ls -al | grep'
alias lg='ls | grep'
alias xpl='chmod 755 *.pl *.cgi *.t'
alias mq='mysql -u root -p'

alias em='emacs -nw'
alias me='emacs -nw'
alias gobash='emacs -nw ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias er='tail -f -n 100 /var/log/httpd/error_log'
alias myer='tail -100 /var/log/mysqld.log'
alias html='cd /var/www/html'
alias cgi='cd /var/www/cgi-bin'
alias cl='clear; ls; pwd'
alias apps='cd ~/base/apps'
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



