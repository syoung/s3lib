
var doIt = function () {

console.clear();
dojo.reload("plugins.dojox.data.FileStore");
dojo.reload("dojox.widget.RollingList");
dojo.reload("plugins.files.TitlePane");
dojo.reload("plugins.files._GroupDragPane");
dojo.reload("plugins.files.FileDrag");
dojo.reload("plugins.files.FileMenu");
dojo.reload("plugins.files.WorkflowMenu");
dojo.reload("plugins.folders.ProjectFiles");
dojo.reload("plugins.folders.SourceFiles");
dojo.reload("plugins.folders.Folders");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();

};

var openFirst = function () {
    console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxx openFirst XXXXXXXXXXXXXXXXXXXXXXXXXXXXXxx");

    var folders = Agua.controllers["folders"].tabPanes[0];    
    var sourceFiles = folders.sourceFiles;
    console.dir({sourceFiles:sourceFiles});
    
    var fileDrag = sourceFiles.fileDrags[0];
    console.dir({fileDrag:fileDrag});    

    var children = fileDrag.getChildren();
    console.log("children.length: " + children.length);
    console.dir({children:children});

    var groupDragPane = children[0];
    var item = groupDragPane.items[0];
    var event = { target: { item: item }};
    console.log("event: " + event);
    groupDragPane.onclickHandler(event);
};

var createTab = function () {
    setTimeout( function(){
    Agua.controllers["folders"].createTab();
    }, 1000, this);
};

var doOpenFirst = function() {
setTimeout( function(){ openFirst(); },10000, this);
};


var openLocation = function (location, username) {
    setTimeout( function(){ 
        console.clear();
        var projectFiles = Agua.controllers["folders"].tabPanes[0].sourceFiles;
        console.log("projectFiles: ");
            console.dir({projectFiles:projectFiles});
        projectFiles.openLocation(location, username);
    
    },10000, this);
};


//dojo.reloadCss();
doIt();
createTab();
//doOpenFirst();
//openFirst();
openLocation("Project1/babo");
