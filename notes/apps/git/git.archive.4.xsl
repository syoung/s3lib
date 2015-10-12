<entry [Mon 2012:06:11 15:55:42 EST] FIXED GITHUB v2 API PROBLEM WITH -F CREDENTIALS>


PROBLEM:

curl -F login=LOGIN -F token=TOKEN "$apiroot/repos/show/$login/$repository"

FAILS WITH PRIVATE REPOS, GET 'ERROR 500', 'AN UNEXPECTED ERROR SEEMS TO HAVE OCCURRED'


SOLUTION: USE
   curl -u "LOGIN/token:TOKEN" $apiroot/repos/show/$login/$repository



</entry>
<entry [Fri 2012:06:08 19:09:19 EST] PERL OAUTH EXAMPLES>

http://www.commonmap.info/w/index.php/Oauth_perl_examples


#!/usr/bin/perl

use LWP::UserAgent;
use Net::OAuth;
$Net::OAuth::PROTOCOL_VERSION = Net::OAuth::PROTOCOL_VERSION_1_0;
use HTTP::Request::Common;
my $ua = LWP::UserAgent->new;

sub consumer_key { 'insert consumer key here' }
sub consumer_secret { 'insert consumer key secret here' }
sub request_url { 'http://api06.dev.openstreetmap.org/oauth/request_token' }
sub access_url { 'http://api06.dev.openstreetmap.org/oauth/access_token' }

my $request =
        Net::OAuth->request('consumer')->new(
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


Use Access Token

#!/usr/bin/perl

use LWP::UserAgent;
use Net::OAuth;
$Net::OAuth::PROTOCOL_VERSION = Net::OAuth::PROTOCOL_VERSION_1_0;
use HTTP::Request::Common;
my $ua = LWP::UserAgent->new;

sub consumer_key { 'insert consumer key here' }
sub consumer_secret { 'insert consumer secret here' }
sub access_token { 'insert access token here' }
sub access_token_secret { 'insert access token secret here' }
sub auth_url { 'http://api06.dev.openstreetmap.org/oauth/authorize' }
sub prefs_url { 'http://api06.dev.openstreetmap.org/api/0.6/user/preferences' }
sub user_url { 'http://api06.dev.openstreetmap.org/api/0.6/user/details' }

my $request =
        Net::OAuth->request('protected resource')->new(
          consumer_key => consumer_key(),
          consumer_secret => consumer_secret(),
          token => access_token(),
          token_secret => access_token_secret(),
          request_url => user_url(),
          request_method => 'GET',
          signature_method => 'HMAC-SHA1',
          timestamp => time,
          nonce => nonce(),
        );

$request->sign;

print $request->to_url."\n";

my $res = $ua->request(GET $request->to_url);
print $res->as_string;
if ($res->is_success) {
  print "Success\n";
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
    
</entry>
<entry [Fri 2012:06:08 03:43:53 EST] FIXED ERRONEOUS 'nothing to commit' AND 'Everything up-to-date' AFTER CHANGES>

PROBLEM

AFTER CHANGES, WHEN TRY TO COMMIT GET THIS ERROR
git push
    Everything up-to-date


DIAGNOSIS

DETACHED HEAD


SOLUTION

1. CHECKOUT MASTER
git checkout master
    D	typescript
    Warning: you are leaving 2 commits behind, not connected to
    any of your branches:
    
      60c7a32 +Add: All enabled tests 100% complete
      7a839cb -Fix: Cleaning up tests before release 100%
    
    If you want to keep them by creating a new branch, this may be a good time
    to do so with:
    
     git branch new_branch_name 60c7a3260a6fdf81e9ba5770ace2510631d029a8
    
    Switched to branch 'master'

    
2. DO HARD RESET

git reset --hard 60c7a32
    HEAD is now at 60c7a32 +Add: All enabled tests 100% complete

git status
    # On branch master
    # Your branch and 'github/master' have diverged,
    # and have 2 and 1 different commit each, respectively.
    #
    nothing to commit (working directory clean)

    
3. PUSH WITH --force

git push 
    To git@github.com:syoung/aguadev
        ! [rejected]        master -> master (non-fast-forward)
       error: failed to push some refs to 'git@github.com:syoung/aguadev'
       To prevent you from losing history, non-fast-forward updates were rejected
       Merge the remote changes (e.g. 'git pull') before pushing again.  See the
   'Note about fast-forwards' section of 'git push --help' for details.

git push --force
    Counting objects: 27, done.
    Compressing objects: 100% (14/14), done.
    Writing objects: 100% (15/15), 1.74 KiB, done.
    Total 15 (delta 12), reused 4 (delta 1)
    To git@github.com:syoung/aguadev
     + f08fd46...60c7a32 master -> master (forced update)

    OK
    
</entry>
<entry [Sun 2012:06:03 19:21:52 EST] oauth.googlecode AND OTHER OAUTH EXAMPLES>

OAUTH TEST SERVER
http://term.ie/oauth/example/


OAUTH JAVASCRIPT EXAMPLE
http://oauth.googlecode.com/svn/code/javascript/example/


TEST OAUTH PAGE
http://term.ie/oauth/example/


DOWNLOAD OAUTH CODE (FAILED)

cd /agua/private/oauth
sudo apt-get install subversion

svn checkout http://oauth.googlecode.com/svn/trunk/ oauth.googlecode

    FAILED
    svn: URL 'http://oauth.googlecode.com/svn/trunk' doesn't exist

    
</entry>
<entry [Sun 2012:06:03 16:30:47 EST] GITHUB OAUTH WORKFLOW>

http://develop.github.com/p/oauth.html

Web Application Flow

This is a description of the OAuth flow from 3rd party web sites.

Redirect users to a this link to request GitHub access.

 GET https://github.com/login/oauth/authorize?
   client_id=...&
   redirect_uri=http://www.example.com/oauth_redirect
If the user accepts your request, GitHub redirects back to your site with a temporary code in a code parameter. Exchange this for an access token:

 POST https://github.com/login/oauth/access_token?
   client_id=...&
   redirect_uri=http://www.example.com/oauth_redirect&
   client_secret=...&
   code=...

 RESPONSE:
 access_token=...
You have the access token, so now you can make requests on the user's behalf:

 GET https://github.com/api/v2/json/user/show?
   access_token=...
Javascript/Desktop Flow

These flows are disabled for now...

Redirect URLs

The redirect_uri parameter is optional. If left out, GitHub will redirect users to the callback URL configured in the OAuth Application settings. If provided, the redirect URL must match the callback URL's host.

CALLBACK: http://foo.com
GOOD: https://foo.com
GOOD: http://foo.com/bar
BAD:  http://foo:com:8080
BAD:  http://bar.com
Scopes

Scopes let you specify exactly what type of access you need. This will be displayed to the user on the authorize form.

(no scope) - public read-only access (includes user profile info, public repo info, and gists).
user - DB read/write access to profile info only.
public_repo - DB read/write access, and Git read access to public repos.
repo - DB read/write access, and Git read access to public and private repos.
gist - write access to gists.
Your application can request the scopes in the initial redirection. You can specify multiple scopes by separating them by a comma.

https://github.com/login/oauth/authorize?
  client_id=...&
  scope=user,public_repo

  
</entry>
<entry [Sun 2012:06:03 15:57:45 EST] TROUBLESHOOT OAUTH ACCESS TOKEN REQUEST>

http://groups.google.com/group/37signals-api/browse_thread/thread/4df20b9da125908d/b8b5129709e86a38?lnk=gst&q=oauth
    
OAuth redirect_uri_mismatch error


</entry>
<entry [Sat 2012:06:02 05:12:15 EST] LIST OF ACCESS TOKEN API CALLS>

TAGS

#### curl --data "login=syoung&token=21a393b182705f3d5faea967496b465cbacbff8b"  https://github.com/api/v2/json/repos/show/syoung/biorepodev/tags
    EMPTY

#### curl --data "login=syoung&token=21a393b182705f3d5faea967496b465cbacbff8b" https://github.com/api/v2/json/user/show/syoung/tags
    EMPTY


SHOW USER INFO:

curl  https://api.github.com/user?access_token=21a393b182705f3d5faea967496b465cbacbff8b

<!--
{
  "type": "User",
  "hireable": false,
  "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
  "login": "syoung",
  "public_gists": 1,
  "followers": 1,
  "email": "stuartpyoung@gmail.com",
  "company": null,
  "bio": null,
  "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
  "following": 1,
  "created_at": "2010-05-17T07:11:56Z",
  "blog": "www.stuartpyoung.com",
  "location": null,
  "public_repos": 1,
  "url": "https://api.github.com/users/syoung",
  "name": "Stuart Young",
  "html_url": "https://github.com/syoung",
  "id": 278943
}
-->
    
LEGACY SHOW TAGS
curl https://api.github.com/legacy/repos/show/syoung/biorepodev/tags


USER INFO
curl  https://api.github.com/user?access_token=21a393b182705f3d5faea967496b465cbacbff8b

STARRED GISTS
curl https://api.github.com/gists/starred?access_token=21a393b182705f3d5faea967496b465cbacbff8b

OR

curl -H "Authorization: token 21a393b182705f3d5faea967496b465cbacbff8b" https://api.github.com/gists/starred

LIST ACCESS TOKENS
curl --user "syoung" https://api.github.com/authorizations

USE V2 TO SHOW USER INFO
curl --data "login=syoung&token=21a393b182705f3d5faea967496b465cbacbff8b" https://github.com/api/v2/json/user/show/syoung
    **** EMPTY ****

SET SCOPE
...in the initial redirection:

https://github.com/login/oauth/authorize?
  client_id=...&
  scope=user,public_repo&

CONFIRM EXISTING SCOPE HEADER ONLY:

curl -H "Authorization: bearer 21a393b182705f3d5faea967496b465cbacbff8b" https://api.github.com/users/syoung -I

HTTP/1.1 200 OK
Server: nginx/1.0.13
Date: Sat, 02 Jun 2012 09:21:48 GMT
Content-Type: application/json; charset=utf-8
Connection: keep-alive
Status: 200 OK
X-RateLimit-Limit: 5000
ETag: "d41d8cd98f00b204e9800998ecf8427e"
X-OAuth-Scopes: public_repo
X-RateLimit-Remaining: 4995
Content-Length: 665
X-Accepted-OAuth-Scopes: user


SCOPE TYPES
(no scope) - public read-only access (includes user profile info, public repo info, and gists).
user - DB read/write access to profile info only.
public_repo - DB read/write access, and Git read access to public repos.
repo - DB read/write access, and Git read access to public and private repos.
gist - write access to gists.



http://developer.github.com/v3/oauth/#create-a-new-authorization

Create a new authorization

Note: Authorizations created from the API will show up in the GitHub API app.

POST /authorizations
Input

scopes
Optional array - A list of scopes that this authorization is in.
note
Optional string - A note to remind you what the OAuth token is for.
note_url
Optional string - A URL to remind you what app the OAuth token is for.
{
  "scopes": [
    "public_repo"
  ],
  "note": "admin script"
}
Response

Status: 201 Created
Location: https://api.github.com/authorizations/1
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4999
{
  "id": 1,
  "url": "https://api.github.com/authorizations/1",
  "scopes": [
    "public_repo"
  ],
  "token": "abc123",
  "app": {
    "url": "http://my-github-app.com",
    "name": "my github app"
  },
  "note": "optional note",
  "note_url": "http://optional/note/url",
  "updated_at": "2011-09-06T20:39:23Z",
  "created_at": "2011-09-06T17:26:27Z"
}
Update an existing authorization

PATCH /authorizations/:id
Input

scopes
Optional array - Replaces the authorization scopes with these.
add_scopes
Optional array - A list of scopes to add to this authorization.
remove_scopes
Optional array - A list of scopes to remove from this authorization.
note
Optional string - A note to remind you what the OAuth token is for.
note_url
Optional string - A URL to remind you what app the OAuth token is for.
You can only send one of these scope keys at a time.

{
  "add_scopes": [
    "repo"
  ],
  "note": "admin script"
}
Response

Status: 200 OK
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4999
{
  "id": 1,
  "url": "https://api.github.com/authorizations/1",
  "scopes": [
    "public_repo"
  ],
  "token": "abc123",
  "app": {
    "url": "http://my-github-app.com",
    "name": "my github app"
  },
  "note": "optional note",
  "note_url": "http://optional/note/url",
  "updated_at": "2011-09-06T20:39:23Z",
  "created_at": "2011-09-06T17:26:27Z"
}
Delete an authorization

DELETE /authorizations/:id
Response

Status: 204 No Content
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4999



</entry>
<entry [Thu 2012:05:31 23:23:47 EST] MANUALLY CREATED GITHUB OAUTH ACCESS TOKEN USING RESTClient: 21a393b182705f3d5faea967496b465cbacbff8b>


1. CREATED OAUTH CLIENT ID FOR syoung
https://github.com/settings/applications/14387

Client ID
96580e0b6f984bb8b64d

Secret
a9fc1c5af531172dee286fa158cb03391be10ab7

URL
http://ec2-50-19-18-44.compute-1.amazonaws.com

Callback URL
http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/oauth2.cgi



2. USED RESTClient EXTENSION FOR FIREFOX, SELECTED Github TEMPLATE, ADDED CLIENT ID AND CLIENT SECRET:


Client identifier
96580e0b6f984bb8b64d

Client secret
a9fc1c5af531172dee286fa158cb03391be10ab7

Authorization Endpoint
https://github.com/login/oauth/authorize

Token Endpoint
https://github.com/login/oauth/access_token

Redirection Endpoint
http://ec2-50-19-18-44.compute-1.amazonaws.com/cgi-bin/agua/oauth2.cgi

NOTE: 'Redirection Endpoint' IN RESTClient MUST BE THE SAME AS 'Callback URL' IN STEP 1 (I.E., ON GITHUB APPLICATIONS PAGE FOR THIS CLIENT) 


3. HIT 'Authenticate', WHICH OPENS THE GITHUB LOGIN PAGE
https://github.com/login?return_to=%2Flogin%2Foauth%2Fauthorize%3Fclient_id%3D1791d4aa9b701a234b4e%26redirect_uri%3Dhttp%253A%252F%252Fwww.aguadev.org%26response_type%3Dcode%26scope%3Dpublic_repo%2Brepo%2Bdelete_repo

INPUT USERNAME AND PASSWORD AND THEN 'LOG IN'

access_token
21a393b182705f3d5faea967496b465cbacbff8b


4. TEST ACCESS TOKEN

curl -H "Authorization: token 21a393b182705f3d5faea967496b465cbacbff8b" https://api.github.com/user

OR

curl  https://api.github.com/user?access_token=21a393b182705f3d5faea967496b465cbacbff8b

    OK
    
    {
  "public_gists": 1,
  "type": "User",
  "company": null,
  "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
  "login": "syoung",
  "email": "stuartpyoung@gmail.com",
  "public_repos": 1,
  "created_at": "2010-05-17T07:11:56Z",
  "location": null,
  "url": "https://api.github.com/users/syoung",
  "following": 1,
  "blog": "www.stuartpyoung.com",
  "name": "Stuart Young",
  "hireable": false,
  "followers": 1,
  "html_url": "https://github.com/syoung",
  "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
  "id": 278943,
  "bio": null
}


CONFIRM ACCESS TOKEN IS IN 'AUTHORIZATIONS'

curl --user "syoung" https://api.github.com/authorizations
Enter host password for user 'syoung':
[
  {
    "note": null,
    "created_at": "2012-06-01T18:19:40Z",
    "url": "https://api.github.com/authorizations/387886",
    "scopes": [
      "public_repo"
    ],
    "updated_at": "2012-06-02T08:51:49Z",
    "note_url": null,
    "app": {
      "url": "http://ec2-50-19-18-44.compute-1.amazonaws.com",
      "name": "agua"
    },
    "token": "21a393b182705f3d5faea967496b465cbacbff8b",
    "id": 387886
  }
]





NOTES
=====

 
1. LOOKUP LAPTOP IP
-------------------
http://whatismyipaddress.com/
76.110.77.97
c-76-110-77-97.hsd1.fl.comcast.net


2. WORKING EXAMPLE
------------------
https://accounts.google.com/ServiceLogin?btmpl=authsub&continue=https%3A%2F%2Faccounts.google.com%2FOAuthAuthorizeToken%3Foauth_callback%3Dhttp%253A%252F%252Foauth.kg23.com%252Fgot%252Fgoogle_contacts%26oauth_token%3D4%252FzFEim8Je4Ga_55oPoxozqq706fj7%26hd%3Ddefault&continue2=https%3A%2F%2Fwww.google.com%2Fa%2F%7B%7Bdomain%7D%7D%2FOAuthAuthorizeToken%3Foauth_callback%3Dhttp%253A%252F%252Foauth.kg23.com%252Fgot%252Fgoogle_contacts%26oauth_token%3D4%252FzFEim8Je4Ga_55oPoxozqq706fj7&spl=true&passive=true&ul=1


3. INSTALLED Net::OAuth ON LAPTOP
--------------------------------
1. INSTALL Crypt::SSLeay
http://colinnewell.wordpress.com/2011/10/24/cryptssleay-and-ubuntu-11-10/

DOWNLOAD PATCH TO /tmp
https://rt.cpan.org/Ticket/Attachment/988860/514763/nossl2.patch

cat /tmp/nossl2.patch
    diff --git a/SSLeay.xs b/SSLeay.xs
    index 9df9f58..8c26155 100644
    --- a/SSLeay.xs
    +++ b/SSLeay.xs
    @@ -129,9 +129,15 @@ SSL_CTX_new(packname, ssl_version)
                 ctx = SSL_CTX_new(SSLv3_client_method());
             }
             else {
    +#ifndef OPENSSL_NO_SSL2
                 /* v2 is the default */
                 ctx = SSL_CTX_new(SSLv2_client_method());
    +#else
    +            /* v3 is the default */
    +            ctx = SSL_CTX_new(SSLv3_client_method());
    +#endif
             }                
    +
             SSL_CTX_set_options(ctx,SSL_OP_ALL|0);
             SSL_CTX_set_default_verify_paths(ctx);
             SSL_CTX_set_verify(ctx, SSL_VERIFY_NONE, NULL);



INSTALL PATCH INTERACTIVELY IN cpanm
cpanm Crypt::SSLeay --prompt

    Testing Crypt-SSLeay-0.58 failed.
    You can s)kip, r)etry, f)orce install or l)ook ? [s] l
    Entering /home/user/.cpanm/work/1319488454.2107/Crypt-SSLeay-0.58 with /bin/bash

INSTALL PATCH
patch < /tmp/nossl2.patch
    patching file SSLeay.xs
make
make test
exit


    You can s)kip, r)etry, f)orce install or l)ook ? [s] r

Successfully installed Crypt-SSLeay-0.58
1 distribution installed


2. INSTALL Net::OAuth
cpanm install Net::OAuth::Client
cpanm install Net::OAuth::Simple

3. INSTALL Net::OAuth2 AND LWP::Protocol::https
cpanm install Net::OAuth2
cpanm install LWP::Protocol::https


    OK


4. TEST APPLICATIONS TO CREATE ACCESS TOKEN ARE HERE
---------------------------------------------------

/agua/private/oauth


5. PASSWORD-AUTHENTICATED API QUERIES
------------------------------------

LIST EXISTING AUTHORISATIONS (HEAD OR LAPTOP):

curl --user "syoung" https://api.github.com/authorizations
Enter host password for user 'syoung':
[

]


SHOW USER INFO FOR USER syoung

curl --user "syoung" https://api.github.com/users/syoung

    Enter host password for user 'syoung':
    {
      "owned_private_repos": 9,
      "created_at": "2010-05-17T07:11:56Z",
      "type": "User",
      "location": null,
      "hireable": false,
      "public_repos": 1,
      "following": 1,
      "html_url": "https://github.com/syoung",
      "bio": null,
      "disk_usage": 1039388,
      "collaborators": 0,
      "blog": "www.stuartpyoung.com",
      "url": "https://api.github.com/users/syoung",
      "avatar_url": "https://secure.gravatar.com/avatar/61fd5d40af511575f9c620639e862a5f?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
      "public_gists": 1,
      "plan": {
        "space": 2516582,
        "collaborators": 10,
        "private_repos": 20,
        "name": "medium"
      },
      "private_gists": 0,
      "name": "Stuart Young",
      "company": null,
      "gravatar_id": "61fd5d40af511575f9c620639e862a5f",
      "login": "syoung",
      "total_private_repos": 9,
      "email": "stuartpyoung@gmail.com",
      "id": 278943,
      "followers": 1



NOTES
=====

https://gist.github.com/2288960

Introduction

OAuth

The first thing to know is that your API Token (found in https://github.com/settings/admin) is not the same token used by OAuth. They are different tokens and you will need to generate an OAuth token to be authorized.

Follow the API's instructions at http://developer.github.com/v3/oauth/ under the sections "Non-Web Application Flow" and "Create a new authorization" to become authorized.

Note: Use Basic Auth once to create an OAuth2 token http://developer.github.com/v3/oauth/#oauth-authorizations-api

curl https://api.github.com/authorizations \
--user "caspyin" \
--data '{"scopes":["gist"],"note":"Demo"}'


This will prompt you for your GitHub password and return your OAuth token in the response. It will also create a new Authorized application in your account settings https://github.com/settings/applications

Now that you have the OAuth token there are two ways to use the token to make requests that require authentication (replace "OAUTH-TOKEN" with your actual token)

curl https://api.github.com/gists/starred?access_token=OAUTH-TOKEN

curl -H "Authorization: token OAUTH-TOKEN" https://api.github.com/gists/starred


List the authorizations you already have

curl --user "caspyin" https://api.github.com/authorizations


An introduction to curl using GitHub's API

The Basics
Makes a basic GET request to the specifed URI

curl https://api.github.com/users/caspyin
Includes HTTP-Header information in the output

curl --include https://api.github.com/users/caspyin

Pass user credential to basic auth to access protected resources like a users starred gists, or private info associated with their profile

curl --user "caspyin:PASSWD" https://api.github.com/gists/starred
curl --user "caspyin:PASSWD" https://api.github.com/users/caspyin

Passing just the username without the colon(:) will cause you to be prompted for your account password. This avoids having your password in your command line history

curl --user "caspyin" https://api.github.com/users/caspyin

POST
Use the --request (-X) flag along with --data (-d) to POST data

curl --user "caspyin" --request POST --data '{"description":"Created via API","public":"true","files":{"file1.txt":{"content":"Demo"}}' https://api.github.com/gists

curl --user "caspyin" -X POST --data '{"description":"Created via API","public":"true","files":{"file1.txt":{"content":"Demo"}}' https://api.github.com/gists


Of course --data implies POST so you don't have to also specify the --request flag

curl --user "caspyin" --data '{"description":"Created via API","public":"true","files":{"file1.txt":{"content":"Demo"}}' https://api.github.com/gists
Here is an example that uses the old GitHub API (v2). You can use multiple --data flags

curl --data "login=caspyin" --data "token=TOKEN" https://github.com/api/v2/json/user/show/caspyin


The post data gets combined into one so you can also just combine them yourself into a single --data flag

curl --data "login=caspyin&token=TOKEN" https://github.com/api/v2/json/user/show/caspyin
You can tell curl to read from a file (@) to POST data

curl --user "caspyin" --data @data.txt https://api.github.com/gists 
Or it can read from STDIN (@-)

curl --user "caspyin" --data @- https://api.github.com/gists
{
  "description":"Test",
  "public":false,
  "files": {
    "file1.txt": {
      "content":"Demo"
    }
  }
}
end with ctrl+d


</entry>
<entry [Thu 2012:05:31 17:14:38 EST] GITHUB OAUTH SYSTEM REPLACES TOKENS TOMORROW!>

GOOGLE OAUTH TUTORIAL
http://code.google.com/chrome/extensions/tut_oauth.html


API v3 NOTES

http://developer.github.com/v3/

TEST OK
curl -i https://api.github.com


Authentication

There are two ways to authenticate through GitHub API v3:


Basic Authentication:

curl -u "username:PASSWORD" https://api.github.com


OAuth2 Token (sent in a header):

curl -H "Authorization: token OAUTH-TOKEN" https://api.github.com



OAuth2 Token (sent as a parameter):

curl https://api.github.com?access_token=OAUTH-TOKEN


Read more about OAuth2. Note that OAuth2 tokens can be acquired programmatically, for applications that are not websites.

Requests that require authentication will return 404, instead of 403, in some places. This is to prevent the accidental leakage of private repositories to unauthorized users.



HOW TO GET AN OAUTH TOKEN
=========================


https://gist.github.com/419219

GitHub OAuth Busy Developer's Guide

This is a quick guide to OAuth2 support in GitHub for developers. This is still experimental and could change at any moment. This Gist will serve as a living document until it becomes finalized at Develop.GitHub.com.

OAuth2 is a protocol that lets external apps request authorization to private details in your GitHub account without getting your password. All developers need to register their application before getting started.

Web Application Flow
Redirect to this link to request GitHub access:
https://github.com/login/oauth/authorize?
  client_id=...&
  redirect_uri=http://www.example.com/oauth_redirect
If the user accepts your request, GitHub redirects back to your site with a temporary code in a code parameter. Exchange this for an access token:
POST https://github.com/login/oauth/access_token?
  client_id=...&
  redirect_uri=http://www.example.com/oauth_redirect&
  client_secret=...&
  code=...

RESPONSE:
access_token=...
You have the access token, so now you can make requests on the user's behalf:
GET https://github.com/api/v2/json/user/show?
  access_token=...
Javascript Flow
Disabled, for now...

Desktop flow
Disabled, for now...

Scopes
(no scope) - public read-only access (includes user profile info, public repo info, and gists).
user - DB read/write access to profile info only.
public_repo - DB read/write access, and Git read access to public repos.
repo - DB read/write access, and Git read access to public and private repos.
gist - write access to gists.
Your application can request the scopes in the initial redirection:

https://github.com/login/oauth/authorize?
  client_id=...&
  scope=user,public_repo&
  redirect_uri=http://www.example.com/oauth_redirect
    
</entry>
<entry [Tue 2012:05:29 21:10:27 EST] CREATED aguatest REPOSITORY ON bitbucket>

cd /agua/t    
git remote add bit ssh://git@bitbucket.org/stuartpyoung/aguatest.git
git push -u bit master

    OK
    
</entry>
<entry [Fri 2012:04:27 22:17:18 EST] SCENARIOS FOR USING git stash>

http://man.he.net/man1/git-stash

EXAMPLES
       Pulling into a dirty tree
           When you are in the middle of something, you learn that there are
           upstream changes that are possibly relevant to what you are doing.
           When your local changes do not conflict with the changes in the
           upstream, a simple git pull will let you move forward.

           However, there are cases in which your local changes do conflict
           with the upstream changes, and git pull refuses to overwrite your
           changes. In such a case, you can stash your changes away, perform a
           pull, and then unstash, like this:

               $ git pull
                ...
               file foobar not up to date, cannot merge.
               $ git stash
               $ git pull
               $ git stash pop


       Interrupted workflow
           When you are in the middle of something, your boss comes in and
           demands that you fix something immediately. Traditionally, you
           would make a commit to a temporary branch to store your changes
           away, and return to your original branch to make the emergency fix,
           like this:

               # ... hack hack hack ...
               $ git checkout -b my_wip
               $ git commit -a -m "WIP"
               $ git checkout master
               $ edit emergency fix
               $ git commit -a -m "Fix in a hurry"
               $ git checkout my_wip
               $ git reset --soft HEAD^
               # ... continue hacking ...

           You can use git stash to simplify the above, like this:

               # ... hack hack hack ...
               $ git stash
               $ edit emergency fix
               $ git commit -a -m "Fix in a hurry"
               $ git stash pop
               # ... continue hacking ...


       Testing partial commits
           You can use git stash save --keep-index when you want to make two
           or more commits out of the changes in the work tree, and you want
           to test each change before committing:

           If you mistakenly drop or clear stashes, they cannot be recovered
           through the normal safety mechanisms. However, you can try the
           following incantation to get a list of stashes that are still in
           your repository, but not reachable any more:

               git fsck --unreachable |
               grep commit | cut -d\  -f3 |
               xargs git log --merges --no-walk --grep=WIP
    
</entry>
<entry [Thu 2012:04:05 18:41:58 EST] MAKE BASH GIT AWARE>

    #PS1='[\u@\h \W]$(__git_ps1 " (%s)")\\$ '                                   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(__git_ps1 " (%s)")\\$ '
    #PS1=export GIT_PS1_SHOWDIRTYSTATE=true                                                                                                                 
</entry>
<entry [Tue 2012:04:03 12:38:28 EST] BITBUCKET SPOONING>

https://bitbucket.org/spooning/

    
</entry>
<entry [Fri 2012:03:30 01:42:55 EST] CREATED GITHUB aguadev REPOSITORY>

1. SIGNON
https://bitbucket.org/account/signin/?next=/stuartpyoung/aguadev
    

2. ADDED SSH PUBLIC KEY FOR aquarius2

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDW8uE7j0KMhqR2ZLNphOKGRo8zOM2Q8+yqwfsD1HYVtEfDhp9EV9w6i4ool1aG9KJZA7IT7ufQFWMYrtEjelav4D24KSEJzxoSv8QJ/6tvp2wPrO2DBx6XBDMHExxVT54nyO4FhfrNcQt2skicVZbpMe3x+tsD2QOcMWI1aMI4IiMADnuagX++5hRO30U0QSWpxheZednEio12u0/CQvZ1EZ6cysw82zoEPOOfh+OExVP/YBo5j79+ZgwbUQ9r+drKacI8Cc4roIvkJ6fsfDd9k6YvvXXBqV1yRdf7ANtaMLoMgytyzPh0FnOLqTm+e7jfe6sKt+TStvLaLBUVQWU1 stuartpyoung@gmail.com


3. ADDED BITBUCKET ENTRY TO /home/syoung/.ssh/config

#### BITBUCKET stuartpyoung (aquarius2)
Host bitbucket.org
HostName bitbucket.org
IdentityFile ~/.ssh/idents/bitbucket/stuartpyoung/id_rsa
User stuartpyoung


4. COPIED aquarius2 TO BITBUCKET SSH KEY FOLDER
(NB: WORKS WITHOUT THIS AS aquarius2 IS BASE id_rsa)

mkdir -p /home/syoung/.ssh/idents/bitbucket.org
cp /home/syoung/.ssh/idents/github.com/syoung/id_rsa \
/home/syoung/.ssh/idents/bitbucket.org/stuartpyoung/id_rsa


5. CREATED REMOTE
(NB: CLONE URL IS git clone https://stuartpyoung@bitbucket.org/stuartpyoung/aguadev.git)

git remote add bitbucket git@bitbucket.org:stuartpyoung/aguadev.git


6. PUSHED TO BITBUCKET

git push bitbucket master
    OK

    
</entry>
<entry [Mon 2012:03:26 15:39:16 EST] RESSURECT DESTROYED COMMIT USING reflog>

http://stackoverflow.com/questions/927358/git-undo-last-commit

One more thing: Suppose you destroy a commit as in the first example, but then discover you needed it after all? Tough luck, right?

Nope, there's still a way to get it back. Type git reflog and you'll see a list of (partial) commit shas that you've moved around in. Find the commit you destroyed, and do this:

git checkout -b someNewBranchName shaYouDestroyed
You've now resurrected that commit. Commits don't actually get destroyed in Git for some 90 days, so you can usually go back and rescue one you didn't mean to get rid of.


NOTES
=====

431
down vote
Undoing a commit is a little scary if you don't know how it works. But it's actually amazingly easy if you do understand.

Say you have this, where C is your HEAD and (F) is the state of your files.

   (F)
A-B-C
    ↑
  master
You want to nuke commit C and never see it again. You do this:

git reset --hard HEAD~1
The result is:

 (F)
A-B
  ↑
master
Now B is the HEAD. Because you used --hard, your files are reset to their state at commit B.

Ah, but suppose commit C wasn't a disaster, but just a bit off. You want to undo the commit but keep your changes for a bit of editing before you do a better commit. Starting again from here, with C as your HEAD:

   (F)
A-B-C
    ↑
  master
You can do this, leaving off the --hard:

git reset HEAD~1
In this case the result is:

   (F)
A-B-C
  ↑
master
In both cases, HEAD is just a pointer to the latest commit. When you do a git reset HEAD~1, you tell Git to move the HEAD pointer back one commit. But (unless you use --hard) you leave your files as they were. So now git status shows the changes you had checked into C. You haven't lost a thing!

For the lightest touch, you can even undo your commit but leave your files and your index:

git reset --soft HEAD~1
This not only leaves your files alone, it even leaves your index alone. When you do git status, you'll see that the same files are in the index as before. In fact, right after this command, you could do git commit and you'd be redoing the same commit you just had.

One more thing: Suppose you destroy a commit as in the first example, but then discover you needed it after all? Tough luck, right?

Nope, there's still a way to get it back. Type git reflog and you'll see a list of (partial) commit shas that you've moved around in. Find the commit you destroyed, and do this:

git checkout -b someNewBranchName shaYouDestroyed
You've now resurrected that commit. Commits don't actually get destroyed in Git for some 90 days, so you can usually go back and rescue one you didn't mean to get rid of.
    
</entry>
<entry [Mon 2012:03:26 15:32:23 EST] UNDO OR AMMEND COMMIT>

AMEND
=====

1. Add/remove files to get things the way you want:

git rm classdir
git add sourcedir

2. Amend the commit:

git commit --amend


The previous, erroneous commit will be edited to reflect the new index state - in other words, it'll be like you never made the mistake in the first place :)

Note that you should only do this if you haven't pushed yet. If you have pushed, then you'll just have to commit a fix normally.


UNDO
====

http://schacon.github.com/git/git-reset.html

Undo a commit and redo

git commit ...
git reset --soft HEAD^      # (1)
edit                        # (2)
git add ....                # (3)
git commit -c ORIG_HEAD     # (4)


This is most often done when you remembered what you just committed is incomplete, or you misspelled your commit message, or both. Leaves working tree as it was before "reset".

Make corrections to working tree files.

Stage changes for commit.

"reset" copies the old head to .git/ORIG_HEAD; redo the commit by starting with its log message. If you do not need to edit the message further, you can give -C option instead.

link|improve this answer
edited Jan 19 at 21:58

answered May 29 '09 at 18:13

Esko Luontola
19.9k42748
21	  
And if the commit was to the wrong branch, you may git checkout theRightBranch with all the changes stages. As I just had to do. – Frank Shearar Oct 5 '10 at 15:44
16	  
Be careful with that -a in point (3) it commits all changes ! – Zitrax Jan 27 '11 at 14:42
9	  
@bdonlan's answer below is much simpler than this – Horace Loeb Jan 29 '11 at 4:15
31	  
If you're working in DOS, instead of git reset --soft HEAD^ you'll need to use git reset --soft HEAD~1. The ^ is a continuation character in DOS so it won't work properly. Also, --soft is the default, so you can omit it if you like and just say git reset HEAD~1. – Kyralessa Apr 13 '11 at 14:15
3	  
(Correction to what I wrote above; --mixed is the default. --mixed means to keep the changed files, but not keep them in the index. --soft would keep the changed files and keep them in the index as they were just before the changed commit. Sorry for the confusion.) – Kyralessa Nov 17 '11 at 2:40


</entry>
<entry [Sun 2012:03:11 04:36:58 EST] git subtree VERSUS git submodules FOR bioapps AND repos>


PROBLEM WITH USING SUBMODULES IS NOT SURE IF:

    ORIGINAL COPY WILL INTERFERE WITH UPGRADES IN SUBMODULE
    
    CLONED COPY WILL CONTAIN THE SUBMODULE FOLDER OR WILL INTERFERE WITH UPGRADES IN THE SUBMODULE


EXISTING .gitmodules FILE IN /agua DEV

cat .gitmodules
    [submodule "apps-mod"]
        path = apps-mod
        url = ./apps-mod



TO DO:

CREATE bioapps SUBMODULE AND TEST TO SEE IF SUBMODULE FOLDER APPEARS IN CLONED agua:


1. REMOVE ENTRY FROM INDEX IF EXISTS

git rm --cached bioapps
    rm 'bioapps'


2. CREATE SUBMODULE

git submodule add git://github.com/agua/bioapps.git bioapps
    'bioapps' already exists in the index
    
    
This will use your existing sub-repository (i.e. it will not re-clone the source repository) and stage a .gitmodules file that looks like this:

[submodule "vendor/plugins/open_flash_chart_2"]
    path = vendor/plugins/open_flash_chart_2
    url = git://github.com/korin/open_flash_chart_2_plugin.git vendor/plugins/open_flash_chart_2

It will also make a similar entry in your main repository’s .git/config (without the path setting).

Commit that and you will have a proper submodule. When you clone the repository (or push to GitHub and clone from there), you should be able to re-initialize the submodule via git submodule update --init.



http://stackoverflow.com/questions/4161022/git-how-to-track-untracked-content/4162672#4162672

QUESTION

See below the solid line for my original question.

I have a folder in my local directory that is untracked. When I run git status, I get:

Changed but not updated:
modified:   vendor/plugins/open_flash_chart_2 (modified content, untracked content)
When I type git add vendor/plugins/open_flash_chart_2 then try git status again, it still says untracked. What's going on?

Here is a simple summary of my latest half hour:

Discovered that my Github repo is not tracking my vendor/plugins/open_flash_chart_2 plugin. Specifically, there's no content and it's showing a green arrow on the folder icon.

Tried git submodule init

No submodule mapping found in .gitmodules for path 'vendor/plugins/open_flash_chart_2'
Tried git submodule add git://github.com/korin/open_flash_chart_2_plugin.git vendor/plugins/open_flash_chart_2

vendor/plugins/open_flash_chart_2 already exists in the index
git status

modified: vendor/plugins/open_flash_chart_2 (untracked content)
Hunted for any file named .gitmodules in my repository/local directory but couldn't find one.

What do I have to do to get my submodules working so git can start tracking properly?

This may be unrelated (I include it in case it helps), but every time I type git commit -a rather than my usual git commit -m "my comments", it throws up an error:

E325: ATTENTION
Found a swap file by the name ".git\.COMMIT-EDITMSG.swp"
         dated: Thu Nov 11 19:45:05 2010
     file name: c:/san/project/.git/COMMIT_EDITMSG
      modified: YES
     user name: San   host name: San-PC
    process ID: 4268
While opening file ".git\COMMIT_EDITMSG"
         dated: Thu Nov 11 20:56:09 2010
  NEWER than swap file!  
Swap file ".git\.COMMIT_EDITMSG.swp" already exists!
[O]pen Read-Only, (E)dit anyway, (R)ecover, (D)elete it, (Q)uit, (A)bort:
Swap file ".git\.COMMIT_EDITMSG.swp" already exists!
[O]pen Read-Only, (E)dit anyway, (R)ecover, (D)elete it, (Q)uit, (A)bort:
I am a complete newbie at Github and despite trying to go through the documentation, I'm a bit stumped by these particular problems. Thank you.


ANSWER

accepted

You have added vendor/plugins/open_flash_chart_2 as “gitlink” entry, but never defined it as a submodule. Effectively you are using the internal feature that git submodule uses (gitlink entries) but you are not using the submodule feature itself.

You probably did something like this:

git clone git://github.com/korin/open_flash_chart_2_plugin.git vendor/plugins/open_flash_chart_2
git add vendor/plugins/open_flash_chart_2
This last command is the problem. The directory vendor/plugins/open_flash_chart_2 starts out as an independent Git repository. Usually such sub-repositories are ignored, but if you tell git add to explicitly add it, then it will create an gitlink entry that points to the sub-repository’s HEAD commit instead of adding the contents of the directory. It might be nice if git add would refuse to create such “semi-submodules”.

Normal directories are represented as tree objects in Git; tree objects give names, and permissions to the objects they contain (usually other tree and blob objects—directories and files, respectively). Submodules are represented as “gitlink” entries; gitlink entries only contain the object name (hash) of the HEAD commit of the submodule. The “source repository” for a gitlink’s commit is specified in the .gitmodules file (and the .git/config file once the submodule has been initialized).

What you have is an entry that points to a particular commit, without recording the source repository for that commit. You can fix this by either making your gitlink into a proper submodule, or by removing the gitlink and replacing it with “normal” content (plain files and directories).


1. Turn It into a Proper Submodule

The only bit you are missing to properly define vendor/plugins/open_flash_chart_2 as a submodule is a .gitmodules file. Normally (if you had not already added it as bare gitlink entry), you would just use git submodule add:

git submodule add git://github.com/korin/open_flash_chart_2_plugin.git vendor/plugins/open_flash_chart_2

As you found, this will not work if the path already exists in the index. The solution is to temporarily remove the gitlink entry from the index and then add the submodule:

git rm --cached vendor/plugins/open_flash_chart_2
git submodule add git://github.com/korin/open_flash_chart_2_plugin.git vendor/plugins/open_flash_chart_2

This will use your existing sub-repository (i.e. it will not re-clone the source repository) and stage a .gitmodules file that looks like this:

[submodule "vendor/plugins/open_flash_chart_2"]
    path = vendor/plugins/open_flash_chart_2
    url = git://github.com/korin/open_flash_chart_2_plugin.git vendor/plugins/open_flash_chart_2

It will also make a similar entry in your main repository’s .git/config (without the path setting).

Commit that and you will have a proper submodule. When you clone the repository (or push to GitHub and clone from there), you should be able to re-initialize the submodule via git submodule update --init.


2. Replace It with Plain Content

The next step assumes that your sub-repository in vendor/plugins/open_flash_chart_2 does not have any local history that you want to preserve (i.e. all you care about is the current working tree of the sub-repository, not the history).

If you have local history in the sub-repository that you care about, then you should backup the sub-repository’s .git directory before deleting it in the second command below. (Also consider the git subtree example below that preserves the history of the sub-repository’s HEAD).

git rm --cached vendor/plugins/open_flash_chart_2
rm -rf vendor/plugins/open_flash_chart_2/.git # BACK THIS UP FIRST unless you are sure you have no local changes in it
git add vendor/plugins/open_flash_chart_2

This time when adding the directory, it is not a sub-repository, so the files will be added normally. Unfortunately, since we deleted the .git directory there is no super-easy way to keep things up-to-date with the source repository.

You might consider using a subtree merge instead. Doing so will let you easily pull in changes from the source repository while keeping the files “flat” in your repository (no submodules). The third-party git subtree command is a nice wrapper around the subtree merge functionality.

git rm --cached vendor/plugins/open_flash_chart_2
git commit -m'converting to subtree; please stand by'
mv vendor/plugins/open_flash_chart_2 ../ofc2.local
git subtree add --prefix=vendor/plugins/open_flash_chart_2 ../ofc2.local HEAD
#rm -rf ../ofc2.local # if HEAD was the only tip with local history
Later:

git remote add ofc2 git://github.com/korin/open_flash_chart_2_plugin.git
git subtree pull --prefix=vendor/plugins/open_flash_chart_2 ofc2 master

git subtree push --prefix=vendor/plugins/open_flash_chart_2 git@github.com:me/my_ofc2_fork.git changes_for_pull_request
git subtree also has a --squash option that lets you avoid incorporating the source repository’s history into your history but still lets you pull in upstream changes.

link|improve this answer
answered Nov 12 '10 at 8:06

Chris Johnsen
14.3k21835
I just saw that you answered, Chris. Thanks very much - I'm going to go through it now. – sscirrus Nov 12 '10 at 8:10
Chris, I just tried rm -rf vendor/plugins/open_flash_chart_2/.git and it says 'rm' is not recognized. Then I tried git rm -rf vendor/plugins/open_flash_chart_2/.git and it said fatal: pathspec 'vendor/plugins/open_flash_chart_2/.git' did not match any files (but I can get there in windows explorer!). – sscirrus Nov 12 '10 at 8:14
1	  
We discussed the problem a bit in chat.The OP was able to remove the sub-repository’s .git dir and re-add the files “flatly” (the first “Plain Content” option). – Chris Johnsen Nov 12 '10 at 10:00
This saved my ass so much the other day. I had accidentally added something with a .git directory in it to my git repo, and then git kinda-sorta thought it had a submodule, which was causing my git svn dcommits to freak out. I would upvote you 3 times if I could. – notJim Apr 20 '11 at 19:29
Want to point, the third-party plugin subtree is not to be confused with subtree merge. It's not a wrapper. Author says so :P – NebulaFox Sep 16 '11 at 12:48
show 2 more comments
    
</entry>
<entry [Sat 2012:03:10 20:41:39 EST] MULTIPLE GITHUB ACCOUNTS>

SEE
[Sat 2012:03:10 20:27:38 EST] SSH CONFIGURATION FOR SPECIFIC HOST AND USER>

ADD 'Host github.com' LINES TO SSH CONFIG FILE

NB: Host AND HostName ARE IDENTICAL!

emacs -nw ~/.ssh/config

    #### GITHUB agua                                                                         
    Host github.com
    HostName github.com
    IdentityFile ~/.ssh/idents/github.com/agua/id_rsa
    User agua
    
    #### GITHUB syoung AND EC2                                                               
    Host github.com
    HostName github.com
    IdentityFile ~/.ssh/idents/github.com/syoung/id_rsa
    User syoung


    

SEE


http://help.github.com/manage-multiple-clients/

Manage multiple clients

Are you a freelance developer working on multiple projects for multiple clients, and want to manage them here on GitHub? Never fear, this guide will detail the most common solutions to this problem.

Using organization accounts

This method gives the control over the repos (and the bill) to your client, but still allows you to administrate and work in all your clients’ repos from your user account.

To start, create an organization account for your client on the free plan. Have the client create a free user account to log in with and then add this account as an owner. They can now upgrade the org to a paid plan, after which you can create and work in repos on their org account.

This approach is the cleanest, it gives the client their own account and keeps those repos within their own context. You can easily switch between each client’s org without cluttering up your personal account with their repos. Unless you or the client chooses to publicize your membership, it won’t be visible to anyone outside the org that you work in that org account.

Using your own account

This approach lets you retain control over the repos, but still gives your clients access to them. In many cases it is the cheapest route overall, though you will be stuck paying the bill yourself (unless you bill it to the client).

To use this strategy, upgrade your personal or org account to a paid plan. Now you can add private repos for the client directly to this account. If the client wishes to access the repos directly, they can create a free personal account and you can add that user as a collaborator (if the repos are on your personal account) or to a team (if the repos are on an org account). With an org account you can also give them admin access to the repo if you wish.
    
</entry>
<entry [Wed 2012:03:07 14:29:05 EST] APPROVED aquarius2 SSH KEY FOR GITHUB>

GOT THIS MESSAGE:

syoung@syoung-Satellite-L355:/agua$ git push
ERROR: Hi syoung, it's GitHub. We're doing an SSH key audit.
Please visit https://github.com/settings/ssh/audit/1064509
to approve this key so we know it's safe.
Fingerprint: a0:0d:00:4b:2f:7d:61:07:a9:ec:13:33:fa:df:84:af
fatal: The remote end hung up unexpectedly

CONFIRMED KEY ONLINE:

Please audit your SSH keys
On Sunday March 4, 2012 a security vulnerability related to SSH keys (public keys) was discovered. For your protection and to prevent unauthorized access we have disabled your public keys until you approve them.
If you have any questions at all please don't hesitate to contact support@github.com.

 syoung’s SSH keys
Please review your keys and ensure you recognize them. If you have any doubts whatsoever, reject the keys and upload new keys.

aquarius2 (a0:0d:00:4b:2f:7d:61:07:a9:ec:13:33:fa:df:84:af)


WAS ABLE TO PUSH:

syoung@syoung-Satellite-L355:/agua$ git push
Counting objects: 25, done.
Compressing objects: 100% (13/13), done.
Writing objects: 100% (13/13), 2.33 KiB, done.
Total 13 (delta 11), reused 0 (delta 0)
To git@github.com:syoung/aguadev
   91c7587..e7dd963  master -> master

    
</entry>
<entry [Mon 2012:03:05 14:36:57 EST] FIXED SUBMODULE ERROR>

PROBLEM

THERE APPEARS TO BE A SUBMODULE ALTHOUGH NONE HAS BEEN CREATED

cd /agua/repos/public/agua/biorepository/agua
git add workflows/projects/ workflows/workflows.pm
    fatal: Path 'agua/workflows/projects/' is in submodule 'agua/workflows'
    
cd /agua/repos/public/agua/biorepository
git submodule status
    No submodule mapping found in .gitmodules for path 'agua/workflows'


DIAGNOSIS

NO .gitmodules FILE
NO ENTRY IN .git/config.

CHECKED agua/workflows DIR AND FOUND .git DIRECTORY INSIDE IT


SOLUTION

REMOVE agua/workflows/.git
    
    
    
</entry>
<entry [Mon 2012:03:05 11:45:05 EST] 'ORPHAN' CHECKOUT POSSIBLE QUICK ALTERNATIVE TO archive.pl>

git checkout --help

       --orphan
           Create a new orphan branch, named < new_branch >, started from
           < start_point > and switch to it. The first commit made on this new
           branch will have no parents and it will be the root of a new
           history totally disconnected from all the other branches and
           commits.

           The index and the working tree are adjusted as if you had
           previously run "git checkout < start_point >". This allows you to
           start a new history that records a set of paths similar to
           < start_point > by easily running "git commit -a" to make the root
           commit.

           This can be useful when you want to publish the tree from a commit
           without exposing its full history. You might want to do this to
           publish an open source branch of a project whose current tree is
           "clean", but whose full history contains proprietary or otherwise
           encumbered bits of code.

           If you want to start a disconnected history that records a set of
           paths that is totally different from the one of < start_point >, then
           you should clear the index and the working tree right after
           creating the orphan branch by running "git rm -rf ." from the top
           level of the working tree. Afterwards you will be ready to prepare
           your new files, repopulating the working tree, by copying them from
           elsewhere, extracting a tarball, etc.
    
</entry>
<entry [Sun 2012:03:04 22:43:08 EST] FIX 'DETACHED HEAD' STATE AND RETURN TO MASTER>

PROBLEM:

YOU ARE IN DETACHED HEAD MODE AND SEVERAL COMMITS AHEAD OF 'master'


SOLUTION:

CREATE A BRANCH FOR THE CURRENT STATE AND MERGE IT WITH 'master'

git checkout 0b42240
    Note: checking out '0b42240'.
    
    You are in 'detached HEAD' state. You can look around, make experimental
    changes and commit them, and you can discard any commits you make in this
    state without impacting any branches by performing another checkout.

git branch tempbranch 0b422409bf56891f867c895a871fc0557375d438
git checkout master
git merge tempbranch
    OK
    HEAD is now at 0b42240... -Fix: Renabled load app file tests.
    

</entry>
<entry [Thu 2012:02:23 14:41:50 EST] DISABLED vc-git BECAUSE OF SLOW EMACS LOAD>

PROBLEM:

I'm using emacs over sshfs and a git repository. I enjoy using the git command line and so for this project I do not need vc-git enabled. How do I prevent the loading of vc-git by a .emacs command?

SOLUTION:

EDIT .emacs FILE:
http://www.mygooglest.com/fni/dot-emacs.html


http://stackoverflow.com/questions/5748814/how-does-one-disable-vc-git-in-emacs

This should disable the backend:

(remove-hook 'find-file-hooks 'vc-find-file-hook)

you might need a (require 'vc) before the above line to get the timing right. Or perhaps wrap it like so:

(eval-after-load "vc" '(remove-hook 'find-file-hooks 'vc-find-file-hook))
to get the timing right.

link|improve this answer
answered Apr 21 '11 at 19:48

Trey Jackson
31.4k24071
1	  
My emacs now loads about 99999999x faster, thank you! – John Hunt Jan 18 at 23:54
feedback



Remove git from the list of backends handled by vc-mode:

(delete 'Git vc-handled-backends)
or remove all source control hooks:

(setq vc-handled-backends ())


answered May 31 '11 at 16:02

I'd also really recommend magit (a different emacs git mode.) I, too, prefer command line for everything but this one's really well done and allows you to code more and "git" less. Particularly staging and unstaging code / seeing a diff of your changes before sending them out, viewing stashes, and pulling / pushing while staying inside of emacs is great.

link|improve this answer
    
</entry>
<entry [Wed 2012:02:22 23:07:37 EST] USE git rebase TO SQUASH COMMITS>


git ready
http://gitready.com/advanced/2009/02/10/squashing-commits-with-rebase.html

learn git one commit at a time
by Nick Quaranto
squashing commits with rebase
committed 10 Feb 2009


The rebase command has some awesome options available in its --interactive (or -i) mode, and one of the most widely used is the ability to squash commits. What this does is take smaller commits and combine them into larger ones, which could be useful if you’re wrapping up the day’s work or if you just want to package your changes differently. We’re going to go over how you can do this easily.
A word of caution: Only do this on commits that haven’t been pushed an external repository. If others have based work off of the commits that you’re going to delete, plenty of conflicts can occur. Just don’t rewrite your history if it’s been shared with others.
So let’s say you’ve just made a few small commits, and you want to make one larger commit out of them. Our repository’s history currently looks like this:

The last 4 commits would be much happier if they were wrapped up together, so let’s do just that through interactive rebasing:
$ git rebase -i HEAD~4
    
</entry>
<entry [Wed 2012:02:22 22:45:25 EST] git pull VERSUS git fetch>
    
http://stackoverflow.com/questions/292357/whats-the-difference-between-git-pull-and-git-fetch

In the simplest terms, "git pull" does a "git fetch" followed by a "git merge".

You can do a "git fetch" at any time to update your local copy of a remote branch. This operation never changes any of your own branches and is safe to do without changing your working copy. I have even heard of people running "git fetch" periodically in a cron job in the background (although I wouldn't recommend doing this).

A "git pull" is what you would do to bring your repository up to date with a remote repository.
git pull will always merge into the current branch. So you select which branch you want to pull from, and it pulls it into the current branch. The from branch can be local or remote; it can even be a remote branch that's not a registered git remote (meaning you pass a URL on the git pull command line).


</entry>
<entry [Wed 2012:02:22 22:36:29 EST] USED git fetch TO GET THE LATEST COMMITS FROM THE REMOTE>

PROBLEM:
git pull DOES NOT GET THE LATEST COMMITS

SOLUTION:

ON AQUARIUS-8F2

cd /agua
git tag
    0.7.3
    0.7.5+build1
    0.7.5+build2
    0.7.5+build3
    0.7.5+build4
    0.7.5+build5
    0.7.5+build6


git fetch github master
    remote: Counting objects: 91, done.
    remote: Compressing objects: 100% (27/27), done.
    remote: Total 59 (delta 45), reused 43 (delta 29)
    Unpacking objects: 100% (59/59), done.
    From git://github.com/agua/agua
     * branch            master     -> FETCH_HEAD

cd /agua
git commit -a
[detached HEAD f33e487] Fetched - Edited home.css to fix progress pane. Added bioapps and biorepository.
 3 files changed, 14 insertions(+), 9 deletions(-)
 create mode 160000 bioapps
 create mode 160000 repos/public/agua/biorepository


USING THE --tags OPTION GETS ALL THE LATEST TAGS:

git fetch github master --tags
    remote: Counting objects: 94, done.
    remote: Compressing objects: 100% (30/30), done.
    remote: Total 62 (delta 45), reused 46 (delta 29)
    Unpacking objects: 100% (62/62), done.
    From git://github.com/agua/agua
     * branch            master     -> FETCH_HEAD
     - [tag update]      0.7.5+build6 -> 0.7.5+build6
     * [new tag]         0.7.5+build7 -> 0.7.5+build7
     * [new tag]         0.7.5+build8 -> 0.7.5+build8


git describe --abbrev=0 --tags
    0.7.5+build7


CAN NOW CHECK OUT LATEST VERSION:

git checkout 0.7.5+build8
    warning: unable to rmdir bioapps: Directory not empty
    warning: unable to rmdir repos/public/agua/biorepository: Directory not empty
    Previous HEAD position was f33e487... Fetched - Edited home.css to fix progress pane. Added bioapps and biorepository.
    HEAD is now at 32108e7... Fixed Home Pane progress panel CSS WIDTH AND HEIGHT

git log --decorate --graph --oneline
    * 32108e7 (HEAD, tag: 0.7.5+build8) Fixed Home Pane progress panel CSS 
    * d05689d (tag: 0.7.5+build7) REPEAT: Fixed Home Pane progress panel
    * d02c828 [0.7.5+build6] Fixed Home Pane progress panel
    * 9a1c76b (tag: 0.7.5+build6) [0.7.5+build7] Removed DBI, etc. from per
    * ad540e4 Moved install.log to /tmp. Added transfer.pl to automate dev-
    * dbad6d9 [0.7.5+build4] Uncommented clone/push, perlmods, etc.
    * a43ae4e (tag: 0.7.5+build4) [0.7.5+build3] Added conf file shift to a
    * ae3e8b0 (tag: 0.7.5+build3, master) [0.7.5+build2] After merge branch
    *   b2b82df (tag: 0.7.5+build2) Merge branch 'master' of ssh://173.230.
    |\  
    | * 7170238 empty first commit
    * c4680b1 [0.7.5+build1] Fixed workflow stages insert and parameter che
    * a624b9a (tag: 0.7.5+build1) [0.7.3] Completed bioapps.pm installer
    * 7d7ca91 (tag: 0.7.3) First commit.
   
    
</entry>
<entry [Wed 2012:02:22 13:40:42 EST] ENABLED PUSH BY syoung BY COPYING ROOT SSH KEY>

mkdir -p /home/syoung/.ssh/idents/github.com/syoung
sudo cp /root/.ssh/idents/root/id_rsa /home/syoung/.ssh/idents/github.com/syoung/id_rsa
sudo chown syoung:syoung /home/syoung/.ssh/idents/github.com/syoung/id_rsa


</entry>
<entry [Mon 2012:02:20 10:19:24 EST] REMOVE A LOCAL TAG THAT IS NO LONGER ON THE REMOTE>

1. REMOVE ALL LOCAL TAGS

git tag -l | xargs git tag -d


2. DOWNLOAD ALL CURRENT TAGS FROM REMOTE

git fetch



http://stackoverflow.com/questions/1841341/remove-local-tags-that-are-no-longer-on-the-remote-repository

I didn't want to write a script so sought a different solution. The key is discovering that you can delete a tag locally, then use git fetch to "get it back" from the remote server. If the tag doesn't exist on the remote, then it will remain deleted.

Thus you need to type two lines in order:

$ git tag -l | xargs git tag -d

$ git fetch

These:

Delete all tags from the local repo. FWIW, xargs places each tag output by "tag -l" onto the command line for "tag -d". Without this, git won't delete anything because it doesn't read stdin (silly git).

Fetch all active tags from the remote repo.

This even works a treat on Windows.


    
</entry>
<entry [Mon 2012:02:20 10:05:01 EST] REMOVE TAGS ON GITHUB REMOTE>

cd /repos/public/agua/agua
git tag -d 0.6.0
git push origin :refs/tags/0.6.0

    To https://github.com/agua/agua.git
     - [deleted]         0.6.0

git tag -d 0.7.0
git push origin :refs/tags/0.7.0

git tag -d 0.7.1
git push origin :refs/tags/0.7.1


NOTES
=====

Removing Git Tag On Remote Repository
http://devlicio.us/blogs/mike_nichols/archive/2010/05/27/removing-git-tag-on-remote-repository.aspx

I needed to remove a tag from a remote repository @ github.

Here’s the command locally:

git tag –d MYTAG

Then this:

git push origin :refs/tags/MYTAG




Git: remove a tag or branch on the remote server
http://danilodellaquila.com/blog/git-remove-a-tag-or-branch-on-the-remote-server

Here you can find the commands to remove a tag or a branch from a remote Git repository.
I find difficult to remember the Git commands to remove a remote tag or a branch on the remote server.

Scott Chacon actually explain it well in his ProGit book.

A way to remember this command is by recalling the git push [remotename] [localbranch]:[remotebranch] If you leave off the [localbranch] portion, then you’re basically saying, "Take nothing on my side and make it be [remotebranch]".

Then to remove we actually push an empty branch/tag to the branch on remote.

So let say our remotename is origin and remotebranch is serverfix, then to remove a remote branch:

$ git push origin :serverfix
and to remove a tag on the remote server:

$ git push origin :refs/tags/serverfix
    
</entry>
<entry [Mon 2012:02:20 03:17:24 EST] HOW TO DETACH A SUBDIRECTORY INTO A SEPARATE GIT REPOSITORY>

http://stackoverflow.com/questions/359424/detach-subdirectory-into-separate-git-repository/359759#359759

QUESTION

I have a Git repository which contains a number of subdirectories. Now I have found that one of the subdirectories is unrelated to the other and should be detached to a separate repository.

How can I do this while keeping the history of the files within the subdirectory?

I guess I could make a clone and remove the unwanted parts of each clone, but I suppose this would give me the complete tree when checking out an older revision etc. This might be acceptable, but I would prefer to be able to pretend that the two repositories doesn't have a shared history.

Just to make it clear, I have the following structure:

XYZ/
    .git/
    XY1/
    ABC/
    XY2/
But I would like this instead:

XYZ/
    .git/
    XY1/
    XY2/
ABC/
    .git/
    ABC/


ANSWER

You want to clone your repository and then use git filter-branch to mark everything but the subdirectory you want in your new repo to be garbage-collected. To clone your local repository:

 $ git clone /XYZ /ABC
EDIT: the repository will be cloned using hard-links, but that is not a problem since the hardlinked files will not be modified in themselves - new ones will be created.

EDIT: Now, let us preserve the interesting branches which we want to rewrite as well, and then remove the origin to avoid pushing there and to make sure that old commits will not be referenced by the origin:

 $ for i in branch1 br2 br3; do git branch -t $i origin/$i; done
 $ git remote rm origin
EDIT: Now you might want to also remove tags which have no relation with the subproject; you can also do that later, but you might need to prune your repo again. I did not do so and got a WARNING: Ref 'refs/tags/v0.1' is unchanged for all tags (since they were all unrelated to the subproject); additionally, after removing such tags more space will be reclaimed. Apparently git filter-branch should be able to rewrite other tags, but I could not verify this. If you want to remove all tags, use git tag -l | xargs git tag -d.

EDIT: Then use filter-branch and reset to exclude the other files, so they can be pruned. Let's also add --tag-name-filter cat --prune-empty to remove empty commits and to rewrite tags (note that this will have to strip their signature):

 $ git filter-branch --tag-name-filter cat --prune-empty --subdirectory-filter ABC -- --all
or alternatively, to only rewrite the HEAD branch and ignore tags and other branches:

 $ git filter-branch --tag-name-filter cat --prune-empty --subdirectory-filter ABC HEAD
Then delete the backup reflogs so the space can be truly reclaimed (although now the operation is destructive)

 $ git reset --hard
 $ git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
 $ git reflog expire --expire=now --all
 $ git gc --aggressive --prune=now
and now you have a local git repository of the ABC sub-directory with all its history preserved.

EDIT -- For most uses, git filter-branch should indeed have the added parameter -- --all. (Yes that's really dash dash space dash dash all. This needs to be the last parameters for the command.) As Matli discovered, this keeps the project branches and tags included in the the new repo.

EDIT: various suggestions from comments below were incorporated to make sure, for instance, that the repository is actually shrunk (which was not always the case before).

link|improve this answer
edited 7 hours ago

Blaisorblade
2,369716
answered Dec 11 '08 at 15:40

Paul
6,80311517
14	  
Very good answer. Thanks! And to really get exactly what I wanted, I added "-- --all" to the filter-branch command. – matli Dec 12 '08 at 9:17
7	  
Why do you need --no-hardlinks? Removing one hardlink won't affect the other file. Git objects are immutable too. Only if you'd change owner/file permissions you need --no-hardlinks. – vdboor Feb 1 '10 at 9:58
39	  
An additional step I would recommend would be "git remote rm origin". This would keep pushes from going back to the original repository, if I'm not mistaken. – Tom Apr 5 '10 at 19:51
5	  
Another command to append to filter-branch is --prune-empty, to remove now-empty commits. – Seth Johnson Sep 12 '11 at 2:31
3	  
Like Paul, I did not want project tags in my new repo, so I did not use -- --all. I also ran git remote rm origin, and git tag -l | xargs git tag -d before the git filter-branch command. This shrunk my .git directory from 60M to ~300K. Note that I needed to run both of these commands to in order to get the size reduction. – saltycrane Nov 17 '11 at 21:18



51
down vote
Paul's answer above creates a new repository containing /ABC, but does not remove /ABC from within /XYZ. The following command will remove /ABC from within /XYZ:

git filter-branch --tree-filter "rm -rf ABC" --prune-empty HEAD
Of course, test it in a 'clone --no-hardlinks' repository first, and follow it with the reset, gc and prune commands Paul lists.

link|improve this answer
answered Jun 5 '09 at 13:15

pgs
1,550610
20	  
make that git filter-branch --index-filter "git rm -r -f --cached --ignore-unmatch ABC" --prune-empty HEAD and it will be much faster. index-filter works on the index while tree-filter has to checkout and stage everything for every commit. – fmarc Sep 17 '09 at 19:58
14	  
in some cases messing up the history of repository XYZ is overkill ... just a simple "rm -rf ABC; git rm -r ABC; git commit -m'extracted ABC into its own repo'" would work better for most people. – Evgeny Oct 28 '10 at 23:24
You probably wish to use -f (force) on this command if you do it more than once, e.g., to remove two directories after they have been separated. Otherwise you will get "Cannot create a new backup." – Brian Carlton Apr 18 '11 at 17:59
fmarc: Thanks for the tip. Was a huge improvement in speed. (30 secs instead of 3 minutes) – Magnus Skog Sep 16 '11 at 15:16
1	  
If you're doing the --index-filter method, you may also want to make that git rm -q -r -f, so that each invocation won't print a line for each file it deletes. – Eric Naeseth Oct 12 '11 at 19:55
feedback


</entry>
<entry [Mon 2012:02:20 03:02:33 EST] USE 'git --checkout-index' TO DO 'svn export'>


cd /agua    
git checkout-index -f -a --prefix=/tmp/agua/

#### NB: NOTE THE TRAILING SLASH IS NEEDED!!


NOTES
=====

exporting your repository


Previously there was a tip that covered sharing changes but that included all of your repository’s history. What if you just want to export a certain commit’s changes? Or just one folder? What if you wanted to make an archive of the repository for backup? Fear not, for Git can do all that and more. Thanks to Stack Overflow for providing with some helpful hints to add into this post.
If your need is to just make a quick backup of your repository, doing a git archive will help. So if you wanted to get zip file packed with your repository’s files:

git archive HEAD --format=zip > archive.zip

The archive command normally packages repos in tarballs, so you can easily pipe it to your favorite data compression program:

git archive HEAD | gzip > archive.tar.gz

You can also archive a remote using the --remote=<repo> option. Just be aware that this does not work with GitHub remotes, as they encourage you to use the download button instead. With any other remote it should work fine though, and check the manpage if you’re having issues.


What if you don’t want a compressed version of the files? That’s possible too thanks to the checkout-index command. Basically, it copies everything on your index into a different folder. Exporting your repo would then be:

git checkout-index -f -a --prefix=/path/to/folder/

The -f option overwrites files, and the -a option means all files and folders. Just don’t forget the trailing slash on the --prefix option, as it’s very important! Omitting it will make the command think you want to prefix every file name with that argument instead.
If you wanted to just export a specific file or folder (in this case everything in the bin/ folder and the readme):
git checkout-index -f --prefix=/path/to/folder/ bin/* README.textile
Nice! You can also chain this command with find if you wanted to export all header files for example. Check out all you can do with checkout-index at its manpage. Daniel Schierbeck has wrapped this process up into a little script called git-export that is worth a look if you need to do this often.



</entry>
<entry [Thu 2012:02:16 02:22:27 EST] BASIC GIT MERGE>

Basic Branching and Merging
http://book.git-scm.com/3_basic_branching_and_merging.html

A single git repository can maintain multiple branches of development. To create a new branch named "experimental", use

$ git branch experimental
If you now run

$ git branch
you'll get a list of all existing branches:

  experimental
* master
The "experimental" branch is the one you just created, and the "master" branch is a default branch that was created for you automatically. The asterisk marks the branch you are currently on; type

$ git checkout experimental
to switch to the experimental branch. Now edit a file, commit the change, and switch back to the master branch:

(edit file)
$ git commit -a
$ git checkout master
Check that the change you made is no longer visible, since it was made on the experimental branch and you're back on the master branch.

You can make a different change on the master branch:

(edit file)
$ git commit -a
at this point the two branches have diverged, with different changes made in each. To merge the changes made in experimental into master, run

$ git merge experimental
If the changes don't conflict, you're done. If there are conflicts, markers will be left in the problematic files showing the conflict;

$ git diff
will show this. Once you've edited the files to resolve the conflicts,

$ git commit -a
will commit the result of the merge. Finally,

$ gitk
will show a nice graphical representation of the resulting history.

At this point you could delete the experimental branch with

$ git branch -d experimental
This command ensures that the changes in the experimental branch are already in the current branch.

If you develop on a branch crazy-idea, then regret it, you can always delete the branch with

$ git branch -D crazy-idea
Branches are cheap and easy, so this is a good way to try something out.

How to merge

You can rejoin two diverging branches of development using git merge:

$ git merge branchname
merges the changes made in the branch "branchname" into the current branch. If there are conflicts--for example, if the same file is modified in two different ways in the remote branch and the local branch--then you are warned; the output may look something like this:

$ git merge next
 100% (4/4) done
Auto-merged file.txt
CONFLICT (content): Merge conflict in file.txt
Automatic merge failed; fix conflicts and then commit the result.
Conflict markers are left in the problematic files, and after you resolve the conflicts manually, you can update the index with the contents and run git commit, as you normally would when modifying a file.

If you examine the resulting commit using gitk, you will see that it has two parents: one pointing to the top of the current branch, and one to the top of the other branch.

Resolving a merge

When a merge isn't resolved automatically, git leaves the index and the working tree in a special state that gives you all the information you need to help resolve the merge.

Files with conflicts are marked specially in the index, so until you resolve the problem and update the index, git commit will fail:

$ git commit
file.txt: needs merge
Also, git status will list those files as "unmerged", and the files with conflicts will have conflict markers added, like this:

<<<<<<< HEAD:file.txt
Hello world
=======
Goodbye
>>>>>>> 77976da35a11db4580b80ae27e8d65caf5208086:file.txt
All you need to do is edit the files to resolve the conflicts, and then

$ git add file.txt
$ git commit
Note that the commit message will already be filled in for you with some information about the merge. Normally you can just use this default message unchanged, but you may add additional commentary of your own if desired.

The above is all you need to know to resolve a simple merge. But git also provides more information to help resolve conflicts:

Undoing a merge

If you get stuck and decide to just give up and throw the whole mess away, you can always return to the pre-merge state with

$ git reset --hard HEAD
Or, if you've already committed the merge that you want to throw away,

$ git reset --hard ORIG_HEAD
However, this last command can be dangerous in some cases--never throw away a commit if that commit may itself have been merged into another branch, as doing so may confuse further merges.

Fast-forward merges

There is one special case not mentioned above, which is treated differently. Normally, a merge results in a merge commit with two parents, one for each of the two lines of development that were merged.

However, if the current branch has not diverged from the other--so every commit present in the current branch is already contained in the other--then git just performs a "fast forward"; the head of the current branch is moved forward to point at the head of the merged-in branch, without any new commits being created.
    
</entry>
<entry [Fri 2012:02:10 04:40:37 EST] ADDED saveStash TO Install.pm TO PROTECT CHANGES AND ENABLE PULL>

HEAD is now at 4c22ea9... First commit.
Filehandle STDERR reopened as $oldout only for input at /agua/cgi-bin/lib/Agua/Ops.pm line 225.
cp: cannot stat `/agua/bioapps/conf/default.conf': No such file or directory
chmod: cannot access `/tmp/default.conf.9453.44746167141': No such file or directory
From git://github.com/agua/bioapps
 * branch            HEAD       -> FETCH_HEAD
Fetching tags only, you probably meant:
  git fetch --tags
mv: cannot stat `/tmp/default.conf.9453.44746167141': No such file or directory
Warning: you are leaving 3 commits behind, not connected to
any of your branches:

  dac6066 Merge branch 'master' of github.com:agua/bioapps
  1cd3561 First commit.
  ffb73a4 [0.7.2] Second patch increment

If you want to keep them by creating a new branch, this may be a good time
to do so with:

 git branch new_branch_name dac60660325a2164c4b639dc182c9b766e108e9d

HEAD is now at 4c22ea9... First commit.
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   163  100   163    0     0    390      0 --:--:-- --:--:-- --:--:--  1044
{ status: 'installing', url: '/var/www/html/agua/log/bioapps-upgradelog.html', version: '0.7.0' }cp: cannot stat `/agua/bioapps/conf/default.conf': No such file or directory
chmod: cannot access `/tmp/default.conf.1311.0213699241': No such file or directory
From git://github.com/agua/bioapps
 * branch            HEAD       -> FETCH_HEAD
Fetching tags only, you probably meant:
  git fetch --tags
mv: cannot stat `/tmp/default.conf.1311.0213699241': No such file or directory
Warning: you are leaving 3 commits behind, not connected to
any of your branches:

  dac6066 Merge branch 'master' of github.com:agua/bioapps
  1cd3561 First commit.
  ffb73a4 [0.7.2] Second patch increment

If you want to keep them by creating a new branch, this may be a good time
to do so with:

 git branch new_branch_name dac60660325a2164c4b639dc182c9b766e108e9d

HEAD is now at 4c22ea9... First commit.

    
</entry>
<entry [Thu 2012:02:09 09:42:45 EST] FIXED ERROR 'Permission to syoung/biorepository.git denied to agua.'>

PROBLEM:

cd /repos/public/agua/biorepository
git push github master
    ERROR: Permission to syoung/biorepository.git denied to agua.
    fatal: The remote end hung up unexpectedly


DIAGNOSIS:

1. WRONG SSH KEY FILE SPECIFIED IN /agua/conf/envars.sh

cat /agua/conf/envars.sh 
#!/bin/sh

#export login=aguadev
#export password=rst2agua
#export token=aea15db372b296bc5473dc6dae6cfc3c26ac2c60
export login=syoung
export password=rst2github
export token=ded526622a10cfaaea0134662696b748ff666696
export keyfile=/root/.ssh/id_rsa
export curlfile=/agua/conf/curl.txt


THE keyfile IS USED BY Agua::Ops::GitHub::setGitSsh IN A SHELL SCRIPT:

exec ssh -i \$GITSSH_KEYFILE -o "StrictHostKeyChecking no" "\$\@"

NB: MUST BACKSLASH ALL $s AND @s!!!



SOLUTION:

1. CHANGE THE KEY FILE in /agua/conf/envars.sh

#export keyfile=/root/.ssh/id_rsa
export keyfile=/home/syoung/.ssh/id_rsa


... AND SOURCE THE SCRIPT:

source /agua/conf/envars.sh


3. CLEAR THE ssh-agent, JUST IN CASE

ssh-add -D

4. COMMENT OUT THE agua KEY ENTRY IN /home/syoung/.ssh/config

#    #### GITHUB agua
#    Host github.com
#    HostName github.com
#    IdentityFile ~/.ssh/idents/github.com/agua/id_rsa
#    User agua
#


5. TRY PUSHING

cd /agua/t/bin/Agua/Common/Package/Upgrade/outputs/source;
git push --tags 

<!--
    fatal: No configured push destination.
    Either specify the URL from the command-line or configure a remote repository using
    
        git remote add <name> <url>
    
    and then push using the remote name
    
        git push <name>
-->



NOTES
=====

ALTERNATIVE DIAGNOSIS AND SOLUTION:


SSH config FILE LISTS agua USER FIRST



# cat /home/syoung/.ssh/config
    # SSH config file
    
    #### BITBUCKET stuartpyoung (aquarius2)
    Host bitbucket.org
    HostName bitbucket.org
    IdentityFile ~/.ssh/idents/bitbucket.org/stuartpyoung/id_rsa
    User stuartpyoung
    
    #### GITHUB agua
    Host github.com
    HostName github.com
    IdentityFile ~/.ssh/idents/github.com/agua/id_rsa
    User agua
    
    #### GITHUB syoung AND EC2
    Host github.com
    HostName github.com
    IdentityFile ~/.ssh/idents/github.com/syoung/id_rsa
    User syoung    
    
    #### GITHUB GENERAL
    IdentityFile ~/.ssh/idents/%h/id_rsa
    IdentityFile ~/.ssh/idents/%h/id_dsa
    IdentityFile ~/.ssh/id_rsa
    
    #### GENERAL AQUARIUS PRIVATE KEY
    IdentityFile ~/.ssh/id_dsa


NB:

AGUA ACCOUNT SSH KEY: aquarius4 
d7:a8:b2:a4:33:d8:af:e5:3f:d3:f5:b8:a6:2c:48:5d

syoung ACCOUNT SSH KEY: aquarius2
a0:0d:00:4b:2f:7d:61:07:a9:ec:13:33:fa:df:84:af)




gitssh.sh FILE
--------------


SEE https://gist.github.com/3088550

SCRIPTS

github.sh
---------
#!/bin/bash
# Author: Jonathan Harker <jesusaur@cat.pdx.edu>

REPO=GitHubUser/GitHubRepo.git
KEY="/full/path/to/github.key"

case "$1" in

# Use case 1:
# Call 'github.sh all' in post-receive hook
"all")
  echo "Mirroring to github.com"
  export GIT_SSH="$0"
  git push --mirror git@github.com:$REPO
;;

# Use case 2:
# Call 'github.sh push' in update hook
"push")
  echo "Mirroring branch to github"
  export GIT_SSH="$0"
  git push git@github.com:$REPO $2
;;

# Recursive call to ourselves
*)
  exec ssh -i $KEY -o "StrictHostKeyChecking no" "$@"
;;

esac

exit 0


post-receive
------------
<!--
#!/bin/sh
# Author: Jonathan Harker <jesusaur@cat.pdx.edu>

# push all changes, making new branches and deleting non-existent branches
/full/path/to/github.sh all

-->

update
------

<!--
#!/bin/sh
# Author: Jonathan Harker <jesusaur@cat.pdx.edu>

# Push to github
/full/path/to/github.sh push $@

-->







http://help.github.com/ssh-issues/

    Permission to user/repo2 denied to user/repo1
    
    This error occurs when you attach your key as a deploy key on repo1. You can push and pull from that repo without issue, but you won’t have access to any other repo with your key. To solve this, remove the key from repo1’s deploy keys and attach it on your account page instead. This key will now have access to all repos your account has access to.



USE ssh -v TO CHECK WHICH KEYS SSH IS USING
-------------------------------------------

ssh -vT git@github.com

    OpenSSH_5.8p1 Debian-7ubuntu1, OpenSSL 1.0.0e 6 Sep 2011
    debug1: Reading configuration data /home/syoung/.ssh/config
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: Applying options for *
    debug1: Connecting to github.com [207.97.227.239] port 22.
    debug1: Connection established.
    debug1: identity file /home/syoung/.ssh/idents/github.com/syoung/id_rsa type -1
    debug1: identity file /home/syoung/.ssh/idents/github.com/syoung/id_rsa-cert type -1
    debug1: identity file /home/syoung/.ssh/idents/github.com/syoung/id_dsa type -1
    debug1: identity file /home/syoung/.ssh/idents/github.com/syoung/id_dsa-cert type -1
    debug1: identity file /home/syoung/.ssh/idents/github.com/id_rsa type -1
    debug1: identity file /home/syoung/.ssh/idents/github.com/id_rsa-cert type -1
    debug1: identity file /home/syoung/.ssh/idents/github.com/id_dsa type -1
    debug1: identity file /home/syoung/.ssh/idents/github.com/id_dsa-cert type -1
    debug1: identity file /home/syoung/.ssh/id_rsa type -1
    debug1: identity file /home/syoung/.ssh/id_rsa-cert type -1
    debug1: identity file /home/syoung/.ssh/id_dsa type -1
    debug1: identity file /home/syoung/.ssh/id_dsa-cert type -1
    debug1: Remote protocol version 2.0, remote software version OpenSSH_5.1p1 Debian-5github2
    ...
    Hi syoung! You've successfully authenticated, but GitHub does not provide shell access.
    
    
</entry>
<entry [Wed 2012:02:08 16:44:20 EST] REMOVE BINARIES IN EARLIER COMMITS>

http://stackoverflow.com/questions/250238/collapsing-a-git-repositorys-history
    
</entry>
<entry [Sun 2012:02:05 19:35:56 EST] CREATED bioapps REPO FOR agua GITHUB USER>

mkdir -p /repos/public/bioapps
cd /repos/public/bioapps
cp -r /agua/0.6/bioapps/* .
rm -fr t
git remote add github git@github.com:agua/bioapps

/agua/0.6/bin/scripts/version.pl --repodir /repos/public/bioapps --version 0.7.0 --description "First commit" 

    Created new version: 0.7.0

root@syoung-Satellite-L355:/repos/public/bioapps# /agua/0.6/bin/scripts/version.pl --repodir /repos/public/bioapps --version 0.7.1 --description "First patch increment"

    Created new version: 0.7.1

root@syoung-Satellite-L355:/repos/public/bioapps# /agua/0.6/bin/scripts/version.pl --repodir /repos/public/bioapps --version 0.7.2 --description "Second patch increment"

    Created new version: 0.7.2


cd /repos/public/bioapps
git push github master

    Counting objects: 233, done.
    Compressing objects: 100% (230/230), done.
    Writing objects: 100% (233/233), 535.38 KiB, done.
    Total 233 (delta 54), reused 0 (delta 0)
    To git@github.com:agua/bioapps
     * [new branch]      master -> master

cd /repos/public/bioapps
git push github master --tags
    Counting objects: 3, done.
    Compressing objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 459 bytes, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To git@github.com:agua/bioapps
     * [new tag]         0.7.0 -> 0.7.0
     * [new tag]         0.7.1 -> 0.7.1
     * [new tag]         0.7.2 -> 0.7.2

    
</entry>
<entry [Sun 2012:02:05 10:43:55 EST] CREATED aquarius4 SSH KEY FOR agua GITHUB USER AND UPLOADED DRAFT FIRST RELEASE OF AGUA>

1. CREATED openSSH FORMAT PUBLIC KEY:

cd /home/syoung/agua/cloud/AWS/keypair/syoung
mkdir aquarius4
cd aquarius4

ssh-keygen -t rsa -C "stuartpyoung@gmail.com"

Enter file in which to save the key (/home/syoung/.ssh/id_rsa):

/home/syoung/agua/cloud/AWS/keypair/syoung/aquarius4/id_rsa

Enter file in which to save the key (/root/.ssh/id_rsa): /home/syoung/agua/cloud/AWS/keypair/syoung/aquarius4/id_rsa

    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /home/syoung/agua/cloud/AWS/keypair/syoung/aquarius4/id_rsa.
    Your public key has been saved in /home/syoung/agua/cloud/AWS/keypair/syoung/aquarius4/id_rsa.pub.
    The key fingerprint is:
    d7:a8:b2:a4:33:d8:af:e5:3f:d3:f5:b8:a6:2c:48:5d stuartpyoung@gmail.com
    The key's randomart image is:
    +--[ RSA 2048]----+
    |                 |
    |                 |
    |                 |
    |          Eo     |
    |       .S.o .    |
    |      . .o  .    |
    |   o .+... . o   |
    |  . +=.o+.. o .  |
    |    o=+..+oo..   |
    +-----------------+


aquarius4 PRIVATE KEY:

-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAw4yl6eyxIXMnpxCzbO+8ytyNEI2lo6s8QiG9KHB+gb+hzUTr
IQCHjrtpx575mlTPUMBhmfWKCShmYSjIFKclEnZsXBvz9Qx5ZuKd1XFt4P0bjyFJ
XYXX4gd/4o5fEOIg0eHH1qdGZOHV82M/NA3/JqYDuHEa1W23L1PmVBVQEUARYCLk
gJ+K+hMH0QgTdOlkHyRvLFC5sk8VLRvKZR9I1qkAHlRKvV9JTnsikirx7s5MyVWh
hDq6c34izz0p3HK+H+EKyGguXf49ifYYEvMPEbhszpKo1/BCqJI4k9JSMT5jsr1r
pGU+G0eWSfSgb7T/RKnjZ+RVffJcczPwkZ12VwIDAQABAoIBAESl+IzhgeFrSq1U
qJiCpPVWbdM01sRZVcMlkwFCVLb57jRgkGa6h9wsoNrqTVfHlCwWDW1+DGJgo2hS
Z8MQVmxf1HSVf5Q0N95NifknY9qLIISju9ywIvR/i36eWnNT3w+vQndxq724pmJW
IhcFHuCTgVTbp/7rEFb2DjLQdJZJGVcbXK2yGWS/SlFArYZvA43yfQ4Icnt5i3CF
NGlE9QvxlkGMdvIO1jdV8Cs+fZuFUXsiLWUyTkWm7n4zWWYOD2RJJoo8SOuqDwIt
+RYAbJHbJCSEpa+v9UGWrXqWXW2g02YFYXoXBVqXIRO5IY7kzIGIoLgV7MBOUeL7
hsYuAeECgYEA6QzZL8SOPhhxqo9vWvQfZ/3OMzBPKUHQf2J1BwBK6CDxSTfbGJk6
SmExHEkCdWFEgk16zwB+FLC6M5/ArmcbuADVULr1rU5s2b2nYLXD3O8vtmaxZYfW
d7osVmml493qFaZhUbh+tzNcC1puHUp+1w7tl4Qd2XhbwoBs+X7qVbECgYEA1s5p
eeIOy7WMaU0AeMb48O/VBunobwDmqEi2tYY3v/sQwxJfa40Kp7Bd6gKJ30LD6yuI
TFoDiF/uwr4ad/LnUINLYvTyjW9Fm25AMUiJuvMxEJVKsH+3pEI4AYG2N47pbeVF
3SbEprvOnbhBTIW8FsJNUtYSHegcqGvYlPryJocCgYEAveQSM7HclQwl0ev9uAai
cIGFun/qgJt339PBt2qtnmb5M8enZmuz61c2RO3YavxObj3jizfDg+hcUCQjQ/gP
xeYn6hfshsIYP3MhJtP0O9lI7z7N3QTJ49R2vBJpcTooumtPcN77oRrgLQAKKSPC
JkmrnoGwMLq5ScqLAOBA4IECgYBjZpsqmrBMFhQGumpIeZLDM8h5bY5wp5MVNqjN
8XEk9tJ34q2jQF444QVkf447cVLmJXvqERFnbzU2ivAGp7Hg8RDWlxES3/XvCiLM
a4vIpjcDPIKWkFNzwGzYTaT7qrdccmdVAlan7WqcU6Jr/crfIUTU21kA2+M/EMDl
mAasSwKBgEfkzc3RX5vO03RCqG+NdZgLk5OOZMAtkSVVW3qmOjd5+PB0WE9yfyhZ
Sen4TzDrNWjrbGZCSuxno1M366eYeLjLY9er37L7z5cTzKa3YRvH3wbDhcIzog+e
qwq3Inb4hr6tumtKmpLX9UiXCDlu/B0fPz7+rlnzjCx02bRHLGL+
-----END RSA PRIVATE KEY-----



aquarius4 PUBLIC KEY

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDjKXp7LEhcyenELNs77zK3I0QjaWjqzxCIb0ocH6Bv6HNROshAIeOu2nHnvmaVM9QwGGZ9YoJKGZhKMgUpyUSdmxcG/P1DHlm4p3VcW3g/RuPIUldhdfiB3/ijl8Q4iDR4cfWp0Zk4dXzYz80Df8mpgO4cRrVbbcvU+ZUFVARQBFgIuSAn4r6EwfRCBN06WQfJG8sULmyTxUtG8plH0jWqQAeVEq9X0lOeyKSKvHuzkzJVaGEOrpzfiLPPSnccr4f4QrIaC5d/j2J9hgS8w8RuGzOkqjX8EKokjiT0lIxPmOyvWukZT4bR5ZJ9KBvtP9EqeNn5FV98lxzM/CRnXZX stuartpyoung@gmail.com


4. ADDED aquarius4 PRIVATE KEY TO /root/.ssh/idents/github.com/root/id_rsa

mkdir -p /root/.ssh/idents/github.com/root
cp /home/syoung/agua/cloud/AWS/keypair/syoung/aquarius4/id_rsa \
/root/.ssh/idents/github.com/root/id_rsa


5. UPDATED /root/.ssh/config TO ADD 

    # SSH config file                                                               
    
    #### GITHUB aquarius4                                                             
    IdentityFile ~/.ssh/idents/%h/%u/id_rsa
    IdentityFile ~/.ssh/idents/%h/%u/id_dsa
    
    #### GITHUB                                                                     
    IdentityFile ~/.ssh/idents/%h/id_rsa
    IdentityFile ~/.ssh/idents/%h/id_dsa
    IdentityFile ~/.ssh/id_rsa
    
    #### GENERAL AQUARIUS PRIVATE KEY                                               
    IdentityFile ~/.ssh/id_dsa


6. CREATED AND COMMITED TO NEW GIT REPOSITORY IN /repos/public/agua

mkdir -p /repos/public/agua
cd /repos/public/agua
git init
    Initialized empty Git repository in /repos/public/agua/.git/

git remote add github git@github.com:agua/agua
git remote -v
    github	git@github.com:agua/agua (fetch)
    github	git@github.com:agua/agua (push)


cp -r /agua/0.6/* /repos/public/agua
git add .
git commit -a



7. PUSHED TO GITHUB AGUA agua REPO

cd /repos/public/agua
git push github master

    Counting objects: 9594, done.
    Compressing objects: 100% (9118/9118), done.
    Writing objects: 100% (9594/9594), 40.36 MiB | 29 KiB/s, done.
    Total 9594 (delta 1425), reused 0 (delta 0)
    To git@github.com:agua/agua
     * [new branch]      master -> master


7. ADDED VERSIONS 0.7.0 AND 0.7.1 TO agua

/agua/0.6/bin/scripts/version.pl --version 0.7.0 --repodir /repos/public/agua --description "First version"

    Created new version: 0.7.0

/agua/0.6/bin/scripts/version.pl --version 0.7.1 --repodir /repos/public/agua --description "First patch increment"

    Created new version: 0.7.1


8. PUSHED NEW VERSIONS TO agua

cd /repos/public/agua
git push github master --tags

    Counting objects: 1, done.
    Writing objects: 100% (1/1), 176 bytes, done.
    Total 1 (delta 0), reused 0 (delta 0)
    To git@github.com:agua/agua
       b123e57..14eb84e  0.7.1 -> 0.7.1


</entry>
<entry [Sun 2012:01:29 01:45:58 EST] FIXED EMACS ERROR ON LINODE AFTER UPGRADING GIT>

PROBLEM:

emacs myFile.txt
    Cannot open load file: vc-git

SOLUTION:

COMMENT OUT
(add-to-list 'vc-handled-backends 'GIT t)

IN FILE:

/usr/share/emacs/site-lisp/site-start.d/git-init.el

    OK


After a lot of hunting, I found:

emacs-git-1.7.3-1.el5.rf owns
/usr/share/emacs/site-lisp/site-start.d/git-init.el which says
"(add-to-list 'vc-handled-backends 'GIT t)" which causes emacs to say
"Cannot open load file: vc-git" which prevents it from starting
properly. Commenting that line out got emacs starting again for me,
but I don't use any of the emacs-git integration features (I would
just uninstall them, but doing so wants to remove git-all).

I'm using emacs-21.4-20.el5.

-Greg

    
</entry>

    
</entry>
<entry [Sun 2012:01:22 16:30:54 EST] SET UP PARALLEL REMOTES FOR bioapps AND apps>

apps (DEVELOPMENT)
==================

LOCATION

/agua/0.6/bioapps

REMOTES
cd /agua/0.6/bioapps
git remote -v
github	git@github.com:syoung/apps (fetch)
github	git@github.com:syoung/apps (push)
linode	ssh://root@173.230.142.248/srv/git/apps (fetch)
linode	ssh://root@173.230.142.248/srv/git/apps (push)



bioapps (PRODUCTION)
====================

LOCATION

/repos/public/bioapps


REMOTES
cd /repos/public/bioapps
git remote -v
github	git@github.com:syoung/bioapps (fetch)
github	git@github.com:syoung/bioapps (push)
linode	ssh://root@173.230.142.248/srv/git/bioapps (fetch)
linode	ssh://root@173.230.142.248/srv/git/bioapps (push)

    
    
</entry>
<entry [Fri 2012:01:20 17:13:26 EST] FETCH TAGS ONLY>

TAGS ON THE REMOTE REPO WILL NOT AUTOMATICALLY BE INCLUDED IN git fetch.

YOU HAVE TO USE THIS COMMAND TO GET THE TAGS:

git pull --tags
    remote: Counting objects: 480, done.
    remote: Compressing objects: 100% (296/296), done.
    remote: Total 480 (delta 169), reused 480 (delta 169)
    Receiving objects: 100% (480/480), 32.03 MiB | 154 KiB/s, done.
    Resolving deltas: 100% (169/169), done.
    From github.com:syoung/bioapps
     * [new tag]         0.6.0      -> 0.6.0
    Fetching tags only, you probably meant:
      git fetch --tags

git tag
    0.6.0

    
</entry>
<entry [Fri 2012:01:20 16:08:44 EST] SET PRODUCTION bioapps DEFAULT REMOTE TO GITHUB WITH git config>

WANT TO MAKE public/bioapps UPDATE TO bioapps REPO ON GITHUB

I.E., SET DEFAULT REMOTE TO GITHUB bioapps

THIS IS THE CONFIG FOR THE DEVELOPMENT REPO:

syoung@syoung-Satellite-L355:/agua/0.6/bioapps  (master)$ cat .git/config
    [core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
    [branch "master"]
        remote = github
        merge = refs/heads/master
    [remote "github"]
        url = git@github.com:syoung/apps.git
        fetch = +refs/heads/*:refs/remotes/github/*
    [remote "linode"]
        url = ssh://root@173.230.142.248/srv/git/apps
        fetch = +refs/heads/*:refs/remotes/linode/*


... AND THIS IS THE CONFIG FOR THE PRODUCTION REPO:

syoung@syoung-Satellite-L355:/repos/public/bioapps  (master *)$ cat .git/config
    [core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
    [branch "master"]
    [remote "github"]
        url = git@github.com:syoung/bioapps.git
        fetch = +refs/heads/*:refs/remotes/github/*

REMOVE OLD BRANCH MASTER:

git config --remove-section branch.master 

syoung@syoung-Satellite-L355:/repos/public/bioapps  (master *)$ cat .git/config
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "github"]
	url = git@github.com:syoung/bioapps.git
	fetch = +refs/heads/*:refs/remotes/github/*


ADD NEW BRANCH MASTER WITH GITHUB AS DEFAULT REMOTE:
git config branch.master.remote github
git config branch.master.merge refs/heads/master
cat .git/config

    [core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
    [remote "github"]
        url = git@github.com:syoung/bioapps.git
        fetch = +refs/heads/*:refs/remotes/github/*
    [branch "master"]
        remote = github
        merge = refs/heads/master

    
</entry>
<entry [Tue 2012:01:17 14:45:01 EST] GIT ADD SUBMODULES>

http://book.git-scm.com/5_submodules.html

ADD A SUBMODULE

cd /agua/0.6
git submodule add ~/bioapps bioapps


CHECK SUBMODULE

cd /agua/0.6/bioapps
git submodule status

NOTE: Do not use local URLs here if you plan to publish your superproject!

See what files git-submodule created:

$ ls -a
.  ..  .git  .gitmodules  a  b  c  d


Pulling down the submodules is a two-step process. First run git submodule
init to add the submodule repository URLs to .git/config:

$ git submodule init
Now use git-submodule update to clone the repositories and check out the commits specified in the superproject:

$ git submodule update
$ cd a
$ ls -a
.  ..  .git  a.txt

    
</entry>
<entry [Tue 2012:01:17 04:51:36 EST] RECREATED bioapps ON GITHUB FROM /distrib/bioapps>

1. CREATE THE LOCAL REPO DIR AND PULL DOWN bioapps REPO INFO

sudo mkdir /distrib
sudo chown -R syoung:syoung /distrib
cd /distrib
git clone git://github.com/syoung/bioapps.git
    Cloning into bioapps...
    warning: You appsear to have cloned an empty repository.


2. COPY FILES FROM DEVELOPMENT bioapps

cp /agua/0.6/bioapps/* /distrib/bioapps
git add .
git commit -a -m "First commit of bioapps"
c
3. CREATE REMOTE

git remote add github git@github.com:syoung/bioapps.git


4. PUSH NEWLY ADDED FILES TO GIHUB bioapps

cd /distrib/bioapps
git push github master




</entry>
<entry [Mon 2012:01:16 15:24:14 EST] git config --bool core.bare true
 FIXED GIT ERROR AFTER UPGRADED GIT ON LINODE>

http://stackoverflow.com/questions/2816369/git-push-error-remote-rejected-master-master-branch-is-currently-checked-o
    
UPGRADED GIT ON LINODE:
    
yum update git
    OK

git --version
    git version 1.7.6.4


THEN GOT ERROR:

git push linode
    Counting objects: 1355, done.
    Compressing objects: 100% (1294/1294), done.
    Writing objects: 100% (1324/1324), 2.01 MiB | 1.16 MiB/s, done.
    Total 1324 (delta 126), reused 6 (delta 0)
    remote: error: refusing to update checked out branch: refs/heads/master
    remote: error: By default, updating the current branch in a non-bare repository
    remote: error: is denied, because it will make the index and work tree inconsistent
    remote: error: with what you pushed, and will require 'git reset --hard' to match
    remote: error: the work tree to HEAD.
    remote: error: 
    remote: error: You can set 'receive.denyCurrentBranch' configuration variable to
    remote: error: 'ignore' or 'warn' in the remote repository to allow pushing into
    remote: error: its current branch; however, this is not recommended unless you
    remote: error: arranged to update its work tree to match what you pushed in some
    remote: error: other way.
    remote: error: 
    remote: error: To squelch this message and still keep the default behaviour, set
    remote: error: 'receive.denyCurrentBranch' configuration variable to 'refuse'.
    To ssh://root@173.230.142.248/srv/git/aguadev
     ! [remote rejected] master -> master (branch is currently checked out)
    error: failed to push some refs to 'ssh://root@173.230.142.248/srv/git/aguadev'

    

SOLUTION:

ON LINODE:

cd /srv/git/aguadev
git config --bool core.bare true


NOW CAN PUSH OKAY TO LINODE:

git push linode
    root@173.230.142.248's password: 
    Counting objects: 1355, done.
    Compressing objects: 100% (1294/1294), done.
    Writing objects: 100% (1324/1324), 2.01 MiB | 2.63 MiB/s, done.
    Total 1324 (delta 126), reused 6 (delta 0)
    To ssh://root@173.230.142.248/srv/git/aguadev
       bc0989b..952bc46  master -> master


NOTES
=====
http://stackoverflow.com/questions/2816369/git-push-error-remote-rejected-master-master-branch-is-currently-checked-o

ust had the same error while I began learning git. The above answers are clearly not for newbies!!! (Going to use non technical terms to get the idea across) Anyways what is happening is that you have 2 repositories, one is the original you first made, and the other the work one you just made. Right now you are in your work repository, and using the "master" branch. But you also happen to be "logged in" in your original repository to the same "master" branch. Now since you're "logged in" in the original Git fears you might mess up because you might be working on the original and screw things up. So what you need to do is return to the original repository and do a "git checkout someotherbranch", now you can push with no problems.

hope this helps

link|improve this answer
answered May 29 '10 at 3:26

Robert Gould
18.6k1466159
17	  
+1 Much more helpful, thank you Robert. I didn't make sense to convert to a bare repo in my case. Simply have to 'deactivate' the branch you're attempting to push to. Makes sense. – Eric Muyser Feb 1 '11 at 2:21
Ok, but as both repository are on the same machine, what should I do ? I mean: how can I "log out" of the original git ? how can I "uncheckout" the origin repository ? I don't have any other branch yet, so I can git checkout anotherbranch. – FMaz008 Mar 25 '11 at 19:38
5	  
@FMaz008: just create a dummy branch (git checkout -b dummy) – Dror Cohen Apr 3 '11 at 11:17
3	  
Man this is far better than most voted answer :) Thanks. Although the other answer makes good point also :) – Ivan Ivanić Nov 12 '11 at 10:13
2	  
git checkout is completely different than svn checkout. git checkout is simply a "switch current" selector. Thanks for the informative answer Robert!. – JohnZ Nov 16 '11 at 12:49


The error message describes what has happened. More modern versions of git refuse to update a branch via a push if that branch is checked out.

The easiest way to work between two non-bare repositories is either to always update the repositories by pull (or fetch and merge) or, if you have to, by pushing to a separate branch (an import branch) and then merging that branch into the master branch on the remote machine.

The reason for this restriction is that the push operation operates only on the remote git repository it doesn't have access to the index and working tree so, if allowed, a push on the checked out branch would change the HEAD to be inconsistent with the index and working tree on the remote repository.

This would make it very easy to accidentally commit a change that undoes all of the pushed changes and also makes it very difficult to distinguish between any local changes that have not been committed and differences between the new HEAD, the index and the working tree that have been caused by push moving HEAD.





</entry>
<entry [Thu 2012:01:12 05:49:43 EST] MOVED komodotools TO notes REPOSITORY>

1. MOVED ~/.komodoedit TO /home/syoung/notes/backup/komodo/.komodoedit

2. LINKED BACK 

ln -s /home/syoung/notes/backup/komodo/.komodoedit ~/.komodoedit 

3. ADDED TO notes BY REMOVING REFERENCE TO backup/komodo SUBMODULE

TO AVOID THIS ERROR:
cd /home/syoung/notes/backup
git add komodo/*
fatal: Path 'backup/komodo/abouts.komodotool' is in submodule 'backup/komodo'

NOTE: If another branch depends on this submodule, then removing it can corrupt your repository! This is a dangerous operation...use with caution.

    3.1 DELETE RELEVANT LINES IN FILES
    Delete the relevant line from the .gitmodules file. #### NONE 
    Delete the relevant section from .git/config.       #### NONE 
    
    3.2 REMOVE REFERENCE TO SUBMODULE
    
    git rm --cached backup/komodo
    
    3.3 REMOVE .git DIRECTORY IN SUBMODULE FOLDER
    
    rm -fr backup/komodo/.git
    
    3.4 COMMIT 
    git commit -a
    
    The files that were part of the submodule are now untracked and you may decide to keep or delete them as desired (with the one caveat mentioned below).
    
    3.5 ADD AND COMMIT
    
    git add backup/komodo
    git commit -a
    
        OK

    
REMOVING A SUBMODULE REFERENCE
http://stackoverflow.com/questions/1084969/unable-to-track-files-in-deep-directories-by-git

There are two general reasons why Git will ignore a file: gitignore and submodules.

To be more specific, the following conditions will cause Git to ignore a file when 'git add' is invoked:

The file matches a pattern $GIT_DIR/exclude.
The file matches a pattern in a .gitignore file inside the repo.
The file matches a pattern in a user-specific .gitignore file (specified by 'git config --global core.excludesfile').
The file is part of a submodule.
Forcing 'git add' on an ignored file:

You can check to see if a particular file is ignored by invoking 'git add full/path/to/file'.

The man page states that "If an ignored file is explicitly specified on the command line, the command will fail with a list of ignored files."

If the file is ignored, you can force it to be added with 'git add --force full/path/to/file'.

Instructions to eliminate a submodule reference:

As noted in a previous answer, shells/smallApps is a submodule in your repository.

If the file is part of a submodule, the situation is more complex. You cannot modify the contents of the submodule from within the main project.

If you want to eliminate the submodule reference and directly track the files in your main repo, there are several steps that must be performed. You cannot simply remove the ".git" directory from the submodule. There are three links between your main repository and the submodule:

The .gitmodules file in your main repo.
An entry in the .git/config of your main repo.
Any commits related to the submodule in your main repo history.
Per the Git Submodule Tutorial on GitWiki, you need to perform the following steps to completely remove the sub-module:

NOTE: If another branch depends on this submodule, then removing it can corrupt your repository! This is a dangerous operation...use with caution.

Delete the relevant line from the .gitmodules file.
Delete the relevant section from .git/config.
Run git rm --cached path_to_submodule (no trailing slash).
Commit
The files that were part of the submodule are now untracked and you may decide to keep or delete them as desired (with the one caveat mentioned below).

If you don't need these files, you may simply delete them.

Caveat: If you want to keep these files (which you appear to want), you must manually remove the .git directory from the submodule folder:

cd path_to_submodule
rm .git
cd ..
git add path_to_submodule
git status
git commit
UPDATE:

Request for further information:

To assist debugging this issue, please post the output of the following complete session of commands:

cd to the top-level directory in your repo
ls -al
cat .git/config
find . -name ".git*"
git status
git add editors
git add shells
git status
Based on the description of what you have done so far, I expect to see:

No .gitmodules file anywhere
Only one .git directory (found at the root of your repo)
No .git directory in editors/vim/vimdoclet
No .git directory in shells/smallApps
link|improve this answer
edited Jul 12 '09 at 3:41

answered Jul 8 '09 at 14:58

Tim Henigan
7,174821
I run find ./ -iname .gitmodules at ~/bin and at HOME unsuccessfully: no .gitmodules -file. -- I am not sure where the problem is exactly. – Masi Jul 8 '09 at 17:43
I have no mention of submodules at my ~/.git/config nor at ~/bin/.git/config – Masi Jul 8 '09 at 17:44
Two questions then: 1. Is the '~' in the above comment your home directory or the root directory of the repo? 2. How was this submodule created? Did you copy the submodule files from another location or was it created via a < code>git submodule add< /code> command? – Tim Henigan Jul 8 '09 at 18:24
Also, what version of Git are you using? – Tim Henigan Jul 8 '09 at 18:26
1	  
@Masi: Based on your dpaste link, you have 2 submodules inside your main repo. The submodule folders are editors/vim/vimdoclet and shells/smallApps. If you want to eliminate both submodules, you need to execute my instructions twice. Once for each submodule folder. You must substitute the submodule folder names for the path_to_submodule in my instructions. – Tim Henigan Jul 8 '09 at 21:27

</entry>
<entry [Tue 2012:01:10 01:50:43 EST] USE git stash FOR TEMPORARILY SAVING THEN RETURNING TO CHANGES>


PROBLEM:

NEED TO DOWNLOAD LATEST VERSION FROM REMOTE THEN ADD WORKFLOWS

SOLUTION:

DO STASH save, apply THEN drop/pop (OR SIMPLY git stash, git stash pop)

http://ariejan.net/2008/04/23/git-using-the-stash/
GIT: Using the stash
23 Apr 2008   
I bet the following has happened to you: you are happily working on a project and are in the middle of something. You are not ready to commit your changes, because you your tests don't pass yet. Then your client calls with a bug report that needs to be fixed right now. (You know how clients can be.)

So, what do you do? Throw away your current changes to make the patch? Checkout a clean copy of your project to make the changes? No! You just stash your changes away, and make the patch! Afterward you grab your changes back and continue work.

Git features The Stash, which is as much as a good place to store uncommitted changes. When you stash you changes, the will be stored, and your working copy will be reverted to HEAD (the last commit revision) of your code.

When you restore your stash, you changes are reapplied and you continue working on your code.

Stash your current changes

$ git stash save 
Saved "WIP on master: e71813e..."
List current stashes

Yes, you can have more than one!! The stash works like a stack. Every time you save a new stash, it's put on top of the stack.

$ git stash list
stash@{0}: WIP on master: e71813e..."
Note the stash@{0} part? That's your stash ID, you'll need it to restore it later on. Let's do that right now. The stash ID changes with every stash you make. stash@{0} refers to the last stash you made.

Apply a stash

$ git stash apply stash@{0}
You may notice the stash is still there after you have applied it. You can drop it if you don't need it any more.

$ git stash drop stash@{0}

Or, because the stash acts like a stack, you can pop off the last stash you saved:

$ git stash pop

If you want to wipe all your stashes away, run the 'clear' command:

$ git stash clear

It may very well be that you don't use stashes that often. If you just want to quickly stash your changes to restore them later, you can leave out the stash ID.

$ git stash
...
$ git stash pop


ALTERNATE SOLUTION:

CHECKOUT A BRANCH, CHECKOUT MASTER AND PULL FROM REMOTE, THEN MERGE BRANCH TO MASTER

http://stackoverflow.com/questions/39651/git-stash-vs-git-branch


git checkout -b tmp   #feel free to pick a better name for your local changes branch
git add -A
git commit -m 'tmp'
git pull
git checkout master  #or whatever branch you were on originally
git pull
git diff tmp

where the last command gives a list of what your local changes were. Keep modifying the "tmp" branch until it is acceptable and then merge back onto master with:

git checkout master && git merge tmp

    
</entry>
