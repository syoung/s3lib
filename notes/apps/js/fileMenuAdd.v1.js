console.clear();
var paramrow = dijit.byId("plugins_workflow_ParameterRow_1");
console.dir({paramrow:paramrow});
var menu = Agua.fileManager.fileMenu;
console.dir({menu:menu});

menu.add = function () {
// ADD VALUE TO PARAMETER
    var location = this.getPath();
    if ( location == null ) {
        console.log("FileSelectorMenu.add     location is null. Returning");
        return;
    }

    var filename = this.menu.currentTarget.innerHTML;
    console.log("Workflow.setFileManager     filename: " + filename);
    console.log("Workflow.setFileManager     location: " + location);
    console.log("Workflow.setFileManager     this.type: " + this.type);
    console.log("Workflow.setFileManager     this.parameterWidget.valueNode.innerHTML: " + this.parameterWidget.valueNode.innerHTML);

    var newValue;
    if ( filename != null && location != null )    newValue = location + "/" + filename;
    else if ( location != null )    newValue = location;
    else if ( filename != null )    newValue = filename;
    console.log("Workflow.setFileManager     newValue: " + newValue);

    this.parameterWidget.addValue(this.parameterWidget.valueNode,   this.parameterWidget.valueNode.innerHTML, newValue, this.type);



    this.hide();
};
