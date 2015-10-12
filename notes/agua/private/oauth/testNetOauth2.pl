#!/usr/bin/env perl
use strict;
use warnings;
#use Dancer;
use Net::OAuth2::Client;
use HTML::Entities;

sub client {
	my $site_id = shift;
	Net::OAuth2::Client->new(
            client_id => "96580e0b6f984bb8b64d",
            client_secret   => "a9fc1c5af531172dee286fa158cb03391be10ab7",
            site => 'https://github.com',
            request_token_path => '/login/oauth/authorize',
            authorize_path => '/accounts/OAuthAuthorizeToken',
            access_token_path => '/accounts/OAuthGetAccessToken',
			scope	=>	"read-write"
		#config->{sites}{$site_id}{client_id},
		#config->{sites}{$site_id}{client_secret},
		#site => config->{sites}{$site_id}{site},
		#authorize_path => config->{sites}{$site_id}{authorize_path},
		#access_token_path => config->{sites}{$site_id}{access_token_path},
		#access_token_method => config->{sites}{$site_id}{access_token_method},
		#access_token_param => config->{sites}{$site_id}{access_token_param},
		#scope => config->{sites}{$site_id}{scope}
	)->web_server(redirect_uri => fix_uri(uri_for("/got/$site_id")));
}

get '/get/:site_id' => sub {
	redirect client(params->{site_id})->authorize_url;
};

get '/got/:site_id' => sub {
	return wrap("Error: Missing access code") if (!defined params->{code});
	my $access_token =  client(params->{site_id})->get_access_token(params->{code});
	return wrap("Error: " . $access_token->to_string) if ($access_token->{error});
	my $content = '<h2>Access token retrieved successfully!</h2><p>' . encode_entities($access_token->to_string) . '</p>';
	my $response = $access_token->get(config->{sites}{params->{site_id}}{protected_resource_url} || config->{sites}{params->{site_id}}{protected_resource_path});
	if ($response->is_success) {
		$content .= '<h2>Protected resource retrieved successfully!</h2><p>' . encode_entities($response->decoded_content) . '</p>';
	}
	else {
		$content .= '<p>Error: ' . $response->status_line . '</p>';
	}
	$content =~ s[\n][<br/>\n]g;
	return wrap($content);
};

sub fix_uri {
	(my $uri = shift) =~ s[/dispatch\.cgi][];
	return $uri;
}

sub wrap {
	my $content = shift;
	return <<EOT;
	<html>
	<head>
		<title>OAuth 2 Test</title>
		<style>
		h1 a {color: black; text-decoration:none}
		</style>
	</head>
	<body>
	<h1><a href='/'>OAuth 2 Test</a></h1>
	$content
	</body>
	</html>
EOT
}

get '/' => sub {
	my $content='';
	while (my ($k,$v) = each %{config->{sites}}) {
		if (defined $v->{client_id} and length $v->{client_id} 
				and defined $v->{client_secret} and length $v->{client_secret}) {
			$content .= "<p>" . $v->{name} . ": <a href='/get/$k'>/get/$k</a></p>\n";
		}
	}
	$content = "You haven't configured any sites yet.  Edit your config.yml file!" unless $content;
	return wrap($content);
};

#dance;
