#!/usr/bin/perl -w

use feature 'say';
use WWW::GitHub::Gist;

my $gist;
#$gist = WWW::GitHub::Gist -> new(id => 'gist id');

# Print the gist's author
#say $gist -> info -> {'owner'};

# Print every ID of the gists owned by USERNAME
$gist = WWW::GitHub::Gist -> new(user => 'stuartpyoung');

foreach (@{ $gist -> user() }) {
  say $_ -> {'repo'};
}

# Create a new gist and print its ID
my $login = `git config github.user stuartpyoung`;
my $token = `git config github.token a359152dd81fbd744a86128c0be5a764`;

chomp $login; chomp $token;
print "login: $login\n";
print "token: $token\n";

$gist = WWW::GitHub::Gist -> new(
    user  => $login,
    token => $token
);

$gist -> add_file('test', 'some data here', '.txt');
say $gist -> create -> {'repo'};

# Create the gist setting its description
say $gist -> create(description => 'gist description here') -> {'repo'};

# Create a private gist
say $gist -> create(private => 1) -> {'repo'};

# Update a pre-existent gist
$gist = WWW::GitHub::Gist -> new(
  id => 'gist id',
  user  => $login,
  token => $token
);

$gist -> add_file('test2', 'some other data here', '.txt');
$gist -> update;
