agua.archive.4


<entry [Fri 2011:08:05 00:49:18 EST] FIXED Admin Parameters DND SOURCE PROBLEM>

HAD TO FIND dojo.dnd.Source OBJECT HERE:

postCreate : function() {
	console.log("Controller.postCreate    plugins.admin.Controller.postCreate()");
	this.dragSource = this._startupWidgets[3];
    ...
}

NOTES
------

REPARSING MANUALLY

Setting parseOnLoad to false instead of true.
Defining a 'reparse' function that set the new dojoType on the appropriate DOM nodes and reparsing the appropriate DOM subtree (using dojo.parser.parse).
Calling reparse in the dojo.ready function and after every Ajax re-render.
    
</entry>
<entry [Tue 2011:08:02 02:51:31 EST] AWS REMOVED UPLOAD FEE!>

AWS Newsletter - July 2011

Dear AWS Community,

In this month’s newsletter, we are excited to remind you that we’ve recently lowered our data transfer pricing – removing the internet data transfer in fee and lowering the outbound fees across all usage tiers. We have also lowered prices for Amazon CloudFront, our content delivery network, and added another edge location in Europe – totaling 19 worldwide locations. In addition, based on customer request, you can now bid on Amazon EC2 Spot Instances at the Availability Zone level. This newsletter also highlights some of the exciting announcements in the AWS Solutions Provider ecosystem, including Red Hat Enterprise Linux (RHEL) and Rocks+ instances now available on Amazon EC2.

    * News & Announcements
          o New Data Transfer Pricing
          o Amazon EC2 Spot Price for Availability Zones
          o AWS Elastic Beanstalk Announces Configuration Persistence and Support for URL Swapping
          o Release of Amazon EC2 VM Import Connector vApp Version 1.1
          o New Edge Location for Amazon CloudFront and Amazon Route 53
          o Customer Feedback on the AWS Management Console
          o Amazon Mechanical Turk Masters
          o AWS Start-up Challenge 2011 and Summer of Start-ups
          o Featured Case Study: PSR
    * AWS Solutions Provider News
    * Online Events
    
</entry>
<entry [Thu 2011:07:28 08:51:45 EST] COMPLETED ELAND PIPELINE>

1 	FTP 	Queued 		Lapsed 	
Status 	completed 	Started 	2011-08-02 03:58:26 	Output 	/nethome/syoung/agua/Project1/Workflow1/stdout/1-FTP.stdout
Duration 	0 hours 1 min 43 sec 	Ended 	2011-08-02 04:00:09 	Errors 	/nethome/syoung/agua/Project1/Workflow1/stderr/1-FTP.stderr
2 	unzipFiles 	Queued 		Lapsed 	
Status 	completed 	Started 	2011-08-02 04:02:27 	Output 	/nethome/syoung/agua/Project1/Workflow1/stdout/2-unzipFiles.stdout
Duration 	0 hours 3 min 19 sec 	Ended 	2011-08-02 04:05:46 	Errors 	/nethome/syoung/agua/Project1/Workflow1/stderr/2-unzipFiles.stderr
3 	createRefDirs 	Queued 		Lapsed 	
Status 	completed 	Started 	2011-08-02 04:08:01 	Output 	/nethome/syoung/agua/Project1/Workflow1/stdout/3-createRefDirs.stdout
Duration 	0 hours 0 min 4 sec 	Ended 	2011-08-02 04:08:05 	Errors 	/nethome/syoung/agua/Project1/Workflow1/stderr/3-createRefDirs.stderr
4 	elandIndex 	Queued 		Lapsed 	
Status 	completed 	Started 	2011-08-02 04:09:03 	Output 	/nethome/syoung/agua/Project1/Workflow1/stdout/4-elandIndex.stdout
Duration 	0 hours 1 min 13 sec 	Ended 	2011-08-02 04:10:16 	Errors 	/nethome/syoung/agua/Project1/Workflow1/stderr/4-elandIndex.stderr
5 	elandHeader 	Queued 		Lapsed 	
Status 	completed 	Started 	2011-08-02 04:14:50 	Output 	/nethome/syoung/agua/Project1/Workflow1/stdout/5-elandHeader.stdout
Duration 	0 hours 0 min 21 sec 	Ended 	2011-08-02 04:15:11 	Errors 	/nethome/syoung/agua/Project1/Workflow1/stderr/5-elandHeader.stderr
6 	ELAND 	Queued 		Lapsed 	
Status 	completed 	Started 	2011-08-02 08:03:29 	Output 	/nethome/syoung/agua/Project1/Workflow1/stdout/6-ELAND.stdout
Duration 	23 hours 56 min 14 sec 	Ended 	2011-08-03 07:59:43 	Errors 	/nethome/syoung/agua/Project1/Workflow1/stderr/6-ELAND.stderr

HISTORY:

/nethome/bioinfo/apps/agua/0.4/bin/apps/utils/deepvac.pl
--url http://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/
--regex chr[0-9MYX]+.fa.gz
--type html






NOTES
-----
SHIFTED OUPUT DATA TO /data PARTITION BECAUSE OF LACK OF SPACE ON /nethome:

cd /nethome/syoung/agua/Project1/Workflow1/aligned
mv chr1 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr2 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr3 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr4 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr5 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr6 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr7 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr8 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr9 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr10 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr11 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr12 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr13 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr14 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr15 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr16 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr17 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr18 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr19 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr20 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr21 /data/syoung/agua/Project1/Workflow1/aligned/
mv chr22 /data/syoung/agua/Project1/Workflow1/aligned/
mv chrY /data/syoung/agua/Project1/Workflow1/aligned/
mv chrX /data/syoung/agua/Project1/Workflow1/aligned/
mv chrM /data/syoung/agua/Project1/Workflow1/aligned/


LINKED BACK TO /nethome:

ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr1 /nethome/syoung/agua/Project1/Workflow1/aligned/chr1
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr2 /nethome/syoung/agua/Project1/Workflow1/aligned/chr2
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr3 /nethome/syoung/agua/Project1/Workflow1/aligned/chr3
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr4 /nethome/syoung/agua/Project1/Workflow1/aligned/chr4
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr5 /nethome/syoung/agua/Project1/Workflow1/aligned/chr5
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr6 /nethome/syoung/agua/Project1/Workflow1/aligned/chr6
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr7 /nethome/syoung/agua/Project1/Workflow1/aligned/chr7
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr8 /nethome/syoung/agua/Project1/Workflow1/aligned/chr8
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr9 /nethome/syoung/agua/Project1/Workflow1/aligned/chr9
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr10 /nethome/syoung/agua/Project1/Workflow1/aligned/chr10
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr11 /nethome/syoung/agua/Project1/Workflow1/aligned/chr11
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr12 /nethome/syoung/agua/Project1/Workflow1/aligned/chr12
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr13 /nethome/syoung/agua/Project1/Workflow1/aligned/chr13
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr14 /nethome/syoung/agua/Project1/Workflow1/aligned/chr14
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr15 /nethome/syoung/agua/Project1/Workflow1/aligned/chr15
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr16 /nethome/syoung/agua/Project1/Workflow1/aligned/chr16
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr17 /nethome/syoung/agua/Project1/Workflow1/aligned/chr171/
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr18 /nethome/syoung/agua/Project1/Workflow1/aligned/chr18
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr19 /nethome/syoung/agua/Project1/Workflow1/aligned/chr19
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr20 /nethome/syoung/agua/Project1/Workflow1/aligned/chr20
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr21 /nethome/syoung/agua/Project1/Workflow1/aligned/chr21
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chr22 /nethome/syoung/agua/Project1/Workflow1/aligned/chr22
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chrY /nethome/syoung/agua/Project1/Workflow1/aligned/chrY
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chrX /nethome/syoung/agua/Project1/Workflow1/aligned/chrX
ln -s /data/syoung/agua/Project1/Workflow1/aligned/chrM /nethome/syoung/agua/Project1/Workflow1/aligned/chrM

    
</entry>
<entry [Thu 2011:07:28 08:15:06 EST] NICE REGISTRATION PAGE>

https://posterous.com/
    
</entry>

<entry [Thu 2011:07:28 00:08:47 EST] DIFFERENTIATE BETWEEN DOUBLE- AND SINGLE-CLICK>

http://dojo-toolkit.33424.n3.nabble.com/How-to-connect-to-DOUBLE-CLICK-on-TREE-NODE-td175492.html

I think what you need is discussed here: 
http://www.nabble.com/How-to-open-a-node-of-a-Tree-without-knowing-the-%22node%22-element--to18728650.html#a18733240

Regards, 
Chris 

lukess wrote:
Hi, 
   I am also trying to do the same thing, the way i have done is : 
dojo.byId("ftree"); 
          dojo.connect(valu.domNode,'ondblclick',"pressed"); 
where pressed is the function, but i am unable  to find the parent of that node. Could you tell me how to find the parent information of that node. 

cheers, 
... [show rest of quote]
vaibhav saxena-3 Reply | Threaded | More       
Jul 31, 2008; 1:48am Re: How to connect to DOUBLE-CLICK on TREE?

2 posts
Hi lukess, 

On click of the press you will be taken to the function that you defined in 
dojo.connect. You need to have an argument in function like 

pressed = function(e) 
{ 
        ... body goes here 
} 

E is the event automatically passed when you click press. Now look in the 
code below 

pressed = function(e) 
{ 
        Var targ = e.target; 
        
        //get parent node information 
        Var parentNode = targ.parentNode; 
} 

Now parentNode is presenting your parent node. You can get any information 
out of this. 

Cheers, 
Vaibhav 




http://www.2demanding.com/blog/?p=132

Alen Stojanov's Home Page and Weblog
Personal info, news, programming stuff, whatever
Dojo and implementation of single and double click on one DOM node
leave a comment

The diversity of browsers and the fact that IE has always tried to oppose the web standards has made it quite hard to implement single and double click on a particular DOM node. This small tutorial explains how those actions can be attached to any node, as well as “onMouseMove” event.

The real challenge in this task is the fact that every browser detects the click / double click event in a different fashion and most of the browsers treat double click as having two single clicks, firing the proper events. IE8 does this differently as well.

Chrome / Opera / Mozilla :

mousedown
mouseup
click
mousedown
mouseup
click
doubleclick
IE8+:

mousedown
mouseup
click
mousedown
mouseup
click
doubleclick
The only way to go around this is to register “onmousedown”, “onmouseup” and “onmousemove” events, and use a particular delay to detect whether a single or double click has been executed, or whether the mouse is in a “move” state. We should also be careful, because IE8+ does not behave well when event objects are copied, thus we should use dojo.mixin(), to create shallow copies of the event objects just before passing them to our handlers. Code snipper is available bellow:

dojo.declare("TestClass", [dijit._Widget], {

dojo.declare("TestClass", [dijit._Widget], {

    // The DOM node where the events have to be attached
    _userDOMNode: null,

    // _leftClickDef : dojo.Deferred
    //        Ensure sequential execution of the left clicks
    _leftClickDef: null,    

    // _mouseState : String ["down", "up", "move", "none"]
    //        Define the mouse state
    _mouseState: "none", 

    // _preMouseState : String ["down", "up", "move", "none"]
    //         Define a previous state, used for double click
    _preMouseState: "none",

    // _dblClickDelay, _movMouseDelay : Int
    //        Define the double click delay used on the body and the delay
    //        for the mouse movement state in milliseconds
    _dblClickDelay : 300,
    _movMouseDelay : 100,

    // _initMouseMoveEvt : MouseEvent
    //        Save the initial event when the mouse moves
    _initMouseMoveEvt : null,

    _onMouseMove: function (e) {
        e.preventDefault();
        if ( e.button !== 2 ) { // LEFT CLICK
            if ( this._mouseState === "down" ) {
                this._leftClickDef.addCallback(dojo.hitch(this, function() {
                    // If the mouse is still moving and the button is still down
                    // and less then _movMouseDelay time passed, switch it to
                    // move mode.
                    var evt = dojo.mixin({}, e);
                    setTimeout(dojo.hitch(this, function () {
                        this._leftClickDef.addCallback(dojo.hitch(this, function() {
                            if ( this._mouseState === "down" ) {
                                this._mouseState = "move";
                                this._initMouseMoveEvt = evt;
                                this._onMove(evt, evt, "initial");
                            }
                        }));
                    }), this._movMouseDelay);
                }));
            } else if ( this._mouseState === "move") {
                var evt = dojo.mixin({}, e);
                this._onMove(this._initMouseMoveEvt, evt, "move");
                this._initMouseMoveEvt = evt;
            }
        }
    },

    _onMouseDown: function (e) {
        e.preventDefault();
        if ( e.button !== 2 ) {  // LEFT CLICK
            this._leftClickDef.addCallback(dojo.hitch(this, function() {
                this._mouseState = "down";
            }));
        }
    },

    _onMouseUp: function (e) {
        e.preventDefault();
        if ( e.button !== 2 ) {  // LEFT CLICK
            this._leftClickDef.addCallback(dojo.hitch(this, function() {
                // finish drag and drop (object is released)
                if ( this._mouseState === "move" ) {
                    // do the final move state
                    this._onMove(this._initMouseMoveEvt, e, "final");
                    // cleanup
                    this._resetMouseState();
                    return;
                }

                // perform the double click
                if ( this._preMouseState === "up") {
                    this._onDoubleClick(e);
                    this._resetMouseState();
                    return;
                }

                if ( this._mouseState === "down" ) {
                    // clone only the neccessary stuff for the event
                    var evt = dojo.mixin({}, e);
                    setTimeout(dojo.hitch(this, function () {
                        this._leftClickDef.addCallback(dojo.hitch(this, function() {
                            if ( this._mouseState === "up" ) {
                                // finally perform the single click
                                this._onSingleClick (evt);
                                // clear state space
                                this._resetMouseState();
                            }
                        }));
                    }), this._dblClickDelay);
                }
                // this might also lead to an another click, thus:
                this._preMouseState = "up";
                this._mouseState = "up";
            }));
        }
    },

    _resetMouseState: function () {
        this._mouseState    = "none";
        this._preMouseState = "none";
    },

    _onMove: function(initEvt, evt, evtType) {
        if ( evtType == "initial" ) {
            // do smth
        } else if ( evtType == "final" ) {
            // do smth
        } else {
            // do smth
        }
    },

    _onSingleClick: function (e) {
        // execute single click
    },

    _onDoubleClick: function () {
        // execute double click
    },

    init: function () {
        // create the deferred
        this._leftClickDef = new dojo.Deferred();
        // make sure that the df has been called, and now we can attach callbacks
        this._leftClickDef.callback({success: true});
        // attach the callbacks
        dojo.connect (this._userDOMNode, "onmousedown", this, this._onMouseDown);
        dojo.connect (this._userDOMNode, "onmousemove", this, this._onMouseMove);
        dojo.connect (this._userDOMNode, "onmouseup"  , this, this._onMouseUp);
    }
}
    
</entry>
<entry [Wed 2011:07:27 07:56:32 EST] SAM FILE MERGE STRATEGIES>



TOPHAT


	###############################################
	##########    CHROMOSOME SAM FILES    #########
	###############################################
	#### OBJECTIVE: CREATE ONE .sam FILE PER CHROMOSOME
	#### FROM THE SMALL .sam FILES CREATED FOR EACH
	#### INPUT SPLIT FILE
	####
	#### STRATEGY 1: USE BAM FILE INTERMEDIARY
	####	
	#### 	1. CONVERT chr*/< NUMBER> SUBDIR SAM FILES INTO BAM FILES
	#### 	2. MERGE BAM FILES INTO A SINGLE BAM FILE AND SORT IT
	#### 	3. CONVERT SINGLE BAM FILE INTO A SAM FILE
	####
	#### STRATEGY 2: SORT MERGED SAM FILE
	####	
	#### 	1. MERGE SAM FILES INTO SINGLE SAM FILE
	#### 	2. SORT SAM FILES WITH sort
	#### 	

	###############################################
	####  ******      STRATEGY 1       ******  ####
	####         BAM FILE INTERMEDIARY         ####
	###############################################	
	print "Expression::TOPHAT::run    Doing STRATEGY 1: USE BAM FILE INTERMEDIARY\n";

		###############################################
		##########    CONVERT SAM TO BAM     ##########
		###############################################
		print "Expression::TOPHAT::run    Doing subdirSamToBam     ", Timer::current_datetime(), "\n";
		$self->subdirSamToBam($outputdir, $references, $splitfiles, "accepted_hits.sam");
		print "Expression::TOPHAT::run    After subdirSamToBam     ", Timer::current_datetime(), "\n";
		
		####################################################
		###############   CUMULATIVE MERGE BAM    ##########
		####################################################
		######print "Expression::TOPHAT::run    Doing cumulativeMergeBam     ", Timer::current_datetime(), "\n";
		######$self->cumulativeMergeBam($outputdir, $references, $splitfiles, "accepted_hits.bam", "accepted_hits.bam");
		######print "Expression::TOPHAT::run    After cumulativeMergeBam     ", Timer::current_datetime(), "\n";
	
		##############################################
		#########     PYRAMID MERGE BAM     ##########
		##############################################
		print "Expression::TOPHAT::run    Doing cumulativeMergeBam     ", Timer::current_datetime(), "\n";
		$self->pyramidMergeBam($outputdir, $references, $splitfiles, "accepted_hits.bam", "out.bam");
		print "Expression::TOPHAT::run    After cumulativeMergeBam     ", Timer::current_datetime(), "\n";
			
		###############################################
		##########         SORT BAM         ##########
		###############################################
		print "Expression::TOPHAT::run    Doing sortBam     ", Timer::current_datetime(), "\n";
		$self->sortBam($outputdir, $references, "out.bam", "out.bam");
		print "Expression::TOPHAT::run    After sortBam     ", Timer::current_datetime(), "\n";
		
		##############################################
		#########         BAM TO SAM        ##########
		##############################################
		print "Expression::TOPHAT::run    Doing bamToSam     ", Timer::current_datetime(), "\n";
		$self->bamToSam($outputdir, $references, "out.bam", "out.sam");
		print "Expression::TOPHAT::run    After bamToSam     ", Timer::current_datetime(), "\n";
		
		print "Expression::TOPHAT::run    Completed STRATEGY 1: USE BAM FILE INTERMEDIARY\n";
	
	###################################################
	########  ******      STRATEGY 2       ******  ####
	########         SORT MERGED SAM FILE          ####
	###################################################	
	#####print "Expression::TOPHAT::run    Doing STRATEGY 2: SORT MERGED SAM FILE\n";
	####	
	####	################################################
	####	###########   CUMULATIVE MERGE SAM    ##########
	####	################################################
	####	#print "Expression::TOPHAT::run    Doing mergeSam     ", Timer::current_datetime(), "\n";
	####	#$self->cumulativeMergeSam($outputdir, $references, $splitfiles, "accepted_hits.sam", "out.sam");
	####	#print "Expression::TOPHAT::run    After mergeSam     ", Timer::current_datetime(), "\n";
	####
	####	################################################
	####	###########         SORT SAM         ###########
	####	################################################
	####	#print "Expression::TOPHAT::run    Doing sortSam     ", Timer::current_datetime(), "\n";
	####	#$self->sortSam($outputdir, $references, "out.sam");
	####	#print "Expression::TOPHAT::run    After sortSam     ", Timer::current_datetime(), "\n";
	####
	####	###############################################
	####	##########         SORT SAM         ###########
	####	###############################################
	####	#print "Expression::TOPHAT::run    Doing samToBam     ", Timer::current_datetime(), "\n";
	####	#$self->samToBam($outputdir, $references, "out.sam", "out.bam");
	####	#print "Expression::TOPHAT::run    After samToBam     ", Timer::current_datetime(), "\n";
	####	#
	####	#print "Expression::TOPHAT::run    Completed STRATEGY 2: SORT MERGED SAM FILE\n";
	####	#


	#################################################
	############         CUFFLINKS         ##########
	#################################################
	#print "Expression::TOPHAT::run    Doing runCufflinks     ", Timer::current_datetime(), "\n";
	#$self->runCufflinks($outputdir, $references, "out.sam");
	#print "Expression::TOPHAT::run    After runCufflinks     ", Timer::current_datetime(), "\n";



BOWTIE

	###############################################
	##########    CHROMOSOME SAM FILES    #########
	###############################################
	#### OBJECTIVE: CREATE ONE .sam FILE PER CHROMOSOME
	#### FROM THE SMALL .sam FILES CREATED FOR EACH
	#### INPUT SPLIT FILE
	####
	#### STRATEGY 1: USE BAM FILE INTERMEDIARY
	####	
	#### 	1. CONVERT chr*/< NUMBER> SUBDIR SAM FILES INTO BAM FILES
	#### 	2. MERGE BAM FILES INTO A SINGLE BAM FILE AND SORT IT
	#### 	3. CONVERT SINGLE BAM FILE INTO A SAM FILE
	####
	#### STRATEGY 2: SORT MERGED SAM FILE
	####	
	#### 	1. MERGE SAM FILES INTO SINGLE SAM FILE
	#### 	2. SORT SAM FILES WITH sort
	#### 	

	###############################################
	####  ******      STRATEGY 1       ******  ####
	####         BAM FILE INTERMEDIARY         ####
	###############################################	
	#print "BOWTIE::run    Doing STRATEGY 1: USE BAM FILE INTERMEDIARY\n";

	################################################
	###########    CONVERT SAM TO BAM     ##########
	################################################
	#print "BOWTIE::run    Doing subdirSamToBam     ", Timer::current_datetime(), "\n";
	#$self->subdirSamToBam($outputdir, $references, $splitfiles, "accepted_hits.sam");
	#print "BOWTIE::run    After subdirSamToBam     ", Timer::current_datetime(), "\n";
	
	################################################
	###########   CUMULATIVE MERGE BAM    ##########
	################################################
	##print "BOWTIE::run    Doing cumulativeMergeBam     ", Timer::current_datetime(), "\n";
	##$self->cumulativeMergeBam($outputdir, $references, $splitfiles, "accepted_hits.bam", "accepted_hits.bam");
	##print "BOWTIE::run    After cumulativeMergeBam     ", Timer::current_datetime(), "\n";
	#
	###############################################
	##########     PYRAMID MERGE BAM     ##########
	###############################################
	#print "BOWTIE::run    Doing cumulativeMergeBam     ", Timer::current_datetime(), "\n";
	#$self->pyramidMergeBam($outputdir, $references, $splitfiles, "accepted_hits.bam", "out.bam");
	#print "BOWTIE::run    After cumulativeMergeBam     ", Timer::current_datetime(), "\n";
	#
	################################################
	###########         SORT BAM         ##########
	################################################
	#print "BOWTIE::run    Doing sortBam     ", Timer::current_datetime(), "\n";
	#$self->sortBam($outputdir, $references, "out.bam", "out.sam");
	#print "BOWTIE::run    After sortBam     ", Timer::current_datetime(), "\n";
	#
	#
	################################################
	###########         BAM TO SAM        ##########
	################################################
	#print "BOWTIE::run    Doing bamToSam     ", Timer::current_datetime(), "\n";
	#$self->bamToSam($outputdir, $references);
	#print "BOWTIE::run    After bamToSam     ", Timer::current_datetime(), "\n";
	#
	#print "BOWTIE::run    Completed STRATEGY 1: USE BAM FILE INTERMEDIARY\n";



		###############################################
		####  ******      STRATEGY 2       ******  ####
		####         SORT MERGED SAM FILE          ####
		###############################################	
		#print "BOWTIE::run    Doing STRATEGY 2: SORT MERGED SAM FILE\n";
		
		################################################
		###########         MERGE SAM         ##########
		################################################
		#print "BOWTIE::run    Doing mergeSam     ", Timer::current_datetime(), "\n";
		#$self->pyramidMergeSam($outputdir, $references, $splitfiles, "accepted_hits.sam", "out.sam");
		#print "BOWTIE::run    After mergeSam     ", Timer::current_datetime(), "\n";
	
		################################################
		###########         SORT SAM         ###########
		################################################
		#print "BOWTIE::run    Doing sortSam     ", Timer::current_datetime(), "\n";
		#$self->sortSam($outputdir, $references, "hit.sam");
		#print "BOWTIE::run    After sortSam     ", Timer::current_datetime(), "\n";
	
		###############################################
		##########         SORT SAM         ###########
		###############################################
		#print "BOWTIE::run    Doing samToBam     ", Timer::current_datetime(), "\n";
		#$self->samToBam($outputdir, $references, "out.sam", "out.bam");
		#print "BOWTIE::run    After samToBam     ", Timer::current_datetime(), "\n";
		#
		#print "BOWTIE::run    Completed STRATEGY 2: SORT MERGED SAM FILE\n";
		#



    
</entry>
<entry [Wed 2011:07:27 05:21:29 EST] TROUBLESHOOTING ELAND CONVERSION TO Moose>
    
export SGE_ROOT=/opt/sge6; export SGE_CELL=; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; perl /agua/0.6/bin/apps/aligners/ELAND.pl --inputfile /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_1.1M.sequence.eland-1.txt --inputtype fastq --label eland-1 --matefile /nethome/syoung/agua/Project1/Workflow1/yoruba1-1.reads_2.1M.sequence.eland-1.txt --outputdir /nethome/syoung/agua/Project1/Workflow1 --referencedir /nethome/syoung/agua/Project1/Workflow1/eland --species human


1> /nethome/syoung/agua/Project1/Workflow1/stdout/5-ELAND.stdout 2> /nethome/syoung/agua/Project1/Workflow1/stderr/5-ELAND.stderr


STDOUT FILES

/nethome/syoung/agua/Project1/Workflow1/stdout/5-ELAND.stdout
/nethome/syoung/agua/Project1/Workflow1/stderr/5-ELAND.stderr


INTERMEDIATE FILES

reanalysis_1_eland_query.txt
reanalysis_1_qseq.txt
reanalysis_2_eland_extended.txt
reanalysis_2_eland_query.txt
reanalysis_2_qseq.txt
reanalysis_genomesize.xml
reanalysis_pair.xml



FIXED ELAND genomesize.xml FILE CREATION - SET eland-genome TO CORRECT FOLDER

/data/apps/casava/1.6.0/bin/ELAND_standalone.pl \
--input-type fastq \
--eland-genome /nethome/syoung/agua/Project1/Workflow1 \  <==== SHOULD BE 'eland' SUBFOLDER
--input-file /nethome/syoung/agua/Project1/Workflow1/1/eland-1_1.1.txt \
--input-file /nethome/syoung/agua/Project1/Workflow1/1/eland-1_2.1.txt \




alignment done for the moment User: 0s System: 0s Actual: 8e-06s Efficiency: 0%
... done User: 2.79s System: 2.63s Actual: 8.8411s Efficiency: 61.3046%
Run complete! Time now: Wed Jul 27 05:10:43 2011
/data/apps/casava/1.6.0/bin/ELAND_standalone.pl: eland succeded
/data/apps/casava/1.6.0/bin/ELAND_standalone.pl: About to run /data/apps/casava/1.6.0/bin/../bin/squashGenome /ne\
thome/syoung/agua/Project1/Workflow1 > ./reanalysis_genomesize.xml

User: 0s System: 0s Actual: 3e-06s Efficiency: 0%
Trying to open directory /nethome/syoung/agua/Project1/Workflow1 ...
 ... success, will output file sizes to XML
User: 0s System: 0s Actual: 0.000345s Efficiency: 0%
/data/apps/casava/1.6.0/bin/ELAND_standalone.pl: squashGenome succeded
/data/apps/casava/1.6.0/bin/ELAND_standalone.pl: About to run /data/apps/casava/1.6.0/bin/../bin/pickBestPair.pl \
--circular 32 32 ./reanalysis_1_eland_extended.txt  ./reanalysis_2_eland_extended.txt ./reanalysis_1_qseq.txt ./r\
eanalysis_2_qseq.txt ./reanalysis_1_calsaf.txt ./reanalysis_2_calsaf.txt ./reanalysis_anomaly.txt ./reanalysis_ge\
nomesize.xml > ./reanalysis_pair.xml

/data/apps/casava/1.6.0/bin/../bin/pickBestPair.pl: setting circular to Y
Use of uninitialized value $genomeSize in concatenation (.) or string at /data/apps/casava/1.6.0/lib/CASAVA-1.6.0\
/perl/Gerald/Common.pm line 1950.


=======================================================================
exit code: 65280
pickBestPair did not finish properly!

Exiting...
=======================================================================


    
</entry>
<entry [Wed 2011:07:27 05:01:34 EST] CONVERT BLAST TO GFF AT BIOSTAR SITE>

http://biostar.stackexchange.com/questions/277/how-to-convert-blast-results-to-gff
    

</entry>
<entry [Wed 2011:07:27 04:18:14 EST] sed CONVERSION OF FILEPATHS IN CASAVA 1.6.0>


cd /data/apps/casava/1.6.0
find . -type f | xargs sed -i -e 's/nethome\/syoung\/base\/apps/data\/apps/'

    
</entry>
<entry [Wed 2011:07:27 03:04:36 EST] FIXED DATA LOAD WITH RELOADER>

BAD:

data.Controller.startup plugins.data.Controller.startup()
data.Controller.startup Data: [object Object]
data.Controller.startup Data:
data.Controller.startup Data.data: [object Object]
GET http://ec2-174-129-137-49.compute-1.amazonaws.com/agua/0.6/plugins/workflow/info.json
GET http://ec2-174-129-137-49.compute-1.amazonaws.com/agua/0.6/plugins/workflow/info.json
	
GOOD:

data.Controller.startup plugins.data.Controller.startup()
data.Controller.startup Data: [object Object]
data.Controller.startup Data:
data.Controller.startup Data.data: undefined
data.Controller.getData plugins.data.Controller.getData()
data.Controller.getData Agua.dataUrl: undefined
PUT http://ec2-174-129-137-49.compute-1.amazonaws.com/cgi-bin/agua/0.6/workflow.cgi
PUT http://ec2-174-129-137-49.compute-1.amazonaws.com/cgi-bin/agua/0.6/workflow.cgi

    
    
</entry>
<entry [Sun 2011:07:24 04:47:55 EST] WINDOW TO WINDOW COMMUNICATION>

DONE WITH POPUPS:

PARENT PAGE:

<!--
<script language="JavaScript">

The main page that makes the popup:
Code:
<script language="JavaScript">

function myOpen(url)
  {
  // Code that opens the new child window
  }

</script>
<body>
<a href="#" onClick="myOpen('link/to/child.html');">Click this</a>
<form name="mainForm" action="do_something">
<input type="hidden" name="custName" value=""><br>
<input type="hidden" name="custAdd" value=""><br>
<input type="hidden" name="custPhone" value=""><br>
</form>
</body>

-->

CHILD PAGE:

mySubmit()
  {
  // opener is a reserved word that refers to the 
  // page that opened the current page.
  var mainPage = opener.document.mainForm;
  var childPage = document.myForm;

  mainPage.custName = childPage.myName;
  mainPage.custAdd  = childPage.myAdd;
  mainPage.custPhone = childPage.myPhone;

  // make opener focused and then close the child window
  opener.focus();
  self.close();
  }
<!--
</script>

<body>
<form name="myForm">
<input type="text" name="myName" value=""><br>
<input type="text" name="myAdd" value=""><br>
<input type="text" name="myPhone" value=""><br>
<input type="button" value="Finished">
</form>
</body>
    
-->

</entry>
<entry [Sun 2011:07:24 02:13:11 EST] REFACTORED Agua TO ABSTRACT OUT DATA CALLS>
    

KOMODO REGEX TO EXCLUDE METHOD CALLS IN PLUGINS

^\s*(?!\/).+Agua\.(?!cookie|toolbar|cgiUrl|get|tabs|.+Controller|add|updater|remove|toast|warning|error|_add|_remove|set|controllers|is|insert|copy|rename)


CURRENT 'LOOSE' Agua DATA SLOTS

dojo.clone(this.access)
dojo.clone(this.apps)
dojo.clone(this.aws)
dojo.clone(this.clusters)
dojo.clone(this.clusterworkflows)
dojo.clone(this.features)
dojo.clone(this.groupmembers)
dojo.clone(this.groups)
dojo.clone(this.headings)
dojo.clone(this.parameters)
dojo.clone(this.projects)
dojo.clone(this.regionzones)
dojo.clone(this.sharedparameters)
dojo.clone(this.sharedprojects)
dojo.clone(this.sharedsources)
dojo.clone(this.sharedstageparameters)
dojo.clone(this.sharedstages)
dojo.clone(this.sharedviewfeatures)
dojo.clone(this.sharedviews)
dojo.clone(this.sources)
dojo.clone(this.stageparameters)
dojo.clone(this.stages)
dojo.clone(this.users)
dojo.clone(this.viewfeatures)
dojo.clone(this.views)
dojo.clone(this.workflows)


KOMODO REGEX TO CONVERT ALL CLONE GETTERS TO ABSTRACT DATA CALL:

dojo\.clone\(this\.([^\)]+)\)
this.cloneData("\1")

TEST DATA:

	return dojo.clone(this.aws);
   	var users = dojo.clone(this.users);
 
    OK


KOMODO REGEX TO CONVERT ALL MUTATORS TO ABSTRACT MUTATORS:

this\._addObjectToArray\(this\.([^,]+)
this.addData("\1"

    ####return this._addObjectToArray(this.clusters, clusterObject, requiredKeys);
	return this.addData("clusters", clusterObject, requiredKeys);
    

this\._removeObjectFromArray\(this\.([^,]+)
this.removeData("\1"

???? THIS DIDN'T WORK
this\._removeArrayFromArray\(this\.([^,]+)
this.removeArrayFromData("\1"

removeArrayFromData : function (name, array, keys) {
	return this._removeArrayFromArray(this.data[name], array, keys);
},

TEST DATA:
	this._removeArrayFromArray(this.stageparameters, removeTheseStageParameters


_getIndexInArray 
    OK

_objectInArray
    OK
    


TEST GET/SET FUNCTIONS:

var data = new Object;
data.users = [{name:"Me"}];
var getData = function(name) {
    return data[name];
};
var setData = function(name, value) {
    data[name] = value;
};

var users = getData("users");
console.dir(users);

    name: "Me"

// THIS DOESN'T WORK
users = [{name:"Me"},{name:"You"}];
console.dir(data);

    users:
        name: "Me"

// HAVE TO USE SETTER
setData("users", users);
console.dir(data);

    users:
        name: "Me"
        name: "You"


TEST sortGroups
---------------

FAILURE CASE: DOESN'T WORK IF USE Agua.cloneData("groups")

var groups = Agua.getData("groups");
//groups = [{groupname:"bbb"},{groupname:"aaa"}];
var sortGroups = function () {
// DO NON-CASE SPECIFIC SORT
	groups = Agua.sortHasharray(groups, "notes");	
};
console.dir(data);
sortGroups();
console.dir(data);

    OK



    

</entry>
<entry [Sat 2011:07:23 09:04:18 EST] USE JSLINT TO TEST PARAMFUNCTIONS>

http://www.jslint.com/

var convert = function (inputfile, label) { 

    var suffix = inputfile.replace(/(.[^.]{1,5})$/); 
    inputfile.replace(/(.[^.]{1,5})$/, ""); 
    inputfile += label; 
    if ( suffix != null ) inputfile += suffix; 
    return inputfile;

}


</entry>
<entry [Fri 2011:07:22 23:46:27 EST] TEST RUN OF ELAND>


STAGE 3: indexEland    
{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"","mode":"executeWorkflow","number":"3"}

STAGE 4
{"username":"syoung","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","cluster":"","mode":"executeWorkflow","number":"4"}

export SGE_ROOT=/opt/sge6; export SGE_CELL=; export USERNAME=syoung; export QUEUE=syoung-Project1-Workflow1; export PROJECT=Project1; export WORKFLOW=Workflow1; perl /agua/0.6/bin/apps/aligners/ELAND.pl --inputfile /data/sequence/demo/ELAND/paired/inputs/s_1_1_sequence.100000.txt --inputtype fastq --label eland-1 --matefile /data/sequence/demo/ELAND/paired/inputs/s_1_2_sequence.100000.txt --outputdir /nethome/syoung/agua/Project1/Workflow1/eland --reads 10000 --referencedir /nethome/syoung/agua/Project1/Workflow1/eland --species human 1> /nethome/syoung/agua/Project1/Workflow1/stdout/4-ELAND.stdout 2> /nethome/syoung/agua/Project1/Workflow1/stderr/4-ELAND.stderr



NOTES
-----

PROBLEM
Could not identify index of the following line:
HWI-EAS185_1_20GVYAAXX_Jia_cDNA2_mtDNA_Total_Small_Medium_JH:1:16:527:816/1

SOLUTION




</entry>
<entry [Fri 2011:07:22 01:45:39 EST] FIXED TEXT WIDTH IN plugins.form.EditRow USING plugins.Common.insertTextBreaks>

var insertTextBreaks = function (text, width) {
// INSERT INVISIBLE UNICODE CHARACTER 
// LENGTH width IN THE TEXT
	console.log("Combo.insertTextBreaks    plugins.workflow.Workflow.insertTextBreaks(text, width)");
	console.log("Combo.insertTextBreaks    text: " + text);	
	console.log("Combo.insertTextBreaks    text.length: " + text.length);	
	console.log("Combo.insertTextBreaks    width: " + width);
	if ( this.textBreakWidth != null )	width = this.textBreakWidth;
	if ( width == null )	return;
	// SET INSERT CHARACTERS
	var insert = "\n";
	// FIRST, REMOVE ANY EXISTING INVISIBLE LINE BREAKS IN THE TEXT
//	text = this.removeTextBreaks(text);
	// SECOND, INSERT A "&#8203;" CHARACTER AT REGULAR INTERVALS
	var insertedText = '';
	var offset = 0;
	while ( offset < text.length )
	{
		var temp = text.substring(offset, offset + width);
		offset += width;
		insertedText += temp;
		//insertedText += "&#8203;"
		insertedText += insert;
	}
	console.log("Combo.insertTextBreaks    Returning insertedText: " + insertedText);
	return insertedText;
};

insertTextBreaks("\-\-inputfileasdasdfasssssssssssssssssss", "34");

    
</entry>
<entry [Thu 2011:07:21 20:38:17 EST] EWAN BIRNEY ON STATISTICS>

http://genomeinformatician.blogspot.com/2011/06/five-statistical-things-i-wished-i-had.html

    
</entry>
<entry [Thu 2011:07:21 20:22:02 EST] PARALLEL UPLOAD SCRIPT IN PYTHON>

http://bcbio.wordpress.com/tag/cloud-computing/

Posts Tagged ‘cloud-computing’

Parallel upload to Amazon S3 with python, boto and multiprocessing
with 13 comments

One challenge with moving analysis pipelines to cloud resources like Amazon EC2 is figuring out the logistics of transferring files. Biological data is big; with the rapid adoption of new machines like the HiSeq and decreasing sequencing costs, the data transfer question isn’t going away soon. The use of Amazon in bioinformatics was brought up during a recent discussion on the BioStar question answer site. Deepak’s answer highlighted the role of parallelizing uploads and downloads to ease this transfer burden. Here I describe a method to improve upload speed by splitting over multiple processing cores.

Amazon Simple Storage System (S3) provides relatively inexpensive cloud storage with their reduced redundancy storage option. S3, and all of Amazon’s cloud services, are accessible directly from Python using boto. By using boto’s multipart upload support, coupled with Python’s built in multiprocessing module, I’ll demonstrate maximizing transfer speeds to make uploading data less painful. The script is available from GitHub and requires the latest boto from GitHub (2.0b5 or better).

Parallel upload with multiprocessing
The overall process uses boto to connect to an S3 upload bucket, initialize a multipart transfer, split the file into multiple pieces, and then upload these pieces in parallel over multiple cores. Each processing core is passed a set of credentials to identify the transfer: the multipart upload identifier (mp.id), the S3 file key name (mp.key_name) and the S3 bucket name (mp.bucket_name).

01
import boto
02
 
03
conn = boto.connect_s3()
04
bucket = conn.lookup(bucket_name)
05
mp = bucket.initiate_multipart_upload(s3_key_name, reduced_redundancy=use_rr)
06
with multimap(cores) as pmap:
07
    for _ in pmap(transfer_part, ((mp.id, mp.key_name, mp.bucket_name, i, part)
08
                                  for (i, part) in
09
                                  enumerate(split_file(tarball, mb_size, cores)))):
10
        pass
11
mp.complete_upload()
The split_file function uses the unix split command to divide the file into sections, each of which will be uploaded separately.

1
def split_file(in_file, mb_size, split_num=5):
2
    prefix = os.path.join(os.path.dirname(in_file),
3
                          "%sS3PART" % (os.path.basename(s3_key_name)))
4
    split_size = int(min(mb_size / (split_num * 2.0), 250))
5
    if not os.path.exists("%saa" % prefix):
6
        cl = ["split", "-b%sm" % split_size, in_file, prefix]
7
        subprocess.check_call(cl)
8
    return sorted(glob.glob("%s*" % prefix))
The multiprocessing aspect is managed using a contextmanager. The initial multiprocessing pool is setup, using a specified number of cores, and configured to allow keyboard interrupts. We then return a lazy map function (imap) which can be used just like Python’s standard map. This transparently divides the function calls for each file part over all available cores. Finally, the pool is cleaned up when the map is finished running.

01
@contextlib.contextmanager
02
def multimap(cores=None):
03
    if cores is None:
04
        cores = max(multiprocessing.cpu_count() - 1, 1)
05
    def wrapper(func):
06
        def wrap(self, timeout=None):
07
            return func(self, timeout=timeout if timeout is not None else 1e100)
08
        return wrap
09
    IMapIterator.next = wrapper(IMapIterator.next)
10
    pool = multiprocessing.Pool(cores)
11
    yield pool.imap
12
    pool.terminate()
The actual work of transferring each portion of the file is done using two functions. The helper function, mp_from_ids, uses the id information about the bucket, file key and multipart upload id to reconstitute a multipart upload object:

1
def mp_from_ids(mp_id, mp_keyname, mp_bucketname):
2
    conn = boto.connect_s3()
3
    bucket = conn.lookup(mp_bucketname)
4
    mp = boto.s3.multipart.MultiPartUpload(bucket)
5
    mp.key_name = mp_keyname
6
    mp.id = mp_id
7
    return mp
This object, together with the number of the file part and the file itself, are used to transfer that section of the file. The file part is removed after successful upload.

1
@map_wrap
2
def transfer_part(mp_id, mp_keyname, mp_bucketname, i, part):
3
    mp = mp_from_ids(mp_id, mp_keyname, mp_bucketname)
4
    print " Transferring", i, part
5
    with open(part) as t_handle:
6
        mp.upload_part_from_file(t_handle, i+1)
7
    os.remove(part)
When all sections, distributed over all processors, are finished, the multipart upload is signaled complete and Amazon finishes the process. Your file is now available on S3.

Parallel download
Download speeds can be maximized by utilizing several existing parallelized accelerators:

axel
aria2
lftp
Combine these with the uploader to build up a cloud analysis workflow: move your data to S3, run a complex analysis pipeline on EC2, push the results back to S3, and then download them to local machines. Please share other tips and tricks you use to deal with Amazon file transfer in the comments.

Written by Brad Chapman
April 10, 2011 at 1:27 pm

    
</entry>
<entry [Thu 2011:07:21 05:54:25 EST] FIXED ERROR 'Component returned failure code: 0x80004005 (NS_ERROR_FAILURE)' >

DIAGNOSIS
CAUSED BY ERROR AFTER SELECTING TEXT AREA

SOLUTION
PUT ALL EDITING INSIDE 'TRY/CATCH' BLOCK?


TRIED IN build/011-workflow/dojo/workflow.js.uncompressed.js LINE 34,018:

		
    try {
        m.startDrag(this, nodes, this.copyState(dojo.isCopyKey(e), true));
    }
    catch (error) {

        console.log("workflow.js.uncompressed.js    dojo.dnd.Selector.onMouseMove    ERROR IN m.startDrag(this, nodes, this.copyState(dojo.isCopyKey(e), true))");

    }


TRIED IN  builds/012-admin/dojo/admin.js.uncompressed.js LINE 18601
BUT PROBLEM MOVED TO END OF SCRIPT AT LINE 11291 WHEN DRAGGING CURSOR OVER EDGE OF PARAMETER ROW IN Admin Parameter.


Error in dojo.dnd.Avatar construct method
Error in dojo.dnd.Avatar construct method
source.getItem(nodes[i].id) is undefined
[Break On This Error] var type = source.getItem(nodes[i].id).type;
admin....ssed.js (line 11291)


exception in animation handler for: beforeBegin
bootstrap.js (line 616)
[Exception... "Component returned failure code: 0x80004005 (NS_ERROR_FAILURE) [nsIDOMNSHTMLTextAreaElement.selectionStart]" nsresult: "0x80004005 (NS_ERROR_FAILURE)" location: "JS frame :: http://ec2-174-129-137-49.compute-1.amazonaws.com/agua/0.6/builds/012-admin/dojo/admin.js.uncompressed.js :: anonymous :: line 692" data: no]
[Break On This Error] console.error(e);
fx.js (line 154)
_t.curve is undefined
[Break On This Error] (668 out of range 568)


ALSO GOT THIS WHEN RIGHTCLICK MENU FAILED TO COME UP AFTER DRAGGING AND DROPPING elandHeader:

uncaught exception: [Exception... "Component returned failure code: 0x80004005 (NS_ERROR_FAILURE) [nsIDOMNSHTMLTextAreaElement.selectionStart]" nsresult: "0x80004005 (NS_ERROR_FAILURE)" location: "JS frame :: http://ec2-174-129-137-49.compute-1.amazonaws.com/agua/0.6/builds/012-admin/dojo/admin.js.uncompressed.js :: anonymous :: line 692" data: no]


WHICH IS IN dojo.mixin(dijit ...:


dojo.mixin(dijit, {
	// _curFocus: DomNode
	//		Currently focused item on screen
	_curFocus: null,

	// _prevFocus: DomNode
	//		Previously focused item on screen
	_prevFocus: null,

	isCollapsed: function(){
		// summary:
		//		Returns true if there is no text selected
		return dijit.getBookmark().isCollapsed;
	},

	getBookmark: function(){
		// summary:
		//		Retrieves a bookmark that can be used with moveToBookmark to return to the same range
		var bm, rg, tg, sel = dojo.doc.selection, cf = dijit._curFocus;

		if(dojo.global.getSelection){
			//W3C Range API for selections.
			sel = dojo.global.getSelection();
			if(sel){
				if(sel.isCollapsed){
					tg = cf? cf.tagName : "";
					if(tg){
						//Create a fake rangelike item to restore selections.
						tg = tg.toLowerCase();
						if(tg == "textarea" ||
								(tg == "input" && (!cf.type || cf.type.toLowerCase() == "text"))){
							sel = {
*** HERE *** ===>					   start: cf.selectionStart,



http://helpful.knobs-dials.com/index.php/0x80004005_(NS_ERROR_FAILURE)_and_other_firefox_errors

Reason

The direct reason is often that you have a XMLHttpRequest onerror handler in which you tried to read the result's status (or statusText) when that value is not available (usually meaning the connection was broken off, or it failed in a specific way).

The W3 specs tell you that you shouldn't try to read status in the onerror handler because for some problems it may not be set, and that in this case an error must (!) be raised when you read it.
This error is mostly specific to Gecko (Firefox, Mozilla) because it adheres to those specs closer than most other browsers. The Gecko docs also tell you not to do this (...as I recall, I can't actually find it right now).


The underlying cause is often that the browser never got a response with a HTTP status to parse out, for example because:
a connection broke because of some connectivity problem
a requests was broken off on the client (possibly specifically because...)
an ongoing AJAX call is canceled by page unload
(one somewhat common form of this is when you trigger AJAX from an input form that also causes a page-reload-style submission of the calling page (often a form with a submit-type button))
or sometimes a (seriously) malformed server response, such as
deformed data made by a dynamic script
no data at all (no HTTP headers, no body)
[edit]Fix

If this happens in your own handler code, the simplest fix is often wrapping the status read in a try-catch, since the error case should often go to "oh well then, forget it" code anyway.

If you use AJAX from some library (and implicitly its error handler), it's a bug in that library that has not yet been fixed, so google around for a fix, and bug its creator. If such a library it lets you write your own callbacks and its documentation didn't warn you about this, bug them about it too.

When caused by the form submission problem, you can usually avoid it fairly easily. One solution is to use only a < button>, < input type="button">, or anything else that looks clickable enough but does not submit the form (like a submit button would), so that the only event is the AJAXing.



    
</entry>
