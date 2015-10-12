dojo.provide("plugins.view.View");

/* CLASS SUMMARY: CREATE AND MODIFY VIEWS
	
	TAB HIERARCHY IS AS FOLLOWS:
	
		tabs	

			mainTab

				leftPane (SELECT VIEW AND FEATURE TRACKS)

					comboBoxes

				rightPane (VIEW GENOMIC BROWSER)

						Browser

							Features (DRAG AND DROP FEATURE TRACKS LIST)

							GenomeView (GOOGLE MAPS-STYLE GENOME NAVIGATION)


	USE CASE SCENARIO 1: USER ADDS A FEATURE TO A VIEW

		OBJECTIVE:
		
			1. MINIMAL ACTION TO ACHIEVE THE DESIRE RESULT
			
			2. IMMEDIATE AND ANIMATED RESPONSES TO INDICATE STATUS/PROGRESS


		IMPLEMENTATION:
		
		1. USER SELECTS FEATURE IN BOTTOM OF LEFT PANE AND CLICKS 'Add'
		
		2. IF FEATURE ALREADY EXISTS IN VIEW, DO NOTHING.

		3. OTHERWISE, addViewFeature CALL TO REMOTE WILL RETURN STATUS OR AN ERROR:
		
			IF STATUS IS 'Adding feature: featureName':
				
				1. START TIMER TO POLL FOR STATUS
			
				2. TIMER WILL STOP WHEN STATUS IS 'ready'
				
					OR THERE IS AN ERROR RESPONSE
					
				3. TIMER WILL THEN CALL _addViewFeature WHICH RELOADS
				
					THE VIEW AND RESETS THE VIEW FEATURES COMBO BOX
		
				4. USER CAN CLICK THE 'refresh' BUTTON TO REMOVE ANY ERROR OR 
				
					NON-'ready' STATUS (E.G., PROLONGED 'adding' OR 'removing'
					
					DUE TO ERROR ON REMOTE SERVER):
			
				5. THE 'refresh' BUTTON IS THE VIEW ICON ON LEFT OF VIEW COMBO BOX 
			
			IF STATUS IS DIFFERENT, DO NOTHING.
			
			E.G.: 'Feature already present in view: featureName'
		
		4. IF ERROR, DO NOTHING.
		
			E.G.: 'Undefined inputs: feature, project, view'

*/	
  
// EXTERNAL MODULES
if ( 1 ) {

// STORE FOR PROJECT AND WORKFLOW COMBOS
dojo.require("dojo.data.ItemFileReadStore");

// NOTES EDITOR
dojo.require("dijit.Dialog");

// HAS A
dojo.require("dijit.layout.BorderContainer");
dojo.require("dojox.layout.ExpandoPane");

// WIDGETS IN TEMPLATE
dojo.require("dijit.layout.SplitContainer");
dojo.require("dijit.layout.ContentPane");
dojo.require("dojo.data.ItemFileReadStore");
dojo.require("dijit.form.ComboBox");
dojo.require("dijit.form.Button");
dojo.require("dijit.layout.TabContainer");
dojo.require("dijit.layout.BorderContainer");
dojo.require("dojox.layout.FloatingPane");
dojo.require("dojo.fx.easing");
dojo.require("dojo.parser");

// INTERNAL MODULES

// JBROWSE
//dojo.require("plugins.view.jbrowse.jslib.dojo.jbrowse_dojo");
dojo.require("plugins.view.jbrowse.js.Browser");
dojo.require("plugins.view.jbrowse.js.Util");
dojo.require("plugins.view.jbrowse.js.NCList");
dojo.require("plugins.view.jbrowse.js.Layout");
dojo.require("plugins.view.jbrowse.js.LazyArray");
dojo.require("plugins.view.jbrowse.js.LazyPatricia");
dojo.require("plugins.view.jbrowse.js.Track");
dojo.require("plugins.view.jbrowse.js.SequenceTrack");
dojo.require("plugins.view.jbrowse.js.FeatureTrack");
dojo.require("plugins.view.jbrowse.js.UITracks");
dojo.require("plugins.view.jbrowse.js.ImageTrack");
dojo.require("plugins.view.jbrowse.js.GenomeView");
dojo.require("plugins.view.jbrowse.js.touchJBrowse");

// STANDBY
dojo.require("dojox.widget.Standby");

// GENERAL
dojo.require("plugins.core.Common");
dojo.require("plugins.dijit.SelectiveDialog");
dojo.require("plugins.dojox.Timer");

var refSeqs;
var trackInfo;

dojo.require("dijit._base.place");


}

dojo.declare( "plugins.view.View",
	[ dijit._Widget, dijit._Templated, plugins.core.Common ], {
// PATH TO WIDGET TEMPLATE
templatePath: dojo.moduleUrl("plugins", "view/templates/view.html"),

// PARENT NODE, I.E., TABS NODE
parentWidget : null,

// PROJECT NAME AND WORKFLOW NAME IF AVAILABLE
project : null,
workflow : null,

// onChangeListeners : Array. LIST OF COMBOBOX ONCHANGE LISTENERS
onChangeListeners : new Object,

// setListeners : Boolean. SET LISTENERS FLAG 
setListeners : false,

// Calls dijit._Templated.widgetsInTemplate
widgetsInTemplate : true,

// CSS FILES
cssFiles : [
	dojo.moduleUrl("plugins", "view/css/view.css"),
	dojo.moduleUrl("plugins", "view/css/genome.css"),
	dojo.moduleUrl("dojox", "layout/resources/ExpandoPane.css"),
	dojo.moduleUrl("dojox", "layout/tests/_expando.css")
],

// HASH ARRAY OF OPENED BROWSERS
browsers : [],

// URL FOR REMOTE DATABASE
url: null,

// BASE URL FOR VIEW DATA
baseUrl: "plugins/view/jbrowse/",

////}}}

constructor : function(args) {	
	//console.log("View.constructor    plugins.view.View.constructor(args)");

	// SET ARGS
	this.parentWidget = args.parentWidget;
	this.project = args.project;
	this.workflow = args.workflow;
	
	if ( Agua.cgiUrl != null )	this.url = Agua.cgiUrl + "/view.cgi";
	
	// LOAD CSS
	if ( args["cssFiles"] != null ) this.cssFiles = args.cssFiles;
	//console.log("View.constructor    this.cssFiles: " + dojo.toJson(this.cssFiles));
	this.loadCSS(this.cssFiles);		
},

postCreate: function() {
	this.startup();
},

// STARTUP
startup : function () {
	console.log("View.startup    plugins.view.Template.View.startup()");
	
    // ADD THIS WIDGET TO Agua.widgets[type]
    Agua.addWidget("view", this);

	// SET UP THE ELEMENT OBJECTS AND THEIR VALUE FUNCTIONS
	this.inherited(arguments);
	
	// ADD THE PANE TO THE TAB CONTAINER
	this.attachWidget.addChild(this.mainTab);
	this.attachWidget.selectChild(this.mainTab);
	
	// EXPAND LEFT PANE (WAS CLOSED SO THAT RIGHT PANE WOULD RENDER)
	this.leftPane.toggle();

	// SET DIALOG WIDGET
	this.setSelectiveDialog();

	// SET LOADING STANDBY
	this.setStandby();
	
	// SET PROGRESS POLLING TIMER
	this.setTimer();

	// LOAD COMBOS IN SUCCESSION
	this.setViewProjectCombo();
	
	// SET COMBO LISTENERS
	setTimeout(
		function (thisObj) { thisObj.setFeatureProjectCombo(); },
		10,
		this
	);

	// SET VIEW COMBO ONKEYCHANGE LISTENER
	setTimeout(
		function (thisObj) { thisObj.setOnkeyListener(); },
		1000,
		this
	);

	// LOAD BROWSER
	setTimeout(
		function (thisObj) { thisObj.loadBrowser(thisObj.getProject(), thisObj.getView()); },
		2000,
		this
	);

	var thisObject = this;
	this.mainTab.onClose = function() {
		console.log("view.View.startup    onClose fired.");

		var returned = confirm("Close this tab?");
		console.log("view.View.startup    returned: " + returned);

		return returned;
	};
},

loadEval : function (filepath) {
	console.log("View.loadEval    view.View.loadEval()");
	var url = Agua.htmlUrl + filepath;
	var timeout = 5000;
	
	// SEND TO SERVER
	dojo.xhrGet(
		{
			url: url,
			sync: true,
			handleAs: "text",
			load: function(response) {
				//console.log("View.loadEval    response: " + dojo.toJson(response));
				eval(response);
			},
			error: function(response, ioArgs) {
				console.log("  View.loadEval    Response error. Response: " + response);
				return response;
			}
		}
	);	
},

// GETTERS
getRefseqfile : function (username, projectName, viewName) {
	return this.baseUrl + "/users"
						+ "/" + username
						+ "/" + projectName
						+ "/" + viewName
						+ "/data/refSeqs.js";
},
getTrackinfofile : function (username, projectName, viewName) {
	return this.baseUrl + "/users"
						+ "/" + username
						+ "/" + projectName
						+ "/" + viewName
						+ "/data/trackInfo.js";
},
getProject : function () {
	return this.viewProjectCombo.get('value');
},
getWorkflow : function () {
	return this.workflowCombo.get('value');
},
getView : function () {
	//console.log("view.View.getView    plugins.view.Views.getView()");	
	//console.log("view.View.getView    Returning this.viewCombo.get('value'): " + this.viewCombo.get('value'));
	return this.viewCombo.get('value');
},
getViewFeature : function () {
	return this.featureList.get('value') ?
		this.featureList.get('value') : '' ;
},
getBuild : function () {
	//console.log("View.getBuild    View.getBuild()");
	return this.buildLabel.innerHTML;
},
getSpecies : function () {
	//console.log("View.getSpecies    View.getSpecies()");
	return this.speciesLabel.innerHTML;
},
getFeatureBuild : function () {
	//console.log("View.getFeatureBuild    View.getFeatureBuild()");
	var speciesBuild = this.speciesCombo.get('value');
	//console.log("View.getFeatureBuild    speciesBuild: "+ speciesBuild);

	if ( speciesBuild.match(/^(\S+)\(([^\)]+)\)$/) )
		return  speciesBuild.match(/^(\S+)\(([^\)]+)\)$/)[2];
},
getFeatureSpecies : function () {
	//console.log("View.getFeatureSpecies    View.getFeatureSpecies()");
	//console.log("View.getFeatureSpecies    this: " + this);

	var speciesBuild = this.speciesCombo.get('value');
	//console.log("View.getFeatureSpecies    speciesBuild: "+ speciesBuild);

	if ( speciesBuild.match(/^(\S+)\(([^\)]+)\)$/) )
		return speciesBuild.match(/^(\S+)\(([^\)]+)\)$/)[1];
},
getFeature : function () {
	return this.featureCombo.get('value');
},

getFeatureProject : function () {
	return this.featureProjectCombo.get('value');
},
getFeatureWorkflow : function () {
	return this.workflowCombo.get('value');
},


// FEATURE METHODS
setFeatureProjectCombo : function (projectName, workflowName) {
	////console.log("Common.setFeatureProjectCombo    plugins.view.Feature.setFeatureProjectCombo(projectName)");
	////console.log("Common.setFeatureProjectCombo    projectName: " + projectName);

	var projectNames = Agua.getFeatureProjects();
	////console.log("  View.setFeatureProjectCombo    projects: " + dojo.toJson(projectNames));

	// DO DATA ARRAY
	var data = {identifier: "name", items: []};
	for ( var i in projectNames )
		data.items[i] = { name: projectNames[i]	};
	////console.log("  View.setFeatureProjectCombo    projects: " + dojo.toJson(data));
	var store = new dojo.data.ItemFileReadStore( {	data: data	} );
	this.featureProjectCombo.store = store;	
	
	// SET PROJECT IF NOT DEFINED TO FIRST ENTRY IN projects
	if ( projectName == null || ! projectName)	projectName = projectNames[0];	
	this.featureProjectCombo.setValue(projectName);			
	
	//// SET CSS
	//this.featureProjectCombo.popupClass = "feature featureCombo dijitReset dijitMenu";
	//this.featureProjectCombo.wrapperClass = "feature dijitPopup";
	//this.featureProjectCombo.itemHeight = 30;		

	if ( projectName == null )	projectName = this.featureProjectCombo.get('value');

	// RESET THE WORKFLOW COMBO
	////console.log("Common.setFeatureProjectCombo    BEFORE this.setFeatureWorkflowCombo(" + projectName + ")");
	this.setWorkflowCombo(projectName);
},

setWorkflowCombo : function (projectName, workflowName) {
	////console.log("View.setWorkflowCombo    plugins.view.View.setWorkflowCombo(projectName, workflowName)");
	////console.log("View.setWorkflowCombo    projectName: " + projectName);
	////console.log("View.setWorkflowCombo    workflowName: " + workflowName);

	if ( projectName == null || ! projectName )
	{
		////console.log("View.setWorkflowCombo    Project not defined. Returning.");
		return;
	}

	// GET WORKFLOW COMBO
	if ( this.workflowCombo == null )
	{
		////console.log("View.setworkflowCombo    workflowCombo is null. Returning.");
		return;
	}

	// CREATE THE DATA FOR A STORE		
	var workflowNames = Agua.getViewProjectWorkflows(projectName);
	////console.log("View.setWorkflowCombo    projectName '" + projectName + "' workflowNames: " + dojo.toJson(workflowNames));
	
	// RETURN IF workflowNames NOT DEFINED
	if ( ! workflowNames )
	{
		////console.log("View.setWorkflowCombo    workflowNames not defined. Returning.");
		return;
	}		

	// CREATE store
	var data = {identifier: "name", items: []};
	for ( var i in workflowNames )
		data.items[i] = { name: workflowNames[i]	};
	//////console.log("View.setWorkflowCombo    data: " + dojo.toJson(data));
	var store = new dojo.data.ItemFileReadStore( { data: data } );
	this.workflowCombo.store = store;

	// START UP COMBO AND SET SELECTED VALUE TO FIRST ENTRY IN workflowNames IF NOT DEFINED 
	if ( workflowName == null || ! workflowName )	workflowName = workflowNames[0];
	////console.log("View.setWorkflowCombo    workflowName: " + workflowName);

	this.workflowCombo.startup();
	this.workflowCombo.set('value', workflowName);			

	//// SET CSS
	//this.workflowCombo.popupClass = "view viewCombo dijitReset dijitMenu";
	//this.workflowCombo.wrapperClass = "view dijitPopup";
	//this.workflowCombo.itemHeight = 30;		

	if ( projectName == null ) projectName = this.viewProjectCombo.get('value');
	if ( workflowName == null ) workflowName = this.workflowCombo.get('value');

	// RESET THE VIEW COMBO
	this.setSpeciesCombo(projectName, workflowName);
},

setSpeciesCombo : function (projectName, workflowName, speciesName, buildName) {
	////console.log("View.setSpeciesCombo    plugins.view.View.setSpeciesCombo(projectName, workflowName)");
	////console.log("View.setSpeciesCombo    projectName: " + projectName);
	////console.log("View.setSpeciesCombo    workflowName: " + workflowName);

	//// SET CSS
	//this.viewCombo.popupClass = "view viewCombo dijitReset dijitMenu";
	//this.viewCombo.wrapperClass = "view dijitPopup";
	//this.viewCombo.itemHeight = 30;		
	
	// SET DROP TARGET (LOAD MIDDLE PANE, BOTTOM)
	if ( projectName == null ) projectName = this.featureProjectCombo.get('value');
	if ( workflowName == null ) workflowName = this.workflowCombo.get('value');

	var viewfeatures = Agua.getViewWorkflowFeatures(projectName, workflowName);
	if ( viewfeatures == null || viewfeatures.length == 0 )
	{
		////console.log("View.setSpeciesCombo    viewfeatures is null or empty. Returning");
		return;
	}
	//////console.log("View.setSpeciesCombo    viewfeatures: " + dojo.toJson(viewfeatures));

	// GET SPECIES+BUILD NAMES
	var speciesBuildNames = new Array;
	for ( var i = 0; i < viewfeatures.length; i++ )
	{
		speciesBuildNames.push(viewfeatures[i].species + "(" + viewfeatures[i].build + ")");
	}
	speciesBuildNames = this.uniqueValues(speciesBuildNames);
	////console.log("View.setSpeciesCombo    speciesBuildNames: " + dojo.toJson(speciesBuildNames));

	// SET SPECIES+ BUILD NAME
	var speciesBuildName;
	if ( speciesName == null || ! speciesName
		|| buildName == null || ! buildName )
	{
		speciesBuildName = speciesBuildNames[0];
		speciesName = viewfeatures[0].species;
		buildName = viewfeatures[0].build;
	}
	else {
		speciesBuildName = speciesName + "(" + buildName + ")";
	}
	////console.log("View.setSpeciesCombo    speciesBuildName: " + speciesBuildName);

	// DO data FOR store
	var data = {identifier: "name", items: []};
	for ( var i in speciesBuildNames )
	{
		data.items[i] = { name: speciesBuildNames[i]	};
	}
	var store = new dojo.data.ItemFileReadStore( { data: data } );
	this.speciesCombo.store = store;

	// START UP COMBO (?? NEEDED ??)
	this.speciesCombo.startup();
	this.speciesCombo.set('value', speciesBuildName);			

	this.setFeatureCombo(projectName, workflowName, speciesName, buildName);
},

setFeatureCombo : function (projectName, workflowName, speciesName, buildName) {
	////console.log("View.setFeatureCombo    plugins.view.View.setFeatureCombo(projectName, workflowName)");
	////console.log("View.setFeatureCombo    projectName: " + projectName);
	////console.log("View.setFeatureCombo    workflowName: " + workflowName);

//	this.killPopup(this.featureCombo);

	// SET CSS
	this.featureCombo.popupClass = "view viewCombo dijitReset dijitMenu";
	this.featureCombo.wrapperClass = "view dijitPopup";
	this.featureCombo.itemHeight = 30;		

	if ( projectName == null || ! projectName 
		|| workflowName == null || ! workflowName 
		|| speciesName == null || ! speciesName 
		|| buildName == null || ! buildName )
	{
		////console.log("View.setFeatureCombo    Project, workflow, species or build not defined. Returning.");
		return;
	}

	// CREATE THE DATA FOR A STORE		
	var featureNames = 	Agua.getViewSpeciesFeatureNames(projectName, workflowName, speciesName, buildName);
	if ( ! featureNames )
	{
		////console.log("View.setFeatureCombo    featureNames not defined. Returning.");
		return;
	}
	////console.log("View.setFeatureCombo    projectName '" + projectName + "' workflowName '" + workflowName + "' speciesName '" + speciesName + "' buildName '" + buildName + "' featureNames: " + dojo.toJson(featureNames));

	// CREATE store
	var data = {identifier: "name", items: []};
	for ( var i in featureNames )
		data.items[i] = { name: featureNames[i]	};
	//////console.log("View.setFeatureCombo    data: " + dojo.toJson(data));
	var store = new dojo.data.ItemFileReadStore( { data: data } );
	this.featureCombo.store = store;

	// SET SELECTED VALUE TO FIRST ENTRY IN featureNames
	var featureName = featureNames[0];

	this.featureCombo.startup();
	this.featureCombo.set('value', featureName);			
},

setFeatureList : function (featureNames) {
	//console.log("View.setFeatureList    plugins.view.View.setFeatureList(featureNames)");
	//console.log("View.setFeatureList    featureNames: " + dojo.toJson(featureNames));

	//// SET CSS
	//this.featureList.popupClass = "view viewCombo dijitReset dijitMenu";
	//this.featureList.wrapperClass = "view dijitPopup";
	//this.featureList.itemHeight = 30;		

	var data = {identifier: "name", items: []};
	for ( var i in featureNames )
		data.items[i] = { name: featureNames[i]	};

	// CREATE store
	//console.log("View.setFeatureList    data: " + dojo.toJson(data));
	var store = new dojo.data.ItemFileReadStore( { data: data } );
	this.featureList.store = store;

	// START UP COMBO AND SET SELECTED VALUE TO FIRST ENTRY 
	this.featureList.startup();
	this.featureList.set('value', featureNames[0]);			
},

// VIEW FEATURE METHODS
addViewFeature : function () {
	console.log("View.addViewFeature    plugins.view.View.addViewFeature()");

	// SKIP IF ALREADY BUSY
	if ( this.timer.polling == true ) {
		console.log("View.addViewFeature    this.timer.polling IS TRUE. Returning");
		return;
	}

	if ( Agua.hasViewFeature(this.getProject(), this.getView(), this.getFeature()) ) {
		console.log("View.addViewFeature    Feature already present. Returning");
		return;
	}

	this.showStandby("Adding feature: " + this.getFeature());

	// PREPARE FEATURE TRACK OBJECT
	var featureObject = new Object;
	// SOURCE FEATURE
	featureObject.feature = this.getFeature();
	featureObject.sourceproject = this.getFeatureProject();
	featureObject.sourceworkflow = this.getFeatureWorkflow();
	featureObject.species = this.getFeatureSpecies();
	featureObject.build = this.getFeatureBuild();
	// VIEW INFO
	featureObject.project = this.getProject();
	featureObject.view = this.getView();
	// USER INFO
	featureObject.username = Agua.cookie('username');
	featureObject.sessionId = Agua.cookie('sessionId');
	// MODE
	featureObject.mode = "addViewFeature";
	//console.log("View.addViewFeature    featureObject: " + dojo.toJson(featureObject, true));
	//console.log("View.addViewFeature    featureObject: " + dojo.toJson(featureObject));

	if ( Agua.hasViewFeature == true ) {
		console.log("View.addViewFeature    hasViewFeature is TRUE");
		return;	
	}
	
	// DO REMOTE CALL
	var thisObject = this;
	var url = Agua.cgiUrl + "view.cgi";
	dojo.xhrPut(
		{
			url: url,
			contentType: "text",
			//preventCache : true,
			sync: false,
			handleAs: "json",
			putData: dojo.toJson(featureObject),
			load: function(response, ioArgs) {
				console.log("View.addViewFeature    response: " + dojo.toJson(response));
				var match = response.status.match(/Adding feature:/);
				console.log("View.addViewFeature    match: " + match);
				
				if ( response.status.match(/Adding feature: /) ) {
					console.log("View.addViewFeature    STATUS: 'Adding feature...'");

					// SET TIMER CALLBACK
					thisObject.timer.callback = dojo.hitch(thisObject, "_addViewFeature", featureObject);
					thisObject.timer.url = url;
					thisObject.timer.query = featureObject;
					thisObject.timer.query.mode = "viewStatus";
				
					// START TIMER
					console.log("View.addViewFeature    Doing timer.start()");
					thisObject.timer.start();
				}
				else {
					thisObject.standby._setTextAttr("");
					thisObject.standby.hide();
				}
			},
			error: function(response, ioArgs) {
				thisObject.standby.hide();
				console.log("View.addViewFeature    Error with put. Response: " + dojo.toJson(response));
			}
		}
	);
},

_addViewFeature : function (featureObject) {
	console.log("View._addViewFeature    View._addViewFeature(featureObject)");
	//console.log("View._addViewFeature    featureObject.project: " + featureObject.project);
	//console.log("View._addViewFeature    featureObject.view: " + featureObject.view);

	// ADD FEATURE TO VIEW
	var success = Agua._addViewFeature(featureObject);
	if ( success != true ){
		console.log("View._addViewFeature    Returning because Agua._addViewFeature returned success: " + success);
		Agua.toastError("Failed to add feature to local data: " + featureObject.feature);
		return;
	}
	Agua.toastInfo("Added feature: " + featureObject.feature);

	// SET VIEW COMBO
	console.log("View._addViewFeature    Doing this.setViewCombo(featureObject.project, featureObject.view)")
	this.setViewCombo(featureObject.project, featureObject.view);

	// RELOAD VIEW
	console.log("View._addViewFeature    Doing this.reloadBrowser(featureObject.project, featureObject.view)")
	this.reloadBrowser(featureObject.project, featureObject.view);
},

removeViewFeature : function () {
	console.log("View.removeViewFeature    plugins.view.View.removeViewFeature()");

	// SKIP IF ALREADY BUSY
	if ( this.timer.polling == true ) {
		console.log("View.addViewFeature    this.timer.polling IS TRUE. Returning");
		return;
	}

	this.showStandby("Removing feature: " + this.getViewFeature());

	// ADD TO DATA MODEL (LOCAL AND REMOTE)
	var featureObject = new Object;
	featureObject.project = this.getProject();
	featureObject.view = this.getView();
	featureObject.feature = this.getViewFeature();
	featureObject.species = this.getFeatureSpecies();
	featureObject.build = this.getFeatureBuild();
	featureObject.username = Agua.cookie('username');
	featureObject.sessionId = Agua.cookie('sessionId');
	featureObject.mode = "removeViewFeature";
	console.log("View.removeViewFeature    featureObject: " + dojo.toJson(featureObject, true));

	// DO REMOTE CALL
	var thisObject = this;
	var url = Agua.cgiUrl + "view.cgi";
	dojo.xhrPut(
		{
			url: url,
			contentType: "text",
			//preventCache : true,
			sync: false,
			handleAs: "json",
			putData: dojo.toJson(featureObject),
			load: function(response, ioArgs) {
				console.log("View.removeViewFeature    response: " + dojo.toJson(response));
				var match = response.status.match(/Adding feature:/);
				console.log("View.removeViewFeature    match: " + match);
				
				if ( response.status.match(/Removing feature: /) ) {
					console.log("View.removeViewFeature    STATUS: 'Removing feature...'");

					// SET TIMER CALLBACK
					thisObject.timer.callback = dojo.hitch(thisObject, "_removeViewFeature", featureObject);
					thisObject.timer.url = url;
					thisObject.timer.query = featureObject;
					thisObject.timer.query.mode = "viewStatus";
				
					// START TIMER
					console.log("View.removeViewFeature    Doing timer.start()");
					thisObject.timer.start();
				}
				else {
					thisObject.standby._setTextAttr("");
					thisObject.standby.hide();
				}
			},
			error: function(response, ioArgs) {
				thisObject.standby.hide();
				console.log("View.removeViewFeature    Error with put. Response: " + dojo.toJson(response));
			}
		}
	);
},

_removeViewFeature : function (featureObject) {
	console.log("View._removeViewFeature    featureObject: " + dojo.toJson(featureObject));

	// REMOVE FEATURE FROM VIEW
	var success = Agua._removeViewFeature(featureObject);
	if ( success != true ){
		console.log("View._removeViewFeature    Returning because Agua._removeViewFeature returned success: " + success);
		return;
	}

	// SET VIEW COMBO
	console.log("View._removeViewFeature    Doing Agua._removeViewFeature()");
	this.setViewCombo(featureObject.project, featureObject.view);

	// RELOAD VIEW
	console.log("View._removeViewFeature    Doing this.reloadBrowser(featureObject.project, featureObject.view)")
	this.reloadBrowser(featureObject.project, featureObject.view);
},

// SET COMPONENTS
setTimer : function () {
	console.log("View.setTimer    _GroupDragPane.setTimer()");
	if ( this.timer != null )	return this.timer;

	var onStart = dojo.hitch(this, "onStartRemote");
	var onEnd = dojo.hitch(this, "onEndRemote");
	var poll = dojo.hitch(this, "pollRemote");

	this.timer = new plugins.dojox.Timer({
		onStart		: onStart,
		onEnd		: onEnd,
		poll		: poll,
		interval	: 1000,
		attenuate	: true,
		intervalStep: 20000,
		maxInterval	: 30000 
	});

	return this.timer;
},

onStartRemote : function () {
// 4. SHOW ANIMATED 'COPYING' DIALOGUE
	console.log("View.onStartRemote    caller: " + this.onStartRemote.caller.nom);
	console.dir({caller:this.onStartRemote.caller});
	console.log("View.onStartRemote    this.standby: " + this.standby);
	this.standby.show();
},

pollRemote: function(timer) {
// 5. POLL SERVER FOR STATUS AND WAIT UNTIL COMPLETE
	console.log("View.pollRemote    timer: " + timer);
	console.dir({timer:timer});
	if ( timer.url == null )	return;
	if ( timer.query == null ) 	return;

	var thisObject = this;
	var completed = false;
	dojo.xhrPut(
		{
			url: timer.url,
			contentType: "text",
			//preventCache : true,
			putData: dojo.toJson(timer.query),
			handleAs: "json-comment-optional",
			sync: true,
			handle : function (response) {

				console.log("View.pollRemote    response: " + dojo.toJson(response, true));
				if ( response.status == 'ready'
					|| response.status == 'error'
					|| response.error != null ) {
					console.log("View.pollRemote    setting completed to TRUE");
					completed = true;
					timer.response = response;
				}
			}
		}
	);
	
	console.log("View.pollRemote    Returning completed: " + completed);
	return completed;
},

onEndRemote : function () {
// 6. IF COPY IS COMPLETED, RELOAD THE PANE TO
// DISPLAY THE NEW FILE SYSTEM
	console.log("View.onEndRemote    plugins.view.View.onEndRemote()");

	console.log("View.onEndRemote    Doing this.standby.hide()");
	this.standby.hide();

	console.log("View.onEndRemote    Doing this.timer.callback()");
	this.timer.callback();
},

setStandby : function () {
	console.log("View.setStandby    _GroupDragPane.setStandby()");
	if ( this.standby != null )	return this.standby;
	
	var id = dijit.getUniqueId("dojox_widget_Standby");
	this.standby = new dojox.widget.Standby (
		{
			target: this.rightPane.domNode,
			//onClick: "reload",
			centerIndicator : "text",
			text: "Waiting for remote featureName",
			id : id,
			url: "plugins/core/images/agua-biwave-24.png"
		}
	);
	document.body.appendChild(this.standby.domNode);
	dojo.addClass(this.standby.domNode, "view");
	dojo.addClass(this.standby.domNode, "standby");
	console.log("View.setStandby    this.standby: " + this.standby);

	return this.standby;
},

showStandby : function (message) {
	// SET STANDBY TEXT
	console.log("View.showStandby    message: " + message);
	this.standby._setTextAttr(message);
	this.standby.show();
},	

hideStandby : function () {
	// SET STANDBY TEXT
	this.standby._setTextAttr("");
	this.standby.hide();
},	

// BROWSER METHODS
loadBrowser : function (projectName, viewName) {
	console.log("View.loadBrowser      plugins.view.View.loadBrowser(projectName, viewName)");
	//console.log("View.loadBrowser      PASSED projectName: " + projectName);
	//console.log("View.loadBrowser      PASSED viewName: " + viewName);

	if ( projectName == null )	projectName = this.getProject();
	if ( viewName == null )		viewName = this.getView();
	console.log("View.loadBrowser      projectName: " + projectName);
	console.log("View.loadBrowser      viewName: " + viewName);

	// SELECT VIEW TAB IF EXISTS
	if ( this.selectBrowser(projectName, viewName) )	return;
	
	var username = Agua.cookie('username');
	var refseqfile = this.getRefseqfile(username, projectName, viewName);
	var trackinfofile = this.getTrackinfofile(username, projectName, viewName);
	//console.log("View.loadBrowser      refseqfile: " + refseqfile);
	//console.log("View.loadBrowser      trackinfofile: " + trackinfofile);

	// LOAD refSeqs AND trackInfo JSON FILES
	this.loadEval(trackinfofile);
	this.loadEval(refseqfile);
	if ( refSeqs == null )
	{
		console.log("View.loadBrowser      refSeqs is null. Returning");
		return;
	}
	if ( trackInfo == null )
	{
		console.log("View.loadBrowser      trackInfo is null. Returning");
		return;
	}
	//this.loadEval("plugins/view/jbrowse/species/human/hg19/data/trackInfo.js");
	//this.loadEval("plugins/view/jbrowse/species/human/hg19/data/refSeqs.js");
	//console.log("View.loadBrowser      refSeqs: " + refSeqs);
	//console.log("View.loadBrowser      trackInfo: " + dojo.toJson(trackInfo));

	// CHECK INPUTS
	if ( projectName == null || viewName == null )
	{
		console.log("View.loadBrowser    One of the required inputs (projectName, viewName) is null. Returning");
		return;
	}

	var viewObject = Agua.getViewObject(projectName, viewName);
	var trackList	=	viewObject.tracklist;
	var speciesName	=	viewObject.species;
	var buildName	=	viewObject.build;
	var username = Agua.cookie('username');
	console.log("View.loadBrowser      viewObject: " + dojo.toJson(viewObject, true));
	//console.log("View.loadBrowser      trackList: " + trackList);
	//console.log("View.loadBrowser      speciesName: " + speciesName);
	//console.log("View.loadBrowser      buildName: " + buildName);
	//console.log("View.loadBrowser      username: " + username);

	// SET LOCATION OBJECT {"name":"chr1","start":"99,711,844","stop":"149,561,968"}
	// AND STRING "chr1:99,711,844 .. 149,561,968"
	var startStop = viewObject.start + "..." + viewObject.stop;
	var chromosome = viewObject.chromosome;
	var locationObject = {
		name: chromosome,
		start: viewObject.start,
		stop: viewObject.stop
	};
	//var location	=	chromosome + ":" + viewObject.start + "featureName" + viewObject.stop;
	var location	=	chromosome + ":" + startStop;
	console.log("View.loadBrowser      location: " + location);
	
	// GET UNIQUE ID FOR THIS MENU TO BE USED IN DND SOURCE LATER
	var objectName = "plugins.view.View.jbrowse.Browser";
	var browserId = dijit.getUniqueId(objectName.replace(/\./g,"_"));
	
	// SET LOADING FLAG TO STOP PREMATURE updateViewLocation/ViewTracklist
	this.loading = true;
	
	var b = new plugins.view.jbrowse.js.Browser({
		
		parentWidget : this,
		viewObject : viewObject,
		speciesName: speciesName,
		buildName  : buildName,
		species    : speciesName,
		build      : buildName,
		refSeqs: refSeqs,
		trackData: trackInfo,
		baseUrl : this.baseUrl,
		dataRoot : this.baseUrl + "/users/" + username + "/" + projectName + "/" + viewName+ "/",
		
		locationObject : locationObject,
		location : location,
		
		//browserRoot : this.baseUrl,
		browserRoot : "plugins/view/jbrowse/",
		//defaultLocation : "chr2:10000000..100000000",
		//trackList : "vegaGene,tRNAs,gap,ccdsGene",
		//defaultTracks : "vegaGene,CCDS", 
		trackList : trackList,
		tracks : trackList,
		//showTracks : "Assembly,Gap",		
		attachWidget : this.rightPane
	});

	// ADD TO this.browsers ARRAY		
	this.addBrowser(b, projectName, viewName);
	console.dir({browser:b});

	// SET NAVIGATION BOX VALUES
	b.chromList.value = viewObject.chromosome;
	b.locationBox.value = viewObject.start  + "..." + viewObject.stop;

	console.log("View.loadBrowser    XXXXXXX END OF LOADING XXXXXX");
	console.log("View.loadBrowser    this.loading: " + this.loading);

	// CONNECT TO browser.mainTab DESTROY TO DO this.removeBrowser
	dojo.connect(b.mainTab, "destroy", dojo.hitch(this, "removeBrowserObject", b, projectName, viewName));
	
	//if ( location == null || location == '' ){
	//	b.navigateTo("chr1:0featureName20720000");
	//	//b.navigateTo("chr1:0featureName20720000");
	//}
	//else {
	//	console.log("View.loadBrowser      BEFORE b.navigateTo(" + location + ")");	
	//	b.navigateTo(location);
	//	console.log("View.loadBrowser      AFTER b.navigateTo(" + location + ")");
	//}
	
	console.log("View.loadBrowser      XXXXXXX END OF NAVIGATION XXXXXX");
	this.loading = false;
	console.log("View.loadBrowser    SET this.loading TO : " + this.loading);
	
}, // 	loadBrowser 

reloadBrowser : function (projectName, viewName) {
	console.log("View.reloadBrowser      plugins.viewName.View.reloadBrowser(projectName, workflow, viewName, species, build)");
	console.log("View.reloadBrowser      projectName: " + projectName);
	console.log("View.reloadBrowser      viewName: " + viewName);

	var browser = this.getBrowser(projectName, viewName); 
	if ( browser != null )
	{
		// REMOVE EXISTING BROWSER FOR THIS VIEW
		console.log("View.reloadBrowser    BEFORE this.removeBrowser(projectName, workflow, viewName)");
		this.removeBrowser(browser.browser, projectName, viewName);
		console.log("View.reloadBrowser    AFTER this.removeBrowser(projectName, workflow, viewName)");
	}
	this.loadBrowser(projectName, viewName);

	console.log("View.reloadBrowser    AFTER loadBrowser");

}, // 	reloadBrowser 

selectBrowser : function (projectName, viewName) {
// FOR EACH NEWLY OPENED VIEW TAB, THE ASSOCIATED BROWSER 
// OBJECT IS ADDED TO this.browsers ARRAY
	//console.log("View.selectBrowser    plugins.view.View.selectBrowser(projectName, viewName)");
	//console.log("View.selectBrowser    projectName: " + projectName);
	//console.log("View.selectBrowser    viewName: " + viewName);

	var browserObject = this.getBrowser(projectName, viewName);
	//console.log("View.selectBrowser    browserObject: " + browserObject);
	if ( browserObject == null )	return;
	var browser = browserObject.browser;

	//console.log("View.selectBrowser    BEFORE selectChild(browser.mainTab)");
	this.rightPane.selectChild(browser.mainTab);
	//console.log("View.selectBrowser    AFTER selectChild(browser.mainTab)");
	return 1;
},

getBrowser : function (projectName, viewName) {
	//console.log("View.getBrowser    plugins.viewName.View.getBrowser(projectName, workflow, viewName)");
	//console.log("View.getBrowser    projectName: " + projectName);
	//console.log("View.getBrowser    viewName: " + viewName);

	var index = this.getBrowserIndex(projectName, viewName);
	//console.log("View.selectBrowser    index: " + index);
	if ( index == null )	return;

	return this.browsers[index];
},

addBrowser : function(browser, projectName, viewName) {
// FOR EACH NEWLY OPENED VIEW TAB, THE ASSOCIATED BROWSER 
// OBJECT IS ADDED TO this.browsers ARRAY
	//console.log("View.addBrowser    plugins.view.View.addBrowser(browser, project, workflow, view)");
	//console.log("View.addBrowser    browser: " + browser);
	//console.log("View.addBrowser    projectName: " + projectName);
	//console.log("View.addBrowser    viewName: " + viewName);
	//if ( this.isBrowser(projectName, viewName) )
	//{
	//	//console.log("View.addBrowser    isBrowser");
	//	this.deleteBrowser(projectName, viewName);
	//}
	
	var browserObject = {
		browser : 	browser,
		project: 	projectName,
		view:		viewName
	};

	var success = this._addObjectToArray(this.browsers, browserObject, ["browser", "project", "view"]);
	//console.log("View.addBrowser    success: " + success);

	return success;	
},

isBrowser : function (projectName, viewName) {
	//console.log("View.isBrowser    plugins.view.View.isBrowser(projectName, viewName)");
	//console.log("View.isBrowser    projectName: " + projectName);
	//console.log("View.isBrowser    viewName: " + viewName);

	if ( this.getBrowserIndex(projectName, viewName) != null )	return 1;
	return 0;
},

getBrowserIndex : function (projectName, viewName) {
	//console.log("View.getBrowserIndex    plugins.view.View.getBrowserIndex(projectName, viewName)");
	//console.log("View.getBrowserIndex    projectName: " + projectName);
	//console.log("View.getBrowserIndex    viewName: " + viewName);

	var browserObject = {
		project: 	projectName,
		view:		viewName
	};

	var index = this._getIndexInArray(this.browsers, { project: projectName, view: viewName }, [ "project", "view" ])
	//console.log("View.getBrowserIndex    index: " + index);	
	
	return index;
},


removeBrowser : function (browser, projectName, viewName) {
// WHEN A VIEW TAB IS CLOSED, REMOVE ITS ASSOCIATED
// browser OBJECT FROM this.browsers AND DESTROY IT
	console.log("View.removeBrowser    plugins.viewName.View.removeBrowser(browser, projectName, viewName)");
	console.log("View.removeBrowser    browser: " + browser);
	console.log("View.removeBrowser    projectName: " + projectName);
	console.log("View.removeBrowser    viewName: " + viewName);
	
	this.removeBrowserTab(browser);
	var success = this.removeBrowserObject(browser);
	console.log("View.removeBrowser    success: " + success);
},

removeBrowserObject : function (browser, projectName, viewName) {
	//console.log("View.removeBrowserObject    plugins.viewName.View.removeBrowserObject(browserObject)");
	//console.log("View.removeBrowserObject    browser: " + browser);
	//console.log("View.removeBrowserObject    projectName: " + projectName);
	//console.log("View.removeBrowserObject    viewName: " + viewName);
	var browserObject = {
		browser : 	browser,
		project: 	projectName,
		view:		viewName
	};

	//console.log("View.removeBrowserObject    BEFORE this.browsers.length: " + this.browsers.length);
	var success = this._removeObjectFromArray(this.browsers, browserObject, ["browser", "project", "view"]);
	//console.log("View.removeBrowserObject    success: " + success);
	//console.log("View.removeBrowserObject    AFTER this.browsers.length: " + this.browsers.length);

	return success;	
},

removeBrowserTab : function (browser, projectName, viewName) {
	// REMOVE BROWSER TAB FROM PANE
	console.log("View.removeBrowserTab    plugins.view.View.removeChild(browser)");

	this.rightPane.removeChild(browser.mainTab);
	console.log("View.removeBrowserTab    AFTER removeChild(browser.mainTab)");

	// DESTROY BROWSER WIDGET	
	console.log("View.removeBrowserTab    BEFORE browser.destroy(), browser: " + browser);
	browser.destroyRecursive();
	console.log("View.removeBrowserTab    AFTER browser.destroy(), browser: " + browser);
},

// FIRE COMBO HANDLERS
fireViewProjectCombo : function() {
	console.log("View.fireViewProjectCombo    viewProjectCombo._onchange");
	var projectName = this.viewProjectCombo.get('value');
	this.setViewCombo(projectName);
},

fireViewCombo : function () {
// ONCHANGE IN VIEW COMBO FIRED
	if ( ! this.viewComboFired == true )
	{
		this.viewComboFired = true;
	}
	else {
		console.log("View.fireViewCombo    plugins.view.View.fireViewCombo()");
	
		var projectName = this.getProject();
		var viewName = this.getView();
		console.log("View.fireViewCombo    projectName: " + projectName);
		console.log("View.fireViewCombo    viewName: " + viewName);
		this.setSpeciesLabel(projectName, viewName);
	
		this.loadBrowser(projectName, viewName);
	}
},

fireFeatureProjectCombo : function() {
	if ( ! this.featureProjectComboFired == true )
	{
		this.featureProjectComboFired = true;
	}
	else {
		console.log("View.fireFeatureProjectCombo    plugins.view.View.fireFeatureProjectCombo()");
		var projectName = this.featureProjectCombo.get('value');
		this.setWorkflowCombo(projectName);
	}
},

fireWorkflowCombo : function() {
	if ( ! this.workflowComboFired == true )
	{
		this.workflowComboFired = true;
	}
	else {
		console.log("View.fireWorkflowCombo    plugins.view.View.fireWorkflowCombo()");
		var projectName = this.featureProjectCombo.get('value');
		var workflowName = this.workflowCombo.get('value');
		this.setSpeciesCombo(projectName, workflowName);
	}
},

fireSpeciesCombo : function () {
	if ( ! this.speciesComboFired == true )
	{
		console.log("View.fireSpeciesCombo    FIRST FIRE");
		this.speciesComboFired = true;
	}
	else {
		console.log("View.fireSpeciesCombo    plugins.view.View.fireSpeciesCombo()");
		var projectName = this.viewProjectCombo.get('value');
		var workflowName = this.workflowCombo.get('value');
		var speciesName = this.getSpecies();
		var buildName = this.getBuild();
		console.log("View.fireSpeciesCombo    projectName: " + projectName);
		console.log("View.fireSpeciesCombo    workflowName: " + workflowName);
		console.log("View.fireSpeciesCombo    speciesName: " + speciesName);
		console.log("View.fireSpeciesCombo    buildName: " + buildName);
		console.log("View.fireSpeciesCombo    this.setFeatureCombo(" + projectName + ", " + workflowName + ", " + speciesName + ", " + buildName + ")");
		
		if ( speciesName == null || buildName == null )
		{
			console.log("View.fireSpeciesCombo    speciesName and/or buildName is null. Returning.");
			return;
		}
		
		this.setFeatureCombo(projectName, workflowName, speciesName, buildName);
	}
},
// VIEW METHODS
refreshView : function () {
/* RESET VIEW STATUS TO 'ready' AND RELOAD PANE */
	console.log("View.refreshView    plugins.view.View.refreshView()");
	
	// HIDE STANDBY
	this.standby.hide();

	// RELOAD BROWSER
	this.reloadBrowser(this.getProject(), this.getView());

	// PREPARE FEATURE TRACK OBJECT
	var featureObject = new Object;
	// SOURCE FEATURE
	featureObject.feature = this.getFeature();
	featureObject.sourceproject = this.getFeatureProject();
	featureObject.sourceworkflow = this.getFeatureWorkflow();
	featureObject.species = this.getFeatureSpecies();
	featureObject.build = this.getFeatureBuild();
	// VIEW INFO
	featureObject.project = this.getProject();
	featureObject.view = this.getView();
	// USER INFO
	featureObject.username = Agua.cookie('username');
	featureObject.sessionId = Agua.cookie('sessionId');
	// MODE
	featureObject.mode = "refreshView";
	//console.log("View.addViewFeature    featureObject: " + dojo.toJson(featureObject, true));
	//console.log("View.addViewFeature    featureObject: " + dojo.toJson(featureObject));

	// DO REMOTE CALL
	var url = Agua.cgiUrl + "view.cgi";
	this.doPut({ url: this.url, query: featureObject });
},

setOnkeyListener : function () {
	//console.log("View.setOnkeyListener    plugins.view.View.setOnkeyListener()");

	// SET ONKEYPRESS LISTENER
	var thisObject = this;
	this.viewCombo._onKey = function(event){
		//console.log("View.setOnKeyListener._onKey	  event");
		
		// summary: handles keyboard events
		var key = event.charOrCode;			
		//console.log("View.setOnKeyListener._onKey	    key: " + key);
		if ( key == 13 )
		{
			//thisObject.workflowCombo._hideResultList();
			
			var projectName = thisObject.viewProjectCombo.get('value');
			var viewName = thisObject.viewCombo.get('value');
			//console.log("View.setOnKeyListener._onKey	   projectName: " + projectName);
			//console.log("View.setOnKeyListener._onKey	   thisObject.viewCombo: " + thisObject.viewCombo);
			//console.log("View.setOnKeyListener._onKey	   viewName: " + viewName);
			
			// STOP PROPAGATION
			//event.stopPropagation();
			
			//console.log("View.setOnKeyListener._onKey	   Checking if isView");
			var isView = Agua.isView(projectName, viewName);
			//console.log("View.setOnKeyListener._onKey	   isView: " + isView);

			if ( isView == false )	thisObject.addView(projectName, viewName);
				
			if ( thisObject.viewCombo._popupWidget != null )
			{
				thisObject.viewCombo._showResultList();
			}
		}

		// STOP PROPAGATION
		//event.stopPropagation();
	};
},

removeView : function () {
	console.log("View.removeView    plugins.view.View.removeView()");

	var projectName = this.getProject();
	var viewName = this.getView();
	console.log("View.removeView    projectName: " + projectName);
	console.log("View.removeView    viewName: " + viewName);
	
	// ADD TO DATA MODEL (LOCAL AND REMOTE)
	var viewObject = new Object;
	viewObject.project = projectName;
	viewObject.view = viewName;
	console.log("View.removeView    viewObject: " + dojo.toJson(viewObject, true));

	var success = Agua.removeView(viewObject);
	if ( success == true ) {
		console.log("View.removeView    Removed view from this.views: " + viewName);
	}
	else {
		console.log("View.removeView    Could not remove view from this.views: " + viewName);
		return;
	}
	
	// ADD ON REMOTE DATABASE
	var url = Agua.cgiUrl + "view.cgi";
	viewObject.username = Agua.cookie('username');
	viewObject.sessionId = Agua.cookie('sessionId');
	viewObject.mode = "removeView";

	var callback = dojo.hitch(this, function() { this.setViewCombo(projectName)});

	//// REMOVE VIEW TAB IF EXISTS
	//var browserObject = this.getBrowser(projectName, viewName);
	////console.log("View.selectBrowser    browserObject: " + browserObject);
	//if ( browserObject == null )	return;
	//var browser = browserObject.browser;
	//browser.destroy();

	this.doPut({ url: url, query: viewObject, callback: callback });	
},

setViewProjectCombo : function (projectName) {
	//console.log("View.setViewProjectCombo    plugins.view.View.setViewProjectCombo(projectName)");
	//console.log("View.setViewProjectCombo    projectName: " + projectName);

	var projectNames = Agua.getProjectNames();
	if ( ! projectNames )
	{
		//console.log("  Common.setViewProjectCombo    projectNames not defined. Returning.");
		return;
	}
	////console.log("  Common.setViewProjectCombo    projects: " + dojo.toJson(projects));

	// DO DATA ARRAY
	var data = {identifier: "name", items: []};
	for ( var i in projectNames )
		data.items[i] = { name: projectNames[i]	};
	var store = new dojo.data.ItemFileReadStore( {	data: data	} );
	this.viewProjectCombo.store = store;	
	
	// SET PROJECT IF NOT DEFINED TO FIRST ENTRY IN projects
	if ( projectName == null || ! projectName)	projectName = projectNames[0];	
	this.viewProjectCombo.setValue(projectName);			
	
	// SET CSS
	this.viewProjectCombo.popupClass = "view viewCombo dijitReset dijitMenu";
	this.viewProjectCombo.wrapperClass = "view dijitPopup";
	this.viewProjectCombo.itemHeight = 30;		

	if ( projectName == null )	projectName = this.viewProjectCombo.get('value');

	// RESET THE WORKFLOW COMBO
	//console.log("View.setViewProjectCombo    BEFORE this.setWorkflowCombo(" + projectName + ")");
	this.setViewCombo(projectName);
},

setViewCombo : function (projectName, viewName) {
	//console.log("View.setViewCombo    plugins.view.View.setViewCombo(projectName, viewName)");
	//console.log("View.setViewCombo    projectName: " + projectName);
	//console.log("View.setViewCombo    viewName: " + viewName);

	//this.killPopup(this.viewCombo);

	// DO COMBO WIDGET SETUP	
	this.inherited(arguments);
	
	//// SET CSS
	//this.viewCombo.popupClass = "view viewCombo dijitReset dijitMenu";
	//this.viewCombo.wrapperClass = "view dijitPopup";
	//this.viewCombo.itemHeight = 30;		
	
	// SET VIEW NAME IF NOT DEFINED
	if ( viewName == null )
	{
		var views = Agua.getViewsByProject(projectName);
		////console.log("View.setViewCombo    views: " + dojo.toJson(views));
		if ( views == null || views.length == 0 )	return;
		if ( views.length > 0 ) viewName = views[0].view;
	}
	//console.log("View.setViewCombo    DOING this.setSpeciesCombo(" + projectName + ", " + viewName + ")");
	
	this.setSpeciesLabel(projectName, viewName);
},

setSpeciesLabel : function (projectName, viewName) {
// SET SPECIES AND BUILD LABELS
	//console.log("View.setSpeciesLabel    plugins.view.View.setSpeciesLabel(projectName, viewName)");
	//console.log("View.setSpeciesLabel    projectName: " + projectName);
	//console.log("View.setSpeciesLabel    viewName: " + viewName);

	var species = Agua.getSpecies(projectName, viewName);
	this.speciesLabel.innerHTML = species || '';
	var build = Agua.getBuild(projectName, viewName);
	this.buildLabel.innerHTML = build || '';

	// SET SPECIES COMBO VALUE
	var setValue = species + "(" + build + ")";
	this.speciesCombo.set('value', setValue);

	// SET FEATURE LIST
	var viewfeatures = Agua.getViewFeatures(projectName, viewName);
	var featureNames = this.hasharrayKeyToArray(viewfeatures, "feature");
	//for ( var i = 0; i < viewfeatures.length; i++ )
	//	featureNames.push(viewfeatures[i].feature);
	//console.log("View.setSpeciesLabel    featureNames: " + dojo.toJson(featureNames));

	this.setFeatureList(featureNames);
},

setSelectiveDialog : function () {
	var enterCallback = function (){};
	var cancelCallback = function (){};
	var title = "";
	var message = "";
	
	console.log("Stages.setSelectiveDialog    plugins.files.Stages.setSelectiveDialog()");
	this.selectiveDialog = new plugins.dijit.SelectiveDialog(
		{
			title 				:	title,
			message 			:	message,
			parentWidget 		:	this,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback
		}			
	);
	console.log("Stages.setSelectiveDialog    this.selectiveDialog: " + this.selectiveDialog);
},

loadSelectiveDialog : function (title, message, comboValues, inputMessage, comboMessage, checkboxMessage, enterCallback, cancelCallback) {
	console.log("Stages.loadSelectiveDialog    plugins.files.Stages.loadSelectiveDialog()");
	console.log("Stages.loadSelectiveDialog    enterCallback.toString(): " + enterCallback.toString());
	console.log("Stages.loadSelectiveDialog    title: " + title);
	console.log("Stages.loadSelectiveDialog    message: " + message);
	console.log("Stages.loadSelectiveDialog    enterCallback: " + enterCallback);
	console.log("Stages.loadSelectiveDialog    cancelCallback: " + cancelCallback);


	this.selectiveDialog.load(
		{
			title 				:	title,
			message 			:	message,
			comboValues 		:	comboValues,
			inputMessage 		:	inputMessage,
			comboMessage 		:	comboMessage,
			checkboxMessage		:	checkboxMessage,
			parentWidget 		:	this,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback
		}			
	);
},

addView : function (projectName, viewName) {
// DISPLAY A 'Copy Workflow' DIALOG THAT ALLOWS THE USER TO SELECT 
// THE DESTINATION PROJECT AND THE NAME OF THE NEW WORKFLOW
	console.log("Stages.addView    plugins.files.Stages.addView()");
	console.log("Stages.addView    this.selectiveDialog: " + this.selectiveDialog);

	var thisObject = this;
	var speciesBuilds = Agua.getSpeciesBuilds();
	console.log("Stages.addView    speciesBuilds: " + dojo.toJson(speciesBuilds));
	var enterCallback = dojo.hitch(this, function (input, speciesBuild, checked, dialogWidget)
		{
			console.log("Stages.addView    Doing enterCallback(input, speciesBuild, checked, dialogWidget)");
			console.log("Stages.addView    viewName: " + viewName);
			console.log("Stages.addView    projectName: " + projectName);
			console.log("Stages.addView    input: " + input);
			console.log("Stages.addView    speciesBuild: " + speciesBuild);
			console.log("Stages.addView    checked: " + checked);
			console.log("Stages.addView    dialogWidget: " + dialogWidget);
			
			dialogWidget.messageNode.innerHTML = "Adding view";
			dialogWidget.close();
			
			thisObject._remoteAddView(projectName, viewName, speciesBuild);
		}
	);		
	var cancelCallback = function (){
		console.log("Stages.addView    cancelCallback()");
	};

	// SHOW THE DIALOG
	this.selectiveDialog.load(
		{
			title 				:	"Add view",
			message 			:	"Select species/build combination",
			comboValues 		:	speciesBuilds,
			inputMessage 		:	null,
			comboMessage 		:	null,
			checkboxMessage		:	null,
			parentWidget 		:	this,
			enterCallback 		:	enterCallback,
			cancelCallback 		:	cancelCallback,
			enterLabel			:	"Add",
			cancelLabel			:	"Cancel"
		}			
	);
},

_remoteAddView : function (projectName, viewName, speciesBuild) {	
	console.log("View._remoteAddView    view.View._remoteAddView(" + projectName + "," +  viewName + ", " + speciesBuild + ")");

	var species = speciesBuild.match(/^(\S+)\(([^\)]+)\)$/)[1];
	var build = speciesBuild.match(/^(\S+)\(([^\)]+)\)$/)[2];
	console.log("View._remoteAddView    species: " + species);
	console.log("View._remoteAddView    build: " + build);
	
	var viewObject = new Object;
	viewObject.project = projectName;
	viewObject.view = viewName;
	viewObject.species = species;
	viewObject.build = build;
	viewObject.more = "addView";

	// DO REMOTE CALL
	var thisObject = this;
	var url = Agua.cgiUrl + "view.cgi";
	dojo.xhrPut(
		{
			url: url,
			contentType: "text",
			//preventCache : true,
			sync: false,
			handleAs: "json",
			putData: dojo.toJson(viewObject),
			load: function(response, ioArgs) {
				console.log("View.addViewFeature    response: " + dojo.toJson(response));
				var match = response.status.match(/Adding feature:/);
				console.log("View.addViewFeature    match: " + match);
				
				if ( response.status.match(/Adding feature: /) ) {
					console.log("View.addViewFeature    STATUS: 'Adding feature...'");

					// SET TIMER CALLBACK
					thisObject.timer.callback = dojo.hitch(thisObject, "_addView", viewObject);
					thisObject.timer.url = url;
					thisObject.timer.query = viewObject;
					thisObject.timer.query.mode = "viewStatus";
				
					// START TIMER
					console.log("View.addViewFeature    Doing timer.start()");
					thisObject.timer.start();
				}
				else {
					thisObject.standby._setTextAttr("");
					thisObject.standby.hide();
				}
			},
			error: function(response, ioArgs) {
				console.log("View.addViewFeature    Error with put. Response: " + response);
				return response;
			}
		}
	);

},

_addView : function (projectName, viewName, speciesBuild) {	
	console.log("View._addView    view.View._addView(" + projectName + "," +  viewName + ", " + speciesBuild + ")");


	var success = Agua.addView(viewObject);

	if ( success == true ) {
		console.log("View.addView    Added view to this.views[" + viewObject.view + "]");
	}
	else {
		console.log("View.addView    Could not add view to this.views[" + viewObject.view + "]");
		return;
	}
	
	// SET SPECIES LABEL TO BLANK
	this.speciesLabel.innerHTML = '';
	this.buildLabel.innerHTML = '';

	// ADD STAGE TO stage TABLE IN REMOTE DATABASE
	viewObject.username = Agua.cookie('username');
	viewObject.sessionId = Agua.cookie('sessionId');
	viewObject.mode = "addView";

	//var callback = dojo.hitch(this, function() { this.setViewCombo(projectName, viewName)});
	// WAIT FOR MAX 90 SECONDS FOR VIEW TO BE GENERATED
	Agua.warning("Generating view "  + viewName + ". Please wait while data is processed");
	this.setViewCombo(projectName, viewName);

	var callback = dojo.hitch(this, function() {
		console.log("View._addView    firing callback to run this.reloadBrowser()");
		this.reloadBrowser(projectName, viewName)
	});

	this.doPut({ url: this.url, query: viewObject, callback: callback, timeout: 120000 });	

	//// WAIT ONE MINUTE THEN RELOAD BROWSER
	//setTimeout(this, function() { thisObject.loadBrowser(projectName, viewName)}, 60000);

	//this.loadBrowser();
},

updateViewLocation : function (viewObject, location, chrom) {	
	// SKIP IF STILL LOADING
	if ( this.loading == true )	return 1;

	console.log("View.updateViewLocation    view.View.updateViewLocation(viewObject, location, chrom)");
	console.log("View.updateViewLocation    caller: " + this.updateViewLocation.caller.nom);
	console.log("View.updateViewLocation    viewObject: " + dojo.toJson(viewObject));
	console.log("View.updateViewLocation    location: " + location);
	console.log("View.updateViewLocation    chrom: " + chrom);
	console.log("View.updateViewLocation    this.loading: ");
	console.dir({loading:this.loading});
	console.log("View.updateViewLocation    VIEWS: ");
	console.dir({views:Agua.data.views})
	

	// SKIP IF LOCATION NOT DEFINED OR NO MATCH
	if ( location == null )	return 1;
	var matches = String(location).match(/^(((\S*)\s*:)?\s*(-?[0-9,.]*[0-9])\s*(\.\.|-|\s+))?\s*(-?[0-9,.]+)$/i);
	if ( matches == null )	return 1;

	// PARSE LOCATION FOR CHROMOSOME, START AND STOP
	//matches[6] = end base (or center base, if it's the only one)
	var chromosome = matches[3];
	if ( chromosome == null)	chromosome = chrom;
	var start = parseInt(matches[4].replace(/[,.]/g, ""));
	var stop = parseInt(matches[6].replace(/[,.]/g, ""));
	console.log("View.updateViewLocation    chromosome: " + chromosome);
	console.log("View.updateViewLocation    start: " + start);
	console.log("View.updateViewLocation    stop: " + stop);

	// SKIP IF BOTH START AND STOP NOT DEFINED
	if ( ! start && ! stop )	return 1;

	console.log("View.updateViewLocation    BEFORE Agua.getViewObject");
	console.dir({views:Agua.data.views})
	
	var object = Agua.getViewObject(viewObject.project, viewObject.view);
	console.log("View.updateViewLocation    object: " + dojo.toJson(object));

	console.log("View.updateViewLocation    AFTER Agua.getViewObject");
	console.dir({views:Agua.data.views})

	if ( ! object )
	{
		console.log("View.updateViewLocation    object NOT DEFINED");
		return;
	}
	
	if ( object.chromosome == chromosome
		&& object.start == start
		&& object.stop == stop )	return;

	object.chromosome = chromosome;
	object.start = start;
	object.stop = stop;
	
	console.log("View.updateViewLocation    BEFORE removeView(object): " + dojo.toJson(object));
	var success = Agua.removeView(object);
	if ( success != true ) {
		console.log("View.updateViewLocation    Could not do Agua.removeView() for add track to view " + viewObject.view);
		return;
	}
	console.log("View.updateViewLocation    BEFORE addView(object): " + dojo.toJson(object));

	success = Agua.addView(object);
	if ( success != true ) {
		//console.log("View.updateViewLocation    Could not do Agua.addView() for update track to view " + viewObject.view);
		return;
	}	
	////console.log("View.updateViewLocation    Agua.views: " + dojo.toJson(Agua.views, true));

	// ADD STAGE TO stage TABLE IN REMOTE DATABASE
	object.username = Agua.cookie('username');
	object.sessionId = Agua.cookie('sessionId');
	object.mode = "updateViewLocation";
	////console.log("View.updateViewLocation    object: " + dojo.toJson(object));

	this.doPut({ url: this.url, query: object });	
},

updateViewTracklist : function (viewObject, track, action) {	
	//console.log("View.updateViewTracklist    view.View.updateViewTracklist(viewObject, track, action)");
	//console.log("View.updateViewTracklist    caller: " + this.updateViewTracklist.caller.nom);
	//console.log("View.updateViewTracklist    viewObject: " + dojo.toJson(viewObject));
	//console.log("View.updateViewTracklist    track: " + track);
	//console.log("View.updateViewTracklist    action: " + action);
	//
	//console.log("View.updateViewTracklist    this.loading: ");
	//console.dir({loading:this.loading});
	if ( this.loading == true )	return 1;

	
	var object = Agua.getViewObject(viewObject.project, viewObject.view);
	//console.log("View.updateViewTracklist    object: " + dojo.toJson(object));

	var tracks;
	if ( object.tracklist != null ){
		
		tracks = object.tracklist.split(",");
	}
	else
		tracks = [];

	console.log("View.updateViewTracklist    BEFORE tracks: " + dojo.toJson(tracks));
	var index;
	for ( var i = 0; i < tracks.length; i++ )
	{
		if ( tracks[i] == track )
		{
			index = i;
			continue;
		}
	}
	console.log("View.updateViewTracklist    index: " + index);

	if ( action == "add" ) {
		if ( index != null )	return 0;
		else	tracks.push(track);
	}
	if ( action == "remove" ) {
		if ( index == null )	return 1;
		else	tracks.splice(index, 1);
	}
	console.log("View.updateViewTracklist    AFTER tracks: " + dojo.toJson(tracks));
	
	object.tracklist = tracks.join(",");
	console.log("View.updateViewobject.tracklist    AFTER object.tracklist: " + object.tracklist);
	
	var success = Agua.removeView(object);
	if ( success != true ) {
		console.log("View.updateViewTracklist    Could not do Agua.removeView() for add track to view " + viewObject.view);
		return;
	}
	success = Agua.addView(object);
	if ( success != true ) {
		console.log("View.updateViewTracklist    Could not do Agua.addView() for update track to view " + viewObject.view);
		return;
	}
	
	// COMPLETE QUERY OBJECT
	object.username = Agua.cookie('username');
	object.sessionId = Agua.cookie('sessionId');
	object.mode = "updateViewTracklist";

	this.doPut({ url: this.url, query: object });	
}	


}); // end of plugins.view.View

