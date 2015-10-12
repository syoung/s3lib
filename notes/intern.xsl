intern


<entry [Fri 2014:11:14 00:52:24 EST] MOCK REQUEST WITH intern>

http://www.sitepen.com/blog/2014/07/14/mocking-data-with-intern/


Mocking data with Intern
When writing tests for an application, it’s prudent to add mock or stub data in order to allow code to be properly tested in isolation from other parts of the system. Within a normal Dojo application, there are typically three places where mocking will occur: I/O requests, stores, and module dependencies.


Mocking I/O requests
Implementing mock services makes it easy to decouple the testing of client-side application logic from server-side data sources. Most bugs that are reported in Web application development are initially reported against the client-side application. By having clearly-established tests against mock objects, it is easier to isolate the source of a bug, and determine if the error is the result of an unexpected change to an API, or a failing data service. This reduces the frequency of reporting bugs against the wrong component, and streamlines the process for identifying, resolving, and testing fixes to application source code.

Mocking services client-side can be accomplished fairly simply by creating a custom dojo/request provider using dojo/request/registry. The following simple example creates a simple mock for a /info service endpoint which is simply expected to yield a hard-coded object:


// in tests/support/requestMocker.js
define([
    'dojo/request/registry',
    'dojo/when'
], function (registry, when) {
    var mocking = false,
        handles = [];
 
    function start() {
        if (mocking) {
            return;
        }
 
        mocking = true;
 
        // Set up a handler for requests to '/info' that mocks a
        // response without requesting from the server at all
        handles.push(
            registry.register('/info', function (url, options) {
                // Wrap using `when` to return a promise;
                // you could also delay the response
                return when({
                    hello: 'world'
                });
            });
        );
    }
 
    function stop() {
        if (!mocking) {
            return;
        }
 
        mocking = false;
 
        var handle;
 
        while ((handle = handles.pop()) {
            handle.remove();
        }
    }
 
    return {
        start: start,
        stop: stop
    };
});
Once you have a mock service, dojo/request will need to be configured to use the request registry so that the mock provider can be loaded:

// in tests/intern.js
var dojoConfig = {
    requestProvider: 'dojo/request/registry'
};
define({
    // … Intern configuration
});
Finally, the unit test itself will load the mock service and enable it during the test suite’s execution:

// in tests/unit/app/Controller.js
define([
    'intern!tdd',
    'intern/chai!assert',
    './support/requestMocker',
    'app/Controller'
], function (tdd, assert, requestMocker, Controller) {
    tdd.suite('app/Controller', function () {
        // start the data mocker when the test suite starts,
        // and stop it after the suite suite has finished
        tdd.before(function () {
            requestMocker.start();
        });
 
        tdd.after(function () {
            requestMocker.stop();
        });
 
        tdd.test('GET /info', function () {
            // this code assumes Controller uses dojo/request
            Controller.get({
                url: '/info'
            }).then(function (data) {
                assert.deepEqual(data, {
                    hello: 'world'
                });
            });
        });
    });
});

This data mocking mechanism provides the lowest-level cross-platform I/O abstraction possible. As an added benefit, creating a mock request provider also enables client-side development to proceed independently from any back-end development or maintenance that might normally prevent client-side developers from being able to continue working.

Mocking stores
The dojo/store API provides a standard, high-level data access API that abstracts away any underlying I/O transport layer and allows data to be requested and provided from a wide range of compatible stores. While a networked store like dojo/store/JsonRest could be used in conjunction with a dojo/request mock provider to mock store data, it is often simpler to mock the store itself using dojo/store/Memory. This is because, unlike a dojo/request mock, a mock dojo/store implementation does not need to know anything about how the back-end server might behave in production—or if there is even a back-end server in production at all.

By convention, and following the recommended principle of dependency injection, stores are typically passed to components that use a data store through the constructor:

// in tests/unit/util/Grid.js
define([
    'intern!tdd',
    'intern/chai!assert',
    'dojo/store/Memory',
    'app/Grid'
], function (tdd, assert, Memory, Grid) {
    var mockStore = new Memory({
        data: [
            { id: 1, name: 'Foo' },
            { id: 2, name: 'Bar' }
        ]
    });
 
    tdd.suite('app/Grid', function () {
        var grid;
 
        tdd.before(function () {
            grid = new Grid({
                store: mockStore
            });
            grid.placeAt(document.body);
            grid.startup();
        });
 
        tdd.after(function () {
            grid.destroyRecursive();
            grid = null;
        });
        // …
    });
});

Mocking AMD dependencies

Rewriting code to use dependency injection is strongly recommended over attempting to mock AMD modules, as doing so simplifies testing and improves code reusability. However, it is still possible to mock AMD dependencies by undefining the module under test and its mocked dependencies, modifying one of its dependencies using the loader’s module remapping functionality, then restoring the original modules after the mocked version has completed loading.

// in tests/support/amdMocker.js
define([
    'dojo/Deferred'
], function (Deferred) {
    function mock(moduleId, dependencyMap) {
        var dfd = new Deferred();
        // retrieve the original module values so they can be
        // restored after the mocked copy has loaded
        var originalModule;
        var originalDependencies = {};
        var NOT_LOADED = {};
 
        try {
            originalModule = require(moduleId);
            require.undef(moduleId);
        } catch (error) {
            originalModule = NOT_LOADED;
        }
 
        for (var dependencyId in dependencyMap) {
            try {
                originalDependencies[dependencyId] = require(dependencyId);
                require.undef(dependencyId);
            } catch (error) {
                originalDependencies[dependencyId] = NOT_LOADED;
            }
        }
 
        // remap the module's dependencies with the provided map
        var map = {};
        map[moduleId] = dependencyMap;
 
        require({
            map: map
        });
 
        // reload the module using the mocked dependencies
        require([moduleId], function (mockedModule) {
            // restore the original condition of the loader by
            // replacing all the modules that were unloaded
            require.undef(moduleId);
 
            if (originalModule !== NOT_LOADED) {
                define(moduleId, [], function () {
                    return originalModule;
                });
            }
 
            for (var dependencyId in dependencyMap) {
                map[moduleId][dependencyId] = dependencyId;
                require.undef(dependencyId);
                (function (originalDependency) {
                    if (originalDependency !== NOT_LOADED) {
                        define(dependencyId, [], function () {
                            return originalDependency;
                        });
                    }
                })(originalDependencies[dependencyId]);
            }
 
            require({
                map: map
            });
 
            // provide the mocked copy to the caller
            dfd.resolve(mockedModule);
        });
 
        return dfd.promise;
    }
 
    return {
        mock: mock
    };
});

With this AMD mocker, you simply call it from within your test suite to remap the dependencies of the module you’re trying to test, and load the newly mocked module:


// in tests/unit/app/Controller.js
define([
        'intern!tdd',
        'intern/chai!assert',
        'tests/support/amdMocker'
    ], function (tdd, assert, amdMocker) {
    tdd.suite('app/Controller', function () {
        var Controller;
 
        tdd.before(function () {
            return amdMocker.mock('app/Controller', {
                'util/ErrorDialog': 'tests/mocks/util/ErrorDialog',
                'util/StatusDialog': 'tests/mocks/util/StatusDialog'
            }).then(function (mocked) {
                Controller = mocked;
            });
        });
 
        tdd.test('basic tests', function () {
            // use mocked `Controller`
        });
    });
});

More information on avoiding this pattern by loosely coupling components and performing dependency injection is discussed in Testable code best practices.

In the future, we hope to include several of these mocking systems directly within Intern in order to make mocking data even easier. For now, by following these simple patterns in your own tests, it becomes much easier to isolate sections of code for proper unit testing. Happy testing!

If you’re still not sure where to start, or would like extra assistance making your code more testable and reliable, we’re here to help! Get in touch today for a free 30-minute consultation.




</entry>
<entry [Thu 2014:11:13 22:45:34 EST] GETTING STARTED WITH YEOMAN - EXAMPLE: SCAFFOLDING AN ANGULAR.JS APP>

http://yeoman.io/learning/index.html


Example: Scaffolding an AngularJS app

As always, before using a new generator, you must install it from npm first:

npm install -g generator-angular
After that, create a new directory for your application, then run:

yo angular
Many generators allow you to customize your application by using flags from the initial command. As an example, with generator-angular, you can enter:

yo angular --coffee
Here, we are first generating the file structure for a basic web application and then writing a number of boilerplate files for a new AngularJS application on top of it. This includes boilerplate directives and controllers as well as scaffolded Karma unit tests.

Scaffolding out your Angular app’s pieces


</entry>
<entry [Thu 2014:11:13 22:36:33 EST] TESTING SOCKET.IO>

http://swizec.com/blog/testing-socket-io-apps/swizec/5625

CODE ON GITHUB
https://github.com/Swizec/random-coding/tree/master/socket.io-testing

	
</entry>
<entry [Thu 2014:11:13 17:14:27 EST] TRAVIS CI AND intern>

https://github.com/theintern/intern/wiki/Travis-CI-integration


http://www.sitepen.com/blog/author/jcheatham/

	
</entry>
<entry [Thu 2014:11:13 17:10:33 EST] MOCHA VS JASMINE VS INTERN>

http://lists.sugarlabs.org/archive/sugar-devel/2013-May/043151.html

Manuel Quiñones manuq at laptop.org 
Mon May 20 19:47:35 EDT 2013
Previous message: [Sugar-devel] [ASLO] Release Speak-46
Next message: [Sugar-devel] HTML Sugar: Unit testing research
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
Now that Daniel N has Jasmine working, let's put it under question :)  Kidding.

In brief: I think Jasmine framework and Karma runner is a simple
enough choice, and just what we need at the moment.

First, here are some concepts:

- BDD - behaviour-driven development.  The usual interface has this
verbs: describe(), it(), before(), after(), beforeEach(), and
afterEach().  This is Jasmine API.

- TDD - test-driven development.  The usual interface has: suite(),
test(), setup(), and teardown().  This is QUnit-like API.

The difference is mostly a question of style.  A BDD expectation is
just a TDD assertion that can be either true or false.  A unit test
can be translated from one style to the other.

- Synchronous and asynchronous tests.  Whether the tool supports
testing asynchronous operations.

I gave a try to Intern http://theintern.io/ .  It looks quite
interesting and can do both, BDD and TDD, and async.  But 1. is too
new (released a few days ago) and 2. unless we want continuous
integration support (CI) or Selenium support, we don't need it.  The
BDD tests in Intern uses Jasmine syntax, so it would be easy to move
in the future, if we ever need to.  By the way, their blog post was
interesting to identify the features a JS testing framework could
have, and the current situation.

http://www.sitepen.com/blog/2013/05/01/intern-javascript-testing/

Mocha is at the same level as Jasmine
http://visionmedia.github.io/mocha/ .  Mocha looks more flexible, but
it adds complexity too.  For example, you have to choose an assertion
library like should.js [1] or chai [2] .

[1] http://github.com/visionmedia/should.js
[2] http://chaijs.com/

One point to Mocha is the asynchronous support.  It is more easy to
write an async test in Mocha than in Jasmine.

http://visionmedia.github.io/mocha/#asynchronous-code

In this boiling Javascript world many things are driven by
mommentum/fashion.  And there is a feeling that Mocha is the current
framework of choise.  For example, Yeoman switched from Jasmine to
Mocha a few months ago:

https://github.com/yeoman/yeoman/issues/117
https://github.com/yeoman/yeoman/pull/187

So if we were to follow fashion, Mocha would be the one :P .  But I
think the simplistic approach of Jasmine is good enough for us,
specially considering the involvement of new devs.  Jasmine is a bit
more readable and elegant too.  The only thing we should consider is
the async support, if we can go with Jasmine one, or if we need Mocha
one.

http://pivotal.github.io/jasmine/#section-Asynchronous_Support

In case we need to move to Mocha in the future, the BDD style is very
similar, the same verbs are used: describe(), it(), etc.  Only the
assertions need to be changed.  Both are mature and widely adopted.

I need to hurry up with Daniel N :)

--
.. manuq ..

	
</entry>
<entry [Thu 2014:11:13 16:56:42 EST] DOJO BUILD FACTORY - MOBILE>


https://github.com/pruzand/Dojo-Build-Factory/blob/master/build/profiles/features/mobile.js


	
</entry>
<entry [Thu 2014:11:13 14:58:20 EST] JAVASCRIPT TESTING WITH GRUNT, MOCHA AND CHAI>

https://gist.github.com/maicki/7781943



	
</entry>
<entry [Thu 2014:11:13 14:54:02 EST] FUNCTIONAL TEST this.remote COMMANDS>

https://theintern.github.io/leadfoot/Command.html

moveMouseTo(elementopt: Element, xOffsetopt: number, yOffsetopt: number): Promise.< void >

Moves the remote environment’s mouse cursor to the specified element or relative position. If the element is outside of the viewport, the remote driver will attempt to scroll it into view automatically.


ENTER 'Enter' AND ENTER 'Tab'

this.remote.get('http://localhost:8000/login')
  .keys('name1') // type on focused username input field
  .keys('\uE004') // press Tab (this doesn't change the focus??)
  .keys('pass') // type password
  .keys('\uE007'); // press Enter to submit

OR TRY

this.remote.get('http://localhost:8000/login')
  .keys('name1') // type on focused username input field
  .keys(Keys.TAB) // press Tab (this doesn't change the focus??)
  .keys('pass') // type password
  .keys(Keys.ENTER); // press Enter to submit

OR

Did you tried with .keys('\t')
  
  

WAIT COMMANDS: pollUntil, waitForCondition, setFindTimeout(NUMBER)

	return this.remote
		// LOAD PAGE
		.get(require.toUrl('t/functional/plugins/workflow/workflows/test.html'))
		//.then(pollUntil('return window.ready;', 5000))
        //.waitForCondition("!!window.document.gbqf", 1000)
		.setFindTimeout(5000)
		.then(function (text) {
			console.log("t   Loaded test.html page");
		})


		//.findByCssSelector('body.loaded')
		//.findById('nameField')
		//	.click()
		//	.type('Elaine')
		//	.end()
		
		// DRAG
		//.elementByCss("#dojoUnique1 .title")
		.findById("dojoUnique20")
		.moveTo()
		.buttonDown(0)
		.sleep(500)
		.end(function (err, res) {
			
			console.log("t   END");
			expect(err).to.be.null;
			expect(res).to.have.status(200);
		});


MULTIPLE end() COMMANDS

define([
    'intern!object',
    'intern/chai!assert',
    '../Request',
    'require'
], function (registerSuite, assert, Request, require) {
    var request,
        url = 'https://github.com/theintern/intern';

    registerSuite({
        name: 'demo',

        'submit form': function () {
            return this.remote
                .get(require.toUrl('./fixture.html'))
                .findById('operation')
                    .click()
                    .type('hello, world')
                .end()
                .findById('submit')
                    .click()
                .end()
                .setFindTimeout(Infinity)
                .findById('result')
                .setFindTimeout(0)
                .text()
                .then(function (resultText) {
                    assert.ok(resultText.indexOf(
                        '"hello, world" completed successfully') > -1,
                        'On form submission, operation should complete successfully');
                });
        }
    });
});


</entry>
<entry [Wed 2014:11:12 22:15:12 EST] USE leaveRemoteOpen KEEP intern FUNCTIONAL TEST BROWSER OPEN>

http://www.sitepen.com/blog/2014/05/23/how-can-i-debug-intern-tests/

1. START SELENIUM

java -jar /home/syoung/software/selenium/selenium-server-standalone-2.44.0.jar 


2. RUN TEST 
node_modules/intern/bin/intern-runner.js  config=t/intern leaveRemoteOpen

	
</entry>
<entry [Wed 2014:11:12 19:09:22 EST] intern FUNCTIONAL TEST ON AGUA>
	
1. CREATE MODULE

/a/html/plugins/test/hello.js


2. CREATE TEST html FILE

/a/html/t/functional/plugins/test/test.html


3. CREATE TEST

/a/html/t/functional/plugins/test/hello.js


define([
    'intern!object',
    'intern/chai!assert',
	//'intern/dojo/node!leadfoot/helpers/pollUntil',
    'require'
], function (
		registerSuite,
		assert,
		//pollUntil,
		require
	) {
	
    registerSuite({
	
	name: 'hello',

	'greeting form': function () {
            return this.remote
                .get(require.toUrl('t/functional/plugins/test/test.html'))
	            //.then(pollUntil('return window.ready;', 5000))
                .setFindTimeout(5000)
                .findByCssSelector('body.loaded')
                .findById('nameField')
                    .click()
                    .type('Elaine')
                    .end()
                .findByCssSelector('#loginForm input[type=submit]')
                    .click()
                    .end()
                .findById('greeting')
                .getVisibleText()
                .then(function (text) {
                    assert.strictEqual(text, 'Hello, Elaine!',
                        'Greeting should be displayed when the form is submitted');
                });
	    }
	});
});


4. START SELENIUM

cd /home/syoung/software/selenium/
java -jar selenium-server-standalone-2.44.0.jar


5. RUN TEST

cd /a/html
./node_modules/.bin/intern-runner config=t/intern leaveRemoteOpen


	
</entry>
<entry [Wed 2014:11:12 18:50:13 EST] intern UNIT TEST ON AGUA>

1. CREATE MODULE

/a/html/plugins/test/hello.js
	
	define([], function () {
		
		return {
			pairs : {},
		
			greet: function (name) {
				console.log("greet    name '" + name + "'");
				name = name || 'world';
	
				return 'Hello, ' + name + '!';
			},
			set : function (key, value) {
				if ( ! key ) {
					console.log("set    key not defined");
					return false;
				}
				console.log("set    key '" + key + "' = value '" + value + "'");
				this.pairs[key]	=	value;
				
				return true;
			}
		};
	});

	
2. CREATE TEST

/a/html/t/unit/plugins/test/hello.js


define([
	'intern!object',
	'intern/chai!assert',
	'plugins/test/hello'
], function (registerSuite, assert, hello) {

    registerSuite({
		
		name: 'hello',

        greet: function () {
            assert.strictEqual(hello.greet('Murray'), 'Hello, Murray!',
                'hello.greet should return a greeting for the person named in the first argument');
            assert.strictEqual(hello.greet(), 'Hello, world!',
                'hello.greet with no arguments should return a greeting to "world"');
        },
        set: function () {
            assert.strictEqual(hello.set(), false, 'hello.set returns false if key not defined');
            assert.strictEqual(hello.set("testkey", "testvalue"), true, 'hello.set returns true');       },
		
    });

});


3. EDIT t/intern.js

	// Name of the tunnel class to use for WebDriver tests
	//tunnel: 'SauceLabsTunnel',
	tunnel: 'NullTunnel',

	...
	
	loader: {
		// Packages that should be registered with the loader in each testing environment
		packages: [
			{
				name: 'plugins',
				location: 'plugins'
			}
			,
	        {
				name: 'dojo',
				location: 'dojo'
			}
		]
	},

	
4. RUN ON COMMAND LINE

cd /a/html
./node_modules/.bin/intern-client config=t/intern

	greet    name 'Murray'
	greet    name 'undefined'
	PASS: main - hello - greet (2ms)
	set    key not defined
	set    key 'testkey' = value 'testvalue'
	PASS: main - hello - set (0ms)
	0/2 tests failed
	0/2 tests failed
	
	------------------------|-----------|-----------|-----------|-----------|
	File                    |   % Stmts |% Branches |   % Funcs |   % Lines |
	------------------------|-----------|-----------|-----------|-----------|
	   plugins/test/        |       100 |       100 |       100 |       100 |
		  hello.js          |       100 |       100 |       100 |       100 |
	   t/unit/plugins/test/ |       100 |       100 |       100 |       100 |
		  hello.js          |       100 |       100 |       100 |       100 |
	------------------------|-----------|-----------|-----------|-----------|
	All files               |       100 |       100 |       100 |       100 |
	------------------------|-----------|-----------|-----------|-----------|


5. RUN IN BROWSER

http://localhost/node_modules/intern/client.html?config=t/intern

CONSOLE

	main console.js:16
	hello console.js:16
	greet    name 'Murray' hello.js:11
	greet    name 'undefined' hello.js:11
	PASS: greet (2ms) console.js:37
	set    key not defined hello.js:18
	set    key 'testkey' = value 'testvalue' hello.js:21
	PASS: set (0ms) console.js:37
	20/2 tests failed

</entry>
<entry [Wed 2014:11:12 14:28:29 EST] FUNCTIONAL TESTS: USE LEADFOOT pollUntil>

https://github.com/theintern/intern/wiki/Writing-Tests-with-Intern

THE leadfoot PACKAGE'S pollUntil promise WAITS UNTIL A GLOBAL IS NON-NULL


1. INSTALL leadfoot

cd /a/html
npm install leadfoot --save-dev


2. USE IN CODE

define([
    'intern!object',
    'intern/dojo/node!leadfoot/helpers/pollUntil'
], function (registerSuite, pollUntil) {

    registerSuite({
        'a test': function () {
        return this.remote
            .get(require.toUrl('./SomeTest.html'))
            .then(pollUntil('return window.ready;', 5000));
        }
    });
});

	
</entry>
<entry [Wed 2014:11:12 11:50:26 EST] RUN intern FUNCTIONAL TEST IN LOCAL SELENIUM>


1. INSTALL SELENIUM

/home/syoung/software/selenium/

2. INSTALL CHROMEDRIVER IN PATH

export PATH=/home/syoung/software/chromedriver:$PATH

3. DISABLE SAUCE CONNECT IN intern.js

	//// Name of the tunnel class to use for WebDriver tests
	//tunnel: 'SauceLabsTunnel',
	tunnel: 'NullTunnel',


4. SET BROWSER TO CHROME

	environments: [
		{
			browserName: 'chrome',
			version: [ '24' ],
			platform: [ 'LINUX' ]
		}
	],


5. START SELENIUM

cd /home/syoung/software/selenium/
java -jar selenium-server-standalone-2.44.0.jar


6. RUN TEST

cd /a/html/intern-tutorial
./node_modules/.bin/intern-runner config=tests/intern

	Listening on 0.0.0.0:9000
	Starting tunnel...
	Initialised chrome 38.0.2125.104 on LINUX
	
	=============================== Coverage summary ===============================
	Statements   : 100% ( 4/4 )
	Branches     : 100% ( 2/2 )
	Functions    : 100% ( 2/2 )
	Lines        : 100% ( 4/4 )
	================================================================================
	chrome 38.0.2125.104 on LINUX: 0/2 tests failed
	
	---------------|-----------|-----------|-----------|-----------|
	File           |   % Stmts |% Branches |   % Funcs |   % Lines |
	---------------|-----------|-----------|-----------|-----------|
	   app/        |       100 |       100 |       100 |       100 |
		  hello.js |       100 |       100 |       100 |       100 |
	---------------|-----------|-----------|-----------|-----------|
	All files      |       100 |       100 |       100 |       100 |
	---------------|-----------|-----------|-----------|-----------|
	
	TOTAL: tested 1 platforms, 0/2 tests failed





NOTES
=====


Debugging Functional Tests

Debugging is more involved when you are working with functional tests. A functional test is comprised of two parts:

1. RUN BY node.js - The test module, which defines the test actions (mouse/keyboard actions) and the test logic (assertions)

2. RUN IN BROWSER - The test page, which loads your application code and presents the UI that you want to test


THE WebDriver API PROVIDES COMMUNICATION BETWEEN node.js AND THE BROWSER:

Intern provides the WebDriver API using the WD.js library
WD.js creates HTTP requests that conform to the WebDriver API

A concrete WebDriver implementation, such as ChromeDriver, handles the WebDriver HTTP requests and launches and controls a web browser

As you can see, there are two potential environments to debug, Node.js and the browser. You will find it easiest to debug your test page in the browser by loading it directly, and performing as much debugging as possible detached from the test module.

Setting up a local Selenium WebDriver server

You can skip this step if you prefer to only test using a remote WebDriver provider like Sauce Labs, but the reduced latency of testing an initial set of browsers locally can help you expediently resolve any initial issues. No browsers currently provide native support for the WebDriver API, so each browser requires a WebDriver implementation that will handle WebDriver API requests over HTTP and control the browser.

Download Selenium server (get the standalone .jar): this includes FirefoxDriver, SafariDriver, and OperaDriver

For Chrome and Internet Explorer support, download the appropriate driver and add the path to its executable to your PATH environment variable, making it available to Selenium server
ChromeDriver
InternetExplorerDriver (download)

Ensure that your Intern configuration is not using Sauce Connect:

useSauceConnect: false

Launch Selenium server:

java -jar selenium-server-standalone-2.39.0.jar


	
</entry>
<entry [Wed 2014:11:12 11:49:59 EST] AUTOMATED LOGIN WITH intern>


Another option would be to login to your site in your functional test. Fill in the username and password (or whatever you use to login) on the login page and submit it:

.findById('username')
.type('bob123')
.end()
.findById('password')
.type('somepassword')
.end()
.findById('submit')
.click()
Then wait for the page you're interested in to load completely and continue testing:

.then(pollUntil(...))
// continue testing
If the login process is slow, you may need to increase the timeout for your test using this.async.

	
</entry>
<entry [Wed 2014:11:12 11:40:28 EST] intern-tutorial: RUN FUNCTIONAL TEST>

SEE [Wed 2014:11:12 09:14:36 EST] intern-tutorial: SET UP AND RUN NON-FUNCTIONAL TEST

Functional tests are different from unit tests in that they mimic user interaction by sending commands to browsers using an external server instead of running directly in the environment being tested. This enables us to generate real DOM events and test UI interactions just like a real user, with no JavaScript security sandbox limitations


1. CREATE FUNCTIONAL TEST

cd /mnt/repos/private/syoung/intern-tutorial
mkdir tests/functional
emacs tests/functional/index.js

	define([
		'intern!object',
		'intern/chai!assert',
		'require'
	], function (registerSuite, assert, require) {
		registerSuite({
			name: 'index',
	
			'greeting form': function () {

				return this.remote
					.get(require.toUrl('index.html'))
					.setFindTimeout(5000)
					.findByCssSelector('body.loaded')
					.findById('nameField')
						.click()
						.type('Elaine')
						.end()
					.findByCssSelector('#loginForm input[type=submit]')
						.click()
						.end()
					.findById('greeting')
					.getVisibleText()
					.then(function (text) {
						assert.strictEqual(text, 'Hello, Elaine!',
							'Greeting should be displayed when the form is submitted');
					});	
			}
		});
	});


10. EDIT intern.js TO ADD index.html 

    // ...
	// Name of the tunnel class to use for WebDriver tests
	tunnel: 'SauceLabsTunnel',
    // ...

    // ...
    // Functional test suite(s) to run in each browser once non-functional tests are completed
    functionalSuites: [ 'tests/functional/index' ],
    // ...


WHERE index.html IS:

<!--
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Intern tutorial</title>
	</head>
	<body>
		<p id="greeting">Please enter your name</p>
		<form id="loginForm">
			<input id="nameField" type="text" placeholder="Your name">
			<input type="submit" value="Submit">
		</form>

		<script>
			var dojoConfig = {
				packages: [ {
					name: 'app',
					location: location.pathname.replace(/[^\/]*$/, 'app')
				} ]
			};
		</script>
		<script src="//ajax.googleapis.com/ajax/libs/dojo/1.9.1/dojo/dojo.js"></script>
		<script>
			require([
				'dojo/on',
				'dojo/dom',
				'app/hello'
			], function (on, dom, hello) {
				var greeting = dom.byId('greeting'),
					loginForm = dom.byId('loginForm'),
					nameField = dom.byId('nameField');

				on(loginForm, 'submit', function (event) {
					event.preventDefault();
					greeting.innerHTML = hello.greet(nameField.value).replace(/&/g, '&amp;').replace(/</g, '&lt;');
					nameField.value = '';
				});

				document.body.className += ' loaded';
			});
		</script>
	</body>
</html>
-->


2. RUN FUNCTIONAL TEST WITH runner.js

EXPORT SAUCE AUTHENTICATION

export SAUCE_USERNAME=stuartpyoung
export SAUCE_ACCESS_KEY=88e46cd6-4444-4fbe-af44-9d7e74f9ebf4

OR ADD TO intern.js

// SauceLabs authentication
tunnelOptions: {
	username: 'stuartpyoung',
	accessKey: '88e46cd6-4444-4fbe-af44-9d7e74f9ebf4'
},


3. SHUT DOWN LOCAL SELENIUM SERVER

netstat -ntulp | grep 4444
kill -9 XXXX


4. RUN TEST

cd /mnt/repos/private/syoung/intern-tutorial
./node_modules/.bin/intern-runner config=tests/intern
	
<!--
Listening on 0.0.0.0:9000
Starting tunnel...
Using no proxy for connecting to Sauce Labs REST API.
**********************************************************
A newer version of Sauce Connect (build 1588) is available!
Download it here:
https://saucelabs.com/downloads/sc-4.3.5-linux.tar.gz
**********************************************************
Started scproxy on port 35893.
Starting secure remote tunnel VM...
Secure remote tunnel VM provisioned.
Tunnel ID: 1ecd7cc93caa4aae852809b6168b64b8
Secure remote tunnel VM is now: booting
Secure remote tunnel VM is now: running
Remote tunnel host is: maki77143.miso.saucelabs.com
Using no proxy for connecting to tunnel VM.
Starting Selenium listener...
Establishing secure TLS connection to tunnel...
Selenium listener started on port 4444.
Connection established.
Ready
Initialised internet explorer 9 on WINDOWS
Initialised internet explorer 11 on WINDOWS

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
internet explorer 9 on WINDOWS: 0/2 tests failed

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
internet explorer 11 on WINDOWS: 0/2 tests failed
Initialised internet explorer 10 on WINDOWS
Initialised firefox 28.0 on MAC

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
internet explorer 10 on WINDOWS: 0/2 tests failed

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
firefox 28.0 on MAC: 0/2 tests failed
Initialised chrome 34.0.1847.116 on Mac OS X
Initialised firefox 28.0 on XP

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
chrome 34.0.1847.116 on Mac OS X: 0/2 tests failed

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
firefox 28.0 on XP: 0/2 tests failed
Initialised chrome 34.0.1847.116 on Windows NT

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
chrome 34.0.1847.116 on Windows NT: 0/2 tests failed
Initialised firefox 28.0 on LINUX

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
firefox 28.0 on LINUX: 0/2 tests failed
Initialised safari 6.0.5 on MAC

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
safari 6.0.5 on MAC: 0/2 tests failed
Initialised chrome 34.0.1847.116 on Linux
Initialised safari 7.0.6 on MAC

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
chrome 34.0.1847.116 on Linux: 0/2 tests failed

=============================== Coverage summary ===============================
Statements   : 100% ( 4/4 )
Branches     : 100% ( 2/2 )
Functions    : 100% ( 2/2 )
Lines        : 100% ( 4/4 )
================================================================================
safari 7.0.6 on MAC: 0/2 tests failed

---------------|-----------|-----------|-----------|-----------|
File           |   % Stmts |% Branches |   % Funcs |   % Lines |
---------------|-----------|-----------|-----------|-----------|
   app/        |       100 |       100 |       100 |       100 |
      hello.js |       100 |       100 |       100 |       100 |
---------------|-----------|-----------|-----------|-----------|
All files      |       100 |       100 |       100 |       100 |
---------------|-----------|-----------|-----------|-----------|

TOTAL: tested 11 platforms, 0/22 tests failed	
-->


</entry>
<entry [Wed 2014:11:12 11:32:57 EST] FIXED intern ERROR 'Failed to start Selenium listener (exit code 2)'>

PROBLEM

GET THIS ERROR WHEN RUN intern TEST

cd /mnt/repos/private/syoung/intern-tutorial
./node_modules/.bin/intern-runner config=tests/intern

	...	
	Starting Selenium listener...
	Establishing secure TLS connection to tunnel...
	Cleaning up.
	Finished! Deleting tunnel.
	Error: Failed to start Selenium listener (exit code 2).
	Error: Failed to start Selenium listener (exit code 2).


SOLUTION

SHUT DOWN LOCAL SELENIUM SERVER

1. KILL SERVER

java -jar /home/syoung/software/selenium/selenium-server-standalone-2.44.0.jar

2. KILL LINGERING PROCESS

netstat -ntulp | grep 4444
kill -9 XXXX





</entry>
<entry [Wed 2014:11:12 09:57:50 EST] USE CODESHIP FOR CI>

1. SIGN UP ON CODESHIP

TEST SETTINGS:

	# By default we use the Node.js version set in your package.json or 0.10.25
	# You can use nvm to install any Node.js version.
	# i.e.: nvm install 0.10.25
	nvm install 0.10.25
	nvm use 0.10.25
	npm install
	# Install grunt-cli for running your tests or other tasks
	# npm install grunt-cli

TEST COMMANDS:

npm test
# grunt test
	
2. SELECT REPO

syoung/aguadev


3. PUSH CHANGE TO REPO

ADD TO README

[ ![Codeship Status for syoung/aguadev](https://codeship.com/projects/cef8b7c0-4cc2-0132-cc5b-0ee7278a7b7b/status)](https://codeship.com/projects/47220)



4. VIEW BUILD ON CODESHIP

https://codeship.com/projects/47220

	CODESHIP LOADS AGUA AND RUNS BUILD BUT FAILS WITH ERROR 'npm can't find a package.json file in your current directory':

	syoung/aguadev: -Inc README: Added Codeship status image 0 min 25 sec
	 97da500c7f366737d176c8d117635f53
	stuartpyoung
	master
	1e28429f 4 minutes ago
	
	Exporting Environment
	0 min 2 sec
	git clone --branch 'master' --depth 50 git@github.com:syoung/aguadev.git ~/src/github.com/syoung/aguadev
	0 min 11 sec
	cd clone
	0 min 1 sec
	git checkout -qf 1e28429fe1b09d9b4dadf750cb76b82a532c8ca7
	0 min 3 sec
	Preparing Dependency Cache
	0 min 5 sec
	Preparing Virtual Machine
	0 min 5 sec
	nvm install 0.10.25
	0 min 1 sec
	nvm use 0.10.25
	0 min 2 sec
	npm install
	Scroll down to help section
	npm ERR! install Couldn't read dependencies
	npm ERR! package.json ENOENT, open '/home/rof/src/github.com/syoung/aguadev/package.json'
	npm ERR! package.json This is most likely not a problem with npm itself.
	npm ERR! package.json npm can't find a package.json file in your current directory.
	
	npm ERR! System Linux 3.13.0-35-generic
	npm ERR! command "/home/rof/.nvm/v0.10.25/bin/node" "/home/rof/.nvm/v0.10.25/bin/npm" "install"
	npm ERR! cwd /home/rof/src/github.com/syoung/aguadev
	npm ERR! node -v v0.10.25
	npm ERR! npm -v 1.3.24
	npm ERR! path /home/rof/src/github.com/syoung/aguadev/package.json
	npm ERR! code ENOPACKAGEJSON
	npm ERR! errno 34
	npm ERR! 
	npm ERR! Additional logging details can be found in:
	npm ERR!     /home/rof/src/github.com/syoung/aguadev/npm-debug.log
	npm ERR! not ok code 0
	]0;rof@railsonfire_12bf7190-4cc4-0132-74e7-12bb50e68625_0585d001c4df: ~/clonerof@railsonfire_12bf7190-4cc4-0132-74e7-12bb50e68625_0585d001c4df:~/clone$ 
	Documentation Contact us Test settings Reset Dependency Cache
	Debug this build
	Please add your public ssh key to access the debug build.


	
</entry>
<entry [Wed 2014:11:12 09:14:36 EST] intern-tutorial: SET UP AND RUN NON-FUNCTIONAL TEST>

https://github.com/theintern/intern-tutorial


1. DOWNLOAD intern-tutorial

cd /mnt/repos/private/syoung
git clone git@github.com:theintern/intern-tutorial.git

2. DOWNLOAD intern

cd /mnt/repos/private/syoung/intern-tutorial
npm install intern --save-dev


3. COPY CONFIG

cd /mnt/repos/private/syoung/intern-tutorial
mkdir tests
cp node_modules/intern/tests/example.intern.js tests/intern.js


4. EDIT CONFIG

emacs -nw /mnt/repos/private/syoung/intern-tutorial/tests/intern.js

	loader: {
		// Packages that should be registered with the loader in each testing environment
		//packages: [ { name: 'myPackage', location: '.' } ]
        packages: [ { name: 'app', location: 'app' } ]
	},


4. RUN TEST

cd /mnt/repos/private/syoung/intern-tutorial
./node_modules/.bin/intern-client config=tests/intern

	0/0 tests failed


5. CREATE NON-FUNCTIONAL TEST

cd /mnt/repos/private/syoung/intern-tutorial
emacs tests/hello.js

	define([
		'intern!object',
		'intern/chai!assert',
		'app/hello'
	], function (registerSuite, assert, hello) {
	
		registerSuite({
			
			name: 'hello',
	
			greet: function () {
				assert.strictEqual(hello.greet('Murray'), 'Hello, Murray!',
					'hello.greet should return a greeting for the person named in the first argument');
				assert.strictEqual(hello.greet(), 'Hello, world!',
					'hello.greet with no arguments should return a greeting to "world"');
			}
		});
	
	});


6. ADD tests/hello.js TO CONFIG

  // Unit test modules to run in each browser
    suites: [ 'tests/hello' ],


7. RUN TEST (NON-FUNCTIONAL)

cd /mnt/repos/private/syoung/intern-tutorial
./node_modules/.bin/intern-client config=tests/intern

	PASS: main - hello - greet (1ms)
	0/1 tests failed
	0/1 tests failed
	
	---------------|-----------|-----------|-----------|-----------|
	File           |   % Stmts |% Branches |   % Funcs |   % Lines |
	---------------|-----------|-----------|-----------|-----------|
	   app/        |       100 |       100 |       100 |       100 |
		  hello.js |       100 |       100 |       100 |       100 |
	---------------|-----------|-----------|-----------|-----------|
	All files      |       100 |       100 |       100 |       100 |
	---------------|-----------|-----------|-----------|-----------|


8. TEST IN BROWSER

http://localhost/intern-tutorial/node_modules/intern/client.html?config=tests/intern

	OK
	


</entry>
<entry [Wed 2014:11:12 09:12:22 EST] bower COMMANDS>

### Installing packages and dependencies

```sh
# install dependencies listed in bower.json
$ bower install

# install a package and add it to bower.json
$ bower install PACKAGE --save

# install specific version of a package and add it to bower.json
$ bower install PACKAGE#VERSION --save
	
### Using packages

We discourage using bower components statically for performance and security reasons (if component has an `upload.php\
` file that is not ignored, that can be easily exploited to do malicious stuff).

The best approach is to process components installed by bower with build tool (like [Grunt](http://gruntjs.com/) or [\
gulp](http://gulpjs.com/)), and serve them concatenated or using module loader (like [RequireJS](http://requirejs.org\
/)).

### Uninstalling packages

To uninstall a locally installed package:

```sh
$ bower uninstall PACKAGE
```

### prezto and oh-my-zsh users

On `prezto` or `oh-my-zsh`, do not forget to `alias bower='noglob bower'` or `bower install jquery\#1.9.1`

### Running commands with sudo

Bower is a user command, there is no need to execute it with superuser permissions.
However, if you still want to run commands with sudo, use `--allow-root` option.

### Windows users

To use Bower on Windows, you must install
[msysgit](http://msysgit.github.io/) correctly. Be sure to check the
option shown below:

![msysgit](http://f.cl.ly/items/2V2O3i1p3R2F1r2v0a12/mysgit.png)

Note that if you use TortoiseGit and if Bower keeps asking for your SSH
password, you should add the following environment variable: `GIT_SSH -
C:\Program Files\TortoiseGit\bin\TortoisePlink.exe`. Adjust the `TortoisePlink`
path if needed.

## Configuration

Bower can be configured using JSON in a `.bowerrc` file. Read over available options at [bower.io/docs/config](http://bower.io/docs/config).

## Completion (experimental)

_NOTE_: Completion is still not implemented for the 1.0.0 release

Bower now has an experimental `completion` command that is based on, and works
similarly to the [npm completion](https://npmjs.org/doc/completion.html). It is
not available for Windows users.

This command will output a Bash / ZSH script to put into your `~/.bashrc`,
`~/.bash_profile`, or `~/.zshrc` file.

```sh
$ bower completion >> ~/.bash_profile


</entry>
<entry [Wed 2014:11:12 09:11:57 EST] TEST intern USING intern-examples>


1. DOWNLOAD intern-examples

git clone git@github.com:theintern/intern-examples.git


2. INSTALL DEPENDENCIES WITH bower

npm install -g bower
npm install
bower install


3. START SELENIUM

java -jar /home/syoung/software/selenium/selenium-server-standalone-2.44.0.jar


4. RUN TESTS

npm test


	
</entry>
<entry [Tue 2014:11:11 20:20:36 EST] RUN SELENIUM AS GRID>


http://stackoverflow.com/questions/7901171/selenium-grid-capabilities-and-platform-windows7

1. RUN ON Machine 1-"HUB"

java -jar selenium-server-standalone-2.42.2.jar -role hub


2. RUN ON machine 2-"NODE"

java -jar selenium-server-standalone-2.42.2.jar -host **nodeip** -role node -hub http://**hubip**:4444/grid/register -port 5555


replace hubip as your hub machine ip address and nodeip as remote machine.

	
</entry>
<entry [Tue 2014:11:11 18:55:02 EST] SET JAVA_HOME FOR SELENIUM>


export JAVA_HOME=/home/syoung/software/java/1.8.0-25/
	
</entry>
<entry [Tue 2014:11:11 18:49:56 EST] INSTALL node PLUGIN selenium-webdriver>

https://www.npmjs.org/package/selenium-webdriver


npm install selenium-webdriver


*** FINISH OFF BELOW ...

In addition to the npm package, you will to download the WebDriver implementations you wish to utilize. As of 2.34.0, selenium-webdriver natively supports the ChromeDriver. Simply download a copy and make sure it can be found on your PATH. The other drivers (e.g. Firefox, Internet Explorer, and Safari), still require the standalone Selenium server.

Running the tests

To run the tests, you will need to download a copy of the ChromeDriver and make sure it can be found on your PATH.

npm test selenium-webdriver
To run the tests against multiple browsers, download the Selenium server and specify its location through the SELENIUM_SERVER_JAR environment variable. You can use the SELENIUM_BROWSER environment variable to define a comma-separated list of browsers you wish to test against. For example:

export SELENIUM_SERVER_JAR=path/to/selenium-server-standalone-2.33.0.jar
SELENIUM_BROWSER=chrome,firefox npm test selenium-webdriver
Usage

var By = require('selenium-webdriver').By,
    until = require('selenium-webdriver').until,
    firefox = require('selenium-webdriver/firefox');

var driver = new firefox.Driver();

driver.get('http://www.google.com/ncr');
driver.findElement(By.name('q')).sendKeys('webdriver');
driver.findElement(By.name('btnG')).click();
driver.wait(until.titleIs('webdriver - Google Search'), 1000);
driver.quit();


</entry>
<entry [Tue 2014:11:11 18:46:32 EST] INSTALL CHROMEDRIVER FOR USE WITH node selenium-webdriver>

https://www.npmjs.org/package/selenium-webdriver


1. CREATE INSTALLATION DIR

mkdir /chromedriver
cd /chromedriver


2. DOWNLOAD ZIP

wget http://chromedriver.storage.googleapis.com/2.9/chromedriver_linux64.zip
unzip chrome*


3. RUN

./chromedriver 
	Starting ChromeDriver (v2.9.248304) on port 9515

	
</entry>
<entry [Tue 2014:11:11 18:36:50 EST] INSTALL LOCAL SELENIUM SERVER>

Selenium 1.0 + WebDriver = Selenium 2.0 or 'WebDriver'

WebDriver is the name of the key interface against which tests should be written in Java, the implementing classes one should use are listed as below:

AndroidDriver, ChromeDriver, EventFiringWebDriver, FirefoxDriver, HtmlUnitDriver, InternetExplorerDriver, PhantomJSDriver, RemoteWebDriver, SafariDriver

Selenium WebDriver fits in the same role as RC did, and has incorporated the original 1.x bindings. It refers to both the language bindings and the implementations of the individual browser controlling code.

1. CREATE INSTALLATION DIR

mkdir /home/syoung/software/selenium


2. DOWNLOAD JAR

cd /home/syoung/software/selenium
wget http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar


3. RUN JAR

cd /home/syoung/software/selenium
java -jar selenium-server-standalone-2.44.0.jar


-Dwebdriver.chrome.driver=/home/syoung/software/chromedriver/chromedriver

# -role hub


-browser "browserName=safari,setjavascriptEnabled=true,acceptSslCerts=true,maxInstances=5,Platform=MAC" -port 1235

	
</entry>
<entry [Tue 2014:11:11 18:35:21 EST] HOW TO RUN INTERN>

https://github.com/theintern/intern/wiki/Running-Intern

	
</entry>
<entry [Tue 2014:11:11 18:20:05 EST] SAUCE LABS AUTHENTICATION>

curl -X PUT \
-s -d '{"passed": true}' \ 
-u stuartpyoung:88e46cd6-4444-4fbe-af44-9d7e74f9ebf4 \
https://saucelabs.com/rest/v1/stuartpyoung/jobs/YOUR_JOB_ID

	
</entry>
<entry [Tue 2014:11:11 17:46:39 EST] SAUCE LABS VS TESTING BOT>

https://testingbot.com/pricing

https://saucelabs.com/pricing

				TESTING BOT				SAUCE LABS

Monthly fee		$40						$49
Automated mins	1,000					600
Simultaenous	4						3
Manual			Unlimited				Unlimited


</entry>
<entry [Tue 2014:11:11 17:24:04 EST] HOW TO WRITE intern TESTS>


https://github.com/theintern/intern/wiki/Writing-Tests-With-Intern



Directory Structure Examples
https://github.com/theintern/intern/wiki/Directory-Structure-Examples

1. DIRECTORY STRUCTURE

The directory structure within the functional and unit tests directories should match the directory structure of the main application package so that it is easy to associate tests with their corresponding source code. Following these rules, a recommended directory structure might look like this:

/yourProject
    src/
        app/
            widgets/
                foo.js
        index.html
    tests/
        functional/
            widgets/
                foo.js
        support/
            mockStore.js
        system/
            projectLifecycle.js
        unit/
            widgets/
                foo.js
    node_modules/
        intern/
    package.json
	

2. FOUR SUBDIRS

The tests directory should ideally be subdivided into three to four subdirectories:

functional: Functional test modules
support: Testing support files: utility modules, mock data, custom reporters, custom interfaces, etc.
system (optional): A separate set of system integration tests that do not correspond directly to individual application modules
unit: Unit test modules


3. KEEP TESTS IN SEPARATE REPO

When creating tests for an application, as opposed to developing tests for a reusable component library like Dojo, we recommend placing the tests in a location that is outside of the normal source code tree rather than inside the code package directory. Doing so provides the following benefits:

Production deployments are simplified by eliminating the need to exclude tests during the build process.
The risk of accidental disclosure of security-sensitive information stored inside test files is eliminated, as data related to testing is never part of the directory structure that is exposed by production Web servers.



</entry>
<entry [Tue 2014:11:11 12:30:52 EST] INSTALLED intern>

https://www.npmjs.org/package/intern


1. INSTALL intern

cd /a/html
npm install intern --save-dev

NB: WITHOUT --save-dev GET EXTRA ENTRY IN *json FILES:

emacs -nw -nw node_modules.simple/intern/node_modules/istanbul/node_modules/nopt/package.json

	"dist": {
	   "shasum": "4c8e3f64e04095d134f7fa56999751499bb89471"
	 },



2. COPY CONFIG FILE FROM TEMPLATE

cd /a/html
cp node_modules/intern/tests/example.intern.js t/intern.js



3. EDIT CONFIG FILE

COMMENTED OUT LINES

	environments: [
		{
			browserName: 'chrome',
			//version: [ '23', '24' ],
			version: [ '24' ],
			//platform: [ 'Linux', 'Mac OS 10.8' ]
			platform: [ 'LINUX' ]
		}
	],
	
	//// Name of the tunnel class to use for WebDriver tests
	//tunnel: 'SauceLabsTunnel',
	tunnel: 'NullTunnel',

	// The desired AMD loader to use when running unit tests (client.html/client.js).
	/// Omit to use the default Dojo loader
	useLoader: {
		'host-node'		: 	'dojo/dojo',
		'host-browser'	: 	'node_modules/dojo/dojo.js'
	},

	// Configuration options for the module loader; any AMD configuration options supported by the specified AMD loader
	// can be used here
	loader: {
		// Packages that should be registered with the loader in each testing environment
		packages: [
			{
				name: 'plugins',
				location: '../../plugins'
			}
		]
	},



4. VERIFY CONFIGURATION 


cd /a/html
node_modules/intern/bin/intern-runner.js  config=t/intern






TRIED BLOCKING 3RD-PARTY COOKIES

In Google Chrome, click the wrench icon in the top-right corner of the browser, choose Options, select Under the Hood in the left pane, click the "Content settings" button next to Privacy, and check "Ignore exceptions and block third-party cookies from being set."


PROBLEM

cd /a/html
node_modules/intern/bin/intern-runner.js  config=t/intern


<!--
	...
	Error: [POST http://localhost:4444/wd/hub/session] connect ECONNREFUSED
	Error: connect ECONNREFUSED
	  at errnoException  <net.js:901:11>
	  at Object.afterConnect [as oncomplete]  <net.js:892:19>

	TOTAL: tested 0 platforms, 0/0 tests failed; fatal error occurred
-->


SOLUTION

MUST FIRST INSTALL AND RUN SELENIUM 2.+


WITH tunnel: 'SauceLabsTunnel':

<!--
	Listening on 0.0.0.0:9000
	Starting tunnel...
	Using no proxy for connecting to Sauce Labs REST API.
	**********************************************************
	A newer version of Sauce Connect (build 1588) is available!
	Download it here:
	https://saucelabs.com/downloads/sc-4.3.5-linux.tar.gz
	**********************************************************
	Started scproxy on port 48973.
	Starting secure remote tunnel VM...
	Cleaning up.
	Finished! Deleting tunnel.
	Error: Not authorized
	Error: Not authorized
	  at reject  <node_modules/intern/node_modules/digdug/SauceLabsTunnel.js:354:17>
	  at readStartupMessage  <node_modules/intern/node_modules/digdug/SauceLabsTunnel.js:365:14>
	  at <node_modules/intern/node_modules/digdug/SauceLabsTunnel.js:435:12>
	  at Array.some  <native>
	  at Socket.<anonymous>  <node_modules/intern/node_modules/digdug/SauceLabsTunnel.js:429:21>
	  at Socket.EventEmitter.emit  <events.js:117:20>
	  at Socket.<anonymous>  <_stream_readable.js:746:14>
	  at Socket.EventEmitter.emit  <events.js:92:17>
	  at emitReadable_  <_stream_readable.js:408:10>
	  at emitReadable  <_stream_readable.js:404:5>

-->


cd node_modules/intern
node
	var SauceLabsTunnel = require('digdug/SauceLabsTunnel')
		undefined
	var t = new SauceLabsTunnel();
		undefined
		
		{ accessKey: undefined,
		  directDomains: [],
		  domainAuthentication: [],
		  fastFailDomains: [],
		  skipSslDomains: [],
		  username: undefined }

	
	t.start().then(function () { console.log('YES'); });
{ cancel: [Function], then: [Function] }
		YES

		var SauceLabsTunnel = require('digdug/SauceLabsTunnel')
	
</entry>
<entry [Mon 2014:11:10 20:24:22 EST] EXAMPLE intern TESTS - BDD, TDD AND OBJECT>

1. CREATE BDD TEST

define([
  'intern!bdd',
  'intern/chai!expect',
  '../MyWidget'
], function (bdd, expect, MyWidget) {
  bdd.describe('demo widget', function () {
    var widget;

    bdd.before(function () {
      widget = new MyWidget();
    });

    bdd.after(function () {
      widget.destroy();
    });

    bdd.it('should have children', function () {
      expect(widget.children).to.not.be.empty;
    });
  });
});


OR TDD TEST

define([
  'intern!tdd',
  'intern/chai!assert',
  '../MyWidget'
], function (tdd, assert, MyWidget) {
  tdd.suite('demo widget', function () {
    var widget;

    tdd.before(function () {
      widget = new MyWidget();
    });

    tdd.after(function () {
      widget.destroy();
    });

    tdd.test('creation', function () {
      assert(widget.children.length > 0,
        'Widget should have children');
    });
  });
});


OR OBJECT TEST

define([
  'intern!object',
  'intern/chai!assert',
  '../MyWidget'
], function (registerSuite, assert, MyWidget) {
  var widget;

  registerSuite({
    name: 'demo widget',

    setup: function () {
      widget = new MyWidget();
    },

    teardown: function () {
      widget.destroy();
    },

    creation: function () {
      assert(widget.children.length > 0,
        'Widget should have children');
    }
  });
});


2. RUN TEST

intern-runner config=tests/intern


	
</entry>
<entry [Thu 2014:07:10 19:06:45 EST] SELENIUM>

http://docs.seleniumhq.org/projects/ide/
	
</entry>
<entry [Tue 2014:03:11 19:44:35 EST] PHANTOMJS>

http://phantomjs.org/quick-start.html

1. INSTALL PHANTOMJS

https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2

UNZIP AND PUT IN /usr/bin


2. TAKE PIC OF WEBPAGE

A web page can be loaded, analyzed, and rendered by creating a web page object.

The following script demonstrates the simplest use of page object. It loads example.com and then saves it as an image, example.png.

var page = require('webpage').create();
page.open('http://example.com', function() {
  page.render('example.png');
  phantom.exit();
});
Because of its rendering features, PhantomJS can be used to capture web pages, essentially taking a screenshot of the contents.


3. TEST LOAD SPEED

The following loadspeed.js script loads a specified URL (do not forget the http protocol) and measures the time it takes to load it.

var page = require('webpage').create(),
  system = require('system'),
  t, address;

if (system.args.length === 1) {
  console.log('Usage: loadspeed.js < some URL>');
  phantom.exit();
}

t = Date.now();
address = system.args[1];
page.open(address, function(status) {
  if (status !== 'success') {
    console.log('FAIL to load the address');
  } else {
    t = Date.now() - t;
    console.log('Loading time ' + t + ' msec');
  }
  phantom.exit();
});
Run the script with the command:

phantomjs loadspeed.js http://www.google.com
It outputs something like:

Loading http://www.google.com Loading time 719 msec


4. PRINT TO CONSOLE

 page, including from the code inside evaluate(), will not be displayed by default. To override this behavior, use the onConsoleMessage callback. The previous example can be rewritten to:

var page = require('webpage').create();
page.onConsoleMessage = function(msg) {
  console.log('Page title is ' + msg);
};
page.open(url, function(status) {
  page.evaluate(function() {
    console.log(document.title);
  });
});
Since the script is executed as if it is running on a web browser, standard DOM scripting and CSS selectors work just fine. It makes PhantomJS suitable to carry out various page automation tasks.



5. MONITOR NETWORK REQUESTS

Network Requests and Responses

When a page requests a resource from a remote server, both the request and the response can be tracked via onResourceRequested and onResourceReceived callback. This is demonstrated in the example netlog.js:

var page = require('webpage').create();
page.onResourceRequested = function(request) {
  console.log('Request ' + JSON.stringify(request, undefined, 4));
};
page.onResourceReceived = function(response) {
  console.log('Receive ' + JSON.stringify(response, undefined, 4));
};
page.open(url);
For more info on how to utilize this features for HAR export as well as YSlow-based performance analysis, see the page on network monitoring.



	
</entry>
