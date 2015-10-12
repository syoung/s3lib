agua


<entry [Wed 2012:11:21 03:20:11 EST] AGUATEST 2-3 [0.8.0-alpha.1+build.16] Shadows AGUA 0.8.0-alpha.1+build.53>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguatestdev/stager.pm \
--version 0.8.0-alpha.1+build.16 \
--mode 2-3 \
--message "Shadows AGUA 0.8.0-alpha.1+build.53" \
--SHOWLOG 4

    
</entry>
<entry [Wed 2012:11:21 03:20:11 EST] AGUATEST 1-2 [0.8.0-alpha.1+build.16] Shadows AGUA 0.8.0-alpha.1+build.53>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguatestdev/stager.pm \
--version 0.8.0-alpha.1+build.16 \
--mode 1-2 \
--message "Shadows AGUA 0.8.0-alpha.1+build.53" \
--SHOWLOG 4

    
</entry>
<entry [Tue 2012:11:20 12:06:44 EST] AGUATEST 1-2 [0.8.0-alpha.1+build.15] +Fix all: Enabled tests - 100% operational>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguatestdev/stager.pm \
--version 0.8.0-alpha.1+build.15 \
--mode 1-2 \
--message "+Fix all: Enabled tests - 100% operational 

* 2588081 -Del lib/Test/Agua/Uml/Class.pm: Removed print statements
* 2539ce1 -Fix bin/Agua/Uml/Class/Class.t: Corrected no. tests from 6 to 5
* d186b80 -Del lib/Test/Agua/Workflow.pm: minor cleanup of commented code
* 4a3d80f -Fix lib/Test/Agua/StarCluster.pm: all tests ok
* 6117a75 +Add Makefile: updated with 100% of tests enabled
* dae7b6f -Fix bin,lib: StarCluster tests ok - load, clear, startCluster
* 3132e7e -Fix bin/Agua/Ssh/Ssh.t: Added brief doc about ENVARS
* 5444304 -Fix bin/Agua/Common/File/File.t: Set as 'TO DO'
* 7d2ac94 +Fix bin,lib: OK Ssh, StarCluster, Uml (Class, Role, Uml) & Workflow
* cb24bc7 +Fix lib/Test/Agua/Ops/Version: incrementVersion tests tag clash
* 32df007 +Fix lib/Test/Agua/View - ok after added setUpTestDatabase
" \
--SHOWLOG 4

    
</entry>
<entry [Wed 2012:11:14 00:11:12 EST] AGUATEST 1-2 [0.8.0-alpha.1+build.14] +Add: Stager, Uml, Cluster multi-status start>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguatestdev/stager.pm \
--version 0.8.0-alpha.1+build.14 \
--mode 1-2 \
--message "+Fix html: tests 100% completed successfully 

* 8d90995 -Del bin/Conf/Json: all input data/names/*.json files with ':' in them
* 4c9773f +Add html/plugins: All functional tests included in runTests.html
* 8c59233 -Add .gitattributes: excluded all non-functioning tests
* 2c225d7 -Del bin,lib: View/JBrowse files - restore later
* bae0859 (github/master, bit/master) +Fix lib/Test/Agua/Ops/Install: wrong testuser mysql password
* 550faf0 +Fix bin/Agua/Common/Package/Upgrade: Enabled addRemote, htmlLog
* 2f7f08c +Fix lib/Test/Agua/Common/Package/Upgrade.pm now working
* 61e4c45 +Add lib/Test/Conf/Json/outputs: .dummy to keep dir in repo
* 9363a79 -Onw Almost completed all tests
* e0df83a +Add lib,bin: Moved SCInstance toStarCluster::Instance

" \
--SHOWLOG 4

    
</entry>
<entry [Wed 2012:11:14 00:11:12 EST] AGUATEST 1-2 [0.8.0-alpha.1+build.13] +Add: Stager, Uml, Cluster multi-status start>

* 8d90995 (HEAD, tag: 0.8.0-alpha.1+build.13, lin/master, master) -Del bin/Conf/Json: all input data/names/*.json files with ':' in them

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguatestdev/stager.pm \
--version 0.8.0-alpha.1+build.13 \
--mode 1-2 \
--message "-Del bin/Conf/Json: all input data/names/*.json files with ':' in them" \
--SHOWLOG 4


</entry>
<entry [Fri 2012:11:16 02:54:07 EST] FIXED ALL html TESTS, UPDATED .gitattributes>

NB: runstatus SUBTESTS NOT APPEARING IN runTests.html

cat .gitattributes 

    bin/Conf/StarCluster.t          export-ignore
    bin/Monitor/LSF                 export-ignore
    bin/Agua/Common/File	        export-ignore
    cgi-bin                         export-ignore
    dump/agua.2*                    export-ignore
    .gitattributes                  export-ignore
    html/plugins/admin              export-ignore
    html/plugins/core/bookmark      export-ignore
    html/plugins/core/data          export-ignore
    html/plugins/core/filecache     export-ignore
    html/plugins/dojox              export-ignore
    starcluster			            export-ignore
    html/plugins/workflow/clusterstatus export-ignore
    html/plugins/workflow/execute       export-ignore
    html/plugins/workflow/filemanager   export-ignore
    html/plugins/workflow/getstatus     export-ignore
    html/plugins/workflow/grid          export-ignore
    html/plugins/workflow/parameters    export-ignore
    html/plugins/workflow/sql           export-ignore
    html/plugins/workflow/sync          export-ignore
    html/plugins/workflow/workflows     export-ignore


    
</entry>
<entry [Thu 2012:11:15 02:54:50 EST] FIXED ALL bin/lib TESTS>

MISCELLANEOUS
-------------
#### DONE #### Agua::Common::Hub
#### DONE #### Agua::Common::Logger
#### DONE #### Agua::Common::Package::Default
#### DONE #### Agua::Common::Package::Insert
#### DONE #### Agua::Common::Package::Sync
#### DONE #### Agua::Common::Package::Upgrade
#### DONE #### Agua::Configure FAILED TO COMPILE
#### DONE #### Agua::Folders test 4

REQUIRE ENVARS
--------------
#### DONE #### Agua::Ops::GitHub
#### DONE #### Agua::Ops::Version 
#### DONE #### Agua::Ops::Install

MOVED
-----
#### DONE #### Agua::SCInstance - moved to Agua::Instance::StarCluster

MISSING outputs DIR
-------------------
#### DONE #### Conf::Json

    
</entry>
<entry [Wed 2012:11:14 00:11:12 EST] AGUATEST 1-2 [0.8.0-alpha.1+build.12] +Add: Stager, Uml, Cluster multi-status start>

/agua/bin/scripts/stager.pl \
--stagefile /agua/repos/private/syoung/aguatestdev/stager.pm \
--version 0.8.0-alpha.1+build.12 \
--mode 1-2 \
--message "+Add: Stager, Uml, Cluster multi-status start

Done  lib: Sync workflows and apps
Added lib: Stager tests
Added lib: Uml tests
Added lib: Workflow/StarCluster tests
Added html: Workflow cluster multi-status start


* b9b5afa +Add html/plugins/workflow/runstatus/startup & .gitattributes
* 873186a -Del html/plugins/workflow/module.js: removed workflow/execute test
* 4fba75a -Fix .gitignore: excludes html/plugins/workflow partially
* 035d595 +Add html/plugins/workflow/runstatus/status & duration
* bca9ba6 -Onw bin,lib: getWorkflowStatus ok, fixing executeWorkflow
* 8dd2bc1 +Add dump/create.dump: added 'status' filed to workflow & project
* f896358 +Add: bin,lib: Workflow added tests get/updateClusterWorkflow
* 4d3552a +Add bin,lib: Workflow 26 tests completed
* 78a16a1 -Onw bin,lib: Workflow tests - onw Workflow::getStatus
* f34db2e -Onw bin,lib: Workflow - finishing off tests
* a1761c6 +Add lib/Agua/Test/StarCluster: added overrideSequence
* 8f23143 -Onw bin,lib: Workflow::executeWorkflow test
* f7a1e39 -Fix: bin/Agua/Workflow/input/startStarCluster: aws & starcluster
* 8f6ebcf -Onw bin,lib: Workflow::startStarCluster returned pid
* 6dc8eed +Add lib: StarCluster/Workflow added *tsv files and override method
* 0f56533 +Add  bin/Agua/Workflow/inputs: load/startstarcluster *.tsv files
* 2569e0e -Onw lib/Test/Agua/Workflow: testing load/startStarCluster
* 4323014 -Onw lib: tidied SC, onw Workflow tests
* ac2349a -Add lib/Agua/Workflow: ex setStarClusterObject to loadStarCluster
* ac9a58a -Onw lib/Test/Agua/Workflow: StarCluster - changed new to loads
* 5624446 -Onw lib/Test/Agua/StarCluster:       ok clear/load, onw method redefines
* 427920d +Add lib/Test/Agua/StarCluster: redefined subroutine
* aa8ca6e -Onw bin,lib: Workflow::executeWorkflow/startStarCluster
* 45cf263 +Add bin/Agua/Workflow/inputs: fastqc input files
* 1c224b8 -Del lib/Test/Agua/Ops/Stager: remove emptylines
* 780d9df -Onw StarCluster - OO method reference
* a93a516 -Onw bin,lib: ok Uml::roleUser(s), userRoles, onw allUserRoles
* 2273f52 -Onw bin,lib: Stager - currently preTests
* aa64b9f +Add: HTML login/load test, onw: override handleLogin
* 3b52f40 +Add: Tests for newly added Agua::Ssh
* 0188f4f +Add: Agua::Ops::Sge and Agua::StarCluster tests
* ef5d183 -Add: Input and output dirs for Common::Ssh tests
* 5cf36b7 +Add: Test Common::Ssh::remoteCommand returns stderr too
* 9e2233d +Add: Added home/github to list of executed tests
* b29ec4f +Add: new home/progresspane and completed home/github
* 413df92 -Fix: Onw plugins/home/progresspane - dockNode CSS
* 466af06 +Add: Test plugins/admin/hub - sync App/Workflow buttons
* 6c21aad -Add: Onworking add admin/hub tests
* 23f8499 -Fix: Almost completed syncWorkflows
* 6469f23 -Fix: Refactored _syncResources with all inside biorepo
* 9a958b1 +Add: All tests 100% after add Hub
* 2d328bc -Add: Onw GitHub.pm test forkRepo
* c4992ce +Add: Settings, Sync and Hub. Refactored GitHub

" \
--SHOWLOG 4

    
</entry>

<entry [Thu 2012:07:19 23:48:49 EST] AGUATEST 1-2 [0.8.0-alpha+build11] -Fix: Tests workflow/execute and folders/copyfile ok>
    
/agua/bin/scripts/transfer.pl \
--repository aguatest \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build11 \
--sourcerepo /repos/private/syoung/aguatestdev \
--targetrepo /repos/private/syoung/aguatest \
--description "-Fix: Tests workflow/execute and folders/copyfile ok"
    
    
</entry>

<entry [Thu 2012:07:19 19:10:30 EST] AGUATEST 1-2 [0.8.0-alpha+build10] -Fix: Tests 100%, onworking cluster start/stop>

1. /agua/t TO /repos/private/syoung/aguatestdev AND LINKED BACK

2. CLEANED UP PREVIOUS ERRONEOUS TAGS (AND THEIR COMMIT MESSAGES)

/repos/private/syoung/aguatest - LEFT ONLY 0.8.0-alpha.1+build9


LATER: CHANGE
* 64494e9 [0.8.0-alpha+build9] +Fix: Move tests dev to autonomous linked dir
TO
* 64494e9 +Fix: Move tests dev to autonomous linked dir



3. DID TRANSFER

/agua/bin/scripts/transfer.pl \
--repository aguatest \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1+build10 \
--sourcerepo /repos/private/syoung/aguatestdev \
--targetrepo /repos/private/syoung/aguatest \
--description "-Fix: Tests 100%, onworking cluster start/stop"

    OK
/repos/private/syoung/aguatest$ gitlog
    * d43e170 (HEAD, tag: 0.8.0-alpha.1+build10, master) -Fix: Tests 100%, onworking cluster start/stop
    * 279de1a -Fix: Pre-rebase to remove tag from commit message
    
</entry>
<entry [Sat 2012:06:30 15:13:36 EST] AGUATEST 2-3 [0.8.0-alpha.1] +Add: Moved agua/t to linked directory>

/agua/bin/scripts/transfer.pl \
--repository aguatest \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha.1 \
--sourcerepo /repos/private/syoung/aguatest \
--targetrepo /repos/public/agua/aguatestdev \
--description "+Add: Moved agua/t to linked directory"

    Created new version: 0.8.0-alpha.1

</entry>
<entry [Sat 2012:06:30 15:13:36 EST] AGUATEST 1-2 [0.8.0-alpha+build10] -Fix: getRemoteTagsTimeout, add fetchResetRemoteRepo>

/agua/bin/scripts/transfer.pl \
--repository aguatest \
--outputdir /home/syoung/RELEASE \
--versiontype build \
--sourcerepo /repos/private/syoung/aguatestdev \
--targetrepo /repos/private/syoung/aguatest \
--description "-Fix: getRemoteTagsTimeout, add fetchResetRemoteRepo"

    Created new version: 0.8.0-alpha+build10



</entry>

<entry [Tue 2012:06:26 23:53:37 EST] AGUATEST 1-2 [0.8.0-alpha+build9] +Fix: Move tests dev to autonomous linked dir>

REMOVED ACCIDENTALLY-ADDED TAGS (15.1.1, 15.1.0, ETC.) FROM aguatestdev

cd /repos/private/syoung/aguatestdev

git tag -d `git tag --list | egrep -e "^15"`
git tag -d `git tag --list | egrep -e "^14"`
git tag -d `git tag --list | egrep -e "^13"`
(OR
git tag -l '15.*'
)
...

OR JUST DELETE ALL:

git tag -d `git tag --list`

AND REPLACE EXISTING TAG:

git tag -a 0.8.0-alpha.1+build7 -m "-Fix: Onw tests for 0.8.0-alpha, doing installTests" 857bb35


/agua/bin/scripts/transfer.pl \
--repository aguatestdev \
--outputdir /home/syoung/RELEASE \
--version 0.8.0-alpha+build9 \
--sourcerepo /repos/private/syoung/aguatestdev \
--targetrepo /repos/private/syoung/aguatest \
--description "+Fix: Move tests dev to autonomous linked dir"

</entry>
