/*
 * Copyright (C) 2007 by Institute for Systems Biology,
 * Seattle, Washington, USA.  All rights reserved.
 *
 * This source code is distributed under the GNU Lesser
 * General Public License, the text of which is available at:
 *   http://www.gnu.org/copyleft/lesser.html
 */

/**
 * Support for the Firegoose Gaggle toolbar.
 *
 * initialize java objects, respond to GUI events
 *
 * Naming Conventions: CamelCase is used for all names.
 * The following prefixes are used.
 * ======================================================
 * fg     - XUL widgets
 * fgcmd  - XUL command elements
 * FG_    - global javascript variable and functions
 * _      - private members, touch at your own risk
 *
 * Local variables and function parameters get no prefix.
 *
 */
 
 // requires gaggleData.js

var FG_timerIntervalId = null;
var FG_websiteHandlers = {};
var FG_default = {species : "unknown", mode : "default"};
var FG_isConnected = false;

// these keep track of the last value this window has seen
// from the goose java class. We poll the goose asking if
// we have new updates (either received a broadcast or got
// an updated list of geese). If we get the same value as
// last time, nothing's changed, so do nothing. If not, we
// have to update the UI to reflect the new state.
// @see the function FG_pollGoose().
var FG_previousNewDataSignalValue = 0;
var FG_previousTargetUpdateSignalValue = 0;


/**
 * I want to pass this object to java and have it called from
 * there, but so far no luck. I tried using JSObject, but apparently
 * that only works in applets?
 */
var FG_firegooseJS = {
	doHide: function() { window.blur(); },
	doShow: function() { window.focus(); },
	name: "FG_firegooseJS"
}


/**
 * Scans the page for gaggle data when a new page is loaded, a
 * new browser tab is selected, or a gaggleDataEvent is received.
 */
var FG_pageListener = {

	scanPage: function(doc) {
		FG_gaggleDataHolder.clearPageData();

		// look for pages we know how to scrape
		for (w in FG_websiteHandlers) {
			website = FG_websiteHandlers[w];
			if (website.recognize(doc)) {
				try {
					var pageData = website.getPageData(doc);
					// if pageData is a list of gaggleData objects
					if (pageData && pageData.length && pageData.length > 0) {
						FG_gaggleDataHolder.putAll(pageData);
						// experiment break;
					}
					// if pageData is just one gaggleData object
					else if (pageData) {
						FG_gaggleDataHolder.put(pageData);
						// experiment break;
					}
				}
				catch (e) {
					FG_trace(e);
				}
			}
		}

		FG_populateBroadcastChooser();
	},

	onTabSelect: function(aEvent) {
		this.scanPage(window.content.document);
	},

	// javascript in the page can generate gaggleDataEvents
	dataEventListener: function(aEvent) {
	/*
		dump("got a gaggleDataEvent\n");
		var doc = aEvent.target;
		var data = doc.defaultView.wrappedJSObject.gaggleDataForFiregoose;
		dump("data = " + data + "\n");
		for (var i in data) {
			dump(i + " => " + data[i] + "\n");
		}
	*/
		this.scanPage(aEvent.target);
	},

	onPageLoad: function(aEvent) {
		if (aEvent.originalTarget.nodeName == "#document") {
			var doc = aEvent.originalTarget;
			this.scanPage(doc);
			
			// add a data event listener so the page can generate
			// gaggleDataEvents to indicate that data has been loaded
			// into the page in some ajaxy way.
			doc.addEventListener("gaggleDataEvent",
				function(aEvent) { FG_pageListener.dataEventListener(aEvent); }, false, true);

			// another option would be to register a callback in the page
			// something like this and have the page call it directly.
//			if (window.content.wrappedJSObject) {
//				window.content.wrappedJSObject.FG_gaggleCallBack = this;
//			}
		}
	}
}


/**
 * initialize event listeners and try to connect to the gaggle
 */
function FG_initialize() {

	try {
		var prefs = Components.classes["@mozilla.org/preferences-service;1"].
				getService(Components.interfaces.nsIPrefBranch);

		try {
			var defaultMode = prefs.getCharPref("extension.firegoose.defaults.mode");
			var defaultSpecies = prefs.getCharPref("extension.firegoose.defaults.species");
	
			if (defaultMode)
				FG_default.mode = defaultMode;
			if (defaultSpecies)
				FG_default.species = defaultSpecies;
		}
		catch (e) {
			// if those prefs don't exist, an exception is thrown.
			FG_trace("No setting for default species?\n" + e);
		}
/*
		try {
			// get the preferences setting for autoStartBoss
			var autoStartBoss = prefs.getBoolPref("extension.firegoose.autoStartBoss");

			// set the autoStartBoss option in the Goose
			var goose = javaFiregooseLoader.createJavaFiregooseObject();
			goose.setAutoStartBoss(autoStartBoss);
		}
		catch (e) {
			FG_trace("No setting for autoStartBoss?\n" + e);
		}
*/
	}
	catch (e) {
		FG_trace("Error initializing preferences service:\n" + e);
	}

	try
	{
		var javaVersion = java.lang.System.getProperty("java.version");
		dump("javaVersion = " + javaVersion  + "\n");
	}
	catch (e)
	{
		dump(e + "\n");
	}

	window.addEventListener("load", function() { FG_registerPageListeners(); }, false);
	window.addEventListener("load", function() { FG_connectToGaggle(true); }, false);
	window.addEventListener("load", function() { FG_registerTargetChangeListener(); }, false);
	window.addEventListener("load", function() { FG_initUI(); }, false);

//	var goose = javaFiregooseLoader.createJavaFiregooseObject();
//	goose.setDebugToFile(true);
}


/**
 * register listeners that cause the page to be scanned whenever a
 * new page is loaded and when the user switches to a new browser tab.
 * Note that this misses some cases, for instance use of the back button.
 */
function FG_registerPageListeners() {
	// add listener for page load events
	var appcontent = document.getElementById("appcontent");
	if (appcontent)
		appcontent.addEventListener("load", function(aEvent) { FG_pageListener.onPageLoad(aEvent); }, true);
	else
		FG_trace("Warning: unable to register page load listener");

	// add listener for tab select events
	var tabs = document.getElementById("content").tabContainer;
	if (tabs) 
		tabs.addEventListener("select", function(aEvent) { FG_pageListener.onTabSelect(aEvent); }, true);
	else
		FG_trace("Warning: unable to register tab select listener");
}


/**
 * add a website handler which knows how to recognize
 * pages and scrape their contents. Whenever a page is
 * loaded or selected the website handlers are invoked
 * to see if there are contents to be scraped.
 */
function FG_addWebsiteHandler(name, websiteHandler) {
	dump("Firegoose registering handler: " + name + "\n");
	FG_websiteHandlers[name] = websiteHandler;
}


/**
 * add a listener to the target chooser that pops up the enableWebsites
 * menu when the user selects "More...".
 */
function FG_registerTargetChangeListener() {

	var onChangeTarget = function() {
		var webSiteChooser = document.getElementById("fg_targetChooser");
		var websiteName = webSiteChooser.getAttribute("label");
		if (websiteName == "More...")
			FG_enableWebsites();
		FG_adjustUi();
	}

	var targetChooser = document.getElementById("fg_targetChooser");
	targetChooser.addEventListener("ValueChange", onChangeTarget, false);
}


/**
 * adjusts UI for user preferences and initial connection status.
 * This has to be done in a callback so that the UI components
 * will be created first, before we start mucking about with
 * their properties.
 */
function FG_initUI() {
	var goose = javaFiregooseLoader.getGoose();
	if (goose) {
		FG_isConnected = goose.isConnected();
	}

	try {
		var prefs = Components.classes["@mozilla.org/preferences-service;1"].
				getService(Components.interfaces.nsIPrefBranch);

		// get the preferences setting for autoStartBoss
		var autoStartBoss = prefs.getBoolPref("extension.firegoose.autoStartBoss");

		// check the menu item for autoStartBoss
		if (autoStartBoss) {
			var autoStartBossMenuItem = document.getElementById("fg_autoStartBoss");
			autoStartBossMenuItem.setAttribute("checked", "true");
		}
	}
	catch (e) {
		FG_trace("Error reading setting for autoStartBoss:\n" + e);
	}

	FG_adjustUi();
	FG_populateTargetChooser();

	// I used to start and stop the polling when we connected
	// and disconnected with the boss, but that caused problems
	// with multiple windows. If one window initiated a
	// connection, the other(s) wouldn't realized they were
	// connected. So, now we just start the timer and leave
	// it running whether connected or not.
	FG_startTimedEvent();
}



function FG_startTimedEvent() {
	FG_timerIntervalId = setInterval('FG_pollGoose()', 1000);
}


function FG_clearTimedEvent() {
	if (FG_timerIntervalId) {
		clearInterval(FG_timerIntervalId);
	}
}


/**
 * log a message to the javascript console
 * TODO: move to util
 */
function FG_trace(msg) {
    Components.classes["@mozilla.org/consoleservice;1"]
        .getService(Components.interfaces.nsIConsoleService)
            .logStringMessage(msg);
}


function FG_hello() {
	alert("hello");
	FG_trace("hello");
}


function FG_test() {
	FG_trace("test");

	var params = {inn:{message:"Downloading network from STRING; please wait..."}, out:null};
	var w = window.openDialog('chrome://firegoose/content/progress.xul','Progress','chrome,centerscreen,alwaysRaised,resizable', params);

	FG_testTimerCounter = 0;
	FG_testTimer = setInterval(function() {
		w.document.incProgress(10);
		FG_testTimerCounter++;
		if (FG_testTimerCounter > 10) {
			clearInterval(FG_testTimer);
			w.close();
		}
	}, 1000);
}

function FG_objectToString(obj) {
	if (obj==null)
		return "null";
	var s = typeof(obj) + "(";
	for (var key in obj) {
		try {
			s = s + key + "=" + obj[key] + ",";
		} catch(e) {
			s = s + key + "=[ERROR],"; 
		}
	}
	if (s.length > 1)
		s = s.substring(0, s.length-1);
	return s + ")";
}


/**
 * pop up an alert with info about the JVM
 * being used in this browser. Useful for
 * diagnosing wrong JVM version problems.
 */
function FG_jvmInfo() {
	try {
		var sys = java.lang.System;
		if (sys) {
			var info = sys.getProperty("java.home") + "\n"
		             + sys.getProperty("java.vendor") + ", "
		             + sys.getProperty("java.version") + "\n"
		             + sys.getProperty("java.class.path");
		    FG_trace(info);
		    alert(info);
		}
		else {
			FG_trace("No Java VM found!");
		    alert("No Java VM found!");
		}
	}
	catch(e) {
		FG_trace("No Java VM found: " + e);
	    alert("No Java VM found: " + e);
	}
}


/**
 * get a string from firegoose.properties (under locale)
 */
function FG_getString(key) {
	try {
	    return document.getElementById("strings_firegoose").getString(key);
	}
	catch(e) {
		return "";
	}
}


/**
 * open about box
 */
function FG_openAboutWindow() {
	var x = window.screenX + 200;
	var y = window.screenY + 100;
	var strWindowOptions = "chrome,screenX=" + x + ",screenY=" + y
	window.open("chrome://firegoose/content/about.xul", null, strWindowOptions, null);
}


/**
 * open a browser window with a help page
 */
function FG_help() {
	// open the kegg URL in a new tab
	var newTab = getBrowser().addTab("http://gaggle.systemsbiology.org/docs/geese/firegoose/");
	getBrowser().selectedTab = newTab;
}


/**
 * Open species dialog. There are two species the user can set: the one in
 * current page data, and the one in any incoming data from the gaggle.
 */
function FG_openSpeciesDialog() {

	var params = new Object();
	var goose = javaFiregooseLoader.getGoose();

	// try to get species from a few different sources.
	params.species = FG_default.species;
	if (params.species == null || params.species == "unknown") {
		params.species = goose.getSpecies();
	}
	if (params.species == null || params.species == "unknown") {
		params.species = FG_getPageSpecies();
	}
	if (FG_default.mode) {
		params.mode = FG_default.mode;
	}

	window.openDialog("chrome://firegoose/content/species.xul", "speciesDialog",
	                  "modal,centerscreen,chrome,resizable=no", params);

	// if dialog accepted, handle return values
	if (params.outMode) {
		if (params.outMode == "default" || params.outMode == "force") {
			FG_default.mode = params.outMode;
			FG_default.species = params.outSpecies;
			FG_default.temp = false;
		}
		else if (params.outMode == "reset") {
			FG_default = {species : "unknown", mode : "default"};
		}
		else if (params.outMode == "temp") {
			FG_default.temp = true;
			FG_default.tempSpecies = params.outSpecies;
		}

		// save default preferences if requested
		if (params.outMode != "temp" && params.outRemember) {
			var prefs = Components.classes["@mozilla.org/preferences-service;1"].
						getService(Components.interfaces.nsIPrefBranch);
			prefs.setCharPref("extension.firegoose.defaults.mode", FG_default.mode);
			prefs.setCharPref("extension.firegoose.defaults.species", FG_default.species);
		}
	}
}


/**
 * returns the current species with defaulting
 */
function FG_getPageSpecies() {
	FG_applyDefaultSpecies(FG_gaggleDataHolder.getSpecies());
}



/**
 * takes a species and applies defaulting to it, if
 * necessary according to the currect defaulting policy.
 */
function FG_applyDefaultSpecies(species) {
	// keep in mind that species may be a Java String or
	// a javascript string.
	//dump(":::species = " + species + "\n");
	if (FG_default.temp) {
		//dump("temp species = " + FG_default.tempSpecies + "\n");
		FG_default.temp = false;
		return FG_default.tempSpecies;
	}
	else if (FG_default.mode == "force") {
		//dump("force species = " + FG_default.species + "\n");
		return FG_default.species;
	}
	else if (species && species != "" && species != "unknown") {
		//dump("species = " + species + "\n");
		return species;
	}
	else if (FG_default.mode == "default") {
		//dump("default species = " + FG_default.species + "\n");
		return FG_default.species;
	}
	else {
		return "unknown";
	}
}


// hack: over-ride species defaulting behavior of FG_GaggleData
FG_GaggleData.prototype._applyDefaultSpecies = FG_applyDefaultSpecies;


/**
 * broadcast gaggle data to the selected target.
 */
function FG_broadcast() {
	var targetChooser = document.getElementById("fg_targetChooser");
	if (targetChooser.selectedIndex == -1) {
		FG_trace("Can't broadcast: No target selected");
		return;
	}
	var broadcastChooser = document.getElementById("fg_broadcastChooser");
	if (broadcastChooser.selectedIndex == -1) {
		FG_trace("Can't broadcast: No broadcast data selected");
		return;
	}

	var target = targetChooser.selectedItem.getAttribute("label");
	var targetType = targetChooser.selectedItem.getAttribute("type");
	var broadcastData = FG_gaggleDataHolder.get(broadcastChooser.selectedItem.getAttribute("value"));

	if (!broadcastData) {
		FG_trace("Can't broadcast: No broadcast data found");
		return;
	}

	dump("broadcasting: " + broadcastData.getDescription() + " to " + target + "\n\n");
	FG_trace("broadcasting: "  + broadcastData.getDescription() + " to " + target + "\n\n");

	// There are a couple of funny aspects to how a broadcast takes place. The first is that
	// we may want to be lazy about acquiring data from a page. Why bother acquiring data until
	// the time that it's about to be broadcast? So, to do that, some of the handlers override
	// the getData function on FG_GaggleData. One step further is the case of making a web
	// service call, which is asynchronous, which is covered by the following lines of code.
	// I'm not having both of these mechanisms is a good idea, since the asynchronous case
	// could certainly be used for lazy-scraping, but it's there for the time being...

	// the data might be fetched by an asynchronous call (to a web service for instance).
	// If that's the case, we signal it by the isAsynch property and then perform the
	// asynchronous call passing a call-back to do the actual broadcast whenever the 
	// call completes. If there's no asynchrony involved, we just go ahead and broadcast.
	if (broadcastData.isAsynch) {
		dump("fetching data asynchronously...\n");
		broadcastData.asynchronouslyFetchData(
			function() {
				FG_dispatchBroadcast(broadcastData, target, targetType);
			});
	}
	else {
		FG_dispatchBroadcast(broadcastData, target, targetType);
	}

}


/**
 * Perform the appropriate kind of broadcast based on the type
 * of target (goose or website)
 */
function FG_dispatchBroadcast(broadcastData, target, targetType) {
	// if target is a website, look up its handler and broadcast
	if (targetType == "Website") {
		FG_dispatchBroadcastToWebsite(broadcastData, target);
	}

	// if target is a goose
	else if (targetType == "GaggleGoose") {
		FG_dispatchBroadcastToGoose(broadcastData, target);
	}
}

// TODO the handler.handleXXX methods and the goose.broadcastXXX methods
// need some rethinking and simplifying. They're something of a mess.


/**
 * Broadcast one of the gaggle data types to a website.
 */
function FG_dispatchBroadcastToWebsite(broadcastData, target) {
	var handler = FG_websiteHandlers[target];
	
	if (broadcastData.getType() == "NameList") {
		if (handler.handleNameList) {
			handler.handleNameList(broadcastData.getSpecies(), broadcastData.getData());
		}
	}
	else if (broadcastData.getType() == "Map") {
		if (handler.handleMap) {
			handler.handleMap(
				broadcastData.getSpecies(),
				broadcastData.getName(), 
				FG_objectToJavaHashMap(broadcastData.getData()));
		}
	}
	else if (broadcastData.getType() == "Network") {
		if (handler.handleNetwork) {
			handler.handleNetwork(broadcastData.getSpecies(), broadcastData.getData());
		}
	}
	else if (broadcastData.getType() == "DataMatrix") {
		if (handler.handleMatrix) {
			handler.handleMatrix(broadcastData.getData());
		}
	}
	else if (broadcastData.getType() == "Cluster") {
		if (handler.handleCluster) {
			handler.handleCluster(
				broadcastData.getSpecies(),
				broadcastData.getName(), 
				broadcastData.getData().rowNames,
				broadcastData.getData().columnNames);
		}
	}
}


/**
 * Broadcast one of the gaggle data types over RMI to a goose.
 */
function FG_dispatchBroadcastToGoose(broadcastData, target) {
	var goose = javaFiregooseLoader.getGoose();
	
	// one thing to be careful about here is the species defaulting
	// behavior defined in this file that overrides the default
	// behavior of the GaggleData object. The java objects should
	// get the species that comes from the over-ridden method with
	// proper defaulting.

	if (broadcastData.getType() == "NameList") {
		dump("broadcasting some identifiers: " + broadcastData.getData() + "\n");
		var javaArray = javaFiregooseLoader.toJavaArray(java.lang.String, broadcastData.getData());
		goose.broadcastNameList(target, broadcastData.getName(), broadcastData.getSpecies(), javaArray);
	}
	else if (broadcastData.getType() == "Map") {
		goose.broadcastMap(
			target,
			broadcastData.getSpecies(),
			broadcastData.getName(), 
			FG_objectToJavaHashMap(broadcastData.getData()));
	}
	else if (broadcastData.getType() == "Network") {
		// network is a java object
		var network = broadcastData.getData();
		// TODO is this necessary? apply defaulting to species
		network.setSpecies(broadcastData.getSpecies());
		goose.broadcastNetwork(target, network);
	}
	else if (broadcastData.getType() == "DataMatrix") {
		// matrix is a java object
		var matrix = broadcastData.getData();
		// TODO is this necessary? apply defaulting to species
		matrix.setSpecies(broadcastData.getSpecies());
		goose.broadcastDataMatrix(target, matrix);
	}
	else if (broadcastData.getType() == "Cluster") {
		goose.broadcastCluster(
			target,
			broadcastData.getSpecies(),
			broadcastData.getName(), 
			broadcastData.getData().rowNames,
			broadcastData.getData().columnNames);
	}
	else {
		FG_trace("Error in FG_dispatchBroadcastToGoose(broadcastData, target): Unknown data type: \"" + broadcastData.getType() + "\"");
	}
} 


/**
 * convert a javascript object with String keys and String properties
 * to a java HashMap.
 */
function FG_objectToJavaHashMap(map) {
	var hashMap = new java.util.HashMap();
	for (var key in map) {
		//dump(key + " -> " + map[key] + "\n");
		hashMap.put(key, map[key]);
	}
	return hashMap;
}

function FG_objectToJavaTuple(object) {
	
}


function FG_isConnectedToGaggle() {
    var goose = javaFiregooseLoader.getGoose();
    return goose.isConnected();
}


/**
 * Connect to the gaggle if we're not connected already
 * otherwise update the goose chooser list
 */
function FG_connectOrUpdate() {
	if (!FG_isConnectedToGaggle()) {
		FG_connectToGaggle();
	}
	else {
		FG_populateTargetChooser();
	}
}

/**
 * connect to gaggle if we're not connected
 * already
 */
function FG_connectToGaggle(initializingFiregoose) {
 
    try {
		var goose = javaFiregooseLoader.getGoose();

	    if (goose.isConnected()) {
	    	// don't reconnect if already connected
	    	FG_trace("connectToGaggle: already connected to Gaggle");
	    }
		else {
	    	FG_trace("connectToGaggle: connecting to Gaggle");

			// try to connect
			// The behavior I want here differs from the autostart behavior
			// defined in RmiGaggleConnector. If a boss is running
			// when Firegoose starts, connect to it. If the preference
			// extension.firegoose.autoStartBoss is set, autostart a
			// boss when Firegoose starts, otherwise don't. When the
			// user clicks "Connect to Gaggle" always use the autostart
			// behavior.
			if (initializingFiregoose && !FG_getAutoStartBoss()) {
				goose.connectToGaggleIfAvailable();
			}
	    	else {
				goose.connectToGaggle();
			}

	    	// this should throw an exception if connection failed, but
	    	// apparently it gets eaten somewhere.

			// did connecting fail? If we're auto-starting the boss
			// should start shortly, but probably won't be started yet.
		    if (!goose.getAutoStartBoss() && !goose.isConnected()) {
				throw new Error("Failed to connect to the Gaggle");
			}
		}

	}
	catch (e) {
		FG_trace(e);
		if (!initializingFiregoose) {
			alert("failed to connect to gaggle");
		}
	}

	// adjust the UI
//	FG_adjustUi();
//	FG_populateTargetChooser();
}


function FG_disconnectFromGaggle() {
	// stop polling for broadcasts
    //FG_clearTimedEvent();

    FG_trace("disconnectFromGaggle");
    var goose = javaFiregooseLoader.getGoose();
    goose.disconnectFromGaggle();

    FG_adjustUi();
	FG_populateTargetChooser();
}

// controls whether to automatically start the Boss when
// Firegoose starts. This is a slightly different meaning
// than the autostart feature in RmiGaggleConnector. We
// will set autostart on in the connector always.
function FG_updateAutoStartBoss(autoStartBoss) {
	var prefs = Components.classes["@mozilla.org/preferences-service;1"].
			getService(Components.interfaces.nsIPrefBranch);
	prefs.setBoolPref("extension.firegoose.autoStartBoss", autoStartBoss);
}

function FG_getAutoStartBoss() {
	var prefs = Components.classes["@mozilla.org/preferences-service;1"].
			getService(Components.interfaces.nsIPrefBranch);
	return prefs.getBoolPref("extension.firegoose.autoStartBoss");
}



/**
 * adjust the UI to reflect connection status and available
 * page data
 */
function FG_adjustUi() {
    var goose = javaFiregooseLoader.getGoose();
	var connected = goose.isConnected();

	// to enable a command you set the attribute "disabled"
	// to the string "false". To disable, set "disabled" to "true"
	var enabled = "false";
	var disabled = "true";

	// for controls that are enabled when connected
	var enabledWhenConnected = connected ? enabled : disabled;

	// for controls that are disabled when connected
	var disabledWhenConnected = connected ? disabled : enabled;

	// enable the show button if we're connected or we've selected
	// a target website that has a show method
	var enabledShow = enabledWhenConnected;
	var targetChooser = document.getElementById("fg_targetChooser");
	if (targetChooser.selectedItem) {
		var targetType = targetChooser.selectedItem.getAttribute("type");
		if (targetType == "Website") {
			var website = targetChooser.selectedItem.getAttribute("label");
			var handler = FG_websiteHandlers[website];
			if (handler.show)
				enabledShow = enabled;
			else
				enabledShow = disabled;
		}
	}

	// show and hide buttons
	var cmd = document.getElementById("fgcmd_showGoose");
	cmd.setAttribute("disabled", enabledShow);
	var cmd = document.getElementById("fgcmd_hideGoose");
	cmd.setAttribute("disabled", enabledWhenConnected);

    // connect, disconnect, and update
	var cmd = document.getElementById("fgcmd_connect");
	cmd.setAttribute("disabled", disabledWhenConnected);
	var cmd = document.getElementById("fgcmd_disconnect");
	cmd.setAttribute("disabled", enabledWhenConnected);
	var cmd = document.getElementById("fgcmd_update");
	cmd.setAttribute("disabled", enabledWhenConnected);

	var btn = document.getElementById("fg_registerOrUpdateButton");
	if (connected) {
		btn.setAttribute("tooltiptext", "Update list of geese");
	}
	else {
		btn.setAttribute("tooltiptext", "Connect to the Gaggle");
	}

	var status = document.getElementById("fg_statusLight");
	if (connected) {
		// display our goose name as a tooltip
		status.setAttribute("tooltiptext", "Connected as: " + goose.getName());
		status.setAttribute("src", "chrome://firegoose/skin/connected.png");
	}
	else {
		status.setAttribute("tooltiptext", "Not Connected");
		status.setAttribute("src", "chrome://firegoose/skin/disconnected.png");
	}

	FG_adjustBroadcastButton();
}


function FG_adjustBroadcastButton() {

	var targetChooser = document.getElementById("fg_targetChooser");
	if (targetChooser.selectedIndex > -1)
		var targetSelected = true;

	var broadcastChooser = document.getElementById("fg_broadcastChooser");
	if (broadcastChooser.selectedIndex > -1)
		var broadcastSelected = true;

	// adjust broadcast button
	var broadcastCmd = document.getElementById("fgcmd_broadcast");
	if (targetSelected && broadcastSelected) {
		broadcastCmd.setAttribute("disabled", "false");
	}
	else {
		broadcastCmd.setAttribute("disabled", "true");
	}
}


/**
 * ask the currently selected goose to show itself
 */
function FG_requestShow() {
	var targetChooser = document.getElementById("fg_targetChooser");
	if (targetChooser.selectedItem.getAttribute("type") == "GaggleGoose") {
		var gooseName = targetChooser.selectedItem.getAttribute("label");
		var goose = javaFiregooseLoader.getGoose();
		goose.showGoose(gooseName);
	}
	else {
		var website = targetChooser.selectedItem.getAttribute("label");
		var handler = FG_websiteHandlers[website];
		if (handler.show) {
			handler.show();
		}
	}
}


/**
 * ask the currently selected goose to hide
 */
function FG_requestHide() {
	var targetChooser = document.getElementById("fg_targetChooser");
	if (targetChooser.selectedItem.getAttribute("type") == "GaggleGoose") {
		var gooseName = targetChooser.selectedItem.getAttribute("label");
		var goose = javaFiregooseLoader.getGoose();
		goose.hideGoose(gooseName);
	}
}


/**
 * polls the Goose for incoming data. We use polling here, 'cause we
 * haven't figured out a means to call into javascript from java.
 */
function FG_pollGoose() {
	var goose = javaFiregooseLoader.getGoose();

	var connected = goose.isConnected();
	if (connected != FG_isConnected) {
		FG_adjustUi();
		FG_populateTargetChooser();
		FG_isConnected = connected;
	}

	if (goose.isConnected) {

		// we want to check if there's new data from the Gaggle,
		// and if not don't bother doing anything, otherwise we'll
		// be updating the GUI every second, which isn't too cool.
		var value = goose.checkNewDataSignal();
		if (value > FG_previousNewDataSignalValue) {
			FG_previousNewDataSignalValue = value;
			var gaggleData = new FG_GaggleDataFromGoose();
			FG_gaggleDataHolder.put(gaggleData);
			FG_populateBroadcastChooser(gaggleData.getDescription());
		}

		var value = goose.checkTargetUpdateSignal();
		if (value > FG_previousTargetUpdateSignalValue) {
			FG_previousTargetUpdateSignalValue = value;
			FG_populateTargetChooser();
		}

	}
}


/**
 * Implements the same interface as a FG_GaggleData object, but
 * delegates calls to the java goose to get data from a gaggle
 * broadcast.
 * TODO: This is not very threadsafe which could cause errors.
 */
function FG_GaggleDataFromGoose() {
}

// the name "gaggle" is required for a cheap and sleazy hack in FG_gaggleDataHolder
FG_GaggleDataFromGoose.prototype = new FG_GaggleData("gaggle");

FG_GaggleDataFromGoose.prototype.getType = function() {
    var goose = javaFiregooseLoader.getGoose();
    return goose.getType();
}

FG_GaggleDataFromGoose.prototype.getSize = function() {
    var goose = javaFiregooseLoader.getGoose();
    return goose.getSize();
}

FG_GaggleDataFromGoose.prototype.getSpecies = function() {
    var goose = javaFiregooseLoader.getGoose();
    return FG_applyDefaultSpecies(goose.getSpecies());
}

FG_GaggleDataFromGoose.prototype.getData = function() {
    var goose = javaFiregooseLoader.getGoose();
    return goose.getNameList();
    
    // TODO:  handle all data types here and in FireGoose.java
}


/**
 * adds entries to the Gaggle Data drop-down menu.
 * Entries can be (at most) one Gaggle data element received
 * as a broadcast from the Boss, plus zero or more data elements
 * from the currently visible web page. These come from scrapping
 * the page, calling associated web services, etc. 
 */
function FG_populateBroadcastChooser(itemToSelect) {
	var popup = document.getElementById("fg_broadcastChooserPopup");
	var chooser = document.getElementById("fg_broadcastChooser");

	// remember currently selected item
	if (!itemToSelect && chooser.selectedItem) {
		itemToSelect = chooser.selectedItem.label;
	}

    // delete existing menu items
    for (var i=popup.childNodes.length - 1; i>=0; i--) {
    	popup.removeChild(popup.childNodes.item(i));
    }

	var descriptions = FG_gaggleDataHolder.getDescriptions();
	for (var i in descriptions) {
		var newMenuItem = document.createElement("menuitem");
		newMenuItem.setAttribute("label", descriptions[i]);
		newMenuItem.setAttribute("tooltiptext", descriptions[i]);
		newMenuItem.setAttribute("value", i);
		popup.appendChild(newMenuItem);
	}

	// select first item
	if (popup.childNodes.length > 0) {
		chooser.selectedIndex = 0;
	}
	else {
		var newMenuItem = document.createElement("menuitem");
		newMenuItem.setAttribute("label", "-- no data --");
		newMenuItem.setAttribute("tooltiptext", "Broadcastable data can be received from the Gaggle or found in Firegoose-readable web pages.");
		newMenuItem.setAttribute("value", -1);
		popup.appendChild(newMenuItem);
		chooser.selectedIndex = 0;
	}

	// select previously selected item or boss
	chooser.selectedIndex = 0;
	if (itemToSelect) {
	    for (var i=popup.childNodes.length - 1; i>=0; i--) {
	    	if (popup.childNodes.item(i).label == itemToSelect) {
	    		chooser.selectedIndex = i;
	    		break;
	    	}	
	    }
	}

	FG_adjustUi();
}


/**
 * called to update the list of possible target geese or websites
 * to which we can broadcast.
 */
function FG_populateTargetChooser() {
	var newMenuItem;
	var menulist = document.getElementById("fg_targetChooser");
    var popup = document.getElementById("fg_targetChooserPopup");

	// remember currently selected item
	var previouslySelectedItem = null;
	if (menulist.selectedItem) {
		previouslySelectedItem = menulist.selectedItem.label;
		// don't preserve a "More..." selection
		if (previouslySelectedItem && FG_util.startsWith(previouslySelectedItem.toLowerCase(), "more"))
			previouslySelectedItem = null;
	}

    // delete existing menu items
    for (var i=popup.childNodes.length - 1; i>=0; i--) {
    	popup.removeChild(popup.childNodes.item(i));
    }

    var goose = javaFiregooseLoader.getGoose();
    if (goose && goose.isConnected()) {
		// add "Boss" to popup menu
	    newMenuItem = document.createElement("menuitem");
	    newMenuItem.setAttribute("label", "Boss");
		newMenuItem.setAttribute("tooltiptext", "Send broadcasts to the Gaggle Boss");
	    newMenuItem.setAttribute("type", "GaggleGoose");
	    popup.appendChild(newMenuItem);
	
		// add new geese to popup menu
	    var gooseNames = goose.getGooseNames();
	    for (var i=0; i<gooseNames.length; i++) {
		    newMenuItem = document.createElement("menuitem");
		    newMenuItem.setAttribute("label", gooseNames[i]);
		    newMenuItem.setAttribute("tooltiptext", "Send broadcasts to " + gooseNames[i]);
		    newMenuItem.setAttribute("type", "GaggleGoose");
		    popup.appendChild(newMenuItem);
	    }
	}
	else {
	    var menuItem = document.createElement("menuitem");
	    menuItem.setAttribute("label", "Not connected to Boss");
		menuItem.setAttribute("tooltiptext", "Not connected to Boss");
	    popup.appendChild(menuItem);
	}

	// separator between geese and websites
    newMenuItem = document.createElement("separator");
    popup.appendChild(newMenuItem);

	// we can hide some of these using preferences
	var prefs = Components.classes["@mozilla.org/preferences-service;1"].
	            getService(Components.interfaces.nsIPrefBranch);

	function isVisible(name) {
		try {
	    	return prefs.getBoolPref(FG_fixName(name));
	    }
	    catch (e) {
	    	return true;
	    }
	}

	keys = [];
	for (var name in FG_websiteHandlers) {
		keys.push(name);
	}
	keys.sort();

	// add an item for each website handler
	for (var i in keys) {
		var name = keys[i];
		var handler = FG_websiteHandlers[name];
		if (!handler.dontDisplayInMenu && isVisible(name)) {
		    newMenuItem = document.createElement("menuitem");
		    newMenuItem.setAttribute("label", name);
		    newMenuItem.setAttribute("tooltiptext", "Send broadcasts to " + name);
		    newMenuItem.setAttribute("type", "Website");
		    popup.appendChild(newMenuItem);
		}
    }

	// add groove separator
    var separator = document.createElement("menuseparator");
    separator.setAttribute("class", "groove");
    popup.appendChild(separator);

	// enable more websites
    var moreMenuItem = document.createElement("menuitem");
    moreMenuItem.setAttribute("label", "More...");
    moreMenuItem.setAttribute("tooltiptext", "Enable more website targets");
    popup.appendChild(moreMenuItem);
	
	// select previously selected item or boss
	menulist.selectedIndex = 0;
	if (previouslySelectedItem) {
	    for (var i=popup.childNodes.length - 1; i>=0; i--) {
	    	if (popup.childNodes.item(i).label && popup.childNodes.item(i).label == previouslySelectedItem) {
	    		menulist.selectedIndex = i;
	    		break;
	    	}	
	    }
	}

	FG_adjustUi();
}


/**
 * open the enable websites dialog.
 */
function FG_enableWebsites() {
	var params = new Object();
	params["websiteHandlers"] = FG_websiteHandlers;

	window.openDialog("chrome://firegoose/content/enableWebsites.xul", "enableWebsitesDialog",
	                "modal,centerscreen,chrome", params);

	if (params["ok"])
		FG_populateTargetChooser();
	else {
		// select first item
		var menulist = document.getElementById("fg_webSiteChooser");
		menulist.selectedIndex = 0;
	}
}


/**
 * search for the selected items in Entrez
 */
function FG_searchEntrezGene() {
	var nameList = FG_getSelectionAsNamelist();
	var entrezGeneHandler = FG_websiteHandlers["Entrez Gene"];
	entrezGeneHandler.handleNameList(FG_getPageSpecies(), nameList);
}


/**
 * capture the currently selected text, and query
 * entrez taxonomy for it
 */
function FG_searchEntrezTaxonomy() {
	var doc = window.content.document;
	var selection = doc.getSelection();

	var url = "http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=Taxonomy&cmd=search&term=" + selection	

	// open the URL in a new tab
	var newTab = getBrowser().addTab(url);
	getBrowser().selectedTab = newTab;
}


/**
 * capture the currently selected text in the page
 * and treat it as a name list
 */
function FG_getSelectionAsNamelist() {
	var doc = window.content.document;
	var selection = doc.getSelection();
  
	var list;

	if (selection.indexOf(",") >= 0) {
		// split on comma delimiters
		list = selection.split(/\s*,\s*/);
	}
	else {
		// split on whitespace delimiters
		list = selection.split(/\s+/);
	}
  
	var results = [];
	for (var i in list) {
		var element = FG_util.trim(list[i]);
		if (element.length > 0 && element != "#")
			results.push(element);
	}
	return results;  
}


/**
 * create a namelist out of the selected text
 * and allow it to be broadcast
 */
function FG_captureSelection() {
	var names = FG_getSelectionAsNamelist();

	var gaggleData = new FG_GaggleData(
    		"Selection",
    		"NameList",
			names.length,
			"Unknown",
			names);

    FG_gaggleDataHolder.put(gaggleData);
	FG_populateBroadcastChooser(gaggleData.getDescription());
}


/**
 * make strings safe to be used as preference names by
 * replacing spaces with underscores.
 */
function FG_fixName(name) {
	return "extension.firegoose.website." + name.replace(" ", "_");
}


/**
 * Experimental:
 * Gives a means of loading a website handler at run time.
 * If a js file is loaded in the browser, eval it. Probably
 * not recommended from a security point of view.
 */
function FG_importWebsiteHandler() {
	dump("importing website handler...\n");
	var node = window.content.document.documentElement;
	if (node.nodeName.toLowerCase() == "html") {
		node = window.content.document.getElementsByTagName("body")[0];
		if (!node) {
			dump("Import Website Handler: unable to find document body\n");
			FG_trace("Import Website Handler: unable to find document body");
			return;
		}
	}
	
	
	while (node.nodeType != node.TEXT_NODE) {
		node = node.firstChild;
		if (!node) {
			FG_trace("Import Website Handler: unable to find text node in document");
			return;
		}
	}
	
	eval(node.nodeValue);
	dump("importing website handler complete!\n");

	FG_populateTargetChooser();
}



