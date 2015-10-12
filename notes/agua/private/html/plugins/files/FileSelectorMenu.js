dojo.provide("plugins.files.FileSelectorMenu");

// WIDGET PARSER
dojo.require("dojo.parser");

// INHERITS
dojo.require("plugins.files.FileMenu");

// HAS A
dojo.require("dijit.Menu");
dojo.require("plugins.dijit.InputDialog");
dojo.require("plugins.dijit.ConfirmDialog");

dojo.declare(
    "plugins.files.FileSelectorMenu",
	[ plugins.files.FileMenu ],
{
	////}}

//Path to the template of this widget. 
templatePath: dojo.moduleUrl("plugins", "files/templates/fileselectormenu.html"),

//// Calls dijit._Templated.widgetsInTemplate
//widgetsInTemplate : true,

// OR USE @import IN HTML TEMPLATE
cssFiles : [ dojo.moduleUrl("plugins", "files/css/fileselectormenu.css") ],

constructor : function() {
	//////console.log("FileSelectorMenu.constructor     plugins.files.FileSelectorMenu.constructor");			

	// LOAD CSS
	this.loadCSS();		
},

postCreate : function() {
	//////console.log("FileSelectorMenu.postCreate    plugins.files.FileSelectorMenu.postCreate()");

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


startup : function () {
	//console.log("FileMenu.startup    plugins.files.FileMenu.startup()");

	// COMPLETE CONSTRUCTION OF OBJECT
	this.inherited(arguments);	 

	// CONNECT SHORTKEYS FOR MENU
	this.setMenu();	
},

setTitle : function (title) {
// NO TITLE - DO NOTHING
	console.log("FileMenu.setTitle    title: " + title);
},

select : function (event) {
// STORE SELECTED FILE OR FOLDER
    console.log("FileSelectorMenu.select    plugins.files.FileSelectorMenu.select(event)");

    console.log("FileSelectorMenu.select    event: " + event);
    console.log("FileSelectorMenu.select    event.target: " + event.target);

    // GET PROJECT WIDGET
    var location = this.getPath();
    if ( ! location == null ) {
        console.log("FileSelectorMenu.select     location is null. Returning");
        return;
    }
    var filename = this.menu.currentTarget.innerHTML;

    console.log("fileSelectorMenu.select     filename: " + filename);
    console.log("fileSelectorMenu.select     location: " + location);
    console.log("fileSelectorMenu.select     this.type: " + this.type);
    
    var newValue;
    if ( filename != null && location != null )    newValue = location + "/" + filename;
    else if ( location != null )    newValue = location;
    else if ( filename != null )    newValue = filename;
    console.log("fileSelectorMenu.select     newValue: " + newValue);

    var application = this.parameterWidget.core.parameters.application;
    application.value = newValue;
    console.log("fileSelectorMenu.select     application: ");
    console.dir({application:application});
    
    console.log("fileSelectorMenu.select     Doing this.parameterWidget.changeValue()");
    this.parameterWidget.changeValue(this.parameterWidget.valueNode, this.parameterWidget.valueNode.innerHTML, newValue, this.type);

    console.log("fileSelectorMenu.select     Doing this.parameterWidget.core.io.chainOutputs()");
    var force = true;
    this.parameterWidget.core.io.chainOutputs(application, true);
    var stageRow = this.parameterWidget.core.parameters.stageRow;
    var node = stageRow.domNode;
    node.application = stageRow.application;
    node.parentWidget = stageRow;
    this.parameterWidget.core.stages.loadParametersPane(node);


    this.hide();
},


add : function () {
// ADD VALUE TO PARAMETER
    var location = this.getPath();
    if ( location == null ) {
        console.log("FileSelectorMenu.add     location is null. Returning");
        return;
    }

    var filename = this.menu.currentTarget.innerHTML;
    console.log("FileSelectorMenu.add     filename: " + filename);
    console.log("FileSelectorMenu.add     location: " + location);
    console.log("FileSelectorMenu.add     this.type: " + this.type);
    console.log("FileSelectorMenu.add     this.parameterWidget.valueNode.innerHTML: " + this.parameterWidget.valueNode.innerHTML);

    var newValue;
    if ( filename != null && location != null )    newValue = location + "/" + filename;
    else if ( location != null )    newValue = location;
    else if ( filename != null )    newValue = filename;
    console.log("FileSelectorMenu.add     newValue: " + newValue);

    this.parameterWidget.addValue(this.parameterWidget.valueNode,   this.parameterWidget.valueNode.innerHTML, newValue, this.type);

    this.hide();
}

}); // plugins.files.FileSelectorMenu
