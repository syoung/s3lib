#!/usr/bin/perl -w

use Test::More;
plan skip_all => 'Onworking StarCluster tests';

=head2

=head3 B<APPLICATION>     StarCluster.t
	
	PURPOSE

		DRIVE TESTS OF StarCluster.pm, WHICH PERFORMS THE FOLLOWING TASKS:

			1. MOUNT BY DEFAULT /agua, /data AND /nethome ON STARCLUSTER NODES
		
			2. CLUSTER SHUTS DOWN WHEN ALL WORKFLOWS ARE COMPLETED
			
			3. ALLOW AQUARIUS USERS TO RUN JOBS ON small, medium OR large CLUSTERS
			    (ALL USERS USE admin USER'S CONFIG FILE)
			
			4. ALL WORKFLOWS USE ONE CLUSTER, SPECIFIED BY admin USER
			
	USAGE
		
		./starcluster.pl <mode> [additional_arguments]

./StarCluster.t start \
--username admin \
--cluster smallcluster \
--privatekey /nethome/admin/.keypairs/private.pem \
--publiccert /nethome/admin/.keypairs/public.pem \
--keyname admin-key



#### TEST STARCLUSTER CONFIG

#$starcluster->removeConfig("globalised", "me", "DEFAULT_TEMPLATE", "mediumcluster", "MEDIUM CLUSTER IS DEFAULT");
#
#$starcluster->addConfig("globalised", "me", "DEFAULT_TEMPLATE", "mediumcluster", "MEDIUM CLUSTER IS DEFAULT");

#$starcluster->addConfig("global", "", "DEFAULT_TEMPLATE", "mediumcluster", "MEDIUM CLUSTER IS DEFAULT");

#$starcluster->addConfig("volume", "experiments", "VOLUME_ID", "vol-eeee0000");
#
#$starcluster->addConfig("volume", "experiments", "MOUNT_PATH", "/experiments");

#$starcluster->removeConfig("aws", "", "datavolume", "vol-XXXXXXXX");


#### TEST CONF

#my $value = $starcluster->getConfig("web", "", "HTMLURL");
#print "starcluster.pl    value: $value\n";

#my $value = $starcluster->getConfig("installation", "", "INSTALLDIR");
#print "starcluster.pl    value: $value\n";
#
#$starcluster->addConfig("installation", "", "INSTALLDIR", "/NEWagua");
#
#$value = $starcluster->getConfig("installation", "", "INSTALLDIR");
#print "starcluster.pl    value: $value\n";
#
#$starcluster->addConfig("web", "", "HTMLURL", "https://test.com");

#$starcluster->addConfig("globalised", "me", "DEFAULT_TEMPLATE", "mediumcluster", "MEDIUM CLUSTER IS DEFAULT");

#$starcluster->addConfig("global", "", "DEFAULT_TEMPLATE", "mediumcluster", "MEDIUM CLUSTER IS DEFAULT");

#$starcluster->addConfig("volume", "experiments", "VOLUME_ID", "vol-eeee0000");
#
#$starcluster->addConfig("volume", "experiments", "MOUNT_PATH", "/experiments");

#$starcluster->removeConfig("aws", "", "datavolume", "vol-XXXXXXXX");

=cut

use strict;

#### USE LIBS
use FindBin qw($Bin);
use lib "$Bin/../../../../lib/";

my $configfile = "$Bin/../../../../conf/default.conf";
use Conf::Agua;
my $conf = Conf::Agua->new(
	inputfile	=>	$configfile,
	backup		=>	1,
	separator	=>	"\t",
	spacer		=>	"\\s\+"
);

#### INTERNAL MODULES
use Agua::StarCluster;

my $starcluster = Agua::StarCluster->new(
	conf 		=>	$conf
);



#### GET MODE AND ARGUMENTS
my @arguments = @ARGV;
my $mode = shift @ARGV;

#### PRINT HELP
if ( $mode eq "-h" or $mode eq "--help" )	{	help();	}

#### FLUSH BUFFER
$| =1;

#### RUN QUERY
no strict;
eval { $starcluster->$mode() };
if ( $@ ){
	print "Error - mode '$mode' might not be supported\nDetailed error output:\n$@\n";
}



	
#	my $starcluster = "$installdir/bin/apps/cluster/starcluster.pl";
#	my $command = qq{$starcluster generateKeypair \\
#--privatekey $privatekey \\
#--publiccert $publiccert \\
#--keyname $keyname \\
#--username $username
#};
	#print "$command\n";
	#print `$command`;


#
#=head2
#
#	SUBROUTINE 		initialiseClusterConfig
#	
#	PURPOSE
#	
#		CREATE KEYPAIR FILE FROM PRIVATE KEY AND PUBLIC KEYS
#		
#		AND TRANSFER TO CLUSTER USING Conf::StarCluster
#	
#=cut
#
#sub initialiseClusterConfig {
#	my $self	=	shift;
#
#	#### PASSED VARIABLES
#	my $conf 			= 	$self->get_conf();
#	my $username 		=	$self->get_username();		
#	my $amazonuserid 	=	$self->get_amazonuserid();
#	my $accesskeyid 	=	$self->get_awsaccesskeyid();
#	my $secretaccesskey =	$self->get_secretaccesskey();
#	my $keyname			=	$self->get_keyname();
#	
#	#### SET DEFAULT keyname
#	$keyname = "$username-key" if not defined $keyname;
#
#	my $userdir 		= 	$conf->getKey('agua', "USERDIR");
#	my $filedir			=	"$userdir/$username/.keypairs";
#	my $privatekey		=	"$filedir/private.pem";
#	my $publiccert		=	"$filedir/public.pem";
#	
#print "Agua::Init::initialiseClusterConfig    privatekey: $privatekey\n" if defined $privatekey;
#print "Agua::Init::initialiseClusterConfig    publiccert: $publiccert\n" if defined $publiccert;
#print "Agua::Init::initialiseClusterConfig    username: $username\n" if defined $username;
#print "Agua::Init::initialiseClusterConfig    amazonuserid: $amazonuserid\n" if defined $amazonuserid;
#print "Agua::Init::initialiseClusterConfig    accesskeyid: $accesskeyid\n" if defined $accesskeyid;
#print "Agua::Init::initialiseClusterConfig    secretaccesskey: $secretaccesskey\n" if defined $secretaccesskey;
#print "Agua::Init::initialiseClusterConfig    keyname: $keyname\n" if defined $keyname;
#
#	#### SET FILES
#	my $installdir 		= 	$conf->getKey('agua', "INSTALLDIR");
#	
#	#### RUN starcluster.pl TO GENERATE CONFIG FILE IN .starcluster DIR
#	my $starcluster = "$installdir/bin/apps/cluster/starcluster.pl";
#	my $command = qq{$starcluster writeConfigfile \\
#--privatekey $privatekey \\
#--publiccert $publiccert \\
#--amazonuserid $amazonuserid \\
#--accesskeyid $accesskeyid \\
#--secretaccesskey $secretaccesskey \\
#--keyname $keyname \\
#--username $username
#};
#	print "$command\n";
#	print `$command`;
#}
#

