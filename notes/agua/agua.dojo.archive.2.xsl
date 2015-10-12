agua.dojo.archive.1


<entry [Wed 2011:07:13 03:35:10 EST] SET A TIMED SEQUENCE USING dojox.timing.Sequence>

var sleep = this.sleep;
var sequenceArray = new Array;
for ( var i = 0; i < directories.length; i++ )
////for ( var i = 0; i < 1; i++ )
{
    var directory = dojo.clone(directories[i]);
    sequenceArray.push({ func: [dojo.hitch(this,"setFileDrag", directory)], pauseAfter: 150 });
    sequenceArray.push({ func: [showMessage, window, "ProjectFiles.setFileDrag    Finished " + sleep + " milliseconds pause after load " + directory.name], pauseAfter: sleep });
}

function showMessage(msg) {
    console.log(msg);
}
 
var sequenceObject = null,
sequenceObject = new dojox.timing.Sequence({});
sequenceObject.go(sequenceArray, function() { console.log("Finished loading filesystems for type: '" + this.type + "'") });


NOTES
-----

var seq = [
    { func: [showMessage, window, "repeat 10 times and pause 100ms after"], repeat: 2, pauseAfter: 100 },
    { func: dojo.hitch(workflow, "runWorkflow"), pauseAfter: 8000 },
    { func: [showMessage, window, "after 1000ms pause this should be seen"], pauseAfter: 1000 },
    { func: dojo.hitch(workflow, "runStatus"), pauseAfter: 10000, repeat:100 },
    { func: returnWhenDone }  no array, just a function to call 
    { func: [dojo.hitch(console,"log","hoot"), window, "hoot2?"], pauseAfter: 1000, repeat:20 }
];

function returnWhenDone() {
console.log("Workflow.setSourceMenu     done.");
    //logMsg("in returnWhenDone");
    //setTimeout(continueSequence, 1000);
    return false;
}


</entry>
<entry [Thu 2011:05:19 04:09:20 EST] DOH FOR MODULES OUTSIDE THE DOJO DIRECTORY TREE>

html/t/plugins.runTests.html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
    <title>demo.doh Unit Test Runner</title>
    <meta http-equiv="REFRESH" 
          content="0;url=../../dojo-1.5.0/util/doh/runner.html?testModule=t.plugins.module">
  </head>
  <body>
      Redirecting to D.O.H runner.
  </body>
</html> 




IBM ARTICLE
http://www.ibm.com/developerworks/web/library/wa-aj-doh/index.html

DOH FOR MODULES OUTSIDE THE DOJO DIRECTORY TREE
http://stackoverflow.com/questions/414527/how-to-setup-the-dojo-objective-harness-test-case-structure-for-testing-custom-co

DOH can be used separately from Dojo, all you need is the "util" project where DOH resides. It has zero Dojo dependencies. In order to set it up for your own code, just take a look how Dojo does it. Usually the main file is called runTests.html. It is pretty much a boiler-plate, I just copy it over, and modify the URL in it to point to my own test module. For example, the Dojo Core tests' runTests.html uses "dojo.tests.module" ⇒ dojo/tests/module.js. Usually my directory is the peer to Dojo, so it will be something like "my.tests.module" located in my/tests/module.js or whatever I decide to name it.

Look in the Dojo's module.js — it includes other JavaScript files using dojo.require() (you can include and register your files with DOH without Dojo). It is possible to include files from different levels, or you can include a file (like dojo.tests._base) that includes more files. This is the way to make modular unit tests.

It is possible to include HTML files as well. For example, dojo.tests._base.html does it.

In short: it is simple, just read the docs, and use existing Dojo tests as a cheatsheet.



    
</entry>
<entry [Wed 2011:04:06 10:37:29 EST] INSTALL JAVA PLUGIN FOR FIREFOX TO ENABLE TESTS>

ONLY METHOD THAT WORKED:

USE FIREFOX ALREADY INSTALLED BY UBUNTU


NOTES
-----

1. CHECK IF FIREFOX HAS THE JAVA PLUGIN INSTALLED:

http://javatester.org/version.html

http://www.java.com/en/download/testjava.jsp

    Your Java is working
    Java update available
    Vendor: Sun MIcrosystems INc.
    Version: Java SE 6 Update 20
    Operating System: Linux 2.6.35-28
    Architecture: amd64

BUT NEED VERSION 6u24:

http://www.java.com/en/download/installed.jsp?jre_version=1.6.0_20&vendor=Sun+Microsystems+Inc.&os=Linux&os_version=2.6.35-28-generic

    Verifying Java Version
    Oops! You don't have the recommended Java installed.
    Your Java version is Version 6 Update 20. Please click the button below to get the recommended Java for your computer.


IF JAVA PLUGIN IS ALREADY INSTALLED, SKIP STEP 2


2. UPDATE JAVA USING apt-get

CURRENTLY INSTALLED:

aptitude search jre
p   default-jre                          - Standard Java or Java compatible Runtime      
p   default-jre-headless                 - Standard Java or Java compatible Runtime (head
p   docbook-jrefentry                    - DocBook XML JRefEntry DTD                     
p   gcj-4.4-jre                          - Java runtime environment using GIJ/classpath  
p   gcj-4.4-jre-headless                 - Java runtime environment using GIJ/classpath (
i A gcj-4.4-jre-lib                      - Java runtime library for use with gcj (jar fil
p   gcj-4.5-jre                          - Java runtime environment using GIJ/classpath  
p   gcj-4.5-jre-headless                 - Java runtime environment using GIJ/classpath (
p   gcj-4.5-jre-lib                      - Java runtime library for use with gcj (jar fil
p   gcj-jre                              - Java runtime environment using GIJ/classpath  
p   gcj-jre-headless                     - Java runtime environment using GIJ/classpath (
i   icedtea-6-jre-cacao                  - Alternative JVM for OpenJDK, using Cacao      
v   icedtea6-jre-cacao                   -                                               
p   libjrexx-java                        - automaton based regular expression API for jav
i   openjdk-6-jre                        - OpenJDK Java runtime, using Hotspot JIT       
i   openjdk-6-jre-headless               - OpenJDK Java runtime, using Hotspot JIT (headl
i   openjdk-6-jre-lib                    - OpenJDK Java runtime (architecture independent
v   openjdk-6-jre-shark                  -                                               
p   openjdk-6-jre-zero                   - Alternative JVM for OpenJDK, using Zero/Shark 
p   sun-java6-jre                        - Sun Java(TM) Runtime Environment (JRE) 6 (arch

INSTALLATION ARCHIVE FILES ARE HERE:

locate jre | grep 20
    /var/cache/apt/archives/icedtea-6-jre-cacao_6b20-1.9.7-0ubuntu1_amd64.deb
    /var/cache/apt/archives/openjdk-6-jre-headless_6b20-1.9.7-0ubuntu1_amd64.deb
    /var/cache/apt/archives/openjdk-6-jre-lib_6b20-1.9.7-0ubuntu1_all.deb
    /var/cache/apt/archives/openjdk-6-jre_6b20-1.9.7-0ubuntu1_amd64.deb


The following packages were automatically installed and are no longer required:
  libdecoration0 compiz-fusion-plugins-main
Use 'apt-get autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

apt-get install icedtea-6-jre-cacao



2. DOWNLOAD JAVA 

http://www.java.com/en/

DOWNLOAD FOR LINUX 64-BIT
cd /home/syoung/software/java
wget http://javadl.sun.com/webapps/download/AutoDL?BundleId=47147
mv BundleId=47147 jre-6u24-linux-x64.bin
chmod 755 *bin
./*bin

WHICH DECOMPRESSES THIS FOLDER:

/home/syoung/software/java/jre1.6.0_24
mv jre1.6.0_24 /usr/java

CONFIRM THE VERSION:

/usr/java/jre1.6.0_24/bin/java -version
    java version "1.6.0_24"
    Java(TM) SE Runtime Environment (build 1.6.0_24-b07)
    Java HotSpot(TM) 64-Bit Server VM (build 19.1-b02, mixed mode)

UPDATE /usr/java/bin:

mv /usr/bin/java /usr/bin/java-jre_6b20
ln -s /usr/java/jre1.6.0_24/bin/java /usr/bin/java

CONFIRM NEW VERSION IS ACCESSIBLE:

java -version
    java version "1.6.0_24"
    Java(TM) SE Runtime Environment (build 1.6.0_24-b07)
    Java HotSpot(TM) 64-Bit Server VM (build 19.1-b02, mixed mode)
    CHECK THE libnpjp2.so FILE IS PRESENT:



CREATE SYMBOLIC LINKS IN FIREFOX PLUGINS DIRECTORY
http://www.oracle.com/technetwork/java/javase/manual-plugin-install-linux-136395.html

CONFIRM THE libnpjp2.so FILE IS PRESENT:
cd /usr/java/jre1.6.0_24
find . -name libnpjp*

    ./lib/amd64/libnpjp2.so


Exit Firefox.
Uninstall any previous installations of Java Plugin.
Remove any symbolic links to other versions 
Create a symbolic link to the libnpjp2.so file in the browser plugins directory:

cd < Firefox installation directory >/plugins
ln -s < Java installation directory >/lib/i386/libnpjp2.so

I.E.:

cd /home/syoung/software/firefox/3.6.16/plugins
ln -s /usr/java/jre1.6.0_24/lib/amd64/libnpjp2.so libnpjp2.so


CONFIRM THE LINK IS PRESENT:

cd /home/syoung/software/firefox/3.6.16/plugins
    
    lrwxrwxrwx  1 root   root      43 2011-04-06 12:31 libnpjp2.so -> /usr/java/jre1.6.0_24/lib/amd64/libnpjp2.so*



RESTART FIREFOX AND TEST PLUGIN IS INSTALLED:

http://www.java.com/en/download/help/testvm.xml

    NO


TRY 3
-----

UBUNTU 64-bit Firefox and 64-bit Java plugin
https://help.ubuntu.com/community/AMD64/FirefoxAndPlugins


Instructions are different from Firefox 3.5 and Firefox 3.6. For obtaining the latest version of Firefox 3.6 (as of February 2010), refer to FirefoxNewVersion. For more information about changes in Firefox 3.6, see Why do I need Java 6 Update 10 and above for Firefox 3.6 and later versions?


Firefox 3.6:

REMOVE ICEDTEA PLUGIN AND INSTALL SUN PLUGIN

sudo apt-get remove --purge icedtea6-plugin
sudo apt-get install sun-java6-plugin

(You may need to enable the Partner repository to install the sun-java6-plugin package.)

CONFIGURE THE SUN PLUGIN: 

sudo update-alternatives --install /usr/lib/mozilla/plugins/libjavaplugin.so mozilla-javaplugin.so /usr/lib64/jvm/java-6-sun/jre/lib/amd64/libnpjp2.so 50


BUT THIS REVERTS /usr/bin/java TO icedtea_6b20:

java -version

    java version "1.6.0_20"
    OpenJDK Runtime Environment (IcedTea6 1.9.7) (6b20-1.9.7-0ubuntu1)
    OpenJDK 64-Bit Server VM (build 19.0-b09, mixed mode)


SO MANUALLY LINK THE NEW SUN JAVA EXECUTABLE TO /usr/bin/java:

mv /usr/bin/java /usr/bin/java-jre_6b20
ln -s /usr/lib64/jvm/java-6-sun/jre/bin/java /usr/bin/java

CONFIRM THE NEW LINK WORKS:

java -version

    java version "1.6.0_24"
    Java(TM) SE Runtime Environment (build 1.6.0_24-b07)
    Java HotSpot(TM) 64-Bit Server VM (build 19.1-b02, mixed mode)


VERIFY THE JAVA VERSION IN FIREFOX:

http://www.java.com/en/download/installed.jsp?detect=jre&try=2
http://www.java.com/en/download/testjava.jsp

    Something is wrong. Java is not working
    
    
FIX FIREFOX NOT FINDING PLUGINS
http://ubuntuforums.org/showthread.php?t=688685
http://derickrethans.nl/firefox-and-64-bit-java-plugin.html

cd /usr/lib/mozilla/plugins
ll
    lrwxrwxrwx 1 root root     39 2011-04-06 12:50 libjavaplugin.so -> /etc/alternatives/mozilla-javaplugin.so


mkdir -p /home/syoung/.mozilla/plugins/
ln -s /usr/lib/mozilla/plugins/libjavaplugin.so /home/syoung/.mozilla/plugins/

killall firefox-bin

VERIFY:

http://www.java.com/en/download/installed.jsp?detect=jre&try=2
http://www.java.com/en/download/testjava.jsp

    NO


TRY 4
------


http://www.php-architect.com/blog/2010/10/19/installing-java-plugin-for-firefox-on-ubuntu-10-10-maverick/

To get this fixed, I simply followed the steps :

1- Backup your repositories files.

sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

2- Open your repositories file:

sudo emacs -nw /etc/apt/sources.list

3- Add the following line then close the sources.list file

deb http://archive.canonical.com/ubuntu maverick partner

4- Uninstall both icedtea6-plugin and openjdk-6-jre.

sudo apt-get remove icedtea6-plugin openjdk-6-jre

5- Install sun-java6-plugin

sudo apt-get update
sudo apt-get install sun-java6-plugin
sudo update-alternatives --install /usr/lib/mozilla/plugins/mozilla-javaplugin.so mozilla-javaplugin.so /usr/lib/jvm/java-6-sun/jre/lib/amd64/libnpjp2.so 1

    update-alternatives: renaming mozilla-javaplugin.so link from /usr/lib/mozilla/plugins/libjavaplugin.so to /usr/lib/mozilla/plugins/mozilla-javaplugin.so.
    update-alternatives: using /usr/lib64/jvm/java-6-sun/jre/lib/amd64/libnpjp2.so to provide /usr/lib/mozilla/plugins/mozilla-javaplugin.so (mozilla-javaplugin.so) in auto mode.


http://blogs.sun.com/pc/entry/easy_way_to_set_your


LIST ALL INSTALLED JAVA VERSIONS (USUALLY IN /usr/lib/jvm)

ls -l /usr/lib/jvm

    drwxr-xr-x 4 root root 4096 2011-03-25 16:34 java-1.5.0-gcj-4.4
    lrwxrwxrwx 1 root root   14 2011-03-24 18:55 java-1.6.0-openjdk -> java-6-openjdk
    drwxr-xr-x 5 root root 4096 2011-03-24 18:55 java-6-openjdk
    lrwxrwxrwx 1 root root   19 2011-04-06 12:49 java-6-sun -> java-6-sun-1.6.0.24
    drwxr-xr-x 6 root root 4096 2011-04-06 12:49 java-6-sun-1.6.0.24


CREATE LINKS FOR ALL IMPORTANT JAVA BINARIES FOR YOUR SELECTED THE JAVA VERSION

sudo update-java-alternatives -s java-6-sun
    
    update-alternatives: error: no alternatives for appletviewer.
    update-alternatives: error: no alternatives for apt.
    update-alternatives: error: no alternatives for extcheck.
    update-alternatives: error: no alternatives for HtmlConverter.
    update-alternatives: error: no alternatives for idlj.
    update-alternatives: error: no alternatives for jar.
    update-alternatives: error: no alternatives for jarsigner.
    update-alternatives: error: no alternatives for javac.
    update-alternatives: error: no alternatives for javadoc.
    update-alternatives: error: no alternatives for javah.
    update-alternatives: error: no alternatives for javap.
    update-alternatives: error: no alternatives for jconsole.
    update-alternatives: error: no alternatives for jdb.
    update-alternatives: error: no alternatives for jhat.
    update-alternatives: error: no alternatives for jinfo.
    update-alternatives: error: no alternatives for jmap.
    update-alternatives: error: no alternatives for jps.
    update-alternatives: error: no alternatives for jrunscript.
    update-alternatives: error: no alternatives for jsadebugd.
    update-alternatives: error: no alternatives for jstack.
    update-alternatives: error: no alternatives for jstat.
    update-alternatives: error: no alternatives for jstatd.
    update-alternatives: error: no alternatives for native2ascii.
    update-alternatives: error: no alternatives for pluginappletviewer.
    update-alternatives: error: no alternatives for rmic.
    update-alternatives: error: no alternatives for schemagen.
    update-alternatives: error: no alternatives for serialver.
    update-alternatives: error: no alternatives for wsgen.
    update-alternatives: error: no alternatives for wsimport.
    update-alternatives: error: no alternatives for xjc.
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/appletviewer
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/apt
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/extcheck
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/HtmlConverter
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/idlj
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jarsigner
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jar
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/javac
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/javadoc
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/javah
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/javap
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jconsole
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jdb
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jhat
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jinfo
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jmap
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jps
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jrunscript
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jsadebugd
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jstack
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jstatd
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/jstat
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/native2ascii
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/rmic
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/schemagen
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/serialver
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/wsgen
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/wsimport
    update-java-alternatives: jdk alternative does not exist: /usr/lib/jvm/java-6-sun/bin/xjc



CONFIRM WITH java -version:

java -version

    java version "1.6.0_24"
    Java(TM) SE Runtime Environment (build 1.6.0_24-b07)
    Java HotSpot(TM) 64-Bit Server VM (build 19.1-b02, mixed mode)






ENABLE JAVA IN FIREFOX:
http://support.mozilla.com/en-US/kb/Using%20the%20Java%20plugin%20with%20Firefox





IF NOT, INSTALL IT

In Firefox 3.6 and later versions you need the "Next-Generation Java™ Plug-In" (NPAPI plugin?) present in Java 6 U10 and later:
    Linux: libnpjp2.so
    Windows: npjp2.dll

LINUX: CREATE SYMBOLIC LINKS IN FIREFOX PLUGINS DIRECTORY
http://www.oracle.com/technetwork/java/javase/manual-plugin-install-linux-136395.html

Exit Firefox.
Uninstall any previous installations of Java Plugin.
Remove any symbolic links to other versions 
Create a symbolic link to the libnpjp2.so file in the browser plugins directory:

cd < Firefox installation directory >/plugins
ln -s < Java installation directory >/lib/i386/libnpjp2.so

I.E.:

cd /home/syoung/software/firefox/4.0rc2/plugins
ln -s /usr/local/java/jre1.6.0_20/lib/i386/libnpjp2.so libnpjp2.so
ln -s /usr/lib/jvm/jre/lib/i386/libnpjp2.so /usr/lib/mozilla/plugins/libnpjp2.so

(java-1_6_0-sun-plugin)


LINKS:
http://support.mozilla.com/en-US/kb/Using%20the%20Java%20plugin%20with%20Firefox
http://support.mozilla.com/en-US/questions/761107#answer-113174
http://java.com/en/download/faq/firefox_newplugin.xml
http://java.sun.com/javase/6/webnotes/install/jre/manual-plugin-install-linux.html 

To configure the Java Plugin follow these steps:
http://www.java.com/en/download/help/linux_install.xml#enable

DOWNLOAD PAGE:
http://java.com/en/download/manual.jsp

mkdir -p /home/syoung/software/java
wget http://javadl.sun.com/webapps/download/AutoDL?BundleId=47146
chmod ./jre-1_5_0_02-linux-amd64.bin
./jre-1_5_0_02-linux-amd64.bin

    type YES to agree to the license agreement


RESTART FIREFOX AND TEST PLUGIN IS INSTALLED:

http://www.java.com/en/download/help/testvm.xml

    NO
    

2. ENABLE JAVA PLUGIN IN FIREFOX

about:config

SET java.default_java_location_others TO /usr/bin/java (FROM /usr/java)

http://www.java.com/en/download/help/enable_browser.xml

FOR FIREFOX:

Tools --> Add-ons --> Plugins



    
</entry>

<entry [Wed 2011:04:06 00:41:12 EST] Added dojox.robot RECORDER TO t/workflow/workflow.html>

GENERATE A SERIES OF ROBOT TESTS:

1. ADD RECORDER TO PAGE

dojo.require("dojox.robot.recorder");

2. RECORD SOME TEST
REPEAT THE FOLLOWING 3 STEPS AND RECORD ONE TEST PER WIDGET, PER TYPE (keyboard vs mouse for instance)

    START: CTRL-ALT-ENTER in an area of the document with no dojo.stopEvents
    (You will get a verification alert when you successfully start the recorder.)
    
    TEST: INTERACT WITH PAGE TO GENERATE ONE TEST
    
    STOP: press CTRL-ALT-ENTER in an area of the document with no dojo.stopEvents
    You will see a box containing the generated source 

3. REMOVE RECORDER FROM PAGE
dojo.require("dojox.robot.recorder");

4. DROP CODE INTO TEST CONDITION, SETTING A PASS CONDITION. THE TEST WILL REPEAT YOUR ACTIONS.
Copy this into a dojo.addOnLoad on the same page to register the test with DOH.

Replace the /*Your condition here*/ text with a JS condition that indicates that the test passed. (having multiple small tests will help you keep the condition small.)

Add a doh.run() call after you register all of your tests to make them execute when you load the page.


NOTES
-----

http://localhost/agua/0.6/dojo-1.5.0/dojox/robot/README

Project description

Writing automated test cases takes time, and DOH is no exception. You have to
look up element ids, invent dojo.queries for elements with no id,
figure out exactly how many pixels to move the mouse . . . the list goes on.

This recorder module enables DOH test case writers to create complete DOH test
scripts directly from their actions and input on a Web page. Simply drop the
generated code into your test page, set a pass condition, and the test will
repeat your actions.

-------------------------------------------------------------------------------
Dependencies:

dojo
-------------------------------------------------------------------------------
Documentation

See installation instructions below to prepare a test page for recording.

To record a test, click in an area of the document with no dojo.stopEvents
and press CTRL-ALT-ENTER in the main window. You will get a verification alert
when you successfully start the recorder. Then you can interact with the Web
page and the recorder will monitor your actions. It's usually good to record one
test per widget instance per type of interaction (keyboard vs mouse for instance)
you are testing.

After you finish interacting with the Web page, click out of any dojo.stopEvents
and press CTRL-ALT-ENTER again. You will see a box containing the generated source 
code for your recording. 
-------------------------------------------------------------------------------
Installation instructions

To ready the recorder for a particular page, add this line to your dojo.requires:
dojo.require("dojox.robot.recorder");

You can safely remove this line after you are finished recording your tests.
-------------------------------------------------------------------------------
Additional Notes

Known limitations:
- Content in an iframe might not report events to the recorder.
- keyDown/keyUp events are supported by DOH, but not by the recorder.
	If you hold a key down, it will generate lots of keyPress events instead.
	Simply change these to one keyDown call yourself.

    
</entry>
<entry [Tue 2011:03:22 11:56:29 EST] FIXED ERROR: invalid 'in' operand scope.params>

SOLUTION:

node.params IS A RESERVED ARRAY OBJECT. THE PAGE DIES WITH THIS ERROR WHEN YOU SET IT TO A SCALAR (TO STORE THE params VALUE FOR THE APP).


PROBLEM:

paramFunction ARGUMENT OF APPLICATION eland2ace.pl WHEN POPULATED GIVES A TERMINAL ERROR

VALUE:

"paramFunction": "return inputfile.replace(/.txt/, \".ace\");"

ERROR:

ParameterRow.constructor args.parentWidget: [Widget plugins.workflow.Parameters, plugins_workflow_Parameters_0]
ParameterRow.constructor END
invalid 'in' operand scope.params
[Break On This Error] (930 out of range 505)
    
</entry>

<entry [Tue 2011:03:22 11:55:47 EST] REMOVED JSON-COMMENTED RISK WITH getData()>
    
To decrease the chances of hijacking, use the standard the 'json' handler and prefix your json with: {}&& Use djConfig.useCommentedJson=true to turn off this message.

</entry>


<entry [Sun 2011:03:20 02:08:59 EST] INSTALLED illuminations BETA >
    
DOJO SUPPORT WORKED USING THIS SITE:

    https://user.sitepen.com/~dwalsh/dijit-forms.html
    

COPIED TO tests FOLDER:

BASIC
tests/illuminations/illum1.html

USING LOCAL DOJO

tests/illuminations/illum2-local.html

OK FOR INLINE STUFF BUT DOESN'T FIND WIDGETS IN DYNAMICALLY LOADED TEMPLATES OR WIDGETS INSIDE THOSE WIDGETS
    
</entry>


<entry [Sun 2011:03:20 01:48:53 EST] INSTALLED FIREUNIT FIREBUG EXTENSION FOR UNIT TESTING>
  
  
http://fireunit.org/  


(Once you have the extension installed, open the new Test tab in Firebug to see some results.)


</entry>

<entry [Sun 2011:03:20 01:39:23 EST] SEPARATE INSTALL OF FIREFOX 4.0>
    
VERSIONS:

FIREFOX 4.0rc2 (RELEASE CANDIDATE)

Firebug 1.7b3

illuminations_for_developers_for_firebug-1.1.6beta1-fx.xpi



INSTALLED FIREFOX 4.0rc2 TO

/home/syoung/software/firefox/4.0rc2


CREATED A NEW PROFILE:

NB: Before you can start the Profile Manager, Firefox must be completely closed!!

cd /home/syoung/software/firefox/4.0rc2
./firefox -ProfileManager


CREATED PROFILE: aguadev


CREATE DESKTOP SHORTCUT

COPY SHORTCUT, RIGHTCLICK AND SET PATH:

/home/syoung/software/firefox/4.0rc2/firefox %u -P aguadev


NOTES
-----

http://kb.mozillazine.org/Testing_pre-release_versions
http://kb.mozillazine.org/Creating_a_new_Firefox_profile_on_Windows

AND MAINLY: 
http://support.mozilla.com/ast/questions/788294

/home/syoung/software/firefox/4.0rc2
You should create a new profile exclusively for the 4.0 beta version and create a desktop shortcut with -P "profile" appended to the target to launch that profile to avoid the Fi

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


<entry [Thu 2011:03:10 14:20:40 EST] REM: REVISIT THIS IN admin.Apps.setForm.function>

	//// FINISH LATER: () {

	//// THIS DOESN'T WORK AS DESIRED. ONKEYPRESS 
	//// FOR EVERY KEY MAKES THE FOCUS SHIFT TO THE
	//// LAST MEMBER IN THE ARRAY (addAppButton)
	//// NEED TO TRAP THE SCOPE OF THE CONNECT
	//
	//// SET LISTENER TO MOVE TO NEXT INPUT WHEN 'RETURN' IS HIT
	//var inputChain = [ "newName", "newType", "newLocation", "newExecutor", "newVersion", "newDescription", "newNotes", "addAppButton" ];
	//for ( var i = 1; i < inputChain.length; i++ )
	//{
	//	//////console.log("Apps.setForm    inputChain[" + (i - 1) + "]: " + inputChain[i - 1]);
	//
	//	// SET NEW LISTENER
	//	var appsObject = this;
	//	var currentPosition = this[inputChain[i - 1]];
	//	var nextPosition = this[inputChain[i]];
	//	//////console.log("Apps.setForm    currentPosition: " + currentPosition);
	//	//////console.log("Apps.setForm    nextPosition: " + nextPosition);
	//	
	//	
	//	dojo.connect(currentPosition, "onkeypress", dojo.hitch(this, function(evt){
	//		var key = evt.charOrCode;
	//		if ( key == 13 )
	//		{				
	//			// SHIFT FOCUS TO NEXT INPUT
	//			nextPosition.focus();
	//		}
	//		
	//		// REMOVE ANY LINE RETURNS
	//		this.value = this.value.replace(/\n/, '');
	//	}));
	//}

	//// SET NEW APP LISTENER
	//var appsObject = this;
	//dojo.connect(this.newName, "onkeypress", function(evt){
	//	var key = evt.charOrCode;
	//	if ( key == 13 )
	//	{				
	//		// SHIFT FOCUS TO NEXT INPUT
	//		appsObject.newDescription.focus();
	//	}
	//	
	//	// REMOVE ANY LINE RETURNS
	//	this.value = this.value.replace(/\n/, '');
	//});
	//
	//// SET NEW APP LISTENER
	//var appsObject = this;
	//dojo.connect(this.newDescription, "onkeypress", function(evt){
	//	var key = evt.charOrCode;
	//	if ( key == 13 )
	//	{
	//		// SHIFT FOCUS TO NEXT INPUT
	//		appsObject.newNotes.focus();
	//	}
	//
	//	// REMOVE ANY LINE RETURNS
	//	this.value = this.value.replace(/\n/, '');
	//});
	//
	//// SET NEW APP LISTENER
	//var appsObject = this;
	//dojo.connect(this.newNotes, "onkeypress", function(evt){
	//	var key = evt.charOrCode;
	//	if ( key == 13 )
	//	{
	//		// SHIFT FOCUS TO SAVE BUTTON
	//		appsObject.addAppButton.focus();
	//	}
	//
	//	// REMOVE ANY LINE RETURNS
	//	this.value = this.value.replace(/\n/, '');
	//});

	
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


<entry [Mon 2011:03:07 22:23:07 EST] TEST ADD/REMOVE VIEW AND VIEWFEATURE CGI COMMANDS>
	
ADD FEATURE
echo '{"sourceproject":"Project1","sourceworkflow":"Workflow1","species":"human","build":"hg19","feature":"ntHumChimp","project":"Project1","view":"View10","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"}' | ./view.cgi


REMOVE FEATURE
echo '{"project":"Project1","view":"View1","feature":"ntHumChimp","species":"human","build":"hg19","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeViewFeature"}' | ./view.cgi
 

REMOVE VIEW -OK
{"project":"Project1","view":"View7","username":"syoung","sessionId":"9999999999.9999.999","mode":"removeView"}


ADD VIEW -OK

echo '{"project":"Project1","view":"View10","username":"syoung","sessionId":"9999999999.9999.999","mode":"addView"}' | ./view.cgi

echo '{"username":"syoung","sessionId":"9999999999.9999.999","mode":"getData"}' |  ./workflow.cgi

	
</entry>


<entry [Sat Oct 16 11:02:46 EDT 2010] REFACTORED CHECK INPUTS FOR INFOPANE>

1. RENAMED InfoPane TO Parameters

2. RENAMED Workflows TO Stages

3. COMMENTED OUT InfoPane.js LINE 103:

		//// CHECK IF THE INPUT IS VALID, E.G., FILE OR DIRECTORY IS PRESENT
		//var inputValue = this.getInputValue();
		//this.checkInput(this.valueNode, inputValue);

ADDED TO 



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

Amazon web services provide scalable, on demand computational resources through their elastic compute cloud (EC2). Previously, I described the goal of providing publicly available machine images loaded with bioinformatics tools. 1I'm happy to describe an initial step in that direction: an automated build system, using easily editable configuration files, that generates a bioinformatics-focused Amazon Machine Image (AMI) containing packages integrated from several existing efforts. The hope is to consolidate the community's open source work around a single, continuously improving, machine image.

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

<!--
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

-->

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

<!--<script type="application/x-javascript" >
	var djConfig = {
		parseOnLoad:false,
		baseUrl:"chrome://myext/content/dojo/dojo/"
	}
</script>
<script src="chrome://myext/content/dojo/dojo/dojo.js.uncompressed.js" type="application/x-javascript" />
-->



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


