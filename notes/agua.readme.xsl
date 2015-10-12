agua.readme



<entry [Sun 2015:08:30 10:07:32 EST] perlbook>

https://github.com/chromatic/modern_perl_book
    
</entry>
<entry [Wed 2015:06:03 13:34:11 EST] VISUAL DESIGN MORE THAN FUNCTIONALITY AFFECTS >
    
http://ux.stackexchange.com/questions/79565/does-visual-design-really-affect-ux

http://www.ise.bgu.ac.il/faculty/noam/research/aesthetics.html


</entry>
<entry [Wed 2015:04:15 01:31:21 EST] NICE SUMMARY PAGE ON dexy.it>

http://www.dexy.it/docs/

Basics
What is Dexy?
A short, minimally technical introduction to Dexy, how it works, and what it can do.

Getting Help
If you have questions, suggestions, complaints or need any help with dexy, please email info@dexy.it. You can also say hello on twitter.

Installing Dexy
The short version for people familiar with Python packaging is pip install dexy, but here's install docs with a lot more detail.

Learning Dexy
The Getting Started tutorial takes you through basic dexy usage in small steps.

User Guide
Dexy's User Guide contains detailed information about dexy usage. (About 60% complete.)

Developer Guide
Dexy's Developer Guide contains developer documentation for extending dexy with plugins or working on dexy's internals. (About 20% complete.)


    
</entry>
<entry [Tue 2015:04:14 17:11:31 EST] mountain API ON apiary.io>

https://app.apiary.io/mountain/editor
    
</entry>
<entry [Tue 2015:04:14 16:58:51 EST] VERSION EYE INTEGRATED WITH GITHUB>

SIMILARLY INTEGRATE AGUA WITH GITHUB

GITHUB

https://github.com/login/oauth/authorize?client_id=50fb47103b8a3f03b2cd&scope=user:email

BITBUCKET
https://bitbucket.org/api/1.0/oauth/authenticate?oauth_callback=https%3A%2F%2Fwww.versioneye.com%2Fauth%2Fbitbucket%2Fcallback&oauth_token=xGtMbkBXSApswBsju4


    
</entry>
<entry [Tue 2015:04:14 16:50:22 EST] SLOGAN: DESIGNED FOR HUMANS>

Designed for Humans
Understood by Machines
Run it Anywhere


    
</entry>
<entry [Tue 2014:10:07 22:32:35 EST] WORKFLOW SYNC>
    
Agua uses git to synchronise each user's apps and workflows with GitHub, a popular hub for open-source software projects. In order to so do, the user must have entered their GitHub login name and token (access key) using the Admin Pane (to be released shortly).

    
</entry>
<entry [Fri 2014:06:27 18:23:35 EST] POSTER WITH SCANNABLE IMAGE FOR DOWNLOAD>

http://www.cidr.jhmi.edu/about/AGBT_LowDNAinput_Poster_FINAL.pdf

	
</entry>
<entry [Sun 2014:04:06 11:50:15 EST] POST-INTRO QUIZ FOR docker>
	
https://www.docker.io/learn/dockerfile/level1/

</entry>
<entry [Sun 2013:12:08 14:21:58 EST] DOGFOODING PLUGINS>

http://docs.vagrantup.com/v2/plugins/index.html

PLUGINS
Vagrant comes with many great features out of the box to get your environments up and running. Sometimes, however, you want to change the way Vagrant does something or add additional functionality to Vagrant. This can be done via Vagrant plugins.

Plugins are powerful, first-class citizens that extend Vagrant using a well-documented, stable API that can withstand major version upgrades.

In fact, most of the core of Vagrant is implemented using plugins. Since Vagrant dogfoods its own plugin API, you can be confident that the interface is stable and well supported.

Use the navigation on the left below the "Plugins" section to learn more about how to use and build your own plugins.
	
</entry>
<entry [Wed 2013:11:20 11:40:02 EST] FOCUS ON VERSIONING>

http://arstechnica.com/information-technology/2012/06/cloud-9-browser-based-development-environment-gets-tricked-out/

The Cloud 9 Web-based development platform has launched a major update. The new version brings several noteworthy new features like collaborative code editing and offline support. The service has also been enhanced with broader support for running code on the Cloud 9 servers.

Cloud 9 aims to give developers a complete browser-based integrated development environment (IDE). The tool includes project management and version control functionality as well as a sophisticated interactive code editor. It’s literally a hosted IDE that loads in a browser tab.

It is designed to integrate tightly with source code repository sites GitHub and BitBucket, making it easy for developers to clone, edit, and push code without ever having to download it to their local filesystem. The concept is ambitious, but delivering an implementation that is fully competitive with native development tooling on the desktop is obviously a major challenge.

For some kinds of projects, Cloud 9 is surprisingly close to achieving feature parity with conventional development environments. It is already well-suited for Node.js programming, an area that was a major focus for the company. The latest improvements will help to make it more viable for additional languages and development frameworks.

The editing experience is largely what you would expect to get in a programming text editor, offering features like syntax highlighting and optional support for Vim key bindings. But Cloud 9 aspires to be more than just an editor. The goal is to allow users to run their code on the server itself so that they can conduct testing during development without having to deploy to a separate test environment.

Cloud 9 is capable of executing Node.js applications on the server side, with full support for breakpoint-based debugging in the Cloud 9 editor. The new version of Cloud 9 has been extended to support running PHP and Ruby code in addition to Node.js projects.

We discussed the new functionality with Ruben Daniels, one of the cofounders of Cloud 9. In order to support server-side code execution, he explained, the Cloud 9 backend was rebuilt so that users would have their own isolated virtualized environment on the server. The new version of Cloud 9 also has a built-in terminal interface that allows users to get full shell access to the remote VM.

In addition to improved support for code execution, Cloud 9 has also gained a number of other new features. The latest version supports real-time collaborative editing in the browser–allowing multiple developers to edit the same file at the same time. The experience is a bit like collaborative editing in tools like Google Docs or SubEthaEdit.

Another major new feature is support for offline editing, which allows the user to continue working without an Internet connection. Unlike most of the functionality in Cloud 9, this particular feature requires users to install and run a special client application on their computer that can handle synchronization between the local filesystem and the cloud–existing offline storage mechanisms in browsers aren't quite up to the task yet.

The Cloud 9 editor also got a boost in this update, with the introduction of support for code completion. This feature is currently only available for JavaScript, but Ruben said that support for other programming languages will be introduced in the future.

Code completion for dynamic programming languages is often difficult, but Cloud 9 appears to handle it about as well as you could expect. It can analyze the user’s code and provide completion help for custom objects and methods. The completion system currently only knows about files that the user has open, but Ruben said that they will eventually improve it so that it knows about all of the classes and methods in your project.

I spent some time working with Node.js development in Cloud 9 to see how it felt for day-to-day development. It’s almost easy to forget that it’s running entirely in a Web browser. As a longtime Vim user, I was pleased to find that the optional Vim bindings worked well.

The one limitation that detracted from its comfort as a development environment was the lack of support for splitting the window into multiple panes. At the present time, Cloud 9 only lets you see one file at a time. That was a bit frustrating for me when working on a widescreen monitor. Ruben told me that that feature is planned for inclusion in a future update.

Cloud 9 offers a free account and a $12 premium account. The premium account gives the user a virtual machine with shell access and 6 private workspaces. Much of the Cloud 9 code base is also distributed as open source software on GitHub, which makes it possible for individuals to run their own self-hosted single user environment.


	
</entry>
<entry [Wed 2013:03:20 00:34:20 EST] GOOD EC2 CREDENTIALS INTRO>

http://www.bennadel.com/blog/2321-How-I-Got-Node-js-Running-On-A-Linux-Micro-Instance-Using-Amazon-EC2.htm

    
</entry>
<entry [Fri 2012:12:28 04:11:03 EST] SET UP EC2 KEY PAIR FILE>

I need SSH access to an Amazon EC2 instance running Ubuntu 10.4. All I got is the amazon username and passoword. Any ideas?

ubuntu amazon-ec2 ubuntu-10.04
asked Jun 18 '11 at 8:17

75% accept rate
Basically, you need a private-key file to login into your EC2 via SSH. Follow these steps to create one:

Go https://console.aws.amazon.com/ec2/home & sign in to your existing Amazon account.
Click on "Key Pairs" on LHS or https://console.aws.amazon.com/ec2/home?region=us-east-1#s=KeyPairs.
You should the list of KEYs generated by you (or during EC2 creation process).
Click on "Create Key Pair" if you don't see any or you lost your private-key.
Enter a unique name and hit enter.
A download panel will appear for you to save the private-key, save the key private-key.
Keep it somewhere with the file permission "0600"
Click on "Instances" on LHS or https://console.aws.amazon.com/ec2/home?region=us-east-1#s=Instances
You should see the list of ec2-instances, if you don't see one, then please create it.
Click on the EC2 machine and note down the Public DNS address.
Open your Terminal (in Linux) and type the following command
ssh -i /path/to/private-key root@<ec2-public-dns-address>
hit Enter
That's it.
    
</entry>
<entry [Sat 2012:05:12 00:51:17 EST] OLD BLURB FOR PluginManager METHODS>

* METHODS:
 *
 *    PluginManager._installedPlugins(String name)       // INSTALLED PLUGINS
 *    PluginManager.pluginsList()                       // LIST OF PLUGINS (ALT: GET FROM plugins.json FILE)
 *    PluginManager.loadPlugins(String name)            // LOAD PLUGINS FROM LIST
 *    PluginManager.getPluginJson(String name)             // RETURN RETRIEVED JSON FOR PLUGIN
 *    PluginManager.getInstalledPlugins(String name)    // RETURN INSTALLED PLUGINS

 *    PluginManager.getVersion(String name)             // RETURN PLUGIN VERSION
 *    PluginManager.getDescription(String name)         // RETURN PLUGIN DESCRIPTION
 *    PluginManager.getPluginUrl(String name)           // RETURN PLUGIN URL
 *    PluginManager.setInstalled(String name)           // SET PLUGIN INSTALLED Boolean
 *    PluginManager.isInstalled(String name)            // GET PLUGIN INSTALLED Boolean
 *    PluginManager.getInfo(String name)                // GET INFO FOR A PLUGIN
 *
 *        Boolean isInstalled
 *        String  version
 *        String  description
 *        String  pluginPage   URL to download the plugin
 *
 *    DO THESE LATER IF NECESSARY
 *    PluginManager.unInstall(String name)              // REMOVE PLUGIN FROM plugins.json LIST
 *    PluginManager.install(String name)                // ADD PLUGIN TO plugins.json LIST
 *
 * CHANGELOG:
 * Sat 18th October 2008: Version 0.1
 *   load plugins
 *   added license
 
    
</entry>
<entry [Fri 2012:05:04 07:11:18 EST] MANUAL ADJUSTMENTS IF USING NON-STANDARD URL>

html/plugins/form/templates/uploader.html LINE 28


<!--
				<form
					method="post"
					action="../../../../../../cgi-bin/agua/upload.cgi"
					enctype="multipart/form-data" >
  

html/plugins/admin/GroupProjects.js LINE 279

		// SET FANCY FORMAT IN NODE INNERHTML
		node.innerHTML = "<table> <tr><td> <img src='http://localhost/agua/plugins/admin/images/users-18.png' <strong style='color: darkred'>" + node.name + "</strong></td></tr><tr><td> " + node.description + "</td></tr></table>";

-->
    
</entry>
<entry [Tue 2012:03:06 14:26:04 EST] HOW TO COPY A PROJECT>

There are two ways to copy a project:

To copy just the project workflows and applications and NOT the data files, do the following in the Workflow Pane:

    1. Select the 'Shared' tab in the middle panel.
    2. Click the copy icon to the right of the Project select box.
    3. Input the name of the destination project and click OK.
    
To (optionally) copy the data files as well as the workflows and applications, do the following in the Folders Pane:

    1. Browse to the project you wish to copy and rightclick the project to display the menu.
    2. Select 'Copy Project'
    3. Input the name of the destination project, select 'copy files' if desired and click OK.




</entry>
<entry [Wed 2012:01:18 10:06:19 EST] WHY VERSION CONTROL?>

http://source.ggy.bris.ac.uk/mediawiki/index.php?title=Subversion&redirect=no

Introduction

Why is Version Control useful?
It removes confusion about versions, e.g. blah.old, blah.sav, blah.older, blah.newest2
It makes collaborative working easier--no confusion about versions, highlights conflicts, independent working copies, log messages etc.
It makes distributing your code easier--a Subversion repository can be visible to the world, but with highly specific access controls.
It makes reproducing experiments easier--you can always get a specific version of your model.
It aids disaster recovery--you computer is fried? No problem, just checkout your code to another!
    
</entry>
<entry [Sat 2011:11:12 12:11:38 EST] ADD GIT DEVELOPMENT MODEL>

SEE git.archive.2.xsl
[Tue 2011:04:05 12:37:49 EST]
SETTING UP A DEVELOPMENT REPOSITORY

http://wiki.opscode.com/display/chef/Working+with+git

SUMMARY

1. ALL DEVELOPMENT SHOULD BE DONE IN A BRANCH

2. REMOVE THE origin REMOTE AND USE THE BRANCH NAME INSTEAD


DETAILS

# Clone the repositories locally
git clone git@github.com:yourgithubusername/chef.git

# Enter the chef directory and add an opscode remote
cd chef/
git remote add opscode git://github.com/opscode/chef.git

# You'll be able to see if this is successful with git config:
git config --get-regexp "^remote\.opscode"

    remote.opscode.url git://github.com/opscode/chef.git
    remote.opscode.fetch +refs/heads/*:refs/remotes/opscode/*

# Adjust your branch to track the opscode master remote branch
# By default it'll track your origin remote's master:
git config --get-regexp "^branch\.master"

    branch.master.remote origin
    branch.master.merge refs/heads/master

# Change it with the following:

$ git config branch.master.remote opscode



NOTES
-----

http://wiki.opscode.com/display/chef/Working+with+git

Working with Git
Attachments:3 Added by Barry Steinglass, last edited by Tom Thomas on Apr 04, 2011  (view change) show comment


	Chef Project Development
This page describes the workflow used for working on the Chef and related projects (Ohai, mixlibs, etc) source code. To learn more about Git itself:
Git Documentation
Learn Git
Pro Git
To learn about working with git and cookbooks:

Working with Git and Cookbooks
Initial setup of development repository
Setup a github account
Fork the repositories

Clone the repositories locally
$ git clone git@github.com:yourgithubusername/chef.git
Enter the chef directory and add an opscode remote
$ cd chef/
$ git remote add opscode git://github.com/opscode/chef.git
You'll be able to see if this is successful with git config:
$ git config --get-regexp "^remote\.opscode"
remote.opscode.url git://github.com/opscode/chef.git
remote.opscode.fetch +refs/heads/*:refs/remotes/opscode/*
Adjust your branch to track the opscode master remote branch, by default it'll track your origin remote's master:
$ git config --get-regexp "^branch\.master"
branch.master.remote origin
branch.master.merge refs/heads/master
Change it with the following:
$ git config branch.master.remote opscode


    
</entry>
<entry [Fri 2011:07:08 03:52:23 EST] NICE README - W3 DOCUMENTATION>

http://www.w3.org/TR/CSS2/visuren.html#visual-model-intro
    
</entry>
<entry [Wed 2011:05:04 18:19:42 EST] LICENSE>
    
Agua is freely available under the MIT Licence (see bottom of file for details).
    
</entry>
<entry [Wed 2011:05:04 18:19:57 EST] *** DOCUMENTATION *** >
    
This documentation is composed of the following main sections:

    Introduction
    Install
    Resources
    For Developers
    Licence
    
</entry>
<entry [Wed 2011:05:04 18:21:13 EST] Introduction>

Introduction
============

Agua is a data analysis workflow tool designed to run on the Amazon EC2 cloud. Agua is a bioinformatics analysis platform for Next Generation Sequencing but can be used as a workflow tool for all Linux-supported command-line applications.

Users can flexibly create groups, add members to groups and share data analysis pipelines and results with group members. Multi-level access privileges can be allocated to group members and to users in the general public.

Users can also add new applications easily to the existing suite of applications. These custom applications can be configured to 'recognize' their inputs from the outputs of preceding applications in a workflow.

Agua workflows can be run locally on the head node (where Agua is installed) or on StarCluster cloud node clusters. Once a cluster workflow is started, the StarCluster begins to auto-scale itself, adding new nodes to the cluster when the number and average duration of jobs is high and removing nodes when demand slacks off. The user can preconfigure the minimum and maximum number of nodes for each StarCluster tailored to each workflow. The user can also change the minimum and maximum number of nodes while the workflow is in progress to best suit their budget and time constraints. 

Using Agua's default pipelines, Next Generation Sequencing data can be processed and viewed in the built-in JBrowse genome viewer. JBrowse employs the same technology as Google-Maps to allow the user to scan through the genome, zooming in and out in real time.


</entry>
<entry [Wed 2011:05:04 18:18:32 EST] Installation>

Install
=======

The scripts for installation and configuration, along with other utility scripts, are found in this directory:

INSTALLDIR/VERSION/bin/scripts

To install Agua, you must run AS ROOT the following two scripts in succession:

1. install.pl   Installs dependencies and sets up directory hierarchy

EXAMPLE:

sudo ./install.pl


2. config.pl    Configures Agua database, configures load balancer monitor
                and creates 'admin' user.

OPTIONS:

    [--mode config] Default 'config' mode: do all the following config tasks
    --mode mysql    Install Agua mysql database and DB user
    --mode cron     Create cron job to monitor StarCluster load balancer
    --mode user     Create 'admin' user

EXAMPLE:

sudo ./config.pl


</entry>
<entry [Wed 2011:05:04 17:56:55 EST] *** FOR DEVELOPERS *** >

If you'd like to customize, tweak, fix or otherwise improve Agua, please take a quick look through the following section, which explains some key points about the software and the design decisions behind its current form.

...

</entry>
<entry [Wed 2011:05:04 18:03:04 EST] RESOURCES>

The following resource files are located at:

$INSTALLDIR/$VERSION/bin/scripts/resources


Entry format
=-----------=

dirname:
    resource.txt
    subdir:

dirname:        =   directory called 'dirname'
subdir:         =   directory called 'subdir' inside 'dirname' directory
resource.txt    =   file called 'resource.txt' inside 'dirname' directory


Entries
=------=    

VERSION                 Contains version and build of current Agua package.

agua:
    links.txt           List of symbolic links to be created by config script.
    perlmods.txt        List of required Perl modules to be installed by install.pl
    permissions.txt     File permissions for Agua directory hierarchy
                        of 'git describe --tags'.

apache2:
    apache2.conf        Configuration for the Apache HTTP server.
                        Replaces original file: /etc/apache2/apache2.conf
    envvars             Environment variables for the Apache HTTP server
    sites-available:
        default         Replaces configuration file for default HTTP site

cpan:
    MyConfig.pm         Replaces MyConfig.pm for running CPAN.
                        (NB: deprecated - use cpanminus)

starcluster:
    config              For reference, basic StarCluster config file
    plugins:
        automount.py    Mounts /data and /nethome volumes on head node
        sge.py          Configures SGE cluster on head, master and exec nodes.
                        Allows head node to submit and monitor cluster jobs.

    
</entry>
<entry [Wed 2011:05:04 17:59:20 EST] USER STORIES>

The 'user stories' method is a practical way of communicating the higher level function of software so that developers can keep them in mind while designing and implementing software tools. Agua user stories are intended to succinct enought to fit on a flash card but detailed enough to describe the user's experience so that developers can scope out the task completely. If it's too long for one flash card then it should probably be separated into two or more user stories, which can reference each other.    
    
</entry>
<entry [Wed 2011:05:04 18:02:00 EST] The Workflow Pane>
    
Terri, an underpaid grad student, has to get a pipeline together to analyse large batches of NextGen sequence by aligning them to the human genome and predicting their SNPs. There's a deadline looming, so there's no time to cobble a pipeline together. Nor is there time (nor money!) to acquire and learn several different software tools to run the pipeline manually. What Terri needs is an easy-to-use interface and some pre-configured pipelines that can be later tweaked.

The Workflow Pane presents all main options in a left-to-right order of increasing detail: it contains a Left Panel (Apps), Middle Panel (Workflow) and a Right Panel (Info).

The Apps Panel contains applications that the user can select and drag into the middle pane to form a queue of applications, i.e., a workflow.

Clicking on an application in the workflow shows it's details in the right pane.

The Apps and Workflow Panels are toggleable so that extra space can be freed up for viewing more detailed information in the Workflow and Info Panels.

Clicking the 'Workflow' button in the top bar creates a tabbed Workflow Pane in the main window below. Multiple Workflow Panes can be visible at any one time. Panes can be removed by clicking on the 'X' in their tab.

Workflow Panes are synchronized with other panes so they change when the data changes.
    
</entry>


<entry [Wed 2011:05:04 18:02:17 EST] The Apps Panel>
    

Right-click info - Links

Versions

Dropping an app in the workflow box creates a copy of it. The system is able to infer from the dropped app all of the information for the application.

The Apps Panel toggleable - shrinks to left to free up more space for middle and right panes.
    
</entry>
<entry [Wed 2011:05:04 18:02:32 EST] The Workflow Panel>
    
Dropping an application in the workflow results in that application being inserted into the list of existing workflow applications at the position where it was dropped.

    
</entry>
<entry [Wed 2011:05:04 19:29:59 EST] The Cluster Selector >

L is a lab technician at a diagnostic firm that has just started doing NextGen analysis. He needs to run a series of algorithms, each with rather different computational requirements but the firm has only one ageing cluster maintained by IT staff who don't enjoy dealing with customization requests. 

He can accomplish this task by running the algorithms as distinct worfklows, each with it's own specialized cluster. He first creates clusters in the Admin Pane's 'Clusters Panel', selecting the types of instances (from micro to HPC) and the minimum and maximum number of instances (the same number if desired). The cluster will automatically kill and recruit nodes within this range depending on the number of pending jobs.

After the clusters are properly configured, L can return to the Workflow Pane's 'Cluster Selector' and, for each workflow, select a different cluster. Then he can run the workflows in parallel by selecting a workflow with the 'Workflow Selector', and clicking the 'Run Workflow' to launch a cluster and run the workflow.


DESIGN POINT:    

    1. A NEW CELL IS CREATED ON 8E FOR EACH CLUSTER THAT IS STARTED

        E.G., /opt/sge6/syoung-smallcluster

    2. WITHIN EACH CELL, A NEW QUEUE IS CREATED FOR EACH WORKFLOW
    
        E.G., syoung-project1-workflow1


LOAD BALANCER

    1. SET NODES TO 2 NOMINALLY
    
    2. ONCE CLUSTER HAS STARTED, MOVE BETWEEN MIN AND MAX NODES 
    
        DEPENDING ON JOB LOAD
    
</entry>
<entry [Wed 2011:05:04 19:29:58 EST] The Info Panel>

The Info Panel
Parameters


Status


1101219165
1101219175
1101219170



</entry>
<entry [Wed 2011:05:04 19:29:58 EST] The Project Object (BACKEND)>

Agua::Project

		PACKAGE		Project
		
		PURPOSE
		
			THE Project OBJECT PERFORMS THE FOLLOWING TASKS:
			
				1. RETURNS THE FILE AND DIRECTORY LISTINGS OF A GIVEN PATH AS A
                
                    dojox.data.FileStore JSON OBJECT (TO BE RENDERED USING
                    
                    FilePicker INSIDE dojox.dijit.Dialog)

                2. MAINTAINS THE PERMISSIONS ON THE FILES AND FOLDERS TO
				
					PERMIT ACCESS BY THE USER AND THE APACHE USER
                    
                3. PROVIDES THE FOLLOWING FUNCTIONALITY:

                    - PROJECT FOLDERS
                    
                        - ADD
                        - RENAME
                        - DELETE 

                    - WORKFLOWS
                        
                        - ADD
                        - RENAME
                        - DELETE
                        - MOVE TO PROJECT
                        - COPY TO PROJECT

                    - FILES
                    
                        - ADD
                        - RENAME
                        - DELETE
                        - MOVE TO WORKFLOW OR LOWER DIRECTORY
                        - COPY TO WORKFLOW OR LOWER DIRECTORY



				NB: Agua::Project DOES NOT DO THE FOLLOWING:

					- KEEP TRACK OF FILESYSTEM SIZES IN EACH PROJECT

					- LIMIT FILE ADDITIONS BEYOND A PRESET USER QUOTA
					 

</entry>