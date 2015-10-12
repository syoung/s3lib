komodo


<entry [Mon 2014:02:24 02:04:42 EST] REGEX: CONVERT console.dir TO this.logDebug>

FROM
this.logDebug\("(.+): "\);\s*console.dir\(\{[^:]+:([^\}]+)\}\);
TO
this.logDebug("\1", \2);
	
</entry>
<entry [Thu 2013:12:12 12:25:42 EST] CONVERT print "... a: $a\n" TO logDebug(a, "a")>


print "\w+::\w+::\w+\s+(\w+)\s*:\s*\$(\w+)\n";


	
</entry>
<entry [Wed 2013:02:27 13:28:16 EST] REGEX REPLACE MULTIPLE MATCHES>

EXAMPLE:

/(ftp|http):\/\/old-domain\.(com|net|org)/\1://new-domain.\2/g

(ftp|http):\/\/old-domain\.(com|net|org)
/\1://new-domain.\2/g

TARGET
http://old-domain.com and ftp://old-domain.net

RESULT
http://new-domain.com and ftp://new-domain.net


WHAT WE WANT:

TARGET

method someMethod ($arg1, $arg2, $arg3, $arg4) {


RESULT

sub someMethod {
    my $self    =   shift;
    my $arg1    =   shift;
    my $arg2    =   shift;
    my $arg3    =   shift;


TRIES

method\s+(\w+)\s+\(.*([^\)^,]+)\)
method \1 {\n\tmy $\2\t=\tshift;\n

method someMethod ($arg1, $arg2, $arg3) 
	my $...	=	shift;
 {

method\s+(\w+)\s+\(([^\)^,^\s]+?)[,\s]?(.*?)\)\s*\{
method \1 (\2) {\n\tmy $\3\t=\tshift;\n

method someMethod ($) {
	my (arg1, $arg2, $arg3, $...)	=	shift;


method\s+(\w+)\s+\((\$[^,]+)[,\s]*(\$.+)?\)\s*\{
method \1 (\3) {\n\tmy \2\t=\tshift;\n

method someMethod ($arg2, $arg3, $arg4) {
	my $arg1	=	shift;

method someMethod ($arg3, $arg4) {
	my $arg2	=	shift;

	my $arg1	=	shift;


**** SOLVED ****
method\s+(\w+)\s+\((\$.+)\s*,\s*(\$[^,]+)\)\s*\{
method \1 (\2) {\n\tmy \3\t=\tshift;


method someMethod ($arg1, $arg2, $arg3) {
	my $arg4	=	shift;

method someMethod ($arg1, $arg2) {
	my $arg3	=	shift;
	my $arg4	=	shift;

method someMethod ($arg1) {
	my $arg2	=	shift;
	my $arg3	=	shift;
	my $arg4	=	shift;


**** SINGLE CASE ****

method\s+(\w+)\s+\(\s*(\$.+)\s*\)\s*\{
method \1 {\n\tmy \2\t=\tshift;

TARGET
method someMethod ($arg1) {
	my $arg2	=	shift;
	my $arg3	=	shift;
	my $arg4	=	shift;

RESULT
method someMethod {
	my $arg1	=	shift;
	my $arg2	=	shift;
	my $arg3	=	shift;
	my $arg4	=	shift;

    
    
**** LAST REPLACE ****

method\s+(\w+)\s*{
sub \1 {\n\tmy $self\t\t=\tshift;


TARGET
method someMethod {

RESULT
sub someMethod {
    my $self        =   shift;

</entry>
<entry [Sun 2013:01:06 20:20:04 EST] ADD NEW FILE TYPE TO BE INCLUDED IN SEARCHES>

Preferences -> File Associations --> View and Edit Associations

New Association:    *.tsv
Type:               text

    
</entry>
<entry [Sat 2011:12:10 13:47:25 EST] REGEX: REPLACE print WITH logger>

CNTL+Q

komodo.assertMacroVersion(3);
if (komodo.view) { komodo.view.setFocus(); }
komodo.view.selection = '$self->logger("");';
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
    
</entry>
<entry [Sat 2011:11:19 17:34:54 EST] REGEX: REPLACE FOR logError>

CNTL+E

MACRO:

    // Macro recorded on: Tue Nov 29 2011 03:56:23 GMT-0500 (CST)
    komodo.assertMacroVersion(3);
    if (komodo.view) { komodo.view.setFocus(); }
    Find_ReplaceAllInMacro(window, 1, 'print\\s*"\\s*\\{\\s*error\\s*:\\s*\'(.+)\'\\s*\\}\\s*(\\\\n)?\\s*"', '$self->logger("\\1")', true, 2, 1, false, false);

SOURCE:

	#### SANITY CHECK
	print "{ error: 'Agua::Common::Version::upgrade    username not defined' }" and exit if not defined $username ;
	print "{error : 'Agua::Common::Version::upgrade    version not defined' }" and exit if not defined $version ;


TARGET:

	#### SANITY CHECK
	$self->logError("username not defined") and exit if not defined $username ;
	$self->logError("version not defined") and exit if not defined $version ;


REGEX:

print "{\s*error\s*:\s*'(\S+::\S+\s+)?([^\}]+)'\s*\}"

$self->logError("\2")

    
</entry>
<entry [Sun 2011:07:24 01:57:00 EST] REGEX: EXCLUDE WITH ?!, FIND SUBS WITH sub|package >

GET ALL SUBROUTINES
^[ 	]*?(sub\s+\w+|package\s+\w)

EXCLUDE A WORD FROM A SEARCH
Agua\.(?!cookie|toolbar)

    
</entry>
<entry [Sun 2011:04:24 22:17:59 EST] USE ssh-agent WITH KOMODO TO CONNECT TO REMOTE USING KEY FILES>

http://docs.activestate.com/komodo/5.2/files.html#files_public_key_auth
USE ssh-add TO ADD A KEY TO ssh-agent:


START ssh-agent

exec ssh-agent /usr/bin/bash

TERMINAL WILL DISAPPEAR. OPEN ANOTHER AND DO:

ssh-add -l

    The agent has no identities.

ADD KEYS:
ssh-add ~/.ssh/id_dsa
    Identity added: /home/syoung/.ssh/id_rsa (/home/syoung/.ssh/id_rsa

ssh-add /home/syoung/22-agua/cloud/AWS/keypair/jgilbert/aquarius



NOTES
-----

http://linuxindetails.wordpress.com/2010/06/07/could-not-open-a-connection-to-your-authentication-agent/

To start it : exec ssh-agent /usr/bin/bash
If you do not use exec, you will get the following error message :

Could not open a connection to your authentication agent

To add your DSA identity to your authentication agent :

ssh-add ~/.ssh/id_dsa
Type your passphrase once and then, you will not need to type it anymore. You will be able to connect to servers where you have uploaded your public key.
This solution works only for your current xterm. If you open a new xterm session, you will have to type your passphrase.


http://www.openbsd.org/cgi-bin/man.cgi?query=ssh-agent

     ssh-add -l displays the identities currently held by the agent.

     The agent initially does not have any private keys.  Keys are added using
     ssh-add(1).  When executed without arguments, ssh-add(1) adds the files
     ~/.ssh/id_rsa, ~/.ssh/id_dsa, ~/.ssh/id_ecdsa and ~/.ssh/identity.  If
     the identity has a passphrase, ssh-add(1) asks for the passphrase on the
     terminal if it has one or from a small X11 program if running under X11.
     If neither of these is the case then the authentication will fail.  It
     then sends the identity to the agent.  Several identities can be stored
     in the agent; the agent can automatically use any of these identities.

</entry>
<entry [Tue 2011:04:05 12:03:25 EST] CREATED KOMODO SETTINGS git REPOSITORY>
    

see apps.git.xsl
    [Tue 2011:04:05 12:03:25 EST]
    CREATED KOMODO SETTINGS git REPOSITORY
    

</entry>

<entry [Thu 2011:03:03 13:21:09 EST] UPDATED LOG 'G' MACRO>
    
    
NB: USE getCalendarDate() AND getClockTime() TO UPDATE TIME ON PAGE

KOMODO MACRO:


// Macro recorded on: Thu Feb 17 2011 12:34:38 GMT-0500 (EST)
komodo.assertMacroVersion(3);
if (komodo.view) { komodo.view.setFocus(); }

var now = new Date();
function formatDate(date, fmt) {
    function pad(value) {
        return (value.toString().length < 2) ? '0' + value : value;
    }
    return fmt.replace(/%([a-zA-Z])/g, function (_, fmtCode) {

var myDays=
["Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun"];

        switch (fmtCode) {
        case 'D':
            return myDays[date.getDay()];    
        case 'Y':
            return date.getFullYear();
        case 'M':
            return pad(date.getMonth() + 1);
        case 'd':
            return pad(date.getDate());
        case 'H':
            return pad(date.getHours());
        case 'm':
            return pad(date.getMinutes());
        case 's':
            return pad(date.getSeconds());
        default:
            throw new Error('Unsupported format code: ' + fmtCode);
        }
    });
}
var datetime = formatDate(now, "%D %Y:%M:%d %H:%m:%s");

komodo.view.selection = '< entry [' + datetime + ' EST] >';
ko.commands.doCommand('cmd_newline')
ko.commands.doCommand('cmd_newline')
ko.commands.doCommand('cmd_newline')
ko.commands.doCommand('cmd_backSmart')
komodo.view.selection = '< /entry >';
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')
ko.commands.doCommand('cmd_left')

</entry>

<entry [] MACRO TO MINIMIZE THE 'FIND RESULTS' TAB>


// Macro recorded on: Tue Feb 22 2011 17:11:33 GMT-0500 (EST)
komodo.assertMacroVersion(3);
if (komodo.view) { komodo.view.setFocus(); }

function closeBottomPane() {
    ko.commands.doCommand('cmd_viewBottomPane')
}
ko.run.runEncodedCommand(window, 'sleep 2', closeBottomPane);

//if(document.getElementById('bottom_pane').expanded) {
//    ko.commands.doCommand('cmd_viewBottomPane')
//}



if(document.getElementById('project_toolbox_area').collapsed) {
    ko.commands.doCommand('cmd_viewBottomPane')
    alert("Done.");
}



KOMODO JAVASCRIPT API
http://docs.activestate.com/komodo/4.4/komodo-js-api.html

ko.run.output

The interface for using the run output window (where run command output goes
to, in the bottom pane of the Komodo workspace).

Expected usage:
- Someone calls ko.run.output.initialize() at startup and ko.run.output.finalize() at
shutdown.
- When a command is to be run in the output window do this:
* announce intention to start session
ko.run.output.startSession(...);
*... setup and start running the actual command calling
*    ko.run.output.getTerminal() and ko.run.output.show() as needed
ko.run.output.setProcessHandle(p);   * to allow user to kill process
*... setup ko.run.output.endSession() to be run when the process
*    terminates.

BOTTOM PANE IS CALLED:

main Komodo SCC output panel



Creating a view object

There is no global object in Python macros to get the current "view" (i.e. the main active Komodo tab) because this can change during macro execution. Instead, a view object can be created in the macro at the point where it will be used. For example:

viewSvc = components.classes["@activestate.com/koViewService;1"]\
    .getService(components.interfaces.koIViewService)
view = viewSvc.currentView.queryInterface(components.interfaces.koIScintillaView)
The view object will have the same properties as ko.views.manager.currentView, exposing:

The scimoz object for manipulation of code buffers.
The document object for manipulation of documents in memory.
The document.file object, corresponding to files on disk.




Running Macros in the Background

Macros that invoke and do not affect the current file should be run in the background to minimize interference with Komodo responsiveness. Macros that run in the background are run in threads (Python), or in a timeout (JavaScript). To set this option:

Right-click the macro in the Toolbox and select Properties.
Select the Run in Background option.
Click Apply.
If a macro is not associated with a Komodo event, it can run either in the foreground or in the background.

Macros that perform "editor" functions or modify open files should always run in the foreground to "block" and prevent user interference. This prevents the user from moving the cursor and disrupting the macro currently in progress.

Specifying Macro Triggers

Macros can be configured to execute on certain Komodo events. When an event occurs (for example, a file is opened in Komodo), the macro is triggered.

Check to make sure macro triggers are enabled in the Projects and Workspace preferences. In the Triggering Macros area, select Enable triggering of macros on Komodo events, and then click OK.

To add a trigger to a macro:

Select the Triggers tab on the Macro Properties dialog
Select the Macro should trigger on a Komodo event check box.
Choose one of the following triggers:
On startup (occurs at the end of the Komodo startup process)
After file open
Before file save (see Macro Return Values below)
After file save
Before file close (see Macro Return Values below)
After file close
On shutdown (see Macro Return Values below)
On a system notification
Set the Rank (optional): Enter a numerical rank for the macro. For example, if three macros all invoke "After a file is opened", a macro executes first (100), second (101), or third (102). The default is 100 to provide room for macros to run before the default (1-99). Note that if two macros trigger on the same event with the same rank, both execute in indeterminate order.
Click Apply.
Trigger Macro subject Variable    
    
</entry>


<entry [Thu Feb 17 12:07:06 EST 2011] SET FILE SIZE THRESHOLD FOR 'Large file encountered' TRIP>

EDITED

~/software/komodo/Komodo-Edit-6/lib/support/prefs.xml

AS FOLLOWS:
<!--
 <!-- changed to 100M, 2M lines -->
  < long id="documentByteCountThreshold" >100000000< /long > < !-- 1 MB -- >
  < long id="documentLineCountThreshold" >2000000< /long > < !-- 800 KB -- >
  < long id="documentLineLengthThreshold" >32000< /long >
  < boolean id="donotask_treat_large_documents_as_text" >0< /boolean >

-->

1. CREATE MACRO FILE

o add a macro:

Toolbox--> |Add|New Macro... or Project|Add|New Macro.... Alternatively, use the Add buttons within the Project or Toolbox sidebars, or right-click a project or folder name and select Add|New Macro....
Language: Specify the language (Python or JavaScript) in which to program the macro.
Set any desired macro properties.
Write the macro in the editor field or save what you have so far by clicking OK. You can open it in an editor tab by right-clicking on the macro icon and selecting Edit Macro. This is useful as it provides autocompletion and other Komodo editing features.


var gprefs = Components.classes["@activestate.com/koPrefService;1"].
  getService(Components.interfaces.koIPrefService).prefs;
gprefs.setLongPref("documentByteCountThreshold",
                   20 * gprefs.getLongPref("documentByteCountThreshold"));
gprefs.setLongPref("documentLineCountThreshold",
                   20 * gprefs.getLongPref("documentLineCountThreshold"));
// No reason to change "documentLineLengthThreshold"




NOTES
-----

CREATING MACROS
http://docs.activestate.com/komodo/5.2/macros.html#macros_top

DETAILED HOW TO WRITE MACROS
http://docs.activestate.com/komodo/5.2/macroapi.html#macroapi_top

MACRO SCRIPT
http://community.activestate.com/forum/problem-so-called-large-files


This was a new feature added in v5
ericp | Thu, 2010-03-25 10:07

We've found that the code analysis Komodo routinely does when it
loads a file causes sluggishness when files reach certain sizes.
Since Komodo is primarily used for editing source code, we chose
limits that are unlikely to be found in typical source code.

For example, most programmers prefer to work with files that have
fewer than 3,000 lines (and I'm sure some people reading this are
going to say "way fewer!"). If you allow for an average of 50 bytes/line,
that's 150K of code, an order of magnitude less than the character
count when Komodo switches into text mode.

We also count lines (switching to text mode at 20,000 lines) and
maximum line-length (with a 32K limit). These limits are
implemented with unexposed preferences which you can manipulate
with a macro like this:


var gprefs = Components.classes["@activestate.com/koPrefService;1"].
  getService(Components.interfaces.koIPrefService).prefs;
gprefs.setLongPref("documentByteCountThreshold",
                   10 * gprefs.getLongPref("documentByteCountThreshold"));
gprefs.setLongPref("documentLineCountThreshold",
                   10 * gprefs.getLongPref("documentLineCountThreshold"));
// No reason to change "documentLineLengthThreshold"



</entry>

<entry [Sun Oct  3 01:09:51 EDT 2010] FIX KOMODO TOOLBOX>


LOCATION OF TOOLBOX:

E:\software\backup\backups\komodo\100106\5.1\.komodotools


USE 'FIND' TO REPLACE IN ALL FILES IN THE TOOLBOX DIRECTORY THIS TERM:

komodo.assertMacroVersion(2)

... WITH THIS:

komodo.assertMacroVersion(3)
</entry>
