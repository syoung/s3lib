#!/usr/bin/perl

use LWP::UserAgent;
use Net::OAuth;
$Net::OAuth::PROTOCOL_VERSION = Net::OAuth::PROTOCOL_VERSION_1_0;
use HTTP::Request::Common;
my $ua = LWP::UserAgent->new;

sub consumer_key { '96580e0b6f984bb8b64d' }
sub consumer_secret { 'a9fc1c5af531172dee286fa158cb03391be10ab7' }
sub request_url { 'http://github.com/login/oauth/request_token' }
sub access_url { 'http://github.com/login/oauth/access_token' }

my $request =
        Net::OAuth->request('consumer')->new(
          client_id => consumer_key(),
          client_secret => consumer_secret(),
          consumer_key => consumer_key(),
          consumer_secret => consumer_secret(),
          request_url => request_url(),
          request_method => 'POST',
          signature_method => 'HMAC-SHA1',
          timestamp => time,
          nonce => nonce(),
        );

$request->sign;

print $request->to_url."\n";
my $res = $ua->request(POST $request->to_url);
my $token;
my $token_secret;
if ($res->is_success) {
  my $response = Net::OAuth->response('request token')->from_post_body($res->content);
  $token=$response->token;
  $token_secret=$response->token_secret;
  print "Got Request Token ", $token, "\n";
  print "Got Request Token Secret ", $token_secret, "\n";
  print "Go to http://api06.dev.openstreetmap.org/oauth/authorize?oauth_token=".$token."\n";
} else {
  die "Something went wrong";
}

print "You have 60 seconds to authorize.  Go go go.\n";
sleep(60);

$request =
        Net::OAuth->request('access token')->new(
          consumer_key => consumer_key(),
          consumer_secret => consumer_secret(),
          token => $token,
          token_secret => $token_secret,
          request_url => access_url(),
          request_method => 'POST',
          signature_method => 'HMAC-SHA1',
          timestamp => time,
          nonce => nonce(),
        );

$request->sign;

print $request->to_url."\n";

$res = $ua->request(POST $request->to_url);
print $res->as_string;
if ($res->is_success) {
  my $response = Net::OAuth->response('access token')->from_post_body($res->content);
  print "Got Access Token ", $response->token, "\n";
  print "Got Access Token Secret ", $response->token_secret, "\n";
} else {
  die "Something went wrong";
}

sub nonce {
  my @a = ('A'..'Z', 'a'..'z', 0..9);
  my $nonce = '';
  for(0..31) {
    $nonce .= $a[rand(scalar(@a))];
  }

  $nonce;
}
