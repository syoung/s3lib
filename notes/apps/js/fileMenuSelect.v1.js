//console.clear();
var paramrow = dijit.byId("plugins_workflow_ParameterRow_1");
console.dir({paramrow:paramrow});
var menu = Agua.fileManager.fileMenu;
console.dir({menu:menu});
Agua.fileManager.hide = function () {
    console.log("FileManager.hide    this:");
    console.dir({this:this});
    console.log("FileManager.hide    Doing this.atomic.dialog.minimize()");
    this.atomic.dialog.minimize();
};
menu.select = function (event) {
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

    console.log("fileSelectorMenu.select     Doing this.core.io.chainOutputs()");
    var force = true;
    this.parameterWidget.core.io.chainOutputs(application, true);
    var stageRow = this.parameterWidget.core.parameters.stageRow;
    var node = stageRow.domNode;
    node.application = stageRow.application;
    node.parentWidget = stageRow;
    this.parameterWidget.core.stages.loadParametersPane(node);

    this.hide();
};


console.log("HERE");