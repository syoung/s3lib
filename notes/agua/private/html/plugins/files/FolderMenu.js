
dojo.provide("plugins.files.FolderMenu");

// WIDGET PARSER
dojo.require("dojo.parser");

// INHERITS
dojo.require("plugins.files.FileMenu");

// HAS A
dojo.require("dijit.Menu");

dojo.declare(
    "plugins.files.FolderMenu",
	[ plugins.files.FileMenu ], {

/////}}}}}

constructor : function(args) {
	//////console.log("FolderMenu.constructor     plugins.files.FolderMenu.constructor");			
	// GET INFO FROM ARGS
	//this.parentWidget = args.parentWidget;

	// LOAD CSS
	this.loadCSS();		
},

postCreate : function() {
	//////console.log("FolderMenu.postCreate    plugins.files.FolderMenu.postCreate()");

	// DISABLE DOWNLOAD
	this.downloadNode.destroy();
	
	// SET LABEL
	this.setTitle("Folder Menu");

	// SET INPUT DIALOG
	this.setInputDialog();

	// SET CONFIRM DIALOG
	this.setConfirmDialog();

	// CONNECT SHORTKEYS FOR MENU
	this.setMenu();

	// SET THE UPLOAD OBJECT
	this.setUploader();

	// DO STARTUP
	this.startup();
}



}); // plugins.files.FolderMenu
