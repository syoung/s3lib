#!/usr/bin/perl -w
use strict;
use Net::OAuth::Client;
use HTML::Entities;
use Data::Dumper;

sub client {
    return Net::OAuth::Client->new(
            client_id => "96580e0b6f984bb8b64d",
            client_secret   => "a9fc1c5af531172dee286fa158cb03391be10ab7",
            site => 'https://github.com',
            request_token_path => '/login/oauth/authorize',
            authorize_path => '/login/oauth/authorize',
            access_token_path => '/login/oauth/access_token',
            callback => "http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi",
            session => \&session,
    );
}


  ## Send user to authorize with service provider
  #get '/auth/google' => sub {
  #      redirect client->authorize_url;
  #};
  
  ## User has returned with token and verifier appended to the URL.
  #get '/auth/google/callback' => sub {

my $client = client();
print "client: $client\n";
print Dumper $client;

my $access_token =  $client->get_access_token();
print "access_token: $access_token\n";
print Dumper $access_token;

#print "Doing client->web_server()\n";
#print $client->web_server();
  
        # Use the auth code to fetch the access token
        #my $params = 
        #my $access_token =  $client->get_access_token(params->{oauth_token}, params->{oauth_verifier});
        #
        #print "access_token: $access_token\n";
        
        ## Use the access token to fetch a protected resource
        #my $response = $access_token->get('/m8/feeds/contacts/default/full');
        #
        ## Do something with said resource...
        #
        #if ($response->is_success) {
        #  return "Yay, it worked: " . $response->decoded_content;
        #}
        #else {
        #  return "Error: " . $response->status_line;
        #}
    #};




##!/usr/bin/env perl
#use strict;
#use warnings;
#use Dancer;
#use Net::OAuth::Client;
#use HTML::Entities;
#
#sub client {
#	my $site_id = shift;
#	Net::OAuth::Client->new(
#		config->{sites}{$site_id}{client_id},
#		config->{sites}{$site_id}{client_secret},
#		site => config->{sites}{$site_id}{site},
#		request_token_path => config->{sites}{$site_id}{request_token_path},
#		authorize_path => config->{sites}{$site_id}{authorize_path},
#		access_token_path => config->{sites}{$site_id}{access_token_path},
#		callback => fix_uri(uri_for("/got/$site_id")),
#		session => \&session,
#		debug => 1,
#	);
#}
#
#get '/get/:site_id' => sub {
#	redirect client(params->{site_id})->authorize_url;
#};
#
#get '/got/:site_id' => sub {
#	return wrap("Error: Missing access code") if (!defined params->{oauth_verifier});
#	my $access_token =  client(params->{site_id})->get_access_token(params->{oauth_token}, params->{oauth_verifier});
#	return wrap("Error: " . $access_token->to_string) if ($access_token->{error});
#	my $content = '<h2>Access token retrieved successfully!</h2>'.
#	'<p>Token: ' . encode_entities($access_token->token) . '</p>'.
#	'<p>Secret: ' . encode_entities($access_token->token_secret) . '</p>';
#	my $response = $access_token->get(config->{sites}{params->{site_id}}{protected_resource_path});
#	if ($response->is_success) {
#		$content .= '<h2>Protected resource retrieved successfully!</h2><textarea>' . encode_entities($response->decoded_content) . '</textarea>';
#	}
#	else {
#		$content .= '<p>Error: ' . $response->status_line . '</p>';
#	}
#	return wrap($content);
#};
#
#sub fix_uri {
#	(my $uri = shift) =~ s[/dispatch\.cgi][];
#	return $uri;
#}
#
#sub wrap {
#	my $content = shift;
#	return <<EOT;
#	<html>
#	<head>
#		<title>OAuth Test</title>
#		<style>
#		h1 a {color: black; text-decoration:none}
#		textarea {width:50%;height:300px}
#		</style>
#	</head>
#	<body>
#	<h1><a href='/'>OAuth Test</a></h1>
#	$content
#	</body>
#	</html>
#EOT
#}
#
#get '/' => sub {
#	my $content='';
#	while (my ($k,$v) = each %{config->{sites}}) {
#		if (defined $v->{client_id} and length $v->{client_id} 
#				and defined $v->{client_secret} and length $v->{client_secret}) {
#			$content .= "<p>" . $v->{name} . ": <a href='/get/$k'>/get/$k</a></p>\n";
#		}
#	}
#	$content = "You haven't configured any sites yet.  Edit your config.yml file!" unless $content;
#	return wrap($content);
#};
#
##dance;

#####!/usr/bin/perl -w
####use strict;
####use HTML::Entities;
####use Net::OAuth::Client;
####
####sub client {
####    return Net::OAuth::Client->new(
####            client_id => "96580e0b6f984bb8b64d",
####            client_secret   => "a9fc1c5af531172dee286fa158cb03391be10ab7",
####            site => 'https://github.com',
####            request_token_path => '/login/oauth/authorize',
####            authorize_path => '/accounts/OAuthAuthorizeToken',
####            access_token_path => '/accounts/OAuthGetAccessToken',
####            callback => uri_for("/auth/google/callback"),
####            session => \&session,
####    );
####}
####
####  # Send user to authorize with service provider
####  get '/auth/google' => sub {
####        redirect client->authorize_url;
####  };
####  
####  # User has returned with token and verifier appended to the URL.
####  get '/auth/google/callback' => sub {
####  
####        # Use the auth code to fetch the access token
####        my $access_token =  client->get_access_token(params->{oauth_token}, params->{oauth_verifier});
####  
####        print "access_token: $access_token\n";
####        
####        ## Use the access token to fetch a protected resource
####        #my $response = $access_token->get('/m8/feeds/contacts/default/full');
####        #
####        ## Do something with said resource...
####        #
####        #if ($response->is_success) {
####        #  return "Yay, it worked: " . $response->decoded_content;
####        #}
####        #else {
####        #  return "Error: " . $response->status_line;
####        #}
####  };
####
####
####my $client = client();
####print "client: $client\n";
####
########package Net::AppThatUsesOAuth;
########use Net::OAuth::Simple;
########use strict;
########use base qw(Net::OAuth::Simple);
########
########
########
########sub new {
########
########my $class  = shift;
########my %tokens = @_;
########
########return $class->SUPER::new( tokens => \%tokens, 
########    #protocol_version => '1.0a',
########    protocol_version => '2.0',
########    urls   => {
########         authorization_url => "https://github.com/login/oauth/authorize",
########         request_token_url => "https://github.com/login/oauth/authorize",
########         access_token_url  => "https://github.com/login/oauth/access_token",
########    });
########}
########
########sub view_restricted_resource {
########    my $self = shift;
########    my $url  = shift;
########    return $self->make_restricted_request($url, 'GET');
########}
########
########sub update_restricted_resource {
########    my $self         = shift;
########    my $url          = shift;
########    my %extra_params = @_;
########    return $self->make_restricted_request($url, 'POST', %extra_params);    
########}
########
########sub get_tokens {
########    return {
########        consumer_key        => "96580e0b6f984bb8b64d",
########        consumer_secret     => "a9fc1c5af531172dee286fa158cb03391be10ab7",
########        site                => 'https://github.com',
########        request_token_path  => '/login/oauth/authorize',
########        authorize_path      => '/accounts/OAuthAuthorizeToken',
########        access_token_path   => '/accounts/OAuthGetAccessToken'
########    };
########}
########
######### Get the tokens from the command line, a config file or wherever 
########my $tokens  = get_tokens(); 
########my $app     = Net::AppThatUsesOAuth->new(%$tokens);
########
######### Check to see we have a consumer key and secret
########unless ($app->consumer_key && $app->consumer_secret) {
########    die "You must go get a consumer key and secret from App\n";
########} 
########   
######### If the app is authorized (i.e has an access token and secret)
######### Then look at a restricted resourse
########if ($app->authorized) {
########    my $response = $app->view_restricted_resource;
########    print $response->content."\n";
########    exit;
########}
########
########
########   # Otherwise the user needs to go get an access token and secret
########   print "Go to ".$app->get_authorization_url."\n";
########   print "Then hit return after\n";
########   <STDIN>;
########
########   my ($access_token, $access_token_secret) = $app->request_access_token;
########
########   # Now save those values