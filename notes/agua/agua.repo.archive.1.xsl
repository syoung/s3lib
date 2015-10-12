agua.repo.archive.1



<entry [Fri 2011:10:28 22:57:04 EST] INSTALL GIT USER SCRIPTS>


User Script : GitHub Code Search
Description

This is a user script that adds a search box to repository pages which allows you to search the code in that repository.

Installation

Make sure you have user scripts enabled in your browser (these instructions refer to the latest versions of the browsers):

CHROME: User scripts are enabled by default. Continue to STEP 2.
FIREFOX: Install GreaseMonkey, then continue to STEP 2.
IE: Install Trixie. Continue to STEP 2.
SAFARI: Install SIMBL. Install GreaseKit. Continue to STEP 2.
OPERA: Follow instructions located on Opera's site: User JS. Continue to STEP 2.
Install the "GitHub Repo Search" user script by clicking here: github-code-search.user.js.

WHICH HAS THIS LINK LOCATION:

https://github.com/skratchdot/github-code-search.user.js/raw/master/github-code-search.user.js
    
</entry>
<entry [Wed 2011:08:03 04:25:05 EST] gist ONLINE SEARCH>


GIST SEARCH: bioinformatics

https://gist.github.com/gists/search?q=bioinformatics&page=1

    
</entry>
<entry [Wed 2011:08:03 04:24:49 EST] GIT USERSCRIPT: gist DIFF>


overview
http://help.github.com/userscripts-and-bookmarklets/

DIFF
https://gist.github.com/105913
    
</entry>

<entry [Tue 2011:08:02 02:58:33 EST] SEARCH GITHUB USING API>

http://develop.github.com/p/repo.html



Repositories API

Searching Repositories

repos/search/:q

To search for repositories that have to do with testing ruby, you could do this:

$ curl http://github.com/api/v2/json/repos/search/ruby+testing
{
  "repositories": [
    {
      "type": "repo",
      "language": "Ruby",
      "has_downloads": true,
      "url": "https://github.com/geemus/fog",
      "homepage": "",
      "pushed_at": "2011/01/05 11:24:06 -0800",
      "created_at": "2009/05/18 00:14:04 -0700",
      "fork": false,
      "has_wiki": true,
      "score": 0.45233846,
      "size": 5732,
      "private": false,
      "name": "fog",
      "watchers": 807,
      "owner": "geemus",
      "open_issues": 13,
      "description": "The Ruby cloud computing library.",
      "forks": 95,
      "has_issues": true,
      "followers": 807,                       // deprecated
      "pushed": "2011/01/05 11:24:06 -0800",  // deprecated
      "created": "2009/05/18 00:14:04 -0700", // deprecated
      "username": "geemus"                    // deprecated
    }
  ]
}
Note: The API has been updated to return the values with the same key names as the regular Repository API. As a result, some keys may have similarly named keys to keep compatibility with older scripts. If you're writing a new app, favor the new keys over the old ones:

followers => watchers
username => owner
pushed => pushed_at
created => created_at
You can pass a custom page number and/or a language to narrow the search:

    $ curl http://github.com/api/v2/json/repos/search/ruby+testing?start_page=2
    $ curl http://github.com/api/v2/json/repos/search/ruby+testing?language=Ruby
Language searching is done with the capitalized format of the name: "Ruby", not "ruby". It takes the same values as the language drop down on http://github.com/search.



Forking Repositories

You can also fork a repository with

repos/fork/:user/:repo

Which will return data about your newly forked repository.

curl -F 'login=schacon' -F 'token=XXX' http://github.com/api/v2/json/repos/fork/dim/retrospectiva





Show Repo Info

To look at more in-depth information for a repository, GET this

repos/show/:user/:repo

For example, to see the information for Grit

$ curl http://github.com/api/v2/json/repos/show/schacon/grit
{
  "repository": {
    "url": "https://github.com/schacon/grit",
    "has_issues": true,
    "homepage": "http://grit.rubyforge.org/",
    "watchers": 106,
    "source": "mojombo/grit",
    "parent": "mojombo/grit",
    "has_downloads": true,
    "created_at": "2008/04/18 16:14:24 -0700",
    "forks": 11,
    "fork": true,
    "has_wiki": true,
    "private": false,
    "pushed_at": "2010/05/05 15:28:38 -0700",
    "name": "grit",
    "description": "Grit is a Ruby library for extracting information from a git repository in an object oriented manner - this fork tries to intergrate as much pure-ruby functionality as possible",
    "owner": "schacon",
    "open_issues": 0
  }
}
Some keys, such as source and parent are only available on the show repo action. They won't show up on repo lists or searches.




Set Repo Info

If you are authenticated, you can update your repo's information by POSTing to it.

/repos/show/:user/:repo [POST]

  :values[key] = value
Where the POST values are of:

description
homepage
has_wiki
has_issues
has_downloads
So, you could do this to update your repo's homepage:

$ curl -F 'login=schacon' -F 'token=XXX' https://github.com/api/v2/json/repos/show/schacon/grit -F 'values[homepage]=http://schacon.github.com/grit'



Watching Repositories

You have to be authenticated for this, but you can watch and unwatch repositories with calls to

repos/unwatch/:user/:repo repos/watch/:user/:repo


Repository Refs

To get a list of tags on your repo

repos/show/:user/:repo/tags

For example

$ curl http://github.com/api/v2/json/repos/show/schacon/ruby-git/tags
{
  "tags": {
    "v1.2.0": "cfad76700b3d38eb3be97e2d5ef75cc0a398f818",
    "1.0.3": "be47ad8aea4f854fc2d6773456fb28f3e9f519e7",
    "v1.2.1": "f85cef0b1916f09ceb38f778ada98b23c8610da7",
    "v1.2.2": "85fa6ec3a68b6ff8acfa69c59fbdede1385f63bb",
    "1.0.5": "6c4af60f5fc5193b956a4698b604ad96ef3c51c6",
    "v1.2.3": "2962356828cc0ce07674b1c1fa39fde893732344",
    "v1.2.4": "1987b5010ed1abff915bd87146753323754bfb13",
    "1.0.5.1": "ae106e2a3569e5ea874852c613ed060d8e232109",
    "v1.2.5": "94f389bf5d9af4511597d035e69d1be9510b50c7",
    "v1.0.7": "1adc5b8136c2cd6c694629947e1dbc49c8bffe6a"
  }
}



To get a list of remote branches

repos/show/:user/:repo/branches

For example

$ curl http://github.com/api/v2/json/repos/show/schacon/ruby-git/branches
{
  "branches": {
    "master": "94f389bf5d9af4511597d035e69d1be9510b50c7",
    "internals": "6a9db968e8563bc27b8f56f9d413159a2e14cf67",
    "integrate": "10b880b418879e662feb91ce7af98560adeaa8bb",
    "test": "2d749e3aa69d7bfedf814f59618f964fdbc300d5"
  }
}



    
</entry>
<entry [Tue 2011:08:02 02:16:05 EST] UBUNTU INSTALL GIST>


A COMMAND LINE GISTER TO WRITE TO YOUR OWN PUBLIC/PRIVATE GISTS
https://github.com/defunkt/gist

Ubuntu:

sudo apt-get install ruby
sudo apt-get install rubygems
sudo apt-get install libopenssl-ruby
sudo gem install gist
    Successfully installed gist-2.0.4
    1 gem installed
    Installing ri documentation for gist-2.0.4...
    Installing RDoc documentation for gist-2.0.4...

sudo cp /var/lib/gems/1.8/bin/gist /usr/local/bin/
gist -h


NB: ON HEADNODE GOT THIS ERROR WHEN INSTALLING rubygems:

sudo apt-get install rubygems
Reading package lists... Done
Building dependency tree... 50%
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  irb1.8 libreadline-ruby1.8 libreadline5 rdoc1.8 rubygems1.8
Suggested packages:
  graphviz ruby1.8-dev rubygems-doc
The following NEW packages will be installed:
  irb1.8 libreadline-ruby1.8 libreadline5 rdoc1.8 rubygems rubygems1.8
0 upgraded, 6 newly installed, 0 to remove and 64 not upgraded.
Need to get 558kB of archives.
After this operation, 2,552kB of additional disk space will be used.
Get:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid/main libreadline5 5.2-7build1 [147kB]
Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid/main libreadline-ruby1.8 1.8.7.249-2 [11.3kB]
Get:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid/main irb1.8 1.8.7.249-2 [80.3kB]
Get:4 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid/main rdoc1.8 1.8.7.249-2 [125kB]
Get:5 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid/universe rubygems1.8 1.3.5-1ubuntu2 [192kB]
Get:6 http://us-east-1.ec2.archive.ubuntu.com/ubuntu/ lucid/universe rubygems 1.3.5-1ubuntu2 [2,684B]
Fetched 558kB in 0s (23.9MB/s)     
Selecting previously deselected package libreadline5.
(Reading database ... 88126 files and directories currently installed.)
Unpacking libreadline5 (from .../libreadline5_5.2-7build1_amd64.deb) ...
Selecting previously deselected package libreadline-ruby1.8.
Unpacking libreadline-ruby1.8 (from .../libreadline-ruby1.8_1.8.7.249-2_amd64.deb) ...
Selecting previously deselected package irb1.8.
Unpacking irb1.8 (from .../irb1.8_1.8.7.249-2_all.deb) ...
Selecting previously deselected package rdoc1.8.
Unpacking rdoc1.8 (from .../rdoc1.8_1.8.7.249-2_all.deb) ...
Selecting previously deselected package rubygems1.8.
Unpacking rubygems1.8 (from .../rubygems1.8_1.3.5-1ubuntu2_all.deb) ...
Selecting previously deselected package rubygems.
Unpacking rubygems (from .../rubygems_1.3.5-1ubuntu2_all.deb) ...
Processing triggers for man-db ...
Setting up libreadline5 (5.2-7build1) ...

Setting up libreadline-ruby1.8 (1.8.7.249-2) ...
Setting up irb1.8 (1.8.7.249-2) ...

Setting up rdoc1.8 (1.8.7.249-2) ...
Setting up rubygems1.8 (1.3.5-1ubuntu2) ...

Setting up rubygems (1.3.5-1ubuntu2) ...
Processing triggers for libc-bin ...
ldconfig deferred processing now taking place
/sbin/ldconfig.real: /usr/lib/libumfpack.so is not an ELF file - it has the wrong magic bytes at the start.


BUT INSTALLED OKAY ON TOSHIBA:


sudo apt-get install rubygems
Reading package lists... 0%
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  ruby1.8-dev rubygems1.8
Suggested packages:
  rubygems-doc
The following NEW packages will be installed:
  ruby1.8-dev rubygems rubygems1.8
0 upgraded, 3 newly installed, 0 to remove and 104 not upgraded.
Need to get 769 kB of archives.
After this operation, 3,105 kB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu/ natty/main ruby1.8-dev amd64 1.8.7.302-2 [629 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu/ natty/universe rubygems1.8 all 1.3.7-3 [138 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu/ natty/universe rubygems all 1.3.7-3 [2,650 B]
Fetched 769 kB in 4s (160 kB/s)
Selecting previously deselected package ruby1.8-dev.
(Reading database ... 160486 files and directories currently installed.)
Unpacking ruby1.8-dev (from .../ruby1.8-dev_1.8.7.302-2_amd64.deb) ...
Selecting previously deselected package rubygems1.8.
Unpacking rubygems1.8 (from .../rubygems1.8_1.3.7-3_all.deb) ...
Selecting previously deselected package rubygems.
Unpacking rubygems (from .../rubygems_1.3.7-3_all.deb) ...
Processing triggers for man-db ...
Setting up ruby1.8-dev (1.8.7.302-2) ...
Setting up rubygems1.8 (1.3.7-3) ...
Setting up rubygems (1.3.7-3) ...




    
</entry>
<entry [Tue 2011:08:02 02:06:00 EST] DOJO dojo.io.script TO HANDLE JSON-P>

GITHUB API REPLIES WITH JSON-P IF GIVEN ?callback

JSON-P Callbacks
http://developer.github.com/v3/#json-p-callbacks


You can send a ?callback parameter to any GET call to have the results wrapped in a JSON function. This is typically used when browsers want to embed GitHub content in web pages by getting around cross domain issues. The response includes the same data output as the regular API, plus the relevant HTTP Header information.

$ curl https://api.github.com?callback=foo

foo({
  "meta": {
    "status": 200,
    "X-RateLimit-Limit": "5000",
    "X-RateLimit-Remaining": "4966",
    "Link": [ // pagination headers and other links
      ["https://api.github.com?page=2", {"rel": "next"}]
    ]
  },
  "data": {
    // the data
  }
})
You can write a javascript handler to process the callback like this:

function foo(response) {
  var meta = response.meta
  var data = response.data
  console.log(meta)
  console.log(data)
}
All of the headers are the same String value as the HTTP Headers with one notable exception: Link. Link headers are pre-parsed for you and come through as an array of [url, options] tuples.

A link that looks like this:

Link: <url1>; rel="next", <url2>; rel="foo"; bar="baz"
… will look like this in the Callback output:

{
  "Link": [
    [
      "url1",
      {
        "rel": "next"
      }
    ],
    [
      "url2",
      {
        "rel": "foo",
        "bar": "baz"
      }
    ]
  ]
}



HANDLE THE JSON-P USING dojo.io.script:

http://www.enterprisedojo.com/2011/07/21/building-neat-stuff-with-dojo-and-yql/



Using YQL as demonstrated above is cool but also has the limitation that your query to YQL is completely static. Sure, the #dojo hashtag is interesting, but perhaps we want to build a user interface that allows a user to choose a different hashtag to search. Since JSON-P requires that we include our query via the src attribute in a script element in the page, providing the ability to do dynamic queries requires us to dynamically inject script elements. This sounds tricky, but don’t be scared, we have Dojo. Dojo provides an API called dojo.io.script that makes dynamic script element injection easy. But an even slicker way of invoking YQL via Dojo is by using this module that I found on GitHub. It abstracts away the usage of dojo.io.script, and let’s us interact with YQL at the ‘query’ level. Using this module, we can write code like this:

view sourceprint?
01
function doTwitterSearch(searchTerm) {
02
  var query =
03
    "select * from twitter.search where q='" + searchTerm + "'";
04
  dojox.yql(query, {
05
    load: function(yqlData){
06
      // yqlData is the YQL JSON payload, do something neat with it
07
    ...
08
    }
09
 });
10
}


WHICH LEADS TO THIS:

https://github.com/phiggins42/dojo-yql/blob/master/yql/_base.js

dojo.provide("dojox.yql._base");
dojo.require("dojo.io.script");
/*
 * Begin Yahoo Web Services Attribution Snippet
 * http://developer.yahoo.com - Web Services by Yahoo!
 * End Yahoo Web Services Attribution Snippet
 */
(function(d){

    var URL = 'http://query.yahooapis.com/v1/public/yql';

    dojox.yql = function(query, ioArgs){
        // summary: An interface to Yahoo's YQL web service
        //
        // description:
        //      An interface to Yahoo's YQL web service. See 
        //      http://developer.yahoo.com/yql/ for full information
        //      and to obtain the an API key. 
        //
        // query: String
        //      Some YQL query to execute. eg: "select * from internet"
        //
        // ioArgs: Object?
        //      A Standard Dojo XHR ioArgs object, with special consideration:
        //
        //        * No `url` needs specified as it it hardcoded to point to YAHOO's
        //        service. 
        //        * Any other options should behave as expected, though
        //        for the sake of not breaking the interface it is suggested you
        //        avoid using the `form` parameters. 
        //        * `ioArgs.diagnostics` can be passed to trigger diagnostic information (?)
        //        * `ioArgs.env` can be passed to supply a different datatable evn (?)
        //
        // example:
        //  |   var handleIt = function(data){ console.warn(data); };
        //  |   dojox.yql("select * from internet").addCallback(handleIt);
        //
        // example:
        //  |   dojox.yql("select geo.places where text = 'SFO'", {
        //  |       load: function(data){ console.dir(data); }
        //  |   });
        //
        // example:
        //  |   dojox.yql("select * from internet", {
        //  |       error: function(e){ handleIt(e); }
        //  |   }).addCallback(handleIt);
        //
        // example:
        //  |   dojox.yql("select * from internet", {
        //  |       timeout:5000,
        //  |       error: function(e){ handleIt(e); },
        //  |       load: handleIt
        //  |   });
        //
        //  example: 
        //  |   dojox.yql("select it").addBoth(function(dataOrError){ ... });
        
        var args = d.mixin({
            url: URL,
            callbackParamName: "callback",
            content: {}
        }, ioArgs || {});

        d.mixin(args.content, {
            q: query, format:"json",
            diagnostics: args.diagnostics && args.diagnostics === "true" || args.diagnostics === true,
            env: args.content.env || args.env || 'http://datatables.org/alltables.env'
        });
        
        // we need to make a new Deferred because we want to regulate the callbacks passed
        // in `ioArgs`. Attach those to this new deferred, which will be returned.
        var dfd = new d.Deferred();
        
        args.load && dfd.addCallback(args.load);
        args.error && dfd.addErrback(args.error);
        args.handle && dfd.addBoth(args.handle);
        
        // kill old load/error function if any at all so we can fire err/callback based on data.error,
        // as json-p doesn't have traditional errors (though 404's etc will throw methinks?)
        args.load = function(data){
            var it = data.error || data.query; 
            dfd[(data.error ? "err" : "call") + "back"](it); 
        };
        args.error = function(e){ dfd.errback(e); };
        args.handle = null; // sokay, we bound an original before here
        
        d.io.script.get(args);
        
        return dfd;

    };

})(dojo);


</entry>
<entry [Thu 2011:11:03 12:38:48 EST] GITHUB API v3 - JSON-P CALLBACKS>
        
http://developer.github.com/v3/#json-p-callbacks


This describes the resources that make up the official GitHub API v3. If you have any problems or requests please contact support.

Note: This API is in a beta state. Breaking changes may occur.

Schema
Client Errors
HTTP Verbs
Authentication
Pagination
Rate Limiting
JSON-P Callbacks
Schema

All API access is over HTTPS, and accessed from the api.github.com domain. All data is sent and received as JSON.

$ curl -i https://api.github.com

HTTP/1.1 200 OK
Content-Type: application/json
Status: 200 OK
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4999
Content-Length: 2

{}
Blank fields are included as null instead of being omitted.

All timestamps are returned in ISO 8601 format:

YYYY-MM-DDTHH:MM:SSZ
Client Errors

There are three possible types of client errors on API calls that receive request bodies:

Sending invalid JSON will result in a 400 Bad Request response.

 HTTP/1.1 400 Bad Request
 Content-Length: 35

 {"message":"Problems parsing JSON"}
Sending the wrong type of JSON values will result in a 400 Bad Request response.

 HTTP/1.1 400 Bad Request
 Content-Length: 40

 {"message":"Body should be a JSON Hash"}
Sending invalid files will result in a 422 Unprocessable Entity response.

 HTTP/1.1 422 Unprocessable Entity
 Content-Length: 149

 {
   "message": "Validation Failed",
   "errors": [
     {
       "resource": "Issue",
       "field": "title",
       "code": "missing_field"
     }
   ]
 }
All error objects have resource and field properties so that your client can tell what the problem is. There’s also an error code to let you know what is wrong with the field. These are the possible validation error codes:

missing
This means a resource does not exist.
missing_field
This means a required field on a resource has not been set.
invalid
This means the formatting of a field is invalid. The documentation for that resource should be able to give you more specific information.
already_exists
This means another resource has the same value as this field. This can happen in resources that must have some unique key (such as Label names).
HTTP Verbs

Where possible, API v3 strives to use appropriate HTTP verbs for each action.

HEAD
Can be issued against any resource to get just the HTTP header info.
GET
Used for retrieving resources.
POST
Used for creating resources, or performing custom actions (such as merging a pull request).
PATCH
Used for updating resources with partial JSON data. For instance, an Issue resource has title and body attributes. A PATCH request may accept one or more of the attributes to update the resource. PATCH is a relatively new and uncommon HTTP verb, so resource endpoints also accept POST requests.
PUT
Used for replacing resources or collections.
DELETE
Used for deleting resources.
Authentication

There are two ways to authenticate through GitHub API v3:

Basic Authentication:

$ curl -u "username:PASSWORD" https://api.github.com
OAuth2 Token (sent in a header):

$ curl -H "Authorization: token OAUTH-TOKEN" https://api.github.com
OAuth2 Token (sent as a parameter):

$ curl https://api.github.com?access_token=OAUTH-TOKEN
Read more about OAuth2.

Pagination

Requests that return multiple items will be paginated to 30 items by default. You can specify further pages with the ?page parameter. You can also set a custom page size up to 100 with the ?per_page parameter.

$ curl https://api.github.com/repos?page=2&per_page=100
The pagination info is included in the Link header:

Link: < https://api.github.com/repos?page=3&per_page=100>; rel="next",
  < https://api.github.com/repos?page=50&per_page=100>; rel="last"
Linebreak is included for readability.

The possible rel values are:

next
Shows the URL of the immediate next page of results.
last
Shows the URL of the last page of results.
first
Shows the URL of the first page of results.
prev
Shows the URL of the immediate previous page of results.
Rate Limiting

We limit requests to API v3 to 5000 per day. This is keyed off either your login, or your request IP. You can check the returned HTTP headers of any API request to see your current status:

$ curl -i https://api.github.com/users/whatever

HTTP/1.1 200 OK
Status: 200 OK
X-RateLimit-Limit: 5000
X-RateLimit-Remaining: 4966
You can file a support issue to request white listed access for your application. We prefer sites that setup OAuth applications for their users.

JSON-P Callbacks

You can send a ?callback parameter to any GET call to have the results wrapped in a JSON function. This is typically used when browsers want to embed GitHub content in web pages by getting around cross domain issues. The response includes the same data output as the regular API, plus the relevant HTTP Header information.

$ curl https://api.github.com?callback=foo

foo({
  "meta": {
    "status": 200,
    "X-RateLimit-Limit": "5000",
    "X-RateLimit-Remaining": "4966",
    "Link": [ // pagination headers and other links
      ["https://api.github.com?page=2", {"rel": "next"}]
    ]
  },
  "data": {
    // the data
  }
})
You can write a javascript handler to process the callback like this:

function foo(response) {
  var meta = response.meta
  var data = response.data
  console.log(meta)
  console.log(data)
}
All of the headers are the same String value as the HTTP Headers with one notable exception: Link. Link headers are pre-parsed for you and come through as an array of [url, options] tuples.

A link that looks like this:

Link: < url1>; rel="next", < url2>; rel="foo"; bar="baz"
… will look like this in the Callback output:

{
  "Link": [
    [
      "url1",
      {
        "rel": "next"
      }
    ],
    [
      "url2",
      {
        "rel": "foo",
        "bar": "baz"
      }
    ]
  ]
}

</entry>
<entry [Tue 2011:08:02 00:59:31 EST] GITHUB::CREATOR MODULE>
    
http://search.cpan.org/~bdfoy/Git-Github-Creator-0.17/lib/Creator.pm


Git::Github::Creator - Create a Github repository from your local repository

SYNOPSIS 

        # edit ~/.github_creator.ini

        # Inside a git repo
        % github_creator --name my-project --desc "an awesome thing"

        # for a Perl distro, figure it out through META.yml
        % github_creator
DESCRIPTION 

This is a short script you can run from within an existing git repository to create a remote repo on Github using a previously created account. This does not create Github accounts (and that violates the terms of service).

If the --name and --desc switches are not given, it will try to find them in META.yml. If the script doesn't find a META.yml, it tries to run `make metafile` (or `Build distmeta`) to create one.

From META.yml it gets the module name and abstract, which it uses for the Github project name and description. It uses the CPAN Search page as the homepage (e.g. http://search.cpan.org/dist/Foo-Bar).

Once it creates the remote repo, it adds a git remote named "origin" (unless you change that in the config), then pushes master to it.

If Github sends back the right page, the script ends by printing the private git URL.

METHODS

run( LIST )
Makes the magic happen. LIST is the stuff you'd put on the command line. If you call the module as a script, the run method is called for you automatically.

CONFIGURATION

The configuration file is an INI file named .github_creator.ini which the script looks for in the current directory or your home directory (using the first one it finds).

Example:

        [github]
        login_page="https://github.com/login"
        account=joe@example.com
        password=foobar
        remote_name=github
        debug=1
Section [github]

login_page (default = https://github.com/login)
This shouldn't change, but what the hell. It's the only URL you need to know.

account (default = GITHUB_USER environment var)
Your account name, which is probably your email address.

password (default = GITHUB_PASS environment var)
remote_name (default = origin)
I like to use "github" though.

debug (default = 0)
Do everything but don't actually create the Githun repo.

ISSUES 

The Github webserver seems to not return the right page every so often, so things might go wrong. Try again a couple times.

Sometimes there is a delay in the availability of your new repo. This script sleeps a couple of seconds then tries to verify that the new repo is there. If it can't see it, look at Github first to see if it showed up.

SOURCE AVAILABILITY 

This source is part of a Github project:

        git://github.com/briandfoy/github_creator.git
AUTHOR 

brian d foy, < bdfoy@cpan.org>

David Golden and Ricardo SIGNES contributed to the code.

    
</entry>
<entry [Thu 2011:07:28 07:51:15 EST] JAVASCRIPT GIST SEARCH>


Description:	
Github search scraping
Public Clone URL:	git://gist.github.com/971070.git
Embed All Files:	show embed
JavaScript # embed raw

/*
Usage: io github < query> [language]
    io github django
    io github coffeescript

To limit search results to a certain language:
    io github django python

To see debug info:
    io --debug github django
*/

var nodeio = require('node.io'), search_url, added_additional = false;

exports.job = new nodeio.Job({max: 50, retries: 3, auto_retry: true}, {
    init: function () {
        var query = '', language = '';

        //Parse command line args
        switch (this.options.args.length) {
            case 0:
                console.log('node.io github < query> [language]');
                process.exit();
            case 2: language = this.options.args[1];
            case 1: query = this.options.args[0];
        }

        //Build the base search URL
        search_url = 'https://github.com/search?type=Repositories&language='
                   + language + '&q=' + query
                   + '&repo=&langOverride=&x=0&y=0&start_value=';

        //The initial input is page 1 of search results
        this.input = [search_url + 1];
    },

    run: function (search_page) {
        this.getHtml(search_page, function(err, $) {

            //Add additional pages of search results to the input queue (only once)
            if (!added_additional) {
                var page, total_pages = $('.pager_link').last().text;
                for (page = 2; page < total_pages; page++) {
                    this.add(search_url + page);
                }
                added_additional = true;
            }

            //Scrape projects on the page and emit
            var projects = [];
            $('.result').each(function (listing) {
                var project = {}, title, language;
                title = $('h2 a', listing).fulltext;
                language = $('.language', listing).fulltext;
                project.author = title.substring(0, title.indexOf(" / "));
                project.title = title.substring(title.indexOf(" / ") + 3);
                project.link = "https://github.com" + $('h2 a', listing).attribs.href;
                project.language = language.substring(1, language.length - 1);
                project.description = $('.description', listing).fulltext;
                projects.push(project);
            });
            this.emit(projects);
        });
    }
});
    
</entry>
<entry [Thu 2011:07:28 06:18:51 EST] GET META AND DATA IN JSON-P OBJECT USING ?callback>


http://developer.github.com/v3/#json-p-callbacks

    
</entry>
<entry [Thu 2011:07:28 06:13:51 EST] CPAN WWW::GitHub::Gist>


    use feature 'say';
    use WWW::GitHub::Gist;

    my $gist = WWW::GitHub::Gist -> new(id => 'gist id');

    # Print the gist's author
    say $gist -> info -> {'owner'};

    # Print every ID of the gists owned by USERNAME
    $gist = WWW::GitHub::Gist -> new(user => 'USERNAME');

    foreach (@{ $gist -> user() }) {
      say $_ -> {'repo'};
    }

    # Create a new gist and print its ID
    my $login = `git config github.user`;
    my $token = `git config github.token`;

    chomp $login; chomp $token;

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
    
    
    
</entry>
<entry [Thu 2011:07:28 06:08:25 EST] ALLOW CROSS-ORIGIN RESOURCE SHARING>


http://enable-cors.org/


What is this about?

Cross-Origin Resource Sharing (CORS) is a specification that enables a truly open access across domain-boundaries. With this site we want to support the adoption of CORS. [more...]

If you have public content that doesn't use require cookie or session based authentication to see, then please consider opening it up for universal JavaScript/browser access. [more...]

Why is CORS important?

It is vital for a number of use cases to be able to perform requests that go beyond a single domain. Currently, this is not easily possible due to the same origin policy. [more...]

CORS defines how browsers and servers communicate when accessing sources across origins using HTTP headers to allow both the browser and the server to know enough about each other to determine if the request or response should succeed or fail. [more...]


In CGI Scripts

Just output the line:

Access-Control-Allow-Origin: *
... as part of your CGI script's headers, for example, in Perl (using CGI.pm):

print header(
  -type => 'text/turtle',
  -content_location => 'mydata.ttl',
  -access_control_allow_origin => '*',
);
or in Python:

print "Content-Type: text/turtle"
print "Content-Location: mydata.ttl"
print "Access-Control-Allow-Origin: *"



    
</entry>
<entry [Thu 2011:07:28 05:59:14 EST] SEARCH YOUR OWN PUBLIC GISTS>
    
gist: 773446     
Description:	
Search your own public Gists from the command line. Because the site only provides global search. There's not yet an API for private Gists.
Public Clone URL:	git://gist.github.com/773446.git


gist_search.rb # embed raw
require "open-uri"
require "rubygems"
require "json"

USERNAME = "henrik"

query = ARGV.first.downcase

gists = JSON.parse(open("http://gist.github.com/api/v1/json/gists/#{USERNAME}").read)['gists']

gists.each do |gist|
  files = "(%s)" % gist['files'].join(', ')
  description = gist['description']
  unless description.to_s.downcase.include?(query) || files.downcase.include?(query)
    next
  end
  puts description if description
  puts files
  puts "https://gist.github.com/gists/#{gist['repo']}"
  puts
end

    
</entry>
