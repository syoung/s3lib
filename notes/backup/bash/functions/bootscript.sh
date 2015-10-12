#!/bin/bash

cat <<'EOF' >> /root/.bash_profile
alias suu='sudo su'
alias em='emacs -nw'
alias gobash='em ~/.bash_profile'
alias sobash='source ~/.bash_profile'
alias LL='ls -al'
alias ll='ls -al'
EOF

YUM=/usr/bin/yum
if [[ -f $YUM ]]; then
	echo "Installing emacs on CentOS"
	yum -y install emacs
else
	echo "Installing emacs on Ubuntu"
	apt-get -y install emacs23
fi
