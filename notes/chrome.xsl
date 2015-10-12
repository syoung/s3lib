chrome




<entry [Mon 2014:10:27 03:40:56 EST] >

http://www.sitepen.com/blog/2014/02/25/dojo-faq-how-can-i-conditionally-load-amd-modules/

Conditional Loading with Nested require

Using the dojo/has module is simple and convenient, but sometimes you may want to choose from numerous modules, or you may even want to be able to determine the module ID more dynamically. AMD’s require function can be used within a require callback, so you can create code that determines a module ID at run-time and then call require to load the module. Module IDs are, after all, simply strings! The following example loads a different module depending on the type of device: desktop, tablet, or mobile phone.

require([
    'dojo/has'
], function (has) {
    var ui;
    var moduleId = 'myApp/ui/';
 
    // Assume 'has' tests for mobile and tablet
    // have been defined
    if (has('mobile')) {
        moduleId += 'Mobile';
    }
    else if (has('tablet')) {
        moduleId += 'Tablet';
    }
    else {
        moduleId += 'Desktop';
    }
 
    require([moduleId], function (UiModule) {
        ui = new UiModule();
        ui.placeAt(document.body);
        ui.startup();
    });
});


This example has been kept simple to keep the focus on demonstrating nested require and dynamic module IDs, but it is actually simple enough that nested dojo/has loader plugins could handle it:

require([
    'dojo/has!mobile?myApp/ui/Mobile:dojo/has!tablet?myApp/ui/Tablet:myApp/ui/Desktop'
], function (UiModule) {
    var ui = new UiModule();
    ui.placeAt(document.body);
    ui.startup();
});

	
</entry>
<entry [Sat 2014:10:25 22:07:32 EST] DEVTOOLS TIPS - USING THE CONSOLE>

https://developer.chrome.com/devtools/docs/console



console.dir(ELEMENT)

You can also log an element's JavaScript representation with the console.dir() method:

console.dir(document.body.firstElementChild);


Format specifier	Description
%s	Formats the value as a string.
%d or %i	Formats the value as an integer.
%f	Formats the object as a floating point value.
%o	Formats the value as an expandable DOM element (as in the Elements panel).
%O	Formats the value as an expandable JavaScript object.
%c	Applies CSS style rules to output string specified by the second parameter.

E.G.:

console.log("%O", document.body.firstElementChild);

console.log("%cThis will be formatted with large, blue text", "color: blue; font-size: x-large");



console.time()

Measuring how long something takes
You can use the console.time() and console.timeEnd() methods to measure how long a function or operation in your code takes to complete. You call console.time() at the point in your code where you want to start the timer and console.timeEnd() to stop the timer. The elapsed time between these two calls is displayed in the console.

console.time("Array initialize");var array= new Array(1000000);for (var i = array.length - 1; i >= 0; i--) {    array[i] = new Object();};console.timeEnd("Array initialize");
Example of using console.time() and timeEnd()

Note: You must pass the same string to console.time() and timeEnd() for the timer to finish as expected.


monitorEvents()

The monitorEvents() command monitors an object for one or more specified events. When an event occurs on the monitored object, the corresponding Event object is logged to the Console. You specify the object and the events you want to monitor on that object. For example, the following code enables event monitoring for every "resize" event on the global window object.

monitorEvents(window, "resize");
Monitoring window resize events

To monitor several events, you can pass an array of event names as the second parameter. The code below monitors both "mousedown" and "mouseup" events on the body of the document.

monitorEvents(document.body, ["mousedown", "mouseup"]);

You can also pass one of the supported "event types" that DevTools maps to a set of actual event names. For example, the "touch" event type cause DevTools to monitor "touchstart", "touchend", "touchmove", and "touchcancel" events on the target object.

monitorEvents($('#scrollBar'), "touch");

See monitorEvents() in the Console API Reference for a list of supported event types.

To stop monitoring events call unmonitorEvents(), passing the object to stop monitoring.

unmonitorEvents(window);


profile(...)

You can create JavaScript CPU profiles from the command line with the profile() and profileEnd() commands. You can optionally specify a name that's applied to the profile you create.

If you specify a label for the new profile, it is used as the new profile's heading. If you create multiple profiles with the same name, they are grouped as individual runs under the same heading:

CPU profiles can be nested, for example:

profile("A");profile("B");profileEnd("B")profileEnd("A")
The calls to stop and start profiling do not need be properly nested. For example, the following works the same as the previous example:

profile("A");profile("B");profileEnd("A");profileEnd("B");
	
</entry>
<entry [Sat 2014:10:25 14:52:01 EST] LIVE EDIT WITH WORKPLACES IN CHROME>

1. INSTALL LATEST CHROME

2. INSTALL WebTools PLUGIN

3. ADD FILES TO WORKPLACE

WebTools --> Settings --> Workplaces --> Add folder


4. RESTART CHROME

5. EDIT JS FILE IN WebTools

	CONFIRMED CHANGED ON DISK!!!



</entry>
<entry [Sat 2014:10:25 11:34:45 EST] LIVE EDIT WITH CHROMIUM ON UBUNTU>

******************************************
*** DIDN'T NEED BECAUSE WORKSPACES WORKS IN CHROME!!
******************************************

http://opensas.wordpress.com/2013/06/12/live-hot-code-reloading-with-chromium-browser-on-linux/


	
</entry>
<entry [Sat 2014:10:25 11:22:07 EST] LIVE EDIT JS FILES - INSTALLED INTELLIJ>

******************************************
*** DISCARDED DUE TO PROBLEMS:

- COULD NOT INSTALL LiveEdit PLUGIN
- CSS/JavaScript sync and element highlighting are not working if Web Inspector is opened
- Usability issue with the "plugin is debugging this tab" infobar

******************************************

http://yoursoftengineer.blogspot.ie/2014/10/web-development-live-edit-your-html-css.html




1. DOWNLOAD AND INSTALL JAVA

jdk 1.8.0-25


2. INSTALL DEPENDENCIES

apt-get install libxtst6:i386


3. DOWNLOAD AND INSTALL INTELLIJ (COMMUNITY EDITION)

https://www.jetbrains.com/idea/download/download_thanks.jsp



    
</entry>
<entry [Fri 2014:10:24 13:42:30 EST] ENABLED WORKFLOWS LIVE EDIT JAVASCRIPT>

https://plus.google.com/+GoogleChromeDevelopers/posts/644qQuBKZeL

2. ENABLE DEVELOPER TOOLS EXPTS IN CHROME://FLAGS

chrome://flags

	Enable Developer Tools experiments. Mac, Windows, Linux, Chrome OS
	Enable Developer Tools experiments. Use Settings panel in Developer Tools to toggle individual experiments. #enable-devtools-experiments


	
</entry>
<entry [Fri 2014:10:24 01:34:07 EST] INSTALLED fb-flo>

https://github.com/facebook/fb-flo#usage

https://github.com/facebook/fb-flo

1. INSTALL PLUGIN

Grab the fb-flo Chrome extension

https://chrome.google.com/webstore/detail/ahkfhobdidabddlalamkkiafpipdfchp

This will add a new tab in your Chrome DevTools called 'flo'.


2. INSTALL fb-flo

npm install -g fb-flo



2. CREATE AND RUN flo.js

you havent started your node file. create a js file as in the readme. then start the node file

mkdir -p /home/syoung/notes/agua/private/bin/test/node/flo
cd /home/syoung/notes/agua/private/bin/test/node/flo

emacs flo.js

var flo = require('fb-flo'),
    path = require('path'),
    fs = require('fs');

var sourceDirToWatch = "/a/html";

var server = flo(
  sourceDirToWatch,
  {
    port: 8888,
    host: 'localhost',
    verbose: false,
    glob: [
       // All JS files in `sourceDirToWatch` and subdirectories
      '**/*.js',
       // All CSS files in `sourceDirToWatch` and subdirectories
      '**/*.css'
    ]
  },
  function resolver(filepath, callback) {
    // 1. Call into your compiler / bundler.
    // 2. Assuming that `bundle.js` is your output file, update `bundle.js`
    //    and `bundle.css` when a JS or CSS file changes.
    callback({
      resourceURL: 'bundle' + path.extname(filepath),
      // any string-ish value is acceptable. i.e. strings, Buffers etc.
      contents: fs.readFileSync(filepath),
      update: function(_window, _resourceURL) {
        // this function is executed in the browser, immediately after the resource has been updated with new content
        // perform additional steps here to reinitialize your application so it would take advantage of the new resource
        console.log("Resource " + _resourceURL + " has just been updated with new content");
      }
    });
  }
);


nodejs flo.js


3. CONFIGURE fb-flo

To activate fb-flo from the browser:

Open Chrome DevTools.
Click on the new 'fb-flo' pane.
Click on 'Activate for this site'


 



	
</entry>
<entry [Fri 2014:10:24 01:32:47 EST] INSTALLED DEVTOOLS-TERMINAL PLUGIN>

https://chrome.google.com/webstore/detail/devtools-terminal/leakmhneaibbdapdoienlkifomjceknl/related



*** Important announcement! ***                                                              

Due to Chrome's abandonment of NPAPI, we had to move to a newer technology                                           
called Native Messaging API.                                                                                         

Which is kind of good, because now we fully support Linux!                                                           
The bad news is that in order to use Devtools Terminal now you have to manually                                      
install the Node.js proxy.                                                                                           

Don't worry, it's easy, here are some quick instructions to get you going:                                           

* Install Node.js (http://nodejs.org/)                                                                               
* Open your terminal and run:                                                                                        
 npm install -g devtools-terminal                                                                                   
 sudo devtools-terminal --install --id=leakmhneaibbdapdoienlkifomjceknl                                             

Basically, the first command will install the proxy app and the second one will                                      
tell the Chrome browser where to find it.                                                                            

If it didn't work for you,                                                                                           
please, report at https://github.com/petethepig/devtools-terminal/issues                                             


</entry>
<entry [Fri 2014:09:19 01:09:34 EST] FIXED ERROR: 'Your profile could not be opened correctly'>

PROBLEM

WHEN OPEN CHROME GET THIS ERROR

Your profile could not be opened correctly. Some features may be unavailable. Please check that the profile exists and you have permission to read and write its contents


SOLUTION

https://support.google.com/chrome/answer/142059?hl=en

1. CLOSE CHROME


2. RENAME Default FOLDER

mv ~/.config/google-chrome/Default ~/.config/google-chrome/Default.bkp


3. START CHROME

    A new "Default" folder is automatically created

    ~/.config/google-chrome/Default

    
4. COPY BOOKMARKS FROM OLD FOLDER


If you wish, you can transfer information from your old user profile to your new one. However, this action is not recommended, since a part of your old profile may be corrupt. With that in mind, to transfer your old bookmarks, copy the "Bookmarks.bak" file from the "Backup default" folder to your new "Default" folder. Once moved, rename the file from "Bookmarks.bak" to "Bookmarks" to complete the migration. All other browser data will remain in the "Backup default" folder, but you won't be able to transfer it to your new profile.

    
</entry>
<entry [Wed 2014:01:29 15:25:05 EST] CHROME PLUGIN colorZilla (COLOUR PICKER, EYE-DROPPER)>


http://www.colorzilla.com/chrome/
	
</entry>
<entry [Sun 2013:12:15 07:17:28 EST] RESPONSIVE WEBSITE PLUGINS>


Responsive Website Tester

Dimension

VNC Viewer

Responsive Inspector

	
</entry>
<entry [Mon 2013:12:02 19:53:21 EST] BRACKETS AND OTHER node.js IDEs AND CHROME PLUGINS>

BRACKETS

http://download.brackets.io



https://developers.google.com/chrome-developer-tools/docs/debugging-clients

Sample Debugging Protocol Clients

There are a number third-party clients for the Chrome debugging protocol. This section presents a sample.

Brackets is a web-based IDE that uses the Chrome debugging protocol to enable debugging and live HTML/CSS development.


More information:

Official site.
This blog post from Mark DuBois gives an overview of working in Brackets.
Download from download.brackets.io.
Source code available on GitHub.
Light Table

Light Table is a new IDE that takes a novel approach to arranging the developer's workspace. Light Table is currently in alpha. It's not open source, but the alpha version is available for free at this time.



More information:

Read the blog post describing new features in 0.4.0, including DevTools integration.
Download from the official site.
NodeJS

A number of modules have been developed to make use of the Chrome debugger from Node scripts.

chrome-remote-interface

The chrome-remote-interface module wraps the debugger protocol with a Node-style JavaScript API.



More information:

Install using npm:

npm install -g chrome-remote-interface
Source code available on GitHub.

crconsole



Light Table

http://www.chris-granger.com/2013/04/28/light-table-040/

Light Table is a new IDE that takes a novel approach to arranging the developer's workspace. Light Table is currently in alpha. It's not open source, but the alpha version is available for free at this time.


Brackets

Brackets is a web-based IDE that uses the Chrome debugging protocol to enable debugging and live HTML/CSS development.



	
</entry>
<entry [Mon 2013:12:02 19:00:54 EST] ENABLE WebGL IN CHROME ON UBUNTU>


http://askubuntu.com/questions/299345/how-to-enable-webgl-in-chrome-on-ubuntu


1. VERIFY NO WebGL SUPPORT IN CHROME

chrome://gpu/

	Graphics Feature Status
	Canvas: Software only, hardware acceleration unavailable
	Compositing: Software only, hardware acceleration unavailable
	3D CSS: Unavailable. Hardware acceleration unavailable
	CSS Animation: Software only, hardware acceleration unavailable
	WebGL: Unavailable. Hardware acceleration unavailable
	WebGL multisampling: Unavailable. Hardware acceleration unavailable
	Flash 3D: Unavailable. Hardware acceleration unavailable
	Flash Stage3D: Unavailable. Hardware acceleration unavailable
	Flash Stage3D Baseline profile: Unavailable. Hardware acceleration unavailable
	Texture Sharing: Unavailable. Hardware acceleration unavailable
	Video Decode: Software only, hardware acceleration unavailable
	Video: Software only, hardware acceleration unavailable


http://webglreport.com/

	WebGL Report
	
	This browser does not support WebGL.


2. IN CHROME

chrome://flags

3. DO CTRL+F --> Rendering list --> 'Override software rendering list--> Enable

4. RESTART CHROME (AND kill -9 ALL RUNNING chrome PROCESSES)


5. VERIFY WebGL SUPPORT

chrome://gpu/

	Graphics Feature Status
	Canvas: Hardware accelerated
	Compositing: Hardware accelerated
	3D CSS: Hardware accelerated
	CSS Animation: Accelerated
	WebGL: Hardware accelerated
	WebGL multisampling: Hardware accelerated
	Flash 3D: Hardware accelerated
	Flash Stage3D: Hardware accelerated
	Flash Stage3D Baseline profile: Hardware accelerated
	Texture Sharing: Hardware accelerated
	Video Decode: Hardware accelerated
	Video: Hardware accelerated


http://webglreport.com/

Platform:	Linux x86_64
Browser User Agent:	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.57 Safari/537.36
Context Name:	webgl
GL Version:	WebGL 1.0 (OpenGL ES 2.0 Chromium)
Shading Language Version:	WebGL GLSL ES 1.0 (OpenGL ES GLSL ES 1.0 Chromium)
Vendor:	WebKit
Renderer:	WebKit WebGL
Antialiasing:	Available
ANGLE:	false

ALSO CHECK:

http://threejs.org/




NOTES
-----
http://askubuntu.com/questions/299345/how-to-enable-webgl-in-chrome-on-ubuntu

How To Enable WebGL In Chrome On Ubuntu?

chrome://gpu/

enter image description here

And http://webglreport.com/

enter image description here

 google-chrome --version
 Google Chrome 27.0.1453.93 

http://www.chromeexperiments.com/webgl

enter image description here

How To Enable WebGL In Chrome On Ubuntu ?

For WebGL to work in Google Chrome, Here are the steps to enable WebGL in Google Chrome.

Step 1: Open Google Chrome

Step 2: Type chrome://flags in the address bar

Step 3: Press Ctrl + f and type ” Rendering list “, “Override software rendering list” should come up, Now click on Enable and restart the browser.

enter image description here

Now check chrome://gpu/

enter image description here

http://webglreport.com/

	
</entry>
<entry [Mon 2013:10:07 13:00:21 EST] INSTALLED cachekiller PLUGIN ON CHROME ON comp2>


https://chrome.google.com/webstore/detail/cache-killer/jpfbieopdmepaolggioebjmedmclkbap/related


    
</entry>
<entry [Wed 2013:07:10 15:27:42 EST] INSTALL AUTOSAVE>
    
SEE [Sat 2013:01:05 04:46:18 EST] LIVE EDIT JAVASCRIPT WITH AutoSave EXTENSION

http://github.com/NV/chrome-devtools-autosave


1. ENABLE EXPERIMENTAL EXTENSIONS

OPEN:

chrome://flags/

ENABLE:

Experimental Extension APIs


2. RESTART CHROME


3. INSTALL Node.js SERVER
https://github.com/NV/chrome-devtools-autosave-server/blob/master/README.mdown

INSTALL gcc COMPILER

sudo apt-get install build-essential g++

INSTALL NODE

DOWNLOAD:
http://nodejs.org

./configure
make
make install


4. INSTALL AUTOSAVE
Autosave uses a local node server to save files.

npm install -g autosave
    OK

ll /usr/local/lib/node_modules/

    drwxr-xr-x 5 nobody syoung 4096 Jun  3 13:37 autosave/
    drwxr-xr-x 9 root   root   4096 Jun  3 13:37 npm/


5. (OPTIONAL) SET TO RUN AUTOSAVE ON BOOT
To start autosave on OS launch run:

npm run-script -g autosave autostart


6. INSTALL CHROME EXTENSION AutoSave
    OK
    

7. CONFIGURE AutoSave IN CHROME:

Tools --> Extensions --> DevTools AutoSave --> Options
or

chrome://settings/extensions --> Options


SET THE FOLLOWING:

ROUTES
    MATCH:  http://localhost/
    SAVE TO: /var/www/html/
SERVERS
    http://127.0.0.1:9104



8. START NODE WITH AUTOSAVE

autosave

    DevTools Autosave 1.0.0 is running on http://127.0.0.1:9104

    
CHECK NODE IS RUNNING

netstat -ntulp | grep 80
    tcp        0      0 127.0.0.1:80            0.0.0.0:*               LISTEN      32470/node      



9. USE AutoSave

NB: USE localhost, NOT 127.0.0.1!!!


NOTE:

TO REVERT CHANGES:

Resources TAB --> drop-down arrow NEXT TO MODIFIED FILES --> VERSION HISTORY OF CHANGES (as long as you haven't refreshed)

*** This isn't specific to this extension



</entry>
<entry [Thu 2013:03:21 13:20:17 EST] INSTALLED DEVTOOLS-SAVE>

NB: ALREADY-BUILT *.crx ARCHIVE LIST
https://code.google.com/p/devtools-save/downloads/list

BUILDING DEVTOOLS-SAVE
https://code.google.com/p/devtools-save/wiki/BuildingDevToolsSave
https://code.google.com/p/devtools-save/issues/detail?id=1


Building devtools-save Updated Feb 27, 2012 by ca...@chromium.org

1. INSTALL Depot Tools

http://www.chromium.org/developers/how-tos/install-depot-tools

    1.1 Fetch depot_tools
    
    git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

    1.2 Add depot_tools to your PATH:

    export PATH=$PATH:/home/syoung1/software/depottools/depot_tools

    1.3 Add path to .bashrc file so you don’t need to reset your $PATH manually each time you open a new shell.

    
2. Obtain devtools-save.pem (or use your own key if you're just hacking)


3. CREATE THE CONFIG FILE

emacs -nw ~/.gyp/include.gypi

configure the following variables there:

'variables': {
  'devtools-save_staging_area': '/home/syoung1/software/devtools-save/',
  'devtools-save_pem_file': '/home/syoung1/software/devtools-save/devtools-save.pem'
}


4. CREATE THE STAGING AREA

cd /home/syoung1/software
mkdir devtools-save && cd devtools-save


5. DOWNLOAD devtools-save

git clone https://code.google.com/p/devtools-save src


6. RUN gclient (Manages both subversion and git checkouts)

gclient config http://devtools-save.googlecode.com/svn/trunk --name src

CREATES .gclient FILE:

    solutions = [
      { "name"        : "src",
        "url"         : "http://devtools-save.googlecode.com/svn/trunk",
        "deps_file"   : "DEPS",
        "managed"     : True,
        "custom_deps" : {
        },
        "safesync_url": "",
      },
    ]

(yes, it's a bit weird; we have to fool gclient cause the main project uses git and some of the dependencies are in svn; we'll fix that!)

gclient sync


7. BUILD devtools-save

cd src
make


build according to your plaform (e.g. make or xcodebuild -project all.xcodeproj or devenv all.sln /build)

Note: The extension includes a NPAPI plug-in that needs to be built for all supported platforms (linux, Windows and Mac OS X at the moment). The plug-ins built for different platforms are copied to the staging area, which is supposed to be visible from different hosts by publish-plugin target and pulled from there when building the extension. If you can't build all platforms, you're on your own for the time being (hack extension.gyp and manifest.json). We'll make a simplified build mode with a single platform support for local hacking later.

    
</entry>
<entry [Wed 2013:01:16 02:04:51 EST] VIDEO ON CHROME DEVTOOLS NEW FEATURES - INCLUDING EXTENSIONS API>


http://paulirish.com/2011/a-re-introduction-to-the-chrome-developer-tools/

    
</entry>
<entry [Tue 2011:08:02 03:18:18 EST] UNABLE TO FIX BOOKMARKS DRAG N DROP>

THIS DIDN'T WORK:

1. EXPORT bookmarks to an html file using 'Bookmark Manager' --> Organize

2. DELETE everything in my bookmarks bar and all other bookmarks.

3. IMPORT from the html

4. MOVE all of the bookmarks out of the "imported from" folder to original location


I then moved my bookmark and it did not move back.


	
nero147
Level 1
11/28/10
Disabling the sync feature will work, but that's a deal breaker for me on a browser. This is what I did to fix the problem.

I exported my bookmarks to an html file through the organize bookmarks menu.
I deleted everything in my bookmarks bar, and all of my other bookmarks.
I imported from the html, and then moved all of the bookmarks out of the "imported from" folder back where the were before.
I then moved my bookmark and it did not move back.

I assume this probably means that the bookmarks file was partially corrupt, or there was something wonky with one of my entries. I have several hundred bookmarks and such.

Hope this helps.
2 of 2 people found this answer helpful. Did you? YesNo  Report abuse


    
</entry>