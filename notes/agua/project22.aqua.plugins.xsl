


<entry [Tue Jan 26 14:32:03 PST 2010] INSTALLED AQWA ON macbook >


ok


</entry>

<entry [Sun Jan 24 16:25:01 EST 2010] SUDO INFO>

Simple /etc/sudoers Examples

This section presents some simple examples of how to do many commonly required tasks using the sudo utility.
Granting All Access to Specific Users
You can grant users bob and bunny full access to all privileged commands, with this sudoers entry.
bob, bunny  ALL=(ALL) ALL
This is generally not a good idea because this allows bob and bunny to use the su command to grant themselves permanent root privileges thereby bypassing the command logging features of sudo. The example on using aliases in the sudoers file shows how to eliminate this prob
Granting Access To Specific Users To Specific Files
This entry allows user peter and all the members of the group operator to gain access to all the program files in the /sbin and /usr/sbin directories, plus the privilege of running the command /usr/local/apps/check.pl. Notice how the trailing slash (/) is required to specify a directory location:
peter, %operator ALL= /sbin/, /usr/sbin, /usr/local/apps/check.pl
Notice also that the lack of any username entries within parentheses () after the = sign prevents the users from running the commands automatically masquerading as another user. This is explained further in the next example.
Granting Access to Specific Files as Another User
The sudo -u entry allows allows you to execute a command as if you were another user, but first you have to be granted this privilege in the sudoers file.
This feature can be convenient for programmers who sometimes need to kill processes related to projects they are working on. For example, programmer peter is on the team developing a financial package that runs a program called monthend as user accounts. From time to time the application fails, requiring "peter" to stop it with the /bin/kill, /usr/bin/kill or /usr/bin/pkill commands but only as user "accounts". The sudoers entry would look like this:
peter ALL=(accounts) /bin/kill, /usr/bin/kill, /usr/bin/pkill
User peter is allowed to stop the monthend process with this command:
[peter@bigboy peter]# sudo -u accounts pkill monthend
Granting Access Without Needing Passwords
This example allows all users in the group operator to execute all the commands in the /sbin directory without the need for entering a password. This has the added advantage of being more convenient to the user:

%operator ALL= NOPASSWD: /sbin/

Using Aliases in the sudoers File
Sometimes you'll need to assign random groupings of users from various departments very similar sets of privileges. The sudoers file allows users to be grouped according to function with the group and then being assigned a nickname or alias which is used throughout the rest of the file. Groupings of commands can also be assigned aliases too.
In the next example, users peter, bob and bunny and all the users in the operator group are made part of the user alias ADMINS. All the command shell programs are then assigned to the command alias SHELLS. Users ADMINS are then denied the option of running any SHELLS commands and su:
Cmnd_Alias    SHELLS = /usr/bin/sh,  /usr/bin/csh, \
                       /usr/bin/ksh, /usr/local/bin/tcsh, \
                       /usr/bin/rsh, /usr/local/bin/zsh
 
 
User_Alias    ADMINS = peter, bob, bunny, %operator
ADMINS        ALL    = !/usr/bin/su, !SHELLS
This attempts to ensure that users don't permanently su to become root, or enter command shells that bypass sudo's command logging. It doesn't prevent them from copying the files to other locations to be run. The advantage of this is that it helps to create an audit trail, but the restrictions can be enforced only as part of the company's overall security policy.
Other Examples
You can view a comprehensive list of /etc/sudoers file options by issuing the command man sudoers.
Using syslog To Track All sudo Commands

All sudo commands are logged in the log file /var/log/messages which can be very helpful in determining how user error may have contributed to a problem. All the sudo log entries have the word sudo in them, so you can easily get a thread of commands used by using the grep command to selectively filter the output accordingly.
Here is sample output from a user bob failing to enter their correct sudo password when issuing a command, immediately followed by the successful execution of the command /bin/more sudoers.
[root@bigboy tmp]# grep sudo /var/log/messages
Nov 18 22:50:30 bigboy sudo(pam_unix)[26812]: authentication failure; logname=bob uid=0 euid=0 tty=pts/0 ruser= rhost= user=bob
Nov 18 22:51:25 bigboy sudo: bob : TTY=pts/0 ; PWD=/etc ; USER=root ; COMMAND=/bin/more sudoers
[root@bigboy tmp]#

Conclusion

It is important to know how to add users, not just so they can log in to our system. Most server based applications usually run via a dedicated unprivileged user account, for example the MySQL database application runs as user mysql and the Apache Web server application runs as user apache. These accounts aren't always created automatically, especially if the software is installed using TAR files.
Finally, the sudo utility provides a means of dispersing the responsibility of systems management to multiple users. You can even give some groups of users only partial access to privileged commands depending on their roles in the organization. This makes sudo a valuable part of any company's server administration and security policy.
Our Linux Forum Community


</entry>

<entry [Sun Jan 24 15:25:01 EST 2010] JAVASCRIPT TIPS: dijit.getEnclosingWidget, REMOVE DOTTED BORDER ON FOCUS, SET DATETIME>


ENCLOSING WIDGET: dijit.getEnclosingWidget 

doHover: function(e){
	var w = dijit.getEnclosingWidget(e.target.firstChild);
	var n = w.iconNode;
	dojo.addClass(n, w.iconClass + "Hover");
}



REMOVE DOTTED BORDER ON FOCUS


CSS Validation is a big pet-peeve for me, which is why I opted to explore other options, and came up with the simple outline: none; method. This is the same syntax that we will use to tweak our Firefox installation on Windows, so that the border is gone for all websites. Don't worry, it is a very simple solution. Browse to: C:\Program Files\Mozilla Firefox\res\ua.css. Open the file in a code-editor that has line number, and scroll to line 123.

/* You Will See This: */

:-moz-any-link:focus {
  outline: 1px dotted invert;
}

/* Change It To This: */

:-moz-any-link:focus {
  outline: none;
}




SET DATETIME


{"username":"admin","sessionId":"9999999999.9999.999","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":"5"}


<div class="combinedDateTime">
   <div dojoType="dijit.form.DateTextBox" dojoAttachPoint="start"></div>
   <div dojoType="dijit.form.TimeTextBox" dojoAttachPoint="end"></div>
</div>

You can do this in your widget code:

this.start.attr('value', new Date());




</entry>

<entry [Fri Jan 22 15:25:01 EST 2010] ADDED Term::ReadKey PERL MODULE TO THE REQUIRED LIST >








</entry>

<entry [Thurs Jan 21 23:51:20 EDT 2009] GOT RID OF Dynaloader.pm ERROR ON WINDOWS COMMAND LINE>

ADDED no warnings AND use warnings, LINE 225:

	no warnings;
		&$xs(@args);
	use warnings;



</entry>

<entry [Wed Jan 20 15:51:20 EDT 2009] REORGANISED Workflow.js: SPAN OUT Workflows.js AND IO.js, ALONG WITH WorkflowsMenu.js AND AppsMenu.js >


Workflow.js NOW RETAINS THE FOLLOWING FUNCTIONS:

		-	CALLS setApps() WHICH IS IMPLEMENTED BY Apps.js
		
		- 	CALLS setWorkflows() WHICH IS IMPLEMENTED BY Workflows.js
		
		-	IMPLEMENTS History AND Shared PANES



</entry>

<entry [Wed Jan 20 15:51:20 EDT 2009] HOW TO ADD A CUSTOM ICONCLASS>


SEE EXAMPLE HERE:

http://docs.dojocampus.org/dijit/Menu



the dijitEditor icon's are built into the theme. The iconClass is just a parameter so you can create your own icons, and define them via a simple CSS class rule (similar to the ones you've found)

The important bit being:

.dijitEditorIcon defines the sprite

.dijitEditorIcon* defines the background-position

You can make the icons be whatever you like overriding these classes







THE BOOK OF DOJO: Setup Clipboard actions for FF

http://www.rdsquared.net/2009/08/24/The%20Book%20of%20Dojo.pdf

Scripting Trees


In Actions we saw how to hook a piece of code into onClick. That's not all. With JavaScript and a Tree, you can style and manipulate trees in all sorts of combinations.


Adding an Icon or Class to a Node


OnClick is an extension point, which we'll cover in detail in Part 3. Three other extension points are used in drawing the tree nodes:

String getIconClass(/* dojo.data.Item */ item) takes in an item and returns a String specifiying a CSS class for the icon. The class should have a CSS style specifying a background url, pointing at the image. We saw this in Example 2 for styling mail icons.

String getLabelClass(/*dojo.data.Item*/ item) returns a CSS class applied to a label.

String getLabel(/*dojo.data.Item*/ item) returns an actual label. This is useful when the data source label is not sufficient for display - e.g. displaying "First Name Last Name" when the data source label is the SSN.



CUSTOM ICONS FOR THE TREE WIDGET

http://willcode4beer.com/ware.jsp?set=customDojoTree


<div class="dojo-Tree"
  expandIconSrcPlus="http://i.willcode4beer.com/other/icons/folder16.png"
  expandIconSrcMinus="http://i.willcode4beer.com/other/icons/foldero16.png"
  iconWidth="16"
  iconHeight="16"
  >





THE CURRENT LIST OF ICON CLASSES IS HERE:

http://archive.dojotoolkit.org/nightly/dojotoolkit/dijit/themes/tundra/Editor.css


.dijitIEFixedToolbar {
	position:absolute;
	
	top: expression(eval((document.documentElement||document.body).scrollTop));
}
.tundra .dijitToolbar .dijitToolbarSeparator {
	background: url('images/editor.gif');
}
.tundra .dijitEditorIcon {
	background-image: url('images/editor.gif'); 
	background-repeat: no-repeat;
	width: 18px;
	height: 18px;
	text-align: center;
}
.tundra .dijitDisabled .dijitEditorIcon {
	background-image: url('images/editorDisabled.gif'); 
}
.tundra .dijitEditorIconSep { background-position: 0px; }
.tundra .dijitEditorIconBackColor { background-position: -18px; }
.tundra .dijitEditorIconBold { background-position: -36px; }
.tundra .dijitEditorIconCancel { background-position: -54px; }
.tundra .dijitEditorIconCopy { background-position: -72px; }
.tundra .dijitEditorIconCreateLink { background-position: -90px; }
.tundra .dijitEditorIconCut { background-position: -108px; }
.tundra .dijitEditorIconDelete { background-position: -126px; }
.tundra .dijitEditorIconForeColor { background-position: -144px; }
.tundra .dijitEditorIconHiliteColor { background-position: -162px; }
.tundra .dijitEditorIconIndent { background-position: -180px; }
.tundra .dijitEditorIconInsertHorizontalRule { background-position: -198px; }
.tundra .dijitEditorIconInsertImage { background-position: -216px; }
.tundra .dijitEditorIconInsertOrderedList { background-position: -234px; }
.tundra .dijitEditorIconInsertTable { background-position: -252px; }
.tundra .dijitEditorIconInsertUnorderedList { background-position: -270px; }
.tundra .dijitEditorIconItalic { background-position: -288px; }
.tundra .dijitEditorIconJustifyCenter { background-position: -306px; }
.tundra .dijitEditorIconJustifyFull { background-position: -324px; }
.tundra .dijitEditorIconJustifyLeft { background-position: -342px; }
.tundra .dijitEditorIconJustifyRight { background-position: -360px; }
.tundra .dijitEditorIconLeftToRight { background-position: -378px; }
.tundra .dijitEditorIconListBulletIndent { background-position: -396px; }
.tundra .dijitEditorIconListBulletOutdent { background-position: -414px; }
.tundra .dijitEditorIconListNumIndent { background-position: -432px; }
.tundra .dijitEditorIconListNumOutdent { background-position: -450px; }
.tundra .dijitEditorIconOutdent { background-position: -468px; }
.tundra .dijitEditorIconPaste { background-position: -486px; }
.tundra .dijitEditorIconRedo { background-position: -504px; }
.tundra .dijitEditorIconRemoveFormat { background-position: -522px; }
.tundra .dijitEditorIconRightToLeft { background-position: -540px; }
.tundra .dijitEditorIconSave { background-position: -558px; }
.tundra .dijitEditorIconSpace { background-position: -576px; }
.tundra .dijitEditorIconStrikethrough { background-position: -594px; }
.tundra .dijitEditorIconSubscript { background-position: -612px; }
.tundra .dijitEditorIconSuperscript { background-position: -630px; }
.tundra .dijitEditorIconUnderline { background-position: -648px; }
.tundra .dijitEditorIconUndo { background-position: -666px; }
.tundra .dijitEditorIconWikiword { background-position: -684px; }
.tundra .dijitEditorIconToggleDir { background-position: -540px; }
.tundra .dijitEditorIconTabIndent { background-position: -702px; }
.tundra .dijitEditorIconSelectAll { background-position: -720px; }
.tundra .dijitEditorIconUnlink { background-position: -738px; }
.tundra .dijitEditorIconFullScreen { background-position: -756px; }
.tundra .dijitEditorIconViewSource { background-position: -774px; }
.tundra .dijitEditorIconPrint { background-position: -792px; }
.tundra .dijitEditorIconNewPage { background-position: -810px; }




</entry>

<entry [Wed Jan 20 15:51:20 EDT 2009] ENABLE CLIPBOARD ACTIONS IN FIREFOX>


THE BOOK OF DOJO
http://www.rdsquared.net/2009/08/24/The%20Book%20of%20Dojo.pdf

Setup Clipboard actions for FF


To protect users' private information, unprivileged scripts cannot invoke the Cut, Copy, and Paste commands in
the Mozilla rich text editor, so the corresponding buttons on the dijit Editor widget will not work. To enable these
functions for purposes of the demo, you must modify your browser preferences.
Configure Firefox
Quit Firefox. If you have Quick Launch running (in Windows, an icon in the toolbar), 1. quit that too.
Find your Firefox profile directory. On Windows, this is often located in
C:\Documents and Settings\<Windows login>\Application
Data\Mozilla\Firefox\Profiles\<one folder>.
(See also editing configuration files for more info on locating your profile folder.)
2.
3. Open the user.js file from that directory in a text editor. If there's no user.js file, create one.
Add these lines to user.js:
user_pref("capability.policy.policynames", "allowclipboard");
user_pref("capability.policy.allowclipboard.sites", "http://localhost file:// http://dojotoolkit.org");
user_pref("capability.policy.allowclipboard.Clipboard.cutcopy", "allAccess");
user_pref("capability.policy.allowclipboard.Clipboard.paste", "allAccess");


*Change the value of capability.policy.allowclipboard.sites to where you want to enable this function. In the
example above, this function is enabled for localhost, accessing local files directly (in your own hard drive,
without a http server) and dojo website.
4.
5. Save the file, and restart Firefox. The Clipboard buttons should now function.
Note: The preference is site as well as protocol specific. For example
user_pref("capability.policy.allowclipboard.sites", "http://dojotoolkit.org")
is not the same as
user_pref("capability.policy.allowclipboard.sites", "https://dojotoolkit.org")
(the first is http and the second is https)


For more information about security policies, see
http://www.mozilla.org/projects/security/components/ConfigPolicy.html.



REFERENCE

CREATING A RIGHT-CLICK EVENT LISTENER
http://stackoverflow.com/questions/1579589/how-to-generate-a-right-click-event-in-all-browsers


QUESTION:

I'm trying to figure out a way to generate a right-click event for all browsers. Currently, we only support IE and use the oncontextmenu event.

ANSWER:

This should get you started with generating a right click event. The key to the right click is the button parameter: button = 2.

 would suggest Googleing for 'docment.createEvent' and 'document.createEventObject' for more detail on the API from the Mozilla and MSDN sites.
 
 
if (document.createEvent) {
  var rightClick = document.createEvent('MouseEvents');
  rightClick.initMouseEvent(
    'click', // type
    true,    // canBubble
    true,    // cancelable
    window,  // view - set to the window object
    1,       // detail - # of mouse clicks
    10,       // screenX - the page X coordinate
    10,       // screenY - the page Y coordinate
    10,       // clientX - the window X coordinate
    10,       // clientY - the window Y coordinate
    false,   // ctrlKey
    false,   // altKey
    false,   // shiftKey
    false,   // metaKey
    2,       // button - 1 = left, 2 = right
    null     // relatedTarget
  );
  document.dispatchEvent(rightClick);
} else if (document.createEventObject) { // for IE
  var rightClick = document.createEventObject();
  rightClick.type = 'click';
  rightClick.cancelBubble = true;
  rightClick.detail = 1;
  rightClick.screenX = 10;
  rightClick.screenY = 10;
  rightClick.clientX = 10;
  rightClick.clientY = 10;
  rightClick.ctrlKey = false;
  rightClick.altKey = false;
  rightClick.shiftKey = false;
  rightClick.metaKey = false;
  rightClick.button = 2;
  document.fireEvent('onclick', rightClick);
}



</entry>

<entry [Mon Jan 19 15:51:20 EDT 2009] PERL File::Stat DOCUMENTATION FOR USE IN Common::checkfile>


http://perldoc.perl.org/functions/stat.html


NB: To get status info for a symbolic link instead of the target file behind the link, use 'lstat'


stat FILEHANDLE
stat EXPR
stat DIRHANDLE
stat

		Returns a 13-element list giving the status info for a file, either the file opened via FILEHANDLE or DIRHANDLE, or named by EXPR. If EXPR is omitted, it stats $_ . Returns a null list if the stat fails. Typically used as follows:

    ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
       $atime,$mtime,$ctime,$blksize,$blocks)
           = stat($filename);
Not all fields are supported on all filesystem types. Here are the meanings of the fields:

  0 dev      device number of filesystem
  1 ino      inode number
  2 mode     file mode  (type and permissions)
  3 nlink    number of (hard) links to the file
  4 uid      numeric user ID of file's owner
  5 gid      numeric group ID of file's owner
  6 rdev     the device identifier (special files only)
  7 size     total size of file, in bytes
  8 atime    last access time in seconds since the epoch
  9 mtime    last modify time in seconds since the epoch
 10 ctime    inode change time in seconds since the epoch (*)
 11 blksize  preferred block size for file system I/O
 12 blocks   actual number of blocks allocated
(The epoch was at 00:00 January 1, 1970 GMT.)

(*) Not all fields are supported on all filesystem types. Notably, the ctime field is non-portable. In particular, you cannot expect it to be a "creation time", see "Files and Filesystems" in perlport for details.

If stat is passed the special filehandle consisting of an underline, no stat is done, but the current contents of the stat structure from the last stat, lstat, or filetest are returned. Example:

    if (-x $file && (($d) = stat(_)) && $d < 0) {
	print "$file is executable NFS file\n";
    }
(This works on machines only for which the device number is negative under NFS.)

Because the mode contains both the file type and its permissions, you should mask off the file type portion and (s)printf using a "%o" if you want to see the real permissions.

    $mode = (stat($filename))[2];
    printf "Permissions are %04o\n", $mode & 07777;
In scalar context, stat returns a boolean value indicating success or failure, and, if successful, sets the information associated with the special filehandle _ .

The File::stat module provides a convenient, by-name access mechanism:

    use File::stat;
    $sb = stat($filename);
    printf "File is %s, size is %s, perm %04o, mtime %s\n",
	$filename, $sb->size, $sb->mode & 07777,
	scalar localtime $sb->mtime;
You can import symbolic mode constants (S_IF* ) and functions (S_IS* ) from the Fcntl module:

    use Fcntl ':mode';
    $mode = (stat($filename))[2];
    $user_rwx      = ($mode & S_IRWXU) >> 6;
    $group_read    = ($mode & S_IRGRP) >> 3;
    $other_execute =  $mode & S_IXOTH;
    printf "Permissions are %04o\n", S_IMODE($mode), "\n";
    $is_setuid     =  $mode & S_ISUID;
    $is_directory  =  S_ISDIR($mode);
You could write the last two using the -u and -d operators. The commonly available S_IF* constants are

    # Permissions: read, write, execute, for user, group, others.
    S_IRWXU S_IRUSR S_IWUSR S_IXUSR
    S_IRWXG S_IRGRP S_IWGRP S_IXGRP
    S_IRWXO S_IROTH S_IWOTH S_IXOTH
    # Setuid/Setgid/Stickiness/SaveText.
    # Note that the exact meaning of these is system dependent.
    S_ISUID S_ISGID S_ISVTX S_ISTXT
    # File types.  Not necessarily all are available on your system.
    S_IFREG S_IFDIR S_IFLNK S_IFBLK S_IFCHR S_IFIFO S_IFSOCK S_IFWHT S_ENFMT
    # The following are compatibility aliases for S_IRUSR, S_IWUSR, S_IXUSR.
    S_IREAD S_IWRITE S_IEXEC
and the S_IF* functions are

    S_IMODE($mode)	the part of $mode containing the permission bits
			and the setuid/setgid/sticky bits
    S_IFMT($mode)	the part of $mode containing the file type
			which can be bit-anded with e.g. S_IFREG
                        or with the following functions
    # The operators -f, -d, -l, -b, -c, -p, and -S.
    S_ISREG($mode) S_ISDIR($mode) S_ISLNK($mode)
    S_ISBLK($mode) S_ISCHR($mode) S_ISFIFO($mode) S_ISSOCK($mode)
    # No direct -X operator counterpart, but for the first one
    # the -g operator is often equivalent.  The ENFMT stands for
    # record flocking enforcement, a platform-dependent feature.
    S_ISENFMT($mode) S_ISWHT($mode)
See your native chmod(2) and stat(2) documentation for more details about the S_* constants. To get status info for a symbolic link instead of the target file behind the link, use the lstat function.

 

</entry>

<entry [Tues Jan 19 15:51:20 EDT 2009] dojo.dnd.Source PUBLIC METHODS FOR ACCESSING NODES>


Public methods and attributes

getItem(id) --- returns an object with data and type described above, which are associated with the node corresponding to that id.

setItem(id, obj) --- associates an object obj with this id. obj should define data and type attributes.

delItem(id) --- deletes a record of the node with this id. Warning: it does not delete the node from the container.

clearItems() --- delete all records. Warning: it does not delete nodes from the container.

forInItems(f, o) --- similar to dojo.forEach() but goes over all items in the map in an unspecified order. The function f will be called in the context o for every item in the map with following parameters:

obj --- the corresponding object with data and type defined.
id --- the node id.
map --- the map object itself.
forInItems() iterates over all DnD items in unspecified order. If you want to iterate over items in the order they are listed in the container you can use the code similar to this:


getAllNodes() --- returns a NodeList of all controlled DOM nodes in the order they are listed in the container.

insertNodes(data, before, anchor) --- inserts data items before/after the anchor node. It returns the container object itself for easy chaining of calls.

data --- an array of data items to be inserted. Each data item will be passed to the creator function, the result will be registered with the container, the node will be inserted according to before and anchor parameters.

before --- a boolean flag. If it is true, nodes will be added before the anchor, and after otherwise.

anchor --- a node to be used as a reference for the insertion. It should be an immediate child of the container node (or a child of <tbody> for the <table>-based node). If it is not specified, all items will be appended to the container node (or <tbody> for tables).

destroy() --- prepares the container object to be garbage-collected. You cannot use the container object after it was destroyed.

sync() --- (new in 1.2.2) inspects all controlled DOM nodes updating internal structures by removing information of removed nodes, and adding newly added DOM nodes marked with dojoDndItem class.
The container object defines following public attributes:

current --- a DOM node, which corresponds to a child with a mouse hovering over it. If there is no such item, this variable is null.

node --- the DOM node of the container. This node is used to set up mouse event handlers for the container.

parent --- the DOM node, which is an immediate parent of DnD item nodes. In most cases it is the same as node, but in some cases it can be node's descendant. Example: for tables node can point to <table>, while parent points to <tbody> (DnD item nodes will be <tr> nodes).


***** You can freely change parent to achieve the desired behavior of your container by specifying dropParent parameter.

creator --- the creator function or null, if the default creator is used.
skipForm --- the flag propagated from the initial parameters.
The heart of the Container is the map attribute:

map --- a dictionary, which is keyed by node ids. Each registered child has an entry in the map by its node id (this is why all nodes should have unique ids). map[id] returns an object with two attributes:
data --- an associated data item.
type --- an associated array of types.
It is not recommended to access map directly. There are several utility functions to access it. They can be used to virtualize the map, and you can use them with dojo.connect() so you know when DnD items are added/removed/accessed and use it to customize the behavior:


function OrderedIter(container, f, o){
  // similar to:
  // container.forInItems(f, o);
  // but iterates in the listed order

  o = o || dojo.global;
  container.getAllNodes().forEach(function(node){
    var id = node.id;
    f.call(o, container.getItem(id), id, container);
  });
}
Event processors

Following event processors are defined: onMouseOver, onMouseOut. Two pseudo-events are defined: onOverEvent, onOutEvent, which are cleaned up argument-less onMouseOver and onMouseOut events (otherwise they can be fired several times without actually leaving the container).

CSS classes

Following CSS classes are used by the container object:

dojoDndContainer --- assigned to each container node during the construction.
dojoDndContainerOver --- assigned when the mouse hovers over the container.
dojoDndItem --- assigned to every new data item node. It should be assigned to every item before the container construction, if you want it to be added automatically by the constructor.
dojoDndItemOver -- assigned to a data item node when the mouse hovers over the this item. This class is assigned in addition to dojoDndItem class.
Partial reason to add "over" states when the mouse hovers over instead of using CSS was to support it in Internet Explorer too.




TAKEN FROM:

http://docs.dojocampus.org/dojo/dnd


This package was built after we learned from mistakes made in dojo.dnd 0.4:

The old package relied on position calculations, which fail in many corner cases (the browsers are to blame), and potentially can consume a lot of CPU cycles depending on complexity of the underlying HTML (deeper embedding means more time spent going over parent chains). The new package doesn't do any position calculations instead relying on mouse events onmouseover and onmouseout. In order to do that we had to change the visual metaphor: the old DnD was dragging the object directly (it doesn't make much sense when dragging several objects), the new one uses an avatar to represent dragged objects. The avatar is shifted, so it doesn't obscure objects under the mouse giving the better visibility. Additionally it is possible to represent objects in the avatar differently. More on that later.
The old package attached event handlers to all draggable items, which slowed down the browser in case of a lot of objects. The new package works with containers, which are responsible for individual items, using event delegation. It scales up much better.
The old style dragging is useful in some cases, mostly because it looks intuitive for dragging single items. The new DnD accommodates it with a special sub-package dojo.dnd.move.

The DnD (both dojo.dnd and dojo.dnd.move packages) is implemented as state machines, which reflect their state by adding and removing classes to relevant objects, which gives the ultimate flexibility over customizing the look-and-feel.

Every DnD container and DnD item has a notion of type. The type is represented by a unique text string. Every container and item has an array of types assigned to them. In order to transfer (drop) items on a container they should have at least one type in common. When transferring a group of items to a container all items should have at least one type in common with the container. Otherwise the transfer is denied. If the list of types is not specified ["text"] is assumed.

The dojo.dnd supports copy and move styles of DnD out of the box.

User interface

The existing implementation supports a linear container paradigm:

Selection of an item on a mouse click.
Adding an item to the existing selection by ctrl+click.
Selecting a range of items by shift+click.
Adding a range of items by ctrl+shift+click.
(On Macintosh the Meta key is used instead of the Ctrl.) In order to show an insertion point correctly it is possible to specify if we deal with a vertical or horizontal container.

See Selector for more details.

dojo.dnd principals

The dojo.dnd consists of 5 classes: Container, Selector, Source, Manager, and Avatar. The former three classes are responsible for DnD sources and targets. The latter two classes are singletons responsible for orchestration of DnD on the web page.

Container

The default implementation of dojo.dnd.Container represents a uniform linear collection of items. It knows when the mouse hovers over it, and when the mouse hovers over a particular item.

The draggable item is represented by an abstract data object, which can be anything. There is a function creator, which is called when we need to visualize a data item for the container, or for the avatar. It allows us to have different representations of the same data item in different containers and in the avatar. More on that later.

Constructor

Constructor takes 2 parameters:

node --- a DOM node or an id (string) of such node. This node represents a container. All draggable items will be direct descendants of this node (the important exception: a <table> node, in this case items will be direct descendants of the embedded <tbody> node). If you want to override this default behavior, use dropParent attribute of params (see below).
params --- a dictionary object, which defines optional parameters. Following optional parameters are recognized:
creator(item, hint) --- a creator function, which is used to build a representation of the data item.
item --- a data item (an abstract object), which defines a draggable object. The creator function is solely responsible for the interpretation of this item.
hint --- an optional string, which hints at the purpose of the call. The creator function can use it to produce different visual representations. At the moment only one value is defined: "avatar". When hint == "avatar" the creator can produce a special version for the avatar.
It should return an object with following members:
node --- a DOM representation of the data item built by the creator. This node should have a unique id. If no id was assigned, it will be generated and assigned later by the container. This id will be used to identify this item everywhere.
data --- a data item itself. The creator can "massage" or even replace it.
type --- an array of strings, which identify the type of this item. It is used during the DnD operation to select compatible targets.
skipForm --- a Boolean flag. If it is true, the container passes selection and dragging operations to the browser, otherwise it suppresses them. It is useful when draggable items include text form elements that can be edited. By default it is false.
dropParent --- a DOM node below the main node, which serves as a physical container for data item nodes. It can be used to structure the visual design of your container. This value will be assigned to parent attribute of the container (see below).
During the construction the constructor checks immediate children of parent attribute (see below) for the presence of dojoDndItem class. All such items are added as container's children automatically. It is assumed that you already built the visual representation of the data item, so the creator function is not involved. Instead the necessary triplet formed like that:

node --- the node itself. If it doesn't have an id, a unique id is generated for it.
data --- the content of dndData member of the node. If it is missing, node.innerHTML is used instead.
type --- the content of dndType member of the node split on "," character. If it is missing, ["text"] is used as the default type.
Default creator

If the creator function was not specified, a default creator is used. The default creator does following things:

It creates a context-appropriate node:
If the container is <div> or <p>-based, it will create a <div> node.
If the container is <ul> or <ol>-based, it will create a <li> node.
If the container is <table>-based, it will create a <tr><td> group of nodes, and it will be inserted in <tbody>.
In all other contexts it will create a <span> node.
If the hint is "avatar" it will create a <span> node.
If the data item is an object, it will test for the presence of data member. If it is present, it will be used as a data object. Otherwise the item itself will be used as a data object.
If the data item is an object, it will test for the presence of type member. If it is present, it will be used as a type object. Otherwise ["text"] will be used as a type object.
It will set a content of the node to String(data). You can override the toString() member function of your object to change how it is converted to the string. Or specify the creator function.
As any creator it returns a triplet object with newly created/identified node, data, and type.
After the creator function was called the result is post-processed:

If the returned node doesn't have an id, the default unique id will be generated.
The returned node will be assigned a dojoDndItem class.
If the returned type is not an array or missing, it will be replaced with ["text"].
Public methods and attributes

Following public methods are defined:

getAllNodes() --- returns a NodeList of all controlled DOM nodes in the order they are listed in the container.
insertNodes(data, before, anchor) --- inserts data items before/after the anchor node. It returns the container object itself for easy chaining of calls.
data --- an array of data items to be inserted. Each data item will be passed to the creator function, the result will be registered with the container, the node will be inserted according to before and anchor parameters.
before --- a boolean flag. If it is true, nodes will be added before the anchor, and after otherwise.
anchor --- a node to be used as a reference for the insertion. It should be an immediate child of the container node (or a child of <tbody> for the <table>-based node). If it is not specified, all items will be appended to the container node (or <tbody> for tables).
destroy() --- prepares the container object to be garbage-collected. You cannot use the container object after it was destroyed.
sync() --- (new in 1.2.2) inspects all controlled DOM nodes updating internal structures by removing information of removed nodes, and adding newly added DOM nodes marked with dojoDndItem class.
The container object defines following public attributes:

current --- a DOM node, which corresponds to a child with a mouse hovering over it. If there is no such item, this variable is null.
node --- the DOM node of the container. This node is used to set up mouse event handlers for the container.
parent --- the DOM node, which is an immediate parent of DnD item nodes. In most cases it is the same as node, but in some cases it can be node's descendant. Example: for tables node can point to <table>, while parent points to <tbody> (DnD item nodes will be <tr> nodes). You can freely change parent to achieve the desired behavior of your container by specifying dropParent parameter.
creator --- the creator function or null, if the default creator is used.
skipForm --- the flag propagated from the initial parameters.
The heart of the Container is the map attribute:

map --- a dictionary, which is keyed by node ids. Each registered child has an entry in the map by its node id (this is why all nodes should have unique ids). map[id] returns an object with two attributes:
data --- an associated data item.
type --- an associated array of types.
It is not recommended to access map directly. There are several utility functions to access it. They can be used to virtualize the map, and you can use them with dojo.connect() so you know when DnD items are added/removed/accessed and use it to customize the behavior:

getItem(id) --- returns an object with data and type described above, which are associated with the node corresponding to that id.
setItem(id, obj) --- associates an object obj with this id. obj should define data and type attributes.
delItem(id) --- deletes a record of the node with this id. Warning: it does not delete the node from the container.
clearItems() --- delete all records. Warning: it does not delete nodes from the container.
forInItems(f, o) --- similar to dojo.forEach() but goes over all items in the map in an unspecified order. The function f will be called in the context o for every item in the map with following parameters:
obj --- the corresponding object with data and type defined.
id --- the node id.
map --- the map object itself.
forInItems() iterates over all DnD items in unspecified order. If you want to iterate over items in the order they are listed in the container you can use the code similar to this:

function OrderedIter(container, f, o){
  // similar to:
  // container.forInItems(f, o);
  // but iterates in the listed order

  o = o || dojo.global;
  container.getAllNodes().forEach(function(node){
    var id = node.id;
    f.call(o, container.getItem(id), id, container);
  });
}
Event processors

Following event processors are defined: onMouseOver, onMouseOut. Two pseudo-events are defined: onOverEvent, onOutEvent, which are cleaned up argument-less onMouseOver and onMouseOut events (otherwise they can be fired several times without actually leaving the container).

CSS classes

Following CSS classes are used by the container object:

dojoDndContainer --- assigned to each container node during the construction.
dojoDndContainerOver --- assigned when the mouse hovers over the container.
dojoDndItem --- assigned to every new data item node. It should be assigned to every item before the container construction, if you want it to be added automatically by the constructor.
dojoDndItemOver -- assigned to a data item node when the mouse hovers over the this item. This class is assigned in addition to dojoDndItem class.
Partial reason to add "over" states when the mouse hovers over instead of using CSS was to support it in Internet Explorer too.

Selector

The default implementation of Selector is built on top of Container and adds the ability to select children items. Selector inherits all Container's methods and objects. Additionally it adds a notion of an anchor. The anchor is used to specify a point of insertion of other items. The selector assumes that the container is organized in a linear fashion either vertically (e.g., embedded <div>s, lists, tables) or horizontally (e.g., <span>s). This assumption allows to implement familiar UI paradigms: selection of one element with a mouse click, selection of an additional element with ctrl+click, linear group selection from the anchor to the clicked element with shift+click, selecting an additional linear group from the anchor to the clicked element with shift+ctrl+click. Obviously if you have more complex containers, you should implement different UI actions.

Constructor

Constructor takes the same two parameters as the Container's constructor. It understands more optional parameters and passes the rest to the underlying container. Following optional parameters are understood by the selector object:

singular --- a Boolean flag. If it is true, the user is allowed to select just one item, otherwise any number of items can be selected. It is false by default.
autoSync --- a Boolean flag. If it is true, Selector calls Container's sync() method for every onMouseDown. It helps when you add/remove DnD items using HTML DOM API, but can be taxing for containers with large number of DnD items. In order to be more efficient consider calling sync() method after the manipulations were done, or (even more efficient) adding new DnD items using insertNodes() method. The default value of this parameter is false.
Public methods and attributes

Following public methods are defined in addition to the container public methods:

getSelectedNodes() --- returns a NodeList of selected DOM nodes.
selectNone() --- remove the selection from all items. It returns the selector object itself for easy chaining of calls.
selectAll() --- selects all items. It returns the selector object itself for easy chaining of calls.
deleteSelectedNodes() --- deletes all selected nodes. It returns the selector object itself for easy chaining of calls.
Following public method is redefined with new signature:

insertNodes(addSelected, data, before, anchor) --- the last three parameters are the same as in Container. The first parameter is a flag, if it is true all newly added items will be added as selected, otherwise they will be added unselected.
The container object defines following public attributes:

selection --- a dictionary object keyed by ids of selected nodes. No useful payload is attached to objects in the dictionary.
anchor --- the current anchor node or null.
Event processors

Following event processors are defined: onMouseDown, onMouseUp. onMouseMove is attached by onOverEvent and detached by onOutEvent dynamically.

CSS classes

Following CSS classes are used by the selector object in addition to classes assigned the container object:

dojoDndItemSelected --- assigned if a data item is selected but it is not an anchor (the last selected element). This class is assigned in addition to dojoDndItem class.
dojoDndItemAnchor --- assigned to an anchor data item. At any given time the selector can have zero or one anchor. This class is assigned in addition to dojoDndItem class. Being an anchor means that this item is selected.
Source

The source object represents a source of items for drag-and-drop operations. It is used to represent DnD targets as well. In order to be compatible your custom sources should emulate the common source API. Instances of this class can be created from the HTML markup automatically by dojo.parser using dojoType="dojo.dnd.Source".

The default implementation of the source is built on top of Selector, and adds the ability to start a DnD operation, and participate in the orchestration of the DnD. Source inherits all Selector's (and Container's) methods and objects. User can initiate the DnD operation by dragging items (click and move without releasing the mouse). The DnD operation can be used to rearrange items within a single source, or items can be moved or copied between two sources. User can select whether she wants to copy or move items by pressing the Ctrl button during the operation. If it is pressed, items will be copied, otherwise they will be moved. This behavior can be overwritten programmatically.

Constructor

Constructor takes the same two parameters as the container's selector. It understands more optional parameters and passes the rest to the underlying selector. Following optional parameters are understood by the source object:

isSource --- a Boolean flag. If it is true, this object can be used to start the DnD operation, otherwise it can serve only as a target. It is true by default.
accept --- an array of strings. It defines what types can be accepted by this object, when it is used as a target. The default is ["text"]. If the array is empty it means that this source cannot be a target.
horizontal --- a Boolean flag. If true, the source is based on the horizontally organized list container, otherwise it is based on the vertical one. The default is false.
withHandles --- a Boolean flag. If true, an item can be dragged only by a predefined node inside the item, otherwise the whole item can be used for dragging. By default it is false. The handle should be a descendant of the item node and should be marked with class dojoDndHandle.
copyOnly --- a Boolean flag. If true, the source doesn't allow to move items out of it, any DnD operation will copy items from such sources. By default it is false.
selfCopy --- (new in 1.2.2) a Boolean flag. If true, the source copies items by default when dropping on itself. It is false by default. This flag has meaning only if copyOnly is true.
selfAccept --- (new in 1.2.2) a Boolean flag. If true, the source accepts its own items. It is true by default. This flag has meaning only if copyOnly is true.
delay --- (new in 1.2.2) a number, which defines the move delay in pixels before detecting a drag; 0 (no delay) by default.
Public methods and attributes

The following public methods are defined (they can be replace to change the DnD behavior):

checkAcceptance(source, nodes) --- returns true, if this object can accept nodes from source. The default implementation checks item's types with accepted types of the object, and rejects the operation if there is no full match. Such objects are marked as disabled targets and they do not participate in the current DnD operation. The source of items can always accept its items regardless of the match (for exceptions see the definition of selfAccept above) preventing the situation when user started to drag items and cannot find a suitable target, and cannot return them back. Please take it into consideration when replacing this method. Target's checkAcceptance() is called during the DnD in progress when user hovers above it. Following parameters are passed to the method:
source --- the source object for the dragged items.
nodes --- a list of DOM nodes.
copyState(keyPressed) --- returns true if the copy operation should be performed, the move will be performed otherwise. The default implementation checks the copyOnly and selfCopy parameters described above. This method can be replaced if you want to implement a more complex logic. Following parameters are passed in:
keyPressed --- a Boolean flag. If true, user pressed the copy key.
self --- a Boolean flag. If it is true, we are about to drop items on itself.
Event processors

Following event handlers are overloaded: onMouseDown, onMouseUp, and onMouseMove. They are used to perform additional actions required by Source.

Following local events are defined by Source, which are meant to be overridden or connected with dojo.connect():

onDrop(source, nodes, copy) --- (new in 1.2.2) this method is called when DnD items is dropped in this target. The default implementation calls onDropExternal() or onDropInternal() based on the value of source (see below). Following parameters are passed in:
source --- the source of dragged items, can be the same object as the target.
nodes --- the array of DOM nodes to be dropped. Their ids can be used to access associated types and data.
copy --- the Boolean flag. If true, the target is requested to copy items, otherwise the target should move items.
onDropExternal(source, nodes, copy) --- (new in 1.2.2) this method is called by the default implementation of onDrop() only if we have an external drop meaning that the source is different from the target. All parameters are the same as in onDrop(). The default implementation performs the drop as instructed.
onDropInternal(nodes, copy) --- (new in 1.2.2) this method is called by the default implementation of onDrop() only if we have an internal drop meaning that the source is the same as the target. All parameters are the same as in onDrop(), but source parameter is skipped as redundant (it is the same as this). The default implementation performs the drop as instructed.
onDraggingOver() --- this method is called during the DnD operation in progress when the mouse is over this target, and it is not disabled for any reasons. The default implementation does nothing.
onDraggingOut() --- this method is called during the DnD operation in progress when the mouse went out of this target, and it is not disabled for any reasons. The default implementation does nothing.
Topic processors

Following topic listeners are defined: onDndSourceOver, onDndStart, onDndDrop, onDndCancel. These topics are published by the manager. If you want to override topic listeners, please read Summary of topics.

Warning: in most cases you want to use events. Topics are low-level constructs, which are used internally.

CSS classes

Following CSS classes are used by the source object in addition to classes assigned by Selector and Container objects:

dojoDndHorizontal --- assigned to the container node during the construction, if this object represents a horizontal list of dndItems --- its horizontal property set to true.
dojoDndSource --- assigned to the container node during the construction, if this object can be used as a source of DnD items --- its isSource property set to true.
dojoDndSourceCopied --- assigned to the container node during the active DnD operation when user copies items from it, e.g., pressed the Ctrl key while dragging. When this class is assigned to the node, dojoDndSource class is removed.
dojoDndSourceMoved --- assigned to the container node during the active DnD operation when user moves items from it, e.g., the Ctrl key is not pressed while dragging. When this class is assigned to the node, dojoDndSource class is removed.
dojoDndTarget --- assigned to the container node during the construction, if this object can potentially accept DnD items --- its accept list is not empty.
dojoDndTargetDisabled --- assigned to the container node during the active DnD operation when this node cannot accept currently dragged items, e.g., because it doesn't accept items of these types. When this class is assigned to the node, dojoDndTarget class is removed.
dojoDndItemBefore --- assigned to the data item node during the active DnD operation if transferred items will be inserted before this item. This class is assigned in addition to all other classes.
dojoDndItemAfter --- assigned to the data item node during the active DnD operation if transferred items will be inserted after this item. This class is assigned in addition to all other classes.
dojoDndHandle --- assigned to handles of item nodes. See withHandles parameter of Source above.
dojoDndSource, dojoDndSourceCopied, and dojoDndSourceMoved are mutually exclusive. dojoDndTarget, and dojoDndTargetDisabled are mutually exclusive. dojoDndSourceCopied, dojoDndSourceMoved, dojoDndTargetDisabled, dojoDndItemBefore, and dojoDndItemAfter can be assigned only during the active Dnd operation. See the manager's classes below to see what additional classes can be used for custom styling. Use dojoDndHorizontal with dojoDndItemBefore and dojoDndItemAfter to create visually appropriate insertion markers for horizontal (before, after) and vertical (above, below) containers.

Target

Essentially it is Source wrapped in with isSource set to false. Instances of this class can be created from the HTML markup automatically by dojo.parser using dojoType="dojo.dnd.Target".

AutoSource

Essentially it is Source wrapped in with autoSync set to true. Instances of this class can be created from the HTML markup automatically by dojo.parser using dojoType="dojo.dnd.AutoSource".

Avatar

Avatar is a class for the object (the singleton pattern) that represents dragged items during DnD operations. You can replace it or style it if you need to customize the look of DnD.

Following methods should be implemented:

constructor(manager) --- the constructor of the class takes a single parameter --- the instance of Manager, which is used to reflect the state of the DnD operation in progress visually. The constructor is called (and the avatar object is created) only when the manager decided to start a DnD operation. In this case Manager calls its method makeAvatar(). By default Avatar constructs <table>.
destroy() --- this method is called when the DnD operation is finished, the avatar is unneeded, and is about to be recycled.
update() --- this method is called, when the state of the manager changes. It is used to reflect manager's changes visually. Usually this method is called by Manager automatically.
_generateText() --- semi-public method, which is called by update() to render the header test. The default implementation returns a number of dragged items as a string. You can override this method for localization purposes, or to change the text however you like.
The default implementation of the Avatar class does the following:

It creates an absolutely positioned table of up to 6 rows.
The first row (the header) is populated with a text generated by _generateText() method.
Next rows are populated with DOM nodes generated by the creator function of the current source with hint "avatar" (see above the description of the creator function) for data items. Up to 5 rows are populated with decreasing opacity.
If you want to override the avatar with something totally custom, the best way to do it is to override Manager's makeAvatar() to return your own instance.

CSS classes

Following CSS classes are used to style the avatar:

dojoDndAvatar --- assigned to the avatar (the table).
dojoDndAvatarHeader --- assigned to the first row (the header).
dojoDndAvatarItem --- assigned to the avatar item rows.
dojoDndAvatarCanDrop --- added to the avatar (the table) when the mouse is over a target, which can accept transferred items. Otherwise it is removed.
Manager

Manager is a small class, which implements a business logic of DnD and orchestrates the visualization of this process. It accepts events from sources/targets, creates the avatar, and checks the validity of the drop. At any given moment there is only one instance of this class (the singleton pattern), which can be accessed by dojo.dnd.manager() function. You do not need to instantiate this object explicitly. It is done automatically when DnD modules are included.

This class or its instance can be monkey patched or replaced completely, if you want to change its functionality.

Public methods and attributes

Following public methods are defined to be called by sources:

startDrag(source, nodes, copy) --- starts the DnD operations. The parameters are copied as public member variables of the manager with the same names. This method creates the avatar by calling this.makeAvatar() and assigning it to the avatar public member. Information on parameters: * source --- the source of dragged items, can be the same object as the target. * nodes --- the array of DOM nodes to be dropped. Their ids can be used to access associated types and data. * copy --- the Boolean flag. If true, the target is requested to copy items, otherwise the target should move items.
stopDrag() --- resets the DnD operation by resetting all public members. It is not enough to call this method to abort the DnD. Before calling it you should publish dnd/cancel topic (or dnd/drop, if you forcing the drop). See more information on topics below.
canDrop(flag) --- called by the current target to notify that it can accept the DnD items, if flag is true. Otherwise it refuses to accept them.
Following methods deal with the avatar and can be overridden, if you want something different:

makeAvatar() --- returns the avatar's node. By default it creates an instance of Avatar passing itself as a parameter.
updateAvatar() --- updates avatar to reflect changes in the current DnD operation, e.g., copy vs. move, cannot drop at this point.
If you want to use a custom avatar, you can override these methods to do whatever you like.

Following public properties are defined on the manager (can be overwritten if desired):

OFFSET_X --- the horizontal offset in pixels between the mouse pointer position and the left edge of the avatar.
OFFSET_Y --- the vertical offset in pixels between the mouse pointer position and the top edge of the avatar.
Following public properties are used by the manager during the active DnD operation:

source --- the source of DnD items.
nodes --- the list of transferred DnD items.
copy --- Boolean value to track the copy/move status.
target --- the selected target of the drop.
Event processors

Following events are processed by the manager to the body: onMouseMove, onMouseUp, onKeyDown, onKeyUp. These events are attached only during the active DnD operation. Following keys have a special meaning for the manager:

Ctrl key --- when it is pressed the copy semantics is assumed. Otherwise the move is assumed.
Esc key --- when it is pressed the DnD operation is immediately canceled.
Topic processors

Following topic events can be generated by the manager:

/dnd/start --- when DnD starts. Current source, nodes, and the copy flag (see startDrag() for more info) are passed as parameters of this event.
/dnd/source/over --- when the mouse moves over a source. The source in question is passed as a parameter. The same event is raised when the mouse goes out of a source. In this case null is passed as a parameter.
/dnd/drop/before --- raised just before the drop. It can be used to capture the drop parameters. Parameters are the same as for /dnd/start, but reflect current values.
/dnd/drop --- raised to perform a drop. Parameters are the same as for /dnd/start and one additional parameter is target (the object where items are dropped).
/dnd/cancel --- when DnD was canceled either by user (by hitting Esc), or by dropping items in illegal location.
During the processing of topics any listener can change the original parameters. It can be done by the target processing /dnd/drop. In most cases you want to use events local to sources/targets, instead of processing topics. See Source's onDrop for more details.

CSS classes

Following CSS classes are used by the manager to style the DnD operation:

dojoDndCopy --- assigned to body during the copy DnD operations.
dojoDndMove --- assigned to body during the move DnD operations.
No styles are assigned when there is no DnD in progress.

dojo.dnd.move principals

The DnD move consists of two principal classes and several specific implementations.

Moveable

Moveable is the main class, which is used to give the "moveable" property to a DOM node. Instances of this class can be created from the HTML markup automatically by dojo.parser using dojoType="dojo.dnd.Moveable".

Constructor

The constructor accepts following parameters:

node --- a DOM node or an id (string) of such node. This node will be made moveable. Both relative and absolute nodes can be moved. Their left and top are assumed to be in pixels. All other nodes are converted to absolute nodes on the first drag.
params --- a dictionary object, which defines optional parameters. Following optional parameters are recognized:
handle --- the node (or its id), which will be used as a drag handle. It should be a descendant of node. If it is null (the default), the node itself is used for dragging.
delay --- a number in pixels. When user started the drag we should wait for delay pixels before starting dragging the node. It is used to prevent accidental drags. The default is 0 (no delay).
skip --- a Boolean flag, which indicates that we should skip form elements when initiating drags if it is true. Otherwise we drag the node no matter what. This parameter is used when we want to drag a form, but keep form elements usable, e.g., we can still select text in a text node. The default is false. When working with a draggable form, the better alternative to skip=true is to define a drag handle instead.
mover --- the class to be used to create a mover (see Mover).
Public methods and attributes

Following public members are available:

node --- the node to be dragged.
Following public methods are defined:

destroy() --- should be call, when you want to remove the "moveable" behavior form the node.
Event processors

Following public methods/events are defined (they can be used with dojo.connect() or overridden):

onDragDetected(evt) --- called when the drag is detected. The default implementation creates a mover. Parameters:
evt --- the event object, which triggered the drag.
onFirstMove(mover) --- called once after processing the first move event. The default implementation does nothing. Parameters:
mover --- the mover object used to drag the node
onMoveStart(mover) --- called when the move is about to start. The parameter is a mover object just like in onFirstMove(). The default implementation publishes the topic /dnd/move/start, adds dojoMove class to body node, and dojoMoveItem class to the moved node.
onMoveStop(mover) --- called when the move is finished. The parameter is a mover object just like in onFirstMove(). The default implementation publishes the topic /dnd/move/stop, removes dojoMove class from body node, and dojoMoveItem class from the moved node.
onMove(mover, leftTop) --- called on every update of node's position. The default implementation calls onMoving(), sets new position of the node using style, and calls onMoved(). Parameters:
mover --- the mover object for the current move.
leftTop --- {l, t} --- an object which defines the new left and top position of the object by its attributes l and t respectively. Both of them are numbers in pixels.
onMoving(mover, leftTop) --- called by the default implementation of onMove() before updating the node's position. It uses the same parameters as onMove() above. You can update leftTop parameter to whatever you want. The default implementation does nothing.
onMoved(mover, leftTop) --- called by the default implementation of onMove() after updating the node's position. It uses the same parameters as onMove() above. The default implementation does nothing.
The most important events are onFirstMove() and onMove(). The former can be used to set up some initial parameters for the move, and possibly update some DOM nodes. The latter implements the move itself. By overriding these two methods you can implement a variety of click-drag-release operations, e.g., a resize operation, a draw operation, and so on.

As you can see onMoving(), onMove(), and onMoved() fit the classic AOP before/after pattern. onMoving() can be used to actively modify move parameters, while onMoved() can be used for book-keeping. You may want to override onMove() for your own purposes and use dojox.lang.aop to augment it however you like.

Following mouse event handlers are set up:

onMouseDown
onMouseMove --- can be set up by onMouseDown when executing the non-zero delay.
onMouseUp --- can be set up by onMouseDown to cancel the drag while processing the non-zero delay.
Additionally ondragselect and onselectstart events are canceled by onSelectStart() handler.

Topic processors

Following topic events are raised by Moveable:

/dnd/move/start --- published by the default implementation of onMoveStart() passing the mover object as a parameter.
/dnd/move/stop --- published by the default implementation of onMoveStop() passing the mover as a parameter.
CSS classes

Following CSS classes are used by Moveable:

dojoMove --- assigned to body when the move is in progress.
dojoMoveItem --- assigned to the moved node when the move is in progress.
Mover

Mover is a utility class, which actually handles events to move the node, and triggers appropriate high-level events on the connected host (usually Moveable). Instances of this class exist only when the move is in progress. In some cases you can use it directly.

Constructor

The constructor accepts following parameters:

node --- a DOM node or an id (string) of such node. This node will be moved.
evt --- a mouse event, which actually indicated the start of the move. It is used to extract the coordinates of the mouse using pageX and pageY properties.
host --- a host object, which will be called by the mover during the move. It should define at least two methods: onFirstMove(), and onMove(), and two optional methods: onMoveStart() and onMoveStop(). See Moveable for details.
Public methods and attributes

Following public members are available:

node --- the node being dragged.
mouseButton --- a mouse button, which was pressed when starting the drag.
marginBox --- an object with two integer attributes: l and t. It is initialized by the constructor, updated by the onFirstMove() method on the mover, and used later on to add to the mouse coordinates before passing them to host's onMove() as leftTop.
Following public methods are defined:

destroy() --- should be call, when you want to stop the move.
onFirstMove() --- called once to finish setting up the marginBox property. Additionally it calls the host's onFirstMove().
Event processors

Following mouse event handlers are set up: onMouseMove, onMouseUp. Additionally ondragselect and onselectstart events are canceled.

Specialized Moveables

Following specialized moveable classes are defined:

constrainedMoveable

dojo.dnd.move.constrainedMoveable can be used to constrained a move to a dynamically calculated box. This class is define in the dojo.dnd.move module. It is based on Moveable, and accepts following additional parameters during construction:

constraints --- a function, which is called in the context of this moveable, with a newly created mover object, and returns a rectangle to be used for restrictions. The rectangle is an object, which defines following numeric attributes: l for left, t for top, w for width, and h for height. All numbers are in pixels.
within --- a Boolean flag. When it is true, the dragged node will be moved only within the defined rectangle, and cannot go outside of it. Otherwise, the restriction applies to the left-top corner of the moved node.
boxConstrainedMoveable

dojo.dnd.move.boxConstrainedMoveable can be used to constrain a move to a predefined box. This class is define in the dojo.dnd.move module. It is based on constrainedMoveable and accepts following additional parameters during construction:

box --- a rectangle box (see constrainedMoveable), which defines constraint boundaries.
within --- see constrainedMoveable for details.
parentConstrainedMoveable

dojo.dnd.move.parentConstrainedMoveable can be used to constrain the move by the boundaries of the node's parent. This class is define in the dojo.dnd.move module. It is based on constrainedMoveable and accepts following additional parameters during construction:

area --- a string, which defines constraint boundaries. Valid values are: "content", "padding", "border", and "margin".
within --- see constrainedMoveable for details.
TimedMoveable

dojo.dnd.TimedMoveable can be used to throttle FPS while moving nodes. This class is defined in its own module. It is based on Moveable, and accepts following additional parameters during construction:

timeout --- the time delay number in milliseconds. The node will not be moved for that number of milliseconds, but it will continue to accumulate changes in the mouse position.
Subclassing DnD classes

If you want to subclass Container, Selector, Source, Moveable, or their descendants, and you want to use the declarative markup, don't forget to implement the markupFactory() method. The reason for that is dojo.parser, which instantiates the markup, expects a very particular signature from a constructor. Dojo DnD classes predate dojo.parser, and have a non-conformant signature. dojo.parser is smart enough to use a special adapter function in such cases. See the source code for dojo.dnd.Source.markupFactory() (for the Container-Selector-Source chain), and dojo.dnd.Moveable.markupFactory() for details. The key point is to return the instance of your new class there. Otherwise the instance of your base class is going to be created, which is probably not what you want.

Summary of CSS classes

All DnD-related classes can affect 6 types of DOM nodes. All of them are collected in this section for your convenience. Using CSS classes described here you can design extremely sophisticated UI to improve usability and enhance the workflow of your applications.

body

The body node is updated only during active DnD operations. It can be used during the move to deemphasize temporarily the web page and to highlight available targets or a moved object.

Following CSS classes are used:

dojoDndCopy --- assigned to the body during the copy DnD operations (dojo.dnd).
dojoDndMove --- assigned to the body during the move DnD operations (dojo.dnd).
dojoMove --- assigned to the body when the drag is in progress (dojo.dnd.move).
Source/target (dojo.dnd)

Source can be assigned several classes to reflect its current role. These classes can be used together with the body CSS classes described above to create CSS rules to differentiate containers visually during DnD.

Following CSS classes are used:

dojoDndContainer --- assigned to each container node during the construction.
dojoDndContainerOver --- assigned when the mouse hovers over the container.
dojoDndHorizontal --- assigned to the container node during the construction, if this object represents a horizontal list of dndItems --- its horizontal property set to true.
dojoDndSource --- assigned to the container node during the construction, if this object can be used as a source of DnD items --- its isSource property set to true.
dojoDndSourceCopied --- assigned to the container node during the active DnD operation when user copies items from it, e.g., pressed the Ctrl key while dragging. When this class is assigned to the node, dojoDndSource class is removed.
dojoDndSourceMoved --- assigned to the container node during the active DnD operation when user moves items from it, e.g., the Ctrl key is not pressed while dragging. When this class is assigned to the node, dojoDndSource class is removed.
dojoDndTarget --- assigned to the container node during the construction, if this object can potentially accept DnD items --- its accept array is not empty.
dojoDndTargetDisabled --- assigned to the container node during the active DnD operation when this node cannot accept currently dragged items, e.g., because it doesn't accept items of these types. When this class is assigned to the node, dojoDndTarget class is removed.
DnD item (dojo.dnd)

DnD items can be assigned several classes to reflect their current role visually.

Following CSS classes are used:

dojoDndItem --- assigned to every new data item node. It should be assigned to every item before the container construction, if you want it to be added automatically by the constructor or sync().
dojoDndItemOver -- assigned to a data item node when the mouse hovers over the this item. This class is assigned in addition to dojoDndItem class.
dojoDndItemSelected --- assigned if a data item is selected but it is not an anchor (the last selected element). This class is assigned in addition to dojoDndItem class.
dojoDndItemAnchor --- assigned to an anchor data item. At any given time the selector can have zero or one anchor. This class is assigned in addition to dojoDndItem class. Being an anchor means that this item is selected.
dojoDndItemBefore --- assigned to the data item node during the active DnD operation if transferred items will be inserted before this item. This class is assigned in addition to all other classes.
dojoDndItemAfter --- assigned to the data item node during the active DnD operation if transferred items will be inserted after this item. This class is assigned in addition to all other classes.
DnD handles (dojo.dnd)

DnD items can defined special handles on their descendants, which can be used for dragging. In this case the body of the DnD item cannot be used to start the drag.

Following CSS classes are used:

dojoDndHandle --- assigned to handles of item nodes. See the withHandles parameter of Source.
Avatar (dojo.dnd)

The default avatar can be styled to suit your needs.

Following CSS classes are used:

dojoDndAvatar --- assigned to the avatar node (the table).
dojoDndAvatarHeader --- assigned to the first row/the header (the first tr node).
dojoDndAvatarItem --- assigned to the avatar item rows (tr nodes excluding the very first one).
dojoDndAvatarCanDrop --- added to the avatar node (the table) when the mouse is over a target, which can accept transferred items. Otherwise it is removed.
Dragged node (dojo.dnd.move)

The dragged node can be specially styled while in move.

Following CSS classes are used:

dojoMoveItem --- assigned to the dragged node when the move is in progress.
Summary of topics

While local events are the preferred way to handle state changes, in some cases topics (named global events) can be used. Please double-check if you have to use topics instead of events.

Following topic events can be generated by Manager:

/dnd/start --- when DnD starts. Current source, nodes, and copy flag (see Manager's startDrag() for more info) are passed as parameters of this event.
/dnd/source/over --- when the mouse moves over a source. The source in question is passed as a parameter. The same event is raised when the mouse goes out of a source. In this case null is passed as a parameter.
/dnd/drop/before --- raised just before the drop. It can be used to capture the drop parameters. Parameters are the same as for /dnd/drop.
/dnd/drop --- raised to perform a drop. The first three parameters are the same as for /dnd/start. The fourth parameter is the target object. Note that during the processing of this event nodes can be already moved, or reused. If you need the original nodes, use /dnd/drop/before to capture them, or use events local to source/target objects.
/dnd/cancel --- when DnD was cancelled either by user (by hitting Esc), or by dropping items in illegal location. This topic has no parameters.
All sources subscribe to Manager's topics. Some users fail to understand that if they override, say, onDndDrop() method, which is a /dnd/drop topic listener, it will be called every time /dnd/drop is signaled. It means it will be notified even if your source was not the part of the DnD exchange --- it wasn't a source of the items, and it is not a target of the drop. If you subclass Source and override onDndDrop(), your new method will be called for every instance of your class.

Following topic events are raised by Moveable:

/dnd/move/start --- published by the default implementation of Moveable's onMoveStart() passing a mover as parameter.
/dnd/move/stop --- published by the default implementation of Moveable's onMoveStop() passing a mover as parameter.
Available tests

All tests are located in the dojo/tests/dnd/ sub-directory. They are used by developers to test the conformance, and can be used by users to see how different objects and algorithms can be used. Following tests are available (these are external links to Dojo Nightlies, which are are not set up for speed but for debugging):

test_dnd.html tests general DnD operations including the markup and programmatic creation, pure targets, a special representation of DnD items in the avatar, styling of different objects, complex selection of items, and topics.
test_container.html tests the default creator function with different types of containers created programmatically.
test_container_markup.html tests the default creator function with different types of containers created with the markup.
test_selector.html tests the default creator function with different types of containers created programmatically.
test_selector_markup.html tests the default creator function with different types of containers created with the markup.
test_dnd_handles.html tests DnD handles. All objects are created with the markup.
test_form.html tests skipping form elements.
test_moveable.html tests moveable nodes declared moveable programmatically. Additionally it tests topics.
test_moveable_markup.html tests moveable nodes declared moveable by the markup. Additionally it tests topics.
test_params.html tests delay and skip parameters.
test_box_constraints.html tests dojo.dnd.move.boxConstrainedMoveable using programmatic and markup methods.
test_parent_constraints.html tests dojo.dnd.move.parentConstrainedMoveable with all "area" values.
test_parent_constraints_margins.html tests dojo.dnd.move.parentConstrainedMoveable with all "within" values.
test_custom_constraints.html tests dojo.dnd.move.constrainedMoveable implementing the "grid move" pattern.
test_timed_moveable.html tests dojo.dnd.TimedMoveable with different timeout values.
flickr_viewer.html implements an elaborate demo, which retrieves pictures of three types from Flickr, and allows to sort them into two bins according to their types. It demonstrates many techniques including horizontal vs. vertical containers, different representation of data items in different containers and in the avatar, and so on.
The same directory contains a simple CSS file, which shows how you can style the DnD objects: dndDefault.css. You can see it in action in almost all tests. It can be used as a starting point for your own styling.

External tutorials and documentation

Dojo Drag and Drop, Part 1: dojo.dnd by Revin Guillen at SitePen.
The comprehensive explanation of dojo.dnd, and how to leverage it in real applications. The author build the "shopping cart" in several iterations commenting code snippets and providing full source code for all examples. The only drawback is: this article uses topic handlers, because it was published before the introduction of local events.
Inside Dojo DnD: Drag Handles by Eugene Lazutkin at SitePen.
The article explains a frequently overlooked and underused feature of Dojo's Drag-and-Drop (DnD) module: drag handles. It features several simple examples and clarifies some fine points.
Queued: Drag and Drop in the Queue by Bryan Forbes at SitePen.
The article shows how Dojo DnD was used to implement the Netflix movie queue reordering feature in Queued, what features of DnD were used, and how it affected design decisions. All relevant code snippets are published along with detailed comments.
dojo.dnd 1.1 technical documentation by Eugene Lazutkin
This is the technical documentation for Dojo DnD 1.1 listed here only as a historic reference. This document is based on it.
Tips

In order to limit the maximum number of items in a DnD source, you can override the checkAcceptance() method on your source, and return false, when you reached your limit.

If you want to create dojo.dnd.Source with markup, and want to select that Source for operations like insertNodes(), you will need to manually supply that Source with a jsId. E.g.: <div dojoType="dojo.dnd.Source" id="test" jsId="test"> Then you reference it in your code like: test.insertNodes(); Without that, there is no way to use the methods of the Source if you are creating it with markup.

The DnD itself uses onmousedown/onmousemove/onmouseup to operate. If you want to process onclick, be warned that this is the synthetic event: essentially it is onmousedown + onmouseup, which occurred within some predefined time interval (usually settable on the OS level), or using other criteria. Some browsers generate onclick on every onmouseup. Working with DnD you will get plenty of false onclick events. Some of them happen naturally, when user decided to drag but changed her mind clicking the mouse button generating onclick. Be extra careful when processing onclick on DnD sources!

Accessibility

Low Vision

In the current nightly build as of April 17, 2009, and for the 1.4 release the drag and drop icons have been updated to better support low vision and to not rely on color alone to distinguish between the copy/no copy and move/no move operations.


If the copy operation can be performed the DnD icon is a green background with a plus.


If the copy operation can not be performed, the DnD icon is a red background with an x.


If the move operation can be performed the DnD icon is a green background with an arrow.


If the move operation can not be performed the DnD icon is a red background with a dash.

For High Contrast mode in Windows or when images have been turned off in the browser, the following character representations are used for the Dnd operations:

If the copy operation can be performed the DnD character is a +.
If the copy operation can not be performed, the DnD is an x.
If the move operation can be performed the DnD character is a <.
If the move opertation can not be performed the DnD character is an o.
However, in order to detect that high contrast mode has been set on a MS Windows system, you will need to include an additional file from the dijit system on your pages which use DnD. This file performs the check that high contrast mode has been set on a Windows system. When high contrast mode is turned on all color references are reduced to just a foreground and background color and CSS background images are not displayed. For more information on Windows High Contrast mode see Widgets and High Contrast Mode . Since DnD uses background images for the icons, the character equivalents are rendered when High Contrast mode is detected. You should include this additional file in all of your pages that use drag and drop in order to provide full accessibility. Add the following in your page below the other dojo includes:

<script type="text/javascript" src="../../../dijit/_base/wai.js"></script>
Note that your src path may vary and you may need to do a custom build to include this dijit file since it is not included in dojo.js by default.

dojo/dnd (last edited 2009-12-04 01:31:58 by eugene)
Immutable Page
DeleteCache (cached 2010-01-19 20:48:27)
Or try one of these actions: AttachFile, Despam, LikePages, Load, LocalSiteMap, PackagePages, RenderAsDocbook, Save, SpellCheck, SubscribeUser, SyncPages
MoinMoin PoweredPython PoweredGPL licensedValid HTML 4.01

</entry>

<entry [Fri Jan 15 14:51:06 EST 2010] AQWA USER ACCOUNT INFO>


USERNAME: aqwa
GROUP: aqwa
GROUP LEADER: Nick
PASSWORD: Open4aqwa


CHANGE PASSWORD:
http://iweb.ccs.miami.edu:8080/account/login.htm 




From: "CCS HPC (High Performance Computing - RT)" <hpc@ccs.miami.edu>
Date: November 24, 2009 2:41:35 PM EST
To: "Zysman, Joel" <JZysman@med.miami.edu>
Subject: [ccstkt #2837] Create user @ kronos 
Reply-To: "CCS HPC (High Performance Computing - RT)" <hpc@ccs.miami.edu>

Hi,

Both the group "aqwa", and the user "aqwa" have been created in Kronos, with
Nick the new group leader. The password for the user "aqwa" is "HPC2welcome",
and can be updated at http://iweb.ccs.miami.edu:8080/account/login.htm . Let us
know if you need more help.

Xinglong

On Tue Nov 24 14:12:01 2009, jzysman wrote:
Team please create a user aqwa and a group aqwa for kronos.


Make Nick the group leader and send me the password etc.

Thanks,

Joel


</entry>

<entry [Sat Jan 9 20:00:20 EDT 2009] ADDED paramtype FIELD TO parameter TABLE>


		CREATE TABLE IF NOT EXISTS parameter
		(
			username        VARCHAR(30) NOT NULL,
			appname         VARCHAR(40) NOT NULL,
			apptype         VARCHAR(40),
			name            VARCHAR(40) NOT NULL,
		
			paramtype       VARCHAR(40) NOT NULL default '',  -- input, resource, output
			category        VARCHAR(40) NOT NULL default '',  -- inputfile, outputdir, referencefile
			type            VARCHAR(20) NOT NULL default '',  -- file, files, directory, directories, string, integer
			argument        VARCHAR(40) NOT NULL default '',  
			value           TEXT,
			required        VARCHAR(10) NOT NULL default '',
			format          VARCHAR(40),                      -- fasta, squash, binaryFasta, etc.
			description     TEXT, 
			args            TEXT,
			params          TEXT,
			paramFunction   TEXT,
		
			PRIMARY KEY  (username, appname, name)
		);

</entry>

<entry [Thurs Jan 7 20:00:20 EDT 2009] INSTALL AQWA MYSQL DATABASE WITH config.pl>


ON COMMAND LINE IN AQWA SOURCE BASE DIRECTORY:

cd bin/scripts
perl config.pl

... <*** PRECEDING STEPS SKIPPED***>

Do you want to use Aqwa with MYSQL?)
Type 'Y' to configure MYSQL database or 'N' to skip it.
y
Database name [aqwa]:

Root password []:
<***ROOT MYSQL PASSWORD GOES HERE***>

Aqwa user name: [aqwa]:
open4aqwa
Aqwa user password: []:
Terminating on signal SIGINT(2)

E:\0.4\bin\scripts>perl config.pl
Do you want to use Aqwa with MYSQL?)
Type 'Y' to configure MYSQL database or 'N' to skip it.
y
Database name [aqwa]:

Root password []:
all4one
Aqwa user name: [aqwa]:

Aqwa user password: []:
open4aqwa
AQWA PASSWORD BEFORE CHOP: open4aqwa
AQWA PASSWORD AFTER CHOP: open4aqwa
databases: information_schema aqwa mysql test
Database 'aqwa' exists already. Press 'Y' to overwrite it or 'N' to exit
y
Creating database: aqwa
Creating SQL tables
sqlfile: access.sql
sqlfile: app.sql
sqlfile: diffs.sql
sqlfile: etcgroup.sql
sqlfile: groups.sql
sqlfile: groupusers.sql
sqlfile: parameter.sql
sqlfile: projects.sql
sqlfile: report.sql
sqlfile: sessions.sql
sqlfile: source.sql
sqlfile: users.sql
Loading data into SQL tables
tsvfile: access.tsv
tsvfile: app.tsv
tsvfile: etcgroup.tsv
tsvfile: groups.tsv
tsvfile: groupusers.tsv
tsvfile: parameter.tsv
tsvfile: projects.tsv
tsvfile: report.tsv
tsvfile: sessions.tsv
tsvfile: source.tsv
tsvfile: users.tsv
Creating Aqwa user 'aqwa' and granting privileges on database: aqwa
query: GRANT ALL PRIVILEGES ON aqwa.* TO 'aqwa'@'localhost'
IDENTIFIED BY 'open4aqwa' WITH GRANT OPTION

*******************************************************
*******************************************************
         Successfully created Aqwa database.

PLEASE MAKE A NOTE OF THE FOLLOWING ACCESS CREDENTIALS:

Aqwa database: aqwa
Aqwa user name: aqwa
Aqwa user password: open4aqwa

THESE VALUES WILL BE WRITTEN TO YOUR CONFIG FILE
*******************************************************
*******************************************************


*******************************************************
*******************************************************
Aqwa has been installed to this directory:
    E:/0.4
Browse to Aqwa here:
    http://localhost/aqwa
*******************************************************
*******************************************************


E:\0.4\bin\scripts>mysql -u root -p
Enter password: *******
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 97
Server version: 5.1.42-community MySQL Community Server (GPL)

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use aqwa
Database changed
mysql> desc parameter;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| username      | varchar(40) | NO   | PRI |         |       |
| appname       | varchar(40) | NO   | PRI |         |       |
| apptype       | varchar(40) | YES  |     | NULL    |       |
| name          | varchar(40) | NO   | PRI |         |       |
| category      | varchar(40) | NO   |     |         |       |
| type          | varchar(20) | NO   |     |         |       |
| argument      | varchar(40) | NO   |     |         |       |
| value         | text        | YES  |     | NULL    |       |
| required      | varchar(10) | NO   |     |         |       |
| format        | varchar(40) | YES  |     | NULL    |       |
| description   | text        | YES  |     | NULL    |       |
| args          | text        | YES  |     | NULL    |       |
| params        | text        | YES  |     | NULL    |       |
| paramFunction | text        | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
14 rows in set (0.02 sec)

mysql> show tables;
+----------------+
| Tables_in_aqwa |
+----------------+
| access         |
| app            |
| diffs          |
| etcgroup       |
| groups         |
| groupusers     |
| parameter      |
| projects       |
| report         |
| sessions       |
| source         |
| users          |
+----------------+
12 rows in set (0.19 sec)


</entry>

<entry [Tues Dec 29 15:44:20 EDT 2009] PROVIDE INLINE HTML ARGUMENTS TO WIDGETS  - dijit._Widget HAS _applyAttributes METHOD>


_applyAttributes: function(){

	console.log("_ComboBoxMenu._applyAttributes    plugins.core._ComboBoxMenu._applyAttributes()");

	// summary:
	//		Step during widget creation to copy all widget attributes to the
	//		DOM as per attributeMap and _setXXXAttr functions.
	// description:
	//		Skips over blank/false attribute values, unless they were explicitly specified
	//		as parameters to the widget, since those are the default anyway,
	//		and setting tabIndex="" is different than not setting tabIndex at all.
	//
	//		It processes the attributes in the attribute map first, ant then
	//		it goes through and processes the attributes for the _setXXXAttr
	//		functions that have been specified
	var condAttrApply = function(attr, scope){
		if( (scope.params && attr in scope.params) || scope[attr]){
			scope.attr(attr, scope[attr]);
		}
	};
	for(var attr in this.attributeMap){
		condAttrApply(attr, this);
	}
	dojo.forEach(getAttrReg(this.declaredClass), function(a){
		if(!(a in this.attributeMap)){
			condAttrApply(a, this);
		}
	}, this);
},



</entry>

<entry [Wed Dec 23 03:05:20 EDT 2009] PERL TOOLS - TIMING AND OBJECT DUMP WITH Time::HiRes AND $Data::Dumper::Deepcopy>
	
TIMING 

use Time::HiRes qw[gettimeofday tv_interval];
my $time1=[gettimeofday()];

...

my $milliseconds = tv_interval($time1)*1000;
printf "Elapsed time: %d milliseconds\n", $milliseconds;
exit;


OBJECT DUMP

use Data::Dumper;
$Data::Dumper::Deepcopy = 1;
my $apps = sprintf Dumper $projects;
	


</entry>

<entry [Thurs Dec 17 02:23:20 EDT 2009] WIDGET TRICKS TO FIGURE OUT 'id is already registered' ERROR>

MAQ NOTES


SNP PREDICTION WORKS ONLY FOR PAIRED ENDS


/nethome/syoung/base/bin/nextgen/clusterMAQ.pl \
--outputdir /p/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/maq \
--inputfile /p/NGS/syoung/base/pipeline/run12+15/1.4.0/lane2/s_1_1_sequence.fastq,/p/NGS/syoung/base/pipeline/run12/lane1/s_1_2_sequence.fastq \
--referencefile /p/NGS/syoung/base/pipeline/human-genome-bfa/genome.bfa \
--reads  1000000 \
--jobs 8 \
--queue "-q psmall -l walltime=96:00:00  -l nodes=n04:ppn=1" \
&> /p/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/maq/duan-lane1-clusterMAQ.log




</entry>

<entry [Thurs Dec 17 01:23:20 EDT 2009] WIDGET TRICKS TO FIGURE OUT 'id is already registered' ERROR>

DIJIT WIDGET REGISTRY


// GET ARRAY OF REGISTERED WIDGETS
var widgets = dijit.registry.byClass("dijit.layout.BorderContainer");

// RUN A FUNCTION FOR EVERY AVAILABLE WIDGET 
dijit.registry.forEach(function(widget, index, hash){

    if ( widget.id == this.id )
    {
        console.log("RUN A FUNCTION ON widget " + widget);
    }
});


// A STRAIGHT LOOP THROUGH THE WIDGETS
for ( var widget in widgets )
{
    console.log("dijit.layout.BorderContainer.postMixInProperties    widget: " + widget);
}



Widget creation method call sequence:

http://www.dojotoolkit.org/book/dojo-porting-guide-0-4-x-0-9/widgets/custom

postMixInProperties()
buildRendering()        - swaps out the source HTML with the widget's HTML, typically from a template. _Templated mixin defines this function.

postCreate()            Note that the children don't yet exist
startup()               is called after all the other widgets have been created

NB: No arguments are passed to these functions.




CLEAR FIREFOX CACHE - about:config INFO

http://kb.mozillazine.org/Firefox_:_FAQs_:_About:config_Entries

###about->config --> browser.memory.cache.enable --> SET TO FALSE

about->config --> browser.cache.memory.enable --> SET TO FALSE


### Tools --> Options --> Privacy --> Network --> Cache size --> SET TO ZERO
Tools --> Options --> Privacy --> Offline Storage --> 0 MB



DOJO 1.3.0 DOWNLOAD SITE

http://download.dojotoolkit.org/release-1.3.0/



</entry>

<entry [Wed Dec 16 01:23:20 EDT 2009] CREATED clusterCASAVA.pl>


1. CREATE OUTPUT DIRECTORY

mkdir -p /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/casavaMerged2
cd /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/casavaMerged2


2. MERGE RUN 12 AND RUN 15 *export.txt FILES INTO A SINGLE FILE FOR EACH READ IN OUTPUT DIR 

cd /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/casavaMerged2

RUN 12 + RUN 15 s_1_1

cat /mihg/data/NGS/syoung/base/pipeline/run12/1.4.0/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/Data/C1-104_Firecrest1.4.0_12-07-2009_syoung/Bustard1.4.0_12-07-2009_syoung/GERALD_12-07-2009_syoung/s_1_1_export.txt /mihg/data/NGS/syoung/base/pipeline/run12/1.4.0/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/Data/C1-104_Firecrest1.4.0_12-07-2009_syoung/Bustard1.4.0_12-07-2009_syoung/GERALD_12-07-2009_syoung/s_1_1_export.txt > s_1_1_export.txt 

RUN 12 + RUN 15 s_1_2

cat /mihg/data/NGS/syoung/base/pipeline/run12/1.4.0/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/Data/C1-104_Firecrest1.4.0_12-07-2009_syoung/Bustard1.4.0_12-07-2009_syoung/GERALD_12-07-2009_syoung/s_1_2_export.txt /mihg/data/NGS/syoung/base/pipeline/run12/1.4.0/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/Data/C1-104_Firecrest1.4.0_12-07-2009_syoung/Bustard1.4.0_12-07-2009_syoung/GERALD_12-07-2009_syoung/s_1_2_export.txt > s_1_2_export.txt 



3. COPY NEEDED ANCILLARY FILES

cd /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/casavaMerged
ll ..

cp /mihg/data/NGS/syoung/base/pipeline/run12/1.4.0/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/Data/C1-104_Firecrest1.4.0_12-07-2009_syoung/Bustard1.4.0_12-07-2009_syoung/GERALD_12-07-2009_syoung/s_1_pair.xml  ./

cp /mihg/data/NGS/syoung/base/pipeline/run12/1.4.0/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/Data/C1-104_Firecrest1.4.0_12-07-2009_syoung/Bustard1.4.0_12-07-2009_syoung/GERALD_12-07-2009_syoung/s_2_pair.xml  ./

cp /mihg/data/NGS/syoung/base/pipeline/run12/1.4.0/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/Data/C1-104_Firecrest1.4.0_12-07-2009_syoung/Bustard1.4.0_12-07-2009_syoung/GERALD_12-07-2009_syoung/Summary.htm  ./

cp /mihg/data/NGS/syoung/base/pipeline/run12/1.4.0/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/Data/C1-104_Firecrest1.4.0_12-07-2009_syoung/Bustard1.4.0_12-07-2009_syoung/GERALD_12-07-2009_syoung/config.xml  ./


cd /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/casavaMerged2
[syoung@ngsdev casavaMerged2]$ ll
total 9.9G
drwxrwx---+  2 syoung bioinfo 4.0K Aug 12 22:10 .
drwxrwx---+ 29 syoung bioinfo 4.0K Aug 12 21:30 ..
-rw-rw----+  1 syoung bioinfo 5.5K Aug 12 22:10 config.xml
-rw-rw----+  1 syoung bioinfo 5.0G Aug  7 14:59 s_1_1_export.txt
-rw-rw----+  1 syoung bioinfo 4.9G Aug  7 15:00 s_1_2_export.txt
-rw-rw----+  1 syoung bioinfo 7.7K Aug 12 22:10 s_1_pair.xml
-rw-rw----+  1 syoung bioinfo 7.7K Aug 12 22:10 s_2_pair.xml
-rw-rw----+  1 syoung bioinfo  94K Aug 12 22:10 Summary.htm


4. MOVE TO BUILD DIR AND CREATE .sh FILE

cd /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/casavaMerged2

rm -fr workflowAuto.sh
emacs workflowAuto.sh
#!/bin/sh

#PBS -N l1-casAuto
#PBS -l ncpus=8
#PBS -j oe
#PBS -M syoung@med.miami.edu
#PBS -m abe

cd /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/casavaMerged2/build

/nethome/syoung/base/apps/casava/1.0.10.1/run.pl \
--exportDir=/mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/casavaMerged2 \
--genomeSize=/nethome/syoung/base/apps/casava/1.0.10.1/features/human_genome_size.xml \
--lanes=1 \
--projectDir=/mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane1/casavaMerged2/build \
--runId=090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3 \
--refSequences=/nethome/syoung/base/pipeline/human-genome/illumina \
--workflowAuto \
--snpCovCutoff=-1

#### END

4. RUN CASAVA WITH workflowAuto ON CLUSTER


qsub -q psmall workflowAuto.sh ; date ; sleep 5; qstat
    
        
    70867.kronos.ccs.miami.edu
    Thu Aug 13 04:41:28 EDT 2009
    Job id                    Name             User            Time Use S Queue
    ------------------------- ---------------- --------------- -------- - -----
    70867.kronos              l1-casAuto       syoung                 0 Q psmall         
    Job id                    Name             User            Time Use S Queue
    ------------------------- ---------------- --------------- -------- - -----
    70867.kronos              l1-casAuto       syoung                 0 R psmall 











(MOVED PREVIOUS ERRONEOUS RUN OF LANES 1 AND 2 COMBINED FROM build TO build-old)

cd /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane2/casavaMerged2

rm -fr workflowAuto.sh
emacs workflowAuto.sh
#!/bin/sh

#PBS -N lsnr2csM2
#PBS -l ncpus=8
#PBS -j oe
#PBS -M syoung@med.miami.edu
#PBS -m abe

cd /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane2/casavaMerged2

time /nethome/syoung/base/apps/casava/1.0.10.1/run.pl \
--exportDir=/mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane2/casavaMerged2 \
--genomeSize=/nethome/syoung/base/apps/casava/1.0.10.1/features/human_genome_size.xml \
--lanes=2 \
--projectDir=/mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane2/casavaMerged2/build \
--runId=090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3 \
--refSequences=/nethome/syoung/base/pipeline/human-genome/illumina \
--workflowAuto \
--snpCovCutoff=-1 

echo `/usr/local/bin/qstat -f $PBS_ID > workflowAuto.usage`;
echo "Printed usage file: workflowAuto.usage" 

#### END



RUN CASAVA WITH workflowAuto


cd /mihg/data/NGS/syoung/base/pipeline/run12+15/1.4.0/lane2/casavaMerged2
qsub -q psmall workflowAuto.sh ; date; sleep 5 ; qstat
    







</entry>

<entry [Tues Dec 15 20:18:20 EDT 2009] RUN cluster-image2eland.pl WITH NEW VERSION 1.4.0 OF GA Pipeline>




ELAND:

REMOVE PAIRED END FROM RUN DIRECTORY





Run: Bixby Samples
Data location S:\pipeline_out\091029_HWI-EAS185_0005_42BNYAAXX
FlowCell ID: 42M2AAAXX
Paired End Run
http://gouda.ccs.miami.edu:8090/display/NextGen/091029_42BNYAAXX

Sample          Lane        
CGN LN          1,2,3,4
CGN CSPG        6,7,8

For this run we performed a single-read of 54 cycles. A 36 cycle kit and 18 cycle kit were combined into one for this run.


GERALD FILE

rm -fr /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt
emacs /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt

12345678:ANALYSIS eland_extended
12345678:SEQUENCE_FORMAT --fastq
5:ELAND_GENOME /nethome/bioinfo/data/sequence/controls/phiX-sq
1234678:ELAND_GENOME /nethome/bioinfo/data/sequence/chromosomes/human-sq
12345678:USE_BASES nY*n
ELAND_MULTIPLE_INSTANCES 8



####EXAMPLE 
##geraldfile	/nethome/bioinfo/data/ sequence/demo/image2el and/inputs/geraldfile- example.txt 		
##outputdir	Project1/Workflow2
##readlength	54
##referencefile	/nethome/bioinfo/data/ sequence/chromosomes/h uman-sq 		
##rundir	/q/solexa1/080801_HWI- EAS185_0001_20GVYAAXX_ Jia_cDNA2_mtDNA_Total_ Small_Medium_JH 		
##tiles	s_6_150
##type	single



OLD VERSION:

cd /nethome/syoung/base/pipeline/profile/image2eland1

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland1 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland1/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n01:ppn=8 -l walltime=72:00:00 -N 1-image2eland" \
&> image2eland1.out


CONVERT ARGUMENTS TO MATCH OLD VERSION:

cd ~/.aqwa/Project1/Workflow2

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland1 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland1/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n01:ppn=8 -l walltime=72:00:00 -N 1-image2eland" \
&> image2eland1.out









RUN cluster-image2eland.pl


cd ~/.aqwa/Project1/Workflow2

/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--imagedir /q/solexa/091029_HWI-EAS185_0005_42BNYAAXX/Images \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /q/solexa/091029_HWI-EAS185_0005_42BNYAAXX \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 54 \
--tiles s_1_10 \
--type single \
--queue -qgsmall \
--cpus 8


GET THIS ERROR:

em /nethome/syoung/.aqwa/Project1/Workflow2/outdir/makefile.error

        Traceback (most recent call last):
          File "/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py", line 963, in ?
            tiledic, FileNameClass, useLastCycle = getTileDic(run_folder, run_params, imagingProtocol)
          File "/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py", line 718, in getTileDic
            if (len(reduce(lambda x, y: x+y, tiledic.values())) <= 0):
        TypeError: reduce() of empty sequence with no initial value
        
        real    0m13.861s
        user    0m9.142s
        sys     0m0.071s





USED PYTHON Data::Dumper:

import pprint
pp = pprint.PrettyPrinter(indent=4)
pp.pprint(<variableNameHere>)







WHICH RUNS image2eland.pl (USING THE NEW RUN DIR WE CREATED BY COPYING FILES AND LINKING THE Images DIR):


/nethome/bioinfo/apps/aqwa/bin/apps/image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /nethome/syoung/.aqwa/Project1/Workflow2/091029_HWI-EAS185_0005_42BNYAAXX \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2/outdir \
--readlength 32 \
--tiles s_6_150 \
--type single \
--cpus 8


WHICH DOES:

cd /nethome/syoung/.aqwa/Project1/Workflow2/091029_HWI-EAS185_0005_42BNYAAXX

time /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py \
--GERALD=/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
/nethome/syoung/.aqwa/Project1/Workflow2/091029_HWI-EAS185_0005_42BNYAAXX \
--tiles=s_6_150 \
--make



/home/syoung/.aqwa/Project1/Workflow2/STDIN.e170958



NOTES
-----

CHANGED IT FROM THE ORIGINAL RUN WHICH HAD DISAPPEARED:
090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH

EXAMPLE GERALD FILE

geraldfile	/nethome/bioinfo/data/ sequence/demo/image2el and/inputs/geraldfile- example.txt 		
outputdir	Project1/Workflow2
readlength	32
referencefile	/nethome/bioinfo/data/ sequence/chromosomes/h uman-sq 		
rundir	/q/solexa1/080801_HWI- EAS185_0001_20GVYAAXX_ Jia_cDNA2_mtDNA_Total_ Small_Medium_JH 		
tiles	s_6_150
type	single



RUN cluster-image2eland.pl


/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--imagedir /q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/Images \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 32 \
--tiles s_6_150 \
--type single \
--queue -qgsmall \
--cpus 8




WHICH RUNS image2eland.pl (USING THE NEW RUN DIR WE CREATED BY COPYING FILES AND LINKING THE Images DIR):


/nethome/bioinfo/apps/aqwa/bin/apps/image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2/outdir \
--readlength 32 \
--tiles s_6_150 \
--type single \
--cpus 8


WHICH DOES:

cd /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH

time /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py \
--GERALD=/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
/nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH \
--tiles=s_6_150 \
--make






</entry>

<entry [Fri Nov 20 14:16:20 EDT 2009] INSTALL EXTERNAL PERL MODULES REQUIRED BY AQWA >

ON hplaptop:

ppm install File::Remove
ppm install File::Copy::Recursive
ppm install Net::LDAP
ppm install File::Sort
ppm install DBI
ppm install DBD::SQLite
ppm install Config::JSON
ppm install Term::ReadKey

ppm install Devel::Caller
ppm install MooseX::Params::Validate
ppm install MooseX::Getopt




ppm rep add trouchelle.com http://trouchelle.com/ppm10/
ppm install DB_FILE

ON linux AS root:

NB: FIRST SHUT DOWN HTTPD AND MYSQL TO AVOID THIS ERROR:
Cannot allocate memory at /usr/lib/perl5/5.8.8/CPAN.pm line 5726.

/etc/init.d/mysqld stop
/etc/init.d/httpd stop

OR KILL WITH ps aux


#### INSTALL MAKE TO AVOID THIS ERROR IN CPAN

        -- NOT OK
    Running make test
      Can't test without successful make
    Running make install
      make had returned bad status, install seems impossible



yum install make



perl -MCPAN -e shell

#### SET MAKE IN CPAN
o conf make /usr/bin/make
o conf commit




install Config::JSON

install File::Remove
install File::Copy::Recursive
install Net::LDAP
install File::Sort
install DBI
install DBD::SQLite
install Term::ReadKey



PROBLEM:

CAN'T INSTALL DBD::SQLite BY CPAN SO DID IT MANUALLY:

perl Makefile.PL
        
        Checking if your kit is complete...
        Looks good
        Multiple copies of Driver.xst found in: /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/ /nethome/bioinfo/apps/agua/0.4/lib64/external/vendor_perl/5.8.8/auto/DBI/ at Makefile.PL line 330
        Using DBI 1.609 (for perl 5.008008 on x86_64-linux-thread-multi) installed in /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBI/
        Writing Makefile for DBD::SQLite

make
        OK
make test
        OK
make install
        Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/SQLite.bs
        Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/SQLite.so
        Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
        Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/SQLite.pm
        Installing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/SQLite/Cookbook.pod
        Installing /usr/share/man/man3/DBD::SQLite.3pm
        Installing /usr/share/man/man3/DBD::SQLite::Cookbook.3pm
        Writing /usr/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/.packlist
        Appending installation info to /nethome/bioinfo/apps/agua/0.4/lib/external/5.8.8/x86_64-linux-thread-multi/perllocal.pod






</entry>

<entry [Tues Nov 10 02:39:40 EDT 2009] SYNCED plugins, cgi-bin AND lib>

REPORT

/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins/report \
--repository file:///srv/svn/aqwa/trunk/html/plugins/report \
--message "Onworking SNP report - finished: project and workflow combos, todo: tie up to file selection."

WORKFLOW

/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins/workflow \
--repository file:///srv/svn/aqwa/trunk/html/plugins/workflow \
--message "Fixed assorted workflow glitches and refactored CSS"

CGI-BIN

/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source cgi-bin \
--repository file:///srv/svn/aqwa/trunk/cgi-bin \
--message "Onworking SNP report - finished: project and workflow combos, todo: tie up to file selection."


</entry>

<entry [Mon Oct 19 01:23:20 EDT 2009] FIXING PROBLEM OF RUNNING cluster-image2eland.pl WITH NEW VERSION 1.4.0 OF GA Pipeline>


EXAMPLE GERALD FILE

geraldfile	/nethome/bioinfo/data/ sequence/demo/image2el and/inputs/geraldfile- example.txt 		
outputdir	Project1/Workflow2
readlength	32
referencefile	/nethome/bioinfo/data/ sequence/chromosomes/h uman-sq 		
rundir	/q/solexa1/080801_HWI- EAS185_0001_20GVYAAXX_ Jia_cDNA2_mtDNA_Total_ Small_Medium_JH 		
tiles	s_6_150
type	single




/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--imagedir /q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/Images \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 32 \
--tiles s_6_150 \
--type single \
--queue -qgsmall \
--cpus 8




WHICH RUNS image2eland.pl (USING THE NEW RUN DIR WE CREATED BY COPYING FILES AND LINKING THE Images DIR):


/nethome/bioinfo/apps/aqwa/bin/apps/image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2/outdir \
--readlength 32 \
--tiles s_6_150 \
--type single \
--cpus 8


WHICH DOES:

cd /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH

time /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py \
--GERALD=/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
/nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH \
--tiles=s_6_150 \
--make


HERE'S THE OUTPUT:

/nethome/bioinfo/apps/aqwa/bin/apps/image2eland.pl --referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq --geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt --rundir /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH --outputdir /nethome/syoung/.aqwa/Project1/Workflow2/outdir --readlength 32 --tiles s_6_150 --type single --cpus 8
Goat pipeline: /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py
No control lane argument suppplied. Running without control calibration of base calls.
Output dir: /nethome/syoung/.aqwa/Project1/Workflow2/outdir
Type: single
Run dir: /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH
CPUs: 8
Reference dir: /nethome/bioinfo/data/sequence/chromosomes/human-sq
Read length: 32
Tiles: s_6_150
Checking referencedir
Gerald configfile: /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt
Moving to rundir: /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH
PWD: /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH
Makefile command:

time /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py \
--GERALD=/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
/nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH \
--tiles=s_6_150 \
--make

Running makefile...
makefile out file: /nethome/syoung/.aqwa/Project1/Workflow2/outdir/makefile.out

makefile error file: /nethome/syoung/.aqwa/Project1/Workflow2/outdir/makefile.error

Finished running makefile.

makefile output file: /nethome/syoung/.aqwa/Project1/Workflow2/outdir/makefile.out

makefile error file: /nethome/syoung/.aqwa/Project1/Workflow2/outdir/makefile.error

Use of uninitialized value in split at /nethome/bioinfo/apps/aqwa/bin/apps/../../lib/SolexaUtil.pm line 64.
firecrest directory not found in makefile output


AND THE ERROR FILE CONTENTS:
ll /nethome/syoung/.aqwa/Project1/Workflow2/outdir/make*

	-rw-rw-rw- 1 syoung bioinfo 279 Oct 19 01:39 /nethome/syoung/.aqwa/Project1/Workflow2/outdir/makefile.error
	-rw-rw-rw- 1 syoung bioinfo   0 Oct 19 01:39 /nethome/syoung/.aqwa/Project1/Workflow2/outdir/makefile.out

em /nethome/syoung/.aqwa/Project1/Workflow2/outdir/makefile.error

	File "/nethome/syoung/base/apps/GAPipeline-1.3.2/bin/goat_pipeline.py", line 19, in ?
	  import runfolder, makefile, matrix, common, bustard, gerald, XMLSimple
	ImportError: No module named runfolder
	
	real    0m0.286s
	user    0m0.039s
	sys     0m0.044s



LOOKS LIKE A MISSING ENVIRONMENT VARIABLE PATH TO THE MODULES OR MISSING MODULES...

SURE ENOUGH THE /home IN THE PYTHON LIB LOCATION /home/syoung/base/apps/GAPipeline-1.4.0/lib/python
IS NOT ACCESSIBLE ON ngsdev SO CHANGED THIS ENTRY TO /nethome WHICH IS VISIBLE ON kronos AND ngsdev

emacs /nethome/syoung/base/apps/GAPipeline-1.3.2/bin/goat_pipeline.py

LINE 17

#GA_LIB_LIST = ["/mihg/analysis/GAPipeline-1.3.2/lib/python"]
GA_LIB_LIST = ["/mihg/analysis/GAPipeline-1.3.2/lib/python"]


SO CONTINUED TESTING ON ngsdev:

	
	time /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py \
	> --GERALD=/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
	> /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH \
	> --tiles=s_6_150 \
	> --make
	Starting Genome Analyzer Pipeline (goat), Firecrest version 1.4.0
	Warning: Error parsing XML file /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH.params.
	{}
	Warning: No instrument id found in parameter file /nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH.params.
	[('--GERALD', '/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt'), ('--tiles', 's_6_150'), ('--make', '')] ['/nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH']
	Traceback (most recent call last):
	  File "/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py", line 956, in ?
		tiledic, FileNameClass, useLastCycle = getTileDic(run_folder, run_params, imagingProtocol)
	  File "/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py", line 711, in getTileDic
		if (len(reduce(lambda x, y: x+y, tiledic.values())) <= 0):
	TypeError: reduce() of empty sequence with no initial value


BECAUSE THE .params FILE IS MESSED UP:


cat nethome/syoung/.aqwa/Project1/Workflow2/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH.params

40  -40   40  -40  -40  -40      -40   40  -40  -40       40  -40  -40  -40      -40  -40  -40   40      -40  -40\
  -40   40      -40   40  -40  -40      -40



IT SHOULD LOOK LIKE THIS:



/q/solexa1/090408_HWI- EAS185_0003_20CRUAAXX_ mito5-11_ENJH 

ll /q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/*params
	-rwxrwx---+ 1 mihglabtech mihg-data-drive-full 134 Apr  8  2009 /q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH.params

cat /q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/*params
	40  -40   40  -40  -40  -40      -40   40  -40  -40       40  -40  -40  -40      -40  -40  -40   40      -40  -40  -40   40        -40   40  -40  -40      -40 



ll /q/solexa1/*/*.params
ll /q/solexa1/*/*.params
	-rwxrwx---+ 1 mihglabtech mihg-data-drive-full 134 Mar 19  2009 /q/solexa1/090319_HWI-EAS185_0002_20G75AAXX_PowerOutage_JHEN/090319_HWI-EAS185_0002_20G75AAXX_PowerOutage_JHEN.params
	-rwxrwx---+ 1 mihglabtech mihg-data-drive-full 134 Apr  8  2009 /q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH.params
	-rwxrwx---+ 1 mihg        mihg                 134 May  8 15:42 /q/solexa1/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3.params



cat ll /q/solexa1/*/*.params


cat /q/solexa1/090319_HWI-EAS185_0002_20G75AAXX_PowerOutage_JHEN/090319_HWI-EAS185_0002_20G75AAXX_PowerOutage_JHEN.params

(BINARY)
ôF/Üx&2$@JD4úùù
*g¨¶



cat /q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH.params

40  -40   40  -40  -40  -40      -40   40  -40  -40       40  -40  -40  -40      -40  -40  -40   40      -40  -40  -40   40      -40   40  -40  -40      -40



cat /q/solexa1/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3.params

(BINARY)
Ä¨"Ð@*1*"2.5JOV´ãW`f]qbMKCKB<<DORLQP^w¯"IëøáÐæí¸iÖÄÐqh?gDO^[syoung@kronos ~]$ VT102VT102VT102VT102VT102VT102VT102VT102VT102VT102VT102VT102


perldoc -f unpack


perl -e 'unpack

/q/solexa1/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3.params





TRY IT WITH A DIRECTORY WITH A BINARY .params FILE:


/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--imagedir /q/solexa1/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/Images \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /q/solexa1/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3 \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 32 \
--tiles s_6_150 \
--type single \
--queue -qgsmall \
--cpus 8



WHICH RUNS image2eland.pl:

/nethome/bioinfo/apps/aqwa/bin/apps/image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /nethome/syoung/.aqwa/Project1/Workflow2/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3 \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2/outdir \
--readlength 32 \
--tiles s_6_150 \
--type single \
--cpus 8


WHICH RUNS goat_pipeline.py:

cd /nethome/syoung/.aqwa/Project1/Workflow2/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3

time /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py \
--GERALD=/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
/nethome/syoung/.aqwa/Project1/Workflow2/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3 \
--tiles=s_6_150 \
--make


Starting Genome Analyzer Pipeline (goat), Firecrest version 1.4.0
Warning: Error parsing XML file /nethome/syoung/.aqwa/Project1/Workflow2/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3.params.
{}
Warning: No instrument id found in parameter file /nethome/syoung/.aqwa/Project1/Workflow2/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3.params.
[('--GERALD', '/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt'), ('--tiles', 's_6_150'), ('--make', '')] ['/nethome/syoung/.aqwa/Project1/Workflow2/090508_HWI-EAS185_0004_3031UAAXX_Duan4_Jia3']
Error: Not enough image files found.


SO THE .params FILES FOR THESE DIRECTORIES ARE BAD...?

HERE'S AN EXAMPLE OF A WORKING .params FILE

FROM:
Fri Jul 11 22:06:43 EDT 2008
IMAGE PROCESSING AND BASE CALLING WITH PIPELINE

	
	emacs  /store/data/pipeline_in/080620_HWI-EAS185_0001_JIA_cDNA_JH/Data/.params
	>>>
	<?xml version="1.0"?>
	<ImageAnalysis>
	  <Run Name="C1-36_Firecrest1.9.2_24-06-2008_jhoffman">
		<Cycles First="1" Last="36" Number="36" />
		<ImageParameters>
		  <AutoOffsetFlag>1</AutoOffsetFlag>
		  <AutoSizeFlag>0</AutoSizeFlag>
		  <DataOffsetFile>/store/data/pipeline_in/080620_HWI-EAS185_0001_JIA_cDNA_JH/Data/default_offsets.txt</DataOffsetFile>
		  <Fwhm>2.700000</Fwhm>
		  <InstrumentOffsetFile>/store/data/pipeline_in/Instruments/HWI-EAS185/default_offsets.txt</InstrumentOffsetFile>
		  <OffsetFile>/store/data/pipeline_in/Instruments/HWI-EAS185/default_offsets.txt</OffsetFile>
		  <Offsets X="0.000000" Y="0.000000" />
	...<<<
	
	grep -n "Run Name" /store/data/pipeline_in/080620_HWI-EAS185_0001_JIA_cDNA_JH/Data/.params
	
		3:  <Run Name="C1-36_Firecrest1.9.2_24-06-2008_jhoffman">
		59:  <Run Name="C1-36_Firecrest1.9.2_24-06-2008_jhoffman.2">
		115:  <Run Name="C1-36_Firecrest1.9.2_25-06-2008_jhoffman">
		176:  <Run Name="C1-36_Firecrest1.9.2_25-06-2008_jhoffman.2">
		234:  <Run Name="C1-36_Firecrest1.9.2_25-06-2008_jhoffman">
		295:  <Run Name="C1-36_Firecrest1.9.2_25-06-2008_jhoffman.2">
		356:  <Run Name="C1-36_Firecrest1.9.2_30-06-2008_jhoffman">
		412:  <Run Name="C1-36_Firecrest1.9.2_30-06-2008_jhoffman.2">
		468:  <Run Name="C1-36_Firecrest1.9.2_30-06-2008_jhoffman.3">
		524:  <Run Name="C1-36_Firecrest1.9.2_01-07-2008_jhoffman">
		580:  <Run Name="C1-36_Firecrest1.9.2_01-07-2008_jhoffman.2">
		636:  <Run Name="C1-36_Firecrest1.9.2_01-07-2008_jhoffman.3">
		692:  <Run Name="C1-36_Firecrest1.9.2_01-07-2008_jhoffman.4">
		748:  <Run Name="C1-36_Firecrest1.9.2_01-07-2008_jhoffman.5">
		809:  <Run Name="C1-36_Firecrest1.9.2_01-07-2008_jhoffman.6">
		870:  <Run Name="C1-36_Firecrest1.9.2_01-07-2008_jhoffman.7">
		926:  <Run Name="C1-36_Firecrest1.9.2_07-07-2008_jhoffman">
		982:  <Run Name="C1-36_Firecrest1.9.2_07-07-2008_jhoffman">
		1038:  <Run Name="C1-36_Firecrest1.9.2_12-07-2008_jhoffman">
	
	



NO .params FILES IN THE LATER RUNS BUT THIS ONE APPEARS COMPLETE:


/p/solexa/rhenson/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Data/C1-52_Firecrest1.4.0_10-09-2009_rhenson/Bustard1.4.0_10-09-2009_rhenson/GERALD_10-09-2009_rhenson


du -hs /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/*

	8.0K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/080620_HWI-EAS185_0001_JIA_cDNA_JH.params
	41M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Calibration_08-06-20_13-53-47
	8.0K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/CommandIndex.bin
	144K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Config
	667G    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Data
	8.0K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/error.txt
	7.8M    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/FirstCycle.xml
	6.0M    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Focus.3.1.csv
	17M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/gclog.txt
	650G    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Images
	8.0K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/#jhuang1.txt#
	8.0K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/jhuang1.txt
	14M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/NetCopy.log
	152K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/nfn.log
	8.0K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/PermissionTest.txt
	4.0K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/process.completed
	20K     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Recipe_36Cycle_AF4.xml
	4.0K    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Run.completed
	40M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/RunLog_08-06-20_14-02-42.xml
	40M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/RunLog_08-06-21_00-51-45.xml
	41M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/RunLog_08-06-21_11-37-26.xml
	41M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/RunLog_08-06-21_22-23-24.xml
	41M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/RunLog_08-06-22_09-09-30.xml
	41M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/RunLog_08-06-22_19-55-37.xml
	41M     /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/RunLog_08-06-23_06-42-15.xml
	8.2M    /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/RunLog_08-06-23_17-27-21.xml



WHICH IS ALSO ACCESSIBLE THROUGH THE migh-data-drive-full GROUP

APACHE:

perl -U project.cgi "mode=getFolders&username=syoung&sessionId=1228791394.7868.158"


WHICH RUNS putrelay.pl:

-rwsr-sr-x 1 syoung mihg-data-drive-full 2818 Oct 19 03:34 putrelay.pl


WHICH CAN ACCESS /p/NGS	
...
putrelay.pl    purelay.pl    id: uid=48(apache) gid=48(apache) euid=1008(syoung) egid=577(mihg-data-drive-full) groups=48(apache)
080620_HWI-EAS185_0001_JIA_cDNA_JH
Instruments
syoung
...



SO I LINKED THIS DIRECTORY

/p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH 

TO HERE:

/nethome/bioinfo/data/solexa/080620_HWI-EAS185_0001_JIA_cDNA_JH


AND RERAN cluster-image2eland.pl:


/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--rundir   /nethome/bioinfo/data/solexa/080620_HWI-EAS185_0001_JIA_cDNA_JH \
--imagedir /nethome/bioinfo/data/solexa/080620_HWI-EAS185_0001_JIA_cDNA_JH/Images \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 32 \
--tiles s_6_150 \
--type single \
--queue -qgsmall \
--cpus 8



WHICH RAN image2eland.pl


/nethome/bioinfo/apps/aqwa/bin/apps/image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--rundir /nethome/syoung/.aqwa/Project1/Workflow2/080620_HWI-EAS185_0001_JIA_cDNA_JH \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2/outdir \
--readlength 32 \
--tiles s_6_150 \
--type single \
--cpus 8


WHICH RAN goat_pipeline.py:


cd /nethome/syoung/.aqwa/Project1/Workflow2/080620_HWI-EAS185_0001_JIA_cDNA_JH

time /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py \
--GERALD=/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
/nethome/syoung/.aqwa/Project1/Workflow2/080620_HWI-EAS185_0001_JIA_cDNA_JH \
--tiles=s_6_150 \
--make



WHICH GAVE THIS ERROR:


[syoung@ngsdev Workflow2]$ cat outdir/makefile.error 
Traceback (most recent call last):
  File "/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py", line 956, in ?
    tiledic, FileNameClass, useLastCycle = getTileDic(run_folder, run_params, imagingProtocol)
  File "/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py", line 711, in getTileDic
    if (len(reduce(lambda x, y: x+y, tiledic.values())) <= 0):
TypeError: reduce() of empty sequence with no initial value

real    0m2.155s
user    0m49.441s
sys     0m0.646s





TRIED AGAIN WITH THE UNLINKED, ORIGINAL RUN FOLDER:


/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--rundir   /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH \
--imagedir /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Images \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 32 \
--tiles s_6_150 \
--type single \
--queue -qgsmall \
--cpus 8



WHICH RAN image2eland.pl


/nethome/bioinfo/apps/aqwa/bin/apps/image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--rundir /nethome/syoung/.aqwa/Project1/Workflow2/080620_HWI-EAS185_0001_JIA_cDNA_JH \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2/outdir \
--readlength 32 \
--tiles s_6_150 \
--type single \
--cpus 8


WHICH RAN goat_pipeline.py:


cd /nethome/syoung/.aqwa/Project1/Workflow2/080620_HWI-EAS185_0001_JIA_cDNA_JH

time /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py \
--GERALD=/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
/nethome/syoung/.aqwa/Project1/Workflow2/080620_HWI-EAS185_0001_JIA_cDNA_JH \
--tiles=s_6_150 \
--make


AND GAVE THE SAME ERROR:

Traceback (most recent call last):
  File "/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py", line 956, in ?
    tiledic, FileNameClass, useLastCycle = getTileDic(run_folder, run_params, imagingProtocol)
  File "/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py", line 711, in getTileDic
    if (len(reduce(lambda x, y: x+y, tiledic.values())) <= 0):
TypeError: reduce() of empty sequence with no initial value

real    0m29.733s
user    0m29.480s
sys     0m0.145s



THEN ALTERED cluster-image2eland.pl TO WRITE THE PairedEndInfo.xml FILE REGARDLESS
OF WHETHER A .params FILE IS FOUND AND RERAN IT AND GOT THE SAME ERROR:

/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--rundir   /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH \
--imagedir /p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Images \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 32 \
--tiles s_6_50 \
--type single \
--queue -qgsmall \
--cpus 8 \
--control 5


THIS WAS USING GA PIPELINE 1.4.0 VERSION SO RERAN IT USING VERSION 1.3.2:

AND GOT THE SAME ERROR:


Traceback (most recent call last):
  File "/nethome/syoung/base/apps/GAPipeline-1.3.2/bin/goat_pipeline.py", line 952, in ?
    tiledic, FileNameClass, useLastCycle = getTileDic(run_folder, run_params, imagingProtocol)
  File "/nethome/syoung/base/apps/GAPipeline-1.3.2/bin/goat_pipeline.py", line 711, in getTileDic
    if (len(reduce(lambda x, y: x+y, tiledic.values())) <= 0):
TypeError: reduce() of empty sequence with no initial value

real  0m29.511s
user  0m28.999s
sys   0m0.157s



COPIED default_offsets.txt FILE TO THE FOLDER AND RERAN cluster-image2eland.pl:

FIRST COPIED FILE:

[syoung@ngsdev rhenson]$ ll 090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan
total 36K
drwxr-xr-x+ 3 rhenson mihg                  118 Oct 15 01:45 .
drwxrws---+ 8 jhahn   mihg-data-drive-full 4.0K Oct 15 07:44 ..
-rwxr--r--+ 1 rhenson mihg                  134 Sep 15 15:03 090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan.params
drwxr-xr-x+ 4 rhenson mihg                 4.0K Oct 15 01:45 Data
-rw-r--r--+ 1 rhenson mihg                  281 Sep 17 11:30 default_offsets.txt
lrwxrwxrwx  1 rhenson mihg                   68 Oct 15 01:43 Images -> /mihg/data1/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan/Images/
[syoung@ngsdev rhenson]$ cat 090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan/default_offsets.txt
# Default offsets generated on Wed Sep  9 05:59:11 2009 by rhenson
# Offsets/offsets.txt
 0.00  0.00  0.00000  0.00000  0.00000  0.00000
-2.18 -1.21 -0.00024 -0.00050  0.00000  0.00000
-0.48  0.37  0.00146  0.00155  0.00000  0.00000
-2.58 -0.59  0.00064  0.00083  0.00000  0.00000


cd /nethome/syoung/.aqwa/Project1/Workflow2/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan
cp /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan/default_offsets.txt ./


AND RAN WITH /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan AS THE RUN FOLDER:


/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--rundir   /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan \
--imagedir /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan/Images \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 32 \
--tiles s_6_50 \
--type single \
--queue -qgsmall \
--cpus 8


--control 5

SAME ERROR.

NOW, WITHOUT THE GERALD FILE:

/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--rundir   /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan \
--imagedir /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan/Images \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 32 \
--tiles s_6_50 \
--type single \
--queue -qgsmall \
--cpus 8






REASON FOR ERROR, SEE goat_pipeline.py

954            #cycleDirectoryList = run_params.CycleSelector.getCycleDirectoryList(imagingProtocol, run_folder)
955            tiledic, FileNameClass, useLastCycle = getTileDic(run_folder, run_params, imagingProtocol)
956            tiledics.append(tiledic)


SEEMS THAT THIS DIRECTORY BECAME UNAVAILABLE:

/q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/Images


SO USE THESE INSTEAD:

Single Read:

/p/solexa/rhenson/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4

Lane 1) EF1	 3pM
Lane 2) EF1	 3pM
Lane 3) EF2	 3pM
Lane 4) EF2	 3pM
Lane 5) PhiX	 3pM
Lane 6) EF3	 3pM
Lane 7) EF3	 3pM
Lane 8) EF4	 3pM


SINGLE READ GERALD FILE

emacs /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-single.txt 		

TILES	s_6_150
ANALYSIS        eland_extended
ELAND_GENOME    /nethome/bioinfo/data/sequence/chromosomes/human-sq
READ_LENGTH		32
USE_BASES       nY*



#### NB: OTHER POSSIBLE COMMANDS

EXPT_DIR			/p/solexa/rhenson/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4



Paired-end:

/p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan

Lane	 Sample	 Owner	 
1	 RF19-4002	 Duan 3.5 pM 
2	 RF12-3005	 Duan	 3 pM 
3	 EF2	 EFlemington	 2 pM 
4	 EF2	 EFlemington 2 pM 
5	 PhiX control	 Control	 3 pM 
6	 EF3	 EFlemington 3 pM 
7	 EF3 EFlemington	 3 pM 
8	 EF 4 EFlemington 3 pM 

For this run we performed 54 cycles by 54 cycles. A 36 cycle and a 18 cycle kit was combined into one for each read.

PAIRED END GERALD FILE:

emacs /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-paired.txt 		

TILES	s_6_150
ANALYSIS        eland_extended
ELAND_GENOME    /nethome/bioinfo/data/sequence/chromosomes/human-sq
READ_LENGTH		54
USE_BASES       nY*



RERUN WITH DEBUG OUTPUT:

cd /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan

/nethome/bioinfo/apps/aqwa/bin/apps/cluster-image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--imagedir /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan/Images \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2 \
--readlength 54 \
--tiles s_6_150 \
--type paired \
--queue -qgsmall \
--cpus 8


WHICH RUNS:


/nethome/bioinfo/apps/aqwa/bin/apps/image2eland.pl \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human-sq \
--geraldfile /nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-example.txt \
--rundir /nethome/syoung/.aqwa/Project1/Workflow2/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow2/outdir \
--readlength 54 \
--tiles s_6_150 \
--type paired \
--cpus 8




WHICH RUNS goat_pipeline.py:

cd /nethome/syoung/.aqwa/Project1/Workflow2/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan

time /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py \
--GERALD=/nethome/bioinfo/data/sequence/demo/image2eland/inputs/geraldfile-paired.txt \
/nethome/syoung/.aqwa/Project1/Workflow2/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan \
--tiles=s_6_150 \
--make



BUT CAN'T RUN IT BECAUSE THE IMAGES FILES AREN'T THERE

[syoung@ngsdev Data]$ ll /p/solexa/rhenson/*/Images
lrwxrwxrwx 1 rhenson mihg 66 Oct 14 21:40 /p/solexa/rhenson/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images -> /q/solexa1/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images
lrwxrwxrwx 1 rhenson mihg 58 Oct 15 01:43 /p/solexa/rhenson/090522_HWI-EAS185_0006_42BBFAAXX/Images -> /mihg/data2/solexa/090522_HWI-EAS185_0006_42BBFAAXX/Images
lrwxrwxrwx 1 rhenson mihg 68 Oct 15 01:43 /p/solexa/rhenson/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan/Images -> /mihg/data1/090528_HWI-EAS185_0007_42C1TAAXX_Flemington_Duan/Images/
lrwxrwxrwx 1 rhenson mihg 65 Oct 15 07:44 /p/solexa/rhenson/090605_HWI-EAS185_0008_42DHLAAXX_EF7_Tony_Jia4/Images -> /mihg/data1/090605_HWI-EAS185_0008_42DHLAAXX_EF7_Tony_Jia4/Images
lrwxrwxrwx 1 rhenson mihg 51 Oct 14 16:23 /p/solexa/rhenson/090724_HWI-EAS185_42LKBAAXX_TonyMP/Images -> /q/solexa/090724_HWI-EAS185_42LKBAAXX_TonyMP/Images
lrwxrwxrwx 1 rhenson mihg 50 Oct 14 17:11 /p/solexa/rhenson/090902_HWI-EAS185_0003_HNC1_JIA6/Images -> /q/solexa1/090902_HWI-EAS185_0003_HNC1_JIA6/Images
[syoung@ngsdev Data]$ 

























1. FOUND THIS PairedEndInfo.xml FILE BUT IT LOOKED SCREWED UP AS IT WAS IN BINARY

/q/solexa1/090408_HWI-EAS185_0003_20CRUAAXX_mito5-11_ENJH/PairedEndInfo.xml



From: Cabrera, Joe 
Sent: Thursday, September 17, 2009 9:31 AM
To: Edwards, Yvonne; Ulloa, Rick; Hulme, William; Henson, Rachel; Young, Stuart; Hahn, Justin
Subject: Issue with NextGen Paired Analysis Resolved

Hello all, 

            Thanks for your help regarding the NextGen pipeline and the issues we were having.  Success!  I was able to get beyond the Failed to process Gerald configuration error.  I googled the error and came across a forum called SeqAnswers (note:   Stuart has this on his wiki)  looks like a good resource.  

There is a file that needs to be copied over from the run directory called PairedEndInfo.xml and put into your local project directory.  In my case that was - /mihg/users/jcabrera1/base/pipeline/solexa-reruns/run_20DNU/090130_HWI-EAS185_0014_20DNUAAXX_mito1-4_DH_Jia_Uz_ENJH.  The file is required for paired-end analysis.  The file also needs to modified to include second read length.  Here is the sample:






[jcabrera1@kronos 090130_HWI-EAS185_0014_20DNUAAXX_mito1-4_DH_Jia_Uz_ENJH]$ cat PairedEndInfo.xml
<?xml version="1.0"?>
<FirstRead Length="36" />
<SecondRead Length="36" />


            Here is the link to the forum - http://seqanswers.com/forums/showthread.php?t=866

            
            I ran this via goat_pipeline.py in order to eliminate any wait time when submitting to the cluster.  Here is the last bit of the output from the submission:


.
5:ANALYSIS                   eland_pair
5:ELAND_GENOME               /q/nextGen/GA/refSeqs/control/phiXgenome
5:QTABLE_REQUIRED            0
5:READ_LENGTH1               28
5:READ_LENGTH2               28
5:SRF_2ND_CYCLE              -2 37
5:SRF_ARCHIVE_REQUIRED
5:SRF_QCAL
5:USE_BASES                  nYYYYYYYYYYYYYYYYYYYYYYYYYYYYnnnnnnnnyyyyyyyyyyyyyyyyyyyyyyyyyyyynnnnnnn
6:ANALYSIS                   none
6:QTABLE_REQUIRED            0
6:SRF_2ND_CYCLE
6:SRF_ARCHIVE_REQUIRED
6:SRF_QCAL
6:USE_BASES
7:ANALYSIS                   none
7:QTABLE_REQUIRED            0
7:SRF_2ND_CYCLE
7:SRF_ARCHIVE_REQUIRED
7:SRF_QCAL
7:USE_BASES
8:ANALYSIS                   eland_pair
8:ELAND_GENOME               /q/nextGen/GA/refSeqs/hs/36.1/chromosomes/eland
8:QTABLE_REQUIRED            0
8:READ_LENGTH1               28
8:READ_LENGTH2               28
8:SRF_2ND_CYCLE              -2 37
8:SRF_ARCHIVE_REQUIRED
8:SRF_QCAL
8:USE_BASES                  nYYYYYYYYYYYYYYYYYYYYYYYYYYYYnnnnnnnnyyyyyyyyyyyyyyyyyyyyyyyyyyyynnnnnnn
Removing temporary file /tmp/tmp-GERALD-143-10540.txt
You can generate the Makefiles by using the "--make" option.
[jcabrera1@kronos run_20DNU]$



            Here is how I submitted (I excluded the make option):

/mihg/analysis/GAPipeline-1.4.0/bin/goat_pipeline.py --GERALD=/mihg/users/jcabrera1/base/pipeline/solexa-reruns/run_20DNU/geraldfile.txt /mihg/users/jcabrera1/base/pipeline/solexa-reruns/run_20DNU/090130_HWI-EAS185_0014_20DNUAAXX_mito1-4_DH_Jia_Uz_ENJH  --control-lane=5 --tiles=s_5,s_8



Thanks, 

Joe Cabrera



</entry>

<entry [Sun Oct 18 02:49:10 EDT 2009] ACCESSED CLOUD>

chmod 400 ngsdev.pem 
ssh -i ngsdev.pem root@ec2-72-44-49-0.compute-1.amazonaws.com

NO WWW FOLDER:

-bash-3.2# ls /var
account  db     games  local  log   nis  preserve  run    tmp
cache    empty  lib    lock   mail  opt  racoon    spool  yp
-bash-3.2# ls /var/www/
ls: /var/www/: No such file or directory


-bash-3.2# locate apachectl
-bash-3.2# sqlite3
SQLite version 3.3.6
Enter ".help" for instructions
sqlite> .q
-bash-3.2# locate apache
/usr/lib/python2.4/site-packages/sos/plugins/apache.py
/usr/lib/python2.4/site-packages/sos/plugins/apache.pyc
/usr/lib/python2.4/site-packages/sos/plugins/apache.pyo





</entry>

<entry [Sun Oct 18 02:49:10 EDT 2009] PROBLEM WITH ngsdev SERVER>

This problem occurred yesterday night while I was debugging non-cgi scripts. I rebooted twice but no luck. 

PROBLEM:

CAN'T SEE STDOUT WHEN RUN workflow.cgi ON ngsdev

cd 

echo '{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":0}' | perl -U workflow.cgi

	...
	workflow.cgi     run_command: perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"
	[Sat Oct 17 21:56:42 2009] workflow.pl: Use of uninitialized value in concatenation (.) or string at /data/aqwa/0.3/cgi-bin/workflow.pl line 146.

<THEN JUST WHITE SPACE>



AND THE SAME WHEN RUNNING THE RELAY:


perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"



BUT RUNNING workflow.pl DIRECTLY GIVES THE FULL OUTPUT:


 perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json
workflow.pl    Running!!
workflow.pl    putdata: {"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":0}
workflow.pl    username: syoung
workflow.pl    Conf:
$VAR1 = {
          'HTMLURL' => 'http://ngsdev.ccs.miami.edu',
          'HOMEDIR' => '/mihg/users,/nethome',
...


!!! WITH NO 'unitialised...' ERROR MESSAGE !!!!



RUNNING putrelay.pl WITH DEBUG GIVES THIS:

perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"
/data/aqwa/0.3/cgi-bin/putrelay.pl
putrelay.pl    whoami: syoung
purelay.pl    id: uid=48(apache) gid=48(apache) euid=1008(syoung) egid=577(mihg-data-drive-full) groups=48(apache)
080620_HWI-EAS185_0001_JIA_cDNA_JH
Instruments
syoung
uid: 1008
gid: 1072
original_username: apache
original_real_uid: 48
original_effective_uid: 1008
original_real_gid: 48 48
original_effective_gid: 577 48
original primary gid: 48
NEW real_user_id:        1008
NEW effective_user_id:   1008
NEW real_group_id:       577 48
NEW effective_group_id:  577 48
command: 
perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json
[Sat Oct 17 22:32:25 2009] workflow.pl: Use of uninitialized value in concatenation (.) or string at /data/aqwa/0.3/cgi-bin/workflow.pl line 148.

[7]+  Stopped                 perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"




BUT THEN RERUNNING putrelay.pl (AFTER ONLY CHANGING THE DEBUG print STATEMENTS) GIVES THE FULL OUTPUT OF workflow.pl


perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"
workflow.pl    Running!!
workflow.pl    putdata: {"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":0}
workflow.pl    username: syoung
workflow.pl    Conf:
$VAR1 = {
          'HTMLURL' => 'http://ngsdev.ccs.miami.edu',
          'HOMEDIR' => '/mihg/users,/nethome',
          'BUSTARD' => '/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/bustard.py',
          'MAQ' => '/nethome/syoung/base/apps/maq/0.7.1/maq',
          'EXECUTION_TEMPDIR' => '/tmp',
          'SHOWCOORDS' => '/nethome/syoung/base/apps/mummer/show-coords',
          'ADMIN_USERS' => 'admin',
          'CGIDIR' => '/var/www/cgi-bin',
          'VELVET' => '/nethome/syoung/base/apps/velvet/velvet',
...




AND THEN RERUNNING putrelay.pl A FEW MINUTES LATER WE GET NO OUTPUT:


perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"
[Sat Oct 17 22:54:51 2009] workflow.pl: Use of uninitialized value in concatenation (.) or string at /data/aqwa/0.3/cgi-bin/workflow.pl line 146.





AND AFTER ADDING 'print "Running...!!!\n"' TO workflow.pl, WE GET NO OUTPUT WHEN RUNNING putrelay.pl:


bash-3.2$ perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"



AND NOW, AFTER REVERSING THE 'print "putrelay.pl   ' CHANGES AND PUTTING THEM BACK, IT'S BACK TO NORMAL:


perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"
Running...!!!
Workflow::executeWorkflow() ++++++++++++++ 
Workflow::executeWorkflow    Validated user syoung
Workflow::executeWorkflow    project: Project1
Workflow::executeWorkflow    start: 0
Workflow::executeWorkflow    workflow: Workflow1
Workflow::executeWorkflow    SELECT * FROM project
    WHERE username ='syoung'



AND A FEW MINUTES LATER I GET NO OUTPUT WHEN I RUN THE SAME COMMAND:

bash-3.2$  perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"


<NO OUTPUT>


AND THE SAME FOR workflow.cgi: 


echo '{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":0}' | perl -U workflow.cgi
workflow.cgi     Content-type: text/html

workflow.cgi     input: {"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":0}
workflow.cgi     username: syoung
workflow.cgi     relay script: /data/aqwa/0.3/cgi-bin/putrelay.pl
workflow.cgi     setown_command: chown syoung /data/aqwa/0.3/cgi-bin/putrelay.pl
workflow.cgi     setuid_command: chmod u+s /data/aqwa/0.3/cgi-bin/putrelay.pl
workflow.cgi     setgid_command: chmod g+s /data/aqwa/0.3/cgi-bin/putrelay.pl
workflow.cgi     tempfile: /tmp/workflow-temp.json
workflow.cgi     Temp file contents:
{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":0}workflow.cgi     command: perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"
workflow.cgi     run_command: perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"


where is my output???





BUT RUNNING workflow.pl ON ITS OWN WORKS FINE:

perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json

Workflow::executeWorkflow() ++++++++++++++ 
Workflow::executeWorkflow    Validated user syoung
Workflow::executeWorkflow    project: Project1
Workflow::executeWorkflow    start: 0
Workflow::executeWorkflow    workflow: Workflow1
Workflow::executeWorkflow    SELECT * FROM project
    WHERE username ='syoung'
    AND project = 'Project1'
    AND workflow = 'Workflow1'
    ORDER BY number
Workflow::executeWorkflow    applications: 
$VAR1 = [
          {
            'workflownumber' => '1',
...



AFTER REMOVING '$| = 1' IN putrelay.pl IT WORKS FINE (THOUGH IT TAKES 3 SECONDS TO START):


...BUT AFTER 30 MINS WE GET NO OUTPUT.


RAN IT AGAIN AND IT FAILED TO PRODUCE OUTPUT, THEN ADDED 'exit;' TO THE END OF putrelay.pl AND IT WORKED IMMEDIATELY:

perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"
Workflow::executeWorkflow() ++++++++++++++ 
Workflow::executeWorkflow    Validated user syoung
Workflow::executeWorkflow    project: Project1
Workflow::executeWorkflow    start: 0
Workflow::executeWorkflow    workflow: Workflow1
Workflow::executeWorkflow    SELECT * FROM project
    WHERE username ='syoung'
    AND project = 'Project1'
    AND workflow = 'Workflow1'
    ORDER BY number
...








PROBLEM SOLVED:

NOT REALLY A PROBLEM, JUST THAT THE REDIRECT OF STDOUT IN Apps.pm CAUSED THE
OUTPUT TO HANG IN A BUFFERED STATE.

IS THERE A WAY TO FORCE A BUFFER FLUSH ASIDE FROM '$| = 1', WHICH DOESN'T WORK IN THIS CASE?



NOTES
-----


PERMISSIONS - THE CAPITAL 'S' REPRESENTS A SUID BIT WITHOUT THE EXECUTE BIT:

MANUALLY UPLOADING putrelay.pl CAN SOMETIMES CHANGE ITS PERMISSIONS TO 644 

BUT NOTE THE CAPITAL 'S':

[root@ngsdev cgi-bin]# ll putrelay.pl
-rwSr-Sr-- 1 syoung bioinfo 2819 Oct 18 00:41 putrelay.pl

AFTER CHMOD AND SET UID, IT HAS A SMALL 'S':

[root@ngsdev cgi-bin]# chmod 755 putrelay.pl
[root@ngsdev cgi-bin]# ll putrelay.pl
-rwxr-xr-x 1 syoung bioinfo 2819 Oct 18 00:41 putrelay.pl

[root@ngsdev cgi-bin]# set putrelay.pl
[root@ngsdev cgi-bin]# ll putrelay.pl
-rwsr-sr-x 1 syoung bioinfo 2819 Oct 18 00:41 putrelay.pl






NB: WORKING CGI PERMISSIONS:

bash-3.2$ ll ../../0.3-bkp/cgi-bin/
total 204
drwxr-xr-x  5 syoung bioinfo             4096 Sep 29 17:27 .
drwxr-xr-x 10 syoung bioinfo             4096 Oct  5 00:07 ..
-rwsr-sr-x  1 syoung bioinfo             6556 Aug 23 03:49 admin.cgi
-rwxr-xr-x  1 syoung bioinfo             6045 Aug 23 23:12 admin.pl
lrwxrwxrwx  1 syoung bioinfo               19 Oct  5 14:14 conf -> /data/aqwa/0.3/conf
-rwxr-xr-x  1 syoung bioinfo             3273 Sep 28 10:34 download.cgi
-rw-r--r--  1 syoung bioinfo                9 Sep 23 23:17 dummy.txt
-rwxr-xr-x  1 syoung bioinfo             6278 Jul 14 16:41 file.pl
-rwsr-sr-x  1 syoung bioinfo              586 Dec 17  2008 ldap.cgi
lrwxrwxrwx  1 syoung bioinfo               18 Oct  5 14:14 lib -> /data/aqwa/0.3/lib
-rw-rw-rw-  1 syoung bioinfo             1617 Sep 29 14:17 log.txt
-rwsr-sr-x  1 syoung bioinfo             4533 Aug 22 23:20 msubMaster.pl
-rwsr-sr-x  1 syoung mihg-data-solexa    7352 Jul 14 16:21 msub.pl
-rwxr-xr-x  1 syoung bioinfo             7352 Aug 22 23:23 msubrelay.pl
-rwxr-xr-x  1 syoung bioinfo              457 Jul 23 06:31 out
-rwsr-sr-x  1 syoung bioinfo             3817 Sep 28 17:08 project.cgi
-rwsr-sr-x  1 syoung bioinfo             3816 Sep 28 16:43 project.cgi~
-rwsr-sr-x  1 syoung bioinfo             5014 Jul 22 01:22 projectMaster.cgi
-rwxr-xr-x  1 syoung bioinfo             4984 Sep 28 17:12 project.pl
-rwsr-sr-x  1 syoung bioinfo             2744 Aug 23 01:45 putrelay.pl
-rwxr-xr-x  1 syoung bioinfo             3047 Jul 13 00:20 qsub.pl
-rwsr-sr-x  1 syoung mihg-data-q-solexa  2902 Sep 29 17:38 relay.pl
-rwsr-sr-x  1 syoung mihg-data-q-solexa  2893 Sep 28 17:12 relay.pl-bkp
-rwsr-sr-x  1 syoung bioinfo             6606 Apr 30 20:15 report.cgi
-rwxr-xr-x  1 syoung bioinfo               55 Jul 12 21:50 runsleep.sh
-rwxr-xr-x  1 syoung bioinfo                0 Jul 24 00:51 stdout.txt
drwxr-xr-x  3 syoung bioinfo            12288 Sep 29 17:03 t
drwx------  2 syoung bioinfo             4096 Jul 12 21:54 test
-rwsr-sr-x  1 syoung bioinfo              441 Sep 23 23:18 testchgrp.pl
-rwxrwxr-x  1 syoung bioinfo             2303 Aug 16 22:24 testjson.pl
-rwxr-xr-x  1 syoung bioinfo             3160 Jul 12 22:40 testsuid.pl
-rwxr-xr-x  1 syoung bioinfo             5628 Sep 29 17:39 transferUpload.pl
-rwsr-sr-x  1 syoung bioinfo             6833 Sep 29 17:39 upload.cgi
drwxrwxr-x  2 syoung bioinfo             4096 Sep 30 17:35 uploads
-rwsr-sr-x  1 syoung bioinfo             6802 Sep 20 23:28 workflow.cgi
-rwsr-sr-x  1 syoung bioinfo             4376 Jul 23 03:13 workflowMaster.cgi
-rwxr-xr-x  1 syoung bioinfo             5602 Sep 20 23:48 workflow.pl
-rwxr-xr-x  1 syoung bioinfo              135 Jul 24 12:04 workflow-temp.json
















PROBLEM:

Can't access() script


WHEN I RUN workflow.cgi I GET 'CAN'T ACCESS FILE':


bash-3.2$ echo '{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":0}' | perl -U workflow.cgi
workflow.cgi     Content-type: text/html

workflow.cgi     input: {"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":0}
workflow.cgi     username: syoung
workflow.cgi     relay script: /data/aqwa/0.3/cgi-bin/putrelay.pl
workflow.cgi     setown_command: chown syoung /data/aqwa/0.3/cgi-bin/putrelay.pl
workflow.cgi     setuid_command: chmod u+s /data/aqwa/0.3/cgi-bin/putrelay.pl
workflow.cgi     setgid_command: chmod g+s /data/aqwa/0.3/cgi-bin/putrelay.pl
workflow.cgi     tempfile: /tmp/workflow-temp.json
workflow.cgi     Temp file contents:
{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"executeWorkflow","start":0}workflow.cgi     command: perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"
workflow.cgi     run_command: perl /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/workflow.pl < /tmp/workflow-temp.json"
Can't access() script
bash-3.2$ 



DIAGNOSIS:


putrelay.pl PERMISSIONS WHERE CHANGED TO 644 AFTER FILE TRANSFER

bash-3.2$ ll putrelay.pl
-rwSr-Sr-- 1 syoung bioinfo 3032 Oct 17 23:01 putrelay.pl
bash-3.2$ 



SOLUTION:


CHANGE PERMISSIONS BACK TO 755








</entry>

<entry [Thu Oct 15 04:01:46 EDT 2009] CREATE SAMPLE INPUTS FOR clusterMAQ.pl>

FROM: 
Sun Sep 13 13:28:16 EDT 2009
RUN clusterMAQ ON SAMPLE 3


perl /nethome/bioinfo/apps/aqwa/bin/apps/clusterMAQ.pl \
--outputdir /nethome/syoung/.aqwa/Project1/Workflow1b \
--inputfile1 /nethome/syoung/.aqwa/Project1/Workflow1b/s_1_1_sequence.100000.txt \
--inputfile2 /nethome/syoung/.aqwa/Project1/Workflow1b/s_1_2_sequence.100000.txt \
--jobs 30 \
--reads 10000 \
--referencefile /nethome/bioinfo/data/sequence/genomes/human-bfa/genome.bfa \
--queue "-q psmall"



1. REPLACE '@' SYMBOL IN QUALITY WITH 'A' TO AVOID PROBLEMS WITH MAQ'S sanger2fastq

/nethome/syoung/base/bin/comparison/replaceAtQual.pl \
--inputfile /nethome/syoung/.aqwa/Project1/Workflow1b/s_1_1_sequence.100000.txt \
--outputfile /nethome/syoung/.aqwa/Project1/Workflow1b/s_1_1_sequence.SANGER.100000.txt \
--dot 100000
	
	Run time: 00:00:00
	Completed /nethome/syoung/base/bin/comparison/replaceAtQual.pl
	4:05AM, 15 October 2009
	****************************************


/nethome/syoung/base/bin/comparison/replaceAtQual.pl \
--inputfile /nethome/syoung/.aqwa/Project1/Workflow1b/s_1_2_sequence.100000.txt \
--outputfile /nethome/syoung/.aqwa/Project1/Workflow1b/s_1_2_sequence.SANGER.100000.txt \
--dot 100000

	Run time: 00:00:00
	Completed /nethome/syoung/base/bin/comparison/replaceAtQual.pl
	4:05AM, 15 October 2009
	****************************************

	

2. CHECK READS ARE PAIRED CORRECTLY 

perl /nethome/syoung/base/bin/utils/comparePair.pl \
--inputfile /nethome/syoung/.aqwa/Project1/Workflow1b/s_1_1_sequence.100000.txt \
--pairedfile /nethome/syoung/.aqwa/Project1/Workflow1b/s_1_2_sequence.100000.txt \
--type fastq
    




3. RUN clusterMAQ.pl ON ngsdev

mkdir -p /p/NGS/syoung/base/pipeline/SRA/maq/3
cd /p/NGS/syoung/base/pipeline/SRA/maq/3
screen -S clusterMAQ-sample3

#### 	NB: USE --clean OPTION IF RUNNING FOR FIRST TIME

/nethome/syoung/base/bin/nextgen/clusterMAQ.pl \
--splitfile /p/NGS/syoung/base/pipeline/SRA/NA18507/samples/reads.3.fastq.split \
--referencefile /p/NGS/syoung/base/pipeline/human-genome-bfa/genome.bfa \
--outputdir /p/NGS/syoung/base/pipeline/SRA/maq/3 \
--inputfile /p/NGS/syoung/base/pipeline/SRA/NA18507/samples/reads_SANGER_1.3.fastq,/p/NGS/syoung/base/pipeline/SRA/NA18507/samples/reads_SANGER_2.3.fastq \
--clean \
--convert \
--queue "-q psmall" \
--jobs 40 \
&> /p/NGS/syoung/base/pipeline/SRA/maq/3/outerr.txt


tail -f /p/NGS/syoung/base/pipeline/SRA/maq/3/outerr.txt

	real    4m34.908s
	user    4m30.092s
	sys     0m30.746s
	
	Run time: 38:14:05
	Completed /nethome/syoung/base/bin/nextgen/clusterMAQ.pl
	3:00PM, 19 September 2009
	****************************************






</entry>

<entry [Mon Oct 12 02:50:40 EDT 2009] FLEMINGTON SAMPLE - REQUESTED >


090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4


Run: Flemington1-4
FlowCell ID: 4299MAAXX

Run Folder: 090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4

Lane 1) EF1	 3pM
Lane 2) EF1	 3pM
Lane 3) EF2	 3pM
Lane 4) EF2	 3pM
Lane 5) PhiX	 3pM
Lane 6) EF3	 3pM
Lane 7) EF3	 3pM
Lane 8) EF4	 3pM


Single Read run. 

For this run we performed 52 cycles. A 36 cycle and a 18 cycle kit was combined into one for the read. 


</entry>

<entry [Mon Oct 12 02:39:40 EDT 2009] SYNCED plugins, cgi-bin AND lib>



/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins/project \
--repository file:///srv/svn/aqwa/trunk/html/plugins/project \
--message "Fixed access using SETUID for project.pl."


/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins/workflow \
--repository file:///srv/svn/aqwa/trunk/html/plugins/workflow \
--message "Added runStatus poll at load of project. Fixed Dnd 'running' CSS icon and scrolling behaviour of File Manager."



/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins \
--repository file:///srv/svn/aqwa/trunk/html/plugins \
--message "General update prior to adding onKeyPress ESC quit from FileUpload."



</entry>

<entry [Mon Oct 12 02:20:40 EDT 2009] SYNCED plugins, cgi-bin AND lib>

ADD 'ESC' EXIT FROM FILE UPLOAD


Here's what we did to trap the delete key on a page.
Submitted by irv2directThought on Fri, 08/22/2008 - 16:29.

We put this function in a dojo.addOnLoad. In our case, we wanted to trap the delete key in every instance except input fields. In your case, for the ESC key, you might have valid elements to not trap the ESC from...

If you don't want it on the whole document, you could replace document here with whatever div or element you wanted:

trapDeleteKey = function(){

    dojo.connect( document, "onkeypress",

            function( evt ) {

                // console.debug( "Key was pressed %o", evt.target );

                var stopIt = false;

                if( evt.keyCode == dojo.keys.BACKSPACE ){

                    stopIt = true;

                    if( evt.target.tagName ){

                        if((evt.target.tagName.toUpperCase() == "INPUT") && (evt.target.type) && (evt.target.type.toUpperCase() == "TEXT") ) {

                            console.debug( "Got backspace key in text input field and not stopping it");

                            stopIt = false;

                        }

                        else if(evt.target.tagName.toUpperCase() == "TEXTAREA"){

                            console.debug( "Got backspace in text area and not stopping it")

                            stopIt = false;

                        }

                    }

                }

                if( stopIt ){

                    dojo.stopEvent( evt );

                }

            }  );

};




dojo.connect(dlg.containerNode, 'onkeypress', function (evt) {
  if(evt.keyCode == dojo.keys.ESCAPE) {
    dojo.stopEvent(evt);
  }
 });





Editor doesn't work in TitlePane
http://trac.dojotoolkit.org/ticket/8915




FREQUENT ERROR (APPEARS TO BE HARMLESS)


_252 is undefined
anonymous(div#plugins_workflow__GroupSelectorPane_2.dojoxRollingListPane)






COMMANDS FOR project.cgi


perl -U project.cgi "mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&location=/q&query=%22solexa1%22"
perl -u project.cgi "mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&location=/q&query=%22solexa1%2FGSL%22"
perl -U project.cgi "mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%2FWorkflow1%22"
perl -U project.cgi "mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&location=/nethome/bioinfo/data/sequence&query=%22demo%22"
perl -U project.cgi "mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&query=%22Project1%22"





</entry>

<entry [Sat Oct 10 21:52:06 EDT 2009] FIXED ACCESS TO FILESYSTEM BY project.cgi VIA project.pl>

PROBLEM

RUNNING project.pl USING AN ARGUMENT DOESN'T TRANSFER THE EFFECTIVE GROUP ID.

HOWEVER, RUNNING IT WITH REDIRECT DOES.



DIAGNOSIS

1. ADDITION OF FACL INFO ON WINDOWS SIDE MESSED UP ACCESS

2. APPLICATION ON WRONG GROUP NAME (mihg-data-drive-full IS THE CORRECT ONE)




perl -U project.cgi "mode=fileSystem&username=syoung&sessionId=1228791394.7868.158"






</entry>

<entry [Fri Oct  9 01:41:50 EDT 2009] REMAINING SAFE RUN AFTER CRASH OF q DRIVE>


/p/NGS/080620_HWI-EAS185_0001_JIA_cDNA_JH/Data/C1-36_Firecrest1.9.2_15-07-2008_syoung/Bustard1.9.2_18-07-2008_syoung.2


ll /p/NGS

	drwxrwx---+   5 jhahn mihg-data-drive-full   78 Jun  3 10:15 NGS

getfacl /p/NGS

	getfacl: Removing leading '/' from absolute path names
	# file: p/NGS
	# owner: jhahn
	# group: mihg-data-drive-full
	user::rwx
	group::rwx
	group:mihg-data-ngs:rwx
	mask::rwx
	other::---
	default:user::rwx
	default:group::rwx
	default:group:mihg-data-ngs:rwx
	default:mask::rwx
	default:other::---




</entry>

<entry [Wed Oct  7 02:49:55 EDT 2009] MESSAGE TO WARNER RE: AQWA USER CAN'T ACCESS SOLEXA ARCHIVES>


From: Young, Stuart 
Sent: Wednesday, October 07, 2009 2:41 AM
To: Baringer, John
Subject: Apache can't access /nethome/bioinfo/data/sequence/demo

Hi John,

Apache wasn't able to access /nethome/bioinfo/data/sequence/demo because of permissions:

drwxr-xr-x  4 syoung bioinfo 16384 Sep 28 12:50 cdna
drwxr-xr-x  5 syoung bioinfo 16384 Sep 28 12:57 chromosomes
drwxrwx---+ 8 syoung bioinfo 16384 Sep 28 14:00 demo
drwxr-xr-x  5 syoung bioinfo 16384 Sep 28 13:00 genomes
drwxr-xr-x  5 syoung bioinfo 16384 Sep 28 12:31 mtdna

So I changed the permissions but it still doesn't allow access:

 [syoung@ngsdev cgi-bin]$ chmod 755 /nethome/bioinfo/data/sequence/demo
 [syoung@ngsdev cgi-bin]$ ll /nethome/bioinfo/data/sequence/
total 112K
drwxrwxr-x  7 bioinfo bioinfo 16K Sep 28 14:00 .
drwxrwxr-x  3 bioinfo bioinfo 16K Sep 28 12:19 ..
drwxr-xr-x  4 syoung  bioinfo 16K Sep 28 12:50 cdna
drwxr-xr-x  5 syoung  bioinfo 16K Sep 28 12:57 chromosomes
drwxr-xr-x+ 8 syoung  bioinfo 16K Sep 28 14:00 demo
drwxr-xr-x  5 syoung  bioinfo 16K Sep 28 13:00 genomes
drwxr-xr-x  5 syoung  bioinfo 16K Sep 28 12:31 mtdna

The +' sign at the end of the permissions looks like it's a permissions problem. I checked with getfacl and it seems that the mihg-data-ngs group has been applied to the folder:

[syoung@ngsdev cgi-bin]$ getfacl /nethome/bioinfo/data/sequence/demo
getfacl: Removing leading '/' from absolute path names
# file: nethome/bioinfo/data/sequence/demo
# owner: syoung
# group: bioinfo
user::rwx
group::rwx                      #effective:r-x
group:mihg-data-ngs:rwx         #effective:r-x
mask::r-x
other::r-x
default:user::rwx
default:group::rwx
default:group:mihg-data-ngs:rwx
default:mask::rwx
default:other::---


Do you know how to fix it?

It's a bit perturbing when these kinds of changes happen - any idea who did it and why?

Cheers,

Stuart.


</entry>

<entry [Wed Oct  7 02:39:55 EDT 2009] MESSAGE TO WARNER RE: AQWA USER CAN'T ACCESS SOLEXA ARCHIVES>

Hi Warner,

Apache still can't access /q/solexa using this script:


cd /data/aqwa/0.3/cgi-bin
ll relay.pl

	-rwsr-sr-x 1 apache mihg-data-ngs 3800 Oct  7 00:15 relay.pl

getfacl relay.pl

	# file: relay.pl
	# owner: apache
	# group: mihg-data-ngs
	user::rwx
	group::r-x
	other::r-x
	apache $

perl -w /data/aqwa/0.3/cgi-bin/relay.pl syoung "perl /data/aqwa/0.3/cgi-bin/project.pl \"mode=fileSystem&username=syoung&sessionId=1254883168.19529.307&location=/p&query=%22NGS%22\""


	uid: 48
	relay.pl    username: apache
	relay.pl    gid: 48
	whoami: apache
	id: uid=48(apache) gid=48(apache) egid=918(mihg-data-ngs) groups=48(apache)
	080620_HWI-EAS185_0001_JIA_cDNA_JH
	Instruments
	syoung
	relay.pl    Content-type: text/html
	
	relay.pl    /data/aqwa/0.3/cgi-bin/relay.pl
	relay.pl    relay.pl    username: syoung
	relay.pl    relay.pl    command: perl /data/aqwa/0.3/cgi-bin/project.pl "mo\
	de=fileSystem&username=syoung&sessionId=1254883168.19529.307&location=/p&qu\
	ery=%22NGS%22"
	relay.pl    uid: 48
	relay.pl    username: apache
	relay.pl    gid: 48
	080620_HWI-EAS185_0001_JIA_cDNA_JH
	Instruments
	syoung
	relay.pl    relay.pl    command: perl /data/aqwa/0.3/cgi-bin/project.pl "mo\
	de=fileSystem&username=syoung&sessionId=1254883168.19529.307&location=/p&qu\
	ery=%22NGS%22"
	[Wed Oct  7 01:26:02 2009] project.pl: Can't open base directory: /p/NGS: P\
	ermission denied at /data/aqwa/0.3/cgi-bin/lib/Project.pm line 1716.
	whoami: apache
	id: uid=48(apache) gid=48(apache) groups=48(apache)
	
	<h1>Software error:</h1>
	<pre>Can't open base directory: /p/NGS: Permission denied at /data/aqwa/0.3\
	/cgi-bin/lib/Project.pm line 1716.
	</pre>
	<p>
	For help, please send mail to this site's webmaster, giving this error mess\
	age
	and the time and date of the error.
	
	</p>


(NOTE: THE egid IS NOT CARRYING OVER TO project.pl)


Whereas user 'syoung' can access /q/solexa


syoung $

perl -w /data/aqwa/0.3/cgi-bin/relay.pl syoung "perl /data/aqwa/0.3/cgi-bin/project.pl \"mode=fileSystem&username=syoung&sessionId=1254883168.19529.307&location=/p&query=%22NGS%22\""

	uid: 1008
	relay.pl    username: syoung
	relay.pl    gid:
	whoami: apache
	id: uid=1008(syoung) gid=1072(bioinfo) euid=48(apache) egid=918(mihg-dat\
	a-ngs) groups=669(mihg-data-core-external),702(mihg-data-vendor),710(mih\
	g-core-external-pearlsoe),892(mihg-data-solexa),918(mihg-data-ngs),1046(\
	mihgadm),1072(bioinfo),5603(mihg-data-q-solexa),14566(mihg-data-q-nextge\
	n-full),14567(mihg-data-q-nextgen)
	Use of uninitialized value in concatenation (.) or string at /data/aqwa/\
	0.3/cgi-bin/relay.pl line 134.
	080620_HWI-EAS185_0001_JIA_cDNA_JH
	Instruments
	syoung
	relay.pl    Content-type: text/html
	
	relay.pl    /data/aqwa/0.3/cgi-bin/relay.pl
	relay.pl    relay.pl    username: syoung
	relay.pl    relay.pl    command: perl /data/aqwa/0.3/cgi-bin/project.pl \
	"mode=fileSystem&username=syoung&sessionId=1254883168.19529.307&location\
	=/p&query=%22NGS%22"
	relay.pl    uid: 1008
	relay.pl    username: syoung
	relay.pl    gid:
	080620_HWI-EAS185_0001_JIA_cDNA_JH
	Instruments
	syoung
	relay.pl    relay.pl    command: perl /data/aqwa/0.3/cgi-bin/project.pl \
	"mode=fileSystem&username=syoung&sessionId=1254883168.19529.307&location\
	=/p&query=%22NGS%22"
	whoami: syoung
	id: uid=1008(syoung) gid=1072(bioinfo) groups=669(mihg-data-core-externa\
	l),702(mihg-data-vendor),710(mihg-core-external-pearlsoe),892(mihg-data-\
	solexa),918(mihg-data-ngs),1046(mihgadm),1072(bioinfo),5603(mihg-data-q-\
	solexa),14566(mihg-data-q-nextgen-full),14567(mihg-data-q-nextgen)
	
	/* {
	'name': 'NGS',
	'path': 'NGS',
	'total': '3',
	'items': [
	{
		'name': '080620_HWI-EAS185_0001_JIA_cDNA_JH',
		'path': '080620_HWI-EAS185_0001_JIA_cDNA_JH',
		'parentPath': 'NGS',


The strange thing is it worked before - check out my message in July copied below. 


Cheers,

Stuart.


MESSAGE TO JOEL/ZONGJUN RE: ROOT-->ANYUSER SETUID CONFIGURATION WORKING

From: Young, Stuart 
Sent: Monday, July 13, 2009 6:30 PM
To: Zysman, Joel; 'hpc@ccs.miami.edu'
Cc: Tsinoremas, Nick
Subject: Aqwa access (data/cluster)

Hi Joel/Zongjun,

Just to let you know, the root' setuid script (sets SUID of next script) ? anyuser' setuid script (runs MOAB) configuration we discussed just now works fine. I've implemented it as follows:

(on ngsdev, as apache')
cd /data/aqwa/0.3/cgi-bin
perl -w msubMaster.pl akumar "/nethome/syoung/base/html/aqwa/trunk/fileroot/admin/" "/nethome/syoung/base/html/aqwa/trunk/fileroot/admin/scriptfile-admin.sh"

This runs this script: msub.pl, which gives the following successful msub submit:


/usr/local/bin/msub /nethome/syoung/base/html/aqwa/trunk/fileroot/admin/scriptfile-admin.sh

60917

[syoung@ngsdev cgi-bin]$ mshow

active jobs------------------------
JOBID              USERNAME      STATE PROCS   REMAINING            STARTTIME

60892              echaussa    Running     1    14:02:03  Mon Jul 13 08:12:46
60738                syoung    Running     8  3:18:36:59  Sun Jul 12 12:47:41
60789                   him    Running    12  5:18:21:46  Sun Jul 12 21:32:29
60893                akumar    Running     6  6:16:09:52  Mon Jul 13 10:20:35
60894                akumar    Running     6  6:16:12:42  Mon Jul 13 10:23:25
60896                akumar    Running     6  6:16:21:44  Mon Jul 13 10:32:27
60904                akumar    Running     6  6:23:06:14  Mon Jul 13 17:16:57
60917                akumar    Running     1  6:23:59:47  Mon Jul 13 18:10:30   ? IT'S RUNNING!!

8 active jobs            46 of 240 processors in use by local jobs (19.17%)
                           7 of 30 nodes active      (23.33%)

Fyi, I had to manually set the UID and GID in the anyuser' script (i.e., in addition to the chmod u+s and chmod g+s commands run by the root' script) in order for MOAB to recognize the job as being sent by the particular user (i.e., MOAB looks for the read_uid and real_gid that are set within the script to identify the owner of the job). Otherwise, the job will be labeled as owned by  apache' and put in the deferred queue.

By setting the group to mihg-data-solexa', all users also have read access to the archived NGS data in /mihg/data/solexa. If we need more restricted access, I can set this differently as required.
 
As we discussed just now, I'll configure the system to use a .aqwa' folder in my home directory and test it with and without apache ownership and then send you a list of alpha testers so you can create a similar directory in their home folders.

Cheers,

Stuart.


getfacl: Removing leading '/' from absolute path names
# file: p/NGS
# owner: jhahn
# group: mihg-data-drive-full
user::rwx
group::rwx
group:mihg-data-ngs:rwx
mask::rwx
other::---
default:user::rwx
default:group::rwx
default:group:mihg-data-ngs:rwx
default:mask::rwx
default:other::---



[root@ngsdev cgi-bin]# getfacl /q/solexa
getfacl: Removing leading '/' from absolute path names
# file: q/solexa
# owner: root
# group: mihg-data-drive-full
user::rwx
group::rwx
group:mihg-data-q-solexa:r-x
mask::rwx
other::---
default:user::rwx
default:group::rwx
default:group:mihg-data-q-solexa:r-x
default:mask::rwx
default:other::---

[root@ngsdev cgi-bin]# getfacl /q/solexa/data
getfacl: /q/solexa/data: No such file or directory
[root@ngsdev cgi-bin]# getfacl /q/data
getfacl: /q/data: No such file or directory
[root@ngsdev cgi-bin]# getfacl /q/solexa1
getfacl: Removing leading '/' from absolute path names
# file: q/solexa1
# owner: root
# group: mihg-data-drive-full
user::rwx
group::rwx
group:mihg-data-q-solexa:r-x
mask::rwx
other::---
default:user::rwx
default:group::---
default:group:mihg-data-q-solexa:r-x
default:mask::rwx
default:other::---



</entry>

<entry [Mon Oct  5 14:15:58 EDT 2009] RESOLVED ACCESS TO SOLEXA ARCHIVE PROBLEM DUE TO INCORRECT EFFECTIVE USER ID RESULTING IN NON-TRANSFERANCE OF GROUP>

PROBLEM

perl -w /data/aqwa/0.3/cgi-bin/relay.pl syoung "perl /data/aqwa/0.3/cgi-bin/project.pl \"mode=fileSystem&username=syoung&sessionId=1254883168.19529.307&location=/q&query=%22solexa1%22\""

[Tue Oct  6 23:40:02 2009] project.pl: Can't open base directory: /q/solexa1: Permission denied at /data/aqwa/0.3/cgi-bin/lib/Project.pm line 1716.
whoami: apache
id: uid=48(apache) gid=48(apache) groups=48(apache)

<h1>Software error:</h1>
<pre>Can't open base directory: /q/solexa1: Permission denied at /data/aqwa/0.3/cgi-bin/lib/Project.pm line 1716.



DIAGNOSIS

WHEREAS THIS SCRIPT CREATED BY APACHE IN /tmp CAN ACCESS /q/solexa1:

#!/usr/bin/perl -w
use strict;


use Proc::UID;

#### AVOID THIS ERROR MESSAGE:
#### Insecure $ENV{PATH} while running with -T switch at testsuid.pl line 43.
$ENV{'PATH'} =~ /(.*)/;
$ENV{'PATH'} = $1;


print "whoami: ";
print `whoami`;
print "id: ";
print `id`;


my $uid = $<;
print "uid: $uid\n";
my $username = getpwuid($uid);
print "username: $username\n";
my $gid = getgrnam($username);
print "gid: $gid\n";

$ENV{'PATH'} =~ /(.*)/;
$ENV{'PATH'} = $1;

print `ls /p/NGS`;


THE SCRIPT'S OUTPUT DEMONSTRATES IT CAN ACCESS THE /q/solexa1 DIRECTORY:


[root@ngsdev cgi-bin]# /tmp/suid-apache.pl 
whoami: apache
id: uid=0(root) gid=0(root) euid=48(apache) egid=918(mihg-data-ngs) groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel)
uid: 0
username: root
gid: 0
080620_HWI-EAS185_0001_JIA_cDNA_JH
Instruments
syoung

[root@ngsdev cgi-bin]# ll /tmp/*suid*
-rwsr-sr-x 1 apache mihg-data-ngs 478 Oct  6 23:14 /tmp/suid-apache.pl
-rwsr-sr-x 1 apache mihg-data-ngs 478 Oct  6 23:18 /tmp/suid-syoung.pl
-rwsr-sr-x 1 apache mihg-data-ngs 465 Oct  6 23:09 /tmp/testsuid.pl


BUT IT FAILS TO ACCESS WHEN 'use Proc::UID' IS COMMENTED OUT:


bash-3.2$ /tmp/suid-apache.pl 
whoami: apache
id: uid=48(apache) gid=48(apache) groups=48(apache)
uid: 48
username: apache
gid: 48
ls: /p/NGS: Permission denied


SOLUTION

THE EFFECTIVE USER ID MUST BE SET AND MUST BE egid=918(mihg-data-ngs)




NB: USER syoung HAS THE FOLLOWING GROUPS:

[syoung@ngsdev ~]$ id
uid=1008(syoung) gid=1072(bioinfo) groups=669(mihg-data-core-external),702(mihg-data-vendor),710(mihg-core-external-pearlsoe),892(mihg-data-solexa),918(mihg-data-ngs),1046(mihgadm),1072(bioinfo),5603(mihg-data-q-solexa),14566(mihg-data-q-nextgen-full),14567(mihg-data-q-nextgen)


bash-3.2$ getfacl suid-apache.pl 
# file: suid-apache.pl
# owner: apache
# group: mihg-data-ngs
user::rwx
group::r-x
other::r-x


</entry>

<entry [Mon Oct  5 14:15:58 EDT 2009] COMMENT OUT DEBUGGING INFO>

/data/aqwa/0.3/bin/scripts/comment.pl \
--inputdir /data/aqwa/0.3/html/plugins/project \
--outputdir /data/aqwa/0.3/html/plugins/project \
--action comment \
--type js \
--recursive 


/data/aqwa/0.3/bin/scripts/comment.pl \
--inputdir /data/aqwa/0.3/html/plugins/admin \
--outputdir /data/aqwa/0.3/html/plugins/admin \
--action comment \
--type js \
--recursive 


/data/aqwa/0.3/bin/scripts/comment.pl \
--inputdir /data/aqwa/0.3/html/plugins/workflow \
--outputdir /data/aqwa/0.3/html/plugins/workflow \
--action comment \
--type js \
--recursive 



TEST 

/data/aqwa/0.3/bin/scripts/comment.pl \
--inputdir /data/aqwa/0.3-bkp/html/plugins/project-test \
--outputdir /data/aqwa/0.3-bkp/html/plugins/project-test-out \
--action comment \
--type js \
--recursive 






</entry>

<entry [Mon Oct  5 00:27:58 EDT 2009] ADD dojo.1.2.2 TO SVN:IGNORE LIST>


# ---------------------------------------------------------------------
#      Ignore all the .txt files in the /trunk/Blah/ directory
# ---------------------------------------------------------------------

# Go to the directory
cd trunk/Blah/              # The directory with the files

# Start editing the properties for the current directory
svn propedit svn:ignore .   # Opens an editor (SVN_EDITOR, EDITOR)

# Add the following value with a new line, save, and exit:
*.txt

# See that things worked
svn propget svn:ignore .    # So you can see the properties
svn status --no-ignore      # You should see an 'I' next to the ignored files

# Commit
svn commit -m "New Ignores" # You must commit the new property change


# ---------------------------------------------------------------------
#     Ignore a single file secret.txt in the /trunk/ directory
# ---------------------------------------------------------------------

# Go to the directory
cd trunk/

# Add just the single file to the current directories ignore list (like above)
# Note the dot at the end of the command is important
svn propset svn:ignore secret.txt .

# See that things worked
svn propget svn:ignore .    # Notice the single file was added to the list
svn status --no-ignore      # You should see an 'I' next to the ignored files

# Commit
svn commit -m "Its secret"  # You must commit the new property change


</entry>

<entry [Sun Oct  4 20:06:04 EDT 2009] CREATED SVN BACKUP WORKFLOW ON ngsdev BY EXPANDING svn.pl AND FileTools.pm>

/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins \
--repository file:///srv/svn/aqwa/trunk/html/plugins \
--message "First backup from real 0.3/html/plugins using svn.pl"


/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source conf \
--repository file:///srv/svn/aqwa/trunk/conf \
--message "First backup from real 0.3/conf using svn.pl"


/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html \
--repository file:///srv/svn/aqwa/trunk/html \
--message "First backup from real 0.3/html using svn.pl"


/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source bin \
--repository file:///srv/svn/aqwa/trunk/bin \
--message "First backup from real 0.3/bin using svn.pl"



PROBLEM

CAN'T SIMPLY COPY REPOSITORY FILES OVER:

	[root@ngsdev 0.3]# svn list file:///srv/svn/0.3
	svn: Unable to open an ra_local session to URL
	svn: Unable to open repository 'file:///srv/svn/0.3'
	svn: Expected FS format between '1' and '3'; found format '4'
	[root@ngsdev 0.3]# 


THEORETICALLY, COULD DO DUMP BUT REQUIRES DUMPING THE WHOLE DATABASE AND LOADING IT.
AND IN PRACTICE THE LOAD FAILS:

1. ON WINDOWS

svnadmin dump E:\svn\aqwa > E:\svn\aqwa.dump

	* Dumped revision 0.
	* Dumped revision 1.
	* Dumped revision 2.
	...
	* Dumped revision 38.
	* Dumped revision 39.

NB: 62 MB FILE

	
2. COPY OVER TO LINUX AND LOAD

/srv/svn/transit/aqwa.dump > svnadmin load file:///srv/svn/0.3

	[root@ngsdev transit]# /srv/svn/transit/aqwa.dump > svnadmin load file:///srv/svn/0.3
	/srv/svn/transit/aqwa.dump: line 1: SVN-fs-dump-format-version:: command not found
	/srv/svn/transit/aqwa.dump: line 3: UUID:: command not found
	/srv/svn/transit/aqwa.dump: line 5: Revision-number:: command not found
	/srv/svn/transit/aqwa.dump: line 6: Prop-content-length:: command not found
	/srv/svn/transit/aqwa.dump: line 7: Content-length:: command not found
	/srv/svn/transit/aqwa.dump: line 9: K: command not found
	/srv/svn/transit/aqwa.dump: line 10: svn:date: command not found
	...


SOLUTION

DO IT THE OLD-FASHIONED WAY BY ADDING AND DELETING FILES FROM THE REPOSITORY
USING A CHECKED-OUT WORKING DIRECTORY:
	

/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins/project \
--repository file:///srv/svn/aqwa/trunk/html/plugins/project \
--message "First backup from real 0.3/html/plugins/project using svn.pl"

/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins/workflow \
--repository file:///srv/svn/aqwa/trunk/html/plugins/workflow \
--message "First backup from real 0.3/html/plugins/workflow using svn.pl"


/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins/admin \
--repository file:///srv/svn/aqwa/trunk/html/plugins/admin \
--message "First backup from real 0.3/html/plugins/admin using svn.pl"


COPIED WHOLE PLUGINS DIRECTORY:

screen -S svn-backup
/data/aqwa/0.3/bin/scripts/svn.pl \
--mode backup \
--base /data/aqwa/0.3 \
--source html/plugins \
--repository file:///srv/svn/aqwa/trunk/html/plugins \
--message "First backup from real 0.3/html/plugins using svn.pl"

	...
	svn commit -m "First backup from real 0.3/html/plugins using svn.pl"
	svn cleanup /data/aqwa/0.3-svn/html/plugins
	svn update
	At revision 217.
	result: 1
	
	Run time: 00:02:10
	Completed /data/aqwa/0.3/bin/scripts/svn.pl
	11:56PM, 4 October 2009
	****************************************



ASSUMES WE HAVE ALREADY UPLOADED FILES TO CURRENT VERSION OF AQWA, E.G.:

/data/aqwa/0.3/html/plugins/project



1. GENERATE THESE VARIABLES

sourcedir /data/aqwa/0.3/html/plugins/project
transitdir /data/aqwa/0.3transit/html/plugins/project
workingdir /data/aqwa/0.3svn/html/plugins/project
repository file:///srv/svn/aqwa/trunk/html/plugins/project

2. TRANSFER ALL FILES TO TRANSIT DIRECTORY

mkdir -p /data/aqwa/0.3transit/html/plugins/project
cp -r /data/aqwa/0.3/html/plugins/project/* /data/aqwa/0.3transit/html/plugins/project



3. CLEAN OUT .svn FROM TRANSIT DIRECTORY

/data/aqwa/0.3/bin/scripts/svn.pl --mode clean --workingdir /data/aqwa/0.3transit/trunk/html/plugins/project 



4. CHECKOUT REPOSITORY FILES INTO SVN WORKING DIRECTORY

mkdir -p /data/aqwa/0.3svn/html/plugins/project
cd /data/aqwa/0.3svn/html/plugins/project
svn checkout file:///srv/svn/aqwa/trunk/html/plugins/project ./



5. EMPTY CHECKED OUT WORKING DIRECTORY LEAVING ONLY .svn FOLDERS

/data/aqwa/0.3/bin/scripts/svn.pl --mode empty --workingdir /data/aqwa/0.3svn/html/plugins/project 



6. COPY CLEANED FILESYSTEM OVER TO EMPTY (.svn ONLY) WORKING DIRECTORY

cp -r /data/aqwa/0.3transit/html/plugins/project/* /data/aqwa/0.3svn/html/plugins/project



7. SYNCHRONISE TO MERGE THE NEW FILESYSTEM INTO THE REPOSITORY 

/data/aqwa/0.3/bin/scripts/svn.pl --mode sync --workingdir /data/aqwa/0.3svn/trunk/html/plugins/project --repository file:///srv/svn/aqwa/trunk/html/plugins/project




</entry>

<entry [Thurs Oct 1 17:19:41 EDT 2009] IBM - Writing a custom Dojo application>

Error handling
Like Java code, JavaScript does have exception handling, which we recommend using for your error handling.
The try/catch handling in JavaScript, as shown in Listing 3, is much like Java code. You can see a stack trace in the exception object.

Listing 3. Try/catch handling
try {
     // your logic
}catch(e){
     // error handling
}

Exceptions can be thrown from a method in JavaScript, much like Java programming.

Listing 4. Exception thrown
if( <test for error condition> ) throw "meaningful error message";



http://www.ibm.com/developerworks/library/wa-aj-custom20/index.html
Writing a custom Dojo application

Introduction
We recently completed the development of a Web 2.0 Dojo prototype. The prototype was extensive, exposing a new function for Information Management. We worked with a user experience team to help ensure the application was usable. The screens were designed by a graphical Web designer, for a professional look and feel.

This article documents our experience with the Web 2.0 development of this prototype. Because Web 2.0 is relatively new, it can be difficult to get started or know how to do customizations when the need arises. We did not deliver an out-of-the-box look and feel with our Dojo application. We needed a graphic design that was consistent with the branding of our product line. So, we had to do customizations with Dojo. Customizations are where most developers end up spending a lot of time, especially if they don't know exactly how to tackle this problem.
Because this article focuses on the customization of a Dojo application, we do not describe the details of every widget attribute needed or shown in the examples. Having a basic knowledge of Dojo and CSS is assumed. The examples in this article are based on Dojo 1.1.0 (see Resources for a link).

...

Conclusion
In general, we found that the learning curve to start Dojo development was minimal, with help from a large set of samples available in the Dojo toolkit and from the community surrounding Dojo, along with a plethora of JavaScript information on the Internet. But as Java developers, we missed strong IDE support, good API documentation, lack of strong typing, different runtime behavior per Web browser differences, and compile time checking with JavaScript development. Learning how to do customizations were sometimes painful, and often a trial and error process. However, after we learned the processes, they were repeatable. The end result of our prototype was a professional-looking application, with all the performance benefits expected from an Ajax-enabled Web application.



CSS STYLING


ROUNDED BOXES

Works for Mozilla/Firefox and Safari:
These different corners can also each be handled on their own, Mozilla has other names for the feature than the spec says it should have though, as it has f.i. -moz-border-radius-topright as opposed to -webkit-border-top-right-radius:
-moz-border-radius-topleft / -webkit-border-top-left-radius
-moz-border-radius-topright / -webkit-border-top-right-radius
-moz-border-radius-bottomleft / -webkit-border-bottom-left-radius
-moz-border-radius-bottomright / -webkit-border-bottom-right-radius




Customizing the Dojo app
We looked at several JavaScript frameworks, and while we actually wanted a framework that was a bit higher level than Dojo, it had all the right building blocks, customization points, and a large community of support.
How to customize
So, we decided to use Dojo, but to customize it, and there are many aspects to this process. The simplest way to customize the look and feel of Dojo widgets is with the use of custom style sheets (CSS). You can also override a Dojo widget method, subclass an existing Dojo widget for special behavior, or create your own widget. In this section, we describe a variety of customizations used by this prototype.
Note: This list represents a subset of what was actually developed for our application. Many additional customizations not included in this article are currently in the Intellectual Property (IP) process.
Restyling Dojo widgets
Dojo has three basic skins that can be used out of the box: soria, tundra, and nihilo. These skins can also be used as a base by specifying it in the class attribute of your application's overall HTML body tag. Then you can override the styles you choose with your own CSS. You could also write all your CSS from scratch; however, this process is time consuming if your application uses a lot of widgets. To view the Dojo widgets with the predefined skins, you can run the Dijit Theme Tester, which is located in <dojo_home>/dijit/themes/themeTester.html, where <dojo_home> is the directory where you downloaded the Dojo source code.
The templates for the Dojo widgets contain class attributes that can be used in defining custom style sheets, but we have not found these style names documented anywhere. In order to find the class names for the widgets, we found two ways helpful. The first method is to look at the template .html file associated with the widget. The template file for the dijit.form.Button widget looks like Listing 7.

Listing 7. Template for dijit.form.Button widget
<div class="dijit dijitReset dijitLeft dijitInline"
    dojoAttachEvent="onclick:_onButtonClick,onmouseenter:_onMouse,onmouseleave:
  _onMouse,onmousedown:_onMouse"
    waiRole="presentation"
    ><button class="dijitReset dijitStretch dijitButtonNode 
dijitButtonContents" dojoAttachPoint="focusNode,titleNode"
        type="${type}" waiRole="button" waiState="labelledby-${id}_label"
        ><span class="dijitReset dijitInline ${iconClass}" dojoAttachPoint="iconNode" 
             ><span class="dijitReset dijitToggleButtonIconChar">?</span 
        ></span
        ><div class="dijitReset dijitInline"><center class="dijitReset dijitButtonText"
id="${id}_label" dojoAttachPoint="containerNode">${label}</center></div
    ></button
></div>

For styling you would be concerned with the values for the class attributes of the template. Class values surrounded by ${}, like ${iconClass}, are replaced with the value of the iconClass attribute that was specified in the Button tag.
In the above example, dijitButtonText is used to style the text displayed in the button. So, if you wanted the text to be blue, you would include the following code in your style sheet:

Listing 8. Code to turn button text blue
.dijitButtonText
{
   color: blue;
}

You can be more specific and qualify the style even further. This is good in case this class name is used for other widgets as well. For example, .dijitButtonText is also used in ComboButton and DropdownButton templates. So, with the CSS example given above, all of those controls will have blue text. The JavaScript files for these controls contain a baseClass attribute that is used at the outermost layer and can be used to distinguish between them in your CSS. The baseClass for Button is dijitButton, while the baseClass for the other two are dijitComboButton and dijitDropDownButton, respectively. If you only want the regular button to have blue text, then the CSS would look like Listing 9.

Listing 9. Code for regular button to have blue text
.dijitButton .dijitButtonText
{ 
   color: blue;
}

If you are using a Dojo skin as a base, we recommend adding .soria to the front of that line, and possibly even add more levels, like .dijitButtonNode. This is because if the same CSS class is used in two different files, it may use the one you are not expecting; it will use the one that is more qualified. You can see how this calculation is done in section 6.4.3 of the CSS specification (see Resources). You can also force it to be used by adding the CSS !important qualification (explained in section 6.4.2 of the specification).
When using various skins and styles, it sometimes becomes difficult to keep track of which style definition will be used for a particular class. This is where Firebug comes in very handy. To open up the Firebug console while on a Web page, click on the icon on the lower left corner of the browser window. There is an HTML tab on the left side of the Firebug console that shows the HTML code being displayed on the screen, including the class attributes. If you click on the HTML tag, the associated CSS that affected this tag is displayed on the right side, under the Style tab. If the same class attribute was defined several times in the code, it will show you all the definitions and which ones were overridden and which are being used. If you want to see the styling for a particular area on the screen, click Inspect in the Firebug toolbar, and then click on the area/widget on the screen. This takes you to the HTML code responsible for that area and displays its associated CSS on the right.
Figure 1 shows the inspection of the Create button of the soria theme in the Dijit Theme Tester. (For a larger view, click here.) In Firebug, you can see that the padding style specified in dijits.css was overridden by the padding style specified in soria.css, which was further qualified by .soria .dijitButtonNode instead of just .dijitButtonNode.

Figure 1. Default Dojo style for our application
 
We ran into some limitations using Dojo's base widgets. One limitation is the ability to add rounded corners to certain widgets. It is possible to have rounded corners using Mozilla-specific CSS styles, but this forces you to have a solid color background, and it only works for Mozilla Firefox. So you might not be able to have a rounded gradient image for the background of your control unless it is a fixed-size image, which is unrealistic in the case of buttons and title bars where the text contained in them is variable or they need to take up a percentage of the screen as opposed to a fixed width and height.
Dojo does provide this capability with some widgets though, like the dijit.form.Button. Dojo's template contains <div> elements with class attributes of dijitLeft and dijitRight, which can be used to show the rounded left side image and the rounded right side image, respectively. Note that the dijitRight attribute was removed from the template in the initial version of 1.1.0, so it is not shown in the Button's template example that we display above; however, this has been fixed. If you find cases like this, where the fix may be critical for your application, you can get the modified files from the nightly builds (see the Dojo toolkit link in Resources).

Figure 2 shows an early look of our application using the Dojo soria theme out of the box.

Figure 2. Default Dojo style for our application
 
Figure 3 shows the final look of our application with styling customizations. (Click here to see a larger image.)

Figure 3. Custom Dojo style for our application







</entry>

<entry [Wed Sep 30 17:19:41 EDT 2009] FIX LOGIN CSS AND GIVE ROUNDED EDGES TO SOURCES FLOATING PANE>


Something about compression

http://weierophinney.net/matthew/archives/188-Proper-Layer-files-when-using-Dojo-with-Zend-Framework.html


</entry>

<entry [Wed Sep 30 17:19:41 EDT 2009] FIX LOGIN CSS AND GIVE ROUNDED EDGES TO SOURCES FLOATING PANE>

USE .login NAMESPACE FOR WIDGET ?

http://www.dojotoolkit.org/pipermail/dojo-interest/2007-May/028784.html

What you need to do is modify the src/widget/templates/FloatingPane.css file
and put your own images in there.

Alternatively, for FF, you can use the -moz-border-radius-topleft,
-moz-border-radius-topright, -moz-border-radius-bottomright,
-moz-border-radius-bottomleft properties.
'


DOJO THEMEARAMA
http://archive.dojotoolkit.org/nightly/dojotoolkit/dijit/themes/themeTester.html




DOJO CSS DISCUSSION

http://markmail.org/message/3qvdwfoiaxstdjev


Subject:	[dojo-contributors] CSS techniques for dojox themes	Actions...
From:	Tom Trenka (ttre...@gmail.com)
Date:	Jul 16, 2008 8:42:27 am
List:	org.dojotoolkit.dojo-contributors
This seems reasonable on the surface; I'd want to add the following as
well (or something to this effect):

- There *MAY* be an additional JS file aimed at the build system,
included within the resources directory, that defines how a bundle
should be treated when doing custom builds.  This additional file
(naming convention TBD) is only required when a DojoX bundle/project
is to be considered for production status.

--- Other Modifications
Some of the things you define here are definitely correct, but we
allow for some flexibility based on where the project/bundle author
feels the state of the project is.  To reiterate on that one:

1. Experimental: nothing is really required.
2. Alpha: unit tests are required (though they may not pass).
3. Beta: unit tests that pass and inline documentation are required.
4. Production: unit tests, inline docs, and the build profiles are
required; i18ln and/or a11y need to be working in full if either is to
be supported.



Make sense?

trt

On Wed, Jul 16, 2008 at 10:31 AM, Nathan Toone
<toonetown at dojotoolkit.org> wrote:
Like Sam, a lot of this is thinking as I go...so please bear with me.
Let me start by saying that I really like the approach that you guys have
outlined.  As Nikolai mentioned, however, there is still one question
remaining -  how to deal with widget-specific css in addition to
theme-specific css.  Permit me to expand on the suggestion a bit (and
hopefully, in the process standardize some of the ways we handle dojox
projects).
There are (currently) two different approaches to structuring the files in
dojox (as far as I can see).  *Most* of the css in dojox is under a
resources directory.  dojox.widget is the only exception I see - which has
widget-specific resources in separate (per-widget) directories.
So - there is, for example:
  dojox/image/resources/Badge.css
  dojox/image/resources/Gallery.css
  dojox/image/resources/Lightbox.css
  etc.

and in dojox.widget (the exception)
  dojox/widget/Calendar/Calendar.css
  dojox/widget/ColorPicker/ColorPicker.css
  dojox/widget/Dialog/Dialog.css

My first suggestion would be to make dojox.widget be more in-line with the
other dojox projects in terms of how it is structured.  I think that the
idea of per-widget resources directories is nice on the surface - but I'm
not too sure of the benefit we get by adding yet another layer.  Basically,
dojox/widget seems to be analogous to a "top-level" namespace - such as
dojox - where each sub-widget has its own dependencies, etc.
We have some well-defined requirements for dojox projects - need a README,
tests, etc...but if we keep each subwidget in dojox/widget separate and
standalone, it seems we should apply the same requirements for each
dojox/widget subwidget.  It seems it would simplify things as well.
For example, we could define that a dojox "bundle" contains *at least* the
following files and directories (using a "foo" widget as an example):
  dojox/foo/  <- bundle directory
  README              <- Readme file for the widget
    DEPENDENCIES        <- text file listing additional bundle dependencies
(optional)
  Foo.js              <- Main javascript file for this widget
    Bar.js              <- Additional public classes as needed (optional)
    _Bar.js             <- Additional private classes as needed (optional)
  resources/          <- directory for templates, etc (optional)
      Foo.html          <- template file for Foo class (optional)
      Foo.css           <- "Rollup" css file - just has a bunch of @import
rules (optional)
    themes/             <- directory for theme-specific css files (optional)
      Foo.css           <- Main, "functional" css - analogous to dijit.css
      Bar.css           <- Additional "functional" css as needed (optional)
      nihilo/           <- nihilo files (required if you have theme-specific
css)
        Foo.css         <- nihilo-specific css
        Bar.css         <- Additional nihilo-specific css
      soria/            <- soria files (required if you have theme-specific
css)
        Foo.css         <- soria-specific css
        Bar.css         <- Additional soria-specific css
      tundra/           <- tundra files (required if you have theme-specific
css)
        Foo.css         <- tundra-specific css
        Bar.css         <- Additional tundra-specific css
  tests/              <- directory for test cases
      test_Foo.html     <- main test case for this widget
      test_Bar.html     <- Additional tests as desired (optional)
    demos/              <- directory for demos (optional)
      demo_Foo.html     <- main demo file for this widget
  nls/                <- translation files (optional)
      Foo.js            <- Files and directories follow the nls "standard"
A couple of things about this structure.  There is no reason why a "bundle"
should exist directly under dojox - for example, we could have various
subwidget "bundles" inside of dojox/widget - the only difference would be
the top-level would be something like dojox/widget/foo/ - but all other
structure matches.
I would say that the definition and rules for a dojox bundle should be
mostly the same:
- A dojox "bundle" is a group of related files.  It is represented on-disk
as a directory, either directly within the dojox namespace or within a
"grouping" namespace (such as dojox.widget).
- There *MUST* be a README file per-bundle in the bundle directory.
- There *MAY* be a DEPENDENCIES file per-bundle that lists other bundles
that are depended upon.  Use dot-notation, one per line - ie:
        dojo
        dijit
        dojox.widget.colorpicker
        dojox.html
- There *MUST* be a tests directory in the bundle directory with at least
one unit test (preferably more).
- If the bundle is localaized, there *MUST* be a nls directory in the bundle
directory
- There *MAY* be a demos directory within the bundle directory with demo
files
- There *MAY* be a resources directory within the bundle directory with
templates and additional files
- If the bundle needs external templates, those templates *MUST* reside in
the resources directory
- There *MAY* be a themes directory within the bundle directory if the
bundle needs styling
- If the bundle needs styling, a css file named <BUNDLENAME>.css *MUST*
reside in the themes directory
- If the bundle needs theme-specific styling, then there *MUST* be
directories for nihilo, soria, and tundra within the themes directory.
- If desired, there *MAY* be a "rollup" css file named <BUNDLENAME>.css
which resides in the resources directory.  This file would just contain
@import statements that point to the needed css files in the themes
directory.  It exists to provide the developer with a quick-and-dirty single
file to import to grab all needed themes
- Additional files can be placed as makes sense on a per-bundle basis.
Following these rules gives us some benefits.  It make it clear *which*
files are required if someone wants to roll their own stuff - they can take
bundles a-la-carte.  A script (or the build process) could copy the files as
desired based on the DEPENDENCIES file.  And it standardizes theme
locations.  In addition, there aren't many projects that this change would
affect - dojox.widget is probably the most-affected.  We would also need to
discuss whether dojox.widget is a "bundle", or whether the individual
widgets are individual "bundles".  (The same discussion should probably take
place for dojox.form...and possibly others)
If this is an appropriate proposal, I will plan on getting dojox.Grid
structured this way as well.  (Grid actually needs some css love for 1.2
anyway).  If we want to get this in before 1.2 is cut, I could also try and
work on the stuff in dojox.widget and dojox.form - since those are the
projects that I'm more familiar with.
I'm open to suggestions.  By no means do I think that this is the "only" way
of doing it - and it's probably not the "best" either.  I'd like to get it
worked out sooner, rather than later, however - so that I can get working on
some of the changes we need for the grid.
-Nathan

On Jul 16, 2008, at 7:56 AM, Tom Trenka wrote:

+3 on this.  I will talk with Adam a bit and see where to go from
there on it but I entirely agree with your suggestion--to the point
that I'd consider asking for it to be done before 1.2 is cut.

trt

On Wed, Jul 16, 2008 at 3:49 AM, sam foster <potatosculptor at gmail.com>
wrote:

(excuse me while I think aloud - I do arrive at a suggestion eventually)
It seems to me the problem is a disconnect between structuring our
file resources by namespace rather than by how they are used.
So themes currently live in "dijit", but dojox now contains lots of
dijit extensions. In practice the distinction btween dijit and dojox
is an artificial one when it comes to using widgets in a project. They
all follow dijit conventions, use the dijit theme "system", rely on
dijit.css. Ideally, you'd be able to squish all the css - dijit.css +
the theme css that you are actually using (dijit or dojox) into one
file for production use.
Really ideally the dependency resolution during a build would be
automatic and pretty granular - but we shouldnt assume that our build
system is the only way to optimize - its trivial to concatentate css
into one file/response.
There's no reason I can think of why we shouldnt have a themes area in
dojox - for experimental, or specific-use themes. And we expect
developers to extend and hack on the themes in their own directories.
We have to balance opposing forces in OOTB experience, scalability,
widget developer effort vs. dojo user effort. For widget authors, its
already a stretch to expect them to provide the css for 3 themes. For
theme developers, its a stretch to theme all of dijit, as well as all
the dojox widgets. For end-users, they dont want to download a load of
css that's never used.
Perhaps each dojox subproject should have its own theme directory
where applicable? This keeps parity with dijit (which is equivalent to
e.g. dojox.widget - NOT dojox)
I definately think we shouldnt optimize too early. I'd much rather
have a logical file structure that mirrors what we already do in dijit
- and use "roll-up" files that @import a bunch of files - over having
big long css files that lump together rules for widgets that may not
be in use. We could have examples that show how you can replace the
css roll-up files with php/jsp/etc. to reduce the http overhead of
requesting all those files
So:

dojox/

  widget/

    themes/

      widget.css <-- theme-agnostic common code

      tundra/

        Calendar.css <-- specific-theme rules for the dojox Calendar

widget, if any

        Dialog.css

        etc.

        widget-all.css <-- roll-up using @imports to pull in all css

in this subproject, for this theme

      soria/

        etc.

      nihilo/

        etc.

  form/

    themes/

      form.css <-- theme-agnostic common code

      tundra/

        CheckedMultiSelect.css

        DropDownSelect.css

        FileInput.css

        etc.

        form-all.css <-- roll-up using @imports to pull in all css

in this subproject, for this theme

      soria/

        etc.

      nihilo/

        etc.

Whaddya think?

Sam

On Tue, Jul 15, 2008 at 9:21 PM, Nathan Toone <toonetown at dojotoolkit.org>
wrote:

In regards to clarity, I think it is on us to clearly define the

standard for themeing. What would be wrong about saying that each

dojox widget which needs a theme has to provide it as follows:

dojox/form//FormSelect.js <- widget

dojox/form//themes/tundra/FormSelect.css <- theme

dojox/form//themes/myowntheme/FormSelect.css <- theme

I really like taking this approach - it closely mirrors what dijit

does, and I'm a big fan of consistency... :)

The only potential issue I could see with this approach would be that

many of the widgets in dojox are quite simple - and would only have

one or two theme-specific css rules...which could end up with some

pretty big file bloat.  Granted, the build process resovles this - but

it might be a bit easier to digest as a developer if it were a bit

simpler.

Also - each widget would most likely only have a single CSS file

inside the theme...what about something like:

dojox/form/resources/FormSelect.css <- shared css

dojox/form/resources/tundra_FormSelect.css <- theme

dojox/form/resources/myowntheme_FormSelect.css <- theme

-Nathan

_______________________________________________

dojo-contributors mailing list

dojo-contributors at dojotoolkit.org

http://turtle.dojotoolkit.org/mailman/listinfo/dojo-contributors




</entry>

<entry [Fri Sep 25 13:38:09 EDT 2009] SET UP REFERENCE SEQUENCE DATA IN /nethome/bioinfo/data/sequence>


THIS IS ACCESSIBLE TO ALL USERS (NOT JUST HIHG USERS)

/nethome/bioinfo/data/sequence/ 
                            |
                            |
                            cdna----------+
                            |              human-bfa---+
                            |              |              embl
                            |              |              ncbi
                            |              human-fa----+
                            |              |              embl
                            |              |              ncbi
                            |              |
                            |              human-sq----+
                            |                          ...
                            |
                            chromosomes--+
                            |              human-bfa---+
                            |              |              chr1.bfa
                            |              |              chr2.bfa
                            |              |              ...
                            |              |
                            |              human-fa
                            |              human-sq
                            |
                            |
                            genomes
                            |              human-bfa---+
                            |              |              chr1.bfa
                            |              |              chr2.bfa
                            |              |              ...
                            |              |
                            |              human-fa
                            |              human-sq
                            |
                            mtdna---------+
                                          ...


CONVERT TO .bfa

/nethome/syoung/base/apps/maq/0.7.1/maq fasta2bfa /nethome/bioinfo/data/sequence/mtdna/human-mtdna-fa/human-mtDNA-AC_000021.fasta /nethome/bioinfo/data/sequence/mtdna/human-mtdna-fa/human-mtDNA-AC_000021.bfa


/nethome/syoung/base/apps/maq/0.7.1/maq fasta2bfa /nethome/bioinfo/data/sequence/cdna/human-bfa/embl/Homo_sapiens.NCBI36.49.cdna.known.fa /nethome/bioinfo/data/sequence/cdna/human-fa/embl/Homo_sapiens.NCBI36.49.cdna.known.bfa



/nethome/syoung/base/apps/maq/0.7.1/maq fasta2bfa /nethome/bioinfo/data/sequence/cdna/human-fa/ncbi/1_refSeq_cDNA.fa /nethome/bioinfo/data/sequence/cdna/human-bfa/ncbi/1_refSeq_cDNA.bfa



/nethome/syoung/base/apps/maq/0.7.1/maq fasta2bfa /nethome/bioinfo/data/sequence/genomes/human-fa/genome.fa /nethome/bioinfo/data/sequence/genomes/human-bfa/genome.bfa







</entry>

<entry [Fri Sep 25 13:38:09 EDT 2009] RESIZE AQWA LAYOUT COMPONENTS AND LOCATION OF CSS FILES>

MAIN TABS

plugins/core/Controls.js

line 16:

	layout : {
		widgetType: "dijit.layout.LayoutContainer",
		params: {id: "controlButtonsContainer", style:'height: auto; minWidth:950px;'},
		children:
		[
			{
				widgetType: "dijit.Toolbar",
				params: { id: "controlButtons", orientation: "horizontal"},
				style: "width: 95%;"
			},
			{
				widgetType: "dijit.layout.TabContainer",
				params: {id: "tabs", style: 'position: relative; top: 130px; left: 20px; height: 500px; width: 850px;'}
			}
		]
	},


LINE 75:

		var thisResizer = new dojox.layout.ResizeHandle({
			targetId: "tabs",
			activeResize: true,
			minHeight: "100px",
			minWidth: "600px"
		},resizeHandle);



PROJECT FILE DRAG CSS IS LOCATED HERE:

Project.loadCSS() : plugins/project/FileDrag/FileDrag.css

MOVED FROM HERE:

_GroupDragPane.postCreate()





</entry>

<entry [Fri Sep 25 13:38:09 EDT 2009] AQWA DATA SOURCE LOCATIONS>

Human chromosome FASTA (36.1)	fasta	Human chromosome FASTA files (Build 36.1)	/p/NGS/syoung/base/pipeline/human-chr-fa	
MAQ human genome (36.1)	binaryFasta	A single human genome file in MAQ .bfa binary format (compressed), generated from a multi-FASTA file with one FASTA record per chromosome (Build 36.1)	/p/NGS/syoung/base/pipeline/human-genome-bfa	
MAQ human chromosomes (36.1)	binaryFasta	Human chromosomes in MAQ .bfa binary format (compressed), generated from single-chromosome FASTA files (Build 36.1)	/p/NGS/syoung/base/pipeline/human-chr-bfa	
Eland squashed human chromosomes (36.1)	squashed	A directory containing human chromosome sequence files processed with squashGenome for input into Eland(Build 36.1)	/p/NGS/syoung/base/pipeline/human-chr-squashed	
Solexa archive	solexa	Archive of all solexa NGS runs	/p/solexa	
Demo data	general	Demo input and output data files	/p/NGS/syoung/base/pipeline/aqwademo



LATER:

1. MOVE THESE TO /q/refSeq OR /nethome/bioinfo/data

2. MAKE SURE PERMISSIONS WORK IN /p/data/solexa,

	i.e., project.cgi DOES chgrp mihg-data-solexa ON project.pl




</entry>

<entry [Thurs Sep 24 23:52:41 EDT 2009] DISABLE ROOT AND OTHER SSH LOGINS ON ngsdev>


1. Check out man sshd_config 

2. Use either the AllowUsers or DenyUsers directives in /etc/ssh/sshd_config.

3. Also use: PermitRootLogin no 



</entry>

<entry [Wed Sep 23 23:52:41 EDT 2009] CAN'T FIX SETUID ON BSD>

TRIED CHANGING THE ORDER OF SETTING THE NEW REAL AND EFFECTIVE UIDS AND GIDS

https://issues.apache.org/SpamAssassin/show_bug.cgi?id=4086
Arkadi      2005-02-06 08:59:15 PST

Same problem on FreeBSD. BSD setuid/seteuid differs from Linux implementation.
spamd must be patched to perform setuid calls in different order.
idea(p1)root:/home/arkadi/build> cat test-setuid.pl
#!/usr/bin/perl
$( = 2030;
$) = "2030 2030";
$< = 2030;
$> = 2030;
print `/usr/bin/id`;
idea(p1)root:/home/arkadi/build> ./test-setuid.pl
uid=2030(pkadmin) gid=2030(pkadmin) groups=2030(pkadmin)
idea(p1)root:/home/arkadi/build> cat test-setuid-bad.pl
#!/usr/bin/perl
$) = "2030 2030";
$( = 2030;
$> = 2030;
$< = 2030;
print `/usr/bin/id`;
idea(p1)root:/home/arkadi/build> ./test-setuid-bad.pl
uid=0(root) euid=2030(pkadmin) gid=2030(pkadmin) groups=2030(pkadmin)
idea(p1)root:/home/arkadi/build> uname -r
4.9-RELEASE-p3

Both test cases works fine on Linux, so there should be no problem.




</entry>

<entry [Wed Sep 23 23:12:41 EDT 2009] ngsdev CGI BIN PERMISSIONS (WORKING)>

total 240K
drwxr-xr-x  5 syoung apache           4.0K Sep 21 00:19 .
drwxr-xr-x 11 syoung apache           4.0K Aug 13 01:16 ..
-rwsr-sr-x  1 root   bioinfo          6.5K Aug 23 03:49 admin.cgi
-rwxr-xr-x  1 syoung bioinfo          6.0K Aug 23 23:12 admin.pl
lrwxrwxrwx  1 syoung apache             19 Jun 30 02:14 conf -> /data/aqwa/0.3/conf
-rwsr-sr-x  1 root   bioinfo           12K Jul 16 17:08 download.cgi
-rw-r--r--  1 syoung bioinfo             9 Aug 14 23:05 dummy.pl
-rwxr-xr-x  1 syoung bioinfo           107 Jul 23 06:58 execute.bat
-rwsr-sr-x  1 syoung mihg-data-solexa 6.2K Jul 14 16:41 file.pl
-rwsr-sr-x  1 root   bioinfo           586 Dec 17  2008 ldap.cgi
lrwxrwxrwx  1 syoung apache             18 Jun 30 02:14 lib -> /data/aqwa/0.3/lib
-rw-rw-rw-  1 apache apache              0 Aug 26 05:57 log.txt
-rwsr-sr-x  1 root   bioinfo          4.5K Aug 22 23:20 msubMaster.pl
-rwsr-sr-x  1 syoung mihg-data-solexa 7.2K Jul 14 16:21 msub.pl
-rwsr-sr-x  1 syoung mihg-data-solexa 7.2K Aug 22 23:23 msubrelay.pl
-rwxr-xr-x  1 syoung bioinfo           457 Jul 23 06:31 out
-rwsr-sr-x  1 root   bioinfo          9.3K Sep 21 00:19 project.cgi
-rwsr-sr-x  1 root   root             9.3K Aug 26 12:29 project.cgi~
-rwsr-sr-x  1 root   bioinfo          4.9K Jul 22 01:22 projectMaster.cgi
-rwxr-xr-x  1 syoung bioinfo          4.9K Aug 23 23:14 project.pl
-rwsr-sr-x  1 syoung bioinfo          2.7K Aug 23 01:45 putrelay.pl
-rwxr-xr-x  1 syoung mihg-data-solexa 3.0K Jul 13 00:20 qsub.pl
-rwsr-sr-x  1 syoung mihg-data-ngs    2.8K Aug 14 23:56 relay.pl
-rwsr-sr-x  1 root   bioinfo          6.5K Apr 30 20:15 report.cgi
-rwxr-xr-x  1 syoung bioinfo            55 Jul 12 21:50 runsleep.sh
-rwxr-xr-x  1 syoung bioinfo             0 Jul 24 00:51 stdout.txt
drwxr-xr-x  3 syoung apache            12K Sep  9 16:53 t
drwx------  2 syoung bioinfo          4.0K Jul 12 21:54 test
-rwxr-xr-x  1 syoung bioinfo           440 Aug 14 23:20 testchgrp.pl
-rwxrwxr-x  1 syoung bioinfo          2.3K Aug 16 22:24 testjson.pl
-rwxr-xr-x  1 syoung bioinfo          3.1K Jul 12 22:40 testsuid.pl
-rwxr-xr-x  1 syoung bioinfo           14K Aug 19 04:25 upload.cgi
drwxrwxr-x  2 syoung apache           4.0K Aug 19 04:28 uploads
-rwsr-sr-x  1 root   bioinfo          6.7K Sep 20 23:28 workflow.cgi
-rwsr-sr-x  1 root   root             6.7K Aug 23 01:50 workflow.cgi~
-rwsr-sr-x  1 root   bioinfo          4.3K Jul 23 03:13 workflowMaster.cgi
-rwxr-xr-x  1 syoung bioinfo          5.5K Sep 20 23:48 workflow.pl
-rwxr-xr-x  1 syoung bioinfo          5.5K Sep 20 23:27 workflow.pl~
-rwxr-xr-x  1 syoung bioinfo           135 Jul 24 12:04 workflow-temp.json


</entry>

<entry [Mon Sept 21 01:51:33 EDT 2009] TO DO LIST>

TRANSFERRED TO TRAC Wed Sep 30 14:21:45 EDT 2009


WORKFLOW

- fix FileManager loss of callback with dojo.hitch -- DONE Sun 27 Sept

http://dojocampus.org/content/2008/03/15/jammastergoat-dojohitch/
http://books.google.com/books?id=PgK1GbyiiDUC&pg=PA87&lpg=PA87&dq=dojo+callback+function&source=bl&ots=6mtO6BE3rL&sig=xRFCvlVGpIySzvn0mTTiF13rvmU&hl=en&ei=Mw7ASrq4BMfi8Qax9cjBAQ&sa=X&oi=book_result&ct=result&resnum=9#v=onepage&q=dojo%20callback%20function&f=false

- add 'outputs' TitlePane	--	DONE Tues 22 Sept

- download output file from outputs TitlePane -- DONE Sun 27 Sept
http://www.dojotoolkit.org/forum/dojo-core-dojo-0-9/dojo-core-support/using-dojo-io-iframe-send-download-file-attachment-has-pr


- download output files in File Manager (selected) -- DONE Sun 27 Sept


- fix DnD of Project.js
http://www.dojotoolkit.org/book/export/html/1593

- fix Dnd of FileManager.js  - DONE Mon 28 Sept.
	TO DO: Fix file images and reload of dropped empty folder.


- configure clusterMAQ.pl -- DONE
- configure image2eland.pl -- DONE


- configure clusterELAND.pl
- configure clusterCASAVA.pl


- fix upload (broken due to Flash version?)  
http://ngsdev.ccs.miami.edu/aqwa/trunk/0.3/dojo.1.2.2/dojox/form/tests/test_FileInput.html
http://www.dojotoolkit.org/book/dojo-book-0-9/part-3-programmatic-dijit-and-dojo/manipulating-widgets-through-code/writing-yo-0

Used widget's _onBlur
http://trac.dojotoolkit.org/ticket/5327

- configure updateStatus polling and CSS for status

{"username":"syoung","sessionId":"1254802962.4892.523","project":"Project1","runNumber":"","workflow":"Workflow1","mode":"runStatus","start":0}	

{ error: 'No applications with run status for username: syoung, project: Project1, workflow: Workflow1 from start: 0' }


- TO DO:

	SORTING OF HASHES
	http://js.antinoc.net/?q=node/3



DELETE PROJECT FROM groupusers TABLE WHEN DELETED IN Workflow.js


( WISH LIST:

	- store old jobs in 'stagearchive' table

	- add 'Notes' for Workflow

	- complete 'copyWorkflow' subroutine in Common.pm
		- copy files
		- copy workflow in project table
)



PROJECT

- allow users to view 'Shared' projects (Workflow::getFolders)




ADMIN

- generate 'etcgroup' table	- DONE Tues 22 Sept

DONE (Tues 22 Sept)  perl parseEtcGroup.pl --inputfile E:/base/pipeline/etc/group --outputfile E:/base/pipeline/etc/group.bsv
DONE (Tues 22 Sept)   perl loader.pl --sqlfile E:/aqwa/bin/sql/etcgroup.sql --bsvfile E:/base/pipeline/etc/group.bsv --dbfile E:/aqwa/bin/db/data.dbl

- redo 'Groups' based on 'Sources', with 'etcgroup' table

- fix Login so that it shows with CSS styling
Fixed Login.loadCSS() method by removing this line:

cssNode.title = 'loginCSS';

Also added 'modal: true' in params for dojox.widget.Dialog, taken from here:

http://api.dojotoolkit.org/jsdoc/1.3.2/dojox.widget.Dialog



REPORT

fix CSS for grid




VIEW

Generate human genome files



aqwa.html

SEE IF E:\aqwa\html\builds\plugins\dojo\dojo\dojo.js WILL SUFFICE




</entry>

<entry [Sun Aug 23 01:51:33 EDT 2009] FIXED PROBLEM: PROJECT NUMBER AND WORKFLOW NUMBER WERE FIXED TO 1 and 7>

PROBLEM

	WAS SET AS SO IN Workflow::saveWorkflow FOR DEBUGGING BUT ACCIDENTALLY LEFT IN THER SO\
	THE WORKLOW NUMBERS ARE NON-UNIQUE.

DIAGNOSIS

	sqlite> select projectnumber, workflownumber from project where username = 'syoung' and project = 'Project1' and workflow = 'Workflow1';
	1       8
	sqlite> select username, project, projectnumber, workflow, workflownumber from project;
	syoung  Project1        1       Workflow2       7
	syoung  Project2        1       Workflow1-transcriptome 7
	syoung  Project2        1       Workflow1-transcriptome 7
	syoung  Projectx        1       ZcZCX   7
	syoung  Project1        1       Workflowvv      7
	syoung  Project1        1       Workflow3-indels        7
	syoung  Project1        1       Workflow3-indels        7
	syoung  Project1        1       Workflowx       7
	syoung  Project1        1       Workflow1       8
	admin   Project1                Workflow1


SOLUTION

	DELETE ALL AND MANUALLY RESET WORKFLOWNUMBER
	
	** GOOD ** BECAUSE CAN TEST AUTOMATIC ASSIGNMENT OF NUMBERS



</entry>

<entry [Sun Aug 23 01:51:33 EDT 2009] FIXED SQLITE ERROR 'DBD::SQLite::db selectall_arrayref failed: no such table'>

PROBLEM

tail -f /var/log/httpd/error_log

		[Sun Aug 23 22:32:03 2009] [error] [client 10.150.180.107] [Sun Aug 23 22:32:03 2009] admin.pl: DBD::SQLite::db selectall_arrayref failed: no such table: sessions(1) at dbdimp.c line 271 at /data/aqwa/0.3/cgi-bin/lib/DBase/SQLite.pm line 658., referer: http://ngsdev.ccs.miami.edu/aqwa/trunk/0.3/aqwa.html?admin


DIAGNOSIS

WAS USING 'BINDIR' INSTEAD OF 'INSTALLDIR' TO CREATE PATH TO data.dbl FILE

NB: TRIED THIS BUT DIDN'T WORK THOUGH USEFUL INFO:

http://www.sqlite.org/cvstrac/rptview?rn=39&order_by=2&order_dir=ASC

This probably means that access permissions are not set right on the database file. It does not appear to be a bug in SQLite.
It is no SQLite bug, but maybe you should put this into the FAQ:

In order to lock a database the directory has to have the same permissions as the db file, for the lock files to be generated. This is of course very relevant for Apache subprocesses with different uid/gid. I recomment a seperate directory for every database.


SOLUTION

SET 'DBFILE' IN CONF FILE TO ACCESS IT UNIFORMLY ACROSS ALL APPS

 

</entry>

<entry [Sun Aug 23 01:51:33 EDT 2009] FIXED ERROR Can't ignore signal CHLD, forcing to default at /data/aqwa/0.3/cgi-bin/putrelay.pl line 1.>

		{ status: 'Submitted to cluster' }bash-3.2$ perl -U workflow.cgi < t/workflow-executeWorkflow-splitace.json
		Content-type: text/html

		Can't ignore signal CHLD, forcing to default at /data/aqwa/0.3/cgi-bin/putrelay.pl line 1.
		{ status: 'Workflow::executeWorkflow' }
		App::clusterSubmit    scriptfile: /nethome/syoung/.aqwa/Project1/Workflow1/.scripts/scriptfile-syoung.sh
		App::clusterSubmit    qsub: /usr/local/bin/msub
		App::clusterSubmit    Submitting job to cluster...
		qsub  /nethome/syoung/.aqwa/Project1/Workflow1/.scripts/scriptfile-syoung.sh
		App::clusterSubmit    Submit done.
		App::clusterSubmit    Process id: 73700

DIAGNOSIS
		
		http://support.bb4.com/archive/200306/msg00023.html
		
		Can't ignore signal CHLD, forcing to default 
		(W signal) Perl has detected that it is being run with the SIGCHLD signal
		(sometimes known as SIGCLD) disabled. Since disabling this signal will
		interfere with proper determination of exit status of child processes, Perl
		has reset the signal to its default value. This situation typically
		indicates that the parent program under which Perl may be running (e.g.
		cron) is being very careless.


SOLUTION

REMOVE -w FROM FIRST LINE OF putrelay.pl AND FROM COMMAND IN workflow.cgi


</entry>

<entry [Sat Aug 22 23:35:33 EDT 2009] SCHEMATIC OF WORKFLOW CLUSTER SUBMISSION>


	PACKAGE		Workflow
	
	PURPOSE
	
		THE Workflow OBJECT PERFORMS THE FOLLOWING	TASKS:
		
			1. SAVE WORKFLOWS
			
			2. RUN WORKFLOWS
			
			3. PROVIDE WORKFLOW STATUS

	NOTES

		COMPLETED: 	STAGE 1
		TODO:		STAGE 2
	
		Workflow::executeWorkflow
			|
			|
			-> my $appsWorkflow = Apps::Workflow->new()
				|
				|
				-> $appsWorkflow->run() SINGLE JOB
					|
				STAGE 1	
					|
					-> 	my $stage = App::Stage->new()
						my $stage = App::Stage->new()
						...
						|
						|
						-> $stage->execute() 
							|
							|
							? DEFINED 'CLUSTER'
							|
							|
							YES ->  Apps::clusterSubmit() 
							|
							|
							NO ->  Apps::execute()
					:
				STAGE 2
					|
					|
					-> $appsWorkflow->run() ARRAY JOB
					|
					|
					-> $appsWorkflow->run() ANT/HERDER JOB (FAILURE MITIGATION)


	EXAMPLES

perl workflow.cgi < workflow-executeWorkflow.json

emacs workflow-executeWorkflow.json
{
    'sessionId' : '1228791394.7868.158',
    'username' : 'admin',
    'project' : 'Project1',
    'workflow' : 'Workflow3-indels',
    'mode' : 'runWorkflow',
    'start' : 0
}





</entry>

<entry [Sat Aug 22 23:35:33 EDT 2009] LOCK DOWN INSTALLATION BY SETTING sshd_config TO DENY USERS>


http://www.cyberciti.biz/tips/openssh-deny-or-restrict-access-to-users-and-groups.html


DenyUsers user1 user2 user3

Use to block user login. You can use wild cards as well as user1@somedomain.com (user1 is not allowed to login from somedomain.com host) pattern.

DenyGroups group1 group2
A list of group names, if user is part of primary of supplementary group login access is denied. You can use wildcards.

Please note that you cannot use a numeric group or username ID. If these directives are not used, default is to allow everyone.

AllowUsers user1 user2
This directive is opposite of DenyUsers directive.

AllowGroups group1 group2
This directive is opposite of DenyGroups directive.

You should always block access to root user/group:
Open /etc/ssh/sshd_config file:

# vi /etc/ssh/sshd_config

Append following names (directives):

DenyUsers root finadmin
DenyGroups root finadmin

Make sure at least one user is allowed to use 'su -' command.

Save the file and restart the sshd.

This is a secure setup and you are restricting the users allowed to access the system via SSH with four above directives.


Please note that if you want to deny or allow access to large number of users consider SSH PAM configuration (ideal for ISPs and Web hosting service providers). PAM allows you to store usernames using text files (you do not have to mess up with ssh configuration file).

http://www.cyberciti.biz/tips/linux-pam-configuration-that-allows-or-deny-login-via-the-sshd-server.html


</entry>

<entry [Fri Aug 21 13:23:33 EDT 2009] DOJO WORKERS PHOTOS>

http://demos.dojotoolkit.org/demos/skew/


</entry>

<entry [Thu Aug 20 13:23:33 EDT 2009] SQLITE DATABASE PROBLEM WITH INSERT INTO stage TABLE ON ngsdev >

SOLUTION

SET PERMISSIONS ON data.dbl AND MADE bin WRITEABLE BY apache


PROBLEM

   ...> '1250785194871');
SQL error: unable to open database file


DIAGNOSIS

COULD BE PERMISSIONS BUT TRIED chown apache:apache data.dbl TO NO AVAIL

THIS HELPED:

		Select or Download Code
		Re: cgi can't write to sqlite database
		by moritz on Jul 03, 2008 at 21:06 UTC
		my $db = "/home/bcrowell/Documents/writing/selling_fiction/stories.sqlt";
		I doubt that Apache has access to all this directory, it would require read and executable bits (iirc) set on all these dirs.
		
		Try to place a copy in /tmp/ and make it globally writeable. If it still doesn't work, and you're not using selinux or some other security enhancements, it's not a permission problem.
		
		[reply]
		[d/l]
		[select]
		Re^2: cgi can't write to sqlite database
		by bcrowell2 on Jul 03, 2008 at 21:31 UTC
		That was it -- thanks!!
		

</entry>

<entry [Wed Aug 19 03:28:07 EDT 2009] FIXED PROBLEM WITH WORKFLOW getProjects() OF RECENTLY-SAVED splitace.pl>

SOLUTION

CONVERTED '' INTO &quot;&quot; IN applicationsList.

http://www.degraeve.com/reference/specialcharacters.php

&quot;	"	
&#35;	#	
&#36;	$	
&#37;	%	
&amp;	&	
&#39;	'	
&#40;	(	
&#41;	)	
&frasl;	/	
&#91;	[	
&#92;	\	
&#93;	]	
&#96;	`	
&#123;	{	
&#124;	|	
&#125;	}	


PROBLEM


C:\DATA\base\cgi-bin\aqwa>perl workflow.cgi < t/workflow-getProjects.json
Content-type: text/html

Workflow::Project AFTER regex $result->{arguments}: ***{'outputdir':{'params':'a
cefile','required':false,'format':'inputfile','value':'Project1/Workflow3-indels
','args':['inputs.acefile.value'],'type':'directory','option':'-o','description'
:'/full/path/to/directory/containing/reference_sequences.2bpb, .idx and .vld fil
es','paramFunction':'var outputdir = acefile; outputdir = outputdir.replace(/\\\
\/[^\\/]+$/, ''); return outputdir;'},'inputfile':{'required':true,'format':'ace
','value':'Project1/Workflow3-indels/s_6_150_sorted.ace','args':['inputs.acefile
.value'],'type':'file','option':'-i','description':'/full/path/to/input_file'}}*
**

<h1>Software error:</h1>
<pre>Bad object ; ,or } expected while parsing object/hash, at character offset
360 [&quot;); return outputdir;...&quot;] at C:/DATA/base/cgi-bin/aqwa/lib/Workf
low.pm line 576
</pre>
<p>
For help, please send mail to this site's webmaster, giving this error message
and the time and date of the error.



THERE ARE TWO APPLICATION ENTITIES IN THE project TABLE CONTAINING splitace.pl BUT THIS ONE DOESN'T WORK (I.E., AQWA CRASHES WHEN LOADING WORKFLOW BECAUSE this.projects IS NOT DEFINED DUE TO FAULTY JSON IN THE DATABASE ENTRY NOT BEING PARSED BY Workflow.pm )

THIS ENTITY DOESN'T WORK:

sqlite> select * from project where name = 'splitace.pl' and project = 'Project1' and workflow = 'Workflow1';

syoung  Project1        1       Workflow1       7       splitace.pl     1       bin/apps/splitace.pl    perl    Convert .ace file into multiple ace files  {'outputdir':{'params':'acefile','required':false,'format':'inputfile','value':'Project1/Workflow3-indels','args':['inputs.acefile.value'],'type':'directory','option':'-o','description':'/full/path/to/directory/containing/reference_sequences.2bpb, .idx and .vld files','paramFunction':'var outputdir = acefile; outputdir = outputdir.replace(/\\\\/[^\\/]+$/, ''); return outputdir;'},'inputfile':{'required':true,'format':'ace','value':'Project1/Workflow3-indels/s_6_150_sorted.ace','args':['inputs.acefile.value'],'type':'file','option':'-i','description':'/full/path/to/input_file'}}     {}      {}

AND THIS DOES WORK:

sqlite> select * from project where name = 'splitace.pl' and project = 'Project1' and workflow = 'Workflow3-indels';

syoung  Project1        1       Workflow3-indels        7       splitace.pl     2       bin/apps/splitace.pl    perl    Convert .ace file into multiple ace files   {'outputdir':{'params':'acefile','required':false,'format':'inputfile','value':'Project1/Workflow3-indels','args':['inputs.acefile.value'],'type':'directory','option':'-o','description':'/full/path/to/directory/containing/reference_sequences.2bpb, .idx and .vld files','paramFunction':'var outputdir = acefile; outputdir = outputdir.replace/\\\\\\\\/[^\\\\/]+$/, &quot;&quot;; return outputdir;'},'inputfile':{'required':true,'format':'ace','value':'Project1/Workflow3-indels/inputfile.txt','args':['inputs.acefile.value'],'type':'file','option':'-i','description':'/full/path/to/input_file'}}   {"acefiles":{"params":"inputfile","format":"ace","value":"Project1/Workflow3-indels/s_6_150_sorted.*.ace","args":["arguments.inputfile.value"],"type":"file","paramFunction":"var acefile = inputfile; acefile = acefile.replace/\\\\.ace/, &quot;.*.ace&quot;; return acefile;"}}      {"acefile":{"format":"ace","value":"Project1/Workflow3-indels/s_6_150_sorted.ace","args":["outputs.acefile.value"],"type":"file"}}


COULD IT BE THAT THE PERL JSON PARSER DOESN'T LIKE FIELDS WITH VALUES '{}'?






NB: THIS WAS THE SAVE COMMAND FOR THE APPLICATION ENTRY THAT DIDN'T WORK:

emacs t/workflow-saveWorkflow-splitace.json
{"username":"syoung","sessionId":"1228791394.7868.158","project":"Project1","workflow":"Workflow1","mode":"saveWorkflow","applications":[{"outputs":{},"location":"bin/apps/splitace.pl","executor":"perl","name":"splitace.pl","inputs":{},"description":"Convert .ace file into multiple ace files","type":"utility","arguments":{"outputdir":{"params":"acefile","format":"inputfile","required":false,"value":"Project1/Workflow3-indels","args":["inputs.acefile.value"],"option":"-o","type":"directory","description":"/full/path/to/directory/containing/reference_sequences.2bpb, .idx and .vld files","paramFunction":"var outputdir = acefile; outputdir = outputdir.replace(/\\\\/[^\\/]+$/, ''); return outputdir;"},"inputfile":{"format":"ace","required":true,"value":"Project1/Workflow3-indels/s_6_150_sorted.ace","args":["inputs.acefile.value"],"option":"-i","type":"file","description":"/full/path/to/input_file"}}}]}

</entry>

<entry [Wed Aug 19 03:28:07 EDT 2009] REFOCUS : FALSE TO DISABLE QUIT OF DIALOGUE WHEN PAGE IS CLICKED OUTSIDE THE DIALOGUE>


view-source:http://localhost:8080/aqwa/html/dojo.1.2.2/dijit/tests/test_Dialog.html


var thirdDlg;
function createDialog() {
	if(!thirdDlg){	
		var pane = dojo.byId('thirdDialog');
		pane.style.width = "300px"; 	
		thirdDlg = new dijit.Dialog({
			id: "dialog3",
			refocus:false,
			title: "Programatic Dialog Creation"
		},pane);
	}
	setTimeout(function(){ thirdDlg.show(); },"3000");
}
		
		
</entry>

<entry [Tue Aug 18 05:51:43 EDT 2009] DUPLICATE REGISTERED WIDGET ID>

JUST REMOVE WITH

if ( dijit.byId('somename') )
{
	dijit.byId('somename').destroy();
}




	Error: Tried to register widget with id== but that id is already registered on a contentPane for dojo version 1.3.1
	Submitted by wwilliam on Thu, 05/07/2009 - 19:29.
	Dijit Support contentPane tried to register with id _Widget
	Hello,
	
	I receive a "Error: Tried to register widget with id==block0 but that id is already registered" when I reopen a dialog box. This is because the child elements of the ContentPane are not being destroyed.
	
	It seems like "destroyDescendants" works differently in 1.3.1 than in 1.1. In 1.3.1, there is a "destroyDescendants" method in ContentPane.js which attempts to identify the child elements to eventually destroy, via "this.getChildren()" and "setter.parseResults()". Unfortunately, even though child elements exist, the two aforementioned methods do not recognize any.
	
	In version 1.1, there is no "destroyDescendants" method in ContentPane.js, thus the method in _Widget.js gets used. That method does the following:
	dojo.forEach(this.getDescendants(), function(widget){ widget.destroy(); });
	and it works properly.
	
	Is there a particular way to properly "clear" a dialog box, so that the old widgets get destroyed properly, or is this a bug? Please reply. Thank you.
	
	Bill


</entry>

<entry [Mon Aug 17 04:54:55 EDT 2009] TEST FILE UPLOAD	>

perl upload.cgi <  upload-project1workflow1-admin.txt

-----------------------------311073019118007
Content-Disposition: form-data; name="uploadedfile"; filename="syoung-saveUsers.bsv"
Content-Type: application/octet-stream

Project1	project	Next Generation Analysis Tools	bioinfo	Bioinformatics Team
skhuri	user	Sawsan Khuri	bioinfo	Bioinformatics Team
Project2	project	Next Generation Data Analysis	nextgen	Next Generation Sequencing
yedwards	user	Yvonne Edwards	nextgen	Next Generation Sequencing
dhedges	user	Dale Hedges	nextgen	Next Generation Sequencing

-----------------------------311073019118007
Content-Disposition: form-data; name="username"

syoung
-----------------------------311073019118007
Content-Disposition: form-data; name="sessionId"

1228791394.7868.158
-----------------------------311073019118007
Content-Disposition: form-data; name="path"

Project1/Workflow1
-----------------------------311073019118007--



</entry>

<entry [Mon Aug 17 00:04:55 EDT 2009] FIXED JSON PARSING ERROR BY USING -support_by_pp AND loose, allow_singlequote AND allow_nonref>



FOR EXAMPLE, IN Workflow::getProjects():



use JSON -support_by_pp; 
my $jsonParser = JSON->new();


	foreach my $result ( @$results )
	{
		my @keys = ( "arguments", "inputs", "outputs" );
		foreach my $key ( @keys )
		{
			if ( not $result->{$key} or $result->{$key} =~ /^\s*$/ )
			{
				$result->{$key} = {};
			}
			else
			{
				$result->{$key} =~ s/""/||/g;	#### REPARSE THIS LATER IN JAVASCRIPT ON CLIENT 
				$result->{$key} = $jsonParser->allow_singlequote(1)->allow_nonref->loose(1)	->decode($result->{$key});
			}
		}
	
	... DO SOME STUFF, E.G., CONSTRUCTING PROJECT/WORKFLOW HASHARRAYS
	}
	


</entry>

<entry [Sat Aug 15 21:00:44 EDT 2009] RERUN OF IMAGE2ELAND >


1) RUN cluster-image2eland.pl TO MEASURE TOTAL CPU USAGE, PEAK MEMORY, ETC.

NB:

http://www.gersteinlab.org/proj/chip-seq-simu/eland.html
Eland uses up to 1GB of memory. The pipeline starts one Eland job per lane. In order to prevent most computers from running out of memory, an artificial dependency in the GERALD Makefile prevents multiple instances of Eland from running at the same time. This limitation can be removed by using the option

ELAND_MULTIPLE_INSTANCES 8

in the Gerald config file. Be aware that this may use up to 8 GB of memory on your analysis computer; if not enough memory is available, the analysis is likely to crash. Allowed values for this option are 1, 2, 4, 8. (1 means no lane parallelisation, and uses up to 1 GB RAM, 2 means two parallel jobs and up to 2 GB etc



IMAGE2ELAND1
------------

## 1. SET UP OUTPUTDIR

mkdir -p /nethome/syoung/base/pipeline/profile/image2eland1

## 2. CREATE GERALDFILE:

cd /nethome/syoung/base/pipeline/profile/image2eland1

rm -fr /nethome/syoung/base/pipeline/profile/image2eland1/geraldfile.txt
emacs /nethome/syoung/base/pipeline/profile/image2eland1/geraldfile.txt
1234567:ANALYSIS eland_extended
1234567:SEQUENCE_FORMAT --fastq
5:ELAND_GENOME /nethome/syoung/base/pipeline/solexa-reruns/genomes/phiXgenome
123467:ELAND_GENOME /mihg/data/NGS/syoung/base/pipeline/human-chr-squashed
1234567:USE_BASES nY*n
ELAND_MULTIPLE_INSTANCES 8
#### END


## 3. RUN cluster-image2eland.pl

cd /nethome/syoung/base/pipeline/profile/image2eland1

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland1 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland1/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n01:ppn=8 -l walltime=72:00:00 -N 1-image2eland" \
&> image2eland1.out



IMAGE TO ELAND 2
-----------------

## 1. SET UP OUTPUTDIR

mkdir -p /nethome/syoung/base/pipeline/profile/image2eland2

## 2. CREATE GERALDFILE:

cd /nethome/syoung/base/pipeline/profile/image2eland2
rm -fr /nethome/syoung/base/pipeline/profile/image2eland2/geraldfile.txt
emacs /nethome/syoung/base/pipeline/profile/image2eland2/geraldfile.txt
1234567:ANALYSIS eland_extended
1234567:SEQUENCE_FORMAT --fastq
5:ELAND_GENOME /nethome/syoung/base/pipeline/solexa-reruns/genomes/phiXgenome
123467:ELAND_GENOME /mihg/data/NGS/syoung/base/pipeline/human-chr-squashed
1234567:USE_BASES nY*n
ELAND_MULTIPLE_INSTANCES 8

## 3. RUN /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl

cd /nethome/syoung/base/pipeline/profile/image2eland2

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland2 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland2/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n02:ppn=8 -l walltime=72:00:00  -N 2-image2eland" \
&> image2eland2.out







IMAGE TO ELAND 3
-----------------

## 1. SET UP OUTPUTDIR

mkdir -p /nethome/syoung/base/pipeline/profile/image2eland3

## 2. CREATE GERALDFILE:

cd /nethome/syoung/base/pipeline/profile/image2eland3
rm -fr /nethome/syoung/base/pipeline/profile/image2eland3/geraldfile.txt
emacs /nethome/syoung/base/pipeline/profile/image2eland3/geraldfile.txt
1234567:ANALYSIS eland_extended
1234567:SEQUENCE_FORMAT --fastq
5:ELAND_GENOME /nethome/syoung/base/pipeline/solexa-reruns/genomes/phiXgenome
123467:ELAND_GENOME /mihg/data/NGS/syoung/base/pipeline/human-chr-squashed
1234567:USE_BASES nY*n
ELAND_MULTIPLE_INSTANCES 8

## 3. RUN /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl

cd /nethome/syoung/base/pipeline/profile/image2eland3

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland3 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland3/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n03:ppn=8 -l walltime=72:00:00  -N 3-image2eland" \
&> image2eland3.out






IMAGE TO ELAND 4
-----------------

## 1. SET UP OUTPUTDIR

mkdir -p /nethome/syoung/base/pipeline/profile/image2eland4

## 2. CREATE GERALDFILE:

cd /nethome/syoung/base/pipeline/profile/image2eland4
rm -fr /nethome/syoung/base/pipeline/profile/image2eland4/geraldfile.txt
emacs /nethome/syoung/base/pipeline/profile/image2eland4/geraldfile.txt
1234567:ANALYSIS eland_extended
1234567:SEQUENCE_FORMAT --fastq
5:ELAND_GENOME /nethome/syoung/base/pipeline/solexa-reruns/genomes/phiXgenome
123467:ELAND_GENOME /mihg/data/NGS/syoung/base/pipeline/human-chr-squashed
1234567:USE_BASES nY*n
ELAND_MULTIPLE_INSTANCES 8

## 3. RUN /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl

cd /nethome/syoung/base/pipeline/profile/image2eland4

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland4 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland4/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n04:ppn=8 -l walltime=72:00:00  -N 4-image2eland" \
&> image2eland4.out



	RUNNING
	
	 qstat -n

	kronos.ccs.miami.edu: 
																	   Req'd  Req'd   Elap
	Job ID               Username Queue    Jobname    SessID NDS   TSK Memory Time  S Time
	-------------------- -------- -------- ---------- ------ ----- --- ------ ----- - -----
	71549.kronos.ccs.mia syoung   psmall   1-image2el  26688     1   8    --  72:00 R 00:00
	   n01/7+n01/6+n01/5+n01/4+n01/3+n01/2+n01/1+n01/0
	71550.kronos.ccs.mia syoung   psmall   2-image2el   6222     1   8    --  72:00 R   -- 
	   n02/7+n02/6+n02/5+n02/4+n02/3+n02/2+n02/1+n02/0
	71551.kronos.ccs.mia syoung   psmall   3-image2el   3217     1   8    --  72:00 R   -- 
	   n03/7+n03/6+n03/5+n03/4+n03/3+n03/2+n03/1+n03/0
	71552.kronos.ccs.mia syoung   psmall   4-image2el  15172     1   8    --  72:00 R   -- 
	   n04/7+n04/6+n04/5+n04/4+n04/3+n04/2+n04/1+n04/0
	[syoung@kronos image2eland4]$ date
	Sat Aug 15 21:12:43 EDT 2009


ALL FOUR COMPLETED ON SUNDAY:

	Run time: 18:39:38
	Completed /home/syoung/base/bin/nextgen/image2eland.pl
	3:51PM, 16 August 2009
	****************************************



[syoung@ngsdev image2eland1]$ cat test-usage.txt 
Job Id: 71549.kronos.ccs.miami.edu
    Job_Name = 1-image2eland
    Job_Owner = syoung@kronos.ccs.miami.edu
    resources_used.cput = 78:24:34
    resources_used.mem = 6442488kb
    resources_used.vmem = 7334024kb
    resources_used.walltime = 18:39:01
    job_state = R
    queue = psmall
    server = kronos.ccs.miami.edu
    Checkpoint = u
    ctime = Sat Aug 15 21:11:31 2009
    Error_Path = kronos.ccs.miami.edu:/nethome/syoung/base/pipeline/profile/im
        age2eland1/1-image2eland.e71549
    exec_host = n01/7+n01/6+n01/5+n01/4+n01/3+n01/2+n01/1+n01/0
    Hold_Types = n
    Join_Path = oe
    Keep_Files = n
    Mail_Points = abe
    Mail_Users = syoung@med.miami.edu
    mtime = Sat Aug 15 21:11:34 2009
    Output_Path = kronos.ccs.miami.edu:/nethome/syoung/base/pipeline/profile/i
        mage2eland1/1-image2eland.o71549
    Priority = 0
    qtime = Sat Aug 15 21:11:31 2009
    Rerunable = True
    Resource_List.ncpus = 8
    Resource_List.nodect = 1
    Resource_List.nodes = n01:ppn=8
    Resource_List.walltime = 72:00:00
    session_id = 26688
    Variable_List = PBS_O_HOME=/nethome/syoung,PBS_O_LANG=en_US.UTF-8,
        PBS_O_LOGNAME=syoung,
        PBS_O_PATH=/sw/bin:/nethome/syoung/base/bin:/usr/X11R6/bin:/nethome/s
        young/base/bin/utils:/home/syoung/base/bin/nextgen:/home/syoung/base/a
        pps/amos/bin:/usr/local/qt/bin:/home/apps/alta-cyclic/0.1.0/external.p
        rograms/libsvm-2.86:/home/apps/alta-cyclic/0.1.0/blat/bin/i386:/home/a
        pps/alta-cyclic/0.1.0/perlmods/lib64/perl5/site_perl/5.8.8/x86_64-linu
        x-thread-multi/auto:/home/apps/alta-cyclic/0.1.0/perlexternal:/home/bi
        oinfo/apps/ngs/bin/nextgen:/home/bioinfo/apps/ngs/bin/exome:/home/bioi
        nfo/apps/ngs/bin/utils:/home/bioinfo/apps/ngs/bin:/usr/local/bin:/bin:
        /usr/bin:/usr/lpp/mmfs/bin,PBS_O_MAIL=/var/spool/mail/syoung,
        PBS_O_SHELL=/bin/bash,PBS_SERVER=kronos.ccs.miami.edu,
        PBS_O_HOST=kronos.ccs.miami.edu,
        PBS_O_WORKDIR=/nethome/syoung/base/pipeline/profile/image2eland1,
        PBS_O_QUEUE=psmall
    etime = Sat Aug 15 21:11:31 2009
    submit_args = -q psmall -M syoung@med.miami.edu -m abe -l nodes=n01:ppn=8 
        -l walltime=72:00:00 -N 1-image2eland /nethome/syoung/base/pipeline/pr
        ofile/image2eland1/run-image2eland.sh !

Job Id: 71550.kronos.ccs.miami.edu
    Job_Name = 2-image2eland
    Job_Owner = syoung@kronos.ccs.miami.edu
    resources_used.cput = 75:03:42
    resources_used.mem = 6307144kb
    resources_used.vmem = 7255816kb
    resources_used.walltime = 18:38:24
    job_state = R
    queue = psmall
    server = kronos.ccs.miami.edu
    Checkpoint = u
    ctime = Sat Aug 15 21:11:54 2009
    Error_Path = kronos.ccs.miami.edu:/nethome/syoung/base/pipeline/profile/im
        age2eland2/2-image2eland.e71550
    exec_host = n02/7+n02/6+n02/5+n02/4+n02/3+n02/2+n02/1+n02/0
    Hold_Types = n
    Join_Path = oe
    Keep_Files = n
    Mail_Points = abe
    Mail_Users = syoung@med.miami.edu
    mtime = Sat Aug 15 21:11:57 2009
    Output_Path = kronos.ccs.miami.edu:/nethome/syoung/base/pipeline/profile/i
        mage2eland2/2-image2eland.o71550
    Priority = 0
    qtime = Sat Aug 15 21:11:54 2009
    Rerunable = True
    Resource_List.ncpus = 8
    Resource_List.nodect = 1
    Resource_List.nodes = n02:ppn=8
    Resource_List.walltime = 72:00:00
    session_id = 6222
    Variable_List = PBS_O_HOME=/nethome/syoung,PBS_O_LANG=en_US.UTF-8,
        PBS_O_LOGNAME=syoung,
        PBS_O_PATH=/sw/bin:/nethome/syoung/base/bin:/usr/X11R6/bin:/nethome/s
        young/base/bin/utils:/home/syoung/base/bin/nextgen:/home/syoung/base/a
        pps/amos/bin:/usr/local/qt/bin:/home/apps/alta-cyclic/0.1.0/external.p
        rograms/libsvm-2.86:/home/apps/alta-cyclic/0.1.0/blat/bin/i386:/home/a
        pps/alta-cyclic/0.1.0/perlmods/lib64/perl5/site_perl/5.8.8/x86_64-linu
        x-thread-multi/auto:/home/apps/alta-cyclic/0.1.0/perlexternal:/home/bi
        oinfo/apps/ngs/bin/nextgen:/home/bioinfo/apps/ngs/bin/exome:/home/bioi
        nfo/apps/ngs/bin/utils:/home/bioinfo/apps/ngs/bin:/usr/local/bin:/bin:
        /usr/bin:/usr/lpp/mmfs/bin,PBS_O_MAIL=/var/spool/mail/syoung,
        PBS_O_SHELL=/bin/bash,PBS_SERVER=kronos.ccs.miami.edu,
        PBS_O_HOST=kronos.ccs.miami.edu,
        PBS_O_WORKDIR=/nethome/syoung/base/pipeline/profile/image2eland2,
        PBS_O_QUEUE=psmall
    etime = Sat Aug 15 21:11:54 2009
    submit_args = -q psmall -M syoung@med.miami.edu -m abe -l nodes=n02:ppn=8 
        -l walltime=72:00:00 -N 2-image2eland /nethome/syoung/base/pipeline/pr
        ofile/image2eland2/run-image2eland.sh !

Job Id: 71551.kronos.ccs.miami.edu
    Job_Name = 3-image2eland
    Job_Owner = syoung@kronos.ccs.miami.edu
    resources_used.cput = 75:08:54
    resources_used.mem = 6481556kb
    resources_used.vmem = 7435976kb
    resources_used.walltime = 18:38:08
    job_state = R
    queue = psmall
    server = kronos.ccs.miami.edu
    Checkpoint = u
    ctime = Sat Aug 15 21:12:11 2009
    Error_Path = kronos.ccs.miami.edu:/nethome/syoung/base/pipeline/profile/im
        age2eland3/3-image2eland.e71551
    exec_host = n03/7+n03/6+n03/5+n03/4+n03/3+n03/2+n03/1+n03/0
    Hold_Types = n
    Join_Path = oe
    Keep_Files = n
    Mail_Points = abe
    Mail_Users = syoung@med.miami.edu
    mtime = Sat Aug 15 21:12:13 2009
    Output_Path = kronos.ccs.miami.edu:/nethome/syoung/base/pipeline/profile/i
        mage2eland3/3-image2eland.o71551
    Priority = 0
    qtime = Sat Aug 15 21:12:11 2009
    Rerunable = True
    Resource_List.ncpus = 8
    Resource_List.nodect = 1
    Resource_List.nodes = n03:ppn=8
    Resource_List.walltime = 72:00:00
    session_id = 3217
    Variable_List = PBS_O_HOME=/nethome/syoung,PBS_O_LANG=en_US.UTF-8,
        PBS_O_LOGNAME=syoung,
        PBS_O_PATH=/sw/bin:/nethome/syoung/base/bin:/usr/X11R6/bin:/nethome/s
        young/base/bin/utils:/home/syoung/base/bin/nextgen:/home/syoung/base/a
        pps/amos/bin:/usr/local/qt/bin:/home/apps/alta-cyclic/0.1.0/external.p
        rograms/libsvm-2.86:/home/apps/alta-cyclic/0.1.0/blat/bin/i386:/home/a
        pps/alta-cyclic/0.1.0/perlmods/lib64/perl5/site_perl/5.8.8/x86_64-linu
        x-thread-multi/auto:/home/apps/alta-cyclic/0.1.0/perlexternal:/home/bi
        oinfo/apps/ngs/bin/nextgen:/home/bioinfo/apps/ngs/bin/exome:/home/bioi
        nfo/apps/ngs/bin/utils:/home/bioinfo/apps/ngs/bin:/usr/local/bin:/bin:
        /usr/bin:/usr/lpp/mmfs/bin,PBS_O_MAIL=/var/spool/mail/syoung,
        PBS_O_SHELL=/bin/bash,PBS_SERVER=kronos.ccs.miami.edu,
        PBS_O_HOST=kronos.ccs.miami.edu,
        PBS_O_WORKDIR=/nethome/syoung/base/pipeline/profile/image2eland3,
        PBS_O_QUEUE=psmall
    etime = Sat Aug 15 21:12:11 2009
    submit_args = -q psmall -M syoung@med.miami.edu -m abe -l nodes=n03:ppn=8 
        -l walltime=72:00:00 -N 3-image2eland /nethome/syoung/base/pipeline/pr
        ofile/image2eland3/run-image2eland.sh !

Job Id: 71552.kronos.ccs.miami.edu
    Job_Name = 4-image2eland
    Job_Owner = syoung@kronos.ccs.miami.edu
    resources_used.cput = 78:29:42
    resources_used.mem = 6564856kb
    resources_used.vmem = 7569264kb
    resources_used.walltime = 18:37:34
    job_state = R
    queue = psmall
    server = kronos.ccs.miami.edu
    Checkpoint = u
    ctime = Sat Aug 15 21:12:34 2009
    Error_Path = kronos.ccs.miami.edu:/nethome/syoung/base/pipeline/profile/im
        age2eland4/4-image2eland.e71552
    exec_host = n04/7+n04/6+n04/5+n04/4+n04/3+n04/2+n04/1+n04/0
    Hold_Types = n
    Join_Path = oe
    Keep_Files = n
    Mail_Points = abe
    Mail_Users = syoung@med.miami.edu
    mtime = Sat Aug 15 21:12:37 2009
    Output_Path = kronos.ccs.miami.edu:/nethome/syoung/base/pipeline/profile/i
        mage2eland4/4-image2eland.o71552
    Priority = 0
    qtime = Sat Aug 15 21:12:34 2009
    Rerunable = True
    Resource_List.ncpus = 8
    Resource_List.nodect = 1
    Resource_List.nodes = n04:ppn=8
    Resource_List.walltime = 72:00:00
    session_id = 15172
    Variable_List = PBS_O_HOME=/nethome/syoung,PBS_O_LANG=en_US.UTF-8,
        PBS_O_LOGNAME=syoung,
        PBS_O_PATH=/sw/bin:/nethome/syoung/base/bin:/usr/X11R6/bin:/nethome/s
        young/base/bin/utils:/home/syoung/base/bin/nextgen:/home/syoung/base/a
        pps/amos/bin:/usr/local/qt/bin:/home/apps/alta-cyclic/0.1.0/external.p
        rograms/libsvm-2.86:/home/apps/alta-cyclic/0.1.0/blat/bin/i386:/home/a
        pps/alta-cyclic/0.1.0/perlmods/lib64/perl5/site_perl/5.8.8/x86_64-linu
        x-thread-multi/auto:/home/apps/alta-cyclic/0.1.0/perlexternal:/home/bi
        oinfo/apps/ngs/bin/nextgen:/home/bioinfo/apps/ngs/bin/exome:/home/bioi
        nfo/apps/ngs/bin/utils:/home/bioinfo/apps/ngs/bin:/usr/local/bin:/bin:
        /usr/bin:/usr/lpp/mmfs/bin,PBS_O_MAIL=/var/spool/mail/syoung,
        PBS_O_SHELL=/bin/bash,PBS_SERVER=kronos.ccs.miami.edu,
        PBS_O_HOST=kronos.ccs.miami.edu,
        PBS_O_WORKDIR=/nethome/syoung/base/pipeline/profile/image2eland4,
        PBS_O_QUEUE=psmall
    etime = Sat Aug 15 21:12:34 2009
    submit_args = -q psmall -M syoung@med.miami.edu -m abe -l nodes=n04:ppn=8 
        -l walltime=72:00:00 -N 4-image2eland /nethome/syoung/base/pipeline/pr
        ofile/image2eland4/run-image2eland.sh !





NOTES
-----

IMAGE2ELAND4 TERMINATED AT 9.11AM ON TILE s_8_0028:

-rw-rw-rw-  1 syoung bioinfo  643K Aug 15 09:05 s_8_0025_pos.txt
-rw-rw-rw-  1 syoung bioinfo  6.4M Aug 15 09:11 s_8_0026_int.txt.p.gz
-rw-rw-rw-  1 syoung bioinfo  407K Aug 15 09:11 s_8_0026_nse.txt.p.gz
-rw-rw-rw-  1 syoung bioinfo  656K Aug 15 09:05 s_8_0026_pos.txt
-rw-rw-rw-  1 syoung bioinfo  6.2M Aug 15 09:11 s_8_0027_int.txt.p.gz
-rw-rw-rw-  1 syoung bioinfo  383K Aug 15 09:11 s_8_0027_nse.txt.p.gz
-rw-rw-rw-  1 syoung bioinfo  633K Aug 15 09:05 s_8_0027_pos.txt
-rw-rw-rw-  1 syoung bioinfo  6.2M Aug 15 09:11 s_8_0028_int.txt.p.gz
-rw-rw-rw-  1 syoung bioinfo  386K Aug 15 09:11 s_8_0028_nse.txt.p.gz
-rw-rw-rw-  1 syoung bioinfo  626K Aug 15 09:05 s_8_0028_pos.txt
drwxrwxrwx  2 syoung bioinfo   16K Aug 14 18:05 Sizes
-rw-rw-rw-  1 syoung bioinfo   429 Aug 14 18:05 support.txt
drwxrwxrwx 10 syoung bioinfo   16K Aug 14 18:05 Temp
-rw-rw-rw-  1 syoung bioinfo   432 Aug 14 18:05 tiles_cal.txt
-rw-rw-rw-  1 syoung bioinfo  7.1K Aug 14 18:05 tiles.txt
-rw-rw-rw-  1 syoung bioinfo    87 Aug 15 09:11 warning.txt
[syoung@kronos C1-52_Firecrest1.4.0_14-08-2009_syoung.2]$ 


BUT THE IMAGE FILES ARE PRESENT:

-rwxrw-r--   1 mihglabtech users 7.6M May 17 02:00 s_8_29_a.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 02:00 s_8_29_c.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 02:00 s_8_29_g.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 02:00 s_8_29_t.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 01:59 s_8_2_a.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 01:59 s_8_2_c.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 01:59 s_8_2_g.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 01:59 s_8_2_t.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 02:00 s_8_30_a.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 02:00 s_8_30_c.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 02:00 s_8_30_g.tif
-rwxrw-r--   1 mihglabtech users 7.6M May 17 02:00 s_8_30_t.tif


PERHAPS KILLED BY WALLTIME TIMEOUT? DESPITE THE FACT THAT WALL TIME WAS SPECIFIED IN THE COMMAND...

SOLUTION:

RUN WITHOUT LANE 8






/nethome/syoung/base/pipeline/profile/image2eland4


drwxrwxrwx 2 syoung bioinfo    16384 Aug 15 09:11 intfiles
-rw-rw-rw- 1 syoung bioinfo   250536 Aug 15 09:11 make.error
-rw-rw-rw- 1 syoung bioinfo    10091 Aug 14 18:05 makefile.error
-rw-rw-rw- 1 syoung bioinfo   191819 Aug 14 18:05 makefile.out
-rw-rw-rw- 1 syoung bioinfo 25008263 Aug 15 09:11 make.out
drwxrwxrwx 2 syoung bioinfo    16384 Aug 15 09:11 seqfiles
[syoung@kronos image2eland4]$ tail run-image2eland.sh.o70954 
Firecrest directory: /nethome/syoung/base/pipeline/profile/image2eland4/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Data/C1-52_Firecrest1.4.0_14-08-2009_syoung
bustard directory: Bustard1.4.0_14-08-2009_syoung
gerald directory: GERALD_14-08-2009_syoung
Chdir to pwd:
/home/syoung/base/pipeline/profile/image2eland4/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Data/C1-52_Firecrest1.4.0_14-08-2009_syoung
Make command:

make recursive -j8

Running make...


FINISHED AT 9:11AM:

drwxrwxrwx 2 syoung bioinfo    16384 Aug 15 09:11 intfiles
-rw-rw-rw- 1 syoung bioinfo   250536 Aug 15 09:11 make.error
-rw-rw-rw- 1 syoung bioinfo    10091 Aug 14 18:05 makefile.error
-rw-rw-rw- 1 syoung bioinfo   191819 Aug 14 18:05 makefile.out
-rw-rw-rw- 1 syoung bioinfo 25008263 Aug 15 09:11 make.out
drwxrwxrwx 2 syoung bioinfo    16384 Aug 15 09:11 seqfiles



[syoung@kronos outdir]$ tail -f make.out
Run terminated successfully.
Image 8 0026  52 1: A #obj     0 offset -1940.00 -2048.00  0.0000  0.0000 exp 0.0 0.0
Image 8 0026  52 2: C #obj     0 offset -1940.00 -2048.00  0.0000  0.0000 exp 0.0 0.0
Image 8 0026  52 3: G #obj     0 offset -1940.00 -2048.00  0.0000  0.0000 exp 0.0 0.0
Image 8 0026  52 4: T #obj     0 offset -1940.00 -2048.00  0.0000  0.0000 exp 0.0 0.0
Tile  8 0026  52: Original offsets:     -1940.00 -2048.00  -1940.00 -2048.00  -1940.00 -2048.00  -1940.00 -2048.00  
Tile  8 0026  52: Validated offsets (0):-1940.00 -2048.00  -1940.00 -2048.00  -1940.00 -2048.00  -1940.00 -2048.00  
Adding cycle data to the noise and intensity data
Run terminated successfully.
make[1]: Leaving directory `/home/syoung/base/pipeline/profile/image2eland4/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Data/C1-52_Firecrest1.4.0_14-08-2009_syoung.2'



IMAGE2ELAND4
------------

DO BASE CALLING AND ELAND:

cd /nethome/syoung/base/pipeline/profile/image2eland4
rm -fr runmakes.sh
emacs runmakes.sh
#!/bin/sh                                                                                                                                                   
echo "Running bustard.sh ..."
echo "Finished bustard.sh"

echo "Running eland.sh ..."

qsub -q psmall -l nodes=n04:ppn=8 -l walltime=72:00:00  -N 4-i2e-eland /nethome/syoung/base/pipeline/profile/image2eland4/eland.sh
echo "Finished eland.sh."

#### END   

cd /nethome/syoung/base/pipeline/profile/image2eland4
rm -fr bustard.sh
emacs bustard.sh
#!/bin/sh

#PBS -M syoung@med.miami.edu
#PBS -m abe
#PBS -j oe

cd /nethome/syoung/base/pipeline/profile/image2eland4/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Data/C1-52_Firecrest1.4.0_14-08-2009_syoung.2/Bustard1.4.0_14-08-2009_syoung

time make recursive -j8
#### END


qsub -q psmall -l nodes=n04:ppn=8 -l walltime=72:00:00  -N 4-i2e-bustard /nethome/syoung/base/pipeline/profile/image2eland4/bustard.sh





cd /nethome/syoung/base/pipeline/profile/image2eland4
rm -fr eland.sh
emacs eland.sh
#PBS -M syoung@med.miami.edu
#PBS -m abe
#PBS -j oe

cd /nethome/syoung/base/pipeline/profile/image2eland4/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Data/C1-52_Firecrest1.4.0_14-08-2009_syoung.2/Bustard1.4.0_14-08-2009_syoung/GERALD_14-08-2009_syoung

time make recursive -j8
#### END


qd
screen -S 4-i2e-runmakes
./runmakes.sh




</entry>

<entry [Fri Aug 14 06:32:18 EDT 2009] Project PAGE - apache CAN'T SEE THE SOURCE DIRECTORY BUT syoung CAN>

PROBLEM

WHEN RUN project.cgi AS USER SYOUNG:

perl -U project.cgi "mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&location=/mihg/data/NGS/syoung/base/pipeline&query=%22human-chr-fa%22"

	...
	fileroot: /nethome/syoung/.aqwa
	username: syoung
	Validated: 1
	Query: human-chr-fa
	location: /mihg/data/NGS/syoung/base/pipeline
	Location is defined. Setting fullPath = /mihg/data/NGS/syoung/base/pipeline
	query is defined. Setting fullquery .= '/human-chr-fa'
	fullPath: /mihg/data/NGS/syoung/base/pipeline/human-chr-fa
	fullPath: /mihg/data/NGS/syoung/base/pipeline/human-chr-fa
	syoung
	original_username: syoung
	original_real_uid: 1008
	original_effective_uid: 1008
	original_real_gid: 1072 1072 1046 918 892 710 702 669
	original_effective_gid: 1072 1072 1046 918 892 710 702 669
	original primary gid: 

... AND ALL THE FILE INFORMATION FOLLOWS


WHEN RUN project.cgi AS USER apache:

perl -U project.cgi "mode=fileSystem&username=syoung&sessionId=1228791394.7868.158&location=/mihg/data/NGS/syoung/base/pipeline&query=%22human-chr-fa%22"

	...
	fileroot: /nethome/syoung/.aqwa
	username: syoung
	Validated: 1
	Query: human-chr-fa
	location: /mihg/data/NGS/syoung/base/pipeline
	Location is defined. Setting fullPath = /mihg/data/NGS/syoung/base/pipeline
	query is defined. Setting fullquery .= '/human-chr-fa'
	fullPath: /mihg/data/NGS/syoung/base/pipeline/human-chr-fa
	fullPath: /mihg/data/NGS/syoung/base/pipeline/human-chr-fa
	syoung
	original_username: syoung
	original_real_uid: 1008
	original_effective_uid: 1008
	original_real_gid: 1072 48
	original_effective_gid: 1072 48
	original primary gid: 
	gid:
	$VAR1 = 1072;

... AND IT FAILS TO RECOGNISE THE fullPath AS A DIRECTORY, SO GIVES EMPTY FILE INF0RMATION.
	


DIAGNOSIS

MISSING GROUP IDS ARE REQUIRED FOR ACCESS TO THE SOURCE DIRECTORY


SOLUTION

IN project.cgi : ADD THE REQUIRED gid DEPENDING ON THE PATH, USING chown(uid, gid, "relay.pl")

NB: SEE DETAILS WITH perldoc -f chown


[syoung@ngsdev cgi-bin]$ id
whowhouid=1008(syoung) gid=1072(bioinfo) groups=669(mihg-data-core-external),702(mihg-data-vendor),710(mihg-core-external-pearlsoe),892(mihg-data-solexa),918(mihg-data-ngs),1046(mihgadm),1072(bioinfo)





</entry>

<entry [Fri Aug 14 06:31:18 EDT 2009] PROFILING OF AQWA PIPELINE APPS - cluster-image2eland.pl, clusterMAQ.pl AND clusterEland.pl>


HOW TO SPECIFY NODE AND CPUS:

qsub -M syoung@med.miami.edu -m abe -l nodes=n03:ppn=8 -l walltime=72:00:00 -N 1-image2eland -q psmall /nethome/syoung/base/pipeline/profile/image2eland1/run-image2eland.sh

(submits to node 03 and uses 8 cpus with 3 days walltime)



1) RUN cluster-image2eland.pl TO MEASURE TOTAL CPU USAGE, PEAK MEMORY, ETC.

NB:

http://www.gersteinlab.org/proj/chip-seq-simu/eland.html
Eland uses up to 1GB of memory. The pipeline starts one Eland job per lane. In order to prevent most computers from running out of memory, an artificial dependency in the GERALD Makefile prevents multiple instances of Eland from running at the same time. This limitation can be removed by using the option

ELAND_MULTIPLE_INSTANCES 8

in the Gerald config file. Be aware that this may use up to 8 GB of memory on your analysis computer; if not enough memory is available, the analysis is likely to crash. Allowed values for this option are 1, 2, 4, 8. (1 means no lane parallelisation, and uses up to 1 GB RAM, 2 means two parallel jobs and up to 2 GB etc



IMAGE2ELAND1
------------

## 1. SET UP OUTPUTDIR

mkdir -p /nethome/syoung/base/pipeline/profile/image2eland1
cd /nethome/syoung/base/pipeline/profile/image2eland1

## 2. CREATE GERALDFILE:

rm -fr /nethome/syoung/base/pipeline/profile/image2eland1/geraldfile.txt
emacs /nethome/syoung/base/pipeline/profile/image2eland1/geraldfile.txt
12345678:ANALYSIS eland_extended
12345678:SEQUENCE_FORMAT --fastq
5:ELAND_GENOME /nethome/syoung/base/pipeline/solexa-reruns/genomes/phiXgenome
1234678:ELAND_GENOME /mihg/data/NGS/syoung/base/pipeline/human-chr-squashed
12345678:USE_BASES nY*n
ELAND_MULTIPLE_INSTANCES 8

## 3. RUN cluster-image2eland.pl

cd /nethome/syoung/base/pipeline/profile/image2eland1

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland1 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland1/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n01:ppn=8 -l walltime=72:00:00 -N 1-image2eland" \
&> image2eland1.out



IMAGE TO ELAND 2
-----------------

## 1. SET UP OUTPUTDIR

mkdir -p /nethome/syoung/base/pipeline/profile/image2eland2
cd /nethome/syoung/base/pipeline/profile/image2eland2

## 2. CREATE GERALDFILE:

rm -fr /nethome/syoung/base/pipeline/profile/image2eland2/geraldfile.txt
emacs /nethome/syoung/base/pipeline/profile/image2eland2/geraldfile.txt
12345678:ANALYSIS eland_extended
12345678:SEQUENCE_FORMAT --fastq
5:ELAND_GENOME /nethome/syoung/base/pipeline/solexa-reruns/genomes/phiXgenome
1234678:ELAND_GENOME /mihg/data/NGS/syoung/base/pipeline/human-chr-squashed
12345678:USE_BASES nY*n
ELAND_MULTIPLE_INSTANCES 8

## 3. RUN /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl

cd /nethome/syoung/base/pipeline/profile/image2eland2

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland2 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland2/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n02:ppn=8 -l walltime=72:00:00  -N 2-image2eland" \
&> image2eland2.out







IMAGE TO ELAND 3
-----------------

## 1. SET UP OUTPUTDIR

mkdir -p /nethome/syoung/base/pipeline/profile/image2eland3
cd /nethome/syoung/base/pipeline/profile/image2eland3

## 2. CREATE GERALDFILE:

rm -fr /nethome/syoung/base/pipeline/profile/image2eland3/geraldfile.txt
emacs /nethome/syoung/base/pipeline/profile/image2eland3/geraldfile.txt
12345678:ANALYSIS eland_extended
12345678:SEQUENCE_FORMAT --fastq
5:ELAND_GENOME /nethome/syoung/base/pipeline/solexa-reruns/genomes/phiXgenome
1234678:ELAND_GENOME /mihg/data/NGS/syoung/base/pipeline/human-chr-squashed
12345678:USE_BASES nY*n
ELAND_MULTIPLE_INSTANCES 8

## 3. RUN /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl

cd /nethome/syoung/base/pipeline/profile/image2eland3

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland3 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland3/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n03:ppn=8 -l walltime=72:00:00  -N 3-image2eland" \
&> image2eland3.out






IMAGE TO ELAND 4
-----------------

## 1. SET UP OUTPUTDIR

mkdir -p /nethome/syoung/base/pipeline/profile/image2eland4
cd /nethome/syoung/base/pipeline/profile/image2eland4

## 2. CREATE GERALDFILE:

rm -fr /nethome/syoung/base/pipeline/profile/image2eland4/geraldfile.txt
emacs /nethome/syoung/base/pipeline/profile/image2eland4/geraldfile.txt
12345678:ANALYSIS eland_extended
12345678:SEQUENCE_FORMAT --fastq
5:ELAND_GENOME /nethome/syoung/base/pipeline/solexa-reruns/genomes/phiXgenome
1234678:ELAND_GENOME /mihg/data/NGS/syoung/base/pipeline/human-chr-squashed
12345678:USE_BASES nY*n
ELAND_MULTIPLE_INSTANCES 8

## 3. RUN /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl

cd /nethome/syoung/base/pipeline/profile/image2eland4

perl /nethome/syoung/base/bin/nextgen/cluster-image2eland.pl \
--type paired \
--rundir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4 \
--imagedir /mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4/Images \
--outputdir /nethome/syoung/base/pipeline/profile/image2eland4 \
--geraldfile /nethome/syoung/base/pipeline/profile/image2eland4/geraldfile.txt \
--control 5 \
--cpus 8 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -l nodes=n04:ppn=8 -l walltime=72:00:00  -N 4-image2eland" \
&> image2eland4.out


	ALL 4 JOBS RUNNING:
	[syoung@ngsdev image2eland4]$ qstat -n
	
	kronos.ccs.miami.edu: 
																	   Req'd  Req'd   Elap
	Job ID               Username Queue    Jobname    SessID NDS   TSK Memory Time  S Time
	-------------------- -------- -------- ---------- ------ ----- --- ------ ----- - -----
	71164.kronos.ccs.mia syoung   psmall   1-image2el  18652     1   8    --  72:00 R 00:00
	   n01/7+n01/6+n01/5+n01/4+n01/3+n01/2+n01/1+n01/0
	71165.kronos.ccs.mia syoung   psmall   2-image2el  32477     1   8    --  72:00 R   -- 
	   n02/7+n02/6+n02/5+n02/4+n02/3+n02/2+n02/1+n02/0
	71166.kronos.ccs.mia syoung   psmall   3-image2el  28488     1   8    --  72:00 R   -- 
	   n03/7+n03/6+n03/5+n03/4+n03/3+n03/2+n03/1+n03/0
	71167.kronos.ccs.mia syoung   psmall   4-image2el   6301     1   8    --  72:00 R   -- 
	   n04/7+n04/6+n04/5+n04/4+n04/3+n04/2+n04/1+n04/0
	[syoung@ngsdev image2eland4]$ qstat 
	Job id                    Name             User            Time Use S Queue
	------------------------- ---------------- --------------- -------- - -----
	71164.kronos              1-image2eland    syoung          00:00:55 R psmall         
	71165.kronos              2-image2eland    syoung                 0 R psmall         
	71166.kronos              3-image2eland    syoung                 0 R psmall         
	71167.kronos              4-image2eland    syoung                 0 R psmall         
	[syoung@ngsdev image2eland4]$ 



	###RUNNING
	###
	###[syoung@kronos image2eland4]$ date
	###Thu Aug 13 12:17:48 EDT 2009
	###[syoung@kronos image2eland4]$ qstat
	###Job id                    Name             User            Time Use S Queue
	###------------------------- ---------------- --------------- -------- - -----
	###70906.kronos              ...mage2eland.sh syoung          00:00:00 C default        
	###70907.kronos              ...mage2eland.sh syoung          00:00:00 C default        
	###70908.kronos              ...mage2eland.sh syoung          00:02:09 R default        
	###70910.kronos              ...mage2eland.sh syoung                 0 R default        
	###70911.kronos              ...mage2eland.sh syoung                 0 R default        
	###70912.kronos              ...mage2eland.sh syoung                 0 R default  




2) RUN clusterMAQ.pl TO MEASURE TOTAL CPU USAGE, PEAK MEMORY, ETC.


LANE 1 (RUNS 12 + 15) - 1M READ CHUNKS
--------------------------------------

	Run time: 00:34:16
	Completed /nethome/syoung/base/bin/nextgen/clusterMAQ.pl
	5:21PM, 12 August 2009
	****************************************

PARTIALLY COMPLETED - HAD TO FIX 'scripts' DIR AND RERUN SNP CALLING PORTION


LANE 2 (RUNS 12 + 15) - 1M READ CHUNKS
--------------------------------------

ALSO COPIED TO:


Notes-project22-aqwa.txt
Fri Aug 14 06:31:18 EDT 2009
PROFILING OF AQWA PIPELINE APPS - cluster-image2eland.pl, clusterMAQ.pl AND clusterEland.pl



mkdir -p /mihg/data/NGS/syoung/base/pipeline/profile/clusterMAQ-1M
cd /mihg/data/NGS/syoung/base/pipeline/profile/clusterMAQ-1M

screen -S lane2-clusterMAQ-1M

/nethome/syoung/base/bin/nextgen/clusterMAQ.pl \
--outputdir /mihg/data/NGS/syoung/base/pipeline/profile/clusterMAQ-1M \
--inputfile /mihg/data/NGS/syoung/base/pipeline/run12/lane1/s_1_1_sequence.fastq,/mihg/data/NGS/syoung/base/pipeline/run12/lane1/s_1_2_sequence.fastq \
--referencefile /mihg/data/NGS/syoung/base/pipeline/run12/lane1/CCDS_nucleotide.20080430.fa \
--reads  1000000 \
--clean \
--jobs 16 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -N ln2-cMAQ-1M -l ncpus=8" \
&> /mihg/data/NGS/syoung/base/pipeline/profile/clusterMAQ-1M/ln2-cMAQ-1M.log


tail -f /mihg/data/NGS/syoung/base/pipeline/profile/clusterMAQ-1M/ln2-cMAQ-1M.log


	QUEUEING
	Fri Aug 14 06:47:28 EDT 2009

	
	Run time: 00:47:39
	Completed /nethome/syoung/base/bin/nextgen/clusterMAQ.pl
	7:34AM, 14 August 2009
	****************************************
	

PROBLEM

mapcheck GIVES SEGMENTATION FAULT:	

emacs /mihg/data/NGS/syoung/base/pipeline/profile/clusterMAQ-1M/ln2-cMAQ-1M.log
 
	...
	time /nethome/syoung/base/apps/maq/0.7.1/maq mapcheck /mihg/data/NGS/syoung/base/pipeline/run12/lan\
	e1/CCDS_nucleotide.20080430.fa out.map > mapcheck.txt
	sh: line 1:  2652 Segmentation fault      /nethome/syoung/base/apps/maq/0.7.1/maq mapcheck /mihg/da\
	ta/NGS/syoung/base/pipeline/run12/lane1/CCDS_nucleotide.20080430.fa out.map >mapcheck.txt
	...
	

DIAGNOSIS

	out.map IS 331 MB

	NOT ENOUGH MEMORY ON NODE
	
	
SOLUTION

DO mapcheck ON EACH SUB-MAP (COMBINE LATER?)






 
 
 
 


</entry>

<entry [Wed Aug 12 15:51:03 EDT 2009] PROFILE MAQ 1, 4 AND 8 LANES ON CLUSTER FOR AQWA>

USE NA18507, SAMPLE 1 FOR TESTING

DISTRIBUTED:

dEland
dMAQ
dBowtie

SINGLE NODE, 8 CPUs:


1. BLOCK THE NODE WITH DUMMY REQUEST WITH SLEEP
USE qstat -n TO DETERMINE WHICH NODE IT IS


2. RUN clusterMAQ/clusterEland FROM ngsdev SENDING JOBS TO THE BLOCKED NODE 


3. EACH SUBJOB HAS ITS UNIQUE ID WHICH IS PUT IN A LOOKUP TABLE ALONG WITH ITS PID,
A DESCRIPTION OF THE MASTER JOB, THE ARGUMENTS FOR THE SUBJOB AND JOB START TIME


#####4. MANUALLY/Mail::Box::Mbox GET NEW MAIL AND CHECK ITS UNIQUE ID AND PID 
4. PRINT REDIRECT OF JOB MEMORY AND CPU USAGE TO .qc FILE

	echo "PBS ID: $PBS_ID"
	echo `/usr/local/bin/qstat -f $PBS_ID`;
	echo "Completed"


		MAIL COMMANDS
		-------------
		
		# EMAIL SOMEONE
		mail syoung@med.miami.edu
		
		# GET MESSAGES
		mail 



image2eland
cassava


#PBS -l nodes=1





UNKNOWNS: MAX MEMORY PER PROCESS - ISOLATE A WHOLE NODE AND RUN THE APPLICATION ON
A SINGLE CPU TO ESTIMATE THE MEMORY USAGE 

queueing time (which queue to use?), cpu processing time, 



MATRIX OF PARAMETERS (LATIN SQUARE)

lanes: 	1,4 and 8 lanes
chunks:	 0.5M,1M,1.5M,2M


solexa	eland

lanes: 	1,4 and 7 lanes (8M, 32M, 64M READS TOTAL)
chunks:	 0.5,1,2,6,4,8,10,12,14,16,18,20 (MILLION READS/JOB)


	You replied on 8/12/2009 3:59 PM.
	Sent:	 Wednesday, August 12, 2009 1:10 PM
	Cc:	
	Young, Stuart
	Ok, the reservation has been made for Stuart for a period of 7 days on four
	nodes (a maximum of 32 cores), starting from 13:00pm, August 12th. And the user
	can submit the job as usual without any special additional options in the
	scripts. The MOAB job scheduler will automatically allocate his job to reserved
	nodes. In case the submitted job requires even more resources, the job
	scheduler will then go to the other no-reserved nodes.
	
	Xinglong



RUN JOBS ON ngsdev:



MAQ
---

LANE 1 OF RUNS 12 AND 15


mkdir -p /mihg/data/NGS/syoung/base/pipeline/profile1/maq
cd /mihg/data/NGS/syoung/base/pipeline/profile1/maq

screen -S l1s1M

/nethome/syoung/base/bin/nextgen/clusterMAQ.pl \
--outputdir /mihg/data/NGS/syoung/base/pipeline/profile1/maq \
--inputfile /mihg/data/NGS/syoung/base/pipeline/run12/lane1/s_1_1_sequence.fastq,/mihg/data/NGS/syoung/base/pipeline/run12/lane1/s_1_2_sequence.fastq \
--referencefile /mihg/data/NGS/syoung/base/pipeline/run12/lane1/CCDS_nucleotide.20080430.fa \
--reads  1000000 \
--clean \
--jobs 16 \
--queue "-q psmall -M syoung@med.miami.edu -m abe -N l1s1M" \
&> /mihg/data/NGS/syoung/base/pipeline/profile1/maq/clusterMAQ-l1s1M.log

tail -f  /mihg/data/NGS/syoung/base/pipeline/profile1/maq/clusterMAQ-l1s1M.log
	
	
	
	...	
	[maq_rmdup_core] 581974 / 2522986 = 0.2307
	175.30user 3.53system 2:14.93elapsed 132%CPU (0avgtext+0avgdata 0maxresident)k
	0inputs+0outputs (0major+2585minor)pagefaults 0swaps
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq indelpe /mihg/data/NGS/syoung/base/pipeline/run12/\
	lane1/CCDS_nucleotide.20080430.bfa out.rmdup > out.indelpe
	
	real    0m39.292s
	user    0m28.756s
	sys     0m8.600s
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq indelsoa /mihg/data/NGS/syoung/base/pipeline/run12\
	/lane1/CCDS_nucleotide.20080430.bfa out.map > out.indelsoa
	
	real    0m22.929s
	
		user    0m22.745s
	sys     0m0.496s
	
	awk '$5+$6-$4 >= 3 && $4 <= 1' out.indelsoa > out.indelsoa.filter
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq.pl SNPfilter -d 1 -s out.indelsoa -F out.indelpe c\
	ns.snp &> out.SNPfilter
	
	real    0m0.061s
	user    0m0.002s
	sys     0m0.010s
	
	Run time: 00:34:16
	Completed /nethome/syoung/base/bin/nextgen/clusterMAQ.pl
	5:21PM, 12 August 2009
	****************************************


FAILED AT maq.pl BECAUSE OF INCORRECT PATH ('scripts' DIR MISSING). RERAN WITH CORRECT PATH:


cd /mihg/data/NGS/syoung/base/pipeline/profile1/maq
time /nethome/syoung/base/apps/maq/0.7.1/scripts/maq.pl SNPfilter -d 1 -s out.indelsoa -F out.indelpe cns.snp &> out.SNPfilter

ll

	-rw-rw----+  1 syoung bioinfo 1.3M Aug 12 17:15 assemble.log
	lrwxrwxrwx   1 syoung bioinfo   44 Aug 12 18:59 .#clusterMAQ-l1s1M.log -> syoung@ngsdev.ccs.miami.edu.14692:1241440567
	-rw-rw----+  1 syoung bioinfo 1.1M Aug 12 19:00 #clusterMAQ-l1s1M.log#
	-rw-rw----+  1 syoung bioinfo 1.1M Aug 12 17:19 clusterMAQ-l1s1M.log
	-rw-rw----+  1 syoung bioinfo  65M Aug 12 17:15 cns.fq
	-rw-rw----+  1 syoung bioinfo 6.0M Aug 12 17:15 cns.snp
	-rw-rw----+  1 syoung bioinfo  42M Aug 12 17:15 consensus.cns
	-rw-rw----+  1 syoung bioinfo  538 Aug 12 17:13 mapcheck.txt
	-rw-rw----+  1 syoung bioinfo  442 Aug 12 15:59 miniMAQ.log
	-rw-rw----+  1 syoung bioinfo  651 Aug 12 16:42 #miniMAQ.sh#
	-rw-rw----+  1 syoung bioinfo  660 Aug 12 15:55 miniMAQ.sh
	-rw-rw----+  1 syoung bioinfo    4 Aug 12 15:55 miniMAQ.sh~
	-rw-------+  1 syoung bioinfo    0 Aug 12 15:54 miniMAQ.sh.o70593
	-rw-------+  1 syoung bioinfo    0 Aug 12 15:57 miniMAQ.sh.o70595
	-rw-------+  1 syoung bioinfo    0 Aug 12 16:00 miniMAQ.sh.o70598
	-rw-rw----+  1 syoung bioinfo 5.2M Aug 12 17:18 out.indelpe
	-rw-rw----+  1 syoung bioinfo 766K Aug 12 17:19 out.indelsoa
	-rw-rw----+  1 syoung bioinfo  28K Aug 12 17:19 out.indelsoa.filter
	-rw-rw----+  1 syoung bioinfo 310M Aug 12 17:13 out.map
	-rw-rw----+  1 syoung bioinfo 270M Aug 12 17:18 out.rmdup
	-rw-rw----+  1 syoung bioinfo 1.9M Aug 13 05:05 out.SNPfilter
	-rw-rw----+  1 syoung bioinfo 1.7K Aug 12 16:48 splitfiles
	-rw-rw----+  1 syoung bioinfo 310M Aug 12 17:13 temp.map
	drwxrwx---+  2 syoung bioinfo 4.0K Aug 12 16:42 test





NOTES
-----

PROBLEM WITH USING THE 	-k oe  SWITCH:

ERROR WITH l1s1M JOB:


PBS Job Id: 70655.kronos.ccs.miami.edu
Job Name:   l1s1M
An error has occurred processing your job, see below.
Post job file processing error; job 70655.kronos.ccs.miami.edu on host n03/2

Unable to copy file /var/spool/torque/spool/70655.krono.OU to syoung@ngsdev.ccs.miami.edu:/mihg/data/NGS/syoung/base/pipeline/profile1/maq/11/l1s1M.o70655
>>> error from copy
ssh: connect to host ngsdev.ccs.miami.edu port 22: Network is unreachable
lost connection
>>> end error output
Output retained on that host in: /var/spool/torque/undelivered/70655.krono.OU






</entry>

<entry [Wed Aug 12 23:07:11 EDT 2009] USE FLEMINGTON DATA TO RUN 7 LANES, image2eland.pl WITH 8 CPUs>


/mihg/data/solexa/090515_HWI-EAS185_0005_4299MAAXX_EFlemington_1-4


LATER: TEST image2eland.pl ON THE DATA WITH 8 CPUs


cluster-image2eland.pl

casava

maq





cat $PBS_NODEFILE








</entry>

<entry [Sat] Aug  1 06:24:24 EDT 2009>
SQUASHED HUMAN CHR1 FOR USE WITH ELAND

mkdir /nethome/syoung/.aqwa/syoung/Project1/Workflow1/chr1
cd /nethome/syoung/.aqwa/syoung/Project1/Workflow1/chr1

1. SQUASH CHR1.FA

/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/squashGenome `pwd` chr1.fa
	User: 0s System: 0s Actual: 1.6e-05s Efficiency: 0%
	Full file path: chr1.fa
	Extracted file name:chr1.fa
	/nethome/syoung/.aqwa/syoung/Project1/Workflow1/chr1.fa.2bpb /nethome/syoung/.aqwa/syoung/Project1/Workflow1/chr1.fa.vld
	squash: opened file chr1.fa of size 252194720 bytes.
	finished file chr1.fa
	247249719 bases
	224999719 valid bases (91.001%)
	39 valid regions
	User: 2.36764s System: 9.10362s Actual: 14.1926s Efficiency: 80.8257%

GENERATED

	-rw-r--r-- 1 syoung bioinfo 241M Jul 29 08:04 chr1.fa
	-rw-r--r-- 1 syoung bioinfo  59M Aug  1 05:34 chr1.fa.2bpb
	-rw-r--r-- 1 syoung bioinfo  318 Aug  1 05:34 chr1.fa.vld



</entry>

<entry [Sat Aug  1 06:24:24 EDT 2009] RUN LIVE TEST OF AQWA ON HUMAN mtDNA DATA>


/nethome/syoung/base/bin/nextgen/miniMAQ.pl \
--outputdir /nethome/syoung/.aqwa/syoung/Project1/Workflow1/ \
--inputfile /nethome/syoung/.aqwa/syoung/Project1/Workflow1/s_1_1_sequence.100000.txt \
--referencefile /nethome/syoung/.aqwa/syoung/Project1/Workflow1/mtDNA/human-mtDNA-AC_000021.fasta

	OKAY!


1. COPY INPUT DATA

cd /nethome/syoung/base/pipeline/run2-human-mitochondria/data
ll

	-rw-r--r-- 1 syoung bioinfo  234 Jun  8 14:01 gerald_configfile.txt
	-rw-r--r-- 1 syoung bioinfo  338 Jun  8 13:58 gerald_configfile.txt~
	-rw-r--r-- 1 syoung bioinfo  17K Jun  8 13:59 human-mtDNA-AC_000021.fasta
	-rw-r--r-- 1 syoung bioinfo 4.1K Jun  8 14:00 human-mtDNA-AC_000021.fasta.2bpb
	-rw-r--r-- 1 syoung bioinfo   91 Jun  8 14:00 human-mtDNA-AC_000021.fasta.vld
	-rw-r--r-- 1 syoung bioinfo  17K Jun  8 14:01 human-mtDNA-AC_000021.sequence.fasta
	-rwxr-xr-x 1 syoung bioinfo 443M Jun  8 14:00 s_1_1_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 443M Jun  8 13:56 s_1_2_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 458M Jun  8 14:01 s_2_1_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 458M Jun  8 14:00 s_2_2_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 433M Jun  8 13:56 s_3_1_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 433M Jun  8 13:59 s_3_2_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 433M Jun  8 13:57 s_4_1_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 433M Jun  8 13:57 s_4_2_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 224M Jun  8 13:59 s_5_1_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 224M Jun  8 13:59 s_5_2_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 456M Jun  8 14:00 s_6_1_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 456M Jun  8 13:59 s_6_2_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 416M Jun  8 13:56 s_7_1_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 416M Jun  8 13:57 s_7_2_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 512M Jun  8 13:58 s_8_1_sequence.txt
	-rwxr-xr-x 1 syoung bioinfo 512M Jun  8 13:58 s_8_2_sequence.txt


cd ~/.aqwa/syoung/Project1/Workflow1/
mkdir mtDNA
cp human-mtDNA-AC_000021.* ~/.aqwa/syoung/Project1/Workflow1/mtDNA
cp s_*_1_sequence.txt ~/.aqwa/syoung/Project1/Workflow1/


2. CREATE 100,000 LINE PAIRED SEQUENCE FILES FOR TESTING:

cd ~/.aqwa/syoung/Project1/Workflow1/
chopfile s_1_1_sequence.txt s_1_1_sequence.100000.txt 100000
chopfile s_1_2_sequence.txt s_1_2_sequence.100000.txt 100000


cd /nethome/syoung/.aqwa/syoung/Project1/Workflow1
ll
drwxr-xr-x 2 syoung bioinfo   16384 Aug  1 05:56 chr1
drwxr-xr-x 2 syoung bioinfo   16384 Aug  1 05:55 mtDNA
drwxr-xr-x 2 syoung bioinfo   16384 Aug  1 05:56 run2-mtDNA
drwxr-xr-x 2 syoung bioinfo   16384 Aug  1 05:57 run3
-rw-r--r-- 1 syoung bioinfo 5293510 Aug  1 05:53 s_1_1_sequence.100000.txt
-rw-r--r-- 1 syoung bioinfo 5293510 Aug  1 05:53 s_1_2_sequence.100000.txt


3. RUN miniMAQ.pl

/nethome/syoung/base/bin/nextgen/miniMAQ.pl \
--outputdir /nethome/syoung/.aqwa/syoung/Project1/Workflow1/ \
--inputfile /nethome/syoung/.aqwa/syoung/Project1/Workflow1/s_1_1_sequence.100000.txt \
--referencefile /nethome/syoung/.aqwa/syoung/Project1/Workflow1/mtDNA/human-mtDNA-AC_000021.fasta


OUTPUTS THESE FILES:

-rw-r--r-- 1 syoung bioinfo 5293510 Aug  1 05:53 s_1_1_sequence.100000.txt
-rw-r--r-- 1 syoung bioinfo 5293510 Aug  1 05:53 s_1_2_sequence.100000.txt
drwxr-xr-x 2 syoung bioinfo   16384 Aug  1 05:56 run2-mtDNA
drwxr-xr-x 2 syoung bioinfo   16384 Aug  1 05:56 chr1
drwxr-xr-x 2 syoung bioinfo   16384 Aug  1 05:57 run3
-rw-r--r-- 1 syoung bioinfo       0 Aug  1 05:58 reanalysis_qseq.txt
-rw-rw-rw- 1 syoung bioinfo      78 Aug  1 06:06 splitfiles
drwxr-xr-x 2 syoung bioinfo   16384 Aug  1 06:06 mtDNA
drwxrwxrwx 2 syoung bioinfo   16384 Aug  1 06:06 1
-rw-rw-rw- 1 syoung bioinfo    9464 Aug  1 06:18 out.map
-rw-rw-rw- 1 syoung bioinfo     538 Aug  1 06:18 mapcheck.txt
-rw-rw-rw- 1 syoung bioinfo       0 Aug  1 06:18 out.indelsoa
-rw-rw-rw- 1 syoung bioinfo       0 Aug  1 06:18 out.indelpe
-rw-rw-rw- 1 syoung bioinfo   15396 Aug  1 06:18 consensus.cns
-rw-rw-rw- 1 syoung bioinfo    8712 Aug  1 06:18 assemble.log
-rw-rw-rw- 1 syoung bioinfo   33725 Aug  1 06:18 cns.fq
-rw-rw-rw- 1 syoung bioinfo    4259 Aug  1 06:18 cns.snp
-rw-rw-rw- 1 syoung bioinfo    9464 Aug  1 06:18 out.rmdup
-rw-rw-rw- 1 syoung bioinfo       0 Aug  1 06:18 out.indelsoa.filter
-rw-rw-rw- 1 syoung bioinfo    2578 Aug  1 06:18 out.SNPfilter



head out.SNPfilter
	-- 0 potential pe-indels pass the filter.
	gi|115315570|ref|AC_000021.2|   726     C       A       30      1       1.00    62      30      N       32      N
	gi|115315570|ref|AC_000021.2|   750     A       G       45      20      1.00    63      62      R       255     A
	gi|115315570|ref|AC_000021.2|   881     A       T       1       2       1.00    62      32      Y       29      C
	gi|115315570|ref|AC_000021.2|   1049    A       G       30      1       1.00    62      30      N       32      N
	gi|115315570|ref|AC_000021.2|   1137    A       W       29      2       1.00    63      32      A       1       T
	gi|115315570|ref|AC_000021.2|   1157    T       Y       24      2       1.00    62      32      T       5       C
	gi|115315570|ref|AC_000021.2|   1226    C       A       30      1       0.00    45      30      N       15      N
	gi|115315570|ref|AC_000021.2|   1232    A       C       30      1       0.00    45      30      N       0       N
	gi|115315570|ref|AC_000021.2|   1438    A       G       33      2       1.00    62      32      N       82      N


AND OUTPUTS:

	...
	0.95user 1.50system 0:02.51elapsed 98%CPU (0avgtext+0avgdata 0maxresident)k
	0inputs+0outputs (0major+104546minor)pagefaults 0swaps
	
	cd /nethome/syoung/.aqwa/syoung/Project1/Workflow1/
	Can't exec "cd": No such file or directory at /nethome/syoung/base/bin/nextgen/miniMAQ.pl line 298, <FILE> line 1.
	
	echo 'out.map: /nethome/syoung/.aqwa/syoung/Project1/Workflow1//out.map'
	out.map: /nethome/syoung/.aqwa/syoung/Project1/Workflow1//out.map
	
	echo 'time /nethome/syoung/base/apps/maq/0.7.1/maq mapmerge /nethome/syoung/.aqwa/syoung/Project1/Workflow1//out.map /nethome/syoung/.aqwa/syoung/Project1/Workflow1//1/out.map'
	time /nethome/syoung/base/apps/maq/0.7.1/maq mapmerge /nethome/syoung/.aqwa/syoung/Project1/Workflow1//out.map /nethome/syoung/.aqwa/syoung/Project1/Workflow1//1/out.map
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq mapmerge /nethome/syoung/.aqwa/syoung/Project1/Workflow1//out.map /nethome/syoung/.aqwa/syoung/Project1/Workflow1//1/out.map
	0.01user 0.00system 0:00.25elapsed 7%CPU (0avgtext+0avgdata 0maxresident)k
	0inputs+0outputs (0major+381minor)pagefaults 0swaps
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq mapcheck /nethome/syoung/.aqwa/syoung/Project1/Workflow1/mtDNA/human-mtDNA-AC_000021.fasta out.map > mapcheck.txt
	
	real    0m0.124s
	user    0m0.004s
	sys     0m0.011s
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq assemble consensus.cns /nethome/syoung/.aqwa/syoung/Project1/Workflow1/mtDNA/human-mtDNA-AC_000021.bfa out.map 2> assemble.log
	
	real    0m1.695s
	user    0m1.527s
	sys     0m0.128s
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq cns2fq consensus.cns > cns.fq
	
	real    0m0.266s
	user    0m0.008s
	sys     0m0.016s
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq cns2snp consensus.cns > cns.snp
	
	real    0m0.068s
	user    0m0.009s
	sys     0m0.012s
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq rmdup out.rmdup out.map
	[maq_rmdup_core] processing reference gi|115315570|ref|AC_000021.2|...
	[maq_rmdup_core] 0 / 0 = nan
	0.01user 0.01system 0:00.08elapsed 27%CPU (0avgtext+0avgdata 0maxresident)k
	0inputs+0outputs (0major+433minor)pagefaults 0swaps
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq indelpe /nethome/syoung/.aqwa/syoung/Project1/Workflow1/mtDNA/human-mtDNA-AC_000021.bfa out.rmdup > out.indelpe
	
	real    0m0.036s
	user    0m0.009s
	sys     0m0.007s
	
	time /nethome/syoung/base/apps/maq/0.7.1/maq indelsoa /nethome/syoung/.aqwa/syoung/Project1/Workflow1/mtDNA/human-mtDNA-AC_000021.bfa out.map > out.indelsoa
	
	real    0m0.036s
	user    0m0.005s
	sys     0m0.014s
	
	awk '$5+$6-$4 >= 3 && $4 <= 1' out.indelsoa > out.indelsoa.filter
	
	time /nethome/syoung/base/apps/maq/0.7.1/scripts/maq.pl SNPfilter -d 1 -s out.indelsoa -F out.indelpe cns.snp &> out.SNPfilter
	
	real    0m1.690s
	user    0m0.040s
	sys     0m0.025s
	
	Run time: 00:00:08
	Completed /nethome/syoung/base/bin/nextgen/miniMAQ.pl
	6:19AM, 1 August 2009
	****************************************

















3. RUN ELAND - TEST WITH STANDALONE

**** CAN'T DO PAIRED ****

/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/eland_32 s_1_1_sequence.100000.txt /nethome/syoung/.aqwa/syoung/Project1/Workflow1/mtDNA --multi 










OPTIONS:

/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/eland_32


ELAND: Efficient Local Alignment of Nucleotide Data
Copyright (c) 2003-2006 Solexa Limited. All rights reserved.
Author: Anthony J. Cox

Publications incorporating data generated by the use of
this software or modified versions thereof should cite:
Anthony J. Cox.
Ultra high throughput alignment of short sequence tags.
In preparation.

WARNING: this software is compiled to process oligos of length 32.
To change this value, edit OLIGO_LENGTH and recompile.

Will use at most 25 bits in hash table
Can process at most 2147483647 oligos per batch
Will find all matches having 2 errors or less

syntax: /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/eland_32 oligoFile genomeDirectory outputFile[.vmf]
[--multi[=N0[,N1,N2]] [repeatFile]

oligoFile - file or directory of files
  file type deduced from first character of each file:
  '>' - fasta format
  '#' - single molecule array format
  [AGCTNagctn] - raw sequence format

genomeDirectory - directory of genome files
  preprocessed to 2-bits-per-base format using squashGenome.

outputFile - name of output file
  if name ends in '.vmf', use verbose match format
  else use format required by assembly module

--multi - output multiple hits per read
  at most N0,N1,N2 exact, 1-mismatch, 2-mismatch hits per read
repeatFile - list of repeats to exclude (optional)
  must be ASCII and in alphabetical order







OPTIONS:

ELAND STANDALONE GIVES ERROR DUE TO FASTQ HEADER:


#cd /nethome/syoung/.aqwa/syoung/Project1/Workflow1
#/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/ELAND_standalone.pl \
#--input-file s_1_1_sequence.100000.txt s_1_2_sequence.100000.txt \
#--input-type fastq \
#--eland-genome /nethome/syoung/.aqwa/syoung/Project1/Workflow1/mtDNA 

$VAR1 = {
          'read-length' => [
                             -1
                           ],
          'pair-params' => '--circular',
          'pipeline-dir' => '/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/..',
          'input-file' => [
                            's_1_1_sequence.100000.txt'
                          ],
          'seed-length' => [
                             -1
                           ],
          'output-prefix' => './reanalysis',
          'base-quality' => 30,
          'eland-genome' => '/nethome/syoung/.aqwa/syoung/Project1/Workflow1/mtDNA',
          'input-type' => 'fastq'
        };
/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/ELAND_standalone.pl: single input-file specified, will do single read analysis
/nethome/syoung/base/apps/GAPipeline-1.4.0/bin/ELAND_standalone.pl: deduced read length of 28 for data in s_1_1_sequence.100000.txt

Could not identify index of the following line: HWI-EAS185_1_20GVYAAXX_Jia_cDNA2_mtDNA_Total_Small_Medium_JH:1:16:527:816/1 
Please check your files.





 /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/ELAND_standalone.pl options

	--input-file|if 
	  must specify at least one file, specify two for paired analysis
	--input-type|it 
	  type of input file: fastq, fasta, export or qseq
	--read-length|rl
	  will work it out from input file(s) if not specified
	--seed-length|sl
	  length of read used for ELAND alignment 
	  - default is to min of read-length and 32
	--eland-genome|eg
	  full path of a squashed genome directory
	--output-prefix|op
	  will produce a set of output files whose names prefixed by this
	  - defaults to 'reanalysis'  
	--pipeline-dir|pd
	  path of pipeline installation to call 
	  - by default, looks in same dir as executable is found)
	--base-quality|bq
	  in fasta mode assume all bases have this quality
	  - default is set to 30
	--pair-params|pp
	  paired read analysis parameters to pass to pickBestPair
	  - multiple arguments must go in quotes
	  - defaults to '--circular' - treats all chromosomes as circular
	  NB: for a paired read analysis, both reads must share same
	  input-type, read-length and seed-length



+++</entry>

<entry [Sun July 26 10:17:04 EDT 2009] EXPLANATION OF REPORT MODULE DESIGN>

1. DECIDED NOT TO GO THE ROUTE OF STORING THE REPORT INFORMATION IN A DATABASE
TABLE AND ALLOWING ACCESS THROUGH PERMISSIONS. INSTEAD, PRINT TSV REPORT OUTPUT
TO THE USER'S HOME FOLDER IN PROJECT/WORKFLOW DIRECTORY, INCLUDING A '.params'
JSON FILE CONTAINING THE PARAMETERS USED TO GENERATE THE REPORT. THE NAME OF
THIS REPORT FILE WILL BE STORED IN THE report TABLE SO THAT IT CAN BE ACCESSED
BY THE USER OR GROUP MEMBERS WITH ACCESS PRIVILEGES. 
THIS WAY, THE PROJECT TSV OUTPUT IS IMMEDIATELY AVAILABLE FOR USE IN THE
WORKFLOW. ALSO, PERMISSION ISSUES CAN BE MANAGED BY THE GROUP SYSTEM.

2. THEREFORE, THE report TABLE STORES THE LIST OF ***SAVED*** REPORTS ATTACHED TO
EACH PROJECT/WORKFLOW (INCLUDING JSON PARAMETERS)


CREATE TABLE IF NOT EXISTS report
(
	project			VARCHAR(20),
    workflow        VARCHAR(20),
    report          VARCHAR(20),
	json			VARCHAR(20),
    datetime        DATETIME NOT NULL,
	
	PRIMARY KEY (project, workflow, report)
)


3. TO DO:

FILL OUT THESE STUBS IN Report/SNP.pm (OR INHERIT FROM Report.pm)


=head2

    SUBROUTINE     getReports
    
    PURPOSE
        
        1. Return a list of reports for the user
        
        2. Each report has permissions
        
	INPUTS
	
		1. USERNAME
		
		2. SESSION ID
		
	OUTPUTS
	
		1. LIST OF ALL REPORTS PREVIOUSLY SAVED BY THE USER
		
			A. OWNED BY THE USER, I.E., WITHIN PROJECT/WORKFLOWS
			
				IN THE USER'S HOME DIRECTORY
			
			B. ACCESSIBLE TO THE USER THROUGH GROUP PERMISSIONS,
			
				I.E., IN ANOTHER USER'S HOME DIRECTORY BUT THE
				
				END DATA IS VIEWABLE AND CAN BE COPIED TO THE
				
				USER'S HOME DIRECTORY IF HE/SHE HAS SUFFICIENT
				
				GROUP PERMISSIONS. IF THE USER CAN COPY THE
				
				REPORT INTO THEIR HOME DIRECTORY, THEY CAN CHANGE
				
				THE PARAMETERS OF THE REPORT AND GENERATE NEW
				
				OUTPUTS.

=cut

sub getReports
{
    my $self        =   shift;

    print "Report::SNP::saveReport    Report::SNP::saveReport()\n" if $DEBUG;
    
    my $dbobject = $self->{_dbobject};
    my $json = $self->{_json};    
    
}


=head2

    SUBROUTINE     saveReport
    
    PURPOSE
        
        1. SAVE A REPORT TO A USER'S HOME DIRECTORY
        
        2. THE SAVED FILE NAME IS BASED ON THE PROJECT AND
		
			WORKFLOW AND INCREMENTED NUMBER OF REPORTS IN
			
			THAT PARTICULAR WORKFLOW. ALTERNATELY, THE USER
			
			MAY SUPPLY THEIR OWN NAME FOR THE REPORT. IN
			
			EITHER CASE, THE REPORT WILL BE ASSIGNED A REPORT
			
			NUMBER IN THE report TABLE BASED ON ORDER OF
			
			CREATION.
        
=cut

sub saveReport
{
    my $self        =   shift;

    print "++++ Report::SNP::saveReport()\n" if $DEBUG;

    my $dbobject = $self->{_dbobject};
    my $json = $self->{_json};    
    
}





+++</entry>

<entry [Fri July 24 10:17:04 EDT 2009] DO SUID OF workflow.cgi>



TROUBLESHOOT PROJECT LOADING IN Project.pm line 1333:

"mode=fileSystem&username=admin&sessionId=1228791394.7868.158&query=%22Project1%2FWorkflow1-assembly%2Fexome%22&dojo.preventCache=1248258495719"


/* {
'name': 'exome',
'path': 'Project1/Workflow1-assembly/exome',
'total': '3',
'items': [
{
    'name': 'Admin-saveUsers.bsv',
    'path': 'Admin-saveUsers.bsv',
    'parentPath': 'Project1/Workflow1-assembly/exome',
    'parentDir': 'Project1/Workflow1-assembly/exome',
    'directory': false,
    'size': '348',
    'modified': 1248234904,
    'sample': 'Project1 project Next Generation Analysis Tools  bioinfo Bioinformatics Team\nsk' },
{
    'name': 'ccds',
    'path': 'ccds',
    'parentPath': 'Project1/Workflow1-assembly/exome',
    'parentDir': 'Project1/Workflow1-assembly/exome',
    'directory': true,
    'size': '4096',
    'modified': 1248235281,
    'children': [
        'archive'
    ]
},
{
    'name': 'ccdsGene-sqlite.sql',
    'path': 'ccdsGene-sqlite.sql',
    'parentPath': 'Project1/Workflow1-assembly/exome',
    'parentDir': 'Project1/Workflow1-assembly/exome',
    'directory': false,
    'size': '682',
    'modified': 1248190724,
    'sample': 'CREATE TABLE 'ccdsGene' (\n  'bin' smallint(5) NOT NULL default '0',\n  'name' var' }

]
} */




</entry>

<entry [Weds Jul 22 01:17:04 EDT 2009] IMPLEMENTED LDAP FOR AUTHENTICATION IN Admin.pm ON TOP OF SETUID MODEL>

TESTING:

1. CREATE INPUT FILE

emacs t/admin-login.json
{"mode":"login","username":"syoung","password":"XXXXX"}



2. ADD THIS LINE TO conf/default-linux.conf

LDAP_SERVER             ldap.ccs.miami.edu



3. RUN Admin.pm LOGIN USING LDAP AUTHENTICATION


perl -U admin.cgi < t/admin-login.json

	input: {"mode":"login","username":"admin","password":"admin"}
	username: admin
	project_pl: /data/aqwa/0.3/cgi-bin/putrelay.pl
	setown_command: chown syoung /data/aqwa/0.3/cgi-bin/putrelay.pl
	setuid_command: chmod u+s /data/aqwa/0.3/cgi-bin/putrelay.pl
	setgid_command: chmod g+s /data/aqwa/0.3/cgi-bin/putrelay.pl
	tempfile: /tmp/admin-temp.json
	Temp file contents:
	{"mode":"login","username":"admin","password":"admin"}command: perl -w /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/admin.pl < /tmp/admin-temp.json"
	run_command: perl -w /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/admin.pl < /tmp/admin-temp.json"
	Content-type: text/html
	
	1248255899.14509.869

OK!!


4. RUN Admin.pm TASKS USING NON-LDAP AUTHENTICATION

perl -U admin.cgi < t/admin-saveApp-runmaq-outputdir.json 
	Content-type: text/html
	
	{       status: 'Update success in apps table: 1'       }


WITH DEBUG OUTPUT:

perl -U admin.cgi < t/admin-saveApp-runmaq-outputdir.json 
input: {"username":"admin","sessionId":"1228791394.7868.158","mode":"saveApp","data":"{\"parentId\":\"adminRightPane_0-floatingPane\",\"name\":\"run-maq.pl\",\"type\":\"pipeline\",\"location\":\"pipeline/run-maq.pl\",\"description\":\"Wrapper to run MAQ on large data sets and handle memory constraints\",\"executor\":\"perl\",\"arguments\":{\"inputfile\":{\"params\":\"\",\"required\":\"true\",\"format\":\"fastq,bfq\",\"value\":\"\",\"args\":\"arguments.inputfile.value\",\"type\":\"file\",\"option\":\"--inputfile\",\"description\":\"Full path to FASTQ or binary FASTQ (.bfq) input file containing reads. If paired reads: provide two comma-separated filepaths (e.g., /.../read_1.fqstq,/.../read_2.fastq)\",\"paramFunction\":\"\"},\" reference\":{\"params\":\" \",\"required\":\" true\",\"format\":\"fasta,binaryFasta\",\"value\":\" \",\"args\":\"arguments.referencefile.value\",\"type\":\"file\",\"option\":\"--referencefile\",\"description\":\"Full path to FASTA (.fasta/.fa) or binary FASTA (.bfa) file containing reference sequence\",\"paramFunction\":\" \"},\" outputdir\":{\"option\":\"--outputdir\",\"value\":\" \",\"type\":\"directory\",\"format\":\" \",\"description\":\"Full path to output directory to print SNP output files\",\"required\":\" true\",\"args\":\"arguments.outputdir.value\",\"params\":\" \",\"paramFunction\":\" \"}},\"inputs\":{},\"outputs\":{},\"grandParentId\":\"currentRightPane\",\"id\":\"adminRightPane_0-floatingPane-template\"}"}
username: admin
project_pl: /data/aqwa/0.3/cgi-bin/putrelay.pl
setown_command: chown syoung /data/aqwa/0.3/cgi-bin/putrelay.pl
setuid_command: chmod u+s /data/aqwa/0.3/cgi-bin/putrelay.pl
setgid_command: chmod g+s /data/aqwa/0.3/cgi-bin/putrelay.pl
tempfile: /tmp/admin-temp.json
Temp file contents:
{"username":"admin","sessionId":"1228791394.7868.158","mode":"saveApp","data":"{\"parentId\":\"adminRightPane_0-floatingPane\",\"name\":\"run-maq.pl\",\"type\":\"pipeline\",\"location\":\"pipeline/run-maq.pl\",\"description\":\"Wrapper to run MAQ on large data sets and handle memory constraints\",\"executor\":\"perl\",\"arguments\":{\"inputfile\":{\"params\":\"\",\"required\":\"true\",\"format\":\"fastq,bfq\",\"value\":\"\",\"args\":\"arguments.inputfile.value\",\"type\":\"file\",\"option\":\"--inputfile\",\"description\":\"Full path to FASTQ or binary FASTQ (.bfq) input file containing reads. If paired reads: provide two comma-separated filepaths (e.g., /.../read_1.fqstq,/.../read_2.fastq)\",\"paramFunction\":\"\"},\" reference\":{\"params\":\" \",\"required\":\" true\",\"format\":\"fasta,binaryFasta\",\"value\":\" \",\"args\":\"arguments.referencefile.value\",\"type\":\"file\",\"option\":\"--referencefile\",\"description\":\"Full path to FASTA (.fasta/.fa) or binary FASTA (.bfa) file containing reference sequence\",\"paramFunction\":\" \"},\" outputdir\":{\"option\":\"--outputdir\",\"value\":\" \",\"type\":\"directory\",\"format\":\" \",\"description\":\"Full path to output directory to print SNP output files\",\"required\":\" true\",\"args\":\"arguments.outputdir.value\",\"params\":\" \",\"paramFunction\":\" \"}},\"inputs\":{},\"outputs\":{},\"grandParentId\":\"currentRightPane\",\"id\":\"adminRightPane_0-floatingPane-template\"}"}command: perl -w /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/admin.pl < /tmp/admin-temp.json"
run_command: perl -w /data/aqwa/0.3/cgi-bin/putrelay.pl syoung "perl /data/aqwa/0.3/cgi-bin/admin.pl < /tmp/admin-temp.json"
Content-type: text/html

{       status: 'Update success in apps table: 1'       }



</entry>

<entry [Weds Jul 22 01:17:04 EDT 2009] CONVERTED CGI SCRIPTS TO USE SETUID MODEL - ROOT SETUID master.cgi -> USER SETUID relay.pl -> ORIGINAL CGI script.pl>

TEST - OKAY

bash-3.2$ perl -U project.cgi "mode=fileSystem&query=Project1/Workflow1-assembly/exome&sessionId=1228791394.7868.158&username=admin"


username: admin
project_pl: /data/aqwa/0.3/cgi-bin/relay.pl
setown_command: chown syoung /data/aqwa/0.3/cgi-bin/relay.pl
setuid_command: chmod u+s /data/aqwa/0.3/cgi-bin/relay.pl
setgid_command: chmod g+s /data/aqwa/0.3/cgi-bin/relay.pl
run_command: perl -w /data/aqwa/0.3/cgi-bin/relay.pl syoung "perl /data/aqwa/0.3/cgi-bin/project.pl \"mode=fileSystem&query=Project1/Workflow1-assembly/exome&sessionId=1228791394.7868.158&username=admin\""
uid: 1008
gid: 1072
original_username: apache
original_real_uid: 48
original_effective_uid: 1008
original_real_gid: 48 48
original_effective_gid: 1072 48
original primary gid: 48
NEW real_user_id:        1008
NEW effective_user_id:   1008
NEW real_group_id:       1072 48
NEW effective_group_id:  1072 48
command: 
perl /data/aqwa/0.3/cgi-bin/project.pl "mode=fileSystem&query=Project1/Workflow1-assembly/exome&sessionId=1228791394.7868.158&username=syoung"
whoami: syoung
Content-type: text/html

/* {
'name': 'exome',
'path': 'Project1/Workflow1-assembly/exome',
'total': '3',
'items': [
{
    'name': 'Admin-saveUsers.bsv',
    'path': 'Admin-saveUsers.bsv',
    'parentPath': 'Project1/Workflow1-assembly/exome',
    'parentDir': 'Project1/Workflow1-assembly/exome',
    'directory': false,
    'size': '348',
    'modified': 1248215334,
    'sample': 'Project1 project Next Generation Analysis Tools  bioinfo Bioinformatics Team\nsk' },
{
    'name': 'ccds',
    'path': 'ccds',
    'parentPath': 'Project1/Workflow1-assembly/exome',
    'parentDir': 'Project1/Workflow1-assembly/exome',
    'directory': true,
    'size': '4096',
    'modified': 1248215711,
    'children': [
        'archive'
    ]
},
{
    'name': 'ccdsGene-sqlite.sql',
    'path': 'ccdsGene-sqlite.sql',
    'parentPath': 'Project1/Workflow1-assembly/exome',
    'parentDir': 'Project1/Workflow1-assembly/exome',
    'directory': false,
    'size': '682',
    'modified': 1248171154,
    'sample': 'CREATE TABLE 'ccdsGene' (\n  'bin' smallint(5) NOT NULL default '0',\n  'name' var' }

]
} */





</entry>

<entry [Fri Jul 17 11:34:04 EDT 2009] ADMIN APPS WIDGET DESIGN - USE DRAGGABLE FLOATING PANES TO DISPLAY DETAILED APPLICATION INFORMATION, EITHER FOR EXISTING OR 'NEW' APPLICATION>

REASONS FOR CHOICE:

1. USER CAN USE MULTIPLE PANES AT THE SAME TIME (UNLIKE DIALOGS)

2. USER CAN ARRANGE MULTIPLE VIEWS OF DIFFERENT APPLICATIONS IN THE SAME
SCREEN (UNLIKE TITLEPANES, WHICH ARE UPSIDE DOWN TOASTERS)





</entry>

<entry [Fri Jul 17 02:34:04 EDT 2009] USEFUL DOJO WIDGETS FOR OVERALL LAYOUT>


NICE WIZARD-TYPE STRUCTURE
//http://www.ensembl.org/biomart/martview/e61a39e4e8e306354f8f2a7a70bbc53c/e61a39e4e8e306354f8f2a7a70bbc53c


//http://localhost:8080/Bioptic0.2.5/html/dojo.1.2.2/demos/
//http://localhost:8080/Bioptic0.2.5/html/dojo.1.2.2/dojox/form/tests/test_SelectStack.html

 
//Real World Dojo part 5: Custom Components
//http://www.dotnetmafia.com/blogs/jamesashley/archive/2008/10/28/761.aspx


DIALOGUES
---------
LOGIN-TYPE 
http://localhost:8080/aqwa/html/dojo.1.2.2/dijit/tests/test_Dialog_focusDestroy.html

FANCY
http://localhost:8080/aqwa/html/dojo.1.2.2/dijit/tests/test_Dialog.html


GUI CONTROL
-----------
(PLACE IN core OR IN Controller.js FOR INDIVIDUAL PLUGIN, E.G., PROJECT)

DROP DOWN MENU
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/form/tests/test_DropDownSelect.html

LEFT BAR HIDE
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/layout/tests/test_ExpandoPane.html


WIZARDS
-------

STACK CONTAINER - GIVES PROCESS PROGRESS AND ALLOWS SCROLLABILITY BETWEEN PANES
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/layout/tests/test_RotatorContainer.html


SIMILAR, 'PLAYS' PANES IN ORDER:
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/layout/tests/test_RotatorContainer.html



WORKFLOW APPLICATIONS
---------------------
TITLE PANE (UPSIDE DOWN TOASTER)
http://localhost:8080/aqwa/html/dojo.1.2.2/dijit/tests/test_TitlePane.html




ADMIN APPLICATIONS
------------------
FLOATING PANE
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/layout/tests/test_FloatingPane.html


SNP REPORT
----------

USE THIS FOR LARGE DATA SETS
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/grid/tests/test_sizing_ResizeHandle.html

USE THIS FOR STYLING
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/grid/tests/test_styling.html

CHECKEDMULTISELECT - MULTIPLE CHECKBOXES IN A SELECT AND RADIOS IN A SELECT
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/form/tests/test_CheckedMultiSelect.html

DIFFERENT BUTTONS
http://localhost:8080/aqwa/html/dojo.1.2.2/dijit/tests/form/test_Button.html


</entry>

<entry [Thurs Jul 16 16:04:04 EDT 2009] EXTERNAL DATA SOURCE - UCSC - HIJACK 'SEND TO GALAXY' URL BY EMBEDDING AND CHANGING EMBEDDED PAGE>
<!--
EMBED IN plugins.html

	<object data=http://genome.ucsc.edu width="600" height="400"> <embed src=http://genome.ucsc.edu width="600" height="400"> </embed> Error: Embedded data could not be displayed. </object>


REPLACE HREF HERE:

 <INPUT TYPE=CHECKBOX NAME="sendToGalaxy" VALUE=on ><INPUT TYPE=HIDDEN NAME="boolshad.sendToGalaxy" VALUE

="0"> Send output to <A HREF="http://g2.bx.psu.edu" target=_BLANK>Galaxy</A></TD></TR>


E.G., CHANGE THE URL OF AN EMBEDDED PAGE

objectName.object.body

-->


</entry>

<entry [Tues Jul 14 16:04:04 EDT 2009] TEST SETUID WRITE TO .aqwa FOLDER IN /nethome/syoung>

perl -w msubMaster.pl syoung "/nethome/syoung/base/html/aqwa/trunk/fileroot/admin/" "/nethome/syoung/base/html/aqwa/trunk/fileroot/admin/scriptfile-admin.sh"

MESSAGE TO JOEL AND HPC:

	From: Young, Stuart 
	Sent: Tuesday, July 14, 2009 4:43 PM
	To: 'hpc@ccs.miami.edu'; Zysman, Joel
	Subject: .aqwa folders in home dir
	
	Hi Zongjun/Joel,
	
	I can create .aqwa folders in the home directories of the users with the setuid configuration we decided on yesterday and I can also accomplish the rest of the file manipulations using setuid as well (i.e., the folder doesn't have to be owned or accessible by apache). 


	perl -w msubMaster.pl clarke "/nethome/syoung/base/html/aqwa/trunk/fileroot/admin/" "/nethome/syoung/base/html/aqwa/trunk/fileroot/admin/scriptfile-admin.sh"
	
	user: clarke
	chdir: /nethome/syoung/base/html/aqwa/trunk/fileroot/admin/
	scriptfile: /nethome/syoung/base/html/aqwa/trunk/fileroot/admin/scriptfile-admin.sh
	uid: 1331
	gid: 1088
	original_username: apache
	original_real_uid: 48
	original_effective_uid: 1331
	original_real_gid: 48 48
	original_effective_gid: 892 48
	original primary gid: 48
	NEW real_user_id:        1331
	NEW effective_user_id:   1331
	NEW real_group_id:       892 48
	NEW effective_group_id:  892 48
	whoami: clarke
	Creating .aqwa directory in /nethome/clarke ...
	mkdir /nethome/clarke/.aqwa
	Create dir completed.
	Listing files in /nethome/clarke/.aqwa ...
	
	65280List completed.
	Writing file in /nethome/clarke/.aqwa ...
	File: /nethome/clarke/.aqwa/test.txt
	Write completed.
	View contents of file (created by user) in /nethome/clarke/.aqwa ...
	cat /nethome/clarke/.aqwa/test.txt
	#!/bin/sh
	
	echo 'Sleeping 5 seconds...'
	sleep 5;
	View done.
	Executing file /nethome/clarke/.aqwa/test.txt ...
	chmod 700 /nethome/clarke/.aqwa/test.txt; /nethome/clarke/.aqwa/test.txt;
	Sleeping 5 seconds...
	
	Is that okay or would you rather I send you the names of users to be added to the alpha-testers list? It may involve a few batches as I gradually recruit them
	
	Cheers,
	
	Stuart.
	
	
	
	Stuart Young
	Research Associate
	Center for Computational Science
	Leonard M. Miller School of Medicine
	1120 NW 14th St., CRB-1188 (C-213)
	Miami, FL 33136
	Tel. + 1 (305) 243-4539
	






</entry>

<entry [Mon Jul 13 18:30:04 EDT 2009] MESSAGE TO JOEL/ZONGJUN RE: ROOT--- ANYUSER SETUID CONFIGURATION WORKING>

From: Young, Stuart 
Sent: Monday, July 13, 2009 6:30 PM
To: Zysman, Joel; 'hpc@ccs.miami.edu'
Cc: Tsinoremas, Nick
Subject: Aqwa access (data/cluster)

Hi Joel/Zongjun,

Just to let you know, the root' setuid script (sets SUID of next script) ? anyuser' setuid script (runs MOAB) configuration we discussed just now works fine. I've implemented it as follows:

(on ngsdev, as apache')
cd /data/aqwa/0.3/cgi-bin
perl -w msubMaster.pl akumar "/nethome/syoung/base/html/aqwa/trunk/fileroot/admin/" "/nethome/syoung/base/html/aqwa/trunk/fileroot/admin/scriptfile-admin.sh"

This runs this script: msub.pl, which gives the following successful msub submit:


/usr/local/bin/msub /nethome/syoung/base/html/aqwa/trunk/fileroot/admin/scriptfile-admin.sh

60917

[syoung@ngsdev cgi-bin]$ mshow

active jobs------------------------
JOBID              USERNAME      STATE PROCS   REMAINING            STARTTIME

60892              echaussa    Running     1    14:02:03  Mon Jul 13 08:12:46
60738                syoung    Running     8  3:18:36:59  Sun Jul 12 12:47:41
60789                   him    Running    12  5:18:21:46  Sun Jul 12 21:32:29
60893                akumar    Running     6  6:16:09:52  Mon Jul 13 10:20:35
60894                akumar    Running     6  6:16:12:42  Mon Jul 13 10:23:25
60896                akumar    Running     6  6:16:21:44  Mon Jul 13 10:32:27
60904                akumar    Running     6  6:23:06:14  Mon Jul 13 17:16:57
60917                akumar    Running     1  6:23:59:47  Mon Jul 13 18:10:30   ? IT'S RUNNING!!

8 active jobs            46 of 240 processors in use by local jobs (19.17%)
                           7 of 30 nodes active      (23.33%)

Fyi, I had to manually set the UID and GID in the anyuser' script (i.e., in addition to the chmod u+s and chmod g+s commands run by the root' script) in order for MOAB to recognize the job as being sent by the particular user (i.e., MOAB looks for the read_uid and real_gid that are set within the script to identify the owner of the job). Otherwise, the job will be labeled as owned by  apache' and put in the deferred queue.

By setting the group to mihg-data-solexa', all users also have read access to the archived NGS data in /mihg/data/solexa. If we need more restricted access, I can set this differently as required.
 
As we discussed just now, I'll configure the system to use a .aqwa' folder in my home directory and test it with and without apache ownership and then send you a list of alpha testers so you can create a similar directory in their home folders.

Cheers,

Stuart.


</entry>

<entry [Mon Jul 13 13:04:04 EDT 2009] NOTE USE OF bigWig FORMAT BY UCSC>

bigWig Track Format
http://genome.ucsc.edu/goldenPath/help/bigWig.html
(general: http://genome.ucsc.edu/FAQ/FAQformat)

The bigWig format is for display of dense, continuous data that will be displayed in the Genome Browser as a graph. BigWig files are created initially from wiggle (wig) type files, using the program wigToBigWig. The resulting bigWig files are in an indexed binary format. The main advantage of the bigWig files is that only the portions of the files needed to display a particular region are transferred to UCSC, so for large data sets bigWig is considerably faster than regular wiggle files. The bigWig file remains on your web accessible server (http, https, or ftp), not on the UCSC server. Only the portion that is needed for the chromosomal position you are currently viewing is locally cached as a "sparse file".

Wiggle data must be continuious and the elements must be equally sized. See this page for help in selecting a graphing track data format that is most approriate for the type of data you have.

At this time the wigToBigWig utility uses a lot of memory. We are currently working to reduce the amount of RAM it takes to run the program. When this message is no longer on this page, the problem has been solved.

To create a bigWig track, follow these steps:

   1. Create a wig format file following the directions here. Note that when converting a wig file to a bigWig file, you are limited to one track of data in your input file; you must create a separate wig file for each data track.
   2. Remove any existing 'track' or 'browser' lines from your wig file so that it contains only data.
   3. Download the wigToBigWig program from the directory of binary utilities.
   4. Use the fetchChromSizes script from the same directory to create the chrom.sizes file for the UCSC database you are working with (e.g. hg19).
   5. Create the bigWig file from your wig file using the wigToBigWig utility like so: wigToBigWig input.wig.gz chrom.sizes myBigWig.bw
   6. Move the newly created bigWig file (myBigWig.bw) to a http, https, or ftp location.
   7. Construct a custom track using a single track line. Note that any of the track attributes listed on the wiggle track format page are applicable to tracks of type bigWig. The most basic version of the "track" line will look something like this:
      track type=bigWig name="My Big Wig" description="A Graph of Data from My Lab" dataUrl=http://myorg.edu/mylab/myBigWig.bw
   8. Paste this custom track line into the text box in the custom track management page. 

Example One

In this example, you will use an existing bigWig file to create a bigWig custom track. A bigWig file that spans chromosome 21 on the hg19 assembly has been placed on our http server. You can create a custom track using this bigWig file by constructing a "track" line that references this file like so:
track type=bigWig name="Example One" description="A bigWig file" dataUrl=http://genome.ucsc.edu/goldenPath/help/bigWigExample.bw

Include the following "browser" line to ensure that the custom track opens at the correct position:
browser position chr21:33,031,597-33,041,570

Paste the "browser" line and "track" line into the custom track management page for the human assembly hg19 (Feb. 2009), then press the submit button. On the following page, press the chr21 link in the custom track listing to view the bigWig track in the Genome Browser.

Example Two

In this example, you will create your own bigWig file from an existing wiggle file.

    * Save this wiggle file to your machine (this satisfies steps 1 and 2 above).
    * Save this text file to your machine. It contains the chrom.sizes for the human (hg19) assembly (this satisfies step 4 above).
    * Download the wigToBigWig utility (see step 3).
    * Run the utility to create the bigWig output file (see step 5):
      wigToBigWig wigVarStepExample.gz hg19.chrom.sizes myBigWig.bw
    * Place the bigWig file you just created (myBigWig.bw) on a web-accessible server (see step 6).
    * Construct a "track" line that points to your bigWig file (see step 7).
    * Create the custom track on the human assembly hg19 (Feb. 2009), and view it in the genome browser (see step 8). Note that the original wiggle file spans only chromsome 21. 

	



</entry>

<entry [Sun Jul 12 23:19:04 EDT 2009] DESIGN DECISION: USE msub.pl AS EXECUTABLE TO RUN CLUSTER WITH SETUID>

AVOIDS COMPLICATION OF DEBUGGING ALL MODULES USED IN workflow.cgi FOR SETUID COMPLIANCE



PERLSEC(1)             Perl Programmers Reference Guide             PERLSEC(1)



NNAAME
       perlsec - Perl security

DDEESSCCRRIIPPTTIIOONN
       Perl is designed to make it easy to program securely even when running
       with extra privileges, like setuid or setgid programs.  Unlike most
       command line shells, which are based on multiple substitution passes on
       each line of the script, Perl uses a more conventional evaluation
       scheme with fewer hidden snags.  Additionally, because the language has
       more builtin functionality, it can rely less upon external (and possi-
       bly untrustworthy) programs to accomplish its purposes.

       Perl automatically enables a set of special security checks, called
       _t_a_i_n_t _m_o_d_e, when it detects its program running with differing real and
       effective user or group IDs.  The setuid bit in Unix permissions is
       mode 04000, the setgid bit mode 02000; either or both may be set.  You
       can also enable taint mode explicitly by using the --TT command line
       flag. This flag is _s_t_r_o_n_g_l_y suggested for server programs and any pro-
       gram run on behalf of someone else, such as a CGI script. Once taint
       mode is on, it's on for the remainder of your script.

       While in this mode, Perl takes special precautions called _t_a_i_n_t _c_h_e_c_k_s
       to prevent both obvious and subtle traps.  Some of these checks are
       reasonably simple, such as verifying that path directories aren't
       writable by others; careful programmers have always used checks like
       these.  Other checks, however, are best supported by the language
       itself, and it is these checks especially that contribute to making a
       set-id Perl program more secure than the corresponding C program.

       You may not use data derived from outside your program to affect some-
       thing else outside your program--at least, not by accident.  All com-
       mand line arguments, environment variables, locale information (see
       perllocale), results of certain system calls ("readdir()", "read-
       link()", the variable of "shmread()", the messages returned by
       "msgrcv()", the password, gcos and shell fields returned by the "getp-
       wxxx()" calls), and all file input are marked as "tainted".  Tainted
       data may not be used directly or indirectly in any command that invokes
       a sub-shell, nor in any command that modifies files, directories, or
       processes, wwiitthh tthhee ffoolllloowwiinngg eexxcceeppttiioonnss:

       ·   Arguments to "print" and "syswrite" are nnoott checked for tainted-
           ness.

       ·   Symbolic methods

               $obj->$method(@args);

           and symbolic sub references

               &{$foo}(@args);
               $foo->(@args);

           are not checked for taintedness.  This requires extra carefulness
           unless you want external data to affect your control flow.  Unless
           you carefully limit what these symbolic values are, people are able
           to call functions oouuttssiiddee your Perl code, such as POSIX::system, in
           which case they are able to run arbitrary external code.

       For efficiency reasons, Perl takes a conservative view of whether data
       is tainted.  If an expression contains tainted data, any subexpression
       may be considered tainted, even if the value of the subexpression is
       not itself affected by the tainted data.

       Because taintedness is associated with each scalar value, some elements
       of an array or hash can be tainted and others not.  The keys of a hash
       are never tainted.

       For example:

           $arg = shift;               # $arg is tainted
           $hid = $arg, 'bar';         # $hid is also tainted
           $line = <>;                 # Tainted
           $line = <STDIN>;            # Also tainted
           open FOO, "/home/me/bar" or die $!;
           $line = <FOO>;              # Still tainted
           $path = $ENV{'PATH'};       # Tainted, but see below
           $data = 'abc';              # Not tainted

           system "echo $arg";         # Insecure
           system "/bin/echo", $arg;   # Considered insecure
                                       # (Perl doesn't know about /bin/echo)
           system "echo $hid";         # Insecure
           system "echo $data";        # Insecure until PATH set

           $path = $ENV{'PATH'};       # $path now tainted

           $ENV{'PATH'} = '/bin:/usr/bin';
           delete @ENV{'IFS', 'CDPATH', 'ENV', 'BASH_ENV'};

           $path = $ENV{'PATH'};       # $path now NOT tainted
           system "echo $data";        # Is secure now!

           open(FOO, "< $arg");        # OK - read-only file
           open(FOO, "> $arg");        # Not OK - trying to write

           open(FOO,"echo $arg?");     # Not OK
           open(FOO,"-?")
               or exec 'echo', $arg;   # Also not OK

           $shout = echo $arg;       # Insecure, $shout now tainted

           unlink $data, $arg;         # Insecure
           umask $arg;                 # Insecure

           exec "echo $arg";           # Insecure
           exec "echo", $arg;          # Insecure
           exec "sh", '-c', $arg;      # Very insecure!

           @files = <*.c>;             # insecure (uses readdir() or similar)
           @files = glob('*.c');       # insecure (uses readdir() or similar)

           # In Perl releases older than 5.6.0 the <*.c> and glob('*.c') would
           # have used an external program to do the filename expansion; but in
           # either case the result is tainted since the list of filenames comes
           # from outside of the program.

           $bad = ($arg, 23);          # $bad will be tainted
           $arg, true;               # Insecure (although it isn't really)

       If you try to do something insecure, you will get a fatal error saying
       something like "Insecure dependency" or "Insecure $ENV{PATH}".

       The exception to the principle of "one tainted value taints the whole
       expression" is with the ternary conditional operator "?:".  Since code
       with a ternary conditional

           $result = $tainted_value ? "Untainted" : "Also untainted";

       is effectively

           if ( $tainted_value ) {
               $result = "Untainted";
           } else {
               $result = "Also untainted";
           }

       it doesn't make sense for $result to be tainted.

       LLaauunnddeerriinngg aanndd DDeetteeccttiinngg TTaaiinntteedd DDaattaa

       To test whether a variable contains tainted data, and whose use would
       thus trigger an "Insecure dependency" message, you can use the
       "tainted()" function of the Scalar::Util module, available in your
       nearby CPAN mirror, and included in Perl starting from the release
       5.8.0.  Or you may be able to use the following "is_tainted()" func-
       tion.

           sub is_tainted {
               return ! eval { eval("#" . substr(join("", @_), 0, 0)); 1 };
           }

       This function makes use of the fact that the presence of tainted data
       anywhere within an expression renders the entire expression tainted.
       It would be inefficient for every operator to test every argument for
       taintedness.  Instead, the slightly more efficient and conservative
       approach is used that if any tainted value has been accessed within the
       same expression, the whole expression is considered tainted.

       But testing for taintedness gets you only so far.  Sometimes you have
       just to clear your data's taintedness.  Values may be untainted by
       using them as keys in a hash; otherwise the only way to bypass the
       tainting mechanism is by referencing subpatterns from a regular expres-
       sion match.  Perl presumes that if you reference a substring using $1,
       $2, etc., that you knew what you were doing when you wrote the pattern.
       That means using a bit of thought--don't just blindly untaint anything,
       or you defeat the entire mechanism.  It's better to verify that the
       variable has only good characters (for certain values of "good") rather
       than checking whether it has any bad characters.  That's because it's
       far too easy to miss bad characters that you never thought of.

       Here's a test to make sure that the data contains nothing but "word"
       characters (alphabetics, numerics, and underscores), a hyphen, an at
       sign, or a dot.

           if ($data =~ /^([-\@\w.]+)$/) {
               $data = $1;                     # $data now untainted
           } else {
               die "Bad data in '$data'";      # log this somewhere
           }

       This is fairly secure because "/\w+/" doesn't normally match shell
       metacharacters, nor are dot, dash, or at going to mean something spe-
       cial to the shell.  Use of "/.+/" would have been insecure in theory
       because it lets everything through, but Perl doesn't check for that.
       The lesson is that when untainting, you must be exceedingly careful
       with your patterns.  Laundering data using regular expression is the
       _o_n_l_y mechanism for untainting dirty data, unless you use the strategy
       detailed below to fork a child of lesser privilege.

       The example does not untaint $data if "use locale" is in effect,
       because the characters matched by "\w" are determined by the locale.
       Perl considers that locale definitions are untrustworthy because they
       contain data from outside the program.  If you are writing a locale-
       aware program, and want to launder data with a regular expression
       containing "\w", put "no locale" ahead of the expression in the same
       block.  See "SECURITY" in perllocale for further discussion and exam-
       ples.

       SSwwiittcchheess OOnn tthhee ""##!!"" LLiinnee

       When you make a script executable, in order to make it usable as a com-
       mand, the system will pass switches to perl from the script's #!  line.
       Perl checks that any command line switches given to a setuid (or set-
       gid) script actually match the ones set on the #! line.  Some Unix and
       Unix-like environments impose a one-switch limit on the #!  line, so
       you may need to use something like "-wU" instead of "-w -U" under such
       systems.  (This issue should arise only in Unix or Unix-like environ-
       ments that support #! and setuid or setgid scripts.)

       TTaaiinntt mmooddee aanndd @@IINNCC

       When the taint mode ("-T") is in effect, the "." directory is removed
       from @INC, and the environment variables "PERL5LIB" and "PERLLIB" are
       ignored by Perl. You can still adjust @INC from outside the program by
       using the "-I" command line option as explained in perlrun. The two
       environment variables are ignored because they are obscured, and a user
       running a program could be unaware that they are set, whereas the "-I"
       option is clearly visible and therefore permitted.

       Another way to modify @INC without modifying the program, is to use the
       "lib" pragma, e.g.:

         perl -Mlib=/foo program

       The benefit of using "-Mlib=/foo" over "-I/foo", is that the former
       will automagically remove any duplicated directories, while the later
       will not.

       Note that if a tainted string is added to @INC, the following problem
       will be reported:

         Insecure dependency in require while running with -T switch

       CClleeaanniinngg UUpp YYoouurr PPaatthh

       For "Insecure $ENV{PATH}" messages, you need to set $ENV{'PATH'} to a
       known value, and each directory in the path must be absolute and non-
       writable by others than its owner and group.  You may be surprised to
       get this message even if the pathname to your executable is fully qual-
       ified.  This is _n_o_t generated because you didn't supply a full path to
       the program; instead, it's generated because you never set your PATH
       environment variable, or you didn't set it to something that was safe.
       Because Perl can't guarantee that the executable in question isn't
       itself going to turn around and execute some other program that is
       dependent on your PATH, it makes sure you set the PATH.

       The PATH isn't the only environment variable which can cause problems.
       Because some shells may use the variables IFS, CDPATH, ENV, and
       BASH_ENV, Perl checks that those are either empty or untainted when
       starting subprocesses. You may wish to add something like this to your
       setid and taint-checking scripts.

           delete @ENV{qw(IFS CDPATH ENV BASH_ENV)};   # Make %ENV safer

       It's also possible to get into trouble with other operations that don't
       care whether they use tainted values.  Make judicious use of the file
       tests in dealing with any user-supplied filenames.  When possible, do
       opens and such aafftteerr properly dropping any special user (or group!)
       privileges. Perl doesn't prevent you from opening tainted filenames for
       reading, so be careful what you print out.  The tainting mechanism is
       intended to prevent stupid mistakes, not to remove the need for
       thought.

       Perl does not call the shell to expand wild cards when you pass "sys-
       tem" and "exec" explicit parameter lists instead of strings with possi-
       ble shell wildcards in them.  Unfortunately, the "open", "glob", and
       backtick functions provide no such alternate calling convention, so
       more subterfuge will be required.

       Perl provides a reasonably safe way to open a file or pipe from a
       setuid or setgid program: just create a child process with reduced
       privilege who does the dirty work for you.  First, fork a child using
       the special "open" syntax that connects the parent and child by a pipe.
       Now the child resets its ID set and any other per-process attributes,
       like environment variables, umasks, current working directories, back
       to the originals or known safe values.  Then the child process, which
       no longer has any special permissions, does the "open" or other system
       call.  Finally, the child passes the data it managed to access back to
       the parent.  Because the file or pipe was opened in the child while
       running under less privilege than the parent, it's not apt to be
       tricked into doing something it shouldn't.

       Here's a way to do backticks reasonably safely.  Notice how the "exec"
       is not called with a string that the shell could expand.  This is by
       far the best way to call something that might be subjected to shell
       escapes: just never call the shell at all.

               use English '-no_match_vars';
               die "Can't fork: $!" unless defined($pid = open(KID, "-?"));
               if ($pid) {           # parent
                   while (<KID>) {
                       # do something
                   }
                   close KID;
               } else {
                   my @temp     = ($EUID, $EGID);
                   my $orig_uid = $UID;
                   my $orig_gid = $GID;
                   $EUID = $UID;
                   $EGID = $GID;
                   # Drop privileges
                   $UID  = $orig_uid;
                   $GID  = $orig_gid;
                   # Make sure privs are really gone
                   ($EUID, $EGID) = @temp;
                   die "Can't drop privileges"
                       unless $UID == $EUID  && $GID eq $EGID;
                   $ENV{PATH} = "/bin:/usr/bin"; # Minimal PATH.
                   # Consider sanitizing the environment even more.
                   exec 'myprog', 'arg1', 'arg2'
                       or die "can't exec myprog: $!";
               }

       A similar strategy would work for wildcard expansion via "glob",
       although you can use "readdir" instead.

       Taint checking is most useful when although you trust yourself not to
       have written a program to give away the farm, you don't necessarily
       trust those who end up using it not to try to trick it into doing some-
       thing bad.  This is the kind of security checking that's useful for
       set-id programs and programs launched on someone else's behalf, like
       CGI programs.

       This is quite different, however, from not even trusting the writer of
       the code not to try to do something evil.  That's the kind of trust
       needed when someone hands you a program you've never seen before and
       says, "Here, run this."  For that kind of safety, check out the Safe
       module, included standard in the Perl distribution.  This module allows
       the programmer to set up special compartments in which all system oper-
       ations are trapped and namespace access is carefully controlled.

       SSeeccuurriittyy BBuuggss

       Beyond the obvious problems that stem from giving special privileges to
       systems as flexible as scripts, on many versions of Unix, set-id
       scripts are inherently insecure right from the start.  The problem is a
       race condition in the kernel.  Between the time the kernel opens the
       file to see which interpreter to run and when the (now-set-id) inter-
       preter turns around and reopens the file to interpret it, the file in
       question may have changed, especially if you have symbolic links on
       your system.

       Fortunately, sometimes this kernel "feature" can be disabled.  Unfortu-
       nately, there are two ways to disable it.  The system can simply outlaw
       scripts with any set-id bit set, which doesn't help much.  Alternately,
       it can simply ignore the set-id bits on scripts.  If the latter is
       true, Perl can emulate the setuid and setgid mechanism when it notices
       the otherwise useless setuid/gid bits on Perl scripts.  It does this
       via a special executable called _s_u_i_d_p_e_r_l that is automatically invoked
       for you if it's needed.

       However, if the kernel set-id script feature isn't disabled, Perl will
       complain loudly that your set-id script is insecure.  You'll need to
       either disable the kernel set-id script feature, or put a C wrapper
       around the script.  A C wrapper is just a compiled program that does
       nothing except call your Perl program.   Compiled programs are not sub-
       ject to the kernel bug that plagues set-id scripts.  Here's a simple
       wrapper, written in C:

           #define REAL_PATH "/path/to/script"
           main(ac, av)
               char **av;
           {
               execv(REAL_PATH, av);
           }

       Compile this wrapper into a binary executable and then make _i_t rather
       than your script setuid or setgid.

       In recent years, vendors have begun to supply systems free of this
       inherent security bug.  On such systems, when the kernel passes the
       name of the set-id script to open to the interpreter, rather than using
       a pathname subject to meddling, it instead passes _/_d_e_v_/_f_d_/_3.  This is a
       special file already opened on the script, so that there can be no race
       condition for evil scripts to exploit.  On these systems, Perl should
       be compiled with "-DSETUID_SCRIPTS_ARE_SECURE_NOW".  The _C_o_n_f_i_g_u_r_e pro-
       gram that builds Perl tries to figure this out for itself, so you
       should never have to specify this yourself.  Most modern releases of
       SysVr4 and BSD 4.4 use this approach to avoid the kernel race condi-
       tion.

       Prior to release 5.6.1 of Perl, bugs in the code of _s_u_i_d_p_e_r_l could
       introduce a security hole.

       PPrrootteeccttiinngg YYoouurr PPrrooggrraammss

       There are a number of ways to hide the source to your Perl programs,
       with varying levels of "security".

       First of all, however, you _c_a_n_'_t take away read permission, because the
       source code has to be readable in order to be compiled and interpreted.
       (That doesn't mean that a CGI script's source is readable by people on
       the web, though.)  So you have to leave the permissions at the socially
       friendly 0755 level.  This lets people on your local system only see
       your source.

       Some people mistakenly regard this as a security problem.  If your pro-
       gram does insecure things, and relies on people not knowing how to
       exploit those insecurities, it is not secure.  It is often possible for
       someone to determine the insecure things and exploit them without view-
       ing the source.  Security through obscurity, the name for hiding your
       bugs instead of fixing them, is little security indeed.

       You can try using encryption via source filters (Filter::* from CPAN,
       or Filter::Util::Call and Filter::Simple since Perl 5.8).  But crackers
       might be able to decrypt it.  You can try using the byte code compiler
       and interpreter described below, but crackers might be able to de-com-
       pile it.  You can try using the native-code compiler described below,
       but crackers might be able to disassemble it.  These pose varying
       degrees of difficulty to people wanting to get at your code, but none
       can definitively conceal it (this is true of every language, not just
       Perl).

       If you're concerned about people profiting from your code, then the
       bottom line is that nothing but a restrictive licence will give you
       legal security.  License your software and pepper it with threatening
       statements like "This is unpublished proprietary software of XYZ Corp.
       Your access to it does not give you permission to use it blah blah
       blah."  You should see a lawyer to be sure your licence's wording will
       stand up in court.

       UUnniiccooddee

       Unicode is a new and complex technology and one may easily overlook
       certain security pitfalls.  See perluniintro for an overview and perlu-
       nicode for details, and "Security Implications of Unicode" in perluni-
       code for security implications in particular.

       AAllggoorriitthhmmiicc CCoommpplleexxiittyy AAttttaacckkss

       Certain internal algorithms used in the implementation of Perl can be
       attacked by choosing the input carefully to consume large amounts of
       either time or space or both.  This can lead into the so-called _D_e_n_i_a_l
       _o_f _S_e_r_v_i_c_e (DoS) attacks.

       ·   Hash Function - the algorithm used to "order" hash elements has
           been changed several times during the development of Perl, mainly
           to be reasonably fast.  In Perl 5.8.1 also the security aspect was
           taken into account.

           In Perls before 5.8.1 one could rather easily generate data that as
           hash keys would cause Perl to consume large amounts of time because
           internal structure of hashes would badly degenerate.  In Perl 5.8.1
           the hash function is randomly perturbed by a pseudorandom seed
           which makes generating such naughty hash keys harder.  See
           "PERL_HASH_SEED" in perlrun for more information.

           The random perturbation is done by default but if one wants for
           some reason emulate the old behaviour one can set the environment
           variable PERL_HASH_SEED to zero (or any other integer).  One possi-
           ble reason for wanting to emulate the old behaviour is that in the
           new behaviour consecutive runs of Perl will order hash keys differ-
           ently, which may confuse some applications (like Data::Dumper: the
           outputs of two different runs are no more identical).

           PPeerrll hhaass nneevveerr gguuaarraanntteeeedd aannyy oorrddeerriinngg ooff tthhee hhaasshh kkeeyyss, and the
           ordering has already changed several times during the lifetime of
           Perl 5.  Also, the ordering of hash keys has always been, and
           continues to be, affected by the insertion order.

           Also note that while the order of the hash elements might be ran-
           domised, this "pseudoordering" should nnoott be used for applications
           like shuffling a list randomly (use _L_i_s_t_:_:_U_t_i_l_:_:_s_h_u_f_f_l_e_(_) for that,
           see List::Util, a standard core module since Perl 5.8.0; or the
           CPAN module Algorithm::Numerical::Shuffle), or for generating per-
           mutations (use e.g. the CPAN modules Algorithm::Permute or Algo-
           rithm::FastPermute), or for any cryptographic applications.

       ·   Regular expressions - Perl's regular expression engine is so called
           NFA (Non-Finite Automaton), which among other things means that it
           can rather easily consume large amounts of both time and space if
           the regular expression may match in several ways.  Careful crafting
           of the regular expressions can help but quite often there really
           isn't much one can do (the book "Mastering Regular Expressions" is
           required reading, see perlfaq2).  Running out of space manifests
           itself by Perl running out of memory.

       ·   Sorting - the quicksort algorithm used in Perls before 5.8.0 to
           implement the _s_o_r_t_(_) function is very easy to trick into misbehav-
           ing so that it consumes a lot of time.  Nothing more is required
           than resorting a list already sorted.  Starting from Perl 5.8.0 a
           different sorting algorithm, mergesort, is used.  Mergesort is
           insensitive to its input data, so it cannot be similarly fooled.

       See <http://www.cs.rice.edu/~scrosby/hash/> for more information, and
       any computer science text book on the algorithmic complexity.

SSEEEE AALLSSOO
       perlrun for its description of cleaning up environment variables.



perl v5.8.8                       2006-01-07                        PERLSEC(1)


</entry>

<entry [Fri Jul 10 16:19:04 EDT 2009] SET UID FOR AQWA USER FOR SUBMIT TO CLUSTER>

MANUAL CHANGE WORKS:

SCRIPT

	# ORIGINAL USER
	my $uid = $<;
	print "uid: $uid\n";
	#my $username = "apache";
	my $username = "skhuri";
	my $new_gid = getgrnam($username);
	my $new_uid = getpwnam($username);
	print "new_uid $username: $new_uid\n";
	
	#### GET UID
	my $real_user_id       = $<; # Grab all the original values
	my $effective_user_id  = $>; # so we can reset everything 
	my $real_group_id      = $(; # when we are done with root access
	my $effective_group_id = $); # 
	print "real_user_id: $real_user_id\n";
	print "effective_user_id: $effective_user_id\n";
	print "real_group_id: $real_group_id\n";
	print "effective_group_id: $effective_group_id\n";
	
	#### SET UID
	$< = $>= $new_uid;
	$real_user_id       = $<; # Grab all the original values
	print "real_user_id: $real_user_id\n";
	print "Should be $username\'s UID: $new_uid\n";

CHANGE OWNERSHIP TO ROOT AND SETUID:

	sudo su
	chown root testsuid.pl
	chmod u+s testsuid.pl


RUN:


	[syoung@ngsdev cgi-bin]$ perl -w testsuid.pl
	Using lib: /data/aqwa/0.3/cgi-bin/lib
	uid: 1008
	new_uid skhuri: 1143
	real_user_id: 1008
	effective_user_id: 0
	real_group_id: 1072 1072 918 892 710 702 669
	effective_group_id: 1072 1072 918 892 710 702 669
	real_user_id: 1143
	Should be skhuri's UID: 1143

OK!!


ALTERNATELY, USE A PERL MODULE TO SET THE 'SAVED USER ID' AS WELL:


TEST INSTALL OF Proc::UID

cd /nethome/syoung/base/perlmods/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
ls
	auto  Proc

REQUIRES ROOT TO RUN:

[syoung@ngsdev x86_64-linux-thread-multi]$ perl -e 'use Proc::UID qw(:funcs); drop_gid_perm(48);';
Could not permanently drop privs. at -e line 1.
[syoung@ngsdev x86_64-linux-thread-multi]$ sudo su
[root@ngsdev x86_64-linux-thread-multi]#  perl -e 'use Proc::UID qw(:funcs); drop_gid_perm(48);';
[root@ngsdev x86_64-linux-thread-multi]# 

PROBLEM

testsuid.pl GIVES ERROR WHEN RUN AS syoung OR root:

Can't locate loadable object for module Proc::UID in @...


DIAGNOSIS

NEEDS THESE FILES IN auto DIR:

.packlist
UID.bs
UID.so

SOLUTION

COPIED auto/Proc DIRECTORY TO:
su
/data/aqwa/0.3/lib/5.8.8/x86_64-linux-thread-multi/auto


PROBLEM

WHEN RUNNING script with UID SET AS ROOT GET THIS ERROR:

Args must match #! line at testsuid.pl line 1.

DIAGNOSIS

Args must match #! line
(F) The setuid emulator requires that the arguments Perl was invoked with match the arguments specified on the #! line. Since some systems impose a one-argument limit on the #! line, try combining switches; for example, turn -w -U into -wU.

SOLUTION

USE -w ARGUMENT

[syoung@ngsdev cgi-bin]$ perl -w testsuid.pl
Can't do setuid (cannot exec sperl)



PROBLEM

GET THIS ERROR WHEN RUNNING SETUID SCRIPT

	[syoung@ngsdev cgi-bin]$ perl -w testsuid.pl
	Can't do setuid (cannot exec sperl)

DIAGNOSIS

	http://www.brandonchecketts.com/archives/fix-for-centos-cant-do-setuid-cannot-exec-sperl
	If you are running a Perl script with the setuid bit, it actually runs a slightly modified version of Perl so that it is a bit more cautious. On a CentOS box, you need to install the perl-suidperl' package to get the necessary files installed. Otherwise you get an error like this:
	
	[root@host bin]# ls -al myscript.pl
	-rws--S--- 1 mail mail 1218 Oct  1 13:09 myscript.pl
	
	[root@host bin]# ./myscript.pl
	Can't do setuid (cannot exec sperl)

SOLUTION

sudo su
yum install perl-suidperl

	...
	Installed: perl-suidperl.x86_64 4:5.8.8-10.el5_0.2
	Complete!


WHICH REMOVES THE PREVIOUS ERROR BUT THEN I GET THIS

PROBLEM

	sudo su
	chown root:apache testsuid.pl
	chmod u+s testsuid.pl
	ll testsuid.pl
	
		-rwsr-xr-x 1 root apache 2.1K Jul 10 17:46 testsuid.pl

	[syoung@ngsdev cgi-bin]$ perl -w testsuid.pl
	Insecure dependency in require while running setuid at testsuid.pl line 41.
	BEGIN failed--compilation aborted at testsuid.pl line 41.

DIAGNOSIS

	**Data from an insecure source being passed to a function**
	
	http://coding.derkeiler.com/Archive/Perl/perl.beginners/2007-10/msg00543.html

	I'm not sure what you're trying to say. If you don't speak English
	well, please feel free to ask your question in a language that you're
	fluent in.
	
	Have you seen what the perldiag manpage has to say about that message?
	It means that the open() function was given data from a
	possibly-insecure source. That's probably a filename. If you're
	getting the filename from the user, you'll need to extract it from a
	pattern match, maybe something like this:
	
	chomp(my $filename = <STDIN>);
	if ($filename =~ /^(\w+)\z/) {
	$filename = $1; # extracted data is considered safe
	} else {
	die "Disallowed characters in filename: '$filename'";
	}
	open FILE, $filename or die "Can't open '$filename': $!";
	
	Good luck with it!
	
	--Tom Phoenix
	Stonehenge Perl Training



SOLUTION

ADDED THIS TO testsuid.pl
	
	
	
	if ($filename =~ /^(\w+)\z/) {
$filename = $1; # extracted data is considered safe
} else {
die "Disallowed characters in filename: '$filename'";
}





INSTALLED Proc::UID IN TEMP FOLDER HERE:

/nethome/syoung/base/perlmods/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi

WHICH CONTAINS:

auto/Proc/UID/UID.bs
auto/Proc/UID/UID.so
Proc/UID.pm

AND TRANSFERRED TO lib/5.8.8/x86_64-linux-thread-multi


use Proc::UID qw(:vars);
print "My saved-uid is $SUID, effective-uid is $EUID ",
	  "my real-uid is $RUID\n";

use Proc::UID qw(:funcs);
print "Permanently dropping privs to $new_gid and $new_uid\n";
drop_gid_perm($new_gid); # Throws an exception on failure.
drop_uid_perm($new_uid); # Throws an exception on failure.

print "Saved-UIDs are cached\n" if suid_is_cached();



http://www.freebsdwiki.net/index.php/Perl_setuid

To make it possible to run perl with temporarily elevated privileges for a particular task, you need to recompile perl:
# cd /usr/ports/lang/perl5.8 && make -DENABLE_SUIDPERL="YES" install clean
then you have to make sure your script is chmodded setuid:
# chmod 4755+s ./myscript.pl

and the ridiculously undocumented part - it still isn't going to "just run setuid." you have to change your uid within your perl code, something like this.
my $real_user_id       = $<; # Grab all the original values
my $effective_user_id  = $>; # so we can reset everything 
my $real_group_id      = $(; # when we are done with root access
my $effective_group_id = $); # 
$<=$>=0;                     # 0 is almost always OWNER root
$(=$)=0;                     # 0 is almost always GROUP wheel
#
# ...SOME PERL CODE...
#
$< = $real_user_id;          # Set everything back to original
$> = $effective_user_id;     # values.
$( = $real_group_id;         # 
$) = $effective_group_id;    # 



getpwuid 

DEFINITION

In a list context, returns a list of fields, as extracted from the /etc/passwd file, based on the user name specified by EXPR. It.s generally used like this:

($name, $passwd, $uid, $gid, $quota, $comment, $gcos, $dir, $shell) = getpwuid ($uid);

In a scalar context, returns the user name. If you are trying to access the whole /etc/passwd file, you should use the getpwent function. If you want to access the details by user name, use getpwnam.

Return Value

In scalar context user Name

In list context user record (name, password, user ID, group ID, quote, comment, real name, home directory, shell)

Example

Try out following example:

#!/usr/bin/perl

   ($name, $passwd, $uid, $gid, $quota,
	$comment, $gcos, $dir, $shell) = getpwuid(0);
   print "Name = $name\n";
   print "Password = $passwd\n";
   print "UID = $uid\n";
   print "GID = $gid\n";
   print "Quota = $quota\n";
   print "Comment = $comment\n";
   print "Gcos = $gcos\n";
   print "HOME DIR = $dir\n";
   print "Shell = $shell\n";


It will produce following result

Name = root
Password = *******
UID = 0
GID = 0
Quota =
Comment =
Gcos = root
HOME DIR = /root
Shell = /bin/bash




getpwnam - get passwd record given user login name

DESCRIPTION

These routines perform the same functions as their counterparts in the system library. In list context, the return values from the various get routines are as follows:

    ($name,$passwd,$uid,$gid,
       $quota,$comment,$gcos,$dir,$shell,$expire) = getpw*
    ($name,$passwd,$gid,$members) = getgr*
    ($name,$aliases,$addrtype,$length,@addrs) = gethost*
    ($name,$aliases,$addrtype,$net) = getnet*
    ($name,$aliases,$proto) = getproto*
    ($name,$aliases,$port,$proto) = getserv*
(If the entry doesn't exist you get a null list.)

In scalar context, you get the name, unless the function was a lookup by name, in which case you get the other thing, whatever it is. (If the entry doesn't exist you get the undefined value.) For example:

    $uid   = getpwnam($name);
    $name  = getpwuid($num);
    $name  = getpwent();
    $gid   = getgrnam($name);
    $name  = getgrgid($num;
    $name  = getgrent();
    #etc.
In getpw*() the fields $quota, $comment, and $expire are special cases in the sense that in many systems they are unsupported. If the $quota is unsupported, it is an empty scalar. If it is supported, it usually encodes the disk quota. If the $comment field is unsupported, it is an empty scalar. If it is supported it usually encodes some administrative comment about the user. In some systems the $quota field may be $change or $age, fields that have to do with password aging. In some systems the $comment field may be $class. The $expire field, if present, encodes the expiration period of the account or the password. For the availability and the exact meaning of these fields in your system, please consult your getpwnam(3) documentation and your pwd.h file. You can also find out from within Perl which meaning your $quota and $comment fields have and whether you have the $expire field by using the Config module and the values d_pwquota, d_pwage, d_pwchange, d_pwcomment, and d_pwexpire.

The $members value returned by getgr*() is a space separated list of the login names of the members of the group.

For the gethost*() functions, if the h_errno variable is supported in C, it will be returned to you via $? if the function call fails. The @addrs value returned by a successful call is a list of the raw addresses returned by the corresponding system library call. In the Internet domain, each address is four bytes long and you can unpack it by saying something like:

    ($a,$b,$c,$d) = unpack('C4',$addr[0]);
If you get tired of remembering which element of the return list contains which return value, by-name interfaces are also provided in modules: File::stat, Net::hostent, Net::netent, Net::protoent, Net::servent, Time::gmtime, Time::localtime, and User::grent. These override the normal built-in, replacing them with versions that return objects with the appropriate names for each field. For example:

   use File::stat;
   use User::pwent;
   $is_his = (stat($filename)->uid == pwent($whoever)->uid);
Even though it looks like they're the same method calls (uid), they aren't, because a File::stat object is different from a User::pwent object.


UNIX SETUID


Dean Mah

Member info | Full bio

[dmah has written 22 articles]

User since: June 05, 1999

Last login: July 09, 2009

Articles written: 22
In the last article I hinted, well I more than hinted, that you could run your CGI programs under a user other than the one that the Web server runs as. This practice is usually called setuid on executing or simply setuid. Setuid will allow you to run the program as the owner rather than as the Web user. So, if your program is owned by 'tom' it will execute as the user 'tom' rather than as user 'nobody.'

Why would I want to do this?

Usually the Web server runs as user 'nobody' which is an under-privileged user. This is okay as long as the files, scripts, programs, libraries, etc. you are using in your CGI program are accessible to everybody. However, there are times when you don't want these things publicly accessible.

For example, let's say that you have a file called my_diary.txt in your UNIX account that you want update from the Web. To allow the user 'nobody' to update this file, it will have to be world readable and writable. You can, of course, limit access to this file from the Web by setting up HTTP authentication (check out Anthony's .htaccess tutorial on how to do this). However, anyone on your UNIX server may be able to get at your file and update it as well. Probably not what you want.

Ideally, you'd like to set the permissions on your my_diary.txt file to be only readable and writable by you and the Web server. A common way to do this is by setting the permissions on the file to be readable and writable for the owner only and having your program run as setuid.

Cool, now how do I do this?

When last we looked at permissions on UNIX, we had three groups of permissions, one for the owner, one for the group, and one for everybody else. However, there's a fourth set of 'permissions' that we can apply to a file and these are general attributes to be associated with the file or directory. The general attributes are: set user id on executing (setuid), set group id on executing (setgid), and the sticky bit. (I've only every seen the sticky bit applied to directories and so I'll skip it in this article.) These attributes can be set with the command chmod using either method discussed last time.

Using the symbolic method we have:

chmod u+s - set the setuid bit.
chmod g+s - set the setgid bit.
chmod u+t - set the sticky bit or directories

or numerically:

chmod 4777 - setuid and read/write/execute for everyone.
chmod 2777 - setgid and read/write/execute for everyone.
chmod 1777 - set sticky bit and read/write/passthrough on a directory.

You can, of course, add the numbers up to combine permissions:

chmod 6777 - setuid/setgid and read/write/execute for everyone.

When you list your files with ls -l, setuid will show up as an 's' where the owner's execute permission would be, setgid will show up as an 's' where the group's execute permission would be, and the sticky bit will show up as a 't' where the other's execute permission would be. So you'd see something like:

-rws--S--x 1 dmah staff 6335 Jul 12 09:49 my_cgi

The first 's' means setuid. The second 's' means setgid. And if the sticky bit was set, you'd see a 't' in the last position of the permission string instead on an 'x'. The second 's' is capitalized because the group does not have execute permission on the file. So without the setuid and setgid bits, the permissions would be read/write/execute for the owner and execute for everyone else, or (-rwx-----x).

So the above program would run as user 'dmah' when the Web server executed it and not as user 'nobody.'

Caveats!

Now that you know how to do it, let me give you a few warnings. Running programs as setuid can be dangerous! The power that you get from running as a regular user rather than an under-privileged user also opens the program up for abuse and is a potential security risk.

Setuid allows your program to potentially be able to do anything that you can do from the command line as a normal user. That includes something like rm -fr * in your home directory. It's one of the reasons that a lot of ISPs will not provide you with your own CGI access. So I wouldn't write a setuid program without examining your program carefully for potential security holes as well as at least checking out the World Wide Web Security FAQ. The FAQ contains a lot of good information and some pointers to programs that will help protect you from potential pitfalls. But there's no substitute for careful code inspection by you and knowledgeable others you trust.

Fine, I understand the warning, but after setting setuid my scripts don't run anymore.

There's a couple of possible problems here that come up due to the security issues involved in running setuid scripts. In the above examples, I tried hard to talk only about setuid programs and by programs I mean binary executables. So if you had a C program that you compiled and ran as a CGI program, setuid should work as long as the program worked before. With scripts, there's a couple things to watch out for.

In most UNIX kernels there exists what is called a 'race condition' when executing scripts. Scripts are pieces of code which are interpreted by, strangely enough, interpreters. Common examples of interpreters are perl, sed, and awk. So when you have in your perl code #!/usr/local/bin/perl it tells the operating system to start executing the perl interpreter with the current script as input. Between the time that the perl interpreter starts executing and the time that it reads in your script the 'race condition' exists. At this time, a mischievous person could 'win the race' and be able to replace your script with another. And if your script is running as setuid, that person's script would run as your user! So their script could do anything that you could do from the command line. As a result, most UNIX kernels will disable users from running scripts as setuid. The most common way around this is to create a wrapper program around your script. A wrapper, in this context, is a small program, possibly written in C, that when executed will simply run your script. The 'race condition' does not exist for real executables and so you won't be thwarted by the kernel itself.

The second problem is that when running a perl script as setuid, you aren't really running normal perl. Perl recognizes that your script is setuid and will run a special version of itself called taintperl (you can force perl to run in this mode with the -t flag). Taintperl tries to protect you from doing things that might compromise security. Any data that comes from outside your program, like a Web form, is considered tainted. This data, or data derived from it, can't be used to affect things outside of your program. If you need to do this, you will have to de-taint your data before using it. This is a little outside the scope of this article. I'd recommend that if you don't already have it, invest in the Programming Perl book from O'Reilly.

That's it?!

Yup, that's all there is to it! ;) Running your programs or scripts as setuid is far from a trivial task. There are a lot of potentials risks and a lot of coding/debugging that will have to be done in order to get things to work properly. So, I'd recommend that unless you are confident in your programming skills that you out-source this type of activity to a professional programmer.

But if you do decide to go it alone, good luck, let me know if I can help, and please don't hold me responsible if anything goes wrong. :)

Founding member of evolt.org.





</entry>

<entry [Thurs July 09 17:59:02 EDT 2009] TEST CLUSTER-ENABLED WORKFLOWS>


Workflow::executeWorkflow
	|
	|
	-> my $appsWorkflow = Apps::Workflow->new()
		|
		|
		-> $appsWorkflow->run() SINGLE JOB
			|
		STAGE 1	
			|
			-> 	my $stage = Apps::Stage->new()
				my $stage = Apps::Stage->new()
				...
				|
				|
				-> $stage->execute() 
					|
					|
					->  CLUSTER	Apps::clusterSubmit()
					|
					|
					->  LOCAL Apps::execute()
			:
		STAGE 2
			|
			|
			-> $appsWorkflow->run() ARRAY JOB
			|
			|
			-> $appsWorkflow->run() ANT/HERDER JOB (FAILURE MITIGATION)



</entry>

<entry [Wed July 08 14:52:02 EDT 2009] FIX ERROR 'SQL error: unable to open database file'>

PROBLEM

GET THIS ERROR WHEN TRYING TO INSERT USING SQLITE AS APACHE

SQL error: unable to open database file

DIAGNOSIS

1. SQLITE IS UNABLE TO WRITE TO THE /tmp DIR
2. SQLITE IS UNABLE TO WRITE TO THE DIRECTORY CONTAINING THE DB FILE data.dbl

SOLUTION

CHANGE PERMISSIONS FROM:

drwxrwxrwt   7 root root  4096 Jul  8 04:21 tmp

TO:

drwxrwxrwx   7 root root  4096 Jul  8 14:35 tmp


sudo su
chmod 777 /tmp



... AND CHANGE bin DIRECTORY OWNERSHIP

chown -R syoung:apache /data/aqwa/0.3
chmod 775 /data/aqwa/0.3/bin





</entry>

<entry [Tues July 07 23:52:02 EDT 2009] FIX su - apache GIVES 'This account is currently not available.'>

http://www.talkingtree.com/blog/index.cfm/2004/12/9/CFEXECLinux

So, I assume that you mean that you're running CF as the user apache, which is presumably the user account for the Apache websever. You're better off running CF as some other non-privileged user account that is not 'apache', and then creating a group having both apache and coldfusion user in it, then make the webroot owned by that group recursively.

*** The su error message 'This account is currently not available' means that the apache account is configured to not allow logins, which is typical for non-privileged accounts used to run daemons. The shell is set to /bin/nologin instead of /bin/bash or /bin/sh. 

You could momentarily change the user's shell to allow logins, then su (don't forget the '-' in 'su -' to get the users environment too) and then finally test running the executable. When you are able to execute the script in this manner then so will the ColdFusion server. And after your test don't forget to change the shell back to /bin/nologin.


sudo su
emacs /etc/passwd

CHANGE FROM /bin/nologin TO /bin/bash


Hi
When adding a user to my system using the default adduser xxx command, the suer can (by default) log in via ssh as long as I set a password.

What I want is for some users to NOT be able to log in via SSH, yet, they must still be able to use vsftp.

If I change the /etc/passwd entry for the specific user to /bin/nologin, then the user cannot login via SSH , but the user cannot use ftp either...

Is there a way?

Does /etc/shells include /bin/nologin? If not it will prevent the user from being able to log in via FTP.


</entry>

<entry [Tues July 07 13:52:02 EDT 2009] RUN WORKFLOW ON ngsdev>

Change directory: /data/aqwa/0.3/bin/

Child process id: 22609
Child pid: 22609

Application: /data/aqwa/0.3/bin/image2eland.pl

perl /data/aqwa/0.3/bin/image2eland.pl '--readlength', '30' '--outputdir', '/data/aqwa/0.3/fileroot/admin/Project1/Workflow3-indels' '--referencefile', '/d\
ata/aqwa/0.3/fileroot/admin//Project1/Workflow3-indels/CCDS_nucleotide.20080430.fa' '--geraldfile', '/data/aqwa/0.3/fileroot/admin//run2lane6-test/geraldfi\
le.txt' '--tiles', 's_6_150' '--rundir', '/data/aqwa/0.3/fileroot/admin/Project1/Workflow3-indels' '--type', 'single'

Executing child process...

Result: 512
command exited with value 2


perl /data/aqwa/0.3/bin/image2eland.pl  --help

Can't locate Timer.pm in @INC (@INC contains:....



perl /data/aqwa/0.3/bin/image2eland.pl '--readlength', '30' '--outputdir', '/data/aqwa/0.3/fileroot/admin/Project1/Workflow3-indels' '--referencefile', '/d\
ata/aqwa/0.3/fileroot/admin//Project1/Workflow3-indels/CCDS_nucleotide.20080430.fa' '--geraldfile', '/data/aqwa/0.3/fileroot/admin//run2lane6-test/geraldfi\
le.txt' '--tiles', 's_6_150' '--rundir', '/data/aqwa/0.3/fileroot/admin/Project1/Workflow3-indels' '--type', 'single'




</entry>

<entry [Mon July 06 13:52:02 EDT 2009] ADDED dbsnp DATA TO plugins/report/data>


dbsnp.sql
---------

	CREATE TABLE dbsnp (
	
		chromosome      varchar(255),
		chromosomeStart int(10),
		chromosomeEnd   int(10),
		snp             varchar(20),
		score           int(10),
		strand          char(1),
		
		PRIMARY KEY(snp)
	);


dbsnp.tsv
---------

	chr1	58996	58997	rs1638318	0	+
	chr1	59315	59316	rs2854682	0	-
	chr1	59373	59374	rs2691305	0	-
	chr1	59414	59415	rs2531266	0	+
	chr1	59414	59415	rs55874132	0	+
	chr1	59431	59432	rs2531267	0	+
	chr1	59613	59614	rs1419821	0	+
	chr1	59630	59631	rs62026918	0	-
	...

cd C:\DATA\base\html\aqwa\html\plugins\report\data
sqlite3 -separator "\t" dbsnp.db

	SQLite version 3.6.4
	Enter ".help" for instructions
	Enter SQL statements terminated with a ";"
	sqlite> .read C:\\DATA\\base\\html\\aqwa\\html\\plugins\\report\\data\\dbsnp.sql
	sqlite> .separator "\t"
	sqlite> .import dbsnp.tsv dbsnp
	sqlite>


select count(*) from dbsnp;
	
	156,972


</entry>

<entry [Tues Jun 30 13:52:02 EDT 2009] FILE UPLOAD USING dojox.form.FileInputAuto>


TEST UPLOAD PAGE
http://localhost:8080/aqwa/html/tests/upload3.html


TEST RECEIVER
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/form/resources/RecieveFile.php


NEW RECEIVER (WRITTEN FROM SCRATCH)
http://localhost:8080/cgi-bin/aqwa/upload.cgi





</entry>

<entry [Tues Jun 30 13:52:02 EDT 2009] ALTERED conf/default-linux.conf TO REFLECT TO GAPipeline 1.4.0 INSTALLATION>
	
	EXECUTION_TEMPDIR       /tmp
	BIN                     /nethome/syoung/base/bin
	BINDIR                  /nethome/syoung/base/html/aqwa/bin
	FILEROOT                /nethome/syoung/base/html/aqwa/fileroot
	ROOTDIR                 /nethome/syoung/base/pipeline
	MAQ                     /nethome/syoung/base/apps/maq/0.7.1/maq
	RUNMAPPING              /nethome/syoung/base/apps/454/2.0.00.20-64/bin/runMapping
	GAPIPELINE              /nethome/syoung/base/apps/GAPipeline-1.4.0
	GAPIPELINE_BIN          /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/
	ELAND                   /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/ELAND_standalone.pl
	BUSTARD                 /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/bustard.py
	GOAT_PIPELINE           /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/goat_pipeline.py
	SQUASH                  /nethome/syoung/base/apps/GAPipeline-1.4.0/bin/squashGenome
	MIRA                    /nethome/syoung/base/apps/mira/bin/mira
	VELVET                  /nethome/syoung/base/apps/velvet/velvet
	NUCMER                  /nethome/syoung/base/apps/mummer/nucmer
	DELTAFILTER             /nethome/syoung/base/apps/mummer/delta-filter
	SHOWCOORDS              /nethome/syoung/base/apps/mummer/show-coords
	VCAKE                   /nethome/syoung/base/apps/vcake/VCAKE_1.0.pl
	HTMLURL                 http://ngsdev.ccs.miami.edu
	HTMLDIR                 /var/www/html
	CGIDIR                  /var/www/cgi-bin
	MYSQLDATA               /usr/local/mysql/data
	CLUSTER_MYSQLDATA       /private/var/mysql


</entry>

<entry [Tues Jun 30 01:52:02 EDT 2009] INSTALL ON ngsdev AT /var/www/html/aqwa/trunk/0.3 LINKED TO /data/trunk/0.3>


1. MAKE .cgi APPS EXECUTABLE (ADD TO config.pl)

chmod 755 /var/www/cgi-bin/aqwa/trunk/0.3/*cgi


2. ALTER httpd.conf TO FOLLOW SYMLINKS IF YOU GET A ' Symbolic link not allowed' ERROR:

cd /var/log/httpd/
tail -f error_log
	...
	[Tue Jun 30 02:19:33 2009] [error] [client 10.150.180.105] Symbolic link not allowed or link target not accessible: /var/www/cgi-bin/aqwa/trunk/0.3
	[Tue Jun 30 02:19:34 2009] [error] [client 10.150.180.105] File does not exist: /var/www/html/favicon.ico


EDIT httpd.conf FILE:

emacs /etc/httpd/conf/httpd.conf

ADD THIS LINE (Options ExecCGI -MultiViews +FollowSymLinks) IN THE CGI CONFIG SECTION:


<Directory "/var/www/cgi-bin">
    AllowOverride None
####    Options None

    Options ExecCGI -MultiViews +FollowSymLinks

#    Order allow,deny
   Allow from all
</Directory>



3. REPLACE WINDOWS PATH TO PERL WITH LINUX PATH IN FIRST LINE OF EACH .cgi SCRIPT

#!/usr/bin/perl -w

REPLACES

#!C:/perl/bin/perl -w



4. RESTART APACHE

/usr/sbin/apachectl -k restart












</entry>

<entry [Sun Jun 28 23:33:02 EDT 2009] REFACTOR RUN TO WORK USING JSON FOR TRANSPORT (I.E., xhrPut) AND IMPLEMENT RUN ON LINUX>

workflow-runWorkflow.json

{'sessionId' : '1228791394.7868.158','username' : 'admin','project' : 'Project1','workflow' : 'Workflow3-indels','mode' : 'runWorkflow','start' : 0 }


RELOAD stage INTO data.dbl FROM BACKUP IN dat-syoung

EXPORT
sqlite3 -separator "    " data-syoung.dbl
.output stage.tsv
select * from stage;
.output stdout
.quit

IMPORT
sqlite3 -separator "    " data.dbl
.import stage.tsv stage






SQLITE

how to load in file and outfile  

== Export ========================== 
C:\yourdir> sqlite3 yourdatabase 
SQLite version 3.6.7 
Enter ".help" for instructions 
Enter SQL statements terminated with a ";" 
sqlite> .header off 
sqlite> .mode csv 
sqlite> .output data1.csv 
sqlite> SELECT * FROM table1; 
sqlite> .output data2.csv 
sqlite> SELECT * FROM table2; 
sqlite> .output stdout 
sqlite> .quit 
C:\yourdir> 
==================================== 

== Import ========================== 
C:\yourdir> sqlite3 yourdatabase 
SQLite version 3.6.7 
Enter ".help" for instructions 
Enter SQL statements terminated with a ";" 
-- create and import 
sqlite> CREATE TABLE table1 (.........); 
sqlite> CREATE TABLE table2 (.........); 
sqlite> .import data1.csv table1 
sqlite> .import data2.csv table2 
sqlite> .quit 
C:\yourdir> 
==================================== 

== Backup ========================== 
C:\yourdir> sqlite3 yourdatabase .dump >dump.sql 
==================================== 

== Restore ========================= 
C:\yourdir> sqlite3 newdatabase <dump.sql 
== or ============================== 
C:\yourdir> sqlite3 newdatabase 
sqlte> .read dump.sql 
sqlte> .quit 
==================================== 




</entry>

<entry [Sun Jun 28 23:33:02 EDT 2009] REMOVE .svn DIRECTORIES WITH svn.pl>

perl c:\DATA\base\html\aqwa\bin\utils\svn.pl --inputdir C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\plugins\project\API\EntrezAPI


</entry>

<entry [Sun Jun 28 19:16:02 EDT 2009] STARTUP OF FileSelector.js OWNED BY FileManager.js>

SOLUTION: HAD TO RENAME plugins/workflow/_GroupPaneDrag.js INSIDE

I.E., dojo.require AND dojo.provide



------------------
TUTORIAL ON DOJO this.inherited AND OTHER INHERITANCE CALLS
http://www.dojotoolkit.org/book/dojo-book-0-9/part-3-programmatic-dijit-and-dojo/object-orientation/inheritance

For all other methods, you can use inherited(arguments) to call the superclass method of the same name. Take for example:

someMethod: function() {
      // call base class someMethod
      this.inherited(arguments);
      // now do something else
    }
Inherited will climb up the scope chain, from superclass to superclass and through mixin classes as well, until it finds "someMethod", then it will invoke that method.

The argument is always literally arguments, a special Javascript array variable which holds all the arguments (like argv in C).

There are a few variations to inherited() for special cases. If you have a method that was put into your object outside of declare, you need to specify the name of the calling function like this:

this.inherited("someMethod", arguments);
And you can send custom parameters to the ancestor function. Just place the extra arguments in array literal notation with brackets:

this.inherited(arguments, [ customArg1, customArg2 ])
------------------




startup plugins.project.FileDrag.startup()

	--> CALLS INHERITED startup:
		--> FileDrag.getPaneForItem
			--> FileDrag.addChild



	INHERITANCE CHAIN:
	
	plugins.project.FileDrag
		dojox.widget.RollingList
			dijit._Widget --> null
			dijit._Templated --> null
			dijit._Container --> null



	RollingList????

getPaneForItem plugins.project.FileDrag.getPaneForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)


addChild CALLED BY INHERITED CLASS:


addChild plugins.project.FileDrag.addChild(/*Widget*/ widget, /*int?*/ insertIndex)

addChild widget: [Widget plugins.project._GroupDragPane, plugins_project__GroupDragPane_0]
addChild insertIndex: 0




Workflow (FileManager NOT WORKING):

startup plugins.workflow.FileSelector.startup()
startup plugins.workflow.FileSelector.startup()
startup XXX this._started: undefined
Doing this.inherited(arguments)
getPaneForItem plugins.workflow.FileSelector.getPaneForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
getPaneForItem item: undefined
getPaneForItem item JSON: undefined
constructor plugins.workflow._GroupSelectorPane.constructor(args)
constructor THIS: [object Object]
addChild plugins.workflow.FileSelector.addChild(/*Widget*/ widget, /*int?*/ insertIndex)
addChild widget: [object Object]
addChild insertIndex: 0
addChild plugins.workflow.FileSelector.addChild()
addChild widget: [object Object]
addChild widget.id: undefined
addChild insertIndex: 0
_removeAfter plugins.workflow.FileSelector._removeAfter(/*Widget or int*/ idx)
_removeAfter idx: -1
_itemsMatch plugins.workflow.FileSelector._itemsMatch(/*item*/ item1, /*item*/ item2)
_itemsMatch Returning true
addChild BEFORE this.inherited(arguments)
_1533.startup is not a function
[Break on this error] if(!dojo._hasResource["dojo.dnd.common"]...ko-kr","ar","en-us","zh","th","ja-jp"]);



Project (WORKING):

startup plugins.project.FileDrag.startup()
startup plugins.project.FileDrag.startup()
Doing this.inherited(arguments)
getPaneForItem plugins.project.FileDrag.getPaneForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
getPaneForItem item: undefined
getPaneForItem item JSON: undefined
addChild plugins.project.FileDrag.addChild(/*Widget*/ widget, /*int?*/ insertIndex)
addChild widget: [Widget plugins.project._GroupDragPane, plugins_project__GroupDragPane_0]
addChild insertIndex: 0
_removeAfter plugins.project.FileDrag._removeAfter(/*Widget or int*/ idx)
_removeAfter idx: -1
_itemsMatch plugins.project.FileDrag._itemsMatch(/*item*/ item1, /*item*/ item2)
addChild BEFORE this.inherited(arguments)
GET http://localhost:8080/cgi-bin/aqwa/project.cgi?mod...ery=%22Project1%22&dojo.preventCache=1246230938612
http://localhost:8080/cgi-bin/aqwa/project.cgi?mode=fileSystem&sessionId=1228319084.3060.776&username=admin&query=%22Project1%22&dojo.preventCache=1246230938612
	
200 OK
		1.34s	bootstrap.js (line 1082)
addChild AFTER this.inherited(arguments)
Finished this.inherited(arguments)
startup child: [Widget plugins.project._GroupDragPane, plugins_project__GroupDragPane_0]
startup plugins.project.FileDrag.startup()
startup plugins.project.FileDrag.startup()
Doing this.inherited(arguments)
getPaneForItem plugins.project.FileDrag.getPaneForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
getPaneForItem item: undefined
getPaneForItem item JSON: undefined
addChild plugins.project.FileDrag.addChild(/*Widget*/ widget, /*int?*/ insertIndex)
addChild widget: [Widget plugins.project._GroupDragPane, plugins_project__GroupDragPane_1]
addChild insertIndex: 0
_removeAfter plugins.project.FileDrag._removeAfter(/*Widget or int*/ idx)
_removeAfter idx: -1
_itemsMatch plugins.project.FileDrag._itemsMatch(/*item*/ item1, /*item*/ item2)
addChild BEFORE this.inherited(arguments)
GET http://localhost:8080/cgi-bin/aqwa/project.cgi?mod...ery=%22Project2%22&dojo.preventCache=1246230938711
http://localhost:8080/cgi-bin/aqwa/project.cgi?mode=fileSystem&sessionId=1228319084.3060.776&username=admin&query=%22Project2%22&dojo.preventCache=1246230938711
	
200 OK
		1.23s	bootstrap.js (line 1082)
addChild AFTER this.inherited(arguments)
GET http://localhost:8080/cgi-bin/aqwa/project.cgi?mod...uery=%22Source1%22&dojo.preventCache=1246230938750
http://localhost:8080/cgi-bin/aqwa/project.cgi?mode=fileSystem&sessionId=1228319084.3060.776&username=admin&query=%22Source1%22&dojo.preventCache=1246230938750
	
200 OK
		1.21s	bootstrap.js (line 1082)
GET http://localhost:8080/cgi-bin/aqwa/project.cgi?mod...uery=%22Source2%22&dojo.preventCache=1246230938781
http://localhost:8080/cgi-bin/aqwa/project.cgi?mode=fileSystem&sessionId=1228319084.3060.776&username=admin&query=%22Source2%22&dojo.preventCache=1246230938781
	
200 OK
		1.16s	bootstrap.js (line 1082)
Finished this.inherited(arguments)
startup child: [Widget plugins.project._GroupDragPane, plugins_project__GroupDragPane_1]
startup plugins.project.FileDrag.startup()
startup plugins.project.FileDrag.startup()
Doing this.inherited(arguments)
getPaneForItem plugins.project.FileDrag.getPaneForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
getPaneForItem item: undefined
getPaneForItem item JSON: undefined
addChild plugins.project.FileDrag.addChild(/*Widget*/ widget, /*int?*/ insertIndex)
addChild widget: [Widget plugins.project._GroupDragPane, plugins_project__GroupDragPane_2]
addChild insertIndex: 0
_removeAfter plugins.project.FileDrag._removeAfter(/*Widget or int*/ idx)
_removeAfter idx: -1
_itemsMatch plugins.project.FileDrag._itemsMatch(/*item*/ item1, /*item*/ item2)
addChild BEFORE this.inherited(arguments)
addChild AFTER this.inherited(arguments)
Finished this.inherited(arguments)
startup child: [Widget plugins.project._GroupDragPane, plugins_project__GroupDragPane_2]
startup plugins.project.FileDrag.startup()
startup plugins.project.FileDrag.startup()
Doing this.inherited(arguments)
getPaneForItem plugins.project.FileDrag.getPaneForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
getPaneForItem item: undefined
getPaneForItem item JSON: undefined
addChild plugins.project.FileDrag.addChild(/*Widget*/ widget, /*int?*/ insertIndex)
addChild widget: [Widget plugins.project._GroupDragPane, plugins_project__GroupDragPane_3]
addChild insertIndex: 0
_removeAfter plugins.project.FileDrag._removeAfter(/*Widget or int*/ idx)
_removeAfter idx: -1
_itemsMatch plugins.project.FileDrag._itemsMatch(/*item*/ item1, /*item*/ item2)
addChild BEFORE this.inherited(arguments)
addChild AFTER this.inherited(arguments)
Finished this.inherited(arguments)
startup child: [Widget plugins.project._GroupDragPane, plugins_project__GroupDragPane_3]
createMenu plugins.project.Controller.createMenu()
node is null
[Break on this error] if(!dojo._hasResource["dojo.dnd.common"]...ko-kr","ar","en-us","zh","th","ja-jp"]);
plugins.js (line 16)
_getMenuItemForItem plugins.project.FileDrag._getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane)
getMenuItemForItem plugins.project.FileDrag.getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
_getMenuItemForItem plugins.project.FileDrag._getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane)
getMenuItemForItem plugins.project.FileDrag.getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
_getMenuItemForItem plugins.project.FileDrag._getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane)
getMenuItemForItem plugins.project.FileDrag.getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
startup item: [object Object]
startup store: [object Object]
startup path: Workflow1-assembly
_getMenuItemForItem plugins.project.FileDrag._getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane)
getMenuItemForItem plugins.project.FileDrag.getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
startup item: [object Object]
startup store: [object Object]
startup path: Workflow1-assembly
_getMenuItemForItem plugins.project.FileDrag._getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane)
getMenuItemForItem plugins.project.FileDrag.getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
startup item: [object Object]
startup store: [object Object]
startup path: Workflow1-source-assembly
_getMenuItemForItem plugins.project.FileDrag._getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane)
getMenuItemForItem plugins.project.FileDrag.getMenuItemForItem(/*item*/ item, /* dijit._Contained */ parentPane, /* item[]? */ children)
startup item: [object Object]
startup store: [object Object]
startup path: Workflow3-source-indels




</entry>

<entry [Sun Jun 28 13:44:02 EDT 2009] ADDED COMMENTS WITH comment SUBROUTINE IN FileTools.pm>



C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\dojo.1.2.2\dijit\layout

FILE ADD COMMENTS:

perl comment.pl 
--inputfile C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\dojo.1.2.2\dojox\widget\RollingList.js
 --outputfile C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\dojo.1.2.2\dojox\widget\RollingList-add.js
 --action add
 --type js


DIRECTORY ADD COMMENTS:

perl comment.pl 
--inputdir C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\dojo.1.2.2\dojox\widget
 --outputdir C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\dojo.1.2.2\dojox\widget-add 
 --action add
 --type js


perl comment.pl 
--inputdir C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\dojo.1.2.2\dijit\layout
 --outputdir C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\dojo.1.2.2\dijit\layout-add 
 --action add
 --type js


perl comment.pl 
--inputdir C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\plugins\workflow
 --outputdir C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\plugins\workflow-add
 --action add
 --type js



perl comment.pl 
--inputdir C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\dojo.1.2.2\dijit
 --outputdir C:\DATA\base\svn\hp-laptop\trunk\aqwa\html\dojo.1.2.2\dijit-add
 --action add
 --type js





</entry>

<entry [Sat Jun 27 13:44:02 EDT 2009] FIX RESIDUAL 'Loading...' IN EMPTY PANE>


EDITED _GroupDragPane.js, AT LINE 797 NEW CODE ADDED TO REMOVE 'Loading...':

		// IF THERE ARE NO ITEMS FOR THIS DIRECTORY, ADD AN <EMPTY> SIGN TO THE DND SOURCE
		else
		{
			// THIS CHILD SHOULD READ "<EMPTY>"


			var menuItem = {
				data : '&lt;EMPTY&gt;',
				type : [ 'none' ]
			};

			// _dragSource: dijit.Menu
			//  The menu that we will call addChild() on for adding items

			//console.log("emptyDir     this._dragSource: " + this._dragSource);
			//console.log("emptyDir     this._dragSource.id: " + this._dragSource.id);
			//console.log("emptyDir     this._dragSource.parentWidget: " + this._dragSource.parentWidget);
			//console.log("emptyDir     this.menuNode.id: " + this.menuNode.id);
			//console.log("emptyDir     dojo.byId(this.menuNode.id): " + dojo.byId(this.menuNode.id));
			//console.log("emptyDir     dijit.byId(this.menuNode.id): " + dijit.byId(this.menuNode.id));
			

			//var menuNode = dojo.byId(this.menuNode.id);
			//console.log("emptyDir     menuNode: " + menuNode);
			//if ( menuNode && menuNode.parentNode && menuNode.parentNode.parentNode )
			//{
			//	var grandparentNode = menuNode.parentNode.parentNode;
			//	console.log("emptyDir     grandparentNode: " + grandparentNode);
			//	console.log("emptyDir     grandparentNode.firstChild: " + grandparentNode.firstChild);
			//
			//	grandparentNode.removeChild(grandparentNode.firstChild);
			//	console.log("emptyDir     Finished grandparxentNode.removeChild(grandparentNode.firstChild)");
			//}
			
			this._dragSource.insertNodes(false, [ menuItem ]);
		}


</entry>

<entry [Thurs Jun 25 13:44:02 EDT 2009] TIMING AND RESIZE HANDLE>

TIMING
http://archive.dojotoolkit.org/nightly/dojotoolkit/dojox/timing/tests/
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/timing/tests/test_Sequence.html

RESIZE HANDLE
http://localhost:8080/aqwa/html/dojo.1.2.2/dojox/layout/tests/test_ResizeHandle.html



</entry>

<entry [Sun Jun 22 13:44:02 EDT 2009] CHANGED groups TABLE AND RELOADED IN aqwa>

NB: .SQL AND .BSV FILES ARE IN bin/sql FOLDER. THE cgi-bin/sql FOLDER IS LINKED FROM IT.

DROP AND LOAD NEW VERSION OF groupusers:

perl C:\DATA\base\html\aqwa\bin\loader.pl --dbfile C:\DATA\base\html\aqwa\bin\data.dbl --sqlfile C:\DATA\base\html\aqwa\bin\sql\groupusers.sql --bsvfile C:\DATA\base\html\aqwa\bin\sql\groupusers.bsv

DROP AND LOAD groups:

perl C:\DATA\base\html\aqwa\bin\loader.pl --dbfile C:\DATA\base\html\aqwa\bin\data.dbl --sqlfile C:\DATA\base\html\aqwa\bin\sql\groups.sql --bsvfile C:\DATA\base\html\aqwa\bin\sql\groups.bsv

DROP AND LOAD access:

perl C:\DATA\base\html\aqwa\bin\loader.pl --dbfile C:\DATA\base\html\aqwa\bin\data.dbl --sqlfile C:\DATA\base\html\aqwa\bin\sql\access.sql --bsvfile C:\DATA\base\html\aqwa\bin\sql\access.bsv



OLD VERSION OF groups TABLE					
(AND EXISTING SERVER-SIDE DATA)					
owner	groupname	groupdesc	name	type	fullname
syoung	bioinfo	syoung	user		
syoung	bioinfo	skhuri	user		
syoung	bioinfo	admin	user		
syoung	bioinfo	ProjectY	project		
syoung	nextgen	syoung	user		
syoung	nextgen	dhedges	user		
syoung	nextgen	admin	user		
syoung	nextgen	ProjectX	project		
admin	nextgen	Source1	project		
admin	bioinfo	Source2	project		
admin	nextgen	Project1	project		
admin	bioinfo	Project2	project		
					
					
NEW VERSION OF groups TABLE					
owner	groupname	groupdesc	name	type	fullname
admin	bioinfo	Bioinformatics Team	Project1	project	Next Generation Analysis Tools
admin	bioinfo	Bioinformatics Team	skhuri	user	Sawsan Khuri
admin	nextgen	Next Generation Sequencing	Project2	project	Next Generation Data Analysis
admin	nextgen	Next Generation Sequencing	yedwards	user	Yvonne Edwards
admin	nextgen	Next Generation Sequencing	dhedges	user	Dale Hedges


</entry>

<entry [Sun Jun 22 13:44:02 EDT 2009] Dijit philosophy and data store tricks>


Dijit philosophy
http://dojotoolkit.org/book/dijit-functional-spec/dijit-philosophy

CODE for using data stores - itemToJSON, copyStore
http://doc-staging.dojocampus.org/quickstart/data/usingdatastores/faq.html

AOL version of dojo
http://o.aolcdn.com/dojo/1.1.0/dojo/dojo.xd.js

</entry>

<entry [Sat Jun 21 23:44:02 EDT 2009] How to prevent caching>

http://www.dojotoolkit.org/book/dojo-book-0-9/part-3-programmatic-dijit-and-dojo/using-dojo-data/available-stores/dojo-data-i-0

Submitted by stephenwilley on Fri, 04/18/2008 - 19:39.

I've got an ItemFileWriteStore which reads a JSON file from a URL. Since browsers love to cache stuff like this, here's a trick to stop it happening. You simply add a query parameter onto the end of the URL that has the current epoch time in it (or any other unique number). This'll be ignored but will prevent caching.

If you're loading the URL in javascript:

var store = new dojo.data.ItemFileWriteStore({url: "theURL.json?d=" + (new Date()).getTime() });

If you're loading it in the HTML but you can use PHP:

<div dojoType="dojo.data.ItemFileWriteStore" jsId="jobsList" url="theURL.json?d=<?php echo time(); ?>">

</entry>

<entry [Sat Jun 21 22:44:02 EDT 2009] DOH TEST RUNNER IN dojo/data - GOOD EXAMPLE>


http://localhost:8080/aqwa/html/dojo.1.2.2/dojo/tests/data/

http://localhost:8080/aqwa/html/dojo.1.2.2/util/doh/runner.html?testModule=tests.data


</entry>

<entry [Thurs Jun 19 22:53:02 EDT 2009] SOURCE OF ERROR 'Error undefined running custom onLoad code'>



PROBABLY dojo.connect TO NON-EXISTENT 

dojo.connect uses a bad reference to the 
widget, ie. dijit.byId() returns a bad reference, or it becomes invalid by 
the time the call is made. 

http://www.nabble.com/Error-undefined-running-custom-onLoad-code.-td20055307.html



</entry>

<entry [Thurs Jun 18 22:53:02 EDT 2009] SOURCE OF 'Node was not found' ERROR - DESTROY ON NONEXISTENT NODE>


Node was not found" code: "8
_position()()dojo.1.2...Dialog.js (line 185)
onLoad()()dojo.1.2...Dialog.js (line 209)
_onLoadHandler()(table.loginTable)dojo.1.2...ntPane.js (line 360)
_setContentAttr()(table.loginTable)dojo.1.2...ntPane.js (line 224)
attr()("content", table.loginTable)dojo.1.2...Widget.js (line 666)
setContent()(table.loginTable)dojo.1.2...ntPane.js (line 193)
launchLoginWindow()()dojo.1.2.../Login.js (line 167)
constructor()()dojo.1.2.../Login.js (line 71)
_construct()([])dojo.1.2...eclare.js (line 127)
_makeCtor()()dojo.1.2...eclare.js (line 97)
(?)()()dojo.1.2...roller.js (line 155)
loaded()()loader.js (line 145)
_callLoaded()()loader.js (line 252)
_modulesLoaded()()loader.js (line 233)
_loadInit()(DOMContentLoaded )hostenv_...rowser.js (line 293)
[Break on this error] props['width'] = ds.w = (ds.w + pad >= this._vp.w || this.fix



</entry>

<entry [Fri Jun 12 22:53:02 EDT 2009] CREATE COMPRESSED DOJO FOR admin>


1. CREATE BUILD CONFIG FILE WITH buildConfig.pl

perl buildConfig.pl --inputdir C:\DATA\base\html\aqwa\html\plugins\admin --outputfile C:\DATA\base\html\aqwa\html\dojo.1.2.2\util\buildscripts\profiles\admin.profile.js --name "../admin.js"


2. CREATE THE OUTPUT DIRECTORY FOR YOUR BUILD

mkdir C:\DATA\base\html\aqwa\html\admin


3. RUN THE BUILD (TAKES ~2 MINS)

cd C:\DATA\base\html\aqwa\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="admin" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../admin/ > ..\..\..\admin\admin-output.txt


VIEW OUTPUT FILE ..\..\..\admin\admin-output.txt:

	release:  Using profile: profiles/admin.profile.js
	release:  Using version number: 0.2.5 for the release.
	release:  Deleting: ../../../admin/dojo
	release:  Copying: ../../dojo to: ../../../admin/dojo/dojo
	release:  Copying: ../../dojo/../plugins to: ../../../admin/dojo/plugins
	release:  Copying: ../../dojo/../dojox to: ../../../admin/dojo/dojox
	release:  Copying: ../../dojo/../dijit to: ../../../admin/dojo/dijit
	release:  Building dojo.js and layer files
	release:  XXXX HERE
	release:  buildUtil. load (uri): ./../../../admin/dojo/dojo/_base.js
	release:  buildUtil. load (uri): ./../../../admin/dojo/dojo/_base/lang.js
	release:  buildUtil. load (uri): ./../../../admin/dojo/dojo/_base/declare.js
	...
	release:  Optimizing (comments.keepLines) CSS file: ../../../admin/dojo/dijit/themes/UMtheme2/Tree_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../admin/dojo/dijit/themes/UMtheme2/UMtheme.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../admin/dojo/dijit/themes/UMtheme2/UMtheme_rtl.css
	release:  Build is in directory: ../../../admin/dojo
	Build time: 172.445 seconds





RERUN EXCLUDING TabContainer.js BUT INCLUDING ALL PLUGINS
---------------------------------------------------------

1. CREATE BUILD CONFIG FILE WITH buildConfig.pl

cd C:\DATA\base\html\aqwa\bin\utils
perl buildConfig.pl --inputdir C:\DATA\base\html\aqwa\html\plugins --outputfile C:\DATA\base\html\aqwa\html\dojo.1.2.2\util\buildscripts\profiles\plugins.profile.js --name "../plugins.js"

	**** MANUALLY COMMENT OUT TabContainer.js LINE ****



2. CREATE THE OUTPUT DIRECTORY FOR YOUR BUILD

mkdir C:\DATA\base\html\aqwa\html\builds\plugins


3. RUN THE BUILD (TAKES ~2 MINS)

cd C:\DATA\base\html\aqwa\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="plugins" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../builds/plugins/ > ..\..\..\builds\plugins\plugins-output.txt

	...
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/plugins/dojo/dijit/themes/UMtheme2/Tree_rtl.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/plugins/dojo/dijit/themes/UMtheme2/UMtheme.css
	release:  Optimizing (comments.keepLines) CSS file: ../../../builds/plugins/dojo/dijit/themes/UMtheme2/UMtheme_rtl.css
	release:  Interning strings for: ../../../builds/plugins/dojo/includes
	release:  Build is in directory: ../../../builds/plugins/dojo
	Build time: 196.999 seconds


4. ADD TO HTML PAGE (IN THIS ORDER):


<script type="text/javascript" src="dojo.1.2.2/dojo/dojo.js"
	djConfig="isDebug: true, parseOnLoad: true, useCommentedJson: true"></script>

<script type="text/javascript" src="dojo.1.2.2/dijit/nls/en-us.js"></script>
<script type="text/javascript" src="dojo.1.2.2/dijit/nls/common.js"></script>

<script type="text/javascript" src="builds/plugins/dojo/plugins.js.uncompressed.js"></script>


ET VOILA!




TROUBLESHOOTING
---------------


PROBLEM:


ERROR CAUSED BY .js FILES IN dijit/nls DIRECTORY:

C:\DATA\base\html\aqwa\html\dojo.1.2.2\dijit\nls

I.E., THE PRESENCE OF THESE 43 FILES:

C:\DATA\base\html\aqwa\html\dojo.1.2.2\dijit\nls\dijit-all_ar.js
C:\DATA\base\html\aqwa\html\dojo.1.2.2\dijit\nls\dijit-all_ca.js
C:\DATA\base\html\aqwa\html\dojo.1.2.2\dijit\nls\dijit-all_cs.js
...

... CAUSES THIS ERROR:

cd C:\DATA\base\html\aqwa\html\dojo.1.2.2\util\buildscripts
java -jar ..\shrinksafe\custom_rhino.jar build.js profile="admin" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../admin/ > ..\..\..\admin\admin-output.txt

js: "jslib/i18nUtil.js", line 240: exception from uncaught JavaScript throw:

Cannot create flattened bundle for src file: ../../../admin/dojo/dijit/nls/dijit-all_ar.js

C:\DATA\base\html\aqwa\html\dojo.1.2.2\util\buildscripts>



SOLUTION:

DELETED ALL .js FILES IN dijit/nls DIRECTORY

THEN ADDED _en-us.js TO dojo/nls





</entry>

<entry [Wed Jun 10 16:27:47 EDT 2009] CREATE BRANCH theme>


1. CREATE BRANCHES theme1 AND theme2

sudo su
svn mkdir file:///srv/svn/aqwa/branches/theme -m "Themes branch"

	Committed revision 50.

svn list file:///srv/svn/aqwa/branches
builds/
filetools/
theme/

svn mkdir file:///srv/svn/aqwa/branches/theme/theme1 -m "First version of green theme"

	Committed revision 51.

svn mkdir file:///srv/svn/aqwa/branches/theme/theme2 -m "First version of blue UM theme"

	Committed revision 52.

svn list file:///srv/svn/aqwa/branches
	builds/
	filetools/
	theme/

svn list file:///srv/svn/aqwa/branches/theme
	theme1/
	theme2/


2. POPULATE THE THEMES REPOSITORIES

DO THEME1

mkdir -p /nethome/syoung/base/svn/aqwa/branches/theme/theme1
cd /nethome/syoung/base/svn/aqwa/branches/theme/theme1

svn checkout file:///srv/svn/aqwa/branches/theme/theme1 ./








</entry>

<entry [Tues June 10 19:40:56 EDT 2009] IN ADMIN PLUGIN PATCHED dijit/form/ComboBox.js TO ADD CLASS TO SCROLLBAR>

ADDED TO dijit/form/ComboBox.js, LINE 402:

			//console.log("popupbox: " + popupbox);
			//console.log("this._popupWidget.domNode: " + this._popupWidget.domNode);
			//console.log("this.attr('class'): " + this.attr('class'));
			var parentClass = this.attr('class');
			var popupClass = parentClass + "_popup";
			this._popupWidget.attr('class', popupClass);



</entry>

<entry [Tues May 19 16:40:56 EDT 2009] RUN config.pl AS syoung ON ngsdev>

1. CHECKOUT aqwa

cd /data/



2. RUN config.pl WITH THE FOLLOWING INPUTS

N
/data/aqwa/branches/theme/theme1
/var/www/html/aqwa/theme/theme1
/var/www/cgi-bin/aqwa/theme/theme1
http://ngsdev.ccs.miami.edu/aqwa/theme/theme1


3. PUT ON aqwa WIKI - 'Source code'





</entry>

<entry [Tues May 19 16:40:56 EDT 2009] ADDED buildConfig.pl TO BUILD AQWA USING ALL dojo.provide STATEMENTS IN plugins>

1. GENERATE build_X_.config.js FILE

cd C:\DATA\base\html\aqwa\bin
perl buildConfig.pl --inputdir C:\DATA\base\html\aqwa\html\plugins --outputfile C:\DATA\base\html\aqwa\html\dojo.1.2.2\util\buildscripts\profiles\aqwa.profile.js --name "../aqwa.js"

    ...    
    C:\DATA\base\html\aqwa\html\dojo.1.2.2\util\buildscripts\profiles\aqwa.profile.js
    
    Run time: 00:00:02
    Completed buildConfig.pl
    8:27PM, 19 May 2009
    ****************************************


2. RUN THE BUILD
            
cd C:\DATA\base\html\aqwa\html\dojo.1.2.2\util\buildscripts

mkdir C:\DATA\base\html\aqwa\build1

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="aqwa" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../../build1/ > ..\..\..\..\build1\build1-output.txt


3. COPY THE BUILT DOJO MODULES FILE aqwa.js TO THE plugins DIRECTORY


4. CREATE A NEW build1.html PAGE

INCLUDE THIS:

<script type="text/javascript" src="release-1.2.2/dojo/dojo.js"
	djConfig="isDebug: true, parseOnLoad: true, useCommentedJson: true"></script>

<!-- ADD THIS TO AVOID THIS ERROR: -->
<!-- [Exception... "'Error: Bundle not found: loading in dijit , locale=en-us' when calling method: [nsIDOMEventListener::handleEvent]" nsresult: "0x8057001c (NS_ERROR_XPC_JS_THREW_JS_OBJECT)" location: "<unknown>" data: no] -->
<script type="text/javascript" src="plugins/nls/report_en-us.js"></script>

<!-- COMPRESSED DOJO MODULES USED BY AQWA-->
<script type="text/javascript" src="plugins/aqwa.js"></script>


5. BROWSE TO http://localhost:8080/aqwa/html/build1.html

VERY FAST!!!







 

</entry>

<entry [Wed May 13 12:59:02 EDT 2009] UM COLOURS>

FOR LUBNA:

https://sg.med.miami.edu/UMH/CDA/UMH_Main/,DanaInfo=www6.miami.edu+0,1770,24594-1;57088-3,00.html

silk IMAGES

DOWNLOAD OF AQWA LATEST VERSION

ACCESS TO WIKI

NGSDEV



</entry>

<entry [Fri May 8 13:50:02 EDT 2009] FILE UTILITIES TO ADD TO utils IN AQWA WORKFLOW>

http://genome-test.cse.ucsc.edu/~kent/exe/usage.txt

With all of these you can use 'stdin' or 'stdout' as file name
arguments to get them to fit into a pipe o

------ Code generators/program utilities ----------
autoSql - Generate database/tab file objects
autoXml - Generate XML parser
newProg - make a new C source skeleton.
      You'll want to customize this one
stringify - Convert file to C strings
***subs - a utility to perform massive string substitutions on source

------ Genome Browser Database Related --------
***bedCoverage - Analyse coverage by bed files. Bases can
    be covered more than once (unlike featureBits)
***bedSort - Sort a .bed file by chrom,chromStart
featureBits - Correlate tables via bitmap projections.
****getFeatDna - Get dna for a type of feature in browser database.
hgsql - Execute some sql code using passwords in .hg.conf
      same as 'mysql -u user -ppassword -A'

--------Text crunching------------
***catDir - concatenate files in directory to stdout.
     For those times when too many files for cat to handle.
***countChars - Count the number of occurences of a particular char
***endsInLf - Check that last letter in files is end of line
***fixCr - strip <CR>s from ends of lines
***randomLines - Pick out random lines from file
***subChar - Substitute one character for another throughout a file.
***toLower - Convert upper case to lower case in file. Leave other chars alone
***toUpper - Convert lower case to upper case in file. Leave other chars alone
***wordLine - chop up file by white space and output one word per line.

------ Number crunching----------
***addCols - Sum columns in a text file.
***aveCols - Add together columns
calc - Little command line calculator.
***tableSum - Sum or average rows and columns to produce smaller table.

------ Fasta file utilities --------
***faCmp - Compare two .fa files
***faFrag - Extract a piece of DNA from a .fa file.
*** faNoise - Add noise to .fa file
***faOneRecord - Extract a single record from a .FA file
***faRc - Reverse complement a FA file
***faSize - print total base count in fa files.
***faSplit - Split an fa file into several files.
***faTrans - Translate DNA .fa file to peptide




</entry>

<entry [Wed May 6 14:46:02 EDT 2009] CREATED IDENTICAL DIRECTORY STRUCTURE ON WINDOWS BY LINKING DIRECTORIES USING Junction Link Magic >

http://www.rekenwonder.com/linkmagic.htm

LINKED ON WINDOWS THE SAME AS USING THE ln COMMAND ON LINUX:

ln -s C:/DATA/base/html/aqwa/cgi-bin C:/DATA/base/cgi-bin/aqwa
ln -s C:/DATA/base/html/aqwa/lib C:/DATA/base/cgi-bin/aqwa/lib
ln -s C:/DATA/base/html/aqwa/conf C:/DATA/base/cgi-bin/aqwa/conf

NOTES AND DOWNLOADED APPLICATION ARE HERE:

C:/DATA/base/22-aqwa/resources/winXP

ADDITIONAL STEPS:

1. ADD FollowSymLinks TO httpd.conf TO AVOID "Don't have permission..." ERROR WHEN EXECUTING admin.cgi

    #Options ExecCGI -MultiViews +SymLinksIfOwnerMatch
    Options ExecCGI -MultiViews +FollowSymLinks


2. 	SET URL FOR CGI DIRECTORY IN index.html

	var cgiurl = "../../../cgi-bin/aqwa/";





</entry>

<entry [Tues May 5 09:40:02 EDT 2009] TEST COMPRESSED DOJO.JS AND PLUGINS>

REMEMBER TO CORRECT PATH TO CCS IN index.html

	/* DOJO style */
	@import "http://localhost:8080/Bioptic0.2.5/html/dojo.1.2.2/dojo/resources/dojo.css";
	/*@import "dojo.1.2.2/dijit/tests/css/dijitTests.css";*/

URL

http://localhost:8080/Bioptic0.2.5/builds/build8/index.html

    OK!


</entry>

<entry [Mon May 4 13:45:02 EDT 2009] 15GB MORE SPACE ON ngsdev>


[syoung@ngsdev /]$ df -a

    Filesystem            Size  Used Avail Use% Mounted on
    /dev/mapper/VolGroup00-LogVol00
                          5.8G  5.1G  393M  93% /
    proc                     0     0     0   -  /proc
    sysfs                    0     0     0   -  /sys
    devpts                   0     0     0   -  /dev/pts
    /dev/sda1              99M   12M   82M  13% /boot
    tmpfs                 502M     0  502M   0% /dev/shm
    none                     0     0     0   -  /proc/sys/fs/binfmt_misc
    sunrpc                   0     0     0   -  /var/lib/nfs/rpc_pipefs
    kronos:/home           17T   15T  1.8T  90% /nethome
    pluto:/store/Data01    43T   36T  7.8T  83% /mihg/data
    /dev/sdb1              15G  166M   14G   2% /data



</entry>

<entry [Sun May 3 22:59:02 EDT 2009] COMMITTED config.pl TO bin AND config.json TO conf>

mkdir /nethome/syoung/base/svn/aqwa
cd /nethome/syoung/base/svn/aqwa
svn checkout file:///srv/svn/aqwa/trunk/bin 
cd /nethome/syoung/base/svn/aqwa/bin

cp -r /nethome/syoung/base/html/Bioptic0.2.5/bin/* ./

svn delete sql/archive

    D         sql/archive/create_collections.sql
    D         sql/archive/create_collectiondatabase.sql
    D         sql/archive/create_collectionblast.sql
    D         sql/archive/create_users.sql
    D         sql/archive/create_stage.sql
    D         sql/archive/create_sessions.sql
    D         sql/archive/collections.sql
    D         sql/archive

svn commit -m "First version of config.pl, uses config.json to create default.json"

    Deleting       sql/archive    
    Committed revision 20.

svn add config.pl

svn commit -m "First version of config.pl, uses config.json to create default.json"

    Adding         config.pl
    Transmitting file data .
    Committed revision 21.

svn list file:///srv/svn/aqwa/trunk/bin

    ok
    
    
    
ADD conf/config.json
--------------------

cd /nethome/syoung/base/svn/aqwa
svn checkout file:///srv/svn/aqwa/trunk/conf 
cd /nethome/syoung/base/svn/aqwa/conf

cp -r /nethome/syoung/base/html/Bioptic0.2.5/conf/* ./

svn add config.json

svn commit -m "First version of config.json, used by config.pl to create default.json"

    Adding         config.json
    Transmitting file data .
    Committed revision 22.


svn list file:///srv/svn/aqwa/trunk/conf

    config.json
    default-linux.conf
    default-win32.conf
    default.conf




</entry>

<entry [Fri May 1 00:25:02 EDT 2009] REMOVED BUILDS FROM aqwa/trunk/html AND CREATED A SEPARATE FOLDER IN aqwa/branches/builds>

svn delete file:///srv/svn/aqwa/trunk/html/build8 -m "Remove build8 directory"

    Committed revision 17.

svn mkdir file:///srv/svn/aqwa/branches/builds -m "Dojo and plugins builds with compression"

    Committed revision 18.

MOVE dojo TO aqwa/branches/builds

svn mv file:///srv/svn/aqwa/trunk/html/dojo file:///srv/svn/aqwa/branches/builds/dojo -m "Move aqwa/trunk/html/dojo to aqwa/branches/dojo"

    Committed revision 19.


</entry>

<entry [Thu Apr 30 00:51:02 EDT 2009] CREATED CUSTOM TEMPLATE FOR AQWA .pl SCRIPTS>

PLACED IN:

    C:\Documents and Settings\syoung\Application Data\ActiveState\KomodoEdit\4.3\templates\My Templates\aqwa.pl



NOTES:

        This is a sample custom template for Komodo. The actual template file is:
    C:\Documents and Settings\syoung\Application Data\ActiveState\KomodoEdit\4.3\templates\My Templates\Sample Custom Template.txt

You can create your own templates with any content you wish.
See "Custom Templates" in Komodo's on-line help for more details.



</entry>

<entry [Thu Apr 30 00:51:02 EDT 2009] CREATED CONFIG INSTALL SCRIPT config.pl>


PURPOSE:

    CONFIGURE AQWA WITH THE USER-DEFINED FILE PATHS AND SETTINGS OR DEFAULTS:
    
        1. LINK cgi-bin TO /var/www/cgi-bin
        -----------------------------------

        ln -s cgi-bin /var/www/cgi-bin/aqwa

        ln -s cgi-bin /var/www/cgi-bin/aqwa


        2. LINK lib AND conf TO INSIDE OF cgi-bin
        -----------------------------------------
        
        ln -s lib /var/www/cgi-bin/aqwa/lib
        ln -s conf /var/www/cgi-bin/aqwa/conf
        
        
        3. PATHS TO BASIC EXECUTABLES 
        -----------------------------
        
        
        
        CONF FILE:
        
            BIN                     /nethome/syoung/base/bin
            BINDIR                  /nethome/syoung/base/html/Bioptic0.2.5/bin
            FILEROOT                /nethome/syoung/base/html/Bioptic0.2.5/fileroot
            ROOTDIR		            /nethome/syoung/base/pipeline
            
            RUNMAPPING              /nethome/syoung/base/apps/454/2.0.00.20-64/bin/runMapping 
            
            GAPIPELINE_BIN          /mihg/analysis/GAPipeline-1.3.2/bin/
            ELAND                   /mihg/analysis/GAPipeline-1.3.2/bin/ELAND_standalone.pl
            BUSTARD                 /mihg/analysis/GAPipeline-1.3.2/bin/bustard.py
            GOAT_PIPELINE           /mihg/analysis/GAPipeline-1.3.2/bin/goat_pipeline.py
            SQUASH                  /mihg/analysis/GAPipeline-1.3.2/bin/squashGenome
            
            MIRA    	            /nethome/syoung/base/apps/mira/bin/mira
            VELVET                  /nethome/syoung/base/apps/velvet/velvet
            NUCMER                  /nethome/syoung/base/apps/mummer/nucmer
            DELTAFILTER             /store/nethome/syoung/base/apps/mummer/delta-filter
            SHOWCOORDS              /store/nethome/syoung/base/apps/mummer/show-coords
            VCAKE                   /nethome/syoung/base/apps/vcake/VCAKE_1.0.pl
            HTMLURL		            http://solexa01.med.miami.edu
            HTMLDIR		            /var/www/html
            PHRED_PARAMETER_FILE	/Users/young/FUNNYBASE/apps/phred/phredpar.dat
            MYSQLDATA		        /usr/local/mysql/data
            CLUSTER_MYSQLDATA       /private/var/mysql


INPUT:

    cgi-bin     CGI executables directory - link 'cgi-bin' to this 
    html        Web directory - link 'html' directory to this
    base        Base directory to install bin, lib, html, cgi-bin, etc. directories
    conf        Replace entries to additional executables in default.conf file with user-defined paths


OUTPUT:

    The following directory structure
    
     <base>/bin
            cgi-bin --> /var/www/cgi-bin/aqwa
            conf    --> /var/www/cgi-bin/aqwa/conf
            fileroot
            html    --> /var/www/html/aqwa
            lib     --> /var/www/cgi-bin/aqwa/lib
            perlmods
            t
            
            
            
USES FindBin
http://www.xav.com/perl/lib/FindBin.html

SYNOPSIS

 use FindBin;
 use lib "$FindBin::Bin/../lib";

 or

 use FindBin qw($Bin);
 use lib "$Bin/../lib";

DESCRIPTION

Locates the full path to the script bin directory to allow the use of paths relative to the bin directory.

This allows a user to setup a directory tree for some software with directories <root>/bin and <root>/lib and then the above example will allow the use of modules in the lib directory without knowing where the software tree is installed.

If perl is invoked using the -e option or the perl script is read from STDIN then FindBin sets both $Bin and $RealBin to the current directory.

EXPORTABLE VARIABLES

 $Bin         - path to bin directory from where script was invoked
 $Script      - basename of script from which perl was invoked
 $RealBin     - $Bin with all links resolved
 $RealScript  - $Script with all links resolved





</entry>

<entry [Wed Apr 29 00:51:02 EDT 2009] CHROMOSOME CYTOGENETIC MAP DOWNLOAD>

ftp://ftp.ncbi.nih.gov/genomes/H_sapiens/mapview/




</entry>

<entry [Wed Apr 9 18:26:36 EST 2009] PERL AND JAVASCRIPT UML GENERATOR>

1. INSTALLED UML::Class::Simple
-------------------------------

1.1 INSTALLED BASIC DEPENDENCIES FOR UML::Class::Simple

use Class::Inspector;
use IPC::Run3;
use List::MoreUtils 'any';
use Template;


2. INSTALLED XML::LibXML DEPENDENCY (TRICKY)

http://www.experts-exchange.com/OS/Microsoft_Operating_Systems/Windows/XP/Q_22775735.html

ppm repo add http://theoryx5.uwinnipeg.ca/ppms
ppm repo add http://trouchelle.com/ppm10/

OR ADD THEM MANUALLY

ppm



(BRINGS UP PPM GUI)

THEN RAN install-libxml.pl

AND ALSO ADDED lI


C:\DATA\22-aqwa\resources\SDD\UML\perl.UML\perl2UML>ppm repo
+++++++++++++++++++++++++++++++++++++++++++++++
+ id + pkgs  + name                           +
+++++++++++++++++++++++++++++++++++++++++++++++
+  1 +  9856 + ActiveState Package Repository +
+  2 +     0 + theoryx5.uwinnipeg.ca          +
+  3 +     0 + theoryx5.uwinnipeg.ca          +
+  4 +   454 + Bribes de Perl                 +
+  5 +     0 + theoryx5.uwinnipeg.ca          +
+  6 + 10688 + trouchelle.com                 +
+  7 +   289 + cpan.uwinnipeg.ca              +
+  8 +  9856 + ppm4.activestate.com           +
+++++++++++++++++++++++++++++++++++++++++++++++
 (8 enabled repositories)

C:\DATA\22-aqwa\resources\SDD\UML\perl.UML\perl2UML>perl test-UML-Class-Simple-v
1.pl
Use UML::Class::Simple OK!!


2. INSTALLED DEPENDENCIES FOR umlclass.pl

use File::Slurp;
use YAML::Syck;
use Getopt::Long;


3. USAGE FOR umlclass.pl

umlclass.pl -M Foo -o foo.png -p "^Foo::"
umlclass.pl -o bar.gif -p "Bar::|Baz::" lib/Bar.pm lib/*/*.pm
umlclass.pl -o blah.png -p Blah -r ./blib
umlclass.pl --without-inherited-methods -o blah.png -r lib

cd C:\DATA\22-aqwa\resources\SDD\UML\perl.UML\UML-Class-Simple-0.17\UML-Class-Simple-0.17\script

perl umlclass.pl -M DBase -o DBase.xmi -p "^DBase::"

###perl umlclass.pl -M test/DBase -o test/DBAse.xmi 

cd C:\DATA\base\html\Bioptic0.2.3\lib

cd C:\DATA\22-aqwa\resources\SDD\UML\perl.UML\UML-Class-Simple-0.17\UML-Class-Simple-0.17\script

C:\DATA\22-aqwa\resources\SDD\UML\perl.UML\UML-Class-Simple-0.17\UML-Class-Simple-0.17\script\umlclass.pl -M DBase -o DBase.xmi -p "^DBase"


    ERROR: The dot program (dot) cannot be found or be run.

    UML::Class::Simple LINE 

        sub dot_prog {
            my $self = shift;
            if (@_) {
                my $cmd = shift;
                can_run($cmd) or die "ERROR: The dot program ($cmd) cannot be found or be run.\n";
                $self->{dot_prog} = $cmd;
            } else {
                $self->{dot_prog} || 'dot';
            }
        }



Autodia
http://search.cpan.org/~teejay/Autodia-2.08/autodia.pl
http://www.aarontrevena.co.uk/opensource/autodia/

autodia.pl - a perl script using the Autodia modules to create UML Class Diagrams or documents. from code or other data sources.

INTRODUCTION ^

AutoDia takes source files as input and using a handler parses them to create documentation through templates. The handlers allow AutoDia to parse any language by providing a handler and registering in in autodia.pm. The templates allow the output to be heavily customised from Dia XML to simple HTML and seperates the logic of the application from the presentation of the results.

AutoDia is written in perl and defaults to the perl handler and file extension matching unless a language is specified using the -l switch.

AutoDia requires Template Toolkit and Perl 5. Some handlers and templates may require additional software, for example the Java SDK for the java handler.

AutoDia can use GraphViz to generate layout coordinates, and can produce di-graphs (notation for directional graphs) in dot (plain or canonical) and vcg, as well as Dia xml.

Helpful information, links and news can be found at the autodia website - http://www.aarontrevena.co.uk/opensource/autodia/

USAGE

autodia.pl ([-i filename [-p path] ] or [-d directory [-r] ]) [options]
autodia.pl -i filename : use filename as input
autodia.pl -i 'filea fileb filec' : use filea, fileb and filec as input
autodia.pl -i filename -p .. : use ../filename as input file
autodia.pl -d directoryname : use *.pl/pm in directoryname as input files
autodia.pl -d 'foo bar quz' : use *pl/pm in directories foo, bar and quz as input files
autodia.pl -d directory -r : use *pl/pm in directory and its subdirectories as input files
autodia.pl -d directory -F : use files in directory but only one file per diagram =item autodia.pl -d directory -C : use files in directory but skip CVS directories
autodia.pl -o outfile.xml : use outfile.xml as output file (otherwise uses autodial.out.dia)
autodia.pl -O : output to stdout
autodia.pl -l language : parse source as language (ie: C) and look for appropriate filename extensions if also -d
autodia.pl -t templatefile : use templatefile as template (otherwise uses template.xml)
autodia.pl -l DBI -i "mysql:test:localhost" -U username -P password : use test database on localhost with username and password as username and password
autodia.pl -z : output via graphviz
autodia.pl -Z : output via springgraph
autodia.pl -v : output via VCG
autodia.pl -s skipfile : exclude files or packagenames matching those listed in file
c<autodia.pl -D : ignore dependancies (ie do not process or display dependancies)>
autodia.pl -K : do not display packages that are not part of input
autodia.pl -k : do not display superclasses that are not part of input
autodia.pl -H : show only Public/Visible methods
autodia.pl -m : show only Class methods
autodia.pl -M : do not show Class Methods
autodia.pl -a : show only Class Attributes
autodia.pl -A : do not show Class Attributes
autodia.pl -S : silent mode, no output to stdout except with -O
autodia.pl -h : display this help message
autodia.pl -V : display version and copyright message



</entry>

<entry [Sun Apr 5 23:29:36 EST 2009] SOFTWARE DESIGN DOCUMENT>




PURPOSE OF THE DOCUMENT (OPENACS):

Areas of interest to users:

    *      Performance: availability and efficiency
    *      Flexibility
    *      Interoperability
    *      Reliability and robustness
    *      Usability 



Bolchini, 2009 supplementary
1.2	Summary of Usability Problems

The types of usability problems discovered and addressed during usability analysis of CATH mainly concern navigation and interface design. It is interesting to note that the actual occurrences of these problems often reach a very high number because of the database-driven nature of the web application, as it automatically replicates the same problem for every data instance of the same type. For example, a wrong navigation link in each superfamily overview page accounts for one problem types, but it will have as many instances as many superfamilies are present in the repository.
The total number of usability problems found and characterized during inspection are organized by design dimensions (Table 1) and listed according to the relevant MILE+ heuristics (table 2).



Areas of interest to developers/software assessors:

    *      Maintainability
    *      Portability
    *      Reusability
    *      Testability 





Tigris TEMPLATE
http://readyset.tigris.org/nonav/templates/frameset.html
DOWNLOAD TEMPLATE SET
http://readyset.tigris.org/servlets/ProjectDocumentList




TRANSFER TECHNOLOGY

JSON


USING PERL CGI

Perl CGI has a simpler interface (and less overhead?) than more specialised modules such as JSON::RPC::Client, etc.


http://search.cpan.org/~makamaka/JSON-RPC-0.96/lib/JSON/RPC/Server/CGI.pm


EXTRA PERL MODULES ARE INSTALLED IN lib

C:\DATA\base\html\Bioptic0.2.5\lib\5.8.8\x86_64-linux-thread-multi




OpenACS
Detailed Design Documentation Template
http://openacs.org/doc/current/filename.html


Detailed Design Documentation Template

By You
Start Note

NOTE: Some of the sections of this template may not apply to your package, e.g. there may be no user-visible UI elements for a component of the OpenACS Core. Furthermore, it may be easier in some circumstances to join certain sections together, e.g. it may make sense to discuss the data model and transactions API together instead of putting them in separate sections. And on occasion, you may find it easier to structure the design discussion by the structure used in the requirements document. As this template is just a starting point, use your own judgment, consult with peers when possible, and adapt intelligently.

Also, bear in mind the audience for detailed design: fellow programmers who want to maintain/extend the software, AND parties interested in evaluating software quality.
Essentials

When applicable, each of the following items should receive its own link:

    *      User directory
    *      OpenACS administrator directory
    *      Subsite administrator directory
    *      Tcl script directory (link to the API browser page for the package)
    *      PL/SQL file (link to the API browser page for the package)
    *      Data model
    *      Requirements document
    *      ER diagram
    *      Transaction flow diagram 

Introduction

This section should provide an overview of the package and address at least the following issues:

    *      What this package is intended to allow the user (or different classes of users) to accomplish.
    *      Within reasonable bounds, what this package is not intended to allow users to accomplish.
    *      The application domains where this package is most likely to be of use.
    *      A high-level overview of how the package meets its requirements (which should have been documented elsewhere). This is to include relevant material from the "features" section of the cover sheet (the cover sheet is a wrapper doc with links to all other package docs). 

Also worthy of treatment in this section:

    *      When applicable, a careful demarcation between the functionality of this package and others which - at least superficially - appear to address the same requirements. 

Note: it's entirely possible that a discussion of what a package is not intended to do differs from a discussion of future improvements for the package.
Historical Considerations

For a given set of requirements, typically many possible implementations and solutions exist. Although eventually only one solution is implemented, a discussion of the alternative solutions canvassed - noting why they were rejected - proves helpful to both current and future developers. All readers would be reminded as to why and how the particular solution developed over time, avoiding re-analysis of problems already solved.
Competitive Analysis

Although currently only a few package documentation pages contain a discussion of competing software, (e.g. chat, portals), this section should be present whenever such competition exists.

    *      If your package exhibits features missing from competing software, this fact should be underscored.
    *      If your package lacks features which are present in competing software, the reasons for this should be discussed here; our sales team needs to be ready for inquiries regarding features our software lacks. 

Note that such a discussion may differ from a discussion of a package's potential future improvements.
Design Tradeoffs

No single design solution can optimize every desirable software attribute. For example, an increase in the security of a system will likely entail a decrease in its ease-of-use, and an increase in the flexibility/generality of a system typically entails a decrease in the simplicity and efficiency of that system. Thus a developer must decide to put a higher value on some attributes over others: this section should include a discussion of the tradeoffs involved with the design chosen, and the reasons for your choices. Some areas of importance to keep in mind are:

Areas of interest to users:

    *      Performance: availability and efficiency
    *      Flexibility
    *      Interoperability
    *      Reliability and robustness
    *      Usability 

Areas of interest to developers:

    *      Maintainability
    *      Portability
    *      Reusability
    *      Testability 

API

Here's where you discuss the abstractions used by your package, such as the procedures encapsulating the legal transactions on the data model. Explain the organization of procedures and their particulars (detail above and beyond what is documented in the code), including:

    *      Problem-domain components: key algorithms, e.g. a specialized statistics package would implement specific mathematical procedures.
    *      User-interface components: e.g. HTML widgets that the package may need.
    *      Data management components: procedures that provide a stable interface to database objects and legal transactions - the latter often correspond to tasks. 

Remember that the correctness, completeness, and stability of the API and interface are what experienced members of our audience are looking for. This is a cultural shift for us at aD (as of mid-year 2000), in that we've previously always looked at the data models as key, and seldom spent much effort on the API (e.g. putting raw SQL in pages to handle transactions, instead of encapsulating them via procedures). Experience has taught us that we need to focus on the API for maintainability of our systems in the face of constant change.
Data Model Discussion

The data model discussion should do more than merely display the SQL code, since this information is already be available via a link in the "essentials" section above. Instead, there should be a high-level discussion of how your data model meets your solution requirements: why the database entities were defined as they are, and what transactions you expect to occur. (There may be some overlap with the API section.) Here are some starting points:

    *      The data model discussion should address the intended usage of each entity (table, trigger, view, procedure, etc.) when this information is not obvious from an inspection of the data model itself.
    *      If a core service or other subsystem is being used (e.g., the new parties and groups, permissions, etc.) this should also be mentioned.
    *      Any default permissions should be identified herein.
    *      Discuss any data model extensions which tie into other packages.
    *      Transactions

      Discuss modifications which the database may undergo from your package. Consider grouping legal transactions according to the invoking user class, i.e. transactions by an OpenACS-admin, by subsite-admin, by a user, by a developer, etc. 

User Interface

In this section, discuss user interface issues and pages to be built; you can organize by the expected classes of users. These may include:

    *      Developers
    *      OpenACS administrators (previously known as site-wide administrators)
    *      Subsite administrators
    *      End users

You may want to include page mockups, site-maps, or other visual aids. Ideally this section is informed by some prototyping you've done, to establish the package's usability with the client and other interested parties.

Note: In order that developer documentation be uniform across different system documents, these users should herein be designated as "the developer," "the OpenACS-admin," "the sub-admin," and "the user," respectively.

Finally, note that as our templating system becomes more entrenched within the OpenACS, this section's details are likely to shift from UI specifics to template interface specifics.
Configuration/Parameters

Under OpenACS 5.2.0, parameters are set at two levels: at the global level by the OpenACS-admin, and at the subsite level by a sub-admin. In this section, list and discuss both levels of parameters.
Future Improvements/Areas of Likely Change

If the system presently lacks useful/desirable features, note details here. You could also comment on non-functional improvements to the package, such as usability.

Note that a careful treatment of the earlier "competitive analysis" section can greatly facilitate the documenting of this section.
Authors

Although a system's data model file often contains this information, this isn't always the case. Furthermore, data model files often undergo substantial revision, making it difficult to track down the system creator. An additional complication: package documentation may be authored by people not directly involved in coding. Thus to avoid unnecessary confusion, include email links to the following roles as they may apply:

    *      System creator
    *      System owner
    *      Documentation author

Revision History

The revision history table below is for this template - modify it as needed for your actual design document.
Document Revision #	Action Taken, Notes	When?	By Whom?
0.3	Edited further, incorporated feedback from Michael Yoon	9/05/2000	Kai Wu
0.2	Edited	8/22/2000	Kai Wu
0.1	Creation	8/21/2000	Josh Finkler, Audrey McLoghlin









RPC-Simple

TOO SLOW AND TOO MUCH OVERHEAD COMPARED TO SIMPLE CGI.



RUN SERVER

C:\DATA\base\cgi-bin\Bioptic0.2.5>perl rpc-server.pl
spawned server pid -7720
rpc-server.pl -7720: server started on port 7810 at Sun Apr  5 01:43:54 2009
killing process -7720
Accepting connection
Connection accepted
Comparing 127.0.0.1 with 127.0.0.1
rpc-server.pl -7720: connection from localhost [ 127.0.0.1 ]  at Sun Apr  5 01:4
3:59 2009
reading fno 4
readClient called
-> #begin_buffer
-> #begin
-> $args = [];
-> $method = 'new';
-> $reqId = 0;
-> $handle = 0;
-> $objectName = 'MyRemote.pm';
-> #end
-> #end_buffer
-> #begin_buffer
-> #begin
-> $args = [
->           'callback',
->           'answer'
->         ];
-> $method = 'remoteAsk';
-> $reqId = undef;
-> $handle = 0;
-> #end
-> #end_buffer
code is laundered
Call new
creating new MyRemote
#begin
$args = [
          1,
          ''
        ];
$method = undef;
$reqId = 0;
$handle = 0;
#end

101 bytes sent
code is laundered
Call remoteAsk
#begin
$args = [
          'Hello local object'
        ];
$method = 'answer';
$reqId = undef;
$handle = 0;
#end

send failed Unknown error
 bytes sent
readClient finished
reading fno 4
readClient called
closing fno 4 (error after reading)
closing connection




RUN CLIENT

C:\DATA\base\cgi-bin\Bioptic0.2.5>perl rpc-client.pl
RPC::Simple::Factory object created
Creating RPC::Simple::Agent for MyRemote.pm
#begin
$args = [];
$method = 'new';
$reqId = 0;
$handle = 0;
$objectName = 'MyRemote.pm';
#end

121 bytes sent
#begin
$args = [
          'callback',
          'answer'
        ];
$method = 'remoteAsk';
$reqId = undef;
$handle = 0;
#end

152 bytes sent
class MyLocal destroyed
closing Factory socket



TROUBLESHOOTING: FIX Fcntl macro F_SETFL ERROR ON WINDOWS

ERROR

Your vendor has not defined Fcntl macro F_SETFL, used at RPC/Simple/Factory.pm l
ine 75.

Your vendor has not defined Fcntl macro F_SETFL, used at RPC/Simple/Server.pm li
ne 351.


SOLUTION

COMMENT OUT THE ABOVE LINES ON WINDOWS



RUN t/connection.t


cd C:\DATA\base\html\Bioptic0.2.5\perlmods\RPC-Simple-1.002\RPC-Simple-1.002\t
perl connection.t

1..5
ok 1 - use RPC::Simple;
spawned server pid -7700
connection.t -7700: server started on port 7810 at Sun Apr  5 00:43:37 2009
ok 2 - server spawned
RPC::Simple::Factory object created
Accepting connection
Connection accepted
ok 3 - Factory created
creating MyLocal
Comparing 127.0.0.1 with 127.0.0.1
Creating RPC::Simple::Agent for t::RealMyLocal.pm
connection.t -7700: connection from localhost [ 127.0.0.1 ]  at Sun Apr  5 00:43
:39 2009
ok 4 - Local object created
ok 5
killing process -7700



DOJO
http://en.wikipedia.org/wiki/Dojo_Toolkit

From Wikipedia, the free encyclopedia

The Dojo Toolkit is an open source modular JavaScript library (or more specifically JavaScript toolkit) designed to ease the rapid development of cross platform, JavaScript/Ajax based applications and web sites. It was started by Alex Russell, Dylan Schiemann, David Schontzler, and others in 2004 and is dual-licensed under the BSD License and the Academic Free License. The Dojo Foundation is a non-profit organization[1] designed to promote the adoption of the toolkit.


Daffodil

INTERACTION DIAGRAMS

Creation of Object ServerDDL Object
CreatorSession
 create object
 check semantic
 check privileges
 verify object uniqueness
 grant privileges on new object
 save meta-data of the object
 allocate space for object
 commit current transactionDDL query will check the semantic of the query DDL query will commit the current transaction before executionDDL query will check the privileges of user for object creationDDL query will check if an object is already existing with same nameDDL query will save the meta data about the object in the databaseDDL query will grant the necessary privileges to user for accessing/modifying the objectDDL query will interact with session to allocate space for object (if required)


Figure 16
 Interaction Diagram - creation of object
Flow Explanations

1:  User is giving call to system by executing query through server for creation of objects like table, view, schema, index, database etc.
2:  DDL Object Creation Query will check the semantic of the query before executing it. Semantic checking involves checking of rules specified in SQL 99 for object creation. Rules differ according to the type of object created but some rules are common like name of objects, uniqueness of sub-constituent like column, info according to sub-constituents specification and type.
3: Before executing the DDL query, query will commit the current transaction so that user data is saved.
4: DDL query will check for privileges of the current user for creating object. Current user must be the owner of the schema in which object is created. If a new schema is created then user must be a valid.
5: DDL query will ensure that no other object with same name is existing in the schema. Query will also check the other dependencies as specified in SQL 99 for the object.
6: DDL query will save the meta data about the object in the database by interacting with Session.
7: Query will grant privileges on the newly created object to the current user for accessing/modifying object. Current user will be allowed to grant/give these privileges to other users for accessing/modifying the data. Other users will not be able to modify the definition of object.
8: DDL query will interact with session to allocate space for object, if required (Like in case of table, index) in Data Store.
9: Control is returned to the server.





JSON
http://www.crockford.com/JSON/

JSON-RPC
http://www.json-rpc.org/

XMLHttpRequest
http://www.mozilla.org/xmlextras/


Explanation of standard formats and protocols:
http://oss.metaparadigm.com/jsonrpc/

    * JSON (JavaScript Object Notation) is a lightweight data-interchange format with language bindings for C, C++, C#, Java, JavaScript, Perl, TCL and others.
    * JSON-RPC is a simple remote procedure call protocol similar to XML-RPC although it uses the lightweight JSON format instead of XML.
    * XMLHttpRequest object (or MSXML ActiveX in the case of Internet Explorer) is used in the browser to call remote methods on the server without reloading the page.
    * JSON-RPC-Java is a Java implementation of the JSON-RPC protocol.

Highlights of some of the features of JSON-RPC-Java:

    * Dynamically call server-side Java methods from JavaScript DHTML web applications. No Page reloading.
    * Asynchronous communications.
    * Transparently maps Java objects to JavaScript objects.
    * Lightweight protocol similar to XML-RPC although much faster.
    * Leverages J2EE security model with session specific exporting of objects.
    * Supports Internet Explorer, Mozilla, Firefox, Safari, Opera and Konqueror [1].


JSON-RPC
From Wikipedia, the free encyclopedia
http://en.wikipedia.org/wiki/JSON-RPC

JSON-RPC is a remote procedure call protocol encoded in JSON. It is a very simple protocol (and very similar to XML-RPC), defining only a handful of data types and commands. In contrast to XML-RPC or SOAP, it allows for bidirectional communication between the service and the client, treating each more like peers and allowing peers to call one another or send notifications to one another. It also allows multiple calls to be sent to a peer which may be answered out of order.

A JSON invocation can be carried on an HTTP request where the content-type is application/json[1]. Besides using HTTP for transport, one may use TCP/IP sockets. Using sockets, one can create much more responsive web applications with JSON-RPC, compared to polling data from a service with JSON-RPC over HTTP.


Examples

In these examples, --> denotes data sent to a service (request), while <-- denotes data coming from a service. (Although this direction often is called response in client-server computing, depending on the JSON-RPC version it does not necessarily imply answer to a request).

[edit] Version 1.0

A simple request and response:

--> { "method": "echo", "params": ["Hello JSON-RPC"], "id": 1}
<-- { "result": "Hello JSON-RPC", "error": null, "id": 1}

This example shows parts of a communication from an example chat application. The chat service sends notifications for each chat message the client peer should receive. The client peer sends requests to post messages to the chat and expects a positive reply to know the message has been posted.[3]

...
--> {"method": "postMessage", "params": ["Hello all!"], "id": 99}
<-- {"result": 1, "error": null, "id": 99}
<-- {"method": "handleMessage", "params": ["user1", "we were just talking"], "id": null}
<-- {"method": "handleMessage", "params": ["user3", "sorry, gotta go now, ttyl"], "id": null}
--> {"method": "postMessage", "params": ["I have a question:"], "id": 101}
<-- {"method": "userLeft", "params": ["user3"], "id": null}
<-- {"result": 1, "error": null, "id": 101}
...




Version 1.1 (Working Draft)

The format of the contents of a request might be something like that shown below:

{ 
"version": "1.1", 
"method": "confirmFruitPurchase", 
"id": "194521489", 
"params": [ 
    [ "apple", "orange", "pear" ], 
    1.123 
]
}

The format of a response might be something like this:

{ 
"version": "1.1", 
"result": "done", 
"error": null, 
"id": "194521489"
}

[edit] Version 2.0 (Specification Proposal)

Procedure Call with positional parameters:

--> {"jsonrpc": "2.0", "method": "subtract", "params": [42, 23], "id": 1}
<-- {"jsonrpc": "2.0", "result": 19, "id": 1}

--> {"jsonrpc": "2.0", "method": "subtract", "params": [23, 42], "id": 2}
<-- {"jsonrpc": "2.0", "result": -19, "id": 2}

Procedure Call with named parameters:

--> {"jsonrpc": "2.0", "method": "subtract", "params": {"subtrahend": 23, "minuend": 42}, "id": 3}
<-- {"jsonrpc": "2.0", "result": 19, "id": 3}

--> {"jsonrpc": "2.0", "method": "subtract", "params": {"minuend": 42, "subtrahend": 23}, "id": 4}
<-- {"jsonrpc": "2.0", "result": 19, "id": 4}

Notification:

--> {"jsonrpc": "2.0", "method": "update", "params": [1,2,3,4,5]}

--> {"jsonrpc": "2.0", "method": "foobar"}

Procedure Call of non-existent procedure:

--> {"jsonrpc": "2.0", "method": "foobar", "id": 10}
<-- {"jsonrpc": "2.0", "error": {"code": -32601, "message": "Procedure not found."}, "id": 10}

Procedure Call with invalid JSON:

--> {"jsonrpc": "2.0", "method": "foobar, "params": "bar", "baz"]
<-- {"jsonrpc": "2.0", "error": {"code": -32700, "message": "Parse error"}, "id": null}

Procedure Call with invalid JSON-RPC:

--> [1,2,3]
<-- {"jsonrpc": "2.0", "error": {"code": -32600, "message": "Invalid JSON-RPC."}, "id": null}

--> {"jsonrpc": "2.0", "method": 1, "params": "bar"}
<-- {"jsonrpc": "2.0", "error": {"code": -32600, "message": "Invalid JSON-RPC."}, "id": null}

[edit] Implementations






</entry>

<entry [Sat Apr 4 09:29:36 EST 2009] SELECTED APIs>


WAVEMAKER VISUAL AJAX STUDIO
http://www.wavemaker.com/product/screencasts.html





JSON-RPC API
From OpenCog
http://opencog.org/wiki/JSON-RPC_API#add_atom
https://blueprints.launchpad.net/opencog/+spec/json-rpc


Provide a JSON-RPC API
Priority: 	Undefined
Definition: 	New (Needs guidance)
Implementation: 	Unknown
Assignee: 	None
Drafter: 	ferrouswheel
Approver: 	ferrouswheel

Provide JSON-RPC calls to the AtomSpace methods and server requests system. It should designed in such a way so that the system can be extended relatively easily for XML-RPC and perhaps even Google's Protocol buffers. Requests to support should include:

    * Create and delete atoms.
    * Retrieve sequences of atoms based on search criteria (getHandleSet equivalent).
    * Get the incoming and outgoing sets.
    * Modify importance and truth values.
    * All the cogserver requests (means dynamically adding new JSON methods when modules that provide new requests are loaded).
    * Request for all available methods.
    

This page outlines the specifications for a JSON-RPC interface for OpenCog (Launchpad blueprint here).
Contents
[hide]

    * 1 Introduction
    * 2 Implementation
    * 3 Methods
          o 3.1 AtomSpace
                + 3.1.1 add_atom
                + 3.1.2 get_atom
                + 3.1.3 remove_atom
                + 3.1.4 set_tv
                + 3.1.5 get_tv
                + 3.1.6 get_av
                + 3.1.7 set_av
                + 3.1.8 list_type
                + 3.1.9 get_by_type
          o 3.2 CogServer
                + 3.2.1 load_module, unload_module
                + 3.2.2 get_commands
                + 3.2.3 help
                + 3.2.4 agent control
                + 3.2.5 scm
                + 3.2.6 data
                + 3.2.7 shutdown

Introduction

From wikipedia:

<block-quote style="font-style:italic;"> JSON-RPC is is a remote procedure call protocol encoded in JSON. It is a very simple protocol (and very similar to XML-RPC), defining only a handful of data types and commands. In contrast to XML-RPC or SOAP, it allows for bidirectional communication between the service and the client, treating each more like peers and allowing peers to call one another or send notifications to one another. It also allows multiple calls to be sent to a peer which may be answered out of order. </block-quote>
Implementation

The server implementation should be able to respond to requests, and encapsulate all the below methods in a way that lets XML-RPC be implemented using the same framework (or possibly even Google's fast Protocol Buffers).

The implementation should also let the server be a send requests to the client too. Why? Because it'd be nice to have JSON clients be able to respond to add/remove signals if they want (obviously they have to connect to those signals first and indicate the callback).

There maybe more projects to investigate, but one C++ implementation of JSON-RPC exists at:

http://jsonrpc-cpp.sourceforge.net/
Methods

There are many methods that could be implemented, but initially, a minimum set to be functionally useful should be concentrated on.
AtomSpace
add_atom

Add an atom. Whether this is intepreted as a link or node depends on the atom arity (0 for a node), name (links have no name), and type (whether the given type inherits from node or link).

Returns the handle/UUID of the atom if successful and UNDEFINED_HANDLE if not.
get_atom

Get an atom's detail by handle.
remove_atom

Remove an atom by handle.
set_tv

Set the TruthValue of an atom by handle.

(Should support SimpleTruthValue, CompositeTruthValue, IndefiniteTruthValue, etc.)
get_tv

Get the TruthValue of an atom by handle.
get_av

Get the AttentionValue of an atom by handle.
set_av

Set the AttentionValue of an atom by handle.
list_type

Return a list of types that the CogServer currently recognises.
get_by_type

Return a list of handles that are of a given Type..
CogServer
load_module, unload_module

Attempt to load/unload a dynamic module.

(Should also create a list_modules command... which lists the modules that are loaded, and a available_modules command which lists the modules that were compiled... although the latter would probably require some CMake wizardry).
get_commands

Return a list of available commands, these should be based on the Request objects registered with the CogServer (i.e the list will change depending on what modules are loaded), but also should include all of the above AtomSpace commands too.

If a string parameter is given, then only return commands that are prefixed with that string. This will be useful for eventually implementing a shell with command completion.
help

Return usage information for any of the commands, and also for the other JSON_RPC calls (so the AtomSpace ones will have to described manually, the CogServer commands have help info already).
agent control

As per those shown in the shell on start up...

    * agents-list: List running agents
    * agents-start: Start some agents
    * agents-start-loop: Start the agent loop
    * agents-step: Run a single cycle of an agent(s)
    * agents-stop: Stop some agents running
    * agents-stop-loop: Stop the agent loop 

scm

Possibly needs to considered separately to the other commands, but this should evaluate a string using the Scheme interpreter and return the result.
data

(should probably actually call this load_xml or something)

Similar to scm, but load raw XML.
shutdown

Shutdown the server. 
GOOGLE JSON API


http://googlesystem.blogspot.com/2006/11/secret-google-json-api.html


Secret Google JSON API
Google already offers feeds for Google News, Blog Search, Google Video, so you can use the search results in your applications or sites. There's also a Google API for web search that uses SOAP, but it's limited to 1000 queries per day.

For the first time, Google offers a new kind of API, unified for web search, image search, blog search and video search. The API uses JSON, so creating applications in JavaScript is easy. You must know that this API is unofficial, so the details can change.

Google JSON API is the foundation of SearchMash, an experimental site created by Google.

So how do you get the search results using this API? You just load this page:
http://www.searchmash.com/results/[query]. You just have to replace [query] with the actual query. If you use this format: http://www.searchmash.com/results/[query]?i=11&n=10, you request 10 search results, starting with the result number 11. The formats for image search, blog search and video search are:

http://www.searchmash.com/results/images:[query]
http://www.searchmash.com/results/blogs:[query]
http://www.searchmash.com/results/video:[query]

The JSON object you get from Google has a list of members that are very easy to understand, like: estimatedCount (the number of search results) or results, which is an array that describes the search results. To make cross-domain requests, you may need to create a web proxy, like shown here.


SEARCHMASH
http://googlesystem.blogspot.com/2006/10/searchmash-new-google-search-site.html




WORKS JSON API - use can provide callback 
http://www.librarything.com/thingology/2008/03/first-cut-works-json-api.php


Tuesday, March 25, 2008
First cut: Works JSON API
I've finished a simple Javascript/JSON API to LibraryThing's core work information. In structure and implementation the API resembles Google's recent Book Search API, but for LibraryThing.

Purpose. The API is designed to help libraries and others to add links to LibraryThing when LibraryThing has a book, and omit them when we don't. It's an easy conditional-linking system.

But the API returns other work information too, including the number of copies, number of reviews and average rating (with rating image). It comes with a simple function to insert the data where appropriate, but you can funnel this information to functions of your own devising.

Scope. This is an API to work information. Once I've worked through the kinks here, I plan to release a member API, allowing members to do clever things with their data. For example, members will be able to make their own widgets, not just rely on ours.

How it works. The basic mode of operation is to insert a script as follows:

<script src="http://www.librarything.com/api/json/workinfo.js?ids=*******"></script>

The ******* is reserved for the ISBNs you want to look up on LibraryThing, separated by commas. NOTE: This script should be placed at the bottom of the page.

For example, the JSON API Test includes one ISBN-10, one ISBN-13, one LCCN and one OCLC number.

<script src="http://www.librarything.com/api/json/workinfo.js?ids=0066212898,9780520042728,99030698,ocn8474750911"></script>

The script returns a hunk of JavaScript, including both the simple function and the JSON hash with all the book data. The hash is sent to a function of your choosing, or the simple LT_addLibraryThinglinks by default. To name another callback function add &callback= and the function name to the URL.

The function LT_addLibraryThinglinks looks for elements (DIVs, SPANs, etc.) with the ID "LT_xxx" where xxx is one of your identifiers. If LibraryThing has a work, it adds "(See on LibraryThing)", with link. If not, it does nothing.

Here's the JavaScript returned for the URL above:

LT_addLibraryThinglinks(
{
"0066212898":
{"id":"0066212898","type":"isbn","work":"3702986","link":"http:\/\/www.librarything.com\/work\/3702986","copies":"105","reviews":"7","rating":8.33,"rating_img":"http:\/\/www.librarything.com\/pics\/ss8.gif"},
"9780520042728":
{"id":"9780520042728","type":"isbn","work":"44723","link":"http:\/\/www.librarything.com\/work\/44723","copies":"92","reviews":"3","rating":8.47,"rating_img":"http:\/\/www.librarything.com\/pics\/ss8.gif"},
"99030698":
{"id":"99030698","type":"lccn","work":"32155","link":"http:\/\/www.librarything.com\/work\/32155","copies":"345","reviews":"10","rating":7.8,"rating_img":"http:\/\/www.librarything.com\/pics\/ss8.gif"},
"ocn8474750911":
{"id":"ocn8474750911","type":"oclc","work":"4161224","link":"http:\/\/www.librarything.com\/work\/4161224","copies":"1","reviews":"0","rating":0,"rating_img":""}}
);

More later. It's 2:48am and need to get to bed. There's much more to say, of course.




GOOGLE BOOK SEARCH API + GOOGLE AJAX API


GOOGLE BOOK SEARCH API
http://code.google.com/apis/books/docs/viewer/developers_guide.html

Audience

This documentation is designed for people familiar with JavaScript programming and object-oriented programming concepts. You should also be familiar with Google Book Search from a user's point of view. There are many JavaScript tutorials available on the Web.

This conceptual documentation is not complete and exhaustive; it is designed to let you quickly start exploring and developing cool applications with the Book Search Embedded Viewer API. Advanced users should may be interested in the Book Search Embedded Viewer API Reference, which provides comprehensive details on supported methods and responses.

...

Troubleshooting

If your code doesn't seem to be working, here are some approaches that might help you solve your problems:

    * Look for typos. Remember that JavaScript is a case-sensitive language.
    * Use a JavaScript debugger. In Firefox, you can use the JavaScript console, the Venkman Debugger, or the Firebug add-on. In IE, you can use the Microsoft Script Debugger. This series of screencasts demonstrates how to use the various debugging tools. Similarly, the Google Chrome browser comes with a number of development tools built right in, including a DOM inspector and a Javascript debugger.
    * Search the Book Search API developer forum. If you can't find a post that answers your question, post your question to the group along with a link to a web page that demonstrates the problem.



GOOGLE AJAX API
http://code.google.com/apis/ajax/documentation/



Getting Started

Google has a number of AJAX APIs that you can use in your web pages with no server side code, including the Maps API, the AJAX Search API, and the AJAX Feed API. To use any or all of them in your web pages, you need only include a single <script> tag at the top of your web page with your Google API key:

<script type="text/javascript"
src="http://www.google.com/jsapi?key=ABCDEFG"></script>

...

API Namespaces

The module name of an API is also its namespace. So symbols from the "maps" module are available under the namespace google.maps when the module loads. Existing Google AJAX APIs like the Maps API use a G prefix for all exported classes and constants. With this new naming convention, class names no longer have the G prefix, e.g., GMap2 becomes google.maps.Map2.

APIs that currently use the G prefix will continue to support both the new and old naming conventions. Future APIs will only be available with the google.moduleName namespace.
API Versioning

The second parameter of google.load is the version of the API, modeled after the versioning system originally used by the Google Maps API. Every AJAX API has a major version and revision number, of the form VERSION.REVISION. Every time an an AJAX API introduces new JavaScript, the revision number is incremented. So if the AJAX Search API is on version 2.23, and the team does an update, the new JavaScript would be version 2.24.

Our AJAX APIs are updated frequently, so to ensure stability, all of our AJAX APIs have an active stable version and test version. Every time a team introduces of a new API revision, e.g., 2.24, the previous revision, 2.23, becomes the stable version of the API. Version 2.24 is the test version. If you request version 2 of the API without a revision specified, you will automatically get the stable revision of the API, 2.23. To get the test version of the API, you can request version 2.24 explicitly, or you can use the special wildcard 2.x, which always refers to the test version of the API. Version 2.24 remains the test version until the next revision is pushed.

The usage model we encourage is:

    * Use the stable version of each API (e.g., 2) in production HTML.
    * Use the test version of each API (e.g., 2.x) on your development machines, and report any issues you find in the developer forum for that API. If many users encounter serious issues with a particular API revision, Google will revert or hold back the revision.

While you can technically request any older version of an API at any time, old versions of APIs are not officially supported. In many cases, server-side changes will require that you stop using old versions of the API. However, we will try to keep old versions of each API on our servers for long periods of time so that developers that depend on legacy versions of APIs have as much time to upgrade as possible.



</entry>

<entry [Wed Apr 2 09:29:36 EST 2009] CONFLUENCE SCRIPTS AND API>

SEE ALSO:
CONFLUENCE COMMAND LINE INTERFACE
http://confluence.atlassian.com/display/CONFEXT/Confluence+Command+Line+Interface


SCRIPTS
http://confluence.atlassian.com/display/CONFEXT/Scripts

API

http://confluence.atlassian.com/display/DOC/Remote+API+Specification#RemoteAPISpecification-Introduction

Introduction

Confluence provides remote APIs as both XML-RPC and SOAP. This document refers to the XML-RPC specification, see SOAP details below. XML-RPC and SOAP are both remote choices, as they have bindings for almost every language making them very portable.

Which should I use?

    * SOAP is generally more useful from a strongly typed language (like Java or C#) but these require more setup.
    * XML-RPC is easier to use from a scripting language (like Perl, Python, AppleScript etc) and hence is often quicker to use. 


XML-RPC Information

Some borrowed from the (VPWik specification):

    * The URL for XML-RPC requests is http://<<confluence-install>>/rpc/xmlrpc .
    * All XML-RPC methods must be prefixed by confluence1. - to indicate this is version 1 of the API. We might introduce another version in the future. For example to call the getPage method, the method name is confluence1.getPage .
    * All keys in structs are case sensitive.
    * All strings are decoded according to standard XML document encoding rules. Due to a bug in Confluence versions prior to 2.8, strings sent via XML-RPC are decoded using the JVM platform default encoding (CONF-10213) instead of the XML encoding.
    * Confluence uses 64 big long values for things like object IDs, but XML-RPC's largest supported numeric type is int32. As such, all IDs and other long values must be converted to Strings when passed through XML-RPC API.
    * Anywhere you see the word Vector, you can interchange it with "Array" or "List" depending on what language you prefer. This is the array data type as defined in the XML-RPC spec.
    * Anywhere you see the word Hashtable, you can interchange it with "Struct" or "Dictionary" or "Map" depending on what language you prefer. This is the struct data type as defined in the XML-RPC spec.
    * The default session lifetime is 30 minutes, but that can be controlled by the deployer from the applicationContext.xml file. This can be found in the /confluence/WEB-INF/lib/confluence-x.jar file.

SOAP Information

The SOAP API follows the same methods as below, except with typed objects (as SOAP allows for).

To find out more about the SOAP API, simply point your SOAP 'stub generator' at the WSDL file, located at http://<confluence-install>/rpc/soap-axis/confluenceservice-v1?wsdl .

For reference, the confluence.atlassian.com WSDL file is here.


http://confluence.atlassian.com/rpc/soap-axis/confluenceservice-v1?wsdl

    
<wsdl:definitions targetNamespace="http://confluence.atlassian.com/rpc/soap-axis/confluenceservice-v1">
    <!--
    WSDL created by Apache Axis version: 1.2.1
    Built on Jun 14, 2005 (09:15:57 EDT)
    -->
        <wsdl:types>
            <schema targetNamespace="http://confluence.atlassian.com/rpc/soap-axis/confluenceservice-v1">
            <import namespace="http://beans.soap.rpc.confluence.atlassian.com"/>
            <import namespace="http://rpc.confluence.atlassian.com"/>
            <import namespace="http://xml.apache.org/xml-soap"/>
            <import namespace="http://schemas.xmlsoap.org/soap/encoding/"/>
            <complexType name="ArrayOf_xsd_string">
                <complexContent>
                    <restriction base="soapenc:Array">
                        <attribute ref="soapenc:arrayType" wsdl:arrayType="xsd:string[]"/>
                    </restriction>
                </complexContent>
            </complexType>
            <complexType name="ArrayOf_tns2_RemoteSearchResult">
...

    
The Confluence Command Line Interface is a good place to get a functioning client.




Remote Methods
Authentication Methods

    * String login(String username, String password) - log in a user. Returns a String authentication token to be passed as authentication to all other remote calls. It's not bulletproof auth, but it will do for now. Must be called before any other method in a 'remote conversation'. From 1.3 onwards, you can supply an empty string as the token to be treated as being the anonymous user.
    * boolean logout(String token) - remove this token from the list of logged in tokens. Returns true if the user was logged out, false if they were not logged in in the first place.

Administration

    * String exportSite(String token, boolean exportAttachments) - exports a Confluence instance and returns a String holding the URL for the download. The boolean argument indicates whether or not attachments ought to be included in the export.
    * ClusterInformation getClusterInformation(String token) - returns information about the cluster this node is part of.
    * Vector getClusterNodeStatuses(String token) - returns a Vector of NodeStatus objects containing information about each node in the cluster.

General

    * ServerInfo getServerInfo(String token) - retrieve some basic information about the server being connected to. Useful for clients that need to turn certain features on or off depending on the version of the server. (Since 1.0.3)

Spaces

Retrieval

    * Vector getSpaces(String token) - returns all the SpaceSummaries that the current user can see.
    * Space getSpace(String token, String spaceKey) - returns a single Space.
    * String exportSpace(String token, String spaceKey, String exportType) - exports a space and returns a String holding the URL for the download. The export type argument indicates whether or not to export in XML, PDF, or HTML format - use "TYPE_XML", "TYPE_PDF", or "TYPE_HTML" respectively. Also, using "all" will select TYPE_XML.

Management

    * Space addSpace(String token, Space space) - create a new space, passing in name, key and description.
    * Boolean removeSpace(String token, String spaceKey) - remove a space completely.
    * Space addPersonalSpace(String token, Space personalSpace, String userName) - add a new space as a personal space.
    * boolean convertToPersonalSpace(String token, String userName, String spaceKey, String newSpaceName, boolean updateLinks) - convert an existing space to a personal space.
    * Space storeSpace(String token, Space space) - create a new space if passing in a name, key and description or update the properties of an existing space. Only name, homepage or space group can be changed.
    * boolean importSpace(String token, byte[] zippedImportData) - import a space into Confluence. Note that this uses a lot of memory - about 4 times the size of the upload. The data provided should be a zipped XML backup, the same as exported by Confluence.

Pages

Retrieval

    * Vector getPages(String token, String spaceKey) - returns all the PageSummaries in the space. Doesn't include pages which are in the Trash. Equivalent to calling Space.getCurrentPages().

    * Page getPage(String token, String pageId) - returns a single Page
    * Page getPage(String token, String spaceKey, String pageTitle) - returns a single Page
    * Vector getPageHistory(String token, String pageId) - returns all the PageHistorySummaries - useful for looking up the previous versions of a page, and who changed them.

Permissions

    * Vector getContentPermissionSets(String token, String contentId) - returns all the page level permissions for this page as ContentPermissionSets
    * Hashtable getContentPermissionSet(String token, String contentId, String permissionType) - returns the set of permissions on a page as a map of type to a list of ContentPermission, for the type of permission which is either 'View' or 'Edit'
    * Boolean setContentPermissions(String token, String contentId, String permissionType, Vector permissions) - sets the page-level permissions for a particular permission type (either 'View' or 'Edit') to the provided vector of ContentPermissions. If an empty list of permissions are passed, all page permissions for the given type are removed. If the existing list of permissions are passed, this method does nothing.

Dependencies

    * Vector getAttachments(String token, String pageId) - returns all the Attachments for this page (useful to point users to download them with the full file download URL returned).
    * Vector getAncestors(String token, String pageId) - returns all the ancestors (as PageSummaries) of this page (parent, parent's parent etc).
    * Vector getChildren(String token, String pageId) - returns all the direct children (as PageSummaries) of this page.
    * Vector getDescendents(String token, String pageId) - returns all the descendents (as PageSummaries) of this page (children, children's children etc).
    * Vector getComments(String token, String pageId) - returns all the comments for this page.
    * Comment getComment(String token, String commentId) - returns an individual comment.
    * Comment addComment(String token, Comment comment) - adds a comment to the page.
    * boolean removeComment(String token, String commentId) - removes a comment from the page.

Management

    * Page storePage(String token, Page page) - add or update a page. For adding, the Page given as an argument should have space, title and content fields at a minimum. For updating, the Page given should have id, space, title, content and version fields at a minimum. The parentId field is always optional. All other fields will be ignored.
    * String renderContent(String token, String spaceKey, String pageId, String content) - returns the HTML rendered content for this page. If 'content' is provided, then that is rendered as if it were the body of the page (useful for a 'preview page' function). If it's not provided, then the existing content of the page is used instead (ie useful for 'view page' function).
    * String renderContent(String token, String spaceKey, String pageId, String content, Hashtable parameters) - Like the above renderContent(), but you can supply an optional hash (map, dictionary, etc) containing additional instructions for the renderer. Currently, only one such parameter is supported:
          o "style = clean" Setting the "style" parameter to "clean" will cause the page to be rendered as just a single block of HTML within a div, without the HTML preamble and stylesheet that would otherwise be added.
    * void removePage(String token, String pageId) - remove a page

Attachments - new in version 2.0

Retrieval

    * Attachment getAttachment(String token, String pageId, String fileName, String versionNumber) - get information about an attachment.
    * byte[] getAttachmentData(String token, String pageId, String fileName, String versionNumber) - get the contents of an attachment.

	

To retrieve information or content from the current version of an attachment, use a 'versionNumber' of "0".

Management

    * Attachment addAttachment(String token, long contentId, Attachment attachment, byte[] attachmentData) - add a new attachment to a content entity object. Note that this uses a lot of memory - about 4 times the size of the attachment. The 'long contentId' is actually a String pageId for XML-RPC.
    * boolean removeAttachment(String token, String contentId, String fileName) - remove an attachment from a content entity object.
    * boolean moveAttachment(String token, String originalContentId, String originalName, String newContentEntityId, String newName) - move an attachment to a different content entity object and/or give it a new name.

Blog Entries

    * Vector getBlogEntries(String token, String spaceKey) - returns all the BlogEntrySummaries in the space.
    * BlogEntry getBlogEntry(String token, String pageId) - returns a single BlogEntry.
    * BlogEntry storeBlogEntry(String token, BlogEntry entry) - add or update a blog entry. For adding, the BlogEntry given as an argument should have space, title and content fields at a minimum. For updating, the BlogEntry given should have id, space, title, content and version fields at a minimum. All other fields will be ignored.
    * BlogEntry getBlogEntryByDayAndTitle(String token, String spaceKey, int dayOfMonth, String postTitle) - Retrieves a blog post in the Space with the given spaceKey, with the title 'postTitle' and posted on the day 'dayOfMonth'.

Search

    * Vector search(String token, String query, int maxResults) - return a list of SearchResults which match a given search query (including pages and other content types). This is the same as a performing a parameterised search (see below) with an empty parameter map.
    * Vector search(String token, String query, Map parameters, int maxResults) - (since 1.3) like the previous search, but you can optionally limit your search by adding parameters to the parameter map. If you do not include a parameter, the default is used instead.

Parameters for Limiting Search Results
key 	description 	values 	default
spaceKey 	search a single space 	(any valid space key) 	Search all spaces
type 	Limit the content types of the items to be returned in the search results. 	page
blogpost
mail
comment
attachment
spacedescription
personalinformation 	Search all types
modified 	Search recently modified content 	TODAY
YESTERDAY
LASTWEEK
LASTMONTH 	No limit
contributor 	The original creator or any editor of Confluence content. For mail, this is the person who imported the mail, not the person who sent the email message. 	Username of a Confluence user. 	Results are not filtered by contributor
Security

    * Vector getPermissions(String token, String spaceKey) - Returns a Vector of Strings representing the permissions the current user has for this space (a list of "view", "modify", "comment" and / or "admin").
    * Vector getPermissionsForUser(String token, String spaceKey, String userName) - Returns a Vector of Strings representing the permissions the given user has for this space. (since 2.1.4)
    * Vector getPagePermissions(String token, String pageId) - Returns a Vector of Permissions representing the permissions set on the given page.
    * Vector getSpaceLevelPermissions(String token) - returns all of the space level permissions which may be granted. This is a list of possible permissions to use with addPermissionToSpace, below, not a list of current permissions on a Space.
    * boolean addPermissionToSpace(String token, String permission, String remoteEntityName, String spaceKey) - Give the entity named remoteEntityName (either a group or a user) the permission permission on the space with the key spaceKey.
    * boolean addPermissionsToSpace(String token, Vector permissions, String remoteEntityName, String spaceKey) - Give the entity named remoteEntityName (either a group or a user) the permissions permissions on the space with the key spaceKey.
    * boolean removePermissionFromSpace(String token, String permission, String remoteEntityName, String spaceKey) - Remove the permission permission} from the entity named {{remoteEntityName (either a group or a user) on the space with the key spaceKey.
    * boolean addAnonymousPermissionToSpace(String token, String permission, String spaceKey) - Give anonymous users the permission permission on the space with the key spaceKey. (since 2.0)

    * boolean addAnonymousPermissionsToSpace(String token, Vector permissions, String spaceKey) - Give anonymous users the permissions permissions on the space with the key spaceKey. (since 2.0)
    * boolean removeAnonymousPermissionFromSpace(String token, String permission,String spaceKey) - Remove the permission permission} from anonymous users on the space with the key {{spaceKey. (since 2.0)
    * boolean removeAllPermissionsForGroup(String token, String groupname) - Remove all the global and space level permissions for groupname.

Space permissions

Names are as shown in Space Admin > Permissions. Values can be passed to security remote API methods above which take a space permission parameter.

Permission name 	String value 	Description
View 	VIEWSPACE 	View all content in the space
Pages - Create 	EDITSPACE 	Create new pages and edit existing ones
Pages - Export 	EXPORTPAGE 	Export pages to PDF, Word
Pages - Restrict 	SETPAGEPERMISSIONS 	Set page-level permissions
Pages - Remove 	REMOVEPAGE 	Remove pages
News - Create 	EDITBLOG 	Create news items and edit existing ones
News - Remove 	REMOVEBLOG 	Remove news
Comments - Create 	COMMENT 	Add comments to pages or news in the space
Comments - Remove 	REMOVECOMMENT 	Remove the user's own comments
Attachments - Create 	CREATEATTACHMENT 	Add attachments to pages and news
Attachments - Remove 	REMOVEATTACHMENT 	Remove attachments
Mail - Remove 	REMOVEMAIL 	Remove mail
Space - Export 	EXPORTSPACE 	Export space to PDF, HTML or XML
Space - Admin 	SETSPACEPERMISSIONS 	Administer the space


User Management

    * User getUser(String token, String username) - get a single user
    * void addUser(String token, User user, String password) - add a new user with the given password
    * void addGroup(String token, String group) - add a new group
    * Vector getUserGroups(String token, String username) - get a user's current groups
    * void addUserToGroup(String token, String username, String groupname) - add a user to a particular group
    * boolean removeUserFromGroup(String token, String username, String groupname) - remove a user from a group.
    * boolean removeUser(String token, String username) - delete a user.
    * boolean removeGroup(String token, String groupname, String defaultGroupName) - remove a group. If defaultGroupName is specified, users belonging to groupname will be added to defaultGroupName.
    * Vector getGroups(String token) - gets all groups
    * boolean hasUser(String token,  String username) - checks if a user exists
    * boolean hasGroup(String token, String groupname) - checks if a group exists
    * boolean editUser(String token, RemoteUser remoteUser) - edits the details of a user
    * boolean deactivateUser(String token, String username) - deactivates the specified user
    * boolean reactivateUser(String token, String username) - reactivates the specified user
    * Vector getActiveUsers(String token, boolean viewAll) - returns all registered users
    * boolean setUserInformation(String token, UserInformation userInfo) - updates user information
    * UserInformation getUserInformation(String token, String username) - Retrieves user information
    * boolean changeMyPassword(String token, String oldPass, String newPass) - changes the current user's password
    * boolean changeUserPassword(String token, String username, String newPass) - changes the specified user's password
    * boolean addProfilePicture(String token, String userName, String fileName, String mimeType, byte[] pictureData) - add and set the profile picture for a user.

Labels

    * Vector getLabelsById(String token, long objectId) - Returns all Labels for the given ContentEntityObject ID
    * Vector getMostPopularLabels(String token, int maxCount) - Returns the most popular Labels for the Confluence instance, with a specified maximum number.
    * Vector getMostPopularLabelsInSpace(String token, String spaceKey, int maxCount) - Returns the most popular Labels for the given spaceKey, with a specified maximum number of results.
    * Vector getRecentlyUsedLabels(String token, int maxResults) - Returns the recently used Labels for the Confluence instance, with a specified maximum number of results.
    * Vector getRecentlyUsedLabelsInSpace(String token, String spaceKey, int maxResults) - Returns the recently used Labels for the given spaceKey, with a specified maximum number of results.
    * Vector getSpacesWithLabel(String token, String labelName) - Returns an array of Spaces that have been labelled with labelName.
    * Vector getRelatedLabels(String token, String labelName, int maxResults) - Returns the Labels related to the given label name, with a specified maximum number of results.
    * Vector getRelatedLabelsInSpace(String token, String labelName, String spaceKey, int maxResults) - Returns the Labels related to the given label name for the given spaceKey, with a specified maximum number of results.
    * Vector getLabelsByDetail(String token, String labelName, String namespace, String spaceKey, String owner) - Retrieves the Labels matching the given labelName, namespace, spaceKey or owner.
    * Vector getLabelContentById(String token, long labelId) - Returns the content for a given label ID
    * Vector getLabelContentByName(String token, String labelName) - Returns the content for a given label name.
    * Vector getLabelContentByObject(String token, Label labelObject) - Returns the content for a given Label object.
    * Vector getSpacesContainingContentWithLabel(String token, String labelName) - Returns all Spaces that have content labelled with labelName.
    * boolean addLabelByName(String token, String labelName, long objectId) - Adds label(s) to the object with the given ContentEntityObject ID. For multiple labels, labelName should be in the form of a space-separated or comma-separated string.
    * boolean addLabelById(String token, long labelId, long objectId) - Adds a label with the given ID to the object with the given ContentEntityObject ID.
    * boolean addLabelByObject(String token, Label labelObject, long objectId) - Adds the given label object to the object with the given ContentEntityObject ID.
    * boolean addLabelByNameToSpace(String token, String labelName, String spaceKey) - Adds a label to the object with the given ContentEntityObject ID.
    * boolean removeLabelByName(String token, String labelName, long objectId) - Removes the given label from the object with the given ContentEntityObject ID.
    * boolean removeLabelById(String token, long labelId, long objectId) - Removes the label with the given ID from the object with the given ContentEntityObject ID.
    * boolean removeLabelByObject(String token, Label labelObject, long objectId) - Removes the given label object from the object with the given ContentEntityObject ID.
    * boolean removeLabelByNameFromSpace(String token, String labelName, String spaceKey) - Removes the given label from the given spaceKey.

Data Objects

Most returned structs have a summary and a detailed form:

    * The summary form is a primary key (ie space key, page id) and a representative form (ie space name, page title)
    * The detailed form will have all of the entity details as might be needed for the client.

Unless otherwise specified, all returned structs are in detailed form.
ServerInfo
Key 	Type 	Value
majorVersion 	int 	the major version number of the Confluence instance
minorVersion 	int 	the minor version number of the Confluence instance
patchLevel 	int 	the patch-level of the Confluence instance
buildId 	String 	the build ID of the Confluence instance (usually a number)
developmentBuild 	Boolean 	Whether the build is a developer-only release or not
baseUrl 	String 	The base URL for the confluence instance

Note: Version 1.0.3 of Confluence would be major-version: 1, minor-version: 0, patch-level: 3. Version 2.0 would have a patch-level of 0, even if it's not visible in the version number.
SpaceSummary
Key 	Type 	Value
key 	String 	the space key
name 	String 	the name of the space
type 	String 	type of the space
url 	String 	the url to view this space online
Space
Key 	Type 	Value
key 	String 	the space key
name 	String 	the name of the space
url 	String 	the url to view this space online
homepage 	String 	the id of the space homepage
description 	String 	the HTML rendered space description
PageSummary
Key 	Type 	Value
id 	String 	the id of the page
space 	String 	the key of the space that this page belongs to
parentId 	String 	the id of the parent page
title 	String 	the title of the page
url 	String 	the url to view this page online
locks 	int 	the number of locks current on this page
Page
Key 	Type 	Value
id 	String 	the id of the page
space 	String 	the key of the space that this page belongs to
parentId 	String 	the id of the parent page
title 	String 	the title of the page
url 	String 	the url to view this page online
version 	int 	the version number of this page
content 	String 	the page content
created 	Date 	timestamp page was created
creator 	String 	username of the creator
modified 	Date 	timestamp page was modified
modifier 	String 	username of the page's last modifier
homePage 	Boolean 	whether or not this page is the space's homepage
locks 	int 	the number of locks current on this page
contentStatus 	String 	status of the page (eg. current or deleted)
current 	Boolean
	whether the page is current and not deleted
PageHistorySummary
Key 	Type 	Value
id 	String 	the id of the historical page
version 	int 	the version of this historical page
modifier 	String 	the user who made this change
modified 	Date 	timestamp change was made
versionComment 	String 	the comment made when the version was changed
BlogEntrySummary
Key 	Type 	Value
id 	String 	the id of the blog entry
space 	String 	the key of the space that this blog entry belongs to
title 	String 	the title of the blog entry
url 	String 	the url to view this blog entry online
locks 	int 	the number of locks current on this page
publishDate 	Date 	the date the blog post was published
BlogEntry
Key 	Type 	Value
id 	String 	the id of the blog entry
space 	String 	the key of the space that this blog entry belongs to
title 	String 	the title of the page
url 	String 	the url to view this blog entry online
version 	int 	the version number of this blog entry
content 	String 	the blog entry content
locks 	int 	the number of locks current on this page
RSS Feed
Key 	Type 	Value
url 	String 	the URL of the RSS feed
title 	String 	the feed's title
Search Result
Key 	Type 	Value
title 	String 	the feed's title
url 	String 	the remote URL needed to view this search result online
excerpt 	String 	a short excerpt of this result if it makes sense
type 	String 	the type of this result - page, comment, spacedesc, attachment, userinfo, blogpost
id 	String 	the long ID of this result (if the type has one)
Attachment
Key 	Type 	Value
id 	String 	numeric id of the attachment
pageId 	String 	page ID of the attachment
title 	String 	title of the attachment
fileName 	String 	file name of the attachment (Required)
fileSize 	String 	numeric file size of the attachment in bytes
contentType 	String 	mime content type of the attachment (Required)
created 	Date 	creation date of the attachment
creator 	String 	creator of the attachment
url
	String 	url to download the attachment online
comment
	String  	comment for the attachment (Required) 
Comment
Key 	Type 	Value
id 	String 	numeric id of the comment
pageId 	String 	page ID of the comment
title 	String 	title of the comment
content 	String 	notated content of the comment (use renderContent to render)
url 	String 	url to view the comment online
created 	Date 	creation date of the attachment
creator 	String 	creator of the attachment
User
Key 	Type 	Value
name 	String 	the username of this user
fullname 	String 	the full name of this user
email 	String 	the email address of this user
url 	String 	the url to view this user online
ContentPermission
Key 	Type 	Value
type 	String 	The type of permission. One of 'View' or 'Edit'
userName 	String 	The username of the user who is permitted to see or edit the content. Null if this is a group permission.
groupName 	String 	The name of the group who is permitted to see or edit the content. Null if this is a user permission.
ContentPermissionSet
Key 	Type 	Value
type 	String 	The type of permission. One of 'View' or 'Edit'
contentPermissions 	List 	The permissions. Each item is a ContentPermission.
Label
Key 	Type 	Value
name 	String 	the nameof the label
owner 	String 	the username of the owner
namespace 	String 	the namespace of the label
id 	String 	the ID of the label
UserInformation
Key 	Type 	Value
username 	String 	the username of this user
content 	String 	the user description
creatorName 	String 	the creator of the user
lastModifierName 	String 	the url to view this user online
version 	int  	the version
id
	String  	the ID of the user
creationDate
	Date  	the date the user was created 
lastModificationDate 	Date
	the date the user was last modified 
ClusterInformation
Key 	Type
	Value
isRunning 	boolean 	true if this node is part of a cluster.
name 	String 	the name of the cluster.
memberCount 	int 	the number of nodes in the cluster, including this node (this will be zero if this node is not clustered.)
description 	String 	a description of the cluster.
multicastAddress 	String 	the address that this cluster uses for multicasr communication.
multicastPort 	String 	the port that this cluster uses for multicast communication.
NodeStatus
Key 	Type
	Value
nodeId 	int
	an integer uniquely identifying the node within the cluster.
jvmStats
	Map 	a Map containing attributes about the JVM memory usage of node.  Keys are "total.memory", "free.memory", "used.memory".
props 	Map 	a Map containing attributes of the node. Keys are "system.date", "system.time", "system.favourite.colour", "java.version", "java.vendor",
"jvm.version", "jvm.vendor", "jvm.implemtation.version", "java.runtime", "java.vm", "user.name.word", "user.timezone",
"operating.system", "os.architecture",  "fs.encoding".
buildStats 	Map 	a Map containing attributes of the build of Confluence running on the node. Keys are "confluence.home", "system.uptime", "system.version",
"build.number".
Script Examples

The Confluence Extension space contains various examples of scripts
Changelog
Confluence 2.9

    * Search: Removed option 'all' in table of content types and changed the default to 'All'. If you need to search for all types, simply omit the 'type' restriction.
    * Search: Added option 'contributor' to the table of filter options.

2.3

    * Added getClusterInformation and getClusterNodeStatuses.

2.2

    * Added addPersonalSpace, convertToPersonalSpace and addProfilePicture.

2.1.4

    * Added getPermissionsForUser.

2.0

    * Updated getLocks() to getPagePermissions()
    * Added addAttachment, getAttachment, getAttachmentData, removeAttachment and moveAttachment methods to allow remote attachment handling. Note that adding large attachments with this API uses a lot of memory during the addAttachment operation.
    * Added addAnonymousPermissionToSpace, addAnonymousPermissionsToSpace and removeAnonymousPermissionFromSpace.
    * Added the addComment and removeComment methods for comment manipulation.
    * Added hasGroup and hasUser methods to determine if a group or user exists.
    * Added editUser method.
    * Added ability to deactivate and reactivate users.
    * Added getActiveUsers method to retrieve a user list.
    * Added ability to change the user password.
    * Added ability to retrieve and modify user information.
    * Added ability to retrieve, add and remove labels.
    * Added getBlogEntryByDayAndTitle

1.4

    * Added new exportSpace and exportSite methods to build exports of an individual space or an entire Confluence instance and return with a URL leading to the download.
    * Added new getChildren and getDescendents methods to get the direct children and all descendents of a given page.
    * Added new getAncestors method to get the ancestors of a given page.
    * Removed the old getLocks as locks are superceded by page level permissions.
    * Added new getPagePermissions method to retrieve page level permissions.
    * Added new removeUser, removeGroup, removeAllPermissionsForGroup, addUserToGroup and removeUserFromGroup methods.
    * Added new addPermissionToSpace method.
    * Added new Permission data object.
    * Added new getSpaceLevelPermissions method.

1.3

    * Added new getPage method which retrieves a page by space key and page title.
    * Added new removeSpace method to remove an entire space.
    * Added ability to limit search by parameters.
    * Allow anonymous access.

1.2

    * renderContent takes an optional hashtable for rendering hints, the only one supported right now is "style=clean"

1.1

    * getLocks gives you back a list of any locks that apply to a given page
    * added a locks field to the various Page structs containing a count of any applicable page-level locks
    * CRUD methods added for blog-posts

1.0.3

    * getServerInfo gives you some basic information about the server version CONF1123
    * storePage now allows you to change the page's name (incoming links are all renamed) CONF-974
    * storePage now reliably allows you to re-parent pages
    * WSDL now respects the server's configured base URL, allowing it to work on proxy-hosted servers CONF-1088



</entry>

<entry [Wed Mar 25 23:55:36 EST 2009] CREATED plugins.report.Template AS A GENERIC TEMPLATE CLASS>


http://localhost:8080/Bioptic0.2.5/html/tests/report-snp3.html



</entry>

<entry [Tues Mar 24 09:47:36 EST 2009] ADDITIONAL FILTER WIDGETS FOR SNP Report PAGE>

intron/exon
distance from start site
dbsnp
mirna
fastcons




</entry>

<entry [Mon Mar 16 09:47:36 EST 2009] DECLARE A plugins.report.Report.SNP (FORM?) CLASS TO ENCOMPASS MULTIPLE WIDGETS WHICH CAN ACCESS THE DATA >

BUILD LAYER FILE FOR FASTER LOADS AND DEVELOPMENT

report-snp2.html LOADS IN 1.12ms (2MB) COMPARED TO 5.05 SECONDS FOR report-snp1.html WHICH DOESN'T USE THE BUILT LAYER AND INSTEAD LOADS ALL THE FILES INDIVIDUALLY


1. CREATE BUILD.PROFILE.JS FILE

E.G.: C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts\profiles\build8.profile.js

dependencies ={
    layers:  [
        {
        name: "../report.js",
            dependencies: [
                
                "plugins.report.Controller",
                "plugins.report.Report",
                "plugins.report.Report.SNP",
                
                "dijit.form.CheckBox",

                "dijit.dijit",
                "dijit.form.Slider",
                "dijit.form.FilteringSelect",
                "dijit.form.Button",
                ,
                "dijit.form.NumberSpinner",
                "dijit.Editor",
                "dijit.form.DateTextBox",
                "dijit.form.Textarea",
                ,
                "dijit.form.TextBox",
                "dijit.form.ValidationTextBox",
                "dijit.form.NumberTextBox",
                "dijit.form.CurrencyTextBox",
                "dojo.currency",
                "dojo.parser"
            ]
        }
    ]

    //prefixes: [
    //    [ "dijit", "../dijit" ],
    //    [ "dojox", "../dojox" ],
    //    [ "plugins", "../../plugins" ]
    //]
};



2. CREATE THE OUTPUT DIRECTORY FOR YOUR BUILD

mkdir C:\DATA\base\html\Bioptic0.2.5\html\build8


3. RUN THE BUILD (TAKES ~2 MINS)

cd C:\DATA\base\html\Bioptic0.2.5\html\dojo.1.2.2\util\buildscripts

java -jar ..\shrinksafe\custom_rhino.jar build.js profile="build8" action="release" version="0.2.5" cssOptimize=comments.keepLines releaseDir=../../../build8/ > ..\..\..\build8\build8-output.txt


4. EDIT THE COPY OF plugins.report.Report.SNP INSIDE THE LAYER FILE report.js.uncompressed.js

AND INSTANTIATE THE plugins.report.Report.SNP OBJECT JUST AFTER THE OBJECT'S dojo.declare BLOCK:


...
} // plugins.report.Report.SNP

var snp = new plugins.report.Report.SNP(
	// USE UNIQUE ID FOR EACH INSTANCE OF REPORT PANE (I.E., report.paneId)
	{ id: "snpReport1" }
);
snp.startup();
...

AND THE FOLLOWING IN THE HTML FILE:
<!--


<script type="text/javascript" src="../dojo.1.2.2/dojo/dojo.js"
	djConfig="isDebug: true, parseOnLoad: true, useCommentedJson: true"></script>

<script type="text/javascript" src="../build8/dojo/nls/report_en-us.js"></script>
<script type="text/javascript" src="../build8/dojo/report.js.uncompressed.js"></script>

<script type="text/javascript">
	// REGISTER module path FOR PLUGINS
	dojo.registerModulePath("plugins","../../plugins");	

	// SET URL FOR CGI DIRECTORY
	var cgiurl = "../../../../cgi-bin/Bioptic0.2.5/";

	// LOAD PLUGINS
	dojo.require("plugins.report.Report.SNP");
	console.log("++++ After dojo.require('plugins.report.Report.SNP')");

    function init() {
		console.log("init()");
        document.getElementById('report-snp').appendChild(snp.domNode);   
    }
	dojo.addOnLoad(init);
</script>
</head>

<body class="soria">
	<h1 style="position: relative; top: -10px; left: 50px">  report snp 2 : build 8 uncompressed </h1>
	<h1 style="position: relative; top: -10px; left: 50px">  Bioptic 0.2.5: projects FileDrag ok </h1>
	<div id="report-snp">
	</div>
</body>
</html>


-->

TROUBLESHOOTING
===============

ERROR:

ON LOAD OF report.js GET THIS:


[Exception... "'Error: Bundle not found: loading in dijit , locale=en-us' when calling method: [nsIDOMEventListener::handleEvent]" nsresult: "0x8057001c (NS_ERROR_XPC_JS_THREW_JS_OBJECT)" location: "<unknown>" data: no]


DIAGNOSIS:

GOOGLE FOR 'Error: Bundle not found: loading in dijit , locale=en-us' YIELDED

http://trac.dojotoolkit.org/ticket/7280

...
there isn't enough info here to reproduce the bug, but I suspect that dojo.i18n.getLocalization() is being called from the top-level of a script, which is unsupported, due to the race condition you mention. You'll need to wrap these calls in a function so that they get called after onLoad 

SOLUTION:

INCLUDE THE JAVASCRIPT en-us.js FILE IN build8/dojo/nls BEFORE THE LAYER FILE report.js

...
<script type="text/javascript" src="../build8/dojo/report.js.uncompressed.js"></script>

<script type="text/javascript" src="../build8/dojo/nls/report_en-us.js"></script>
...

    OK!






</entry>

<entry [Mon Mar 16 09:47:36 EST 2009] FIXED VERSION OF attr('href', ...) FOR CONTENT PANE>

(ALSO IN:
Notes-apps-subversion.txt
Mon Mar 16 09:47:36 EST 2009
DOWNLOAD DOJO.1.2.2 USING svn ON WINDOWS TO GET
)

1. CREATE FOLDER

mkdir c:\svn-checkout\dojo.1.2.2


2. CHECK OUT VERSION 1.2.2 USING SUBVERSION ON DOS COMMAND LINE:

cd c:\svn-checkout\dojo.1.2.2

svn co http://svn.dojotoolkit.org/src/tags/release-1.2.2

    ...
    Checked out revision 17040

3. REJIGGED plugins.core.PluginManager AND plugins.core.Controls

ADDED provide AT BEGINNING OF FILE, E.G.:

dojo.provide("plugins.core.PluginManager) 


4. TRIED WITH TEST

tests/tab-attr-href1.html

    OK!
    

5. CONFIRMED WITH Report.js WHICH CAN NOW LOAD THE SNP.html TEMPLATE BY dojo.attr('href', ...)

    OK!
    


DETAILED TROUBLE TICKET:  GET FIXED VERSION OF attr('href', ...) FOR CONTENT PANE IN DOJO 1.2.2, BUILD 15826
http://trac.dojotoolkit.org/ticket/8125


 Ticket #8125 (closed defect: fixed)

Opened 4 months ago

Last modified 4 months ago
ContentPane attr('href') cancels itself!
Reported by: 	Matt Sgarlata 	Owned by: 	bill
Priority: 	normal 	Milestone: 	1.2.3
Component: 	Dijit 	Version: 	1.2.2
Severity: 	normal 	Keywords: 	
Cc: 	development-staff@ 		
Description ¶

attr('href') incorrectly calls the cancel() method when the request is still in the middle of being processed. The practical consequence of this is that the _xhrDfd member variable is cleared before anything can be done with it. This makes it difficult to work with requests initiated by ContentPane? and makes it impossible to inspect the response headers of those requests.

This is a regression in dojo 1.2.2 that was not a problem in 1.2 beta. This was broken when the changes for bug 7801 were checked in. [Note the version # of this bug is 1.2.1; it looks like 1.2.2 needs to be added to Trac]

http://trac.dojotoolkit.org/ticket/7801

In case someone would like to argue that _xhrDfd shouldn't be around when onLoad and onDownloadEnd are called, it's clear the original author intended _xhrDfd to be around when onLoad and onDownloadEnd are called because it is manually deleted in _downloadExternalContent after onLoad and onDownloadEnd have had a chance to run.

Currently the rough order of operations is something like this - attr('href') - dojo.xhrGet - attr('content')

    * cancel
    * onLoad 

- onDownloadEnd

The problem is that attr('content') should definitely be calling cancel, but attr('href') should not. So the _downloadExternalContent method needs to be modified so that it does *not* call attr('content'). Perhaps the current contents of the _setContentAttr method could be moved to some new helper method (let's call it _setContentHelper) that could be accessed by both attr('content') and attr('href'). So attr('content') would just call cancel() and then _setContentHelper and attr('href') would just call _setContentHelper in place of attr('content') and thus avoid the cancel call.

I attached a test case that demonstrates that cancel is called before onLoad and onDownloadEnd have a chance to run. It also demonstrates that the _xhrDfd member variable is undefined in onLoad and onDownloadEnd (which is not correct, as mentioned earlier). When you execute the test case, you'll notice that the cancel method is actually called 3 times. The first 2 calls are OK, because they just make sure any prior attr('href') calls are cancelled, which definitely does need to happen. It's the 3rd one that's a problem because it is called before onLoad or onDownloadEnd.




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/DTD/strict.dtd">
<html>
<head>
<script type="text/javascript">
     var djConfig = {
             parseOnLoad:true,
     };
</script>
<script type="text/javascript" src="dojo/dojo.js"></script>
<script type="text/javascript">
     dojo.require("dijit.layout.ContentPane");
   dojo.addOnLoad(function() {
             dojo.connect(dijit.byId('contentPane'), '_setHrefAttr', function() {
                     console.debug("attr('href') called");
             });
             dojo.connect(dijit.byId('contentPane'), 'cancel', function() {
                     console.debug('cancel called');
             });
             dojo.connect(dijit.byId('contentPane'), 'onLoad', function() {
                     console.debug('onLoad called');
                     console.debug('this.href: ' + this.href);
                     console.debug('this._xhrDfd: ' + this._xhrDfd);
             });
             dojo.connect(dijit.byId('contentPane'), 'onDownloadEnd', function() {
                     console.debug('onDownloadEnd called');
                     console.debug('this.href: ' + this.href);
                     console.debug('this._xhrDfd: ' + this._xhrDfd);
             });
     });
</script>
</head>
<body>
<div id="contentPane" dojoType="dijit.layout.ContentPane">this text is in a ContentPane</div>
<button onclick="dijit.byId('contentPane').attr('href', '../../spring/blank')">test</button>
</body>
</html>


</entry>

<entry [Fri Mar 13 17:21:00 EDT 2009] MESSAGE FROM Jennifer Jackson jen@soe.ucsc.edu >


-----Original Message-----
From: Jennifer Jackson [mailto:jen@soe.ucsc.edu] 
Sent: Friday, March 13, 2009 2:43 PM
To: Young, Stuart
Cc: 'genome-www@soe.ucsc.edu'; 'Robert E Loredo'
Subject: Re: Redirecting 'Send query to Galaxy' data + access MYSQL server through API

Hello,
Your option #2 is the one we recommend. Here are the instructions for 
using our public mysql server:
http://genome.ucsc.edu/FAQ/FAQdownloads#download29

Thank you,
Jennifer Jackson
UCSC Genome Bioinformatics Group



Direct MySQL access to data 	
  	

Question:
"Is it possible to run SQL queries directly on the database rather than using the Table Browser interface?"

Response:
In response to requests from Genome Browser users, we have set up a MySQL database for public access at genome-mysql.cse.ucsc.edu. This new server allows MySQL access to the same set of data currently available on our public Genome Browser site. The data are synchronized daily with the main databases on http://genome.ucsc.edu.

To connect to the database, you must use a computer on which the MySQL client libraries have been installed. The UCSC server is running MySQL 4.0.27; for best results, we recommend you use clients of the same revision. The v4.0 MySQL clients may be downloaded from http://downloads.mysql.com/archives.php?p=mysql-4.0. Connect to the MySql server using the command:

    mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A

The -A flag is optional but is recommended for speed.

Once connected to the database, you may use a wide range of MySQL commands to query the database. As a courtesy to others, please observe the following guidelines when using the database:

    * Avoid excessive or heavy queries that may impact the server performance. Inappropriate query use will result in a restriction of access. If you plan to execute a query that you think may be excessive, contact UCSC first to avoid the possibility of having your access blocked.
    * Bot access and excessive program-driven use are not permitted.
    * Attachments by local mirror sites are prohibited. 

The MySQL database can also be used by the numerous utilities in the kent source tree. Add the following specifications to your $HOME/.hg.conf file (remember to chmod your .hg.conf file to 600 permissions):

    db.host=genome-mysql.cse.ucsc.edu
    db.user=genomep
    db.password=password 

If you prefer a more structured graphical interface to the UCSC database tables, use the Table Browser.

System problems should be reported to genome-www@soe.ucsc.edu. Send questions regarding the database contents or queries to genome@soe.ucsc.edu. Messages sent to this address will be posted to the moderated genome mailing list, which is archived on a public Web-accessible pipermail archive. This archive may be indexed by non-UCSC sites such as Google.
	



</entry>

<entry [Fri Mar 13 14:01:00 EDT 2009] MESSAGE TO UCSC RE: Send query to Galaxy>

DOWNLOAD UCSC SOURCE CODE
http://genome.ucsc.edu/FAQ/FAQdownloads#download27
C:\DATA\22-bioptic\ucsc\jksrc\kent\src\hg\hgTables\galaxy.c


GALAXY WEBSITE
http://main.g2.bx.psu.edu/


UCSC EMAIL
genome-www@soe.ucsc.edu

SUBJECT
Redirecting 'Send query to Galaxy' data + access MYSQL server through API

<!--
Dear Sir/Madam,

I am developing a web application and would like to redirect exported UCSC Table Browser data to my application. I was thinking of two approaches (but please let me know if there are any others):


1. Use the 'Send query to Galaxy' function by which exported Table Browser data is sent to Galaxy. 


This is the HTML for the 'Send query to Galaxy' button on the export data page:

    <INPUT TYPE=HIDDEN NAME="hgta_doGetBed" VALUE="get BED">
    <INPUT TYPE=SUBMIT NAME="hgta_doGalaxyQuery" VALUE="Send query to Galaxy" >
    </FORM>
    
    <FORM ACTION="/cgi-bin/hgTables" METHOD=GET>
    <INPUT TYPE=SUBMIT NAME="hgta_doMainPage" VALUE="Cancel" >
    </FORM>

I downloaded the UCSC source code and it appears that the directory kent/src/hg/hgTables contains the relevant files, e.g.:

bedList.c
filterFields.c
galaxy.c            <------- GENERATES THE 'Send query to Galaxy' BUTTON AND HANDLES THE RESPONSE... ?
hgTables.c          
hgTables.h          <------- #define hgtaDoGalaxyQuery "hgta_doGalaxyQuery"
mainPage.c
pal.c
seqOut.c            <------- Outputs sequence
usage.c

At first glance, I was wondering if I could pass my own GALAXY_URL as a CGI parameter and thereby get the information sent to my application? GALAXY_URL is used in the getGalaxyUrl method of galaxy.c:

char *getGalaxyUrl()
/* returns the url for the galaxy cgi, based on script name */
{
char *url = NULL;
/* use parameter if available */
if (cartVarExists(cart, "GALAXY_URL"))
    url = cartString(cart, "GALAXY_URL");
else
    url = cloneString("http://main.g2.bx.psu.edu/tool_runner");
return url;
}

If that functionality is not currently available, could it be made available?


2. Use the UCSC API

Is there a publicly-accessible MYSQL server I can use for the API?

Or is it neccessary for me to download and install all of the UCSC data and access it via my own MYSQL server?

Could you please direct me to online documentation for the UCSC API?

It appears that I won't be able to get all kinds of Table Browser data (i.e., including intersections) using the DAS server - is that correct?


Thank you very much for your help,

Stuart.

Stuart Young
Research Associate
Center for Computational Science
Leonard M. Miller School of Medicine
1120 NW 14th St., CRB-1188 (C-213)
Miami, FL 33136
Tel. + 1 (305) 243-4539


-->



Downloading data from the UCSC DAS server 	
  	

Question:
"How do I download data using the UCSC DAS server?"

Response:
The UCSC DAS server provides access to genome annotation data for all current assemblies featured in the Genome Browser. To view a list of the assemblies available from the DAS server and their base URLs, see http://genome.ucsc.edu/cgi-bin/das/dsn.

To construct a DAS query, combine an assembly's base URL with the sequence entry point and type specifiers available for that assembly. The entry point specifies chromosome position, and the type indicates the annotation table requested. You can view the lists of entry points and types available for an assembly with requests of the form:

	http://genome.ucsc.edu/cgi-bin/das/[db_name]/entry_points
	http://genome.ucsc.edu/cgi-bin/das/[db_name]/types

where [db_name] is the UCSC name for the assembly, e.g. hg16, mm4.

For example, here is a query that returns all the records in the refGene table for the chromosome position chr1:1-100000 on the hg16 assembly:

	http://genome.ucsc.edu/cgi-bin/das/hg16/features?segment=1:1,100000;type=refGene

For more information on DAS, see the Biodas website and the DAS specification. 











</entry>

<entry [Wed Mar 11 16:54:00 EDT 2009] CREATE SVN DIRECTORY ON ngsdev>

  $ mkdir /var/svn
  $ mkdir /var/svn/project
  $ mkdir /tmp/project
  $ mkdir /tmp/project/branches
  $ mkdir /tmp/project/tags
  $ mkdir /tmp/project/trunk
  $ svnadmin create /var/svn/project
  $ svn import /tmp/project file:///var/svn/project -m "initial import"
  $ rm -rf /tmp/project

Fix permissions to the repository:

  $ find /var/svn/project -type f -exec chmod 660 {} \;
  $ find /var/svn/project -type d -exec chmod 2770 {} \;
  $ chown -R root.www-data /var/svn/project



</entry>



<entry [Sun Mar 08 23:12:00 EST 2008] FLUSHING ISSUE WITH runWorkflow>

TEST WITH telnet

You should see you page come out in sections every second.  If so but the display is all in a burst, it's the browser.   If the page still comes all at once, it's a server side issue you're looking for.

telnet kronos.ccs.miami.edu 80
<followed by TWO new line characters>

Trying 204.68.94.93...
Connected to kronos.ccs.miami.edu.
Escape character is '^]'.

# GET /cgi-bin/ngs/Bioptic0.2.5/workflow.cgi?sessionId=1228791394.7868.158&username=admin&project=Project1&workflow=Workflow3-indels&mode=runWorkflow&start=0 HTTP/1.0

GET /cgi-bin/ngs/Bioptic0.2.5/workflow.cgi "sessionId=1228791394.7868.158&username=admin&project=Project1&workflow=Workflow3-indels&mode=runWorkflow&start=0" HTTP/1.0


HTTP/1.1 200 OK
Date: Mon, 09 Mar 2009 04:16:22 GMT
Server: Apache/2.2.3 (Red Hat)
Connection: close
Content-Type: text/html; charset=ISO-8859-1

Content-type: text/xml

Connection closed by foreign host.
[syoung@kronos Bioptic0.2.5]$ telnet kronos.ccs.miami.edu 80
Trying 204.68.94.93...
Connected to kronos.ccs.miami.edu.
Escape character is '^]'.




http://www.wellho.net/forum/Perl-Programming/Gradual-output-from-cgi-script.html


Posted by iana (iana), 25 May 2004
Hello all!

I have a CGI script which can take a long time to execute. Is there a way to output the progress gradually onto the viewing browser?

When I try to execute the CGI, there is a huge delay after which all the progress information comes out with the answer at once.

I'm looking for a way to notify that progress is being made, and that we are 20% done... etc.

Is this possible?

Kind Regards,
Ian./

Posted by admin (Graham Ellis), 25 May 2004
There are all sorts of "clever" ways of doing this, and some simple ones too that might work for you ...

The usual cause of "all at once" page display is that something in the HTML that you're sending delays the display because the browser is missing a vital piece of information ... the most common on these is a page that comprises a single table with widths not specified for the columns ... the poor browser has to receive the whol epage before it knows what to display.

Of course, you'll first want to establish if you have this problem. Try adding a test line at the start of your CGI script that prints out "hello world" followed by a <hr> to make 100% sure that the line's ended ... then run the CGI script.

I do suspect that your "huge delay" is while HTML is being received and stored by the browser - it's certainly the most common cause of this sort of thing - but IF that perl script really is burning up a lot of resources, please post a follow up and I'll outline multipart documents where you can send a holder message followed by a complete page.

Posted by iana (iana), 25 May 2004
Hi Graham,

I've made "Simulation Code":

Code:
#!c:/Perl/bin/Perl.exe


print "Content-type: text/html\n\n";

print "Hello World<hr>\n";
sleep(1); #simulate work

print "Hello World<hr>\n";
sleep(1); #simulate work

print "Done<hr>\n";

This give the big pause, followed by all the output at once. Am I doing something silly here?

Ian./

Posted by admin (Graham Ellis), 26 May 2004
Hmm ... couple of (as in 3 or 4!) possibilities ....

1.  Perl tends to flush its buffers at the end of each line of output, and I see that you're sending \n when the Windows EOL is \r\n.  Solution if this is the problem is to turn autoflush mode one (add a line $| = 1;  at the top of your script).

There's a sample program to play with from the command line with $| on our web site at http://www.wellho.net/resources/ex.php4?item=p210/ticker - run it with a command lline parameter of 0 for regular operation, and with a command line parameter of 1 for autoflush mode to be on

2. It's still possible that the browser is buffering before it displays - stranger things have happened.  Try visiting the page with telnet:
     telnet yourhostname 80
     GET /cgi-bin/scriptname.pl HTTP/1.0
followed by TWO new line characters.  You should see you page come out in sections every second.  If so but the display is all in a burst, it's the browser.   If the page still comes all at once, it's a server side issue you're looking for.

3. You might like to try a non-parsed header script - see the example we have online at http://www.wellho.net/cgi-bin/net/sample.pl?which=nph-clock.pl.  This is a very old example and the page decoration looks poor at the moment, but the example is good.  Note that nph scripts must have names starting with "nph" and you're responsible for generating the entire headers.

4. The web server could  STILL be going the buffering ... even after all of these!

Hope this all makes sense.  If one of these solves it (or if not!) please follow up so that I can learn which issues it was and wasn't.

Modified to add ... (a) Page decoration on the old example fixed. (b) Note - the "nph" example runs the operating system's uptime command once a minute - the purpose of the script is to give a web page based monitor of changing activity.  This limits the script to Linux / Unix systems. For Windows use as a demo, choose some other command line based command that you would like to run every minute  



Posted by iana (iana), 26 May 2004
Hi Graham,

Its the autoflush. Adding $|=1 to the script solved the problem instantly!

Thankyou.

Ian./

</entry>

<entry [Mon Mar 2 21:12:00 EST 2008] ADAPT Bioptic0.2.5 TO kronos>

&#Z?


1. CHANGE .cgi APPLICATION

SHEBANG
=======

#!/usr/bin/perl

not
#!C:/perl/bin/perl              


use lib
=======

use lib "lib";
use lib "lib/5.8.8/x86_64-linux-thread-multi";

#use lib "../../html/Bioptic0.2.5/lib";
#use lib "../perlmods/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi";


conf
====

my $conf = Util::conf("conf/nextgen.conf", 0);
# my $conf = Util::conf("../../html/Bioptic0.2.5/conf/nextgen.conf", 0);


CHANGE MODULES IN lib TO
my $conf = Util::conf("conf/nextgen.conf", 0);


cd /var/www/cgi-bin/ngs/Bioptic0.2.5
grep -n "../../html/Bioptic0.2.5/conf/default.conf" -R lib

lib/Admin.pm:1219:

# my $conf = Util::conf("../../html/Bioptic0.2.5/conf/default.conf");
my $conf = $self->{_conf};


lib/App.pm:720:

#       $conf = Util::conf("../../html/Bioptic0.2.5/conf/default.conf");                                                                                          die "App:conf(). Conf not defined. Exiting...\n";
                        
 




2. CREATE LINKS TO WEB DIRECTORIES

cgi-bin
=======

ln -s /nethome/syoung/base/html/Bioptic0.2.5/cgi-bin /var/www/cgi-bin/ngs/Bioptic0.2.5


lib
===

ln -s /nethome/syoung/base/html/Bioptic0.2.5/lib /var/www/cgi-bin/ngs/Bioptic0.2.5/lib


conf
====

ln -s /nethome/syoung/base/html/Bioptic0.2.5/conf /var/www/cgi-bin/ngs/Bioptic0.2.5/conf



4. INSTALL EXTRA MODULES INTO lib/5.8.8/x86_64-linux-thread-multi

DBD::SQLite

INSTALL DBI

cd /nethome/syoung/base/html/Bioptic0.2.5/perlmods
tar xvfz DBI-1.607.tar.gz
cd DBI-1.607
perl Makefile.PL PREFIX=/nethome/syoung/base/html/Bioptic0.2.5/lib/5.8.8/x86_64-linux-thread-multi


COPY DBI OVER TO lib/5.8.8/x86_64-linux-thread-multi

cp blib/lib/DBD/* ../../lib/5.8.8/x86_64-linux-thread-multi/auto/DBD/
cp -r blib/lib/DBD/Gofer ../../lib/5.8.8/x86_64-linux-thread-multi/auto/DBD/
cp -r blib/lib/DBI/* ../../lib/5.8.8/x86_64-linux-thread-multi/auto/DBI

INSTALL DBD::SQLite

[syoung@kronos DBD-SQLite-1.14]$ make install
Installing /nethome/syoung/base/html/Bioptic0.2.5/perlmods/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/SQLite.so
Installing /nethome/syoung/base/html/Bioptic0.2.5/perlmods/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/SQLite.bs
Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
Installing /nethome/syoung/base/html/Bioptic0.2.5/perlmods/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/DBD/SQLite.pm
Installing /nethome/syoung/base/html/Bioptic0.2.5/perlmods/temp/share/man/man3/DBD::SQLite.3pm
Writing /nethome/syoung/base/html/Bioptic0.2.5/perlmods/temp//lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/DBD/SQLite/.packlist
Appending installation info to
/nethome/syoung/base/html/Bioptic0.2.5/perlmods/temp//lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod


cd /nethome/syoung/base/html/Bioptic0.2.5/perlmods/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
ls -R *
auto/DBD/SQLite:
SQLite.bs  SQLite.so

DBD:
SQLite.pm


COPY FILES OVER TO lib/5.8.8/x86_64-linux-thread-multi

cd /nethome/syoung/base/html/Bioptic0.2.5/perlmods/temp/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi
cp -r auto/DBD/* /nethome/syoung/base/html/Bioptic0.2.5/lib/5.8.8/x86_64-linux-thread-multi/auto/DBD
cp -r DBD/* /nethome/syoung/base/html/Bioptic0.2.5/lib/5.8.8/x86_64-linux-thread-multi/DBD




INSTALL File::Remove

tar xvfz File-Remove-1.42.tar.gz
cd File-Remove-1.42
perl Makefile.PL PREFIX=../temp-fileremove
make
make test
make install

cd /nethome/syoung/base/html/Bioptic0.2.5/perlmods/temp-fileremove/lib/perl5/site_perl/5.8.8
cp -r File /nethome/syoung/base/html/Bioptic0.2.5/lib/5.8.8/x86_64-linux-thread-multi/

ALSO GENERATED BUT NOT COPIED OVER TO lib/5.8.8 DIRECTORY:

../temp-fileremove/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod
../temp-fileremove/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/File/Remove/.packlist



INSTALL File::Copy::Recursive

tar xvfz File-Copy-Recursive-0.38.tar.gz 
    File-Copy-Recursive-0.38/
    File-Copy-Recursive-0.38/Changes
    File-Copy-Recursive-0.38/Makefile.PL
    File-Copy-Recursive-0.38/MANIFEST
    File-Copy-Recursive-0.38/META.yml
    File-Copy-Recursive-0.38/README
    File-Copy-Recursive-0.38/Recursive.pm
    File-Copy-Recursive-0.38/t/
    File-Copy-Recursive-0.38/t/1.t
cd File-Copy-Recursive-0.38
ls
    Changes  Makefile.PL  MANIFEST  META.yml  README  Recursive.pm  t
mkdir ../temp-filecopyrecursive
perl Makefile.PL PREFIX=../temp-filecopyrecursive
    Checking if your kit is complete...
    Looks good
    Writing Makefile for File::Copy::Recursive

make
    cp Recursive.pm blib/lib/File/Copy/Recursive.pm
    Manifying blib/man3/File::Copy::Recursive.3pm


make test
    PERL_DL_NONLAZY=1 /usr/bin/perl "-MExtUtils::Command::MM" "-e" "test_harness(0, 'blib/lib', 'blib/arch')" t/*.t
    t/1....ok                                                                    
    All tests successful.
    Files=1, Tests=1,  0 wallclock secs ( 0.02 cusr +  0.01 csys =  0.03 CPU)


make install

    Installing ../temp-filecopyrecursive/lib/perl5/site_perl/5.8.8/File/Copy/Recursive.pm
    Installing ../temp-filecopyrecursive/share/man/man3/File::Copy::Recursive.3pm
    Writing ../temp-filecopyrecursive/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/File/Copy/Recursive/.packlist
    Appending installation info to ../temp-filecopyrecursive/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod

cd ../temp-filecopyrecursive/lib/perl5/site_perl/5.8.8/File
cp -r Copy /nethome/syoung/base/html/Bioptic0.2.5/lib/5.8.8/x86_64-linux-thread-multi/File


INSTALL File::Sort

tar xvfz File-Sort-1.01.tar.gz
cd File-Sort-1.01
make
cp /home/syoung/base/html/Bioptic0.2.5/perlmods/File-Sort-1.01/blib/lib/File/Sort.pm /nethome/syoung/base/html/Bioptic0.2.5/lib/5.8.8/x86_64-linux-thread-multi/File
ls /nethome/syoung/base/html/Bioptic0.2.5/lib/5.8.8/x86_64-linux-thread-multi/File
    Copy  Remove.pm  Sort.pm





5. RUN .cgi

cd /var/www/cgi-bin/ngs/Bioptic0.2.5
sudo su apache
./workflow.cgi "sessionId=1228791394.7868.158&username=admin&project=Project1&workflow=Workflow3-indels&mode=runWorkflow&start=0"

    OK

perl /nethome/syoung/base/html/Bioptic0.2.5/bin/image2eland.pl --readlength 30 --outputdir /nethome/syoung/base/html/Bioptic0.2.5/fileroot/admin/Project1/Workflow3-indels --referencefile /nethome/syoung/base/html/Bioptic0.2.5/fileroot/admin//Project1/Workflow3-indels/CCDS_nucleotide.20080430.fa --geraldfile /nethome/syoung/base/html/Bioptic0.2.5/fileroot/admin//run2lane6-test/geraldfile.txt --tiles s_6_150 --rundir /nethome/syoung/base/html/Bioptic0.2.5/fileroot/admin/Project1/Workflow3-indels --type single





perl /nethome/syoung/base/html/Bioptic0.2.5/bin/image2eland.pl --readlength 30 --outputdir /nethome/syoung/base/html/Bioptic0.2.5/fileroot/admin/Project1/Workflow3-indels --referencefile /nethome/syoung/base/html/Bioptic0.2.5/fileroot/admin//Project1/Workflow3-indels/CCDS_nucleotide.20080430.fa --geraldfile /nethome/syoung/base/html/Bioptic0.2.5/fileroot/admin//run2lane6-test/geraldfile.txt --tiles s_6_150 --rundir /nethome/syoung/base/html/Bioptic0.2.5/fileroot/admin/Project1/Workflow3-indels --type single




</entry>


<entry [Wed 25 Feb 8:46:07 EST 2009] INSTALL stage TABLE IN data.dbl>

perl loader.pl --dbfile C:/DATA/base/html/Bioptic0.2.5/bin/data.dbl --sqlfile C:/DATA/base/html/Bioptic0.2.5/bin/sql/stage.sql --bsvfile C:/DATA/base/html/Bioptic0.2.5/bin/sql/stage.bsv


</entry>

<entry [Tues 24 Feb 14:57:07 EST 2009] INSTALL application TABLE IN data.dbl>

cd C:\DATA\base\html\Bioptic0.2.5\bin

perl loader.pl --dbfile C:/DATA/base/html/Bioptic0.2.5/bin/data.dbl --sqlfile C:/DATA/base/html/Bioptic0.2.5/bin/sql/application.sql --bsvfile C:/DATA/base/html/Bioptic0.2.5/bin/sql/application.bsv

sqlite3 data.dbl
.schema application

CREATE TABLE IF NOT EXISTS application (

    projectname         VARCHAR(30),
    workflownumber      INT(3),
    workflowname        VARCHAR(60),
    workflowdescription	TEXT,
    applicationname     varchar(40) NOT NULL default '',    
    application         varchar(255) NOT NULL default '',   
    arguments           TEXT,
    outputs             TEXT,
    inputs              TEXT,
    
    PRIMARY KEY  (projectname, workflowname, applicationname)
)



</entry>

<entry [Sun 22 Feb 17:12:07 EST 2009] FIXED DYNALOADER ERROR ON WINDOWS AND REMOVED Carp FROM JSON.pm>

IN Dynaloader.pm ADDED AN EXTRA COPY OF LINE ON LINE 225 (sub bootstrap):

	&$xs(@args);
	&$xs(@args);	
}


IN JSON.pm LINE 114 (sub jsonToObj):

    #Carp::carp "'jsonToObj' will be obsoleted. Please use '$alternative' instead.";

AND LINE 123 (sub objToJson):

    #Carp::carp "'objToJson' will be obsoleted. Please use '$alternative' instead.";



NB: FIRST BUNCH ARE ERRORS LOADING LANGUAGE FILES FOR FileProject

12 File does not exist: C:/DATA/base/html/Bioptic0.2.5/css, referer: http://localhost:8080/Bioptic0.2.5/html/
13 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/nls/en, referer: http://localhost:8080/Bioptic0.2.5/html/
13 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/nls/en-us, referer: http://localhost:8080/Bioptic0.2.5/html/
13 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/nls/en, referer: http://localhost:8080/Bioptic0.2.5/html/
13 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/nls/en-us, referer: http://localhost:8080/Bioptic0.2.5/html/
14 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dojox/widget/nls/en, referer: http://localhost:8080/Bioptic0.2.5/html/
14 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dojox/widget/nls/en-us, referer: http://localhost:8080/Bioptic0.2.5/html/
14 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dojox/widget/nls/FileDrag.js, referer: http://localhost:8080/Bioptic0.2.5/html/
14 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dojox/widget/nls/en, referer: http://localhost:8080/Bioptic0.2.5/html/
14 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dojox/widget/nls/en-us, referer: http://localhost:8080/Bioptic0.2.5/html/
15 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dojo/cldr/nls/en-us/gregorian.js, referer: http://localhost:8080/Bioptic0.2.5/html/
15 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/form/nls/en, referer: http://localhost:8080/Bioptic0.2.5/html/
15 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/form/nls/en-us, referer: http://localhost:8080/Bioptic0.2.5/html/
15 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/form/nls/en, referer: http://localhost:8080/Bioptic0.2.5/html/
15 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/form/nls/en-us, referer: http://localhost:8080/Bioptic0.2.5/html/
16 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/form/nls/en, referer: http://localhost:8080/Bioptic0.2.5/html/
16 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/form/nls/en-us, referer: http://localhost:8080/Bioptic0.2.5/html/
16 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/_editor/nls/en, referer: http://localhost:8080/Bioptic0.2.5/html/
16 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/dojo.1.2.2/dijit/_editor/nls/en-us, referer: http://localhost:8080/Bioptic0.2.5/html/
19 File does not exist: C:/DATA/base/html/Bioptic0.2.5/html/plugins/projects, referer: http://localhost:8080/Bioptic0.2.5/html/


THESE ARE THE IMPORTANT ERRORS:

20 19 2009] DynaLoader.pm: Name "DBD::SQLite::sqlite_version" used only once: possible typo at C:/perl/lib/DynaLoader.pm line 225., referer: http://localhost:8080/Bioptic0.2.5/html/
20 20 2009] projects.cgi: 'objToJson' will be obsoleted. Please use 'encode' instead. at ../../html/Bioptic0.2.5/lib/Projects.pm line 458, referer: http://localhost:8080/Bioptic0.2.5/html/
20 20 2009] DynaLoader.pm: Name "DBD::SQLite::sqlite_version" used only once: possible typo at C:/perl/lib/DynaLoader.pm line 225., referer: http://localhost:8080/Bioptic0.2.5/html/
20 20 2009] DynaLoader.pm: Name "DBD::SQLite::sqlite_version" used only once: possible typo at C:/perl/lib/DynaLoader.pm line 225., referer: http://localhost:8080/Bioptic0.2.5/html/
31 malformed header from script. Bad header=Mode not defined: workflow.cgi, referer: http://localhost:8080/Bioptic0.2.5/html/
31 31 2009] DynaLoader.pm: Name "DBD::SQLite::sqlite_version" used only once: possible typo at C:/perl/lib/DynaLoader.pm line 225., referer: http://localhost:8080/Bioptic0.2.5/html/


</entry>

<entry [Sun 22 Feb 17:12:07 EST 2009] FIXED 'URI TOO LARGE' LIMIT ON SIZE OF JSON SENT TO SERVER BY USING POSTDATA WITH content-type SET TO 'text'>

PROBLEM:

COULD NOT TRANSMIT WHOLE 'applications' JSON AS GOT 'URI TOO LARGE' ERROR.

TRIED USING xhrRawPost WITH postData AS QUERY STRING "mode=saveWorkflow&username=admin.... json=[[...]]":

		query += "&json=" + dojo.toJson(data);

		dojo.rawXhrPost( {
				url: url,
				handleAs: "json",
				postData: query,

WHICH OUTPUT THE PARAMETERS CORRECTLY, EXCEPT FOR A TRUNCATED JSON (~300 CHARACTERS):

json	    [["type","single"],["rundir","Project1/Workflow3-indels"],["geraldfile","/run2lane6-test/eland/geraldfile
.txt"],["outputdir","Project1/Workflow3-indels/eland"],["referencefile","/store/home/syoung/base/pipeline
/human-mtdna/human-mtDNA-AC_000021.fasta"],["readlength","30"],["tiles","s_6_150"]]
mode	saveWorkflow
project	Project1
sessionId	1228791394.7868.158
username	admin
workflow	Workflow3-indels


SOLUTION:

USED postworkflow.pl TO CONFIRM THAT IT WASN'T A PROBLEM WITH THE FIREFOX, AS THE JSON WAS TRUNCATED AFTER FEEDING IT TO workflow.cgi AS STDIN FROM THE COMMAND LINE.

IT TURNS OUT THE PROBLEM WAS THE DEFAULT content-type IS 'application/x-www-form-urlencoded' WHICH CAUSES THE SERVER TO PROCESS THE POSTDATA AND NOT RETURN IT IN THE 'POSTDATA' PARAMETER:

    HANDLING NON-URLENCODED ARGUMENTS http://perldoc.perl.org/CGI.html
    
        If POSTed data is not of type application/x-www-form-urlencoded or multipart/form-data, then the POSTed data will not be processed, but instead be returned as-is in a parameter named POSTDATA. To retrieve it, use code like this:
        
           my $data = $query->param('POSTDATA');
        
        Likewise if PUTed data can be retrieved with code like this:
        
           my $data = $query->param('PUTDATA');
        
        (If you don't know what the preceding means, don't worry about it. It only affects people trying to use CGI for XML processing and other specialized tasks.)


SO ADDED TO dojo.xhrRawPost INSTANTIATION:

    contentType: "text",

AND IT WORKED!!




NB:  TRIED TO INCREASE THE SERVER'S LIMIT ON THE SIZE OF THE URI BY ADDING THIS LINE IN httpd.conf

LimitRequestLine 99999

WHERE THE DEFAULT SIZE IS 8190 BUT THAT DIDN'T WORK.



</entry>

<entry [Wed Feb  4 17:12:07 EST 2009] RELOADED stage TABLE IN Bioptic0.2.5 USING EMBEDDED JAVASCRIPT IN resource FIELD>

cd C:\DATA\base\html\Bioptic0.2.5\bin

perl loader.pl --dbfile C:/DATA/base/html/Bioptic0.2.5/bin/data.dbl --sqlfile C:/DATA/base/html/Bioptic0.2.5/bin/sql/stage.sql --bsvfile C:/DATA/base/html/Bioptic0.2.5/bin/sql/stage.bsv





</entry>

<entry [Mon Feb  2 15:23:07 EST 2009] LOAD stage TABLE IN Bioptic0.2.5 TO BE CALLED BY Workflow.js SUBROUTINE >

cd C:\DATA\base\html\Bioptic0.2.5\bin

perl loader.pl --dbfile C:/DATA/base/html/Bioptic0.2.5/bin/data.dbl --sqlfile C:/DATA/base/html/Bioptic0.2.5/bin/sql/stage.sql --bsvfile C:/DATA/base/html/Bioptic0.2.5/bin/sql/stage.bsv

    Dropping table: stage
    Creating table: stage
    Loading data into table: stage
    bsvfile: C:\\DATA\\base\\html\\Bioptic0.2.5\\bin\\sql\\stage.bsv
    Command:
    
    Queryhasharray:
    $VAR1 = [
              {
                'stagedescription' => 'stagedescription',
                'childpid' => 'childpid',
                'status' => 'status',
                'workflowdescription' => 'workflowdescription',
                'workflowpid' => 'workflowpid',
                'stagename' => 'stagename',
                'applicationname' => 'applicationname',
                'completed' => 'completed',
                'workflownumber' => 'workflownumber',
                'stderrfile' => 'stderrfile',
                'progress' => 'progress',
                'inputfiles' => 'inputfiles',
                'application' => 'application',
                'stagenumber' => 'stagenumber',
                'workflowxmlfile' => 'workflowxmlfile',
                'outputfiles' => 'outputfiles',
                'stdoutfile' => 'stdoutfile',
                'parentpid' => 'parentpid',
                'started' => 'started',
                'arguments' => 'arguments',
                'workflowname' => 'workflowname'
              },
              {
                'stagedescription' => 'Genome Analyzer short read assembly',
                'childpid' => '',
                'status' => '',
                'workflowdescription' => 'Assemble short reads',
                'workflowpid' => '',
                'stagename' => 'eland',
                'applicationname' => 'eland.pl',
                'completed' => '',
                'workflownumber' => '1',
                'stderrfile' => '',
                'progress' => '',
                'inputfiles' => '',
                'application' => 'bin/nextgen/eland.pl',
                'stagenumber' => '1',
                'workflowxmlfile' => '',
                'outputfiles' => '',
                'stdoutfile' => '',
                'parentpid' => '',
                'started' => '',
                'arguments' => '{ [ { \'option: \'--inputfile\', \'format\': \'fasta
    \', \'description\': \'/full/path/to/inputfile (must be fasta format)\', \'type\
    ': \'inputfile\', \'required\' : true }, { \'option: \'--outputfile\', \'format\
    ': \'eland\', \'description\': \'/full/path/to/outputfile (in Eland format)\', \
    'type\': \'outputfile\', \'required\' : true }, { \'option: \'--refdir\', \'form
    at\': \'inputdirectory\', \'description\': \'/full/path/to/directory/containing/
    reference_sequences.2bpb, .idx and .vld files\', \'type\': \'input\', \'required
    \': false }, { \'option: \'--multi\', \'format\': \'\', \'description\': \'Run E
    land with \'--multi\' option (Boolean)\', \'type\': \'parameter\', \'required\':
     false } ] }',
                'workflowname' => 'Workflow1-assembly'
              }
            ];
    Completed loader.pl


</entry>

<entry [Mon Feb  2 15:23:07 EST 2009] NEW bioinfo GROUP PASSWORD>

    !Bioinfo123(itn)


</entry>

<entry [Mon Feb  2 15:22:07 EST 2009] CREATED NEW APACHE-OWNED bioptic0.2.5 FOLDER (CAN sudo su apache NOW) >

IN PIPELINE DIRECTORY
cd /home/syoung/base/pipeline/bioptic0.2.5

ls -ald /home/syoung/base/pipeline/bioptic0.2.5
drwxrwx--- 2 apache apache 16384 Feb  2 15:04 /home/syoung/base/pipeline/bioptic0.2.5


</entry>

<entry [Thurs 29 Jan 23:48:00 EST 2008] USER HOME FOLDERS - ALLOW APACHE TO SET ACCESS TO EACH fileroot/username>

PROBLEM:

WANT TO ALLOW USERS TO TRANSFER DATA FROM THEIR fileroot/username FOLDER TO THEIR /home/username FOLDER


SOLUTION:

1. ALLOW APACHE TO SET ACCESS TO EACH fileroot/username

NB: PROVIDED USER'S HOME FOLDER IS 755, CAN ALSO SET USER HOME FOLDERS TO BE INCLUDED IN 'Source' FOLDERS FOR EACH USER 

C:\DATA\base\pipeline\admin



</entry>

<entry [Thurs 29 Jan 23:48:00 EST 2008] CCS WEB SERVER MIGRATION>

-----Original Message-----
From: Zongjun Hu via RT [mailto:hpc@ccs.miami.edu] 
Sent: Thursday, January 29, 2009 11:48 PM
Cc: Chung, Caty; Schuerer, Stephan; asrinivasan@rsmas.miami.edu; Valdes, Camilo; Puram, Deepthi; Zysman, Joel; Khuri, Sawsan; Young, Stuart; Cole, Wendell; xwu@rsmas.miami.edu; Jiang, Zhijie
Subject: [ccstkt #839] CCS Web Server Migration 

Hi,

I am working on CCS web server migration. I have copied the following sites to
our new web server. The mysql databases have been copied to new server as
well.The file directory which has been copied to new web server is listed with
the site name.

Could please review this list and let me know if I missed any stuff? If you
have any concern about this migration, please reply this mail as well.

After this migration, you may lose access to new web server. If you need
access, please us know. We will then set up approriate access for you.

The current web server will be replaced by new web server this weekend.

1. www.ccs.miami.edu

hpc /var/www/html/hpc

wiki /var/www/html/wiki

phpBB3 /var/www/html/phpBB3

mihg /var/www/html/mihg

GSA /var/www/html/GSA, /var/www/cgi-bin/GSA

cheminfo /var/www/html/cheminfo

ngs /var/www/html/ngs

rjadoo /var/www/html/rjadoo

2. bio.ccs.miami.edu

ibis /vhosts/bioinfo/ibis, tomcat6 apps

3. host: sccc.ccs.miami.edu

AICFScheduler /sccc/AICFScheduler

FCCFScheduler /sccc/FCCFScheduler

OCFScheduler /sccc/OCFScheduler

Zongjun



</entry>

<entry [Mon 19 Jan 19:24:00 EST 2008] GOTCHAS WITH OVERWRITE CONFIRMATION DIALOG FOR FILEDRAG>


PROBLEM:

CLICK ON DIALOGUE CAUSES IT TO DISAPPEAR AND DOES NOT REGISTER onClick EVENTS
ATTACHED TO 'YES' AND 'NO' BUTTONS

SOLUTION:




</entry>

<entry [Mon 12 Jan 23:30:00 EST 2008] NB: ADD TO PERL MODS (USED IN Project.pm)>

File::Copy::Recursive
http://search.cpan.org/~dmuey/File-Copy-Recursive-0.38/Recursive.pm

    use File::Copy::Recursive qw(fcopy rcopy dircopy fmove rmove dirmove);

    fcopy($orig,$new[,$buf]) or die $!;
    rcopy($orig,$new[,$buf]) or die $!;
    dircopy($orig,$new[,$buf]) or die $!;
    
    fmove($orig,$new[,$buf]) or die $!;
    rmove($orig,$new[,$buf]) or die $!;
    dirmove($orig,$new[,$buf]) or die $!;
    
    rcopy_glob("orig/stuff-*", $trg [, $buf]) or die $!;
    rmove_glob("orig/stuff-*", $trg [,$buf]) or die $!;

rcopy()

This function will allow you to specify a file *or* directory. It calls fcopy() if its a file and dircopy() if its a directory. If you call rcopy() (or fcopy() for that matter) on a file in list context, the values will be 1,0,0 since no directories and no depth are used. This is important becasue if its a directory in list context and there is only the initial directory the return value is 1,1,1.

rmove()

Like rcopy() but calls fmove() or dirmove() instead.

  
File::Remove 
http://search.cpan.org/dist/File-Remove/lib/File/Remove.pm

use File::Remove 'remove';

    # removes (without recursion) several files
    remove( '*.c', '*.pl' );

    # removes (with recursion) several directories
    remove( \1, qw{directory1 directory2} ); 

    # removes (with recursion) several files and directories
    remove( \1, qw{file1 file2 directory1 *~} );

    # trashes (with support for undeleting later) several files
    trash( '*~' );

</entry>

<entry [Thurs 08 Jan 21:22:00 EST 2008] SESSION INFO IN UCSC>

CHROMOSOME VIEW IN UCSC

SAVED TO FILE:

file:///C:/DATA/base/html/bioptic1/resources/View/chromosome%20view%20UCSC.htm

CAN USE IN TWO WAYS:

  1) CONVERT TO SVG WITH INKSCAPE, THEN CONVERT INTO DHTML
  
  
  
  2) USE WITH CCS AS BACKGROUND IMAGE FOR CHROMOSOME ELEMENT



</entry>

<entry [Thurs 08 Jan 15:56:00 EST 2008] SESSION INFO IN UCSC>

FROM 

One thing that is important to know about changes you have made to the viewer:  the browser remembers your changes, until you clear them.  A cookie is stored on your browser that remembers where you were looking in the genome, and if you made changes to those menus.

As we have discussed, there are a number of changes you can maketo the position, the track displays, and even the filter options (which we really didn't cover here, but are covered in the exercises).  These parameters are all saved on the computer you are using.  This may be greatyou may always want to look at the data the same way.  Oras you move from one tool at this site to another, you carry your position with you.  Butthat may not be greatif you have forgotten that you filtered out something, or turned off a track.   And if you use a shared computer in the lab or a libraryyou don't know if someone made some changes since you used the browser last.

The UCSC team refers to these settings as being stored in your cart.  There are a couple of ways to clear out your cart:  you can choose the default tracks button from the Viewer controls to reset the viewer to default settings.  Or the link that says:  Click here to reset on the Gateway starting page wipes out any cart choices.  

If you ever find that your genome browser isn't behaving quite like you expect, try to clear your cart and start again.  

Another handy feature is the Sessions option.  If  you have a configuration that you want to store and return to examine later, or if there is some region you want to point people to specificallyyou can save your view as a session.  At the top of a viewer page there is a link for Sessions where you can accomplish this.  You will need a login for the Genome Browser Wiki system, but once you have that you will see how easy it is to save views, segments, track configurations, and so onyou can save multiple sessions and they can be uniquely named.  You will get a URL that you can share if you like, or a session can be private.  


</entry>

<entry [Thurs Dec 25 20:12:00 EST 2008] USE DND SOURCE INSIDE MENU LIST>

FILDRAG WITH DND SOURCE/TARGET IN MENU
http://localhost:8080/Bioptic0.2.3/html/file-drag1.html


DND SOURCE AND TARGET IN MENU
http://localhost:8080/Bioptic0.2.3/html/menu-drag1.html


BASIC DND ON PAGE
http://localhost:8080/Bioptic0.2.3/html/drag1.html



</entry>

<entry [Wed Dec 17 20:12:00 EST 2008] LDAP AUTHENTICATION OKAY>


#!/usr/bin/perl -w
use strict;

use Net::LDAP;
use CGI;

my $cgi = CGI->new();
my $username = $cgi->param('username');
my $password = $cgi->param('password');

print "Content-type: text/html\n\n";

my $ldap = Net::LDAP->new( 'ldap.ccs.miami.edu' );

#Server: ldap.ccs.miami.edu
#Binddn: uid=USERNAME,ou=Users,dc=ccs,dc=miami,dc=edu
#Bindpw: USERPASS

# bind to a directory with dn and password
my $message = $ldap->bind(
    "uid=$username,ou=Users,dc=ccs,dc=miami,dc=edu",
    "password" => "$password"
);

print "\$message->code(): ", $message->code(), "\n";


</entry>

<entry [Sun Dec 14 23:12:00 EST 2008] DOH ROBOT TESTS>

COMBINE dojox.widget.filePicker WITH dojo.dnd.Container, etc. - NOTES

dojox.widget.RollingList:


	addChild: function(/*Widget*/ widget, /*int?*/ insertIndex){
		// summary: adds a child to this rolling list - if passed an insertIndex,
		//  then all children from that index on will be removed and destroyed
		//  before adding the child.
		if(insertIndex > 0){
			this._removeAfter(insertIndex - 1);
		}
		this.inherited(arguments);
		if(!widget._started){
			widget.startup();
		}
		this.layout();
		if(!this._savedFocus){
			widget.focus();
		}
	},
	


dojo.dnd.Container



	insertNodes: function(data, before, anchor){

		// summary: inserts an array of new nodes before/after an anchor node
		// data: Array: a list of data items, which should be processed by the creator function
		// before: Boolean: insert before the anchor, if true, and after the anchor otherwise
		// anchor: Node: the anchor node to be used as a point of insertion

		if(!this.parent.firstChild){
			anchor = null;
		}else if(before){
			if(!anchor){
				anchor = this.parent.firstChild;
			}
		}else{
			if(anchor){
				anchor = anchor.nextSibling;
			}
		}
		if(anchor){
			for(var i = 0; i < data.length; ++i){
				var t = this._normalizedCreator(data[i]);
				this.setItem(t.node.id, {data: t.data, type: t.type});
				this.parent.insertBefore(t.node, anchor);
			}
		}else{
			for(var i = 0; i < data.length; ++i){
				var t = this._normalizedCreator(data[i]);
				this.setItem(t.node.id, {data: t.data, type: t.type});
				this.parent.appendChild(t.node);
			}
		}
		return this;	// self
	},



</entry>


<entry [Fri Dec 05 01:12:00 EST 2008] IMPLEMENTED FILE UPLOAD FOR Projects.js>

1. INSTALLED FileInput.js & FileInputAuto.js

dojo.require("dojox.widget.FileInput");	
dojo.require("dojox.widget.FileInputAuto");	

2. DEMO PAGE HERE:

http://localhost:8080/Bioptic2/html/file-upload2.html

3. ADDED TO Bioptic2.3



</entry>

<entry [Thurs Dec 04 14:43:00 EST 2008] WORKFLOW AND PROJECTS WORKING TOGETHER - SAVED IN SUBVERSION AS Bioptic2.2 (version 2)>

C:/svn/Bioptic2


</entry>

<entry [Thurs Dec 04 14:43:00 EST 2008] FilePicker BUG FIX POSTED TO dojotoolkit.org>

http://bugs.dojotoolkit.org/ticket/8226


I'm not sure if this has been attended to already but I couldn't find it on this site so I thought I would post this as a FYI.

Problem:

I encountered a 'node is null' error with FilePicker.js. Here's how I produce the error:

1. Click on a file (non-directory) node, which displays the file details in the next pane
2. Click on a directory (non-file) node, which should display the rolling list of files in the next pane, but instead gives this console error in Firefox: 'node is null' in dojo/html.js at line 29 (in the function dojo.html._emptyNode).

Solution:

I traced it back to the _removeAfter function of RollingList which FilePicker inherits from. The error can be fixed by replacing line 481 in dojox.widget.RollingList:

//				c.destroyRecursive();
  				c.destroy();

Cheers,

youngstuart



</entry>

<entry [Tues Dec 02 21:33:00 EST 2008] ADMIN, PREFERENCES & PROJECT PLUGIN OUTLINES>

1. ADMIN (FISHEYE) - ADMINISTER USERS & GROUPS, USER/GROUP FILE SYSTEM ACCESS 

    FISHEYE BASED ON:
    
    http://localhost:8080/bioptic1/dojo.1.2.2/dojox/widget/tests/test_FisheyeList.html
    http://localhost:8080/bioptic1/dojo.1.2.2/dojox/widget/tests/test_FisheyeLite.html
    

2. USER PREFERENCES (FISHEYE)

    - USER ADDS/REMOVES/RENAMES PROJECTS 
    - USER ADDS/REMOVES GROUPS IN PROJECT
    - USER ADDS/REMOVE/RENAMES GROUPS
    - USER ADDS/REMOVES GROUP MEMBERS
    - USER SETS GROUP AND WORLD PRIVILEGES PER PROJECT (DEFAULT = 751)

    FISHEYE AS ABOVE
    

3. PROJECT (MULTIPLE TABS)

    FilePicker INSIDE dojox.dijit.Dialog

    - USER ADDS/REMOVES/RENAMES PROJECT FOLDERS
    - USER ADDS/REMOVES/RENAMES WORKFLOWS IN PROJECTS (WK+ --> OPENS NEW WORKFLOW TAB)
    - USER MOVES WORKFLOWS BETWEEN PROJECTS
    - USER COPIES WORKFLOWS BETWEEN PROJECTS
    - USER ADDS/REMOVES FILES/DIRECTORIES IN WORKFLOWS (FILES ARE LINKS FROM PERMITTED FILESYSTEMS OR UPLOADED)
    - USER MOVES FILES/DIRECTORIES BETWEEN WORKFLOWS
    - USER COPIES FILES/DIRECTORIES BETWEEN WORKFLOWS
    - KEEP TRACK OF FILESYSTEM SIZES IN EACH PROJECT
    - LIMIT FILE ADDITIONS BEYOND A PRESET USER QUOTA (DEFAULT = NONE)

    BASED ON dojox.widget.FilePicker
    
    http://localhost:8080/bioptic1/dojo.1.2.2/dojox/widget/tests/test_FilePicker.html
    
    TEST PAGE:
    
    http://localhost:8080/bioptic1/test/file-browse2.html


IMAGES FOR FISHEYE (silk):

folder_user

group_add       
group_delete
group_edit
group_error
group_gear

group_go        // GO TO GROUP PAGE TO SEE LIST OF USERS

user
user_add
user_delete
user_edit
user_go

world
world_add



IMAGES FOR FILEPICKER:

folder
folder_add


LATER USE IN AJAX-GBROWSE:

zoom_in
zoom_out


</entry>

<entry [Mon Dec 01 19:53:00 EST 2008] RUN Bioptic ON WINDOWS>

structure
=========

        html----+
                Bioptic2---+
                            html----+
                                    index.html
                                    
                                    dialog-prog2.html (LOGIN WINDOW)
        cgi-bin-+                     |
                Bioptic2---+          |
                            admin.cgi /
                            (copied to dir from html/Bioptic2/cgi-bin)
                            (RETURNS SESSION ID)
                            
http://localhost:8080/cgi-bin/Bioptic2/admin.cgi?mode=login&username=admin&password=admin

RETURNS

1228194323.3980.704

RUNS OK!!!


SQLITE WORKED FINE ON WINDOWS TO CREATE THE DATABASE:

cd C:\DATA\base\html\Bioptic2\bin
perl create_database.pl



login design notes
==================

1. SESSION ID GENERATED ON SERVER - SAFER THAN CLIENT GENERATION

2. USE https IN FUTURE

3. SESSION ID STORED IN dojo.cookie AND THEREFORE ACROSS WINDOWS (CHECKED!)





dojo.require("dojo.cookie"); //Pull down the dojo.cookie module

/* Serialize a complex data type... */
var foo = {bar : 0, baz : 23, quz : ['a','b','c']};
dojo.cookie("foo", dojo.toJson(foo)); //by default, the cookie will expire at the  end of the session

/* ...and then deserialize it when you need it back. */
foo = dojo.fromJson(dojo.cookie("foo")); //no further typecasting required


cPane.setHref('yourPage.html');

dojox.rpc.Client.clientId += dojo.cookie("JSESSIONID");






THE FOLLOWING ARE SOME PROBLEMS AND SOLUTIONS RELATED TO THE IMPLEMENTATION ON WINDOWS.


1. PROBLEM:

DBI object version 1.604 does not match $DBI::VERSION 1.607 at C:/Perl/lib/DynaLoader.pm line 225.

SOLUTION:

COMMENT OUT THE use lib FOR THE LINUX64 PERL LIBRARIES

====

2. PROBLEM: NEED DBD-MYSQL

SOLUTION:

REMOVE use Database FROM Admin.pm

OR INSTALL DBD-mysqlPP, I.E., DOWNLOAD PACKAGE STRAIGHT:

http://ppm.activestate.com/PPMPackages/zips/8xx-builds-only/Windows/

Add repository http://cpan.uwinnipeg.ca/PPMPackages/10xx/package.xml

 moving the directories containing the newly installed ( via ppm ) module from 'PERL_HOME\site\lib\...' to 'PERL_HOME\lib\...' should help



====

3. PROBLEM: NEED SYMLINKS

SOLUTION:

GET ADMIN ON LAPTOP TO USE mklink


NB: THE FOLLOWING DIDN'T WORK:


LINKD grafts (links) the target name directly into the name space at Source,
so that Source subsequently acts as a name space junction. The Source directory
must reside on a disk formatted with NTFS in Windows 2000. The destination
(the target of the link) can be any valid directory name or device name or valid
object name in Windows 2000. When the target name does not resolve to a directory
or a device, open calls fail.

I.E.: linkd source destination

whereby source is actually only a link. Any application accessing "source" is in reality accessing "destination". When creating this link it's important that that source folder must not exist. If it does you'll get an error message by linkd:

    "Cannot create a link at: ... "

since an existing folder cannot be a link at the same time. 

DO IT:

cd C:\Program Files\Windows Resource Kits\Tools>

> linkd C:\DATA\base\cgi-bin\Bioptic2 C:\DATA\base\html\Bioptic2\cgi-bin




Well, you shouldn't have had two "documents and settings" folders. You obviously copied that folder to d:\ but you should have moved it there, instead. The syntax for linkd is:



SYMBOLIC LINKS REDUX
http://wesnerm.blogs.com/net_undocumented/2006/10/symbolic_links__1.html





USE fsutil TO CREATE 'reparsepoints' ON WIN XP:

cd C:\DATA\base\cgi-bin


Microsoft Windows XP [Version 5.1.2600]
(C) Copyright 1985-2001 Microsoft Corp.

C:\Documents and Settings\syoung>fsutil
---- Commands Supported ----

behavior        Control file system behavior
dirty           Manage volume dirty bit
file            File specific commands
fsinfo          File system information
hardlink        Hardlink management
objectid        Object ID management
quota           Quota management
reparsepoint    Reparse point management
sparse          Sparse file control
usn             USN management
volume          Volume management

C:\Documents and Settings\syoung>cd ../../DATA/base/cgi-bin

C:\DATA\base\cgi-bin>dir

    Volume in drive C has no label.
    Volume Serial Number is 1FC3-814D
   
    Directory of C:\DATA\base\cgi-bin
   
   12/01/2008  10:33 PM    <DIR>          .
   12/01/2008  10:33 PM    <DIR>          ..
   10/01/2008  10:14 PM    <DIR>          ajaxgbrowse2
   12/01/2008  10:05 PM    <DIR>          bioptic1
   10/21/2008  01:39 PM    <DIR>          perlmods
   06/12/2008  06:01 PM    <DIR>          pval4
   11/30/2008  11:48 AM    <DIR>          sandbox22
   12/01/2008  10:33 PM                 4 test.txt
                  1 File(s)              4 bytes
                  7 Dir(s)  21,139,570,688 bytes free


C:\DATA\base\cgi-bin>fsutil reparsepoint test.txt symlink.txt

    test.txt is an invalid parameter.
    ---- REPARSEPOINT Commands Supported ----

query           Query a reparse point
delete          Delete a reparse point

C:\DATA\base\cgi-bin>

fsutil reparsepoint test.txt symlink.txt

    C:\Documents and Settings\syoung>fsutil
    
    ---- Commands Supported ----
    
    behavior        Control file system behavior
    dirty           Manage volume dirty bit
    file            File specific commands
    fsinfo          File system information
    hardlink        Hardlink management
    objectid        Object ID management
    quota           Quota management
    reparsepoint    Reparse point management
    sparse          Sparse file control
    usn             USN management
    volume          Volume management




</entry>

<entry [Mon Dec 01 24:08:00 EST 2008] SESSION ID - KEEP IT SIMPLE, SUNSHINE - IN Admin.pm LOGIN SUBROUTINE>


http://www.experts-exchange.com/Programming/Languages/Scripting/Perl/Q_22410635.html

jhurst:

OK, the way I do this is:

1) I look for a variable in the input stream called sessionID
2) if it is set then I check that there is a file with that name - if so, then the user is signed in
3)  if not then I ask for user name and password and do whatever check I need, if validated then I create a session ID, whic I do with

    $sessId=time . "." . $$ . "." . int(rand(1000));
    
    OR THE MORE COMPLICATED VERSION:
    
    require MD5;
    $session_id = MD5->hexhash(MD5->hexhash(time.{}.rand().$$)));


4) I create a file with that name
5) I make sure that all future pages generated include that hidden variable in their input form
6) if there is data that I need to associate with a session then I keep that in the sessionId file too

As it happens there is a benefit that you do have the time that the seesion started as the first part of the sessionID, so you can log people off if you need.

ALso you can periodically clean up old session ID files.

There is no risk of two users getting the same sesssionId because it includes the time and the process id.  There is little chance of anyone guessing one since there is a 1 in 32000 possibility for the processid and 1 in 1000 for the random part, and this assumed even that he has some idea of the second in which the sessionId was created.

I use this system all the time.  It works VERY well


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Sun Nov 30 23:00:46 EST 2008

MULTIPLE FILE UPLOAD WILL BE BASED ON THIS:

http://www.dvdtown.com/scripts/dojo/dojox/widget/tests/test_FileInput.html

FROM:

http://dojotoolkit.org/book/dojo-book-0-9/part-3-programmatic-dijit-and-dojo/manipulating-widgets-through-code/writing-yo-0
Submitted by dante on Thu, 09/13/2007 - 20:44.

    The Dojo folks are building an extension to this widget called dojox.widget.FileInputAuto. It works like FileInput except it submits itself after a delay following a blur() on the element. For details (as yet undocumented), get the latest nightly build of Dojo and look for it in dojox.widget. 


TEST PAGE:

http://localhost:8080/bioptic1/test/file-upload1.html




NOTE: LOAD PROGRESS WILL BE BASED ON:

http://localhost:8080/bioptic1/dojo.1.2.2/dojox/widget/tests/test_Loader.htm

TEST PAGE:

http://localhost:8080/bioptic1/test/load-progress1.html




</entry>

<entry [Sun Nov 30 23:00:00 EST 2008] FILE BROWSER WILL BE BASED ON dojox.widget.FilePicker>

http://localhost:8080/bioptic1/dojo.1.2.2/dojox/widget/tests/test_FilePicker.html

TEST PAGE:

http://localhost:8080/bioptic1/test/file-browse2.html



</entry>

<entry [Tues Nov 25 13:30:46 EST 2008] SOLEXA DATA ON DIONYSIUS MOUNTED ON KRONOS AT /mihgdata/solexa>


ll /mihgdata/solexa
    
    total 4.9M
    drwxr-xr-x+ 23      508 users     36 Oct 23 14:58 .
    drwxrwxr-x   9 mihgadm  mihgadm   11 Oct  7 18:23 ..
    drwxr-xr-x+  6      508 users     25 May 12  2008 080509_HWI-EAS185_0001_201UPAAXX_Aphid_JH
    drwxr-xr-x+  6      508 users     28 Oct  9 22:23 080801_HWI-EAS185_0001_20GVYAAXX_Jia_cDNA2_mtDNA_Total_Small_Medium_JH
    drwxr-xr-x+  6      508 users     27 Oct  9 19:02 080805_HWI-EAS185_0006_20GVYAAXX_Jia_cDNA2_mtDNA_Total_Small_Medium_read2_JH
    drwxr-xr-x+  6      508 users     27 Aug 25 10:33 080814_HWI-EAS185_0001_SeqCapture_Barcoding_RNA_JH
    -rwxr--r--+  1      508 users   2.2K Sep 29 18:55 08-09-29_18-48-08
    -rwxr--r--+  1      508 users   2.2K Sep 29 19:11 08-09-29_19-04-02
    drwxr-xr-x+  4      508 users      6 Sep 30 19:26 080930_HWI-EAS185_0001
    -rwxr--r--+  1      508 users   2.9K Oct 14 14:19 08-10-14_14-07-22
    -rwxr--r--+  1      508 users   2.2K Oct 14 14:47 08-10-14_14-40-07
    -rwxr--r--+  1      508 users   2.2K Oct 14 15:06 08-10-14_14-59-06
    -rwxr--r--+  1      508 users   2.2K Oct 14 15:19 08-10-14_15-11-32
    -rwxr--r--+  1      508 users   2.2K Oct 14 16:08 08-10-14_15-24-09
    -rwxr--r--+  1      508 users   2.2K Oct 14 17:06 08-10-14_16-22-24
    -rwxr--r--+  1      508 users   1.8K Oct 15 13:25 08-10-15_13-18-14
    drwxr-xr-x+  8      508 users     22 Oct 15 10:41 081015_HWI-EAS185_00035test
    drwxr-xr-x+  6      508 users     25 Jun  2 20:32 201UNAAXX_G006_JIA_080530_HWI-EAS185_0002_JH
    drwxr-xr-x+  6      508 users     25 May 25  2008 2023BAAXX_W002_080522_HWI-EAS185_0002_AN_JH
    -rwxr--r--+  1      508 users   1.2M Sep 15 16:28 3UTR_allgenes.txt
    -rw-r--r--+  1 jhuang   users   3.4M Sep 15 15:58 3UTR_map_file.txt
    drwxr-xr-x+  3 dhedges  users      4 Jul  7 17:06 AMOS
    -rw-r--r--+  1 root     root     217 Jul 12 19:06 error.txt
    drwxr-xr-x+  3 dhedges  users      4 Jul 18 14:14 GSL
    drwxr-xr-x+  2 ddittman users      5 Sep 12 12:36 hit_files
    drwxr-xr-x+  4 jhoffman users     76 Sep 23 16:05 humanRef
    drwxr-xr-x+  3      508 users      3 Mar 21  2008 Instruments
    drwxr-xr-x+  6      508 users     21 Oct  1 05:35 Overnightrun
    drwxr-xr-x+  2 ddittman users     12 Sep 22 10:10 perl_scripts
    drwxrwxr-x   4      508 users      4 Nov 17 09:23 pipeline_out
    -rw-r--r--+  1 jhoffman users      0 Sep 15 16:45 s_6_hits.txt
    drwxr-xr-x+ 15 dhedges  users     19 Jul 18 14:26 SGE
    drwxr-xrwx+  2 ddittman users     10 Sep 11 11:54 split_files
    drwxr-xr-x+  3 dhedges  users      4 Jul  1 17:53 Velvet
    drwxr-xr-x+  8 syoung   users     32 Oct 10 16:24 workflow1
    drwxr-xr-x+  3 syoung   users      3 Oct  9 21:33 workflow2


</entry>

<entry [Fri Nov 21 23:30:46 EST 2008] GOOD AUTOMATED TEST EXAMPLE IN dojox/data/tests/runTests.pl>

- DOH
- shows progress, failed (w. errors), time (ms)


C:\DATA\base\html\bioptic1\dojo.1.2.2\dojox\data\tests


</entry>

<entry [Fri Nov 21 16:30:46 EST 2008] FOR EXONS IN ASTD DATABASE, GET WHETHER IN CODING REGION AND FRAME >


ASTD DOWNLOAD GENOME COORDINATES:

wget ftp://ftp.ebi.ac.uk/pub/databases/astd/current_release/human/9606_features.gff.gz

(NB: DESCRIPTION OF gff3 FORMAT:)
http://www.sequenceontology.org/gff3.shtml

head 9606_features.gff

#
# Homo sapiens feature predictions from ASTD
# ASTD project - European Bioinformatics Institute - 2007
# Generated on Date:            24/07/08 14:13
#
# Post comments/questions to:
# http://www.ebi.ac.uk/support/index.php?query=ASTD
#
# Datasources:
# ASTD release 1.1(15/02/2008)
# EnsEMBL homo_sapiens 41_36c
#
ENSG00000180611 Ensembl gene    193987301       194128644       .       -       .       ID=ENSG00000180611;Dbxref=taxon:9606;organism=Homo sapiens;chromosome=3;name=C3orf59;source=HGNC
TRAN00000042126 ASTD    transcript      193998626       194118362       .       -       .       ID=TRAN00000042126;Parent=ENSG00000180611
EXON00000293544 ASTD    exon    194118113       194118362       .       -       .       ID=EXON00000293544;Parent=TRAN00000042126
ATSS00000035133 ASTD    transcription_start_site        194118339       194118339       .       -       .       ID=ATSS00000035133;Parent=TRAN00000042126;tss_cluster=CTSS00000026710
CTSS00000026710 ASTD    tss_cluster     194118333       194118333       .       -       .       ID=CTSS00000026710;Parent=TRAN00000042126
ATSS00000035134 ASTD    transcription_start_site        194118332       194118332       .       -       .       ID=ATSS00000035134;Parent=TRAN00000042126;tss_cluster=CTSS00000026710
ATSS00000035135 ASTD    transcription_start_site        194118329       194118329       .       -       .       ID=ATSS00000035135;Parent=TRAN00000042126;tss_cluster=CTSS00000026710
ATSS00000035136 ASTD    transcription_start_site        194118322       194118322       .       -       .       ID=ATSS00000035136;Parent=TRAN00000042126;tss_cluster=CTSS00000026710
...


DOWNLOAD ASTD SPLICE EVENTS FILE:

wget ftp://ftp.ebi.ac.uk/pub/databases/astd/current_release/human/9606_events.gff.gz


head 9606_events.gff
EVEN00000029913 ASTD    Mutually Exclusive      52709501        52714827        .       -       .       chr=3;gene=ENSG00000016864;features=EXON00000363345(12778..12946 52712143..52712311 169);features=EXON00000363340(11085..11309 52713780..52714004 225);pair=TRAN00000054457,TRAN00000054453;form=SME;description=Simple Mutually Exclusive
EVEN00000029914 ASTD    Exon Isoform    52709553        52714502        .       -       .       chr=3;gene=ENSG00000016864;features=EXON00000363340(11085..11309 52713780..52714004 225),EXON00000363339(11081..11309 52713780..52714008 229),4nt,0nt;pair=TRAN00000054456,TRAN00000054460;pair=TRAN00000054456,TRAN00000054454;pair=TRAN00000054453,TRAN00000054460;pair=TRAN00000054453,TRAN00000054454;form=EI-5P;description=Exon Isoform/5P flanking exon undergoing modifications
EVEN00000029915 ASTD    Cassette Exon   52709501        52714847        .       -       .       chr=3;gene=ENSG00000016864;features=EXON00000363339(11081..11309 52713780..52714008 229);pair=TRAN00000054449,TRAN00000054454;pair=TRAN00000054457,TRAN00000054460;pair=TRAN00000054450,TRAN00000054454;pair=TRAN00000054447,TRAN00000054454;pair=TRAN00000054449,TRAN00000054460;form=SCE;description=Simple Cassette Exon
...


DOWNLOAD ASTD dbSNP MAPPING ANALYSIS:

wget ftp://ftp.ebi.ac.uk/pub/databases/astd/current_release/human/9606_dbSNP.map.gz

gunzip 9606_dbSNP.map.gz

head 9606_dbSNP.map
>ENSG00000100060 rs8192545-rs8192545 suspected Alleles:(C,G) GENE_POS:10312 GENE_NUC:C STRAND:1
TRAN00000120065 Coord:(5p=~312,3p=168) Type:E Numt:21 Nbre_allele:1|Allele:C NumtA:21 TypeA:K Freq:100 Trans:CR456518,BI832589,BM916993,BP203210,BG754757,BQ223548,BQ065528,BM917326,BX328852,BX385539,BQ053547,BQ052117,DN997561,BQ052074,BM564281,BM921648,CD614736,BG397568,BI838442,BM456340,BC094814;
TRAN00000120066 Coord:(5p=~285,3p=168) Type:E Numt:3 Nbre_allele:1|Allele:C NumtA:3 TypeA:K Freq:100 Trans:CR604551,CR605939,CR611297;
TRAN00000120067 Coord:(5p=~298,3p=175) Type:E Numt:5 Nbre_allele:1|Allele:C NumtA:5 TypeA:K Freq:100 Trans:DA883419,BP264748,BM457814,CD695156,AA428944;
TRAN00000120068 Coord:(5p=~280,3p=168) Type:E Numt:5 Nbre_allele:1|Allele:C NumtA:5 TypeA:K Freq:100 Trans:BG341913,BI823024,BQ057862,AU143259,BE254149;
TRAN00000120069 Coord: Type:O Numt:0 Nbre_allele:0|
TRAN00000120070 Coord:(5p=~304,3p=168) Type:E Numt:1 Nbre_allele:1|Allele:C NumtA:1 TypeA:K Freq:100 Trans:DB113825;
TRAN00000120071 Coord:(5p=~54,3p=143) Type:E Numt:3 Nbre_allele:1|Allele:C NumtA:3 TypeA:K Freq:100 Trans:AA452322,AA453322,AA441876;
TRAN00000120072 Coord: Type:O Numt:0 Nbre_allele:0|
TRAN00000120073 Coord: Type:O Numt:0 Nbre_allele:0|


DOWNLOAD ASTD EMBL DAT FILE:

wget ftp://ftp.ebi.ac.uk/pub/databases/astd/current_release/human/9606_embl.dat.gz


    downloading....
    
    




FTP DOWNLOAD HUMAN CCDS:

wget ftp://ftp.ncbi.nlm.nih.gov/pub/CCDS/current_human/CCDS.20080902.txt

head CCDS.20080902.txt
#chromosome     g_accession     gene    gene_id ccds_id ccds_status     cds_strand      cds_from        cds_to  cds_locations   match_type
1       NC_000001.8     FLJ22639        79854   CCDS1.1 Withdrawn, inconsistent annotation      -       801942  802433  [801942-802433] Identical
1       NC_000001.9     SAMD11  148398  CCDS2.2 Public  +       851184  869395  [851184-851255, 855397-855578, 856281-856331, 861014-861138, 864282-864371, 864517-864702, 866386-866548, 867378-867493, 867652-867730, 867801-868300, 868495-868619, 868940-869050, 869150-869395]       Identical
...

FTP DOWNLOAD 


USE EBI Dbfetch TO GET FLAT FILE FROM ENSEMBL GENE ENSG00000180611 -> ???? C3orf59 -> UniProtKB/Swiss-Prot Q8IYB1 ENSEMBL ID Q8IYB1 -> UNIPARC UPI000000DAEB -> EMBL CDS AAH45582:

http://www.ebi.ac.uk/cgi-bin/dbfetch?db=EMBLSVA&id=AAH45582.1


FH   Key             Location/Qualifiers
FH
FT   source          1..3381
FT                   /organism="Homo sapiens"
FT                   /lab_host="DH10B"
FT                   /mol_type="mRNA"
FT                   /clone_lib="NIH_MGC_95"
FT                   /clone="MGC:57376 IMAGE:5262015"
FT                   /tissue_type="Brain, hippocampus"
FT                   /note="Vector: pBluescriptR"
FT                   /db_xref="taxon:9606"
FT   gene            1..3381
FT                   /gene="C3orf59"
FT   CDS             328..1797
FT                   /codon_start=1
FT                   /gene="C3orf59"
FT                   /product="chromosome 3 open reading frame 59"
FT                   /db_xref="HGNC:30438"
FT                   /db_xref="UniProtKB/Swiss-Prot:Q8IYB1"
FT                   /protein_id="AAH45582.1"
FT                   /translation="MAAPTANKAASLGCNNKPAFPELDFRSGARVEELNKLIQEFTKHD
FT                   QREYDDQRALEIHTAKDFIFSMLGMVQKLDQKLPVANEYLLLSGGVREGVVDLDLDELN
FT                   VYARGTDYDMDFTLLVPALKLHDRNQPVTLDMRHSALCHSWLSLRLFDEGTISKWKDCC
FT                   TIVDHINGATNYFFSPTKVADWFYDSISIVLSEIQKKPQRGMPKVEKVEKNGTIISIIL
FT                   GVGSSRMLYDIVPVVSFKGWPAVAQSWLMENHFWDGKITEEEVISGFYLVPACSYKGKK
FT                   DNEWRLSFARSEVQLKKCISSSLMQAYQACKAIIIKLLSRPKAISPYHLRSMMLWACDR
FT                   LPANYLAQEDYAAHFLLGLIDDLQHCLVNKMCPNYFIPQCNMLEHLSEETVMLHARKLS
FT                   SVRSDPAEHLRTAIEHVKAANRLTLELQRRGSTTSIPSPQSDGGDPNQPDDRLAKKLQQ
FT                   LVTENPGKSISVFINPDDVTRPHFRIDDKFF"



</entry>

<entry [Thurs Nov 20 15:44:46 EST 2008] OVERRIDE dojo._loadUriAndCheck IN dojo/_base/_loader/loader.js TO FIX "Could not load" ERROR MESSAGE WITH dojo.require DESPITE USING CORRECT PATH FOR dojo.registerModulePath>

// VERSION 1.2.2 PLACED IN dojo/_base/_loader/loader.js
// VERSION 1.1.1 PLACED IN dojo/dojo.js


dojo._loadUriAndCheck = function(/*String*/uri, /*String*/moduleName, /*Function?*/cb){

	// summary: calls loadUri then findModule and returns true if both succeed
	var ok = false;
	
	try {
		ok = this._loadUri(uri, cb);
		if ( ok )
		{
			this._loadedModules[moduleName] = 1;
		}
	}
	catch(e)
	{
		console.error("failed loading " + uri + " with error: " + e);
	}

	return !!(ok && this._loadedModules[moduleName]); // Boolean
}




</entry>

<entry [Mon Nov 17 23:44:46 EST 2008] DOWNLOADED VERSION 1.2.2 AND CHECKED NIGHTLY RELEASES WITH WORKING DND TARGET TEST>

RELEASE 1.2.2

http://download.dojotoolkit.org/release-1.2.2/

NIGHTLY

http://archive.dojotoolkit.org/nightly/dojotoolkit/dojo/tests/

WORKING DND TARGET TEST

http://download.dojotoolkit.org/release-1.2.2/dojo-release-1.2.2/dojo/tests/dnd/test_dnd.html

MOVED TO

http://localhost:8080/bioptic1/test/dnd-target2.html

USED IN LATEST COMPLETE PROGRAMMATIC VERSION

http://localhost:8080/bioptic1/test/layout7.html





</entry>

<entry [Sat Nov 15 00:44:46 EST 2008] FIXED CSS PROBLEM WITH PROGRAMMATIC TABS>

YOUTUBE
http://www.youtube.com/watch?v=m-5MHhkY1x4


WORKING EXAMPLE
http://localhost:8080/bioptic1/test/layout-tab6.html


PROBLEM:

PROGRAMMATICALLY GENERATED AND SOME DECLARATIVE TAB PANES DO NOT APPEAR BUT ARE PRESENT IN THE DOM

DIAGNOSIS:

dijit.css CONTAINS CSS WHICH HIDES THE TAB PANES DUE TO THE dijitAlignClient CLASS ATTACHED TO THE dijitTabPaneWrapper IN THE HTML PRODUCED BY THE TabContainer OBJECT:

templateString:

<div class="dijitTabContainer">
    <div dojoAttachPoint="tablistNode"></div>
    <div class="dijitTabPaneWrapper" dojoAttachPoint="containerNode">
    </div>
</div>


SEE LINE 614 IN jslib/dijit/themes/dijit.css.commented.css:

/* Layout widgets. This is essential CSS to make layout work (it isn't "styling" CSS)
   make sure that the position:absolute in dijitAlign* overrides other classes */

.dijitLayoutContainer{
	position: relative;
	display: block;
	overflow: hidden;
}

body .dijitAlignTop,
body .dijitAlignBottom,
body .dijitAlignLeft,
body .dijitAlignRight {
	position: absolute;
	overflow: hidden;
}


COMMENTING OUT overflow: hidden AND position: absolute FOR dijitAlign* ITEMS IN dijitTab.css REMOVES THE PROBLEM AND THE TABS APPEAR NORMALLY (ALTHOUGH THE OVERFLOW ONLY WORKS IF YOU FIRST USE Webtools TO VIEW THE HTML ELEMENT INFO, I.E., CNTL + SHIFT + F):

LINE 662:

body .dijitAlignTop,
body .dijitAlignBottom,
body .dijitAlignLeft,
body .dijitAlignRight {
	/*position: absolute;*/
	/*overflow: hidden;*/
}
/*body .dijitAlignClient { position: absolute; }*/


LINE 762:

.dijitTabPaneWrapper {
	z-index:0;
	/*overflow: hidden;*/
	clear: both;	
}


SOLUTION:

SEE bioptic1/test/layout-tab7.html

ADD style:'height' AND 'width' ON INSTANTIATION OF tabContainer

	var tabContainer = new dijit.layout.TabContainer({ style:'height:150px;width:500px;'},dojo.byId("dataholder"));






</entry>

<entry [Wed Nov 12 00:10:46 EST 2008] INSTALL SCRIPT TO HARDCODE PERL MODULE LIBRARY PATHS IN EXECUTABLES (AND SOME MODULES)>

FROM:

Wed Feb  7 19:29:45 EST 2007
REINSTALL OF iprscan IN /common/apps/iprscan WITHOUT SGE SUPPORT 

gems:/common/apps/iprscan local$ sudo ./Config.pl 

####################################################################################################
#                Welcome to the InterProScan v4.2 installation script.
#
#  Tips:
#     - If you are happy with the suggestion between [], just press <enter>
#     - Whatever is shown between '/' and '/' is considered a valid input pattern
####################################################################################################


    Reconfigure everything? (first time install) [n] /(y|n)/? : y

! Tip:
!
! InterProScan needs to know where it is installed and where perl is installed
!
    Do you want to set paths to perl and the installation directory? [y] /y|n/? : y

! Tip:
!
! If your servers are using a shared file system, such as NFS, InterProScan is able to utilise this
! and perform distributed computing across multiple servers
! You will need set up the full UNIX path to the installation directory.
! You also need to ensure that the InterProScan installation is on a SHARED DISK.
!
    Please enter the full path for the InterProScan installation [/Volumes/gemshd4/common/apps/iprscan] /.+/? : /common/apps/iprscan
    Do you want to set another Perl command in place of [/usr/bin/perl]? [n] /y|n/? : n
>>Changing Perl path in scripts ... >>DONE

>>Checking if your Perl installation has the modules required by InterProScan...
>>All modules needed are already installed.


! Tip:
!
! To cope with bulk jobs and to enable efficient parallelization, InterProScan splits input files
! with FASTA formatted sequences into smaller parts (chunks). Default size is "10" sequences per chunk
!
    Do you want to setup chunk size [y] /(y|n)/? : y

! Tip:
!
! Here you should specify the maximum number of sequences allowed in each part (chunk).  Please note
! it is not recommended to have more then 3000 chunks.
!
    Enter chunk size [10] /[0-9]+/? : 50


! Tip:
!
! You can configure InterProScan to limit the number of input sequences (protein & nucleotide),
! set a maximum length for nucleotide sequences and a minimum length for protein sequences.
! You can also configure the minimum length for a translated orf and use the codon table value
! to translate the dna/rna sequence into six frames (http://www.ebi.ac.uk/cgi-bin/mutations/trtables.cgi).
!
    Do you want to configure this? [y] /(y|n)/? : y
    Enter the maximum number of input protein sequences allowed [1000] /\d+/? : 
    Enter the maximum number of input nucleic sequences allowed [100] /\d+/? : 
    Enter the maximum length (in nucleic acids) for a nucleotide sequence [10000] /\d+/? : 
    Enter the minimum length (in amino acids) for a protein sequence [5] /\d+/? : 10
    Enter the minimum allowed length of a translated orf [50] /\d+/? : 30
    Enter the default codon table value to use to translate dna/rna in six frames [0] /\d+/? : 


! Tip:
!
! InterProScan currently encorporates searching against 13 databases. You have the choice whether or not to
! set up a particular search tool against a database and how exactly that application will be configured to run
! in this next section. You will configure the queue systems (if any) you will use, first
!
    Do you want to setup applications (if you don't, no applications will be included in InterProScan by default)? [y] /(y|n)/? : y

! Tip:
!
! InterProScan is able to execute the applications via a UNIX QUEUING system which has an INTERACTIVE mode (such as LSF).
! Currently, we mainly support LSF (which is used at EBI) however, we also provide configuration files for other systems
! which are listed in the documentation
!
    Do you wish to use a queue system? [n] /(y|n)/? : n
>>Checking your local architecture for InterProScan compatibility

! Tip:
! Blastprodom (a wrapper script on top of Blast package) is used to search against PRODOM families
    Do you want to use blastprodom ? [y] /(y|n)/? : 
!
! PLEASE NOTE:
! InterProScan can be launched through a cluster machine using RSH. To be able to utilise this
! feature, all your machines must be visible to each other (see the .rhost file) and be mounted on
! a shared file system, such as NFS
! (If you are installing InterProScan for use on only one machine please ignore the above message)
!
    
Please enter the execution host name of blastprodom [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Coils is used to predict coiled-coil segments with the algorithm of Lupas et al.
    Do you want to use coils ? [y] /(y|n)/? : 
    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the executi "cd /common/apps/iprscan; hostname" 2> /common/apps/iprscan/rsh_err"
rcmd: getaddrinfo: No add) is not supported in this distribution, try another host.
    ING: The "" UNIX OS (
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? : 
ln: binaries/Darwin: File exists
WARNING: Unable to create symbolic link 'ln -s Darwin binaries': 
Please correct the error or create the symbolic link manually if necessary

    
Please enter the execution host name of coils [gems.rsmas.miami.edu] /\S+/? :     

! Tip:
! Gene3d Gene3D is supplementary to the CATH database. This protein sequence database contains proteins from complete genomes which have been clustered into protein families and annotated with CATH domains, Pfam domains and functional information from KEGG, GO, COG, Affymetrix and STRINGS.
    Do you want to use gene3d ? [y] /(y|n)/? : 
    
Please enter the execution host name of gene3d [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Hmmpanther (hmmpfam from HMMER 2.3.2 package) PANTHER classifies proteins into families and specific functional subfamilies, which are then mapped to ontology terms and pathways.
    Do you want to use hmmpanther ? [y] /(y|n)/? : 
    
Please enter the execution host name of hmmpanther [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Hmmpir PIR produces the Protein  Sequence Database (PSD) of functionally annotated protein sequences, which grew out of the Atlas of Protein Sequence and Structure (1965-1978) edited by Margaret Dayhoff and has been incorporated into an integrated knowledge base system of value-added databases and analytical tools.
    Do you want to use hmmpir ? [y] /(y|n)/? : 
    
Please enter the execution host name of hmmpir [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Hmmpfam (hmmpfam from HMMER 2.3.2 package) is used to search against the Pfam HMM (Profile hidden Markov models) database
    Do you want to use hmmpfam ? [y] /(y|n)/? : 
    
Please enter the execution host name of hmmpfam [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Hmmsmart (hmmpfam from HMMER 2.3.2 package) is used to search against the Smart HMM (Profile hidden Markov models) database
    Do you want to use hmmsmart ? [y] /(y|n)/? : 
    
Please enter the execution host name of hmmsmart [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Hmmtigr (hmmpfam from HMMER 2.3.2 package) is used to search against TIGRFAMs collection of HMMs (Profile hidden Markov models)
    Do you want to use hmmtigr ? [y] /(y|n)/? : 
    
Please enter the execution host name of hmmtigr [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Fprintscan (FingerPRINTScan) is used to search against the PRINTS collection of protein signatures
    Do you want to use fprintscan ? [y] /(y|n)/? : 
    
Please enter the execution host name of fprintscan [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Scanregexp (ScanProsite) is used to search against the PROSITE patterns collection and verify the  matches by statistically significant CONFIRM patterns
    Do you want to use scanregexp ? [y] /(y|n)/? : 
    
Please enter the execution host name of scanregexp [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Profilescan (ProfileScan (pfscan & ps_scan.pl) from Pftools 2.2) package is used  to search against the PROSITE profiles collection
    Do you want to use profilescan ? [y] /(y|n)/? : 
    
Please enter the execution host name of profilescan [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Superfamily A structural classification of proteins database for the investigation of sequences and structures.
    Do you want to use superfamily ? [y] /(y|n)/? : 
    
Please enter the execution host name of superfamily [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Seg is used for identifying and masking segments of low compositional complexity in amino acid sequences
    Do you want to use seg ? [y] /(y|n)/? : 
    
Please enter the execution host name of seg [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Signalp predicts the presence and location of signal peptide cleavage sites, using eukaryotic HMM (under commercial license : contact software@cbs.dtu.dk)
    Do you want to use signalp ? [n] /(y|n)/? : y
    
Please enter the execution host name of signalp [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
! Tmhmm is used for prediction of transmembrane helices in proteins using a Hidden Markov Model (under commercial license : contact software@cbs.dtu.dk)
    Do you want to use tmhmm ? [n] /(y|n)/? : y
    
Please enter the execution host name of tmhmm [gems.rsmas.miami.edu] /\S+/? : 

! Tip:
!
! InterProScan can use taxonomy-based filtering of results which uses the InterPro taxonomy listed for each InterPro
! entry to hide hits not relevant to that taxon.
!
    Do you want to make it available for users? [y] /y|n/? : 

! Tip:
!
! You can specify an email address for the administrator. By default it will be you (root)
! Administrators receive an email when a problem occurs in InterProScan.
!
    Do you want to set an administrator email address? [y] /y|n/? : syoung@rsmas.miami.edu
WARNING: The information input is not valid (doesn't match /y|n/), please try again.
    Do you want to set an administrator email address? [y] /y|n/? : y
    Please enter the email address of the administrator: [] /[\w\.\-]+\@[\w\.\-]+/? : syoung@rsmas.miami.edu
>>Writing to the configuration files ... 
>>Processing file : /common/apps/iprscan/conf/blastprodom.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/coils.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/fprintscan.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/gene3d.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/hmmpanther.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/hmmpfam.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/hmmpir.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/hmmsmart.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/hmmtigr.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/profilescan.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/scanregexp.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/seg.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/signalp.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/superfamily.conf ... >>DONE
>>Processing file : /common/apps/iprscan/conf/tmhmm.conf ... >>DONE
>>Setting File /common/apps/iprscan/conf/iprscan.conf ... >>DONE

! Tip:
!
! InterProScan can be launched through a web interface. It can also be launched through secure HTTP (https)
!
    Do you want to run InterProScan using a web interface? [n] /y|n/? : y
    Do you want to run InterProScan through a secure HTTP server? [n] /y|n/? : 
    Enter the name of your server. You can specify a specific port to listen to. (e.g. "foo.bar.com:4000") [foobar.com] /[\w\.\_\-\:\d]+/? : gems.rsmas.miami.edu
!
! Please add the following lines to your web server configuration (httpd.conf):
#--------------------------------------
 Alias /doc/ "/Volumes/gemshd3/common/apps/iprscan/doc/html/"
 Alias /images/ "/Volumes/gemshd3/common/apps/iprscan/images/"
 Alias /tmp/ "/Volumes/gemshd3/common/apps/iprscan/tmp/"

 ScriptAlias /iprscan/ "/Volumes/gemshd3/common/apps/iprscan/bin/"

 <Directory "/Volumes/gemshd3/common/apps/iprscan/images">
   Options Indexes MultiViews
   AllowOverride None
   Order allow,deny
   Allow from all
 </Directory>

 <Directory "/Volumes/gemshd3/common/apps/iprscan/tmp/">
   Options FollowSymLinks Includes SymLinksIfOwnerMatch
    IndexIgnore */.??* *~ *# */HEADER* */README* */RCS
    AllowOverride AuthConfig Limit FileInfo

    Order deny,allow
    Deny from all
    Allow from .rsmas.miami.edu
 </Directory>
#--------------------------------------
! Be sure that 'apache' or 'httpd' virtual user (uid/gid) have right to read/write into your /Volumes/gemshd3/common/apps/iprscan iprscan directory.
! Otherwise, if you are running a standalone http(s) web server, be sure also the user running it have to enough
! rights to read/wrtie /Volumes/gemshd3/common/apps/iprscan iprscan directory
! If you encoutered problem with your web server running iprscan, read the FAQ or contact your system administrator.

! After restarting your web server try http://gems.rsmas.miami.edu/iprscan/iprscan
!
>>Indexing datafile ... 
No specific file(s) given, indexing all files:

Pfam
prints.pval
prodom.ipr
Pfam-C
smart.desc
sf_hmm
sf.seq
Pfam-A.seed
superfamily.hmm
smart.thresholds
smart.HMMs
match.xml
interpro.xml
TIGRFAMs_HMM.LIB
Gene3D.hmm


No specific file(s) given, converting all files:

Pfam
sf_hmm
superfamily.hmm
smart.HMMs
sf_hmm_sub
TIGRFAMs_HMM.LIB
Gene3D.hmm

WARNING: Some problems occured when trying to index the data files.
 Please fix the error below and index your datafiles using the /common/apps/iprscan/bin/index_data.pl script.
 For help, type './index_data.pl -h' 
errormsg: ERROR: File [/common/apps/iprscan/data/sf.seq] not found : No such file or directory at /common/apps/iprscan/bin/index_data.pl line 217.
>>DONE

! Tip:
!
!  We would appreciate it if you would register your installation of InterProScan.  This will allow us to notify you
! of bug fixes and new releases of the software. We will not use your email address for any other purpose.
!
    Would you like to register InterProScan? [y] /(y|n)/? : n

>>Installation is completed.  Please test your installation by running on the command line:

        /common/apps/iprscan/bin/iprscan -cli -i /common/apps/iprscan/test.seq -o /common/apps/iprscan/test.out -format raw -goterms -ipr




+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Tue Nov 11 16:12:52 EST 2008
TESTING BY BARBIE

http://birmingham.pm.org/talks/barbie/perltest2/slide312.html

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



SKIP

    * A SKIP block allows you to ignore tests that you know will fail
          o platform might not support test (fork on Win32)
          o optional module not installed
          o functionality not enabled 

TODO

    * A TODO block allows you to watch tests and alert when they pass
          o usually code has not been written 

SKIP & TODO

    * BAIL_OUT allows you to stop any further testing
          o things must have gone seriously wrong to want to do this though 




Running Tests

    * tv - Test::Verbose
    * prove - Test::Harness / TAP::Parser
    * runtests - TAP::Parser 

... or as part of the full Perl test harness


Test::Pod

    * http://search.cpan.org/dist/Test-Pod
    * Written by Andy Lester (petdance)
    * Tests the POD layout within your scripts and modules.
    * Reports on syntactic validity.
    * Single script required to test a complete distribution. 

    use Test::More;
    eval "use Test::Pod 1.00";
    plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
    all_pod_files_ok();


Test::Pod::Coverage

    * http://search.cpan.org/dist/Test-Pod-Coverage
    * Written by Andy Lester (petdance)
    * Tests the POD to CODE ratio within your scripts and modules.
    * Reports on any functions without POD (with exceptions).
    * Single script required to test a complete distribution. 

    use Test::More;
    eval "use Test::Pod::Coverage 0.08";
    plan skip_all =>
      "Test::Pod::Coverage 0.08 required for testing POD coverage"
      if $@;
    all_pod_coverage_ok();



Test::Signature

    * http://search.cpan.org/dist/Test-Signature
    * Written by Iain Truskett (1979 - 2003)
    * Currently maintained by Audrey Tang
    * Tests the signature included with your distribution 

    # This is actually the t/00signature.t file from
    # the Test-Signature distribution.
    use Test::More tests => 1;
    use Test::Signature;
    signature_ok();



Test::Distribution

    * http://search.cpan.org/dist/Test-Distribution
    * Originally written by Marcel Gr?nauer
    * Now maintained by Sagar R. Shah
    * Provides standard tests for a single distribution.
    * Single script required to test a complete distribution. 

    use Test::More;
    BEGIN {
      eval     { require Test::Distribution; };
      if($@)   { plan skip_all => 'Test::Distribution not installed'; }
      else     { import Test::Distribution; }
    }


    *  Package Files
          o Ensures we have standard set of package files: Changes, MANIFEST, README & Build.PL or Makefile.PL 

    * Prerequsites
          o Checks whether all used modules that aren't in the perl core are also mentioned in Makefile.PL's PREREQ_PM. 

    * Plain Old Documentation
          o Checks for POD errors in files
          o uses Test::Pod 



Test::Distribution

    * Signatures
          o If the distribution has a SIGNATURE file, checks the SIGNATURE matches the files.
          o Uses Test::Signature 

    * Does It Work?
          o This uses the modules to make sure the load happens ok. 

    * Versions
          o Checks that all packages define $VERSION strings.
          o Optional check where all modules MUST have a version the same as the distribution. 




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




+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Tue Nov 11 15:24:54 EST 2008
JSON-RPC for Dojo

http://www.ibm.com/developerworks/websphere/library/techarticles/0606_barcia/0606_barcia.html

Dojo provides an abstraction layer for invoking JSON-RPC requests. JSON-RPC for Dojo introduces the notion of a Standard Method Description (SMD). An SMD file is a description of a JSON-RPC service. It allows you to describe a JSON invocation in a neutral fashion. Listing 6 gives an example of such a JSON invocation:

Listing 6. A JSON invocation in Dojo

{"SMDVersion":".1",
 "objectName":"StockService",
 "serviceType":"JSON-RPC",
 "serviceURL":"/DojoJ2EE/JSON-RPC",
 "methods":[
		{"name":"getStockData",
		"parameters":[
			{"name":"symbol",
			"type":"STRING"}
		 ]
    }
  ]
 }
	

You can use the Dojo API to invoke the service:


var StockService = new dojo.rpc.JsonService("/path/to/StockService.smd"); StockService.getStockData("IBM",stockResultCallback);


Over the wire, this will send this structure:
{"id": 2, "method": "getStockData", "params": ["IBM"]}



+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Tue Nov 11 14:22:09 EST 2008
PACKAGING USING h2xs

http://perltraining.com.au/tips/2005-09-26.html

The MANIFEST file contains a list of all files that should be contained in your module distribution. This is used when building an archive for distribution, and also by clients and automated tools to ensure the distribution is intact. 

The MANIFEST file allows for additional notes, tests, directories, design documents, and other files to live in your development environment, without the requirement that these included in the final distribution.

REM: PUT ALL MODULES IN lib, and make sure they are all in the MANIFEST file.
In the Makefile.PL, the "module_name" just defines the main name that is used to create the distribution file and so on.  But anything in 'lib' will be included if it is also in the MANIFEST.



1. CREATE BIOPTIC PACKAGE

cd /home/syoung/base/apps/packaging

h2xs -b 5.6.0 -XA -n Bioptic

    [syoung@zion packaging]$ cd Bioptic
    [syoung@zion Bioptic]$ ll
    -rw-r--r-- 1 syoung bioinfo  159 Nov 11  2008 Changes
    -rw-r--r-- 1 syoung bioinfo   63 Nov 11  2008 MANIFEST
    -rw-r--r-- 1 syoung bioinfo  532 Nov 11  2008 Makefile.PL
    -rw-r--r-- 1 syoung bioinfo 1.2K Nov 11  2008 README
    drwxr-xr-x 2 syoung bioinfo  16K Nov 11  2008 lib
    drwxr-xr-x 2 syoung bioinfo  16K Nov 11  2008 t


2. ADD MODULES TO lib

cp -r ../ngs/lib/* lib

cat MANIFEST

    Changes
    Makefile.PL
    MANIFEST
    README
    t/Bioptic.t
    lib/Bioptic.pm
    

3. UPDATE MANIFEST AUTOMATICALLY
(update MANIFEST to include all new files found in your distribution)

    perl Makefile.PL
    make manifest

NB: "make: warning:  Clock skew detected.  Your build may be incomplete" ERROR MEANS:
    
    that a built file has a timestamp older than the source
    file.  Usually this happens either when you reset the date in the middle
    of a build or you set the date back after you do a cvs update.  Check
    the current date and check the modification dates on your files, and
    you'll find the problem.
    
cat MANIFEST

    Changes
    lib/Admin/Workflow.pm  **** NEW
    lib/Bioptic.pm
    Makefile.PL
    MANIFEST
    README
    t/Bioptic.t


3. ADD bin DIRECTORY TO DISTRIBUTION

cp -r ../ngs/bin* ./

ll

-rw-r--r-- 1 syoung bioinfo  159 Nov 11 15:17 Changes
-rw-r--r-- 1 syoung bioinfo   85 Nov 11 15:22 MANIFEST
-rw-r--r-- 1 syoung bioinfo   63 Nov 11 15:17 MANIFEST.bak
-rw-r--r-- 1 syoung bioinfo  22K Nov 11 15:22 Makefile
-rw-r--r-- 1 syoung bioinfo  532 Nov 11 15:17 Makefile.PL
-rw-r--r-- 1 syoung bioinfo 1.2K Nov 11 15:17 README
drwxr-xr-x 4 syoung bioinfo  16K Nov 11  2008 bin
drwxr-xr-x 3 syoung bioinfo  16K Nov 11 15:19 lib
drwxr-xr-x 2 syoung bioinfo  16K Nov 11 15:17 t


perl Makefile.PL
make manifest

    /usr/bin/perl "-MExtUtils::Manifest=mkmanifest" -e mkmanifest
    Added to MANIFEST: bin/loadtables.pl
    Added to MANIFEST: bin/registerdatabase.bkp1.creates_tables.pl
    Added to MANIFEST: bin/registerdatabase.pl
    Added to MANIFEST: bin/sql/.DS_Store
    Added to MANIFEST: bin/sql/archive/create_collectiondatabase.sql
    Added to MANIFEST: bin/sql/create_collectionblast.sql
    Added to MANIFEST: bin/sql/create_collections.sql
    Added to MANIFEST: bin/sql/create_sessions.sql
    Added to MANIFEST: bin/sql/create_stage.sql
    Added to MANIFEST: bin/sql/create_users.sql
    Added to MANIFEST: bin/workflow/est-array/collectionsequences.workflow1.master.xml
    Added to MANIFEST: bin/workflow/est-array/master.xml
    Added to MANIFEST: bin/workflow/est-cluster/master.xml
    Added to MANIFEST: bin/workflow/orthologue-nucleotide/master.xml
    Added to MANIFEST: bin/workflow/orthologue-peptide/master.xml


4. CHECK FOR MISSING FILES IN MANIFEST:

make distcheck

    [syoung@zion Bioptic]$ mv bin bin.temp
    [syoung@zion Bioptic]$     make distcheck
    /usr/bin/perl "-MExtUtils::Manifest=fullcheck" -e fullcheck
    No such file: bin/loadtables.pl
    No such file: bin/registerdatabase.bkp1.creates_tables.pl
    No such file: bin/registerdatabase.pl
    No such file: bin/sql/.DS_Store
    No such file: bin/sql/archive/create_collectiondatabase.sql
    No such file: bin/sql/create_collectionblast.sql
    No such file: bin/sql/create_collections.sql
    No such file: bin/sql/create_sessions.sql
    No such file: bin/sql/create_stage.sql
    No such file: bin/sql/create_users.sql
    No such file: bin/workflow/est-array/collectionsequences.workflow1.master.xml
    No such file: bin/workflow/est-array/master.xml
    No such file: bin/workflow/est-cluster/master.xml
    No such file: bin/workflow/orthologue-nucleotide/master.xml
    No such file: bin/workflow/orthologue-peptide/master.xml
    Not in MANIFEST: bin.temp/loadtables.pl
    Not in MANIFEST: bin.temp/registerdatabase.bkp1.creates_tables.pl
    Not in MANIFEST: bin.temp/registerdatabase.pl
    Not in MANIFEST: bin.temp/sql/.DS_Store
    Not in MANIFEST: bin.temp/sql/archive/create_collectiondatabase.sql
    Not in MANIFEST: bin.temp/sql/create_collectionblast.sql
    Not in MANIFEST: bin.temp/sql/create_collections.sql
    Not in MANIFEST: bin.temp/sql/create_sessions.sql
    Not in MANIFEST: bin.temp/sql/create_stage.sql
    Not in MANIFEST: bin.temp/sql/create_users.sql
    Not in MANIFEST: bin.temp/workflow/est-array/collectionsequences.workflow1.master.xml
    Not in MANIFEST: bin.temp/workflow/est-array/master.xml
    Not in MANIFEST: bin.temp/workflow/est-cluster/master.xml
    Not in MANIFEST: bin.temp/workflow/orthologue-nucleotide/master.xml
    Not in MANIFEST: bin.temp/workflow/orthologue-peptide/master.xml


5. BUILD A DISTRIBUTION

make tardist
## OR
## make zipdist 

ll
    -rw-r--r-- 1 syoung bioinfo  17K Nov 11  2008 Bioptic-0.01.tar.gz
    -rw-r--r-- 1 syoung bioinfo  159 Nov 11 15:17 Changes
    -rw-r--r-- 1 syoung bioinfo  602 Nov 11 15:29 MANIFEST
    -rw-r--r-- 1 syoung bioinfo   85 Nov 11 15:22 MANIFEST.bak
    -rw-r--r-- 1 syoung bioinfo  22K Nov 11 15:22 Makefile
    -rw-r--r-- 1 syoung bioinfo  532 Nov 11 15:17 Makefile.PL
    -rw-r--r-- 1 syoung bioinfo 1.2K Nov 11 15:17 README
    drwxr-xr-x 4 syoung bioinfo  16K Nov 11 15:29 bin
    drwxr-xr-x 3 syoung bioinfo  16K Nov 11 15:19 lib
    drwxr-xr-x 2 syoung bioinfo  16K Nov 11 15:17 t



6. CHECK DISTRIBUTION

[syoung@zion Bioptic]$ cp Bioptic-0.01.tar.gz temp/
[syoung@zion Bioptic]$ cd temp/
[syoung@zion temp]$ tar xvfz Bioptic-0.01.tar.gz 
Bioptic-0.01/
Bioptic-0.01/bin/
Bioptic-0.01/bin/sql/
Bioptic-0.01/bin/sql/create_users.sql
Bioptic-0.01/bin/sql/create_stage.sql
Bioptic-0.01/bin/sql/.DS_Store
Bioptic-0.01/bin/sql/create_sessions.sql
Bioptic-0.01/bin/sql/create_collectionblast.sql
Bioptic-0.01/bin/sql/archive/
Bioptic-0.01/bin/sql/archive/create_collectiondatabase.sql
Bioptic-0.01/bin/sql/create_collections.sql
Bioptic-0.01/bin/loadtables.pl
Bioptic-0.01/bin/workflow/
Bioptic-0.01/bin/workflow/orthologue-peptide/
Bioptic-0.01/bin/workflow/orthologue-peptide/master.xml
Bioptic-0.01/bin/workflow/orthologue-nucleotide/
Bioptic-0.01/bin/workflow/orthologue-nucleotide/master.xml
Bioptic-0.01/bin/workflow/est-array/
Bioptic-0.01/bin/workflow/est-array/collectionsequences.workflow1.master.xml
Bioptic-0.01/bin/workflow/est-array/master.xml
Bioptic-0.01/bin/workflow/est-cluster/
Bioptic-0.01/bin/workflow/est-cluster/master.xml
Bioptic-0.01/bin/registerdatabase.bkp1.creates_tables.pl
Bioptic-0.01/bin/registerdatabase.pl
Bioptic-0.01/Changes
Bioptic-0.01/t/
Bioptic-0.01/t/Bioptic.t
Bioptic-0.01/MANIFEST
Bioptic-0.01/lib/
Bioptic-0.01/lib/Bioptic.pm
Bioptic-0.01/lib/Admin/
Bioptic-0.01/lib/Admin/Workflow.pm
Bioptic-0.01/README
Bioptic-0.01/Makefile.PL
Bioptic-0.01/META.yml
[syoung@zion temp]$ ls
Bioptic-0.01  Bioptic-0.01.tar.gz
[syoung@zion temp]$ cd Bioptic-0.01


ls
    Changes  MANIFEST  META.yml  Makefile.PL  README  bin  lib  t

cat META.yml

    # http://module-build.sourceforge.net/META-spec.html
    #XXXXXXX This is a prototype!!!  It will change in the future!!! XXXXX#
    name:         Bioptic
    version:      0.01
    version_from: lib/Bioptic.pm
    installdirs:  site
    requires:
    
    distribution_type: module
    generated_by: ExtUtils::MakeMaker version 6.30


mkdir installdir

perl Makefile.PL PREFIX=`pwd`/installdir

make


make test
    make: Warning: File `Makefile' has modification time 68 s in the future
    PERL_DL_NONLAZY=1 /usr/bin/perl "-MExtUtils::Command::MM" "-e" "test_harness(0, 'blib/lib', 'blib/arch')" t/*.t
    t/Bioptic....ok                                                              
    All tests successful.
    Files=1, Tests=1,  0 wallclock secs ( 0.01 cusr +  0.02 csys =  0.03 CPU)
    make: warning:  Clock skew detected.  Your build may be incomplete.

make install
    make: Warning: File `Makefile' has modification time 64 s in the future
    Installing /home/syoung/base/apps/packaging/Bioptic/temp/Bioptic-0.01/installdir/lib/perl5/site_perl/5.8.8/Bioptic.pm
    Installing /home/syoung/base/apps/packaging/Bioptic/temp/Bioptic-0.01/installdir/lib/perl5/site_perl/5.8.8/Admin/Workflow.pm
    Installing /home/syoung/base/apps/packaging/Bioptic/temp/Bioptic-0.01/installdir/share/man/man3/Bioptic.3pm
    Writing /home/syoung/base/apps/packaging/Bioptic/temp/Bioptic-0.01/installdir/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/auto/Bioptic/.packlist
    Appending installation info to /home/syoung/base/apps/packaging/Bioptic/temp/Bioptic-0.01/installdir/lib64/perl5/5.8.8/x86_64-linux-thread-multi/perllocal.pod
    make: warning:  Clock skew detected.  Your build may be incomplete.


ll installdir/

drwxr-xr-x 3 syoung bioinfo 16K Nov 11  2008 lib
drwxr-xr-x 3 syoung bioinfo 16K Nov 11  2008 lib64
drwxr-xr-x 3 syoung bioinfo 16K Nov 11  2008 share


perldoc Bioptic

    Bioptic(3)            User Contributed Perl Documentation           Bioptic(3)
    
    NAME
           Bioptic - Perl extension for blah blah blah
    
    SYNOPSIS
             use Bioptic;
             blah blah blah
    
    DESCRIPTION
           Stub documentation for Bioptic, created by h2xs. It looks like the author of the extension
           was negligent enough to leave the stub unedited.
    
           Blah blah blah.
    
           EXPORT
    
           None by default.
    
    SEE ALSO
           Mention other useful documentation such as the documentation of related modules or operating
           system documentation (such as man pages in UNIX), or any relevant external documentation
           such as RFCs or standards.
    
           If you have a mailing list set up for your module, mention it here.
    
           If you have a web site set up for your module, mention it here.
    
    AUTHOR
           A. U. Thor, <syoung@localdomain>
    
    COPYRIGHT AND LICENSE
           Copyright (C) 2008 by A. U. Thor
    
           This library is free software; you can redistribute it and/or modify it under the same terms
           as Perl itself, either Perl version 5.8.8 or, at your option, any later version of Perl 5
           you may have available.
    
    perl v5.8.8                       2008-11-11                        Bioptic(3)




@@@@@@@@@@@@@

http://perltraining.com.au/tips/2005-09-26.html

Bundling code into modules can make your project easier to test, develop, and maintain. However while many developers are familiar with the concept and requirements of a module, not everyone is sure of the best way to lay these out on the filesystem.

If your business or project does not already have existing guidelines for module development, then you may wish to consider starting with Perl's h2xs command.

The original use of h2xs was building Perl extensions form C header files, and it is still used extensively for this purpose. However h2xs can also be used to provide the skeleton for ordinary Perl modules, and we will investigate that in today's perl-tip.

The easiest way to start a pure Perl module with h2xs is with the command:

        h2xs -XA -n Acme::Example

The -n Acme::Example switch specifies our module name. This is used in generating the directory (Acme-Example), skeleton code, and is used in generating the Makefile.PL.

The -XA switches simply omit the sections that would have been used if we were building our module on the top of existing C header files. As a pure Perl module, these are simply going to get in the way.

By default, h2xs will use the latest and greatest Perl features when creating our code skeleton. If we want to ensure backwards compatibility, we can do so using the -b switch. In the example below we ensure that our code will still work under Perl 5.6.0, which is still seen in many environments:

        h2xs -b 5.6.0 -XA -n Acme::Example

Files inside a module distribution

After running h2xs, a number of files will exist in our distribution. These are skeleton files, and are intended to be checked and edited by the developer.

Changes
    The Changes file exists to track changes to the module. This is not a required file for a module distribution, but it is recommended. For CPAN and other distributed modules it can help developers make more informed choices about upgrading; for internally used modules it can be used to track major feature changes and releases. 
Makefile.PL
    The Makefile.PL is used to generate a makefile for building, testing, and installing your module. It can be used to check that the correct version of Perl and supporting modules are installed, as well as doing any special work required to ensure your module is built correctly. 

    The Makefile.PL files generated by h2xs use ExtUtils::MakeMaker to generate the final makefiles. You can use perldoc ExtUtils::MakeMaker to learn more about the options that can be passed to this module.

    To build, test, and install your module, use:

            perl Makefile.PL
            make
            make test
            make install

MANIFEST
    The MANIFEST file contains a list of all files that should be contained in your module distribution. This is used when building an archive for distribution, and also by clients and automated tools to ensure the distribution is intact. 

    The MANIFEST file allows for additional notes, tests, directories, design documents, and other files to live in your development environment, without the requirement that these included in the final distribution.

    You should ensure that your MANIFEST file lists all the files essential for your distribution, including both Perl modules, tests, and special files such as Makefile.PL. You can check to see which files are missing from your MANIFEST by using:

            perl Makefile.PL
            make distcheck

    Likewise, if you wish to automatically update your manifest to include all new files found in your distribution, you can do so with:

            perl Makefile.PL
            make manifest

    To actually build a distribution from your module, use:

            perl Makefile.PL
            make tardist

    It's highly recommended that you ensure that the generated file (in the form Acme-Example-0.01.tar.gz) can be used to correctly build and install your module before you distribute it. There is also a make zipdist command to build a .zip file rather than a .tar.gz file.
README
    The README file contains a short description of the module, and any information that should be known to developers before installing it. It is not required for your module to work correctly, but is often considered useful. The README file is considered special as it is unpacked and displayed by CPAN and other archives; it can be read by developers without downloading or examining the rest of the module. 
t/
    The t/ directory contains tests for your module. A good module has plenty of tests try and ensure the code is working correctly, and to catch any bugs before they reach production. You can learn more about testing by reading perldoc Test::Tutorial. 
lib/
    The lib/ directory houses your code. In our example, we would find the /lib/Acme/Example.pm file already created and with sample code and documentation in-place. If our distribution will contain many modules, they should also be added under the lib/ directory, and we should also ensure they are added to the MANIFEST file above. 

When creating any new module, it's highly recommended that you also use a revision control system, such as CVS or subversion. The use of a revision control system is recommended for all development work, not just Perl modules, and is an important part of the change management process.

@@@@@@@@@@@@@



FIRST RUN:

1. CREATE THE PACKAGE SKELETON


h2xs -b 5.6.0 -XA -n Bioptic::Admin


    -XA : omit the sections that would have been used if we were building our module on the top of existing C header files. As a pure Perl module, these are simply going to get in the way.
        
    -b : ensure backwards compatibility with Perl 5.6.0


ll

-rw-r--r-- 1 syoung bioinfo  162 Nov 11 14:32 Changes
-rw-r--r-- 1 syoung bioinfo   75 Nov 11 14:32 MANIFEST
-rw-r--r-- 1 syoung bioinfo  554 Nov 11 14:32 Makefile.PL
-rw-r--r-- 1 syoung bioinfo 1.2K Nov 11 14:32 README
drwxr-xr-x 4 syoung bioinfo  16K Nov 11 14:38 bin
drwxr-xr-x 4 syoung bioinfo  16K Nov 11 14:38 lib
drwxr-xr-x 2 syoung bioinfo  16K Nov 11 14:32 t


2. CHECK THE CONTENTS OF THE TEST FILE

cat t/Bioptic-Admin.t

#!/usr/bin/perl -w

use Test::More tests => 1;
BEGIN
{
    use_ok('Bioptic::Admin');
}



3. TEST INSTALL TO ANOTHER LOCATION

perl Makefile.PL PREFIX=`pwd`/installdir

make
make test
make install


THIS CREATES THE FOLLOWING FILE STRUCTURE:


installdir/

            lib/
                perl5/
                        site_perl/
                                5.8.8/
                                        Admin
                                                Workflow.pm
                                        Bioptic
                                                Admin.pm

            lib64/
                perl5/
                        site_perl/
                                5.8.8/
                                        x86_64-linux-thread-multi/
                                                                    auto/
                                                                        Bioptic/
                                                                                Admin/
            share/
                    man/
                        man3/                     
                            Bioptic::Admin.3pm



3. CREATE DISTRIBUTION FILE:

cd Bioptic-Admin

/usr/bin/perl "-MExtUtils::Manifest=manicopy,maniread" -e "manicopy(maniread(), 'Bioptic-Admin-0.0.1', 'best')";


LS    mkdir Bioptic::Admin-0.0.1
    mkdir Bioptic::Admin-0.0.1/t
    mkdir Bioptic::Admin-0.0.1/lib
    mkdir Bioptic::Admin-0.0.1/lib/Bioptic

    [syoung@zion Bioptic-Admin]$ ls
    Bioptic::Admin-0.0.1  MANIFEST  Makefile.PL  bin   installdir  pm_to_blib
    Changes               Makefile  README       blib  lib         t

    [syoung@zion Bioptic-Admin]$ ls Bioptic\:\:Admin-0.0.1/
    Changes  MANIFEST  Makefile.PL  README  lib  t


4. TAR UP MODULE

tar cvf Bioptic-Admin-0.0.1.tar Bioptic-Admin-0.0.1

    Bioptic-Admin-0.0.1/
    Bioptic-Admin-0.0.1/t/
    Bioptic-Admin-0.0.1/t/Bioptic-Admin.t
    Bioptic-Admin-0.0.1/MANIFEST
    Bioptic-Admin-0.0.1/lib/
    Bioptic-Admin-0.0.1/lib/Bioptic/
    Bioptic-Admin-0.0.1/lib/Bioptic/Admin.pm
    Bioptic-Admin-0.0.1/Changes
    Bioptic-Admin-0.0.1/README
    Bioptic-Admin-0.0.1/Makefile.PL
    Bioptic-Admin-0.0.1/Bioptic-Admin-0.0.1.tar


rm -fr Bioptic-Admin-0.0.1
gzip --best Bioptic-Admin-0.0.1.tar

ll

    -rw-r--r-- 1 syoung bioinfo 2.4K Nov 11 15:05 Bioptic-Admin-0.0.1.tar.gz
    -rw-r--r-- 1 syoung bioinfo  162 Nov 11 14:32 Changes
    -rw-r--r-- 1 syoung bioinfo   75 Nov 11 14:32 MANIFEST
    -rw-r--r-- 1 syoung bioinfo  23K Nov 11 14:40 Makefile
    -rw-r--r-- 1 syoung bioinfo  554 Nov 11 14:32 Makefile.PL
    -rw-r--r-- 1 syoung bioinfo 1.2K Nov 11 14:32 README
    drwxr-xr-x 4 syoung bioinfo  16K Nov 11 14:38 bin
    drwxr-xr-x 8 syoung bioinfo  16K Nov 11 14:40 blib
    drwxr-xr-x 5 syoung bioinfo  16K Nov 11 14:40 installdir
    drwxr-xr-x 4 syoung bioinfo  16K Nov 11 14:38 lib
    -rw-r--r-- 1 syoung bioinfo    0 Nov 11 14:40 pm_to_blib
    drwxr-xr-x 2 syoung bioinfo  16K Nov 11 14:32 t





 Create a Debian package ( deb ) from your new perl module

If we want to keep our system clean its always good idea to not to install any software from source code. The better approach is to create a installable package. This way allows clean uninstall of any packages. One way to create a Debian package from perl module is to use dh-make-perl Linux command. As a root run following command to install dh-make-perl:

apt-get install dh-make-perl

Once dh-make-perl is installed we are ready to build debian package from our perl module. Navigate to Mynew-Perlmodule directory:

cd Mynew-Perlmodule

and issue dh-make-perl command:

dh-make-perl . --build

At this point your module is ready in ../ from your current directory. now you may install your new Debian package with dpkg -i:

dpkg -i libmynew-perlmodule-perl_0.01-1_all.deb

Now you can start using you new Perl module.


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Sat Nov 8 23:13:35 EDT 2008
SPLIT CONTAINER STOPS BEING ADJUSTABLE IN FIREFOX


DIAGNOSIS:

http://turtle.dojotoolkit.org/pipermail/dojo-checkins/2008-August/046183.html
http://turtle.dojotoolkit.org/pipermail/dojo-checkins/2008-August/046366.html


In the SplitContainer code this line (and it's vertical counterpart):

var client = (e.layerX ? e.layerX : e.offsetX);

will try to set client as e.offsetX when e.layerX is 0 and in firefox,
there is no e.offsetX so it is undefined which leads to the splitter dying
and the cookie being set to NaN because integer - undefined = NaN

SOLUTION:

CHANGE:

var client = (e.layerX ? e.layerX : e.offsetX);

TO:

var client = (e.layerX ? e.layerX : (e.offsetX ? e.offsetX : 0));


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Mon Oct 27 14:43:35 EDT 2008
TREE DnD BROKEN IN dojo 1.2 SO TRIED USING dojo 0.43 INSTEAD FOR WORKFLOW CONSTRUCTION

http://download.dojotoolkit.org/

FIRST TEST:

http://localhost:8080/bioptic1/test/0.43/tree-2-tree-drag.html


RESULT:

NOT SATISFACTORY DUE TO LARGE AMOUNT OF CODE IF MAINTAINING TWO VERSIONS


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Fri Oct 24 12:16:39 EDT 2008
DOWNLOAD AND INSTALL komodo IDE 

ACCOUNT DETAILS

Sign on: www.activestate.com
User: ecruz3@med.miami.edu
Pass: bioinformatics



Download Komodo IDE 4.4.1 for Windows:
http://downloads.activestate.com/Komodo/releases/4.4.1/Komodo-IDE-4.4.1-20896.msi	
    

Licenses are available for these platforms:
    o Linux (x86)
    o Mac OS X (Intel)
    o Mac OS X (PowerPC)
    o Windows

Licenses

User: Camilo
License ID: S01AF4461B 
http://204.68.94.156/download/komodoIDE/Komodo_IDE_Windows_S01AF4461B.exe

User: Zhijie
License ID: SC67F092C7
http://204.68.94.156/download/komodoIDE/Komodo_IDE_Windows_SC67F092C7.exe


User: Stuart
License ID: S6852F1A7A 



DOWNLOADS ON devx

Camilo



+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Fri Oct 24 12:15:39 EDT 2008
DOWNLOAD AND INSTALL myeclipse 7 WITH LICENCE


1. Edit account email address and password by selecting the 'My Account' option from the top menu.

MyEclipse portal
http://www.myeclipseide.com/user.php

User: CCS_BFX
Pass: bioinformatics
Email: syoung@med.miami.edu


2. Download MyEclipse Enterprise Workbench 7.0.0 M2 (09/19/2008)

http://www.myeclipseide.com/Downloads-req-viewsdownload-sid-30.html


3. Install license

Click "Member Services" at bottom left for resend of license key.

        Subscriber Id:         CCS_BFX-UL2-EX2009-10-23
        Subscription Code:     PLR8ZC-855557-546578-6447891987

Enter activation information into MyEclipse:

Window->Preferences->MyEclipse->Subscription


</entry>

<entry [Thur Oct 23 22:38:36 EDT 2008] DOJO DEBUG MESSAGES>

http://dojotoolkit.org/book/dojo-book-0-4/part-2-out-box-dojo/development-and-debugging-tips/debugging-javascript

You can debug the old fashioned way (print statements in the code). There are three functions for this:

    * dojo.debug - prints a message
    * dojo.debugShallow - prints all the members in an object
    * dojo.debugDeep - opens new window w/tree showing structure of an object

Debugging output:

    * FireBug object - this will print debugging output to the Firebug console
    * DebugConsole - will capture all your debug messages in a floating pane.

Alternately, in djConfig, you can specify which element they are appended to by

providing an id of that element: i.e.:

var djConfig = {
isDebug: true,
debugContainerId : "dojoDebug"
};

and have a div
<div id="dojoDebug"></div> 


</entry>

<entry [Thur Oct 23 17:38:36 EDT 2008] dojo.body() has no properties>

GET THIS ERROR WHEN USING dijit.Menu:

        var menu = new dijit.Menu(
            {
                toggle:"toggle",
                contextMenuForWindow:"true"
            },
            document.createElement("div")
        );
        

POSSIBLE SOLUTION:

http://dojotoolkit.org/pipermail/dojo-interest/2006-July/013227.html

dojo.body() is only available after onLoad is fired



</entry>

<entry [Tues Oct 21 17:318:36 EDT 2008] BUILD AND TEST IN dojo>

http://oreilly.com/catalog/9780596516482/toc.html

BUILDING

For any production setting, minimizing the overall footprint of your JavaScript files and the number of synchronous requests to the server is absolutely essential. The difference in downloading scores of individual resource files via synchronous requests incurred by dojo.require versus one or two calls back to the server makes all the difference in the world in terms of a snappy page load.
Dojo's build tools makes accomplishing what may initially seem like such an arduous task quite easy. In a nutshell, the build tools automate the following tasks:

    *
      Consolidates multiple modules into a single JavaScript file called a layer
    *
      Interns template strings into JavaScript files, including layers, so that a standalone template is no longer needed
    *
      Applies ShrinkSafe, a JavaScript compressor based on Rhino, to minify the size of the layers by removing whitespace, linebreaks, comments, and shortening variable names
    *
      Copies all of the "built" files into a standalone directory that can be copied and deployed to a web server

One reason you may not have been aware of the build tools is that they aren't included in the util directory of an official release. To get them, you have to download a source release (a source release will have the -src suffix on the file base part of the filename) or just grab the source from the Subversion trunk. provides an overview of getting the Dojo from Subversion, but basically, all that is necessary is to point your client at the Dojo repository and wait for it to download everything, whether it is the trunk or a specific tag.
In either case, you'll find that the util directory now holds some additional directories; one of these directories is buildscripts, which contains the goods we're looking for.
http://svnbook.red-bean.com/ contains the unofficial Subversion book, which is available in a variety of formats. Taking a moment to bookmark this valuable resource now will save you time later.
To run the build tools, you'll have to have Java 1.4.2 or later installed, available from http://java.sun.com (because ShrinkSafe is based on Rhino, which is written in Java). But don't worry about having to be a Java programmer to use ShrinkSafe; ShrinkSafe comes packaged as a single 



TESTING


Automated testing practices for web applications are becoming increasingly common because of the sheer amount of coding and complexity involved in many of today's rich Internet applications. DOH uses Dojo internally but is not a Dojo-specific tool; like ShrinkSafe, you could use it to create unit tests for any JavaScript scripts, although no DOM manipulation or browser-specific functions will be available.
DOH provides three simple assertion constructs that go a long way toward automating your tests. Each of these assertions is provided via the global object, doh, exposed by the framework:

    *
      doh.assertEqual(expected, actual)
    *
      doh.assertTrue(condition)
    *
      doh.assertFalse(condition)

Before diving into some of the more complex things that you can do with DOH, take a look at trivial test harness that you can run from the command line via Rhino to get a better idea of exactly the kinds of things you could be doing with DOH. The harness below demonstrates the ability for DOH to run standalone tests via regular Function objects as well as via test fixtures. Test fixtures are little more than a way of surrounding a test with initialization and clean up.
Without further ado, here's that test harness. Note that the harness doesn't involve any Dojo specifics; it merely uses the doh object. In particular, the doh.register function is used in this example, where the first parameter specifies a module name (a JavaScript file located as a sibling of the util directory), and the second parameter provides a list of test functions and fixtures:

doh.register("testMe", [

    //test fixture that passes
    {
        name : "fooTest",
        setUp : function(  ) {},
        runTest : function(t) { t.assertTrue(1); },
        tearDown : function(  ) {}
    },
    //test fixture that fails
    {
        name : "barTest",
        setUp : function(  ) { this.bar="bar"},
        runTest : function(t) { t.assertEqual(this.bar, "b"+"a"+"rr"
); },
        tearDown : function(  ) {delete this.bar;}
    },
    //standalone function that passes
    function baz(  ) {doh.assertFalse(0)}

]);

Assuming this test harness were saved in a 


</entry>

<entry [Mon Oct 20 02:34:36 EDT 2008] TREE DRAG AND DROP AND MENUS>

SEE

C:\DATA\base\html\bioptic1\jslib\dijit\tests\tree





</entry>

<entry [Fri Oct 17 16:34:36 EDT 2008] JAVASCRIPT PLUGIN FRAMEWORK>


1) LOAD .js FILES

read about "FileSystemObject".

Find files with JavaScript
http://www.codeproject.com/jscript/search_in_files.asp

JScript FileSystemObject Object
http://ns7.webmasters.com/caspdoc/ht...ect_object.htm

Current Directory
http://javascript.internet.com/navig...directory.html

Scripting.FileSystemObject Examples
http://www.eggheadcafe.com/articles/20030627b.asp


</entry>

<entry [Fri Oct 10 15:04:36 EDT 2008] PIPELINE AND BIOPTIC TO DO>

1. pipeline bug - FIXED

2. pipelinepilot - license from Chris/Caty

3. Schemas for querying Ensemble/UCSC fast for SNPs, etc.

4. Plugin framework

5. UMLs - Netbeans has but no Javascript

6. FUNCTIONS:

    Search  - SNPs

    

</entry>

<entry [Wed Oct  8 18:22:42 EDT 2008] INSTALL JS/UML>


Installing JS/UML
Eclipse

Model Tree

    * JS/UML requires Eclipse version 3.3 or higher

Download

    * Download the distribution named "jsuml-eclipse" from the Downloads Page

Install

    *

      Do not unzip!
    *

      In Eclipse go to Help -> Software Updates -> Find and Install
    *

      Click "New Archived Site..." and choose the downloaded jsuml-eclipse file
    *

      Also select "Europa Discovery Site" as "Sites to include in search" and click "Finish"
    *

      For diagramming support, you will also need to add and select the Eclipse MDT update site: http://download.eclipse.org/modeling/mdt/updates/site.xml
    *

      When the feature selection dialog appears, select "JS/UML" and click "Select Required" if necessary to resolve required plugins (you may need to manually add the UML2Tools SDK)
    *

      Click Finish to install JS/UML and its dependencies

Verify Install

    *

      After installing JS/UML restart Eclipse
    *

      If the plugin is installed correctly it will appear in the list of plugins available from the Help menu -> About Eclipse Platform -> Plug-in Details
    *

      When everything is verified to be working, see the Quick Start guide

StatCounter - Free Web Tracker and Counter



INSTALL UML2 FOR UML DIAGRAM GENERATION






Cannot complete the request.  See the details.
Cannot find a solution satisfying the following requirements Match[requiredCapability: org.eclipse.equinox.p2.iu/org.eclipse.emf.validation/[1.1.1.v200708161445,1.1.1.v200708161445]].




SIMILAR EXAMPLE ON WEB:

org.eclipse.equinox.p2.iu/org.eclipse.mylyn_feature.feature.group/[3.0.1.v20080716-2200-e3x,3.1.0)]

This means a bundle is specifying a perfect version match of a an earlier
weekly build of the Task List.

The error message is misleading, it is purely Mylyn bundles that are causing the conflict.


SO INSTALLED eml (ECLIPSE MODELLING FRAMEWORK) THEN GOT THIS ERROR WHEN TRYING TO INSTALL UML2:

Cannot complete the request.  See the details.
XML Schema Infoset Model (XSD) - org.eclipse.xsd will be ignored because a newer version is already installed. 
Eclipse Modeling Framework (EMF) Runtime + End-User Tools will be ignored because a newer version is already installed. 
EMF Service Data Objects (SDO) - org.eclipse.emf.ecore.sdo will be ignored because a newer version is already installed. 

Cannot find a solution satisfying the following requirements Match[requiredCapability: org.eclipse.equinox.p2.iu/org.eclipse.ui.views.properties.tabbed/[3.4.0.I20080527-2000,3.4.0.I20080527-2000]].


SO INSTALLED ui.views.properties.tabbed



</entry>

<entry [Wed Oct  8 18:22:42 EDT 2008] INSTALL UML2 FOR UML DIAGRAM GENERATION>


Cannot complete the request.  See the details.
Cannot find a solution satisfying the following requirements Match[requiredCapability: org.eclipse.equinox.p2.iu/org.eclipse.emf.validation/[1.1.1.v200708161445,1.1.1.v200708161445]].



</entry>

<entry [Wed Oct  1 22:10:59 EDT 2008] DOWNLOAD myEclipse 7.0 FOR ADVANCED JS DEBUGGING>

http://www.myeclipseide.com/Downloads-req-viewsdownload-sid-30.html

MILESTONES

1. VIEW SHORT READS 

    1.1 gff2json.pl CONVERT GFF TO JSON - WORKING Fri Sep 26

    1.2 INTEGRATE prototype Ajax.request
    
        PROBLEM: SAME HOST RULE
        
        SOLUTION: RUN APACHE ON LAPTOP

        CLIENT
        http://localhost:8080/ajaxgbrowse2/index.html
        
        SERVER
        http://localhost:8080/cgi-bin/ajaxgbrowse2/sequence.cgi


    1.3 GET SHORT READ SEQUENCE

        ADAPT GenomeView.js TO CALL cgi-bin/ajaxgbrowse2/sequence.cgi

2. INTEGRATE proto.menu.js





</entry>

<entry [Fri Sep 26 14:15:39 EDT 2008] APHID GENOME DATA>

Buchnera aphidicola str. Mp_BTI

