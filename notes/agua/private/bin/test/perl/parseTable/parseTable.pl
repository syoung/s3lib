#!/usr/bin/perl -w

# NAME: parseTable

# FUNCTION: Parse text copy of Instances table in Horizon openstack UI

use Data::Dumper;

my $inputfile	=	$ARGV[0];
print "inputfile: $inputfile\n";
my $outputfile	=	$ARGV[1];
print "outputfile: $outputfile\n";

open(FILE, "<", $inputfile) or die "Can't open inputfile: $inputfile\n";
$/ = "Edit Instance";
my @records	=	<FILE>;
close(FILE) or die "Can't close inputfile: $inputfile\n";

#### GET HEADERS
my $headers	=	getHeaders(\@records);

#### CLEAN HEADERS LINE
cleanHeaders(\@records);

#### PARSE ENTRIES
my $entries	=	parseEntries(\@records);

#### PRINT ENTRIES
open(OUT, ">", $outputfile) or die "Can't open outputfile: $outputfile\n";
print OUT "Project Name	Host	Instance Name	IP Address	Type	RAM	VCPU	Disk	Status	Task	Power	State	Actions\n";
foreach my $entry ( @$entries ) {
	print OUT join "\t", @$entry;
	print OUT "\n";
}
close(OUT) or die "Can't close outputfile: $outputfile\n";
print "Completed $0\n";

sub parseEntries {
#### HEADERS:
#	Project Name
#	Host
#	Instance Name
#	IP Address
#	Size
#		type
#		RAM
#		VCPU
#		GB
#	Status
#	Task
#	Power
#	State
#	Actions
#
#### FORMAT:
####
#### annai_troubleshooting	fuel-03	
#### gtrepo
#### 10.1.43.22
#### repo.gtexec | 32GB RAM | 16 VCPU | 100GB Disk	Active	None	Running

	my $records		=	shift;
	
	foreach my $record ( @$records ) {
		next if $record =~ /^\s*$/;
		$record =~ s/^\s*//;
		$record =~ s/\s*$//;
		
		my @lines = split "\n", $record;
		my $elements	=	[];
		#print "lines[0]: $lines[0]\n";
		my ($project, $host)	=	$lines[0]=~ /(\S+)\s+(\S+)/;
		#print "project: $project\n";
		#print "host: $host\n";
		push @$elements, $project;
		push @$elements, $host;
		splice @lines, 0, 1;
		
		#print "lines[0]: $lines[0]\n";
		my ($instance)	= $lines[0] =~ /^\s*(\S+)/;
		#print "instance: $instance\n";
		push @$elements, $instance;
		splice @lines, 0, 1;
		
		my $ips = "";
		while ( $lines[0] =~ /^\d+\.\d+\.\d+\.\d+/ ) {
			my ($ip)	= $lines[0] =~ /^\s*(\S+)/;
			#print "ip: $ip\n";
			$ips .= "$ip,";
			splice @lines, 0, 1;
		}
		$ips =~ s/,$//;
		push @$elements, $ips;
		#print "lines: @lines\n";
		
		my @array = split "\t", $lines[0];

		#### repo.gtexec | 32GB RAM | 16 VCPU | 100GB Disk	Active	None	Running
		my ($type, $ram, $vcpu, $disk)
			=	$array[0]
			=~ /^\s*(\S+)\s*\|\s*(\S+)GB RAM\s*\|\s*(\d+) VCPU\s*\|\s*(\S+)GB Disk/;
		$type = "" if not $type;
		$ram = "" if not $ram;
		$vcpu = "" if not $vcpu;
		$disk = "" if not $disk;
		push @$elements, $type;
		push @$elements, $ram;
		push @$elements, $vcpu;
		push @$elements, $disk;

		#### REMOVE SIZE ENTRY FROM ARRAY
		shift @array;
		
		#### PUSH REST OF ARRAY TO elements
		(@$elements)	=	( @$elements, @array );
		
		#### PUSH elements TO entries
		push @$entries, $elements if scalar(@$elements);
	}

	return $entries;
}

sub getHeaders {
	my $records		=	shift;
	my ($headerstring) = $$records[0] =~ /^#\s*([^\n]+)/;
	my $headers;
	@$headers = split "\t", $headerstring;

	return $headers	
}

sub cleanHeaders {
	my $records		=	shift;

	$$records[0]	=~ s/^#([^\n]+)//;

	return $records;
}