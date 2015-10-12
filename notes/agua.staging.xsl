agua.staging



<entry [Tue 2013:10:01 11:30:23 EST] AGUA >
    
    
</entry>
<entry [Fri 2012:10:26 13:01:39 EST] STARCLUSTER>

SEE agua.blueprint.xsl
[Sat 2012:10:13 00:22:35 EST] STARCLUSTER STAGING


WHY STARCLUSTER IS SEPARATE FROM THE AGUA DISTRIBUTION:

1. ALLOWS FOR PATCHED 'SNAPSHOTS' OF STARCLUSTER RELEASES

2. PROVIDE TWO-LEVEL PUBLIC RELEASES - 'DEVEL' AND 'STABLE'

3. FOLLOWS SEMVER BUILD/PATCH/MINOR INCREMENT SYSTEM


PROCEDURE 1-2:

    1. ADD CHANGES AS INCREMENT BUILD/PATCH/MINOR VERSION

    2. RUN TESTS ON REMOTE
    
    
PROCEDURE 2-3:

    1. VERIFY INSTALLTION WORKS WITH agua USER
    
    2. INCREMENT BUILD/PATCH/MINOR VERSION
    
    3. 'DEVEL' RELEASE
    

PROCEDURE 3-4:

    1. INCREMENT VERSION (major, minor, patch, alpha/beta/rc AND BUILD)

        WHY BUILD? BECAUSE WE ARE CONSTRAINED BY HAVING TO SHADOW THE
        
        VERSION NUMBER OF STARCLUSTER, I.E., 0.92.0-rc.2
    
    2. 'STABLE' RELEASE



1   syoung:starclusterdev (PRIVATE)
    Ongoing patches of StarCluster to fix bugs and enable Agua
    /agua/starcluster --> /repos/private/syoung/starclusterdev

    git remote add bit ssh://git@bitbucket.org/stuartpyoung/starclusterdev.git
    git remote add github git@github.com:syoung/starclusterdev
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/starclusterdev
    git remote add upstream https://github.com/jtriley/StarCluster.git


2   syoung:starcluster (PRIVATE)
    Staging area for patches of StarCluster to fix bugs and enable Agua
    /repos/private/syoung/starcluster

    git remote add bit ssh://git@bitbucket.org/stuartpyoung/starcluster.git
    git remote add github git@github.com:syoung/starcluster
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/starcluster

    
3   agua:starclusterdev (PUBLIC, builds)
    'Devel' release of patched StarCluster for Agua cloud workflows platform
    /repos/public/agua/starclusterdev

    git remote add github git@github.com:agua/StarClusterDev
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/starclusterdev
    git remote add bit ssh://git@bitbucket.org/aguadev/starclusterdev.git


4   agua:starcluster (PUBLIC, major, minor, patch - production)
    'Stable' release of patched StarCluster for Agua cloud workflows platform
    /repos/public/agua/starcluster

    git remote add github git@github.com:agua/StarCluster
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/starcluster
    git remote add bit ssh://git@bitbucket.org/aguadev/starcluster.git

    
</entry>
<entry [Fri 2012:10:26 13:00:33 EST] AGUATEST>
    
       
SEE agua.blueprint.xsl
[Wed 2012:06:27 01:11:35 EST] AGUATEST STAGING


WHY AGUATEST IS SEPARATE:

1. INITIALLY, TO ALLOW CONCURRENT DEVELOPMENT OF MORE COMPLETE TESTS FOR EXISTING FUNCTIONALITY WHILST DEVELOPING NEW AGUA FUNCTIONALITY

2. SEPARATE THE LARGE TEST FILES FROM THE AGUA DISTRIBUTION (BUT NOW ACTUALLY SHIFTED OVER TO /data)

3. LATER - REINTEGRATE TESTS INTO AGUA TO SAVE ON DUPLICATION?

4. 'DEVEL' REPO OF agua:aguatest NEEDED TO MIRROR AGUA 'DEVEL' REPO


AGUATEST STAGING MIRRORS AGUA STAGING:

1. TESTS MAY BE ADDED WITH EACH BUILD/PATCH/MINOR INCREMENT

2. TESTS MUST BE BACKWARDS-COMPATIBLE TO THE SAME MAJOR VERSION OF AGUA
    
    (I.E., THE TESTS DEFINE THE API, SO THEY MUST BE COMPATIBLE WITH ALL SAME-VERSION CODE WHERE THE API IS UNCHANGED)

3. FOR EACH AGUA BUILD, CREATE A MATCHING AGUATEST BUILD  


PROCEDURE 1-2:

    1. ADD TESTS AS INCREMENT BUILD/PATCH/MINOR VERSION

    2. FOR EACH AGUA BUILD, CREATE A COMPLEMENTARY AGUATEST BUILD USING transfer.pl
    
    3. RUN TESTS ON REMOTE
    
    
PROCEDURE 2-3:

    1. transfer.pl
    
    2. REMOVE TAG

    3. RUN SCRIPTS OR MAKE CHANGES syoung --> agua

    4. RESTORE TAG
    
    5. RUN TESTS ON REMOTE
    

PROCEDURE 3-4:

    1. transfer.pl (major, minor, patch, alpha/beta/rc.N - no build)
    

1   syoung:aguatestdev (PRIVATE)
    Daily ongoing development of tests for Agua cloud workflow platform
    /agua/t --> /repos/private/syoung/aguatestdev

    git remote add bit ssh://git@bitbucket.org/stuartpyoung/aguatestdev.git
    git remote add github git@github.com:syoung/aguatestdev
    git remote add linode ssh://root@173.230.142.248/srv/git/private/syoung/aguatestdev


2   syoung:aguatest (PRIVATE)
    Tests for development (unstable) code for Agua cloud workflow platform
    /repos/private/syoung/aguatest

    git remote add bit ssh://git@bitbucket.org/stuartpyoung/aguatest.git
    git remote add github git@github.com:syoung/aguatest
    git remote add linode ssh://root@173.230.142.248/srv/git/private/syoung/aguatest


3   agua:aguatestdev (PUBLIC, builds)
    Daily ongoing development of tests for Agua cloud workflow platform
    /repos/public/agua/aguatestdev

    git remote add github git@github.com:agua/aguatestdev
    git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/aguatestdev
    git remote add bit ssh://git@bitbucket.org/agua/aguatestdev.git


4   agua:aguatest (PUBLIC, major, minor, patch - production)
    Tests for Agua cloud workflow platform
    /repos/public/agua/aguatest

    git remote add github git@github.com:agua/aguatest
    git remote add linode ssh://root@173.230.142.248/srv/git/public/agua/aguatest
    git remote add bit ssh://git@bitbucket.org/agua/aguatest.git
    

</entry>
<entry [Fri 2012:10:26 13:00:09 EST] BIOREPOSITORY>
    
SEE agua.blueprint.xsl
[Wed 2012:06:27 01:10:38 EST] BIOREPOSITORY STAGING

PROCEDURE 1-2:
    1. DEVELOP NEW PACKAGE IN syoung:biorepodev
    2. COPY TO syoung:biorepository AND INCREMENT BUILD/PATCH/MINOR VERSION
    3. RUN TESTS ON REMOTE, E.G. UPLOAD CHANGES TO agua.pm, bioapps.pm
    4. WHEN CHANGES ARE COMPLETE, STOP AND INCREMENT PATCH

PROCEDURE 2-3:
    1. ADD SELECTED NEW PACKAGES MANUALLY TO agua:biorepodev
    2. RUN SCRIPTS OR MANUALLY CHANGE, E.G., OWNER syoung --> agua
    3. ADD SAME TAG AS syoung:biorepository COUNTERPART
    4. VERIFY THAT VERSION INSTALLS AND WORKS OK
    
PROCEDURE 3-4:
    1. transfer.pl TO agua:biorepository
    (major, minor, patch, alpha/beta/rc.N - no build)


1   syoung:biorepodev (PRIVATE)
    /repos/private/syoung/biorepodev
    Various *.pm scripts for installing bioinformatics packages.
    Development for agua biorepository (biorepository.pm).
    Development for Agua and Bioapps installation: agua.pm, bioapps.pm.

    git remote add github git@github.com:syoung/biorepodev
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/biorepodev
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/biorepodev.git

    
2   syoung:biorepostage (PRIVATE)
    Staging point for debugging discrete build increments of 'biorepository'.
    /repos/public/syoung/biorepostage

    git remote add github git@github.com:syoung/biorepostage
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/biorepostage
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/biorepostage.git

    
3   agua:biorepodev (PUBLIC)
    Public 'development' builds of 'biorepository' life sciences software and data sources.
    /repos/public/agua/biorepodev

    git remote add github git@github.com:agua/biorepodev
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/biorepodev
    git remote add bit ssh://git@bitbucket.org/aguadev/biorepodev.git


4   agua:biorepository (PUBLIC)
    Public repository (stable version) of life sciences software and data sources.
    /repos/public/agua/biorepository

    git remote add github git@github.com:agua/biorepository
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/biorepository
    git remote add bit ssh://git@bitbucket.org/aguadev/biorepository.git


    

NOTE: syoung's BIOREPOSITORY IS HERE:

1   syoung:private (PRIVATE)
    (syoung's private repository of life sciences software and data sources)
    /repos/private/syoung/private

    git remote add github git@github.com:syoung/private
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/private
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/private.git


2   syoung:biorepository (PUBLIC)
    (syoung's public repository of life sciences software and data sources)
    /repos/public/syoung/biorepository

    git remote add github git@github.com:syoung/biorepository
    git remote add lin ssh://root@173.230.142.248/srv/git/public/syoung/biorepository
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/biorepository.git


    
</entry>
<entry [Fri 2012:10:26 12:59:05 EST] BIOAPPS>
    
SEE agua.blueprint.xsl
[Wed 2012:06:27 01:09:53 EST] BIOAPPS STAGING

 
WHY IS BIOAPPS SEPARATE FROM AGUA?

1. SEPARATION OF PURPOSES - EASIER TO MAINTAIN

2. bioapps CAN HAVE MULTIPLE CONTRIBUTORS. CODE IS PULLED AND TESTED BY syoung (AVAILABLE PRIVATELY AT syoung:biorepostage) THEN ADDED TO agua:biorepodev (DEVELOPMENT) AND agua:biorepository (STABLE)



PROCEDURE 1-2: (PRIVATE DEVEL)
    1. ADD TESTS AS INCREMENT BUILD/PATCH/MINOR VERSION
    2. RUN TESTS ON REMOTE

PROCEDURE 2-3: (PUBLIC DEVEL)
    1. transfer.pl
    2. REMOVE TAG
    3. RUN SCRIPTS OR MAKE CHANGES syoung --> agua
    4. RESTORE TAG
    5. RUN TESTS ON REMOTE
    
PROCEDURE 3-4: (PUBLIC RELEASE)
    1. transfer.pl (major, minor, patch, alpha/beta/rc.N - no build)


1   syoung:bioappsdev (PRIVATE)
    /repos/private/syoung/bioappsdev --> /agua/bioapps

    git remote add github git@github.com:syoung/bioappsdev
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/bioappsdev
    git remote add bit git@bitbucket.org:stuartpyoung/bioappsdev.git


2   syoung:bioapps (PRIVATE)
    /repos/private/syoung/bioapps

    git remote add bit git@bitbucket.org:stuartpyoung/bioapps.git
    git remote add github git@github.com:syoung/bioapps
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/bioapps

   
3   agua:bioappsdev                  OK
    /repos/public/agua/bioappsdev  

    git remote add bit git@bitbucket.org:aguadev/bioappsdev.git
    git remote add github git@github.com:agua/bioappsdev
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/bioappsdev

4   agua:bioapps                     OK
    /repos/public/agua/bioapps  

    git remote add bit git@bitbucket.org:agua/bioapps.git
    git remote add github git@github.com:agua/bioapps
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/bioapps
 
</entry>

<entry [Fri 2012:10:26 12:58:02 EST] AGUA>
  
SEE agua.blueprint.xsl
[Wed 2012:06:27 01:09:26 EST] AGUA STAGING
  

MOTIVATION:

1. HIDE THE INDIVIDUAL COMMITS BUT RETAIN THE PAPERTRAIL IN THE DEV REPO
    (NB: FILES IN .gitignore AND .gitattributes ARE NOT IN THE CLONED agua)

2. ONLY SHOW VERSION CHANGES (BUILDS, PATCHES, ETC.) IN THE NEXT REPO

3. NEED VERSIONS TO INSTALL BUILDS/PATCHES WITH REMOTE 'UPGRADE' TOOL

4. TRANSFER TO AGUA DEVEL USING COMPATIBLE VERSION SYSTEM

5. MAINTAIN A TWO-LEVEL RELEASE - DEVEL (UNSTABLE) AND PRODUCTION (STABLE)


    
PROCEDURE 1-2 (TEST DEVEL ON REMOTE):

    1. MAKE CHANGES, COMMITTING REGULARLY
    
    2. WHEN READY TO TEST ON REMOTE, transfer.pl AND INCREMENT BUILD
    
    3. TEST ON REMOTE
    
    4. INCREMENT PATCH WHEN CHANGES ARE COMPLETE

git push
git push --tags
git push bit
git push bit --tags
git push linode
git push linode --tags

PROCEDURE 2-3 (PUBLISH DEVEL):

    1. transfer.pl (INCREMENT BUILD)
    
    2. REMOVE TAG

    3. RUN SCRIPTS OR MAKE CHANGES syoung --> agua

    4. RESTORE TAG
    
    5. RUN TESTS ON REMOTE

    
PROCEDURE 3-4 (PUBLISH PRODUCTION):

    1. transfer.pl (major, minor, patch, alpha/beta/rc.N - no build)

    
1   syoung:aguadev (PRIVATE, builds)
    Builds of Agua (Transfer to private repo syoung:agua for testing)
    /repos/private/syoung/aguadev --> /agua
    
    git remote add github git@github.com:syoung/aguadev
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/aguadev
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/aguadev.git

2   syoung:agua (PRIVATE, builds)
    Development (unstable) code for Agua cloud workflow platform
    /repos/private/syoung/agua

    git remote add github git@github.com:syoung/agua
    git remote add lin ssh://root@173.230.142.248/srv/git/private/syoung/agua
    git remote add bit ssh://git@bitbucket.org/stuartpyoung/agua.git

3   agua:aguadev (PUBLIC, builds)
    Development (unstable) code for Agua cloud workflow platform
    /repos/public/agua/aguadev

    git remote add github git@github.com:agua/aguadev
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/aguadev
    git remote add bit ssh://git@bitbucket.org/agua/aguadev.git

4   agua:agua (PUBLIC, major, minor, patch - production)
    Stable release of Agua cloud workflow platform 
    (NB: Patches are released often, similar to nightly build)
    /repos/public/agua/agua

    git remote add github git@github.com:agua/agua
    git remote add lin ssh://root@173.230.142.248/srv/git/public/agua/agua
    git remote add bit ssh://git@bitbucket.org/syoung/agua.git

    
</entry>
