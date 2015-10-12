#!/usr/bin/perl -w

=head2

	APPLICATION 	init.pl
	
	PURPOSE
	
		EXECUTE INITIALISATION TASKS FOR AGUA:
		
			LOAD USER DATA INTO AGUA DATABASE
			
			PRINT X.509 KEY FILES FOR HTTPS AND AWS
			
			MOUNT AGUA DATA VOLUMES
			
			MOUNT USER VOLUMES	
			
=cut

use strict;

#### DISABLE BUFFERING OF STDOUT
$| = 1;

#### DEBUG HEADER
print "Content-type: text/html\n\n";

use CGI::Carp qw(fatalsToBrowser);

#### SET LOG
my $SHOWLOG     =   2;
my $PRINTLOG    =   5;
my $logfile     = "$Bin/log/agua-init.log";

#### GET CONF
use FindBin qw($Bin);
use lib "$Bin/lib/";
use Conf::Agua;
my $conf = Conf::Agua->new(
	inputfile	=>	"$Bin/conf/default.conf",
	backup		=>	1,
    logfile     =>  $logfile,
    SHOWLOG     =>  2,
    PRINTLOG    =>  4
);

#### PRINT TO HTML FILE
my $htmldir = $conf->getKey('agua', 'HTMLDIR');
my $urlprefix = $conf->getKey('agua', 'URLPREFIX');

#### USE LIBS
use lib "lib";

#### INTERNAL MODULES
use Agua::Init;
use Util;

#### EXTERNAL MODULES
use Data::Dumper;

#### GET INPUT
my $input = $ARGV[0];
print "No JSON input<br>Exiting<br>\n" and exit if not defined $input or not $input;
$input =~ s/\s+$//;
#print "init.pl     input: $input\n" if $DEBUG;

#### CONVERT JSON TEXT TO OBJECT
use JSON;
my $jsonParser = JSON->new();
my $json = $jsonParser->allow_nonref->decode($input);

#### ADD CONF TO JSON OBJECT
$json->{data}->{conf} = $conf;

#### CREATE INIT OBJECT
my $aws = Agua::Init->new($json->{data});

#### PRINT KEY FILE
$aws->printKeyfiles();

#### GET ELASTIC IP
my $address = $aws->getIp();

#### PRINT REDIRECT WINDOW
my $filename = "initlog.html";
my $url = "http://$address/$urlprefix/$filename";
my $htmlfile = "$htmldir/$filename";
my $datetime = `date`;
print qq{<input type="button" onClick="window.open('$url', '_blank', 'toolbar=1,location=0,directories=0,status=0,menubar=1,scrollbars=1,resizable=1,navigation=0')" value="Click to view Progress Log"><br>};

open(STDOUT, ">$htmlfile") or die "Can't open htmlfile: $htmlfile\n" if defined $htmlfile;

print qq{<html>
<head>
	<title>Init Progress Log</title>
</head>
<style type="text/css">
	body {
		font-size: 15px;
        font-family: Verdana;
	}
    .message {
        font-size: 30px;
        text-align: center;
        font-weight: bold;
    }
    .address, .url {
        font-size: 36px;
        margin: 4px;
        border: 1px solid black;
        text-align: center;
    }
    .url {
        color: #88F;
    }
    .url:visited {
        color: #F8F;
    }
</style>
<script>
var waitSeconds = 10;
function beginrefresh(){
	if (waitSeconds==1) {
		window.location.reload()
	}
	else { 
		waitSeconds-=1
		document.getElementById('cursec').innerHTML = waitSeconds + " seconds left until page refresh!"
	}
	setTimeout("beginrefresh()",1000)
}
window.onload=beginrefresh
</script>
<body>
<center>
<h3> Agua Init Log</h3>
<div class="message"> Please make a note of your fixed IP address:</div>
<div class="address">$address</div>
<div class="message"> The URL for this instance of Agua is:</div>
<div class="url" onclick="window.open('http://$address/$urlprefix/agua.html')">http://$address/$urlprefix/agua.html</div>
$datetime<br>
<div id="cursec"></div> 
</center>
<hr>
};

print "<PRE>\n";
print "user: ";
print `whoami`;


#### EXECUTE INITIALISATION
$aws->init();

