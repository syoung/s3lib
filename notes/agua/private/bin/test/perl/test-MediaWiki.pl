use strict;

use MediaWiki::API;

  my $mw = MediaWiki::API->new();
  $mw->{config}->{api_url} = 'http://en.wikipedia.org/w/api.php';

  # log in to the wiki
  $mw->login( { lgname => 'username', lgpassword => 'password' } )
    || die $mw->{error}->{code} . ': ' . $mw->{error}->{details};

  # get a list of articles in category
  my $articles = $mw->list ( {
    action => 'query',
    list => 'categorymembers',
    cmtitle => 'Category:Perl',
    cmlimit => 'max' } )
    || die $mw->{error}->{code} . ': ' . $mw->{error}->{details};

  # and print the article titles
  foreach (@{$articles}) {
      print "$_->{title}\n";
  }

  # get user info
  my $userinfo = $mw->api( {
    action => 'query',
    meta => 'userinfo',
    uiprop => 'blockinfo|hasmsg|groups|rights|options|editcount|ratelimits' } );
