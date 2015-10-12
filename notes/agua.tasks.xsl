projects.agua.tasks


<entry [Mon 2014:04:21 13:20:27 EST] PRE-BETA.2 TASKS >


AUTOMATE POPULATION OF queue.masterip VALUE ON INSTALLATION


AUTOMATE ADDITION OF rabbitmq.config AND RESTART FOR INCREASED frame_max


AUTOMATE DEPLOYMENT OF agua AND rabbitjs DAEMONS


Agua::Common::Package

	#### LATER: MOVE INTO STANDALONE METHOD TO UPDATE PACKAGES WHEN CALLED FROM CLIENT 'Package Management' PANEL	
	
	##### GET VERSIONS FOR ALL PACKAGES
	#foreach my $package ( @$packages ) {
	#	$package->{current} = $self->getCurrentVersions($username, $package->{owner}, $package->{package}, $hubtype, $package->{privacy});
	#}
	#$self->logDebug("AFTER packages", $packages);
	
	
	
	
</entry>
<entry [Mon 2012:07:16 22:30:30 EST] TASK LIST>

### DONE ### install aguatest
	-	link www and cgi-dir

### DONE ###  Home packageObject contains privacy - OK

### DONE ### home/github/test.html

### DONE ### TEST STORE Settings ON REMOTE

### DONE ### CREATE ADMIN Aws PANEL

### DONE ### CREATE ADMIN Hub PANEL

### DONE ### ADD 'SYNC' BUTTON TO Workflows PANEL

### DONE ### IMPLEMENT 'SYNC' ON BACKEND

### DONE ### UPDATE BIOREPOSITORY *.pm FOR biorepository AND agua

### DONE ### UPDATE LOG DOCK NODE WITH FILES DOCK NODE

### DONE ### TEST EXECUTE WORKFLOW WITH CLUSTER

    ### DONE ### START CLUSTER
    ### DONE ### EXECUTE WORKFLOW
    
### DONE ### CLUSTER STATUS
    ('none','starting', 'running', 'terminating', 'terminated')

### DONE ### ERIDANUS-0.8.0 (FROM ERIDANUS-8: ami-c6a877af)

    ### DONE ### INSTALL MooseX::Declare

### DONE ### ADD AGUA IMAGE TO LOGIN

### DONE ### BUILD AGUA 027

### DONE ### FIX FILE MANAGER LOAD

### DONE ### TEST Init.pm ON NEW INSTANCE

### DONE ### TEST Installer.pm - Biorepository AND Bioapps

### DONE ### ORGANISE BIOREPOSITORY WITH LATEST VERSIONS

    ### DONE ### ORGANISE agua REPOSITORIES
    ### DONE ### ORGANISE bioapps REPOSITORIES
    ORGANISE aguatest REPOSITORIES

### DONE ### CREATE STARCLUSTER REPOSITORY, starcluster.pm

#### DONE ### CREATE Ops::Stage
SEE agua.blueprint
[Sat 2012:10:13 23:47:12 EST] Ops::Stage FOR SIMPLE STAGING

#### DONE #### CREATE Uml
SEE agua.blueprint

#### DONE ### PUBLISH agua:StarCluster

#### DONE ### UNCOMMENT
    #$command .= " --kill-master ";
    IN Agua::Common::Balancer::launchBalancer


#### DONE #### FIX loadStarCluster IN lib AND t/lib

#### DONE #### CHECK /agua/t FOR USAGE OF Ops::Version::setVersion

    IF NECCESSARY ADD 

	#### CHECKOUT BRANCH
	$self->checkoutTag($repodir, $branch);

	######## ADD LOCAL TAG
	####$self->addLocalTag($version, $description);
	

#### DONE #### RUN Cluster (FIX SGE CONFIG)

#### DONE #### FIX getStatus (WHILE CLUSTER STARTING, RUNNING)

#### DONE #### REPLACE /nethome WITH /home

#### DONE #### FIX MOUNT /data ON HEADNODE

#### DONE #### RESTORE html/plugins/view/jbrowse/users/aguatest/*

#### DONE #### aguatest:

    -   SET .gitattributes
        -   REMOVE t/Makefile
        -   REMOVE FAILING TESTS
        
    -   **** SKIP THIS - LET USER DO MANUALLY ****
        SET make IN aguatest.pm


#### DONE #### ENABLE GRAPHING WITH D3

#### DONE #### ENABLE SERVER PUSH WITH node.js

#### ONWORKING #### FIX Upload.pm
    #### DONE #### OSX LINE-ENDING FILE
    #### ONWORKING #### REQUEST PAYLOAD IS EMPTY
    
#### ONWORKING #### ENABLE SUPPORT FOR DOJO-1.9.0

    #### DONE #### APPS (COMBOBOX, emboss.pm APPS)
    #### DONE #### SHARING (COMBOBOX)
    #### DONE #### CLOUD (COMBOBOX)
    #### DONE #### HOME (COMBOBOX)
    #### DONE #### FOLDERS
    #### ONWORKING #### WORKFLOW (COMBOBOX, UPLOAD, EXCHANGE)
    #### ONWORKING #### VIEW (COMBOBOX, /data/jbrowse FILES, CONVERT JBROWSE TO AMD-STYLE, EXCHANGE)

#### ONWORKING #### ENABLE guest USER ON HEADNODE

#### ONWORKING #### TEST Bioapps WORKFLOWS
    #### DONE ####     FTP --> elandIndex
    #### ONWORKING #### FTP --> jbrowseFeatures

#### DONE #### CONVERT LIBS FROM Conf::Agua TO Conf::Yaml
    
#### DONE #### CONVERT /aguadev/cgi-bin/*.pl FROM Conf::Agua TO Conf::Yaml

#### ONWORKING #### LAUNCH

#### ONWORKING #### PUBLISH


LATER
-----

MIGRATE TESTS
    Remote:     AWS, Github
    Setup:      Installer
    
PHONEGAP agua

CHANGE username TO admin (FROM agua) IN DEPLOY bioapps

IMPLEMENT EXCHANGE IN runStatus AND Workflows

HOME --> PACKAGES TO APPS

FIX createTab IN Workflow, View, Sharing, Cloud AND Home

UPDATE JBROWSE

COMPLETE Agua::Uml TESTS

ADD d3.js OUTPUT FOR Agua::Uml


ADD 'IAM' APPLICATION TO /data
IAM                     /usr/share/iam/1.2.0/bin

CHECK Workflow::addCluster/newCluster FOR DURATION OF CALL FROM CLIENT
    

ORGANISE SNAPSHOTS AND CLEAN UP VOLUMES + INSTANCES


ADD DEPENDENCIES MECHANISM TO INSTALLER

FIX PROGRESS PANE SIZE:
dojoxFloatingPaneCanvas OR progressPane.canvas.style

FIX AUTOMATIC SCHEDULING INFO IN SGE
    scheduling info:            (Collecting of scheduler job information is turned off)

    
</entry>
<entry [Sat 2012:07:07 18:45:20 EST] CONFIGURE www.aguadev.org FOR HIGH LOAD>

http://rudd-o.com/linux-and-free-software/tuning-an-apache-server-in-5-minutes
    
</entry>
<entry [Fri 2012:07:06 15:02:42 EST] FINAL TASKS>

1. #### DONE #### FIX REPOACCESS TABLE

2. #### DONE #### REDO cgi-bin PERMISSIONS

3. #### DONE #### FIX STOP POLLING ON SINGLETON IN RunStatus.js

4. #### DONE #### DO FASTCGI admin.cgi

        NB: NOT upload, download, reset or init

        TEST FindBin::Real AND FIND REPLACEMENT IF NECCESSARY

5. #### DONE #### BUILD HTML (025)

        #### DONE #### FIXED UPLOAD, REDID BUILD HTML (026)
    
        FIXED UPLOAD openLocation
    
        CREATED AGUA BUILD 0.8.0-alpha.1+build11
        
6. AUTOMATE INSTALLATION OF FASTCGI ON MASTER

7. TEST CLUSTER START/STOP (SEPARATE FROM RUN AND PUT IN NEW RIGHTPANE)
        
        #### DONE #### ADD TO THE 'Cluster' PANEL IN WORKFLOW PANE:

            - STATUS 'NO CLUSTER/RUNNING/TERMINATED/STOPPED(LATER)'

            - START/STOP BUTTONS WITH CONFIRM (LATER: IMPLEMENT 'PAUSE')
            
            - SHOW FULL 'LISTCLUSTERS' OUTPUT (TO CHECK STARTUP)

            - SHOW TAIL OF BALANCER LOG (TO CHECK WORKFLOW RUN)
        
        CONFIRM CLUSTER STARTS AT START OF RUN
        
        CONFIRM CLUSTER STOPS AT END OF RUN
        

8. PUT LATEST VERSIONS OF aguatest.pm, ETC. IN agua:biorepository
    
9. PUBLISH JBROWSE WORKFLOW

10. PUBLISH agua:agua

11. JOBS & PAPER



    
</entry>
<entry [Mon Jan 31 21:53:33 EST 2011] FINISH REMAINING BLOCKERS>

1. FINISH STARCLUSTER IMPLEMENTATION

	#### DONE #### IMPLEMENT LOAD BALANCER - ONE QUEUE (all.q) FOR ALL PROJECTS
	
    #### DONE #### SET UP chown www-data:user FOR ALL DIRS INSIDE .agua
    
    #### DONE #### DEPRECATED user.pl (DEFAULT FREE ACCESS FOR www-data USER,
        CONTROL OF www-data ACCESS IS NOW SHIFTED TO Agua)

    #### DONE #### CONFIRMED www-data USER CAN READ DIR IN www FOLDER
        LINKED FROM WITHIN USER'S HOME DIR - SOLUTION FOR VIEW FILES!

	#### DONE #### REDESIGN SECURITY TO FIX PERL SETUID ISSUES
		init.cgi  ---> CURRENTLY IS PERL CGI
		admin.cgi ---> REPLACED WITH agua.c VERSION OF admin.cgi --> admin.pl
		#### NEED TO RETAIN root SETUID ON CERTAIN *.pl FILES
            admin.pl (agua)
            workflow.pl (workflow.cgi)
			- ADD/REMOVE USERS IN OPERATING SYSTEM
			- CREATE .agua DIRECTORIES
			- ADD/REMOVE NFS MOUNTS
			- ADD/REMOVE VOLUME MOUNTS
            - UPDATE repo APPS, INSTALL APPLICATIONS SYSTEM-WIDE


		#### REMOVED ROOT SUID FOR THESE SCRIPTS:
            project.cgi
            report.cgi
            upload.cgi
            view.cgi
		#### DON'T NEED IT TO
			- ADD/REMOVE FILES INSIDE .agua DIRECTORIES (OWNED BY www-data)
			- UPDATE DATABASE (USES Agua MYSQL AUTHENTICATION)
			- RUN WORKFLOWS (RUN AS www-data)
    
    #### DONE #### 	UNCOMMENT AWS.pm AND CHECK init

2. COMPLETE ADMIN TAB
	
	Access PANEL
	#### DONE #### IMPLEMENT FRONT AND BACKEND WITH SIMPLIFIED MODEL

	Users PANEL 
	#### DONE #### COMPLETE Users.js, ADD 'adduser' ON BACKEND OF Users.js
			NB: REQUIRED INSTALLATION OF nslcd DAEMON FOR NSS AND PAM LOOKUPS USING LDAP
				IN ORDER TO MODIFY PASSWORDS AS ROOT

    #### DONE #### REPOPULATED users WITH DATA FROM aguausers (FROM NOW ON USE ONLY users)
        MYSQL STRING FUNCTIONS LIKE 'concat':	
        http://dev.mysql.com/doc/refman/5.0/en/string-functions.html
        update users set homedir = concat('/nethome/', username);

	#### DONE #### FIX ADMIN TAB ERROR WHEN LOADING MIDDLE PANEL PLUGIN

	Projects PANEL
	#### DONE #### ProjectRow.js PROBLEM WITH SAVING PROJECT NOTES

	Parameters PANEL
	#### DONE #### ENABLE ORDER OF PARAMETERS 

	Apps PANEL	
	#### DONE ####  REPLACED 'Cluster INPUT WITH 'Version'	
	#### DONE ####  REPLACED 'Submit' CHECKBOX WITH 'Local Only'
	
	#### DONE ####  FIXED dojo.dnd.Avatar ERROR ON DRAG OVER TARGET:
		'source.getItem(this.manager.nodes[i].id) is undefined'


	Parameters PANEL
	#### DONE ####  ADDED 'Locked' PARAMETER ICON
		IF LOCKED, PARAMETER CANNOT BE CHANGED BY USER	

		NB: USE ENVIRONMENT VARIABLES (USERNAME, PROJECT, WORKFLOW)
        FOR GENERATING JBROWSE FEATURES, RUNNING CLUSTER JOBS, ETC.

    #### DONE #### UNLOCK Locked PARAMETERS

	
	Clusters PANEL
    
	#### DONE ####  ADDED Clusters PANEL FOR MANAGING STARCLUSTERS    
    ADD 'availzone' SCROLL BAR AND INCLUDE IN PUT JSON
    

    Settings PANEL
    
    REMOVE 'volumesize' AND MIGRATE TO Volumes PANEL (FOR LATER VERSION)
    
    ADD WARNING WHEN SAVING AWS
        - CHANGED KEYS WILL RENDER CURRENTLY RUNNING CLUSTERS UNREACHABLE


3. COMPLETE WORKFLOW TAB

	#### DONE #### FIXED 'MyApps' AND 'SharedApps'

	#### DONE #### TEST HISTORY
	
	#### DONE #### FIX 'RUN WORKFLOW' BUTTON
		LOWER CASE 'onchange' COMBINED WITH dojo.hitch FIXES MULTIPLE FIRE PROBLEM
		dojo.connect(thisObject.workflowCombo, "onchange", dojo.hitch(this, function(event)		   { thisObject.setDropTarget(projectName, workflowName); ...
	
	#### DONE #### FIX SHARED WORKFLOW ONCLICK loadParameters

	#### DONE #### COMPLETE copyWorkflow IN SharedProjects PANE
	
	#### DONE #### COMPLETE copyWorkflow AND copyProject IN Common.pm

	#### DONE #### COMPLETE copyProject IN SharedProjects PANE

	#### DONE #### ADD 'Cluster' COMBO BOX WITH MIN/MAX INPUTS
		(DEFAULT CLUSTER IS smallcluster WITH MIN 0, MAX 5 NODES)

	#### DONE #### COMPLETE copyWorkflow IN Stages PANE
	
	#### DONE #### ENABLE IO.js
	
	#### DONE #### FIX FILE SELECTOR

    #### DONE #### IMPLEMENT core CLASSES HOLDER IN ALL WORKFLOW MODULES
	
	#### DONE #### UPDATE Workflow.pm TO INCORPORATE LOGGING, CHECKING, ETC. ROLES
		(COPIED FROM OR AKIN TO X:Workflow)

	#### DONE #### FIX RUNSTATUS POLL

	#### DONE #### COMPLETE copyProject IN Stages PANE
	
	#### DONE #### TEST WORKFLOW NUMBER INTEGRITY AFTER WORKFLOW COMBOBOX ADD/DELETE

	#### DONE #### IMPLEMENT WorkflowCluster METHODS IN Stages.js
    
    #### DONE #### DISPLAY ClusterStatus IN Parameter.js

    POPULATE WORKFLOWS 
	
		BOWTIE
		ELAND
		TOPHAT
		CASAVA
		NOVOALIGN
		MAQ
        

4. COMPLETE VIEW TAB

	#### DONE #### REDO View.js INTERFACE
	
	#### DONE #### INCORPORATE JBROWSE 1.2.6
	
	#### DONE #### FEATURE FILE DIRS ARE STORED IN:
	
        FILEROOT/USERNAME/agua/PROJECT/WORKFLOW/jbrowse/*featurename* DIR
	
		-	FOR EASE OF VIEWING, NO FEATURE NAME DUPLICATION WITH A PROJECT
	
		-	EACH FEATURE TRACK HAS title ATTR. SHOWING PROJECT, WORKFLOW, ETC.
			
				PROVENANCE INFORMATION OF FEATURE
	
		-	USER INPUTS label, species AND build

		-	jbrowseFeature.pl UNIQUE FEATURE NAME BY ADDING DIGIT TO DUPLICATES
	
	#### DONE #### IMPLEMENT FEATURE LINKS

    #### DONE #### FIX 'object not defined' ERROR

    #### DONE #### FIX COMBOBOX POPUP PROBLEM
    
    #### DONE #### FIX 'NaN .. NaN' DISFUNCTION AFTER BROWSER LOAD
    
    #### DONE #### CHECK add/remove views
    
    #### DONE #### ADD colored labels for 'dynamic' features
    
    #### DONE #### FIX dojoDndItem PADDING IN TRACK LABEL LIST
        
    #### DONE #### FIX trackList (DATA VS COOKIE -- REMOVED COOKIE)

    #### DONE #### FIX trackList REORDERING WHEN DND MOVE INSIDE DISPLAYED WINDOW

    DEPRECATE workflow.css ???
    VIEW DRAGSOURCE -
        border-radius: 0px;
        

    
5. COMPLETE PROJECT TAB

	#### DONE #### VERIFIED EXISTING FUNCTIONS OF MENUS

	#### DONE #### FIXED FileInfoPane
	
	#### DONE #### FIXED FILE COPY HANGS


6. #### DONE #### FIX ec2-api-tools 

    -   RE-INSTALL WITH install.pl (USES apt-get)


7. #### DONE #### RUN ./install ON CLEAN UBUNTU IMAGE

    - ADDITIONAL PERL MODULES ADDED TO resource/agua/permods.txt


8. #### DONE #### ENABLE AUTOMATIC GENERATION OF CA CERTIFICATE

    -   #### DONE #### ADDED PUBLIC CERTIFICATE GENERATION TO ./install.pl

    -   #### DONE #### ADDED PUBLIC CERTIFICATE GENERATION TO createCert.pl STARTUP SCRIPT
            
        -   QUIT IF FLAG FILE IS PRESENT
        
        -   FAIL IF CAN'T CREATE FLAG FILE

            -   FLAG FILE IS INSIDE conf DIRECTORY (WRITABLE ONLY BY ROOT)

        -   OTHERWISE, GENERATE CA CERTIFICATE 
    
    -   #### DONE #### USER CREATES OWN CA CERTIFICATE USING init.cgi SCRIPT

            SEE: Tue Dec 28 13:27:02 EST 2010
            PROGRAMATICALLY GENERATE PUBLIC CERTIFICATE (FOR SSL/HTTPS)



9. CONSOLIDATE /data AND EXPAND


#### DONE -	ON AQUARIUS, MOVE /nethome SEQUENCE DATA TO /data AND EXPAND /data

#### DONE - MOVE /nethome SEQUENCE DATA TO /data

#### DONE - RESIZE TO 100GB	

#### DONE - REDO BOWTIE chr8 (*** DID NOT UNTAR COMPLETELY ***)

#### DONE - REDO BOWTIE chr9 (*** DID NOT UNTAR COMPLETELY ***)



10. #### DONE #### REMOVE KEYPAIRS FROM /data (AND SNAPSHOT)
    
    -   #### DONE #### REMOVE KEYPAIRS FROM /data/base/apps/ec2/keypair

        -r-------- 1 root root 1.7K Oct 11 01:51 agua.pem
        -rw-r--r-- 1 root root  916 Oct 11 01:51 cert-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem
        -rw-r--r-- 1 root root  926 Oct 11 01:51 pk-GT4UWQFPXSBXKIENE4OFU5GVDNGJUGJS.pem



11. PREPARE AGUA FOR DEPLOYMENT ON AQUARIUS-8g 

    -   #### DONE #### REMOVE KEYPAIRS FROM init.html  
    
    -   #### DONE #### REMOVE KEYPAIRS FROM conf/admin
    
    -   #### DONE #### CREATE DEFAULT DATABASE WITH SKELETON admin USER PROFILE (PASS: adminagua)

    -   #### DONE #### BUILD ALL PLUGIN-REQUIRED DOJO MODULES AS 'agua_dojo_dijit'

    -   #### DONE #### BUILD ALL PLUGINS AS 'agua_all'

    -   ENABLE 'SYNC' DATA TO GITHUB
        
        -   #### DONE #### USER APPS TO admin/private/apps

        -   USER WORKFLOWS TO admin/private/workflows
            (AND TEST Agua::Common::Package::syncWorkflows)

        -   USER VOLUMES TO admin/private/volumes

        -   USER SOURCES TO admin/private/sources

        -   AGUA TO admin/private/agua


12. REVERSE DEBUGGING SETTINGS

    -   CHANGE default.conf:

        ADMINKEY                syoung,test

    -   UNCOMMENT Admin::getHeadings ADMIN-ONLY HEADINGS 

    -   REMOVE AUTO-LOGIN IN plugins.login.Login
    

12. CHANGE ALL KEYS

        -   X.509 KEYS
        
        -   AWSACCESSKEY
        
        -   SECRETACCESSKEY

        -   SSH KEYS


12. UPLOAD AGUA TO GITHUB agua REPO

    -   TAG WITH VERSION: 0.8.0-alpha
    
    -   ADD VERSION TO HTML TEMPLATE OF agua.html
    
    


13. WRITE DOCUMENTATION

    DO ACCOUNT SETUP FOR stuartpyoung@gmail.com AND SAVE IMAGES FOR HELP
    
    WRITE HELP
    
    WRITE USER MANUAL
    
    WRITE DEVELOPERS API

    WRITE DEVELOPERS PAGE

        ec2 intro
        http://icloudius.blogspot.com/
        
        code (starcluster)
        http://boto.cloudhackers.com/ref/ec2.html


14. CONFIGURE CONFLUENCE MAILING LIST

    #### DONE  - ON NABBLE


15. #### DONE #### OPEN WEBSITE URL www.aguadev.org/confluence



16. GET FREE CONFLUENCE/REFINEDWIKI LICENSE FOR www.aguadev.org



  
</entry>

