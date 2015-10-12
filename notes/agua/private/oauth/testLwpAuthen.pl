#!/usr/bin/perl -w

use strict;
use LWP::Authen::OAuth;

# Google uses 'anonymous' for unregistered Web/offline applications or the
# domain name for registered Web applications
my $ua = LWP::Authen::OAuth->new(
    oauth_consumer_secret => "anonymous",
);

# request a 'request' token
my $r = $ua->post( "https://www.google.com/accounts/OAuthGetRequestToken",
        [
                oauth_consumer_key => 'anonymous',
                oauth_callback => 'http://example.net/oauth',
                xoauth_displayname => 'Example Application',
                scope => 'https://docs.google.com/feeds/',
        ]
);
die $r->as_string if $r->is_error;

# update the token secret from the HTTP response
$ua->oauth_update_from_response( $r );

# open a browser for the user 

# data are returned as form-encoded
my $uri = URI->new( 'http:' );
$uri->query( $r->content );
my %oauth_data = $uri->query_form;

# Direct the user to here to grant you access:
# https://www.google.com/accounts/OAuthAuthorizeToken?
#       oauth_token=$oauth_data{oauth_token}\n";

# turn the 'request' token into an 'access' token with the verifier
# returned by google
$r = $ua->post( "https://www.google.com/accounts/OAuthGetAccessToken", [
        oauth_consumer_key => 'anonymous',
        oauth_token => $oauth_data{oauth_token},
        oauth_verifier => $oauth_verifier,
]);

# update the token secret from the HTTP response
$ua->oauth_update_from_response( $r );

# now use the $ua to perform whatever actions you want