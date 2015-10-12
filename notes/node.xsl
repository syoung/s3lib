node




<entry [Wed 2015:04:15 16:17:59 EST] RUN swagger-express>		

cd /mnt/repos/private/syoung/swagger/swagger-express/example
node app.js 
		
		OK

		connect.multipart() will be removed in connect 3.0
		visit https://github.com/senchalabs/connect/wiki/Connect-3.0 for alternatives
		connect.limit() will be removed in connect 3.0
		Express server listening on port 3000
		GET / 200 208ms - 170b
		GET /stylesheets/style.css 200 7ms - 110b
		Error: ENOENT, open '/mnt/repos/private/syoung/swagger/swagger-express/node_modules/express/node_modules/connect/node_modules/static-favicon/../public/favicon.ico'



</entry>
<entry [Wed 2015:04:15 08:25:19 EST] WRITE COMMAND LINE APP>

http://blog.mohammedlakkadshaw.com/command_line_apps_in_node.js.html#.VS6CwXVGjUY

o create an executable script you will have to add shebang at the top of the script. E.g:

#!/usr/bin/env node

console.log("First program");
Assuming you are on a UNIX like system, you will also have to change the permission of the script and make it executable.

chmod +x script.js
and now you can execute the script:

./script
First Program
Accepting arguments
You would also want use command line tool to accept arguments, which you can do using process.argv. This is an array which will contain all the supplied command line arguments.

script.js

process.argv.forEach(function(val, index) {
        console.log(index + " : " + val);
    });
		
The above script will print out all the supplied arguments, when executed it will generate the following out:

$ node script.js argument-1 -f -k -d 
0: node
1: /Users/mohammed/code/script.js
2: argument-1
3: -f
4: -k
5: -d
To remove 'node' and path from your script can slice out those arguments:

var args = process.argv.slice(2);
There several libraries out there that will make the task of accepting arguments easier, but if you are doing something trivial, I would suggest sticking to the default method. One notable example of such library is cli.

Colors on the command line
If you want to display messages with different colours, there is a nice library called as colors to do it effortlessly. Install it via nom:

$ npm install colors
And then include it in your script:

var colors = require('./colors');   

console.log('hello'.green); // outputs green text
console.log('i like cake and pies'.underline.red) // outputs red underlined text
console.log('inverse the color'.inverse); // inverses the color
console.log('OMG Rainbows!'.rainbow); // rainbow (ignores spaces)
Exit event
If you want to preform some operation on exit, you can listen to the exit event. Once the exit event is called there is no way to prevent the exiting of the event loop, hence you must only perform synchronous operations in this handler.

process.on('exit', function(code) {
    console.log("About to exit");
});
Exit codes
Node.js provides supports for exit codes, if you script exits without any error, the exit code should be 0. If your script exits with an error it should be 1 or higher. Exit codes in node.js are passed using process.exit().

process.exit(0)
Process object
process.uptime() Returns the number of seconds the script has been running

process.memoryUsage() Returns an object describing the memory usage

process.pid The PID of the process

If you have any questions or suggestions feel free to comment.




	
</entry>
<entry [Sat 2015:04:04 19:52:44 EST] LIST OF INSTALLED MODULES>

TO DO:
npm install -g database-cleaner

INSTALLED TO
/usr/local/lib/node_modules

express	4.12.3
horaa	0.1.2
mocha 	2.2.1
mongodb-fixtures	0.0.5
mongoose	4.0.1
mongodb	2.0.25
pow-mongodb-fixtures	0.10.0
should	5.2.0
sinon	1.14.1
zombie	3.1.1


</entry>
<entry [Sat 2015:04:04 17:40:13 EST] USE better-assert FOR IMPROVED ERROR MESSAGES>

https://github.com/tj/better-assert

	
</entry>
<entry [Sat2015:04:04 17:36:20 EST] USE chai FOR TDD>

1. INSTALL

npm install -g chai


2. ADD TO package.json 

Recommend adding it to package.json devDependencies using a * as the version tag. This will ensure that you always have the most recent version after running npm install, which can be especially powerful when paired with a continuous integration tool.

"devDependencies": {
  "chai": "*",
  "mocha": "*"
}, "//": "mocha is our preference, but you can use any test runner you like"


3. ADD TO HTML

Include the chai browser build in your testing suite.


<!--

<script src="chai.js" type="text/javascript"></script>

-->

This will provide chai as a global object, or define it if you are using AMD.

The latest tagged version will be available for hot-linking at http://chaijs.com/chai.js. If you prefer to host yourself, use the chai.js file from the root of the github project. We recommend that you always use a version tag as your starting point, so the tag download list is the best place to start.

Currently supports all modern browsers: IE 9+, Chrome 7+, FireFox 4+, Safari 5+. Please note that the should style is currently not compatible with IE9.

If you want to know if your browser is compatible, run the online test suite.

http://chaijs.com/api/test/


</entry>
<entry [Sat 2015:04:04 17:31:39 EST] MOCHA SETUP>

1. INSTALL MOCHA

npm install -g mocha

2. CREATE TEST

mkdir test
$EDITOR test/test.js

	var assert = require("assert")
	describe('Array', function(){
	  describe('#indexOf()', function(){
		it('should return -1 when the value is not present', function(){
		  assert.equal(-1, [1,2,3].indexOf(5));
		  assert.equal(-1, [1,2,3].indexOf(0));
		})
	  })
	})

	
3. RUN TEST

mocha

  Array
    #indexOf()
      ✓ should return -1 when the value is not present 


  1 passing (6ms)
  
</entry>
<entry [Sat 2015:04:04 17:22:23 EST] MONGOOSE CRUD>

Mongoose CRUD

CRUD = Create-Read-Update-Delete

We can play with Mongoose in the console. In the todoApp type node to enter in the node CLI. Then:

/* prompt> */ var mongoose = require('mongoose');

/* prompt> */ mongoose.connect('mongodb://localhost/test3');

/* prompt> */ var TodoSchema = new mongoose.Schema({
  name: String,
  completed: Boolean,
  note: String,
  updated_at: { type: Date, default: Date.now },
});

/* prompt> */ var Todo = mongoose.model('Todo', TodoSchema);
Mongoose Create

/* prompt> */ var todo = new Todo({name: 'Master NodeJS', completed: false, note: 'Getting there...'});

/* prompt> */ todo.save(function(err){
    if(err)
        console.log(err);
    else
        console.log(todo);
});
You can also build the object and save in one step using create:

/* prompt> */ Todo.create({name: 'Master Javscript', completed: true, note: 'Getting better everyday'}, function(err, todo){
    if(err) console.log(err);
    else console.log(todo);
});
Mongoose Read and Query

There are multiple options for reading/querying data:

Model.find(conditions, [fields], [options], [callback])
Model.findById(id, [fields], [options], [callback])
Model.findOne(conditions, [fields], [options], [callback])
Some examples:

Find all
/* prompt> */ Todo.find(function (err, todos) {
  if (err) return console.error(err);
  console.log(todos)
});
You can also add queries

Find with queries
/* prompt> */ var callback = function (err, data) {
  if (err) return console.error(err);
  else console.log(data);
}

// Get all completed tasks
/* prompt> */ Todo.find({completed: true }, callback);

// Get all tasks ending with `JS`
/* prompt> */ Todo.find({name: /JS$/ }, callback);
You can chain multiple queries, e.g.:

Chaining queries
/* prompt> */ var oneYearAgo = new Date();
oneYearAgo.setYear(oneYearAgo.getFullYear() - 1);

// Get all tasks staring with `Master`, completed
/* prompt> */ Todo.find({name: /^Master/, completed: true }, callback);

// Get all tasks staring with `Master`, not completed and created from year ago to now...
/* prompt> */ Todo.find({name: /^Master/, completed: false }).where('updated_at').gt(oneYearAgo).exec(callback);
Mongoose Update

Each model has an update method which accepts multiple updates (for batch updates because doesn’t return an array with data). Alternatively, the method findOneAndUpdate could be used to update just one and return an object.

Model.update(conditions, update, [options], [callback])
Model.findByIdAndUpdate(id, [update], [options], [callback])
Model.findOneAndUpdate([conditions], [update], [options], [callback])
Todo.update and Todo.findOneAndUpdate


// Model.update(conditions, update, [options], [callback])
// update `multi`ple tasks from complete false to true

/* prompt> */ Todo.update({ completed: false }, { completed: true }, { multi: true }, function (err, numberAffected, raw) {
  if (err) return handleError(err);
  console.log('The number of updated documents was %d', numberAffected);
  console.log('The raw response from Mongo was ', raw);
});

//Model.findOneAndUpdate([conditions], [update], [options], [callback])
/* prompt> */ Todo.findOneAndUpdate({name: /JS$/ }, {completed: false}, callback);
Mongoose Delete

update and remove mongoose API are identical, the only difference it is that no elements are returned.

Model.remove(conditions, [callback])
Model.findByIdAndRemove(id, [options], [callback])
Model.findOneAndRemove(conditions, [options], [callback])

	
</entry>
<entry [Sat 2015:04:04 17:17:46 EST] MOCHA AUTOTEST ON FILE CHANGE>

tell it to watch the files in my project, and run whenever I save one:

mocha -w
	
</entry>
<entry [Sat 2015:04:04 17:14:56 EST] USE vows FOR ASYNCHRONOUS TESTS>

http://vowsjs.org/
	
</entry>
<entry [Sat 2015:04:04 16:08:02 EST] LIST INSTALLED NODE MODULES>

LIST GLOBAL MODULES

npn ls -g


LIST LOCAL MODULES

npm ls

	
</entry>
<entry [Sat 2015:04:04 16:02:14 EST] USE nvm FOR MULTIPLE ACTIVE node VERSIONS>

https://github.com/creationix/nvm


1. INSTALL

curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash

	=> You currently have modules installed globally with `npm`. These will no
	=> longer be linked to the active version of Node when you install a new node
	=> with `nvm`; and they may (depending on how you construct your `$PATH`)
	=> override the binaries of modules installed with `nvm`:
	
	/usr/local/lib
	├── autosave@1.0.3
	├── bower@1.3.12
	├── devtools-terminal@0.1.2
	├── fb-flo@0.3.1
	├── horaa@0.1.2-alpha
	├── mocha@2.2.1
	├── mongodb-fixtures@0.0.5
	├── mongoose@4.0.1
	├── pow-mongodb-fixtures@0.10.0
	├── should@5.2.0
	├── sinon@1.14.1
	└── zombie@3.1.1
	
	=> If you wish to uninstall them at a later point (or re-install them under your
	=> `nvm` Nodes), you can remove them from the system Node as follows:
	
		 $ nvm use system
		 $ npm uninstall -g a_module
	
	=> Close and reopen your terminal to start using nvm

OR

git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`

OR

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash

The script clones the nvm repository to ~/.nvm and adds the source line to your profile (~/.bash_profile, ~/.zshrc or ~/.profile).
You can customize the install source, directory and profile using the NVM_SOURCE, NVM_DIR, and PROFILE variables. Eg: curl ... | NVM_DIR=/usr/local/nvm bash for a global install.


2. ADD TO .profile:

source ~/.nvm/nvm.sh


For manual install create a folder somewhere in your filesystem with the nvm.sh file inside it. I put mine in a folder called nvm.

Or if you have git installed, then just clone it, and check out the latest version:

git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`

To activate nvm, you need to source it from your shell:

source ~/.nvm/nvm.sh
I always add this line to my ~/.bashrc, ~/.profile, or ~/.zshrc file to have it automatically sourced upon login. Often I also put in a line to use a specific version of node.

Usage

You can create an .nvmrc file containing version number in the project root directory (or any parent directory). nvm use, nvm install, nvm exec, nvm run, and nvm which will all respect an .nvmrc file when a version is not supplied.

To download, compile, and install the latest v0.10.x release of node, do this:

nvm install 0.10
And then in any new shell just use the installed version:

nvm use 0.10
Or you can just run it:

nvm run 0.10 --version
Or, you can run any arbitrary command in a subshell with the desired version of node:

nvm exec 0.10 node --version
You can also get the path to the executable to where it was installed:

nvm which 0.10
In place of a version pointer like "0.10", you can use the special default aliases "stable" and "unstable":

nvm install stable
nvm install unstable
nvm use stable
nvm run unstable --version
If you want to install io.js:

nvm install iojs
If you want to use the system-installed version of node, you can use the special default alias "system":

nvm use system
nvm run system --version
If you want to see what versions are installed:

nvm ls
If you want to see what versions are available to install:

nvm ls-remote
To restore your PATH, you can deactivate it.

nvm deactivate
To set a default Node version to be used in any new shell, use the alias 'default':

nvm alias default stable
To use a mirror of the node binaries, set $NVM_NODEJS_ORG_MIRROR:

export NVM_NODEJS_ORG_MIRROR=https://nodejs.org/dist
nvm install 0.10

NVM_NODEJS_ORG_MIRROR=https://nodejs.org/dist nvm install 0.10
To use a mirror of the iojs binaries, set $NVM_IOJS_ORG_MIRROR:

export NVM_IOJS_ORG_MIRROR=https://iojs.org/dist
nvm install iojs-v1.0.3

NVM_IOJS_ORG_MIRROR=https://iojs.org/dist nvm install iojs-v1.0.3
nvm use will not, by default, create a "current" symlink. Set $NVM_SYMLINK_CURRENT to "true" to enable this behavior, which is sometimes useful for IDEs.


	
</entry>
<entry [Sat 2015:04:04 15:50:49 EST] USE horaa FOR MOCKING>

https://github.com/arunoda/horaa

Horaa - Testing NodeJS Modules

With the recent development of NodeJS many developers who has worked with other languages starting to love NodeJS. But when they do testing It'll be quite hard for them because of NodeJS's module system.

Specifically, mocking existing( whether core or contributed ) modules will be very tricky. But with horaa it's fun to do that.

1. INSTALL

npm install -g horaa

2. USE

MOCK MYSQL
----------

So using kgilpin's same context, in horaa it would look something like:

var mock = horaa('mysql');
mock.hijack('query', function(queryString, queryParam) {
    // do your fake db query (e.g., return fake expected data)
});

//SUT calls and asserts

mock.restore('query');

MOCK EXAMPLE
------------

//stored in abc.js
exports.welcome = function() {
    var os = require('os');

    if(os.type() == 'linux') {
        return 'this is a linux box';
    } else {
        return 'meka nam linux nemei :)';
    }
};
Your Test Code (with horaa)

//stored in test.js
var horaa = require('horaa');
var lib = require('./abc'); // your code
var assert = require('assert');

//do the hijacking
var osHoraa = horaa('os');
osHoraa.hijack('type', function() {
    return 'linux';
});

assert.equal(lib.welcome(), 'this is a linux box');

//restore the method
osHoraa.restore('type');



	
</entry>
<entry [Sat 2015:04:04 15:45:52 EST] USE database-cleaner FOR TESTING>

Supported Databases

MongoDB
Redis
CouchDB
MySQL
Postgres


1. INSTALL

mkdir -p /mnt/repos/private/syoung/nodetest/database-cleaner
cd /mnt/repos/private/syoung/nodetest/database-cleaner

npm install -g mocha
npm install database-cleaner
npm install should
npm install mysql
npm install database-cleaner
npm install bson
npm install big-number
npm install require-all
npm install readable-stream


2. CREATE database_cleaner DATABASE

MYSQL
mysql -u root -p -e "CREATE DATABASE database_cleaner"

POSTGRESQL
createdb database_cleaner


3. RUN database-cleaner INBUILT TESTS

cd /mnt/repos/private/syoung/nodetest/database-cleaner
ln -s node_modules2 node_modules
cd test

MYSQL
-----

mocha mysql.test.js

	mysql.test    INSIDE beforeEach
	mysql.test    DOING client.query()
	mysql.test    DOING client.query() 2
	mysql.test    DOING client.query() 3
	mysql.test    DOING client.query() 4
	mysql.test    BEFORE databaseCleaner.clean()
	mysql.test    AFTER databaseCleaner.clean()
		✓ should delete all records 
	mysql.test    INSIDE afterEach
	mysql.test    BEFORE client.end()
	mysql.test    AFTER client.end()

NB: TO AVOID ERROR

	'mysql "before each" hook:
     Error: Cannot enqueue Query after fatal error.

... MUST SPECIFY PASSWORD IN mysql.test.js:
	 
	var mysql = require('mysql'),
    client = new mysql.createConnection({
      host: process.env.MYSQL_HOST || 'localhost',
      user: 'root',
      password: "XXXXPASSWORDXXXX",
      database: 'database_cleaner',
    });


MONGO
-----

mocha mongodb.test.js 


  mongodb
    ✓ should delete all collections items (82ms)
    ✓ should invoke callback even if database has no collections 
    ✓ should also delete system.indexes collection 


  3 passing (114ms)



4. CREATE TEST

cd /mnt/repos/private/syoung/nodetest/database-cleaner

test.js




5. RUN TEST

mocha test







  1) mysql "before each" hook:
     Error: Cannot enqueue Query after fatal error.


	
</entry>
<entry [Sat 2015:04:04 15:43:54 EST] USE mongodb-fixtures TO POPULATE MONGO FOR TESTING>
	
https://github.com/tdegrunt/mongodb-fixtures

1. INSTALL  mongodb-fixtures

npm install -g mongodb-fixtures


2. FIX mongodb-fixtures


REPLACED LINE IN

mongodb-fixtures/node_modules/mongodb-fixtures.js

              // Update the fixtures with the id
              //fixtures[collectionName][recordId]._id = docs[0]._id || docs.connection.ops[0]._id;
              fixtures[collectionName][recordId]._id = docs.ops[0]._id;


3. COPY MODULES

repo
cd nodetest
mkdir -p mongodb-fixtures/node_modules
cd mongodb-fixtures/node_modules
cp -r /usr/local/lib/node_modules/mongoose/node_modules/mongodb-fixtures .
cp -r /usr/local/lib/node_modules/mongoose/node_modules/mongodb .


4. ADD FIXTURES FILES

repo
mkdir -p nodetest/mongodb-fixtures/fixtures
cd nodetest/mongodb-fixtures

fixtures/posts.json

{ data: 
	{
		slug: 'quicktips-nodejs-fixtures',
        title: 'QuickTips: nodejs fixtures',
        categories: [],
        state: 'draft',
        __v: 0,
        _id: 5520a65736a166d51cc4b382
	}
}

fixtures/wines.json

{
  "merlot": {
    "name": "Sunnyside Reserve",
    "year": 2003,
    "family": "Merlot",
    "winery": "sunnyside._id"
  },
  "pinot": {
    "name": "Sunnyside Pinot",
    "year": <%= new Date().getFullYear() %>,
    "family": "Pinot",
    "winery": {"path": "sunnyside._id", "as": "wineries"}
  },
  "chardonnay": {
    "name": "Sunnyside Chardonnay",
    "year": 2005,
    "family": "Chardonnay",
    "winery": ["sunnyside._id", "sunnyside._id"],
    "productionDate": "<%= new Date().toISOString() %>"
  },
  "elzas": {
    "name": "Sunnyside Elzas",
    "year": 2006,
    "family": "Elzas",
    "winery": { "paths": ["sunnyside", "sunnyside._id"], "as": "wineries"}
  },
  "sirah": {
    "name": "Sunnyside Sirah",
    "year": 2007,
    "family": "Sirah",
    "wineries": ["sunnyside._id", "sunnyside"]
  }
}


fixtures/wineries.json

{
  "sunnyside": {
    "name": "Sunnyside Vineyards",
    "city": "Sonoma",
    "state": "CA",
    "country": "USA"
  }
}


5. CREATE SCRIPT

/mnt/repos/private/syoung/nodetest/mongodb-fixtures/test.js

NB: FIXED SCRIPT

	var fixtures = require('mongodb-fixtures');
	
	var Db = require('mongodb').Db;
	//var Connection = require('mongodb').Connection;
	var Server = require('mongodb').Server;
	//var db = new Db('wines', new Server("localhost", Connection.DEFAULT_PORT, {}));
	var db = new Db('wines', new Server("localhost", 27017, {}));
	console.log("db: ", db);
	
	fixtures.load();
	fixtures.save(db, function() {
	  console.log("AFTER fixtures.save(db)");
	  //db.close();
	  console.dir(fixtures);
	});

	
6. RUN TEST

cd /mnt/repos/private/syoung/nodetest/mongodb-fixtures
node test.js


{ collections: [ 'posts', 'wineries', 'wines' ],
  load: [Function],
  save: [Function],
  posts: 
   { data: 
      { slug: 'quicktips-nodejs-fixtures',
        title: 'QuickTips: nodejs fixtures',
        categories: [],
        state: 'draft',
        __v: 0,
        _id: 5520a65736a166d51cc4b382 } },
  wineries: 
   { sunnyside: 
      { name: 'Sunnyside Vineyards',
        city: 'Sonoma',
        state: 'CA',
        country: 'USA',
        _id: 5520a65736a166d51cc4b383 } },
  wines: 
   { merlot: 
      { name: 'Sunnyside Reserve',
        year: 2003,
        family: 'Merlot',
        winery: 5520a65736a166d51cc4b383,
        _id: 5520a65736a166d51cc4b384 },
     pinot: 
      { name: 'Sunnyside Pinot',
        year: 2015,
        family: 'Pinot',
        _id: 5520a65736a166d51cc4b385,
        wineries: 5520a65736a166d51cc4b383 },
     chardonnay: 
      { name: 'Sunnyside Chardonnay',
        year: 2005,
        family: 'Chardonnay',
        winery: [Object],
        productionDate: Sat Apr 04 2015 23:04:54 GMT-0400 (EDT),
        _id: 5520a65736a166d51cc4b386 },
     elzas: 
      { name: 'Sunnyside Elzas',
        year: 2006,
        family: 'Elzas',
        _id: 5520a65736a166d51cc4b387,
        wineries: [Object] },
     sirah: 
      { name: 'Sunnyside Sirah',
        year: 2007,
        family: 'Sirah',
        wineries: [Object],
        _id: 5520a65736a166d51cc4b388 } } }

NOTES
-----

CHECK MONGO IS RUNNING

db.active

/usr/local/lib/node_modules/mongoose/examples/express/connection-sharing


var express = require('express')
var mongoose = require('../../../lib')

var uri = 'mongodb://localhost/mongoose-shared-connection';
global.db = mongoose.createConnection(uri);

var routes = require('./routes')

var app = express();
app.get('/', routes.home);
app.get('/insert', routes.insert);
app.get('/name', routes.modelName);

app.listen(8000, function () {
  console.log('listening on http://localhost:8000');
})



	
</entry>
<entry [Sat 2015:04:04 15:40:12 EST] INSTALL MOCHA>

1. INSTALL

npm install -g mocha
npm install -g should
npm install -g mongoose

INSTALL MONGO

apt-get -y install mongodb


2. CREATE test DIR

tests/mocha.opts

	--require should
	-R spec
	--ui bdd

3. USE

WRITE TEST

var customer = require('../lib/customers');
describe("Customers", function(){  
  it("retrieves by email", function(done){    
    customer.findByEmail('test@test.com', function(doc){      
      doc.email.should.equal('test@test.com');       
      done();    
    });  
  });
});

WRITE MODULE

lib/customers.js

ORIGINAL

		var Customer = function(){  
		  var _login = function(email, password, callback){    
			//...  
		  }  
		  var _register = function(email, password, confirm, callback){    
			//...  
		  }  
		  return {    
			login    : _login,    
			register : _register  
		  }
		}();
		module.exports = Customer;

				
		The special sauce here is Node's "module.exports" feature. It's a place where your modules get to hang and avoid namespace collisions with other modules.
		The require statement loads the file and appends whatever functionality you dicate onto "exports" – and then pops that into the variable you decide. This keeps the global namespace tidy and modular functionality intact.
		
		To use our new module we would do this:
		var customer = require('./lib/customers'); //customers.js is the name of the file
		customer.login("test@test.com","password",function(result){  
		  //login stuff...
		});

FINAL

var Customer = function(){  
  var mongoose = require('mongoose');  
  var Schema = require('mongoose').Schema;  //bummer - have to declare this up-front  
  var customerSchema = new Schema({    
    id    : Number,    
    email : {type : String, index: { unique: true, required : true } },    
    first : String,    
    last  : String,    
    crypted_password :String,    
    auth_token : String,     
    invoices : [{type: Schema.ObjectId, ref : 'Invoice'}]  
  });  
  //the model uses the schema declaration  
  var _model = mongoose.model('customers', customerSchema);  
  var _findByEmail = function(email, success, fail){    
    _model.findOne({email:email}, function(e, doc){      
      if(e){        
        fail(e)      
      }else{       
       success(doc);      
     }    
   });
  }  
  return {    
    schema : customerSchema,    
    model : _model,    
    findByEmail : _findByEmail,  
  }
}();
module.exports = Customer;



TEST

ORIGINAL
	var mongoose = require("mongoose");
	var customer = require("../lib/customers");
	mongoose.connect('mongodb://localhost/tekpub_test');  
	describe("Customers", function(){  
	  //holds a customer to use in the each test  
	  var currentCustomer = null;  
	  beforeEach(function(done){    
		//add some test data    
		customer.register("test@test.com", "password", "password", function(doc){      
		  currentCustomer = doc;      
		  done();    
		});  
	  });    
	  afterEach(function(done){    
		//delete all the customer records    
		customer.model.remove({}, function() {      
		  done();    
		});  
	  });  
	  //tests...  
	});

FINAL

var mongoose = require("mongoose");
var customer = require("../lib/customers");
//tell Mongoose to use a different DB - created on the fly
mongoose.connect('mongodb://localhost/tekpub_test');  
describe("Customers", function(){  
  var currentCustomer = null;  

  beforeEach(function(done){    
    //add some test data    
    customer.register("test@test.com", "password", "password", function(doc){      
      currentCustomer = doc;      
      done();    
    });  
  });  

  afterEach(function(done){    
    customer.model.remove({}, function() {      
      done();    
    });  
  });

  it("registers a new customer", function(done){    
    customer.register("test2@test.com", "password", "password", function(doc){      
      doc.email.should.equal("test2@test.com");      
      doc.crypted_password.should.not.equal("password");      
      done();    
    }, function(message){      
      message.should.equal(null);      
      done();    
    }); 
  }); 

  it("retrieves by email", function(done){    
    customer.findByEmail(currentCustomer.email, function(doc){      
      doc.email.should.equal("test@test.com");       
      done();    
    });  
  });  

  it("retrieves by token", function(done){    
    customer.findByToken(currentCustomer.auth_token, function(doc){      
      doc.email.should.equal("test@test.com");      
      done();    
    });  
  });  

  it("authenticates and returns customer with valid login", function(done){    
    customer.authenticate(currentCustomer.email, "password", function(customer){      
      customer.email.should.equal("test@test.com");      
      done();    
    }, function(){      
      throw("oops");      
      done();    
    });  
  });  

  it("authenticates and returns fail with invalid login", function(done){    
    customer.authenticate(currentCustomer.email, "liar", function(customer){      
      throw("This shouldn't happen");    
    }, function(){      
      done();    
    });  
  });
});



	
</entry>
<entry [Sat 2015:04:04 15:34:34 EST] USE pow-mongodb-fixtures TO POPULATE MONGO FOR TESTING>

npm install -g pow-mongodb-fixtures 


http://www.makeandbuild.com/blog/post/quicktips-mongodb-nodejs-fixtures

Fixtures have been a staple of RoR development to help seed data for testing your applications. You can bring this awesome aspect of development to your nodejs apps in a snap.

****** Step 1: install pow-mongodb-fixtures

npm install -g pow-mongodb-fixtures 


****** Step 2: create a fixture file per model
The contract for this really allows you to do more than one in each file, but i think that's a bit more straight forward to just limit this to one collection. I've also found that this works better if you use real objectIDs so that you can rerun the fixtures over and over. Just create the file in a folder named "fixtures" in your project root. Here's an example of my fixtures/posts.js fixture:

var ObjectId = require('pow-mongodb-fixtures').createObjectId;
 
exports.posts = [
{
    "slug": "quicktips-nodejs-fixtures",
    "title": "QuickTips: nodejs fixtures",
    "categories": [],
    "state": "draft",
    "_id": ObjectId("54a32975e71789c451b66644"),
    "__v": 0
}

****** Step 3: run your fixtures
just specify your target database and directory your fixtures are in

mongofixtures make-and-build fixtures
- See more at: http://www.makeandbuild.com/blog/post/quicktips-mongodb-nodejs-fixtures#sthash.t77Xiu4g.dpuf


pow-mongodb-fixtures README
----------------------------

https://github.com/powmedia/pow-mongodb-fixtures


pow-mongodb-fixtures
Simple fixture loader for MongoDB on NodeJS. Makes managing relationships between documents easier.

Fixtures can be in one file, or divided up into separate files for organisation (e.g. one file per model)

The fixture files must export objects which are keyed by the MongoDB collection name, each containing the data for documents within that.

FOR EXAMPLE: With the file below, 3 documents will be inserted into the 'users' collection and 2 into the 'businesses' collection:

//fixtures.js
exports.users = [
    { name: 'Gob' },
    { name: 'Buster' },
    { name: 'Steve Holt' }
];

exports.businesses = [
    { name: 'The Banana Stand' },
    { name: 'Bluth Homes' }
];
You can also load fixtures as an object where each document is keyed, in case you want to reference another document. This example uses the included createObjectId helper:

//users.js
var id = require('pow-mongodb-fixtures').createObjectId;

var users = exports.users = {
    user1: {
        _id: id(),
        name: 'Michael'
    },
    user2: {
        _id: id(),
        name: 'George Michael',
        father: users.user1._id
    },
    user3: {
        _id: id('4ed2b809d7446b9a0e000014'),
        name: 'Tobias'
    }
}
CLI usage
A CLI program is included for quickly loading fixture files. To use it install the module globally:

npm install pow-mongodb-fixtures -g
Then use the program to install a file or directory:

<!--

mongofixtures <dbname> <fixture file>

-->

mongofixtures appdb fixtures/users.js
API
connect(dbname, options)

Returns a new Loader instance, configured to interact with a certain database.

Options:

host (Default: localhost)
port (Default: 27017)
user
pass
safe (Default: false)
Usage:

var fixtures = require('pow-mongodb-fixtures').connect('dbname');

var fixtures2 = require('pow-mongodb-fixtures').connect('dbname', {
  host: 'http://dbhost.com/',
  port: 1234
});
load(data, callback)

Adds documents to the relevant collection. If the collection doesn't exist it will be created first.

var fixtures = require('pow-mongodb-fixtures').connect('mydb');

//Objects
fixtures.load({
    users: [
        { name: 'Maeby' },
        { name: 'George Michael' }
    ]
}, callback);

//Files
fixtures.load(__dirname + '/fixtures/users.js', cb);

//Directories (loads all files in the directory)
fixtures.load(__dirname + '/fixtures', callback);
clear(callback)

Clears existing data.

fixtures.clear(function(err) {
    //Drops the database
});

fixtures.clear('foo', function(err) {
    //Clears the 'foo' collection
});

fixtures.clear(['foo', 'bar'], function(err) {
    //Clears the 'foo' and 'bar' collections
});
clearAllAndLoad(data, callback)

Drops the database (clear all collections) and loads data.

clearAndLoad(data, callback)

Clears the collections that have documents in the data that is passed in, and then loads data.

var data = { users: [...] };

fixtures.clearAndLoad(data, function(err) {
    //Clears only the 'users' collection then loads data
});
addModifier(callback)

Adds a modifier (function) which gets called for each document that is to be inserted. The signature of this function should be:

(collectionName, document, callback)
collectionName - name of collection
document - the document which is to be inserted
callback - function with signature (err, modifiedDocument). This should be called with the modified document.
Modifiers are chained in the order in which they're added. For example:

var data = { users: [...] };

// this modifier will get called first
fixtures.addModifier(function(collectionName, doc, cb) {
  doc.createdAt = new Date();

  cb(null, doc);
});

// this modifier will get called second with the result from the first modifier call
fixtures.addModifier(function(collectionName, doc, cb) {
  doc.updatedAt = new Date();

  cb(null, doc);
});

fixtures.load(data, function(err) {
    // each loaded data item will have the createdAt and updatedAt keys set.
});
Installation

npm install pow-mongodb-fixtures	
</entry>
<entry [Sat 2015:04:04 15:28:16 EST] MOCK CLASSES USING sinon>

http://stackoverflow.com/questions/8389149/how-do-you-mock-mysql-without-an-orm-in-node-js


1. INSTALL sinon

npm install -g sinon


2. MOCK MYSQL

With sinon, you can put a mock or stub around an entire module. For example, suppose the mysql module has a function query:

var mock;

mock = sinon.mock(require('mysql'))
mock.expects('query').with(queryString, queryParams).yields(null, rows);
queryString, queryParams are the input you expect. rows is the output you expect.

When your class under test now require mysql and calls the query method, it will be intercepted and verified by sinon.

In your test expectation section you should have:

mock.verify()
and in your teardown you should restore mysql back to normal functionality:

mock.restore()
	
</entry>
<entry [Sat 2015:04:04 15:19:56 EST] zombie.js ACCEPTANCE TESTING ON NODE.JS>

1. VERIFIED DEPENDENCIES

syoung  node --version
v0.10.25
➜  syoung  python --version
Python 2.7.6


2. INSTALLED ZOMBIE

npm install -g zombie --save-dev


SITE	
http://zombie.labnotes.org/

LATEST (2.O) DOCUMENTATION
https://github.com/assaf/zombie/blob/master/README.md


zombie README
-------------

Zombie.js
Insanely fast, headless full-stack testing using Node.js

Zombie 4.x is tested with io.js, but may also work with Node 0.12. Use Zombie 3.1.x if you need to use Node 0.10.

The Bite

If you're going to write an insanely fast, headless browser, how can you not call it Zombie? Zombie it is.

Zombie.js is a lightweight framework for testing client-side JavaScript code in a simulated environment. No browser required.

Let's try to sign up to a page and see what happens:

const Browser = require('zombie');

// We're going to make requests to http://example.com/signup
// Which will be routed to our test server localhost:3000
Browser.localhost('example.com', 3000);

describe('User visits signup page', function() {

  const browser = new Browser();

  before(function(done) {
    browser.visit('/signup', done);
  });

  describe('submits form', function() {

    before(function(done) {
      browser
        .fill('email',    'zombie@underworld.dead')
        .fill('password', 'eat-the-living')
        .pressButton('Sign Me Up!', done);
    });

    it('should be successful', function() {
      browser.assert.success();
    });

    it('should see welcome page', function() {
      browser.assert.text('title', 'Welcome To Brains Depot');
    });
  });
});
This example uses the Mocha testing framework, but Zombie will work with other testing frameworks. Since Mocha supports promises, we can also write the test like this:

const Browser = require('zombie');

// We're going to make requests to http://example.com/signup
// Which will be routed to our test server localhost:3000
Browser.localhost('example.com', 3000);

describe('User visits signup page', function() {

  const browser = new Browser();

  before(function() {
    return browser.visit('/signup');
  });

  describe('submits form', function() {

    before(function() {
      browser
        .fill('email',    'zombie@underworld.dead')
        .fill('password', 'eat-the-living');
      return browser.pressButton('Sign Me Up!');
    });

    it('should be successful', function() {
      browser.assert.success();
    });

    it('should see welcome page', function() {
      browser.assert.text('title', 'Welcome To Brains Depot');
    });
  });

});

Well, that was easy.

Table of Contents

Installing
Browser
Assertions
Cookies
Tabs
Debugging
Events
Resources
Pipeline
Installing

To install Zombie.js you will need io.js or Node.js 0.10/0.12, and the C++ toolchain and Python.

npm install zombie --save-dev

Browser

browser.assert

Methods for making assertions against the browser, such as browser.assert.element('.foo').

See Assertions for detailed discussion.

browser.referer

You can use this to set the HTTP Referer header.

browser.resources

Access to history of retrieved resources. See Resources for detailed discussion.

browser.pipeline

Access to the pipeline for making requests and processing responses. Use this to add new request/response handlers the pipeline for a single browser instance, or use Pipeline.addHandler to modify all instances. See Pipeline.

browser.tabs

Array of all open tabs (windows). Allows you to operate on more than one open window at a time.

See Tabs for detailed discussion.

browser.proxy

The proxy option takes a URL so you can tell Zombie what protocol, host and port to use. Also supports Basic authentication, e.g.:

browser.proxy = 'http://me:secret@myproxy:8080'
browser.errors

Collection of errors accumulated by the browser while loading page and executing scripts.

Browser.localhost(host, port)

Allows you to make requests against a named domain and HTTP/S port, and will route it to the test server running on localhost and unprivileged port.

For example, if you want to call your application "example.com", and redirect traffic from port 80 to the test server that's listening on port 3000, you can do this:

Browser.localhost('example.com', 3000)
browser.visit('/path', function() {
  assert(browser.location.href == 'http://example.com/path');
});
The first time you call Browser.localhost, if you didn't specify Browser.site, it will set it to the hostname (in the above example, "example.com"). Whenever you call browser.visit with a relative URL, it appends it to Browser.site, so you don't need to repeat the full URL in every test case.

You can use wildcards to map domains and all hosts within these domains, and you can specify the source port to map protocols other than HTTP. For example:

// HTTP requests for example.test www.example.test will be answered by localhost
// server running on port 3000
Browser.localhost('*.example.test', 3000);
// HTTPS requests will be answered by localhost server running on port 3001
Browser.localhost('*.example.test:443', 3001);
The underlying implementation hacks net.Socket.connect, so it will route any TCP connection made by the Node application, whether Zombie or any other library. It does not affect other processes running on your machine.

Browser.extend

You can use this to customize new browser instances for your specific needs. The extension function is called for every new browser instance, and can change properties, bind methods, register event listeners, etc.

Browser.extend(function(browser) {
  browser.on('console', function(level, message) {
    logger.log(message);
  });
  browser.on('log', function(level, message) {
    logger.log(message);
  });
});
Assertions

To make life easier, Zombie introduces a set of convenience assertions that you can access directly from the browser object. For example, to check that a page loaded successfully:

browser.assert.success();
browser.assert.text('title', 'My Awesome Site');
browser.assert.element('#main');
These assertions are available from the browser object since they operate on a particular browser instance -- generally dependent on the currently open window, or document loaded in that window.

Many assertions require an element/elements as the first argument, for example, to compare the text content (assert.text), or attribute value (assert.attribute). You can pass one of the following values:

An HTML element or an array of HTML elements
A CSS selector string (e.g. "h2", ".book", "#first-name")
Many assertions take an expected value and compare it against the actual value. For example, assert.text compares the expected value against the text contents of one or more strings. The expected value can be one of:

A JavaScript primitive value (string, number)
undefined or null are used to assert the lack of value
A regular expression
A function that is called with the actual value and returns true if the assertion is true
Any other object will be matched using assert.deepEqual
Note that in some cases the DOM specification indicates that lack of value is an empty string, not null/undefined.

All assertions take an optional last argument that is the message to show if the assertion fails. Better yet, use a testing framework like Mocha that has good diff support and don't worry about these messages.

Available Assertions

The following assertions are available:

assert.attribute(selection, name, expected, message)

Asserts the named attribute of the selected element(s) has the expected value.

Fails if no element found.

browser.assert.attribute('form', 'method', 'post');
browser.assert.attribute('form', 'action', '/customer/new');
// Disabled with no attribute value, i.e. < button disabled>
browser.assert.attribute('button', 'disabled', '');
// No disabled attribute i.e. < button>
browser.assert.attribute('button', 'disabled', null);
assert.className(selection, className, message)

Asserts that selected element(s) has that and only that class name. May also be space-separated list of class names.

Fails if no element found.

browser.assert.className('form input[name=email]', 'has-error');
assert.cookie(identifier, expected, message)

Asserts that a cookie exists and has the expected value, or if expected is null, that no such cookie exists.

The identifier is either the name of a cookie, or an object with the property name and the optional properties domain and path.

browser.assert.cookie('flash', 'Missing email address');
assert.element(selection, message)

Asserts that one element matching selection exists.

Fails if no element or more than one matching element are found.

browser.assert.element('form');
browser.assert.element('form input[name=email]');
browser.assert.element('form input[name=email].has-error');
assert.elements(selection, count, message)

Asserts how many elements exist in the selection.

The argument count can be a number, or an object with the following properties:

atLeast - Expecting to find at least that many elements
atMost - Expecting to find at most that many elements
exactly - Expecting to find exactly that many elements
browser.assert.elements('form', 1);
browser.assert.elements('form input', 3);
browser.assert.elements('form input.has-error', { atLeast: 1 });
browser.assert.elements('form input:not(.has-error)', { atMost: 2 });
assert.evaluate(expression, expected, message)

Evaluates the JavaScript expression in the context of the currently open window.

With one argument, asserts that the value is equal to true.

With two/three arguments, asserts that the returned value matches the expected value.

browser.assert.evaluate('$('form').data('valid')');
browser.assert.evaluate('$('form').data('errors').length', 3);
assert.global(name, expected, message)

Asserts that the global (window) property has the expected value.

assert.hasClass(selection, className, message)

Asserts that selected element(s) have the expected class name. Elements may have other class names (unlike assert.className).

Fails if no element found.

browser.assert.hasClass('form input[name=email]', 'has-error');
assert.hasFocus(selection, message)

Asserts that selected element has the focus.

If the first argument is null, asserts that no element has the focus.

Otherwise, fails if element not found, or if more than one element found.

browser.assert.hasFocus('form input:nth-child(1)');
assert.hasNoClass(selection, className, message)

Asserts that selected element(s) does not have the expected class name. Elements may have other class names (unlike assert.className).

Fails if no element found.

browser.assert.hasNoClass('form input', 'has-error');
assert.input(selection, expected, message)

Asserts that selected input field(s) (input, textarea, select etc) have the expected value.

Fails if no element found.

browser.assert.input('form input[name=text]', 'Head Eater');
assert.link(selection, text, url, message)

Asserts that at least one link exists with the given selector, text and URL. The selector can be a, but a more specific selector is recommended.

URL can be relative to the current document, or a regular expression.

Fails if no element is selected that also has the specified text content and URL.

browser.assert.link('footer a', 'Privacy Policy', '/privacy');
assert.redirected(message)

Asserts the browser was redirected when retrieving the current page.

assert.success(message)

Asserts the current page loaded successfully (status code 2xx or 3xx).

assert.status(code, message)

Asserts the current page loaded with the expected status code.

browser.assert.status(404);
assert.style(selection, style, expected, message)

Asserts that selected element(s) have the expected value for the named style property. For example:

Fails if no element found, or element style does not match expected value.

browser.assert.style('#show-hide.hidden', 'display', 'none');
browser.assert.style('#show-hide:not(.hidden)', 'display', '');
assert.text(selection, expected, message)

Asserts that selected element(s) have the expected text content. For example:

Fails if no element found that has that text content.

browser.assert.text('title', 'My Awesome Page');
assert.url(url, message)

Asserts the current page has the expected URL.

The expected URL can be one of:

The full URL as a string
A regular expression
A function, called with the URL and returns true if the assertion is true
An object, in which case individual properties are matched against the URL
For example:

browser.assert.url('http://localhost/foo/bar');
browser.assert.url(new RegExp('^http://localhost/foo/\\w+$'));
browser.assert.url({ pathname: '/foo/bar' });
browser.assert.url({ query: { name: 'joedoe' } });
Roll Your Own Assertions

Not seeing an assertion you want? You can add your own assertions to the prototype of Browser.Assert.

For example:

// Asserts the browser has the expected number of open tabs.
Browser.Assert.prototype.openTabs = function(expected, message) {
  assert.equal(this.browser.tabs.length, expected, message);
};
Or application specific:

// Asserts which links is highlighted in the navigation bar
Browser.Assert.navigationOn = function(linkText) {
  this.assert.element('.navigation-bar');
  this.assert.text('.navigation-bar a.highlighted', linkText);
};
Cookies

Are delicious. Also, somewhat tricky to work with. A browser will only send a cookie to the server if it matches the request domain and path.

Most modern Web applications don't care so much about the path and set all cookies to the root path of the application (/), but do pay attention to the domain.

Consider this code:

browser.setCookie(name: 'session', domain: 'example.com', value: 'delicious');
browser.visit('http://example.com', function() {
  const value = browser.getCookie('session');
  console.log('Cookie', value);
});
In order for the cookie to be set in this example, we need to specify the cookie name, domain and path. In this example we omit the path and choose the default /.

To get the cookie in this example, we only need the cookie name, because at that point the browser has an open document, and it can use the domain of that document to find the right cookie. We do need to specify a domain if we're interested in other cookies, e.g for a 3rd party widget.

There may be multiple cookies that match the same host, for example, cookies set for .example.com and www.example.com will both match www.example.com, but only the former will match example.com. Likewise, cookies set for / and /foo will both match a request for /foo/bar.

getCookie, setCookie and deleteCookie always operate on a single cookie, and they match the most specific one, starting with the cookies that have the longest matching domain, followed by the cookie that has the longest matching path.

If the first argument is a string, they look for a cookie with that name using the hostname of the currently open page as the domain and / as the path. To be more specific, the first argument can be an object with the properties name, domain and path.

The following are equivalent:

browser.getCookie('session');
browser.getCookie({ name: 'session',
                    domain: browser.location.hostname,
                    path: browser.location.pathname });
getCookie take a second argument. If false (or missing), it returns the value of the cookie. If true, it returns an object with all the cookie properties: name, value, domain, path, expires, httpOnly and secure.

browser.cookies

Returns an object holding all cookies used by this browser.

browser.cookies.dump(output?)

Dumps all cookies to standard output, or the output stream.

browser.deleteCookie(identifier)

Deletes a cookie matching the identifier.

The identifier is either the name of a cookie, or an object with the property name and the optional properties domain and path.

browser.deleteCookies()

Deletes all cookies.

browser.getCookie(identifier, allProperties?)

Returns a cookie matching the identifier.

The identifier is either the name of a cookie, or an object with the property name and the optional properties domain and path.

If allProperties is true, returns an object with all the cookie properties, otherwise returns the cookie value.

browser.setCookie(name, value)

Sets the value of a cookie based on its name.

browser.setCookie(cookie)

Sets the value of a cookie based on the following properties:

domain - Domain of the cookie (requires, defaults to hostname of currently open page)
expires - When cookie it set to expire (Date, optional, defaults to session)
maxAge - How long before cookie expires (in seconds, defaults to session)
name - Cookie name (required)
path - Path for the cookie (defaults to /)
httpOnly - True if HTTP-only (not accessible from client-side JavaScript, defaults to false)
secure - True if secure (requires HTTPS, defaults to false)
value - Cookie value (required)
Tabs

Just like your favorite Web browser, Zombie manages multiple open windows as tabs. New browsers start without any open tabs. As you visit the first page, Zombie will open a tab for it.

All operations against the browser object operate on the currently active tab (window) and most of the time you only need to interact with that one tab. You can access it directly via browser.window.

Web pages can open additional tabs using the window.open method, or whenever a link or form specifies a target (e.g. target=_blank or target=window-name). You can also open additional tabs by calling browser.open. To close the currently active tab, close the window itself.

You can access all open tabs from browser.tabs. This property is an associative array, you can access each tab by its index number, and iterate over all open tabs using functions like forEach and map.

If a window was opened with a name, you can also access it by its name. Since names may conflict with reserved properties/methods, you may need to use browser.tabs.find.

The value of a tab is the currently active window. That window changes when you navigate forwards and backwards in history. For example, if you visited the URL '/foo' and then the URL '/bar', the first tab (browser.tabs[0]) would be a window with the document from '/bar'. If you then navigate back in history, the first tab would be the window with the document '/foo'.

The following operations are used for managing tabs:

browser.tabs

Returns an array of all open tabs.

browser.tabs[number]

Returns the tab with that index number.

browser.tabs[string]

browser.tabs.find(string)

Returns the tab with that name.

browser.tabs.closeAll()

Closes all tabs.

browser.tabs.current

This is a read/write property. It returns the currently active tab.

Can also be used to change the currently active tab. You can set it to a window (e.g. as currently returned from browser.current), a window name or the tab index number.

browser.tabs.dump(output?)

Dump a list of all open tabs to standard output, or the output stream.

browser.tabs.index

Returns the index of the currently active tab.

browser.tabs.length

Returns the number of currently opened tabs.

browser.open (url)

Opens and returns a new tab. Supported options are:

name - Window name.
url - Load document from this URL.
browser.window

Returns the currently active window, same as browser.tabs.current.

Debugging

To see what your code is doing, you can use console.log and friends from both client-side scripts and your test code.

To see everything Zombie does (opening windows, loading URLs, firing events, etc), set the environment variable DEBUG=zombie. Zombie uses the debug module. For example:

$ DEBUG=zombie mocha
You can also turn debugging on from your code (e.g. a specific test you're trying to troubleshoot) by calling browser.debug().

Some objects, like the browser, history, resources, tabs and windows also include dump method that will dump the current state to the console, or an output stream of your choice. For example:

browser.dump();
browser.dump(process.stderr);
If you want to disable console output from scripts, set browser.silent = true or once for all browser instances with Browser.silent = true.

Events

Each browser instance is an EventEmitter, and will emit a variety of events you can listen to.

Some things you can do with events:

Trace what the browser is doing, e.g. log every page loaded, every DOM event emitted, every timeout fired
Wait for something to happen, e.g. form submitted, link clicked, input element getting the focus
Strip out code from HTML pages, e.g remove analytics code when running tests
Add event listeners to the page before any JavaScript executes
Mess with the browser, e.g. modify loaded resources, capture and change DOM events
console (level, message)

Emitted whenever a message is printed to the console (console.log, console.error, console.trace, etc).

The first argument is the logging level, and the second argument is the message.

The logging levels are: debug, error, info, log, trace and warn.

active (window)

Emitted when this window becomes the active window.

closed (window)

Emitted when this window is closed.

done ()

Emitted when the event loop goes empty.

error (error)

Error when loading a resource, or evaluating JavaScript.

evaluated (code, result, filename)

Emitted after JavaScript code is evaluated.

The first argument is the JavaScript function or code (string). The second argument is the result. The third argument is the filename.

event (event, target)

Emitted whenever a DOM event is fired on the target element, document or window.

focus (element)

Emitted whenever an element receives the focus.

idle ()

Event loop is idle.

inactive (window)

Emitted when this window is no longer the active window.

interval (function, interval)

Emitted whenever an interval (setInterval) is fired.

The first argument is the function or code to evaluate, the second argument is the interval in milliseconds.

link (url, target)

Emitted when a link is clicked.

The first argument is the URL of the new location, the second argument identifies the target window (_self, _blank, window name, etc).

loaded (document)

Emitted when a document has been loaded into a window or frame.

This event is emitted after the HTML is parsed, and some scripts executed.

loading (document)

Emitted when a document is about to be loaded into a window or frame.

This event is emitted when the document is still empty, before parsing any HTML.

opened (window)

Emitted when a new window is opened.

redirect (request, response)

Emitted when following a redirect.

request (request)

Emitted before making a request to retrieve a resource.

The first argument is the request object. See Resources for more details.

response (request, response)

Emitted after receiving the response (excluding redirects).

The first argument is the request object, the second argument is the response object. See Resources for more details.

serverEvent ()

Browser received server initiated event (e.g. EventSource message).

setInterval (function, interval)

Event loop fired a setInterval event.

setTimeout (function, delay)

Event loop fired a setTimeout event.

submit (url, target)

Emitted whenever a form is submitted.

The first argument is the URL of the new location, the second argument identifies the target window (_self, _blank, window name, etc).

timeout (function, delay)

Emitted whenever a timeout (setTimeout) is fired.

The first argument is the function or code to evaluate, the second argument is the delay in milliseconds.

xhr (event, url)

Called for each XHR event (progress, abort, readystatechange, loadend, etc).

Resources

Zombie can retrieve with resources - HTML pages, scripts, XHR requests - over HTTP, HTTPS and from the file system.

Most work involving resources is done behind the scenes, but there are few notable features that you'll want to know about. Specifically, if you need to do any of the following:

Inspect the history of retrieved resources, useful for troubleshooting issues related to resource loading
Request resources directly, but have Zombie handle cookies, authentication, etc
Implement new mechanism for retrieving resources, for example, add new protocols or support new headers (see Pipeline)
The Resources List

Each browser provides access to the list of resources loaded by the currently open window via browser.resources. You can iterate over this list just like any JavaScript array.

Each resource provides three properties:

request - The request object
response - The resource object (if received)
error - The error generated (no response)
The request object is based on the Fetch API Request object.

The response object is based on the Fetch API Response object. Note that the fetch API has the property status, whereas Node HTTP module uses statusCode.

browser.fetch(input, init)

You can use the browser directly to make requests against external resources. These requests will share the same cookies, authentication and other browser settings (also pipline).

The fetch method is based on the Fetch API.

For example:

browser.fetch(url)
  .then(function(response) {
    console.log('Status code:', response.status);
    if (response.status === 200)
      return response.text();
  })
  .then(function(text) {
    console.log('Document:', text);
  })
  .catch(function(error) {
    console.log('Network error');
  });
To access the response document body as a Node buffer, use the following:

response.arrayBuffer()
  .then(Buffer) // arrayBuffer -> Buffer
  .then(function(buffer) {
    assert( Buffer.isBuffer(buffer) );
  });
resources.dump(output?)

Dumps the resources list to the output stream (defaults to standard output stream).

Pipeline

Zombie uses a pipeline to operate on resources. You can extend that pipeline with your own set of handlers, for example, to support additional protocols, content types, special handlers, etc.

The pipeline consists of a set of handlers. There are two types of handlers:

Functions with two arguments deal with requests. They are called with the browser and request object. They may modify the request object, and they may either return null (pass control to the next handler) or return the Response object, or return a promise that resolves to either outcome.

Functions with three arguments deal with responses. They are called with the browser, request and response objects. They may modify the response object, and must return a Response object, either the same as the argument or a new Response object, either directly or through a promise.

To add a new handle to the end of the pipeline:

browser.pipeline.addHandler(function(browser, request) {
  // Let's delay this request by 1/10th second
  return new Promise(function(resolve) {
    setTimeout(resolve, 100);
  });
});
You can add handlers to all browsers via Pipeline.addHandler. These handlers are automatically added to every new browser.pipeline instance.

Pipeline.addHandler(function(browser, request, response) {
  // Log the response body
  console.log('Response body: ' + response.body);
});


	
</entry>
<entry [Thu 2015:03:05 11:02:17 EST] USE FOREVER>

http://blog.nodejitsu.com/keep-a-nodejs-server-up-with-forever/

forever start http.js

forever list

	
</entry>
<entry [Fri 2014:10:10 11:14:34 EST] SETUP REDIRECT FROM www.aguadev.org TO www.aguadev.org:8090>

1. COPIED https.js MODULE FROM comp3 TO digi02


2. INSTALLED NODE ON digi02

apt-get install -y npm


3. INSTALLED forever

npm install -g forever


4. CREATED index.htm FILE

/home/vesi/http/index.htm

<!--

<html>
<head>
<meta http-equiv="Refresh" content="0; url=http://www.aguadev.org:8090" />

<title>www.aguadev.org</title>
</head>
<body>
Redirecting to www.aguadev.org
</body>
</html>

-->


5. STARTED https.js

cd /home/vesi/http
forever https.js 

    OK
    
</entry>
<entry [Fri 2014:09:26 03:12:40 EST] INSTALL rabbitjs ON UBUNTU 14.04>

1. INSTALL NODE

cd /a/bin/daemon
git clone git@github.com:squaremo/rabbit.js.git

Each subdirectory of 'example' has code demonstrating using rabbit.js with other modules. Install the prerequisites for rabbit.js:

cd rabbit.js/example
npm install

    readable-stream@1.0.32 ../node_modules/readable-stream
    ├── isarray@0.0.1
    ├── inherits@2.0.1
    ├── string_decoder@0.10.31
    └── core-util-is@1.0.1
    
    amqplib@0.1.3 ../node_modules/amqplib
    ├── buffer-more-ints@0.0.2
    ├── bitsyntax@0.0.3
    ├── when@2.1.1
    └── readable-stream@1.1.13 (isarray@0.0.1, inherits@2.0.1, string_decoder@0.10.31, core-util-is@1.0.1)
    
    mocha@1.21.4 ../node_modules/mocha
    ├── diff@1.0.7
    ├── growl@1.8.1
    ├── commander@2.0.0
    ├── mkdirp@0.3.5
    ├── debug@2.0.0 (ms@0.6.2)
    ├── jade@0.26.3 (commander@0.6.1, mkdirp@0.3.0)
    └── glob@3.2.3 (inherits@2.0.1, graceful-fs@2.0.3, minimatch@0.2.14)

<!-- **** NOT NEEDED ****

INSTALL SOCKET.IO

npm install -g socket.io

    socket.io@1.1.0 /usr/local/lib/node_modules/socket.io
    ├── debug@0.7.4
    ├── has-binary-data@0.1.3 (isarray@0.0.1)
    ├── socket.io-parser@2.2.1 (isarray@0.0.1, component-emitter@1.1.2, benchmark@1.0.0, json3@3.2.6)
    ├── socket.io-adapter@0.2.0 (socket.io-parser@2.1.2)
    ├── engine.io@1.4.0 (base64id@0.1.0, debug@1.0.3, ws@0.4.31, engine.io-parser@1.1.0)
    └── socket.io-client@1.1.0 (to-array@0.1.3, indexof@0.0.1, component-bind@1.0.0, object-component@0.0.3, component-emitter@1.1.2, has-binary@0.1.5, socket.io-parser@2.2.2, parseuri@0.0.2, engine.io-client@1.4.0)

-->

2. INSTALL rabbitmq

apt-get install -y rabbitmq-server


3. INSTALL npm

apt-get install -y npm


4. RUN WITH nodejs EXECUTABLE

Because of a conflict with another package, the executable from the Ubuntu repositories is called nodejs instead of node

sudo su
nodejs /agua/apps/rabbit.js/example/socketio/server.js


MUST ISSUE nodejs COMMAND FROM INSIDE /a/bin/daemon DIRECTORY
(I.E., ***NOT INSIDE socketio DIRECTORY***)




NOTES
-----

apt-get install -y nodejs

    rabbitjs@0.0.20 node_modules/rabbitjs
    ├── methods@0.1.0
    ├── queuedo@0.9.8
    ├── commander@2.3.0
    ├── underscore@1.7.0
    ├── node-uuid@1.4.1
    ├── cron-parser@0.3.6
    ├── walkdo@0.9.6 (queuedo@0.9.7)
    ├── moment@2.5.1
    ├── fs-extra@0.9.1 (jsonfile@1.1.1, rimraf@2.2.8, ncp@0.5.1, mkdirp@0.5.0)
    ├── glob@3.2.11 (inherits@2.0.1, minimatch@0.3.0)
    ├── log4js@0.6.21 (semver@1.1.4, async@0.2.10, readable-stream@1.0.32)
    ├── mysql@2.1.1 (require-all@0.0.3, bignumber.js@1.0.1, readable-stream@1.1.13)
    ├── mongoose@3.8.16 (regexp-clone@0.0.1, sliced@0.0.5, muri@0.3.1, hooks@0.2.1, mpath@0.1.1, mpromise@0.4.3, ms@0.1.0, mquery@0.8.0, mongodb@1.4.9)
    ├── jade@1.1.5 (character-parser@1.2.0, commander@2.1.0, mkdirp@0.3.5, monocle@1.1.51, with@2.0.0, transformers@2.1.0, constantinople@1.0.2)
    ├── sequelize@2.0.0-rc1 (dottie@0.2.4, toposort-class@0.3.1, inflection@1.4.2, generic-pool@2.1.1, validator@3.16.1, sequelize-bluebird@2.1.0, lodash@2.4.1, moment@2.7.0, sql@0.39.0)
    └── express@3.4.8 (merge-descriptors@0.0.1, range-parser@0.0.4, debug@0.8.1, cookie-signature@1.0.1, fresh@0.2.0, buffer-crc32@0.2.1, cookie@0.1.0, mkdirp@0.3.5, commander@1.3.2, send@0.1.4, connect@2.12.0)




    

</entry>
<entry [Sun 2014:04:20 19:43:10 EST] TROUBLESHOOTING rabbit.js>

SUMMARY:

1. OPEN PORTS: 5672 (rabbitmq), 4369 (epmd)

2. FIX /etc/hosts: 127.0.0.1 hostname

3. RESTART RABBITMQ
service rabbitmq-server restart


PROBLEM

CAN'T STARTUP UP RABBITJS server.js

service rabbitmq-server start		[FAIL]


SOLUTION


1. EDITED /etc/hosts ADDED:

127.0.0.1 master


service rabbitmq-server restart
 * Restarting message broker rabbitmq-server                                                    [ OK ] 




NB: WHEN ADDED WRONG ENTRY '127.0.0.0 master', GOT THIS ERROR:

service rabbitmq-server start
 * Starting message broker rabbitmq-server                                                              * FAILED - check /var/log/rabbitmq/startup_\{log, _err\}
                                                            


tail /var/log/rabbitmq/startup_log
	
	ERROR: epmd error for host master: address (cannot connect to host/port)

tail /var/log/rabbitmq/startup_err
	EMPTY	
	

epmd RUNS ON PORT 4369

$ epmd: Sat Mar  1 22:57:34 2014: there is already a epmd running at port
4369


OPENED PORT 4369

	OK
	
AND VERIFIED epmd IS LISTENING:

root@master:/agua/bin/openstack# np 4369
tcp        0      0 0.0.0.0:4369            0.0.0.0:*               LISTEN      1111/epmd


telnet


</entry>
<entry [Sun 2014:04:20 19:42:19 EST] TROUBLESHOOTING socket.io WITH AGUA>
	
	
PROBLEM

https://localhost:8080

GIVES 'SSL ERROR'


CURRENT VERSION OF NODE AND NPM:

node -v
	v0.10.15
npm -v
	1.3.5

UPDATED VERSION:

sudo npm cache clean -f
sudo npm install -g n
sudo n stable

NEW VERSIONS:

npm -v
	1.4.3
node -v
	v0.10.26


SOLUTION

UPDATE index.html

LINE 28:

//      var conn = io.connect('http://localhost:8080');
      var conn = io.connect('https://localhost:8080');


RUN https.js:

node /aguadev/apps/node-amqp/node_modules/rabbit.js/example/socketio/https.js


var http = require('https');
//var http = require('http');
var url = require('url');
var fs = require('fs');
var io = require('socket.io');
var context = require('../../index').createContext();

// This line is from the Node.js HTTPS documentation.
var options = {
  key: fs.readFileSync('/etc/apache2/ssl.key/server.key'),
  cert: fs.readFileSync('/etc/apache2/ssl.key/server.crt')
};

var httpserver = http.createServer(options, handler);

//var httpserver = http.createServer(handler);


var socketioserver = io.listen(httpserver);

//var pub = context.socket('PUB');
//var sub = context.socket('SUB');

socketioserver.sockets.on('connection', function(connection) {
    var pub = context.socket('PUB');
    var sub = context.socket('SUB');

	connection.on('disconnect', function() {
		pub.destroy();
		sub.destroy();
	});

	// NB we have to adapt between the APIs
	sub.setEncoding('utf8');
	connection.on('message', function(msg) {
		pub.write(msg);
	});
	sub.on('data', function(msg) {
		connection.send(msg);
	});
	sub.connect('chat');
	pub.connect('chat');
});

console.log("BEFORE httpserver.listen(8080, '0.0.0.0')");

httpserver.listen(8080, '0.0.0.0');

console.log("AFTER httpserver.listen(8080, '0.0.0.0')");

// ==== boring detail

function handler(req, res) {
  var path = url.parse(req.url).pathname;

  console.log("handler    path: " + path);
  
  switch (path){
  case '/':
    path = '/index.html';
  case '/index.html':
    fs.readFile(__dirname + '/index.html', function(err, data){


      if (err) return send404(res);

		console.log("err: " + err)
		
      res.writeHead(200, {
		'Content-Type': 'text/html',
		'Access-Control-Allow-Origin' : '*'
		});
      res.write(data, 'utf8');
      res.end();
    });
    break;
  default: send404(res);
  }
}

function send404(res){
  res.writeHead(404);
  res.write('404');
  res.end();
}


</entry>
<entry [Tue 2014:03:18 01:17:34 EST] REDIRECT HTTP TO HTTPS>

http://stackoverflow.com/questions/7450940/automatic-https-connection-redirect-with-node-js-express


Ryan, thanks for pointing me in the right direction. I fleshed out your answer (2nd paragraph) a little bit with some code and it works. In this scenario these code snippets are put in my express app:

// set up plain http server
var http = express.createServer();

// set up a route to redirect http to https
http.get('*',function(req,res){  
    res.redirect('https://mydomain.com'+req.url)
})

// have it listen on 8080
http.listen(8080);
The https express server listens ATM on 3000. I set up these iptables rules so that node doesn't have to run as root:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 3000
All together, this works exactly as I wanted it to.
	
</entry>
<entry [Mon 2014:03:17 00:22:36 EST] NODE FASTCGI>

npm install -g fastcgi

	/usr/local/bin/fastcgi -> /usr/local/lib/node_modules/fastcgi/cli.js
	fastcgi@0.1.3 /usr/local/lib/node_modules/fastcgi
	├── defaultable@0.7.2
	├── fastcgi-parser@0.1.5
	└── optimist@0.3.7 (wordwrap@0.0.2)


/usr/local/bin/fastcgi -h
Usage: fastcgi [options] < FastCGI program> [program arg1] [arg2] [...]

Options:
  --die      Exit after serving one request                                   [boolean]
  --log      Path to log file                                               
  --port     Listening port number                                            [required]
  --max      Maximum allowed subprocesses                                     [default: 25]
  --daemon   Daemonize (run in the background); requires --log and --pidfile  [boolean]
  --pidfile  Lockfile to use when daemonizing                               
  --socket   Unix socket FastCGI program will use                             [required]

Missing required arguments: port, socket



	
</entry>
<entry [Sun 2014:03:16 23:57:07 EST] FIXED ERROR: 'Error: listen EACCES'>

PROBLEM

GET ERROR WHEN RUN node cgi.js

/mnt/repos/private/syoung/notes/agua/private/bin/test/node/cgi$ node cgi.js 


events.js:72
        throw er; // Unhandled 'error' event
              ^
Error: listen EACCES
    at errnoException (net.js:901:11)


DIAGNOSIS

As as a general rule processes running without root privileges cannot bind to ports below 1024.


SOLUTION

USE A HIGHER PORT NUMBER

RUN AS ROOT BOUND TO LOW PORT NUMBER THEN DOWNGRADE PRIVILEGES USING:

process.setgid
process.setuid

	
</entry>
<entry [Sun 2014:03:16 14:58:16 EST] SECURE NODE WITH SOCKETS>

http://stackoverflow.com/questions/17619401/socket-io-security-and-multiplayer

QUESTION

I'm currently making a online game and I'm wondering about the security of Node.js and socket.io.

Current State of the Game

All my

	io.sockets.on('connection', function (socket) {
		socket.on('request', function (data) {
	}) });

are secure. Players can emit any request (request refers to 'request' in this example) with any data (refers to 'data') and they won't be able to take avantage of it, even if they manually modify what request and data they emit and bypass client basic security. They also won't be able to make the server crash by sending invalide data.

Note: I only have 2 emits : emitting user/pass to log in and emitting input. The server sends data via various 'emit' though. There's no 'usual' notion of session(), or GET/POST. On client side, I'm exclusively using

	var socket = io.connect('http://something:3000');
	socket.emit('request', data);

For the static resources that players will need to get the code + images, it looks like:

	app.use(express.static(__dirname + '/public'));

For database:

	client = mysql.createConnection({  host: 'localhost',  user: 'root',   password: 'something',});
	client.connect(); client.query('USE dbname'); 


And finally for routing?, I show the same page, no matter the request:

	app.get('/', function (req, res) { 
		 res.sendfile(__dirname + '/index.html'); 
	});


Concerns:

Could someone access my database by other ways than emitting an injection?
Could someone modify the static resources that are loaded by everyone?
Could someone have access to the whole server script or modify in a way its variables?
Is there a way to limit maximum concurrent connections and maximum amount of data sent at once?
Do I need any security module at all?
Any other concern you think is appropriate.
Thanks a lot.

node.js security express socket.io
share|improve this question
asked Jul 12 '13 at 16:17


ANSWER:

Regarding what you've got right now - everything looks totally fine. Apart of that you dont use message names, but patch everything into request message. Dont think that this is good way, and there is no security reasons I can see behind such decision. As well you can subscribe and unsubscribe to different socket messages - makes it easier to manage 'visibility' of request points.

There are two ways you can look at security of your applications:

Technical
It relates to your setup of server, database credentials, firewall, rights to files, domain names and other bits, that are not directly from application it self.
Your concern here is make sure that access to server is not easy, and modifying files even more complex. Although there is always risk in any case, even most protected.
Reliable hosting services (Clouds here are most secure imho).
Access credentials to server - have to be secured as well. Even if someone will get those, still it should require them some time to get into your services and database. Have ability to resist this (firewall, ftp/ssh settings, etc).

Logical
This point of view on your security focuses specifically on your application logic and ability to somehow overcome it.
It is big topic though, and you might want to read generally some books about that.
Simplest things to think about is some generic rules over the way you architecture. For example:

Only server makes decisions. This is especially true for games.
Do not trust client in decisions at all. As trust - leads to cheating. It is more work for server, but it is less work after in order to prevent cheaters. So start early with right 'political' interactions between 'asking clients', and 'deciding server'.
Validate EVERYTHING, and throw errors/disconnects when something very wrong comes to server.
Logging but carefully (don't write to files everything - that might lead to security issues, especially if you use some html based log systems, you can inject JS - through http request - is potentially danger.
No eval ever on server side.
Password Hashing - for passwords and other stuff. As well keep secure your 'salts' and 'spices' :D. So that way even breaking into your database, will not allow anyone to access passwords easily.
Use sessions to store data. Sessions will help you in the future to scale your application horizontally, as limiting to one process and storing stuff in-memory - is efficient, but not scalable.
Authentication - use reliable methods, possibly SSL (WSS, HTTPS).
Know what you use - this helps to prevent unexpected behaviour of modules as much as possible.
Know how it works - for example with sessions - you need to know how identification mechanism works (cookies, etc), and how session data is stored (in-memory, db, redis, etc)
share|improve this answer
edited Jan 6 at 9:53


	
</entry>
<entry [Tue 2014:03:11 01:48:21 EST] WHY USE NODE?>


http://www.toptal.com/nodejs/why-the-hell-would-i-use-node-js


	
</entry>
<entry [Thu 2014:03:06 23:24:12 EST] DEBUG node.js WITH MOCHA AND node-inspector>
	
https://github.com/node-inspector/node-inspector

http://dailyjs.com/2013/08/22/mocha-debugger/


	
</entry>
<entry [Thu 2014:03:06 22:57:07 EST] INSTALLED semver>

https://github.com/isaacs/node-semver

npm install semver


semver.valid('1.2.3') // '1.2.3'
semver.valid('a.b.c') // null
semver.clean('  =v1.2.3   ') // '1.2.3'
semver.satisfies('1.2.3', '1.x || >=2.5.0 || 5.0.0 - 7.2.3') // true
semver.gt('1.2.3', '9.8.7') // false
semver.lt('1.2.3', '9.8.7') // true


</entry>
<entry [Thu 2014:03:06 20:16:47 EST] USE then INSTEAD OF NESTED FUNCTIONS>

1. USE Futures.sequence

Using deferreds like Futures.

var sequence = Futures.sequence();

sequence
  .then(function(next) {
     http.get({}, next);
  })
  .then(function(next, res) {
     res.on("data", next);
  })
  .then(function(next, d) {
     http.get({}, next);
  })
  .then(function(next, res) {
    ...
  })
If you need to pass scope along then just do something like this

  .then(function(next, d) {
    http.get({}, function(res) {
      next(res, d);
    });
  })
  .then(function(next, res, d) { })
    ...
  })


2. USE request

var request = require('request');
var APIs = [ '/api_1.php', '/api_2.php', '/api_3.php' ];
var host = 'www.example.com';
var APIs = APIs.map(function (api) {
  return 'http://' + host + api;
});

function callAPIs ( host, APIs ) {
  var API = APIs.shift();
  request(API, function(err, res, body) { 
    if( APIs.length ) {
      callAPIs ( host, APIs );
    }
  });
}
callAPIs( host, APIs );


3. ASYNC request 

var request = require('request');
var async = require('async');
var APIs = [ '/api_1.php', '/api_2.php', '/api_3.php' ];
var host = 'www.example.com';
var APIs = APIs.map(function (api) {
  return 'http://' + host + api;
});

async.eachSeries(function (API, cb) {
  request(API, function (err, res, body) {
    cb(err);
  });
}, function (err) {
  //called when all done, or error occurs
});


4. RECURSIVE FUNCTION WITH LIST OF APIs

var APIs = [ '/api_1.php', '/api_2.php', '/api_3.php' ];
var host = 'www.example.com';

function callAPIs ( host, APIs ) {
  var API = APIs.shift();
  http.get({ host: host, path: API }, function(res) { 
    var body = '';
    res.on('data', function (d) {
      body += d; 
    });
    res.on('end', function () {
      if( APIs.length ) {
        callAPIs ( host, APIs );
      }
    });
  });
}

callAPIs( host, APIs );


</entry>
<entry [Sun 2013:12:15 06:07:52 EST] GROUPON node.js ARCHITECTURE>

https://engineering.groupon.com/2013/misc/i-tier-dismantling-the-monoliths/
	
</entry>
<entry [Mon 2013:12:02 19:05:54 EST] ENABLE 23ANDME API node PROJECT>

1. DOWNLOADED FROM GITHUB

cd /mnt/repos/private/syoung
git clone


2. INSTALL DEPENDENCIES

cd api-
npm install


3. RUN (AS ROOT?)



	
</entry>
<entry [Sat 2013:11:23 22:09:54 EST] Streamline.js FOR ASYNCHRONOUS JAVASCRIPT CODE>

https://github.com/Sage/streamlinejs

ASYNCHRONOUS JAVASCRIPT FOR DUMMIES
http://bjouhier.wordpress.com/2011/01/09/asynchronous-javascript-the-tale-of-harry/


    
    
</entry>
<entry [Thu 2013:11:14 00:45:31 EST] RUN test-mysql.js NODE SCRIPT AS DAEMON ON UBUNTU WITH UPSTART>

http://jacobmumm.com/2011/08/29/node-as-a-service-in-ubuntu-11-04-with-upstart-monit-and-forever-js/

ALTERNATIVES:

USE forever BECAUSE ALLOWS YOU TO START/STOP EASILY
USE monit FOR SEPARATION OF MONITORING FROM RUNNING node.js CODE

1. CREATE TEST SCRIPT

/home/syoung/notes/agua/private/bin/test/node/mysql/test-mysql.js

2. LOAD DATABASE

mysql -u root -p -NBe "CREATE DATABASE nodetest"
mysql -u root -p < nodetest.dump


3. INSTALL RUN SCRIPT TO START AT BOOT

emacs -nw /etc/init/test-mysql.conf

description "Test MySQL"
author "Stuart Young"

start on (local-filesystems and net-device-up IFACE=eth0)
stop on shutdown

respawn

script
    cd /home/syoung/notes/agua/private/bin/test/node/mysql

    # exec /usr/local/bin/node test-mysql.js 2>&1 >> /var/log/test-mysql.log
    /usr/local/bin/forever test-mysql.js 2>&1 >> /var/log/test-mysql.log
end script


2. REBOOT AND CONFIRM

localhost:8000
    
    OK


3. KILL AND CONFIRM

killp

#### KILL A PROCESS RUNNING IN netstat BY PORT NUMBER                           
function killp() {
    if [ -z "$1" ]; then
        exit;
    fi

    pid=$(netstat -ntulp | grep $1 | xargs -n 1 | grep node | sed "s/\/node//")\
;
    echo "DOING kill -9 " $pid
    kill -9 $pid;
}


localhost:8000

    OK


NOTES
-----

What is Upstart?

Quoting from http://upstart.ubuntu.com/,

Upstart is an event-based replacement for the /sbin/init daemon which handles starting of tasks and services during boot, stopping them during shutdown and supervising them while the system is running.

EXAMPLE UPSTART SCRIPT

Here is a basic upstart config that we can store in /etc/init


#/etc/init/myapp.conf
description "My Demo Node App"
author "Me"

start on (local-filesystems and net-device-up IFACE=eth0)
stop on shutdown

script
    cd /page/to/app/
    exec /path/to/node app.js 2>&1 >> /var/log/myapp.log
end script

 
</entry>
<entry [Wed 2013:11:13 23:56:35 EST] INSTALL node-mysql>

1. CHECK LATEST VERSION OF node-mysql

https://github.com/felixge/node-mysql


2. INSTALL node-mysql

npm install mysql@2.0.0-alpha9 -g

    npm http GET https://registry.npmjs.org/mysql/2.0.0-alpha9
    npm http 200 https://registry.npmjs.org/mysql/2.0.0-alpha9
    npm http GET https://registry.npmjs.org/mysql/-/mysql-2.0.0-alpha9.tgz
    npm http 200 https://registry.npmjs.org/mysql/-/mysql-2.0.0-alpha9.tgz
    npm http GET https://registry.npmjs.org/require-all/0.0.3
    npm http GET https://registry.npmjs.org/bignumber.js/1.0.1
    npm http 200 https://registry.npmjs.org/require-all/0.0.3
    npm http GET https://registry.npmjs.org/require-all/-/require-all-0.0.3.tgz
    npm http 200 https://registry.npmjs.org/bignumber.js/1.0.1
    npm http GET https://registry.npmjs.org/bignumber.js/-/bignumber.js-1.0.1.tgz
    npm http 200 https://registry.npmjs.org/require-all/-/require-all-0.0.3.tgz
    npm http 200 https://registry.npmjs.org/bignumber.js/-/bignumber.js-1.0.1.tgz
    mysql@2.0.0-alpha9 /usr/local/lib/node_modules/mysql
    ├── require-all@0.0.3
    └── bignumber.js@1.0.1

    
3. CREATE test-mysql.js

/home/syoung/notes/agua/private/bin/test/node/test-mysql.js


// Include http module, 
var http = require('http'), 
// And mysql module you've just installed. 
   mysql = require("mysql"); 
     
// Create the connection. 
// Data is default to new mysql installation and should be changed according to your configuration. 
var connection = mysql.createConnection({ 
   user: "root", 
   password: "", 
   database: "db_name"
}); 
 
// Create the http server. 
http.createServer(function (request, response) { 
   // Attach listener on end event. 
   request.on('end', function () { 
      // Query the database. 
      connection.query('SELECT * FROM your_table;', function (error, rows, fields) { 
         response.writeHead(200, { 
            'Content-Type': 'x-application/json' 
         }); 
         // Send data as JSON string. 
         // Rows variable holds the result of the query. 
         response.end(JSON.stringify(rows)); 
      }); 
   }); 
// Listen on the 8080 port. 
}).listen(8080);


4. RUN test-mysql.js


cd /usr/local/lib/
node /home/syoung/notes/agua/private/bin/test/node/test-mysql.js



    
</entry>
<entry [Tue 2013:10:22 00:43:05 EST] RUN A NODE SCRIPT FOREVER WITH Forever>

http://blog.nodejitsu.com/keep-a-nodejs-server-up-with-forever

1. INSTALL forever

npm install forever -g

    /usr/local/bin/forever -> /usr/local/lib/node_modules/forever/bin/forever
    /usr/local/bin/foreverd -> /usr/local/lib/node_modules/forever/bin/foreverd
    forever@0.10.9 /usr/local/lib/node_modules/forever
    ├── colors@0.6.0-1
    ├── watch@0.7.0
    ├── timespan@2.0.1
    ├── pkginfo@0.3.0
    ├── optimist@0.4.0 (wordwrap@0.0.2)
    ├── nssocket@0.5.1 (eventemitter2@0.4.13, lazy@1.0.11)
    ├── utile@0.1.7 (deep-equal@0.1.0, rimraf@1.0.9, ncp@0.2.7, async@0.1.22, mkdirp@0.3.5, i@0.3.2)
    ├── nconf@0.6.7 (ini@1.1.0, pkginfo@0.2.3, async@0.1.22, optimist@0.3.7)
    ├── cliff@0.1.8 (eyes@0.1.8, winston@0.6.2)
    ├── forever-monitor@1.2.3 (watch@0.5.1, ps-tree@0.0.3, minimatch@0.2.12, broadway@0.2.7)
    ├── flatiron@0.3.5 (optimist@0.3.5, director@1.1.10, broadway@0.2.7, prompt@0.2.9)
    └── winston@0.7.1 (cycle@1.0.2, stack-trace@0.0.7, async@0.2.9, eyes@0.1.8, request@2.16.6)

which forever
    /usr/local/bin/forever


2. CREATE SCRIPT simple-server.js

/home/syoung/notes/agua/private/bin/test/node/simple-server.js

    var util = require('util'),    
        http = require('http');
    
    http.createServer(function (req, res) {
      res.writeHead(200, {'Content-Type': 'text/plain'});
      res.write('hello, i know nodejitsu.')
      res.end();
    }).listen(8000);
    
    /* server started */  
    util.puts('> hello world running on port 8000');

    
3. RUN SCRIPT WITH Forever

cd /home/syoung/notes/agua/private/bin/test/node
forever start simple-server.js

    warn:    --minUptime not set. Defaulting to: 1000ms
    warn:    --spinSleepTime not set. Your script will exit if it does not stay up for at least 1000ms
    info:    Forever processing file: simple-server.js

forever list

    info:    Forever processes running
    data:        uid  command             script           forever pid  logfile                 uptime       
    data:    [0] hYIJ /usr/local/bin/node simple-server.js 7628    7630 /root/.forever/hYIJ.log 0:0:0:24.103 
    

4. STOP simple-server.js

forever stop 0

    info:    Forever stopped process:
    data:        uid  command             script           forever pid  logfile                 uptime       
    [0] hYIJ /usr/local/bin/node simple-server.js 7628    7630 /root/.forever/hYIJ.log 0:0:1:43.147 




NOTES
-----

FULL USAGE:

https://github.com/nodejitsu/forever/blob/master/README.md

  $ [sudo] npm install forever -g
Note: If you are using forever programatically you should install forever-monitor.

  $ cd /path/to/your/project
  $ [sudo] npm install forever-monitor
Usage

There are two distinct ways to use forever: through the command line interface, or by requiring the forever module in your own code. Note: If you are using forever programatically you should install forever-monitor.

Using forever from the command line

You can use forever to run any kind of script continuously (whether it is written in node.js or not). The usage options are simple:

<!--

$ forever --help
  usage: forever [action] [options] SCRIPT [script-options]

  Monitors the script specified in the current process or as a daemon

  actions:
    start               Start SCRIPT as a daemon
    stop                Stop the daemon SCRIPT
    stopall             Stop all running forever scripts
    restart             Restart the daemon SCRIPT
    restartall          Restart all running forever scripts
    list                List all running forever scripts
    config              Lists all forever user configuration
    set <key> <val>     Sets the specified forever config <key>
    clear <key>         Clears the specified forever config <key>
    logs                Lists log files for all forever processes
    logs <script|index> Tails the logs for <script|index>
    columns add <col>   Adds the specified column to the output in `forever list`
    columns rm <col>    Removed the specified column from the output in `forever list`
    columns set <cols>  Set all columns for the output in `forever list`
    cleanlogs           [CAREFUL] Deletes all historical forever log files

  options:
    -m  MAX          Only run the specified script MAX times
    -l  LOGFILE      Logs the forever output to LOGFILE
    -o  OUTFILE      Logs stdout from child script to OUTFILE
    -e  ERRFILE      Logs stderr from child script to ERRFILE
    -p  PATH         Base path for all forever related files (pid files, etc.)
    -c  COMMAND      COMMAND to execute (defaults to node)
    -a, --append     Append logs
    -f, --fifo       Stream logs to stdout
    -n, --number     Number of log lines to print
    --pidFile        The pid file
    --sourceDir      The source directory for which SCRIPT is relative to
    --minUptime      Minimum uptime (millis) for a script to not be considered "spinning"
    --spinSleepTime  Time to wait (millis) between launches of a spinning script.
    --plain          Disable command line colors
    -d, --debug      Forces forever to log debug output
    -v, --verbose    Turns on the verbose messages from Forever
    -s, --silent     Run the child script silencing stdout and stderr
    -w, --watch      Watch for file changes
    --watchDirectory Top-level directory to watch from
    -h, --help       You're staring at it

  [Long Running Process]
    The forever process will continue to run outputting log messages to the console.
    ex. forever -o out.log -e err.log my-script.js

  [Daemon]
    The forever process will run as a daemon which will make the target process start
    in the background. This is extremely useful for remote starting simple node.js scripts
    without using nohup. It is recommended to run start with -o -l, & -e.
    ex. forever start -l forever.log -o out.log -e err.log my-daemon.js
        forever stop my-daemon.js
        
-->        

BASIC USAGE:

The usage options for Forever expose four simple command line tasks: start, stop, stopall, list:
usage: forever [start | stop | stopall | list] [options] SCRIPT [script options]

options:
  start          start SCRIPT as a daemon
  stop           stop the daemon SCRIPT
  stopall        stop all running forever scripts
  list           list all running forever scripts


Forever TEMP FILES IN /tmp/forever/pids

Forever keeps track of running processes in *.fvr files that are placed in

/tmp/forever/pids

Each Forever process will generate a unique log file placed in /tmp/forever/*.log
The output of the child process' stdout and stderr will be written to the log file.

    
</entry>
<entry [Sat 2013:09:21 07:20:24 EST] FIXED server.js ERROR: 'TypeError: Cannot call method 'on' of undefined'>

PROBLEM

node  /usr/local/lib/node_modules/rabbit.js/example/socketio/server.js
    21 Sep 07:16:01 - socket.io ready - accepting connections
    
    /usr/local/lib/node_modules/rabbit.js/example/socketio/server.js:11
    socketioserver.sockets.on('connection', function(connection) {
                           ^
    TypeError: Cannot call method 'on' of undefined


SOLUTION



    
</entry>
<entry [Fri 2013:09:20 05:07:38 EST] FIXED ERROR: '(node) warning: possible EventEmitter memory leak detected. 11 listeners added'>

PROBLEM

GET THIS ERROR WHEN RUN server.js IN RABBITJS

 node /aguadev/apps/node-amqp/node_modules/rabbit.js/example/socketio/server.js
    
    info  - socket.io started
    (node) warning: possible EventEmitter memory leak detected. 11 listeners added. Use emitter.setMaxListeners() to increase limit.


DIAGNOSIS

http://stackoverflow.com/questions/15581978/nodejs-how-to-debug-eventemitter-memory-leak-detected-11-listeners-added

It turns out that this is a bug in nodejs core, we are talking about this problem here :

https://github.com/joyent/node/issues/5108

Solution for bugged http servers thats throw an EventEmitter memory leak detected and fill up the available memory / available CPU times :

Revert to legacy version v0.8.23.

You can download and install/compile it from here :

http://blog.nodejs.org/2013/04/08/node-v0-8-23-legacy/


SOLUTION


**** INSTALLED RABBITMQ ****
NOW GET DIFFERENT ERROR:

node  /usr/local/lib/node_modules/rabbit.js/example/socketio/server.js

    21 Sep 07:16:01 - socket.io ready - accepting connections
    
    /usr/local/lib/node_modules/rabbit.js/example/socketio/server.js:11
    socketioserver.sockets.on('connection', function(connection) {
                           ^
    TypeError: Cannot call method 'on' of undefined



INSTALL LATEST VERSION

http://nodejs.org/dist/v0.10.18/node-v0.10.18-linux-x64.tar.gz

OR

INSTALL VERSION 0.8.23

http://blog.nodejs.org/2013/04/08/node-v0-8-23-legacy/

    
</entry>
<entry [Tue 2013:08:27 15:20:13 EST] RUN NODE.JS AS DAEMON ON UBUNTU>

http://howtonode.org/deploying-node-upstart-monit


1. CREATE UPSTART SCRIPT

/etc/init/rabbitjs.conf:

description "rabbit.js server"
author      "Agua"

start on startup
stop on shutdown

respawn

script
    export HOME="/root"

    echo $$ > /var/run/rabbitjs.pid
    exec sudo -u root /usr/local/bin/node /aguadev/apps/node-amqp/node_modules/rabbit.js/example/socketio/server.js >> /var/log/rabbitjs.log 2>&1
end script

pre-start script
    # Date format same as (new Date()).toISOString() for consistency
    echo "[`date -u +%Y-%m-%dT%T.%3NZ`] (sys) Starting" >> /var/log/rabbitjs.log
end script

pre-stop script
    rm /var/run/yourprogram.pid
    echo "[`date -u +%Y-%m-%dT%T.%3NZ`] (sys) Stopping" >> /var/log/rabbitjs.log
end script


2. MAKE FILE EXECUTABLE

chmod 755 /etc/init/rabbitjs.conf:


3. 


NOTES
-----


Deploying Node.js With Upstart and Monit
So you like Node.js? You want to deploy it?

If I heard two "Yes"'s, then you are in the some boat as me, and being in that boat feels really really vulnerable. Like the kind of vulnerable you would feel if you were trapped in a cage with lions. And here is why:

If Node.js decides to crash, you are screwed.
If the above isn't enough for you, then you may need to reconsider.
There are two well-known technologies that can save us from this mess, and you'd better believe we're going to use them!

Problems

The first problem we will get thrown by, is the fact that we cannot run Node.js as a daemon. A daemon, for the unaware, is a child process that spawns from a process, leaving the parent to die. Tragic story I know, but this allows things to run in the background. But why is this a problem? Well if Kevin's blog post isn't enough for you, it essentially allows one to separate node from any form of interface, meaning terminal doesn't have stay open all day. I highly recommend you pause now and read Kevin's material, as it will expand more on daemonizing the node process.

upstart

As Kevin stated in his blog, the first tool we are going to look at is upstart, which will allow us to:

Run Node.js as a daemon

Provide an easy set of commands for stop / starting our Node.js application
Most linux distributions that have a decent package manager which will allow you to install upstart the easy way. On debian systems this is usually:

#!sh
sudo apt-get install upstart

If you're running the latest Ubuntu, you've got it built in already.

Otherwise you will need to configure and compile from source, and this blog post will not go off topic! So we resume...

We now will want to configure upstart, and I am shamelessly borrowing Kevin's example:

CREATE FILE /etc/init/yourprogram.conf:

#!upstart
description "node.js server"
author      "joe"

start on startup
stop on shutdown

script
    export HOME="/root"

    echo $$ > /var/run/yourprogram.pid
    exec sudo -u username /usr/local/bin/node /where/yourprogram.js >> /var/log/yourprogram.log 2>&1
end script

pre-start script
    # Date format same as (new Date()).toISOString() for consistency
    echo "[`date -u +%Y-%m-%dT%T.%3NZ`] (sys) Starting" >> /var/log/yourprogram.log
end script

pre-stop script
    rm /var/run/yourprogram.pid
    echo "[`date -u +%Y-%m-%dT%T.%3NZ`] (sys) Stopping" >> /var/log/yourprogram.log
end script



You will need to replace username with the user you want to run node as, /where/yourprogram.js with the location of your application, /var/run/yourprogram.pid with your program's pid file and /var/log/yourprogram.log with the location of your log file. You can then save this file to /etc/init/yourprogram.conf for later use. (Dont't forget to make it executable!) If you are using an older linux distribution, you may need to save the file to /etc/event.d/yourprogram

Using your program is now a cinch:

#!sh
start yourprogram
stop yourprogram


And now node will automatically start at boot and log output to /var/log/node.log. But I assumed you read all that on Kevin's blog, right? Moving on...

The real problem
Turning your application into a daemon isn't enough. A daemon can still crash, and those lions are getting awfully close. We need a tool that keeps an eye out for any falls our node instances may have. When something crashes our server, we need that tool to take evasive action. Also that tool should be capable of expanding its reach to any other services our app may need; such as databases and nginx instances. Thankfully this isn't taken lightly by most, and several helpful tools that fit our description do exist.

monit
Now that we have our application in a easy to manage form, we need to look at the real issue we are facing. What happens when Node.js crashes? Fortunately for us mortals someone has done most of the hard work for us, and blessed us with the monit utility. Essentially monit is a monitoring tool, which you configure tests that will be evaluated at certain intervals. If one of the tests fails, then it will take action depending on the rules you assign to it.

I'm not going to tell you how to install it, their website has plenty on information for that, but here instead is an example config file designed for our upstart node daemon will made earlier:

#!monit
set logfile /var/log/monit.log

check process nodejs with pidfile "/var/run/yourprogram.pid"
    start program = "/sbin/start yourprogram"
    stop program  = "/sbin/stop yourprogram"
    if failed port 8000 protocol HTTP
        request /
        with timeout 10 seconds
        then restart
You can save this in /etc/monit/monitrc. Here is the break down:

set logfile /var/log/monit.log

check process nodejs with pidfile "/var/run/yourprogram.pid"
This will tell monit to log all output to /var/log/monit.log, and it also gives our node instance a name and location. I am assuming monit will be running on the same machine as your node app, so we will need to listen on 127.0.0.1 . If you wanted to run monit on another box, you most certainly can, in fact I recommend have multiple instances of monit running in different locations. You just have to ensure that monit is listening on the correct IP address, otherwise monit is rendered useless. The next part is the vital part, which defines how we will test for failures:

#!monit
start program = "/sbin/start yourprogram"
stop program  = "/sbin/stop yourprogram"
if failed port 8000 protocol HTTP
    request /
    with timeout 10 seconds
    then restart
The first two lines should be self-explanatory, this defines how monit will start and stop your application. You will need to specify an absolute path to upstart's start and stop utilities, while suffixing your application name as an argument.

The third line is the crux of monit's usefulness. If we were running our application on port 8000, serving through the HTTP protocol, then this would apply. Monit will perform an analysis on the specified port and protocol, and if its routines discover that something is not right, it will execute the next few lines. Monit has lots of different options for dealing with service failures, such as sending e-mails and restarting servers. In this case we are going to do a simple request to the root of the local domain, and if 10 seconds pass without the expected response, monit will restart the application.

Now all that is left, is to start your application, then set monit off to do its tedious task of saving the world from crashing servers.

#!monit
sudo start yourprogram
monit -d 60 -c /etc/monit/monitrc
Setting the -d 60 flag tells monit to check against your configuration every 60 seconds. I recommend setting this to the same time as any response timeouts you may have installed. You have now passed monit 101! Easy, huh?

Monit's useful-ness doesn't hit a brick wall there either, monit can be extended further to monitor the other services your web application relies upon. This may range from databases to nginx instances. Their website has many more examples and configurations, and even more again can be found littered over the internet.
    
</entry>
<entry [Tue 2013:04:30 15:32:17 EST] KILLER COMBINATION - NODE + EXPRESS + RABBITMQ + MONGODB>

http://blog.chiradip.com/2012/05/node-js-knockout-js-mongo-db-rabbitmq-the-killer-combination-.html

Node JS, Knockout JS, Mongo DB, RabbitMQ - the killer combination

Lets start with the Node JS for the first installment
======================================================
QUICK NOTE: By readers request - browse towards the end to find file upload example using Node and formidable. 

Seriously. Look at the below code snippet.

    var http = require('http')  
    http.createServer(function(request, response) {     
        response.writeHead(200, {"Content-Type":"text/plain"})  
        response.write("Hello World")   
        response.end() 
    }).listen(8888)

And you wrote a HTTP server. Its as easy. This is not the end but just the start. This is written in NodeJS. You can find the Node installation guide here. To run this issue this in the terminal node server.js - assuming you wrote the above code in a file called server.js. Then fire a browser and access localhost:8888 - and we will see "Hello world" printed on your browser. Another thing to note in the above code snippet - we passed an anonymous function to anther function - which is an important characteristic of a functional language. Why should I consider NodeJS in the first place? There are so many to choose from. Alright, not all technologies are fit for everything. Node is not fit for everything too. It has its own forte. Java and likes are good in their area Node and likes are good in their territory. Node JS suits well at the frontend server layer - that supplies webpages, handles user interactions, constructs dynamic pages, talks to other system asynchronously. But why we should use Node in these areas? The major essence of the answer lies in the code snippet - Node is event driven. Does it make it fast? No - in raw speed it is not fast, but its being event-driven and asynchronous it provides better responsiveness to the users - does not block calls. This feature in Node is called evented IO - we will examine that later what it really is - and how it works. 

IMPATIENTS CAN SKIP THIS SECTION 
Now let me take a step back and tell you where I am going and why. The context is fairly complex web application. In web applications we need to consider user interaction, page rendering, occasionally internationalization/localization, form handling, file upload/download, interacting with other systems, information processing, algorithmic processing, etc. Not a single technology is good for all these tasks. In this post we are going to see a good technology stack that works - achieves better results.
IMPATIENTS CAN RESUME HERE 
Enough talks. Lets create a RESTful web-service. We will just refactor the the above code. server.js

    var http = require('http')
    var url = require('url')
    function start() {
        function onRequest(request, response) {
            var pathname = url.parse(request.url).pathname
            console.log("Request for pathname " + pathname + " received")
            response.writeHead(200, {"Content-Type": "text/plain"})
            response.write("Hello world from refactored server")
            response.end()
        }
         
        http.createServer(onRequest).listen(8888)
    }
    start()

To understand in little deeper Node nitigrities I recommend to start with awesome book The Node Beginner Book by Manuel Kiessling. The examples here are heavily influenced by this book. I refactored codes there in order to make it sometimes efficient and sometimes simple. Lets write one more program called router.js - a special program to handle the incoming requests. We will figure out how to use it in context.

    function route(pathname) {
        console.log("request for path - " + pathname + " received through function route")
    }
    exports.route = route


exports.route makes route (any member - here is a function) available to other programs - remember it. A little refactoring of server.js.

    var http = require('http')
    var url = require('url')
    function start(route) {
        function onRequest(request, response) {
            var pathname = url.parse(request.url).pathname
            route(pathname)
            response.writeHead(200, {"Content-Type": "text/plain"})
            response.write("Hello world from refactored server")
            response.end()
        }
         
        http.createServer(onRequest).listen(8888)
    }
    exports.start = start


Now see we exported the method start. That means we want to call it from another program and not executing within server.js. 

The difference here is in line 8. We are delegating the processing of pathname to another function route in another program - router.js. 

You can just run the server by adding 2 more lines - one in the beginning - var router = require('/router.js') and one in the end - start(router.route). Now run server.js. - node server.js. Point the browser to http://localhost:8888/anything and observe the console. 

If you want to make the server.js working without the additional two lines - which is the the right way - add another program - lets name is index.js. As simple as it could be -

    var server = require ('./server.js')
    var router = require('./router.js')
    server.start(router.route)


Run node index.js instead of server.js, hit the browser - observer the console. 

Cool, router.js so far is in very primitive stage now - lets enhance it. Lets introduce one more program called handler.js. That maps the incoming requests to appropriate functions.

    var handle = {}
    handle['/'] = start 
    handle['/start'] = start
    handle['/upload'] = upload 
    function start() {
        console.log("method start")
    }
    function upload() {
        console.log("method upload")
    }
      
    exports.handle = handle


In order to use this we need to refactor router.js, server.js remains unchanged. The refactored router.js

    var handler = require('./handler.js')
    var handle = handler.handle
    function route(pathname) {
        console.log("request for path - " + pathname + " received through function route")
         
        if(typeof handle[pathname] === 'function') {
            handle[pathname]()
        }
        else {
            console.log("No request handle found for pathname " + pathname)
        }
    }
    exports.route = route


Now you can just run node index.js. Access http://localhost:8888/start, try http://localhost:8888/upload and also try something other than satrt and upload, and observer the console. We have pretty decent HTTP server that has RESTful service capability. Being a heavy Spring 3.1/Roo user - I still can appreciate the rapid development capability using Node - more than rapid development capability - it has some more features that makes it appealing/useful. That is more directness - no big un-understandable convention over configuration theory - it has rather a very astute functional trait - simple and direct programming model. Productivity and great programming model alone can not be the criteria to choose a programming language - we must see what else it brings to us. Non-blocking evented IO is the coolest thing I have seen in a while, which makes user interaction more responsive. Node is not the best in many things - and we must not use it in those areas. Node is not very good in heavy information processing, algorithmic tasks etc. We can of course utilize Node's capability to delegate task in non-blocking way to other programs written in capable languages (may be to Scala or Java for the grandpas - I am uncle at this moment:)) for heavy processing and algorithmic tasks. And Node can be used to handle user interactions, page rendering and and a as top-middleware integration layers - that does the delegation without blocking. BTW - Node has very close connection with C++, and we may want to write some node stuffs in C++ - I have not done this yet myself, if anybody did it, please post your experience here. If we talk in official node dialect - Node is an one big, efficient event loop. To read more about it Mixu's tech blog - Understanding the node.js event loop 

FILE UPLOAD EXAMPLE - Using Node JS and Formidable 

Lets refactor the code to have a file upload application - I am going to post the the complete code and only code here. It is improved version of what is on the Manuel Kiessling's book. 

index.js

    var server = require ('./server.js')
    var router = require('./router.js')
    server.start(router.route)

server.js

    var http = require('http')
    var url = require('url')
    function start(route) {
        function onRequest(request, response) {
            var pathname = url.parse(request.url).pathname
            route(pathname, request, response)
        }
         
        http.createServer(onRequest).listen(8888)
    }
    exports.start = start


router.js

    var handler = require('./handler.js')
    var handle = handler.handle
    function route(pathname, request, response) {
        console.log("request for path - " + pathname + " received through function route")
         
        if(typeof handle[pathname] === 'function') {
            handle[pathname](request, response)
        }
        else {
            console.log("No request handle found for pathname " + pathname)
        }
    }
    exports.route = route

handler.js
<!--
    var handle = {}
    var querystring = require('querystring'),
        fs = require('fs'),
        formidable = require('formidable')
    handle['/'] = start 
    handle['/start'] = start
    handle['/upload'] = upload 
    handle['/show'] = show
    function start(request, response) {
        console.log("method start")
        response.writeHead(200, {"Content-Type": "text/html"})
        response.write(require('./pages.js').body)
        response.end()
    }
    function upload(request, response) {
         
        console.log("method upload has been called")
         
        response.writeHead(200, {"Content-Type": "text/html"})
         
        var form = formidable.IncomingForm()
         
        var util = require('util'),
            fields = [],
            files = [],
            i = 0
             
        form
        .on('error', function(err) {
            console.log("error handled?")
            response.end("=>Error occured. Did you try to access a post only link without post data?")
        })
        .on('field', function(field, value) {
            console.log(field, value)
            fields.push([field, value])
        })
        .on('file', function(field, file) {
            console.log(field, file)
            files.push([field, file])
            i += 1
            fs.rename(file.path, "/tmp/tttest"+i+".jpg", function(err) {
                console.log("renamed")
                if(err) {
                    console.log("error renaming")
                    fs.unlink("/tmp/test.jpg")
                    fs.rename(file.path, "/tmp/tttest"+i+".jpg")
                }
            })
            response.write("eeee <img src="/show" alt="">")
        })
        .on('end', function() {
            console.log(util.inspect(files))
            response.end("something got uploaded")
        })
         
        form.parse(request)
    }
    function show(request, response) {
        console.log("method show")
        fs.readFile("/tmp/tttest1.jpg", "binary", function(error, file) {
            if(error) {
                response.writeHead(500, {"Content-Type": "text/plain"})
                response.write("error" + "\n")
                response.end()
            } else {
                response.writeHead(200, {"Content-Type": "image/jpeg"})
                response.write(file, "binary")
                response.end()
            }
        })
    }
    exports.handle = handle

-->
pages.js
<!--
    var body = ''+
        ''+    
        ''+''+''+     
        '<form action="/upload" enctype="multipart/form-data" method="post">'+     
        '<input name="file" type="file">'+     
        '<input type="submit" value="Submit">'+     
        '</form>'+ 
        ''+     
        '';
-->     
exports.body = body
Just make sure this pages.js is well formatted. All other files should be good but since this one has HTML code into it - I made some deliberate spelling mistakes in tag names - make sure that are right and well formatted - and it will work. 

====== Enjoy the Node.JS - rest of the article will be available soon ====== 

Lets bring the Rabbit here - Welcome RabbitMQ. We just need it to delegate tasks from node to Java 

======= Adding ======
 

As the first step to integrating NodeJS and Java using AMQP (RabbitMQ), lets first see how to connect NodeJS and RabbitMQ - both publishing messages and consuming messages. A little bit of change in server.js, have a look.
 

server.js

    var http = require('http')
    var url = require('url')
    var amqp = require('amqp')
    function start(route) {
         
        var connection = amqp.createConnection({ host: 'localhost' })
         
        connection.setMaxListeners(200)
        connection.on('ready', function() {
            var exchange = connection.exchange('amq.fanout', {'type': 'fanout', durable: true}, function() {
                var queue = connection.queue('queueA', {durable: false, exclusive: true}, function() {
                     
                    queue.subscribe(function(msg) {
                        console.log("Message received: " + msg.data.toString())
                    })
                     
                    queue.bind('amq.fanout', 'key.b.a')
                     
                    queue.on('queueBindOk', function() {
                        http.createServer(onRequest).listen(8888)
                    })
                })
                function onRequest(request, response) {
                    var pathname = url.parse(request.url).pathname
                    route(pathname, request, response, exchange)
                }
            })
        })
    }
    exports.start = start

There are some changes in this code snippet above, lets analyze those chnages minutely before we go to the codes. Line number 11 - thats says connection.setMaxListeners(200) This one I had to use to get rid of one problem I was getting on the node console 
(node) warning: possible EventEmitter memory leak detected. 21 listeners added. Use emitter.setMaxListeners() to increase limit

Line number 6 is very straight forward - I just created the AMQP connection where my RabbitMQ was running on localhost on default port. Line number 9, I am doing everything when the connection with the AMQP server (tested with RabbitMQ only) is ready; which may not be the most efficient way as even the HTTP server is being created inside this - that makes HTTP server to depend hard on AMQP server - if AMQP server is not up HTTP server would not be up - bad design but I will let you figure out the best way to tackle it. A little bit of error handling can solve this problem easily. Line number 10-11 - it is very clear that I am creating Exchange and Queue, at line number 13-15 - this code will wait for messages in the defined queue, and if there is any message in the defined queue it will print it on the console. Line number 17 is just the queue binding - remember this is JavaScript and asynchronous so this line may get executed before others in this function. Line number 19-21 I am creating the HTTP server upon successful binding of the queue. Everything else remains same except one more line, line number 25, I added one more parameter to the function route(pathname, request, response, exchange), that is exchange, since this is required to publish a message to the designated queue, we are passing it to the router and then handler so that respective methods can use it in order to publish messages. As simple as that.
Lets look at router.js as the next piece of code, change is very small, only at one place - I am going to talk about that after the code snippet.

router.js

    var handler = require('./handler.js')
     
    var handle = handler.handle
     
    function route(pathname, request, response, exchange) {
        console.log("request for path - " + pathname + " received through function route")
         
        if(typeof handle[pathname] === 'function') {
            handle[pathname](request, response, exchange)
        }
        else {
            console.log("No request handle found for pathname " + pathname)
        }
    }
     
    exports.route = route

Change is only at line number 5 and line number 9; the new parameter exchange, if you remember I passed it from server.js. This will be used from a method in handler.js to publish messages to the defined queue. Lets see handler.js now.

Notice that I reduced handler.js code for brevity by deleting all file upload related part that was there before. Nevertheless, this code is fully functional, if you want to try this out.

handler.js

    var handle = {}
     
    var querystring = require('querystring'),
        fs = require('fs'),
        formidable = require('formidable')
     
    handle['/publish'] = publish
    handle['/messageform'] = messageform
     
     
    function messageform(request, response, exchange) {
        console.log("method messageform")
        response.writeHead(200, {"Content-Type": "text/html"})
        response.write(require('./messageform.js').body)
        response.end()
    }
     
    function publish(request, response, exchange) {
         
        var form = formidable.IncomingForm()
         
        form
        .on('error', function(err) {
            console.log("error handled?")
            response.end("=>Error occured. Did you try to access a post only link without post data?")
        })
        .on('field', function(field, value) {
            console.log(field, value)
            exchange.publish("key.a.b", value)
        })
        .on('end', function() {
            response.end("something good happened")
        })
         
        form.parse(request)
         
        console.log("method publish")
        response.writeHead(200, {"Content-Type": "text/html"})
        response.write(require('./messageform.js').body)
        response.end()
    }
     
    exports.handle = handle

We are almost done - if you run this project with node index.js and point your browser at http://localhost:8888/messageform, the line number 16 of the above code would be invoked. Now wait a minute you need one more file, thats the final one to demonstrate AMQP communication - that is messageform.js. Look at line number 19 in the above code and you will understand why that is required. Its essentially a HTML snippet. Its very difficult to list HTML file on typepad, let me see how much I can. You will get a clear idea in either way.

messageform.js

<!--
    var body = '<ht-ml>'+
    '<he-ad>'+    
    '<me-ta http-equiv="Content-Type" content="text/html; '+     
    'charset=UTF-8">'+'</me-ta></he-ad>'+'<bo-dy>'+     
    '</bo-dy></ht-ml>
'+     
    '<input name="message">'+     
    '<input type="submit" value="Submit">'+     
    ''+ 
    ''+     
    '';
 
exports.body = body
-->

Now once you run the project by using node index.js and point your browser at http://localhost:8888/messageform, you will see the magic. Do not forget to run RabbitMQ on your localhost too.

Node and Java communication - Now we understand how to publish and subscribe messages from NodeJS using AMQP server; its just easy to connect Java with NodeJS if we can write Java AMQP publish/subscribe code. Its just easy - spring-amqp also has a nice project to do that. I will write a simple Java program sometimes later if required. Let me know if that is something you guys want.

=================

NodeJS with MongoDB is coming soon - stay tuned. Want it fast - then get ready to pay for it :)


    
</entry>
<entry [Tue 2013:04:30 14:43:39 EST] FILE UPLOAD WITH Node>

1. CREATE SERVER FILE

mkdir -p /home/syoung/software/nodejs/upload
cd /home/syoung/software/nodejs/upload
emacs -nw server.js

<!--    
    var http = require("http");
    var url = require("url");
    var multipart = require("multipart");
    var sys = require("sys");
    var fs = require("fs");
    
    var server = http.createServer(function(req, res) {
        // Simple path-based request dispatcher
        switch (url.parse(req.url).pathname) {
            case '/':
                display_form(req, res);
                break;
            case '/upload':
                upload_file(req, res);
                break;
            default:
                show_404(req, res);
                break;
        }
    });
    
    // Server would listen on port 8000
    server.listen(8000);
    
    /*
     * Display upload form
     */
    function display_form(req, res) {
        res.sendHeader(200, {"Content-Type": "text/html"});
        res.write(
            '<form action="/upload" method="post" enctype="multipart/form-data">'+
            '<input type="file" name="upload-file">'+
            '<input type="submit" value="Upload">'+
            '</form>'
        );
        res.close();
    }
    
    /*
     * Create multipart parser to parse given request
     */
    function parse_multipart(req) {
        var parser = multipart.parser();
    
        // Make parser use parsed request headers
        parser.headers = req.headers;
    
        // Add listeners to request, transfering data to parser
    
        req.addListener("data", function(chunk) {
            parser.write(chunk);
        });
    
        req.addListener("end", function() {
            parser.close();
        });
    
        return parser;
    }
    
    /*
     * Handle file upload
     */
    function upload_file(req, res) {
        // Request body is binary
        req.setBodyEncoding("binary");
    
        // Handle request as multipart
        var stream = parse_multipart(req);
    
        var fileName = null;
        var fileStream = null;
    
        // Set handler for a request part received
        stream.onPartBegin = function(part) {
            sys.debug("Started part, name = " + part.name + ", filename = " + part.filename);
    
            // Construct file name
            fileName = "./uploads/" + stream.part.filename;
    
            // Construct stream used to write to file
            fileStream = fs.createWriteStream(fileName);
    
            // Add error handler
            fileStream.addListener("error", function(err) {
                sys.debug("Got error while writing to file '" + fileName + "': ", err);
            });
    
            // Add drain (all queued data written) handler to resume receiving request data
            fileStream.addListener("drain", function() {
                req.resume();
            });
        };
    
        // Set handler for a request part body chunk received
        stream.onData = function(chunk) {
            // Pause receiving request data (until current chunk is written)
            req.pause();
    
            // Write chunk to file
            // Note that it is important to write in binary mode
            // Otherwise UTF-8 characters are interpreted
            sys.debug("Writing chunk");
            fileStream.write(chunk, "binary");
        };
    
        // Set handler for request completed
        stream.onEnd = function() {
            // As this is after request completed, all writes should have been queued by now
            // So following callback will be executed after all the data is written out
            fileStream.addListener("drain", function() {
                // Close file stream
                fileStream.end();
                // Handle request completion, as all chunks were already written
                upload_complete(res);
            });
        };
    }
    
    function upload_complete(res) {
        sys.debug("Request complete");
    
        // Render response
        res.sendHeader(200, {"Content-Type": "text/plain"});
        res.write("Thanks for playing!");
        res.end();
    
        sys.puts("\n=> Done");
    }
    
    /*
     * Handles page not found error
     */
    function show_404(req, res) {
        res.sendHeader(404, {"Content-Type": "text/plain"});
        res.write("You r doing it rong!");
        res.end();
    }

-->



2. INSTALL multipart

sudo npm install multipart
    npm http GET https://registry.npmjs.org/multipart
    npm http 200 https://registry.npmjs.org/multipart
    npm http GET https://registry.npmjs.org/multipart/-/multipart-0.1.5.tgz
    npm http 200 https://registry.npmjs.org/multipart/-/multipart-0.1.5.tgz
    npm WARN package.json multipart@0.1.5 No README.md file found!
    npm http GET https://registry.npmjs.org/mime
    npm http 200 https://registry.npmjs.org/mime
    npm http GET https://registry.npmjs.org/mime/-/mime-1.2.9.tgz
    npm http 200 https://registry.npmjs.org/mime/-/mime-1.2.9.tgz
    multipart@0.1.5 node_modules/multipart
    └── mime@1.2.9


3. START SERVER

cd /home/syoung/software/nodejs/upload
node server.js


</entry>
<entry [Wed 2013:04:24 14:12:13 EST] CREATED APP WITH LOCOMOTIVE>

$ npm install locomotive -g
Create an Application

Now we can create an application, using lcm create < name>. In this quick tutorial, we'll create an app named hello.

$ lcm create hello
Now we'll switch into the newly created directory containing our app and install dependencies.

$ cd hello
$ npm install
Start the Server

$ lcm server
Our new app is now up and running at localhost:3000!

    OK
    
</entry>
<entry [Wed 2013:04:24 13:49:17 EST] INSTALLED locomotive ON syoung-dev>

1. INSTALL DEPENDENCIES

npm install express -g

    /usr/local/bin/express -> /usr/local/lib/node_modules/express/bin/express
    express@3.2.0 /usr/local/lib/node_modules/express
    ├── methods@0.0.1
    ├── fresh@0.1.0
    ├── range-parser@0.0.4
    ├── cookie-signature@1.0.1
    ├── buffer-crc32@0.2.1
    ├── cookie@0.0.5
    ├── debug@0.7.2
    ├── commander@0.6.1
    ├── mkdirp@0.3.5
    ├── send@0.1.0 (mime@1.2.6)
    └── connect@2.7.6 (pause@0.0.1, bytes@0.2.0, buffer-crc32@0.1.1, formidable@1.0.11, qs@0.5.1)



npm install locomotive -g

    /usr/local/bin/lcm -> /usr/local/lib/node_modules/locomotive/bin/lcm.js
    locomotive@0.3.6 /usr/local/lib/node_modules/locomotive
    ├── methods@0.0.1
    ├── debug@0.7.2
    ├── pkginfo@0.2.3
    ├── async@0.1.22
    ├── mkdirp@0.3.5
    ├── lingo@0.0.5
    ├── diveSync@0.2.0 (append@0.1.1)
    ├── commander@1.1.1 (keypress@0.1.0)
    └── express@3.2.0 (fresh@0.1.0, cookie-signature@1.0.1, range-parser@0.0.4, buffer-crc32@0.2.1, cookie@0.0.5, commander@0.6.1, send@0.1.0, connect@2.7.6)


</entry>