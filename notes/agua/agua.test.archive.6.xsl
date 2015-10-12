agua.test.archive.6

<entry [Sun 2012:12:02 05:37:17 EST] FAILED TESTS AFTER GLOBAL CHANGE sessionId TO '1234567890.1234.123'>

Agua::Install

cd ./bin/Agua/Ops/Install; prove --blib --verbose *.t; cd ../../../..
Install.t .. 
1..9
ok 1 - updateConfig    expected file output
ok 2 - loadConfig    expected file output
# Test parseReport
ok 3 - correct version: 0.8.0-alpha.1+build7
ok 4 - correct version: 0.8.0-alpha.1+build7
ok 5 - correct version: 0.7.2
# Test installAgua
Cloning from remote repo: agua (owner: agua)
^[[1;2Aok 6 - install    installed version
ok 7 - install    package table entry
# Test installBioApps
Cloning from remote repo: bioapps (owner: agua)
ok 8 - install    installed version
ok 9 - install    package table entry
# Test installTests
Cloning from remote repo: aguatestdev (owner: agua)
ok 10 - install    installed version
ok 11 - install    package table entry
# Looks like you planned 9 tests but ran 11.
Dubious, test returned 255 (wstat 65280, 0xff00)
All 9 subtests passed 

Test Summary Report
-------------------
Install.t (Wstat: 65280 Tests: 11 Failed: 2)
  Failed tests:  10-11
  Non-zero exit status: 255
  Parse errors: Bad plan.  You planned 9 tests but ran 11.
Files=1, Tests=11, 166 wallclock secs ( 0.10 usr  0.00 sys + 47.56 cusr 22.79 csys = 70.45 CPU)
Result: FAIL




Agua::Configure

cd ./bin/Agua/Configure; prove --blib --verbose *.t; cd ../../..
Configure.t .. # Test enableSsh

ok 1 - enableSsh    correct value for PasswordAuthentication
ok 2 - enableSsh    authenticates for root user
# Test disableSsh
ok 3 - disableSsh    correct value for PasswordAuthentication
ok 4 - enableSsh    authenticates for root user
# Tests were run but no plan was declared and done_testing() was not seen.
All 4 subtests passed 

Test Summary Report
-------------------
Configure.t (Wstat: 0 Tests: 4 Failed: 0)
  Parse errors: No plan found in TAP output
Files=1, Tests=4, 19 wallclock secs ( 0.09 usr  0.00 sys +  8.39 cusr  0.41 csys =  8.89 CPU)
Result: FAIL


Agua::Uml::Class

cd ./bin/Agua/Uml/Class; prove --blib --verbose *.t; cd ../../../..
Class.t .. 
1..5
# Class.t    DOING testSetRoles()
ok 1 - rolesToString
not ok 2 - externalsToString

#   Failed test 'externalsToString'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Uml/Class/../../../../lib/Test/Agua/Uml/Class.pm line 138.
not ok 3 - internalsToString

#   Failed test 'internalsToString'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Uml/Class/../../../../lib/Test/Agua/Uml/Class.pm line 144.
ok 4 - modulename
not ok 5 - methodsToString

#   Failed test 'methodsToString'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Uml/Class/../../../../lib/Test/Agua/Uml/Class.pm line 177.
# Looks like you failed 3 tests of 5.
Dubious, test returned 3 (wstat 768, 0x300)
Failed 3/5 subtests 

Test Summary Report
-------------------
Class.t (Wstat: 768 Tests: 5 Failed: 3)
  Failed tests:  2-3, 5
  Non-zero exit status: 3
Files=1, Tests=5,  4 wallclock secs ( 0.09 usr  0.01 sys +  4.19 cusr  0.15 csys =  4.44 CPU)
Result: FAIL



Agua::Workflow

cd ./bin/Agua/Workflow; prove --blib --verbose *.t; cd ../../..
Workflow.t .. 
1..36
ok 1 - use Test::Agua::Workflow;
ok 2 - require Test::Agua::Workflow;
2012-12-02 02:34:48    [DEBUG]   	Agua::Instance::BUILD	75	
2012-12-02 02:34:48    [DEBUG]   	Agua::Instance::BUILD	77	self->instanceid: undef
2012-12-02 02:34:48    [DEBUG]   	Agua::Instance::BUILD	75	
2012-12-02 02:34:48    [DEBUG]   	Agua::Instance::BUILD	77	self->instanceid: undef
ok 3 - The object isa Test::Agua::Workflow
# loadStarCluster
ok 4 - The object isa Test::Agua::StarCluster
ok 5 - outputdir value is NOT /agua/t/bin/Agua/Workflow/outputs/loadstarcluster/aguatest/.starcluster
Validation failed for 'Tuple[Tuple[Object,Any,Any,Any,Any],Dict[]]' with value "[ [ Test::Agua::Workflow=HASH(0x194c670), "aguatest", "aguatest-testcluster" ], {  } ], Internal Validation Error is: \n [+] Validation failed for 'Tuple[Object,Any,Any,Any,Any]' with value "[ Test::Agua::Workflow{ OLDPRINTLOG: 2, OLDSHOWLOG: 2, PRINTLOG: 5, SHOWLOG: 2, backup: 0, bytes: 200, ... }, "aguatest", "aguatest-testcluster" ]"\n  [+] Validation failed for 'Any' with value "NULL"" at /usr/local/share/perl/5.14.2/MooseX/Method/Signatures/Meta/Method.pm line 435.
	MooseX::Method::Signatures::Meta::Method::validate('MooseX::Method::Signatures::Meta::Method=HASH(0x7f42f30)', 'ARRAY(0x7f428d0)') called at /usr/local/share/perl/5.14.2/MooseX/Method/Signatures/Meta/Method.pm line 151
	Agua::Workflow::loadStarCluster('Test::Agua::Workflow=HASH(0x194c670)', 'aguatest', 'aguatest-testcluster') called at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Workflow/../../../lib/Test/Agua/Workflow.pm line 148
	Test::Agua::Workflow::testLoadStarCluster('Test::Agua::Workflow=HASH(0x194c670)') called at Workflow.t line 67
# Looks like you planned 36 tests but ran 5.
# Looks like your test exited with 255 just after 5.
Dubious, test returned 255 (wstat 65280, 0xff00)
Failed 31/36 subtests 

Test Summary Report
-------------------
Workflow.t (Wstat: 65280 Tests: 5 Failed: 0)
  Non-zero exit status: 255
  Parse errors: Bad plan.  You planned 36 tests but ran 5.
Files=1, Tests=5, 22 wallclock secs ( 0.09 usr  0.00 sys + 19.80 cusr  0.52 csys = 20.41 CPU)
Result: FAIL


Agua::Common::Package::Default

cd ./bin/Agua/Common/Package/Default; prove --blib --verbose *.t; cd ../../../../..
Default.t .. 
1..6
# Test defaultPackages
ok 1 - correct package information: apps
ok 2 - correct package information: apps
ok 3 - correct package information: workflows
ok 4 - correct package information: workflows
{"error":"undefined values: version","subroutine":"Agua::Common::Base::_addToTable","linenumber":"277","filename":"/agua/lib/Agua/Common/Base.pm","timestamp":"2012-12-02 02:23:13"}
Can't find label EXITLABEL at /agua/lib/Agua/Common/Logger.pm line 339.
# Looks like you planned 6 tests but ran 4.
# Looks like your test exited with 255 just after 4.
Dubious, test returned 255 (wstat 65280, 0xff00)
Failed 2/6 subtests 

Test Summary Report
-------------------
Default.t (Wstat: 65280 Tests: 4 Failed: 0)
  Non-zero exit status: 255
  Parse errors: Bad plan.  You planned 6 tests but ran 4.
Files=1, Tests=4, 17 wallclock secs ( 0.08 usr  0.01 sys + 13.28 cusr  0.40 csys = 13.77 CPU)
Result: FAIL


SESSION ID
----------

Agua::Uml

cd ./bin/Agua/Uml/Uml; prove --blib --verbose *.t; cd ../../../..
Uml.t .. 
1..2
ok 1 - The object isa Test::Agua::Uml
# roleUser
Can't use string ("/mnt/repos/private/syoung/aguate"...) as a symbol ref while "strict refs" in use at /agua/lib/Agua/Uml.pm line 126.
# Looks like you planned 2 tests but ran 1.
# Looks like your test exited with 255 just after 1.
Dubious, test returned 255 (wstat 65280, 0xff00)
Failed 1/2 subtests 

Test Summary Report
-------------------
Uml.t (Wstat: 65280 Tests: 1 Failed: 0)
  Non-zero exit status: 255
  Parse errors: Bad plan.  You planned 2 tests but ran 1.
Files=1, Tests=1,  6 wallclock secs ( 0.08 usr  0.02 sys +  6.09 cusr  0.19 csys =  6.38 CPU)
Result: FAIL


Agua::Upload

cd ./bin/Agua/Upload; prove --blib --verbose *.t; cd ../../..
Upload.t .. 
1..14
ok 1 - use Conf::Agua;
ok 2 - use Test::Agua::Upload;
ok 3 - require Conf::Agua;
ok 4 - require Test::Agua::Upload;
ok 5 - conf isa Conf::Agua
ok 6 - uploader isa Test::Agua::Upload
# Test parseParams
ok 7 - username is correct
ok 8 - path is correct
not ok 9 - sessionId is correct

#   Failed test 'sessionId is correct'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Upload/../../../lib/Test/Agua/Upload.pm line 61.
# Test printTempfile
not ok 10 - details are correct

#   Failed test 'details are correct'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Upload/../../../lib/Test/Agua/Upload.pm line 22.
ok 11 - boundary number is correct
ok 12 - username is correct
ok 13 - path is correct
not ok 14 - sessionId is correct

#   Failed test 'sessionId is correct'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Upload/../../../lib/Test/Agua/Upload.pm line 40.
# Looks like you failed 3 tests of 14.
Dubious, test returned 3 (wstat 768, 0x300)
Failed 3/14 subtests 

Test Summary Report
-------------------
Upload.t (Wstat: 768 Tests: 14 Failed: 3)
  Failed tests:  9-10, 14
  Non-zero exit status: 3
Files=1, Tests=14, 10 wallclock secs ( 0.09 usr  0.02 sys +  9.38 cusr  0.28 csys =  9.77 CPU)
Result: FAIL


Agua::Ops::Version

cd ./bin/Agua/Ops/Version; prove --blib --verbose *.t; cd ../../../..
Version.t .. 
1..230
# Test parseSemVer
ok 1 - parseSemVer    1.0.0-alpha
ok 2 - parseSemVer    1.0.0-alpha.1
ok 3 - parseSemVer    1.0.0-beta.2
ok 4 - parseSemVer    1.0.0-beta.11
ok 5 - parseSemVer    1.0.0-rc.1
ok 6 - parseSemVer    1.0.0-rc.1+build.1
ok 7 - parseSemVer    1.0.0
ok 8 - parseSemVer    1.0.0+0.3.7
ok 9 - parseSemVer    1.3.7+build
ok 10 - parseSemVer    1.3.7+build.2.b8f12d7
ok 11 - parseSemVer    1.3.7+build.11.e0f985a
currentversion: 1.3.7+build.11.e0f985a
# Test incrementSemVer
ok 12 - incrementSemVer    1.3.7+build.11.e0f985a --> 2.0.0 (major, undef)
ok 13 - incrementSemVer    1.3.7+build.11.e0f985a --> 1.4.0 (minor, undef)
ok 14 - incrementSemVer    1.3.7+build.11.e0f985a --> 1.3.8 (patch, undef)
ok 15 - incrementSemVer    1.3.7+build.11.e0f985a --> undef (release, undef)
ok 16 - incrementSemVer    1.3.7+build.11.e0f985a --> 1.3.7+build.12 (build, undef)
ok 17 - incrementSemVer    1.3.7+build.11.e0f985a --> undef (build, alpha)
ok 18 - incrementSemVer    1.3.7+build.11.e0f985a --> 2.0.0-alpha.1 (major, alpha)
ok 19 - incrementSemVer    1.3.7+build.11.e0f985a --> undef (undef, beta)
ok 20 - incrementSemVer    1.3.7+build.11.e0f985a --> undef (undef, rc)
currentversion: 1.0.0-alpha.1
ok 21 - incrementSemVer    1.0.0-alpha.1 --> 2.0.0 (major, undef)
ok 22 - incrementSemVer    1.0.0-alpha.1 --> 1.1.0 (minor, undef)
ok 23 - incrementSemVer    1.0.0-alpha.1 --> 1.0.1 (patch, undef)
ok 24 - incrementSemVer    1.0.0-alpha.1 --> 1.0.0-alpha.2 (release, undef)
ok 25 - incrementSemVer    1.0.0-alpha.1 --> 1.0.0-alpha.1+build.1 (build, undef)
ok 26 - incrementSemVer    1.0.0-alpha.1 --> undef (build, alpha)
ok 27 - incrementSemVer    1.0.0-alpha.1 --> 2.0.0-alpha.1 (major, alpha)
ok 28 - incrementSemVer    1.0.0-alpha.1 --> 1.0.0-beta.1 (undef, beta)
ok 29 - incrementSemVer    1.0.0-alpha.1 --> 1.0.0-rc.1 (undef, rc)
currentversion: 1.0.0-beta.2
ok 30 - incrementSemVer    1.0.0-beta.2 --> 2.0.0 (major, undef)
ok 31 - incrementSemVer    1.0.0-beta.2 --> 1.1.0 (minor, undef)
ok 32 - incrementSemVer    1.0.0-beta.2 --> 1.0.1 (patch, undef)
ok 33 - incrementSemVer    1.0.0-beta.2 --> 1.0.0-beta.3 (release, undef)
ok 34 - incrementSemVer    1.0.0-beta.2 --> 1.0.0-beta.2+build.1 (build, undef)
ok 35 - incrementSemVer    1.0.0-beta.2 --> undef (build, alpha)
ok 36 - incrementSemVer    1.0.0-beta.2 --> 2.0.0-alpha.1 (major, alpha)
ok 37 - incrementSemVer    1.0.0-beta.2 --> undef (undef, beta)
ok 38 - incrementSemVer    1.0.0-beta.2 --> 1.0.0-rc.1 (undef, rc)
currentversion: 1.0.0-rc.2
ok 39 - incrementSemVer    1.0.0-rc.2 --> 2.0.0 (major, undef)
ok 40 - incrementSemVer    1.0.0-rc.2 --> 1.1.0 (minor, undef)
ok 41 - incrementSemVer    1.0.0-rc.2 --> 1.0.1 (patch, undef)
ok 42 - incrementSemVer    1.0.0-rc.2 --> 1.0.0-rc.3 (release, undef)
ok 43 - incrementSemVer    1.0.0-rc.2 --> 1.0.0-rc.2+build.1 (build, undef)
ok 44 - incrementSemVer    1.0.0-rc.2 --> undef (build, alpha)
ok 45 - incrementSemVer    1.0.0-rc.2 --> 2.0.0-alpha.1 (major, alpha)
ok 46 - incrementSemVer    1.0.0-rc.2 --> undef (undef, beta)
ok 47 - incrementSemVer    1.0.0-rc.2 --> undef (undef, rc)
currentversion: 1.0.0-rc.2+build.5
ok 48 - incrementSemVer    1.0.0-rc.2+build.5 --> 2.0.0 (major, undef)
ok 49 - incrementSemVer    1.0.0-rc.2+build.5 --> 1.1.0 (minor, undef)
ok 50 - incrementSemVer    1.0.0-rc.2+build.5 --> 1.0.1 (patch, undef)
ok 51 - incrementSemVer    1.0.0-rc.2+build.5 --> 1.0.0-rc.3 (release, undef)
ok 52 - incrementSemVer    1.0.0-rc.2+build.5 --> 1.0.0-rc.2+build.6 (build, undef)
ok 53 - incrementSemVer    1.0.0-rc.2+build.5 --> undef (build, alpha)
ok 54 - incrementSemVer    1.0.0-rc.2+build.5 --> 2.0.0-alpha.1 (major, alpha)
ok 55 - incrementSemVer    1.0.0-rc.2+build.5 --> undef (undef, beta)
ok 56 - incrementSemVer    1.0.0-rc.2+build.5 --> undef (undef, rc)
currentversion: 1.0.0
ok 57 - incrementSemVer    1.0.0 --> 2.0.0 (major, undef)
ok 58 - incrementSemVer    1.0.0 --> 1.1.0 (minor, undef)
ok 59 - incrementSemVer    1.0.0 --> 1.0.1 (patch, undef)
ok 60 - incrementSemVer    1.0.0 --> undef (release, undef)
ok 61 - incrementSemVer    1.0.0 --> 1.0.0+build.1 (build, undef)
ok 62 - incrementSemVer    1.0.0 --> undef (build, alpha)
ok 63 - incrementSemVer    1.0.0 --> 2.0.0-alpha.1 (major, alpha)
ok 64 - incrementSemVer    1.0.0 --> undef (undef, beta)
ok 65 - incrementSemVer    1.0.0 --> undef (undef, rc)
# Test incrementVersion
currentversion: 1.3.7+build.11.e0f985a
ok 66 - incrementVersion    1.3.7+build.11.e0f985a --> 2.0.0 (major, undef)
not ok 67 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 68 - incrementVersion    versionfile contents: 2.0.0
ok 69 - incrementVersion    1.3.7+build.11.e0f985a --> 1.4.0 (minor, undef)
not ok 70 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.4.0

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.4.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 71 - incrementVersion    versionfile contents: 1.4.0
ok 72 - incrementVersion    1.3.7+build.11.e0f985a --> 1.3.8 (patch, undef)
not ok 73 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.3.8

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.3.8'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 74 - incrementVersion    versionfile contents: 1.3.8
ok 75 - incrementVersion    1.3.7+build.11.e0f985a --> undef (release, undef)
ok 76 - incrementVersion    1.3.7+build.11.e0f985a --> 1.3.7+build.12 (build, undef)
not ok 77 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.3.7+build.12

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 1.3.7+build.12'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 78 - incrementVersion    versionfile contents: 1.3.7+build.12
ok 79 - incrementVersion    1.3.7+build.11.e0f985a --> undef (build, alpha)
ok 80 - incrementVersion    1.3.7+build.11.e0f985a --> 2.0.0-alpha.1 (major, alpha)
not ok 81 - incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.3.7+build.11.e0f985a should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 82 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 83 - incrementVersion    1.3.7+build.11.e0f985a --> undef (undef, beta)
ok 84 - incrementVersion    1.3.7+build.11.e0f985a --> undef (undef, rc)
currentversion: 1.0.0-alpha.1
ok 85 - incrementVersion    1.0.0-alpha.1 --> 2.0.0 (major, undef)
not ok 86 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 87 - incrementVersion    versionfile contents: 2.0.0
ok 88 - incrementVersion    1.0.0-alpha.1 --> 1.1.0 (minor, undef)
not ok 89 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 90 - incrementVersion    versionfile contents: 1.1.0
ok 91 - incrementVersion    1.0.0-alpha.1 --> 1.0.1 (patch, undef)
not ok 92 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 93 - incrementVersion    versionfile contents: 1.0.1
ok 94 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-alpha.2 (release, undef)
not ok 95 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-alpha.2

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-alpha.2'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 96 - incrementVersion    versionfile contents: 1.0.0-alpha.2
ok 97 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-alpha.1+build.1 (build, undef)
not ok 98 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-alpha.1+build.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-alpha.1+build.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 99 - incrementVersion    versionfile contents: 1.0.0-alpha.1+build.1
ok 100 - incrementVersion    1.0.0-alpha.1 --> undef (build, alpha)
ok 101 - incrementVersion    1.0.0-alpha.1 --> 2.0.0-alpha.1 (major, alpha)
not ok 102 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 103 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 104 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-beta.1 (undef, beta)
not ok 105 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-beta.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-beta.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 106 - incrementVersion    versionfile contents: 1.0.0-beta.1
^[[Bok 107 - incrementVersion    1.0.0-alpha.1 --> 1.0.0-rc.1 (undef, rc)
not ok 108 - incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-rc.1

#   Failed test 'incrementVersion    tag: 1.0.0-alpha.1 should be newversion: 1.0.0-rc.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 109 - incrementVersion    versionfile contents: 1.0.0-rc.1
currentversion: 1.0.0-beta.2
ok 110 - incrementVersion    1.0.0-beta.2 --> 2.0.0 (major, undef)
not ok 111 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 112 - incrementVersion    versionfile contents: 2.0.0
ok 113 - incrementVersion    1.0.0-beta.2 --> 1.1.0 (minor, undef)
not ok 114 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 115 - incrementVersion    versionfile contents: 1.1.0
ok 116 - incrementVersion    1.0.0-beta.2 --> 1.0.1 (patch, undef)
not ok 117 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 118 - incrementVersion    versionfile contents: 1.0.1
ok 119 - incrementVersion    1.0.0-beta.2 --> 1.0.0-beta.3 (release, undef)
not ok 120 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-beta.3

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-beta.3'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 121 - incrementVersion    versionfile contents: 1.0.0-beta.3
ok 122 - incrementVersion    1.0.0-beta.2 --> 1.0.0-beta.2+build.1 (build, undef)
not ok 123 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-beta.2+build.1

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-beta.2+build.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 124 - incrementVersion    versionfile contents: 1.0.0-beta.2+build.1
ok 125 - incrementVersion    1.0.0-beta.2 --> undef (build, alpha)
ok 126 - incrementVersion    1.0.0-beta.2 --> 2.0.0-alpha.1 (major, alpha)
not ok 127 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 128 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 129 - incrementVersion    1.0.0-beta.2 --> undef (undef, beta)
ok 130 - incrementVersion    1.0.0-beta.2 --> 1.0.0-rc.1 (undef, rc)
not ok 131 - incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-rc.1

#   Failed test 'incrementVersion    tag: 1.0.0-beta.2 should be newversion: 1.0.0-rc.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 132 - incrementVersion    versionfile contents: 1.0.0-rc.1
currentversion: 1.0.0-rc.2
ok 133 - incrementVersion    1.0.0-rc.2 --> 2.0.0 (major, undef)
not ok 134 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 135 - incrementVersion    versionfile contents: 2.0.0
ok 136 - incrementVersion    1.0.0-rc.2 --> 1.1.0 (minor, undef)
not ok 137 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 138 - incrementVersion    versionfile contents: 1.1.0
ok 139 - incrementVersion    1.0.0-rc.2 --> 1.0.1 (patch, undef)
not ok 140 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 141 - incrementVersion    versionfile contents: 1.0.1
ok 142 - incrementVersion    1.0.0-rc.2 --> 1.0.0-rc.3 (release, undef)
not ok 143 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.0-rc.3

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.0-rc.3'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 144 - incrementVersion    versionfile contents: 1.0.0-rc.3
ok 145 - incrementVersion    1.0.0-rc.2 --> 1.0.0-rc.2+build.1 (build, undef)
not ok 146 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.0-rc.2+build.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 1.0.0-rc.2+build.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 147 - incrementVersion    versionfile contents: 1.0.0-rc.2+build.1
ok 148 - incrementVersion    1.0.0-rc.2 --> undef (build, alpha)
ok 149 - incrementVersion    1.0.0-rc.2 --> 2.0.0-alpha.1 (major, alpha)
not ok 150 - incrementVersion    tag: 1.0.0-rc.2 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 151 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 152 - incrementVersion    1.0.0-rc.2 --> undef (undef, beta)
ok 153 - incrementVersion    1.0.0-rc.2 --> undef (undef, rc)
currentversion: 1.0.0-rc.2+build.5
ok 154 - incrementVersion    1.0.0-rc.2+build.5 --> 2.0.0 (major, undef)
not ok 155 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 156 - incrementVersion    versionfile contents: 2.0.0
ok 157 - incrementVersion    1.0.0-rc.2+build.5 --> 1.1.0 (minor, undef)
not ok 158 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 159 - incrementVersion    versionfile contents: 1.1.0
ok 160 - incrementVersion    1.0.0-rc.2+build.5 --> 1.0.1 (patch, undef)
not ok 161 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 162 - incrementVersion    versionfile contents: 1.0.1
ok 163 - incrementVersion    1.0.0-rc.2+build.5 --> 1.0.0-rc.3 (release, undef)
not ok 164 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.0-rc.3

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.0-rc.3'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 165 - incrementVersion    versionfile contents: 1.0.0-rc.3
ok 166 - incrementVersion    1.0.0-rc.2+build.5 --> 1.0.0-rc.2+build.6 (build, undef)
not ok 167 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.0-rc.2+build.6

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 1.0.0-rc.2+build.6'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 168 - incrementVersion    versionfile contents: 1.0.0-rc.2+build.6
ok 169 - incrementVersion    1.0.0-rc.2+build.5 --> undef (build, alpha)
ok 170 - incrementVersion    1.0.0-rc.2+build.5 --> 2.0.0-alpha.1 (major, alpha)
not ok 171 - incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0-rc.2+build.5 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 172 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 173 - incrementVersion    1.0.0-rc.2+build.5 --> undef (undef, beta)
ok 174 - incrementVersion    1.0.0-rc.2+build.5 --> undef (undef, rc)
currentversion: 1.0.0
ok 175 - incrementVersion    1.0.0 --> 2.0.0 (major, undef)
not ok 176 - incrementVersion    tag: 1.0.0 should be newversion: 2.0.0

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 2.0.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 177 - incrementVersion    versionfile contents: 2.0.0
ok 178 - incrementVersion    1.0.0 --> 1.1.0 (minor, undef)
not ok 179 - incrementVersion    tag: 1.0.0 should be newversion: 1.1.0

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 1.1.0'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 180 - incrementVersion    versionfile contents: 1.1.0
ok 181 - incrementVersion    1.0.0 --> 1.0.1 (patch, undef)
not ok 182 - incrementVersion    tag: 1.0.0 should be newversion: 1.0.1

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 1.0.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 183 - incrementVersion    versionfile contents: 1.0.1
ok 184 - incrementVersion    1.0.0 --> undef (release, undef)
ok 185 - incrementVersion    1.0.0 --> 1.0.0+build.1 (build, undef)
not ok 186 - incrementVersion    tag: 1.0.0 should be newversion: 1.0.0+build.1

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 1.0.0+build.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 187 - incrementVersion    versionfile contents: 1.0.0+build.1
ok 188 - incrementVersion    1.0.0 --> undef (build, alpha)
ok 189 - incrementVersion    1.0.0 --> 2.0.0-alpha.1 (major, alpha)
not ok 190 - incrementVersion    tag: 1.0.0 should be newversion: 2.0.0-alpha.1

#   Failed test 'incrementVersion    tag: 1.0.0 should be newversion: 2.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 687.
ok 191 - incrementVersion    versionfile contents: 2.0.0-alpha.1
ok 192 - incrementVersion    1.0.0 --> undef (undef, beta)
ok 193 - incrementVersion    1.0.0 --> undef (undef, rc)
# Test versionSort
ok 194 - versionSort    versions: 0.8.0 0.9.1 0.11.0 1.0.0
ok 195 - versionSort    versions 2: 0.8.0 0.9.1 0.11.0 1.0.0 2.0.0 12.0.0
ok 196 - versionSort    versions: 1.0.0 1.0.0+build1 1.3.7+build.1 1.3.7+build.2.b8f12d7 1.3.7+build.11.e0f985a 2.0.0
ok 197 - versionSort    build permutations: 0.8.0+build1 0.8.0+build2 0.8.0+build11
ok 198 - versionSort    build permutations: 0.8.0+build1 0.8.0+build2 0.8.0+build11
ok 199 - versionSort    build permutations: 0.8.0+build1 0.8.0+build2 0.8.0+build11
ok 200 - versionSort    build vs release: 0.8.0-rc2 0.8.0+build11
ok 201 - versionSort    composite permutations: 0.8.0-alpha 0.8.0-alpha.1 0.8.0-beta 0.8.0-rc2 0.8.0 0.8.0+build1 0.8.0+build11 0.9.1 0.11.0 1.0.0 2.0.0 12.0.0
ok 202 - versionSort    composite permutations: 0.8.0-alpha 0.8.0-alpha.1 0.8.0-beta 0.8.0-rc2 0.8.0 0.8.0+build1 0.8.0+build11 0.9.1 0.11.0 1.0.0 2.0.0 12.0.0
ok 203 - versionSort    composite permutations: 0.8.0-alpha 0.8.0-alpha.1 0.8.0-alpha.2 0.8.0-alpha.12 0.8.0-beta 0.8.0-rc2 0.8.0+build1 0.8.0+build2 0.8.0+build11
ok 204 - versionSort    build vs release: 0.8.0-alpha.1 0.8.0-alpha.1+build.1 0.8.0-beta.1 0.8.0-beta.1+build.1
ok 205 - compare 0.7.2 and 0.6.0
ok 206 - compare 0.6.0 and 0.6.1
ok 207 - compare 0.6.0 and 0.6.0+build.1
ok 208 - compare 0.6.0 and 0.6.0-alpha.1
ok 209 - setVersion    1.3.7+build.11.e0f985a --> 1.2.0
ok 210 - setVersion    1.3.7+build.11.e0f985a --> 1.3.7+build.11
ok 211 - setVersion    1.3.7+build.11.e0f985a --> 1.3.8+build.11
not ok 212 - setVersion    tag: 1.3.7+build.11.e0f985a

#   Failed test 'setVersion    tag: 1.3.7+build.11.e0f985a'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 213 - setVersion    versionfile: 1.3.8+build.11
ok 214 - setVersion    1.3.7+build.11.e0f985a --> 2.0.0-alpha.1
not ok 215 - setVersion    tag: 1.3.7+build.11.e0f985a

#   Failed test 'setVersion    tag: 1.3.7+build.11.e0f985a'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 216 - setVersion    versionfile: 2.0.0-alpha.1
ok 217 - setVersion    1.3.7+build.11.e0f985a --> 0.8.0
ok 218 - setVersion    1.0.0-alpha.1 --> 1.2.0
not ok 219 - setVersion    tag: 1.0.0-alpha.1

#   Failed test 'setVersion    tag: 1.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 220 - setVersion    versionfile: 1.2.0
ok 221 - setVersion    1.0.0-alpha.1 --> 1.3.7+build.11
not ok 222 - setVersion    tag: 1.0.0-alpha.1

#   Failed test 'setVersion    tag: 1.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 223 - setVersion    versionfile: 1.3.7+build.11
ok 224 - setVersion    1.0.0-alpha.1 --> 1.3.8+build.11
not ok 225 - setVersion    tag: 1.0.0-alpha.1

#   Failed test 'setVersion    tag: 1.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 226 - setVersion    versionfile: 1.3.8+build.11
ok 227 - setVersion    1.0.0-alpha.1 --> 2.0.0-alpha.1
not ok 228 - setVersion    tag: 1.0.0-alpha.1

#   Failed test 'setVersion    tag: 1.0.0-alpha.1'
#   at /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/../../../../lib/Test/Agua/Ops/Version.pm line 165.
ok 229 - setVersion    versionfile: 2.0.0-alpha.1
ok 230 - setVersion    1.0.0-alpha.1 --> 0.8.0
sh: 0: getcwd() failed: No such file or directory
# Looks like you failed 43 tests of 230.
Dubious, test returned 43 (wstat 11008, 0x2b00)
Failed 43/230 subtests 

Test Summary Report
-------------------
Version.t (Wstat: 11008 Tests: 230 Failed: 43)
  Failed tests:  67, 70, 73, 77, 81, 86, 89, 92, 95, 98
                102, 105, 108, 111, 114, 117, 120, 123
                127, 131, 134, 137, 140, 143, 146, 150
                155, 158, 161, 164, 167, 171, 176, 179
                182, 186, 190, 212, 215, 219, 222, 225
                228
  Non-zero exit status: 43
Files=1, Tests=230, 130 wallclock secs ( 0.30 usr  0.06 sys + 16.63 cusr 53.78 csys = 70.77 CPU)
Result: FAIL
cd ./bin/Agua/O

</entry>
<entry [Thu 2012:11:22 01:32:13 EST] FINAL executeWorkflow TESTS ON StarCluster/Workflow>

Workflow::executeWorkflow

reset; echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-microcluster","SHOWLOG":5}' | ./workflow.pl


Workflow::getStatus

reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getStatus","SHOWLOG":5}' | ./workflow.pl



PROBLEM

1. SGE BINARIES ON EXEC NODES ARE NAMED DIFFERENTLY

2. EXEC NODES ARE INTEL WHILE MASTER NODE IS AMD SO USE DIFFERENTLY NAMED BINARIES 


DIAGNOSIS

SGE BINARIES ON MASTER (AS ON LAPTOP)

root@ip-10-126-41-116:~# ll /opt/sge6/bin
total 20K
drwxr-xr-x  5 ubuntu ubuntu 4.0K 2012-10-18 00:46 .
drwxr-xr-x 22 ubuntu ubuntu 4.0K 2012-10-18 07:51 ..
drwxr-xr-x  2 ubuntu ubuntu 4.0K 2012-10-18 00:48 lx24-amd64
drwxr-xr-x  2 ubuntu ubuntu 4.0K 2012-10-18 00:43 lx24-ia64
drwxr-xr-x  2 ubuntu ubuntu 4.0K 2012-10-18 00:45 lx24-x86

SGE BINARIES ON EXEC NODE

root@ip-10-126-41-116:~# ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-122-23-189.ec2.internal "ls -al /opt/sge6/bin"
total 16
drwxr-xr-x  4 sgeadmin sgeadmin 4096 2012-11-22 08:26 .
drwxr-xr-x 18 sgeadmin sgeadmin 4096 2012-11-22 08:31 ..
drwxr-xr-x  2 sgeadmin sgeadmin 4096 2012-11-22 08:26 linux-x64
drwxr-xr-x  2 sgeadmin sgeadmin 4096 2012-11-22 08:26 linux-x86



CPU TYPE ON LAPTOP

grep vendor_id /proc/cpuinfo

    vendor_id	: AuthenticAMD


CPU TYPE ON MASTER

root@ip-10-126-41-116:~# grep vendor_id /proc/cpuinfo
vendor_id	: GenuineIntel

CPU TYPE ON EXEC NODE

root@ip-10-126-41-116:~# ssh -i /nethome/admin/.starcluster/id_rsa-admin-key root@ip-10-122-23-189.ec2.internal "grep vendor_id /proc/cpuinfo"
    
    vendor_id	: GenuineIntel




PROBLEM

WHEN TRY TO CONNECT GET ERROR MESSAGE:


ECDSA key fingerprint is 73:17:8b:4c:70:b6:c2:80:f9:0a:4e:93:e3:ba:8d:8d.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'ec2-54-242-199-228.compute-1.amazonaws.com,10.122.207.13' (ECDSA) to the list of known hosts.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0666 for '/nethome/admin/.starcluster/id_rsa-admin-key' are too open.
It is recommended that your private key files are NOT accessible by others.
This private key will be ignored.
bad permissions: ignore key: /nethome/admin/.starcluster/id_rsa-admin-key



KEYPAIR IN KEYPAIR FILE:

head /nethome/admin/.starcluster/id_rsa-admin-key 
    KEYPAIR	id_rsa-admin-key
    bd:3d:2a:dc:88:72:02:dc:59:45:08:0f:5e:cd:64:13:8a:6a:42:2d

AWS KEYPAIR


6d:b0:03:fb:00:43:cd:8d:33:b3:71:43:ab:fa:87:96:ae:a1:fe:fb



SOLUTION

1. CHMOD 600 KEYPAIR FILE

chmod 600 /nethome/admin/.starcluster/id_rsa-admin-key 

2. REFRESH KEYPAIR IN AWS

reset; echo '{"username":"admin","amazonuserid":"728213020069","awsaccesskeyid":"AKIAIKZHIY7T75JIF34A","awssecretaccesskey":"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","ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy\nNDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w\nDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ\neWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr\ndtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5\n9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK\nBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti\nZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7\ncPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU\nbs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z\n0626imzblXE8IA==\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ\nWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ\nNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC\ngYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3\n8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG\nM6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC\naE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK\npzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9\n4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc\n6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC\nQQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN\nukFcKuTSGIpO\n-----END PRIVATE KEY-----","sessionId":"9999999999.9999.999","mode":"addAws","repotype":"github","SHOWLOG":4}' | ./workflow.pl



KEYPAIR IN KEYPAIR FILE:

head /nethome/admin/.starcluster/id_rsa-admin-key
    
    KEYPAIR	id_rsa-admin-key	24:2d:24:b5:85:13:24:96:cb:f0:f1:cf:64:9a:fc:c0:df:de:78:76
    -----BEGIN RSA PRIVATE KEY-----
    MIIEpAIBAAKCAQEAmVgpQxD/29wGF+Rv8AiKkdImT0IDvV/oRHpH9mXzt3V2f2vyTHfExGSHchtS

    
    
KEYPAIR IN AWS CONSOLE:

id_rsa-admin-key
24:2d:24:b5:85:13:24:96:cb:f0:f1:cf:64:9a:fc:c0:df:de:78:76


    OK!!!

    
</entry>
<entry [Tue 2012:11:20 12:13:10 EST] FIXED ERROR IN Stager: 'VERSION ALREADY EXISTS'>


aguatest/nethome/aguatest/agua/Project2/test/test.err
aguatest/nethome/aguatest/agua/Project2/test/test.out
aguatest/nethome/aguatest/agua/Project2/test/test.pl
aguatest/nethome/aguatest/agua/Project2/test/test.sh
aguatest/stager.conf
aguatest/stager.pm
2012-11-20 12:11:24    [DEBUG]   	Agua::Ops::runCommand	212	command: cd /agua/repos/private/syoung/aguatest; rm -fr /tmp/aguatest.0.8.0-alpha.1+build.15-2588081.tar.gz
2012-11-20 12:11:24    [DEBUG]   	Agua::Ops::Stager::targetUpdate	317	targetrepo: /agua/repos/private/syoung/aguatest
2012-11-20 12:11:24    [DEBUG]   	Agua::Ops::Stager::targetUpdate	318	package: aguatest
2012-11-20 12:11:24    [DEBUG]   	Agua::Ops::Stager::targetUpdate	325	commands: ["rm -fr /agua/repos/private/syoung/aguatest/*","cp -pr /tmp/aguatest/* /agua/repos/private/syoung/aguatest"]
2012-11-20 12:11:24    [DEBUG]   	Agua::Ops::runCommand	212	command: cd /agua/repos/private/syoung/aguatest; rm -fr /agua/repos/private/syoung/aguatest/*
2012-11-20 12:11:24    [DEBUG]   	Agua::Ops::runCommand	212	command: cd /agua/repos/private/syoung/aguatest; cp -pr /tmp/aguatest/* /agua/repos/private/syoung/aguatest
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Stager::createVersion	375	repodir: /agua/repos/private/syoung/aguatest
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Stager::createVersion	376	message: +Fix all: Enabled tests - 100% operational 


2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Stager::createVersion	377	version: 0.8.0-alpha.1+build.15
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Stager::createVersion	378	versiontype: undef
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Stager::createVersion	379	versionfile: /agua/repos/private/syoung/aguatest/VERSION
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Stager::createVersion	380	versionformat: semver
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Stager::createVersion	381	branch: master
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Version::setVersion	266	
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Version::setSemVer	318	version: 0.8.0-alpha.1+build.15
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Version::isSemVer	377	
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Version::getCurrentVersion	305	
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::Version::getCurrentVersion	310	command: git describe --abbrev=0 --tag
2012-11-20 12:11:27    [DEBUG]   	Agua::Ops::runCommand	212	command: cd /agua/repos/private/syoung/aguatest; git describe --abbrev=0 --tag
2012-11-20 12:11:29    [DEBUG]   	Agua::Ops::runCommand	252	output: 0.8.0-alpha.1+build.14

2012-11-20 12:11:29    [DEBUG]   	Agua::Ops::Version::getCurrentVersion	313	Returning current version: 0.8.0-alpha.1+build.14
...
2012-11-20 12:11:29    [DEBUG]   	Agua::Ops::Version::higherSemVer	217	PASSED version1: 0.8.0-alpha.1+build.15
2012-11-20 12:11:29    [DEBUG]   	Agua::Ops::Version::higherSemVer	218	PASSED version2: 0.8.0-alpha.1+build.14
...
2012-11-20 12:11:29    [DEBUG]   	Agua::Ops::Version::setSemVer	327	version: 0.8.0-alpha.1+build.15
...
2012-11-20 12:11:29    [DEBUG]   	Agua::Ops::Version::_setVersion	283	version: 0.8.0-alpha.1+build.15
2012-11-20 12:11:29    [DEBUG]   	Agua::Ops::Version::_setVersion	284	description: +Fix all: Enabled tests - 100% operational 


2012-11-20 12:11:29    [DEBUG]   	Agua::Common::Util::createParentDir	323	directory: /agua/repos/private/syoung/aguatest
2012-11-20 12:11:29    [DEBUG]   	Agua::Ops::runCommand	212	command: cd /agua/repos/private/syoung/aguatest; git add --ignore-errors .
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Git::addToRepo	78	result: 
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Git::addToRepo	79	error: 
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Git::addLocalTag	95	tag: 0.8.0-alpha.1+build.15
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Git::addLocalTag	96	description: +Fix all: Enabled tests - 100% operational 


2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::runCommand	212	command: cd /agua/repos/private/syoung/aguatest; git tag -a 0.8.0-alpha.1+build.15 -m "+Fix all: Enabled tests - 100% operational 

"
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Version::_setVersion	300	Returning (0.8.0-alpha.1+build.15, undef)
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Version::setVersion	270	result: 0.8.0-alpha.1+build.15
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Version::setVersion	271	error: undef
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Stager::createVersion	386	result: 0.8.0-alpha.1+build.15
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Stager::createVersion	387	error: undef
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Stager::createVersion	389	
Created new version: 0.8.0-alpha.1+build.15


2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Git::addLocalTag	95	tag: 0.8.0-alpha.1+build.15
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::Git::addLocalTag	96	description: +Fix all: Enabled tests - 100% operational 

2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::runCommand	212	command: cd /agua/repos/private/syoung/aguatest; git tag -a 0.8.0-alpha.1+build.15 -m "+Fix all: Enabled tests - 100% operational 

"
2012-11-20 12:11:36    [DEBUG]   	Agua::Ops::runCommand	253	error: fatal: tag '0.8.0-alpha.1+build.15' already exists

syoung@syoung-Satellite-C675D:/agua/repos/private/syoung$ cd -
/agua/repos/private/syoung/aguatestdev
syoung@syoung-Satellite-C675D:/agua/repos/private/syoung/aguatestdev$ gitlog | head
* 2588081 (HEAD, tag: 0.8.0-alpha.1+build.15, lin/master, github/master, bit/master, master) -Del lib/Test/Agua/Uml/Class.pm: Removed print statements


    
</entry>
<entry [Sun 2012:11:18 00:43:41 EST] REMAINING DEFECTIVE TESTS>

#### DONE #### cd ./bin/Agua/Ssh;
./Ssh.t

#### DONE #### NO TESTS
cd ./bin/Agua/Uml/Class;

#### DONE #### Can't locate Test/Agua/Uml/Uml.pm
cd ./bin/Agua/Uml/Uml; 
./Uml.t

#### DONE #### Can't locate Test/Agua/Uml.pm
cd ./bin/Agua/Uml/Role; 
./Role.t

#### DONE ####
cd ./bin/Agua/Workflow;
./Workflow.t

#### DONE ####
cd ./bin/Agua/StarCluster/StarCluster;
./StarCluster.t

#### DONE ####
SHOULD RUN OK ONCE agua::aguatest IS POPULATED
Ops/Install
# Test installTests


</entry>
<entry [Sat 2012:11:17 04:19:08 EST] .gitattribute LIST OF EXCLUDED TESTS>

1. LIST ALL TEST FILES

cd /agua/t/html/plugins
find . -type f -name test.html

./admin/hub/test.html
./admin/access/test.html
./admin/parameters/test.html
./admin/settings/test.html
./core/filecache/test.html
./core/common/test.html
./core/bookmark/test.html
./view/getset/test.html
./view/addview/test.html
./view/removeview/test.html
./view/addviewfeature/test.html
./view/removeviewfeature/test.html
./folders/copyfile/test.html
./folders/uploader/test.html
./folders/filemenu/test.html
./folders/copyfile-faked/test.html
./folders/filedrag/test.html
./home/github/test.html
./home/progresspane/test.html
./home/version/test.html
./workflow/workflows/test.html
./workflow/runworkflow/test.html
./workflow/io/test.html
./workflow/grid/test.html
./workflow/clusterstatus/test.html
./workflow/getstatus/test.html
./workflow/sync/test.html
./workflow/runstatus/startup/test.html
./workflow/runstatus/duration/test.html
./workflow/runstatus/status/test.html
./workflow/parameters/test.html
./workflow/filemanager/test.html
./workflow/execute/test.html
./login/load/test.html
./dojox/timing/test.html

2. TAKE AWAY TESTS IN LIST OF 'Tests Running' TO GET .gitattribute EXCLUDED LIST

/agua/t/.gitattributes

.gitattributes                  export-ignore

bin/Conf/StarCluster.t          export-ignore
bin/Monitor/LSF                 export-ignore
bin/Agua/Common/File	        export-ignore
cgi-bin                         export-ignore
dump/agua.2*                    export-ignore
starcluster			export-ignore


html/plugins/admin			export-ignore
html/plugins/admin/hub                  export-ignore
html/plugins/admin/access               export-ignore
html/plugins/admin/parameters           export-ignore
html/plugins/admin/settings             export-ignore
html/plugins/core/bookmark              export-ignore   
html/plugins/core/data          	export-ignore
html/plugins/core/filecache             export-ignore
html/plugins/dojox              	export-ignore
html/plugins/dojox/timing               export-ignore
html/plugins/folders/uploader           export-ignore
html/plugins/folders/filemenu           export-ignore
html/plugins/folders/copyfile-faked     export-ignore
html/plugins/home/progresspane          export-ignore
html/plugins/login/load                 export-ignore
html/plugins/workflow/clusterstatus     export-ignore
html/plugins/workflow/execute           export-ignore
html/plugins/workflow/filemanager       export-ignore
html/plugins/workflow/getstatus         export-ignore
html/plugins/workflow/grid              export-ignore
html/plugins/workflow/parameters        export-ignore
html/plugins/workflow/sync              export-ignore
html/plugins/workflow/workflows         export-ignore

    
</entry>
<entry [Sat 2012:11:17 04:16:44 EST] html: LIST OF 'Tests Running' IN runTests.html>

t.plugins.core.common.test
t.plugins.dojox.timing.test
t.plugins.folders.copyfile.test
t.plugins.folders.filedrag.test
t.plugins.home.github.test
t.plugins.home.version.test
t.plugins.home.progresspane.test
t.plugins.view.addview.test
t.plugins.view.addviewfeature.test
t.plugins.view.getset.test
t.plugins.view.removeview.test
t.plugins.view.removeviewfeature.test
t.plugins.workflow.io.test
t.plugins.workflow.runworkflow.test

    
</entry>
<entry [Sun 2012:11:11 02:24:49 EST] TEST deploy.pl INSTALL OF AGUATESTS FOR LINKS>

1. INSTALL biorepository

/mnt/agua/bin/scripts/../logic/ops.pl biorepository install \
---owner syoung \
---login syoung \
---username admin \
---repository biorepodev \
---package biorepository \
---privacy public \
---installdir /agua/repos/public/agua/biorepository \
---logfile /tmp/agua-biorepository.install.log \
---opsdir /agua/t/repos/public/agua/biorepository/agua/biorepository \
---SHOWLOG 4 \
---token ded526622a10cfaaea0134662696b748ff666696

    OK


NOW CAN FIND

/agua/t/repos/public/agua/biorepository/agua/aguatest/aguatest.pm



2. INSTALL aguatest

/mnt/agua/bin/scripts/../logic/ops.pl aguatest install \
--owner syoung \
--login syoung \
--username admin \
--repository aguatestdev \
--package aguatest \
--privacy private \
--installdir /agua/t \
--logfile /tmp/agua-aguatest.install.log \
--opsdir /agua/t/repos/public/agua/biorepository/agua/aguatest \
--SHOWLOG 4 \
--token ded526622a10cfaaea0134662696b748ff666696 \
--keyfile /home/syoung/.ssh/id_rsa

    OK


RETEST

reset; echo '{"username":"admin","sessionId":"1352873938.1093.137","package":"aguatest","repository":"aguatestdev","version":"0.8.0-alpha.1+build.12","privacy":"private","owner":"syoung","installdir":"/agua/t-test","mode":"upgrade","random":129153390050,"SHOWLOG":4}' | ./workflow.pl



    
</entry>
<entry [Mon 2012:11:05 17:43:08 EST] GENERATED roleUsers FOR Agua::Common::Balancer>

reset; ./uml.pl \
--sourcefile /agua/lib/Agua/Common/Balancer.pm \
--targetdir /agua/lib/Agua \
--outputfile /agua/log/uml.tsv \
--mode roleUsers \
--SHOWLOG 5


BEFORE REFACTOR:

Agua::Balancer
	external_calls
		*Agua::Balancer	*Agua::Common::Balancer
		checkBalancers	launchBalancer	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Balancer
		startCluster	balancerRunning	
		initialise	getBalancerOutputdir	
		startCluster	launchBalancer	
		startCluster	terminateBalancer	
		stop	terminateBalancer	
Agua::Workflow
	external_calls
		*Agua::Workflow	*Agua::Common::Balancer
        ...


AFTER REFACTOR:

Agua::Balancer
Agua::Deploy
Agua::StarCluster
Agua::Workflow
Agua::Configure
Agua::Admin
Agua::Sharing

Agua::Balancer
	external_calls
		*Agua::Balancer	*Agua::Common::Balancer
		checkBalancers	launchBalancer	
Agua::StarCluster
	external_calls
		*Agua::StarCluster	*Agua::Common::Balancer
		startCluster	balancerRunning	
		initialise	getBalancerOutputdir	
		startCluster	launchBalancer	
		startCluster	terminateBalancer	
		stop	terminateBalancer	


</entry>
<entry [Sun 2012:10:28 22:56:55 EST] uml.pl TO GENERATE ROLE-BASED METHOD HIERARCHIES>	

TARGET FILE:

./uml.pl \
--rolename Agua::Common::Cluster \
--sourcefile /agua/lib/Agua/Common/Cluster.pm \
--targetfile /agua/lib/Agua/Workflow.pm \
--outputfile /agua/log/uml.tsv \
--mode users \
--SHOWLOG 5


Agua::Common::Cluster
	methods
		_addCluster
		_addClusterWorkflow
		_createCellDir
		_createPluginsDir
		_isCluster
		_removeCellDir
		_removeCluster
		_removeClusterWorkflow
		clusterInputs
		clusterIsBusy
		clusterNodesInfo
		describeInstances
		getAdminKey
		getCellDir
		getCluster
		getClusterByWorkflow
		getClusterInstanceIds
		getClusterStatus
		getClusterVars
		getClusterWorkflows
		getClusters
		getConfigFile
		getDefaultCellDir
		getHeadnodeInternalIp
		getInstanceInfo
		getInternalIps
		getLocalInstanceInfo
		getMasterId
		getMasterInstanceInfo
		getMonitor
		getQmasterIps
		newCluster
		parseInstanceInfo
		removeCluster
		runningClusters
		saveClusterWorkflow
		setSlots
		updateClusterNodes
        
        

ALL MODULES IN TARGET DIR:

./uml.pl \
--rolename Agua::Common::Cluster \
--sourcefile /agua/lib/Agua/Common/Cluster.pm \
--targetfile /agua/lib/Agua/Workflow.pm \
--targetdir /agua/lib/Agua \
--outputfile /agua/log/uml.tsv \
--mode users
    
</entry>
<entry [Fri 2012:10:26 15:02:29 EST] deploy.pl TO INSTALL bioapps, biorepo, ETC.>

./deploy.pl \
--mode starcluster \
--SHOWLOG 4
    
    OK

    
</entry>
<entry [Sun 2012:10:14 23:24:44 EST] TEST STAGER ON BIOREPOSITORY-TEST REPOS>

1. CONFIG FILE

em /repos/private/syoung/biorepodev-test/stager.conf

[default]
PACKAGE     biorepository
OUTPUTDIR   /home/syoung/RELEASE

[stage 1]
REPODIR     /repos/private/syoung/biorepodev-test
    
[stage 2]
REPODIR     /repos/private/syoung/biorepostage-test

[stage 3]
REPODIR     /repos/public/agua/biorepodev-test

[stage 4]
REPODIR     /repos/public/agua/biorepository-test


2. STAGE COMMANDS

1-2
====

/agua/bin/scripts/stager.pl \
--stagefile /repos/private/syoung/biorepodev-test/stager.pm \
--versiontype build \
--mode 1-2 \
--message "1-2: First line
(EMPTY LINE)
(EMPTY LINE)
Second line
Third line" \
--SHOWLOG 4

    OK
    version IS 0.8.0-alpha.1+build4


2-3
====

ENSURE THAT owner IS syoung IN syoung's WORKFLOWS:
cd /repos/private/syoung/biorepostage-test
perl -pi -e 's/"owner"\s*:\s*"\S+"/"owner" : "syoung"/g' syoung/workflows/projects/*/*.proj
perl -pi -e 's/"owner"\s*:\s*"\S+"/"owner" : "syoung"/g' syoung/workflows/projects/*/*.work
gitadd
git commit -a
    OK
    
    
/agua/bin/scripts/stager.pl \
--stagefile /repos/private/syoung/biorepodev-test/stager.pm \
--version 0.8.0-alpha.1+build4 \
--mode 2-3 \
--message "2-3: First line
(EMPTY LINE)
(EMPTY LINE)
Second line
Third line" \
--SHOWLOG 4

    OK

3-4
====


--version 0.8.0-alpha.1+build4 \

/agua/bin/scripts/stager.pl \
--stagefile /repos/private/syoung/biorepodev-test/stager.pm \
--versiontype build \
--mode 3-4 \
--message "3-4: First line
(EMPTY LINE)
(EMPTY LINE)
Second line
Third line" \
--SHOWLOG 4

    OK
    
    
</entry>
<entry [Sun 2012:10:14 03:28:45 EST] Agua::Ops::Stager>

./stage.pl \
--stagefile /repos/private/syoung/biorepodev/stage.pm \
--mode 2-3 \
--message "First line
(EMPTY LINE)
(EMPTY LINE)
Second line
Third line"


CREATED TEST FOR Agua::Ops::Stager

cd /agua/t/bin/Agua/Ops/Stager
clear; ./Stager.t --SHOWLOG 4


    
</entry>
<entry [Sat 2012:10:13 22:25:41 EST] Workflow::executeWorkflow and ::stopWorkflow>

Workflow::executeWorkflow

reset; echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":1,"stop":3,"username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-microcluster","SHOWLOG":5}' | ./workflow.pl


Workflow::stopWorkflow

reset; echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"admin-smallcluster","mode":"stopWorkflow","start":1,"SHOWLOG":4}' | ./workflow.pl


</entry>
<entry [Sat 2012:10:13 21:46:21 EST] INSTALL STARCLUSTER ON ERIDANUS>

cd /agua/repos/public/agua/biorepository/agua/starcluster
reset;
/agua/bin/logic/ops.pl StarClusterDev install \
--owner agua \
--login agua \
--username admin \
--repository StarClusterDev \
--package StarCluster \
--privacy public \
--installdir /agua/bin/scripts/../../apps/starcluster \
--logfile /tmp/agua-StarClusterDev.install.log \
--version 0.92.0-rc2 \
--opsdir /agua/bin/scripts/../../repos/public/agua/biorepository/agua/starcluster \
--SHOWLOG 4

    OK
    
</entry>
<entry [Fri 2012:10:12 17:38:12 EST] PLUGINS Workflow.runWorkflow AND Workflow.queryStatus>

dojo.reload("plugins.workflow.RunStatus");
dojo.reload("plugins.core.reload");
dojo.reloadPage();


    
</entry>
<entry [Thu 2012:10:11 19:40:11 EST] Workflow::stopWorkflow>

-rwsr-sr-x  1 root   root   8887 Jul 12 19:38 view.cgi*
-rwsr-sr-x  1 root   root   2140 Jul 12 19:38 view.pl*
-rwsr-sr-x  1 root   root   8891 Jul 12 19:38 workflow.cgi*
-rwsr-sr-x  1 root   root   2401 Oct  1 08:46 workflow.pl*
syoung@syoung-Satellite-C675D:/var/www/cgi-bin/agua$ ll log/
ls: cannot open directory log/: Permission denied
syoung@syoung-Satellite-C675D:/var/www/cgi-bin/agua$ cgi
syoung@syoung-Satellite-C675D:/var/www/cgi-bin/agua$ suu
root@syoung-Satellite-C675D:/mnt/agua/cgi-bin# echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"admin-smallcluster","mode":"stopWorkflow","start":1,"SHOWLOG":4}' | ./workflow.pl
Content-type: text/html

This is connection number 1
whoami: root<br>
JSON Parser: 0.260749
mode: stopWorkflow
Instantiate Conf::Agua: 0.260975
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::initialise	149	json: {"workflow":"Workflow1","cluster":"admin-smallcluster","sessionId":"9999999999.9999.999","mode":"stopWorkflow","project":"Project1","SHOWLOG":4,"start":1,"username":"admin"}
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::initialise	177	Doing self->setDbh
2012-10-11 19:39:16    [CALLER]   	Agua::Common::Base::isTestUser	423	caller: Agua::Common::Database::setDbh	178	
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Base::isTestUser	424	username: undef
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Base::isTestUser	431	username: admin
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Base::isTestUser	434	testuser: aguatest
2012-10-11 19:39:16    [DEBUG]   	Agua::DBase::MySQL::initialise	58	ref parent: Agua::Workflow
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::initialise	181	mode: stopWorkflow
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validate	87	username: admin
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validate	88	requestor: 
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validate	89	session_id: 9999999999.9999.999
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validateGuest	144	guestuser: guest
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validateGuest	146	guestaccess: 1
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validateGuest	148	guestlock: 0
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validate	93	guestvalidated: 1
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validateTest	186	username: admin
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validateTest	188	testuser: aguatest
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validate	111	query: 
	SELECT username FROM sessions
	WHERE username = 'admin'
	AND sessionid = '9999999999.9999.999'
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validate	113	validated: admin
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validate	126	Update query: UPDATE sessions
	SET datetime = NOW()
	WHERE username = 'admin'
	AND sessionid = '9999999999.9999.999'
2012-10-11 19:39:16    [DEBUG]   	Agua::Common::Privileges::validate	128	Update success: 1
Instantiate Agua::Workflow: 0.450528
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::stopWorkflow	823	()    Agua::Workflow::stopWorkflow()
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::stopWorkflow	836	project: Project1
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::stopWorkflow	837	start: 0
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::stopWorkflow	838	workflow: Workflow1
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::stopWorkflow	847	SELECT * FROM stage
WHERE username ='admin'
AND project = 'Project1'
AND workflow = 'Workflow1'
AND status='running'
ORDER BY number
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::stopWorkflow	849	stages: [{"stagedescription":"","stagepid":"5998","number":"1","status":"running","project":"Project1","submit":"0","workflowpid":"0","stagenotes":"","stagename":"","stagejobid":"0","completed":"0000-00-00 00:00:00","owner":"admin","workflownumber":"1","cluster":"","stderrfile":"/nethome/admin/agua/Project1/Workflow1/stdout/1-FTP.stderr","location":"bin/utils/FTP.pl","version":"0.6.0","installdir":"/agua/bioapps","executor":"/usr/bin/perl","name":"FTP","stdoutfile":"/nethome/admin/agua/Project1/Workflow1/stdout/1-FTP.stdout","package":"bioapps","username":"admin","workflow":"Workflow1","started":"2012-10-11 19:32:52","type":"utility","queued":"0000-00-00 00:00:00"}]
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::stopWorkflow	859	submit: 0
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::stopWorkflow	869	Doing killLocalJob(stages)
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::killLocalJob	956	Agua::Workflow::killLocalJob(stages)
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::killPid	981	kill command: kill -9 5998
2012-10-11 19:39:16    [DEBUG]   	Agua::Workflow::killPid	981	kill command: kill -9 0
Killed
print Dumper c; 
    
</entry>
<entry [Wed 2012:10:10 17:13:48 EST] RUN FTP WORKFLOW>

http://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes

    
</entry>
<entry [Mon 2012:10:01 09:02:03 EST] INIT FULL LOAD>

SUMMARY

- WORKS FINE WHEN NOT DEALING WITH ALREADY ATTACHED VOLUMES 

- TEST MORE FOR fuser/lsof METHODS TO NEATLY DETACH VOLUMES (ASSUMING THIS IS THE CAUSE OF DIFFICULTY ATTACHING NEW VOLUMES)



1. CURRENT VOLUMES

ec2din $head2

    RESERVATION	r-f3745b94	728213020069	default
    INSTANCE	i-7ba84006	ami-11c67678	ec2-174-129-136-119.compute-1.amazonaws.com	ip-10-122-13-43.ec2.internal	running	aquarius2	0	m1.small	2012-10-01T12:39:16+0000	us-east-1a	aki-825ea7eb		monitoring-disabled	174.129.136.119	10.122.13.43			ebs	paravirtual	xen		sg-2925d740	default
    BLOCKDEVICE	/dev/sda1	vol-4f68cf35	2012-09-24T20:47:17.000Z	
    BLOCKDEVICE	/dev/sdh	vol-ec00b096	2012-09-26T16:40:17.000Z	
    BLOCKDEVICE	/dev/sdi	vol-98b936e2	2012-09-28T13:59:20.000Z	
    TAG	instance	i-7ba84006	description	TESTING init.html
    TAG	instance	i-7ba84006	name	aquarius-8h



2. DETACH VOLUMES

umount /data
ec2-detach-volume vol-ec00b096

umount /nethome
ec2-detach-volume vol-98b936e2



3. CREATED NEW VOLUMES AND ATTACHED

FAILED TO BOOT - PROBLEM WAS MYSQL BIND LINES IN /etc/fstab 
SO USED RESCUE INSTANCE TO COMMENT OUT MYSQL BIND LINES


SEE [Mon 2012:10:01 21:50:42 EST]
i-674fff1a RESCUE INSTANCE TO FIX i-7ba84006 USED TO TEST init.html

SEE [Mon 2012:10:01 23:56:18 EST] RECOVER FROM STOP WHEN INSTANCE WON'T START BECAUSE VOLUMES ARE NOT ATTACHED



4. RESTARTED TEST init.html INSTANCE

ec2din $head2

    RESERVATION	r-f3745b94	728213020069	default
    INSTANCE	i-7ba84006	ami-11c67678	ec2-54-242-18-137.compute-1.amazonaws.com	ip-10-124-7-91.ec2.internal	running	aquarius2	0		m1.small	2012-10-02T02:31:37+0000	us-east-1a	aki-825ea7eb			monitoring-disabled	54.242.18.137	10.124.7.91			ebs				paravirtual	xen		sg-2925d740	default
    BLOCKDEVICE	/dev/sdh	vol-4b472531	2012-10-01T21:22:25.000Z	
    BLOCKDEVICE	/dev/sdi	vol-fb442681	2012-10-01T21:26:06.000Z	
    BLOCKDEVICE	/dev/sda1	vol-4f68cf35	2012-10-02T02:29:53.000Z	
    TAG	instance	i-7ba84006	description	TESTING init.html
    TAG	instance	i-7ba84006	name	aquarius-8h



/data WAS MOUNTED OKAY
/nethome WAS NOT MOUNTED

parted -l GAVE THIS ERROR MESSAGE WITH /nethome:

Error: /dev/xvdi: unrecognised disk label


SO REMOVED VOLUME AND TRIED AGAIN

ec2-detach-volume vol-fb442681
ec2-detach-volume vol-4b472531

ec2delvol vol-fb442681
ec2delvol vol-4b472531


    
</entry>
<entry [Tue 2012:09:25 01:23:56 EST] TEST init.html>

1. LAUNCHED ERIDANUS-0.8.0-alpha.1+build.1 AMI (POST install.pl AND config.pl)

2. CREATED ERIDANUS-0.8.0-alpha.2 AS AGUA BASE

3. TESTED init.html

TEST PARAMETERS:

./init.pl '{"username":"agua","mode":"init","data":{"username":"admin","amazonuserid":"728213020069","datavolume":"snap-6341b301","uservolume":"","datavolumesize":200,"uservolumesize":100,"datavolumecheckbox":0,"uservolumecheckbox":0,"ec2publiccert":"-----BEGIN CERTIFICATE-----\nMIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC\nVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY\nQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy\nNDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV\nBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w\nDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ\neWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr\ndtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5\n9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK\nBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti\nZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7\ncPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU\nbs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z\n0626imzblXE8IA==\n-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----\nMIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ\nWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ\nNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC\ngYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3\n8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG\nM6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC\naE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK\npzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9\n4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc\n6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC\nQQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN\nukFcKuTSGIpO\n-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIKZHIY7T75JIF34A","awssecretaccesskey":"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","username":"admin","password":"aaa"},"SHOWLOG":4}'


4. CHECK /data SNAPSHOT

LOADED SNAPSHOT:

Agua::Init::mountData    create_command: ec2-create-volume --snapshot snap-6341b301 -s 200 -z us-east-1a -K /agua/conf/.ec2/admin/private.pem -C /agua/conf/.ec2/admin/public.pem  | grep VOLUME | cut -f2
Agua::Init::mountData    volumeid: vol-c268dcb8
Agua::Init::mountData    instanceid: i-7ba84006

CONFIRMED ITS THE LATEST:

ec2dsnap snap-6341b301
    OK
    SNAPSHOT	snap-6341b301	vol-5bffe631	completed	2011-10-29T06:36:52+0000	100%	728213020069	200	200GB BIOINFORMATICS DATA VOLUME: REFERENCE SEQUENCES AND JBROWSE DATA
    TAG	snapshot	snap-6341b301	Name	AQUARIUS-8 /data
    
</entry>
<entry [Mon 2012:09:24 02:02:18 EST] BUILD 027 PERFORMANCE BENCHMARKS>

SUMMARY: MASSIVE SPEEDUP - BUILD IS 7 TO 13 TIMES FASTER THAN WITHOUT BUILD

LOAD TIMES ARE NOW WITHIN A REASONABLE RANGE FOR CASUAL USER

INITIAL LOAD IS 2 SECONDS (7 TIMES FASTER)
PLUGINS LOAD IS 6 SECONDS (13 TIMES FASTER)
WORKFLOW PANE LOAD IS 5 SECONDS (8 TIMES FASTER)


RESULTS:

1. LOAD INITIAL LOGIN

                    LOAD    TOTAL (secs)

WITHOUT BUILD      14.88    21.36

WITH BUILD          2.25    11.83



2. LOAD PLUGINS

WITHOUT BUILD       80

WITH BUILD           6.1



3. WORKFLOW PANE LOAD

                    TRANSFER (TOTAL)

WITHOUT BUILD       41.64       1.28 (10)   1.34 (10)        

WITH BUILD           5.09 (14)  1.13 (10)   1.07 (10)


    
</entry>
<entry [Sat 2012:09:22 11:12:14 EST] TROUBLESHOT AGUA BUILD 027>

MODIFIED agua.html
<!--
<script type="text/javascript">

dojo.registerModulePath("plugins", "../../plugins");

	
var loaded = [];
var oldLoaded = {};

var getLoaded = function () {
	loaded = [];
	if(dojo._loadedModules){
		for(var m in dojo._loadedModules){
			//console.log(m);
			if ( ! oldLoaded[m] )
				loaded.push(m);
			oldLoaded[m]= 1;
		}
	}
};

var showLoaded = function () {
	getLoaded();
	console.log("Loaded modules:")
	for( var m in loaded ) {
		console.log(loaded[m]);
	}
}
//console.log("*************************** AFTER  dojo/dojo/dojo.js")
//showLoaded();
</script>

<script type="text/javascript"
	src="build/agua_dojo_dijit.js.uncompressed.js">
</script>

<script type="text/javascript">
console.log("*************************** AFTER  build/agua_dojo_dijit.js.uncompressed.js")
getLoaded();
</script>


<script type="text/javascript">
//	src="dojo/dojoc/util/loader.js">
	dojo.require("dojoc.util.loader");
</script>

<script type="text/javascript">
console.log("*************************** AFTER  dojo/dojoc/util/loader.js")
getLoaded();
console.clear();
</script>


<script
	type="text/javascript"
	src="build/agua_all.js.uncompressed.js">
</script>

<script type="text/javascript">
console.log("*************************** AFTER  build/agua_all.js.uncompressed.js")
showLoaded();
</script>



<script type="text/javascript">

console.log("agua.html    dojo._loadedModules:");
console.dir({dojo__loadeModules:dojo._loadedModules});

// DEBUG LOADER
//dojo.require("dojoc.util.loader");
//dojo.require("plugins.core.Agua");

</script>

-->


CHECK LOADS OF PROGRESSIVELY 


agua_all.10000.js to DIJIT._WIDGET      OK

    plugins.core.Common.Array
    plugins.core.Common.ComboBox
    plugins.core.Common.Date
    plugins.core.Common.Sort
    plugins.core.Common.Text
    plugins.core.Common.Util
    plugins.core.Common

agua_all.20000.js TO plugins.form.Inputs    OK

    plugins.core.Common.Array
    plugins.core.Common.ComboBox
    plugins.core.Common.Date
    plugins.core.Common.Sort
    plugins.core.Common.Text
    plugins.core.Common.Util
    plugins.core.Common
    plugins.admin.Admin
    plugins.admin.AmiRow
    plugins.dnd.Avatar
    plugins.dnd.Manager
    plugins.dnd.Source
    plugins.form.ValidationTextarea
    plugins.form.DndSource
    plugins.form.EditRow
    plugins.form.DndTrash

agua_all.30000.js TO plugins.admin.Hub      OK
    
    plugins.core.Common.Array
    plugins.core.Common.ComboBox
    plugins.core.Common.Date
    plugins.core.Common.Sort
    plugins.core.Common.Text
    plugins.core.Common.Util
    plugins.core.Common
    plugins.admin.Admin
    plugins.admin.AmiRow
    plugins.dnd.Avatar
    plugins.dnd.Manager
    plugins.dnd.Source
    plugins.form.ValidationTextarea
    plugins.form.DndSource
    plugins.form.EditRow
    plugins.form.DndTrash
    plugins.form.Inputs
    plugins.form.EditForm
    plugins.admin.Amis
    plugins.admin.AppRow
    plugins.dijit.SyncDialog
    plugins.admin.Apps
    plugins.admin.Aws
    plugins.admin.ClusterRow
    plugins.admin.Clusters
    plugins.admin.ConfirmDialogue
    plugins.admin.Controller

agua_all.35000.js TO plugins.core.Agua.Hub

    plugins.core.Common.Array
    plugins.core.Common.ComboBox
    plugins.core.Common.Date
    plugins.core.Common.Sort
    plugins.core.Common.Text
    plugins.core.Common.Util
    plugins.core.Common
    plugins.admin.Admin
    plugins.admin.AmiRow
    plugins.dnd.Avatar
    plugins.dnd.Manager
    plugins.dnd.Source
    plugins.form.ValidationTextarea
    plugins.form.DndSource
    plugins.form.EditRow
    plugins.form.DndTrash
    plugins.form.Inputs
    plugins.form.EditForm
    plugins.admin.Amis
    plugins.admin.AppRow
    plugins.dijit.SyncDialog
    plugins.admin.Apps
    plugins.admin.Aws
    plugins.admin.ClusterRow
    plugins.admin.Clusters
    plugins.admin.ConfirmDialogue
    plugins.admin.Controller
    plugins.admin.Hub
    plugins.admin.PackageRow
    plugins.admin.Packages
    plugins.admin.ParameterRow
    plugins.admin.Parameters
    plugins.admin.UserRow
    plugins.admin.Personal
    plugins.admin.Settings
    plugins.core.Updater
    plugins.core.Agua.Data
    plugins.core.Agua.Admin
    plugins.core.Agua.App
    plugins.core.Agua.Aws
    plugins.core.Agua.Cluster
    plugins.core.Agua.Feature
    plugins.core.Agua.File
    plugins.core.Agua.Group

agua_all.37500.js TO plugins.core.Agua.Workflow
    
    plugins.core.Common.Array
    plugins.core.Common.ComboBox
    plugins.core.Common.Date
    plugins.core.Common.Sort
    plugins.core.Common.Text
    plugins.core.Common.Util
    plugins.core.Common
    plugins.admin.Admin
    plugins.admin.AmiRow
    plugins.dnd.Avatar
    plugins.dnd.Manager
    plugins.dnd.Source
    plugins.form.ValidationTextarea
    plugins.form.DndSource
    plugins.form.EditRow
    plugins.form.DndTrash
    plugins.form.Inputs
    plugins.form.EditForm
    plugins.admin.Amis
    plugins.admin.AppRow
    plugins.dijit.SyncDialog
    plugins.admin.Apps
    plugins.admin.Aws
    plugins.admin.ClusterRow
    plugins.admin.Clusters
    plugins.admin.ConfirmDialogue
    plugins.admin.Controller
    plugins.admin.Hub
    plugins.admin.PackageRow
    plugins.admin.Packages
    plugins.admin.ParameterRow
    plugins.admin.Parameters
    plugins.admin.UserRow
    plugins.admin.Personal
    plugins.admin.Settings
    plugins.core.Updater
    plugins.core.Agua.Data
    plugins.core.Agua.Admin
    plugins.core.Agua.App
    plugins.core.Agua.Aws
    plugins.core.Agua.Cluster
    plugins.core.Agua.Feature
    plugins.core.Agua.File
    plugins.core.Agua.Group
    plugins.core.Agua.Hub
    plugins.core.Agua.Package
    plugins.core.Agua.Parameter
    plugins.core.Agua.Project
    plugins.core.Agua.Report
    plugins.core.Agua.Shared
    plugins.core.Agua.Sharing
    plugins.core.Agua.Source
    plugins.core.Agua.Stage
    plugins.core.Agua.StageParameter
    plugins.core.Agua.User
    plugins.core.Agua.View

agua_all.38500 TO plugins.core.Agua
    
    plugins.core.Common.Array
    plugins.core.Common.ComboBox
    plugins.core.Common.Date
    plugins.core.Common.Sort
    plugins.core.Common.Text
    plugins.core.Common.Util
    plugins.core.Common
    plugins.admin.Admin
    plugins.admin.AmiRow
    plugins.dnd.Avatar
    plugins.dnd.Manager
    plugins.dnd.Source
    plugins.form.ValidationTextarea
    plugins.form.DndSource
    plugins.form.EditRow
    plugins.form.DndTrash
    plugins.form.Inputs
    plugins.form.EditForm
    plugins.admin.Amis
    plugins.admin.AppRow
    plugins.dijit.SyncDialog
    plugins.admin.Apps
    plugins.admin.Aws
    plugins.admin.ClusterRow
    plugins.admin.Clusters
    plugins.admin.ConfirmDialogue
    plugins.admin.Controller
    plugins.admin.Hub
    plugins.admin.PackageRow
    plugins.admin.Packages
    plugins.admin.ParameterRow
    plugins.admin.Parameters
    plugins.admin.UserRow
    plugins.admin.Personal
    plugins.admin.Settings
    plugins.core.Updater
    plugins.core.Agua.Data
    plugins.core.Agua.Admin
    plugins.core.Agua.App
    plugins.core.Agua.Aws
    plugins.core.Agua.Cluster
    plugins.core.Agua.Feature
    plugins.core.Agua.File
    plugins.core.Agua.Group
    plugins.core.Agua.Hub
    plugins.core.Agua.Package
    plugins.core.Agua.Parameter
    plugins.core.Agua.Project
    plugins.core.Agua.Report
    plugins.core.Agua.Shared
    plugins.core.Agua.Sharing
    plugins.core.Agua.Source
    plugins.core.Agua.Stage
    plugins.core.Agua.StageParameter
    plugins.core.Agua.User
    plugins.core.Agua.View
    plugins.core.Agua.Workflow
    plugins.core.Plugin
    plugins.core.PluginManager


agua_all.40000.js TO dojox.widget.RollingList   BAD


/agua/html/build$ grep -n "dojo.declare" agua_all.js.uncompressed.js  | grep plugins | grep workflow
25033:dojo.declare( "plugins.workflow.AppSource",
25113:dojo.declare( "plugins.workflow.AppRow",
26563:dojo.declare("plugins.workflow.AppsMenu",
26692:dojo.declare("plugins.workflow.Apps",
26862:dojo.declare("plugins.workflow.SharedApps",
26951:dojo.declare( "plugins.workflow.StageStatusRow",
27023:dojo.declare("plugins.workflow.StageStatus",
37783:dojo.declare( "plugins.workflow.StageRow",
38609:dojo.declare("plugins.workflow.StageMenu",
38941:dojo.declare( "plugins.workflow.IO",
40365:dojo.declare("plugins.workflow.Workflows",
42176:dojo.declare("plugins.workflow.SharedWorkflows",
45059:dojo.declare( "plugins.workflow.ParameterRow",
46126:dojo.declare("plugins.workflow.Parameters",
46774:dojo.declare( "plugins.workflow.Workflow",
47100:dojo.declare( "plugins.workflow.ClusterStatus",
47464:dojo.declare("plugins.workflow.reload", [], {});
50542:dojo.declare( "plugins.workflow.GridStage",
51153:dojo.declare("plugins.workflow.GridWorkflow",
51353:dojo.declare("plugins.workflow.Grid",
51759:dojo.declare( "plugins.workflow.Controller",
51868:dojo.declare( "plugins.workflow.RunStatus",
52890:dojo.declare( "plugins.workflow.HistoryPane",
52962:dojo.declare( "plugins.workflow.HistoryPaneRow",
53320:dojo.declare("plugins.workflow.UserWorkflows",
53517:dojo.declare("plugins.workflow.History",
syoung@syoung-Satellite-C675D:/agua/html/build$ grep -n "dojo.declare" agua_all.js.uncompressed.js  | grep plugins | grep workflow

    
</entry>
<entry [Thu 2012:09:20 19:19:41 EST] COMPLETED RunStatus SHOW lapsed TIME>

FIREBUG:

console.clear();
var runstatus = Agua.controllers["workflow"].tabPanes[0].core.runStatus;
console.dir({runstatus:runstatus});
var status = runstatus.stageStatus;
console.dir({status:status});
var stages = status.stages;
console.dir({stages:stages});
status.clearTable = function () {
    console.log("DOING stageStatus.clearTable()");
    while ( this.stageTable.childNodes && this.stageTable.childNodes.length ) {
    console.log("REMOVING node " + this.stageTable.childNodes[0]);
        this.stageTable.removeChild(this.stageTable.childNodes[0]);
    }
}
//status.clearTable();
status.startup(stages);

    
</entry>
<entry [Wed 2012:09:19 00:41:12 EST] FIXED File.pm ERROR WHEN STARTING >

SUMMARY: ADDED REGEX TO DESIGNATE .vld AND .2bpb FILES AS BINARY


PROBLEM:

[Wed Sep 19 04:28:52 2012] [error] [client 69.65.67.54] FastCGI: server "/var/www/cgi-bin/agua/workflow.cgi" stderr: Use of uninitialized value $_ in pattern match (m//) at /agua/cgi-bin/lib/Agua/Common/File.pm line 605., referer: http://ec2-23-22-111-144.compute-1.amazonaws.com/agua/agua.html


DIAGNOSIS:

PERL IS INCORRECTLY IDENTIFYING SOME .vld FILES AS NON-BINARY (ALL ARE BINARY)

    
</entry>
<entry [Fri 2012:09:14 03:06:37 EST] Common::Ssh TEST SSH METHODS remoteCommand AND sshCommand FOR STDIN FILEHANDLE ERROR BY Net::OpenSSH>

1. SET ENVIRONMENT VARIABLES

em /agua/conf/syoung/envars.sh

    #!/bin/sh                                                                         
    export remoteuser=root
    export targetip=$HEADIP
    export keyfile=/home/syoung/.ssh/id_rsa

source /agua/conf/syoung/envars.sh


2. RUN TEST WITH COMMAND

./Ssh.t --command "ls /tmp"



    
</entry>
<entry [Tue 2012:09:11 23:43:00 EST] Workflow::getStatus>

FIREBUG


var doIt = function () {
    console.clear();

    var runstatus = Agua.controllers["workflow"].tabPanes[0].core.runStatus;
    console.dir({runstatus:runstatus});

    var runner = runstatus.createRunner(1,3);
    console.dir({runner:runner});

    runstatus.polling = true;
    runstatus.queryStatus(runner, 1);
    
};

doIt();



//var response = {"queuestatus":"=================================================================================\nqueuename                      qtype resv/used/tot. load_avg arch          states\n---------------------------------------------------------------------------------\nadmin-Project1-Workflow1@ip-10 BIP   0/0/1          0.02     linux-x64     \n","stagestatus":[{"stagedescription":"","stagepid":"2","number":"1","status":"completed","project":"Project1","submit":"1","workflowpid":"0","stagenotes":"","stagename":"","stagejobid":"0","completed":"2012-09-15 09:55:35","owner":"admin","workflownumber":"1","cluster":"","stderrfile":"/nethome/admin/agua/Project1/Workflow1/stdout/1-FTP.stderr","location":"bin/utils/FTP.pl","version":"0.6.0","installdir":"/agua/bioapps","executor":"","name":"FTP","stdoutfile":"/nethome/admin/agua/Project1/Workflow1/stdout/1-FTP.stdout","package":"bioapps","username":"admin","workflow":"Workflow1","now":"2012-09-15 10:29:34","started":"2012-09-15 09:55:20","type":"utility","queued":"2012-09-15 09:55:09"},{"stagedescription":"","stagepid":"3","number":"2","status":"completed","project":"Project1","submit":"1","workflowpid":"0","stagenotes":"","stagename":"","stagejobid":"0","completed":"2012-09-15 09:55:58","owner":"admin","workflownumber":"1","cluster":"","stderrfile":"/nethome/admin/agua/Project1/Workflow1/stdout/2-unzipFiles.stderr","location":"bin/utils/unzipFiles.pl","version":"0.6.0","installdir":"/agua/bioapps","executor":"","name":"unzipFiles","stdoutfile":"/nethome/admin/agua/Project1/Workflow1/stdout/2-unzipFiles.stdout","package":"bioapps","username":"admin","workflow":"Workflow1","now":"2012-09-15 10:29:34","started":"2012-09-15 09:55:53","type":"utility","queued":"2012-09-15 09:55:38"},{"stagedescription":"","stagepid":"4","number":"3","status":"completed","project":"Project1","submit":"1","workflowpid":"0","stagenotes":"","stagename":"","stagejobid":"0","completed":"2012-09-15 09:56:12","owner":"admin","workflownumber":"1","cluster":"","stderrfile":"/nethome/admin/agua/Project1/Workflow1/stdout/3-elandIndex.stderr","location":"bin/converters/elandIndex.pl","version":"0.6.0","installdir":"/agua/bioapps","executor":"","name":"elandIndex","stdoutfile":"/nethome/admin/agua/Project1/Workflow1/stdout/3-elandIndex.stdout","package":"bioapps","username":"admin","workflow":"Workflow1","now":"2012-09-15 10:29:34","started":"2012-09-15 09:56:07","type":"converter","queued":"2012-09-15 09:56:01"}],"clusterstatus":">>> Jobstats cache is not full. Pulling full job history.\n>>> Sat Sep 15 10:28:38 UTC 2012\n\n>>> Oldest job is from None. # queued jobs = 0. # hosts = 3.\n>>> Avg job duration = 13 sec, Avg wait time = 7 sec.\n>>> Won't add another host, currently at max (1).\n>>> Checking to remove a node...\n>>> No nodes can be killed at this time.\n>>> Sleeping, looping again in 30 seconds.\n\n>>> Jobstats cache is not full. Pulling full job history.\n>>> Sat Sep 15 10:29:08 UTC 2012\n\n>>> Oldest job is from None. # queued jobs = 0. # hosts = 3.\n>>> Avg job duration = 13 sec, Avg wait time = 7 sec.\n>>> Won't add another host, currently at max (1).\n>>> Checking to remove a node...\n>>> No nodes can be killed at this time.\n>>> Sleeping, looping again in 30 seconds.\n\n"}

//runstatus.handleStatus(response);





var doIt = function () {

    var runstatus = Agua.controllers["workflow"].tabPanes[0].core.runStatus;
    console.dir({runstatus:runstatus});

    console.clear();
    Agua.doPut(
    {
        query:{
            
            "username":"admin",
            "sessionId":"9999999999.9999.999",
            "project":"Project1",
            "workflow":"Workflow1",
            "mode":"getStatus",
            "SHOWLOG":2,
            "callback": runstatus.handleStatus 
        },
        url: "../cgi-bin/agua/workflow.cgi"
    });
};
doIt();


COMMAND LINE

echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getStatus","SHOWLOG":5}' | ./workflow.pl



{"error":"Command failed: netstat -ntulp | grep 36351 | grep sge_qmaster 
error message: unable to establish master SSH connection: master process exited unexpectedly","subroutine":"Agua::Ops::sshCommand","linenumber":"284","filename":"/agua/cgi-bin/lib/Agua/Ops.pm","timestamp":"2012-09-12 03:42:06"}


NOTES
-----


var doIt = function () {
    console.clear();

    var runstatus = Agua.controllers["workflow"].tabPanes[0].core.runStatus;
    console.dir({runstatus:runstatus});

    runstatus.handleStatus = function (runner, response) {

	console.group("RunStatus-" + this.id + "    handleStatus");

	var project		=	this.runner.project;

	var workflow	=	this.runner.workflow;

	var start		=	this.runner.start;

	var childNodes	=	this.runner.childNodes;



	console.log("RunStatus.handleStatus     response: ");

	console.dir({response:response});

	

	console.log("RunStatus.handleStatus      this.polling: " + this.polling);

	if ( ! this.polling )	return false;

	

	if ( ! response )	return false;



	// SET MESSAGE

	this.notifier.innerHTML = "Processing run status...";



	// SAVE RESPONSE

	this.response = response;



	// SET COMPLETED FLAG

	this.completed = true;

	

	// SET THE NODE CLASSES BASED ON STATUS

	console.log("RunStatus.handleStatus    Setting class of " + response.stagestatus.length  + " stage nodes");

	

	// CHANGE CSS ON RUN NODES

	var startIndex = runner.start - 1;

	if ( startIndex < 0 ) startIndex = 0;

	console.log("RunStatus.handleStatus    startIndex: " + startIndex);

	for ( var i = startIndex; i < response.stagestatus.length; i++ ) {

		var nodeClass = response.stagestatus[i].status;

		console.log("RunStatus.handleStatus   response.stagestatus[" + i + "].status: " + response.stagestatus[i].status);

		//console.log("RunStatus.handleStatus    response nodeClass " + i + ": " + nodeClass);

		//console.log("RunStatus.handleStatus    runner.childNodes[" + i + "]: " + runner.childNodes[i]);



		// SKIP IF NODE NOT DEFINED

		if ( ! runner.childNodes[i] )

			continue;



		dojo.removeClass(runner.childNodes[i], 'stopped');

		dojo.removeClass(runner.childNodes[i], 'waiting');

		dojo.removeClass(runner.childNodes[i], 'running');

		dojo.removeClass(runner.childNodes[i], 'completed');

		dojo.addClass(runner.childNodes[i], nodeClass);

		

		// UNSET COMPLETED FLAG IF ANY NODE IS NOT COMPLETED

		if ( nodeClass != "completed" ) {

			console.log("RunStatus.handleStatus    Setting this.completed = false");

			this.completed = false;

		}

	}



	if ( this.completed == true ) {

		this.stopPolling();

	}

	console.log("RunStatus.handleStatus    this.completed: " + this.completed);

	console.log("RunStatus.handleStatus    this: ");

	console.dir({this:this});



	console.log("RunStatus.handleStatus     BEFORE Agua.updateStagesStatus(startIndex, response)");

	Agua.updateStagesStatus(response.stagestatus);

	console.log("RunStatus.handleStatus     AFTER Agua.updateStagesStatus(startIndex, response)");



	console.log("RunStatus.handleStatus     BEFORE this.showStatus(startIndex, response)");

	this.showStatus(response);

	console.log("RunStatus.handleStatus     AFTER this.showStatus(startIndex, response)");



	console.groupEnd("RunStatus-" + this.id + "    handleStatus");

	

	return null;

};


    runstatus.showStatus = function (response) {

// POPULATE THE 'STATUS' PANE WITH RUN STATUS INFO

	console.log("RunStatus.showStatus      response: ");

	console.dir({response:response});

    if ( ! response ) return;

	

	// SET TIME AT TOP OF STATUS PANEL

	this.setTime(response.stagestatus[0]);



	// SHOW STAGES STATUS

	console.log("RunStatus.showStatus      Doing this.displayStageStatus(response.stages)");

	this.displayStageStatus(response.stagestatus);



	// SHOW CLUSTER STATUS

	console.log("RunStatus.showStatus      Doing this.displayRunStatus(response.clusterstatus)");

	this.displayClusterStatus(response.clusterstatus);



	// SHOW QUEUE STATUS

	console.log("RunStatus.showStatus      Doing this.displayQueueStatus(response.queuestatus)");

	this.displayQueueStatus(response.queuestatus);

};

    runstatus.clusterStatus.displayStatus = function (status) {

	console.log("ClusterStatus.displayStatus      this:");

	console.dir({this:this});

	

	console.log("ClusterStatus.displayStatus      status:");

	console.dir({status:status});

	if ( ! status ) {

		status = {

			clusterList : "No nodes running",

			clusterLog: "No log output available"

		};

	}

		

	// REMOVE EXISTING STATUS 	

	this.clearStatus();
    console.log("AFTER this.clearStatus");


	// DISPLAY STATUS

<!--	this.clusterList.innerHTML = "<PRE>" + status.clusterList + "</PRE>";

	this.clusterLog.innerHTML = "<PRE>" + status.clusterLog + "</PRE>";
-->


	if ( status && status.clusterName )

		this.clusterName.innerHTML = status.clusterName;

		

	if ( status && status.clusterStatus ) {

		this.status = status.clusterStatus;

		this.clusterStatus.innerHTML = status.clusterStatus;

	}

};





    var runner = runstatus.createRunner(1,3);
    runstatus.runner = runner;
    console.dir({runner:runner});

    runstatus.polling = true;
    runstatus.queryStatus(runner, 1);
    
};

doIt();






    
</entry>
