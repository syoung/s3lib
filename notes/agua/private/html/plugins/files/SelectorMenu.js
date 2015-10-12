
dojo.provide("plugins.files.SelectorMenu");

// WIDGET PARSER
dojo.require("dojo.parser");

// INHERITS
dojo.require("plugins.files.FileMenu");

// HAS A
dojo.require("dijit.Menu");
dojo.require("plugins.dijit.InputDialog");
dojo.require("plugins.dijit.ConfirmDialog");

dojo.declare(
    "plugins.files.SelectorMenu",
	[ plugins.files.FileMenu ],
{
//Path to the template of this widget. 
templatePath: dojo.moduleUrl("plugins", "files/templates/selectormenu.html"),

//// Calls dijit._Templated.widgetsInTemplate
//widgetsInTemplate : true,
//

// OR USE @import IN HTML TEMPLATE
cssFiles : [ dojo.moduleUrl("plugins.files") + "/css/selectormenu.css" ],

constructor : function()
{
	//////console.log("SelectorMenu.constructor     plugins.files.SelectorMenu.constructor");			
	//// GET INFO FROM ARGS
	//this.parentWidget = args.parentWidget;
	////////console.log("SelectorMenu.constructor     parentWidget: " + parentWidget);

	// LOAD CSS
	this.loadCSS();		
},

postCreate : function()
{
	//////console.log("SelectorMenu.postCreate    plugins.files.SelectorMenu.postCreate()");

	//// SET INPUT DIALOG
	//this.setInputDialog();
	//
	//// SET CONFIRM DIALOG
	//this.setConfirmDialog();

	// SET LABEL
	this.setTitle("Selector Menu");

	// CONNECT SHORTKEYS FOR MENU
	this.setMenu();
	
	// DO STARTUP
	this.startup();
},


startup : function ()
{
	//console.log("FileMenu.startup    plugins.files.FileMenu.startup()");

	// COMPLETE CONSTRUCTION OF OBJECT
	this.inherited(arguments);	 

	// CONNECT SHORTKEYS FOR MENU
	this.setMenu();	
},

// ADD A NEW PROJECT USING A DIALOG BOX FOR PROJECT NAME INPUT
select : function ()
{
	//console.log("SelectorMenu.select    plugins.files.SelectorMenu.select()");
	//console.log("SelectorMenu.select    this.selectCallback: " + this.selectCallback.toString());

	// GET PROJECT WIDGET		
	var path = this.getPath();
	if ( path == null )
	{
		//console.log("SelectorMenu.add     path is null. Returning");
		return;
	}
	//console.log("SelectorMenu.add     path: " + path);

	
},


// ADD A NEW WORKFLOW USING A DIALOG BOX FOR WORKFLOW NAME INPUT
add : function ()
{
	//console.log("SelectorMenu.add    plugins.files.SelectorMenu.add()");

	//console.log("SelectorMenu.add    this.addCallback: " + this.addCallback.toString());

	// GET PROJECT WIDGET		
	var path = this.getPath();
	if ( path == null )
	{
		//console.log("SelectorMenu.add     path is null. Returning");
		return;
	}
	//console.log("SelectorMenu.add     path: " + path);
}

}); // plugins.files.SelectorMenu
