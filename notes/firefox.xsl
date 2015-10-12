firefox



<entry [Tue 2012:05:29 06:50:42 EST] INSTALLED JAVA PLUGIN>

SEE ALSO HERE:
http://docs.oracle.com/javase/7/docs/webnotes/install/linux/linux-plugin-install.html

1. DOWNLOAD JAVA


2. UNZIP AND GO TO lib/amd64 AND CONFIRM libnpjp2.so FILE IS PRESENT


3. LINK FROM libnpjp2.so TO /usr/lib/firefox/plugins

ln -s /mnt/home/syoung/software/java/jre1.7.0_04/lib/amd64/libnpjp2.so /usr/lib/firefox/plugins/libnpjp2.so


4. CHECK IN BROWSER IF PLUGIN IS WORKING

http://javatester.org/version.html

    OK!


NOTES
=====


http://www.oracle.com/technetwork/java/javase/manual-plugin-install-linux-136395.html

Manual Installation and Registration of Java Plugin for Linux
 	JDK Documentation
When you install the Java platform, the Java plugin file is included as part of that install. If you want to use Java within Firefox, you need to manually create a symbolic link from the plugin file in the release to one of the locations that Firefox expects. To make the plugin available to all users, create the link inside of the Firefox application's directory, in the plugins subdirectory. Alternatively, you can create the symbolic link in your home directory, in ~/.mozilla/plugins. In the remainder of this document, the text, " Firefox plugins directory ", implies either of these locations.

This release provides the Next-Generation Java plugin. If you have been using the classic plugin, see the Notes for further information.

The plugin file for Linux is located here:

[JRE]/lib/i386/libnpjp2.so

If you are using a 32-bit Firefox, you should use the 32-bit Java Plugin (from the lib/i386 directory). To determine which version of Firefox you are running, launch the application, and select the menu item Help -> About Mozilla Firefox. At the bottom of the window is a version string line that contains either "Linux i686" (32-bit) or "Linux x86_64" (64-bit).

To install the Java Plugin follow these steps:

1. Exit Firefox.

2. Uninstall any previous installations of Java Plugin.

Only one Java Plugin can be used at a time. When you want to use a different plugin, or version of a plugin, remove the symbolic links to any other versions and create a fresh symbolic link to the new one.

Remove the symbolic links (or move them to another directory) to javaplugin-oji.so and libnpjp2.so from the Firefox plugins directory.

3. Create a symbolic link to the Java Plugin in the Firefox plugins directory.

Create a symbolic link to the Java Plugin libnpjp2.so file in the Firefox plugins directory:

    cd  
              
[Firefox]/plugins
    ln -s  
              
[JRE]/lib/i386/libnpjp2.so . 
            
 

4. Start the Firefox browser .

 

Type about:plugins in the Location bar to confirm that the Java Plugin is loaded. You can also click the Tools menu to confirm that Java Console is there.





Notes

The classic plugin file was located here:
  
                
[JRE]/plugin/i386/javaplugin-oji.so
    
This file should no longer be used and all symbolic links to it removed.

See Browsers Supported by Next-Generation Java Plugin for information about browser support in the new Java Plugin.
    
</entry>
<entry [Sat 2012:02:25 22:13:41 EST] >

PROBLEM:

./firefox
    error while loading shared libraries: libdbus-glib-1.so.2: cannot open shared object file: No such file or directory

SOLUTION:

workaround
http://drewp.quickwitretort.com/2008/10/19/0

1. Go get the i386 version of libdbus-glib (
   
http://packages.ubuntu.com/hardy/i386/libdbus-glib-1-2/download

and save the .deb file somewhere.

2. Run "file-roller /tmp/libdbus-glib-1-2_0.74-2_i386.deb".

3. Go into data.tar.gz -> . -> usr -> lib, and copy libdbus-glib-1.so.2.1.0 to your firefox 3.1 directory.

4. Rename it to lose the ".1.0" at the end.


5. COPY TO FIREFOX DIR

cd /home/syoung/software/firefox/libs/libdbus-glib-1.2_0/usr/lib
cp libdbus-glib-1.so.2 ~/software/firefox/4.0rc2/libdbus-glib-1.so.2
    
</entry>
<entry [Thu 2012:02:23 10:45:48 EST] 'Failed to load type module' PROBLEM DUE TO 32-BIT VERSION>
    
PROBLEM:

AT STARTUP OF FIREFOX 3.6.27

    Failed to load type module: /usr/lib/gtk-2.0/2.10.0/menuproxies/libappmenu.so

DIAGNOSIS

http://forums.mozillazine.org/viewtopic.php?f=28&t=2282771

RUNNING 32-BIT ON 64-BIT MACHINE


SOLUTION:

IGNORE
    
</entry>
<entry [Tue 2012:02:14 05:29:37 EST] INSTALLED FIREFOX 11.0 ALPHA>
    

1. DOWNLOADED 12.0a2

2. RAN IT AND GOT THIS ERROR

cd /home/syoung/software/firefox/12.0a2
./firefox

    XPCOMGlueLoad error for file /home/syoung/software/firefox/12.0a2/libxpcom.so:
    libxul.so: cannot open shared object file: No such file or directory
    Couldn't load XPCOM.
    syoung@syoung-Satellite-L355:~/software/firefox/12.0a2$ 


ldd /home/syoung/software/firefox/12.0a2/libxpcom.so

	linux-gate.so.1 =>  (0xf775b000)
	libpthread.so.0 => /lib/i386-linux-gnu/libpthread.so.0 (0xf7723000)
	libxul.so => not found
	libplds4.so => /usr/lib/i386-linux-gnu/libplds4.so (0xf771d000)
	libplc4.so => /usr/lib/i386-linux-gnu/libplc4.so (0xf7717000)
	libnspr4.so => /usr/lib/i386-linux-gnu/libnspr4.so (0xf76db000)
	libdl.so.2 => /lib/i386-linux-gnu/libdl.so.2 (0xf76d6000)
	libmozalloc.so => not found
	libstdc++.so.6 => /usr/lib/i386-linux-gnu/libstdc++.so.6 (0xf75ea000)
	libm.so.6 => /lib/i386-linux-gnu/libm.so.6 (0xf75c0000)
	libgcc_s.so.1 => /lib/i386-linux-gnu/libgcc_s.so.1 (0xf75a2000)
	libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7426000)
	/lib/ld-linux.so.2 (0xf775c000)


3. GET DIFFERENT ERROR AFTER ADD PWD TO LD_LIBRARY_PATH

export LD_LIBRARY_PATH=`pwd`
echo $LD_LIBRARY_PATH
    /home/syoung/software/firefox/12.0a2

./firefox
    XPCOMGlueLoad error for file /home/syoung/software/firefox/12.0a2/libxpcom.so:
    libdbus-glib-1.so.2: cannot open shared object file: No such file or directory
    Couldn't load XPCOM.


4. ADD PATH TO libdbus-glib

locate libdbus-glib-1.so.2
/usr/lib/x86_64-linux-gnu/libdbus-glib-1.so.2
/usr/lib/x86_64-linux-gnu/libdbus-glib-1.so.2.2.0


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu

 
The first nightly builds of the upcoming Firefox 11 Alpha web browser are already provided by Mozilla on their Launchpad PPA repository for the Ubuntu 11.10 (Oneiric Ocelot) operating system. 

As expected, the Firefox 11 Alpha web browser scores a perfect 100 in the Acid 3 tests. Firefox 11 will also come with Google Chrome migration assistant, redesigned New Tab, WebGL anti-aliasing, HTML5 enhancements, a speed dial, and the "silent update" feature.

To install the Firefox 11 Alpha binaries in your Ubuntu 11.10 (Oneiric Ocelot) system, open a terminal by hitting the CTRL+ALT+T key combination and paste the following commands, one by one (hitting Enter after each one):

sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
sudo apt-get update
sudo apt-get install firefox-trunk

    
</entry>
<entry [Thu 2012:02:09 06:55:54 EST] CHANGE FROM BING TO CHROME>

about:config --> keyword.URL -->  http://www.google.com/search?sourceid=navclient&hl=en&q=




First try to uninstall the Bing Toolbar from your Programs:
Windows 7: Go to Start -> Control Panel -> Programs and Features
Windows XP: Go to Start -> Control Panel -> Add or Remove Programs
Select Bing from the list and click uninstall

Next, check your add-ons to make sure Bing is gone. If not, uninstall or disable it:
FF4-6: Firefox -> Add-ons -> Extensions
FF3: Tools -> Add-ons -> Extensions
If Bing is in the list, uninstall it. If the uninstall option is grayed out, you can just disable it.
Restart Firefox

Finally, if searching via the address bar is still redirecting to Bing, you need to change your config:
Type about:config in the address bar.
Confirm that you'll be careful.
Find the key "keyword.URL"
Double-click to edit
Change the value to

http://www.google.com/search?sourceid=navclient&hl=en&q=

Source(s):
http://forums.mozillazine.org/viewtopic.php?f=38&t=2038991
http://kb.mozillazine.org/Uninstalling_add-ons
http://arstechnica.com/microsoft/news/2010/06/microsoft-slips-ie-firefox-add-on-into-toolbar-update.ars
http://www.wlug.net/3053/how-to-change-firefox-6-default-search-engine/

    
</entry>
<entry [Sat 2011:12:31 21:56:02 EST] DOJO FIREBUG EXTENSION>

info page:
http://getfirebug.com/wiki/index.php/DojoFirebugExtension_Reference_Guide

downloaded from here:
http://getfirebug.com/releases/dojofirebugextension/1.8/



</entry>
<entry [Mon 2011:12:26 12:36:00 EST] INCREASED FIREBUG logLimit IN FIREFOX>

http://getfirebug.com/wiki/index.php/Firebug_Preferences

about:config --> extensions.firebug.console.logLimit

</entry>
<entry [Mon 2011:12:26 12:32:39 EST] USE console.group IN FIREBUG>

3. Using console.log to print messages to the console is great, but did you know you can group messages by calling ‘console.group(“groupname”)’ and ‘console.groupEnd()’?

4. Use console.profile() and console.profileEnd() to report on time spent in each function hit, or you could just use the Profiler.

8. You can use the command ‘debugger;’ within your JavaScript to have Firebug stop execution at that point in the code and bring up the Firebug panel.

9. Log calls to specific function by simply right clicking the function name in the Script section and choosing: ‘log calls to “myFunction”‘.



http://eriwen.com/firefox/10-things-you-didnt-know-about-firebug/
10 Things you didn’t know about Firebug

1. You can monitor the load time of your JavaScript by going to the “Net” tab. Bonus: Firebug colors requests that are served from your cache in a lighter gray so you can optimize your cache use.

2. Right click on a breakpoint to add a condition.

3. Using console.log to print messages to the console is great, but did you know you can group messages by calling ‘console.group(“groupname”)’ and ‘console.groupEnd()’?

4. Use console.profile() and console.profileEnd() to report on time spent in each function hit, or you could just use the Profiler.

5. If you mouse over a color in the CSS tab, it shows you a swatch of that color!

6. Not only can you see the HTML of your page change in real-time, you can change it whenever you want.

7. If you are using a very high resolution and Firebug is hard to read, just click on the bug and select ‘Text Size > Increase Text Size’

8. You can use the command ‘debugger;’ within your JavaScript to have Firebug stop execution at that point in the code and bring up the Firebug panel.

9. Log calls to specific function by simply right clicking the function name in the Script section and choosing: ‘log calls to “myFunction”‘.

10. FINALLY…you can use Firebug in IE, Opera, and Safari (limited functionality) by downloading Firebug Lite!!
    
</entry>
<entry [Mon 2011:11:28 02:11:22 EST] INSTALLED FIREFOX AURORA 10.0a2>


PROBLEM:

FIREFOX DOES NOT START:

./firefox-bin 
    XPCOMGlueLoad error for file /home/syoung/software/firefox/10.0a2/libxpcom.so:
    libxul.so: cannot open shared object file: No such file or directory
    Couldn't load XPCOM.


ldd /home/syoung/software/firefox/10.0a2/libxpcom.so

	linux-gate.so.1 =>  (0xf7709000)
	libpthread.so.0 => /lib/i386-linux-gnu/libpthread.so.0 (0xf76d3000)
	libxul.so => not found
	libplds4.so => /usr/lib/i386-linux-gnu/libplds4.so (0xf76cd000)
	libplc4.so => /usr/lib/i386-linux-gnu/libplc4.so (0xf76c7000)
	libnspr4.so => /usr/lib/i386-linux-gnu/libnspr4.so (0xf768b000)
	libdl.so.2 => /lib/i386-linux-gnu/libdl.so.2 (0xf7686000)
	libmozalloc.so => not found
	libstdc++.so.6 => /usr/lib/i386-linux-gnu/libstdc++.so.6 (0xf759a000)
	libm.so.6 => /lib/i386-linux-gnu/libm.so.6 (0xf7570000)
	libgcc_s.so.1 => /lib/i386-linux-gnu/libgcc_s.so.1 (0xf7552000)
	libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf73d6000)
	/lib/ld-linux.so.2 (0xf770a000)


    
</entry>
<entry [Sat 2011:11:26 18:25:19 EST] LOAD A USER SCRIPT>
    
http://userstyles.org/styles/15119/hatena-bookmark-auto-hide-footer

FILE SAVED IN

apps/firefox/autohide-footer.user.js

    
    
</entry>
<entry [Sun 2011:08:28 06:50:57 EST] INSTALLED chrome 13.0.782.215-r97094>

DOWNLOADED TO software/chrome AND INSTALLED WITH software-center

sudo software-center --debug google-chrome-stable_current_amd64-110827.deb
    
</entry>
<entry [Wed 2011:06:08 16:32:28 EST] FIXED './firefox-bin: Not found' PROBLEM WITH LOCAL INSTALL>

Re: firefox-bin: Not found

ah i think i found the solution. u just need some 32 bit libs
sudo apt-get install -y ia32-libs lib32asound2 lib32ncurses5 ia32-libs-sdl ia32-libs-gtk gsfonts gsfonts-x11 linux32

./firefox &
    OK

    
</entry>
<entry [Wed 2011:04:06 16:32:28 EST] COMPLETELY DISABLE CACHING IN FIREFOX>

1. TYPE IN ADDRESS BAR:

about:config

2. SEARCH FOR ‘cache’ AND SELECT:

network.http.use-cache

3. SET TO false

4. DONE
    
</entry>

<entry [Tue 2011:03:29 15:56:43 EST] FIREFOX SYNC >
    
a-mqq9t-vyvt3-h94mv-r97cj-gzzde
    
</entry>


<entry [Fri Mar 12 20 GD:18:23 EST 2010] ROLL BACK FIREFOX>


1. DOWNLOAD FIREFOX 3.5

I took down the 3.58 installer but you can get whatever version you like.


2. SAVE BOOKMARKS AND PROFILE

In Firefox:

Bookmarks -> Organize Bookmarks -> Backup


COPY FOLDER

C:/Documents and Settings/syoung/Application Data/Mozilla/Firefox/Profiles

TO 

C:/my/software/backups/firefox



3. REMOVE FIREFOX AND INSTALL EARLIER VERSION

Start -> Control Panel -> Add or Remove Programs

Click on 3.58 installer, and install.


4. RESTORE BACKED UP PROFILE AND BOOKMARKS
You might need to do this (I didn't because my profile and bookmarks were not removed during the uninstall in step 3):

PROFILE

COPY

C:/my/software/backups/firefox/Profiles

TO 

C:/Documents and Settings/syoung/Application Data/Mozilla/Firefox/

BOOKMARKS

In Firefox:

Bookmarks -> Manage Bookmarks -> File -> Import


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


XULRUNNER

"C:\Program Files\xulrunner\1.8.0.4\xulrunner\xulrunner.exe" --install-app D:\stuart\FUNNYBASE\dev\firefox\xulrunner\examples\mybrowser-0.2.2.xulapp


"C:\Program Files\xulrunner\1.8.0.4\xulrunner\xulrunner.exe" --install-app D:\stuart\FUNNYBASE\dev\firefox\xulrunner\examples\xulmine-0.9.xulapp

"C:\Program Files\xulrunner\1.8.0.4\xulrunner\xulrunner.exe" --install-app D:\stuart\FUNNYBASE\dev\firefox\xulrunner\examples\chatzilla.zip



FIREFOX 3

"C:\Program Files\Mozilla Firefox 3 Beta 2\firefox.exe" -app D:\stuart\FUNNYBASE\dev\firefox\xulrunner\examples\chatzilla-0.9.8.0\application.ini



