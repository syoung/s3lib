perl.archive.1

<entry [Tue 2011:05:03 11:25:12 EST] can, version AND OTHER PERLOBJ METHODS>

Default UNIVERSAL methods
http://perldoc.perl.org/perlobj.html

The UNIVERSAL package automatically contains the following methods that are inherited by all other classes:

isa(CLASS)
isa returns true if its object is blessed into a subclass of CLASS

DOES(ROLE)
DOES returns true if its object claims to perform the role ROLE . By default, this is equivalent to isa .

can(METHOD)
can checks to see if its object has a method called METHOD , if it does then a reference to the sub is returned, if it does not then undef is returned.

VERSION( [NEED] )
VERSION returns the version number of the class (package). If the NEED argument is given then it will check that the current version (as defined by the $VERSION variable in the given package) not less than NEED; it will die if this is not the case. This method is called automatically by the VERSION form of use.


    use Package 1.2 qw(some imported subs);
    # implies:
    Package->VERSION(1.2);

    
</entry>

<entry [Thu 2011:04:14 13:24:59 EST] REPLACE SYSTEM VARIABLES LIKE %WORKFLOW%>

=head2

	SUBROUTINE		path
	
	PURPOSE
	
		FILL OUT THE PATH VARIABLES BY SUBSTITUTING FOR %VARIABLES%
		
		IN THE PATH

=cut

method path {
	my $path	=	shift;

	if ( not defined $path )	{	return;	}

	while ( $path =~ /(%\w+%)/msg )
	{
		my $before = $`;
		my $parameter = "_" . lc($1);
		my $after = $';
		$parameter =~ s/%//g;
		my $value = $self->$parameter();
		if ( defined $value )
		{
			$path = $before . $value . $after;
		}
	}
	
	return $path
}


    
</entry>

<entry [Fri 2011:03:04 17:29:15 EST] CREATED UML OF AGUA>

cd /0.6/lib/Agua
umlclass.pl --without-inherited-methods  -o agua.png -p Agua -r ./ -s 4x8


BUT GIVES ERRORS ----- CHECK BACK LATER




INSTALL DEPENDENCIES
---------------------
XML/LibXML.pm


syoung@hplaptop:~/apps/libs/perl/XML-LibXML/XML-LibXML-1.70$ perl Makefile.PL
enable native perl UTF8
running xml2-config...
using fallback values for LIBS and INC
options:
  LIBS='-L/usr/local/lib -L/usr/lib -lxml2 -lm'
  INC='-I/usr/local/include -I/usr/include'
If this is wrong, Re-run as:
  $ /usr/bin/perl Makefile.PL LIBS='-L/path/to/lib' INC='-I/path/to/include'

looking for -lxml2... no
looking for -llibxml2... no
libxml2 not found
Try setting LIBS and INC values on the command line
Or get libxml2 from 
  http://xmlsoft.org/
If you install via RPMs, make sure you also install the -devel
RPMs, as this is where the headers (.h files) are.

Also, you may try to run perl Makefile.PL with the DEBUG=1 parameter
to see the exact reason why the detection of libxml2 installation
failed or why Makefile.PL was not able to compile a test program.


apt-get install xml2

    OK
    
apt-get install libxml2-dev

    OK
    
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    The following NEW packages will be installed:
      libxml2-dev
    0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
    Need to get 833kB of archives.
    After this operation, 2,826kB of additional disk space will be used.
    Get:1 http://us.archive.ubuntu.com/ubuntu/ maverick-updates/main libxml2-dev amd64 2.7.7.dfsg-4ubuntu0.1 [833kB]
    Fetched 833kB in 1s (525kB/s)      
    Selecting previously deselected package libxml2-dev.
    (Reading database ... 207607 files and directories currently installed.)
    Unpacking libxml2-dev (from .../libxml2-dev_2.7.7.dfsg-4ubuntu0.1_amd64.deb) ...
    Processing triggers for man-db ...
    Setting up libxml2-dev (2.7.7.dfsg-4ubuntu0.1) ..
    

cd /home/syoung/apps/libs/perl/XML-LibXML/XML-LibXML-1.70
perl Makefile.PL

    enable native perl UTF8
    running xml2-config...untested
    Note: libxml2 2.7.7 was not tested with this XML::LibXML version.
    looking for -lxml2... yes
    Checking if your kit is complete...
    Looks good
    Writing Makefile for XML::LibXML



INSTALL UML::Class::Simple

CPAN>

install UML::Class::Simple
    ...    
    Appending installation info to /usr/local/lib/perl/5.10.1/perllocal.pod
      AGENT/UML-Class-Simple-0.18.tar.gz
      /usr/bin/make install  -- OK
    


USAGE

USE THE STANDALONE:
http://search.cpan.org/~agent/UML-Class-Simple-0.18/script/umlclass.pl

umlclass.pl - Utility to generate UML class diagrams from Perl source or runtime

SYNOPSIS 

$ umlclass.pl -M Foo -o foo.png -p "^Foo::"

$ umlclass.pl -o bar.gif -p "Bar::|Baz::" lib/Bar.pm lib/*/*.pm

$ umlclass.pl -o blah.png -p Blah -r ./blib

$ umlclass.pl --without-inherited-methods -o blah.png -r lib
    



USE IT IN A SCRIPT:

http://search.cpan.org/~agent/UML-Class-Simple-0.18/lib/UML/Class/Simple.pm

use UML::Class::Simple;

    # produce a class diagram for Alias's PPI
    # which has already installed to your perl:

    @classes = classes_from_runtime("PPI", qr/^PPI::/);
    $painter = UML::Class::Simple->new(\@classes);
    $painter->as_png('ppi.png');

    # produce a class diagram for your CPAN module on the disk

    @classes = classes_from_files(['lib/Foo.pm', 'lib/Foo/Bar.pm']);
    $painter = UML::Class::Simple->new(\@classes);

    # we can explicitly specify the image size
    $painter->size(5, 3.6); # in inches

    # ...and change the default title background color:
    $painter->node_color('#ffffff'); # defaults to '#f1e1f4'

    # only show public methods and properties
    $painter->public_only(1);

    # hide all methods from parent classes
    $painter->inherited_methods(0);

    $painter->as_png('my_module.png');    
    
    
</entry>
<entry [] SET VERSIONS IN extends AND with STATMENTS>
    
http://search.cpan.org/~drolsky/Moose-1.24/lib/Moose.pm

    extends 'My::Parent'      => { -version => 0.01 },
            'My::OtherParent' => { -version => 0.03 };
An exception will be thrown if the version requirements are not satisfied.

with (@roles)
This will apply a given set of @roles to the local class.

Like with extends, each specified role can be followed by a hash reference with a -version option:

    with 'My::Role'      => { -version => 0.32 },
         'My::Otherrole' => { -version => 0.23 };

    
</entry>

<entry [Fri Feb 25 03:12:58 EST 2011] GOTCHA: MOOSE SYNTAX IN with (...) STATEMENT >
    
MUST MAKE SURE THAT THERE IS NO NEWLINE BETWEEN THE CLASSES AND THE BRACKETS

I.E., THIS

class Agua::Common with (Agua::Common::Util,
	Agua::Common::Shared
	)
{
	
WILL GIVE THIS ERROR BECAUSE IT COUNTS THE NEWLINE AS PART OF THE CLASS NAME
    
    Couldn't load class (Agua::Common) because: Invalid class name (Agua::Common::Shared
	) at /usr/local/lib/perl/5.10.1/Class/MOP.pm line 89

    
    
</entry>

<entry [Fri Jan 28 11:14:56 EST 2011] ALTERNATE WAYS WITH Moose OF GETTING INPUT FROM THE COMMAND LINE>

1. USE OWN getopts IN flow.pl (CURRENTLY USED METHOD)


#### GET MODE
my $mode = shift @ARGV;
usage() if $mode =~ /^-h$/ or $mode =~ /^--help$/;
#print "mode: $mode\n";

#### MANAGE INDIVIDUAL OR NESTED WORKFLOW FILES
if ( $file =~ /\.param$/ ) {
    my $parameter = X::Parameter->new(
        paramfile => $file
    );
    $parameter->getopts();
    $parameter->$mode();    
}


WHERE THE getopts METHOD IS AS FOLLOWS:

    method getopts () {
        #print "X::Workflow::getopts    X::Workflow::getopts()\n";
        my @temp = @ARGV;
        my $args = $self->args();

        my $olderr;
        open $olderr, ">&STDERR";	
        open(STDERR, ">/dev/null") or die "Can't redirect STDERR to /dev/null\n";
        my $options = Getopt::Simple->new();
        $options->getOptions($args, "Usage: blah blah"); 
        open STDERR, ">&", $olderr;

        #print "X::Workflow::getopts    options->{switch}:\n";
        #print Dumper $options->{switch};
        my $switch = $options->{switch};
                
        foreach my $key ( keys %$switch )
        {
            $self->$key($switch->{$key}) if defined $switch->{$key};
        }

        @ARGV = @temp;
        $self->initialise();
    }





2. USE Getopt::Simple TO FILTER THROUGH ONLY NEEDED ARGS FOR app


    my $args =
    {
        owner        => {  type => '=s' },
        name        => {  type => '=s' },
        type        => {  type => '=s' },
        appfile        => {  type => '=s' },
        inputfile    => {  type => '=s' },
        dbfile        => {  type => '=s' },
        dbtype        => {  type => '=s' },
        database    => {  type => '=s' },
        user        => {  type => '=s' },
        password    => {  type => '=s' },
        help        => {  type => '' }
    };
    
    my $olderr;
    open $olderr, ">&STDERR";    
    open(STDERR, ">/dev/null") or die "Can't redirect STDERR to /dev/null\n";
    my $options = Getopt::Simple->new();
    $options->getOptions($args, "Usage: blah blah"); 
    open STDERR, ">&", $olderr;
    
    my $app = X::App->new($options->{switch});
    
    #### RUN QUERY
    no strict;
    eval { $app->$mode($parameter) };
    if ( $@ ){
        print "Error: $@\n";
    }
    exit;



3. USE MooseX::Getopt FOR STRINGENCY ON app ARGS


elsif ( $switch =~ /^work$/ and $mode =~ /App$/ )
{
    #print "workflow.pl    Running $switch app-related method: $mode\n";
    
#    my $app = X::App->new_with_options();
#exit;

    #my $args =
    #{
    #    #owner        => {  type => '=s' },
    #    name        => {  type => '=s' },
    #    #type        => {  type => '=s' },
    #    #inputfile    => {  type => '=s' },
    #    #dbfile        => {  type => '=s' },
    #    #dbtype        => {  type => '=s' },
    #    #database    => {  type => '=s' },
    #    #user        => {  type => '=s' },
    #    #password    => {  type => '=s' },
    #    help        => {  type => '' }
    #};
    #
    #my $olderr;
    #open $olderr, ">&STDERR";    
    #open(STDERR, ">/dev/null") or die "Can't redirect STDERR to /dev/null\n";
    #my $options = Getopt::Simple->new();
    #$options->getOptions($args, "Usage: blah blah"); 
    #open STDERR, ">&", $olderr;
    #print "options:\n";
    #print Dumper $options;

    #my $app = X::App->new_with_options();

#print "ARGV:\n";
#print Dumper @ARGV;
#
    use Getopt::Long qw(GetOptionsFromArray);

    my $wkfile = shift @ARGV;
    print "workflow.pl    wkfile: $wkfile\n";
    print "ARGV: @ARGV\n";
    #my @args = @ARGV;

#    my ($wkfile);
#    my $remainderhash = GetOptionsFromArray(\@args, 
#        'wkfile=s'           => \$wkfile,
#        #'name=s',
#        #'type=s',
#        #'dbfile=s',
#        #'dbtype=s',
#        #'database=s',
#        #'user=s',
#        #'password=s',
#        #'help'
#    );
#    print "return:\n";
#    print Dumper $remainderhash;
#print "ARGV: @ARGV\n";

    my $workflow = X::Workflow->new(
        wkfile =>    $wkfile
    );

    #my $app = X::App->new($remainderhash);
    my $app = X::App->new_with_options($wkfile);
    
    #my $workflow = X::Workflow->new_with_options($options->{switch});

    #### RUN QUERY
    no strict;
    eval {
        $workflow->$mode($app)
    };
    if ( $@ ){
        print "Error: $@\n";
    }
    exit;
}

<entry [Tue Jan 25 00:22:35 EST 2011] INSTALLED Moose LOGGER ON WINDOWS (BUT ROLLED OWN IN THE END)>
    



CLASSES WITH MooseX::Declare
LOGGING WITH MooseX::LogDispatch



INSTALL ON WINDOWS:

1. INSTALL DEPENDENCIES IO::Scalar AND Log::Dispatch::Configurator

ppm install Log::Dispatch
ppm install IO::Scalar


2. INSTALL MooseX::LogDispatch

cd E:\base\apps\perl\modules\MooseX-LogDispatch-1.2002\MooseX-LogDispatch-1.2002
perl Makefile.PL

	*** Module::AutoInstall version 1.03
	*** Checking for Perl dependencies...
	[Core Features]
	- IO::Scalar                  ...missing.
	- Test::More                  ...loaded. (0.96)
	- Test::Exception             ...loaded. (0.27)
	- Moose                       ...loaded. (1.21)
	- Log::Dispatch::Configurator ...missing.
	==> Auto-install the 2 mandatory module(s) from CPAN? [y] y
	*** Dependencies will be installed the next time you type 'nmake'.
	*** Module::AutoInstall configuration finished.
	The required 'nmake' executable not found, fetching it...
	Fetching 'Nmake15.exe' from download.microsoft.com... done!
	Checking if your kit is complete...
	Looks good
	Warning: prerequisite IO::Scalar 0 not found.
	Warning: prerequisite Log::Dispatch::Configurator 0 not found.
	Writing Makefile for MooseX::LogDispatch

nmake

	Microsoft (R) Program Maintenance Utility   Version 1.50
	Copyright (c) Microsoft Corp 1988-94. All rights reserved.
	


</entry>

</entry>







<entry [Sat Jan 22 20:29:57 EST 2011] PACKAGE PERL SCRIPTS INTO EXE FILES WITH Perl Dev Kit's 'PerlApp' OR PAR>

http://www.perlmonks.org/?node_id=555078

1. Using PPM install the modules into your development environment.

2. Create your own modules, when you need them, in a directory under the execution directory. I use /lib.

At the top of my root executable Perl file you will find:

use strict;
use warnings 'all';
use FindBin;
use lib "$FindBin::Bin/lib";

3. Use ActiveStates PerlApp from the Perl Dev Kit (you could possibly use PAR to do the same thing) to create an exe - making sure I tell it where to find my /lib directory so it can load my modules as well.


Generally speaking this will create a bundled file which has all the modules and dependencies in it. This way you need not have Perl installed on the target machines and yet you will have everything you need, including the exact version of Perl you are developing with.

I currently service 1500 users this way with one product. The original version which relied on locally installed Perl and modules was a nightmare - using PAR (which I did for a time ) but more recently PerlApp has been an absolute godsend as far as distribution of executable code is concerned.


</entry>

<entry [Sat Jan 22 20:29:57 EST 2011] DOWNLOADED Moose 1.9902 TRIAL TO CHECK SPEED IMPROVEMENT>

***SKIPPED THIS - TOO TIME-COSTLY ***


ON PEGASUS:

cd /nethome/syoung/base/pipeline/moose/Moose-1.9902
perl Makefile.PL PREFIX=/nethome/syoung/base/pipeline/moose/tmp
make
make install


Moose INSTALLED TO HERE:

/nethome/syoung/base/pipeline/moose/tmp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi


TEST MOOSE

IN workflow.pl

##    unshift @INC, "/nethome/syoung/base/pipeline/moose/tmp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";


#cd /nethome/syoung/0.5/lib/external

#perl -e 'use lib "/nethome/syoung/base/pipeline/moose/tmp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi"; use Moose'

cd /nethome/syoung/base/pipeline/moose/tmp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi

perl -e 'use lib "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8"; use lib "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi"; use lib "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8"; use Moose'




cd /nethome/syoung/base/pipeline/moose/tmp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi

perl -e 'BEGIN {    unshift @INC, "/nethome/syoung/base/pipeline/moose/tmp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";    unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";} use lib "/nethome/syoung/0.5/lib/external"; use lib "/nethome/syoung/0.5/lib"; use Scalar::Util qw(weaken); use Moose';




VERIFIED PACKAGES WITH ppm (NB: IT MODIFIED SOME FILES...)

	Removing Moose from site area ... done
	Moose marked for install
	Installing package ... 
	  Unpacking Moose-1.99.0.2 ... done
	  Updating files in site area ... done
	Installing package done


	Verifying all packages ...
	C:/Perl/site/lib/MooseX/Getopt/Basic.pm: modified
	C:/Perl/site/lib/metaclass.pm: wrong mode 666 expected 444
	C:/Perl/site/lib/metaclass.pm: modified
	C:/Perl/lib/DBD/SQLite.pm: modified
	C:/Perl/lib/Getopt/Long.pm: modified
	3357 files verified
	4 files modified




1. USED nmake TO INSTALL MOOSE LOCALLY TO TEST
http://www.concept47.com/austin_web_developer_blog/windows/gem-install-error-cl-is-not-recognized-as-an-internal-or-external-command/


DOWNLOADED  Visual Studio Express 2010 Pro




USED nmake TO INSTALL TO tmp DIR:

PROBLEM: ERROR WHEN RUNNING nmake - 'cl is not recognized as an internal or external command'

SOLUTION

1. DOWNLOAD locate32 AND LOCATE cl.exe
http://www.concept47.com/austin_web_developer_blog/windows/gem-install-error-cl-is-not-recognized-as-an-internal-or-external-command/

2. ADD LOCATION OF cl.exe TO PATH USING path editor
http://lingo.atspace.com/pathed.html

**** TOO LARGE AND COMPLEX TO DOWNLOAD AND INSTALL FOR THIS TEST ****


E:\base\pipeline\moose\Moose-1.9902-TRIAL>perl Makefile.PL PREFIX=E:\base\pipeli
ne\moose\tmp
***
    Your toolchain doesn't support configure_requires, so Dist::CheckConflicts
    hasn't been installed yet. You should check for conflicting modules
    manually using the 'moose-outdated' script that is installed with
    this distribution once the installation finishes.
***
Warning: prerequisite Eval::Closure 0 not found.
Warning: prerequisite Package::Stash 0.16 not found. We have 0.13.
Warning: prerequisite Package::Stash::XS 0.17 not found.
you are using MSVC... my condolences. at Makefile.PL line 100.
you are using MSVC... my condolences. at Makefile.PL line 100.
Writing Makefile for Moose

E:\base\pipeline\moose\Moose-1.9902-TRIAL>nmake

Microsoft (R) Program Maintenance Utility   Version 1.50
Copyright (c) Microsoft Corp 1988-94. All rights reserved.

        cl -c    -nologo -GF -W3 -MD -Zi -DNDEBUG -O1 -DWIN32 -D_CONSOLE -DNO_ST
RICT -DHAVE_DES_FCRYPT -DUSE_SITECUSTOMIZE -DPRIVLIB_LAST_IN_INC -DPERL_IMPLICIT
_CONTEXT -DPERL_IMPLICIT_SYS -DUSE_PERLIO -DPERL_MSVCRT_READFIX -I. -MD -Zi -DND
EBUG -O1    -DVERSION=\"1.9902\"  -DXS_VERSION=\"1.9902\" /Foxs/Attribute.obj  "
-IC:\Perl\lib\CORE"   xs/Attribute.c
'cl' is not recognized as an internal or external command,
operable program or batch file.
NMAKE : fatal error U1077: 'C:\WINDOWS\system32\cmd.exe' : return code '0x1'
Stop.






INSTALL BY ppm USING DOWNLOADED tar.gz FILE WAS PARTIALLY SUCCESSFUL



1. DOWNLOAD tar.gz FILE AND PUT IN LOCAL DIR

#E:\base\apps\perl\modules\MooseX-LogDispatch-1.2002.tar.gz

E:\base\pipeline\moose\Moose-1.9902-TRIAL.tar.gz


2. CREATE PPD FILE Moose.ppd:
<!--
<?xml version="1.0" encoding="UTF-8"?>
<SOFTPKG NAME="Moose" VERSION="1,99,0,2">
<TITLE>Moose</TITLE>
<ABSTRACT>Blah</ABSTRACT>
<AUTHOR>A Sometwit</AUTHOR>
<IMPLEMENTATION>
	<CODEBASE HREF="file:///e|//base/pipeline/moose/Moose-1.9902-TRIAL.tar.gz"></CODEBASE>
	<INSTALL></INSTALL>
	<UNINSTALL></UNINSTALL>
</IMPLEMENTATION>
</SOFTPKG>

-->
3. INSTALL

cd E:\base\pipeline\moose
ppm install Moose.ppd

	Unpacking Moose-1.99.0.2...done
	Updating files in site area...done


BUT ONLY Conflicts.pm COPIED TO E:/Perl/site/lib/Moose
AND NO NEW Moose DIR IN E:/Perl/site/lib/auto





</entry>

<entry [Thu Jan 20 10:29:57 EST 2011] SOLVED 'Cwd.so: undefined symbol: Perl_Gthr_key_ptr' PROBLEM>

perl: symbol lookup error:
	/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Cwd/Cwd.so:
		undefined symbol: Perl_Gthr_key_ptr


SEARCHED undefined symbol: Perl_Gthr_key_ptr:
http://www.nntp.perl.org/group/perl.perl5.porters/2005/10/msg105636.html


TURNS OUT THE 5.8.8 WAS INSTALLED WITH MULTI-THREADING BUT 5.8.9 WAS NOT AND SOMEHOW user.pl HAS THE perl -V OF VERSION 5.8.9:

perl /agua/cgi-bin/user.pl "username=jgilbert&sessionId=9999999999.9999.999"

	perl -V :
	Summary of my perl5 (revision 5 version 8 subversion 9) configuration:
	  Platform:
		osname=linux, osvers=2.6.21.7-2.fc8xen, archname=x86_64-linux
		uname='linux ip-10-127-158-202 2.6.21.7-2.fc8xen #1 smp fri feb 15 12:34:28 est 2008 x86_64 x86_64 x86_64 gnulinux '
		config_args='-d'
		hint=recommended, useposix=true, d_sigaction=define
		usethreads=undef use5005threads=undef useithreads=undef usemultiplicity=undef
		useperlio=define d_sfio=undef uselargefiles=define usesocks=undef
		use64bitint=define use64bitall=define uselongdouble=undef
		usemymalloc=n, bincompat5005=undef
	  Compiler:
		cc='cc', ccflags ='-fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64',
		optimize='-O2',
		cppflags='-fno-strict-aliasing -pipe -I/usr/local/include'
		ccversion='', gccversion='4.1.2 20080704 (Red Hat 4.1.2-46)', gccosandvers=''
		intsize=4, longsize=8, ptrsize=8, doublesize=8, byteorder=12345678
		d_longlong=define, longlongsize=8, d_longdbl=define, longdblsize=16
		ivtype='long', ivsize=8, nvtype='double', nvsize=8, Off_t='off_t', lseeksize=8
		alignbytes=8, prototype=define
	  Linker and Libraries:
		ld='cc', ldflags =' -L/usr/local/lib'
		libpth=/usr/local/lib /lib /usr/lib /lib64 /usr/lib64 /usr/local/lib64
		libs=-lnsl -ldl -lm -lcrypt -lutil -lc
		perllibs=-lnsl -ldl -lm -lcrypt -lutil -lc
		libc=/lib/libc-2.5.so, so=so, useshrplib=false, libperl=libperl.a
		gnulibc_version='2.5'
	  Dynamic Linking:
		dlsrc=dl_dlopen.xs, dlext=so, d_dlsymun=undef, ccdlflags='-Wl,-E'
		cccdlflags='-fPIC', lddlflags='-shared -O2 -L/usr/local/lib'
	
	
	Characteristics of this binary (from libperl): 
	  Compile-time options: PERL_MALLOC_WRAP USE_64_BIT_ALL USE_64_BIT_INT
							USE_FAST_STDIO USE_LARGE_FILES USE_PERLIO
	  Built under linux
	  Compiled at Jan  2 2011 03:32:09
	  @INC:
		/usr/local/lib/perl5/5.8.9/x86_64-linux
		/usr/local/lib/perl5/5.8.9
		/usr/local/lib/perl5/site_perl/5.8.9/x86_64-linux
		/usr/local/lib/perl5/site_perl/5.8.9
		.
	
	user.pl    @INC:
	/agua/cgi-bin/lib
	/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
	/usr/lib/perl5/site_perl/5.8.8
	/usr/lib/perl5/site_perl
	/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi
	/usr/lib/perl5/vendor_perl/5.8.8
	/usr/lib/perl5/vendor_perl
	/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi
	/usr/lib/perl5/5.8.8



BUT WHEN RUN ON THE COMMAND LINE GET 5.8.8 INFO:

perl -V

	Summary of my perl5 (revision 5 version 8 subversion 8) configuration:
	  Platform:
		osname=linux, osvers=2.6.18-53.el5, archname=x86_64-linux-thread-multi
		uname='linux builder10.centos.org 2.6.18-53.el5 #1 smp mon nov 12 02:14:55 est 2007 x86_64 x86_64 x86_64 gnulinux '
	...










Executive summary: Check that your PERL5LIB environment value is  
sensible.

On 20051013, at 19:14, Bowen Dwelle wrote (three times!):

> /usr/local/bin/perl: relocation error:
> /home/bdwelle/lib/perl/i386-linux/auto/Storable/Storable.so: undefined
> symbol: Perl_Tstack_sp_ptr
> ...
> /usr/local/bin/perl: relocation error:
> /home/bdwelle/lib/perl/i386-linux-thread-multi/auto/Clone/Clone.so
> : undefined symbol: Perl_Gthr_key_ptr

Your unthreaded perl is finding modules that were built against a  
threaded perl. This Should Not Happen, but it is possible to confuse  
perl into making this mistake by naming a directory (or directories)  
containing threaded modules in the PERL5LIB environment variable.  
Look what I get if I do this:

$ PERL5LIB=/System/Library/Perl/5.8.6/darwin-thread-multi-2level:./ 
lib ./perl -MStorable -e1
dyld: lazy symbol binding failed: Symbol not found: _Perl_Tstack_sp_ptr
   Referenced from: /System/Library/Perl/5.8.6/darwin-thread- 
multi-2level/auto/Fcntl/Fcntl.bundle
   Expected in: dynamic lookup

dyld: Symbol not found: _Perl_Tstack_sp_ptr
   Referenced from: /System/Library/Perl/5.8.6/darwin-thread- 
multi-2level/auto/Fcntl/Fcntl.bundle
   Expected in: dynamic lookup

Trace/BPT trap

This is with an uninstalled unthreaded perl running from its build  
directory with its own libraries in ./lib; /System/Library/Perl/5.8.6/ 
darwin-thread-multi-2level is where the threaded modules which ship  
with Mac OS X are to be found; an unthreaded perl won't search it  
unless I force it to.

(I suspect the missing symbol is being flagged from Fcntl because  
Storable probes Fcntl early in its initialisation and, on my system,  
hits threaded XS module. On your system I guess that perl is  
correctly finding an unthreaded Fcntl.)
-- 
Dominic Dunlop




NOTES
-----

http://lists.freebsd.org/pipermail/freebsd-stable/2005-December/020356.html

you should be able to solv this with

portupgrade -f -m '-DWITH_THREADS' perl

and a fresh ports tree easily

after this you might want to upgrade dependent ports

João

PROBLEM WHEN RUNNING workflow.cgi

echo '{"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"getData"}' | perl -U workflow.cgi

	Content-type: text/html
	
	workflow.cgi     input: {"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"getData"}
	workflow.cgi     username: jgilbert
	workflow.cgi     relay script: /agua/cgi-bin/putrelay.pl
	/agua/cgi-bin/user.pl jgilbert 9999999999.9999.999
	workflow::as_user    user_query: username=jgilbert&sessionId=9999999999.9999.999
	workflow::as_user    run_command: perl /agua/cgi-bin/user.pl "username=jgilbert&sessionId=9999999999.9999.999"
	perl: symbol lookup error: /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Cwd/Cwd.so: undefined symbol: Perl_Gthr_key_ptr
	workflow::as_user    result: 
	workflow::as_user    no result returned from /agua/cgi-bin/user.pl script


TRIED MOVING Cwd.so AND Cwd.pm BUT THEN CPAN DIDN'T WORK

mv /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Cwd/Cwd.so /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Cwd/Cwd.so.bkp

mv /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/Cwd.pm /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/Cwd.pm.bkp

SO INSTALLED Cwd.pm (AS PART OF PathTools) MANUALLY:

cd /root/base/apps/perl/modules
wget http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/PathTools-3.33.tar.gz
tar xvfz PathTools-3.33*
cd PathTools-3.33
perl Makefile.PL
make install

	Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
	Installing /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Cwd/Cwd.so
	Installing /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/Cwd.pm
	Appending installation info to /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod


BUT STILL GOT THE SAME ERROR AS ABOVE:

	perl: symbol lookup error: /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Cwd/Cwd.so: undefined symbol: Perl_Gthr_key_ptr






NOTES
-----

HOW TO CHECK INSTALLED MODULES IN perllocal.pod


How do I find out what modules are already installed on my system?

perldoc perllocal


em /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod


Manually you can remove:

/usr/local/lib/perl5/site_perl/5.8.X/Module/Module.pm
OR
/usr/local/lib/perl5/site_perl/5.8.X/Module.pm

depending on the module. (the path might be different on your system, check: perl -e 'print join("\n", @INC);' )

Also see:
http://www.cpan.org/misc/cpan-faq.html#How_delete_Perl_modules





</entry>

<entry [Thu Jan 20 12:50:13 EST 2011] FIXED PROBLEM RUNNING workflow.pl ON PEGASUS - 'weaken is only available with the XS version'>


SUMMARY: INSTALL '-XS' VERSION OF Scalar::Util AND ADD 'use Scalar::Util qw(weaken);' TO workflow.pl


PROBLEM: GET THIS ERROR WHEN RUNNING workflow.pl - 'weaken is only available with the XS version of Scalar::Util'

http://use.perl.org/~Qiang/journal/32464

workflow.pl elandsnp.wk concise

	weaken is only available with the XS version of Scalar::Util at /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/Class/MOP.pm line 12
	BEGIN failed--compilation aborted at /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/Class/MOP.pm line 12.
	Compilation failed in require at /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/Moose/Exporter.pm line 11.
	BEGIN failed--compilation aborted at /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/Moose/Exporter.pm line 11.
	Compilation failed in require at /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/Moose.pm line 15.
	BEGIN failed--compilation aborted at /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/Moose.pm line 15.
	Compilation failed in require at /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/MooseX/Declare/Syntax/Keyword/Class.pm line 10.
	BEGIN failed--compilation aborted at /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/MooseX/Declare/Syntax/Keyword/Class.pm line 10.
	Compilation failed in require at (eval 5) line 1.
	BEGIN failed--compilation aborted at (eval 5) line 1.
	BEGIN failed--compilation aborted at /nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/MooseX/Declare.pm line 13.
	Compilation failed in require at /nethome/syoung/0.5/bin/apps/logic/../../../lib/X/Parameter.pm line 1.
	BEGIN failed--compilation aborted at /nethome/syoung/0.5/bin/apps/logic/../../../lib/X/Parameter.pm line 1.
	Compilation failed in require at /nethome/syoung/0.5/bin/apps/logic/workflow.pl line 76.
	BEGIN failed--compilation aborted at /nethome/syoung/0.5/bin/apps/logic/workflow.pl line 76.


SCALAR::UTIL IS INSTALLED HERE:

locate Scalar/Util
/usr/lib/perl5/5.8.8/Scalar/Util
/usr/lib/perl5/5.8.8/Scalar/Util.pm
/usr/lib/perl5/5.8.8/Scalar/Util/PP.pm
/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/Scalar/Util
/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/Scalar/Util.pm
/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/Scalar/Util/PP.pm



INSTALL Scalar::Util IN /nethome/syoung/0.5/lib/external/perl5-64 (MAKE SURE XS CODE IS INSTALLED):

cd /nethome/syoung/base/pipeline/perlmods
wget http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Scalar-List-Utils-1.23.tar.gz
tar xvfz Scalar*
cd Scalar*


TEST INSTALL TO /nethome/syoung/base/pipeline/perlmods/tmp:

cd /nethome/syoung/base/pipeline/perlmods/Scalar-List-Utils-1.23
perl Makefile.PL PREFIX=/nethome/syoung/base/pipeline/perlmods/tmp
mkdir -p /nethome/syoung/base/pipeline/perlmods/tmp
make
make install

ll ../tmp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/List/Util

	-r--r--r-- 1 syoung bioinfo 1.6K Mar 10  2010 PP.pm
	-r--r--r-- 1 syoung bioinfo 1006 Mar 10  2010 XS.pm


NB: USING -XS FLAG GAVE THE SAME OUTCOME:
mkdir -p /nethome/syoung/base/pipeline/perlmods/tmp2
perl Makefile.PL -XS PREFIX=/nethome/syoung/base/pipeline/perlmods/tmp2
make
make install
	...
	Installing /nethome/syoung/base/pipeline/perlmods/tmp2/lib64/perl5/5.8.8/x86_64-linux-thread-multi/List/Util/XS.pm
	...

COPY TO /nethome/syoung/0.5/lib/external/perl5-64

MODULES

cd /nethome/syoung/base/pipeline/perlmods/tmp
ll lib64/perl5/5.8.8/x86_64-linux-thread-multi/

	drwxr-xr-x 3 syoung bioinfo 2.0K Jan 20 11:57 auto
	drwxr-xr-x 3 syoung bioinfo 2.0K Jan 20 11:57 List
	-rw-rw-r-- 1 syoung bioinfo  256 Jan 20 11:57 perllocal.pod
	drwxr-xr-x 3 syoung bioinfo 2.0K Jan 20 11:57 Scalar


cp -r /nethome/syoung/base/pipeline/perlmods/tmp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/List/* \
/nethome/syoung/0.5/lib/external/perl5-64/5.8.8/x86_64-linux-thread-multi/

cp -r /nethome/syoung/base/pipeline/perlmods/tmp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/Scalar/* \
/nethome/syoung/0.5/lib/external/perl5-64/5.8.8/x86_64-linux-thread-multi/


SHARED OBJECTS

cd /nethome/syoung/base/pipeline/perlmods/tmp
ll /lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/List/Util/
	-rw-rw-r-- 1 syoung bioinfo 1.5K Jan 20 11:57 .packlist
	-r--r--r-- 1 syoung bioinfo    0 Jan 20 11:56 Util.bs
	-r-xr-xr-x 1 syoung bioinfo  89K Jan 20 11:56 Util.so


cp -r /nethome/syoung/base/pipeline/perlmods/tmp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/List \
/nethome/syoung/0.5/lib/external/perl5-64/5.8.8/x86_64-linux-thread-multi/auto/



BUT STILL GOT SAME PROBLEM... SO PUT IT IN site_perl TOO:
/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi

MODULES

cp -r /nethome/syoung/base/pipeline/perlmods/tmp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/List \
/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi

cp -r /nethome/syoung/base/pipeline/perlmods/tmp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/Scalar \
/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi


SHARED OBJECT

cp -r /nethome/syoung/base/pipeline/perlmods/tmp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/List \
/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi/auto/



AND ADDED THIS TO workflow.pl:

use Scalar::Util qw(weaken);



workflow.pl
	workflow.pl    No arguments supplied

	OK!


NB: DIDN'T NEED TO use lib OR DO BEGIN unshift @INC:

###use lib "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
###
###BEGIN {
###    unshift @INC,
###        qw(
###			/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi        );
###}





NOTES
-----

http://lists.bestpractical.com/pipermail/jifty-devel/2006-June/000389.html
This just came up in the last week on P5P.  Scalar::Util::weaken is 
available only in the XS version of Scalar::Util, which some distro's 
fail to provide (they only provide the pure Perl variant, possibly on 
some mistaken belief that they will be less likely to cause problems).

Try to reinstall Scalar::Util off CPAN and make sure that the XS code is 
install, then this error should go away...

John

-- 
John Peacock
Director of Information Research and Technology
Rowman & Littlefield Publishing Group
4501 Forbes Boulevard
Suite H
Lanham, MD  20706
301-459-3366 x.5010
fax 301-429-5748



</entry>

<entry [Wed Jan 19 19:15:30 EST 2011] CPAN FIXED GHOST INSTALLS OF MODULES THAT DIDN'T APPEAR IN 5.8.8>

SUMMARY:

FIXED CPAN o conf PREFIX ARGUMENTS AND INSTALLED THESE MODULES:

install JSON
install File::Copy::Recursive
install Net::LDAP

NB: NEWLY INSTALLED MODULES ALSO DIDN'T APPEAR IN THE FILESYSTEM WHEN USING locate
THIS WAS BECAUSE THEY WERE INSTALLED TO /tmp/temp


NB: PRINT %ENV
alias perlenv="perl -e 'foreach $key (sort keys(%ENV)) { print qq|$key = $ENV{$key}\n|; }'"


TRIED TO INSTALL JSON.pm TO print "\n";5.8.8 WITH CPAN BUT FOUND IT WAS BEING INSTALLED TO

/tmp/temp/lib/perl5/site_perl/5.8.8


CHECK OF o conf IN CPAN SHOWED PACKAGES BEING INSTALLED TO /tmp/temp:

    makepl_arg         PREFIX=/tmp/temp
    mbuildpl_arg       --prefix /tmp/temp


FIXED BY RESTORING DEFAULTS:

o conf makepl_arg ''
o conf mbuildpl_arg ''
o conf commit

	commit: wrote /usr/lib/perl5/5.8.8/CPAN/Config.pm

INSTALLED JSON IN CPAN:

install JSON

	Installing /usr/lib/perl5/site_perl/5.8.8/JSON.pm
	Installing /usr/lib/perl5/site_perl/5.8.8/JSON/backportPP.pm
	Installing /usr/lib/perl5/site_perl/5.8.8/JSON/backportPP/Boolean.pm
	Installing /usr/lib/perl5/site_perl/5.8.8/JSON/backportPP/Compat5006.pm
	Installing /usr/lib/perl5/site_perl/5.8.8/JSON/backportPP/Compat5005.pm
	Installing /usr/share/man/man3/JSON::backportPP.3pm
	Installing /usr/share/man/man3/JSON.3pm
	Installing /usr/share/man/man3/JSON::backportPP::Boolean.3pm
	Installing /usr/share/man/man3/JSON::backportPP::Compat5005.3pm
	Installing /usr/share/man/man3/JSON::backportPP::Compat5006.3pm
	Appending installation info to /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod
	  /usr/bin/make install  -- OK


ll /usr/lib/perl5/site_perl/5.8.8/JSON.pm

	-r--r--r-- 1 root root 67K Dec 20 02:41 /usr/lib/perl5/site_perl/5.8.8/JSON.pm

SEE CPAN GUIDE FOR CPAN CONF ARGUMENTS:

http://search.cpan.org/~andk/CPAN-1.9402/lib/CPAN.pm


</entry>

<entry [Wed Jan 19 19:15:30 EST 2011] PROBLEM WITH user.pl USING THE WRONG @INC>


workflow.cgi CALLS user.pl AND HAS 5.8.8 IN ITS @INC

workflow.cgi    @INC:
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/site_perl/5.8.8
/usr/lib/perl5/site_perl
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/vendor_perl/5.8.8
/usr/lib/perl5/vendor_perl
/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/5.8.8
.
workflow.cgi     input: {"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"getData"}
workflow.cgi     username: jgilbert
workflow.cgi     relay script: /agua/cgi-bin/putrelay.pl
/agua/cgi-bin/user.pl jgilbert 9999999999.9999.999
workflow::as_user    user_query: username=jgilbert&sessionId=9999999999.9999.999
workflow::as_user    run_command: perl /agua/cgi-bin/user.pl "username=jgilbert&sessionId=9999999999.9999.999"


BUT user.pl HAS 5.8.9 IN ITS @INC

Can't locate File/Remove.pm in @INC (@INC contains: /agua/cgi-bin/lib /usr/local/lib/perl5/5.8.9/x86_64-linux /usr/local/lib/perl5/5.8.9 /usr/local/lib/perl5/site_perl/5.8.9/x86_64-linux /usr/local/lib/perl5/site_perl/5.8.9 .) at /agua/cgi-bin/lib/Common.pm line 47.
BEGIN failed--compilation aborted at /agua/cgi-bin/lib/Common.pm line 47.
Compilation failed in require at /agua/cgi-bin/lib/Admin.pm line 27.
BEGIN failed--compilation aborted at /agua/cgi-bin/lib/Admin.pm line 27.
BEGIN failed--compilation aborted at /agua/cgi-bin/user.pl line 48.
 at /agua/cgi-bin/user.pl line 48
workflow::as_user    result: 
workflow::as_user    no result returned from /agua/cgi-bin/user.pl script


SOLUTION: ADD 5.8.8 TO @INC IN BEGIN BLOCK IN user.pl

BEGIN {
    unshift @INC,
        qw(
		  /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
		  /usr/lib/perl5/site_perl/5.8.8
		  /usr/lib/perl5/site_perl
		  /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi
		  /usr/lib/perl5/vendor_perl/5.8.8
		  /usr/lib/perl5/vendor_perl
		  /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi
		  /usr/lib/perl5/5.8.8
        );
}



WHICH FIXES THE WRONG @INC PROBLEM BUT LEADS TO THIS PROBLEM:

	perl: symbol lookup error: /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/auto/Cwd/Cwd.so: undefined symbol: Perl_Gthr_key_ptr
	workflow::as_user    result: 
	workflow::as_user    no result returned from /agua/cgi-bin/user.pl script


TRIED TO UPDATE Cwd WITH CPAN BUT LATEST VERSION WAS ALREADY INSTALLED!

SO ADDED USE LIBS:

use lib qw(
	/usr/lib/perl5/site_perl/5.8.8
	/usr/lib/perl5/site_perl
	/usr/lib/perl5/5.8.8
);




NOTES
-----


http://modperlbook.org/html/3-9-2-1-Modifying-INC.html

The best way is to require the locally installed modules at the beginning of the script:

 use lib qw(/home/stas/lib/perl5/5.6.1/
           /home/stas/lib/perl5/site_perl/5.6.1
           /home/stas/lib/perl5/site_perl
);
Another way is to write code to modify @INC explicitly:

BEGIN {
    unshift @INC,
        qw(/home/stas/lib/perl5/5.6.1/i386-linux
           /home/stas/lib/perl5/5.6.1
           /home/stas/lib/perl5/site_perl/5.6.1/i386-linux
           /home/stas/lib/perl5/site_perl/5.6.1
           /home/stas/lib/perl5/site_perl
        );
}
Note that with the lib module, we don't have to list the corresponding architecture-specific directoriesit adds them automatically if they exist (to be exact, when $dir/$archname/auto exists). It also takes care of removing any duplicated entries.

Also, notice that both approaches prepend the directories to be searched to @INC. This allows you to install a more recent module into your local repository, which Perl will then use instead of the older one installed in the main system repository.

Both approaches modify the value of @INC at compilation time. The lib module uses the BEGIN block internally.




NB: YOU CAN ALSO EXPORT THEM AS ENVIRONMENT VARIABLES BUT THEY WON'T BE AVAILABLE TO OTHER USERS, E.G., cron JOBS
http://modperlbook.org/html/3-9-2-2-Using-the-PERL5LIB-environment-variable.html




</entry>

<entry [Mon Jan 10 14:22:18 EST 2011] INSTALL PERL Moose MODULES ON PEGASUS>



SOLUTION: TRANSFERRED PERL /usr/lib AND /usr/lib64 FROM AQ-7 TO PEGASUS

1. COPY /usr/lib64 FROM AQ-7 TO PEGASUS

/nethome/syoung/0.5/lib/external/perl5-64


2. COPY /usr/lib FROM AQ-7 TO PEGASUS

/nethome/syoung/0.5/lib/external/perl5-32
ll
    drwxr-xr-x 45 syoung bioinfo  12K Jan  2 19:40 5.8.8
    drwxr-xr-x  3 syoung bioinfo 2.0K Sep 28 08:52 site_perl
    drwxr-xr-x  4 syoung bioinfo 2.0K Oct 28 00:35 vendor_perl


3. DOWNGRADE Sub::Name TO VERSION 0.04, DOWNLOADED FROM CPAN TO HERE

/nethome/syoung/0.5/lib/external/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Sub


4. ADD USE LIBS WITHIN BEGIN IN workflow.pl

BEGIN {	
	unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
	unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-thread-multi";
	unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";	
}





NOTES
-----


PROBLEM: Can't locate Class/MOP.pm  WHEN RUNNING Moose

DIAGNOSIS: DIDN'T WORK WITH module load mihg ON PATH /k/local/perl5.x64

SOLUTION: NONE




PROBLEM: Can't load '/nethome/syoung/0.5/bin/apps/logic/../../../lib/external/auto/Sub/Name/Name.so'

perl workflow.pl

    Can't load '/nethome/syoung/0.5/bin/apps/logic/../../../lib/external/auto/Sub/Name/Name.so'
    
    for module Sub::Name:
    /nethome/syoung/0.5/bin/apps/logic/../../../lib/external/auto/Sub/Name/Name.so:
    
    undefined symbol: PL_stack_sp
    
    at /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/DynaLoader.pm line 230.
    
    at /nethome/syoung/0.5/bin/apps/logic/../../../lib/external/Class/MOP/Mixin/HasMethods.pm line 14
    
    
ll /nethome/syoung/0.5/lib/external/auto/Sub/Name/Name.so
    
ldd /nethome/syoung/0.5/lib/external/auto/Sub/Name/Name.so
    
    ldd: warning: you do not have execution permission for `/nethome/syoung/0.5/lib/external/auto/Sub/Name/Name.so'
                libc.so.6 => /lib64/libc.so.6 (0x00002b4d0a4dc000)
                /lib64/ld-linux-x86-64.so.2 (0x0000003fb6800000)


DIAGNOSIS:

BUT libc.so.6 IS IDENTICAL ON AQ-7 AND PEGASUS:

AQ-7

[root@ip-10-127-158-202 ~]# ls -al /usr/lib64/libc.so
-rw-r--r-- 1 root root 253 Sep  2  2009 /usr/lib64/libc.so

PEGASUS

[syoung@u01 ~]$ ls -al /usr/lib64/libc.so
-rw-r--r-- 1 root root 253 Sep  2  2009 /usr/lib64/libc.so


NB: libperl.so IS DIFFERENT

locate libperl.so

    /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/CORE/libperl.so

AQ-7
ls -al /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/CORE/libperl.so
    
    -rwxr-xr-x 1 root root 1259888 Sep 28 07:53 /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/CORE/libperl.so

PEGASUS

ls -al /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/CORE/libperl.so
    
    -rwxr-xr-x 1 root root 1262384 Sep  3  2009 /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/CORE/libperl.so



SOLUTION:

FIXED BY ADDING THESE LIBS:

	unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8";
	unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-64/site_perl/5.8.8/x86_64-linux-th


AFTER COPYING /usr/lib64 FROM AQ-7 TO PEGASUS HERE:

/nethome/syoung/0.5/lib/external/perl5-64


ON PEGASUS:

cd /nethome/syoung/0.5/lib/external

scp -i dummy root@ec2-75-101-214-196.compute-1.amazonaws.com:/usr/lib64/perl5.8.8-moose.tar.gz ./
perl5.8.8-moose.tar.gz                                      100%   11MB 284.8KB/s   00:38    


NB: NEWLY IMPORTED Name.so IS HERE ON PEGASUS:

cd /nethome/syoung/0.5/lib/external/perl5-64

ll site_perl/5.8.8/x86_64-linux-thread-multi/auto/Sub/Name/
    -r--r--r-- 1 syoung bioinfo    0 Jan  2 13:08 Name.bs
    -r-xr-xr-x 1 syoung bioinfo  44K Jan  2 13:08 Name.so
    -rw-r--r-- 1 syoung bioinfo  267 Jan  2 13:08 .packlist


TRY USING THIS LIB:

use lib "/nethome/syoung/0.5/lib/external/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";
use lib "/nethome/syoung/0.5/lib/external/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto";

    OK!
    

THEN GOT THIS ERROR:

Sub::Name object version 0.04 does not match bootstrap parameter 0.05 at /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/DynaLoader.pm line 253.
Compilation failed in require at /nethome/syoung/0.5/lib/external/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Class/MOP/Mixin/HasMethods.pm line 14.

SO DOWNLOADED VERSION 0.04 AND COPIED FROM HERE:

E:\base\pipeline\perlmods\Sub-Name-0.04\Sub-Name-0.04\lib

TO HERE:

/nethome/syoung/0.5/lib/external/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Sub



COPY /usr/lib FROM AQ-7 TO PEGASUS

cd /nethome/syoung/0.5/lib/external

scp -i dummy root@ec2-75-101-214-196.compute-1.amazonaws.com:/usr/lib/perl5-32bit-5.8.8.tar.gz ./

    perl5.8.8-moose.tar.gz                                      100%   11MB 284.8KB/s   00:38    


AND INSTALLED TO HERE:

/nethome/syoung/0.5/lib/external/perl5-32
ll
    drwxr-xr-x 45 syoung bioinfo  12K Jan  2 19:40 5.8.8
    drwxr-xr-x  3 syoung bioinfo 2.0K Sep 28 08:52 site_perl
    drwxr-xr-x  4 syoung bioinfo 2.0K Oct 28 00:35 vendor_perl


Couldn't load class (MooseX::Getopt::GLD) because: Couldn't load class (MooseX::Getopt::Basic) because: Getopt::Long version 2.37 required--this is only version 2.35 at /usr/lib/perl5/5.8.8/Getopt/Long.pm line 1411.
BEGIN failed--compilation aborted at /nethome/syoung/0.5/lib/external/perl5-32/site_perl/5.8.8/MooseX/Getopt/Basic.pm line 17.


FIXED BY ADDING THIS LIB TO workflow.pl:

	unshift @INC, "/nethome/syoung/0.5/lib/external/perl5-32/5.8.8";








CHECK CURRENT @INC 
------------------

perl -e 'print join "\n", @INC'

  /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
  /usr/lib/perl5/site_perl/5.8.8
  /usr/lib/perl5/site_perl
  /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi
  /usr/lib/perl5/vendor_perl/5.8.8
  /usr/lib/perl5/vendor_perl
  /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi
  /usr/lib/perl5/5.8.8


Print out the versions of modules you have installed on your system:

#!/usr/bin/perl

use ExtUtils::Installed;
my $instmod = ExtUtils::Installed->new();
foreach my $module ($instmod->modules()) {
    my $version = $instmod->version($module) || "???";
    print "$module -- $version\n";
}



Changing @INC - where Perl loads its modules
http://www.wellho.net/mouth/588_Changing-INC-where-Perl-loads-its-modules.html

Some ways to modify @INC

add to the list in @INC by using the -I command line option:

perl -I /Users/grahamellis/jan06 i2

says "run the perl program i2, additionally checking the jan06 directory for modules"

BEGIN {
    push @INC,"/Users/grahamellis/jan06";
}

use calls are run at compile time not at run time ... but then so are BEGIN blocks ... so you put your manipulation of @INC into one of those to get it to happen early enough.


add to the beginning of the list by setting the PERL5LIB environment variable:

export PERL5LIB=/Users/grahamellis/jan06






CHECK INC:

ON AQ-7
perl -e 'print join "\n", @INC'
/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/site_perl/5.8.8
/usr/lib/perl5/site_perl
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/vendor_perl/5.8.8
/usr/lib/perl5/vendor_perl
/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/5.8.8
.[root@ip-10-127-158-202 ~]#

ON PEGASUS

perl -e 'print join "\n", @INC'

/usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/site_perl/5.8.8
/usr/lib64/perl5/site_perl/5.8.5/x86_64-linux-thread-multi
/usr/lib/perl5/site_perl/5.8.5
/usr/lib/perl5/site_perl
/usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/vendor_perl/5.8.8
/usr/lib64/perl5/vendor_perl/5.8.5/x86_64-linux-thread-multi
/usr/lib/perl5/vendor_perl/5.8.5
/usr/lib/perl5/vendor_perl
/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi
/usr/lib/perl5/5.8.8


####EXPORT external TO PERL5LIB
####
####export PERL5LIB=/nethome/syoung/0.5/lib/external


</entry>



<entry [Sun Jan  9 21:47:21 EST 2011] CHECK CURRENT @INC>

perl -e 'print map { $_ . "\n" } @INC'

  /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
  /usr/lib/perl5/site_perl/5.8.8
  /usr/lib/perl5/site_perl
  /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi
  /usr/lib/perl5/vendor_perl/5.8.8
  /usr/lib/perl5/vendor_perl
  /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi
  /usr/lib/perl5/5.8.8

  #Which on my system produces:
  #
  #  /etc/perl
  #  /usr/local/lib/perl/5.10.0
  #  /usr/local/share/perl/5.10.0
  #  /usr/lib/perl5
  #  /usr/share/perl5
  #  /usr/lib/perl/5.10
  #  /usr/share/perl/5.10
  #  /usr/local/lib/site_perl



Here's a perl script that prints out the versions of modules you have installed
on your system, this might be useful for finding Class::MOP:

#!/usr/bin/perl

use ExtUtils::Installed;
my $instmod = ExtUtils::Installed->new();
foreach my $module ($instmod->modules()) {
    my $version = $instmod->version($module) || "???";
    print "$module -- $version\n";
}





</entry>

<entry [Tue Jan  4 01:21:28 EST 2011] INSTALL USING ppm ON THE COMMAND LINE>


E:\base\apps\perl\modules>ppm repo
*******************************************************************************
*id*pkgs *name                                                                *
*******************************************************************************
* 1*13876*ActiveState Package Repository                                      *
* 2*    0*E:\base\apps\perl\modules\Log-Dispatch-Config-1.03                  *
* 3*    0*E:\base\apps\perl\modules\Log-Dispatch-Config-1.03\Log-Dispatch-Con»*
* 4*    0*E:\base\apps\perl                                                   *
* 5*    1*E:\base\apps\perl\modules                                           *
*******************************************************************************
 (5 enabled repositories)


E:\base\apps\perl\modules>ppm help


NAME
    ppm - Perl Package Manager, version 4.02

SYNOPSIS
    Invoke the graphical user interface:

        ppm
        ppm gui

    Install, upgrade and remove packages:

        ppm install [--area <area>] [--force] <pkg>
        ppm install [--area <area>] [--force] <module>
        ppm install [--area <area>] <url>
        ppm install [--area <area>] <file>.ppd
        ppm install [--area <area>] <num>
        ppm upgrade [--install]
        ppm upgrade <pkg>
        ppm upgrade <module>
        ppm remove [--area <area>] [--force] <pkg>

    Manage and search install areas:

        ppm area list [--csv] [--no-header]
        ppm area sync
        ppm list [--fields <fieldnames>] [--csv]
        ppm list <area> [--fields <fieldnames>] [--csv]
        ppm files <pkg>
        ppm verify [<pkg>]

    Manage and search repositories:

        ppm repo list [--csv] [--no-header]
        ppm repo sync [--force] [<num>]
        ppm repo on <num>
        ppm repo off <num>
        ppm repo describe <num>
        ppm repo add <url> [<name>] [--username <user> [--password <passwd>]]
        ppm repo rename <num> <name>
        ppm repo location <num> <url>
        ppm repo suggest
        ppm search <pattern>
        ppm describe <num>
        ppm tree <package>
        ppm tree <num>

    Obtain version and copyright information about this program:

        ppm --version
        ppm version



ACTIVESTATE GUIDE TO ppm
http://docs.activestate.com/activeperl/5.10/bin/ppm.html

HOW TO INSTALL USING PMM FROM A LOCAL DIRECTORY
http://www.anaesthetist.com/mnm/perl/Findex.htm#ppmlocal.htm

EXAMPLE (DIDN'T WORK):

1. DOWNLOAD tar.gz FILE AND PUT IN LOCAL DIR

E:\base\apps\perl\modules\MooseX-LogDispatch-1.2002.tar.gz


2. CREATE PPD FILE LogDispatchConfig.ppd:

<?xml version="1.0" encoding="UTF-8"?>
<SOFTPKG NAME="Bit-Vector" VERSION="6,3,0,0">
<TITLE>Log-Dispatch-Config</TITLE>
<ABSTRACT>Blah</ABSTRACT>
<AUTHOR>A Sometwit</AUTHOR>
<IMPLEMENTATION>
<CODEBASE HREF="file:///e|base/apps/perl/modules/Bit-Vector-6.3.tar.gz"></CODEBASE>
<INSTALL></INSTALL>
<UNINSTALL></UNINSTALL>
</IMPLEMENTATION>
</SOFTPKG>


3. INSTALL

ppm install MooseXLogDispatch.ppd

  Unpacking MooseX-LogDispatch-1.2002...done
  Updating files in site area...done


BUT DID NOT FIND FILES IN MooseX!!!



</entry>

<entry [Sun Dec 26 23:21:24 EST 2010] Moose TYPES>

http://search.cpan.org/~drolsky/Moose-1.21/lib/Moose/Manual/Types.pod


The basic Moose type hierarchy looks like this

  Any
  Item
      Bool
      Maybe[`a]
      Undef
      Defined
          Value
              Str
                  Num
                      Int
                  ClassName
                  RoleName
          Ref
              ScalarRef[`a]
              ArrayRef[`a]
              HashRef[`a]
              CodeRef
              RegexpRef
              GlobRef
                  FileHandle
              Object


Bool accepts 1 for true, and undef, 0, or the empty string as false.
Maybe[`a] accepts either `a or undef.
Num accepts anything that perl thinks looks like a number (see "looks_like_number" in Scalar::Util).
ClassName and RoleName accept strings that are either the name of a class or the name of a role. The class/role must already be loaded when the constraint is checked.
FileHandle accepts either an IO::Handle object or a builtin perl filehandle (see "openhandle" in Scalar::Util).
Object accepts any blessed reference.
The types followed by "[`a]" can be parameterized. So instead of just plain ArrayRef we can say that we want ArrayRef[Int] instead. We can even do something like HashRef[ArrayRef[Str]].

The Maybe[`a] type deserves a special mention. Used by itself, it doesn't really mean anything (and is equivalent to Item). When it is parameterized, it means that the value is either undef or the pEarameterized type. So Maybe[Int] means an integer or undef.



</entry>

<entry [Sun Dec 26 23:20:24 EST 2010] Moose AND THE DIFFERENCE BETWEEN extends AND has>


WE WANT TO USE CONFIGURATION FILE MANIPULATION IN AT LEAST TWO MODULES (StarCluster AND Conf)

USED has INSTEAD OF extends:

use ConfigFile;
has 'configfile' 	=> (
	is =>	'rw',
	'isa' => 'ConfigFile',
	default	=>	sub { ConfigFile->new();	}
);	


DIDN'T USE THIS BECAUSE Config::INI DOESN'T HANDLE '#' COMMENTED LINES:

has 'configReader' => (
	is        => 'rw',
	isa       => 'Config::INI',
	default 	=>	sub {	Config::INI->new();	}
);


NOTE: DIDN'T USE Moose::Role BECAUSE THE VALIDATED INPUTS OF THE ROLE MUST CONFORM TO THE VALIDATED INPUTS OF THE CLASS USING THE ROLE



NOTES
-----

Linux Magazine Column 94 (Jun 2007)

[suggested title: ``The Moose is Flying (part 1)'']

Perl's object system is very ``flexible'', meaning, you get to build it from the ground up. You can build traditional hash-based objects, or more exotic array-based or inside-out objects. And then you have to create the accessors, define access policies, and perform a lot of repetitive code.

Luckily, Perl is introspective enough that you can get Perl to do most of the hard boring work. This has resulted in a number of ``class frameworks'' finding their way onto the CPAN. The Moose framework appeared about a year ago, and I initially dismissed it as ``yet another class framework'', much in the same way as I feel about yet another templating system or object-relational mapper.

However, I recently took a look at what Moose had become, and was pleasantly surprised. As I started playing with it, I exclaimed frequently that this framework would have saved me quite a bit of time on some past projects, such as the text I wrote for our Intermediate Perl course and book, parts of which have been included as the perlboot manpage in the distribution. Let's recreate the ``animal'' classes from that text, using Moose, to see how this emerging framework simplifies things.

First, we'll create a horse class in Horse.pm that has a name and a color:

  package Horse;
  use Moose;
  has 'name' => (is => 'rw');
  has 'color' => (is => 'rw');
  1;
Bringing in Moose defines has, which takes the name of an attribute along with its properties. Here, we're saying that the two attributes are ``read/write''. We can now use this class:

  use Horse;
  my $talking = Horse->new(name => "Mr. Ed");
  print $talking->name; # prints Mr. Ed
  $talking->color("grey"); # sets the color
Note that I didn't have to define a new method: Moose does that for me.

Now in the original text, Horse inherited from Animal. We can do that rather simply. In Animal.pm, we place:

  package Animal;
  use Moose;
  has 'name' => (is => 'rw');
  has 'color' => (is => 'rw');
  1;
And then update our Horse.pm:

  package Horse;
  use Moose;
  extends 'Animal';
  1;
Note that extends here replaces the traditional use base and completely sets @ISA, rather than adding to it. (It's possible that you might want to put this inside a BEGIN block, although I've not seen any examples requiring it yet.)

At this point, Horse and Animal are identical. They can both be instantiated, and have the two given attributes. In the original example, what distinguished a horse was the sound it made, which we can add here:

  package Horse;
  use Moose;
  extends 'Animal';
  sub sound { 'neigh' }
  1;
and then reference that in the common speak method in Animal:

  package Animal;
  use Moose;
  has 'name' => (is => 'rw');
  has 'color' => (is => 'rw');
  sub speak {
    my $self = shift;
    print $self->name, " goes ", $self->sound, "\n";
  }
  sub sound { confess shift, " should have defined sound!" }
  1;
Note the use of confess, another freebie from Moose. If the derived class hasn't defined a sound, I want to complain. But since Horse defines sound, I'll never see that for a horse. With this code, I can create my classic talking horse:

  my $talking = Horse->new(name => 'Mr. Ed');
  $talking->speak; # says "Mr. Ed goes neigh"
So far, I'm still coding things that would be simple without Moose, so let's start diverging a bit to see the full power. First, an Animal is really an abstract class, being used only to provide common attributes and methods to a concrete class (in this case, the horse class). In Moose-terminology, this can best be described as a role. A role is like a mix-in, providing a collection of attributes and methods that use those attributes. A role never has any instances, because it's not a complete class.

When we make Animal a role, we'll also get some additional support:

  package Animal;
  use Moose::Role;
  has 'name' => (is => 'rw');
  has 'color' => (is => 'rw');
  sub speak {
    my $self = shift;
    print $self->name, " goes ", $self->sound, "\n";
  }
  requires 'sound';
  1;
Note that we've replaced the confess-including stub with requires. This informs Moose that this role must now be used with a class that provides the sound method, which will be checked at compile-time. To pull in a role, we use with rather than extends:

  package Horse;
  use Moose;
  with 'Animal';
  sub sound { 'neigh' }
  1;
Had we failed to include sound, we'd get notification very early on. Cool. At this point, Horse otherwise still works as before.

What about those with and requires keywords? Because they're defined by the Moose and Moose::Role imports, they remain as part of the package. For the purists in us who don't like that kind of pollution, we can throw them away when we're done, using the correponding no keyword (similiar to use strict and no strict). For example, we'd clean up Horse.pm with:

  package Horse;
  use Moose;
  with 'Animal';
  sub sound { 'neigh' }
  no Moose; # gets rid of scaffolding
  1;
And similarly, Animal.pm requires no Moose::Role at the end.

Moose supports the notion of a default value. Let's add in the default color, and make that a class responsibility as well:

  package Animal;
  ...
  has 'color' => (is => 'rw', default => sub { shift->default_color });
  requires 'default_color';
  ...
If the color isn't provided, the default color of the class will be consulted, and requires ensures that the concrete class provides this default color. Our derived animal classes now look like:

  ## Cow.pm:
  package Cow;
  use Moose;
  with 'Animal';
  sub default_color { 'spotted' }
  sub sound { 'moooooo' }
  no Moose;
  1;
  ## Horse.pm:
  package Horse;
  use Moose;
  with 'Animal';
  sub default_color { 'brown' }
  sub sound { 'neigh' }
  no Moose;
  1;
  ## Sheep.pm:
  package Sheep;
  use Moose;
  with 'Animal';
  sub default_color { 'black' }
  sub sound { 'baaaah' }
  no Moose;
  1;
Now we can count sheep as one of our implemented classes:

  use Sheep;
  my $baab = Sheep->new(color => 'white', name => 'Baab');
  $baab->speak; # prints "Baab goes baaaah"
Well, this is pretty straightforward. Let's solve a few other problems from the original material.

The Mouse class was special, because it extended the speak method with an additional line of output. While we could use traditional SUPER::-based method calls to call parent-class behaviors, this doesn't work with roles. (Roles don't end up in @ISA, because they're ``glued in'' rather than ``tacked above''.)

Luckily, Moose provides the convenient after call to append additional steps to an existing subroutine. Moose does this by replacing the original subroutine with a new subroutine that calls the original routine and then calls the additional code. The context (list, scalar, or void) is properly preserved, as is the original return value. Our amended speak looks something like:

  package Mouse;
  use Moose;
  with 'Animal';
  sub default_color { 'white' }
  sub sound { 'squeak' }
  after 'speak' => sub {
    print "[but you can barely hear it!]\n";
  };
  no Moose;
  1;
This gives us a properly functioning mouse:

  my $mickey = Mouse->new(name => 'Mickey');
  $mickey->speak;
which results in:

  Mickey goes squeak
  [but you can barely hear it!]
We can also use before and around to precede the original behavior or control the calling of the original behavior, as necessary. For example, to allow name to be used as both an accessor and still return an unnamed Horse when used as a class method, we can ``around'' the resulting name accessor:

  package Animal;
  ...
  has 'name' => (is => 'rw');
  around 'name' => sub {
    my $next = shift;
    my $self = shift;
    blessed $self ? $self->$next(@_) : "an unnamed $self";
  };
The has creates the original behavior. The around intercepts the original subroutine name, causing the original coderef to be passed as the first parameter to this new subroutine, which we capture in $next. The original $self is shifted away, and tested to see if it's an object or not, via blessed (conveniently exported via Moose). For a blessed object, we get the original behavior (a getter or setter), but for a class, we'll get the literal string.

What if we never gave our animal a name? We'll get warnings about undefined values. We can give a default name just as we did a default color:

  has 'name' => (
    is => 'rw',
    default => sub { 'an unnamed ' . ref shift },
   );
Again, we'd want that around immediately following this step.

If we don't want people setting the color after the initial instance creation, we can declare the attribute as read-only:

  has 'color' => (is => 'ro', default => sub { shift->default_color });
Now an attempt to set the color is aborted with Cannot assign a value to a read-only accessor.... If we really wanted to have a way to occasionally set the color, we can define a separately named writer:

  has 'color' => (
    is => 'ro',
    writer => 'private_set_color',
    default => sub { shift->default_color },
  );
Thus, we can't change the color of a mouse directly:

  my $m = Mouse->new;
  my $color = $m->color; # gets the color
  $m->color('green'); # DIES
But we can use our private name instead:

  $m->private_set_color('green'); # sets the color to green
By using a long name, we're less likely to accidentally call it, except where we intentionally want to change the color.

Let's create a RaceHorse by adding ``race features'' to a Horse.

First, we define the ``race features'' as, yes, another role:

  package Racer;
  use Moose::Role;
  has $_ => (is => 'rw', default => 0)
    foreach qw(wins places shows losses);
  no Moose::Role;
  1;
Note that since has is just a subroutine call, we can use traditional Perl control structures (here, a foreach loop). With a bit of code, we've added another four attributes. The initial value of 0 means we don't have to write separate initialization code in our constructor. Next, we can add some accessors:

  package Racer;
  ...
  sub won { my $self = shift; $self->wins($self->wins + 1) }
  sub placed { my $self = shift; $self->places($self->places + 1) }
  sub showed { my $self = shift; $self->shows($self->shows + 1) }
  sub lost { my $self = shift; $self->losses($self->losses + 1) }
  sub standings {
    my $self = shift;
    join ", ", map { $self->$_ . " $_" } qw(wins places shows losses);
  }
  ...
Each call to won increments the number of wins. This would be simpler if we presumed that these objects are implemented as hashes (which they are by default), as:

  sub won { shift->{wins}++; }
However, by using the public interface (a method call), we could change the implementation later to inside-out objects or array-based objects without breaking this code. This is especially important when creating a generic role, which could be mixed in to any kind of object.

To create the race horse, we just mix a horse with a racer:

  package RaceHorse;
  use Moose;
  extends 'Horse';
  with 'Racer';
  no Moose;
  1;
And now we can ride the ponies:

  use RaceHorse;
  my $s = RaceHorse->new(name => 'Seattle Slew');
  $s->won; $s->won; $s->won; $s->placed; $s->lost; # run some races
  print $s->standings, "\n"; # 3 wins, 1 places, 0 shows, 1 losses
So far, I've just scratched the surface of what Moose provides. Next month, I'll look at some of the more advanced features of Moose that help keep the complex things relatively simple. Until then, enjoy!


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Tue Nov  9 16:20:24 EST 2010

CHECK IF FILE IS Text OR Binary

USE FILE OPERATORS:

Text File: -T

Binary File: -B


</entry>

<entry [Tue Nov  9 16:19:24 EST 2010] UNPACKING C STRUCTURES FROM BINARY FILES>


http://perldoc.perl.org/perlpacktut.html#Packing-and-Unpacking-C-Structures

If you have to deal with a lot of C structures, and don't want to hack all your template strings manually, you'll probably want to have a look at the CPAN module

Convert::Binary::C
Not only can it parse your C source directly, but it also has built-in support for all the odds and ends described further on in this section.



http://search.cpan.org/~mhx/Convert-Binary-C-0.74/lib/Convert/Binary/C.pm

use Convert::Binary::C;
  use Data::Dumper;
  
  #---------------------
  # Create a new object
  #---------------------
  my $c = new Convert::Binary::C ByteOrder => 'BigEndian';
  
  #---------------------------------------------------
  # Add include paths and global preprocessor defines
  #---------------------------------------------------
  $c->Include('/usr/lib/gcc/i686-pc-linux-gnu/4.1.2/include',
              '/usr/include')
    ->Define(qw( __USE_POSIX __USE_ISOC99=1 ));
  
  #----------------------------------
  # Parse the 'time.h' header file
  #----------------------------------
  $c->parse_file('time.h');
  
  #---------------------------------------
  # See which files the object depends on
  #---------------------------------------
  print Dumper([$c->dependencies]);
  
  #-----------------------------------------------------------
  # See if struct timespec is defined and dump its definition
  #-----------------------------------------------------------
  if ($c->def('struct timespec')) {
    print Dumper($c->struct('timespec'));
  }
  
  #-------------------------------
  # Create some binary dummy data
  #-------------------------------
  my $data = "binary_test_string";
  
  #--------------------------------------------------------
  # Unpack $data according to 'struct timespec' definition
  #--------------------------------------------------------
  if (length($data) >= $c->sizeof('timespec')) {
    my $perl = $c->unpack('timespec', $data);
    print Dumper($perl);
  }
  
  #--------------------------------------------------------
  # See which member lies at offset 5 of 'struct timespec'
  #--------------------------------------------------------
  my $member = $c->member('timespec', 5);
  print "member('timespec', 5) = '$member'\n";
  
  
</entry>

<entry [Tue Nov  9 14:23:00 EST 2010] PERL MEMORY USAGE>


USE SYSTEM CALL TO ps -o rss,vsz $$
-----------------------------------


AND DO TIMING WITH THIS:


    #### TIME BEFORE    
	use Devel::Peek;
	use Time::HiRes qw[gettimeofday tv_interval];
	my $time1=[gettimeofday()];	


    #### MEMORY USAGE BEFORE    
	warn "memory usage BEFORE counter:\n";
    warn qx{ ps -o rss,vsz $$ }, "\n";


	my $counter = scalar( keys %$hash );


    #### MEMORY USAGE AFTER
	warn "memory usage AFTER  counter:\n";
    warn qx{ ps -o rss,vsz $$ }, "\n";
	
    #### TIME AFTER
	my $milliseconds = tv_interval($time1)*1000;
	printf "Elapsed time: %d milliseconds\n", $milliseconds;




USE DEVEL SIZE (if it's installed)

http://search.cpan.org/~dsugal/Devel-Size-0.64/Size.pm


	use Devel::Size;
	my $size = total_size($output);
	print "IndexRead::numberReads    size: $size\n" if $DEBUG;




NOTES
-----


NB: BOTH OF THESE METHODS DON'T WORK ON PEGASUS

Debugging Perl memory usage
http://perl.active-venture.com/pod/perldebguts-perlmemory.html

Example of using -DL switch

Below we show how to analyse memory usage by

 
  do 'lib/auto/POSIX/autosplit.ix';  
The file in question contains a header and 146 lines similar to

 
  sub getcwd;  
WARNING: The discussion below supposes 32-bit architecture. In newer releases of Perl, memory usage of the constructs discussed here is greatly improved, but the story discussed below is a real-life story. This story is mercilessly terse, and assumes rather more than cursory knowledge of Perl internals. Type space to continue, `q' to quit. (Actually, you just want to skip to the next section.)

Here is the itemized list of Perl allocations performed during parsing of this file:

 
 !!! "after" at test.pl line 3.
    Id  subtot   4   8  12  16  20  24  28  32  36  40  48  56  64  72  80 80+
  0 02   13752   .   .   .   . 294   .   .   .   .   .   .   .   .   .   .   4
  0 54    5545   .   .   8 124  16   .   .   .   1   1   .   .   .   .   .   3
  5 05      32   .   .   .   .   .   .   .   1   .   .   .   .   .   .   .   .
  6 02    7152   .   .   .   .   .   .   .   .   .   . 149   .   .   .   .   .
  7 02    3600   .   .   .   .   . 150   .   .   .   .   .   .   .   .   .   .
  7 03      64   .  -1   .   1   .   .   2   .   .   .   .   .   .   .   .   .
  7 04    7056   .   .   .   .   .   .   .   .   .   .   .   .   .   .   .   7
  7 17   38404   .   .   .   .   .   .   .   1   .   . 442 149   .   . 147   .
  9 03    2078  17 249  32   .   .   .   .   2   .   .   .   .   .   .   .   .
  
To see this list, insert two warn('!...') statements around the call:

 
  warn('!');
  do 'lib/auto/POSIX/autosplit.ix';
  warn('!!! "after"');  
and run it with Perl's -DL option. The first warn() will print memory allocation info before parsing the file and will memorize the statistics at this point (we ignore what it prints). The second warn() prints increments with respect to these memorized data. This is the printout shown above.

Different Ids on the left correspond to different subsystems of the perl interpreter. They are just the first argument given to the perl memory allocation API named New(). To find what 9 03 means, just grep the perl source for 903. You'll find it in util.c, function savepvn(). (I know, you wonder why we told you to grep and then gave away the answer. That's because grepping the source is good for the soul.) This function is used to store a copy of an existing chunk of memory. Using a C debugger, one can see that the function was called either directly from gv_init() or via sv_magic(), and that gv_init() is called from gv_fetchpv()--which was itself called from newSUB(). Please stop to catch your breath now.

NOTE: To reach this point in the debugger and skip the calls to savepvn() during the compilation of the main program, you should set a C breakpoint in Perl_warn(), continue until this point is reached, and then set a C breakpoint in Perl_savepvn(). Note that you may need to skip a handful of Perl_savepvn() calls that do not correspond to mass production of CVs (there are more 903 allocations than 146 similar lines of lib/auto/POSIX/autosplit.ix). Note also that Perl_ prefixes are added by macroization code in perl header files to avoid conflicts with external libraries.

Anyway, we see that 903 ids correspond to creation of globs, twice per glob - for glob name, and glob stringification magic.

Here are explanations for other Ids above:

717
Creates bigger XPV* structures. In the case above, it creates 3 AVs per subroutine, one for a list of lexical variable names, one for a scratchpad (which contains lexical variables and targets), and one for the array of scratchpads needed for recursion.

It also creates a GV and a CV per subroutine, all called from start_subparse().

002
Creates a C array corresponding to the AV of scratchpads and the scratchpad itself. The first fake entry of this scratchpad is created though the subroutine itself is not defined yet.

It also creates C arrays to keep data for the stash. This is one HV, but it grows; thus, there are 4 big allocations: the big chunks are not freed, but are kept as additional arenas for SV allocations.

054
Creates a HEK for the name of the glob for the subroutine. This name is a key in a stash.

Big allocations with this Id correspond to allocations of new arenas to keep HE.

602
Creates a GP for the glob for the subroutine.
702
Creates the MAGIC for the glob for the subroutine.
704
Creates arenas which keep SVs.
-DL details

If Perl is run with -DL option, then warn()s that start with `!' behave specially. They print a list of categories of memory allocations, and statistics of allocations of different sizes for these categories.

If warn() string starts with

!!!
print changed categories only, print the differences in counts of allocations.
!!
print grown categories only; print the absolute values of counts, and totals.
!
print nonempty categories, print the absolute values of counts and totals.
Limitations of -DL statistics

If an extension or external library does not use the Perl API to allocate memory, such allocations are not counted.

 
</entry>

<entry [Wed Nov  3 11:51:35 EDT 2010] PROGRESS METER>


Prints a spinning bar beside the given message.

sub Progress {
	my $self	=	shift;
    my($p) = substr("|/-\\",$self->{_progress}++ % 4,1);
    my($pad) = " "x80;
    print substr(" $p @_$pad",0,78) . "\r";
}

sub ProgressError {
	my $self	=	shift;
    $self->Progress("*** ",@_," ***");
    print "   \n";
}

sub ProgressStep {
	my $self	=	shift;
    $self->Progress(@_);
    print "   \n";
}


</entry>


<entry [Tue Apr 20 21:52:12 EDT 2010] USE grep TO REMOVE DUPLICATE ELEMENTS>


my %seen = ();
       my @unique = grep { ! $seen{ $_ }++ } @array;
       
How can I remove duplicate elements from a list or array?
    (contributed by brian d foy)

    Use a hash. When you think the words "unique" or "duplicated", think
    "hash keys".

    If you don't care about the order of the elements, you could just create
    the hash then extract the keys. It's not important how you create that
    hash: just that you use "keys" to get the unique elements.

       my %hash   = map { $_, 1 } @array;
       # or a hash slice: @hash{ @array } = ();
       # or a foreach: $hash{$_} = 1 foreach ( @array );

       my @unique = keys %hash;

    You can also go through each element and skip the ones you've seen
    before. Use a hash to keep track. The first time the loop sees an
    element, that element has no key in %Seen. The "next" statement creates
    the key and immediately uses its value, which is "undef", so the loop
    continues to the "push" and increments the value for that key. The next
    time the loop sees that same element, its key exists in the hash *and*
    the value for that key is true (since it's not 0 or undef), so the next
    skips that iteration and the loop goes to the next element.

            my @unique = ();
            my %seen   = ();

            foreach my $elem ( @array )
                    {
                    next if $seen{ $elem }++;
                    push @unique, $elem;
                    }

    You can write this more briefly using a grep, which does the same thing.

       my %seen = ();
       my @unique = grep { ! $seen{ $_ }++ } @array;



       
</entry>

<entry [Mon Mar 29 20:19:39 EDT 2010] USING perl Build.PL>

http://www.perl.com/pub/a/2006/07/13/lightning-articles.html

Still More Perl Lightning Articlesby Phil Crow, Josh McAdams, Steven Schubiger, chromatic 
July 13, 2006
It has been common practice within the Perl community for ages to ship distributions with a Makefile.PL so that the user will be able to install the packages when he retrieves them, either via the shell which the CPAN/CPANPLUS modules offer or via manual CPAN download.

The Makefile.PL consists of meta-information, which in the case of the distribution HTML::Tagset is:

 # This -*-perl-*- program writes the Makefile for installing this distribution.
 #
 # See "perldoc perlmodinstall" or "perldoc ExtUtils::MakeMaker" for
 # info on how to control how the installation goes.

 require 5.004;
 use strict;
 use ExtUtils::MakeMaker;

 WriteMakefile(
     NAME            => 'HTML::Tagset',
     AUTHOR          => 'Andy Lester <andy@petdance.com>',
     VERSION_FROM    => 'Tagset.pm', # finds $VERSION
     ABSTRACT_FROM   => 'Tagset.pm', # retrieve abstract from module
     PMLIBDIRS       => [qw(lib/)],
     dist            => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
     clean           => { FILES => 'HTML-Tagset-*' },
 );
Of interest are the arguments to WriteMakefile(), because they influence the Makefile written by ExtUtils::MakeMaker after the user has invoked the usual build and install procedure:

 % perl Makefile.PL
 % make
 % make test
 # make install
Module::Build, Successor of ExtUtils::MakeMaker?

As Ken Williams grew tired of ExtUtils::MakeMaker and its portability issues, he invented Module::Build, a successor of ExtUtils::MakeMaker. One goal of Module::Build is to run smoothly on most operating systems, because it takes advantage of creating Perl-valid syntax files only and does not rely upon crufty Makefiles, which are often subject to misinterpretation, because so many incompatible flavors of make exist in the wild.

The current maintainer of ExtUtils::MakeMaker, Michael G. Schwern, elaborated about this problem in his talk reachable via "MakeMaker is DOOMED."

Module::Build Distribution "Skeleton"

If you take in consideration the distribution HTML::Tagset again, the rough skeleton suitable for Module::Build having converted the Makefile.PL by Module::Build::Convert into a Build.PL, the output would be:

 # This -*-perl-*- program writes the Makefile for installing this distribution.
 #
 # See "perldoc perlmodinstall" or "perldoc ExtUtils::MakeMaker" for
 # info on how to control how the installation goes.
 # Note: this file has been initially generated by Module::Build::Convert 0.24_01

 require 5.004;
 use strict;
 use warnings;

 use Module::Build;

 my $build = Module::Build->new
   (
    module_name => 'HTML::Tagset',
    dist_author => 'Andy Lester <andy@petdance.com>',
    dist_version_from => 'Tagset.pm',
    add_to_cleanup => [
                        'HTML-Tagset-*'
                      ],
    license => 'unknown',
    create_readme => 1,
    create_makefile_pl => 'traditional',
   );
  
 $build->create_build_script;
As you can see, while ExtUtils::MakeMaker prefers uppercased arguments, Module::Build goes by entirely lowercased arguments, which obey the rule of least surprise by being as intuitive as a description can be.

The build and installation procedure for a Module::Build distribution is:

 % perl Build.PL
 % perl Build
 % perl Build test
 # perl Build install
Module::Build::Convert's State of Operation

Module::Build::Convert actually does all of the background work and can be safely considered the back end, whereas make2build is the practical front-end utility. Module::Build::Convert currently exposes two kinds of operation: static approach and dynamic execution. The static approach parses the arguments contained within the Makefile.PL's WriteMakefile() call, whereas dynamic execution runs the Makefile.PL and captures the arguments provided to WriteMakefile().

Module::Build::Convert parses statically by default, because the dynamic execution has the downside that code will be interpreted and the interpreted output will be written to the Build.PL, so you have to conclude that the user of the distribution will end up with predefined values computed on the author's system. This is something to avoid, whenever possible! If the parsing approach fails, perhaps looping endlessly on input, Module::Build::Convert will reinitialize to perform dynamic execution of the Makefile.PL instead.


</entry>

<entry [Mon Mar 29 20:19:39 EDT 2010] INSTALL MOD PERL AND APACHE LOCALLY>


http://www.perl.com/pub/a/2002/04/10/mod_perl.html?page=2

Installing mod_perl without superuser privileges
by Stas Bekman | Pages: 1, 2, 3


PAGE 1
======

April 10, 2002

As you have seen from my previous articles, mod_perl enabled Apache consists of two main components: Perl modules and Apache itself. While installing Apache without root privileges is easy, one should know how to install Perl modules in a nonsystem-wide location. In this article, I'll demonstrate ways to complete this task.

In the examples, I'll use stas as a username, and /home/stas as the home directory for that user.
Installing Perl Modules Into a Directory of Choice

Since without superuser permissions you aren't allowed to install modules into system directories such as /usr/lib/perl5, you need to find out how to install the modules under your home directory. It's easy.

First, you have to decide where to install the modules. The simplest approach is to simulate the portion of the / file system relevant to Perl under your home directory. Actually we need only two directories:


  /home/stas/bin
  /home/stas/lib

We don't have to create them, since that will be done automatically when the first module is installed. Ninety-nine percent of the files will go into the lib directory. Occasionally, when some module distribution comes with Perl scripts, these will go into the bin directory. This directory will be created if it doesn't exist.

Let's install the CGI.pm package, which includes a few other CGI::* modules. As usual, download the package from the CPAN repository, unpack it and chdir to the newly created directory.

Now do a standard perl Makefile.PL to prepare a Makefile, but this time tell MakeMaker to use your Perl installation directories instead of the defaults.


  % perl Makefile.PL PREFIX=/home/stas

PREFIX=/home/stas is the only part of the installation process that is different from usual. Note that if you don't like how MakeMaker chooses the rest of the directories, or if you are using an older version that requires an explicit declaration of all the target directories, then do this:


  % perl Makefile.PL PREFIX=/home/stas \
    INSTALLPRIVLIB=/home/stas/lib/perl5 \
    INSTALLSCRIPT=/home/stas/bin \
    INSTALLSITELIB=/home/stas/lib/perl5/site_perl \
    INSTALLBIN=/home/stas/bin \
    INSTALLMAN1DIR=/home/stas/lib/perl5/man  \
    INSTALLMAN3DIR=/home/stas/lib/perl5/man3

The rest is as usual:


  % make
  % make test
  % make install

make install installs all the files in the private repository. Note that all the missing directories are created automatically, so there is no need to create them. Here (slightly edited) is what it does :


  Installing /home/stas/lib/perl5/CGI/Cookie.pm
  Installing /home/stas/lib/perl5/CGI.pm
  Installing /home/stas/lib/perl5/man3/CGI.3
  Installing /home/stas/lib/perl5/man3/CGI::Cookie.3
  Writing /home/stas/lib/perl5/auto/CGI/.packlist
  Appending installation info to /home/stas/lib/perl5/perllocal.pod

If you have to use the explicit target parameters, then instead of a single PREFIX parameter, you will find it useful to create a file called, for example, ~/.perl_dirs (where ~ is /home/stas in our example) containing:


    PREFIX=/home/stas \
    INSTALLPRIVLIB=/home/stas/lib/perl5 \
    INSTALLSCRIPT=/home/stas/bin \
    INSTALLSITELIB=/home/stas/lib/perl5/site_perl \
    INSTALLBIN=/home/stas/bin \
    INSTALLMAN1DIR=/home/stas/lib/perl5/man  \
    INSTALLMAN3DIR=/home/stas/lib/perl5/man3

From now on, any time you want to install Perl modules locally, you simply execute:


  % perl Makefile.PL `cat ~/.perl_dirs`
  % make
  % make test
  % make install

Using this method, you can easily maintain several Perl module repositories. For example, you could have one for production Perl and another for development:


  % perl Makefile.PL `cat ~/.perl_dirs.production`

or


  % perl Makefile.PL `cat ~/.perl_dirs.develop`

Making Your Scripts Find the Locally Installed Modules

Perl modules are generally placed in four main directories. To find these directories, execute:


  % perl -V

The output contains important information about your Perl installation. At the end you will see:


  Characteristics of this binary (from libperl):
  Built under linux
  Compiled at Apr  6 1999 23:34:07
  @INC:
    /usr/lib/perl5/5.00503/i386-linux
    /usr/lib/perl5/5.00503
    /usr/lib/perl5/site_perl/5.005/i386-linux
    /usr/lib/perl5/site_perl/5.005
    .

It shows us the content of the Perl special variable @INC, which is used by Perl to look for its modules. It is equivalent to the PATH environment variable in Unix shells that is used to find executable programs.
Practical mod_perl 	

Related Reading

Practical mod_perl
By Stas Bekman, Eric Cholet

Notice that Perl looks for modules in the . directory too, which stands for the current directory. It's the last entry in the above output.

Of course, this example is from version 5.00503 of Perl installed on my x86 architecture PC running Linux. That's why you see i386-linux and 5.00503. If your system runs a different version of Perl, operating system, processor or chipset architecture, then some of the directories will have different names.

I also have a perl-5.6.1 installed under /usr/local/lib/ so when I do:


  % /usr/local/bin/perl5.6.1 -V

I see:


  @INC:
    /usr/local/lib/perl5/5.6.1/i586-linux
    /usr/local/lib/perl5/5.6.1
    /usr/local/lib/site_perl/5.6.1/i586-linux
    /usr/local/lib/site_perl

Previously in the Series

mod_perl in 30 minutes

Why mod_perl?

Note that it's still Linux, but the newer Perl version uses the version of my Pentium processor (thus the i586 and not i386). This makes use of compiler optimizations for Pentium processors when the binary Perl extensions are created.

All the platform specific files, such as compiled C files glued to Perl with XS or SWIG, are supposed to go into the i386-linux-like directories.

Important: As we have installed the Perl modules into nonstandard directories, we have to let Perl know where to look for the four directories. There are two ways to accomplish this: You can set the PERL5LIB environment variable or you can modify the @INC variable in your scripts.

Assuming that we use perl-5.00503, in our example the directories are:


    /home/sbekman/lib/perl5/5.00503/i386-linux
    /home/sbekman/lib/perl5/5.00503
    /home/sbekman/lib/perl5/site_perl/5.005/i386-linux
    /home/sbekman/lib/perl5/site_perl/5.005

As mentioned before, you find the exact directories by executing perl -V and replacing the global Perl installation's base directory with your home directory.

Modifying @INC is quite easy. The best approach is to use the lib module (pragma), by adding the following snippet at the top of any of your scripts that require the locally installed modules.


  use lib qw(/home/stas/lib/perl5/5.00503/
             /home/stas/lib/perl5/site_perl/5.005);

Another way is to write code to modify @INC explicitly:


  BEGIN {
    unshift @INC,
      qw(/home/stas/lib/perl5/5.00503
         /home/stas/lib/perl5/5.00503/i386-linux
         /home/stas/lib/perl5/site_perl/5.005
         /home/stas/lib/perl5/site_perl/5.005/i386-linux);
        }

Note that with the lib module we don't have to list the corresponding architecture specific directories, since it adds them automatically if they exist (to be exact, when $dir/$archname/auto exists).

Also, notice that both approaches prepend the directories to be searched to @INC. This allows you to install a more recent module into your local repository and Perl will use it instead of the older one installed in the main system repository.

Both approaches modify the value of @INC at compilation time. The lib module uses the BEGIN block as well, but internally.


PAGE 2
======

Now, let's assume the following scenario. I have installed the LWP package in my local repository. Now I want to install another module (e.g. mod_perl) that has LWP listed in its prerequisites list. I know that I have LWP installed, but when I run perl Makefile.PL for the module I'm about to install I'm told that I don't have LWP installed.

There is no way for Perl to know that we have some locally installed modules. All it does is search the directories listed in @INC, and since the latter contains only the default four directories (plus the . directory), it cannot find the locally installed LWP package. We cannot solve this problem by adding code to modify @INC, but changing the PERL5LIB environment variable will do the trick. If you are using t?csh for interactive work, then do this:


  setenv PERL5LIB /home/stas/lib/perl5/5.00503:
  /home/stas/lib/perl5/site_perl/5.005

It should be a single line with directories separated by colons (:) and no spaces. If you are a (ba)?sh user, then do this:


  export PERL5LIB=/home/stas/lib/perl5/5.00503:
  /home/stas/lib/perl5/site_perl/5.005

Again, make it a single line. If you use bash, then you can use multi-line commands by terminating split lines with a backslash (\), like this:


  export PERL5LIB=/home/stas/lib/perl5/5.00503:\
  /home/stas/lib/perl5/site_perl/5.005

As with use lib, Perl automatically prepends the architecture specific directories to @INC if those exist.

When you have done this, verify the value of the newly configured @INC by executing perl -V as before. You should see the modified value of @INC:


  % perl -V

  Characteristics of this binary (from libperl): 
  Built under linux
  Compiled at Apr  6 1999 23:34:07
  %ENV:
    PERL5LIB="/home/stas/lib/perl5/5.00503:
    /home/stas/lib/perl5/site_perl/5.005"
  @INC:
    /home/stas/lib/perl5/5.00503/i386-linux
    /home/stas/lib/perl5/5.00503
    /home/stas/lib/perl5/site_perl/5.005/i386-linux
    /home/stas/lib/perl5/site_perl/5.005
    /usr/lib/perl5/5.00503/i386-linux
    /usr/lib/perl5/5.00503
    /usr/lib/perl5/site_perl/5.005/i386-linux
    /usr/lib/perl5/site_perl/5.005
    .

When everything works as you want it to, add these commands to your .tcshrc or .bashrc file. The next time you start a shell, the environment will be ready for you to work with the new Perl.

Note that if you have a PERL5LIB setting, then you don't need to alter the @INC value in your scripts. But if, for example, someone else (who doesn't have this setting in the shell) tries to execute your scripts, then Perl will fail to find your locally installed modules. The best example is a crontab script that might use a different SHELL environment and, therefore, the PERL5LIB setting won't be available to it.

So the best approach is to have both the PERL5LIB environment variable and the explicit @INC extension code at the beginning of the scripts as described above.
The CPAN.pm Shell and Locally Installed Modules

The CPAN.pm shell saves a great deal of time when dealing with the installation of Perl modules and keeping them up to date. It does the job for us, even detecting the missing modules listed in prerequisites, fetching and installing them. So you may wonder whether you can use CPAN.pm to maintain your local repository as well.

When you start the CPAN interactive shell, it searches first for the user's private configuration file and then for the system-wide one. When I'm logged as user stas, the two files on my setup are:


    /home/stas/.cpan/CPAN/MyConfig.pm
    /usr/lib/perl5/5.00503/CPAN/Config.pm

If there is no CPAN shell configured on your system, then when you start the shell for the first time it will ask you a dozen configuration questions and then create the Config.pm file for you.

If you already have it system-wide configured, then you should have a /usr/lib/perl5/5.00503/CPAN/Config.pm. If you have a different Perl version, then alter the path to use your Perl's version number when looking up the file. Create the directory (mkdir -p creates the whole path at once) where the local configuration file will go:


  % mkdir -p /home/stas/.cpan/CPAN

Now copy the system wide configuration file to your local one.


  % cp /usr/lib/perl5/5.00503/CPAN/Config.pm \
  /home/stas/.cpan/CPAN/MyConfig.pm

The only thing left is to change the base directory of .cpan in your local file to the one under your home directory. On my machine, I replace /usr/src/.cpan (that's where my system's .cpan directory resides) with /home/stas. I use Perl, of course!


  % perl -pi -e 's|/usr/src|/home/stas|' \
  /home/stas/.cpan/CPAN/MyConfig.pm

Now you have the local configuration file ready, you have to tell it what special parameters you need to pass when executing the perl Makefile.PL stage.

Open the file in your favorite editor and replace line:


  'makepl_arg' => q[],

with:


  'makepl_arg' => q[PREFIX=/home/stas],

Now you've finished the configuration. Assuming that you are logged in as the same user you have prepared the local installation for (stas in our example), start it like this:


  % perl -MCPAN -e shell

From now on, any module you try to install will be installed locally. If you need to install some system modules, then just become the superuser and install them in the same way. When you are logged in as the superuser, the system-wide configuration file will be used instead of your local one.

If you have used more than just the PREFIX variable, then modify MyConfig.pm to use them. For example, if you have used these variables:


    perl Makefile.PL PREFIX=/home/stas \
    INSTALLPRIVLIB=/home/stas/lib/perl5 \
    INSTALLSCRIPT=/home/stas/bin \
    INSTALLSITELIB=/home/stas/lib/perl5/site_perl \
    INSTALLBIN=/home/stas/bin \
    INSTALLMAN1DIR=/home/stas/lib/perl5/man  \
    INSTALLMAN3DIR=/home/stas/lib/perl5/man3

then replace PREFIX=/home/stas in the line:


  'makepl_arg' => q[PREFIX=/home/stas],

with all the variables from above, so that the line becomes:


  'makepl_arg' => q[PREFIX=/home/stas \
    INSTALLPRIVLIB=/home/stas/lib/perl5 \
    INSTALLSCRIPT=/home/stas/bin \
    INSTALLSITELIB=/home/stas/lib/perl5/site_perl \
    INSTALLBIN=/home/stas/bin \
    INSTALLMAN1DIR=/home/stas/lib/perl5/man  \
    INSTALLMAN3DIR=/home/stas/lib/perl5/man3],

If you arrange all the above parameters in one line, then you can remove the backslashes (\).


PAGE 3
======


Installing mod_perl without superuser privileges
by Stas Bekman | Pages: 1, 2, 3
Making a Local Apache Installation

Just like with Perl modules, if you don't have permissions to install files into the system area, then you have to install them locally under your home directory. It's almost the same as a plain installation, but you have to run the server listening to a port number greater than 1024, since only root processes can listen to lower-numbered ports.

Another important issue you have to resolve is how to add startup and shutdown scripts to the directories used by the rest of the system services. You will have to ask your system administrator to assist you with this issue.

To install Apache locally, all you have to do is to tell .configure in the Apache source directory what target directories to use. If you are following the convention that I use, which makes your home directory look like the / (base) directory, then the invocation parameters would be:


  ./configure --prefix=/home/stas

Apache will use the prefix for the rest of its target directories instead of the default /usr/local/apache. If you want to see what they are, then before you proceed add the --show-layout option:


  ./configure --prefix=/home/stas --show-layout

You might want to put all the Apache files under /home/stas/apache following Apache's convention:


  ./configure --prefix=/home/stas/apache

If you want to modify some or all of the names of the automatically created directories:


  ./configure --prefix=/home/stas/apache \
    --sbindir=/home/stas/apache/sbin
    --sysconfdir=/home/stas/apache/etc
    --localstatedir=/home/stas/apache/var \
    --runtimedir=/home/stas/apache/var/run \
    --logfiledir=/home/stas/apache/var/logs \
    --proxycachedir=/home/stas/apache/var/proxy

That's all!

Also remember that you can start the script only under a user and group you belong to. You must set the User and Group directives in httpd.conf to appropriate values.
Manual Local mod_perl Enabled Apache Installation

Now that we have learned how to install local Apache and Perl modules separately, let's see how to install mod_perl enabled Apache in our home directory. It's almost as simple as doing each one separately, but there is one wrinkle you need to know about that I'll mention at the end of this section.

Let's say you have unpacked the Apache and mod_perl sources under /home/stas/src and they look like this:


  % ls /home/stas/src
  /home/stas/src/apache_x.x.x
  /home/stas/src/mod_perl-x.xx

where x.xx are the version numbers as usual. You want the Perl modules from the mod_perl package to be installed under /home/stas/lib/perl5 and the Apache files to go under /home/stas/apache. The following commands will do that for you:


  % perl Makefile.PL \
  PREFIX=/home/stas \
  APACHE_PREFIX=/home/stas/apache \
  APACHE_SRC=../apache_x.x.x/src \
  DO_HTTPD=1 \
  USE_APACI=1 \
  EVERYTHING=1
  % make && make test && make install 
  % cd ../apache_x.x.x
  % make install

If you need some parameters to be passed to the .configure script, as we saw in the previous section, then use APACI_ARGS. For example:


  APACI_ARGS='--sbindir=/home/stas/apache/sbin, \
    --sysconfdir=/home/stas/apache/etc, \
    --localstatedir=/home/stas/apache/var, \
    --runtimedir=/home/stas/apache/var/run, \
    --logfiledir=/home/stas/apache/var/logs, \
    --proxycachedir=/home/stas/apache/var/proxy'

Note that the above multi-line splitting will work only with bash, tcsh users will have to list all the parameters on a single line.

Basically the installation is complete. The only remaining problem is the @INC variable. This won't be correctly set if you rely on the PERL5LIB environment variable unless you set it explicitly in a startup file that is require'd before loading any other module that resides in your local repository. A much nicer approach is to use the lib pragma as we saw before, but in a slightly different way -- we use it in the startup file and it affects all the code that will be executed under mod_perl handlers. For example:


  PerlRequire /home/stas/apache/perl/startup.pl

where startup.pl starts with:


  use lib qw(/home/stas/lib/perl5/5.00503/
             /home/stas/lib/perl5/site_perl/5.005);

Note that you can still use the hard-coded @INC modifications in the scripts themselves, but be aware that scripts modify @INC in BEGIN blocks and mod_perl executes the BEGIN blocks only when it performs script compilation. As a result, @INC will be reset to its original value after the scripts are compiled and the hard-coded settings will be forgotten.

The only place you can alter the ``original'' value is during the server configuration stage either in the startup file or by putting


  PerlSetEnv Perl5LIB \
  /home/stas/lib/perl5/5.00503/:/home/stas/lib/perl5/site_perl/5.005

in httpd.conf, but the latter setting will be ignored if you use the PerlTaintcheck setting, and I hope you do use it.

The remainder of the mod_perl configuration and use is just the same as if you were installing mod_perl as a superuser.
Local mod_perl Enabled Apache Installation with CPAN.pm

Assuming that you have configured CPAN.pm to install Perl modules locally as explained earlier in this article, the installation is simple. Start the CPAN.pm shell, set the arguments to be passed to perl Makefile.PL (modify the example setting to suit your needs), and tell <CPAN.pm> to do the rest for you:


  % perl -MCPAN -eshell
  cpan> o conf makepl_arg 'DO_HTTPD=1 USE_APACI=1 EVERYTHING=1 \
        PREFIX=/home/stas APACHE_PREFIX=/home/stas/apache'
  cpan> install mod_perl

When you use CPAN.pm for local installations, after the mod_perl installation is complete, you must make sure that the value of makepl_arg is restored to its original value.

The simplest way to do this is to quit the interactive shell by typing quit and re-entering it. But if you insist, then here is how to make it work without quitting the shell. You really want to skip this :)

If you want to continue working with CPAN *without* quitting the shell, then you must:

Previously in the Series

mod_perl in 30 minutes

Why mod_perl?

   1. remember the value of makepl_arg
   2. change it to suit your new installation
   3. build and install mod_perl
   4. restore it after completing mod_perl installation

this is quite a cumbersome task as of this writing, but I believe that CPAN.pm will eventually be improved to handle this more easily.

So if you are still with me, then start the shell as usual:


  % perl -MCPAN -eshell

First, read the value of the makepl_arg:


  cpan> o conf makepl_arg


  PREFIX=/home/stas

It will be something like PREFIX=/home/stas if you configured CPAN.pm to install modules locally. Save this value:


  cpan> o conf makepl_arg.save PREFIX=/home/stas

Second, set a new value, to be used by the mod_perl installation process. (You can add parameters to this line, or remove them, according to your needs.)


  cpan> o conf makepl_arg 'DO_HTTPD=1 USE_APACI=1 EVERYTHING=1 \
        PREFIX=/home/stas APACHE_PREFIX=/home/stas/apache'

Third, let <CPAN.pm> build and install mod_perl for you:


  cpan> install mod_perl

Fourth, reset the original value to makepl_arg. We do this by printing the value of the saved variable and assigning it to makepl_arg.


  cpan> o conf makepl_arg.save


  PREFIX=/home/stas


  cpan> o conf makepl_arg PREFIX=/home/stas

Not so neat, but a working solution. You could have written the value on a piece of paper instead of saving it to makepl_arg.save, but you are more likely to make a mistake that way.
References

    * The Apache site's URL: http://www.apache.org

    * The mod_perl site's URL: http://perl.apache.org

    * CPAN is the Comprehensive Perl Archive Network. The Master site's URL is http://cpan.org/. CPAN is mirrored at more than 100 sites worldwide. (http://cpan.org/SITES.html)
    
    
    


</entry>

<entry [Thu Feb 25 22:38:16 EST 2010] SLEEP FOR MILLISECONDS, MILLISECOND DATETIME>

DATETIME

#!/usr/bin/perl

use strict;
use warnings;

use Time::HiRes qw/gettimeofday/;

#in scalar context it returns a fractional number of seconds
my $seconds = gettimeofday(); 
print "seconds: $seconds\n";
exit;

#convert into milliseconds
my $ms      = int($seconds*1000); 

print "$seconds seconds is $ms milliseconds\n";

#in list context it returns the integer number of seconds and the remaining time in ms
($seconds, my $fraction) = gettimeofday();
$ms = $fraction + $seconds * 1000; #convert into milliseconds

print "$seconds seconds + $fraction milliseconds is $ms milliseconds\n";



SLEEP


http://stackoverflow.com/questions/896904/how-do-i-sleep-for-a-millisecond-in-perl
For delays of finer granularity than one second, the Time::HiRes module (from CPAN, and starting from Perl 5.8 part of the standard distribution) provides usleep().

Actually, it provides usleep() (which sleeps in microseconds) and nanosleep() (which sleeps in nanoseconds). You may want usleep(), which should let you deal with easier numbers. 1 millisecond sleep (using each):

use strict;
use warnings;

use Time::HiRes qw(usleep nanosleep);

# 1 millisecond == 1000 microseconds
usleep(1000);
# 1 microsecond == 1000 nanoseconds
nanosleep(1000000);
If you don't want to (or can't) load a module to do this, you may also be able to use the built-in select() function:

# Sleep for 250 milliseconds
select(undef, undef, undef, 0.25);


em




#!/usr/bin/perl
use Time::HiRes qw[gettimeofday tv_interval];

my $time1=[gettimeofday()];

commands;

my $milliseconds = tv_interval($time1)*1000;

printf "Elapsed time: %d milliseconds\n", $milliseconds;



</entry>

<entry [Mon Feb 22 23:34:14 EST 2010] USING STAT TO GET DIRECTORY/FILE INFO>

From Perl or C (and of course many other languages), you can get access to the stat information a bit more easily.

Here's a simple Perl example like those already given:


#!/usr/bin/perl

my @info = stat("testdir") or die "Can't stat testdir $!";
while (1) {
    @newinfo=stat("testdir") or die "Can't stat testdir $!";
    @what=qw(Device Inum Mode Links Owner Group Rdev Size Atime Mtime Ctime PBlock Blocks);
    $x=0;
    while ($info[$x]) {
      system("/bin/echo $what[$x] $info[$x] $newinfo[$x]") if ($info[$x] ne $newinfo[$x]);
      $x++;
    }
    @info=@newinfo;
    sleep 1;
}



</entry>

<entry [Mon Feb 22 23:34:14 EST 2010] CPAN File::Find::Rule for all the subdirectories of a given directory>

use File::Find::Rule;
 
  # find all the subdirectories of a given directory
  my @subdirs = File::Find::Rule->directory->in( $directory );

  # find all the .pm files in @INC
  my @files = File::Find::Rule->file()
                              ->name( '*.pm' )
                              ->in( @INC );

  # as above, but without method chaining
  my $rule =  File::Find::Rule->new;
  $rule->file;
  $rule->name( '*.pm' );
  my @files = $rule->in( @INC );
  
  

</entry>

<entry [Fri Feb 6 14:34:14 EST 2009] INSTALL DBI IN A LOCAL lib>


1. DOWNLOAD FROM CPAN

DBI-1.607.tar.gz
tar xvfz DBI-1.607.tar.gz


2. UNZIP AND INSTALL

cd /home/syoung/base/lib/perlmods/DBI-1.607

perl Makefile.PL PREFIX=/home/syoung/base/lib/perl_5.8.8
make
make test
make install




</entry>

<entry [Fri Feb 6 16:32:14 EST 2009] LOAD ccdsSeq ONTO tank ON kronos AND RUN captureSNP.pl ON >

Hi Sara,

Just in case you haven't got perl already installed (try 'perl -V' on the command line), here's the URL for the ActiveState distribution of Perl:

http://www.activestate.com/activeperl/downloads/

Unless you've got one of the new 64-bit systems, you'll need this version: Linux i686 glibc

Stay on the same Active State site and download Komodo Edit - a very good (and free!) Perl development environment.

I'd recommend the following books:

Beginning Perl for Bioinformatics
http://oreilly.com/catalog/9780596000806/

Mastering Perl for Bioinformatics
http://oreilly.com/catalog/9780596003074/

THE PERL DATA STRUCTURES COOKBOOK
http://www.perl.com/doc/FMTEYEWTK/pdsc/

This looks interesting but I haven't used it:
Bioinformatics, Biocomputing and Perl
http://glasnost.itcarlow.ie/~biobook/

You'll enjoy it more and learn faster if you apply it to a practical problem. Let me know if you've come across any particular problems and maybe I can suggest some approaches or resources. Of course "Google is your friend" but CPAN is usually my first port of call when I'm looking for a module that can accomplish most or some of a task:

search.cpan.org

If you're looking for a perl project to get some practise, I could suggest some bite-sized problems relating to my research area (Next Generation Sequencing).

I hope that's useful. Let me know if you have any other questions.

Cheers,

Stuart.

</entry>


