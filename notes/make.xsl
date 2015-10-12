apps.make



<entry [Tue 2013:10:22 23:26:54 EST] make ACTIONS - MORE THAN ONE TARGET>

http://makepp.sourceforge.net/1.19/makepp_tutorial.html
    
</entry>
<entry [Tue 2013:10:22 17:57:31 EST] PASS ARGUMENTS TO A makefile>

QUESTION

How to pass argument to Makefile from command line?

I understand I can do

$ make action VAR="value"
$ value
with Makefile

VAR = "default"
action:
    @echo $(VAR)
How do I get the following behavior?

$ make action value
value
?

ANSWER

@echo action $(filter-out $@,$(MAKECMDGOALS))


You probably shouldn't do this; you're breaking the basic pattern of how Make works. But here it is:

action:
        @echo action $(filter-out $@,$(MAKECMDGOALS))
value1 value2:

    @:    # thanks to William Pursell
EDIT:
To explain the first command,

$(MAKECMDGOALS) is the list of "targets" spelled out on the command line, e.g. "action value1 value2".

$@ is an automatic variable for the name of the target of the rule, in this case "action".

filter-out is a function that removes some elements from a list. So $(filter-out bar, foo bar baz) returns foo baz (it can be more subtle, but we don't need subtlety here).

Put these together and $(filter-out $@,$(MAKECMDGOALS)) returns the list of targets specified on the command line other than "action", which might be "value1 value2".

EDIT:

As @chakrit points out, the value1 value2: rule requires that the arguments "value1" and "value2" be known in advance. The rule should be:

%:      # thanks to chakrit
    @:
    
    
    
</entry>
<entry [Mon 2012:06:04 01:26:01 EST] PASS ARGUMENTS THROUGH A Makefile TO AN APPLICATION>

QUESTION:

Passing an argument through a makefile?
I'm working on a C program that takes arguments is there anyway I can set up the makefile so that I can pass the arguments to the program through the make file

I have it set up now so that

Code:
make run
runs the program I want
Code:
make run aaa
to run the program with arguments aaa


ANSWER: 

If you just add 'aaa' then it will be treated as a makefile target.
But you can add an assignment to a make command to set a variable.
Here is an example-
Code:
$ cat Makefile
OVERRIDING=default
run:
        echo running with $(ARG) and $(OVERRIDING)
$ make run
echo running with  and default
running with and default
$ make run ARG=a
echo running with a and default
running with a and default
$ make run ARG=a OVERRIDING="a little more"
echo running with a and a little more
running with a and a little more

    
</entry>
<entry [Wed 2011:05:25 01:32:46 EST] BUILD --prefix>

    perl Build.PL --prefix /tmp/foo
    perl Makefile.PL PREFIX=/tmp/foo
    
</entry>
<entry [Sun Jan  2 02:38:31 EST 2011] EXAMPLE USING perl Build.PL>

perl Build.PL
    Creating new 'MYMETA.yml' with configuration results
    Creating new 'Build' script for 'Algorithm-C3' version '0.08'

[root@ip-10-127-158-202 Algorithm-C3-0.08]# ./Build
    Building Algorithm-C3

[root@ip-10-127-158-202 Algorithm-C3-0.08]# ./Build test
    t/000_load.t ..................... ok   
    t/001_merge.t .................... ok   
    t/002_merge.t .................... ok   
    t/003_merge.t .................... ok   
    t/004_merge.t .................... ok   
    t/005_order_disagreement.t ....... ok   
    t/006_complex_merge.t ............ ok     
    t/007_cached_merge.t ............. ok     
    t/008_cached_merge_unordered.t ... ok     
    t/009_dbic_merge.t ............... ok   
    t/010_complex_merge_classless.t .. ok     
    t/011_infinite_loop.t ............ ok   
    t/pod.t .......................... skipped: Test::Pod 1.14 required for testing POD
    t/pod_coverage.t ................. skipped: Test::Pod::Coverage 1.04 required for testing POD coverage
    All tests successful.
    Files=14, Tests=77,  1 wallclock secs ( 0.00 usr +  0.00 sys =  0.00 CPU)
    Result: PASS

[root@ip-10-127-158-202 Algorithm-C3-0.08]# ./Build install
    Building Algorithm-C3
    Installing /usr/local/lib/perl5/site_perl/5.8.9/Algorithm/C3.pm
    Installing /usr/local/share/man/man3/Algorithm::C3.3

</entry>
<entry [Thu Mar  4 12:42:07 EST 2010] USE "perl Makefile.PL PREFIX" TO make TO A LOCAL DIRECTORY>

perl Makefile.PL PREFIX=LOCALPATH

SEE
http://search.cpan.org/~kwilliams/Module-Build-0.2806/lib/Module/Build/Cookbook.pm


cd /nethome/syoung/base/pipeline/perlmods/IPC-Run-0.84/IPC-Run-0.84
perl Makefile.PL PREFIX=/nethome/bioinfo/apps/agua/0.4/lib/external
make
make install

cd /nethome/syoung/base/pipeline/perlmods/Date-Manip-5.56
perl Makefile.PL PREFIX=/nethome/bioinfo/apps/agua/0.4/lib/external
make
#make install # --didn't work properly so copied manually

cp -r /nethome/syoung/base/pipeline/perlmods/Date-Manip-5.56/blib/lib/Date /nethome/bioinfo/apps/agua/0.4/lib/external

# OK


cd /nethome/syoung/base/pipeline/perlmods/LSF-0.9/LSF-0.9
perl Makefile.PL PREFIX=/nethome/bioinfo/apps/agua/0.4/lib/external
make
make install

</entry>