est


<entry [Wed 2011:11:30 16:39:23 EST] EST ANALYSIS COMMANDS>
    
    
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

alias svg2png='java -jar /Users/young/dev/gui/SVG/svg2png/Batik/batik-1.6/batik-rasterizer.jar -dpi 150 '

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

# CHECK GRID ENGINE DAEMONS ARE RUNNING
alias sged='ps aux | grep sge'
alias sgex='cd /Users/gridman/scripts'

# BLAST ALIASES
alias blastn="/Users/gridman/apps/blast/blastn";
alias blastp="/Users/gridman/apps/blast/blastp";
alias blastx="/Users/gridman/apps/blast/blastx";
alias xdformat="/Users/gridman/apps/blast/xdformat";

# FUNNYBASE PATH VARIABLES
export PATH=~/base/bin:$PATH

# X-windows
alias xhost='/usr/X11R6/bin/xhost'


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




</entry>