#!/usr/bin/perl -w

use strict;

use LWP::UserAgent;
use HTTP::Request::Common;
use URI;
use Net::OAuth;
use Data::Dumper;

sub consumer_key { '96580e0b6f984bb8b64d' }
sub consumer_secret { 'a9fc1c5af531172dee286fa158cb03391be10ab7' }
sub username { 'syoung' }
sub url { 'http://github.com/login/oauth/authorize'; }

my $id              =   q{96580e0b6f984bb8b64d};
my $secret          =   q{a9fc1c5af531172dee286fa158cb03391be10ab7};
my $authorize_uri   =   q{https://github.com/login/oauth/authorize};
my $access_token_uri=   q{https://github.com/login/oauth/access_token};


my $oauth_request =
    Net::OAuth->request('consumer')->new(
    client_id       => $id,
    client_secret   => $secret,
    consumer_key    => $id,
    consumer_secret => $secret,
    request_url     => url(),
    request_method  => 'GET',
    signature_method=> 'HMAC-SHA1',
    timestamp       => time,
    nonce           => nonce()
    ,
    extra_params    => {
      'xoauth_requestor_id' => username() . '@' . consumer_key(),
    },
);

$oauth_request->sign;
print "oauth_request: \n";
print Dumper $oauth_request;

my $req = HTTP::Request->new(
    GET => url() . '?xoauth_requestor_id=' . username() . '@' . consumer_key()
);
$req->header('Content-type' => 'application/atom+xml');
$req->header('Authorization' => $oauth_request->to_authorization_header);

my $ua = LWP::UserAgent->new;
#$ua->requests_redirectable(1);
$ua->agent("Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:12.0) Gecko/20100101 Firefox/12.0");
push @{ $ua->requests_redirectable }, 'POST';
$ua->local_address("http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi");

print "ua:\n";
print Dumper $ua;

my $oauth_response = $ua->simple_request($req);

#### ENABLE REDIRECTS
while($oauth_response->is_redirect) {
  my $url = URI->new($oauth_response->header('Location'));
  $req->uri($url);

  my %query = $url->query_form;
  foreach my $param (keys %query) {
    $oauth_request->{extra_params}->{$param} = $query{$param};
  }

  $url->query(undef); # clear out the query parameters
  $oauth_request->{request_url} = $url;
  $oauth_request->sign; # resign
  $req->header('Authorization' => $oauth_request->to_authorization_header);

  $oauth_response = $ua->simple_request($req);
}

print $oauth_response->as_string;

sub nonce {
  my @a = ('A'..'Z', 'a'..'z', 0..9);
  my $nonce = '';
  for(0..31) {
    $nonce .= $a[rand(scalar(@a))];
  }

  $nonce;
}