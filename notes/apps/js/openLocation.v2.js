console.clear();
var layoutpane = Agua.fileManager.atomic.dialog;
var filemanager = Agua.fileManager;
filemanager.show = function (parameterWidget) {
	console.log("FileManager.show    parameterWidget:");
	console.dir({parameterWidget:parameterWidget});

	// SET parameterWidget IN THIS AND ITS MENUS
	this.parameterWidget = parameterWidget;
	this.fileMenu.parameterWidget = parameterWidget;
	this.folderMenu.parameterWidget = parameterWidget;
	this.workflowMenu.parameterWidget = parameterWidget;

	// MAXIMISE
	this.atomic.dialog.show();

	// OPEN PROJECT IF DEFINED
	var project = this.parameterWidget.project;
	var workflow = this.parameterWidget.workflow;
	console.log("FileManager.show    project: " + project);
	console.log("FileManager.show    workflow: " + workflow);

	this.openProjectLocation(project, workflow);
};

filemanager.openProjectLocation = function (project, workflow) {
	var location = project;
	if ( workflow ) location += "/" + workflow;
	var username = Agua.cookie('username');
	
	var projectFiles = this.projectFiles;
	console.log("projectFiles: ");
	console.dir({projectFiles:projectFiles});
	projectFiles.openLocation(location, username);

};


layoutpane._position = function () {
    this._setPosition(); 
    //this._doSizing();

    dojo.style(this.containerNode, "opacity", 1);
    dojo.style(this.containerNode, "visibility", "visible");
    dojo.style(this.containerNode, "hidden", "inline");	
};

layoutpane._setPosition = function () {
// EXTRACTED FROM dijit.Dialog
    if (!dojo.hasClass(dojo.body(),"dojoMove")) {
        var node = this.domNode;
        console.log("FloatingPane._setPosition    node:");
        console.dir({node:node});
        
        var viewport = dijit.getViewport();
        console.log("FloatingPane._setPosition    viewport:");
        console.dir({viewport:viewport});
        
        var p = this._relativePosition;
        var mb = p ? null : dojo.marginBox(node);
		mb = {
			h	: 	278,
			l	: 	-400,
			t	:	0,
			w	:	695
		};

        console.log("FloatingPane._setPosition    mb:");
        console.dir({mb:mb});
        
        var left = Math.floor(viewport.l + (p ? p.l : (viewport.w - mb.w) / 2));
        console.log("FloatingPane._setPosition    left: " + left);
        
        dojo.style(node,{
            left: left + "px",
            top: "100px"
        });
    }        
};

layoutpane._doSizing = function () {
    if(!this.open){ dojo.style(this.containerNode, "opacity", 0); }
    var pad = this.viewportPadding * 2; 
    console.log("FloatingPane._doSizing    pad: " + pad);
    
    var props = {
        node: this.domNode,
        duration: this.sizeDuration || dijit._defaultDuration,
        easing: this.easing,
        method: this.sizeMethod
    };
    console.log("FloatingPane._doSizing    props:");
    console.dir({props:props});

    // CHANGE _displaysize.h FROM "auto" TO 800, IGNORE this._vp 
    console.log("FloatingPane._doSizing    this._displaysize:");
    console.dir({this__displaysize:this._displaysize});
    this._displaysize = { h: 0, w: 800 };
    var ds = this._displaysize;
    console.log("FloatingPane._doSizing    ds: ");
    console.dir({ds:ds});
    props['width'] = ds.w;
    props['height'] = ds.h;
    console.log("FloatingPane._doSizing    FINAL props:");
    console.dir({props:props});

    this._sizing = dojox.fx.sizeTo(props);
    this._sizing.play();
};
