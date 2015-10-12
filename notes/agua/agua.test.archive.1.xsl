agua.test.archive.1

<entry [Sun 2011:07:17 04:22:14 EST] PROJECTS TAB fileMenu RENAME FILE>
    
/var/www/cgi-bin/agua/0.6/project.cgi "mode=renameFile&sessionId=9999999999.9999.999&username=aguatest&oldpath=Project1/Workflow1/uploads/oldFilename&newpath=Project1/Workflow1/uploads/TEST"

    OK

</entry>

<entry [Thu 2011:07:14 17:06:24 EST] CREATE/DELETE/RENAME FOLDERS>

SUBROUTINE     renameFile

PURPOSE
    
    1. RENAME A FILE OR DIRECTORY IN THE USERS' HOME DIRECTORY
   
    2. A DIRECTORY MAY BE A WORKFLOW, IN WHICH CASE renameWorkflow
    
        WILL BE CALLED AFTER THIS CALL TO renameFile
		
cd c:\data\base\cgi-bin\agua

perl project.cgi "mode=renameFile&sessionId=1228791394.7868.158&username=syoung&oldpath=Project1/Workflow1&newpath=Project1/WorkflowA"


=head2

    SUBROUTINE     getFolders
    
    PURPOSE
        
        1. Return a list of getFolders for the user
        
        2. Each project has permissions
       
cd c:\data\base\cgi-bin\agua

perl project.cgi "mode=getFolders&sessionId=1228791394.7868.158&username=syoung"
		
=cut


</entry>
<entry [Tue 2011:07:12 13:42:57 EST] WORKFLOW FILEMANAGER copyFile>
 

COPY FROM SHARED SOURCES TO PROJECTS:

http://localhost/cgi-bin/agua/0.6/project.cgi?mode=copyFile&sessionId=9999999999.9999.999&username=syoung&file=/data/sequence/1000genomes/NA18507/yoruba1-1.reads_1.1M.sequence.txt&destination=Project2/Workflow2&groupname=admin&location=/data/sequence/1000genome if $DEBUG;


GET http://localhost/cgi-bin/agua/0.6/project.cgi?mode=copyFile&sessionId=9999999999.9999.999&username=syoung&file=/testfile.txt&destination=rnaSeq/Workflow3X
	

{ status: 'initiated'  }

GET http://localhost/cgi-bin/agua/0.6/project.cgi?mode=copyFile&sessionId=9999999999.9999.999&username=syoung&file=/testfile.txt&destination=rnaSeq/Workflow3X&modifier=status
	

{ status: 'completed'  }

GET http://localhost/cgi-bin/agua/0.6/project.cgi?mode=fileSystem&username=syoung&sessionId=9999999999.9999.999&query=%22rnaSeq%2FWorkflow3X%22&dojo.preventCache=1310492036748
/*{'name':'Workflow3X','path':'rnaSeq/Workflow3X','total':'2','items':[{'name':'test.txt','path':'test.txt','parentPath':'rnaSeq/Workflow3X','parentDir':'rnaSeq/Workflow3X','directory':false,'size':'6','modified':1310345325,'sample':'teste&nbsp;','bytes':'200'},{'name':'testfile.txt','path':'testfile.txt','parentPath':'rnaSeq/Workflow3X','parentDir':'rnaSeq/Workflow3X','directory':false,'size':'10','modified':1310492040,'sample':'test&nbsp;file&nbsp;','bytes':'200'}]}*/



    
</entry>
<entry [Sat 2011:07:09 21:26:13 EST] WORKFLOW executeWorkflow, saveWorkflow, runStatus>
runWorkflow

perl workflow.cgi < workflow-runWorkflow.json
{
    'sessionId' : '1228791394.7868.158',
    'username' : 'admin',
    'project' : 'Project1',
    'workflow' : 'Workflow3-indels',
    'mode' : 'runWorkflow',
    'start' : 0
}

executeWorkflow

perl ./workflow.cgi < workflow-executeWorkflow.json

"sessionId=1228791394.7868.158&username=admin&project=Project1&workflow=Workflow3-indels&mode=executeWorkflow&start=0"


saveWorkflow

perl workflow.cgi < workflow-saveWorkflow.json

"sessionId=1228791394.7868.158&username=admin&mode=saveWorkflow&project=Project1&workflow=Workflow3-indels"


runStatus

perl workflow.cgi < workflow-runStatus.json
print "\n";
"sessionId=1228791394.7868.158&username=admin&mode=runStatus&project=Project1&workflow=Workflow3-indels"


workflowApplications

perl workflow.cgi < workflow-workflowApplications.json

"sessionId=1228791394.7868.158&username=admin&mode=workflowApplications&project=Project1&workflow=Workflow3-indels"

"sessionId=1228791394.7868.158&username=admin&mode=workflowApplications&workflow=Workflow3-indels&project=Project1"


    
</entry>
<entry [Fri 2011:07:08 07:01:54 EST] CHAIN KEYPRESS IN ADMIN TAB PANELS>

console.clear();
var admin = Agua.controllers["admin"].tabPanes[0];
//console.dir(admin);
var project = admin.paneWidgets["plugins.admin.Projects"];
project;
console.dir(project.description);
var description = project.description;

var textarea = description.scrollTop = 0;

OK!!
    
</entry>
<entry [Wed 2011:07:06 03:27:34 EST] WORKFLOW TAB - UPDATE STAGE PARAMETER (Agua::Common::Parameter::addParameter)>

echo '{"project":"Project1","args":"","inputParams":"","argument":"--pairparams","appname":"ELAND","paramtype":"input","category":"pairparams","owner":"admin","workflownumber":"0","value":"","name":"pairparams","appnumber":"2","chained":0,"discretion":"optional","description":"Paired read analysis parameters to pass to pickBestPair. Default: '--circular' (treats all chromosomes as circular).","username":"admin","workflow":"Workflow1","format":"","valuetype":"string","paramFunction":"","valueNode":"","descriptionNode":"Paired read analysis parameters to pass to pickBestPair. Default: '--circular''''' (treats all chromosomes as circular). ''&lt;&gt;","sessionId":"9999999999.9999.999","mode":"addStageParameter","isValid":true}' | ./workflow.cgi
Content-type: text/html

Agua::Common::Parameter::addStageParameter    Common::addStageParameter()
Agua::Common::Parameter::addStageParameter    json:
$VAR1 = {
          'mode' => 'addStageParameter',
          'descriptionNode' => 'Paired read analysis parameters to pass to pickBestPair. Default: --circular (treats all chromosomes as circular). &lt;&gt;',
          'valueNode' => '',
          'project' => 'Project1',
          'isValid' => bless( do{\(my $o = 1)}, 'JSON::XS::Boolean' ),
          'args' => '',
          'inputParams' => '',
          'argument' => '--pairparams',
          'appname' => 'ELAND',
          'sessionId' => '9999999999.9999.999',
          'paramtype' => 'input',
          'category' => 'pairparams',
          'owner' => 'admin',
          'workflownumber' => '0',
          'value' => '',
          'name' => 'pairparams',
          'appnumber' => '2',
          'chained' => 0,
          'discretion' => 'optional',
          'description' => 'Paired read analysis parameters to pass to pickBestPair. Default: --circular (treats all chromosomes as circular).',
          'username' => 'admin',
          'workflow' => 'Workflow1',
          'format' => '',
          'valuetype' => 'string',
          'paramFunction' => ''
        };
Agua::Common::Parameter::addStageParameter    Doing _removeFromTable(table, json, required_fields)
Agua::Common::Parameter::addStageParameter    Doing addToTable(table, json, required_fields)
Agua::Common::Base::_addToTable    Common::_addToTable(table, hash, required_fields, inserted_fields)
Agua::Common::Base::_addToTable    INSERT INTO stageparameter (username,owner,project,workflow,workflownumber,appname,appnumber,name,paramtype,category,valuetype,argument,value,discretion,format,description,args,inputParams,paramFunction,chained)
VALUES ('admin','admin','Project1','Workflow1','0','ELAND','2','pairparams','input','pairparams','string','--pairparams','','optional','','Paired read analysis parameters to pass to pickBestPair. Default: --circular (treats all chromosomes as circular).','','','','0')
Agua::Common::Base::_addToTable    result: 1
{ status: 'Updated stage parameter: pairparams' }
    
</entry>
<entry [Tue 2011:07:05 18:05:42 EST] WORKFLOW TAB Stages PANEL workflowCombo>

var stages = Agua.widgets["workflow"][0].core.stages;
stages;
var workflowCombo = stages.workflowCombo;
workflowCombo;
var workflowName = workflowCombo.get('value');
workflowName;
workflowName = workflowName.replace(/\s+/g, '');
workflowName;
    
</entry>
<entry [Mon 2011:07:04 01:57:08 EST] ADMIN TAB USERS PANEL>

TESTING THESE METHODS:

Agua._removeUser : function (userObject) {
Agua.removeUserFromGroups : function (userObject) {
Common._removeObjectsFromArray : function (hasharray, object, keys) {


RUN TEST:


removeUserFromGroups
--------------------
console.log("Agua.groupmembers.length: " + Agua.groupmembers.length)
Agua.removeUserFromGroups(userObject);
console.log("Agua.groupmembers.length: " + Agua.groupmembers.length)

    OK
    
    Agua.groupmembers.length: 8
    Agua.removeUserFromGroups plugins.core.Agua.removeUserFromGroups
    Agua.groupmembers.length: 7


_removeObjectsFromArray
----------------------

var keys = ["owner"];
console.log("hasharray.length: " + hasharray.length)
hasharray = Agua._removeObjectsFromArray(hasharray, userObject, keys);
console.log("hasharray.length: " + hasharray.length)

keys = ["name", "type"];
hasharray = Agua._removeObjectsFromArray(hasharray, userObject, keys);
console.log("hasharray.length: " + hasharray.length)

    OK
    
    hasharray.length: 8
    hasharray.length: 6
    hasharray.length: 5



var userObject = {
    "username"    :   "testuser",
    "firstname"   :   "admin",
    "lastname"    :   "admin",
    "email"       :   "",
    "description" :   "",
    "type"        :   "user",
    "name"        :   "testuser",
    "owner"        :   "testuser"
};

//Agua.groupmembers = [
var hasharray = [
   {
      "groupdesc" : "",
      "owner" : "syoung",
      "location" : "",
      "groupname" : "admin",
      "name" : "",
      "type" : "project",
      "description" : ""
   },
   {
      "groupdesc" : "",
      "owner" : "syoung",
      "location" : "syoung@med.miami.edu",
      "groupname" : "admin",
      "name" : "testuser",
      "type" : "user",
      "description" : "Stuart  Young"
   },
   {
      "groupdesc" : "",
      "owner" : "syoung",
      "location" : "syoung@med.miami.edu",
      "groupname" : "admin",
      "name" : "admin",
      "type" : "user",
      "description" : "Stuart  Young"
   },
   {
      "groupdesc" : "",
      "owner" : "syoung",
      "location" : "/agua/data/sequence/demo",
      "groupname" : "admin",
      "name" : "Demo",
      "type" : "source",
      "description" : "shared Solexa sequences"
   },
   {
      "groupdesc" : "",
      "owner" : "syoung",
      "location" : "Project1",
      "groupname" : "admin",
      "name" : "Project1",
      "type" : "project",
      "description" : "Transcriptome"
   },
   {
      "groupdesc" : "",
      "owner" : "syoung",
      "location" : "Project2",
      "groupname" : "admin",
      "name" : "Project2",
      "type" : "project",
      "description" : "MAQ and ERANGE"
   },


   {
      "groupdesc" : "",
      "owner" : "testuser",
      "location" : "Project2",
      "groupname" : "myProjects",
      "name" : "Project1",
      "type" : "project",
      "description" : "MAQ and ERANGE"
   },
   {
      "groupdesc" : "",
      "owner" : "testuser",
      "location" : "Project2",
      "groupname" : "myProjects",
      "name" : "Project2",
      "type" : "project",
      "description" : "MAQ and ERANGE"
   }
];






_addArrayToArray : function (twoDArray, array, requiredKeys) {

Agua.addUser()

var itemObject = {"username":"aabate","sessionId":"9999999999.9999.999","firstname":"adolfaaaa","lastname":"abate","email":"aabate@med.miami.edu","password":"reset-password"}

Agua.users = [["aabate","adolfo","abate","aabate@med.miami.edu",""],["admin","stuart","young","stuartpyoung@gmail.com",""],["agua","agua","","syoung@med.miami.edu",""],["aguatest","aguatest","aguatest","dummy@email.com","test user"]]

Agua.removeUser(itemObject);

    
</entry>
<entry [Sat 2011:07:02 03:53:05 EST] ADMIN TAB CLUSTERS PANEL>

var admin = Agua.widgets["admin"][0];
var clusters = admin.paneWidgets["plugins.admin.Clusters"];
clusters.cluster;
//console.dir(clusters.cluster);
dojo.addClass(clusters.cluster.domNode, 'invalid');

    
</entry><entry [Thu 2011:06:30 06:28:22 EST] CHAINING EXAMPLES>

GET .sam FILE 
for ( var i =0; i < inputs.length; i++) {  if ( inputs[i].value.match(/\.sam/) return inputs[i].value.match(/[^\/]+\.sam/)[1]; }


var admin = Agua.widgets["admin"][0];
console.log("admin: " + admin);
var panewidgets = admin.paneWidgets;
console.log("panewidgets: " + panewidgets);
var parameters = admin.paneWidgets["plugins.admin.Parameter"];


parameters.convertString("<", "textToHtml");
parameters.convertString(">", "textToHtml");
parameters.convertString("\\", "textToHtml");
parameters.convertString("&lt;", "htmlToText");
parameters.convertString("&gt;", "htmlToText");
parameters.convertString("\\\\//", "htmlToText");



    
</entry>
<entry [Thu 2011:06:30 03:24:08 EST] AVOID &lt; CONVERSION WHEN SETTING TEXTAREA IN ADMIN TAB Parameters PANEL>

var admin = Agua.widgets["admin"][0];
console.log("admin: " + admin);
var panewidgets = admin.paneWidgets;
console.log("panewidgets: " + panewidgets);
var parameters = admin.paneWidgets["plugins.admin.Parameter"];
console.log("parameters: " + parameters);
//console.dir(parameters);
var dragSource = parameters.dragSource;
console.log("dragSource: " + dragSource);
var nodes = dragSource.childNodes;
console.log("nodes: " + nodes);
var parameterrow = dijit.byNode(nodes[0].childNodes[0])
console.log("parameterrow: " + parameterrow);


    admin: [Widget plugins.admin.Admin, plugins_admin_Admin_0]
    panewidgets: [object Object]
    parameters: [Widget plugins.admin.Parameter, plugins_admin_Parameter_0]
    dragSource: [object HTMLDivElement]
    nodes: [object NodeList]
    parameterrow: [Widget plugins.admin.ParameterRow, plugins_admin_ParameterRow_1]



var paramFunction = parameterrow.paramFunction;
console.log(paramFunction.innerHTML);

// DESTROY EXISTING TEXT AREA
var textarea = paramFunction.firstChild;
console.log("textarea: " + textarea);
console.log("textarea.innerHTML: " + textarea.innerHTML);
console.log("textarea.value: " + textarea.value);
//dojo.destroy(textarea);


// CREATE NEW TEXT AREA
// CREATE INPUT TEXT AREA
var textarea = document.createElement('textarea');
dojo.addClass(textarea, 'editParameterRow');
paramFunction.appendChild(textarea);
textarea.value = "for ( var i =0; i < inputs.length; i++) {}";
textarea.focus();



// USE DOJO TEXTAREA (AUTO EXPANDS)
http://localhost/agua/0.6/dojo-1.6.1/dijit/tests/form/test_Textarea.html


//dojo.destroy(paramFunction.firstChild);


var textareaid = dijit.getUniqueId("parameterRow_textarea");
console.log("textareaid: " + textareaid);
var textarea = dojo.create('textarea');
dojo.attr(textarea, 'id', 'textareaid');
paramFunction.appendChild(textarea);

var dojotextarea = new dijit.form.Textarea({
    id: textareaid,
    name: "programmaticTextArea",
    cols: "60",
    value: "created programatically with custom border, padding, margin",
    style: { 
border:"5px solid gray", padding:"11px", margin:"7px"
    }
}, textareaid);


dojotextarea.onclick = function(event) {
    event.stopPropagation();
}



dojotextarea.set('value', "for ( var i =0; i < inputs.length; i++) {}");

Z-INDEX:
dojo.attr(dojotextarea, 'style', 'z-index: 999');

ONCLICK:
dojo.connect(dojotextarea, "onClick", function() {
console.log("dojotextarea clicked");
}


ROWS:
var textarea = paramFunction.firstChild;
dojo.attr(textarea, 'rows', 3);


GROW ROWS:

http://stackoverflow.com/questions/1760629/how-to-get-number-of-rows-in-textarea

function autogrow() {
  if (!this.clone) {
    this.clone = document.createElement('textarea');
    this.clone.rows = this.rows;
    this.clone.style.overflow = 'auto';
    this.clone.style.visibility = 'hidden';
    this.style.width = this.clone.style.width = this.scrollWidth + 'px';
    this.clone.style.position = 'absolute';
    this.parentNode.insertBefore(this.clone, null);
    this.rows += 1;
  }
  this.clone.value = this.value;
  while (this.clone.scrollWidth < this.scrollWidth) {
    this.rows += 1;
    this.clone.rows += 1;
  }
}

textarea.onkeyup = autogrow;


	//textarea.onkeyup = function () {
	//	if (!this.clone) {
	//		console.log("Parameter.editRow    creating this.clone");
	//		this.clone = document.createElement('textarea');
	//		this.clone.rows = this.rows;
	//		this.clone.style.overflow = 'auto';
	//		this.clone.style.visibility = 'hidden';
	//		this.style.width = this.clone.style.width = this.scrollWidth + 'px';
	//		this.clone.style.position = 'absolute';
	//		this.parentNode.insertBefore(this.clone, null);
	//		this.rows += 1;
	//	}
	//
	//	this.clone.value = this.value;
	//	while (this.clone.scrollWidth < this.scrollWidth) {
	//		console.log("Parameter.editRow    growing");
	//		this.rows += 1;
	//		this.clone.rows += 1;
	//	}
	//}
	



USE skipForm IN DND.SOURCE

http://dojotoolkit.org/reference-guide/dojo/dnd.html

I use dojo.dnd.Moveable for making DIVs drag-able & drop-able in the page (Something like iGoogle). But the problem is after making them moveable, all of input fields (like text-boxes and list-boxes) will be disable and I can not write any thing in text fields or select any item from list-boxes!

What should I do with that?

Tnx /Goli

dojo-dnd
link|improve this question
asked Aug 20 '10 at 9:59
Goli
1
1 Answeractiveoldestvotes
up vote
0
down vote
It fixed!

var m = new dojo.dnd.Moveable(gadget, {skip: true});

link|improve this answer
answered Aug 20 '10 at 13:45
Goli
1




BLOCK ONKEYPRESS:

"onkeypress", function(evt){
		//////console.log("Parameter.editParameterRow    node._onKeyPress(evt)");
		
		// summary: handles keyboard events
		var key = evt.charOrCode;
		evt.stopPropagation();
		//////console.log("Parameter.editParameterRow    textarea.onkeypress	key: " + key);



programmaticTextarea = new dijit.form.Textarea({
    id: "programmatic",
    name: "programmaticTextArea",
    cols: "60",
    value: "created programatically with custom border, padding, margin",
    style: {border:"5px solid gray", padding:"11px", margin:"7px"}
}, "programmatic");



ADD CSS:

		<style type="text/css"> 
			@import "../../themes/claro/document.css";
			@import "../css/dijitTests.css";
 
			br { margin-bottom: 4em; }
		</style> 
 
		<!-- required: the default dijit theme: --> 
		<link id="themeStyles" rel="stylesheet" href="../../../dijit/themes/claro/claro.css"/> 
  


// UNREGISTER DND DRAG WHILST EDITING TEXTAREA
???
dojo.dnd.dragManager.unregisterDragSource(paramFunction)



</entry>
<entry [Thu 2011:06:30 03:23:45 EST] WORKFLOW IO TEST>

var inputs = [ { "name": "outputfile", "value":"Project1/Workflow1/out.sam"}];
test = function() {
    for ( var i = 0; i < inputs.length; i++) 
    { 
        if ( inputs[i].value.match(/([^/]+.sam)$/) ) 
        { 
            return inputs[i].value.match(/([^/]+.sam)$/)[1]; 
        }
    }
}
console.log(test());
    
</entry>
<entry [Tue 2011:06:28 16:57:31 EST] ADD/REMOVE CLUSTER IN WORKFLOW STAGES>

NB: MUST USE this.maxNodes.get('value') INSTEAD OF this.maxNodes.value

// OK LOADS PARAMETER
var workflow = Agua.widgets["workflow"][0];
var stages = workflow.core.stages;
console.log("stages: " + stages);
var minNodes = stages.minNodes;
console.log("minNodes: " + minNodes);


SAVE CLUSTER
echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow0","cluster":"admin-nanocluster","mode":"saveClusterWorkflow"}' | /var/www/cgi-bin/agua/0.6/admin.cgi

UPDATE CLUSTER (NODES)
{"username":"admin","sessionId":"9999999999.9999.999","minnodes":1,"maxnodes":5,"cluster":"admin-nanocluster","mode":"updateCluster"}



</entry>
<entry [Mon 2011:06:27 00:09:53 EST] STARCLUSTER checkBalancer.pl>

/agua/0.6/bin/scripts/checkBalancers.pl

Agua::Common::Balancer::launchBalancer    pid: 32613
SELECT 1 FROM clusterstatus
WHERE username='syoung'
AND cluster='syoung-smallcluster'
Agua::Common::Balancer::launchBalancer    pid: 0
Agua::Common::Balancer::launchBalancer    Running child
Agua::Common::Balancer::launchBalancer    $$ pid: 32613
Agua::Common::Balancer::launchBalancer    Doing exec(cd /nethome/admin/.starcluster/plugins; /data/starcluster/0.92.rc1/bin/starcluster -c /nethome/admin/.starcluster/syoung-smallcluster.config bal syoung-smallcluster -m 5 -n 2 -i 30 -w 100 -s 30)
Agua::Common::Balancer::launchBalancer    Redirecting STDOUT and STDERR to outputfile: /nethome/admin/agua/.cluster/syoung-smallcluster-loadbalancer.out
Agua::Common::Balancer::launchBalancer    exists: 1
UPDATE clusterstatus
SET pid='32613',
polled=NOW(),
status='running'
WHERE username='syoung'
AND cluster='syoung-smallcluster'

Completed /agua/0.6/bin/scripts/checkBalancers.pl
Mon Jun 27 00:09:10 EDT 2011
    
</entry>
<entry [Fri 2011:06:17 17:59:00 EST] ADMIN Parameters PANEL>

DELETE PARAMETER

echo '{"username":"admin","sessionId":"9999999999.9999.999","mode":"deleteParameter","data":{"name":"outputdir","appname":"jbrowseFeatures"}}' | ./admin.cgi
    
</entry>
<entry [Tue 2011:06:14 02:56:34 EST] PROJECT copyFile>

/var/www/cgi-bin/agua/0.6/project.cgi "mode=copyFile&sessionId=9999999999.9999.999&username=aguatest&file=Project2/test/test.err&destination=Project1/Workflow1"

    Content-type: text/html
    
    { status: 'initiated'  }


</entry>
<entry [Thu 2011:05:26 02:39:52 EST] VIEW add/removeViewFeature AND add/removeView>


add/removeView
--------------

addView
echo {"project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addView"} | /var/www/cgi-bin/agua/0.6/view.cgi

removeView
echo {"project":"Project1","view":"View2","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeView"} | /var/www/cgi-bin/agua/0.6/view.cgi


add/removeViewFeature
---------------------

addViewFeature (ntHumChimp)
echo {"sourceproject":"Project1","sourceworkflow":"Workflow1","species":"human","build":"hg19","feature":"ntHumChimp","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"} | /var/www/cgi-bin/agua/0.6/view.cgi

addViewFeature (control1)
echo {"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control1","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"} | /var/www/cgi-bin/agua/0.6/view.cgi

addViewFeature (control2)
echo {"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control2","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"} | /var/www/cgi-bin/agua/0.6/view.cgi

removeViewFeature3 (control2)
echo {"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control2","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeViewFeature"} | /var/www/cgi-bin/agua/0.6/view.cgi

    
</entry>

<entry [Wed 2011:05:25 02:11:05 EST] WORKFLOW addStage %username% CONVERSION>

addStage() { echo '{"name":"jbrowseFeatures","owner":"admin","type":"view","executor":"/usr/bin/perl","localonly":"0","location":"apps/jbrowse/jbrowseFeatures.pl","description":"Generate JBrowse features for all chromosomes in parallel","notes":"Notes","appname":"jbrowseFeatures","appnumber":"3","number":"3","cluster":"","project":"Project1","workflow":"Workflow1","username":"syoung","workflownumber":"1","sessionId":"9999999999.9999.999","mode":"insertStage"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }
    
</entry>
<entry [Fri 2011:05:13 02:21:49 EST] Agua::Project>
    
renameWorkflow

cd c:\data\base\html\bin\db
sqlite3 data.dbl
cd c:\data\base\cgi-bin\agua

perl project.cgi "mode=renameWorkflow&sessionId=1228791394.7868.158&username=syoung&oldpath=Project1/Workflow1&newpath=Project1/WorkflowA"
		

fileSystem

perl projects.cgi "mode=fileSystem&parentDir=Project1&query=%7B%7D&sessionId=1228791394.7868.158&username=admin"

copyFile

perl projects.cgi "mode=copyFile&file=Project0/dummy.txt&destination=Project1&sessionId=1228791394.7868.158&username=admin"

perl projects.cgi "mode=copyFile&file=Project0/testdir&destination=Project1&sessionId=1228791394.7868.158&username=admin"

removeFile

perl projects.cgi "mode=removeFile&file=Project1/Workflow1-assembly&sessionId=1228791394.7868.158&username=admin"


PROJECTS

cd C:\DATA\base\cgi-bin\Bioptic0.2.5

perl projects.cgi "mode=projects&sessionId=1228791394.7868.158&username=admin"


FILESYSTEM

cd C:\DATA\base\cgi-bin\Bioptic0.2.5

perl projects.cgi "mode=fileSystem&sessionId=1228791394.7868.158&username=admin&query=%22owner%3Asyoung%2FProjectY%22&dojo.preventCache=1233551656303"


perl projects.cgi "mode=fileSystem&sessionId=1228791394.7868.158&username=admin&query=%22Project1%22&dojo.preventCache=1233551656303"


COPYFILE

cd C:\DATA\base\cgi-bin\Bioptic0.2.5

perl projects.cgi "mode=copyFile&sessionId=1228791394.7868.158&username=admin&file=owner:syoung/ProjectY/Workflow2-SNPs/inputdir/inputdir2/inputdir3/inputdir4/inputfile.txt&destination=owner:syoung/ProjectY/Workflow2-SNPs"

perl projects.cgi "mode=copyFile&sessionId=1228791394.7868.158&username=admin&file=owner:syoung/ProjectY/Workflow2-SNPs/inputfile.txt&destination=Project1/Workflow3-indels"

perl projects.cgi "mode=copyFile&sessionId=1228791394.7868.158&username=admin&file=Project1/Workflow3-indels/inputdir/inputdir2/inputfile.txt&destination=Project1/Workflow3-indels"

</entry>
<entry [Fri 2011:05:13 01:03:11 EST] Agua::Monitor::SGE>
		
echo '{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":1}' | perl -U workflow.cgi

{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":1}


	EXAMPLE
	
ERROR:

unable to contact qmaster via "localhost" commd using port 5890


QSTAT OUTPUT:


qstat -l 385

  Job ID      Username  Queue         Jobname     Limit  State  Elapsed
  ------      --------  -----         -------     -----  -----  -------
  385         jqpublic  sun-medium    STDIN       06:00  Run    00:03
       Job started on Thu Feb 07 at 11:08
	   

qstat -j 21

	==============================================================
	job_number:                 21
	exec_file:                  job_scripts/21
	submission_time:            Sat Jan 29 13:56:15 2011
	owner:                      root
	uid:                        0
	group:                      root
	gid:                        0
	sge_o_home:                 /root
	sge_o_log_name:             root
	sge_o_path:                 /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/sge6/bin/lx24-amd64
	sge_o_shell:                /bin/bash
	sge_o_workdir:              /data/pipeline/admin/Project1/Workflow1
	sge_o_host:                 ip-10-124-245-118
	account:                    sge
	mail_list:                  root@ip-10-124-245-118.ec2.internal
	notify:                     FALSE
	job_name:                   test.sh
	jobshare:                   0
	hard_queue_list:            all.q
	env_list:                   
	script_file:                test.sh
	usage    1:                 cpu=00:00:00, mem=0.00005 GBs, io=0.00002, vmem=19.402M, maxvmem=19.402M
	scheduling info:            (Collecting of scheduler job information is turned off)

    
</entry>


<entry [Fri 2011:05:06 13:07:07 EST] ADMIN Aws PANEL>

echo '{"username":"admin","sessionId":"9999999999.9999.999","mode":"addAws","volumesize":100,"amazonuserid":"558277860346","ec2publiccert":"-----BEGIN CERTIFICATE-----MIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlkC/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAJWZIAB2ZZB7FHJIQ","secretaccesskey":"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"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi

CREATES THESE THREE FILES:

/nethome/admin/.keypairs/private.pem
/nethome/admin/.keypairs/public.pem
/nethome/admin/.starcluster/id_rsa-admin-key



echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addAws","data":{"username":"syoung","volumesize":100,"amazonuserid":"558277860346","ec2publiccert":"-----BEGIN CERTIFICATE-----MIICdzCCAeCgAwIBAgIFHoFGKBUwDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTEwMTExOTE2NDMzNFoXDTExMTExOTE2NDMzNFowUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRYwFAYDVQQDEw0xd2h3enZlN21ueGNhMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCBAssW9lEbOI1zeh5SAoUqncF6ezQ7M0ZGfgPfo/bKkmxTZitcDbHlPx8i2RDsrrhjFkBPOY6cJaguUIqZrVi80mAYlkC/WatU0OKRMtOQsGPV7MMhMNSYD1wwN48SiDpWnF9WoSIdyXnNmywDTzPVemJWMMbCUrB9h+VppPPpEwIDAQABo1cwVTAOBgNVHQ8BAf8EBAMCBaAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwIwDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUls+H6G2aw4Di4BAiw39F5NjCNZswDQYJKoZIhvcNAQEFBQADgYEAbW0DkQ9+pqJO8bxoKUGgskdkJo9pzvF+5qeG/ncPyEYXj0ufrBqcEBfOmIBC0af7N5uFYZ9yvMm4QI7mR9K7Gjfmwa3pq1zHVyfNkuAd4XVdX4x4/eYGwGPDDqqqudkI0PEjYqYism14Gy9EA49oP9CWbJzhkHqqiHDjsuOAN8E=-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAIECyxb2URs4jXN6HlIChSqdwXp7NDszRkZ+A9+j9sqSbFNmK1wNseU/HyLZEOyuuGMWQE85jpwlqC5QipmtWLzSYBiWQL9Zq1TQ4pEy05CwY9XswyEw1JgPXDA3jxKIOlacX1ahIh3Jec2bLANPM9V6YlYwxsJSsH2H5Wmk8+kTAgMBAAECgYA8oGFsQwjOb/8ZO1QwWfrWkhgwROHAyFHIIsQTPuxlOfYqIyNROSZWgxlQuQ1ZDKqd9gD2uieofZHRYgwgN/Qw69GuDUt9HzcNQ5yDPm3Ofa0WcD0tQa9YToHqEWVQaddc8D6DLcOwBDEropf2OIqd4JFusmenVBSIETihVKX8cQJBAM3Zs6W4nWtDExw7QlucgiKC0/R5exBk+BGVBAGHHcBTy+WXFrycUEJbj6q/PEIdGFxFvcO6GUk8x0JFGBgEB28CQQCgcNVc2Ar3kN3BAeM0xM5SVWlDYjDZwq5KId72g6CI/tcfjdpIHNI7yGlMNj4YPKOW2CAZebPLj3C74wclPUadAkEAgOcVju33baaX/fLBz/pGp3PDZHD59j8z9FabJpXEtJ4ErWWacEt2GseZRHPyOPhdO9LUTQ9pLCpqIH6B4vAK8wJAa0cnE16N7r1Z2Y1Wi9kwkBL2QI0uVtz6xyzgtfqLZC7qTvn9w4wp8rlt1vzKBlC9ncZDqGUdGHaADdGe3IKdbQJATBQ5VR3WM0lx6BrxXtHlxmmTikQ1mTlEdkjL4xJ9iXw7cRIIVdDzAait4TwuoxWxNODHlfMxK4ul8zcEE5bSlw==-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAJWZIAB2ZZB7FHJIQ","secretaccesskey":"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"}}' | /var/www/cgi-bin/agua/0.6/workflow.cgi

</entry>
<entry [Wed 2011:04:20 15:24:23 EST] ADMIN Users PANEL >
    
(COPIED FROM /var/www/.bash_profile)

removeUser () { echo '{"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"removeUser","data":{"username":"jgilbert","firstname":"s","lastname":"young","email":"stuartpyoung@gmail.com"}}'; echo '{"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"removeUser","data":{"username":"jgilbert","firstname":"s","lastname":"young","email":"stuartpyoung@gmail.com"}}' | /var/www/cgi-bin/agua/0.6/agua; }


addUser () { echo '{"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"addUser","data":{"username":"jgilbert","firstname":"s","lastname":"young","email":"stuartpyoung@gmail.com"}}'; echo '{"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"addUser","data":{"username":"jgilbert","firstname":"s","lastname":"young","email":"stuartpyoung@gmail.com"}}' | /var/www/cgi-bin/agua/0.6/agua; }


</entry>
<entry [Wed 2011:04:20 15:23:23 EST] ADMIN Settings PANEL>

CHANGE USER PASSWORD - OK 

changePassword1 () { echo '{"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"updateUser","data":{"username":"jgilbert","firstname":"s","lastname":"young","email":"jgilbert@gmail.com","oldpassword":"abierto","newpassword":"open"}}'; echo '{"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"updateUser","data":{"username":"jgilbert","firstname":"s","lastname":"young","email":"jgilbert@gmail.com","oldpassword":"abierto","newpassword":"open"}}' | /var/www/cgi-bin/agua/0.6/agua; }

changePassword2 () { echo '{"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"updateUser","data":{"username":"jgilbert","firstname":"s","lastname":"young","email":"jgilbert.com","oldpassword":"open","newpassword":"abierto"}}'; echo '{"username":"jgilbert","sessionId":"9999999999.9999.999","mode":"updateUser","data":{"username":"jgilbert","firstname":"s","lastname":"young","email":"jgilbert@gmail.com","oldpassword":"open","newpassword":"abierto"}}' | /var/www/cgi-bin/agua/0.6/agua; }

</entry>
<entry [Wed 2011:04:20 15:21:23 EST] ADMIN Clusters PANEL>

ADD smallcluster
echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"smallcluster","clustername":"smallcluster","minnodes":"0","maxnodes":"5","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi;

ADD picocluster
echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi;


ADD CLUSTER - OK 

addCluster () {  echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"addCluster","cluster":"picocluster","clustername":"picocluster","minnodes":"0","maxnodes":"1","typecombo":"t1.micro","amiid":"ami-d1c42db8","description":"Small test cluster","notes":"Notes","instancetype":"t1.micro"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

REMOVE CLUSTER

removeCluster() { echo '{"cluster":"picocluster","instancetype":"t1.micro","amiid":"ami-d1c42db8","minnodes":"0","maxnodes":"1","description":"Small test cluster","notes":"Notes","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeCluster"}'; echo '{"cluster":"picocluster","instancetype":"t1.micro","amiid":"ami-d1c42db8","minnodes":"0","maxnodes":"1","description":"Small test cluster","notes":"Notes","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeCluster"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }


</entry>
<entry [Wed 2011:04:20 15:20:23 EST] WORKFLOW Stages PANEL>

SAVE CLUSTER WORKFLOW

saveCluster() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"smallcluster","mode":"saveClusterWorkflow"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"smallcluster","mode":"saveClusterWorkflow"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }



CHANGE CLUSTER WORKFLOW TO mediumcluster

medium () {  echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow2","cluster":"mediumcluster","mode":"saveClusterWorkflow"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow2","cluster":"mediumcluster","mode":"saveClusterWorkflow"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

CHANGE CLUSTER WORKFLOW TO smallcluster

small () {  echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"smallcluster","mode":"saveClusterWorkflow"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"smallcluster","mode":"saveClusterWorkflow"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

COPY PROJECT

copy() { echo '{"sourceuser":"syoung","targetuser":"syoung","sourceworkflow":"Workflow1","sourceproject":"Project1","targetworkflow":"'$1'","targetproject":"Project1","copyfiles":0,"username":"syoung","sessionId":"9999999999.9999.999","mode":"copyWorkflow"}'; echo '{"sourceuser":"syoung","targetuser":"syoung","sourceworkflow":"Workflow1","sourceproject":"Project1","targetworkflow":"'$1'","targetproject":"Project1","copyfiles":0,"username":"syoung","sessionId":"9999999999.9999.999","mode":"copyWorkflow"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; } 

EXECUTE WORKFLOW

submit() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","cluster":"smallcluster","submit":"1","mode":"executeWorkflow","number":"2"}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","cluster":"smallcluster","submit":"1","mode":"executeWorkflow","number":"2"}' |/var/www/cgi-bin/agua/0.6/workflow.cgi;}

execute() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"1","submit":"0","cluster":""}'; echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"1","submit":"0","cluster":""}' |/var/www/cgi-bin/agua/0.6/workflow.cgi;}

</entry>
<entry [Wed 2011:04:20 15:19:23 EST] WORKFLOW Parameters PANE>

GET STATUS

getStatus() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"getStatus"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

Agua.getStageParameters = function (stageObject) {
// RETURN AN ARRAY OF STAGE PARAMETER HASHARRAYS FOR THE GIVEN STAGE
	//console.log("Agua.getStageParameters    plugins.core.Agua.getStageParameters(stageObject)");
	console.log("Agua.getStageParameters    stageObject: " + dojo.toJson(stageObject));

        if ( stageObject == null )	return;
	
	var keys = ["project", "workflow", "name", "number"];
	var notDefined = this.notDefined (stageObject, keys);
	console.log("Agua.getStageParameters    notDefined: " + dojo.toJson(notDefined));
	if ( notDefined.length != 0 )
	{
		console.log("Agua.getStageParameters    not defined: " + dojo.toJson(notDefined));
		return;
	}
	
	// CONVERT STAGE number TO appnumber
	stageObject.appnumber = stageObject.number;
	stageObject.appname = stageObject.name;

	var stageParameters = this._getStageParameters();
	console.log("Agua.getStageParameters    INITIAL stageParameters.length: " + stageParameters.length);	
	var keyArray = ["project", "workflow", "appname", "appnumber"];
	var valueArray = [stageObject.project, stageObject.workflow, stageObject.name, stageObject.number];
	stageParameters = this.filterByKeyValues(stageParameters, keyArray, valueArray);
	console.log("Agua.getStageParameters    Returning stageParameters.length: " + stageParameters.length);	

	return stageParameters;
};
var stage = {
    "owner":"admin",
	"location":"apps/aligners/ELAND.pl",
	"version":"0.2",
	"executor":"perl",
	"name":"ELAND",
	"localonly":"0",
	"description":"Solexa/Illumina short read aligner (max 32 bps aligned)",
	"notes":"Notes",
	"url":"http://www.google.com",
	"type":"alignment",
	"appname":"ELAND",
	"appnumber":"4",
	"number":"4",
	"cluster":"",
	"project":"Project1",
	"workflow":"TEST1",
	"username":"syoung",
	"workflownumber":"10",
	"sessionId":"9999999999.9999.999",
	"mode":"insertStage"
};




Agua.addStageParametersForStage = function (stageObject) {
// ADD parameters ENTRIES FOR A STAGE TO stageparameters
	console.log("Agua.addStageParametersForStage    plugins.core.Agua.addStageParametersForStage(stageObject)");
	console.log("Agua.addStageParametersForStage    stageObject: " + dojo.toJson(stageObject));
	if ( stageObject.name == null )	return null;
	if ( stageObject.number == null )	return null;

        var startLength = this.cloneData("stageparameters").length;

	// GET APP PARAMETERS	
	var parameters;
	console.log("Agua.addStageParametersForStage    Agua.cookie('username'): " + Agua.cookie('username'));
	if ( stageObject.owner == Agua.cookie('username') )
	{
		console.log("Agua.addStageParametersForStage    Doing this.getParametersByAppname(stageObject.name)");
		parameters = dojo.clone(getParametersByAppname(stageObject.name));
	}
	else {
		console.log("Agua.addStageParametersForStage    Doing this.getSHAREDParametersByAppname(stageObject.name)");
		parameters = dojo.clone(this.getSharedParametersByAppname(stageObject.name, stageObject.owner));
	}
	console.log("Agua.addStageParametersForStage    parameters.length: " + parameters.length);	
	console.log("Agua.addStageParametersForStage    BEFORE parameters: " + dojo.toJson(parameters, true));

	// ADD STAGE project, workflow, AND number TO PARAMETERS
	dojo.forEach(parameters, function(parameter)
	{
		parameter.project = stageObject.project;
		parameter.workflow = stageObject.workflow;
		parameter.appnumber = stageObject.number;
		parameter.appname = stageObject.name;
	});
	console.log("Agua.addStageParametersForStage    AFTER parameters: " + dojo.toJson(parameters));
	console.log("Agua.addStageParametersForStage    parameters.length: " + parameters.length);

	// ADD PARAMETERS TO stageparameters ARRAY
	var uniqueKeys = ['owner', 'project', 'workflow', 'appname', 'appnumber', 'name'];
	var addOk = true;
	var thisObject = this;
	dojo.forEach(parameters, function(parameter)
	{
		console.log("Agua.addStageParametersForStage    Adding parameter: " + dojo.toJson(parameter));
		if ( thisObject._addObjectToArray(thisObject.getStageParameters(), parameter, uniqueKeys) == false)
		{
			addOk = false;
		}
	});
	console.log("Agua.addStageParametersForStage    addOk: " + addOk);
	if ( ! addOk )
	{
		console.log("Agua.addStageParametersForStage    Could not add one or more parameters to stageparameters");
		return;
	}


        var endLength = this.cloneData("stageparameters").length;
	console.log("Agua.getStageParameters    this.data.stageparameters, startLength: " + startLength);	
	console.log("Agua.getStageParameters    this.data.stageparameters, endLength: " + endLength);	

	return addOk;
};

//Agua.addStage(stage);

var stageparameters = Agua.getStageParameters(stage);
stageparameters.length;




</entry>
<entry [Wed 2011:04:20 15:19:23 EST] TEST AND REFRESH UTILITY: getTable>

NB: USES TEST DATABASE aguatest

getTable() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","database":"aguatest","mode":"getTable","table":"'$1'"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

testData() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","database":"aguatest","mode":"getData"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

getData () { echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getData"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }



</entry>

<entry [Wed 2011:04:20 13:31:02 EST] TESTING ADMIN PANE addUser/removeUser>
    

echo '{"username":"syoung","sessionId":"1228791394.7868.158","mode":"addUser","data":{"username":"aaa"}}' | perl -U admin.cgi

    
</entry>


<entry [Fri 2011:04:15 14:30:42 EST] ACCESS DOJO WIDGETS IN FIREFOX - Workflow/Stage>

GET STAGES
var keys = ["project", "workflow"];
var values = ["Project1", "Workflow1"];
var array = Agua.filterByKeyValues(Agua.stages);
console.log(dojo.toJson(array, true));
console.log(dojo.toJson(Agua.stages, true));

WORKFLOW:FILEMANAGER
var workflow = Agua.widgets["workflow"][0];
var filemanager = workflow.core.fileManager;
var dialog = filemanager.fileManagerDialog;


WORKFLOW.PROJECTCOMBO WORKFLOWNUMBER
var workflow = Agua.widgets["workflow"][0];
console.log("workflow: " + workflow);
var combobox = workflow.core.stages.projectCombo;
console.log("combobox: " + combobox);
console.dir(combobox);
 var combonode = combobox.comboNode;
console.log("combonode: " + combonode);
console.dir(combonode);
    
GET PROJECT COMBO
var projectcombo = dijit.byId("plugins_core_ComboBox_1");
console.log(projectcombo)
projectcombo.set('value', "Project2");
projectcombo.onchange("Project2");
projectcombo.set('value', "Project1");
projectcombo.onchange("Project1");


</entry>


<entry [Fri 2011:04:15 10:39:57 EST] CREATED aguatest DATABASE AND USED IN workflow.stages.html >

OBJECTIVE: TEST WORKFLOW COMBOBOX ADD/DELETES RETAIN WORKFLOW NUMBER INTEGRITY

1. DUMPED agua

mysqldump -u root -p agua > /home/syoung/0.6/t/html/plugins/workflow/aguatest.dump


2. CREATE aguatest DATABASE

CHANGE NAME FROM agua TO aguatest
sed 

mysql -u root -p < /home/syoung/0.6/t/html/plugins/workflow/sql/createDb.sql


WHICH CONTAINS:

emacs /home/syoung/0.6/t/html/plugins/workflow/sql/createDb.sql

    CREATE DATABASE aguatest;
    USE aguatest;
    GRANT ALL PRIVILEGES ON aguatest TO agua@localhost IDENTIFIED BY 'open4agua';


LOAD DUMPED DATA INTO aguatest

mysql -u root -p aguatest < /home/syoung/0.6/t/html/plugins/workflow/aguatest.dump


3. PASSED "database":"aguatest" IN getData PUT TO Workflow.pm FROM workflow.combobox.html 

... BY ADDING database ARGUMENT TO INSTANTIATION OF Agua:

		Agua = new plugins.core.Agua( {
			cgiUrl : cgiUrl,
			htmlUrl : htmlUrl,
			database: "aguatest"
        });


4. ADDED SHORTCUT IN .bash_profile

alias testData="echo '{\"username\":\"syoung\",\"sessionId\":\"9999999999.9999.999\",\"database\":\"aguatest\",\"mode\":\"getData\"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi"

alias getData="echo '{\"username\":\"syoung\",\"sessionId\":\"9999999999.9999.999\",\"mode\":\"getData\"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi"



5. ADDED getTable SUBROUTINE IN Agua/Common/Base.pm TO RETRIEVE INDIVIDUAL TABLES TO COMPARE ACTUAL TEST DATA WITH EXPECTED RESULTS AFTER CALLS TO THE SERVER FROM THE CLIENT 


getTable() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","data\
base":"aguatest","mode":"getTable","table":"'$1'"}' | /var/www/cgi-bin/agua/0.6\
/workflow.cgi; }

testData() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","database":"aguatest","mode":"getData"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }

getData () { echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getData"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi; }


... AND www-data FUNCTION FOR TESTING executeWorkflow:

execute() { echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"2"}'; echo '{"username"\
:"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":"1","mode":"executeWorkflow","number":"2","submit":"1","cluster":"default"}' |./workflow.cg\
i;}



6. RUN TESTS IN workflow.combobox.html




</entry>

<entry [Mon Jan 31 21:53:34 EST 2011] TESTING COPYWORKFLOW>

echo '{"sourceuser":"admin","targetuser":"syoung","sourceworkflow":"Workflow0","sourceproject":"Project1","targetworkflow":"Workflow9","targetproject":true,"username":"syoung","sessionId":"9999999999.9999.999","mode":"copyWorkflow"}' |  ./workflow.cgi

</entry>

