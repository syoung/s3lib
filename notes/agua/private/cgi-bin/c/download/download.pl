#!/usr/bin/perl -w

=head2

	APPLICATION 	download
	
	PURPOSE
	
		1. VERIFY USE ACCESS TO FILES OR PROJECT DATABASE ENTRIES
		
		2. SEND DOWNLOAD DATA STREAM TO CLIENT

	USAGE

		./download.pl <QUERY_STRING>

	EXAMPLES

./download.pl "mode=downloadFile&username=admin&sessionId=9999999999.9999.999&filepath=/nethome/admin/agua/Project1/Workflow1/stdout/3-elandIndex.stdout"

=cut

use strict;

#### USE LIBS
use FindBin qw($Bin);
use lib "$Bin/lib";

#### INTERNAL MODULES
use Agua::JSON;
use Agua::Workflow;
use Agua::DBaseFactory;
use Util;

#### EXTERNAL MODULES
use DBI;
use DBD::SQLite;
use Data::Dumper;

#### CREATE CGI OBJECT TO BE PASSED TO Project.pm
#### FOR USE IN ITS cgiParam METHOD
my $input = $ARGV[0];
my $jsonConverter = Agua::JSON->new();
my $json = $jsonConverter->cgiToJson($input);
print "Content-type: text/xml\n\n{ error: 'download.pl    json not defined' }\n" and exit if not defined $json;
print "download.pl    json:\n";
print Dumper $json;

my $outfile = "/tmp/download.out";
open(OUT, ">$outfile") or die "Can't open outfile: $outfile\n";
print OUT "download.pl    input: $input\n";
close(OUT) or die "Can't close outfile: $outfile\n";
exit;

#### SET LOG
my $SHOWLOG     =   5;
my $PRINTLOG    =   5;
my $logfile     =   "/tmp/agua-download.$$.log";

#### GET CONF
use Conf::Agua;
my $conf = Conf::Agua->new(
	inputfile	=>	"$Bin/conf/default.conf",
	backup		=>	1,
    logfile     =>  $logfile,
    SHOWLOG     =>  2,
    PRINTLOG    =>  2
);

my $workflow = Agua::Workflow->new({
    conf		=>	$conf,
    json 		=>	$json,
    logfile     =>  $logfile,
    SHOWLOG     =>  $SHOWLOG,
    PRINTLOG    =>  $PRINTLOG
});

#### RUN QUERY
no strict;
my $result = $workflow->downloadFile();
use strict;

exit;



