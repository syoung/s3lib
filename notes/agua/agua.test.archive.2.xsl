agua.test.archive.2

<entry [Fri 2011:12:23 12:25:50 EST] REGEX TEXT REPLACEMENT IN MAKEFILE>

http://sunsite.ualberta.ca/Documentation/Gnu/make-3.79/html_chapter/make_8.html

$(patsubst pattern,replacement,text)
Finds whitespace-separated words in text that match pattern and replaces them with replacement. Here pattern may contain a `%' which acts as a wildcard, matching any number of any characters within a word. If replacement also contains a `%', the `%' is replaced by the text that matched the `%' in pattern. `%' characters in patsubst function invocations can be quoted with preceding backslashes (`\'). Backslashes that would otherwise quote `%' characters can be quoted with more backslashes. Backslashes that quote `%' characters or other backslashes are removed from the pattern before it is compared file names or has a stem substituted into it. Backslashes that are not in danger of quoting `%' characters go unmolested. For example, the pattern `the\%weird\\%pattern\\' has `the%weird\' preceding the operative `%' character, and `pattern\\' following it. The final two backslashes are left alone because they cannot affect any `%' character. Whitespace between words is folded into single space characters; leading and trailing whitespace is discarded. For example,
$(patsubst %.c,%.o,x.c.c bar.c)
produces the value `x.c.o bar.o'. Substitution references (see section 6.3.1 Substitution References) are a simpler way to get the effect of the patsubst function:
$(var:pattern=replacement)
is equivalent to
$(patsubst pattern,replacement,$(var))
The second shorthand simplifies one of the most common uses of patsubst: replacing the suffix at the end of file names.
$(var:suffix=replacement)
is equivalent to
$(patsubst %suffix,%replacement,$(var))
For example, you might have a list of object files:
objects = foo.o bar.o baz.o
To get the list of corresponding source files, you could simply write:
$(objects:.o=.c)
instead of using the general form:
$(patsubst %.o,%.c,$(objects))
    
</entry>
<entry [Fri 2011:12:23 11:43:57 EST] USE hexdump TO LOOK FOR BAD LINE ENDINGS>

PROBLEM:

make
    /bin/sh: Syntax error: end of file unexpected (expecting "done")
    make: *** [all] Error 2

SOLUTION:

Try:

hexdump -C yourscript.sh

And look for 0d 0a sequences. You can strip '\r' (0d) with the 'tr' command:

cat yourscript.sh | tr -d '\r' >> yournewscript.sh

    
</entry>
<entry [Fri 2011:12:23 10:52:41 EST] RUN TESTS WITH prove>

PROBLEM:

WANT ANT-FORMAT TEST OUTPUT (LIKE JUNIT TESTS)


DIAGNOSIS:

If you already have tests using Test::More or the like, then using prove --formatter TAP::Formatter::JUnit is the simplest way to go. You don't change any of your Perl tests or code, and you get the JUnit output that the Java-based tools use.

We use this setup with Hudson so we can track our tests and get good test failure reports as needed from Hudson's built-in tools without a lot of contortions. Our build is make-based, but that's the only real difference from your setup.

This means you should be able to run prove as an external task and get the benefits without having to change your Ant tooling significantly, if that wasn't clear.

Depending on which Perl you have installed, you may or may not have prove. Run

perl -MTest::Harness -e'print "$Test::Harness::VERSION\n"'
to see which version you've got - 3.00 or better will have prove; ideally, you should install 3.23 to get the best functionality:

sudo cpan Test::Harness TAP::Formatter::JUnit
This installs the most recent Test::Harness, TAP::Formatter::JUnit, and all needed prerequisites. Try out the external process with

prove --formatter TAP::Formatter::JUnit

You should get a JUnit XML file at the end of the prove run. If this all works, add it to Ant with

<!--

<target name="run">
<exec executable="prove">
  <arg value="--formatter" />
  <arg value="TAP::Formatter::JUnit" />
  <arg path="your/testsuite/directory/" />
</exec>

-->


SOLUTION:

syoung@syoung-Satellite-L355:/agua/0.6/t$ prove --formatter TAP::Formatter::JUnit cgi-bin/util/
    Can't load TAP::Formatter::JUnit at /usr/bin/prove line 11

    
</entry>
<entry [Fri 2011:12:23 10:42:06 EST] USE perl_begin IN MAKEFILE TO SET VARIABLES>

http://makepp.sourceforge.net/1.19/makepp_statements.html

perl_begin

This statement introduces a block of code which is interpreted verbatim by perl. It can be useful for defining functions, but you can do this more concisely with the sub statement. A block of perl code in your makefile can be useful to perform actions that are easier in perl than with makepp functions and rules.
The remainder of the line following the perl_begin statement is ignored. All text up until a line that begins at the left margin with perl_end is sent verbatim to the perl interpreter.

One example that I use this for is to make directories that might not necessarily exist. It's common in makefiles to put all the .o files in a subdirectory (e.g., a directory with a name i386, or sparc, or something that depends on the machine type). But what if the directory does not exist yet? You can make each .o file depend on the subdirectory, and put a rule in to build the subdirectory. But it's a lot easier just to do this:

   OBJDIR := $(ARCH)               # Where we put .o files.
   perl_begin
   -d $OBJDIR or mkdir $OBJDIR;    # Make sure the directory exists.
   perl_end

This way, every time the makefile is run, the subdirectory will be created if it does not exist.

Some operations are better expressed in terms of regular expressions than makepp's text functions. For example,

    perl_begin
    if ($ARCH =~ /^i[56]86/) {
      $CFLAGS = '-O6 -malign-double';	# On intel machines > 486, there
    					# is a substantial speed penalty
    					# for doubles that aren't quadword 
                                        # aligned.
    } else {
      $CFLAGS = '-O6';
    }
    perl_end
    
    %.o: %.c
    	$(CC) $(CFLAGS) -c $(input) -o $(output)

Any make variable can be accessed directly as a perl scalar. In this case, we've set the value of CFLAGS differently based on a regular expression match on the architecture flags.

As a final example, some pieces of information are easier to access directly from perl than from makepp. For example, you can access all of the configuration information that perl knows about your system, including how to build shared libraries, etc. (Type perldoc Config if you want to see what configuration information perl has available.)
    perl_begin
    
    use Config;
    
    $ARCH = $Config{'archname'};    # Use perl's knowledge of the architecture.
    $CC = $Config{'cc'};	    # Use the same C compiler as perl did.
    $SHARED_OBJ_CFLAGS = $Config{'cccdlflags'};
    				# Flags needed to compile objects which will
    				# go into a shared library.
    $SHARED_OBJ_LDFLAGS = $Config{'ccdlflags'} . " " . $Config{'lddlflags'};
    		      		# Linker flags to make a shared library.
    $SHARED_CC_LINK = $Config{'ld'}; # Command to produce shared libraries.
    
    $SHARED_EXTENSION = $Config{'dlext'}; # Extension of shared libraries.
    perl_end
    
    %.o: %.c
    	$(CC) $(CFLAGS) $(SHARED_OBJ_CFLAGS) -c $(input) -o $(output)
    
    libmylib.$(DLEXT): *.o
    	$(SHARED_CC_LINK) $(inputs) -o $(output) $(SHARED_OBJ_LDFLAGS)

Note how we define a bunch of variables in the perl block, and then we use them afterwards in the rest of the makefile. You can use the full power of the perl interpreter to set your variables in arbitrarily complicated ways. You can run shell commands from your perl code, access a database, or whatever you want.
    
</entry>
<entry [Fri 2011:12:23 10:37:16 EST] FIXED ERROR: '*** missing separator.  Stop'>

PROBLEM:

make
Makefile:4: STARTING warning
Makefile:10: *** missing separator.  Stop.

DIAGNOSIS:

Usually if such a error appears it is the mistake of the one who made the makefile.
I will tell you what ***missing seperator means
first 
*** means fatal error(that is the make can't continue and exits)
seperator is any of the seperators (:, =, TAB characters, etc) is missing.make looks for various kinds of separators to help it decide what kind of commandline it's seeing.
So I think that you understood the meaning of the missing seperator one.
The usual approach to solve the problem is by pressing Tab at the line number you mentioned.

SOLUTION:



</entry>
<entry [Fri 2011:12:23 05:56:20 EST] INSTALL PERL MODULES AS APT-GET PACKAGES>

Re: Writing Perl test cases
Posted by Steve (82.41.xx.xx) on Fri 25 Nov 2005 at 14:51 
[ Send Message | View Steve's Scratchpad | View Weblogs ]
I don't like mixing CPAN and packages - so I create packages of Perl modules by running:

apt-get install dh-make-perl
dh-make-perl --build --notest --cpan foo::bar
sudo dpkg --install libfoo-bar-perl*.deb
That downloads and builds the module, creating a Debian package of the result.
    
</entry>
<entry [Fri 2011:12:23 05:42:46 EST] USE Devel::Cover TO TEST COVERAGE>

perl -MDevel::Cover 

Code Coverage
I described the test suite as 'fairly exhaustive' but it would be good to get an objective measure of
how much of the code is being tested. The Devel::Cover module from CPAN can do exactly that.
By running the test script via Devel::Cover metering is added to count how many times each line
of code is executed and which conditional branches are executed:
$
perl -MDevel::Cover t/01_basics.t
and then the cover utility is run to generate HTML reports:
$ cover
The summary report shows that the test suite achieves 100% statement coverage of the
Text::Para module, meaning that every line of code is executed at least once. The branch
coverage is only 87.5% however. This means that not all conditional branches were executed.


 The essential feature is that no code is written until a test exists to confirm
the new functionality. Developers are encouraged to regularly review and refactor their code. The
tests provide a safety net to catch any regressions the refactoring might introduce. The regular
refactoring helps developers to become more bold about making changes to existing code and also
to be less resistant to change dictated by new requirements.

    
</entry>
<entry [Wed 2011:12:14 00:27:15 EST] CONSOLE 5 LOG COMMANDS>
    
console.log("Nothing happening");
console.debug("Checking to make sure nothing happened");
console.info("Something might happen.");
console.warn("Something happened, but it's no big deal.");
console.error("Cough cough!");


</entry>
<entry [Fri 2011:12:09 23:02:36 EST] TEST VIEW MISC METHODS>
    

TEST Agua._removeViewFeature


var doIt = function () {
console.clear();
dojo.reload("plugins.view.jbrowse.js.GenomeView");
dojo.reload("plugins.view.jbrowse.js.FeatureTrack");
dojo.reload("plugins.dojox.Timer");
dojo.reload("plugins.view.jbrowse.js.Browser");
dojo.reload("plugins.view.View");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};

var view = Agua.widgets.view[0];

var object = {"feature":"test1","sourceproject":"Project1","sourceworkflow":"Workflow0","species":"human","build":"hg19","project":"Project1","view":"View1","username":"admin","sessionId":"9999999999.9999.999","mode":"viewStatus"};

Agua.data.views = [{"stop":"146358913","status":"ready","project":"Project1","species":"human","tracklist":",wgEncodeGencodePolyaV4,ccdsGene","build":"hg19","datetime":"2011-12-10 21:39:47","username":"admin","notes":"","view":"View2","chromosome":"chr1","start":"99707447"},{"stop":"0","status":"ready","project":"Project1","species":"human","tracklist":"","build":"hg19","datetime":"2011-12-10 05:19:15","username":"admin","notes":"","view":"View8","chromosome":"","start":"0"},{"stop":18602700,"status":"ready","project":"Project1","species":"human","tracklist":"test1,control1,control2","build":"hg19","datetime":"2011-12-12 02:55:03","username":"admin","notes":"","view":"View1","chromosome":"chr22","start":18502700,"sessionId":"9999999999.9999.999","mode":"updateViewLocation"}];

console.log("HERE");

//console.clear(); 
console.log(dojo.toJson(Agua.data.viewfeatures));

Agua.data.viewfeatures = [{"feature":"control1","location":"/data/jbrowse/species/human/hg19/demo/control1","view":"View1","project":"Project1","species":"human","build":"hg19","username":"admin"},{"feature":"control2","location":"/data/jbrowse/species/human/hg19/demo/control2","view":"View1","project":"Project1","species":"human","build":"hg19","username":"admin"},{"feature":"test1","location":"/data/jbrowse/species/human/hg19/demo/test1","view":"View1","project":"Project1","species":"human","build":"hg19","username":"admin"}];

var _removeViewFeature = function (featureObject) {
	console.log("Data.removeViewFeature    plugins.core.Agua.removeViewFeature(featureObject)");
	console.log("Data.removeViewFeature    featureObject: " + dojo.toJson(featureObject));

	// REMOVE LOCALLY AND THEN ON THE REMOTE
	var requiredKeys = ["project", "view", "feature"];
	if ( ! this.removeData("viewfeatures", featureObject, requiredKeys) ) return;
	var viewObject = this.getViewObject(featureObject.project, featureObject.view);
	console.log("Data.removeViewFeature    viewObject: " + dojo.toJson(viewObject));
	var tracklist = viewObject.tracklist;
	console.log("Data.removeViewFeature    tracklist: " + dojo.toJson(tracklist));

	
};


Agua._removeViewFeature = function (featureObject) {
	console.log("Data.removeViewFeature    plugins.core.Agua.removeViewFeature(featureObject)");
	console.log("Data.removeViewFeature    featureObject: " + dojo.toJson(featureObject));

	// REMOVE LOCALLY AND THEN ON THE REMOTE
	var requiredKeys = ["project", "view", "feature"];

var success = Agua.removeData("viewfeatures", featureObject, requiredKeys);
console.log("success: " + success);
 
//	if ( ! Agua.removeData("viewfeatures", featureObject, requiredKeys) ) return;

	var viewObject = Agua.getViewObject(featureObject.project, featureObject.view);
	console.log("Data.removeViewFeature    viewObject: " + dojo.toJson(viewObject));
	var tracklist = viewObject.tracklist;
	console.log("Data.removeViewFeature    tracklist: " + dojo.toJson(tracklist));

    var array = tracklist.split(/,/);
console.dir({array:array});

    for ( var i = 0; i < array.length; i++ ) {
        if ( array[i] == featureObject.feature ) {
            console.log("matched feature in array[" + i + "]: " + array[i]);
            array.splice(i, 1);
        }
    }

console.dir({array:array});
tracklist = array.join(',');
console.log("tracklist: " + tracklist);

viewObject.tracklist = tracklist;
console.dir({viewObject:viewObject});
var views = Agua.getData("views");
console.dir({views:views});

Agua.removeData("views", viewObject, ["project", "view"]);
console.dir({views:Agua.data.views});

Agua.addData("views", viewObject, ["project", "view"]);
console.dir({views:Agua.data.views});


};


Agua._removeObjectFromArray = function (array, object, keys) {

// REMOVE AN OBJECT FROM AN ARRAY, IDENTIFY OBJECT USING SPECIFIED KEY VALUES



	console.log("Common._removeObjectFromArray    plugins.core.Common._removeObjectFromArray(array, object, keys)");

	console.dir({array:array});

	console.dir({object:object});

	console.dir({keys:keys});

	

	var index = this._getIndexInArray(array, object, keys);

	console.log("Common._removeObjectFromArray    index: " + index);



	if ( index == null )	return false;

	

	console.log("Common._removeObjectFromArray    BEFORE SPLICE array.length: " + array.length);

	array.splice(index, 1);

	console.log("Common._removeObjectFromArray    AFTER SPLICE array.length: " + array.length);



	return true;

};


console.clear();
Agua._removeViewFeature(object);




===================================




var changeNav = function () {
    var view = Agua.widgets.view[0];
    console.dir({view:view});
    
    var browser = view.browsers[0];
    browser.browser.chromList.value = "chr22";
    
    var browser = view.browsers[0];
    browser.browser.locationBox.value = "0...99999999";
};



var doIt = function () {
console.clear();
dojo.reload("plugins.view.jbrowse.js.GenomeView");
dojo.reload("plugins.view.jbrowse.js.FeatureTrack");
dojo.reload("plugins.dojox.Timer");
dojo.reload("plugins.view.jbrowse.js.Browser");
dojo.reload("plugins.view.View");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};

var view = Agua.widgets.view[0];
console.dir({view:view});
view._addViewFeature = function (featureObject) {
	//console.log("View._addViewFeature    View._addViewFeature(featureObject)");
	console.log("View._addViewFeature    featureObject: " + dojo.toJson(featureObject));
	//console.log("View._addViewFeature    featureObject.view: " + featureObject.view);

	// ADD FEATURE TO VIEW
    console.log("BEFORE  Agua._addViewFeature(featureObject)");
	var success = Agua._addViewFeature(featureObject);
    console.log("success: " + success);

	if ( ! success ) {
		console.log("View._addViewFeature    Returning because Agua._addViewFeature returned success: " + success);
		Agua.toastError("Failed to add feature to local data: " + featureObject.feature);
		return;
	}
//	Agua.toastInfo("Added feature: " + featureObject.feature);

	// SET VIEW COMBO
	console.log("View._addViewFeature    Doing this.setViewCombo(featureObject.project, featureObject.view)")
	this.setViewCombo(featureObject.project, featureObject.view);

	// RELOAD VIEW
	console.log("View._addViewFeature    Doing this.reloadBrowser(featureObject.project, featureObject.view)")
	this.reloadBrowser(featureObject.project, featureObject.view);
};

var object = {"feature":"test2","sourceproject":"Project1","sourceworkflow":"Workflow0","species":"human","build":"hg19","project":"Project1","view":"View1","username":"admin","sessionId":"9999999999.9999.999","mode":"viewStatus"};

//view._addViewFeature(object);
//doIt();
//dojo.reloadCss();

console.log(dojo.toJson(Agua.data.views));

Agua.data.views = [{"stop":"146358913","status":"ready","project":"Project1","species":"human","tracklist":",wgEncodeGencodePolyaV4,ccdsGene","build":"hg19","datetime":"2011-12-10 21:39:47","username":"admin","notes":"","view":"View2","chromosome":"chr1","start":"99707447"},{"stop":"111","status":"ready","project":"Project1","species":"human","tracklist":"","build":"hg19","datetime":"2011-12-10 05:24:07","username":"admin","notes":"","view":"View3","chromosome":"chr1","start":"0"},{"stop":"0","status":"ready","project":"Project1","species":"human","tracklist":"","build":"hg19","datetime":"2011-12-09 02:00:49","username":"admin","notes":"","view":"View4","chromosome":"","start":"0"},{"stop":"30782739","status":"ready","project":"Project1","species":"human","tracklist":",wgEncodeGencodePolyaV4,ccdsGene","build":"hg19","datetime":"2011-12-10 11:40:31","username":"admin","notes":"","view":"View5","chromosome":"chr22","start":"20521826"},{"stop":"130518272","status":"ready","project":"Project1","species":"human","tracklist":",dgv","build":"hg19","datetime":"2011-12-09 21:55:43","username":"admin","notes":"","view":"View6","chromosome":"chr1","start":"83805824"},{"stop":"0","status":"ready","project":"Project1","species":"human","tracklist":"","build":"hg19","datetime":"2011-12-10 05:15:20","username":"admin","notes":"","view":"View7","chromosome":"","start":"0"},{"stop":"0","status":"ready","project":"Project1","species":"human","tracklist":"","build":"hg19","datetime":"2011-12-10 05:19:15","username":"admin","notes":"","view":"View8","chromosome":"","start":"0"},{"stop":18602700,"status":"ready","project":"Project1","species":"human","tracklist":",test2","build":"hg19","datetime":"2011-12-12 02:55:03","username":"admin","notes":"","view":"View1","chromosome":"chr22","start":18502700,"sessionId":"9999999999.9999.999","mode":"updateViewLocation"}];


console.log(dojo.toJson(Agua.data.viewfeatures));

//Agua.data.viewfeatures = [{"feature":"control1","location":"/data/jbrowse/species/human/hg19/demo/control1","view":"View1","project":"Project1","species":"human","build":"hg19","username":"admin"},{"feature":"control2","location":"/data/jbrowse/species/human/hg19/demo/control2","view":"View1","project":"Project1","species":"human","build":"hg19","username":"admin"},{"feature":"test1","location":"/data/jbrowse/species/human/hg19/demo/test1","view":"View1","project":"Project1","species":"human","build":"hg19","username":"admin"}];


console.log("HEER");

Agua._removeViewFeature(object);






var doIt = function () {
console.clear();
dojo.reload("plugins.view.jbrowse.js.GenomeView");
dojo.reload("plugins.view.jbrowse.js.FeatureTrack");
dojo.reload("plugins.dojox.Timer");
dojo.reload("plugins.view.jbrowse.js.Browser");
dojo.reload("plugins.view.View");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};

var view = Agua.widgets.view[0];
console.dir({view:view});
view._addViewFeature = function (featureObject) {
	//console.log("View._addViewFeature    View._addViewFeature(featureObject)");
	console.log("View._addViewFeature    featureObject: " + dojo.toJson(featureObject));
	//console.log("View._addViewFeature    featureObject.view: " + featureObject.view);

	// ADD FEATURE TO VIEW
    console.log("BEFORE  Agua._addViewFeature(featureObject)");
	var success = Agua._addViewFeature(featureObject);
    console.log("success: " + success);

	if ( ! success ) {
		console.log("View._addViewFeature    Returning because Agua._addViewFeature returned success: " + success);
		Agua.toastError("Failed to add feature to local data: " + featureObject.feature);
		return;
	}
//	Agua.toastInfo("Added feature: " + featureObject.feature);

	// SET VIEW COMBO
	console.log("View._addViewFeature    Doing this.setViewCombo(featureObject.project, featureObject.view)")
	this.setViewCombo(featureObject.project, featureObject.view);

	// RELOAD VIEW
	console.log("View._addViewFeature    Doing this.reloadBrowser(featureObject.project, featureObject.view)")
	this.reloadBrowser(featureObject.project, featureObject.view);
};

var object = {"feature":"test2","sourceproject":"Project1","sourceworkflow":"Workflow0","species":"human","build":"hg19","project":"Project1","view":"View1","username":"admin","sessionId":"9999999999.9999.999","mode":"viewStatus"};

view._addViewFeature(object);

//doIt();
//dojo.reloadCss();




Agua.data.views = 
[ { "stop": "0", "status": "", "project": "Project1", "species": "human", "tracklist": "", "build": "hg19", "datetime": "2011-12-09 01:59:58", "username": "admin", "notes": "", "view": "View3", "chromosome": "", "start": "0" }, { "stop": "0", "status": "", "project": "Project1", "species": "human", "tracklist": "", "build": "hg19", "datetime": "2011-12-09 02:00:49", "username": "admin", "notes": "", "view": "View4", "chromosome": "", "start": "0" }, { "stop": "0", "status": "", "project": "Project1", "species": "human", "tracklist": "", "build": "hg19", "datetime": "2011-12-09 02:02:51", "username": "admin", "notes": "", "view": "View5", "chromosome": "", "start": "0" }, { "stop": "0", "status": "ready", "project": "Project1", "species": "human", "tracklist": "", "build": "hg19", "datetime": "2011-12-09 04:03:36", "username": "admin", "notes": "", "view": "View6", "chromosome": "", "start": "0" }, { "stop": 80115000, "status": "ready", "project": "Project1", "species": "human", "tracklist": ",test2,test1,vegaPseudoGene,ccdsGene", "build": "hg19", "datetime": "2011-12-09 08:52:48", "username": "admin", "notes": "", "view": "View1", "chromosome": "chr1", "start": 75165000, "sessionId": "9999999999.9999.999", "mode": "updateViewLocation" } ];

var object = {"stop":147178542,"status":"ready","project":"Project1","species":"human","tracklist":"","build":"hg19","datetime":"2011-12-09 04:03:36","username":"admin","notes":"","view":"View6","chromosome":"chr1","start":99706543};

var remove = function () {
console.log("BEFORE:")
console.dir({views:Agua.data.views});
var success = Agua.removeView(object);
console.log("success: " + success);
console.dir({views:Agua.data.views});
console.log("object: " + dojo.toJson(object, true));
};

Agua._removeObjectFromArray = function (array, object, keys) {

// REMOVE AN OBJECT FROM AN ARRAY, IDENTIFY OBJECT USING SPECIFIED KEY VALUES



	console.log("Common._removeObjectFromArray    plugins.core.Common._removeObjectFromArray(array, object, keys)");

	console.log("Common._removeObjectFromArray    array: " + dojo.toJson(array, true));

	console.log("Common._removeObjectFromArray    object: " + dojo.toJson(object, true));

	console.log("Common._removeObjectFromArray    keys: " + dojo.toJson(keys));

	

	var index = this._getIndexInArray(array, object, keys);

	console.log("Common._removeObjectFromArray    index: " + index);



	if ( index == null )	return false;

	

	console.log("Common._removeObjectFromArray    BEFORE SPLICE array.length: " + array.length);

	array.splice(index, 1);

	console.log("Common._removeObjectFromArray    AFTER SPLICE array.length: " + array.length);



	return true;

};




Agua._getIndexInArray = function (hasharray, object, keys) {

// GET THE INDEX OF AN OBJECT IN AN ARRAY, IDENTIFY OBJECT USING SPECIFIED KEY VALUES



	console.log("Common._getIndexInArray    plugins.core.Common._getIndexInArray(hasharray, object, keys)");

	console.log("Common._getIndexInArray    hasharray: " + dojo.toJson(hasharray));

	console.log("Common._getIndexInArray    object: " + dojo.toJson(object));

	console.log("Common._getIndexInArray    keys: " + dojo.toJson(keys));

	

	if ( hasharray == null )

	{

		console.log("Common._getIndexInArray    hasharray is null. Returning null.");

		return null;

	

	for ( var i = 0; i < hasharray.length; i++ )

	{

		var arrayObject = hasharray[i];

		console.log("Common._getIndexInArray    arrayObject: " + dojo.toJson(arrayObject));

		var identified = true;

		for ( var j = 0; j < keys.length; j++ )

		{

			console.log("Common._getIndexInArray    Checking value for keys[" + j + "]: " + keys[j] + ": " + arrayObject[keys[j]]);

			if ( arrayObject[keys[j]] != object[keys[j]] )

			{

				console.log("Common._getIndexInArray    object[" + keys[j] + "] : " + object[keys[j]]);

				console.log("Common._getIndexInArray    arrayObject[" + keys[j] + "] : " + arrayObject[keys[j]]);

				console.log("Common._getIndexInArray    " + arrayObject[keys[j]] + "** != **" + object[keys[j]] + "**");

				identified = false;

				break;

			}

		}

		console.log("Common._getIndexInArray    identified: " + identified);



		if ( identified == true )

		{

			console.log("Common._getIndexInArray    Returning index: " + i);

			return i;

		}

	}

	

	return null;

};


//doIt();
//dojo.reloadCss();
//stop();
//remove();


    
</entry>
<entry [Thu 2011:12:08 01:26:42 EST] TEST VIEW ADDVIEWFEATURE>

addViewFeature
==============
echo '{"sourceproject":"Project1","sourceworkflow":"Workflow0","species":"human","build":"hg19","feature":"control1","project":"Project1","view":"View1","username":"admin","sessionId":"9999999999.9999.999","mode":"addViewFeature"}' | ./view.cgi

SUCCESS
    {"status":"Adding feature: control1","subroutine":"Agua::View::addViewFeature","linenumber":"329","filename":"/agua/0.6/cgi-bin/lib/Agua/View.pm","timestamp":"2011-12-08 06:20:25"}

FAILURE
    {"status":"Feature already present in view: control1","subroutine":"Agua::View::addViewFeature","linenumber":"323","filename":"/agua/0.6/cgi-bin/lib/Agua/View.pm","timestamp":"2011-12-08 06:20:46"}


viewStatus
==========
echo '{"sourceproject":"Project1","sourceworkflow":"Workflow0","species":"human","build":"hg19","feature":"control1","project":"Project1","view":"View1","username":"admin","sessionId":"9999999999.9999.999","mode":"viewStatus"}' | ./view.cgi

    {"status":"ready","subroutine":"Agua::View::viewStatus","linenumber":"374","filename":"/agua/0.6/cgi-bin/lib/Agua/View.pm","timestamp":"2011-12-08 06:22:50"}

removeViewFeature
=================

echo '{"project":"Project1","view":"View1","feature":"control1","species":"human","build":"hg19","username":"admin","sessionId":"9999999999.9999.999","mode":"removeViewFeature"}' | ./view.cgi 

SUCCESS
    {"status":"Removing feature: control1","subroutine":"Agua::View::removeViewFeature","linenumber":"503","filename":"/agua/0.6/cgi-bin/lib/Agua/View.pm","timestamp":"2011-12-08 06:18:13"}

FAILURE
    {"status":"Feature not present in view: control1","subroutine":"Agua::View::removeViewFeature","linenumber":"497","filename":"/agua/0.6/cgi-bin/lib/Agua/View.pm","timestamp":"2011-12-08 06:19:21"}


NOTES
=====

var doIt = function () {
console.clear();
dojo.reload("plugins.view.View");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};

var response = {"status":"Feature already present in view: control1","subroutine":"Agua::View::addViewFeature","linenumber":"323","filename":"/agua/0.6/cgi-bin/lib/Agua/View.pm","timestamp":"2011-12-08 14:37:32"};

response = {"status":"Adding feature: control1","subroutine":"Agua::View::addViewFeature","linenumber":"323","filename":"/agua/0.6/cgi-bin/lib/Agua/View.pm","timestamp":"2011-12-08 14:37:32"};
//console.log("status: " + response.status);
var match = response.status.match(/Adding feature:/);
//console.log("View.addViewFeature    match: " + match);


var show = function () {
setTimeout(
    function() {
        console.log("View.addViewFeature    Doing this.standby.show()");
	view.standby._setTextAttr("Adding feature: " + view.getFeature());
	view.standby.show();
    }, 
    50
);
};

var hide = function() {				
setTimeout(
    function() {
        console.log("View.addViewFeature    Doing this.standby.show()");
	view.standby._setTextAttr("");
	view.standby.hide();
    }, 
    50
);
};

var stop = function () {
var view = Agua.controllers["view"].tabPanes[0];
view.timer.stop();
};



doIt();
//dojo.reloadCss();
//stop();

	

</entry>
<entry [Wed 2011:12:07 23:40:50 EST] FIREBUG TESTS: VIEW>


var doIt = function () {
console.clear();
dojo.reload("plugins.view.View");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};
doIt();
//dojo.reloadCss();

    
</entry>
<entry [Tue 2011:12:06 23:36:48 EST] COMPLETED VIEW TESTS>
    
cd /agua/0.6/t/cgi-bin/view
./View.t 

***** Test::Agua::View::testAddTrack
ok 1 - file present after addTrack
ok 2 - addTrackData success
***** Test::Agua::View::testRemoveTrack
ok 3 - file present after addTrack
ok 4 - Trackdata successfully removed
***** Test::Agua::View::testAddViewFeature *****
ok 5 - infofile still present after addViewTrack
ok 6 - infofile correct
ok 7 - link found for chromosome: chr22
ok 8 - trackData.json file has label for feature: test1
***** Test::Agua::View::addRemoveView
ok 9 - entry doesn't exist in table 'view' before _addView
ok 10 - Get row count after _addView
ok 11 - One row added by _addView
ok 12 - field 'username' value matches
ok 13 - field 'project' value matches
ok 14 - field 'view' value matches
ok 15 - Entry does not exist in 'view' after _removeView
ok 16 - initial row count equals final row count: 2
***** Test::Agua::View::testRemoveViewFeature
ok 17 - Entry does not exist in 'viewfeature' after _removeViewFeature
ok 18 - one row removed (final row count: 3)
***** Test::Agua::View::testAddRemoveViewFeature
ok 19 - entry doesn't exist in table 'viewfeature' before _addViewFeature
ok 20 - Get row count after _addViewFeature
ok 21 - One row added by _addViewFeature
ok 22 - field 'username' value matches
ok 23 - field 'project' value matches
ok 24 - field 'view' value matches
ok 25 - field 'feature' value matches
ok 26 - Entry does not exist in 'viewfeature' after _removeViewFeature
ok 27 - initial row count equals final row count: 3
***** Test::Agua::View::testAddRemoveViewFeature
ok 28 - entry doesn't exist in table 'viewfeature' before _addViewFeature
ok 29 - Get row count after _addViewFeature
ok 30 - One row added by _addViewFeature
ok 31 - field 'username' value matches
ok 32 - field 'project' value matches
ok 33 - field 'view' value matches
ok 34 - field 'feature' value matches
ok 35 - Entry does not exist in 'viewfeature' after _removeViewFeature
ok 36 - initial row count equals final row count: 3
***** Test::Agua::View::testAddRemoveViewFeature
ok 37 - entry doesn't exist in table 'viewfeature' before _addViewFeature
ok 38 - Get row count after _addViewFeature
ok 39 - One row added by _addViewFeature
ok 40 - field 'username' value matches
ok 41 - field 'project' value matches
ok 42 - field 'view' value matches
ok 43 - field 'feature' value matches
ok 44 - Entry does not exist in 'viewfeature' after _removeViewFeature
ok 45 - initial row count equals final row count: 3
1..45

    
</entry>
<entry [Tue 2011:12:06 04:12:54 EST] COMPLETE LIST OF TESTS>

agua TESTS
==========
cd /agua/0.6/t
find . -type f -name *.t


*    ./bin/File-Tools-comment/File-Tools.t
*    ./bin/Common/Logger.t
*    ./bin/Cluster/Cluster.t
*    ./bin/File-Tools/File-Tools.t
*    ./bin/jbrowse/editTrackData.t
*    ./bin/Conf/Agua.t
*    ./bin/Conf/Json.t
*    ./bin/Conf/StarCluster.t
*    ./cgi-bin/upload/Upload.t
*    ./cgi-bin/util/Util.t    
*    ./cgi-bin/view/View.t
*    ./cgi-bin/monitor/SGE.t
*    ./cgi-bin/jobs/Jobs.t       /agua/0.6/bin/sql/dump/agua.dump
*    ./cgi-bin/cluster/Cluster.t /agua/0.6/bin/sql/dump/agua.dump
*    ./cgi-bin/cluster/SCInstance.t
*    ./cgi-bin/admin/Admin.t
    ./cgi-bin/starcluster/StarCluster.t           PLANNED
    ./cgi-bin/version/Version.t                 ONWORKING
    ./cgi-bin/workflow/Workflow.t               ONWORKING
*    ./cgi-bin/stage/Stage.t


ADDED INCOMPLETE TESTS TO .gitattributes

t/cgi-bin/starcluster/StarCluster.t             # PLANNED
t/cgi-bin/version/Version.t                     # ONWORKING
t/cgi-bin/workflow/Workflow.t                   # ONWORKING


apps TESTS
==========

cd /agua/0.6/apps
find . -type f -name *.t

*    ./Hapmap/Hapmap.t               
*    ./Filter-SNP/Filter-SNP.t       
    ./StatsUtil/StatsUtil.t         ONWORKING    
    ./Filter/Filter.t               ONWORKING


   
</entry>
<entry [Tue 2011:12:06 03:31:28 EST] FIXED VIEW PANE ADD/REMOVE VIEWFEATURE>


ERROR EXPECTED:

echo '{"sourceproject":"Project1","species":"human","build":"hg19","featureiew":"View1","username":"admin","sessionId":"9999999999.9999.999","mode":"addViewFeature"}' | ./view.cgi
Content-type: text/html

    {error: 'undefined required inputs: sourceworkflow',
    subroutine: 'Agua::View::checkInputs',
    linenumber: '379',
    filename:  '/agua/0.6/cgi-bin/lib/Agua/View.pm',
    timestamp: '2011-12-06 03:20:45'}


CORRECT ADD:

echo '{"sourceproject":"Project1","sourceworkflow":"Workflow9","species":"human","build":"hg19","feature":"control2","project":"Project1","view":"View1","username":"admin","sessionId":"9999999999.9999.999","mode":"addViewFeature"}' | ./view.cgi

    {status: 'Adding feature: control2',
    subroutine: 'Agua::View::addViewFeature',
    linenumber: '329',
    filename:  '/agua/0.6/cgi-bin/lib/Agua/View.pm',
    timestamp: '2011-12-06 03:54:10'}


CORRECT REMOVE:

echo '{"project":"Project1","view":"View1","feature":"control2","species":"human","build":"hg19","username":"admin","sessionId":"9999999999.9999.999","mode":"removeViewFeature"}' | ./view.cgi
Content-type: text/html

    { status: 'Removed feature control2 from viewfeature table' }



TEST TO CONFIRM THAT THE DIRECTORY LINKS ARE CREATED:

/var/www/html/agua/0.6/plugins/view/jbrowse/users/admin/Project1/View1/data/tracks/chrX/control2


SUBCLASS View TO FORM Test::Agua::View AND 

1. PASS IN htmlroot BY OVERRIDING getHtmlRoot METHOD

2. PASS IN location BY OVERRIDING getFeatureLocation METHOD



</entry>
<entry [Sat 2011:12:03 20:57:53 EST] PROJECT FILEMENU FIREBUG SCRIPTS>

var groupDragPane = dijit.byId("plugins_files__GroupDragPane_5");
console.dir({groupDragPane:groupDragPane});
var fileMenu = groupDragPane.fileMenu;

fileMenu.upload = function (event) {
	var item = this.menu.currentTarget.item;
	console.log("FileMenu.upload     item: " + dojo.toJson(item));

	var path = item.parentPath;

	console.log("FileMenu.upload     path: " + path);

	if ( path == null || path == '' )	return;
	this.uploader.setPath(path);
	this.uploader.show();
dojo.stopEvent(event);	

    var groupDrag = dijit.getEnclosingWidget(this.menu.currentTarget.offsetParent);
console.log("fileMenu.upload    groupDrag: " + groupDrag);
console.log("fileMenu.upload    groupDragPane: " + groupDragPane);

var fileDrag = groupDrag.parentWidget;
console.dir({fileDrag:fileDrag});
var children = fileDrag.getChildren();
var index = 0;
for ( var i = 0; i < children.length; i++ ) {
    if ( children[i] == groupDrag ) {
        index = i;
        break;
    }
}
console.log("index: " + index);
var previousGroupDrag = children[index - 1];

	console.log("index: " + index);

	var previousGroupDrag = children[index - 1];

	var parentFolder = path.match('([^\/]+)$')[1];

	console.log("parentFolder: " + parentFolder);


this.callback = dojo.hitch(this, "reloadPane", previousGroupDrag, parentFolder);
};


fileMenu.onComplete = function() {
console.log("fileMenu.onComplete    this.callback: " + this.callback);
    this.callback();
//dojo.stopEvent(event);	

};

fileMenu.reloadPane = function(groupDragPane, folder) {
	console.log("fileMenu.reloadPane    groupDragPane: " + groupDragPane);
	console.log("fileMenu.reloadPane    folder: " + folder);

	// USE FAKE event TO RELOAD DIRECTORIES AFTER UPLOAD IS COMPLETE

	var items = groupDragPane.items;

	var index = 0;

	for ( var i = 0; i < items.length; i++ ) {

		if ( items[i].name == folder ) {

			index = i;

			break;

		}

	}

	console.log("fileMenu.reloadPane    index: " + index);

	var event = { target: { "item": items[index] } };

	groupDragPane.onclickHandler(event);

};

fileMenu.setUploader = function () {
	var uploaderId = dijit.getUniqueId("plugins.form.UploadDialog");
	var username = Agua.cookie('username');
	var sessionId = Agua.cookie('sessionId');
	this.uploader = new plugins.form.Uploader(
	{
		uploaderId: uploaderId,
		username: 	username,
		sessionId: 	sessionId
	});
	dojo.connect(this.uploader, "onComplete", this, "onComplete");
};	//	setUploader




FIREBUG COPY SCRIPT AS BOOKMARKLET
http://marklets.com/FAQ.aspx


javascript: var groupDragPane = dijit.byId("plugins_files__GroupDragPane_5"); console.dir({groupDragPane:groupDragPane}); var fileMenu = groupDragPane.fileMenu; var dragPane = fileMenu.menu.currentTarget; console.dir({dragPane:dragPane});  // UPLOAD fileMenu.upload = function (event) {  	//console.log("FileMenu.upload     plugins.files.Menu.upload(event)");  	//console.log("FileMenu.upload     this: " + this);  	//console.log("FileMenu.upload     this.menu: " + this.menu);  	console.log("FileMenu.upload     this.menu.currentTarget: " + this.menu.currentTarget);  	console.dir({currentTarget:this.menu.currentTarget});    	var item = this.menu.currentTarget.item;  	console.log("FileMenu.openWorkflow     item: " + dojo.toJson(item));  	var path = item.parentPath;  	console.log("FileMenu.upload     path: " + path);  	if ( path == null || path == '' )	return;    	this.uploader.setPath(path);  	this.uploader.show();          var groupDragPane = this.menu.currentTarget.parentWidget;         dojo.connect(this.uploader, "onComplete", this, "reloadPane", groupDragPane);  	dojo.stopEvent(event);	  };  fileMenu.reloadPane = function(groupDragPane) {  	// USE FAKE event TO RELOAD DIRECTORIES AFTER UPLOAD IS COMPLETE 	var item = groupDragPane.items[0]; 	var event = { target: { item: item } }; 	groupDragPane.onclickHandler(event);  };





	
</entry>
<entry [Wed 2011:11:30 00:59:14 EST] COMPLETED Logger.pm TESTS>


syoung@syoung-Satellite-L355:/agua/0.6/t/bin/Common$ ./Logger.t 
ok 1 - use Test::Agua::Common::Logger;
ok 2 - require Test::Agua::Common::Logger;
ok 3 - logger is the correct class isa Test::Agua::Common::Logger
ok 4 - correct content in logfile
BEFORE stopLog    THIS STDERR SHOULD APPEAR IN LOGFILE
AFTER stopLog    THIS STDERR SHOULD NOT APPEAR IN LOGFILE
ok 5 - correct log entry
ok 6 - correct STDERR before stopLog
ok 7 - correct STDERR after stopLog
ok 8 - correctly failed to log after stopLog
2011-11-30 00:58:25	Test::Agua::Common::Logger::testPauseLog	58	BEFORE resumeLog. THIS STDOUT SHOULD NOT APPEAR IN LOGFILE
testPauseLog    THIS STDERR SHOULD APPEAR IN LOGFILE
testPauseLog    THIS STDERR SHOULD ALSO APPEAR IN LOGFILE
ok 9 - correct log entry
ok 10 - correct STDOUT before resumeLog
ok 11 - correct STDOUT after resumeLog
ok 12 - correct STDERR before resumeLog
ok 13 - correct STDERR after resumeLog
2011-11-30 00:58:25	Test::Agua::Common::Logger::testResumeLog	86	AFTER pauseLog    THIS STDOUT SHOULD APPEAR IN LOGFILE
BEFORE pauseLog    THIS STDERR SHOULD APPEAR IN LOGFILE
AFTER pauseLog    THIS STDERR SHOULD NOT APPEAR IN LOGFILE
AFTER resumeLog    THIS STDERR SHOULD APPEAR IN LOGFILE
ok 14 - correct logging before pauseLog
ok 15 - correct STDERR before pauseLog
ok 16 - correct STDERR after pauseLog
ok 17 - correctly not logging after pauseLog
ok 18 - correctly logging after resumeLog
ok 19 - correct STDERR after resumeLog
1..19

	
</entry>
<entry [Sun 2011:11:27 05:19:44 EST] FIREBUG TEST PROJECT PANE>

var doIt = function () {
console.clear();
dojo.reload("plugins.files._GroupDragPane");
dojo.reload("plugins.files.FileDrag");
dojo.reload("plugins.project.Project");
dojo.reload("plugins.core.Agua");
dojo.reloadPage();
};
doIt();
//dojo.reloadCss();

	
</entry>
<entry [Wed 2011:11:23 19:07:04 EST] TEST Agua::Workflow::executeWorkflow>

echo '{"project":"Project1","workflow":"Workflow1","workflownumber":"1","start":"1","stop":"1","username":"syoung","sessionId":"9999999999.9999.999","mode":"executeWorkflow","cluster":"syoung-microcluster"}'  | /var/www/cgi-bin/agua/0.6/workflow.cgi

	
</entry>
<entry [Sat 2011:11:19 18:36:34 EST] USEFUL TEST MODULES>

Testing Completeness

    * Perl::Critic - ensure your code meets Perl Best Practices
    * Devel::Cover - measure your test coverage 


Other General Testing Modules

    * Test::Deep - gives you more powerful complex data structure testing.
    * Test::Differences - a nicer diff comparison
    * Test::MockObject - fake external modules
    * Test::DatabaseRow - simple DB testing
    * Test::File - test file attributes
    * Test::Strict - test for syntax, strict and warnings
    * Test::Warn - tests creation/handling of warnings messages
    * Test::Exception - tests creation/handling of exception 


USE Test::More FOR OBJECT TESTS LIKE

USE:
use_ok('Bioptic::Admin');

IMPORTS (NON-OO):
use_ok('Bioptic::Non-OO', qw(subroutine1 subroutine2);

VERSION:
use_ok('Bioptic::Admin', 1.02);


REQUIRE (DON'T IMPORT LIKE use_ok)
require_ok($module);
require_ok($file);

ISA
my $obj = Some::Module->new;
isa_ok( $obj, 'Some::Module' );

CAN
can_ok('Foo', qw(this that whatever));
can_ok($obj, qw(this that whatever));



    
</entry>
<entry [Mon 2011:11:14 04:35:18 EST] PROJECT CGI>

    EXAMPLES

perl -U project.cgi "mode=fileSystem&sessionId=1228791394.7868.158&username=admin&path=.%2FProject1%2Finputdir"

perl -U project.cgi "mode=fileSystem&sessionId=1228791394.7868.158&username=admin&path=.%2FProject1%2Fcode.js"

perl -u project.cgi "mode=fileSystem&sessionId=1228791394.7868.158&username=admin&path=.%2FProject1%2Finputdir"

perl -U project.cgi "mode=fileSystem&query=Project1/Workflow1-assembly/exome&sessionId=1228791394.7868.158&username=admin"

	OK - RUN project.cgi AS apache AND EXECUTES project.pl AS USER syoung (HARD CODED IN project.cgi FOR TESTING)



perl -U project.cgi "mode=projects&sessionId=1228791394.7868.158&username=admin"


    
</entry>
<entry [Thu 2011:11:10 10:52:51 EST] Agua::Common::Version::getVersion AND ::upgrade>

echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getVersion"}' | ./workflow.cgi

echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"upgrade","version":"0.7"}' | ./workflow.cgi


echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"update","version":"0.2","application":"apps"}' | ./workflow.cgi


echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"sync","version":"0.7","application":"apps"}' | ./workflow.cgi


</entry>
<entry [Thu 2011:11:03 02:31:10 EST] TEST Agua::Workflow::moveWorkflow>

IMPLEMENTED IN

/agua/0.6/t/cgi-bin/workflow/Workflow.t


echo '{"project":"Project1","name":"Workflow3","number":"3","newnumber":2,"mode":"moveWorkflow","username":"syoung","sessionId":"9999999999.9999.999"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi

echo '{"project":"Project1","name":"Workflow3","number":"2","newnumber":3,"mode":"moveWorkflow","username":"syoung","sessionId":"9999999999.9999.999"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi

echo '{"project":"Project1","name":"Workflow3","number":"3","newnumber":2,"mode":"moveWorkflow","username":"syoung","sessionId":"9999999999.9999.999"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi
Content-type: text/html

echo '{"project":"Project1","name":"Workflow3","number":"2","newnumber":5,"mode":"moveWorkflow","username":"syoung","sessionId":"9999999999.9999.999"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi

echo '{"project":"Project1","name":"Workflow3","number":"5","newnumber":1,"mode":"moveWorkflow","username":"syoung","sessionId":"9999999999.9999.999"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi

echo '{"project":"Project1","name":"Workflow3","number":"1","newnumber":3,"mode":"moveWorkflow","username":"syoung","sessionId":"9999999999.9999.999"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi


</entry>
<entry [Sun 2011:10:09 23:54:07 EST] TEST Agua::Workflow::stopWorkflow>

 echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"ELAND","workflow":"align","cluster":"syoung-microcluster","mode":"stopWorkflow","start":1}' | ./workflow.cgi
	
</entry>
<entry [Sun 2011:10:09 23:53:49 EST] TEST Agua::Workflow::getStatus>

echo '{"username":"syoung","sessionId":"9999999999.9999.999","project":"ELAND","workflow":"align","mode":"getStatus"}' | ./workflow.cgi
	
</entry>
<entry [Wed 2011:10:05 23:35:59 EST] TEST init.cgi/init.pl>

echo '{"username":"agua","mode":"init","data":{"username":"admin","amazonuserid":"728213020069","datavolume":"snap-55fe4a3f","uservolume":" New volume","datavolumesize":40,"uservolumesize":100,"datavolumecheckbox":0,"uservolumecheckbox":0,"ec2publiccert":"-----BEGIN CERTIFICATE-----MIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMYQVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgyNDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAVBgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAKBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlStiZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7cPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kUbs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z0626imzblXE8IA==-----END CERTIFICATE-----","ec2privatekey":"-----BEGIN PRIVATE KEY-----MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAECgYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS38yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGGM6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpCaE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXKpzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf94A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWECQQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdINukFcKuTSGIpO-----END PRIVATE KEY-----","awsaccesskeyid":"AKIAIZXZ6S7ARZ44TTHQ","secretaccesskey":"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"}}' | ./init.cgi
	

WHICH WILL PRINT THE KEY FILES:

sudo cat /agua/0.6/conf/admin/.keypairs/private.pem
-----BEGIN PRIVATE KEY-----
MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZ
WWZJeWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyrdtsMoHDQ
NVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs59VVeg4cBw/QFAgMBAAEC
gYBDAJlLoaFrLbzTZa/txbMnLp8+5modNRlrejtfB6FeKMbHZjdk6busQ/mtwngz5ROZw0NAXaS3
8yc3RplgI3KQeiv9utzn8xSanX/acWsuQOTtGTLlXUuvmUrD40MmnMiL20ChH6zuDZCbT5ucCEGG
M6E0chY/gJYRODxWBkkrgQJBAO4JROSapUmEXko68QuKhBKz+gQgAZM27TnBKYsMINTJb1TZpNpC
aE1bFRy1uNLcs6hFidQ6tSPTTCdjNh7CACUCQQClmoHtP0Sk5wa8iglSaPhSA9CaewO8UlZO3TXK
pzVepeBklR+SZSCDOHLAZ/+yZUB3onmlVS1Z/qZm01gNym5hAkEAlIqiPEoo9RyuPoJTo5EX5Bf9
4A8dDIINPapFw2iZIFBnsjpzPmSMdCFvpk/ce3GQh2SFozPTj/yunDG0NzN3JQJBAJxTKvzzMXBc
6X4G69/QWUDKexuorhESxIhzxziC+R1chmNMZd5C+hsEqUY5piUX8XA9fol0y3fdq+T68m8qPWEC
QQDshvJAArMe1CUpJZFqovE/iN1P+9OzavTYStK8F8AVYnZR/KAV5M5rDE3gXBKq2WxUXjT0vdIN
ukFcKuTSGIpO
-----END PRIVATE KEY-----syoung@Satellite-L355:/var/www/cgi-bin/agua/0.6$ sudo cat /agua/0.6/conf/admin/.keypairs/public.pem 
-----BEGIN CERTIFICATE-----
MIICdjCCAd+gAwIBAgIFfadFC7owDQYJKoZIhvcNAQEFBQAwUzELMAkGA1UEBhMC
VVMxEzARBgNVBAoTCkFtYXpvbi5jb20xDDAKBgNVBAsTA0FXUzEhMB8GA1UEAxMY
QVdTIExpbWl0ZWQtQXNzdXJhbmNlIENBMB4XDTExMDgyNTEwMDEwNVoXDTEyMDgy
NDEwMDEwNVowUjELMAkGA1UEBhMCVVMxEzARBgNVBAoTCkFtYXpvbi5jb20xFzAV
BgNVBAsTDkFXUy1EZXZlbG9wZXJzMRUwEwYDVQQDEww3bnd6MHM3c2Npa28wgZ8w
DQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAJn7o8oOUaUgTwI40aoRXrmuKyhZWWZJ
eWcLhnYcmsgC2F4f9zHS9UpRecWh2QrrLXVmu+xduw1dofWxUAT/p/51lGOV5hyr
dtsMoHDQNVIvC6M2ETD+tz5ait3k6Z7A1aWrV86m7ytU55mj7BnijXtpMvI0nXs5
9VVeg4cBw/QFAgMBAAGjVzBVMA4GA1UdDwEB/wQEAwIFoDAWBgNVHSUBAf8EDDAK
BggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBSfnvEL4oqKMCGxlSti
ZQ2dJO9DGDANBgkqhkiG9w0BAQUFAAOBgQBaDJBUbtk5CA2hJfE8QPpgBwwc3M+7
cPc0wi5cITImtvWMCDvdf6LcgByFejtAgycR2XA0YczBj2Zd6qzPDWXnFbMA35kU
bs8Jd1e9lG7Tr6YV0q3etpm6+rP77wmKAF3yniv1cJp1WwfpRVsTEliwEnI+IC4z
0626imzblXE8IA==
-----END CERTIFICATE-----

</entry>
<entry [Tue 2011:08:16 02:40:50 EST] ADMIN PARAMETERS: TEST eval PARAMFUNCTION>
    
var doIt = function () {
console.clear();
dojo.reload("plugins.core.Agua");
dojo.reload("plugins.admin.Parameters");
dojo.reloadPage()
Agua.controllers["admin"].createTab();
}
doIt();

var params = Agua.controllers["admin"].tabPanes[0].paneWidgets("plugins.admin.Parameters")[0];
params;

// GOOD DATA
var args = "input.inputfile.value,output.readfile.value";
var inputParams = "inputfile,readfile";
var paramFunction = "if ( inputfile != null && inputfile != '' ) return inputfile; if ( readfile != null && readfile != '' ) return readfile;";



</entry>
<entry [Tue 2011:08:16 02:40:34 EST] WORKFLOW: TEST dojox.widget.Loader>

console.clear();
var doIt = function () {

dojo.reload("plugins.core.Common");
dojo.reload("plugins.workflow.StageRow");
dojo.reload("plugins.workflow.Stages");
dojo.reload("plugins.workflow.Workflow");
dojo.reload("plugins.core.Data");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();

};
doIt();

var loader = dijit.byId("globalLoader");

//loader._hide();
//loader._show();
//loader._setMessage("Loading workflow 'align'");
    
</entry>
<entry [Mon 2011:08:15 07:31:17 EST] READ HIT STATS, ETC. - NOVOALIGN>

	
#### READ HIT STATS


	################################################
	############        READ HITS         ##########
	################################################
	#print "Aligner::NOVOALIGN::runReadHits    Doing readHits()   ", Timer::current_datetime(), "\n";
	#$self->readHits($outputdir, $references, $splitfiles, "eland-readHits", "hit.sam");
	#print "Aligner::NOVOALIGN::runReadHits    After readHits()   ", Timer::current_datetime(), "\n";


#### SNP CALLING


	###############################################
	#####     PREDICT SNPs WITH SAMTOOLS     ######
	###############################################
	#print "Aligner::NOVOALIGN::runInParallel    Doing samtoolSnps      ", Timer::current_datetime(), "\n";
	#my $samtools_index = $self->samtoolsindex();
	#print "Aligner::NOVOALIGN::::run    samtools_index: $samtools_index\n" if $DEBUG;
	#$self->samtoolSnps($splitfiles, $references, $outputdir, "hit.sam");
	#print "Aligner::NOVOALIGN::runInParallel    After samtoolSnps      ", Timer::current_datetime(), "\n";


	################################################
	##########          USAGE STATS      ###########
	################################################
	#print "Aligner::NOVOALIGN::run    Doing printUsage       ", Timer::current_datetime(), "\n";
	#$self->printUsage("$outputdir/novoalign-USAGE.txt");
	#print "Aligner::NOVOALIGN::run    After printUsage       ", Timer::current_datetime(), "\n";

    
</entry>
<entry [Mon 2011:08:15 07:30:00 EST] FILE MERGE TESTS - NOVOALIGN>


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

	################################################
	#####  ******      STRATEGY 1       ******  ####
	#####         BAM FILE INTERMEDIARY         ####
	################################################	
	#print "Aligner::NOVOALIGN::run    Doing STRATEGY 1: USE BAM FILE INTERMEDIARY\n";
	#
	################################################
	###########    CONVERT SAM TO BAM     ##########
	################################################
	#print "Aligner::NOVOALIGN::run    Doing subdirSamToBam     ", Timer::current_datetime(), "\n";
	#$self->subdirSamToBam($outputdir, $references, $splitfiles, "accepted_hits.sam");
	#print "Aligner::NOVOALIGN::run    After subdirSamToBam     ", Timer::current_datetime(), "\n";
	#
	###############################################
	##########   CUMULATIVE MERGE BAM    ##########
	###############################################
	#print "Aligner::NOVOALIGN::run    Doing cumulativeMergeBam     ", Timer::current_datetime(), "\n";
	#$self->cumulativeMergeBam($outputdir, $references, $splitfiles, "accepted_hits.bam", "accepted_hits.bam");
	#print "Aligner::NOVOALIGN::run    After cumulativeMergeBam     ", Timer::current_datetime(), "\n";

	###############################################
	##########     PYRAMID MERGE BAM     ##########
	###############################################
	#print "Aligner::NOVOALIGN::run    Doing cumulativeMergeBam     ", Timer::current_datetime(), "\n";
	#$self->pyramidMergeBam($outputdir, $references, $splitfiles, "accepted_hits.bam", "out.bam");
	#print "Aligner::NOVOALIGN::run    After cumulativeMergeBam     ", Timer::current_datetime(), "\n";
	#
	################################################
	###########         SORT BAM         ##########
	################################################
	#print "Aligner::NOVOALIGN::run    Doing sortBam     ", Timer::current_datetime(), "\n";
	#$self->sortBam($outputdir, $references, "out.bam", "out.sam");
	#print "Aligner::NOVOALIGN::run    After sortBam     ", Timer::current_datetime(), "\n";
	#
	#
	################################################
	###########         BAM TO SAM        ##########
	################################################
	#print "Aligner::NOVOALIGN::run    Doing bamToSam     ", Timer::current_datetime(), "\n";
	#$self->bamToSam($outputdir, $references);
	#print "Aligner::NOVOALIGN::run    After bamToSam     ", Timer::current_datetime(), "\n";
	#
	#print "Aligner::NOVOALIGN::run    Completed STRATEGY 1: USE BAM FILE INTERMEDIARY\n";


		###############################################
		####  ******      STRATEGY 2       ******  ####
		####         SORT MERGED SAM FILE          ####
		###############################################	
		#print "Aligner::NOVOALIGN::run    Doing STRATEGY 2: SORT MERGED SAM FILE\n";
		##
		##################################################
		#############         MERGE SAM         ##########
		##################################################
		###print "Aligner::NOVOALIGN::run    Doing mergeSam     ", Timer::current_datetime(), "\n";
		###$self->pyramidMergeSam($outputdir, $references, $splitfiles, "accepted_hits.sam", "out.sam");
		###print "Aligner::NOVOALIGN::run    After mergeSam     ", Timer::current_datetime(), "\n";

		################################################
		###########         MERGE SAM         ##########
		################################################
		#print "Aligner::NOVOALIGN::run    Doing mergeSam     ", Timer::current_datetime(), "\n";
		#$self->cumulativeMergeSam($outputdir, $references, $splitfiles, "accepted_hits.sam", "out.sam");
		#print "Aligner::NOVOALIGN::run    After mergeSam     ", Timer::current_datetime(), "\n";

		################################################
		###########         SORT SAM         ###########
		################################################
		#print "Aligner::NOVOALIGN::run    Doing sortSam     ", Timer::current_datetime(), "\n";
		#$self->sortSam($outputdir, $references, "out.sam");
		#print "Aligner::NOVOALIGN::run    After sortSam     ", Timer::current_datetime(), "\n";
	
		###############################################
		##########       SAM TO BAM         ###########
		###############################################
		#print "Aligner::NOVOALIGN::run    Doing samToBam     ", Timer::current_datetime(), "\n";
		#$self->samToBam($outputdir, $references, "out.sam", "out.bam");
		#print "Aligner::NOVOALIGN::run    After samToBam     ", Timer::current_datetime(), "\n";
		#
		#print "Aligner::NOVOALIGN::run    Completed STRATEGY 2: SORT MERGED SAM FILE\n";



    
</entry>
<entry [Sat 2011:08:13 12:14:10 EST] ADMIN PARAMETER ROW args AND inputParams setLevelHeight TEST>

//console.clear();

var doIt = function () {

console.clear();
dojo.reload("plugins.form.Inputs");
dojo.reload("plugins.admin.Parameters");
dojo.reload("plugins.admin.ParameterRow");
dojo.reload("plugins.form.EditRow");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
Agua.controllers["admin"].createTab();

}
//doIt();

var params = Agua.controllers["admin"].tabPanes[0].paneWidgets["plugins.admin.Parameters"][0];
//console.dir({params: params});

var paramRow = params.childWidgets[1];
console.dir({paramRow: paramRow});

//console.dir({args: paramRow.args, inputParams: paramRow.inputParams});

dojo.connect(paramRow.args, 'onchange', function (event) {
    console.log("args.onchange");
    event.stopPropagation();
    levelRowHeight();
});
dojo.connect(paramRow.inputParams, 'onchange', function (event) {
    console.log("inputParams.onchange");
    event.stopPropagation();
    levelRowHeight();
});


var levelRowHeight = function () {

	console.log("XXXX ParameterRow.levelRowHeight    plugins.workflow.ParameterRow.levelRowHeight()");

        console.log("ParameterRow.levelRowHeight    BEFORE paramRow.args.clientHeight: " + paramRow.args.clientHeight);
        console.log("ParameterRow.levelRowHeight    BEFORE this.inputParams.clientHeight: " + paramRow.inputParams.clientHeight);
        console.log("ParameterRow.levelRowHeight    BEFORE paramRow.args.offsetHeight: " + paramRow.args.offsetHeight);
        console.log("ParameterRow.levelRowHeight    BEFORE this.inputParams.offsetHeight: " + paramRow.inputParams.offsetHeight);

// VIEW CURRENT STYLES
console.log("paramRow.args : " + dojo.attr(paramRow.args, 'style'));
console.log("paramRow.inputParams : " + dojo.attr(paramRow.inputParams, 'style'));

// SET STYLES TO max-height TO SQUASH DOWN EMPTY SPACE
        dojo.attr(paramRow.inputParams, 'style', 'display: inline-block; max-height: ' + paramRow.inputParams.clientHeight + 'px !important');
        dojo.attr(paramRow.args, 'style', 'display: inline-block; max-height: ' + paramRow.args.clientHeight + 'px !important');

        dojo.attr(paramRow.inputParams, 'style', 'display: inline-block; min-height: 0px !important');
        dojo.attr(paramRow.args, 'style', 'display: inline-block; min-height: 0px !important');

        console.log("ParameterRow.levelRowHeight    AFTER max-height this.args.clientHeight       : " + paramRow.args.clientHeight);
        console.log("ParameterRow.levelRowHeight    AFTER max-height this.inputParams.clientHeight: " + paramRow.inputParams.clientHeight);

console.log("AFTER max-height    paramRow.args        : " + dojo.attr(paramRow.args, 'style'));
console.log("AFTER max-height    paramRow.inputParams : " + dojo.attr(paramRow.inputParams, 'style'));

if ( paramRow.inputParams.clientHeight < paramRow.args.clientHeight )
{
    console.log("paramRow.inputParams.height < paramRow.args.height");
    console.log("Doing set inputParams height = args height")

    dojo.attr(paramRow.inputParams, 'style', 'display: inline-block; height: 0px !important');
    dojo.attr(paramRow.inputParams, 'style', 'display: inline-block; min-height: ' + paramRow.args.offsetHeight + 'px !important');

}
else if ( paramRow.inputParams.clientHeight >= paramRow.args.clientHeight )
{
        console.log("paramRow.inputParams.clientHeight >= paramRow.args.clientHeight");
    
        dojo.attr(paramRow.args, 'style', 'display: inline-block; height: 0px !important');
        dojo.attr(paramRow.args, 'style', 'display: inline-block; min-height: ' + paramRow.inputParams.offsetHeight + 'px !important');
}


        console.log("ParameterRow.levelRowHeight    AFTER paramRow.args.clientHeight   : " + paramRow.args.clientHeight);
        console.log("ParameterRow.levelRowHeight    AFTER this.inputParams.clientHeight: " + paramRow.inputParams.clientHeight);
        console.log("ParameterRow.levelRowHeight    AFTER paramRow.args.offsetHeight   : " + paramRow.args.offsetHeight);
        console.log("ParameterRow.levelRowHeight    AFTER this.inputParams.offsetHeight: " + paramRow.inputParams.offsetHeight);

        console.dir({args: paramRow.args, inputParams: paramRow.inputParams});
console.log("paramRow.args : " + dojo.attr(paramRow.args, 'style'));
console.log("paramRow.inputParams : " + dojo.attr(paramRow.inputParams, 'style'));


};


//console.log("Doing set height");
//dojo.attr(paramRow.args, 'style', 'display: inline-block; min-height: 50px !important');
//dojo.attr(paramRow.inputParams, 'style', 'display: inline-block; height: 50px !important');
//console.dir({args: paramRow.args, inputParams: paramRow.inputParams});

console.log("paramRow.args        : " + dojo.attr(paramRow.args, 'style'));
console.log("paramRow.inputParams : " + dojo.attr(paramRow.inputParams, 'style'));
        console.log("ParameterRow.levelRowHeight    END paramRow.args.clientHeight   : " + paramRow.args.clientHeight);
        console.log("ParameterRow.levelRowHeight    END this.inputParams.clientHeight: " + paramRow.inputParams.clientHeight);
        console.log("ParameterRow.levelRowHeight    END paramRow.args.offsetHeight   : " + paramRow.args.offsetHeight);
        console.log("ParameterRow.levelRowHeight    END this.inputParams.offsetHeight: " + paramRow.inputParams.offsetHeight);





    
</entry>
<entry [Sat 2011:08:13 06:33:33 EST] CORE Data.js removeWorkflow TEST>

console.clear();

var workflowObject = { "project": "REFERENCES", "name": "maq", "username": "syoung", "sessionId": "9999999999.9999.999", "mode": "removeWorkflow" };

var getStageParamsForWorkflow = function(workflowObject) {

var keys = ["project", "workflow"];
var values = [workflowObject.project, workflowObject.name];
var stageParameters = Agua._getStageParameters();
stageParameters = Agua.filterByKeyValues(stageParameters, keys, ["REFERENCES", "maq"]);
//console.log("stageParameters: " + dojo.toJson(stageParameters, true));
console.log("stageParameters.length: " + stageParameters.length);

}

getStageParamsForWorkflow(workflowObject);
 
Agua.removeWorkflow(workflowObject);

getStageParamsForWorkflow(workflowObject);
    
</entry>
<entry [Fri 2011:08:12 00:08:38 EST] WORKFLOW PARAMETER ROW setChainedOutputs TEST>

console.clear();
var doIt = function () {

console.clear();
dojo.reload("plugins.workflow.Parameters");
dojo.reload("plugins.core.Agua");
//dojo.reload("plugins.form.EditForm");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();

}
//doIt();

var parameters = Agua.controllers["workflow"].tabPanes[0].core.parameters;
parameters.childWidgets[2].value = "";
parameters.childWidgets[3].value = "ELAND/reference/ela";

var chainedOutputs = [{"project":"ELAND","args":"input.outputdir.value","inputParams":"","argument":"","appname":"createRefDirs","ordinal":"1","paramtype":"output","category":"","owner":"admin","workflownumber":"0","locked":"0","value":"ELAND/reference/eland","name":"referencedir","appnumber":"3","chained":1,"description":"Output reference directory containing per-chromosome subdirs with (linked) chromosome sequence files.","discretion":"","username":"syoung","workflow":"reference","format":"","valuetype":"directory","paramFunction":"","fileinfo":{"exists":"false","filepath":"/nethome/syoung/agua/ELAND/reference/elandchr22\.fa\.g"},"isValid":true,"sessionId":"9999999999.9999.999","mode":"addStageParameter"}];


parameters.resetChainedOutputs = function (chainedOutputs) {
	console.log("XXXX Parameters.resetChainedOutputs    Parameters.resetChainedOutputs(chainedOutputs");	
	console.log("xxx Parameters.resetChainedOutputs    chainedOutputs.length: " + chainedOutputs.length);
	console.log("Parameters.resetChainedOutputs    this.childWidgets.length: " + this.childWidgets.length);
	var thisObject = this;
	dojo.forEach(chainedOutputs, function(chainedOutput, i) {
		console.log("Parameters.resetChainedOutputs    chainedOutput " + i + ": " + chainedOutputs[i]);
		if ( chainedOutput == null )
		{
			console.log("Parameters.resetChainedOutputs    chainedOutput is null. NEXT");
			return;
		}
        console.log("Parameters.resetChainedOutputs    chainedOutput " + i + ": " + chainedOutput);
        var chainedValue = chainedOutput.value; 
	console.log("Parameters.resetChainedOutputs    chainedValue " + i + ": " + chainedValue);
		setOutputValue(chainedValue)
	});
};

var setOutputValue = function (chainedValue) {
	console.log("Parameters.setOutputValue    Parameters.setOutputValue(chainedValue)");
	console.log("Parameters.setOutputValue    chainedValue: " + chainedValue);
	console.log("Parameters.setOutputValue    this.childWidgets.length: " + parameters.childWidgets.length);
	var thisObject = this;
	dojo.forEach(parameters.childWidgets, function(parameterRow, j) { 
		console.log("Parameters.setOutputValue    parameterRow" + j + " '" + parameterRow.name + "'" + "[" + parameterRow.paramtype + "]: " + parameterRow.value);
		if ( parameterRow.paramtype == "input" )    return;
console.log("HERE");
		if ( chainedValue == null || chainedValue == '')   return;
		if ( chainedValue != parameterRow.value )
		{
			console.log("Parameters.setOutputValue    Setting parameterRow.value: " + chainedValue);
			parameterRow.value = chainedValue;
			parameterRow.valueNode.innerHTML = chainedValue;
			return;
		}
    });
};
parameters.resetChainedOutputs(chainedOutputs);
    
</entry>
<entry [Thu 2011:08:11 00:11:47 EST] core FIREBUG TESTS>



CORE COMMON

console.clear();
var doIt = function () {
    //dojo.reload("plugins.core.Agua");
    dojo.reload("plugins.core.Common");
    dojo.reloadPage()
    Agua.controllers["workflow"].createTab();
}
doIt();


    
</entry>
<entry [Mon 2011:08:08 01:25:47 EST] ADMIN PARAMETER ROW getWidgetValue TEST>


parameterRow.getWidgetValue = function (widget) {


console.log("*************************OVERRIDE************************");

	var value;

	console.log("Inputs.getWidgetValue    (widget: " + widget + ", name: " + name + ")");

	console.log("Inputs.getWidgetValue    widget: ");

	console.dir(widget);

	

	// NUMBER TEXT BOX

	if ( widget.id != null && widget.id.match(/^dijit_form_NumberTextBox/) )

	{

		console.log("Inputs.getWidgetValue    NumberTextBox widget[" + name + "].value name: " + name);

		value = String(widget);

		//value = String(widget.getValue());

	}

	// WIDGET COMBO BOX

	else if ( widget.get && widget.get('value') )

	{

		console.log("Inputs.getWidgetValue    widget.get('value') name: " + name);

		value = widget.get('value');

	}

	else if ( widget.getValue )

	{

		value = widget.getValue();

	}

	// HTML TEXT INPUT OR HTML COMBO BOX

	else if ( widget.value )

	{

		console.log("Inputs.getWidgetValue    widget.value name: " + name);

		value = String(widget.value.toString());

	}

	// HTML DIV	

	else if ( widget.innerHTML )

	{

	    console.log("Inputs.getWidgetValue    widget.innerHTML name: " + name);


	    // CHECKBOX
    	    if ( widget.innerHTML == "<input type=\"checkbox\">" )
	    {
		console.log("Inputs.getWidgetValue    CHECKBOX - GETTING VALUE");
		value = widget.childNodes[0].checked;
		console.log("Inputs.getWidgetValue    value: " + value);
	    }
            else {
		value = widget.innerHTML;

            }
	}

	

	console.log("Inputs.getWidgetValue    XXXX value: " + dojo.toJson(value));



        if ( value == null )    value = '';
	return value;

};


parameterRow.processWidgetValue = function (widget, name) {

	console.log("Inputs.processWidgetValue    (widget: " + widget + ", name: " + name + ")");

	var value = this.getWidgetValue(widget[name]);

	if ( value.replace == null )	return value;

	

	if ( value == null )	return null;

	if ( widget.formInputs[name] == "word" )

		value = this.cleanWord(value);

	else if ( widget.formInputs[name] == "phrase" )

		value = this.cleanEnds(value);

	if ( value != null )	this.setWidgetValue(widget[name], value);

	console.log("Inputs.processWidgetValue    widget: " + widget + ", name: " + name + ". Returning value: " + value);



	return value;

};


//console.dir(parameterRow.valueNode.firstChild);
//parameterRow.valueNode.firstChild;
//parameterRow.valueNode.firstChild.checked = true;

    
    
</entry>
<entry [Mon 2011:08:08 01:24:17 EST] WORKFLOW PANE FIREBUG TESTS>

PROJECT PANEL

var doIt = function () {
console.clear();
dojo.reload("plugins.workflow.WorkflowStage");
dojo.reload("plugins.workflow.ProjectWorkflow");
dojo.reload("plugins.workflow.ProjectPanel");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
};
doIt();
//dojo.reloadCss();




RUNSTATUS

var doIt = function () {
console.clear();
dojo.reload("plugins.workflow.RunStatus");
dojo.reload("plugins.workflow.Parameters");
dojo.reload("plugins.workflow.Workflow");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();
var runStatus = Agua.controllers["workflow"].tabPanes[0].core.runStatus;
};
doIt();
//dojo.reloadCss();


SHARED APPS

console.clear();
var doIt = function () {

dojo.reload("plugins.core.Agua");
dojo.reload("plugins.workflow.SharedApps");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();

}
doIt();


PARAMETERS

var doIt = function () {
console.clear();
dojo.reload("plugins.workflow.Parameters");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();
}
doIt();

var parameters = Agua.controllers["workflow"].tabPanes[0].core.parameters;
parameters;



PARAMETER ROW

var doIt = function () {
console.clear();
dojo.reload("plugins.workflow.ParameterRow");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();
}
doIt();

var parameters = Agua.controllers["workflow"].tabPanes[0].core.parameters;
parameters;
//var appType = dijit.byNode(parameters.domNode.childNodes[0]);
//appType;
var parameters = Agua.controllers["workflow"].tabPanes[0].core.parameters;
parameters;
var parameterRow = dijit.byNode(parameters.inputRows.childNodes[0]);
parameterRow;



STAGE ROW

console.clear();
var doIt = function () {
dojo.reload("plugins.core.Agua");
//dojo.reload("plugins.workflow.Parameters");
dojo.reload("plugins.workflow.StageRow");
//dojo.reload("plugins.workflow.Workflow");
//dojo.reload("plugins.workflow.ParameterRow");
//dojo.reload("plugins.form.EditForm");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();
};
doIt();

var stages = Agua.controllers["workflow"].tabPanes[0].core.stages;
var stageRow = stages.dropTarget.getAllNodes()[0].parentWidget;
//stageRow.checkValidParameters();


STAGES (STANDBY)
console.clear();
var doIt = function () {
dojo.reload("plugins.workflow.Stages");
dojo.reload("plugins.workflow.Workflow");
dojo.reload("plugins.core.Agua");
dojo.reloadPage()
Agua.controllers["workflow"].createTab();
};
doIt();

var stages = Agua.controllers["workflow"].tabPanes[0].core.stages;
console.dir({standby: stages.stagesStandby});


FILEMANAGER

var workflow = Agua.controllers["workflow"].tabPanes[0];
var fileman = workflow.core.fileManager;
fileman;
//fileman.show();
fileman.hide();


    
</entry>
<entry [Mon 2011:08:08 01:24:01 EST] ADMIN PANE FIREBUG TESTS>
    
AMIS

console.clear();
var doIt = function () {

    dojo.reload("plugins.admin.Amis");
    dojo.reload("plugins.admin.Admin");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    Agua.controllers["admin"].createTab();
}
doIt();


CLUSTERS

console.clear();
var doIt = function () {

    dojo.reload("plugins.admin.Clusters");
    dojo.reload("plugins.admin.Admin");
    dojo.reload("plugins.core.Agua");
    dojo.reloadPage()
    Agua.controllers["admin"].createTab();
}
doIt();
	
APPS

console.clear();
var doIt = function () {
    dojo.reload("plugins.core.Agua");
    //dojo.reload("plugins.form.EditRow");
    dojo.reload("plugins.admin.Apps");
    dojo.reloadPage()
    Agua.controllers["admin"].createTab();
}
doIt();


PARAMETERS

console.clear();

var doIt = function () {

dojo.reload("plugins.core.Agua");
dojo.reload("plugins.admin.Parameters");
dojo.reloadPage()
Agua.controllers["admin"].createTab();

}
doIt();

var params = Agua.controllers["admin"].tabPanes[0].paneWidgets("plugins.admin.Parameters")[0];
params;
    
</entry>
<entry [Mon 2011:07:25 17:39:41 EST] WORKFLOW insertStage>

echo '{"owner":"admin","location":"apps/aligners/elandHeader.pl","version":"0.01","executor":"/usr/bin/perl","name":"elandHeader","localonly":"0","description":"Convert incorrect header formats to the simple header format accepted by ELAND and other aligners matching this regex: \t\t\t[A-Z0-9.]:[0-9]:[0-9]:[0-9]:[0-9](#[0-9]/[12])?","notes":"Notes","url":"URL","type":"converter","appname":"elandHeader","appnumber":"4","number":"4","cluster":"","project":"Project1","workflow":"Workflow1","username":"syoung","workflownumber":"1","sessionId":"9999999999.9999.999","mode":"insertStage"}' | /var/www/cgi-bin/agua/0.6/workflow.cgi



var stage = {"owner":"admin","location":"apps/aligners/elandHeader.pl","version":"0.01","executor":"/usr/bin/perl","name":"elandHeader","localonly":"0","description":"Convert incorrect header formats to the simple header format accepted by ELAND and other aligners matching this regex: \t\t\t[A-Z0-9.]:[0-9]:[0-9]:[0-9]:[0-9](#[0-9]/[12])?","notes":"Notes","url":"URL","type":"converter","appname":"elandHeader","appnumber":"4","number":"4","cluster":"","project":"Project1","workflow":"Workflow1","username":"syoung","workflownumber":"1","sessionId":"9999999999.9999.999","mode":"insertStage"};

var params = Agua.getStageParameters(stage);
params.length;



</entry>
<entry [Mon 2011:07:25 00:28:19 EST] FIXED ROW HEIGHT IN ADMIN PARAMETER PANEL>

http://www.css3.info/preview/multi-column-layout/

CSS3 TUTORIALS
http://digitalartempire.com/2010/04/29-fascinating-css3-tuts-resources/
    
</entry>
<entry [Sun 2011:07:24 22:43:49 EST] CORE Common.js CONVERT BACKSLASH>

var convertBackslash = function (string, type) {

	//console.log("    Common.convertBackslash    plugins.form.EditForm.convertBackslash(string)");

	console.log("    Common.convertBackslash    BEFORE string: " + dojo.toJson(string));

	if ( string == null )	return '';

	if ( type == "textToHtml")

		string = string.replace(/\\/g, "\\\\");

	else

		string = string.replace(/\\\\/g, "\\");	

	console.log("    Common.convertBackslash    AFTER string: " + dojo.toJson(string));



	return string;

};

var string = "var suffix = file.replace(/(\\.[^.]{1,5})$/); file.replace(/(\\.[^.]{1,5})$/, \"\"); file += label; if ( suffix != null ) file += suffix; return file;";

string = convertBackslash(string, "textToHtml");



Common.convertBackslash BEFORE string: "var suffix = file.replace(/(\\.[^.]{1,5})$/); file.replace(/(\\.[^.]{1,5})$/, \"\"); file += label; if ( suffix != null ) file += suffix; return file;"
Common.convertBackslash AFTER string: "var suffix = file.replace(/(\\\\.[^.]{1,5})$/); file.replace(/(\\\\.[^.]{1,5})$/, \"\"); file += label; if ( suffix != null ) file += suffix; return file;"




//console.clear();
//dojo.reload("plugins.admin.Parameter");
//dojo.reload("plugins.form.EditRow");
//dojo.reload("plugins.core.Common");
//dojo.reloadPage()
//Agua.controllers["admin"].createTab();

var convertBackslash = function (string, type) {

	//console.log("    Common.convertBackslash    plugins.form.EditForm.convertBackslash(string)");

	console.log("    Common.convertBackslash    BEFORE string: " + dojo.toJson(string));

	if ( string == null )	return '';

	if ( type == "textToHtml")

		string = string.replace(/\\/g, "\\\\");

	else

		string = string.replace(/\\\\/g, "\\");	

	console.log("    Common.convertBackslash    AFTER string: " + dojo.toJson(string));



	return string;

};

var string = "var suffix = file.replace(/(\\.[^.]{1,5})$/); file.replace(/(\\.[^.]{1,5})$/, \"\"); file += label; if ( suffix != null ) file += suffix; return file;";

string = convertBackslash(string, "textToHtml");


    
</entry>
<entry [Tue 2011:07:19 03:48:07 EST] WORKFLOW APPS PANE>

var workflow = Agua.controllers["workflow"].tabPanes[0];
var appsmenu = workflow.core.sharedApps.contextMenu;
appsmenu;

// ISOLATE CLICKED AppRow WIDGET
var appsrow = appsmenu.menu.currentTarget.parentWidget;
console.dir(appsrow);

    
</entry>
