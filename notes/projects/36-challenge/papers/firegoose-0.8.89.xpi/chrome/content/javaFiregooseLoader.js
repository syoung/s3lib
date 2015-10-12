/*
 * Copyright (C) 2007 by Institute for Systems Biology,
 * Seattle, Washington, USA.  All rights reserved.
 *
 * This source code is distributed under the GNU Lesser
 * General Public License, the text of which is available at:
 *   http://www.gnu.org/copyleft/lesser.html
 */


/**
 * load the java class FireGoose from inside the xpi file.
 * Based loosely on http://simile.mit.edu/java-firefox-extension/
 */
var javaFiregooseLoader = {
	_goose: null,
	_classLoader: null,
	_packages: null,

	init: function() {
		dump("initializing JavaFiregooseLoader...\n");
		dump("Java version: " + java.lang.System.getProperty("java.version") + "\n");

		// create our class loader
		var jars = ["firegoose-deps.jar", "firefoxClassLoader.jar"];
		this._createClassLoader(jars);

		// create the goose object
		this._goose = this._createJavaFiregooseObject();
	},

	getGoose: function() {
		return this._goose;
	},

	createNetwork: function() {
		dump("create Network\n");
		return this._packages.getClass("org.systemsbiology.gaggle.core.datatypes.Network").callConstructor([]);
	},

	/**
	 * takes 3 strings naming the two nodes to be connected, and
	 * the type of interaction the new edge represents.
	 */
	createInteraction: function(source, target, interactionType) {
		var args = this.toJavaArray(java.lang.String, [source, target, interactionType]);
		return this._packages.getClass("org.systemsbiology.gaggle.core.datatypes.Interaction").callConstructor(args);
	},

	createDataMatrix: function() {
		dump("create DataMatrix\n");
		return this._packages.getClass("org.systemsbiology.gaggle.core.datatypes.DataMatrix").callConstructor([]);
	},

	/**
	 * Convert a javascript array 'a' to an array of arrayClass. For example, to
	 * create an array of Strings call toJavaArray(java.lang.String, jsarray) and
	 * to create an array of the primitive type double from a js array of floats
	 * call toJavaArray(java.lang.Double.TYPE, jsarray). This conversion is necessary
	 * due to changes (bugs?) in the way Firefox 3 performs conversions when calling
	 * java methods from withing javascript.
	 */
	toJavaArray: function(arrayClass, a) {
		var javaArray = java.lang.reflect.Array.newInstance(arrayClass, a.length);
		for (var i = 0; i < a.length; i++) {
			var element = a[i];
			java.lang.reflect.Array.set(javaArray, i, element);
		}
		return javaArray;
	},

	/**
	 * Converts a 2D array of js Floats to a 2D java array of doubles.
	 */
	toJavaDoubleMatrix: function(data) {
		dump("converting...\n");
		var dimensions = java.lang.reflect.Array.newInstance(java.lang.Integer.TYPE, 2);
		dimensions[0] = data.length;
		dump("length = " + data.length + "\n");
		var java2dArrayOfDouble = java.lang.reflect.Array.newInstance(java.lang.Double.TYPE, dimensions);

		for (var i=0; i < data.length; i++) {
			dump("data[i] = " + data[i] + "\n");
			java2dArrayOfDouble[i] = this.toJavaArray(java.lang.Double.TYPE, data[i]);
		}
		return java2dArrayOfDouble;
	},

	printToJavaConsole: function(s) {
		this._goose.println(s);
	},

	/**
	 * test our ability to create and communicate with java objects.
	 */
	test: function() {
		dump("\n\n\n----------------========================================----------------\n");
		dump("testing JavaFiregooseExtension...\n\n");

		dump("goose    = " + this._goose + "\n");
		dump("packages = " + this._packages + "\n\n");

		dump("Let's try creating an interaction:\n");
		var interaction = this.createInteraction("this", "that", "link");
		dump("interaction = " + interaction + "\n");

		dump("\nCreating a network:\n");
		var network = this.createNetwork();
		network.add(interaction);
		dump("network = " + network + "\n");
		
		var data = [ [0.1, 0.2], [0.3, 0.4], [0.5, 0.6] ];

		dump("Creating a data matrix:\n");
		var matrix = this.createDataMatrix();
		matrix.setShortName("TestMatrix");
		matrix.setSpecies("Moose");
		matrix.setColumnTitles(this.toJavaArray(java.lang.String, ["first", "next"]));
		matrix.setRowTitles(this.toJavaArray(java.lang.String, ["a", "b", "c"]));
		matrix.setRowTitlesTitle("Test");
		matrix.set(this.toJavaDoubleMatrix(data));
		// note: a new data matrix created with the noarg constructor returns
		// "null" from its toString method.
		dump("matrix = \n" + matrix + "\n");
	},
	
	testToJavaArray: function() {
		dump("\n\n\n----------------========================================----------------\n");
		dump("testing JavaFiregooseExtension.toJavaArray(type, array)\n\n");
		
		var a = ["asdf", "qwer", "foo", "bar"];
		var ja = this.toJavaArray(java.lang.String, a);
		dump("java array = " + java.util.Arrays.toString(ja) + "\n\n");
	},


	/**
	 * given an array of jars located in components/lib/, create a classloader
	 * that can load classes from those jars or from the components/classes/
	 * within the XPI file.
	 */
    _createClassLoader: function(jars) {
		try
		{
			// figure out the file system path to the XPI file
			var chromeRegistry =
				Components.classes["@mozilla.org/chrome/chrome-registry;1"]
					.getService(Components.interfaces.nsIChromeRegistry);

			var uri =
				Components.classes["@mozilla.org/network/standard-url;1"]
					.createInstance(Components.interfaces.nsIURI);

			// convert chrome URLs to paths using what's in the chrome.manifest file
			uri.spec = "chrome://firegoose/content/";

			var path = chromeRegistry.convertChromeURL(uri);
			if (typeof(path) == "object") {
				path = path.spec;
			}
			path = path.substring(0, path.indexOf("/chrome/") + 1);

			dump("path to extension = " + path + "\n");

			//path = decodeURI(path);
			var pathToClasses = path + "components/classes/";

			var classpathEntries = new Array();
			classpathEntries.push(pathToClasses);

			// add jars
			// would it be too tricky to try and just load all jars in lib?
			for (var i in jars) {
				classpathEntries.push(path + "components/lib/" + jars[i]);
			}

			// ff3 gives an error when we call the URLClassLoader constructor, unless we
			// manually convert the array to a java java.net.URL[] 
			// InternalError: Unable to convert JavaScript value [...] to Java value of type java.net.URL[]
			var javaUrls = this._toJavaUrlArray(classpathEntries);

			var policy = java.security.Policy.getPolicy();


			// We need to load a custom classloader. First, we use the bootstrap
			// classloader in order to load URLSetPolicy, which allows us to give
			// ourselves extra permissions.
			var bootstrapClassLoader = new java.net.URLClassLoader(javaUrls);

			var policyClass = java.lang.Class.forName(
				"edu.mit.simile.firefoxClassLoader.URLSetPolicy",
				true,
				bootstrapClassLoader);
			var policy = policyClass.newInstance();

			policy.setOuterPolicy(java.security.Policy.getPolicy());
			dump(".");
			java.security.Policy.setPolicy(policy);
			dump(".");
			policy.addPermission(new java.security.AllPermission());
			dump(".");

			for (var i=0; i<javaUrls.length; i++) {
				policy.addURL(javaUrls[i]);
				dump(".");
			}

			dump("\n");

			// finally, create the permissioned classloader that we'll use to
			// load the rest of our goodies.
			this._classLoader = new java.net.URLClassLoader(javaUrls);

			var t = java.lang.Thread.currentThread().setContextClassLoader(this._classLoader);

			var packagesClass = this._classLoader.loadClass("edu.mit.simile.firefoxClassLoader.Packages");
			this._packages = packagesClass.newInstance();
		}
		catch (e)
		{
			dump(e + "\n");
		}
    },

	/**
	 * Use our classloader to create and return an instance of FireGoose.
	 */
	_createJavaFiregooseObject: function() {
		var gooseClass = this._classLoader.loadClass("org.systemsbiology.gaggle.geese.firegoose.FireGoose");
		if (gooseClass == null) {
			dump("Goose class not found on classpath:\n");
			var urls = this._classLoader.getURLs();
			for (var i in urls) {
				dump(urls[i] + "\n");
			}
			return null;
		}
		var goose = gooseClass.newInstance();
		dump("goose = " + goose + "\n");
		dump("Goose name = " + goose.getName() + "\n");

		return goose;
	},

	// from http://simile.mit.edu/repository/java-firefox-extension/firefox/chrome/content/scripts/browser-overlay.js
	_toJavaUrlArray: function(a) {
		var dummyUrl = new java.net.URL("http://gaggle.systemsbiology.org");
		var urlArray = java.lang.reflect.Array.newInstance(dummyUrl.getClass(), a.length);
		for (var i = 0; i < a.length; i++) {
			var url = a[i];
			java.lang.reflect.Array.set(
				urlArray,
				i,
				(typeof url == "string") ? new java.net.URL(url) : url
			);
		}
		return urlArray;
	}
};

// initialize when loaded
javaFiregooseLoader.init();

// test ability to load java classes and create gaggle data objects
//javaFiregooseLoader.test();

