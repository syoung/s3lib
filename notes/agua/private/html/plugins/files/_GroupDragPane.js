dojo.provide("plugins.files._GroupDragPane");

/* SUMMARY:  HANDLE GETTING SELECTED OBJECT IN DND LIST

	OVERRIDE onDropInternal(), onDropExternal()

	OR onDrop TO COVER BOTH ON THE source/target OBJECT.

*/

dojo.require("dojo.dnd.Source");
dojo.require("dijit.Menu");
dojo.require("dijit.InlineEditBox");

// HAS A
dojo.require("dojox.widget.Standby");
dojo.require("plugins.dojox.Timer");
dojo.require("plugins.files.Dialog");
dojo.require("plugins.dijit.Confirm");

dojo.declare("plugins.files._GroupDragPane",
	[dojox.widget._RollingListPane], {

// summary: a pane that will handle groups (treats them as menu items)

// templateString: string
//	our template
templateString: '<div><div dojoAttachPoint="containerNode"></div>' +
				'<div dojoAttachPoint="menuContainer">' +
					'<div dojoAttachPoint="menuNode"></div>' +
				'</div></div>',

// _dragSource: dijit.Menu
//  The menu that we will call addChild() on for adding items
_dragSource: null,

// dialog box to show copying
_copyBox : null,

// OBJECT-WIDE DEBUG STATUS
debug : false,

polling: false,

// core: object
// Contains refs to higher objects in hierarchy
// e.g., { folders: Folders.js object, files: XxxxxFiles.js object, ... }
core : null,

/////}}}}

constructor: function (args){
	this.inherited(arguments);
	
	console.log("_GroupDragPane.constructor    args:");
	console.dir({args:args});
	this.core 		= args.core;
	this.path		=	args.path;
	this.parentPath	=	args.parentPath;
},


startup: function (){
	this.inherited(arguments);
	
	console.log("_GroupDragPane.startup()    this.query: " + this.query);
	console.log("_GroupDragPane.startup()    this:");
	console.dir({this:this});

	// SET SEQUENCE AND STANDBY
	this.setSequence();
	this.setStandby();
},

_doQuery: function () {
// summary: either runs the query or loads potentially not-yet-loaded items.
	////console.log("_GroupDragPane._doQuery     plugins.files._GroupDragPane._doQuery()");
	console.log("_GroupDragPane._doQuery    caller: " + this._doQuery.caller.nom)
	console.dir({caller:this._doQuery.caller.prototype});
	console.log("_GroupDragPane._doQuery    query: this.path: **" + this.path + "**");
	console.log("_GroupDragPane._doQuery    query: this.store.path: **" + this.store.path + "**");

	this.isLoaded = false;

	this._setContentAndScroll(this.onFetchStart());

	this.store.fetch({
		query: this.path, 
		onComplete: function(items){
			this.items = items;
			this.onItems();
		}, 
		onError: function(e) {
			this._onError("Fetch", e);
		},
		scope: this
	});
},

_onLoadHandler: function(data){
// OVERRIDE TO AVOID THIS ERROR:
// Error undefined running custom onLoad code: This deferred has already been resolved

	console.log("plugins.files._GroupDragPane._onLoadHandler    data: ");
	console.dir({data:data});
	console.log("plugins.files._GroupDragPane._onLoadHandler    this: " + this);
	console.dir({this:this});

	// summary:
	//		This is called whenever new content is being loaded
	this.isLoaded = true;
	try{
		//this.onLoadDeferred.callback(data);
		console.log("plugins.files._GroupDragPane._onLoadHandler    Doing this.onLoad(data)");
		this.onLoad(data);
	}
	catch(e) {
		////console.error('Error '+this.widgetId+' running custom onLoad code: ' + e.message);
	}

	// REPEAT ROUND ROBIN UNTIL ALL TITLE PANES ARE LOADED
	if ( ! data ) {
		console.log("plugins.files._GroupDragPane._onLoadHandler	   Doing this.core.folders.roundRobin()");
		this.core.folders.roundRobin();
	}
},

_loadCheck: function(/* Boolean? */ forceLoad){
// summary: checks that the store is loaded
	var displayState = this._isShown();
	if((this.store || this.items) && (forceLoad || (this.refreshOnShow && displayState) || (!this.isLoaded && displayState))){
		
		this.query = this.path;
		console.log("_GroupDragPane._loadCheck    this.query: " + this.query);

		this._doQuery();
	}
},

_setContent: function(/*String|DomNode|Nodelist*/cont){
	if(!this._dragSource){
		// Only set the content if we don't already have a menu
		this.inherited(arguments);
	}
},

createMenu : function (type) {
// ADD PROGRAMMATIC CONTEXT MENU
	////console.log("plugins.files._GroupDragPane.createMenu     plugins.files._GroupDragPane.createMenu(type)");
	////console.log("plugins.files._GroupDragPane.createMenu     type: " + type);
	
	if ( type == "workflow" )
	{
		if ( this.workflowMenu != null ) return this.workflowMenu.menu;
	}
	else if ( type == "folder" )
	{
		if ( this.folderMenu != null ) return this.folderMenu.menu;
	}
	else
	{
		if ( this.fileMenu != null ) return this.fileMenu.menu;
	}
},

insertEmptyItem : function () {
// INSERT A FAKE ITEM WITH NAME <EMPTY> 

	//console.log("plugins.files._GroupDragPane.insertEmptyItem    this.parentPath: " + this.parentPath);
	//console.log("plugins.files._GroupDragPane.insertEmptyItem    this.path: " + this.path);

	var item = new Object;
	item.name = "<EMPTY>";
	item.parentPath = this.path;
	console.log("plugins.files._GroupDragPane.insertEmptyItem    item: " + dojo.toJson(item));

	this.items.push(item);
},

onItems : function() {
//	called after a fetch or load - at this point, this.items should be set and loaded.
	////console.log("plugins.files._GroupDragPane.onItems    plugins.files._GroupDragPane.onItems()");
	////console.log("plugins.files._GroupDragPane.onItems    this.items.length: " + this.items.length);
	//////console.log("plugins.files._GroupDragPane.onItems    this.items: " + dojo.toJson(this.items));	

	var thisObject = this;
	
	for ( var i = 0; i < this.items.length; i++)
	{			
		this.items[i].path = this.items[i].name;
	}	
	
	var selectItem, hadChildren = false;
	
	this._dragSource = this._getDragSource(
		{
			path: this.path,
			parentPath: this.parentPath
		}
	);

	// ADD THE STORE'S parentPath TO THE MENU
	this._dragSource.store = this.store;

	// IF THERE ARE NO ITEMS FOR THIS DIRECTORY,
	// INSERT A FAKE ITEM WITH NAME <EMPTY> 
	if ( ! this.items.length )	this.insertEmptyItem()

	var child, selectMenuItem;
	if ( this.items.length )
	{
		dojo.forEach(
			this.items,
			function(item)
		{
			child = this.parentWidget._getMenuItemForItem(item, this);
			if ( child )
			{
				this._dragSource.insertNodes(false, [child]);
				var insertedNodes = this._dragSource.getAllNodes();
				var lastNode = insertedNodes[insertedNodes.length - 1];
				
				// ADD DATA STORE TO ITEM'S CHILDREN
				if ( item.children )
				{
					for ( var i = 0; i < item.children.length; i++ )
					{
						item.children[i]._S = item._S;
						var childParentPath;
						var fullPath = '';
						if ( item.parentPath )	fullPath = item.parentPath;
						if ( item.path )	{
							if ( fullPath )
								fullPath += "/" + item.path;
							else
								fullPath = item.path;
						}
						if ( fullPath )
							item.children[i].parentPath = fullPath;
					}
					//console.log("plugins.files._GroupDragPane.onItems    [] []  [] [] [] [] [] [] [] [] [] [] Setting item.directory = true");
					item.directory = true;
				}

				// ADD ITEM TO THIS NODE
				lastNode.item = item;
				
				// SET CLASS
				dojo.hasClass(lastNode, "dojoxRollingListItemSelected");

				var applicationName = lastNode.innerHTML;
	
				// GET indexInParent - THE LEVEL OF THIS MENU IN THE PARENT
				var indexInParent = this.getIndexInParent();
	
				// SET nodeType BASED ON THE indexInParent TO COINCIDE WITH accept PARAMETER
				// OF DND SOURCE OF SAME LEVEL (E.G., Workflows CAN BE DRAGGED NEXT TO OTHER
				// WORKFLOWS BUT NOT INTO THE LOWER FILE DIRECTORIES)
				var nodeType;
				if ( indexInParent == 0 )
				{
					nodeType = 'workflow';
				}
				else
				{
					if ( item.directory == false || item.directory == "false" )
						nodeType = "file";
					else
						nodeType = "folder";
				}
				//console.log("plugins.files._GroupDragPane.onItems    [] [] [] [] [] [] [] [] [] [] [] item: ");
				//console.dir({item:item});
				//console.log("plugins.files._GroupDragPane.onItems    [] [] [] [] [] [] [] [] [] [] [] nodeType: " + nodeType);

				// GENERATE DYNAMIC DHTML MENU
				// AND BIND MENU TO THE DND NODE
				var dynamicMenu = thisObject.createMenu(nodeType);
				////console.log("plugins.files._GroupDragPane.onItems    dynamicMenu: " + dynamicMenu);
				if ( dynamicMenu != null )
				{
					dynamicMenu.bindDomNode( lastNode );
				}
				lastNode.setAttribute("dndType", nodeType);					

				// CONNECT ONCLICK
				dojo.connect(lastNode, "onclick", this, "onclickHandler");

				var _dragSource = this._dragSource;
				this._dragSource.onDropExternal = function(source, nodes, copy) {
					thisObject.onDropExternal(source, nodes, copy, _dragSource, item, lastNode);
				};

				
			} // if(child)
			
		}, this); // dojo.forEach(this.items, function(item)

	} // if ( this.items.length )
	


	// ADD dojo.connect TO DND SOURCE NODES
	////console.log("plugins.files._GroupDragPane.onItems    Adding dojo.connect to DND source nodes");
	var allNodes = this._dragSource.getAllNodes();
	////console.log("plugins.files._GroupDragPane.onItems    allNodes.length: " + allNodes.length);
	for ( var i = 0; i < allNodes.length; i++ )
	{
		var node = allNodes[i];
		dojo.addClass(node, "fileDrag");

		if ( ! node.item.directory || node.item.directory == "false" )
		{
			dojo.addClass(node, "file");
			dojo.addClass(node, "fileClosed");
		}
		else
		{
			dojo.addClass(node, "directory");
			dojo.addClass(node, "directoryClosed");
		}
		
		var applicationName = node.innerHTML;

		// GET indexInParent - THE LEVEL OF THIS MENU IN THE PARENT
		var indexInParent = this.getIndexInParent();

		// SET nodeType BASED ON THE indexInParent TO COINCIDE WITH accept PARAMETER
		// OF DND SOURCE OF SAME LEVEL (E.G., Workflows CAN BE DRAGGED NEXT TO OTHER
		// WORKFLOWS BUT NOT INTO THE LOWER FILE DIRECTORIES)
		var nodeType;
		if ( indexInParent == 0 )
		{
			nodeType = 'workflow';
		}
		else
		{
			nodeType = "file";
		}
		node.setAttribute("dndType", nodeType);
	}	

	this.containerNode.innerHTML = "";		
	this.containerNode.appendChild(this.menuNode);
	this.parentWidget.scrollIntoView(this);
	
	////console.log("plugins.files._GroupDragPane.onItems    END");
	
	////console.log("plugins.files._GroupDragPane.onItems    BEFORE this.inherited(arguments)");
	this.inherited(arguments);
	////console.log("plugins.files._GroupDragPane.onItems    AFTER this.inherited(arguments)");

	//////console.log("plugins.files._GroupDragPane.onItems    END OF SUB");
},


onDropExternal : function (source, nodes, copy, _dragSource, item, lastNode) {
/*
	OVERRIDE dojo.dnd.Source.onDropExternal TO NOTIFY SERVER OF CHANGES.

	COMPLETE THE COPY ON THE REMOTE FILESYSTEM AS FOLLOWS:
	
		1. CARRY OUT DND COPY
	   
		2. CHECK IF FILENAME ALREADY EXISTS, IF SO
			   DO POPUP TO CONFIRM OVERWRITE	
	   
		3. MESSAGE SERVER TO COPY FILES
	   
		4. SHOW ANIMATED 'COPYING' DIALOGUE
	   
		5. POLL SERVER FOR STATUS AND WAIT UNTIL COMPLETE
	   
		6. RELOAD THE PANE TO SHOW THE NEW FILE SYSTEM
*/

	console.log("_GroupDragPane.onDropExternal    plugins.files._GroupDragPane.onDropExternal(source, nodes, copy, _dragSource, item, lastNode, childScope)");
	console.log("_GroupDragPane.onDropExternal     source: " + source);
	console.log("_GroupDragPane.onDropExternal     nodes: ");
	console.dir({node:nodes});
	console.dir({_dragSource:_dragSource});
	console.dir({item:item});
	console.log("_GroupDragPane.onDropExternal     copy: " + copy);

	// SET this.lastNode
	this.lastNode = lastNode;
	this._dragSource = _dragSource;

	// EXTRACT owner FROM STORE url
	var putData = this.store.putData;
	console.log("_GroupDragPane.onDropExternal     BEFORE putData: ");
	console.dir({putData:putData});

	var url = nodes[0].item._S.url;
	console.log("_GroupDragPane.onDropExternal     url: " + url);

	var owner = putData.owner;
	console.log("_GroupDragPane.onDropExternal     owner: " + owner);

	var groupname = putData.groupname;
	console.log("_GroupDragPane.onDropExternal     groupname: " + groupname);

	// RESET URL
	var location	=	putData.location;
	console.log("_GroupDragPane.onDropExternal     location: " + location);
	
	var file = nodes[0].item.parentPath + "/" + nodes[0].item.path;
	var destination = this.path;
	if ( location )
		destination = location + "/" + this.path;
	
	putData.mode 			=	"copyFile";
	putData.sessionId		=	Agua.cookie('sessionId');
	putData.username		=	Agua.cookie('username');
	putData.file			=	file;
	putData.destination		=	destination;

	console.log("_GroupDragPane.onDropExternal     AFTER putData: ");
	console.dir({putData:putData});

	// SET this.url AND this.putData
	this.url 		= 	url;
	this.putData 	= 	putData;
	
	// DO copyFile
	this.copyFile(putData);
},

copyFile : function (putData) {
//	2. CHECK IF FILENAME ALREADY EXISTS AND IF SO CONFIRM OVERWRITE
	console.log("_GroupDragPane.copyFile    putData: ");
	console.dir({putData:putData});

	var url = Agua.cgiUrl + "folders.cgi?";
	console.log("_GroupDragPane.copyFile    url: " + url);

	// SHOW STANDBY
	this.standby.show();

	var thisObject = this;
	dojo.xhrPut(
	{
		url: url,
		handleAs: "json-comment-optional",
		sync: false,
		putData: dojo.toJson(putData),
		handle: function(response){
			console.log("_GroupDragPane.copyFile    response: ");
			console.dir({response:response});
			if ( response.error ) {
				// HIDE STANDBY
				thisObject.standby.hide();
	
				// POP UP OVERWRITE CONFIRMATION DIALOGUE WINDOW
				if ( response.error.match(/^File exists$/) )
					thisObject.checkOverwrite(putData.file, putData.destination);

				Agua.toastMessage({
					message: response.error,
					type: "error"
				});
			}
			else {
				console.log("_GroupDragPane.copyFile    Doing startPollCopy");
				thisObject.pollCopy();
			}
		}
	});
},

checkOverwrite : function(putData) {
	console.log("_GroupDragPane.checkOverwrite    checkOverwrite(file, destination)");
	console.log("_GroupDragPane.checkOverwrite    putData: ");
	console.dir({putData:putData});
	
	// SET CALLBACKS
	var thisObject = this;
	var yesCallback = function()
	{
		putData.modified = "overwrite";
		thisObject.copyFile(putData);
	};
	var noCallback = function(){};
	var title = "Delete file: " + file + "?";
	var message = "File already exists<br>Do you want to overwrite it?<br><span style='color: #222;'>Click 'Yes' to delete or 'No' to cancel</span>";
	console.log("_GroupDragPane.checkOverwrite    title: " + title);
	console.log("_GroupDragPane.checkOverwrite    message: " + message);

	// REFRESH CONFIRM WIDGET
	if ( this.confirm != null ) 	this.confirm.destroy();

	// SHOW DIALOGUE
	this.confirm = new plugins.dijit.Confirm({
		parentWidget : this,
		title: title,
		message : message,
		yesCallback : yesCallback,
		noCallback : noCallback
	});
	this.confirm.show();
},

setTimer : function() {
// 3. MESSAGE SERVER TO COPY FILES
	var onStart = dojo.hitch(this, "onStartCopy");
	var onEnd = dojo.hitch(this, "onEndCopy");
	var poll = dojo.hitch(this, "pollCopy");
	
},

setSequence : function () {
	this.sequence = new dojox.timing.Sequence({});
},

delayedPollCopy : function (delay) {
	console.log("_GroupDragPane.delayedPollCopy    Doing this.sequence.go(commands, ...)");
	if ( ! delay ) delay = 6000;
	var commands = [
		{ func: [this.showMessage, this, "_GroupDragPane.delayedPollCopy"], pauseAfter: delay },
		{ func: [this.showMessage, this, "another 2000ms pause and 1000ms pause before"], pauseAfter: 1000 },
		{ func: this.pollCopy } // no array, just a function to call 
	];
	console.log("_GroupDragPane.delayedPollCopy    commands: " + commands);
	console.dir({commands:commands});
	
	this.sequence.go(commands, function(){ console.log('other done'); });	
},


pollCopy : function() {
// 5. POLL SERVER FOR STATUS AND WAIT UNTIL COMPLETE
	console.log("_GroupDragPane.pollCopy    this.url: " + this.url);
	if ( ! this.url  || ! this.putData ) {
		if ( this.standby )
			this.standby.hide();
		return;
	}
	
	this.putData.modifier = "status";
	console.log("_GroupDragPane.pollCopy    this.putData: ");
	console.dir({this_putData:this.putData});

	var thisObject = this;
	var completed = false;
	dojo.xhrPut({
		url			: 	thisObject.url,
		handleAs	: 	"json-comment-optional",
		sync		: 	false,
		putData		:	dojo.toJson(this.putData),
		handle		: 	function (response) {
			console.log("_GroupDragPane.pollCopy    this.response: ");
			console.dir({response:response});
			
			if ( response.status == 'completed' ) {
				thisObject.polling = false;
				thisObject.standby.hide();
				thisObject.reloadPane();
				//Agua.toast(response);
			}
			else if ( response.error ) {
				thisObject.polling = false;
				thisObject.polling = false;
				thisObject.standby.hide();
				//Agua.toastError(response.error);
			}
			else
				thisObject.delayedPollCopy();
		}
	});
},

setStandby : function () {
	console.log("_GroupDragPane.setStandby    _GroupDragPane.setStandby()");
	//if ( this.standby )	return this.standby;
	
	var id = dijit.getUniqueId("dojox_widget_Standby");
	this.standby = new dojox.widget.Standby ({
		target: this.parentWidget.domNode,
		onClick: "reload",
		text: "Copying",
		id : id,
		url: "plugins/core/images/agua-biwave-24.png"
	});
	document.body.appendChild(this.standby.domNode);
	console.log("_GroupDragPane.setStandby    this.standby: " + this.standby);

	return this.standby;
},

reloadPane : function() {
	console.group("_GroupDragPane-" + this.id + "    reloadPane");
	
	console.log("_GroupDragPane.reloadPane    plugins.files._GroupDragPane.reloadPane()");
	var item = this.lastNode.item;
	console.log("_GroupDragPane.reloadPane    item: " + dojo.toJson(item));
	
	var children = item.children;
	if ( ! children )
		children = item.items;
	
	// CHANGE item PATH, NAME AND PARENTPATH TO ONE FOLDER UP
	item = this.itemParent(item);
	
	var itemPane = this.parentWidget._getPaneForItem(item, this._dragSource, children);
	this.query = itemPane.store.query;
	if(itemPane)
	{
		var paneIndex = this.getIndexInParent();
		this.parentWidget.addChild( itemPane, this.getIndexInParent() );
	}

	console.groupEnd("_GroupDragPane-" + this.id + "    reloadPane");
},

itemParent : function(item) {
	console.log("_GroupDragPane.itemParent(item)");
	console.dir({item:item});
	
	// SET DIRECTORY = TRUE
	item.directory = true;
	
	// CHANGE NAME, PATH AND PARENTPATH
	//
	// 1. IF PARENTPATH CONTAINS MULTIPLE LEVELS,
	// 		E.G., 'Project1/Workflow1-assembly'
	if ( item.parentPath.match(/^.+\/([^\/]+)$/) )
	{
		item.path = item.parentPath.match(/^(.+?)\/([^\/]+)$/)[2];
		item.parentPath = item.parentPath.match(/^(.+?)\/([^\/]+)$/)[1];
	}

	// 2. IF PARENTPATH IS AT THE TOP LEVEL, E.G., 'Project1',
	// 		SET PATH = PARENTPATH AND PARENTPATH = '' 
	else if ( item.parentPath.match(/\/*[^\/]+$/) )
	{
		item.path = item.parentPath;
		item.parentPath = '';
	}						
	item.name = item.path;
	//item.parentPath = item.parentPath.match(/^(.+?)\/[^\/]+$/)[1];

	console.log("_GroupDragPane.itemParent    Returning item:");
	console.dir({item:item});
	return item;
},

onclickHandler : function (e) {
// HANDLE CLICK ON FILE OR FOLDER
	console.group("_GroupDragPane-" + this.id + "    checkStages");
	console.log("plugins.files._GroupDragPane._onClickHandler    XXXXXXXXXXXXXXXXXXXXXXXXXxx e.target.item: ");
	console.dir({e_target_item:e.target.item});
	console.log("plugins.files._GroupDragPane._onClickHandler    XXXXXXXXXXXXXXXXXXXXXXXXXxx this: " + this);
	console.dir({this:this});

	// GET THE CLICKED DND SOURCE ITEM NODE
	var item = e.target.item;
	var children = item.children || item.items;

	var itemPane = this.parentWidget._getPaneForItem(item, this, children);

	// SET this.query TO itemPane.store.query
	this.query = itemPane.store.query;
	console.log("plugins.files._GroupDragPane._onClickHandler    this.query: " + dojo.toJson(this.query, true));
	
	if(itemPane)
	{
		// CALLS addChild IN plugins.files.FileDrag
		// summary: adds a child to this rolling list - if passed an insertIndex,
		//  then all children from that index on will be removed and destroyed
		//  before adding the child.
		console.log("plugins.files._GroupDragPane._onClickHandler    Doing this.parentWidget.addChild(itemPane, " + (this.getIndexInParent() + 1) + ")");
		
		this.parentWidget.addChild(itemPane, this.getIndexInParent() + 1);
	}
	else
	{
		this.parentWidget(this);
		this.parentWidget._onItemClick(null, this, selectMenuItem.item, selectMenuItem.children);
	}

	console.groupEnd("_GroupDragPane-" + this.id + "    checkStages");
},

focus: function (force){
	// summary: sets the focus to this current widget

	
	if(this._dragSource){
		if(this._pendingFocus){
			this.disconnect(this._pendingFocus);
		}
		delete this._pendingFocus;
		
		// We focus the right widget - either the focusedChild, the
		//   selected node, the first menu item, or the menu itself
		var focusWidget = this._dragSource.focusedChild;
		if(!focusWidget){
			var focusNode = dojo.query(".dojoxRollingListItemSelected", this.domNode)[0];
			if(focusNode){
				focusWidget = dijit.byNode(focusNode);
			}
		}
		
		if(!focusWidget){
			focusWidget = this._dragSource.getAllNodes()[0] || this._dragSource;
		}

		this._focusByNode = false;

		if(focusWidget.focusNode){
			if(!this.parentWidget._savedFocus || force){
				try{focusWidget.focusNode.focus();}catch(e){}
			}
			window.setTimeout(function(){
				try{
					dijit.scrollIntoView(focusWidget.focusNode);
				}catch(e){}
			}, 1);
		}else if(focusWidget.focus){
			if(!this.parentWidget._savedFocus || force){
				focusWidget.focus();
			}
		}else{
			this._focusByNode = true;
		}
		this.inherited(arguments);
	}else if(!this._pendingFocus){
		this._pendingFocus = this.connect(this, "onItems", "focus");
	}
	else
	{
	}
	
},





_getDragSource: function(){
	// summary: returns a widget to be used for the container widget.
	// GET UNIQUE ID FOR THIS MENU TO BE USED IN DND SOURCE LATER
	var objectName = "dojo.dnd.Source";
	var id = dijit.getUniqueId(objectName.replace(/\./g,"_"));
	//var id = dijit.getUniqueId(this.declaredClass.replace(/\./g,"_"));

	// SET THE MENU NODE'S ID TO THIS NEW ID
	this.menuNode.id = id;

	// GET indexInParent - THE LEVEL OF THIS DRAG SOURCE IN THE PARENT
	var indexInParent = this.getIndexInParent();
	
	// SET accept BASED ON THE indexInParent
	
	var acceptType;
	if ( indexInParent == 0 )
	{
		acceptType = 'workflow';
	}
	else
	{
		acceptType = "file";
	}

	// GENERATE DND SOURCE WITH UNIQUE ID
	var dragSource = new dojo.dnd.Source(
		id,
		{
			accept: [ acceptType ],
			copyOnly: true
		}
	);
		
	// SET baseClass
	this.menuNode.setAttribute('class', 'fileDrag');
	
	// SET PARENTPATH AND PATH
	if ( this.path )
	{
		dragSource.path = this.path;
	}
	if ( this.parentPath )
	{
		dragSource.parentPath = this.parentPath;
	}

	if(!dragSource._started){
		dragSource.startup();
	}

	return dragSource;
}




});

/*
  


// LEGACY FUNCTION FROM RollingListGroupPane. REVIEW WHETHER TO REMOVE LATER
_getSelected: function( menu){
	// summary:
	//	returns the selected menu item - or null if none are selected
	
	
	if( !menu )   { menu = this._dragSource; }
	
	if ( menu )
	{
		// SELECTED DND SOURCE HAS CLASS dojoDndItemAnchor
		var nodes = this._dragSource.getAllNodes();

//			var children = this._dragSource.getChildren();
		for ( var i = 0; i < nodes.length; i++ )
//			for(var i = 0, item; (item = children[i]); i++)
		{
			//if(dojo.hasClass(item.domNode, "dojoxRollingListItemSelected")){
			var node = nodes[i];
			if ( node.className.match(/dojoDndItemOver/) )
			{
				return node;
			}
		}
	}
	return null;
},



// LEGACY FUNCTION FROM RollingListGroupPane. REVIEW WHETHER TO REMOVE LATER
_setSelected: function(item, menu){
	// summary:
	//	selects the given item in the given menu (defaults to pane's menu)
	if(!menu){ menu = this._dragSource;}
	if(menu){
		dojo.forEach(menu.getChildren(), function(i){
			this.parentWidget._updateClass(i.domNode, "Item", {"Selected": (item && (i == item && !i.disabled))});
		}, this);
	}
}

*/