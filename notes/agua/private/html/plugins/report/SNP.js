dojo.provide("plugins.report.SNP");
 	
// TO DO: ADDITIONAL FILTER WITH CCDS
//
//	Promoter/Upstream by  ___  bases 
//	5' UTR Exons 
//	CDS Exons 
//	3' UTR Exons 
//	Introns 
//	Downstream by ___ bases

////http://localhost/agua/0.4/dojo-1.5.0/dojox/layout/tests/test_ExpandoPane.html
////http://localhost/agua/0.4/dojo-1.5.0/dojox/layout/tests/test_ExpandoPane.html


dojo.require("dijit.dijit"); // optimize: load dijit layer

dojo.require("dijit.form.CheckBox");
////dojo.require("dijit.form.ValidationTextBox");
//dojo.require("dijit.form.RadioButton");
//dojo.require("dijit.form.ComboBox");

dojo.require("dijit.form.Slider");
dojo.require("dijit.form.FilteringSelect");
dojo.require("dijit.form.Button");

// DEPTH NUMBER SPINNER
dojo.require("dijit.form.NumberSpinner");

// NOTES EDITOR
dojo.require("dijit.Editor");
dojo.require("dijit.form.DateTextBox");
dojo.require("dijit.form.Textarea");

dojo.require("dijit.form.TextBox");
dojo.require("dijit.form.ValidationTextBox");
dojo.require("dijit.form.NumberTextBox");
dojo.require("dijit.form.CurrencyTextBox");
dojo.require("dojo.currency");
dojo.require("dijit.Dialog");

// FILE UPLOAD
//dojo.require("plugins.upload.FileUp");
dojo.require("plugins.form.UploadDialog");

// TITLE PANES FOR EACH SECTION
dojo.require("dijit.TitlePane");

// STORE FOR PROJECT AND WORKFLOW COMBOS
dojo.require("dojo.data.ItemFileReadStore");

// GRID BUT ARE NEEDED FOR SNP ??
dojo.require("dijit.Tooltip");
dojo.require("dijit.Menu");
dojo.require("dijit.ColorPalette");

// PARSER
dojo.require("dojo.parser");

// CUSTOM EDITOR
dojo.require("plugins.report.Editor");

// FILE MANAGER HAS FILE SELECTORS
dojo.require("plugins.workflow.FileManager");
dojo.require("plugins.files.FileSelector");

// INHERITED CLASSES
dojo.require("plugins.core.Common");

// HAS A
dojo.require("plugins.report.Grid");
dojo.require("plugins.core.ComboBox");

dojo.declare(
    "plugins.report.SNP",
    [ dijit._Widget, dijit._Templated, plugins.core.Common ],
{
	/////}}
	
//Path to the template of this widget. 
templatePath: dojo.moduleUrl("plugins", "report/templates/snp.html"),

// Calls dijit._Templated.widgetsInTemplate
widgetsInTemplate : true,

url : '',
	id : '',
filename: '',
loading: null,

// OR USE @import IN HTML TEMPLATE
cssFiles : [ "plugins/report/css/snp.css" ],

// CURRENT PROJECT AND WORKFLOW
project : null,
workflow : null,	  

fileBrowser : null,

// FILTERS
filters: [ "chromosome","variant","depth","sense","exonic","dbsnp" ],
filterInputs: [ "chromosomeCombo","variantInput","depthSpinner","senseCombo","exonicCombo","dbsnpCombo" ],

// ELEMENTS
elementTypes :
{
	"editor" : "editor",
	"reportCombo": "combobox",
	"workflowCombo": "combobox",
	"projectCombo": "combobox",
	"chromosomeCombo": "combobox",
	"speciesCombo": "combobox",
	"senseCombo": "combobox",
	"exonicCombo": "combobox",
	"dbsnpCombo": "combobox",
	"chromosomeCheckbox": "checkbox",
	"senseCheckbox": "checkbox",
	"exonicCheckbox": "checkbox",
	"dbsnpCheckbox": "checkbox",
	"depthCheckbox": "checkbox", 
	"variantCheckbox": "checkbox",
	"fileInput": "input",
	"variantInput": "input",
	"depthSpinner": "spinner",
	"totalResult": "div",
	"chromosomeResult": "div",
	"variantResult": "div",
	"depthResult": "div",
	"senseResult": "div",
	"exonicResult": "div",
	"dbsnpResult": "div"
},


constructor : function (args) {
	console.log("SNP.constructor    plugins.report.SNP.constructor(args)");
	
	this.project = args.project;
	this.workflow = args.workflow;
	this.filename = args.filename;

	console.log("SNP.constructor    this.project: " + this.project);
	console.log("SNP.constructor    this.workflow: " + this.workflow);
	console.log("SNP.constructor    this.filename: " + this.filename);
},

postMixInProperties: function() {
	console.log("SNP.postMixInProperties    plugins.report.SNP.postMixInProperties()");
	//this.popup = new dijit.Dialog({});
	console.log("SNP.postMixInProperties    this.containerNode: " + this.containerNode);
},

postCreate: function() {
	console.log("SNP.postCreate    plugins.report.SNP.postCreate()");
	console.log("SNP.postCreate    this.containerNode: " + this.containerNode);
	console.log("SNP.postCreate    this.domNode: " + this.domNode);

	this.startup();
},

// START UP GRID OBJECT, SET COMBOS, BUTTONS, ETC.
startup : function () {
	console.log("SNP.startup    plugins.report.SNP.startup()");

	// SET UP THE ELEMENT OBJECTS AND THEIR VALUE FUNCTIONS
	this.inherited(arguments);
	console.log("SNP.startup    AFTER this.inherited(arguments)");

	// LOAD CSS STYLE FILES
	this.loadCSS();

	// ADD TO TAB CONTAINER		
	this.attachNode.appendChild(this.containerNode);
	console.log("SNP.startup    AFTER this.attachNode.addChild(this.containerNode)");

//return;

	// SET GRID
	this.setGrid();

	// SET REPORT COMBO KEY PRESS LISTENER
	this.setReportComboOnkeypress();

	// SET PROJECT COMBO
	this.setProjectCombo();

	// SET FILE NAME
	this.setFilename();
	
	// SET EDITOR
	this.setEditor();

	// SET SPECIES COMBO
	this.setSpeciesCombo();
	
	// SET VARIANT SLIDER
	this.setVariantSlider();
	
	// SET DEPTH SPINNER
	this.setDepthSpinner();
	
	// SET COMBO BOXES
	this.setCombos();
	
	//// SET FILE UPLOAD
	//this.setFileUpload();
	
	//// SET FILE BROWSE
	//this.setFileBrowse();

	// SET 'OK' BUTTON
	this.setOkButton();	

	// SET CHECKBOXES
	this.setCheckboxes();
	
	
// DEBUG
this.filterReport();


},

// INSTANTIATE GRID OBJECT AND ATTACH
setGrid : function () {
	console.log("SNP.setGrid     plugins.report.SNP.setGrid()");
	this.grid = new plugins.report.Grid(
		{
			//attachNode: this.gridAttachNode,
			attachNode: this.gridPane.domNode,
			parentWidget: this
		}
	);
},

// LOAD FILTER RESULT DATA INTO GRID OBJECT
loadGrid : function(data) {
	console.log("SNP.loadGrid     plugins.report.SNP.loadGrid()");

	this.grid.load(data);
},


// FILTER SNPS BASED ON FILTER PARAMETERS
filterReport : function() {
	console.log("SNP.filterReport     plugins.report.SNP.filterReport()");
	var snpReport = this;

//			// SET LOADING ICON
//            this.loading = true;
//			console.log("SNP.filterReport     this.loadingIcon: " + this.loadingIcon);
//            dojo.removeClass(this.loadingIcon, "static");
//            dojo.addClass(this.loadingIcon, "loading");

	// GENERATE QUERY
	var query = new Object;
	query.username = Agua.cookie('username');
	query.sessionId = Agua.cookie('sessionId');
	
	if ( query.sessionId == null || query.username == null )
	{
		console.log("SNP.filterReport     query.sessionId is null or query.username is null. Returning");
		return;
	}
	query.project = this.projectCombo.getValue();
	query.workflow = this.workflowCombo.getValue();
	query.report = this.reportCombo.getValue();
	console.log("SNP.filterReport     Agua.cookies: " + dojo.toJson(Agua.cookies));
	console.log("SNP.filterReport     query: " + dojo.toJson(query));

	// ADD mode AND class
	query.mode = "filterReport";
	query["class"] = "Report::SNP";

	// GET THE CURRENT SETTINGS OF ALL THE REPORT FORM WIDGETS
	for ( name in this.elementTypes )
	{
		var value = this.getValueType(this[name], this.elementTypes[name]);

		if ( name == "fileInput" )
		{
			var project = this.projectCombo.getValue();
			var workflow = this.workflowCombo.getValue();
			value = project + "/" + workflow + "/" + value;
		}

		//console.log("SNP.filterReport     name " + name + " value: " + value);
		if ( value == "on" )	value = true;
		if ( value == "off" )	value = false;
		if ( ! value )	value = false;
		query[name] = value;
	}
	
	
	//// GET THE FILTER VALUES
	//var filters = this.filters;
	//console.log("SNP.filterReport     filters: " + dojo.toJson(filters));
	//query.filters = new Object;
	//for ( var i = 0; i < filters.length; i++ )
	//{
	//	//console.log("SNP.filterReport     filters[" + index + "]: " + filters[index]);
	//	var name = filters[i] + "Checkbox";
	//	var value;
	//	var value = this.getValueType(this[filters[i]], this.elementTypes[filters[i]]);
	//	console.log("SNP.filterReport     filter " + filters[i] + " value: " + value);
	//	if ( value == "on" )	{	value = true;	}
	//	if ( value == "off" )	{	value = false;	}
	//	query.filters[filters[i]] = value;
	//}

	console.log("SNP.filterReport     query: " + dojo.toJson(query));
	
	// POST DATA TO SERVER
	var template = this;
	dojo.xhrPut(
		{
			//url: this.url,
			url : Agua.cgiUrl + "report.cgi",
			contentType: "text",
			handleAs: "json",
			sync: true,
			postData: dojo.toJson(query),
			//handleAs: "json-comment-filtered",
			timeout: 50000,
			load: function(response, ioArgs) {
				console.log("SNP.filterReport     xhrPost response: " + response);
				snpReport.loadReturnValues(response);
			},
			error: function(response, ioArgs) {
				//console.log("SNP.Error with filterReport, response: " + response + ", ioArgs: " + ioArgs + ",  response: " + dojo.toJson(response));
				return response;
			}
		}
	);
},


// LOAD RETURNED VALUES FROM SERVER INTO WIDGETS/NODES ON PAGE
loadReturnValues : function (values) {
	console.log("SNP.loadReturnValues    plugins.report.SNP.loadReturnValues(values)");
	console.log("SNP.loadReturnValues    values " + values);
	//console.log("SNP.loadReturnValues    values: " + dojo.toJson(values));
	
	// SET UP FILTERS RESULTS IN ORDER
	for ( var i = 0; i < this.filters.length; i++)
	{
		var filterName = this.filters[i] + "Result";
		var value = values[filterName];
		if ( value == null )	value = "0";
		console.log("SNP.loadReturnValues    filterName: " + filterName + ", value: " + value);
		this.setValueType(this[filterName], this.elementTypes[filterName], value);
	}

	// DO totalResult
	var totalValue = values["totalResult"] ? values["totalResult"] : "0";
	this.setValueType(this.totalResult, this.elementTypes["totalResult"], totalValue);
	
	// DO GRID
	var data = {"identifier":"id","label":"id","items":[]};

	// CONVERT ARRAYS INTO HASHES
	var fieldNames = ['name','chromosome','ccdsstart','ccdsstop','referencenucleotide','variantnucleotide','depth','variantfrequency','chromosomestart','chromosomestop','sense','referencecodon','variantcodon','referenceaa','variantaa','strand','snp','score','dbsnpstrand'];


	// SET COMBOBOX VALUES
	var twoDarray = dojo.fromJson(values["outputResult"]);
	if ( twoDarray == null )
	{
		console.log("SNP.loadReturnValues    twoDarray is null. Returning");
		return;
	}
	for ( var j = 0; j < twoDarray.length; j++ )
	{
		var hash = new Object;
		hash.id = j + 1;
		var array = twoDarray[j];
		
		for ( k = 0; k < fieldNames.length; k++ )
		{
			hash[fieldNames[k]] = array[k];
		}
		data.items.push(hash);
	}
	console.log("SNP.loadReturnValues    data.length " + data.length);


	// LOAD GRID
	setTimeout(function(thisObj) { thisObj.loadGrid(data); }, 100, this);

	//// SET FINISHED LOADING ICON
	//this.loading = false;
	//dojo.removeClass(this.loadingIcon, "loading");
	//dojo.addClass(this.loadingIcon, "static");
},


// SET ONKEY LISTENER
setReportComboOnkeypress : function () {
	
	console.log("SNP.this.reportCombo    plugins.report.SNP.this.reportCombo()");
		
	// OVERRIDE LISTENER TO HANDLE KEYBOARD EVENTS
	var reportObject = this;
	dojo.connect(this.reportCombo.comboNode, "onkeypress", function(event){
		console.log("SNP.this.reportCombo._onKeyPress	OVERRIDE dijit.form.ComboBox._onKeyPress(/*Event*/ evt)");
		console.log("SNP.this.reportCombo._onKeyPress	name: " + name);
		
		var key = event.charOrCode;
		console.log("SNP.this.reportCombo._onKeyPress	key: " + key);
		
		if ( key == 13 )
		{
			//reportObject.reportCombo._hideResultList();
			reportObject.newReport();
			if ( reportObject.reportCombo._popupWidget != null )
			{
				reportObject.reportCombo._showResultList();
			}
		}
	});
},



// CREATE A NEW REPORT ON TRIGGER this.reportCombo._onKeyPress ENTER
newReport : function () {
	console.log("SNP.newReport    plugins.report.SNP.newReport()");

	if ( this.doingNew == true )
	{
		console.log("SNP.newReport    this.doingNew is true. Returning.");
		return;
	}

	// SET this.doingNew
	this.doingNew = true;
	 
	// SANITY CHECK	
	if ( ! Agua.getWorkflows() )
	{
		console.log("SNP.newReport    Agua.getWorkflows() not defined. Returning.");
		return;
	}

	// GET NEW REPORT NAME
	var reportName = this.reportCombo.getValue();
	console.log("SNP.newReport    reportName: " + reportName);
	var projectName = this.projectCombo.getValue();
	var workflowName = this.workflowCombo.getValue();

	// CHECK IF NAME ALREADY EXISTS
	console.log("SNP.newReport    Checking if report name exists already.");
	if ( Agua.isReport(projectName, reportName) )
	{
		console.log("SNP.newReport    Report name exists already: " + reportName + ". Returning.");
		return;
	}

	// HIDE REPORT COMBO DROPDOWN
	//this.reportCombo._isShowingNow = true;
	if ( this.reportCombo._popupWidget )
	{
		this.reportCombo._popupWidget.previousButton.style.display = "none";
		this.reportCombo._popupWidget.nextButton.style.display = "none";
		//console.log("SNP.newReport    BEFORE this.reportCombo._hideResultList()");
		//this.reportCombo._hideResultList();
		//console.log("SNP.newReport    AFTER this.reportCombo._hideResultList()");
	}

	// ADD REPORT TO THIS PROJECT
	Agua.addReport(
	{
		project: projectName,
		workflow: workflowName,
		report: reportName
	});

	// SHOW REPORT COMBO DROPDOWN
	console.log("SNP.newReport    BEFORE this.reportCombo._showResultList()");
	this.reportCombo._showResultList();
	console.log("SNP.newReport    AFTER this.reportCombo._showResultList()");

	// UNSET this.doingNew
	this.doingNew = false;

	// RESET THE PROJECT COMBO
	this.setReportCombo(projectName, reportName);

	// SEND TO SERVER
	this.addReport(projectName, workflowName, reportName);
},


// ADD REPORT TO DATABASE ON SERVER
addReport : function (projectName, workflowName, reportName) {
	console.log("SNP.addReport    plugins.report.SNP.addReport()");
		
	// GENERATE QUERY
	var query = new Object;
	query.username = Agua.cookie('username');
	query.sessionId = Agua.cookie('sessionId');
	query.project = projectName;
	query.workflow = workflowName;
	query.name = reportName;
	query.mode = "addReport";
	query.module = "Report::SNP";
	console.log("SNP.addReport    query: " + dojo.toJson(query));

	// POST DATA TO SERVER
	var template = this;
	dojo.xhrPost(
		{
			//url: this.url,
			url : "plugins/report/templates/SNP.json",
			contentType: "text",
			handleAs: "json",
			postData: dojo.toJson(query),
			//handleAs: "json-comment-filtered",
			timeout: 2000,
			load: function(response, ioArgs) {
				template.loadReturnValues(response, ioArgs);
			},
			error: function(response, ioArgs) {
				console.log("Error with addReport, response: " + response + ", ioArgs: " + ioArgs);
				//return response;
			}
		}
	);
},



// DELETE A PROJECT AFTER ONCLICK 'DELETE' BUTTON BESIDE project COMBOBOX
deleteReport : function (event) {
	console.log("Report.deleteReport    plugins.report.Report.deleteReport(event)");
	console.log("Report.deleteReport    this.doingDelete: " + this.doingDelete);
	
	// SET this.doingDelete OR EXIT IF BUSY
	if ( this.doingDelete == true )
	{
		console.log("Report.deleteReport    this.doingDelete is true. Returning.");
		return;
	}
	this.doingDelete = true;

	if ( ! Agua.getWorkflows() )
	{
		console.log("Report.deleteReport    Agua.getWorkflows() not defined. Returning.");
		return;
	}
	
	// GET DELETED PROJECT NAME OR QUIT IF EMPTY
	var projectName = this.projectCombo.getValue();
	var workflowName = this.workflowCombo.getValue();
	if ( projectName == null || ! projectName )
	{
		console.log("Report.deleteReport    deleted project is null. Returning.");
		this.doingDelete = false;
		return;
	}
	console.log("Report.deleteReport    projectName: " + projectName);
	
	// GET DELETED report NAME OR QUIT IF EMPTY
	var reportName = this.reportCombo.getValue();
	console.log("Report.deleteReport    reportName: " + reportName);
	if ( reportName == null || ! reportName )
	{
		console.log("Report.deleteReport    deleted report is null. Returning.");
		this.doingDelete = false;
		return;
	}
	
	// SET ARGS FOR CONFIRM DELETE
	var args = new Object;
	args.projectName = projectName;
	args.workflowName = workflowName;
	args.reportName = reportName;


	// DO CONFIRM DELETE
	this.confirmDelete(args);

	// UNSET this.doingDelete
	this.doingDelete = false;
},



confirmDelete : function (args) {
	console.log("Report.confirmDelete    plugins.report.Report.confirmDelete(args)");
	console.log("Report.confirmDelete    args: " + dojo.toJson(args));
	
	var projectName = args.projectName ;
	var workflowName = args.workflowName;
	var reportName = args.reportName;
	
	if ( projectName == null )
	{
		console.log("Report.confirmDelete    projectName or projectIndex is null. Returning.");
		return;
	}

	var reportObject = this;

	// GENERATE THE CONFIRMATION DIALOGUE
	function raiseQueryDialog(title, question, callbackFn) {

		var node = document.createElement('div');
		document.body.appendChild(node);

		var confirmDialog = new dijit.Dialog({ id: 'queryDialog', title: title }, node);
		confirmDialog.attr('class', 'deleteConfirmationDialogue');
		dojo.addClass(confirmDialog.titleBar, 'deleteConfirmationDialogueTitle');
		
		// When either button is pressed, kill the dialog and call the callbackFn.
		var commonCallback = function(mouseEvent)
		{
			console.log("Report.confirmDelete    mouseEvent.target: " + mouseEvent.target);
			confirmDialog.hide();
			confirmDialog.destroyRecursive();
			if (mouseEvent.explicitOriginalTarget.id == 'yesButton')
			{
				console.log("Report.confirmDelete    commonCallback    yesButton pressed");

				// IF THE report IS DEFINED, DELETE IT AND
				// UPDATE THE report COMBO BOX
				if ( reportName != null )
				{
					Agua.removeReport(
					{
						project: projectName,
						workflow: workflowName,
						report: reportName
					});
					reportObject.setReportCombo(projectName, workflowName);
				}
			}
			else
			{
				return false;
			}
		};
	
		// CREATE CONTENT AND BUTTONS
		var questionDiv = document.createElement('div');
		questionDiv.innerHTML = question;
		var yesButton = new dijit.form.Button(
			{ label: 'Yes', id: 'yesButton', onClick: commonCallback }
		);
		yesButton.attr('class', 'deleteConfirmationButton');
		dojo.addClass(yesButton, 'deleteYesButton');

		var noButton = new dijit.form.Button(
			{ label: 'No', id: 'noButton', onClick: commonCallback }
		);
		noButton.attr('class', 'deleteConfirmationButton');
		dojo.addClass(noButton, 'deleteNoButton');

		// ADD CONTENT AND BUTTONS
		dojo.addClass(yesButton, 'deleteYesButton');
		yesButton.attr('class', 'deleteConfirmationButton');
		
		confirmDialog.containerNode.appendChild(questionDiv);
		confirmDialog.containerNode.appendChild(yesButton.domNode);
		confirmDialog.containerNode.appendChild(noButton.domNode);

		confirmDialog.show();
	}
			
	var projectReport = "project '" + projectName + "'";
	if ( reportName != null )
	{
		projectReport = "report '" + reportName + "' in " + projectReport;
	}

	raiseQueryDialog("Confirm delete", "Do you really want to delete " + projectReport + "?");
},





// DO THIS LATER: TO LOAD REPORT JSON
// EXAMPLE OF xhrPost
// http://www.dojoforum.com/2007/10/11/dojo-example-xhrget-and-xhrpost
loadReport : function() {
	console.log("SNP.loadReport    plugins.report.SNP.loadReport()");
		
	// GENERATE QUERY
	var query = new Object;
	query.username = Agua.cookie('username');
	query.sessionId = Agua.cookie('sessionId');
	query.project = this.projectCombo.getValue();
	query.workflow = this.workflowCombo.getValue();
	query.report = this.reportCombo.getValue();
	query.mode = "loadReport";
	query.module = "Report::SNP";
	console.log("SNP.loadReport    query: " + dojo.toJson(query));

	// POST DATA TO SERVER
	var template = this;
	dojo.xhrPost(
		{
			//url: this.url,
			url : "plugins/report/templates/SNP.json",
			contentType: "text",
			handleAs: "json",
			postData: dojo.toJson(query),
			//handleAs: "json-comment-filtered",
			timeout: 2000,
			load: function(response, ioArgs) {
				template.loadReturnValues(response, ioArgs);
			},
			error: function(response, ioArgs) {
				console.log("Error with loadReport, response: " + response + ", ioArgs: " + ioArgs);
				//return response;
			}
		}
	);
},


// OPEN A WINDOW IN THE VIEW TAB WITHIN THE GIVEN CHROMOSOMAL REGION
openView : function (name, chromosome, chromosomeStart, chromosomeStop ) {
	console.log("SNP.openView     SNP.openView(name, chromosome, chromosomeStart, chromosomeStop)");
	console.log("SNP.openView     name: " + name);
	console.log("SNP.openView     chromosome: " + chromosome);
	console.log("SNP.openView     chromosomeStart: " + chromosomeStart);
	console.log("SNP.openView     chromosomeStop: " + chromosomeStop);
	
	
	
},





// OPEN FILE MANAGER TO ALLOW SELECTION OF FILE AS ARGUMENT VALUE	
openFileBrowser : function(node) {
	console.log("SNP.openFileBrowser     SNP.openFileBrowser(node)");
	console.log("SNP.openFileBrowser     node: " + node);

	var valueNode = this.fileInput;
	console.log("SNP.openFileBrowser     valueNode: " + valueNode);
	
	var callArguments = new Array;
	callArguments.node = valueNode;

	// SET CALLBACK
	var selectCallback = dojo.hitch(this, function(file, location)
		{
			console.log("SNP.openFileBrowser     DOING callback(file, location)");
			console.log("SNP.openFileBrowser     file: " + file);
			console.log("SNP.openFileBrowser     location: " + location);
			this.fileInput.value = file;
			
			//var project;
			//var workflow;
			//var filename;
			//if ( file.match( /^([^\/]+)\/([^\/]+)\/(.+)$/ ) )
			//{
			//	this.projectCombo.setValue(file.match( /^([^\/]+)\/([^\/]+)\/(.+)$/ )[1]);
			//	this.workflowCombo.setValue(file.match( /^([^\/]+)\/([^\/]+)\/(.+)$/ )[2]);
			//	this.fileInput.value = file.match( /^([^\/]+)\/([^\/]+)\/(.+)$/ )[3];
			//}
		}
	);
	//console.log("SNP.openFileBrowser     callback: " + callback);

	// DESTROY ANY EXISTING this.fileBrowser
	if ( this.fileBrowser )
	{
		this.fileBrowser.destroy();
	}

	var fileManager = new plugins.workflow.FileManager(
	{
		paneId: "projects" + this.paneId,
		tabsNodeId: "tabs",
		project : this.project,
		workflow : this.workflow,
		selectCallback: selectCallback,
		addCallback: selectCallback,
		projects: Agua.getWorkflows(),
		workflowObject: this
	} );

	fileManager.node = node;

	this.fileBrowser = fileManager;
},




// SET EDITOR WIDGET AND ITS DEFAULT VALUE
setEditor : function () {
	console.log("SNP.setEditor    plugins.report.SNP.setEditor(node)");
	this.editor = new plugins.report.Editor(
		{
			extraPlugins: "['|', 'formatBlock']",
			height :  "100px",
			minHeight: "1em",
			maxHeight: "1em"
		},
		this.editor
	);
	console.log("SNP.setEditor    this.editor: " + this.editor);

	
	// SET INITIAL VALUE IF EMPTY
	var value = this.getValueType(this.editor, 'editor');
	console.log("SNP.setEditor    value: " + value);


	if ( value == null )
	{
		this.setValueType(this.editor, 'editor', "A <i>rich</i> <b>text</b> summary of your report");
	}
},





// SEND ALL VALUES OF ALL ELEMENTS IN THE TEMPLATE TO THE SERVER
// editor.getValue() GIVES THE HTML MARKUP 
saveReport : function() {
	console.log("SNP.saveReport     plugins.report.Common.saveReport()");
	//console.log("SNP.saveReport     this.url: " + this.url);
	
	// STORE JSON QUERY
	var json = this.getData();
	console.log("SNP.saveReport     json: " + dojo.toJson(json));

	// ADD mode AND class
	var query = new Object;
	query.mode = "saveReport";
	query["class"] = "Report::SNP";   

	// ADD USER AUTHENTICATION INFO AND REPORT INFO
	query.username = Agua.cookie('username');
	query.sessionId = Agua.cookie('sessionId');
	query.project = this.projectCombo.getValue();
	query.workflow = this.workflowCombo.getValue();
	query.report = this.reportCombo.getValue();
	query.json = json;
	
	console.log("SNP.saveReport     query: " + dojo.toJson(query));

	// POST DATA TO SERVER
	dojo.xhrPut(
		{
			url: Agua.cgiUrl + "report.cgi",
			contentType: "text",
			//handleAs: "json",
			//handleAs: "json-comment-filtered",
			putData: dojo.toJson(query),
			timeout: 20000,
			load: function(response, ioArgs) {
				console.log("SNP.JSON Post worked.");
				return response;
			},
			error: function(response, ioArgs) {
				console.log("SNP.Error with JSON Post, response: " + response + ", ioArgs: " + ioArgs);
				return response;
			}
		}
	);
	
},


// GET VALUES OF ALL ELEMENTS IN THE TEMPLATE
getData : function () {
	console.log("SNP.getData    plugins.report.SNP.getData()");

	var data = new Object;
	for ( var name in this.elementObjects )
	{
		if ( ! this.elementObjects[name].valueFunction )
		{
			data[name] = '';
		}
		else
		{
			var value = this.elementObjects[name].valueFunction();
			if ( ! value )
			{
				value = false;
			}
			data[name] = value;
		}
	}

	return data;
},




// SET FILENAME IF PRESENT
setFilename : function () {
	console.log("SNP.setFilename    plugins.report.SNP.setFilename()");
	//console.log("SNP.setFilename    this.filename: " + this.filename);
	//console.log("SNP.setFile    this.fileInput: " + this.fileInput);
	
	if ( this.filename )
		this.fileInput.value= this.filename;
},


// ADD CSS CLASS INFORMATION TO COMPLETE plugins.core.ComboBox
setCombos : function () {
	// SET CSS
	this.projectCombo.popupClass = "workflow workflows dijitReset dijitMenu";
	this.projectCombo.wrapperClass = "workflows dijitPopup";
	this.projectCombo.itemHeight = 30;

	// SET CSS
	this.workflowCombo.popupClass = "workflow workflows dijitReset dijitMenu";
	this.workflowCombo.wrapperClass = "workflows dijitPopup";
	this.workflowCombo.itemHeight = 30;

	// SET CSS
	this.reportCombo.popupClass = "workflow workflows dijitReset dijitMenu";
	this.reportCombo.wrapperClass = "workflows dijitPopup";
	this.reportCombo.itemHeight = 30;
	
	// SET CSS
	this.speciesCombo.popupClass = "workflow workflows dijitReset dijitMenu";
	this.speciesCombo.wrapperClass = "workflows dijitPopup";
	this.speciesCombo.itemHeight = 30;

	// SET CSS
	this.chromosomeCombo.popupClass = "workflow workflows dijitReset dijitMenu";
	this.chromosomeCombo.wrapperClass = "workflows dijitPopup";
	this.chromosomeCombo.itemHeight = 30;

	// SET CSS
	this.senseCombo.popupClass = "workflow workflows dijitReset dijitMenu";
	this.senseCombo.wrapperClass = "workflows dijitPopup";
	this.senseCombo.itemHeight = 30;

	// SET CSS
	this.exonicCombo.popupClass = "workflow workflows dijitReset dijitMenu";
	this.exonicCombo.wrapperClass = "workflows dijitPopup";
	this.exonicCombo.itemHeight = 30;

	// SET CSS
	this.dbsnpCombo.popupClass = "workflow workflows dijitReset dijitMenu";
	this.dbsnpCombo.wrapperClass = "workflows dijitPopup";
	this.dbsnpCombo.itemHeight = 30;
},


//	POPULATE COMBOBOX AND SET SELECTED ITEM
setProjectCombo : function (project, workflow) {
	console.log("SNP.setProjectCombo    plugins.report.SNP.setProjectCombo(project,workflow)");
	//console.log("SNP.setProjectCombo    Passed project: " + project);
	//console.log("SNP.setProjectCombo    Passed workflow: " + workflow);
	//console.log("SNP.setProjectCombo    Agua: " + Agua);
	//console.dir(Agua);

	var projectNames = Agua.getProjectNames();
	console.log("SNP.setProjectCombo    Checked projectNames: " + dojo.toJson(projectNames));

	// RETURN IF projects NOT DEFINED
	if ( ! projectNames )
	{
		console.log("SNP.setProjectCombo    projectNames not defined. Returning.");
		return;
	}

	// SET PROJECT IF NOT DEFINED TO FIRST ENTRY IN projects
	if ( project != null || ! project)
	{
		project = projectNames[0];
	}

	// SET CSS
	this.projectCombo.popupClass = "report SNP dijitReset dijitMenu";
	this.projectCombo.wrapperClass = "SNP dijitPopup";
	this.projectCombo.itemHeight = 30;
	
	// SET this.project JUST IN CASE
	this.project = project;
	//console.log("SNP.setProjectCombo    this.project: " + this.project);
	
	// DO data FOR store
	var data = {identifier: "name", items: []};
	for ( var i in projectNames )
	{
		data.items[i] = { name: projectNames[i]	};
	}
	//console.log("SNP.setProjectCombo    store data: " + dojo.toJson(data));

	// CREATE store
	var store = new dojo.data.ItemFileReadStore( {	data: data	} );

	//// GET PROJECT COMBO WIDGET
	if ( this.projectCombo == null )
	{
		console.log("SNP.setProjectCombo    this.projectCombo is null. Returning.");
		return;
	}
	
	//console.dir(this.projectCombo);
	console.log("SNP.setProjectCombo    this.projectCombo: " + this.projectCombo);
	
	this.projectCombo.store = store;	
	
	// START UP AND SET VALUE
	this.projectCombo.startup();
	this.projectCombo.setValue(projectNames[0]);			
	console.log("SNP.setProjectCombo    this.projectCombo: " + this.projectCombo);

	// TO DO:
	// ADD ONKEYPRESS INSIDE COMBO INPUT
	// TO CREATE NEW PROJECTS

	// DOJO.CONNECT TO CHANGE THE this.workflowCombo
	var snpReport = this;
	dojo.connect(this.projectCombo, "onChange", function(event) {
		console.log("SNP.setProjectCombo    dojo.connect event: " + event);
		snpReport.project = event;
		snpReport.setWorkflowCombo(event);
	});

	// RESET THE WORKFLOW COMBO
	this.setWorkflowCombo(project, workflow);
},


// SET THE workflow COMBOBOX
setWorkflowCombo : function (project, workflow) {
	console.log("SNP.setWorkflowCombo    plugins.workflow.SNP.setWorkflowCombo(project, workflow)");

	if ( project == null || ! project )
	{
		console.log("SNP.setWorkflowCombo    Project not defined. Returning.");
		return;
	}
	console.log("SNP.setWorkflowCombo    project: " + project);
	console.log("SNP.setWorkflowCombo    workflow: " + workflow);

	// SET CSS
	this.workflowCombo.popupClass = "report SNP dijitReset dijitMenu";
	this.workflowCombo.wrapperClass = "SNP dijitPopup";
	this.workflowCombo.itemHeight = 30;


	var workflows = Agua.getWorkflowNamesByProject(project);
	console.log("SNP.setWorkflowCombo    project " + project + " workflows: " + dojo.toJson(workflows));
	
	// RETURN IF workflows NOT DEFINED
	if ( ! workflows )
	{
		console.log("SNP.setWorkflowCombo    workflows not defined. Returning.");
		return;
	}		

	// SET workflow IF NOT DEFINED TO FIRST ENTRY IN workflows
	if ( workflow == null || ! workflow)
	{
		workflow = workflows[0];
	}

	// SET this.workflow JUST IN CASE
	this.workflow = workflow;

	//console.log("SNP.setWorkflowCombo    this.workflow: " + this.workflow);
	
	// DO data FOR store
	var data = {identifier: "name", items: []};
	for ( var i in workflows )
	{
		data.items[i] = { name: workflows[i]	};
	}
	//console.log("SNP.setWorkflowCombo    data: " + dojo.toJson(data));

	// CREATE store
	var store = new dojo.data.ItemFileReadStore( { data: data } );

	// GET WORKFLOW COMBO
	if ( this.workflowCombo == null )
	{
		console.log("SNP.setthis.workflowCombo    this.workflowCombo is null. Returning.");
		return;
	}

	console.log("SNP.setWorkflowCombo    this.workflowCombo: " + this.workflowCombo);
	this.workflowCombo.store = store;


	// GET USER INPUT WORKFLOW
	var snpReport = this;

	// SET CLASS
	//this.workflowCombo.attr('class', 'workflowWorkflowCombo');


	// START UP COMBO (?? NEEDED ??)
	this.workflowCombo.startup();
	this.workflowCombo.setValue(workflow);			
	console.log("SNP.setWorkflowCombo    this.workflowCombo: " + this.workflowCombo);

	// DOJO.CONNECT TO CHANGE THE DROP TARGET
	var snpReport = this;
	dojo.connect(this.workflowCombo, "onChange", function(event) {
		
		// SET this.workflow
		console.log("SNP.setWorkflowCombo    dojo.connect event: " + event);
		snpReport.workflow = event;
		
		// POPULATE APPLICATIONS LIST IN DROP TARGET AND INFO PANE DATA ON FIRST APPLICATION
		console.log("SNP.setWorkflowCombo    dojo.connect event    BEFORE var workflowApplications = snpReport.getWorkflowApplications()");
		//var workflowApplications = snpReport.getWorkflowApplications();
	});
	
	
	this.setReportCombo(project, workflow);
},



// SET THE report COMBOBOX
setReportCombo : function (project, workflow, report) {
	console.log("SNP.setReportCombo    plugins.report.SNP.setReportCombo(project, report)");

	if ( project == null || ! project )
	{
		console.log("SNP.setReportCombo    Project not defined. Returning.");
		return;
	}
	console.log("SNP.setReportCombo    project: " + project);
	console.log("SNP.setReportCombo    report: " + report);

	var reports = Agua.getReportsByWorkflow(project, workflow);
	console.log("SNP.setReportCombo    project " + project + " reports: " + dojo.toJson(reports));
	
	// RETURN IF reports NOT DEFINED
	if ( ! reports || reports.length == 0 )
	{
		console.log("SNP.setReportCombo    reports not defined. Creating default report.");
		Agua.addReport(
		{
			project: project,
			workflow: workflow,
			name: "Report1"
		});
		reports = Agua.getReportsByWorkflow(project, workflow);
	}		
	console.log("SNP.setReportCombo    reports: " + dojo.toJson(reports));
	var reportNames = this.hasharrayKeyToArray(reports, "name");
	if ( ! reportNames | reportNames == null )
	{
		console.log("SNP.setReportCombo    *** reportNames not defined ***. Returning");
		return;
	}

	
	// SET report IF NOT DEFINED TO FIRST ENTRY IN reportNames
	if ( report == null || ! report)
	{
		report = reportNames[0];
	}

	// SET this.report JUST IN CASE
	this.report = report;

	console.log("SNP.setReportCombo    this.report: " + this.report);
	
	// DO data FOR store
	var data = {identifier: "name", items: []};
	for ( var i in reportNames )
	{
		data.items[i] = { name: reportNames[i]	};
	}
	console.log("SNP.setReportCombo    data: " + dojo.toJson(data));

	// CREATE store
	// http://docs.dojocampus.org/dojo/data/ItemFileWriteStore
	var store = new dojo.data.ItemFileReadStore( { data: data } );

	// GET WORKFLOW COMBO
	if ( this.reportCombo == null )
	{
		console.log("SNP.setthis.reportCombo    this.reportCombo is null. Returning.");
		return;
	}

	console.log("SNP.setReportCombo    this.reportCombo: " + this.reportCombo);
	this.reportCombo.store = store;

	// GET USER INPUT WORKFLOW
	var snpReport = this;

	// START UP COMBO (?? NEEDED ??)
	this.reportCombo.startup();
	this.reportCombo.setValue(report);			

	// DOJO.CONNECT TO CHANGE THE DROP TARGET
	var snpReport = this;
	dojo.connect(this.reportCombo, "onChange", function(event) {
		
		// SET this.report
		console.log("SNP.setReportCombo    dojo.connect event: " + event);
		snpReport.report = event;
		
		// POPULATE APPLICATIONS LIST IN DROP TARGET AND INFO PANE DATA ON FIRST APPLICATION
		console.log("SNP.setReportCombo    dojo.connect event    BEFORE var reportApplications = snpReport.getReportApplications()");
		//var reportApplications = snpReport.getReportApplications();
	});
},


// SET DELETE REPORT AND FILE BROWSE BUTTONS
setButtons : function () {
	// DELETE REPORT BUTTON
	dojo.connect(this.deleteReportButton, "onclick", this, dojo.hitch( this, function(event)
		{
			this.deleteReport();
		}
	));
	
	// CONNECT ONCLICK
	dojo.connect(this.fileBrowse, "onclick", dojo.hitch(this, function(event)
	{
		this.openFileBrowse(event);
	}));
},
//	SET FILE UPLOAD BUTTON
setFileUpload : function () {
	console.log("SNP.setFileUpload    plugins.report.SNP.setFileUpload");

	// DESTROY IF EXISTS ALREADY
	if ( this.fileUploadObject != null )
	{
		console.log("SNP.setFileUpload    this.fileUploadObject != null");
		console.dir(this.fileUploadObject);
		
		//this.fileUploadObject.destroyRecursive();

		console.log("SNP.setFileUpload    AFTER destroy");
	}
	
	// SET NODE WHOSE VALUE WILL CHANGE TO THE UPLOADED FILE NAME
	var inputNode = this.fileInput;
	console.log("SNP.openFileUpload     inputNode: " + inputNode);
	
	// SET NODE WHOSE VALUE WILL CHANGE TO THE UPLOADED FILE NAME
	var buttonNode = this.fileUpload;
	console.log("SNP.openFileUpload     buttonNode: " + buttonNode);

	// SET THE PATH AS THE WORKFLOW FOLDER		
	var project = this.projectCombo.getValue();
	var workflow = this.workflowCombo.getValue();
	var path = project + "/" + workflow;
	console.log("SNP.openFileUpload     path: " + path);
		
	// SET HIDDEN VALUES TO GENERATE HIDDEN NODES IN FORM
	var hiddenValues = {
		username: Agua.cookie('username'),
		sessionId : Agua.cookie('sessionId'),
		path: path
	};		

	// SET CALLBACK
	var oldFilepath = this.fileInput.value;
	console.log("SNP.openFileUpload     oldFilePath: " + oldFilepath);

	var uploadUrl = Agua.cgiUrl + "upload.cgi";
	var callback = dojo.hitch(this, function(newValue)
		{				
			this.onUploadComplete(inputNode, oldFilepath, newValue);
		}
	);
	//console.log("SNP.openFileUpload     callback: " + callback);


	this.fileUploadObject = new plugins.form.UploadDialog(
		{
			path: path,
			inputNode: inputNode,
			buttonNode: buttonNode,
			url : uploadUrl,
			callback : callback,
			hiddenValues : hiddenValues
		}
	);
	console.log("SNP.openFileUpload     this.fileUploadObject: " + this.fileUploadObject);
},


onUploadComplete : function (inputNode, oldValue, newValue) {
	console.log("SNP.onUploadComplete     plugins.report.SNP.onUploadComplete(inputNode, oldFilePath, newValue)");
	console.log("SNP.onUploadComplete     inputNode: " + inputNode);
	console.log("SNP.onUploadComplete     oldValue: " + oldValue);
	console.log("SNP.onUploadComplete     newValue: " + newValue);
	
	if ( newValue )
	{
		var filename = newValue.match( /([^\/]+)$/ )[1];
		
		var project = this.projectCombo.getValue();
		var workflow = this.workflowCombo.getValue();
		this.fileInput.value = project + "/" + workflow + "/" + filename;	
	}
	
	this.setFileUpload();
	
},







setOkButton : function(node, name) {
	console.log("SNP.okButton    plugins.report.SNP.okButton()");
	
	dojo.connect(this.okButton, "onclick", this, dojo.hitch( this, function(event)
		{
			// DO FILTER REPORT
			this.filterReport();
		}
	));

},


// species dijit.form.ComboBox
setSpeciesCombo : function () {
	console.log("SNP.setSpeciesCombo    plugins.report.SNP.setSpeciesCombo()");

	// SET ONCHANGE TO UPDATE CHROMOSOME COMBOBOX IF CHANGED
	var snp = this;
	this.speciesCombo.onChange = function(e)
	{
		var species = e;
		snp.chromosomeSelect(species);
	}
	
	this.chromosomeSelect("Human");
},

// SET THE CORRECT CHROMOSOMES FOR THE SPECIES IN THE chromosome COMBOBOX
// http://en.wikipedia.org/wiki/List_of_number_of_chromosomes_of_various_organisms
chromosomeSelect : function (species) {
	console.log("SNP.chromosomeSelect    plugins.report.SNP.SNP.chromosomeSelect(species)");

	var speciesChromosomes = new Object;
	speciesChromosomes["Human"] = [ "chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chr20", "chr21", "chr22", "chrX", "chrY" ]; 
	speciesChromosomes["Mouse"] = [ "chr1", "chr2", "chr3", "chr4", "chr5", "chr6", "chr7", "chr8", "chr9", "chr10", "chr11", "chr12", "chr13", "chr14", "chr15", "chr16", "chr17", "chr18", "chr19", "chrX", "chrY" ];
	
	// GET CHROMOSOMES FOR SPECIES
	var chromosomes = speciesChromosomes[species];
	
	// POPULATE chromosome SELECT BOX WITH CHROMOSOMES FOR THIS SPECIES
	console.log("SNP.chromosomeSelect    this.chromosomeCombo: " + this.chromosomeCombo);
	
	// DO data FOR store
	var dataObject = {identifier: "name", items: []};
	for ( var i in chromosomes )
	{
		dataObject.items[i] = { name: chromosomes[i]	};
	}

	// CREATE store
	var storeObject = new dojo.data.ItemFileReadStore(	{	data: dataObject	} );
	
	// REFRESH ComboBox
	this.chromosomeCombo.store = storeObject;
	this.chromosomeCombo.startup();
	this.chromosomeCombo.setValue(chromosomes[0]);			
},

// CONNECT LISTENER TO UPDATE variantInput WHEN variantSlider CHANGES
setVariantSlider : function () {
	console.log("SNP.setVariantSlider     plugins.report.SNP.setVariantSlider(widget, name)");

	// ADD CLASS
	dojo.addClass(this.variantSlider.domNode, 'variant');
	
	// ONCHANGE
	dojo.connect(this.variantSlider, "onChange", dojo.hitch(this, function(e)
	{
		//dojo.byId(this.elementObjects['variantInput'].id).value = dojo.number.format(widget.attr('value')/100,{places:0,pattern:'#%'});
		this.variantInput.value = dojo.number.format(this.variantSlider.attr('value')/100,{places:0,pattern:'#%'});
	}));

	// ONMOUSEUP
	dojo.connect(this.variantSlider, "onMouseUp", dojo.hitch(this, function(e)
	{
		this.filterReport();
	}));

},

// INITIALISE SPINNER ON depthNode
setDepthSpinner : function () {
	this.depthNode.id = '';
	this.depthSpinner = new dijit.form.NumberSpinner(
		{ value: 10,
			constraints: {min: 1, max:1000, places:0},
			size : 1
		},
		this.depthNode
	);
	
	this.depthSpinner.domNode.setAttribute('style', "width: 50px;");
},

// SET CHECKBOXES TO DISABLE/ENABLE THEIR RELATED ELEMENTS
setCheckboxes : function () {
	console.log("SNP.setCheckboxes    plugins.report.SNP.setCheckboxes(widget, name)");

	var checkboxes = ["chromosomeCheckbox", "variantCheckbox", "depthCheckbox", "senseCheckbox", "exonicCheckbox", "dbsnp"];
	var targets = ["chromosomeCombo", "variantInput", "depthSpinner", "senseCombo", "exonicCombo", "dbsnpCombo"];	

	dojo.connect(this.chromosomeCheckbox, 'onClick', dojo.hitch(this, function ()
	{
		this.chromosomeCombo.attr('disabled', !this.chromosomeCombo.attr('disabled'));
	}));
	dojo.connect(this.variantCheckbox, 'onClick', dojo.hitch(this, function ()
	{
		// <input ... disabled="disabled">
		var disabled = this.variantInput.getAttribute('disabled');
		if ( disabled == null ) disabled = "disabled";
		else disabled = false;
		this.variantInput.disabled = disabled;
	}));
	dojo.connect(this.depthCheckbox, 'onClick', dojo.hitch(this, function ()
	{
		this.depthSpinner.attr('disabled', !this.depthSpinner.attr('disabled'));
	}));
	dojo.connect(this.senseCheckbox, 'onClick', dojo.hitch(this, function ()
	{
		this.senseCombo.attr('disabled', !this.senseCombo.attr('disabled'));
	}));
	dojo.connect(this.exonicCheckbox, 'onClick', dojo.hitch(this, function ()
	{
		this.exonicCombo.attr('disabled', !this.exonicCombo.attr('disabled'));
	}));
	dojo.connect(this.dbsnpCheckbox, 'onClick', dojo.hitch(this, function ()
	{
		this.dbsnpCombo.attr('disabled', !this.dbsnpCombo.attr('disabled'));
	}));

	// NB: THIS DOESN'T WORK
	////for ( var i = 0; i < checkboxes.length; i++ )
	//dojo.forEach(targets), function(target, i)
	//{
	//	//console.log("SNP.setCheckboxes    checkbox " + checkbox + " clicked. Enabling/disabling " + targets[i]);
	//	//console.log("SNP.setCheckboxes    checkbox " + checkboxes[i] + " clicked. Enabling/disabling " + targets[i]);
	//	console.log("SNP.setCheckboxes    checkbox " + checkboxes[i] + " clicked. Enabling/disabling " + target);
	//
	//	dojo.connect(this[checkboxes[i]], 'onclick', dojo.hitch(this, function ()
	//	//dojo.connect(this[checkbox], 'onclick', dojo.hitch(this, function ()
	//	{
	//		//this[targets[i]].attr('disabled', !this[targets[i]].attr('disabled'));
	//		this[target].attr('disabled', !this[target].attr('disabled'));
	//	}));
	//}
	//
},


// GET THE VALUE FOR AN OBJECT OF THE GIVEN TYPE	
getValueType : function (object, type) {
	//console.log("SNP.getValueType     plugins.report.Common.getValueType()");
	if ( object == null )	return;
	if ( type == null )	return;
	//console.log("SNP.getValueType     object: " + object);
	//console.log("SNP.getValueType     type: " + type);
	
	var getSetter = this.valueFunction(type);
	//console.log("SNP.getValueType     getSetter: " + getSetter.toString());
	if ( getSetter == null )
	{
		console.log("SNP.getValueType     No value function for this type: " + type);
		return;
	}
	
	object.valueFunction = getSetter;
	return object.valueFunction();
},


// SET THE VALUE FOR AN OBJECT OF A GIVEN TYPE
setValueType : function (object, type, value) {
	//console.log("SNP.setValueType     plugins.report.Common.setValueType()");
	//console.log("SNP.setValueType     object: " + object);
	//console.log("SNP.setValueType     type: " + type);
	//console.log("SNP.setValueType     value: " + value);

	var getSetter = this.valueFunction(type);
	if ( getSetter == null )
	{
		console.log("SNP.setValueType     No value function for this type: " + type);
		return;
	}
	
	object.valueFunction = getSetter;
	return object.valueFunction(value);
},


// valueFunction
//
// PROVIDE THE GET/SET FUNCTION FOR AN OBJECT OF THE SPECIFIED TYPE
valueFunction : function (type) {
	//console.log("SNP.valueFunction     plugins.report.SNP.valueFunction(type)");
	//console.log("SNP.valueFunction     type: " + type);
	
	// SET VALUE FUNCTION FOR saveReport LATER
	switch (type)
	{
		case "combobox" : case "editor" : case "checkbox" :
			//console.log("SNP.valueFunction     returning combobox, editor or checkbox value function");
			
			return function(value) {
				if ( value )
				{
					return this.setValue(value);
				}
				else
				{
					var returnValue = this.getValue();
					//console.log("SNP.valueFunction     returnValue: " + returnValue);
					if ( returnValue != null && returnValue != '' )
					{
						returnValue = returnValue.replace(/"/g, "'");
					}
					return returnValue;
				}
			};
			
		case "null" :
			return function(value) { return null; };
			
		case "radio" : return function(value) {
			return value ? this.checked = value : this.checked;
		};
			
		case "input" : return function(value) {
			return value ? this.value = value : this.value;
		};
		
		case "div" : return function(value) {
			return value ? this.innerHTML = value : this.innerHTML;
		};
		case "spinner" : return function(value) {
			return value ? this.attr('value', value) :
			dojo.number.format(this.attr('value'),{places:2}) ;
		};
	}

	return 0;
}


}); // plugins.report.SNP
