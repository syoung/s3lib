confluence.archive.1


<entry [Thu Jun 17 16:58:00 EDT 2010] ENABLE PAGETREE PLUGIN BY EDITING PAGE LAYOUT IN CONFLUENCE ADMIN --> LAYOUTS>

Hi Caty,

Could you please edit the page layout on the new NGS Production wiki to enable the Pagetree plugin?

I think its:

Confluence admin -> Look and Feel -> Layouts -> Edit Page Layout (under Content Layouts)

<!--

By replacing this:

         <div class="wiki-content">
            $body
         </div>


with this:

#if ($action.isPrintableVersion() == false)
<style>
.spacetree * ul{
padding-left:0px;
margin-left: 0px;
}
.spacetree * li{
margin-left: 5px;
padding-left:5px;
}

</style>

<table cellspacing="2" cellpadding="5">
<tr>
<td valign="top" align="left" width="22%" bgcolor="#F9F9F9" class="noprint">
<div class="tabletitle">Table of Contents</div>
<div class="spacetree">
#includePage($helper.spaceKey "TreeNavigation")
</div>
</td>
<td valign="top" align="left" width="78%" class="pagecontent">
<div class="wiki-content">
$body
</div>
</td>
</tr>
</table>
#else
<div class="wiki-content">
    $body
</div>
#end


-->
Cheers,

Stuart




FULL CUSTOM PAGE LAYOUT:
-----------------------

<!--## PAGE SPECIFIC DECORATOR
## Here the context is the page. Modes are 'view', 'edit', 'edit-preview', 'view-information', and 'view-attachments'.

#set ($helper = $params.get("helper"))
#set ($mode = $params.get("mode"))
#set ($context = $params.get("context"))
#set ($confPage = $helper.page)

#infoPanelInitFromParams()
## GENERAL PAGE DECORATING BEGINS

#requireResourcesForContext("page")

#if ($mode != "edit" && $mode != "edit-preview")
    #parse ("/decorators/includes/content-navigation.vm")
#end

#if ($infoPanelRequired)
<content tag="sidebar">
    #infoPanel(true true true true)
</content>
#end

<div id="content" class="page $!mode">
    #parse ("/template/includes/actionerrors.vm")

    ## MODE SPECIFIC DECORATING BEGINS
    #*
        Display page based on mode: currently 'view', 'edit', 'preview-edit', 'info' and 'attachments.
        See the individual page templates (viewpage.vm, editpage.vm, etc.) for the setting of the mode parameter.
    *#
    ## VIEW

    #if ($mode == "view")
        #if ($space.personal)
            #set ($usernameFromSpaceKey = $spaceUtils.getUsernameFromPersonalSpaceKey($spaceKey))
            #if ($permissionHelper.canView($action.remoteUser, $action.getUser($usernameFromSpaceKey)))
                <content tag="show-personal-sidebar">true</content>
            #end
        #end

        #requireResourcesForContext("viewcontent")

        #set ($labelable = $page)
        #permitSearchEngines()

        #if ($helper.isHistoricalVersion())
            <content tag="suppressPdfLink">true</content>
        #end

        #parse ("/decorators/includes/page-metadata.vm")
        #if ($helper.isHistoricalVersion() || $helper.action.navigatingVersions)
            #versionInfo()
        #end





#if ($action.isPrintableVersion() == false)
<style>
.spacetree * ul{
padding-left:0px;
margin-left: 0px;
}
.spacetree * li{
margin-left: 5px;
padding-left:5px;
}

</style>

<table cellspacing="2" cellpadding="5">
<tr>
<td valign="top" align="left" width="22%" bgcolor="#F9F9F9" class="noprint">
<div class="tabletitle">Table of Contents</div>
<div class="spacetree">
#includePage($helper.spaceKey "TreeNavigation")
</div>
</td>
<td valign="top" align="left" width="78%" class="pagecontent">
<div class="wiki-content">
$body
</div>
</td>
</tr>
</table>
#else
<div class="wiki-content">
    $body
</div>
#end







        #trackbackRdf ($trackbackUtils.getContentIdentifier($page) $page.title $trackbackUtils.getPingUrl($page))

        #parse ("/labels/labels-editor.vm")

        #renderChildren()

        #applyDecorator("root")
            #decoratorParam("sitemeshPage" $sitemeshPage)
            #decoratorParam("page" $page)
            #decoratorParam("context" "comments")
        #end

    ## EDIT || PREVIEW-EDIT
    #elseif ($mode == "edit" || $mode == "edit-preview")
        $body

    ## INFO
    #elseif ($mode == "view-information")
        $body

    ## ATTACHMENTS
    #elseif ($mode == "view-attachments" || $mode == "move-attachments")
        $body

    ## FOR CUSTOM WEB-ITEMS
    #else
        $body

    #end
    ## MODE SPECIFIC DECORATING ENDS

</div>

## GENERAL PAGE DECORATING ENDS

#parse ("/pages/page-breadcrumbs.vm")
#menuMacros_renderBrowseMenu()


-->


DEFAULT PAGE LAYOUT:
--------------------

<!--

## PAGE SPECIFIC DECORATOR
## Here the context is the page. Modes are 'view', 'edit', 'edit-preview', 'view-information', and 'view-attachments'.

#set ($helper = $params.get("helper"))
#set ($mode = $params.get("mode"))
#set ($context = $params.get("context"))
#set ($confPage = $helper.page)

#infoPanelInitFromParams()
## GENERAL PAGE DECORATING BEGINS

#requireResourcesForContext("page")

#if ($mode != "edit" && $mode != "edit-preview")
     #parse ("/decorators/includes/content-navigation.vm")
#end

#if ($infoPanelRequired)
<content tag="sidebar">
     #infoPanel(true true true true)
</content>
#end

<div id="content" class="page $!mode">
     #parse ("/template/includes/actionerrors.vm")

     ## MODE SPECIFIC DECORATING BEGINS
     #*
         Display page based on mode: currently 'view', 'edit', 'preview-edit', 'info' and 'attachments.
         See the individual page templates (viewpage.vm, editpage.vm, etc.) for the setting of the mode parameter.
     *#
     ## VIEW

     #if ($mode == "view")
         #if ($space.personal)
             #set ($usernameFromSpaceKey = $spaceUtils.getUsernameFromPersonalSpaceKey($spaceKey))
             #if ($permissionHelper.canView($action.remoteUser, $action.getUser($usernameFromSpaceKey)))
                 <content tag="show-personal-sidebar">true</content>
             #end
         #end

         #requireResourcesForContext("viewcontent")

         #set ($labelable = $page)
         #permitSearchEngines()

         #if ($helper.isHistoricalVersion())
             <content tag="suppressPdfLink">true</content>
         #end

         #parse ("/decorators/includes/page-metadata.vm")
         #if ($helper.isHistoricalVersion() || $helper.action.navigatingVersions)
             #versionInfo()
         #end

         <div class="wiki-content">
            $body
         </div>

         #trackbackRdf ($trackbackUtils.getContentIdentifier($page) $page.title $trackbackUtils.getPingUrl($page))

         #parse ("/labels/labels-editor.vm")

         #renderChildren()

         #applyDecorator("root")
             #decoratorParam("sitemeshPage" $sitemeshPage)
             #decoratorParam("page" $page)
             #decoratorParam("context" "comments")
         #end

     ## EDIT || PREVIEW-EDIT
     #elseif ($mode == "edit" || $mode == "edit-preview")
         $body

     ## INFO
     #elseif ($mode == "view-information")
         $body

     ## ATTACHMENTS
     #elseif ($mode == "view-attachments" || $mode == "move-attachments")
         $body

     ## FOR CUSTOM WEB-ITEMS
     #else
         $body

     #end
     ## MODE SPECIFIC DECORATING ENDS

</div>

## GENERAL PAGE DECORATING ENDS

#parse ("/pages/page-breadcrumbs.vm")
#menuMacros_renderBrowseMenu()


-->

</entry>
<entry [Sun Mar 14 01:17:45 EST 2010] INSTALLED UWC PLUGIN BUT GOT 'missing an atlassian-plugin.xml file'>
   
https://plugins.atlassian.com/server/1.0/download/pluginVersion/18372


BUT SEEMS TO WORK OKAY:

Confluence Admin -> Administration -> Import from Another Wiki


MOVIE
http://downloads.atlassian.com/videos/uwc2/uwc3/uwc-demo-v46.mov



OTHER WAY:


Space Admin -> Import Pages From Disc



</entry>



<entry [Thu Feb 11 01:47:00 EST 2010] ADDED STYLESHEET TO AGUA AND TRIED THEME PLUGINS - INTRANET, TECH BLOG AND ADAPTIVIST BUILDE >




WINNER WAS INTRANET PLUGIN BECAUSE OF NICE DROPDOWNS INSTEAD OF LEFT MENU BUT VERY SLOW...





/* HIDE PAGE METADATA */
.page-metadata {
    display: none;
    visibility: hidden;
}

/* PAGETREE SEARCH */
#pagetreesearch {
	font-family: Verdana;
	-moz-background-clip:border;
	-moz-background-inline-policy:continuous;
	-moz-background-origin:padding;
	-moz-border-radius-bottomleft:8pt;
	-moz-border-radius-bottomright:8pt;
	-moz-border-radius-topleft:8pt;
	-moz-border-radius-topright:8pt;

	background:#FFFFFF none repeat scroll 0 0;
	border: 2px solid #CCCCCC;
	cursor: default;
}

/* PAGETREE */
.plugin_pagetree ul li {
	font-family: Verdana;
	-moz-background-clip:border;
	-moz-background-inline-policy:continuous;
	-moz-background-origin:padding;
	-moz-border-radius-bottomleft:4pt;
	-moz-border-radius-bottomright:4pt;
	-moz-border-radius-topleft:4pt;
	-moz-border-radius-topright:4pt;

	background:#EEE none repeat scroll 0 0;
	border: 1px solid #CCCCCC;
	cursor: default;
}

/* CONTAINER STYLE */
#navigation, #tab-navigation{
border-bottom: 1px solid #CCC;
background-color: transparent;
margin: 1em 0 2em -5px;
}


/* TAB STYLE */
.tab-navigation .tab a {
font-weight: normal;
color: #999999;
background-color: transparent;
border: none;
}

/* TAB HOVER STYLE */
.tab-navigation .tab a:hover {
font-weight: normal;
color: #0088CC;
background-color: transparent;
border: none;
}

/*Currently Selected Element Style */
ul.tab-navigation .current a:hover, ul.tab-navigation .current a {
color:#000000;
background-color: transparent;
border:none;
}



body {
font-family: Verdana;
font-size: 12px;
}
.wiki-content,
.wiki-content p,
.wiki-content table,
.wiki-content tr,
.wiki-content td,
.wiki-content th,
.wiki-content ol,
.wiki-content ul,
.wiki-content li {
font-size: 14px;
}



</entry>



<entry [Thurs Feb 11 22:59:23 EST 2010] INSTALLED 'COPY SPACE' PLUGIN>



SEE ALSO Notes-hardware-linode.txt

https://studio.plugins.atlassian.com/wiki/display/CPSP/Confluence+Copy+Space+Plugin


AND COPIED KBCS PTA SITE TO AGUA WITHOUT MISHAP



</entry>



<entry [Thurs Feb 11 22:59:22 EST 2010] SET TO START AT BOOT>





I've got an init script but its not listed in chkconfig

Ok, backing up a little bit chkconfig will only start if there is an available init script(automated service startup script) to start from. If you have this init file listed in /etc/init.d/ you only need to run two commands to get it running at boot:

# chkconfig --config example
# chkconfig example on



SET UP A CONFLUENCE USER AND RUN SERVICE AS THIS USER
http://confluence.atlassian.com/pages/viewpage.action?pageId=183148


DIDN'T WORK

@reboot /etc/init.d/confluence start
====================================

crontab -e

ADD:

@reboot /etc/init.d/confluence start



/Cheers

@reboot /etc/init.d/confluence start

/etc/init.d/confluence




I'm running Ubuntu Hardy (cat /etc/issue gives "Ubuntu 8.04.3 LTS \n \l") and I am also having a lot of problems running Confluence at startup.

I have installed Confluence on the turnkeylinux postgres virtual appliance (root is the default user). I need to have Confluence running on port 80 and hence I simply run as root.

However, after having followed the guide above, Confluence refuses to run on system startup. The logs are not even touched on system boot (but they are written to when I shut down, meaning that it works when I shut down the system.). If I invoke e.g. "/etc/rc2.d/S93confluence start" directly then confluence starts up and the logs are written to. So it seems like this command is not even invokes upon system startup? -- It doesn't even work if I add "/etc/init.d/confluence" to /etc/rc.local.

Should I do anything special if I want to run confluence as root upon startup? In my /etc/init.d/confluence script I just run "$CATALINA_HOME/bin/startup.sh" in my start() function and "$CATALINA_HOME/bin/shutdown.sh" in the stop() function, that is, I have uncommented the user check and do not use the RUN_AS_USER variable. (I figure that they are run as root per default?)

For now I am just running confluence on system startup using cron. - Did this by starting "crontab -e" and adding the line "@reboot /etc/init.d/confluence start". It works, but is far from optimal, so I anyone have any input on the situation, I would appreciate it alot. :-)

/Cheers



rc.local
========

A typical file used is rc.local. As this starts Apache as root, it is recommended to properly configure your security and authentication before adding this call.

You can also configure the httpd service to start up at boot time, using an initscript utility, such as /sbin/chkconfig, /usr/sbin/ntsysv, or the Services Configuration Tool program.



</entry>



<entry [Wed Feb 10 22:58:22 EST 2010] INSTALLED PLUGIN Content Formatting Macros>



REQUIRED FOR 


Content Formatting Macros



</entry>



<entry [Mon Oct 12 02:48:35 EDT 2009] EVALUATION COPY DETAILS>



ADD CSS:

Administration
Look and Feel
Global Styleshee



ACCESS:

user: admin
pass: adminaccess



Your Atlassian Account Information?
From: 	Atlassian Sales (sales@atlassian.com)
	Medium riskYou may not know this sender.Mark as safe|Mark as junk
Sent: 	Sun 10/11/09 10:46 PM
To: 	youngstuart@hotmail.com (youngstuart@hotmail.com)

Hi Stuart,
 
As requested, we have reset your password to Atlassian.com. Your new account information is:
 
Email:		youngstuart@hotmail.com
Password:	U4h5Ns
 
Please note that your password is case sensitive. We recommend copying and pasting the password directly into the password field when prompted.
	
You can change your password, download your Atlassian software, licenses, quotes and invoices at:
 
    http://my.atlassian.com
 
Thank you for your interest in Atlassian and our products.
 
Cheers,
Your mates at Atlassian
--
ATLASSIAN - We're hiring (a lot). Tell a friend, earn some cash. | http://atlassian.com/32
http://www.atlassian.com
sales@atlassian.com
+1 415 701 1110 (San Francisco, USA)
+61 2 9262 1443 (Sydney, Australia)
+31 20 796 0060 (Amsterdam, Netherlands)



+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Mon Nov  24 21:07:10 EDT 2008


http://blog.kenweiner.com/2008/11/personal-hosted-confluence-wiki-for.html

Coming soon to this post: Setting up a mail server and using Groovy and XML-RPC to perform a daily backup of your confluence data.
Posted 


</entry>
<entry [Mon Nov  24 21:07:10 EDT 2008] Genomics Workbench (CLC Bio) PAGE ON ZION CONFLUENCE>

h1. Genomics Workbench (CLC Bio)

How to import and view .ace files produced by the pipeline (eland2ace.pl and elandpaired2ace.pl) with Genomics Workbench.

h3. 1. Download Genomics Workbench from here:

[http://204.68.94.156/download/CLCGenomicsWorkbench_2_1.exe]

To install Genomics Workbench, click on the .exe and follow the steps. When it asks you for a licence, click the option that allows you to download an evaluation licence. If you have any trouble starting in on Windows, use a text editor to alter the file:
{code}
clcgenomicswb2.vmoptions
{code}
inside the folder:
{code}
C:\Program files\CLC Genomics Workbench2
{code}
to read:
{code}
-Xmx1000m
{code}
and try restarting. If still no luck try reducing the 1000m value to 800m, 700m etc.
\\

h3. 2. Download some sample .ace files, e.g.:

[http://204.68.94.156/download/s_6_1_sorted.distant.ace]
[http://204.68.94.156/download/s_6_1_sorted.paired.ace]
[http://204.68.94.156/download/s_6_1_sorted.paired-chimaera.ace]
[http://204.68.94.156/download/s_6_1_sorted.paired-noref.ace]
[http://204.68.94.156/download/s_6_1_sorted.unpaired.ace]
[http://204.68.94.156/download/s_7_1_sorted.distant.ace]
[http://204.68.94.156/download/s_7_1_sorted.paired.ace]
[http://204.68.94.156/download/s_7_1_sorted.paired-noref.ace]
[http://204.68.94.156/download/s_7_1_sorted.unpaired.ace]
[http://204.68.94.156/download/s_8_1_sorted.distant.ace]
[http://204.68.94.156/download/s_8_1_sorted.paired.ace]
[http://204.68.94.156/download/s_8_1_sorted.paired-noref.ace]
[http://204.68.94.156/download/s_8_1_sorted.paired-short.ace]
[http://204.68.94.156/download/s_8_1_sorted.unpaired.ace]

h3. 3. Start up Genomics Workbench and create a new folder (e.g., 'mtDNA') in the Navigation Area on the left.


h3. 4. 'Import' (top row) the .ace files into the 'mtDNA' folder. To view the coverage, right click on an .ace file and select 'Show' \--> 'Contig'.


h3. 5. To save the image, zoom out (top right) as far as you can, and take a screen print (hit the 'Prt Sc' button on Windows or Cntl+Alt+Shift+4.

</entry>
<entry [Mon Oct  6 14:42:10 EDT 2008] REMOVED ANNOYING 'Help tips' SECTION AT TOP OF EDIT PAGE>

EDITED decorators/page.vmd PAGE AND COMMENTED OUT 'infoPanel(true true true true)'

FROM

#if ($infoPanelRequired)
 <div id="sidebar">
     infoPanel(true true true true)
 </div>
#end

TO:
 
#if ($infoPanelRequired)
 <div id="sidebar">

 </div>
#end




</entry>



<entry [Mon Sep 15 07:53:21 EDT 2008] INSTALL TreePlugin FOR LEFT NAVIGATION BAR>



http://confluence.atlassian.com/display/DOC/Adding+a+Navigation+Sidebar


PROBLEM:

INSTRUCTIONS:

# Make sure the Confluence Default theme is selected from the 'Themes' menu.

# Click 'Layout' under the 'Look and Feel' section.
'Layout' is only displayed if you are a Confluence Site Administrator.

# Click 'Create Custom' under the 'Page Layout' section.



BUT CLICKING 'Layout' GIVES THIS ERROR:

    "You can not customise the site look and feel while a theme is active. You must first disable currently configured theme."


SOLUTION:

MANUALLY EDITED THE FILE 

# pages/rendered-content.vm 
decorators/page.vmd

AS FOLLOWS:

REPLACED THIS CODE:
# In the layout, find this code:

<div class="wiki-content">
$body
</div>

WITH THIS CODE:
# Replace the above code block with this code:

#if ($action.isPrintableVersion() == false)
<style>
.spacetree * ul{
padding-left:0px;
margin-left: 0px;
}
.spacetree * li{
margin-left: 5px;
padding-left:5px;
}

</style>

<table cellspacing="2" cellpadding="5">
<tr>
<td valign="top" align="left" width="22%" bgcolor="#F9F9F9" class="noprint">
<div class="tabletitle">Table of Contents</div>
<div class="spacetree">
#includePage($helper.spaceKey "TreeNavigation")
</div>
</td>
<td valign="top" align="left" width="78%" class="pagecontent">
<div class="wiki-content">
$body
</div>
</td>
</tr>
</table>
#else
<div class="wiki-content">
    $body
</div>
#end


</entry>



<entry [Sun Sep 14 21:06:35 EDT 2008] DOWNLOAD AND INSTALL confluence>

1. INSTALL JAVA



2. DOWNLOAD AND UNZIP confluence

http://www.atlassian.com/software/confluence/

DOWNLOADED  confluence-2.9.1-std.tar.gz

UNZIPPED HERE:

/home/syoung/base/apps/confluence


3. EDIT confluence-init.properties FILE

emacs /home/syoung/base/apps/confluence/confluence/WEB-INF/classes/confluence-init.properties


4. BROWSE TO:

http://zion.ccs.miami.edu:8080


5. START THE SERVER:

export JRE_HOME=/home/syoung/base/apps/jdk

$ ./startup.sh 

    If you encounter issues starting up Confluence Standalone, please see the 
    Installation guide at http://confluence.atlassian.com/display/DOC/Confluence+Installation+Guide
    Using CATALINA_BASE:   /home/syoung/base/apps/confluence
    Using CATALINA_HOME:   /home/syoung/base/apps/confluence
    Using CATALINA_TMPDIR: /home/syoung/base/apps/confluence/temp
    Using JRE_HOME:       /home/syoung/base/apps/jdk


</entry>