agua.archive.7

<entry [Sun 2011:12:25 05:03:23 EST] FIX CREATE USER chown: invalid user: `test:www-data'>

chown: invalid user: `test:www-data'
{"status":"Created user test","subroutine":"Agua::Common::User::addUser","linenumber":"194","filename":"/agua/0.6/cgi-bin/lib/Agua/Common/User.pm","timestamp":"2011-12-25 05:02:19"}
    
</entry>
<entry [Sun 2011:12:11 15:07:52 EST] TESTS FOR addViewFeature/removeViewFeature>

echo '{"project":"Project1","view":"View1","feature":"control1","species":"human","build":"hg19","username":"admin","sessionId":"9999999999.9999.999","mode":"removeViewFeature"}' | /var/www/cgi-bin/agua/0.6/view.cgi


insert into viewfeature values ('admin', 'Project1', 'View1', 'control1', 'human', 'hg19', '/nethome/syoung/agua/Project1/



REFRESH

echo '{"feature":"control1","sourceproject":"Project1","sourceworkflow":"Workflow0","species":"human","build":"hg19","project":"Project1","view":"View1","username":"admin","sessionId":"9999999999.9999.999","mode":"refreshView"}' | /var/www/cgi-bin/agua/0.6/view.cgi

    
</entry>
<entry [Thu 2011:12:08 01:37:26 EST] USED object-can TO TRAP UNSUPPORTED METHOD API CALL>

PROBLEM:
Can't locate object method "addViewFeatureStatus" via package "Agua::View" at /var/www/cgi-bin/agua/0.6/view.cgi line 107.

SOLUTION:

USE object->can(methodName) TO FILTER FOR NON-
API METHODS

    
</entry>
<entry [Sat 2011:12:03 23:01:13 EST] LATER: USE dojox.widget.Loader FOR XHR LOADING PROGRESS>

SHOWS LOADING GIFF ON MOUSE TIP

http://localhost/agua/0.6/dojo-1.6.1rc2/dojox/widget/tests/test_Loader.html

    
</entry>
<entry [Sat 2011:12:03 22:51:57 EST] USER MUST MANUALLY OPEN PORT 443 TO ACCESS https>

In order to do this, you must enable HTTPS access:
    
    a) If you have the ec2-api tools installed, do this:
    
        ec2-authorize default -p 443 -P tcp
        
    or, b) Use the AWS console:

        1. Log in to AWS: http://aws.amazon.com
        2. Click 'EC2' tab
        3. In the left Navigation Bar, click 'Security Groups'
        4. Click on 'default' (or your own, custom security group)
        The security group's details will appear in the bottom pane.
        In the bottom pane, select the 'Inbound' tab and create a
		new 'Custom TCP Rule':

            Port range: 443
            Source:     0.0.0.0/0
            
    
</entry>
<entry [Sat 2011:12:03 20:57:11 EST] SAVED WIKI INFO BEFORE DELETING GITHUB agua REPO>
    
Thank you for visiting the Github site of Agua, the NextGen bioinformatics workflow tool and genomic viewer. You'll find source code and development information here. To download the source code, click the 'Downloads' button on the right or download using git with the 'Git Read-Only' URL below. For information on how to install or use Agua, please click the following link: — Read more
http://www.stuartpyoung.com/confluence/agua
Edit
    
</entry>
<entry [Mon 2011:11:28 00:27:37 EST] FIXED PROJECT PANE UPLOADER ERROR: "Component returned failure code: 0x80460001">

PROBLEM:

GET THIS ERROR WHEN UPLOADING DATA WITH FIREFOX

"Component returned failure code: 0x80460001"


SOLUTION:

DOWNLOAD LATEST VERSION FROM NIGHTLY



DIAGNOSIS:

http://mail.dojotoolkit.org/pipermail/dojo-checkins/2011-April/085347.html


#12674: Programmatic Uploader error
----------------------------+-----------------------------------------------
 Reporter:  mwilcox         |       Owner:  mwilcox
     Type:  defect          |      Status:  new    
 Priority:  high            |   Milestone:  1.7    
Component:  DojoX Uploader  |     Version:  1.6.0  
 Severity:  major           |    Keywords:         
----------------------------+-----------------------------------------------
 In Firefox, when Uploader is created programmatically, on upload triggers
 an error: Component returned failure code: 0x80460001
 (NS_ERROR_CANNOT_CONVERT_DATA)


 (In [24334]) Fixes #12674 - When building programmatically and uploading
 on select, Firefox 4 throws a security error. In this case, I'm reverting
 to using the request body instead of teh newer FormData. I'm not exactly
 sure why this is happening; simple tests could not recreate the problem.
 Hence it's not yet reported to Mozilla.
 
    
</entry>
<entry [Sun 2011:11:27 13:38:15 EST] DISABLED GREEN LINE AROUND FOCUSED TABS>

COMMENTED OUT IN core/css/agua.css LINE 48:

.dijitFocused .tabLabel {
	outline							: none !important;
	/*padding							:	3px !important;*/
	/*border							:	solid 2px #0F0 !important;*/


AND core/css/controls.css LINE 384:


.controls .tabs  .dijitFocused .tabLabel {
	height: 15px;
	padding: 3px;
	/*border: solid 2px #0F0;*/


AND admin/css/admin.css LINE 171:


.admin .dijitFocused .tabLabel {
	padding: 3px;
	/*border: solid 2px #0F0;*/



NB: LEFT GREEN LINE FOR MENU ITEMS IN files/css/filemenu.css

    
</entry>
<entry [Sun 2011:11:27 00:34:49 EST] FIXED TAB SLIDER CSS PROBLEM (MULTIPLE ROWS OF TABS) IN Admin PANE>

HID TAB STRIPS BY ADDING TO admin.css AT LINE 189:

.admin .dijitTabContainer .tabStripButton {
    display: none;
    visibility: hidden;
    z-index: 12;
}


OR, FROM Controls.js:

		// FIX ERROR: TABSLIDER TAKES TWO LINES
		var tabSlider = dijit.byId('dijit_layout_TabContainer_0_tablist_menuBtn');
		console.log("Controls.startup    tabSlider: " + tabSlider);
		console.log("Controls.startup    tabSlider.domNode: " + tabSlider.domNode);
		tabSlider.domNode.setAttribute('style', 'display: none');

    
</entry>
<entry [Sat 2011:11:26 23:37:29 EST] FIXED 'word not defined' ERROR AFTER LOAD Home AND Login>

ADDED LINE TO dijit.layout._LayoutWidget:

LINE 200:

(function(){
	var capitalize = function(word){
==>		if ( word == null )	return '';
		return word.substring(0,1).toUpperCase() + word.substring(1);
	};

    
</entry>
<entry [Fri 2011:11:25 10:02:33 EST] TEST OF HEADINGS>

echo '{"username":"admin","sessionId":"9999999999.9999.999","mode":"getTable","table":"headings"}' | ./workflow.cgi | grep -v "Content-type: text/html" | sed 's/[\s]*[\{][\}][&]*[\s\n]*//' 

{"headings":{"leftPane":["Apps","GroupProjects","Access","Clusters","Parameters"],"middlePane":["Groups","Parameters","Settings","Projects"],"rightPane":["Sources","GroupSources","GroupUsers","Users"]}}

    
</entry>
<entry [Fri 2011:11:25 00:19:47 EST] TEST OF PROJECT PANE>
    

./project.cgi "mode=fileSystem&username=undefined&sessionId=undefined&query=%22BOWTIE%22"

http://localhost/cgi-bin/agua/0.6/project.cgi?mode=fileSystem&username=undefined&sessionId=undefined&query=%22BOWTIE%22&dojo.preventCache=1322198151513




    
</entry>
<entry [Thu 2011:11:24 12:17:45 EST] CREATED SKELETON agua.dump DATABASE FILE>


access.sql	        access
ami.sql	            ami
app.sql	            app
appversion.sql	    appversion
aws.sql	            aws
cluster.sql	        cluster
clusterstatus.sql	clusterstatus
clustervars.sql	    clustervars
clusterworkflow.sql	clusterworkflow
diffs.sql	        diffs
feature.sql	        feature
fileinfo.sql	    fileinfo        #### not populated
groupmember.sql	    groupmember
groups.sql	        groups
parameter.sql	    parameter
project.sql	        project
report.sql	        report          #### not populated
repo.sql	        repo
sessions.sql	    sessions
source.sql	        source
stageparameter.sql	stage
stage.sql	        stageparameter
users.sql	        users
viewfeature.sql	    view
view.sql	        viewfeature
volumes.sql	        volumes
workflow.sql	    workflow


NOTES
-----


CURRENTLY POPULATED TABLES:

mysql> show tables;
+-----------------+
| Tables_in_agua  |
+-----------------+
| access          |
| ami             |
| app             |
| appversion      |
| aws             |
| cluster         |
| clusterstatus   |
| clustervars     |
| clusterworkflow |
| diffs           |
| feature         |
| groupmember     |
| groups          |
| parameter       |
| project         |
| repo            |
| sessions        |
| source          |
| stage           |
| stageparameter  |
| users           |
| view            |
| viewfeature     |
| volumes         |
| workflow        |
+-----------------+


PRESENT SQL FILES:


access.sql
ami.sql
app.sql
appversion.sql
aws.sql
cluster.sql
clusterstatus.sql
clustervars.sql
clusterworkflow.sql
diffs.sql
dump
feature.sql
fileinfo.sql
flow.sql
groupmember.sql
groups.sql
monitor.sql
parameter.sql
project.sql
report.sql
repo.sql
repoversion.sql
sessions.sql
source.sql
stageparameter.sql
stage.sql
users.sql
viewfeature.sql
view.sql
volumes.sql
workflow.sql


PASTE TOGETHER:

paste listsql.tsv showsql.tsv > tables.tsv

THEN USE CALC TO JIGGLE THE ROWS


</entry>
<entry [Thu 2011:11:24 00:31:38 EST] COMPLETED 200GB /data SNAPSHOT: REDID BOWTIE CHR7 AND CHR9 >

REMOUNTED /data

mount -t ext3 /dev/sdl /data


REDID BOWTIE chr8 AND chr9 (*** DID NOT UNTAR COMPLETELY ***)

cd /data/sequence/reference/human/hg19/fasta
/data/apps/bowtie/0.12.7/bowtie-build chr8.fa chr8



NOTES
-----


SEE agua.xls
[Sun 2011:10:30 03:09:14 EST]
snap-6341b301: 200GB INCLUDING REFERENCE SEQUENCES, JBROWSE DATA AND APPS

BLOCKDEVICE	/dev/sdl	vol-5bffe631	2011-11-24T05:13:39.000Z

CREATED NEW SNAPSHOT:

ec2addsnap  \
--verbose \
-d "200GB BIOINFORMATICS DATA VOLUME: REFERENCE SEQUENCES AND JBROWSE DATA" \
vol-5bffe631


    SNAPSHOT        snap-6341b301   vol-5bffe631    pending 2011-10-29T06:36:52+0000                728213020069    200     200GB BIOINFORMATICS DATA VOLUME: REFERENCE SEQUENCES AND JBROWSE DATA
    REQUEST ID      98d64942-8ffe-488e-9413-c919ce4927e3




    
</entry>
<entry [Fri 2011:11:18 18:32:25 EST] EC2 AUTOMATIC LOAD BALANCING API INSTALLED>

API REFERENCE
http://docs.amazonwebservices.com/ElasticLoadBalancing/latest/APIReference/

GENERAL
http://aws.amazon.com/elasticloadbalancing/

DOWNLOAD
http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip

INSTALLED
/data/apps/ec2/loadbal/1.0.14.3
    
TESTED
./elb-describe-lbs
    No LoadBalancers found


</entry>
<entry [Thu 2011:11:17 13:40:33 EST] REPLACED installMysql IN Installer.pm WITH SIMPLE apt-get>

SUBSTITUTED THIS:

    sub installMysql {
    my $self		=	shift;

    print "Agua::Installer::installMysql    Agua::Installer::installMysql()\n";
	$self->installPackage("mysql-server");
	$self->installPackage("mysql-client");
	$self->installPackage("libmysqlclient16-dev libmysqlclient-dev");
    
    ##### START MYSQL AUTOMATICALLY AT BOOT
    $self->installPackage("chkconfig");
    $self->runCommands(["chkconfig --level 345 mysql on"]);
    
    #### RESTART MYSQL
    $self->runCommands(["/etc/init.d/mysql restart"]);
}


FOR THIS:

    sub installMysql {
    my $self		=	shift;

    print "Agua::Installer::installMysql    Agua::Installer::installMysql()\n";

    #### INSTALL MYSQL
    my $mysql = "/etc/init.d/mysql";
    #if ( not -f $mysql )
    #{
    	print "Agua::Installer::installMysql    mysql not found: $mysql. Installing.\n";
    
    	$self->runCommands([
    		"rm -fr /var/lib/dpkg/lock",
    		"dpkg --configure -a",
    		"rm -fr /var/cache/apt/archives/lock",
    		"sleep 3",
    		
    		"export DEBIAN_FRONTEND=noninteractive; sudo apt-get -y remove mysql-server libmysqlclient-dev mysql-server-5.1 mysql-cluster-server-5.1 libmysqlclient16-dev mysql-cluster-server libaprutil1-dev apache2-prefork-dev",
    		"sleep 3",
    		"rm -fr /var/lib/dpkg/lock",
    		"dpkg --configure -a",
    		"rm -fr /var/cache/apt/archives/lock",
    		"sleep 3",
    		
    		"export DEBIAN_FRONTEND=noninteractive; sudo apt-get -y remove libmysqlclient-dev mysql-cluster-client mysql-cluster-client-5.1 mysql-cluster-server-5.1  mysql-common",
    		
    		"sleep 3",
    		"rm -fr /var/lib/dpkg/lock",
    		"dpkg --configure -a",
    		"rm -fr /var/cache/apt/archives/lock",
    		"sleep 3",
    		
    		"export DEBIAN_FRONTEND=noninteractive; sudo apt-get -y remove mysql-server libmysqlclient-dev mysql-server-5.1 mysql-cluster-server-5.1 libmysqlclient16-dev mysql-cluster-server libaprutil1-dev apache2-prefork-dev",
    
    		#"sleep 10",
    		#"rm -fr /var/lib/dpkg/lock",
    		#"dpkg --configure -a",
    		#"rm -fr /var/cache/apt/archives/lock",
    		#"sleep 10",
    		#
    		#"export DEBIAN_FRONTEND=noninteractive; sudo apt-get -y install libmysqlclient16-dev libmysqlclient-dev mysql-server mysql-server-5.1"
    
    	]);
    #}

    #### INSTALL PREREQUISITES FOR DBD::mysql PERL MODULE
    $self->runCommands([
    	"rm -fr /var/lib/dpkg/lock",
    	"dpkg --configure -a",
    	"rm -fr /var/cache/apt/archives/lock",
    	"sleep 5",
    	"export DEBIAN_FRONTEND=noninteractive; sudo apt-get -y install libmysqlclient16-dev libmysqlclient-dev mysql-server mysql-server-5.1"
    ]);
    
    ##### START MYSQL AUTOMATICALLY AT BOOT
    #$self->installPackage("chkconfig");
    #$self->runCommands(["chkconfig --level 345 mysql on"]);
    
    #### RESTART MYSQL
    $self->runCommands(["/etc/init.d/mysql restart"]);
}

    
</entry>
<entry [Sun 2011:11:13 04:44:10 EST] IMPLEMENTED AGUA APPS SEPARATION AND UPDATE>
    
</entry>
<entry [Thu 2011:11:17 03:12:46 EST] ARCHIVED 0.7-00283-430134>
    
sudo /agua/0.6/bin/scripts/archive.pl \
--name agua \
--basedir /agua/aguadev \
--version 0.7 \
--versionfile /agua/aguadev/VERSION \
--outputdir /home/syoung/RELEASE

archive.pl    build: 430134c

    git archive --format=tar --prefix=0.7-00283-430134c/ HEAD | gzip > /home/syoung/RELEASE/0.7/agua.0.7-00283-430134c.tar.gz
Completed /agua/0.6/bin/scripts/archive.pl

</entry>
<entry [Sun 2011:11:13 04:43:23 EST] COMPLETED FLOATING PANE FOR UPGRADE PROGRESS>

RESIZABLE

CENTERS IN VIEWPORT

MINIMIZE TO DOCK

    
</entry>
<entry [Sun 2011:11:13 04:22:44 EST] DOCKABLE 'SHOPPING CART' - TEST FLOATING PANE>

http://localhost/agua/0.6/dojo-1.6.1rc2/dojox/layout/tests/test_FloatingPane.html


    
</entry>
<entry [Sat 2011:11:12 10:20:43 EST] UPGRADED TO AGUA 0.7 ON TOSHIBA>

cd /agua/0.6/repos/biorepository/syoung/agua
sudo /agua/0.6/bin/apps/logic/ops.pl agua install


WHICH RUNS:

/agua/0.7/bin/scripts/install.pl \
--installdir /agua \
--logfile /var/www/html/agua/0.6/upgradelog.html 

    OK


</entry>
<entry [Sat 2011:11:12 10:15:20 EST] ARCHIVED AGUA 0.7>    

AND PUSHED TO ALREADY-CREATED 0.7 TAG ON GITHUB TO INCORPORATE LATEST Installer.pm SO I CAN RUN UPGRADE WITH IT:


/agua/0.6/bin/scripts/archive.pl \
--name agua \
--basedir /agua/0.6 \
--version 0.7 \
--versionfile bin/scripts/resources/VERSION \
--outputdir /home/syoung/RELEASE


UPLOADED TO GITHUB:

mkdir /home/syoung/RELEASE/0.7
cd /home/syoung/RELEASE/0.7
git clone git@github.com:syoung/agua
rm -fr bin cgi-bin conf html lib
cp -pr /home/syoung/RELEASE/0.7/0.7-00276-24b3b36/* /home/syoung/RELEASE/0.7
git push



UPLOADED TO LINODE:

mkdir /home/syoung/RELEASE/0.7
cd /home/syoung/RELEASE/0.7
git clone git@github.com:syoung/agua
rm -fr bin cgi-bin conf html lib
cp -pr /home/syoung/RELEASE/0.7/0.7-00276-24b3b36/* /home/syoung/RELEASE/0.7
git push




</entry>
<entry [Thu 2011:11:10 02:24:49 EST] IGNORED CROSS-DOMAIN JAVA ERROR: throw 'allowScriptTagRemoting is false>


**** IGNORED AS DID NOT AFFECT THE PAGE LOAD ****

ERROR:

WHEN USING dojox.io.WindowName TO GET CROSS-DOMAIN w
ww.google.com, I GET THE FOLLOWING ERROR IN FIREBUG:

LOCATION:
    http://localhost/confluence/plugins/servlet/builder/dwr/interface/PageTreeDWR.js

RESPONSE:
    throw 'allowScriptTagRemoting is false.';
    //#DWR-INSERT
    //#DWR-REPLY
    var s0={};var s1={};var s2={};s0.administerPermission=false;s0.createPermission=false;s0.editPermission=false;s0.hasChildren=true;s0.id="294914";s0.parent="PTA";s0.title="Home";s0.tooltip="Modified by \'admin\' on 2009-11-22 18:23:57.0";s0.type="homepage";s0.url="/confluence/display/PTA/Home";
    s1.administerPermission=false;s1.createPermission=false;s1.editPermission=false;s1.hasChildren=false;s1.id="294917";s1.parent="PTA";s1.title="SearchNavigation";s1.tooltip="Modified by \'admin\' on 2009-10-12 22:47:13.0";s1.type="page";s1.url="/confluence/display/PTA/SearchNavigation";
    s2.administerPermission=false;s2.createPermission=false;s2.editPermission=false;s2.hasChildren=false;s2.id="294922";s2.parent="PTA";s2.title="TreeNavigation";s2.tooltip="Modified by \'admin\' on 2011-08-19 08:04:08.0";s2.type="page";s2.url="/confluence/display/PTA/TreeNavigation";
    dwr.engine._remoteHandleCallback('0','0',[s0,s1,s2]);

AND THIS IN A SUBSEQUENT CALL:

LOCATION:


HEADER:

callCount=1 page=/confluence/display/PTA/Home?windowname=true httpSessionId=5C53AE902BA6F0116D009D1D915877B8 scriptSessionId=182037007A33EC72A4001B3D5B09150410 c0-scriptName=PageTreeDWR c0-methodName=getChildren c0-id=0 c0-param0=string:294914 c0-param1=boolean:false c0-param2=string:natural c0-param3=boolean:false batchId=1 

RESPONSE:

throw 'allowScriptTagRemoting is false.';
//#DWR-INSERT
//#DWR-REPLY
var s0={};var s1={};var s2={};var s3={};var s4={};var s5={};s0.administerPermission=false;s0.createPermission=false;s0.editPermission=false;s0.hasChildren=true;s0.id="294921";s0.parent="294914";s0.title="About the PTA";s0.tooltip="Modified by \'admin\' on 2009-10-13 01:27:17.0";s0.type="page";s0.url="/confluence/display/PTA/About+the+PTA";
s1.administerPermission=false;s1.createPermission=false;s1.editPermission=false;s1.hasChildren=false;s1.id="294916";s1.parent="294914";s1.title="Events";s1.tooltip="Modified by \'admin\' on 2009-10-13 01:11:19.0";s1.type="page";s1.url="/confluence/display/PTA/Events";
s2.administerPermission=false;s2.createPermission=false;s2.editPermission=false;s2.hasChildren=false;s2.id="294923";s2.parent="294914";s2.title="Forms";s2.tooltip="Modified by \'admin\' on 2009-10-12 03:26:52.0";s2.type="page";s2.url="/confluence/display/PTA/Forms";
s3.administerPermission=false;s3.createPermission=false;s3.editPermission=false;s3.hasChildren=false;s3.id="294920";s3.parent="294914";s3.title="Lighthouse";s3.tooltip="Modified by \'admin\' on 2009-10-12 23:48:02.0";s3.type="page";s3.url="/confluence/display/PTA/Lighthouse";
s4.administerPermission=false;s4.createPermission=false;s4.editPermission=false;s4.hasChildren=false;s4.id="294919";s4.parent="294914";s4.title="News";s4.tooltip="Modified by \'admin\' on 2009-10-12 03:27:53.0";s4.type="page";s4.url="/confluence/display/PTA/News";
s5.administerPermission=false;s5.createPermission=false;s5.editPermission=false;s5.hasChildren=false;s5.id="294915";s5.parent="294914";s5.title="Volunteers";s5.tooltip="Modified by \'admin\' on 2009-10-12 03:27:11.0";s5.type="page";s5.url="/confluence/display/PTA/Volunteers";
dwr.engine._remoteHandleCallback('1','0',[s0,s1,s2,s3,s4,s5]);




DIAGNOSIS:

http://localhost/confluence/plugins/servlet/builder/dwr/interface/PageTreeDWR.js


LOOKED FOR 'DWR' IN CONFLUENCE INSTALLATION:

 
cd /usr/share/confluence-3.0.2-std
grep -R DWR * | grep -v temp/spool
 
    confluence/includes/js/uberlabels.js:        // (Jeremy Higgs: Instead of using AJAX.Request, let's be consistent and use DWR)
    confluence/includes/js/page-editor.js:            // Ignore DWR errors because they almost always occur when users
    confluence/includes/js/page-editor.js:        DWREngine.setErrorHandler(errorHandler);
    confluence/includes/js/page-editor.js:        DWREngine.setWarningHandler(errorHandler);
    confluence/includes/js/page-permissions.js:            DWREngine.beginBatch();
    confluence/includes/js/page-permissions.js:            DWREngine.endBatch({
    confluence/includes/js/page-permissions.js:// it has been done this way because we don't have the luxury at the moment of hooking into when all asynchronous DWR requests have completed
    confluence/includes/js/page-permissions.js:// until then we will have to respond to errors as they occur, instead of aggregating them and then processing them after all DWR requests are complete
    Binary file confluence/WEB-INF/lib/dwr-2.0.3.jar matches
    Binary file confluence/WEB-INF/lib/pdfbox-0.7.2.jar matches
    Binary file confluence/WEB-INF/lib/xalan-2.7.0.jar matches
    Binary file confluence/WEB-INF/lib/tm-extractors-0.4.jar matches
    Binary file confluence/WEB-INF/lib/confluence-3.0.2.jar matches
    Binary file confluence/WEB-INF/lib/dom4j-1.4-full.jar matches
    confluence/WEB-INF/classes/log4j.properties:# DWR logs 404's at WARN level which is too high and can spam the logs
    Binary file confluence/WEB-INF/classes/com/atlassian/confluence/setup/atlassian-bundled-plugins.zip matches
    confluence/WEB-INF/dwr.xml:              <param name="beanName" value="confluenceWysiwygConverterDWRWrapper"/>



ADDED THE LAST PARAM TO web.xml ON CONFLUENCE SERVER:

/usr/share/confluence-3.0.2-std/conf/web.xml

<!--
<servlet>
  <servlet-name>dwr-invoker</servlet-name >
  <servlet-class> org.directwebremoting.servlet.DwrServlet</servlet-class> 
  <init-param>
    < param-name>scriptCompressed</param-name >
    <param-value> false</param-value>
  </ init-param>
  <init-param >
    <param-name> debug</param-name>
    < param-value>true</param-value >
  </init-param>
  <init-param>
    <param-name >crossDomainSessionSecurity</param-name >
    <param-value>false</ param-value>
  </init-param >
  <init-param >
    <param-name>activeReverseAjaxEnabled </param-name>
    <param-value >true</param-value >
  </init-param>
  <init-param>
    < param-name>allowScriptTagRemoting</param-name >
    <param-value>true </param-value>
  </ init-param>
  <load-on-startup >1</load-on-startup>
</servlet>
 
-->
NB: THIS IS A DWR (DIRECT WEB REMOTING) ERROR

http://directwebremoting.org/dwr/index.html

DWR is a Java library that enables Java on the server and JavaScript in a browser to interact and call each other as simply as possible.

DWR will generate the JavaScript to allow web browsers to securely call into Java code almost as if it was running locally. It can marshal virtually any data including collections, POJOs, XML and binary data like images and PDF files. All that is required is a security policy that defines what is allowed.

With Reverse Ajax, DWR allows Java code running on a server to use client side APIs to publish updates to arbitrary groups of browsers. This allows interaction 2 ways - browser calling server and server calling browser. DWR supports Comet, Polling and Piggyback (sending data in with normal requests) as ways to publish to browsers.



    
</entry>
<entry [Thu 2011:11:03 21:19:33 EST] ADD PROJECT START/STOP BUTTONS AND WORKFLOW RUNNING CCS>

select completed - started as duration from stage where username ='syoung' and project='Project1' and completed != '0000-00-00 00:00:00' and started != '0000-00-00 00:00:00';

    
</entry>
<entry [Wed 2011:11:02 11:41:00 EST] dojox.gfx AND dnd - MOVEABLE GRAPHICS>

BOXGRAPH
https://github.com/psvensson/boxgraph

BOXGRAPH EXAMPLE
http://localhost/agua/0.6/tests/boxgraph/test_editgraph.html


BLACK BACKGROUND SVG
http://localhost/agua/0.6/dojo-1.6.1/dojox/gfx/tests/test_vectortext_load.html

ROUNDED RECTANGLE
http://localhost/agua/0.6/dojo-1.6.1/dojox/gfx/tests/test.roundrect.html


COOL TOOLTIP POPUP
http://localhost/agua/0.6/dojo-1.6.1/dojox/gfx/demos/tooltip.html#


MOVEABLE CIRCLES WITH LINES
http://localhost/agua/0.6/dojo-1.6.1/dojox/gfx/demos/circles2.html


GFX AND DND
https://docs.google.com/Doc?id=d764479_9hgdng4g8
move.js

This file implements dojox.gfx.Mover and dojox.gfx.Moveable similar to dojo.dndMover and dojo.dnd.Moveable specifically targeting moving shapes.
You can find examples in dojox/gfx/demos/circles.html, and dojox/gfx/demos/inspector.html.
utils.js

This file implements serialization helpers:
serialize(shape) - takes a shape or a surface and returns a DOM object, which describes underlying shapes.
deserialize(parent, object) - takes a surface or a shape and populates it with an object produced by serialize().
toJson(shape, prettyPrint) - just like serialize() but returns a JSON string. If prettyPrint is true, the string is pretty-printed to make it more human-readable.
fromJson(parent, json) - just like deserialize() but takes a JSON representation of the object.
serialize() returns following objects:
for a surface it returns an array of shapes.
for a group it returns an object with a member variable children, which contains an array of shapes.
for a shape it returns an object with a member variable shape, which contains a shape definition object.
both a shape and a group may contain following member variables:
transform contains a transformation matrix.
stroke contains a stroke definition object.
fill contains a fill definition object.
font contains a font definition for text-based objects.
Serialization helpers can be used to implement a persistent storage of vector-based images, generation of them on the server, conversion of dojox.gfx-based pictures in other formats (e.g., to PDF), and conversion of other formats (e.g., raw SVG) to dojox.gfx. You can find examples in dojox/gfx/demos/creator.html and dojox/gfx/demos/inspector.html. Many serialized examples can be found in dojox/gfx/demos/data/*.json.

    
</entry>
<entry [Mon 2011:10:31 03:16:53 EST] WORKFLOW PROJECT PANEL: SIMPLE AND CONDITIONAL FORK>

EXAMPLE OF EXPERIMENTAL CONDITIONAL FORK:
http://www.myexperiment.org/workflows/51.html


PROJECT PANEL OF WORKFLOW PANE IS BASED ON GRIDCONTAINER:
http://localhost/agua/0.6/dojo-1.6.1/dojox/layout/tests/test_GridContainer_TitlePanes.html
http://localhost/agua/0.6/dojo-1.6.1/dijit/tests/test_TitlePane.html


BASIC FUNCTIONALITY:

    - TITLEPANES CAN BE REORDERED BY DND
    

LATER FUNCTIONALITY: 

    - FORK CAN BE DRAGGED FROM SIDE MENU TO INSERT A NEW GRID CONTAINER
    
        CONTANING TWO COLUMNS
    
    - DRAG WORKFLOW TITLEPANES FROM OTHER PROJECTS INTO PROJECT
    
    
</entry>
<entry [Mon 2011:10:31 02:51:22 EST] INSTALLED VM::EC2 FOR SPOT INSTANCE PRICE TRACKING>

http://search.cpan.org/~lds/VM-EC2-1.09/lib/VM/EC2.pm
    
</entry>
<entry [Fri 2011:10:28 14:58:52 EST] TRANSFERRED REFERENCE SEQUENCE DATA FROM OLD HUNG INSTANCE>
    
TRANSFER FROM THIS INSTANCE:

    RESERVATION	r-e171f88e	728213020069	default
    INSTANCE	i-3ba8c35a	ami-76837d1f			stopped	aquarius2	0		t1.micro	2011-09-27T20:51:23+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs					paravirtual	
    BLOCKDEVICE	/dev/sdi	vol-d8fa05b2	2011-09-28T05:14:02.000Z	
    BLOCKDEVICE	/dev/sdh	vol-622bd108	2011-09-28T05:14:02.000Z	
    BLOCKDEVICE	/dev/sda1	vol-dafa05b0	2011-09-28T05:14:02.000Z	
    TAG	instance	i-3ba8c35a	name	aquarius-8g-LARGE
    TAG	instance	i-3ba8c35a	description	aquarius-8f2 using aquarius2 WITH LARGE INSTANCE to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)    


... TO /mnt/data ON THIS INSTANCE (CURRENT HEADNODE):

RESERVATION	r-cb22aca4	728213020069	default
INSTANCE	i-b34d25d2	ami-76837d1f	ec2-107-20-126-253.compute-1.amazonaws.com	ip-10-122-126-90.ec2.internal	running	aquarius2	0		t1.micro	2011-10-27T12:57:47+0000us-east-1a	aki-0b4aa462			monitoring-disabled	107.20.126.253	10.122.126.90			ebs					paravirtual	
BLOCKDEVICE	/dev/sdi	vol-161ce07c	2011-10-27T12:58:24.000Z	
BLOCKDEVICE	/dev/sdh	vol-141ce07e	2011-10-27T12:58:24.000Z	
BLOCKDEVICE	/dev/sda1	vol-101ce07a	2011-10-27T12:58:24.000Z	
TAG	instance	i-b34d25d2	name	aquarius-8g
TAG	instance	i-b34d25d2	description	aquarius-8f2 using aquarius2 to run cluster versions of pipelines (MAQ, BOWTIE, NOVOALIGN)


DETACH ORIGINAL (GOOD) /data VOLUME ON HEADNODE:


ec2detvol vol-141ce07e
ec2attvol vol-141ce07e -i i-b34d25d2 -d /dev/sdh
mount /dev/sdh /data



DETACH VOLUME AND ATTACH TO RUNNING INSTANCE (I.E., THE HEADNODE):

ec2detvol vol-622bd108
ec2dvol vol-622bd108
ec2attvol vol-622bd108 -i i-b34d25d2 -d /dev/sdj
ec2dvol vol-622bd108

ON HEADNODE:

mkdir /mnt/data1
mount /dev/sdj /mnt/data1


... AND TRANSFER FROM THIS INSTANCE TO /mnt/data2:

RESERVATION	r-266cab48	728213020069	default
INSTANCE	i-b8e489d8	ami-76837d1f			stopped	aquarius2	0		t1.micro	2011-09-27T14:34:25+0000	us-east-1a	aki-0b4aa462			monitoring-disabled					ebs					paravirtual	
BLOCKDEVICE	/dev/sda1	vol-59155833	2011-09-27T23:05:25.000Z	
BLOCKDEVICE	/dev/sdi	vol-5d155837	2011-09-27T23:05:25.000Z	
BLOCKDEVICE	/dev/sdh	vol-53155839	2011-09-27T23:05:25.000Z	


DETACH AND TRANSFER:

ec2detvol vol-53155839
ec2dvol vol-53155839
ec2attvol vol-53155839 -i i-b34d25d2 -d /dev/sdk
ec2dvol vol-53155839

ON HEADNODE:

mkdir /mnt/data2
mount /dev/sdk /mnt/data2



CREATE NEW 200GB VOLUME AND ATTACH TO /mnt/data3:

ec2-create-volume \
--size 200 \
--availability-zone us-east-1a

    VOLUME	vol-5bffe631	200		us-east-1a	creating	2011-10-28T20:24:49+0000


ec2attvol vol-5bffe631 -i i-b34d25d2 -d /dev/sdl
ec2dvol vol-5bffe631

FORMAT IT:

mkfs.ext3 /dev/sdl

mkdir /mnt/data3
mount /dev/sdl /mnt/data3


TRANSFERRED FROM 100GB VOLUME TO NEW 200GB VOLUME:

/data/sequences

TRANSFERRED FROM 40GB VOLUME TO NEW 200GB VOLUME:
mv /mnt/data3/starcluster /mnt/data3/starcluster.ok
root@ip-10-122-126-90:/mnt/data3# cp -pr /data/starcluster .
root@ip-10-122-126-90:/mnt/data3# cp -pr /data/mysql mysql.recent
root@ip-10-122-126-90:/mnt/data3# cp -pr /data/apps apps.recent




LATER: DELETED UNNECESSARY FOLDERS IN 200GB VOLUME:

rm -fr /mnt/data3/0.6
rm -fr /mnt/data3/agua
rm -fr /mnt/data3/base


DETACHED OLD /data VOLUME FROM HEADNODE AND MOVED 200GB VOLUME TO /data



MADE SNAPSHOT OF NEW 200GB VOLUME

ec2addsnap  \
--verbose \
-d "200GB BIOINFORMATICS DATA VOLUME: REFERENCE SEQUENCES AND JBROWSE DATA" \
vol-5bffe631


    SNAPSHOT        snap-6341b301   vol-5bffe631    pending 2011-10-29T06:36:52+0000                728213020069    200     200GB BIOINFORMATICS DATA VOLUME: REFERENCE SEQUENCES AND JBROWSE DATA
    REQUEST ID      98d64942-8ffe-488e-9413-c919ce4927e3



</entry>
<entry [Thu 2011:10:27 02:34:46 EST] TESTED executeWorkflow>
    
echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":"1","stop":"1","username":"syoung","sessionId":"9999999999.9999.999","mode":"executeWorkflow","cluster":"syoung-microcluster"}'  | /var/www/cgi-bin/agua/0.6/workflow.cgi


</entry>
