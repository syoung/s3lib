dojo.provide("plugins.view.Chromosomes");


// DISPLAY DIFFERENT PAGES TO ALLOW THE view AND ORDINARY
// USERS TO MODIFY THEIR SETTINGS

//// DnD
//dojo.require("dojo.dnd.Source"); // Source & Target
//dojo.require("dojo.dnd.Moveable");
//dojo.require("dojo.dnd.Mover");
//dojo.require("dojo.dnd.move");
//
//// fisheye lite menu animation
//dojo.require("dojox.widget.FisheyeLite");
//
//// comboBox data store
//dojo.require("dojo.data.ItemFileReadStore");
//dojo.require("dijit.form.ComboBox");
//
//// rightPane buttons
//dojo.require("dijit.form.Button");



// STORE FOR PROJECT AND WORKFLOW COMBOS
dojo.require("dojo.data.ItemFileReadStore");

// CUSTOM EDITOR
dojo.require("plugins.report.Editor");


// FILE UPLOAD
dojo.require("plugins.form.UploadDialog");

// RESIZE
dojo.require("dojox.layout.ResizeHandle");

// NOTES EDITOR
dojo.require("dijit.Editor");
dojo.require("dijit.form.DateTextBox");
dojo.require("dijit.form.Textarea");

dojo.require("dijit.form.TextBox");
dojo.require("dijit.form.ValidationTextBox");
dojo.require("dijit.form.NumberTextBox");
dojo.require("dijit.form.CurrencyTextBox");
dojo.require("dojo.currency");
dojo.require("dijit.Dialog");


// FILE MANAGER HAS FILE SELECTORS
dojo.require("plugins.workflow.FileManager");
dojo.require("plugins.workflow.FileSelector");


dojo.require("dojo.data.ItemFileReadStore");
dojo.require("dijit.form.ComboBox");
dojo.require("dijit.Tree");
dojo.require("dijit.layout.AccordionContainer");
dojo.require("dijit.layout.TabContainer");
dojo.require("dijit.layout.ContentPane");
dojo.require("dijit.layout.BorderContainer");
dojo.require("dojox.layout.FloatingPane");
dojo.require("dojo.fx.easing");
dojo.require("dojox.rpc.Service");
dojo.require("dojo.io.script");


// INHERITED
dojo.require("plugins.core.Common");

// HAS A
dojo.require("dijit.layout.BorderContainer");
dojo.require("dojox.layout.ExpandoPane");



// WIDGETS IN TEMPLATE
dojo.require("dijit.layout.SplitContainer");
dojo.require("dijit.layout.ContentPane");
dojo.require("dojo.parser");


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

// SPECIES- AND BUILD-SPECIFIC FILES
dojo.require("plugins.view.jbrowse.species.human.hg19.data.refSeqs");
dojo.require("plugins.view.jbrowse.species.human.hg19.data.trackInfo");
//dojo.require("plugins.view.jbrowse.human.data.refSeqs");
//dojo.require("plugins.view.jbrowse.human.data.trackInfo");


dojo.require("plugins.view.jbrowse.js.Browser");

dojo.require("dijit._base.place");

dojo.declare( "plugins.view.Chromosomes",
	[ dijit._Widget, dijit._Templated, plugins.core.Common ],
{
	////}
	
// PATH TO WIDGET TEMPLATE
templatePath: dojo.moduleUrl("", "../plugins/view/templates/view.html"),

// PARENT NODE, I.E., TABS NODE
parentWidget : null,

// PROJECT NAME AND WORKFLOW NAME IF AVAILABLE
project : null,
workflow : null,

// onChangeListeners : Array. LIST OF COMBOBOX ONCHANGE LISTENERS
onChangeListeners : [],

// setListeners : Boolean. SET LISTENERS FLAG 
setListeners : false,

// Calls dijit._Templated.widgetsInTemplate
widgetsInTemplate : true,

// CSS FILES
cssFiles : ["plugins/view/css/view.css", "plugins/view/css/genome.css"],

// browsers Object. HASH ARRAY OF OPENED BROWSERS
browsers : [],

constructor : function(args) {	
	console.log("Chromosomes.constructor    plugins.view.View.constructor(args)");
	
	// NB: TAB HIERARCHY IS AS FOLLOWS:
	//
	//	tabs	
	//		mainTab
	//				leftPane
	//						comboBoxes
	//				rightPane
	//						Browser
	//								Features
	//								GenomeView
	
	// SET ARGS
	this.parentWidget = args.parentWidget;
	this.project = args.project;
	this.workflow = args.workflow;
	
	// LOAD CSS
	this.loadCSS();		
},

postMixInProperties: function() {
	//console.log("Chromosomes.postMixInProperties    plugins.report.Template.View.postMixInProperties()");
},

postCreate: function() {
	//console.log("Chromosomes.postCreate    plugins.report.Template.View.postCreate()");
	
	this.startup();
},


// STARTUP
startup : function () {
	console.log("Chromosomes.startup    plugins.report.Template.View.startup()");
	
	// SET UP THE ELEMENT OBJECTS AND THEIR VALUE FUNCTIONS
	this.inherited(arguments);
	
	// ADD THE PANE TO THE TAB CONTAINER
	console.log("Chromosomes.startup    this.mainTab: " + this.mainTab);
	this.attachWidget.addChild(this.mainTab);
	this.attachWidget.selectChild(this.mainTab);
	
	// EXPAND LEFT PANE (WAS CLOSED SO THAT RIGHT PANE WOULD RENDER)
	this.leftPane.toggle();

	// LOAD COMBOS IN SUCCESSION
	this.setProjectCombo();
	
	// SET COMBO LISTENERS
	setTimeout(
		function (thisObj) { thisObj.setComboListeners(); },
		1000,
		this
	);

	//// LOAD SPARKLINES ON CHROMOSOMES IN MIDDLE PANE
	//this.sparklines();
},

// SHOW SPARK LINES OF EXPRESSION, SNPS, ALIGNMENT COVERAGE, ETC.
// http://localhost/aqwa/0.4/dojo.1.2.2/dojox/charting/tests/test_sparklines.html	
sparklines : function () {
	console.log("Chromosomes.sparklines    plugins.view.View.sparklines()");

},


// GET FUNCTIONS	
getProject : function () {
	return this.projectCombo.get('value');
},
getWorkflow : function () {
	return this.workflowCombo.get('value');
},
getView : function () {
	console.log("view.Views    plugins.view.Views.getView()");
	
	return this.viewCombo.get('value');
},
getBuild : function () {
	//console.log("Chromosomes.getBuild    View.getBuild()");

	var buildName;
	var speciesBuild = this.speciesCombo.get('value');
	if ( speciesBuild.match(/^(\S+)\s+\(([^\)]+)\)$/) )
	{
		buildName = speciesBuild.match(/^(\S+)\s+\(([^\)]+)\)$/)[2];
		//console.log("Chromosomes.getBuild    buildName: " + buildName);
	}
	
	return buildName;
},
getSpecies : function () {
	//console.log("Chromosomes.getSpecies    View.getSpecies()");

	var speciesName;
	var speciesBuild = this.speciesCombo.get('value');
	if ( speciesBuild.match(/^(\S+)\s+\(([^\)]+)\)$/) )
	{
		speciesName = speciesBuild.match(/^(\S+)\s+\(([^\)]+)\)$/)[1];
		//console.log("Chromosomes.getSpecies    speciesName: " + speciesName);
	}
	
	return speciesName;
},

// SET FUNCTIONS
setProjectCombo : function (projectName, workflowName) {
	console.log("Chromosomes.setProjectCombo    plugins.report.View.setProjectCombo(projectName)");
	console.log("Chromosomes.setProjectCombo    projectName: " + projectName);

	// DO COMBO WIDGET SETUP	
	this.inherited(arguments);

	
	// SET CSS
	this.projectCombo.popupClass = "view viewCombo dijitReset dijitMenu";
	this.projectCombo.wrapperClass = "view dijitPopup";
	this.projectCombo.itemHeight = 30;		

	if ( projectName == null )	projectName = this.projectCombo.getValue();

	// RESET THE WORKFLOW COMBO
	console.log("Chromosomes.setProjectCombo    BEFORE this.setWorkflowCombo(" + projectName + ")");
	this.setWorkflowCombo(projectName, workflowName);
},

setWorkflowCombo : function (projectName, workflowName) {
	console.log("Chromosomes.setWorkflowCombo    plugins.report.View.setWorkflowCombo(projectName, workflowName)");
	console.log("Chromosomes.setWorkflowCombo    projectName: " + projectName);
	console.log("Chromosomes.setWorkflowCombo    workflowName: " + workflowName);

	// DO COMBO WIDGET SETUP	
	this.inherited(arguments);


	// SET CSS
	this.workflowCombo.popupClass = "view viewCombo dijitReset dijitMenu";
	this.workflowCombo.wrapperClass = "view dijitPopup";
	this.workflowCombo.itemHeight = 30;		

	if ( projectName == null ) projectName = this.projectCombo.getValue();
	if ( workflowName == null ) workflowName = this.workflowCombo.getValue();

	// RESET THE VIEW COMBO
	this.setViewCombo(projectName, workflowName);
},


setViewCombo : function (projectName, workflowName, viewName) {
	console.log("Chromosomes.setViewCombo    plugins.report.View.setViewCombo(projectName, workflowName, viewName)");
	console.log("Chromosomes.setViewCombo    projectName: " + projectName);
	console.log("Chromosomes.setViewCombo    workflowName: " + workflowName);
	console.log("Chromosomes.setViewCombo    viewName: " + viewName);

	// DO COMBO WIDGET SETUP	
	this.inherited(arguments);
	
	// SET CSS
	this.viewCombo.popupClass = "view viewCombo dijitReset dijitMenu";
	this.viewCombo.wrapperClass = "view dijitPopup";
	this.viewCombo.itemHeight = 30;		
	
	// SET DROP TARGET (LOAD MIDDLE PANE, BOTTOM)
	if ( viewName == null ) viewName = this.getView();

	console.log("Chromosomes.setViewCombo    DOING this.setSpeciesCombo(" + projectName + ", " + workflowName + ", " + viewName + ")");
	
	this.setSpeciesCombo(projectName, workflowName, viewName);
},

setSpeciesCombo : function (projectName, workflowName, viewName, speciesName, buildName) {
	console.log("Chromosomes.setSpeciesCombo    plugins.report.View.setSpeciesCombo(projectName, workflowName, viewName)");
	console.log("Chromosomes.setSpeciesCombo    projectName: " + projectName);
	console.log("Chromosomes.setSpeciesCombo    workflowName: " + workflowName);
	console.log("Chromosomes.setSpeciesCombo    viewName: " + viewName);

	// SET CSS
	this.viewCombo.popupClass = "view viewCombo dijitReset dijitMenu";
	this.viewCombo.wrapperClass = "view dijitPopup";
	this.viewCombo.itemHeight = 30;		
	
	// SET DROP TARGET (LOAD MIDDLE PANE, BOTTOM)
	if ( viewName == null ) viewName = this.viewCombo.get('value');

	var views = Agua.getViewsByProjectWorkflow(projectName, workflowName);   
	console.log("Chromosomes.setSpeciesCombo    views: " + dojo.toJson(views));
	
	// TAKE THE FIRST VIEW FOR THIS WORKFLOW IF speciesName NOT DEFINED
	if ( views.length != null )
	{
		if ( speciesName == null || ! speciesName )  
		{
			console.log("Chromosomes.setSpeciesCombo    views.length is NOT null. But speciesName is null or empty");
			
			speciesName = views[0].species;
			buildName = views[0].build;
			
			if ( speciesName == "" ) speciesName = "human";
			if ( buildName == "" ) buildName = "hg19";
			console.log("Chromosomes.setSpeciesCombo    speciesName: " + speciesName);
			console.log("Chromosomes.setSpeciesCombo    buildName: " + buildName);
		}
	}

	// IF NO VIEWS FOR THIS WORKFLOW,
	// DO NOTHING
	//////////// SELECT FIRST ENTRY IN SPECIES COMBO
	else
	{
		if ( speciesName == null || ! speciesName )  
		{
			console.log("Chromosomes.setSpeciesCombo    views.length is not null AND speciesName is null or empty");
			
			//this.speciesCombo.selectedIndex = 2;
			//console.log("Chromosomes.setSpeciesCombo    speciesName: " + speciesName);
		}
	}

	if ( speciesName == null ) speciesName = this.getSpecies();
	if ( buildName == null ) buildName = this.getBuild();
	console.log("Chromosomes.setSpeciesCombo    speciesName: " + speciesName);
	console.log("Chromosomes.setSpeciesCombo    buildName: " + buildName);
	
	
	if ( this.setListeners == false )
	{
		console.log("Chromosomes.setSpeciesCombo    this.setListners is false: " + this.setListeners + ". Doing this.setComboListeners()");
		
		// SET LISTENERS
		setTimeout(function(thisObj) { thisObj.setComboListeners(); }, 2000, this);
		
		// SET setListeners FLAG
		this.setListeners = true;
	}
	

	console.log("Chromosomes.setSpeciesCombo    DOING this.loadBrowser(" + projectName + ", " + workflowName + ", " + viewName +", " + speciesName + ", " + buildName + ")");
	this.loadBrowser(projectName, workflowName, viewName, speciesName, buildName);
},



// LOAD JBROWSE
loadBrowser : function (project, workflow, view, species, build) {
	if ( species == null )	species = this.getSpecies();
	if ( build == null )	build = this.getBuild();

	console.log("Chromosomes.loadBrowser      plugins.view.View.loadBrowser(project, workflow, view, species, build)");
	console.log("Chromosomes.loadBrowser      project: " + project);
	console.log("Chromosomes.loadBrowser      workflow: " + workflow);
	console.log("Chromosomes.loadBrowser      view: " + view);
	console.log("Chromosomes.loadBrowser      species: " + species);
	console.log("Chromosomes.loadBrowser      build: " + build);

	// SET DEFAULT SPECIES TO HUMAN
	if ( species == null || ! species ) species = "human";
	
	if ( project == null
		|| workflow == null
		|| view == null
		|| species == null
		|| build == null )
	{
		console.log("Chromosomes.loadBrowser    One of the required inputs (project, workflow, view, species and build) is null. Returning");
		return;
	}

	var viewObject = Agua.getView(project, workflow, view, species, build);
	var location	=	viewObject.location;
	var trackList	=	viewObject.tracklist;
	console.log("Chromosomes.loadBrowser      viewObject: " + dojo.toJson(viewObject));
	console.log("Chromosomes.loadBrowser      trackList: " + trackList);
	console.log("Chromosomes.loadBrowser      location: " + location);
	
	// GET UNIQUE ID FOR THIS MENU TO BE USED IN DND SOURCE LATER
	var objectName = "plugins.view.View.jbrowse.Browser";
	var browserId = dijit.getUniqueId(objectName.replace(/\./g,"_"));
	console.log("Chromosomes.loadBrowser      browserId: " + browserId);
	
	var dataRoot = "plugins/view/jbrowse/" + species + "/";
	
	
	//var b = new Browser({
	var b = new plugins.view.jbrowse.js.Browser({
		projectName: project,
		workflowName: workflow,
		viewName: view,
		speciesName: species,
		buildName: build,
		
		refSeqs: refSeqs,
		trackData: trackInfo,
		baseUrl : "plugins/view/jbrowse/",
		dataRoot : "plugins/view/jbrowse/species/" + species + "/" + build + "/",
		browserRoot : "plugins/view/jbrowse/",
		defaultLocation : "chr1:1..10000000",
	
		trackList : "Affy_Exon_Probes,Microsatellite,Encode_Common_CNV",
		
		attachWidget : this.rightPane
		//dataRoot : "plugins/view/jbrowse/users/syoung/Project1/Workflow1/"
	});
	
	
	// ADD TO this.browsers ARRAY		
	this.addBrowser(b, project, workflow, view, build, species);		
	
	//b.showTracks("DNA,gene,mRNA,noncodingRNA");
	//b.navigateTo("chr1:0-20000000");
	
	if ( location != null && location != '' )
	{
		console.log("Chromosomes.loadBrowser      location is defined: " + location);
		console.log("Chromosomes.loadBrowser      BEFORE b.navigateTo(" + location + ")");				
		b.navigateTo(location);
		console.log("Chromosomes.loadBrowser      AFTER b.navigateTo(" + location + ")");
	}
	
}, // 	loadBrowser 


reloadBrowser : function (project, workflow, view, species, build) {
	if ( species == null )	species = this.getSpecies();
	if ( build == null )	build = this.getBuild();

	console.log("Chromosomes.reloadBrowser      plugins.view.View.reloadBrowser(project, workflow, view, species, build)");
	console.log("Chromosomes.reloadBrowser      project: " + project);
	console.log("Chromosomes.reloadBrowser      workflow: " + workflow);
	console.log("Chromosomes.reloadBrowser      view: " + view);
	console.log("Chromosomes.reloadBrowser      species: " + species);
	console.log("Chromosomes.reloadBrowser      build: " + build);

	if ( project == null
		|| workflow == null
		|| view == null
		|| species == null
		|| build == null )
	{
		console.log("Chromosomes.reloadBrowser    One of the required inputs is null. Returning");
		return;
	}

	if ( this.getBrowser(project, workflow, view ) )
	{
		// REMOVE EXISTING BROWSER FOR THIS VIEW
		console.log("Chromosomes.reloadBrowser    BEFORE this.removeBrowser(project, workflow, view)");
		this.removeBrowser(project, workflow, view);
		console.log("Chromosomes.reloadBrowser    AFTER this.removeBrowser(project, workflow, view)");
	}

	this.loadBrowser(project, workflow, view, species, build);

	console.log("Chromosomes.reloadBrowser    AFTER loadBrowser");

}, // 	reloadBrowser 


addBrowser : function (browser, project, workflow, view) {
	console.log("Chromosomes.addBrowser    plugins.report.View.addBrowser(browser, project, workflow, view)");
	console.log("Chromosomes.addBrowser    browser: " + browser);
	console.log("Chromosomes.addBrowser    project: " + project);
	console.log("Chromosomes.addBrowser    workflow: " + workflow);
	console.log("Chromosomes.addBrowser    view: " + view);

	var key = project + "*" + workflow + "*" + view;
	this.browsers[key] = browser;
},


getBrowser : function (project, workflow, view) {
	console.log("Chromosomes.getBrowser    plugins.report.View.getBrowser(project, workflow, view)");
	console.log("Chromosomes.getBrowser    project: " + project);
	console.log("Chromosomes.getBrowser    workflow: " + workflow);
	console.log("Chromosomes.getBrowser    view: " + view);
	
	var key = project + "*" + workflow + "*" + view;
	var browser = this.browsers[key];

	return browser;
},


removeBrowser : function (project, workflow, view) {
	console.log("Chromosomes.removeBrowser    plugins.report.View.removeBrowser(browser, project, workflow, view)");
	console.log("Chromosomes.removeBrowser    project: " + project);
	console.log("Chromosomes.removeBrowser    workflow: " + workflow);
	console.log("Chromosomes.removeBrowser    view: " + view);

	var browser = this.getBrowser(project, workflow, view);
	console.log("Chromosomes.removeBrowser    browser: " + browser);
	
	// DESTROY WIDGET
	console.log("Chromosomes.removeBrowser    BEFORE browser.destroy()");
	//browser.destroyRecursive();
	this.rightPane.removeChild(browser.mainTab);
	console.log("Chromosomes.removeBrowser    AFTER browser.destroy()");
	console.log("Chromosomes.removeBrowser    browser: " + browser);

	var key = project + "*" + workflow + "*" + view;
	delete this.browsers[key];
},


deleteView : function () {
	console.log("Chromosomes.deleteView    plugins.report.View.deleteView()");

	var project = this.getProject();
	var workflow = this.getWorkflow();
	var view = this.getView();

	console.log("Chromosomes.deleteView    project: " + project);
	console.log("Chromosomes.deleteView    workflow: " + workflow);
	console.log("Chromosomes.deleteView    view: " + view);
	
	
},

setComboListeners : function () {
	console.log("Chromosomes.setComboListeners    plugins.report.View.setComboListeners()");

	// PROJECT COMBO
	var thisObj = this;
	dojo.connect(this.projectCombo, "onchange", dojo.hitch(this, function(projectName) {
			console.log("                                                         ");
			console.log("Chromosomes.setComboListeners    *onChange projectCombo projectName: " + projectName);
			thisObj.setComboListeners(projectName);
	}));

	// WORKFLOW COMBO
	var thisObj = this;
	dojo.connect(this.workflowCombo, "onchange", dojo.hitch(this, function(workflowName) {
			console.log("                                                         ");
			console.log("Chromosomes.setComboListeners    *onChange workflowCombo workflowName: " + workflowName);
			var projectName = thisObj.projectCombo.getValue();
			thisObj.setComboListeners(projectName, workflowName);
	}));
	
	// VIEW COMBO
	dojo.connect(this.viewCombo, "onchange", dojo.hitch(function(viewName) {
		console.log("                                                         ");
		console.log("Chromosomes.setComboListeners    *onChange viewCombo viewName: " + viewName);

		var projectName = thisObj.projectCombo.getValue();
		var workflowName = thisObj.workflowCombo.getValue();
		console.log("Chromosomes.setComboListeners    *onChange viewCombo projectName: " + projectName);
		console.log("Chromosomes.setComboListeners    *onChange viewCombo workflowName: " + workflowName);
		thisObj.loadBrowser(projectName, workflowName, viewName);
	}));


	// SPECIES COMBO
	dojo.connect(this.speciesCombo, "onchange", dojo.hitch(function(speciesBuild) {
		console.log("                                                         ");
		console.log("Chromosomes.setComboListeners    *onChange speciesCombo speciesBuild: " + speciesBuild);

		var projectName = thisObj.projectCombo.getValue();
		var workflowName = thisObj.workflowCombo.getValue();
		var viewName = thisObj.viewCombo.getValue();
		console.log("Chromosomes.setComboListeners    *onChange speciesCombo projectName: " + projectName);
		console.log("Chromosomes.setComboListeners    *onChange speciesCombo workflowName: " + workflowName);
		console.log("Chromosomes.setComboListeners    *onChange speciesCombo viewName: " + viewName);
		
		var speciesName = thisObj.getSpecies();
		var buildName = thisObj.getBuild();
		console.log("Chromosomes.setComboListeners    *onChange speciesCombo speciesName: " + speciesName);
		console.log("Chromosomes.setComboListeners    *onChange speciesCombo buildName: " + buildName);
		console.log("Chromosomes.setComboListeners    DOING this.loadBrowser(" + projectName + ", " + workflowName + ", " + viewName +", " + speciesName + ", " + buildName + ")");

		thisObj.reloadBrowser(projectName, workflowName, viewName, speciesName, buildName);
	}));


	// SET NEW PROJECT LISTENER
	var thisObject = this;
	this.viewCombo._onKeyPress = function(event){
		console.log("Workflows.setViewCombo._onKeyPress	dijit.form.ComboBox._onKeyPress(/*Event*/ event)");
		
		// summary: handles keyboard events
		var key = event.charOrCode;			
		if ( key == 13 )
		{
			//thisObject.workflowCombo._hideResultList();
			
			var projectName = thisObject.projectCombo.get('value');
			var workflowName = thisObject.workflowCombo.get('value')
			var viewName = thisObject.viewCombo.get('value')
			
			// STOP PROPAGATION
			event.stopPropagation();
			
			var isView = Agua.isView(projectName, workflowName, viewName);
			console.log("Workflows.setViewCombo._onKeyPress	   isView: " + isView);
			if ( isView == false )
			{
				var viewObject = new Object;
				viewObject.project = projectName;
				viewObject.workflow = workflowName;
				viewObject.name = viewName;
				
				console.log("Workflows.setViewCombo._onKeyPress	   Doing Agua.addView(" + dojo.toJson(viewObject) + ")");
				Agua.addView(viewObject);
				thisObject.setSpeciesCombo(projectName, workflowName, viewName);
			}
				
			if ( thisObject.viewCombo._popupWidget != null )
			{
				thisObject.viewCombo._showResultList();
			}
		}

		// STOP PROPAGATION
		event.stopPropagation();
	};

}

	

}); // end of plugins.view.View

