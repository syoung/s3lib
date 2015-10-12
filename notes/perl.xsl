perl




<entry [Fri 2015:01:16 14:05:08 EST] PIPE bash OUTPUT TO PERL ON COMMAND LINE>

cat cosmic.dups | head
	chr1	892327	892328
	chr1	908296	908297
	chr1	985348	985349
	chr1	985359	985360
	chr1	1115603	1115604
	chr1	1256375	1256376
	chr1	1268917	1268918
	chr1	1322638	1322639
	chr1	1354514	1354515
	chr1	1396237	1396238


6. CONFIRM cosmic.dups ALL SINGLETONS IN *.collapsed FILE

NO ENTRIES IN cosmic.dups FILE AFTER START 10177641 IN Cosmic FILE:

tail -n 2 CosmicCompleteExport_v70_VARS_hg19.wPub.txt.leftshift.sorted.5837

	chr1    9809932 9809933 snp     C       T       913620:-:carcinoma      1
	chr1    9809958 9809959 del     T       -       296468:22810696:carcinoma       1


SO REMOVED IN cosmic.dups.present

tail -n 2 cosmic.dups.present
	chr1	9793472	9793473
	chr1	9809932	9809933

	
EXTRACTED INPUT LINES FROM Cosmic FILE:

cat cosmic.dups.present | perl -lne 'my ($chrom, $start, $stop) = /^(chr\S+)\s+(\S+)\s+(\S+)/; my $command = "egrep -e \"$chrom\\s+$start\\s+$stop\" inputs/CosmicCompleteExport_v70_VARS_hg19.wPub.txt.leftshift.sorted.5837.sorted > inputs/chr1/$chrom-$start-$stop.tsv"; print $command; `$command` '


EXTRACTED OUTPUT LINES FROM EXPECTED COLLAPSED Cosmic FILE:

mkdir -p expected/chr1
cat cosmic.dups.present | perl -lne 'my ($chrom, $start, $stop) = /^(chr\S+)\s+(\S+)\s+(\S+)/; my $command = "egrep -e \"$chrom\\s+$start\\s+$stop\" expected/CosmicCompleteExport_v70_VARS_hg19.wPub.txt.leftshift.sorted.5837 > expected/chr1/$chrom-$start-$stop.tsv"; print $command; `$command` '


VIEWED INPUT AND OUTPUT LINES TOGETHER FOR EACH COLLAPSE:

cat cosmic.dups.present | perl -lne 'my ($chrom, $start, $stop) = /^(chr\S+)\s+(\S+)\s+(\S+)/; my $command = "head inputs/chr1/$chrom-$start-$stop.tsv expected/chr1/$chrom-$start-$stop.tsv"; print ">>>> $chrom-$start-$stop\n"; print `$command` '




NOTES
=====



perl -lpe's/:/@/g'      # assumes \n as input record separator
perl -0 -lpe's/:/@/g'   # assumes \0 as input record separator




How to pipe Bash Shell command's ouput line by line to Perl for Regex processing?
up vote 5 down vote favorite
1
	

I have some output data from some Bash Shell commands. The output is delimited line by line with "\n" or "\0". I would like to know that is there any way to pipe the output into Perl and process the data line by line within Perl (just like piping the output to awk, but in my case it is in the Perl context.). I suppose the command may be something like this :

Bash Shell command | perl -e 'some perl commands' | another Bash Shell command

Suppose I want to substitute all ":" character to "@" character in a "line by line" basis (not a global substitution, I may use a condition, e.g. odd or even line, to determine whether the current line should have the substitution or not.), then how could I achieve this.

As a newbie in Perl, I want to have some advice on this. Thanks in advance.
perl bash pipe
shareimprove this question
	
asked Feb 7 '12 at 9:58
user1129812
70611427
	
add a comment
2 Answers
active oldest votes
up vote 10 down vote accepted
	

See perlrun.

perl -lpe's/:/@/g'      # assumes \n as input record separator
perl -0 -lpe's/:/@/g'   # assumes \0 as input record separator

perl -lne'if (0 == $. % 2) { s/:/@/g; print; }' # modify and print even lines

Yes, Perl may appear at any place in a pipeline, just like awk.
shareimprove this answer
	
answered Feb 7 '12 at 10:55
daxim
32k43388
	
   	 
	
Thanks a lot. It works. –  user1129812 Feb 7 '12 at 11:28
add a comment
up vote 2 down vote
	

The command line switch -p (if you want automatic printing) or -n (if you don't want it) will do what you want. The line contents are in $_ so:

perl -pe's/\./\@/g'

would be a solution. Generally, you want to read up on the '<>' (diamond) operator which is the way to go for non-oneliners.
shareimprove this answer
	
edited Feb 7 '12 at 10:45

	
answered Feb 7 '12 at 10:10
Alien Life Form
1,032713
	
2 	 
	
This also requires the -e flag if you are writing the entire program on the command line. (otherwise it will fail to find the Perl script entitled "s/\./\@/g") –  SkryneSaver
	
</entry>
<entry [Sun 2014:09:14 19:31:33 EST] ADDED getOptionsFromArray FUNCTIONALITY TO MooseX::Getopt>

package Agua::CLI::Getopt;

#use MooseX::Declare;
#use MooseX::Getopt;
use Getopt::Long;
#use Moose::Role 0.56;
use Moose::Role;

#with 'MooseX::Getopt';

#class Agua::CLI::Getopt with MooseX::Getopt {

sub new_with_options {

    my ($class, @params) = @_;

    print "Agua::CLI::Getopt::new_with_options()\n";
    print "Agua::CLI::Getopt::new_with_options    class: $class\n";
    print "Agua::CLI::Getopt::new_with_options    params: @params\n";
    print "Agua::CLI::Getopt::new_with_options    ARGV: @ARGV\n";

    my $config_from_file;
    if($class->meta->does_role('MooseX::ConfigFromFile')) {
        #local @ARGV = @ARGV;
        local @ARGV = @params;

        # just get the configfile arg now; the rest of the args will be
        # fetched later
        my $configfile;
        my $opt_parser = Getopt::Long::Parser->new( config => [ qw( no_auto_help pass_through ) ] );
        $opt_parser->getoptions( "configfile=s" => \$configfile );

        if(!defined $configfile) {
            my $cfmeta = $class->meta->find_attribute_by_name('configfile');
            $configfile = $cfmeta->default if $cfmeta->has_default;
            if (ref $configfile eq 'CODE') {
                # not sure theres a lot you can do with the class and may break some assumptions
                # warn?
                $configfile = &$configfile($class);
            }
            if (defined $configfile) {
                $config_from_file = eval {
                    $class->get_config_from_file($configfile);
                };
                if ($@) {
                    die $@ unless $@ =~ /Specified configfile '\Q$configfile\E' does not exist/;
                }
            }
        }
        else {
            $config_from_file = $class->get_config_from_file($configfile);
        }
    }

    my $constructor_params = ( @params == 1 ? $params[0] : {@params} );

    Carp::croak("Single parameters to new_with_options() must be a HASH ref")
        unless ref($constructor_params) eq 'HASH';

    my %processed = $class->_parse_argv(
        options => [
            $class->_attrs_to_options( $config_from_file )
        ],
        params => $constructor_params,
    );

    my $params = $config_from_file ? { %$config_from_file, %{$processed{params}} } : $processed{params};

    # did the user request usage information?
    if ( $processed{usage} and $params->{help_flag} )
    {
        $class->_getopt_full_usage($processed{usage});
    }

    $class->new(
        ARGV       => $processed{argv_copy},
        extra_argv => $processed{argv},
        ( $processed{usage} ? ( usage => $processed{usage} ) : () ),
        %$constructor_params, # explicit params to ->new
        %$params, # params from CLI
    );
}
    
1;



    
</entry>
<entry [Thu 2014:08:07 04:15:36 EST] SUBROUTINE deeplyIdentical>

method deeplyIdentical ($a, $b) {
    if (not defined $a)        { return not defined $b }
    elsif (not defined $b)     { return 0 }
    elsif (not ref $a)         { $a eq $b }
    elsif ($a eq $b)           { return 1 }
    elsif (ref $a ne ref $b)   { return 0 }
    elsif (ref $a eq 'SCALAR') { $$a eq $$b }
    elsif (ref $a eq 'ARRAY')  {
        if (@$a == @$b) {
            for (0..$#$a) {
                my $rval;
                return $rval unless ($rval = $self->deeplyIdentical($a->[$_], $b->[$_]));
            }
            return 1;
        }
        else { return 0 }
    }
    elsif (ref $a eq 'HASH')   {
        if (keys %$a == keys %$b) {
            for (keys %$a) {
                my $rval;
                return $rval unless ($rval = $self->deeplyIdentical($a->{$_}, $b->{$_}));
            }
            return 1;
        }
        else { return 0 }
    }
    elsif (ref $a eq ref $b)   { warn 'Cannot test '.(ref $a)."\n"; undef }
    else                       { return 0 }
}
	

	
</entry>
<entry [Tue 2014:04:29 00:52:52 EST] SIMPLIFY COMMAND LINE APPS WITH App::Cmd>

http://search.cpan.org/~rjbs/App-Cmd-0.323/lib/App/Cmd.pm

AND ALSO MooseX::App::Cmd

SYNOPSIS ^

in yourcmd:

  use YourApp;
  YourApp->run;
in YourApp.pm:

  package YourApp;
  use App::Cmd::Setup -app;
  1;
  
in YourApp/Command/blort.pm:

  package YourApp::Command::blort;
  use YourApp -command;
  use strict; use warnings;

  sub opt_spec {
    return (
      [ "blortex|X",  "use the blortex algorithm" ],
      [ "recheck|r",  "recheck all results"       ],
    );
  }

  sub validate_args {
    my ($self, $opt, $args) = @_;

    # no args allowed but options!
    $self->usage_error("No args allowed") if @$args;
  }

  sub execute {
    my ($self, $opt, $args) = @_;

    my $result = $opt->{blortex} ? blortex() : blort();

    recheck($result) if $opt->{recheck};

    print $result;
  }
  
  
and, finally, at the command line:

  knight!rjbs$ yourcmd blort --recheck

  All blorts successful.

DESCRIPTION ^

App::Cmd is intended to make it easy to write complex command-line applications without having to think about most of the annoying things usually involved.

For information on how to start using App::Cmd, see App::Cmd::Tutorial.

METHODS ^

new

  my $cmd = App::Cmd->new(\%arg);
This method returns a new App::Cmd object. During initialization, command plugins will be loaded.

Valid arguments are:

  no_commands_plugin - if true, the command list plugin is not added

  no_help_plugin     - if true, the help plugin is not added

  no_version_plugin  - if true, the version plugin is not added

  plugin_search_path - The path to search for commands in. Defaults to
                       results of plugin_search_path method
If no_commands_plugin is not given, App::Cmd::Command::commands will be required, and it will be registered to handle all of its command names not handled by other plugins.

If no_help_plugin is not given, App::Cmd::Command::help will be required, and it will be registered to handle all of its command names not handled by other plugins. Note: "help" is the default command, so if you do not load the default help plugin, you should provide your own or override the default_command method.

If no_version_plugin is not given, App::Cmd::Command::version will be required to show the application's version with command --version. The version command is not included in the command list.

run

  $cmd->run;
This method runs the application. If called the class, it will instantiate a new App::Cmd object to run.

It determines the requested command (generally by consuming the first command-line argument), finds the plugin to handle that command, parses the remaining arguments according to that plugin's rules, and runs the plugin.

It passes the contents of the global argument array (@ARGV) to "prepare_command", but @ARGV is not altered by running an App::Cmd.

prepare_args

Normally App::Cmd uses @ARGV for its commandline arguments. You can override this method to change that behavior for testing or otherwise.

default_args

If "prepare_args" is not changed and there are no arguments in @ARGV, this method is called and should return an arrayref to be used as the arguments to the program. By default, it returns an empty arrayref.

arg0

full_arg0

  my $program_name = $app->arg0;

  my $full_program_name = $app->full_arg0;
These methods return the name of the program invoked to run this application. This is determined by inspecting $0 when the App::Cmd object is instantiated, so it's probably correct, but doing weird things with App::Cmd could lead to weird values from these methods.

If the program was run like this:

  knight!rjbs$ ~/bin/rpg dice 3d6
Then the methods return:

  arg0      - rpg
  full_arg0 - /Users/rjbs/bin/rpg
These values are captured when the App::Cmd object is created, so it is safe to assign to $0 later.

prepare_command

  my ($cmd, $opt, @args) = $app->prepare_command(@ARGV);
This method will load the plugin for the requested command, use its options to parse the command line arguments, and eventually return everything necessary to actually execute the command.

default_command

This method returns the name of the command to run if none is given on the command line. The default default is "help"

execute_command

  $app->execute_command($cmd, \%opt, @args);
This method will invoke validate_args and then run on $cmd.

plugin_search_path

This method returns the plugin_search_path as set. The default implementation, if called on "YourApp::Cmd" will return "YourApp::Cmd::Command"

This is a method because it's fun to override it with, for example:

  use constant plugin_search_path => __PACKAGE__;
allow_any_unambiguous_abbrev

If this method returns true (which, by default, it does not), then any unambiguous abbreviation for a registered command name will be allowed as a means to use that command. For example, given the following commands:

  reticulate
  reload
  rasterize
Then the user could use ret for reticulate or ra for rasterize and so on.

global_options

  if ($cmd->app->global_options->{verbose}) { ... }
This method returns the running application's global options as a hashref. If there are no options specified, an empty hashref is returned.

set_global_options

  $app->set_global_options(\%opt);
This method sets the global options.

command_names

  my @names = $cmd->command_names;
This returns the commands names which the App::Cmd object will handle.

command_plugins

  my @plugins = $cmd->command_plugins;
This method returns the package names of the plugins that implement the App::Cmd object's commands.

plugin_for

  my $plugin = $cmd->plugin_for($command);
This method returns the plugin (module) for the given command. If no plugin implements the command, it returns false.

get_command

  my ($command_name, $opt, @args) = $app->get_command(@args);
Process arguments and into a command name and (optional) global options.

usage

  print $self->app->usage->text;
Returns the usage object for the global options.

usage_desc

The top level usage line. Looks something like

  "yourapp < command> [options]"
global_opt_spec

Returns an empty list. Can be overridden for pre-dispatch option processing. This is useful for flags like --verbose.

usage_error

  $self->usage_error("Something's wrong!");
Used to die with nice usage output, during validate_args.

TODO ^

publish and bring in Log::Speak (simple quiet/verbose output)
publish and use our internal enhanced describe_options
publish and use our improved simple input routines
AUTHOR ^

Ricardo Signes < rjbs@cpan.org>

COPYRIGHT AND LICENSE ^

This software is copyright (c) 2013 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.

syntax highlighting:  




	
</entry>
<entry [Tue 2014:04:29 00:06:03 EST] USE Getopt::Long WITH A "message" ARGUMENT AT THE END>

SHOULD BE SOMETHING LIKE THIS:

#use Getopt::Long qw(GetOptionsFromArray GetOptionsFromString);
#my $additional;
#my $return = GetOptionsFromString	($additional, {
#    'host=s'		=> \$host,
#    'port=s'		=> \$port,
#    'user=s'		=> \$user,
#    'pass=s'		=> \$pass,
#    'message=s'		=> \$message,
#    'vhost=s'		=> \$vhost,
#    'showlog=i'     => \$showlog,
#    'printlog=i'    => \$printlog,
#    'help'          => \$help
#}) or die "No options specified. Try '--help'\n";
#usage() if defined $help;


	
</entry>
<entry [Tue 2013:04:02 19:20:41 EST] AUTOMATE API DOCUMENTATION WITH pod2html>

*** USE AGUA'S doc.pl INSTEAD ***


CPAN STYLE
http://search.cpan.org/~jmcnamara/App-Pod2CpanHtml-0.04/bin/pod2cpanhtml

pod2cpanhtml - A utility to convert Pod to search.cpan.org style HTML.

SYNOPSIS 

pod2cpanhtml [options] podfile [outfile]

    Options:
        --index    Generate a HTML index in output doc (the default).
        --help     Print a brief help message.
        --man      Print the full manpage.
        --version  Print the version of the program.
        --errata   Flag any Pod errors at the end of the doc (the default).

    Example:
        pod2cpanhtml SomeModule.pm > some_module.html
DESCRIPTION 

This program is used for converting Pod documents to http://search.cpan.org/ style HTML.

Pod is Perl's Plain Old Documentation format, see perlpod.

The pod2cpanhtml utility produces HTML output similar to search.cpan.org by using the same conversion module, Pod::Simple::HTML and the same CSS, http://search.cpan.org/s/style.css.

It should be noted that this utility isn't the actual program used to create the HTML for seach.cpan.org. However, the output should visually be the same.

OPTIONS 

podfile
The input file that contains the Pod file to be converted.

outfile
The converted output file in HTML format. Defaults to stdout if not specified.

--index or -i
Generate a HTML index in the output document. This is the default. To turn the index off use --no-index or -no-i.

--help or -h
Print a brief help message and exit.

--man or -m
Prints the manpage and exit.

--version or -v
Prints the version of the program.

--errata or -e
Generate a "Pod Errors" section at the end of the document if there are Pod errors. This is the default. To turn this feature off use --no-errata or -no-e. Equivalent to the Pod::Simple no_errata_section() method.




PLAIN HTML

emacs -nw pod2html.pl

#!/usr/bin/perl
use strict; use warnings;    
use Pod::HtmlEasy;   
my $pod_file = shift or die "Specify POD file as argument";    
my $podhtml = Pod::HtmlEasy->new();
my $html = $podhtml->pod2html( $pod_file);
print $html;


    
</entry>
<entry [Tue 2013:04:02 19:17:05 EST] AUTOMATICALLY UPDATE PERL VERSION>


#!/usr/bin/perl -pi

BEGIN {
    die "Usage: $0 version[, new_version]\n\n" unless @ARGV;

    $old = shift;
    $new = shift || sprintf('%.2f', $old + .01);
    $dir = shift || '.';

    @ARGV =
      map { print; chomp; $_ }
      grep !( /\.svn/ or /Changes/ or /META\.yml/ or /Makefile\.PL/),
      `grep -lr '\Q$old\E' $dir`;
}

s/(\$VERSION\s*=?\s*'?)\Q$old\E('?)/${1}$new$2/g;

NOTE: LAST LINE IS THE IMPORTANT ONE!!!

    
</entry>
<entry [Sun 2013:01:20 12:53:58 EST] CONVERT HEXES IN FILE SAMPLE TO ASCII>


*** NONE OF THESE WORKED !!! ***


method sampleFile ($filepath, $bytes) {
	$self->logDebug("filepath", $filepath);
	$self->logDebug("bytes", $bytes);

	my $binary = -B $filepath;
	$self->logDebug("binary", $binary);

	my $found = -f $filepath;
	$self->logDebug("found", $found);

	#use feature 'unicode_strings';
	
	my $sample;
	if ( -B $filepath
		or $filepath =~ /\.ebwt$/
		or $filepath =~ /\.bfa$/
		or $filepath =~ /\.vld$/
		or $filepath =~ /\.2bpb$/ ) {
		$sample = "Binary file";
	}
	elsif ( $found ) {
		$self->logDebug("reading filepath", $filepath);
		open FILEHANDLE, "<:encoding(ASCII)", $filepath or $self->logDebug("Can't open filepath", $filepath);

#		binmode(FILEHANDLE, ":ascii");
		#binmode(FILEHANDLE, ":utf8");
		#binmode(FILEHANDLE, ":encoding(UTF-8)");

		seek(FILEHANDLE, 0, 0);
		read(FILEHANDLE, $sample, $bytes);
	}

	$self->logDebug("BEFORE UTF8 sample", $sample);
	print "sample length: ", length($sample), "\n";

	
	#$sample =~ s/\n\x{1b}]0;\a//g;
	
	#print "printf('%p',$sample);\n";
	#printf("%p",$sample);

	#### REMOVE UNICODE/HEX
	$sample = sprintf ("%s", $sample);	

	#use Encode qw(_utf8_on) ;
	#my $utf8 = utf8::is_utf8($sample);
	#$self->logDebug("utf8", $utf8);
	#
	#utf8::decode($sample);
	#
	#_utf8_on($sample);
	#print "unpack(a*, sample): ", (unpack('a*', $sample)), "\n";
	#printf "'%s', %d/%d %s\n", raw(unpack('a*', $sample));
	
#	$sample =~ s/\\(
#        (?:[arnt'"\\]) |               # Single char escapes
#        (?:[ul].) |                    # uc or lc next char
#        (?:x[0-9a-fA-F]{2}) |          # 2 digit hex escape
#        (?:x\{[0-9a-fA-F]+\}) |        # more than 2 digit hex
#        (?:\d{2,3}) |                  # octal
#        (?:N\{U\+[0-9a-fA-F]{2,4}\})   # unicode by hex
#        )/"qq|\\$1|"/geex;
	   
	   #use utf8;
	##use Encode qw(decode_utf8);
	#my $success = utf8::decode($sample);
#	my $success = utf8::upgrade($sample);
	#$self->logDebug("success", $success);

#use open ':std';

#use Text::Unidecode;
#$sample = unidecode($sample);

	$self->logDebug("AFTER UTF8 sample", $sample);
	print "sample length: ", length($sample), "\n";

	#### MAKE JSON-SAFE BACKSLASHES
	$sample =~ s/\\/\\\\/g;
	

	#### SET TO '' IF FILE IS EMPTY
	if ( not defined $sample or not $sample ) {
		$sample = '';
	}
	else {
		#$self->logDebug("BEFORE jsonSafe, sample", $sample);
		#$sample = $self->jsonSafe($sample, 'toJson');
		#$self->logDebug("AFTER jsonSafe, sample", $sample);
	}
	
	return $sample;
}


    
</entry>
<entry [Sat 2013:01:12 21:08:09 EST] FindBin WITH LINKS>

CALL WITH FULL PATH, USE $0 AND PARSE DOWN TO aguadir

    
</entry>
<entry [Thu 2012:12:20 19:40:54 EST] USE perlIO::eol TO GET ALL LINE ENDINGS>

http://www.elharo.com/blog/software-development/perl/2007/01/06/perl-and-multiple-line-ending-characters/


use PerlIO::eol; right after the shebang line:

#!/usr/bin/perl
use PerlIO::eol;
#...


</entry>
<entry [Wed 2012:11:14 15:12:59 EST] SORT A BINARY FILE>

#http://www.perlmonks.org/?node_id=53920

SORTHITS v2
===========

#!/usr/bin/perl -w

my $maxrecs= 8*1024*1024; # Whatever you determine fits
my $recsize= 8;
my $sortsize= 2;
my $sortoff= 6;
# Here is the only memory hog:
my $sorton= " "x($maxrecs*$sortsize);
my $idx= 0;
# Note that I don't use sysread() here as I think the
# buffering offered by read() may improve speed:
while(  $idx < $maxrecs  &&  read(FILE,$rec,$recsize)  ) {
    substr( $sorton, $idx++*$sortsize, $sortsize )=
      substr( $rec, $sortoff, $sortsize );
}
my @idx= sort { substr($sorton,$a*$sortsize,$sortsize)
            cmp substr($sorton,$b*$sortsize,$sortsize)
         } 0..($idx-1);
for $idx (  @idx  ) {
    seek( FILE, $idx*$recsize, 0 );
    sysread( FILE, $rec, $recsize );
    print OUT $rec; # or substr($rec,0,6)
}




SORTHITS v1
===========

#!/usr/bin/perl -w

#constants
$record_size = 8;
$amp_index = 6;
$amp_format = 'S';
$time_length = 6;

$sorted = $big=$ARGV[0];
$sorted =~ s/(\.bin)$/_sorted$1/;

#load the data from $big
open DATA, $big;
binmode DATA;
my $amp_a = loadamp();
close DATA;

die "Could not read data from $big" unless @{$amp_a->[0]};

print "Ready with loading\n";

#sort on first item: amp
my @sortamp = sort{ $a->[0] <=> $b->[0] } @$amp_a; 

#print out in the 'bigfile' order ([0] contains amp, [1] string with time-info
open OUT, ">$sorted";
binmode OUT;
for $amp( @sortamp ){
  print OUT $amp->[1].pack( $amp_format, $amp->[0]); 
}
close OUT;

# UNPACK THE DATA IN SORT RATHER THAN CARRYING AROUND UNPACKED DATA
#my @sortamp = sort{ unpack(..., substr(...$a)) <=> unpack(..., substr(...$b) } @$amp_a; 

# IF SORT KEY IS INTEGER AT END OF DATA
#my @sortamp = sort{ reverse($a) cmp reverse($b) } @$amp_a;


sub loadamp{
  my $str;
  my @amp_a;
  my $n = 1;
  do {
    $n = sysread( DATA, $str, $record_size);
    sysseek( DATA, $record_size, 1);
    (my $amp)=unpack( $amp_format, substr( $str, $amp_index, 2) );
    push(@amp_a, [$amp,substr( $str, 0, $time_length)]) if $n;
  } while ( $n);
  \@amp_a;
}


SORTHITS v0
===========

#!/usr/bin/perl -w

#constants
$record_size = 8;
$amp_index = 6;
$amp_format = 'S';
$time_length = 6;

$sorted = $big=$ARGV[0];
$sorted =~ s/(\.bin)$/_sorted$1/;

#load the data from $big
open DATA, $big;
binmode DATA;
my $amp_a = loadamp();
close DATA;

die "Could not read data from $big" unless @{$amp_a->[0]};

print "Ready with loading\n";

#sort on first item: amp
my @sortamp = sort{ $a->[0] <=> $b->[0] } @$amp_a; 

#print out in the 'bigfile' order ([0] contains amp, [1] string with time-info
open OUT, ">$sorted";
binmode OUT;
for $amp( @sortamp ){
  print OUT $amp->[1].pack( $amp_format, $amp->[0]); 
}
close OUT;

sub loadamp{
  my $str;
  my @amp_a;
  my $n = 1;
  do {
    $n = sysread( DATA, $str, $record_size);
    sysseek( DATA, $record_size, 1);
    (my $amp)=unpack( $amp_format, substr( $str, $amp_index, 2) );
    push(@amp_a, [$amp,substr( $str, 0, $time_length)]) if $n;
  } while ( $n);
  \@amp_a;
}

	
</entry>
<entry [Wed 2012:11:14 15:02:20 EST] SORTING LINES IN LARGE FILES WITH INDEX ON-THE-FLY>

SUMMARY:

CREATE INDEX ARRAY WITH ENTRY FOR EACH LINE, SORT INDEXES, PRINT LINES IN ORDER TO OUTFILE

NB: DID THIS BEFORE, USING A SEPARATE FILE TO HOLD THE INDEXES, RATHER THAN IN MEMORY



http://www.perlmonks.org/?node_id=53920

you can save a ton of memory by not storing any of your records in memory as follows:

my $maxrecs= 8*1024*1024; # Whatever you determine fits
my $recsize= 8;
my $sortsize= 2;
my $sortoff= 6;
# Here is the only memory hog:
my $sorton= " "x($maxrecs*$sortsize);
my $idx= 0;
# Note that I don't use sysread() here as I think the
# buffering offered by read() may improve speed:
while(  $idx < $maxrecs  &&  read(FILE,$rec,$recsize)  ) {
    substr( $sorton, $idx++*$sortsize, $sortsize )=
      substr( $rec, $sortoff, $sortsize );
}
my @idx= sort { substr($sorton,$a*$sortsize,$sortsize)
            cmp substr($sorton,$b*$sortsize,$sortsize)
         } 0..($idx-1);
for $idx (  @idx  ) {
    seek( FILE, $idx*$recsize, 0 );
    sysread( FILE, $rec, $recsize );
    print OUT, $rec; # or substr($rec,0,6)
}
[download]
	
</entry>
<entry [Sat 2012:11:10 21:59:19 EST] FORK TO EXIT FOR CGI PROCESS>

	my $pid;
	if ( $pid = fork() ) { #### ****** Parent ******
	
		#### QUICK EXIT WITH PROGRESS INFO FOR CGI CLIENT
		
		 SET InactiveDestroy ON DATABASE HANDLE
		$self->db()->dbh()->{InactiveDestroy} = 1;
		my $dbh = $self->db()->dbh();
		undef $dbh;
	
		$self->logStatus("Running workflow $project.$workflow");
		print "\n\n\n\n";
	
		select STDOUT;
		$| = 1;
		close(STDOUT);
		exit(0);
	}
	else { #### ****** Child ****** 
		$| = 1;
	
		CLOSE OUTPUT SO CGI SCRIPT WILL QUIT
		close(STDOUT);  
		close(STDERR);
		close(STDIN);
	
		RESET DBH JUST IN CASE
		$self->setDbh();

	
		#### CARRY ON DOING SOME LONG PROCESS
		
	}
		
		
	
</entry>
<entry [Fri 2012:11:02 22:41:07 EST] PERL MOOSE META>



<!--
<iframe src="http://www.slideshare.net/slideshow/embed_code/1990452" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="http://www.slideshare.net/sartak/extending-moose" title="Extending Moose" target="_blank">Extending Moose</a> </strong> from <strong><a href="http://www.slideshare.net/sartak" target="_blank">sartak</a></strong> </div>

-->
	
</entry>
<entry [Fri 2012:11:02 14:41:48 EST] REDEFINE A SUBROUTINE>

GOOD REFERENCE - PERL TREASURES
http://www.perl.com/pub/2003/06/19/treasures.html

NB: overrideMethod AND overrideSequence SUBROUTINES MUST BE IN THE MODULE FILE FOR THE OBJECT WHOSE METHOD IS BEING OVERRIDED



1. REDEFINE A SUBROUTINE IN ANOTHER OBJECT

CALL overrideMethod IN OTHER OBJECT:

Agua::Workflow
--------------
    my $sub = sub {
        my $self    =   shift;
        $self->logDebug("OVERRIDE Test::Agua::StarCluster::load");
        return $self;
    };
    $self->starcluster()->overrideMethod ("load", $sub);

	
Test::Agua::StarCluster
-----------------------

	method overrideMethod ($method, $sub) {
		$self->logDebug("method", $method);
		$self->logDebug("sub", $sub);
	
		{
			no strict;
			*{$method} = $sub;
		}
	}
	

	
	
2. REDEFINE A SUBROUTINE IN THE SAME OBJECT

	*{getClusterStatus} = sub {
        return $clusterobject;
	};


EXAMPLE:

method testStart {
...
	*{terminateCluster} = sub {
		print "DOING OVERRIDE terminateCluster\n";
		shift->overrideTerminateCluster();
	};

	$self->logDebug("BEFORE self->terminateCluster");
	$self->terminateCluster($cluster, $configfile, $executable, undef, undef);
}

method overrideTerminateCluster {
	print "DOING overrideTerminateStarCluster\n";
}


OUTPUT:


2012-11-02 14:40:48    [DEBUG]   	Test::Agua::StarCluster::testStart	87	BEFORE self->terminateCluster
DOING OVERRIDE terminateCluster
DOING overrideTerminateStarCluster
2012-11-02 14:40:48    [DEBUG]   	Test::Agua::StarCluster::testStart	90	AFTER self->terminateCluster
2012-11-02 14:40:48    [DEBUG]   	Test::Agua::StarCluster::testStart	95	DEBUG EXIT

	
</entry>
<entry [Sun 2012:10:14 23:08:24 EST] FILE TEST FOR MISSING FILE USING Test::More>


	ok(! -d $sourcesubdir, "source subdir 'syoung' removed");
 
    
</entry>
<entry [Fri 2012:08:17 23:17:07 EST] PERL VERSIONS FOR UBUNTU VERSIONS>

10.10 lucid-updates (perl): Larry Wall's Practical Extraction and Report Language 
5.10.1-8ubuntu2.1: amd64 i386

11.04 natty (perl): Larry Wall's Practical Extraction and Report Language 
5.10.1-17ubuntu4.1 [security]: amd64 i386

    natty-updates (perl): Larry Wall's Practical Extraction and Report Language 
    5.10.1-17ubuntu4.1: amd64 i386

11.10 oneiric (perl): Larry Wall's Practical Extraction and Report Language 
5.12.4-4: amd64 i386

12.04 precise (perl): Larry Wall's Practical Extraction and Report Language 
5.14.2-6ubuntu2: amd64 i386

    12.04 precise-updates (perl): Larry Wall's Practical Extraction and Report Language 
    5.14.2-6ubuntu2.1: amd64 i386

12.10 quantal (perl): Larry Wall's Practical Extraction and Report Language 
5.14.2-12: amd64 i386
    
</entry>
<entry [Fri 2012:08:17 22:18:09 EST] SUIDPERL IS DEAD BUT PERL STILL WORKS WITH SETUID>

http://unix.stackexchange.com/questions/364/allow-setuid-on-shell-scripts

Allow setuid on shell scripts

The setuid permission bit tells Linux to run a program with the effective user id of the owner instead of the executor:

> cat setuid-test.c

<!--
#include <stdio.h>
#include <unistd.h>

int main(int argc, char** argv) {
    printf("%d", geteuid());
    return 0;
}
-->

> gcc -o setuid-test setuid-test.c
> ./setuid-test

1000

> sudo chown nobody ./setuid-test; sudo chmod +s ./setuid-test
> ./setuid-test

65534
However, this only applies to executables; shell scripts ignore the setuid bit:

> cat setuid-test2

#!/bin/bash
id -u

> ./setuid-test2

1000

> sudo chown nobody ./setuid-test2; sudo chmod +s ./setuid-test2
> ./setuid-test2

1000
Wikipedia says:

Due to the increased likelihood of security flaws, many operating systems ignore the setuid attribute when applied to executable shell scripts.

Assuming I'm willing to accept those risks, is there any way to tell Linux to treat the setuid bit the same on shell scripts as it does on executables?

If not, is there a common workaround for this problem? My current solution is to add a sudoers entry to allow ALL to run a given script as the user I want it run as, with NOPASSWD to avoid the password prompt. The main downsides to that is the need for a sudoers entry every time I want to do this, and the need for the caller to sudo some-script instead of just some-script

shell scripting setuid security
shareimprove this question
edited Aug 12 '10 at 15:08

codehead
33624
asked Aug 12 '10 at 2:20

Michael Mrozek♦
19.4k35498

82% accept rate
feedback
5 Answersactiveoldestvotes
up vote
18
down vote
Linux ignores the setuid¹ bit on all interpreted executables (i.e. executables starting with a #! line). The comp.unix.questions FAQ explains the security problems with setuid shell scripts. These problems are of two kinds: shebang-related and shell-related.

Setuid shebang
There is a race condition inherent to the way shebang (#!) is typically implemented:

The kernel opens the executable, and finds that it starts with #!.
The kernel closes the executable and opens the interpreter instead.
The kernel inserts the path to the script to the argument list (as argv[1]), and executes the interpreter.
If setuid scripts are allowed with this implementation, an attacker can invoke an arbitrary script by creating a symbolic link to an existing setuid script, executing it, and arranging to change the link after the kernel has performed step 1 and before the interpreter gets around to opening its first argument. For this reason, most unices ignore the setuid bit when they detect a shebang.

One way to secure this implementation would be for the kernel to lock the script file until the interpreter has opened it (note that this must prevent not only unlinking or overwriting the file, but also renaming any directory in the path). But unix systems tend to shy away from mandatory locks, and symbolic links would make a correct lock feature especially difficult and invasive. I don't think anyone does it this way.

A few unix systems (mainly OpenBSD, NetBSD and Mac OS X, all of which require a kernel setting to be enabled) implement secure setuid shebang using an additional feature: the path /dev/fd/N refers to the file already opened on file descriptor N (so opening /dev/fd/N is roughly equivalent to dup(N)). Many unix systems (including Linux) have /dev/fd but not setuid scripts.

The kernel opens the executable, and finds that it starts with #!. Let's say the file descriptor for the executable is 3.
The kernel opens the interpreter.
The kernel inserts /dev/fd/3 the argument list (as argv[1]), and executes the interpreter.
Sven Mascheck's shebang page has a lot of information on shebang across unices, including setuid support.

Setuid interpreters
Let's assume you've managed to make your program run as root, either because your OS supports setuid shebang or because you've used a native binary wrapper (such as sudo). Have you opened a security hole? Maybe. The issue here is not about interpreted vs compiled programs. The issue is whether your runtime system behaves safely if executed with privileges.

Any dynamically linked native binary executable is in a way interpreted by the dynamic loader (e.g. /lib/ld.so), which loads the dynamic libraries required by the program. On many unices, you can configure the search path for dynamic libraries through the environment (LD_LIBRARY_PATH is a common name for the environment variable), and even load additional libraries into all executed binaries (LD_PRELOAD). The invoker of the program can execute arbitrary code in that program's context by placing a specially-crafted libc.so in $LD_LIBRARY_PATH (amongst other tactics). All sane systems ignore the LD_* variables in setuid executables.

In shells such as sh, csh and derivatives, environment variables automatically become shell parameters. Through parameters such as PATH, IFS, and many more, the invoker of the script has many opportunities to execute arbitrary code in the shell scripts's context. Some shells set these variables to sane defaults if they detect that the script has been invoked with privileges, but I don't know that there is any particular implementation that I would trust.

Most runtime environments (whether native, bytecode or interpreted) have similar features. Few take special precautions in setuid executables, though the ones that run native code often don't do anything fancier than dynamic linking (which does take precautions).

Perl is a notable exception. It explicitly supports setuid scripts in a secure way. In fact, your script can run setuid even if your OS ignored the setuid bit on scripts. This is because perl ships with a setuid root helper that performs the necessary checks and reinvokes the interpreter on the desired scripts with the desired privileges. This is explained in the perlsec manual. It used to be that setuid perl scripts needed #!/usr/bin/suidperl -wT instead of #!/usr/bin/perl -wT, but on most modern systems, #!/usr/bin/perl -wT is sufficient.

Note that using a native binary wrapper does nothing to prevent these problems. In fact, it can make the situation worse, because it might prevent your runtime environment from detecting that it is invoked with privileges and bypassing its runtime configurability.

TL,DR:

Setuid shebang is insecure but usually ignored.
If you run a program with privileges (either through sudo or setuid), write native code or perl.
¹ This discussion applies equally if you substitute “setgid” for “setuid”.

shareimprove this answer
answered Oct 8 '10 at 20:18

Gilles
99.6k1194227
Wow, you just scared the crap out of me, and I think I need to spend the next 4 days re-writing a lot of shell scripts in native code instead! ;-) – Josh Dec 11 '10 at 13:16
1	  
@Josh: Secure setuid shell scripts are possible, but only if the both the shell implementer and the script writer are very careful. Rather than native code, I recommend Perl, where the implementers have taken care that setuid scripts should be secure with little effort on the script writer's part. – Gilles Dec 11 '10 at 13:52
apparently the suidperl stuff has been deprecated and marked for removal for years (but persists non-the-less) – jmtd May 12 '11 at 14:32
are there any other languages that support setuid safely? – richard Jun 28 '11 at 9:35
Actually suidperl has been removed as of perl 5.11 (5.12 stable): perl5110delta: > "suidperl" has been removed. It used to provide a mechanism to emulate setuid permission bits on systems that don't support it properly. perl5120delta: > "suidperl" is no longer part of Perl. It used to provide a mechanism to emulate setuid permission bits on systems that don't support it properly. – Randy Stauner Jul 14 '11 at 17:40
show 1 more comment
feedback
up vote
3
down vote
If you want to avoid calling sudo some_script you can just do:

  #!/ust/bin/env sh

  sudo /usr/local/scripts/your_script
SETUID programs need to be designed with extream care as they run with root privilages and user have large control over them. They need to sane-check everything. You cannot do it with scripts because:

Shells are large piece of software with interacts heavily with user. It is nearly impossible to sane check everything - especially that most of the code is not suppose to run in such mode.
Scripts are mostly quick'n'dirty solution and usually are not prepared with such care that would allow setuid. Thay have many potentially dangerous features
They depend heavily on other programs. It is not sufficient that shell was checked. sed/awk etc. would need to be checked as well
Please note that sudo provide some sane-checking but it is not sufficient - check very line.

As a last note - consider using capabilities. They allow to give process a special privilages that would require normally root privilages. However for example while ping need to manipulate network it do not need to have access to files. I'm not sure however if they are inherited.

shareimprove this answer
answered Aug 17 '10 at 11:04

Maciej Piechotka
5,762925
feedback
up vote
2
down vote
I prefix a few scripts that are in this boat thus:

#!/bin/sh
[ "root" != "$USER" ] && exec sudo $0 "$@"
shareimprove this answer
answered Aug 18 '10 at 1:53

rcrowley
41735
feedback
up vote
1
down vote
One way of solving this problem is to call the shell script from a program that can use the setuid bit.
its something like sudo. For example, here is how you would accomplish this in a C program:

<!--
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    setuid( 0 );   // you can set it at run time also
    system( "/home/pubuntu/setuid-test2.sh" );
    return 0;
 }
-->

Save it as setuid-test2.c.
compile
Now do the setuid on this program binary:
su - nobody
[enter password]
chown nobody:nobody a.out
chmod 4755 a.out
Now, you should be able to run it, and you'll see your script being executed with nobody permissions.
But here also either you need to hardcode the script path or pass it as command line arg to above exe.
I hope this will help

shareimprove this answer
edited Aug 12 '10 at 5:32

answered Aug 12 '10 at 5:20

Hemant
1,731716
8	  
I would advise against the suggestion to allow passing of the script as a command line argument, as that essentially gives anyone who can execute the program the ability to run any script as that defined user. – dsp Aug 12 '10 at 8:05
I would add some sanity checking if you implement that C solution: ensure that the script being run is owned by the right user+group, is not world-writable, and not of the directories in its path are world- or group-writable (essentially the same checks that suPHP performs) - this will reduce the chance of your tool becoming a security problem through other users being able to somehow edit or replace the script. – David Spillett Aug 12 '10 at 16:14
I voted down for suggestion of passing as parameter. IT WOULD MEAN ANY SCRIPT CAN BE RUN WITH ROOT PRIVILAGES. YES - ONE CONTAINING rm -rf / AS WELL. – Maciej Piechotka Aug 17 '10 at 10:54
3	  
Note that THIS IS INSECURE even if the full path to the script is hardcoded. The shell will inherit variables from the environment, and many of them allow the invoker to inject arbitrary code. PATH and LD_LIBRARY_PATH are obvious vectors. Some shells execute $ENV or $BASHENV or ~/.zshenv even before they start executing the script proper, so you can't protect from these at all from within the script. The only safe way to invoke a shell script with privileges is to clean up the environment. Sudo knows how to do it safely. So do not write your own wrapper, use sudo. – Gilles Oct 8 '10 at 20:26
3	  
I feel bad that he's suddenly getting downvoted for this -- I did specifically say I wanted to hear insecure versions too, and I was imagining an executable that took a shell script argument when I said it. Obviously it's massively insecure, but I wanted to know what possibilities exist – Michael Mrozek♦ Oct 8 '10 at 22:58
show 3 more comments
feedback
up vote
0
down vote
You can create an alias for sudo + the name of the script. Of course, that is even more work to set up, since you then have to setup an alias, too, but it saves you from having to type sudo.

But if you don't mind horrible security risks, use a setuid shell as the interpreter for the shell script. Don't know whether that'll work for you, but I guess it might.

Let me state that I advise against actually doing this, though. I'm just mentioning it for educational purposes ;-)

shareimprove this answer
answered Aug 12 '10 at 6:38

wzzrd
1,789515
2	  
It will work. Horribly as you stated. SETUID bit allows execution with the owner right. Setuid shell (unless it was designed to work with setuid) will run as root for any user. I.e. anyone can run rm -rf / (and other commands from series DON'T DO IT AT HOME). – Maciej Piechotka Aug 17 '10 at 10:52
    
</entry>
<entry [Fri 2012:08:17 21:07:49 EST] INSTALLED 5.14.2 ON MASTER TO SOLVE: workflow.pl CALL FAILS WITH 'Insecure dependency in require'>

PROBLEM

ON MASTER (PERL 5.10.1) workflow.pl CALL FAILS WITH 'Insecure dependency in require while running setuid'

www-data@ip-10-123-6-230:~/cgi-bin/agua$ echo '{"username":"admin","sessionId":"1345239049.868.700","package":"agua","repository":"agua","version":"0.8.0-alpha.1+build11","privacy":"private","owner":"syoung","installdir":"/agua","mode":"upgrade","random":601275763267,"SHOWLOG":4}' | ./workflow.pl

Insecure dependency in require while running setuid at /agua/lib/Agua/Workflow.pm line 1.
BEGIN failed--compilation aborted at /agua/lib/Agua/Workflow.pm line 1.
Compilation failed in require at ./workflow.pl line 16.
BEGIN failed--compilation aborted at ./workflow.pl line 16.


GET PERL VERSION ON MASTER:

perl -v

This is perl, v5.10.1 (*) built for x86_64-linux-gnu-thread-multi


SOLUTION

UPGRADE PERL ON MASTER TO VERSION 5.14.2 

#### DOESN'T WORK:
#### sudo apt-get update && sudo apt-get install perl

mkdir /perl
cd /perl
wget https://launchpad.net/ubuntu/+archive/primary/+files/perl_5.14.2.orig.tar.bz2
cd perl-5.14.2
./Configure

    Where do you want to put the public architecture-dependent libraries? (~name ok)
    [/usr/lib/perl5/5.14.2/x86_64-linux-thread-multi]

    
    Some kernels have a bug that prevents setuid #! scripts from being
    secure.  Some sites have disabled setuid #! scripts because of this.
    
    First let's decide if your kernel supports secure setuid #! scripts.
    (If setuid #! scripts would be secure but have been disabled anyway,
    don't say that they are secure if asked.)
    
    If you are not sure if they are secure, I can check but I'll need a
    username and password different from the one you are using right now.
    If you don't have such a username or don't want me to test, simply
    enter 'none'.
    
    Other username to test security of setuid scripts with? [none] admin   
    "su" will (probably) prompt you for admin's password.
    I don't think setuid scripts are secure.
    Does your kernel have *secure* setuid scripts

    Other username to test security of setuid scripts with? [none] admin   
    "su" will (probably) prompt you for admin's password.
    I don't think setuid scripts are secure.
    Does your kernel have *secure* setuid scripts? [n] 
    Looking for a previously installed perl5.005 or later... 
    Using /usr/bin/perl.
    
    After perl5 is installed, you may wish to install various
    add-on modules and utilities.  Typically, these add-ons will
    be installed under /usr with the rest
    of this package.  However, you may wish to install such add-ons
    elsewhere under a different prefix.
    
    If you do not wish to put everything under a single prefix, that's
    ok.  You will be prompted for the individual locations; this siteprefix
    is only used to suggest the defaults.
    
    The default should be fine for most people.
    
    Installation prefix to use for add-on modules and utilities? (~name ok)
    [/usr] 

    ...
    
    The installation process will also create a directory for
    architecture-dependent site-specific extensions and modules.
    
    Pathname for the site-specific architecture-dependent library files? (~name ok)
    [/usr/lib/perl5/site_perl/5.14.2/x86_64-linux-thread-multi]

    
make
make test
make install

    OK

</entry>
<entry [Sat 2012:07:28 20:44:49 EST] PREVENT ERROR: 'sh: 0: getcwd() failed: No such file or directory'>

PROBLEM:

GET getcwd() ERROR WHEN CERTAIN SHELL cd COMMANDS ARE USED:

2012-07-29 01:25:49    [DEBUG]   	Test::Agua::Common::Util::setUpDirs	20	cd /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/outputs/testrepo; find . -type d -exec chmod 0755 {} \;; find . -type f -exec chmod 0644 {} \;;

HERE ----> sh: 0: getcwd() failed: No such file or directory

2012-07-29 01:25:49    [CALLER]   	Agua::Ops::Git::changeToRepo	21	caller: Test::Agua::Ops::Version::testIncrementVersion	53	
2012-07-29 01:25:49    [DEBUG]   	Agua::Ops::Git::changeToRepo	22	directory: /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/outputs/testrepo

2012-07-29 01:25:49    [DEBUG]   	Agua::Ops::runCommand	211	command: cd /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/outputs/testrepo; if [ -d /mnt/repos/private/syoung/aguatestdev/bin/Agua/Ops/Version/outputs/testrepo ]; then echo 1; else echo 0; fi

HERE ----> sh: 0: getcwd() failed: No such file or directory




SOLUTION:

RAN apt-get update BUT PROBLEM PERSISTED


</entry>
<entry [Wed 2012:07:11 21:23:00 EST] CONVERT DUMP TO JSON>

sub objectToJson {
	my ($self, $object) = @_;

	my $json = sprintf "%s", Dumper $object;
	$json =~ s/^\s*\$VAR1\s*=\s*//;
	$json =~ s/;\s\n*\s*$//ms;

	return $json;	
}

    
</entry>
<entry [Fri 2012:04:27 03:42:08 EST] CHECK .ebwt FILES USING Convert::Binary::C>

NB: NEED TO FIX THIS ERROR:

'bits/predefs.h' not found

BY LOADING libc INCLUDES FOR 32-BIT BUILDS:

sudo apt-get install libc6-dev-i386



my $c = new Convert::Binary::C ByteOrder => 'BigEndian';

#### Add include paths and global preprocessor defines
#  $c->Include('/usr/lib/gcc/i686-pc-linux-gnu/4.1.2/include',
$c->Include('/usr/lib/gcc/x86_64-linux-gnu/4.6/include',
            '/usr/include')
  ->Define(qw( __USE_POSIX __USE_ISOC99=1 ));

# Parse the 'time.h' header file
$c->parse_file('time.h');

#### See which files the object depends on
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
<entry [Tue 2012:01:17 13:05:14 EST] LOCALLY OVERRIDE A SUBROUTINE - Test::Agua::Configure>

OVERRODE SUBROUTINE getSshConfigfile 

	*getSshConfigfile = sub {
		return $inputfile;
	};

A MORE GENERALISED VERSION:


sub localize_and_call_fn_2
{
    my ($locals, $fn, @args) = @_;

    for my $sym (@$locals) {
        my $f = $fn;
        $fn = sub {
            local *$sym = sub { "changed" };
            $f->(@_);
        }
    }

    $fn->(@args);
}



NOTES
=====

http://www.perlmonks.org/?node_id=535859

The extent of the change is limited to the dynamic scope of the block in which the local-ized assignment is made. If I call print_a from outside of the block, its call to a will invoke the original "unchanged" definition:
print_a();      # prints "unchanged"
[download]
Let's say I want to do this kind of temporary overriding frequently. I can create a helper subroutine to make the process more convenient:
sub localize_a_and_call_fn(&@) {
    my ($fn, @args) = @_;
    local *a = sub { "changed" };
    $fn->(@args);
}
[download]
Now I can run any code I want within the scope where a is temporarily overridden:
localize_a_and_call_fn( \&print_a );
# prints "changed"

localize_a_and_call_fn {
    print "a() => ", a(), "\n";
};
# prints "a() => changed"  
[download]
That's great.
But let's say I want to take it one step further (which, in fact, I did). Let's say I want to write a more general helper that lets me temporarily override any given list of subroutines – say a, b, and c. My first attempt went like this:

sub localize_and_call_fn
{
    my ($locals, $fn, @args) = @_;
    local *$_ = sub { "changed" } for @$locals;
    $fn->(@args);
}
[download]
That seems simple enough. Unfortunately, the code does not work:
localize_and_call_fn( [qw(a b c)], \&print_a );
# prints "unchanged"
[download]
The problem seems to be the for modifier on the simple statement that attempts to localize the given subroutines. Even though perlsyn does not say so, it appears that the simple statement to which the modifier is attached is evaluated within an implicit block, at least as far as local is concerned. It's as if the statement had been written like this:
#     for (@$locals) {
#         local *$_ = sub { "changed" };
#     }
[download]
None of the local changes can escape the for loop, and thus by the time the helper subroutine invokes $fn->(@args), the original definitions of a, b, and c have been restored. The invoked subroutine will never see the changes.
I could not think of any way to use a simple loop to make local changes for a given list of symbols. By using nested anonymous subroutines, however, I was able to do it. (One could also use explicit recursion.) Here's the code I used:

sub localize_and_call_fn_2
{
    my ($locals, $fn, @args) = @_;

    for my $sym (@$locals) {
        my $f = $fn;
        $fn = sub {
            local *$sym = sub { "changed" };
            $f->(@_);
        }
    }

    $fn->(@args);
}

localize_and_call_fn_2( [qw(a b c)], \&print_a );
# prints "changed"
[download]
The for loop in the new helper function wraps anonymous subroutines around the seed of code given in $fn. Each of the wrappers overrides a single symbol's definition and then passes control the next wrapper. The last wrapper invokes the original seed of code.

    
</entry>
<entry [Sun 2011:12:18 17:16:50 EST] USE Test::Moose TO CHECK FOR ROLE USAGE>

use Test::More plan => 1;
use Test::Moose;

meta_ok($class_or_obj, "... Foo has a ->meta");
does_ok($class_or_obj, $role, "... Foo does the Baz role");
has_attribute_ok($class_or_obj, $attr_name, "... Foo has the 'bar' attribute");

    
</entry>
<entry [Tue 2011:11:29 14:30:21 EST] GET CALLING SUBROUTINE WITH 'caller 1'>
    

http://www.wdvl.com/Style/Languages/Perl/ProPerl/properl1-5.html


# get the name of the calling subroutine, if there was one
$callingsub = (caller 1)[3];
Or, more legibly:

($pkg, $file, $line, $callingsub) = caller 1;


</entry>
<entry [Thu 2011:11:10 12:59:12 EST] USE say TO AUTO NEWLINE IN PERL 5.10+>

Perl 6 has the say function that automatically appends \n.

You can also use say in Perl 5.10 or 5.12 if you add

use feature qw(say);
to the beginning of your program. Or you can use Modern::Perl to get this and other features.

See perldoc feature for more details.


    
</entry><entry [Thu 2011:11:10 12:49:58 EST] CAN'T OVERRIDE print FUNCTION>

BUT CAN OVERRIDE MOST OTHER CORE FUNCTIONS:

    BEGIN {
        *CORE::GLOBAL::hex = sub {
            # ... your code here
        };
    }


http://perldoc.perl.org/CORE.html#OVERRIDING-CORE-FUNCTIONS

OVERRIDING CORE FUNCTIONS

To override a Perl built-in routine with your own version, you need to import it at compile-time. This can be conveniently achieved with the subs pragma. This will affect only the package in which you've imported the said subroutine:
    use subs 'chdir';
    sub chdir { ... }
    chdir $somewhere;
To override a built-in globally (that is, in all namespaces), you need to import your function into the CORE::GLOBAL pseudo-namespace at compile time:
    BEGIN {
        *CORE::GLOBAL::hex = sub {
            # ... your code here
        };
    }
The new routine will be called whenever a built-in function is called without a qualifying package:
    print hex("0x50"),"\n";			# prints 1
In both cases, if you want access to the original, unaltered routine, use the CORE:: prefix:
    print CORE::hex("0x50"),"\n";		# prints 80



</entry>
<entry [Mon 2011:11:07 02:07:03 EST] USE Method::Signatures::Simple FOR 'method' IN ROLES>

THIS ALLOWS method SUBROUTINE INVOCATION AND WILL NOT ERROR OUT IF PASSED ARGUMENTS ARE NULL!!

ROLE CLASS:

package TestRole;
use Moose::Role;
use Method::Signatures::Simple;
use Data::Dumper;
method test ($string) {
    print "TestRole::test    string: $string\n" if defined $string;
    print "TestRole::test    string is not defined\n" if not defined $string;
}
1;



USING CLASS:

use MooseX::Declare;
class TestRoleUser with TestRole {
use Data::Dumper;

method test2 ($string) {
    print "TestRoleUser::test2    string: $string\n";
}
}


TEST SCRIPT:

#!/usr/bin/perl -w

use TestRoleUser;
use Data::Dumper;
my $object = TestRoleUser->new();
$object->test("IT WORKS");
$object->test();
$object->test2("IT WORKS TOO");


RUN SCRIPT:

./testRole.pl
TestRole::test    string: IT WORKS
TestRole::test    string is not defined
TestRoleUser::test2    string: IT WORKS TOO




    
</entry>
<entry [Mon 2011:10:10 00:12:27 EST] GETTING STDERR FROM BACKTICKS COMMAND ... AND HOW TO RUN COMMANDS WITHOUT THE SHELL>

http://www.perlmonks.org/?node_id=637765

my @output = `./script 2>&1 | cat`;

co-mingles the script's STDOUT and STDERR.



Re^2: capturing stderr of a command, invoked via backticks (2>&1)
by tye on Sep 08, 2007 at 04:38 UTC
Trivia:

The "| cat" part is superfluous. What's more, if you drop it, then you get a little-known feature of Perl to kick in and you have a solution that doesn't require support from the shell. Unfortunately, it isn't implemented in all builds of Perl. So you can avoid the shell when using a Unixy perl but still need the shell to handle "2>&1" for you in other environments (and so this doesn't work on Win98, if you can even find a copy).

If you give Perl a command that contains no shell meta characters, then Perl just splits the command on whitespace and execs the specified program itself, skipping the shell, as if you'd passed a list of parameters to exec. The little-known feature is that if you give a command that only contains two shell meta characters and those are the > and the & in 2>&1 and that is at the end of the command, then Perl strips that off the end, splits the rest up, does a quick dup2(1,2) (which makes STDERR a dup of STDOUT), and execs the specified program directly.

This is a feature of exec in Unixy perls. But Unixy perls implement system and qx by using this same exec code so the feature applies in this case as well.
    
</entry>
<entry [Wed 2011:06:08 17:41:17 EST] PERL SHELL>

.bash_profile ENTRY:

alias perlshell='~/notes/base/bin/util/perlshell.pl'

INSTALLED AT ~/notes/base/bin/util/perlshell.pl

    #!/usr/bin/perl -w
    
    use Devel::REPL;
    
    my $repl = Devel::REPL->new;
    $repl->load_plugin($_) for qw(History LexEnv);
    $repl->run

    
</entry>
<entry [Tue 2011:05:17 03:57:01 EST] MOOSE ALERTS METHOD NAME CONFLICT IN ROLES>

echo '{"project":"rnaSeq","view":"View2","username":"syoung","sessionId":"9999999999.9999.999","mode":"addView"}' | ./view.cgi

    Due to a method name conflict in roles 'Agua::Cluster::Checker' and 'Agua::Cluster::Loop', the method 'stringToArray' must be implemented or excluded by 'Agua::JBrowse' at /usr/local/lib/perl/5.10.1/Moose/Meta/Role/Application.pm line 51

    
</entry>

