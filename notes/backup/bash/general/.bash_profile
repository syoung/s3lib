# User specific aliases and functions

#### GIT
alias gitinit='git init; git config --bool core.bare true'
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
alias gitlog='git log --decorate --graph --oneline'

#### SECURE SHRED FILES
alias shrd='shred -f -v -z -u'

#### LIST FILES
alias llH='ls -alh | egrep -v -e "\s+\.\S*$"'

#### LIST RUNNING PROCESSES
alias ng='netstat -ntulp | grep '
alias pg='ps aux | grep '
alias p='ps auxf'

#### TURN ON COLOURS
export CLICOLOR=1

#### CLEAR SCREEN
clr () { for ((  i = 0 ;  i <= 50;  i++  )) do    echo "";  done; }

#### SUBDUED COLOURS
export LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'

#### SET DIFFERENT PERMSSIONS FOR ALL FOLDERS AND FILES IN SUBDIRS
enableExec() { find ./ -type f -name $1 -exec chmod 0755 {} \;; }
hot() { find ./ -type d -exec chmod 0777 {} \;; find ./ -type f -exec chmod 0666 {} \;; }
warm() { find ./ -type d -exec chmod 0775 {} \;; find ./ -type f -exec chmod 0664 {} \;; }
cold() { find ./ -type d -exec chmod 0755 {} \;; find ./ -type f -exec chmod 0644 {} \;; }
freeze() { find ./ -type d -exec chmod 0555 {} \;; find ./ -type f -exec chmod 0444 {} \;; }

# DATE
alias DATE='date'

# FIX DOS LINE ENDINGS
alias fle="perl -pi -e 's/\r//g' "
alias fle2="perl -pi -e 's/\r/\n/g' "

# turn on color file listing
export CLICOLOR=1

# GENERAL ALIASES
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

alias em='emacs -nw'
alias me='emacs -nw'
alias gobash='emacs -nw ~/.bash_profile'
alias sobash='source ~/.bash_profile'
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
alias ll='ls -alh'
alias llh='ls -alh'
# -l = list view
# -a = all views, even hidden
# -h = human-readable sizes, e.g. 900B, 15K, 1.2MB

# keeps pico from line wrapping
alias pico="/usr/bin/pico -w"

