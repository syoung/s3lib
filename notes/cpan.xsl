apps.cpan


<entry [Wed Nov 17 11:42:00 EST 2010] AUTOMATE CPAN INSTALLS>

1. MAKE CPAN AUTOMATICALLY INSTALL PREREQUISITES


2. INSTALL A LIST OF MODULES

http://perl.active-venture.com/lib/CPAN-config.html
When the CPAN module is installed, a site wide configuration file is created as CPAN/Config.pm. The default values defined there canx be overridden in another configuration file: CPAN/MyConfig.pm. You can store this file in $HOME/.cpan/CPAN/MyConfig.pm if you want, because $HOME/.cpan is added to the search path of the CPAN module before the use() or require() statements.

BACKUP ANY EXISTING MyConfig.pm FILE:
cp ~/.cpan/CPAN/MyConfig.pm ~/.cpan/CPAN/MyConfig.pm.bkp


CREATE DEFAULT TEMPLATE MyConfig.pm FILE:
http://systembash.com/content/change-or-remove-cpan-mirror/

o conf init
o conf init urllist

SELECTED 1-52, I.E., ALL U.S. SERVERS

WHICH CREATED /root/.cpan/CPAN/MyConfig.pm WITH CONTENTS:

    $CPAN::Config = {
        ...
        'prerequisites_policy' => q[follow],
        ...
    }


*** COPIED FOR REFERENCE TO: ***

/home/syoung/base/notes/apps/cpan/MyConfig.pm


NOTES
-----


HOW TO WRITE IT USING EOF ON COMMAND LINE:

    cat <<EOF > ~/.cpan/CPAN/MyConfig.pm
    \$CPAN::Config = {
        build_requires_install_policy => "yes",
        cpan_home => "/root/.cpan",
        prerequisites_policy => "follow",
        ...
    }
    EOF

perl -MCPAN -e 'install Config::JSON'
    OK
    

PERL_MM_USE_DEFAULT=1 perl -MCPAN -e 'install Moose'




</entry>

<entry [Mon Mar 29 20:34:23 EDT 2010] FIXED Error while requiring CPAN::MyConfig BY DOWNLOADING AND SAVING TO ~/.cpan/CPAN/MyConfig.pm>

Error while requiring CPAN::MyConfig:
CPAN/MyConfig.pm did not return a true value at /usr/lib/perl5/5.8.8/CPAN/HandleConfig.pm line 476.


# $Id: MyConfig.pm,v 1.5 2005/02/05 19:08:13 jmates Exp $
#
# Sample MyConfig.pm configuration to install CPAN modules to a custom
# location, such as under a home directory.
#
# 1. Change all occurences of HOMEDIRFIX to your home directory,
#    e.g. /home/user
#
# 2. Review 'makepl_arg' below. For more information on the arguments,
#    read the following documentation using the perldoc(1) command:
#
#    perldoc ExtUtils::MakeMaker
#
# 3. Check the paths to various commands (e.g. wget), proxy settings for
#    your environment, the urllist, and the shell.
#
# 4. Run 'perl -c MyConfig.pm' to ensure the formatting of this file is
#    correct following the edits.

$CPAN::Config = {
  'build_cache' => q[5],
  'build_dir' => q[HOMEDIRFIX/.cpan/build],
  'cache_metadata' => q[1],
  'cpan_home' => q[HOMEDIRFIX/.cpan],
  'dontload_hash' => {  },
  'ftp' => q[/usr/bin/ftp],
  'ftp_proxy' => q[],
  'getcwd' => q[cwd],
  'gzip' => q[/usr/bin/gzip],
  'histfile' => q[HOMEDIRFIX/.cpan/histfile],
  'histsize' => q[100],
  'http_proxy' => q[],
  'inactivity_timeout' => q[0],
  'index_expire' => q[1],
  'inhibit_startup_message' => q[0],
  'keep_source_where' => q[HOMEDIRFIX/.cpan/sources],
  'lynx' => q[ ],
  'make' => q[/usr/bin/make],
  'make_arg' => q[],
  'make_install_arg' => q[],
  'makepl_arg' => q[PREFIX=~/ SITELIBEXP=~/lib/perl5 LIB=~/lib/perl5 INSTALLMAN1DIR=~/share/man/man1 INSTALLMAN3DIR=~/share/man/man3 INSTALLSITEMAN1DIR=~/share/man/man1 INSTALLSITEMAN3DIR=~/share/man/man3],
  'ncftp' => q[ ],
  'ncftpget' => q[ ],
  'no_proxy' => q[],
  'pager' => q[less],
  'prerequisites_policy' => q[ask],
  'proxy_user' => q[],
  'scan_cache' => q[atstart],
  'shell' => q[/bin/sh],
  'tar' => q[/usr/bin/tar],
  'term_is_latin' => q[0],
  'unzip' => q[/usr/bin/unzip],
  'urllist' => [q[http://cpan.llarian.net/], q[ftp://cpan.nas.nasa.gov/pub/perl/CPAN/], q[ftp://cpan.pair.com/pub/CPAN/], q[ftp://ftp.duke.edu/pub/perl/], q[ftp://ftp.cs.colorado.edu/pub/perl/CPAN/], q[ftp://ftp.sunsite.utk.edu/pub/CPAN/], q[http://www.perl.com/CPAN/]],
  'wait_list' => [q[wait://ls6.informatik.uni-dortmund.de:1404]],
  'wget' => q[/usr/bin/wget],
};
1;
__END__

</entry>

<entry [Mon Mar 29 19:59:23 EDT 2010] INSTALL TO /tmp/temp USING CPAN>


o conf makepl_arg PREFIX=/tmp/temp

o conf mbuildpl_arg "--prefix /tmp/temp"

o conf commit



</entry>

<entry [Fri Mar 12 04:42:33 EST 2010] INSTALL XML::Simple ON PEGASUS>

mkdir ~/.cpan
mkdir ~/.cpan/CPAN

# Create a Config.pm for the CPAN module with $CPAN::Config empty
echo "\$CPAN::Config = {}" > ~/.cpan/CPAN/MyConfig.pm


# MAKE MAN PATHS
mkdir -p /nethome/bioinfo/apps/agua/0.4/lib/external/man/man1
mkdir -p /nethome/bioinfo/apps/agua/0.4/lib/external/man/man3


# START CPAN
perl -e shell -MCPAN 

# SET PREFIX, LIB AND MAN DIRS
o conf makepl_arg "LIB=/nethome/bioinfo/apps/agua/0.4/lib/external \
INSTALLMAN1DIR=/nethome/bioinfo/apps/agua/0.4/lib/external/man/man1 \
INSTALLMAN3DIR=/nethome/bioinfo/apps/agua/0.4/lib/external/man/man3"

# AND THEN 
o conf PREFIX "/nethome/bioinfo/apps/agua/0.4/lib/external"

o conf commit 




</entry>

<entry [Thu Mar  4 10:08:08 EST 2010] AVOID ERROR AS NON-ROOT USER: Couldn't create directory /root/.cpan.>



ERROR
=====

perl -e shell -MCPAN

    Couldn't create directory /root/.cpan.
    Please retry.
    CPAN build and cache directory? [/root/.cpan]


SOLUTION
========

mkdir ~/.cpan
mkdir ~/.cpan/CPAN

# Create a Config.pm for the CPAN module with $CPAN::Config empty
echo "\$CPAN::Config = {}" > ~/.cpan/CPAN/MyConfig.pm


# MAKE MAN PATHS
mkdir -p /nethome/bioinfo/apps/agua/0.4/lib/external/man/man1
mkdir -p /nethome/bioinfo/apps/agua/0.4/lib/external/man/man3


# START CPAN
perl -e shell -MCPAN 


# SET PREFIX, LIB AND MAN DIRS
o conf makepl_arg "LIB=/nethome/bioinfo/apps/agua/0.4/lib/external \
INSTALLMAN1DIR=/nethome/bioinfo/apps/agua/0.4/lib/external/man/man1 \
INSTALLMAN3DIR=/nethome/bioinfo/apps/agua/0.4/lib/external/man/man3"

# AND THEN 
o conf PREFIX "/nethome/bioinfo/apps/agua/0.4/lib/external"

o conf commit 





# ENTER CPAN URLS

MANUALLY

o conf init urllist

PUSH ONTO LIST

o conf urllist push "CPAN URL"


o conf urllist push "http://mirror.atlantic.net/pub/CPAN/"
o conf urllist push "ftp://mirror.atlantic.net/pub/CPAN/"
o conf urllist push "http://mirror.candidhosting.com/pub/CPAN"
o conf urllist push "ftp://mirror.candidhosting.com/pub/CPAN"


CPAN URL LIST

http://www.cpan.org/SITES.html


florida urls

ftp://ftp.cise.ufl.edu/pub/mirrors/CPAN/
http://mirror.atlantic.net/pub/CPAN/
ftp://mirror.atlantic.net/pub/CPAN/
http://mirror.candidhosting.com/pub/CPAN
ftp://mirror.candidhosting.com/pub/CPAN

exit the cpan interactive shell again and modify your env vars to point at the new locations




http://themayesfamily.com/blogs/b/
http://www.dcc.fc.up.pt/~pbrandao/aulas/0203/AR/modules_inst_cpan.html




exit the cpan interactive shell again and modify your env vars to point at the new locations
export PERL5LIB=${PERL5LIB}:~/perl/lib (If you want this to be permanent then modify your ~/.bashrc)
restart the cpan interactive shell and you’re set to start installing



</entry>

<entry [Wed Feb 17 02:40:02 EST 2010] INSTALL TO LOCAL DIRECTORY>


You can also use CPAN to install modules in your local directory.

First enter the CPAN shell, then set the arguments for the commands "perl Makefile.PL" and "./Build install", like this:

perl -e shell -MCPAN

cpan>o conf makepl_arg PREFIX=/home/users/dag/My_Local_Perl_Modules
cpan>o conf mbuildpl_arg "--prefix /home/users/dag/My_Local_Perl_Modules"
cpan>o conf commit



