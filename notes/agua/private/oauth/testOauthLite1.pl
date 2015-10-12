#!/usr/bin/perl -w

use strict;
use OAuth::Lite2::Client::WebServer;
use OAuth::Lite2::Server::Endpoint::Token;
use OAuth::Lite2::Server::DataHandler;
use OAuth::Lite2::Server::GrantHandler;
use OAuth::Lite2::Agent::Dump;

use FindBin qw($Bin);
use lib "$Bin/lib";
use GitHubHandler;

use Data::Dumper;
#OAuth::Lite2::Client::WebServer - OAuth 2.0 Web Server Profile Client
#
#SYNOPSIS 

my $id              =   q{96580e0b6f984bb8b64d};
my $secret          =   q{a9fc1c5af531172dee286fa158cb03391be10ab7};
my $authorize_uri   =   q{https://api.github.com/login/oauth/authorize};
my $access_token_uri=   q{https://api.github.com/login/oauth/access_token};
my $client  = OAuth::Lite2::Client::WebServer->new(
    id               => $id,
    secret           => $secret,
    authorize_uri    => $authorize_uri,
    access_token_uri => $access_token_uri
    #,
    #agent => OAuth::Lite2::Agent::Dump->new()
);
#print "client:\n";
#print Dumper $client;

my $datahandler = GitHubHandler->new();
$datahandler->add_client(id => $id, secret => $secret);


my $app = OAuth::Lite2::Server::GrantHandler->new();
start_authorize($app);

####my $uri = $client->uri_to_redirect();
####print "uri: $uri\n";

#my $access_token = $client->get_access_token();
#print "access_token: $access_token\n";


#my $app = OAuth::Lite2::Server::Endpoint::Token->new(
#    data_handler => "TestDataHandler",
#);
#start_authorize($app);
#

# redirect user to authorize page.
sub start_authorize {
    my $your_app = shift;
    my $redirect_url = $client->uri_to_redirect(
        redirect_uri => q{http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi},
        scope        => q{photo},
        state        => q{optional_state},
    );

    print "redirect_url: $redirect_url\n";

    $your_app->res->redirect( $redirect_url );
}

# this method corresponds to the url 'http://yourapp/callback'
sub callback {
    my $your_app = shift;

    my $code = $your_app->request->param("code");

    my $access_token = $client->get_access_token(
        code         => $code,
        redirect_uri => q{http://yourapp/callback},
    ) or return $your_app->error( $client->errstr );

    $your_app->store->save( access_token  => $access_token->access_token  );
    $your_app->store->save( expires_at    => time() + $access_token->expires_in    );
    $your_app->store->save( refresh_token => $access_token->refresh_token );
}

sub refresh_access_token {
    my $your_app = shift;
    my $refresh_token   =   shift;

    my $access_token = $client->refresh_access_token(
        refresh_token => $refresh_token,
    ) or return $your_app->error( $client->errstr );

    $your_app->store->save( access_token  => $access_token->access_token  );
    $your_app->store->save( expires_at    => time() + $access_token->expires_in    );
    $your_app->store->save( refresh_token => $access_token->refresh_token );
}


sub access_to_protected_resource {
    my $your_app = shift;

    my $access_token  = $your_app->store->get("access_token");
    my $expires_at    = $your_app->store->get("expires_at");
    my $refresh_token = $your_app->store->get("refresh_token");

    unless ($access_token) {
        $your_app->start_authorize();
        return;
    }

    if ($expires_at < time()) {
        $your_app->refresh_access_token();
        return;
    }

    my $req = HTTP::Request->new( GET => q{http://example.org/photo} );
    $req->header( Authorization => sprintf(q{OAuth %s}, $access_token) );
    my $agent = LWP::UserAgent->new;
    my $res = $agent->request($req);

}