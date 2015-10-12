
dojo.provide("plugins.report.Controller");

// OBJECT:  plugins.report.Controller
// PURPOSE: GENERATE AND MANAGE Report PANES

// INHERITS
//dojo.require("plugins.core.WidgetFramework");

// GLOBAL ADMIN CONTROLLER VARIABLE
var reportController;

// INHERITS
dojo.require("plugins.core.Common");

// HAS
dojo.require("plugins.report.Report");


dojo.declare( "plugins.report.Controller",
	[ dijit._Widget, dijit._Templated, plugins.core.Common ],
{
	//Path to the template of this widget. 
	templatePath: dojo.moduleUrl("plugins", "report/templates/controller.html"),

	// Calls dijit._Templated.widgetsInTemplate
	widgetsInTemplate : true,

	// CSS FILE FOR BUTTON STYLING
	cssFiles : [ "plugins/report/css/controller.css" ],

	// ARRAY OF TAB PANES
	tabPanes : [],

	// CONSTRUCTOR	
	constructor : function(args) {
		console.log("Controller.constructor     plugins.report.Controller.constructor");
		//console.log("Controller.args: " + dojo.toJson(args));

		// LOAD CSS FOR BUTTON
		this.loadCSS();
		
	},


	postCreate : function()
	{
		console.log("Controller.postCreate    plugins.report.Controller.postCreate()");

		this.startup();
	},

	
	startup : function ()
	{
		console.log("Controller.startup    plugins.report.Controller.startup()");

		this.inherited(arguments);
	
		// ADD ADMIN TAB TO TAB CONTAINER		
		console.log("Controller.startup    Agua.toolbar: " + Agua.toolbar);
		this.reportButton = Agua.addToolbarButton("Report");
		console.log("Controller.startup    this.reportButton: " + this.reportButton);
		Agua.toolbar.addChild(this.reportButton);
		
		// SET ADMIN BUTTON LISTENER
		var listener = dojo.connect(this.reportButton, "onClick", this, "createTab");
		
		// CREATE TAB
		//console.log("Controller.startup    BEFORE createTab");
		//this.createTab();		
		//console.log("Controller.startup    AFTER createTab");
		
	},

	
	createTab : function (args)
	{
		console.log("Controller.createTab    plugins.report.Controller.createTab");
		
		if ( args == null ) args = new Object;
		args.attachWidget = Agua.tabs;
		this.tabPanes.push(new plugins.report.Report(args));
	}

}); // end of Controller


//dojo.addOnLoad(
//	function()
//	{
//		if ( Agua.loginController == null )
//		{
//			console.log("Controller.addOnLoad    plugins.report.Controller.addOnLoad");
//			
//			Agua.reportController = new plugins.report.Controller();
//			console.log("Controller.After new plugins.report.Controller()");
//			
//			// DEBUG
//			Agua.reportController.createTab();
//		}	
//	}
//);

