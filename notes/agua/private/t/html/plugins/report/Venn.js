dojo.provide("private.plugins.report.Venn");

// PURPOSE: CREATE VENN DIAGRAM FROM TWO INPUTS

dojo.require("dijit._Widget");
dojo.require("dijit._Templated");

dojo.declare("private.plugins.report.Venn",
	[ dijit._Widget, dijit._Templated ], {

description : "Create Venn diagram from two inputs",

//Path to the template of this widget. 
templatePath: dojo.moduleUrl("private", "plugins/report/templates/venn.html"),

// Calls dijit._Templated.widgetsInTemplate
widgetsInTemplate : true,

// CSS FILE FOR BUTTON STYLING
cssFiles : [
	//dojo.moduleUrl("plugins") + "workflow/css/controller.css",
	//dojo.moduleUrl("plugins") + "workflow/css/workflow.css"
],

////////}}}

constructor : function(args) {
	console.log("Venn.constructor()");

	// LOAD CSS FOR BUTTON
	//this.loadCSS();
},

postCreate : function() {
	console.log("Venn.postCreate()");
	this.startup();
},

startup : function () {
	console.log("Venn.startup    plugins.report.Venn.startup()");

	this.inherited(arguments);

	this.doVenn();
},

doVenn : function () {
	console.log("Venn.doVenn    plugins.report.Venn.doVenn()");
	console.log("this.groupA:");
	console.dir({this_groupA:this.groupA});
	
	var arrayA = this.getTextboxLines(this.groupA);
	var arrayB = this.getTextboxLines(this.groupB);

	this.groupACount.innerHTML = arrayA.length;
	this.groupBCount.innerHTML = arrayB.length;

	arrayA.sort();
	arrayB.sort();
	
	
	this.setTextboxValue(this.groupA, arrayA.join("\n"));
	this.setTextboxValue(this.groupB, arrayB.join("\n"));
	
	// GET JOIN AND onlyA/onlyB	
	var join = [];
	for ( i = 0; i < arrayA.length; i++ ) {
		for ( j = 0; j < arrayB.length; j++ ) {
			if ( arrayA[i] == arrayB[j] ) {
				join.push(arrayA[i]);
				arrayA.splice(i, 1);
				i--;
				arrayB.splice(j, 1);
				j--;
			}
		}
	}

	this.onlyACount.innerHTML = arrayA.length;
	this.onlyBCount.innerHTML = arrayB.length;
	this.joinCount.innerHTML = join.length;

	this.setTextboxValue(this.onlyA, arrayA.join("\n"));
	this.setTextboxValue(this.join, join.join("\n"));
	this.setTextboxValue(this.onlyB, arrayB.join("\n"));
	
	
},

setTextboxValue : function (textbox, value) {
	console.log("Venn.setTextboxvalue    value:");
	console.dir({value:value});
	
	textbox.value = value;	
},

getTextboxLines : function (textbox) {
	//console.log("groupA" + groupA);
	var value = textbox.value;
	value = value.replace(/^\s+/, '');
	value = value.replace(/\s+$/, '');

	var arrayA = value.split("\n");
	console.log("arrayA" + arrayA);
	console.dir({arrayA:arrayA});
	
	return arrayA;
}



}); // end of Controller

dojo.addOnLoad( function() {
		
});