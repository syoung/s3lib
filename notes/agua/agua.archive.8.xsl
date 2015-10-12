agua.archive.8


<entry [Sat 2012:03:17 00:39:50 EST] CREATED IMAGE FROM MASTER>

1. CREATED IMAGE ON HEADNODE

/data/starcluster/0.92rc2/bin/starcluster -c /nethome/admin/.starcluster/admin-smallcluster.config \
ebsimage \
i-1d3fb179 \
aquarius-8

    AMI ami-9c835cf5


2. CONFIRM IMAGE
    
    IMAGE	ami-9c835cf5	728213020069/aquarius-8	728213020069	available	private		x86_64	machine	aki-825ea7eb		ebs	paravirtual	xen
    BLOCKDEVICEMAPPING	/dev/sda1		snap-39268643	10	


3. LAUNCH IMAGE


ec2-run-instances \
--key aquarius2 \
ami-9c835cf5 \
--instance-type t1.micro \
-z us-east-1a 


RESERVATION	r-44e21a27	728213020069	default
INSTANCE	i-e7661783	ami-9c835cf5			pending	aquarius2	0	t1.micro	2012-03-17T22:33:36+0000	us-east-1a	aki-825ea7eb			monitoring-disabled					ebs					paravirtual	xen		sg-2925d740	default


ec2din i-e7661783

RESERVATION	r-44e21a27	728213020069	default
INSTANCE	i-e7661783	ami-9c835cf5	ec2-107-20-22-110.compute-1.amazonaws.com	ip-10-122-246-184.ec2.internal	running	aquarius2	0		t1.micro	2012-03-17T22:33:36+0000	us-east-1a	aki-825ea7eb			monitoring-disabled107.20.22.110	10.122.246.184			ebs					paravirtual	xen		sg-2925d740	default
BLOCKDEVICE	/dev/sda1	vol-f5436499	2012-03-17T22:33:55.000Z



ACCESSED

ssh root@ec2-107-20-22-110.compute-1.amazonaws.com
    OK




NOTES
=====

http://web.mit.edu/star/cluster/docs/latest/manual/create_new_ami.html

Customizing the StarCluster AMI
The StarCluster base AMIs are meant to be fairly minimal in terms of the software installed. If you’d like to customize the software installed on the AMI you can create a new AMI based on the StarCluster AMIs using the s3image and ebsimage commands.

Launching and Customizing an Image Host

In order to create a new AMI you must first launch an instance of an existing AMI that you wish to extend. This instance is referred to as an image host and is used to build a new AMI. The image host allows you to easily customize the software environment included in your new AMI simply by logging into the image host and making the necessary changes.

Launching a New Image Host

When launching a new image host it is recommended that you start a new cluster called imagehost using the following command:

$ starcluster start -o -s 1 -i < INSTANCE-TYPE > -n < BASE-AMI-ID > imagehost
Replace < INSTANCE-TYPE > with an instance type that is compatible with your < BASE-AMI-ID >. If you’re not creating a new Cluster/GPU Compute AMI, you can use m1.small (32bit) or m1.large (64bit) to minimize costs when creating the image. If you are creating a new Cluster/GPU Compute AMI the you’ll need to launch the image host with a Cluster/GPU Compute instance type.
This command will create a single node (-s 1) cluster called imagehost using the AMI you wish to customize (-n < BASE-AMI-ID >) and a compatible instance type (-i < INSTANCE-TYPE >). The -o option tells StarCluster to only create the instance(s) and not to setup and configure the instance(s) as a cluster. This way you start with a clean version of the AMI you’re extending.

You can also use a spot instance as the image host by passing --bid (-b) option:

$ starcluster start -o -s 1 -b 0.50 -i < INSTANCE-TYPE > -n < BASE-AMI-ID > imagehost
If you used the -o option you’ll need to periodically run the listclusters command to check whether or not the image host is up:

$ starcluster listclusters --show-ssh-status imagehost
Once the image host is up, login and customize the instance’s software environment to your liking:

$ starcluster sshmaster imagehost
The above command will log you in as root at which point you can install new software using either apt-get or by manually installing the software from source. Once you’ve customized the image host to your liking you’re ready to create a new AMI.

Using an Existing Instance as an Image Host

Of course you don’t have to use the above method for creating a new AMI. You can use any instance on EC2 as an image host. The image host also doesn’t have to be started with StarCluster. The only requirement is that you must have the keypair that was used to launch the instance defined in your StarCluster configuration file.

In previous versions it was strongly recommended not to use nodes launched by StarCluster as image hosts. This is no longer the case and you can now use any node/instance started by StarCluster as an image host.
Creating a New AMI from an Image Host

After you’ve finished customizing the software environment on the image host you’re ready to create a new AMI. Before creating the image you must decide whether to create an instance-store (aka S3-backed) AMI or an EBS-backed AMI. Below are some of the advantages and disadvantages of using S3 vs EBS:

Factor	EBS backed AMI’s	S3 backed AMI’s
Root Storage Size	1TB	10GB
Instances can be Stopped	Yes	No
Boot Time	Faster (~1min)	Slower (~5mins)
Data Persistence	EBS volume attached as root disk (persist)	Local root disk (doesn’t persist)
Charges	Volume Storage + Volume Usage + AMI Storage + Instance usage	AMI Storage + Instance usage
Customized AMI Storage Charges	Lower (charged only for the changes)	Higher (full storage charge)
Instance Usage Charge	No charge for stopped instances. Charged full instance hour for every transition from stopped to running state	Not Applicable
(see Amazon’s summary of EBS vs S3 backed AMIs for more details)

If you’re in doubt about which type of AMI to create, choose an EBS-backed AMI. This will allow you to create clusters that you can start and stop repeatedly without losing data on the root disks in between launches. Using EBS-backed AMIs also allows you to snapshot the root volume of an instance for back-up purposes and to easily expand the root disk size of the AMI without paying full storage charges. In addition, EBS-backed AMIs usually have much faster start up time given that there’s no transferring of image files from S3 as is the case with S3-backed AMIs.


Creating an EBS-Backed AMI

This section assumes you want to create an EBS-backed AMI. See the next section if you’d prefer to create an S3-backed AMI instead. To create a new EBS-backed AMI, use the ebsimage command:

$ starcluster ebsimage i-9999999 my-new-image

In the above example, i-99999999 is the instance id of the instance you wish to create a new image from. If the instance is a part of a cluster, such as imagehost in the sections above, you can get the instance id from the output of the listclusters command. Otherwise, you can get the instance id of any node, launched by StarCluster or not, via the listinstances command. The argument after the instance id is the name you wish to give to your new AMI.

After the ebsimage command completes successfully it will print out the new AMI id that you then can use in the node_image_id/master_image_id settings in your cluster templates.

    
</entry>
<entry [Sat 2012:03:17 00:17:05 EST] INSTALLED MOOSE AND R ON MASTER>

INSTALL MOOSE

cpanm install Task::Moose
cpanm install Devel::Declare
cpanm install MooseX::Method::Signatures::Meta::Method --force
cpanm install MooseX::Declare


INSTALL R

http://cran.r-project.org/bin/linux/ubuntu/README

Install the complete R system:

apt-get update
apt-get install r-base
    OK

Install the r-base-dev package (to compile R packages from source, e.g. package maintainers, or anyone installing packages with install.packages()):

apt-get install r-base-dev
    OK (already installed)


NOTES
=====

PROBLEM

ERROR MESSAGE WHEN INSTALLING

Building and testing MooseX-AuthorizedMethods-0.006 ... OK
Successfully installed MooseX-AuthorizedMethods-0.006
Building and testing MooseX-Method-Signatures-0.41 ... FAIL
! Installing MooseX::Method::Signatures failed. See /root/.cpanm/build.log for details.
--> Working on MooseX::Role::Parameterized

SOLUTION

USE --force

    
</entry>
<entry [Fri 2012:03:16 02:33:07 EST] ENABLED START CLUSTER BY Workflow::executeWorkflow>

SUMMARY

RERAN automount.py TO MOUNT /nethome, /agua AND /data on MASTER


PROBLEM

GET THIS ERROR ON HEADNODE WHEN RUN WORKFLOW:

ww
reset ; echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"2","start":1,"stop":"","username":"admin","sessionId":"9999999999.9999.999","mode":"executeWorkflow","submit":1,"cluster":"admin-smallcluster","SHOWLOG":4}' | ./workflow.cgi | tee  /tmp/out

WHICH RUNS QSUB:

export SGE_QMASTER_PORT=36331; export SGE_EXECD_PORT=36332; export SGE_ROOT=/opt/sge6; export SGE_CELL=admin-smallcluster; export USERNAME=admin; export QUEUE=admin-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; /opt/sge6/bin/lx24-amd64/qsub  -q admin-Project1-Workflow1 -V  -l h_rt=24:00:00  /nethome/admin/agua/Project1/Workflow1//scripts/Project1-1-Workflow1-1.sh

ERROR FILE CONTENTS:

error reason    1:          03/16/2012 07:57:52 [0:8850]: error: can't open output file "/nethome/admin/agua/Project1/Workflow1/


DIAGNOSIS

/nethome NOT MOUNTED


SOLUTION

RUN automount.py

    
</entry>
<entry [Thu 2012:03:08 09:22:17 EST] AGUA VERSION CONTROL A LA DOJO>

http://localhost/agua/agua.html?syoung,9999999999.9999.999,data.workflow

Getting There: Compatibility and API Changes

One of our major goals with the Dojo Toolkit is that your application should be easy to upgrade between point releases, e.g., 1.5 to 1.6, and we only make major, incompatible API changes when changing major version numbers, e.g. 1.0 to 2.0. In order to guarantee this API compatibility and consistency, we need time to make sure our APIs are stable and solid. The changes in Dojo 1.6 and 1.7 represent a major refactoring of Dojo for 2.0, while preserving compatibility with previous versions of Dojo. Thus, there are a flurry of new APIs that you should consider to represent Dojo 2.0 alpha or beta, while still being able to safely use existing APIs that may be deprecated in 2.0.

We will discuss many of these changes in more detail through blog posts, tutorials and web site updates in the near future. Here’s a brief summary of the major changes.


    
</entry>
<entry [Thu 2012:03:08 09:19:12 EST] DOJO 1.7 RELEASE LINK>

New mobile platform features
http://dojotoolkit.org/blog/dojo-1-7-released

Better documentation
http://dojotoolkit.org/reference-guide/releasenotes/1.7.html
    
</entry>
<entry [Wed 2012:03:07 05:12:43 EST] MIT LICENSE LINK>

http://www.opensource.org/licenses/mit-license.php
    
</entry>
<entry [Sun 2012:03:04 22:52:01 EST] ENABLED LOAD agua PROJECTS ON INSTALL/UPGRADE>

AS PART OF THE INSTALLATION OF THE biorepository, SHARED WORKFLOWS ARE LOADED INTO THE DATABASE AS BELONGING TO THE agua USERNAME.

DEVELOPER: INCREMENT VERSION FOR EACH ADDITION/SUBTRACTION OF AGUA WORKFLOWS TO biorepository.

ADMIN: UPGRADE TO NEWER biorepository VERSIONS IN Home PANE TO UPDATE SHARED WORKFLOWS


TRANSFER WORKFLOWS FROM ADMIN TO AGUA AND PUSH TO THE PUBLIC BIOREPOSITORY:

1. ENABLE loadProjectFiles IN Agua::Common::Package

2. GENERATE PROJECT FILES IN admin BIOREPOSITORY ACCOUNT
    OK

3. COPY admin PROJECT FILES TO agua BIOREPOSITORY ACCOUNT

-   COPY FILES

    cp -r /agua/repos/private/admin/biorepository/admin/workflows \
    /agua/repos/public/agua/biorepository/agua/workflows

-   REPLACE admin OWNER WITH agua
    
    OK

-   CURRENT REMOTE TAG

    /agua/bin/logic/ops.pl \
    biorepository getRemoteTags syoung biorepository
    [
        {
           "sha" : "2f886d8f3de6af0cf945b2c842035d2a24296fe0",
           "name" : "0.6.0"
        }
    ]

-   CURRENT LOCAL TAG
    cd /agua/repos/public/agua/biorepository
    gitlog
        * bd59269 (HEAD) [0.7.5+build6] Fixed bioapps.pm print to logfile (post-reboot)
    
-   INCREMENT TAG (PATCH), COMMIT AND PUSH

    /agua/bin/scripts/version.pl \
    --versiontype patch \
    --repodir /agua/repos/public/agua/biorepository \
    --description "First commit of Agua workflows"
    
        New version: 0.7.6

    gitlog
        * 114bc99 (HEAD) [0.7.6] First commit of Agua workflows
        * bd59269 (tag: 0.7.6) [0.7.5+build6] Fixed bioapps.pm print to logfile (post-reboot)


4. ENABLE LOAD agua PROJECTS IN biorepository.pm
    
    OK


5. TRANSFERRED FROM DEV TO PROD

NB: AGUA DEV DIR (THE 'PUBLIC' DIR IN THE INSTANCE) IS LINKED TO /repos

/agua/repos/public/agua/biorepository -> /repos/private/agua/biorepository

USE syoung BIOREPOSITORY TO TEST PROCESS:

/agua/bin/scripts/transfer.pl \
--repository bioapps \
--outputdir /home/syoung/RELEASE \
--versiontype build \
--sourcerepo /repos/private/agua/biorepository \
--targetrepo /repos/public/syoung/biorepository \
--desc "+Add: Agua workflows added"
       
    Created new version: 0.7.6+build1


NB: REDO TAG AFTER FIX ("owner": "agua")

cd /repos/private/agua/biorepository
git tag -d 0.7.6+build1
git push github :refs/tags/0.7.6+build1
     - [deleted]         0.7.6+build1

cd /repos/public/syoung/biorepository
git tag -d 0.7.6+build1
git push github :refs/tags/0.7.6+build1

6. PUSH TAGS

cd /repos/public/syoung/biorepository
git push
git push --tags

    OK


7. CREATE biorepository.pm



/agua/bin/scripts/version.pl \
--versiontype build \
--repodir /agua/repos/public/agua/biorepository \
--description "First commit of Agua workflows"
    


8. TEST LOAD agua PROJECTS

reset ;
/agua/bin/logic/ops.pl biorepository install \
--owner syoung \
--installdir /agua/repos/public/agua/biorepository \
--repository biorepository \
--logfile /tmp/agua-biorepository.install.log \
--database agua \
--login syoung \
--token 4416b765217a3c3de1ed99938ffe25e0 \
--opsdir /agua/repos/public/agua/biorepository/agua/biorepository \
--sessionId 9999999999.9999.999 \
--username admin

-   LOADS PROJECTS INTO project, workflow, stage AND stageparameter TABLES

        OK

-   ADDS ENTRY IN access TABLE TO MAKE PROJECTS OPEN ACCESS

        OK
        

9. ENABLE DISPLAY OF agua SHARED WORKFLOWS IN Workflow Pane 'Shared Projects'

        

    
</entry><entry [Sun 2012:03:04 01:55:00 EST] BIOREPOSITORY AND REPOS FOLDER HIERARCHY>


#### OPS FILES

PRIVATE OPS FILES
    
    /agua/repos/private
        username
            biorepository
                username
                    apps
                    myPackage
                    workflows

PUBLIC OPS FILES
    
    /agua/repos/public
        username
            biorepository
                username
                    apps
                    myPackage
                    workflows


#### INSTALLED PACKAGES

PRIVATE PACKAGES

    /nethome/username    
        .repos      
            private
                mypackage
                    bin
                    .git
                    lib
                    etc.

PUBLIC PACKAGES

    /nethome/username    
        .repos      
            public
                mypackage
                    bin
                    .git
                    lib
                    etc.

    
</entry>
<entry [Sat 2012:03:03 11:58:33 EST] TO CALL OR NOT TO CALL: CHANGED Agua::Common::Package::upgrade TO INSTANTIATE ops INSIDE Workflow.pm>

CHANGED TO THIS:

	#### CREATE OPS INSTANCE
	my $ops = Agua::Ops->new({
		owner		=>	$owner,
		username	=>	$username,
		repository	=>	$repository,
		package		=>	$repository,
		installdir	=>	$installdir,
		opsdir		=>	$opsdir,
		random		=>	$random,
		version		=>	$version,
		login		=>	$login,
		token		=>	$token,
		owner		=>	$owner,
		conf		=>	$self->conf(),
		dbobject	=>	$self->dbobject(),
		SHOWLOG		=>	$self->SHOWLOG(),
		PRINTLOG	=>	$self->PRINTLOG(),
		showreport	=>	0
	});


FROM THIS:

	my $report = $ops->install();
	my $report = $ops->report();
	$self->logDebug("report", $report);


	#### SET ops.pl EXECUTABLE
	my $aguadir = $self->conf()->getKey('agua', 'INSTALLDIR');
	my $executable = "$aguadir/bin/logic/ops.pl";

	#### RUN INSTALL TO upgrade VERSION
	my $command  = "$executable $package install ";
	$command 	.= " --owner $owner"; 
	$command 	.= " --repository $repository"; 
	$command 	.= " --installdir $installdir"; 
	$command 	.= " --logfile $logfile"; 
	$command 	.= " --version $version" if defined $version;
	$command  	.= " --login $login" if defined $login;
	$command  	.= " --token $token" if defined $token;
	$self->logDebug("command", $command);
	
	my ($log) = $self->head()->ops()->runCommand($command);
	$self->logDebug("log", $log);
	my $newversion = $self->parseOpsOut($log);

    
</entry>
<entry [Sun 2012:02:26 03:34:12 EST] FIX WORKFLOW RUNSTATUS STDERR/STDEOUT DOWNLOAD ERROR 'ifd.getElementsByTagName("textarea")[0] is undefined'>


PROBLEM:

FIREBUG KEEPS ON SCROLLING FIRST THE STANDBY WIDGET, THEN (AFTER DELETING THE STANDBY WIDGET) THE 'BODY' TAG, REGARDLESS OF WHETHER OR NOT I HAVE SELECTED AN ELEMENT

I.E., IT HOPS OFF MY SELECTED AREA EVERY TIME I MOVE THE CURSOR ANYWHERE OUTSIDE THE SELECTED ELEMENT ON THE 'HTML' PANE


SOLUTION:

http://code.google.com/p/fbug/issues/detail?id=4170
Note, that you can switch off "Highlight Changes", "Expand Changes" and "Scroll Changes Into View" from the HTML panel's Options Menu, what will probably solve your problem.
For more info see http://getfirebug.com/wiki/index.php/HTML_Panel.

http://getfirebug.com/wiki/index.php/HTML_Panel

Click 'HTML' TAB, UNSELECT 'Hightight Changes' AND 'Scroll Changes into View'



Options Menu

This menu is reachable via the little arrow in the panel tab (  ) or by right-clicking on on the panel tab (since Firebug 1.9).
Option	 Preference	 Description
Show Full Text	extensions.firebug.showFullTextNodes	 Toggles between full text display and text preview inside the Node View
Show White Space	extensions.firebug.showTextNodesWithWhitespace	 Toggles display of white space characters inside the Node View
Show Comments	extensions.firebug.showCommentNodes	 Toggles display of HTML comments inside the Node View
Show Basic Entities	extensions.firebug.showTextNodesWithEntities	 Toggles display of basic HTML entity characters inside the Node View between the actual character representation and it's entity equivalent
Highlight Changes	extensions.firebug.highlightMutations	 Toggles highlighting changes to the DOM structure inside the Node View
Expand Changes	extensions.firebug.expandMutations	 Toggles expanding changes to the DOM structure inside the Node View

http://stackoverflow.com/questions/2566097/dojo-io-iframe-erroring-when-uploading-a-file

	
Since the load handler of dojo.io.iframe.send() has been triggered, the request should have been sent to the server and response is back. I think the response from server is not correct. Maybe the server returns an error page.

Use Firebug to inspect current page's DOM and find the transporting iframe created by Dojo and check its content. Firebug can capture iframe I/O too, check its Net tab. You may find the root cause of this issue.

link|improve this answer
answered Apr 7 '10 at 5:59

Alex Cheng
1,555138
Thanks for this after some major digging it was the backend process sending some really strange stuff back and that was causing the element to fail. Thanks. – Grant Collins Apr 7 '10 at 20:51
Was this post useful to you?     

up vote
1
down vote
Another common reason for this error is the server isn't packaging the data correctly. This means even if you have set "handleAs: json" you have to send that json wrapped in some html. This is what it should look like:

<!--

<html>
    <body>
        <textarea>
            { payload: "my json payload here" }
        </textarea>
    </body>
</html>

-->

Your error was saying it couldn't find the textarea in your return from the server. For more look at http://docs.dojocampus.org/dojo/io/iframe


</entry>
<entry [Wed 2012:02:22 16:54:26 EST] FIX MISSING UP ARROW AFTER MINIMISE PROGRESS PANE IN HOME PANE>


"NetworkError: 404 Not Found - http://ec2-107-21-188-3.compute-1.amazonaws.com/agua/dojo-1.6.1rc2/dijit/themes/tundra/images/arrowUp.png"
    
</entry>
<entry [Sat 2012:02:18 04:02:03 EST] FIX 'UNDEFINED' ERROR IN Version.pm>

1. CREATE VERSION

/agua/bin/scripts/version.pl --versiontype patch --repodir /agua --desc "Fixed install of bioapps"

Argument "patch" isn't numeric in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 180.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 182.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 183.
Argument "patch" isn't numeric in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 180.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 182.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 183.
Argument "patch" isn't numeric in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 180.
Argument "patch" isn't numeric in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 180.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 182.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 182.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 183.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 183.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 184.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 184.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 185.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 185.
Argument "patch" isn't numeric in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 180.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 182.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 183.
Argument "patch" isn't numeric in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 180.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 182.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 183.
Argument "patch" isn't numeric in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 180.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 182.
Argument "patch" isn't numeric in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 180.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 182.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 183.
Argument "patch" isn't numeric in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 180.
Use of uninitialized value in numeric gt (>) at /agua/bin/scripts/../../lib/Agua/Ops/Version.pm line 182.

New version: 0.7.4


2. ARCHIVE

/agua/bin/scripts/archive.pl \
 --name agua \
 --repodir /agua \
 --outputdir /home/syoung/RELEASE




    
</entry>
<entry [Sat 2012:02:18 03:39:54 EST] CAN'T FIX BUFFERING OF executeWorkflow OUTPUT>
    
    
PROBLEM:

WANT CGI SCRIPT TO

1) REPORT 'ok', FAKE QUIT (TO THE BROWSER) AND CARRY ON PROCESSING

OR 2) REPORT 'ok', SUPPRESS OUTPUT TO THE BROWSER AND CARRY ON PROCESSING


DIAGNOSIS:

IT APPEARS YOU CAN'T FLUSH PROPERLY ON THE PERL SIDE OR THE APACHE SIDE


SOLUTION:

ABANDON THIS, STICK WITH SIMPLE PRINT TO STDOUT, MONITOR PROGRESS BY POLLING


NOTES
=====

THE FOLLOWING METHODS ATTEMPT TO FLUSH BUFFERING ON THE PERL SIDE:


#my $logfile = $self->logfile();
#$self->logDebug("logfile", $logfile);

	#### CLOSE OUTPUT SO CGI SCRIPT WILL QUIT
	#close(STDOUT);  
	#close(STDERR);
	#close(STDIN);

	my $pid;
	if ( $pid = fork() ) #### ****** Parent ****** 
	{
		#### SET InactiveDestroy ON DATABASE HANDLE
		$self->dbobject()->dbh()->{InactiveDestroy} = 1;
		my $dbh = $self->dbobject()->dbh();
		undef $dbh;

		close(STDOUT);
		$| = 1;

#
#use CGI qw(:standard);
#my $r = shift;
#$r->rflush();

		exit(0);

		
	}
	else {
		$| = 1;


REDIRECT TO FILE

#my $file1 = "/tmp/out.txt";
#my $file2 = "/tmp/err.txt";
#open my $oldSTDOUT, ">&STDOUT";
#open my $oldSTDERR, ">&",\*STDERR; 
#open(STDOUT, ">$file1")  or print("Can't redirect stdout: to $file1 ");
#open(STDERR, ">$file2")  or print("Can't redirect stderr: to $file2 ");
#print "THIS OUTPUT ISN'T GOT TO STANDARD OUTPUT\n";
#system("pwd"); # this output isn;t got to standard output too, that is right!
#close(STDOUT);
#close(STDERR);
#open STDOUT, ">>&", $oldSTDOUT;
#open STDERR, ">>&", $oldSTDERR; 
#print "BUT THIS OUTPUT IS SEEN IN A STANDARD OUTPUT\n";

		#close(STDOUT);  
		#sleep(2);



COPY FILEHANDLE GLOB 
	
#	*OLD_STDOUT = *STDOUT;
# #print $for_STDOUT;
#
# *STDOUT = *NOT_STDOUT;     # again, doesn't need to be a real filehandle
# #print $stuff_to_suppress;
#
# *STDOUT = *OLD_STDOUT;     # restore original STDOUT
# #print $more_stuff_for_STDOUT;
 
#print "NOT HERE\n";


		
			my $sleep = 2;
			$sleep = 1 if not defined $sleep;
			
			##### SAVE OLD STDOUT & STDERR
			#my $oldout;
			#open $oldout, ">&STDOUT" or die "Can't open old STDOUT\n";
			#my $olderr;
			#open $olderr, ">&STDERR" or die "Can't open old STDERR\n";
			
open(STDOUT, '>', '/dev/null') or die $!;
open(STDERR, '>', '/dev/null') or die $!;
open(STDIN, '>', '/dev/null') or die $!;

			#close(STDOUT);  
			#close(STDERR);
			#close(STDIN);
			sleep($sleep);

#local $SIG{HUP} = "IGNORE";
#kill HUP => -$$;			

			###### RESTORE OLD STDOUT & STDERR
			#open STDERR, ">&", $olderr;
			#open STDOUT, ">&", $oldout;


3. RUN APP BY FORKING
my $pid;
if ( $pid = fork() ) #### ****** Parent ****** 
{
	$self->logDebug("pid", $pid);
}
elsif ( defined $pid ) #### ****** Child ******
{
	#print "Agua::Workflow::executeWorkflow    EXIT BEFORE logStatus()\n" and exit;
	$self->logStatus("Running workflow $project.$workflow");

	#### SET InactiveDestroy ON DATABASE HANDLE
	$self->dbobject()->dbh()->{InactiveDestroy} = 1;
	my $dbh = $self->dbobject()->dbh();
	undef $dbh;


	##### CLOSE OUTPUT SO CGI SCRIPT WILL QUIT
	#close(STDOUT);  
	#close(STDERR);
	#close(STDIN);
	#sleep(3);

	
	exit;
}
   

NB: THIS CAN FLUSH BUFFERING ON THE APACHE SIDE:

APACHE TIMEOUT
http://httpd.apache.org/docs/current/mod/core.html#timeout


TimeOut Directive

Description:	Amount of time the server will wait for certain events before failing a request
Syntax:	TimeOut seconds
Default:	TimeOut 300
Context:	server config, virtual host
Status:	Core
Module:	core
The TimeOut directive defines the length of time Apache will wait for I/O in various circumstances:

When reading data from the client, the length of time to wait for a TCP packet to arrive if the read buffer is empty.
When writing data to the client, the length of time to wait for an acknowledgement of a packet if the send buffer is full.
In mod_cgi, the length of time to wait for output from a CGI script.
In mod_ext_filter, the length of time to wait for output from a filtering process.
In mod_proxy, the default timeout value if ProxyTimeout is not configured.




    
</entry>
<entry [Sat 2012:02:18 03:14:09 EST] CA CERT GENERATION USING ssl-cert>

ZZ

        #   A self-signed (snakeoil) certificate can be created by installing
        #   the ssl-cert package. See
        #   /usr/share/doc/apache2.2-common/README.Debian.gz for more info.
        #   If both key and certificate are stored in the same file, only the
	#   SSLCertificateFile directive is needed.
#       SSLCertificateFile    /etc/ssl/certs/ssl-cert-snakeoil.pem
#       SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key


    
</entry>
<entry [Fri 2012:02:17 09:01:13 EST] FIXED 'isn't numeric' ERROR IN Agua::Ops::Version>

“Cannot Exec Sperl”
Filed under: Scripting — Tags: perl, setuid — martin @ 10:02 pm
Problem: Can't do setuid (cannot exec sperl)

Solution (CentOS/RedHat): yum install perl-suidperl
Solution (Debian/Ubuntu): apt-get install perl-suid
    
</entry>

<entry [Thu 2012:02:16 09:56:29 EST] FIXED install.pl ERROR RUNNING chkconfig BY USING update-rc.d INSTEAD>

PROBLEM:

.install.PL SCRIPT GIVES THIS ERROR OUTPUT FOR chkconfig COMMAND:

    command: chkconfig --level 345 mysql on
    The script you are attempting to invoke has been converted to an Upstart
    job, but lsb-header is not supported for Upstart jobs.
    insserv: warning: script 'mysql' missing LSB tags and overrides
    insserv: Service mysql has to be enabled to start service mysql-ndb
    insserv: exiting now!
    /sbin/insserv failed, exit code 1
    The script you are attempting to invoke has been converted to an Upstart
    job, but lsb-header is not supported for Upstart jobs.
    insserv: warning: script 'mysql' missing LSB tags and overrides
    ...
    The script you are attempting to invoke has been converted to an Upstart
    job, but lsb-header is not supported for Upstart jobs.
    insserv: warning: script 'portmap-wait' missing LSB tags and overrides
    insserv: There is a loop between service rsyslog and hwclock if stopped
    insserv:  loop involving service hwclock at depth 4
    insserv:  loop involving service heartbeat at depth 3
    insserv: There is a loop between service heartbeat and rsyslog if stopped
    insserv:  loop involving service rsyslog at depth 4
    insserv: There is a loop between service rsyslog and hwclock if stopped
    insserv: exiting now without changing boot order!
    /sbin/insserv failed, exit code 1
    Agua::Installer::runCommands    Agua::Installer::runCommands(commands)
    Agua::Installer::runCommands    command: /etc/init.d/mysql restart


DIAGNOSIS:

UBUNTU HAS NOT PORTED chkconfig IN ITS ENTIRETY SO USE update-rc.d INSTEAD


SOLUTION:

ENABLE START AT BOOT:

update-rc.d -f mysql defaults

    update-rc.d: warning: /etc/init.d/mysql missing LSB information
    update-rc.d: see < http://wiki.debian.org/LSBInitScripts>
     Adding system startup for /etc/init.d/mysql ...
       /etc/rc0.d/K20mysql -> ../init.d/mysql
       /etc/rc1.d/K20mysql -> ../init.d/mysql
       /etc/rc6.d/K20mysql -> ../init.d/mysql
       /etc/rc2.d/S20mysql -> ../init.d/mysql
       /etc/rc3.d/S20mysql -> ../init.d/mysql
       /etc/rc4.d/S20mysql -> ../init.d/mysql
       /etc/rc5.d/S20mysql -> ../init.d/mysql

 
DISABLE START AT BOOT:

update-rc.d -f mysql remove


FOR MORE INFO:

http://upstart.ubuntu.com/cookbook/

Legacy System-V style init scripts in /etc/init.d/ are generally managed via update-rc.d in Debian/Ubuntu.

Upstart-managed processes are configured in /etc/init/. You don't need any additional step here, just add your process description as /etc/init/*.conf and then manage the process using initctl

    
</entry>
<entry [Thu 2012:02:16 09:53:20 EST] Installer.pm: CHANGED COMMAND TO RESTART MYSQL TO 'service mysql restart'>

PROBLEM:

RUNNING .install.pl GET THIS ERROR:

Agua::Installer::runCommands    Agua::Installer::runCommands(commands)
Agua::Installer::runCommands    command: /etc/init.d/mysql restart
Rather than invoking init scripts through /etc/init.d, use the service(8)
utility, e.g. service mysql restart


SOLUTION:

USE 'service mysql restart' INSTEAD 

    
</entry>
<entry [Thu 2012:02:16 05:40:47 EST] INSTALLED 0.7.3+build3ON AQUARIUS-8F2>
    
    
</entry>
<entry [Thu 2012:02:16 02:02:13 EST] bioapps 0.6.1: Uncommented loadAppFiles>

/agua/bin/scripts/version.pl \
--versiontype patch \
--repodir /agua/repos/public/agua/biorepository \
--desc "Uncommented loadAppFiles in bioapps::postInstall"

    New version: 0.6.1

</entry>
<entry [Tue 2012:02:14 09:59:26 EST] FIXED FileManager>



console.dir({fileManager:fileManager});

var doIt = function () {
    console.clear();
    dojo.reload("plugins.workflow.FileManager");
    dojo.reload("plugins.workflow.Stages");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage();
};

var testShow = function () {
    var workflows= Agua.controllers["workflow"].tabPanes[0];
    console.dir({workflows:workflows});   
    var fileManager = workflows.core.fileManager;
    console.dir({fileManager:fileManager});

    fileManager.setMenus();

    var dialogStyle = dojo.style(fileManager.atomic.dialog.domNode);
    var underlayStyle = dojo.style(fileManager.atomic.dialog.domNode.nextSibling);
    console.log("FileManager.show    BEFORE SHOW dialogStyle: " + dojo.toJson(dialogStyle));
    console.log("FileManager.show    BEFORE SHOW underlayStyle: " + dojo.toJson(underlayStyle));
    
    fileManager.atomic.dialog.show();
    
    dialogStyle = dojo.style(fileManager.atomic.dialog.domNode);
    underlayStyle = dojo.style(fileManager.atomic.dialog.domNode.nextSibling);
    console.log("FileManager.show    AFTER SHOW dialogStyle: " + dojo.toJson(dialogStyle));
    console.log("FileManager.show    AFTER SHOW underlayStyle: " + dojo.toJson(underlayStyle));
}

//fileManager.atomic.dialog.show();
doIt();
//testShow();




NB: NO DIFFERENCE IN STYLE ATTRIBUTE BEFORE/AFTER SHOW OR HIDE:

cat dialog.BEFORE.json | /agua/bioapps/bin/utils/pretty.pl > dialog.BEFORE.pretty.json 
cat underlay.BEFORE.json | /agua/bioapps/bin/utils/pretty.pl > underlay.BEFORE.pretty.json 
cat dialog.AFTER.json | /agua/bioapps/bin/utils/pretty.pl > dialog.AFTER.pretty.json 
cat underlay.AFTER.json | /agua/bioapps/bin/utils/pretty.pl > underlay.AFTER.pretty.json 

cat dialog.BEFORE-hide.json | /agua/bioapps/bin/utils/pretty.pl > dialog.BEFORE.pretty-hide.json 
cat underlay.BEFORE-hide.json | /agua/bioapps/bin/utils/pretty.pl > underlay.BEFORE.pretty-hide.json 
cat dialog.AFTER-hide.json | /agua/bioapps/bin/utils/pretty.pl > dialog.AFTER.pretty-hide.json 
cat underlay.AFTER-hide.json | /agua/bioapps/bin/utils/pretty.pl > underlay.AFTER.pretty-hide.json 

    
</entry>
<entry [Tue 2012:02:14 06:22:31 EST] CREATED ARCHIVE 0.7.3+build2 AND INSTALLED ON AQUARIUS-8F2>

1. GET CURRENT BUILD

cd /agua
git describe --abbrev=0 --tags

    0.7.3+build2
    

2. INCREMENT BUILD VERSION

/agua/bin/scripts/version.pl --repodir /agua --versiontype build --description "Fixed bioapps and opsrepo install with Installer.pm"

    New version: 0.7.3+build2
    

3. ARCHIVE AND UPLOAD
    
/agua/bin/scripts/archive.pl \
 --name agua \
 --repodir /agua \
 --outputdir /home/syoung/RELEASE

    git archive --format=tar --prefix=agua/ HEAD | gzip > /home/syoung/RELEASE/agua.0.7.3+build3-818b849.tar.gz

4. INSTALLED ON AQUARIUS-8F2

OK


</entry>
<entry [Sun 2012:02:12 14:12:28 EST] FIXED git checkout STALL DUE TO CHANGES USING git stash save --keep-index "stash message">

1. STASH CHANGES WITH --keep-index AND MESSAGE

sudo git stash save --keep-index "upgrading to bioapps 0.7.1"
    Saved working directory and index state On (no branch): upgrading to bioapps 0.7.1
    HEAD is now at 4c22ea9 First commit.

(ALTERNATELY: REMOVE CHANGES BY THEN DOING git stash clean)


2. DO CHECKOUT

sudo git checkout 0.7.1
    Previous HEAD position was 4c22ea9... First commit.
    HEAD is now at c578455... [0.7.0] First commit


3. VERIFY CURRENT CHECKED OUT VERSION

gitlog
    * c578455 (HEAD, tag: 0.7.1) [0.7.0] First commit
    * 4c22ea9 (tag: 0.7.0) First commit.


    
</entry>
<entry [Fri 2012:02:10 23:17:00 EST] FIXED Agua::Common::Logger::fakeTermination>


PROBLEM:

EXTRA STDOUT RUINING JSON:

{ status: 'installing', url: '/var/www/html/agua/log/bioapps-upgradelog.html', version: '0.7.1' }From git://github.com/agua/bioapps
 * branch            HEAD       -> FETCH_HEAD
Fetching tags only, you probably meant:
  git fetch --tags
Previous HEAD position was dac6066... Merge branch 'master' of github.com:agua/bioapps
HEAD is now at c578455... [0.7.0] First commit


SOLUTION:

USE FORK AND PARENT QUITS:
http://stackoverflow.com/questions/1348639/how-can-i-reinitialize-perls-stdin-stdout-stderr

sub fakeTermination {
	my $self		=	shift;
	my $message		=	shift;

	#### FORK: PARENT MESSAGES AND QUITS, CHILD DOES THE WORK
	if ( my $child_pid = fork() ) 
	{
		print "$message\n";
	
		#### SET InactiveDestroy ON DATABASE HANDLE
		$self->dbobject()->dbh()->{InactiveDestroy} = 1;
		my $dbh = $self->dbobject()->dbh();
		undef $dbh;
	
		#### PARENT EXITS
		exit(0);
	}

	else
	{
		#### CHILD CONTINUES THE JOB
	
		#### CLOSE OUTPUT SO CGI SCRIPT WILL QUIT
		close(STDOUT);  
		close(STDERR);
		close(STDIN);
		
		#### ENSURE DB HANDLE STAYS ALIVE
		$self->setDbh();
	
		##### CREATE STARCLUSTER config FILE
		#$self->logDebug("Doing Agua::Common::Cluster->new(json)");
		#$self->_createConfigfile();
	}
}

    
</entry>
<entry [Thu 2012:02:09 13:31:30 EST] REMOVED version FROM DISTRIBUTION>

1. REMOVED VERSION FROM archive.pl

/agua/0.6/bin/scripts/version.pl --repodir /agua/0.6 --versiontype build --description "build increment to test archive.pl"

./archive.pl \
 --name agua \
 --repodir /agua/0.6 \
 --outputdir /home/syoung/RELEASE

    git archive --format=tar --prefix=agua/ HEAD | gzip > /home/syoung/RELEASE/agua.0.7.3+build1-b93a905.tar.gz


2. REMOVED VERSION FROM FOLLOWING FILES

default.conf            DONE   - REPLACED WITH 'URLPREFIX'
agua.html               DONE
permissions.txt         DONE
install.html            DONE    - REPLACED WITH 'URLPREFIX'
Installer.pm            DONE    - REPLACED WITH 'URLPREFIX'
starcluster/plugins/startup.py


</entry>
<entry [Wed 2012:02:08 17:00:06 EST] TESTED AUTOINSTALL bioapps AND biorepository ON AQUARIUS-8F2>

ON AQUARIUS-8F2:

1. CLONED 0.7.4 TO A HOLDING AREA

mkdir /agua/0.7.4
cd /agua/0.7.4
git clone https://github.com/agua/agua.git
    VERY FAST
    Initialized empty Git repository in /agua/0.7.4/agua/.git/
    remote: Counting objects: 9705, done.
    remote: Compressing objects: 100% (7757/7757), done.
    remote: Total 9705 (delta 1499), reused 9671 (delta 1465)
    Receiving objects: 100% (9705/9705), 40.39 MiB | 17.19 MiB/s, done.
    Resolving deltas: 100% (1499/1499), done.
    Checking out files: 100% (8614/8614), done.

root@ip-10-90-238-23:/agua/0.7.4/agua# ll
    drwxr-xr-x 8 root root 4.0K 2012-02-08 22:08 bin
    drwxr-xr-x 2 root root 4.0K 2012-02-08 22:08 cgi-bin
    drwxr-xr-x 2 root root 4.0K 2012-02-08 22:08 conf
    drwxr-xr-x 8 root root 4.0K 2012-02-08 22:08 .git
    drwxr-xr-x 5 root root 4.0K 2012-02-08 22:08 html
    drwxr-xr-x 6 root root 4.0K 2012-02-08 22:08 lib
    -rw-r--r-- 1 root root 1.1K 2012-02-08 22:08 LICENSE
    -rw-r--r-- 1 root root 4.8K 2012-02-08 22:08 README
    -rw-r--r-- 1 root root    5 2012-02-08 22:08 VERSION




/agua/0.6-241-d4878b2/bin/scripts/../logic/ops.pl \
bioapps install \
--owner syoung \
--installdir /agua/0.7.4/bioapps \
--repository bioapps \
--logfile /tmp/agua-bioapps. install.log \
--opsdir /agua/0.7.4/repos/public/biorepository/syoung/bioapps

ll /agua/0.6

</entry>
<entry [Wed 2012:02:08 01:31:01 EST] INSTALLED bioapps USING ./install>

./install.pl

RUNS THIS:

/agua/0.6/bin/scripts/../logic/ops.pl bioapps install --owner syoung --installdir /agua/0.6/bioapps --repository bioapps --logfile /tmp/agua-bioapps. install.log --opsdir /agua/0.6/repos/public/biorepository/syoung/bioapps --version 0.6.0 --username admin

    
</entry>
<entry [Tue 2012:02:07 01:06:11 EST] GENERATED APPS FILES FOR ALL bioapps PACKAGES>
 
1. LOADED TSV FILES INTO DATABASE

use agua
delete from app;
delete from parameter;
load data local infile '/agua/0.6/t/bin/Agua/Ops/Install/inputs/tsv/120207/bioapps-app.tsv' into table app;
load data local infile '/agua/0.6/t/bin/Agua/Ops/Install/inputs/tsv/120207/bioapps-parameter.tsv' into table parameter;

20 APPS
122 PARAMETERS

    
2. CREATED APP FILES

/agua/0.6/bin/logic/ops.pl bioapps createPackageAppFiles \
--username agua \
--opsdir /agua/0.6/repos/public/biorepository/syoung/bioapps \
bioapps \
admin \
/agua/0.6/bioapps \
/agua/0.6/repos/public/biorepository/syoung/bioapps

    OK
    Loading class: bioapps.pm
    
    Doing preInstall
    Installed version: 0.6.0
    Doing postInstall
    Completed ops.pl

    
OUTPUT FILES ARE HERE:

/agua/0.6/repos/public/biorepository/syoung/bioapps/admin/apps/packages/bioapps


E.G.:
/agua/0.6/repos/public/biorepository/syoung/bioapps/admin/apps/packages/bioapps/utility/unzipFiles.app

    {
       "owner" : "admin",
       "location" : "bin/utils/unzipFiles.pl",
       "executor" : "",
       "installdir" : "/agua/0.6/bioapps",
       "version" : "0.6.0",
       "name" : "unzipFiles",
       "localonly" : "0",
       "description" : "Unzip or gunzip files, with an optional filter",
       "package" : "bioapps",
       "parameters" : [
          {
             "locked" : "0",
             "value" : "1",
    ...
        ],
        "ordinal" : null,
        "notes" : " ",
        "url" : "http://www.aguadev.org/confluence/display/howto/unzipFiles",
        "type" : "utility"
    }


2. LOADED APP FILES DURING install

EMPTY TABLES:

delete from app;
delete from parameter;

LOAD APP FILES WITH ops.pl (USES AUTOMATIC appdir LOCATION TO FIND APP FILE PARENTDIR)

/agua/0.6/bin/scripts/../logic/ops.pl bioapps install --owner syoung --installdir /agua/0.6/bioapps --repository bioapps --logfile /tmp/agua-bioapps. install.log --opsdir /agua/0.6/repos/public/biorepository/syoung/bioapps --version 0.6.0 --username admin --package bioapps
    
    2012-02-07 02:04:42	[DEBUG]   	bioapps::postInstall	35	Completed loadAppFiles
    completd /agua/0.6/bin/scripts/../logic/ops.pl


CONFIRMED REQUIRED NUMBER OF PARAMETERS:

select count(*) from parameter where package='bioapps';
+----------+
| count(*) |
+----------+
|      112 |
+----------+
1 row in set (0.00 sec)

mysql> select count(*) from app;
+----------+
| count(*) |
+----------+
|       20 |

+----------+





</entry>
<entry [Fri 2012:01:27 01:13:48 EST] CREATED biorepository GITHUB ACCOUNT>

biorepository
a*

ALSO ENQUIRED ABOUT agua GITHUB ACCOUNT


    
</entry>
<entry [Thu 2012:01:26 15:10:27 EST] AGUA GITHUB ACCOUNT AND GMAIL>

github - HOSTS biorepository
======
agua
r*a

gmail
======
aguadev
dit**0
    
</entry>
<entry [Sun 2012:01:22 01:43:18 EST] POPULATED volume TABLE TO STORE bioapps SQLITE DB IN /data>

1. CREATED VOLUME TABLE WITH ENTRY FOR /data 

CREATE TABLE IF NOT EXISTS volume
(
    username        VARCHAR(30) NOT NULL,
    volumeid        VARCHAR(30) NOT NULL,
    volumesize      INT(6),
    instance        VARCHAR(30) NOT NULL,
    availabilityzone    VARCHAR(12) NOT NULL,
    mountpoint      VARCHAR(255) NOT NULL,
    device          VARCHAR(30) NOT NULL,
    snapshot        VARCHAR(30) NOT NULL,
    created         DATE,
    
    PRIMARY KEY (username, volumeid)
);

insert into volume values ('admin', 'vol-5bffe631', '200', 'i-b34d25d2', 'us-east-1a', '/data', '/dev/sdl', 'snap-6341b301', NOW());


2. DUMPED agua DATABASE

/agua/0.6/bin/sql/dump/agua.2012-01-22-02:38:46.dump


    
</entry>
<entry [Wed 2012:01:18 09:37:17 EST] ADDED LINK TO GITHUB IN Doc.pm>


https://github.com/syoung/aguadev/blob/master/bin/scripts/archive.pl


    
</entry>
<entry [Mon 2012:01:16 19:49:59 EST] FIXED mysql INSTALL PROBLEM IN install.pl>



installing mysql-server fails because /etc/init.d/mysql-ndb does not exist


On debian, installing mysql-server 5.0.87-d10-ourdelta-sail65 on a fresh install (i.e., not upgrading from mysql-server/stable) results in the following errors:

Stopping MySQL database server: mysqld.
insserv: Service mysql-ndb has to be enabled to start service mysql
insserv: exiting now!
update-rc.d: error: insserv rejected the script header
dpkg: error processing mysql-server-5.0 (--configure):
 subprocess installed post-installation script returned error exit status 1
dpkg: dependency problems prevent configuration of mysql-server:
 mysql-server depends on mysql-server-5.0; however:
  Package mysql-server-5.0 is not configured yet.
  Package mysql-server-5.1 which provides mysql-server-5.0 is not installed.
dpkg: error processing mysql-server (--configure):
 dependency problems - leaving unconfigured
Errors were encountered while processing:
 mysql-server-5.0
 mysql-server

This is because /etc/init.d/mysql requires /etc/init.d/mysql-ndb (which requires /etc/init.d/mysql-ndb-mgm). (These scripts silently exit if ndb is not enabled.) The ourdelta-sail package does not include these scripts, and thus initial configuration fails. A workaround is to install the ourdelta-sail package as an upgrade from the stable package, as debian does not remove these services on upgrade.


</entry>
<entry [Mon 2012:01:16 18:55:18 EST] FIXED PROBLEM '(Error code: ssl_error_rx_record_too_long)' WITH SSL>

http://stackoverflow.com/questions/119336/ssl-error-rx-record-too-long-and-apache-ssl

PROBLEM:

AFTER INSTALLED CA CERTIFICATE (AND ITS SSL KEY), GOT THIS ERROR IN FIREFOX:

(Error code: ssl_error_rx_record_too_long)


DIAGNOSIS:

Agua::Init::init    Doing generateCACert()
Installer::generateCACert    configdir: /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https
Installer::generateCACert    command: cd /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https; ssh-keygen -t rsa -f /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/id_rsa -q -N ''
^[[6~
/agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/id_rsa already exists.
Overwrite (y/n)? Installer::generateCACert    domainname: ec2-107-21-81-73.compute-1.amazonaws.com

Installer::generateCACert    request: openssl \
req \
-config /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/config.txt \
-newkey rsa:1024 \
-key /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/id_rsa \
-out /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/intermediary.pem


Installer::generateCACert    certify: openssl \
x509 -req \
-extfile /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/config.txt \
-days 730 \
-signkey /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/id_rsa \
-in /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/intermediary.pem \
-out /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/CA-cert.pem

Signature ok
subject=/C=US/ST=Maryland/O=UMCP/OIT/TSS/EIS/CN=ec2-107-21-81-73.compute-1.amazonaws.com/emailAddress=trash@trash.com
Getting Private key

Installer::generateCACert    keydir: /etc/apache2/ssl.key
Installer::generateCACert    copyprivate: cp -f /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/id_rsa /etc/apache2/ssl.key/server.key
Installer::generateCACert    copypublic: cp -f /agua/0.7.2-00351-435a22b/bin/scripts/../../conf/.https/CA-cert.pem /etc/apache2/ssl.key/server.crt
Agua::Init::init    Doing enableApacheSsl()
Agua::Init::enableApacheSsl    command: a2enmod ssl
Agua::Init::enableApacheSsl    installdir: /agua
Agua::Init::enableApacheSsl    command: cp /agua/0.7.2-00351-435a22b/bin/scripts/resources/apache2/sites-available/default-ssl /etc/apache2/sites-available/default-ssl
Agua::Init::init    Doing restartHttpd()
Agua::Init::restartHttpd    restart_command: /etc/init.d/apache2 restart
    * Restarting web server apache2
    ... waiting    ...done.


SOLUTION:

cd /etc/apache2/sites-available
/usr/sbin/a2ensite default-ssl
/etc/init.d/apache2 reload
     * Reloading web server config apache2                               [ OK ]



NOTES
=====

CHECKED ports.conf FILE:

em /etc/apache2/ports.conf

<!--

    # If you just change the port or add more ports here, you will likely also  
    # have to change the VirtualHost statement in                               
    # /etc/apache2/sites-enabled/000-default                                    
    # This is also true if you have upgraded from before 2.2.9-3 (i.e. from     
    # Debian etch). See /usr/share/doc/apache2.2-common/NEWS.Debian.gz and      
    # README.Debian.gz                                                          
    
    NameVirtualHost *:80
    Listen 80
    
    <IfModule mod_ssl.c>
        # If you add NameVirtualHost *:443 here, you will also have to change   
        # the VirtualHost statement in /etc/apache2/sites-available/default-ssl
        # to <VirtualHost *:443>                                                
        # Server Name Indication for SSL named virtual hosts is currently not   
        # supported by MSIE on Windows XP.                                      
        Listen 443
    </IfModule>
    
    <IfModule mod_gnutls.c>
        Listen 443
    </IfModule>

-->

AND CONFIRMED 

/etc/apache2/sites-available/default-ssl

<!--

<IfModule mod_ssl.c>
<VirtualHost _default_:443>
        ServerAdmin webmaster@localhost

-->


</entry>
<entry [Mon 2012:01:16 16:21:35 EST] CREATED aguadev RELEASE VERSION 0.7.2 WITH build DIR>
    
/agua/0.6/bin/scripts/archive.pl \
--name agua \
--basedir /agua/0.6 \
--version 0.7.2 \
--versionfile bin/scripts/resources/VERSION \
--outputdir /home/syoung/RELEASE
    
    archive.pl    build: 435a22b
    git archive --format=tar --prefix=0.7.2-00351-435a22b/ HEAD | gzip > /home/syoung/RELEASE/0.7.2/agua.0.7.2-00351-435a22b.tar.gz
    Completed /agua/0.6/bin/scripts/archive.pl

  
</entry>
<entry [Mon 2012:01:16 07:03:38 EST] ARCHIVED TO LACIE WITH RSYNC>

1. COPY ALL EXCEPT LINKED DIRS, E.G., plugins/view/jbrowse/species AND plugins/view/jbrowse/users

sudo rsync -av --safe-links /agua/0.6/* /media/LaCie/u10.10/syoung/0.6


TEST 
rsync -av --safe-links /agua/0.6/html/plugins/view/jbrowse/ /tmp/jbrowse6
    OK


NB: THIS COPIES ALL species AND users FILES
sudo rsync -av --copy-unsafe-links /agua/0.6/* /media/LaCie/u10.10/syoung/0.6

    
</entry>
<entry [Mon 2012:01:16 04:54:22 EST] CREATED aguadev RELEASE VERSION 0.7.1 >
    
/agua/0.6/bin/scripts/archive.pl \
--name agua \
--basedir /agua/0.6 \
--version 0.7.1 \
--versionfile bin/scripts/resources/VERSION \
--outputdir /home/syoung/RELEASE
    
    archive.pl    build: bc0989b
    git archive --format=tar --prefix=0.7.1-00349-bc0989b/ HEAD | gzip > /home/syoung/RELEASE/0.7.1/agua.0.7.1-00349-bc0989b.tar.gz
    Completed /agua/0.6/bin/scripts/archive.pl

    
</entry>
<entry [Thu 2012:01:12 06:36:34 EST] ADD LDAP SERVER TO default.conf>

EXAMPLE:

#LDAP_SERVER             ldap.ccs.miami.edu

    
</entry>
<entry [Wed 2012:01:11 10:45:45 EST] DYNAMICALLY EXPAND VOLUME SIZE WHILE WORKFLOWS ARE RUNNING>

1. CREATE SNAPSHOT OF VOLUME, CREATE NEW VOLUME AND MOUNT

E.G.:
http://aws-musings.com/how-to-expand-your-ebs-volume/

PROBLEMS: CAN'T EASILY DO THIS WHILE PROCESS IS RUNNING. NEED TO
    
    A) INCREMENTALLY EXPAND BY ADDING NEW VOLUMES AS SUBDIRECTORIES
    
    B) PAUSE BETWEEN WORKFLOW STAGES AND SWAP OUT OLD WITH EXPANDED NEW VOLUME


</entry>
<entry [Wed 2012:01:11 11:09:32 EST] CAN'T DO USER-SPECIFIC WORKFLOW SHARING ON GITHUB - USE GITOLITE?>

CURRENTLY, GITHUB DOESN'T ALLOW USER-SPECIFIC CONTROL OF VIEWING PUBLIC REPOS

GITHUB DOES ALLOW CONTROL AT THE FORKER LEVEL


OPTIONAL: ADD AMAZON USERID ACCESS CONTROL


</entry>
<entry [Wed 2012:01:11 10:26:29 EST] DATA SHARING CONTROL USING AMAZON EC2 USERID>

SHARER USES AGUA TO ADD USERIDS WHO CAN ACCESS THE SNAPSHOT IN Admin PANE Snapshots PANEL


How to share snapshots

Snapshots can be shared using AWS Management Console or using API calls. You have full control over what accounts you share each snapshot with, including the option to share it with the entire AWS community.

AWS Management Console:
Create a new Amazon EBS volume and copy only the files that you wish to share on to that volume
Log in to the AWS Management Console, click the Amazon EC2 tab and click Volumes on the left navigation pane
Right click on the volume and create a snapshot
Click on Snapshots on the left navigation pane
Right-click on the snapshot you wish to share and select Snapshot permissions
Add the AWS account numbers of the developers who you want to grant access or share it publicly
Hit Save to apply the permissions
    
</entry>
<entry [Wed 2012:01:11 00:35:15 EST] EC2 AND S3 COST CALCULATOR>

http://calculator.s3.amazonaws.com/calc5.html?
Sources: http://www.amazon.com/b/ref=sc_fe_c_0_370375011_1/105-2628125-0034036?ie=UTF8&node=201590011&no=370375011

    
</entry>
<entry [Mon 2012:01:09 18:06:50 EST] GOOGLE CUSTOM SEARCH>


<!--

<div id="cse" style="width: 100%;">Loading</div>
<script src="http://www.google.com/jsapi" type="text/javascript"></script>
<script type="text/javascript"> 
  google.load('search', '1', {language : 'es'});
  google.setOnLoadCallback(function() {
    var customSearchControl = new google.search.CustomSearchControl(
      '005414257212850414421:q83zbakv0ok');

    customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
    customSearchControl.draw('cse');
  }, true);
</script>
<link rel="stylesheet" href="http://www.google.com/cse/style/look/default.css" type="text/css" />
      
-->    

</entry>
<entry [Mon 2012:01:09 09:31:48 EST] RAN Package.t TESTS>

reset; ./Package.t --login syoung --token 4416b765217a3c3de1ed99938ffe25e0 --keyfile /root/.ssh/idents/github.com/id_rsa --owner syoung

WHICH RUNS:

/agua/0.6/bin/logic/ops.pl testversion install  --owner syoung --repository testversion --installdir /agua/0.6/t/cgi-bin/package/targetdir --logfile /agua/0.6/t/cgi-bin/package/targetdir/updateapp.log --version 0.2 --login syoung --token 4416b765217a3c3de1ed99938ffe25e0


CHECK TAGS CREATED CORRECTLY:

curl -F "login=syoung" -F "token=4416b765217a3c3de1ed99938ffe25e0" http://github.com/api/v2/json/repos/show/syoung/testversion/tags | /agua/0.6/bioapps/bin/utils/pretty.pl 

{
   "tags" : {
      "0.3" : "df15d012687175ef36b7b4bb625dd35fbdeadeb1",
      "0.2" : "78107f1fe323b815f7a1a7e7076519148848d67d",
      "0.1" : "f1d196554b62e659b8f7a8c3c121358c6487c9aa",
      "0.4" : "4aaf4533268317c6dec6a29f1192f0c04c6d7f71",
      "0.5" : "6aa3ca38199a55b66b27bda22a8f137a81add924"
   }
}




    
</entry>
<entry [Sun 2012:01:08 18:10:39 EST] FIXED ERROR: '{"error":"not authorized"}' WITH FORK>

SOLUTION:

CHANGED biorepository TO PUBLIC

curl -F 'login=stuartpyoung' -F 'token=a359152dd81fbd744a86128c0be5a764' https://github.com/api/v2/json/repos/fork/syoung/biorepository

{
   "repository" : {
      "size" : 656,
      "watchers" : 1,
      "created_at" : "2012/01/08 15:10:04 -0800",
      "url" : "https://github.com/stuartpyoung/biorepository",
      "open_issues" : 0,
      "owner" : "stuartpyoung",
      "has_downloads" : "true",
      "has_issues" : "false",
      "language" : "Perl",
      "private" : "false",
      "name" : "biorepository",
      "has_wiki" : "true",
      "pushed_at" : "2011/11/21 15:05:48 -0800",
      "description" : "Biorepository description",
      "forks" : 0,
      "homepage" : "",
      "fork" : "true"
   }
}


</entry>
<entry [Sun 2012:01:08 17:43:43 EST] FIXED ERROR: 'No database selected' IN Package.t>

PROBLEM:

DBD::mysql::st execute failed: No database selected at /agua/0.6/t/cgi-bin/package/../../../lib/Agua/DBase/MySQL.pm line 274.
DBD::mysql::st fetchrow failed: fetch() without execute() at /agua/0.6/t/cgi-bin/package/../../../lib/Agua/DBase/MySQL.pm line 280.


DIAGNOSIS:

USING WRONG MYSQL PASSWORD


SOLUTION:

GET TESTUSER PASSWORD FROM CONF


</entry>
<entry [Wed 2012:01:04 00:53:53 EST] RENEWED www.stuartpyoung.com DOMAIN NAME>

https://www.helpinghost.com/cgi-bin/osrs/renew.cgi

Order Results
Information regarding the status of your order is included below. Please examine the status information to check for renewal errors, and note the Order ID for future reference.
Domain: 	 stuartpyoung.com
Expires: 	 2013-11-18 05:05:42
Auto-Renew: 	 No
Order ID: 	 119758199
Result: 	 Command completed successfully

Following is a summary of your order total. Please print this page for your records.

Item 	 Per Year	 Years	 Subtotal
   stuartpyoung.com	 14.95	 1	 14.95
Subtotal:	14.95
Order Total:	$14.95

    
</entry>
<entry [Sun 2012:01:01 06:30:53 EST] REFACTORED appversion TABLE INTO package TABLE>


CREATE TABLE IF NOT EXISTS package
(
    username        VARCHAR(30) NOT NULL,
    package         VARCHAR(40) NOT NULL,
    version         VARCHAR(30) NOT NULL,
    build           VARCHAR(30) NOT NULL,
    opsdir          VARCHAR(255) NOT NULL,
    installdir      TEXT,
    description     TEXT,
    notes           TEXT,
    url             TEXT,
    datetime        DATETIME NOT NULL,
    
    PRIMARY KEY  (username, package, version, build)
);


INSERT INTO `package` VALUES
('syoung', 'bioapps', '2357e69','00009', '/agua/AGUAVERSION/repos/biorepository','/agua/AGUAVERSION/bioapps', '', '', '', '2011-11-20 23:32:06'),

('syoung', 'agua', '0.6','00284', '/agua/AGUAVERSION/repos/biorepository','/agua', '', '', '', '2011-11-19 22:41:02'),

('syoung','testversion', '0.2', '', '/agua/0.6/t/cgi-bin/version/ops','/agua/0.6/t/cgi-bin/version/targetdir', '', '', '', '2011-11-22 02:48:25');


NOTES
-----

OLD VERSION AS appversion:

CREATE TABLE IF NOT EXISTS appversion
(
    username        VARCHAR(30) NOT NULL,
    login           VARCHAR(30) NOT NULL,
    application     VARCHAR(30) NOT NULL,
    opsdir          VARCHAR(255) NOT NULL,
    installdir      TEXT,
    version         VARCHAR(30) NOT NULL,
    build           VARCHAR(30) NOT NULL,
    datetime        DATETIME NOT NULL,
    
    PRIMARY KEY (username, login, application, opsdir)
);
    
</entry>
