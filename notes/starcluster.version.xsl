agua


<entry [Mon 2012:10:15 02:36:21 EST] STARCLUSTER 3-4 0.92.0-rc.2+build.4 Patched 0.92rc2 for Agua 0.8.0-alpha.1+build.37>

/agua/bin/scripts/stager.pl \
--stagefile /repos/private/syoung/starclusterdev/stager.pm \
--version 0.92.0-rc2+build.4 \
--mode 3-4 \
--message "Patched 0.92rc2 for Agua 0.8.0-alpha.1+build.37

The following StarCluster files were modified to enable Agua to use
StarCluster for cluster management:

bin/starcluster
check.py
clean.py
docs/epydoc/build.sh
docs/sphinx/make.bat
starcluster/balancers/sge/__init__.py
starcluster/cli.py
starcluster/cluster.py
starcluster/clustersetup.py
starcluster/commands/loadbalance.py
starcluster/commands/start.py
starcluster/config.py
starcluster/logger.py
utils/gitlog2changelog.py
utils/s3mount.py
utils/webserver.py

" \
--SHOWLOG 4


PUSHED TO GITHUB (HAD TO USE --force):

/mnt/repos/public/agua/starcluster# git push -u github --force

    Counting objects: 9, done.
    Delta compression using up to 2 threads.
    Compressing objects: 100% (4/4), done.
    Writing objects: 100% (7/7), 1020 bytes, done.
    Total 7 (delta 1), reused 0 (delta 0)
    To git@github.com:agua/StarCluster
     + 0c528a3...a5c8d85 master -> master (forced update)
    Branch develop set up to track remote branch develop from github.
    Branch master set up to track remote branch master from github.



GOT LIST OF ALL FILES CHANGED FROM ORIGINAL:

cd /repos/public/agua/starclusterdev
gitdiff 2c149cb e1a4858

    M       bin/starcluster
    A       bin/starcluster.EDITED
    M       check.py
    M       clean.py
    M       docs/epydoc/build.sh
    M       docs/sphinx/make.bat
    A       jtriley-StarCluster-dca702e/.gitignore
    M       starcluster/balancers/sge/__init__.py
    M       starcluster/cli.py
    M       starcluster/cluster.py
    M       starcluster/clustersetup.py
    M       starcluster/commands/loadbalance.py
    M       starcluster/commands/start.py
    M       starcluster/config.py
    M       starcluster/logger.py
    M       utils/gitlog2changelog.py
    M       utils/s3mount.py
    M       utils/webserver.py



</entry>
<entry [Mon 2012:10:15 02:36:21 EST] STARCLUSTER 2-3 0.92.0-rc.2+build.4 -Add gitattribute: stager.pm and stager.conf>

NB: BUMPED STAGE 2 TO 0.92.0-rc.2+build.3 TO REMOVE stager.conf AND stager.pm

/agua/bin/scripts/stager.pl \
--stagefile /repos/private/syoung/starclusterdev/stager.pm \
--version 0.92.0-rc2+build.4 \
--mode 2-3 \
--message "-Del stager.pm and stager.conf" \
--SHOWLOG 4

</entry>
<entry [Mon 2012:10:15 02:30:10 EST] STARCLUSTER 1-2 0.92.0-rc.2+build.4 -Add gitattribute: stager.pm and stager.conf>

NB: BUMPED STAGE 2 TO 0.92.0-rc.2+build.3 TO REMOVE stager.conf AND stager.pm

/agua/bin/scripts/stager.pl \
--stagefile /repos/private/syoung/starclusterdev/stager.pm \
--version 0.92.0-rc2+build.4 \
--mode 1-2 \
--message "-Del stager.pm and stager.conf" \
--SHOWLOG 4

</entry>
<entry [Mon 2012:10:15 02:25:10 EST] STARCLUSTER 1-2 0.92.0-rc.2+build.2 -Add gitattribute: stager.pm and stager.conf>

/agua/bin/scripts/stager.pl \
--stagefile /repos/private/syoung/starclusterdev/stager.pm \
--version 0.92.0-rc2+build.2 \
--mode 1-2 \
--message "-Add gitattribute: stager.pm and stager.conf" \
--SHOWLOG 4

</entry>
<entry [Mon 2012:10:15 02:04:10 EST] STARCLUSTER 1-2 0.92.0-rc.2+build.1 +Add stager.conf AND stager.pm>
    
/agua/bin/scripts/stager.pl \
--stagefile /repos/private/syoung/starclusterdev/stager.pm \
--version 0.92.0-rc2+build.1 \
--mode 1-2 \
--message "Added stager.pm (basic) and stager.conf

Added stager.pm and stager.conf to .gitignore
" \
--SHOWLOG 4

WHERE stager.conf IS:

[defaults]
PACKAGE     starcluster
OUTPUTDIR   /tmp


[stage 1]
REPODIR     /repos/private/syoung/starclusterdev
    
[stage 2]
REPODIR     /repos/private/syoung/starcluster

[stage 3]
REPODIR     /repos/public/agua/starclusterdev

[stage 4]
REPODIR     /repos/public/agua/starcluster


</entry>
<entry [Sat 2012:06:30 15:13:36 EST] STARCLUSTER 2-3 First commit of patched 0.92rc2 to enable Agua>

/agua/bin/scripts/transfer.pl \
--repository starcluster \
--outputdir /home/syoung/RELEASE \
--version 0.92.0-rc2 \
--sourcerepo /repos/private/syoung/starcluster \
--targetrepo /repos/public/agua/starclusterdev \
--description "First commit of patched 0.92rc2 to enable Agua"


</entry>
<entry [Sat 2012:06:30 15:13:36 EST] STARCLUSTER 1-2 First commit of patched 0.92rc2 to enable Agua>

/agua/bin/scripts/transfer.pl \
--repository starcluster \
--outputdir /home/syoung/RELEASE \
--version 0.92.0-rc2 \
--sourcerepo /repos/private/syoung/starclusterdev \
--targetrepo /repos/private/syoung/starcluster \
--description "First commit of patched 0.92rc2 to enable Agua"


</entry>
<entry [Sun 2012:09:09 03:15:19 EST] STARCLUSTER 1-2 0.8.0-alpha.1+build28 +Add: Enabled Agua workflows on StarCluster>

/agua/0.6/bin/scripts/version.pl \
--repodir /data/starcluster/0.92rc2/starcluster \
--description "+Add: Enabled Agua workflows on StarCluster" \
--version "0.8.0-alpha+build28"

</entry>

