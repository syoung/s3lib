#!/usr/bin/perl -w


use strict;
use lib qw(lib);
use JSON::Any;
use Data::Dumper;

my $CONFIG = ".twitter_config";


binmode STDOUT, ":utf8";


# Get the tokens from the command line, a config file or wherever 
my $tokens  = get_tokens(); 
my $app     = Twitter->new(%$tokens);

# Check to see we have a consumer key and secret
unless ($app->consumer_key && $app->consumer_secret) {
    die "You must go get a consumer key and secret from App\n";
} 

# If the app is authorized (i.e has an access token and secret)
# Then look at a restricted resourse
get_dms($app) if $app->authorized;

# right, we need to get their access stuff
my $cgi    = CGI->new;
print $cgi->header();
print $cgi->start_html();
print "STEP 1: REQUEST AUTHORIZATION FOR THIS APP\n";
#print "cgi->url: ", $cgi->url, "\n";
#my $url = $app->get_authorization_url( callback => $cgi->url."?rand=".rand() );

#print "\tURL : $url\n";
#print "\tURL : ".$app->get_authorization_url( callback => $tokens->param('oauth_token') )."\n";

my $callback = 'https://github.com/login/oauth/authorize/';# . "?rand=".rand();
print "callback: $callback\n";
my $url = $app->get_authorization_url( callback => $callback );
print "\tURL : $url\n";


print "\n-- Please go to the above URL and authorize the app";
print "\n-- It will give you a code. Please type it here: ";
my $verifier = <STDIN>; print "\n";
chomp($verifier); $verifier =~ s!(^\s*|\s*$)!!g;
$app->verifier($verifier);

my ($access_token, $access_token_secret) = $app->request_access_token();

print "You have now authorized this app.\n";
print "Your access token and secret are:\n\n";
print "access_token=$access_token\n";
print "access_token_secret=$access_token_secret\n";
print "\n";
if (-f $CONFIG) {
    save_tokens($app);
    print "You should note these down but they have also been saved in $CONFIG\n\n";
} else {
    print "You should note these down or put them in $CONFIG with your consumer key and secret\n\n";
}

get_dms($app);


sub get_dms {
	my $dms = JSON::Any->jsonToObj($app->get_dms);
	foreach my $dm (@$dms) {
		chomp(my $sender = $dm->{sender}->{screen_name});
		chomp(my $text   = $dm->{text});
		print "--\n$sender said \"$text\"\n";
	}
	exit(0);
}


sub get_tokens {

	return {
		client_id => '96580e0b6f984bb8b64d',
		consumer_key => '96580e0b6f984bb8b64d',
		client_secret => 'a9fc1c5af531172dee286fa158cb03391be10ab7',
		consumer_secret => 'a9fc1c5af531172dee286fa158cb03391be10ab7'
	};

    #my %tokens = Twitter->load_tokens($CONFIG);
    #while (@ARGV && $ARGV[0] =~ m!^(\w+)\=(\w+)$!) {
    #    $tokens{$1} = $2;
    #    shift @ARGV;
    #}
    #return %tokens;
}

sub save_tokens {
    my $app     = shift;
    my %tokens = $app->tokens;
    Twitter->save_tokens($CONFIG, %tokens);
}


package Twitter;

use strict;
use base qw(Net::OAuth::Simple);
use Data::Dumper;

sub new {
    my $class  = shift;
    my %tokens = @_;
    return $class->SUPER::new( tokens => \%tokens, 
		protocol_version => '1.0a',
		urls   => {
			 authorization_url => 'https://github.com/login/oauth/authorize',
			 request_token_url => 'https://github.com/login/oauth/access_token',
			 access_token_url  => 'https://github.com/login/oauth/access_token',
	});
}

sub get_dms {
	my $self = shift;
	my $form = shift || "json";
	my $url  = "http://api.twitter.com/1/direct_messages.${form}";
	return $self->_make_restricted_request($url, 'GET');
}

sub _make_restricted_request {
    my $self     = shift;
    my $response = $self->make_restricted_request(@_);
    return $response->content;
}

sub _make_request {
#print "Doing _make_request\n";
    my $self    = shift;
    my $class   = shift;
    my $url     = shift;
    my $method  = uc(shift);
    my @extra   = @_;

    my $uri   = URI->new($url);
    my %query = $uri->query_form;
    $uri->query_form({});
    
    my $request = $class->new(
        #token     		=> $self->token,
		redirect_uri	=> "http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/callback.cgi",
        client_id    	=> $self->consumer_key,
        client_secret  	=> $self->consumer_secret,
        consumer_key     => $self->consumer_key,
        consumer_secret  => $self->consumer_secret,
        request_url      => $uri,
        request_method   => $method,
        signature_method => $self->signature_method,
        protocol_version => $self->oauth_1_0a ? Net::OAuth::PROTOCOL_VERSION_1_0A : Net::OAuth::PROTOCOL_VERSION_1_0,
        timestamp        => time,
        nonce            => $self->_nonce,
        extra_params     => \%query,
        @extra,
    );

	print "BEFORE sign request: \n";
	#print Data::Dumper $request;

    $request->sign;

	print "AFTER sign request: \n";
	#print Data::Dumper $request;

    return $self->_error("COULDN'T VERIFY! Check OAuth parameters.")
      unless $request->verify;

    my @args    = ();
    my $req_url = $url;
    my $params  = $request->to_hash;
    if ('GET' eq $method || 'PUT' eq $method) {
        $req_url = URI->new($url);
        $req_url->query_form(%$params);
    } else {
        @args    = ( HTTP::Headers->new(%$params) );
    }
    
    my $req      = HTTP::Request->new( $method => $req_url, @args);
    my $response = $self->{browser}->request($req);
    return $self->_error("$method on $request failed: ".$response->status_line)
      unless ( $response->is_success );

	print "response: \n";
	print Dumper $response;

    return $response;
}


1;
