/*----------------------------------------------------------------------
 * Adapted from FooComponent from the Java-Firefox-Extension by
 * dfhuynh at csail.mit.edu.
 *----------------------------------------------------------------------
 */

/*
 *  ATTENTION
 *
 *  Firefox is very very unforgiving to syntax errors in XPCOM Javascript
 *  files. If this file does not parse properly once, it might not be
 *  loaded again even if you restart Firefox. Watch the JavaScript
 *  Console for any error message (only logged the first time the file
 *  fails to parse).
 *
 *  You might have to uninstall the whole extension, restart Firefox,
 *  reinstall the extension (with fixes), and then restart Firefox.
 */

function _printToJSConsole(msg) {
    Components.classes["@mozilla.org/consoleservice;1"]
        .getService(Components.interfaces.nsIConsoleService)
            .logStringMessage(msg);
}

/*----------------------------------------------------------------------
 * The Module (instance factory)
 *----------------------------------------------------------------------
 */

var JavaObjectFactoryModule = {
    /*
     *  VERY IMPORTANT: Modify these first 3 fields to make them unique
     *  to your components. Note that these fields have nothing to
     *  do with the extension ID, nor the IDL interface IDs that the
     *  component implements. A component can implement several interfaces.
     */
    _myComponentID : Components.ID("{67D98232-0AB5-4B7A-B217-3AD5F92D9F3B}"),
    _myName :        "The JavaObjectFactory XPCOM component",
    _myContractID :  "@systemsbiology.org/java-object-factory;1",

    /*
     *  This flag specifies whether this factory will create only a
     *  single instance of the component.
     */
    _singleton :     true,
    _myFactory : {
        createInstance : function(outer, iid) {
            if (outer != null) {
                throw Components.results.NS_ERROR_NO_AGGREGATION;
            }

            var instance = null;

            if (this._singleton) {
                instance = this.theInstance;
            }

            if (!(instance)) {
                instance = new JavaObjectFactory();
            }

            if (this._singleton) {
                this.theInstance = instance;
            }

            return instance.QueryInterface(iid);
        }
    },

    registerSelf : function(compMgr, fileSpec, location, type) {
        compMgr = compMgr.QueryInterface(Components.interfaces.nsIComponentRegistrar);
        compMgr.registerFactoryLocation(
            this._myComponentID,
            this._myName,
            this._myContractID,
            fileSpec,
            location,
            type
        );
    },

    unregisterSelf : function(compMgr, fileSpec, location) {
        compMgr = compMgr.QueryInterface(Components.interfaces.nsIComponentRegistrar);
        compMgr.unregisterFactoryLocation(this._myComponentID, fileSpec);
    },

    getClassObject : function(compMgr, cid, iid) {
        if (cid.equals(this._myComponentID)) {
            return this._myFactory;
        } else if (!iid.equals(Components.interfaces.nsIFactory)) {
            throw Components.results.NS_ERROR_NOT_IMPLEMENTED;
        }

        throw Components.results.NS_ERROR_NO_INTERFACE;
    },

    canUnload : function(compMgr) {
        /*
         *  Do any unloading task you want here
         */
        return true;
    }
}

/*
 *  This function NSGetModule will be called by Firefox to retrieve the
 *  module object. This function has to have that name and it has to be
 *  specified for every single .JS file in the components directory of
 *  your extension.
 */
function NSGetModule(compMgr, fileSpec) {
    return JavaObjectFactoryModule;
}




/*----------------------------------------------------------------------
 * The JavaObjectFactory, formerly Foo Component, implemented as a
 * Javascript function.
 *----------------------------------------------------------------------
 */

function JavaObjectFactory() {
    /*
     *  This is a XPCOM-in-Javascript trick: Clients using an XPCOM
     *  implemented in Javascript can access its wrappedJSObject field
     *  and then from there, access its Javascript methods that are
     *  not declared in any of the IDL interfaces that it implements.
     *
     *  Being able to call directly the methods of a Javascript-based
     *  XPCOM allows clients to pass to it and receive from it
     *  objects of types not supported by IDL.
     */
    this.wrappedJSObject = this;

    this._initialized = false;
    this._piggyBankInstance = null;
    this._packages = null;
    this._goose = null;
}

/*
 *  nsISupports.QueryInterface
 */
JavaObjectFactory.prototype.QueryInterface = function(iid) {
    /*
     *  This code specifies the interfaces supported by the
     *  component
     */
    if (!iid.equals(Components.interfaces.IObjectFactory) &&
        !iid.equals(Components.interfaces.nsISupports)) {
        throw Components.results.NS_ERROR_NO_INTERFACE;
    }
    return this;
};

/*
 *  Initializes this component, including loading JARs.
 */
JavaObjectFactory.prototype.initialize = function (java, trace) {
    if (this._initialized) {
        return true;
    }

    this._traceFlag = (trace);

    this._trace("JavaObjectFactory.initialize {");
    try {
        var extensionPath = this._getExtensionPath("firegoose");

        /*
         *  Bootstrap our class loading mechanism
         */
        this._bootstrapClassLoader(java, extensionPath);

        /*
         *  Enumerate URLs to our JARs and class directories
         */
        var libPath = extensionPath + "components/lib/";
        var jarFilenames = [
            "firegoose-deps.jar"
        ];

        var paths = [extensionPath + "components/classes/"];
        for (var i = 0; i < jarFilenames.length; i++) {
            paths.push(libPath + jarFilenames[i]);
        }

        /*
         *  Load them up!
         */
        this._packages = this._loadJava(java, paths);

        /*
         *  Create Goose object
         */
        this._goose = this._packages.getClass("org.systemsbiology.gaggle.geese.firegoose.FireGoose").n();

        this._initialized = true;
    } catch (e) {
        this._fail(e);
        this._trace(this.error);
    }
    this._trace("} JavaObjectFactory.initialize");

    return this._initialized;
};

/*
 *  Returns the packages of all the JARs that this component has loaded.
 */
JavaObjectFactory.prototype.getPackages = function() {
    this._trace("JavaObjectFactory.getPackages");
    return this._packages;
};

/**
 * Returns a singleton instance of Goose
 */
JavaObjectFactory.prototype.getGoose = function() {
    this._trace("JavaObjectFactory.getGoose");
    return this._goose;
};

/**
 *  Returns a new instance of Network.
 */
JavaObjectFactory.prototype.createNetwork = function() {
    this._trace("JavaObjectFactory.createNetwork");
    return this._packages.getClass("org.systemsbiology.gaggle.core.datatypes.Network").n();
}

/**
 *  Returns a new instance of Interaction.
 */
JavaObjectFactory.prototype.createInteraction = function(source, target, interactionType) {
    return this._packages.getClass("org.systemsbiology.gaggle.core.datatypes.Interaction").n(source, target, interactionType);
}

/**
 *  Returns a new instance of DataMatrix.
 */
JavaObjectFactory.prototype.createDataMatrix = function() {
    this._trace("JavaObjectFactory.createDataMatrix");
    return this._packages.getClass("org.systemsbiology.gaggle.core.datatypes.DataMatrix").n();
}

/*
 *  Returns the Test object instantiated by default.
 */
JavaObjectFactory.prototype.getTest = function() {
    this._trace("JavaObjectFactory.getTest");
    return this._test;
};



JavaObjectFactory.prototype._fail = function(e) {
    if (e.getMessage) {
        this.error = e + ": " + e.getMessage() + "\n";
        while (e.getCause() != null) {
            e = e.getCause();
            this.error += "caused by " + e + ": " + e.getMessage() + "\n";
        }
    } else {
        this.error = e;
    }
};

JavaObjectFactory.prototype._bootstrapClassLoader = function(java, extensionPath) {
    if (this._bootstraped) {
        return;
    }

    this._trace("JavaObjectFactory._bootstrapClassLoader {");

    var firefoxClassLoaderURL =
        new java.net.URL(extensionPath + "components/lib/firefoxClassLoader.jar");
        
    // this produces an error in FF3 that the string value of the URL can't
    // be converted into a java array of URLs.

    /*
     *  Step 1. Load the bootstraping firefoxClassLoader.jar.
     */
    var bootstrapClassLoader = java.net.URLClassLoader.newInstance([ firefoxClassLoaderURL ]);

    /*
     *  Step 2. Instantiate a URLSetPolicy object from firefoxClassLoader.jar.
     */
    var policyClass = java.lang.Class.forName(
        "edu.mit.simile.firefoxClassLoader.URLSetPolicy",
        true,
        bootstrapClassLoader
    );
    var policy = policyClass.newInstance();

    /*
     *  Step 3. Now, the trick: We wrap our own URLSetPolicy around
     *  the current security policy of the JVM security manager. This
     *  allows us to give our own Java code whatever permission we
     *  want, even though Firefox doesn't give us any permission.
     */
    policy.setOuterPolicy(java.security.Policy.getPolicy());
    java.security.Policy.setPolicy(policy);

    /*
     *  Step 4. Give ourselves all permission. Yay!
     */
    policy.addPermission(new java.security.AllPermission());

    /*
     *  That's pretty much it for the security bootstraping hack. But we want to
     *  do a little more. We want our own class loader for subsequent JARs that
     *  we load.
     */

    /*
     *  Step 5. Reload firefoxClassLoader.jar and so we can make use of
     *  TracingClassLoader. We need to reload it because when it was
     *  loaded previously, we had not yet set the policy to give it
     *  enough permission for loading classes.
     */

    policy.addURL(firefoxClassLoaderURL);

    var firefoxClassLoaderPackages = new WrappedPackages(
        java,
        java.net.URLClassLoader.newInstance([ firefoxClassLoaderURL ])
    );
    var tracingClassLoaderClass =
        firefoxClassLoaderPackages.getClass("edu.mit.simile.firefoxClassLoader.TracingClassLoader");

    /*
     *  That's it. These are the only 3 things we
     *  need for loading more code.
     */
    this._firefoxClassLoaderURL = firefoxClassLoaderURL;
    this._policy = policy;
    this._tracingClassLoaderClass = tracingClassLoaderClass;

    this._bootstraped = true;

    this._trace("} JavaObjectFactory._bootstrapClassLoader");
};

JavaObjectFactory.prototype._loadJava = function(java, jarURLStrings) {
    this._trace("JavaObjectFactory._loadJava {");

    var jarURLs = [];

    /*
     *  We include the firefoxClassLoader.jar again whenever we
     *  load more JARs so that we can use various reflection
     *  utility classes in firefoxClassLoader.jar on these
     *  JARs.
     */
     jarURLs.push(this._firefoxClassLoaderURL);
     this._policy.addURL(jarURLs[0]);

    /*
     *  Now we add the rest of the JARs.
     */
    for (var i = 0; i < jarURLStrings.length; i++) {
        var jarURL = new java.net.URL(jarURLStrings[i]);
        jarURLs.push(jarURL);
        this._trace("url= "+jarURL);

        this._policy.addURL(jarURL); // include the URL in the policy
    }

    /*
     *  Create a new TracingClassLoader
     */
    var classLoader = this._tracingClassLoaderClass.m("newInstance")(this._traceFlag);

    /*
     *  Give it the JARS
     */
    for (var i = 0; i < jarURLs.length; i++) {
        classLoader.add(jarURLs[i]);
    }
    java.lang.Thread.currentThread().setContextClassLoader(classLoader);

    /*
     *  Wrap up the class loader and return
     */
    var packages = new WrappedPackages(java, classLoader);

    this._trace("} JavaObjectFactory._loadJava");

    return packages;
}

JavaObjectFactory.prototype._trace = function (msg) {
    if (this._traceFlag) {
        _printToJSConsole(msg);
    }
}

/*
 *  Get the file path to the installation directory of this
 *  extension.
 */
JavaObjectFactory.prototype._getExtensionPath = function(extensionName) {
    var chromeRegistry =
        Components.classes["@mozilla.org/chrome/chrome-registry;1"]
            .getService(Components.interfaces.nsIChromeRegistry);

    var uri =
        Components.classes["@mozilla.org/network/standard-url;1"]
            .createInstance(Components.interfaces.nsIURI);

    uri.spec = "chrome://" + extensionName + "/content/";

    var path = chromeRegistry.convertChromeURL(uri);
    if (typeof(path) == "object") {
        path = path.spec;
    }

    path = path.substring(0, path.indexOf("/chrome/") + 1);

    return path;
};

/*
 *  Retrieve the file path to the user's profile directory.
 *  We don't really use it here but it might come in handy
 *  for you.
 */
JavaObjectFactory.prototype._getProfilePath = function() {
    var fileLocator =
        Components.classes["@mozilla.org/file/directory_service;1"]
            .getService(Components.interfaces.nsIProperties);

    var path = escape(fileLocator.get("ProfD", Components.interfaces.nsIFile).path.replace(/\\/g, "/")) + "/";
    if (path.indexOf("/") == 0) {
        path = 'file://' + path;
    } else {
        path = 'file:///' + path;
    }

    return path;
};


/*
 *  Wraps a class loader and allows easy access to the classes that it loads.
 */
function WrappedPackages(java, classLoader) {
    var packages = java.lang.Class.forName(
        "edu.mit.simile.firefoxClassLoader.Packages",
        true,
        classLoader
    ).newInstance();

    var argumentsToArray = function(args) {
        var a = [];
        for (var i = 0; i < args.length; i++) {
            a[i] = args[i];
        }
        return a;
    }

    this.getClass = function(className) {
        var classWrapper = packages.getClass(className);
        if (classWrapper) {
            return {
                n : function() {
                    return classWrapper.callConstructor(argumentsToArray(arguments));
                },
                f : function(fieldName) {
                    return classWrapper.getField(fieldName);
                },
                m : function(methodName) {
                    return function() {
                        return classWrapper.callMethod(methodName, argumentsToArray(arguments));
                    };
                }
            };
        } else {
            return null;
        }
    };

    this.setTracing = function(enable) {
        classLoader.setTracing((enable) ? true : false);
    };
}
