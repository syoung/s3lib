agua.todo




<entry [Mon 2015:05:25 12:56:05 EST] ALL TO DO>

API
---

Data warehouse
    - Login Info    *** DONE ***
    - SQL TOOL      *** ONWORKING ***
    - API           *** ONWORKING ***


CLINICAL
--------

dnaseq packaging
    -   dependencies
    -   workflows

bcl2fastq
    - automation
    - run on VMWare VM

In-house sequencing set
    - NA12878 family
    - Technical replicates (CGI vs Illumina)
    - Demographic info for staff genomes
    
Terraform
    - VPC
    - clinical AWS account - Greg

Primer
    - primer3
    - blast|bowtie


Room access in SSB      *** DONE ***

fastqc                  *** DONE ***
    - add to clinical pipeline

MOOC registration fee   *** DONE ***



REDCOAT
-------
    - proposal


GENOMIC FESTIVAL
----------------
- recorder
- press credentials
- hotel - Fred
- flight: Fred/Warren


SURE GENOMICS
-------------

VPC
Singer
 - API test with first 10 sequences
S3 upload
web stack - bootstrap & testing
web content


VPN
---
ITMI VPN            *** DONE ***
    - command line
Inova VPN
    - Mac UI        *** DONE ***


ISB
---

Requirements
    - Prachi
    - Dale          *** DONE ***
    - Wendy         *** DONE ***

Agua
----
    - 1.0


HOUSING
-------

Parent -- send Agent contacts
Neighbourhood   *** ONWORKING ***
Craigslist      *** ONWORKING ***
Agents
    - Pia                   *** ONWORKING ***
    - Barbara               *** ONWORKING ***
    - School Tour introduced Agent 
    - Keith met at Inova    
    - Kristine Jefferson    *** ONWORKING ***
    - Christine Fuchs       *** ONWORKING ***
    - Dan Voriga            *** ONWORKING ***

Zillow
    - rent *** ONWORKING ***

TJ
--
APPLICATION PROCESS  *** DONE ***
    

ADMIN
-----

ITMI PRINTER        *** DONE ***


AgroTera
--------

Business plan
    - LeanStack share with Wendy
    - Add Wendy's friend

GreenGene
---------

DNA assay
RASL-Seq methodology
RASL-Seq vendors
PhytaLab contact
Lab space (DC, SD)
Human/cann orthologues, pathways
Human receptors


GrowTV
------

Growers - Paul H
AV studio tour - John
Video - Final Cut
Audio - ProTools 


    
</entry>
<entry [Sun 2013:11:24 10:17:30 EST] HELP US IMPROVE>

https://answers.atlassian.com/questions/227288/hiding-people-from-quicksearch-results
	
</entry>
<entry [Tue 2013:11:12 14:59:52 EST] REMOVE LARGE FILES>


cd /mnt/repos/public/agua/aguadev
find . -type f -size +10000k

./.git/objects/eb/14596ee32ed949594b863118d915e0523e99bf
./.git/objects/8b/bbd0654b2a39dcebf5ab27a648c89bec5a3b97
./.git/objects/f7/f21c149f73056a2134453c60f094a4eef5e721
./.git/objects/25/7a71bbb9bd22bd44f4ca1e87bbedc5b38e0671
./.git/objects/c9/26a0a8387d96ee9b72ec19558e496bc0a806b2
./.git/objects/87/e64eb4845d071a423cc8223969936ff2fdacd6
./t/unit/bin/Agua/Common/File/inputs/binary/chr22.1.ebwt
./t/unit/bin/Agua/Common/File/inputs/chr22.1.ebwt
./t/unit/html/plugins/graph/getData.json
./t/unit/html/plugins/infusion/lists/getData.json
./t/unit/html/plugins/infusion/filter/getData.json
./t/unit/html/plugins/infusion/data/getData.json
./t/unit/html/plugins/infusion/infusion/getData.json
./t/unit/html/plugins/infusion/dialog/lane/getData-no-status.json
./t/unit/html/plugins/infusion/dialog/lane/getData.json
./t/unit/html/plugins/infusion/dialog/sample/getData-no-status.json
./t/unit/html/plugins/infusion/dialog/sample/getData.json
./t/unit/html/plugins/infusion/dialog/flowcell/getData-no-status.json
./t/unit/html/plugins/infusion/dialog/flowcell/getData.json
./t/unit/html/plugins/infusion/dialog/project/getData.json
./t/unit/html/plugins/infusion/dialog/manifest/getData.json
./t/unit/html/plugins/infusion/details/lane/getData.json
./t/unit/html/plugins/infusion/details/lane/getData3.json
./t/unit/html/plugins/infusion/details/details/getData.json
./t/unit/html/plugins/infusion/details/sample/getData.json
./t/unit/html/plugins/infusion/details/sample/getData.json.old1
./t/unit/html/plugins/infusion/details/sample/getData3.json
./t/unit/html/plugins/infusion/details/flowcell/getData.json
./t/unit/html/plugins/infusion/details/flowcell/getData3.json
./t/unit/html/plugins/infusion/details/project/getData.json
./t/unit/html/plugins/infusion/details/project/getData.15M.json
./t/unit/html/plugins/infusion/datastore/getData.json
./t/unit/html/plugins/form/status/getData-no-status.json
./t/unit/html/plugins/form/status/getData.json
./t/unit/html/plugins/floorplan/getData.json

    
</entry>
<entry [Wed 2011:04:13 23:59:17 EST] TO DO>


ADDED FUNCTIONALITY:

    WORKFLOW PANE
    
        CHANGE checkStageFiles TO sync: false

    ADMIN PANE

        -   'DEJA VU' PANEL:
        
            -   SCROLL THROUGH PREVIOUS WORKFLOWS OR APPS BY DATE/TIME OF COMMIT

            -   RESTORE A WORKFLOW OR APP 
            
                    WRITES OVER CURRENT WORKFLOW OF THE SAME NAME AND PROJECT UNLESS RENAMED
    
                    WRITES OVER CURRENT APP OF THE SAME NAME, TYPE AND PACKAGE UNLESS RENAMED


    ALL MODULES - USE BUSYBUTTON MENU
        http://localhost/agua/0.6/dojo-1.6.1rc2/dojox/form/tests/test_BusyButton.html

    PROJECT MANAGEMENT PANE
        
        - NESTED WORKFLOWS

        - GITHUB INTEGRATION

    
    ADMIN PANE

        - Instances PANEL - *** ADD THIS TO GITOLITE-BACKED AGUA ***

            /nethome AND /data VOLUMES: ID, NAME, AGUA INSTANCE ID, DESCRIPTION, DATE 
            
            DATA VOLUME IDS AND ANNOTATION (NAME, DESCRIPTION, ETC.)

        - Sync PANEL
        
            - USER WORKFLOWS, APPS AND SOURCES.
            
            - AGUA DATA:
            
                -   DATABASE DUMP
            
                -   default.conf
    
        - Volumes PANEL - CREATE, ANNOTATE, RESIZE AND SHARE EBS VOLUMES AS SNAPSHOTS

            - DYNAMICALLY RESIZE VOLUMES IN VOLUMES PANEL
    
                SEE ec2.xsl [Sat 2011:10:29 00:52:15 EST] RESIZE INSTANCE FROM IMAGE
    
        - Snapshots PANEL - CONTROL ACCESS TO SNAPSHOTS: PRIVATE, PUBLIC, BY-AMAZON-USERID
        

    LOGIN
    
        -   submitLogin
        
			#### CREATE A RANDOM SESSION ID TO BE STORED IN dojo.cookie
			#### AND PASSED WITH EVERY REQUEST
			$session_id = time() . "." . $$ . "." . int(rand(999));

			# 1) create a cookie/file with that name
			# 2) keep data associated with the session in the cookie/sessionId file


    AUTOHIDE CONTROL BAR


    VIEW PANE
    
        #### DONE #### ENABLE TOOLTIP INFO AND/OR CUSTOMISED window.open AT FeatureTrack.js LINE 144

        INSTALL NFOX JBROWSE VERSION WITH DRAG WINDOWS - LINK TO FUNCTIONS


    DEBUGGING
    
        ADD 'PRINTLOG' KEY TO default.conf AND IMPLEMENT IN ALL *.cgi APPLICATIONS
        
        

0. AGUA GUI IMPROVEMENTS

    #### DONE #### ADD standby WHILE LOADING WORKFLOW PANE

	MERGE FileManager AND Projects WIDGETS AND MENU FUNCTIONS

    FIX DELETE MULTIPLE DRAGGED USERS IN Users.js PANE

    ADD SHARED PROJECT History
    

1. GUIDE TO OBJECT NOMENCLATURE, E.G.: THE CLUSTER NAMESPACE

    SEE: agua.archive.2.xsl [Sun 2011:04:17 02:13:20 EST] THE CLUSTER NAMESPACE

    
2. NAME VOLUMES AND ADD METADATA USING EC2 TAGS


3. #### DONE #### config.pl TO AUTOMATE INSTALLATION ON UBUNTU

    1. CREATE agua USER
    
        I'd like to create a user and a group both called subversion on a RHEL 5 system. I looked at the man page for useradd and I guess the command would be just be...
        
        useradd subversion
        However, not sure how to avoid creating a home dir. Also, I don't want it to be a user that can log in to the system.
        
        The main purpose is just to provide an owner for a SVN repository.

        You can use the -M switch (make sure it's a capital) to ensure no home directory will be created:
        
        useradd -M subversion
        then lock the account to prevent logging in:
        
        usermod -L subversion

        To add a new user with
    
            a primary group of users
            a second group mgmt
            starting shell /bin/bash
            password of xxxx
            home directory of roger
            create home directory
            a login name of roger
    
            useradd -s/bin/bash -pxxxx -d/home/agua -m agua


    2. CREATE admin USER

		CREATE GROUP
		groupadd admin
		
		CREATE USER 
		useradd -g admin -s /bin/bash -p open4admin -d /home/admin -m admin

		ADD PASSWORD
		usermod -p openup aaauser


	3. ADD INITIALISATION OF agua AND admin USERS
	
		CREATE /home/admin DIRECTORy
        
        CREATE /home/admin/.agua
        
        SET UMASK 0002 FOR ALL EXISTING USERS (SO APACHE USER CAN ACCESS ALL FILES)


    4. SET .agua DIR PERMISSIONS
    
        CHOWN username:apache FOR .agua DIRECTORY IN ALL HOME FOLDERS

            LIST ALL USERS: cat /etc/passwd | cut -d ":" -f1    


    5. CONFIGURE www-data USER (APACHE USER)
    
        1. SET DEFAULT umask 002 FOR APACHE USER ON UBUNTU
                            http://stackoverflow.com/questions/2289225/how-to-override-default-permissions-for-files-stored-by-apache-php-in-tmp

            - ADD TO /etc/apache2/envvars
            (the apache2ctl script starts apache, and calls on /etc/apache2/envvars for
            custom environment variables.)
        
            umask 007
            
            - RESTART APACHE

        2. ENABLE COMMAND HISTORY, ETC. FOR www-data USER ON COMMAND LINE
        
            - CHANGE /etc/passwd SHELL FROM sh TO bash
            
                ####www-data:x:33:33:www-data:/var/www:/bin/sh
                www-data:x:33:33:www-data:/var/www:/bin/bash

            - COPY .bashrc AND .bash_profile TO /var/www (HOME DIR OF www-data)


    6. INSTALL PERL MODULES

		UNZIP Moose, ETC. MODULES IN lib/externals
		
		INSTALL DBI, DBD, ETC.


	7. ENABLE ROOT USER TO CHANGE USER PASSWORDS

********ON WORKING ************


	8. CREATE agua MYSQL USER AND GRANT CREATE DATABASE PRIVILEGES
	
	CREATE DATABASES:
	
	agua
	report
	view
	
	CREATE DATABASE agua;
	CREATE DATABASE report;
	CREATE DATABASE view;
	GRANT ALL ON agua TO agua@localhost;
	GRANT ALL ON report TO agua@localhost;
	GRANT ALL ON view TO agua@localhost;
	FLUSH PRIVILEGES;



4. COSMETIC '?' LINKS IN PANES

5. ADD COMMITTER NAME AND EMAIL TO Agua::Ops::GitHub::commitToRepo

2012-01-26 09:17:25	[DEBUG]   	Agua::Ops::GitHub::commitToRepo	318	result: [master bae9d32] Pushed by syoung, Thu Jan 26 09:17:25 CST 2012

 Committer: root < root@syoung-Satellite-L355.(none)>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author




</entry>

<entry [Thu 2011:07:14 01:54:15 EST] STANDBY CODE>


<!--
	<div id ="standby10" target="overlayTarget10" dojoType="dojox.widget.Standby"></div>


	 SET STANDBY
	this.standby = new dojox.widget.Standby(
		{
			target: this.controls
			,
			onClick: "reload",
			id : "standby"
		}
	);
	console.log("Agua.startup    this.standby: " + this.standby);
	console.log("Agua.startup    this.standby.target: " + this.standby.target);
	
	console.log("Agua.startup    this.standby._displayed: " + this.standby._displayed);
	console.log("Agua.startup    this.standby.show()");
	this.standby.show();
	console.log("Agua.startup    this.standby._displayed: " + this.standby._displayed);
	console.log("Agua.startup    this.standby.domNode.innerHTML: " + this.standby.domNode.innerHTML);
	console.log("Agua.startup    this.standby: ");
	console.dir(this.standby);
	

-->    

</entry>
