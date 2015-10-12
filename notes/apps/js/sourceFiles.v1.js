
var doIt = function () {
    console.clear();
    dojo.reload("plugins.folders.ProjectFiles");
    dojo.reload("plugins.folders.SourceFiles");
    dojo.reload("plugins.folders.SharedProjectFiles");
    dojo.reload("plugins.folders.SharedSourceFiles");
    dojo.reload("plugins.folders.Folders");
    dojo.reload("plugins.files.FileManager");
    dojo.reload("plugins.files.Controller");
    dojo.reload("plugins.core.Data");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    console.clear();

    dojo.addOnLoad( function() {
        Agua.fileManager = new plugins.files.FileManager(
        {
            paneId: "projects" + this.paneId,
            tabsNodeId: "tabs"
            //selectCallback: selectCallback,
            //addCallback: addCallback,
            //parentWidget: this
            //core: this.core
        });	
    
        console.log("files.Controller.createFileManager    Agua.fileManager: ");
        console.dir({Agua_fileManager:Agua.fileManager});
    
    });

};

doIt();
//dojo.reloadCss();
