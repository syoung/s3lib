project.agua.dojo


<entry [Sun 2011:03:20 01:48:53 EST] INSTALLED FIREUNIT FIREBUG EXTENSION FOR UNIT TESTING>
  
  
http://fireunit.org/  


(Once you have the extension installed, open the new Test tab in Firebug to see some results.)


</entry>

<entry [Sun 2011:03:20 01:39:23 EST] SEPARATE INSTALL OF FIREFOX 4.0>
    

Firefox 4 beta version install by default in their own program folder (e.g. C:\Program files\Mozilla Firefox 4.0 Beta 8\) and do not replace the current Firefox 3.6.x installation.
You should create a new profile exclusively for the 4.0 beta version and create a desktop shortcut with -P "profile" appended to the target to launch that profile to avoid the Firefox 4 beta version from using the Firefox 3.6.x profile.
http://kb.mozillazine.org/Testing_pre-release_versions
http://kb.mozillazine.org/Creating_a_new_Firefox_profile_on_Windows
http://kb.mozillazine.org/Shortcut_to_a_specific_profile
http://kb.mozillazine.org/Using_multiple_profiles_-_Firefox
Reply

    
    
rguglomo
2 months ago
Will FF4 install separately from 3.6.13?

I do not want FF4 to be my only browser. So can I have a separate installation of FF4 and keep 3.6.13 running as my main browser.

3 people have this problem
0 new this week
Get email updates
Subscribe to feed
System Details
Windows 7
Firefox 3.6.13
More system details...
Tags
beta general Firefox 3.6.13 Firefox 3.6 Windows 7
1 reply Post a Reply

cor-el
1294 solutions
20006 answers
2 months ago
Firefox 4 beta version install by default in their own program folder (e.g. C:\Program files\Mozilla Firefox 4.0 Beta 8\) and do not replace the current Firefox 3.6.x installation.
You should create a new profile exclusively for the 4.0 beta version and create a desktop shortcut with -P "profile" appended to the target to launch that profile to avoid the Firefox 4 beta version from using the Firefox 3.6.x profile.
http://kb.mozillazine.org/Testing_pre-release_versions
http://kb.mozillazine.org/Creating_a_new_Firefox_profile_on_Windows
http://kb.mozillazine.org/Shortcut_to_a_specific_profile
http://kb.mozillazine.org/Using_multiple_profiles_-_Firefox
Reply
    
</entry>

<entry [Sat 2011:03:19 15:07:43 EST] DOH DND TESTING>

INTRO
http://dojotoolkit.org/reference-guide/util/dohrobot.html    


TEST CODE
http://bugs.dojotoolkit.org/browser/dojo/trunk/tests/dnd/test_dnd.html?rev=14751

    
</entry>


<entry [Fri 2011:03:18 16:34:19 EST] ADDED DOWNLOAD RESPONSE ON 'FILE NOT FOUND'>
    
http://www.mikejuniper.com/2009/03/fun-with-dojoioiframesend/    

dojo expects the response to be an html document. And if you want to return anything other than an html document (json or text for example), you must wrap it in an html textarea. Dojo will look inside the first textarea in the response document and return to your handle, load, or error functions whatever it finds there in the format you specified in handleAs (defaulting to text if you did not specify one).


http://dojotoolkit.org/reference-guide/dojo/io/iframe.html

    
</entry>


<entry [Tue 2011:03:15 13:08:41 EST] DOH TEST TEMPLATE>



dojo-1.5.0/dijit/tests/robot/TitlePane.html
	
	
</entry>

<entry [Tue 2011:03:15 18:34:05 EST] FIXED PROJECT FileInfoPane NO FILE SAMPLE BUG>

SUMMARY: RETURN EARLY FROM _setContentAndScroll (SEE BELOW)

ONCLICK FILE (NOT FOLDER) ICON:

item: { "name": ...

	FileDrag._getPaneForItem(item, parentPane, children)

		FileDrag.getPaneForItem : function(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
		RETURNS files._GroupDragPane OR _files.FileInfoPane:
			widget: [Widget plugins.files._FileInfoPane, plugins_files__FileInfoPane_0]
			insertIndex : 1

		FileDrag.addChild(/*Widget*/ widget, /*int?*/ insertIndex)
			FileDrag._removeAfter(/*Widget or int*/ idx)
			FileDrag.addChild    this.inherited(arguments)
				dojox.widget.RollingList.addChild(widget, insertIndex)
					FileDrag._removeAfter(/*Widget or int*/ idx)
					dojox.widget.RollingList.addChild    this.inherited(arguments)
					agua dijit._Container.addChild dijit._Container.addChild(widget, insertIndex)
						dojo.place(widget.domNode, refNode, insertIndex)
						widget.startup(); // NOW USING FileInfoPane (I.E.: this)
							dojox.widget.RollingListPane.startup dojox.widget.RollingLIstPane.startup()
								this.inherited(arguments)
								dijit.layout.ContentPane.startup()
									this._childOfLayoutWidget: undefined
									this._onShow();  ==> checks store loaded
										*** NO RETURN TO dijit.layout.ContentPane.startup
										dojox.widget.RollingListPane._onShow dojox.widget.RollingListPane._onShow()

											this.refresh()
												dijit.layout.ContentPane.refresh() // [Re]download contents of href and display
													this._load()
														dojox.widget.RollingListPane._load()
															window.setTimeout(dojo.hitch(this, "_doQuery"), 1);
															this._setContentAndScroll("<span class='dijitContentPaneLoading'>Loading...</span>", true)
																files._FileInfoPane._setContentAndScroll(cont, isFakeContent)
																		this._setContent(cont, isFakeContent);



RETURN EARLY FROM _setContentAndScroll:

	_setContentAndScroll: function(/*String|DomNode|Nodelist*/cont, /*Boolean?*/isFakeContent){
	// OVERRIDE TO AVOID this._setContent
	
	// summary: sets the value of the content and scrolls it into view
	
		console.log("files._FileInfoPane._setContentAndScroll    files._FileInfoPane._setContentAndScroll(cont, isFakeContent)");
		console.log("files._FileInfoPane._setContentAndScroll    BEFORE this._setContent");
	
	return;
	
		this._setContent(cont, isFakeContent);
		console.log("files._FileInfoPane._setContentAndScroll    AFTER this._setContent");
	
		this.parentWidget.scrollIntoView(this);
	},



TO AVOID NODE BEING DESTROYED LATER:

dijit.layout.ContentPane.destroyDescendants dijit.layout.ContentPane.destroyDescendants()
dijit.layout.ContentPane.destroyDescendants BEFORE if (setter)
dijit.layout.ContentPane.destroyDescendants AFTER if (setter)








Error: Unable to load ../../cgi-bin/agua/0.6/

project.cgi "mode=copyFile&sessionId=9999999999.9999.999&username=syoung&file=Project2/Workflow2&destination=Project2/Workflow1

Line 0

TEST COPY

./project.cgi "mode=copyFile&sessionId=9999999999.9999.999&username=syoung&file=Project2/Workflow2&destination=Project2/Workflow1&modifier=status"


TEST COPY FILE
./project.cgi "mode=copyFile&sessionId=9999999999.9999.999&username=syoung&file=Project1/Workflow1/out&destination=Project2/Workflow1"


TEST CREATE FOLDER IN Project.js

./project.cgi  "mode=newFolder&sessionId=9999999999.9999.999&username=syoung&folderpath=Project1/TEST3/test"



TWO TWEAKS:

1. OVERRIDE dojox.widget.RollingList._setContentAndScroll TO EXIT BEFORE CALL TO scrollIntoView

plugins.files.FileDrag OVERRIDES _setContentAndScroll IN dojox.widget.RollingList:

	
	_setContentAndScroll: function(/*String|DomNode|Nodelist*/cont, /*Boolean?*/isFakeContent){
		return;  <== HERE

		//this.parentWidget.scrollIntoView(this);
	},


2. OVERRIDE plugins.files._GroupDragPane.onItem TO SKIP CALL TO inherited

		...	
		this.containerNode.innerHTML = "";		
		this.containerNode.appendChild(this.menuNode);
		this.parentWidget.scrollIntoView(this);
		
	return;
	
		console.log("plugins.files._GroupDragPane.onItems    BEFORE this.inherited(arguments)");
		this.inherited(arguments);
		console.log("plugins.files._GroupDragPane.onItems    AFTER this.inherited(arguments)");
	},



	
	
</entry>


<entry [Thu 2011:03:17 20:36:05 EST] DND ONDROP/ONSTART SUBSCRIPTIONS>


USE THE FOLLOWING CODE IN ANY MODULES THAT USES DND:


//	 DEBUG:		
	dojo.subscribe("/dnd/drop", function(source,nodes,iscopy){
	
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') function(source,nodes,iscopy) activated");
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') source: " + source);
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') iscopy: " + iscopy);
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') nodes: " + nodes);
			var node = nodes[0];
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') node: ");
			console.dir(node);
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') node.id: " + node.id);
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') node.data: " + dojo.toJson(node.data));
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') node.type: " + node.type);
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') node.innerHTML: " + node.innerHTML);
			
			
			var target = dojo.dnd.manager().target;
				console.log("FileDrag.startup	dojo.subscribe('/dnd/drop') target: ");
		console.dir(target);
	
	  code to perform some action
	  
	});



	dojo.subscribe("/dnd/start", function(source,nodes,iscopy){
	  code to perform some action		
	
			console.log("FileDrag.startup	dojo.subscribe('/dnd/start') function(source,nodes,iscopy) activated");
	
	});
	
	dojo.subscribe("/dnd/source/over", function(source){
	
	  code to perform some action	
			console.log("FileDrag.startup	dojo.subscribe('/dnd/source/over') function(source) activated");
	
	});
	
	dojo.subscribe("/dnd/cancel", function(){
	
	  code to perform some action	
			console.log("FileDrag.startup	dojo.subscribe('/dnd/cancel') function() activated");
	
	});    


</entry>


<entry [Mon Oct 11 02:06:33 EDT 2010] LOCATION OF JBROWSE FEATURE TRACK FILES FOR HUMAN HG19 CHROMOSOMES>

/data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/data/tracks


ll /data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/

	drwxr-xr-x 3 syoung bioinfo 4.0K Oct  4 22:56 control1-jbrowse
	-rw-r--r-- 1 syoung bioinfo 281M Oct 10 13:23 control1-jbrowse.tar.gz
	-rw-r--r-- 1 syoung bioinfo 615M Oct 10 11:20 control2-jbrowse.tar.gz
	drwxr-xr-x 3 syoung bioinfo 4.0K Oct  9 01:33 data
	drwxr-xr-x 3 syoung bioinfo 4.0K Oct  4 22:43 test1-jbrowse
	-rw-r--r-- 1 syoung bioinfo  41M Oct 10 13:20 test1-jbrowse.tar.gz
	drwxr-xr-x 3 syoung bioinfo 4.0K Oct  4 22:44 test2-jbrowse
	-rw-r--r-- 1 syoung bioinfo  45M Oct 10 10:55 test2-jbrowse.tar.gz
	drwxrwxrwx 3 syoung bioinfo 4.0K Jun 30 09:07 users



ll /data/agua/0.5/html/plugins/view/jbrowse/species/human/hg19/data/tracks/chr1

	drwxr-xr-x  2 syoung bioinfo  12K Jun 16 16:20 Affy_Exon_Probes
	drwxr-xr-x  2 syoung bioinfo 4.0K Jun 16 16:20 CCDS
	-rw-r--r--  1 syoung bioinfo 9.4M Oct  9 00:32 control1.tar.gz
	-rw-r--r--  1 syoung bioinfo 8.0M Oct  9 00:41 control2.tar.gz
	drwxr-xr-x  2 syoung bioinfo 4.0K Jun 16 16:20 CpG_Island
	drwxr-xr-x  2 syoung bioinfo 4.0K Jun 16 16:20 Encode_Common_CNV
	drwxr-xr-x  2 syoung bioinfo 4.0K Jun 16 16:20 Exapted_Repeats
	drwxr-xr-x  2 syoung bioinfo  20K Jun 16 16:21 Genome_Variant
	drwxr-xr-x  2 syoung bioinfo  12K Jun 16 16:21 Hapmap_LD_Phased
	drwxr-xr-x  2 syoung bioinfo  20K Jun 16 16:22 Hapmap_SNP
	drwxr-xr-x  2 syoung bioinfo  20K Jun 16 16:24 Interrupted_Repeats
	drwxr-xr-x  2 syoung bioinfo  20K Jun 16 16:24 Intrrepts327
	drwxr-xr-x  2 syoung bioinfo 4.0K Jun 16 16:25 Microsatellite
	drwxr-xr-x  2 syoung bioinfo 4.0K Jun 16 16:25 PolyA
	drwxr-xr-x  2 syoung bioinfo  20K Jun 16 16:24 Repeat_Masker
	drwxr-xr-x  2 syoung bioinfo 4.0K Jun 16 16:24 Segmental_duplication
	drwxr-xr-x  2 syoung bioinfo 4.0K Oct  9 01:26 temp
	drwxr-xr-x  2 syoung bioinfo  20K Oct  4 22:41 test1
	-rw-r--r--  1 syoung bioinfo 209K Oct  9 00:30 test2.tar.gz




[syoung@ngsdev chr1]$ du -hs *

3.9M    Affy_Exon_Probes
1.4M    CCDS
9.4M    control1.tar.gz
8.0M    control2.tar.gz
80K     CpG_Island
12K     Encode_Common_CNV
36K     Exapted_Repeats
8.0M    Genome_Variant
7.1M    Hapmap_LD_Phased
9.3M    Hapmap_SNP
8.2M    Interrupted_Repeats
9.1M    Intrrepts327
104K    Microsatellite
96K     PolyA
14M     Repeat_Masker
148K    Segmental_duplication
248K    temp
30M     test1
216K    test2.tar.gz





 ll /data/jbrowse2/data/tracks/chr1



CHECK DISC USAGE ON NGSDEV

du -hs * bin data etc lib media mnt opt sys var boost dev home lib64 net root snmp tmp zlib boot du.txt lost+found misc nethome proc sbin srv usr 




</entry>

<entry [Sun Oct 10 02:15:13 EDT 2010] AGUA URLS AND USEFUL DOJO WIDGETS>


GITHUB HOMEPAGE
http://syoung.github.com/agua/


BACKED UP DB TO 0.5:
perl E:/0.5/bin/scripts/saveDb.pl --db agua --outputdir E:/0.5/bin/sql/0.5


RSS FEED
http://localhost/agua/0.5/dojo.1.4.2/dojox/widget/tests/test_PortletInGridContainer.html


SEQANSWERS RSS FEED
http://seqanswers.com/forums/showthread.php?t=56


USE FOR SPLASH SCREEN
http://localhost/agua/0.5/dojo.1.4.2/dojox/widget/tests/test_Standby.html


ZOOM CHART USING SLIDER
http://localhost/agua/0.5/dojo.1.4.2/dojox/widget/tests/test_PortletInGridContainer.html




</entry>

<entry [Sat Oct  9 10:35:41 EDT 2010] FIXED ERROR WITH LOADING hist-*-.json FILES>



PROBLEM

WRONG URL FOR HIST JSON FILES:

http://localhost/agua/0.5/data/tracks/chr1/Affy_Exon_Probes//hist-5000-0.json


GIVES THIS ERROR:

Error: Unable to load data/tracks/chr1/Affy_Exon_Probes//hist-5000-0.json status:404
http://localhost/agua/0.5/builds/005/dojo/agua.js.uncompressed.js
Line 25647


SOLUTION

ADD TO LINE 109 IN FeatureTrack.js

			
			// PASS BROWSER BASE URL TO LAZY ARRAY			
			,
			this.baseUrl

			
ADD TO LINE 90 IN LazyArray.js

                if ( param != null || param != "" )
                {
                    url = param + url;
                }

        console.log("LazyArray.prototype.range    url: " + url);






</entry>

<entry [Sun Oct  3 10:35:41 EDT 2010] SUCCESSFUL TEST OF DYNAMIC USE FOR Monitor::LSF ON kronos-x AND pegasus>


1. CREATE MODULE

emacs TestMe.pm

package TestMe;


sub test
{
    print "package TestMe.pm loaded\n";
}


1;



2. CREATE SCRIPT

emacs testMe.pl

#!/usr/bin/perl -w

use strict;

print "testMe.pl\n";

use lib "../../lib";


#use TestMe;
if ( eval "require TestMe" )
{
    print "Successful require\n";
    TestMe::test();    
}
else
{
    print "Can't require Testme\n";
}

print "Completed $0\n";



3. RUN TESTS

FAILS CORRECTLY WHEN TestMe MODULE IS MISSING:

mv TestMe.pm TestMeXXX.pm

./testMe.pl 
testMe.pl
Can't require Testme
Completed ./testMe.pl


LOADS CORRECTLY WHEN TestMe MODULE IS PRESENT:

./testMe.pl 
testMe.pl
Successful require
package TestMe.pm loaded
Completed ./testMe.pl



</entry>


<entry [Tue Sep 21 15:34:25 EDT 2010] AUTOMATED BUILD ENVIRONMENT FOR BIOINFORMATICS CLOUD IMAGES>


http://bcbio.wordpress.com/2010/05/08/automated-build-environment-for-bioinformatics-cloud-images/


Blue Collar Bioinformatics
Automated build environment for Bioinformatics cloud images
with 14 comments

Amazon web services provide scalable, on demand computational resources through their elastic compute cloud (EC2). Previously, I described the goal of providing publicly available machine images loaded with bioinformatics tools. I'm happy to describe an initial step in that direction: an automated build system, using easily editable configuration files, that generates a bioinformatics-focused Amazon Machine Image (AMI) containing packages integrated from several existing efforts. The hope is to consolidate the community's open source work around a single, continuously improving, machine image.

This image incorporates software from several existing AMIs:

JCVI Cloud BioLinux  JCVI's work porting Bio-Linux to the cloud.
bioperl-max  Fortinbras' package of BioPerl and associated informatics tools.
MachetEC2  An InfoChimps image loaded with data mining software.
Each of these libraries inspired different aspects of developing this image and associated infrastructure, and I'm extremely grateful to the authors for their code, documentation and discussions.

The current AMI is available for loading on EC2  search for CloudBioLinux' in the AWS console; or just use the name, ami-879c75ee. The data mining and bioinformatics libraries are installed on a 32-bit Ubuntu 10.04 Lucid image. Automated scripts and configuration files with contained packages are available as a GitHub repository.

Contributions encouraged
This image is intended as a starting point for developing a community resource that provides biology and data-mining oriented software. Experienced developers should be able to fire up this image and expect to find the same up to date libraries and programs they have installed on their work machines. If their favorite package is missing it should be quick and easy to add, making the improvement available to future developers.

Achieving these goals requires help and contributions from other programmers utilizing the cloud  everyone reading this. The current image is ready to be used, but is more complete in areas where I normally work. For instance, the Python and R libraries are off to a good start. I'd like to extend an invitation to folks with expertise in other areas to help improve the coverage of this AMI:

Programmers: help expand the configuration files for your areas of interest:

Perl CPAN support and libraries
Ruby gems
Java libraries
Haskell hackage support and libraries
Erlang libraries
Bioinformatics areas of specialization:
Next-gen sequencing
Structural biology
Parallelized algorithms
Much more Let us know what you are interested in.
Documentation experts: provide cookbook style instructions to help others get started.

Porting specialists: The automation infrastructure is dependent on having good ports for libraries and programs. Many widely used biological programs are not yet ported. Establishing a Debian or Ubuntu port for a missing program will not only help this effort, but make the programs more widely available.

Systems administrators: The ultimate goal is to have the AMI be automatically updated on a regular basis with the latest changes. We'd like to set up an Amazon instance that pulls down the latest configuration, populates an image, builds the AMI, and then updates a central web page and REST API for getting the latest and greatest.

Testers: Check that this runs on open source Eucalyptus clouds, additional linux distributions, and other cloud deployments.

If any of this sounds interesting, please get in contact. The Cloud BioLinux mailing list is a good central point for discussion.

Infrastructure overview
In addition to supplying an image for downstream use, this implementation was designed to be easily extendible. Inspired by the MachetEC2 project, packages to be installed are entered into a set of easy to edit configuration files in YAML syntax. There are three different configuration file types:

main.yaml  The high level configuration file defining which groups of packages to install. This allows a user to build a custom image simply by commenting out those groups which are not of interest.

packages.yaml  Defines debian/ubuntu packages to be installed. This leans heavily on the work of DebianMed and Bio-Linux communities, as well as all of the hard working package maintainers for the distributions. If it exists in package form, you can list it here.

python-libs.yaml, r-libs.yaml  These take advantage of language specific ways of installing libraries. Currently implemented is support for Python library installation from the Python package index, and R library installation from CRAN and Bioconductor. This will be expanded to include support for other languages.

The Fabric remote automated deployment tool is used to build AMIs from these configuration files. Written in Python, the fabfile automates the process of installing packages on the cloud machine.

We hope that the straightforward architecture of the build system will encourage other developers to dig in and provide additional coverage of program and libraries through the configuration files. For those comfortable with Python, the fabfile is very accessible for adding in new functionality.

If you are interested in face-to-face collaboration and will be in the Boston area on July 7th and 8th, check out Codefest 2010; it'll be two enjoyable days of cloud informatics development. I'm looking forward to hearing from other developers who are interested in building and maintaining an easy to use, up to date, machine image that can help make biological computation more accessible to the community.



</entry>
<entry [Tue Sep 21 15:34:25 EDT 2010] DOJO 1.5.0 WORKS FINE AND HAS THESE INTERESTING DEMOS>


CROP IMAGES
http://localhost/agua/0.5/dojo-1.5.0/demos/cropper/demo.html


UPLOADER
http://localhost/agua/0.5/dojo-1.5.0/demos/uploader/demo.html


SURVEY
http://localhost/agua/0.5/dojo-1.5.0/demos/survey/demo.html


DOJO EDITOR
http://localhost/agua/0.5/dojo-1.5.0/demos/editor/demo.html

MOJO

http://localhost/agua/0.5/dojo-1.5.0/demos/mojo/demo.html


GRAPHS & FONTS & COMIC-STYLE

VECTOR FONTS
http://localhost/agua/0.5/dojo-1.5.0/demos/fonts/charts.html

NEWSPAPER
http://localhost/agua/0.5/dojo-1.5.0/demos/fonts/demo.html




</entry>

<entry [Tue Sep 21 14:09:35 EDT 2010] DEBUGGING NO RESPONSE FROM workflow.cgi CALL TO EXECUTE WORKFLOW ON NGSDEV>

perl /data/agua/0.5/cgi-bin/putrelay.pl syoung "perl /data/agua/0.5/cgi-bin/workflow.pl < /tmp/workflow-temp.-json



echo '{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":"1"}' | perl -U workflow.cgi


Content-type: text/html

workflow.cgi     input: {"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":"1"}
workflow.cgi     username: syoung
workflow.cgi     relay script: /data/agua/0.5/cgi-bin/putrelay.pl
workflow.cgi    user_query: username=syoung&sessionId=1228791394.7868.158
workflow.cgi    run_command: perl /data/agua/0.5/cgi-bin/user.pl "username=syoung&sessionId=1228791394.7868.158"
workflow.cgi    as_user: syoung
workflow.cgi     setown_command: chown syoung /data/agua/0.5/cgi-bin/putrelay.pl
workflow.cgi     setuid_command: chmod u+s /data/agua/0.5/cgi-bin/putrelay.pl
workflow.cgi     setgid_command: chmod g+s /data/agua/0.5/cgi-bin/putrelay.pl
workflow.cgi     tempfile: /tmp/workflow-temp.-json
workflow.cgi     Temp file contents:
{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":"1","asuser":"syoung"}
workflow.cgi     command: perl /data/agua/0.5/cgi-bin/putrelay.pl syoung "perl /data/agua/0.5/cgi-bin/workflow.pl < /tmp/workflow-temp.-json"
workflow.cgi     run_command: perl /data/agua/0.5/cgi-bin/putrelay.pl syoung "perl /data/agua/0.5/cgi-bin/workflow.pl < /tmp/workflow-temp.-json"



perl /data/agua/0.5/cgi-bin/putrelay.pl syoung "perl /data/agua/0.5/cgi-bin/workflow.pl < /tmp/workflow-temp.-json"



RUNNING OKAY ON KRONOS BUT DOES NOT DISPLAY AS RUNNING ON AGUA






</entry>

<entry [Tue Sep 21 14:08:35 EDT 2010] INTRO EXAMPLE>


dijit.Editor: A rich text editor for the new web.
+- The Editor at a Glance
Then and Now

Back in the early days of the web, applications that required user input had only a small set of input fields that were understandable by Web browsers. These consisted of single-line text boxes, check boxes, and the multi-line text area. This was fine when the majority of the users of the web was technical. For example, they could still perform tasks such as editing of formatted documents by using plain text and a series of patterns of characters that indicated the structure of the document. The most common was then, and still is, HTML.

Fast forward a few years. The web has gone main stream. It is no longer the case that the majority of the users of the web are technical. Today the web is visited by people of every imaginable skill, education level, and life experience. Therefore, applications now need to provide interfaces that meet the needs of all those groups. Instead of editing raw text and markup, it is far more convenient for most users to work with "Word Processor" style document editing. It is far simpler for, say, a grandmother to make some text bold by just selecting it and clicking on a "bold" button, than it is for her to know cryptic series of characters have to be put around text in order for it to be processed as bold.

Simply put, if you want to expand the reach and usability of your applications that allow document-style input on the web, then you need a Rich Text Editor. The Dojo Toolkit Rich Text Editor is designed to meet the requirements of many of these applications. It is a flexible, pluggable, editor that can expose as few, or as many, editing features as your application may require. The following list provides a quick overview of the powerful capabilities of the Dojo Toolkit Rich Text Editor.

Features

   1. Provides Rich Text (word processor-like), editing of HTML documents.
   2. Provides a large selection of built-in actions. The default rich text editor of the dojo toolkit provides built-in commands for nearly all the common word processor type actions, such as bold, italic, underline, strikethrough, superscript, subscript, indent, delete, insert, and so on.
   3. Provides cross-browser support. The RTE capabilities of browsers vary in what they provide and how they are set up. The dijitEditor abstracts this away and provides a single way to create a rich-text editing field in your pages.
   4. Provides built-in filtering support. The editor provides hooks to register HTML and DOM filters with the editor, to pre and post process data going in, or coming out of, the document being edited.
   5. Provides a pluggable architecture. The editor's functionality is not limited to the set provided by the Dojo toolkit. It can be extended by implementing plugins, following the "dijit._editor.Plugin" interface. In fact, all the base commands of editor are implemented as instances of that plugin interface. The plugin architecture makes it relatively easy to add new buttons and actions to the toolbar as well as 'headless plugins', which simply register filters or augments existing actions.


More Information

For more information, refer to the online documentation.
+- Enhanced in dojo 1.4+. New Icons!

The graphics of the dijit.Editor, while functional, looked dated and not as professional as the Dojo development community would like. One of the major initiatives of the Dojo Toolkit 1.4 was to polish the rough edges of Dojo and really make it look first class. So naturally the Editor icons were looked at and completely revamped! With the help of several of our corporate citizens, we reworked the basic icon set into cleaner, more explanatory, images for all the default actions and even some new ones. The end result was a much more professional look to our editor. We're pleased with the results and I think you will be too. Just look below to see a small example of the transformation!

Icons From Old to New: The editor never looked better!

Example Graphics

And of course if the icon styles do not fit your application, the Editor can be re-skinned to icons of your choosing. Take a look at one of the theme files, such as dijit/themes/tundra/editor.css for examples on how to define styles to replace the editor icons with ones of your choosing.
+- Enhanced in dojo 1.4+. Link Dialog!
+- Enhanced in dojo 1.4+. Font Choice!
+- New in dojo 1.4+! Go Full Screen!
+- New in dojo 1.4+! View Source!
+- New in dojo 1.4+! Many, many, more!
-
	



</entry>


<entry [Sat Sep 11 12:29:08 EDT 2010] ADDED STANDBY TO WORKFLOW PLUGIN>

WORKS BUT ONLY APPEARS AFTER WHOLE WORKFLOW HAS LOADED...

NB: MUST ADD THIS TO MAKE IT APPEAR

		document.body.appendChild(standby.domNode);


PLACED IN plugins.Workflow.startup :


	// START UP CHILD PANES
	startup : function ()
	{
		//console.log("Workflow.startup    plugins.workflow.Workflow.startup()");

		// SET UP THE ELEMENT OBJECTS AND THEIR VALUE FUNCTIONS
		this.inherited(arguments);

		// ADD THE PANE TO THE TAB CONTAINER
		////console.log("Workflow.startup    this.mainTab: " + this.mainTab);
		this.attachWidget.addChild(this.mainTab);
		this.attachWidget.selectChild(this.mainTab);


// START STANDBY
dojo.require("dojox.widget.Standby");


        var standby = new dojox.widget.Standby({
            target: Agua.tabs.containerNode
        });
		document.body.appendChild(standby.domNode);

		console.log("plugins.Workflow.createTab    Doing standby.show()");
        standby.show();



		// EXPAND LEFT PANE (WAS CLOSED SO THAT RIGHT PANE WOULD RENDER)
		this.leftPaneExpando.toggle();

		// SET APPLICATIONS DRAG SOURCE (LEFT PANE)
		this.setApps();

		// SET WORKFLOWS DROP TARGET (MIDDLE PANE)
		this.setWorkflows();

		// SET SHARED PROJECTS
		this.setShared();	
		
		// SET HISTORY PANE AND GET WORKFLOW HISTORY
		this.setHistory();
		
		// SET WORKFLOW AS SELECTED
		this.middlePane.selectChild(this.workflows.mainTab);
		
		// INSTANTIATE RUN STATUS (RIGHT PANE)
		this.setRunStatus();
		
		// INSTANTIATE INFO PANE (RIGHT PANE)
		this.setInfoPane();


// STOP STANDBY
//console.log("plugins.Workflow.createTab    Doing standby.hide()");
//standby.hide();
	},
	




</entry>

<entry [Sat Sep 11 12:29:08 EDT 2010] FIXED Dynaloader.pm line 225 ERROR 'Name "DBD::SQLite::sqlite_version" used only once'>


ERROR

DynaLoader.pm: Name "DBD::SQLite::sqlite_version" used only once: possible typo at C:/Perl/lib/DynaLoader.pm line 225.


SOLUTION

EDIT C CODE TO GET RID OF ERROR


# if ( sv = get_sv("DBD::SQLite::sqlite_version", TRUE | GV_ADDMULTI) );





</entry>

<entry [Sat Sep 11 11:29:08 EDT 2010] FIXED ERROR IN CALL OF user.pl AND workflow.cgi>


ERROR

couldn't spawn child process:

SOLUTION

USE WINDOWS PERL LOCATION:

#!C:/perl/bin/perl -w

#!/usr/bin/perl -U



WHERE THIS CALL USING THE LINUX PERL LOCATION:

echo {"username":"syoung","sessionId":"1228791394.7868.158","mode":"getData"} | workflow.cgi

GIVES:

	'Windows cannot open this file: workflow.cgi'



AND THIS WITH THE 'perl' CALL USING THE LINUX PERL LOCATION:

echo {"username":"syoung","sessionId":"1228791394.7868.158","mode":"getData"} | perl workflow.cgi

GIVES:

	workflow.cgi    user_query: username=syoung&sessionId=1228791394.7868.158
	workflow.cgi    run_command: E:/0.5/cgi-bin/user.pl "username=syoung&sessionId=1228791394.7868.158"
	workflow.cgi    as_user: E:/0.5/cgi-bin/user.pl "username=syoung&sessionId=12287
	91394.7868.158"
	'username' is not recognized as an internal or external command,
	operable program or batch file.
	'sessionId' is not recognized as an internal or external command,
	operable program or batch file.







Content-type: text/html

workflow.cgi    user_query: username=syoung&sessionId=1228791394.7868.158
workflow.cgi    run_command: E:/0.5/cgi-bin/user.pl "username=syoung&sessionId=1
228791394.7868.158"
workflow.cgi    as_user: E:/0.5/cgi-bin/user.pl "username=syoung&sessionId=1228791394.7868.158"
'username' is not recognized as an internal or external command,
operable program or batch file.
'sessionId' is not recognized as an internal or external command,
operable program or batch file.







BUT WORKS OKAY WHEN perl IS REMOVED:

perl E:/base/www/cgi-bin/agua/0.5/user.pl username=syoung&sessionId=1228791394.7868.158
user    input: username=syoung
[Sat Sep 11 11:21:34 2010] user.pl: { error: 'sessionId not defined'  } at E:\ba
se\www\cgi-bin\agua\0.5\user.pl line 55.
'sessionId' is not recognized as an internal or external command,
operable program or batch file.


E:/base/www/cgi-bin/agua/0.5/user.pl "username=syoung&sessionId=1228791394.7868.158"

	user    input: username=syoung&sessionId=1228791394.7868.158
	user    dbtype: MySQL
	user    usermysql: agua
	user    password: open4agua
	user    database: agua
	user    Creating MySQL dbobject
	Created MySQL dbobject
	Created Admin object: Admin=HASH(0x262be74)
	user    as_user: syoung




WHEREAS THE DIRECT CALL OF user.pl WITH PERL OR WITHOUT PERL GIVES: 


E:\0.5\cgi-bin>echo {"username":"syoung","sessionId":"1228791394.7868.158","mode
":"getData"} | perl workflow.cgi
Content-type: text/html

workflow.cgi    user_query: username=syoung&sessionId=1228791394.7868.158
workflow.cgi    run_command: E:/0.5/cgi-bin/user.pl "username=syoung&sessionId=1
228791394.7868.158"
workflow.cgi    as_user: E:/0.5/cgi-bin/user.pl "username=syoung&sessionId=12287
91394.7868.158"
'username' is not recognized as an internal or external command,
operable program or batch file.
'sessionId' is not recognized as an internal or external command,
operable program or batch file.



NOT USING THE QUOTATION MARKS RESULTS IN THE COMMAND BEING EXECUTED P TO THE FIRST '&':

perl E:/base/www/cgi-bin/agua/0.5/user.pl username=syoung&sessionId=1228791394.7868.158

user    input: username=syoung
user    { error: 'sessionId not defined'  } at E:/base/www/cgi-bin/agua/0.5/user.pl line 55.

'sessionId' is not recognized as an internal or external command,
operable program or batch file.




</entry>

<entry [Fri Sep 10 11:29:08 EDT 2010] ADDED USER agua TO MYSQL>


GRANT ALL PRIVILEGES ON agua.* TO 'agua'@'localhost'
IDENTIFIED BY 'open4agua' WITH GRANT OPTION



</entry>

<entry [Thu Sep  2 12:29:08 EDT 2010] Myrna PAGE USES EC2 ACCOUNT INFO>

http://bio-cloud-1449786154.us-east-1.elb.amazonaws.com/cgi-bin/myrna.pl


AWS ID *   	
AWS Secret Key * 	
AWS Keypair Name	gsg-keypair


Look it up:
https://console.aws.amazon.com/ec2/home#c=EC2&s=KeyPairs



</entry>

<entry [Thu Sep  2 10:29:08 EDT 2010] FIXED BUILD ERRORS WITH builds/003 AND CONFIRMED WITH builds/004>


ERROR 4
-------


PROBLEM

SOMETHING IN Plugin.js CAUSING THIS ERROR ON BUILD:

E:
cd E:\0.5\html\dojo.1.4.2\util\buildscripts

java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release releaseDir=../../../builds/004 version="0.5" > E:/0.5/html/builds/004.agua.build.txt


release:  Interning strings for : ../../../builds/004/dojo/plugins/workflow/StatusPane.js
release:      ../../../builds/004/dojo/plugins/workflow/templates/runstatus.html
release:      ../../../builds/004/dojo/plugins/workflow/templates/historypanerow.html
release:  Interning strings for : ../../../builds/004/dojo/plugins/workflow/Workflow.js
release:      ../../../builds/004/dojo/plugins/workflow/templates/workflow.html
release:  Interning strings for : ../../../builds/004/dojo/plugins/workflow/Workflows.js
release:      ../../../builds/004/dojo/plugins/workflow/templates/workflows.html
release:  Interning strings for : ../../../builds/004/dojo/plugins/workflow/WorkflowsMenu.js
release:      ../../../builds/004/dojo/plugins/workflow/templates/workflowsmenu.html
release:  Interning strings for: ../../../builds/004/dojo/dojo
release:  Interning strings for: ../../../builds/004/dojo/includes
release:  Build is in directory: ../../../builds/004/dojo
Build time: 430.453 seconds



PROBLEM

BUILD FAILED WITH ERROR

java -classpath ../shrinksafe/js.jar;../shrinksafe/shrinksafe.jar org.mozilla.javascript.tools.shell.Main build.js profile=agua action=release releaseDir=../../../builds/004 version="0.5" > E:/0.5/html/builds/004.agua.build.txt

	error loading uri: ./../../../builds/004/dojo/plugins/core/Plugin.js, exception:

	 TypeError: Cannot call method "split" of undefined


SOLUTION

	ADDED MISSING , AFTER     installed : false:
	
	    installed : false,







ERROR 3
-------

PROBLEM

FIREBUG SAYS

Unable to load http://localhost/agua/0.5/builds/003/plugins/core/templates/confirmdialog.html status:404

WHERE 

http://localhost/agua/0.5/builds/003/plugins/core/templates/confirmdialog.html

SHOULD ACTUALLY BE (* FOR EMPHASIS):

http://localhost/agua/0.5/builds/003/***dojo****/plugins/core/templates/confirmdialog.html


SOLUTION

USE plugins AS FIRST ARGUMENT OF dojo.moduleUrl:

	//Path to the template of this widget. 
	templatePath: dojo.moduleUrl("plugins", "core/templates/confirmdialog.html"),

INSTEAD OF:

	templatePath: dojo.moduleUrl("", "../plugins/core/templates/confirmdialog.html"),





ERROR 2
-------

PROBLEM

exception in animation handler for: beforeBegin
dojo.js (line 14)


SOLUTION

REMOVE .play CALL IN HIDE LOADING SCREEN OF plugins.core.Agua:


	// HIDE LOADING SCREEN
	hideLoader : function()
	{
		//console.log("Agua.hideLoader    plugins.core.Agua.hideLoader()");		
	
		//dojo.fadeOut({
		//
		//	node:"splashNode",
		//	duration:300,
		//	onEnd: function(){
		//		dojo.style("splashNode", "display", "none");
		//	}
		//}).play();
		//
		//dojo.fadeOut({
		//
		//	node:"backgroundNode",
		//	duration:300,
		//	onEnd: function(){
		//		dojo.style("backgroundNode", "display", "none");
		//	}
		//}).play();

	},



ERROR 1
-------


PROBLEM

Agua is undefined
[Break on this error] Agua.toolbar.domNode.appendChild(this.statusBar.containerNode); 


SOLUTION

REMOVE REFERENCE TO Agua IN dojo.addOnLoad OF plugins.login.Controller.js:

dojo.addOnLoad(
	function()
	{
		console.log("Controller.addOnLoad    plugins.login.Controller.addOnLoad");

		Agua.loginController = new plugins.login.Login();
	}
);







</entry>

<entry [Tue Aug 31 08:31:11 PDT 2010] RSS FEED AND DOJO SPLASH + GRAPHS, PLUS LINODE VS EC2 COMPARISON>


LINODE VS EC2
-------------

CAKER COST VS FEATURE - LINODE VS EC2
http://blog.linode.com/2009/08/03/linode-api-2-0/


RSS FEED WITH DOJO
------------------
http://localhost/agua/0.5/dojo.1.4.2/dojox/widget/tests/test_PortletInGridContainer.html

UNIX AND PERL FOR BIOLOGISTS
http://groups.google.com/group/unix-and-perl-for-biologists/feeds

SEQANSWERS
http://seqanswers.com/forums/showthread.php?t=56

SPLASH SCREEN
-------------

USE FOR SPLASH SCREEN
http://localhost/agua/0.5/dojo.1.4.2/dojox/widget/tests/test_Standby.html


GRAPHS
------
ZOOM CHART USING SLIDER
http://localhost/agua/0.5/dojo.1.4.2/dojox/widget/tests/test_PortletInGridContainer.html







</entry>

<entry [Sat Aug 28 00:58:03 EDT 2010] NEW GITHUB HTML HOMEPAGE FOR AGUA>

http://syoung.github.com/agua/


</entry>
<entry [Thu Aug 26 15:34:01 EDT 2010] DOJO IN FIREFOX EXTENSION>



Dojo 1.5
Running Dojo in a Firefox extension

If you are using a source distribution of Dojo and want to use it inside a Firefox extension, be sure to set djConfig.hostEnv = ff_ext before including dojo.js for it to work correctly.





Re: Using dojo in a Firefox extension  
http://www.devcomments.com/Using-dojo-in-a-Firefox-extension-at140488.htm
by sgerbeth Apr 15, 2010; 04:24pm 

Hi, 

this tutorial 
(http://o.dojotoolkit.org/forum/dojo-core-dojo-0-9/dojo-core-support/dojo-firefox-extension#comment-20603) 
is for older versions of dojo. You don't need the hostenvType or anything 
else ;) 


When you use dojo 1.4.2. The solution is really trivial. 

Create a build script, e.g. app.profile.js:
dependencies = {
	layers: [
		{
			name: "../app/app.js",
			dependencies: [
				"app.test1",
				"app.test2"
			]
		}
	],

	prefixes: [
		[ "app", "../app" ]
	]
}

Make a normal build, e.g.:
build profile=app action=clean,release releaseName=dojo mini=true

Implement the builded files in main.xul, e.g.:
<script type="application/x-javascript" >
    var djConfig = {
        parseOnLoad:false,
        baseUrl:"chrome://app/content/lib/dojo/release/dojo/dojo/"
    }
</script>
<script src="chrome://app/content/lib/dojo/release/dojo/dojo/dojo.js"
type="application/x-javascript" />
<script src="chrome://app/content/lib/dojo/release/dojo/app/app.js"
type="application/x-javascript" />

Ready! Reload all Chrome!

Cheerio





NB: OLD STUFF:



ok, here is the course of
Submitted by petschm on Wed, 12/17/2008 - 23:09.
ok, here is the course of action to build a custom Dojo for an extension:
(you need some experiences in building dojo from source)

- first you need the source from the svn
- there seems to be a bug in the build scripts, non browser environments will fail to build. jburke pointed this already out: http://trac.dojotoolkit.org/ticket/3833 you should change the code after the suggestion jburke made. see the changeset: http://trac.dojotoolkit.org/changeset/15409/util/trunk/buildscripts/jsli...
- copy the standard.profile.js to ffext.profile.ext and put hostenvType = "ff_ext"; at the beginning.
- build it
- copy the release to your extension (in this case to the folder content/dojo)
- to load dojo you need to add this to your xul file

<script type="application/x-javascript" >
	var djConfig = {
		parseOnLoad:false,
		baseUrl:"chrome://myext/content/dojo/dojo/"
	}
</script>
<script src="chrome://myext/content/dojo/dojo/dojo.js.uncompressed.js" type="application/x-javascript" />
I hope this is helpful.




</entry>


<entry [Fri Jul 23 12:55:02 EDT 2010] DYNAMICALLY INSTANTIATE WIDGET>

Need to create an instance of a class in Dojo without knowing what that class is ahead of time? Will you only have the name of the class that you want to instantiate? Check this out:

/**
 * Create a new instance of a Dojo class.
 *
 * @param className
 *    (String) A fully-qualified name for class, such as 
 *    "my.pack.age.Class"
 * @param constructorSettings
 *    (object) An object that will be passed on to the 
 *    class's constructor.
 */
function instantiateDojoClass(className, constructorSettings){
    try {
        dojo.require(className);
        
        /*
         * Eval the class name to get a reference to the 
         * function, then call it as a constructor using the 
         * constructorSettings object as an argument.
         */
        var obj = new (eval(className))(constructorSettings);
    } catch (e){
        /*
         * Handle any errors that might happen.
         */
        if(console){
            console.error("Could not instantiate %s: %s", classsName, e.message);
        } else {
            alert("Could not instantiate "+className+": "+e.message);
        }
        throw e;
   


</entry>

<entry [Thu Jul 15 21:39:02 EDT 2010] GET COOKIE INFORMATION>



WHEN GETTING THIS FILE:

http://localhost/agua/0.5/dojo.1.4.2/release/dojo/dojo/nls/_en-gb.js



THE HTML REQUEST HAS THIS INFO, INCLUDING COOKIES:

Response Headers

view source
Date	Thu, 15 Jul 2010 21:10:27 GMT
Server	Apache/2.2.9 (Win32)
Content-Length	249
Keep-Alive	timeout=5, max=91
Connection	Keep-Alive
Content-Type	text/html; charset=iso-8859-1

Request Headers

localhost
User-Agent	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.1.10) Gecko/20100504 Firefox/3.5.10
Accept	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language	en-gb,en;q=0.5
Accept-Encoding	gzip,deflate
Accept-Charset	ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive	300
Connection	keep-alive
Referer	http://localhost/agua/0.5/agua.html?syoung,1228791394.7868.158
Cookie	plugins_view_View_jbrowse_Browser_0-refseq=chr1; plugins_view_View_jbrowse_Browser_0-location=%7B%22chrY%22%3A%22NaN%20..%20NaN%22%2C%22chr2%22%3A%22NaN%20..%20NaN%22%2C%22chrX%22%3A%22NaN%20..%20NaN%22%2C%22chr1%22%3A%220%20..%20122%2C000%22%7D; plugins_view_View_jbrowse_Browser_0-tracks=Repeat_Masker%2CSegmental_duplication%2CCpG_Island%2CMicrosatellite%2CPolyA; plugins_view_View_jbrowse_Browser_1-refseq=chrY; plugins_view_View_jbrowse_Browser_1-location=%7B%22chrY%22%3A%22NaN%20..%20NaN%22%7D; plugins_view_View_jbrowse_Browser_1-tracks=DNA; plugins_view_View_jbrowse_Browser_2-refseq=chrY; plugins_view_View_jbrowse_Browser_2-location=%7B%22chrY%22%3A%22NaN%20..%20NaN%22%7D; plugins_view_View_jbrowse_Browser_2-tracks=DNA; plugins_view_View_jbrowse_Browser_3-refseq=chrY; plugins_view_View_jbrowse_Browser_3-location=%7B%22chrY%22%3A%22NaN%20..%20NaN%22%7D; plugins_view_View_jbrowse_Browser_3-tracks=DNA; plugins_view_View_jbrowse_Browser_4-refseq=chrY; plugins_view_View_jbrowse_Browser_4-location=%7B%22chrY%22%3A%22NaN%20..%20NaN%22%7D; plugins_view_View_jbrowse_Browser_4-tracks=DNA; dijit_layout_BorderContainer_1-refseq=chr1; dijit_layout_BorderContainer_1-location=%7B%22chr1%22%3A%220%20..%20108%2C200%22%2C%22chr2%22%3A%22NaN%20..%20NaN%22%7D; dijit_layout_BorderContainer_1-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_5-refseq=chr1; dijit_layout_BorderContainer_5-location=%7B%22chr1%22%3A%220%20..%2021%2C440%22%7D; dijit_layout_BorderContainer_5-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_3-refseq=chr1; dijit_layout_BorderContainer_3-location=%7B%22chr1%22%3A%220%20..%20136%22%7D; dijit_layout_BorderContainer_3-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_7-refseq=chr1; dijit_layout_BorderContainer_7-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_21-refseq=chr1; dijit_layout_BorderContainer_21-location=%7B%22chr1%22%3A%220%20..%200%22%7D; dijit_layout_BorderContainer_21-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_23-refseq=chr1; dijit_layout_BorderContainer_23-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_25-refseq=chr1; dijit_layout_BorderContainer_25-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_27-refseq=chr1; dijit_layout_BorderContainer_27-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_29-refseq=chr1; dijit_layout_BorderContainer_29-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_31-refseq=chr1; dijit_layout_BorderContainer_9-refseq=chr1; dijit_layout_BorderContainer_9-location=%7B%22chr1%22%3A%220%20..%20136%22%7D; dijit_layout_BorderContainer_9-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_11-refseq=chr1; dijit_layout_BorderContainer_11-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_15-location=%7B%22chr1%22%3A%221%20..%206%2C135%2C001%22%7D; dijit_layout_BorderContainer_17-refseq=chr1; dijit_layout_BorderContainer_17-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_19-refseq=chr1; dijit_layout_BorderContainer_19-tracks=Affy_Exon_Probes%2CMicrosatellite%2CEncode_Common_CNV; dijit_layout_BorderContainer_7-location=%7B%22chr1%22%3A%221%20..%206%2C135%2C001%22%7D; dijit_layout_BorderContainer_11-location=%7B%22chr1%22%3A%221%20..%206%2C135%2C001%22%7D



</entry>


<entry [Wed Jun 30 15:40:46 EDT 2010] RAN MAQ ON AGUA>

mkdir -p /nethome/syoung/.agua/Project1/Workflow1/chrY/1;
cd /nethome/syoung/.agua/Project1/Workflow1/chrY/1;

time /nethome/bioinfo/apps/maq/0.7.1/maq match /nethome/syoung/.agua/Project1/Workflow1/chrY/1/out.map /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chrY.bfa /nethome/syoung/.agua/Project1/Workflow1/1/test_1.1.bfq  &> /nethome/syoung/.agua/Project1/Workflow1/chrY/1/maq-chrY-outerr.txt



</entry>



<entry [Tue Jun 29 14:32:15 EDT 2010] RUN jbrowseFeatures.pl AFTER REPLACED refseqfile ARGUMENT WITH species AND build>


1. COPY hg19 REFSEQS FILE TO NEW HUMAN hg19 JBROWSE DATA DIRECTORY


mkdir -p /nethome/bioinfo/data/sequence/chromosomes/human/hg19/jbrowse

cp /refSeqs.js \
/nethome/bioinfo/data/sequence/chromosomes/human/hg19/jbrowse/refSeqs.js



2. COPY INPUT FILE TO WORKFLOW FOLDER


cd /nethome/syoung/.agua/Project1/Workflow1/jbrowse/chrY

cp \
syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/SRA/NA18507/bowtie/t/100M-single-old/chrY/out.bam \
/nethome/syoung/.agua/Project1/Workflow1/jbrowse/chrY



3. RUN jbrowseFeatures


/nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl \
--build hg19 \
--cluster PBS \
--filename out.bam \
--filetype bam \
--inputdir /nethome/syoung/.agua/Project1/Workflow1/bowtie \
--key bowtie \
--label bowtie \
--outputdir /nethome/syoung/.agua/Project1/Workflow1/jbrowse \
--queue gsmall \
--species human 

	...
	jbrowseFeatures.pl    Run time: 00:01:32
	jbrowseFeatures.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/jbrowseFeatures.pl
	jbrowseFeatures.pl    10-06-30 08:14:56
	jbrowseFeatures.pl    ****************************************

AND FILES PRODUCED IN:


ll /nethome/syoung/.agua/Project1/Workflow1/jbrowse/data/tracks/chrY
	
	...
	-rw-r--r-- 1 syoung bioinfo  23K Jun 30 08:14 lazyfeatures-97804.json
	-rw-r--r-- 1 syoung bioinfo  23K Jun 30 08:14 lazyfeatures-98802.json
	-rw-r--r-- 1 syoung bioinfo  23K Jun 30 08:14 lazyfeatures-99800.json
	-rw-r--r-- 1 syoung bioinfo  21K Jun 30 08:14 lazyfeatures-9980.json
	-rw-r--r-- 1 syoung bioinfo  19K Jun 30 08:14 lazyfeatures-998.json
	-rw-r--r-- 1 syoung bioinfo 7.6K Jun 30 08:14 trackData.json







TROUBLESHOOTING
---------------


PROBLEM

'No index file for .../out.bam' try opening file with -autoindex at ... /Bio/DB/Sam.pm line 1940

WHEN RUNNING flatfile-to-json.pl

cd /nethome/syoung/.agua/Project1/Workflow1/jbrowse;
/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --bam /nethome/syoung/.agua/Project1/Workflow1/bowtie/chrY/out.bam --tracklabel bowtie --key bowtie

	working on seq chrY
	No index file for /nethome/syoung/.agua/Project1/Workflow1/bowtie/chrY/out.bam; try opening file with -autoindex at /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm line 1940



DIAGNOSIS

emacs /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm

LINE 1940:

	sub bam_index {
		my $self = shift;
		return $self->{bai} ||= Bio::DB::Bam->index($self->{bam_path},$self->autoindex);
	}


SO NEED TO ADD THE -autoindex ARGUMENT DESCRIBED IN THE Sam.pm perldoc DOCUMENTATION:

	=head2 The low-level API
	
	The low-level API closely mirrors that of the libbam library. It
	provides the ability to open TAM and BAM files, read and write to
	them, build indexes, and perform searches across them. There is less
	overhead to using the API because there is very little Perl memory
	management, but the functions are less convenient to use. Some
	operations, such as writing BAM files, are only available through the
	low-level API.
	
	The classes you will be interacting with in the low-level API are as
	follows:
	
	 * Bio::DB::Tam            -- Methods that read and write TAM (text SAM) files.
	 * Bio::DB::Bam            -- Methods that read and write BAM (binary SAM) files.
	 * Bio::DB::Bam::Header    -- Methods for manipulating the BAM file header.
	 * Bio::DB::Bam::Index     -- Methods for retrieving data from indexed BAM files.
	 * Bio::DB::Bam::Alignment -- Methods for manipulating alignment data.
	 * Bio::DB::Bam::Pileup    -- Methods for manipulating the pileup data structure.
	 * Bio::DB::Sam::Fai       -- Methods for creating and reading from indexed Fasta
								  files.
	=head1 METHODS
	
	We cover the high-level API first. The high-level API code can be
	found in the files Bio/DB/Sam.pm, Bio/DB/Sam/*.pm, and
	Bio/DB/Bam/*.pm.
	
	=head2 Bio::DB::Sam Constructor and basic accessors
	
	=over 4
	
	=item $sam = Bio::DB::Sam->new(%options)
	
	The Bio::DB::Sam object combines a Fasta file of the reference
	sequences with a BAM file to allow for convenient retrieval of
	human-readable sequence IDs and reference sequences. The new()
	constructor accepts a -name=>value style list of options as
	follows:
	
	  Option         Description
	  ------         -------------
	
	  -bam           Path to the BAM file that contains the
					   alignments (required). When using samtools 0.1.6
					   or higher, an http: or ftp: URL is accepted.
	
	  -fasta         Path to the Fasta file that contains
					   the reference sequences (optional). Alternatively,
					   you may pass any object that supports a seq()
					   or fetch_seq() method and takes the three arguments
					   ($seq_id,$start,$end).
	
	  -expand_flags  A boolean value. If true then the standard
					   alignment flags will be broken out as 
					   individual tags such as 'M_UNMAPPED' (default
					   false).
	
	  -split_splices A boolean value. If true, then alignments that
					  are split across splices will be broken out
					  into a single alignment containing two sub-
					  alignments (default false).
	
	  -split          The same as -split_splices.
	
	  -autoindex      Create a BAM index file if one does not exist
					   or the current one has a modification date
					   earlier than the BAM file.
	
	An example of a typical new() constructor invocation is:
	 
	  $sam = Bio::DB::Sam->new(-fasta => '/home/projects/genomes/hu17.fa',
							   -bam   => '/home/projects/alignments/ej88.bam',
							   -expand_flags  => 1,
							   -split_splices => 1);
	
	If the B<-fasta> argument is present, then you will be able to use the
	interface to fetch the reference sequence's bases. Otherwise, calls
	that return the reference sequence will return sequences consisting
	entirely of "N".
	
	B<-expand_flags> option, if true, has the effect of turning each of
	the standard SAM flags into a separately retrievable B<tag> in the
	Bio::SeqFeatureI interface. Otherwise, the standard flags will be
	concatenated in easily parseable form as a tag named "FLAGS". See
	get_all_tags() and get_tag_values() for more information.
	
	Any two-letter extension flags, such as H0 or H1, will always appear
	as separate tags regardless of the setting.
	
	B<-split_splices> has the effect of breaking up alignments that
	contain an "N" operation into subparts for more convenient
	manipulation. For example, if you have both paired reads and spliced
	alignments in the BAM file, the following code shows the subpart
	relationships:
	
	  $pair        = $sam->get_feature_by_name('E113:01:01:23');
	  @mates       = $pair->get_SeqFeatures;
	  @mate1_parts = $mates[0]->get_SeqFeatures;
	  @mate2_parts = $mates[1]->get_SeqFeatures;



SOLUTION

ADD -autoindex TO Bio::DB::Sam->new(args) CALL:

  -autoindex      Create a BAM index file if one does not exist
                   or the current one has a modification date
                   earlier than the BAM file.


emacs /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl

EDIT LINE 144:

#print "DOING db = Bio::DB::Sam->new('-bam' => $bam)\n";
#    $db = Bio::DB::Sam->new('-bam' => $bam);
print "DOING db = Bio::DB::Sam->new('-bam' => $bam, '-autoindex' => 1)\n";
    $db = Bio::DB::Sam->new('-bam' => $bam, '-autoindex' => 1);



WHICH RAN:

cd /nethome/syoung/.agua/Project1/Workflow1/jbrowse;
/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --bam /nethome/syoung/.agua/Project1/Workflow1/bowtie/chrY/out.bam --tracklabel bowtie --key bowtie

	...
	working on seq chrY
	[bam_index_build] creating index for /nethome/syoung/.agua/Project1/Workflow1/bowtie/chrY/out.bam


... BUT GAVE REPEATED WARNING:

	Use of uninitialized value in addition (+) at /nethome/syoung/base/apps/jbrowse/100511/bin/../lib/JsonGenerator.pm line 555.


emacs /nethome/syoung/base/apps/jbrowse/100511/bin/../lib/JsonGenerator.pm


SO EDITED JsonGenerator.pm

sub aggSumArray {
    my ($bigArray, $count) = @_;


#print "JsonGenerator::aggSumArray    JsonGenerator::aggSumArray(bigArray, count)\n";
#print "JsonGenerator::aggSumArray    bigArray: \n"';                                        
#use Data::Dumper;                                                                               
#print Dumper $bigArray;                                                                         
#print "JsonGenerator::aggSumArray    count: $count\n";                                          


    my @result;                                                                                 
    my $curSum = $bigArray->[0];                                                                
    for (my $i = 1; $i <= $#{$bigArray}; $i++) {                                                
        if (0 == ($i % $count)) {                                                               
            push @result, $curSum;                                                              
            $curSum = 0;                                                                        
        }                                                                                       


        $curSum += $bigArray->[$i] if defined $bigArray->[$i];
#        $curSum += $bigArray->[$i];


    }                                                                                           
    push @result, $curSum;                                                                      
    return \@result;                                                                            
}


AND RERAN:



WHICH GENERATED *.json FILES IN

/nethome/syoung/.agua/Project1/Workflow1/jbrowse/data/tracks/chrY/bowtie/







PROBLEM


Can't locate loadable object for module Bio::DB::Sam in @INC

perl -e 'use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib"; use Bio::DB::Sam;'

	Can't locate loadable object for module Bio::DB::Sam in @INC (@INC contains: /nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8 /nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8 /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi /usr/lib64/perl5/site_perl/5.8.7/x86_64-linux-thread-multi /usr/lib64/perl5/site_perl/5.8.6/x86_64-linux-thread-multi /usr/lib64/perl5/site_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/site_perl/5.8.8 /usr/lib/perl5/site_perl/5.8.7 /usr/lib/perl5/site_perl/5.8.6 /usr/lib/perl5/site_perl/5.8.5 /usr/lib/perl5/site_perl /usr/lib64/perl5/vendor_perl/5.8.8/x86_64-linux-thread-multi /usr/lib64/perl5/vendor_perl/5.8.7/x86_64-linux-thread-multi /usr/lib64/perl5/vendor_perl/5.8.6/x86_64-linux-thread-multi /usr/lib64/perl5/vendor_perl/5.8.5/x86_64-linux-thread-multi /usr/lib/perl5/vendor_perl/5.8.8 /usr/lib/perl5/vendor_perl/5.8.7 /usr/lib/perl5/vendor_perl/5.8.6 /usr/lib/perl5/vendor_perl/5.8.5 /usr/lib/perl5/vendor_perl /usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi /usr/lib/perl5/5.8.8 .) at -e line 1
	Compilation failed in require at -e line 1.
	BEGIN failed--compilation aborted at -e line 1.



AND ONE LEVEL UP THE ERROR MESSAGE IS:

/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl --bam /nethome/syoung/.agua/Project1/Workflow1/bowtie/chr1/out.bam --tracklabel bowtie --key bowtie

	flatfile-to-json.pl    Looking for refSeqs in data/refSeqs.js
	install Bio::DB::Sam in order to use BAM files at /nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl line 127.



DIAGNOSIS

NEED Sam.so AND Sam.bs FILES GENERATED BY BUILD OF BIO-SAMTOOLS


SOLUTION

1. EDIT flatfile-to-json.pl

/nethome/syoung/base/apps/jbrowse/100511/bin/flatfile-to-json.pl

TO LOOK LIKE THIS:

	use lib "$Bin/../lib";
	
	# Bio/SeqFeature/Lite.pm                                                                      
	use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8";
	
	# JSON.pm                                                                                     
	use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/l\
	ib/perl5/site_perl/5.8.8";
	
	# Bio/DB/Sam.pm                                                                               
	use lib "/nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_\
	64-linux-thread-multi";
	
	#use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib";


2. BUILD BIO-SAMTOOLS

cd /nethome/syoung/base/apps/samtools/biosamtools/1.19/Bio-SamTools-1.19
perl Build.PL --prefix /nethome/syoung/base/apps/samtools/biosamtools/1.19 --cflags=-fPIC


/nethome/syoung/base/apps/samtools/0.1.6

	This module requires samtools 0.1.4 or higher (samtools.sourceforge.net).
	Please enter the location of the bam.h and compiled libbam.a files: /nethome/syoung/base/apps/samtools/0.1.6
	
	Found /nethome/syoung/base/apps/samtools/0.1.6/bam.h and /nethome/syoung/base/apps/samtools/0.1.6/libbam.a.
	Creating new 'MYMETA.yml' with configuration results
	Creating new 'Build' script for 'Bio-SamTools' version '1.19'

    ####This module requires samtools 0.1.4 or higher (samtools.sourceforge.net).
    ####Please enter the location of the bam.h and compiled libbam.a files: /nethome/syoung/base/apps/samtools/0.1.6
    ####    
    ####Found /nethome/syoung/base/apps/samtools/0.1.6/bam.h and /nethome/syoung/base/apps/samtools/0.1.6/libbam.a.
    ####Creating new 'MYMETA.yml' with configuration results
    ####Creating new 'Build' script for 'Bio-SamTools' version '1.19'


./Build

    Building Bio-SamTools

    ####Building Bio-SamTools
    ####gcc -shared -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic -o blib/arch/auto/Bio/DB/Sam/Sam.so lib/Bio/DB/Sam.o -L/nethome/syoung/base/apps/samtools/0.1.6 -lbam -lz


./Build test
    
	t/01sam....ok
	All tests successful.
	Files=1, Tests=104,  2 wallclock secs ( 1.18 cusr +  0.14 csys =  1.32 CPU)

	####	t/01sam....ok 1/104[fai_load] build FASTA index.                             
	####    t/01sam....ok                                                                
	####    All tests successful.
	####    Files=1, Tests=104,  1 wallclock secs ( 1.36 cusr +  0.15 csys =  1.51 CPU)

    OK!
    

./Build install

	Building Bio-SamTools
	Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam/Sam.bs
	Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/DB/Sam/Sam.so
	Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
	Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Bio/DB/Sam.pm
	...
	Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Bam::Pileup.3pm
	Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/share/man/man3/Bio::DB::Bam::Query.3pm
	Installing /nethome/syoung/base/apps/samtools/biosamtools/1.19/bin/bamToGBrowse.pl
	Writing /nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bio/SamTools/.packlist



WHICH INSTALLED Bio::DB::Sam TO HERE:


/nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi


... AND ADDED THE Bio/DB/Sam/Sam.bs AND Bio/DB/Sam/Sam.so FILES THAT WERE MISSING IN THE ORIGINAL INSTALLATION ('S auto DIR) THAT GAVE THE 'Can't locate loadable object for module Bio::DB::Sam' ERROR MESSAGE

TEST IT:

perl -e 'use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/samtools/biosamtools/1.19/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";  use Bio::DB::Sam;'
	
	OK!





NOTES
-----

LOCATIONS OF NECESSARY PACKAGES

Bio/SeqFeature/Lite.pm
----------------------
/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8
Can't locate Bio/SeqFeature/Lite.pm in @INC


JSON
-----
/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8


Bio/DB/Sam.pm
-------------
/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib





perl -e 'use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/samtools/Bio-SamTools-1.01/lib"; use Bio::DB::Sam;'

perl -e 'use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8/lib/perl5/site_perl/5.8.8"; use Bio::DB::Sam;'


perl -e 'use lib "/nethome/syoung/base/apps/jbrowse/100511/lib/bioperl/1.6/lib/perl5/site_perl/5.8.8"; use Bio::DB::Sam;'




</entry>


<entry [Mon Jun 21 17:07:20 EDT 2010] BACKED UP DB ON NGSDEV TO 0.51 AFTER ADDITION OF submit FIELD TO stage TABLE>


INPUT FILE:

COPIED BIXBY s_1_sequence-100K.txt TO Project1/Workflow1/s_1_sequence.txt


REFERENCE:

/nethome/bioinfo/data/sequence/chromosomes/mouse/mm9/maq


COMMAND:

perl /data/agua/0.5/bin/scripts/saveDb.pl --db agua --outputdir /data/agua/0.5/bin/sql/0.5.1


echo '{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":"1"}' | perl -U workflow.cgi



/nethome/bioinfo/apps/agua/0.5/bin/apps/MAQ.pl \
--convert post-1.3 \
--inputfile /nethome/syoung/.agua/Project1/Workflow1/s_1_sequence.txt \
--maxjobs 30 \
--outputdir /nethome/syoung/.agua/Project1/Workflow1 \
--queue gsmall \
--reads 1000000 \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/mouse/mm9/maq \
--splitfile /nethome/syoung/.agua/Project1/Workflow1/splitfile.txt \
--label test \
--species human



1> /nethome/syoung/.agua/Project1/Workflow1/MAQ.stdout 2> /nethome/syoung/.agua/Project1/Workflow1/MAQ.stderr




INSERT COMMANDS FOR NEW REQUIRED FIELDS: 

insert into parameter (owner, appname, apptype, name, paramtype, category, type, argument, value, discretion, format, description) values ('admin', 'MAQ', 'pipeline', 'label', 'input', 'label', 'String', '--label', '', 'required', '', 'A one-word label describing the experiment or data', 'input.label.value'));


insert into parameter values ('admin', 'MAQ', 'pipeline', 'species', 'input', 'species', 'String', '--species', '', 'required', '', 'Species name (e.g., human, mouse)', 'input.species.value', '', '');

insert into parameter values ('admin', 'MAQ', 'pipeline', 'label', 'input', 'label', 'String', '--label', '', 'required', '', 'Species name (e.g., human, mouse)', 'input.label.value', '', '');


update stageparameter set value=''where project='Project1' and workflow='Workflow1' and username='syoung' and appname='MAQ' and name='inputfile';

update stageparameter set name='maxjobs', argument='maxjobs' where project='Project1' and workflow='Workflow1' and username='syoung' and appname='MAQ';



</entry>

<entry [Tue Jun 15 14:09:42 EDT 2010] CENTROMERE POSITIONS>


http://genome.ucsc.edu/cgi-bin/hgTables

clade:     genome:     assembly: 
group:  All Tables
database:     hg19
table:   gap

filter:   type == telomere


HUMAN hg19 

chr1	hg19_gap	exon	121535435	124535434	0.000000	.	.	gene_id "gene1"; transcript_id "tx1"; 
chr2	hg19_gap	exon	92326172	95326171	0.000000	.	.	gene_id "gene2"; transcript_id "tx2"; 
chr3	hg19_gap	exon	90504855	93504854	0.000000	.	.	gene_id "gene3"; transcript_id "tx3"; 
chr4	hg19_gap	exon	49660118	52660117	0.000000	.	.	gene_id "gene4"; transcript_id "tx4"; 
chr5	hg19_gap	exon	46405642	49405641	0.000000	.	.	gene_id "gene5"; transcript_id "tx5"; 
chr6	hg19_gap	exon	58830167	61830166	0.000000	.	.	gene_id "gene6"; transcript_id "tx6"; 
chr7	hg19_gap	exon	58054332	61054331	0.000000	.	.	gene_id "gene7"; transcript_id "tx7"; 
chr8	hg19_gap	exon	43838888	46838887	0.000000	.	.	gene_id "gene8"; transcript_id "tx8"; 
chr9	hg19_gap	exon	47367680	50367679	0.000000	.	.	gene_id "gene9"; transcript_id "tx9"; 
chrX	hg19_gap	exon	58632013	61632012	0.000000	.	.	gene_id "gene10"; transcript_id "tx10"; 
chrY	hg19_gap	exon	10104554	13104553	0.000000	.	.	gene_id "gene11"; transcript_id "tx11"; 
chr10	hg19_gap	exon	39254936	42254935	0.000000	.	.	gene_id "gene12"; transcript_id "tx12"; 
chr11	hg19_gap	exon	51644206	54644205	0.000000	.	.	gene_id "gene13"; transcript_id "tx13"; 
chr12	hg19_gap	exon	34856695	37856694	0.000000	.	.	gene_id "gene14"; transcript_id "tx14"; 
chr13	hg19_gap	exon	16000001	19000000	0.000000	.	.	gene_id "gene15"; transcript_id "tx15"; 
chr14	hg19_gap	exon	16000001	19000000	0.000000	.	.	gene_id "gene16"; transcript_id "tx16"; 
chr15	hg19_gap	exon	17000001	20000000	0.000000	.	.	gene_id "gene17"; transcript_id "tx17"; 
chr16	hg19_gap	exon	35335802	38335801	0.000000	.	.	gene_id "gene18"; transcript_id "tx18"; 
chr17	hg19_gap	exon	22263007	25263006	0.000000	.	.	gene_id "gene19"; transcript_id "tx19"; 
chr18	hg19_gap	exon	15460899	18460898	0.000000	.	.	gene_id "gene20"; transcript_id "tx20"; 
chr19	hg19_gap	exon	24681783	27681782	0.000000	.	.	gene_id "gene21"; transcript_id "tx21"; 
chr20	hg19_gap	exon	26369570	29369569	0.000000	.	.	gene_id "gene22"; transcript_id "tx22"; 
chr21	hg19_gap	exon	11288130	14288129	0.000000	.	.	gene_id "gene23"; transcript_id "tx23"; 
chr22	hg19_gap	exon	13000001	16000000	0.000000	.	.	gene_id "gene24"; transcript_id "tx24"; 


MOUSE AND RAT HAD NO RESULTS OR NONSENSE:

MM9

	chr1	mm9_gap	exon	1	3000000	0.000000	.	.	gene_id "gene1"; transcript_id "tx1"; 
	chr2	mm9_gap	exon	1	3000000	0.000000	.	.	gene_id "gene2"; transcript_id "tx2"; 
	chr3	mm9_gap	exon	1	3000000	0.000000	.	.	gene_id "gene3"; transcript_id "tx3";
	...

RN4

#filter: chr1_gap.type = 'centromere'
#bin	chrom	chromStart	chromEnd	ix	n	size	type	bridge
# No results passing filter.





ADAPTED FROM (OUT-OF-DATE):

https://lists.soe.ucsc.edu/pipermail/genome/2003-November/003423.html

If you 

1) go to the Table Browser (http://genome.ucsc.edu/cgi-bin/hgText)
2) select ChrN_gap under the positional tables drop box
3) Select Advanced Query button
4) Select Tab-separated, all fields for output option
5) Under the filter, type in "centromere" for the "type" fields
6) Hit Get Results button

This will give the location of the centromere for each chromosome.





</entry>

<entry [Tue Jun 15 14:09:42 EDT 2010] ACCESS TO PENGUIN CLUSTERS>

PENGUIN1
ssh root@10.141.55.128

PENGUIN2
ssh root@10.141.60.249

NB: SOLiD TEST DATA ALSO HERE ON PENGUIN 2

ll /data/CTS/WT/CTS_WT_single_read_demo/





</entry>

<entry [Tue Jun 15 15:09:42 EDT 2010] JEFF VANCE DATA ON PEGASUS>


SAMPLES - TWO PARKINSONS PATIENTS (SOLiD)
-----------------------------------------



TEST 1 (SOLiD)
--------------

SOURCE:

DATA IS ON THE OLD CLUSTER (PENGUIN)
ssh root@10.141.55.128

NOT ON THE NEW PENGUIN2
ssh root@10.141.60.249


ll /scratch/syoung/base/pipeline/jvance/tophat/test/1

	WT_GUNEY_PD_20100219_solid0398/WT_57_PD_04PM




TEST 2 (SOLiD)
--------------

SOURCE:

DATA IS ON THE OLD CLUSTER (PENGUIN)
ssh root@10.141.55.128

NOT ON THE NEW PENGUIN2
ssh root@10.141.60.249

/scratch/syoung/base/pipeline/jvance/tophat/test/2

	WT_GUNEY_PD_20100219_solid0398/WT_93...





From: Hulme, William 
Sent: Thursday, May 13, 2010 5:10 PM
To: HIHG Support
Cc: Bademci, Guney
Subject: data transfer to ipar


Hello, We have two samples (with two files each) on the old offline cluster that we need transferred to the iPAR.  Notice we don't know the exact name of the primary folder In the middle of the path name but there is only one primary folder in each location.

SOURCE
Old Cluster: (IP:10.141.55.128)

/data/results/solid0398/RaindanceDVLP_AgilentBO_20100318_solid0398/Sample_AG13_1pM/results/primary#########/reads/RaindanceDVLP_AgilentBO_20100318_solid0398_Sample_AG13_1pM_F3.csfasta
/data/results/solid0398/RaindanceDVLP_AgilentBO_20100318_solid0398/Sample_AG13_1pM/results/primary#########/reads/RaindanceDVLP_AgilentBO_20100318_solid0398_Sample_AG13_1pM_F3_QV.qual






CONTROLS - ONE HEALTHY INDIVIDUAL (SOLiD AND SOLEXA)
----------------------------------------------------





CONTROL 1 (ILLUMINA/SOLEXA)
---------------------------

SOURCE:

/q/solexa_xfer/M.Kohli_reads/solexa.data.091219_HWI-EAS185_0004_4311VAAXX/Intensities/BaseCalls/AD9/Read1/s_1_1_sequence.txt
/q/solexa_xfer/M.Kohli_reads/solexa.data.091219_HWI-EAS185_0004_4311VAAXX/Intensities/BaseCalls/AD9/Read2/s_1_2_sequence.txt

MOVED TO PEGASUS:

ll /scratch/syoung/base/pipeline/jvance/pdx/control/1

	-rwxrwx--- 1 syoung root 3.6G Jun 15 14:58 s_1_1_sequence.txt
	-rwxrwx--- 1 syoung root 3.7G Jun 15 15:00 s_1_2_sequence.txt




CONTROL 2 (SOLiD)
-----------------

SOURCE:

old penguin server 10.141.55.128

/data/results/tertiary/gordo_20100609120037_1/*

(chrystal: CT8.solid.bam - is the wt.sr.bam)




MOVED TO PEGASUS:

scp /data/results/tertiary/gordo_20100609120037_1/CT8.tar.gz syoung@pegasus.ccs.miami.edu:/scratch/syoung/base/pipeline/jvance

ll /scratch/syoung/base/pipeline/jvance/pdx/control/2


USED hg18 REFERENCE ON PENGUIN:

/data/reference




If you do want the original CT8 (solid) files, I think it would be best to place them onto an external hard drive. I say this because

the .cfasta files is 12G
the .qual file is 27G and the .stats files is 204K and it would suck up all of my computer power to place them into the tmp directory. 








From: Humphries, Crystal 
Sent: Wednesday, June 16, 2010 2:43 PM
To: Young, Stuart
Subject: RE: PD and AZ data

It is the old penguin server 10.141.55.128. 

The location of the file is in the following location: /data/results/tertiary/gordo_20100609120037_1/output/mapping. 
I gave you the wt.sr.bam file.  

From: Young, Stuart 
Sent: Wednesday, June 16, 2010 2:31 PM
To: Humphries, Crystal
Subject: RE: PD and AZ data

Thanks, Crystal!

Just so I can keep tabs on the data's provenance, could you tell me the location of the files on the Penguin server. Is it the old Penguin server or the new one?

Cheers,

Stuart.



From: Humphries, Crystal 
Sent: Wednesday, June 16, 2010 2:22 PM
To: Young, Stuart
Subject: RE: PD and AZ data

Sorry it took so long, but the solid sample is now in the tmp directoryCT8.solid.bam. 

Crystal Humphries

From: Young, Stuart 
Sent: Tuesday, June 15, 2010 3:07 PM
To: Humphries, Crystal
Subject: RE: PD and AZ data

I don't have direct access to the Penguin cluster so it'd be great if you could download the files and put them here on Pegasus (pegasus.ccs.miami.edu) or Kronos, whichever is easier:

/tmp/CT8

If you have any difficulty putting the files in that folder, just send me the path to a location of your choice.

Btw, could you tell me the location of the files on the Penguin server. Is it the old Penguin server or the new one?

Cheers,

Stuart.




</entry>

<entry [Sat May 29 23:59:44 EDT 2010] BACKED UP DB TO 0.5>

perl E:/0.5/bin/scripts/saveDb.pl --db agua --outputdir E:/0.5/bin/sql/0.5



</entry>

<entry [Sat May 29 23:59:43 EDT 2010] BUILT **CLEAN** AGUA 0.5>


1. RAN comment.pl TO REMOVE ALL COMMENTS IN ALL PLUGINS

FIRST, BACKED UP plugins TO

E:\0.4\html\plugins.100213.bkp


THEN GO PLUGIN-BY-PLUGIN, CLEANING WITH comment.pl AND CHECKING TO SEE IF THERE ARE ANY LOAD OR
FUNCTIONALITY PROBLEMS (OF COURSE, RUNNING THE NON-COMPRESSED VERSION)


perl E:/0.4/bin/scripts/comment.pl --inputdir E:\0.4\html\plugins\admin --outputdir E:\0.4\html\plugins\admin --action clean --type js --recursive 


perl E:/0.4/bin/scripts/comment.pl \
--inputdir E:\0.4\html\plugins\admin \
--outputdir E:\0.4\html\plugins\admin \
--action clean \
--type js \
--recursive

E:\0.5\html\plugins\view\jbrowse\js



</entry>

<entry [Sat May 29 23:59:42 EDT 2010] FIXED PERL SHEBANG PROBLEM BETWEEN LINUX AND WINDOWS BY USING C:/usr/bin/perl>

How do I ignore the Perl shebang on Windows with Apache 2?
http://stackoverflow.com/questions/2036577/how-do-i-ignore-the-perl-shebang-on-windows-with-apache-2

The way I had this working was to copy perl.exe to c:/usr/bin/ and rename it to perl (strip the .exe)


ALTERNATELY, configure Apache on Windows to ignore the shebang line. Add

 ScriptInterpreterSource Registry-Strict

to your httpd.conf and set up the Windows Registry key as explained in the Apache docs.

Here is what I get when I export the key:

Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\.pl\Shell\ExecCGI\Command]
@="c:\\opt\\perl\\bin\\perl.exe"

I have been using this setup with Apache and ActiveState Perl on my Windows laptop and the Apache and Perl distributions that come with ArchLinux on my server.

The Apache docs (to which I linked above) state:

The option Registry-Strict which is new in Apache 2.0 does the same thing as Registry but uses only the subkey Shell\ExecCGI\Command. The ExecCGI key is not a common one. It must be configured manually in the windows registry and hence prevents accidental program calls on your system. (emphasis mine)

link|flag
edited Jan 10 at 9:58

answered Jan 10 at 9:20
Sinan Ünür
35.1k23892
As advised by the docs, I've tried this in all contexts: server config, virtual host, directory, .htaccess - but this does not seem to solve the error, what could I be doing wrong?  nbolton Jan 10 at 9:28
Yes I have restarted. I'm using ActivePerl so I don't know, what registry key do I need to look for? I am using the directive in httpd.conf just below DocumentRoot (default config line 177).  nbolton Jan 10 at 9:36
Thanks, I added the key HKEY_CLASSES_ROOT\.pl\Shell\ExecCGI\Command with REG_SZ value C:\Perl\bin\perl.exe -wT, and it works!  nbolton Jan 10 at 9:50



</entry>

<entry [Sat May 29 23:59:42 EDT 2010] FIXED WORKFLOW UPLOAD AND MENUS BUT COULDN'T PUSH UNTIL USED push --force>


FIXED WORKFLOW UPLOAD
---------------------

ADDED CLONE OF fileInput (INSTEAD OF ORIGINAL) TO _newForm SO IT PERSISTS EVEN AFTER io.send HAS COMPLETED


FIXED WORKFLOW MENUS
--------------------

SUBCLASSED dijit.Menu AS plugins.menu.Menu AND ADDED TO _openMyself


	// ADD THIS TO ENABLE IDENTIFICATION OF THE UNDERLYING TARGET
	// NODE WHEN THE MENU IS CLICKED
	this.currentTarget = args.target;


THEN RECALLED this.currentTarget IN remove (AND OTHER) FUNCTIONs OF WorkflowsMenu:


	// REMOVE THE STAGE FROM THE WORKFLOW
	remove : function (event)
	{
		console.log("WorkflowsMenu.remove     plugins.workflow.Workflow.remove(event)");

		// REM: WE ARE NOT INTERESTED IN event.target 
		// BECAUSE ITS THE CLICKED MENU NODE. WE WANT
		// THE NODE UNDERNEATH
		var node = this.menu.currentTarget;
		var widget = dijit.getEnclosingWidget(node);
		var application = widget.getApplication();
		console.log("WorkflowsMenu.remove     application: " + dojo.toJson(application));




E:\>cd 0.5

E:\0.5>git push linode master

	root@74.207.235.81's password:
	To ssh://root@74.207.235.81/srv/git/agua
	 ! [rejected]        master -> master (non-fast-forward)
	error: failed to push some refs to 'ssh://root@74.207.235.81/srv/git/agua'
	To prevent you from losing history, non-fast-forward updates were rejected
	Merge the remote changes before pushing again.  See the 'Note about
	fast-forwards' section of 'git push --help' for details.
	
E:\0.5>git push github master

	Enter passphrase for key '/c/Documents and Settings/syoung/.ssh/id_rsa':
	To git@github.com:syoung/agua.git
	 ! [rejected]        master -> master (non-fast-forward)
	error: failed to push some refs to 'git@github.com:syoung/agua.git'
	To prevent you from losing history, non-fast-forward updates were rejected
	Merge the remote changes before pushing again.  See the 'Note about
	fast-forwards' section of 'git push --help' for details.


SOLUTION:

USE push --force

	OK!
	
	



git-push(1) Manual Page
NAME

git-push - Update remote refs along with associated objects
SYNOPSIS
git push [--all | --mirror | --tags] [-n | --dry-run] [--receive-pack=<git-receive-pack>] [--repo=<repository>] [-f | --force] [-v | --verbose] [-u | --set-upstream] [<repository> <refspec>]
DESCRIPTION

Updates remote refs using local refs, while sending objects necessary to complete the given refs.

You can make interesting things happen to a repository every time you push into it, by setting up hooks there. See documentation for git-receive-pack(1).
OPTIONS

<repository>

    The "remote" repository that is destination of a push operation. This parameter can be either a URL (see the section GIT URLS below) or the name of a remote (see the section REMOTES below).
<refspec>

    The format of a <refspec> parameter is an optional plus +, followed by the source ref <src>, followed by a colon :, followed by the destination ref <dst>. It is used to specify with what <src> object the <dst> ref in the remote repository is to be updated.

    The <src> is often the name of the branch you would want to push, but it can be any arbitrary "SHA-1 expression", such as master~4 or HEAD (see git-rev-parse(1)).

    The <dst> tells which ref on the remote side is updated with this push. Arbitrary expressions cannot be used here, an actual ref must be named. If :<dst> is omitted, the same ref as <src> will be updated.

    The object referenced by <src> is used to update the <dst> reference on the remote side, but by default this is only allowed if the update can fast-forward <dst>. By having the optional leading +, you can tell git to update the <dst> ref even when the update is not a fast-forward. This does not attempt to merge <src> into <dst>. See EXAMPLES below for details.

    tag <tag> means the same as refs/tags/<tag>:refs/tags/<tag>.

    Pushing an empty <src> allows you to delete the <dst> ref from the remote repository.

    The special refspec : (or +: to allow non-fast-forward updates) directs git to push "matching" branches: for every branch that exists on the local side, the remote side is updated if a branch of the same name already exists on the remote side. This is the default operation mode if no explicit refspec is found (that is neither on the command line nor in any Push line of the corresponding remotes file---see below).
--all

    Instead of naming each ref to push, specifies that all refs under refs/heads/ be pushed.
--mirror

    Instead of naming each ref to push, specifies that all refs under refs/ (which includes but is not limited to refs/heads/, refs/remotes/, and refs/tags/) be mirrored to the remote repository. Newly created local refs will be pushed to the remote end, locally updated refs will be force updated on the remote end, and deleted refs will be removed from the remote end. This is the default if the configuration option remote.<remote>.mirror is set.
-n
--dry-run

    Do everything except actually send the updates.
--porcelain

    Produce machine-readable output. The output status line for each ref will be tab-separated and sent to stdout instead of stderr. The full symbolic names of the refs will be given.
--delete

    All listed refs are deleted from the remote repository. This is the same as prefixing all refs with a colon.
--tags

    All refs under refs/tags are pushed, in addition to refspecs explicitly listed on the command line.
--receive-pack=<git-receive-pack>
--exec=<git-receive-pack>

    Path to the git-receive-pack program on the remote end. Sometimes useful when pushing to a remote repository over ssh, and you do not have the program in a directory on the default $PATH.
-f
--force

    Usually, the command refuses to update a remote ref that is not an ancestor of the local ref used to overwrite it. This flag disables the check. This can cause the remote repository to lose commits; use it with care.
--repo=<repository>

    This option is only relevant if no <repository> argument is passed in the invocation. In this case, git push derives the remote name from the current branch: If it tracks a remote branch, then that remote repository is pushed to. Otherwise, the name "origin" is used. For this latter case, this option can be used to override the name "origin". In other words, the difference between these two commands

    git push public         #1
    git push --repo=public  #2

    is that #1 always pushes to "public" whereas #2 pushes to "public" only if the current branch does not track a remote branch. This is useful if you write an alias or script around git push.
-u
--set-upstream

    For every branch that is up to date or successfully pushed, add upstream (tracking) reference, used by argument-less git-pull(1) and other commands. For more information, see branch.<name>.merge in git-config(1).
--thin
--no-thin

    These options are passed to git-send-pack(1). A thin transfer significantly reduces the amount of sent data when the sender and receiver share many of the same objects in common. The default is --thin.
-v
--verbose

    Run verbosely.
-q
--quiet

    Suppress all output, including the listing of updated refs, unless an error occurs.

GIT URLS

One of the following notations can be used to name the remote repository:

    *

      rsync://host.xz/path/to/repo.git/
    *

      http://host.xz[:port]/path/to/repo.git/
    *

      https://host.xz[:port]/path/to/repo.git/
    *

      git://host.xz[:port]/path/to/repo.git/
    *

      git://host.xz[:port]/~user/path/to/repo.git/
    *

      ssh://[user@]host.xz[:port]/path/to/repo.git/
    *

      ssh://[user@]host.xz/path/to/repo.git/
    *

      ssh://[user@]host.xz/~user/path/to/repo.git/
    *

      ssh://[user@]host.xz/~/path/to/repo.git

SSH is the default transport protocol over the network. You can optionally specify which user to log-in as, and an alternate, scp-like syntax is also supported. Both syntaxes support username expansion, as does the native git protocol, but only the former supports port specification. The following three are identical to the last three above, respectively:

    *

      [user@]host.xz:/path/to/repo.git/
    *

      [user@]host.xz:~user/path/to/repo.git/
    *

      [user@]host.xz:path/to/repo.git

To sync with a local directory, you can use:

    *

      /path/to/repo.git/
    *

      file:///path/to/repo.git/

They are mostly equivalent, except when cloning. See git-clone(1) for details.

If there are a large number of similarly-named remote repositories and you want to use a different format for them (such that the URLs you use will be rewritten into URLs that work), you can create a configuration section of the form:

        [url "<actual url base>"]
                insteadOf = <other url base>

For example, with this:

        [url "git://git.host.xz/"]
                insteadOf = host.xz:/path/to/
                insteadOf = work:

a URL like "work:repo.git" or like "host.xz:/path/to/repo.git" will be rewritten in any context that takes a URL to be "git://git.host.xz/repo.git".

If you want to rewrite URLs for push only, you can create a configuration section of the form:

        [url "<actual url base>"]
                pushInsteadOf = <other url base>

For example, with this:

        [url "ssh://example.org/"]
                pushInsteadOf = git://example.org/

a URL like "git://example.org/path/to/repo.git" will be rewritten to "ssh://example.org/path/to/repo.git" for pushes, but pulls will still use the original URL.
REMOTES

The name of one of the following can be used instead of a URL as <repository> argument:

    *

      a remote in the git configuration file: $GIT_DIR/config,
    *

      a file in the $GIT_DIR/remotes directory, or
    *

      a file in the $GIT_DIR/branches directory.

All of these also allow you to omit the refspec from the command line because they each contain a refspec which git will use by default.
Named remote in configuration file

You can choose to provide the name of a remote which you had previously configured using git-remote(1), git-config(1) or even by a manual edit to the $GIT_DIR/config file. The URL of this remote will be used to access the repository. The refspec of this remote will be used by default when you do not provide a refspec on the command line. The entry in the config file would appear like this:

        [remote "<name>"]
                url = <url>
                pushurl = <pushurl>
                push = <refspec>
                fetch = <refspec>

The <pushurl> is used for pushes only. It is optional and defaults to <url>.
Named file in $GIT_DIR/remotes

You can choose to provide the name of a file in $GIT_DIR/remotes. The URL in this file will be used to access the repository. The refspec in this file will be used as default when you do not provide a refspec on the command line. This file should have the following format:

        URL: one of the above URL format
        Push: <refspec>
        Pull: <refspec>

Push: lines are used by git push and Pull: lines are used by git pull and git fetch. Multiple Push: and Pull: lines may be specified for additional branch mappings.
Named file in $GIT_DIR/branches

You can choose to provide the name of a file in $GIT_DIR/branches. The URL in this file will be used to access the repository. This file should have the following format:

        <url>#<head>

<url> is required; #<head> is optional.

Depending on the operation, git will use one of the following refspecs, if you don't provide one on the command line. <branch> is the name of this file in $GIT_DIR/branches and <head> defaults to master.

git fetch uses:

        refs/heads/<head>:refs/heads/<branch>

git push uses:

        HEAD:refs/heads/<head>

OUTPUT

The output of "git push" depends on the transport method used; this section describes the output when pushing over the git protocol (either locally or via ssh).

The status of the push is output in tabular form, with each line representing the status of a single ref. Each line is of the form:

 <flag> <summary> <from> -> <to> (<reason>)

If --porcelain is used, then each line of the output is of the form:

 <flag> \t <from>:<to> \t <summary> (<reason>)

The status of up-to-date refs is shown only if --porcelain or --verbose option is used.

flag

    A single character indicating the status of the ref:
    (space) 	for a successfully pushed fast-forward;
    + 	for a successful forced update;
    - 	for a successfully deleted ref;
    * 	for a successfully pushed new ref;
    ! 	for a ref that was rejected or failed to push; and
    = 	for a ref that was up to date and did not need pushing.
summary

    For a successfully pushed ref, the summary shows the old and new values of the ref in a form suitable for using as an argument to git log (this is <old>..<new> in most cases, and <old><new> for forced non-fast-forward updates). For a failed update, more details are given for the failure. The string rejected indicates that git did not try to send the ref at all (typically because it is not a fast-forward). The string remote rejected indicates that the remote end refused the update; this rejection is typically caused by a hook on the remote side. The string remote failure indicates that the remote end did not report the successful update of the ref (perhaps because of a temporary error on the remote side, a break in the network connection, or other transient error).
from

    The name of the local ref being pushed, minus its refs/<type>/ prefix. In the case of deletion, the name of the local ref is omitted.
to

    The name of the remote ref being updated, minus its refs/<type>/ prefix.
reason

    A human-readable explanation. In the case of successfully pushed refs, no explanation is needed. For a failed ref, the reason for failure is described.

Note about fast-forwards

When an update changes a branch (or more in general, a ref) that used to point at commit A to point at another commit B, it is called a fast-forward update if and only if B is a descendant of A.

In a fast-forward update from A to B, the set of commits that the original commit A built on top of is a subset of the commits the new commit B builds on top of. Hence, it does not lose any history.

In contrast, a non-fast-forward update will lose history. For example, suppose you and somebody else started at the same commit X, and you built a history leading to commit B while the other person built a history leading to commit A. The history looks like this:


      B
     /
 ---X---A

Further suppose that the other person already pushed changes leading to A back to the original repository you two obtained the original commit X.

The push done by the other person updated the branch that used to point at commit X to point at commit A. It is a fast-forward.

But if you try to push, you will attempt to update the branch (that now points at A) with commit B. This does _not_ fast-forward. If you did so, the changes introduced by commit A will be lost, because everybody will now start building on top of B.

The command by default does not allow an update that is not a fast-forward to prevent such loss of history.

If you do not want to lose your work (history from X to B) nor the work by the other person (history from X to A), you would need to first fetch the history from the repository, create a history that contains changes done by both parties, and push the result back.

You can perform "git pull", resolve potential conflicts, and "git push" the result. A "git pull" will create a merge commit C between commits A and B.


      B---C
     /   /
 ---X---A

Updating A with the resulting merge commit will fast-forward and your push will be accepted.

Alternatively, you can rebase your change between X and B on top of A, with "git pull --rebase", and push the result back. The rebase will create a new commit D that builds the change between X and B on top of A.


      B   D
     /   /
 ---X---A

Again, updating A with this commit will fast-forward and your push will be accepted.

There is another common situation where you may encounter non-fast-forward rejection when you try to push, and it is possible even when you are pushing into a repository nobody else pushes into. After you push commit A yourself (in the first picture in this section), replace it with "git commit --amend" to produce commit B, and you try to push it out, because forgot that you have pushed A out already. In such a case, and only if you are certain that nobody in the meantime fetched your earlier commit A (and started building on top of it), you can run "git push --force" to overwrite it. In other words, "git push --force" is a method reserved for a case where you do mean to lose history.
Examples

git push

    Works like git push <remote>, where <remote> is the current branch's remote (or origin, if no remote is configured for the current branch).
git push origin

    Without additional configuration, works like git push origin :.

    The default behavior of this command when no <refspec> is given can be configured by setting the push option of the remote.

    For example, to default to pushing only the current branch to origin use git config remote.origin.push HEAD. Any valid <refspec> (like the ones in the examples below) can be configured as the default for git push origin.
git push origin :

    Push "matching" branches to origin. See <refspec> in the OPTIONS section above for a description of "matching" branches.
git push origin master

    Find a ref that matches master in the source repository (most likely, it would find refs/heads/master), and update the same ref (e.g. refs/heads/master) in origin repository with it. If master did not exist remotely, it would be created.
git push origin HEAD

    A handy way to push the current branch to the same name on the remote.
git push origin master:satellite/master dev:satellite/dev

    Use the source ref that matches master (e.g. refs/heads/master) to update the ref that matches satellite/master (most probably refs/remotes/satellite/master) in the origin repository, then do the same for dev and satellite/dev.
git push origin HEAD:master

    Push the current branch to the remote ref matching master in the origin repository. This form is convenient to push the current branch without thinking about its local name.
git push origin master:refs/heads/experimental

    Create the branch experimental in the origin repository by copying the current master branch. This form is only needed to create a new branch or tag in the remote repository when the local name and the remote name are different; otherwise, the ref name on its own will work.
git push origin :experimental

    Find a ref that matches experimental in the origin repository (e.g. refs/heads/experimental), and delete it.
git push origin +dev:master

    Update the origin repository's master branch with the dev branch, allowing non-fast-forward updates. This can leave unreferenced commits dangling in the origin repository. Consider the following situation, where a fast-forward is not possible:

                o---o---o---A---B  origin/master
                         \
                          X---Y---Z  dev

    The above command would change the origin repository to

                          A---B  (unnamed branch)
                         /
                o---o---o---X---Y---Z  master

    Commits A and B would no longer belong to a branch with a symbolic name, and so would be unreachable. As such, these commits would be removed by a git gc command on the origin repository.




</entry>

<entry [Sun May 22 20:00:42 EDT 2010] FIXED ICON CLASS ISSUE BY ADDING NEW ICONS TO dijit/icons/images/editorIconsEnabled.png>


LINE 1543 ADDED '!important':

.dijitEditorIcon {
	background-image: url(../../icons/images/editorIconsEnabled.png) !important; 
	background-repeat: no-repeat;

LINE 1598 ADDED NEW ICONS:

.dijitEditorIconView { background-position: -828px; }
.dijitEditorIconWorkflow { background-position: -846px; }
.dijitEditorIconProject { background-position: -864px; }
.dijitEditorIconReport { background-position: -882px; }
.dijitEditorIconAdmin { background-position: -900px; }
.dijitEditorIconHelp { background-position: -918px; }
.dijitEditorIconAgua { background-position: -936px; }



</entry>

<entry [Thu May 20 13:31:42 EDT 2010] INSTALLED UML::Class::Simple ON pegasus>


STRAIGHT INSTALL USING Makefile.PL DIDN'T WORK SO USED CPAN BUT ALSO FAILED (NB: ON pegasus)


o conf makepl_arg PREFIX=/nethome/bioinfo/apps/agua/0.5/lib/external

o conf mbuildpl_arg "--prefix /nethome/bioinfo/apps/agua/0.5/lib/external"

o conf commit


force install UML::Class::Simple

	
	Removing previously used /nethome/syoung/.cpan/build/UML-Class-Simple-0.18
	
	  CPAN.pm: Going to build A/AG/AGENT/UML-Class-Simple-0.18.tar.gz
	
	*** Module::AutoInstall version 1.03
	*** Checking for Perl dependencies...
	
	*** Since we're running under CPAN, I'll just let it take care
		of the dependency's installation later.
	[Core Features]
	- Test::More       ...loaded. (0.62)
	- File::Slurp      ...missing.
	- YAML::Syck       ...missing.
	- Carp             ...loaded. (1.04)
	- Devel::Peek      ...loaded. (1.03)
	- File::Spec       ...loaded. (3.12)
	- PPI              ...missing.
	- Class::Inspector ...missing. (would need 1.16)
	- IPC::Run3        ...missing.
	- List::MoreUtils  ...missing.
	- Template         ...missing.
	- XML::LibXML      ...loaded. (1.58)
	*** Module::AutoInstall configuration finished.
	Checking if your kit is complete...
	Looks good
	Warning: prerequisite Class::Inspector 1.16 not found.
	Warning: prerequisite ExtUtils::MakeMaker 6.42 not found. We have 6.30.
	Warning: prerequisite File::Slurp 0 not found.
	Warning: prerequisite IPC::Run3 0 not found.
	Warning: prerequisite List::MoreUtils 0 not found.
	Warning: prerequisite PPI 0 not found.
	Warning: prerequisite Template 0 not found.
	Warning: prerequisite YAML::Syck 0 not found.
	Writing Makefile for UML::Class::Simple
	error: The `dot` utility of your Graphviz not found in your system: 
	END failed--call queue aborted.
	Running make test
	  Make had some problems, maybe interrupted? Won't test
	Running make install
	  Make had some problems, maybe interrupted? Won't install





DEPENDENCIES OUTPUT FROM STRAIGHT INSTALL USING Makefile.PL:

 perl Makefile.PL PREFIX=/nethome/bioinfo/apps/agua/0.5/lib/external
*** Module::AutoInstall version 1.03
*** Checking for Perl dependencies...
[Core Features]
- Test::More       ...loaded. (0.62)
- File::Slurp      ...missing.
- YAML::Syck       ...missing.
- Carp             ...loaded. (1.04)
- Devel::Peek      ...loaded. (1.03)
- File::Spec       ...loaded. (3.12)
- PPI              ...missing.
- Class::Inspector ...missing. (would need 1.16)
- IPC::Run3        ...missing.
- List::MoreUtils  ...missing.
- Template         ...missing.
- XML::LibXML      ...loaded. (1.58)
==> Auto-install the 7 mandatory module(s) from CPAN? [y] y
*** Dependencies will be installed the next time you type 'make'.
    (You may need to do that as the 'root' user.)
*** Module::AutoInstall configuration finished.
Checking if your kit is complete...
Looks good
Warning: prerequisite Class::Inspector 1.16 not found.
Warning: prerequisite ExtUtils::MakeMaker 6.42 not found. We have 6.30.
Warning: prerequisite File::Slurp 0 not found.
Warning: prerequisite IPC::Run3 0 not found.
Warning: prerequisite List::MoreUtils 0 not found.
Warning: prerequisite PPI 0 not found.
Warning: prerequisite Template 0 not found.
Warning: prerequisite YAML::Syck 0 not found.
Writing Makefile for UML::Class::Simple
error: The `dot` utility of your Graphviz not found in your system: 
END failed--call queue aborted.




</entry>

<entry [Sun May 16 22:37:58 EDT 2010] AGUA UPGRADE TO 0.5 >

TRANSFERRED TO http://github.com/syoung/agua/issues

v0.5

	Pyramid merge
	Fix Workflow.js file upload
	Report input/output and link to View
	LazyFeatures JBrowse
	JBrowse feature generator
	Dojo 1.4.2 support
	Fix loading animated GIF
	
v0.6	
	Loop function
	File viewer
	Admin/Source directory verifier
	SGE support
	Short read alignment pileup viewer
	

VERSION 0.5 (****** = DONE)
-----------

****** GENERAL - CHANGE FROM svn TO git (COULD NOT CONVERT SO CREATED agua ANEW)

PULL MASTER FROM GITHUB:
git@github.com:syoung/agua.git

PUSH LOCAL master TO GITHUB
cd E:\0.5>
git push github master


PUSH LOCAL master TO LINODE
cd E:\0.5>
git push linode master

PULL master FROM LINODE
git clone ssh://root@74.207.235.81/srv/git/agua




****** GENERAL - CHANGE ALL NAMES (files, database, passwords) FROM AQWA TO agua

GENERAL -- FIX LOADING ANIMATED GIF

WORKFLOW - ENSURE NEW WORKFLOWS WORK ON KRONOS (PYRAMID MERGE, ETC.)

WORKFLOW - FIX FILE UPLOAD TO ALLOW MULTIPLE UPLOADS

REPORT - CHANGE REPORT TO TWO MODES:

	- SINGLE FILE MODE: SINGLE FILE IN --> SINGLE/MULTI(CHROMO) FILE OUT
	
		. ADD FILE UPLOAD
		
		. IMPLEMENT FILE BROWSE
		
		FILTERS WILL BE APPLIED ONLY TO THE SINGLE FILE IN THE FILE INPUT BOX (UPLOADED OR BROWSED)
	
	- ALL CHROMOSOME FILES MODE: MULTI FILE IN --> SINGLE/MULTI FILE OUT
	
		. VIEW GENOME/SINGLE CHROMOSOME AS THE OBJECT OF THE FILTER
		
		. FILTER APPLIED ON ALL CHROMOSOMES IN MULTI FILE INPUT
	
	- FINDS THE CHROMOSOMES BASED ON THE REFERENCE
		
	- (OPTIONAL) USE BUILD NUMBER OF REFERENCE DIR PATH FOR dbSNP SELECTION
	

VIEW - USE jbrowseFeatures.pl TO CONVERT .SAV REPORT OUTPUT INTO .JSON FILES

VIEW - ADD SCRIPT TO GENERATE JSON FROM .SAM OR .BAM FILE 




VERSION 0.6
-----------


WORKFLOW - ADD LOOP FUNCTION TO Workflow.pm TO RUN ALL SUBSEQUENT APPS


PROJECT
	
	- ADD FILE CONTENTS VIEW AND SCROLL DIALOG AS A RIGHT-CLICK MENU OPTION

	- ADD A FILE INFO DIALOG AS A RIGHT-CLICK MENU OPTION



ADMIN - ADD FILE CHECK TO SOURCE TOOL


WORKFLOW - ADD SGE SUPPORT AS Monitor::SGE



VIEW - INCORPORATE NEW JBROWSE INTO plugins/view


VIEW - ADD MULTIALIGN VIEWER FOR CLOSEUPS OF READS ALIGNED IN STACK


VIEW - INTEGRATE WIKI



</entry>

<entry [Sun May 16 22:36:58 EDT 2010] EC2 on Rails>

Get Version
0.9.9.1

Deploy a Ruby on Rails app on EC2 in five minutes

EC2 on Rails is an Ubuntu Linux server image for Amazon's EC2 hosting service that's ready to run a standard Ruby on Rails application with little or no customization. It's a Ruby on Rails virtual appliance.

If you have an EC2 account and can start EC2 instances you're five minutes away from deploying your Rails app.

EC2 on Rails is opinionated software: the opinion is that for many rails apps the server setup can be generalized and shared the same way as the web application framework itself. For many people (Twitter, this isn't for you) the server image can be treated the same way as other shared libraries. And if the day comes when your needs are unique enough that EC2 on Rails can't be configured to work for you then you can bundle your own image from it or fork the build source and customize it.

But until then, why spend your time configuring servers?

Features of the EC2 image:

Ready to deploy a Rails app with little or no configuration of the server required
Automatic backup of MySQL database to S3 (full backup nightly + incremental backup using binary logs every 5 minutes)
Capistrano tasks to customize the server image, archive and restore the database to/from S3, and more (available as a rubygem)
Mongrel_cluster behind Apache 2.2, configured according to Coda Hale's excellent guide
Ruby on Rails 2.1.0, 2.0.2 and 1.2.6
Ruby 1.8.6
MySQL 5
memcached
monit configured to monitor apache, mongrel, mysql, memcached, drive space and system load
Ubuntu 8.04 LTS Hardy base image built using Eric Hammond's EC2 Ubuntu script
SSL support
Amazon AMI tools installed
MySQL, Apache, and syslog configured to use /mnt for data and logging so you don't fill up EC2's small root filesystem
Automatically archives Rails and Apache logs to S3 nightly.
32-bit and 64-bit images available (supports all instance types, small to extra large).
Created using a build file, full source is available (the EC2 on Rails script is run from Eric Hammond's EC2 Ubuntu script)
Can be used as a clustered Rails app running on multiple instances
Automatically runs hourly, daily, weekly and monthly scripts if they exist in Rails application's script directory
Local Postfix SMTP mail server (only available from within the instance, not listening on external network interfaces)
Using the image

This documentation will be improved soon, for now hopefully this covers the basics.

The current AMI id's in the U.S. region are:

ami-5394733a (32-bit)
ami-5594733c (64-bit)
The current AMI id's in the E.U. region are:

ami-761c3402 (32-bit)
ami-701c3404 (64-bit)
I will keep these images available for as long as possible, they will not be deleted for at least a few years.

</entry>

<entry [Mon May 10 15:01:44 EDT 2010] COPIED agua/04/lib AND bin FROM PEGASUS TO KRONOS>

scp -r lib/* syoung@kronos.ccs.miami.edu:/nethome/bioinfo/apps/agua/0.4/lib

scp -r bin/* syoung@kronos.ccs.miami.edu:/nethome/bioinfo/apps/agua/0.4/bin





</entry>

<entry [Mon May 10 14:01:44 EDT 2010] MULTIPLE CHROMOSOMES WITH filterSNP>

1. BY DEFAULT ALL CHROMOSOMES ARE PROCESSED IN THE SAME WAY SO ONE out.sav.flt FILE PER CHROMOSOME

2. IF OUTPUTFILE IS SPECIFIED, ALL OUTPUTS FROM ALL out.sav FILES WILL BE PRINTED TO THIS FILE

3. 'chromosome' OPTION USED ONLY IN filterQuery



</entry>

<entry [Mon May 10 01:01:44 EDT 2010] FIXED 'BACKBUTTON' PROBLEM >

... BY ADDING index.html PAGE CONTAINING:


<script language="JavaScript" type="text/javascript"> 

	dojo.addOnLoad( function() {

		var url = window.location.href;
		var location = url.match(/(.+?)\?([^\?]+)$/)[2];

		window.open("agua.html?" + location, '_blank', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,navigation=0'); 

	}); // dojo.addOnLoad

</script>



THIS TRICK WITH _newtab DOESN'T SEEM TO WORK IN FIREFOX 3.5.9:

18 Nov, 2008 9:05 pm	[sdp=94382]  
I was looking for the exact same cod ebut couldnt find one then i saw this on google and here i am.. I noticed how to open a new window.. you use the target frame.. "target=_blank" so i thought i should try replacing "_blank" with "_newtab" just for kicks and see if it works and apperantly it does on most browsers.. i tried with ie7 and firefox and safari.. So ther you have it..


ADDING _newtab INSTEAD OF _blank

		window.open("agua.html?" + location, '_newtab', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=1,navigation=0'); 

... ONLY RESULTED IN THE SAME WINDOW BEING USED FOR EACH open.window (RATHER THAN A NEW WINDOW EACH TIME WITH _blank


</entry>

<entry [Wed Apr 28 11:30:07 EDT 2010] DOWNLOADED DBPEDIA ONTOLOGY>


bash-3.2$ wget -c http://downloads.dbpedia.org/3.5/en/mappingbased_properties_en.nt.bz2
--2010-04-22 16:20:44--  http://downloads.dbpedia.org/3.5/en/mappingbased_properties_en.nt.bz2
Resolving downloads.dbpedia.org... 139.18.2.37
Connecting to downloads.dbpedia.org|139.18.2.37|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 102162021 (97M) [application/x-bzip2]
Saving to: `mappingbased_properties_en.nt.bz2'

100%[=========================================================>] 102,162,021 47.6K/s   in 20m 4s

2010-04-22 16:40:48 (82.9 KB/s) - `mappingbased_properties_en.nt.bz2' saved [102162021/102162021]

bash-3.2$ 




</entry>

<entry [Wed Apr 21 12:26:29 EDT 2010] INTERESTING DNA MANIPULATION PAGE>

http://www.bioinformatics.org/sms
CHECK THESE IN PARTICULAR:

Shuffle
Translation
DNA Pattern Find
ORF Finder
TestCode

</entry>

<entry [Tue Mar 30 23:42:10 PDT 2010] FIXED 'INVISIBLE PANES' IN ADMIN PANE>

        <!-- LEFT PANE -->
        <div
            dojoAttachPoint="leftPane"
            class="leftPane"
			layoutAlign="left" 
            dojoType="dijit.layout.ContentPane" 
            style="position: absolute !important; top: 23px !important; width: 390px; height: 760px !important; min-width: 25px; background: #FFF; padding: 0; border: none !important;"
            >

            <!-- LEFT TAB CONTAINER-->
            <div dojoAttachPoint="leftTabContainer"
                dojoType="dijit.layout.TabContainer"
                style="height: 100%; overflow: visible;"    <====== ADDED 'overflow: visible'
                class="infoPane">
            </div>
            <!-- END OF LEFT TAB CONTAINER-->


</entry>

<entry [Tue Mar 30 23:42:10 PDT 2010] TABIX>


manual page
http://samtools.sourceforge.net/tabix.shtml

download 
http://sourceforge.net/projects/samtools/files/

DOWNLOAD FROM SRA:

Each of the above vcf files is accompanied by a .tbi file. This is 
a 'tabix' index file for faster access to selective regions of the vcf file.








Manual Reference Pages  - tabix (1)
NAME

    bgzip - Block compression/decompression utility

    tabix - Generic indexer for TAB-delimited genome position files 

CONTENTS

    Synopsis
    Description
    Options Of Tabix
    Example
    Notes
    Author
    See Also

SYNOPSIS

    bgzip [-cdh] [-b virtualOffset] [-s size] [file]

    tabix [-0] [-p [-s seqCol] [-b begCol] [-e endCol] [-S lineSkip] [-c metaChar] in.tab.bgz [region1 [region2 [...]]]

DESCRIPTION

    Tabix indexes a TAB-delimited genome position file in.tab.bgz and creates an index file in.tab.bgz.tbi when region is absent from the command-line. The input data file must be position sorted and compressed by bgzip which has a gzip(1) like interface. After indexing, tabix is able to quickly retrieve data lines overlapping regions specified in the format "chr:beginPos-endPos". Fast data retrieval also works over network if URI is given as a file name and in this case the index file will be downloaded if it is not present locally.

OPTIONS OF TABIX

    -p STR 	Input format for indexing. Valid values are: gff, bed, sam, vcf and psltab. This option should not be applied together with any of -s, -b, -e, -c and -0; it is not used for data retrieval because this setting is stored in the index file. [gff]
    -s INT 	Column of sequence name. Option -s, -b, -e, -S, -c and -0 are all stored in the index file and thus not used in data retrieval. [1]
    -b INT 	Column of start chromosomal position. [4]
    -e INT 	Column of end chromosomal position. The end column can be the same as the start column. [5]
    -S INT 	Skip first INT lines in the data file. [0]
    -c CHAR 	Skip lines started with character CHAR. [#]
    -0 	Specify that the position in the data file is 0-based (e.g. UCSC files) rather than 1-based.

EXAMPLE

    (grep ^"#" in.gff; grep -v ^"#" in.gff | sort -k1,1 -k4,4n) | bgzip > sorted.gff.gz;

    tabix -p gff sorted.gff.gz;

    tabix sorted.gff.gz chr1:10,000,000-20,000,000;

NOTES

    It is straightforward to achieve overlap queries using the standard B-tree index (with or without binning) implemented in all SQL databases, or the R-tree index in PostgreSQL and Oracle. But there are still many reasons to use tabix. Firstly, tabix directly works with a lot of widely used TAB-delimited formats such as GFF/GTF and BED. We do not need to design database schema or specialized binary formats. Data do not need to be duplicated in different formats, either. Secondly, tabix works on compressed data files while most SQL databases do not. The GenCode annotation GTF can be compressed down to 4%. Thirdly, tabix is fast. The same indexing algorithm is known to work efficiently for an alignment with a few billion short reads. SQL databases probably cannot easily handle data at this scale. Last but not the least, tabix supports remote data retrieval. One can put the data file and the index at an FTP or HTTP server, and other users or even web services will be able to get a slice without downloading the entire file.

AUTHOR

    Tabix was written by Heng Li. The BGZF library was originally implemented by Bob Handsaker and modified by Heng Li for remote file access and in-memory caching.

SEE ALSO

    samtools(1)
    
    
    



</entry>

<entry [Tue Mar 30 23:42:10 PDT 2010] INSTALL XAMPP FOR LINUX>

http://www.apachefriends.org/en/xampp-linux.html

Welcome to the Linux version of XAMPP
(on x86-compatible processors)
By the way: In the past this software was called LAMPP but to avoid misconceptions we renamed it to »XAMPP for Linux«. So if you are seeking for LAMPP you're on the right track. ;)

If you encounter any problems with XAMPP please feel free to get in touch with us. This will help us to improve XAMPP and make it more useful for everybody.

Jump-off point

 Pictures of XAMPP for Linux

Installation in 4 Steps

 Step 1: Download
 Step 2: Installation
 Step 3: Start
 Step 4: Test

READ ME

 A matter of security (A MUST READ!)
 Advanced start and stop parameters
 What is where?
 Stopping XAMPP
 Uninstall

 Pictures of XAMPP for Linux 

As the old saying goes, a picture is worth a thousand words. Here you can take a look at some screen shots of a XAMPP installation.


 Step 1: Download

Simply click on one of the links below. It's a good idea to get the latest version. :)
A complete list of downloads (older versions) is available at  SourceForge.

A detailed overview over the changes and contents of all XAMPP releases is available in the  RELEASE NOTES.

XAMPP for Linux 1.7.3a, 2010/1/10

Version	
Size	
Notice
 XAMPP Linux 1.7.3a	64 MB	 Apache 2.2.14, MySQL 5.1.41, PHP 5.3.1 & PEAR + SQLite 2.8.17/3.6.16 + multibyte (mbstring) support, Perl 5.10.1, ProFTPD 1.3.2c, phpMyAdmin 3.2.4, OpenSSL 0.9.8l, GD 2.0.1, Freetype2 2.1.7, libjpeg 6b, libpng 1.2.12, gdbm 1.8.0, zlib 1.2.3, expat 1.2, Sablotron 1.0, libxml 2.7.6, Ming 0.4.2, Webalizer 2.21-02, pdf class 009e, ncurses 5.3, mod_perl 2.0.4, FreeTDS 0.63, gettext 0.17, IMAP C-Client 2007e, OpenLDAP (client) 2.3.11, mcrypt 2.5.7, mhash 0.8.18, eAccelerator 0.9.5.3, cURL 7.19.6, libxslt 1.1.26, libapreq 2.12, FPDF 1.6, XAMPP Control Panel 0.8, bzip 1.0.5, PBXT 1.0.09-rc, PBMS 0.5.08-alpha, ICU4C Library 4.2.1 
MD5 checsum: 89c13779cf6f0925d5c1c400d31a1cc3
 Upgrade 1.7.2 to 1.7.3a	53 MB	 Upgrade package.   How to upgrade? 
MD5 checksum: 51580b88cabace20394114016fba5b82
 Upgrade 1.7.3 to 1.7.3a	0 MB	 Upgrade package.  How to upgrade?. 
MD5 checksum: 36d2cb29eed7510808faa9b74102fd1e
 Development package	33 MB	 The development package contains all files you need if you want to compile other software packages for XAMPP by yourself and the Unix manual pages. Install this package like the normal XAMPP distribution:
tar xvfz xampp-linux-devel-1.7.3a.tar.gz -C /opt 
MD5 checksum: 28bd139595be7fd307851680bebdacb4
Attention: If you download these files on a Windows system and you're running McAfee virus scanner you may get a false positive virus warning. This is a problem with McAfee and gzip-compressed files, it should be ignored.
 Step 2: Installation

After downloading simply type in the following commands:
Go to a Linux shell and login as the system administrator root:
su

Extract the downloaded archive file to /opt:
tar xvfz xampp-linux-1.7.3a.tar.gz -C /opt

Warning: Please use only this command to install XAMPP. DON'T use any Microsoft Windows tools to extract the archive, it won't work.

Warning 2: already installed XAMPP versions get overwritten by this command.

That's all. XAMPP is now installed below the /opt/lampp directory.
 Step 3: Start

To start XAMPP simply call this command:
/opt/lampp/lampp start

You should now see something like this on your screen:

Starting XAMPP 1.7.3a...
LAMPP: Starting Apache...
LAMPP: Starting MySQL...
LAMPP started.

Ready. Apache and MySQL are running.

If you get any error messages please take a look at the  Linux FAQ.

 Step 4: Test

OK, that was easy but how can you check that everything really works? Just type in the following URL at your favourite web browser:
http://localhost

Now you should see the start page of XAMPP containing some links to check the status of the installed software and some small programming examples.



The Instant Art example: A small PHP/GD program (since 0.9.6pre1 also a flashy PHP/Ming example, see screenshot). Thanks to  Anke Arnold for her font »AnkeCalligraph«.


A matter of security (A MUST READ!)

As mentioned before, XAMPP is not meant for production use but only for developers in a development environment. The way XAMPP is configured is to be open as possible and allowing the developer anything he/she wants. For development environments this is great but in a production environment it could be fatal.

Here a list of missing security in XAMPP:

The MySQL administrator (root) has no password.
The MySQL daemon is accessible via network.
ProFTPD uses the password "lampp" for user "nobody".
PhpMyAdmin is accessible via network.
Examples are accessible via network.
MySQL and Apache running under the same user (nobody).
To fix most of the security weaknesses simply call the following command:

/opt/lampp/lampp security
It starts a small security check and makes your XAMPP installation quite secure. For example this protects the XAMPP demo pages by a username ('lampp') and password combination.
See also our  XAMPP for Linux FAQ.



</entry>

<entry [Tue Mar 30 18:42:10 PDT 2010] The Ensembl Core Software Libraries>

http://genome.cshlp.org/content/14/5/929.full

The Ensembl Core Software Libraries
Arne Stabenau1, Graham McVicker1, Craig Melsopp1, Glenn Proctor1, Michele Clamp2, and Ewan Birney1,3
+ Author Affiliations

1EMBL European Bioinformatics Institute, Wellcome Trust Genome Campus, Hinxton, CB10 1SD, UK
2The Broad Institute, Cambridge, Massachusetts 02141-2023, USA
 
Next Section
Abstract

Systems for managing genomic data must store a vast quantity of information. Ensembl stores these data in several MySQL databases. The core software libraries provide a practical and effective means for programmers to access these data. By encapsulating the underlying database structure, the libraries present end users with a simple, abstract interface to a complex data model. Programs that use the libraries rather than SQL to access the data are unaffected by most schema changes. The architecture of the core software libraries, the schema, and the factors influencing their design are described. All code and data are freely available.

Previous Section
Next Section
The storage and manipulation of genome sequence and its associated information are at the heart of any genome informatics project. Such a project must provide persistent data storage and programmatic ways to access its information. Many bioinformatics applications use flat files as input and output, which has led to the development of several file-based methods of storage. For example, hierarchical directory structure has been used to organize the information (Wendl et al. 1998), and such a system was the basis of the project that developed into Ensembl. The Gene Ontology (Ashburner et al. 2000), and Pfam (protein families database of alignments), projects (Bateman et al. 1999) successfully use tools such as CVS (Concurrent Versions System) and RCS (Revision Control System) as layers of abstraction over file systems. Similarly, programmatic access to information has often grown organically, with individual programs or scripts interacting with the persistent data. One major drawback with an ad hoc scripting approach to persistent storage access is that it encourages the explosion of small, redundant scripts with no organized central path of access. Over any length of extended development, and as the number of personnel increases, such a system rapidly becomes unworkable.

At the onset of the Ensembl project there were two available bioinformatics frameworks with a well-structured approach to storing and manipulating genome data: ACeDB (Eeckman and Durbin 1995) and the NCBI toolkit (Wheeler et al. 2001). The ACeDB project was a source of many of our original ideas for modeling genome information, but we did not think that its binary-file-based method of persistent storage would scale to accommodate the human genome. The NCBI toolkit requires predominantly C-based programmatic access, and would have resulted in a longer development time and a steeper learning curve for biologists unfamiliar with the C language. In addition, the primary mechanism of persistence storage offered by the toolkit (ASN.1 binary files) still requires an indexing and large-scale storage system for efficiency. It was decided to use a relational database management system (RDBMS) because of its numerous benefits over a file-based approach. A relational database scales well, is accessible to users via a well-known query language (SQL), provides a means to index data for rapid queries, and allows many concurrent users to access the data at once.

Two reliable open-source RDBMSs were considered for persistent storage: MySQL and PostgreSQL. MySQL was chosen because of its faster performance and better long-string support, and a Perl application programming interface (API) was developed as the primary method of programmatic access.

Since the inception of the project, several other data storage and API solutions for genome information have become available. In particular, the GadFly project (Mungall et al. 2002) was started at approximately the same time as Ensembl, and we have had a productive exchange of ideas. The Grand Unified Schema (Bahl et al. 2003) also matured into a successful project. There are several effective in-house RDBMS projects for storing genome information, such as the Saccharomyces Genome Database (Weng et al. 2003) and Mouse Genome Informatics (Baldarelli et al. 2003). Although these projects provide excellent Web access to their resources, their schemas and code bases are either unavailable or their use is limited. The WormBase project has been migrating from a pure ACeDB system toward a mixed ACeDB and RDBMS (Stein et al. 2001). Several of these projects are now coordinating via the Generic Model Organism Database (Stein et al. 2002) consortium to provide common tools. The UCSC genome browser uses a relational database and a C-language implementation (Karolchik et al. 2003). Finally, there have been several commercial genome management products based on proprietary technology from Softberry, Celera, and Doubletwist.

Ensembl enjoyed interacting with many of these other developers, and freely shares all of its code and ideas. The rest of this article describes Ensembl's database and API, which have been the result of four years of development. Some decisions were well thought out and stood the test of time; others were due to the rapid pace of development, in particular at the start of the project. The Ensembl system has proven flexible enough to be adopted for many genome projects. In house, Ensembl is currently used to annotate or display nine species, and externally the Ensembl system has been extended for use with the genomes of many organisms including Arabidopsis, rice, and numerous pathogens.

Previous Section
Next Section
Design Process

The Ensembl database is used in two distinct phases and has two resultant patterns of usage. The first phase is the production of the data and involves a high volume of both reads and writes to the database. The second phase, the presentation of the data by a Web interface, requires rapid read-only access to the database. It was decided to serve both phases with the same schema and programming interface despite their divergent patterns of usage. A single code base has the advantages that there is less code to maintain, it removes the necessity of a postdata production denormalization, and it leads to more robust and flexible code. It does, however, prevent the use of certain database speed optimization methods and leads to a compromise between normalization of data, query optimization, and development time.

We avoided autogenerating the code or schema from a higher-level language (e.g., UML, XML) because we found that autogenerated systems were too slow and that they invariably required customization for particular use cases.

Previous Section
Next Section
Database

All annotation and sequence data are stored in an MySQL RDBMS. The tables defined in the Ensembl schema can be divided into three functional categories: tables for the storage of DNA and assemblies, tables for the storage of computed features and genes, and tables containing miscellaneous information. Figure 1 provides a general outline of the database structure.


View larger version:
In this page In a new window
Download as PowerPoint Slide
Figure 1
Entity relationship model of the Ensembl schema. Tables are represented as divided rectangles consisting of a boldface table name at the top and a list of table attributes and attribute types below. Internal identifiers and join tables are omitted. Relationships between tables are represented by lines labeled with the relationship type: 1___1...n one to one-or-many relationship; 1___1 one-to-one relationship; 1___0...n one to zero-or-many relationship; 1...n___1...n one-or-many to one-or-many relationship; 1...2___0...n one-or-two to zero-or-many relationship.

The basic unit of sequence is stored in the contig table. It contains information about contiguous sequence from BAC clone files in the EMBL database. The string representation of the DNA sequence for a contig is stored in the dna table. Each contig row references a row in the clone table that provides additional detail about the BAC clone. Unfinished clones are comprised of multiple contig rows; a finished clone consists of a single contig. The information needed to assemble chromosomal sequence from the set of contig sequences is stored in the assembly table.

Various features are positioned on the genome sequence and stored in database tables. All features define a genomic position through a reference to a contig and start and end coordinates on the contig. Example feature tables are dna_align_ feature and protein_align_feature for alignments from similarity searches, repeat_feature for repeats, marker_feature for marker positions, prediction_transcript for ab initio gene (transcript) predictions, and simple_feature for general annotations with genomic positions. Some features contain additional, nonpositional information in related tables. For example, marker features have details about the marker in the marker table, biological mapping information in marker_map_ location, and alternative names in marker_synonym.

An innovation in the storage of similarity search results is the compression of gapped alignment information in the form of dense character strings. This was originally developed as an output format from Exonerate (G. Slater, unpubl.) and is known by its original acronym cigar (concise idiosyncratic gapped alignment report). Alignment features store the full extent of the gapped alignment and a cigar line. Each cigar line consists of an alternating series of numbers and letters, for example, 40M2I12M4D, with the letters standing for Match, Insertion, or Deletion. The number preceding each letter dictates the length of the match, insertion, or deletion; used together with the feature's start and end coordinates, the complete alignment can be reconstructed. Prior to the adoption of cigar lines, alignments in Ensembl were stored as multiple ungapped features, with a single row for each matching region of the alignment. The storage of alignments as a single gapped row has reduced the size of Ensembl's similarity tables by 60%.

The more complex structure of a gene is distributed over multiple tables. A gene from Ensembl's perspective is a set of transcripts that share at least one exon. This is a more limited definition than, for example, a genetic locus, but it describes a relationship that can be easily identified computationally. A row in the gene table relates to one or more transcript table rows, each of which references a list of exon_transcript table rows that describe the ordering of exons in each transcript. Exons and their associated genomic positions are stored in the exon table. Transcripts reference zero or one translation table rows that describe the composition of untranslated regions and coding sequences. Pseudogenes and ncRNAs are examples of transcripts without translations. For some genes, we provide a gene_description that is derived from a SWISS-PROT database entry with a sufficiently similar protein sequence. Evidence for predicted exons is provided by links to alignment features (in the dna/protein_align_feature tables) via entries in the supporting_feature table.

Exons are predicted with chromosomal positions but stored with contig positions. The chromosomal coordinate system changes with each new assembly of a genome, and is thus more volatile than the contig coordinate system. Storing exons in contig coordinates ensures that unchanged exons have unchanged coordinates. One drawback to this approach is that exons may span multiple contigs when converted from chromosomal coordinates. Exons that cross contig boundaries occupy multiple rows in the exon table and are distinguished from ordinary exons by a sticky_rank attribute. When these split exons are retrieved from the database they are reassembled into a single exon by the API software.

Across different releases of human genome assemblies and other sequence data, Ensembl provides changing gene predictions. To allow the user to track a particular gene prediction despite changing coordinates, all gene-related predictions are assigned stable identifiers. These are stored in the gene_stable_id, exon_stable_id, transcript_stable_id, and translation_ stable_id tables. Between two versions of a genome we determine the correspondence between the old and new predictions, taking into account changes in genomic position or sequence. New predictions with a sufficiently high similarity to a previously made prediction inherit the previous prediction's stable identifier.

The database follows some simple naming conventions to facilitate easier understanding and maintenance. Tables generally have integer primary keys that follow a column-naming convention of tablename_id, and foreign keys referencing other tables' primary keys use the same column names to be easily identifiable. Following this convention, every table with a locatable annotation has a contig_id column that is a foreign key referencing the contig_id primary key of the contig table. Additionally, each of the feature tables uses the same column names, contig_start, contig_end, and contig_strand, to describe the precise locations of features on a given contig.

Code

Ensembl's database access layer is written in Perl because of its numerous advantages as an implementation language. Perl is widely used in the bioinformatics and biology community, and it is a language well suited for writing Web applications. Another important factor was that Ensembl was originally created out of a Perl-based human annotation project, and parts of the existing software could be reused.

Adoption of Perl also enabled Ensembl to leverage the existence of the BioPerl project (Stajich et al. 2002). BioPerl provided a base for an initial object model and aided in the dumping and parsing of flat files. As Ensembl has become more complex over its lifetime, this dependence on BioPerl has slowly diminished. Currently there is very little BioPerl dependence inside Ensembl, and we are considering replacing the hard dependencies and producing a separate Ensembl-to-BioPerl bridge.

However, some aspects of Perl are not well suited for a software project of Ensembl's size. Whereas weak typing allows for rapid program development, absence of compile time checking of function prototypes and variable types is a steady source of runtime errors. Another disadvantage of Perl is its reference-count-based garbage collector, which effectively limits the use of circular references. Variables that are part of a circular reference structure are never garbage-collected and can introduce potentially serious memory leaks. Avoidance of circular reference memory leaks has necessitated some compromises to the overall system design. As described below, a Java API was developed to test ideas and allow gradual progression to a more strongly typed language.

Ensembl models real-world biological constructs as data objects. For example, Gene objects represent genes, Exon objects represent exons, and RepeatFeature objects represent repetitive regions. Data objects provide a natural, intuitive way to access the wide variety of information that is available in a genome. All information relating to a data object can be obtained by querying the object's methods. As an example, a Transcript object can provide the user with its identifier, its exons and its translation, and the like.

Data representation and database access are cleanly separated in the Ensembl API. Database access code resides exclusively in adaptor classes that create data objects. Each data object x (e.g., a Gene) has an adaptor class xAdaptor (e.g., GeneAdaptor) responsible for generating database queries on tables associated with x and instantiating objects of type x. Adaptors provide multiple ways to retrieve and store data objects from the database via methods that follow strict naming conventions. This separation of logic enables adaptor classes to share query generation code and insulates data objects from underlying schema changes. The modularity of this design also makes it easy to add new data objects to the system.

The decoupling of database logic additionally allows the transparent substitution of one data source for another. The abstraction of the data sources allows them to be interchanged to address particular flexibility and performance needs. This tactic is utilized by the Ensembl system to improve the retrieval speed of some features through the use of a query-optimized denormalized database (known as the lite database). Retrieval from the optimized database is facilitated by ProxyAdaptor classes that dynamically decide to forward requests to either the default data source or to the optimized data source.

The DBAdaptor is a specialized adaptor that maintains a connection to the database and acts as a factory for object adaptors. The centralized object adaptor creation code can ensure that only a single object adaptor of each type is created per database. This enables the object adaptors to cache instances of the features they retrieve and to improve overall performance.

A Container class alleviates memory leaks created by the circular references between the DBAdaptor and its object adaptors. Upon instantiation, DBAdaptor objects are transparently wrapped in a Container object that dynamically forwards method calls destined for the enclosed DBAdaptor. The Container object is external to the circular reference hierarchy, and it is responsible for breaking the circular references after it passes out of scope. Users of the API are, in most circumstances, unaware of the existence of the Container object, and it serves as an effective, hidden solution to the memory leak problem.

Specific regions of genomic sequence are represented as either Slice or RawContig objects. Feature objects with genomic locations can be retrieved using method calls on either of these sequence objects. A RawContig object represents a single contiguous piece of sequence and a single row in the contig table. A Slice object does not correspond directly to a particular table in the database, but represents a portion of chromosomal sequence assembled from smaller contigs that may contain gaps. All database access code resides in adaptor classes; Slice and RawContig methods merely delegate object and sequence retrieval to the responsible adaptors.

In the unfinished human genome, RawContig objects were the primary method of sequence and feature retrieval. As more assembled sequence data have become available, Slice objects have emerged as the predominant method of access. Even when Slices will be based on completely finished genomes with no underlying contigs, their usage will remain the same. This is one major advantage of an API-based approach to genomic data storage.

The primary coordinate system in which all database features are stored has remained contig-based despite the common usage of a chromosomal-based coordinate system. Rather than distributing coordinate transformation code throughout the code base, we introduced a general Mapper class that encapsulates coordinate transformation between two sequences. A more specific AssemblyMapper class utilizes the Mapper object and the contents of the assembly table to translate from contig-based coordinates to chromosomal coordinates and vice versa.

Object creation and coordinate transformation have an impact on the speed of the API. An application that uses the API will be slower than one that uses SQL to access the database directly. The Perl API requires ?0.40 sec to retrieve 1000 features from a 1-MB region; the Java code version needs similar time. To retrieve the same data as arrays using SQL via Perl DBI requires ?0.15 sec. For our dominant use cases we find this is an acceptable performance decrease.

The following code is a typical example for EnsEMBL database access.

# create a database connection my $db=Bio::EnsEMBL::DBSQL::DBAdaptor?new (-host ? `ensembldb.ensembl.org', -user ? `anonymous', -dbname ? `homo_sapiens_core_19_34' ); # get a slice adaptor my $sliceadaptor=$db?get_SliceAdaptor(); # get a slice from 10MB to 20MB on Chromosome 1 my $slice=$slicedaptor?fetch_by_chr_start_end ( `1', 10_000_000, 20_000_000 ); # retrieve some features from the slice my $features=$slice?get_all_protein_align_features ( `SWALL' );

We aim to have the greatest possible ease of use for the Perl API. It should not just support our gene prediction process and Web display code, but it should also make it simple for researchers to perform their own genome analysis tasks. We have a tutorial document available online (http://www.ensembl.org/Docs/ensembl_tutorial.pdf) and open access to a MySQL server (ensembldb.ensembl.org); all source code is available through anonymous CVS.

Perl suffers from certain disadvantages as an implementation language for a large-scale project. Java overcomes many of these problems and has the benefits of compile time type checking, enforced interfaces, multi threading, better support for graphical user interfaces, and correct garbage collection of circularly referenced objects. We have written a Java version of the core Ensembl API that offers very similar data access logic to the Perl API. Additionally, the Java API separates interface from implementation for all standard data objects and adaptors and thus allows for transparent alternative implementations. It is used by the standalone genome browser Apollo, and it is used internally for the stable identifier mapping process and by various other projects such as Toucan (Aerts et al. 2003) and Sockeye (Montgomery et al. 2004).

The above Perl code example would look like the following written in Java:

public class FeatureRetrieval { public static void main( Strings[] args) { Driver d = new MySQLDriver( ensembldb.ensembl.org, homo_sapiens_core_19_34, anonymous ); Location loc = new AssemblyLocation ( 1, 10000000, 20000000 ); List proteinAlignments = d.getDnaProteinAlignmentAdaptor(). fetch(loc, SWALL ); } }

Ensembl releases about 35 databases on a monthly basis. To ensure their relational integrity and to validate that they are populated with reasonable data, several SQL-based tests are performed using a Java quality assurance system named ensjhealthcheck. The system consists of groups of tests individually encapsulated into Java classes. It is relatively easy, even for Java newcomers, to write integrity checks that are automatically detected and used. Since the introduction of the ensj-healthcheck system, better consistency over schemas has been achieved, and it has become easier to detect data errors at an early stage. Newly detected errors are added to the existing suite of test cases and are prevented from reoccurring.


Future

The current Ensembl system is biased toward a clone-based genome project. Every genome imported into Ensembl requires entries in the clone, contig, chromosome, and assembly tables. Whole-genome shotgun assemblies do not naturally fit into this mould, either because they do not have clones or because the assembly may be fragmented into thousands of scaffolds instead of chromosomes.

The Ensembl sequence storage system will be improved by replacing the contig, clone, and chromosome tables with a single general sequence region table. A modified assembly table will describe the composition of arbitrary sequence regions rather than the makeup of chromosomes from contigs. Locatable features will be stored with coordinates relative to sequence regions and will not be limited to storage in the contig coordinate system. Effectively, bias toward particular coordinate systems will be removed; the system will become more flexible and will accommodate a wider variety of methods of sequencing and assembly.

The Ensembl system will also be extended to include support for alternative sequence regions. This will include the ability to represent structural haplotypes with highly divergent sequence (e.g., the MHC region) and pseudoautosomal regions on sex chromosomes.

The generalization of the sequence and assembly storage and the addition of new features are expected to require only minor changes to the existing programming interface. Users will be shielded from the low-level database and code changes by the layers of abstraction in the existing system. The current API will continue to function in nearly all cases, but some functions and naming conventions will slowly replace the current ones. Retrieval speed should improve as features can be calculated and stored in the coordinate system in which they are predominantly requested.

There exists a myriad of ways to store and manipulate genome sequence; the Ensembl system is a robust and scaleable solution. It is reassuring that the core concepts from the project inception (e.g., genes, transcripts, and features) have remained intact, despite the progressive evolution toward the existing maintainable and scaleable architecture. A similar dynamic of evolutionary development is expected to occur over the next five years with the Ensembl database and API providing the central support for genome information.

Previous Section
Next Section
Acknowledgments

The Ensembl group is funded primarily by the Wellcome Trust with additional funding from EMBL and NIH-NIAID. We thank the other members of the Ensembl group for their support and patience during the development of the system. We also thank Nicole Redaschi, Simon Mercer, and Chris Mungall for insightful design comments.

The publication costs of this article were defrayed in part by payment of page charges. This article must therefore be hereby marked advertisement in accordance with 18 USC section 1734 solely to indicate this fact.



</entry>

<entry [Tues Mar 30 16:20:31 EDT 2010] NICE LIST OF UCSC FEATURE TRACKS ON HAPMAP GBROWSE>

http://hapmap.ncbi.nlm.nih.gov/cgi-perl/gbrowse/hapmap3r2_B36/

Overview    All on  All off 

 dbSNP SNPs/500Kb	 GWA studies (NHGRI Catalog)	 NT contigs	 
 gt'd SNPs/500Kb	 Ideogram	 OMIM disease associations	 

    Region    All on  All off 
 Copy Number Variation	 Entrez genes	 GWA studies (NHGRI Catalog)	 
 dbSNP SNPs/20Kb	 gt'd SNPs/20Kb	 OMIM disease associations	 

    Copy Number Variation    All on  All off 
 Deletions (Conrad et al.)	 Genomic Variants (Iafrate et al.)	 Genomic Variants (Redon et al.)	 Genomic Variants (Simon-Sanchez et al.)
 Deletions (Hinds et al.)	 Genomic Variants (Locke et al.)	 Genomic Variants (Sebat et al.)	 Genomic Variants (Tuzun et al.)
 Deletions (McCarroll et al.)	 Genomic Variants (Mills et al.)	 Genomic Variants (Sharp et al.)
 
    Genomic Variants (Wong et al.)
    DNA    All on  All off 
 3-frame translation (forward)	 3-frame translation (reverse)	 Contigs	 DNA/GC Content

    Gene Function    All on  All off 
 OMIM disease associations	 	 	 
    Genes    All on  All off 
 Ensembl genes	 Entrez genes	 	 

    Genetic Associations    All on  All off 
 Genome-Wide Association studies (NHGRI Catalog)	 	 	 

    Pathways    All on  All off 
 Reactome pathways	 	 	 

    Variation    All on  All off 
 dbSNP SNPs	 Genotyped SNPs	 Recombination rate (cM/Mb)	 Sequence Tagged Sites

    Analysis    All on  All off 
 LD Heat Plot	 LD Plot	 Phased Haplotype Display	 tag SNP Picker


</entry>

<entry [Mon Mar 29 16:20:31 EDT 2010] USE Net::Amazon::EC2 TO GET INSTANCES AND DETERMINE THE HEAD NODE >


1. GET INSTANCES BELONGING TO THE SAME RESERVATION

2. DETERMINE WHICH IS THE HEAD NODE AND WHICH ARE THE EXECUTION HOSTS



/data/aqwa/0.3/bin/scripts/ngsdev.pem
chmod 400 ngsdev.pem 

ssh -i ngsdev.pem root@ec2-72-44-49-0.compute-1.amazonaws.com

[syoung@ngsdev temp]$ cat /data/aqwa/0.3/bin/scripts/ngsdev.pem

-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAupPfT8MrMqgJifJLqsSnPSb/S0v8mjHFSoBnO5v9JyEPdIdCBPblF4HrZlyj
kISzmMjCXcVZUR/8y1Xz5WCIoM0vWNMUMGa7U9bIzi+ClhKJC53iWrHxQlETFH88fXk1LZ94V+Zn
MXOwj02aQ18GyCsxIIx4h0rrFGHnQHHyOzIPIIPT9VgrkHSYvBbeuLZSgrVEF5KTsp5fpCj/QUkz
vWN3ZA+IyXtsQ8BFf0OdwK8RlDwQQTTKN1eN9azoOuzvZ/BzUuxpFgGgKHSjMFuQGs7ADRefrGQc
2sJH+81gkUndfX3md5DewQlGYxaolfpmJC1ohv+PD25NYzGr+x4FyQIDAQABAoIBAQC5/zIOfNzy
ievAdigSnCqwXtEACkdOnDE23RyMoyvSNzYGD9SzyEGHlr/J8q4oIvI7bF+/RT6ODhpfxlb2oq5x
xzrdDMfCnJdAtAzI5zoCS4YNa568lUmSt+oSc+kkmJF34tMApbLX7KHlqhIP+Yp0QAKglQiOrxP8
5MC5UR6O/Nqh/LVBBTWzrOysCpINzLBBpvfdJpN7Bf4SJrCm1YpIZK7hYsaDVAwceU+u6u1SASfJ
Rn1c6OTqwXAOW2h6w1vhuPFs02eUX1mjSCvF3l+Ylmcl7kt2bGz2g5VTAMkgBP6IDmhqrag2gFh8
wI8m6Cl1b031upsDlR/oVnaNYM6lAoGBAOph5DKgIR+EcSgTAAceTRjiKS1+AsIfRl7NwIXuHreP
drG72WEw42qigQ2Fx97SrTXLpjT3UO2ZnTRz7WnRfUUD+D34L+2riYRiuEqkEwwEKyyNPua8CkHH
upEmOmvsE4k+lOCayPN4B+I/IJhVMtOH50thcsPgrWlyDNtH1GGfAoGBAMvJPbVxbvWpYJkvQf25
RPPO15LxCr9sWZwEUR4AOYX8xNO1SN2IwuQyYuMZ8+H02c88NENC8Bd8wtpwMRuq9snk3pjl5wG7
MzId0mL4gjBbSAInQggNXfn0lAVBLCsChDJxDdiWy1kc7+NFrMA22GGSytT+TRrvztaDCCEQK++X
AoGATUU0nFQaV2+sdo+9BJvCwx9cf/j5I9J3uq2OeRkF23JaqUHK6rXZY8BrV2/xcs51+DRJeVDH
x21LXI2Tib1c1TH310ZJVsukrJZ3N3RcKyv8p9VxFVSM9R7JrSyzOf08e5S8NEgTU+EQiFBTiKUd
+orlf/6CfX1G7mqBPpGxvPUCgYEAiXX6kRyt+znAdjQBcJN7ZnY8xdqgJFWC8JGc4f7GzpGddy0O
tJie1e0C9Su5bc6K6ZYzrrdFWqKGkXAiQAaHp9IhMMPLmkhbFVA2bRoyP0ojfYhbqzDRFl0bR5wZ
nf15jMjjzRiSnE6/pe+GwrV8Kf0popjTC/t86wfCAQN2j4sCgYBgkhKuYuu6+Pv7Pw+fzcDjlRQK
KqpxkPRKF9Opjx8qqRbipKfiXPy/9D8kuVqgfsqLVIBCuWwdRU2s2WY/FyiooxqUFSUKIJvjMTLf
dI91UCMzKxJt2PTPe/DROAzt15V6sjhxQ62FhGgOKrqy8uJa1jkxEdlqiKsFqx2JX8p+0A==
-----END RSA PRIVATE KEY-----



AWS ACCESS KEY ID:
AKIAIZXZ6S7ARZ44TTHQ

AWS SECRET ACCESS KEY:
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


TEST USING THIS SCRIPT:


use Net::Amazon::EC2;

my $ec2 = Net::Amazon::EC2->new(
       AWSAccessKeyId => 'PUBLIC_KEY_HERE', 
       SecretAccessKey => 'SECRET_KEY_HERE'
);

# Start 1 new instance from AMI: ami-XXXXXXXX
my $instance = $ec2->run_instances(ImageId => 'ami-XXXXXXXX', MinCount => 1, MaxCount => 1);

my $running_instances = $ec2->describe_instances;

foreach my $reservation (@$running_instances) {
   foreach my $instance ($reservation->instances_set) {
       print $instance->instance_id . "\n";
   }
}

my $instance_id = $instance->instances_set->[0]->instance_id;
print "INSTANCE ID: $instance_id\n";

# Terminate instance
my $result = $ec2->terminate_instances(InstanceId => $instance_id);


RUN OUTPUT:

    
export PERL5LIB=/tmp/temp/lib/perl5/5.8.8:$PERL5LIB;
export PERL5LIB=/tmp/temp/lib64/perl5/site_perl/5.8.8:$PERL5LIB;
export PERL5LIB=/tmp/temp/lib/perl5/site_perl/5.8.8:$PERL5LIB;
export PERL5LIB=/tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi:$PERL5LIB;
export PERL5LIB=/tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi:$PERL5LIB;

cd /data/agua/0.4/bin/apps;
./test-NetEc.pl


    
    instance: 
    $VAR1 = bless( {
                     'instances_set' => [
                                          bless( {
                                                   'subnet_id' => undef,
                                                   'placement' => bless( {
                                                                           'availability_zone' => 'us-east-1c'
                                                                         }, 'Net::Amazon::EC2::PlacementResponse' ),
                                                   'kernel_id' => 'aki-a71cf9ce',
                                                   'root_device_name' => undef,
                                                   'architecture' => undef,
                                                   'ami_launch_index' => '0',
                                                   'image_id' => 'ami-0859bb61',
                                                   'private_dns_name' => undef,
                                                   'ip_address' => undef,
                                                   'platform' => undef,
                                                   'vpc_id' => undef,
                                                   'instance_state' => bless( {
                                                                                'name' => 'pending',
                                                                                'code' => '0'
                                                                              }, 'Net::Amazon::EC2::InstanceState' ),
                                                   'launch_time' => '2010-03-30T02:41:40.000Z',
                                                   'dns_name' => undef,
                                                   'instance_id' => 'i-e3c84988',
                                                   'reason' => undef,
                                                   'key_name' => undef,
                                                   'root_device_type' => 'instance-store',
                                                   'monitoring' => 'disabled',
                                                   'state_reason' => bless( {
                                                                              'message' => 'pending',
                                                                              'code' => 'pending'
                                                                            }, 'Net::Amazon::EC2::StateReason' ),
                                                   'ramdisk_id' => 'ari-a51cf9cc',
                                                   'block_device_mapping' => undef,
                                                   'private_ip_address' => undef,
                                                   'instance_type' => 'm1.small'
                                                 }, 'Net::Amazon::EC2::RunningInstances' )
                                        ],
                     'owner_id' => '728213020069',
                     'group_set' => [
                                      bless( {
                                               'group_id' => 'default'
                                             }, 'Net::Amazon::EC2::GroupSet' )
                                    ],
                     'reservation_id' => 'r-cead9ba6'
                   }, 'Net::Amazon::EC2::ReservationInfo' );
    instance->instance_id: i-73c94818
    instance->instance_id: i-dfc948b4
    instance->instance_id: i-e3c84988
    instance_id: i-e3c84988
    
    Run time: 00:00:02
    Completed ./test-NetEc.pl
    10:41PM, 29 March 2010
    ****************************************



USE run_instances METHOD'S InstanceType ARGUMENT TO SPECIFY 64-BIT INSTANCE:


    [syoung@ngsdev apps]$ ./test-NetEc.pl
    instance: 
    $VAR1 = bless( {
                     'instances_set' => [
                                          bless( {
                                                   'subnet_id' => undef,
                                                   'placement' => bless( {
                                                                           'availability_zone' => 'us-east-1c'
                                                                         }, 'Net::Amazon::EC2::PlacementResponse' ),
                                                   'kernel_id' => 'aki-b51cf9dc',
                                                   'root_device_name' => undef,
                                                   'architecture' => undef,
                                                   'ami_launch_index' => '0',
                                                   'image_id' => 'ami-0a59bb63',
                                                   'private_dns_name' => undef,
                                                   'ip_address' => undef,
                                                   'platform' => undef,
                                                   'vpc_id' => undef,
                                                   'instance_state' => bless( {
                                                                                'name' => 'pending',
                                                                                'code' => '0'
                                                                              }, 'Net::Amazon::EC2::InstanceState' ),
                                                   'launch_time' => '2010-03-30T02:53:26.000Z',
                                                   'dns_name' => undef,
                                                   'instance_id' => 'i-efcc4d84',
                                                   'reason' => undef,
                                                   'key_name' => undef,
                                                   'root_device_type' => 'instance-store',
                                                   'monitoring' => 'disabled',
                                                   'state_reason' => bless( {
                                                                              'message' => 'pending',
                                                                              'code' => 'pending'
                                                                            }, 'Net::Amazon::EC2::StateReason' ),
                                                   'ramdisk_id' => 'ari-b31cf9da',
                                                   'block_device_mapping' => undef,
                                                   'private_ip_address' => undef,
                                                   'instance_type' => 'm1.large'
                                                 }, 'Net::Amazon::EC2::RunningInstances' )
                                        ],
                     'owner_id' => '728213020069',
                     'group_set' => [
                                      bless( {
                                               'group_id' => 'default'
                                             }, 'Net::Amazon::EC2::GroupSet' )
                                    ],
                     'reservation_id' => 'r-6ca99f04'
                   }, 'Net::Amazon::EC2::ReservationInfo' );
    instance->instance_id: i-73c94818
    instance->instance_id: i-dfc948b4
    instance->instance_id: i-e3c84988
    instance->instance_id: i-2dcc4d46
    instance->instance_id: i-efcc4d84
    instance_id: i-efcc4d84
    
    Run time: 00:00:03
    Completed ./test-NetEc.pl
    10:54PM, 29 March 2010
    ****************************************



my $instance = $ec2->run_instances(
    InstanceType => 'm1.large',
    ImageId => 'ami-0a59bb63',
    MinCount => 1,
    MaxCount => 1
);

InstanceType (optional)

    Specifies the type of instance to start. The options are:
    
    m1.small (default)
    1 EC2 Compute Unit (1 virtual core with 1 EC2 Compute Unit). 32-bit, 1.7GB RAM, 160GB disk
    
    m1.large: Standard Large Instance
    4 EC2 Compute Units (2 virtual cores with 2 EC2 Compute Units each). 64-bit, 7.5GB RAM, 850GB disk
    
    m1.xlarge: Standard Extra Large Instance
    8 EC2 Compute Units (4 virtual cores with 2 EC2 Compute Units each). 64-bit, 15GB RAM, 1690GB disk
    
    c1.medium: High-CPU Medium Instance
    5 EC2 Compute Units (2 virutal cores with 2.5 EC2 Compute Units each). 32-bit, 1.7GB RAM, 350GB disk
    
    c1.xlarge: High-CPU Extra Large Instance
    20 EC2 Compute Units (8 virtual cores with 2.5 EC2 Compute Units each). 64-bit, 7GB RAM, 1690GB disk
    
    m2.2xlarge
    13 EC2 Compute Units (4 virtual cores with 3.25 EC2 Compute Units each). 64-bit, 34.2GB RAM, 850GB disk
    
    m2.4xlarge
    26 EC2 Compute Units (8 virtual cores with 3.25 EC2 Compute Units each). 64-bit, 68.4GB RAM, 1690GB disk

    
    
    
TROUBLESHOOTING


ERROR:

    instance: 
    $VAR1 = bless( {
                     'errors' => [
                                   bless( {
                                            'message' => 'The requested instance type\'s architecture (i386) does not match the architecture in the manifest for ami-0a59bb63 (x86_64)',
                                            'code' => 'InvalidParameterValue'
                                          }, 'Net::Amazon::EC2::Error' )
                                 ],
                     'request_id' => '55e8f2aa-9a97-452a-a026-3f926b396d90'
                   }, 'Net::Amazon::EC2::Errors' );
    Can't locate object method "instances_set" via package "Net::Amazon::EC2::Errors" at ./test-NetEc.pl line 108.


SOLUTION:

CHOOSE A 32-BIT AMI 



INSTALL Net::Amazon::EC2 ON ngsdev
==================================

1. INSTALLED PREREQUISITES

INSTALL MRO::Compat
===================

cd /tmp;
wget http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/MRO-Compat-0.11.tar.gz

perl Makefile.PL  PREFIX=/tmp/temp
make
make install

    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/MRO/Compat.pm
    Installing /tmp/temp/share/man/man3/MRO::Compat.3pm
    Appending installation info to /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod


INSTALL Class::MOP
==================

Checking if your kit is complete...
Looks good
Warning: prerequisite Class::MOP 0.98 not found.
Warning: prerequisite List::MoreUtils 0.12 not found.
Warning: prerequisite Task::Weaken 0 not found.

cd /tmp;
wget http://search.cpan.org/CPAN/authors/id/S/ST/STEVAN/Class-MOP-1.00.tar.gz

perl Makefile.PL  PREFIX=/tmp/temp
make
make install

    Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Class/MOP/MOP.so
    ...
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Class/MOP/Instance.pm
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Class/MOP/Package.pm
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Class/MOP/Class.pm
    ...
    Installing /tmp/temp/share/man/man3/Class::MOP::Method::Wrapped.3pm
    Installing /tmp/temp/share/man/man3/Class::MOP::Method::Accessor.3pm
    Appending installation info to /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod

INSTALLED TO:

/tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/


INSTALL List::MoreUtils
=======================

cd /tmp;
wget http://search.cpan.org/CPAN/authors/id/V/VP/VPARSEVAL/List-MoreUtils-0.22.tar.gz

perl Makefile.PL  PREFIX=/tmp/temp
make
make install

    Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/List/MoreUtils/MoreUtils.bs
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/List/MoreUtils/MoreUtils.so
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/List/MoreUtils.pm
    Installing /tmp/temp/share/man/man3/List::MoreUtils.3pm
    Appending installation info to /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod


INSTALLED TO:

/tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/


INSTALL Task::Weaken
====================

cd /tmp;
wget http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Task-Weaken-1.03.tar.gz
    
perl Makefile.PL  PREFIX=/tmp/temp
make
make install

    Checking if your kit is complete...
    Looks good
    Writing Makefile for Task::Weaken

make
    cp lib/Task/Weaken.pm blib/lib/Task/Weaken.pm
    Manifying blib/man3/Task::Weaken.3pm

make install
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Task/Weaken.pm
    Installing /tmp/temp/share/man/man3/Task::Weaken.3pm
    Appending installation info to /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod

INSTALLED TO:

/tmp/temp/lib/perl5/site_perl/5.8.8/


INSTALL Class::C3
=================
for Moose

cd /tmp;
wget http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Class-C3-0.22.tar.gz

perl Makefile.PL  PREFIX=/tmp/temp
make
make install

    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Class/C3.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Class/C3/next.pm
    Installing /tmp/temp/share/man/man3/Class::C3::next.3pm
    Installing /tmp/temp/share/man/man3/Class::C3.3pm
    Appending installation info to /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod

INSTALLED TO:

/tmp/temp/lib/perl5/site_perl/5.8.8



INSTALL Algorithm::C3
=================
for Moose

cd /tmp;
wget http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Algorithm-C3-0.08.tar.gz

perl Build.PL  --prefix /tmp/temp
perl Build
perl Build test
perl Build install

    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Algorithm/C3.pm
    Installing /tmp/temp/share/man/man3/Algorithm::C3.3pm
    Writing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Algorithm/C3/.packlist

INSTALLED TO:
    
/tmp/temp/lib/perl5/site_perl/5.8.8

INSTALL Moose
=============
Getting started with Moose
http://www.perlmonks.org/?node_id=702738

DOWNLOAD

cd /tmp;
wget http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Moose-1.01.tar.gz
tar xvfz M*

ADD PERL5LIB PATHS:
http://www.perl.com/pub/a/2002/04/10/mod_perl.html?page=2

export PERL5LIB=/tmp/temp/lib/perl5/site_perl/5.8.8/:/tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/:$PERL5LIB

INSTALL
perl Makefile.PL  PREFIX=/tmp/temp 

    Subroutine test_via_harness redefined at inc/Module/Install/ExtraTests.pm line 29.
    Subroutine dist_test redefined at inc/Module/Install/ExtraTests.pm line 40.
    Subroutine extra_tests redefined at inc/Module/Install/ExtraTests.pm line 13.
    Subroutine __harness redefined at inc/Module/Install/ExtraTests.pm line 51.
    Subroutine _wanted redefined at inc/Module/Install/ExtraTests.pm line 83.
    Subroutine _deep_t redefined at inc/Module/Install/ExtraTests.pm line 89.
    Subroutine author_requires redefined at inc/Module/Install/AuthorRequires.pm line 14.
    Writing Makefile for Moose
ls
make
make install

    ...
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Moose/Util/TypeConstraints.pm
    ...
    Installing /tmp/temp/share/man/man3/Moose::Meta::Attribute::Native.3pm
    Installing /tmp/temp/share/man/man3/Moose::Meta::TypeConstraint::Role.3pm
    Appending installation info to /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod


INSTALLED TO:

/tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi


INSTALL Attribute::Handlers
===========================
DEPENDENCY OF Params::Validate
Params-Validate-0.95]$ perl Build.PL  PREFIX=/tmp/temp
    ...
    - ERROR: Attribute::Handlers (0.78_02) is installed, but we need version >= 0.79

cd /tmp;

wget http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Attribute-Handlers-0.87.tar.gz

perl Makefile.PL PREFIX=/tmp/temp
make
make install
    
    Installing /tmp/temp/lib/perl5/5.8.8/Attribute/Handlers.pm
    Installing /tmp/temp/share/man/man3/Attribute::Handlers.3pm
    Appending installation info to /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod


INSTALLED TO:

/tmp/temp/lib/perl5/5.8.8


INSTALL Params::Validate
========================

cd /tmp;
wget http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Params-Validate-0.95.tar.gz


#### ADD PATH TO Attribute::Handlers
export PERL5LIB=/tmp/temp/lib/perl5/5.8.8:$PERL5LIB

perl Build.PL  --prefix /tmp/temp
perl Build
perl Build test
perl Build install

    ...    
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Params/Validate/Validate.so
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Attribute/Params/Validate.pm
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Params/Validate.pm
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Params/ValidateXS.pm
    Installing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/Params/ValidatePP.pm
    ...
    Installing /tmp/temp/share/man/man3/Params::ValidatePP.3pm
    Writing /tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Params/Validate/.packlist

INSTALLED TO:

/tmp/temp/lib64/perl5/site_perl/5.8.8



2. DOWNLOADED Net::Amazon::EC2 TO /tmp AND INSTALLED TO /tmp/temp


export PERL5LIB=/tmp/temp/lib/perl5/5.8.8:$PERL5LIB;
export PERL5LIB=/tmp/temp/lib64/perl5/site_perl/5.8.8:$PERL5LIB;
export PERL5LIB=/tmp/temp/lib/perl5/site_perl/5.8.8:$PERL5LIB;
export PERL5LIB=/tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi:$PERL5LIB;
export PERL5LIB=/tmp/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi:$PERL5LIB;



cd /tmp/Net-Amazon-EC2-0.14
perl Makefile.PL PREFIX=/tmp/temp
make
make install

    ...
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/DescribeInstanceAttributeResponse.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/BundleInstanceResponse.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/ConfirmProductInstanceResponse.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/AvailabilityZoneMessage.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/StateReason.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/DescribeImagesResponse.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/DescribeAddress.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/RunningInstances.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/BlockDeviceMapping.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/ReservedInstanceOffering.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/Region.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/IpPermission.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/AvailabilityZone.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/ReservedInstance.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/ProductInstanceResponse.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/EbsInstanceBlockDeviceMapping.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/UserData.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/LaunchPermission.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/InstancePassword.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/ReservationInfo.pm
    Installing /tmp/temp/lib/perl5/site_perl/5.8.8/Net/Amazon/EC2/InstanceState.pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::ConfirmProductInstanceResponse.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::Error.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::GroupSet.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::EbsBlockDevice.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::BundleInstanceResponse.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::ProductInstanceResponse.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::ReservationInfo.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::DescribeImageAttribute.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::Errors.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::DescribeInstanceAttributeResponse.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::AvailabilityZoneMessage.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::DescribeKeyPairsResponse.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::MonitoredInstance.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::Volume.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::IpRange.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::ConsoleOutput.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::SnapshotAttribute.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::CreateVolumePermission.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::DescribeImagesResponse.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::UserIdGroupPair.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::ProductCode.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::Attachment.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::SecurityGroup.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::UserData.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::LaunchPermissionOperation.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::RunningInstances.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::BlockDeviceMapping.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::ReservedInstance.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::InstanceBlockDeviceMapping.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::AvailabilityZone.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::InstanceStateChange.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::PlacementResponse.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::Region.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::EbsInstanceBlockDeviceMapping.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::LaunchPermission.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::InstanceState.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::DescribeAddress.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::IpPermission.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::Snapshot.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::KeyPair.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::StateReason.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::InstancePassword.3pm
    Installing /tmp/temp/share/man/man3/Net::Amazon::EC2::ReservedInstanceOffering.3pm
    Appending installation info to /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod

    Appending installation info to /tmp/temp/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod



TOTAL INSTALLATION IS SPREAD ACROSS THESE DIRECTORIES:

MODULES

/tmp/temp/lib
/tmp/temp/lib64


MAN PAGES

/tmp/temp/share/man




2. COPIED lib AND man DIRS TO /data/agua/0.4/lib/external AND E:\0.4\lib\external\Net ON hplaptop

cp -r /tmp/temp/lib* /data/agua/0.4/lib/external


3. COPIED man FILES TO /data/agua/0.4/lib/external ON ngsdev

mkdir /data/agua/0.4/lib/external/man
cp -r /tmp/temp/share/man/* /data/agua/0.4/lib/external/man


4. TEST INSTALLATION

cd /data/agua/0.4/bin/apps
chmod 755 test-NetEc.pl
./test-NetEc.pl


    Not an ARRAY reference at ./test-NetEc.pl line 108.

OK!



++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Updating a Random-Access File
http://oreilly.com/catalog/cookbook/chapter/ch08.html#19069


Problem

You want to read in an old record from a binary file, change its values, and write back the record.

Solution

After read ing the old record, pack up the updated values, seek to the previous address, and write it back.

use Fcntl;                          # for SEEK_SET and SEEK_CUR
 
$ADDRESS = $RECSIZE * $RECNO;
seek(FH, $ADDRESS, SEEK_SET)        or die "Seeking: $!";
read(FH, $BUFFER, $RECSIZE) == $RECSIZE
                                    or die "Reading: $!";
@FIELDS = unpack($FORMAT, $BUFFER);
# update fields, then
$BUFFER = pack($FORMAT, @FIELDS);
seek(FH, -$RECSIZE, SEEK_CUR)       or die "Seeking: $!";
print FH $BUFFER;
close FH                            or die "Closing: $!";
Discussion

You don't have to use anything fancier than print in Perl to output a record. Remember that the opposite of read is not write but print, although oddly enough, the opposite of sysread actually is syswrite. ( split and join are opposites, but there's no speak to match listen, no resurrect for kill, and no curse for bless.)

The example program shown in Example 8-4, weekearly, takes one argument: the user whose record you want to backdate by a week. (Of course, in practice, you wouldn't really want to (nor be able to!) mess with the system accounting files.) This program requires write access to the file to be updated, since it opens the file in update mode. After fetching and altering the record, it packs it up again, skips backwards in the file one record, and writes it out.

Example 8-4. weekearly

#!/usr/bin/perl
# weekearly -- set someone's login date back a week
use User::pwent;
use IO::Seekable;
 
$typedef = 'L A12 A16';         # linux fmt; sunos is "L A8 A16"
$sizeof  = length(pack($typedef, ()));
$user    = shift(@ARGV) || $ENV{USER} || $ENV{LOGNAME};
 
$address = getpwnam($user)->uid * $sizeof;
 
open (LASTLOG, "+</var/log/lastlog")
    or die "can't update /usr/adm/lastlog: $!";
seek(LASTLOG, $address, SEEK_SET)
    or die "seek failed: $!";
read(LASTLOG, $buffer, $sizeof) == $sizeof
    or die "read failed: $!";
 
($time, $line, $host) = unpack($typedef, $buffer);
$time  -= 24 * 7 * 60 * 60;         # back-date a week
$buffer = pack($typedef, $time, $line, $time);
 
seek(LASTLOG, -$sizeof, SEEK_CUR)   # backup one record
    or die "seek failed: $!";
print LASTLOG $record;
    
close(LASTLOG)
    or die "close failed: $!";
See Also

The open, seek, read, pack, and unpack functions in the perlfunc (1) and in Chapter 3 of Programming Perl ; Recipe 8.12; Recipe 8.14

Reading a String from a Binary File

Problem

You want to read a NUL-terminated string from a file, starting at a particular address.

Solution

Set $/ to an ASCII NUL, and read the string with <>:

$old_rs = $/;                       # save old $/
$/ = "\0";                          # NULL
seek(FH, $addr, SEEK_SET)           or die "Seek error: $!\n";
$string = <FH>;                     # read string
chomp $string;                      # remove NULL
$/ = $old_rs;                       # restore old $/
You can use local to save and restore $/ if you want:

{
    local $/ = "\0";
    # ...
}                           # $/ is automatically restored
Discussion

The example program shown in Example 8-5, bgets, accepts a filename and one or more byte addresses as arguments. Decimal, octal, or hexadecimal addresses may be specified. For each address, the program reads and prints the NULL- or EOF-terminated string at that position:

Example 8-5. bgets

#!/usr/bin/perl 
# 
 
bgets - get a string from an address in a binary file
use IO::Seekable;
($file, @addrs) = @ARGV             or die "usage: $0 addr ...";
open(FH, $file)                     or die "cannot open $file: $!";
$/ = "\000";
foreach $addr (@addrs) {
    $addr = oct $addr if $addr =~ /^0/;
    seek(FH, $addr, SEEK_SET)
        or die "can't seek to $addr in $file: $!";
    printf qq{%#x %#o %d "%s"\n}, $addr, $addr, $addr, scalar <>;
}
Here's a simple implementation of the Unix strings program:

Example 8-6. strings 

#!/usr/bin/perl
# 
strings - pull strings out of a binary file
$/ = "\0";
while (<>) {
    while (/([\040-\176\s]{4,})/g) {
        print $1, "\n";
    }
}
See Also

The seek, getc, and ord functions in perlfunc (1) and in Chapter 3 of Programming Perl ; the discussion of qq// in the "Quote and Quote-Like Operators" section of the perlop (1) manpage, and in the "Pick Your Own Quotes" section of Chapter 2 of Programming Perl






snpExtFile

wget ftp://ftp.ncbi.nih.gov/blast/db/FASTA/sts.gz


</entry>

<entry [Fri Mar 26 17:33:34 EDT 2010] SOURCEFORGE - MIT LICENCE, DOCUMENTATION AND DEVELOPER'S FORUM>

svn co https://aguabiotools.svn.sourceforge.net/svnroot/aguabiotools aguabiotools 

USERNAME: stuartpyoung


UPLOAD FILES
https://sourceforge.net/project/admin/explorer.php?group_id=312951



SETTING THE TONE FOR COOPERATION
http://producingoss.com/en/setting-tone.html#avoid-private-discussions



PRODUCING OPEN SOURCE SOFTWARE 
http://producingoss.com/en/index.html


GETTING STARTED 
http://producingoss.com/en/getting-started.html



Choosing a License and Applying It


Prev 	Chapter 2. Getting Started	 Next

Choosing a License and Applying It

This section is intended to be a very quick, very rough guide to choosing a license. Read Chapter 9, Licenses, Copyrights, and Patents to understand the detailed legal implications of the different licenses, and how the license you choose can affect people's ability to mix your software with other free software.

There are a great many free software licenses to choose from. Most of them we needn't consider here, as they were written to satisfy the particular legal needs of some corporation or person, and wouldn't be appropriate for your project. We will restrict ourselves to just the most commonly used licenses; in most cases, you will want to choose one of them.

The "Do Anything" Licenses

If you're comfortable with your project's code potentially being used in proprietary programs, then use an MIT/X-style license. It is the simplest of several minimal licenses that do little more than assert nominal copyright (without actually restricting copying) and specify that the code comes with no warranty. See the section called The MIT / X Window System License for details.

The GPL

If you don't want your code to be used in proprietary programs, use the GNU General Public License (http://www.gnu.org/licenses/gpl.html). The GPL is probably the most widely recognized free software license in the world today. This is in itself a big advantage, since many potential users and contributors will already be familiar with it, and therefore won't have to spend extra time to read and understand your license. See the section called The GNU General Public License in Chapter 9, Licenses, Copyrights, and Patents for details.

If users interact with your code primarily over a networkthat is, the software is usually part of a hosted servicethen consider using the GNU Affero GPL instead. See The GNU Affero GPL: A Version of the GNU GPL for Server-Side Code in Chapter 9, Licenses, Copyrights, and Patents for more.

How to Apply a License to Your Software

Once you've chosen a license, you should state it on the project's front page. You don't need to include the actual text of the license there; just give the name of the license, and make it link to the full license text on another page.

This tells the public what license you intend the software to be released under, but it's not sufficient for legal purposes. For that, the software itself must contain the license. The standard way to do this is to put the full license text in a file called COPYING (or LICENSE), and then put a short notice at the top of each source file, naming the copyright date, holder, and license, and saying where to find the full text of the license.

There are many variations on this pattern, so we'll look at just one example here. The GNU GPL says to put a notice like this at the top of each source file:

Copyright (C) <year>  <name of author>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>
It does not say specifically that the copy of the license you received along with the program is in the file COPYING, but that's where it's usually put. (You could change the above notice to state that directly.) This template also gives a geographical address from which to request a copy of the license. Another common method is to give a link to a web page containing the license. Just use your judgement and point to wherever you feel the most permanent copy of the license is maintained, which might simply be somewhere on your project's web site. In general, the notice you put in each source file does not have to look exactly like the one above, as long as it starts with the same notice of copyright holder and date, states the name of the license, and makes it clear where to view the full license.



Developer Guidelines

If someone is considering contributing to the project, she'll look for developer guidelines. Developer guidelines are not so much technical as social: they explain how the developers interact with each other and with the users, and ultimately how things get done.

This topic is covered in detail in the section called Writing It All Down in Chapter 4, Social and Political Infrastructure, but the basic elements of developer guidelines are:

    *

      pointers to forums for interaction with other developers
    *

      instructions on how to report bugs and submit patches
    *

      some indication of how development is usually doneis the project a benevolent dictatorship, a democracy, or something else

No pejorative sense is intended by "dictatorship", by the way. It's perfectly okay to run a tyranny where one particular developer has veto power over all changes. Many successful projects work this way. The important thing is that the project come right out and say so. A tyranny pretending to be a democracy will turn people off; a tyranny that says it's a tyranny will do fine as long as the tyrant is competent and trusted.

See http://subversion.apache.org/docs/community-guide/ for an example of particularly thorough developer guidelines, or http://www.openoffice.org/dev_docs/guidelines.html for broader guidelines that focus more on governance and the spirit of participation and less on technical matters.

The separate issue of providing a programmer's introduction to the software is discussed in the section called Developer documentation later in this chapter.




Documentation

Documentation is essential. There needs to be something for people to read, even if it's rudimentary and incomplete. This falls squarely into the "drudgery" category referred to earlier, and is often the first area where a new open source project falls down. Coming up with a mission statement and feature list, choosing a license, summarizing development statusthese are all relatively small tasks, which can be definitively completed and usually need not be returned to once done. Documentation, on the other hand, is never really finished, which may be one reason people sometimes delay starting it at all.

The most insidious thing is that documentation's utility to those writing it is the reverse of its utility to those who will read it. The most important documentation for initial users is the basics: how to quickly set up the software, an overview of how it works, perhaps some guides to doing common tasks. Yet these are exactly the things the writers of the documentation know all too wellso well that it can be difficult for them to see things from the reader's point of view, and to laboriously spell out the steps that (to the writers) seem so obvious as to be unworthy of mention.

There's no magic solution to this problem. Someone just needs to sit down and write the stuff, and then run it by typical new users to test its quality. Use a simple, easy-to-edit format such as HTML, plain text, Texinfo, or some variant of XMLsomething that's convenient for lightweight, quick improvements on the spur of the moment. This is not only to remove any overhead that might impede the original writers from making incremental improvements, but also for those who join the project later and want to work on the documentation.

One way to ensure basic initial documentation gets done is to limit its scope in advance. That way, writing it at least won't feel like an open-ended task. A good rule of thumb is that it should meet the following minimal criteria:

    *

      Tell the reader clearly how much technical expertise they're expected to have.
    *

      Describe clearly and thoroughly how to set up the software, and somewhere near the beginning of the documentation, tell the user how to run some sort of diagnostic test or simple command to confirm that they've set things up correctly. Startup documentation is in some ways more important than actual usage documentation. The more effort someone has invested in installing and getting started with the software, the more persistent she'll be in figuring out advanced functionality that's not well-documented. When people abandon, they abandon early; therefore, it's the earliest stages, like installation, that need the most support.
    *

      Give one tutorial-style example of how to do a common task. Obviously, many examples for many tasks would be even better, but if time is limited, pick one task and walk through it thoroughly. Once someone sees that the software can be used for one thing, they'll start to explore what else it can do on their ownand, if you're lucky, start filling in the documentation themselves. Which brings us to the next point...
    *

      Label the areas where the documentation is known to be incomplete. By showing the readers that you are aware of its deficiencies, you align yourself with their point of view. Your empathy reassures them that they don't face a struggle to convince the project of what's important. These labels needn't represent promises to fill in the gaps by any particular date it's equally legitimate to treat them as open requests for volunteer help.

The last point is of wider importance, actually, and can be applied to the entire project, not just the documentation. An accurate accounting of known deficiencies is the norm in the open source world. You don't have to exaggerate the project's shortcomings, just identify them scrupulously and dispassionately when the context calls for it (whether in the documentation, in the bug tracking database, or on a mailing list discussion). No one will treat this as defeatism on the part of the project, nor as a commitment to solve the problems by a certain date, unless the project makes such a commitment explicitly. Since anyone who uses the software will discover the deficiencies for themselves, it's much better for them to be psychologically preparedthen the project will look like it has a solid knowledge of how it's doing. f






Availability of documentation

Documentation should be available from two places: online (directly from the web site), and in the downloadable distribution of the software (see the section called Packaging in Chapter 7, Packaging, Releasing, and Daily Development). It needs to be online, in browsable form, because people often read documentation before downloading software for the first time, as a way of helping them decide whether to download at all. But it should also accompany the software, on the principle that downloading should supply (i.e., make locally accessible) everything one needs to use the package.

For online documentation, make sure that there is a link that brings up the entire documentation in one HTML page (put a note like "monolithic" or "all-in-one" or "single large page" next to the link, so people know that it might take a while to load). This is useful because people often want to search for a specific word or phrase across the entire documentation. Generally, they already know what they're looking for; they just can't remember what section it's in. For such people, nothing is more frustrating than encountering one HTML page for the table of contents, then a different page for the introduction, then a different page for installation instructions, etc. When the pages are broken up like that, their browser's search function is useless. The separate-page style is useful for those who already know what section they need, or who want to read the entire documentation from front to back in sequence. But this is not the most common way documentation is accessed. Far more often, someone who is basically familiar with the software is coming back to search for a specific word or phrase. To fail to provide them with a single, searchable document would only make their lives harder.
Developer documentation

Developer documentation is written to help programmers understand the code, so they can repair and extend it. This is somewhat different from the developer guidelines discussed earlier, which are more social than technical. Developer guidelines tell programmers how to get along with each other; developer documentation tells them how to get along with the code itself. The two are often packaged together in one document for convenience (as with the http://subversion.apache.org/docs/community-guide/ example given earlier), but they don't have to be.

Although developer documentation can be very helpful, there's no reason to delay a release to do it. As long as the original authors are available (and willing) to answer questions about the code, that's enough to start with. In fact, having to answer the same questions over and over is a common motivation for writing documentation. But even before it's written, determined contributors will still manage to find their way around the code. The force that drives people to spend time learning a code base is that the code does something useful for them. If people have faith in that, they will take the time to figure things out; if they don't have that faith, no amount of developer documentation will get or keep them.

So if you have time to write documentation for only one audience, write it for users. All user documentation is, in effect, developer documentation as well; any programmer who's going to work on a piece of software will need to be familiar with how to use it. Later, when you see programmers asking the same questions over and over, take the time to write up some separate documents just for them.

Some projects use wikis for their initial documentation, or even as their primary documentation. In my experience, this really only works if the wiki is actively edited by a few people who agree on how the documentation is to be organized and what sort of "voice" it should have. See the section called Wikis in Chapter 3, Technical Infrastructure for more.
Example Output and Screenshots

If the project involves a graphical user interface, or if it produces graphical or otherwise distinctive output, put some samples up on the project web site. In the case of interface, this means screenshots; for output, it might be screenshots or just files. Both cater to people's need for instant gratification: a single screenshot can be more convincing than paragraphs of descriptive text and mailing list chatter, because a screenshot is inarguable proof that the software works. It may be buggy, it may be hard to install, it may be incompletely documented, but that screenshot is still proof that if one puts in enough effort, one can get it to run.

Screenshots

Since screenshots can be daunting until you've actually made a few, here are basic instructions for making them. Using the Gimp (http://www.gimp.org/), open File->Acquire->Screenshot, choose Single Window or Whole Screen, then click OK. Now your next mouse click will capture the window or screen clicked on as an image in the Gimp. Crop and resize the image as necessary, using the instructions at http://www.gimp.org/tutorials/Lite_Quickies/#crop.

There are many other things you could put on the project web site, if you have the time, or if for one reason or another they are especially appropriate: a news page, a project history page, a related links page, a site-search feature, a donations link, etc. None of these are necessities at startup time, but keep them in mind for the future.
Canned Hosting

There are a few sites that provide free hosting and infrastructure for open source projects: a web area, version control, a bug tracker, a download area, chat forums, regular backups, etc. The details vary from site to site, but the same basic services are offered at all of them. By using one of these sites, you get a lot for free; what you give up, obviously, is fine-grained control over the user experience. The hosting service decides what software the site runs, and may control or at least influence the look and feel of the project's web pages.

See the section called Canned Hosting in Chapter 3, Technical Infrastructure for a more detailed discussion of the advantages and disadvantages of canned hosting, and a list of sites that offer it.




TESTING AND RELEASING
http://producingoss.com/en/testing-and-releasing.html

Testing and Releasing
Prev 	Chapter 7. Packaging, Releasing, and Daily Development	 Next
Testing and Releasing

Once the source tarball is produced from the stabilized release branch, the public part of the release process begins. But before the tarball is made available to the world at large, it should be tested and approved by some minimum number of developers, usually three or more. Approval is not simply a matter of inspecting the release for obvious flaws; ideally, the developers download the tarball, build and install it onto a clean system, run the regression test suite (see the section called Automated testing) in Chapter 8, Managing Volunteers, and do some manual testing. Assuming it passes these checks, as well as any other release checklist criteria the project may have, the developers then digitally sign the tarball using GnuPG (http://www.gnupg.org/), PGP (http://www.pgpi.org/), or some other program capable of producing PGP-compatible signatures.

In most projects, the developers just use their personal digital signatures, instead of a shared project key, and as many developers as want to may sign (i.e., there is a minimum number, but not a maximum). The more developers sign, the more testing the release undergoes, and also the greater the likelihood that a security-conscious user can find a digital trust path from herself to the tarball.

Once approved, the release (that is, all tarballs, zip files, and whatever other formats are being distributed) should be placed into the project's download area, accompanied by the digital signatures, and by MD5/SHA1 checksums (see http://en.wikipedia.org/wiki/Cryptographic_hash_function). There are various standards for doing this. One way is to accompany each released package with a file giving the corresponding digital signatures, and another file giving the checksum. For example, if one of the released packages is scanley-2.5.0.tar.gz, place in the same directory a file scanley-2.5.0.tar.gz.asc containing the digital signature for that tarball, another file scanley-2.5.0.tar.gz.md5 containing its MD5 checksum, and optionally another, scanley-2.5.0.tar.gz.sha1, containing the SHA1 checksum. A different way to provide checking is to collect all the signatures for all the released packages into a single file, scanley-2.5.0.sigs; the same may be done with the checksums.

It doesn't really matter which way you do it. Just keep to a simple scheme, describe it clearly, and be consistent from release to release. The purpose of all this signing and checksumming is to give users a way to verify that the copy they receive has not been maliciously tampered with. Users are about to run this code on their computersif the code has been tampered with, an attacker could suddenly have a back door to all their data. See the section called Security Releases later in this chapter for more about paranoia.
Candidate Releases

For important releases containing many changes, many projects prefer to put out release candidates first, e.g., scanley-2.5.0-beta1 before scanley-2.5.0. The purpose of a candidate is to subject the code to wide testing before blessing it as an official release. If problems are found, they are fixed on the release branch and a new candidate release is rolled out (scanley-2.5.0-beta2). The cycle continues until no unacceptable bugs are left, at which point the last candidate release becomes the official releasethat is, the only difference between the last candidate release and the real release is the removal of the qualifier from the version number.

In most other respects, a candidate release should be treated the same as a real release. The alpha, beta, or rc qualifier is enough to warn conservative users to wait until the real release, and of course the announcement emails for the candidate releases should point out that their purpose is to solicit feedback. Other than that, give candidate releases the same amount of care as regular releases. After all, you want people to use the candidates, because exposure is the best way to uncover bugs, and also because you never know which candidate release will end up becoming the official release.
Announcing Releases

Announcing a release is like announcing any other event, and should use the procedures described in the section called Publicity in Chapter 6, Communications. There are a few specific things to do for releases, though.

Whenever you give the URL to the downloadable release tarball, make sure to also give the MD5/SHA1 checksums and pointers to the digital signatures file. Since the announcement happens in multiple forums (mailing list, news page, etc.), this means users can get the checksums from multiple sources, which gives the most security-conscious among them extra assurance that the checksums themselves have not been tampered with. Giving the link to the digital signature files multiple times doesn't make those signatures more secure, but it does reassure people (especially those who don't follow the project closely) that the project takes security seriously.

In the announcement email, and on news pages that contain more than just a blurb about the release, make sure to include the relevant portion of the CHANGES file, so people can see why it might be in their interests to upgrade. This is as important with candidate releases as with final releases; the presence of bugfixes and new features is important in tempting people to try out a candidate release.

Finally, don't forget to thank the development team, the testers, and all the people who took the time to file good bug reports. Don't single out anyone by name, though, unless there's someone who is individually responsible for a huge piece of work, the value of which is widely recognized by everyone in the project. Just be wary of sliding down the slippery slope of credit inflation (see the section called Credit in Chapter 8, Managing Volunteers).






http://producingoss.com/en/managing-volunteers.html#automated-testing
Regression Testing

Regression testing means testing for the reappearance of already-fixed bugs. The purpose of regression testing is to reduce the chances that code changes will break the software in unexpected ways. As a software project gets bigger and more complicated, the chances of such unexpected side effects increase steadily. Good design can reduce the rate at which the chances increase, but it cannot eliminate the problem entirely.

As a result, many projects have a test suite, a separate program that invokes the project's software in ways that have been known in the past to stimulate specific bugs. If the test suite succeeds in making one of these bugs happen, this is known as a regression, meaning that someone's change unexpectedly unfixed a previously-fixed bug.

See also http://en.wikipedia.org/wiki/Regression_testing.




++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




whulme

no drop



....loading....
Firebug's log limit has been reached. 705 entries not shown.		Preferences	 

Aqwa.isGroupUser userObject: {"username":"dmotti","name":"acoustics","description":"A Coustics","location":"acoustics@med.miami.edu"}
Aqwa.getGroupUsers plugins.core.Aqwa.getGroupUsers()
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: user
Common._objectInArray Aqwa._objectInArray(array, object, keys)
Aqwa.getGroups plugins.core.Aqwa.getGroups()
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/admin.cgi?
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/admin.cgi?
200 OK	 
577ms	bootstrap.js (line 1085)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: undefined
GroupUsers.addToGroup JSON loaded okay
GroupUsers.addToGroup data: {"status":"Admin::addToGroup Successfully inserted user acoustics into groupmember table"}
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
GroupUsers.addToGroup plugins.admin.GroupUsers.addToGroup(name, description, location)
GroupUsers.addToGroup name: whulme
GroupUsers.addToGroup description: W Hulme
GroupUsers.addToGroup location: whulme@med.miami.edu
GroupUsers.addToGroup groupName: TryDario
Aqwa.isGroupUser plugins.core.Aqwa.isGroupUser(groupName, userObject)
Aqwa.isGroupUser groupName: TryDario
Aqwa.isGroupUser userObject: {"username":"dmotti","name":"whulme","description":"W Hulme","location":"whulme@med.miami.edu"}
Aqwa.getGroupUsers plugins.core.Aqwa.getGroupUsers()
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: user
Common._objectInArray Aqwa._objectInArray(array, object, keys)
Aqwa.getGroups plugins.core.Aqwa.getGroups()
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/admin.cgi?
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/admin.cgi?
200 OK	 
604ms	bootstrap.js (line 1085)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: undefined
GroupUsers.addToGroup JSON loaded okay
GroupUsers.addToGroup data: {"status":"Admin::addToGroup Successfully inserted user whulme into groupmember table"}
uncaught exception: [Exception... "Component returned failure code: 0x80004005 (NS_ERROR_FAILURE) [nsIXMLHttpRequest.send]" nsresult: "0x80004005 (NS_ERROR_FAILURE)" location: "JS frame :: http://ngsdev.ccs.miami.edu/agua/0.4/dojo.1.2.2/dojo/_base/_loader/hostenv_browser.js :: anonymous :: line 232" data: no]
 (no source for )
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
Aqwa.isGroup plugins.core.Aqwa.isGroup(groupName, groupObject)
Aqwa.isGroup groupName: *testgroup*
Aqwa.isGroup Checking group.name: *TryDario*
Aqwa.addGroup plugins.core.Aqwa.addGroup(groupObject)
Aqwa.addGroup groupObject: {"name":"testgroup","description":"desc","notes":"my notes"}
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4//admin.cgi?
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4//admin.cgi?
200 OK	 
649ms	bootstrap.js (line 1085)
Aqwa.getGroupNames plugins.core.Aqwa.getGroupNames()
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getSources plugins.core.Aqwa.getSources(sourceObject)
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupNames plugins.core.Aqwa.getGroupNames()
Aqwa.getGroupUsers plugins.core.Aqwa.getGroupUsers()
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: user
Aqwa.getGroupUsers plugins.core.Aqwa.getGroupUsers()
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: user
Aqwa.getGroupNames plugins.core.Aqwa.getGroupNames()
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: project
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: project
ComboBoxMixin._showResultList this._popupWidget.attr('class'): groupsources groupCombo dijitReset dijitMenu
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: undefined
Aqwa.isGroupSource plugins.core.Aqwa.isGroupSource(groupName, sourceObject)
Aqwa.isGroupSource groupName: testgroup
Aqwa.isGroupSource sourceObject: {"username":"dmotti","name":"dummy","description":"test","location":"test notes"}
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Common._objectInArray Aqwa._objectInArray(array, object, keys)
Aqwa.getGroups plugins.core.Aqwa.getGroups()
Common._addObjectToArray requiredKeys not Defined. Returning: ["username"]
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: undefined
GroupUsers.addToGroup plugins.admin.GroupUsers.addToGroup(name, description, location)
GroupUsers.addToGroup name: whulme
GroupUsers.addToGroup description: W Hulme
GroupUsers.addToGroup location: whulme@med.miami.edu
GroupUsers.addToGroup groupName: testgroup
Aqwa.isGroupUser plugins.core.Aqwa.isGroupUser(groupName, userObject)
Aqwa.isGroupUser groupName: testgroup
Aqwa.isGroupUser userObject: {"username":"dmotti","name":"whulme","description":"W Hulme","location":"whulme@med.miami.edu"}
Aqwa.getGroupUsers plugins.core.Aqwa.getGroupUsers()
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: user
Common._objectInArray Aqwa._objectInArray(array, object, keys)
Aqwa.getGroups plugins.core.Aqwa.getGroups()
Common._addObjectToArray requiredKeys not Defined. Returning: ["username"]
GroupUsers.addToGroup Failed to add source to group: whulme. Returning.
ComboBoxMixin._showResultList this._popupWidget.attr('class'): groupprojects groupCombo dijitReset dijitMenu
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: undefined
Aqwa.addProjectToGroup plugins.core.Aqwa.addProjectToGroup(groupName, projectObject)
Aqwa.addProjectToGroup groupName: testgroup
Aqwa.addProjectToGroup projectObject: {"username":"dmotti","name":"Project1","description":"","location":"Project1"}
Aqwa.isGroupProject plugins.core.Aqwa.isGroupProject(groupName, projectObject)
Aqwa.isGroupProject groupName: testgroup
Aqwa.isGroupProject projectObject: {"username":"dmotti","name":"Project1","description":"","location":"Project1"}
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: project
Common._objectInArray Aqwa._objectInArray(array, object, keys)
Aqwa.getGroups plugins.core.Aqwa.getGroups()
Aqwa.addProjectToGroup groups: [{"name":"testgroup","description":"desc","notes":"my notes"},{"notes":"first","name":"TryDario","description":"Try","username":"dmotti"}]
Aqwa.addProjectToGroup group: {"name":"testgroup","description":"desc","notes":"my notes"}
Aqwa.addProjectToGroup New projectObject: {"username":"dmotti","name":"Project1","description":"","location":"Project1","owner":"dmotti","groupname":"testgroup","type":"project","groupdesc":"desc"}
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/admin.cgi?
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/admin.cgi?
200 OK	 
594ms	bootstrap.js (line 1085)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
Aqwa.addSource plugins.core.Aqwa.addSource(sourceObject)
Aqwa.addSource sourceObject: {"name":"test2","description":"test","location":"test notes"}
Aqwa.getSources plugins.core.Aqwa.getSources(sourceObject)
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4//admin.cgi?
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4//admin.cgi?
200 OK	 
748ms	bootstrap.js (line 1085)
ParamsHeadersPostPutResponseCacheHTML

Admin::saveSource    Admin::saveSource()
Admin::saveSource    username: dmotti
Admin::saveSource    sessionId: 0000000000.0000.000
Admin::saveSource    name: test2
Admin::saveSource    type: 
Admin::saveSource    location: test notes
fields: username name description location
SELECT 1 FROM source
WHERE username='dmotti'
AND name='test2'
already exists: 
INSERT INTO source
VALUES ('dmotti',
'test2',
'test',
'test notes') 
{ status: 'Successfully inserted into source table' }

Aqwa.getGroupNames plugins.core.Aqwa.getGroupNames()
Aqwa.getSources plugins.core.Aqwa.getSources(sourceObject)
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_ce.getItem(this.manager.nodes[i].id) is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: undefined
Aqwa.isGroupSource plugins.core.Aqwa.isGroupSource(groupName, sourceObject)
Aqwa.isGroupSource groupName: testgroup
Aqwa.isGroupSource sourceObject: {"username":"dmotti","name":"test2","description":"test","location":"test notes"}
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Common._objectInArray Aqwa._objectInArray(array, object, keys)
Aqwa.getGroups plugins.core.Aqwa.getGroups()
Common._addObjectToArray requiredKeys not Defined. Returning: ["username"]
ComboBoxMixin._showResultList this._popupWidget.attr('class'): groupsources groupCombo dijitReset dijitMenu
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
ComboBoxMixin._showResultList this._popupWidget.attr('class'): groupsources groupCombo dijitReset dijitMenu
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
ComboBoxMixin._showResultList this._popupWidget.attr('class'): groupsources groupCombo dijitReset dijitMenu
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
ComboBoxMixin._showResultList this._popupWidget.attr('class'): groupsources groupCombo dijitReset dijitMenu
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
Aqwa.getGroupMembers plugins.core.Aqwa.getGroupMembers(memberType)
Aqwa.getGroupMembers memberType: source
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: undefined
ComboBoxMixin._showResultList this._popupWidget.attr('class'): groupsources groupCombo dijitReset dijitMenu
View.startup window.resize fired
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
View.startup window.resize fired
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
View.startup window.resize fired
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_252 is undefined
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
ComboBoxMixin._showResultList this._popupWidget.attr('class'): parameters appNamesCombo dijitReset dijitMenu
Aqwa.getParametersByAppname plugins.core.Aqwa.getParametersByAppname(appname)
Aqwa.getParametersByAppname appname: MAQ
Aqwa.getParametersByAppname plugins.core.Aqwa.getParametersByAppname(appname)
Aqwa.getParametersByAppname appname: MAQ
Aqwa.getParametersByAppname plugins.core.Aqwa.getParametersByAppname(appname)
Aqwa.getParametersByAppname appname: MAQ
Aqwa.getParametersByAppname plugins.core.Aqwa.getParametersByAppname(appname)
Aqwa.getParametersByAppname appname: MAQ
Aqwa.getParametersByAppname plugins.core.Aqwa.getParametersByAppname(appname)
Aqwa.getParametersByAppname appname: MAQ
ComboBoxMixin._showResultList this._popupWidget.attr('class'): parameters appNamesCombo dijitReset dijitMenu
ComboBoxMixin._showResultList this._popupWidget.attr('class'): parameters appNamesCombo dijitReset dijitMenu
this.avatar is null
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: undefined
Workflows.setDropTarget this.dropTarget.onDndDrop Dropped node.application.name: filterSNP
GET http://ngsdev.ccs.miami.edu/agua/0.4/plugins/workflow/templates/stagerow.html
GET http://ngsdev.ccs.miami.edu/agua/0.4/plugins/workflow/templates/stagerow.html
200 OK	 
125ms	hosten...wser.js (line 232)
Workflows.setDropTarget this.dropTarget.onDndDrop stageRow: [Widget plugins.workflow.StageRow, plugins_workflow_StageRow_0]
Workflows.setDropTarget this.dropTarget.onDndDrop stageRow.domNode: [object HTMLDivElement]
Workflows.setDropTarget this.dropTarget.onDndDrop node.id: dojoUnique356
Workflows.setDropTarget this.dropTarget.onDndDrop node.parentWidget: [Widget plugins.workflow.StageRow, plugins_workflow_StageRow_0]
WorkflowsMenu.bind plugins.workflow.WorkflowsMenu.bind(node)
Workflows.setDropTarget this.dropTarget.onDndDrop Dropped node.application: { "name": "filterSNP", "owner": "admin", "type": "report", "executor": "perl", "cluster": "", "location": "apps/filterSNP.pl", "description": "Filter SNPs by quality, coverage, etc.", "notes": "Notes\r", "appname": "filterSNP", "appnumber": "1", "number": "1", "project": "Project1", "workflow": "Workflow1" }
Aqwa.getParametersByAppname plugins.core.Aqwa.getParametersByAppname(appname)
Aqwa.getParametersByAppname appname: filterSNP
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?84416
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?84416
200 OK	 
1.14s	bootstrap.js (line 1085)
WorkflowsMenu.bind plugins.workflow.WorkflowsMenu.bind(node)
Workflows.getChainedValues plugins.workflow.Workflows.getChainedValues(node, node)
Workflows.getChainedValues node: [object HTMLDivElement]
Workflows.getChainedValues application: {"name":"filterSNP","owner":"admin","type":"report","executor":"perl","cluster":"","location":"apps/filterSNP.pl","description":"Filter SNPs by quality, coverage, etc.","notes":"Notes\r","appname":"filterSNP","appnumber":"1","number":"1","project":"Project1","workflow":"Workflow1","username":"dmotti","sessionId":"0000000000.0000.000","mode":"insertStage"}
Workflows.resetNumbers plugins.workflow.Workflows.resetNumbers()
Workflow.resetNumbers Resetting number in all childNodes. childNodes.length: 1
Workflow.resetNumbers Resetting number in all childNodes. childNodes.length: 1
Workflow.resetNumbers console.dir(childNodes[0]):[object HTMLDivElement]
Workflow.resetNumbers Getting widget.
Workflow.resetNumbers childNodes[0].widget: [Widget plugins.workflow.StageRow, plugins_workflow_StageRow_0]
Workflow.resetNumbers Resetting stageRow number to: 1
Workflow.resetNumbers Reset widget childNodes[0].application.name filterSNP, node.application.number: 1
Workflow.loadInfoPane plugins.workflow.Workflows.loadInfoPane(node)
InfoPane.load plugins.workflow.InfoPane.load(node, shared)
InfoPane.load node: [object HTMLDivElement]
InfoPane.load node.parentWidget: undefined
InfoPane.load this.application: {"name":"filterSNP","owner":"admin","type":"report","executor":"perl","cluster":"","location":"apps/filterSNP.pl","description":"Filter SNPs by quality, coverage, etc.","notes":"Notes\r","appname":"filterSNP","appnumber":"1","number":"1","project":"Project1","workflow":"Workflow1","username":"dmotti","sessionId":"0000000000.0000.000","mode":"insertStage"}
InfoPane.load console.dir(this):
InfoPane.load this.childWidgets: null
InfoPane.load AFTER null check, this.childWidgets: 
InfoPane.load BEFORE widget.destroy()
InfoPane.load AFTER widget.destroy(), this.childWidgets.length: 0
GET http://ngsdev.ccs.miami.edu/agua/0.4/plugins/workflow/templates/infopanerow.html
GET http://ngsdev.ccs.miami.edu/agua/0.4/plugins/workflow/templates/infopanerow.html
200 OK	 
93ms	hosten...wser.js (line 232)
InfoPane.load BEFORE this.loadTitlePane('input')
InfoPaneRow.setEditOnClicks plugins.workflow.InfoPaneRow.setEditOnClicks()
InfoPaneRow.checkInput plugins.workflow.InfoPaneRow.checkInput(node, inputValue, force)
InfoPaneRow.checkInput inputValue: undefined
InfoPaneRow.checkInput null/empty for NON-essential/required input 'chromosome'. Setting stageParameter.isValid to TRUE
InfoPaneRow.setEditOnClicks plugins.workflow.InfoPaneRow.setEditOnClicks()
InfoPaneRow.checkInput plugins.workflow.InfoPaneRow.checkInput(node, inputValue, force)
InfoPaneRow.checkInput inputValue: undefined
InfoPaneRow.checkInput null/empty for NON-essential/required input 'coverage'. Setting stageParameter.isValid to TRUE
InfoPaneRow.setEditOnClicks plugins.workflow.InfoPaneRow.setEditOnClicks()
InfoPaneRow.checkInput plugins.workflow.InfoPaneRow.checkInput(node, inputValue, force)
InfoPaneRow.checkInput inputValue: undefined
InfoPaneRow.checkInput null/empty for essential/required input 'filename'. Setting stageParameter.isValid to FALSE
InfoPaneRow.setEditOnClicks plugins.workflow.InfoPaneRow.setEditOnClicks()
InfoPaneRow.checkInput plugins.workflow.InfoPaneRow.checkInput(node, inputValue, force)
InfoPaneRow.checkInput inputValue: undefined
InfoPaneRow.checkInput null/empty for NON-essential/required input 'quality'. Setting stageParameter.isValid to TRUE
InfoPaneRow.setEditOnClicks plugins.workflow.InfoPaneRow.setEditOnClicks()
InfoPaneRow.checkInput plugins.workflow.InfoPaneRow.checkInput(node, inputValue, force)
InfoPaneRow.checkInput inputValue: undefined
InfoPaneRow.checkInput null/empty for NON-essential/required input 'sense'. Setting stageParameter.isValid to TRUE
InfoPaneRow.setEditOnClicks plugins.workflow.InfoPaneRow.setEditOnClicks()
InfoPaneRow.checkInput plugins.workflow.InfoPaneRow.checkInput(node, inputValue, force)
InfoPaneRow.checkInput inputValue: undefined
InfoPaneRow.checkInput null/empty for essential/required input 'species'. Setting stageParameter.isValid to FALSE
InfoPane.load BEFORE this.loadTitlePane('output')
StageRow.checkValidParameters plugins.workflow.StageRow.checkValidParameters()
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
WorkflowsMenu.setMenu onClick remove
WorkflowsMenu.remove plugins.workflow.Workflow.remove(event)
WorkflowsMenu.remove widget: [Widget plugins.workflow.StageRow, plugins_workflow_StageRow_0]
WorkflowsMenu.remove application: {"name":"filterSNP","owner":"admin","type":"report","executor":"perl","cluster":"","location":"apps/filterSNP.pl","description":"Filter SNPs by quality, coverage, etc.","notes":"Notes\r","appname":"filterSNP","appnumber":"1","number":"1"}
WorkflowsMenu.remove stageObject: {"project":"Project1","workflow":"Workflow1","name":"filterSNP","owner":"admin","number":"1"}
WorkflowsMenu.remove this.parentWidget: [Widget plugins.workflow.Workflows, plugins_workflow_Workflows_0]
WorkflowsMenu.remove this.parentWidget.dropTarget: [object Object]
WorkflowsMenu.remove Resetting number in all childNodes. childNodes.length: 0
Workflow.clearInfoPane plugins.workflow.Workflows.clearInfoPane()
Workflow.clearInfoPane DOING this.parentWidget.infoPane.clear()
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
Aqwa.getParametersByAppname plugins.core.Aqwa.getParametersByAppname(appname)
Aqwa.getParametersByAppname appname: filterSNP
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?54648
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?54648
200 OK	 
1.04s	bootstrap.js (line 1085)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
this.avatar is null
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Aqwa.isProject plugins.core.Aqwa.isProject(projectName)
Aqwa.isProject projectName: *Project2*
Workflow.clearInfoPane plugins.workflow.Workflows.clearInfoPane()
Workflow.clearInfoPane DOING this.parentWidget.infoPane.clear()
Aqwa.addProject plugins.core.Aqwa.addProject(projectName)
Aqwa.addProject projectName: Project2
Aqwa.addProject this.addingProject: undefined
Aqwa.addProject query: { "name": "Project2", "username": "dmotti", "sessionId": "0000000000.0000.000", "mode": "addProject" }
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?52408
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?52408
200 OK	 
1.08s	bootstrap.js (line 1085)
Aqwa.getProjectNames plugins.core.Aqwa.getProjectNames()
Workflows.setWorkflowCombo plugins.report.Workflow.setWorkflowCombo(project, workflow)
Workflows.setWorkflowCombo dojo.connect event: 
Workflows.setDropTarget plugins.workflow.Workflows.setDropTarget(project, workflow)
Workflows.setWorkflowCombo DOING this.setDropTarget(Project2, )
Workflows.setDropTarget plugins.workflow.Workflows.setDropTarget(project, workflow)
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
Workflows.deleteProject plugins.workflow.Workflows.deleteProject(event)
Workflows.deleteProject projectName: Project1
Aqwa.removeProject plugins.core.Aqwa.removeProject(projectObject)
Aqwa.removeProject projectObject: {"name":"Project1","workflow":null}
Aqwa.removeProject Removed project from this.projects: Project1
Aqwa.removeProject Removed project from this.projects: Project1
Aqwa.removeProject query: { "name": "Project1", "workflow": null, "project": "Project1", "owner": "dmotti", "type": "project", "username": "dmotti", "sessionId": "0000000000.0000.000", "mode": "removeProject" }
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?42331
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?42331
200 OK	 
3.05s	bootstrap.js (line 1085)
Workflows.confirmDelete plugins.workflow.Workflows.confirmDelete(args)
Workflows.confirmDelete args: {"project":"Project1","workflow":null}
Workflows.confirmDelete title: Delete project: Project1?
Workflows.confirmDelete message: All workflows and data will be destroyed<br><span style='color: #222;'>Click 'Yes' to delete or 'No' to cancel</span>
ConfirmDialog.constructor plugins.core.Confirm.constructor()
GET http://ngsdev.ccs.miami.edu/agua/0.4/plugins/core/templates/confirm.html
GET http://ngsdev.ccs.miami.edu/agua/0.4/plugins/core/templates/confirm.html
200 OK	 
63ms	hosten...wser.js (line 232)
ConfirmDialog.startup plugins.core.Confirm.startup()
ConfirmDialog.startup this.parentWidget: [Widget plugins.workflow.Workflows, plugins_workflow_Workflows_0]
ConfirmDialog.startup END of startup()
ConfirmDialog.doNo plugins.core.Confirm.doNo()
Workflow.clearInfoPane plugins.workflow.Workflows.clearInfoPane()
Workflow.clearInfoPane DOING this.parentWidget.infoPane.clear()
Workflows.setWorkflowCombo plugins.report.Workflow.setWorkflowCombo(project, workflow)
Workflows.setWorkflowCombo DOING this.setDropTarget(Project2, )
Workflows.setDropTarget plugins.workflow.Workflows.setDropTarget(project, workflow)
Workflow.clearInfoPane plugins.workflow.Workflows.clearInfoPane()
Workflow.clearInfoPane DOING this.parentWidget.infoPane.clear()
Workflows.setWorkflowCombo plugins.report.Workflow.setWorkflowCombo(project, workflow)
Workflows.setWorkflowCombo DOING this.setDropTarget(Project2, )
Workflows.setDropTarget plugins.workflow.Workflows.setDropTarget(project, workflow)
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
Aqwa._getWorkflow plugins.core.Aqwa._getWorkflow(projectName, workflowName)
Aqwa._getWorkflow projectName: Project2
Aqwa._getWorkflow workflowName: Workflow1
Aqwa._getWorkflow Checking project 'Project2' isProject
Aqwa.isProject plugins.core.Aqwa.isProject(projectName)
Aqwa.isProject projectName: *Project2*
Aqwa.isProject project.name is a project: *Project2*
Aqwa.getWorkflows plugins.core.Aqwa.getWorkflows(workflowObject)
Aqwa._getWorkflow workflows: [{"number":"3","notes":"","project":"Project1","name":"Workflow2","description":"","username":"dmotti"}]
Aqwa.addWorkflow plugins.workflow.Aqwa.addWorkflow(projectName, workflowName)
Aqwa._getWorkflow plugins.core.Aqwa._getWorkflow(projectName, workflowName)
Aqwa._getWorkflow projectName: Project2
Aqwa._getWorkflow workflowName: Workflow1
Aqwa._getWorkflow Checking project 'Project2' isProject
Aqwa.isProject plugins.core.Aqwa.isProject(projectName)
Aqwa.isProject projectName: *Project2*
Aqwa.isProject project.name is a project: *Project2*
Aqwa.getWorkflows plugins.core.Aqwa.getWorkflows(workflowObject)
Aqwa._getWorkflow workflows: [{"number":"3","notes":"","project":"Project1","name":"Workflow2","description":"","username":"dmotti"}]
Aqwa.addWorkflow query: { "name": "Workflow1", "project": "Project2", "username": "dmotti", "sessionId": "0000000000.0000.000", "mode": "addWorkflow" }
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?31237
PUT http://ngsdev.ccs.miami.edu/cgi-bin/agua/0.4/workflow.cgi?31237
200 OK	 
1.02s	bootstrap.js (line 1085)
Workflows.setWorkflowCombo plugins.report.Workflow.setWorkflowCombo(project, workflow)
Workflows.setWorkflowCombo dojo.connect event: Workflow1
Workflows.setDropTarget plugins.workflow.Workflows.setDropTarget(project, workflow)
Workflows.setWorkflowCombo dojo.connect event: Workflow1
Workflows.setDropTarget plugins.workflow.Workflows.setDropTarget(project, workflow)
Workflows.setWorkflowCombo dojo.connect event: Workflow1
Workflows.setDropTarget plugins.workflow.Workflows.setDropTarget(project, workflow)
Workflows.setWorkflowCombo dojo.connect event: Workflow1
Workflows.setDropTarget plugins.workflow.Workflows.setDropTarget(project, workflow)
Workflows.setWorkflowCombo DOING this.setDropTarget(Project2, Workflow1)
Workflows.setDropTarget plugins.workflow.Workflows.setDropTarget(project, workflow)
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
Workflows.disableRunButton plugins.workflow.Workflows.disableRunButton()
this.avatar is null
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
GroupUsers.setTrash dojo.connect(onDndDrop) Checking if target == this.
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
Workflows.setDropTarget this.dropTarget.onDndDrop(source, nodes, copy)
Workflows.setDropTarget this.dropTarget.onDndDrop nodes.length: 1
Workflows.setDropTarget this.dropTarget.onDndDrop nodes[0].application: [object Object]
Workflows.setDropTarget this.dropTarget.onDndDrop this.droppingApp: true
Workflows.setDropTarget thisObject.dropTarget.onDndDrop thisObject.droppingApp is true. Returning
this.avatar is null
 if(!dojo._hasResource["dojo.dnd.common...-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)


William Hulme
Core Director of Sequencing
John P. Hussman Institute for Human Genomics
University of Miami Miller School of Medicine
1501 NW 10th Avenue (M-860)
Miami, FL 33136
305-243-8718 (office)
305-213-7799 (mobile)
whulme@med.miami.edu
www.hihg.org




no drop 2

....loading....
Firebug's log limit has been reached. 0 entries not shown.		Preferences	 

Workflow.resetNumbers console.dir(childNodes[0]):[object HTMLDivElement]
Workflow.resetNumbers Getting widget.
Workflow.resetNumbers childNodes[0].widget: [Widget plugins.workflow.StageRow, plugins_workflow_StageRow_1]
Workflow.resetNumbers Resetting stageRow number to: 1
Workflow.resetNumbers Reset widget childNodes[0].application.name MAQ, node.application.number: 1
Workflow.loadInfoPane plugins.workflow.Workflows.loadInfoPane(node)
InfoPane.load plugins.workflow.InfoPane.load(node, shared)
InfoPane.load node: [object HTMLDivElement]
InfoPane.load node.parentWidget: undefined
InfoPane.load this.application: {"name":"MAQ","owner":"admin","type":"pipeline","executor":"/usr/bin/perl","cluster":"PBS","location":"apps/MAQ.pl","description":"Align to reference and predict SNPs.","notes":"Runs MAQ version 0.7.1.","appname":"MAQ","appnumber":"1","number":"1","project":"Project2","workflow":"Workflow1","username":"dmotti","sessionId":"0000000000.0000.000","mode":"insertStage"}
InfoPane.load console.dir(this):





++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DOJO LOGGING LEVELS


In Dojo logging, you can associate messages with severity, just like in log4j. The following code illustrates the five severity levels:

console.log("Nothing happening");
console.debug("Checking to make sure nothing happened");
console.info("Something might happen.");
console.warn("Something happened, but it's no big deal.");
console.error("Cough cough!");






++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE bowtie PER-CHROMOSOME INDEX FILES IN /nethome/syoung/base/apps/bowtie/indexes


ll /nethome/syoung/base/apps/bowtie/indexes

	...
	-rw-r--r-- 1 syoung bioinfo 3199905909 Feb 11 02:43 hg19.fa
	-rw-r--r-- 1 syoung bioinfo        457 Jul 29  2009 md5sum.txt
	-rw-r--r-- 1 syoung bioinfo 2504347192 Jan 15 04:27 mm9.ebwt.zip






NB: UNZIPPED hg19.ebwt.zip HERE:

[syoung@u01 indexes]$ unzip hg19.ebwt.zip
Archive:  hg19.ebwt.zip
  inflating: hg19.1.ebwt
  inflating: hg19.2.ebwt
  inflating: hg19.3.ebwt
  inflating: hg19.4.ebwt
  inflating: hg19.rev.1.ebwt
  inflating: hg19.rev.2.ebwt
  inflating: make_hg19.sh


</entry>

<entry [Sun Mar 14 22:03:39 EDT 2010] TRANSFER DATABASES BETWEEN MYSQL SERVERS>


Moving Data Directly Between Databases
http://www.devshed.com/c/a/MySQL/Backing-up-and-restoring-your-MySQL-Database/2/

How would you like to replicate your present database to a new location? When you are shifting web hosts or database servers, you can directly copy data to the new database without having to create a database backup on your machine and restoring the same on the new server. mysql allows you to connect to a remote database server to run sql commands. Using this feature, we can pipe the output from mysqldump and ask mysql to connect to the remote database server to populate the new database. Let's say we want to recreate the Customers database on a new database server located at 202.32.12.32, we can run the following set of commands to replicate the present database at the new server.

mysqldump -u sadmin -p pass21 Customers | mysql --host=202.32.12.32 -C Customers



</entry>

<entry [Sun Mar 14 22:03:39 EDT 2010] BACKUP agua MYSQL DATABASE>


USING mysqldump WITH COURTESY 'DROP TABLE' ADDED
(rewrite an existing database without having to delete the older database manually first)

mysqldump --add-drop-table -u sadmin -p pass21 Customers > custback.sql


BACKUP SPECIFIC TABLES IN Customers DATABASE

mysqldump --add-drop-table -u sadmin -p pass21 Customers customer_master customer_details> custback.sql



BACKUP WITH CRON SCRIPT

#!/bin/sh
date=`date -I`
mysqldump --databases <!!agua-database!!> | gzip > /var/backup/backup-$date.sql.gz



MYSQLDUMP COMMANDS WITH COMPRESSION

mysqldump --all-databases | bzip2 -c >databasebackup.sql.bz2

mysqldump --all-databases | gzip >databasebackup.sql.gz


RESTORE FROM BACKUP
mysql -u [username] -p [password] [database_to_restore] < [backupfile]

E.G.:

mysql -u sadmin -p pass21 Customers < custback.sql

FROM COMPRESSED FILE:

gunzip < custback.sql.sql.gz | mysql -u sadmin -p pass21 Customers





</entry>

<entry [Sun Mar 14 01:17:45 EST 2010] SCREEN MOVIE SOFTWARE>

mac ScreenFlow


</entry>
<entry [Fri Mar 12 14:18:23 EST 2010] INSTALLED XML::Simple FOR ELAND_standalone.pl>


INSTALL TOO MESSY, SO COPIED OVER DIRS

mkdir -p /nethome/bioinfo/apps/agua/0.4/lib/external/vendor_perl/5.8.8/XML

cp -r /usr/lib/perl5/vendor_perl/5.8.8/XML/SAX \
/nethome/bioinfo/apps/agua/0.4/lib/external/vendor_perl/5.8.8/XML



1. GO TO XML-SAX-Base DIRECTORY AND make

cd /nethome/syoung/base/pipeline/perlmods/XML-SAX-0.96/XML-SAX-Base
make

		Manifying blib/man3/XML::SAX::Base.3pm
		Manifying blib/man3/XML::SAX::Exception.3pm

[syoung@u01 XML-SAX-Base]$ make install

		Writing /nethome/bioinfo/apps/agua/0.4/lib/external/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/XML/SAX/Base/.packlist
		Appending installation info to /nethome/bioinfo/apps/agua/0.4/lib/external/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod
[syoung@u01 XML-SAX-Base]$ 

mkdir -p /nethome/bioinfo/apps/agua/0.4/lib/external/site_perl/5.8.8
mkdir -p /nethome/bioinfo/apps/agua/0.4/lib/external/vendor_perl/5.8.8
mkdir -p  /nethome/bioinfo/apps/agua/0.4/lib/external/vendor_perl/5.8.8/x86_64-linux-thread-multi


mkdir -p /nethome/bioinfo/apps/agua/0.4/lib64/external/site_perl/5.8.8
mkdir -p /nethome/bioinfo/apps/agua/0.4/lib64/external/vendor_perl/5.8.8
mkdir -p  /nethome/bioinfo/apps/agua/0.4/lib64/external/vendor_perl/5.8.8/x86_64-linux-thread-multi







EDIT MAKEFILE

MAKE ALL /usr/lib PATHS GO TO /nethome/bioinfo

GET THIS ERROR AT THIS STAGE:
		
		[syoung@u01 XML-SAX-0.96]$ make install
		make[1]: Entering directory `/nethome/syoung/base/pipeline/perlmods/XML-SAX-0.96/XML-SAX-Base'
		make[1]: Leaving directory `/nethome/syoung/base/pipeline/perlmods/XML-SAX-0.96/XML-SAX-Base'
		Warning: You do not have permissions to install into /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi at /usr/lib/perl5/5.8.8/ExtUtils/Install.pm line 114.
		mkdir /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/XML: Permission denied at /usr/lib/perl5/5.8.8/ExtUtils/Install.pm line 207
		make: *** [pure_site_install] Error 13





MAKE PATH FOR ExtUtils/Install.pm

mkdir -p /nethome/bioinfo/apps/agua/0.4/lib/external/ExtUtils


COPY IT:

cp /usr/lib/perl5/5.8.8/ExtUtils/Install.pm /nethome/bioinfo/apps/agua/0.4/lib/external/ExtUtils/Install.pm


IN Makefile, SUBSTITUTE

/nethome/bioinfo/apps/agua/0.4/lib/external/ExtUtils/Install.pm

FOR 

/usr/lib/perl5/5.8.8/ExtUtils/MakeMaker.pm
		

/nethome/bioinfo/apps/agua/0.4/lib/external/5.8.8/x86_64-linux-thread-multi/CORE
#/usr/lib64/perl5/5.8.8/x86_64-linux-thread-multi/CORE





[syoung@u01 XML-SAX-0.96]$ make clean
/usr/bin/perl  -e 'chdir '\''XML-SAX-Base'\'';  system '\''make clean'\'' if -f '\''Makefile'\'';'
make[1]: Entering directory `/nethome/syoung/base/pipeline/perlmods/XML-SAX-0.96/XML-SAX-Base'
rm -f \
          *.a core \
          core.[0-9] blib/arch/auto/XML/SAX/Base/extralibs.all \
          core.[0-9][0-9] Base.bso \
          pm_to_blib.ts core.[0-9][0-9][0-9][0-9] \
          Base.x  \
          perl tmon.out \
          *.o pm_to_blib \
          blib/arch/auto/XML/SAX/Base/extralibs.ld blibdirs.ts \
          core.[0-9][0-9][0-9][0-9][0-9] *perl.core \
          core.*perl.*.? Makefile.aperl \
          perl Base.def \
          core.[0-9][0-9][0-9] mon.out \
          libBase.def perlmain.c \
          perl.exe so_locations \
          Base.exp 
rm -rf \
          blib 
mv Makefile Makefile.old > /dev/null 2>&1
make[1]: Leaving directory `/nethome/syoung/base/pipeline/perlmods/XML-SAX-0.96/XML-SAX-Base'
rm -f \
          *.a core \
          core.[0-9] blib/arch/auto/XML/SAX/extralibs.all \
          core.[0-9][0-9] SAX.bso \
          pm_to_blib.ts core.[0-9][0-9][0-9][0-9] \
          SAX.x  \
          perl tmon.out \
          *.o pm_to_blib \
          blib/arch/auto/XML/SAX/extralibs.ld blibdirs.ts \
          core.[0-9][0-9][0-9][0-9][0-9] *perl.core \
          core.*perl.*.? Makefile.aperl \
          SAX.def perl \
          core.[0-9][0-9][0-9] mon.out \
          libSAX.def perl.exe \
          perlmain.c so_locations \
          SAX.exp 
rm -rf \
          blib 
mv Makefile Makefile.old > /dev/null 2>&1





2. GO TO XML-SAX DIRECTORY AND make


mkdir -p /nethome/syoung/usr/local/lib/perl5/site_perl
mkdir -p /nethome/syoung/usr/local/lib/perl5/man
mkdir -p /nethome/syoung/usr/local/bin

perl Makefile.PL PREFIX=/nethome/syoung/usr/local \
INSTALLPRIVLIB=/nethome/syoung/usr/local/lib/perl5 \
INSTALLSCRIPT=/nethome/syoung/usr/local/bin \
INSTALLSITELIB=/nethome/syoung/usr/local/lib/perl5/site_perl \
INSTALLBIN=/nethome/syoung/usr/local/bin \
INSTALLMAN1DIR=/nethome/syoung/usr/local/lib/perl5/man \
INSTALLMAN3DIR=/nethome/syoung/usr/local/lib/perl5/man/man3



SITELIBEXP = /nethome/bioinfo/apps/agua/0.4/lib/external/vendor_perl/5.8.8
SITEARCHEXP = /nethome/bioinfo/apps/agua/0.4/lib/external/vendor_perl/5.8.8/x86_64-linux-thread-\
multi

#SITELIBEXP = /usr/lib/perl5/site_perl/5.8.8                                                     
#SITEARCHEXP = /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi                        
SO = so
EXE_EXT =
FULL_AR = /usr/bin/ar

VENDORARCHEXP = /nethome/bioinfo/apps/agua/0.4/lib/external/vendor_perl/5.8.8/x86_64-linux-threa\
d-multi
VENDORLIBEXP = /nethome/bioinfo/apps/agua/0.4/lib/external/vendor_perl/5.8.8
#VENDORARCHEXP = /nethome/bioinfo/apps/agua/0.4/lib64/external/vendor_perl/5.8.8                    
#VENDORLIBEXP = /usr/lib/perl5/vendor_perl/5.8.8                                                 


LINE 85:

PERL_LIB = /nethome/bioinfo/apps/agua/0.4/lib/external/5.8.8
PERL_ARCHLIB = /nethome/bioinfo/apps/agua/0.4/lib/external/5.8.8/x86_64-linux-thread-multi

#PERL_LIB = /usr/lib/perl5/5.8.8                                                                 
#PERL_ARCHLIB = /nethome/bioinfo/apps/agua/0.4/lib/external/5.8.8/x86_64-linux-thread-multi


mkdir /nethome/bioinfo/apps/agua/0.4/lib/external/perl5

perl Makefile.PL PREFIX=/nethome/bioinfo/apps/agua/0.4/lib/external \
INSTALLPRIVLIB=/nethome/bioinfo/apps/agua/0.4/lib/external \
INSTALLSCRIPT=/usr/home/USERNAME/usr/local/bin \
INSTALLSITELIB=/nethome/bioinfo/apps/agua/0.4/lib/external/site_perl \
VENDORLIBEXP = /nethome/bioinfo/apps/agua/0.4/lib/external/vendor_perl/5.8.8

\
INSTALLBIN=/usr/home/USERNAME/usr/local/bin \
INSTALLMAN1DIR=/usr/home/USERNAME/usr/local/lib/perl5/man \
INSTALLMAN3DIR=/usr/home/USERNAME/usr/local/lib/perl5/man/man3



perl Makefile.PL PREFIX=/nethome/bioinfo/apps/agua/0.4/lib/external \
INSTALLPRIVLIB=/nethome/bioinfo/apps/agua/0.4/lib/external/perl5 \
INSTALLSCRIPT=/usr/home/USERNAME/usr/local/bin \
INSTALLSITELIB=/usr/home/USERNAME/usr/local/lib/perl5/site_perl \
INSTALLBIN=/usr/home/USERNAME/usr/local/bin \
INSTALLMAN1DIR=/usr/home/USERNAME/usr/local/lib/perl5/man \
INSTALLMAN3DIR=/usr/home/USERNAME/usr/local/lib/perl5/man/man3




vendor_perl/5.8.8/



ERROR:

Appending installation info to /nethome/bioinfo/apps/agua/0.4/lib/external/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod
Cannot write to /usr/lib/perl5/vendor_perl/5.8.8/XML/SAX/ParserDetails.ini: Permission denied at /usr/lib/perl5/vendor_perl/5.8.8/XML/SAX.pm line 191.
make: *** [install_sax_pureperl] Error 13




perl Makefile.PL PREFIX=/nethome/bioinfo/apps/agua/0.4/lib/external


INSTALLPRIVLIB=/usr/home/USERNAME/usr/local/lib/perl5 \
INSTALLSCRIPT=/usr/home/USERNAME/usr/local/bin \
INSTALLSITELIB=/usr/home/USERNAME/usr/local/lib/perl5/site_perl \
INSTALLBIN=/usr/home/USERNAME/usr/local/bin \
INSTALLMAN1DIR=/usr/home/USERNAME/usr/local/lib/perl5/man \
INSTALLMAN3DIR=/usr/home/USERNAME/usr/local/lib/perl5/man/man3


For older modules it may be necessary to designate several other variables on the command line during the module installation:

% perl5 Makefile.PL PREFIX=/usr/home/USERNAME/usr/local \
INSTALLPRIVLIB=/usr/home/USERNAME/usr/local/lib/perl5 \
INSTALLSCRIPT=/usr/home/USERNAME/usr/local/bin \
INSTALLSITELIB=/usr/home/USERNAME/usr/local/lib/perl5/site_perl \
INSTALLBIN=/usr/home/USERNAME/usr/local/bin \
INSTALLMAN1DIR=/usr/home/USERNAME/usr/local/lib/perl5/man \
INSTALLMAN3DIR=/usr/home/USERNAME/usr/local/lib/perl5/man/man3
To save yourself some typing you can create a file and put these variable assignments above in to a file (FILENAME) something like this:

PREFIX=/usr/home/USERNAME/usr/local \
INSTALLPRIVLIB=/usr/home/USERNAME/usr/local/lib/perl5 \
INSTALLSCRIPT=/usr/home/USERNAME/usr/local/bin \
INSTALLSITELIB=/usr/home/USERNAME/usr/local/lib/perl5/site_perl \
INSTALLBIN=/usr/home/USERNAME/usr/local/bin \
INSTALLMAN1DIR=/usr/home/USERNAME/usr/local/lib/perl5/man \
INSTALLMAN3DIR=/usr/home/USERNAME/usr/local/lib/perl5/man/man3
Then, each time you install a perl5 module you can use the following syntax:

% perl5 Makefile.PL `cat FILENAME
% make
% make test
% make install
% make clean


</entry>

<entry [Sun Mar  7 13:09:43 EST 2010] MAQ - CONVERT ILLUMINA 1.3+ TO SANGER >

http://stephenjungels.com/jungels.net/articles/diff-patch-ten-minutes.html

http://www.linuxforums.org/articles/using-diff-and-patch_80.html

1. DOWNLOADED PATCH FILE:

http://sourceforge.net/tracker/index.php?func=detail&aid=2824334&group_id=191815&atid=938893

		Illumina to sanger conversion - ID: 2824334
		Last Update: Attachment added ( daweonline )
		Details:
		
		As new Illumina software (GA 1.3+) has changed quality score encoding, I've
		written a small patch which adds 'ill2sanger' function, to convert new
		illumina fastq files into sanger fastq.
		It applies to maq-0.7.1. Essentially it takes the illumina score and adds
		2. The function to read fastq files (defined in seq.c) removes 33 to this
		score, so that the overall operation is removal of 31 from illumina score 

PATCH FILE LOCCATION
maq-ill2sanger.patch
http://sourceforge.net/tracker/download.php?group_id=191815&atid=938893&file_id=335812&aid=2824334

2. APPLIED PATCH

ll maq-ill2sanger.patch
		-rw-r--r-- 1 syoung bioinfo 3.6K Feb  7 23:37 maq-ill2sanger.patchll maq-ill2sanger.patch

cat maq-ill2sanger.patch

		diff -Naur maq-0.7.1/fastq2bfq.c maq-0.7.1.new/fastq2bfq.c
		--- maq-0.7.1/fastq2bfq.c	2008-03-15 13:06:00.000000000 +0100
		+++ maq-0.7.1.new/fastq2bfq.c	2009-07-20 16:52:27.000000000 +0200
		@@ -79,13 +79,36 @@
			seq_set_block_size(256);
			while ((l = seq_read_fastq(fpin, &seq, &qual, name)) >= 0) {
				int i;
		-		fprintf(fpout, "@%s\n%s\n+\n", name, seq.s);
		+		fprintf(fpout, "@%s\n%s\n+%s\n", name, seq.s, name);
				for (i = 0; i != l; ++i)
					qual.s[i] = table[(int)qual.s[i]];
				fprintf(fpout, "%s\n", qual.s);
			}
			free(seq.s); free(qual.s);
		 }
		+void ill2sanger(FILE *fpin, FILE *fpout)
		+{
		+	seq_t seq, qual;
		+	char name[256];
		+	int table[128];
		+	int l;
		+	/* calculate table */
		+	for (l = 0; l != 128; ++l) {
		+		table[l] = (int)(l +2);
		+		if (table[l] <= 33) table[l] = 33;
		+		if (table[l] >= 126) table[l] = 126;
		+	}
		+	INIT_SEQ(seq); INIT_SEQ(qual);
		+	seq_set_block_size(256);
		+	while ((l = seq_read_fastq(fpin, &seq, &qual, name)) >= 0) {
		+		int i;
		+		fprintf(fpout, "@%s\n%s\n+%s\n", name, seq.s, name);
		+		for (i = 0; i != l; ++i) 
		+			qual.s[i] = table[(int)qual.s[i]];
		+		fprintf(fpout, "%s\n", qual.s);
		+	}
		+	free(seq.s); free(qual.s);
		+}
		 int ma_sol2sanger(int argc, char *argv[])
		 {
			FILE *fpin, *fpout;
		@@ -100,6 +123,21 @@
			fclose(fpin); fclose(fpout);
			return 0;
		 }
		+
		+int ma_ill2sanger(int argc, char *argv[])
		+{
		+	FILE *fpin, *fpout;
		+	fpin = fpout = 0;
		+	if (argc < 3) {
		+		fprintf(stderr, "Usage: maq ill2sanger <in.fastq> <out.fastq>\n");
		+		return 1;
		+	}
		+	fpin = (strcmp(argv[1], "-") == 0)? stdin : fopen(argv[1], "r");
		+	fpout = (strcmp(argv[2], "-") == 0)? stdout : fopen(argv[2], "w");
		+	ill2sanger(fpin, fpout);
		+	fclose(fpin); fclose(fpout);
		+	return 0;
		+}
		 int ma_fastq2bfq(int argc, char *argv[])
		 {
			FILE *fp_fq;
		diff -Naur maq-0.7.1/main.c maq-0.7.1.new/main.c
		--- maq-0.7.1/main.c	2008-09-22 10:54:10.000000000 +0200
		+++ maq-0.7.1.new/main.c	2009-07-20 14:28:26.000000000 +0200
		@@ -28,6 +28,7 @@
			fprintf(stderr, "         glfgen      generate .glz consensus\n\n");
			fprintf(stderr, "Format converting:\n");
			fprintf(stderr, "         sol2sanger  convert Solexa FASTQ to standard/Sanger FASTQ\n");
		+	fprintf(stderr, "         ill2sanger  convert Illumina (GA 1.3+) FASTQ to standard/Sanger FASTQ\n");
			fprintf(stderr, "         mapass2maq  convert mapass2's map format to maq's map format\n");
			fprintf(stderr, "         bfq2fastq   convert BFQ to FASTQ format\n\n");
			fprintf(stderr, "Information extracting:\n");
		@@ -80,6 +81,7 @@
			else if (strcmp(argv[1], "assemble") == 0) return ma_assemble(argc-1, argv+1);
			else if (strcmp(argv[1], "glfgen") == 0) return maq_glfgen(argc-1, argv+1);
			else if (strcmp(argv[1], "sol2sanger") == 0) return ma_sol2sanger(argc-1, argv+1);
		+	else if (strcmp(argv[1], "ill2sanger") == 0) return ma_ill2sanger(argc-1, argv+1);
			else if (strcmp(argv[1], "mapass2maq") == 0) return ma_mapass2maq(argc-1, argv+1);
			else if (strcmp(argv[1], "bfq2fastq") == 0) return ma_bfq2fastq(argc-1, argv+1);
			else if (strcmp(argv[1], "mapview") == 0) return ma_mapview(argc-1, argv+1);
		diff -Naur maq-0.7.1/main.h maq-0.7.1.new/main.h
		--- maq-0.7.1/main.h	2008-09-22 10:54:10.000000000 +0200
		+++ maq-0.7.1.new/main.h	2009-07-20 14:28:39.000000000 +0200
		@@ -25,6 +25,7 @@
			int ma_rbcc(int argc, char *argv[]);
			int ma_subpos(int argc, char *argv[]);
			int ma_sol2sanger(int argc, char *argv[]);
		+	int ma_ill2sanger(int argc, char *argv[]);
			int ma_bfq2fastq(int argc, char *argv[]);
			int ma_fakemut(int argc, char *argv[]);     /* in fasta2bfa.c */
			int ma_abpair(int argc, char *argv[]);      /* in pair_stat.cc */



cd /nethome/bioinfo/apps/maq

		patch -p0 < maq-ill2sanger.patch 
		patching file maq-0.7.1/fastq2bfq.c
		patching file maq-0.7.1/main.c
		patching file maq-0.7.1/main.h


[bioinfo@m1 0.7.1]$ make 
cd . && /bin/sh /nethome/bioinfo/apps/maq/0.7.1/missing --run autoheader
/nethome/bioinfo/apps/maq/0.7.1/missing: line 54: autoheader: command not found
WARNING: `autoheader' is missing on your system.  You should only need it if
         you modified `acconfig.h' or `configure.ac'.  You might want
         to install the `Autoconf' and `GNU m4' packages.  Grab them
         from any GNU archive site.
rm -f stamp-h1
touch config.h.in
cd . && /bin/sh ./config.status config.h
config.status: creating config.h
config.status: config.h is unchanged
make  all-am
make[1]: Entering directory `/nethome/bioinfo/apps/maq/0.7.1'
gcc -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c main.c
gcc -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c fasta2bfa.c
gcc -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c fastq2bfq.c
g++ -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c -o match_aux.o match_aux.cc
g++ -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c -o match.o match.cc
g++ -DHAVE_CONFIG_H -I.     -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2 -c -o assemble.o assemble.cc
g++  -Wall -m64 -D_FASTMAP -DMAQ_LONGREADS -g -O2   -o maq main.o const.o seq.o bfa.o read.o fasta2bfa.o fastq2bfq.o merge.o match_aux.o match.o sort_mapping.o assemble.o pileup.o mapcheck.o get_pos.o assopt.o aux_utils.o rbcc.o subsnp.o pair_stat.o indel_soa.o maqmap.o maqmap_conv.o altchr.o submap.o rmdup.o simulate.o genran.o indel_pe.o stdaln.o indel_call.o eland2maq.o csmap2ntmap.o break_pair.o glfgen.o -lm -lz 
make[1]: Leaving directory `/nethome/bioinfo/apps/maq/0.7.1'


3. RECOMPILE

NEWLY COMPILED maq HAS ill2sanger OPTION:

[bioinfo@m1 0.7.1]$ ./maq ill2sanger
Usage: maq ill2sanger <in.fastq> <out.fastq>
[bioinfo@m1 0.7.1]$ 


OLD maq VERSION DOES NOT:

[bioinfo@m1 0.7.1-bkp]$ ./maq ill2sanger
ERROR: unrecognized command 'ill2sanger'



NOTES
=====



http://www.linuxquestions.org/questions/linux-general-1/how-do-you-apply-a-diff-patch-529154/
The basic concept it to apply the 'diff' using the patch command.
Basic command syntax
Code:
$ patch -p[num] < [patchfile]
Example
Code:
$ patch -p1 < diff
Whether or not this will work for your diff file will depend on what your patching and how the diff file is written. Recommend doing 'man patch' and 'man diff' and read the manual. Would also help you to look at any README files or HOW-To's about the specific use of the diff you trying to apply.



</entry>

<entry [Tue Mar  2 17:52:52 EST 2010] USER ACCESS>

syoung,1228791394.7868.158
ntsinoremas,1251309352.3368.000
yedwards,1251309352.3368.111
nnorton,9999999999.9999.999
jclarke,9999999999.9999.999
vandreev,9999999999.9999.999
admin,9999999999.9999.999
dmotti,0000000000.0000.000
jlhaner,0000000000.0000.000


</entry>

<entry [Tue Mar  2 17:51:52 EST 2010] BIOINFO USER>


-----Original Message-----
From: Xinglong Wu via RT [mailto:hpc@ccs.miami.edu] 
Sent: Wednesday, February 10, 2010 9:25 AM
To: Young, Stuart
Subject: [ccstkt #3176] bioinformatics user 

Hi, the password for the user "bioinfo" has been reset as "HPC2welcome". Let us
know if you need more help.

Xinglong

On Tue Feb 09 20:36:52 2010, syoung wrote:
> Hi there,
>
> I tried to 'su' to the bioinfo user on kronos-x but couldn't get in.
> Could you send me the new password?
>
> Cheers,
>
> Stuart.




</entry>

<entry [Sat Feb 27 22:45:05 EST 2010] TESTING RACE CONDITION ON ngsdev>


SOLUTION: USED dojox.timing.Sequence IN plugins.project.ProjectFiles.load()




TEST RESULTS:



FAILED:

PROJECT 1 AND PROJECT 2


TIMINGS:

TEST 1

head /tmp/project-cgi-log.txt*
==> /tmp/project-cgi-log.txt1427129.77555679 <==
seconds: 1267326517.28126
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=1267326461579
==> /tmp/project-cgi-log.txt282135.287570817 <==
seconds: 1267326517.46233
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267326461864
==> /tmp/project-cgi-log.txt7995302.6173553 <==
seconds: 1267326517.1633
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267326461612
==> /tmp/project-cgi-log.txt818666.856075687 <==
seconds: 1267326517.63555
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Pr
oject1%22&dojo.prevent


TEST 2

[root@ngsdev syoung]# head /tmp/project-cgi-log.txt*
==> /tmp/project-cgi-log.txt2524238.35759149 <==
seconds: 1267326561.21552
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267326535929
==> /tmp/project-cgi-log.txt2861194.06883703 <==
seconds: 1267326561.27756
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267326535975
==> /tmp/project-cgi-log.txt5097704.28137021 <==
seconds: 1267326560.85201
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=1267326535657
==> /tmp/project-cgi-log.txt7338237.77017282 <==
seconds: 1267326560.98035
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267326535709

TEST 3

[root@ngsdev syoung]# head /tmp/project-cgi-log.txt*
==> /tmp/project-cgi-log.txt1156410.33350588 <==
seconds: 1267326801.00256
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267326747606
==> /tmp/project-cgi-log.txt4524809.54890238 <==
seconds: 1267326800.71223
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267326747346
==> /tmp/project-cgi-log.txt6616332.87164481 <==
seconds: 1267326801.12061
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267326747579
==> /tmp/project-cgi-log.txt7755558.61721845 <==
seconds: 1267326800.81911
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=126732
6747313


TEST 4

==> /tmp/project-cgi-log.txt2697439.21308876 <==
seconds: 1267326985.13549
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267326948104
==> /tmp/project-cgi-log.txt2944537.11788268 <==
seconds: 1267326985.00525
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267326948078
==> /tmp/project-cgi-log.txt3176264.93125321 <==
seconds: 1267326984.83793
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=1267326947821
==> /tmp/project-cgi-log.txt9576163.64889876 <==
seconds: 1267326984.68852
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267326947853


/*{'name':'Project1','path':'Project1','parentPath':'Project1','parentDir':'Project1','directory':'','size':'','modified':'','sample':''}*/

/*{'name':'Project2','path':'Project2','parentPath':'Project2','parentDir':'Project2','directory':'','size':'','modified':'','sample':''}*/



WORKED!:

TEST 5


==> /tmp/project-cgi-log.txt1356898.22564931 <==
seconds: 1267327195.24839
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267327165279
==> /tmp/project-cgi-log.txt3513158.60710205 <==
seconds: 1267327195.80792
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267327165621
==> /tmp/project-cgi-log.txt6056146.41056494 <==
seconds: 1267327195.74869
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267327165680
==> /tmp/project-cgi-log.txt6569285.8056082 <==
seconds: 1267327195.19586
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=1267327165217




/*{'name':'Project1','path':'Project1','total':'7','items':[{'name':'STDIN.o170959','path':'STDIN.o170959','parentPath':'Project1','parentDir':'Project1','directory':false,'size':'1846','modified':1267220842,'sample':'c21&nbsp;Doing&nbsp;image2eland.pl...&nbsp;configfile:&nbsp;/home/bioinfo/apps/aqwa/bin/apps/../../c'},{'name':'Workflow0','path':'Workflow0','parentPath':'Project1','parentDir':'Project1','directory':true,'size':'16384','modified':1267322501,'children':['..','.scripts','STDIN.o236703']},{'name':'Workflow1','path':'Workflow1','parentPath':'Project1','parentDir':'Project1','directory':true,'size':'16384','modified':1267320807,'children':['.','..','.scripts','1','2','3','454AllDiffs-headers-SNP.0.txt','454AllDiffs-headers-SNP.1.txt','454AllDiffs-headers-SNP.2.txt','454AllDiffs-headers-SNP.3.txt','454AllDiffs-headers-SNP.4.txt','454AllDiffs-headers-SNP.5.txt','454AllDiffs-headers-SNP.txt','454HCDiffs-headers-SNP.0.txt','454HCDiffs-headers-SNP.1.txt','454HCDiffs-headers-SNP.txt','IonTorrent.htm','LL','STDIN.e233810','STDIN.e234598','STDIN.e234599','STDIN.e234600','STDIN.e234602','STDIN.e234603','STDIN.e234604','STDIN.e234605','STDIN.e234606','STDIN.e235876','STDIN.e235877','STDIN.e235878','STDIN.e235879','STDIN.e235880','STDIN.e235881','STDIN.e235882','STDIN.e235883','STDIN.e235884','STDIN.e235887','STDIN.e235888','STDIN.e235889','STDIN.e235890','STDIN.e235891','STDIN.e235892','STDIN.e235896','STDIN.e235897','STDIN.e235898','STDIN.e235899','STDIN.e235900','STDIN.e235901','STDIN.e235902','STDIN.e235903','STDIN.e235904','STDIN.e235905','STDIN.e235908','STDIN.e235909','STDIN.e235912','STDIN.e235923','STDIN.o233810','STDIN.o234598','STDIN.o234599','STDIN.o234600','STDIN.o234602','STDIN.o234603','STDIN.o234604','STDIN.o234605','STDIN.o234606','STDIN.o235876','STDIN.o235877','STDIN.o235878','STDIN.o235879','STDIN.o235880','STDIN.o235881','STDIN.o235882','STDIN.o235883','STDIN.o235884','STDIN.o235887','STDIN.o235888','STDIN.o235889','STDIN.o235890','STDIN.o235891','STDIN.o235892','STDIN.o235896','STDIN.o235897','STDIN.o235898','STDIN.o235899','STDIN.o235900','STDIN.o235901','STDIN.o235902','STDIN.o235903','STDIN.o235904','STDIN.o235905','STDIN.o235908','STDIN.o235909','STDIN.o235912','STDIN.o235923','archive','assemble.log','cns.fq','cns.snp','consensus.cns','downloads','mapcheck.txt','out','out.SNPfilter','out.indelpe','out.indelsoa','out.indelsoa.filter','out.map','out.rmdup','s_1_1_sequence.100000.txt','s_1_2_sequence.100000.txt','splitfile.txt','splitfiles','temp.map']},{'name':'Workflow1b','path':'Workflow1b','parentPath':'Project1','parentDir':'Project1','directory':true,'size':'16384','modified':1267131643,'children':['1','2','3','s_1_1_sequence.100000.txt','s_1_1_sequence.SANGER.100000.txt','s_1_2_sequence.100000.txt','s_1_2_sequence.SANGER.100000.txt','splitfiles']},{'name':'Workflow2','path':'Workflow2','parentPath':'Project1','parentDir':'Project1','directory':true,'size':'16384','modified':1267222174,'children':['091029_HWI-EAS185_0005_42BNYAAXX','STDIN.o171654','STDIN.o171655','STDIN.o171680','STDIN.o171681','STDIN.o171682','old','outdir','run-image2eland.sh','test-usage.txt']},{'name':'Workflow3','path':'Workflow3','parentPath':'Project1','parentDir':'Project1','directory':true,'size':'16384','modified':1267108718,'children':['seqfiles']},{'name':'test-usage.txt','path':'test-usage.txt','parentPath':'Project1','parentDir':'Project1','directory':false,'size':'31071','modified':1267220842,'sample':'Job&nbsp;Id:&nbsp;170933.kronos.ccs.miami.edu&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Job_Name&nbsp;=&nbsp;STDIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Job_Owner&nbsp;=&nbsp;syoung@'}]}*/


/*{'name':'Project2','path':'Project2','total':'3','items':[{'name':'Workflow1','path':'Workflow1','parentPath':'Project2','parentDir':'Project2','directory':true,'size':'16384','modified':1267096934,'children':[]},{'name':'Workflow1-transcriptome','path':'Workflow1-transcriptome','parentPath':'Project2','parentDir':'Project2','directory':true,'size':'16384','modified':1267188366,'children':['.svn','10','reads.fastq','test.txt']},{'name':'Workflow2','path':'Workflow2','parentPath':'Project2','parentDir':'Project2','directory':true,'size':'16384','modified':1267108704,'children':['.scripts','miniMAQ.stdout','reads.fastq','reference.fasta','test.txt']}]}*/




TEST 6

==> /tmp/project-cgi-log.txt3602235.54381268 <==
seconds: 1267327402.34387
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=1267327348915
==> /tmp/project-cgi-log.txt5342269.96897818 <==
seconds: 1267327402.45933
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267327348977
==> /tmp/project-cgi-log.txt5947689.89439221 <==
seconds: 1267327402.89726
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267327349289
==> /tmp/project-cgi-log.txt9996819.35253651 <==
seconds: 1267327402.8598
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267327349321



FAILED:

TEST 7

==> /tmp/project-cgi-log.txt2064389.57321556 <==
seconds: 1267328594.5294
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267328541903
==> /tmp/project-cgi-log.txt7510210.57208167 <==
seconds: 1267328594.43865
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267328541930
==> /tmp/project-cgi-log.txt9776333.90882151 <==
seconds: 1267328594.03901
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=1267328541628
==> /tmp/project-cgi-log.txt9831347.59198041 <==
seconds: 1267328594.1363
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267328541662[root@ngsdev syoung]# 
		

/*{'name':'Project1','path':'Project1','parentPath':'Project1','parentDir':'Project1','directory':'','size':'','modified':'','sample':''}*/

/*{'name':'Project2','path':'Project2','parentPath':'Project2','parentDir':'Project2','directory':'','size':'','modified':'','sample':''}*/


SETTIMOUT SUCCEEDED:

TEST 8


==> /tmp/project-cgi-log.txt1487205.03625558 <==
seconds: 1267328918.29653
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267328862583
==> /tmp/project-cgi-log.txt2981619.72387792 <==
seconds: 1267328917.50751
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267328861932
==> /tmp/project-cgi-log.txt5640386.07132719 <==
seconds: 1267328917.58227
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267328861987
==> /tmp/project-cgi-log.txt6187948.95782234 <==
seconds: 1267328918.35854
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267328862527



FAILED: PROJECT 1 ONLY

TEST 9

==> /tmp/project-cgi-log.txt3833978.32586528 <==
seconds: 1267329209.74234
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=1267329155216
==> /tmp/project-cgi-log.txt4612191.25035317 <==
seconds: 1267329210.30331
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267329155595
==> /tmp/project-cgi-log.txt539956.729198856 <==
seconds: 1267329210.18848
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267329155630
==> /tmp/project-cgi-log.txt7160202.12815241 <==
seconds: 1267329209.6272
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267329155301



FAILED PROJECT 1 AND PROJECT 2

TEST 10


==> /tmp/project-cgi-log.txt1111741.45554291 <==
seconds: 1267329631.0853
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=1267329601657
==> /tmp/project-cgi-log.txt1544976.09780268 <==
seconds: 1267329631.46629
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267329601973
==> /tmp/project-cgi-log.txt6134897.90660427 <==
seconds: 1267329631.2408
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267329601690
==> /tmp/project-cgi-log.txt6139180.62838824 <==
seconds: 1267329631.54945
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267329601943
















[root@ngsdev cgi-bin]# head /tmp/project-cgi-log.txt*
==> /tmp/project-cgi-log.txt1200204.13146452 <==
Sat Feb 27 02:10:34 EST 2010
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project2%22&dojo.preventCache=1267254607700
==> /tmp/project-cgi-log.txt1540793.99145306 <==
Sat Feb 27 02:10:34 EST 2010
mode=fileSystem&sessionId=1228791394.7868.158&requestor=syoung&username=admin&groupname=NextGen&query=%22Project1%22&dojo.preventCache=1267254607666
==> /tmp/project-cgi-log.txt306626.803512735 <==
Sat Feb 27 02:10:34 EST 2010
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22&dojo.preventCache=1267254607344
==> /tmp/project-cgi-log.txt9461671.51982994 <==
Sat Feb 27 02:10:34 EST 2010
mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project2%22&dojo.preventCache=1267254607405

struct timeval tv;
struct timezone tz;
struct tm *tm;
gettimeofday(&tv, &tz);
tm=localtime(&tv.tv_sec);
printf(" %d:%02d:%02d %d \n", tm->tm_hour, tm->tm_min, tm->tm_sec, tv.tv_usec);






HOME DIRECTORY FOLDER GIVES 'Sorry, a problem occurred' BUT SHARED FOLDERS DISPLAY OKAY

REMOVED project-temp.jsonXXXX FILES IN /tmp SEEMED TO FIX THE PROBLEM TEMPORARILY...


mode=fileSystem&username=syoung&requestor=dmotti&sessionId=0000000000.0000.000&location=/nethome/bioinfo/data/sequence&groupname=Bixby&query=%22chromosomes%22&dojo.preventCache=1267156834272
mode=fileSystem&username=dmotti&sessionId=0000000000.0000.000&query=%22Project1%22&dojo.preventCache=1267156834120
mode=fileSystem&username=syoung&requestor=dmotti&sessionId=0000000000.0000.000&location=/nethome/bioinfo/data/sequence&groupname=Bixby&query=%22demo%22&dojo.preventCache=1267156834215
mode=fileSystem&username=syoung&requestor=dmotti&sessionId=0000000000.0000.000&location=/q&groupname=Bixby&query=%22solexa1%22&dojo.preventCache=1267156834300



OCCASIONALLY GET THE CORRECT RESPONSE:


dojo.preventCache	1267158133039
mode	fileSystem
query	"Project1"
sessionId	0000000000.0000.000
username	dmotti

Response Headersview source
Date	Fri, 26 Feb 2010 04:22:58 GMT
Server	Apache/2.2.3 (CentOS)
Connection	close
Transfer-Encoding	chunked
Content-Type	text/html; charset=UTF-8
Request Headersview source
Host	ngsdev.ccs.miami.edu
User-Agent	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.8) Gecko/20100202 Firefox/3.5.8
Accept	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language	en-us,en;q=0.5
Accept-Encoding	gzip,deflate
Accept-Charset	ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive	300
Connection	keep-alive
Content-Type	application/x-www-form-urlencoded
X-Requested-With	XMLHttpRequest
Referer	http://ngsdev.ccs.miami.edu/agua/0.4/index.html?dmotti

/*{'name':'Project1','path':'Project1','total':'1','items':[{'name':'Workflow1','path':'Workflow1','parentPath':'Project1','parentDir':'Project1','directory':true,'size':'16384','modified':1267157693,'children':['.scripts','left_kept_reads.fq','logs','tmp']}]}*/


BUT USUALLY GET THE INCORRECT RESPONSE


dojo.preventCache	1267158276300
mode	fileSystem
query	"Project1"
sessionId	0000000000.0000.000
username	dmotti

Response Headersview source
Date	Fri, 26 Feb 2010 04:24:56 GMT
Server	Apache/2.2.3 (CentOS)
Connection	close
Transfer-Encoding	chunked
Content-Type	text/html; charset=UTF-8
Request Headersview source
Host	ngsdev.ccs.miami.edu
User-Agent	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.8) Gecko/20100202 Firefox/3.5.8
Accept	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language	en-us,en;q=0.5
Accept-Encoding	gzip,deflate
Accept-Charset	ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive	300
Connection	keep-alive
Content-Type	application/x-www-form-urlencoded
X-Requested-With	XMLHttpRequest
Referer	http://ngsdev.ccs.miami.edu/agua/0.4/index.html?dmotti

/*{'name':'Project1','path':'Project1','parentPath':'Project1','parentDir':'Project1','directory':'','size':'','modified':'','sample':''}*/




</entry>

<entry [Tue Feb 23 23:38:16 EST 2010] FIXES: ADDED nls FILE FOR ITALIAN SUPPORT>


E:\0.4\html\dojo.1.2.2\dijit\nls\dijit-all_it.js




h2. The locations of bowtie, tophat and cufflinks on the cluster:

{code}
/nethome/bioinfo/apps/BOWTIE/0.12.2
/nethome/bioinfo/apps/TOPHAT/0.1.12/bin
/nethome/bioinfo/apps/CUFFLINKS/0.7.0/bin
{code}

Tophat home page
http://tophat.cbcb.umd.edu

</entry>

<entry [Tue Feb 23 11:32:31 EST 2010] TEST deepvac.pl - OK>


NB: After unzipping bowtie index files, create a stub file for each genome.

E.g., for hg 19, create a file 'hg19' 

This is so that the Agua users can browse to the directory and select the files\
 and subsequently Agua can verify the presence of the genome.




</entry>

<entry [Tue Feb 23 11:32:31 EST 2010] TEST deepvac.pl - OK>


FROM URL:

http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/ 


		This directory contains a dump of the UCSC genome annotation database for
		the Feb. 2009 assembly of the human genome (hg19, GRCh37 Genome Reference
		Consortium Human Reference 37 (GCA_000001405.1)).


/nethome/bioinfo/apps/agua/0.4/bin/apps/utils/deepvac.pl --outputdir /nethome/aqwa/home/admin/Project1/Workflow1/downloads --type html --url http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/


		Doing get(http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database)
		wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/?C=N;O=D
		--14:38:06--  http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/?C=N
		Resolving hgdownload.cse.ucsc.edu... 128.114.119.148
		Connecting to hgdownload.cse.ucsc.edu|128.114.119.148|:80... connected.
		HTTP request sent, awaiting response... 200 OK
		Length: unspecified [text/html]
		Saving to: `index.html?C=N.1'
		
			[  <=>                                                      ] 53,076       251K/s   in 0.2s   
		
		14:38:07 (251 KB/s) - `index.html?C=N.1' saved [53076]
		
		wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/all_bacends.sql
		--14:38:07--  http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/all_bacends.sql
		Resolving hgdownload.cse.ucsc.edu... 128.114.119.148
		Connecting to hgdownload.cse.ucsc.edu|128.114.119.148|:80... connected.
		HTTP request sent, awaiting response... 200 OK
		Length: 2195 (2.1K) [text/plain]
		Saving to: `all_bacends.sql.1'
		
		100%[==========================================================>] 2,195       --.-K/s   in 0s     
		
		14:38:07 (36.1 MB/s) - `all_bacends.sql.1' saved [2195/2195]
		...





</entry>

<entry [Tue Feb 23 10:32:31 EST 2010] CREATED AGUA 0.4>


1. COPY SOURCE CODE

mkdir /data/agua/
cp -r /data/aqwa/0.4 /data/agua


2. COPY CGI-BIN WITH PERMISSIONS
sudo su
rm -fr /data/agua/0.4/cgi-bin
sudo su
cp -pr /data/aqwa/0.4/cgi-bin ./

ll cgi-bin/
		total 300
		-rwsr-sr-x 1 root   bioinfo               6556 Nov  3 12:17 admin.cgi
		-rw-r--r-- 1 syoung bioinfo               2333 Feb 22 10:38 admin.pl
		-rwxr-xr-x 1 syoung bioinfo               3823 Dec  2 05:37 adminrelay.pl
		drwxr-xr-x 2 syoung bioinfo               4096 Oct 10 20:59 archive
		lrwxrwxrwx 1 syoung bioinfo                 19 Feb 23 10:36 conf -> /data/aqwa/0.4/conf
		-rwsr-sr-x 1 root   root                  4028 Feb 16 04:40 download.cgi
		-rw-r--r-- 1 syoung bioinfo               1968 Feb 22 10:40 download.pl
		drwxr-xr-x 3 syoung bioinfo               4096 Dec  2 05:37 downloads
		-rw-r--r-- 1 syoung bioinfo                107 Dec  2 05:37 execute.bat
		-rwxr-xr-x 1 syoung bioinfo               2181 Feb  1 23:46 filemanager.pl
		-rwxr-xr-x 1 syoung bioinfo               6278 Dec  2 05:37 file.pl
		-rwxr-xr-x 1 syoung bioinfo              11836 Dec  2 05:37 galaxyDownload.cgi
		-rwsr-sr-x 1 root   bioinfo                586 Dec 17  2008 ldap.cgi
		lrwxrwxrwx 1 syoung bioinfo                 18 Feb 23 10:36 lib -> /data/aqwa/0.4/lib
		-rw-r--r-- 1 root   root                 61090 Feb 18 01:19 #out#
		drwxr-xr-x 2 syoung bioinfo               4096 Feb  3 03:31 -p
		-rwsr-sr-x 1 root   root                  4367 Oct 10 23:23 project.cgi
		-rw-r--r-- 1 syoung bioinfo               4874 Feb 18 23:07 project.pl
		-rwsr-sr-x 1 aqwa   mihg-data-drive-full  2819 Oct 19 04:05 putrelay.pl
		-rw-r--r-- 1 root   root                  6501 Oct 10 21:00 qsub.tar.gz
		-rwsr-sr-x 1 aqwa   mihg-data-q-solexa    3801 Oct 19 03:34 relay.pl
		-rwxr-xr-x 1 syoung bioinfo               3928 Nov  5 11:58 report.cgi
		-rw-r--r-- 1 syoung bioinfo               6969 Feb 22 10:43 setuid.pl
		-rwxr-xr-x 1 syoung bioinfo              57089 Oct 10 20:55 setuid.tar.gz
		lrwxrwxrwx 1 syoung bioinfo                 22 Feb 23 10:36 sql -> /data/aqwa/0.4/bin/sql
		drwxr-xr-x 3 syoung apache               16384 Feb 16 03:41 t
		-rwxr-xr-x 1 syoung bioinfo                 84 Oct 17 21:55 test.cgi
		-rw-r--r-- 1 syoung bioinfo               6175 Feb 22 10:42 transferUpload.pl
		-rwsr-sr-x 1 root   root                  8098 Feb 16 04:25 upload.cgi
		-rwxr-xr-x 1 syoung bioinfo               3226 Feb 18 10:38 user.pl
		-rwsr-sr-x 1 root   root                  5513 Feb 18 10:40 workflow.cgi
		-rw-r--r-- 1 syoung bioinfo               6939 Feb 22 07:31 workflow.pl
		-rw-r--r-- 1 syoung bioinfo               6938 Feb 21 23:10 workflow.pl~



3. CREATE LINKS IN CGI-BIN

rm -fr /data/agua/0.4/cgi-bin/conf
rm -fr /data/agua/0.4/cgi-bin/lib
rm -fr /data/agua/0.4/cgi-bin/sql

ln -s /data/agua/0.4/conf /data/agua/0.4/cgi-bin/conf
ln -s /data/agua/0.4/lib /data/agua/0.4/cgi-bin/lib
ln -s /data/agua/0.4/bin/sql /data/agua/0.4/cgi-bin/sql


4. LINK html AND cgi-bin TO WEB FOLDERS


mkdir /var/www/html/agua
ln -s /data/agua/0.4/html /var/www/html/agua/0.4

mkdir /var/www/cgi-bin/agua
ln -s /data/agua/0.4/cgi-bin /var/www/cgi-bin/agua/0.4


5. BROWSE TO Agua 0.4

http://ngsdev.ccs.miami.edu/agua/0.4








</entry>

<entry [Thu Feb 18 13:00:02 EST 2010] IO::CaptureOutput TO GET STDOUT AND STDERR FROM AN EXECUTED APPLICATION>


use IO::CaptureOutput qw/capture_exec/;

my ($stdout, $stderr, $success, $exit_code) = capture_exec( @cmd );

This is the capture_exec() function, but IO::CaptureOutput also has a more general capture() function that can be used
to capture either Perl output or output from external programs. So if some Perl module happens to use some external
program, you still get the output.

It also means you only need to remember one single approach to capturing STDOUT and STDERR (or merging them) instead
of using IPC::Open3 for external programs and other modules for capturing Perl output.



</entry>

<entry [Thu Feb 18 02:23:02 EST 2010] RAN WORKFLOW ON AGUA>


[{'childpid':'234835','number':'1','status':'','project':'Project1','workflowpid':null,'completed':null,'owner':'admin','cluster':'','location':'apps/clusterELAND.pl','executor':'perl','name':'ELAND','username':'admin','workflow':'Workflow1','parentpid':'5889','type':'alignment','started':'2010-02-18 12:13:03'},{'childpid':'234836','number':'2','status':'0','project':'Project1','workflowpid':null,'completed':null,'owner':'admin','cluster':'PBS','location':'apps/MAQ.pl','executor':'/usr/bin/perl','name':'MAQ','username':'admin','workflow':'Workflow1','parentpid':'5889','type':'pipeline','started':null},{'childpid':'234835','number':'3','status':'','project':'Project1','workflowpid':null,'completed':null,'owner':'admin','cluster':'','location':'apps/filterSNP.pl','executor':'perl','name':'filterSNP','username':'admin','workflow':'Workflow1','parentpid':'5889','type':'report','started':null}]



MAQ OUTPUT PARAMETERS

select name ,value from parameter where paramtype='output' and appname='MAQ';
+------------------+------------------------------------------+
| name             | value                                    |
+------------------+------------------------------------------+
| mapfile          | %project%/%workflow%/out.map             | 
| dupfile          | %project%/%workflow%/rmdup.map           | 
| PE-indels        | %project%/%workflow%/out.indelpe         | 
| consensus        | %project%/%workflow%/cns.fq              | 
| hz-indels        | %project%/%workflow%/out.indelsoa        | 
| hz-indels-filter | %project%/%workflow%/out.indelsoa.filter | 
| snp              | %project%/%workflow%/cns.snp             | 
| snp-filter       | %project%/%workflow%/out.SNPfilter       | 
+------------------+------------------------------------------+


mapfile
out.map
Binary mapping file containing alignment of all reads against reference

dupfile
out.rmdup
Same as out.map file but with duplicate reads aligned against the reference with identical outer coordinates removed

PE-indels
out.indelpe
Indel calls, only produced with paired-end reads

consensus
cns.fq
Consensus sequence and qualities in FASTQ format

hz-indels
out.indelsoa
Predicted homozygous indels

hz-indels-filter
out.indelsoa.filter
Filtered predicted homozygous indels

snp
cns.snp
List of raw SNPs extracted from comparison of consensus and reference files

snp-filter
out.SNPfilter
Filtered SNP predictions based on indelsoa, indelpe and cns.snp files



</entry>

<entry [Wed Feb 17 13:37:02 EST 2010] RAN WORKFLOW ON AGUA>




EXECUTE WORKFLOW

{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":"1"}

OK FOR SYOUNG USER

RUNS AS aqwa FOR ADMIN USER



TEST FILEROOT

{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","report":"Report1","mode":"fileroot"}


TEST ON COMMAND LINE


su aqwa

cd /nethome/aqwa/home/admin/Project1/Workflow1

perl /nethome/bioinfo/apps/agua/0.4/bin/apps/MAQ.pl \
--convert \
--outputdir /nethome/aqwa/home/admin/Project1/Workflow1 \
--matefile /nethome/bioinfo/data/sequence/demo/maq/inputs/s_1_2_sequence.100000.txt \
--inputfile /nethome/bioinfo/data/sequence/demo/maq/inputs/s_1_1_sequence.100000.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-bfa \
--jobs 30 \
--reads 10000





RUNS BUT FILE NOT CREATED SO 


###/nethome/bioinfo/apps/agua/0.4/bin/apps/ERANGE.pl \
###--inputfile /nethome/aqwa/home/admin/.aqwa/Project1/Workflow1/454AllDiffs-headers-SNP.0.txt \
###--inputtype fastq \
###--outputdir /nethome/aqwa/home/admin/.aqwa/Project1/Workflow1 \
###--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-bfa





RUN STATUS
==========

WINDOWS
echo {"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","number":"3","mode":"runStatus"} | perl -U workflow.cgi


LINUX
echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","number":"3","mode":"runStatus"}' | perl -U workflow.cgi
 

EXECUTE
=======

echo '{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":"1"}' | perl -U workflow.cgi


echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":"1","asuser":"syoung"}' | perl /data/aqwa/0.4/cgi-bin/workflow.pl






CHECK 'NO GROUPS' IN ADMIN TAB
==============================
					   
echo {"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","number":"3","mode":"getData"} | perl -U workflow.cgi



PROBLEM:

ERROR WHEN RUNNING WORKFLOW IN AGUA:

mkdir /nethome/aqwa/home/admin/.aqwa/Project1/Workflow1/.scripts: Permission denied at /data/aqwa/0.4/cgi-bin/lib/Workflow.pm line 659


					   whoami: 
					   admin
					   <h1>Software error:</h1>
					   <pre>mkdir /nethome/aqwa/home/admin/.aqwa/Project1/Workflow1/.scripts: Permission denied at /data/aqwa/0.4/cgi-bin/lib/Workflow.pm line 659
					   </pre>
					   <p>
					   For help, please send mail to the webmaster (<a href="mailto:root@localhost">root@localhost</a>), giving this error message 
					   and the time and date of the error.


echo '{"username":"admin","sessionId":"1266432025.17683.485","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","number":"1"}' | perl -U workflow.cgi


SOLUTION:

ADDED as_user METHOD TO workflow.cgi





</entry>




<entry [Tue Feb 16 18:00:00 EST 2010] PROBLEM WITH SOME KIND OF RACE CONDITION ON THE SERVER>


PROBLEM:

APPARENTLY apache, OR perl, RANDOMLY EXECUTES workflow.cgi WITH A SINGLE SET OF PARAMETERS TAKEN FROM THE LAST OF A SERIES OF REQUESTS SENT IN CLOSE SUCCESSION


SOLUTION:


ADDED RANDOM NUMBER IN content IN xhrPut AND IN dojo.preventCache= IN URL:


		var url = this.randomiseUrl(Aqwa.cgiUrl + "workflow.cgi");
		console.log("InfoPaneRow.checkFile    url: " + url);

		var fileInfo;

		// ADD RANDOM NUMBER CONTENT TO DISAMBIGUATE
		var content = Math.floor(Math.random()*1000000000000);


SO THE PROBLEM LIES WITH EITHER APACHE DISAMBIGUATING DIFFERENT RESPONSES FROM THE SAME SCRIPT WITHIN A SHORT SPACE OF TIME


EXAMPLE
=======


4 REQUESTS SENT IN CLOSE SUCCESSION FROM CLIENT TO SERVER

emacs -nw /var/log/httpd/access_log

10.150.190.204 - - [16/Feb/2010:17:49:53 -0500] "PUT /cgi-bin/aqwa/trunk/0.4/workflow.cgi?dojo.preventCache=1266358799763614072543243 HTTP/1.1" 200 219 "http://ngsdev.ccs.miami.edu/aqwa/trunk/0.4/index.html?syoung" "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7"
10.150.190.204 - - [16/Feb/2010:17:49:54 -0500] "PUT /cgi-bin/aqwa/trunk/0.4/workflow.cgi?dojo.preventCache=1266358799763776647637358 HTTP/1.1" 200 208 "http://ngsdev.ccs.miami.edu/aqwa/trunk/0.4/index.html?syoung" "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7"
10.150.190.204 - - [16/Feb/2010:17:49:54 -0500] "PUT /cgi-bin/aqwa/trunk/0.4/workflow.cgi?dojo.preventCache=1266358799763312656010851 HTTP/1.1" 200 208 "http://ngsdev.ccs.miami.edu/aqwa/trunk/0.4/index.html?syoung" "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7"
10.150.190.204 - - [16/Feb/2010:17:49:54 -0500] "PUT /cgi-bin/aqwa/trunk/0.4/workflow.cgi?dojo.preventCache=1266358799763735177217894 HTTP/1.1" 200 208 "http://ngsdev.ccs.miami.edu/aqwa/trunk/0.4/index.html?syoung" "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7"



workflow.cgi/Common.pm IS SET TO WRITE THE RESULTS TO A TEMP FILE FOR EACH DIFERRENT FILE PATH BUT ONLY THREE OF THE EXPECTED FOUR TEMP FILES APPEAR IN THE /tmp DIR:


OUTPUT IN /tmp
==============

[syoung@ngsdev Workflow1]$ ll /tmp
...
-rw-rw-rw-  1 syoung mihg-data-drive-full  208 Feb 16 17:49 -nethome-bioinfo-data-sequence-chromosomes-human-bfa
-rw-rw-rw-  1 syoung mihg-data-drive-full  196 Feb 16 17:43 Project1-Workflow1
-rw-rw-rw-  1 syoung mihg-data-drive-full  219 Feb 16 17:49 Project1-Workflow1-454HCDiffs-headers-SNP.txt



THIS IS EVIDENCED BY THE Net PANE ENTRIES SHOWING Net TRAFFIC TO AND FROM THE SERVER WHICH SHOW THAT THE WRONG FILE OUTPUT (THE OUTPUT FOR THE FINAL REQUEST) IS ASSOCIATED WITH TWO OF THE REQUEST RESPONSES (THE PRECEDING TWO REQUESTS)

FIREBUG
=======


PUT workflow.cgi?dojo.preventCache=1266358799763614072543243
http://ngsdev.ccs.miami.edu/cgi-bin/aqwa/trunk/0.4/workflow.cgi?dojo.preventCache=1266358799763614072543243
	
200 OK
	
ngsdev.ccs.miami.edu
	
?
	
 
3.87s
	
ParamsHeadersPostPutResponseCacheHTMLJSON
Response Headersview source
Date	Tue, 16 Feb 2010 22:49:53 GMT
Server	Apache/2.2.3 (CentOS)
Connection	close
Transfer-Encoding	chunked
Content-Type	text/plain; charset=UTF-8
Request Headersview source
Host	ngsdev.ccs.miami.edu
User-Agent	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7
Accept	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language	en-us,en;q=0.5
Accept-Encoding	gzip,deflate
Accept-Charset	ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive	300
Connection	keep-alive
Content-Type	text; charset=UTF-8
X-Requested-With	XMLHttpRequest
Referer	http://ngsdev.ccs.miami.edu/aqwa/trunk/0.4/index.html?syoung
Content-Length	177
Pragma	no-cache
Cache-Control	no-cache
Source
{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"checkFile","filepath":"Project1/Workflow1/454HCDiffs-headers-SNP.txt"}

{
   "permissions" : 438,
   "type" : "file",
   "exists" : "true",
   "filepath" : "/nethome/syoung/.aqwa/Project1/Workflow1/454HCDiffs-headers-SNP.txt",
   "modified" : "Tue Feb 16 04:11:37 2010",
   "size" : 403427
}

 
	
PUT workflow.cgi?dojo.preventCache=1266358799763776647637358
http://ngsdev.ccs.miami.edu/cgi-bin/aqwa/trunk/0.4/workflow.cgi?dojo.preventCache=1266358799763776647637358
	
	
ParamsHeadersPostPutResponseCacheHTMLJSON
Response Headersview source
Date	Tue, 16 Feb 2010 22:49:54 GMT
Server	Apache/2.2.3 (CentOS)
Connection	close
Transfer-Encoding	chunked
Content-Type	text/plain; charset=UTF-8
Request Headersview source
Host	ngsdev.ccs.miami.edu
User-Agent	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7
Accept	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language	en-us,en;q=0.5
Accept-Encoding	gzip,deflate
Accept-Charset	ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive	300
Connection	keep-alive
Content-Type	text; charset=UTF-8
X-Requested-With	XMLHttpRequest
Referer	http://ngsdev.ccs.miami.edu/aqwa/trunk/0.4/index.html?syoung
Content-Length	180
Pragma	no-cache
Cache-Control	no-cache
Source
{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"checkFile","filepath":"Project1/Workflow1/454AllDiffs-headers-SNP.2.txt"}

{
   "permissions" : 493,
   "type" : "directory",
   "exists" : "true",
   "filepath" : "/nethome/bioinfo/data/sequence/chromosomes/human-bfa",
   "modified" : "Mon Sep 28 12:19:45 2009",
   "size" : 16384
}

 
	
PUT workflow.cgi?dojo.preventCache=1266358799763312656010851
http://ngsdev.ccs.miami.edu/cgi-bin/aqwa/trunk/0.4/workflow.cgi?dojo.preventCache=1266358799763312656010851
	
	
ParamsHeadersPostPutResponseCacheHTMLJSON
Response Headersview source
Date	Tue, 16 Feb 2010 22:49:54 GMT
Server	Apache/2.2.3 (CentOS)
Connection	close
Transfer-Encoding	chunked
Content-Type	text/plain; charset=UTF-8
Request Headersview source
Host	ngsdev.ccs.miami.edu
User-Agent	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7
Accept	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language	en-us,en;q=0.5
Accept-Encoding	gzip,deflate
Accept-Charset	ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive	300
Connection	keep-alive
Content-Type	text; charset=UTF-8
X-Requested-With	XMLHttpRequest
Referer	http://ngsdev.ccs.miami.edu/aqwa/trunk/0.4/index.html?syoung
Content-Length	150
Pragma	no-cache
Cache-Control	no-cache
Source
{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"checkFile","filepath":"Project1/Workflow1"}

{
   "permissions" : 493,
   "type" : "directory",
   "exists" : "true",
   "filepath" : "/nethome/bioinfo/data/sequence/chromosomes/human-bfa",
   "modified" : "Mon Sep 28 12:19:45 2009",
   "size" : 16384
}

 

	
PUT workflow.cgi?dojo.preventCache=1266358799763735177217894
http://ngsdev.ccs.miami.edu/cgi-bin/aqwa/trunk/0.4/workflow.cgi?dojo.preventCache=1266358799763735177217894
	
	
ParamsHeadersPostPutResponseCacheHTMLJSON
Response Headersview source
Date	Tue, 16 Feb 2010 22:49:54 GMT
Server	Apache/2.2.3 (CentOS)
Connection	close
Transfer-Encoding	chunked
Content-Type	text/plain; charset=UTF-8
Request Headersview source
Host	ngsdev.ccs.miami.edu
User-Agent	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7
Accept	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language	en-us,en;q=0.5
Accept-Encoding	gzip,deflate
Accept-Charset	ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive	300
Connection	keep-alive
Content-Type	text; charset=UTF-8
X-Requested-With	XMLHttpRequest
Referer	http://ngsdev.ccs.miami.edu/aqwa/trunk/0.4/index.html?syoung
Content-Length	184
Pragma	no-cache
Cache-Control	no-cache
Source
{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"checkFile","filepath":"/nethome/bioinfo/data/sequence/chromosomes/human-bfa"}

{
   "permissions" : 493,
   "type" : "directory",
   "exists" : "true",
   "filepath" : "/nethome/bioinfo/data/sequence/chromosomes/human-bfa",
   "modified" : "Mon Sep 28 12:19:45 2009",
   "size" : 16384
}


WHICH ULTIMATELY RESULTS IN THE INCORRECT OUTPUT TO THE PAGE:


ERRONEOUS CHECKFILE OUTPUT:
==========================

InfoPaneRow.handleCheckfile plugins.workflow.InfoPaneRow.handleCheckfile(node, fileInfo)
InfoPaneRow.handleCheckfile fileInfo: {"permissions":438,"type":"file","exists":"true","filepath":"/nethome/syoung/.aqwa/Project1/Workflow1/454HCDiffs-headers-SNP.txt","modified":"Tue Feb 16 04:11:37 2010","size":403427}
InfoPaneRow.handleCheckfile this.type: file
InfoPaneRow.handleCheckfile this.value: Project1/Workflow1/454HCDiffs-headers-SNP.txt
InfoPaneRow.handleCheckfile fileinfo.type: file
InfoPaneRow.handleCheckfile File exists. Changing CSS
InfoPaneRow.handleCheckfile this.type: file
InfoPaneRow.handleCheckfile fileinfo.type: file
InfoPaneRow.handleCheckfile Setting CSS to satisfied
InfoPaneRow.handleCheckfile stageParameterObject:{ "username": "syoung", "owner": "admin", "project": "Project1", "workflow": "Workflow1", "appname": "MAQ", "appnumber": "1", "name": "inputfile" }
InfoPaneRow.setFileExists plugins.workflow.InfoPaneRow.setFileExists(booleanValue)
InfoPaneRow.setFileExists booleanValue: true
InfoPaneRow.setFileExists typeof booleanValue: boolean
InfoPaneRow.setFileExists stageParameterObject: { "project": "Project1", "workflow": "Workflow1", "owner": "admin", "username": "syoung", "appname": "MAQ", "appnumber": "1", "name": "inputfile" }
InfoPaneRow.setFileExists success: true
InfoPane.checkValidInputs plugins.workflow.InfoPane.checkValidInputs()
InfoPane.checkValidInputs this.isValid: true
InfoPaneRow.checkFile JSON response for inputValue 'Project1/Workflow1/454AllDiffs-headers-SNP.2.txt': {"permissions":493,"type":"directory","exists":"true","filepath":"/nethome/bioinfo/data/sequence/chromosomes/human-bfa","modified":"Mon Sep 28 12:19:45 2009","size":16384}
InfoPaneRow.handleCheckfile plugins.workflow.InfoPaneRow.handleCheckfile(node, fileInfo)
InfoPaneRow.handleCheckfile fileInfo: {"permissions":493,"type":"directory","exists":"true","filepath":"/nethome/bioinfo/data/sequence/chromosomes/human-bfa","modified":"Mon Sep 28 12:19:45 2009","size":16384}
InfoPaneRow.handleCheckfile this.type: file
InfoPaneRow.handleCheckfile this.value: Project1/Workflow1/454AllDiffs-headers-SNP.2.txt
InfoPaneRow.handleCheckfile fileinfo.type: directory
InfoPaneRow.handleCheckfile File exists. Changing CSS
InfoPaneRow.handleCheckfile this.type: file
InfoPaneRow.handleCheckfile fileinfo.type: directory
InfoPaneRow.handleCheckfile Setting CSS to required
InfoPaneRow.handleCheckfile stageParameterObject:{ "username": "syoung", "owner": "admin", "project": "Project1", "workflow": "Workflow1", "appname": "MAQ", "appnumber": "1", "name": "matefile" }
InfoPaneRow.setFileExists plugins.workflow.InfoPaneRow.setFileExists(booleanValue)
InfoPaneRow.setFileExists booleanValue: true
InfoPaneRow.setFileExists typeof booleanValue: boolean
InfoPaneRow.setFileExists stageParameterObject: { "project": "Project1", "workflow": "Workflow1", "owner": "admin", "username": "syoung", "appname": "MAQ", "appnumber": "1", "name": "matefile" }
InfoPaneRow.setFileExists success: true
InfoPane.checkValidInputs plugins.workflow.InfoPane.checkValidInputs()
InfoPane.checkValidInputs this.isValid: true
InfoPaneRow.checkFile JSON response for inputValue 'Project1/Workflow1': {"permissions":493,"type":"directory","exists":"true","filepath":"/nethome/bioinfo/data/sequence/chromosomes/human-bfa","modified":"Mon Sep 28 12:19:45 2009","size":16384}
InfoPaneRow.handleCheckfile plugins.workflow.InfoPaneRow.handleCheckfile(node, fileInfo)
InfoPaneRow.handleCheckfile fileInfo: {"permissions":493,"type":"directory","exists":"true","filepath":"/nethome/bioinfo/data/sequence/chromosomes/human-bfa","modified":"Mon Sep 28 12:19:45 2009","size":16384}
InfoPaneRow.handleCheckfile this.type: directory
InfoPaneRow.handleCheckfile this.value: Project1/Workflow1
InfoPaneRow.handleCheckfile fileinfo.type: directory
InfoPaneRow.handleCheckfile File exists. Changing CSS
InfoPaneRow.handleCheckfile this.type: directory
InfoPaneRow.handleCheckfile fileinfo.type: directory
InfoPaneRow.handleCheckfile Setting CSS to satisfied
InfoPaneRow.handleCheckfile stageParameterObject:{ "username": "syoung", "owner": "admin", "project": "Project1", "workflow": "Workflow1", "appname": "MAQ", "appnumber": "1", "name": "outputdir" }
InfoPaneRow.setFileExists plugins.workflow.InfoPaneRow.setFileExists(booleanValue)
InfoPaneRow.setFileExists booleanValue: true
InfoPaneRow.setFileExists typeof booleanValue: boolean
InfoPaneRow.setFileExists stageParameterObject: { "project": "Project1", "workflow": "Workflow1", "owner": "admin", "username": "syoung", "appname": "MAQ", "appnumber": "1", "name": "outputdir" }
InfoPaneRow.setFileExists success: true
InfoPane.checkValidInputs plugins.workflow.InfoPane.checkValidInputs()
InfoPane.checkValidInputs this.isValid: true
InfoPaneRow.checkFile JSON response for inputValue '/nethome/bioinfo/data/sequence/chromosomes/human-bfa': {"permissions":493,"type":"directory","exists":"true","filepath":"/nethome/bioinfo/data/sequence/chromosomes/human-bfa","modified":"Mon Sep 28 12:19:45 2009","size":16384}
InfoPaneRow.handleCheckfile plugins.workflow.InfoPaneRow.handleCheckfile(node, fileInfo)
InfoPaneRow.handleCheckfile fileInfo: {"permissions":493,"type":"directory","exists":"true","filepath":"/nethome/bioinfo/data/sequence/chromosomes/human-bfa","modified":"Mon Sep 28 12:19:45 2009","size":16384}
InfoPaneRow.handleCheckfile this.type: directory
InfoPaneRow.handleCheckfile this.value: /nethome/bioinfo/data/sequence/chromosomes/human-bfa
InfoPaneRow.handleCheckfile fileinfo.type: directory
InfoPaneRow.handleCheckfile File exists. Changing CSS
InfoPaneRow.handleCheckfile this.type: directory
InfoPaneRow.handleCheckfile fileinfo.type: directory
InfoPaneRow.handleCheckfile Setting CSS to satisfied
InfoPaneRow.handleCheckfile stageParameterObject:{ "username": "syoung", "owner": "admin", "project": "Project1", "workflow": "Workflow1", "appname": "MAQ", "appnumber": "1", "name": "referencedir" }




THE HEADERS FOR THE FINAL REQUEST ARE AS FOLLOWS:

Response Headers

Date	Tue, 16 Feb 2010 22:49:54 GMT
Server	Apache/2.2.3 (CentOS)
Connection	close
Transfer-Encoding	chunked
Content-Type	text/plain; charset=UTF-8

Request Headers

Host	ngsdev.ccs.miami.edu
User-Agent	Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7
Accept	text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language	en-us,en;q=0.5
Accept-Encoding	gzip,deflate
Accept-Charset	ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive	300
Connection	keep-alive
Content-Type	text; charset=UTF-8
X-Requested-With	XMLHttpRequest
Referer	http://ngsdev.ccs.miami.edu/aqwa/trunk/0.4/index.html?syoung
Content-Length	184
Pragma	no-cache
Cache-Control	no-cache




</entry>

<entry [Tue Feb 16 03:54:12 EST 2010] PROBLEM WITH AQWA USER SETUID>


Hi all,

I'm having a problem with SETUID on this script on ngsdev:

/data/aqwa/0.4/cgi-bin/relay.pl

When I run it with the apache user, the script displays the expected `whoami` as the owner of the setuid script:


ll relay.pl
		-rwsr-sr-x 1 ntsinoremas mihg-data-q-solexa 3801 Oct 19 03:34 relay.pl

perl /data/aqwa/0.4/cgi-bin/relay.pl ntsinoremas "perl /data/aqwa/0.4/cgi-bin/transferUpload.pl \"username=ntsinoremas&sessionId=9999999999.9999.999&filename=454AllDiffs-headers-SNP.txt&path=Project1/Workflow1&tempfile=/var/www/agua/0.4/uploads/454AllDiffs-headers-SNP.txt4511167.77797328\""

		<SNIP>
		transferUpload    whoami: 
		ntsinoremas
		<SNIP>
		
		
This is the case for SETUID of other users, e.g., syoung.

But when I do SETUID of the 'aqwa' user, `whoami` unexpectedly prints 'apache':


ll relay.pl
-rwsr-sr-x 1 aqwa mihg-data-q-solexa 3801 Oct 19 03:34 relay.pl


perl /data/aqwa/0.4/cgi-bin/relay.pl admin "perl /data/aqwa/0.4/cgi-bin/transferUpload.pl \"username=admin&sessionId=9999999999.9999.999&filename=454AllDiffs-headers-SNP.txt&path=Project1/Workflow1&tempfile=/var/www/agua/0.4/uploads/454AllDiffs-headers-SNP.txt1331836.64948778\""


		<SNIP>
		transferUpload    whoami: 
		apache
		<SNIP>

I got the same 'apache' output when I ran it with SETUID of user 'zhu'.

Any ideas what could be causing this?

Cheers,

Stuart.





</entry>


