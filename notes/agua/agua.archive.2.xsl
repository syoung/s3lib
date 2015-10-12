agua.archive.2

<entry [Fri 2011:07:01 02:00:46 EST] REFACTORED Admin TAB WITH plugins.form.EditForm>

Refactoring Admin Tab with plugins.form.EditForm, completed: Parameter, Sources. To do: Apps, Clusters, Groups, Projects and Users.

Widget.js:

0. REQUIRE plugins.form.EditForm AND PLACE IN DECLARE STATEMENT
1. ADD VARIABLES:
	dataFields VARIABLE FOR setTrash
	formInputs, ETC.
	avatarItems AND rowClass FOR AUTOMATED setDragSource
2. REPLACE saveSomething WITH saveInputs (NB: query MODE)
3. CUSTOMISE getEditedInputs AS getFormInputs FOR SPECIAL INPUTS (E.G., locked)
3b. REMOVE getEditedInputs AND validateFormInputs
3c. OVERRIDE checkInputs FOR EXTRA VALIDATION IF NECESSARY
4. REPLACE deleteSomething WITH deleteItem, AND addSomething WITH addItem
5. ADD itemObject ARGUMENT TO deleteItem
6. IN setDragSource, SET this.dragSourceWidget
7. REPLACE setForm, ADDING clearValue CALLS IF NECESSARY
	REM: dojo.hitch(this, "saveInputs", null, null));

8. ADD updateSomething WITH CONDITIONAL ON reload
9. REMOVE setTrash METHOD, AND setTrash CALL FROM startup
10. REMOVE UNNECESSARY onchange'S FROM HTML TEMPLATES
11. REMOVE getDragSource, ADD getItemArray

Widget.html
DO NOTHING

WidgetRow.html:

1. REMOVE saveSomething dojoAttachEvent
3. IN setForm, ADD dojo.connect TO saveInputs

WidgetRow.js:

ADD this.formInputs = this.parentWidget.formInputs TO postCreate
REPLACE editSomethingRow WITH editRow
REPLACE onchange TO saveInputs

Widget.css
CHANGE newName TO name, ETC.



NOTES
------

STOP DND DROP - SET isSource TRUE/FALSE

OTHER DND SOURCE OPTIONS: isSource, withHandles AND skipForm:

http://www.sitepen.com/blog/2008/06/10/dojo-drag-and-drop-1/

Tweaking DnD Behavior
The final thing left to talk about for this demo is the set of buttons we introduce in version 4. We have buttons to clear the wishlist and shopping cart now, but notice the buttons at the bottom of the page. These demonstrate different ways to change the way DnD behaves. You can read the code to see how they work, but here's what they do:

isSource ("enable DnD"): If you've ever wondered how to turn DnD on and off completely, here's one way. This toggles the isSource member of each of our sources; I mentioned this earlier, but recall that when this is false, the manager won't initiate any drag operations. Objects will still accept drops, but if there's nothing acting as a source, we've effectively disabled the DnD system.
withHandles ("drag via handles only"): If you give a DOM node the dojoDndHandle class, dojo.dnd will consider it a handle. Each Source has a member variable withHandles that determines whether you can drag any part of an item, or just the handle. This demo sets up the product images as the handles, so if you toggle the button, you'll see the drag behavior change accordingly.
skipForm ("no button in the demo"): If you have form elements in your drag items, you can use the skipForm field to toggle whether or not clicks inside them will initiate drags. Setting it to true will allow you to, say, select text in a < textarea> without dragging everything around


</entry>
<entry [Wed 2011:06:29 04:24:43 EST] DOWNLOADED DOJO 1.6.1 >

cd /agua/0.6/html
wget http://download.dojotoolkit.org/release-1.6.1/dojo-release-1.6.1-src.tar.gz
tar xvfz dojo-release-1.6.1-src.tar.gz
mv dojo-release-1.6.1-src dojo-1.6.1

    
</entry>
<entry [Tue 2011:06:28 04:31:28 EST] DOWNLOADED DOJO 1.7 BETA>

RELEASE NOTES
http://docs.dojocampus.org/releasenotes/1.7

DOWNLOAD
http://download.dojotoolkit.org/release-1.7.0b1/

cd /home/syoung/22-agua/dojo-1.7b
http://download.dojotoolkit.org/release-1.7.0b1/dojo-release-1.7.0b1-src.tar.gz
tar xvfz *
mv dojo-release-1.7.0b1-src 
mv dojo-release-1.7.0b1-src /agua/0.6/html/dojo-1.7.0b1

EDIT GIT IGNORE FILE:
emacs /agua/0.6/html/.gitignore

# ignore these files:
dojo-1.6.1
dojo-1.7.0b1


WHAT'S NEW IN 1.7?
http://docs.dojocampus.org/releasenotes/1.7


DojoX

Charting

New zoom, pan, data indicator interactions have been committed in the action2d package. They allow users to interact with the chart using either mouse or touch gestures.
Various improvement to improve performances on particular on mobile devices (new enableCache parameter on most plot type to allow caching and reuse of gfx shapes)

use of AMD module format
Bidi text support has been added through two BidiSupport classes (one for dojox.charting, one for dojox.charting.widget). This classes need to be required by your application in order for Bidi text support to be enabled.
Gauges

The gauges that were previously located in the dojox.widget namespace have been moved to dojox.gauges.
Several new indicators have been added to create your custom gauges, for example a text indicator to draw the value of the gauge as a text.
The circular gauge can now be created clockwise or counter-clockwise.
The layout of labels in the circular scale are improved.
Gauges now support touch interaction on mobile devices.
dojox.gauges now uses the AMD module format
Three new pre-built gauges with a glossy look are now available : The GlossyHorizontalGauge, the GlossyCircularGauge and the GlossySemiCircularGauge.
GeoCharting Maps

Various improvements of the dojox.geo.charting module like tooltip management, color change animation when changing data series.
New dataStore structure, new data binding between the map element and the dataStore element.
Allow interactive zoom/pan of the map using either mouse or touch gestures, through the installation of dedicated interactor classes.
New Map Dijit component wrapping the non-dijit dojox.geo.charting Map component, for easier integration.
Use of AMD module format.
Gfx

Shapes are now identified via an associated unique id (Shape.getUID()). Coupled to this, the new dojox.gfx.shape.byId() function returns the shape associated with a given id.
Add input events support to canvas renderer. It is enabled by default and can be disabled by setting the djConfig 'canvasEvent' flag to 'false'.
The gfx shape targeted by a mouse event can be retrieved from the event itself by means of the 'gfxTarget' event property:
group.connect("onmousedown", function(evt){ var s = evt.gfxTarget; ... });
Mobile


BlackBerry theme has been added.

dojox.mobile.deviceTheme is a device theme loader, which detects the mobile device being used and automatically loads an appropriate theme
New SpinWheel widget allows you to select values from spin wheels. Two variations, SpinWheelDatePicker and SpinWheelTimePicker, are also available.
New Carousel widget shows a list of images from which you can select an item.
New RoundRectDataList and EdgeToEdgeDataList widgets are data-driven versions of the RoundRectList and EdgeToEdgeList.
New PageIndicator widget shows the current page of swap views with small dots. It can be used with SwapView or Carousel.
Several new transition animations have been added: Dissolve, Flip2, Cover, Reveal, Slide Vertical, Cover Vertical, Reveal Vertical, Swirl, Zoom In/Out, and Scale In/Out.

The FlippableView widget has been renamed to SwapView.
dojox.mobile now uses the AMD module format
TextBox widget moved from mobile/app/ to mobile/.
New Tooltip widget to popup a container for either simple text or another wiget.
New Overlay widget to slide up form the bottom another input widget, and then slides down when done.
New Opener widget adds runtime screen-size detection and uses Tooltip for the larger mobile devices, and Overlay on small-screen devices.
New ComboBox widget (still experimental) that combines searchable text input similar to dijit.form.ComboBox.
New ExpandingTextarea widget grows and shrinks vertically as needed to accomodate the end-user text.
New Slider widget to enable users to easily adjust a value with touch/dragging gestures.
New HTML form input widget wrappers (Textarea, CheckBox, RadioButton) to allow simple form constructs to be used with various dijit container/dialog widgets.
MVC

dojox.mvc is a new experimental dojox project about separation of MVC concerns on the client, thereby easing the development of data-rich applications using Dojo (enterprise apps, IT apps, CRUD scenarios, patterns like master-detail and others). This first release contains:

A first-class data model which can talk to data stores
Data binding mixin that allows widgets or arbitrary view components to bind to locations in above data model
MVC containers like group (for hierarchical data) and repeat (for repeating data i.e. arrays)
MVC widgets such as data-bound output and data-driven simple UI generator
Samples for number of data-rich patterns that can be built using the above
OpenLayers Maps

New dojox.geo.openlayers mapping package based on the OpenLayers library (See http://www.openlayers.org/ ).
Allow user to add georeferenced Gfx shapes on a background map.
Allow user to place georeferenced widgets on the map.
Use of AMD module format.
Util

The build tool has been replaced, but it supports the same options as before. It now runs on node.js too (in addition to rhino). (TODO: Rawld, fill this in)

Migration

Loader/Builder related

Previously you may have been loading modules or layers via script tags, ex:

< script src="/mysite/app/MyWidget.js">
This no longer works, and will give errors about "foo multiply defined". Instead you must load it through dojo.require():

dojo.require("app.MyWidget");
Or the new AMD require() API.

Global variables

If your JS files want to declare global variables, perhaps to be used by widgets, ex:

< script>
   function myOnClick(){ ... }
< /script>
...
< button dojoType="dijit.form.Button" onClick="myOnClick">...< /button>
Then you need to declare them with this syntax:

< script>
   myOnClick = function(){ ... }
< /script>
The following syntax will not work, and will give errors about not being able to find the symbox:

< script>
   function myOnClick(){ ... }
< /script>
Nor will this:

< script>
   var myOnClick = function(){ ... };
< /script>
This is especially true for builds.

debugAtAllCosts

The debugAtAllCosts djConfig flag is no longer supported, and will be ignored.

Possible workarounds for a particular app are:

Convert the app to AMD and load with async:true, thereby using a standard AMD
System Message: WARNING/2 (< string>, line 298)

Block quote ends without a blank line; unexpected unindent.
loader which script-injects everything.

Do a build, which converts all legacy modules to AMD modules. (Note: to do
System Message: WARNING/2 (< string>, line 301)

Block quote ends without a blank line; unexpected unindent.
a true conversion that takes advantage of all of the features of AMD and removes things like dojo.getObject requires more work than the build app can do mechanically.)

Dore Core

HTML

dojo._getBorderBox() has been removed, use dojo.position() instead
dojo._setOpacity() has been removed, use dojo.style(node, "opacity", ...) instead
dojo.moduleUrl()

dojo.moduleUrl() returns a string instead of an object. It won't affect most apps, unless you are accessing the internal members, ex: dojo.moduleUrl(...).uri.

Dijit

Many widgets which used to extend _Templated now extend _TemplatedMixin. If you have custom widgets that extend standard widgets, and use widgetsInTemplate: true, you may need to also mixin dijit._WidgetsInTemplate
The dijit.Calendar template has been modified to have ${!dayCellsHtml} and ${!dateRowsHtml} variables for the M-F (days of week) row, and the 1-31 days-of-the-month cells. Custom calendar templates should be updated to contain these variables rather than markup for those sections. If custom versions of Calendar need to modify the structure of days-of-week or days-of-month cells, they can override the new Calendar attributes: dowTemplateString, dateTemplateString, and weekTemplateString.
If you have specified a custom labelFunc() for a dijit.form.ComboBox/FilteringSelect, it will be passed an item and store of the new dojo.store API. This generally won't be a problem unless you are depending on internals of the item (ex: depending on item being a DOMNode rather than a javascript hash), or accessing the store as a global variable rather than as the second parameter to the labelFunc() callback.
If you want to allow for rich text saving with back/forward actions, you must add a text area to your page with the id==dijit._scopeName + "._editor.RichText.value" (typically "dijit._editor.RichText.value). For example:
< textarea id="dijit._editor.RichText.value" style="display:none;position:absolute;top:-100px;left:-100px;height:3px;width:3px;overflow:hidden;">< /textarea>
Previously this was done automatically in general (although it was always necessary for XD builds).

    
</entry><entry [Tue 2011:06:28 04:20:16 EST] AGUA PLUGINS PROPOSAL>

Tom's packaging proposal for dojo 2.0
https://docs.google.com/document/edit?id=14JGtJSF6-LEZcL4GxbQlroggtnrcI3Z9Muq1Orm5Ydw&hl=en&authkey=CICxsLQI#

SEE notes/agua/DTK2.0PackagesandDojoX.txt

This draft/proposal is aimed at decoupling small projects (current housed under the dojox. namespace) from any kind of Dojo/Dijit release, and providing a way for developers to easily grab additional functionality “as needed”.  To do this, several items need to be addressed:

1. How to define a package/plugin/project
2. How to discover a package/plugin/project
3. How to install a package/plugin/project
4. How to document a package/plugin/project
5. How to delineate between “sanctioned” packages and “non-sanctioned” ones without violating/treading on the terms of the Dojo Foundation CLA/CCLA
6. How to allow people to write and submit a package/plugin/project
7. Requirements for a package/plugin/project

What is a package?
A package is a small-ish, self-standing project that has a defined purpose.  Any contributed package must contain the following information:

1. A package manifest
2. Source code (duh ;))
3. Documentation
4. Tests, where applicable

ABSENT A PACKAGE SPECIFICATION, THE FOLLOWING DIRECTORY STRUCTURE IS PROPOSED:

application/version
                manifest.json   List of files in package (optional)
                README          Description of package, installation
                
                
application/version/[dirs]/     Directories of package (e.g., lib, bin)
application/version/[files]     Files included in package
                    


    
</entry>
<entry [Mon 2011:06:27 19:31:32 EST] FIXED COMBOBOX STYLE>

http://stackoverflow.com/questions/5204010/dojo-combobox-style


dojo.addClass(dijit.byId(dropdownId), "popup");

WHERE ID IS TAKEN FROM ID OF PARENT COMBOBOX:

 id="widget_plugins_core_ComboBox_0_dropdown" class="dijitPopup dijitComboBoxMenuPopup

</entry>
<entry [Mon 2011:06:27 19:24:10 EST] FIXED ADMIN PANE ERROR: 'Tried to register widget with id ~~ dijit_layout_LayoutContainer_0 but that id is already registered'>


MOVED createTab() CALL TO addOnLoad FROM startup

    
</entry>
<entry [Sun 2011:06:26 18:17:51 EST] ADDED TRACK ADD/REMOVE FUNCTIONALITY TO View PANE>

ADDED TO Browser.createTrackList:

ADD TRACK
---------
	var trackCreate = function(track, hint) {
            ...
			// ADDED: UPDATE TRACKLIST IN View.js
			brwsr.parentWidget.updateViewTracklist(brwsr.viewObject, track.label, "add");
			

REMOVE TRACK
------------

	dojo.subscribe("/dnd/drop", function(source,nodes,iscopy){
		brwsr.onVisibleTracksChanged();
        ...

			// ADDED: UPDATE TRACKLIST IN View.js
            brwsr.parentWidget.updateViewTracklist(brwsr.viewObject, nodes[0].track.key, "remove");

    
</entry>
<entry [Sat 2011:06:18 17:19:03 EST] FIX jbrowseFeatures.pl OUTPUT FILE>

PRINTING OUTPUT FILES HERE:

./out/data/tracks/chr22/jbrowseFeatures-chr22-out:


WITH THIS COMMAND:

export SGE_QMASTER_PORT=36251; \
export SGE_EXECD_PORT=36252; \
export SGE_ROOT=/opt/sge6; \
export SGE_CELL=syoung-smallcluster; \
export USERNAME=syoung; \
export QUEUE=syoung-Project1-Workflow1; \
export PROJECT=Project1; \
export WORKFLOW=Workflow1; \
/usr/bin/perl /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl \
--build hg19 \
--filename out.bam \
--filetype bam \
--inputdir /nethome/syoung/agua/Project1/Workflow1 \
--key tophat-1 \
--label tophat-1 \
--project Project1 \
--queue Project1-Workflow1 \
--species human \
--username syoung \
--workflow Workflow


    
</entry>
<entry [Fri 2011:06:17 22:00:55 EST] FIXED RunStatus.js ERROR ON RESTART TIMER>

RunStatus.getStatus Doing this.timer.start()
RunStatus.queryStatus response: {"cluster":null,"queue":"=================================================================================\nqueuename qtype resv/used/tot. load_avg arch states\n---------------------------------------------------------------------------------\nProject1-Workflow1@master BIP 0/1/1 1.20 lx24-amd64 \n 727 0.55500 test root r 06/17/2011 22:00:01 1 \n---------------------------------------------------------------------------------\nProject1-Workflow1@node001 BIP 0/0/1 -NA- lx24-amd64 au\n---------------------------------------------------------------------------------\nProject1-Workflow1@node002 BIP 0/0/1 -NA- lx24-amd64 au\n---------------------------------------------------------------------------------\nProject1-Workflow2@master BIP 0/1/1 1.20 lx24-amd64 \n 726 0.55500 test root r 06/17/2011 22:00:01 1 \n---------------------------------------------------------------------------------\nProject1-Workflow2@node001 BIP 0/0/1 -NA- lx24-amd64 au\n---------------------------------------------------------------------------------\nProject1-Workflow2@node002 BIP 0/0/1 -NA- lx24-amd64 au\nProject1-1: 1\ntest: 38\n","stages":[{"stagedescription":null,"stagepid":"715","number":"1","status":"error","project":"Project1","submit":"1","workflowpid":"13399","stagenotes":null,"stagename":null,"stagejobid":"0","completed":"0000-00-00 00:00:00","owner":"admin","workflownumber":"1","cluster":"","stderrfile":null,"location":"apps/expression/TOPHAT.pl","executor":"/usr/bin/perl","name":"TOPHAT","username":"syoung","stdoutfile":null,"workflow":"Workflow1","now":"2011-06-17 22:00:13","type":"aligner","started":"0000-00-00 00:00:00","queued":"2011-06-16 09:17:59"},{"stagedescription":null,"stagepid":"715","number":"2","status":"queued","project":"Project1","submit":"0","workflowpid":"13399","stagenotes":null,"stagename":null,"stagejobid":"0","completed":"0000-00-00 00:00:00","owner":"admin","workflownumber":"1","cluster":"","stderrfile":null,"location":"apps/jbrowse/jbrowseFeatures.pl","executor":"/usr/bin/perl","name":"jbrowseFeatures","username":"syoung","stdoutfile":null,"workflow":"Workflow1","now":"2011-06-17 22:00:13","type":"view","started":"0000-00-00 00:00:00","queued":"2011-06-16 09:17:59"}]}

RunStatus.queryStatus Setting class of 2 stage nodes
RunStatus.queryStatus startIndex: 0
RunStatus.queryStatus response nodeClass 0: error
RunStatus.queryStatus Setting thisObject.completed = false
RunStatus.queryStatus response nodeClass 1: queued
RunStatus.queryStatus Setting thisObject.completed = false
RunStatus.queryStatus thisObject.completed: false
RunStatus.queryStatus BEFORE this.showStatus(startIndex, response)
RunStatus.displayStagesStatus plugins.workflow.RunStatus.displayStagesStatus(stages)
StageStatus.startup plugins.workflow.StageStatus.startup()
RunStatus.queryStatus AFTER this.showStatus(startIndex, response)
RunStatus.getStatus onTick()
RunStatus.getStatus thisObject.completed: false
RunStatus.getStatus Doing setTimeout(this.queryStatus(runner))

RunStatus.getStatus Error doing setTimeout(this.queryStatus(runner)): {"message":"runner is undefined","fileName":"http://ec2-174-129-137-49.compute-1.amazonaws.com/agua/0.6/builds/006/dojo/dojo/dojo.js.uncompressed.js","lineNumber":693,"stack":"((void 0))@http://ec2-174-129-137-49.compute-1.amazonaws.com/agua/0.6/builds/006/dojo/dojo/dojo.js.uncompressed.js:693\n(0)@http://ec2-174-129-137-49.compute-1.amazonaws.com/agua/0.6/builds/006/dojo/dojo/dojo.js.uncompressed.js:676\n","name":"TypeError"}

    
</entry>
<entry [Wed 2011:06:15 12:51:13 EST] FIXED %workflow PARAMETER VALUE FOR TOPHAT>
    
update parameter set value ='%project%/%workflow%/coverage.wig' where value ='%project%/%workflow/coverage.wig';
update parameter set value ='%project%/%workflow%/accepted_hits.sam' where value ='%project%/%workflow/accepted_hits.sam';
update parameter set value ='%project%/%workflow%/junctions.bed' where value ='%project%/%workflow/junctions.bed';
update stageparameter set value ='Project1/Workflow1/junctions.bed' where value ='Project1/%workflow/junctions.bed';
update stageparameter set value ='Project1/Workflow1/accepted_hits.sam' where value ='Project1/%workflow/accepted_hits.sam';
update stageparameter set value ='Project1/Workflow1/coverage.wig' where value ='Project1/%workflow/coverage.wig';
    
</entry>
<entry [Thu 2011:06:09 01:13:38 EST] FIXED 'this._showAnim is undefined' ERROR IN View.startup>

View.startup plugins.report.Template.View.startup()
View.startup this.mainTab: [Widget dijit.layout.BorderContainer, dijit_layout_BorderContainer_0]
this._showAnim is undefined


    
</entry>
<entry [Tue 2011:05:17 07:50:24 EST] PRE-ALPHA RELEASE>

#### REMOVE DEBUG    
cd /home/syoung/RELEASE/0.6/pre-alpha/test && find . -type f -print0 |  xargs -0 perl -i -p -e 's/(\s*\n*\s*)?[^\n]+\$DEBUG[^\n]+\n(\s*\n*\s*)?//s'

#### REMOVE EMPTY LINES
cd /home/syoung/RELEASE/0.6/pre-alpha/test && find . -type f -print0 |  xargs -0 perl -i -p -e 's/^\s*\n\s*\n*/\n/sg'

cd /home/syoung/RELEASE/0.6/pre-alpha/test && find . -type f -print0 |  xargs -0 perl -i -p -e 's/\n{2,}/\n/sg'

#### REMOVE #print 
cd /home/syoung/RELEASE/0.6/pre-alpha/test && find . -type f -print0 |  xargs -0 perl -i -p -e 's/^\s*#\s*print.+\n\s*\n*//sg'


RUN ON ALL


#### REMOVE DEBUG    
cd /home/syoung/RELEASE/0.6/pre-alpha/clone/agua && find . -type f -print0 |  xargs -0 perl -i -p -e 's/(\s*\n*\s*)?[^\n]+\$DEBUG[^\n]+\n(\s*\n*\s*)?//s'

#### REMOVE EMPTY LINES
##cd /home/syoung/RELEASE/0.6/pre-alpha/clone/agua && find . -type f -print0 |  xargs -0 perl -i -p -e 's/^\s*\n\s*\n*/\n/sg'
###cd /home/syoung/RELEASE/0.6/pre-alpha/clone/agua && find . -type f -print0 |  xargs -0 perl -i -p -e 's/\n{2,}/\n/sg'

#### REMOVE #print 
cd /home/syoung/RELEASE/0.6/pre-alpha/clone/agua && find . -type f -print0 |  xargs -0 perl -i -p -e 's/^\s*#\s*print.+\n//sg'


#### REMOVE console.log
cd /home/syoung/RELEASE/0.6/pre-alpha/clone/agua && find . -type f -print0 |  xargs -0 perl -i -p -e 's/^\s*.*console.log.+$//sg'


 
</entry>

<entry [Thu 2011:04:28 22:30:06 EST] EC2 SUPPORTS IDEMPOTENCY>

The EC2 RunInstances function now supports idempotency. If you are launching EC2 instances as part of a higher level process, this feature should help you to build management and control applications that are more robust.

To call RunInstances in an idempotent fashion, you need to create a client token. A client token is a case-sensitive string of up to 64 ASCII characters. You should use a unique client token for each new instance.

Once you have a properly formed client token, you simply pass it along as an additional parameter to RunInstances. The function will ignore the second and subsequent requests that have the same token. You must use the same set of parameters each time you call the function. If you don't you will get an IdempotentParameterMismatch error.

</entry>

<entry [Thu 2011:04:28 22:27:08 EST] USE EC2 TAGGING API TO NAME INSTANCE AND VOLUMES>

Amazon Resource Tagging21 September 2010
http://www.capsunlock.net/2010/09/amazon-resource-tagging.html

After several years of waiting, Amazon now has new feature to tag instances, volumes, and othe
r resources. Need to check it out? Amazon EC2 Resource Tagging

Simple test with Tagging an EC2 instance and an EBS volume.

1. Download the latest API tools here
http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip


2. In your terminal update the variable EC2_HOME and PATH:

shell_prompt$ export EC2_HOME=/Applications/ec2/ec2-api-tools-1.3-57419
shell_prompt$ export PATH=$EC2_HOME/bin:$PATH
shell_prompt$ ec2_version
1.3-57419 2010-08-31

3. Now for the tagging(just replace the instance-id and volume-id):

shell_prompt$ ec2-create-tags i-12345678 vol-12345678 -t webserver=host2
TAG instance     i-12345678 webserver   host2
TAG volume  vol-12345678    webserver   host2
shell_prompt$ ec2-describe-tags
TAG volume  vol-12345678    webserver   host2
TAG instance     i-12345678 webserver   host2
I’m now looking for a way to tag my current instances probably by writing a script.
Happy tagging.


http://aws.typepad.com/aws/2010/09/new-amazon-ec2-feature-resource-tagging.html

ec2-create-tags
---------------
ec2-create-tags i-c2ab87ad --tag name=aquarius-8c
    TAG	instance	i-c2ab87ad	name	aquarius-8c

ec2-create-tags i-408fd02f --tag name=aquarius-8b
    TAG	instance	i-408fd02f	name	aquarius-8b

ec2-describe-tags
-----------------
TAG	instance	i-408fd02f	name	aquarius-8b
TAG	instance	i-c2ab87ad	name	aquarius-8c

ec2-delete-tags #### ec2dtag
---------------
ec2-delete-tags i-c2ab87ad --tag name=aquarius-8c
    TAG	instance	i-c2ab87ad	name	aquarius-8c

ec2-describe-tags  
    TAG	instance	i-408fd02f	name	aquarius-8b


http://docs.amazonwebservices.com/AWSEC2/latest/UserGuide/index.html?Using_Tags.html


If you're using AWS Identity and Access Management (IAM), you can control which Users in your AWS Account have permission to create, edit, or delete tags. For more information about IAM, see AWS Identity and Access Management.


Tag Restrictions

The following basic restrictions apply to tags:

Maximum Number of Tags Per Resource—10
Maximum Key Length—128 Unicode characters
Maximum Value Length—256 Unicode characters
Unavailable Prefix—aws: (we have reserved it for tag names and values)

Tag keys and values are case sensitive.

You can't terminate, stop, or delete a resource based solely on its tags; you must specify the resource identifier instead (e.g., i-1a2b3c4d). For example, to delete snapshots that have been tagged with a tag key called DeleteMe, you must first get a list of the those snapshots by using a DescribeSnapshots call with a filter on the tag. Then you would call DeleteSnapshots with the IDs of the snapshots (e.g., snap-1a2b3c4d). You can't call DeleteSnapshots with a filter on the tag. For more information about using filters when listing your resources, see Listing and Filtering Your Resources.

An instance can't retrieve its own tags from its metadata (for more information about metadata, see Using Instance Metadata). Tag information is available only through the EC2 API.

Resources You Can Tag

You can tag the following Amazon EC2 and Amazon VPC resources:

images (AMIs, kernels, RAM disks)
instances
security groups
Amazon EBS volumes
Amazon EBS snapshots
Reserved Instances
Spot Instance requests
VPCs
subnets
Internet gateways
VPN connections
VPN gateways
customer gateways
route tables
network ACLs
DHCP options sets

You can't tag the following Amazon EC2 resources:

Elastic IP addresses
Key pairs
Placement groups

You can tag public or shared resources, but the tags you assign are available only to your AWS account and not to the other accounts sharing the resource.    

</entry>

<entry [Tue 2011:04:19 12:41:19 EST] SGE AND STARCLUSTER FOLDER HIERARCHY>

SGE
---
STORE QUEUE FILES (Agua::Common::Cluster AND Agua::Monitor::SGE):
/nethome/username/agua/.sge/conf

STORE SGE CLUSTER CONFIG FILES


STARCLUSTER
------------
STORE KEYS DURING INIT
/root/starcluster/config

STORE EACH USER'S KEYS
/nethome/username/agua/.starcluster/pk-XXX.pem
/nethome/username/agua/.starcluster/pub-XXX.pem

STARCLUSTER KEYPAIR FILE
/nethome/username/agua/.starcluster/id_rsa-***keyname***

STORE STARCLUSTER CONFIG FILES
/nethome/username/agua/.starcluster/clustername/config


</entry>


<entry [Tue 2011:04:19 12:33:33 EST] CLUSTER CREATION/USAGE PROCEDURE>

1. CLUSTERS CAN BE SET UP BY ALL USERS

2. A USER CANNOT USE ANOTHER USER'S CLUSTER

3. AWS CREDENTIALS ARE REQUIRED TO START A CLUSTER

4. USERS CAN INPUT THEIR OWN AWS CREDENTIALS IN THE Admin.Settings Pane

5. IF THE USER HAS NOT INPUT THEIR AWS CREDENTIALS, THE admin USER'S AWS

CREDENTIALS WILL BE USED, IF AVAILABLE


    
</entry>
<entry [Mon 2011:04:18 14:07:29 EST] TRANSFER HUGE AMOUNTS OF DATA WITH AWS Import/Export>

FEE CALCULATOR
http://awsimportexport.s3.amazonaws.com/aws-import-export-calculator.html

DETAILS
http://aws.amazon.com/importexport/

US Standard
 	
Device Handling
$80.00 per storage device handled. 

Data Loading Time
$2.49 per data-loading-hour. Partial data-loading-hours are billed as full hours. 

Return Shipping
If you have specified a return address within the US, AWS will pay reasonable return shipping charges. If you have specified a return address outside of the US or expedited shipping, shipping charges based on your shipment destination and weight will apply. 

Amazon S3 Charges
Standard Amazon S3 Request and Storage pricing applies. There is no Data Transfer charge for data transferred between AWS Import/Export and Amazon S3.

    
</entry>

<entry [Mon 2011:04:18 14:01:27 EST] IS YOUR DATA SAFE IN THE CLOUD? S3 AND RSS DETAILS>

PRICING AND DETAILS

http://aws.amazon.com/s3/


STANDARD S3 STORAGE
-------------------

Amazon S3’s standard storage is:
    Backed with the Amazon S3 Service Level Agreement.
    Designed to provide 99.999999999% durability and 99.99% availability of objects over a given year.
    Designed to sustain the concurrent loss of data in two facilities.

Reduced Redundancy Storage (RRS)
--------------------------------

The RRS option stores objects on multiple devices across multiple facilities, providing 400 times the durability of a typical disk drive, but does not replicate objects as many times as standard Amazon S3 storage, and thus is even more cost effective.

    Backed with the Amazon S3 Service Level Agreement.
    Designed to provide 99.99% durability and 99.99% availability of objects over a given year. This durability level corresponds to an average annual expected loss of 0.01% of objects.
    Designed to sustain the loss of data in a single facility.

Amazon S3 Functionality
-----------------------

    Write, read, and delete objects containing from 1 byte to 5 terabytes of data each. The number of objects you can store is unlimited.
    Each object is stored in a bucket and retrieved via a unique, developer-assigned key.

    A bucket can be stored in one of several Regions.
    
    Objects can be made private or public, and rights can be granted to specific users.

    Uses standards-based REST and SOAP interfaces designed to work with any Internet-development toolkit.

    Built to be flexible so that protocol or functional layers can easily be added. The default download protocol is HTTP. A BitTorrent™ protocol interface is provided to lower costs for high-scale distribution.
    
    
    
</entry>


<entry [Mon 2011:04:18 09:47:23 EST] FIXED DEAD MYSQL DBH AFTER FORK>


ADDED 'AutoInactiveDestroy' => 1 TO Agua::DBase::Mysql IN method initialise

	my $dsn = "DBI:mysql:$database";
    my $dbh = DBI->connect( $dsn, $user, $password, {	'PrintError' => 0, 'RaiseError' => 0, 'AutoInactiveDestroy' => 1 } );
	$self->dbh($dbh);

THEN DID undef ON DBH IN FORK AND exit IN Agua::Stage:runLocally:

    my $dbh = $self->dbobject()->dbh();
    undef $dbh;
    
        ... DO STUFF ...
    
    exit;

    
</entry>

<entry [Sun 2011:04:17 11:33:44 EST] ADMIN PAGE HELP>

LIST OF INSTANCE TYPES    

http://aws.amazon.com/ec2/instance-types


    
</entry>
<entry [Sun 2011:04:17 02:29:39 EST] CREATE S3 BUCKET WITH s3cmd>
    

s3cmd createbucket jgilbert-starcluster
s3cmd listbuckets
    
    
</entry>


<entry [Sun 2011:04:17 02:13:20 EST] COMPLETED THE CLUSTER TRIAD: cluster - clusterworkflow - clusterstatus>

Clusters.js
------------

MANAGE CLUSTER INSTANCE TYPE, AMI ID, AND MIN/MAX NODES, DESCRIPTION AND NOTES

    1. EACH CLUSTER IS UNIQUE WITHIN A USER'S GROUP OF CLUSTERS

    2. USERNAME:CLUSTER COMBINATIONS ARE UNIQUE TO Agua
    
    3. EACH CLUSTER HAS THE FOLLOWING FIXED PARAMETERS:
        
            INSTANCE TYPE (MICRO, SMALL, LARGE, ...)
            
            AMI ID (DEFAULT: ami-d1c42db8)
    
            MIN AND MAX NUMBER OF NODES

	
CREATE TABLE IF NOT EXISTS cluster
(
    username        VARCHAR(30) NOT NULL,
    cluster         VARCHAR(30) NOT NULL,
    minnodes        INT(12),
    maxnodes        INT(12),
    instancetype    VARCHAR(20),
    amiid           VARCHAR(20),
    description     TEXT,
    datetime        DATETIME NOT NULL,
    
    PRIMARY KEY (username, cluster)
);



    
CLUSTER METHODS TO Stages.js
-----------------------------

MANAGE ONE-TO-MANY MAPPINGS OF CLUSTERS WITH WORKFLOWS

DEFAULT: CLUSTER OF PRECEDING WORKFLOW IF DEFINED

DEFAULT INITIAL CLUSTER: SMALLCLUSTER

QUEUES:

    1. THERE IS ONE QUEUE FOR EACH WORKFLOW
    
    2. EACH CLUSTER CAN HAVE ONE OR MORE QUEUES

    3. EACH USERNAME:CLUSTER:PROJECT:WORKFLOW QUEUE IS USED BY A UNIQUE WORKFLOW


CREATE TABLE IF NOT EXISTS clusterworkflow
(
    username        VARCHAR(30) NOT NULL,
    cluster         VARCHAR(30) NOT NULL,
    project         VARCHAR(20) NOT NULL,
    workflow        VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (username, cluster, project, workflow)
);




ClusterStatus.js
----------------

DISPLAY CLUSTER INFORMATION: E.G., starcluster 

CALCULATE TOTAL NODE HOURS WITH CRON JOB POLLING EVERY 15 MINS

ENABLE CLUSTER SHUTDOWN IN INFOPANE


CREATE TABLE IF NOT EXISTS clusterstatus
(
    username        VARCHAR(30) NOT NULL,
    cluster         VARCHAR(30) NOT NULL,
    minnodes        INT(12),
    maxnodes        INT(12),
    status          VARCHAR(30),
    started         DATETIME NOT NULL,
    stopped         DATETIME NOT NULL,
    terminated      DATETIME NOT NULL,
    polled          DATETIME NOT NULL,
    hours           INT(12),
    
    PRIMARY KEY (username, cluster, queued)
);	


USE qhost TO MONITOR CLUSTER USAGE:

qhost

    HOSTNAME ARCH NCPU LOAD MEMTOT MEMUSE SWAPTO SWAPUS
    -------------------------------------------------------------------------------
    global - - - - - - -
    domU-12-31-38-00-A0-61 lx24-x86 1 0.00 1.7G 62.7M 896.0M 0.0
    domU-12-31-38-00-A2-43 lx24-x86 1 0.00 1.7G 47.8M 896.0M 0.0


The output shows the architecture (ARCH), number of cpus (NCPU), the current load (LOAD), total memory (MEMTOT), and currently used memory (MEMUSE) and swap space (SWAPTO) for each node.


USE qstat TO VIEW THE AVERAGE LOAD PER NODE:

qstat -f

    queuename qtype resv/used/tot. load_avg arch states
    ---------------------------------------------------------------------------------
    all.q@domU-12-31-38-00-A0-61.c BIP 0/0/1 0.00 lx24-x86
    ---------------------------------------------------------------------------------
    all.q@domU-12-31-38-00-A2-43.c BIP 0/0/1 0.00 lx24-x86
    sgeadmin@domU-12-31-38-00-A0-61:~$



    
</entry>

<entry [Fri 2011:04:15 10:39:57 EST] CREATED aguatest DATABASE AND USED IN workflow.stages.html >

OBJECTIVE: TEST WORKFLOW COMBOBOX ADD/DELETES RETAIN WORKFLOW NUMBER INTEGRITY

1. DUMPED agua

mysqldump -u root -p agua > /home/syoung/0.6/t/html/plugins/workflow/aguatest.dump

2. CREATE aguatest DATABASE

    
</entry>

<entry [Wed 2011:04:13 18:16:26 EST] INSTALLED SchedulerSGE FOR MORE ROBUST GRABBING OF JOBID>

*** BUT IN THE END, DECIDED TO GO WITH EXISTING BACKTICKS APPROACH WITHOUT
*** FAILURE MODE (USE FIRST NEW JOB IN THE QSTAT LIST - RISKY IF A LOT OF
*** JOBS ARE BEING LAUNCHED CONCURRENTLY)


SGE Modules
http://cpan.uwinnipeg.ca/htdocs/ScheduleSGE/README.html

These are light-weight modules designed to submit jobs to the Sun Grid Engine, and query the status of the engine. There are more comprehensive modules available in DRMAA. The alternate module, DRMAA, relies on Swig and a bunch of C code. This is a pure perl implementation of an interface to SGE. The required commands are qsub, qdel, and qstat that should be supplied by SGE.

Environment Variables

The following environment variables should probably be set. The values below are the defaults for my system, an Orion cluster

        SGE_CELL                =>  "orionmulti"
        SGE_EXECD_PORT          =>  537
        SGE_QMASTER_PORT        =>  536
        SGE_ROOT                =>  /opt/sge
These are set at the beginning of SGE.pm

There are currently four modules, SGE that is the glue, SGE::Run allows you to submit jobs to the SGE. SGE::Control for starting/stopping/deleting jobs, and SGE::Status for seeing what the cluster is currently up to. You should be able to use SGE; in your script and have all methods available to yo  

Methods should be documented with perldoc.

This has only been tested on an Orion 12-node desktop cluster. I would be happy to crash test it on any other clusters, just give me a login or send me a cluster to use.

Version History

0.01 April 2005. Initial release to the wild 0.02 October 2005. Received these excellent comments from Hinri Kerstens:

        Thank you for writing the ScheduleSGE perl module. When using this
        module I found two 'mismatches' between your system and mine.
        - My SGE version (5.3) returns "your job" instead of "Your job" after
        submission of a job. Maybe you can make line 233 of Run.pm tolerant for
        that.
        - The CPAN documentation claims that a jobID can be grabbed by  "my
        $pid=$sge->job_id;", but job_id doesn't exist in the modules. It should
        be "my $pid=$sge->execute;" isn't it?
        
        After these modifications the module runs happily, so keep on the good
        work.
        
        regards
        
        Hinri
    
</entry>
<entry [Tue 2011:04:12 04:02:07 EST] INCORPORATED Monitor::SGE.pm INTO CLUSTER>


#### pegasus
alias peg='ssh syoung@pegasus.ccs.miami.edu'

#### hot perms                                                                              alias hot='find ./ -type d -exec chown syoung:www-data {} \;; find ./ -type d -exec chmod 0775 {} \;; find ./ -type f -exec chmod 0664 {} \;'

# GRID ENGINE ENVIRONMENT VARIABLES                                                         export SGE_ROOT=/var/lib/gridengine
export SGE_QMASTER_PORT=701
export SGE_EXECD_PORT=702


#### RUN TOPHAT
alias runtop='/home/syoung/0.6/bin/apps/expression/TOPHAT.pl --cpus 3 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --label yoruba --matefil\
es /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt --outputdir /nethome/syoung/agua/Project1/Workflow1 --queue default --reference /nethome/syoung/agua/Project1/Workflow1\
/chr22 --species human'

alias runt='/home/syoung/0.6/bin/apps/expression/TOPHAT.pl    arguments: --cpus 3 --distance 200 --inputfiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.txt --label yoruba --matefiles /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.txt --outputdir /nethome/syoung/agua/Project1/Workflow1 --reference /nethome/syoung/agua/Project1/Workflow1/chr\
22 --species human 1> /nethome/syoung/agua/Project1/Workflow1/.stdout/TOPHAT.stdout 2> /nethome/syoung/agua/Project1/Workflow1/.stderr/TOPHAT.stderr'


alias run="echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","workflownumber":1,"mode":"executeWorkflow","number":"1","queue":"default"}' | ./workflow.cgi"


CREATED Jobs::getIndex() TO REPLACE SCATTERED COPIES OF INDEX SETTING CODE

Jobs::setBatchJob	

	#### SET INDEX PATTERN FOR BATCH JOB
	my $task;
	$task = "\$LSB_JOBINDEX" if $cluster eq "LSF";
    ...

	#### SET DIRS
	my $scriptdir = "$outputdir/scripts";
	my $stdoutdir = "$outputdir/stdout/$task";
	my $lockdir = "$outputdir/lock/$task";

	$self->createTaskDirs("$outputdir/$task", $number);
	$self->createTaskDirs($scriptdir, $number);
	$self->createTaskDirs($stdoutdir, $number);
	$self->createTaskDirs($lockdir, $number);

	#### SET FILES IF NOT DEFINED
	my $scriptfile = "$scriptdir/$label.sh";
	my $stdoutfile = "$stdoutdir/$label-stdout.txt";
	my $stderrfile = "$stdoutdir/$label-stderr.txt";
	my $lockfile = "$lockdir/$label-lock.txt";

Jobs::createTaskDirs {

	#### CREATE DIRS	
	for my $task ( 1..$number )
	{
		my $dir = $directory;
		$dir =~ s/\$LSB_JOBINDEX/$task/g;
		$dir =~ s/\$PBS_TASKNUM/$task/g;
		$dir =~ s/\$SGE_TASK_ID/$task/g;


Jobs::printSgeScriptfile {

	#### ! IMPORTANT !
	#### NEEDED BECAUSE EXEC NODES NOT FINDING $SGE_TASK_ID
#	print SHFILE qq{export TASKNUM=\${SGE_TASK_ID}\n\n};
	print SHFILE qq{export TASKNUM=\$(expr \$SGE_TASK_ID)\n\n};




Merge::sortSubdirSam {

	#### SET INDEX PATTERN FOR BATCH JOB
	my $index;
	$index = "\$LSB_JOBINDEX" if $cluster eq "LSF";
	$index = "\$PBS_TASKNUM" if $cluster eq "PBS";
	$index = "\$SGE_TASK_ID" if $cluster eq "SGE";


Merge::subdirSamHits {

	#### SET INDEX PATTERN FOR BATCH JOB
	my $index;
	$index = "\$LSB_JOBINDEX" if $cluster eq "LSF";
	$index = "\$PBS_TASKNUM" if $cluster eq "PBS";
    $index = "\$SGE_TASK_ID" if $cluster eq "SGE";



Usage::usageStats {

				my $file = $stdoutfile;
				$file =~ s/\$LSB_JOBINDEX/$task/g;
				$file =~ s/\$PBS_TASKNUM/$task/g;
                
				my $hash = $self->parseUsagefile($file);
		
Usage::printUsage {
		
	$outputdir =~ s/\\\$LSB_JOBINDEX//;




Checker::checkStatus  

			$index = "\\\$LSB_JOBINDEX" if $cluster eq "LSF";
				my $lock = $lockfile;
				$lock =~ s/\\$index/$task/;
				my $check = $checkfile;
				$check =~ s/\\$index/$task/;

Checker::batchCheckfile

	$index = "\$LSB_JOBINDEX" if $cluster eq "LSF";

Checker::printCheckLog

	$outdir =~ s/\/\$LSB_JOBINDEX//g;
	
				$check->{lockfile} =~ s/\$LSB_JOBINDEX/$task/g;
				$check->{checkfile} =~ s/\$LSB_JOBINDEX/$task/g;

    
</entry>

<entry [Wed 2011:04:06 11:18:40 EST] LOCALISATION @BABELZILLA>

https://addons.mozilla.org/en-US/firefox/addon/firesteg/
Additionally, I have revamped the user interface and added localization support for SEVEN new languages: German, Spanish, French, Japanese, Polish, Brazilian Portuguese, and Turkish. Many thanks to the folks at Babelzilla for providing the translations.
    
</entry>

<entry [Thu 2011:03:31 10:47:13 EST] BLOCK IP ADDRESS>
	
iptables -I INPUT -s 10.136.60.189 -j DROP
	
</entry>

