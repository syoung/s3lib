agua.dojo




<entry [Tue 2015:04:14 15:04:14 EST] USE http://filltext.com>

http://filltext.com/?rows=10&val={randomNumber}&callback=JSON_CALLBACK
    

JSON_CALLBACK([{"val":2},{"val":8},{"val":0},{"val":2},{"val":8},{"val":9},{"val":7},{"val":9},{"val":1},{"val":6}])


</entry>
<entry [Tue 2015:04:14 15:03:15 EST] ANGULAR WITH D3, IO AND REACT>

IO
https://github.com/btford/angular-socket-io-seed

REACT

https://egghead.io/lessons/integrating-components-with-d3-and-angularjs


</entry>
<entry [Tue 2015:03:17 22:58:43 EST] ADDED Agua.getComponent METHOD>

var runStatus = Agua.getComponent("workflow.runStatus");
console.dir({runStatus:runStatus});
var run = runStatus.runWorkflow
console.dir({run:run});

runStatus.runWorkflow = ...

var folder = Agua.getComponent("folders");

	
</entry>
<entry [Mon 2014:12:22 03:48:37 EST] D3 AND BLOCKLY>

DEMO

http://bollwyvl.github.io/blockd3/#run

GITHUB

https://github.com/bollwyvl/blockd3

	
</entry>
<entry [Tue 2014:12:16 02:14:55 EST] INSTALL o8>


1. DOWNLOAD o8

cd /mnt/repos/private/syoung
git clone https://github.com/chapmanb/o8.git


2. DOWNLOAD leiningen

cd /mnt/repos/private/syoung/o8
wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
export PATH=`pwd`:$PATH


3. RUN SERVER


cd /mnt/repos/private/syoung/o8
lein run -c config/web-processing.yaml


Consider using [bcbio.variation "0.0.8-20130505.002902-3" :exclusions [org.apache.httpcomponents/httpclient]].

Invalid maximum heap size: -Xmx4g
The specified size exceeds the maximum representable size.
Error: Could not create the Java Virtual Machine.
Error: A fatal exception has occurred. Program will exit.

EDIT FILE project.clj 

CHANGE THIS:

  :jvm-opts ["-Dorg.eclipse.jetty.util.log.class=org.eclipse.jetty.util.log.StdErrLog" "-Xms2g" "-Xmx4g"]

TO THIS:
 
  :jvm-opts ["-Dorg.eclipse.jetty.util.log.class=org.eclipse.jetty.util.log.StdErrLog" "-Xms1g" "-Xmx1g"]




BROWSE TO:

http://localhost:8080



	
</entry>
<entry [Tue 2014:12:16 02:10:40 EST] o8, SENSING XPRIZE, genomespace AND KEMING LABS>

https://github.com/chapmanb/o8

http://www.genomespace.org/

http://sensing.xprize.org/about/overview

https://keminglabs.com/
	
</entry>
<entry [Tue 2014:12:16 02:10:20 EST] COLOUR THEORY>

http://lifehacker.com/learn-the-basics-of-color-theory-to-know-what-looks-goo-1608972072
	
</entry>
<entry [Fri 2014:11:28 12:59:22 EST] FIXED CHROME DEVTOOLS ERROR: Cannot read property 'name' of undefined>
	
PROBLEM

LOAD Agua USING COMPONENTS PATTERN

	Agua.loadComponents    name: exchange plugins/core/Agua.js:371
	Agua.loadComponents    module: plugins/exchange/Exchange plugins/core/Agua.js:372
	plugins.exchange.Exchange    LOADING plugins/exchange/Exchange.js:1
	plugins.exchange.Exchange    COMPLETE plugins/exchange/Exchange.js:227
	exchange.Exchange.constructor    args: plugins/exchange/Exchange.js:57
	Object plugins/exchange/Exchange.js:58
	exchange.Exchange.loadSocketIO    this.socketJs: plugins/exchange/socketio.js plugins/exchange/Exchange.js:99
	exchange.Exchange.setHost    this.host: localhost plugins/exchange/Exchange.js:106

		TypeError: Cannot read property 'name' of undefined


SOLUTION

TYPO - REMOVE EXTRA COMMA IN components LIST:

	,
	{
		name	:	"exchange",
		module	:	"plugins/exchange/Exchange"
	},	< ----- REMOVE THIS
	,


	
</entry>
<entry [Fri 2014:11:14 11:37:38 EST] dojo AND node.js>

http://dojotoolkit.org/documentation/tutorials/1.10/node/
	
</entry>
<entry [Fri 2014:11:14 11:37:19 EST] DOJO 1.10 BUILDING>
	
http://dojotoolkit.org/documentation/tutorials/1.10/build/
	
</entry>
<entry [Fri 2014:11:14 11:04:18 EST] RIGHT-TO-LEFT LANGUAGES>

http://dojotoolkit.org/reference-guide/1.10/quickstart/internationalization/bi-directional-text.html

	
</entry>
<entry [Fri 2014:11:14 10:51:54 EST] INTERNATIONALISATION TUTORIAL>


http://dojotoolkit.org/documentation/tutorials/1.10/i18n/


Creating builds with resource bundles
A typical step in deploying a Dojo Toolkit-based application is to create a build of your application; a build minifies your JavaScript, inlines HTML and CSS, and generally makes your application run much more efficiently. The Dojo Build Tool also provides ways of flattening your resource bundles through the command line parameter localeList.

Normally you won't need to include this command line parameter to create your build; by default, the following list of locales is included:

1
"en-gb,en-us,de-de,es-es,fr-fr,it-it,pt-br,ko-kr,zh-tw,zh-cn,ja-jp"
However, if your application needs more than these locales defined, you can write your own comma-delimited list as the value of the localeList parameter.

A common "gotcha" when creating internationally-aware applications is to forget to copy over any /nls directories to your Dojo Toolkit release. If you create a build and run into errors loading the application the first time, it is likely that some /nls directories were not copied during the course of the build process; to fix simply copy the missing directories into your release, in the appropriate spots.


	
</entry>
<entry [Fri 2014:11:14 01:27:35 EST] DOJO DEPENDENCY INJECTION>
	
http://www.sitepen.com/blog/2014/06/25/dojo-faq-does-dojo-have-dependency-injection-like/

http://stackoverflow.com/questions/16324900/how-to-mock-dependencies-in-intern-tests

https://github.com/amdjs/amdjs-api/wiki/Common-Config#map-


Intern uses the Dojo Toolkit’s AMD loader. To mock out dependencies, you should be able to just use the standard AMD map feature. In your Intern configuration file, something like this should do what you need:

define({
  …,
  loader: {
    map: {
      myPackage: {
        'myPackage/foo': 'myPackage/mocks/foo',
        'herp': 'myPackage/mocks/herp',
        'derp': 'myPackage/mocks/derp'
      }
    }
  }
});

See https://github.com/amdjs/amdjs-api/wiki/Common-Config#map- for more information on map



http://stackoverflow.com/questions/21943707/how-to-inject-a-mock-into-a-dojo-class-with-intern-js




</entry>
<entry [Fri 2014:11:14 00:56:00 EST] RETURN FROM defined USING dfd.resolve>

http://www.sitepen.com/blog/2014/07/14/mocking-data-with-intern/


            // provide the mocked copy to the caller
            dfd.resolve(mockedModule);

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

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
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

If you’re still not sure where to start, or would like extra assistance making your code more testable and reliable, we’re here to help!

	
</entry>
<entry [Fri 2014:11:14 00:47:58 EST] DOJO AMD CONVERTER>


http://www.sitepen.com/blog/2013/04/03/introducing-dojo-amd-converter/


	
</entry>
<entry [Thu 2014:11:13 19:29:09 EST] SWIZEC BOOK ON PROGRAMMING>

git clone git@github.com:Swizec/nightowls.git


</entry>
<entry [Sun 2014:11:02 11:27:40 EST] LIVE EDIT WORKING WITH require.undef>

SET reload FUNCTION IN CHROME Console:

var reload = function(module) {
	require([module], function(){});
}


RUN COMMAND TO RELOAD MODULE:

require.undef("plugins/workflow/Grid");

reload("plugins/workflow/Grid");

	
</entry>
<entry [Sun 2014:11:02 10:45:51 EST] DOJO MANUAL CONSTRUCTOR CHAINING>

http://stackoverflow.com/questions/22572008/how-to-mock-a-node-js-module-loaded-with-dojo-node

In some cases users may want to redefine how initialization works. In this case the chaining should be turned off so this.inherited() can be used instead.

require(["dojo/_base/declare"], function(declare){
  var A = declare(null, {
    constructor: function(){
      console.log("A");
    }
  });

  var B = declare(A, {
    "-chains-": {
      constructor: "manual"
    },
    constructor: function(){
      console.log("B");
    }
  });

  var C = declare(B, {
    constructor: function(){
      console.log("C - 1");
      this.inherited(arguments);
      console.log("C - 2");
    }
  });

  var x = new C();
});

// prints:
// C - 1
// B
// C - 2

	
</entry>
<entry [Sun 2014:11:02 10:30:15 EST] ENSURE LOGGED OBJECT IS CORRECT IN CHROME DEVTOOLS>

http://www.sitepen.com/blog/2008/04/03/advanced-javascript-debugging-techniques/

Snapshot of Object – Although usually not the case, sometimes the object changes from the time Firebug logged it to the time you look at it. I’ve witnessed this problem in dojo.data stores. I use dojo.mixin({}, myObject) to make sure the object logged is in the right state.


	
</entry>
<entry [Sun 2014:11:02 10:20:22 EST] USE JQUERY WITH DOJO>

http://stackoverflow.com/questions/2850314/jquery-dojo-how-do-i-use-jquery-with-dojo-toolkit

https://www.ibm.com/developerworks/mydeveloperworks/blogs/94e7fded-7162-445e-8ceb-97a2140866a9/entry/loading_jquery_with_dojo_1_7_amd_loader2?lang=en

1. SPECIFY JQUERY LOCATION

You can use jQuery by pulling it into your app via a script tag in the head of your website, there will be no conflicts with dojo.

However something to keep in mind when using jQuery with dojo, especially with dojo version 1.8 and its full AMD support. It is cleaner (especially if you can't pull in jQuery in the head of your website) to take advantage of AMD (asynchronous module definition). You will need to make a package entry within the dojo config script to correctly pull in the framework. Here is an example that uses a library location for jquery and jquery-ui...

<!-- external library configuration code included in header to make sure this
    is loaded before code in body-->
    <!-- dojo config -->
<!--
	
	<script>
            /* Instead of using the inline dojo-config attribute
            * create this variable so we can configure dojo here.
            * This seems a little clearer, easier to read as a config.
            */
            var dojoConfig = {
                baseUrl: "./",
                async: true,
                isDebug: true,
                parseOnLoad: false,//false to allow for us to call this independantly in js later on

                //here are the packages dojo will be aware of and related js files
                packages: [
                    //dojo specific packages
                    {name: "dojo", location: "libs/dojo"},
                    {name: "dijit", location: "libs/dijit"},
                    {name: "dojox", location: "libs/dojox"},
                    {name: "jquery", location: "libs/jquery", main: "jquery-1.8.2"},
                    {name: "jqueryui", location: "libs/jquery", main: "jquery-ui-1.9.1"},
                ]

            };


    </script>

-->

My folder structure just has a libs folder at the root, which is why I have "./" for the base url, but you could just as easily pull from a cdn location.

Without this config entry jQuery will not function as expected, and you may end up getting "is not a function" errors popping up in the console.

If you do put a separate script tag in to pull in jQuery or other third party framework and also use AMD to do the same, you'll just end up pulling it in a second time when you require it for dojo for the first time.


2. USE JQUERY IN DOJO

Obviously in a real life application you won't probably load the two libraries to achieve the same task (i.e. doing DOM queries and manipulations). So you will be loading different modules. The following example shows you how you can use jQuery to query your DOM and use Dojo to display a chart widge both being loaded using Dojo AMD loader:

<!-- 

<script type="text/javascript">
  define.amd.jQuery = true;
  require(["jquery", "dojox/charting/Chart", "dojox/charting/axis2d/Default",
    "dojox/charting/plot2d/Default", "dojox/charting/plot2d/Columns", "dojox/charting/Theme",
    "dojox/charting/plot2d/Grid", "dojox/charting/StoreSeries", "dojo/store/Memory"],
    function($, Chart, Axis, Line, Columns, Theme, Grid, StoreSeries, Memory){

    // ...

    $(document).ready(function(){
      $("p").click(function(){
      var chart = new Chart("chart").
        setTheme(theme).
       	addAxis("x", { majorTickStep: 1, minorTicks: false, labelFunc: monthLabel, 
           minorLabels: false}).
       	addAxis("ry", { vertical: true, fixLower: "major", fixUpper: "major", includeZero: true, 
           majorTickStep: 10000, max: 30000, title: "Revenues"  }).
	addAxis("py", { vertical: true, fixLower: "major", fixUpper: "major", includeZero: true, 
           leftBottom: false, majorTickStep: 100, max: 300, title: "Profit" }).
	addPlot("profit", {type: Line, vAxis: "py", tension: "X", markers: true, 
           stroke: {color:"yellow"}, fill: "yellow", animate: true}).
       	addPlot("revenues", {type: Columns, gap: 5, vAxis: "ry", 
           stroke: {color:"white"}, fill: "#2a6ead", animate: true}).
	addPlot("grid", { type: Grid, vMajorLines: false, vAxis: "ry"}).
       	addSeries("data1", new StoreSeries(store, {}, function(item){
	  return item.revenues;
	}), { plot: "revenues"}).
	addSeries("data2", new StoreSeries(store, {}, function(item){
          return item.profit;
	}), {plot: "profit"});
	chart.render();
     });
  });
</script>


-->


SEE ALSO


https://www.ibm.com/developerworks/mydeveloperworks/blogs/94e7fded-7162-445e-8ceb-97a2140866a9/entry/loading_jquery_with_dojo_1_7_amd_loader2?lang=en

Make dojo/query module aliased to $ and jQuery module aliased to jquery without any conflict. 
 
<!-- 

<script type="text/javascript">
  define.amd.jQuery = true;
  require(["jquery", "dojo/query", "dojo/NodeList-dom"], function(jquery, $){
    $("output").style("visibility", "visible");
    jquery("#output").css("visibility", "hidden");
  });
</script>


-->
	
</entry>
<entry [Sun 2014:11:02 09:41:59 EST] USE DOJO IN CHROME DEVTOOLS>

http://stackoverflow.com/questions/17103125/dojo-amd-module-methods-in-chrome-chrome-firebug

See http://dojotoolkit.org/reference-guide/1.9/dojo/parser.html#declarative-require

var reload = function(module) {
	require([module], function(){});
}

require(["plugins/workflow/Grid"], function(){});

USE

require(["dojo/dom"], function(dom) { console.log(dom.byId("search")); });

OR

require(["dijit/registry"], function(registry) { console.log(registry.byId("search")); });

TO USE registry AND dom, SET IN THE HTML:

<!--
<script type="dojo/require">
    dom : "dojo/dom",
    registry : "dijit/registry"
</script>

-->

THEN USE IN CONSOLE:

var widget = registry.byId("widgetId")

var node = dom.byId("nodeId");



	
</entry>
<entry [Sat 2014:11:01 21:18:34 EST] DOJO - CHANGE WIDGET ATTRIBUTES WITH _setXxxxxxAttr>

To map a widget attribute to a DOM node attribute, you do:

_setDisabledAttr: {node: "focusNode", type: "attribute" }
or alternately just

_setDisabledAttr: "focusNode"
Both code blocks copy the widget’s “disabled” attribute onto the focusNode DOM node in the template.

A more complicated example to map an attribute called “img” to this.imageNode.src:

_setImgAttr: {node: "imageNode", type: "attribute", attribute: "src" }



Custom setters/getters

When you have an attribute where setting/getting it is more complicated than an object like above can handle, you need to write custom getters/setters methods for it. Like above, the naming convention (for an attribute named foo) is _setFooAttr() and _getFooAttr(). Set() and get() will automatically detect and call these custom setters.

Here’s an example of a behavioral widget (it uses the DOM node from the supplied markup) that has an “open” attribute that controls whether the widget is hidden or shown:

RunSourceCollapse
require([
     "dojo/_base/declare", "dojo/dom-style", "dojo/parser", "dojo/ready",
     "dijit/_WidgetBase", "dijit/_TemplatedMixin"
 ], function(declare, domStyle, parser, ready, _WidgetBase, _TemplatedMixin){

     declare("HidePane", [_WidgetBase], {
         // parameters
         open: true,

         _setOpenAttr: function(/*Boolean*/ open){
             this._set("open", open);
             domStyle.set(this.domNode, "display", open ? "block" : "none");
         }
     });

     ready(function(){
         // Call the parser manually so it runs after our widget is defined, and page has finished loading
         parser.parse();
     });
 });

<!--
<span data-dojo-type="HidePane" data-dojo-props="open:false" data-dojo-id="pane">This pane is initially hidden</span>
<button onclick="pane.set('open', true);">show</button>
<button onclick="pane.set('open', false);">hide</button>

-->

Custom setters are quite common. Usually you don’t need a custom getter (as the default action for get(‘foo’) is to access Widget.foo), but for something like Editor where it’s impractical to constantly keep Editor.value up to date, writing a custom _getValueAttr() accessor makes sense.

Note in the above example the use of this._set(“open”, open). This saves the current value of the “open” attribute calling any handlers registered with watch(), to monitor attribute changes.


	
</entry><entry [Fri 2014:10:31 01:47:41 EST] EXPLORE MVC FRAMEWORKS>

http://www.javascriptmvc.com/ (FOR JQUERY)
http://cujojs.com/

	
</entry>
<entry [Wed 2014:10:29 03:23:00 EST] USE require.undef TO RELOAD MODULE>

http://livedocs.dojotoolkit.org/loader/amd


require.undef removes a module from the module namespace. require.undef is primarily useful for test frameworks that need to load and unload modules without having to reload the entire application.

require.undef(
  moduleId // (string) a module identifier
) -> undefined


https://bugs.dojotoolkit.org/ticket/18123

require.undef doesn't work with plugin modules, or modules loaded by plugin modules


https://github.com/chuckdumont/dojo/commit/f28c4995e190ba67c05c6f4216bdb7b6f62aed1c

fix dojo.js:


-				if(!modules[mid]){
+				if(!modules[mid] || !modules[mid].injected /*for require.undef*/){
 					// create a new (the real) plugin resource and inject it normally now that the plugin is on board
 					injectPlugin(modules[mid] = pluginResource);
 				} // else this was a duplicate request for the same (plugin, rid) for a nondynamic plugin
 @@ -1315,7 +1315,7 @@
 			// This is useful for testing frameworks (at least).
 			var module = getModule(moduleId, referenceModule);
 			setArrived(module);
-			mix(module, {def:0, executed:0, injected:0, node:0});
+			mix(module, {def:0, executed:0, injected:0, node:0, load:0});


	
</entry>
<entry [Wed 2014:10:29 03:19:12 EST] FIXED EXPANDOPANE LAYOUT USING this.mainTab.resize()>

PROBLEM

Workflow EXPANDOPANE LAYOUT DOES NOT COMPLETE, IS ARRAYED AS COLUMN

SOLUTION

ADDED THIS LINE TO startup:

this.mainTab.resize();

	
</entry>
<entry [Thu 2014:10:30 00:40:18 EST] FIXED multipleDefined ERROR WITH t/unit/html/workflow/workflow/test.html>


PROBLEM

WHEN LOADING Agua AND Workflow IN runTests.js, GET THIS ERROR:

	Error: multipleDefine {src: "dojoLoader", info: Object, stack: (...), message: "multipleDefine"} dojo.js:1879
	src: dojoLoader dojo.js:1882
	info: Object {pid: "dijit", mid: "dijit/_KeyNavContainer", pack: Object, url: "../../../../../dojo/dijit/_KeyNavContainer.js", executed: 0…} dojo.js:1882
	. dojo.js:1884
	Uncaught Error: declare dijit._MenuBase: mixin #2 is not a callable constructor. 


SOLUTION

1. ADD async: 0 TO dojoConfig:


	parseOnLoad: true,
	async : 0,
	insertAbsMids: false,
	has : {
		"dojo-undef-api": 1
	},


2. MAKE SURE ALL CALLED MODULES ARE AMD-FORMAT


3. REMOVE ALL declare AND define IDENTIFIERS


4. MAKE SURE ALL TEMPLATE INLINE DECLARATIONS ARE AMD-FORMAT

I.E., DON'T DO THIS:

<!--
    <div
        dojoAttachPoint="titlePane"
        dojoType="plugins.dijit.TitlePane"

-->

RATHER DO THIS:

<!--
	<div
        dojoAttachPoint="titlePane"
        dojoType="plugins/dijit/TitlePane"
-->


5. INCLUDE MODULE IN define MODULES
	
	define([
	...
	//// INTERNAL MODULES
	"plugins/workflow/Parameters",
	"plugins/workflow/Grid"
	,"plugins/workflow/Apps/AdminPackages"
	,"plugins/workflow/Apps/AguaPackages"
	], {

	
	

NOTES
=====

REMOVING IDENTIFIER FROM define STATEMENT OF _KeyNavContainer:

	//return declare("dijit._KeyNavContainer", [_FocusMixin, _KeyNavMixin, _Container], {
	return declare([_FocusMixin, _KeyNavMixin, _Container], {

... ETC. DID NOT WORK BECAUSE STILL GOT NEW ERRORS:

.../onload.js
.../currency.js
... ETC.

	
</entry>
<entry [Wed 2014:10:29 11:43:22 EST] FIXED 'function is undefined' WHEN USING require.undef>

PROBLEM

USING nightly OR 1.10.2 RELEASES BUT GET THIS ERROR:

require.undef("plugins/workflow/Workflow")

	function is undefined
	

SOLUTION

1. USE 1.10.2 (NIGHTLY WON'T WORK)


2. ADD dojo-undef-api TO dojoConfig TO ENABLE require.undef

	parseOnLoad: true,
	async : 0,
	insertAbsMids: false,
	has : {
		"dojo-undef-api": 1
	},

I.E.:

<!--

var dojoConfig = {
	isDebug: true,
	locale: "en-us",
	//extraLocale: ['ja-jp'],
	debugAtAllCosts: true,
	useCommentedJson: true,

	parseOnLoad: true,
	async : 0,
	insertAbsMids: false,
	has : {
		"dojo-undef-api": 1
	},

	packages: [
		{
			name: "t",
			location: "../../t"
		},
		{
			name: "plugins",
			location: "../../plugins"
		}
	]
};

<script type="text/javascript"
	src="../../../../../dojo/dojo/dojo.js"
>
</script>


-->


3. RUN AS FOLLOWS


	require.undef('plugins/workflow/Workflow');


	
</entry>
<entry [Wed 2014:10:29 11:41:48 EST] ENABLED require.undef IN DOJO 1.10.2>

1. 

http://dojotoolkit.org/documentation/tutorials/1.7/build/



	
</entry>
<entry [Tue 2014:10:28 00:51:15 EST] FIXED 'not defined' ERROR ON this._showAnim.play IN dojox.layout.ExpandoPane>

LINE 225:

	toggle: function(){
		// summary:
		//		Toggle this pane's visibility

		// ADDED THIS LINE
		if ( ! this.showAnim ) this._setupAnims();
		
		if(this._showing){
			this._hideWrapper();
			this._showAnim && this._showAnim.stop();
			this._hideAnim.play();
		}else{
			this._hideAnim && this._hideAnim.stop();
			this._showAnim.play();

	
</entry>
<entry [Sun 2014:10:26 14:22:50 EST] DOWNLOADED DOJO NIGHTLY FOR require.undef>


1. CREATE DIRECTORY

mkdir -p /home/syoung/software/dojo/nightly-141025
cd /home/syoung/software/dojo/nightly-141025


2. DOWNLOAD

http://archive.dojotoolkit.org/nightly/


    
</entry>
<entry [Sun 2014:10:26 13:26:09 EST] DOWNLOAD DOJO 1.10.2 FOR require.undef>

1. CREATE DIRECTORY

mkdir -p /home/syoung/software/dojo/1.10.2
cd /home/syoung/software/dojo/1.10.2


2. DOWNLOAD DOJO

git clone https://github.com/dojo/dojo
git clone https://github.com/dojo/dijit
git clone https://github.com/dojo/dojox


3. DOWNLOAD DEPENDENCIES

git clone https://github.com/sitepen/dgrid
git clone https://github.com/kriszyp/put-selector.git
git clone https://github.com/kriszyp/xstyle.git
git clone https://github.com/rbuels/jszlib.git
git clone https://github.com/jDataView/jDataView.git
git clone https://github.com/rbuels/lazyload.git


PROBLEM:

GET multipleDefine ERROR ON LOAD OF FIRST PLUGIN

plugins/core/PluginManager.js:167
PluginManager.percentProgress    Agua.login.progressBar: [Widget dijit.ProgressBar, dijit_ProgressBar_0] plugins/core/PluginManager.js:168
PluginManager.percentProgress    AFTER Agua.login.progressBar.set() plugins/core/PluginManager.js:170
PluginManager.loadPlugin    ooooooooooooooooo DOING dojo[require](plugins/workflow/Controller); plugins/core/PluginManager.js:109
plugins.workflow.Controller    END plugins/workflow/Controller.js:146
Error: multipleDefine {src: "dojoLoader", info: Object, stack: (...), message: "multipleDefine"} 


    
</entry>
<entry [Sat 2014:10:18 04:15:29 EST] DOJO 2.0 TESTING DATA TYPES>
    
http://dojotoolkit.org/reference-guide/1.9/releasenotes/migration-2.0.html

2.0 will remove the isXXX() functions defined in dojo/_base/lang. In most cases they can be easily replaced with simple native tests:

1.x	2.0
dojo.isString(v)	typeof v == "string"
dojo.isArray(v)	v instanceof Array
dojo.isFunction(v)	typeof v == "function"
dojo.isArrayLike(v)	"length" in v, etc. (but see note below)
    
</entry>
<entry [Wed 2014:09:17 08:23:40 EST] SYNTAX CHECKING USING ACE CODE EDITOR AND WEBWORKER>

ACE EDITOR SYNTAX CHECKING
https://github.com/ajaxorg/ace/wiki/Syntax-validation

ACE EDITOR CREATE TEXTAREA
http://stackoverflow.com/questions/6440439/how-do-i-make-a-textarea-an-ace-editor/19513428#19513428

SWITCH ON LIVE SYNTAX CHECKING
http://stackoverflow.com/questions/21995198/how-do-i-enable-live-syntax-checking-in-the-ace-editor


Syntax checking is done via webworker which loads http://www.learneroo.com/assets/ace-src/worker-javascript.js file, but in your site that file seems to be empty. I only see ; in it.
In the jsfiddle i showed earlier http://jsbin.com/ojijeb/432/edit, it didn't work because of cross origin restrictions on web workers (which i didn't notice since was running chrome with --disable-web-security), but thanks to latest Ace update, it works now.

share|improve this answer
answered Feb 27 at 21:47

a user
3,8081621



</entry>
<entry [Sat 2014:08:16 11:29:54 EST] INSTALL PHONEGAP ON UBUNTU>

npm install phonegap

phonegap@3.5.0-0.21.14 node_modules/phonegap
├── pluralize@0.0.4
├── colors@0.6.0-1
├── semver@1.1.0
├── minimist@0.1.0
├── qrcode-terminal@0.9.4
├── shelljs@0.1.4
├── cordova@3.5.0-0.2.7 (q@0.9.7, underscore@1.4.4, nopt@2.2.1)
├── prompt@0.2.11 (revalidator@0.1.8, pkginfo@0.3.0, read@1.0.5, winston@0.6.2, utile@0.2.1)
├── phonegap-build@0.8.4 (qrcode-terminal@0.8.0, shelljs@0.0.9, optimist@0.3.7, phonegap-build-api@0.3.3)
├── cordova-lib@0.21.7 (osenv@0.0.3, properties-parser@0.2.3, bplist-parser@0.0.5, mime@1.2.11, q@0.9.7, semver@2.0.11, underscore@1.4.4, npm@1.3.4, plist-with-patches@0.5.1, dep-graph@1.1.0, xcode@0.6.6, elementtree@0.1.5, rc@0.3.0, tar@0.1.19, npmconf@0.1.16, glob@3.2.11, request@2.22.0, cordova-js@3.6.2)
└── connect-phonegap@0.12.8 (home-dir@0.1.2, connect-inject@0.3.2, shelljs@0.2.6, localtunnel@1.3.0, request-progress@0.3.1, useragent@2.0.8, node-static@0.7.0, gaze@0.4.3, tar@0.1.19, request@2.33.0, connect@2.12.0, socket.io@1.0.6)

	
</entry>
<entry [Sat 2014:08:16 11:16:40 EST] DOJO PHONEGAP>

http://www.ibm.com/developerworks/library/wa-getstarteddojo/
	
</entry>
<entry [Thu 2014:07:10 19:05:32 EST] WEB DESIGN MANUAL>

http://webfieldmanual.com
	
</entry>
<entry [Thu 2014:07:10 18:46:29 EST] STANDARDISED ISO-8601 TIMESTAMP>

http://en.wikipedia.org/wiki/ISO_8601
	
</entry>
<entry [Thu 2014:07:10 18:20:57 EST] UX RESOURCES>

https://plus.google.com/communities/113557318254825410566

http://azanebrain.github.io/news/fencsd-meetup-recap-april014/



</entry>
<entry [Thu 2014:07:10 16:29:30 EST] CONTINOUS DEPLOYMENT TESTING (CI) OF NODE.JS APP USING CODESHIP>


http://blog.codeship.io/2013/10/23/how-to-deploy-a-node-js-app-from-bitbucket-to-nodejitsu.html


	
</entry>
<entry [Sat 2014:05:24 00:25:01 EST] D3 ON vida.io>

https://vida.io/


	
</entry>
<entry [Tue 2014:03:11 19:47:38 EST] DOJO WITH BOOTSTRAP>

KEVINANDRE
http://dojobootstrap.com/

THESOCIABLE
http://thesociable.github.io/dbootstrap/
	
</entry>
<entry [Tue 2014:03:11 19:43:26 EST] DOJOMENT>

https://github.com/kitsonk/dojoment/find/master


	
</entry>
<entry [Sat 2014:03:08 23:45:03 EST] ANGULAR JS IN 20 MINS>

ANGULAR JS IN 20 MINS
http://www.youtube.com/watch?v=tnXO-i7944M

ANGULAR VS DOJO - USAGE STATS
http://w3techs.com/technologies/comparison/js-angularjs,js-dojo

	
</entry>
<entry [Sat 2014:03:08 22:25:26 EST] WEBKIT ANIMATED SPINNER>

spinner.html

<!--

<html>
<head>
	<title>test spinner</title>

    <link rel="stylesheet" href="spinner.css">

</head>
<body>

SPINNER
<div id="nprogress">
	<div class="spinner">
	</div>
</div>

<br>

AFTER SPINNER

</body>
</html>

-->


spinner.css

#nprogress .spinner {
	display:block;
	position:fixed;
	z-index:100;
	top:15px;
	right:15px
}

#nprogress .spinner-icon {
	width:18px;
	height:18px;
	box-sizing:border-box;
	border:solid 2px transparent;
	border-top-color:#29d;
	border-left-color:#29d;
	border-radius:50%;
	-webkit-animation:nprogress-spinner 400ms linear infinite;
	animation:nprogress-spinner 400ms linear infinite
}

@-webkit-keyframes nprogress-spinner {
	0% {-webkit-transform:rotate(0deg) }
	100% {-webkit-transform:rotate(360deg)}
}

@keyframes nprogress-spinner{
	0%{transform:rotate(0deg)}
	100%{transform:rotate(360deg)}
}


</entry>
<entry [Sat 2014:02:01 17:57:51 EST] TEST DND AVATAR CREATION - HALT dojo.dnd.Manager.onMouseUp>

OVERLOAD dojo.dnd.Manager.onMouseUp - PREMATURE RETURN



</entry>
<entry [Sat 2014:01:11 00:23:28 EST] FIXED MODAL DIALOG WIDGET FOLLOWS MOUSE>

http://forums.esri.com/Thread.asp?c=158&f=2396&t=286183

	
</entry>
<entry [Thu 2013:12:19 08:00:36 EST] AUTOMATICALLY INSERT LINK+ANCHOR INTO COPY TEXT ON PAGE>

http://www.unixmen.com/managing-your-services-and-processes-in-linux/

http://www.unixmen.com/managing-your-services-and-processes-in-linux/#sthash.9daNRX8g.dpuf

	
</entry>
<entry [Tue 2013:11:19 00:32:47 EST] FIXED INPUT GREY BORDER ON FOCUS>

textarea:focus, input:focus{
    outline: 0;
}
    
</entry>
<entry [Mon 2013:10:21 00:23:59 EST] NEED FOR this.inherited INSIDE startup METHOD WHEN USING dijit._Templated>

http://dojotoolkit.org/documentation/tutorials/1.6/templated/

dijit._Templated overrides three methods defined in Dijit's widget architecture:

buildRendering
destroyRendering
startup

These three methods handle the parsing and filling out of the template (buildRendering), destroying the widget's DOM correctly (destroyRendering), and ensuring that any child widgets in a template are started correctly.

Because all three methods are critical to the templating process, if you override any of these methods in your custom code, make sure you include a call to the parent version by adding

this.inherited(arguments)

in your overridden method.


    
</entry>
<entry [Mon 2013:10:21 00:22:00 EST] USE templateString INSTEAD OF templatePath>

USE:

templateString: dojo.cache("plugins", "workflow/Apps/templates/apps.html"),


INSTEAD OF:

// templatePath: require.toUrl("plugins/workflow/Apps/templates/apps.html"),

    

    
</entry>
<entry [Mon 2013:10:21 00:10:48 EST] FIXED PROBLEM WITH WIDGETS IN TEMPLATE NOT LOADING USING AMD SIGNATURE>

PROBLEM

WIDGETS IN TEMPLATE DON'T LOAD WHEN USING

	"dijit/_Widget",
	"dijit/_TemplatedMixin",

WITH 'widgetsInTemplate : true'


SOLUTION

USE "dijit/_WidgetsInTemplateMixin":


	"dijit/_Widget",
	"dijit/_TemplatedMixin",
	"dijit/_WidgetsInTemplateMixin",


AND NO NEED FOR 'widgetsInTemplate'

</entry>
<entry [Wed 2013:07:31 23:00:15 EST] QUIRKSMODE ON FILE UPLOAD FAKE BUTTON>

Route the click event -- WORKS WITH CHROME BUT NOT FIREFOX??

A reader proposed to remove all the complicated CSS stuff, totally hide the file upload field, and route all click events on the fake upload field to the real one. An excellent idea, and much simpler than the one described above.

fakeField.onclick = function () {
	realField.click()
}

The click() method allows you to simulate a click on a form field. Checkboxes get toggled, radios selected, and so on.

NB: Unfortunately Mozilla and Opera haven't added this method to file upload fields. I wonder why, adding it is not really a security risk since the worst that can happen is that the file selection window pops up.



http://www.quirksmode.org/dom/inputfile.html

McGrady's technique is elegant in its simplicity:

<!--

Take a normal <input type="file"> and put it in an element with position: relative.
To this same parent element, add a normal <input> and an image, which have the correct styles. Position these elements absolutely, so that they occupy the same place as the <input type="file">.
Set the z-index of the <input type="file"> to 2 so that it lies on top of the styled input/image.
Finally, set the opacity of the <input type="file"> to 0. The <input type="file"> now becomes effectively invisible, and the styles input/image shines through, but you can still click on the "Browse" button. If the button is positioned on top of the image, the user appears to click on the image and gets the normal file selection window.
(Note that you can't use visibility: hidden, because a truly invisible element is unclickable, too, and we need the <input type="file"> to remain clickable)
Until here the effect can be achieved through pure CSS. However, one feature is still lacking.

When the user has selected a file, the visible, fake input field should show the correct path to this file, as a normal <input type="file"> would. It's simply a matter of copying the new value of the <input type="file"> to the fake input field, but we need JavaScript to do this.
Therefore this technique will not wholly work without JavaScript. For reasons I'll explain later, I decided to port the entire idea to JavaScript. If you're willing to do without the visible file name you can use the pure CSS solution. I'm not sure if this would be a good idea, though.

The HTML/CSS structure

I've decided on the following HTML/CSS approach:

div.fileinputs {
	position: relative;
}

div.fakefile {
	position: absolute;
	top: 0px;
	left: 0px;
	z-index: 1;
}

input.file {
	position: relative;
	text-align: right;
	-moz-opacity:0 ;
	filter:alpha(opacity: 0);
	opacity: 0;
	z-index: 2;
}

<div class="fileinputs">
	<input type="file" class="file" />
	<div class="fakefile">
		<input />
		<img src="search.gif" />
	</div>
</div>
The surrounding <div class="fileinputs"> is positioned relatively so that we can create an absolutely positioned layer inside it: the fake file input.

The <div class="fakefile">, containing the fake input and the button, is positioned absolutely and has a z-index of 1, so that it appears underneath the real file input.

The real file input field also gets position: relative to be able to assign it a z-index. After all, the real field should be on top of the fake field. Then we set the opacity of the real file input field to 0, making it effectively invisible.

Also note the text-align: right: since Mozilla refuses a width declaration for the real file field, we should make sure that the "Browse" button is at the right edge of the <div>. The fake "Search" button is also positioned at the right edge, and it should be underneath the real button.

You'll need some subtle CSS to set all widths, heights, borders and so on, but I didn't include it in this code example. View the source of this page to study my approach in this particular case; your pages will be different, though, so you'll have to change these values.

Why JavaScript?

Nonetheless, I decided to go for a strict JavaScript solution. My first reason is that we need JavaScript anyway to copy the file path to the fake field.

Secondly, a JavaScript solution would avoid meaningless extra HTML: the <div class="fakefile">. It'd keep my code cleaner.

Finally, older browsers can't really handle the CSS, down to the point that the file input becomes inaccessible in Netscape and Explorer 4. As to users of no-CSS browsers, they'd see two input fields, and wouldn't understand what the second one was for.

Below is a pure CSS solution:

   Browse
Some browser screenshots will further explain the accessibility issues.

Problems - Netscape 4

First Netscape 4. As you see, the user sees only the button. This may be because the form is spread across two layers by my use of position: absolute, and Netscape 4 can't handle that.

Worse: the user can't click on the button. Maybe an extensive week long study would reveal a partial solution to this problem, but frankly I can't be bothered. Nonetheless, the field must be accessible to Netscape 4 users.

Screenshot: How it looks in Netscape 4
How it looks in Netscape 4
Problems - Explorer 4

Explorer 4: an odd shadow of the original "Browse" button, and it's not clickable, either. The solution is inaccessible in Explorer 4.

Screenshot: How it looks in Explorer 4
How it looks in Explorer 4
Problems - Netscape 3

Finally, users of Netscape 3, or any other non-CSS browser. The field is still accessible, but users will quite likely be confused by the extra input field.

Screenshot: How it looks in Netscape 3
How it looks in Netscape 3
Solution - JavaScript

The solution to all this nastiness is simple: generate the fake input and button through JavaScript. Now, the worst that can happen is that the script doesn't work, in which case the user only sees the real <input type="file">. Less beautiful, certainly, but still accessible.

So the hard coded HTML is reduced to:

<div class="fileinputs">
	<input type="file" class="file">
</div>
We'll add the rest of the elements through JavaScript.

The script

So I wrote the following script:

var W3CDOM = (document.createElement && document.getElementsByTagName);

function initFileUploads() {
	if (!W3CDOM) return;
	var fakeFileUpload = document.createElement('div');
	fakeFileUpload.className = 'fakefile';
	fakeFileUpload.appendChild(document.createElement('input'));
	var image = document.createElement('img');
	image.src='pix/button_select.gif';
	fakeFileUpload.appendChild(image);
	var x = document.getElementsByTagName('input');
	for (var i=0;i<x.length;i++) {
		if (x[i].type != 'file') continue;
		if (x[i].parentNode.className != 'fileinputs') continue;
		x[i].className = 'file hidden';
		var clone = fakeFileUpload.cloneNode(true);
		x[i].parentNode.appendChild(clone);
		x[i].relatedElement = clone.getElementsByTagName('input')[0];
		x[i].onchange = x[i].onmouseout = function () {
			this.relatedElement.value = this.value;
		}
	}
}
Explanation

If the browser doesn't support the W3C DOM, don't do anything.

var W3CDOM = (document.createElement && document.getElementsByTagName);

function initFileUploads() {
	if (!W3CDOM) return;
Create the <div class="fakefile"> and its content. We'll clone it as often as necessary.

	var fakeFileUpload = document.createElement('div');
	fakeFileUpload.className = 'fakefile';
	fakeFileUpload.appendChild(document.createElement('input'));
	var image = document.createElement('img');
	image.src='pix/button_select.gif';
	fakeFileUpload.appendChild(image);
Then go through all inputs on the page and ignore the ones that aren't <input type="file">.

	var x = document.getElementsByTagName('input');
	for (var i=0;i<x.length;i++) {
		if (x[i].type != 'file') continue;
Yet another check: if the <input type="file"> does not have a parent element with class fileinputs, ignore it.

		if (x[i].parentNode.className != 'fileinputs') continue;
Now we've found an <input type="file"> that needs tweaking. First we add "hidden" to its class name. I add the advanced styles (opacity and positioning) with this new class, since they might conceivably cause problems in old browsers.

		x[i].className = 'file hidden';
Clone the fake field and append it to the <input type="file">'s parent node.

		var clone = fakeFileUpload.cloneNode(true);
		x[i].parentNode.appendChild(clone);
Now we've succesfully styled the <input type="file">. We're not yet ready, though, we have to make sure the user sees the path to the file he wants to upload.

First we create a new property for the <input type="file"> that points to the fake input field:

		x[i].relatedElement = clone.getElementsByTagName('input')[0];
We use this to easily access the fake field as soon as the user changes the real <input type="file"> (ie. selects a file), so that we can copy its value to the fake input field.

A problem here, though: which event do we use? Most natural would seem the change event of the file field: if its value changes, the fake input field's value should also change.

Unfortunately Mozilla 1.6 doesn't support the change event on file fields (Firefox 0.9.3 does, by the way). For Mozilla's sake I also use the mouseout event, which conveniently fires only after the user has selected a file. (This also works in Explorer, but not in Safari)

		x[i].onchange = x[i].onmouseout = function () {
			this.relatedElement.value = this.value;
		}
Problems and extensions

One problem remains: the user can't choose not to upload a file after all.

Suppose the user selects a file, then on second thought decides not to upload it. In a normal <input type="file"> he can simply remove the path, and the file won't be uploaded. In our example, though, this is very difficult. Try it, it can be done, but it's totally counter-intuitive.

 
So what we'd like to do is allow the user to select and modify the content of the fake file upload and copy all changes to the real file upload.

Allowing selection is somewhat possible. When the user selects any part of the real file upload, we select the entire value of the fake file upload.

x[i].onselect = function () {
	this.relatedElement.select();
}
Unfortunately, JavaScript security does not allow us to change the value of an <input type="file">, so we can't let the user manually change the fake input. Therefore I decided to entirely leave out the onselect event handler.

A possible solution would be to add a "Clear" button to the fake input, which triggers a script that entirely trashes the <input type="file"> and creates a new one. It's a bit cumbersome, but we might be able to remove the chosen file entirely. I didn't write that part of the script, though, so I'm not sure if it would actually work.

-->

Route the click event

A reader proposed to remove all the complicated CSS stuff, totally hide the file upload field, and route all click events on the fake upload field to the real one. An excellent idea, and much simpler than the one described above.

fakeField.onclick = function () {
	realField.click()
}
The click() method allows you to simulate a click on a form field. Checkboxes get toggled, radios selected, and so on. Unfortunately Mozilla and Opera haven't added this method to file upload fields. I wonder why, adding it is not really a security risk since the worst that can happen is that the file selection window pops up.

So unfortunately we cannot use this simple solution.
    
</entry>
<entry [Wed 2013:07:31 22:53:31 EST] PROGRAMATICALLY CREATING EVENTS - FILE UPLOAD>


Programmatically opening a file dialog
http://ericbidelman.tumblr.com/post/14636214755/making-file-inputs-a-pleasure-to-look-at


No browser that I know of lets you simulate a manual click on a file input without user intervention. The reason is security. Browsers require that a user make an explicit manual click (user-initiated click) somewhere on the page. However, once that happens, it’s straightforward to hijack the click and route it to a file input.

My second technique (see this tweet) for styling a file input works across the modern browsers. It requires a bit of extra markup but allows us to “send" the user’s click to a file input.

<!--

The trick is to hide the <input type="file"> by setting it to visibility: hidden; and subbing in an extra <button> to hand the user’s actual click:

<style>
#fileElem {
  /* Note: display:none on the input won't trigger the click event in WebKit.
    Setting visibility: hidden and height/width:0 works great. */
  visibility: hidden;
  width: 0;
  height: 0;
}
#fileSelect {
  /* style the button any way you want */
}
</style>

<input type="file" id="fileElem" multiple>
<button id="fileSelect">Select some files</button>

<script>
document.querySelector('#fileSelect').addEventListener('click', function(e) {
  // Use the native click() of the file input.
  document.querySelector('#fileElem').click();
}, false);
</script>
Reference: i'm just a reference

You’ll be even cooler if you use custom events:

function click(el) {
  var evt = document.createEvent('Event');
  evt.initEvent('click', true, true);
  el.dispatchEvent(evt);
}

document.querySelector('#fileSelect').onclick = function(e) {
  // Simulate the click on fileInput with a custom event.
  click(document.querySelector('#fileElem'));
};
Caveat
Most browsers require the fileInput.click() to be called within 1000ms of the user-initiated click. For example, waiting 1.5s will fail because it’s too long after the user initiates a click:

document.querySelector('#fileSelect').onclick = function(e) {
  setTimeout(function() {
    document.querySelector('#fileElem').click(); // Will fail.
  }, 1500);
};
The cap gives you the chance to call window.open, adjust UI, whatever before the file dialog opens.

-->

    
</entry>
<entry [Sat 2013:06:01 21:20:12 EST] INSTALLED DOJO 1.9.0 - RELEASE NOTES>

COLOURED TEXT
http://livedocs.dojotoolkit.org/releasenotes/1.9

PLAIN TEXT
http://dojotoolkit.org/reference-guide/1.9/releasenotes/1.9.html

1. USE dojo/domReady NOW INSTEAD OF dojo/ready (1.8.0)

2. MORE dojox/mobile

3. dojox/charting

    -   ALLOWS SVG FILTERS

    -   dojox/mobile/themes/utils now contains scripts and documentation for building mobile themes. The number of required .less files for a particular theme has been drastically reduced.

4. dojox/form/Uploader¶

dojox/form/Uploader is now AMD compatible and works declaratively in HTML markup
The AMD update necessitated discarding the previously implemented plugin system. All dependencies are loaded by default. Using the deprecated plugin style should throw warnings in the console. The force parameter is still used to choose between HTML5, Flash or IFrame

5. doh

Support added for returning a dojo/promise/Promise or dojo/Deferred from a test fixture. Before, you could only return a doh.Deferred or a dojo/_base/Deferred.

6. GENERAL

Dojo 1.9 is primarily a stability and bug fix release, with over 700 issues resolved. Read the Dojo 1.9 release notes for the complete list of what’s new and improved in 1.9. API features and enhancements primarily occurred within the following areas:

Mobile and touch events
Dijit support for mobile
Dijit enhancements and additions
BlackBerry 10
IE 10/Windows Phone 8, Windows Surface/RT
iOS and Android theme refinements
dojox/charting and dojox/gfx
dojox/app
dojox/calendar
Source maps


    
</entry>
<entry [Wed 2013:05:15 11:10:29 EST] FIXED lists FAIL TO DISPLAY>

PROBLEM

OCCURRED DURING REFACTORING Lists.js FROM Infusion.js (MOVING LISTS INTO THEIR OWN MODULE FOR EASIER TESTING, MAINTENANCE AND EXTENSIBILITY).

COPIED Infusion.js TO Lists.js AND infusion.html TO lists.html (WITH OR WITHOUT SURROUNDING NON-LIST HTML).

WHEN TRIED TO INSTANTIATE Lists.js IN TEST PAGE t/plugins/infusion/lists/test.html, THE LISTS:

    A) WERE NOT POPULATED (NO LIST ITEMS IN HTML)
    
    B) WERE NOT DISPLAYED 

        

DIAGNOSIS


# A) WERE NOT POPULATED (NO LIST ITEMS IN HTML)

INLINE WIDTH/HEIGHT IS NECESSARY FOR NORMAL CONSTRUCTION OF LIST WIDGETS


# WERE NOT DISPLAYED

SOME MALFUNCTION CAUSES THE INCORRECT CLASS TO BE APPLIED TO THE TAB PANEL
    
        - CLASS .dijitHidden (I.E., display: none !important) IN tabpanel
        
            LEFT PANE
            TabContainer
                TabListContainer
                    TabPaneWrapper
                        tabContainerTopChildWrapper (role: tabpanel)
                        CLASS: dijitTabContainerTopChildWrapper dijitHidden


SOLUTION

# A) WERE NOT POPULATED (NO LIST ITEMS IN HTML)

ADDED THE FOLLOWING TO THE TOP TABCONTAINER IN lists.html:
    
				region="left"
				style="width: 620px; height: 600px;"


# WERE NOT DISPLAYED

ADDED THE FOLLOWING CSS TO infusion.css (THEN COPIED TO lists.css)

/* SHOW LISTS IN LEFT PANE */
.infusion .leftContainer {
	height: 600px !important;
	width: 600px !important;
}
.infusion .dijitHidden {
	display: inline !important;
}

   
</entry>
<entry [Sat 2013:05:04 23:39:18 EST] TEST DRIVEN JAVASCRIPT DEVELOPMENT>

TEST DRIVEN JAVASCRIPT DEVELOPMENT

http://www.adequatelygood.com/2010/7/Writing-Testable-JavaScript

http://blog.jcoglan.com/2011/07/14/refactoring-towards-testable-javascript-part-1/

SEARCH 'JAVASCRIPT TESTING'
http://screen.yahoo.com

SEARCH 'GTAC 2011'
www.youtube.com
    
    
</entry>
<entry [Sat 2013:05:04 23:38:17 EST] CONTINUOUS INTEGRATION (CI) FOR JAVASCRIPT TESTS>

Jenkins

Cruise Control

Test Swarm
    
</entry>
<entry [Sat 2013:05:04 23:37:17 EST] JAVASCRIPT TEST CODE COVERAGE>

http://www.slideshare.net/mankz/java-script-unit-testing

JsCoverage
Seems abandoned

ScriptCover
	Google Chrome Plugin

JsTestDriver
Add-in module for coverage

JesCov 
	Rhino, Jasmine

    
</entry>
<entry [Sat 2013:05:04 23:35:28 EST] HEADLESS BROWSER TESTING>

http://www.slideshare.net/mankz/java-script-unit-testing

SLIDE 53

PhantomJS (headless WebKit + JavaScript API) -- SVG RENDERING!!!

env.js (Runs on Rhino)

JsDom (CommonJS implementation of the DOM)

    
</entry>
<entry [Thu 2013:05:02 11:43:53 EST] FIXED CHROME 'Content-type'-DEPENDENT APPEARANCE OF PARAMETERS IN UPLOAD POST DATA>

PROBLEM

POST DATA FOR ZIP FILES AND HTML FILES CONTAINS THE PARAMETERS AFTER THE FILE CONTENTS:


    ------WebKitFormBoundaryuLgTN9nAY5BJoBE7
    Content-Disposition: form-data; name="uploadedfiles[]"; filename="simple-graph.zip"
    Content-Type: application/zip
    
    <!--
    FILE CONTENTS
    -->
    
    ------WebKitFormBoundaryuLgTN9nAY5BJoBE7
    Content-Disposition: form-data; name="index"
    
    0
    ------WebKitFormBoundaryuLgTN9nAY5BJoBE7
    Content-Disposition: form-data; name="name"
    
    simple-graph.zip
    ------WebKitFormBoundaryuLgTN9nAY5BJoBE7
    Content-Disposition: form-data; name="size"
    
    1013
    ------WebKitFormBoundaryuLgTN9nAY5BJoBE7
    Content-Disposition: form-data; name="type"
    
    application/zip
    ------WebKitFormBoundaryuLgTN9nAY5BJoBE7
    Content-Disposition: form-data; name="uploadType"
    
    html5
    ------WebKitFormBoundaryuLgTN9nAY5BJoBE7--



... BUT POST DATA FOR PDF FILES DOES NOT HAVE THE PARAMETERS:

    ------WebKitFormBoundary2FmQ7xRFyeMJyCzo
    Content-Disposition: form-data; name="uploadedfiles[]"; filename="Oreilly.Getting.Started.with_.D3.Jun_.2012.pdf"
    Content-Type: application/pdf
    
    %PDF-1.7
    907 0 obj
    << /Linearized 1/L 6484445/O 910/E 2688470/N 72/T 6483271/H [ 744 1178]>>
    endobj
             
    ... REST OF FILE CONTENTS
    
    -->


DIAGNOSIS

GOOD
text/plain
text/html
application/zip
application/x-trash

BAD
application/pdf
application/epub+zip
application/javascript


    
</entry>
<entry [Mon 2013:04:22 22:17:06 EST] FIXED BLACK BUBBLES ON d3 CHART>
    
PROBLEM

BLACK BUBBLES APPEAR OVER THE POINTS IN A d3 LINE GRAPH


SOLUTION

INCLUDE A REFERENCE TO THE CSS FILE
./src/nv.d3.css 

E.G.:

<!--

<link href="http://localhost/infusiondev/plugins/graph/nvd3/src/nv.d3.css" rel="stylesheet" type="text/css">

-->

</entry>
<entry [Mon 2013:04:22 22:16:31 EST] PRINT OBJECT INTO POPUP>


w = window.open('text.txt');
w.document.write(JSON.stringify(samples));


    
</entry>
<entry [Fri 2013:04:12 11:49:10 EST] PROGRAMMATICALLY EXPAND/COLLAPSE EXPANDOPANE>


var leftPane = dijit.byId("leftPane");
leftPane.iconNode.click();  // OPENS AND CLOSES

    
</entry>
<entry [Tue 2013:04:09 19:20:40 EST] FIXED ERROR: 'has no method'>

PROBLEM


LOADING t/html/plugins/infusion/detailed/test.html

AND GET THIS ERROR:

TypeError {info: "Object function (){↵			var a = arguments, args = a…(this, args);↵			}↵		} has no method 'getSamples'"}

OR TESTING MODULE WHICH HAS A CALL TO 'Agua.cloneData'

    Error: Object #< Object > has no method 'cloneData'


    
SOLUTION

SET window.Agua GLOBAL VARIABLE JUST INSIDE FUNCTION:

    function (declare, doh, util, Agua, Data, DetailedProject, ready) {
    
    window.Agua = Agua;

    
OTHER ALTERNATIVES:

ALT 1: CHECK TO MAKE SURE THE REQUIRE ORDER AND FUNCTION ARGUMENTS MATCH


ALT 2: MAKE SURE YOU HAVE THE CASE RIGHT ON YOUR OBJECT

I.E., detailedProject NOT DetailedProject


ALT 3: CHECK THROUGH TO SEE IF THERE ARE ANY FAILURES IN LOADING THE MODULE


ALT 4: USE dojo/ready INSTEAD OF dojo/domReady (THE LATTER DOES NOT WAIT FOR REQUIRES TO FINISH)


ALT 5: SHUNT CALL TO Agua.cloneData() TO NEW METHOD AND OVERRIDE METHOD IN TEST

    dataObject.getTable = function (table) {
    	return Agua.cloneData(table);
    };


</entry>
<entry [Tue 2013:04:09 14:18:10 EST] JAVASCRIPT INITIATE PRINTOUT>


w = window.open('text.txt');
w.print();

    
</entry>
<entry [Tue 2013:04:09 14:18:06 EST] REINSTALLED AUTOSAVE ON SSD services-dev>


1. INSTALLED devtools-autoSave


2. CONFIGURED AutoSave

Match
http://localhost/
Save To
/var/www/html/
Servers
127.0.0.1:9104


3. INSTALLED NODE nodejs.org


4. STARTED AutoSave

   
</entry>
<entry [Thu 2013:04:04 19:11:47 EST] PROBLEM ATTACHING Infusion.js mainTab TO attachWidget AFTER USING _WidgetBase AND _TemplatedMixin>

PROBLEM

CHANGED IN Infusion.js:

	"dijit/_Widget",
	"dijit/_Templated",
FOR
	"dijit/_WidgetBase",
	"dijit/_TemplatedMixin",

THEN WOULD FAIL TO ATTACH:

this.attachWidget.addChild(this.mainTab)


CHAIN:

Infusion.js --> Agua.tabs (tabContainer)->addChild()
    dijit._Container->addChild()
        _dijit.layout._LayoutWidget->addChild()
            dojo.dom-construct.place(node, refNode, position)
                THE node ARGUMENT IS THE WIDGET'S containerNode!

                
                
SOLUTION

DON'T USE FOR NOW:

	"dijit/_WidgetBase",
	"dijit/_TemplatedMixin",


</entry>
<entry [Wed 2013:04:03 13:50:08 EST] DOJO 1.8 EXPANDOPANE>

http://dojotoolkit.org/reference-guide/1.8/dojox/layout/ExpandoPane.html#id3

DECLARATIVE EXAMPLE

<!--

dojo.require("dijit.layout.ContentPane");
dojo.require("dijit.layout.BorderContainer");
dojo.require("dojox.layout.ExpandoPane");
<div data-dojo-type="dijit.layout.BorderContainer" data-dojo-props="design:'sidebar', gutters:true, liveSplitters:true" id="borderContainer">
  <div data-dojo-type="dojox.layout.ExpandoPane" title="Left Expando" data-dojo-props="title: 'Left Expando', maxWidth:225, splitter:true, region:'leading'" style="width: 225px;">
    Hi. I'm the Expando Pane
  </div>
  <div data-dojo-type="dijit.layout.ContentPane" data-dojo-props="splitter:true, region:'center'">Hi, I'm center</div>
</div>


@import url("{{ baseUrl }}dojox/layout/resources/ExpandoPane.css");

html, body {
  width: 100%;
  height: 100%;
  margin: 0;
}

#borderContainer {
  width: 100%;
  height: 100%;
}

-->
    
</entry>
<entry [Mon 2013:04:01 23:33:33 EST] dGrid CONTEXT MENU>

Yep.  Building on the previous example:

grid.on(".dgrid-row:contextmenu", function(evt){
    evt.preventDefault(); // prevent default browser context menu
    var item = grid.row(evt).data;
    // item is the store item
});

The `row` method on List/Grid instances is pretty powerful; it can
resolve a row from a row element or child thereof, an event taking place
on such an element, or a store item or ID of one.  It returns an object
with the row's `id`, its `element`, and `data` which is the store item
it represents.

Admittedly this isn't exposed so well in the dgrid README; there is a
migration guide in review phases that goes into this a bit however,
which should land pretty soon.

--Ken

On 3/6/2012 8:29 PM, etoreo wrote:
> Wow, this is great and just what I was looking for!
> 
> Is there a way to easily get the store object associated with the row the
> context menu pops up on from the passed in information to that callback?
> 
> --

    
</entry>
<entry [Mon 2013:04:01 17:27:48 EST] API VIEWER SYNTAX>

http://dojotoolkit.org/reference-guide/1.8/developer/markup.html#developer-markup

When parsing a comment block, we give the parser a list of “keys” to look for. These include summary, description, and returns, but many comment blocks will also have all of the variables and parameters in the object or function added to this list of keys as well. Formatting: Each keyword should be on a line by itself, with a space before and a colon after. For variable names there’s a type after the colon. The content associated with the keyword is indented by two tabs. For example:

// summary:
//            This is the summary for the method.
//            It's indented by two tabs.
// foo: Integer
//            First argument to this function
// bar: String
//            Second argument to this function
// returns:
//            A calculated value.


The parser will keep reading content as part of the specified key until it sees a completely blank line, or another keyword. Although our formatting convention requires that keywords exist on a separate line, if any of these keywords occur at the beginning of a line, the parser will start reading the text following it and save it as part of that key’s content. This means that you should be careful about what word you use to start a line. For example, “summary” shouldn’t start a line unless the content that follows is the summary.



    
</entry>
<entry [Sun 2013:03:31 18:50:26 EST] INSTALLED API VIEWER>

1. MUST USE DOJO 1.8 OR ABOVE

2. DOWNLOAD JS PARSER

git clone --recursive https://github.com/wkeese/js-doc-parse.git
cd js-doc-parse
git checkout all-my-changes


Edit environmentConfig object in config.js.

This tells the parser where your project is located. basePath should indicate the path to your project relative to config.js, and package paths should be relative to the basePath.

<!--
environmentConfig: {
    basePath: '../some/path/',
    packages: {
        myApp: 'myApp'
    }
}
-->

Note: other configuration options exist in config.js.

Parse like there’s no tomorrow.
The output will consist of the details.xml and tree.json files within the js-doc-parse folder.


$ ./parse.sh config=config.js


That’s it! The documentation for your custom project has officially been generated. But how do we see it?

Viewing the docs

Now that the documentation has been successfully generated, all that’s left is to grab the API viewer in order to view the docs locally.

Clone api-viewer.

<!--
$ cd <web_server_root>
$ git clone git@github.com:wkeese/api-viewer.git api
</web_server_root>
-->

Note: If you want to put the API viewer in a location other than your server root, config.php and .htaccess need to be updated to point to the other location.

Move generated files.
We need to put the generated details.xml and tree.json in a location so the API viewer can find them. The viewer expects an api_data/ folder as its sibling with subfolders corresponding to project version numbers.

<!--
$ cd <web_server_root>
$ mkdir api_data/
$ mkdir api_data/1.0
$ mv js-doc-parse/details.xml api_data/1.0/
$ mv js-doc-parse/tree.json api_data/1.0/
$ chmod -R +a 'user:_www allow delete,list,search,add_file,add_subdirectory,read,write' api_data
</web_server_root>
-->

Finally, start your local Apache instance and point your browser to http://localhost/api/.

Theming the docs

Many users have asked how to modify the default theming of the API viewer itself. The styles and static content are broken down into a few key files that can easily be customized to fit your style needs, each of which will be included as the pages are generated.

theme.css – Includes any CSS styling that needs to be included in the document
index.php – Populates the Welcome tab of the API Viewer
header.php – Inserted before the main content area
footer.php – Inserted after the main content area
Conclusion

Rather than simply generating an endless page of formatted API documentation, Dojo’s documentation tools provide a clean, simple method to produce an enterprise-quality API viewer and documentation for any JavaScript project. While more advanced configuration options for generation and viewing are available, the above guide should get any project up and running with their very own API viewer.

Api Docs Dojo Featured

    
</entry>
<entry [Fri 2013:03:29 19:40:48 EST] TESTING WITH DOJO 1.8.3>

http://localhost/infusiondev/dojo/util/doh/runner.html?testModule=t/plugins/infusion/detailed/test&registerModulePath=t,../../t

TEST WORKING:

require([
	"doh/runner"
	//,
	//"dojo/dom",
	//"dojo/_base/lang",
	//"dojo/_base/config",
	//"dojo/request",
	//"dojo/json",
	//"dojo/_base/declare"
	//"demo/tests/util",
//	"demo/authorBar"
//], function (doh, dom, lang, config, request, JSON, declare) {
], function (doh) {

	// register the data tests
	doh.register("authorBar data", [

		{
			name: "thingerTest",
			setUp: function(){
				console.log("setUp");
			},
			runTest : function(){
				  doh.assertEqual(true,true);
				  doh.assertFalse(false);
			},
			tearDown: function () {
			}
		}
	]);

	// Execute D.O.H. in this remote file.
	doh.run();
});



    
</entry>
<entry [Thu 2013:03:28 21:50:11 EST] DGRID USE get TO GENERATE ITEM FIELDS>

http://www.ibm.com/developerworks/web/library/wa-aj-dojogrid/

Listing 12. JavaScript codes to use get interface
function getLeftDays(rowIndex, item){
                if (item != null) {
                    return item.annualLeaveTotal - item.annualLeaveTaken;
                }
            }


var layout = [{
                name: 'ID',
                field: 'id',
                width: '10px'
            }, {
                name: 'Name',
                field: 'name',
                width: '50px'
            }, {
                name: 'Is manager',
                field: 'manager',
                formatter: managerFormatter,
                width: '100px'
            }, {
                name: 'Sex',
                field: 'sex',
                width: '50px'
            }, {
                name: 'Age',
                field: 'age',
                width: '50px'
            }, {
                name: 'On Board date',
                field: 'date',
                width: '100px',
                formatter: dateFormatter
            }, {
                name: 'Total annual leave days',
                field: 'annualLeaveTotal',
                width: '100px'
            }, {
                name: 'Annual leave days already taken',
                field: 'annualLeaveTaken',
                width: '100px'
            }, {
                name: 'Annual leave days left',
                get: getLeftDays,
                width: '100px'
            }];
            
    
</entry>
<entry [Thu 2013:03:28 14:12:16 EST] DGRID WITH TREE>

http://localhost/infusiondev/dojo/dgrid/test/Grid_mouseevents.html

    
</entry>
<entry [Wed 2013:03:27 21:42:03 EST] HIDE COLUMN IN dgrid WITH grid.styleColumn>

USAGE:

    grid.styleColumn(columnId, css):

EXAMPLE:

var grid = new Grid({
    store: store,
    columns: [
        { id: "artist", label: "Artist", field: "Artist"},
        { id: "name", label: "Song", field: "Name"},
        { id: "gerne", label: "Genre", field: "Genre"}
    ]
}, "grid-placeholder");

// to hide column with id="name"
grid.styleColumn("name", "display: none;");

// to show it
grid.styleColumn("name", "display: table-cell;");


    
</entry>
<entry [Wed 2013:03:27 20:14:52 EST] EXAMPLE OF THE SAME APP WRITTEN WITH DIFFERENT FRAMEWORKS>

http://todomvc.com/

    
</entry>
<entry [Wed 2013:03:27 20:14:00 EST] GITHUB ACTIVITY FOR JAVASCRIPT FRAMEWORKS>

http://wargoats.com/js-mvc/

    
</entry>
<entry [Wed 2013:03:27 09:52:57 EST] ICON FONTS>

http://css-tricks.com/search-results/?q=icon+font


http://css-tricks.com/examples/IconFont/


</entry>
<entry [Wed 2013:03:27 09:50:23 EST] CSS LESS>

DOWNLOAD LESS
http://lesscss.org/

INTRO TO LESS
http://www.developerdrive.com/2012/05/learning-less-variables/




    
</entry>
<entry [Wed 2013:03:27 09:26:11 EST] DGRID THEMES>

THEME TESTER - COMBOBOX TO RELOAD SELECTED THEME

http://download.dojotoolkit.org/release-1.5.0/dojo-release-1.5.0/dijit/themes/themeTester.html?theme=nihilo
 
claro
tundra
soria
nihilo
squid
sage
slate

    
</entry>
<entry [Tue 2013:03:26 10:12:31 EST] STYLING dGrid>

Styling dgrid
dgrid components are designed to be highly CSS-driven for optimal performance and organization, so visual styling should be controlled through CSS.

Styling Grid Columns


The Grid module creates classes based on the field names and column IDs of the columns defined, following the conventions field-< field-name> and dgrid-column-< column-id>. (If a className is specified in a column definition, it is used in place of field-< field-name>.)


For example, you could define a grid and CSS for it like so:

<!--
<style>
    .field-age {
        width: 80px;
    }
    .field-first {
        font-weight: bold;
    }
</style>
<script>
    require(["dgrid/Grid"], function(Grid){
        var grid = new Grid({
            columns: {
                age: "Age",
                first: "First Name",
                // ...
            }
        }, "grid");
        grid.renderArray(someData);
    });
</script>

-->
Skinning dgrid Components
dgrid automatically loads the necessary structural CSS to work properly using xstyle's css module. However, to make the component far more visually attractive, it is common to also apply one of the the included skins. There are various CSS files under the css/skins directory which can be used to significantly alter the look and feel of dgrid components. The skin.html test page provides a quick demonstration of all included skins.

Many of the classes commonly involved in customizing layout and skin can be discovered by examining the CSS of existing skins, or by inspecting elements in your browser's developer tools.

To help get started, the following is a list of classes commonly employed in the structuring of dgrid components:

dgrid: Applied to each dgrid list or grid at the top-level element
dgrid-header: Applied to the element which contains the header area
dgrid-scroller: Applied to the element responsible for scrolling the data content
dgrid-content: Applied to the element inside of the scroller area, which holds all the data contents
dgrid-row: Applied to each row element
dgrid-row-even: Applied to each even row element
dgrid-row-odd: Applied to each odd row element Applying a different color to alternating rows can help visually distinguish individual items.
dgrid-selected: Applied to selected rows or cells
dgrid-cell: Applied to each cell element
dgrid-cell-padding: Applied to each cell element, or to an inner element within the cell in older versions of non-quirks mode IE to properly apply padding to keep the padding within the box measurements (box-sizing is preferred by the grid).
dgrid-focus: Applied to the element (cell or row) with the focus (for keyboard based navigation)
dgrid-expando-icon: Applied to the expando icon on tree nodes
dgrid-header-scroll: Applied to the node in the top right corner of a Grid, above the vertical scrollbar
The following generic class names are also available for generic skinning (following the jQuery ThemeRoller convention):

ui-widget-content: Applied to each dgrid list or grid at the top element
ui-widget-header: Applied to the element that contains the header rendering
ui-state-default: Applied to each row element
ui-state-active: Applied to selected rows or cells
ui-state-highlight: Applied to a row for a short time when the contents are changed (or it is newly created)

Last edited by brandonpayton, 5 days ago

    
</entry>
<entry [Tue 2013:03:26 02:28:01 EST] PATTERN OR VARIABLE MATCHING REGEX>

As Eric Wendelin mentioned, you can do something like this:

str1 = "pattern"
var re = new RegExp(str1, "g");
"pattern matching .".replace(re, "regex");
This yields "regex matching .". However, it will fail if str1 is ".". You'd expect the result to be "pattern matching regex", replacing the period with "regex", but it'll turn out to be...

regexregexregexregexregexregexregexregexregexregexregexregexregexregexregexregexregex

This is because, although "." is a String, in the RegExp constructor it's still interpreted as a regular expression, meaning any non-line-break character, meaning every character in the string. For this purpose, the following function may be useful:

 RegExp.quote = function(str) {
     return str.replace(/([.?*+^$[\]\\(){}|-])/g, "\\$1");
 };
Then you can do:

str1 = "."
var re = new RegExp(RegExp.quote(str1), "g");
"pattern matching .".replace(re, "regex");
yielding "pattern matching regex".


</entry>
<entry [Sun 2013:03:24 20:44:39 EST] EXPANDO PANE WITH NESTED GRIDS>

<!--

            <div
                data-dojo-attach-point="information"
                data-dojo-type="dgrid/OnDemandGrid"
            >
            </div>
            
        </div>

        <div
            data-dojo-attach-point="informationNode"
        ></div>

			data-dojo-type="dijit.TitlePane"
			data-dojo-attach-point="informationTitlePane"

            id="informationNode"
			data-dojo-attach-point="informationNode"

		<div
			data-dojo-type="dijit.TitlePane"
            data-dojo-attach-point="informationTitlePane"
            class="information"
            title="Project Information"
        >
            <div
                data-dojo-attach-point="information"
                data-dojo-type="dgrid/OnDemandGrid"
            >
            </div>
            
        </div>

        
        
        
        
    <table>
        <tr>
            <td class="header">Project Name</td>
            <td class="header">Description</td>
            <td class="header">Build Version</td>
            <td class="header">Build Location</td>
            <td class="header">dbSNP Version</td>
            <td class="header">Include NPF</td>
            <td class="header">Project Policy</td>
        </tr>
        <tr>
            <td>${projectname}</td>
            <td>${projectdescription}</td>
            <td>${buildversion}</td>
            <td>${buildlocation}</td>
            <td>${dbsnpversion}</td>
            <td>${includenpf}</td>
            <td>${projectpolicy}</td>
        </tr>
    </table>



			<div id="bc" style="width:100%; height:100%; padding: 5px;" dojoType="dijit.layout.BorderContainer">
			<div id="header" dojoType="dijit.layout.ContentPane" region="top" splitter="true">Dojo Expando Pane Test
				<table>
					<tr>
						<td align="center">
							<div class="projects-header">
								Projects
							</div>
						</td>
						<td align="center">
							<div class="samples-header">
								Samples
							</div>
						</td>
						<td align="center">
							<div class="lanes-header">
								Lanes
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="list-container">
								<div id="projects"></div>
								<div id="samples"></div>
								<div id="lanes"></div>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div dojoType="dojox.layout.ExpandoPane" 
				splitter="true" 
				duration="125" 
				region="left" 
				title="Left Section" 
				previewOnDblClick="true"
				id="leftPane" 
				maxWidth="275" 
				style="width: 275px;">

				<div id="grid">
				</div>
				
			</div>
        

-->    

<!--

EXPANDO TEST

<!--			<div id="bc" style="width:100%; height:100%; padding: 5px;" dojoType="dijit.layout.BorderContainer">
			<div id="header" dojoType="dijit.layout.ContentPane" region="top" splitter="true">Dojo Expando Pane Test</div>
			<div dojoType="dojox.layout.ExpandoPane" 
				splitter="true" 
				duration="125" 
				region="left" 
				title="Left Section" 
				previewOnDblClick="true"
				id="leftPane" 
				maxWidth="275" 
				style="width: 275px;">
				<div dojoType="dijit.layout.TabContainer" attachParent="true" tabPosition="bottom" tabStrip="true">
					<div dojoType="dijit.layout.ContentPane" title="Search">
						<div class="searchBar">
							<p>
								<label for="searchBox" style="float: left;">Search:</label>
								<input id="searchBox" name="searchBox" style="float: left;">
								<span id="runSearchIcon" style="border: none; floast: left; padding: 3px;">
									<img src="../../presentation/resources/icons/next.png" alt="run search" style="height:12px; width:12px;">
								</span>
							</p>
						</div>
						
					</div>
					<div dojoType="dijit.layout.AccordionContainer" title="Panes" style="width:275px;" attachParent="true">
						<div dojoType="dijit.layout.ContentPane" title="Dojo">
							<ul id="dojoList"></ul>
						</div>
						<div dojoType="dijit.layout.ContentPane" title="Dijit">
							<ul id="dijitList"></ul>
						</div>
						<div dojoType="dijit.layout.ContentPane" title="DojoX">
							<ul id="dojoxList"></ul>
						</div>
					</div>
					<div dojoType="dijit.layout.ContentPane" title="Tree View">
						TREE VIEW
					</div>
				</div>
			</div>
			<div dojoType="dijit.layout.TabContainer" region="center" id="centerPane" tabStrip="true">
				<div dojoType="dijit.layout.ContentPane" title="tab 1">a</div>
				<div dojoType="dijit.layout.ContentPane" title="tab 2">
					<button dojoType="dijit.form.Button">Preview left
						<script type="dojo/method" data-dojo-event="onClick">
							dijit.byId("leftPane").preview();
						</script>
				</div>
				<div dojoType="dijit.layout.ContentPane" title="Results" id="resultsPane">
					<div class="wrap">
						<div class="searchStuff">
							<ul id="searchResults"></ul>
						</div>
					</div>
				</div>
			</div>
			<div dojoType="dojox.layout.ExpandoPane" 
				splitter="true" 
				title="Right Section" 
				region="right" 
				id="rightPane" 
				maxWidth="275" 
				style="width:275px" 
				easeIn="dojo.fx.easing.backOut" 
				easeOut="dojo.fx.easing.backInOut">

				<div dojoType="dijit.layout.AccordionContainer" id="rightAccordion" style="width:275px;" attachParent="true">
					<div dojoType="dijit.layout.ContentPane" title="Easing Selection">
						<div class="wrap">
							<p id="easingSelectLabel">This select modifies the left Expando's easing function. An Expando can have an easeIn and an easeOut parameter. This sets both.</p> 
							<select id="easingSelect" name="easingSelect" aria-labelledby="easingSelectLabel">
								<option value="dojo._DefaultEasing">Default</option>
							</select>
							<p><label for="durationBox">Duration: </label> <input id="durationBox" name="durationBox" value="1000" /></p>
							<p>Some easing functions break when used with width: (negative width? but how?). <em>Be warned.</em></p>
						</div>
					</div>
					<div dojoType="dijit.layout.ContentPane" title="Children">
						<div class="wrap">
							<p>This is a BorderContainer (the window). Each of the panes is set to one of
							"left", "right", or "center". The left and right panes are ExpandoPanes (they collapse).
							</p>
							<p>What does a FloatingPane look like here?</p>
							<p>
							<button dojoType="dijit.form.Button">
								Make Floater
								<script type="dojo/connect" data-dojo-event="onClick">
									var div = dojo.doc.createElement('div');
									dojo.body().appendChild(div);
									var fp = new dojox.layout.FloatingPane({
										title:"A Winder.",
										closeable:true, dockable:false,
										href:"_floating.html"
									},div);
									dojo.style(fp.domNode,{
										width:"350px",
										height:"255px",
										top:"75px", left:"75px",
										position:"absolute",
										zIndex:"980"
									});
									fp.startup();
									fp.show();
								</script>
							</button>
							</p>
							<p>the end</p>
						</div>
					</div>
					<div dojoType="dijit.layout.ContentPane" title="Acc 3">c</div>
				</div>
			</div>
			<div dojoType="dojox.layout.ExpandoPane" 
				splitter="true" 
				duration="125" 
				region="bottom" 
				title="Bottom Section" 
				id="bottomPane" 
				maxWidth="275" 
				style="height: 100px;">
				<div dojoType="dijit.layout.TabContainer" attachParent="true" tabPosition="bottom" tabStrip="true">
					<div dojoType="dijit.layout.ContentPane" title="Search">
						<button dojoType="dijit.form.Button">
							Change Title
							<script type="dojo/method" data-dojo-event="onClick">
								dijit.byId("bottomPane").set("title", new Date())
							</script>
						</button>
					</div>
					<div dojoType="dijit.layout.AccordionContainer" title="Panes" style="width:275px;" attachParent="true">
						
					</div>
					<div dojoType="dijit.layout.ContentPane" title="Tree View">
						
					</div>
				</div>
			</div>
		</div>

-->		






</entry>
<entry [Fri 2013:03:22 02:12:05 EST] HOW TO USE DOJO 1.8.3>

NOTE:

- ORDER OF ARGUMENTS MUST REFLECT ORDER OF DEPENDENCIES

- FEED IN DATA THROUGH CONSTRUCTOR



<!--

define([
	"dijit/_WidgetBase",
	"dijit/_TemplatedMixin",
	"dojo/_base/declare",
	"dojo/dom-attr"
	],
	function(_Widget, _Templated, declare, domAttr){
		return declare("myWidgets.HelloWorld", [_Widget, _Templated], {
		templateString: '<div data-dojo-attach-point="_box"></div>',
		postCreate: function(){
		domAttr.set(this._box, "innerHTML", "Hello, World!");
	}
	});
});

require(["dojo", "dojo/dom", "my/HelloWorld"],
 function(dojo, dom, HelloWorld){
 	var helloWorld = new HelloWorld();
 	helloWorld.placeAt(dom.byId("test"));
 	helloWorld.startup();
 }
);

-->

</entry>
<entry [Fri 2013:03:22 01:46:45 EST] USE 'locale' IN dojoConfig FOR LOCALISATION>

ORIGIN OF THE TERM i18n
http://www.i18nguy.com/origini18n.html


Locale and Internationalization
http://dojotoolkit.org/documentation/tutorials/1.8/dojo_config/

Dojo's i18n system is documented in its own right, and worthy of its own tutorial, but we'll touch on it here just to show dojoConfig at work again.

You can configure the locale to use for any widgets or localized content using Dojo's i18n infrastructure from dojoConfig. The locale option lets you override the default provided to Dojo by your browser. A simple demo shows it at work:

<!--

<script>
    var dojoConfig = {
        has: {
            "dojo-firebug": true,
            "dojo-debug-messages": true
        },
        parseOnLoad: true,
        // look for a locale=xx query string param, else default to 'en-us'
        locale: location.search.match(/locale=([\w\-]+)/) ? RegExp.$1 : "en-us"
    };
</script>
<script src="//ajax.googleapis.com/ajax/libs/dojo/1.8.3/dojo/dojo.js"></script>
<script>
    require(["dojo/date/locale", "dijit/Dialog", "dojo/_base/json", "dojo/_base/config",
    "dojo/_base/window", "dojo/i18n", "dojo/domReady!"]
    , function(locale, Dialog, json, config, win) {
        var now = new Date();
        var dialog = new Dialog({
            id: "dialog",
            // set a title on the dialog of today's date,
            // using a localized date format
            title: "Today: " + locale.format(now, {
                    formatLength:"full",
                    selector:"date"
            })
        }).placeAt(win.body());
        dialog.startup();
 
        dialog.set("content", "<pre>" + json.toJson(config, true) + "</pre>");
        dialog.show();
    });
</script>

-->

</entry>
<entry [Fri 2013:03:22 01:45:38 EST] dojo.forEach REPLACED BY array.forEach IN 1.7+>

[ Dojo 1.7+ (AMD) ]

require(["dojo/_base/lang", "dojo/_base/array"], function(lang, array){
  if(lang.isArray(list)){
    array.forEach(list, function(item, i){
      // each item in list
    });
  }else{
    // something went wrong? we wanted an array here
  }
});


[ Dojo < 1.7 ]

if(dojo.isArray(list)){
  dojo.forEach(list, function(item, i){
      // each item in list
  });
}else{
  // something went wrong? we wanted an array here
}

    
</entry>
<entry [Sun 2013:03:17 01:37:09 EST] INSTALLATION AND USAGE OF CPM (CommonJS Package Manager)>

https://github.com/kriszyp/cpm

INSTALLATION

1. DOWNLOAD and unzip/untar CPM.

mkdir -p /home/syoung1/software/cpm/
cd /home/syoung1/software/cpm/
git clone https://github.com/kriszyp/cpm.git

3. EDIT STARTUP SCRIPT ('cpm' for unix)

emacs -nw /home/syoung1/software/cpm/0.1.3-356f193/cpm

ADD PATH TO CPM INSTALLATION

    export CPM_PATH=/home/syoung1/software/cpm/0.1.3-356f193


4. COPY cpm SCRIPT TO /usr/bin

You can also modify the registry URL in the startup script as well.
The startup script also includes directions (in the comments) for running from Node instead of Rhino.


NB: NOT NEEDED:

INSTALL
curl https://raw.github.com/kriszyp/cpm/master/install | sh

To install to a different location, you can use CPM_INSTALL_LIB for the directory where to put cpm's directory and CPM_INSTALL_BIN for the directory to symlink the cpm script:

curl https://raw.github.com/kriszyp/cpm/master/install | CPM_INSTALL_LIB=~/lib CPM_INSTALL_BIN=~/bin sh

This would install cpm's libraries in "~/lib/cpm" and symlink the cpm script to "~/bin/cpm". Make sure that your ~/lib directory exists before doing this.

If you are running on Mac OS, then you will probably need to edit the cpm script (the one that "which cpm" points to) and manually set CPM_PATH to your CPM folder that holds the jars and lib directory.



USAGE

Go to the directory where you want your packages to be installed and run:

cpm install package-to-install

The packages will be downloaded and unzipped into the current working directory.
CPM will also create any top level package modules to point to package "main" modules.
You should be able to load the modules with any AMD compliant module loader, including
RequireJS, Dojo, or Curl.


EXAMPLE

cd /saffrondev/html/temp/
cpm install dgrid

    drwxrwxr-x  7 syoung1 syoung1 4096 Mar 17 01:46 dgrid/
    -rw-rw-r--  1 syoung1 syoung1   63 Mar 17 01:46 dgrid.js
    drwxrwxr-x 20 syoung1 syoung1 4096 Mar 17 01:46 dojo/
    -rw-rw-r--  1 syoung1 syoung1   52 Mar 17 01:46 dojo.js
    -rw-rw-r--  1 syoung1 syoung1  164 Mar 17 01:46 package.json
    drwxrwxr-x  3 syoung1 syoung1 4096 Mar 17 01:46 put-selector/
    -rw-rw-r--  1 syoung1 syoung1   61 Mar 17 01:46 put-selector.js
    drwxrwxr-x  5 syoung1 syoung1 4096 Mar 17 01:46 xstyle/
    -rw-rw-r--  1 syoung1 syoung1   55 Mar 17 01:46 xstyle.js


<!--
<script src="dojo/dojo .js" data-dojo-config="async: true"></script>
<script>
    require(["some-package/some-module"]);
</script>

-->

You can also indicate the desired version to install with a second parameter:

cpm install package-to-install 1.2.2
To upgrade a package to the latest version, you can run:

cpm upgrade package-to-upgrade
To specify a directory to install packages to, you can run:

cpm --packages-path=~/Projects/my_project/libs install package-to-install
To specify a different registry to install packages from, you can run:

cpm --registry=http://url.to.registry.com install package-to-install
    
</entry>
<entry [Wed 2013:01:16 02:07:08 EST] CCS3 PATTERNS>


http://lea.verou.me/css3patterns/


BLUEPRINT
background-color:#269;
background-image: linear-gradient(white 1px, transparent 1px),
linear-gradient(90deg, white 1px, transparent 1px),
linear-gradient(rgba(255,255,255,.3) 1px, transparent 1px),
linear-gradient(90deg, rgba(255,255,255,.3) 1px, transparent 1px);
background-size:100px 100px, 100px 100px, 20px 20px, 20px 20px;
background-position:-2px -2px, -2px -2px, -1px -1px, -1px -1px
    
</entry>
<entry [Sun 2013:01:13 14:46:32 EST] WORKED AROUND CHROME ERROR EditRow.handleOnKeyPress: "Error: NOT_FOUND_ERR: DOM Exception 8">


Ah thanks, I'll post a notice to chrome's developer forum.

The work around for now was to wrap the spans within another span

so:

<!--
<span id="test1" class="test">Test1</span>
-->

would be:

<!--
<span id="parent_test1"><span id="test1" class="test">Test1</span></span>
-->

Then I used jquery to do this:

$("#edit_"+cellInfo.cID).parent().empty(); $("#parent_"+cellInfo.cID).append(cellElem.old_elem.context.outerHTML);

    
</entry>
<entry [Sat 2013:01:12 19:04:02 EST] HTML5 JAVASCRIPT READ LOCAL FILES>

http://www.html5rocks.com/en/tutorials/file/dndfiles/

    
</entry>
<entry [Fri 2013:01:11 22:58:13 EST] AGUA COLOUR SCHEME - PURPLE TABS>

cloud.css

.cloud .dijitTabChecked .tabLabel {
	color: #8245DA !important; /* purple */
	font-weight: bold;
}

    
</entry>
<entry [Tue 2013:01:08 14:35:14 EST] FIXED ERROR IN WORKFLOW PANE Apps PANEL: "TypeError: object is not a function">

PROBLEM

GET THIS ERROR WHEN LOADING plugins.workflow.Apps.Packages:

javascript "TypeError: object is not a function"


SOLUTION

REMOVE 'console.log' ENTRIES BETWEEN dojo.provide AND dojo.declare

    
</entry>
<entry [Sun 2013:01:06 06:26:55 EST] HOST Node.js SITE THROUGH APACHE>
ALSO: http://arguments.callee.info/2010/04/20/running-apache-and-node-js-together/


http://thatextramile.be/blog/2012/01/hosting-a-node-js-site-through-apache

Hosting A Node.js Site Through Apache

I recently lost some time trying to figure out how to host a Node.js site through Apache, so I figured I might as well write a post about how I got it working. Of course, this approach only makes sense if you already have a server that's running Apache and you want to add your Node.js site with minimal impact/changes on your server. If you're not using Apache already but just want to publish a Node.js site, you're better off using Node.js to host it directly, or to put Nginx in front of it since it's more lightweight than Apache. But anyways, here's how you get it working with Apache.

First of all, you need a way to start your Node.js process automatically when your system boots, and to shut it down when the system is shut down. This will depend on the type of server you're running on. In my case, it's a Debian server so I just went with the sysv init script from Nico Kaiser. Another popular alternative is the upstart utility, which is already preinstalled if you're using Ubuntu. Once you have a start|stop|restart script in place, you'll want something to monitor the Node.js process to restart it in case it goes down. An easy to use tool for this is monit. Nico Kaiser again has a good example script available for Node.js on Github.

Once you have your sysv init or upstart script in place, as well as monit, your Node.js process can stay running on your server. Of course, you probably have it set to listen to connections on some other port than port 80 because that's what your Apache server is listening on. So now, the only thing you have to do is configure Apache to proxy all requests coming in on port 80 through the URL of your Node.js site to your local Node.js process. You'll first need to install modproxy and modproxy_http. After that, the configuration to make it work is quite easy:

<!--
<VirtualHost 109.74.199.47:80>

ServerAdmin davy.brion@thatextramile.be

ServerName thatextramile.be

ServerAlias www.thatextramile.be

ProxyRequests off

<Proxy *>

Order deny,allow

Allow from all

</Proxy>

<Location />

ProxyPass http://localhost:3000/

ProxyPassReverse http://localhost:3000/

</Location>

</VirtualHost>

-->


And that's it. Every request coming in at http://thatextramile.be or http://www.thatextramile.be will be forwarded to http://localhost:3000 where Node.js is listening. Note that the ProxyPassReverse is required to make sure that all HTTP response headers will contain the proxied URL instead of the real one (localhost).

If you need the raw throughput that Node.js offers, this solution is far from optimal. Every request that comes in through Apache will cause an Apache thread to wait/block until the response is returned from your Node.js process. This is essentially the same as when hosting PHP or Ruby through Apache, so it's not a problem, but it does take away one of the benefits of using Node.js. Again, this approach only makes sense if you're already using Apache to host other sites and you just want to add a Node.js site with minimal impact to your server.

Written by Davy Brion, published on 1/15/2012 3:23:09 PM
Categories: node-js

« Node.js For Dummies How Do You Pick Open Source Libraries? »

    
</entry>
<entry [Sun 2013:01:06 04:09:35 EST] CHROME EXTENSION TINCR - LIVE EDIT JS AND CSS>

LETS TINCR
http://addyosmani.com/blog/lets-tincr-bi-directional-editing-and-saving-with-the-chrome-devtools/

HELP FORUM
https://groups.google.com/forum/#!forum/tincr-for-chrome-devtools

HOME PAGE
http://tin.cr/

Extension to allow editing and fast reloading of local files from Chrome developer tools
The idea behind Tincr is that you can save changes to your original source file from within Chrome Developer Tools. In addition, Tincr does auto-reloading of JavaScript and CSS changes made in other editors.

To give you a complete illustration, let's say you're developing a Ruby on Rails web application. You would select "Ruby on Rails" in the dropdown on the Tincr panel and then select the local directory of your rails application. Once you've done that, Tincr knows enough about how a RoR application is structured that if you made a change inside of Chrome Developer Tools, it would be saved to the local file equivalent. If you made a change to an application script or stylesheet using TextMate or some other tool, the change would automatically be reloaded in Chrome without refreshing the whole page.


TROUBLESHOOTING
http://addyosmani.com/blog/lets-tincr-bi-directional-editing-and-saving-with-the-chrome-devtools/


GET THESE SYSTEM ERRORS WHEN START USING TINCR EXTENSION

NETWORK MANAGER

The crashed program seems to use third-party or local libraries:

/mnt/home/syoung/.config/google-chrome/Default/Extensions/lfjbhpnjiajjgnjganiaggebdhhpnbih/1.3_0/npNPAPIFileIOforChromex64.so


CHECK LOG FILE REVEALS 'no DBUS_SESSION_BUS_ADDRESS in environment':

tail -f /var/log/apport.log

    ERROR: apport (pid 1890) Sun Jan  6 04:13:57 2013: wrote report /var/crash/_opt_google_chrome_chrome.1000.crash
    ERROR: apport (pid 2730) Sun Jan  6 05:01:45 2013: called for pid 2677, signal 6, core limit 0
    ERROR: apport (pid 2730) Sun Jan  6 05:01:45 2013: executable: /opt/google/chrome/chrome (command line "/opt/google/chrome/chrome\ --type=plugin\ --plugin-path=/home/syoung/.config/google-chrome/Default/Extensions/lfjbhpnjiajjgnjganiaggebdhhpnbih/1.3_0/npNPAPIFileIOforChromex64.so\ --lang=en-US\ --channel=2502.3.750502157\ --enable-crash-reporter=B687B58099114D5FB5708F3D62D9061D,Ubuntu\ 12.10")
    ERROR: apport (pid 2730) Sun Jan  6 05:01:45 2013: is_closing_session(): no DBUS_SESSION_BUS_ADDRESS in environment
    ERROR: apport (pid 2730) Sun Jan  6 05:02:00 2013: wrote report /var/crash/_opt_google_chrome_chrome.1000.crash

   
em /var/crash/_opt_google_chrome_chrome.1000.crash



</entry>
<entry [Sun 2013:01:06 03:49:12 EST] NODE MONKEY>

1. INSTALL

make: Leaving directory `/mnt/home/syoung/archive/node/node-v0.8.16/node_modules/node-monkey/node_modules/socket.io/node_modules/socket.io-client/node_modules/ws/build'
node-monkey@0.1.2 node_modules/node-monkey
├── underscore@1.4.3
└── socket.io@0.9.13 (base64id@0.1.0, policyfile@0.0.4, redis@0.7.3, socket.io-client@0.9.11)

npm install node-monkey


2. USE





Node Monkey

A Node.js module for inspecting and debugging Node applications through a web browser

node-monkey runs a simple server and uses Socket.IO to create a websocket connection between the browser and server. It captures anything that would normally be logged to the terminal, converts it to JSON and passes it to the browser where it can be logged in the console for inspection.

The motivation for this project came from trying to debug a Node server I wrote that used websockets. I found it problematic trying to inspect objects with the terminal. I tried using the built-in debugging that works with the Chrome Developer Tools plugin for Eclipse. Unfortunately, I ran into a problem where setting breakpoints to inspect objects would cause the server to stop responding to heartbeats and cause the client to disconnect. This would entirely mess up my debugging efforts. All I really needed to do was have a good way to inspect objects. I searched Google and found projects like node-inspector, which doesn't work with the latest versions of Node, and node-codein which has many bugs. And neither works with Firefox. And node-monkey was born!

Installation

npm install node-monkey

Usage

Using node-monkey is extremely easy. All you have to do is include the following line in your Node.js application. Anything that is logged to the console after this will show up in the browser console once connected. It captures all output to console.log(), console.warn() and console.error().

require('node-monkey').start([options]);

To connect your browser simply go to http://0.0.0.0:50500 in your web browser. If you change the default host and port bindings be sure to adjust your URL accordingly.

As an alternative to viewing output through this page, you can also view output in the console of your own web application by including the following lines:

<!--
<script type="text/javascript" src="http://0.0.0.0:50500/socket.io/socket.io.js">
</script>
<script type="text/javascript" src="http://0.0.0.0:50500/client.js">
</script>
-->

NOTE: You do NOT have to refresh the page when you restart your Node application to continue to receive output. It will automatically reconnect.

Options
host: The host network interface to bind to. Default is 0.0.0.0 which means ALL interfaces.
port: The port to listen on. Default is 50500.
suppressOutput: Use this to suppress terminal output when console.log() is called, freeing the console from clutter and allowing you to only inspect objects through the browser. Default is true.
saveOutput: If data is logged before you are able to connect your browser, you may still want to be able to view this data. Setting this option to true causes node-monkey to save the output and dump it out to the browser once you connect. Default is true.
silent: If true then nothing will be logged to the console when started. Default is false.

Examples

Example 1

require('node-monkey').start();
console.log('It works!', {key1: 'test', key2: ['an', 'array']});

Example 2

require('node-monkey').start({
  suppressOutput: false
});

console.log('It works!');
console.warn('You might have done something wrong');
console.error('FATAL ERROR', {message: 'Something broke'});

    
</entry>
<entry [Sun 2013:01:06 03:28:38 EST] NODE-INSPECTOR>

https://github.com/dannycoates/node-inspector

WORKS WITH:

WebKit based browsers: Chrome, Safari, etc.
Optional v8-profiler to use the profiles panel


1. INSTALL 

npm install -g node-inspector

    /usr/local/bin/node-inspector -> /usr/local/lib/node_modules/node-inspector/bin/inspector.js
    node-inspector@0.2.0beta3 /usr/local/lib/node_modules/node-inspector
    ├── async@0.1.22
    ├── connect@1.8.7 (mime@1.2.7, formidable@1.0.11, qs@0.5.3)
    └── socket.io@0.9.13 (base64id@0.1.0, policyfile@0.0.4, redis@0.7.3, socket.io-client@0.9.11)


2. USE NODE-INSPECTOR

node --debug /usr/local/lib/node_modules/autosave/index.js

    debugger listening on port 5858
    DevTools Autosave 1.0.0 is running on http://127.0.0.1:80


To use node-inspector, enable debugging on the node you wish to debug. You can either start node with a debug flag like:

node --debug your/node/program.js

or, to pause your script on the first line:

node --debug-brk your/short/node/script.js


OR, 3. RUN NODE WITH AUTOSAVE AND ENABLE DEBUGGING ON RUNNING NODE

autosave
    DevTools Autosave 1.0.0 is running on http://127.0.0.1:80


GET PROCESS ID OF NODE

netstat -nultp | grep 80
    tcp        0      0 127.0.0.1:80            0.0.0.0:*               LISTEN      1116/node       


SENT USR1 SIGNAL TO NODE PROCESS

kill -s USR1 1116


    Hit SIGUSR1 - starting debugger agent.
    debugger listening on port 5858


START NODE INSPECTOR

node-inspector &
    [1] 1145
   info  - socket.io started
    visit http://0.0.0.0:8080/debug?port=5858 to start debugging


 
open http://127.0.0.1:8080/debug?port=5858 in your favorite WebKit based browser
you should now see the javascript source from node. If you don't, click the scripts tab.

select a script and set some breakpoints (far left line numbers)
then watch the screencasts
For more information on getting started see the wiki

node-inspector works almost exactly like the web inspector in Safari and Chrome. Here's a good overview of the UI

FAQ / WTF
I don't see one of my script files in the file list.
try refreshing the browser (F5 or command-r)
My script runs too fast to attach the debugger.
use --debug-brk to pause the script on the first line
I got the ui in a weird state.
when in doubt, refresh
Can I debug remotely?
Yes. node-inspector must be running on the same machine, but your browser can be anywhere. Just make sure port 8080 is accessible
Inspector options
--web-port=[port]     port to host the inspector (default 8080)
Cool stuff
the WebKit Web Inspector debugger is a great js debugger interface, it works just as well for node
uses WebSockets, so no polling for breaks
remote debugging
javascript top to bottom :)
edit running code

Known Issues
This is beta quality code, so use at your own risk:

be careful about viewing the contents of Buffer objects, each byte is displayed as an individual array element, for anything but tiny Buffers this will take too long to render
while not stopped at a breakpoint the console doesn't always behave as you might expect
Profiling
VERY EXPERIMENTAL I don't recommend using this yet

To use the profiles panel, install the v8-profiler module:

npm install v8-profiler
To use it do something like:

var profiler = require('v8-profiler');

profiler.startProfiling('startup');
slowStartupFoo();
profiler.stopProfiling('startup');

profiler.takeSnapshot('beforeLeak');
leakyFoo();
profiler.takeSnapshot('afterLeak');
Then view the profiling results with the profiles panel in node-inspector. You can also take heap snapshots on demand from the profiles panel.

Thanks
This project respectfully uses code from and thanks the authors of:

WebKit
node
socket.io
node-paperboy

    
</entry>
<entry [Sat 2013:01:05 23:45:26 EST] Node.js VERSUS APACHE?>

http://stackoverflow.com/questions/5346055/can-i-replace-apache-with-node-js
    
</entry>
<entry [Sat 2013:01:05 17:36:17 EST] SERVER PUSH WITH Socket.IO>


What is Socket.IO?
Socket.IO aims to make realtime apps possible in every browser and mobile device, blurring the differences between the different transport mechanisms. It's care-free realtime 100% in JavaScript.

SERVER

var io = require('socket.io').listen(80);

io.sockets.on('connection', function (socket) {
  socket.emit('news', { hello: 'world' });
  socket.on('my other event', function (data) {
    console.log(data);
  });
});
CLIENT

<!--<script src="/socket.io/socket.io.js"></script>
<script>
  var socket = io.connect('http://localhost');
  socket.on('news', function (data) {
    console.log(data);
    socket.emit('my other event', { my: 'data' });
  });
</script>
-->    



INSTALL

npm install socket.io

Using with Node HTTP server

For this example, simply run `npm install socket.io`

SERVER (APP.JS)

var app = require('http').createServer(handler)
  , io = require('socket.io').listen(app)
  , fs = require('fs')

app.listen(80);

function handler (req, res) {
  fs.readFile(__dirname + '/index.html',
  function (err, data) {
    if (err) {
      res.writeHead(500);
      return res.end('Error loading index.html');
    }

    res.writeHead(200);
    res.end(data);
  });
}

io.sockets.on('connection', function (socket) {
  socket.emit('news', { hello: 'world' });
  socket.on('my other event', function (data) {
    console.log(data);
  });
});

CLIENT (INDEX.HTML)

<!--<script src="/socket.io/socket.io.js"></script>
<script>
  var socket = io.connect('http://localhost');
  socket.on('news', function (data) {
    console.log(data);
    socket.emit('my other event', { my: 'data' });
  });
</script>
-->

</entry>
<entry [Sat 2013:01:05 15:06:48 EST] TWISTED PYTHON SERVER>
    
http://twistedmatrix.com/trac/


</entry>
<entry [Sat 2013:01:05 14:29:13 EST] SCREENCAST>

vimeo    
    
</entry>
<entry [Sat 2013:01:05 04:46:18 EST] LIVE EDIT JAVASCRIPT WITH AutoSave EXTENSION>

SEE ALSO: https://github.com/NV/chrome-devtools-autosave
FOR EDITING USING A URL OTHER THAN http://localhost

NB: ?? INSTALL ?? CHROME EXTENSION SaveCSS


NB: REVERT CHANGES: Resources tab -->
    click drop-down arrow next to any modified stylesheets or scripts -->
        version history of what you've updated (as long as you haven't refreshed).
        
useful if you accidentally wipe out a bunch of things you'd like to revert back to.

GOOD

http://stackoverflow.com/questions/11580769/autosaving-to-files-in-chrome-dev-tools

DRUPAL
http://timonweb.com/making-drupal-themers-life-easier-autosaving-css-changes-chrome-browser

RUN ON localhost INSTEAD OF file://
https://github.com/NV/chrome-devtools-autosave/issues/7

MORE ABOUT AutoSave:
https://chrome.google.com/webstore/detail/devtools-autosave/mlejngncgiocofkcbnnpaieapabmanfl?hl=en

You may want to try Chrome Dev Tools for Java project. It is an Eclipse plugin for debugging JavaScript in Chrome that could be used together with a JavaScript IDE plugin. This way you edit and debug and live edit the very same file (see text).

Besides using straight Chrome, this is probably the only other way to get live edit functionality, although to be fair, this technique also uses Chrome. – GravityWell Apr 22 '12 at 20:15
    

github.com/NV/chrome-devtools-autosave


1. ENABLE EXPERIMENTAL EXTENSIONS

OPEN:

chrome://flags/

ENABLE:

Experimental Extension APIs


2. RESTART CHROME


3. INSTALL Node.js SERVER
https://github.com/NV/chrome-devtools-autosave-server/blob/master/README.mdown

http://nodejs.org

DOWNLOAD THEN:

./configure
make
make install


4. INSTALL AUTOSAVE
Autosave uses a local node server to save files.

npm install -g autosave
    OK

ll /usr/local/lib/node_modules/

    drwxr-xr-x 5 nobody syoung 4096 Jun  3 13:37 autosave/
    drwxr-xr-x 9 root   root   4096 Jun  3 13:37 npm/


5. (OPTIONAL) SET TO RUN AUTOSAVE ON BOOT
To start autosave on OS launch run:

npm run-script -g autosave autostart


6. INSTALL CHROME EXTENSION AutoSave
    OK
    

7. CONFIGURE AutoSave IN CHROME:

Tools --> Extensions --> DevTools AutoSave --> Options
or

chrome://settings/extensions --> Options


SET THE FOLLOWING:

ROUTES
    MATCH:  http://localhost/
    SAVE TO: /var/www/html/
SERVERS
    http://127.0.0.1:9104


ALTERNATELY (DID NOT TRY THIS), USE routes.js TO CONFIGURE AUTOSAVE:

emacs -nw /agua/bin/scripts/resources/node/routes.js
exports.routes = [{
    from: /^http:\/\/localhost\/agua\//,
    to: '/agua/html/'
}];
THEN START WITH:
autosave --config /agua/bin/scripts/resources/node/routes.js


8. START NODE WITH AUTOSAVE

autosave

    DevTools Autosave 1.0.0 is running on http://127.0.0.1:9104

    
CHECK NODE IS RUNNING

netstat -ntulp | grep 80
    tcp        0      0 127.0.0.1:80            0.0.0.0:*               LISTEN      32470/node      



9. USE AutoSave

FILES TO BE LIVE EDITED MUST BE ADDED DIRECTLY TO agua.html WITH NO '../', E.G.:

<!--
<script type="text/javascript" src="plugins/apps/Parameters.js"></script>
-->

CNTL+SHIFT+J TO OPEN DevTools --> Sources --> SELECT FILES WITHOUT '../' --> EDIT/SAVE


NOTES
-----

CONFIGURE USE http://localhost INSTEAD OF file://
http://timonweb.com/making-drupal-themers-life-easier-autosaving-css-changes-chrome-browser


VIDEO
http://addyosmani.com/blog/autosave-changes-chrome-dev-tools/


You could use Opera. Opera allows editing of inline JS and JS files. After you soft reload the page, your changes will be applied. Right click > Source > Make changes > Apply Changes. – XP1 Jun 25 '12 at 17:42




http://addyosmani.com/blog/autosave-changes-chrome-dev-tools/


Whenever Autosave updates a local file, a

<!--
'Saved a <filetype> to <filename>'
-->

notification will be output at the console. You don't need to keep a constant watch for this, but if you'd prefer to avoid refreshing to see if changes have been saved for sure, it's certainly an alternative.
Not only does Autosave support what I demonstrated in the screencast, but it can also let you do the following:
Adding comments like /*hello world*/
Editing multiple-properties at the same time. e.g if you wanted to to add a value for the background-image then add an override for that value if the browser supports CSS3 gradients (the old progressive enhancement trick), this is also supported:  
view plaincopy to clipboardprint?
background-image: url(some_gradient.png);  
background-image: -webkit-gradient(linear, 0% 100%, 0% 0%, color-stop(0.03, #6E9577), color-stop(0.52, #8FB39B))  
Update existing JavaScript functions without the need to reload the page at all. Definitely useful.
One trick I didn't see documented was this: although your changes may be made to local files instantly, if you go back to the Resources tab after making a change and click on the drop-down arrow next to any modified stylesheets or scripts, you can get a version history of what's you've updated (as long as you haven't refreshed). This isn't specific to this extension, but can come in useful if you accidentally wipe out a bunch of things you'd like to revert back to.
Conclusions

And that's it. I personally found Autosave very useful for working on smaller projects and it does do everything it says on the tin.

If you choose to use it, just keep in mind that although we're typically used to using the developer tools for debugging or experimentation, removing whole rules in your styles (even if just to try something out) will result in them being removed from the local file too.

As long as you're aware of this, it's a really neat tool to have in your utility belt and I'm happy to recommend checking it out. Please help us spread the word if you find it useful.
</entry>
<entry [Wed 2012:12:26 05:32:48 EST] CREATE A SINGLE *.css FILE>

http://www.sitepen.com/blog/2008/04/02/dojo-mini-optimization-tricks-with-the-dojo-toolkit/

run the build:

    # run an optimized build
    echo "minify: running build"
    cd util/buildscripts
    # we keepLines because otherwise debugging is really hard
    # , and it's a minimal size diff
    ./build.sh profile=standard optimize=shrinksafe.keepLines version=1.1.0mini
      cssOptimize=comments.keepLines cssImportIgnore=../dijit.css action=release
  
This line is taken more or less directly from Dojo’s build_release.sh script, with the addition of ShrinkSafe optimization. ShrinkSafe is Dojo’s ubercool Code packer (like Packer, or YUI Compressor), and is directly integrated into the build system. optimize=shrinksafe.keepLines tells the build to remove all comments and whitespace from every .js it encounters, preserving newlines to give us some hope of debugging should anything turn up.

The cssOptimize command removes unnecessary whitespace and comments from CSS files, as well as does automatic @import inline injecting. The Dijit themes are setup as such that you don’t need the entire theme.css file, just the components you want, and this is a way to further optimize that. The default nature, however, is to inline all the individual .css files in a theme/ folder into the single theme.css, though it leaves all the other [processed] .css files. Ignoring dijit.css allows us to reuse a common CSS file once each within each of the themes.

1
2
3
4
/* before */
@import "../dijit.css";
@import "Common.css";
@import "form/Button.css";
and after:

1
2
3
@import "../dijit.css";
.commonStyleA {}
.buttonStyle {}
The build actually generates additional files, so we’re not entirely done cleaning up. All the rest of this code is wrapped within a conditional, checking to see if the build ran successfully:

1
2
3
4
5
6
# discard whatever leftovers we can find
if [ -d $WD/release/dojo ]; then
  echo "minify: build success. removing uncompressed files, and optimizing themes"
  cd $WD/release/dojo
  # do more stuff
fi
So if we have a release/dojo folder, we can move on to removing any new cruft introduced by the build process. ShrinkSafe, in an attempt to be fault-tolerant, creates copies of any files it compresses, and names it uncompressed.js preceded by the original filename. Likewise, cssOptimize creates .commented.css files, retaining the inline comments. This is great for debugging after a build, but I don’t need duplicated code in this environment. Two simple commands to remove all these files get issued:

1
2
find . -name *.uncompressed.js -exec rm '{}' ';'
find . -name *.commented.css -exec rm '{}' ';'

...


The final step in optimization: the Themes. The 1.1MB archive includes all three official Dijit themes: Tundra, Nihilo, and Soria. Each has its own images, and a vast collection of small .css files. We noted earlier about @import injection, so now after the build is complete, our themeName.css is the mashup of all the smaller files. Let’s erase all the .css files we don’t need, leaving the single .css rollup, and the images:

1
2
3
4
5
6
7
8
# we can also [in theory] remove all but the themeName.css file in themes/*.css
for t in 'tundra' 'soria' 'nihilo'
do
  cd $WD/release/dojo/dijit/themes/$t/
  mv $t.css $t.tmp
  find `pwd` -name *.cs\? -exec rm '{}' ';'
  mv $t.tmp $t.css
done
All we’ve done is renamed the rollup .css file, removed *.css recursively, and restored the file to its original filename. We’ve left some empty directories potentially, but it’s not a major concern at this point. We’ve hit the 1.1MB mark. Smallest. Dojo. Ever.

The last thing we need to do is package up the resulting filesystem, and ship it somewhere. This next segment of code does that, though can be changed to suit your needs. I have it currently creating a single mashup archive, and then an individual archive for each of the namespaces:

1
2
3
4
5
6
7
8
9
10
11
12
13
14
cd $WD/release
echo "minify: creating archive(s)"
TARBALL='dojo-release-1.1.0-mini';
mv dojo $TARBALL
tar -czvf $TARBALL.tar.gz $TARBALL/ 1> /dev/null 2> /dev/null
mv $TARBALL.tar.gz $ROOTDIR
 
# create dojo- dijit- and dojox- tarballs
mkdir $ROOTDIR/$TARBALL-parts/
for n in 'dojo' 'dijit' 'dojox'
do
  tar -czvf $TARBALL-$n.tar.gz $TARBALL/$n/ 1> /dev/null 2> /dev/null
  mv $TARBALL-$n.tar.gz $ROOTDIR/$TARBALL-parts/
done
The md5sums are generated by issuing a simple command after the archives have been placed somewhere:

1
dante@turtle:~> for i in *.tar.gz; do md5sum $i > $i.md5; done

    
</entry>
<entry [Wed 2012:12:26 05:25:04 EST] USE LINKS TO FIX PRE-AND POST-BUILD CSS FILE>

http://mail.dojotoolkit.org/pipermail/dojo-interest/2011-September/058170.html

[Dojo-interest] dojo build and css paths, how modulePath cannot work around like the

Peter Schmidt gevatter.tod at gmail.com 
Tue Sep 6 04:27:28 EDT 2011
Previous message: [Dojo-interest] dojo build and css paths, how modulePath cannot work around like the
Next message: [Dojo-interest] dojo build and css paths, how modulePath cannot work around like the
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
i would suggest to use some url rewrite magic.

for example, mappings in dev mode:
/js/dojo -> pathto/lib/dojo/_the_dojo_sdk/dojo
/js/dijit -> pathto/lib/dojo/_the_dojo_sdk/dijit
/js/dojox -> pathto/lib/dojo/_the_dojo_sdk/dojox
/js/mydijits -> pathto/lib/_my_dijits

and production
/js -> pathto/lib/dojo/release/thebuild


petschm


On Tue, Sep 6, 2011 at 4:55 AM, Nick Fenwick < neek at nickfenwick.com> wrote:

> Hi guys,
>
> If this has been discussed, sorry for repeating things.  I'd like to
> raise a point that goes along with my recent discussion on module paths
> in the build, which kgf and rmurphey were kind enough to discuss and
> rmurphey finally agreed that some modulePath hackery is required to be
> able to use her scaffolding example with the custom module path outside
> of the core dojo sdk path.
>
> ./lib/dojo/_the_dojo_sdk_here
> ./lib/mydijits/_my_dijits_here
>
> We've seen that having a mydijits.App dijit that does some requires of
> other modules can be another approach to using the build system, instead
> of defining a layer .js file in the build profile and then < script>
> including that, which helps by collecting all the module dependencies
> into one App.js file, and not having to duplicate management effort
> between it and the profile .js file.  It became apparent that, to host
> 'mydijits' outside of the dojo SDK dir, one has to pull some modulePath
> tricks in the .html file that's using the dijits, because the path to
> mydijits relative to dojo.js changes before and after the build.  That is,
>
> prefix: [ [ "mydijits", "../../mydijits" ] ] // note the double ../
>
> Before the build:
> ./lib/dojo/dojo/dojo.js
> ./lib/mydijits/Foo.js // path to mydijits.Foo is ../../mydijits/Foo
>
> After the build:
> ./lib/dojo/release/thebuild/dojo/dojo.js
> ./lib/dojo/release/thebuild/mydijits/Foo.js // path to mydijits.Foo is
> ../mydijits/Foo
>
> I have similar trouble with css files, which cannot be solved with
> modulePath, and wondered what insight people might have.
>
> Lets say we want a single mydijits.css file that will gather all css
> dependencies of our dijits.
>
> Contents of ./lib/mydijits/mydijits.css:
> @import url('Foo.css');
> @import url('../dojo/dojox/layout/resources/ResizeHandle.css');
> @import url('../dojo/dijit/themes/claro/claro.css');
>
> In the html file:
> < link rel='stylesheet' href='lib/mydijits/mydijits.css'>
>
> When you run this in 'release' mode, this works fine, because the
> mydijits.css file is loaded by the browser has its @import statements
> resolve relative to itself.
>
> During a build, the mydijits prefix is first copied into the build
> staging area, then inlined by the dojo build process, so after copying
> the prefix we have:
>
> ./lib/dojo/release/thebuild/dojo/dojo.js
> ./lib/dojo/release/thebuild/dojox/layout/resources/ResizeHandle.css
> ./lib/dojo/release/thebuild/dijit/themes/claro/claro.css
> ./lib/dojo/release/thebuild/mydijits/mydijits.css
> ./lib/dojo/release/thebuild/mydijits/Foo.css
>
> Now some of the paths don't work.  Foo.css is fine, but e.g.
> ResizeHandle is no longer at:
> ../dojo/dojox/layout/resources/ResizeHandle.css
> it's at
> ../dojox/layout/resources/ResizeHandle.css
>
> This means the mydijits.css file cannot work both pre and post build.
> It seems best to arrange it so that it works for the build, so that
> after a build we have a proper, complete, compiled mydijits.css .. but
> this breaks it for pre-build, of course.
>
> At the moment I'm running with some nasty runtime switches in my .jsp
> code, e.g.
>
> < % if (useCompiledCss) { %>
> < link rel='stylesheet'
> href='./lib/dojo/release/thebuild/mydijits/mydijits.css'>
> < % } else { %>
> < link rel='stylesheet' href='./lib/mydijits/Foo.css'>
> < link rel='stylesheet'
> href='./lib/dojo/dojox/layout/resources/ResizeHandle.css'>
> < link rel='stylesheet' href='./lib/dojo/dijit/themes/claro/claro.css'>
> < % } %>
>
> So we have exactly the same double-management problem as with the module
> paths before.  With the module paths, we can put a conditional switch in
> that just calls dojo.registerModulePath(), and that fixes all the
> dojo.require()'s so they 'just work' .. but this cannot be done for css
> imports.
>
> A regex style replace of the mydijits.css content just for the build,
> that would 'fix' its paths so they magically work during the build,
> isn't easy to automate because the build simply copies your working file
> into the prefix and acts on it immediately, with no hooks available
> which we could use to jump in and tweak the file.
>
> It seems that the easiest solution is to move our custom dijit working
> files inside the dojo sdk directory.
>
> Any great ideas? :)
> Nick
    
</entry>
<entry [Wed 2012:12:26 05:20:52 EST] HOW TO INLINE CSS IN DOJO BUILD>

http://mail.dojotoolkit.org/pipermail/dojo-interest/2009-November/040577.html

[Dojo-interest] CSS and custom builds

Deno Vichas dvichas at autoreturn.com 
Wed Nov 4 13:18:21 EST 2009
Previous message: [Dojo-interest] CSS and custom builds
Next message: [Dojo-interest] CSS and custom builds
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
I'm also have a hard time getting css optimization to work correctly.
What I have found is the imports paths are relative to where the build
is building to.  but the problem I'm having now is that I get all my css
in one file but all the relative paths from the dojo css are incorrect.
The build tool is 'fixing' them relative to the build to dir and not the
source dir.  This cause all the paths to be incorrect.

 

-          deno

 

 

 

From: dojo-interest-bounces at mail.dojotoolkit.org
[mailto:dojo-interest-bounces at mail.dojotoolkit.org] On Behalf Of Scott
Sent: Tuesday, November 03, 2009 1:49 PM
To: dojo-interest at mail.dojotoolkit.org
Subject: Re: [Dojo-interest] CSS and custom builds

 

It's taken me a while to get back on this because I've been trying it
out.  I'm just learning the build system and there are still a few
things I don't understand.  Your reply really has helped me.  And kudos
to Peter for writing this article:
http://www.sitepen.com/blog/2008/04/02/dojo-mini-optimization-tricks-wit
h-the-dojo-toolkit/

 

I've got it so my javascript is combined into a single JS file that I
can import.  I have a few issues with the runtime behavior, but for the 

most part it it's looking great--and the performance enhancement is
remarkable before I even specify the ShrinkSafe option.

 

The CSS files are being optimized, but I think they are all still just
individual files that need to be separately requested, so I know

 that can't be right. 

 

Currently my profile looks like this:

 

dependencies =

{

            stripConsole       : "normal",

 

            layers  

                        : [ {

        name                    : "../mycompany/myproduct.js",

            dependencies     : [ "mycompany.MyProductDependencies" ]

    } ],

 

            prefixes    : [

                        [ "dijit", "../dijit" ],

                        [ "dojox", "../dojox" ],

            [ "mycompany", "../mycompany" ]

    ]

}

 

I invoke the build like this: build profile=myprofile
action=clean,release cssOptimize=comments.keepLines

 

I haven't mentioned css in any of this, but in the mycompany path I put
a css file that contains all the styles for mycompany called
MyCompanyStyles.css, which contains all the @imports I need.

 

I see from the output of the build that they are encountered.  For
example:

 

release:  Optimizing (comments.keepLines) CSS file:
../../release/dojo/dijit/tests/_editor/test_richtext.css

release:  Optimizing (comments.keepLines) CSS file:
../../release/dojo/dijit/themes/dijit.css

release:  Optimizing (comments.keepLines) CSS file:
../../release/dojo/dijit/themes/dijit_rtl.css

 

My question is, how do I use these styles?  Are they inlined?  What do I
have to include to make sure those styles are resident in my page? 

Isn't there one big uber-style sheet I can include with all these styles
inlined?

 

Thanks for all your help so far,

 

Scott

________________________________

From: James Burke <jburke at dojotoolkit.org>
To: dojo-interest at mail.dojotoolkit.org
Sent: Mon, November 2, 2009 2:03:31 PM
Subject: Re: [Dojo-interest] CSS and custom builds

The build will not be able to inline the CSS as you have it specified.
It looks for @import url("") syntaxes and only inlines things where
the string inside url() is a relative path to a directory that the
build system knows about (via the prefixes area in your build
profile).

Currently the build system does not look at .js file for finding CSS
files to inline, but just .css files that have the @import url()
structure mentioned above.

Normally what I do is have my list of CSS files that mirror the
directory structure of the JS files, and if the JS file does a
dojo.require() for a module that has its own CSS, in the .css file for
that module I do a @import url() call for the CSS that is used by that
other module.

James
    
</entry>
<entry [Tue 2012:12:25 01:43:53 EST] REDIRECT AFTER DOWNLOAD>

How To Redirect On Download

Share on facebook Share on twitter Share on evernote Share on pinterest_share
 By Lynette
Sometimes clients ask for the most interesting things. This was one such request. The client had a free downloadable file and she wanted people to be redirected to a sales page after download. While I did advise her to just put the download on top of a sales page, she wanted to test the redirect.

Lucky for her, this is super easy to do. The only caveat is, it might not work if your browser has Javascript turned off. Ready? Here’s the code.

1
2
<a onclick="window.open('http://yoursite.com/url-to-your/downloadable-file.pdf')"
href="http://yoursite.com/url-to-the/redirect-page">Click here to download</a>
Told you it was simple. You can also make it link to an image if you prefer.
    
</entry>
<entry [Thu 2012:11:15 01:18:08 EST] LOGIN AND LOGOUT ICONS>

http://findicons.com/icon/229803/exit

    
</entry>
<entry [Wed 2012:11:14 22:49:07 EST] ENABLE TAB CONTAINER BORDER IN ALL PANES>

PROBLEM

NOT ALL PANES HAVE GREY BORDER AROUND TAB PANE


DIAGNOSIS

BORDER IS PRESENT IN HOME PANE:

.tundra .dijitSplitContainer-child, .tundra .dijitBorderContainer-child {
    border: 1px solid #CCCCCC;
}

<!--
<div class="dijitTabPaneWrapper dijitTabContainerTop-container dijitAlignClient" dojoattachpoint="containerNode" style="left: 0px; top: 30px; position: absolute; width: 1200px; height: 820px;" aria-labelledby="dijit_layout_TabContainer_0_tablist_dijit_layout_BorderContainer_0">

    <div id="dijit_layout_BorderContainer_0" class="dijitBorderContainer dijitContainer home dijitTabPane dijitTabContainerTop-child dijitTabContainerTop-dijitBorderContainer dijitLayoutContainer dijitVisible" dojotype="dijit.layout.BorderContainer" closable="true" title="" style="min-width: 1000px ! important; width: 1200px; height: 820px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); left: 0px; top: 0px;" iconclass="homeIcon" dojoattachpoint="mainTab" widgetid="dijit_layout_BorderContainer_0">

==> HERE
        <div id="dijit_layout_ContentPane_1" class="dijitContentPane homeContainer dijitBorderContainer-child dijitBorderContainer-dijitContentPane dijitBorderContainerPane dijitAlignTop" region="top" dojotype="dijit.layout.ContentPane" title="" role="group" widgetid="dijit_layout_ContentPane_1" style="left: 0px; top: 0px; position: absolute; width: 1188px;">
    
-->    


SOLUTION:

ADD height ATTRIBUTE TO .tabs .dijitTab IN controls.css, LINE 574:
 
.tabs .dijitTab {
    color: #243C5F;
    font-size: 16px;
    font-weight: bolder;
    height: 30px !important;
}


FOR THE SINGLE PANE, ADD border ATTRIBUTE TO .dijitContentPane:

cloud.css

line 200

.cloud .dijitContentPane {
    border: 1px solid #DDD;
}
 

 
</entry>
<entry [Thu 2012:08:02 18:05:47 EST] USE e.preventDefault TO AVOID FALSE FIRE>
    
preventDefault will only prevent the default event action to occur, i.e. a page redirect on a link click, a form submission, etc. and return false will also stop the event flow.


function submitClicked(e) { 
        e.preventDefault(); 
... 
} 


preventDefault will only prevent the default event action to occur, i.e. a page redirect on a link click, a form submission, etc. and return false will also stop the event flow.
    
</entry>
<entry [Thu 2012:07:19 17:49:16 EST] GOOGLE MAPS: FIND IF POINT LIES INSIDE A POLYGON>


https://github.com/tparkin/Google-Maps-Point-in-Polygon

    
</entry>
<entry [Mon 2012:07:16 14:43:51 EST] TEST CALL TO GITHUB FROM CLIENT>

CALL

https://api.github.com/repos/agua/agua/tags

    OK
    
</entry>
<entry [Mon 2012:07:02 17:03:32 EST] UNRESOLVED CHROME ERROR: Uncaught TypeError: Object ../../../../t/json/getData-111127.json has no method 'indexOf'>


PROBLEM

WHEN DO fetchJson, CHROME GIVE ERROR:

Uncaught TypeError: Object ../../../../t/json/getData-111127.json has no method 'indexOf'


DIAGNOSIS

NO KNOWN CAUSE DESPITE LENGTHY SEARCH



SOLUTION

DON'T USE fetchJson WITH CHROME - IT WORKS FINE WITH getData CALL !!


    
</entry>
<entry [Fri 2012:05:11 01:27:06 EST] FLOAT WITH EQUAL HEIGHT BLOCKS IN COLUMNS>

http://designshack.net/articles/css/everything-you-never-knew-about-css-floats/

SOLVES THE PROBLEM OF ADDING EXTRA BLOCKS AND HAVING THE HEIGHT AUTOMATICALLY INCREASE

USES THIS:

http://nicolasgallagher.com/micro-clearfix-hack/

    
</entry>
<entry [Thu 2012:05:10 14:14:54 EST] LIVE EDIT JAVASCRIPT >

http://www.tweakandtrick.com/2011/03/javascript-tricks-edit-websites-in.html

FIREFOX

use the following bookmarklets by dragging them to your Bookmarks bar.<br />
<br />
<blockquote>1. &nbsp;<a href="javascript:document.body.contentEditable%20=%20'true';%20document.designMode='on';%20void%200">Edit this Website</a><br />
<br />
2. &nbsp;<a href="javascript:document.body.contentEditable%20=%20'false';%20document.designMode='off';%20void%200">Done Editing</a></blockquote><br />
The editing that you do will however be temporary as it is not server-sided. You can also save the modified website through your browser by File&gt;Save. This works on all common web browsers including Chrome, Firefox, Opera and Internet Explorer.<br />
<br />


CHROME

ADD TO URL BAR:

javascript:document.body.contentEditable%20=%20'true';%20document.designMode='on';%20void%200



(Mozilla Firefox does not support this. If you use Firefox, you can use the bookmarklets given at the end of this post. If you use Google Chrome and the code does not seem to work, precede it with "javascript:" without quotes.)

To use this trick, all you need to do is just copy the code given below and paste it in your address bar after you have opened the website you wish to edit. And start editing.

javascript:document.body.contentEditable%20=%20'true';%20document.designMode='on';%20void%200
You can capture a screenshot by pressing the Print Screen key or by using the Snipping Tool if you use Windows 7 or Windows Vista. If you wish to again make the website non-editable to give a more authentic look, copy and paste the code given below in the address bar after you are done editing (does not work in Firefox).

javascript:document.body.contentEditable%20=%20'false';%20document.designMode='off';%20void%200

Or, alternatively you can use the following bookmarklets by dragging them to your Bookmarks bar.

1.  Edit this Website

2.  Done Editing

The editing that you do will however be temporary as it is not server-sided. You can also save the modified website through your browser by File>Save. This works on all common web browsers including Chrome, Firefox, Opera and Internet Explorer.

    
</entry>
<entry [Thu 2012:05:03 17:21:21 EST] FIXED ERROR 'this._fadeOutDeferred' ON HIDE DIALOG>

PROBLEM:
IN dojo._BaseDialog.hide THIS LINE CAUSES THE ERROR:

    this._fadeOutDeferred.callback(true); 


SOLUTION

ADDED this._fadeOutDeferred TO plugins.digit.InputDialog

    
</entry>
<entry [Wed 2012:03:07 05:10:37 EST] ANONYMOUS SCOPING FUNCTION>

This function has a name, which is useful for debugging purposes, but because of the anonymous scoping function there's no pollution of the global namespace.


CONVERT JAVASCRIPT DATE TO MYSQL TIMESTAMP:

NB: Date.getFullYear(), Date.getMonth() starts with 0 = January, so you probably want + 1), and Date.getDate() (day of month).


(function() {
    Date.prototype.toYMD = Date_toYMD;
    function Date_toYMD() {
        var year, month, day;
        year = String(this.getFullYear());
        month = String(this.getMonth() + 1);
        if (month.length == 1) {
            month = "0" + month;
        }
        day = String(this.getDate());
        if (day.length == 1) {
            day = "0" + day;
        }
        return year + "-" + month + "-" + day;
    }
})();
Usage:

var dt = new Date();
var str = dt.toYMD();

That uses local time; for UTC, just use the UTC versions (getUTCFullYear, etc.).

Caveat: I just threw that out, it's completely untested.

    
</entry>
<entry [Thu 2012:02:23 06:09:57 EST] OVERRIDE CONTENT PANE LOAD ERROR MESSAGE>

ADDED TO home.css:

/* PROGRESS PANE LOAD ERROR */
.progressPane .dijitContentPaneError {
	background-color: #FF0000 ! important;
	background-image: url(../../../images/loading.gif);
	left: 40% ! important;
	position: absolute ! important;
	top: 40% ! important;
}


SI want to replace the standard dijit.ContentPane loadingMessage with a animated GIF instead of the default "Loading..." message.


According to documentation, the default message is:

<!--

<span class='dijitContentPaneLoading'>${loadingState}</span>

-->

So I have overridden the CSS with:



.dijitContentPaneLoading {
    background-image: url('../images/loading.gif');
    background-repeat: no-repeat;
    background-position: center center;
}


I can see the GIF and the "Loading..." message when the ContentPane loads, but the problem is that because it is only a < span> I can't seem to get it to take up the whole pane and be centered, instead it sits in the top left and doesn't display the whole loading graphic. I don't want to have to override each loadingMessage with code, especially I prefer to use the declarative mode.

Is there some simpler way (hopefully via CSS) to get the loading image centered within the pane?

css dojo dijit dijit.layout
link|improve this question
asked Dec 14 '09 at 21:07

Kitson
479421

100% accept rate
Was this post useful to you?     
1 Answeractiveoldestvotes
up vote
2
down vote
accepted
Would something like this work?

.dijitContentPaneLoading {
    display: block;
    position: relative;
    top: 40%;
    background-image: url('../images/loading.gif');
}
(Also make sure that the ContentPane itself has position: relative or position:absolute)

Of course, the pane needs to have a fixed height. If it's just a plain ContentPane that expands to fit it's content then the browser won't know the height until the load finishes, hence it would be impossible to center the loading message vertically.

link|improve this answer
answered Dec 16 '09 at 8:38

Bill Keese
534213
Thanks for the pointer... With a little manipulation I was able to get it to display exactly like I wanted. – Kitson Dec 16 '09 at 9:37


    
</entry>
<entry [Thu 2012:02:23 05:42:08 EST] USE CACHE-PREVENTION TAGS>

ADD THESE LINES TO PREVENT CACHE:

(Remove later to allow the application to be cached on the device.)

<!--

<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">


-->    
</entry>
<entry [Thu 2012:02:23 05:22:02 EST] dojo IS IBM'S PREFERRED AJAX FRAMEWORK>

http://www.websphereusergroup.org.uk/wug/files/presentations/26/15_Web20_iWidgets_Dojo.pdf
Introducing the Dojo Toolkit

The Dojo Toolkit is IBM’s choice as best of breed AJAX framework.
– Open source, freely available from 
http://www.dojotoolkit.org
– Built on open web standards such as 
HTML, JavaScript and CSS.
– Seeks to insulate the developer from 
browser differences and quirks and 
promote modular, open web UIs.

Key features include:
– Extensible and flexible component model
– Allows declarative UI extensions
– Rich user interface components and 
themes.
– Support for accessibility and 
internationalisation.
    
</entry>
<entry [Thu 2012:02:23 04:39:53 EST] dojo PERFORMANCE COMPARISON WITH JQUERY, MOOTOOLS AND PROTOTYPE>

http://blog.creonfx.com/javascript/dojo-vs-jquery-vs-mootools-vs-prototype-performance-comparison   



Updated: MooTools vs JQuery vs Prototype vs YUI vs Dojo Comparison Revised

As part of my Mootools lecture at Codecamp I showed a brief speed comparison between the most used Javascript Frameworks running in the major browsers. Now as the Mootools team has extended their performance test tool (slickspeed) it is time to revise my benchmarks and extend them over more browser/platforms.

Test results (Lower is better):



*For example FF (XP-NA) is Firefox 2.0.0.12 with no addons (extensions) enabled running under Windows XP

You can check the actual numbers (in ms) and the full browsers information in the table bellow:

Dojo 1.0.2	JQuery 1.2.3	MooTools 1.2beta2	Prototype 1.6.0.2
Mozilla Firefox 2.0.0.12 – no addons – winxp	128	266	115	259
Mozilla Firefox 2.0.0.12 – winxp	144	290	127	260
Mozilla Firefox 2.0.0.12 – linux	253	438	255	384
Opera 9.26 – winxp	32	136	148	194
Opera 9.26 – linux	110	188	238	364
Internet Explorer 7 – no addons – winxp	263	330	662	1563
Internet Explorer 7 – winxp	264	334	674	1583
Internet Explorer 6	387	600	945	2279
Internet Explorer 6 – linux (wine)	692	978	1310	2616
Safari 3.0.4 Beta 3 – winxp	36	76	84	116
Konqueror – linux	324	450	X	X
Conclusions:

Safari under Windows XP is really blazing fast
Mootools and Prototype JS do not work under Konqueror (KDE’s default browser)
Dojo performs great. If we take only these test into consideration it safe to say it is the fastest Javascript Framework
Linux browsers are relatively slower against their Windows versions
Prototype is insanly slow under Internet Explorer
Disclaimer: This benchmark is somehow subjective because the test results depend on the current OS load and other factors. If you have any corrections or comments on this topic I will gladly review them and will revise the results if needed.



    
</entry>
<entry [Thu 2012:02:23 04:37:24 EST] DOJO IN FIREFOX EXTENSION>

http://whymustmybloghaveaname.blogspot.com/2010/06/using-dojo-with-xulrunner.html
FRIDAY, JUNE 11, 2010

Using Dojo with XULRunner
I recently started porting one of my previous research projects, which was originally implemented as a browser extension to Firefox, into a XULRunner application. The advantage of moving to XULRunner is that I will hopefully be able to reuse a bunch of my Firefox extension code, but at the same time I'm hoping to give a lot of that code a revamp. One of the ways that I want to do that is to adopt a better object-oriented approach for my code (or just any object-oriented approach for that matter!), and after not a lot of convincing I decided to go with the object model provided by the Dojo Toolkit.

If you're at all familiar with Dojo, you'll know that it's primarily a toolkit for building browser-based web apps. So how do I go about using it in a Firefox extension or as part of a XULRunner app? It's actually pretty straight-forward, but there's not a lot of documentation. For that reason, I thought I'd throw together this quick blog post both for my own memory and maybe to help out other people who try to do the same thing in the future.

Step #1: Create a custom Dojo build

There are a bunch of resources for how to do this generally, but I'll describe the process quickly. What's most important to know are the few parameters that you'll need to put into your build profile to generate a build of Dojo that will work.

First, download the Dojo SDK. As of today, Dojo downloads are available at http://dojotoolkit.org/download/. Scroll to the bottom of the page to find the SDK, and download either the .tgz or .zip versions depending on which compression method works best for you.

Now we create the custom build. To do this, you need to create a build profile. Some sample build profiles are included in the SDK that you downloaded at < dojo src dir>/util/buildscripts/profiles.

I started by copying the Rhino profile in rhino.profile.js to another file, such as xulrunner.profile.js. In your new build profile, make the following changes:
Change hostenvType = "rhino" to hostenvType = "ff_ext".
Modify the prefixes section as needed to include the Dojo extensions that you need. I personally kept dojox but removed shrinksafe from the Rhino profile. You might want to add other prefixes, though most of the other libraries (such as dijit) have to do with creating widgets and that capability seems less useful in the XULRunner environment.
Once you've got your build profile finished, you need to create the custom build. The command line for this depends on what you named your build profile in the previous step. If you used the name that I specified above, then the command line would be:

< dojo src dir>/util/buildscripts/build.sh profile=xulrunner action=release

This will create a new release directory at the same level as your dojo src directory.

Step #2: Add the Dojo code to your XULRunner project

How you do this depends a bit on the structure of your XULRunner project. Assuming you're creating a normal app and using the standard conventions, you should have a content directory in your XULRunner project which contains a XUL file (let's call it main.xul) that defines the user interface for your main window.

First, copy the dojo release directory that you created in step #1 inside your content directory. I named this directory dojo, and in my configuration the dojo.js file was located at content/dojo/dojo/dojo.js. The remaining description assumes these locations, so make changes as necessary for your application.

To enable Dojo for your project, add the following lines near the top of the main.xul file:
<!--

<script>
    // Specify the name of the package (from chrome.manifest)
    var packageName = "package";
    
    // Determine the current locale so that we can pass it to Dojo
    // Code taken from: 
    // https://developer.mozilla.org/En/How_to_enable_locale_switching_in_a_XULRunner_application
    var chromeRegService = Components.classes["@mozilla.org/chrome/chrome-registry;1"].getService();
    var xulChromeReg = chromeRegService.QueryInterface(Components.interfaces.nsIXULChromeRegistry);
    var selectedLocale = xulChromeReg.getSelectedLocale(packageName);            

    // Create the Dojo configuration structure
    var djConfig = {
        isDebug: true,
        locale: selectedLocale,
        baseUrl: 'chrome://highlightxr/content/dojo/dojo/'
    };
</script>
<script src="chrome://highlightxr/content/dojo/dojo/dojo.js" type="application/x-javascript"/>


-->

Note that internationalization is important to me, so I added some extra code to get the current locale from XULRunner and pass that value to Dojo. That may not matter to you, in which case you can just manually set locale in djConfig to "en-US" or whatever the appropriate string may be. 

You'll also need to insert your own package name in the snippet above. This is the name that you specified in your chrome.manifest file.

I hope that helps!

If you need any help with Dojo, I suggest checking out their web site or looking at Dojo: The Definitive Guide or Mastering Dojo: JavaScript and Ajax Tools for Great Web Experiences.


DON'T NEED ff_ext:

http://old.nabble.com/Re:-Using-dojo-in-a-Firefox-extension-p28257509.html


Hi, 

this tutorial 
(http://o.dojotoolkit.org/forum/dojo-core-dojo-0-9/dojo-core-support/dojo-firefox-extension#comment-20603) 
is for older versions of dojo. You don't need the hostenvType or anything 
else ;) 

When you use dojo 1.4.2. The solution is really trivial. 

Create a build script, e.g. app.profile.js: 
dependencies = { 
        layers: [ 
                { 
                        name: "../app/app.js", 
                        dependencies: [ 
                                "app.test1", 
                                "app.test2" 
                        ] 
                } 
        ], 

        prefixes: [ 
                [ "app", "../app" ] 
        ] 
} 

Make a normal build, e.g.: 
build profile=app action=clean,release releaseName=dojo mini=true 

Implement the builded files in main.xul, e.g.: 
<!--


<script type="application/x-javascript" > 
    var djConfig = { 
        parseOnLoad:false, 
        baseUrl:"chrome://app/content/lib/dojo/release/dojo/dojo/" 
    } 
</script> 
<script src="chrome://app/content/lib/dojo/release/dojo/dojo/dojo.js" 
type="application/x-javascript" /> 
<script src="chrome://app/content/lib/dojo/release/dojo/app/app.js" 
type="application/x-javascript" /> 



-->
Ready! Reload all Chrome! 

Cheerio 






allow Dojo to work in Firefox extensions
http://trac.dojotoolkit.org/ticket/3833


Ticket #3833 (new enhancement)
Opened 5 years ago
Last modified 11 days ago
[patch][cla] allow Dojo to work in Firefox extensions

Reported by:	guest	Owned by:	BryanForbes
Priority:	high	 Milestone:	future
Component:	IO	 Version:	0.9
Keywords:	firefox extension, cometd	 Cc:	 dbrown@…, jburke
Blocked by:		 Blocking:	
Description (last modified by jburke) (diff) 

I have included a patch in unified diff format, that allows Dojo to work within a Firefox extension, while keeping normal browser functionality.

This is in relation to forum post:
http://dojotoolkit.org/forum/dojo-core-dojo-0-9/dojo-core-support/dojo-firefox-extension

This patch updates /dojo.js and /src/io/ScriptScrIO.js

The reason for this patch is that within a Firefox extension there is no Head element to attach the script element too.

ScriptScrIO.js goes one step further then dojo.js and implements the same code as dojo.js but then also implements the ability to use AJAX to get the JS file. The reasoning for this extra step is because the code to add the JS file to the Firefox XUL only allows for the loading of local files. This is a problem if the user is using the cometd section of Dojo. This is because cometd needs to talk to the server which in normal cases is not local to the extension user. Therefore it uses AJAX in to get the source of the external JS file (this AJAX is able to go to a different domain because it is being ran as a extension and therefore has higher security levels). Once AJAX can retrieved the source it URI encodes it and passes it in a, data URI to the Firefox JS load function.

This gives the ability for Dojo to be smart enough to know if it is running in a normal browser window or as a Firefox extension, and also smart enough to know if it needs to load the required JS files from the local machine or from a remote server.

The only other possible requirement to have Dojo work as a Firefox extension is to set the variable: baseRelativePath. This value will be dependent on the developer and therefore was not hard coded to allow developers to easily set this variable like the normally would. In my case I set the variable to:

var djConfig = {
baseRelativePath : "chrome://myExtension/content/dojo/",
};
Files Seperate:
 http://www.port21.com/Code/Dojo/FirefoxExtensionPatch/Dojo-dojo-js-udiff
 http://www.port21.com/Code/Dojo/FirefoxExtensionPatch/Dojo-src-io-ScriptSrcIO-js-udiff

Files Ziped:
 http://www.port21.com/Code/Dojo/FirefoxExtensionPatch/Dojo-FirefoxExtensionPatch.zip

Attachments

Dojo-dojo-js-udiff   (1.1 KB) - added by guest 5 years ago.
Dojo-src-io-ScriptSrcIO-js-udiff   (2.4 KB) - added by guest 5 years ago.
Dojo-FirefoxExtensionPatch.zip   (1.8 KB) - added by guest 5 years ago.
simpleSidebar.tgz   (4.7 KB) - added by peller 3 years ago.
FF extension example, provided by Allen Cypher (IBM, CCLA) See Readme.txt
Change History

Changed 5 years ago by guest

attachment Dojo-dojo-js-udiff   added
Changed 5 years ago by guest

attachment Dojo-src-io-ScriptSrcIO-js-udiff   added
Changed 5 years ago by guest

attachment Dojo-FirefoxExtensionPatch.zip   added
comment:1 Changed 5 years ago by dylan

Keywords extension, cometd added; extension removed
Owner changed from anonymous to alex
Component changed from General to IO
Milestone set to 1.0
comment:2 Changed 4 years ago by peller

Summary changed from Patch to allow Dojo to work in Firefox extensions to [patch][cla needed?] allow Dojo to work in Firefox extensions
Milestone changed from 1.0 to 2.0
dbrown, have you signed a CLA?

comment:3 Changed 4 years ago by guest

Yes I signed one and faxed it in before I submitted this

comment:4 Changed 4 years ago by alex

Status changed from new to assigned
Summary changed from [patch][cla needed?] allow Dojo to work in Firefox extensions to [patch][cla] allow Dojo to work in Firefox extensions
thanks for confirming the CLA. Much appreciated.

comment:5 Changed 4 years ago by alex

Milestone changed from 2.0 to 1.3
Milestone 2.0 deleted

comment:6 Changed 3 years ago by jburke

Cc jburke added
Description modified (diff)
comment:7 Changed 3 years ago by alex

(In [15409]) dev-time support for detecting and loading a XUL-based host-environment. Also adds a host environment file build specifically for use in extensions and a trivial patch to allow the build system to be told that it's in a browser-like environment.

Refs #3833 !strict

comment:8 Changed 3 years ago by jburke

alex: do you have a way to test this or some sort of instructions we could commit that would give a reproducible way to try out the code? There is another ticket open for a windows script host hostenv, and I am hoping to do the same for that one too. It is harder to support these other hostenvs without easy ways to jump in and test them. I am not smart enough to remember how it works unless there is a real test/instructions.

comment:9 Changed 3 years ago by jburke

alex: a couple of other questions:

1) I haven't thought this all the way through, maybe this would not be good: there seems like a good amount of copy/paste with the hostenv_browser. I wonder if we could use some if statements in the hostenv_browser and then use some conditional build comments that test for kwArgs.profileProperties.hostenvType to strip out stuff not needed for normal browser builds. Maybe still need an FF hostenv but it might be smaller.

2) I don't get the buildUtil.js change. I don't see isBrowser defined anywhere in the buildscripts, and no where else in [15409]?

comment:10 Changed 3 years ago by alex

(In [15420]) removing bad impls of createElement() and elem(). Refs #7802. Refs #3833. !strict

comment:11 Changed 3 years ago by alex

James:

WRT the isBrowser, there's a hostenv check on line 355 of buildUtil.js which sets dojo.isBrowser to make sure that you're using browser params for the package system to ensure that the right stuff gets loaded, particularly in _base.js where you might have requireIf statements that exclude some things in non-browser environments. Since FF extensions are "browser++" environments but don't use the browser hostenv, we need another way to set this.

comment:12 Changed 3 years ago by jburke

Alex: what I cannot see is how isBrowser is ever set. Maybe you do this in the build profile perhaps? I wonder if it is worth just changing line 355 from this:

if(hostenvType == "browser" || isBrowser)
to something like this:

if(hostenvType == "browser" || hostenvType == "ff_ext")
comment:13 Changed 3 years ago by bill

Milestone changed from 1.3 to future
Changed 3 years ago by peller

attachment simpleSidebar.tgz   added
FF extension example, provided by Allen Cypher (IBM, CCLA) See Readme.txt

comment:14 Changed 3 years ago by jburke

(In [16774]) Fixes #8669, cannot build rhino hostenv builds, and refs #3833, building Dojo for firefox extensions.

comment:15 Changed 3 years ago by petschm

The environment uses mozIJSSubScriptLoader to load other scripts, it seems the scriptloader doesn't support unicode. When i use it with dojo.currency the currency symbols are not displayed correct. 
I removed the "monkey-patch" with the mozIJSSubScriptLoader and added a nsIScriptableUnicodeConverter to the _getText method and now it works fine.

The drawback is that you don't see any syntax errors with filename and line number anymore.

comment:16 Changed 10 months ago by chrism

Owner alex deleted
Status changed from assigned to new
comment:17 Changed 10 months ago by chrism

Owner set to dylan
comment:18 Changed 11 days ago by bill

Owner changed from dylan to BryanForbes
Bulk change to reassign IO tickets to Bryan, since he is working on new dojo/request module. Some of these tickets should probably be closed as already fixed, invalid, or wontfix.





http://www.mentby.com/treaint/using-dojo-dijits-in-a-firefox-extension.html


Using dojo dijits in a Firefox extension
Last updated: Sat, 26 Feb 2011 08:50:07 -0800 View thread at Dojo Interest
I'm trying to call the dojo.parser.parse() method from within a Firefox 
extension. The method returns an array of all the dijits on the page so it 
needs access to the dijit modules but for some reason I keep getting the 
following error: 
"Could not load class 'dijit.layout.BorderContainer"

Here's a snippet of my code: 
dojo.require("dojo.parser"); 
dojo.require("dijit.layout.BorderContainer"); 
var dijits = dojo.parser.parse();

I added the dojo.require("dijit.layout.BorderContainer"); statement to see 
if that would have any problem accessing the module but that doesn't throw 
any error so it should be looking in the right place... I can't figure out 
why it's not able to load that class for the parse method.

This is what I'm using to import dojo into my extension in my XUL file: 
<!--

<script type="application/x-javascript"> 
var djConfig = { 
hostEnv:"ff_ext", 
baseUrl:"chrome://myextension/content/dojoroot/dojo/" 
}; 
</script> 
<script type="application/x-javascript" 
src="chrome://myextension/content/dojoroot/dojo/dojo.js" /> 
<script type="application/x-javascript" 
src="chrome://myextension/content/dojoroot/dijit/dijit.js" />

-->

Any ideas? Thanks
----- cont. ------
Thanks for the suggestion. I tried wrapping it inside dojo.ready but I'm 
still getting the same error.

I am starting to wonder if there are Firefox extension security restrictions 
that's preventing dojo from accessing the dijit modules. I've been able to 
call core dojo functions without any problems but I haven't been able to 
work with any dijit modules (it seems like I can do dojo.require statements 
for dijit modules).

For example a call such as: 
alert(dijit.registry.length); 
Returns a TypeError: dijit.registry is undefined
----- cont. ------
postoffice - I'll give the custom build a try and let you know how it goes.

Peter - Not in the XUL document itself, but a javascript file referenced in 
it. 
There are two things I am trying to do: 
1) I have a page that is generated by my Firefox extension with a bunch of 
elements that have an "dojoType" attribute. 
Those dijits need to be instantiated by the dojo parser, so I need to run 
dojo.parser.parse() like I explained in my original post. Right now the page 
renders but none of the dijits work. 
2) I want to be able to work with the dijit.registry for my generated page. 
This requires the use of the dijit module which I'm currently unable to use.
----- cont. ------
I created a custom build profile that has dijit.dijit-all as a dependency for 
dojo.js and that resolved the problem, no more class loading errors!

Thanks again for the help.
    
</entry>
<entry [Fri 2012:02:17 09:46:37 EST] DISABLE USER SELECT WITH -moz-user-select >

core/css/controls.css LINE 480:


.controls .tabs  .tabTitle {
   user-select: none !important;
   -o-user-select:none !important;
   -moz-user-select: none !important;
   -khtml-user-select: none !important;
   -webkit-user-select: none !important;
	/*color: white;*/
	font-family: Cursive;
	/*color: darkred;*/
	/* LIGHT PURPLE */
	/*background-color: #BBD;*/
	background-color: #9fdbe6;
	text-align: center;
	vertical-align: middle;
	font-size: 20px;
	font-weight: bold;
	-moz-user-select: none !important;
}


    
</entry>
<entry [Tue 2012:02:14 04:48:36 EST] DOH TEST isVisible IN dijit.Dialog TESTS>

http://localhost/agua/dojo-1.6.1rc2/dijit/tests/Dialog.html

NOTE: dijit.Dialog USES dojo.global.dijit._underlay.domNode

THE Z-INDEX OF THE DIALOG AND UNDERLAY CAN BE ACCESSED:

var dialogZ = dojo.style(dialog.domNode, "zIndex");

var underlayZ = dojo.style(dojo.global.dijit._underlay.domNode, "zIndex");

    
</entry>
<entry [Sat 2012:02:11 13:43:24 EST] Home PANE: SET FLOATING PANE BEHAVIOUR AFTER CLOSE>

OVERRODE close METHOD USING A DOJO HITCH:

setProgressPane : function () {
	console.log("plugins.home.Home.setProgressPane");
	console.dir({progressPane:this.progressPane});

	// SET CLASS
	dojo.attr(this.progressPane.domNode, 'class', 'home progressPane dojoxDialog dijitDialog');

	var thisObject = this;

	this.progressPane.close = dojo.hitch(this, function() {
		console.log("plugins.home.Home.setProgressPane    this.progressPane.close");
		this.progressPane.hide();
		this.timer.stop();
		dojo.attr(this.timer, 'isRunning', false);
	});
},


http://dojotoolkit.org/reference-guide/dojox/layout/FloatingPane.html

Troubleshooting

Width of FloatingPane is equal to the browser view (or the parent DOM node): Make sure to set ‘position:absolute’ in the ‘style’ property of the widget (if making the widget programmatically, make sure CSS styles are set in the constructor, not the DOM node ‘style’ property)
Cannot move the FloatingPane: Always specify values for the ‘top’ and ‘left’ CSS styles (it doesn’t matter what values, just that they are defined). Once again, programmatic FloatingPanes should have their CSS styles set using the constructor ‘style’ property, NOT the DOM node’s ‘style’ property.
Cannot resize FloatingPane using resize handle: This happens when startup() isn’t called. When creating widgets programmatically, always call the startup() method after constructing.
When the widget is closed via the close button, it can no longer be shown: FloatingPane destroys itself when the close button is pressed. You must create a subclass of FloatingPane to override this behavior.
    
    
</entry>
<entry [Wed 2012:01:25 11:14:15 EST] paypal DONATION TEXT>

Find this free service valuable and want to see it grow? Consider donating. Thank you!
    
https://www.paypal.com/en_US/i/btn/btn_donate_LG.gif

</entry>
<entry [Wed 2012:01:25 10:48:52 EST] ADDED QUICKSAND AND NEUTRON FONTS TO aguadev.org>


NB: NICE LIGHT GREEN COMPLETED BACKGROUND-COLOR: #D1F475

NNB: VERY NICE FONT FOR BLOG, QUOTES OR CODE:


font: 16px/26px Megalopolis, Helvetica, Arial, sans-serif;



1. QUICKSAND DEMO - A ROUNDED, CLEAN ART DECO-STYLE FONT
http://www.fontsquirrel.com/fontfacedemo/Quicksand


2. DOWNLOAD AS FONT-FACE KIT GENERATED BY font-squirrel.com

/home/syoung/agua/fonts/Quicksand-font-face


OR USE GOOGLE WEB FONT LINK IN SITE HTML:

<!--

<link href='http://fonts.googleapis.com/css?family=Quicksand:300,400,700' rel='stylesheet' type='text/css'>

-->
OR THIS:

@import url(http://fonts.googleapis.com/css?family=Quicksand:300,400,700);


OR THIS:

<!--
<script type="text/javascript">
  WebFontConfig = {
    google: { families: [ 'Quicksand:300,400,700:latin' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();

</script>
-->

WHICH POINTS TO THIS FILE:

@font-face {
  font-family: 'Quicksand';
  font-style: normal;
  font-weight: 400;
  src: local('Quicksand Regular'), local('Quicksand-Regular'), url('http://themes.googleusercontent.com/static/fonts/quicksand/v2/sKd0EMYPAh5PYCRKSryvWz8E0i7KZn-EPnyo3HZu7kw.woff') format('woff');
}
@font-face {
  font-family: 'Quicksand';
  font-style: normal;
  font-weight: 300;
  src: local('Quicksand Light'), local('Quicksand-Light'), url('http://themes.googleusercontent.com/static/fonts/quicksand/v2/qhfoJiLu10kFjChCCTvGlHhCUOGz7vYGh680lGh-uXM.woff') format('woff');
}
@font-face {
  font-family: 'Quicksand';
  font-style: normal;
  font-weight: 700;
  src: local('Quicksand Bold'), local('Quicksand-Bold'), url('http://themes.googleusercontent.com/static/fonts/quicksand/v2/32nyIRHyCu6iqEka_hbKsnhCUOGz7vYGh680lGh-uXM.woff') format('woff');
}


AND ADD TO CSS:

font-family: 'Quicksand', sans-serif;


    
@font-face {
    font-family: 'NeutonRegular';
    src: url('Neuton-webfont.eot?') format('eot'),
         url('Neuton-webfont.woff') format('woff'),
         url('Neuton-webfont.ttf') format('truetype'),
         url('Neuton-webfont.svg#webfont2gQKTcGt') format('svg');
    font-weight: normal;
    font-style: normal;

}



/* Generated by Font Squirrel (http://www.fontsquirrel.com) on February 11, 2011 02:21:27 PM America/New_York */



@font-face {
    font-family: 'NobileRegular';
    src: url('nobile-webfont.eot?') format('eot'),
         url('nobile-webfont.woff') format('woff'),
         url('nobile-webfont.ttf') format('truetype'),
         url('nobile-webfont.svg#webfontn5VEQQo3') format('svg');
    font-weight: normal;
    font-style: normal;

}

@font-face {
    font-family: 'NobileItalic';
    src: url('nobile_italic-webfont.eot?') format('eot'),
         url('nobile_italic-webfont.woff') format('woff'),
         url('nobile_italic-webfont.ttf') format('truetype'),
         url('nobile_italic-webfont.svg#webfontg7NPy4Pa') format('svg');
    font-weight: normal;
    font-style: normal;

}

@font-face {
    font-family: 'NobileBold';
    src: url('nobile_bold-webfont.eot?') format('eot'),
         url('nobile_bold-webfont.woff') format('woff'),
         url('nobile_bold-webfont.ttf') format('truetype'),
         url('nobile_bold-webfont.svg#webfontQ4gbM52t') format('svg');
    font-weight: normal;
    font-style: normal;

}

@font-face {
    font-family: 'NobileBoldItalic';
    src: url('nobile_bold_italic-webfont.eot?') format('eot'),
         url('nobile_bold_italic-webfont.woff') format('woff'),
         url('nobile_bold_italic-webfont.ttf') format('truetype'),
         url('nobile_bold_italic-webfont.svg#webfontPHzhAcVd') format('svg');
    font-weight: normal;
    font-style: normal;

}
    
</entry>
<entry [Fri 2012:01:13 13:04:53 EST] FIXED CSS FILE RELATIVE LOCATIONS BY USING 'var dojoConfig ...'>

http://livedocs.dojotoolkit.org/dojo/config

CREATE VARIABLE AT TOP OF HTML PAGE:

var dojoConfig = {
	isDebug: true,
	//locale: 'en-us',
	//extraLocale: ['ja-jp'],
	modulePaths: {"plugins": "../../plugins", "t": "../../../t"},
	debugAtAllCosts: true,
	useCommentedJson: true
};

BEFORE DOJO INVOCATION:

<!--
<script type="text/javascript"
	src="dojo-1.6.1rc2/dojo/dojo.js"
>
-->

THESE TWO LOCATIONS:    
    
	dojo.moduleUrl("plugins",  "/workflow/css/controller.css"),
	dojo.moduleUrl("plugins") + "workflow/css/workflow.css"



... GAVE DIFFERENT ERRORS:

"NetworkError: 404 Not Found - http://localhost/workflow/css/controller.css"
controller.css
"NetworkError: 404 Not Found - http://localhost/agua/0.6/dojo-1.6.1rc2/plugins/workflow/css/workflow.css"
    
</entry>
<entry [Mon 2011:12:12 16:03:19 EST] JAVASCRIPT COUNTERPARTS TO CSS STYLE LABELS>

http://www.universalwebservices.net/web-programming-resources/javascript/modify-css-with-javascript

Modify CSS with JavaScript

In certain cases, where a browser does not support standard-compliant CSS, you may need to resort to using JavaScript to achieve a certain stylistic effect.

The following code provides the syntax necessary to use JavaScript to modify styles:

document.getElementById(id_of_element).style.javascript_property = "style";


If only it were that simple! How JavaScript refers to style properties varies a little bit from CSS.  The following table will assist you in finding the correct JavaScript style.

Using the table below, here's a JavaScript example on how to modify the border width property of an element:

<!--

<p id="example">This is an example.</p> 

<script>
  document.getElementById('example').style.borderWidth = '4px';
</script>

-->

CSS Property	JavaScript Property
background	background
background-attachment	backgroundAttachment
background-color	backgroundColor
background-image	backgroundImage
background-position	backgroundPosition
background-repeat	backgroundRepeat
border	border
border-bottom	borderBottom
border-bottom-color	borderBottomColor
border-bottom-style	borderBottomStyle
border-bottom-width	borderBottomWidth
border-color	borderColor
border-left	borderLeft
border-left-color	borderLeftColor
border-left-style	borderLeftStyle
border-left-width	borderLeftWidth
border-right	borderRight
border-right-color	borderRightColor
border-right-style	borderRightStyle
border-right-width	borderRightWidth
border-style	borderStyle
border-top	borderTop
border-top-color	borderTopColor
border-top-style	borderTopStyle
border-top-width	borderTopWidth
border-width	borderWidth
clear	clear
clip	clip
color	color
cursor	cursor
display	display
filter	filter
font	font
font-family	fontFamily
font-size	fontSize
font-variant	fontVariant
font-weight	fontWeight
height	height
left	left
letter-spacing	letterSpacing
line-height	lineHeight
list-style	listStyle
list-style-image	listStyleImage
list-style-position	listStylePosition
list-style-type	listStyleType
margin	margin
margin-bottom	marginBottom
margin-left	marginLeft
margin-right	marginRight
margin-top	marginTop
overflow	overflow
padding	padding
padding-bottom	paddingBottom
padding-left	paddingLeft
padding-right	paddingRight
padding-top	paddingTop
page-break-after	pageBreakAfter
page-break-before	pageBreakBefore
position	position
float	styleFloat
text-align	textAlign
text-decoration	textDecoration
text-decoration: blink	textDecorationBlink
text-decoration: line-through	textDecorationLineThrough
text-decoration: none	textDecorationNone
text-decoration: overline	textDecorationOverline
text-decoration: underline	textDecorationUnderline
text-indent	textIndent
text-transform	textTransform
top	top
vertical-align	verticalAlign
visibility	visibility
width	width
z-index	zIndex

    
</entry>
<entry [Sat 2011:12:10 12:23:02 EST] IMPLEMENTED stacktrace ERROR HANDLING>

https://github.com/eriwen/javascript-stacktrace


How do I use stacktrace.js?
Just include stacktrace.js file on your page, and call it like so:

<!--

<script type="text/javascript" src="path/to/stacktrace.js" />
<script type="text/javascript">
    ... your code ...
    if (errorCondition) {
         var trace = printStackTrace();
         //Output however you want!
         alert(trace.join('\n\n'));
    }
    ... more code of yours ...
</script>

-->
Bookmarklet available on the project home page.

You can also pass in your own Error to get a stacktrace not in IE or Safari, though :(

<!--

<script type="text/javascript">
    var lastError;
    try {
        // error producing code
    } catch(e) {
       lastError = e;
       // do something else with error
    }

    // Returns stacktrace from lastError!
    printStackTrace({e: lastError});
</script>

-->

Some people recommend just assigning it to window.onerror. Make sure that you have script debugging turned off for IE. Only in IE

window.onerror = function(msg, file, line) {
    alert(printStackTrace().join('\n\n'));
}
Function Instrumentation
You can now have any (public or privileged) function give you a stacktrace when it is called:

var p = new printStackTrace.implementation();
p.instrumentFunction(this, 'baz', logStackTrace);
function logStackTrace(stack) {
    console.log(stack.join('\n'));
}
function foo() {
    var a = 1;
    bar();
}
function bar() {
    baz();
}
foo(); //Will log a stacktrace when 'baz()' is called containing 'foo()'!

p.deinstrumentFunction(this, 'baz'); //Remove function instrumentation
    

</entry>
<entry [Thu 2011:12:08 06:36:05 EST] USE handle INSTEAD OF load FOR xhrPut >


    
</entry>
<entry [Sat 2011:12:03 20:42:06 EST] SAVED WIKI ENTRY BEFORE REMOVED agua GITHUB REPO>


Thank you for visiting the Github site of Agua, the NextGen bioinformatics workflow tool and genomic viewer. You'll find source code and development information here. To download the source code, click the 'Downloads' button on the right or download using git with the 'Git Read-Only' URL below. For information on how to install or use Agua, please click the following link: — Read more
http://www.stuartpyoung.com/confluence/agua



    
</entry>
<entry [Sat 2011:11:26 18:19:48 EST] INSTALL JS AS USER SCRIPT IN FIREFOX>


http://userstyles.org/styles/userjs/15119/Hatena%20Bookmark%20%3A%3A%20Auto%20Hide%20Footer.user.js?

    
</entry>
<entry [Tue 2011:11:01 01:32:01 EST] DEBUG DND: SET SUBSCRIPTIONS SUBROUTINE>

,

// *************
// DEBUG
// *************
setSubscriptions : function () {
	// example subscribe to events	
	dojo.subscribe("/dojox/mdnd/adapter/dndToDojo/over", null,  function(arg) {
		console.log("dndToDojo/over");
	});
	dojo.subscribe("/dojox/mdnd/adapter/dndToDojo/out", null, function(arg) {
		console.log("dndToDojo/out");
	});
	dojo.subscribe("/dojox/mdnd/adapter/dndToDojo/drop", null, function(arg) {
		console.log("dndToDojo/drop");
	});
	dojo.subscribe("/dojox/mdnd/adapter/dndToDojo/cancel", null, function(arg) {
		console.log("dndToDojo/cancel");
	});
	
	dojo.subscribe("/dojo/dnd/manager/overSource", function(source){
		console.debug("/dojo/dnd/manager/overSource", source);
	});
	
	dojo.subscribe("/dojox/mdnd/drag/start", function(node, targetArea, indexChild){
		console.dir({node: node});
		console.log("Doing /dojox/mdnd/drag/start    targetArea: ");
		console.dir({targetArea: targetArea})
		console.log("Doing /dojox/mdnd/drag/start    indexChild: " + indexChild);
	});
	
	dojo.subscribe("/dojox/mdnd/drop", null, function(node, targetArea, indexChild){
		console.log("Doing /dojox/mdnd/drop    node: " + node);
		console.log("Doing /dojox/mdnd/drop    targetArea: " + targetArea);
		console.dir({targetArea: targetArea})
		console.log("Doing /dojox/mdnd/drop    indexChild: " + indexChild);
	});
	
	dojo.subscribe("/dojox/mdnd/dropMode.OverDropMode/getDragPoint", function(node, targetArea, indexChild){
		console.log("Doing /dojox/mdnd/dropMode.OverDropMode/getDragPoint    node: " + node);
		console.log("Doing /dojox/mdnd/drop    targetArea: " + targetArea);
		console.dir({targetArea: targetArea})
		console.log("Doing /dojox/mdnd/drop    indexChild: " + indexChild);
	});
	
	//dojo.subscribe("/dojox/mdnd/drag/over", function(source){
	//	console.debug("over", source);
	//});
	
	//dojo.subscribe("/dojox/mdnd/drag/cancel", function(source, nodes, copy, target) {
	//	console.debug("cancel", source);
	//});
	
	//dojo.subscribe("/dojox/mdnd/out", function(source){
	//	console.debug("out", source);
	//});
	//dojo.subscribe("/dojox/mdnd/cancel", function(source){
	//	console.debug("cancel", source);
	//});	
},


    
</entry>
<entry [Sat 2011:08:13 07:23:14 EST] DOJO CUSTOM COMPONENTS>

// REFERENCE SITES

// Object Oriented concepts and inheritance
// http://dojotoolkit.org/book/dojo-book-0-4/part-3-dojo-programming-model/object-oriented-concepts-and-inheritance

// BIOMART
//http://www.ensembl.org/biomart/martview/e61a39e4e8e306354f8f2a7a70bbc53c/e61a39e4e8e306354f8f2a7a70bbc53c

// DOJO DEMOS
//http://localhost:8080/Bioptic0.2.5/html/dojo-1.5.0/demos/
//http://localhost:8080/Bioptic0.2.5/html/dojo-1.5.0/dojox/form/tests/test_SelectStack.html

//Real World Dojo part 5: Custom Components
//http://www.dotnetmafia.com/blogs/jamesashley/archive/2008/10/28/761.aspx
    
    
</entry>
<entry [Mon 2011:07:25 04:17:48 EST] REGEX FOR convertBackslash>

PROBLEM:

NEED TO CONVERT BACKSLASHES:

	\\\\\\ 	TO-AND-FROM 	\\\
	\\\\ 	TO-AND-FROM		\\

	E.G., i x 10		TO-AND-FROM		i x 5
			\\\\\\ 		TO-AND-FROM		\\\
		+	\\\			TO-AND-FROM		\\	


BUT WHEN THE NUMBER OF BACKSLASHES IS INCONVENIENT (NOT A NICE COMBO OF 6+4/3+2), I GET AN ODD '\\' LEFT OVER FOR COMPRESSION OR '\' FOR EXPANSION WHICH CAN'T BE DONE BECAUSE BACKSLASH IS THE ESCAPE CHARACTER, E.G.:
    
		i x 14
			\\\\\\				\\\
			\\\\\\				\\\
			\\			?

SOLUTION:

USE THE string.replace FUNCTION AND SPECIFY A FUNCTION INSTEAD OF A STRING AS THE REPLACEMENT:

convertBackslash : function (string, type) {
	//console.log("    Common.convertBackslash    plugins.core.Common.convertBackslash(string)");	
	var multiplyString = function (string, num) {
		if (!num) return "";
		var newString = string;
		while (--num) newString += string;
		return newString;
	};

	var compress = function(match) {
		return multiplyString("\\", (match.length / 2));
	};
	
	var expand = function(match) {
		return multiplyString("\\", (match.length * 2));
	};

    if ( type == "compress" ) { 
        string = string.replace(/\\+/g, compress);
    }
    if ( type == "expand" ) { 
        string = string.replace(/\\+/g, expand);
    }
    //console.log("returning string:" + string);
    
    return string;
},



try {

var string = "\\\\\\\\and\\\\";

console.log("Doing expand");
var result = Agua.convertBackslash(string, "expand");
console.log("string: " + dojo.toJson(string));
console.log("result: " + dojo.toJson(result));

console.log("Doing compress");
result = Agua.convertBackslash(string, "compress");
console.log("string: " + dojo.toJson(string));
console.log("result: " + dojo.toJson(result));

}
catch (error) {
    console.log("error: " + error);
}




NOTES
-----

https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/String/replace

Specifying a function as a parameter

You can specify a function as the second parameter. In this case, the function will be invoked after the match has been performed. The function's result (return value) will be used as the replacement string. (Note: the above-mentioned special replacement patterns do not apply in this case.) Note that the function will be invoked multiple times for each full match to be replaced if the regular expression in the first parameter is global.

The arguments to the function are as follows:

Possible name	Supplied value
str	The matched substring. (Corresponds to $& above.)
p1, p2, ...	The nth parenthesized submatch string, provided the first argument to replace was a RegExp object. (Correspond to $1, $2, etc. above.)
offset	The offset of the matched substring within the total string being examined. (For example, if the total string was "abcd", and the matched substring was "bc", then this argument will be 1.)
s	The total string being examined.
(The exact number of arguments will depend on whether the first argument was a RegExp object and, if so, how many parenthesized submatches it specifies.)

The following example will set newString to "XXzzzz - XX , zzzz":


function replacer(str, p1, p2, offset, s)
{
    return str + " - " + p1 + " , " + p2;
}

var newString = "XXzzzz".replace(/(X*)(z*)/, replacer);
Examples

Example: Using global and ignore with replace

In the following example, the regular expression includes the global and ignore case flags which permits replace to replace each occurrence of 'apples' in the string with 'oranges'.


var re = /apples/gi;

var str = "Apples are round, and apples are juicy.";

var newstr = str.replace(re, "oranges");

print(newstr);
In this version, a string is used as the first parameter and the global and ignore case flags are specified in the flags parameter.


var str = "Apples are round, and apples are juicy.";

var newstr = str.replace("apples", "oranges", "gi");

print(newstr);
Both of these examples print "oranges are round, and oranges are juicy."

Example: Defining the regular expression in replace

In the following example, the regular expression is defined in replace and includes the ignore case flag.


var str = "Twas the night before Xmas...";

var newstr = str.replace(/xmas/i, "Christmas");

print(newstr);
This prints "Twas the night before Christmas..."

Example: Switching words in a string

The following script switches the words in the string. For the replacement text, the script uses the $1 and $2 replacement patterns.


var re = /(\w+)\s(\w+)/;

var str = "John Smith";

var newstr = str.replace(re, "$2, $1");

print(newstr);
This prints "Smith, John".

Example: Using an inline function that modifies the matched characters

In this example, all occurrences of capital letters in the string are converted to lower case, and a hyphen is inserted just before the match location. The important thing here is that additional operations are needed on the matched item before it is given back as a replacement.

The replacement function accepts the matched snippet as its parameter, and uses it to transform the case and concatenate the hyphen before returning.


function styleHyphenFormat(propertyName)
{
    function upperToHyphenLower(match)
    {
        return '-' + match.toLowerCase();
    }
    return propertyName.replace(/[A-Z]/, upperToHyphenLower);
}

Given styleHyphenFormat('borderTop'), this returns 'border-top'.

Because we want to further transform the result of the match before the final substitution is made, we must use a function. This forces the evaluation of the match prior to the toLowerCase() method. If we had tried to do this using the match without a function, the toLowerCase() would have no effect.


var newString = propertyName.replace(/[A-Z]/, '-' + '$&'.toLowerCase());  // won't work
This is because '$&'.toLowerCase() would be evaluated first as a string literal (resulting in the same '$&') before using the characters as a pattern.

Example: Replacing a Fahrenheit degree with its Celsius equivalent

The following example replaces a Fahrenheit degree with its equivalent Celsius degree. The Fahrenheit degree should be a number ending with F. The function returns the Celsius number ending with C. For example, if the input number is 212F, the function returns 100C. If the number is 0F, the function returns -17.77777777777778C.

The regular expression test checks for any number that ends with F. The number of Fahrenheit degree is accessible to the function through its second parameter, p1. The function sets the Celsius number based on the Fahrenheit degree passed in a string to the f2c function. f2c then returns the Celsius number. This function approximates Perl's s///e flag.


function f2c(x)
{
    function convert(str, p1, offset, s)
    {
        return ((p1-32) * 5/9) + "C";
    }

    var s = String(x);
    var test = /(\d+(?:\.\d*)?)F\b/g;
    return s.replace(test, convert);
}







Thanks for your answer Howard. Anyway I found another way to do it. It seems that you can pass a function as the 2nd argument of the replace function. This function will then be called when a match is found in the string with the parameters matched string, matches in parenthesis if any, offset of the match in the string and the entire string. Then the match will be replaced by the string returned from this function

str. replace(/(=")(\s+)/g, function(match,p1,p2,offset,str){return match.replace(/\s/g,"$")})
link|improve this answer
answered Jul 13 at 18:32
user843241
362
feedback

up vote
1
down vote
You can use the function match and join the result afterwards.

m = str.match(/(.*)(=")(\s+)(.*)/);
str = m[1]+m[2]+m[3].replace(/\s/g, "$")+m[4];


    
</entry><entry [Sun 2011:07:24 00:25:12 EST] INSTALLED DOJO 1.6.1rc2>


cd /data/apps/dojo
wget http://download.dojotoolkit.org/release-1.6.1rc2/dojo-release-1.6.1rc2-src.tar.gz

wget http://download.dojotoolkit.org/release-1.6.1rc2/dojo-release-1.6.1rc2-demos.tar.gz
  
</entry>
<entry [Sat 2011:07:23 23:51:13 EST] INSTALLED DOJO 1.7.0b4>

1. DOWNLOADED 1.7.0b4

wget http://download.dojotoolkit.org/release-1.7.0b4/dojo-release-1.7.0b4-src.zip

2. ADDED 


3. FIXED XHR 404 'COULD NOT FIND dojo/dom-geometry' ERROR BY EDITING dojo/uacss.js

REPLACED THIS:

define(["./_base/kernel", "./dom-geometry", "./_base/lang", "./ready", "./_base/sniff", "./_base/window"], function(dojo){

WITH THIS:

define(["./_base/kernel", "./dom/geometry", "./_base/lang", "./ready", "./_base/sniff", "./_base/window"], function(dojo){
	// module:



FIXED THIS ERROR IN COMBOBOX:

_this.store.query

    
</entry>

<entry [Sat 2011:07:23 22:10:10 EST] MODIFICATIONS TO dojo-1.6.1>

TO GET reloader TO WORK, HAD TO MODIFY THE DOJO SOURCE CODE BY ADDING TO dojo._base._loader.hostenv_browser._getText AT LINE 160:

			if ( d == null ) 	d = dojo;

THE FULL TEXT:


		d._getText = function(/*URI*/ uri, /*Boolean*/ fail_ok){
			// summary: Read the contents of the specified uri and return those contents.
			// uri:
			//		A relative or absolute uri. If absolute, it still must be in
			//		the same "domain" as we are.
			// fail_ok:
			//		Default false. If fail_ok and loading fails, return null
			//		instead of throwing.
			// returns: The response text. null is returned when there is a
			//		failure and failure is okay (an exception otherwise)

			// NOTE: must be declared before scope switches ie. this._xhrObj()


			//console.log("dojo._base.loader.hostenv_browser._getText   dojo._base.loader.hostenv_browser._getText(uri, fail_ok)");
			//console.log("dojo._base.loader.hostenv_browser._getText   uri: " + uri);
			//console.log("dojo._base.loader.hostenv_browser._getText   fail_ok: " + fail_ok);
			//console.log("dojo._base.loader.hostenv_browser._getText   d: " + d);
			if ( d == null ) 	d = dojo;

			var http = d._xhrObj();

			if(!hasBase && dojo._Url){
				uri = (new dojo._Url(owloc, uri)).toString();
			}

			if(d.config.cacheBust){
				//Make sure we have a string before string methods are used on uri
				uri += "";
				uri += (uri.indexOf("?") == -1 ? "?" : "&") + String(d.config.cacheBust).replace(/\W+/g,"");
			}

			http.open('GET', uri, false);
			try{
				http.send(null);
				if(!d._isDocumentOk(http)){
					var err = Error("Unable to load "+uri+" status:"+ http.status);
					err.status = http.status;
					err.responseText = http.responseText;
					throw err;
				}
			}catch(e){
				if(fail_ok){ return null; } // null
				// rethrow the exception
				throw e;
			}
			return http.responseText; // String
		}


</entry>
<entry [Wed 2011:07:20 07:33:46 EST] USE dojo["require"] INSTEAD OF dojo.require TO AVOID ERROR IN PLUGIN MANAGER: 'TypeError: Cannot call method "split" of undefined'>

    {
        //try {
        //	
        //	var Class = this.name;
        
            // NB: DON'T USE dojo.require TO AVOID THIS ERROR
            // error loading uri: ./../../../builds/004/dojo/plugins/core/Plugin.js, exception:
            //  TypeError: Cannot call method "split" of undefined

        
            if ( dojo["require"](this.name) )
            {
                // setInstalled IF LOAD SUCCEEDED
                this.installed = true;
                return 1;
            }
            else
            {
                //console.log("Could not install plugin: " + this.name);
                return 0;
            }
        //}
        //catch (e) {};

  
</entry>
file:///home/syoung/agua/fonts/Quicksand-webfont-kit/demo.html

</entry>