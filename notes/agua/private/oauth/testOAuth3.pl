#!/usr/bin/perl -w

use strict;


package Net::AppUsingGoogleOAuth;
use strict;
use base qw(Net::OAuth::Simple);

sub new {

    my $class  = shift;
    my %tokens = @_;
    return $class->SUPER::new(
        urls   => {
            #request_token_url => "https://www.google.com/accounts/OAuthGetRequestToken?scope=http://www-opensocial.googleusercontent.com/api/people",
            authorization_url => "https://github.com/login/oauth/authorize",
            access_token_url  => "https://github.com/login/oauth/access_token"
        },
    );
}

package main;
my $tokens = {
    client_id => '96580e0b6f984bb8b64d',
    consumer_key => '96580e0b6f984bb8b64d',
    client_secret => 'a9fc1c5af531172dee286fa158cb03391be10ab7',
    consumer_secret => 'a9fc1c5af531172dee286fa158cb03391be10ab7'
};

my $oauth = Net::AppUsingGoogleOAuth->new(%$tokens);

## Web application
#my $app->redirect( $oauth->get_authorization_url( callback => "http://you.example.com/oauth/callback") );

# Desktop application
print "Open the URL and come back once you're authenticated!\n",
my $access_token = $oauth->get_authorization_url;
print "access_token: $access_token\n";