mongo




<entry [Sun 2015:04:05 12:35:37 EST] USE .mongorc.js, ETC. FILES>

~/.dbshell
----------
mongo maintains a history of commands in the .dbshell file.

mongorc.js FILES
----------------

EVALUATION ORDER:

1. /etc/mongorc.js

/etc/mongorc.js must have read permission

DISABLE:

mongo --norc 


2. ~/.mongorc.js

- define variables
- customize the mongo shell prompt
- update information every shell launch

SIMILAR TO:

mongo --eval myJavascript.js

DISABLE:

mongo --norc 


ADD FUNCTION TO .mongorc.js
---------------------------

1. ADD FUNCTION

function insertData(dbName, colName, num) {

  var col = db.getSiblingDB(dbName).getCollection(colName);

  for (i = 0; i < num; i++) {
    col.insert({x:i});
  }

  print(col.count());

}


2. RUN FUNCTION

insertData("test", "testData", 400)


	
</entry>
<entry [Sat 2015:04:04 22:09:35 EST] SEARCH USING KEYWORD>

#### TRACK 
ssh stuart@dev-core-ccd-1.cypher
sudo su
mongo
# look in CypherLogs database
use CypherLogs
db.auth("cguser", "7h3M4nt1sShr1mp")

# TRACK DOWN HOST FOR FILE IN 'active' COLLECTION
db.active.find({"All_Genomes.ID1242401D": { $exists: 1}} ).pretty()

# SEARCH FOR GENOME NAME

	"All_Genomes" : {
		"ID1242401D" : "nxAtWMeRsH",
		"ID1242403D" : "HDkq93zxtb",
		"ID1242402D" : "hYcLrg34Id"
	},

# GET BATCH PROCESS ID
badbtch process id under the “ID” key  in the “active” collection.

	"ID" : "batch_kCUWRNqS4n",
	


When you find the record document, look at the server that is currently processing under the “App_server” key, and log into that machine and read

/opt/cypher/tmp/ccs/ACTIVE/< batch process id >.log


to track its progress. 

The tracking procedure will be more efficient when we’re on Amazon but until then, this is how we check processes in the environment. 



# TRACK DOWN HOST FOR FILE IN 'active' COLLECTION
db.active.find({"All_Genomes.ID1242401D": { $exists: 1}} ).pretty()


db.active.find({ "All_Genomes.ID1242401D" : { $exists: 1 } }).pretty()

{
	"_id" : ObjectId("54de978e04f543558ad375c6"),
	"subprocesses" : [
		"process_2UuWKGVT8g"
	],
	"All_Genomes" : {
		"ID1242401D" : "nxAtWMeRsH",
		"ID1242403D" : "HDkq93zxtb",
		"ID1242402D" : "hYcLrg34Id"
	},
	"timestamp" : 1423873934.03842,
	"App_server_history" : [
		"dev-core-ccm-1.cypher",
		"dev-core-ccm-1.cypher",
		"dev-core-ccm-1.cypher"
	],
	"Filetype" : "vcf",
	"debug" : false,
	"BuildComp" : [ ],
	"User" : "batchuser",
	"splitgenomes" : false,
	"analysismods" : [
		"qcvalidator",
		"analyticsdb_formatter",
		"reporter",
		"cnv_summary"
	],
	"date" : "2015-02-14 00:32:14.037992",
	"ID" : "batch_kCUWRNqS4n",
	"App_server" : "",
	"Status" : [
		"Preprocessing",
		"Preprocessing Error"
	]
}


mongo --eval "db.active.find()" --username cguser --password 7h3M4nt1sShr1mp --databaseAuthentication CypherLogs

db.auth("cguser", "7h3M4nt1sShr1mp")

[AuthInfo]
DB_USER=cguser
DB_PASS=CgUs3rPa8s
CGLOG_USER=cguser
CGLOG_PASS=7h3M4nt1sShr1mp
POD_USERNAME=rackupload
POD_PASS=Wats0n2468


NB: mongoid
1) models = Model.where(:'hash.key'.exists => true)
2) models.first.hashes.where(key: 'val').count


COMMAND LINE
mongo --eval 'db.active.find().forEach(printjson)' --authenticationDatabase CypherLogs --username cguser --password 

	
</entry>
<entry [Sat 2015:04:04 21:53:42 EST] MONGO SHELL AND COMMAND LINE>

SHELL
-----

1. CREATE AND POPULATE DB

> use testme
	switched to db testme
> show collections
> db.createCollection("testdata")
	{ "ok" : 1 }
> show collections
	system.indexes
	testdata
> db.testdata.insert({"name":"test1"})
> show collections
	system.indexes
	testdata
> db.testdata.insert({"name":"test2"})
> db.testdata.insert({"name":"test3"})
> db.testdata.find()
	{ "_id" : ObjectId("55209eeaff88b2c5d625f4eb"), "name" : "test1" }
	{ "_id" : ObjectId("55209ef4ff88b2c5d625f4ec"), "name" : "test2" }
	{ "_id" : ObjectId("55209ef6ff88b2c5d625f4ed"), "name" : "test3" }


2. ADD COLLECTION TO DB

db
	test
db.createCollection("testcoll", { size : 10, capped : 10, max : 10 } )

> db.testcoll.find()
	{ "_id" : ObjectId("552098685ce65741a2c5609c") }
> db.testcoll.insert({"name":"testname"})
> db.testcoll.find()
	{ "_id" : ObjectId("552098685ce65741a2c5609c") }
	{ "_id" : ObjectId("552098bbff88b2c5d625f4ea"), "name" : "testname" }






COMMAND LINE
------------

mongo --eval 'db.testcoll.find().forEach(printjson)'

	MongoDB shell version: 2.4.9
	connecting to: test
	{ "_id" : ObjectId("552098685ce65741a2c5609c") }
	{ "_id" : ObjectId("552098bbff88b2c5d625f4ea"), "name" : "testname" }

mongo --eval 'db.testcoll.find()'

Typically users invoke the shell with the mongo command at the system prompt. Consider the following examples for other scenarios.

       To connect to a database on a remote host using authentication and a non-standard port, use the following form:

       mongo --username **user** --password **pass** --hostname **host** --port 28015

       Alternatively, consider the following short form:

       mongo -u **user** -p **pass** --host **host** --port 28015

       Replace **user**, **pass**, and **host** with the appropriate values for your situation and substitute or omit the --port as needed.

       To execute a JavaScript file without evaluating the ~/.mongorc.js file before starting a shell session, use the following form:

       mongo --shell --norc alternate-environment.js

       To print return a query as JSON, from the system prompt using the --eval option, use the following form:

       mongo --eval 'db.collection.find().forEach(printjson)'

       Use single quotes (e.g. ') to enclose the JavaScript, as well as the additional JavaScript required to generate this output.

	
</entry>
<entry [Sat 2015:04:04 17:44:03 EST] MODEL DATA FOR ATOMIC INTERACTIONS>

SUMMARY: PUT FIELDS IN THE SAME DOCUMENT TO UPDATE ATOMICALLY BECAUSE db.collection.update(), db.collection.findAndModify() AND db.collection.remove() are atomic on the level of a single document

http://docs.mongodb.org/manual/tutorial/model-data-for-atomic-operations/

Model Data for Atomic Operations

Pattern

In MongoDB, write operations, e.g. db.collection.update(), db.collection.findAndModify(), db.collection.remove(), are atomic on the level of a single document. For fields that must be updated together, embedding the fields within the same document ensures that the fields can be updated atomically.

For example, consider a situation where you need to maintain information on books, including the number of copies available for checkout as well as the current checkout information.

The available copies of the book and the checkout information should be in sync. As such, embedding the available field and the checkout field within the same document ensures that you can update the two fields atomically.

{
    _id: 123456789,
    title: "MongoDB: The Definitive Guide",
    author: [ "Kristina Chodorow", "Mike Dirolf" ],
    published_date: ISODate("2010-09-24"),
    pages: 216,
    language: "English",
    publisher_id: "oreilly",
    available: 3,
    checkout: [ { by: "joe", date: ISODate("2012-10-15") } ]
}
Then to update with new checkout information, you can use the db.collection.update() method to atomically update both the available field and the checkout field:

db.books.update (
   { _id: 123456789, available: { $gt: 0 } },
   {
     $inc: { available: -1 },
     $push: { checkout: { by: "abc", date: new Date() } }
   }
)
The operation returns a WriteResult() object that contains information on the status of the operation:

WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
The nMatched field shows that 1 document matched the update condition, and nModified shows that the operation updated 1 document.

If no document matched the update condition, then nMatched and nModified would be 0 and would indicate that you could not check out the book.


	
</entry>
<entry [Sat 2015:04:04 15:19:46 EST] INSTALLED MONGODB>


apt-get -y install mongodb

mongod --version
	db version v2.4.9
	Sat Apr  4 17:35:11.849 git version: nogitversion

	
</entry>
<entry [Sat 2015:04:04 15:01:20 EST] MONGOOSE (NODE.JS OBJECT DATA MODELLING)>

1. SETUP

cd /mnt/repos/private/syoung/nodetest/mongoose
cp -r /usr/local/lib/node_modules/mongoose ../node_modules


2. CREATE SCRIPT

/mnt/repos/private/syoung/nodetest/mongoose/test.js

	var mongoose = require('mongoose');
	mongoose.connect('mongodb://localhost/test');
	
	var Cat = mongoose.model('Cat', { name: String });
	
	var kitty = new Cat({ name: 'Zildjian' });
	kitty.save(function (err) {
	  if (err) // ...
	  console.log('meow');
	});


3. RUN TEST

cd /mnt/repos/private/syoung/nodetest/mongoose
node test.js

> use test
	switched to db test
> show collections;
	cats
	system.indexes
	testcoll
> db.cats.find()
	{ "name" : "Zildjian", "_id" : ObjectId("5520a4c8904415101c12bdbd"), "__v" : 0 }

	
</entry>
<entry [Sat 2015:04:04 14:54:43 EST] KEYWORD SEARCH>

http://docs.mongodb.org/manual/tutorial/model-data-for-keyword-search/

Model Data to Support Keyword Search

NOTE
Keyword search is not the same as text search or full text search, and does not provide stemming or other text-processing features. See the Limitations of Keyword Indexes section for more information.

In 2.4, MongoDB provides a text search feature. See Text Indexes for more information.
If your application needs to perform queries on the content of a field that holds text you can perform exact matches on the text or use $regex to use regular expression pattern matches. However, for many operations on text, these methods do not satisfy application requirements.

This pattern describes one method for supporting keyword search using MongoDB to support application search functionality, that uses keywords stored in an array in the same document as the text field. Combined with a multi-key index, this pattern can support application’s keyword search operations.

Pattern

To add structures to your document to support keyword-based queries, create an array field in your documents and add the keywords as strings in the array. You can then create a multi-key index on the array and create queries that select values from the array.

EXAMPLE
Given a collection of library volumes that you want to provide topic-based search. For each volume, you add the array topics, and you add as many keywords as needed for a given volume.

For the Moby-Dick volume you might have the following document:

{ title : "Moby-Dick" ,
  author : "Herman Melville" ,
  published : 1851 ,
  ISBN : 0451526996 ,
  topics : [ "whaling" , "allegory" , "revenge" , "American" ,
    "novel" , "nautical" , "voyage" , "Cape Cod" ]
}
You then create a multi-key index on the topics array:

db.volumes.createIndex( { topics: 1 } )
The multi-key index creates separate index entries for each keyword in the topics array. For example the index contains one entry for whaling and another for allegory.

You then query based on the keywords. For example:

db.volumes.findOne( { topics : "voyage" }, { title: 1 } )
NOTE
An array with a large number of elements, such as one with several hundreds or thousands of keywords will incur greater indexing costs on insertion.
Limitations of Keyword Indexes

MongoDB can support keyword searches using specific data models and multi-key indexes; however, these keyword indexes are not sufficient or comparable to full-text products in the following respects:

Stemming. Keyword queries in MongoDB can not parse keywords for root or related words.
Synonyms. Keyword-based search features must provide support for synonym or related queries in the application layer.
Ranking. The keyword look ups described in this document do not provide a way to weight results.
Asynchronous Indexing. MongoDB builds indexes synchronously, which means that the indexes used for keyword indexes are always current and can operate in real-time. However, asynchronous bulk indexes may be more efficient for some kinds of content and workloads.
	
</entry>
<entry [Sat 2015:04:04 14:24:28 EST] MYSQL AND MONGODB>

How is it Done?

Developers and engineers inevitably run into problems when they perform a schema update on a bulky SQL database. This can be avoided by simply having less data to "fix up" after the schema update is applied. The pain of these migrations or schema updates typically increases proportionally to the amount of data.

In our example, let's imagine CraigsList requires a new piece of information from users selling an item. Because the schema must be updated, CraigsList would want to reduce the size of the affected data to minimize the pain of the update.

After a few of these archival and migration cycles, CraigsList will have built a hefty collection of heterogeneous data that requires a schemaless datastore if it is to reside in a single location. MongoDB fits this bill very well.

An example schema for classifieds would look something like the following (shamelessly re-implemented from craigslist-clone):

CREATE TABLE `classifieds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `location` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adtype` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'O',
  `email` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
Of course, CraigsList most likely has a different schema and at the very least discovered their current schema after several iterations. Also, they may decide to change how their data is organized and change their schema again in the future. We want to use the created_at and updated_at fields to decide when we're going to archive the data contained in MySQL.

Let's pretend Craigslist's classifieds policy states that a classified will remain available on the website for two weeks. After this time, they want the classified to still be available but not necessarily active (in MySQL). To accomplish this we can use a combination of SQLAlchemy and pymongo:

First, we need to get the data out of our MySQL instance. We will utilize SQLAlchemy to accomplish this and have it introspect our schema (making this code far more re-usable for this purpose).

import sqlalchemy.schema

m = sqlalchemy.schema.MetaData("mysql://root:I'm required why?@192.0.2.3/craigslist")
m.reflect()

print m.tables.keys()
If you're successfully connecting to your database, you'll see your keys (column names) printed out in standard python fashion: [u'classifieds', u'cities', u'subcategories', u'categories']. We still need to get the individual data items out of these tables. Not only can we see them, but SQLAlchemy also provides an elegant interface to make this a lot easier.

We now have our table definitions from the introspection. It is time to either create object maps or query those tables to get the data items they contain. The query below will extract our classifieds from the datastore (the other tables are left as an exercise to the reader).

import sqlalchemy.sql

connection = m.bind.connect()

classifieds = m.tables['classifieds']

query = classifieds.select()

result = connection.execute(query)

for row in result:
    print dict(row.items())
This snippet uses our MySQL connection to query for all of the classifieds. It could easily be expanded to handle all tables, denormalizing the data to better fit the document style of MongoDB. But for the purpose of this demonstration, we'll only be focusing on the classifieds table. At this point, we've converted every individual item in the classifieds table into a dictionary, which is exactly what we'll need to insert it into MongoDB via pymongo.

The next sample shows how to connect to and insert a dictionary into pymongo:

import pymongo

client = pymongo.MongoClient('mongodb://192.0.2.2')

db = client['craigslist']
collection = db['classifieds']
collection.insert({'_id': 1})
The only problem now is how SQLAlchemy and MongoDB specify their IDs. SQLAlchemy uses a key of id whereas MongoDB uses a key of _id. Thus, we need to translate that key (quite a simple process): classified['_id'] = classified.pop('id').

Conclusion

While SQL and NoSQL datastores are often portrayed as an all or nothing proposition, it turns out that they can be used together to solve complex problems. Through this example, we saw that very little code is required for a system that utilizes both a MongoDB and MySQL datastore. In fact, this could be driven by cron rather than being daemonized.

The difficulty in utilizing multiple datastores doesn't necessarily lie in the development of translation code or migration code, but the administration of the additional systems does increase the difficulty. Maintaining one datastore already requires expertise (DBAs or admins with datastore knowledge), and this demand for expertise increases as you introduce more datastores.

The business must decide if running multiple datastores is valuable. There are technologies that will help mitigate these challenges.

In addition to automation techonolgies such as Chef and Salt, this challenge can be mitigated by taking advantage of service vendors such as ObjectRocket, the managed MongoDB service by Rackspace. Regardless of the increased complexity, if a problem would benefit from the use of multiple datastores, don't let assumptions stop you from exploring those solutions.

Comments

	
</entry>
<entry [Tue 2015:02:17 00:07:26 EST] db.collection.find()>

http://docs.mongodb.org/manual/reference/method/db.collection.find/

Combine Cursor Methods

The following example chains cursor methods:

db.bios.find().sort( { name: 1 } ).limit( 5 )
db.bios.find().limit( 5 ).sort( { name: 1 } )

	
</entry>
<entry [Mon 2015:02:16 23:59:07 EST] MONGO QUICK REFERENCE>

http://docs.mongodb.org/manual/reference/mongo-shell/
	
</entry>
<entry [Mon 2015:02:16 23:57:08 EST] 5 TOP MONGO TIPS AND MINIMONGO>

http://devblog.me/wtf-mongo

MINIMONGO
https://github.com/meteor/meteor/tree/devel/packages/minimongo
	
</entry>
<entry [Thu 2013:04:18 09:56:29 EST] PARSE STACKOVERFLOW AND GOOGLE API JSON DUMP FOR MOST POPULAR MQ TOOLS>

http://ndpar.blogspot.com/2012/12/rabbitmq-activemq-zeromq-hornetq.html

https://gist.github.com/ndpar/4276136#questions-py

1. DOWNLOAD DATA FROM APIs

Here is the Python script that downloads all the questions for the specified tags from StackOverflow, and saves the results in the local MongoDB instance. I chose Python because I want to draw some graphs later, which is easy to do in Python. Plus, it's a simple and expressive language.

questions.py
------------
import urllib2
import zlib
import json
import math
import pymongo
import sys
 
URL = 'http://api.stackoverflow.com/1.1'
TAGGED = URL + '/search?tagged={0}&page={1}'
 
def load_url(url):
    response = zlib.decompress(urllib2.urlopen(url).read(), 16 + zlib.MAX_WBITS)
    return json.loads(response)
 
def load_page(tag, page):
    url = TAGGED.format(tag, page)
    return load_url(url)
 
def concat(lists, initializer = []):
    return reduce(lambda x, y: x + y, lists, initializer)
   
def load_pages(tag):
    first = load_page(tag, 1)
    total_pages = int(math.ceil(1. * first['total'] / first['pagesize']))
    return [first] + [load_page(tag, i+1) for i in range(1, total_pages)]
 
def questions(tag):
    pages = load_pages(tag)
    return concat([p['questions'] for p in pages])
 
def insert(coll, records):
    for r in records:
        r['_id'] = r['question_id']
        coll.save(r)
 
def main(tags):
    c = pymongo.MongoClient(host='mongodb://localhost:27017', w=1, j=True)
    db = c.test
    coll = db.stackoverflow
    try:
        for tag in tags:
            insert(coll, questions(tag))
    except:
        print 'Error trying to write to collection', sys.exc_info()
 
main(['activemq', 'rabbitmq', 'zeromq', 'hornetq'])



2. PARSE DATA

After we run this script, we get all the questions we need in our database. The next step is to get all the answers for those questions. Here is the script that does that.


https://gist.github.com/ndpar/4276136#file-answers-py

answers.py
----------
import urllib2
import zlib
import json
import pymongo
import sys
 
URL = 'http://api.stackoverflow.com/1.1'
ANSWERS = URL + '/questions/{0}/answers'
 
def load_url(url):
    response = zlib.decompress(urllib2.urlopen(url).read(), 16 + zlib.MAX_WBITS)
    return json.loads(response)
 
def answers(qid):
    url = ANSWERS.format(qid)
    return load_url(url)
 
def update(coll, id, answers):
    coll.update({'_id':id}, {'$set': {'answers':answers}})
 
def main():
    c = pymongo.MongoClient(host='mongodb://localhost:27017', w=1, j=True)
    db = c.test
    coll = db.stackoverflow
    try:
        iter = coll.find({'answers':{'$exists':False}})
        for q in iter:
            qid = q['_id']
            update(coll, qid, answers(qid)['answers'])
    except:
        print 'Error trying to write to collection', sys.exc_info()
 
main()


trends.py
---------
import pymongo
import sys
import matplotlib.pyplot as plt
 
from datetime import date
from collections import defaultdict
 
def aggregate(query):
    c = pymongo.MongoClient(host='mongodb://localhost:27017', w=1, j=True)
    db = c.test
    coll = db.stackoverflow
    try:
        return coll.aggregate(query)['result']
    except:
        print 'Error trying to query collection', sys.exc_info()
 
def bucket(timestamp):
    d = date.fromtimestamp(timestamp)
    year, month = d.year, d.month
    return 12 * (year - 2008) + month
 
def frequencies(buckets):
    result = defaultdict(int)
    for b in buckets: result[b] += 1
    return result
 
def sparse_array(freqs):
    result = [0] * 60
    for f in freqs: result[f-1] += freqs[f]
    return result
 
def trends():
    rs = aggregate([
        {'$unwind':'$tags'},
        {'$group':{'_id':'$tags', 'published':{'$push':'$creation_date'}}},
        {'$match':{'_id':{'$in':['activemq', 'rabbitmq', 'zeromq', 'hornetq']}}}
    ])
    result = {}
    for e in rs:
        broker, dates = e['_id'], e['published']
        result[broker] = sparse_array(frequencies([bucket(d) for d in dates]))
    return result
 
def plot(trends):
    fig = plt.figure()
    ax = fig.add_subplot(111)
    for e in trends:
        ax.plot(range(59), trends[e][:-1], label=e)
    handles, labels = ax.get_legend_handles_labels()
    ax.legend(handles, labels, loc=2)
    plt.show()
 
plot(trends())
    
</entry>