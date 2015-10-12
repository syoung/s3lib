#!/usr/bin/perl -w

=head2

Using 2-Legged OAuth with Google Apps in Perl

http://blog.case.edu/jeremy.smith/2009/03/30/using_2legged_oauth_with_google_apps_in_perl

=cut

use strict;  
#use lib 'extra_mods';  
#use lib 'extra_mods/5.8';  
use JSON;  
use Net::OAuth;
use LWP;
#use LWP::UserAgent;
use Data::Dumper;  
  
$NetNet::OAuth::PROTOCOL_VERSION = Net::OAuth::PROTOCOL_VERSION_1_0A;  
  
my $expected_result_format = 'xml'; #xml or json  
  
  
my %args;  
$args{q} = "Yahoo!"; # This is the query we are searching for  
$args{format} = $expected_result_format;   
$args{count} = 1; # number of results to be returned  
  
my $buckets = "web"; # news,web,images (various BOSS services)  
  
print get_response(\%args,$buckets);  
  
sub get_response {  
    my %args = %{(shift)};  
    my $buckets = shift;  
  
    my $ua = LWP::UserAgent->new;  
  
    # PROVIDE YOUR KEY HERE  
    my $cc_key = "";  
  
    # PROVIDE YOUR SECRET HERE  
    my $cc_secret = "";  

my $id              =   q{96580e0b6f984bb8b64d};
my $secret          =   q{a9fc1c5af531172dee286fa158cb03391be10ab7};
my $authorize_uri   =   q{https://github.com/login/oauth/authorize};
my $access_token_uri=   q{https://github.com/login/oauth/access_token};

  
    # Source Url  
    my $url = "http://yboss.yahooapis.com/ysearch/$buckets";  
  
    # Create request  
    my $request = Net::OAuth->request("request token")->new(  
            consumer_key => $cc_key,    
            consumer_secret => $cc_secret,   
            request_url => $url,   
            request_method => 'GET',   
            signature_method => 'HMAC-SHA1',  
            timestamp => time,   
            nonce => 'hsu94j3884jdopsl',  
            callback => 'http://printer.example.com/request_token_ready',  
            extra_params => \%args   
            );  
  
    # Sign request          
    $request->sign;  
  
    # Get message to the Service Provider  
    my $res = $ua->get($request->to_url);   
  
    # If request is success, display content  
        if ($res->is_success) {  
            return $res->content;  
        }  
        else {  
        # Print error and die  
                        Dumper $res;  
            die "Something went wrong";  
        }  
}  