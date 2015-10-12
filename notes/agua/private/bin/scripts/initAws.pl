#!/usr/bin/perl -w

#### DEBUG
my $DEBUG = 0;
$DEBUG = 1;

=head2

	APPLICATION 	initAws.pl
	
	PURPOSE
	
		EXECUTE INITIALISATION TASKS FOR AGUA:
		
			0. PARSE USERDATA KEYS PASSED TO INSTANCE USING AWS CONSOLE
		
			1. PRINT X.509 KEY FILES FOR HTTPS AND AWS
			
			2. MOUNT AGUA DATA VOLUME
			
			3. MOUNT USER VOLUMES	
		
			4. LOAD USER DATA INTO AGUA DATABASE
			
	USAGE

		./initAws.pl

=cut

use strict;

#### USE LIBS
use FindBin qw($Bin);
use lib "$Bin/../../lib";
use lib "$Bin/../../lib/external";

#### INTERNAL MODULES
use Admin::AWS;
use DBaseFactory;
use Util;
use Conf::Agua;

#### EXTERNAL MODULES
use Data::Dumper;

my $userdata = `curl http://169.254.169.254/1.0/user-data`;
my $data;
my @array = split "&", $userdata;
foreach my $datapair ( @array )
{
	$datapair =~ /^(.+?)=(.+)$/;
	$data->{$1} = $2;
}
#print "initAws.pl    data:\n";
#print Dumper $data;

#### GET DATABASE INFO
my $configfile = "default.conf";
if ( $^O =~ /^MSWin32$/ )
{
    $configfile = "default-win32.conf";
}
my $conf = Conf::Agua->new(inputfile=>"$Bin/../../conf/$configfile", 0);
my $dbtype = $conf->getKey("database", 'DBTYPE');
my $database = $conf->getKey("database", 'DATABASE');
my $user = $conf->getKey("database", 'USER');
my $password = $conf->getKey("database", 'PASSWORD');
print "initAws.pl    dbtype: $dbtype\n" if $DEBUG;
print "initAws.pl    usermysql: $user\n" if $DEBUG;
print "initAws.pl    password: $password\n" if $DEBUG;
print "initAws.pl    database: $database\n" if $DEBUG;

#### CREATE DB OBJECT USING DBASE FACTORY
my $dbobject;
if ( $dbtype eq "SQLite" )
{
	print "initAws.pl    Creating SQLite dbobject\n" if $DEBUG;
	my $dbfile = $conf->getKey("database", 'DBFILE');
	print "initAws.pl    dbfile: $dbfile\n" if $DEBUG;
	$dbobject = DBaseFactory->new( "SQLite", { 'DBFILE' => "$dbfile" } );
}
elsif ( $dbtype eq "MySQL" )
{
	print "initAws.pl    Creating MySQL dbobject\n" if $DEBUG;
	#### CREATE DB OBJECT USING DBASE FACTORY
	$dbobject = DBaseFactory->new( 'MySQL',
		{
			'DATABASE'	=>	$database,
			'USER'      =>  $user,
			'PASSWORD'  =>  $password
		}
	) or die "initAws.pl    Can't create database object for database: $database. $!\n";
}
print "Created $conf->getKey("database", 'DBTYPE') dbobject\n" if $DEBUG;


#### CREATE ADMIN OBJECT
my $aws = Admin::AWS->new(
    {
        'DBOBJECT'	=>	$dbobject,
		'CONF'		=>	$conf,
		'USERNAME'	=> 	"admin",
        'USERDATA' 	=>	$data
    }
);
print "Created Admin::AWS object: $aws\n" if $DEBUG;

#### EXECUTE INITIALISATION TASKS FOR AGUA:
####

####    0. START HTTPD SERVER
print "initAws.pl    Doing startHttpd()\n";
$aws->startHttpd();

####	1. PRINT X.509 KEY FILES FOR HTTPS AND AWS
####	
print "initAws.pl    Doing printKeyfiles()\n";
$aws->printKeyfiles();

#### 	2. SET ENVIRONMENT VARIABLES
print "initAws.pl    Doing setEnvironment()\n";
$aws->setEnvironment();

####	3. MOUNT AGUA DATA VOLUMES
####
print "initAws.pl    Doing mountAguaData()\n";
$aws->mountAguaData();

####	4. MOUNT /nethome USER DATA 
####	
print "initAws.pl    Doing mountNethome()\n";
$aws->mountNethome();

#### 	5. MOUNT MYSQL AND START
print "initAws.pl    Doing mountMysql()\n";
$aws->mountMysql();

exit;


####	6. MOUNT USER VOLUMES	
####	
$aws->mountUserVolumes();

exit;

####################################################################
#####################           SUBROUTINES      ###################
####################################################################

#### LATER:
sub checksafe
{
    my $string          =   shift;
    my $safe_characters =   shift;
    
    if ( $string =~ /^([$safe_characters]+)$/ ) 
    { 
    	$string = $1; 
    }
    
    return $string;
}

