#!/usr/bin/perl -w

#### DEBUG
my $DEBUG = 0;
#$DEBUG = 1;

=head2

	APPLICATION     filemanager.pl
	
	PURPOSE

		RESPOND TO CLIENT QUERIES:
			
			1. SAVE WORKFLOW JSON SENT BY CLIENT
		
    		2. RUN WORKFLOWS ON REQUEST
            
	USAGE
		
		./workflow.cgi <mode> <database> [additional_arguments]
		
    EXAMPLES

			THE Workflow OBJECT PERFORMS THE FOLLOWING TASKS:
			
				1. SAVE WORKFLOWS
                
                2. RUN WORKFLOWS
				
                3. PROVIDE WORKFLOW STATUS

        SEE Workflow.pm FOR EXAMPLES


echo '{"filepath":"$filepath","mode":"checkFile"}' | $file_manager

=cut

use strict;

#### FLUSH STDOUT
$| = 1;

print "filemanager.pl    filemanager.pl    $0 ++++++++++++++++++\n" if $DEBUG;

#### USE LIBS
use FindBin qw($Bin);
use lib "$Bin/lib";
use lib "$Bin/lib/external";

#### INTERNAL MODULES
use FileManager;

#### GET PUTDATA
my $input	= <STDIN>;

#my $mode =	$ARGV[0];
#my $filepath = $ARGV[1];

#my $input = $ARGV[0];
print "filemanager.pl    filemanager.pl    input: $input\n" if $DEBUG;

if ( not defined $input or not $input or $input =~ /^\s*$/ )
{
	print "{ error: 'filemanager.pl    input not defined' }";

	#### FLUSH
	$| = 1;
	exit;
}

#### GET JSONs
use JSON;
my $jsonParser = JSON->new();
my $json = $jsonParser->allow_nonref->jsonToObj($input);
print "Content-type: text/xml\n\nfilemanager.pl    json not defined\n" and exit if not defined $json;
print "filemanager.pl    filemanager.pl    json: $json\n" if $DEBUG;

#### GET MODE
my $mode = $json->{mode};
print "Content-type: text/xml\n\nfilemanager.pl    modenot defined\n" and exit if not defined $mode;
print "filemanager.pl    mode: $mode\n" if $DEBUG;

my $fileManager = FileManager->new(
	{
        'JSON'      =>  $json,
	}
);

#### RUN QUERY
no strict;
my $result = $fileManager->$mode();
use strict;
exit;
