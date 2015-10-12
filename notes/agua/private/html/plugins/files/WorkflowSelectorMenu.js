
dojo.provide("plugins.files.WorkflowSelectorMenu");

// WIDGET PARSER
dojo.require("dojo.parser");

// INHERITS
dojo.require("plugins.files.FileMenu");

// HAS A
dojo.require("dijit.Menu");

dojo.declare(
    "plugins.files.WorkflowSelectorMenu",
	[ plugins.files.FileMenu ],
{
//Path to the template of this widget. 
templatePath: dojo.moduleUrl("plugins", "files/templates/workflowselectormenu.html"),

// CSS FILES
cssFiles : [ dojo.moduleUrl("plugins", "files/css/workflowselectormenu.css") ],

//////}

constructor : function(args)  {
//////console.log("WorkflowSelectorMenu.constructor     plugins.files.WorkflowSelectorMenu.constructor");			
// LOAD SORIA AND FILEPICKER CSS
this.loadCSS();		
},

postCreate : function() {
//////console.log("WorkflowSelectorMenu.postCreate    plugins.files.WorkflowSelectorMenu.postCreate()");

	// SET LABEL
	this.setTitle("Folder Options");
	
	// SET INPUT DIALOG
	this.setInputDialog();
	
	// CONNECT SHORTKEYS FOR MENU
	this.setMenu();
	
	// DO STARTUP
	this.startup();
}

	

}); // plugins.files.WorkflowSelectorMenu
