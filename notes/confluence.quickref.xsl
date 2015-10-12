confluence.quickref




<entry [Tue 2014:10:07 22:31:47 EST] ENABLE MANUAL BACKUP>
    

1. EDIT FILE confluence.cfg.xml

emacs -nw /var/atlassian/application-data/confluence/5.6.1/confluence.cfg.xml

SET admin.ui.allow.manual.backup.download TO true


2. RESTART CONFLUENCE

sudo /opt/atlassian/confluence/5.6.1/bin/shutdown.sh
sudo /opt/atlassian/confluence/5.6.1/bin/startup.sh

    
</entry>
<entry [Tue 2014:09:09 20:53:08 EST] FIX ERROR 'Unable to Start Due to net.sf.hibernate.exception.GenericJDBCException Cannot open connection'>

PROBLEM

GET THIS ERROR IN catalina.out ON STARTUP

Unable to Start Due to net.sf.hibernate.exception.GenericJDBCException Cannot open connection


SOLUTION

START DATABASE - MYSQL OR POSTGRESQL

    
</entry>
<entry [Fri 2013:09:27 08:51:24 EST] TECH SUPPORT FORM>
 
HOW TO IMPLEMENT?
e.g., Stack Exchange
http://stackexchange.com/about
http://area51.stackexchange.com/faq
(seems DNANexus got Stack Exchange as off-label service which is no longer offered)

form linking to email, split by 12 hr shift (Lori/Matt)) with dropdown box options:
GNOS
BCF
GTFuse
GeneTorrent
ReQuest
Where does the form link to?
Integration with JIRA or other bug tracking/tech support tool?



http://www.adaptavist.com/doco/display/FMP/Form+Mail+Documentation

h2. Send us a Message

{mail-form:destination=email@example.com}
*Message*
{mail-textarea:name=message|cssStyle=width: 500px; height: 100px}{mail-textarea}

{mail-submit}
{mail-form}

RADIO

{mail-form:destination=admin@example.com}
h4. Message
{mail-input:name=msg|type=text|vtlValue=$user.fullName, please leave us a message}
Gender: Male {mail-input:name=gender|type=radio|value=Male}
Female {mail-input:name=gender|type=radio|value=Female}
{mail-submit}   
{mail-form}
    
</entry>
<entry [Thu 2013:09:26 05:09:27 EST] ENABLE ANONYMOUS USERS TO SEE CONFLUENCE>

Confluence Admin --> Global Permissions --> Edit Permissions--> 'Anonymous Access' select 'can use'

    
</entry>
<entry [Mon 2013:09:23 01:01:21 EST] STOP/START JIRA>


/opt/atlassian/jira/bin/shutdown.sh    
    
/opt/atlassian/jira/bin/startup.sh    


</entry>
<entry [Sat 2013:09:21 21:43:46 EST] CONFLUENCE 5.4.2 LOGS>


/opt/atlassian/confluence/logs/catalina.2013-09-21.log
/opt/atlassian/confluence/logs/catalina.out
/opt/atlassian/confluence/logs/host-manager.2013-09-21.log
/opt/atlassian/confluence/logs/localhost.2013-09-21.log
/opt/atlassian/confluence/logs/manager.2013-09-21.log
/var/atlassian/application-data/confluence/logs
/var/atlassian/application-data/confluence/logs/atlassian-confluence.log

    
</entry>
<entry [Fri 2013:05:31 00:51:07 EST] CONFLUENCE LICENSES>

CONFLUENCE
----------
Confluence 2000+ Users: Open Source License

AAABMw0ODAoPeNpVkF1rwjAUhu/zKwK7jtS4ChUCY20uZLWVpV5sDEYWj12gTUs+ZP77RTuZQnKT8
7wfOQ9CelyAwjTDyWKVZiua4lw0mCZzigpwyurR68GwfDCHLoBR8LHC9QgGiyFYBSi3IM9EIT2ws
4zEQzMUBV4qX8kemPBBWo/fhmBapKLTLE70EZi3Aa4k30jdMXdBx9MZfWr7+DRTQ4/4UXbhksMOs
nMwuZRagXHQnEa45NRbXn2KeveacxTdjAcjY2P+M2p7uhZckOSR0GRyqEL/BbY+5F1wHmw17MGxB
NW2lUa7KfCuveAVi5dQmi7nyxQJsEew64I9py8NKRvekHTB30nWbBL01y9Oy3Vxq7rL3jmwjpH5F
b+pG0yne+1hj7Zx2d/Swf+ap1/8Ao8glYMwLAIUIMLiy7711BkbXNrItZTvC3kl/e0CFD/gQ5tUI
ztCq15ZnqUYGJ8zmQ87X02fb


CROWD
-----

INPUT CROWD SERVER ID:
https://my.atlassian.com/products/editserverid/2256166


CRUCIBLE
--------

INPUT CRUCIBLE SERVER ID:
https://my.atlassian.com/products/editserverid/2256168

FISHEYE
-------

INPUT FISHEYE SERVER ID:
https://my.atlassian.com/products/editserverid/2256169



JIRA
----

INPUT JIRA SERVER ID:
https://my.atlassian.com/products/editserverid/2256155


GET JIRA SERVER ID:

JIRA administration console — if your JIRA installation is up and running already

1. Log in as a JIRA administrator and click on the Administration link:

2. Scroll down and click on License link listed under System heading --> license


REFINED WIKI (CONFLUENCE)
------------

AAABNw0ODAoPeNpdkFtLw0AQhd/3Vyz4KA25WKGFBTHNmyalqYogyDadxMXNbNhLtf/eadqACrsvc
2bmm3Ou6oB8BQ3PYp4sltliOV/wvN7yNE5StgLXWDV4ZVBsoFUI+xf1qfi9Nh1f69Ap5K2xPDfY6
gDYAM3F8TV/cmDd25JXAyCvTbCkPKgG0AErQ78DW7Vjj5glLLcgT4iV9CBO3Bm9jOoGvWx8KXsQt
Q/Sev5qAnaTUDxKpYUbleF4Uu66nkpRY3pWHKQO41rRSk1YfcY/E/RUTBlNoweUdHXxPSh7nPjZh
U9rInt2/UWuae3kMhpG7y7aURARnaIOILwNwCrbSVTuDP5zdF2Ugv4svZnfJvOYXeL4hQ6oVa887
CdtexxgdF+ti/K9rp42ecHWFOaHdPA/rR/W95yZMCwCFG/LOSH0zEcIvDuRgj32MxmJv8ZjAhQ77
mlzbOBBxU/gnmsD/HEnWIErnA==X02fj


GREENHOPPER (JIRA)
-----------

AAABMA0ODAoPeNpdkF1LwzAYhe/zKwJed7SdKzoIOLqgE21HPwRBkNi96wJtEvIx3L837VamXuQmz
8s5D+emOji8UhpH9zi6W84XyzDB6brCcRjFaA2m0VxZLgV51ADiSSoFGu+lxs+bYoVr0fGeW9jh2
oA2H0ucKxC4lE43gF94A8IAylz/BTrfjzckiFCqgQ2ha2aBDE1BeBvEIUqlsKyxGeuBlNYxbfG7d
KKdAH1lvCNmJOo0kIe291+zRvaIHlnnxliyZ52vbQfjw2g8u6jQHR8PaFbRYltsSoq6M3nzagOJk
e8QFgQTDdBvxfVpspxfLHPdMsHNueqP5u9Gr8uPQKx2gEqaEf+COF4k0SJBk8013k1DTqw6KRh3y
Lc0+yzzukgp2vpZD8zA/91+ACVsm0cwLAIUK3IZw6PlhSwZO0ZHAhUJxuvEYukCFG6qO3ntZZBbg
joYSEg1geLXkndNX02f7


BONFIRE (JIRA)
-------

AAABHQ0ODAoPeNpdkF9LwzAUxd/zKS743NFmTl0h4Oz6oGg71lUQBMnqbRdok5I/w317026F6cN9u
Sf3/HLOze7gYNVriJYQPcTzRUyXkKx3QMOIkjWaSoveCiXZk5K10Ai10vDyvF1BKVvRCYvfUBrU5
jOGvEcJhXK6QngVFUqDJHPdHnVej29YEJFEIx8M19wiGyhBeBvQkCRKWl7ZjHfICuu4tvChnGwmI
X3jomVmVPrToDw2nV/NKtWR9MhbN9qymrce257x7x46LCnx19Ki5LLC9KcX+jTx5xd+rhsuhTmb/
PlAkWbMT0Dp4i5a3JNLtCsbN1UxabtTj2OSfJNmX0VebpOU7M8NznwYcURmtUOy8WUduMH/bfwCa
CWKVTAtAhQCQqKpHkLvbBZLNycFJ0sDnvrarwIVAIKowSuu5nH9Ucbo6nZg+Wt/hXE8X02ee


BAMBOO (JIRA)
------

INPUT SERVER ID:

https://my.atlassian.com/products/editserverid/2256170


SEND EMAIL (CONFLUENCE)
----------
AAABQw0ODAoPeNpdkF9LwzAUxd/zKQI+SkuWbbANAkKXN22H3QRBkKy7rYE2KfkznZ/e287CFJKXn
NzzO/fclSrQLVSUrynnm8Viw1Y0K/eUsxknW/CV033Q1ogSzInKTumW7i3NrKnbCKYCulMN0Nq62
zfOGLunBw/Ov21o0YOhpY0OlUddgfFA8tgdwRX1+EckM5I5UANoqwKIgZ7gmTOCrkFVIVcdiDJE5
QJ9tdE0kyCfMJLwo9JfBuWhGVKmle2IPKs2jraiVi1i2yv+BaHDIyc4bQIYhanlV6/dZeLPf/mFa
5TR/mryJ0Apc4E34YvlcrVm5He1G5toWt3pACdy1N8pTkKnvbd1+FQO0r6NjTYeg069pR5LTmCIn
wSb9NhsiivqM4jgIkyE/aWHsY9iJ/P3sjg8Z5LssN4P5eF/fz/uXKUkMC0CFCs64dc66XzB1Bgg+
3L3Xwnq/UvXAhUAiRAmlQqNYN2xAoB7gsNawzscIcc=X02g4

SHAREPOINT CONNECTOR (CONFLUENCE)
--------------------
<!--

PONPPcaRtJBpaoQisohXIGHVMmmAbaQvGrLdoRLrkHQwbEE
mj2KFDOBvn7Z0wZOpwRc22n62L09glbDBeNirV<SEUN1Bf5
mOMpXuppQrRmQRrorPmVtoOqpQmrqMOorQVXSTXvXVMxvwV
snpsmUUnppqtrtsmmmmmUUnppqtrtsmmmmmUUJqrXoqWPlr
kd

-->


SPACETREE (CONFLUENCE)
---------

AAABKw0ODAoPeNpdUMtqwzAQvOsrBD2WGMd50YCg4PjW2qFOCoFC2aprVyDLQo/Q/H3XTgxtYXXZG
c3Mzl0Nge9Q8uyBp5stzWLJ8/rAs3SesR166ZQNqjeitiAxOETe9I7nvWl0RCORmGl6z48enX/b8
sqi4XUfHSFPSqLxyMrYfaCrmpEjZnOWO4RBdAcBxeA0o1mkjFQDyFBCh6IOEVzgpz6adgKKZ1Ba+
BGxlwF5bDtaJbLvWHEGHUdZ0YAmW1omXnVWo1FAlClxYnVslfGJn05KSFudUQQXkelr6lfKOmhlj
ExNQAP0tfi2yl2m2Itb7Mq1YJS/ev/JXReloDfLlqvVerNmt0Z+yUSjVacCfk7Y4WJxLKDaF+V7X
R1f8oLtqc8v8Pi/sB+vsZjuMCwCFCV6g8nMCs1aW1s28tkvZXwIhr6RAhRVZUHdijAPB0kMFhZR9
8+jvvli4Q==X02f3


SPEAK-MY-LANGUAGE (CONFLUENCE)
-----------------

AAABPA0ODAoPeNpdUF1rgzAUfc+vCOxxKFFbRguBgfWt1TLbwWAw7tzVhcUY8lHmv1+0FbZB8nLPP
R/33NVe0R02NGOUJVv2sF1lNK9PNGVJSnZoGyO0E4PitUb4Oox7UJ2HDunJgLISJoy2g6H5oFrpU
TUYuIzd07NFY1+3tNKoaD14E5C9aFBZJKXv39FU7bzDo4TkBmepHTjkk3cUXsZIUHXQuBJ65LXzY
Bx9GbzqFqA4gJDczogeJ+Sx68MoboaeFBeQfpblLchgK6/2z8F0GqYksJVDBSF18a2FGRf/7OYfZ
GLQuvUTwQbV5chYS9+JMLJTL1E/RvLWTBxiiQtyZzySynSghL2G+HNAXZQ8/ChdrdcbtiG3an7F8
EqKXjj8WLDTqHFuojoW5VtdnZ/yghxDsZ9g8X9zPxEJo0AwLAIUFP6pEMd98lR2ZJ6eiZTCubPVm
bECFFK7PIJMNwCgwjrxvMvg+6hDcmN8X02fn


TEAM CALENDARS (CONFLUENCE)
---------------

AAABJQ0ODAoPeNpdkFtrg0AQhd/3Vyz0sRh0Y2/CQov61mqoplAohKkZzcK6yl5C8++7mghpH+Zl5
pwz38xNfXD0ZdQ0eqLRYxKzZB3TNKspCyNGMjSNFqMVg+I1Qk9TkKj2oA1tB03TQbXSoWrQy8Pwl
m4NavOV0HJERavBaT95FQ0qg6Rw/Tfqsp01PIhIqhGm5Aws8mldEMYBC4lPtdDYAnrklXWgLf0cn
OqI9QS7ZiFYeY04Irfa4eLJ30BIbmbTeJpMz13vW6tm6El+BOnmjbwF6YnkmezD80xNRrxbWVTgD
8p/RqFPC9r6glbqDpQw55A/bFVecF8BY3f30QMjl6uvYpySohcW98usPo04H1lu8mJXldv3NCcb/
7MDGPz/lF81aI+nMCwCFFNRqQzEYsknpRYEHbarLC3LSszVAhRLdEzkNilmoqTpYa1kH+2TQUuD4
A==X02eq


    
</entry>
<entry [Thu 2013:03:21 10:25:02 EST] ENABLE DEFAULT EXPANDED LEFT NAVIGATION TREE IN 'DOCUMENTATION' THEME>

Space Admin --> Themes --> Configure Theme --> Untick 'Navigation Tree'


ADD TO Navigation BOX:
    
{pagetree:startDepth=3|searchBox=true}


    
</entry>
<entry [Wed 2011:11:09 14:16:31 EST] REST API>

https://developer.atlassian.com/display/CONFDEV/Using+the+REST+APIs+-+Prototype+Only

REST Authentication
You can authenticate yourself for the REST APIs in two ways:

Log in to Confluence manually. You will then be authenticated for the REST APIs for that same browser session.
Use HTTP basic authentication (Authorisation HTTP header) containing 'Basic username:password'. Please note however, username:password must be base64 encoded. The URL must also contain the 'os_authType=basic' query parameter.

REST Resources and URI Structure
URIs for a Confluence REST API resource have the following structure:
With context:

http://host:port/context/rest/api-name/api-version/resource-name
Or without context:

http://host:port/rest/api-name/api-version/resource-name

In Confluence 3.1 and Confluence 3.2, the only available api-name is prototype. 

Examples:
With context:

http://myhost.com:8080/confluence/rest/prototype/1/space/ds
http://localhost:8080/confluence/rest/prototype/latest/space/ds
Or without context:

http://confluence.myhost.com:8095/rest/prototype/1/space/ds
http://confluence.myhost.com:8095/rest/prototype/latest/space/ds
Here is an explanation for each part of the URI:

host and port define the host and port where the Confluence application lives.
context is the servlet context of the Confluence installation. For example, the context might be confluence. Omit this section if your URI does not include a context.
rest denotes the REST API.
api-name identifies a specific Confluence API. For example, admin is the API that allows interaction with the Confluence Administration Console. (This is the path declared in the REST module type in the REST plugin descriptor.)
api-version is the API version number, e.g. 1 or 2. See the section on API version control.
resource-name identifies the required resource. In some cases, this may be a generic resource name such as /foo. In other cases, this may include a generic resource name and key. For example, /foo returns a list of the foo items and /foo/{key} returns the full content of the foo identified by the given key.
Refer to the details of the specific REST resources in the REST resources reference guide.


Media Types
The Confluence REST APIs return HTTP responses in one of the following formats:

Response Format	 Requested via...
JSON	 Requested via one of the following:
application/json in the HTTP Accept header
.json extension
XML	 Requested via one of the following:
application/xml in the HTTP Accept header
.xml extension

API Versions
The Confluence REST APIs are subject to version control. The version number of an API appears in its URI. For example, use this URI structure to request version 1 of the 'admin' API:

http://host:port/context/rest/prototype/1/...
To get the latest version of the API, you can also use the latest key-word. For example, if versions 1 and 2 of the 'admin' API are available, the following two URIs will point to the same resources:

http://host:port/context/rest/prototype/latest/...
http://host:port/context/rest/prototype/2/...
Notes:

The API version number is an integer, such as 1 or 2.
The API version is independent of the Confluence release number.
The API version may, or may not, change with a new Confluence release. The API version number will change only when the updates to the API break the API contract, requiring changes in the code which uses the API. An addition to the API does not necessarily require a change to the API version number.
In the future, when there are multiple API versions available, it is the intention that each version of Confluence will support at least two API versions i.e. the latest API version and the previous API version.


HTTP Response Codes
An error condition will return an HTTP error code as described in the Atlassian REST Guidelines.


Methods
You will use the standard HTTP methods to access Confluence via the REST APIs. Please refer to the REST resources reference guide to see the HTTP methods available for each resource.

RELATED TOPICS
REST resources reference guide
Confluence REST APIs - Prototype Only
Confluence Developer Documentation


    
</entry>
<entry [Wed 2011:11:09 13:58:02 EST] FAILED TO INSTALL JSON-RPC PLUGIN>
https://developer.atlassian.com/display/CONFDEV/Confluence+JSON-RPC+APIs

*** FAILS INSTALL IN PLUGIN REPOSITORY AND UPLOAD ALSO FAILS ***

DOWNLOAD

https://maven.atlassian.com/content/repositories/atlassian-contrib/net/customware/webservice/json/confluence-json-webservice/1.2/confluence-json-webservice-1.2.jar



CONNECT USING POST TO:

http://host:port/confluence/rpc/json-rpc/confluenceservice-v2
    

http://www.stuartpyoung.com/confluence/rpc/json-rpc/confluenceservice-v2



Getting Started
You must use the HTTP POST verb. You cannot use GET to invoke JSON-RPC methods.

Request: HTTP POST to /rpc/json-rpc/confluenceservice-v2

Sample input data:

{"jsonrpc" : "2.0",  "method" : "getSpace",  "params" : [ "DOC" ],  "id" : 12345}
Response:

{"jsonrpc" : "2.0", "result" : {
     "key" : "DOC", "name" : "Documentation Space",
     "url" : "http://wiki.example.com/display/DOC",
     "homePage" : "Home", "description" : "Product Documentation" },
  "id" : 12345 }


The Light Protocol
The plugin also supports a 'light' protocol that allows clients to encode the method name in the URL, and provide only the method arguments in the request body. Non-error responses in the light protocol also leave out the RPC envelope and provide only what would normally be the 'result' object in a regular JSON-RPC response.

In summary:

Method is determined by the URL.
Request body is a JSON array of arguments. (Named parameters are dealt with in the same way as the heavy protocol.)
Response is the raw method result with no result envelope, or a full JSON-RPC error struct if an error occurs.
Request: HTTP POST to /rpc/json-rpc/confluenceservice-v2/getSpace

Sample input data:

[ "DOC" ]
Response:

{ "key" : "DOC", "name" : "Documentation Space",
  "url" : "http://wiki.example.com/display/DOC",
  "homePage" : "Home", "description" : "Product Documentation" }
It is your choice whether to use the full or the light JSON-RPC format. One advantage of the light format is that access logs will contain the method invoked, because it is in the URL. The heavy format will not, because the method is inside the POST data.



</entry>
<entry [Wed 2011:08:17 07:53:38 EST] CONFLUENCE ERROR LOGS>


CONFLUENCE LOGS
/usr/share/confluence-3.0.2-std/logs/atlassian-confluence.log

TOMCAT LOGS
/usr/share/confluence-3.0.2-std/logs/catalina.out

SYSTEM INFO WEB PAGE:
http://www.aguadev.org/confluence/500page.jsp



If none of this works, please raise a support ticket to https://support.atlassian.com, so that your issue can be further investigated. Also provide the following:

Confluence log file:
< confluence-home>/logs/atlassian-confluence.log
/usr/share/confluence/logs/atlassian-confluence.log

Tomcat error log:
< Tomcat-installation>/logs/catalina.out


The system information page:
http://< path-to-confluence>/500page.jsp

    
</entry>
<entry [Wed 2011:08:17 07:40:27 EST] RESTART CONFLUENCE>

export JRE_HOME=/root/base/apps/java/jre1.6.0_17
export JAVA_HOME=/root/base/apps/java/jdk1.6.0_17

/usr/share/confluence/bin/shutdown.sh
/usr/share/confluence/bin/startup.sh


</entry>