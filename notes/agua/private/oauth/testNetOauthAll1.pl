#!/usr/bin/perl -w

use strict;

=head2

https://github.com/likhatskiy/Net-OAuth-All



=cut

use Net::OAuth::All;
use HTTP::Request::Common;
use LWP::UserAgent;

my $ua = LWP::UserAgent->new;
my $res;
my $conf;
my $oauth;

# OAuth 1.0 and 1.0A
$conf = {
    consumer_key      => '96580e0b6f984bb8b64d',
    consumer_secret   => 'a9fc1c5af531172dee286fa158cb03391be10ab7',
    signature_method  => 'HMAC-SHA1',
    
    request_token_url => 'https://github.com/login/oauth/request_token', # enter your own
    authorization_url => 'https://github.com/login/oauth/authorize', # enter your own
    access_token_url  => 'https://github.com/login/oauth/access_token', # enter your own
};
$oauth = Net::OAuth::All->new(%$conf);

# Consumer Get request token

$res = $ua->get($oauth->request('request_token')->to_url);

my $request_token;
my $request_token_secret;
if ($res->is_success) {
    $oauth->response->from_post_body($res->content);
    
    $request_token        = $oauth->token;
    $request_token_secret = $oauth->token_secret;
} else {
    die "Something went wrong";
}

# Consumer Get authorization URL for redirect to provider

$oauth->request('authorization')->to_url;

# Consumer Get access token

my $oauth_verifier = 'from provider'; #from GET params after callback

$oauth = Net::OAuth::All->new(
    %$conf,
    (
        'token'        => $request_token,
        'token_secret' => $request_token_secret,
        'verifier'     => $oauth_verifier, # for OAuth 1.0A
    )
);

$res = $ua->post(
    $oauth->via('POST')->request('access_token')->url,
    'Content-Type'  => 'application/x-www-form-urlencoded',
    'Authorization' => $oauth->to_header,
);

my $access_token;
my $access_token_secret;
if ($res->is_success) {
    $oauth->response->from_post_body($res->content);
    
    $access_token        = $oauth->token;
    $access_token_secret = $oauth->token_secret;
} else {
    die "Something went wrong";
}

# Make protected request to API

$oauth = Net::OAuth::All->new(
    %$conf,
    (
        'token'        => $access_token,
        'token_secret' => $access_token_secret,
    )
);

$oauth
    ->via('POST')
    ->protected_resource_url('http://provider-api.com/v2/feed/me')
    ->clean_extra
    ->put_extra(
        'alt' => 'json'
    )
    ->request('protected_resource');

$res = $ua->post(
    $oauth->url,
    
    'Content-Type'  => 'application/x-www-form-urlencoded',
    'Authorization' => $oauth->to_header,
    
    'Content' => $oauth->to_post_body,
);

# if you need to post JSON, for example Google Buzz update activity

# at this moment we change request method to POST and put extra params
# but we need to change URL
# after change data we SHOULD signing

$oauth
    ->protected_resource_url('https://www.googleapis.com/buzz/v1/activities/@me/@self')
    ->sign;

$res = $ua->post(
    $oauth->to_url(1),# put extra params to URL
    
    'Content-Type'  => 'application/json',
    'Authorization' => $oauth->to_header,
    
    'Content' => q({"data": {"object": {"type": "note", "content": "I`m in Google BUZZ"}}}),
);
