#!/usr/bin/perl -w

use strict;

=head2

http://developer.linkedin.com/thread/3007

After spending a ridiculous amount of time trying to post a status update to LinkedIn using perl, I have attached a working version which will hopefully be of some use and save a few headaches.It assumes you already have the relevant tokens, which I found were easy to acquire thanks to the WWW::LinkedIn module. Unfortunately I was unsuccessful in getting that module to work for posting XML content to LinkedIn for e.g. status updates. Nor did I manage to get Net::OAuth::Simple to work as it would have required a few modifications which I did not want to do.The problem I had with both of the above modules was not being able to add the XML content to the message, something which I'm sure they are capable of, but I was unable to work out how.

So this example, based on the "_make_request" method in the Net::OAuth::Simple module, uses the raw Net::OAuth and HTTP::Request libraries to construct the messages and include the XML update message

Be sure to add all of your tokens to the relevant variables below, naturally.

=cut 
use lib qw(lib);
use XML::Simple;
use Data::Dumper;
use Net::OAuth;
use HTTP::Request::Common;
use LWP::UserAgent;
use URI;
use HTTP::Request::Common ();
$Net::OAuth::PROTOCOL_VERSION = Net::OAuth::PROTOCOL_VERSION_1_0A;
my $ua = LWP::UserAgent->new(
    requests_redirectable   =>  ['GET', 'HEAD', 'POST']
);

my ($method, $url, $msg, $xml);


### POST a status update ###
$method = "GET";
$url = 'https://github.com/login/oauth/authorize';
$msg = "Test message posted " . gmtime();

$xml = <<XML;
<?xml version="1.0" encoding="utf-8"?> <share>  <comment>    $msg  </comment>  <visibility>    <code>anyone</code>  </visibility></share>
XML
 
#### GET user profile ####
#$method = 'GET';
#$url = 'https://api.linkedin.com/v1/people/~';

### remove and store any parameters from URL ###
my $uri = URI->new($url);
print "uri: $uri\n";
my %query = $uri->query_form;
$uri->query_form({});

### set up OAuth request ###
my $request = Net::OAuth->request('ProtectedResource')->new(
    redirect_uri	=> "http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/oauth2.cgi",
    client_id => '96580e0b6f984bb8b64d',
    consumer_key => '96580e0b6f984bb8b64d',
    client_secret => 'a9fc1c5af531172dee286fa158cb03391be10ab7',
    consumer_secret => 'a9fc1c5af531172dee286fa158cb03391be10ab7',
    token => '',
    token_secret => '',
    request_url => $uri,
    request_method => $method,
    signature_method => 'HMAC-SHA1',
    timestamp => time,
    nonce => int( rand( 2**32 ) ),
    extra_params => \%query
);

$request->sign;

die ("COULDN'T VERIFY! Check OAuth parameters.") unless $request->verify;

my @args = ( );
my $body = undef;
my $req_url = $url;
my $params = $request->to_hash;
if ('GET' eq $method || 'PUT' eq $method) 
{
    print "Doing GET or PUT\n";
    $req_url = URI->new($url);
    print "req_url: $req_url\n";
    $req_url->query_form(%$params);
}
 else 
{
    ### the following line is needed for POST requests          ###
    ### it seems that LinkedIn does not require it for GETs     ###
    ### indeed it positively rejects it with "Unauthorized"!??! ###
    $ua->default_header('Authorization' => $request->to_authorization_header);
    @args    = ( HTTP::Headers->new(%$params) );
    $body = $xml;
}

print "params:\n";
print Dumper $params;

my $req = HTTP::Request->new( $method, $req_url, @args, $body );

#$req->{_uri} = URI::https->new({
#    redirect_uri	=> "http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/oauth2.cgi",
#    client_id => '96580e0b6f984bb8b64d',
#    client_secret => 'a9fc1c5af531172dee286fa158cb03391be10ab7',
#    request_url => $uri,
#    request_method => $method,
#    signature_method => 'HMAC-SHA1',
#    timestamp => time,
#    nonce => int( rand( 2**32 ) ),
#    extra_params => \%query
#});
#
print "req:\n";
print Dumper $req;

exit;


my $res = $ua->request($req);
# Send message
if ($res->is_success) 
{
    print "SUCCESS!!!\n";
    print $res->message, "\n";
    print $res->content, "\n";
}
 else 
{
    print "FAILED!!!";
    print "REQUEST:\n";
    print Dumper($req);
    print "USER AGENT:\n";
    print Dumper($ua);
    print "RESPONSE:\n";
    print Dumper($res);
}
